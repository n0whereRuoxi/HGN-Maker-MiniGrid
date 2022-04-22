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
      ?auto_464941 - BLOCK
    )
    :vars
    (
      ?auto_464942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464941 ?auto_464942 ) ( CLEAR ?auto_464941 ) ( HAND-EMPTY ) ( not ( = ?auto_464941 ?auto_464942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_464941 ?auto_464942 )
      ( !PUTDOWN ?auto_464941 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_464948 - BLOCK
      ?auto_464949 - BLOCK
    )
    :vars
    (
      ?auto_464950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_464948 ) ( ON ?auto_464949 ?auto_464950 ) ( CLEAR ?auto_464949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_464948 ) ( not ( = ?auto_464948 ?auto_464949 ) ) ( not ( = ?auto_464948 ?auto_464950 ) ) ( not ( = ?auto_464949 ?auto_464950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_464949 ?auto_464950 )
      ( !STACK ?auto_464949 ?auto_464948 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_464958 - BLOCK
      ?auto_464959 - BLOCK
    )
    :vars
    (
      ?auto_464960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464959 ?auto_464960 ) ( not ( = ?auto_464958 ?auto_464959 ) ) ( not ( = ?auto_464958 ?auto_464960 ) ) ( not ( = ?auto_464959 ?auto_464960 ) ) ( ON ?auto_464958 ?auto_464959 ) ( CLEAR ?auto_464958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_464958 )
      ( MAKE-2PILE ?auto_464958 ?auto_464959 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_464969 - BLOCK
      ?auto_464970 - BLOCK
      ?auto_464971 - BLOCK
    )
    :vars
    (
      ?auto_464972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_464970 ) ( ON ?auto_464971 ?auto_464972 ) ( CLEAR ?auto_464971 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_464969 ) ( ON ?auto_464970 ?auto_464969 ) ( not ( = ?auto_464969 ?auto_464970 ) ) ( not ( = ?auto_464969 ?auto_464971 ) ) ( not ( = ?auto_464969 ?auto_464972 ) ) ( not ( = ?auto_464970 ?auto_464971 ) ) ( not ( = ?auto_464970 ?auto_464972 ) ) ( not ( = ?auto_464971 ?auto_464972 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_464971 ?auto_464972 )
      ( !STACK ?auto_464971 ?auto_464970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_464983 - BLOCK
      ?auto_464984 - BLOCK
      ?auto_464985 - BLOCK
    )
    :vars
    (
      ?auto_464986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464985 ?auto_464986 ) ( ON-TABLE ?auto_464983 ) ( not ( = ?auto_464983 ?auto_464984 ) ) ( not ( = ?auto_464983 ?auto_464985 ) ) ( not ( = ?auto_464983 ?auto_464986 ) ) ( not ( = ?auto_464984 ?auto_464985 ) ) ( not ( = ?auto_464984 ?auto_464986 ) ) ( not ( = ?auto_464985 ?auto_464986 ) ) ( CLEAR ?auto_464983 ) ( ON ?auto_464984 ?auto_464985 ) ( CLEAR ?auto_464984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_464983 ?auto_464984 )
      ( MAKE-3PILE ?auto_464983 ?auto_464984 ?auto_464985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_464997 - BLOCK
      ?auto_464998 - BLOCK
      ?auto_464999 - BLOCK
    )
    :vars
    (
      ?auto_465000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_464999 ?auto_465000 ) ( not ( = ?auto_464997 ?auto_464998 ) ) ( not ( = ?auto_464997 ?auto_464999 ) ) ( not ( = ?auto_464997 ?auto_465000 ) ) ( not ( = ?auto_464998 ?auto_464999 ) ) ( not ( = ?auto_464998 ?auto_465000 ) ) ( not ( = ?auto_464999 ?auto_465000 ) ) ( ON ?auto_464998 ?auto_464999 ) ( ON ?auto_464997 ?auto_464998 ) ( CLEAR ?auto_464997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_464997 )
      ( MAKE-3PILE ?auto_464997 ?auto_464998 ?auto_464999 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_465012 - BLOCK
      ?auto_465013 - BLOCK
      ?auto_465014 - BLOCK
      ?auto_465015 - BLOCK
    )
    :vars
    (
      ?auto_465016 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_465014 ) ( ON ?auto_465015 ?auto_465016 ) ( CLEAR ?auto_465015 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_465012 ) ( ON ?auto_465013 ?auto_465012 ) ( ON ?auto_465014 ?auto_465013 ) ( not ( = ?auto_465012 ?auto_465013 ) ) ( not ( = ?auto_465012 ?auto_465014 ) ) ( not ( = ?auto_465012 ?auto_465015 ) ) ( not ( = ?auto_465012 ?auto_465016 ) ) ( not ( = ?auto_465013 ?auto_465014 ) ) ( not ( = ?auto_465013 ?auto_465015 ) ) ( not ( = ?auto_465013 ?auto_465016 ) ) ( not ( = ?auto_465014 ?auto_465015 ) ) ( not ( = ?auto_465014 ?auto_465016 ) ) ( not ( = ?auto_465015 ?auto_465016 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_465015 ?auto_465016 )
      ( !STACK ?auto_465015 ?auto_465014 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_465030 - BLOCK
      ?auto_465031 - BLOCK
      ?auto_465032 - BLOCK
      ?auto_465033 - BLOCK
    )
    :vars
    (
      ?auto_465034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465033 ?auto_465034 ) ( ON-TABLE ?auto_465030 ) ( ON ?auto_465031 ?auto_465030 ) ( not ( = ?auto_465030 ?auto_465031 ) ) ( not ( = ?auto_465030 ?auto_465032 ) ) ( not ( = ?auto_465030 ?auto_465033 ) ) ( not ( = ?auto_465030 ?auto_465034 ) ) ( not ( = ?auto_465031 ?auto_465032 ) ) ( not ( = ?auto_465031 ?auto_465033 ) ) ( not ( = ?auto_465031 ?auto_465034 ) ) ( not ( = ?auto_465032 ?auto_465033 ) ) ( not ( = ?auto_465032 ?auto_465034 ) ) ( not ( = ?auto_465033 ?auto_465034 ) ) ( CLEAR ?auto_465031 ) ( ON ?auto_465032 ?auto_465033 ) ( CLEAR ?auto_465032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_465030 ?auto_465031 ?auto_465032 )
      ( MAKE-4PILE ?auto_465030 ?auto_465031 ?auto_465032 ?auto_465033 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_465048 - BLOCK
      ?auto_465049 - BLOCK
      ?auto_465050 - BLOCK
      ?auto_465051 - BLOCK
    )
    :vars
    (
      ?auto_465052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465051 ?auto_465052 ) ( ON-TABLE ?auto_465048 ) ( not ( = ?auto_465048 ?auto_465049 ) ) ( not ( = ?auto_465048 ?auto_465050 ) ) ( not ( = ?auto_465048 ?auto_465051 ) ) ( not ( = ?auto_465048 ?auto_465052 ) ) ( not ( = ?auto_465049 ?auto_465050 ) ) ( not ( = ?auto_465049 ?auto_465051 ) ) ( not ( = ?auto_465049 ?auto_465052 ) ) ( not ( = ?auto_465050 ?auto_465051 ) ) ( not ( = ?auto_465050 ?auto_465052 ) ) ( not ( = ?auto_465051 ?auto_465052 ) ) ( ON ?auto_465050 ?auto_465051 ) ( CLEAR ?auto_465048 ) ( ON ?auto_465049 ?auto_465050 ) ( CLEAR ?auto_465049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_465048 ?auto_465049 )
      ( MAKE-4PILE ?auto_465048 ?auto_465049 ?auto_465050 ?auto_465051 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_465066 - BLOCK
      ?auto_465067 - BLOCK
      ?auto_465068 - BLOCK
      ?auto_465069 - BLOCK
    )
    :vars
    (
      ?auto_465070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465069 ?auto_465070 ) ( not ( = ?auto_465066 ?auto_465067 ) ) ( not ( = ?auto_465066 ?auto_465068 ) ) ( not ( = ?auto_465066 ?auto_465069 ) ) ( not ( = ?auto_465066 ?auto_465070 ) ) ( not ( = ?auto_465067 ?auto_465068 ) ) ( not ( = ?auto_465067 ?auto_465069 ) ) ( not ( = ?auto_465067 ?auto_465070 ) ) ( not ( = ?auto_465068 ?auto_465069 ) ) ( not ( = ?auto_465068 ?auto_465070 ) ) ( not ( = ?auto_465069 ?auto_465070 ) ) ( ON ?auto_465068 ?auto_465069 ) ( ON ?auto_465067 ?auto_465068 ) ( ON ?auto_465066 ?auto_465067 ) ( CLEAR ?auto_465066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_465066 )
      ( MAKE-4PILE ?auto_465066 ?auto_465067 ?auto_465068 ?auto_465069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_465085 - BLOCK
      ?auto_465086 - BLOCK
      ?auto_465087 - BLOCK
      ?auto_465088 - BLOCK
      ?auto_465089 - BLOCK
    )
    :vars
    (
      ?auto_465090 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_465088 ) ( ON ?auto_465089 ?auto_465090 ) ( CLEAR ?auto_465089 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_465085 ) ( ON ?auto_465086 ?auto_465085 ) ( ON ?auto_465087 ?auto_465086 ) ( ON ?auto_465088 ?auto_465087 ) ( not ( = ?auto_465085 ?auto_465086 ) ) ( not ( = ?auto_465085 ?auto_465087 ) ) ( not ( = ?auto_465085 ?auto_465088 ) ) ( not ( = ?auto_465085 ?auto_465089 ) ) ( not ( = ?auto_465085 ?auto_465090 ) ) ( not ( = ?auto_465086 ?auto_465087 ) ) ( not ( = ?auto_465086 ?auto_465088 ) ) ( not ( = ?auto_465086 ?auto_465089 ) ) ( not ( = ?auto_465086 ?auto_465090 ) ) ( not ( = ?auto_465087 ?auto_465088 ) ) ( not ( = ?auto_465087 ?auto_465089 ) ) ( not ( = ?auto_465087 ?auto_465090 ) ) ( not ( = ?auto_465088 ?auto_465089 ) ) ( not ( = ?auto_465088 ?auto_465090 ) ) ( not ( = ?auto_465089 ?auto_465090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_465089 ?auto_465090 )
      ( !STACK ?auto_465089 ?auto_465088 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_465107 - BLOCK
      ?auto_465108 - BLOCK
      ?auto_465109 - BLOCK
      ?auto_465110 - BLOCK
      ?auto_465111 - BLOCK
    )
    :vars
    (
      ?auto_465112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465111 ?auto_465112 ) ( ON-TABLE ?auto_465107 ) ( ON ?auto_465108 ?auto_465107 ) ( ON ?auto_465109 ?auto_465108 ) ( not ( = ?auto_465107 ?auto_465108 ) ) ( not ( = ?auto_465107 ?auto_465109 ) ) ( not ( = ?auto_465107 ?auto_465110 ) ) ( not ( = ?auto_465107 ?auto_465111 ) ) ( not ( = ?auto_465107 ?auto_465112 ) ) ( not ( = ?auto_465108 ?auto_465109 ) ) ( not ( = ?auto_465108 ?auto_465110 ) ) ( not ( = ?auto_465108 ?auto_465111 ) ) ( not ( = ?auto_465108 ?auto_465112 ) ) ( not ( = ?auto_465109 ?auto_465110 ) ) ( not ( = ?auto_465109 ?auto_465111 ) ) ( not ( = ?auto_465109 ?auto_465112 ) ) ( not ( = ?auto_465110 ?auto_465111 ) ) ( not ( = ?auto_465110 ?auto_465112 ) ) ( not ( = ?auto_465111 ?auto_465112 ) ) ( CLEAR ?auto_465109 ) ( ON ?auto_465110 ?auto_465111 ) ( CLEAR ?auto_465110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_465107 ?auto_465108 ?auto_465109 ?auto_465110 )
      ( MAKE-5PILE ?auto_465107 ?auto_465108 ?auto_465109 ?auto_465110 ?auto_465111 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_465129 - BLOCK
      ?auto_465130 - BLOCK
      ?auto_465131 - BLOCK
      ?auto_465132 - BLOCK
      ?auto_465133 - BLOCK
    )
    :vars
    (
      ?auto_465134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465133 ?auto_465134 ) ( ON-TABLE ?auto_465129 ) ( ON ?auto_465130 ?auto_465129 ) ( not ( = ?auto_465129 ?auto_465130 ) ) ( not ( = ?auto_465129 ?auto_465131 ) ) ( not ( = ?auto_465129 ?auto_465132 ) ) ( not ( = ?auto_465129 ?auto_465133 ) ) ( not ( = ?auto_465129 ?auto_465134 ) ) ( not ( = ?auto_465130 ?auto_465131 ) ) ( not ( = ?auto_465130 ?auto_465132 ) ) ( not ( = ?auto_465130 ?auto_465133 ) ) ( not ( = ?auto_465130 ?auto_465134 ) ) ( not ( = ?auto_465131 ?auto_465132 ) ) ( not ( = ?auto_465131 ?auto_465133 ) ) ( not ( = ?auto_465131 ?auto_465134 ) ) ( not ( = ?auto_465132 ?auto_465133 ) ) ( not ( = ?auto_465132 ?auto_465134 ) ) ( not ( = ?auto_465133 ?auto_465134 ) ) ( ON ?auto_465132 ?auto_465133 ) ( CLEAR ?auto_465130 ) ( ON ?auto_465131 ?auto_465132 ) ( CLEAR ?auto_465131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_465129 ?auto_465130 ?auto_465131 )
      ( MAKE-5PILE ?auto_465129 ?auto_465130 ?auto_465131 ?auto_465132 ?auto_465133 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_465151 - BLOCK
      ?auto_465152 - BLOCK
      ?auto_465153 - BLOCK
      ?auto_465154 - BLOCK
      ?auto_465155 - BLOCK
    )
    :vars
    (
      ?auto_465156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465155 ?auto_465156 ) ( ON-TABLE ?auto_465151 ) ( not ( = ?auto_465151 ?auto_465152 ) ) ( not ( = ?auto_465151 ?auto_465153 ) ) ( not ( = ?auto_465151 ?auto_465154 ) ) ( not ( = ?auto_465151 ?auto_465155 ) ) ( not ( = ?auto_465151 ?auto_465156 ) ) ( not ( = ?auto_465152 ?auto_465153 ) ) ( not ( = ?auto_465152 ?auto_465154 ) ) ( not ( = ?auto_465152 ?auto_465155 ) ) ( not ( = ?auto_465152 ?auto_465156 ) ) ( not ( = ?auto_465153 ?auto_465154 ) ) ( not ( = ?auto_465153 ?auto_465155 ) ) ( not ( = ?auto_465153 ?auto_465156 ) ) ( not ( = ?auto_465154 ?auto_465155 ) ) ( not ( = ?auto_465154 ?auto_465156 ) ) ( not ( = ?auto_465155 ?auto_465156 ) ) ( ON ?auto_465154 ?auto_465155 ) ( ON ?auto_465153 ?auto_465154 ) ( CLEAR ?auto_465151 ) ( ON ?auto_465152 ?auto_465153 ) ( CLEAR ?auto_465152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_465151 ?auto_465152 )
      ( MAKE-5PILE ?auto_465151 ?auto_465152 ?auto_465153 ?auto_465154 ?auto_465155 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_465173 - BLOCK
      ?auto_465174 - BLOCK
      ?auto_465175 - BLOCK
      ?auto_465176 - BLOCK
      ?auto_465177 - BLOCK
    )
    :vars
    (
      ?auto_465178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465177 ?auto_465178 ) ( not ( = ?auto_465173 ?auto_465174 ) ) ( not ( = ?auto_465173 ?auto_465175 ) ) ( not ( = ?auto_465173 ?auto_465176 ) ) ( not ( = ?auto_465173 ?auto_465177 ) ) ( not ( = ?auto_465173 ?auto_465178 ) ) ( not ( = ?auto_465174 ?auto_465175 ) ) ( not ( = ?auto_465174 ?auto_465176 ) ) ( not ( = ?auto_465174 ?auto_465177 ) ) ( not ( = ?auto_465174 ?auto_465178 ) ) ( not ( = ?auto_465175 ?auto_465176 ) ) ( not ( = ?auto_465175 ?auto_465177 ) ) ( not ( = ?auto_465175 ?auto_465178 ) ) ( not ( = ?auto_465176 ?auto_465177 ) ) ( not ( = ?auto_465176 ?auto_465178 ) ) ( not ( = ?auto_465177 ?auto_465178 ) ) ( ON ?auto_465176 ?auto_465177 ) ( ON ?auto_465175 ?auto_465176 ) ( ON ?auto_465174 ?auto_465175 ) ( ON ?auto_465173 ?auto_465174 ) ( CLEAR ?auto_465173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_465173 )
      ( MAKE-5PILE ?auto_465173 ?auto_465174 ?auto_465175 ?auto_465176 ?auto_465177 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_465196 - BLOCK
      ?auto_465197 - BLOCK
      ?auto_465198 - BLOCK
      ?auto_465199 - BLOCK
      ?auto_465200 - BLOCK
      ?auto_465201 - BLOCK
    )
    :vars
    (
      ?auto_465202 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_465200 ) ( ON ?auto_465201 ?auto_465202 ) ( CLEAR ?auto_465201 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_465196 ) ( ON ?auto_465197 ?auto_465196 ) ( ON ?auto_465198 ?auto_465197 ) ( ON ?auto_465199 ?auto_465198 ) ( ON ?auto_465200 ?auto_465199 ) ( not ( = ?auto_465196 ?auto_465197 ) ) ( not ( = ?auto_465196 ?auto_465198 ) ) ( not ( = ?auto_465196 ?auto_465199 ) ) ( not ( = ?auto_465196 ?auto_465200 ) ) ( not ( = ?auto_465196 ?auto_465201 ) ) ( not ( = ?auto_465196 ?auto_465202 ) ) ( not ( = ?auto_465197 ?auto_465198 ) ) ( not ( = ?auto_465197 ?auto_465199 ) ) ( not ( = ?auto_465197 ?auto_465200 ) ) ( not ( = ?auto_465197 ?auto_465201 ) ) ( not ( = ?auto_465197 ?auto_465202 ) ) ( not ( = ?auto_465198 ?auto_465199 ) ) ( not ( = ?auto_465198 ?auto_465200 ) ) ( not ( = ?auto_465198 ?auto_465201 ) ) ( not ( = ?auto_465198 ?auto_465202 ) ) ( not ( = ?auto_465199 ?auto_465200 ) ) ( not ( = ?auto_465199 ?auto_465201 ) ) ( not ( = ?auto_465199 ?auto_465202 ) ) ( not ( = ?auto_465200 ?auto_465201 ) ) ( not ( = ?auto_465200 ?auto_465202 ) ) ( not ( = ?auto_465201 ?auto_465202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_465201 ?auto_465202 )
      ( !STACK ?auto_465201 ?auto_465200 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_465222 - BLOCK
      ?auto_465223 - BLOCK
      ?auto_465224 - BLOCK
      ?auto_465225 - BLOCK
      ?auto_465226 - BLOCK
      ?auto_465227 - BLOCK
    )
    :vars
    (
      ?auto_465228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465227 ?auto_465228 ) ( ON-TABLE ?auto_465222 ) ( ON ?auto_465223 ?auto_465222 ) ( ON ?auto_465224 ?auto_465223 ) ( ON ?auto_465225 ?auto_465224 ) ( not ( = ?auto_465222 ?auto_465223 ) ) ( not ( = ?auto_465222 ?auto_465224 ) ) ( not ( = ?auto_465222 ?auto_465225 ) ) ( not ( = ?auto_465222 ?auto_465226 ) ) ( not ( = ?auto_465222 ?auto_465227 ) ) ( not ( = ?auto_465222 ?auto_465228 ) ) ( not ( = ?auto_465223 ?auto_465224 ) ) ( not ( = ?auto_465223 ?auto_465225 ) ) ( not ( = ?auto_465223 ?auto_465226 ) ) ( not ( = ?auto_465223 ?auto_465227 ) ) ( not ( = ?auto_465223 ?auto_465228 ) ) ( not ( = ?auto_465224 ?auto_465225 ) ) ( not ( = ?auto_465224 ?auto_465226 ) ) ( not ( = ?auto_465224 ?auto_465227 ) ) ( not ( = ?auto_465224 ?auto_465228 ) ) ( not ( = ?auto_465225 ?auto_465226 ) ) ( not ( = ?auto_465225 ?auto_465227 ) ) ( not ( = ?auto_465225 ?auto_465228 ) ) ( not ( = ?auto_465226 ?auto_465227 ) ) ( not ( = ?auto_465226 ?auto_465228 ) ) ( not ( = ?auto_465227 ?auto_465228 ) ) ( CLEAR ?auto_465225 ) ( ON ?auto_465226 ?auto_465227 ) ( CLEAR ?auto_465226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_465222 ?auto_465223 ?auto_465224 ?auto_465225 ?auto_465226 )
      ( MAKE-6PILE ?auto_465222 ?auto_465223 ?auto_465224 ?auto_465225 ?auto_465226 ?auto_465227 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_465248 - BLOCK
      ?auto_465249 - BLOCK
      ?auto_465250 - BLOCK
      ?auto_465251 - BLOCK
      ?auto_465252 - BLOCK
      ?auto_465253 - BLOCK
    )
    :vars
    (
      ?auto_465254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465253 ?auto_465254 ) ( ON-TABLE ?auto_465248 ) ( ON ?auto_465249 ?auto_465248 ) ( ON ?auto_465250 ?auto_465249 ) ( not ( = ?auto_465248 ?auto_465249 ) ) ( not ( = ?auto_465248 ?auto_465250 ) ) ( not ( = ?auto_465248 ?auto_465251 ) ) ( not ( = ?auto_465248 ?auto_465252 ) ) ( not ( = ?auto_465248 ?auto_465253 ) ) ( not ( = ?auto_465248 ?auto_465254 ) ) ( not ( = ?auto_465249 ?auto_465250 ) ) ( not ( = ?auto_465249 ?auto_465251 ) ) ( not ( = ?auto_465249 ?auto_465252 ) ) ( not ( = ?auto_465249 ?auto_465253 ) ) ( not ( = ?auto_465249 ?auto_465254 ) ) ( not ( = ?auto_465250 ?auto_465251 ) ) ( not ( = ?auto_465250 ?auto_465252 ) ) ( not ( = ?auto_465250 ?auto_465253 ) ) ( not ( = ?auto_465250 ?auto_465254 ) ) ( not ( = ?auto_465251 ?auto_465252 ) ) ( not ( = ?auto_465251 ?auto_465253 ) ) ( not ( = ?auto_465251 ?auto_465254 ) ) ( not ( = ?auto_465252 ?auto_465253 ) ) ( not ( = ?auto_465252 ?auto_465254 ) ) ( not ( = ?auto_465253 ?auto_465254 ) ) ( ON ?auto_465252 ?auto_465253 ) ( CLEAR ?auto_465250 ) ( ON ?auto_465251 ?auto_465252 ) ( CLEAR ?auto_465251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_465248 ?auto_465249 ?auto_465250 ?auto_465251 )
      ( MAKE-6PILE ?auto_465248 ?auto_465249 ?auto_465250 ?auto_465251 ?auto_465252 ?auto_465253 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_465274 - BLOCK
      ?auto_465275 - BLOCK
      ?auto_465276 - BLOCK
      ?auto_465277 - BLOCK
      ?auto_465278 - BLOCK
      ?auto_465279 - BLOCK
    )
    :vars
    (
      ?auto_465280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465279 ?auto_465280 ) ( ON-TABLE ?auto_465274 ) ( ON ?auto_465275 ?auto_465274 ) ( not ( = ?auto_465274 ?auto_465275 ) ) ( not ( = ?auto_465274 ?auto_465276 ) ) ( not ( = ?auto_465274 ?auto_465277 ) ) ( not ( = ?auto_465274 ?auto_465278 ) ) ( not ( = ?auto_465274 ?auto_465279 ) ) ( not ( = ?auto_465274 ?auto_465280 ) ) ( not ( = ?auto_465275 ?auto_465276 ) ) ( not ( = ?auto_465275 ?auto_465277 ) ) ( not ( = ?auto_465275 ?auto_465278 ) ) ( not ( = ?auto_465275 ?auto_465279 ) ) ( not ( = ?auto_465275 ?auto_465280 ) ) ( not ( = ?auto_465276 ?auto_465277 ) ) ( not ( = ?auto_465276 ?auto_465278 ) ) ( not ( = ?auto_465276 ?auto_465279 ) ) ( not ( = ?auto_465276 ?auto_465280 ) ) ( not ( = ?auto_465277 ?auto_465278 ) ) ( not ( = ?auto_465277 ?auto_465279 ) ) ( not ( = ?auto_465277 ?auto_465280 ) ) ( not ( = ?auto_465278 ?auto_465279 ) ) ( not ( = ?auto_465278 ?auto_465280 ) ) ( not ( = ?auto_465279 ?auto_465280 ) ) ( ON ?auto_465278 ?auto_465279 ) ( ON ?auto_465277 ?auto_465278 ) ( CLEAR ?auto_465275 ) ( ON ?auto_465276 ?auto_465277 ) ( CLEAR ?auto_465276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_465274 ?auto_465275 ?auto_465276 )
      ( MAKE-6PILE ?auto_465274 ?auto_465275 ?auto_465276 ?auto_465277 ?auto_465278 ?auto_465279 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_465300 - BLOCK
      ?auto_465301 - BLOCK
      ?auto_465302 - BLOCK
      ?auto_465303 - BLOCK
      ?auto_465304 - BLOCK
      ?auto_465305 - BLOCK
    )
    :vars
    (
      ?auto_465306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465305 ?auto_465306 ) ( ON-TABLE ?auto_465300 ) ( not ( = ?auto_465300 ?auto_465301 ) ) ( not ( = ?auto_465300 ?auto_465302 ) ) ( not ( = ?auto_465300 ?auto_465303 ) ) ( not ( = ?auto_465300 ?auto_465304 ) ) ( not ( = ?auto_465300 ?auto_465305 ) ) ( not ( = ?auto_465300 ?auto_465306 ) ) ( not ( = ?auto_465301 ?auto_465302 ) ) ( not ( = ?auto_465301 ?auto_465303 ) ) ( not ( = ?auto_465301 ?auto_465304 ) ) ( not ( = ?auto_465301 ?auto_465305 ) ) ( not ( = ?auto_465301 ?auto_465306 ) ) ( not ( = ?auto_465302 ?auto_465303 ) ) ( not ( = ?auto_465302 ?auto_465304 ) ) ( not ( = ?auto_465302 ?auto_465305 ) ) ( not ( = ?auto_465302 ?auto_465306 ) ) ( not ( = ?auto_465303 ?auto_465304 ) ) ( not ( = ?auto_465303 ?auto_465305 ) ) ( not ( = ?auto_465303 ?auto_465306 ) ) ( not ( = ?auto_465304 ?auto_465305 ) ) ( not ( = ?auto_465304 ?auto_465306 ) ) ( not ( = ?auto_465305 ?auto_465306 ) ) ( ON ?auto_465304 ?auto_465305 ) ( ON ?auto_465303 ?auto_465304 ) ( ON ?auto_465302 ?auto_465303 ) ( CLEAR ?auto_465300 ) ( ON ?auto_465301 ?auto_465302 ) ( CLEAR ?auto_465301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_465300 ?auto_465301 )
      ( MAKE-6PILE ?auto_465300 ?auto_465301 ?auto_465302 ?auto_465303 ?auto_465304 ?auto_465305 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_465326 - BLOCK
      ?auto_465327 - BLOCK
      ?auto_465328 - BLOCK
      ?auto_465329 - BLOCK
      ?auto_465330 - BLOCK
      ?auto_465331 - BLOCK
    )
    :vars
    (
      ?auto_465332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465331 ?auto_465332 ) ( not ( = ?auto_465326 ?auto_465327 ) ) ( not ( = ?auto_465326 ?auto_465328 ) ) ( not ( = ?auto_465326 ?auto_465329 ) ) ( not ( = ?auto_465326 ?auto_465330 ) ) ( not ( = ?auto_465326 ?auto_465331 ) ) ( not ( = ?auto_465326 ?auto_465332 ) ) ( not ( = ?auto_465327 ?auto_465328 ) ) ( not ( = ?auto_465327 ?auto_465329 ) ) ( not ( = ?auto_465327 ?auto_465330 ) ) ( not ( = ?auto_465327 ?auto_465331 ) ) ( not ( = ?auto_465327 ?auto_465332 ) ) ( not ( = ?auto_465328 ?auto_465329 ) ) ( not ( = ?auto_465328 ?auto_465330 ) ) ( not ( = ?auto_465328 ?auto_465331 ) ) ( not ( = ?auto_465328 ?auto_465332 ) ) ( not ( = ?auto_465329 ?auto_465330 ) ) ( not ( = ?auto_465329 ?auto_465331 ) ) ( not ( = ?auto_465329 ?auto_465332 ) ) ( not ( = ?auto_465330 ?auto_465331 ) ) ( not ( = ?auto_465330 ?auto_465332 ) ) ( not ( = ?auto_465331 ?auto_465332 ) ) ( ON ?auto_465330 ?auto_465331 ) ( ON ?auto_465329 ?auto_465330 ) ( ON ?auto_465328 ?auto_465329 ) ( ON ?auto_465327 ?auto_465328 ) ( ON ?auto_465326 ?auto_465327 ) ( CLEAR ?auto_465326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_465326 )
      ( MAKE-6PILE ?auto_465326 ?auto_465327 ?auto_465328 ?auto_465329 ?auto_465330 ?auto_465331 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_465353 - BLOCK
      ?auto_465354 - BLOCK
      ?auto_465355 - BLOCK
      ?auto_465356 - BLOCK
      ?auto_465357 - BLOCK
      ?auto_465358 - BLOCK
      ?auto_465359 - BLOCK
    )
    :vars
    (
      ?auto_465360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_465358 ) ( ON ?auto_465359 ?auto_465360 ) ( CLEAR ?auto_465359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_465353 ) ( ON ?auto_465354 ?auto_465353 ) ( ON ?auto_465355 ?auto_465354 ) ( ON ?auto_465356 ?auto_465355 ) ( ON ?auto_465357 ?auto_465356 ) ( ON ?auto_465358 ?auto_465357 ) ( not ( = ?auto_465353 ?auto_465354 ) ) ( not ( = ?auto_465353 ?auto_465355 ) ) ( not ( = ?auto_465353 ?auto_465356 ) ) ( not ( = ?auto_465353 ?auto_465357 ) ) ( not ( = ?auto_465353 ?auto_465358 ) ) ( not ( = ?auto_465353 ?auto_465359 ) ) ( not ( = ?auto_465353 ?auto_465360 ) ) ( not ( = ?auto_465354 ?auto_465355 ) ) ( not ( = ?auto_465354 ?auto_465356 ) ) ( not ( = ?auto_465354 ?auto_465357 ) ) ( not ( = ?auto_465354 ?auto_465358 ) ) ( not ( = ?auto_465354 ?auto_465359 ) ) ( not ( = ?auto_465354 ?auto_465360 ) ) ( not ( = ?auto_465355 ?auto_465356 ) ) ( not ( = ?auto_465355 ?auto_465357 ) ) ( not ( = ?auto_465355 ?auto_465358 ) ) ( not ( = ?auto_465355 ?auto_465359 ) ) ( not ( = ?auto_465355 ?auto_465360 ) ) ( not ( = ?auto_465356 ?auto_465357 ) ) ( not ( = ?auto_465356 ?auto_465358 ) ) ( not ( = ?auto_465356 ?auto_465359 ) ) ( not ( = ?auto_465356 ?auto_465360 ) ) ( not ( = ?auto_465357 ?auto_465358 ) ) ( not ( = ?auto_465357 ?auto_465359 ) ) ( not ( = ?auto_465357 ?auto_465360 ) ) ( not ( = ?auto_465358 ?auto_465359 ) ) ( not ( = ?auto_465358 ?auto_465360 ) ) ( not ( = ?auto_465359 ?auto_465360 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_465359 ?auto_465360 )
      ( !STACK ?auto_465359 ?auto_465358 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_465383 - BLOCK
      ?auto_465384 - BLOCK
      ?auto_465385 - BLOCK
      ?auto_465386 - BLOCK
      ?auto_465387 - BLOCK
      ?auto_465388 - BLOCK
      ?auto_465389 - BLOCK
    )
    :vars
    (
      ?auto_465390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465389 ?auto_465390 ) ( ON-TABLE ?auto_465383 ) ( ON ?auto_465384 ?auto_465383 ) ( ON ?auto_465385 ?auto_465384 ) ( ON ?auto_465386 ?auto_465385 ) ( ON ?auto_465387 ?auto_465386 ) ( not ( = ?auto_465383 ?auto_465384 ) ) ( not ( = ?auto_465383 ?auto_465385 ) ) ( not ( = ?auto_465383 ?auto_465386 ) ) ( not ( = ?auto_465383 ?auto_465387 ) ) ( not ( = ?auto_465383 ?auto_465388 ) ) ( not ( = ?auto_465383 ?auto_465389 ) ) ( not ( = ?auto_465383 ?auto_465390 ) ) ( not ( = ?auto_465384 ?auto_465385 ) ) ( not ( = ?auto_465384 ?auto_465386 ) ) ( not ( = ?auto_465384 ?auto_465387 ) ) ( not ( = ?auto_465384 ?auto_465388 ) ) ( not ( = ?auto_465384 ?auto_465389 ) ) ( not ( = ?auto_465384 ?auto_465390 ) ) ( not ( = ?auto_465385 ?auto_465386 ) ) ( not ( = ?auto_465385 ?auto_465387 ) ) ( not ( = ?auto_465385 ?auto_465388 ) ) ( not ( = ?auto_465385 ?auto_465389 ) ) ( not ( = ?auto_465385 ?auto_465390 ) ) ( not ( = ?auto_465386 ?auto_465387 ) ) ( not ( = ?auto_465386 ?auto_465388 ) ) ( not ( = ?auto_465386 ?auto_465389 ) ) ( not ( = ?auto_465386 ?auto_465390 ) ) ( not ( = ?auto_465387 ?auto_465388 ) ) ( not ( = ?auto_465387 ?auto_465389 ) ) ( not ( = ?auto_465387 ?auto_465390 ) ) ( not ( = ?auto_465388 ?auto_465389 ) ) ( not ( = ?auto_465388 ?auto_465390 ) ) ( not ( = ?auto_465389 ?auto_465390 ) ) ( CLEAR ?auto_465387 ) ( ON ?auto_465388 ?auto_465389 ) ( CLEAR ?auto_465388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_465383 ?auto_465384 ?auto_465385 ?auto_465386 ?auto_465387 ?auto_465388 )
      ( MAKE-7PILE ?auto_465383 ?auto_465384 ?auto_465385 ?auto_465386 ?auto_465387 ?auto_465388 ?auto_465389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_465413 - BLOCK
      ?auto_465414 - BLOCK
      ?auto_465415 - BLOCK
      ?auto_465416 - BLOCK
      ?auto_465417 - BLOCK
      ?auto_465418 - BLOCK
      ?auto_465419 - BLOCK
    )
    :vars
    (
      ?auto_465420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465419 ?auto_465420 ) ( ON-TABLE ?auto_465413 ) ( ON ?auto_465414 ?auto_465413 ) ( ON ?auto_465415 ?auto_465414 ) ( ON ?auto_465416 ?auto_465415 ) ( not ( = ?auto_465413 ?auto_465414 ) ) ( not ( = ?auto_465413 ?auto_465415 ) ) ( not ( = ?auto_465413 ?auto_465416 ) ) ( not ( = ?auto_465413 ?auto_465417 ) ) ( not ( = ?auto_465413 ?auto_465418 ) ) ( not ( = ?auto_465413 ?auto_465419 ) ) ( not ( = ?auto_465413 ?auto_465420 ) ) ( not ( = ?auto_465414 ?auto_465415 ) ) ( not ( = ?auto_465414 ?auto_465416 ) ) ( not ( = ?auto_465414 ?auto_465417 ) ) ( not ( = ?auto_465414 ?auto_465418 ) ) ( not ( = ?auto_465414 ?auto_465419 ) ) ( not ( = ?auto_465414 ?auto_465420 ) ) ( not ( = ?auto_465415 ?auto_465416 ) ) ( not ( = ?auto_465415 ?auto_465417 ) ) ( not ( = ?auto_465415 ?auto_465418 ) ) ( not ( = ?auto_465415 ?auto_465419 ) ) ( not ( = ?auto_465415 ?auto_465420 ) ) ( not ( = ?auto_465416 ?auto_465417 ) ) ( not ( = ?auto_465416 ?auto_465418 ) ) ( not ( = ?auto_465416 ?auto_465419 ) ) ( not ( = ?auto_465416 ?auto_465420 ) ) ( not ( = ?auto_465417 ?auto_465418 ) ) ( not ( = ?auto_465417 ?auto_465419 ) ) ( not ( = ?auto_465417 ?auto_465420 ) ) ( not ( = ?auto_465418 ?auto_465419 ) ) ( not ( = ?auto_465418 ?auto_465420 ) ) ( not ( = ?auto_465419 ?auto_465420 ) ) ( ON ?auto_465418 ?auto_465419 ) ( CLEAR ?auto_465416 ) ( ON ?auto_465417 ?auto_465418 ) ( CLEAR ?auto_465417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_465413 ?auto_465414 ?auto_465415 ?auto_465416 ?auto_465417 )
      ( MAKE-7PILE ?auto_465413 ?auto_465414 ?auto_465415 ?auto_465416 ?auto_465417 ?auto_465418 ?auto_465419 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_465443 - BLOCK
      ?auto_465444 - BLOCK
      ?auto_465445 - BLOCK
      ?auto_465446 - BLOCK
      ?auto_465447 - BLOCK
      ?auto_465448 - BLOCK
      ?auto_465449 - BLOCK
    )
    :vars
    (
      ?auto_465450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465449 ?auto_465450 ) ( ON-TABLE ?auto_465443 ) ( ON ?auto_465444 ?auto_465443 ) ( ON ?auto_465445 ?auto_465444 ) ( not ( = ?auto_465443 ?auto_465444 ) ) ( not ( = ?auto_465443 ?auto_465445 ) ) ( not ( = ?auto_465443 ?auto_465446 ) ) ( not ( = ?auto_465443 ?auto_465447 ) ) ( not ( = ?auto_465443 ?auto_465448 ) ) ( not ( = ?auto_465443 ?auto_465449 ) ) ( not ( = ?auto_465443 ?auto_465450 ) ) ( not ( = ?auto_465444 ?auto_465445 ) ) ( not ( = ?auto_465444 ?auto_465446 ) ) ( not ( = ?auto_465444 ?auto_465447 ) ) ( not ( = ?auto_465444 ?auto_465448 ) ) ( not ( = ?auto_465444 ?auto_465449 ) ) ( not ( = ?auto_465444 ?auto_465450 ) ) ( not ( = ?auto_465445 ?auto_465446 ) ) ( not ( = ?auto_465445 ?auto_465447 ) ) ( not ( = ?auto_465445 ?auto_465448 ) ) ( not ( = ?auto_465445 ?auto_465449 ) ) ( not ( = ?auto_465445 ?auto_465450 ) ) ( not ( = ?auto_465446 ?auto_465447 ) ) ( not ( = ?auto_465446 ?auto_465448 ) ) ( not ( = ?auto_465446 ?auto_465449 ) ) ( not ( = ?auto_465446 ?auto_465450 ) ) ( not ( = ?auto_465447 ?auto_465448 ) ) ( not ( = ?auto_465447 ?auto_465449 ) ) ( not ( = ?auto_465447 ?auto_465450 ) ) ( not ( = ?auto_465448 ?auto_465449 ) ) ( not ( = ?auto_465448 ?auto_465450 ) ) ( not ( = ?auto_465449 ?auto_465450 ) ) ( ON ?auto_465448 ?auto_465449 ) ( ON ?auto_465447 ?auto_465448 ) ( CLEAR ?auto_465445 ) ( ON ?auto_465446 ?auto_465447 ) ( CLEAR ?auto_465446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_465443 ?auto_465444 ?auto_465445 ?auto_465446 )
      ( MAKE-7PILE ?auto_465443 ?auto_465444 ?auto_465445 ?auto_465446 ?auto_465447 ?auto_465448 ?auto_465449 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_465473 - BLOCK
      ?auto_465474 - BLOCK
      ?auto_465475 - BLOCK
      ?auto_465476 - BLOCK
      ?auto_465477 - BLOCK
      ?auto_465478 - BLOCK
      ?auto_465479 - BLOCK
    )
    :vars
    (
      ?auto_465480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465479 ?auto_465480 ) ( ON-TABLE ?auto_465473 ) ( ON ?auto_465474 ?auto_465473 ) ( not ( = ?auto_465473 ?auto_465474 ) ) ( not ( = ?auto_465473 ?auto_465475 ) ) ( not ( = ?auto_465473 ?auto_465476 ) ) ( not ( = ?auto_465473 ?auto_465477 ) ) ( not ( = ?auto_465473 ?auto_465478 ) ) ( not ( = ?auto_465473 ?auto_465479 ) ) ( not ( = ?auto_465473 ?auto_465480 ) ) ( not ( = ?auto_465474 ?auto_465475 ) ) ( not ( = ?auto_465474 ?auto_465476 ) ) ( not ( = ?auto_465474 ?auto_465477 ) ) ( not ( = ?auto_465474 ?auto_465478 ) ) ( not ( = ?auto_465474 ?auto_465479 ) ) ( not ( = ?auto_465474 ?auto_465480 ) ) ( not ( = ?auto_465475 ?auto_465476 ) ) ( not ( = ?auto_465475 ?auto_465477 ) ) ( not ( = ?auto_465475 ?auto_465478 ) ) ( not ( = ?auto_465475 ?auto_465479 ) ) ( not ( = ?auto_465475 ?auto_465480 ) ) ( not ( = ?auto_465476 ?auto_465477 ) ) ( not ( = ?auto_465476 ?auto_465478 ) ) ( not ( = ?auto_465476 ?auto_465479 ) ) ( not ( = ?auto_465476 ?auto_465480 ) ) ( not ( = ?auto_465477 ?auto_465478 ) ) ( not ( = ?auto_465477 ?auto_465479 ) ) ( not ( = ?auto_465477 ?auto_465480 ) ) ( not ( = ?auto_465478 ?auto_465479 ) ) ( not ( = ?auto_465478 ?auto_465480 ) ) ( not ( = ?auto_465479 ?auto_465480 ) ) ( ON ?auto_465478 ?auto_465479 ) ( ON ?auto_465477 ?auto_465478 ) ( ON ?auto_465476 ?auto_465477 ) ( CLEAR ?auto_465474 ) ( ON ?auto_465475 ?auto_465476 ) ( CLEAR ?auto_465475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_465473 ?auto_465474 ?auto_465475 )
      ( MAKE-7PILE ?auto_465473 ?auto_465474 ?auto_465475 ?auto_465476 ?auto_465477 ?auto_465478 ?auto_465479 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_465503 - BLOCK
      ?auto_465504 - BLOCK
      ?auto_465505 - BLOCK
      ?auto_465506 - BLOCK
      ?auto_465507 - BLOCK
      ?auto_465508 - BLOCK
      ?auto_465509 - BLOCK
    )
    :vars
    (
      ?auto_465510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465509 ?auto_465510 ) ( ON-TABLE ?auto_465503 ) ( not ( = ?auto_465503 ?auto_465504 ) ) ( not ( = ?auto_465503 ?auto_465505 ) ) ( not ( = ?auto_465503 ?auto_465506 ) ) ( not ( = ?auto_465503 ?auto_465507 ) ) ( not ( = ?auto_465503 ?auto_465508 ) ) ( not ( = ?auto_465503 ?auto_465509 ) ) ( not ( = ?auto_465503 ?auto_465510 ) ) ( not ( = ?auto_465504 ?auto_465505 ) ) ( not ( = ?auto_465504 ?auto_465506 ) ) ( not ( = ?auto_465504 ?auto_465507 ) ) ( not ( = ?auto_465504 ?auto_465508 ) ) ( not ( = ?auto_465504 ?auto_465509 ) ) ( not ( = ?auto_465504 ?auto_465510 ) ) ( not ( = ?auto_465505 ?auto_465506 ) ) ( not ( = ?auto_465505 ?auto_465507 ) ) ( not ( = ?auto_465505 ?auto_465508 ) ) ( not ( = ?auto_465505 ?auto_465509 ) ) ( not ( = ?auto_465505 ?auto_465510 ) ) ( not ( = ?auto_465506 ?auto_465507 ) ) ( not ( = ?auto_465506 ?auto_465508 ) ) ( not ( = ?auto_465506 ?auto_465509 ) ) ( not ( = ?auto_465506 ?auto_465510 ) ) ( not ( = ?auto_465507 ?auto_465508 ) ) ( not ( = ?auto_465507 ?auto_465509 ) ) ( not ( = ?auto_465507 ?auto_465510 ) ) ( not ( = ?auto_465508 ?auto_465509 ) ) ( not ( = ?auto_465508 ?auto_465510 ) ) ( not ( = ?auto_465509 ?auto_465510 ) ) ( ON ?auto_465508 ?auto_465509 ) ( ON ?auto_465507 ?auto_465508 ) ( ON ?auto_465506 ?auto_465507 ) ( ON ?auto_465505 ?auto_465506 ) ( CLEAR ?auto_465503 ) ( ON ?auto_465504 ?auto_465505 ) ( CLEAR ?auto_465504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_465503 ?auto_465504 )
      ( MAKE-7PILE ?auto_465503 ?auto_465504 ?auto_465505 ?auto_465506 ?auto_465507 ?auto_465508 ?auto_465509 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_465533 - BLOCK
      ?auto_465534 - BLOCK
      ?auto_465535 - BLOCK
      ?auto_465536 - BLOCK
      ?auto_465537 - BLOCK
      ?auto_465538 - BLOCK
      ?auto_465539 - BLOCK
    )
    :vars
    (
      ?auto_465540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465539 ?auto_465540 ) ( not ( = ?auto_465533 ?auto_465534 ) ) ( not ( = ?auto_465533 ?auto_465535 ) ) ( not ( = ?auto_465533 ?auto_465536 ) ) ( not ( = ?auto_465533 ?auto_465537 ) ) ( not ( = ?auto_465533 ?auto_465538 ) ) ( not ( = ?auto_465533 ?auto_465539 ) ) ( not ( = ?auto_465533 ?auto_465540 ) ) ( not ( = ?auto_465534 ?auto_465535 ) ) ( not ( = ?auto_465534 ?auto_465536 ) ) ( not ( = ?auto_465534 ?auto_465537 ) ) ( not ( = ?auto_465534 ?auto_465538 ) ) ( not ( = ?auto_465534 ?auto_465539 ) ) ( not ( = ?auto_465534 ?auto_465540 ) ) ( not ( = ?auto_465535 ?auto_465536 ) ) ( not ( = ?auto_465535 ?auto_465537 ) ) ( not ( = ?auto_465535 ?auto_465538 ) ) ( not ( = ?auto_465535 ?auto_465539 ) ) ( not ( = ?auto_465535 ?auto_465540 ) ) ( not ( = ?auto_465536 ?auto_465537 ) ) ( not ( = ?auto_465536 ?auto_465538 ) ) ( not ( = ?auto_465536 ?auto_465539 ) ) ( not ( = ?auto_465536 ?auto_465540 ) ) ( not ( = ?auto_465537 ?auto_465538 ) ) ( not ( = ?auto_465537 ?auto_465539 ) ) ( not ( = ?auto_465537 ?auto_465540 ) ) ( not ( = ?auto_465538 ?auto_465539 ) ) ( not ( = ?auto_465538 ?auto_465540 ) ) ( not ( = ?auto_465539 ?auto_465540 ) ) ( ON ?auto_465538 ?auto_465539 ) ( ON ?auto_465537 ?auto_465538 ) ( ON ?auto_465536 ?auto_465537 ) ( ON ?auto_465535 ?auto_465536 ) ( ON ?auto_465534 ?auto_465535 ) ( ON ?auto_465533 ?auto_465534 ) ( CLEAR ?auto_465533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_465533 )
      ( MAKE-7PILE ?auto_465533 ?auto_465534 ?auto_465535 ?auto_465536 ?auto_465537 ?auto_465538 ?auto_465539 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_465564 - BLOCK
      ?auto_465565 - BLOCK
      ?auto_465566 - BLOCK
      ?auto_465567 - BLOCK
      ?auto_465568 - BLOCK
      ?auto_465569 - BLOCK
      ?auto_465570 - BLOCK
      ?auto_465571 - BLOCK
    )
    :vars
    (
      ?auto_465572 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_465570 ) ( ON ?auto_465571 ?auto_465572 ) ( CLEAR ?auto_465571 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_465564 ) ( ON ?auto_465565 ?auto_465564 ) ( ON ?auto_465566 ?auto_465565 ) ( ON ?auto_465567 ?auto_465566 ) ( ON ?auto_465568 ?auto_465567 ) ( ON ?auto_465569 ?auto_465568 ) ( ON ?auto_465570 ?auto_465569 ) ( not ( = ?auto_465564 ?auto_465565 ) ) ( not ( = ?auto_465564 ?auto_465566 ) ) ( not ( = ?auto_465564 ?auto_465567 ) ) ( not ( = ?auto_465564 ?auto_465568 ) ) ( not ( = ?auto_465564 ?auto_465569 ) ) ( not ( = ?auto_465564 ?auto_465570 ) ) ( not ( = ?auto_465564 ?auto_465571 ) ) ( not ( = ?auto_465564 ?auto_465572 ) ) ( not ( = ?auto_465565 ?auto_465566 ) ) ( not ( = ?auto_465565 ?auto_465567 ) ) ( not ( = ?auto_465565 ?auto_465568 ) ) ( not ( = ?auto_465565 ?auto_465569 ) ) ( not ( = ?auto_465565 ?auto_465570 ) ) ( not ( = ?auto_465565 ?auto_465571 ) ) ( not ( = ?auto_465565 ?auto_465572 ) ) ( not ( = ?auto_465566 ?auto_465567 ) ) ( not ( = ?auto_465566 ?auto_465568 ) ) ( not ( = ?auto_465566 ?auto_465569 ) ) ( not ( = ?auto_465566 ?auto_465570 ) ) ( not ( = ?auto_465566 ?auto_465571 ) ) ( not ( = ?auto_465566 ?auto_465572 ) ) ( not ( = ?auto_465567 ?auto_465568 ) ) ( not ( = ?auto_465567 ?auto_465569 ) ) ( not ( = ?auto_465567 ?auto_465570 ) ) ( not ( = ?auto_465567 ?auto_465571 ) ) ( not ( = ?auto_465567 ?auto_465572 ) ) ( not ( = ?auto_465568 ?auto_465569 ) ) ( not ( = ?auto_465568 ?auto_465570 ) ) ( not ( = ?auto_465568 ?auto_465571 ) ) ( not ( = ?auto_465568 ?auto_465572 ) ) ( not ( = ?auto_465569 ?auto_465570 ) ) ( not ( = ?auto_465569 ?auto_465571 ) ) ( not ( = ?auto_465569 ?auto_465572 ) ) ( not ( = ?auto_465570 ?auto_465571 ) ) ( not ( = ?auto_465570 ?auto_465572 ) ) ( not ( = ?auto_465571 ?auto_465572 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_465571 ?auto_465572 )
      ( !STACK ?auto_465571 ?auto_465570 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_465598 - BLOCK
      ?auto_465599 - BLOCK
      ?auto_465600 - BLOCK
      ?auto_465601 - BLOCK
      ?auto_465602 - BLOCK
      ?auto_465603 - BLOCK
      ?auto_465604 - BLOCK
      ?auto_465605 - BLOCK
    )
    :vars
    (
      ?auto_465606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465605 ?auto_465606 ) ( ON-TABLE ?auto_465598 ) ( ON ?auto_465599 ?auto_465598 ) ( ON ?auto_465600 ?auto_465599 ) ( ON ?auto_465601 ?auto_465600 ) ( ON ?auto_465602 ?auto_465601 ) ( ON ?auto_465603 ?auto_465602 ) ( not ( = ?auto_465598 ?auto_465599 ) ) ( not ( = ?auto_465598 ?auto_465600 ) ) ( not ( = ?auto_465598 ?auto_465601 ) ) ( not ( = ?auto_465598 ?auto_465602 ) ) ( not ( = ?auto_465598 ?auto_465603 ) ) ( not ( = ?auto_465598 ?auto_465604 ) ) ( not ( = ?auto_465598 ?auto_465605 ) ) ( not ( = ?auto_465598 ?auto_465606 ) ) ( not ( = ?auto_465599 ?auto_465600 ) ) ( not ( = ?auto_465599 ?auto_465601 ) ) ( not ( = ?auto_465599 ?auto_465602 ) ) ( not ( = ?auto_465599 ?auto_465603 ) ) ( not ( = ?auto_465599 ?auto_465604 ) ) ( not ( = ?auto_465599 ?auto_465605 ) ) ( not ( = ?auto_465599 ?auto_465606 ) ) ( not ( = ?auto_465600 ?auto_465601 ) ) ( not ( = ?auto_465600 ?auto_465602 ) ) ( not ( = ?auto_465600 ?auto_465603 ) ) ( not ( = ?auto_465600 ?auto_465604 ) ) ( not ( = ?auto_465600 ?auto_465605 ) ) ( not ( = ?auto_465600 ?auto_465606 ) ) ( not ( = ?auto_465601 ?auto_465602 ) ) ( not ( = ?auto_465601 ?auto_465603 ) ) ( not ( = ?auto_465601 ?auto_465604 ) ) ( not ( = ?auto_465601 ?auto_465605 ) ) ( not ( = ?auto_465601 ?auto_465606 ) ) ( not ( = ?auto_465602 ?auto_465603 ) ) ( not ( = ?auto_465602 ?auto_465604 ) ) ( not ( = ?auto_465602 ?auto_465605 ) ) ( not ( = ?auto_465602 ?auto_465606 ) ) ( not ( = ?auto_465603 ?auto_465604 ) ) ( not ( = ?auto_465603 ?auto_465605 ) ) ( not ( = ?auto_465603 ?auto_465606 ) ) ( not ( = ?auto_465604 ?auto_465605 ) ) ( not ( = ?auto_465604 ?auto_465606 ) ) ( not ( = ?auto_465605 ?auto_465606 ) ) ( CLEAR ?auto_465603 ) ( ON ?auto_465604 ?auto_465605 ) ( CLEAR ?auto_465604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_465598 ?auto_465599 ?auto_465600 ?auto_465601 ?auto_465602 ?auto_465603 ?auto_465604 )
      ( MAKE-8PILE ?auto_465598 ?auto_465599 ?auto_465600 ?auto_465601 ?auto_465602 ?auto_465603 ?auto_465604 ?auto_465605 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_465632 - BLOCK
      ?auto_465633 - BLOCK
      ?auto_465634 - BLOCK
      ?auto_465635 - BLOCK
      ?auto_465636 - BLOCK
      ?auto_465637 - BLOCK
      ?auto_465638 - BLOCK
      ?auto_465639 - BLOCK
    )
    :vars
    (
      ?auto_465640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465639 ?auto_465640 ) ( ON-TABLE ?auto_465632 ) ( ON ?auto_465633 ?auto_465632 ) ( ON ?auto_465634 ?auto_465633 ) ( ON ?auto_465635 ?auto_465634 ) ( ON ?auto_465636 ?auto_465635 ) ( not ( = ?auto_465632 ?auto_465633 ) ) ( not ( = ?auto_465632 ?auto_465634 ) ) ( not ( = ?auto_465632 ?auto_465635 ) ) ( not ( = ?auto_465632 ?auto_465636 ) ) ( not ( = ?auto_465632 ?auto_465637 ) ) ( not ( = ?auto_465632 ?auto_465638 ) ) ( not ( = ?auto_465632 ?auto_465639 ) ) ( not ( = ?auto_465632 ?auto_465640 ) ) ( not ( = ?auto_465633 ?auto_465634 ) ) ( not ( = ?auto_465633 ?auto_465635 ) ) ( not ( = ?auto_465633 ?auto_465636 ) ) ( not ( = ?auto_465633 ?auto_465637 ) ) ( not ( = ?auto_465633 ?auto_465638 ) ) ( not ( = ?auto_465633 ?auto_465639 ) ) ( not ( = ?auto_465633 ?auto_465640 ) ) ( not ( = ?auto_465634 ?auto_465635 ) ) ( not ( = ?auto_465634 ?auto_465636 ) ) ( not ( = ?auto_465634 ?auto_465637 ) ) ( not ( = ?auto_465634 ?auto_465638 ) ) ( not ( = ?auto_465634 ?auto_465639 ) ) ( not ( = ?auto_465634 ?auto_465640 ) ) ( not ( = ?auto_465635 ?auto_465636 ) ) ( not ( = ?auto_465635 ?auto_465637 ) ) ( not ( = ?auto_465635 ?auto_465638 ) ) ( not ( = ?auto_465635 ?auto_465639 ) ) ( not ( = ?auto_465635 ?auto_465640 ) ) ( not ( = ?auto_465636 ?auto_465637 ) ) ( not ( = ?auto_465636 ?auto_465638 ) ) ( not ( = ?auto_465636 ?auto_465639 ) ) ( not ( = ?auto_465636 ?auto_465640 ) ) ( not ( = ?auto_465637 ?auto_465638 ) ) ( not ( = ?auto_465637 ?auto_465639 ) ) ( not ( = ?auto_465637 ?auto_465640 ) ) ( not ( = ?auto_465638 ?auto_465639 ) ) ( not ( = ?auto_465638 ?auto_465640 ) ) ( not ( = ?auto_465639 ?auto_465640 ) ) ( ON ?auto_465638 ?auto_465639 ) ( CLEAR ?auto_465636 ) ( ON ?auto_465637 ?auto_465638 ) ( CLEAR ?auto_465637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_465632 ?auto_465633 ?auto_465634 ?auto_465635 ?auto_465636 ?auto_465637 )
      ( MAKE-8PILE ?auto_465632 ?auto_465633 ?auto_465634 ?auto_465635 ?auto_465636 ?auto_465637 ?auto_465638 ?auto_465639 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_465666 - BLOCK
      ?auto_465667 - BLOCK
      ?auto_465668 - BLOCK
      ?auto_465669 - BLOCK
      ?auto_465670 - BLOCK
      ?auto_465671 - BLOCK
      ?auto_465672 - BLOCK
      ?auto_465673 - BLOCK
    )
    :vars
    (
      ?auto_465674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465673 ?auto_465674 ) ( ON-TABLE ?auto_465666 ) ( ON ?auto_465667 ?auto_465666 ) ( ON ?auto_465668 ?auto_465667 ) ( ON ?auto_465669 ?auto_465668 ) ( not ( = ?auto_465666 ?auto_465667 ) ) ( not ( = ?auto_465666 ?auto_465668 ) ) ( not ( = ?auto_465666 ?auto_465669 ) ) ( not ( = ?auto_465666 ?auto_465670 ) ) ( not ( = ?auto_465666 ?auto_465671 ) ) ( not ( = ?auto_465666 ?auto_465672 ) ) ( not ( = ?auto_465666 ?auto_465673 ) ) ( not ( = ?auto_465666 ?auto_465674 ) ) ( not ( = ?auto_465667 ?auto_465668 ) ) ( not ( = ?auto_465667 ?auto_465669 ) ) ( not ( = ?auto_465667 ?auto_465670 ) ) ( not ( = ?auto_465667 ?auto_465671 ) ) ( not ( = ?auto_465667 ?auto_465672 ) ) ( not ( = ?auto_465667 ?auto_465673 ) ) ( not ( = ?auto_465667 ?auto_465674 ) ) ( not ( = ?auto_465668 ?auto_465669 ) ) ( not ( = ?auto_465668 ?auto_465670 ) ) ( not ( = ?auto_465668 ?auto_465671 ) ) ( not ( = ?auto_465668 ?auto_465672 ) ) ( not ( = ?auto_465668 ?auto_465673 ) ) ( not ( = ?auto_465668 ?auto_465674 ) ) ( not ( = ?auto_465669 ?auto_465670 ) ) ( not ( = ?auto_465669 ?auto_465671 ) ) ( not ( = ?auto_465669 ?auto_465672 ) ) ( not ( = ?auto_465669 ?auto_465673 ) ) ( not ( = ?auto_465669 ?auto_465674 ) ) ( not ( = ?auto_465670 ?auto_465671 ) ) ( not ( = ?auto_465670 ?auto_465672 ) ) ( not ( = ?auto_465670 ?auto_465673 ) ) ( not ( = ?auto_465670 ?auto_465674 ) ) ( not ( = ?auto_465671 ?auto_465672 ) ) ( not ( = ?auto_465671 ?auto_465673 ) ) ( not ( = ?auto_465671 ?auto_465674 ) ) ( not ( = ?auto_465672 ?auto_465673 ) ) ( not ( = ?auto_465672 ?auto_465674 ) ) ( not ( = ?auto_465673 ?auto_465674 ) ) ( ON ?auto_465672 ?auto_465673 ) ( ON ?auto_465671 ?auto_465672 ) ( CLEAR ?auto_465669 ) ( ON ?auto_465670 ?auto_465671 ) ( CLEAR ?auto_465670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_465666 ?auto_465667 ?auto_465668 ?auto_465669 ?auto_465670 )
      ( MAKE-8PILE ?auto_465666 ?auto_465667 ?auto_465668 ?auto_465669 ?auto_465670 ?auto_465671 ?auto_465672 ?auto_465673 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_465700 - BLOCK
      ?auto_465701 - BLOCK
      ?auto_465702 - BLOCK
      ?auto_465703 - BLOCK
      ?auto_465704 - BLOCK
      ?auto_465705 - BLOCK
      ?auto_465706 - BLOCK
      ?auto_465707 - BLOCK
    )
    :vars
    (
      ?auto_465708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465707 ?auto_465708 ) ( ON-TABLE ?auto_465700 ) ( ON ?auto_465701 ?auto_465700 ) ( ON ?auto_465702 ?auto_465701 ) ( not ( = ?auto_465700 ?auto_465701 ) ) ( not ( = ?auto_465700 ?auto_465702 ) ) ( not ( = ?auto_465700 ?auto_465703 ) ) ( not ( = ?auto_465700 ?auto_465704 ) ) ( not ( = ?auto_465700 ?auto_465705 ) ) ( not ( = ?auto_465700 ?auto_465706 ) ) ( not ( = ?auto_465700 ?auto_465707 ) ) ( not ( = ?auto_465700 ?auto_465708 ) ) ( not ( = ?auto_465701 ?auto_465702 ) ) ( not ( = ?auto_465701 ?auto_465703 ) ) ( not ( = ?auto_465701 ?auto_465704 ) ) ( not ( = ?auto_465701 ?auto_465705 ) ) ( not ( = ?auto_465701 ?auto_465706 ) ) ( not ( = ?auto_465701 ?auto_465707 ) ) ( not ( = ?auto_465701 ?auto_465708 ) ) ( not ( = ?auto_465702 ?auto_465703 ) ) ( not ( = ?auto_465702 ?auto_465704 ) ) ( not ( = ?auto_465702 ?auto_465705 ) ) ( not ( = ?auto_465702 ?auto_465706 ) ) ( not ( = ?auto_465702 ?auto_465707 ) ) ( not ( = ?auto_465702 ?auto_465708 ) ) ( not ( = ?auto_465703 ?auto_465704 ) ) ( not ( = ?auto_465703 ?auto_465705 ) ) ( not ( = ?auto_465703 ?auto_465706 ) ) ( not ( = ?auto_465703 ?auto_465707 ) ) ( not ( = ?auto_465703 ?auto_465708 ) ) ( not ( = ?auto_465704 ?auto_465705 ) ) ( not ( = ?auto_465704 ?auto_465706 ) ) ( not ( = ?auto_465704 ?auto_465707 ) ) ( not ( = ?auto_465704 ?auto_465708 ) ) ( not ( = ?auto_465705 ?auto_465706 ) ) ( not ( = ?auto_465705 ?auto_465707 ) ) ( not ( = ?auto_465705 ?auto_465708 ) ) ( not ( = ?auto_465706 ?auto_465707 ) ) ( not ( = ?auto_465706 ?auto_465708 ) ) ( not ( = ?auto_465707 ?auto_465708 ) ) ( ON ?auto_465706 ?auto_465707 ) ( ON ?auto_465705 ?auto_465706 ) ( ON ?auto_465704 ?auto_465705 ) ( CLEAR ?auto_465702 ) ( ON ?auto_465703 ?auto_465704 ) ( CLEAR ?auto_465703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_465700 ?auto_465701 ?auto_465702 ?auto_465703 )
      ( MAKE-8PILE ?auto_465700 ?auto_465701 ?auto_465702 ?auto_465703 ?auto_465704 ?auto_465705 ?auto_465706 ?auto_465707 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_465734 - BLOCK
      ?auto_465735 - BLOCK
      ?auto_465736 - BLOCK
      ?auto_465737 - BLOCK
      ?auto_465738 - BLOCK
      ?auto_465739 - BLOCK
      ?auto_465740 - BLOCK
      ?auto_465741 - BLOCK
    )
    :vars
    (
      ?auto_465742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465741 ?auto_465742 ) ( ON-TABLE ?auto_465734 ) ( ON ?auto_465735 ?auto_465734 ) ( not ( = ?auto_465734 ?auto_465735 ) ) ( not ( = ?auto_465734 ?auto_465736 ) ) ( not ( = ?auto_465734 ?auto_465737 ) ) ( not ( = ?auto_465734 ?auto_465738 ) ) ( not ( = ?auto_465734 ?auto_465739 ) ) ( not ( = ?auto_465734 ?auto_465740 ) ) ( not ( = ?auto_465734 ?auto_465741 ) ) ( not ( = ?auto_465734 ?auto_465742 ) ) ( not ( = ?auto_465735 ?auto_465736 ) ) ( not ( = ?auto_465735 ?auto_465737 ) ) ( not ( = ?auto_465735 ?auto_465738 ) ) ( not ( = ?auto_465735 ?auto_465739 ) ) ( not ( = ?auto_465735 ?auto_465740 ) ) ( not ( = ?auto_465735 ?auto_465741 ) ) ( not ( = ?auto_465735 ?auto_465742 ) ) ( not ( = ?auto_465736 ?auto_465737 ) ) ( not ( = ?auto_465736 ?auto_465738 ) ) ( not ( = ?auto_465736 ?auto_465739 ) ) ( not ( = ?auto_465736 ?auto_465740 ) ) ( not ( = ?auto_465736 ?auto_465741 ) ) ( not ( = ?auto_465736 ?auto_465742 ) ) ( not ( = ?auto_465737 ?auto_465738 ) ) ( not ( = ?auto_465737 ?auto_465739 ) ) ( not ( = ?auto_465737 ?auto_465740 ) ) ( not ( = ?auto_465737 ?auto_465741 ) ) ( not ( = ?auto_465737 ?auto_465742 ) ) ( not ( = ?auto_465738 ?auto_465739 ) ) ( not ( = ?auto_465738 ?auto_465740 ) ) ( not ( = ?auto_465738 ?auto_465741 ) ) ( not ( = ?auto_465738 ?auto_465742 ) ) ( not ( = ?auto_465739 ?auto_465740 ) ) ( not ( = ?auto_465739 ?auto_465741 ) ) ( not ( = ?auto_465739 ?auto_465742 ) ) ( not ( = ?auto_465740 ?auto_465741 ) ) ( not ( = ?auto_465740 ?auto_465742 ) ) ( not ( = ?auto_465741 ?auto_465742 ) ) ( ON ?auto_465740 ?auto_465741 ) ( ON ?auto_465739 ?auto_465740 ) ( ON ?auto_465738 ?auto_465739 ) ( ON ?auto_465737 ?auto_465738 ) ( CLEAR ?auto_465735 ) ( ON ?auto_465736 ?auto_465737 ) ( CLEAR ?auto_465736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_465734 ?auto_465735 ?auto_465736 )
      ( MAKE-8PILE ?auto_465734 ?auto_465735 ?auto_465736 ?auto_465737 ?auto_465738 ?auto_465739 ?auto_465740 ?auto_465741 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_465768 - BLOCK
      ?auto_465769 - BLOCK
      ?auto_465770 - BLOCK
      ?auto_465771 - BLOCK
      ?auto_465772 - BLOCK
      ?auto_465773 - BLOCK
      ?auto_465774 - BLOCK
      ?auto_465775 - BLOCK
    )
    :vars
    (
      ?auto_465776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465775 ?auto_465776 ) ( ON-TABLE ?auto_465768 ) ( not ( = ?auto_465768 ?auto_465769 ) ) ( not ( = ?auto_465768 ?auto_465770 ) ) ( not ( = ?auto_465768 ?auto_465771 ) ) ( not ( = ?auto_465768 ?auto_465772 ) ) ( not ( = ?auto_465768 ?auto_465773 ) ) ( not ( = ?auto_465768 ?auto_465774 ) ) ( not ( = ?auto_465768 ?auto_465775 ) ) ( not ( = ?auto_465768 ?auto_465776 ) ) ( not ( = ?auto_465769 ?auto_465770 ) ) ( not ( = ?auto_465769 ?auto_465771 ) ) ( not ( = ?auto_465769 ?auto_465772 ) ) ( not ( = ?auto_465769 ?auto_465773 ) ) ( not ( = ?auto_465769 ?auto_465774 ) ) ( not ( = ?auto_465769 ?auto_465775 ) ) ( not ( = ?auto_465769 ?auto_465776 ) ) ( not ( = ?auto_465770 ?auto_465771 ) ) ( not ( = ?auto_465770 ?auto_465772 ) ) ( not ( = ?auto_465770 ?auto_465773 ) ) ( not ( = ?auto_465770 ?auto_465774 ) ) ( not ( = ?auto_465770 ?auto_465775 ) ) ( not ( = ?auto_465770 ?auto_465776 ) ) ( not ( = ?auto_465771 ?auto_465772 ) ) ( not ( = ?auto_465771 ?auto_465773 ) ) ( not ( = ?auto_465771 ?auto_465774 ) ) ( not ( = ?auto_465771 ?auto_465775 ) ) ( not ( = ?auto_465771 ?auto_465776 ) ) ( not ( = ?auto_465772 ?auto_465773 ) ) ( not ( = ?auto_465772 ?auto_465774 ) ) ( not ( = ?auto_465772 ?auto_465775 ) ) ( not ( = ?auto_465772 ?auto_465776 ) ) ( not ( = ?auto_465773 ?auto_465774 ) ) ( not ( = ?auto_465773 ?auto_465775 ) ) ( not ( = ?auto_465773 ?auto_465776 ) ) ( not ( = ?auto_465774 ?auto_465775 ) ) ( not ( = ?auto_465774 ?auto_465776 ) ) ( not ( = ?auto_465775 ?auto_465776 ) ) ( ON ?auto_465774 ?auto_465775 ) ( ON ?auto_465773 ?auto_465774 ) ( ON ?auto_465772 ?auto_465773 ) ( ON ?auto_465771 ?auto_465772 ) ( ON ?auto_465770 ?auto_465771 ) ( CLEAR ?auto_465768 ) ( ON ?auto_465769 ?auto_465770 ) ( CLEAR ?auto_465769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_465768 ?auto_465769 )
      ( MAKE-8PILE ?auto_465768 ?auto_465769 ?auto_465770 ?auto_465771 ?auto_465772 ?auto_465773 ?auto_465774 ?auto_465775 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_465802 - BLOCK
      ?auto_465803 - BLOCK
      ?auto_465804 - BLOCK
      ?auto_465805 - BLOCK
      ?auto_465806 - BLOCK
      ?auto_465807 - BLOCK
      ?auto_465808 - BLOCK
      ?auto_465809 - BLOCK
    )
    :vars
    (
      ?auto_465810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465809 ?auto_465810 ) ( not ( = ?auto_465802 ?auto_465803 ) ) ( not ( = ?auto_465802 ?auto_465804 ) ) ( not ( = ?auto_465802 ?auto_465805 ) ) ( not ( = ?auto_465802 ?auto_465806 ) ) ( not ( = ?auto_465802 ?auto_465807 ) ) ( not ( = ?auto_465802 ?auto_465808 ) ) ( not ( = ?auto_465802 ?auto_465809 ) ) ( not ( = ?auto_465802 ?auto_465810 ) ) ( not ( = ?auto_465803 ?auto_465804 ) ) ( not ( = ?auto_465803 ?auto_465805 ) ) ( not ( = ?auto_465803 ?auto_465806 ) ) ( not ( = ?auto_465803 ?auto_465807 ) ) ( not ( = ?auto_465803 ?auto_465808 ) ) ( not ( = ?auto_465803 ?auto_465809 ) ) ( not ( = ?auto_465803 ?auto_465810 ) ) ( not ( = ?auto_465804 ?auto_465805 ) ) ( not ( = ?auto_465804 ?auto_465806 ) ) ( not ( = ?auto_465804 ?auto_465807 ) ) ( not ( = ?auto_465804 ?auto_465808 ) ) ( not ( = ?auto_465804 ?auto_465809 ) ) ( not ( = ?auto_465804 ?auto_465810 ) ) ( not ( = ?auto_465805 ?auto_465806 ) ) ( not ( = ?auto_465805 ?auto_465807 ) ) ( not ( = ?auto_465805 ?auto_465808 ) ) ( not ( = ?auto_465805 ?auto_465809 ) ) ( not ( = ?auto_465805 ?auto_465810 ) ) ( not ( = ?auto_465806 ?auto_465807 ) ) ( not ( = ?auto_465806 ?auto_465808 ) ) ( not ( = ?auto_465806 ?auto_465809 ) ) ( not ( = ?auto_465806 ?auto_465810 ) ) ( not ( = ?auto_465807 ?auto_465808 ) ) ( not ( = ?auto_465807 ?auto_465809 ) ) ( not ( = ?auto_465807 ?auto_465810 ) ) ( not ( = ?auto_465808 ?auto_465809 ) ) ( not ( = ?auto_465808 ?auto_465810 ) ) ( not ( = ?auto_465809 ?auto_465810 ) ) ( ON ?auto_465808 ?auto_465809 ) ( ON ?auto_465807 ?auto_465808 ) ( ON ?auto_465806 ?auto_465807 ) ( ON ?auto_465805 ?auto_465806 ) ( ON ?auto_465804 ?auto_465805 ) ( ON ?auto_465803 ?auto_465804 ) ( ON ?auto_465802 ?auto_465803 ) ( CLEAR ?auto_465802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_465802 )
      ( MAKE-8PILE ?auto_465802 ?auto_465803 ?auto_465804 ?auto_465805 ?auto_465806 ?auto_465807 ?auto_465808 ?auto_465809 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_465837 - BLOCK
      ?auto_465838 - BLOCK
      ?auto_465839 - BLOCK
      ?auto_465840 - BLOCK
      ?auto_465841 - BLOCK
      ?auto_465842 - BLOCK
      ?auto_465843 - BLOCK
      ?auto_465844 - BLOCK
      ?auto_465845 - BLOCK
    )
    :vars
    (
      ?auto_465846 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_465844 ) ( ON ?auto_465845 ?auto_465846 ) ( CLEAR ?auto_465845 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_465837 ) ( ON ?auto_465838 ?auto_465837 ) ( ON ?auto_465839 ?auto_465838 ) ( ON ?auto_465840 ?auto_465839 ) ( ON ?auto_465841 ?auto_465840 ) ( ON ?auto_465842 ?auto_465841 ) ( ON ?auto_465843 ?auto_465842 ) ( ON ?auto_465844 ?auto_465843 ) ( not ( = ?auto_465837 ?auto_465838 ) ) ( not ( = ?auto_465837 ?auto_465839 ) ) ( not ( = ?auto_465837 ?auto_465840 ) ) ( not ( = ?auto_465837 ?auto_465841 ) ) ( not ( = ?auto_465837 ?auto_465842 ) ) ( not ( = ?auto_465837 ?auto_465843 ) ) ( not ( = ?auto_465837 ?auto_465844 ) ) ( not ( = ?auto_465837 ?auto_465845 ) ) ( not ( = ?auto_465837 ?auto_465846 ) ) ( not ( = ?auto_465838 ?auto_465839 ) ) ( not ( = ?auto_465838 ?auto_465840 ) ) ( not ( = ?auto_465838 ?auto_465841 ) ) ( not ( = ?auto_465838 ?auto_465842 ) ) ( not ( = ?auto_465838 ?auto_465843 ) ) ( not ( = ?auto_465838 ?auto_465844 ) ) ( not ( = ?auto_465838 ?auto_465845 ) ) ( not ( = ?auto_465838 ?auto_465846 ) ) ( not ( = ?auto_465839 ?auto_465840 ) ) ( not ( = ?auto_465839 ?auto_465841 ) ) ( not ( = ?auto_465839 ?auto_465842 ) ) ( not ( = ?auto_465839 ?auto_465843 ) ) ( not ( = ?auto_465839 ?auto_465844 ) ) ( not ( = ?auto_465839 ?auto_465845 ) ) ( not ( = ?auto_465839 ?auto_465846 ) ) ( not ( = ?auto_465840 ?auto_465841 ) ) ( not ( = ?auto_465840 ?auto_465842 ) ) ( not ( = ?auto_465840 ?auto_465843 ) ) ( not ( = ?auto_465840 ?auto_465844 ) ) ( not ( = ?auto_465840 ?auto_465845 ) ) ( not ( = ?auto_465840 ?auto_465846 ) ) ( not ( = ?auto_465841 ?auto_465842 ) ) ( not ( = ?auto_465841 ?auto_465843 ) ) ( not ( = ?auto_465841 ?auto_465844 ) ) ( not ( = ?auto_465841 ?auto_465845 ) ) ( not ( = ?auto_465841 ?auto_465846 ) ) ( not ( = ?auto_465842 ?auto_465843 ) ) ( not ( = ?auto_465842 ?auto_465844 ) ) ( not ( = ?auto_465842 ?auto_465845 ) ) ( not ( = ?auto_465842 ?auto_465846 ) ) ( not ( = ?auto_465843 ?auto_465844 ) ) ( not ( = ?auto_465843 ?auto_465845 ) ) ( not ( = ?auto_465843 ?auto_465846 ) ) ( not ( = ?auto_465844 ?auto_465845 ) ) ( not ( = ?auto_465844 ?auto_465846 ) ) ( not ( = ?auto_465845 ?auto_465846 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_465845 ?auto_465846 )
      ( !STACK ?auto_465845 ?auto_465844 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_465875 - BLOCK
      ?auto_465876 - BLOCK
      ?auto_465877 - BLOCK
      ?auto_465878 - BLOCK
      ?auto_465879 - BLOCK
      ?auto_465880 - BLOCK
      ?auto_465881 - BLOCK
      ?auto_465882 - BLOCK
      ?auto_465883 - BLOCK
    )
    :vars
    (
      ?auto_465884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465883 ?auto_465884 ) ( ON-TABLE ?auto_465875 ) ( ON ?auto_465876 ?auto_465875 ) ( ON ?auto_465877 ?auto_465876 ) ( ON ?auto_465878 ?auto_465877 ) ( ON ?auto_465879 ?auto_465878 ) ( ON ?auto_465880 ?auto_465879 ) ( ON ?auto_465881 ?auto_465880 ) ( not ( = ?auto_465875 ?auto_465876 ) ) ( not ( = ?auto_465875 ?auto_465877 ) ) ( not ( = ?auto_465875 ?auto_465878 ) ) ( not ( = ?auto_465875 ?auto_465879 ) ) ( not ( = ?auto_465875 ?auto_465880 ) ) ( not ( = ?auto_465875 ?auto_465881 ) ) ( not ( = ?auto_465875 ?auto_465882 ) ) ( not ( = ?auto_465875 ?auto_465883 ) ) ( not ( = ?auto_465875 ?auto_465884 ) ) ( not ( = ?auto_465876 ?auto_465877 ) ) ( not ( = ?auto_465876 ?auto_465878 ) ) ( not ( = ?auto_465876 ?auto_465879 ) ) ( not ( = ?auto_465876 ?auto_465880 ) ) ( not ( = ?auto_465876 ?auto_465881 ) ) ( not ( = ?auto_465876 ?auto_465882 ) ) ( not ( = ?auto_465876 ?auto_465883 ) ) ( not ( = ?auto_465876 ?auto_465884 ) ) ( not ( = ?auto_465877 ?auto_465878 ) ) ( not ( = ?auto_465877 ?auto_465879 ) ) ( not ( = ?auto_465877 ?auto_465880 ) ) ( not ( = ?auto_465877 ?auto_465881 ) ) ( not ( = ?auto_465877 ?auto_465882 ) ) ( not ( = ?auto_465877 ?auto_465883 ) ) ( not ( = ?auto_465877 ?auto_465884 ) ) ( not ( = ?auto_465878 ?auto_465879 ) ) ( not ( = ?auto_465878 ?auto_465880 ) ) ( not ( = ?auto_465878 ?auto_465881 ) ) ( not ( = ?auto_465878 ?auto_465882 ) ) ( not ( = ?auto_465878 ?auto_465883 ) ) ( not ( = ?auto_465878 ?auto_465884 ) ) ( not ( = ?auto_465879 ?auto_465880 ) ) ( not ( = ?auto_465879 ?auto_465881 ) ) ( not ( = ?auto_465879 ?auto_465882 ) ) ( not ( = ?auto_465879 ?auto_465883 ) ) ( not ( = ?auto_465879 ?auto_465884 ) ) ( not ( = ?auto_465880 ?auto_465881 ) ) ( not ( = ?auto_465880 ?auto_465882 ) ) ( not ( = ?auto_465880 ?auto_465883 ) ) ( not ( = ?auto_465880 ?auto_465884 ) ) ( not ( = ?auto_465881 ?auto_465882 ) ) ( not ( = ?auto_465881 ?auto_465883 ) ) ( not ( = ?auto_465881 ?auto_465884 ) ) ( not ( = ?auto_465882 ?auto_465883 ) ) ( not ( = ?auto_465882 ?auto_465884 ) ) ( not ( = ?auto_465883 ?auto_465884 ) ) ( CLEAR ?auto_465881 ) ( ON ?auto_465882 ?auto_465883 ) ( CLEAR ?auto_465882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_465875 ?auto_465876 ?auto_465877 ?auto_465878 ?auto_465879 ?auto_465880 ?auto_465881 ?auto_465882 )
      ( MAKE-9PILE ?auto_465875 ?auto_465876 ?auto_465877 ?auto_465878 ?auto_465879 ?auto_465880 ?auto_465881 ?auto_465882 ?auto_465883 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_465913 - BLOCK
      ?auto_465914 - BLOCK
      ?auto_465915 - BLOCK
      ?auto_465916 - BLOCK
      ?auto_465917 - BLOCK
      ?auto_465918 - BLOCK
      ?auto_465919 - BLOCK
      ?auto_465920 - BLOCK
      ?auto_465921 - BLOCK
    )
    :vars
    (
      ?auto_465922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465921 ?auto_465922 ) ( ON-TABLE ?auto_465913 ) ( ON ?auto_465914 ?auto_465913 ) ( ON ?auto_465915 ?auto_465914 ) ( ON ?auto_465916 ?auto_465915 ) ( ON ?auto_465917 ?auto_465916 ) ( ON ?auto_465918 ?auto_465917 ) ( not ( = ?auto_465913 ?auto_465914 ) ) ( not ( = ?auto_465913 ?auto_465915 ) ) ( not ( = ?auto_465913 ?auto_465916 ) ) ( not ( = ?auto_465913 ?auto_465917 ) ) ( not ( = ?auto_465913 ?auto_465918 ) ) ( not ( = ?auto_465913 ?auto_465919 ) ) ( not ( = ?auto_465913 ?auto_465920 ) ) ( not ( = ?auto_465913 ?auto_465921 ) ) ( not ( = ?auto_465913 ?auto_465922 ) ) ( not ( = ?auto_465914 ?auto_465915 ) ) ( not ( = ?auto_465914 ?auto_465916 ) ) ( not ( = ?auto_465914 ?auto_465917 ) ) ( not ( = ?auto_465914 ?auto_465918 ) ) ( not ( = ?auto_465914 ?auto_465919 ) ) ( not ( = ?auto_465914 ?auto_465920 ) ) ( not ( = ?auto_465914 ?auto_465921 ) ) ( not ( = ?auto_465914 ?auto_465922 ) ) ( not ( = ?auto_465915 ?auto_465916 ) ) ( not ( = ?auto_465915 ?auto_465917 ) ) ( not ( = ?auto_465915 ?auto_465918 ) ) ( not ( = ?auto_465915 ?auto_465919 ) ) ( not ( = ?auto_465915 ?auto_465920 ) ) ( not ( = ?auto_465915 ?auto_465921 ) ) ( not ( = ?auto_465915 ?auto_465922 ) ) ( not ( = ?auto_465916 ?auto_465917 ) ) ( not ( = ?auto_465916 ?auto_465918 ) ) ( not ( = ?auto_465916 ?auto_465919 ) ) ( not ( = ?auto_465916 ?auto_465920 ) ) ( not ( = ?auto_465916 ?auto_465921 ) ) ( not ( = ?auto_465916 ?auto_465922 ) ) ( not ( = ?auto_465917 ?auto_465918 ) ) ( not ( = ?auto_465917 ?auto_465919 ) ) ( not ( = ?auto_465917 ?auto_465920 ) ) ( not ( = ?auto_465917 ?auto_465921 ) ) ( not ( = ?auto_465917 ?auto_465922 ) ) ( not ( = ?auto_465918 ?auto_465919 ) ) ( not ( = ?auto_465918 ?auto_465920 ) ) ( not ( = ?auto_465918 ?auto_465921 ) ) ( not ( = ?auto_465918 ?auto_465922 ) ) ( not ( = ?auto_465919 ?auto_465920 ) ) ( not ( = ?auto_465919 ?auto_465921 ) ) ( not ( = ?auto_465919 ?auto_465922 ) ) ( not ( = ?auto_465920 ?auto_465921 ) ) ( not ( = ?auto_465920 ?auto_465922 ) ) ( not ( = ?auto_465921 ?auto_465922 ) ) ( ON ?auto_465920 ?auto_465921 ) ( CLEAR ?auto_465918 ) ( ON ?auto_465919 ?auto_465920 ) ( CLEAR ?auto_465919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_465913 ?auto_465914 ?auto_465915 ?auto_465916 ?auto_465917 ?auto_465918 ?auto_465919 )
      ( MAKE-9PILE ?auto_465913 ?auto_465914 ?auto_465915 ?auto_465916 ?auto_465917 ?auto_465918 ?auto_465919 ?auto_465920 ?auto_465921 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_465951 - BLOCK
      ?auto_465952 - BLOCK
      ?auto_465953 - BLOCK
      ?auto_465954 - BLOCK
      ?auto_465955 - BLOCK
      ?auto_465956 - BLOCK
      ?auto_465957 - BLOCK
      ?auto_465958 - BLOCK
      ?auto_465959 - BLOCK
    )
    :vars
    (
      ?auto_465960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465959 ?auto_465960 ) ( ON-TABLE ?auto_465951 ) ( ON ?auto_465952 ?auto_465951 ) ( ON ?auto_465953 ?auto_465952 ) ( ON ?auto_465954 ?auto_465953 ) ( ON ?auto_465955 ?auto_465954 ) ( not ( = ?auto_465951 ?auto_465952 ) ) ( not ( = ?auto_465951 ?auto_465953 ) ) ( not ( = ?auto_465951 ?auto_465954 ) ) ( not ( = ?auto_465951 ?auto_465955 ) ) ( not ( = ?auto_465951 ?auto_465956 ) ) ( not ( = ?auto_465951 ?auto_465957 ) ) ( not ( = ?auto_465951 ?auto_465958 ) ) ( not ( = ?auto_465951 ?auto_465959 ) ) ( not ( = ?auto_465951 ?auto_465960 ) ) ( not ( = ?auto_465952 ?auto_465953 ) ) ( not ( = ?auto_465952 ?auto_465954 ) ) ( not ( = ?auto_465952 ?auto_465955 ) ) ( not ( = ?auto_465952 ?auto_465956 ) ) ( not ( = ?auto_465952 ?auto_465957 ) ) ( not ( = ?auto_465952 ?auto_465958 ) ) ( not ( = ?auto_465952 ?auto_465959 ) ) ( not ( = ?auto_465952 ?auto_465960 ) ) ( not ( = ?auto_465953 ?auto_465954 ) ) ( not ( = ?auto_465953 ?auto_465955 ) ) ( not ( = ?auto_465953 ?auto_465956 ) ) ( not ( = ?auto_465953 ?auto_465957 ) ) ( not ( = ?auto_465953 ?auto_465958 ) ) ( not ( = ?auto_465953 ?auto_465959 ) ) ( not ( = ?auto_465953 ?auto_465960 ) ) ( not ( = ?auto_465954 ?auto_465955 ) ) ( not ( = ?auto_465954 ?auto_465956 ) ) ( not ( = ?auto_465954 ?auto_465957 ) ) ( not ( = ?auto_465954 ?auto_465958 ) ) ( not ( = ?auto_465954 ?auto_465959 ) ) ( not ( = ?auto_465954 ?auto_465960 ) ) ( not ( = ?auto_465955 ?auto_465956 ) ) ( not ( = ?auto_465955 ?auto_465957 ) ) ( not ( = ?auto_465955 ?auto_465958 ) ) ( not ( = ?auto_465955 ?auto_465959 ) ) ( not ( = ?auto_465955 ?auto_465960 ) ) ( not ( = ?auto_465956 ?auto_465957 ) ) ( not ( = ?auto_465956 ?auto_465958 ) ) ( not ( = ?auto_465956 ?auto_465959 ) ) ( not ( = ?auto_465956 ?auto_465960 ) ) ( not ( = ?auto_465957 ?auto_465958 ) ) ( not ( = ?auto_465957 ?auto_465959 ) ) ( not ( = ?auto_465957 ?auto_465960 ) ) ( not ( = ?auto_465958 ?auto_465959 ) ) ( not ( = ?auto_465958 ?auto_465960 ) ) ( not ( = ?auto_465959 ?auto_465960 ) ) ( ON ?auto_465958 ?auto_465959 ) ( ON ?auto_465957 ?auto_465958 ) ( CLEAR ?auto_465955 ) ( ON ?auto_465956 ?auto_465957 ) ( CLEAR ?auto_465956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_465951 ?auto_465952 ?auto_465953 ?auto_465954 ?auto_465955 ?auto_465956 )
      ( MAKE-9PILE ?auto_465951 ?auto_465952 ?auto_465953 ?auto_465954 ?auto_465955 ?auto_465956 ?auto_465957 ?auto_465958 ?auto_465959 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_465989 - BLOCK
      ?auto_465990 - BLOCK
      ?auto_465991 - BLOCK
      ?auto_465992 - BLOCK
      ?auto_465993 - BLOCK
      ?auto_465994 - BLOCK
      ?auto_465995 - BLOCK
      ?auto_465996 - BLOCK
      ?auto_465997 - BLOCK
    )
    :vars
    (
      ?auto_465998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_465997 ?auto_465998 ) ( ON-TABLE ?auto_465989 ) ( ON ?auto_465990 ?auto_465989 ) ( ON ?auto_465991 ?auto_465990 ) ( ON ?auto_465992 ?auto_465991 ) ( not ( = ?auto_465989 ?auto_465990 ) ) ( not ( = ?auto_465989 ?auto_465991 ) ) ( not ( = ?auto_465989 ?auto_465992 ) ) ( not ( = ?auto_465989 ?auto_465993 ) ) ( not ( = ?auto_465989 ?auto_465994 ) ) ( not ( = ?auto_465989 ?auto_465995 ) ) ( not ( = ?auto_465989 ?auto_465996 ) ) ( not ( = ?auto_465989 ?auto_465997 ) ) ( not ( = ?auto_465989 ?auto_465998 ) ) ( not ( = ?auto_465990 ?auto_465991 ) ) ( not ( = ?auto_465990 ?auto_465992 ) ) ( not ( = ?auto_465990 ?auto_465993 ) ) ( not ( = ?auto_465990 ?auto_465994 ) ) ( not ( = ?auto_465990 ?auto_465995 ) ) ( not ( = ?auto_465990 ?auto_465996 ) ) ( not ( = ?auto_465990 ?auto_465997 ) ) ( not ( = ?auto_465990 ?auto_465998 ) ) ( not ( = ?auto_465991 ?auto_465992 ) ) ( not ( = ?auto_465991 ?auto_465993 ) ) ( not ( = ?auto_465991 ?auto_465994 ) ) ( not ( = ?auto_465991 ?auto_465995 ) ) ( not ( = ?auto_465991 ?auto_465996 ) ) ( not ( = ?auto_465991 ?auto_465997 ) ) ( not ( = ?auto_465991 ?auto_465998 ) ) ( not ( = ?auto_465992 ?auto_465993 ) ) ( not ( = ?auto_465992 ?auto_465994 ) ) ( not ( = ?auto_465992 ?auto_465995 ) ) ( not ( = ?auto_465992 ?auto_465996 ) ) ( not ( = ?auto_465992 ?auto_465997 ) ) ( not ( = ?auto_465992 ?auto_465998 ) ) ( not ( = ?auto_465993 ?auto_465994 ) ) ( not ( = ?auto_465993 ?auto_465995 ) ) ( not ( = ?auto_465993 ?auto_465996 ) ) ( not ( = ?auto_465993 ?auto_465997 ) ) ( not ( = ?auto_465993 ?auto_465998 ) ) ( not ( = ?auto_465994 ?auto_465995 ) ) ( not ( = ?auto_465994 ?auto_465996 ) ) ( not ( = ?auto_465994 ?auto_465997 ) ) ( not ( = ?auto_465994 ?auto_465998 ) ) ( not ( = ?auto_465995 ?auto_465996 ) ) ( not ( = ?auto_465995 ?auto_465997 ) ) ( not ( = ?auto_465995 ?auto_465998 ) ) ( not ( = ?auto_465996 ?auto_465997 ) ) ( not ( = ?auto_465996 ?auto_465998 ) ) ( not ( = ?auto_465997 ?auto_465998 ) ) ( ON ?auto_465996 ?auto_465997 ) ( ON ?auto_465995 ?auto_465996 ) ( ON ?auto_465994 ?auto_465995 ) ( CLEAR ?auto_465992 ) ( ON ?auto_465993 ?auto_465994 ) ( CLEAR ?auto_465993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_465989 ?auto_465990 ?auto_465991 ?auto_465992 ?auto_465993 )
      ( MAKE-9PILE ?auto_465989 ?auto_465990 ?auto_465991 ?auto_465992 ?auto_465993 ?auto_465994 ?auto_465995 ?auto_465996 ?auto_465997 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_466027 - BLOCK
      ?auto_466028 - BLOCK
      ?auto_466029 - BLOCK
      ?auto_466030 - BLOCK
      ?auto_466031 - BLOCK
      ?auto_466032 - BLOCK
      ?auto_466033 - BLOCK
      ?auto_466034 - BLOCK
      ?auto_466035 - BLOCK
    )
    :vars
    (
      ?auto_466036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466035 ?auto_466036 ) ( ON-TABLE ?auto_466027 ) ( ON ?auto_466028 ?auto_466027 ) ( ON ?auto_466029 ?auto_466028 ) ( not ( = ?auto_466027 ?auto_466028 ) ) ( not ( = ?auto_466027 ?auto_466029 ) ) ( not ( = ?auto_466027 ?auto_466030 ) ) ( not ( = ?auto_466027 ?auto_466031 ) ) ( not ( = ?auto_466027 ?auto_466032 ) ) ( not ( = ?auto_466027 ?auto_466033 ) ) ( not ( = ?auto_466027 ?auto_466034 ) ) ( not ( = ?auto_466027 ?auto_466035 ) ) ( not ( = ?auto_466027 ?auto_466036 ) ) ( not ( = ?auto_466028 ?auto_466029 ) ) ( not ( = ?auto_466028 ?auto_466030 ) ) ( not ( = ?auto_466028 ?auto_466031 ) ) ( not ( = ?auto_466028 ?auto_466032 ) ) ( not ( = ?auto_466028 ?auto_466033 ) ) ( not ( = ?auto_466028 ?auto_466034 ) ) ( not ( = ?auto_466028 ?auto_466035 ) ) ( not ( = ?auto_466028 ?auto_466036 ) ) ( not ( = ?auto_466029 ?auto_466030 ) ) ( not ( = ?auto_466029 ?auto_466031 ) ) ( not ( = ?auto_466029 ?auto_466032 ) ) ( not ( = ?auto_466029 ?auto_466033 ) ) ( not ( = ?auto_466029 ?auto_466034 ) ) ( not ( = ?auto_466029 ?auto_466035 ) ) ( not ( = ?auto_466029 ?auto_466036 ) ) ( not ( = ?auto_466030 ?auto_466031 ) ) ( not ( = ?auto_466030 ?auto_466032 ) ) ( not ( = ?auto_466030 ?auto_466033 ) ) ( not ( = ?auto_466030 ?auto_466034 ) ) ( not ( = ?auto_466030 ?auto_466035 ) ) ( not ( = ?auto_466030 ?auto_466036 ) ) ( not ( = ?auto_466031 ?auto_466032 ) ) ( not ( = ?auto_466031 ?auto_466033 ) ) ( not ( = ?auto_466031 ?auto_466034 ) ) ( not ( = ?auto_466031 ?auto_466035 ) ) ( not ( = ?auto_466031 ?auto_466036 ) ) ( not ( = ?auto_466032 ?auto_466033 ) ) ( not ( = ?auto_466032 ?auto_466034 ) ) ( not ( = ?auto_466032 ?auto_466035 ) ) ( not ( = ?auto_466032 ?auto_466036 ) ) ( not ( = ?auto_466033 ?auto_466034 ) ) ( not ( = ?auto_466033 ?auto_466035 ) ) ( not ( = ?auto_466033 ?auto_466036 ) ) ( not ( = ?auto_466034 ?auto_466035 ) ) ( not ( = ?auto_466034 ?auto_466036 ) ) ( not ( = ?auto_466035 ?auto_466036 ) ) ( ON ?auto_466034 ?auto_466035 ) ( ON ?auto_466033 ?auto_466034 ) ( ON ?auto_466032 ?auto_466033 ) ( ON ?auto_466031 ?auto_466032 ) ( CLEAR ?auto_466029 ) ( ON ?auto_466030 ?auto_466031 ) ( CLEAR ?auto_466030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_466027 ?auto_466028 ?auto_466029 ?auto_466030 )
      ( MAKE-9PILE ?auto_466027 ?auto_466028 ?auto_466029 ?auto_466030 ?auto_466031 ?auto_466032 ?auto_466033 ?auto_466034 ?auto_466035 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_466065 - BLOCK
      ?auto_466066 - BLOCK
      ?auto_466067 - BLOCK
      ?auto_466068 - BLOCK
      ?auto_466069 - BLOCK
      ?auto_466070 - BLOCK
      ?auto_466071 - BLOCK
      ?auto_466072 - BLOCK
      ?auto_466073 - BLOCK
    )
    :vars
    (
      ?auto_466074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466073 ?auto_466074 ) ( ON-TABLE ?auto_466065 ) ( ON ?auto_466066 ?auto_466065 ) ( not ( = ?auto_466065 ?auto_466066 ) ) ( not ( = ?auto_466065 ?auto_466067 ) ) ( not ( = ?auto_466065 ?auto_466068 ) ) ( not ( = ?auto_466065 ?auto_466069 ) ) ( not ( = ?auto_466065 ?auto_466070 ) ) ( not ( = ?auto_466065 ?auto_466071 ) ) ( not ( = ?auto_466065 ?auto_466072 ) ) ( not ( = ?auto_466065 ?auto_466073 ) ) ( not ( = ?auto_466065 ?auto_466074 ) ) ( not ( = ?auto_466066 ?auto_466067 ) ) ( not ( = ?auto_466066 ?auto_466068 ) ) ( not ( = ?auto_466066 ?auto_466069 ) ) ( not ( = ?auto_466066 ?auto_466070 ) ) ( not ( = ?auto_466066 ?auto_466071 ) ) ( not ( = ?auto_466066 ?auto_466072 ) ) ( not ( = ?auto_466066 ?auto_466073 ) ) ( not ( = ?auto_466066 ?auto_466074 ) ) ( not ( = ?auto_466067 ?auto_466068 ) ) ( not ( = ?auto_466067 ?auto_466069 ) ) ( not ( = ?auto_466067 ?auto_466070 ) ) ( not ( = ?auto_466067 ?auto_466071 ) ) ( not ( = ?auto_466067 ?auto_466072 ) ) ( not ( = ?auto_466067 ?auto_466073 ) ) ( not ( = ?auto_466067 ?auto_466074 ) ) ( not ( = ?auto_466068 ?auto_466069 ) ) ( not ( = ?auto_466068 ?auto_466070 ) ) ( not ( = ?auto_466068 ?auto_466071 ) ) ( not ( = ?auto_466068 ?auto_466072 ) ) ( not ( = ?auto_466068 ?auto_466073 ) ) ( not ( = ?auto_466068 ?auto_466074 ) ) ( not ( = ?auto_466069 ?auto_466070 ) ) ( not ( = ?auto_466069 ?auto_466071 ) ) ( not ( = ?auto_466069 ?auto_466072 ) ) ( not ( = ?auto_466069 ?auto_466073 ) ) ( not ( = ?auto_466069 ?auto_466074 ) ) ( not ( = ?auto_466070 ?auto_466071 ) ) ( not ( = ?auto_466070 ?auto_466072 ) ) ( not ( = ?auto_466070 ?auto_466073 ) ) ( not ( = ?auto_466070 ?auto_466074 ) ) ( not ( = ?auto_466071 ?auto_466072 ) ) ( not ( = ?auto_466071 ?auto_466073 ) ) ( not ( = ?auto_466071 ?auto_466074 ) ) ( not ( = ?auto_466072 ?auto_466073 ) ) ( not ( = ?auto_466072 ?auto_466074 ) ) ( not ( = ?auto_466073 ?auto_466074 ) ) ( ON ?auto_466072 ?auto_466073 ) ( ON ?auto_466071 ?auto_466072 ) ( ON ?auto_466070 ?auto_466071 ) ( ON ?auto_466069 ?auto_466070 ) ( ON ?auto_466068 ?auto_466069 ) ( CLEAR ?auto_466066 ) ( ON ?auto_466067 ?auto_466068 ) ( CLEAR ?auto_466067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_466065 ?auto_466066 ?auto_466067 )
      ( MAKE-9PILE ?auto_466065 ?auto_466066 ?auto_466067 ?auto_466068 ?auto_466069 ?auto_466070 ?auto_466071 ?auto_466072 ?auto_466073 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_466103 - BLOCK
      ?auto_466104 - BLOCK
      ?auto_466105 - BLOCK
      ?auto_466106 - BLOCK
      ?auto_466107 - BLOCK
      ?auto_466108 - BLOCK
      ?auto_466109 - BLOCK
      ?auto_466110 - BLOCK
      ?auto_466111 - BLOCK
    )
    :vars
    (
      ?auto_466112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466111 ?auto_466112 ) ( ON-TABLE ?auto_466103 ) ( not ( = ?auto_466103 ?auto_466104 ) ) ( not ( = ?auto_466103 ?auto_466105 ) ) ( not ( = ?auto_466103 ?auto_466106 ) ) ( not ( = ?auto_466103 ?auto_466107 ) ) ( not ( = ?auto_466103 ?auto_466108 ) ) ( not ( = ?auto_466103 ?auto_466109 ) ) ( not ( = ?auto_466103 ?auto_466110 ) ) ( not ( = ?auto_466103 ?auto_466111 ) ) ( not ( = ?auto_466103 ?auto_466112 ) ) ( not ( = ?auto_466104 ?auto_466105 ) ) ( not ( = ?auto_466104 ?auto_466106 ) ) ( not ( = ?auto_466104 ?auto_466107 ) ) ( not ( = ?auto_466104 ?auto_466108 ) ) ( not ( = ?auto_466104 ?auto_466109 ) ) ( not ( = ?auto_466104 ?auto_466110 ) ) ( not ( = ?auto_466104 ?auto_466111 ) ) ( not ( = ?auto_466104 ?auto_466112 ) ) ( not ( = ?auto_466105 ?auto_466106 ) ) ( not ( = ?auto_466105 ?auto_466107 ) ) ( not ( = ?auto_466105 ?auto_466108 ) ) ( not ( = ?auto_466105 ?auto_466109 ) ) ( not ( = ?auto_466105 ?auto_466110 ) ) ( not ( = ?auto_466105 ?auto_466111 ) ) ( not ( = ?auto_466105 ?auto_466112 ) ) ( not ( = ?auto_466106 ?auto_466107 ) ) ( not ( = ?auto_466106 ?auto_466108 ) ) ( not ( = ?auto_466106 ?auto_466109 ) ) ( not ( = ?auto_466106 ?auto_466110 ) ) ( not ( = ?auto_466106 ?auto_466111 ) ) ( not ( = ?auto_466106 ?auto_466112 ) ) ( not ( = ?auto_466107 ?auto_466108 ) ) ( not ( = ?auto_466107 ?auto_466109 ) ) ( not ( = ?auto_466107 ?auto_466110 ) ) ( not ( = ?auto_466107 ?auto_466111 ) ) ( not ( = ?auto_466107 ?auto_466112 ) ) ( not ( = ?auto_466108 ?auto_466109 ) ) ( not ( = ?auto_466108 ?auto_466110 ) ) ( not ( = ?auto_466108 ?auto_466111 ) ) ( not ( = ?auto_466108 ?auto_466112 ) ) ( not ( = ?auto_466109 ?auto_466110 ) ) ( not ( = ?auto_466109 ?auto_466111 ) ) ( not ( = ?auto_466109 ?auto_466112 ) ) ( not ( = ?auto_466110 ?auto_466111 ) ) ( not ( = ?auto_466110 ?auto_466112 ) ) ( not ( = ?auto_466111 ?auto_466112 ) ) ( ON ?auto_466110 ?auto_466111 ) ( ON ?auto_466109 ?auto_466110 ) ( ON ?auto_466108 ?auto_466109 ) ( ON ?auto_466107 ?auto_466108 ) ( ON ?auto_466106 ?auto_466107 ) ( ON ?auto_466105 ?auto_466106 ) ( CLEAR ?auto_466103 ) ( ON ?auto_466104 ?auto_466105 ) ( CLEAR ?auto_466104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_466103 ?auto_466104 )
      ( MAKE-9PILE ?auto_466103 ?auto_466104 ?auto_466105 ?auto_466106 ?auto_466107 ?auto_466108 ?auto_466109 ?auto_466110 ?auto_466111 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_466141 - BLOCK
      ?auto_466142 - BLOCK
      ?auto_466143 - BLOCK
      ?auto_466144 - BLOCK
      ?auto_466145 - BLOCK
      ?auto_466146 - BLOCK
      ?auto_466147 - BLOCK
      ?auto_466148 - BLOCK
      ?auto_466149 - BLOCK
    )
    :vars
    (
      ?auto_466150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466149 ?auto_466150 ) ( not ( = ?auto_466141 ?auto_466142 ) ) ( not ( = ?auto_466141 ?auto_466143 ) ) ( not ( = ?auto_466141 ?auto_466144 ) ) ( not ( = ?auto_466141 ?auto_466145 ) ) ( not ( = ?auto_466141 ?auto_466146 ) ) ( not ( = ?auto_466141 ?auto_466147 ) ) ( not ( = ?auto_466141 ?auto_466148 ) ) ( not ( = ?auto_466141 ?auto_466149 ) ) ( not ( = ?auto_466141 ?auto_466150 ) ) ( not ( = ?auto_466142 ?auto_466143 ) ) ( not ( = ?auto_466142 ?auto_466144 ) ) ( not ( = ?auto_466142 ?auto_466145 ) ) ( not ( = ?auto_466142 ?auto_466146 ) ) ( not ( = ?auto_466142 ?auto_466147 ) ) ( not ( = ?auto_466142 ?auto_466148 ) ) ( not ( = ?auto_466142 ?auto_466149 ) ) ( not ( = ?auto_466142 ?auto_466150 ) ) ( not ( = ?auto_466143 ?auto_466144 ) ) ( not ( = ?auto_466143 ?auto_466145 ) ) ( not ( = ?auto_466143 ?auto_466146 ) ) ( not ( = ?auto_466143 ?auto_466147 ) ) ( not ( = ?auto_466143 ?auto_466148 ) ) ( not ( = ?auto_466143 ?auto_466149 ) ) ( not ( = ?auto_466143 ?auto_466150 ) ) ( not ( = ?auto_466144 ?auto_466145 ) ) ( not ( = ?auto_466144 ?auto_466146 ) ) ( not ( = ?auto_466144 ?auto_466147 ) ) ( not ( = ?auto_466144 ?auto_466148 ) ) ( not ( = ?auto_466144 ?auto_466149 ) ) ( not ( = ?auto_466144 ?auto_466150 ) ) ( not ( = ?auto_466145 ?auto_466146 ) ) ( not ( = ?auto_466145 ?auto_466147 ) ) ( not ( = ?auto_466145 ?auto_466148 ) ) ( not ( = ?auto_466145 ?auto_466149 ) ) ( not ( = ?auto_466145 ?auto_466150 ) ) ( not ( = ?auto_466146 ?auto_466147 ) ) ( not ( = ?auto_466146 ?auto_466148 ) ) ( not ( = ?auto_466146 ?auto_466149 ) ) ( not ( = ?auto_466146 ?auto_466150 ) ) ( not ( = ?auto_466147 ?auto_466148 ) ) ( not ( = ?auto_466147 ?auto_466149 ) ) ( not ( = ?auto_466147 ?auto_466150 ) ) ( not ( = ?auto_466148 ?auto_466149 ) ) ( not ( = ?auto_466148 ?auto_466150 ) ) ( not ( = ?auto_466149 ?auto_466150 ) ) ( ON ?auto_466148 ?auto_466149 ) ( ON ?auto_466147 ?auto_466148 ) ( ON ?auto_466146 ?auto_466147 ) ( ON ?auto_466145 ?auto_466146 ) ( ON ?auto_466144 ?auto_466145 ) ( ON ?auto_466143 ?auto_466144 ) ( ON ?auto_466142 ?auto_466143 ) ( ON ?auto_466141 ?auto_466142 ) ( CLEAR ?auto_466141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_466141 )
      ( MAKE-9PILE ?auto_466141 ?auto_466142 ?auto_466143 ?auto_466144 ?auto_466145 ?auto_466146 ?auto_466147 ?auto_466148 ?auto_466149 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_466180 - BLOCK
      ?auto_466181 - BLOCK
      ?auto_466182 - BLOCK
      ?auto_466183 - BLOCK
      ?auto_466184 - BLOCK
      ?auto_466185 - BLOCK
      ?auto_466186 - BLOCK
      ?auto_466187 - BLOCK
      ?auto_466188 - BLOCK
      ?auto_466189 - BLOCK
    )
    :vars
    (
      ?auto_466190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_466188 ) ( ON ?auto_466189 ?auto_466190 ) ( CLEAR ?auto_466189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_466180 ) ( ON ?auto_466181 ?auto_466180 ) ( ON ?auto_466182 ?auto_466181 ) ( ON ?auto_466183 ?auto_466182 ) ( ON ?auto_466184 ?auto_466183 ) ( ON ?auto_466185 ?auto_466184 ) ( ON ?auto_466186 ?auto_466185 ) ( ON ?auto_466187 ?auto_466186 ) ( ON ?auto_466188 ?auto_466187 ) ( not ( = ?auto_466180 ?auto_466181 ) ) ( not ( = ?auto_466180 ?auto_466182 ) ) ( not ( = ?auto_466180 ?auto_466183 ) ) ( not ( = ?auto_466180 ?auto_466184 ) ) ( not ( = ?auto_466180 ?auto_466185 ) ) ( not ( = ?auto_466180 ?auto_466186 ) ) ( not ( = ?auto_466180 ?auto_466187 ) ) ( not ( = ?auto_466180 ?auto_466188 ) ) ( not ( = ?auto_466180 ?auto_466189 ) ) ( not ( = ?auto_466180 ?auto_466190 ) ) ( not ( = ?auto_466181 ?auto_466182 ) ) ( not ( = ?auto_466181 ?auto_466183 ) ) ( not ( = ?auto_466181 ?auto_466184 ) ) ( not ( = ?auto_466181 ?auto_466185 ) ) ( not ( = ?auto_466181 ?auto_466186 ) ) ( not ( = ?auto_466181 ?auto_466187 ) ) ( not ( = ?auto_466181 ?auto_466188 ) ) ( not ( = ?auto_466181 ?auto_466189 ) ) ( not ( = ?auto_466181 ?auto_466190 ) ) ( not ( = ?auto_466182 ?auto_466183 ) ) ( not ( = ?auto_466182 ?auto_466184 ) ) ( not ( = ?auto_466182 ?auto_466185 ) ) ( not ( = ?auto_466182 ?auto_466186 ) ) ( not ( = ?auto_466182 ?auto_466187 ) ) ( not ( = ?auto_466182 ?auto_466188 ) ) ( not ( = ?auto_466182 ?auto_466189 ) ) ( not ( = ?auto_466182 ?auto_466190 ) ) ( not ( = ?auto_466183 ?auto_466184 ) ) ( not ( = ?auto_466183 ?auto_466185 ) ) ( not ( = ?auto_466183 ?auto_466186 ) ) ( not ( = ?auto_466183 ?auto_466187 ) ) ( not ( = ?auto_466183 ?auto_466188 ) ) ( not ( = ?auto_466183 ?auto_466189 ) ) ( not ( = ?auto_466183 ?auto_466190 ) ) ( not ( = ?auto_466184 ?auto_466185 ) ) ( not ( = ?auto_466184 ?auto_466186 ) ) ( not ( = ?auto_466184 ?auto_466187 ) ) ( not ( = ?auto_466184 ?auto_466188 ) ) ( not ( = ?auto_466184 ?auto_466189 ) ) ( not ( = ?auto_466184 ?auto_466190 ) ) ( not ( = ?auto_466185 ?auto_466186 ) ) ( not ( = ?auto_466185 ?auto_466187 ) ) ( not ( = ?auto_466185 ?auto_466188 ) ) ( not ( = ?auto_466185 ?auto_466189 ) ) ( not ( = ?auto_466185 ?auto_466190 ) ) ( not ( = ?auto_466186 ?auto_466187 ) ) ( not ( = ?auto_466186 ?auto_466188 ) ) ( not ( = ?auto_466186 ?auto_466189 ) ) ( not ( = ?auto_466186 ?auto_466190 ) ) ( not ( = ?auto_466187 ?auto_466188 ) ) ( not ( = ?auto_466187 ?auto_466189 ) ) ( not ( = ?auto_466187 ?auto_466190 ) ) ( not ( = ?auto_466188 ?auto_466189 ) ) ( not ( = ?auto_466188 ?auto_466190 ) ) ( not ( = ?auto_466189 ?auto_466190 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_466189 ?auto_466190 )
      ( !STACK ?auto_466189 ?auto_466188 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_466222 - BLOCK
      ?auto_466223 - BLOCK
      ?auto_466224 - BLOCK
      ?auto_466225 - BLOCK
      ?auto_466226 - BLOCK
      ?auto_466227 - BLOCK
      ?auto_466228 - BLOCK
      ?auto_466229 - BLOCK
      ?auto_466230 - BLOCK
      ?auto_466231 - BLOCK
    )
    :vars
    (
      ?auto_466232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466231 ?auto_466232 ) ( ON-TABLE ?auto_466222 ) ( ON ?auto_466223 ?auto_466222 ) ( ON ?auto_466224 ?auto_466223 ) ( ON ?auto_466225 ?auto_466224 ) ( ON ?auto_466226 ?auto_466225 ) ( ON ?auto_466227 ?auto_466226 ) ( ON ?auto_466228 ?auto_466227 ) ( ON ?auto_466229 ?auto_466228 ) ( not ( = ?auto_466222 ?auto_466223 ) ) ( not ( = ?auto_466222 ?auto_466224 ) ) ( not ( = ?auto_466222 ?auto_466225 ) ) ( not ( = ?auto_466222 ?auto_466226 ) ) ( not ( = ?auto_466222 ?auto_466227 ) ) ( not ( = ?auto_466222 ?auto_466228 ) ) ( not ( = ?auto_466222 ?auto_466229 ) ) ( not ( = ?auto_466222 ?auto_466230 ) ) ( not ( = ?auto_466222 ?auto_466231 ) ) ( not ( = ?auto_466222 ?auto_466232 ) ) ( not ( = ?auto_466223 ?auto_466224 ) ) ( not ( = ?auto_466223 ?auto_466225 ) ) ( not ( = ?auto_466223 ?auto_466226 ) ) ( not ( = ?auto_466223 ?auto_466227 ) ) ( not ( = ?auto_466223 ?auto_466228 ) ) ( not ( = ?auto_466223 ?auto_466229 ) ) ( not ( = ?auto_466223 ?auto_466230 ) ) ( not ( = ?auto_466223 ?auto_466231 ) ) ( not ( = ?auto_466223 ?auto_466232 ) ) ( not ( = ?auto_466224 ?auto_466225 ) ) ( not ( = ?auto_466224 ?auto_466226 ) ) ( not ( = ?auto_466224 ?auto_466227 ) ) ( not ( = ?auto_466224 ?auto_466228 ) ) ( not ( = ?auto_466224 ?auto_466229 ) ) ( not ( = ?auto_466224 ?auto_466230 ) ) ( not ( = ?auto_466224 ?auto_466231 ) ) ( not ( = ?auto_466224 ?auto_466232 ) ) ( not ( = ?auto_466225 ?auto_466226 ) ) ( not ( = ?auto_466225 ?auto_466227 ) ) ( not ( = ?auto_466225 ?auto_466228 ) ) ( not ( = ?auto_466225 ?auto_466229 ) ) ( not ( = ?auto_466225 ?auto_466230 ) ) ( not ( = ?auto_466225 ?auto_466231 ) ) ( not ( = ?auto_466225 ?auto_466232 ) ) ( not ( = ?auto_466226 ?auto_466227 ) ) ( not ( = ?auto_466226 ?auto_466228 ) ) ( not ( = ?auto_466226 ?auto_466229 ) ) ( not ( = ?auto_466226 ?auto_466230 ) ) ( not ( = ?auto_466226 ?auto_466231 ) ) ( not ( = ?auto_466226 ?auto_466232 ) ) ( not ( = ?auto_466227 ?auto_466228 ) ) ( not ( = ?auto_466227 ?auto_466229 ) ) ( not ( = ?auto_466227 ?auto_466230 ) ) ( not ( = ?auto_466227 ?auto_466231 ) ) ( not ( = ?auto_466227 ?auto_466232 ) ) ( not ( = ?auto_466228 ?auto_466229 ) ) ( not ( = ?auto_466228 ?auto_466230 ) ) ( not ( = ?auto_466228 ?auto_466231 ) ) ( not ( = ?auto_466228 ?auto_466232 ) ) ( not ( = ?auto_466229 ?auto_466230 ) ) ( not ( = ?auto_466229 ?auto_466231 ) ) ( not ( = ?auto_466229 ?auto_466232 ) ) ( not ( = ?auto_466230 ?auto_466231 ) ) ( not ( = ?auto_466230 ?auto_466232 ) ) ( not ( = ?auto_466231 ?auto_466232 ) ) ( CLEAR ?auto_466229 ) ( ON ?auto_466230 ?auto_466231 ) ( CLEAR ?auto_466230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_466222 ?auto_466223 ?auto_466224 ?auto_466225 ?auto_466226 ?auto_466227 ?auto_466228 ?auto_466229 ?auto_466230 )
      ( MAKE-10PILE ?auto_466222 ?auto_466223 ?auto_466224 ?auto_466225 ?auto_466226 ?auto_466227 ?auto_466228 ?auto_466229 ?auto_466230 ?auto_466231 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_466264 - BLOCK
      ?auto_466265 - BLOCK
      ?auto_466266 - BLOCK
      ?auto_466267 - BLOCK
      ?auto_466268 - BLOCK
      ?auto_466269 - BLOCK
      ?auto_466270 - BLOCK
      ?auto_466271 - BLOCK
      ?auto_466272 - BLOCK
      ?auto_466273 - BLOCK
    )
    :vars
    (
      ?auto_466274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466273 ?auto_466274 ) ( ON-TABLE ?auto_466264 ) ( ON ?auto_466265 ?auto_466264 ) ( ON ?auto_466266 ?auto_466265 ) ( ON ?auto_466267 ?auto_466266 ) ( ON ?auto_466268 ?auto_466267 ) ( ON ?auto_466269 ?auto_466268 ) ( ON ?auto_466270 ?auto_466269 ) ( not ( = ?auto_466264 ?auto_466265 ) ) ( not ( = ?auto_466264 ?auto_466266 ) ) ( not ( = ?auto_466264 ?auto_466267 ) ) ( not ( = ?auto_466264 ?auto_466268 ) ) ( not ( = ?auto_466264 ?auto_466269 ) ) ( not ( = ?auto_466264 ?auto_466270 ) ) ( not ( = ?auto_466264 ?auto_466271 ) ) ( not ( = ?auto_466264 ?auto_466272 ) ) ( not ( = ?auto_466264 ?auto_466273 ) ) ( not ( = ?auto_466264 ?auto_466274 ) ) ( not ( = ?auto_466265 ?auto_466266 ) ) ( not ( = ?auto_466265 ?auto_466267 ) ) ( not ( = ?auto_466265 ?auto_466268 ) ) ( not ( = ?auto_466265 ?auto_466269 ) ) ( not ( = ?auto_466265 ?auto_466270 ) ) ( not ( = ?auto_466265 ?auto_466271 ) ) ( not ( = ?auto_466265 ?auto_466272 ) ) ( not ( = ?auto_466265 ?auto_466273 ) ) ( not ( = ?auto_466265 ?auto_466274 ) ) ( not ( = ?auto_466266 ?auto_466267 ) ) ( not ( = ?auto_466266 ?auto_466268 ) ) ( not ( = ?auto_466266 ?auto_466269 ) ) ( not ( = ?auto_466266 ?auto_466270 ) ) ( not ( = ?auto_466266 ?auto_466271 ) ) ( not ( = ?auto_466266 ?auto_466272 ) ) ( not ( = ?auto_466266 ?auto_466273 ) ) ( not ( = ?auto_466266 ?auto_466274 ) ) ( not ( = ?auto_466267 ?auto_466268 ) ) ( not ( = ?auto_466267 ?auto_466269 ) ) ( not ( = ?auto_466267 ?auto_466270 ) ) ( not ( = ?auto_466267 ?auto_466271 ) ) ( not ( = ?auto_466267 ?auto_466272 ) ) ( not ( = ?auto_466267 ?auto_466273 ) ) ( not ( = ?auto_466267 ?auto_466274 ) ) ( not ( = ?auto_466268 ?auto_466269 ) ) ( not ( = ?auto_466268 ?auto_466270 ) ) ( not ( = ?auto_466268 ?auto_466271 ) ) ( not ( = ?auto_466268 ?auto_466272 ) ) ( not ( = ?auto_466268 ?auto_466273 ) ) ( not ( = ?auto_466268 ?auto_466274 ) ) ( not ( = ?auto_466269 ?auto_466270 ) ) ( not ( = ?auto_466269 ?auto_466271 ) ) ( not ( = ?auto_466269 ?auto_466272 ) ) ( not ( = ?auto_466269 ?auto_466273 ) ) ( not ( = ?auto_466269 ?auto_466274 ) ) ( not ( = ?auto_466270 ?auto_466271 ) ) ( not ( = ?auto_466270 ?auto_466272 ) ) ( not ( = ?auto_466270 ?auto_466273 ) ) ( not ( = ?auto_466270 ?auto_466274 ) ) ( not ( = ?auto_466271 ?auto_466272 ) ) ( not ( = ?auto_466271 ?auto_466273 ) ) ( not ( = ?auto_466271 ?auto_466274 ) ) ( not ( = ?auto_466272 ?auto_466273 ) ) ( not ( = ?auto_466272 ?auto_466274 ) ) ( not ( = ?auto_466273 ?auto_466274 ) ) ( ON ?auto_466272 ?auto_466273 ) ( CLEAR ?auto_466270 ) ( ON ?auto_466271 ?auto_466272 ) ( CLEAR ?auto_466271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_466264 ?auto_466265 ?auto_466266 ?auto_466267 ?auto_466268 ?auto_466269 ?auto_466270 ?auto_466271 )
      ( MAKE-10PILE ?auto_466264 ?auto_466265 ?auto_466266 ?auto_466267 ?auto_466268 ?auto_466269 ?auto_466270 ?auto_466271 ?auto_466272 ?auto_466273 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_466306 - BLOCK
      ?auto_466307 - BLOCK
      ?auto_466308 - BLOCK
      ?auto_466309 - BLOCK
      ?auto_466310 - BLOCK
      ?auto_466311 - BLOCK
      ?auto_466312 - BLOCK
      ?auto_466313 - BLOCK
      ?auto_466314 - BLOCK
      ?auto_466315 - BLOCK
    )
    :vars
    (
      ?auto_466316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466315 ?auto_466316 ) ( ON-TABLE ?auto_466306 ) ( ON ?auto_466307 ?auto_466306 ) ( ON ?auto_466308 ?auto_466307 ) ( ON ?auto_466309 ?auto_466308 ) ( ON ?auto_466310 ?auto_466309 ) ( ON ?auto_466311 ?auto_466310 ) ( not ( = ?auto_466306 ?auto_466307 ) ) ( not ( = ?auto_466306 ?auto_466308 ) ) ( not ( = ?auto_466306 ?auto_466309 ) ) ( not ( = ?auto_466306 ?auto_466310 ) ) ( not ( = ?auto_466306 ?auto_466311 ) ) ( not ( = ?auto_466306 ?auto_466312 ) ) ( not ( = ?auto_466306 ?auto_466313 ) ) ( not ( = ?auto_466306 ?auto_466314 ) ) ( not ( = ?auto_466306 ?auto_466315 ) ) ( not ( = ?auto_466306 ?auto_466316 ) ) ( not ( = ?auto_466307 ?auto_466308 ) ) ( not ( = ?auto_466307 ?auto_466309 ) ) ( not ( = ?auto_466307 ?auto_466310 ) ) ( not ( = ?auto_466307 ?auto_466311 ) ) ( not ( = ?auto_466307 ?auto_466312 ) ) ( not ( = ?auto_466307 ?auto_466313 ) ) ( not ( = ?auto_466307 ?auto_466314 ) ) ( not ( = ?auto_466307 ?auto_466315 ) ) ( not ( = ?auto_466307 ?auto_466316 ) ) ( not ( = ?auto_466308 ?auto_466309 ) ) ( not ( = ?auto_466308 ?auto_466310 ) ) ( not ( = ?auto_466308 ?auto_466311 ) ) ( not ( = ?auto_466308 ?auto_466312 ) ) ( not ( = ?auto_466308 ?auto_466313 ) ) ( not ( = ?auto_466308 ?auto_466314 ) ) ( not ( = ?auto_466308 ?auto_466315 ) ) ( not ( = ?auto_466308 ?auto_466316 ) ) ( not ( = ?auto_466309 ?auto_466310 ) ) ( not ( = ?auto_466309 ?auto_466311 ) ) ( not ( = ?auto_466309 ?auto_466312 ) ) ( not ( = ?auto_466309 ?auto_466313 ) ) ( not ( = ?auto_466309 ?auto_466314 ) ) ( not ( = ?auto_466309 ?auto_466315 ) ) ( not ( = ?auto_466309 ?auto_466316 ) ) ( not ( = ?auto_466310 ?auto_466311 ) ) ( not ( = ?auto_466310 ?auto_466312 ) ) ( not ( = ?auto_466310 ?auto_466313 ) ) ( not ( = ?auto_466310 ?auto_466314 ) ) ( not ( = ?auto_466310 ?auto_466315 ) ) ( not ( = ?auto_466310 ?auto_466316 ) ) ( not ( = ?auto_466311 ?auto_466312 ) ) ( not ( = ?auto_466311 ?auto_466313 ) ) ( not ( = ?auto_466311 ?auto_466314 ) ) ( not ( = ?auto_466311 ?auto_466315 ) ) ( not ( = ?auto_466311 ?auto_466316 ) ) ( not ( = ?auto_466312 ?auto_466313 ) ) ( not ( = ?auto_466312 ?auto_466314 ) ) ( not ( = ?auto_466312 ?auto_466315 ) ) ( not ( = ?auto_466312 ?auto_466316 ) ) ( not ( = ?auto_466313 ?auto_466314 ) ) ( not ( = ?auto_466313 ?auto_466315 ) ) ( not ( = ?auto_466313 ?auto_466316 ) ) ( not ( = ?auto_466314 ?auto_466315 ) ) ( not ( = ?auto_466314 ?auto_466316 ) ) ( not ( = ?auto_466315 ?auto_466316 ) ) ( ON ?auto_466314 ?auto_466315 ) ( ON ?auto_466313 ?auto_466314 ) ( CLEAR ?auto_466311 ) ( ON ?auto_466312 ?auto_466313 ) ( CLEAR ?auto_466312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_466306 ?auto_466307 ?auto_466308 ?auto_466309 ?auto_466310 ?auto_466311 ?auto_466312 )
      ( MAKE-10PILE ?auto_466306 ?auto_466307 ?auto_466308 ?auto_466309 ?auto_466310 ?auto_466311 ?auto_466312 ?auto_466313 ?auto_466314 ?auto_466315 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_466348 - BLOCK
      ?auto_466349 - BLOCK
      ?auto_466350 - BLOCK
      ?auto_466351 - BLOCK
      ?auto_466352 - BLOCK
      ?auto_466353 - BLOCK
      ?auto_466354 - BLOCK
      ?auto_466355 - BLOCK
      ?auto_466356 - BLOCK
      ?auto_466357 - BLOCK
    )
    :vars
    (
      ?auto_466358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466357 ?auto_466358 ) ( ON-TABLE ?auto_466348 ) ( ON ?auto_466349 ?auto_466348 ) ( ON ?auto_466350 ?auto_466349 ) ( ON ?auto_466351 ?auto_466350 ) ( ON ?auto_466352 ?auto_466351 ) ( not ( = ?auto_466348 ?auto_466349 ) ) ( not ( = ?auto_466348 ?auto_466350 ) ) ( not ( = ?auto_466348 ?auto_466351 ) ) ( not ( = ?auto_466348 ?auto_466352 ) ) ( not ( = ?auto_466348 ?auto_466353 ) ) ( not ( = ?auto_466348 ?auto_466354 ) ) ( not ( = ?auto_466348 ?auto_466355 ) ) ( not ( = ?auto_466348 ?auto_466356 ) ) ( not ( = ?auto_466348 ?auto_466357 ) ) ( not ( = ?auto_466348 ?auto_466358 ) ) ( not ( = ?auto_466349 ?auto_466350 ) ) ( not ( = ?auto_466349 ?auto_466351 ) ) ( not ( = ?auto_466349 ?auto_466352 ) ) ( not ( = ?auto_466349 ?auto_466353 ) ) ( not ( = ?auto_466349 ?auto_466354 ) ) ( not ( = ?auto_466349 ?auto_466355 ) ) ( not ( = ?auto_466349 ?auto_466356 ) ) ( not ( = ?auto_466349 ?auto_466357 ) ) ( not ( = ?auto_466349 ?auto_466358 ) ) ( not ( = ?auto_466350 ?auto_466351 ) ) ( not ( = ?auto_466350 ?auto_466352 ) ) ( not ( = ?auto_466350 ?auto_466353 ) ) ( not ( = ?auto_466350 ?auto_466354 ) ) ( not ( = ?auto_466350 ?auto_466355 ) ) ( not ( = ?auto_466350 ?auto_466356 ) ) ( not ( = ?auto_466350 ?auto_466357 ) ) ( not ( = ?auto_466350 ?auto_466358 ) ) ( not ( = ?auto_466351 ?auto_466352 ) ) ( not ( = ?auto_466351 ?auto_466353 ) ) ( not ( = ?auto_466351 ?auto_466354 ) ) ( not ( = ?auto_466351 ?auto_466355 ) ) ( not ( = ?auto_466351 ?auto_466356 ) ) ( not ( = ?auto_466351 ?auto_466357 ) ) ( not ( = ?auto_466351 ?auto_466358 ) ) ( not ( = ?auto_466352 ?auto_466353 ) ) ( not ( = ?auto_466352 ?auto_466354 ) ) ( not ( = ?auto_466352 ?auto_466355 ) ) ( not ( = ?auto_466352 ?auto_466356 ) ) ( not ( = ?auto_466352 ?auto_466357 ) ) ( not ( = ?auto_466352 ?auto_466358 ) ) ( not ( = ?auto_466353 ?auto_466354 ) ) ( not ( = ?auto_466353 ?auto_466355 ) ) ( not ( = ?auto_466353 ?auto_466356 ) ) ( not ( = ?auto_466353 ?auto_466357 ) ) ( not ( = ?auto_466353 ?auto_466358 ) ) ( not ( = ?auto_466354 ?auto_466355 ) ) ( not ( = ?auto_466354 ?auto_466356 ) ) ( not ( = ?auto_466354 ?auto_466357 ) ) ( not ( = ?auto_466354 ?auto_466358 ) ) ( not ( = ?auto_466355 ?auto_466356 ) ) ( not ( = ?auto_466355 ?auto_466357 ) ) ( not ( = ?auto_466355 ?auto_466358 ) ) ( not ( = ?auto_466356 ?auto_466357 ) ) ( not ( = ?auto_466356 ?auto_466358 ) ) ( not ( = ?auto_466357 ?auto_466358 ) ) ( ON ?auto_466356 ?auto_466357 ) ( ON ?auto_466355 ?auto_466356 ) ( ON ?auto_466354 ?auto_466355 ) ( CLEAR ?auto_466352 ) ( ON ?auto_466353 ?auto_466354 ) ( CLEAR ?auto_466353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_466348 ?auto_466349 ?auto_466350 ?auto_466351 ?auto_466352 ?auto_466353 )
      ( MAKE-10PILE ?auto_466348 ?auto_466349 ?auto_466350 ?auto_466351 ?auto_466352 ?auto_466353 ?auto_466354 ?auto_466355 ?auto_466356 ?auto_466357 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_466390 - BLOCK
      ?auto_466391 - BLOCK
      ?auto_466392 - BLOCK
      ?auto_466393 - BLOCK
      ?auto_466394 - BLOCK
      ?auto_466395 - BLOCK
      ?auto_466396 - BLOCK
      ?auto_466397 - BLOCK
      ?auto_466398 - BLOCK
      ?auto_466399 - BLOCK
    )
    :vars
    (
      ?auto_466400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466399 ?auto_466400 ) ( ON-TABLE ?auto_466390 ) ( ON ?auto_466391 ?auto_466390 ) ( ON ?auto_466392 ?auto_466391 ) ( ON ?auto_466393 ?auto_466392 ) ( not ( = ?auto_466390 ?auto_466391 ) ) ( not ( = ?auto_466390 ?auto_466392 ) ) ( not ( = ?auto_466390 ?auto_466393 ) ) ( not ( = ?auto_466390 ?auto_466394 ) ) ( not ( = ?auto_466390 ?auto_466395 ) ) ( not ( = ?auto_466390 ?auto_466396 ) ) ( not ( = ?auto_466390 ?auto_466397 ) ) ( not ( = ?auto_466390 ?auto_466398 ) ) ( not ( = ?auto_466390 ?auto_466399 ) ) ( not ( = ?auto_466390 ?auto_466400 ) ) ( not ( = ?auto_466391 ?auto_466392 ) ) ( not ( = ?auto_466391 ?auto_466393 ) ) ( not ( = ?auto_466391 ?auto_466394 ) ) ( not ( = ?auto_466391 ?auto_466395 ) ) ( not ( = ?auto_466391 ?auto_466396 ) ) ( not ( = ?auto_466391 ?auto_466397 ) ) ( not ( = ?auto_466391 ?auto_466398 ) ) ( not ( = ?auto_466391 ?auto_466399 ) ) ( not ( = ?auto_466391 ?auto_466400 ) ) ( not ( = ?auto_466392 ?auto_466393 ) ) ( not ( = ?auto_466392 ?auto_466394 ) ) ( not ( = ?auto_466392 ?auto_466395 ) ) ( not ( = ?auto_466392 ?auto_466396 ) ) ( not ( = ?auto_466392 ?auto_466397 ) ) ( not ( = ?auto_466392 ?auto_466398 ) ) ( not ( = ?auto_466392 ?auto_466399 ) ) ( not ( = ?auto_466392 ?auto_466400 ) ) ( not ( = ?auto_466393 ?auto_466394 ) ) ( not ( = ?auto_466393 ?auto_466395 ) ) ( not ( = ?auto_466393 ?auto_466396 ) ) ( not ( = ?auto_466393 ?auto_466397 ) ) ( not ( = ?auto_466393 ?auto_466398 ) ) ( not ( = ?auto_466393 ?auto_466399 ) ) ( not ( = ?auto_466393 ?auto_466400 ) ) ( not ( = ?auto_466394 ?auto_466395 ) ) ( not ( = ?auto_466394 ?auto_466396 ) ) ( not ( = ?auto_466394 ?auto_466397 ) ) ( not ( = ?auto_466394 ?auto_466398 ) ) ( not ( = ?auto_466394 ?auto_466399 ) ) ( not ( = ?auto_466394 ?auto_466400 ) ) ( not ( = ?auto_466395 ?auto_466396 ) ) ( not ( = ?auto_466395 ?auto_466397 ) ) ( not ( = ?auto_466395 ?auto_466398 ) ) ( not ( = ?auto_466395 ?auto_466399 ) ) ( not ( = ?auto_466395 ?auto_466400 ) ) ( not ( = ?auto_466396 ?auto_466397 ) ) ( not ( = ?auto_466396 ?auto_466398 ) ) ( not ( = ?auto_466396 ?auto_466399 ) ) ( not ( = ?auto_466396 ?auto_466400 ) ) ( not ( = ?auto_466397 ?auto_466398 ) ) ( not ( = ?auto_466397 ?auto_466399 ) ) ( not ( = ?auto_466397 ?auto_466400 ) ) ( not ( = ?auto_466398 ?auto_466399 ) ) ( not ( = ?auto_466398 ?auto_466400 ) ) ( not ( = ?auto_466399 ?auto_466400 ) ) ( ON ?auto_466398 ?auto_466399 ) ( ON ?auto_466397 ?auto_466398 ) ( ON ?auto_466396 ?auto_466397 ) ( ON ?auto_466395 ?auto_466396 ) ( CLEAR ?auto_466393 ) ( ON ?auto_466394 ?auto_466395 ) ( CLEAR ?auto_466394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_466390 ?auto_466391 ?auto_466392 ?auto_466393 ?auto_466394 )
      ( MAKE-10PILE ?auto_466390 ?auto_466391 ?auto_466392 ?auto_466393 ?auto_466394 ?auto_466395 ?auto_466396 ?auto_466397 ?auto_466398 ?auto_466399 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_466432 - BLOCK
      ?auto_466433 - BLOCK
      ?auto_466434 - BLOCK
      ?auto_466435 - BLOCK
      ?auto_466436 - BLOCK
      ?auto_466437 - BLOCK
      ?auto_466438 - BLOCK
      ?auto_466439 - BLOCK
      ?auto_466440 - BLOCK
      ?auto_466441 - BLOCK
    )
    :vars
    (
      ?auto_466442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466441 ?auto_466442 ) ( ON-TABLE ?auto_466432 ) ( ON ?auto_466433 ?auto_466432 ) ( ON ?auto_466434 ?auto_466433 ) ( not ( = ?auto_466432 ?auto_466433 ) ) ( not ( = ?auto_466432 ?auto_466434 ) ) ( not ( = ?auto_466432 ?auto_466435 ) ) ( not ( = ?auto_466432 ?auto_466436 ) ) ( not ( = ?auto_466432 ?auto_466437 ) ) ( not ( = ?auto_466432 ?auto_466438 ) ) ( not ( = ?auto_466432 ?auto_466439 ) ) ( not ( = ?auto_466432 ?auto_466440 ) ) ( not ( = ?auto_466432 ?auto_466441 ) ) ( not ( = ?auto_466432 ?auto_466442 ) ) ( not ( = ?auto_466433 ?auto_466434 ) ) ( not ( = ?auto_466433 ?auto_466435 ) ) ( not ( = ?auto_466433 ?auto_466436 ) ) ( not ( = ?auto_466433 ?auto_466437 ) ) ( not ( = ?auto_466433 ?auto_466438 ) ) ( not ( = ?auto_466433 ?auto_466439 ) ) ( not ( = ?auto_466433 ?auto_466440 ) ) ( not ( = ?auto_466433 ?auto_466441 ) ) ( not ( = ?auto_466433 ?auto_466442 ) ) ( not ( = ?auto_466434 ?auto_466435 ) ) ( not ( = ?auto_466434 ?auto_466436 ) ) ( not ( = ?auto_466434 ?auto_466437 ) ) ( not ( = ?auto_466434 ?auto_466438 ) ) ( not ( = ?auto_466434 ?auto_466439 ) ) ( not ( = ?auto_466434 ?auto_466440 ) ) ( not ( = ?auto_466434 ?auto_466441 ) ) ( not ( = ?auto_466434 ?auto_466442 ) ) ( not ( = ?auto_466435 ?auto_466436 ) ) ( not ( = ?auto_466435 ?auto_466437 ) ) ( not ( = ?auto_466435 ?auto_466438 ) ) ( not ( = ?auto_466435 ?auto_466439 ) ) ( not ( = ?auto_466435 ?auto_466440 ) ) ( not ( = ?auto_466435 ?auto_466441 ) ) ( not ( = ?auto_466435 ?auto_466442 ) ) ( not ( = ?auto_466436 ?auto_466437 ) ) ( not ( = ?auto_466436 ?auto_466438 ) ) ( not ( = ?auto_466436 ?auto_466439 ) ) ( not ( = ?auto_466436 ?auto_466440 ) ) ( not ( = ?auto_466436 ?auto_466441 ) ) ( not ( = ?auto_466436 ?auto_466442 ) ) ( not ( = ?auto_466437 ?auto_466438 ) ) ( not ( = ?auto_466437 ?auto_466439 ) ) ( not ( = ?auto_466437 ?auto_466440 ) ) ( not ( = ?auto_466437 ?auto_466441 ) ) ( not ( = ?auto_466437 ?auto_466442 ) ) ( not ( = ?auto_466438 ?auto_466439 ) ) ( not ( = ?auto_466438 ?auto_466440 ) ) ( not ( = ?auto_466438 ?auto_466441 ) ) ( not ( = ?auto_466438 ?auto_466442 ) ) ( not ( = ?auto_466439 ?auto_466440 ) ) ( not ( = ?auto_466439 ?auto_466441 ) ) ( not ( = ?auto_466439 ?auto_466442 ) ) ( not ( = ?auto_466440 ?auto_466441 ) ) ( not ( = ?auto_466440 ?auto_466442 ) ) ( not ( = ?auto_466441 ?auto_466442 ) ) ( ON ?auto_466440 ?auto_466441 ) ( ON ?auto_466439 ?auto_466440 ) ( ON ?auto_466438 ?auto_466439 ) ( ON ?auto_466437 ?auto_466438 ) ( ON ?auto_466436 ?auto_466437 ) ( CLEAR ?auto_466434 ) ( ON ?auto_466435 ?auto_466436 ) ( CLEAR ?auto_466435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_466432 ?auto_466433 ?auto_466434 ?auto_466435 )
      ( MAKE-10PILE ?auto_466432 ?auto_466433 ?auto_466434 ?auto_466435 ?auto_466436 ?auto_466437 ?auto_466438 ?auto_466439 ?auto_466440 ?auto_466441 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_466474 - BLOCK
      ?auto_466475 - BLOCK
      ?auto_466476 - BLOCK
      ?auto_466477 - BLOCK
      ?auto_466478 - BLOCK
      ?auto_466479 - BLOCK
      ?auto_466480 - BLOCK
      ?auto_466481 - BLOCK
      ?auto_466482 - BLOCK
      ?auto_466483 - BLOCK
    )
    :vars
    (
      ?auto_466484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466483 ?auto_466484 ) ( ON-TABLE ?auto_466474 ) ( ON ?auto_466475 ?auto_466474 ) ( not ( = ?auto_466474 ?auto_466475 ) ) ( not ( = ?auto_466474 ?auto_466476 ) ) ( not ( = ?auto_466474 ?auto_466477 ) ) ( not ( = ?auto_466474 ?auto_466478 ) ) ( not ( = ?auto_466474 ?auto_466479 ) ) ( not ( = ?auto_466474 ?auto_466480 ) ) ( not ( = ?auto_466474 ?auto_466481 ) ) ( not ( = ?auto_466474 ?auto_466482 ) ) ( not ( = ?auto_466474 ?auto_466483 ) ) ( not ( = ?auto_466474 ?auto_466484 ) ) ( not ( = ?auto_466475 ?auto_466476 ) ) ( not ( = ?auto_466475 ?auto_466477 ) ) ( not ( = ?auto_466475 ?auto_466478 ) ) ( not ( = ?auto_466475 ?auto_466479 ) ) ( not ( = ?auto_466475 ?auto_466480 ) ) ( not ( = ?auto_466475 ?auto_466481 ) ) ( not ( = ?auto_466475 ?auto_466482 ) ) ( not ( = ?auto_466475 ?auto_466483 ) ) ( not ( = ?auto_466475 ?auto_466484 ) ) ( not ( = ?auto_466476 ?auto_466477 ) ) ( not ( = ?auto_466476 ?auto_466478 ) ) ( not ( = ?auto_466476 ?auto_466479 ) ) ( not ( = ?auto_466476 ?auto_466480 ) ) ( not ( = ?auto_466476 ?auto_466481 ) ) ( not ( = ?auto_466476 ?auto_466482 ) ) ( not ( = ?auto_466476 ?auto_466483 ) ) ( not ( = ?auto_466476 ?auto_466484 ) ) ( not ( = ?auto_466477 ?auto_466478 ) ) ( not ( = ?auto_466477 ?auto_466479 ) ) ( not ( = ?auto_466477 ?auto_466480 ) ) ( not ( = ?auto_466477 ?auto_466481 ) ) ( not ( = ?auto_466477 ?auto_466482 ) ) ( not ( = ?auto_466477 ?auto_466483 ) ) ( not ( = ?auto_466477 ?auto_466484 ) ) ( not ( = ?auto_466478 ?auto_466479 ) ) ( not ( = ?auto_466478 ?auto_466480 ) ) ( not ( = ?auto_466478 ?auto_466481 ) ) ( not ( = ?auto_466478 ?auto_466482 ) ) ( not ( = ?auto_466478 ?auto_466483 ) ) ( not ( = ?auto_466478 ?auto_466484 ) ) ( not ( = ?auto_466479 ?auto_466480 ) ) ( not ( = ?auto_466479 ?auto_466481 ) ) ( not ( = ?auto_466479 ?auto_466482 ) ) ( not ( = ?auto_466479 ?auto_466483 ) ) ( not ( = ?auto_466479 ?auto_466484 ) ) ( not ( = ?auto_466480 ?auto_466481 ) ) ( not ( = ?auto_466480 ?auto_466482 ) ) ( not ( = ?auto_466480 ?auto_466483 ) ) ( not ( = ?auto_466480 ?auto_466484 ) ) ( not ( = ?auto_466481 ?auto_466482 ) ) ( not ( = ?auto_466481 ?auto_466483 ) ) ( not ( = ?auto_466481 ?auto_466484 ) ) ( not ( = ?auto_466482 ?auto_466483 ) ) ( not ( = ?auto_466482 ?auto_466484 ) ) ( not ( = ?auto_466483 ?auto_466484 ) ) ( ON ?auto_466482 ?auto_466483 ) ( ON ?auto_466481 ?auto_466482 ) ( ON ?auto_466480 ?auto_466481 ) ( ON ?auto_466479 ?auto_466480 ) ( ON ?auto_466478 ?auto_466479 ) ( ON ?auto_466477 ?auto_466478 ) ( CLEAR ?auto_466475 ) ( ON ?auto_466476 ?auto_466477 ) ( CLEAR ?auto_466476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_466474 ?auto_466475 ?auto_466476 )
      ( MAKE-10PILE ?auto_466474 ?auto_466475 ?auto_466476 ?auto_466477 ?auto_466478 ?auto_466479 ?auto_466480 ?auto_466481 ?auto_466482 ?auto_466483 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_466516 - BLOCK
      ?auto_466517 - BLOCK
      ?auto_466518 - BLOCK
      ?auto_466519 - BLOCK
      ?auto_466520 - BLOCK
      ?auto_466521 - BLOCK
      ?auto_466522 - BLOCK
      ?auto_466523 - BLOCK
      ?auto_466524 - BLOCK
      ?auto_466525 - BLOCK
    )
    :vars
    (
      ?auto_466526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466525 ?auto_466526 ) ( ON-TABLE ?auto_466516 ) ( not ( = ?auto_466516 ?auto_466517 ) ) ( not ( = ?auto_466516 ?auto_466518 ) ) ( not ( = ?auto_466516 ?auto_466519 ) ) ( not ( = ?auto_466516 ?auto_466520 ) ) ( not ( = ?auto_466516 ?auto_466521 ) ) ( not ( = ?auto_466516 ?auto_466522 ) ) ( not ( = ?auto_466516 ?auto_466523 ) ) ( not ( = ?auto_466516 ?auto_466524 ) ) ( not ( = ?auto_466516 ?auto_466525 ) ) ( not ( = ?auto_466516 ?auto_466526 ) ) ( not ( = ?auto_466517 ?auto_466518 ) ) ( not ( = ?auto_466517 ?auto_466519 ) ) ( not ( = ?auto_466517 ?auto_466520 ) ) ( not ( = ?auto_466517 ?auto_466521 ) ) ( not ( = ?auto_466517 ?auto_466522 ) ) ( not ( = ?auto_466517 ?auto_466523 ) ) ( not ( = ?auto_466517 ?auto_466524 ) ) ( not ( = ?auto_466517 ?auto_466525 ) ) ( not ( = ?auto_466517 ?auto_466526 ) ) ( not ( = ?auto_466518 ?auto_466519 ) ) ( not ( = ?auto_466518 ?auto_466520 ) ) ( not ( = ?auto_466518 ?auto_466521 ) ) ( not ( = ?auto_466518 ?auto_466522 ) ) ( not ( = ?auto_466518 ?auto_466523 ) ) ( not ( = ?auto_466518 ?auto_466524 ) ) ( not ( = ?auto_466518 ?auto_466525 ) ) ( not ( = ?auto_466518 ?auto_466526 ) ) ( not ( = ?auto_466519 ?auto_466520 ) ) ( not ( = ?auto_466519 ?auto_466521 ) ) ( not ( = ?auto_466519 ?auto_466522 ) ) ( not ( = ?auto_466519 ?auto_466523 ) ) ( not ( = ?auto_466519 ?auto_466524 ) ) ( not ( = ?auto_466519 ?auto_466525 ) ) ( not ( = ?auto_466519 ?auto_466526 ) ) ( not ( = ?auto_466520 ?auto_466521 ) ) ( not ( = ?auto_466520 ?auto_466522 ) ) ( not ( = ?auto_466520 ?auto_466523 ) ) ( not ( = ?auto_466520 ?auto_466524 ) ) ( not ( = ?auto_466520 ?auto_466525 ) ) ( not ( = ?auto_466520 ?auto_466526 ) ) ( not ( = ?auto_466521 ?auto_466522 ) ) ( not ( = ?auto_466521 ?auto_466523 ) ) ( not ( = ?auto_466521 ?auto_466524 ) ) ( not ( = ?auto_466521 ?auto_466525 ) ) ( not ( = ?auto_466521 ?auto_466526 ) ) ( not ( = ?auto_466522 ?auto_466523 ) ) ( not ( = ?auto_466522 ?auto_466524 ) ) ( not ( = ?auto_466522 ?auto_466525 ) ) ( not ( = ?auto_466522 ?auto_466526 ) ) ( not ( = ?auto_466523 ?auto_466524 ) ) ( not ( = ?auto_466523 ?auto_466525 ) ) ( not ( = ?auto_466523 ?auto_466526 ) ) ( not ( = ?auto_466524 ?auto_466525 ) ) ( not ( = ?auto_466524 ?auto_466526 ) ) ( not ( = ?auto_466525 ?auto_466526 ) ) ( ON ?auto_466524 ?auto_466525 ) ( ON ?auto_466523 ?auto_466524 ) ( ON ?auto_466522 ?auto_466523 ) ( ON ?auto_466521 ?auto_466522 ) ( ON ?auto_466520 ?auto_466521 ) ( ON ?auto_466519 ?auto_466520 ) ( ON ?auto_466518 ?auto_466519 ) ( CLEAR ?auto_466516 ) ( ON ?auto_466517 ?auto_466518 ) ( CLEAR ?auto_466517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_466516 ?auto_466517 )
      ( MAKE-10PILE ?auto_466516 ?auto_466517 ?auto_466518 ?auto_466519 ?auto_466520 ?auto_466521 ?auto_466522 ?auto_466523 ?auto_466524 ?auto_466525 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_466558 - BLOCK
      ?auto_466559 - BLOCK
      ?auto_466560 - BLOCK
      ?auto_466561 - BLOCK
      ?auto_466562 - BLOCK
      ?auto_466563 - BLOCK
      ?auto_466564 - BLOCK
      ?auto_466565 - BLOCK
      ?auto_466566 - BLOCK
      ?auto_466567 - BLOCK
    )
    :vars
    (
      ?auto_466568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466567 ?auto_466568 ) ( not ( = ?auto_466558 ?auto_466559 ) ) ( not ( = ?auto_466558 ?auto_466560 ) ) ( not ( = ?auto_466558 ?auto_466561 ) ) ( not ( = ?auto_466558 ?auto_466562 ) ) ( not ( = ?auto_466558 ?auto_466563 ) ) ( not ( = ?auto_466558 ?auto_466564 ) ) ( not ( = ?auto_466558 ?auto_466565 ) ) ( not ( = ?auto_466558 ?auto_466566 ) ) ( not ( = ?auto_466558 ?auto_466567 ) ) ( not ( = ?auto_466558 ?auto_466568 ) ) ( not ( = ?auto_466559 ?auto_466560 ) ) ( not ( = ?auto_466559 ?auto_466561 ) ) ( not ( = ?auto_466559 ?auto_466562 ) ) ( not ( = ?auto_466559 ?auto_466563 ) ) ( not ( = ?auto_466559 ?auto_466564 ) ) ( not ( = ?auto_466559 ?auto_466565 ) ) ( not ( = ?auto_466559 ?auto_466566 ) ) ( not ( = ?auto_466559 ?auto_466567 ) ) ( not ( = ?auto_466559 ?auto_466568 ) ) ( not ( = ?auto_466560 ?auto_466561 ) ) ( not ( = ?auto_466560 ?auto_466562 ) ) ( not ( = ?auto_466560 ?auto_466563 ) ) ( not ( = ?auto_466560 ?auto_466564 ) ) ( not ( = ?auto_466560 ?auto_466565 ) ) ( not ( = ?auto_466560 ?auto_466566 ) ) ( not ( = ?auto_466560 ?auto_466567 ) ) ( not ( = ?auto_466560 ?auto_466568 ) ) ( not ( = ?auto_466561 ?auto_466562 ) ) ( not ( = ?auto_466561 ?auto_466563 ) ) ( not ( = ?auto_466561 ?auto_466564 ) ) ( not ( = ?auto_466561 ?auto_466565 ) ) ( not ( = ?auto_466561 ?auto_466566 ) ) ( not ( = ?auto_466561 ?auto_466567 ) ) ( not ( = ?auto_466561 ?auto_466568 ) ) ( not ( = ?auto_466562 ?auto_466563 ) ) ( not ( = ?auto_466562 ?auto_466564 ) ) ( not ( = ?auto_466562 ?auto_466565 ) ) ( not ( = ?auto_466562 ?auto_466566 ) ) ( not ( = ?auto_466562 ?auto_466567 ) ) ( not ( = ?auto_466562 ?auto_466568 ) ) ( not ( = ?auto_466563 ?auto_466564 ) ) ( not ( = ?auto_466563 ?auto_466565 ) ) ( not ( = ?auto_466563 ?auto_466566 ) ) ( not ( = ?auto_466563 ?auto_466567 ) ) ( not ( = ?auto_466563 ?auto_466568 ) ) ( not ( = ?auto_466564 ?auto_466565 ) ) ( not ( = ?auto_466564 ?auto_466566 ) ) ( not ( = ?auto_466564 ?auto_466567 ) ) ( not ( = ?auto_466564 ?auto_466568 ) ) ( not ( = ?auto_466565 ?auto_466566 ) ) ( not ( = ?auto_466565 ?auto_466567 ) ) ( not ( = ?auto_466565 ?auto_466568 ) ) ( not ( = ?auto_466566 ?auto_466567 ) ) ( not ( = ?auto_466566 ?auto_466568 ) ) ( not ( = ?auto_466567 ?auto_466568 ) ) ( ON ?auto_466566 ?auto_466567 ) ( ON ?auto_466565 ?auto_466566 ) ( ON ?auto_466564 ?auto_466565 ) ( ON ?auto_466563 ?auto_466564 ) ( ON ?auto_466562 ?auto_466563 ) ( ON ?auto_466561 ?auto_466562 ) ( ON ?auto_466560 ?auto_466561 ) ( ON ?auto_466559 ?auto_466560 ) ( ON ?auto_466558 ?auto_466559 ) ( CLEAR ?auto_466558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_466558 )
      ( MAKE-10PILE ?auto_466558 ?auto_466559 ?auto_466560 ?auto_466561 ?auto_466562 ?auto_466563 ?auto_466564 ?auto_466565 ?auto_466566 ?auto_466567 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_466601 - BLOCK
      ?auto_466602 - BLOCK
      ?auto_466603 - BLOCK
      ?auto_466604 - BLOCK
      ?auto_466605 - BLOCK
      ?auto_466606 - BLOCK
      ?auto_466607 - BLOCK
      ?auto_466608 - BLOCK
      ?auto_466609 - BLOCK
      ?auto_466610 - BLOCK
      ?auto_466611 - BLOCK
    )
    :vars
    (
      ?auto_466612 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_466610 ) ( ON ?auto_466611 ?auto_466612 ) ( CLEAR ?auto_466611 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_466601 ) ( ON ?auto_466602 ?auto_466601 ) ( ON ?auto_466603 ?auto_466602 ) ( ON ?auto_466604 ?auto_466603 ) ( ON ?auto_466605 ?auto_466604 ) ( ON ?auto_466606 ?auto_466605 ) ( ON ?auto_466607 ?auto_466606 ) ( ON ?auto_466608 ?auto_466607 ) ( ON ?auto_466609 ?auto_466608 ) ( ON ?auto_466610 ?auto_466609 ) ( not ( = ?auto_466601 ?auto_466602 ) ) ( not ( = ?auto_466601 ?auto_466603 ) ) ( not ( = ?auto_466601 ?auto_466604 ) ) ( not ( = ?auto_466601 ?auto_466605 ) ) ( not ( = ?auto_466601 ?auto_466606 ) ) ( not ( = ?auto_466601 ?auto_466607 ) ) ( not ( = ?auto_466601 ?auto_466608 ) ) ( not ( = ?auto_466601 ?auto_466609 ) ) ( not ( = ?auto_466601 ?auto_466610 ) ) ( not ( = ?auto_466601 ?auto_466611 ) ) ( not ( = ?auto_466601 ?auto_466612 ) ) ( not ( = ?auto_466602 ?auto_466603 ) ) ( not ( = ?auto_466602 ?auto_466604 ) ) ( not ( = ?auto_466602 ?auto_466605 ) ) ( not ( = ?auto_466602 ?auto_466606 ) ) ( not ( = ?auto_466602 ?auto_466607 ) ) ( not ( = ?auto_466602 ?auto_466608 ) ) ( not ( = ?auto_466602 ?auto_466609 ) ) ( not ( = ?auto_466602 ?auto_466610 ) ) ( not ( = ?auto_466602 ?auto_466611 ) ) ( not ( = ?auto_466602 ?auto_466612 ) ) ( not ( = ?auto_466603 ?auto_466604 ) ) ( not ( = ?auto_466603 ?auto_466605 ) ) ( not ( = ?auto_466603 ?auto_466606 ) ) ( not ( = ?auto_466603 ?auto_466607 ) ) ( not ( = ?auto_466603 ?auto_466608 ) ) ( not ( = ?auto_466603 ?auto_466609 ) ) ( not ( = ?auto_466603 ?auto_466610 ) ) ( not ( = ?auto_466603 ?auto_466611 ) ) ( not ( = ?auto_466603 ?auto_466612 ) ) ( not ( = ?auto_466604 ?auto_466605 ) ) ( not ( = ?auto_466604 ?auto_466606 ) ) ( not ( = ?auto_466604 ?auto_466607 ) ) ( not ( = ?auto_466604 ?auto_466608 ) ) ( not ( = ?auto_466604 ?auto_466609 ) ) ( not ( = ?auto_466604 ?auto_466610 ) ) ( not ( = ?auto_466604 ?auto_466611 ) ) ( not ( = ?auto_466604 ?auto_466612 ) ) ( not ( = ?auto_466605 ?auto_466606 ) ) ( not ( = ?auto_466605 ?auto_466607 ) ) ( not ( = ?auto_466605 ?auto_466608 ) ) ( not ( = ?auto_466605 ?auto_466609 ) ) ( not ( = ?auto_466605 ?auto_466610 ) ) ( not ( = ?auto_466605 ?auto_466611 ) ) ( not ( = ?auto_466605 ?auto_466612 ) ) ( not ( = ?auto_466606 ?auto_466607 ) ) ( not ( = ?auto_466606 ?auto_466608 ) ) ( not ( = ?auto_466606 ?auto_466609 ) ) ( not ( = ?auto_466606 ?auto_466610 ) ) ( not ( = ?auto_466606 ?auto_466611 ) ) ( not ( = ?auto_466606 ?auto_466612 ) ) ( not ( = ?auto_466607 ?auto_466608 ) ) ( not ( = ?auto_466607 ?auto_466609 ) ) ( not ( = ?auto_466607 ?auto_466610 ) ) ( not ( = ?auto_466607 ?auto_466611 ) ) ( not ( = ?auto_466607 ?auto_466612 ) ) ( not ( = ?auto_466608 ?auto_466609 ) ) ( not ( = ?auto_466608 ?auto_466610 ) ) ( not ( = ?auto_466608 ?auto_466611 ) ) ( not ( = ?auto_466608 ?auto_466612 ) ) ( not ( = ?auto_466609 ?auto_466610 ) ) ( not ( = ?auto_466609 ?auto_466611 ) ) ( not ( = ?auto_466609 ?auto_466612 ) ) ( not ( = ?auto_466610 ?auto_466611 ) ) ( not ( = ?auto_466610 ?auto_466612 ) ) ( not ( = ?auto_466611 ?auto_466612 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_466611 ?auto_466612 )
      ( !STACK ?auto_466611 ?auto_466610 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_466647 - BLOCK
      ?auto_466648 - BLOCK
      ?auto_466649 - BLOCK
      ?auto_466650 - BLOCK
      ?auto_466651 - BLOCK
      ?auto_466652 - BLOCK
      ?auto_466653 - BLOCK
      ?auto_466654 - BLOCK
      ?auto_466655 - BLOCK
      ?auto_466656 - BLOCK
      ?auto_466657 - BLOCK
    )
    :vars
    (
      ?auto_466658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466657 ?auto_466658 ) ( ON-TABLE ?auto_466647 ) ( ON ?auto_466648 ?auto_466647 ) ( ON ?auto_466649 ?auto_466648 ) ( ON ?auto_466650 ?auto_466649 ) ( ON ?auto_466651 ?auto_466650 ) ( ON ?auto_466652 ?auto_466651 ) ( ON ?auto_466653 ?auto_466652 ) ( ON ?auto_466654 ?auto_466653 ) ( ON ?auto_466655 ?auto_466654 ) ( not ( = ?auto_466647 ?auto_466648 ) ) ( not ( = ?auto_466647 ?auto_466649 ) ) ( not ( = ?auto_466647 ?auto_466650 ) ) ( not ( = ?auto_466647 ?auto_466651 ) ) ( not ( = ?auto_466647 ?auto_466652 ) ) ( not ( = ?auto_466647 ?auto_466653 ) ) ( not ( = ?auto_466647 ?auto_466654 ) ) ( not ( = ?auto_466647 ?auto_466655 ) ) ( not ( = ?auto_466647 ?auto_466656 ) ) ( not ( = ?auto_466647 ?auto_466657 ) ) ( not ( = ?auto_466647 ?auto_466658 ) ) ( not ( = ?auto_466648 ?auto_466649 ) ) ( not ( = ?auto_466648 ?auto_466650 ) ) ( not ( = ?auto_466648 ?auto_466651 ) ) ( not ( = ?auto_466648 ?auto_466652 ) ) ( not ( = ?auto_466648 ?auto_466653 ) ) ( not ( = ?auto_466648 ?auto_466654 ) ) ( not ( = ?auto_466648 ?auto_466655 ) ) ( not ( = ?auto_466648 ?auto_466656 ) ) ( not ( = ?auto_466648 ?auto_466657 ) ) ( not ( = ?auto_466648 ?auto_466658 ) ) ( not ( = ?auto_466649 ?auto_466650 ) ) ( not ( = ?auto_466649 ?auto_466651 ) ) ( not ( = ?auto_466649 ?auto_466652 ) ) ( not ( = ?auto_466649 ?auto_466653 ) ) ( not ( = ?auto_466649 ?auto_466654 ) ) ( not ( = ?auto_466649 ?auto_466655 ) ) ( not ( = ?auto_466649 ?auto_466656 ) ) ( not ( = ?auto_466649 ?auto_466657 ) ) ( not ( = ?auto_466649 ?auto_466658 ) ) ( not ( = ?auto_466650 ?auto_466651 ) ) ( not ( = ?auto_466650 ?auto_466652 ) ) ( not ( = ?auto_466650 ?auto_466653 ) ) ( not ( = ?auto_466650 ?auto_466654 ) ) ( not ( = ?auto_466650 ?auto_466655 ) ) ( not ( = ?auto_466650 ?auto_466656 ) ) ( not ( = ?auto_466650 ?auto_466657 ) ) ( not ( = ?auto_466650 ?auto_466658 ) ) ( not ( = ?auto_466651 ?auto_466652 ) ) ( not ( = ?auto_466651 ?auto_466653 ) ) ( not ( = ?auto_466651 ?auto_466654 ) ) ( not ( = ?auto_466651 ?auto_466655 ) ) ( not ( = ?auto_466651 ?auto_466656 ) ) ( not ( = ?auto_466651 ?auto_466657 ) ) ( not ( = ?auto_466651 ?auto_466658 ) ) ( not ( = ?auto_466652 ?auto_466653 ) ) ( not ( = ?auto_466652 ?auto_466654 ) ) ( not ( = ?auto_466652 ?auto_466655 ) ) ( not ( = ?auto_466652 ?auto_466656 ) ) ( not ( = ?auto_466652 ?auto_466657 ) ) ( not ( = ?auto_466652 ?auto_466658 ) ) ( not ( = ?auto_466653 ?auto_466654 ) ) ( not ( = ?auto_466653 ?auto_466655 ) ) ( not ( = ?auto_466653 ?auto_466656 ) ) ( not ( = ?auto_466653 ?auto_466657 ) ) ( not ( = ?auto_466653 ?auto_466658 ) ) ( not ( = ?auto_466654 ?auto_466655 ) ) ( not ( = ?auto_466654 ?auto_466656 ) ) ( not ( = ?auto_466654 ?auto_466657 ) ) ( not ( = ?auto_466654 ?auto_466658 ) ) ( not ( = ?auto_466655 ?auto_466656 ) ) ( not ( = ?auto_466655 ?auto_466657 ) ) ( not ( = ?auto_466655 ?auto_466658 ) ) ( not ( = ?auto_466656 ?auto_466657 ) ) ( not ( = ?auto_466656 ?auto_466658 ) ) ( not ( = ?auto_466657 ?auto_466658 ) ) ( CLEAR ?auto_466655 ) ( ON ?auto_466656 ?auto_466657 ) ( CLEAR ?auto_466656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_466647 ?auto_466648 ?auto_466649 ?auto_466650 ?auto_466651 ?auto_466652 ?auto_466653 ?auto_466654 ?auto_466655 ?auto_466656 )
      ( MAKE-11PILE ?auto_466647 ?auto_466648 ?auto_466649 ?auto_466650 ?auto_466651 ?auto_466652 ?auto_466653 ?auto_466654 ?auto_466655 ?auto_466656 ?auto_466657 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_466693 - BLOCK
      ?auto_466694 - BLOCK
      ?auto_466695 - BLOCK
      ?auto_466696 - BLOCK
      ?auto_466697 - BLOCK
      ?auto_466698 - BLOCK
      ?auto_466699 - BLOCK
      ?auto_466700 - BLOCK
      ?auto_466701 - BLOCK
      ?auto_466702 - BLOCK
      ?auto_466703 - BLOCK
    )
    :vars
    (
      ?auto_466704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466703 ?auto_466704 ) ( ON-TABLE ?auto_466693 ) ( ON ?auto_466694 ?auto_466693 ) ( ON ?auto_466695 ?auto_466694 ) ( ON ?auto_466696 ?auto_466695 ) ( ON ?auto_466697 ?auto_466696 ) ( ON ?auto_466698 ?auto_466697 ) ( ON ?auto_466699 ?auto_466698 ) ( ON ?auto_466700 ?auto_466699 ) ( not ( = ?auto_466693 ?auto_466694 ) ) ( not ( = ?auto_466693 ?auto_466695 ) ) ( not ( = ?auto_466693 ?auto_466696 ) ) ( not ( = ?auto_466693 ?auto_466697 ) ) ( not ( = ?auto_466693 ?auto_466698 ) ) ( not ( = ?auto_466693 ?auto_466699 ) ) ( not ( = ?auto_466693 ?auto_466700 ) ) ( not ( = ?auto_466693 ?auto_466701 ) ) ( not ( = ?auto_466693 ?auto_466702 ) ) ( not ( = ?auto_466693 ?auto_466703 ) ) ( not ( = ?auto_466693 ?auto_466704 ) ) ( not ( = ?auto_466694 ?auto_466695 ) ) ( not ( = ?auto_466694 ?auto_466696 ) ) ( not ( = ?auto_466694 ?auto_466697 ) ) ( not ( = ?auto_466694 ?auto_466698 ) ) ( not ( = ?auto_466694 ?auto_466699 ) ) ( not ( = ?auto_466694 ?auto_466700 ) ) ( not ( = ?auto_466694 ?auto_466701 ) ) ( not ( = ?auto_466694 ?auto_466702 ) ) ( not ( = ?auto_466694 ?auto_466703 ) ) ( not ( = ?auto_466694 ?auto_466704 ) ) ( not ( = ?auto_466695 ?auto_466696 ) ) ( not ( = ?auto_466695 ?auto_466697 ) ) ( not ( = ?auto_466695 ?auto_466698 ) ) ( not ( = ?auto_466695 ?auto_466699 ) ) ( not ( = ?auto_466695 ?auto_466700 ) ) ( not ( = ?auto_466695 ?auto_466701 ) ) ( not ( = ?auto_466695 ?auto_466702 ) ) ( not ( = ?auto_466695 ?auto_466703 ) ) ( not ( = ?auto_466695 ?auto_466704 ) ) ( not ( = ?auto_466696 ?auto_466697 ) ) ( not ( = ?auto_466696 ?auto_466698 ) ) ( not ( = ?auto_466696 ?auto_466699 ) ) ( not ( = ?auto_466696 ?auto_466700 ) ) ( not ( = ?auto_466696 ?auto_466701 ) ) ( not ( = ?auto_466696 ?auto_466702 ) ) ( not ( = ?auto_466696 ?auto_466703 ) ) ( not ( = ?auto_466696 ?auto_466704 ) ) ( not ( = ?auto_466697 ?auto_466698 ) ) ( not ( = ?auto_466697 ?auto_466699 ) ) ( not ( = ?auto_466697 ?auto_466700 ) ) ( not ( = ?auto_466697 ?auto_466701 ) ) ( not ( = ?auto_466697 ?auto_466702 ) ) ( not ( = ?auto_466697 ?auto_466703 ) ) ( not ( = ?auto_466697 ?auto_466704 ) ) ( not ( = ?auto_466698 ?auto_466699 ) ) ( not ( = ?auto_466698 ?auto_466700 ) ) ( not ( = ?auto_466698 ?auto_466701 ) ) ( not ( = ?auto_466698 ?auto_466702 ) ) ( not ( = ?auto_466698 ?auto_466703 ) ) ( not ( = ?auto_466698 ?auto_466704 ) ) ( not ( = ?auto_466699 ?auto_466700 ) ) ( not ( = ?auto_466699 ?auto_466701 ) ) ( not ( = ?auto_466699 ?auto_466702 ) ) ( not ( = ?auto_466699 ?auto_466703 ) ) ( not ( = ?auto_466699 ?auto_466704 ) ) ( not ( = ?auto_466700 ?auto_466701 ) ) ( not ( = ?auto_466700 ?auto_466702 ) ) ( not ( = ?auto_466700 ?auto_466703 ) ) ( not ( = ?auto_466700 ?auto_466704 ) ) ( not ( = ?auto_466701 ?auto_466702 ) ) ( not ( = ?auto_466701 ?auto_466703 ) ) ( not ( = ?auto_466701 ?auto_466704 ) ) ( not ( = ?auto_466702 ?auto_466703 ) ) ( not ( = ?auto_466702 ?auto_466704 ) ) ( not ( = ?auto_466703 ?auto_466704 ) ) ( ON ?auto_466702 ?auto_466703 ) ( CLEAR ?auto_466700 ) ( ON ?auto_466701 ?auto_466702 ) ( CLEAR ?auto_466701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_466693 ?auto_466694 ?auto_466695 ?auto_466696 ?auto_466697 ?auto_466698 ?auto_466699 ?auto_466700 ?auto_466701 )
      ( MAKE-11PILE ?auto_466693 ?auto_466694 ?auto_466695 ?auto_466696 ?auto_466697 ?auto_466698 ?auto_466699 ?auto_466700 ?auto_466701 ?auto_466702 ?auto_466703 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_466739 - BLOCK
      ?auto_466740 - BLOCK
      ?auto_466741 - BLOCK
      ?auto_466742 - BLOCK
      ?auto_466743 - BLOCK
      ?auto_466744 - BLOCK
      ?auto_466745 - BLOCK
      ?auto_466746 - BLOCK
      ?auto_466747 - BLOCK
      ?auto_466748 - BLOCK
      ?auto_466749 - BLOCK
    )
    :vars
    (
      ?auto_466750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466749 ?auto_466750 ) ( ON-TABLE ?auto_466739 ) ( ON ?auto_466740 ?auto_466739 ) ( ON ?auto_466741 ?auto_466740 ) ( ON ?auto_466742 ?auto_466741 ) ( ON ?auto_466743 ?auto_466742 ) ( ON ?auto_466744 ?auto_466743 ) ( ON ?auto_466745 ?auto_466744 ) ( not ( = ?auto_466739 ?auto_466740 ) ) ( not ( = ?auto_466739 ?auto_466741 ) ) ( not ( = ?auto_466739 ?auto_466742 ) ) ( not ( = ?auto_466739 ?auto_466743 ) ) ( not ( = ?auto_466739 ?auto_466744 ) ) ( not ( = ?auto_466739 ?auto_466745 ) ) ( not ( = ?auto_466739 ?auto_466746 ) ) ( not ( = ?auto_466739 ?auto_466747 ) ) ( not ( = ?auto_466739 ?auto_466748 ) ) ( not ( = ?auto_466739 ?auto_466749 ) ) ( not ( = ?auto_466739 ?auto_466750 ) ) ( not ( = ?auto_466740 ?auto_466741 ) ) ( not ( = ?auto_466740 ?auto_466742 ) ) ( not ( = ?auto_466740 ?auto_466743 ) ) ( not ( = ?auto_466740 ?auto_466744 ) ) ( not ( = ?auto_466740 ?auto_466745 ) ) ( not ( = ?auto_466740 ?auto_466746 ) ) ( not ( = ?auto_466740 ?auto_466747 ) ) ( not ( = ?auto_466740 ?auto_466748 ) ) ( not ( = ?auto_466740 ?auto_466749 ) ) ( not ( = ?auto_466740 ?auto_466750 ) ) ( not ( = ?auto_466741 ?auto_466742 ) ) ( not ( = ?auto_466741 ?auto_466743 ) ) ( not ( = ?auto_466741 ?auto_466744 ) ) ( not ( = ?auto_466741 ?auto_466745 ) ) ( not ( = ?auto_466741 ?auto_466746 ) ) ( not ( = ?auto_466741 ?auto_466747 ) ) ( not ( = ?auto_466741 ?auto_466748 ) ) ( not ( = ?auto_466741 ?auto_466749 ) ) ( not ( = ?auto_466741 ?auto_466750 ) ) ( not ( = ?auto_466742 ?auto_466743 ) ) ( not ( = ?auto_466742 ?auto_466744 ) ) ( not ( = ?auto_466742 ?auto_466745 ) ) ( not ( = ?auto_466742 ?auto_466746 ) ) ( not ( = ?auto_466742 ?auto_466747 ) ) ( not ( = ?auto_466742 ?auto_466748 ) ) ( not ( = ?auto_466742 ?auto_466749 ) ) ( not ( = ?auto_466742 ?auto_466750 ) ) ( not ( = ?auto_466743 ?auto_466744 ) ) ( not ( = ?auto_466743 ?auto_466745 ) ) ( not ( = ?auto_466743 ?auto_466746 ) ) ( not ( = ?auto_466743 ?auto_466747 ) ) ( not ( = ?auto_466743 ?auto_466748 ) ) ( not ( = ?auto_466743 ?auto_466749 ) ) ( not ( = ?auto_466743 ?auto_466750 ) ) ( not ( = ?auto_466744 ?auto_466745 ) ) ( not ( = ?auto_466744 ?auto_466746 ) ) ( not ( = ?auto_466744 ?auto_466747 ) ) ( not ( = ?auto_466744 ?auto_466748 ) ) ( not ( = ?auto_466744 ?auto_466749 ) ) ( not ( = ?auto_466744 ?auto_466750 ) ) ( not ( = ?auto_466745 ?auto_466746 ) ) ( not ( = ?auto_466745 ?auto_466747 ) ) ( not ( = ?auto_466745 ?auto_466748 ) ) ( not ( = ?auto_466745 ?auto_466749 ) ) ( not ( = ?auto_466745 ?auto_466750 ) ) ( not ( = ?auto_466746 ?auto_466747 ) ) ( not ( = ?auto_466746 ?auto_466748 ) ) ( not ( = ?auto_466746 ?auto_466749 ) ) ( not ( = ?auto_466746 ?auto_466750 ) ) ( not ( = ?auto_466747 ?auto_466748 ) ) ( not ( = ?auto_466747 ?auto_466749 ) ) ( not ( = ?auto_466747 ?auto_466750 ) ) ( not ( = ?auto_466748 ?auto_466749 ) ) ( not ( = ?auto_466748 ?auto_466750 ) ) ( not ( = ?auto_466749 ?auto_466750 ) ) ( ON ?auto_466748 ?auto_466749 ) ( ON ?auto_466747 ?auto_466748 ) ( CLEAR ?auto_466745 ) ( ON ?auto_466746 ?auto_466747 ) ( CLEAR ?auto_466746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_466739 ?auto_466740 ?auto_466741 ?auto_466742 ?auto_466743 ?auto_466744 ?auto_466745 ?auto_466746 )
      ( MAKE-11PILE ?auto_466739 ?auto_466740 ?auto_466741 ?auto_466742 ?auto_466743 ?auto_466744 ?auto_466745 ?auto_466746 ?auto_466747 ?auto_466748 ?auto_466749 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_466785 - BLOCK
      ?auto_466786 - BLOCK
      ?auto_466787 - BLOCK
      ?auto_466788 - BLOCK
      ?auto_466789 - BLOCK
      ?auto_466790 - BLOCK
      ?auto_466791 - BLOCK
      ?auto_466792 - BLOCK
      ?auto_466793 - BLOCK
      ?auto_466794 - BLOCK
      ?auto_466795 - BLOCK
    )
    :vars
    (
      ?auto_466796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466795 ?auto_466796 ) ( ON-TABLE ?auto_466785 ) ( ON ?auto_466786 ?auto_466785 ) ( ON ?auto_466787 ?auto_466786 ) ( ON ?auto_466788 ?auto_466787 ) ( ON ?auto_466789 ?auto_466788 ) ( ON ?auto_466790 ?auto_466789 ) ( not ( = ?auto_466785 ?auto_466786 ) ) ( not ( = ?auto_466785 ?auto_466787 ) ) ( not ( = ?auto_466785 ?auto_466788 ) ) ( not ( = ?auto_466785 ?auto_466789 ) ) ( not ( = ?auto_466785 ?auto_466790 ) ) ( not ( = ?auto_466785 ?auto_466791 ) ) ( not ( = ?auto_466785 ?auto_466792 ) ) ( not ( = ?auto_466785 ?auto_466793 ) ) ( not ( = ?auto_466785 ?auto_466794 ) ) ( not ( = ?auto_466785 ?auto_466795 ) ) ( not ( = ?auto_466785 ?auto_466796 ) ) ( not ( = ?auto_466786 ?auto_466787 ) ) ( not ( = ?auto_466786 ?auto_466788 ) ) ( not ( = ?auto_466786 ?auto_466789 ) ) ( not ( = ?auto_466786 ?auto_466790 ) ) ( not ( = ?auto_466786 ?auto_466791 ) ) ( not ( = ?auto_466786 ?auto_466792 ) ) ( not ( = ?auto_466786 ?auto_466793 ) ) ( not ( = ?auto_466786 ?auto_466794 ) ) ( not ( = ?auto_466786 ?auto_466795 ) ) ( not ( = ?auto_466786 ?auto_466796 ) ) ( not ( = ?auto_466787 ?auto_466788 ) ) ( not ( = ?auto_466787 ?auto_466789 ) ) ( not ( = ?auto_466787 ?auto_466790 ) ) ( not ( = ?auto_466787 ?auto_466791 ) ) ( not ( = ?auto_466787 ?auto_466792 ) ) ( not ( = ?auto_466787 ?auto_466793 ) ) ( not ( = ?auto_466787 ?auto_466794 ) ) ( not ( = ?auto_466787 ?auto_466795 ) ) ( not ( = ?auto_466787 ?auto_466796 ) ) ( not ( = ?auto_466788 ?auto_466789 ) ) ( not ( = ?auto_466788 ?auto_466790 ) ) ( not ( = ?auto_466788 ?auto_466791 ) ) ( not ( = ?auto_466788 ?auto_466792 ) ) ( not ( = ?auto_466788 ?auto_466793 ) ) ( not ( = ?auto_466788 ?auto_466794 ) ) ( not ( = ?auto_466788 ?auto_466795 ) ) ( not ( = ?auto_466788 ?auto_466796 ) ) ( not ( = ?auto_466789 ?auto_466790 ) ) ( not ( = ?auto_466789 ?auto_466791 ) ) ( not ( = ?auto_466789 ?auto_466792 ) ) ( not ( = ?auto_466789 ?auto_466793 ) ) ( not ( = ?auto_466789 ?auto_466794 ) ) ( not ( = ?auto_466789 ?auto_466795 ) ) ( not ( = ?auto_466789 ?auto_466796 ) ) ( not ( = ?auto_466790 ?auto_466791 ) ) ( not ( = ?auto_466790 ?auto_466792 ) ) ( not ( = ?auto_466790 ?auto_466793 ) ) ( not ( = ?auto_466790 ?auto_466794 ) ) ( not ( = ?auto_466790 ?auto_466795 ) ) ( not ( = ?auto_466790 ?auto_466796 ) ) ( not ( = ?auto_466791 ?auto_466792 ) ) ( not ( = ?auto_466791 ?auto_466793 ) ) ( not ( = ?auto_466791 ?auto_466794 ) ) ( not ( = ?auto_466791 ?auto_466795 ) ) ( not ( = ?auto_466791 ?auto_466796 ) ) ( not ( = ?auto_466792 ?auto_466793 ) ) ( not ( = ?auto_466792 ?auto_466794 ) ) ( not ( = ?auto_466792 ?auto_466795 ) ) ( not ( = ?auto_466792 ?auto_466796 ) ) ( not ( = ?auto_466793 ?auto_466794 ) ) ( not ( = ?auto_466793 ?auto_466795 ) ) ( not ( = ?auto_466793 ?auto_466796 ) ) ( not ( = ?auto_466794 ?auto_466795 ) ) ( not ( = ?auto_466794 ?auto_466796 ) ) ( not ( = ?auto_466795 ?auto_466796 ) ) ( ON ?auto_466794 ?auto_466795 ) ( ON ?auto_466793 ?auto_466794 ) ( ON ?auto_466792 ?auto_466793 ) ( CLEAR ?auto_466790 ) ( ON ?auto_466791 ?auto_466792 ) ( CLEAR ?auto_466791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_466785 ?auto_466786 ?auto_466787 ?auto_466788 ?auto_466789 ?auto_466790 ?auto_466791 )
      ( MAKE-11PILE ?auto_466785 ?auto_466786 ?auto_466787 ?auto_466788 ?auto_466789 ?auto_466790 ?auto_466791 ?auto_466792 ?auto_466793 ?auto_466794 ?auto_466795 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_466831 - BLOCK
      ?auto_466832 - BLOCK
      ?auto_466833 - BLOCK
      ?auto_466834 - BLOCK
      ?auto_466835 - BLOCK
      ?auto_466836 - BLOCK
      ?auto_466837 - BLOCK
      ?auto_466838 - BLOCK
      ?auto_466839 - BLOCK
      ?auto_466840 - BLOCK
      ?auto_466841 - BLOCK
    )
    :vars
    (
      ?auto_466842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466841 ?auto_466842 ) ( ON-TABLE ?auto_466831 ) ( ON ?auto_466832 ?auto_466831 ) ( ON ?auto_466833 ?auto_466832 ) ( ON ?auto_466834 ?auto_466833 ) ( ON ?auto_466835 ?auto_466834 ) ( not ( = ?auto_466831 ?auto_466832 ) ) ( not ( = ?auto_466831 ?auto_466833 ) ) ( not ( = ?auto_466831 ?auto_466834 ) ) ( not ( = ?auto_466831 ?auto_466835 ) ) ( not ( = ?auto_466831 ?auto_466836 ) ) ( not ( = ?auto_466831 ?auto_466837 ) ) ( not ( = ?auto_466831 ?auto_466838 ) ) ( not ( = ?auto_466831 ?auto_466839 ) ) ( not ( = ?auto_466831 ?auto_466840 ) ) ( not ( = ?auto_466831 ?auto_466841 ) ) ( not ( = ?auto_466831 ?auto_466842 ) ) ( not ( = ?auto_466832 ?auto_466833 ) ) ( not ( = ?auto_466832 ?auto_466834 ) ) ( not ( = ?auto_466832 ?auto_466835 ) ) ( not ( = ?auto_466832 ?auto_466836 ) ) ( not ( = ?auto_466832 ?auto_466837 ) ) ( not ( = ?auto_466832 ?auto_466838 ) ) ( not ( = ?auto_466832 ?auto_466839 ) ) ( not ( = ?auto_466832 ?auto_466840 ) ) ( not ( = ?auto_466832 ?auto_466841 ) ) ( not ( = ?auto_466832 ?auto_466842 ) ) ( not ( = ?auto_466833 ?auto_466834 ) ) ( not ( = ?auto_466833 ?auto_466835 ) ) ( not ( = ?auto_466833 ?auto_466836 ) ) ( not ( = ?auto_466833 ?auto_466837 ) ) ( not ( = ?auto_466833 ?auto_466838 ) ) ( not ( = ?auto_466833 ?auto_466839 ) ) ( not ( = ?auto_466833 ?auto_466840 ) ) ( not ( = ?auto_466833 ?auto_466841 ) ) ( not ( = ?auto_466833 ?auto_466842 ) ) ( not ( = ?auto_466834 ?auto_466835 ) ) ( not ( = ?auto_466834 ?auto_466836 ) ) ( not ( = ?auto_466834 ?auto_466837 ) ) ( not ( = ?auto_466834 ?auto_466838 ) ) ( not ( = ?auto_466834 ?auto_466839 ) ) ( not ( = ?auto_466834 ?auto_466840 ) ) ( not ( = ?auto_466834 ?auto_466841 ) ) ( not ( = ?auto_466834 ?auto_466842 ) ) ( not ( = ?auto_466835 ?auto_466836 ) ) ( not ( = ?auto_466835 ?auto_466837 ) ) ( not ( = ?auto_466835 ?auto_466838 ) ) ( not ( = ?auto_466835 ?auto_466839 ) ) ( not ( = ?auto_466835 ?auto_466840 ) ) ( not ( = ?auto_466835 ?auto_466841 ) ) ( not ( = ?auto_466835 ?auto_466842 ) ) ( not ( = ?auto_466836 ?auto_466837 ) ) ( not ( = ?auto_466836 ?auto_466838 ) ) ( not ( = ?auto_466836 ?auto_466839 ) ) ( not ( = ?auto_466836 ?auto_466840 ) ) ( not ( = ?auto_466836 ?auto_466841 ) ) ( not ( = ?auto_466836 ?auto_466842 ) ) ( not ( = ?auto_466837 ?auto_466838 ) ) ( not ( = ?auto_466837 ?auto_466839 ) ) ( not ( = ?auto_466837 ?auto_466840 ) ) ( not ( = ?auto_466837 ?auto_466841 ) ) ( not ( = ?auto_466837 ?auto_466842 ) ) ( not ( = ?auto_466838 ?auto_466839 ) ) ( not ( = ?auto_466838 ?auto_466840 ) ) ( not ( = ?auto_466838 ?auto_466841 ) ) ( not ( = ?auto_466838 ?auto_466842 ) ) ( not ( = ?auto_466839 ?auto_466840 ) ) ( not ( = ?auto_466839 ?auto_466841 ) ) ( not ( = ?auto_466839 ?auto_466842 ) ) ( not ( = ?auto_466840 ?auto_466841 ) ) ( not ( = ?auto_466840 ?auto_466842 ) ) ( not ( = ?auto_466841 ?auto_466842 ) ) ( ON ?auto_466840 ?auto_466841 ) ( ON ?auto_466839 ?auto_466840 ) ( ON ?auto_466838 ?auto_466839 ) ( ON ?auto_466837 ?auto_466838 ) ( CLEAR ?auto_466835 ) ( ON ?auto_466836 ?auto_466837 ) ( CLEAR ?auto_466836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_466831 ?auto_466832 ?auto_466833 ?auto_466834 ?auto_466835 ?auto_466836 )
      ( MAKE-11PILE ?auto_466831 ?auto_466832 ?auto_466833 ?auto_466834 ?auto_466835 ?auto_466836 ?auto_466837 ?auto_466838 ?auto_466839 ?auto_466840 ?auto_466841 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_466877 - BLOCK
      ?auto_466878 - BLOCK
      ?auto_466879 - BLOCK
      ?auto_466880 - BLOCK
      ?auto_466881 - BLOCK
      ?auto_466882 - BLOCK
      ?auto_466883 - BLOCK
      ?auto_466884 - BLOCK
      ?auto_466885 - BLOCK
      ?auto_466886 - BLOCK
      ?auto_466887 - BLOCK
    )
    :vars
    (
      ?auto_466888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466887 ?auto_466888 ) ( ON-TABLE ?auto_466877 ) ( ON ?auto_466878 ?auto_466877 ) ( ON ?auto_466879 ?auto_466878 ) ( ON ?auto_466880 ?auto_466879 ) ( not ( = ?auto_466877 ?auto_466878 ) ) ( not ( = ?auto_466877 ?auto_466879 ) ) ( not ( = ?auto_466877 ?auto_466880 ) ) ( not ( = ?auto_466877 ?auto_466881 ) ) ( not ( = ?auto_466877 ?auto_466882 ) ) ( not ( = ?auto_466877 ?auto_466883 ) ) ( not ( = ?auto_466877 ?auto_466884 ) ) ( not ( = ?auto_466877 ?auto_466885 ) ) ( not ( = ?auto_466877 ?auto_466886 ) ) ( not ( = ?auto_466877 ?auto_466887 ) ) ( not ( = ?auto_466877 ?auto_466888 ) ) ( not ( = ?auto_466878 ?auto_466879 ) ) ( not ( = ?auto_466878 ?auto_466880 ) ) ( not ( = ?auto_466878 ?auto_466881 ) ) ( not ( = ?auto_466878 ?auto_466882 ) ) ( not ( = ?auto_466878 ?auto_466883 ) ) ( not ( = ?auto_466878 ?auto_466884 ) ) ( not ( = ?auto_466878 ?auto_466885 ) ) ( not ( = ?auto_466878 ?auto_466886 ) ) ( not ( = ?auto_466878 ?auto_466887 ) ) ( not ( = ?auto_466878 ?auto_466888 ) ) ( not ( = ?auto_466879 ?auto_466880 ) ) ( not ( = ?auto_466879 ?auto_466881 ) ) ( not ( = ?auto_466879 ?auto_466882 ) ) ( not ( = ?auto_466879 ?auto_466883 ) ) ( not ( = ?auto_466879 ?auto_466884 ) ) ( not ( = ?auto_466879 ?auto_466885 ) ) ( not ( = ?auto_466879 ?auto_466886 ) ) ( not ( = ?auto_466879 ?auto_466887 ) ) ( not ( = ?auto_466879 ?auto_466888 ) ) ( not ( = ?auto_466880 ?auto_466881 ) ) ( not ( = ?auto_466880 ?auto_466882 ) ) ( not ( = ?auto_466880 ?auto_466883 ) ) ( not ( = ?auto_466880 ?auto_466884 ) ) ( not ( = ?auto_466880 ?auto_466885 ) ) ( not ( = ?auto_466880 ?auto_466886 ) ) ( not ( = ?auto_466880 ?auto_466887 ) ) ( not ( = ?auto_466880 ?auto_466888 ) ) ( not ( = ?auto_466881 ?auto_466882 ) ) ( not ( = ?auto_466881 ?auto_466883 ) ) ( not ( = ?auto_466881 ?auto_466884 ) ) ( not ( = ?auto_466881 ?auto_466885 ) ) ( not ( = ?auto_466881 ?auto_466886 ) ) ( not ( = ?auto_466881 ?auto_466887 ) ) ( not ( = ?auto_466881 ?auto_466888 ) ) ( not ( = ?auto_466882 ?auto_466883 ) ) ( not ( = ?auto_466882 ?auto_466884 ) ) ( not ( = ?auto_466882 ?auto_466885 ) ) ( not ( = ?auto_466882 ?auto_466886 ) ) ( not ( = ?auto_466882 ?auto_466887 ) ) ( not ( = ?auto_466882 ?auto_466888 ) ) ( not ( = ?auto_466883 ?auto_466884 ) ) ( not ( = ?auto_466883 ?auto_466885 ) ) ( not ( = ?auto_466883 ?auto_466886 ) ) ( not ( = ?auto_466883 ?auto_466887 ) ) ( not ( = ?auto_466883 ?auto_466888 ) ) ( not ( = ?auto_466884 ?auto_466885 ) ) ( not ( = ?auto_466884 ?auto_466886 ) ) ( not ( = ?auto_466884 ?auto_466887 ) ) ( not ( = ?auto_466884 ?auto_466888 ) ) ( not ( = ?auto_466885 ?auto_466886 ) ) ( not ( = ?auto_466885 ?auto_466887 ) ) ( not ( = ?auto_466885 ?auto_466888 ) ) ( not ( = ?auto_466886 ?auto_466887 ) ) ( not ( = ?auto_466886 ?auto_466888 ) ) ( not ( = ?auto_466887 ?auto_466888 ) ) ( ON ?auto_466886 ?auto_466887 ) ( ON ?auto_466885 ?auto_466886 ) ( ON ?auto_466884 ?auto_466885 ) ( ON ?auto_466883 ?auto_466884 ) ( ON ?auto_466882 ?auto_466883 ) ( CLEAR ?auto_466880 ) ( ON ?auto_466881 ?auto_466882 ) ( CLEAR ?auto_466881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_466877 ?auto_466878 ?auto_466879 ?auto_466880 ?auto_466881 )
      ( MAKE-11PILE ?auto_466877 ?auto_466878 ?auto_466879 ?auto_466880 ?auto_466881 ?auto_466882 ?auto_466883 ?auto_466884 ?auto_466885 ?auto_466886 ?auto_466887 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_466923 - BLOCK
      ?auto_466924 - BLOCK
      ?auto_466925 - BLOCK
      ?auto_466926 - BLOCK
      ?auto_466927 - BLOCK
      ?auto_466928 - BLOCK
      ?auto_466929 - BLOCK
      ?auto_466930 - BLOCK
      ?auto_466931 - BLOCK
      ?auto_466932 - BLOCK
      ?auto_466933 - BLOCK
    )
    :vars
    (
      ?auto_466934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466933 ?auto_466934 ) ( ON-TABLE ?auto_466923 ) ( ON ?auto_466924 ?auto_466923 ) ( ON ?auto_466925 ?auto_466924 ) ( not ( = ?auto_466923 ?auto_466924 ) ) ( not ( = ?auto_466923 ?auto_466925 ) ) ( not ( = ?auto_466923 ?auto_466926 ) ) ( not ( = ?auto_466923 ?auto_466927 ) ) ( not ( = ?auto_466923 ?auto_466928 ) ) ( not ( = ?auto_466923 ?auto_466929 ) ) ( not ( = ?auto_466923 ?auto_466930 ) ) ( not ( = ?auto_466923 ?auto_466931 ) ) ( not ( = ?auto_466923 ?auto_466932 ) ) ( not ( = ?auto_466923 ?auto_466933 ) ) ( not ( = ?auto_466923 ?auto_466934 ) ) ( not ( = ?auto_466924 ?auto_466925 ) ) ( not ( = ?auto_466924 ?auto_466926 ) ) ( not ( = ?auto_466924 ?auto_466927 ) ) ( not ( = ?auto_466924 ?auto_466928 ) ) ( not ( = ?auto_466924 ?auto_466929 ) ) ( not ( = ?auto_466924 ?auto_466930 ) ) ( not ( = ?auto_466924 ?auto_466931 ) ) ( not ( = ?auto_466924 ?auto_466932 ) ) ( not ( = ?auto_466924 ?auto_466933 ) ) ( not ( = ?auto_466924 ?auto_466934 ) ) ( not ( = ?auto_466925 ?auto_466926 ) ) ( not ( = ?auto_466925 ?auto_466927 ) ) ( not ( = ?auto_466925 ?auto_466928 ) ) ( not ( = ?auto_466925 ?auto_466929 ) ) ( not ( = ?auto_466925 ?auto_466930 ) ) ( not ( = ?auto_466925 ?auto_466931 ) ) ( not ( = ?auto_466925 ?auto_466932 ) ) ( not ( = ?auto_466925 ?auto_466933 ) ) ( not ( = ?auto_466925 ?auto_466934 ) ) ( not ( = ?auto_466926 ?auto_466927 ) ) ( not ( = ?auto_466926 ?auto_466928 ) ) ( not ( = ?auto_466926 ?auto_466929 ) ) ( not ( = ?auto_466926 ?auto_466930 ) ) ( not ( = ?auto_466926 ?auto_466931 ) ) ( not ( = ?auto_466926 ?auto_466932 ) ) ( not ( = ?auto_466926 ?auto_466933 ) ) ( not ( = ?auto_466926 ?auto_466934 ) ) ( not ( = ?auto_466927 ?auto_466928 ) ) ( not ( = ?auto_466927 ?auto_466929 ) ) ( not ( = ?auto_466927 ?auto_466930 ) ) ( not ( = ?auto_466927 ?auto_466931 ) ) ( not ( = ?auto_466927 ?auto_466932 ) ) ( not ( = ?auto_466927 ?auto_466933 ) ) ( not ( = ?auto_466927 ?auto_466934 ) ) ( not ( = ?auto_466928 ?auto_466929 ) ) ( not ( = ?auto_466928 ?auto_466930 ) ) ( not ( = ?auto_466928 ?auto_466931 ) ) ( not ( = ?auto_466928 ?auto_466932 ) ) ( not ( = ?auto_466928 ?auto_466933 ) ) ( not ( = ?auto_466928 ?auto_466934 ) ) ( not ( = ?auto_466929 ?auto_466930 ) ) ( not ( = ?auto_466929 ?auto_466931 ) ) ( not ( = ?auto_466929 ?auto_466932 ) ) ( not ( = ?auto_466929 ?auto_466933 ) ) ( not ( = ?auto_466929 ?auto_466934 ) ) ( not ( = ?auto_466930 ?auto_466931 ) ) ( not ( = ?auto_466930 ?auto_466932 ) ) ( not ( = ?auto_466930 ?auto_466933 ) ) ( not ( = ?auto_466930 ?auto_466934 ) ) ( not ( = ?auto_466931 ?auto_466932 ) ) ( not ( = ?auto_466931 ?auto_466933 ) ) ( not ( = ?auto_466931 ?auto_466934 ) ) ( not ( = ?auto_466932 ?auto_466933 ) ) ( not ( = ?auto_466932 ?auto_466934 ) ) ( not ( = ?auto_466933 ?auto_466934 ) ) ( ON ?auto_466932 ?auto_466933 ) ( ON ?auto_466931 ?auto_466932 ) ( ON ?auto_466930 ?auto_466931 ) ( ON ?auto_466929 ?auto_466930 ) ( ON ?auto_466928 ?auto_466929 ) ( ON ?auto_466927 ?auto_466928 ) ( CLEAR ?auto_466925 ) ( ON ?auto_466926 ?auto_466927 ) ( CLEAR ?auto_466926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_466923 ?auto_466924 ?auto_466925 ?auto_466926 )
      ( MAKE-11PILE ?auto_466923 ?auto_466924 ?auto_466925 ?auto_466926 ?auto_466927 ?auto_466928 ?auto_466929 ?auto_466930 ?auto_466931 ?auto_466932 ?auto_466933 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_466969 - BLOCK
      ?auto_466970 - BLOCK
      ?auto_466971 - BLOCK
      ?auto_466972 - BLOCK
      ?auto_466973 - BLOCK
      ?auto_466974 - BLOCK
      ?auto_466975 - BLOCK
      ?auto_466976 - BLOCK
      ?auto_466977 - BLOCK
      ?auto_466978 - BLOCK
      ?auto_466979 - BLOCK
    )
    :vars
    (
      ?auto_466980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_466979 ?auto_466980 ) ( ON-TABLE ?auto_466969 ) ( ON ?auto_466970 ?auto_466969 ) ( not ( = ?auto_466969 ?auto_466970 ) ) ( not ( = ?auto_466969 ?auto_466971 ) ) ( not ( = ?auto_466969 ?auto_466972 ) ) ( not ( = ?auto_466969 ?auto_466973 ) ) ( not ( = ?auto_466969 ?auto_466974 ) ) ( not ( = ?auto_466969 ?auto_466975 ) ) ( not ( = ?auto_466969 ?auto_466976 ) ) ( not ( = ?auto_466969 ?auto_466977 ) ) ( not ( = ?auto_466969 ?auto_466978 ) ) ( not ( = ?auto_466969 ?auto_466979 ) ) ( not ( = ?auto_466969 ?auto_466980 ) ) ( not ( = ?auto_466970 ?auto_466971 ) ) ( not ( = ?auto_466970 ?auto_466972 ) ) ( not ( = ?auto_466970 ?auto_466973 ) ) ( not ( = ?auto_466970 ?auto_466974 ) ) ( not ( = ?auto_466970 ?auto_466975 ) ) ( not ( = ?auto_466970 ?auto_466976 ) ) ( not ( = ?auto_466970 ?auto_466977 ) ) ( not ( = ?auto_466970 ?auto_466978 ) ) ( not ( = ?auto_466970 ?auto_466979 ) ) ( not ( = ?auto_466970 ?auto_466980 ) ) ( not ( = ?auto_466971 ?auto_466972 ) ) ( not ( = ?auto_466971 ?auto_466973 ) ) ( not ( = ?auto_466971 ?auto_466974 ) ) ( not ( = ?auto_466971 ?auto_466975 ) ) ( not ( = ?auto_466971 ?auto_466976 ) ) ( not ( = ?auto_466971 ?auto_466977 ) ) ( not ( = ?auto_466971 ?auto_466978 ) ) ( not ( = ?auto_466971 ?auto_466979 ) ) ( not ( = ?auto_466971 ?auto_466980 ) ) ( not ( = ?auto_466972 ?auto_466973 ) ) ( not ( = ?auto_466972 ?auto_466974 ) ) ( not ( = ?auto_466972 ?auto_466975 ) ) ( not ( = ?auto_466972 ?auto_466976 ) ) ( not ( = ?auto_466972 ?auto_466977 ) ) ( not ( = ?auto_466972 ?auto_466978 ) ) ( not ( = ?auto_466972 ?auto_466979 ) ) ( not ( = ?auto_466972 ?auto_466980 ) ) ( not ( = ?auto_466973 ?auto_466974 ) ) ( not ( = ?auto_466973 ?auto_466975 ) ) ( not ( = ?auto_466973 ?auto_466976 ) ) ( not ( = ?auto_466973 ?auto_466977 ) ) ( not ( = ?auto_466973 ?auto_466978 ) ) ( not ( = ?auto_466973 ?auto_466979 ) ) ( not ( = ?auto_466973 ?auto_466980 ) ) ( not ( = ?auto_466974 ?auto_466975 ) ) ( not ( = ?auto_466974 ?auto_466976 ) ) ( not ( = ?auto_466974 ?auto_466977 ) ) ( not ( = ?auto_466974 ?auto_466978 ) ) ( not ( = ?auto_466974 ?auto_466979 ) ) ( not ( = ?auto_466974 ?auto_466980 ) ) ( not ( = ?auto_466975 ?auto_466976 ) ) ( not ( = ?auto_466975 ?auto_466977 ) ) ( not ( = ?auto_466975 ?auto_466978 ) ) ( not ( = ?auto_466975 ?auto_466979 ) ) ( not ( = ?auto_466975 ?auto_466980 ) ) ( not ( = ?auto_466976 ?auto_466977 ) ) ( not ( = ?auto_466976 ?auto_466978 ) ) ( not ( = ?auto_466976 ?auto_466979 ) ) ( not ( = ?auto_466976 ?auto_466980 ) ) ( not ( = ?auto_466977 ?auto_466978 ) ) ( not ( = ?auto_466977 ?auto_466979 ) ) ( not ( = ?auto_466977 ?auto_466980 ) ) ( not ( = ?auto_466978 ?auto_466979 ) ) ( not ( = ?auto_466978 ?auto_466980 ) ) ( not ( = ?auto_466979 ?auto_466980 ) ) ( ON ?auto_466978 ?auto_466979 ) ( ON ?auto_466977 ?auto_466978 ) ( ON ?auto_466976 ?auto_466977 ) ( ON ?auto_466975 ?auto_466976 ) ( ON ?auto_466974 ?auto_466975 ) ( ON ?auto_466973 ?auto_466974 ) ( ON ?auto_466972 ?auto_466973 ) ( CLEAR ?auto_466970 ) ( ON ?auto_466971 ?auto_466972 ) ( CLEAR ?auto_466971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_466969 ?auto_466970 ?auto_466971 )
      ( MAKE-11PILE ?auto_466969 ?auto_466970 ?auto_466971 ?auto_466972 ?auto_466973 ?auto_466974 ?auto_466975 ?auto_466976 ?auto_466977 ?auto_466978 ?auto_466979 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_467015 - BLOCK
      ?auto_467016 - BLOCK
      ?auto_467017 - BLOCK
      ?auto_467018 - BLOCK
      ?auto_467019 - BLOCK
      ?auto_467020 - BLOCK
      ?auto_467021 - BLOCK
      ?auto_467022 - BLOCK
      ?auto_467023 - BLOCK
      ?auto_467024 - BLOCK
      ?auto_467025 - BLOCK
    )
    :vars
    (
      ?auto_467026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467025 ?auto_467026 ) ( ON-TABLE ?auto_467015 ) ( not ( = ?auto_467015 ?auto_467016 ) ) ( not ( = ?auto_467015 ?auto_467017 ) ) ( not ( = ?auto_467015 ?auto_467018 ) ) ( not ( = ?auto_467015 ?auto_467019 ) ) ( not ( = ?auto_467015 ?auto_467020 ) ) ( not ( = ?auto_467015 ?auto_467021 ) ) ( not ( = ?auto_467015 ?auto_467022 ) ) ( not ( = ?auto_467015 ?auto_467023 ) ) ( not ( = ?auto_467015 ?auto_467024 ) ) ( not ( = ?auto_467015 ?auto_467025 ) ) ( not ( = ?auto_467015 ?auto_467026 ) ) ( not ( = ?auto_467016 ?auto_467017 ) ) ( not ( = ?auto_467016 ?auto_467018 ) ) ( not ( = ?auto_467016 ?auto_467019 ) ) ( not ( = ?auto_467016 ?auto_467020 ) ) ( not ( = ?auto_467016 ?auto_467021 ) ) ( not ( = ?auto_467016 ?auto_467022 ) ) ( not ( = ?auto_467016 ?auto_467023 ) ) ( not ( = ?auto_467016 ?auto_467024 ) ) ( not ( = ?auto_467016 ?auto_467025 ) ) ( not ( = ?auto_467016 ?auto_467026 ) ) ( not ( = ?auto_467017 ?auto_467018 ) ) ( not ( = ?auto_467017 ?auto_467019 ) ) ( not ( = ?auto_467017 ?auto_467020 ) ) ( not ( = ?auto_467017 ?auto_467021 ) ) ( not ( = ?auto_467017 ?auto_467022 ) ) ( not ( = ?auto_467017 ?auto_467023 ) ) ( not ( = ?auto_467017 ?auto_467024 ) ) ( not ( = ?auto_467017 ?auto_467025 ) ) ( not ( = ?auto_467017 ?auto_467026 ) ) ( not ( = ?auto_467018 ?auto_467019 ) ) ( not ( = ?auto_467018 ?auto_467020 ) ) ( not ( = ?auto_467018 ?auto_467021 ) ) ( not ( = ?auto_467018 ?auto_467022 ) ) ( not ( = ?auto_467018 ?auto_467023 ) ) ( not ( = ?auto_467018 ?auto_467024 ) ) ( not ( = ?auto_467018 ?auto_467025 ) ) ( not ( = ?auto_467018 ?auto_467026 ) ) ( not ( = ?auto_467019 ?auto_467020 ) ) ( not ( = ?auto_467019 ?auto_467021 ) ) ( not ( = ?auto_467019 ?auto_467022 ) ) ( not ( = ?auto_467019 ?auto_467023 ) ) ( not ( = ?auto_467019 ?auto_467024 ) ) ( not ( = ?auto_467019 ?auto_467025 ) ) ( not ( = ?auto_467019 ?auto_467026 ) ) ( not ( = ?auto_467020 ?auto_467021 ) ) ( not ( = ?auto_467020 ?auto_467022 ) ) ( not ( = ?auto_467020 ?auto_467023 ) ) ( not ( = ?auto_467020 ?auto_467024 ) ) ( not ( = ?auto_467020 ?auto_467025 ) ) ( not ( = ?auto_467020 ?auto_467026 ) ) ( not ( = ?auto_467021 ?auto_467022 ) ) ( not ( = ?auto_467021 ?auto_467023 ) ) ( not ( = ?auto_467021 ?auto_467024 ) ) ( not ( = ?auto_467021 ?auto_467025 ) ) ( not ( = ?auto_467021 ?auto_467026 ) ) ( not ( = ?auto_467022 ?auto_467023 ) ) ( not ( = ?auto_467022 ?auto_467024 ) ) ( not ( = ?auto_467022 ?auto_467025 ) ) ( not ( = ?auto_467022 ?auto_467026 ) ) ( not ( = ?auto_467023 ?auto_467024 ) ) ( not ( = ?auto_467023 ?auto_467025 ) ) ( not ( = ?auto_467023 ?auto_467026 ) ) ( not ( = ?auto_467024 ?auto_467025 ) ) ( not ( = ?auto_467024 ?auto_467026 ) ) ( not ( = ?auto_467025 ?auto_467026 ) ) ( ON ?auto_467024 ?auto_467025 ) ( ON ?auto_467023 ?auto_467024 ) ( ON ?auto_467022 ?auto_467023 ) ( ON ?auto_467021 ?auto_467022 ) ( ON ?auto_467020 ?auto_467021 ) ( ON ?auto_467019 ?auto_467020 ) ( ON ?auto_467018 ?auto_467019 ) ( ON ?auto_467017 ?auto_467018 ) ( CLEAR ?auto_467015 ) ( ON ?auto_467016 ?auto_467017 ) ( CLEAR ?auto_467016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_467015 ?auto_467016 )
      ( MAKE-11PILE ?auto_467015 ?auto_467016 ?auto_467017 ?auto_467018 ?auto_467019 ?auto_467020 ?auto_467021 ?auto_467022 ?auto_467023 ?auto_467024 ?auto_467025 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_467061 - BLOCK
      ?auto_467062 - BLOCK
      ?auto_467063 - BLOCK
      ?auto_467064 - BLOCK
      ?auto_467065 - BLOCK
      ?auto_467066 - BLOCK
      ?auto_467067 - BLOCK
      ?auto_467068 - BLOCK
      ?auto_467069 - BLOCK
      ?auto_467070 - BLOCK
      ?auto_467071 - BLOCK
    )
    :vars
    (
      ?auto_467072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467071 ?auto_467072 ) ( not ( = ?auto_467061 ?auto_467062 ) ) ( not ( = ?auto_467061 ?auto_467063 ) ) ( not ( = ?auto_467061 ?auto_467064 ) ) ( not ( = ?auto_467061 ?auto_467065 ) ) ( not ( = ?auto_467061 ?auto_467066 ) ) ( not ( = ?auto_467061 ?auto_467067 ) ) ( not ( = ?auto_467061 ?auto_467068 ) ) ( not ( = ?auto_467061 ?auto_467069 ) ) ( not ( = ?auto_467061 ?auto_467070 ) ) ( not ( = ?auto_467061 ?auto_467071 ) ) ( not ( = ?auto_467061 ?auto_467072 ) ) ( not ( = ?auto_467062 ?auto_467063 ) ) ( not ( = ?auto_467062 ?auto_467064 ) ) ( not ( = ?auto_467062 ?auto_467065 ) ) ( not ( = ?auto_467062 ?auto_467066 ) ) ( not ( = ?auto_467062 ?auto_467067 ) ) ( not ( = ?auto_467062 ?auto_467068 ) ) ( not ( = ?auto_467062 ?auto_467069 ) ) ( not ( = ?auto_467062 ?auto_467070 ) ) ( not ( = ?auto_467062 ?auto_467071 ) ) ( not ( = ?auto_467062 ?auto_467072 ) ) ( not ( = ?auto_467063 ?auto_467064 ) ) ( not ( = ?auto_467063 ?auto_467065 ) ) ( not ( = ?auto_467063 ?auto_467066 ) ) ( not ( = ?auto_467063 ?auto_467067 ) ) ( not ( = ?auto_467063 ?auto_467068 ) ) ( not ( = ?auto_467063 ?auto_467069 ) ) ( not ( = ?auto_467063 ?auto_467070 ) ) ( not ( = ?auto_467063 ?auto_467071 ) ) ( not ( = ?auto_467063 ?auto_467072 ) ) ( not ( = ?auto_467064 ?auto_467065 ) ) ( not ( = ?auto_467064 ?auto_467066 ) ) ( not ( = ?auto_467064 ?auto_467067 ) ) ( not ( = ?auto_467064 ?auto_467068 ) ) ( not ( = ?auto_467064 ?auto_467069 ) ) ( not ( = ?auto_467064 ?auto_467070 ) ) ( not ( = ?auto_467064 ?auto_467071 ) ) ( not ( = ?auto_467064 ?auto_467072 ) ) ( not ( = ?auto_467065 ?auto_467066 ) ) ( not ( = ?auto_467065 ?auto_467067 ) ) ( not ( = ?auto_467065 ?auto_467068 ) ) ( not ( = ?auto_467065 ?auto_467069 ) ) ( not ( = ?auto_467065 ?auto_467070 ) ) ( not ( = ?auto_467065 ?auto_467071 ) ) ( not ( = ?auto_467065 ?auto_467072 ) ) ( not ( = ?auto_467066 ?auto_467067 ) ) ( not ( = ?auto_467066 ?auto_467068 ) ) ( not ( = ?auto_467066 ?auto_467069 ) ) ( not ( = ?auto_467066 ?auto_467070 ) ) ( not ( = ?auto_467066 ?auto_467071 ) ) ( not ( = ?auto_467066 ?auto_467072 ) ) ( not ( = ?auto_467067 ?auto_467068 ) ) ( not ( = ?auto_467067 ?auto_467069 ) ) ( not ( = ?auto_467067 ?auto_467070 ) ) ( not ( = ?auto_467067 ?auto_467071 ) ) ( not ( = ?auto_467067 ?auto_467072 ) ) ( not ( = ?auto_467068 ?auto_467069 ) ) ( not ( = ?auto_467068 ?auto_467070 ) ) ( not ( = ?auto_467068 ?auto_467071 ) ) ( not ( = ?auto_467068 ?auto_467072 ) ) ( not ( = ?auto_467069 ?auto_467070 ) ) ( not ( = ?auto_467069 ?auto_467071 ) ) ( not ( = ?auto_467069 ?auto_467072 ) ) ( not ( = ?auto_467070 ?auto_467071 ) ) ( not ( = ?auto_467070 ?auto_467072 ) ) ( not ( = ?auto_467071 ?auto_467072 ) ) ( ON ?auto_467070 ?auto_467071 ) ( ON ?auto_467069 ?auto_467070 ) ( ON ?auto_467068 ?auto_467069 ) ( ON ?auto_467067 ?auto_467068 ) ( ON ?auto_467066 ?auto_467067 ) ( ON ?auto_467065 ?auto_467066 ) ( ON ?auto_467064 ?auto_467065 ) ( ON ?auto_467063 ?auto_467064 ) ( ON ?auto_467062 ?auto_467063 ) ( ON ?auto_467061 ?auto_467062 ) ( CLEAR ?auto_467061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_467061 )
      ( MAKE-11PILE ?auto_467061 ?auto_467062 ?auto_467063 ?auto_467064 ?auto_467065 ?auto_467066 ?auto_467067 ?auto_467068 ?auto_467069 ?auto_467070 ?auto_467071 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_467108 - BLOCK
      ?auto_467109 - BLOCK
      ?auto_467110 - BLOCK
      ?auto_467111 - BLOCK
      ?auto_467112 - BLOCK
      ?auto_467113 - BLOCK
      ?auto_467114 - BLOCK
      ?auto_467115 - BLOCK
      ?auto_467116 - BLOCK
      ?auto_467117 - BLOCK
      ?auto_467118 - BLOCK
      ?auto_467119 - BLOCK
    )
    :vars
    (
      ?auto_467120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_467118 ) ( ON ?auto_467119 ?auto_467120 ) ( CLEAR ?auto_467119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_467108 ) ( ON ?auto_467109 ?auto_467108 ) ( ON ?auto_467110 ?auto_467109 ) ( ON ?auto_467111 ?auto_467110 ) ( ON ?auto_467112 ?auto_467111 ) ( ON ?auto_467113 ?auto_467112 ) ( ON ?auto_467114 ?auto_467113 ) ( ON ?auto_467115 ?auto_467114 ) ( ON ?auto_467116 ?auto_467115 ) ( ON ?auto_467117 ?auto_467116 ) ( ON ?auto_467118 ?auto_467117 ) ( not ( = ?auto_467108 ?auto_467109 ) ) ( not ( = ?auto_467108 ?auto_467110 ) ) ( not ( = ?auto_467108 ?auto_467111 ) ) ( not ( = ?auto_467108 ?auto_467112 ) ) ( not ( = ?auto_467108 ?auto_467113 ) ) ( not ( = ?auto_467108 ?auto_467114 ) ) ( not ( = ?auto_467108 ?auto_467115 ) ) ( not ( = ?auto_467108 ?auto_467116 ) ) ( not ( = ?auto_467108 ?auto_467117 ) ) ( not ( = ?auto_467108 ?auto_467118 ) ) ( not ( = ?auto_467108 ?auto_467119 ) ) ( not ( = ?auto_467108 ?auto_467120 ) ) ( not ( = ?auto_467109 ?auto_467110 ) ) ( not ( = ?auto_467109 ?auto_467111 ) ) ( not ( = ?auto_467109 ?auto_467112 ) ) ( not ( = ?auto_467109 ?auto_467113 ) ) ( not ( = ?auto_467109 ?auto_467114 ) ) ( not ( = ?auto_467109 ?auto_467115 ) ) ( not ( = ?auto_467109 ?auto_467116 ) ) ( not ( = ?auto_467109 ?auto_467117 ) ) ( not ( = ?auto_467109 ?auto_467118 ) ) ( not ( = ?auto_467109 ?auto_467119 ) ) ( not ( = ?auto_467109 ?auto_467120 ) ) ( not ( = ?auto_467110 ?auto_467111 ) ) ( not ( = ?auto_467110 ?auto_467112 ) ) ( not ( = ?auto_467110 ?auto_467113 ) ) ( not ( = ?auto_467110 ?auto_467114 ) ) ( not ( = ?auto_467110 ?auto_467115 ) ) ( not ( = ?auto_467110 ?auto_467116 ) ) ( not ( = ?auto_467110 ?auto_467117 ) ) ( not ( = ?auto_467110 ?auto_467118 ) ) ( not ( = ?auto_467110 ?auto_467119 ) ) ( not ( = ?auto_467110 ?auto_467120 ) ) ( not ( = ?auto_467111 ?auto_467112 ) ) ( not ( = ?auto_467111 ?auto_467113 ) ) ( not ( = ?auto_467111 ?auto_467114 ) ) ( not ( = ?auto_467111 ?auto_467115 ) ) ( not ( = ?auto_467111 ?auto_467116 ) ) ( not ( = ?auto_467111 ?auto_467117 ) ) ( not ( = ?auto_467111 ?auto_467118 ) ) ( not ( = ?auto_467111 ?auto_467119 ) ) ( not ( = ?auto_467111 ?auto_467120 ) ) ( not ( = ?auto_467112 ?auto_467113 ) ) ( not ( = ?auto_467112 ?auto_467114 ) ) ( not ( = ?auto_467112 ?auto_467115 ) ) ( not ( = ?auto_467112 ?auto_467116 ) ) ( not ( = ?auto_467112 ?auto_467117 ) ) ( not ( = ?auto_467112 ?auto_467118 ) ) ( not ( = ?auto_467112 ?auto_467119 ) ) ( not ( = ?auto_467112 ?auto_467120 ) ) ( not ( = ?auto_467113 ?auto_467114 ) ) ( not ( = ?auto_467113 ?auto_467115 ) ) ( not ( = ?auto_467113 ?auto_467116 ) ) ( not ( = ?auto_467113 ?auto_467117 ) ) ( not ( = ?auto_467113 ?auto_467118 ) ) ( not ( = ?auto_467113 ?auto_467119 ) ) ( not ( = ?auto_467113 ?auto_467120 ) ) ( not ( = ?auto_467114 ?auto_467115 ) ) ( not ( = ?auto_467114 ?auto_467116 ) ) ( not ( = ?auto_467114 ?auto_467117 ) ) ( not ( = ?auto_467114 ?auto_467118 ) ) ( not ( = ?auto_467114 ?auto_467119 ) ) ( not ( = ?auto_467114 ?auto_467120 ) ) ( not ( = ?auto_467115 ?auto_467116 ) ) ( not ( = ?auto_467115 ?auto_467117 ) ) ( not ( = ?auto_467115 ?auto_467118 ) ) ( not ( = ?auto_467115 ?auto_467119 ) ) ( not ( = ?auto_467115 ?auto_467120 ) ) ( not ( = ?auto_467116 ?auto_467117 ) ) ( not ( = ?auto_467116 ?auto_467118 ) ) ( not ( = ?auto_467116 ?auto_467119 ) ) ( not ( = ?auto_467116 ?auto_467120 ) ) ( not ( = ?auto_467117 ?auto_467118 ) ) ( not ( = ?auto_467117 ?auto_467119 ) ) ( not ( = ?auto_467117 ?auto_467120 ) ) ( not ( = ?auto_467118 ?auto_467119 ) ) ( not ( = ?auto_467118 ?auto_467120 ) ) ( not ( = ?auto_467119 ?auto_467120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_467119 ?auto_467120 )
      ( !STACK ?auto_467119 ?auto_467118 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_467158 - BLOCK
      ?auto_467159 - BLOCK
      ?auto_467160 - BLOCK
      ?auto_467161 - BLOCK
      ?auto_467162 - BLOCK
      ?auto_467163 - BLOCK
      ?auto_467164 - BLOCK
      ?auto_467165 - BLOCK
      ?auto_467166 - BLOCK
      ?auto_467167 - BLOCK
      ?auto_467168 - BLOCK
      ?auto_467169 - BLOCK
    )
    :vars
    (
      ?auto_467170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467169 ?auto_467170 ) ( ON-TABLE ?auto_467158 ) ( ON ?auto_467159 ?auto_467158 ) ( ON ?auto_467160 ?auto_467159 ) ( ON ?auto_467161 ?auto_467160 ) ( ON ?auto_467162 ?auto_467161 ) ( ON ?auto_467163 ?auto_467162 ) ( ON ?auto_467164 ?auto_467163 ) ( ON ?auto_467165 ?auto_467164 ) ( ON ?auto_467166 ?auto_467165 ) ( ON ?auto_467167 ?auto_467166 ) ( not ( = ?auto_467158 ?auto_467159 ) ) ( not ( = ?auto_467158 ?auto_467160 ) ) ( not ( = ?auto_467158 ?auto_467161 ) ) ( not ( = ?auto_467158 ?auto_467162 ) ) ( not ( = ?auto_467158 ?auto_467163 ) ) ( not ( = ?auto_467158 ?auto_467164 ) ) ( not ( = ?auto_467158 ?auto_467165 ) ) ( not ( = ?auto_467158 ?auto_467166 ) ) ( not ( = ?auto_467158 ?auto_467167 ) ) ( not ( = ?auto_467158 ?auto_467168 ) ) ( not ( = ?auto_467158 ?auto_467169 ) ) ( not ( = ?auto_467158 ?auto_467170 ) ) ( not ( = ?auto_467159 ?auto_467160 ) ) ( not ( = ?auto_467159 ?auto_467161 ) ) ( not ( = ?auto_467159 ?auto_467162 ) ) ( not ( = ?auto_467159 ?auto_467163 ) ) ( not ( = ?auto_467159 ?auto_467164 ) ) ( not ( = ?auto_467159 ?auto_467165 ) ) ( not ( = ?auto_467159 ?auto_467166 ) ) ( not ( = ?auto_467159 ?auto_467167 ) ) ( not ( = ?auto_467159 ?auto_467168 ) ) ( not ( = ?auto_467159 ?auto_467169 ) ) ( not ( = ?auto_467159 ?auto_467170 ) ) ( not ( = ?auto_467160 ?auto_467161 ) ) ( not ( = ?auto_467160 ?auto_467162 ) ) ( not ( = ?auto_467160 ?auto_467163 ) ) ( not ( = ?auto_467160 ?auto_467164 ) ) ( not ( = ?auto_467160 ?auto_467165 ) ) ( not ( = ?auto_467160 ?auto_467166 ) ) ( not ( = ?auto_467160 ?auto_467167 ) ) ( not ( = ?auto_467160 ?auto_467168 ) ) ( not ( = ?auto_467160 ?auto_467169 ) ) ( not ( = ?auto_467160 ?auto_467170 ) ) ( not ( = ?auto_467161 ?auto_467162 ) ) ( not ( = ?auto_467161 ?auto_467163 ) ) ( not ( = ?auto_467161 ?auto_467164 ) ) ( not ( = ?auto_467161 ?auto_467165 ) ) ( not ( = ?auto_467161 ?auto_467166 ) ) ( not ( = ?auto_467161 ?auto_467167 ) ) ( not ( = ?auto_467161 ?auto_467168 ) ) ( not ( = ?auto_467161 ?auto_467169 ) ) ( not ( = ?auto_467161 ?auto_467170 ) ) ( not ( = ?auto_467162 ?auto_467163 ) ) ( not ( = ?auto_467162 ?auto_467164 ) ) ( not ( = ?auto_467162 ?auto_467165 ) ) ( not ( = ?auto_467162 ?auto_467166 ) ) ( not ( = ?auto_467162 ?auto_467167 ) ) ( not ( = ?auto_467162 ?auto_467168 ) ) ( not ( = ?auto_467162 ?auto_467169 ) ) ( not ( = ?auto_467162 ?auto_467170 ) ) ( not ( = ?auto_467163 ?auto_467164 ) ) ( not ( = ?auto_467163 ?auto_467165 ) ) ( not ( = ?auto_467163 ?auto_467166 ) ) ( not ( = ?auto_467163 ?auto_467167 ) ) ( not ( = ?auto_467163 ?auto_467168 ) ) ( not ( = ?auto_467163 ?auto_467169 ) ) ( not ( = ?auto_467163 ?auto_467170 ) ) ( not ( = ?auto_467164 ?auto_467165 ) ) ( not ( = ?auto_467164 ?auto_467166 ) ) ( not ( = ?auto_467164 ?auto_467167 ) ) ( not ( = ?auto_467164 ?auto_467168 ) ) ( not ( = ?auto_467164 ?auto_467169 ) ) ( not ( = ?auto_467164 ?auto_467170 ) ) ( not ( = ?auto_467165 ?auto_467166 ) ) ( not ( = ?auto_467165 ?auto_467167 ) ) ( not ( = ?auto_467165 ?auto_467168 ) ) ( not ( = ?auto_467165 ?auto_467169 ) ) ( not ( = ?auto_467165 ?auto_467170 ) ) ( not ( = ?auto_467166 ?auto_467167 ) ) ( not ( = ?auto_467166 ?auto_467168 ) ) ( not ( = ?auto_467166 ?auto_467169 ) ) ( not ( = ?auto_467166 ?auto_467170 ) ) ( not ( = ?auto_467167 ?auto_467168 ) ) ( not ( = ?auto_467167 ?auto_467169 ) ) ( not ( = ?auto_467167 ?auto_467170 ) ) ( not ( = ?auto_467168 ?auto_467169 ) ) ( not ( = ?auto_467168 ?auto_467170 ) ) ( not ( = ?auto_467169 ?auto_467170 ) ) ( CLEAR ?auto_467167 ) ( ON ?auto_467168 ?auto_467169 ) ( CLEAR ?auto_467168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_467158 ?auto_467159 ?auto_467160 ?auto_467161 ?auto_467162 ?auto_467163 ?auto_467164 ?auto_467165 ?auto_467166 ?auto_467167 ?auto_467168 )
      ( MAKE-12PILE ?auto_467158 ?auto_467159 ?auto_467160 ?auto_467161 ?auto_467162 ?auto_467163 ?auto_467164 ?auto_467165 ?auto_467166 ?auto_467167 ?auto_467168 ?auto_467169 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_467208 - BLOCK
      ?auto_467209 - BLOCK
      ?auto_467210 - BLOCK
      ?auto_467211 - BLOCK
      ?auto_467212 - BLOCK
      ?auto_467213 - BLOCK
      ?auto_467214 - BLOCK
      ?auto_467215 - BLOCK
      ?auto_467216 - BLOCK
      ?auto_467217 - BLOCK
      ?auto_467218 - BLOCK
      ?auto_467219 - BLOCK
    )
    :vars
    (
      ?auto_467220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467219 ?auto_467220 ) ( ON-TABLE ?auto_467208 ) ( ON ?auto_467209 ?auto_467208 ) ( ON ?auto_467210 ?auto_467209 ) ( ON ?auto_467211 ?auto_467210 ) ( ON ?auto_467212 ?auto_467211 ) ( ON ?auto_467213 ?auto_467212 ) ( ON ?auto_467214 ?auto_467213 ) ( ON ?auto_467215 ?auto_467214 ) ( ON ?auto_467216 ?auto_467215 ) ( not ( = ?auto_467208 ?auto_467209 ) ) ( not ( = ?auto_467208 ?auto_467210 ) ) ( not ( = ?auto_467208 ?auto_467211 ) ) ( not ( = ?auto_467208 ?auto_467212 ) ) ( not ( = ?auto_467208 ?auto_467213 ) ) ( not ( = ?auto_467208 ?auto_467214 ) ) ( not ( = ?auto_467208 ?auto_467215 ) ) ( not ( = ?auto_467208 ?auto_467216 ) ) ( not ( = ?auto_467208 ?auto_467217 ) ) ( not ( = ?auto_467208 ?auto_467218 ) ) ( not ( = ?auto_467208 ?auto_467219 ) ) ( not ( = ?auto_467208 ?auto_467220 ) ) ( not ( = ?auto_467209 ?auto_467210 ) ) ( not ( = ?auto_467209 ?auto_467211 ) ) ( not ( = ?auto_467209 ?auto_467212 ) ) ( not ( = ?auto_467209 ?auto_467213 ) ) ( not ( = ?auto_467209 ?auto_467214 ) ) ( not ( = ?auto_467209 ?auto_467215 ) ) ( not ( = ?auto_467209 ?auto_467216 ) ) ( not ( = ?auto_467209 ?auto_467217 ) ) ( not ( = ?auto_467209 ?auto_467218 ) ) ( not ( = ?auto_467209 ?auto_467219 ) ) ( not ( = ?auto_467209 ?auto_467220 ) ) ( not ( = ?auto_467210 ?auto_467211 ) ) ( not ( = ?auto_467210 ?auto_467212 ) ) ( not ( = ?auto_467210 ?auto_467213 ) ) ( not ( = ?auto_467210 ?auto_467214 ) ) ( not ( = ?auto_467210 ?auto_467215 ) ) ( not ( = ?auto_467210 ?auto_467216 ) ) ( not ( = ?auto_467210 ?auto_467217 ) ) ( not ( = ?auto_467210 ?auto_467218 ) ) ( not ( = ?auto_467210 ?auto_467219 ) ) ( not ( = ?auto_467210 ?auto_467220 ) ) ( not ( = ?auto_467211 ?auto_467212 ) ) ( not ( = ?auto_467211 ?auto_467213 ) ) ( not ( = ?auto_467211 ?auto_467214 ) ) ( not ( = ?auto_467211 ?auto_467215 ) ) ( not ( = ?auto_467211 ?auto_467216 ) ) ( not ( = ?auto_467211 ?auto_467217 ) ) ( not ( = ?auto_467211 ?auto_467218 ) ) ( not ( = ?auto_467211 ?auto_467219 ) ) ( not ( = ?auto_467211 ?auto_467220 ) ) ( not ( = ?auto_467212 ?auto_467213 ) ) ( not ( = ?auto_467212 ?auto_467214 ) ) ( not ( = ?auto_467212 ?auto_467215 ) ) ( not ( = ?auto_467212 ?auto_467216 ) ) ( not ( = ?auto_467212 ?auto_467217 ) ) ( not ( = ?auto_467212 ?auto_467218 ) ) ( not ( = ?auto_467212 ?auto_467219 ) ) ( not ( = ?auto_467212 ?auto_467220 ) ) ( not ( = ?auto_467213 ?auto_467214 ) ) ( not ( = ?auto_467213 ?auto_467215 ) ) ( not ( = ?auto_467213 ?auto_467216 ) ) ( not ( = ?auto_467213 ?auto_467217 ) ) ( not ( = ?auto_467213 ?auto_467218 ) ) ( not ( = ?auto_467213 ?auto_467219 ) ) ( not ( = ?auto_467213 ?auto_467220 ) ) ( not ( = ?auto_467214 ?auto_467215 ) ) ( not ( = ?auto_467214 ?auto_467216 ) ) ( not ( = ?auto_467214 ?auto_467217 ) ) ( not ( = ?auto_467214 ?auto_467218 ) ) ( not ( = ?auto_467214 ?auto_467219 ) ) ( not ( = ?auto_467214 ?auto_467220 ) ) ( not ( = ?auto_467215 ?auto_467216 ) ) ( not ( = ?auto_467215 ?auto_467217 ) ) ( not ( = ?auto_467215 ?auto_467218 ) ) ( not ( = ?auto_467215 ?auto_467219 ) ) ( not ( = ?auto_467215 ?auto_467220 ) ) ( not ( = ?auto_467216 ?auto_467217 ) ) ( not ( = ?auto_467216 ?auto_467218 ) ) ( not ( = ?auto_467216 ?auto_467219 ) ) ( not ( = ?auto_467216 ?auto_467220 ) ) ( not ( = ?auto_467217 ?auto_467218 ) ) ( not ( = ?auto_467217 ?auto_467219 ) ) ( not ( = ?auto_467217 ?auto_467220 ) ) ( not ( = ?auto_467218 ?auto_467219 ) ) ( not ( = ?auto_467218 ?auto_467220 ) ) ( not ( = ?auto_467219 ?auto_467220 ) ) ( ON ?auto_467218 ?auto_467219 ) ( CLEAR ?auto_467216 ) ( ON ?auto_467217 ?auto_467218 ) ( CLEAR ?auto_467217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_467208 ?auto_467209 ?auto_467210 ?auto_467211 ?auto_467212 ?auto_467213 ?auto_467214 ?auto_467215 ?auto_467216 ?auto_467217 )
      ( MAKE-12PILE ?auto_467208 ?auto_467209 ?auto_467210 ?auto_467211 ?auto_467212 ?auto_467213 ?auto_467214 ?auto_467215 ?auto_467216 ?auto_467217 ?auto_467218 ?auto_467219 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_467258 - BLOCK
      ?auto_467259 - BLOCK
      ?auto_467260 - BLOCK
      ?auto_467261 - BLOCK
      ?auto_467262 - BLOCK
      ?auto_467263 - BLOCK
      ?auto_467264 - BLOCK
      ?auto_467265 - BLOCK
      ?auto_467266 - BLOCK
      ?auto_467267 - BLOCK
      ?auto_467268 - BLOCK
      ?auto_467269 - BLOCK
    )
    :vars
    (
      ?auto_467270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467269 ?auto_467270 ) ( ON-TABLE ?auto_467258 ) ( ON ?auto_467259 ?auto_467258 ) ( ON ?auto_467260 ?auto_467259 ) ( ON ?auto_467261 ?auto_467260 ) ( ON ?auto_467262 ?auto_467261 ) ( ON ?auto_467263 ?auto_467262 ) ( ON ?auto_467264 ?auto_467263 ) ( ON ?auto_467265 ?auto_467264 ) ( not ( = ?auto_467258 ?auto_467259 ) ) ( not ( = ?auto_467258 ?auto_467260 ) ) ( not ( = ?auto_467258 ?auto_467261 ) ) ( not ( = ?auto_467258 ?auto_467262 ) ) ( not ( = ?auto_467258 ?auto_467263 ) ) ( not ( = ?auto_467258 ?auto_467264 ) ) ( not ( = ?auto_467258 ?auto_467265 ) ) ( not ( = ?auto_467258 ?auto_467266 ) ) ( not ( = ?auto_467258 ?auto_467267 ) ) ( not ( = ?auto_467258 ?auto_467268 ) ) ( not ( = ?auto_467258 ?auto_467269 ) ) ( not ( = ?auto_467258 ?auto_467270 ) ) ( not ( = ?auto_467259 ?auto_467260 ) ) ( not ( = ?auto_467259 ?auto_467261 ) ) ( not ( = ?auto_467259 ?auto_467262 ) ) ( not ( = ?auto_467259 ?auto_467263 ) ) ( not ( = ?auto_467259 ?auto_467264 ) ) ( not ( = ?auto_467259 ?auto_467265 ) ) ( not ( = ?auto_467259 ?auto_467266 ) ) ( not ( = ?auto_467259 ?auto_467267 ) ) ( not ( = ?auto_467259 ?auto_467268 ) ) ( not ( = ?auto_467259 ?auto_467269 ) ) ( not ( = ?auto_467259 ?auto_467270 ) ) ( not ( = ?auto_467260 ?auto_467261 ) ) ( not ( = ?auto_467260 ?auto_467262 ) ) ( not ( = ?auto_467260 ?auto_467263 ) ) ( not ( = ?auto_467260 ?auto_467264 ) ) ( not ( = ?auto_467260 ?auto_467265 ) ) ( not ( = ?auto_467260 ?auto_467266 ) ) ( not ( = ?auto_467260 ?auto_467267 ) ) ( not ( = ?auto_467260 ?auto_467268 ) ) ( not ( = ?auto_467260 ?auto_467269 ) ) ( not ( = ?auto_467260 ?auto_467270 ) ) ( not ( = ?auto_467261 ?auto_467262 ) ) ( not ( = ?auto_467261 ?auto_467263 ) ) ( not ( = ?auto_467261 ?auto_467264 ) ) ( not ( = ?auto_467261 ?auto_467265 ) ) ( not ( = ?auto_467261 ?auto_467266 ) ) ( not ( = ?auto_467261 ?auto_467267 ) ) ( not ( = ?auto_467261 ?auto_467268 ) ) ( not ( = ?auto_467261 ?auto_467269 ) ) ( not ( = ?auto_467261 ?auto_467270 ) ) ( not ( = ?auto_467262 ?auto_467263 ) ) ( not ( = ?auto_467262 ?auto_467264 ) ) ( not ( = ?auto_467262 ?auto_467265 ) ) ( not ( = ?auto_467262 ?auto_467266 ) ) ( not ( = ?auto_467262 ?auto_467267 ) ) ( not ( = ?auto_467262 ?auto_467268 ) ) ( not ( = ?auto_467262 ?auto_467269 ) ) ( not ( = ?auto_467262 ?auto_467270 ) ) ( not ( = ?auto_467263 ?auto_467264 ) ) ( not ( = ?auto_467263 ?auto_467265 ) ) ( not ( = ?auto_467263 ?auto_467266 ) ) ( not ( = ?auto_467263 ?auto_467267 ) ) ( not ( = ?auto_467263 ?auto_467268 ) ) ( not ( = ?auto_467263 ?auto_467269 ) ) ( not ( = ?auto_467263 ?auto_467270 ) ) ( not ( = ?auto_467264 ?auto_467265 ) ) ( not ( = ?auto_467264 ?auto_467266 ) ) ( not ( = ?auto_467264 ?auto_467267 ) ) ( not ( = ?auto_467264 ?auto_467268 ) ) ( not ( = ?auto_467264 ?auto_467269 ) ) ( not ( = ?auto_467264 ?auto_467270 ) ) ( not ( = ?auto_467265 ?auto_467266 ) ) ( not ( = ?auto_467265 ?auto_467267 ) ) ( not ( = ?auto_467265 ?auto_467268 ) ) ( not ( = ?auto_467265 ?auto_467269 ) ) ( not ( = ?auto_467265 ?auto_467270 ) ) ( not ( = ?auto_467266 ?auto_467267 ) ) ( not ( = ?auto_467266 ?auto_467268 ) ) ( not ( = ?auto_467266 ?auto_467269 ) ) ( not ( = ?auto_467266 ?auto_467270 ) ) ( not ( = ?auto_467267 ?auto_467268 ) ) ( not ( = ?auto_467267 ?auto_467269 ) ) ( not ( = ?auto_467267 ?auto_467270 ) ) ( not ( = ?auto_467268 ?auto_467269 ) ) ( not ( = ?auto_467268 ?auto_467270 ) ) ( not ( = ?auto_467269 ?auto_467270 ) ) ( ON ?auto_467268 ?auto_467269 ) ( ON ?auto_467267 ?auto_467268 ) ( CLEAR ?auto_467265 ) ( ON ?auto_467266 ?auto_467267 ) ( CLEAR ?auto_467266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_467258 ?auto_467259 ?auto_467260 ?auto_467261 ?auto_467262 ?auto_467263 ?auto_467264 ?auto_467265 ?auto_467266 )
      ( MAKE-12PILE ?auto_467258 ?auto_467259 ?auto_467260 ?auto_467261 ?auto_467262 ?auto_467263 ?auto_467264 ?auto_467265 ?auto_467266 ?auto_467267 ?auto_467268 ?auto_467269 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_467308 - BLOCK
      ?auto_467309 - BLOCK
      ?auto_467310 - BLOCK
      ?auto_467311 - BLOCK
      ?auto_467312 - BLOCK
      ?auto_467313 - BLOCK
      ?auto_467314 - BLOCK
      ?auto_467315 - BLOCK
      ?auto_467316 - BLOCK
      ?auto_467317 - BLOCK
      ?auto_467318 - BLOCK
      ?auto_467319 - BLOCK
    )
    :vars
    (
      ?auto_467320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467319 ?auto_467320 ) ( ON-TABLE ?auto_467308 ) ( ON ?auto_467309 ?auto_467308 ) ( ON ?auto_467310 ?auto_467309 ) ( ON ?auto_467311 ?auto_467310 ) ( ON ?auto_467312 ?auto_467311 ) ( ON ?auto_467313 ?auto_467312 ) ( ON ?auto_467314 ?auto_467313 ) ( not ( = ?auto_467308 ?auto_467309 ) ) ( not ( = ?auto_467308 ?auto_467310 ) ) ( not ( = ?auto_467308 ?auto_467311 ) ) ( not ( = ?auto_467308 ?auto_467312 ) ) ( not ( = ?auto_467308 ?auto_467313 ) ) ( not ( = ?auto_467308 ?auto_467314 ) ) ( not ( = ?auto_467308 ?auto_467315 ) ) ( not ( = ?auto_467308 ?auto_467316 ) ) ( not ( = ?auto_467308 ?auto_467317 ) ) ( not ( = ?auto_467308 ?auto_467318 ) ) ( not ( = ?auto_467308 ?auto_467319 ) ) ( not ( = ?auto_467308 ?auto_467320 ) ) ( not ( = ?auto_467309 ?auto_467310 ) ) ( not ( = ?auto_467309 ?auto_467311 ) ) ( not ( = ?auto_467309 ?auto_467312 ) ) ( not ( = ?auto_467309 ?auto_467313 ) ) ( not ( = ?auto_467309 ?auto_467314 ) ) ( not ( = ?auto_467309 ?auto_467315 ) ) ( not ( = ?auto_467309 ?auto_467316 ) ) ( not ( = ?auto_467309 ?auto_467317 ) ) ( not ( = ?auto_467309 ?auto_467318 ) ) ( not ( = ?auto_467309 ?auto_467319 ) ) ( not ( = ?auto_467309 ?auto_467320 ) ) ( not ( = ?auto_467310 ?auto_467311 ) ) ( not ( = ?auto_467310 ?auto_467312 ) ) ( not ( = ?auto_467310 ?auto_467313 ) ) ( not ( = ?auto_467310 ?auto_467314 ) ) ( not ( = ?auto_467310 ?auto_467315 ) ) ( not ( = ?auto_467310 ?auto_467316 ) ) ( not ( = ?auto_467310 ?auto_467317 ) ) ( not ( = ?auto_467310 ?auto_467318 ) ) ( not ( = ?auto_467310 ?auto_467319 ) ) ( not ( = ?auto_467310 ?auto_467320 ) ) ( not ( = ?auto_467311 ?auto_467312 ) ) ( not ( = ?auto_467311 ?auto_467313 ) ) ( not ( = ?auto_467311 ?auto_467314 ) ) ( not ( = ?auto_467311 ?auto_467315 ) ) ( not ( = ?auto_467311 ?auto_467316 ) ) ( not ( = ?auto_467311 ?auto_467317 ) ) ( not ( = ?auto_467311 ?auto_467318 ) ) ( not ( = ?auto_467311 ?auto_467319 ) ) ( not ( = ?auto_467311 ?auto_467320 ) ) ( not ( = ?auto_467312 ?auto_467313 ) ) ( not ( = ?auto_467312 ?auto_467314 ) ) ( not ( = ?auto_467312 ?auto_467315 ) ) ( not ( = ?auto_467312 ?auto_467316 ) ) ( not ( = ?auto_467312 ?auto_467317 ) ) ( not ( = ?auto_467312 ?auto_467318 ) ) ( not ( = ?auto_467312 ?auto_467319 ) ) ( not ( = ?auto_467312 ?auto_467320 ) ) ( not ( = ?auto_467313 ?auto_467314 ) ) ( not ( = ?auto_467313 ?auto_467315 ) ) ( not ( = ?auto_467313 ?auto_467316 ) ) ( not ( = ?auto_467313 ?auto_467317 ) ) ( not ( = ?auto_467313 ?auto_467318 ) ) ( not ( = ?auto_467313 ?auto_467319 ) ) ( not ( = ?auto_467313 ?auto_467320 ) ) ( not ( = ?auto_467314 ?auto_467315 ) ) ( not ( = ?auto_467314 ?auto_467316 ) ) ( not ( = ?auto_467314 ?auto_467317 ) ) ( not ( = ?auto_467314 ?auto_467318 ) ) ( not ( = ?auto_467314 ?auto_467319 ) ) ( not ( = ?auto_467314 ?auto_467320 ) ) ( not ( = ?auto_467315 ?auto_467316 ) ) ( not ( = ?auto_467315 ?auto_467317 ) ) ( not ( = ?auto_467315 ?auto_467318 ) ) ( not ( = ?auto_467315 ?auto_467319 ) ) ( not ( = ?auto_467315 ?auto_467320 ) ) ( not ( = ?auto_467316 ?auto_467317 ) ) ( not ( = ?auto_467316 ?auto_467318 ) ) ( not ( = ?auto_467316 ?auto_467319 ) ) ( not ( = ?auto_467316 ?auto_467320 ) ) ( not ( = ?auto_467317 ?auto_467318 ) ) ( not ( = ?auto_467317 ?auto_467319 ) ) ( not ( = ?auto_467317 ?auto_467320 ) ) ( not ( = ?auto_467318 ?auto_467319 ) ) ( not ( = ?auto_467318 ?auto_467320 ) ) ( not ( = ?auto_467319 ?auto_467320 ) ) ( ON ?auto_467318 ?auto_467319 ) ( ON ?auto_467317 ?auto_467318 ) ( ON ?auto_467316 ?auto_467317 ) ( CLEAR ?auto_467314 ) ( ON ?auto_467315 ?auto_467316 ) ( CLEAR ?auto_467315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_467308 ?auto_467309 ?auto_467310 ?auto_467311 ?auto_467312 ?auto_467313 ?auto_467314 ?auto_467315 )
      ( MAKE-12PILE ?auto_467308 ?auto_467309 ?auto_467310 ?auto_467311 ?auto_467312 ?auto_467313 ?auto_467314 ?auto_467315 ?auto_467316 ?auto_467317 ?auto_467318 ?auto_467319 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_467358 - BLOCK
      ?auto_467359 - BLOCK
      ?auto_467360 - BLOCK
      ?auto_467361 - BLOCK
      ?auto_467362 - BLOCK
      ?auto_467363 - BLOCK
      ?auto_467364 - BLOCK
      ?auto_467365 - BLOCK
      ?auto_467366 - BLOCK
      ?auto_467367 - BLOCK
      ?auto_467368 - BLOCK
      ?auto_467369 - BLOCK
    )
    :vars
    (
      ?auto_467370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467369 ?auto_467370 ) ( ON-TABLE ?auto_467358 ) ( ON ?auto_467359 ?auto_467358 ) ( ON ?auto_467360 ?auto_467359 ) ( ON ?auto_467361 ?auto_467360 ) ( ON ?auto_467362 ?auto_467361 ) ( ON ?auto_467363 ?auto_467362 ) ( not ( = ?auto_467358 ?auto_467359 ) ) ( not ( = ?auto_467358 ?auto_467360 ) ) ( not ( = ?auto_467358 ?auto_467361 ) ) ( not ( = ?auto_467358 ?auto_467362 ) ) ( not ( = ?auto_467358 ?auto_467363 ) ) ( not ( = ?auto_467358 ?auto_467364 ) ) ( not ( = ?auto_467358 ?auto_467365 ) ) ( not ( = ?auto_467358 ?auto_467366 ) ) ( not ( = ?auto_467358 ?auto_467367 ) ) ( not ( = ?auto_467358 ?auto_467368 ) ) ( not ( = ?auto_467358 ?auto_467369 ) ) ( not ( = ?auto_467358 ?auto_467370 ) ) ( not ( = ?auto_467359 ?auto_467360 ) ) ( not ( = ?auto_467359 ?auto_467361 ) ) ( not ( = ?auto_467359 ?auto_467362 ) ) ( not ( = ?auto_467359 ?auto_467363 ) ) ( not ( = ?auto_467359 ?auto_467364 ) ) ( not ( = ?auto_467359 ?auto_467365 ) ) ( not ( = ?auto_467359 ?auto_467366 ) ) ( not ( = ?auto_467359 ?auto_467367 ) ) ( not ( = ?auto_467359 ?auto_467368 ) ) ( not ( = ?auto_467359 ?auto_467369 ) ) ( not ( = ?auto_467359 ?auto_467370 ) ) ( not ( = ?auto_467360 ?auto_467361 ) ) ( not ( = ?auto_467360 ?auto_467362 ) ) ( not ( = ?auto_467360 ?auto_467363 ) ) ( not ( = ?auto_467360 ?auto_467364 ) ) ( not ( = ?auto_467360 ?auto_467365 ) ) ( not ( = ?auto_467360 ?auto_467366 ) ) ( not ( = ?auto_467360 ?auto_467367 ) ) ( not ( = ?auto_467360 ?auto_467368 ) ) ( not ( = ?auto_467360 ?auto_467369 ) ) ( not ( = ?auto_467360 ?auto_467370 ) ) ( not ( = ?auto_467361 ?auto_467362 ) ) ( not ( = ?auto_467361 ?auto_467363 ) ) ( not ( = ?auto_467361 ?auto_467364 ) ) ( not ( = ?auto_467361 ?auto_467365 ) ) ( not ( = ?auto_467361 ?auto_467366 ) ) ( not ( = ?auto_467361 ?auto_467367 ) ) ( not ( = ?auto_467361 ?auto_467368 ) ) ( not ( = ?auto_467361 ?auto_467369 ) ) ( not ( = ?auto_467361 ?auto_467370 ) ) ( not ( = ?auto_467362 ?auto_467363 ) ) ( not ( = ?auto_467362 ?auto_467364 ) ) ( not ( = ?auto_467362 ?auto_467365 ) ) ( not ( = ?auto_467362 ?auto_467366 ) ) ( not ( = ?auto_467362 ?auto_467367 ) ) ( not ( = ?auto_467362 ?auto_467368 ) ) ( not ( = ?auto_467362 ?auto_467369 ) ) ( not ( = ?auto_467362 ?auto_467370 ) ) ( not ( = ?auto_467363 ?auto_467364 ) ) ( not ( = ?auto_467363 ?auto_467365 ) ) ( not ( = ?auto_467363 ?auto_467366 ) ) ( not ( = ?auto_467363 ?auto_467367 ) ) ( not ( = ?auto_467363 ?auto_467368 ) ) ( not ( = ?auto_467363 ?auto_467369 ) ) ( not ( = ?auto_467363 ?auto_467370 ) ) ( not ( = ?auto_467364 ?auto_467365 ) ) ( not ( = ?auto_467364 ?auto_467366 ) ) ( not ( = ?auto_467364 ?auto_467367 ) ) ( not ( = ?auto_467364 ?auto_467368 ) ) ( not ( = ?auto_467364 ?auto_467369 ) ) ( not ( = ?auto_467364 ?auto_467370 ) ) ( not ( = ?auto_467365 ?auto_467366 ) ) ( not ( = ?auto_467365 ?auto_467367 ) ) ( not ( = ?auto_467365 ?auto_467368 ) ) ( not ( = ?auto_467365 ?auto_467369 ) ) ( not ( = ?auto_467365 ?auto_467370 ) ) ( not ( = ?auto_467366 ?auto_467367 ) ) ( not ( = ?auto_467366 ?auto_467368 ) ) ( not ( = ?auto_467366 ?auto_467369 ) ) ( not ( = ?auto_467366 ?auto_467370 ) ) ( not ( = ?auto_467367 ?auto_467368 ) ) ( not ( = ?auto_467367 ?auto_467369 ) ) ( not ( = ?auto_467367 ?auto_467370 ) ) ( not ( = ?auto_467368 ?auto_467369 ) ) ( not ( = ?auto_467368 ?auto_467370 ) ) ( not ( = ?auto_467369 ?auto_467370 ) ) ( ON ?auto_467368 ?auto_467369 ) ( ON ?auto_467367 ?auto_467368 ) ( ON ?auto_467366 ?auto_467367 ) ( ON ?auto_467365 ?auto_467366 ) ( CLEAR ?auto_467363 ) ( ON ?auto_467364 ?auto_467365 ) ( CLEAR ?auto_467364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_467358 ?auto_467359 ?auto_467360 ?auto_467361 ?auto_467362 ?auto_467363 ?auto_467364 )
      ( MAKE-12PILE ?auto_467358 ?auto_467359 ?auto_467360 ?auto_467361 ?auto_467362 ?auto_467363 ?auto_467364 ?auto_467365 ?auto_467366 ?auto_467367 ?auto_467368 ?auto_467369 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_467408 - BLOCK
      ?auto_467409 - BLOCK
      ?auto_467410 - BLOCK
      ?auto_467411 - BLOCK
      ?auto_467412 - BLOCK
      ?auto_467413 - BLOCK
      ?auto_467414 - BLOCK
      ?auto_467415 - BLOCK
      ?auto_467416 - BLOCK
      ?auto_467417 - BLOCK
      ?auto_467418 - BLOCK
      ?auto_467419 - BLOCK
    )
    :vars
    (
      ?auto_467420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467419 ?auto_467420 ) ( ON-TABLE ?auto_467408 ) ( ON ?auto_467409 ?auto_467408 ) ( ON ?auto_467410 ?auto_467409 ) ( ON ?auto_467411 ?auto_467410 ) ( ON ?auto_467412 ?auto_467411 ) ( not ( = ?auto_467408 ?auto_467409 ) ) ( not ( = ?auto_467408 ?auto_467410 ) ) ( not ( = ?auto_467408 ?auto_467411 ) ) ( not ( = ?auto_467408 ?auto_467412 ) ) ( not ( = ?auto_467408 ?auto_467413 ) ) ( not ( = ?auto_467408 ?auto_467414 ) ) ( not ( = ?auto_467408 ?auto_467415 ) ) ( not ( = ?auto_467408 ?auto_467416 ) ) ( not ( = ?auto_467408 ?auto_467417 ) ) ( not ( = ?auto_467408 ?auto_467418 ) ) ( not ( = ?auto_467408 ?auto_467419 ) ) ( not ( = ?auto_467408 ?auto_467420 ) ) ( not ( = ?auto_467409 ?auto_467410 ) ) ( not ( = ?auto_467409 ?auto_467411 ) ) ( not ( = ?auto_467409 ?auto_467412 ) ) ( not ( = ?auto_467409 ?auto_467413 ) ) ( not ( = ?auto_467409 ?auto_467414 ) ) ( not ( = ?auto_467409 ?auto_467415 ) ) ( not ( = ?auto_467409 ?auto_467416 ) ) ( not ( = ?auto_467409 ?auto_467417 ) ) ( not ( = ?auto_467409 ?auto_467418 ) ) ( not ( = ?auto_467409 ?auto_467419 ) ) ( not ( = ?auto_467409 ?auto_467420 ) ) ( not ( = ?auto_467410 ?auto_467411 ) ) ( not ( = ?auto_467410 ?auto_467412 ) ) ( not ( = ?auto_467410 ?auto_467413 ) ) ( not ( = ?auto_467410 ?auto_467414 ) ) ( not ( = ?auto_467410 ?auto_467415 ) ) ( not ( = ?auto_467410 ?auto_467416 ) ) ( not ( = ?auto_467410 ?auto_467417 ) ) ( not ( = ?auto_467410 ?auto_467418 ) ) ( not ( = ?auto_467410 ?auto_467419 ) ) ( not ( = ?auto_467410 ?auto_467420 ) ) ( not ( = ?auto_467411 ?auto_467412 ) ) ( not ( = ?auto_467411 ?auto_467413 ) ) ( not ( = ?auto_467411 ?auto_467414 ) ) ( not ( = ?auto_467411 ?auto_467415 ) ) ( not ( = ?auto_467411 ?auto_467416 ) ) ( not ( = ?auto_467411 ?auto_467417 ) ) ( not ( = ?auto_467411 ?auto_467418 ) ) ( not ( = ?auto_467411 ?auto_467419 ) ) ( not ( = ?auto_467411 ?auto_467420 ) ) ( not ( = ?auto_467412 ?auto_467413 ) ) ( not ( = ?auto_467412 ?auto_467414 ) ) ( not ( = ?auto_467412 ?auto_467415 ) ) ( not ( = ?auto_467412 ?auto_467416 ) ) ( not ( = ?auto_467412 ?auto_467417 ) ) ( not ( = ?auto_467412 ?auto_467418 ) ) ( not ( = ?auto_467412 ?auto_467419 ) ) ( not ( = ?auto_467412 ?auto_467420 ) ) ( not ( = ?auto_467413 ?auto_467414 ) ) ( not ( = ?auto_467413 ?auto_467415 ) ) ( not ( = ?auto_467413 ?auto_467416 ) ) ( not ( = ?auto_467413 ?auto_467417 ) ) ( not ( = ?auto_467413 ?auto_467418 ) ) ( not ( = ?auto_467413 ?auto_467419 ) ) ( not ( = ?auto_467413 ?auto_467420 ) ) ( not ( = ?auto_467414 ?auto_467415 ) ) ( not ( = ?auto_467414 ?auto_467416 ) ) ( not ( = ?auto_467414 ?auto_467417 ) ) ( not ( = ?auto_467414 ?auto_467418 ) ) ( not ( = ?auto_467414 ?auto_467419 ) ) ( not ( = ?auto_467414 ?auto_467420 ) ) ( not ( = ?auto_467415 ?auto_467416 ) ) ( not ( = ?auto_467415 ?auto_467417 ) ) ( not ( = ?auto_467415 ?auto_467418 ) ) ( not ( = ?auto_467415 ?auto_467419 ) ) ( not ( = ?auto_467415 ?auto_467420 ) ) ( not ( = ?auto_467416 ?auto_467417 ) ) ( not ( = ?auto_467416 ?auto_467418 ) ) ( not ( = ?auto_467416 ?auto_467419 ) ) ( not ( = ?auto_467416 ?auto_467420 ) ) ( not ( = ?auto_467417 ?auto_467418 ) ) ( not ( = ?auto_467417 ?auto_467419 ) ) ( not ( = ?auto_467417 ?auto_467420 ) ) ( not ( = ?auto_467418 ?auto_467419 ) ) ( not ( = ?auto_467418 ?auto_467420 ) ) ( not ( = ?auto_467419 ?auto_467420 ) ) ( ON ?auto_467418 ?auto_467419 ) ( ON ?auto_467417 ?auto_467418 ) ( ON ?auto_467416 ?auto_467417 ) ( ON ?auto_467415 ?auto_467416 ) ( ON ?auto_467414 ?auto_467415 ) ( CLEAR ?auto_467412 ) ( ON ?auto_467413 ?auto_467414 ) ( CLEAR ?auto_467413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_467408 ?auto_467409 ?auto_467410 ?auto_467411 ?auto_467412 ?auto_467413 )
      ( MAKE-12PILE ?auto_467408 ?auto_467409 ?auto_467410 ?auto_467411 ?auto_467412 ?auto_467413 ?auto_467414 ?auto_467415 ?auto_467416 ?auto_467417 ?auto_467418 ?auto_467419 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_467458 - BLOCK
      ?auto_467459 - BLOCK
      ?auto_467460 - BLOCK
      ?auto_467461 - BLOCK
      ?auto_467462 - BLOCK
      ?auto_467463 - BLOCK
      ?auto_467464 - BLOCK
      ?auto_467465 - BLOCK
      ?auto_467466 - BLOCK
      ?auto_467467 - BLOCK
      ?auto_467468 - BLOCK
      ?auto_467469 - BLOCK
    )
    :vars
    (
      ?auto_467470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467469 ?auto_467470 ) ( ON-TABLE ?auto_467458 ) ( ON ?auto_467459 ?auto_467458 ) ( ON ?auto_467460 ?auto_467459 ) ( ON ?auto_467461 ?auto_467460 ) ( not ( = ?auto_467458 ?auto_467459 ) ) ( not ( = ?auto_467458 ?auto_467460 ) ) ( not ( = ?auto_467458 ?auto_467461 ) ) ( not ( = ?auto_467458 ?auto_467462 ) ) ( not ( = ?auto_467458 ?auto_467463 ) ) ( not ( = ?auto_467458 ?auto_467464 ) ) ( not ( = ?auto_467458 ?auto_467465 ) ) ( not ( = ?auto_467458 ?auto_467466 ) ) ( not ( = ?auto_467458 ?auto_467467 ) ) ( not ( = ?auto_467458 ?auto_467468 ) ) ( not ( = ?auto_467458 ?auto_467469 ) ) ( not ( = ?auto_467458 ?auto_467470 ) ) ( not ( = ?auto_467459 ?auto_467460 ) ) ( not ( = ?auto_467459 ?auto_467461 ) ) ( not ( = ?auto_467459 ?auto_467462 ) ) ( not ( = ?auto_467459 ?auto_467463 ) ) ( not ( = ?auto_467459 ?auto_467464 ) ) ( not ( = ?auto_467459 ?auto_467465 ) ) ( not ( = ?auto_467459 ?auto_467466 ) ) ( not ( = ?auto_467459 ?auto_467467 ) ) ( not ( = ?auto_467459 ?auto_467468 ) ) ( not ( = ?auto_467459 ?auto_467469 ) ) ( not ( = ?auto_467459 ?auto_467470 ) ) ( not ( = ?auto_467460 ?auto_467461 ) ) ( not ( = ?auto_467460 ?auto_467462 ) ) ( not ( = ?auto_467460 ?auto_467463 ) ) ( not ( = ?auto_467460 ?auto_467464 ) ) ( not ( = ?auto_467460 ?auto_467465 ) ) ( not ( = ?auto_467460 ?auto_467466 ) ) ( not ( = ?auto_467460 ?auto_467467 ) ) ( not ( = ?auto_467460 ?auto_467468 ) ) ( not ( = ?auto_467460 ?auto_467469 ) ) ( not ( = ?auto_467460 ?auto_467470 ) ) ( not ( = ?auto_467461 ?auto_467462 ) ) ( not ( = ?auto_467461 ?auto_467463 ) ) ( not ( = ?auto_467461 ?auto_467464 ) ) ( not ( = ?auto_467461 ?auto_467465 ) ) ( not ( = ?auto_467461 ?auto_467466 ) ) ( not ( = ?auto_467461 ?auto_467467 ) ) ( not ( = ?auto_467461 ?auto_467468 ) ) ( not ( = ?auto_467461 ?auto_467469 ) ) ( not ( = ?auto_467461 ?auto_467470 ) ) ( not ( = ?auto_467462 ?auto_467463 ) ) ( not ( = ?auto_467462 ?auto_467464 ) ) ( not ( = ?auto_467462 ?auto_467465 ) ) ( not ( = ?auto_467462 ?auto_467466 ) ) ( not ( = ?auto_467462 ?auto_467467 ) ) ( not ( = ?auto_467462 ?auto_467468 ) ) ( not ( = ?auto_467462 ?auto_467469 ) ) ( not ( = ?auto_467462 ?auto_467470 ) ) ( not ( = ?auto_467463 ?auto_467464 ) ) ( not ( = ?auto_467463 ?auto_467465 ) ) ( not ( = ?auto_467463 ?auto_467466 ) ) ( not ( = ?auto_467463 ?auto_467467 ) ) ( not ( = ?auto_467463 ?auto_467468 ) ) ( not ( = ?auto_467463 ?auto_467469 ) ) ( not ( = ?auto_467463 ?auto_467470 ) ) ( not ( = ?auto_467464 ?auto_467465 ) ) ( not ( = ?auto_467464 ?auto_467466 ) ) ( not ( = ?auto_467464 ?auto_467467 ) ) ( not ( = ?auto_467464 ?auto_467468 ) ) ( not ( = ?auto_467464 ?auto_467469 ) ) ( not ( = ?auto_467464 ?auto_467470 ) ) ( not ( = ?auto_467465 ?auto_467466 ) ) ( not ( = ?auto_467465 ?auto_467467 ) ) ( not ( = ?auto_467465 ?auto_467468 ) ) ( not ( = ?auto_467465 ?auto_467469 ) ) ( not ( = ?auto_467465 ?auto_467470 ) ) ( not ( = ?auto_467466 ?auto_467467 ) ) ( not ( = ?auto_467466 ?auto_467468 ) ) ( not ( = ?auto_467466 ?auto_467469 ) ) ( not ( = ?auto_467466 ?auto_467470 ) ) ( not ( = ?auto_467467 ?auto_467468 ) ) ( not ( = ?auto_467467 ?auto_467469 ) ) ( not ( = ?auto_467467 ?auto_467470 ) ) ( not ( = ?auto_467468 ?auto_467469 ) ) ( not ( = ?auto_467468 ?auto_467470 ) ) ( not ( = ?auto_467469 ?auto_467470 ) ) ( ON ?auto_467468 ?auto_467469 ) ( ON ?auto_467467 ?auto_467468 ) ( ON ?auto_467466 ?auto_467467 ) ( ON ?auto_467465 ?auto_467466 ) ( ON ?auto_467464 ?auto_467465 ) ( ON ?auto_467463 ?auto_467464 ) ( CLEAR ?auto_467461 ) ( ON ?auto_467462 ?auto_467463 ) ( CLEAR ?auto_467462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_467458 ?auto_467459 ?auto_467460 ?auto_467461 ?auto_467462 )
      ( MAKE-12PILE ?auto_467458 ?auto_467459 ?auto_467460 ?auto_467461 ?auto_467462 ?auto_467463 ?auto_467464 ?auto_467465 ?auto_467466 ?auto_467467 ?auto_467468 ?auto_467469 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_467508 - BLOCK
      ?auto_467509 - BLOCK
      ?auto_467510 - BLOCK
      ?auto_467511 - BLOCK
      ?auto_467512 - BLOCK
      ?auto_467513 - BLOCK
      ?auto_467514 - BLOCK
      ?auto_467515 - BLOCK
      ?auto_467516 - BLOCK
      ?auto_467517 - BLOCK
      ?auto_467518 - BLOCK
      ?auto_467519 - BLOCK
    )
    :vars
    (
      ?auto_467520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467519 ?auto_467520 ) ( ON-TABLE ?auto_467508 ) ( ON ?auto_467509 ?auto_467508 ) ( ON ?auto_467510 ?auto_467509 ) ( not ( = ?auto_467508 ?auto_467509 ) ) ( not ( = ?auto_467508 ?auto_467510 ) ) ( not ( = ?auto_467508 ?auto_467511 ) ) ( not ( = ?auto_467508 ?auto_467512 ) ) ( not ( = ?auto_467508 ?auto_467513 ) ) ( not ( = ?auto_467508 ?auto_467514 ) ) ( not ( = ?auto_467508 ?auto_467515 ) ) ( not ( = ?auto_467508 ?auto_467516 ) ) ( not ( = ?auto_467508 ?auto_467517 ) ) ( not ( = ?auto_467508 ?auto_467518 ) ) ( not ( = ?auto_467508 ?auto_467519 ) ) ( not ( = ?auto_467508 ?auto_467520 ) ) ( not ( = ?auto_467509 ?auto_467510 ) ) ( not ( = ?auto_467509 ?auto_467511 ) ) ( not ( = ?auto_467509 ?auto_467512 ) ) ( not ( = ?auto_467509 ?auto_467513 ) ) ( not ( = ?auto_467509 ?auto_467514 ) ) ( not ( = ?auto_467509 ?auto_467515 ) ) ( not ( = ?auto_467509 ?auto_467516 ) ) ( not ( = ?auto_467509 ?auto_467517 ) ) ( not ( = ?auto_467509 ?auto_467518 ) ) ( not ( = ?auto_467509 ?auto_467519 ) ) ( not ( = ?auto_467509 ?auto_467520 ) ) ( not ( = ?auto_467510 ?auto_467511 ) ) ( not ( = ?auto_467510 ?auto_467512 ) ) ( not ( = ?auto_467510 ?auto_467513 ) ) ( not ( = ?auto_467510 ?auto_467514 ) ) ( not ( = ?auto_467510 ?auto_467515 ) ) ( not ( = ?auto_467510 ?auto_467516 ) ) ( not ( = ?auto_467510 ?auto_467517 ) ) ( not ( = ?auto_467510 ?auto_467518 ) ) ( not ( = ?auto_467510 ?auto_467519 ) ) ( not ( = ?auto_467510 ?auto_467520 ) ) ( not ( = ?auto_467511 ?auto_467512 ) ) ( not ( = ?auto_467511 ?auto_467513 ) ) ( not ( = ?auto_467511 ?auto_467514 ) ) ( not ( = ?auto_467511 ?auto_467515 ) ) ( not ( = ?auto_467511 ?auto_467516 ) ) ( not ( = ?auto_467511 ?auto_467517 ) ) ( not ( = ?auto_467511 ?auto_467518 ) ) ( not ( = ?auto_467511 ?auto_467519 ) ) ( not ( = ?auto_467511 ?auto_467520 ) ) ( not ( = ?auto_467512 ?auto_467513 ) ) ( not ( = ?auto_467512 ?auto_467514 ) ) ( not ( = ?auto_467512 ?auto_467515 ) ) ( not ( = ?auto_467512 ?auto_467516 ) ) ( not ( = ?auto_467512 ?auto_467517 ) ) ( not ( = ?auto_467512 ?auto_467518 ) ) ( not ( = ?auto_467512 ?auto_467519 ) ) ( not ( = ?auto_467512 ?auto_467520 ) ) ( not ( = ?auto_467513 ?auto_467514 ) ) ( not ( = ?auto_467513 ?auto_467515 ) ) ( not ( = ?auto_467513 ?auto_467516 ) ) ( not ( = ?auto_467513 ?auto_467517 ) ) ( not ( = ?auto_467513 ?auto_467518 ) ) ( not ( = ?auto_467513 ?auto_467519 ) ) ( not ( = ?auto_467513 ?auto_467520 ) ) ( not ( = ?auto_467514 ?auto_467515 ) ) ( not ( = ?auto_467514 ?auto_467516 ) ) ( not ( = ?auto_467514 ?auto_467517 ) ) ( not ( = ?auto_467514 ?auto_467518 ) ) ( not ( = ?auto_467514 ?auto_467519 ) ) ( not ( = ?auto_467514 ?auto_467520 ) ) ( not ( = ?auto_467515 ?auto_467516 ) ) ( not ( = ?auto_467515 ?auto_467517 ) ) ( not ( = ?auto_467515 ?auto_467518 ) ) ( not ( = ?auto_467515 ?auto_467519 ) ) ( not ( = ?auto_467515 ?auto_467520 ) ) ( not ( = ?auto_467516 ?auto_467517 ) ) ( not ( = ?auto_467516 ?auto_467518 ) ) ( not ( = ?auto_467516 ?auto_467519 ) ) ( not ( = ?auto_467516 ?auto_467520 ) ) ( not ( = ?auto_467517 ?auto_467518 ) ) ( not ( = ?auto_467517 ?auto_467519 ) ) ( not ( = ?auto_467517 ?auto_467520 ) ) ( not ( = ?auto_467518 ?auto_467519 ) ) ( not ( = ?auto_467518 ?auto_467520 ) ) ( not ( = ?auto_467519 ?auto_467520 ) ) ( ON ?auto_467518 ?auto_467519 ) ( ON ?auto_467517 ?auto_467518 ) ( ON ?auto_467516 ?auto_467517 ) ( ON ?auto_467515 ?auto_467516 ) ( ON ?auto_467514 ?auto_467515 ) ( ON ?auto_467513 ?auto_467514 ) ( ON ?auto_467512 ?auto_467513 ) ( CLEAR ?auto_467510 ) ( ON ?auto_467511 ?auto_467512 ) ( CLEAR ?auto_467511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_467508 ?auto_467509 ?auto_467510 ?auto_467511 )
      ( MAKE-12PILE ?auto_467508 ?auto_467509 ?auto_467510 ?auto_467511 ?auto_467512 ?auto_467513 ?auto_467514 ?auto_467515 ?auto_467516 ?auto_467517 ?auto_467518 ?auto_467519 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_467558 - BLOCK
      ?auto_467559 - BLOCK
      ?auto_467560 - BLOCK
      ?auto_467561 - BLOCK
      ?auto_467562 - BLOCK
      ?auto_467563 - BLOCK
      ?auto_467564 - BLOCK
      ?auto_467565 - BLOCK
      ?auto_467566 - BLOCK
      ?auto_467567 - BLOCK
      ?auto_467568 - BLOCK
      ?auto_467569 - BLOCK
    )
    :vars
    (
      ?auto_467570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467569 ?auto_467570 ) ( ON-TABLE ?auto_467558 ) ( ON ?auto_467559 ?auto_467558 ) ( not ( = ?auto_467558 ?auto_467559 ) ) ( not ( = ?auto_467558 ?auto_467560 ) ) ( not ( = ?auto_467558 ?auto_467561 ) ) ( not ( = ?auto_467558 ?auto_467562 ) ) ( not ( = ?auto_467558 ?auto_467563 ) ) ( not ( = ?auto_467558 ?auto_467564 ) ) ( not ( = ?auto_467558 ?auto_467565 ) ) ( not ( = ?auto_467558 ?auto_467566 ) ) ( not ( = ?auto_467558 ?auto_467567 ) ) ( not ( = ?auto_467558 ?auto_467568 ) ) ( not ( = ?auto_467558 ?auto_467569 ) ) ( not ( = ?auto_467558 ?auto_467570 ) ) ( not ( = ?auto_467559 ?auto_467560 ) ) ( not ( = ?auto_467559 ?auto_467561 ) ) ( not ( = ?auto_467559 ?auto_467562 ) ) ( not ( = ?auto_467559 ?auto_467563 ) ) ( not ( = ?auto_467559 ?auto_467564 ) ) ( not ( = ?auto_467559 ?auto_467565 ) ) ( not ( = ?auto_467559 ?auto_467566 ) ) ( not ( = ?auto_467559 ?auto_467567 ) ) ( not ( = ?auto_467559 ?auto_467568 ) ) ( not ( = ?auto_467559 ?auto_467569 ) ) ( not ( = ?auto_467559 ?auto_467570 ) ) ( not ( = ?auto_467560 ?auto_467561 ) ) ( not ( = ?auto_467560 ?auto_467562 ) ) ( not ( = ?auto_467560 ?auto_467563 ) ) ( not ( = ?auto_467560 ?auto_467564 ) ) ( not ( = ?auto_467560 ?auto_467565 ) ) ( not ( = ?auto_467560 ?auto_467566 ) ) ( not ( = ?auto_467560 ?auto_467567 ) ) ( not ( = ?auto_467560 ?auto_467568 ) ) ( not ( = ?auto_467560 ?auto_467569 ) ) ( not ( = ?auto_467560 ?auto_467570 ) ) ( not ( = ?auto_467561 ?auto_467562 ) ) ( not ( = ?auto_467561 ?auto_467563 ) ) ( not ( = ?auto_467561 ?auto_467564 ) ) ( not ( = ?auto_467561 ?auto_467565 ) ) ( not ( = ?auto_467561 ?auto_467566 ) ) ( not ( = ?auto_467561 ?auto_467567 ) ) ( not ( = ?auto_467561 ?auto_467568 ) ) ( not ( = ?auto_467561 ?auto_467569 ) ) ( not ( = ?auto_467561 ?auto_467570 ) ) ( not ( = ?auto_467562 ?auto_467563 ) ) ( not ( = ?auto_467562 ?auto_467564 ) ) ( not ( = ?auto_467562 ?auto_467565 ) ) ( not ( = ?auto_467562 ?auto_467566 ) ) ( not ( = ?auto_467562 ?auto_467567 ) ) ( not ( = ?auto_467562 ?auto_467568 ) ) ( not ( = ?auto_467562 ?auto_467569 ) ) ( not ( = ?auto_467562 ?auto_467570 ) ) ( not ( = ?auto_467563 ?auto_467564 ) ) ( not ( = ?auto_467563 ?auto_467565 ) ) ( not ( = ?auto_467563 ?auto_467566 ) ) ( not ( = ?auto_467563 ?auto_467567 ) ) ( not ( = ?auto_467563 ?auto_467568 ) ) ( not ( = ?auto_467563 ?auto_467569 ) ) ( not ( = ?auto_467563 ?auto_467570 ) ) ( not ( = ?auto_467564 ?auto_467565 ) ) ( not ( = ?auto_467564 ?auto_467566 ) ) ( not ( = ?auto_467564 ?auto_467567 ) ) ( not ( = ?auto_467564 ?auto_467568 ) ) ( not ( = ?auto_467564 ?auto_467569 ) ) ( not ( = ?auto_467564 ?auto_467570 ) ) ( not ( = ?auto_467565 ?auto_467566 ) ) ( not ( = ?auto_467565 ?auto_467567 ) ) ( not ( = ?auto_467565 ?auto_467568 ) ) ( not ( = ?auto_467565 ?auto_467569 ) ) ( not ( = ?auto_467565 ?auto_467570 ) ) ( not ( = ?auto_467566 ?auto_467567 ) ) ( not ( = ?auto_467566 ?auto_467568 ) ) ( not ( = ?auto_467566 ?auto_467569 ) ) ( not ( = ?auto_467566 ?auto_467570 ) ) ( not ( = ?auto_467567 ?auto_467568 ) ) ( not ( = ?auto_467567 ?auto_467569 ) ) ( not ( = ?auto_467567 ?auto_467570 ) ) ( not ( = ?auto_467568 ?auto_467569 ) ) ( not ( = ?auto_467568 ?auto_467570 ) ) ( not ( = ?auto_467569 ?auto_467570 ) ) ( ON ?auto_467568 ?auto_467569 ) ( ON ?auto_467567 ?auto_467568 ) ( ON ?auto_467566 ?auto_467567 ) ( ON ?auto_467565 ?auto_467566 ) ( ON ?auto_467564 ?auto_467565 ) ( ON ?auto_467563 ?auto_467564 ) ( ON ?auto_467562 ?auto_467563 ) ( ON ?auto_467561 ?auto_467562 ) ( CLEAR ?auto_467559 ) ( ON ?auto_467560 ?auto_467561 ) ( CLEAR ?auto_467560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_467558 ?auto_467559 ?auto_467560 )
      ( MAKE-12PILE ?auto_467558 ?auto_467559 ?auto_467560 ?auto_467561 ?auto_467562 ?auto_467563 ?auto_467564 ?auto_467565 ?auto_467566 ?auto_467567 ?auto_467568 ?auto_467569 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_467608 - BLOCK
      ?auto_467609 - BLOCK
      ?auto_467610 - BLOCK
      ?auto_467611 - BLOCK
      ?auto_467612 - BLOCK
      ?auto_467613 - BLOCK
      ?auto_467614 - BLOCK
      ?auto_467615 - BLOCK
      ?auto_467616 - BLOCK
      ?auto_467617 - BLOCK
      ?auto_467618 - BLOCK
      ?auto_467619 - BLOCK
    )
    :vars
    (
      ?auto_467620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467619 ?auto_467620 ) ( ON-TABLE ?auto_467608 ) ( not ( = ?auto_467608 ?auto_467609 ) ) ( not ( = ?auto_467608 ?auto_467610 ) ) ( not ( = ?auto_467608 ?auto_467611 ) ) ( not ( = ?auto_467608 ?auto_467612 ) ) ( not ( = ?auto_467608 ?auto_467613 ) ) ( not ( = ?auto_467608 ?auto_467614 ) ) ( not ( = ?auto_467608 ?auto_467615 ) ) ( not ( = ?auto_467608 ?auto_467616 ) ) ( not ( = ?auto_467608 ?auto_467617 ) ) ( not ( = ?auto_467608 ?auto_467618 ) ) ( not ( = ?auto_467608 ?auto_467619 ) ) ( not ( = ?auto_467608 ?auto_467620 ) ) ( not ( = ?auto_467609 ?auto_467610 ) ) ( not ( = ?auto_467609 ?auto_467611 ) ) ( not ( = ?auto_467609 ?auto_467612 ) ) ( not ( = ?auto_467609 ?auto_467613 ) ) ( not ( = ?auto_467609 ?auto_467614 ) ) ( not ( = ?auto_467609 ?auto_467615 ) ) ( not ( = ?auto_467609 ?auto_467616 ) ) ( not ( = ?auto_467609 ?auto_467617 ) ) ( not ( = ?auto_467609 ?auto_467618 ) ) ( not ( = ?auto_467609 ?auto_467619 ) ) ( not ( = ?auto_467609 ?auto_467620 ) ) ( not ( = ?auto_467610 ?auto_467611 ) ) ( not ( = ?auto_467610 ?auto_467612 ) ) ( not ( = ?auto_467610 ?auto_467613 ) ) ( not ( = ?auto_467610 ?auto_467614 ) ) ( not ( = ?auto_467610 ?auto_467615 ) ) ( not ( = ?auto_467610 ?auto_467616 ) ) ( not ( = ?auto_467610 ?auto_467617 ) ) ( not ( = ?auto_467610 ?auto_467618 ) ) ( not ( = ?auto_467610 ?auto_467619 ) ) ( not ( = ?auto_467610 ?auto_467620 ) ) ( not ( = ?auto_467611 ?auto_467612 ) ) ( not ( = ?auto_467611 ?auto_467613 ) ) ( not ( = ?auto_467611 ?auto_467614 ) ) ( not ( = ?auto_467611 ?auto_467615 ) ) ( not ( = ?auto_467611 ?auto_467616 ) ) ( not ( = ?auto_467611 ?auto_467617 ) ) ( not ( = ?auto_467611 ?auto_467618 ) ) ( not ( = ?auto_467611 ?auto_467619 ) ) ( not ( = ?auto_467611 ?auto_467620 ) ) ( not ( = ?auto_467612 ?auto_467613 ) ) ( not ( = ?auto_467612 ?auto_467614 ) ) ( not ( = ?auto_467612 ?auto_467615 ) ) ( not ( = ?auto_467612 ?auto_467616 ) ) ( not ( = ?auto_467612 ?auto_467617 ) ) ( not ( = ?auto_467612 ?auto_467618 ) ) ( not ( = ?auto_467612 ?auto_467619 ) ) ( not ( = ?auto_467612 ?auto_467620 ) ) ( not ( = ?auto_467613 ?auto_467614 ) ) ( not ( = ?auto_467613 ?auto_467615 ) ) ( not ( = ?auto_467613 ?auto_467616 ) ) ( not ( = ?auto_467613 ?auto_467617 ) ) ( not ( = ?auto_467613 ?auto_467618 ) ) ( not ( = ?auto_467613 ?auto_467619 ) ) ( not ( = ?auto_467613 ?auto_467620 ) ) ( not ( = ?auto_467614 ?auto_467615 ) ) ( not ( = ?auto_467614 ?auto_467616 ) ) ( not ( = ?auto_467614 ?auto_467617 ) ) ( not ( = ?auto_467614 ?auto_467618 ) ) ( not ( = ?auto_467614 ?auto_467619 ) ) ( not ( = ?auto_467614 ?auto_467620 ) ) ( not ( = ?auto_467615 ?auto_467616 ) ) ( not ( = ?auto_467615 ?auto_467617 ) ) ( not ( = ?auto_467615 ?auto_467618 ) ) ( not ( = ?auto_467615 ?auto_467619 ) ) ( not ( = ?auto_467615 ?auto_467620 ) ) ( not ( = ?auto_467616 ?auto_467617 ) ) ( not ( = ?auto_467616 ?auto_467618 ) ) ( not ( = ?auto_467616 ?auto_467619 ) ) ( not ( = ?auto_467616 ?auto_467620 ) ) ( not ( = ?auto_467617 ?auto_467618 ) ) ( not ( = ?auto_467617 ?auto_467619 ) ) ( not ( = ?auto_467617 ?auto_467620 ) ) ( not ( = ?auto_467618 ?auto_467619 ) ) ( not ( = ?auto_467618 ?auto_467620 ) ) ( not ( = ?auto_467619 ?auto_467620 ) ) ( ON ?auto_467618 ?auto_467619 ) ( ON ?auto_467617 ?auto_467618 ) ( ON ?auto_467616 ?auto_467617 ) ( ON ?auto_467615 ?auto_467616 ) ( ON ?auto_467614 ?auto_467615 ) ( ON ?auto_467613 ?auto_467614 ) ( ON ?auto_467612 ?auto_467613 ) ( ON ?auto_467611 ?auto_467612 ) ( ON ?auto_467610 ?auto_467611 ) ( CLEAR ?auto_467608 ) ( ON ?auto_467609 ?auto_467610 ) ( CLEAR ?auto_467609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_467608 ?auto_467609 )
      ( MAKE-12PILE ?auto_467608 ?auto_467609 ?auto_467610 ?auto_467611 ?auto_467612 ?auto_467613 ?auto_467614 ?auto_467615 ?auto_467616 ?auto_467617 ?auto_467618 ?auto_467619 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_467658 - BLOCK
      ?auto_467659 - BLOCK
      ?auto_467660 - BLOCK
      ?auto_467661 - BLOCK
      ?auto_467662 - BLOCK
      ?auto_467663 - BLOCK
      ?auto_467664 - BLOCK
      ?auto_467665 - BLOCK
      ?auto_467666 - BLOCK
      ?auto_467667 - BLOCK
      ?auto_467668 - BLOCK
      ?auto_467669 - BLOCK
    )
    :vars
    (
      ?auto_467670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467669 ?auto_467670 ) ( not ( = ?auto_467658 ?auto_467659 ) ) ( not ( = ?auto_467658 ?auto_467660 ) ) ( not ( = ?auto_467658 ?auto_467661 ) ) ( not ( = ?auto_467658 ?auto_467662 ) ) ( not ( = ?auto_467658 ?auto_467663 ) ) ( not ( = ?auto_467658 ?auto_467664 ) ) ( not ( = ?auto_467658 ?auto_467665 ) ) ( not ( = ?auto_467658 ?auto_467666 ) ) ( not ( = ?auto_467658 ?auto_467667 ) ) ( not ( = ?auto_467658 ?auto_467668 ) ) ( not ( = ?auto_467658 ?auto_467669 ) ) ( not ( = ?auto_467658 ?auto_467670 ) ) ( not ( = ?auto_467659 ?auto_467660 ) ) ( not ( = ?auto_467659 ?auto_467661 ) ) ( not ( = ?auto_467659 ?auto_467662 ) ) ( not ( = ?auto_467659 ?auto_467663 ) ) ( not ( = ?auto_467659 ?auto_467664 ) ) ( not ( = ?auto_467659 ?auto_467665 ) ) ( not ( = ?auto_467659 ?auto_467666 ) ) ( not ( = ?auto_467659 ?auto_467667 ) ) ( not ( = ?auto_467659 ?auto_467668 ) ) ( not ( = ?auto_467659 ?auto_467669 ) ) ( not ( = ?auto_467659 ?auto_467670 ) ) ( not ( = ?auto_467660 ?auto_467661 ) ) ( not ( = ?auto_467660 ?auto_467662 ) ) ( not ( = ?auto_467660 ?auto_467663 ) ) ( not ( = ?auto_467660 ?auto_467664 ) ) ( not ( = ?auto_467660 ?auto_467665 ) ) ( not ( = ?auto_467660 ?auto_467666 ) ) ( not ( = ?auto_467660 ?auto_467667 ) ) ( not ( = ?auto_467660 ?auto_467668 ) ) ( not ( = ?auto_467660 ?auto_467669 ) ) ( not ( = ?auto_467660 ?auto_467670 ) ) ( not ( = ?auto_467661 ?auto_467662 ) ) ( not ( = ?auto_467661 ?auto_467663 ) ) ( not ( = ?auto_467661 ?auto_467664 ) ) ( not ( = ?auto_467661 ?auto_467665 ) ) ( not ( = ?auto_467661 ?auto_467666 ) ) ( not ( = ?auto_467661 ?auto_467667 ) ) ( not ( = ?auto_467661 ?auto_467668 ) ) ( not ( = ?auto_467661 ?auto_467669 ) ) ( not ( = ?auto_467661 ?auto_467670 ) ) ( not ( = ?auto_467662 ?auto_467663 ) ) ( not ( = ?auto_467662 ?auto_467664 ) ) ( not ( = ?auto_467662 ?auto_467665 ) ) ( not ( = ?auto_467662 ?auto_467666 ) ) ( not ( = ?auto_467662 ?auto_467667 ) ) ( not ( = ?auto_467662 ?auto_467668 ) ) ( not ( = ?auto_467662 ?auto_467669 ) ) ( not ( = ?auto_467662 ?auto_467670 ) ) ( not ( = ?auto_467663 ?auto_467664 ) ) ( not ( = ?auto_467663 ?auto_467665 ) ) ( not ( = ?auto_467663 ?auto_467666 ) ) ( not ( = ?auto_467663 ?auto_467667 ) ) ( not ( = ?auto_467663 ?auto_467668 ) ) ( not ( = ?auto_467663 ?auto_467669 ) ) ( not ( = ?auto_467663 ?auto_467670 ) ) ( not ( = ?auto_467664 ?auto_467665 ) ) ( not ( = ?auto_467664 ?auto_467666 ) ) ( not ( = ?auto_467664 ?auto_467667 ) ) ( not ( = ?auto_467664 ?auto_467668 ) ) ( not ( = ?auto_467664 ?auto_467669 ) ) ( not ( = ?auto_467664 ?auto_467670 ) ) ( not ( = ?auto_467665 ?auto_467666 ) ) ( not ( = ?auto_467665 ?auto_467667 ) ) ( not ( = ?auto_467665 ?auto_467668 ) ) ( not ( = ?auto_467665 ?auto_467669 ) ) ( not ( = ?auto_467665 ?auto_467670 ) ) ( not ( = ?auto_467666 ?auto_467667 ) ) ( not ( = ?auto_467666 ?auto_467668 ) ) ( not ( = ?auto_467666 ?auto_467669 ) ) ( not ( = ?auto_467666 ?auto_467670 ) ) ( not ( = ?auto_467667 ?auto_467668 ) ) ( not ( = ?auto_467667 ?auto_467669 ) ) ( not ( = ?auto_467667 ?auto_467670 ) ) ( not ( = ?auto_467668 ?auto_467669 ) ) ( not ( = ?auto_467668 ?auto_467670 ) ) ( not ( = ?auto_467669 ?auto_467670 ) ) ( ON ?auto_467668 ?auto_467669 ) ( ON ?auto_467667 ?auto_467668 ) ( ON ?auto_467666 ?auto_467667 ) ( ON ?auto_467665 ?auto_467666 ) ( ON ?auto_467664 ?auto_467665 ) ( ON ?auto_467663 ?auto_467664 ) ( ON ?auto_467662 ?auto_467663 ) ( ON ?auto_467661 ?auto_467662 ) ( ON ?auto_467660 ?auto_467661 ) ( ON ?auto_467659 ?auto_467660 ) ( ON ?auto_467658 ?auto_467659 ) ( CLEAR ?auto_467658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_467658 )
      ( MAKE-12PILE ?auto_467658 ?auto_467659 ?auto_467660 ?auto_467661 ?auto_467662 ?auto_467663 ?auto_467664 ?auto_467665 ?auto_467666 ?auto_467667 ?auto_467668 ?auto_467669 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_467709 - BLOCK
      ?auto_467710 - BLOCK
      ?auto_467711 - BLOCK
      ?auto_467712 - BLOCK
      ?auto_467713 - BLOCK
      ?auto_467714 - BLOCK
      ?auto_467715 - BLOCK
      ?auto_467716 - BLOCK
      ?auto_467717 - BLOCK
      ?auto_467718 - BLOCK
      ?auto_467719 - BLOCK
      ?auto_467720 - BLOCK
      ?auto_467721 - BLOCK
    )
    :vars
    (
      ?auto_467722 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_467720 ) ( ON ?auto_467721 ?auto_467722 ) ( CLEAR ?auto_467721 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_467709 ) ( ON ?auto_467710 ?auto_467709 ) ( ON ?auto_467711 ?auto_467710 ) ( ON ?auto_467712 ?auto_467711 ) ( ON ?auto_467713 ?auto_467712 ) ( ON ?auto_467714 ?auto_467713 ) ( ON ?auto_467715 ?auto_467714 ) ( ON ?auto_467716 ?auto_467715 ) ( ON ?auto_467717 ?auto_467716 ) ( ON ?auto_467718 ?auto_467717 ) ( ON ?auto_467719 ?auto_467718 ) ( ON ?auto_467720 ?auto_467719 ) ( not ( = ?auto_467709 ?auto_467710 ) ) ( not ( = ?auto_467709 ?auto_467711 ) ) ( not ( = ?auto_467709 ?auto_467712 ) ) ( not ( = ?auto_467709 ?auto_467713 ) ) ( not ( = ?auto_467709 ?auto_467714 ) ) ( not ( = ?auto_467709 ?auto_467715 ) ) ( not ( = ?auto_467709 ?auto_467716 ) ) ( not ( = ?auto_467709 ?auto_467717 ) ) ( not ( = ?auto_467709 ?auto_467718 ) ) ( not ( = ?auto_467709 ?auto_467719 ) ) ( not ( = ?auto_467709 ?auto_467720 ) ) ( not ( = ?auto_467709 ?auto_467721 ) ) ( not ( = ?auto_467709 ?auto_467722 ) ) ( not ( = ?auto_467710 ?auto_467711 ) ) ( not ( = ?auto_467710 ?auto_467712 ) ) ( not ( = ?auto_467710 ?auto_467713 ) ) ( not ( = ?auto_467710 ?auto_467714 ) ) ( not ( = ?auto_467710 ?auto_467715 ) ) ( not ( = ?auto_467710 ?auto_467716 ) ) ( not ( = ?auto_467710 ?auto_467717 ) ) ( not ( = ?auto_467710 ?auto_467718 ) ) ( not ( = ?auto_467710 ?auto_467719 ) ) ( not ( = ?auto_467710 ?auto_467720 ) ) ( not ( = ?auto_467710 ?auto_467721 ) ) ( not ( = ?auto_467710 ?auto_467722 ) ) ( not ( = ?auto_467711 ?auto_467712 ) ) ( not ( = ?auto_467711 ?auto_467713 ) ) ( not ( = ?auto_467711 ?auto_467714 ) ) ( not ( = ?auto_467711 ?auto_467715 ) ) ( not ( = ?auto_467711 ?auto_467716 ) ) ( not ( = ?auto_467711 ?auto_467717 ) ) ( not ( = ?auto_467711 ?auto_467718 ) ) ( not ( = ?auto_467711 ?auto_467719 ) ) ( not ( = ?auto_467711 ?auto_467720 ) ) ( not ( = ?auto_467711 ?auto_467721 ) ) ( not ( = ?auto_467711 ?auto_467722 ) ) ( not ( = ?auto_467712 ?auto_467713 ) ) ( not ( = ?auto_467712 ?auto_467714 ) ) ( not ( = ?auto_467712 ?auto_467715 ) ) ( not ( = ?auto_467712 ?auto_467716 ) ) ( not ( = ?auto_467712 ?auto_467717 ) ) ( not ( = ?auto_467712 ?auto_467718 ) ) ( not ( = ?auto_467712 ?auto_467719 ) ) ( not ( = ?auto_467712 ?auto_467720 ) ) ( not ( = ?auto_467712 ?auto_467721 ) ) ( not ( = ?auto_467712 ?auto_467722 ) ) ( not ( = ?auto_467713 ?auto_467714 ) ) ( not ( = ?auto_467713 ?auto_467715 ) ) ( not ( = ?auto_467713 ?auto_467716 ) ) ( not ( = ?auto_467713 ?auto_467717 ) ) ( not ( = ?auto_467713 ?auto_467718 ) ) ( not ( = ?auto_467713 ?auto_467719 ) ) ( not ( = ?auto_467713 ?auto_467720 ) ) ( not ( = ?auto_467713 ?auto_467721 ) ) ( not ( = ?auto_467713 ?auto_467722 ) ) ( not ( = ?auto_467714 ?auto_467715 ) ) ( not ( = ?auto_467714 ?auto_467716 ) ) ( not ( = ?auto_467714 ?auto_467717 ) ) ( not ( = ?auto_467714 ?auto_467718 ) ) ( not ( = ?auto_467714 ?auto_467719 ) ) ( not ( = ?auto_467714 ?auto_467720 ) ) ( not ( = ?auto_467714 ?auto_467721 ) ) ( not ( = ?auto_467714 ?auto_467722 ) ) ( not ( = ?auto_467715 ?auto_467716 ) ) ( not ( = ?auto_467715 ?auto_467717 ) ) ( not ( = ?auto_467715 ?auto_467718 ) ) ( not ( = ?auto_467715 ?auto_467719 ) ) ( not ( = ?auto_467715 ?auto_467720 ) ) ( not ( = ?auto_467715 ?auto_467721 ) ) ( not ( = ?auto_467715 ?auto_467722 ) ) ( not ( = ?auto_467716 ?auto_467717 ) ) ( not ( = ?auto_467716 ?auto_467718 ) ) ( not ( = ?auto_467716 ?auto_467719 ) ) ( not ( = ?auto_467716 ?auto_467720 ) ) ( not ( = ?auto_467716 ?auto_467721 ) ) ( not ( = ?auto_467716 ?auto_467722 ) ) ( not ( = ?auto_467717 ?auto_467718 ) ) ( not ( = ?auto_467717 ?auto_467719 ) ) ( not ( = ?auto_467717 ?auto_467720 ) ) ( not ( = ?auto_467717 ?auto_467721 ) ) ( not ( = ?auto_467717 ?auto_467722 ) ) ( not ( = ?auto_467718 ?auto_467719 ) ) ( not ( = ?auto_467718 ?auto_467720 ) ) ( not ( = ?auto_467718 ?auto_467721 ) ) ( not ( = ?auto_467718 ?auto_467722 ) ) ( not ( = ?auto_467719 ?auto_467720 ) ) ( not ( = ?auto_467719 ?auto_467721 ) ) ( not ( = ?auto_467719 ?auto_467722 ) ) ( not ( = ?auto_467720 ?auto_467721 ) ) ( not ( = ?auto_467720 ?auto_467722 ) ) ( not ( = ?auto_467721 ?auto_467722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_467721 ?auto_467722 )
      ( !STACK ?auto_467721 ?auto_467720 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_467763 - BLOCK
      ?auto_467764 - BLOCK
      ?auto_467765 - BLOCK
      ?auto_467766 - BLOCK
      ?auto_467767 - BLOCK
      ?auto_467768 - BLOCK
      ?auto_467769 - BLOCK
      ?auto_467770 - BLOCK
      ?auto_467771 - BLOCK
      ?auto_467772 - BLOCK
      ?auto_467773 - BLOCK
      ?auto_467774 - BLOCK
      ?auto_467775 - BLOCK
    )
    :vars
    (
      ?auto_467776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467775 ?auto_467776 ) ( ON-TABLE ?auto_467763 ) ( ON ?auto_467764 ?auto_467763 ) ( ON ?auto_467765 ?auto_467764 ) ( ON ?auto_467766 ?auto_467765 ) ( ON ?auto_467767 ?auto_467766 ) ( ON ?auto_467768 ?auto_467767 ) ( ON ?auto_467769 ?auto_467768 ) ( ON ?auto_467770 ?auto_467769 ) ( ON ?auto_467771 ?auto_467770 ) ( ON ?auto_467772 ?auto_467771 ) ( ON ?auto_467773 ?auto_467772 ) ( not ( = ?auto_467763 ?auto_467764 ) ) ( not ( = ?auto_467763 ?auto_467765 ) ) ( not ( = ?auto_467763 ?auto_467766 ) ) ( not ( = ?auto_467763 ?auto_467767 ) ) ( not ( = ?auto_467763 ?auto_467768 ) ) ( not ( = ?auto_467763 ?auto_467769 ) ) ( not ( = ?auto_467763 ?auto_467770 ) ) ( not ( = ?auto_467763 ?auto_467771 ) ) ( not ( = ?auto_467763 ?auto_467772 ) ) ( not ( = ?auto_467763 ?auto_467773 ) ) ( not ( = ?auto_467763 ?auto_467774 ) ) ( not ( = ?auto_467763 ?auto_467775 ) ) ( not ( = ?auto_467763 ?auto_467776 ) ) ( not ( = ?auto_467764 ?auto_467765 ) ) ( not ( = ?auto_467764 ?auto_467766 ) ) ( not ( = ?auto_467764 ?auto_467767 ) ) ( not ( = ?auto_467764 ?auto_467768 ) ) ( not ( = ?auto_467764 ?auto_467769 ) ) ( not ( = ?auto_467764 ?auto_467770 ) ) ( not ( = ?auto_467764 ?auto_467771 ) ) ( not ( = ?auto_467764 ?auto_467772 ) ) ( not ( = ?auto_467764 ?auto_467773 ) ) ( not ( = ?auto_467764 ?auto_467774 ) ) ( not ( = ?auto_467764 ?auto_467775 ) ) ( not ( = ?auto_467764 ?auto_467776 ) ) ( not ( = ?auto_467765 ?auto_467766 ) ) ( not ( = ?auto_467765 ?auto_467767 ) ) ( not ( = ?auto_467765 ?auto_467768 ) ) ( not ( = ?auto_467765 ?auto_467769 ) ) ( not ( = ?auto_467765 ?auto_467770 ) ) ( not ( = ?auto_467765 ?auto_467771 ) ) ( not ( = ?auto_467765 ?auto_467772 ) ) ( not ( = ?auto_467765 ?auto_467773 ) ) ( not ( = ?auto_467765 ?auto_467774 ) ) ( not ( = ?auto_467765 ?auto_467775 ) ) ( not ( = ?auto_467765 ?auto_467776 ) ) ( not ( = ?auto_467766 ?auto_467767 ) ) ( not ( = ?auto_467766 ?auto_467768 ) ) ( not ( = ?auto_467766 ?auto_467769 ) ) ( not ( = ?auto_467766 ?auto_467770 ) ) ( not ( = ?auto_467766 ?auto_467771 ) ) ( not ( = ?auto_467766 ?auto_467772 ) ) ( not ( = ?auto_467766 ?auto_467773 ) ) ( not ( = ?auto_467766 ?auto_467774 ) ) ( not ( = ?auto_467766 ?auto_467775 ) ) ( not ( = ?auto_467766 ?auto_467776 ) ) ( not ( = ?auto_467767 ?auto_467768 ) ) ( not ( = ?auto_467767 ?auto_467769 ) ) ( not ( = ?auto_467767 ?auto_467770 ) ) ( not ( = ?auto_467767 ?auto_467771 ) ) ( not ( = ?auto_467767 ?auto_467772 ) ) ( not ( = ?auto_467767 ?auto_467773 ) ) ( not ( = ?auto_467767 ?auto_467774 ) ) ( not ( = ?auto_467767 ?auto_467775 ) ) ( not ( = ?auto_467767 ?auto_467776 ) ) ( not ( = ?auto_467768 ?auto_467769 ) ) ( not ( = ?auto_467768 ?auto_467770 ) ) ( not ( = ?auto_467768 ?auto_467771 ) ) ( not ( = ?auto_467768 ?auto_467772 ) ) ( not ( = ?auto_467768 ?auto_467773 ) ) ( not ( = ?auto_467768 ?auto_467774 ) ) ( not ( = ?auto_467768 ?auto_467775 ) ) ( not ( = ?auto_467768 ?auto_467776 ) ) ( not ( = ?auto_467769 ?auto_467770 ) ) ( not ( = ?auto_467769 ?auto_467771 ) ) ( not ( = ?auto_467769 ?auto_467772 ) ) ( not ( = ?auto_467769 ?auto_467773 ) ) ( not ( = ?auto_467769 ?auto_467774 ) ) ( not ( = ?auto_467769 ?auto_467775 ) ) ( not ( = ?auto_467769 ?auto_467776 ) ) ( not ( = ?auto_467770 ?auto_467771 ) ) ( not ( = ?auto_467770 ?auto_467772 ) ) ( not ( = ?auto_467770 ?auto_467773 ) ) ( not ( = ?auto_467770 ?auto_467774 ) ) ( not ( = ?auto_467770 ?auto_467775 ) ) ( not ( = ?auto_467770 ?auto_467776 ) ) ( not ( = ?auto_467771 ?auto_467772 ) ) ( not ( = ?auto_467771 ?auto_467773 ) ) ( not ( = ?auto_467771 ?auto_467774 ) ) ( not ( = ?auto_467771 ?auto_467775 ) ) ( not ( = ?auto_467771 ?auto_467776 ) ) ( not ( = ?auto_467772 ?auto_467773 ) ) ( not ( = ?auto_467772 ?auto_467774 ) ) ( not ( = ?auto_467772 ?auto_467775 ) ) ( not ( = ?auto_467772 ?auto_467776 ) ) ( not ( = ?auto_467773 ?auto_467774 ) ) ( not ( = ?auto_467773 ?auto_467775 ) ) ( not ( = ?auto_467773 ?auto_467776 ) ) ( not ( = ?auto_467774 ?auto_467775 ) ) ( not ( = ?auto_467774 ?auto_467776 ) ) ( not ( = ?auto_467775 ?auto_467776 ) ) ( CLEAR ?auto_467773 ) ( ON ?auto_467774 ?auto_467775 ) ( CLEAR ?auto_467774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_467763 ?auto_467764 ?auto_467765 ?auto_467766 ?auto_467767 ?auto_467768 ?auto_467769 ?auto_467770 ?auto_467771 ?auto_467772 ?auto_467773 ?auto_467774 )
      ( MAKE-13PILE ?auto_467763 ?auto_467764 ?auto_467765 ?auto_467766 ?auto_467767 ?auto_467768 ?auto_467769 ?auto_467770 ?auto_467771 ?auto_467772 ?auto_467773 ?auto_467774 ?auto_467775 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_467817 - BLOCK
      ?auto_467818 - BLOCK
      ?auto_467819 - BLOCK
      ?auto_467820 - BLOCK
      ?auto_467821 - BLOCK
      ?auto_467822 - BLOCK
      ?auto_467823 - BLOCK
      ?auto_467824 - BLOCK
      ?auto_467825 - BLOCK
      ?auto_467826 - BLOCK
      ?auto_467827 - BLOCK
      ?auto_467828 - BLOCK
      ?auto_467829 - BLOCK
    )
    :vars
    (
      ?auto_467830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467829 ?auto_467830 ) ( ON-TABLE ?auto_467817 ) ( ON ?auto_467818 ?auto_467817 ) ( ON ?auto_467819 ?auto_467818 ) ( ON ?auto_467820 ?auto_467819 ) ( ON ?auto_467821 ?auto_467820 ) ( ON ?auto_467822 ?auto_467821 ) ( ON ?auto_467823 ?auto_467822 ) ( ON ?auto_467824 ?auto_467823 ) ( ON ?auto_467825 ?auto_467824 ) ( ON ?auto_467826 ?auto_467825 ) ( not ( = ?auto_467817 ?auto_467818 ) ) ( not ( = ?auto_467817 ?auto_467819 ) ) ( not ( = ?auto_467817 ?auto_467820 ) ) ( not ( = ?auto_467817 ?auto_467821 ) ) ( not ( = ?auto_467817 ?auto_467822 ) ) ( not ( = ?auto_467817 ?auto_467823 ) ) ( not ( = ?auto_467817 ?auto_467824 ) ) ( not ( = ?auto_467817 ?auto_467825 ) ) ( not ( = ?auto_467817 ?auto_467826 ) ) ( not ( = ?auto_467817 ?auto_467827 ) ) ( not ( = ?auto_467817 ?auto_467828 ) ) ( not ( = ?auto_467817 ?auto_467829 ) ) ( not ( = ?auto_467817 ?auto_467830 ) ) ( not ( = ?auto_467818 ?auto_467819 ) ) ( not ( = ?auto_467818 ?auto_467820 ) ) ( not ( = ?auto_467818 ?auto_467821 ) ) ( not ( = ?auto_467818 ?auto_467822 ) ) ( not ( = ?auto_467818 ?auto_467823 ) ) ( not ( = ?auto_467818 ?auto_467824 ) ) ( not ( = ?auto_467818 ?auto_467825 ) ) ( not ( = ?auto_467818 ?auto_467826 ) ) ( not ( = ?auto_467818 ?auto_467827 ) ) ( not ( = ?auto_467818 ?auto_467828 ) ) ( not ( = ?auto_467818 ?auto_467829 ) ) ( not ( = ?auto_467818 ?auto_467830 ) ) ( not ( = ?auto_467819 ?auto_467820 ) ) ( not ( = ?auto_467819 ?auto_467821 ) ) ( not ( = ?auto_467819 ?auto_467822 ) ) ( not ( = ?auto_467819 ?auto_467823 ) ) ( not ( = ?auto_467819 ?auto_467824 ) ) ( not ( = ?auto_467819 ?auto_467825 ) ) ( not ( = ?auto_467819 ?auto_467826 ) ) ( not ( = ?auto_467819 ?auto_467827 ) ) ( not ( = ?auto_467819 ?auto_467828 ) ) ( not ( = ?auto_467819 ?auto_467829 ) ) ( not ( = ?auto_467819 ?auto_467830 ) ) ( not ( = ?auto_467820 ?auto_467821 ) ) ( not ( = ?auto_467820 ?auto_467822 ) ) ( not ( = ?auto_467820 ?auto_467823 ) ) ( not ( = ?auto_467820 ?auto_467824 ) ) ( not ( = ?auto_467820 ?auto_467825 ) ) ( not ( = ?auto_467820 ?auto_467826 ) ) ( not ( = ?auto_467820 ?auto_467827 ) ) ( not ( = ?auto_467820 ?auto_467828 ) ) ( not ( = ?auto_467820 ?auto_467829 ) ) ( not ( = ?auto_467820 ?auto_467830 ) ) ( not ( = ?auto_467821 ?auto_467822 ) ) ( not ( = ?auto_467821 ?auto_467823 ) ) ( not ( = ?auto_467821 ?auto_467824 ) ) ( not ( = ?auto_467821 ?auto_467825 ) ) ( not ( = ?auto_467821 ?auto_467826 ) ) ( not ( = ?auto_467821 ?auto_467827 ) ) ( not ( = ?auto_467821 ?auto_467828 ) ) ( not ( = ?auto_467821 ?auto_467829 ) ) ( not ( = ?auto_467821 ?auto_467830 ) ) ( not ( = ?auto_467822 ?auto_467823 ) ) ( not ( = ?auto_467822 ?auto_467824 ) ) ( not ( = ?auto_467822 ?auto_467825 ) ) ( not ( = ?auto_467822 ?auto_467826 ) ) ( not ( = ?auto_467822 ?auto_467827 ) ) ( not ( = ?auto_467822 ?auto_467828 ) ) ( not ( = ?auto_467822 ?auto_467829 ) ) ( not ( = ?auto_467822 ?auto_467830 ) ) ( not ( = ?auto_467823 ?auto_467824 ) ) ( not ( = ?auto_467823 ?auto_467825 ) ) ( not ( = ?auto_467823 ?auto_467826 ) ) ( not ( = ?auto_467823 ?auto_467827 ) ) ( not ( = ?auto_467823 ?auto_467828 ) ) ( not ( = ?auto_467823 ?auto_467829 ) ) ( not ( = ?auto_467823 ?auto_467830 ) ) ( not ( = ?auto_467824 ?auto_467825 ) ) ( not ( = ?auto_467824 ?auto_467826 ) ) ( not ( = ?auto_467824 ?auto_467827 ) ) ( not ( = ?auto_467824 ?auto_467828 ) ) ( not ( = ?auto_467824 ?auto_467829 ) ) ( not ( = ?auto_467824 ?auto_467830 ) ) ( not ( = ?auto_467825 ?auto_467826 ) ) ( not ( = ?auto_467825 ?auto_467827 ) ) ( not ( = ?auto_467825 ?auto_467828 ) ) ( not ( = ?auto_467825 ?auto_467829 ) ) ( not ( = ?auto_467825 ?auto_467830 ) ) ( not ( = ?auto_467826 ?auto_467827 ) ) ( not ( = ?auto_467826 ?auto_467828 ) ) ( not ( = ?auto_467826 ?auto_467829 ) ) ( not ( = ?auto_467826 ?auto_467830 ) ) ( not ( = ?auto_467827 ?auto_467828 ) ) ( not ( = ?auto_467827 ?auto_467829 ) ) ( not ( = ?auto_467827 ?auto_467830 ) ) ( not ( = ?auto_467828 ?auto_467829 ) ) ( not ( = ?auto_467828 ?auto_467830 ) ) ( not ( = ?auto_467829 ?auto_467830 ) ) ( ON ?auto_467828 ?auto_467829 ) ( CLEAR ?auto_467826 ) ( ON ?auto_467827 ?auto_467828 ) ( CLEAR ?auto_467827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_467817 ?auto_467818 ?auto_467819 ?auto_467820 ?auto_467821 ?auto_467822 ?auto_467823 ?auto_467824 ?auto_467825 ?auto_467826 ?auto_467827 )
      ( MAKE-13PILE ?auto_467817 ?auto_467818 ?auto_467819 ?auto_467820 ?auto_467821 ?auto_467822 ?auto_467823 ?auto_467824 ?auto_467825 ?auto_467826 ?auto_467827 ?auto_467828 ?auto_467829 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_467871 - BLOCK
      ?auto_467872 - BLOCK
      ?auto_467873 - BLOCK
      ?auto_467874 - BLOCK
      ?auto_467875 - BLOCK
      ?auto_467876 - BLOCK
      ?auto_467877 - BLOCK
      ?auto_467878 - BLOCK
      ?auto_467879 - BLOCK
      ?auto_467880 - BLOCK
      ?auto_467881 - BLOCK
      ?auto_467882 - BLOCK
      ?auto_467883 - BLOCK
    )
    :vars
    (
      ?auto_467884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467883 ?auto_467884 ) ( ON-TABLE ?auto_467871 ) ( ON ?auto_467872 ?auto_467871 ) ( ON ?auto_467873 ?auto_467872 ) ( ON ?auto_467874 ?auto_467873 ) ( ON ?auto_467875 ?auto_467874 ) ( ON ?auto_467876 ?auto_467875 ) ( ON ?auto_467877 ?auto_467876 ) ( ON ?auto_467878 ?auto_467877 ) ( ON ?auto_467879 ?auto_467878 ) ( not ( = ?auto_467871 ?auto_467872 ) ) ( not ( = ?auto_467871 ?auto_467873 ) ) ( not ( = ?auto_467871 ?auto_467874 ) ) ( not ( = ?auto_467871 ?auto_467875 ) ) ( not ( = ?auto_467871 ?auto_467876 ) ) ( not ( = ?auto_467871 ?auto_467877 ) ) ( not ( = ?auto_467871 ?auto_467878 ) ) ( not ( = ?auto_467871 ?auto_467879 ) ) ( not ( = ?auto_467871 ?auto_467880 ) ) ( not ( = ?auto_467871 ?auto_467881 ) ) ( not ( = ?auto_467871 ?auto_467882 ) ) ( not ( = ?auto_467871 ?auto_467883 ) ) ( not ( = ?auto_467871 ?auto_467884 ) ) ( not ( = ?auto_467872 ?auto_467873 ) ) ( not ( = ?auto_467872 ?auto_467874 ) ) ( not ( = ?auto_467872 ?auto_467875 ) ) ( not ( = ?auto_467872 ?auto_467876 ) ) ( not ( = ?auto_467872 ?auto_467877 ) ) ( not ( = ?auto_467872 ?auto_467878 ) ) ( not ( = ?auto_467872 ?auto_467879 ) ) ( not ( = ?auto_467872 ?auto_467880 ) ) ( not ( = ?auto_467872 ?auto_467881 ) ) ( not ( = ?auto_467872 ?auto_467882 ) ) ( not ( = ?auto_467872 ?auto_467883 ) ) ( not ( = ?auto_467872 ?auto_467884 ) ) ( not ( = ?auto_467873 ?auto_467874 ) ) ( not ( = ?auto_467873 ?auto_467875 ) ) ( not ( = ?auto_467873 ?auto_467876 ) ) ( not ( = ?auto_467873 ?auto_467877 ) ) ( not ( = ?auto_467873 ?auto_467878 ) ) ( not ( = ?auto_467873 ?auto_467879 ) ) ( not ( = ?auto_467873 ?auto_467880 ) ) ( not ( = ?auto_467873 ?auto_467881 ) ) ( not ( = ?auto_467873 ?auto_467882 ) ) ( not ( = ?auto_467873 ?auto_467883 ) ) ( not ( = ?auto_467873 ?auto_467884 ) ) ( not ( = ?auto_467874 ?auto_467875 ) ) ( not ( = ?auto_467874 ?auto_467876 ) ) ( not ( = ?auto_467874 ?auto_467877 ) ) ( not ( = ?auto_467874 ?auto_467878 ) ) ( not ( = ?auto_467874 ?auto_467879 ) ) ( not ( = ?auto_467874 ?auto_467880 ) ) ( not ( = ?auto_467874 ?auto_467881 ) ) ( not ( = ?auto_467874 ?auto_467882 ) ) ( not ( = ?auto_467874 ?auto_467883 ) ) ( not ( = ?auto_467874 ?auto_467884 ) ) ( not ( = ?auto_467875 ?auto_467876 ) ) ( not ( = ?auto_467875 ?auto_467877 ) ) ( not ( = ?auto_467875 ?auto_467878 ) ) ( not ( = ?auto_467875 ?auto_467879 ) ) ( not ( = ?auto_467875 ?auto_467880 ) ) ( not ( = ?auto_467875 ?auto_467881 ) ) ( not ( = ?auto_467875 ?auto_467882 ) ) ( not ( = ?auto_467875 ?auto_467883 ) ) ( not ( = ?auto_467875 ?auto_467884 ) ) ( not ( = ?auto_467876 ?auto_467877 ) ) ( not ( = ?auto_467876 ?auto_467878 ) ) ( not ( = ?auto_467876 ?auto_467879 ) ) ( not ( = ?auto_467876 ?auto_467880 ) ) ( not ( = ?auto_467876 ?auto_467881 ) ) ( not ( = ?auto_467876 ?auto_467882 ) ) ( not ( = ?auto_467876 ?auto_467883 ) ) ( not ( = ?auto_467876 ?auto_467884 ) ) ( not ( = ?auto_467877 ?auto_467878 ) ) ( not ( = ?auto_467877 ?auto_467879 ) ) ( not ( = ?auto_467877 ?auto_467880 ) ) ( not ( = ?auto_467877 ?auto_467881 ) ) ( not ( = ?auto_467877 ?auto_467882 ) ) ( not ( = ?auto_467877 ?auto_467883 ) ) ( not ( = ?auto_467877 ?auto_467884 ) ) ( not ( = ?auto_467878 ?auto_467879 ) ) ( not ( = ?auto_467878 ?auto_467880 ) ) ( not ( = ?auto_467878 ?auto_467881 ) ) ( not ( = ?auto_467878 ?auto_467882 ) ) ( not ( = ?auto_467878 ?auto_467883 ) ) ( not ( = ?auto_467878 ?auto_467884 ) ) ( not ( = ?auto_467879 ?auto_467880 ) ) ( not ( = ?auto_467879 ?auto_467881 ) ) ( not ( = ?auto_467879 ?auto_467882 ) ) ( not ( = ?auto_467879 ?auto_467883 ) ) ( not ( = ?auto_467879 ?auto_467884 ) ) ( not ( = ?auto_467880 ?auto_467881 ) ) ( not ( = ?auto_467880 ?auto_467882 ) ) ( not ( = ?auto_467880 ?auto_467883 ) ) ( not ( = ?auto_467880 ?auto_467884 ) ) ( not ( = ?auto_467881 ?auto_467882 ) ) ( not ( = ?auto_467881 ?auto_467883 ) ) ( not ( = ?auto_467881 ?auto_467884 ) ) ( not ( = ?auto_467882 ?auto_467883 ) ) ( not ( = ?auto_467882 ?auto_467884 ) ) ( not ( = ?auto_467883 ?auto_467884 ) ) ( ON ?auto_467882 ?auto_467883 ) ( ON ?auto_467881 ?auto_467882 ) ( CLEAR ?auto_467879 ) ( ON ?auto_467880 ?auto_467881 ) ( CLEAR ?auto_467880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_467871 ?auto_467872 ?auto_467873 ?auto_467874 ?auto_467875 ?auto_467876 ?auto_467877 ?auto_467878 ?auto_467879 ?auto_467880 )
      ( MAKE-13PILE ?auto_467871 ?auto_467872 ?auto_467873 ?auto_467874 ?auto_467875 ?auto_467876 ?auto_467877 ?auto_467878 ?auto_467879 ?auto_467880 ?auto_467881 ?auto_467882 ?auto_467883 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_467925 - BLOCK
      ?auto_467926 - BLOCK
      ?auto_467927 - BLOCK
      ?auto_467928 - BLOCK
      ?auto_467929 - BLOCK
      ?auto_467930 - BLOCK
      ?auto_467931 - BLOCK
      ?auto_467932 - BLOCK
      ?auto_467933 - BLOCK
      ?auto_467934 - BLOCK
      ?auto_467935 - BLOCK
      ?auto_467936 - BLOCK
      ?auto_467937 - BLOCK
    )
    :vars
    (
      ?auto_467938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467937 ?auto_467938 ) ( ON-TABLE ?auto_467925 ) ( ON ?auto_467926 ?auto_467925 ) ( ON ?auto_467927 ?auto_467926 ) ( ON ?auto_467928 ?auto_467927 ) ( ON ?auto_467929 ?auto_467928 ) ( ON ?auto_467930 ?auto_467929 ) ( ON ?auto_467931 ?auto_467930 ) ( ON ?auto_467932 ?auto_467931 ) ( not ( = ?auto_467925 ?auto_467926 ) ) ( not ( = ?auto_467925 ?auto_467927 ) ) ( not ( = ?auto_467925 ?auto_467928 ) ) ( not ( = ?auto_467925 ?auto_467929 ) ) ( not ( = ?auto_467925 ?auto_467930 ) ) ( not ( = ?auto_467925 ?auto_467931 ) ) ( not ( = ?auto_467925 ?auto_467932 ) ) ( not ( = ?auto_467925 ?auto_467933 ) ) ( not ( = ?auto_467925 ?auto_467934 ) ) ( not ( = ?auto_467925 ?auto_467935 ) ) ( not ( = ?auto_467925 ?auto_467936 ) ) ( not ( = ?auto_467925 ?auto_467937 ) ) ( not ( = ?auto_467925 ?auto_467938 ) ) ( not ( = ?auto_467926 ?auto_467927 ) ) ( not ( = ?auto_467926 ?auto_467928 ) ) ( not ( = ?auto_467926 ?auto_467929 ) ) ( not ( = ?auto_467926 ?auto_467930 ) ) ( not ( = ?auto_467926 ?auto_467931 ) ) ( not ( = ?auto_467926 ?auto_467932 ) ) ( not ( = ?auto_467926 ?auto_467933 ) ) ( not ( = ?auto_467926 ?auto_467934 ) ) ( not ( = ?auto_467926 ?auto_467935 ) ) ( not ( = ?auto_467926 ?auto_467936 ) ) ( not ( = ?auto_467926 ?auto_467937 ) ) ( not ( = ?auto_467926 ?auto_467938 ) ) ( not ( = ?auto_467927 ?auto_467928 ) ) ( not ( = ?auto_467927 ?auto_467929 ) ) ( not ( = ?auto_467927 ?auto_467930 ) ) ( not ( = ?auto_467927 ?auto_467931 ) ) ( not ( = ?auto_467927 ?auto_467932 ) ) ( not ( = ?auto_467927 ?auto_467933 ) ) ( not ( = ?auto_467927 ?auto_467934 ) ) ( not ( = ?auto_467927 ?auto_467935 ) ) ( not ( = ?auto_467927 ?auto_467936 ) ) ( not ( = ?auto_467927 ?auto_467937 ) ) ( not ( = ?auto_467927 ?auto_467938 ) ) ( not ( = ?auto_467928 ?auto_467929 ) ) ( not ( = ?auto_467928 ?auto_467930 ) ) ( not ( = ?auto_467928 ?auto_467931 ) ) ( not ( = ?auto_467928 ?auto_467932 ) ) ( not ( = ?auto_467928 ?auto_467933 ) ) ( not ( = ?auto_467928 ?auto_467934 ) ) ( not ( = ?auto_467928 ?auto_467935 ) ) ( not ( = ?auto_467928 ?auto_467936 ) ) ( not ( = ?auto_467928 ?auto_467937 ) ) ( not ( = ?auto_467928 ?auto_467938 ) ) ( not ( = ?auto_467929 ?auto_467930 ) ) ( not ( = ?auto_467929 ?auto_467931 ) ) ( not ( = ?auto_467929 ?auto_467932 ) ) ( not ( = ?auto_467929 ?auto_467933 ) ) ( not ( = ?auto_467929 ?auto_467934 ) ) ( not ( = ?auto_467929 ?auto_467935 ) ) ( not ( = ?auto_467929 ?auto_467936 ) ) ( not ( = ?auto_467929 ?auto_467937 ) ) ( not ( = ?auto_467929 ?auto_467938 ) ) ( not ( = ?auto_467930 ?auto_467931 ) ) ( not ( = ?auto_467930 ?auto_467932 ) ) ( not ( = ?auto_467930 ?auto_467933 ) ) ( not ( = ?auto_467930 ?auto_467934 ) ) ( not ( = ?auto_467930 ?auto_467935 ) ) ( not ( = ?auto_467930 ?auto_467936 ) ) ( not ( = ?auto_467930 ?auto_467937 ) ) ( not ( = ?auto_467930 ?auto_467938 ) ) ( not ( = ?auto_467931 ?auto_467932 ) ) ( not ( = ?auto_467931 ?auto_467933 ) ) ( not ( = ?auto_467931 ?auto_467934 ) ) ( not ( = ?auto_467931 ?auto_467935 ) ) ( not ( = ?auto_467931 ?auto_467936 ) ) ( not ( = ?auto_467931 ?auto_467937 ) ) ( not ( = ?auto_467931 ?auto_467938 ) ) ( not ( = ?auto_467932 ?auto_467933 ) ) ( not ( = ?auto_467932 ?auto_467934 ) ) ( not ( = ?auto_467932 ?auto_467935 ) ) ( not ( = ?auto_467932 ?auto_467936 ) ) ( not ( = ?auto_467932 ?auto_467937 ) ) ( not ( = ?auto_467932 ?auto_467938 ) ) ( not ( = ?auto_467933 ?auto_467934 ) ) ( not ( = ?auto_467933 ?auto_467935 ) ) ( not ( = ?auto_467933 ?auto_467936 ) ) ( not ( = ?auto_467933 ?auto_467937 ) ) ( not ( = ?auto_467933 ?auto_467938 ) ) ( not ( = ?auto_467934 ?auto_467935 ) ) ( not ( = ?auto_467934 ?auto_467936 ) ) ( not ( = ?auto_467934 ?auto_467937 ) ) ( not ( = ?auto_467934 ?auto_467938 ) ) ( not ( = ?auto_467935 ?auto_467936 ) ) ( not ( = ?auto_467935 ?auto_467937 ) ) ( not ( = ?auto_467935 ?auto_467938 ) ) ( not ( = ?auto_467936 ?auto_467937 ) ) ( not ( = ?auto_467936 ?auto_467938 ) ) ( not ( = ?auto_467937 ?auto_467938 ) ) ( ON ?auto_467936 ?auto_467937 ) ( ON ?auto_467935 ?auto_467936 ) ( ON ?auto_467934 ?auto_467935 ) ( CLEAR ?auto_467932 ) ( ON ?auto_467933 ?auto_467934 ) ( CLEAR ?auto_467933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_467925 ?auto_467926 ?auto_467927 ?auto_467928 ?auto_467929 ?auto_467930 ?auto_467931 ?auto_467932 ?auto_467933 )
      ( MAKE-13PILE ?auto_467925 ?auto_467926 ?auto_467927 ?auto_467928 ?auto_467929 ?auto_467930 ?auto_467931 ?auto_467932 ?auto_467933 ?auto_467934 ?auto_467935 ?auto_467936 ?auto_467937 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_467979 - BLOCK
      ?auto_467980 - BLOCK
      ?auto_467981 - BLOCK
      ?auto_467982 - BLOCK
      ?auto_467983 - BLOCK
      ?auto_467984 - BLOCK
      ?auto_467985 - BLOCK
      ?auto_467986 - BLOCK
      ?auto_467987 - BLOCK
      ?auto_467988 - BLOCK
      ?auto_467989 - BLOCK
      ?auto_467990 - BLOCK
      ?auto_467991 - BLOCK
    )
    :vars
    (
      ?auto_467992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_467991 ?auto_467992 ) ( ON-TABLE ?auto_467979 ) ( ON ?auto_467980 ?auto_467979 ) ( ON ?auto_467981 ?auto_467980 ) ( ON ?auto_467982 ?auto_467981 ) ( ON ?auto_467983 ?auto_467982 ) ( ON ?auto_467984 ?auto_467983 ) ( ON ?auto_467985 ?auto_467984 ) ( not ( = ?auto_467979 ?auto_467980 ) ) ( not ( = ?auto_467979 ?auto_467981 ) ) ( not ( = ?auto_467979 ?auto_467982 ) ) ( not ( = ?auto_467979 ?auto_467983 ) ) ( not ( = ?auto_467979 ?auto_467984 ) ) ( not ( = ?auto_467979 ?auto_467985 ) ) ( not ( = ?auto_467979 ?auto_467986 ) ) ( not ( = ?auto_467979 ?auto_467987 ) ) ( not ( = ?auto_467979 ?auto_467988 ) ) ( not ( = ?auto_467979 ?auto_467989 ) ) ( not ( = ?auto_467979 ?auto_467990 ) ) ( not ( = ?auto_467979 ?auto_467991 ) ) ( not ( = ?auto_467979 ?auto_467992 ) ) ( not ( = ?auto_467980 ?auto_467981 ) ) ( not ( = ?auto_467980 ?auto_467982 ) ) ( not ( = ?auto_467980 ?auto_467983 ) ) ( not ( = ?auto_467980 ?auto_467984 ) ) ( not ( = ?auto_467980 ?auto_467985 ) ) ( not ( = ?auto_467980 ?auto_467986 ) ) ( not ( = ?auto_467980 ?auto_467987 ) ) ( not ( = ?auto_467980 ?auto_467988 ) ) ( not ( = ?auto_467980 ?auto_467989 ) ) ( not ( = ?auto_467980 ?auto_467990 ) ) ( not ( = ?auto_467980 ?auto_467991 ) ) ( not ( = ?auto_467980 ?auto_467992 ) ) ( not ( = ?auto_467981 ?auto_467982 ) ) ( not ( = ?auto_467981 ?auto_467983 ) ) ( not ( = ?auto_467981 ?auto_467984 ) ) ( not ( = ?auto_467981 ?auto_467985 ) ) ( not ( = ?auto_467981 ?auto_467986 ) ) ( not ( = ?auto_467981 ?auto_467987 ) ) ( not ( = ?auto_467981 ?auto_467988 ) ) ( not ( = ?auto_467981 ?auto_467989 ) ) ( not ( = ?auto_467981 ?auto_467990 ) ) ( not ( = ?auto_467981 ?auto_467991 ) ) ( not ( = ?auto_467981 ?auto_467992 ) ) ( not ( = ?auto_467982 ?auto_467983 ) ) ( not ( = ?auto_467982 ?auto_467984 ) ) ( not ( = ?auto_467982 ?auto_467985 ) ) ( not ( = ?auto_467982 ?auto_467986 ) ) ( not ( = ?auto_467982 ?auto_467987 ) ) ( not ( = ?auto_467982 ?auto_467988 ) ) ( not ( = ?auto_467982 ?auto_467989 ) ) ( not ( = ?auto_467982 ?auto_467990 ) ) ( not ( = ?auto_467982 ?auto_467991 ) ) ( not ( = ?auto_467982 ?auto_467992 ) ) ( not ( = ?auto_467983 ?auto_467984 ) ) ( not ( = ?auto_467983 ?auto_467985 ) ) ( not ( = ?auto_467983 ?auto_467986 ) ) ( not ( = ?auto_467983 ?auto_467987 ) ) ( not ( = ?auto_467983 ?auto_467988 ) ) ( not ( = ?auto_467983 ?auto_467989 ) ) ( not ( = ?auto_467983 ?auto_467990 ) ) ( not ( = ?auto_467983 ?auto_467991 ) ) ( not ( = ?auto_467983 ?auto_467992 ) ) ( not ( = ?auto_467984 ?auto_467985 ) ) ( not ( = ?auto_467984 ?auto_467986 ) ) ( not ( = ?auto_467984 ?auto_467987 ) ) ( not ( = ?auto_467984 ?auto_467988 ) ) ( not ( = ?auto_467984 ?auto_467989 ) ) ( not ( = ?auto_467984 ?auto_467990 ) ) ( not ( = ?auto_467984 ?auto_467991 ) ) ( not ( = ?auto_467984 ?auto_467992 ) ) ( not ( = ?auto_467985 ?auto_467986 ) ) ( not ( = ?auto_467985 ?auto_467987 ) ) ( not ( = ?auto_467985 ?auto_467988 ) ) ( not ( = ?auto_467985 ?auto_467989 ) ) ( not ( = ?auto_467985 ?auto_467990 ) ) ( not ( = ?auto_467985 ?auto_467991 ) ) ( not ( = ?auto_467985 ?auto_467992 ) ) ( not ( = ?auto_467986 ?auto_467987 ) ) ( not ( = ?auto_467986 ?auto_467988 ) ) ( not ( = ?auto_467986 ?auto_467989 ) ) ( not ( = ?auto_467986 ?auto_467990 ) ) ( not ( = ?auto_467986 ?auto_467991 ) ) ( not ( = ?auto_467986 ?auto_467992 ) ) ( not ( = ?auto_467987 ?auto_467988 ) ) ( not ( = ?auto_467987 ?auto_467989 ) ) ( not ( = ?auto_467987 ?auto_467990 ) ) ( not ( = ?auto_467987 ?auto_467991 ) ) ( not ( = ?auto_467987 ?auto_467992 ) ) ( not ( = ?auto_467988 ?auto_467989 ) ) ( not ( = ?auto_467988 ?auto_467990 ) ) ( not ( = ?auto_467988 ?auto_467991 ) ) ( not ( = ?auto_467988 ?auto_467992 ) ) ( not ( = ?auto_467989 ?auto_467990 ) ) ( not ( = ?auto_467989 ?auto_467991 ) ) ( not ( = ?auto_467989 ?auto_467992 ) ) ( not ( = ?auto_467990 ?auto_467991 ) ) ( not ( = ?auto_467990 ?auto_467992 ) ) ( not ( = ?auto_467991 ?auto_467992 ) ) ( ON ?auto_467990 ?auto_467991 ) ( ON ?auto_467989 ?auto_467990 ) ( ON ?auto_467988 ?auto_467989 ) ( ON ?auto_467987 ?auto_467988 ) ( CLEAR ?auto_467985 ) ( ON ?auto_467986 ?auto_467987 ) ( CLEAR ?auto_467986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_467979 ?auto_467980 ?auto_467981 ?auto_467982 ?auto_467983 ?auto_467984 ?auto_467985 ?auto_467986 )
      ( MAKE-13PILE ?auto_467979 ?auto_467980 ?auto_467981 ?auto_467982 ?auto_467983 ?auto_467984 ?auto_467985 ?auto_467986 ?auto_467987 ?auto_467988 ?auto_467989 ?auto_467990 ?auto_467991 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_468033 - BLOCK
      ?auto_468034 - BLOCK
      ?auto_468035 - BLOCK
      ?auto_468036 - BLOCK
      ?auto_468037 - BLOCK
      ?auto_468038 - BLOCK
      ?auto_468039 - BLOCK
      ?auto_468040 - BLOCK
      ?auto_468041 - BLOCK
      ?auto_468042 - BLOCK
      ?auto_468043 - BLOCK
      ?auto_468044 - BLOCK
      ?auto_468045 - BLOCK
    )
    :vars
    (
      ?auto_468046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468045 ?auto_468046 ) ( ON-TABLE ?auto_468033 ) ( ON ?auto_468034 ?auto_468033 ) ( ON ?auto_468035 ?auto_468034 ) ( ON ?auto_468036 ?auto_468035 ) ( ON ?auto_468037 ?auto_468036 ) ( ON ?auto_468038 ?auto_468037 ) ( not ( = ?auto_468033 ?auto_468034 ) ) ( not ( = ?auto_468033 ?auto_468035 ) ) ( not ( = ?auto_468033 ?auto_468036 ) ) ( not ( = ?auto_468033 ?auto_468037 ) ) ( not ( = ?auto_468033 ?auto_468038 ) ) ( not ( = ?auto_468033 ?auto_468039 ) ) ( not ( = ?auto_468033 ?auto_468040 ) ) ( not ( = ?auto_468033 ?auto_468041 ) ) ( not ( = ?auto_468033 ?auto_468042 ) ) ( not ( = ?auto_468033 ?auto_468043 ) ) ( not ( = ?auto_468033 ?auto_468044 ) ) ( not ( = ?auto_468033 ?auto_468045 ) ) ( not ( = ?auto_468033 ?auto_468046 ) ) ( not ( = ?auto_468034 ?auto_468035 ) ) ( not ( = ?auto_468034 ?auto_468036 ) ) ( not ( = ?auto_468034 ?auto_468037 ) ) ( not ( = ?auto_468034 ?auto_468038 ) ) ( not ( = ?auto_468034 ?auto_468039 ) ) ( not ( = ?auto_468034 ?auto_468040 ) ) ( not ( = ?auto_468034 ?auto_468041 ) ) ( not ( = ?auto_468034 ?auto_468042 ) ) ( not ( = ?auto_468034 ?auto_468043 ) ) ( not ( = ?auto_468034 ?auto_468044 ) ) ( not ( = ?auto_468034 ?auto_468045 ) ) ( not ( = ?auto_468034 ?auto_468046 ) ) ( not ( = ?auto_468035 ?auto_468036 ) ) ( not ( = ?auto_468035 ?auto_468037 ) ) ( not ( = ?auto_468035 ?auto_468038 ) ) ( not ( = ?auto_468035 ?auto_468039 ) ) ( not ( = ?auto_468035 ?auto_468040 ) ) ( not ( = ?auto_468035 ?auto_468041 ) ) ( not ( = ?auto_468035 ?auto_468042 ) ) ( not ( = ?auto_468035 ?auto_468043 ) ) ( not ( = ?auto_468035 ?auto_468044 ) ) ( not ( = ?auto_468035 ?auto_468045 ) ) ( not ( = ?auto_468035 ?auto_468046 ) ) ( not ( = ?auto_468036 ?auto_468037 ) ) ( not ( = ?auto_468036 ?auto_468038 ) ) ( not ( = ?auto_468036 ?auto_468039 ) ) ( not ( = ?auto_468036 ?auto_468040 ) ) ( not ( = ?auto_468036 ?auto_468041 ) ) ( not ( = ?auto_468036 ?auto_468042 ) ) ( not ( = ?auto_468036 ?auto_468043 ) ) ( not ( = ?auto_468036 ?auto_468044 ) ) ( not ( = ?auto_468036 ?auto_468045 ) ) ( not ( = ?auto_468036 ?auto_468046 ) ) ( not ( = ?auto_468037 ?auto_468038 ) ) ( not ( = ?auto_468037 ?auto_468039 ) ) ( not ( = ?auto_468037 ?auto_468040 ) ) ( not ( = ?auto_468037 ?auto_468041 ) ) ( not ( = ?auto_468037 ?auto_468042 ) ) ( not ( = ?auto_468037 ?auto_468043 ) ) ( not ( = ?auto_468037 ?auto_468044 ) ) ( not ( = ?auto_468037 ?auto_468045 ) ) ( not ( = ?auto_468037 ?auto_468046 ) ) ( not ( = ?auto_468038 ?auto_468039 ) ) ( not ( = ?auto_468038 ?auto_468040 ) ) ( not ( = ?auto_468038 ?auto_468041 ) ) ( not ( = ?auto_468038 ?auto_468042 ) ) ( not ( = ?auto_468038 ?auto_468043 ) ) ( not ( = ?auto_468038 ?auto_468044 ) ) ( not ( = ?auto_468038 ?auto_468045 ) ) ( not ( = ?auto_468038 ?auto_468046 ) ) ( not ( = ?auto_468039 ?auto_468040 ) ) ( not ( = ?auto_468039 ?auto_468041 ) ) ( not ( = ?auto_468039 ?auto_468042 ) ) ( not ( = ?auto_468039 ?auto_468043 ) ) ( not ( = ?auto_468039 ?auto_468044 ) ) ( not ( = ?auto_468039 ?auto_468045 ) ) ( not ( = ?auto_468039 ?auto_468046 ) ) ( not ( = ?auto_468040 ?auto_468041 ) ) ( not ( = ?auto_468040 ?auto_468042 ) ) ( not ( = ?auto_468040 ?auto_468043 ) ) ( not ( = ?auto_468040 ?auto_468044 ) ) ( not ( = ?auto_468040 ?auto_468045 ) ) ( not ( = ?auto_468040 ?auto_468046 ) ) ( not ( = ?auto_468041 ?auto_468042 ) ) ( not ( = ?auto_468041 ?auto_468043 ) ) ( not ( = ?auto_468041 ?auto_468044 ) ) ( not ( = ?auto_468041 ?auto_468045 ) ) ( not ( = ?auto_468041 ?auto_468046 ) ) ( not ( = ?auto_468042 ?auto_468043 ) ) ( not ( = ?auto_468042 ?auto_468044 ) ) ( not ( = ?auto_468042 ?auto_468045 ) ) ( not ( = ?auto_468042 ?auto_468046 ) ) ( not ( = ?auto_468043 ?auto_468044 ) ) ( not ( = ?auto_468043 ?auto_468045 ) ) ( not ( = ?auto_468043 ?auto_468046 ) ) ( not ( = ?auto_468044 ?auto_468045 ) ) ( not ( = ?auto_468044 ?auto_468046 ) ) ( not ( = ?auto_468045 ?auto_468046 ) ) ( ON ?auto_468044 ?auto_468045 ) ( ON ?auto_468043 ?auto_468044 ) ( ON ?auto_468042 ?auto_468043 ) ( ON ?auto_468041 ?auto_468042 ) ( ON ?auto_468040 ?auto_468041 ) ( CLEAR ?auto_468038 ) ( ON ?auto_468039 ?auto_468040 ) ( CLEAR ?auto_468039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_468033 ?auto_468034 ?auto_468035 ?auto_468036 ?auto_468037 ?auto_468038 ?auto_468039 )
      ( MAKE-13PILE ?auto_468033 ?auto_468034 ?auto_468035 ?auto_468036 ?auto_468037 ?auto_468038 ?auto_468039 ?auto_468040 ?auto_468041 ?auto_468042 ?auto_468043 ?auto_468044 ?auto_468045 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_468087 - BLOCK
      ?auto_468088 - BLOCK
      ?auto_468089 - BLOCK
      ?auto_468090 - BLOCK
      ?auto_468091 - BLOCK
      ?auto_468092 - BLOCK
      ?auto_468093 - BLOCK
      ?auto_468094 - BLOCK
      ?auto_468095 - BLOCK
      ?auto_468096 - BLOCK
      ?auto_468097 - BLOCK
      ?auto_468098 - BLOCK
      ?auto_468099 - BLOCK
    )
    :vars
    (
      ?auto_468100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468099 ?auto_468100 ) ( ON-TABLE ?auto_468087 ) ( ON ?auto_468088 ?auto_468087 ) ( ON ?auto_468089 ?auto_468088 ) ( ON ?auto_468090 ?auto_468089 ) ( ON ?auto_468091 ?auto_468090 ) ( not ( = ?auto_468087 ?auto_468088 ) ) ( not ( = ?auto_468087 ?auto_468089 ) ) ( not ( = ?auto_468087 ?auto_468090 ) ) ( not ( = ?auto_468087 ?auto_468091 ) ) ( not ( = ?auto_468087 ?auto_468092 ) ) ( not ( = ?auto_468087 ?auto_468093 ) ) ( not ( = ?auto_468087 ?auto_468094 ) ) ( not ( = ?auto_468087 ?auto_468095 ) ) ( not ( = ?auto_468087 ?auto_468096 ) ) ( not ( = ?auto_468087 ?auto_468097 ) ) ( not ( = ?auto_468087 ?auto_468098 ) ) ( not ( = ?auto_468087 ?auto_468099 ) ) ( not ( = ?auto_468087 ?auto_468100 ) ) ( not ( = ?auto_468088 ?auto_468089 ) ) ( not ( = ?auto_468088 ?auto_468090 ) ) ( not ( = ?auto_468088 ?auto_468091 ) ) ( not ( = ?auto_468088 ?auto_468092 ) ) ( not ( = ?auto_468088 ?auto_468093 ) ) ( not ( = ?auto_468088 ?auto_468094 ) ) ( not ( = ?auto_468088 ?auto_468095 ) ) ( not ( = ?auto_468088 ?auto_468096 ) ) ( not ( = ?auto_468088 ?auto_468097 ) ) ( not ( = ?auto_468088 ?auto_468098 ) ) ( not ( = ?auto_468088 ?auto_468099 ) ) ( not ( = ?auto_468088 ?auto_468100 ) ) ( not ( = ?auto_468089 ?auto_468090 ) ) ( not ( = ?auto_468089 ?auto_468091 ) ) ( not ( = ?auto_468089 ?auto_468092 ) ) ( not ( = ?auto_468089 ?auto_468093 ) ) ( not ( = ?auto_468089 ?auto_468094 ) ) ( not ( = ?auto_468089 ?auto_468095 ) ) ( not ( = ?auto_468089 ?auto_468096 ) ) ( not ( = ?auto_468089 ?auto_468097 ) ) ( not ( = ?auto_468089 ?auto_468098 ) ) ( not ( = ?auto_468089 ?auto_468099 ) ) ( not ( = ?auto_468089 ?auto_468100 ) ) ( not ( = ?auto_468090 ?auto_468091 ) ) ( not ( = ?auto_468090 ?auto_468092 ) ) ( not ( = ?auto_468090 ?auto_468093 ) ) ( not ( = ?auto_468090 ?auto_468094 ) ) ( not ( = ?auto_468090 ?auto_468095 ) ) ( not ( = ?auto_468090 ?auto_468096 ) ) ( not ( = ?auto_468090 ?auto_468097 ) ) ( not ( = ?auto_468090 ?auto_468098 ) ) ( not ( = ?auto_468090 ?auto_468099 ) ) ( not ( = ?auto_468090 ?auto_468100 ) ) ( not ( = ?auto_468091 ?auto_468092 ) ) ( not ( = ?auto_468091 ?auto_468093 ) ) ( not ( = ?auto_468091 ?auto_468094 ) ) ( not ( = ?auto_468091 ?auto_468095 ) ) ( not ( = ?auto_468091 ?auto_468096 ) ) ( not ( = ?auto_468091 ?auto_468097 ) ) ( not ( = ?auto_468091 ?auto_468098 ) ) ( not ( = ?auto_468091 ?auto_468099 ) ) ( not ( = ?auto_468091 ?auto_468100 ) ) ( not ( = ?auto_468092 ?auto_468093 ) ) ( not ( = ?auto_468092 ?auto_468094 ) ) ( not ( = ?auto_468092 ?auto_468095 ) ) ( not ( = ?auto_468092 ?auto_468096 ) ) ( not ( = ?auto_468092 ?auto_468097 ) ) ( not ( = ?auto_468092 ?auto_468098 ) ) ( not ( = ?auto_468092 ?auto_468099 ) ) ( not ( = ?auto_468092 ?auto_468100 ) ) ( not ( = ?auto_468093 ?auto_468094 ) ) ( not ( = ?auto_468093 ?auto_468095 ) ) ( not ( = ?auto_468093 ?auto_468096 ) ) ( not ( = ?auto_468093 ?auto_468097 ) ) ( not ( = ?auto_468093 ?auto_468098 ) ) ( not ( = ?auto_468093 ?auto_468099 ) ) ( not ( = ?auto_468093 ?auto_468100 ) ) ( not ( = ?auto_468094 ?auto_468095 ) ) ( not ( = ?auto_468094 ?auto_468096 ) ) ( not ( = ?auto_468094 ?auto_468097 ) ) ( not ( = ?auto_468094 ?auto_468098 ) ) ( not ( = ?auto_468094 ?auto_468099 ) ) ( not ( = ?auto_468094 ?auto_468100 ) ) ( not ( = ?auto_468095 ?auto_468096 ) ) ( not ( = ?auto_468095 ?auto_468097 ) ) ( not ( = ?auto_468095 ?auto_468098 ) ) ( not ( = ?auto_468095 ?auto_468099 ) ) ( not ( = ?auto_468095 ?auto_468100 ) ) ( not ( = ?auto_468096 ?auto_468097 ) ) ( not ( = ?auto_468096 ?auto_468098 ) ) ( not ( = ?auto_468096 ?auto_468099 ) ) ( not ( = ?auto_468096 ?auto_468100 ) ) ( not ( = ?auto_468097 ?auto_468098 ) ) ( not ( = ?auto_468097 ?auto_468099 ) ) ( not ( = ?auto_468097 ?auto_468100 ) ) ( not ( = ?auto_468098 ?auto_468099 ) ) ( not ( = ?auto_468098 ?auto_468100 ) ) ( not ( = ?auto_468099 ?auto_468100 ) ) ( ON ?auto_468098 ?auto_468099 ) ( ON ?auto_468097 ?auto_468098 ) ( ON ?auto_468096 ?auto_468097 ) ( ON ?auto_468095 ?auto_468096 ) ( ON ?auto_468094 ?auto_468095 ) ( ON ?auto_468093 ?auto_468094 ) ( CLEAR ?auto_468091 ) ( ON ?auto_468092 ?auto_468093 ) ( CLEAR ?auto_468092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_468087 ?auto_468088 ?auto_468089 ?auto_468090 ?auto_468091 ?auto_468092 )
      ( MAKE-13PILE ?auto_468087 ?auto_468088 ?auto_468089 ?auto_468090 ?auto_468091 ?auto_468092 ?auto_468093 ?auto_468094 ?auto_468095 ?auto_468096 ?auto_468097 ?auto_468098 ?auto_468099 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_468141 - BLOCK
      ?auto_468142 - BLOCK
      ?auto_468143 - BLOCK
      ?auto_468144 - BLOCK
      ?auto_468145 - BLOCK
      ?auto_468146 - BLOCK
      ?auto_468147 - BLOCK
      ?auto_468148 - BLOCK
      ?auto_468149 - BLOCK
      ?auto_468150 - BLOCK
      ?auto_468151 - BLOCK
      ?auto_468152 - BLOCK
      ?auto_468153 - BLOCK
    )
    :vars
    (
      ?auto_468154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468153 ?auto_468154 ) ( ON-TABLE ?auto_468141 ) ( ON ?auto_468142 ?auto_468141 ) ( ON ?auto_468143 ?auto_468142 ) ( ON ?auto_468144 ?auto_468143 ) ( not ( = ?auto_468141 ?auto_468142 ) ) ( not ( = ?auto_468141 ?auto_468143 ) ) ( not ( = ?auto_468141 ?auto_468144 ) ) ( not ( = ?auto_468141 ?auto_468145 ) ) ( not ( = ?auto_468141 ?auto_468146 ) ) ( not ( = ?auto_468141 ?auto_468147 ) ) ( not ( = ?auto_468141 ?auto_468148 ) ) ( not ( = ?auto_468141 ?auto_468149 ) ) ( not ( = ?auto_468141 ?auto_468150 ) ) ( not ( = ?auto_468141 ?auto_468151 ) ) ( not ( = ?auto_468141 ?auto_468152 ) ) ( not ( = ?auto_468141 ?auto_468153 ) ) ( not ( = ?auto_468141 ?auto_468154 ) ) ( not ( = ?auto_468142 ?auto_468143 ) ) ( not ( = ?auto_468142 ?auto_468144 ) ) ( not ( = ?auto_468142 ?auto_468145 ) ) ( not ( = ?auto_468142 ?auto_468146 ) ) ( not ( = ?auto_468142 ?auto_468147 ) ) ( not ( = ?auto_468142 ?auto_468148 ) ) ( not ( = ?auto_468142 ?auto_468149 ) ) ( not ( = ?auto_468142 ?auto_468150 ) ) ( not ( = ?auto_468142 ?auto_468151 ) ) ( not ( = ?auto_468142 ?auto_468152 ) ) ( not ( = ?auto_468142 ?auto_468153 ) ) ( not ( = ?auto_468142 ?auto_468154 ) ) ( not ( = ?auto_468143 ?auto_468144 ) ) ( not ( = ?auto_468143 ?auto_468145 ) ) ( not ( = ?auto_468143 ?auto_468146 ) ) ( not ( = ?auto_468143 ?auto_468147 ) ) ( not ( = ?auto_468143 ?auto_468148 ) ) ( not ( = ?auto_468143 ?auto_468149 ) ) ( not ( = ?auto_468143 ?auto_468150 ) ) ( not ( = ?auto_468143 ?auto_468151 ) ) ( not ( = ?auto_468143 ?auto_468152 ) ) ( not ( = ?auto_468143 ?auto_468153 ) ) ( not ( = ?auto_468143 ?auto_468154 ) ) ( not ( = ?auto_468144 ?auto_468145 ) ) ( not ( = ?auto_468144 ?auto_468146 ) ) ( not ( = ?auto_468144 ?auto_468147 ) ) ( not ( = ?auto_468144 ?auto_468148 ) ) ( not ( = ?auto_468144 ?auto_468149 ) ) ( not ( = ?auto_468144 ?auto_468150 ) ) ( not ( = ?auto_468144 ?auto_468151 ) ) ( not ( = ?auto_468144 ?auto_468152 ) ) ( not ( = ?auto_468144 ?auto_468153 ) ) ( not ( = ?auto_468144 ?auto_468154 ) ) ( not ( = ?auto_468145 ?auto_468146 ) ) ( not ( = ?auto_468145 ?auto_468147 ) ) ( not ( = ?auto_468145 ?auto_468148 ) ) ( not ( = ?auto_468145 ?auto_468149 ) ) ( not ( = ?auto_468145 ?auto_468150 ) ) ( not ( = ?auto_468145 ?auto_468151 ) ) ( not ( = ?auto_468145 ?auto_468152 ) ) ( not ( = ?auto_468145 ?auto_468153 ) ) ( not ( = ?auto_468145 ?auto_468154 ) ) ( not ( = ?auto_468146 ?auto_468147 ) ) ( not ( = ?auto_468146 ?auto_468148 ) ) ( not ( = ?auto_468146 ?auto_468149 ) ) ( not ( = ?auto_468146 ?auto_468150 ) ) ( not ( = ?auto_468146 ?auto_468151 ) ) ( not ( = ?auto_468146 ?auto_468152 ) ) ( not ( = ?auto_468146 ?auto_468153 ) ) ( not ( = ?auto_468146 ?auto_468154 ) ) ( not ( = ?auto_468147 ?auto_468148 ) ) ( not ( = ?auto_468147 ?auto_468149 ) ) ( not ( = ?auto_468147 ?auto_468150 ) ) ( not ( = ?auto_468147 ?auto_468151 ) ) ( not ( = ?auto_468147 ?auto_468152 ) ) ( not ( = ?auto_468147 ?auto_468153 ) ) ( not ( = ?auto_468147 ?auto_468154 ) ) ( not ( = ?auto_468148 ?auto_468149 ) ) ( not ( = ?auto_468148 ?auto_468150 ) ) ( not ( = ?auto_468148 ?auto_468151 ) ) ( not ( = ?auto_468148 ?auto_468152 ) ) ( not ( = ?auto_468148 ?auto_468153 ) ) ( not ( = ?auto_468148 ?auto_468154 ) ) ( not ( = ?auto_468149 ?auto_468150 ) ) ( not ( = ?auto_468149 ?auto_468151 ) ) ( not ( = ?auto_468149 ?auto_468152 ) ) ( not ( = ?auto_468149 ?auto_468153 ) ) ( not ( = ?auto_468149 ?auto_468154 ) ) ( not ( = ?auto_468150 ?auto_468151 ) ) ( not ( = ?auto_468150 ?auto_468152 ) ) ( not ( = ?auto_468150 ?auto_468153 ) ) ( not ( = ?auto_468150 ?auto_468154 ) ) ( not ( = ?auto_468151 ?auto_468152 ) ) ( not ( = ?auto_468151 ?auto_468153 ) ) ( not ( = ?auto_468151 ?auto_468154 ) ) ( not ( = ?auto_468152 ?auto_468153 ) ) ( not ( = ?auto_468152 ?auto_468154 ) ) ( not ( = ?auto_468153 ?auto_468154 ) ) ( ON ?auto_468152 ?auto_468153 ) ( ON ?auto_468151 ?auto_468152 ) ( ON ?auto_468150 ?auto_468151 ) ( ON ?auto_468149 ?auto_468150 ) ( ON ?auto_468148 ?auto_468149 ) ( ON ?auto_468147 ?auto_468148 ) ( ON ?auto_468146 ?auto_468147 ) ( CLEAR ?auto_468144 ) ( ON ?auto_468145 ?auto_468146 ) ( CLEAR ?auto_468145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_468141 ?auto_468142 ?auto_468143 ?auto_468144 ?auto_468145 )
      ( MAKE-13PILE ?auto_468141 ?auto_468142 ?auto_468143 ?auto_468144 ?auto_468145 ?auto_468146 ?auto_468147 ?auto_468148 ?auto_468149 ?auto_468150 ?auto_468151 ?auto_468152 ?auto_468153 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_468195 - BLOCK
      ?auto_468196 - BLOCK
      ?auto_468197 - BLOCK
      ?auto_468198 - BLOCK
      ?auto_468199 - BLOCK
      ?auto_468200 - BLOCK
      ?auto_468201 - BLOCK
      ?auto_468202 - BLOCK
      ?auto_468203 - BLOCK
      ?auto_468204 - BLOCK
      ?auto_468205 - BLOCK
      ?auto_468206 - BLOCK
      ?auto_468207 - BLOCK
    )
    :vars
    (
      ?auto_468208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468207 ?auto_468208 ) ( ON-TABLE ?auto_468195 ) ( ON ?auto_468196 ?auto_468195 ) ( ON ?auto_468197 ?auto_468196 ) ( not ( = ?auto_468195 ?auto_468196 ) ) ( not ( = ?auto_468195 ?auto_468197 ) ) ( not ( = ?auto_468195 ?auto_468198 ) ) ( not ( = ?auto_468195 ?auto_468199 ) ) ( not ( = ?auto_468195 ?auto_468200 ) ) ( not ( = ?auto_468195 ?auto_468201 ) ) ( not ( = ?auto_468195 ?auto_468202 ) ) ( not ( = ?auto_468195 ?auto_468203 ) ) ( not ( = ?auto_468195 ?auto_468204 ) ) ( not ( = ?auto_468195 ?auto_468205 ) ) ( not ( = ?auto_468195 ?auto_468206 ) ) ( not ( = ?auto_468195 ?auto_468207 ) ) ( not ( = ?auto_468195 ?auto_468208 ) ) ( not ( = ?auto_468196 ?auto_468197 ) ) ( not ( = ?auto_468196 ?auto_468198 ) ) ( not ( = ?auto_468196 ?auto_468199 ) ) ( not ( = ?auto_468196 ?auto_468200 ) ) ( not ( = ?auto_468196 ?auto_468201 ) ) ( not ( = ?auto_468196 ?auto_468202 ) ) ( not ( = ?auto_468196 ?auto_468203 ) ) ( not ( = ?auto_468196 ?auto_468204 ) ) ( not ( = ?auto_468196 ?auto_468205 ) ) ( not ( = ?auto_468196 ?auto_468206 ) ) ( not ( = ?auto_468196 ?auto_468207 ) ) ( not ( = ?auto_468196 ?auto_468208 ) ) ( not ( = ?auto_468197 ?auto_468198 ) ) ( not ( = ?auto_468197 ?auto_468199 ) ) ( not ( = ?auto_468197 ?auto_468200 ) ) ( not ( = ?auto_468197 ?auto_468201 ) ) ( not ( = ?auto_468197 ?auto_468202 ) ) ( not ( = ?auto_468197 ?auto_468203 ) ) ( not ( = ?auto_468197 ?auto_468204 ) ) ( not ( = ?auto_468197 ?auto_468205 ) ) ( not ( = ?auto_468197 ?auto_468206 ) ) ( not ( = ?auto_468197 ?auto_468207 ) ) ( not ( = ?auto_468197 ?auto_468208 ) ) ( not ( = ?auto_468198 ?auto_468199 ) ) ( not ( = ?auto_468198 ?auto_468200 ) ) ( not ( = ?auto_468198 ?auto_468201 ) ) ( not ( = ?auto_468198 ?auto_468202 ) ) ( not ( = ?auto_468198 ?auto_468203 ) ) ( not ( = ?auto_468198 ?auto_468204 ) ) ( not ( = ?auto_468198 ?auto_468205 ) ) ( not ( = ?auto_468198 ?auto_468206 ) ) ( not ( = ?auto_468198 ?auto_468207 ) ) ( not ( = ?auto_468198 ?auto_468208 ) ) ( not ( = ?auto_468199 ?auto_468200 ) ) ( not ( = ?auto_468199 ?auto_468201 ) ) ( not ( = ?auto_468199 ?auto_468202 ) ) ( not ( = ?auto_468199 ?auto_468203 ) ) ( not ( = ?auto_468199 ?auto_468204 ) ) ( not ( = ?auto_468199 ?auto_468205 ) ) ( not ( = ?auto_468199 ?auto_468206 ) ) ( not ( = ?auto_468199 ?auto_468207 ) ) ( not ( = ?auto_468199 ?auto_468208 ) ) ( not ( = ?auto_468200 ?auto_468201 ) ) ( not ( = ?auto_468200 ?auto_468202 ) ) ( not ( = ?auto_468200 ?auto_468203 ) ) ( not ( = ?auto_468200 ?auto_468204 ) ) ( not ( = ?auto_468200 ?auto_468205 ) ) ( not ( = ?auto_468200 ?auto_468206 ) ) ( not ( = ?auto_468200 ?auto_468207 ) ) ( not ( = ?auto_468200 ?auto_468208 ) ) ( not ( = ?auto_468201 ?auto_468202 ) ) ( not ( = ?auto_468201 ?auto_468203 ) ) ( not ( = ?auto_468201 ?auto_468204 ) ) ( not ( = ?auto_468201 ?auto_468205 ) ) ( not ( = ?auto_468201 ?auto_468206 ) ) ( not ( = ?auto_468201 ?auto_468207 ) ) ( not ( = ?auto_468201 ?auto_468208 ) ) ( not ( = ?auto_468202 ?auto_468203 ) ) ( not ( = ?auto_468202 ?auto_468204 ) ) ( not ( = ?auto_468202 ?auto_468205 ) ) ( not ( = ?auto_468202 ?auto_468206 ) ) ( not ( = ?auto_468202 ?auto_468207 ) ) ( not ( = ?auto_468202 ?auto_468208 ) ) ( not ( = ?auto_468203 ?auto_468204 ) ) ( not ( = ?auto_468203 ?auto_468205 ) ) ( not ( = ?auto_468203 ?auto_468206 ) ) ( not ( = ?auto_468203 ?auto_468207 ) ) ( not ( = ?auto_468203 ?auto_468208 ) ) ( not ( = ?auto_468204 ?auto_468205 ) ) ( not ( = ?auto_468204 ?auto_468206 ) ) ( not ( = ?auto_468204 ?auto_468207 ) ) ( not ( = ?auto_468204 ?auto_468208 ) ) ( not ( = ?auto_468205 ?auto_468206 ) ) ( not ( = ?auto_468205 ?auto_468207 ) ) ( not ( = ?auto_468205 ?auto_468208 ) ) ( not ( = ?auto_468206 ?auto_468207 ) ) ( not ( = ?auto_468206 ?auto_468208 ) ) ( not ( = ?auto_468207 ?auto_468208 ) ) ( ON ?auto_468206 ?auto_468207 ) ( ON ?auto_468205 ?auto_468206 ) ( ON ?auto_468204 ?auto_468205 ) ( ON ?auto_468203 ?auto_468204 ) ( ON ?auto_468202 ?auto_468203 ) ( ON ?auto_468201 ?auto_468202 ) ( ON ?auto_468200 ?auto_468201 ) ( ON ?auto_468199 ?auto_468200 ) ( CLEAR ?auto_468197 ) ( ON ?auto_468198 ?auto_468199 ) ( CLEAR ?auto_468198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_468195 ?auto_468196 ?auto_468197 ?auto_468198 )
      ( MAKE-13PILE ?auto_468195 ?auto_468196 ?auto_468197 ?auto_468198 ?auto_468199 ?auto_468200 ?auto_468201 ?auto_468202 ?auto_468203 ?auto_468204 ?auto_468205 ?auto_468206 ?auto_468207 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_468249 - BLOCK
      ?auto_468250 - BLOCK
      ?auto_468251 - BLOCK
      ?auto_468252 - BLOCK
      ?auto_468253 - BLOCK
      ?auto_468254 - BLOCK
      ?auto_468255 - BLOCK
      ?auto_468256 - BLOCK
      ?auto_468257 - BLOCK
      ?auto_468258 - BLOCK
      ?auto_468259 - BLOCK
      ?auto_468260 - BLOCK
      ?auto_468261 - BLOCK
    )
    :vars
    (
      ?auto_468262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468261 ?auto_468262 ) ( ON-TABLE ?auto_468249 ) ( ON ?auto_468250 ?auto_468249 ) ( not ( = ?auto_468249 ?auto_468250 ) ) ( not ( = ?auto_468249 ?auto_468251 ) ) ( not ( = ?auto_468249 ?auto_468252 ) ) ( not ( = ?auto_468249 ?auto_468253 ) ) ( not ( = ?auto_468249 ?auto_468254 ) ) ( not ( = ?auto_468249 ?auto_468255 ) ) ( not ( = ?auto_468249 ?auto_468256 ) ) ( not ( = ?auto_468249 ?auto_468257 ) ) ( not ( = ?auto_468249 ?auto_468258 ) ) ( not ( = ?auto_468249 ?auto_468259 ) ) ( not ( = ?auto_468249 ?auto_468260 ) ) ( not ( = ?auto_468249 ?auto_468261 ) ) ( not ( = ?auto_468249 ?auto_468262 ) ) ( not ( = ?auto_468250 ?auto_468251 ) ) ( not ( = ?auto_468250 ?auto_468252 ) ) ( not ( = ?auto_468250 ?auto_468253 ) ) ( not ( = ?auto_468250 ?auto_468254 ) ) ( not ( = ?auto_468250 ?auto_468255 ) ) ( not ( = ?auto_468250 ?auto_468256 ) ) ( not ( = ?auto_468250 ?auto_468257 ) ) ( not ( = ?auto_468250 ?auto_468258 ) ) ( not ( = ?auto_468250 ?auto_468259 ) ) ( not ( = ?auto_468250 ?auto_468260 ) ) ( not ( = ?auto_468250 ?auto_468261 ) ) ( not ( = ?auto_468250 ?auto_468262 ) ) ( not ( = ?auto_468251 ?auto_468252 ) ) ( not ( = ?auto_468251 ?auto_468253 ) ) ( not ( = ?auto_468251 ?auto_468254 ) ) ( not ( = ?auto_468251 ?auto_468255 ) ) ( not ( = ?auto_468251 ?auto_468256 ) ) ( not ( = ?auto_468251 ?auto_468257 ) ) ( not ( = ?auto_468251 ?auto_468258 ) ) ( not ( = ?auto_468251 ?auto_468259 ) ) ( not ( = ?auto_468251 ?auto_468260 ) ) ( not ( = ?auto_468251 ?auto_468261 ) ) ( not ( = ?auto_468251 ?auto_468262 ) ) ( not ( = ?auto_468252 ?auto_468253 ) ) ( not ( = ?auto_468252 ?auto_468254 ) ) ( not ( = ?auto_468252 ?auto_468255 ) ) ( not ( = ?auto_468252 ?auto_468256 ) ) ( not ( = ?auto_468252 ?auto_468257 ) ) ( not ( = ?auto_468252 ?auto_468258 ) ) ( not ( = ?auto_468252 ?auto_468259 ) ) ( not ( = ?auto_468252 ?auto_468260 ) ) ( not ( = ?auto_468252 ?auto_468261 ) ) ( not ( = ?auto_468252 ?auto_468262 ) ) ( not ( = ?auto_468253 ?auto_468254 ) ) ( not ( = ?auto_468253 ?auto_468255 ) ) ( not ( = ?auto_468253 ?auto_468256 ) ) ( not ( = ?auto_468253 ?auto_468257 ) ) ( not ( = ?auto_468253 ?auto_468258 ) ) ( not ( = ?auto_468253 ?auto_468259 ) ) ( not ( = ?auto_468253 ?auto_468260 ) ) ( not ( = ?auto_468253 ?auto_468261 ) ) ( not ( = ?auto_468253 ?auto_468262 ) ) ( not ( = ?auto_468254 ?auto_468255 ) ) ( not ( = ?auto_468254 ?auto_468256 ) ) ( not ( = ?auto_468254 ?auto_468257 ) ) ( not ( = ?auto_468254 ?auto_468258 ) ) ( not ( = ?auto_468254 ?auto_468259 ) ) ( not ( = ?auto_468254 ?auto_468260 ) ) ( not ( = ?auto_468254 ?auto_468261 ) ) ( not ( = ?auto_468254 ?auto_468262 ) ) ( not ( = ?auto_468255 ?auto_468256 ) ) ( not ( = ?auto_468255 ?auto_468257 ) ) ( not ( = ?auto_468255 ?auto_468258 ) ) ( not ( = ?auto_468255 ?auto_468259 ) ) ( not ( = ?auto_468255 ?auto_468260 ) ) ( not ( = ?auto_468255 ?auto_468261 ) ) ( not ( = ?auto_468255 ?auto_468262 ) ) ( not ( = ?auto_468256 ?auto_468257 ) ) ( not ( = ?auto_468256 ?auto_468258 ) ) ( not ( = ?auto_468256 ?auto_468259 ) ) ( not ( = ?auto_468256 ?auto_468260 ) ) ( not ( = ?auto_468256 ?auto_468261 ) ) ( not ( = ?auto_468256 ?auto_468262 ) ) ( not ( = ?auto_468257 ?auto_468258 ) ) ( not ( = ?auto_468257 ?auto_468259 ) ) ( not ( = ?auto_468257 ?auto_468260 ) ) ( not ( = ?auto_468257 ?auto_468261 ) ) ( not ( = ?auto_468257 ?auto_468262 ) ) ( not ( = ?auto_468258 ?auto_468259 ) ) ( not ( = ?auto_468258 ?auto_468260 ) ) ( not ( = ?auto_468258 ?auto_468261 ) ) ( not ( = ?auto_468258 ?auto_468262 ) ) ( not ( = ?auto_468259 ?auto_468260 ) ) ( not ( = ?auto_468259 ?auto_468261 ) ) ( not ( = ?auto_468259 ?auto_468262 ) ) ( not ( = ?auto_468260 ?auto_468261 ) ) ( not ( = ?auto_468260 ?auto_468262 ) ) ( not ( = ?auto_468261 ?auto_468262 ) ) ( ON ?auto_468260 ?auto_468261 ) ( ON ?auto_468259 ?auto_468260 ) ( ON ?auto_468258 ?auto_468259 ) ( ON ?auto_468257 ?auto_468258 ) ( ON ?auto_468256 ?auto_468257 ) ( ON ?auto_468255 ?auto_468256 ) ( ON ?auto_468254 ?auto_468255 ) ( ON ?auto_468253 ?auto_468254 ) ( ON ?auto_468252 ?auto_468253 ) ( CLEAR ?auto_468250 ) ( ON ?auto_468251 ?auto_468252 ) ( CLEAR ?auto_468251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_468249 ?auto_468250 ?auto_468251 )
      ( MAKE-13PILE ?auto_468249 ?auto_468250 ?auto_468251 ?auto_468252 ?auto_468253 ?auto_468254 ?auto_468255 ?auto_468256 ?auto_468257 ?auto_468258 ?auto_468259 ?auto_468260 ?auto_468261 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_468303 - BLOCK
      ?auto_468304 - BLOCK
      ?auto_468305 - BLOCK
      ?auto_468306 - BLOCK
      ?auto_468307 - BLOCK
      ?auto_468308 - BLOCK
      ?auto_468309 - BLOCK
      ?auto_468310 - BLOCK
      ?auto_468311 - BLOCK
      ?auto_468312 - BLOCK
      ?auto_468313 - BLOCK
      ?auto_468314 - BLOCK
      ?auto_468315 - BLOCK
    )
    :vars
    (
      ?auto_468316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468315 ?auto_468316 ) ( ON-TABLE ?auto_468303 ) ( not ( = ?auto_468303 ?auto_468304 ) ) ( not ( = ?auto_468303 ?auto_468305 ) ) ( not ( = ?auto_468303 ?auto_468306 ) ) ( not ( = ?auto_468303 ?auto_468307 ) ) ( not ( = ?auto_468303 ?auto_468308 ) ) ( not ( = ?auto_468303 ?auto_468309 ) ) ( not ( = ?auto_468303 ?auto_468310 ) ) ( not ( = ?auto_468303 ?auto_468311 ) ) ( not ( = ?auto_468303 ?auto_468312 ) ) ( not ( = ?auto_468303 ?auto_468313 ) ) ( not ( = ?auto_468303 ?auto_468314 ) ) ( not ( = ?auto_468303 ?auto_468315 ) ) ( not ( = ?auto_468303 ?auto_468316 ) ) ( not ( = ?auto_468304 ?auto_468305 ) ) ( not ( = ?auto_468304 ?auto_468306 ) ) ( not ( = ?auto_468304 ?auto_468307 ) ) ( not ( = ?auto_468304 ?auto_468308 ) ) ( not ( = ?auto_468304 ?auto_468309 ) ) ( not ( = ?auto_468304 ?auto_468310 ) ) ( not ( = ?auto_468304 ?auto_468311 ) ) ( not ( = ?auto_468304 ?auto_468312 ) ) ( not ( = ?auto_468304 ?auto_468313 ) ) ( not ( = ?auto_468304 ?auto_468314 ) ) ( not ( = ?auto_468304 ?auto_468315 ) ) ( not ( = ?auto_468304 ?auto_468316 ) ) ( not ( = ?auto_468305 ?auto_468306 ) ) ( not ( = ?auto_468305 ?auto_468307 ) ) ( not ( = ?auto_468305 ?auto_468308 ) ) ( not ( = ?auto_468305 ?auto_468309 ) ) ( not ( = ?auto_468305 ?auto_468310 ) ) ( not ( = ?auto_468305 ?auto_468311 ) ) ( not ( = ?auto_468305 ?auto_468312 ) ) ( not ( = ?auto_468305 ?auto_468313 ) ) ( not ( = ?auto_468305 ?auto_468314 ) ) ( not ( = ?auto_468305 ?auto_468315 ) ) ( not ( = ?auto_468305 ?auto_468316 ) ) ( not ( = ?auto_468306 ?auto_468307 ) ) ( not ( = ?auto_468306 ?auto_468308 ) ) ( not ( = ?auto_468306 ?auto_468309 ) ) ( not ( = ?auto_468306 ?auto_468310 ) ) ( not ( = ?auto_468306 ?auto_468311 ) ) ( not ( = ?auto_468306 ?auto_468312 ) ) ( not ( = ?auto_468306 ?auto_468313 ) ) ( not ( = ?auto_468306 ?auto_468314 ) ) ( not ( = ?auto_468306 ?auto_468315 ) ) ( not ( = ?auto_468306 ?auto_468316 ) ) ( not ( = ?auto_468307 ?auto_468308 ) ) ( not ( = ?auto_468307 ?auto_468309 ) ) ( not ( = ?auto_468307 ?auto_468310 ) ) ( not ( = ?auto_468307 ?auto_468311 ) ) ( not ( = ?auto_468307 ?auto_468312 ) ) ( not ( = ?auto_468307 ?auto_468313 ) ) ( not ( = ?auto_468307 ?auto_468314 ) ) ( not ( = ?auto_468307 ?auto_468315 ) ) ( not ( = ?auto_468307 ?auto_468316 ) ) ( not ( = ?auto_468308 ?auto_468309 ) ) ( not ( = ?auto_468308 ?auto_468310 ) ) ( not ( = ?auto_468308 ?auto_468311 ) ) ( not ( = ?auto_468308 ?auto_468312 ) ) ( not ( = ?auto_468308 ?auto_468313 ) ) ( not ( = ?auto_468308 ?auto_468314 ) ) ( not ( = ?auto_468308 ?auto_468315 ) ) ( not ( = ?auto_468308 ?auto_468316 ) ) ( not ( = ?auto_468309 ?auto_468310 ) ) ( not ( = ?auto_468309 ?auto_468311 ) ) ( not ( = ?auto_468309 ?auto_468312 ) ) ( not ( = ?auto_468309 ?auto_468313 ) ) ( not ( = ?auto_468309 ?auto_468314 ) ) ( not ( = ?auto_468309 ?auto_468315 ) ) ( not ( = ?auto_468309 ?auto_468316 ) ) ( not ( = ?auto_468310 ?auto_468311 ) ) ( not ( = ?auto_468310 ?auto_468312 ) ) ( not ( = ?auto_468310 ?auto_468313 ) ) ( not ( = ?auto_468310 ?auto_468314 ) ) ( not ( = ?auto_468310 ?auto_468315 ) ) ( not ( = ?auto_468310 ?auto_468316 ) ) ( not ( = ?auto_468311 ?auto_468312 ) ) ( not ( = ?auto_468311 ?auto_468313 ) ) ( not ( = ?auto_468311 ?auto_468314 ) ) ( not ( = ?auto_468311 ?auto_468315 ) ) ( not ( = ?auto_468311 ?auto_468316 ) ) ( not ( = ?auto_468312 ?auto_468313 ) ) ( not ( = ?auto_468312 ?auto_468314 ) ) ( not ( = ?auto_468312 ?auto_468315 ) ) ( not ( = ?auto_468312 ?auto_468316 ) ) ( not ( = ?auto_468313 ?auto_468314 ) ) ( not ( = ?auto_468313 ?auto_468315 ) ) ( not ( = ?auto_468313 ?auto_468316 ) ) ( not ( = ?auto_468314 ?auto_468315 ) ) ( not ( = ?auto_468314 ?auto_468316 ) ) ( not ( = ?auto_468315 ?auto_468316 ) ) ( ON ?auto_468314 ?auto_468315 ) ( ON ?auto_468313 ?auto_468314 ) ( ON ?auto_468312 ?auto_468313 ) ( ON ?auto_468311 ?auto_468312 ) ( ON ?auto_468310 ?auto_468311 ) ( ON ?auto_468309 ?auto_468310 ) ( ON ?auto_468308 ?auto_468309 ) ( ON ?auto_468307 ?auto_468308 ) ( ON ?auto_468306 ?auto_468307 ) ( ON ?auto_468305 ?auto_468306 ) ( CLEAR ?auto_468303 ) ( ON ?auto_468304 ?auto_468305 ) ( CLEAR ?auto_468304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_468303 ?auto_468304 )
      ( MAKE-13PILE ?auto_468303 ?auto_468304 ?auto_468305 ?auto_468306 ?auto_468307 ?auto_468308 ?auto_468309 ?auto_468310 ?auto_468311 ?auto_468312 ?auto_468313 ?auto_468314 ?auto_468315 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_468357 - BLOCK
      ?auto_468358 - BLOCK
      ?auto_468359 - BLOCK
      ?auto_468360 - BLOCK
      ?auto_468361 - BLOCK
      ?auto_468362 - BLOCK
      ?auto_468363 - BLOCK
      ?auto_468364 - BLOCK
      ?auto_468365 - BLOCK
      ?auto_468366 - BLOCK
      ?auto_468367 - BLOCK
      ?auto_468368 - BLOCK
      ?auto_468369 - BLOCK
    )
    :vars
    (
      ?auto_468370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468369 ?auto_468370 ) ( not ( = ?auto_468357 ?auto_468358 ) ) ( not ( = ?auto_468357 ?auto_468359 ) ) ( not ( = ?auto_468357 ?auto_468360 ) ) ( not ( = ?auto_468357 ?auto_468361 ) ) ( not ( = ?auto_468357 ?auto_468362 ) ) ( not ( = ?auto_468357 ?auto_468363 ) ) ( not ( = ?auto_468357 ?auto_468364 ) ) ( not ( = ?auto_468357 ?auto_468365 ) ) ( not ( = ?auto_468357 ?auto_468366 ) ) ( not ( = ?auto_468357 ?auto_468367 ) ) ( not ( = ?auto_468357 ?auto_468368 ) ) ( not ( = ?auto_468357 ?auto_468369 ) ) ( not ( = ?auto_468357 ?auto_468370 ) ) ( not ( = ?auto_468358 ?auto_468359 ) ) ( not ( = ?auto_468358 ?auto_468360 ) ) ( not ( = ?auto_468358 ?auto_468361 ) ) ( not ( = ?auto_468358 ?auto_468362 ) ) ( not ( = ?auto_468358 ?auto_468363 ) ) ( not ( = ?auto_468358 ?auto_468364 ) ) ( not ( = ?auto_468358 ?auto_468365 ) ) ( not ( = ?auto_468358 ?auto_468366 ) ) ( not ( = ?auto_468358 ?auto_468367 ) ) ( not ( = ?auto_468358 ?auto_468368 ) ) ( not ( = ?auto_468358 ?auto_468369 ) ) ( not ( = ?auto_468358 ?auto_468370 ) ) ( not ( = ?auto_468359 ?auto_468360 ) ) ( not ( = ?auto_468359 ?auto_468361 ) ) ( not ( = ?auto_468359 ?auto_468362 ) ) ( not ( = ?auto_468359 ?auto_468363 ) ) ( not ( = ?auto_468359 ?auto_468364 ) ) ( not ( = ?auto_468359 ?auto_468365 ) ) ( not ( = ?auto_468359 ?auto_468366 ) ) ( not ( = ?auto_468359 ?auto_468367 ) ) ( not ( = ?auto_468359 ?auto_468368 ) ) ( not ( = ?auto_468359 ?auto_468369 ) ) ( not ( = ?auto_468359 ?auto_468370 ) ) ( not ( = ?auto_468360 ?auto_468361 ) ) ( not ( = ?auto_468360 ?auto_468362 ) ) ( not ( = ?auto_468360 ?auto_468363 ) ) ( not ( = ?auto_468360 ?auto_468364 ) ) ( not ( = ?auto_468360 ?auto_468365 ) ) ( not ( = ?auto_468360 ?auto_468366 ) ) ( not ( = ?auto_468360 ?auto_468367 ) ) ( not ( = ?auto_468360 ?auto_468368 ) ) ( not ( = ?auto_468360 ?auto_468369 ) ) ( not ( = ?auto_468360 ?auto_468370 ) ) ( not ( = ?auto_468361 ?auto_468362 ) ) ( not ( = ?auto_468361 ?auto_468363 ) ) ( not ( = ?auto_468361 ?auto_468364 ) ) ( not ( = ?auto_468361 ?auto_468365 ) ) ( not ( = ?auto_468361 ?auto_468366 ) ) ( not ( = ?auto_468361 ?auto_468367 ) ) ( not ( = ?auto_468361 ?auto_468368 ) ) ( not ( = ?auto_468361 ?auto_468369 ) ) ( not ( = ?auto_468361 ?auto_468370 ) ) ( not ( = ?auto_468362 ?auto_468363 ) ) ( not ( = ?auto_468362 ?auto_468364 ) ) ( not ( = ?auto_468362 ?auto_468365 ) ) ( not ( = ?auto_468362 ?auto_468366 ) ) ( not ( = ?auto_468362 ?auto_468367 ) ) ( not ( = ?auto_468362 ?auto_468368 ) ) ( not ( = ?auto_468362 ?auto_468369 ) ) ( not ( = ?auto_468362 ?auto_468370 ) ) ( not ( = ?auto_468363 ?auto_468364 ) ) ( not ( = ?auto_468363 ?auto_468365 ) ) ( not ( = ?auto_468363 ?auto_468366 ) ) ( not ( = ?auto_468363 ?auto_468367 ) ) ( not ( = ?auto_468363 ?auto_468368 ) ) ( not ( = ?auto_468363 ?auto_468369 ) ) ( not ( = ?auto_468363 ?auto_468370 ) ) ( not ( = ?auto_468364 ?auto_468365 ) ) ( not ( = ?auto_468364 ?auto_468366 ) ) ( not ( = ?auto_468364 ?auto_468367 ) ) ( not ( = ?auto_468364 ?auto_468368 ) ) ( not ( = ?auto_468364 ?auto_468369 ) ) ( not ( = ?auto_468364 ?auto_468370 ) ) ( not ( = ?auto_468365 ?auto_468366 ) ) ( not ( = ?auto_468365 ?auto_468367 ) ) ( not ( = ?auto_468365 ?auto_468368 ) ) ( not ( = ?auto_468365 ?auto_468369 ) ) ( not ( = ?auto_468365 ?auto_468370 ) ) ( not ( = ?auto_468366 ?auto_468367 ) ) ( not ( = ?auto_468366 ?auto_468368 ) ) ( not ( = ?auto_468366 ?auto_468369 ) ) ( not ( = ?auto_468366 ?auto_468370 ) ) ( not ( = ?auto_468367 ?auto_468368 ) ) ( not ( = ?auto_468367 ?auto_468369 ) ) ( not ( = ?auto_468367 ?auto_468370 ) ) ( not ( = ?auto_468368 ?auto_468369 ) ) ( not ( = ?auto_468368 ?auto_468370 ) ) ( not ( = ?auto_468369 ?auto_468370 ) ) ( ON ?auto_468368 ?auto_468369 ) ( ON ?auto_468367 ?auto_468368 ) ( ON ?auto_468366 ?auto_468367 ) ( ON ?auto_468365 ?auto_468366 ) ( ON ?auto_468364 ?auto_468365 ) ( ON ?auto_468363 ?auto_468364 ) ( ON ?auto_468362 ?auto_468363 ) ( ON ?auto_468361 ?auto_468362 ) ( ON ?auto_468360 ?auto_468361 ) ( ON ?auto_468359 ?auto_468360 ) ( ON ?auto_468358 ?auto_468359 ) ( ON ?auto_468357 ?auto_468358 ) ( CLEAR ?auto_468357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_468357 )
      ( MAKE-13PILE ?auto_468357 ?auto_468358 ?auto_468359 ?auto_468360 ?auto_468361 ?auto_468362 ?auto_468363 ?auto_468364 ?auto_468365 ?auto_468366 ?auto_468367 ?auto_468368 ?auto_468369 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_468412 - BLOCK
      ?auto_468413 - BLOCK
      ?auto_468414 - BLOCK
      ?auto_468415 - BLOCK
      ?auto_468416 - BLOCK
      ?auto_468417 - BLOCK
      ?auto_468418 - BLOCK
      ?auto_468419 - BLOCK
      ?auto_468420 - BLOCK
      ?auto_468421 - BLOCK
      ?auto_468422 - BLOCK
      ?auto_468423 - BLOCK
      ?auto_468424 - BLOCK
      ?auto_468425 - BLOCK
    )
    :vars
    (
      ?auto_468426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_468424 ) ( ON ?auto_468425 ?auto_468426 ) ( CLEAR ?auto_468425 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_468412 ) ( ON ?auto_468413 ?auto_468412 ) ( ON ?auto_468414 ?auto_468413 ) ( ON ?auto_468415 ?auto_468414 ) ( ON ?auto_468416 ?auto_468415 ) ( ON ?auto_468417 ?auto_468416 ) ( ON ?auto_468418 ?auto_468417 ) ( ON ?auto_468419 ?auto_468418 ) ( ON ?auto_468420 ?auto_468419 ) ( ON ?auto_468421 ?auto_468420 ) ( ON ?auto_468422 ?auto_468421 ) ( ON ?auto_468423 ?auto_468422 ) ( ON ?auto_468424 ?auto_468423 ) ( not ( = ?auto_468412 ?auto_468413 ) ) ( not ( = ?auto_468412 ?auto_468414 ) ) ( not ( = ?auto_468412 ?auto_468415 ) ) ( not ( = ?auto_468412 ?auto_468416 ) ) ( not ( = ?auto_468412 ?auto_468417 ) ) ( not ( = ?auto_468412 ?auto_468418 ) ) ( not ( = ?auto_468412 ?auto_468419 ) ) ( not ( = ?auto_468412 ?auto_468420 ) ) ( not ( = ?auto_468412 ?auto_468421 ) ) ( not ( = ?auto_468412 ?auto_468422 ) ) ( not ( = ?auto_468412 ?auto_468423 ) ) ( not ( = ?auto_468412 ?auto_468424 ) ) ( not ( = ?auto_468412 ?auto_468425 ) ) ( not ( = ?auto_468412 ?auto_468426 ) ) ( not ( = ?auto_468413 ?auto_468414 ) ) ( not ( = ?auto_468413 ?auto_468415 ) ) ( not ( = ?auto_468413 ?auto_468416 ) ) ( not ( = ?auto_468413 ?auto_468417 ) ) ( not ( = ?auto_468413 ?auto_468418 ) ) ( not ( = ?auto_468413 ?auto_468419 ) ) ( not ( = ?auto_468413 ?auto_468420 ) ) ( not ( = ?auto_468413 ?auto_468421 ) ) ( not ( = ?auto_468413 ?auto_468422 ) ) ( not ( = ?auto_468413 ?auto_468423 ) ) ( not ( = ?auto_468413 ?auto_468424 ) ) ( not ( = ?auto_468413 ?auto_468425 ) ) ( not ( = ?auto_468413 ?auto_468426 ) ) ( not ( = ?auto_468414 ?auto_468415 ) ) ( not ( = ?auto_468414 ?auto_468416 ) ) ( not ( = ?auto_468414 ?auto_468417 ) ) ( not ( = ?auto_468414 ?auto_468418 ) ) ( not ( = ?auto_468414 ?auto_468419 ) ) ( not ( = ?auto_468414 ?auto_468420 ) ) ( not ( = ?auto_468414 ?auto_468421 ) ) ( not ( = ?auto_468414 ?auto_468422 ) ) ( not ( = ?auto_468414 ?auto_468423 ) ) ( not ( = ?auto_468414 ?auto_468424 ) ) ( not ( = ?auto_468414 ?auto_468425 ) ) ( not ( = ?auto_468414 ?auto_468426 ) ) ( not ( = ?auto_468415 ?auto_468416 ) ) ( not ( = ?auto_468415 ?auto_468417 ) ) ( not ( = ?auto_468415 ?auto_468418 ) ) ( not ( = ?auto_468415 ?auto_468419 ) ) ( not ( = ?auto_468415 ?auto_468420 ) ) ( not ( = ?auto_468415 ?auto_468421 ) ) ( not ( = ?auto_468415 ?auto_468422 ) ) ( not ( = ?auto_468415 ?auto_468423 ) ) ( not ( = ?auto_468415 ?auto_468424 ) ) ( not ( = ?auto_468415 ?auto_468425 ) ) ( not ( = ?auto_468415 ?auto_468426 ) ) ( not ( = ?auto_468416 ?auto_468417 ) ) ( not ( = ?auto_468416 ?auto_468418 ) ) ( not ( = ?auto_468416 ?auto_468419 ) ) ( not ( = ?auto_468416 ?auto_468420 ) ) ( not ( = ?auto_468416 ?auto_468421 ) ) ( not ( = ?auto_468416 ?auto_468422 ) ) ( not ( = ?auto_468416 ?auto_468423 ) ) ( not ( = ?auto_468416 ?auto_468424 ) ) ( not ( = ?auto_468416 ?auto_468425 ) ) ( not ( = ?auto_468416 ?auto_468426 ) ) ( not ( = ?auto_468417 ?auto_468418 ) ) ( not ( = ?auto_468417 ?auto_468419 ) ) ( not ( = ?auto_468417 ?auto_468420 ) ) ( not ( = ?auto_468417 ?auto_468421 ) ) ( not ( = ?auto_468417 ?auto_468422 ) ) ( not ( = ?auto_468417 ?auto_468423 ) ) ( not ( = ?auto_468417 ?auto_468424 ) ) ( not ( = ?auto_468417 ?auto_468425 ) ) ( not ( = ?auto_468417 ?auto_468426 ) ) ( not ( = ?auto_468418 ?auto_468419 ) ) ( not ( = ?auto_468418 ?auto_468420 ) ) ( not ( = ?auto_468418 ?auto_468421 ) ) ( not ( = ?auto_468418 ?auto_468422 ) ) ( not ( = ?auto_468418 ?auto_468423 ) ) ( not ( = ?auto_468418 ?auto_468424 ) ) ( not ( = ?auto_468418 ?auto_468425 ) ) ( not ( = ?auto_468418 ?auto_468426 ) ) ( not ( = ?auto_468419 ?auto_468420 ) ) ( not ( = ?auto_468419 ?auto_468421 ) ) ( not ( = ?auto_468419 ?auto_468422 ) ) ( not ( = ?auto_468419 ?auto_468423 ) ) ( not ( = ?auto_468419 ?auto_468424 ) ) ( not ( = ?auto_468419 ?auto_468425 ) ) ( not ( = ?auto_468419 ?auto_468426 ) ) ( not ( = ?auto_468420 ?auto_468421 ) ) ( not ( = ?auto_468420 ?auto_468422 ) ) ( not ( = ?auto_468420 ?auto_468423 ) ) ( not ( = ?auto_468420 ?auto_468424 ) ) ( not ( = ?auto_468420 ?auto_468425 ) ) ( not ( = ?auto_468420 ?auto_468426 ) ) ( not ( = ?auto_468421 ?auto_468422 ) ) ( not ( = ?auto_468421 ?auto_468423 ) ) ( not ( = ?auto_468421 ?auto_468424 ) ) ( not ( = ?auto_468421 ?auto_468425 ) ) ( not ( = ?auto_468421 ?auto_468426 ) ) ( not ( = ?auto_468422 ?auto_468423 ) ) ( not ( = ?auto_468422 ?auto_468424 ) ) ( not ( = ?auto_468422 ?auto_468425 ) ) ( not ( = ?auto_468422 ?auto_468426 ) ) ( not ( = ?auto_468423 ?auto_468424 ) ) ( not ( = ?auto_468423 ?auto_468425 ) ) ( not ( = ?auto_468423 ?auto_468426 ) ) ( not ( = ?auto_468424 ?auto_468425 ) ) ( not ( = ?auto_468424 ?auto_468426 ) ) ( not ( = ?auto_468425 ?auto_468426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_468425 ?auto_468426 )
      ( !STACK ?auto_468425 ?auto_468424 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_468470 - BLOCK
      ?auto_468471 - BLOCK
      ?auto_468472 - BLOCK
      ?auto_468473 - BLOCK
      ?auto_468474 - BLOCK
      ?auto_468475 - BLOCK
      ?auto_468476 - BLOCK
      ?auto_468477 - BLOCK
      ?auto_468478 - BLOCK
      ?auto_468479 - BLOCK
      ?auto_468480 - BLOCK
      ?auto_468481 - BLOCK
      ?auto_468482 - BLOCK
      ?auto_468483 - BLOCK
    )
    :vars
    (
      ?auto_468484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468483 ?auto_468484 ) ( ON-TABLE ?auto_468470 ) ( ON ?auto_468471 ?auto_468470 ) ( ON ?auto_468472 ?auto_468471 ) ( ON ?auto_468473 ?auto_468472 ) ( ON ?auto_468474 ?auto_468473 ) ( ON ?auto_468475 ?auto_468474 ) ( ON ?auto_468476 ?auto_468475 ) ( ON ?auto_468477 ?auto_468476 ) ( ON ?auto_468478 ?auto_468477 ) ( ON ?auto_468479 ?auto_468478 ) ( ON ?auto_468480 ?auto_468479 ) ( ON ?auto_468481 ?auto_468480 ) ( not ( = ?auto_468470 ?auto_468471 ) ) ( not ( = ?auto_468470 ?auto_468472 ) ) ( not ( = ?auto_468470 ?auto_468473 ) ) ( not ( = ?auto_468470 ?auto_468474 ) ) ( not ( = ?auto_468470 ?auto_468475 ) ) ( not ( = ?auto_468470 ?auto_468476 ) ) ( not ( = ?auto_468470 ?auto_468477 ) ) ( not ( = ?auto_468470 ?auto_468478 ) ) ( not ( = ?auto_468470 ?auto_468479 ) ) ( not ( = ?auto_468470 ?auto_468480 ) ) ( not ( = ?auto_468470 ?auto_468481 ) ) ( not ( = ?auto_468470 ?auto_468482 ) ) ( not ( = ?auto_468470 ?auto_468483 ) ) ( not ( = ?auto_468470 ?auto_468484 ) ) ( not ( = ?auto_468471 ?auto_468472 ) ) ( not ( = ?auto_468471 ?auto_468473 ) ) ( not ( = ?auto_468471 ?auto_468474 ) ) ( not ( = ?auto_468471 ?auto_468475 ) ) ( not ( = ?auto_468471 ?auto_468476 ) ) ( not ( = ?auto_468471 ?auto_468477 ) ) ( not ( = ?auto_468471 ?auto_468478 ) ) ( not ( = ?auto_468471 ?auto_468479 ) ) ( not ( = ?auto_468471 ?auto_468480 ) ) ( not ( = ?auto_468471 ?auto_468481 ) ) ( not ( = ?auto_468471 ?auto_468482 ) ) ( not ( = ?auto_468471 ?auto_468483 ) ) ( not ( = ?auto_468471 ?auto_468484 ) ) ( not ( = ?auto_468472 ?auto_468473 ) ) ( not ( = ?auto_468472 ?auto_468474 ) ) ( not ( = ?auto_468472 ?auto_468475 ) ) ( not ( = ?auto_468472 ?auto_468476 ) ) ( not ( = ?auto_468472 ?auto_468477 ) ) ( not ( = ?auto_468472 ?auto_468478 ) ) ( not ( = ?auto_468472 ?auto_468479 ) ) ( not ( = ?auto_468472 ?auto_468480 ) ) ( not ( = ?auto_468472 ?auto_468481 ) ) ( not ( = ?auto_468472 ?auto_468482 ) ) ( not ( = ?auto_468472 ?auto_468483 ) ) ( not ( = ?auto_468472 ?auto_468484 ) ) ( not ( = ?auto_468473 ?auto_468474 ) ) ( not ( = ?auto_468473 ?auto_468475 ) ) ( not ( = ?auto_468473 ?auto_468476 ) ) ( not ( = ?auto_468473 ?auto_468477 ) ) ( not ( = ?auto_468473 ?auto_468478 ) ) ( not ( = ?auto_468473 ?auto_468479 ) ) ( not ( = ?auto_468473 ?auto_468480 ) ) ( not ( = ?auto_468473 ?auto_468481 ) ) ( not ( = ?auto_468473 ?auto_468482 ) ) ( not ( = ?auto_468473 ?auto_468483 ) ) ( not ( = ?auto_468473 ?auto_468484 ) ) ( not ( = ?auto_468474 ?auto_468475 ) ) ( not ( = ?auto_468474 ?auto_468476 ) ) ( not ( = ?auto_468474 ?auto_468477 ) ) ( not ( = ?auto_468474 ?auto_468478 ) ) ( not ( = ?auto_468474 ?auto_468479 ) ) ( not ( = ?auto_468474 ?auto_468480 ) ) ( not ( = ?auto_468474 ?auto_468481 ) ) ( not ( = ?auto_468474 ?auto_468482 ) ) ( not ( = ?auto_468474 ?auto_468483 ) ) ( not ( = ?auto_468474 ?auto_468484 ) ) ( not ( = ?auto_468475 ?auto_468476 ) ) ( not ( = ?auto_468475 ?auto_468477 ) ) ( not ( = ?auto_468475 ?auto_468478 ) ) ( not ( = ?auto_468475 ?auto_468479 ) ) ( not ( = ?auto_468475 ?auto_468480 ) ) ( not ( = ?auto_468475 ?auto_468481 ) ) ( not ( = ?auto_468475 ?auto_468482 ) ) ( not ( = ?auto_468475 ?auto_468483 ) ) ( not ( = ?auto_468475 ?auto_468484 ) ) ( not ( = ?auto_468476 ?auto_468477 ) ) ( not ( = ?auto_468476 ?auto_468478 ) ) ( not ( = ?auto_468476 ?auto_468479 ) ) ( not ( = ?auto_468476 ?auto_468480 ) ) ( not ( = ?auto_468476 ?auto_468481 ) ) ( not ( = ?auto_468476 ?auto_468482 ) ) ( not ( = ?auto_468476 ?auto_468483 ) ) ( not ( = ?auto_468476 ?auto_468484 ) ) ( not ( = ?auto_468477 ?auto_468478 ) ) ( not ( = ?auto_468477 ?auto_468479 ) ) ( not ( = ?auto_468477 ?auto_468480 ) ) ( not ( = ?auto_468477 ?auto_468481 ) ) ( not ( = ?auto_468477 ?auto_468482 ) ) ( not ( = ?auto_468477 ?auto_468483 ) ) ( not ( = ?auto_468477 ?auto_468484 ) ) ( not ( = ?auto_468478 ?auto_468479 ) ) ( not ( = ?auto_468478 ?auto_468480 ) ) ( not ( = ?auto_468478 ?auto_468481 ) ) ( not ( = ?auto_468478 ?auto_468482 ) ) ( not ( = ?auto_468478 ?auto_468483 ) ) ( not ( = ?auto_468478 ?auto_468484 ) ) ( not ( = ?auto_468479 ?auto_468480 ) ) ( not ( = ?auto_468479 ?auto_468481 ) ) ( not ( = ?auto_468479 ?auto_468482 ) ) ( not ( = ?auto_468479 ?auto_468483 ) ) ( not ( = ?auto_468479 ?auto_468484 ) ) ( not ( = ?auto_468480 ?auto_468481 ) ) ( not ( = ?auto_468480 ?auto_468482 ) ) ( not ( = ?auto_468480 ?auto_468483 ) ) ( not ( = ?auto_468480 ?auto_468484 ) ) ( not ( = ?auto_468481 ?auto_468482 ) ) ( not ( = ?auto_468481 ?auto_468483 ) ) ( not ( = ?auto_468481 ?auto_468484 ) ) ( not ( = ?auto_468482 ?auto_468483 ) ) ( not ( = ?auto_468482 ?auto_468484 ) ) ( not ( = ?auto_468483 ?auto_468484 ) ) ( CLEAR ?auto_468481 ) ( ON ?auto_468482 ?auto_468483 ) ( CLEAR ?auto_468482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_468470 ?auto_468471 ?auto_468472 ?auto_468473 ?auto_468474 ?auto_468475 ?auto_468476 ?auto_468477 ?auto_468478 ?auto_468479 ?auto_468480 ?auto_468481 ?auto_468482 )
      ( MAKE-14PILE ?auto_468470 ?auto_468471 ?auto_468472 ?auto_468473 ?auto_468474 ?auto_468475 ?auto_468476 ?auto_468477 ?auto_468478 ?auto_468479 ?auto_468480 ?auto_468481 ?auto_468482 ?auto_468483 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_468528 - BLOCK
      ?auto_468529 - BLOCK
      ?auto_468530 - BLOCK
      ?auto_468531 - BLOCK
      ?auto_468532 - BLOCK
      ?auto_468533 - BLOCK
      ?auto_468534 - BLOCK
      ?auto_468535 - BLOCK
      ?auto_468536 - BLOCK
      ?auto_468537 - BLOCK
      ?auto_468538 - BLOCK
      ?auto_468539 - BLOCK
      ?auto_468540 - BLOCK
      ?auto_468541 - BLOCK
    )
    :vars
    (
      ?auto_468542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468541 ?auto_468542 ) ( ON-TABLE ?auto_468528 ) ( ON ?auto_468529 ?auto_468528 ) ( ON ?auto_468530 ?auto_468529 ) ( ON ?auto_468531 ?auto_468530 ) ( ON ?auto_468532 ?auto_468531 ) ( ON ?auto_468533 ?auto_468532 ) ( ON ?auto_468534 ?auto_468533 ) ( ON ?auto_468535 ?auto_468534 ) ( ON ?auto_468536 ?auto_468535 ) ( ON ?auto_468537 ?auto_468536 ) ( ON ?auto_468538 ?auto_468537 ) ( not ( = ?auto_468528 ?auto_468529 ) ) ( not ( = ?auto_468528 ?auto_468530 ) ) ( not ( = ?auto_468528 ?auto_468531 ) ) ( not ( = ?auto_468528 ?auto_468532 ) ) ( not ( = ?auto_468528 ?auto_468533 ) ) ( not ( = ?auto_468528 ?auto_468534 ) ) ( not ( = ?auto_468528 ?auto_468535 ) ) ( not ( = ?auto_468528 ?auto_468536 ) ) ( not ( = ?auto_468528 ?auto_468537 ) ) ( not ( = ?auto_468528 ?auto_468538 ) ) ( not ( = ?auto_468528 ?auto_468539 ) ) ( not ( = ?auto_468528 ?auto_468540 ) ) ( not ( = ?auto_468528 ?auto_468541 ) ) ( not ( = ?auto_468528 ?auto_468542 ) ) ( not ( = ?auto_468529 ?auto_468530 ) ) ( not ( = ?auto_468529 ?auto_468531 ) ) ( not ( = ?auto_468529 ?auto_468532 ) ) ( not ( = ?auto_468529 ?auto_468533 ) ) ( not ( = ?auto_468529 ?auto_468534 ) ) ( not ( = ?auto_468529 ?auto_468535 ) ) ( not ( = ?auto_468529 ?auto_468536 ) ) ( not ( = ?auto_468529 ?auto_468537 ) ) ( not ( = ?auto_468529 ?auto_468538 ) ) ( not ( = ?auto_468529 ?auto_468539 ) ) ( not ( = ?auto_468529 ?auto_468540 ) ) ( not ( = ?auto_468529 ?auto_468541 ) ) ( not ( = ?auto_468529 ?auto_468542 ) ) ( not ( = ?auto_468530 ?auto_468531 ) ) ( not ( = ?auto_468530 ?auto_468532 ) ) ( not ( = ?auto_468530 ?auto_468533 ) ) ( not ( = ?auto_468530 ?auto_468534 ) ) ( not ( = ?auto_468530 ?auto_468535 ) ) ( not ( = ?auto_468530 ?auto_468536 ) ) ( not ( = ?auto_468530 ?auto_468537 ) ) ( not ( = ?auto_468530 ?auto_468538 ) ) ( not ( = ?auto_468530 ?auto_468539 ) ) ( not ( = ?auto_468530 ?auto_468540 ) ) ( not ( = ?auto_468530 ?auto_468541 ) ) ( not ( = ?auto_468530 ?auto_468542 ) ) ( not ( = ?auto_468531 ?auto_468532 ) ) ( not ( = ?auto_468531 ?auto_468533 ) ) ( not ( = ?auto_468531 ?auto_468534 ) ) ( not ( = ?auto_468531 ?auto_468535 ) ) ( not ( = ?auto_468531 ?auto_468536 ) ) ( not ( = ?auto_468531 ?auto_468537 ) ) ( not ( = ?auto_468531 ?auto_468538 ) ) ( not ( = ?auto_468531 ?auto_468539 ) ) ( not ( = ?auto_468531 ?auto_468540 ) ) ( not ( = ?auto_468531 ?auto_468541 ) ) ( not ( = ?auto_468531 ?auto_468542 ) ) ( not ( = ?auto_468532 ?auto_468533 ) ) ( not ( = ?auto_468532 ?auto_468534 ) ) ( not ( = ?auto_468532 ?auto_468535 ) ) ( not ( = ?auto_468532 ?auto_468536 ) ) ( not ( = ?auto_468532 ?auto_468537 ) ) ( not ( = ?auto_468532 ?auto_468538 ) ) ( not ( = ?auto_468532 ?auto_468539 ) ) ( not ( = ?auto_468532 ?auto_468540 ) ) ( not ( = ?auto_468532 ?auto_468541 ) ) ( not ( = ?auto_468532 ?auto_468542 ) ) ( not ( = ?auto_468533 ?auto_468534 ) ) ( not ( = ?auto_468533 ?auto_468535 ) ) ( not ( = ?auto_468533 ?auto_468536 ) ) ( not ( = ?auto_468533 ?auto_468537 ) ) ( not ( = ?auto_468533 ?auto_468538 ) ) ( not ( = ?auto_468533 ?auto_468539 ) ) ( not ( = ?auto_468533 ?auto_468540 ) ) ( not ( = ?auto_468533 ?auto_468541 ) ) ( not ( = ?auto_468533 ?auto_468542 ) ) ( not ( = ?auto_468534 ?auto_468535 ) ) ( not ( = ?auto_468534 ?auto_468536 ) ) ( not ( = ?auto_468534 ?auto_468537 ) ) ( not ( = ?auto_468534 ?auto_468538 ) ) ( not ( = ?auto_468534 ?auto_468539 ) ) ( not ( = ?auto_468534 ?auto_468540 ) ) ( not ( = ?auto_468534 ?auto_468541 ) ) ( not ( = ?auto_468534 ?auto_468542 ) ) ( not ( = ?auto_468535 ?auto_468536 ) ) ( not ( = ?auto_468535 ?auto_468537 ) ) ( not ( = ?auto_468535 ?auto_468538 ) ) ( not ( = ?auto_468535 ?auto_468539 ) ) ( not ( = ?auto_468535 ?auto_468540 ) ) ( not ( = ?auto_468535 ?auto_468541 ) ) ( not ( = ?auto_468535 ?auto_468542 ) ) ( not ( = ?auto_468536 ?auto_468537 ) ) ( not ( = ?auto_468536 ?auto_468538 ) ) ( not ( = ?auto_468536 ?auto_468539 ) ) ( not ( = ?auto_468536 ?auto_468540 ) ) ( not ( = ?auto_468536 ?auto_468541 ) ) ( not ( = ?auto_468536 ?auto_468542 ) ) ( not ( = ?auto_468537 ?auto_468538 ) ) ( not ( = ?auto_468537 ?auto_468539 ) ) ( not ( = ?auto_468537 ?auto_468540 ) ) ( not ( = ?auto_468537 ?auto_468541 ) ) ( not ( = ?auto_468537 ?auto_468542 ) ) ( not ( = ?auto_468538 ?auto_468539 ) ) ( not ( = ?auto_468538 ?auto_468540 ) ) ( not ( = ?auto_468538 ?auto_468541 ) ) ( not ( = ?auto_468538 ?auto_468542 ) ) ( not ( = ?auto_468539 ?auto_468540 ) ) ( not ( = ?auto_468539 ?auto_468541 ) ) ( not ( = ?auto_468539 ?auto_468542 ) ) ( not ( = ?auto_468540 ?auto_468541 ) ) ( not ( = ?auto_468540 ?auto_468542 ) ) ( not ( = ?auto_468541 ?auto_468542 ) ) ( ON ?auto_468540 ?auto_468541 ) ( CLEAR ?auto_468538 ) ( ON ?auto_468539 ?auto_468540 ) ( CLEAR ?auto_468539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_468528 ?auto_468529 ?auto_468530 ?auto_468531 ?auto_468532 ?auto_468533 ?auto_468534 ?auto_468535 ?auto_468536 ?auto_468537 ?auto_468538 ?auto_468539 )
      ( MAKE-14PILE ?auto_468528 ?auto_468529 ?auto_468530 ?auto_468531 ?auto_468532 ?auto_468533 ?auto_468534 ?auto_468535 ?auto_468536 ?auto_468537 ?auto_468538 ?auto_468539 ?auto_468540 ?auto_468541 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_468586 - BLOCK
      ?auto_468587 - BLOCK
      ?auto_468588 - BLOCK
      ?auto_468589 - BLOCK
      ?auto_468590 - BLOCK
      ?auto_468591 - BLOCK
      ?auto_468592 - BLOCK
      ?auto_468593 - BLOCK
      ?auto_468594 - BLOCK
      ?auto_468595 - BLOCK
      ?auto_468596 - BLOCK
      ?auto_468597 - BLOCK
      ?auto_468598 - BLOCK
      ?auto_468599 - BLOCK
    )
    :vars
    (
      ?auto_468600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468599 ?auto_468600 ) ( ON-TABLE ?auto_468586 ) ( ON ?auto_468587 ?auto_468586 ) ( ON ?auto_468588 ?auto_468587 ) ( ON ?auto_468589 ?auto_468588 ) ( ON ?auto_468590 ?auto_468589 ) ( ON ?auto_468591 ?auto_468590 ) ( ON ?auto_468592 ?auto_468591 ) ( ON ?auto_468593 ?auto_468592 ) ( ON ?auto_468594 ?auto_468593 ) ( ON ?auto_468595 ?auto_468594 ) ( not ( = ?auto_468586 ?auto_468587 ) ) ( not ( = ?auto_468586 ?auto_468588 ) ) ( not ( = ?auto_468586 ?auto_468589 ) ) ( not ( = ?auto_468586 ?auto_468590 ) ) ( not ( = ?auto_468586 ?auto_468591 ) ) ( not ( = ?auto_468586 ?auto_468592 ) ) ( not ( = ?auto_468586 ?auto_468593 ) ) ( not ( = ?auto_468586 ?auto_468594 ) ) ( not ( = ?auto_468586 ?auto_468595 ) ) ( not ( = ?auto_468586 ?auto_468596 ) ) ( not ( = ?auto_468586 ?auto_468597 ) ) ( not ( = ?auto_468586 ?auto_468598 ) ) ( not ( = ?auto_468586 ?auto_468599 ) ) ( not ( = ?auto_468586 ?auto_468600 ) ) ( not ( = ?auto_468587 ?auto_468588 ) ) ( not ( = ?auto_468587 ?auto_468589 ) ) ( not ( = ?auto_468587 ?auto_468590 ) ) ( not ( = ?auto_468587 ?auto_468591 ) ) ( not ( = ?auto_468587 ?auto_468592 ) ) ( not ( = ?auto_468587 ?auto_468593 ) ) ( not ( = ?auto_468587 ?auto_468594 ) ) ( not ( = ?auto_468587 ?auto_468595 ) ) ( not ( = ?auto_468587 ?auto_468596 ) ) ( not ( = ?auto_468587 ?auto_468597 ) ) ( not ( = ?auto_468587 ?auto_468598 ) ) ( not ( = ?auto_468587 ?auto_468599 ) ) ( not ( = ?auto_468587 ?auto_468600 ) ) ( not ( = ?auto_468588 ?auto_468589 ) ) ( not ( = ?auto_468588 ?auto_468590 ) ) ( not ( = ?auto_468588 ?auto_468591 ) ) ( not ( = ?auto_468588 ?auto_468592 ) ) ( not ( = ?auto_468588 ?auto_468593 ) ) ( not ( = ?auto_468588 ?auto_468594 ) ) ( not ( = ?auto_468588 ?auto_468595 ) ) ( not ( = ?auto_468588 ?auto_468596 ) ) ( not ( = ?auto_468588 ?auto_468597 ) ) ( not ( = ?auto_468588 ?auto_468598 ) ) ( not ( = ?auto_468588 ?auto_468599 ) ) ( not ( = ?auto_468588 ?auto_468600 ) ) ( not ( = ?auto_468589 ?auto_468590 ) ) ( not ( = ?auto_468589 ?auto_468591 ) ) ( not ( = ?auto_468589 ?auto_468592 ) ) ( not ( = ?auto_468589 ?auto_468593 ) ) ( not ( = ?auto_468589 ?auto_468594 ) ) ( not ( = ?auto_468589 ?auto_468595 ) ) ( not ( = ?auto_468589 ?auto_468596 ) ) ( not ( = ?auto_468589 ?auto_468597 ) ) ( not ( = ?auto_468589 ?auto_468598 ) ) ( not ( = ?auto_468589 ?auto_468599 ) ) ( not ( = ?auto_468589 ?auto_468600 ) ) ( not ( = ?auto_468590 ?auto_468591 ) ) ( not ( = ?auto_468590 ?auto_468592 ) ) ( not ( = ?auto_468590 ?auto_468593 ) ) ( not ( = ?auto_468590 ?auto_468594 ) ) ( not ( = ?auto_468590 ?auto_468595 ) ) ( not ( = ?auto_468590 ?auto_468596 ) ) ( not ( = ?auto_468590 ?auto_468597 ) ) ( not ( = ?auto_468590 ?auto_468598 ) ) ( not ( = ?auto_468590 ?auto_468599 ) ) ( not ( = ?auto_468590 ?auto_468600 ) ) ( not ( = ?auto_468591 ?auto_468592 ) ) ( not ( = ?auto_468591 ?auto_468593 ) ) ( not ( = ?auto_468591 ?auto_468594 ) ) ( not ( = ?auto_468591 ?auto_468595 ) ) ( not ( = ?auto_468591 ?auto_468596 ) ) ( not ( = ?auto_468591 ?auto_468597 ) ) ( not ( = ?auto_468591 ?auto_468598 ) ) ( not ( = ?auto_468591 ?auto_468599 ) ) ( not ( = ?auto_468591 ?auto_468600 ) ) ( not ( = ?auto_468592 ?auto_468593 ) ) ( not ( = ?auto_468592 ?auto_468594 ) ) ( not ( = ?auto_468592 ?auto_468595 ) ) ( not ( = ?auto_468592 ?auto_468596 ) ) ( not ( = ?auto_468592 ?auto_468597 ) ) ( not ( = ?auto_468592 ?auto_468598 ) ) ( not ( = ?auto_468592 ?auto_468599 ) ) ( not ( = ?auto_468592 ?auto_468600 ) ) ( not ( = ?auto_468593 ?auto_468594 ) ) ( not ( = ?auto_468593 ?auto_468595 ) ) ( not ( = ?auto_468593 ?auto_468596 ) ) ( not ( = ?auto_468593 ?auto_468597 ) ) ( not ( = ?auto_468593 ?auto_468598 ) ) ( not ( = ?auto_468593 ?auto_468599 ) ) ( not ( = ?auto_468593 ?auto_468600 ) ) ( not ( = ?auto_468594 ?auto_468595 ) ) ( not ( = ?auto_468594 ?auto_468596 ) ) ( not ( = ?auto_468594 ?auto_468597 ) ) ( not ( = ?auto_468594 ?auto_468598 ) ) ( not ( = ?auto_468594 ?auto_468599 ) ) ( not ( = ?auto_468594 ?auto_468600 ) ) ( not ( = ?auto_468595 ?auto_468596 ) ) ( not ( = ?auto_468595 ?auto_468597 ) ) ( not ( = ?auto_468595 ?auto_468598 ) ) ( not ( = ?auto_468595 ?auto_468599 ) ) ( not ( = ?auto_468595 ?auto_468600 ) ) ( not ( = ?auto_468596 ?auto_468597 ) ) ( not ( = ?auto_468596 ?auto_468598 ) ) ( not ( = ?auto_468596 ?auto_468599 ) ) ( not ( = ?auto_468596 ?auto_468600 ) ) ( not ( = ?auto_468597 ?auto_468598 ) ) ( not ( = ?auto_468597 ?auto_468599 ) ) ( not ( = ?auto_468597 ?auto_468600 ) ) ( not ( = ?auto_468598 ?auto_468599 ) ) ( not ( = ?auto_468598 ?auto_468600 ) ) ( not ( = ?auto_468599 ?auto_468600 ) ) ( ON ?auto_468598 ?auto_468599 ) ( ON ?auto_468597 ?auto_468598 ) ( CLEAR ?auto_468595 ) ( ON ?auto_468596 ?auto_468597 ) ( CLEAR ?auto_468596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_468586 ?auto_468587 ?auto_468588 ?auto_468589 ?auto_468590 ?auto_468591 ?auto_468592 ?auto_468593 ?auto_468594 ?auto_468595 ?auto_468596 )
      ( MAKE-14PILE ?auto_468586 ?auto_468587 ?auto_468588 ?auto_468589 ?auto_468590 ?auto_468591 ?auto_468592 ?auto_468593 ?auto_468594 ?auto_468595 ?auto_468596 ?auto_468597 ?auto_468598 ?auto_468599 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_468644 - BLOCK
      ?auto_468645 - BLOCK
      ?auto_468646 - BLOCK
      ?auto_468647 - BLOCK
      ?auto_468648 - BLOCK
      ?auto_468649 - BLOCK
      ?auto_468650 - BLOCK
      ?auto_468651 - BLOCK
      ?auto_468652 - BLOCK
      ?auto_468653 - BLOCK
      ?auto_468654 - BLOCK
      ?auto_468655 - BLOCK
      ?auto_468656 - BLOCK
      ?auto_468657 - BLOCK
    )
    :vars
    (
      ?auto_468658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468657 ?auto_468658 ) ( ON-TABLE ?auto_468644 ) ( ON ?auto_468645 ?auto_468644 ) ( ON ?auto_468646 ?auto_468645 ) ( ON ?auto_468647 ?auto_468646 ) ( ON ?auto_468648 ?auto_468647 ) ( ON ?auto_468649 ?auto_468648 ) ( ON ?auto_468650 ?auto_468649 ) ( ON ?auto_468651 ?auto_468650 ) ( ON ?auto_468652 ?auto_468651 ) ( not ( = ?auto_468644 ?auto_468645 ) ) ( not ( = ?auto_468644 ?auto_468646 ) ) ( not ( = ?auto_468644 ?auto_468647 ) ) ( not ( = ?auto_468644 ?auto_468648 ) ) ( not ( = ?auto_468644 ?auto_468649 ) ) ( not ( = ?auto_468644 ?auto_468650 ) ) ( not ( = ?auto_468644 ?auto_468651 ) ) ( not ( = ?auto_468644 ?auto_468652 ) ) ( not ( = ?auto_468644 ?auto_468653 ) ) ( not ( = ?auto_468644 ?auto_468654 ) ) ( not ( = ?auto_468644 ?auto_468655 ) ) ( not ( = ?auto_468644 ?auto_468656 ) ) ( not ( = ?auto_468644 ?auto_468657 ) ) ( not ( = ?auto_468644 ?auto_468658 ) ) ( not ( = ?auto_468645 ?auto_468646 ) ) ( not ( = ?auto_468645 ?auto_468647 ) ) ( not ( = ?auto_468645 ?auto_468648 ) ) ( not ( = ?auto_468645 ?auto_468649 ) ) ( not ( = ?auto_468645 ?auto_468650 ) ) ( not ( = ?auto_468645 ?auto_468651 ) ) ( not ( = ?auto_468645 ?auto_468652 ) ) ( not ( = ?auto_468645 ?auto_468653 ) ) ( not ( = ?auto_468645 ?auto_468654 ) ) ( not ( = ?auto_468645 ?auto_468655 ) ) ( not ( = ?auto_468645 ?auto_468656 ) ) ( not ( = ?auto_468645 ?auto_468657 ) ) ( not ( = ?auto_468645 ?auto_468658 ) ) ( not ( = ?auto_468646 ?auto_468647 ) ) ( not ( = ?auto_468646 ?auto_468648 ) ) ( not ( = ?auto_468646 ?auto_468649 ) ) ( not ( = ?auto_468646 ?auto_468650 ) ) ( not ( = ?auto_468646 ?auto_468651 ) ) ( not ( = ?auto_468646 ?auto_468652 ) ) ( not ( = ?auto_468646 ?auto_468653 ) ) ( not ( = ?auto_468646 ?auto_468654 ) ) ( not ( = ?auto_468646 ?auto_468655 ) ) ( not ( = ?auto_468646 ?auto_468656 ) ) ( not ( = ?auto_468646 ?auto_468657 ) ) ( not ( = ?auto_468646 ?auto_468658 ) ) ( not ( = ?auto_468647 ?auto_468648 ) ) ( not ( = ?auto_468647 ?auto_468649 ) ) ( not ( = ?auto_468647 ?auto_468650 ) ) ( not ( = ?auto_468647 ?auto_468651 ) ) ( not ( = ?auto_468647 ?auto_468652 ) ) ( not ( = ?auto_468647 ?auto_468653 ) ) ( not ( = ?auto_468647 ?auto_468654 ) ) ( not ( = ?auto_468647 ?auto_468655 ) ) ( not ( = ?auto_468647 ?auto_468656 ) ) ( not ( = ?auto_468647 ?auto_468657 ) ) ( not ( = ?auto_468647 ?auto_468658 ) ) ( not ( = ?auto_468648 ?auto_468649 ) ) ( not ( = ?auto_468648 ?auto_468650 ) ) ( not ( = ?auto_468648 ?auto_468651 ) ) ( not ( = ?auto_468648 ?auto_468652 ) ) ( not ( = ?auto_468648 ?auto_468653 ) ) ( not ( = ?auto_468648 ?auto_468654 ) ) ( not ( = ?auto_468648 ?auto_468655 ) ) ( not ( = ?auto_468648 ?auto_468656 ) ) ( not ( = ?auto_468648 ?auto_468657 ) ) ( not ( = ?auto_468648 ?auto_468658 ) ) ( not ( = ?auto_468649 ?auto_468650 ) ) ( not ( = ?auto_468649 ?auto_468651 ) ) ( not ( = ?auto_468649 ?auto_468652 ) ) ( not ( = ?auto_468649 ?auto_468653 ) ) ( not ( = ?auto_468649 ?auto_468654 ) ) ( not ( = ?auto_468649 ?auto_468655 ) ) ( not ( = ?auto_468649 ?auto_468656 ) ) ( not ( = ?auto_468649 ?auto_468657 ) ) ( not ( = ?auto_468649 ?auto_468658 ) ) ( not ( = ?auto_468650 ?auto_468651 ) ) ( not ( = ?auto_468650 ?auto_468652 ) ) ( not ( = ?auto_468650 ?auto_468653 ) ) ( not ( = ?auto_468650 ?auto_468654 ) ) ( not ( = ?auto_468650 ?auto_468655 ) ) ( not ( = ?auto_468650 ?auto_468656 ) ) ( not ( = ?auto_468650 ?auto_468657 ) ) ( not ( = ?auto_468650 ?auto_468658 ) ) ( not ( = ?auto_468651 ?auto_468652 ) ) ( not ( = ?auto_468651 ?auto_468653 ) ) ( not ( = ?auto_468651 ?auto_468654 ) ) ( not ( = ?auto_468651 ?auto_468655 ) ) ( not ( = ?auto_468651 ?auto_468656 ) ) ( not ( = ?auto_468651 ?auto_468657 ) ) ( not ( = ?auto_468651 ?auto_468658 ) ) ( not ( = ?auto_468652 ?auto_468653 ) ) ( not ( = ?auto_468652 ?auto_468654 ) ) ( not ( = ?auto_468652 ?auto_468655 ) ) ( not ( = ?auto_468652 ?auto_468656 ) ) ( not ( = ?auto_468652 ?auto_468657 ) ) ( not ( = ?auto_468652 ?auto_468658 ) ) ( not ( = ?auto_468653 ?auto_468654 ) ) ( not ( = ?auto_468653 ?auto_468655 ) ) ( not ( = ?auto_468653 ?auto_468656 ) ) ( not ( = ?auto_468653 ?auto_468657 ) ) ( not ( = ?auto_468653 ?auto_468658 ) ) ( not ( = ?auto_468654 ?auto_468655 ) ) ( not ( = ?auto_468654 ?auto_468656 ) ) ( not ( = ?auto_468654 ?auto_468657 ) ) ( not ( = ?auto_468654 ?auto_468658 ) ) ( not ( = ?auto_468655 ?auto_468656 ) ) ( not ( = ?auto_468655 ?auto_468657 ) ) ( not ( = ?auto_468655 ?auto_468658 ) ) ( not ( = ?auto_468656 ?auto_468657 ) ) ( not ( = ?auto_468656 ?auto_468658 ) ) ( not ( = ?auto_468657 ?auto_468658 ) ) ( ON ?auto_468656 ?auto_468657 ) ( ON ?auto_468655 ?auto_468656 ) ( ON ?auto_468654 ?auto_468655 ) ( CLEAR ?auto_468652 ) ( ON ?auto_468653 ?auto_468654 ) ( CLEAR ?auto_468653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_468644 ?auto_468645 ?auto_468646 ?auto_468647 ?auto_468648 ?auto_468649 ?auto_468650 ?auto_468651 ?auto_468652 ?auto_468653 )
      ( MAKE-14PILE ?auto_468644 ?auto_468645 ?auto_468646 ?auto_468647 ?auto_468648 ?auto_468649 ?auto_468650 ?auto_468651 ?auto_468652 ?auto_468653 ?auto_468654 ?auto_468655 ?auto_468656 ?auto_468657 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_468702 - BLOCK
      ?auto_468703 - BLOCK
      ?auto_468704 - BLOCK
      ?auto_468705 - BLOCK
      ?auto_468706 - BLOCK
      ?auto_468707 - BLOCK
      ?auto_468708 - BLOCK
      ?auto_468709 - BLOCK
      ?auto_468710 - BLOCK
      ?auto_468711 - BLOCK
      ?auto_468712 - BLOCK
      ?auto_468713 - BLOCK
      ?auto_468714 - BLOCK
      ?auto_468715 - BLOCK
    )
    :vars
    (
      ?auto_468716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468715 ?auto_468716 ) ( ON-TABLE ?auto_468702 ) ( ON ?auto_468703 ?auto_468702 ) ( ON ?auto_468704 ?auto_468703 ) ( ON ?auto_468705 ?auto_468704 ) ( ON ?auto_468706 ?auto_468705 ) ( ON ?auto_468707 ?auto_468706 ) ( ON ?auto_468708 ?auto_468707 ) ( ON ?auto_468709 ?auto_468708 ) ( not ( = ?auto_468702 ?auto_468703 ) ) ( not ( = ?auto_468702 ?auto_468704 ) ) ( not ( = ?auto_468702 ?auto_468705 ) ) ( not ( = ?auto_468702 ?auto_468706 ) ) ( not ( = ?auto_468702 ?auto_468707 ) ) ( not ( = ?auto_468702 ?auto_468708 ) ) ( not ( = ?auto_468702 ?auto_468709 ) ) ( not ( = ?auto_468702 ?auto_468710 ) ) ( not ( = ?auto_468702 ?auto_468711 ) ) ( not ( = ?auto_468702 ?auto_468712 ) ) ( not ( = ?auto_468702 ?auto_468713 ) ) ( not ( = ?auto_468702 ?auto_468714 ) ) ( not ( = ?auto_468702 ?auto_468715 ) ) ( not ( = ?auto_468702 ?auto_468716 ) ) ( not ( = ?auto_468703 ?auto_468704 ) ) ( not ( = ?auto_468703 ?auto_468705 ) ) ( not ( = ?auto_468703 ?auto_468706 ) ) ( not ( = ?auto_468703 ?auto_468707 ) ) ( not ( = ?auto_468703 ?auto_468708 ) ) ( not ( = ?auto_468703 ?auto_468709 ) ) ( not ( = ?auto_468703 ?auto_468710 ) ) ( not ( = ?auto_468703 ?auto_468711 ) ) ( not ( = ?auto_468703 ?auto_468712 ) ) ( not ( = ?auto_468703 ?auto_468713 ) ) ( not ( = ?auto_468703 ?auto_468714 ) ) ( not ( = ?auto_468703 ?auto_468715 ) ) ( not ( = ?auto_468703 ?auto_468716 ) ) ( not ( = ?auto_468704 ?auto_468705 ) ) ( not ( = ?auto_468704 ?auto_468706 ) ) ( not ( = ?auto_468704 ?auto_468707 ) ) ( not ( = ?auto_468704 ?auto_468708 ) ) ( not ( = ?auto_468704 ?auto_468709 ) ) ( not ( = ?auto_468704 ?auto_468710 ) ) ( not ( = ?auto_468704 ?auto_468711 ) ) ( not ( = ?auto_468704 ?auto_468712 ) ) ( not ( = ?auto_468704 ?auto_468713 ) ) ( not ( = ?auto_468704 ?auto_468714 ) ) ( not ( = ?auto_468704 ?auto_468715 ) ) ( not ( = ?auto_468704 ?auto_468716 ) ) ( not ( = ?auto_468705 ?auto_468706 ) ) ( not ( = ?auto_468705 ?auto_468707 ) ) ( not ( = ?auto_468705 ?auto_468708 ) ) ( not ( = ?auto_468705 ?auto_468709 ) ) ( not ( = ?auto_468705 ?auto_468710 ) ) ( not ( = ?auto_468705 ?auto_468711 ) ) ( not ( = ?auto_468705 ?auto_468712 ) ) ( not ( = ?auto_468705 ?auto_468713 ) ) ( not ( = ?auto_468705 ?auto_468714 ) ) ( not ( = ?auto_468705 ?auto_468715 ) ) ( not ( = ?auto_468705 ?auto_468716 ) ) ( not ( = ?auto_468706 ?auto_468707 ) ) ( not ( = ?auto_468706 ?auto_468708 ) ) ( not ( = ?auto_468706 ?auto_468709 ) ) ( not ( = ?auto_468706 ?auto_468710 ) ) ( not ( = ?auto_468706 ?auto_468711 ) ) ( not ( = ?auto_468706 ?auto_468712 ) ) ( not ( = ?auto_468706 ?auto_468713 ) ) ( not ( = ?auto_468706 ?auto_468714 ) ) ( not ( = ?auto_468706 ?auto_468715 ) ) ( not ( = ?auto_468706 ?auto_468716 ) ) ( not ( = ?auto_468707 ?auto_468708 ) ) ( not ( = ?auto_468707 ?auto_468709 ) ) ( not ( = ?auto_468707 ?auto_468710 ) ) ( not ( = ?auto_468707 ?auto_468711 ) ) ( not ( = ?auto_468707 ?auto_468712 ) ) ( not ( = ?auto_468707 ?auto_468713 ) ) ( not ( = ?auto_468707 ?auto_468714 ) ) ( not ( = ?auto_468707 ?auto_468715 ) ) ( not ( = ?auto_468707 ?auto_468716 ) ) ( not ( = ?auto_468708 ?auto_468709 ) ) ( not ( = ?auto_468708 ?auto_468710 ) ) ( not ( = ?auto_468708 ?auto_468711 ) ) ( not ( = ?auto_468708 ?auto_468712 ) ) ( not ( = ?auto_468708 ?auto_468713 ) ) ( not ( = ?auto_468708 ?auto_468714 ) ) ( not ( = ?auto_468708 ?auto_468715 ) ) ( not ( = ?auto_468708 ?auto_468716 ) ) ( not ( = ?auto_468709 ?auto_468710 ) ) ( not ( = ?auto_468709 ?auto_468711 ) ) ( not ( = ?auto_468709 ?auto_468712 ) ) ( not ( = ?auto_468709 ?auto_468713 ) ) ( not ( = ?auto_468709 ?auto_468714 ) ) ( not ( = ?auto_468709 ?auto_468715 ) ) ( not ( = ?auto_468709 ?auto_468716 ) ) ( not ( = ?auto_468710 ?auto_468711 ) ) ( not ( = ?auto_468710 ?auto_468712 ) ) ( not ( = ?auto_468710 ?auto_468713 ) ) ( not ( = ?auto_468710 ?auto_468714 ) ) ( not ( = ?auto_468710 ?auto_468715 ) ) ( not ( = ?auto_468710 ?auto_468716 ) ) ( not ( = ?auto_468711 ?auto_468712 ) ) ( not ( = ?auto_468711 ?auto_468713 ) ) ( not ( = ?auto_468711 ?auto_468714 ) ) ( not ( = ?auto_468711 ?auto_468715 ) ) ( not ( = ?auto_468711 ?auto_468716 ) ) ( not ( = ?auto_468712 ?auto_468713 ) ) ( not ( = ?auto_468712 ?auto_468714 ) ) ( not ( = ?auto_468712 ?auto_468715 ) ) ( not ( = ?auto_468712 ?auto_468716 ) ) ( not ( = ?auto_468713 ?auto_468714 ) ) ( not ( = ?auto_468713 ?auto_468715 ) ) ( not ( = ?auto_468713 ?auto_468716 ) ) ( not ( = ?auto_468714 ?auto_468715 ) ) ( not ( = ?auto_468714 ?auto_468716 ) ) ( not ( = ?auto_468715 ?auto_468716 ) ) ( ON ?auto_468714 ?auto_468715 ) ( ON ?auto_468713 ?auto_468714 ) ( ON ?auto_468712 ?auto_468713 ) ( ON ?auto_468711 ?auto_468712 ) ( CLEAR ?auto_468709 ) ( ON ?auto_468710 ?auto_468711 ) ( CLEAR ?auto_468710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_468702 ?auto_468703 ?auto_468704 ?auto_468705 ?auto_468706 ?auto_468707 ?auto_468708 ?auto_468709 ?auto_468710 )
      ( MAKE-14PILE ?auto_468702 ?auto_468703 ?auto_468704 ?auto_468705 ?auto_468706 ?auto_468707 ?auto_468708 ?auto_468709 ?auto_468710 ?auto_468711 ?auto_468712 ?auto_468713 ?auto_468714 ?auto_468715 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_468760 - BLOCK
      ?auto_468761 - BLOCK
      ?auto_468762 - BLOCK
      ?auto_468763 - BLOCK
      ?auto_468764 - BLOCK
      ?auto_468765 - BLOCK
      ?auto_468766 - BLOCK
      ?auto_468767 - BLOCK
      ?auto_468768 - BLOCK
      ?auto_468769 - BLOCK
      ?auto_468770 - BLOCK
      ?auto_468771 - BLOCK
      ?auto_468772 - BLOCK
      ?auto_468773 - BLOCK
    )
    :vars
    (
      ?auto_468774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468773 ?auto_468774 ) ( ON-TABLE ?auto_468760 ) ( ON ?auto_468761 ?auto_468760 ) ( ON ?auto_468762 ?auto_468761 ) ( ON ?auto_468763 ?auto_468762 ) ( ON ?auto_468764 ?auto_468763 ) ( ON ?auto_468765 ?auto_468764 ) ( ON ?auto_468766 ?auto_468765 ) ( not ( = ?auto_468760 ?auto_468761 ) ) ( not ( = ?auto_468760 ?auto_468762 ) ) ( not ( = ?auto_468760 ?auto_468763 ) ) ( not ( = ?auto_468760 ?auto_468764 ) ) ( not ( = ?auto_468760 ?auto_468765 ) ) ( not ( = ?auto_468760 ?auto_468766 ) ) ( not ( = ?auto_468760 ?auto_468767 ) ) ( not ( = ?auto_468760 ?auto_468768 ) ) ( not ( = ?auto_468760 ?auto_468769 ) ) ( not ( = ?auto_468760 ?auto_468770 ) ) ( not ( = ?auto_468760 ?auto_468771 ) ) ( not ( = ?auto_468760 ?auto_468772 ) ) ( not ( = ?auto_468760 ?auto_468773 ) ) ( not ( = ?auto_468760 ?auto_468774 ) ) ( not ( = ?auto_468761 ?auto_468762 ) ) ( not ( = ?auto_468761 ?auto_468763 ) ) ( not ( = ?auto_468761 ?auto_468764 ) ) ( not ( = ?auto_468761 ?auto_468765 ) ) ( not ( = ?auto_468761 ?auto_468766 ) ) ( not ( = ?auto_468761 ?auto_468767 ) ) ( not ( = ?auto_468761 ?auto_468768 ) ) ( not ( = ?auto_468761 ?auto_468769 ) ) ( not ( = ?auto_468761 ?auto_468770 ) ) ( not ( = ?auto_468761 ?auto_468771 ) ) ( not ( = ?auto_468761 ?auto_468772 ) ) ( not ( = ?auto_468761 ?auto_468773 ) ) ( not ( = ?auto_468761 ?auto_468774 ) ) ( not ( = ?auto_468762 ?auto_468763 ) ) ( not ( = ?auto_468762 ?auto_468764 ) ) ( not ( = ?auto_468762 ?auto_468765 ) ) ( not ( = ?auto_468762 ?auto_468766 ) ) ( not ( = ?auto_468762 ?auto_468767 ) ) ( not ( = ?auto_468762 ?auto_468768 ) ) ( not ( = ?auto_468762 ?auto_468769 ) ) ( not ( = ?auto_468762 ?auto_468770 ) ) ( not ( = ?auto_468762 ?auto_468771 ) ) ( not ( = ?auto_468762 ?auto_468772 ) ) ( not ( = ?auto_468762 ?auto_468773 ) ) ( not ( = ?auto_468762 ?auto_468774 ) ) ( not ( = ?auto_468763 ?auto_468764 ) ) ( not ( = ?auto_468763 ?auto_468765 ) ) ( not ( = ?auto_468763 ?auto_468766 ) ) ( not ( = ?auto_468763 ?auto_468767 ) ) ( not ( = ?auto_468763 ?auto_468768 ) ) ( not ( = ?auto_468763 ?auto_468769 ) ) ( not ( = ?auto_468763 ?auto_468770 ) ) ( not ( = ?auto_468763 ?auto_468771 ) ) ( not ( = ?auto_468763 ?auto_468772 ) ) ( not ( = ?auto_468763 ?auto_468773 ) ) ( not ( = ?auto_468763 ?auto_468774 ) ) ( not ( = ?auto_468764 ?auto_468765 ) ) ( not ( = ?auto_468764 ?auto_468766 ) ) ( not ( = ?auto_468764 ?auto_468767 ) ) ( not ( = ?auto_468764 ?auto_468768 ) ) ( not ( = ?auto_468764 ?auto_468769 ) ) ( not ( = ?auto_468764 ?auto_468770 ) ) ( not ( = ?auto_468764 ?auto_468771 ) ) ( not ( = ?auto_468764 ?auto_468772 ) ) ( not ( = ?auto_468764 ?auto_468773 ) ) ( not ( = ?auto_468764 ?auto_468774 ) ) ( not ( = ?auto_468765 ?auto_468766 ) ) ( not ( = ?auto_468765 ?auto_468767 ) ) ( not ( = ?auto_468765 ?auto_468768 ) ) ( not ( = ?auto_468765 ?auto_468769 ) ) ( not ( = ?auto_468765 ?auto_468770 ) ) ( not ( = ?auto_468765 ?auto_468771 ) ) ( not ( = ?auto_468765 ?auto_468772 ) ) ( not ( = ?auto_468765 ?auto_468773 ) ) ( not ( = ?auto_468765 ?auto_468774 ) ) ( not ( = ?auto_468766 ?auto_468767 ) ) ( not ( = ?auto_468766 ?auto_468768 ) ) ( not ( = ?auto_468766 ?auto_468769 ) ) ( not ( = ?auto_468766 ?auto_468770 ) ) ( not ( = ?auto_468766 ?auto_468771 ) ) ( not ( = ?auto_468766 ?auto_468772 ) ) ( not ( = ?auto_468766 ?auto_468773 ) ) ( not ( = ?auto_468766 ?auto_468774 ) ) ( not ( = ?auto_468767 ?auto_468768 ) ) ( not ( = ?auto_468767 ?auto_468769 ) ) ( not ( = ?auto_468767 ?auto_468770 ) ) ( not ( = ?auto_468767 ?auto_468771 ) ) ( not ( = ?auto_468767 ?auto_468772 ) ) ( not ( = ?auto_468767 ?auto_468773 ) ) ( not ( = ?auto_468767 ?auto_468774 ) ) ( not ( = ?auto_468768 ?auto_468769 ) ) ( not ( = ?auto_468768 ?auto_468770 ) ) ( not ( = ?auto_468768 ?auto_468771 ) ) ( not ( = ?auto_468768 ?auto_468772 ) ) ( not ( = ?auto_468768 ?auto_468773 ) ) ( not ( = ?auto_468768 ?auto_468774 ) ) ( not ( = ?auto_468769 ?auto_468770 ) ) ( not ( = ?auto_468769 ?auto_468771 ) ) ( not ( = ?auto_468769 ?auto_468772 ) ) ( not ( = ?auto_468769 ?auto_468773 ) ) ( not ( = ?auto_468769 ?auto_468774 ) ) ( not ( = ?auto_468770 ?auto_468771 ) ) ( not ( = ?auto_468770 ?auto_468772 ) ) ( not ( = ?auto_468770 ?auto_468773 ) ) ( not ( = ?auto_468770 ?auto_468774 ) ) ( not ( = ?auto_468771 ?auto_468772 ) ) ( not ( = ?auto_468771 ?auto_468773 ) ) ( not ( = ?auto_468771 ?auto_468774 ) ) ( not ( = ?auto_468772 ?auto_468773 ) ) ( not ( = ?auto_468772 ?auto_468774 ) ) ( not ( = ?auto_468773 ?auto_468774 ) ) ( ON ?auto_468772 ?auto_468773 ) ( ON ?auto_468771 ?auto_468772 ) ( ON ?auto_468770 ?auto_468771 ) ( ON ?auto_468769 ?auto_468770 ) ( ON ?auto_468768 ?auto_468769 ) ( CLEAR ?auto_468766 ) ( ON ?auto_468767 ?auto_468768 ) ( CLEAR ?auto_468767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_468760 ?auto_468761 ?auto_468762 ?auto_468763 ?auto_468764 ?auto_468765 ?auto_468766 ?auto_468767 )
      ( MAKE-14PILE ?auto_468760 ?auto_468761 ?auto_468762 ?auto_468763 ?auto_468764 ?auto_468765 ?auto_468766 ?auto_468767 ?auto_468768 ?auto_468769 ?auto_468770 ?auto_468771 ?auto_468772 ?auto_468773 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_468818 - BLOCK
      ?auto_468819 - BLOCK
      ?auto_468820 - BLOCK
      ?auto_468821 - BLOCK
      ?auto_468822 - BLOCK
      ?auto_468823 - BLOCK
      ?auto_468824 - BLOCK
      ?auto_468825 - BLOCK
      ?auto_468826 - BLOCK
      ?auto_468827 - BLOCK
      ?auto_468828 - BLOCK
      ?auto_468829 - BLOCK
      ?auto_468830 - BLOCK
      ?auto_468831 - BLOCK
    )
    :vars
    (
      ?auto_468832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468831 ?auto_468832 ) ( ON-TABLE ?auto_468818 ) ( ON ?auto_468819 ?auto_468818 ) ( ON ?auto_468820 ?auto_468819 ) ( ON ?auto_468821 ?auto_468820 ) ( ON ?auto_468822 ?auto_468821 ) ( ON ?auto_468823 ?auto_468822 ) ( not ( = ?auto_468818 ?auto_468819 ) ) ( not ( = ?auto_468818 ?auto_468820 ) ) ( not ( = ?auto_468818 ?auto_468821 ) ) ( not ( = ?auto_468818 ?auto_468822 ) ) ( not ( = ?auto_468818 ?auto_468823 ) ) ( not ( = ?auto_468818 ?auto_468824 ) ) ( not ( = ?auto_468818 ?auto_468825 ) ) ( not ( = ?auto_468818 ?auto_468826 ) ) ( not ( = ?auto_468818 ?auto_468827 ) ) ( not ( = ?auto_468818 ?auto_468828 ) ) ( not ( = ?auto_468818 ?auto_468829 ) ) ( not ( = ?auto_468818 ?auto_468830 ) ) ( not ( = ?auto_468818 ?auto_468831 ) ) ( not ( = ?auto_468818 ?auto_468832 ) ) ( not ( = ?auto_468819 ?auto_468820 ) ) ( not ( = ?auto_468819 ?auto_468821 ) ) ( not ( = ?auto_468819 ?auto_468822 ) ) ( not ( = ?auto_468819 ?auto_468823 ) ) ( not ( = ?auto_468819 ?auto_468824 ) ) ( not ( = ?auto_468819 ?auto_468825 ) ) ( not ( = ?auto_468819 ?auto_468826 ) ) ( not ( = ?auto_468819 ?auto_468827 ) ) ( not ( = ?auto_468819 ?auto_468828 ) ) ( not ( = ?auto_468819 ?auto_468829 ) ) ( not ( = ?auto_468819 ?auto_468830 ) ) ( not ( = ?auto_468819 ?auto_468831 ) ) ( not ( = ?auto_468819 ?auto_468832 ) ) ( not ( = ?auto_468820 ?auto_468821 ) ) ( not ( = ?auto_468820 ?auto_468822 ) ) ( not ( = ?auto_468820 ?auto_468823 ) ) ( not ( = ?auto_468820 ?auto_468824 ) ) ( not ( = ?auto_468820 ?auto_468825 ) ) ( not ( = ?auto_468820 ?auto_468826 ) ) ( not ( = ?auto_468820 ?auto_468827 ) ) ( not ( = ?auto_468820 ?auto_468828 ) ) ( not ( = ?auto_468820 ?auto_468829 ) ) ( not ( = ?auto_468820 ?auto_468830 ) ) ( not ( = ?auto_468820 ?auto_468831 ) ) ( not ( = ?auto_468820 ?auto_468832 ) ) ( not ( = ?auto_468821 ?auto_468822 ) ) ( not ( = ?auto_468821 ?auto_468823 ) ) ( not ( = ?auto_468821 ?auto_468824 ) ) ( not ( = ?auto_468821 ?auto_468825 ) ) ( not ( = ?auto_468821 ?auto_468826 ) ) ( not ( = ?auto_468821 ?auto_468827 ) ) ( not ( = ?auto_468821 ?auto_468828 ) ) ( not ( = ?auto_468821 ?auto_468829 ) ) ( not ( = ?auto_468821 ?auto_468830 ) ) ( not ( = ?auto_468821 ?auto_468831 ) ) ( not ( = ?auto_468821 ?auto_468832 ) ) ( not ( = ?auto_468822 ?auto_468823 ) ) ( not ( = ?auto_468822 ?auto_468824 ) ) ( not ( = ?auto_468822 ?auto_468825 ) ) ( not ( = ?auto_468822 ?auto_468826 ) ) ( not ( = ?auto_468822 ?auto_468827 ) ) ( not ( = ?auto_468822 ?auto_468828 ) ) ( not ( = ?auto_468822 ?auto_468829 ) ) ( not ( = ?auto_468822 ?auto_468830 ) ) ( not ( = ?auto_468822 ?auto_468831 ) ) ( not ( = ?auto_468822 ?auto_468832 ) ) ( not ( = ?auto_468823 ?auto_468824 ) ) ( not ( = ?auto_468823 ?auto_468825 ) ) ( not ( = ?auto_468823 ?auto_468826 ) ) ( not ( = ?auto_468823 ?auto_468827 ) ) ( not ( = ?auto_468823 ?auto_468828 ) ) ( not ( = ?auto_468823 ?auto_468829 ) ) ( not ( = ?auto_468823 ?auto_468830 ) ) ( not ( = ?auto_468823 ?auto_468831 ) ) ( not ( = ?auto_468823 ?auto_468832 ) ) ( not ( = ?auto_468824 ?auto_468825 ) ) ( not ( = ?auto_468824 ?auto_468826 ) ) ( not ( = ?auto_468824 ?auto_468827 ) ) ( not ( = ?auto_468824 ?auto_468828 ) ) ( not ( = ?auto_468824 ?auto_468829 ) ) ( not ( = ?auto_468824 ?auto_468830 ) ) ( not ( = ?auto_468824 ?auto_468831 ) ) ( not ( = ?auto_468824 ?auto_468832 ) ) ( not ( = ?auto_468825 ?auto_468826 ) ) ( not ( = ?auto_468825 ?auto_468827 ) ) ( not ( = ?auto_468825 ?auto_468828 ) ) ( not ( = ?auto_468825 ?auto_468829 ) ) ( not ( = ?auto_468825 ?auto_468830 ) ) ( not ( = ?auto_468825 ?auto_468831 ) ) ( not ( = ?auto_468825 ?auto_468832 ) ) ( not ( = ?auto_468826 ?auto_468827 ) ) ( not ( = ?auto_468826 ?auto_468828 ) ) ( not ( = ?auto_468826 ?auto_468829 ) ) ( not ( = ?auto_468826 ?auto_468830 ) ) ( not ( = ?auto_468826 ?auto_468831 ) ) ( not ( = ?auto_468826 ?auto_468832 ) ) ( not ( = ?auto_468827 ?auto_468828 ) ) ( not ( = ?auto_468827 ?auto_468829 ) ) ( not ( = ?auto_468827 ?auto_468830 ) ) ( not ( = ?auto_468827 ?auto_468831 ) ) ( not ( = ?auto_468827 ?auto_468832 ) ) ( not ( = ?auto_468828 ?auto_468829 ) ) ( not ( = ?auto_468828 ?auto_468830 ) ) ( not ( = ?auto_468828 ?auto_468831 ) ) ( not ( = ?auto_468828 ?auto_468832 ) ) ( not ( = ?auto_468829 ?auto_468830 ) ) ( not ( = ?auto_468829 ?auto_468831 ) ) ( not ( = ?auto_468829 ?auto_468832 ) ) ( not ( = ?auto_468830 ?auto_468831 ) ) ( not ( = ?auto_468830 ?auto_468832 ) ) ( not ( = ?auto_468831 ?auto_468832 ) ) ( ON ?auto_468830 ?auto_468831 ) ( ON ?auto_468829 ?auto_468830 ) ( ON ?auto_468828 ?auto_468829 ) ( ON ?auto_468827 ?auto_468828 ) ( ON ?auto_468826 ?auto_468827 ) ( ON ?auto_468825 ?auto_468826 ) ( CLEAR ?auto_468823 ) ( ON ?auto_468824 ?auto_468825 ) ( CLEAR ?auto_468824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_468818 ?auto_468819 ?auto_468820 ?auto_468821 ?auto_468822 ?auto_468823 ?auto_468824 )
      ( MAKE-14PILE ?auto_468818 ?auto_468819 ?auto_468820 ?auto_468821 ?auto_468822 ?auto_468823 ?auto_468824 ?auto_468825 ?auto_468826 ?auto_468827 ?auto_468828 ?auto_468829 ?auto_468830 ?auto_468831 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_468876 - BLOCK
      ?auto_468877 - BLOCK
      ?auto_468878 - BLOCK
      ?auto_468879 - BLOCK
      ?auto_468880 - BLOCK
      ?auto_468881 - BLOCK
      ?auto_468882 - BLOCK
      ?auto_468883 - BLOCK
      ?auto_468884 - BLOCK
      ?auto_468885 - BLOCK
      ?auto_468886 - BLOCK
      ?auto_468887 - BLOCK
      ?auto_468888 - BLOCK
      ?auto_468889 - BLOCK
    )
    :vars
    (
      ?auto_468890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468889 ?auto_468890 ) ( ON-TABLE ?auto_468876 ) ( ON ?auto_468877 ?auto_468876 ) ( ON ?auto_468878 ?auto_468877 ) ( ON ?auto_468879 ?auto_468878 ) ( ON ?auto_468880 ?auto_468879 ) ( not ( = ?auto_468876 ?auto_468877 ) ) ( not ( = ?auto_468876 ?auto_468878 ) ) ( not ( = ?auto_468876 ?auto_468879 ) ) ( not ( = ?auto_468876 ?auto_468880 ) ) ( not ( = ?auto_468876 ?auto_468881 ) ) ( not ( = ?auto_468876 ?auto_468882 ) ) ( not ( = ?auto_468876 ?auto_468883 ) ) ( not ( = ?auto_468876 ?auto_468884 ) ) ( not ( = ?auto_468876 ?auto_468885 ) ) ( not ( = ?auto_468876 ?auto_468886 ) ) ( not ( = ?auto_468876 ?auto_468887 ) ) ( not ( = ?auto_468876 ?auto_468888 ) ) ( not ( = ?auto_468876 ?auto_468889 ) ) ( not ( = ?auto_468876 ?auto_468890 ) ) ( not ( = ?auto_468877 ?auto_468878 ) ) ( not ( = ?auto_468877 ?auto_468879 ) ) ( not ( = ?auto_468877 ?auto_468880 ) ) ( not ( = ?auto_468877 ?auto_468881 ) ) ( not ( = ?auto_468877 ?auto_468882 ) ) ( not ( = ?auto_468877 ?auto_468883 ) ) ( not ( = ?auto_468877 ?auto_468884 ) ) ( not ( = ?auto_468877 ?auto_468885 ) ) ( not ( = ?auto_468877 ?auto_468886 ) ) ( not ( = ?auto_468877 ?auto_468887 ) ) ( not ( = ?auto_468877 ?auto_468888 ) ) ( not ( = ?auto_468877 ?auto_468889 ) ) ( not ( = ?auto_468877 ?auto_468890 ) ) ( not ( = ?auto_468878 ?auto_468879 ) ) ( not ( = ?auto_468878 ?auto_468880 ) ) ( not ( = ?auto_468878 ?auto_468881 ) ) ( not ( = ?auto_468878 ?auto_468882 ) ) ( not ( = ?auto_468878 ?auto_468883 ) ) ( not ( = ?auto_468878 ?auto_468884 ) ) ( not ( = ?auto_468878 ?auto_468885 ) ) ( not ( = ?auto_468878 ?auto_468886 ) ) ( not ( = ?auto_468878 ?auto_468887 ) ) ( not ( = ?auto_468878 ?auto_468888 ) ) ( not ( = ?auto_468878 ?auto_468889 ) ) ( not ( = ?auto_468878 ?auto_468890 ) ) ( not ( = ?auto_468879 ?auto_468880 ) ) ( not ( = ?auto_468879 ?auto_468881 ) ) ( not ( = ?auto_468879 ?auto_468882 ) ) ( not ( = ?auto_468879 ?auto_468883 ) ) ( not ( = ?auto_468879 ?auto_468884 ) ) ( not ( = ?auto_468879 ?auto_468885 ) ) ( not ( = ?auto_468879 ?auto_468886 ) ) ( not ( = ?auto_468879 ?auto_468887 ) ) ( not ( = ?auto_468879 ?auto_468888 ) ) ( not ( = ?auto_468879 ?auto_468889 ) ) ( not ( = ?auto_468879 ?auto_468890 ) ) ( not ( = ?auto_468880 ?auto_468881 ) ) ( not ( = ?auto_468880 ?auto_468882 ) ) ( not ( = ?auto_468880 ?auto_468883 ) ) ( not ( = ?auto_468880 ?auto_468884 ) ) ( not ( = ?auto_468880 ?auto_468885 ) ) ( not ( = ?auto_468880 ?auto_468886 ) ) ( not ( = ?auto_468880 ?auto_468887 ) ) ( not ( = ?auto_468880 ?auto_468888 ) ) ( not ( = ?auto_468880 ?auto_468889 ) ) ( not ( = ?auto_468880 ?auto_468890 ) ) ( not ( = ?auto_468881 ?auto_468882 ) ) ( not ( = ?auto_468881 ?auto_468883 ) ) ( not ( = ?auto_468881 ?auto_468884 ) ) ( not ( = ?auto_468881 ?auto_468885 ) ) ( not ( = ?auto_468881 ?auto_468886 ) ) ( not ( = ?auto_468881 ?auto_468887 ) ) ( not ( = ?auto_468881 ?auto_468888 ) ) ( not ( = ?auto_468881 ?auto_468889 ) ) ( not ( = ?auto_468881 ?auto_468890 ) ) ( not ( = ?auto_468882 ?auto_468883 ) ) ( not ( = ?auto_468882 ?auto_468884 ) ) ( not ( = ?auto_468882 ?auto_468885 ) ) ( not ( = ?auto_468882 ?auto_468886 ) ) ( not ( = ?auto_468882 ?auto_468887 ) ) ( not ( = ?auto_468882 ?auto_468888 ) ) ( not ( = ?auto_468882 ?auto_468889 ) ) ( not ( = ?auto_468882 ?auto_468890 ) ) ( not ( = ?auto_468883 ?auto_468884 ) ) ( not ( = ?auto_468883 ?auto_468885 ) ) ( not ( = ?auto_468883 ?auto_468886 ) ) ( not ( = ?auto_468883 ?auto_468887 ) ) ( not ( = ?auto_468883 ?auto_468888 ) ) ( not ( = ?auto_468883 ?auto_468889 ) ) ( not ( = ?auto_468883 ?auto_468890 ) ) ( not ( = ?auto_468884 ?auto_468885 ) ) ( not ( = ?auto_468884 ?auto_468886 ) ) ( not ( = ?auto_468884 ?auto_468887 ) ) ( not ( = ?auto_468884 ?auto_468888 ) ) ( not ( = ?auto_468884 ?auto_468889 ) ) ( not ( = ?auto_468884 ?auto_468890 ) ) ( not ( = ?auto_468885 ?auto_468886 ) ) ( not ( = ?auto_468885 ?auto_468887 ) ) ( not ( = ?auto_468885 ?auto_468888 ) ) ( not ( = ?auto_468885 ?auto_468889 ) ) ( not ( = ?auto_468885 ?auto_468890 ) ) ( not ( = ?auto_468886 ?auto_468887 ) ) ( not ( = ?auto_468886 ?auto_468888 ) ) ( not ( = ?auto_468886 ?auto_468889 ) ) ( not ( = ?auto_468886 ?auto_468890 ) ) ( not ( = ?auto_468887 ?auto_468888 ) ) ( not ( = ?auto_468887 ?auto_468889 ) ) ( not ( = ?auto_468887 ?auto_468890 ) ) ( not ( = ?auto_468888 ?auto_468889 ) ) ( not ( = ?auto_468888 ?auto_468890 ) ) ( not ( = ?auto_468889 ?auto_468890 ) ) ( ON ?auto_468888 ?auto_468889 ) ( ON ?auto_468887 ?auto_468888 ) ( ON ?auto_468886 ?auto_468887 ) ( ON ?auto_468885 ?auto_468886 ) ( ON ?auto_468884 ?auto_468885 ) ( ON ?auto_468883 ?auto_468884 ) ( ON ?auto_468882 ?auto_468883 ) ( CLEAR ?auto_468880 ) ( ON ?auto_468881 ?auto_468882 ) ( CLEAR ?auto_468881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_468876 ?auto_468877 ?auto_468878 ?auto_468879 ?auto_468880 ?auto_468881 )
      ( MAKE-14PILE ?auto_468876 ?auto_468877 ?auto_468878 ?auto_468879 ?auto_468880 ?auto_468881 ?auto_468882 ?auto_468883 ?auto_468884 ?auto_468885 ?auto_468886 ?auto_468887 ?auto_468888 ?auto_468889 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_468934 - BLOCK
      ?auto_468935 - BLOCK
      ?auto_468936 - BLOCK
      ?auto_468937 - BLOCK
      ?auto_468938 - BLOCK
      ?auto_468939 - BLOCK
      ?auto_468940 - BLOCK
      ?auto_468941 - BLOCK
      ?auto_468942 - BLOCK
      ?auto_468943 - BLOCK
      ?auto_468944 - BLOCK
      ?auto_468945 - BLOCK
      ?auto_468946 - BLOCK
      ?auto_468947 - BLOCK
    )
    :vars
    (
      ?auto_468948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_468947 ?auto_468948 ) ( ON-TABLE ?auto_468934 ) ( ON ?auto_468935 ?auto_468934 ) ( ON ?auto_468936 ?auto_468935 ) ( ON ?auto_468937 ?auto_468936 ) ( not ( = ?auto_468934 ?auto_468935 ) ) ( not ( = ?auto_468934 ?auto_468936 ) ) ( not ( = ?auto_468934 ?auto_468937 ) ) ( not ( = ?auto_468934 ?auto_468938 ) ) ( not ( = ?auto_468934 ?auto_468939 ) ) ( not ( = ?auto_468934 ?auto_468940 ) ) ( not ( = ?auto_468934 ?auto_468941 ) ) ( not ( = ?auto_468934 ?auto_468942 ) ) ( not ( = ?auto_468934 ?auto_468943 ) ) ( not ( = ?auto_468934 ?auto_468944 ) ) ( not ( = ?auto_468934 ?auto_468945 ) ) ( not ( = ?auto_468934 ?auto_468946 ) ) ( not ( = ?auto_468934 ?auto_468947 ) ) ( not ( = ?auto_468934 ?auto_468948 ) ) ( not ( = ?auto_468935 ?auto_468936 ) ) ( not ( = ?auto_468935 ?auto_468937 ) ) ( not ( = ?auto_468935 ?auto_468938 ) ) ( not ( = ?auto_468935 ?auto_468939 ) ) ( not ( = ?auto_468935 ?auto_468940 ) ) ( not ( = ?auto_468935 ?auto_468941 ) ) ( not ( = ?auto_468935 ?auto_468942 ) ) ( not ( = ?auto_468935 ?auto_468943 ) ) ( not ( = ?auto_468935 ?auto_468944 ) ) ( not ( = ?auto_468935 ?auto_468945 ) ) ( not ( = ?auto_468935 ?auto_468946 ) ) ( not ( = ?auto_468935 ?auto_468947 ) ) ( not ( = ?auto_468935 ?auto_468948 ) ) ( not ( = ?auto_468936 ?auto_468937 ) ) ( not ( = ?auto_468936 ?auto_468938 ) ) ( not ( = ?auto_468936 ?auto_468939 ) ) ( not ( = ?auto_468936 ?auto_468940 ) ) ( not ( = ?auto_468936 ?auto_468941 ) ) ( not ( = ?auto_468936 ?auto_468942 ) ) ( not ( = ?auto_468936 ?auto_468943 ) ) ( not ( = ?auto_468936 ?auto_468944 ) ) ( not ( = ?auto_468936 ?auto_468945 ) ) ( not ( = ?auto_468936 ?auto_468946 ) ) ( not ( = ?auto_468936 ?auto_468947 ) ) ( not ( = ?auto_468936 ?auto_468948 ) ) ( not ( = ?auto_468937 ?auto_468938 ) ) ( not ( = ?auto_468937 ?auto_468939 ) ) ( not ( = ?auto_468937 ?auto_468940 ) ) ( not ( = ?auto_468937 ?auto_468941 ) ) ( not ( = ?auto_468937 ?auto_468942 ) ) ( not ( = ?auto_468937 ?auto_468943 ) ) ( not ( = ?auto_468937 ?auto_468944 ) ) ( not ( = ?auto_468937 ?auto_468945 ) ) ( not ( = ?auto_468937 ?auto_468946 ) ) ( not ( = ?auto_468937 ?auto_468947 ) ) ( not ( = ?auto_468937 ?auto_468948 ) ) ( not ( = ?auto_468938 ?auto_468939 ) ) ( not ( = ?auto_468938 ?auto_468940 ) ) ( not ( = ?auto_468938 ?auto_468941 ) ) ( not ( = ?auto_468938 ?auto_468942 ) ) ( not ( = ?auto_468938 ?auto_468943 ) ) ( not ( = ?auto_468938 ?auto_468944 ) ) ( not ( = ?auto_468938 ?auto_468945 ) ) ( not ( = ?auto_468938 ?auto_468946 ) ) ( not ( = ?auto_468938 ?auto_468947 ) ) ( not ( = ?auto_468938 ?auto_468948 ) ) ( not ( = ?auto_468939 ?auto_468940 ) ) ( not ( = ?auto_468939 ?auto_468941 ) ) ( not ( = ?auto_468939 ?auto_468942 ) ) ( not ( = ?auto_468939 ?auto_468943 ) ) ( not ( = ?auto_468939 ?auto_468944 ) ) ( not ( = ?auto_468939 ?auto_468945 ) ) ( not ( = ?auto_468939 ?auto_468946 ) ) ( not ( = ?auto_468939 ?auto_468947 ) ) ( not ( = ?auto_468939 ?auto_468948 ) ) ( not ( = ?auto_468940 ?auto_468941 ) ) ( not ( = ?auto_468940 ?auto_468942 ) ) ( not ( = ?auto_468940 ?auto_468943 ) ) ( not ( = ?auto_468940 ?auto_468944 ) ) ( not ( = ?auto_468940 ?auto_468945 ) ) ( not ( = ?auto_468940 ?auto_468946 ) ) ( not ( = ?auto_468940 ?auto_468947 ) ) ( not ( = ?auto_468940 ?auto_468948 ) ) ( not ( = ?auto_468941 ?auto_468942 ) ) ( not ( = ?auto_468941 ?auto_468943 ) ) ( not ( = ?auto_468941 ?auto_468944 ) ) ( not ( = ?auto_468941 ?auto_468945 ) ) ( not ( = ?auto_468941 ?auto_468946 ) ) ( not ( = ?auto_468941 ?auto_468947 ) ) ( not ( = ?auto_468941 ?auto_468948 ) ) ( not ( = ?auto_468942 ?auto_468943 ) ) ( not ( = ?auto_468942 ?auto_468944 ) ) ( not ( = ?auto_468942 ?auto_468945 ) ) ( not ( = ?auto_468942 ?auto_468946 ) ) ( not ( = ?auto_468942 ?auto_468947 ) ) ( not ( = ?auto_468942 ?auto_468948 ) ) ( not ( = ?auto_468943 ?auto_468944 ) ) ( not ( = ?auto_468943 ?auto_468945 ) ) ( not ( = ?auto_468943 ?auto_468946 ) ) ( not ( = ?auto_468943 ?auto_468947 ) ) ( not ( = ?auto_468943 ?auto_468948 ) ) ( not ( = ?auto_468944 ?auto_468945 ) ) ( not ( = ?auto_468944 ?auto_468946 ) ) ( not ( = ?auto_468944 ?auto_468947 ) ) ( not ( = ?auto_468944 ?auto_468948 ) ) ( not ( = ?auto_468945 ?auto_468946 ) ) ( not ( = ?auto_468945 ?auto_468947 ) ) ( not ( = ?auto_468945 ?auto_468948 ) ) ( not ( = ?auto_468946 ?auto_468947 ) ) ( not ( = ?auto_468946 ?auto_468948 ) ) ( not ( = ?auto_468947 ?auto_468948 ) ) ( ON ?auto_468946 ?auto_468947 ) ( ON ?auto_468945 ?auto_468946 ) ( ON ?auto_468944 ?auto_468945 ) ( ON ?auto_468943 ?auto_468944 ) ( ON ?auto_468942 ?auto_468943 ) ( ON ?auto_468941 ?auto_468942 ) ( ON ?auto_468940 ?auto_468941 ) ( ON ?auto_468939 ?auto_468940 ) ( CLEAR ?auto_468937 ) ( ON ?auto_468938 ?auto_468939 ) ( CLEAR ?auto_468938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_468934 ?auto_468935 ?auto_468936 ?auto_468937 ?auto_468938 )
      ( MAKE-14PILE ?auto_468934 ?auto_468935 ?auto_468936 ?auto_468937 ?auto_468938 ?auto_468939 ?auto_468940 ?auto_468941 ?auto_468942 ?auto_468943 ?auto_468944 ?auto_468945 ?auto_468946 ?auto_468947 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_468992 - BLOCK
      ?auto_468993 - BLOCK
      ?auto_468994 - BLOCK
      ?auto_468995 - BLOCK
      ?auto_468996 - BLOCK
      ?auto_468997 - BLOCK
      ?auto_468998 - BLOCK
      ?auto_468999 - BLOCK
      ?auto_469000 - BLOCK
      ?auto_469001 - BLOCK
      ?auto_469002 - BLOCK
      ?auto_469003 - BLOCK
      ?auto_469004 - BLOCK
      ?auto_469005 - BLOCK
    )
    :vars
    (
      ?auto_469006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469005 ?auto_469006 ) ( ON-TABLE ?auto_468992 ) ( ON ?auto_468993 ?auto_468992 ) ( ON ?auto_468994 ?auto_468993 ) ( not ( = ?auto_468992 ?auto_468993 ) ) ( not ( = ?auto_468992 ?auto_468994 ) ) ( not ( = ?auto_468992 ?auto_468995 ) ) ( not ( = ?auto_468992 ?auto_468996 ) ) ( not ( = ?auto_468992 ?auto_468997 ) ) ( not ( = ?auto_468992 ?auto_468998 ) ) ( not ( = ?auto_468992 ?auto_468999 ) ) ( not ( = ?auto_468992 ?auto_469000 ) ) ( not ( = ?auto_468992 ?auto_469001 ) ) ( not ( = ?auto_468992 ?auto_469002 ) ) ( not ( = ?auto_468992 ?auto_469003 ) ) ( not ( = ?auto_468992 ?auto_469004 ) ) ( not ( = ?auto_468992 ?auto_469005 ) ) ( not ( = ?auto_468992 ?auto_469006 ) ) ( not ( = ?auto_468993 ?auto_468994 ) ) ( not ( = ?auto_468993 ?auto_468995 ) ) ( not ( = ?auto_468993 ?auto_468996 ) ) ( not ( = ?auto_468993 ?auto_468997 ) ) ( not ( = ?auto_468993 ?auto_468998 ) ) ( not ( = ?auto_468993 ?auto_468999 ) ) ( not ( = ?auto_468993 ?auto_469000 ) ) ( not ( = ?auto_468993 ?auto_469001 ) ) ( not ( = ?auto_468993 ?auto_469002 ) ) ( not ( = ?auto_468993 ?auto_469003 ) ) ( not ( = ?auto_468993 ?auto_469004 ) ) ( not ( = ?auto_468993 ?auto_469005 ) ) ( not ( = ?auto_468993 ?auto_469006 ) ) ( not ( = ?auto_468994 ?auto_468995 ) ) ( not ( = ?auto_468994 ?auto_468996 ) ) ( not ( = ?auto_468994 ?auto_468997 ) ) ( not ( = ?auto_468994 ?auto_468998 ) ) ( not ( = ?auto_468994 ?auto_468999 ) ) ( not ( = ?auto_468994 ?auto_469000 ) ) ( not ( = ?auto_468994 ?auto_469001 ) ) ( not ( = ?auto_468994 ?auto_469002 ) ) ( not ( = ?auto_468994 ?auto_469003 ) ) ( not ( = ?auto_468994 ?auto_469004 ) ) ( not ( = ?auto_468994 ?auto_469005 ) ) ( not ( = ?auto_468994 ?auto_469006 ) ) ( not ( = ?auto_468995 ?auto_468996 ) ) ( not ( = ?auto_468995 ?auto_468997 ) ) ( not ( = ?auto_468995 ?auto_468998 ) ) ( not ( = ?auto_468995 ?auto_468999 ) ) ( not ( = ?auto_468995 ?auto_469000 ) ) ( not ( = ?auto_468995 ?auto_469001 ) ) ( not ( = ?auto_468995 ?auto_469002 ) ) ( not ( = ?auto_468995 ?auto_469003 ) ) ( not ( = ?auto_468995 ?auto_469004 ) ) ( not ( = ?auto_468995 ?auto_469005 ) ) ( not ( = ?auto_468995 ?auto_469006 ) ) ( not ( = ?auto_468996 ?auto_468997 ) ) ( not ( = ?auto_468996 ?auto_468998 ) ) ( not ( = ?auto_468996 ?auto_468999 ) ) ( not ( = ?auto_468996 ?auto_469000 ) ) ( not ( = ?auto_468996 ?auto_469001 ) ) ( not ( = ?auto_468996 ?auto_469002 ) ) ( not ( = ?auto_468996 ?auto_469003 ) ) ( not ( = ?auto_468996 ?auto_469004 ) ) ( not ( = ?auto_468996 ?auto_469005 ) ) ( not ( = ?auto_468996 ?auto_469006 ) ) ( not ( = ?auto_468997 ?auto_468998 ) ) ( not ( = ?auto_468997 ?auto_468999 ) ) ( not ( = ?auto_468997 ?auto_469000 ) ) ( not ( = ?auto_468997 ?auto_469001 ) ) ( not ( = ?auto_468997 ?auto_469002 ) ) ( not ( = ?auto_468997 ?auto_469003 ) ) ( not ( = ?auto_468997 ?auto_469004 ) ) ( not ( = ?auto_468997 ?auto_469005 ) ) ( not ( = ?auto_468997 ?auto_469006 ) ) ( not ( = ?auto_468998 ?auto_468999 ) ) ( not ( = ?auto_468998 ?auto_469000 ) ) ( not ( = ?auto_468998 ?auto_469001 ) ) ( not ( = ?auto_468998 ?auto_469002 ) ) ( not ( = ?auto_468998 ?auto_469003 ) ) ( not ( = ?auto_468998 ?auto_469004 ) ) ( not ( = ?auto_468998 ?auto_469005 ) ) ( not ( = ?auto_468998 ?auto_469006 ) ) ( not ( = ?auto_468999 ?auto_469000 ) ) ( not ( = ?auto_468999 ?auto_469001 ) ) ( not ( = ?auto_468999 ?auto_469002 ) ) ( not ( = ?auto_468999 ?auto_469003 ) ) ( not ( = ?auto_468999 ?auto_469004 ) ) ( not ( = ?auto_468999 ?auto_469005 ) ) ( not ( = ?auto_468999 ?auto_469006 ) ) ( not ( = ?auto_469000 ?auto_469001 ) ) ( not ( = ?auto_469000 ?auto_469002 ) ) ( not ( = ?auto_469000 ?auto_469003 ) ) ( not ( = ?auto_469000 ?auto_469004 ) ) ( not ( = ?auto_469000 ?auto_469005 ) ) ( not ( = ?auto_469000 ?auto_469006 ) ) ( not ( = ?auto_469001 ?auto_469002 ) ) ( not ( = ?auto_469001 ?auto_469003 ) ) ( not ( = ?auto_469001 ?auto_469004 ) ) ( not ( = ?auto_469001 ?auto_469005 ) ) ( not ( = ?auto_469001 ?auto_469006 ) ) ( not ( = ?auto_469002 ?auto_469003 ) ) ( not ( = ?auto_469002 ?auto_469004 ) ) ( not ( = ?auto_469002 ?auto_469005 ) ) ( not ( = ?auto_469002 ?auto_469006 ) ) ( not ( = ?auto_469003 ?auto_469004 ) ) ( not ( = ?auto_469003 ?auto_469005 ) ) ( not ( = ?auto_469003 ?auto_469006 ) ) ( not ( = ?auto_469004 ?auto_469005 ) ) ( not ( = ?auto_469004 ?auto_469006 ) ) ( not ( = ?auto_469005 ?auto_469006 ) ) ( ON ?auto_469004 ?auto_469005 ) ( ON ?auto_469003 ?auto_469004 ) ( ON ?auto_469002 ?auto_469003 ) ( ON ?auto_469001 ?auto_469002 ) ( ON ?auto_469000 ?auto_469001 ) ( ON ?auto_468999 ?auto_469000 ) ( ON ?auto_468998 ?auto_468999 ) ( ON ?auto_468997 ?auto_468998 ) ( ON ?auto_468996 ?auto_468997 ) ( CLEAR ?auto_468994 ) ( ON ?auto_468995 ?auto_468996 ) ( CLEAR ?auto_468995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_468992 ?auto_468993 ?auto_468994 ?auto_468995 )
      ( MAKE-14PILE ?auto_468992 ?auto_468993 ?auto_468994 ?auto_468995 ?auto_468996 ?auto_468997 ?auto_468998 ?auto_468999 ?auto_469000 ?auto_469001 ?auto_469002 ?auto_469003 ?auto_469004 ?auto_469005 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_469050 - BLOCK
      ?auto_469051 - BLOCK
      ?auto_469052 - BLOCK
      ?auto_469053 - BLOCK
      ?auto_469054 - BLOCK
      ?auto_469055 - BLOCK
      ?auto_469056 - BLOCK
      ?auto_469057 - BLOCK
      ?auto_469058 - BLOCK
      ?auto_469059 - BLOCK
      ?auto_469060 - BLOCK
      ?auto_469061 - BLOCK
      ?auto_469062 - BLOCK
      ?auto_469063 - BLOCK
    )
    :vars
    (
      ?auto_469064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469063 ?auto_469064 ) ( ON-TABLE ?auto_469050 ) ( ON ?auto_469051 ?auto_469050 ) ( not ( = ?auto_469050 ?auto_469051 ) ) ( not ( = ?auto_469050 ?auto_469052 ) ) ( not ( = ?auto_469050 ?auto_469053 ) ) ( not ( = ?auto_469050 ?auto_469054 ) ) ( not ( = ?auto_469050 ?auto_469055 ) ) ( not ( = ?auto_469050 ?auto_469056 ) ) ( not ( = ?auto_469050 ?auto_469057 ) ) ( not ( = ?auto_469050 ?auto_469058 ) ) ( not ( = ?auto_469050 ?auto_469059 ) ) ( not ( = ?auto_469050 ?auto_469060 ) ) ( not ( = ?auto_469050 ?auto_469061 ) ) ( not ( = ?auto_469050 ?auto_469062 ) ) ( not ( = ?auto_469050 ?auto_469063 ) ) ( not ( = ?auto_469050 ?auto_469064 ) ) ( not ( = ?auto_469051 ?auto_469052 ) ) ( not ( = ?auto_469051 ?auto_469053 ) ) ( not ( = ?auto_469051 ?auto_469054 ) ) ( not ( = ?auto_469051 ?auto_469055 ) ) ( not ( = ?auto_469051 ?auto_469056 ) ) ( not ( = ?auto_469051 ?auto_469057 ) ) ( not ( = ?auto_469051 ?auto_469058 ) ) ( not ( = ?auto_469051 ?auto_469059 ) ) ( not ( = ?auto_469051 ?auto_469060 ) ) ( not ( = ?auto_469051 ?auto_469061 ) ) ( not ( = ?auto_469051 ?auto_469062 ) ) ( not ( = ?auto_469051 ?auto_469063 ) ) ( not ( = ?auto_469051 ?auto_469064 ) ) ( not ( = ?auto_469052 ?auto_469053 ) ) ( not ( = ?auto_469052 ?auto_469054 ) ) ( not ( = ?auto_469052 ?auto_469055 ) ) ( not ( = ?auto_469052 ?auto_469056 ) ) ( not ( = ?auto_469052 ?auto_469057 ) ) ( not ( = ?auto_469052 ?auto_469058 ) ) ( not ( = ?auto_469052 ?auto_469059 ) ) ( not ( = ?auto_469052 ?auto_469060 ) ) ( not ( = ?auto_469052 ?auto_469061 ) ) ( not ( = ?auto_469052 ?auto_469062 ) ) ( not ( = ?auto_469052 ?auto_469063 ) ) ( not ( = ?auto_469052 ?auto_469064 ) ) ( not ( = ?auto_469053 ?auto_469054 ) ) ( not ( = ?auto_469053 ?auto_469055 ) ) ( not ( = ?auto_469053 ?auto_469056 ) ) ( not ( = ?auto_469053 ?auto_469057 ) ) ( not ( = ?auto_469053 ?auto_469058 ) ) ( not ( = ?auto_469053 ?auto_469059 ) ) ( not ( = ?auto_469053 ?auto_469060 ) ) ( not ( = ?auto_469053 ?auto_469061 ) ) ( not ( = ?auto_469053 ?auto_469062 ) ) ( not ( = ?auto_469053 ?auto_469063 ) ) ( not ( = ?auto_469053 ?auto_469064 ) ) ( not ( = ?auto_469054 ?auto_469055 ) ) ( not ( = ?auto_469054 ?auto_469056 ) ) ( not ( = ?auto_469054 ?auto_469057 ) ) ( not ( = ?auto_469054 ?auto_469058 ) ) ( not ( = ?auto_469054 ?auto_469059 ) ) ( not ( = ?auto_469054 ?auto_469060 ) ) ( not ( = ?auto_469054 ?auto_469061 ) ) ( not ( = ?auto_469054 ?auto_469062 ) ) ( not ( = ?auto_469054 ?auto_469063 ) ) ( not ( = ?auto_469054 ?auto_469064 ) ) ( not ( = ?auto_469055 ?auto_469056 ) ) ( not ( = ?auto_469055 ?auto_469057 ) ) ( not ( = ?auto_469055 ?auto_469058 ) ) ( not ( = ?auto_469055 ?auto_469059 ) ) ( not ( = ?auto_469055 ?auto_469060 ) ) ( not ( = ?auto_469055 ?auto_469061 ) ) ( not ( = ?auto_469055 ?auto_469062 ) ) ( not ( = ?auto_469055 ?auto_469063 ) ) ( not ( = ?auto_469055 ?auto_469064 ) ) ( not ( = ?auto_469056 ?auto_469057 ) ) ( not ( = ?auto_469056 ?auto_469058 ) ) ( not ( = ?auto_469056 ?auto_469059 ) ) ( not ( = ?auto_469056 ?auto_469060 ) ) ( not ( = ?auto_469056 ?auto_469061 ) ) ( not ( = ?auto_469056 ?auto_469062 ) ) ( not ( = ?auto_469056 ?auto_469063 ) ) ( not ( = ?auto_469056 ?auto_469064 ) ) ( not ( = ?auto_469057 ?auto_469058 ) ) ( not ( = ?auto_469057 ?auto_469059 ) ) ( not ( = ?auto_469057 ?auto_469060 ) ) ( not ( = ?auto_469057 ?auto_469061 ) ) ( not ( = ?auto_469057 ?auto_469062 ) ) ( not ( = ?auto_469057 ?auto_469063 ) ) ( not ( = ?auto_469057 ?auto_469064 ) ) ( not ( = ?auto_469058 ?auto_469059 ) ) ( not ( = ?auto_469058 ?auto_469060 ) ) ( not ( = ?auto_469058 ?auto_469061 ) ) ( not ( = ?auto_469058 ?auto_469062 ) ) ( not ( = ?auto_469058 ?auto_469063 ) ) ( not ( = ?auto_469058 ?auto_469064 ) ) ( not ( = ?auto_469059 ?auto_469060 ) ) ( not ( = ?auto_469059 ?auto_469061 ) ) ( not ( = ?auto_469059 ?auto_469062 ) ) ( not ( = ?auto_469059 ?auto_469063 ) ) ( not ( = ?auto_469059 ?auto_469064 ) ) ( not ( = ?auto_469060 ?auto_469061 ) ) ( not ( = ?auto_469060 ?auto_469062 ) ) ( not ( = ?auto_469060 ?auto_469063 ) ) ( not ( = ?auto_469060 ?auto_469064 ) ) ( not ( = ?auto_469061 ?auto_469062 ) ) ( not ( = ?auto_469061 ?auto_469063 ) ) ( not ( = ?auto_469061 ?auto_469064 ) ) ( not ( = ?auto_469062 ?auto_469063 ) ) ( not ( = ?auto_469062 ?auto_469064 ) ) ( not ( = ?auto_469063 ?auto_469064 ) ) ( ON ?auto_469062 ?auto_469063 ) ( ON ?auto_469061 ?auto_469062 ) ( ON ?auto_469060 ?auto_469061 ) ( ON ?auto_469059 ?auto_469060 ) ( ON ?auto_469058 ?auto_469059 ) ( ON ?auto_469057 ?auto_469058 ) ( ON ?auto_469056 ?auto_469057 ) ( ON ?auto_469055 ?auto_469056 ) ( ON ?auto_469054 ?auto_469055 ) ( ON ?auto_469053 ?auto_469054 ) ( CLEAR ?auto_469051 ) ( ON ?auto_469052 ?auto_469053 ) ( CLEAR ?auto_469052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_469050 ?auto_469051 ?auto_469052 )
      ( MAKE-14PILE ?auto_469050 ?auto_469051 ?auto_469052 ?auto_469053 ?auto_469054 ?auto_469055 ?auto_469056 ?auto_469057 ?auto_469058 ?auto_469059 ?auto_469060 ?auto_469061 ?auto_469062 ?auto_469063 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_469108 - BLOCK
      ?auto_469109 - BLOCK
      ?auto_469110 - BLOCK
      ?auto_469111 - BLOCK
      ?auto_469112 - BLOCK
      ?auto_469113 - BLOCK
      ?auto_469114 - BLOCK
      ?auto_469115 - BLOCK
      ?auto_469116 - BLOCK
      ?auto_469117 - BLOCK
      ?auto_469118 - BLOCK
      ?auto_469119 - BLOCK
      ?auto_469120 - BLOCK
      ?auto_469121 - BLOCK
    )
    :vars
    (
      ?auto_469122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469121 ?auto_469122 ) ( ON-TABLE ?auto_469108 ) ( not ( = ?auto_469108 ?auto_469109 ) ) ( not ( = ?auto_469108 ?auto_469110 ) ) ( not ( = ?auto_469108 ?auto_469111 ) ) ( not ( = ?auto_469108 ?auto_469112 ) ) ( not ( = ?auto_469108 ?auto_469113 ) ) ( not ( = ?auto_469108 ?auto_469114 ) ) ( not ( = ?auto_469108 ?auto_469115 ) ) ( not ( = ?auto_469108 ?auto_469116 ) ) ( not ( = ?auto_469108 ?auto_469117 ) ) ( not ( = ?auto_469108 ?auto_469118 ) ) ( not ( = ?auto_469108 ?auto_469119 ) ) ( not ( = ?auto_469108 ?auto_469120 ) ) ( not ( = ?auto_469108 ?auto_469121 ) ) ( not ( = ?auto_469108 ?auto_469122 ) ) ( not ( = ?auto_469109 ?auto_469110 ) ) ( not ( = ?auto_469109 ?auto_469111 ) ) ( not ( = ?auto_469109 ?auto_469112 ) ) ( not ( = ?auto_469109 ?auto_469113 ) ) ( not ( = ?auto_469109 ?auto_469114 ) ) ( not ( = ?auto_469109 ?auto_469115 ) ) ( not ( = ?auto_469109 ?auto_469116 ) ) ( not ( = ?auto_469109 ?auto_469117 ) ) ( not ( = ?auto_469109 ?auto_469118 ) ) ( not ( = ?auto_469109 ?auto_469119 ) ) ( not ( = ?auto_469109 ?auto_469120 ) ) ( not ( = ?auto_469109 ?auto_469121 ) ) ( not ( = ?auto_469109 ?auto_469122 ) ) ( not ( = ?auto_469110 ?auto_469111 ) ) ( not ( = ?auto_469110 ?auto_469112 ) ) ( not ( = ?auto_469110 ?auto_469113 ) ) ( not ( = ?auto_469110 ?auto_469114 ) ) ( not ( = ?auto_469110 ?auto_469115 ) ) ( not ( = ?auto_469110 ?auto_469116 ) ) ( not ( = ?auto_469110 ?auto_469117 ) ) ( not ( = ?auto_469110 ?auto_469118 ) ) ( not ( = ?auto_469110 ?auto_469119 ) ) ( not ( = ?auto_469110 ?auto_469120 ) ) ( not ( = ?auto_469110 ?auto_469121 ) ) ( not ( = ?auto_469110 ?auto_469122 ) ) ( not ( = ?auto_469111 ?auto_469112 ) ) ( not ( = ?auto_469111 ?auto_469113 ) ) ( not ( = ?auto_469111 ?auto_469114 ) ) ( not ( = ?auto_469111 ?auto_469115 ) ) ( not ( = ?auto_469111 ?auto_469116 ) ) ( not ( = ?auto_469111 ?auto_469117 ) ) ( not ( = ?auto_469111 ?auto_469118 ) ) ( not ( = ?auto_469111 ?auto_469119 ) ) ( not ( = ?auto_469111 ?auto_469120 ) ) ( not ( = ?auto_469111 ?auto_469121 ) ) ( not ( = ?auto_469111 ?auto_469122 ) ) ( not ( = ?auto_469112 ?auto_469113 ) ) ( not ( = ?auto_469112 ?auto_469114 ) ) ( not ( = ?auto_469112 ?auto_469115 ) ) ( not ( = ?auto_469112 ?auto_469116 ) ) ( not ( = ?auto_469112 ?auto_469117 ) ) ( not ( = ?auto_469112 ?auto_469118 ) ) ( not ( = ?auto_469112 ?auto_469119 ) ) ( not ( = ?auto_469112 ?auto_469120 ) ) ( not ( = ?auto_469112 ?auto_469121 ) ) ( not ( = ?auto_469112 ?auto_469122 ) ) ( not ( = ?auto_469113 ?auto_469114 ) ) ( not ( = ?auto_469113 ?auto_469115 ) ) ( not ( = ?auto_469113 ?auto_469116 ) ) ( not ( = ?auto_469113 ?auto_469117 ) ) ( not ( = ?auto_469113 ?auto_469118 ) ) ( not ( = ?auto_469113 ?auto_469119 ) ) ( not ( = ?auto_469113 ?auto_469120 ) ) ( not ( = ?auto_469113 ?auto_469121 ) ) ( not ( = ?auto_469113 ?auto_469122 ) ) ( not ( = ?auto_469114 ?auto_469115 ) ) ( not ( = ?auto_469114 ?auto_469116 ) ) ( not ( = ?auto_469114 ?auto_469117 ) ) ( not ( = ?auto_469114 ?auto_469118 ) ) ( not ( = ?auto_469114 ?auto_469119 ) ) ( not ( = ?auto_469114 ?auto_469120 ) ) ( not ( = ?auto_469114 ?auto_469121 ) ) ( not ( = ?auto_469114 ?auto_469122 ) ) ( not ( = ?auto_469115 ?auto_469116 ) ) ( not ( = ?auto_469115 ?auto_469117 ) ) ( not ( = ?auto_469115 ?auto_469118 ) ) ( not ( = ?auto_469115 ?auto_469119 ) ) ( not ( = ?auto_469115 ?auto_469120 ) ) ( not ( = ?auto_469115 ?auto_469121 ) ) ( not ( = ?auto_469115 ?auto_469122 ) ) ( not ( = ?auto_469116 ?auto_469117 ) ) ( not ( = ?auto_469116 ?auto_469118 ) ) ( not ( = ?auto_469116 ?auto_469119 ) ) ( not ( = ?auto_469116 ?auto_469120 ) ) ( not ( = ?auto_469116 ?auto_469121 ) ) ( not ( = ?auto_469116 ?auto_469122 ) ) ( not ( = ?auto_469117 ?auto_469118 ) ) ( not ( = ?auto_469117 ?auto_469119 ) ) ( not ( = ?auto_469117 ?auto_469120 ) ) ( not ( = ?auto_469117 ?auto_469121 ) ) ( not ( = ?auto_469117 ?auto_469122 ) ) ( not ( = ?auto_469118 ?auto_469119 ) ) ( not ( = ?auto_469118 ?auto_469120 ) ) ( not ( = ?auto_469118 ?auto_469121 ) ) ( not ( = ?auto_469118 ?auto_469122 ) ) ( not ( = ?auto_469119 ?auto_469120 ) ) ( not ( = ?auto_469119 ?auto_469121 ) ) ( not ( = ?auto_469119 ?auto_469122 ) ) ( not ( = ?auto_469120 ?auto_469121 ) ) ( not ( = ?auto_469120 ?auto_469122 ) ) ( not ( = ?auto_469121 ?auto_469122 ) ) ( ON ?auto_469120 ?auto_469121 ) ( ON ?auto_469119 ?auto_469120 ) ( ON ?auto_469118 ?auto_469119 ) ( ON ?auto_469117 ?auto_469118 ) ( ON ?auto_469116 ?auto_469117 ) ( ON ?auto_469115 ?auto_469116 ) ( ON ?auto_469114 ?auto_469115 ) ( ON ?auto_469113 ?auto_469114 ) ( ON ?auto_469112 ?auto_469113 ) ( ON ?auto_469111 ?auto_469112 ) ( ON ?auto_469110 ?auto_469111 ) ( CLEAR ?auto_469108 ) ( ON ?auto_469109 ?auto_469110 ) ( CLEAR ?auto_469109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_469108 ?auto_469109 )
      ( MAKE-14PILE ?auto_469108 ?auto_469109 ?auto_469110 ?auto_469111 ?auto_469112 ?auto_469113 ?auto_469114 ?auto_469115 ?auto_469116 ?auto_469117 ?auto_469118 ?auto_469119 ?auto_469120 ?auto_469121 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_469166 - BLOCK
      ?auto_469167 - BLOCK
      ?auto_469168 - BLOCK
      ?auto_469169 - BLOCK
      ?auto_469170 - BLOCK
      ?auto_469171 - BLOCK
      ?auto_469172 - BLOCK
      ?auto_469173 - BLOCK
      ?auto_469174 - BLOCK
      ?auto_469175 - BLOCK
      ?auto_469176 - BLOCK
      ?auto_469177 - BLOCK
      ?auto_469178 - BLOCK
      ?auto_469179 - BLOCK
    )
    :vars
    (
      ?auto_469180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469179 ?auto_469180 ) ( not ( = ?auto_469166 ?auto_469167 ) ) ( not ( = ?auto_469166 ?auto_469168 ) ) ( not ( = ?auto_469166 ?auto_469169 ) ) ( not ( = ?auto_469166 ?auto_469170 ) ) ( not ( = ?auto_469166 ?auto_469171 ) ) ( not ( = ?auto_469166 ?auto_469172 ) ) ( not ( = ?auto_469166 ?auto_469173 ) ) ( not ( = ?auto_469166 ?auto_469174 ) ) ( not ( = ?auto_469166 ?auto_469175 ) ) ( not ( = ?auto_469166 ?auto_469176 ) ) ( not ( = ?auto_469166 ?auto_469177 ) ) ( not ( = ?auto_469166 ?auto_469178 ) ) ( not ( = ?auto_469166 ?auto_469179 ) ) ( not ( = ?auto_469166 ?auto_469180 ) ) ( not ( = ?auto_469167 ?auto_469168 ) ) ( not ( = ?auto_469167 ?auto_469169 ) ) ( not ( = ?auto_469167 ?auto_469170 ) ) ( not ( = ?auto_469167 ?auto_469171 ) ) ( not ( = ?auto_469167 ?auto_469172 ) ) ( not ( = ?auto_469167 ?auto_469173 ) ) ( not ( = ?auto_469167 ?auto_469174 ) ) ( not ( = ?auto_469167 ?auto_469175 ) ) ( not ( = ?auto_469167 ?auto_469176 ) ) ( not ( = ?auto_469167 ?auto_469177 ) ) ( not ( = ?auto_469167 ?auto_469178 ) ) ( not ( = ?auto_469167 ?auto_469179 ) ) ( not ( = ?auto_469167 ?auto_469180 ) ) ( not ( = ?auto_469168 ?auto_469169 ) ) ( not ( = ?auto_469168 ?auto_469170 ) ) ( not ( = ?auto_469168 ?auto_469171 ) ) ( not ( = ?auto_469168 ?auto_469172 ) ) ( not ( = ?auto_469168 ?auto_469173 ) ) ( not ( = ?auto_469168 ?auto_469174 ) ) ( not ( = ?auto_469168 ?auto_469175 ) ) ( not ( = ?auto_469168 ?auto_469176 ) ) ( not ( = ?auto_469168 ?auto_469177 ) ) ( not ( = ?auto_469168 ?auto_469178 ) ) ( not ( = ?auto_469168 ?auto_469179 ) ) ( not ( = ?auto_469168 ?auto_469180 ) ) ( not ( = ?auto_469169 ?auto_469170 ) ) ( not ( = ?auto_469169 ?auto_469171 ) ) ( not ( = ?auto_469169 ?auto_469172 ) ) ( not ( = ?auto_469169 ?auto_469173 ) ) ( not ( = ?auto_469169 ?auto_469174 ) ) ( not ( = ?auto_469169 ?auto_469175 ) ) ( not ( = ?auto_469169 ?auto_469176 ) ) ( not ( = ?auto_469169 ?auto_469177 ) ) ( not ( = ?auto_469169 ?auto_469178 ) ) ( not ( = ?auto_469169 ?auto_469179 ) ) ( not ( = ?auto_469169 ?auto_469180 ) ) ( not ( = ?auto_469170 ?auto_469171 ) ) ( not ( = ?auto_469170 ?auto_469172 ) ) ( not ( = ?auto_469170 ?auto_469173 ) ) ( not ( = ?auto_469170 ?auto_469174 ) ) ( not ( = ?auto_469170 ?auto_469175 ) ) ( not ( = ?auto_469170 ?auto_469176 ) ) ( not ( = ?auto_469170 ?auto_469177 ) ) ( not ( = ?auto_469170 ?auto_469178 ) ) ( not ( = ?auto_469170 ?auto_469179 ) ) ( not ( = ?auto_469170 ?auto_469180 ) ) ( not ( = ?auto_469171 ?auto_469172 ) ) ( not ( = ?auto_469171 ?auto_469173 ) ) ( not ( = ?auto_469171 ?auto_469174 ) ) ( not ( = ?auto_469171 ?auto_469175 ) ) ( not ( = ?auto_469171 ?auto_469176 ) ) ( not ( = ?auto_469171 ?auto_469177 ) ) ( not ( = ?auto_469171 ?auto_469178 ) ) ( not ( = ?auto_469171 ?auto_469179 ) ) ( not ( = ?auto_469171 ?auto_469180 ) ) ( not ( = ?auto_469172 ?auto_469173 ) ) ( not ( = ?auto_469172 ?auto_469174 ) ) ( not ( = ?auto_469172 ?auto_469175 ) ) ( not ( = ?auto_469172 ?auto_469176 ) ) ( not ( = ?auto_469172 ?auto_469177 ) ) ( not ( = ?auto_469172 ?auto_469178 ) ) ( not ( = ?auto_469172 ?auto_469179 ) ) ( not ( = ?auto_469172 ?auto_469180 ) ) ( not ( = ?auto_469173 ?auto_469174 ) ) ( not ( = ?auto_469173 ?auto_469175 ) ) ( not ( = ?auto_469173 ?auto_469176 ) ) ( not ( = ?auto_469173 ?auto_469177 ) ) ( not ( = ?auto_469173 ?auto_469178 ) ) ( not ( = ?auto_469173 ?auto_469179 ) ) ( not ( = ?auto_469173 ?auto_469180 ) ) ( not ( = ?auto_469174 ?auto_469175 ) ) ( not ( = ?auto_469174 ?auto_469176 ) ) ( not ( = ?auto_469174 ?auto_469177 ) ) ( not ( = ?auto_469174 ?auto_469178 ) ) ( not ( = ?auto_469174 ?auto_469179 ) ) ( not ( = ?auto_469174 ?auto_469180 ) ) ( not ( = ?auto_469175 ?auto_469176 ) ) ( not ( = ?auto_469175 ?auto_469177 ) ) ( not ( = ?auto_469175 ?auto_469178 ) ) ( not ( = ?auto_469175 ?auto_469179 ) ) ( not ( = ?auto_469175 ?auto_469180 ) ) ( not ( = ?auto_469176 ?auto_469177 ) ) ( not ( = ?auto_469176 ?auto_469178 ) ) ( not ( = ?auto_469176 ?auto_469179 ) ) ( not ( = ?auto_469176 ?auto_469180 ) ) ( not ( = ?auto_469177 ?auto_469178 ) ) ( not ( = ?auto_469177 ?auto_469179 ) ) ( not ( = ?auto_469177 ?auto_469180 ) ) ( not ( = ?auto_469178 ?auto_469179 ) ) ( not ( = ?auto_469178 ?auto_469180 ) ) ( not ( = ?auto_469179 ?auto_469180 ) ) ( ON ?auto_469178 ?auto_469179 ) ( ON ?auto_469177 ?auto_469178 ) ( ON ?auto_469176 ?auto_469177 ) ( ON ?auto_469175 ?auto_469176 ) ( ON ?auto_469174 ?auto_469175 ) ( ON ?auto_469173 ?auto_469174 ) ( ON ?auto_469172 ?auto_469173 ) ( ON ?auto_469171 ?auto_469172 ) ( ON ?auto_469170 ?auto_469171 ) ( ON ?auto_469169 ?auto_469170 ) ( ON ?auto_469168 ?auto_469169 ) ( ON ?auto_469167 ?auto_469168 ) ( ON ?auto_469166 ?auto_469167 ) ( CLEAR ?auto_469166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_469166 )
      ( MAKE-14PILE ?auto_469166 ?auto_469167 ?auto_469168 ?auto_469169 ?auto_469170 ?auto_469171 ?auto_469172 ?auto_469173 ?auto_469174 ?auto_469175 ?auto_469176 ?auto_469177 ?auto_469178 ?auto_469179 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_469225 - BLOCK
      ?auto_469226 - BLOCK
      ?auto_469227 - BLOCK
      ?auto_469228 - BLOCK
      ?auto_469229 - BLOCK
      ?auto_469230 - BLOCK
      ?auto_469231 - BLOCK
      ?auto_469232 - BLOCK
      ?auto_469233 - BLOCK
      ?auto_469234 - BLOCK
      ?auto_469235 - BLOCK
      ?auto_469236 - BLOCK
      ?auto_469237 - BLOCK
      ?auto_469238 - BLOCK
      ?auto_469239 - BLOCK
    )
    :vars
    (
      ?auto_469240 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_469238 ) ( ON ?auto_469239 ?auto_469240 ) ( CLEAR ?auto_469239 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_469225 ) ( ON ?auto_469226 ?auto_469225 ) ( ON ?auto_469227 ?auto_469226 ) ( ON ?auto_469228 ?auto_469227 ) ( ON ?auto_469229 ?auto_469228 ) ( ON ?auto_469230 ?auto_469229 ) ( ON ?auto_469231 ?auto_469230 ) ( ON ?auto_469232 ?auto_469231 ) ( ON ?auto_469233 ?auto_469232 ) ( ON ?auto_469234 ?auto_469233 ) ( ON ?auto_469235 ?auto_469234 ) ( ON ?auto_469236 ?auto_469235 ) ( ON ?auto_469237 ?auto_469236 ) ( ON ?auto_469238 ?auto_469237 ) ( not ( = ?auto_469225 ?auto_469226 ) ) ( not ( = ?auto_469225 ?auto_469227 ) ) ( not ( = ?auto_469225 ?auto_469228 ) ) ( not ( = ?auto_469225 ?auto_469229 ) ) ( not ( = ?auto_469225 ?auto_469230 ) ) ( not ( = ?auto_469225 ?auto_469231 ) ) ( not ( = ?auto_469225 ?auto_469232 ) ) ( not ( = ?auto_469225 ?auto_469233 ) ) ( not ( = ?auto_469225 ?auto_469234 ) ) ( not ( = ?auto_469225 ?auto_469235 ) ) ( not ( = ?auto_469225 ?auto_469236 ) ) ( not ( = ?auto_469225 ?auto_469237 ) ) ( not ( = ?auto_469225 ?auto_469238 ) ) ( not ( = ?auto_469225 ?auto_469239 ) ) ( not ( = ?auto_469225 ?auto_469240 ) ) ( not ( = ?auto_469226 ?auto_469227 ) ) ( not ( = ?auto_469226 ?auto_469228 ) ) ( not ( = ?auto_469226 ?auto_469229 ) ) ( not ( = ?auto_469226 ?auto_469230 ) ) ( not ( = ?auto_469226 ?auto_469231 ) ) ( not ( = ?auto_469226 ?auto_469232 ) ) ( not ( = ?auto_469226 ?auto_469233 ) ) ( not ( = ?auto_469226 ?auto_469234 ) ) ( not ( = ?auto_469226 ?auto_469235 ) ) ( not ( = ?auto_469226 ?auto_469236 ) ) ( not ( = ?auto_469226 ?auto_469237 ) ) ( not ( = ?auto_469226 ?auto_469238 ) ) ( not ( = ?auto_469226 ?auto_469239 ) ) ( not ( = ?auto_469226 ?auto_469240 ) ) ( not ( = ?auto_469227 ?auto_469228 ) ) ( not ( = ?auto_469227 ?auto_469229 ) ) ( not ( = ?auto_469227 ?auto_469230 ) ) ( not ( = ?auto_469227 ?auto_469231 ) ) ( not ( = ?auto_469227 ?auto_469232 ) ) ( not ( = ?auto_469227 ?auto_469233 ) ) ( not ( = ?auto_469227 ?auto_469234 ) ) ( not ( = ?auto_469227 ?auto_469235 ) ) ( not ( = ?auto_469227 ?auto_469236 ) ) ( not ( = ?auto_469227 ?auto_469237 ) ) ( not ( = ?auto_469227 ?auto_469238 ) ) ( not ( = ?auto_469227 ?auto_469239 ) ) ( not ( = ?auto_469227 ?auto_469240 ) ) ( not ( = ?auto_469228 ?auto_469229 ) ) ( not ( = ?auto_469228 ?auto_469230 ) ) ( not ( = ?auto_469228 ?auto_469231 ) ) ( not ( = ?auto_469228 ?auto_469232 ) ) ( not ( = ?auto_469228 ?auto_469233 ) ) ( not ( = ?auto_469228 ?auto_469234 ) ) ( not ( = ?auto_469228 ?auto_469235 ) ) ( not ( = ?auto_469228 ?auto_469236 ) ) ( not ( = ?auto_469228 ?auto_469237 ) ) ( not ( = ?auto_469228 ?auto_469238 ) ) ( not ( = ?auto_469228 ?auto_469239 ) ) ( not ( = ?auto_469228 ?auto_469240 ) ) ( not ( = ?auto_469229 ?auto_469230 ) ) ( not ( = ?auto_469229 ?auto_469231 ) ) ( not ( = ?auto_469229 ?auto_469232 ) ) ( not ( = ?auto_469229 ?auto_469233 ) ) ( not ( = ?auto_469229 ?auto_469234 ) ) ( not ( = ?auto_469229 ?auto_469235 ) ) ( not ( = ?auto_469229 ?auto_469236 ) ) ( not ( = ?auto_469229 ?auto_469237 ) ) ( not ( = ?auto_469229 ?auto_469238 ) ) ( not ( = ?auto_469229 ?auto_469239 ) ) ( not ( = ?auto_469229 ?auto_469240 ) ) ( not ( = ?auto_469230 ?auto_469231 ) ) ( not ( = ?auto_469230 ?auto_469232 ) ) ( not ( = ?auto_469230 ?auto_469233 ) ) ( not ( = ?auto_469230 ?auto_469234 ) ) ( not ( = ?auto_469230 ?auto_469235 ) ) ( not ( = ?auto_469230 ?auto_469236 ) ) ( not ( = ?auto_469230 ?auto_469237 ) ) ( not ( = ?auto_469230 ?auto_469238 ) ) ( not ( = ?auto_469230 ?auto_469239 ) ) ( not ( = ?auto_469230 ?auto_469240 ) ) ( not ( = ?auto_469231 ?auto_469232 ) ) ( not ( = ?auto_469231 ?auto_469233 ) ) ( not ( = ?auto_469231 ?auto_469234 ) ) ( not ( = ?auto_469231 ?auto_469235 ) ) ( not ( = ?auto_469231 ?auto_469236 ) ) ( not ( = ?auto_469231 ?auto_469237 ) ) ( not ( = ?auto_469231 ?auto_469238 ) ) ( not ( = ?auto_469231 ?auto_469239 ) ) ( not ( = ?auto_469231 ?auto_469240 ) ) ( not ( = ?auto_469232 ?auto_469233 ) ) ( not ( = ?auto_469232 ?auto_469234 ) ) ( not ( = ?auto_469232 ?auto_469235 ) ) ( not ( = ?auto_469232 ?auto_469236 ) ) ( not ( = ?auto_469232 ?auto_469237 ) ) ( not ( = ?auto_469232 ?auto_469238 ) ) ( not ( = ?auto_469232 ?auto_469239 ) ) ( not ( = ?auto_469232 ?auto_469240 ) ) ( not ( = ?auto_469233 ?auto_469234 ) ) ( not ( = ?auto_469233 ?auto_469235 ) ) ( not ( = ?auto_469233 ?auto_469236 ) ) ( not ( = ?auto_469233 ?auto_469237 ) ) ( not ( = ?auto_469233 ?auto_469238 ) ) ( not ( = ?auto_469233 ?auto_469239 ) ) ( not ( = ?auto_469233 ?auto_469240 ) ) ( not ( = ?auto_469234 ?auto_469235 ) ) ( not ( = ?auto_469234 ?auto_469236 ) ) ( not ( = ?auto_469234 ?auto_469237 ) ) ( not ( = ?auto_469234 ?auto_469238 ) ) ( not ( = ?auto_469234 ?auto_469239 ) ) ( not ( = ?auto_469234 ?auto_469240 ) ) ( not ( = ?auto_469235 ?auto_469236 ) ) ( not ( = ?auto_469235 ?auto_469237 ) ) ( not ( = ?auto_469235 ?auto_469238 ) ) ( not ( = ?auto_469235 ?auto_469239 ) ) ( not ( = ?auto_469235 ?auto_469240 ) ) ( not ( = ?auto_469236 ?auto_469237 ) ) ( not ( = ?auto_469236 ?auto_469238 ) ) ( not ( = ?auto_469236 ?auto_469239 ) ) ( not ( = ?auto_469236 ?auto_469240 ) ) ( not ( = ?auto_469237 ?auto_469238 ) ) ( not ( = ?auto_469237 ?auto_469239 ) ) ( not ( = ?auto_469237 ?auto_469240 ) ) ( not ( = ?auto_469238 ?auto_469239 ) ) ( not ( = ?auto_469238 ?auto_469240 ) ) ( not ( = ?auto_469239 ?auto_469240 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_469239 ?auto_469240 )
      ( !STACK ?auto_469239 ?auto_469238 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_469287 - BLOCK
      ?auto_469288 - BLOCK
      ?auto_469289 - BLOCK
      ?auto_469290 - BLOCK
      ?auto_469291 - BLOCK
      ?auto_469292 - BLOCK
      ?auto_469293 - BLOCK
      ?auto_469294 - BLOCK
      ?auto_469295 - BLOCK
      ?auto_469296 - BLOCK
      ?auto_469297 - BLOCK
      ?auto_469298 - BLOCK
      ?auto_469299 - BLOCK
      ?auto_469300 - BLOCK
      ?auto_469301 - BLOCK
    )
    :vars
    (
      ?auto_469302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469301 ?auto_469302 ) ( ON-TABLE ?auto_469287 ) ( ON ?auto_469288 ?auto_469287 ) ( ON ?auto_469289 ?auto_469288 ) ( ON ?auto_469290 ?auto_469289 ) ( ON ?auto_469291 ?auto_469290 ) ( ON ?auto_469292 ?auto_469291 ) ( ON ?auto_469293 ?auto_469292 ) ( ON ?auto_469294 ?auto_469293 ) ( ON ?auto_469295 ?auto_469294 ) ( ON ?auto_469296 ?auto_469295 ) ( ON ?auto_469297 ?auto_469296 ) ( ON ?auto_469298 ?auto_469297 ) ( ON ?auto_469299 ?auto_469298 ) ( not ( = ?auto_469287 ?auto_469288 ) ) ( not ( = ?auto_469287 ?auto_469289 ) ) ( not ( = ?auto_469287 ?auto_469290 ) ) ( not ( = ?auto_469287 ?auto_469291 ) ) ( not ( = ?auto_469287 ?auto_469292 ) ) ( not ( = ?auto_469287 ?auto_469293 ) ) ( not ( = ?auto_469287 ?auto_469294 ) ) ( not ( = ?auto_469287 ?auto_469295 ) ) ( not ( = ?auto_469287 ?auto_469296 ) ) ( not ( = ?auto_469287 ?auto_469297 ) ) ( not ( = ?auto_469287 ?auto_469298 ) ) ( not ( = ?auto_469287 ?auto_469299 ) ) ( not ( = ?auto_469287 ?auto_469300 ) ) ( not ( = ?auto_469287 ?auto_469301 ) ) ( not ( = ?auto_469287 ?auto_469302 ) ) ( not ( = ?auto_469288 ?auto_469289 ) ) ( not ( = ?auto_469288 ?auto_469290 ) ) ( not ( = ?auto_469288 ?auto_469291 ) ) ( not ( = ?auto_469288 ?auto_469292 ) ) ( not ( = ?auto_469288 ?auto_469293 ) ) ( not ( = ?auto_469288 ?auto_469294 ) ) ( not ( = ?auto_469288 ?auto_469295 ) ) ( not ( = ?auto_469288 ?auto_469296 ) ) ( not ( = ?auto_469288 ?auto_469297 ) ) ( not ( = ?auto_469288 ?auto_469298 ) ) ( not ( = ?auto_469288 ?auto_469299 ) ) ( not ( = ?auto_469288 ?auto_469300 ) ) ( not ( = ?auto_469288 ?auto_469301 ) ) ( not ( = ?auto_469288 ?auto_469302 ) ) ( not ( = ?auto_469289 ?auto_469290 ) ) ( not ( = ?auto_469289 ?auto_469291 ) ) ( not ( = ?auto_469289 ?auto_469292 ) ) ( not ( = ?auto_469289 ?auto_469293 ) ) ( not ( = ?auto_469289 ?auto_469294 ) ) ( not ( = ?auto_469289 ?auto_469295 ) ) ( not ( = ?auto_469289 ?auto_469296 ) ) ( not ( = ?auto_469289 ?auto_469297 ) ) ( not ( = ?auto_469289 ?auto_469298 ) ) ( not ( = ?auto_469289 ?auto_469299 ) ) ( not ( = ?auto_469289 ?auto_469300 ) ) ( not ( = ?auto_469289 ?auto_469301 ) ) ( not ( = ?auto_469289 ?auto_469302 ) ) ( not ( = ?auto_469290 ?auto_469291 ) ) ( not ( = ?auto_469290 ?auto_469292 ) ) ( not ( = ?auto_469290 ?auto_469293 ) ) ( not ( = ?auto_469290 ?auto_469294 ) ) ( not ( = ?auto_469290 ?auto_469295 ) ) ( not ( = ?auto_469290 ?auto_469296 ) ) ( not ( = ?auto_469290 ?auto_469297 ) ) ( not ( = ?auto_469290 ?auto_469298 ) ) ( not ( = ?auto_469290 ?auto_469299 ) ) ( not ( = ?auto_469290 ?auto_469300 ) ) ( not ( = ?auto_469290 ?auto_469301 ) ) ( not ( = ?auto_469290 ?auto_469302 ) ) ( not ( = ?auto_469291 ?auto_469292 ) ) ( not ( = ?auto_469291 ?auto_469293 ) ) ( not ( = ?auto_469291 ?auto_469294 ) ) ( not ( = ?auto_469291 ?auto_469295 ) ) ( not ( = ?auto_469291 ?auto_469296 ) ) ( not ( = ?auto_469291 ?auto_469297 ) ) ( not ( = ?auto_469291 ?auto_469298 ) ) ( not ( = ?auto_469291 ?auto_469299 ) ) ( not ( = ?auto_469291 ?auto_469300 ) ) ( not ( = ?auto_469291 ?auto_469301 ) ) ( not ( = ?auto_469291 ?auto_469302 ) ) ( not ( = ?auto_469292 ?auto_469293 ) ) ( not ( = ?auto_469292 ?auto_469294 ) ) ( not ( = ?auto_469292 ?auto_469295 ) ) ( not ( = ?auto_469292 ?auto_469296 ) ) ( not ( = ?auto_469292 ?auto_469297 ) ) ( not ( = ?auto_469292 ?auto_469298 ) ) ( not ( = ?auto_469292 ?auto_469299 ) ) ( not ( = ?auto_469292 ?auto_469300 ) ) ( not ( = ?auto_469292 ?auto_469301 ) ) ( not ( = ?auto_469292 ?auto_469302 ) ) ( not ( = ?auto_469293 ?auto_469294 ) ) ( not ( = ?auto_469293 ?auto_469295 ) ) ( not ( = ?auto_469293 ?auto_469296 ) ) ( not ( = ?auto_469293 ?auto_469297 ) ) ( not ( = ?auto_469293 ?auto_469298 ) ) ( not ( = ?auto_469293 ?auto_469299 ) ) ( not ( = ?auto_469293 ?auto_469300 ) ) ( not ( = ?auto_469293 ?auto_469301 ) ) ( not ( = ?auto_469293 ?auto_469302 ) ) ( not ( = ?auto_469294 ?auto_469295 ) ) ( not ( = ?auto_469294 ?auto_469296 ) ) ( not ( = ?auto_469294 ?auto_469297 ) ) ( not ( = ?auto_469294 ?auto_469298 ) ) ( not ( = ?auto_469294 ?auto_469299 ) ) ( not ( = ?auto_469294 ?auto_469300 ) ) ( not ( = ?auto_469294 ?auto_469301 ) ) ( not ( = ?auto_469294 ?auto_469302 ) ) ( not ( = ?auto_469295 ?auto_469296 ) ) ( not ( = ?auto_469295 ?auto_469297 ) ) ( not ( = ?auto_469295 ?auto_469298 ) ) ( not ( = ?auto_469295 ?auto_469299 ) ) ( not ( = ?auto_469295 ?auto_469300 ) ) ( not ( = ?auto_469295 ?auto_469301 ) ) ( not ( = ?auto_469295 ?auto_469302 ) ) ( not ( = ?auto_469296 ?auto_469297 ) ) ( not ( = ?auto_469296 ?auto_469298 ) ) ( not ( = ?auto_469296 ?auto_469299 ) ) ( not ( = ?auto_469296 ?auto_469300 ) ) ( not ( = ?auto_469296 ?auto_469301 ) ) ( not ( = ?auto_469296 ?auto_469302 ) ) ( not ( = ?auto_469297 ?auto_469298 ) ) ( not ( = ?auto_469297 ?auto_469299 ) ) ( not ( = ?auto_469297 ?auto_469300 ) ) ( not ( = ?auto_469297 ?auto_469301 ) ) ( not ( = ?auto_469297 ?auto_469302 ) ) ( not ( = ?auto_469298 ?auto_469299 ) ) ( not ( = ?auto_469298 ?auto_469300 ) ) ( not ( = ?auto_469298 ?auto_469301 ) ) ( not ( = ?auto_469298 ?auto_469302 ) ) ( not ( = ?auto_469299 ?auto_469300 ) ) ( not ( = ?auto_469299 ?auto_469301 ) ) ( not ( = ?auto_469299 ?auto_469302 ) ) ( not ( = ?auto_469300 ?auto_469301 ) ) ( not ( = ?auto_469300 ?auto_469302 ) ) ( not ( = ?auto_469301 ?auto_469302 ) ) ( CLEAR ?auto_469299 ) ( ON ?auto_469300 ?auto_469301 ) ( CLEAR ?auto_469300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_469287 ?auto_469288 ?auto_469289 ?auto_469290 ?auto_469291 ?auto_469292 ?auto_469293 ?auto_469294 ?auto_469295 ?auto_469296 ?auto_469297 ?auto_469298 ?auto_469299 ?auto_469300 )
      ( MAKE-15PILE ?auto_469287 ?auto_469288 ?auto_469289 ?auto_469290 ?auto_469291 ?auto_469292 ?auto_469293 ?auto_469294 ?auto_469295 ?auto_469296 ?auto_469297 ?auto_469298 ?auto_469299 ?auto_469300 ?auto_469301 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_469349 - BLOCK
      ?auto_469350 - BLOCK
      ?auto_469351 - BLOCK
      ?auto_469352 - BLOCK
      ?auto_469353 - BLOCK
      ?auto_469354 - BLOCK
      ?auto_469355 - BLOCK
      ?auto_469356 - BLOCK
      ?auto_469357 - BLOCK
      ?auto_469358 - BLOCK
      ?auto_469359 - BLOCK
      ?auto_469360 - BLOCK
      ?auto_469361 - BLOCK
      ?auto_469362 - BLOCK
      ?auto_469363 - BLOCK
    )
    :vars
    (
      ?auto_469364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469363 ?auto_469364 ) ( ON-TABLE ?auto_469349 ) ( ON ?auto_469350 ?auto_469349 ) ( ON ?auto_469351 ?auto_469350 ) ( ON ?auto_469352 ?auto_469351 ) ( ON ?auto_469353 ?auto_469352 ) ( ON ?auto_469354 ?auto_469353 ) ( ON ?auto_469355 ?auto_469354 ) ( ON ?auto_469356 ?auto_469355 ) ( ON ?auto_469357 ?auto_469356 ) ( ON ?auto_469358 ?auto_469357 ) ( ON ?auto_469359 ?auto_469358 ) ( ON ?auto_469360 ?auto_469359 ) ( not ( = ?auto_469349 ?auto_469350 ) ) ( not ( = ?auto_469349 ?auto_469351 ) ) ( not ( = ?auto_469349 ?auto_469352 ) ) ( not ( = ?auto_469349 ?auto_469353 ) ) ( not ( = ?auto_469349 ?auto_469354 ) ) ( not ( = ?auto_469349 ?auto_469355 ) ) ( not ( = ?auto_469349 ?auto_469356 ) ) ( not ( = ?auto_469349 ?auto_469357 ) ) ( not ( = ?auto_469349 ?auto_469358 ) ) ( not ( = ?auto_469349 ?auto_469359 ) ) ( not ( = ?auto_469349 ?auto_469360 ) ) ( not ( = ?auto_469349 ?auto_469361 ) ) ( not ( = ?auto_469349 ?auto_469362 ) ) ( not ( = ?auto_469349 ?auto_469363 ) ) ( not ( = ?auto_469349 ?auto_469364 ) ) ( not ( = ?auto_469350 ?auto_469351 ) ) ( not ( = ?auto_469350 ?auto_469352 ) ) ( not ( = ?auto_469350 ?auto_469353 ) ) ( not ( = ?auto_469350 ?auto_469354 ) ) ( not ( = ?auto_469350 ?auto_469355 ) ) ( not ( = ?auto_469350 ?auto_469356 ) ) ( not ( = ?auto_469350 ?auto_469357 ) ) ( not ( = ?auto_469350 ?auto_469358 ) ) ( not ( = ?auto_469350 ?auto_469359 ) ) ( not ( = ?auto_469350 ?auto_469360 ) ) ( not ( = ?auto_469350 ?auto_469361 ) ) ( not ( = ?auto_469350 ?auto_469362 ) ) ( not ( = ?auto_469350 ?auto_469363 ) ) ( not ( = ?auto_469350 ?auto_469364 ) ) ( not ( = ?auto_469351 ?auto_469352 ) ) ( not ( = ?auto_469351 ?auto_469353 ) ) ( not ( = ?auto_469351 ?auto_469354 ) ) ( not ( = ?auto_469351 ?auto_469355 ) ) ( not ( = ?auto_469351 ?auto_469356 ) ) ( not ( = ?auto_469351 ?auto_469357 ) ) ( not ( = ?auto_469351 ?auto_469358 ) ) ( not ( = ?auto_469351 ?auto_469359 ) ) ( not ( = ?auto_469351 ?auto_469360 ) ) ( not ( = ?auto_469351 ?auto_469361 ) ) ( not ( = ?auto_469351 ?auto_469362 ) ) ( not ( = ?auto_469351 ?auto_469363 ) ) ( not ( = ?auto_469351 ?auto_469364 ) ) ( not ( = ?auto_469352 ?auto_469353 ) ) ( not ( = ?auto_469352 ?auto_469354 ) ) ( not ( = ?auto_469352 ?auto_469355 ) ) ( not ( = ?auto_469352 ?auto_469356 ) ) ( not ( = ?auto_469352 ?auto_469357 ) ) ( not ( = ?auto_469352 ?auto_469358 ) ) ( not ( = ?auto_469352 ?auto_469359 ) ) ( not ( = ?auto_469352 ?auto_469360 ) ) ( not ( = ?auto_469352 ?auto_469361 ) ) ( not ( = ?auto_469352 ?auto_469362 ) ) ( not ( = ?auto_469352 ?auto_469363 ) ) ( not ( = ?auto_469352 ?auto_469364 ) ) ( not ( = ?auto_469353 ?auto_469354 ) ) ( not ( = ?auto_469353 ?auto_469355 ) ) ( not ( = ?auto_469353 ?auto_469356 ) ) ( not ( = ?auto_469353 ?auto_469357 ) ) ( not ( = ?auto_469353 ?auto_469358 ) ) ( not ( = ?auto_469353 ?auto_469359 ) ) ( not ( = ?auto_469353 ?auto_469360 ) ) ( not ( = ?auto_469353 ?auto_469361 ) ) ( not ( = ?auto_469353 ?auto_469362 ) ) ( not ( = ?auto_469353 ?auto_469363 ) ) ( not ( = ?auto_469353 ?auto_469364 ) ) ( not ( = ?auto_469354 ?auto_469355 ) ) ( not ( = ?auto_469354 ?auto_469356 ) ) ( not ( = ?auto_469354 ?auto_469357 ) ) ( not ( = ?auto_469354 ?auto_469358 ) ) ( not ( = ?auto_469354 ?auto_469359 ) ) ( not ( = ?auto_469354 ?auto_469360 ) ) ( not ( = ?auto_469354 ?auto_469361 ) ) ( not ( = ?auto_469354 ?auto_469362 ) ) ( not ( = ?auto_469354 ?auto_469363 ) ) ( not ( = ?auto_469354 ?auto_469364 ) ) ( not ( = ?auto_469355 ?auto_469356 ) ) ( not ( = ?auto_469355 ?auto_469357 ) ) ( not ( = ?auto_469355 ?auto_469358 ) ) ( not ( = ?auto_469355 ?auto_469359 ) ) ( not ( = ?auto_469355 ?auto_469360 ) ) ( not ( = ?auto_469355 ?auto_469361 ) ) ( not ( = ?auto_469355 ?auto_469362 ) ) ( not ( = ?auto_469355 ?auto_469363 ) ) ( not ( = ?auto_469355 ?auto_469364 ) ) ( not ( = ?auto_469356 ?auto_469357 ) ) ( not ( = ?auto_469356 ?auto_469358 ) ) ( not ( = ?auto_469356 ?auto_469359 ) ) ( not ( = ?auto_469356 ?auto_469360 ) ) ( not ( = ?auto_469356 ?auto_469361 ) ) ( not ( = ?auto_469356 ?auto_469362 ) ) ( not ( = ?auto_469356 ?auto_469363 ) ) ( not ( = ?auto_469356 ?auto_469364 ) ) ( not ( = ?auto_469357 ?auto_469358 ) ) ( not ( = ?auto_469357 ?auto_469359 ) ) ( not ( = ?auto_469357 ?auto_469360 ) ) ( not ( = ?auto_469357 ?auto_469361 ) ) ( not ( = ?auto_469357 ?auto_469362 ) ) ( not ( = ?auto_469357 ?auto_469363 ) ) ( not ( = ?auto_469357 ?auto_469364 ) ) ( not ( = ?auto_469358 ?auto_469359 ) ) ( not ( = ?auto_469358 ?auto_469360 ) ) ( not ( = ?auto_469358 ?auto_469361 ) ) ( not ( = ?auto_469358 ?auto_469362 ) ) ( not ( = ?auto_469358 ?auto_469363 ) ) ( not ( = ?auto_469358 ?auto_469364 ) ) ( not ( = ?auto_469359 ?auto_469360 ) ) ( not ( = ?auto_469359 ?auto_469361 ) ) ( not ( = ?auto_469359 ?auto_469362 ) ) ( not ( = ?auto_469359 ?auto_469363 ) ) ( not ( = ?auto_469359 ?auto_469364 ) ) ( not ( = ?auto_469360 ?auto_469361 ) ) ( not ( = ?auto_469360 ?auto_469362 ) ) ( not ( = ?auto_469360 ?auto_469363 ) ) ( not ( = ?auto_469360 ?auto_469364 ) ) ( not ( = ?auto_469361 ?auto_469362 ) ) ( not ( = ?auto_469361 ?auto_469363 ) ) ( not ( = ?auto_469361 ?auto_469364 ) ) ( not ( = ?auto_469362 ?auto_469363 ) ) ( not ( = ?auto_469362 ?auto_469364 ) ) ( not ( = ?auto_469363 ?auto_469364 ) ) ( ON ?auto_469362 ?auto_469363 ) ( CLEAR ?auto_469360 ) ( ON ?auto_469361 ?auto_469362 ) ( CLEAR ?auto_469361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_469349 ?auto_469350 ?auto_469351 ?auto_469352 ?auto_469353 ?auto_469354 ?auto_469355 ?auto_469356 ?auto_469357 ?auto_469358 ?auto_469359 ?auto_469360 ?auto_469361 )
      ( MAKE-15PILE ?auto_469349 ?auto_469350 ?auto_469351 ?auto_469352 ?auto_469353 ?auto_469354 ?auto_469355 ?auto_469356 ?auto_469357 ?auto_469358 ?auto_469359 ?auto_469360 ?auto_469361 ?auto_469362 ?auto_469363 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_469411 - BLOCK
      ?auto_469412 - BLOCK
      ?auto_469413 - BLOCK
      ?auto_469414 - BLOCK
      ?auto_469415 - BLOCK
      ?auto_469416 - BLOCK
      ?auto_469417 - BLOCK
      ?auto_469418 - BLOCK
      ?auto_469419 - BLOCK
      ?auto_469420 - BLOCK
      ?auto_469421 - BLOCK
      ?auto_469422 - BLOCK
      ?auto_469423 - BLOCK
      ?auto_469424 - BLOCK
      ?auto_469425 - BLOCK
    )
    :vars
    (
      ?auto_469426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469425 ?auto_469426 ) ( ON-TABLE ?auto_469411 ) ( ON ?auto_469412 ?auto_469411 ) ( ON ?auto_469413 ?auto_469412 ) ( ON ?auto_469414 ?auto_469413 ) ( ON ?auto_469415 ?auto_469414 ) ( ON ?auto_469416 ?auto_469415 ) ( ON ?auto_469417 ?auto_469416 ) ( ON ?auto_469418 ?auto_469417 ) ( ON ?auto_469419 ?auto_469418 ) ( ON ?auto_469420 ?auto_469419 ) ( ON ?auto_469421 ?auto_469420 ) ( not ( = ?auto_469411 ?auto_469412 ) ) ( not ( = ?auto_469411 ?auto_469413 ) ) ( not ( = ?auto_469411 ?auto_469414 ) ) ( not ( = ?auto_469411 ?auto_469415 ) ) ( not ( = ?auto_469411 ?auto_469416 ) ) ( not ( = ?auto_469411 ?auto_469417 ) ) ( not ( = ?auto_469411 ?auto_469418 ) ) ( not ( = ?auto_469411 ?auto_469419 ) ) ( not ( = ?auto_469411 ?auto_469420 ) ) ( not ( = ?auto_469411 ?auto_469421 ) ) ( not ( = ?auto_469411 ?auto_469422 ) ) ( not ( = ?auto_469411 ?auto_469423 ) ) ( not ( = ?auto_469411 ?auto_469424 ) ) ( not ( = ?auto_469411 ?auto_469425 ) ) ( not ( = ?auto_469411 ?auto_469426 ) ) ( not ( = ?auto_469412 ?auto_469413 ) ) ( not ( = ?auto_469412 ?auto_469414 ) ) ( not ( = ?auto_469412 ?auto_469415 ) ) ( not ( = ?auto_469412 ?auto_469416 ) ) ( not ( = ?auto_469412 ?auto_469417 ) ) ( not ( = ?auto_469412 ?auto_469418 ) ) ( not ( = ?auto_469412 ?auto_469419 ) ) ( not ( = ?auto_469412 ?auto_469420 ) ) ( not ( = ?auto_469412 ?auto_469421 ) ) ( not ( = ?auto_469412 ?auto_469422 ) ) ( not ( = ?auto_469412 ?auto_469423 ) ) ( not ( = ?auto_469412 ?auto_469424 ) ) ( not ( = ?auto_469412 ?auto_469425 ) ) ( not ( = ?auto_469412 ?auto_469426 ) ) ( not ( = ?auto_469413 ?auto_469414 ) ) ( not ( = ?auto_469413 ?auto_469415 ) ) ( not ( = ?auto_469413 ?auto_469416 ) ) ( not ( = ?auto_469413 ?auto_469417 ) ) ( not ( = ?auto_469413 ?auto_469418 ) ) ( not ( = ?auto_469413 ?auto_469419 ) ) ( not ( = ?auto_469413 ?auto_469420 ) ) ( not ( = ?auto_469413 ?auto_469421 ) ) ( not ( = ?auto_469413 ?auto_469422 ) ) ( not ( = ?auto_469413 ?auto_469423 ) ) ( not ( = ?auto_469413 ?auto_469424 ) ) ( not ( = ?auto_469413 ?auto_469425 ) ) ( not ( = ?auto_469413 ?auto_469426 ) ) ( not ( = ?auto_469414 ?auto_469415 ) ) ( not ( = ?auto_469414 ?auto_469416 ) ) ( not ( = ?auto_469414 ?auto_469417 ) ) ( not ( = ?auto_469414 ?auto_469418 ) ) ( not ( = ?auto_469414 ?auto_469419 ) ) ( not ( = ?auto_469414 ?auto_469420 ) ) ( not ( = ?auto_469414 ?auto_469421 ) ) ( not ( = ?auto_469414 ?auto_469422 ) ) ( not ( = ?auto_469414 ?auto_469423 ) ) ( not ( = ?auto_469414 ?auto_469424 ) ) ( not ( = ?auto_469414 ?auto_469425 ) ) ( not ( = ?auto_469414 ?auto_469426 ) ) ( not ( = ?auto_469415 ?auto_469416 ) ) ( not ( = ?auto_469415 ?auto_469417 ) ) ( not ( = ?auto_469415 ?auto_469418 ) ) ( not ( = ?auto_469415 ?auto_469419 ) ) ( not ( = ?auto_469415 ?auto_469420 ) ) ( not ( = ?auto_469415 ?auto_469421 ) ) ( not ( = ?auto_469415 ?auto_469422 ) ) ( not ( = ?auto_469415 ?auto_469423 ) ) ( not ( = ?auto_469415 ?auto_469424 ) ) ( not ( = ?auto_469415 ?auto_469425 ) ) ( not ( = ?auto_469415 ?auto_469426 ) ) ( not ( = ?auto_469416 ?auto_469417 ) ) ( not ( = ?auto_469416 ?auto_469418 ) ) ( not ( = ?auto_469416 ?auto_469419 ) ) ( not ( = ?auto_469416 ?auto_469420 ) ) ( not ( = ?auto_469416 ?auto_469421 ) ) ( not ( = ?auto_469416 ?auto_469422 ) ) ( not ( = ?auto_469416 ?auto_469423 ) ) ( not ( = ?auto_469416 ?auto_469424 ) ) ( not ( = ?auto_469416 ?auto_469425 ) ) ( not ( = ?auto_469416 ?auto_469426 ) ) ( not ( = ?auto_469417 ?auto_469418 ) ) ( not ( = ?auto_469417 ?auto_469419 ) ) ( not ( = ?auto_469417 ?auto_469420 ) ) ( not ( = ?auto_469417 ?auto_469421 ) ) ( not ( = ?auto_469417 ?auto_469422 ) ) ( not ( = ?auto_469417 ?auto_469423 ) ) ( not ( = ?auto_469417 ?auto_469424 ) ) ( not ( = ?auto_469417 ?auto_469425 ) ) ( not ( = ?auto_469417 ?auto_469426 ) ) ( not ( = ?auto_469418 ?auto_469419 ) ) ( not ( = ?auto_469418 ?auto_469420 ) ) ( not ( = ?auto_469418 ?auto_469421 ) ) ( not ( = ?auto_469418 ?auto_469422 ) ) ( not ( = ?auto_469418 ?auto_469423 ) ) ( not ( = ?auto_469418 ?auto_469424 ) ) ( not ( = ?auto_469418 ?auto_469425 ) ) ( not ( = ?auto_469418 ?auto_469426 ) ) ( not ( = ?auto_469419 ?auto_469420 ) ) ( not ( = ?auto_469419 ?auto_469421 ) ) ( not ( = ?auto_469419 ?auto_469422 ) ) ( not ( = ?auto_469419 ?auto_469423 ) ) ( not ( = ?auto_469419 ?auto_469424 ) ) ( not ( = ?auto_469419 ?auto_469425 ) ) ( not ( = ?auto_469419 ?auto_469426 ) ) ( not ( = ?auto_469420 ?auto_469421 ) ) ( not ( = ?auto_469420 ?auto_469422 ) ) ( not ( = ?auto_469420 ?auto_469423 ) ) ( not ( = ?auto_469420 ?auto_469424 ) ) ( not ( = ?auto_469420 ?auto_469425 ) ) ( not ( = ?auto_469420 ?auto_469426 ) ) ( not ( = ?auto_469421 ?auto_469422 ) ) ( not ( = ?auto_469421 ?auto_469423 ) ) ( not ( = ?auto_469421 ?auto_469424 ) ) ( not ( = ?auto_469421 ?auto_469425 ) ) ( not ( = ?auto_469421 ?auto_469426 ) ) ( not ( = ?auto_469422 ?auto_469423 ) ) ( not ( = ?auto_469422 ?auto_469424 ) ) ( not ( = ?auto_469422 ?auto_469425 ) ) ( not ( = ?auto_469422 ?auto_469426 ) ) ( not ( = ?auto_469423 ?auto_469424 ) ) ( not ( = ?auto_469423 ?auto_469425 ) ) ( not ( = ?auto_469423 ?auto_469426 ) ) ( not ( = ?auto_469424 ?auto_469425 ) ) ( not ( = ?auto_469424 ?auto_469426 ) ) ( not ( = ?auto_469425 ?auto_469426 ) ) ( ON ?auto_469424 ?auto_469425 ) ( ON ?auto_469423 ?auto_469424 ) ( CLEAR ?auto_469421 ) ( ON ?auto_469422 ?auto_469423 ) ( CLEAR ?auto_469422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_469411 ?auto_469412 ?auto_469413 ?auto_469414 ?auto_469415 ?auto_469416 ?auto_469417 ?auto_469418 ?auto_469419 ?auto_469420 ?auto_469421 ?auto_469422 )
      ( MAKE-15PILE ?auto_469411 ?auto_469412 ?auto_469413 ?auto_469414 ?auto_469415 ?auto_469416 ?auto_469417 ?auto_469418 ?auto_469419 ?auto_469420 ?auto_469421 ?auto_469422 ?auto_469423 ?auto_469424 ?auto_469425 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_469473 - BLOCK
      ?auto_469474 - BLOCK
      ?auto_469475 - BLOCK
      ?auto_469476 - BLOCK
      ?auto_469477 - BLOCK
      ?auto_469478 - BLOCK
      ?auto_469479 - BLOCK
      ?auto_469480 - BLOCK
      ?auto_469481 - BLOCK
      ?auto_469482 - BLOCK
      ?auto_469483 - BLOCK
      ?auto_469484 - BLOCK
      ?auto_469485 - BLOCK
      ?auto_469486 - BLOCK
      ?auto_469487 - BLOCK
    )
    :vars
    (
      ?auto_469488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469487 ?auto_469488 ) ( ON-TABLE ?auto_469473 ) ( ON ?auto_469474 ?auto_469473 ) ( ON ?auto_469475 ?auto_469474 ) ( ON ?auto_469476 ?auto_469475 ) ( ON ?auto_469477 ?auto_469476 ) ( ON ?auto_469478 ?auto_469477 ) ( ON ?auto_469479 ?auto_469478 ) ( ON ?auto_469480 ?auto_469479 ) ( ON ?auto_469481 ?auto_469480 ) ( ON ?auto_469482 ?auto_469481 ) ( not ( = ?auto_469473 ?auto_469474 ) ) ( not ( = ?auto_469473 ?auto_469475 ) ) ( not ( = ?auto_469473 ?auto_469476 ) ) ( not ( = ?auto_469473 ?auto_469477 ) ) ( not ( = ?auto_469473 ?auto_469478 ) ) ( not ( = ?auto_469473 ?auto_469479 ) ) ( not ( = ?auto_469473 ?auto_469480 ) ) ( not ( = ?auto_469473 ?auto_469481 ) ) ( not ( = ?auto_469473 ?auto_469482 ) ) ( not ( = ?auto_469473 ?auto_469483 ) ) ( not ( = ?auto_469473 ?auto_469484 ) ) ( not ( = ?auto_469473 ?auto_469485 ) ) ( not ( = ?auto_469473 ?auto_469486 ) ) ( not ( = ?auto_469473 ?auto_469487 ) ) ( not ( = ?auto_469473 ?auto_469488 ) ) ( not ( = ?auto_469474 ?auto_469475 ) ) ( not ( = ?auto_469474 ?auto_469476 ) ) ( not ( = ?auto_469474 ?auto_469477 ) ) ( not ( = ?auto_469474 ?auto_469478 ) ) ( not ( = ?auto_469474 ?auto_469479 ) ) ( not ( = ?auto_469474 ?auto_469480 ) ) ( not ( = ?auto_469474 ?auto_469481 ) ) ( not ( = ?auto_469474 ?auto_469482 ) ) ( not ( = ?auto_469474 ?auto_469483 ) ) ( not ( = ?auto_469474 ?auto_469484 ) ) ( not ( = ?auto_469474 ?auto_469485 ) ) ( not ( = ?auto_469474 ?auto_469486 ) ) ( not ( = ?auto_469474 ?auto_469487 ) ) ( not ( = ?auto_469474 ?auto_469488 ) ) ( not ( = ?auto_469475 ?auto_469476 ) ) ( not ( = ?auto_469475 ?auto_469477 ) ) ( not ( = ?auto_469475 ?auto_469478 ) ) ( not ( = ?auto_469475 ?auto_469479 ) ) ( not ( = ?auto_469475 ?auto_469480 ) ) ( not ( = ?auto_469475 ?auto_469481 ) ) ( not ( = ?auto_469475 ?auto_469482 ) ) ( not ( = ?auto_469475 ?auto_469483 ) ) ( not ( = ?auto_469475 ?auto_469484 ) ) ( not ( = ?auto_469475 ?auto_469485 ) ) ( not ( = ?auto_469475 ?auto_469486 ) ) ( not ( = ?auto_469475 ?auto_469487 ) ) ( not ( = ?auto_469475 ?auto_469488 ) ) ( not ( = ?auto_469476 ?auto_469477 ) ) ( not ( = ?auto_469476 ?auto_469478 ) ) ( not ( = ?auto_469476 ?auto_469479 ) ) ( not ( = ?auto_469476 ?auto_469480 ) ) ( not ( = ?auto_469476 ?auto_469481 ) ) ( not ( = ?auto_469476 ?auto_469482 ) ) ( not ( = ?auto_469476 ?auto_469483 ) ) ( not ( = ?auto_469476 ?auto_469484 ) ) ( not ( = ?auto_469476 ?auto_469485 ) ) ( not ( = ?auto_469476 ?auto_469486 ) ) ( not ( = ?auto_469476 ?auto_469487 ) ) ( not ( = ?auto_469476 ?auto_469488 ) ) ( not ( = ?auto_469477 ?auto_469478 ) ) ( not ( = ?auto_469477 ?auto_469479 ) ) ( not ( = ?auto_469477 ?auto_469480 ) ) ( not ( = ?auto_469477 ?auto_469481 ) ) ( not ( = ?auto_469477 ?auto_469482 ) ) ( not ( = ?auto_469477 ?auto_469483 ) ) ( not ( = ?auto_469477 ?auto_469484 ) ) ( not ( = ?auto_469477 ?auto_469485 ) ) ( not ( = ?auto_469477 ?auto_469486 ) ) ( not ( = ?auto_469477 ?auto_469487 ) ) ( not ( = ?auto_469477 ?auto_469488 ) ) ( not ( = ?auto_469478 ?auto_469479 ) ) ( not ( = ?auto_469478 ?auto_469480 ) ) ( not ( = ?auto_469478 ?auto_469481 ) ) ( not ( = ?auto_469478 ?auto_469482 ) ) ( not ( = ?auto_469478 ?auto_469483 ) ) ( not ( = ?auto_469478 ?auto_469484 ) ) ( not ( = ?auto_469478 ?auto_469485 ) ) ( not ( = ?auto_469478 ?auto_469486 ) ) ( not ( = ?auto_469478 ?auto_469487 ) ) ( not ( = ?auto_469478 ?auto_469488 ) ) ( not ( = ?auto_469479 ?auto_469480 ) ) ( not ( = ?auto_469479 ?auto_469481 ) ) ( not ( = ?auto_469479 ?auto_469482 ) ) ( not ( = ?auto_469479 ?auto_469483 ) ) ( not ( = ?auto_469479 ?auto_469484 ) ) ( not ( = ?auto_469479 ?auto_469485 ) ) ( not ( = ?auto_469479 ?auto_469486 ) ) ( not ( = ?auto_469479 ?auto_469487 ) ) ( not ( = ?auto_469479 ?auto_469488 ) ) ( not ( = ?auto_469480 ?auto_469481 ) ) ( not ( = ?auto_469480 ?auto_469482 ) ) ( not ( = ?auto_469480 ?auto_469483 ) ) ( not ( = ?auto_469480 ?auto_469484 ) ) ( not ( = ?auto_469480 ?auto_469485 ) ) ( not ( = ?auto_469480 ?auto_469486 ) ) ( not ( = ?auto_469480 ?auto_469487 ) ) ( not ( = ?auto_469480 ?auto_469488 ) ) ( not ( = ?auto_469481 ?auto_469482 ) ) ( not ( = ?auto_469481 ?auto_469483 ) ) ( not ( = ?auto_469481 ?auto_469484 ) ) ( not ( = ?auto_469481 ?auto_469485 ) ) ( not ( = ?auto_469481 ?auto_469486 ) ) ( not ( = ?auto_469481 ?auto_469487 ) ) ( not ( = ?auto_469481 ?auto_469488 ) ) ( not ( = ?auto_469482 ?auto_469483 ) ) ( not ( = ?auto_469482 ?auto_469484 ) ) ( not ( = ?auto_469482 ?auto_469485 ) ) ( not ( = ?auto_469482 ?auto_469486 ) ) ( not ( = ?auto_469482 ?auto_469487 ) ) ( not ( = ?auto_469482 ?auto_469488 ) ) ( not ( = ?auto_469483 ?auto_469484 ) ) ( not ( = ?auto_469483 ?auto_469485 ) ) ( not ( = ?auto_469483 ?auto_469486 ) ) ( not ( = ?auto_469483 ?auto_469487 ) ) ( not ( = ?auto_469483 ?auto_469488 ) ) ( not ( = ?auto_469484 ?auto_469485 ) ) ( not ( = ?auto_469484 ?auto_469486 ) ) ( not ( = ?auto_469484 ?auto_469487 ) ) ( not ( = ?auto_469484 ?auto_469488 ) ) ( not ( = ?auto_469485 ?auto_469486 ) ) ( not ( = ?auto_469485 ?auto_469487 ) ) ( not ( = ?auto_469485 ?auto_469488 ) ) ( not ( = ?auto_469486 ?auto_469487 ) ) ( not ( = ?auto_469486 ?auto_469488 ) ) ( not ( = ?auto_469487 ?auto_469488 ) ) ( ON ?auto_469486 ?auto_469487 ) ( ON ?auto_469485 ?auto_469486 ) ( ON ?auto_469484 ?auto_469485 ) ( CLEAR ?auto_469482 ) ( ON ?auto_469483 ?auto_469484 ) ( CLEAR ?auto_469483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_469473 ?auto_469474 ?auto_469475 ?auto_469476 ?auto_469477 ?auto_469478 ?auto_469479 ?auto_469480 ?auto_469481 ?auto_469482 ?auto_469483 )
      ( MAKE-15PILE ?auto_469473 ?auto_469474 ?auto_469475 ?auto_469476 ?auto_469477 ?auto_469478 ?auto_469479 ?auto_469480 ?auto_469481 ?auto_469482 ?auto_469483 ?auto_469484 ?auto_469485 ?auto_469486 ?auto_469487 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_469535 - BLOCK
      ?auto_469536 - BLOCK
      ?auto_469537 - BLOCK
      ?auto_469538 - BLOCK
      ?auto_469539 - BLOCK
      ?auto_469540 - BLOCK
      ?auto_469541 - BLOCK
      ?auto_469542 - BLOCK
      ?auto_469543 - BLOCK
      ?auto_469544 - BLOCK
      ?auto_469545 - BLOCK
      ?auto_469546 - BLOCK
      ?auto_469547 - BLOCK
      ?auto_469548 - BLOCK
      ?auto_469549 - BLOCK
    )
    :vars
    (
      ?auto_469550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469549 ?auto_469550 ) ( ON-TABLE ?auto_469535 ) ( ON ?auto_469536 ?auto_469535 ) ( ON ?auto_469537 ?auto_469536 ) ( ON ?auto_469538 ?auto_469537 ) ( ON ?auto_469539 ?auto_469538 ) ( ON ?auto_469540 ?auto_469539 ) ( ON ?auto_469541 ?auto_469540 ) ( ON ?auto_469542 ?auto_469541 ) ( ON ?auto_469543 ?auto_469542 ) ( not ( = ?auto_469535 ?auto_469536 ) ) ( not ( = ?auto_469535 ?auto_469537 ) ) ( not ( = ?auto_469535 ?auto_469538 ) ) ( not ( = ?auto_469535 ?auto_469539 ) ) ( not ( = ?auto_469535 ?auto_469540 ) ) ( not ( = ?auto_469535 ?auto_469541 ) ) ( not ( = ?auto_469535 ?auto_469542 ) ) ( not ( = ?auto_469535 ?auto_469543 ) ) ( not ( = ?auto_469535 ?auto_469544 ) ) ( not ( = ?auto_469535 ?auto_469545 ) ) ( not ( = ?auto_469535 ?auto_469546 ) ) ( not ( = ?auto_469535 ?auto_469547 ) ) ( not ( = ?auto_469535 ?auto_469548 ) ) ( not ( = ?auto_469535 ?auto_469549 ) ) ( not ( = ?auto_469535 ?auto_469550 ) ) ( not ( = ?auto_469536 ?auto_469537 ) ) ( not ( = ?auto_469536 ?auto_469538 ) ) ( not ( = ?auto_469536 ?auto_469539 ) ) ( not ( = ?auto_469536 ?auto_469540 ) ) ( not ( = ?auto_469536 ?auto_469541 ) ) ( not ( = ?auto_469536 ?auto_469542 ) ) ( not ( = ?auto_469536 ?auto_469543 ) ) ( not ( = ?auto_469536 ?auto_469544 ) ) ( not ( = ?auto_469536 ?auto_469545 ) ) ( not ( = ?auto_469536 ?auto_469546 ) ) ( not ( = ?auto_469536 ?auto_469547 ) ) ( not ( = ?auto_469536 ?auto_469548 ) ) ( not ( = ?auto_469536 ?auto_469549 ) ) ( not ( = ?auto_469536 ?auto_469550 ) ) ( not ( = ?auto_469537 ?auto_469538 ) ) ( not ( = ?auto_469537 ?auto_469539 ) ) ( not ( = ?auto_469537 ?auto_469540 ) ) ( not ( = ?auto_469537 ?auto_469541 ) ) ( not ( = ?auto_469537 ?auto_469542 ) ) ( not ( = ?auto_469537 ?auto_469543 ) ) ( not ( = ?auto_469537 ?auto_469544 ) ) ( not ( = ?auto_469537 ?auto_469545 ) ) ( not ( = ?auto_469537 ?auto_469546 ) ) ( not ( = ?auto_469537 ?auto_469547 ) ) ( not ( = ?auto_469537 ?auto_469548 ) ) ( not ( = ?auto_469537 ?auto_469549 ) ) ( not ( = ?auto_469537 ?auto_469550 ) ) ( not ( = ?auto_469538 ?auto_469539 ) ) ( not ( = ?auto_469538 ?auto_469540 ) ) ( not ( = ?auto_469538 ?auto_469541 ) ) ( not ( = ?auto_469538 ?auto_469542 ) ) ( not ( = ?auto_469538 ?auto_469543 ) ) ( not ( = ?auto_469538 ?auto_469544 ) ) ( not ( = ?auto_469538 ?auto_469545 ) ) ( not ( = ?auto_469538 ?auto_469546 ) ) ( not ( = ?auto_469538 ?auto_469547 ) ) ( not ( = ?auto_469538 ?auto_469548 ) ) ( not ( = ?auto_469538 ?auto_469549 ) ) ( not ( = ?auto_469538 ?auto_469550 ) ) ( not ( = ?auto_469539 ?auto_469540 ) ) ( not ( = ?auto_469539 ?auto_469541 ) ) ( not ( = ?auto_469539 ?auto_469542 ) ) ( not ( = ?auto_469539 ?auto_469543 ) ) ( not ( = ?auto_469539 ?auto_469544 ) ) ( not ( = ?auto_469539 ?auto_469545 ) ) ( not ( = ?auto_469539 ?auto_469546 ) ) ( not ( = ?auto_469539 ?auto_469547 ) ) ( not ( = ?auto_469539 ?auto_469548 ) ) ( not ( = ?auto_469539 ?auto_469549 ) ) ( not ( = ?auto_469539 ?auto_469550 ) ) ( not ( = ?auto_469540 ?auto_469541 ) ) ( not ( = ?auto_469540 ?auto_469542 ) ) ( not ( = ?auto_469540 ?auto_469543 ) ) ( not ( = ?auto_469540 ?auto_469544 ) ) ( not ( = ?auto_469540 ?auto_469545 ) ) ( not ( = ?auto_469540 ?auto_469546 ) ) ( not ( = ?auto_469540 ?auto_469547 ) ) ( not ( = ?auto_469540 ?auto_469548 ) ) ( not ( = ?auto_469540 ?auto_469549 ) ) ( not ( = ?auto_469540 ?auto_469550 ) ) ( not ( = ?auto_469541 ?auto_469542 ) ) ( not ( = ?auto_469541 ?auto_469543 ) ) ( not ( = ?auto_469541 ?auto_469544 ) ) ( not ( = ?auto_469541 ?auto_469545 ) ) ( not ( = ?auto_469541 ?auto_469546 ) ) ( not ( = ?auto_469541 ?auto_469547 ) ) ( not ( = ?auto_469541 ?auto_469548 ) ) ( not ( = ?auto_469541 ?auto_469549 ) ) ( not ( = ?auto_469541 ?auto_469550 ) ) ( not ( = ?auto_469542 ?auto_469543 ) ) ( not ( = ?auto_469542 ?auto_469544 ) ) ( not ( = ?auto_469542 ?auto_469545 ) ) ( not ( = ?auto_469542 ?auto_469546 ) ) ( not ( = ?auto_469542 ?auto_469547 ) ) ( not ( = ?auto_469542 ?auto_469548 ) ) ( not ( = ?auto_469542 ?auto_469549 ) ) ( not ( = ?auto_469542 ?auto_469550 ) ) ( not ( = ?auto_469543 ?auto_469544 ) ) ( not ( = ?auto_469543 ?auto_469545 ) ) ( not ( = ?auto_469543 ?auto_469546 ) ) ( not ( = ?auto_469543 ?auto_469547 ) ) ( not ( = ?auto_469543 ?auto_469548 ) ) ( not ( = ?auto_469543 ?auto_469549 ) ) ( not ( = ?auto_469543 ?auto_469550 ) ) ( not ( = ?auto_469544 ?auto_469545 ) ) ( not ( = ?auto_469544 ?auto_469546 ) ) ( not ( = ?auto_469544 ?auto_469547 ) ) ( not ( = ?auto_469544 ?auto_469548 ) ) ( not ( = ?auto_469544 ?auto_469549 ) ) ( not ( = ?auto_469544 ?auto_469550 ) ) ( not ( = ?auto_469545 ?auto_469546 ) ) ( not ( = ?auto_469545 ?auto_469547 ) ) ( not ( = ?auto_469545 ?auto_469548 ) ) ( not ( = ?auto_469545 ?auto_469549 ) ) ( not ( = ?auto_469545 ?auto_469550 ) ) ( not ( = ?auto_469546 ?auto_469547 ) ) ( not ( = ?auto_469546 ?auto_469548 ) ) ( not ( = ?auto_469546 ?auto_469549 ) ) ( not ( = ?auto_469546 ?auto_469550 ) ) ( not ( = ?auto_469547 ?auto_469548 ) ) ( not ( = ?auto_469547 ?auto_469549 ) ) ( not ( = ?auto_469547 ?auto_469550 ) ) ( not ( = ?auto_469548 ?auto_469549 ) ) ( not ( = ?auto_469548 ?auto_469550 ) ) ( not ( = ?auto_469549 ?auto_469550 ) ) ( ON ?auto_469548 ?auto_469549 ) ( ON ?auto_469547 ?auto_469548 ) ( ON ?auto_469546 ?auto_469547 ) ( ON ?auto_469545 ?auto_469546 ) ( CLEAR ?auto_469543 ) ( ON ?auto_469544 ?auto_469545 ) ( CLEAR ?auto_469544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_469535 ?auto_469536 ?auto_469537 ?auto_469538 ?auto_469539 ?auto_469540 ?auto_469541 ?auto_469542 ?auto_469543 ?auto_469544 )
      ( MAKE-15PILE ?auto_469535 ?auto_469536 ?auto_469537 ?auto_469538 ?auto_469539 ?auto_469540 ?auto_469541 ?auto_469542 ?auto_469543 ?auto_469544 ?auto_469545 ?auto_469546 ?auto_469547 ?auto_469548 ?auto_469549 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_469597 - BLOCK
      ?auto_469598 - BLOCK
      ?auto_469599 - BLOCK
      ?auto_469600 - BLOCK
      ?auto_469601 - BLOCK
      ?auto_469602 - BLOCK
      ?auto_469603 - BLOCK
      ?auto_469604 - BLOCK
      ?auto_469605 - BLOCK
      ?auto_469606 - BLOCK
      ?auto_469607 - BLOCK
      ?auto_469608 - BLOCK
      ?auto_469609 - BLOCK
      ?auto_469610 - BLOCK
      ?auto_469611 - BLOCK
    )
    :vars
    (
      ?auto_469612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469611 ?auto_469612 ) ( ON-TABLE ?auto_469597 ) ( ON ?auto_469598 ?auto_469597 ) ( ON ?auto_469599 ?auto_469598 ) ( ON ?auto_469600 ?auto_469599 ) ( ON ?auto_469601 ?auto_469600 ) ( ON ?auto_469602 ?auto_469601 ) ( ON ?auto_469603 ?auto_469602 ) ( ON ?auto_469604 ?auto_469603 ) ( not ( = ?auto_469597 ?auto_469598 ) ) ( not ( = ?auto_469597 ?auto_469599 ) ) ( not ( = ?auto_469597 ?auto_469600 ) ) ( not ( = ?auto_469597 ?auto_469601 ) ) ( not ( = ?auto_469597 ?auto_469602 ) ) ( not ( = ?auto_469597 ?auto_469603 ) ) ( not ( = ?auto_469597 ?auto_469604 ) ) ( not ( = ?auto_469597 ?auto_469605 ) ) ( not ( = ?auto_469597 ?auto_469606 ) ) ( not ( = ?auto_469597 ?auto_469607 ) ) ( not ( = ?auto_469597 ?auto_469608 ) ) ( not ( = ?auto_469597 ?auto_469609 ) ) ( not ( = ?auto_469597 ?auto_469610 ) ) ( not ( = ?auto_469597 ?auto_469611 ) ) ( not ( = ?auto_469597 ?auto_469612 ) ) ( not ( = ?auto_469598 ?auto_469599 ) ) ( not ( = ?auto_469598 ?auto_469600 ) ) ( not ( = ?auto_469598 ?auto_469601 ) ) ( not ( = ?auto_469598 ?auto_469602 ) ) ( not ( = ?auto_469598 ?auto_469603 ) ) ( not ( = ?auto_469598 ?auto_469604 ) ) ( not ( = ?auto_469598 ?auto_469605 ) ) ( not ( = ?auto_469598 ?auto_469606 ) ) ( not ( = ?auto_469598 ?auto_469607 ) ) ( not ( = ?auto_469598 ?auto_469608 ) ) ( not ( = ?auto_469598 ?auto_469609 ) ) ( not ( = ?auto_469598 ?auto_469610 ) ) ( not ( = ?auto_469598 ?auto_469611 ) ) ( not ( = ?auto_469598 ?auto_469612 ) ) ( not ( = ?auto_469599 ?auto_469600 ) ) ( not ( = ?auto_469599 ?auto_469601 ) ) ( not ( = ?auto_469599 ?auto_469602 ) ) ( not ( = ?auto_469599 ?auto_469603 ) ) ( not ( = ?auto_469599 ?auto_469604 ) ) ( not ( = ?auto_469599 ?auto_469605 ) ) ( not ( = ?auto_469599 ?auto_469606 ) ) ( not ( = ?auto_469599 ?auto_469607 ) ) ( not ( = ?auto_469599 ?auto_469608 ) ) ( not ( = ?auto_469599 ?auto_469609 ) ) ( not ( = ?auto_469599 ?auto_469610 ) ) ( not ( = ?auto_469599 ?auto_469611 ) ) ( not ( = ?auto_469599 ?auto_469612 ) ) ( not ( = ?auto_469600 ?auto_469601 ) ) ( not ( = ?auto_469600 ?auto_469602 ) ) ( not ( = ?auto_469600 ?auto_469603 ) ) ( not ( = ?auto_469600 ?auto_469604 ) ) ( not ( = ?auto_469600 ?auto_469605 ) ) ( not ( = ?auto_469600 ?auto_469606 ) ) ( not ( = ?auto_469600 ?auto_469607 ) ) ( not ( = ?auto_469600 ?auto_469608 ) ) ( not ( = ?auto_469600 ?auto_469609 ) ) ( not ( = ?auto_469600 ?auto_469610 ) ) ( not ( = ?auto_469600 ?auto_469611 ) ) ( not ( = ?auto_469600 ?auto_469612 ) ) ( not ( = ?auto_469601 ?auto_469602 ) ) ( not ( = ?auto_469601 ?auto_469603 ) ) ( not ( = ?auto_469601 ?auto_469604 ) ) ( not ( = ?auto_469601 ?auto_469605 ) ) ( not ( = ?auto_469601 ?auto_469606 ) ) ( not ( = ?auto_469601 ?auto_469607 ) ) ( not ( = ?auto_469601 ?auto_469608 ) ) ( not ( = ?auto_469601 ?auto_469609 ) ) ( not ( = ?auto_469601 ?auto_469610 ) ) ( not ( = ?auto_469601 ?auto_469611 ) ) ( not ( = ?auto_469601 ?auto_469612 ) ) ( not ( = ?auto_469602 ?auto_469603 ) ) ( not ( = ?auto_469602 ?auto_469604 ) ) ( not ( = ?auto_469602 ?auto_469605 ) ) ( not ( = ?auto_469602 ?auto_469606 ) ) ( not ( = ?auto_469602 ?auto_469607 ) ) ( not ( = ?auto_469602 ?auto_469608 ) ) ( not ( = ?auto_469602 ?auto_469609 ) ) ( not ( = ?auto_469602 ?auto_469610 ) ) ( not ( = ?auto_469602 ?auto_469611 ) ) ( not ( = ?auto_469602 ?auto_469612 ) ) ( not ( = ?auto_469603 ?auto_469604 ) ) ( not ( = ?auto_469603 ?auto_469605 ) ) ( not ( = ?auto_469603 ?auto_469606 ) ) ( not ( = ?auto_469603 ?auto_469607 ) ) ( not ( = ?auto_469603 ?auto_469608 ) ) ( not ( = ?auto_469603 ?auto_469609 ) ) ( not ( = ?auto_469603 ?auto_469610 ) ) ( not ( = ?auto_469603 ?auto_469611 ) ) ( not ( = ?auto_469603 ?auto_469612 ) ) ( not ( = ?auto_469604 ?auto_469605 ) ) ( not ( = ?auto_469604 ?auto_469606 ) ) ( not ( = ?auto_469604 ?auto_469607 ) ) ( not ( = ?auto_469604 ?auto_469608 ) ) ( not ( = ?auto_469604 ?auto_469609 ) ) ( not ( = ?auto_469604 ?auto_469610 ) ) ( not ( = ?auto_469604 ?auto_469611 ) ) ( not ( = ?auto_469604 ?auto_469612 ) ) ( not ( = ?auto_469605 ?auto_469606 ) ) ( not ( = ?auto_469605 ?auto_469607 ) ) ( not ( = ?auto_469605 ?auto_469608 ) ) ( not ( = ?auto_469605 ?auto_469609 ) ) ( not ( = ?auto_469605 ?auto_469610 ) ) ( not ( = ?auto_469605 ?auto_469611 ) ) ( not ( = ?auto_469605 ?auto_469612 ) ) ( not ( = ?auto_469606 ?auto_469607 ) ) ( not ( = ?auto_469606 ?auto_469608 ) ) ( not ( = ?auto_469606 ?auto_469609 ) ) ( not ( = ?auto_469606 ?auto_469610 ) ) ( not ( = ?auto_469606 ?auto_469611 ) ) ( not ( = ?auto_469606 ?auto_469612 ) ) ( not ( = ?auto_469607 ?auto_469608 ) ) ( not ( = ?auto_469607 ?auto_469609 ) ) ( not ( = ?auto_469607 ?auto_469610 ) ) ( not ( = ?auto_469607 ?auto_469611 ) ) ( not ( = ?auto_469607 ?auto_469612 ) ) ( not ( = ?auto_469608 ?auto_469609 ) ) ( not ( = ?auto_469608 ?auto_469610 ) ) ( not ( = ?auto_469608 ?auto_469611 ) ) ( not ( = ?auto_469608 ?auto_469612 ) ) ( not ( = ?auto_469609 ?auto_469610 ) ) ( not ( = ?auto_469609 ?auto_469611 ) ) ( not ( = ?auto_469609 ?auto_469612 ) ) ( not ( = ?auto_469610 ?auto_469611 ) ) ( not ( = ?auto_469610 ?auto_469612 ) ) ( not ( = ?auto_469611 ?auto_469612 ) ) ( ON ?auto_469610 ?auto_469611 ) ( ON ?auto_469609 ?auto_469610 ) ( ON ?auto_469608 ?auto_469609 ) ( ON ?auto_469607 ?auto_469608 ) ( ON ?auto_469606 ?auto_469607 ) ( CLEAR ?auto_469604 ) ( ON ?auto_469605 ?auto_469606 ) ( CLEAR ?auto_469605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_469597 ?auto_469598 ?auto_469599 ?auto_469600 ?auto_469601 ?auto_469602 ?auto_469603 ?auto_469604 ?auto_469605 )
      ( MAKE-15PILE ?auto_469597 ?auto_469598 ?auto_469599 ?auto_469600 ?auto_469601 ?auto_469602 ?auto_469603 ?auto_469604 ?auto_469605 ?auto_469606 ?auto_469607 ?auto_469608 ?auto_469609 ?auto_469610 ?auto_469611 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_469659 - BLOCK
      ?auto_469660 - BLOCK
      ?auto_469661 - BLOCK
      ?auto_469662 - BLOCK
      ?auto_469663 - BLOCK
      ?auto_469664 - BLOCK
      ?auto_469665 - BLOCK
      ?auto_469666 - BLOCK
      ?auto_469667 - BLOCK
      ?auto_469668 - BLOCK
      ?auto_469669 - BLOCK
      ?auto_469670 - BLOCK
      ?auto_469671 - BLOCK
      ?auto_469672 - BLOCK
      ?auto_469673 - BLOCK
    )
    :vars
    (
      ?auto_469674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469673 ?auto_469674 ) ( ON-TABLE ?auto_469659 ) ( ON ?auto_469660 ?auto_469659 ) ( ON ?auto_469661 ?auto_469660 ) ( ON ?auto_469662 ?auto_469661 ) ( ON ?auto_469663 ?auto_469662 ) ( ON ?auto_469664 ?auto_469663 ) ( ON ?auto_469665 ?auto_469664 ) ( not ( = ?auto_469659 ?auto_469660 ) ) ( not ( = ?auto_469659 ?auto_469661 ) ) ( not ( = ?auto_469659 ?auto_469662 ) ) ( not ( = ?auto_469659 ?auto_469663 ) ) ( not ( = ?auto_469659 ?auto_469664 ) ) ( not ( = ?auto_469659 ?auto_469665 ) ) ( not ( = ?auto_469659 ?auto_469666 ) ) ( not ( = ?auto_469659 ?auto_469667 ) ) ( not ( = ?auto_469659 ?auto_469668 ) ) ( not ( = ?auto_469659 ?auto_469669 ) ) ( not ( = ?auto_469659 ?auto_469670 ) ) ( not ( = ?auto_469659 ?auto_469671 ) ) ( not ( = ?auto_469659 ?auto_469672 ) ) ( not ( = ?auto_469659 ?auto_469673 ) ) ( not ( = ?auto_469659 ?auto_469674 ) ) ( not ( = ?auto_469660 ?auto_469661 ) ) ( not ( = ?auto_469660 ?auto_469662 ) ) ( not ( = ?auto_469660 ?auto_469663 ) ) ( not ( = ?auto_469660 ?auto_469664 ) ) ( not ( = ?auto_469660 ?auto_469665 ) ) ( not ( = ?auto_469660 ?auto_469666 ) ) ( not ( = ?auto_469660 ?auto_469667 ) ) ( not ( = ?auto_469660 ?auto_469668 ) ) ( not ( = ?auto_469660 ?auto_469669 ) ) ( not ( = ?auto_469660 ?auto_469670 ) ) ( not ( = ?auto_469660 ?auto_469671 ) ) ( not ( = ?auto_469660 ?auto_469672 ) ) ( not ( = ?auto_469660 ?auto_469673 ) ) ( not ( = ?auto_469660 ?auto_469674 ) ) ( not ( = ?auto_469661 ?auto_469662 ) ) ( not ( = ?auto_469661 ?auto_469663 ) ) ( not ( = ?auto_469661 ?auto_469664 ) ) ( not ( = ?auto_469661 ?auto_469665 ) ) ( not ( = ?auto_469661 ?auto_469666 ) ) ( not ( = ?auto_469661 ?auto_469667 ) ) ( not ( = ?auto_469661 ?auto_469668 ) ) ( not ( = ?auto_469661 ?auto_469669 ) ) ( not ( = ?auto_469661 ?auto_469670 ) ) ( not ( = ?auto_469661 ?auto_469671 ) ) ( not ( = ?auto_469661 ?auto_469672 ) ) ( not ( = ?auto_469661 ?auto_469673 ) ) ( not ( = ?auto_469661 ?auto_469674 ) ) ( not ( = ?auto_469662 ?auto_469663 ) ) ( not ( = ?auto_469662 ?auto_469664 ) ) ( not ( = ?auto_469662 ?auto_469665 ) ) ( not ( = ?auto_469662 ?auto_469666 ) ) ( not ( = ?auto_469662 ?auto_469667 ) ) ( not ( = ?auto_469662 ?auto_469668 ) ) ( not ( = ?auto_469662 ?auto_469669 ) ) ( not ( = ?auto_469662 ?auto_469670 ) ) ( not ( = ?auto_469662 ?auto_469671 ) ) ( not ( = ?auto_469662 ?auto_469672 ) ) ( not ( = ?auto_469662 ?auto_469673 ) ) ( not ( = ?auto_469662 ?auto_469674 ) ) ( not ( = ?auto_469663 ?auto_469664 ) ) ( not ( = ?auto_469663 ?auto_469665 ) ) ( not ( = ?auto_469663 ?auto_469666 ) ) ( not ( = ?auto_469663 ?auto_469667 ) ) ( not ( = ?auto_469663 ?auto_469668 ) ) ( not ( = ?auto_469663 ?auto_469669 ) ) ( not ( = ?auto_469663 ?auto_469670 ) ) ( not ( = ?auto_469663 ?auto_469671 ) ) ( not ( = ?auto_469663 ?auto_469672 ) ) ( not ( = ?auto_469663 ?auto_469673 ) ) ( not ( = ?auto_469663 ?auto_469674 ) ) ( not ( = ?auto_469664 ?auto_469665 ) ) ( not ( = ?auto_469664 ?auto_469666 ) ) ( not ( = ?auto_469664 ?auto_469667 ) ) ( not ( = ?auto_469664 ?auto_469668 ) ) ( not ( = ?auto_469664 ?auto_469669 ) ) ( not ( = ?auto_469664 ?auto_469670 ) ) ( not ( = ?auto_469664 ?auto_469671 ) ) ( not ( = ?auto_469664 ?auto_469672 ) ) ( not ( = ?auto_469664 ?auto_469673 ) ) ( not ( = ?auto_469664 ?auto_469674 ) ) ( not ( = ?auto_469665 ?auto_469666 ) ) ( not ( = ?auto_469665 ?auto_469667 ) ) ( not ( = ?auto_469665 ?auto_469668 ) ) ( not ( = ?auto_469665 ?auto_469669 ) ) ( not ( = ?auto_469665 ?auto_469670 ) ) ( not ( = ?auto_469665 ?auto_469671 ) ) ( not ( = ?auto_469665 ?auto_469672 ) ) ( not ( = ?auto_469665 ?auto_469673 ) ) ( not ( = ?auto_469665 ?auto_469674 ) ) ( not ( = ?auto_469666 ?auto_469667 ) ) ( not ( = ?auto_469666 ?auto_469668 ) ) ( not ( = ?auto_469666 ?auto_469669 ) ) ( not ( = ?auto_469666 ?auto_469670 ) ) ( not ( = ?auto_469666 ?auto_469671 ) ) ( not ( = ?auto_469666 ?auto_469672 ) ) ( not ( = ?auto_469666 ?auto_469673 ) ) ( not ( = ?auto_469666 ?auto_469674 ) ) ( not ( = ?auto_469667 ?auto_469668 ) ) ( not ( = ?auto_469667 ?auto_469669 ) ) ( not ( = ?auto_469667 ?auto_469670 ) ) ( not ( = ?auto_469667 ?auto_469671 ) ) ( not ( = ?auto_469667 ?auto_469672 ) ) ( not ( = ?auto_469667 ?auto_469673 ) ) ( not ( = ?auto_469667 ?auto_469674 ) ) ( not ( = ?auto_469668 ?auto_469669 ) ) ( not ( = ?auto_469668 ?auto_469670 ) ) ( not ( = ?auto_469668 ?auto_469671 ) ) ( not ( = ?auto_469668 ?auto_469672 ) ) ( not ( = ?auto_469668 ?auto_469673 ) ) ( not ( = ?auto_469668 ?auto_469674 ) ) ( not ( = ?auto_469669 ?auto_469670 ) ) ( not ( = ?auto_469669 ?auto_469671 ) ) ( not ( = ?auto_469669 ?auto_469672 ) ) ( not ( = ?auto_469669 ?auto_469673 ) ) ( not ( = ?auto_469669 ?auto_469674 ) ) ( not ( = ?auto_469670 ?auto_469671 ) ) ( not ( = ?auto_469670 ?auto_469672 ) ) ( not ( = ?auto_469670 ?auto_469673 ) ) ( not ( = ?auto_469670 ?auto_469674 ) ) ( not ( = ?auto_469671 ?auto_469672 ) ) ( not ( = ?auto_469671 ?auto_469673 ) ) ( not ( = ?auto_469671 ?auto_469674 ) ) ( not ( = ?auto_469672 ?auto_469673 ) ) ( not ( = ?auto_469672 ?auto_469674 ) ) ( not ( = ?auto_469673 ?auto_469674 ) ) ( ON ?auto_469672 ?auto_469673 ) ( ON ?auto_469671 ?auto_469672 ) ( ON ?auto_469670 ?auto_469671 ) ( ON ?auto_469669 ?auto_469670 ) ( ON ?auto_469668 ?auto_469669 ) ( ON ?auto_469667 ?auto_469668 ) ( CLEAR ?auto_469665 ) ( ON ?auto_469666 ?auto_469667 ) ( CLEAR ?auto_469666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_469659 ?auto_469660 ?auto_469661 ?auto_469662 ?auto_469663 ?auto_469664 ?auto_469665 ?auto_469666 )
      ( MAKE-15PILE ?auto_469659 ?auto_469660 ?auto_469661 ?auto_469662 ?auto_469663 ?auto_469664 ?auto_469665 ?auto_469666 ?auto_469667 ?auto_469668 ?auto_469669 ?auto_469670 ?auto_469671 ?auto_469672 ?auto_469673 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_469721 - BLOCK
      ?auto_469722 - BLOCK
      ?auto_469723 - BLOCK
      ?auto_469724 - BLOCK
      ?auto_469725 - BLOCK
      ?auto_469726 - BLOCK
      ?auto_469727 - BLOCK
      ?auto_469728 - BLOCK
      ?auto_469729 - BLOCK
      ?auto_469730 - BLOCK
      ?auto_469731 - BLOCK
      ?auto_469732 - BLOCK
      ?auto_469733 - BLOCK
      ?auto_469734 - BLOCK
      ?auto_469735 - BLOCK
    )
    :vars
    (
      ?auto_469736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469735 ?auto_469736 ) ( ON-TABLE ?auto_469721 ) ( ON ?auto_469722 ?auto_469721 ) ( ON ?auto_469723 ?auto_469722 ) ( ON ?auto_469724 ?auto_469723 ) ( ON ?auto_469725 ?auto_469724 ) ( ON ?auto_469726 ?auto_469725 ) ( not ( = ?auto_469721 ?auto_469722 ) ) ( not ( = ?auto_469721 ?auto_469723 ) ) ( not ( = ?auto_469721 ?auto_469724 ) ) ( not ( = ?auto_469721 ?auto_469725 ) ) ( not ( = ?auto_469721 ?auto_469726 ) ) ( not ( = ?auto_469721 ?auto_469727 ) ) ( not ( = ?auto_469721 ?auto_469728 ) ) ( not ( = ?auto_469721 ?auto_469729 ) ) ( not ( = ?auto_469721 ?auto_469730 ) ) ( not ( = ?auto_469721 ?auto_469731 ) ) ( not ( = ?auto_469721 ?auto_469732 ) ) ( not ( = ?auto_469721 ?auto_469733 ) ) ( not ( = ?auto_469721 ?auto_469734 ) ) ( not ( = ?auto_469721 ?auto_469735 ) ) ( not ( = ?auto_469721 ?auto_469736 ) ) ( not ( = ?auto_469722 ?auto_469723 ) ) ( not ( = ?auto_469722 ?auto_469724 ) ) ( not ( = ?auto_469722 ?auto_469725 ) ) ( not ( = ?auto_469722 ?auto_469726 ) ) ( not ( = ?auto_469722 ?auto_469727 ) ) ( not ( = ?auto_469722 ?auto_469728 ) ) ( not ( = ?auto_469722 ?auto_469729 ) ) ( not ( = ?auto_469722 ?auto_469730 ) ) ( not ( = ?auto_469722 ?auto_469731 ) ) ( not ( = ?auto_469722 ?auto_469732 ) ) ( not ( = ?auto_469722 ?auto_469733 ) ) ( not ( = ?auto_469722 ?auto_469734 ) ) ( not ( = ?auto_469722 ?auto_469735 ) ) ( not ( = ?auto_469722 ?auto_469736 ) ) ( not ( = ?auto_469723 ?auto_469724 ) ) ( not ( = ?auto_469723 ?auto_469725 ) ) ( not ( = ?auto_469723 ?auto_469726 ) ) ( not ( = ?auto_469723 ?auto_469727 ) ) ( not ( = ?auto_469723 ?auto_469728 ) ) ( not ( = ?auto_469723 ?auto_469729 ) ) ( not ( = ?auto_469723 ?auto_469730 ) ) ( not ( = ?auto_469723 ?auto_469731 ) ) ( not ( = ?auto_469723 ?auto_469732 ) ) ( not ( = ?auto_469723 ?auto_469733 ) ) ( not ( = ?auto_469723 ?auto_469734 ) ) ( not ( = ?auto_469723 ?auto_469735 ) ) ( not ( = ?auto_469723 ?auto_469736 ) ) ( not ( = ?auto_469724 ?auto_469725 ) ) ( not ( = ?auto_469724 ?auto_469726 ) ) ( not ( = ?auto_469724 ?auto_469727 ) ) ( not ( = ?auto_469724 ?auto_469728 ) ) ( not ( = ?auto_469724 ?auto_469729 ) ) ( not ( = ?auto_469724 ?auto_469730 ) ) ( not ( = ?auto_469724 ?auto_469731 ) ) ( not ( = ?auto_469724 ?auto_469732 ) ) ( not ( = ?auto_469724 ?auto_469733 ) ) ( not ( = ?auto_469724 ?auto_469734 ) ) ( not ( = ?auto_469724 ?auto_469735 ) ) ( not ( = ?auto_469724 ?auto_469736 ) ) ( not ( = ?auto_469725 ?auto_469726 ) ) ( not ( = ?auto_469725 ?auto_469727 ) ) ( not ( = ?auto_469725 ?auto_469728 ) ) ( not ( = ?auto_469725 ?auto_469729 ) ) ( not ( = ?auto_469725 ?auto_469730 ) ) ( not ( = ?auto_469725 ?auto_469731 ) ) ( not ( = ?auto_469725 ?auto_469732 ) ) ( not ( = ?auto_469725 ?auto_469733 ) ) ( not ( = ?auto_469725 ?auto_469734 ) ) ( not ( = ?auto_469725 ?auto_469735 ) ) ( not ( = ?auto_469725 ?auto_469736 ) ) ( not ( = ?auto_469726 ?auto_469727 ) ) ( not ( = ?auto_469726 ?auto_469728 ) ) ( not ( = ?auto_469726 ?auto_469729 ) ) ( not ( = ?auto_469726 ?auto_469730 ) ) ( not ( = ?auto_469726 ?auto_469731 ) ) ( not ( = ?auto_469726 ?auto_469732 ) ) ( not ( = ?auto_469726 ?auto_469733 ) ) ( not ( = ?auto_469726 ?auto_469734 ) ) ( not ( = ?auto_469726 ?auto_469735 ) ) ( not ( = ?auto_469726 ?auto_469736 ) ) ( not ( = ?auto_469727 ?auto_469728 ) ) ( not ( = ?auto_469727 ?auto_469729 ) ) ( not ( = ?auto_469727 ?auto_469730 ) ) ( not ( = ?auto_469727 ?auto_469731 ) ) ( not ( = ?auto_469727 ?auto_469732 ) ) ( not ( = ?auto_469727 ?auto_469733 ) ) ( not ( = ?auto_469727 ?auto_469734 ) ) ( not ( = ?auto_469727 ?auto_469735 ) ) ( not ( = ?auto_469727 ?auto_469736 ) ) ( not ( = ?auto_469728 ?auto_469729 ) ) ( not ( = ?auto_469728 ?auto_469730 ) ) ( not ( = ?auto_469728 ?auto_469731 ) ) ( not ( = ?auto_469728 ?auto_469732 ) ) ( not ( = ?auto_469728 ?auto_469733 ) ) ( not ( = ?auto_469728 ?auto_469734 ) ) ( not ( = ?auto_469728 ?auto_469735 ) ) ( not ( = ?auto_469728 ?auto_469736 ) ) ( not ( = ?auto_469729 ?auto_469730 ) ) ( not ( = ?auto_469729 ?auto_469731 ) ) ( not ( = ?auto_469729 ?auto_469732 ) ) ( not ( = ?auto_469729 ?auto_469733 ) ) ( not ( = ?auto_469729 ?auto_469734 ) ) ( not ( = ?auto_469729 ?auto_469735 ) ) ( not ( = ?auto_469729 ?auto_469736 ) ) ( not ( = ?auto_469730 ?auto_469731 ) ) ( not ( = ?auto_469730 ?auto_469732 ) ) ( not ( = ?auto_469730 ?auto_469733 ) ) ( not ( = ?auto_469730 ?auto_469734 ) ) ( not ( = ?auto_469730 ?auto_469735 ) ) ( not ( = ?auto_469730 ?auto_469736 ) ) ( not ( = ?auto_469731 ?auto_469732 ) ) ( not ( = ?auto_469731 ?auto_469733 ) ) ( not ( = ?auto_469731 ?auto_469734 ) ) ( not ( = ?auto_469731 ?auto_469735 ) ) ( not ( = ?auto_469731 ?auto_469736 ) ) ( not ( = ?auto_469732 ?auto_469733 ) ) ( not ( = ?auto_469732 ?auto_469734 ) ) ( not ( = ?auto_469732 ?auto_469735 ) ) ( not ( = ?auto_469732 ?auto_469736 ) ) ( not ( = ?auto_469733 ?auto_469734 ) ) ( not ( = ?auto_469733 ?auto_469735 ) ) ( not ( = ?auto_469733 ?auto_469736 ) ) ( not ( = ?auto_469734 ?auto_469735 ) ) ( not ( = ?auto_469734 ?auto_469736 ) ) ( not ( = ?auto_469735 ?auto_469736 ) ) ( ON ?auto_469734 ?auto_469735 ) ( ON ?auto_469733 ?auto_469734 ) ( ON ?auto_469732 ?auto_469733 ) ( ON ?auto_469731 ?auto_469732 ) ( ON ?auto_469730 ?auto_469731 ) ( ON ?auto_469729 ?auto_469730 ) ( ON ?auto_469728 ?auto_469729 ) ( CLEAR ?auto_469726 ) ( ON ?auto_469727 ?auto_469728 ) ( CLEAR ?auto_469727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_469721 ?auto_469722 ?auto_469723 ?auto_469724 ?auto_469725 ?auto_469726 ?auto_469727 )
      ( MAKE-15PILE ?auto_469721 ?auto_469722 ?auto_469723 ?auto_469724 ?auto_469725 ?auto_469726 ?auto_469727 ?auto_469728 ?auto_469729 ?auto_469730 ?auto_469731 ?auto_469732 ?auto_469733 ?auto_469734 ?auto_469735 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_469783 - BLOCK
      ?auto_469784 - BLOCK
      ?auto_469785 - BLOCK
      ?auto_469786 - BLOCK
      ?auto_469787 - BLOCK
      ?auto_469788 - BLOCK
      ?auto_469789 - BLOCK
      ?auto_469790 - BLOCK
      ?auto_469791 - BLOCK
      ?auto_469792 - BLOCK
      ?auto_469793 - BLOCK
      ?auto_469794 - BLOCK
      ?auto_469795 - BLOCK
      ?auto_469796 - BLOCK
      ?auto_469797 - BLOCK
    )
    :vars
    (
      ?auto_469798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469797 ?auto_469798 ) ( ON-TABLE ?auto_469783 ) ( ON ?auto_469784 ?auto_469783 ) ( ON ?auto_469785 ?auto_469784 ) ( ON ?auto_469786 ?auto_469785 ) ( ON ?auto_469787 ?auto_469786 ) ( not ( = ?auto_469783 ?auto_469784 ) ) ( not ( = ?auto_469783 ?auto_469785 ) ) ( not ( = ?auto_469783 ?auto_469786 ) ) ( not ( = ?auto_469783 ?auto_469787 ) ) ( not ( = ?auto_469783 ?auto_469788 ) ) ( not ( = ?auto_469783 ?auto_469789 ) ) ( not ( = ?auto_469783 ?auto_469790 ) ) ( not ( = ?auto_469783 ?auto_469791 ) ) ( not ( = ?auto_469783 ?auto_469792 ) ) ( not ( = ?auto_469783 ?auto_469793 ) ) ( not ( = ?auto_469783 ?auto_469794 ) ) ( not ( = ?auto_469783 ?auto_469795 ) ) ( not ( = ?auto_469783 ?auto_469796 ) ) ( not ( = ?auto_469783 ?auto_469797 ) ) ( not ( = ?auto_469783 ?auto_469798 ) ) ( not ( = ?auto_469784 ?auto_469785 ) ) ( not ( = ?auto_469784 ?auto_469786 ) ) ( not ( = ?auto_469784 ?auto_469787 ) ) ( not ( = ?auto_469784 ?auto_469788 ) ) ( not ( = ?auto_469784 ?auto_469789 ) ) ( not ( = ?auto_469784 ?auto_469790 ) ) ( not ( = ?auto_469784 ?auto_469791 ) ) ( not ( = ?auto_469784 ?auto_469792 ) ) ( not ( = ?auto_469784 ?auto_469793 ) ) ( not ( = ?auto_469784 ?auto_469794 ) ) ( not ( = ?auto_469784 ?auto_469795 ) ) ( not ( = ?auto_469784 ?auto_469796 ) ) ( not ( = ?auto_469784 ?auto_469797 ) ) ( not ( = ?auto_469784 ?auto_469798 ) ) ( not ( = ?auto_469785 ?auto_469786 ) ) ( not ( = ?auto_469785 ?auto_469787 ) ) ( not ( = ?auto_469785 ?auto_469788 ) ) ( not ( = ?auto_469785 ?auto_469789 ) ) ( not ( = ?auto_469785 ?auto_469790 ) ) ( not ( = ?auto_469785 ?auto_469791 ) ) ( not ( = ?auto_469785 ?auto_469792 ) ) ( not ( = ?auto_469785 ?auto_469793 ) ) ( not ( = ?auto_469785 ?auto_469794 ) ) ( not ( = ?auto_469785 ?auto_469795 ) ) ( not ( = ?auto_469785 ?auto_469796 ) ) ( not ( = ?auto_469785 ?auto_469797 ) ) ( not ( = ?auto_469785 ?auto_469798 ) ) ( not ( = ?auto_469786 ?auto_469787 ) ) ( not ( = ?auto_469786 ?auto_469788 ) ) ( not ( = ?auto_469786 ?auto_469789 ) ) ( not ( = ?auto_469786 ?auto_469790 ) ) ( not ( = ?auto_469786 ?auto_469791 ) ) ( not ( = ?auto_469786 ?auto_469792 ) ) ( not ( = ?auto_469786 ?auto_469793 ) ) ( not ( = ?auto_469786 ?auto_469794 ) ) ( not ( = ?auto_469786 ?auto_469795 ) ) ( not ( = ?auto_469786 ?auto_469796 ) ) ( not ( = ?auto_469786 ?auto_469797 ) ) ( not ( = ?auto_469786 ?auto_469798 ) ) ( not ( = ?auto_469787 ?auto_469788 ) ) ( not ( = ?auto_469787 ?auto_469789 ) ) ( not ( = ?auto_469787 ?auto_469790 ) ) ( not ( = ?auto_469787 ?auto_469791 ) ) ( not ( = ?auto_469787 ?auto_469792 ) ) ( not ( = ?auto_469787 ?auto_469793 ) ) ( not ( = ?auto_469787 ?auto_469794 ) ) ( not ( = ?auto_469787 ?auto_469795 ) ) ( not ( = ?auto_469787 ?auto_469796 ) ) ( not ( = ?auto_469787 ?auto_469797 ) ) ( not ( = ?auto_469787 ?auto_469798 ) ) ( not ( = ?auto_469788 ?auto_469789 ) ) ( not ( = ?auto_469788 ?auto_469790 ) ) ( not ( = ?auto_469788 ?auto_469791 ) ) ( not ( = ?auto_469788 ?auto_469792 ) ) ( not ( = ?auto_469788 ?auto_469793 ) ) ( not ( = ?auto_469788 ?auto_469794 ) ) ( not ( = ?auto_469788 ?auto_469795 ) ) ( not ( = ?auto_469788 ?auto_469796 ) ) ( not ( = ?auto_469788 ?auto_469797 ) ) ( not ( = ?auto_469788 ?auto_469798 ) ) ( not ( = ?auto_469789 ?auto_469790 ) ) ( not ( = ?auto_469789 ?auto_469791 ) ) ( not ( = ?auto_469789 ?auto_469792 ) ) ( not ( = ?auto_469789 ?auto_469793 ) ) ( not ( = ?auto_469789 ?auto_469794 ) ) ( not ( = ?auto_469789 ?auto_469795 ) ) ( not ( = ?auto_469789 ?auto_469796 ) ) ( not ( = ?auto_469789 ?auto_469797 ) ) ( not ( = ?auto_469789 ?auto_469798 ) ) ( not ( = ?auto_469790 ?auto_469791 ) ) ( not ( = ?auto_469790 ?auto_469792 ) ) ( not ( = ?auto_469790 ?auto_469793 ) ) ( not ( = ?auto_469790 ?auto_469794 ) ) ( not ( = ?auto_469790 ?auto_469795 ) ) ( not ( = ?auto_469790 ?auto_469796 ) ) ( not ( = ?auto_469790 ?auto_469797 ) ) ( not ( = ?auto_469790 ?auto_469798 ) ) ( not ( = ?auto_469791 ?auto_469792 ) ) ( not ( = ?auto_469791 ?auto_469793 ) ) ( not ( = ?auto_469791 ?auto_469794 ) ) ( not ( = ?auto_469791 ?auto_469795 ) ) ( not ( = ?auto_469791 ?auto_469796 ) ) ( not ( = ?auto_469791 ?auto_469797 ) ) ( not ( = ?auto_469791 ?auto_469798 ) ) ( not ( = ?auto_469792 ?auto_469793 ) ) ( not ( = ?auto_469792 ?auto_469794 ) ) ( not ( = ?auto_469792 ?auto_469795 ) ) ( not ( = ?auto_469792 ?auto_469796 ) ) ( not ( = ?auto_469792 ?auto_469797 ) ) ( not ( = ?auto_469792 ?auto_469798 ) ) ( not ( = ?auto_469793 ?auto_469794 ) ) ( not ( = ?auto_469793 ?auto_469795 ) ) ( not ( = ?auto_469793 ?auto_469796 ) ) ( not ( = ?auto_469793 ?auto_469797 ) ) ( not ( = ?auto_469793 ?auto_469798 ) ) ( not ( = ?auto_469794 ?auto_469795 ) ) ( not ( = ?auto_469794 ?auto_469796 ) ) ( not ( = ?auto_469794 ?auto_469797 ) ) ( not ( = ?auto_469794 ?auto_469798 ) ) ( not ( = ?auto_469795 ?auto_469796 ) ) ( not ( = ?auto_469795 ?auto_469797 ) ) ( not ( = ?auto_469795 ?auto_469798 ) ) ( not ( = ?auto_469796 ?auto_469797 ) ) ( not ( = ?auto_469796 ?auto_469798 ) ) ( not ( = ?auto_469797 ?auto_469798 ) ) ( ON ?auto_469796 ?auto_469797 ) ( ON ?auto_469795 ?auto_469796 ) ( ON ?auto_469794 ?auto_469795 ) ( ON ?auto_469793 ?auto_469794 ) ( ON ?auto_469792 ?auto_469793 ) ( ON ?auto_469791 ?auto_469792 ) ( ON ?auto_469790 ?auto_469791 ) ( ON ?auto_469789 ?auto_469790 ) ( CLEAR ?auto_469787 ) ( ON ?auto_469788 ?auto_469789 ) ( CLEAR ?auto_469788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_469783 ?auto_469784 ?auto_469785 ?auto_469786 ?auto_469787 ?auto_469788 )
      ( MAKE-15PILE ?auto_469783 ?auto_469784 ?auto_469785 ?auto_469786 ?auto_469787 ?auto_469788 ?auto_469789 ?auto_469790 ?auto_469791 ?auto_469792 ?auto_469793 ?auto_469794 ?auto_469795 ?auto_469796 ?auto_469797 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_469845 - BLOCK
      ?auto_469846 - BLOCK
      ?auto_469847 - BLOCK
      ?auto_469848 - BLOCK
      ?auto_469849 - BLOCK
      ?auto_469850 - BLOCK
      ?auto_469851 - BLOCK
      ?auto_469852 - BLOCK
      ?auto_469853 - BLOCK
      ?auto_469854 - BLOCK
      ?auto_469855 - BLOCK
      ?auto_469856 - BLOCK
      ?auto_469857 - BLOCK
      ?auto_469858 - BLOCK
      ?auto_469859 - BLOCK
    )
    :vars
    (
      ?auto_469860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469859 ?auto_469860 ) ( ON-TABLE ?auto_469845 ) ( ON ?auto_469846 ?auto_469845 ) ( ON ?auto_469847 ?auto_469846 ) ( ON ?auto_469848 ?auto_469847 ) ( not ( = ?auto_469845 ?auto_469846 ) ) ( not ( = ?auto_469845 ?auto_469847 ) ) ( not ( = ?auto_469845 ?auto_469848 ) ) ( not ( = ?auto_469845 ?auto_469849 ) ) ( not ( = ?auto_469845 ?auto_469850 ) ) ( not ( = ?auto_469845 ?auto_469851 ) ) ( not ( = ?auto_469845 ?auto_469852 ) ) ( not ( = ?auto_469845 ?auto_469853 ) ) ( not ( = ?auto_469845 ?auto_469854 ) ) ( not ( = ?auto_469845 ?auto_469855 ) ) ( not ( = ?auto_469845 ?auto_469856 ) ) ( not ( = ?auto_469845 ?auto_469857 ) ) ( not ( = ?auto_469845 ?auto_469858 ) ) ( not ( = ?auto_469845 ?auto_469859 ) ) ( not ( = ?auto_469845 ?auto_469860 ) ) ( not ( = ?auto_469846 ?auto_469847 ) ) ( not ( = ?auto_469846 ?auto_469848 ) ) ( not ( = ?auto_469846 ?auto_469849 ) ) ( not ( = ?auto_469846 ?auto_469850 ) ) ( not ( = ?auto_469846 ?auto_469851 ) ) ( not ( = ?auto_469846 ?auto_469852 ) ) ( not ( = ?auto_469846 ?auto_469853 ) ) ( not ( = ?auto_469846 ?auto_469854 ) ) ( not ( = ?auto_469846 ?auto_469855 ) ) ( not ( = ?auto_469846 ?auto_469856 ) ) ( not ( = ?auto_469846 ?auto_469857 ) ) ( not ( = ?auto_469846 ?auto_469858 ) ) ( not ( = ?auto_469846 ?auto_469859 ) ) ( not ( = ?auto_469846 ?auto_469860 ) ) ( not ( = ?auto_469847 ?auto_469848 ) ) ( not ( = ?auto_469847 ?auto_469849 ) ) ( not ( = ?auto_469847 ?auto_469850 ) ) ( not ( = ?auto_469847 ?auto_469851 ) ) ( not ( = ?auto_469847 ?auto_469852 ) ) ( not ( = ?auto_469847 ?auto_469853 ) ) ( not ( = ?auto_469847 ?auto_469854 ) ) ( not ( = ?auto_469847 ?auto_469855 ) ) ( not ( = ?auto_469847 ?auto_469856 ) ) ( not ( = ?auto_469847 ?auto_469857 ) ) ( not ( = ?auto_469847 ?auto_469858 ) ) ( not ( = ?auto_469847 ?auto_469859 ) ) ( not ( = ?auto_469847 ?auto_469860 ) ) ( not ( = ?auto_469848 ?auto_469849 ) ) ( not ( = ?auto_469848 ?auto_469850 ) ) ( not ( = ?auto_469848 ?auto_469851 ) ) ( not ( = ?auto_469848 ?auto_469852 ) ) ( not ( = ?auto_469848 ?auto_469853 ) ) ( not ( = ?auto_469848 ?auto_469854 ) ) ( not ( = ?auto_469848 ?auto_469855 ) ) ( not ( = ?auto_469848 ?auto_469856 ) ) ( not ( = ?auto_469848 ?auto_469857 ) ) ( not ( = ?auto_469848 ?auto_469858 ) ) ( not ( = ?auto_469848 ?auto_469859 ) ) ( not ( = ?auto_469848 ?auto_469860 ) ) ( not ( = ?auto_469849 ?auto_469850 ) ) ( not ( = ?auto_469849 ?auto_469851 ) ) ( not ( = ?auto_469849 ?auto_469852 ) ) ( not ( = ?auto_469849 ?auto_469853 ) ) ( not ( = ?auto_469849 ?auto_469854 ) ) ( not ( = ?auto_469849 ?auto_469855 ) ) ( not ( = ?auto_469849 ?auto_469856 ) ) ( not ( = ?auto_469849 ?auto_469857 ) ) ( not ( = ?auto_469849 ?auto_469858 ) ) ( not ( = ?auto_469849 ?auto_469859 ) ) ( not ( = ?auto_469849 ?auto_469860 ) ) ( not ( = ?auto_469850 ?auto_469851 ) ) ( not ( = ?auto_469850 ?auto_469852 ) ) ( not ( = ?auto_469850 ?auto_469853 ) ) ( not ( = ?auto_469850 ?auto_469854 ) ) ( not ( = ?auto_469850 ?auto_469855 ) ) ( not ( = ?auto_469850 ?auto_469856 ) ) ( not ( = ?auto_469850 ?auto_469857 ) ) ( not ( = ?auto_469850 ?auto_469858 ) ) ( not ( = ?auto_469850 ?auto_469859 ) ) ( not ( = ?auto_469850 ?auto_469860 ) ) ( not ( = ?auto_469851 ?auto_469852 ) ) ( not ( = ?auto_469851 ?auto_469853 ) ) ( not ( = ?auto_469851 ?auto_469854 ) ) ( not ( = ?auto_469851 ?auto_469855 ) ) ( not ( = ?auto_469851 ?auto_469856 ) ) ( not ( = ?auto_469851 ?auto_469857 ) ) ( not ( = ?auto_469851 ?auto_469858 ) ) ( not ( = ?auto_469851 ?auto_469859 ) ) ( not ( = ?auto_469851 ?auto_469860 ) ) ( not ( = ?auto_469852 ?auto_469853 ) ) ( not ( = ?auto_469852 ?auto_469854 ) ) ( not ( = ?auto_469852 ?auto_469855 ) ) ( not ( = ?auto_469852 ?auto_469856 ) ) ( not ( = ?auto_469852 ?auto_469857 ) ) ( not ( = ?auto_469852 ?auto_469858 ) ) ( not ( = ?auto_469852 ?auto_469859 ) ) ( not ( = ?auto_469852 ?auto_469860 ) ) ( not ( = ?auto_469853 ?auto_469854 ) ) ( not ( = ?auto_469853 ?auto_469855 ) ) ( not ( = ?auto_469853 ?auto_469856 ) ) ( not ( = ?auto_469853 ?auto_469857 ) ) ( not ( = ?auto_469853 ?auto_469858 ) ) ( not ( = ?auto_469853 ?auto_469859 ) ) ( not ( = ?auto_469853 ?auto_469860 ) ) ( not ( = ?auto_469854 ?auto_469855 ) ) ( not ( = ?auto_469854 ?auto_469856 ) ) ( not ( = ?auto_469854 ?auto_469857 ) ) ( not ( = ?auto_469854 ?auto_469858 ) ) ( not ( = ?auto_469854 ?auto_469859 ) ) ( not ( = ?auto_469854 ?auto_469860 ) ) ( not ( = ?auto_469855 ?auto_469856 ) ) ( not ( = ?auto_469855 ?auto_469857 ) ) ( not ( = ?auto_469855 ?auto_469858 ) ) ( not ( = ?auto_469855 ?auto_469859 ) ) ( not ( = ?auto_469855 ?auto_469860 ) ) ( not ( = ?auto_469856 ?auto_469857 ) ) ( not ( = ?auto_469856 ?auto_469858 ) ) ( not ( = ?auto_469856 ?auto_469859 ) ) ( not ( = ?auto_469856 ?auto_469860 ) ) ( not ( = ?auto_469857 ?auto_469858 ) ) ( not ( = ?auto_469857 ?auto_469859 ) ) ( not ( = ?auto_469857 ?auto_469860 ) ) ( not ( = ?auto_469858 ?auto_469859 ) ) ( not ( = ?auto_469858 ?auto_469860 ) ) ( not ( = ?auto_469859 ?auto_469860 ) ) ( ON ?auto_469858 ?auto_469859 ) ( ON ?auto_469857 ?auto_469858 ) ( ON ?auto_469856 ?auto_469857 ) ( ON ?auto_469855 ?auto_469856 ) ( ON ?auto_469854 ?auto_469855 ) ( ON ?auto_469853 ?auto_469854 ) ( ON ?auto_469852 ?auto_469853 ) ( ON ?auto_469851 ?auto_469852 ) ( ON ?auto_469850 ?auto_469851 ) ( CLEAR ?auto_469848 ) ( ON ?auto_469849 ?auto_469850 ) ( CLEAR ?auto_469849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_469845 ?auto_469846 ?auto_469847 ?auto_469848 ?auto_469849 )
      ( MAKE-15PILE ?auto_469845 ?auto_469846 ?auto_469847 ?auto_469848 ?auto_469849 ?auto_469850 ?auto_469851 ?auto_469852 ?auto_469853 ?auto_469854 ?auto_469855 ?auto_469856 ?auto_469857 ?auto_469858 ?auto_469859 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_469907 - BLOCK
      ?auto_469908 - BLOCK
      ?auto_469909 - BLOCK
      ?auto_469910 - BLOCK
      ?auto_469911 - BLOCK
      ?auto_469912 - BLOCK
      ?auto_469913 - BLOCK
      ?auto_469914 - BLOCK
      ?auto_469915 - BLOCK
      ?auto_469916 - BLOCK
      ?auto_469917 - BLOCK
      ?auto_469918 - BLOCK
      ?auto_469919 - BLOCK
      ?auto_469920 - BLOCK
      ?auto_469921 - BLOCK
    )
    :vars
    (
      ?auto_469922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469921 ?auto_469922 ) ( ON-TABLE ?auto_469907 ) ( ON ?auto_469908 ?auto_469907 ) ( ON ?auto_469909 ?auto_469908 ) ( not ( = ?auto_469907 ?auto_469908 ) ) ( not ( = ?auto_469907 ?auto_469909 ) ) ( not ( = ?auto_469907 ?auto_469910 ) ) ( not ( = ?auto_469907 ?auto_469911 ) ) ( not ( = ?auto_469907 ?auto_469912 ) ) ( not ( = ?auto_469907 ?auto_469913 ) ) ( not ( = ?auto_469907 ?auto_469914 ) ) ( not ( = ?auto_469907 ?auto_469915 ) ) ( not ( = ?auto_469907 ?auto_469916 ) ) ( not ( = ?auto_469907 ?auto_469917 ) ) ( not ( = ?auto_469907 ?auto_469918 ) ) ( not ( = ?auto_469907 ?auto_469919 ) ) ( not ( = ?auto_469907 ?auto_469920 ) ) ( not ( = ?auto_469907 ?auto_469921 ) ) ( not ( = ?auto_469907 ?auto_469922 ) ) ( not ( = ?auto_469908 ?auto_469909 ) ) ( not ( = ?auto_469908 ?auto_469910 ) ) ( not ( = ?auto_469908 ?auto_469911 ) ) ( not ( = ?auto_469908 ?auto_469912 ) ) ( not ( = ?auto_469908 ?auto_469913 ) ) ( not ( = ?auto_469908 ?auto_469914 ) ) ( not ( = ?auto_469908 ?auto_469915 ) ) ( not ( = ?auto_469908 ?auto_469916 ) ) ( not ( = ?auto_469908 ?auto_469917 ) ) ( not ( = ?auto_469908 ?auto_469918 ) ) ( not ( = ?auto_469908 ?auto_469919 ) ) ( not ( = ?auto_469908 ?auto_469920 ) ) ( not ( = ?auto_469908 ?auto_469921 ) ) ( not ( = ?auto_469908 ?auto_469922 ) ) ( not ( = ?auto_469909 ?auto_469910 ) ) ( not ( = ?auto_469909 ?auto_469911 ) ) ( not ( = ?auto_469909 ?auto_469912 ) ) ( not ( = ?auto_469909 ?auto_469913 ) ) ( not ( = ?auto_469909 ?auto_469914 ) ) ( not ( = ?auto_469909 ?auto_469915 ) ) ( not ( = ?auto_469909 ?auto_469916 ) ) ( not ( = ?auto_469909 ?auto_469917 ) ) ( not ( = ?auto_469909 ?auto_469918 ) ) ( not ( = ?auto_469909 ?auto_469919 ) ) ( not ( = ?auto_469909 ?auto_469920 ) ) ( not ( = ?auto_469909 ?auto_469921 ) ) ( not ( = ?auto_469909 ?auto_469922 ) ) ( not ( = ?auto_469910 ?auto_469911 ) ) ( not ( = ?auto_469910 ?auto_469912 ) ) ( not ( = ?auto_469910 ?auto_469913 ) ) ( not ( = ?auto_469910 ?auto_469914 ) ) ( not ( = ?auto_469910 ?auto_469915 ) ) ( not ( = ?auto_469910 ?auto_469916 ) ) ( not ( = ?auto_469910 ?auto_469917 ) ) ( not ( = ?auto_469910 ?auto_469918 ) ) ( not ( = ?auto_469910 ?auto_469919 ) ) ( not ( = ?auto_469910 ?auto_469920 ) ) ( not ( = ?auto_469910 ?auto_469921 ) ) ( not ( = ?auto_469910 ?auto_469922 ) ) ( not ( = ?auto_469911 ?auto_469912 ) ) ( not ( = ?auto_469911 ?auto_469913 ) ) ( not ( = ?auto_469911 ?auto_469914 ) ) ( not ( = ?auto_469911 ?auto_469915 ) ) ( not ( = ?auto_469911 ?auto_469916 ) ) ( not ( = ?auto_469911 ?auto_469917 ) ) ( not ( = ?auto_469911 ?auto_469918 ) ) ( not ( = ?auto_469911 ?auto_469919 ) ) ( not ( = ?auto_469911 ?auto_469920 ) ) ( not ( = ?auto_469911 ?auto_469921 ) ) ( not ( = ?auto_469911 ?auto_469922 ) ) ( not ( = ?auto_469912 ?auto_469913 ) ) ( not ( = ?auto_469912 ?auto_469914 ) ) ( not ( = ?auto_469912 ?auto_469915 ) ) ( not ( = ?auto_469912 ?auto_469916 ) ) ( not ( = ?auto_469912 ?auto_469917 ) ) ( not ( = ?auto_469912 ?auto_469918 ) ) ( not ( = ?auto_469912 ?auto_469919 ) ) ( not ( = ?auto_469912 ?auto_469920 ) ) ( not ( = ?auto_469912 ?auto_469921 ) ) ( not ( = ?auto_469912 ?auto_469922 ) ) ( not ( = ?auto_469913 ?auto_469914 ) ) ( not ( = ?auto_469913 ?auto_469915 ) ) ( not ( = ?auto_469913 ?auto_469916 ) ) ( not ( = ?auto_469913 ?auto_469917 ) ) ( not ( = ?auto_469913 ?auto_469918 ) ) ( not ( = ?auto_469913 ?auto_469919 ) ) ( not ( = ?auto_469913 ?auto_469920 ) ) ( not ( = ?auto_469913 ?auto_469921 ) ) ( not ( = ?auto_469913 ?auto_469922 ) ) ( not ( = ?auto_469914 ?auto_469915 ) ) ( not ( = ?auto_469914 ?auto_469916 ) ) ( not ( = ?auto_469914 ?auto_469917 ) ) ( not ( = ?auto_469914 ?auto_469918 ) ) ( not ( = ?auto_469914 ?auto_469919 ) ) ( not ( = ?auto_469914 ?auto_469920 ) ) ( not ( = ?auto_469914 ?auto_469921 ) ) ( not ( = ?auto_469914 ?auto_469922 ) ) ( not ( = ?auto_469915 ?auto_469916 ) ) ( not ( = ?auto_469915 ?auto_469917 ) ) ( not ( = ?auto_469915 ?auto_469918 ) ) ( not ( = ?auto_469915 ?auto_469919 ) ) ( not ( = ?auto_469915 ?auto_469920 ) ) ( not ( = ?auto_469915 ?auto_469921 ) ) ( not ( = ?auto_469915 ?auto_469922 ) ) ( not ( = ?auto_469916 ?auto_469917 ) ) ( not ( = ?auto_469916 ?auto_469918 ) ) ( not ( = ?auto_469916 ?auto_469919 ) ) ( not ( = ?auto_469916 ?auto_469920 ) ) ( not ( = ?auto_469916 ?auto_469921 ) ) ( not ( = ?auto_469916 ?auto_469922 ) ) ( not ( = ?auto_469917 ?auto_469918 ) ) ( not ( = ?auto_469917 ?auto_469919 ) ) ( not ( = ?auto_469917 ?auto_469920 ) ) ( not ( = ?auto_469917 ?auto_469921 ) ) ( not ( = ?auto_469917 ?auto_469922 ) ) ( not ( = ?auto_469918 ?auto_469919 ) ) ( not ( = ?auto_469918 ?auto_469920 ) ) ( not ( = ?auto_469918 ?auto_469921 ) ) ( not ( = ?auto_469918 ?auto_469922 ) ) ( not ( = ?auto_469919 ?auto_469920 ) ) ( not ( = ?auto_469919 ?auto_469921 ) ) ( not ( = ?auto_469919 ?auto_469922 ) ) ( not ( = ?auto_469920 ?auto_469921 ) ) ( not ( = ?auto_469920 ?auto_469922 ) ) ( not ( = ?auto_469921 ?auto_469922 ) ) ( ON ?auto_469920 ?auto_469921 ) ( ON ?auto_469919 ?auto_469920 ) ( ON ?auto_469918 ?auto_469919 ) ( ON ?auto_469917 ?auto_469918 ) ( ON ?auto_469916 ?auto_469917 ) ( ON ?auto_469915 ?auto_469916 ) ( ON ?auto_469914 ?auto_469915 ) ( ON ?auto_469913 ?auto_469914 ) ( ON ?auto_469912 ?auto_469913 ) ( ON ?auto_469911 ?auto_469912 ) ( CLEAR ?auto_469909 ) ( ON ?auto_469910 ?auto_469911 ) ( CLEAR ?auto_469910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_469907 ?auto_469908 ?auto_469909 ?auto_469910 )
      ( MAKE-15PILE ?auto_469907 ?auto_469908 ?auto_469909 ?auto_469910 ?auto_469911 ?auto_469912 ?auto_469913 ?auto_469914 ?auto_469915 ?auto_469916 ?auto_469917 ?auto_469918 ?auto_469919 ?auto_469920 ?auto_469921 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_469969 - BLOCK
      ?auto_469970 - BLOCK
      ?auto_469971 - BLOCK
      ?auto_469972 - BLOCK
      ?auto_469973 - BLOCK
      ?auto_469974 - BLOCK
      ?auto_469975 - BLOCK
      ?auto_469976 - BLOCK
      ?auto_469977 - BLOCK
      ?auto_469978 - BLOCK
      ?auto_469979 - BLOCK
      ?auto_469980 - BLOCK
      ?auto_469981 - BLOCK
      ?auto_469982 - BLOCK
      ?auto_469983 - BLOCK
    )
    :vars
    (
      ?auto_469984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_469983 ?auto_469984 ) ( ON-TABLE ?auto_469969 ) ( ON ?auto_469970 ?auto_469969 ) ( not ( = ?auto_469969 ?auto_469970 ) ) ( not ( = ?auto_469969 ?auto_469971 ) ) ( not ( = ?auto_469969 ?auto_469972 ) ) ( not ( = ?auto_469969 ?auto_469973 ) ) ( not ( = ?auto_469969 ?auto_469974 ) ) ( not ( = ?auto_469969 ?auto_469975 ) ) ( not ( = ?auto_469969 ?auto_469976 ) ) ( not ( = ?auto_469969 ?auto_469977 ) ) ( not ( = ?auto_469969 ?auto_469978 ) ) ( not ( = ?auto_469969 ?auto_469979 ) ) ( not ( = ?auto_469969 ?auto_469980 ) ) ( not ( = ?auto_469969 ?auto_469981 ) ) ( not ( = ?auto_469969 ?auto_469982 ) ) ( not ( = ?auto_469969 ?auto_469983 ) ) ( not ( = ?auto_469969 ?auto_469984 ) ) ( not ( = ?auto_469970 ?auto_469971 ) ) ( not ( = ?auto_469970 ?auto_469972 ) ) ( not ( = ?auto_469970 ?auto_469973 ) ) ( not ( = ?auto_469970 ?auto_469974 ) ) ( not ( = ?auto_469970 ?auto_469975 ) ) ( not ( = ?auto_469970 ?auto_469976 ) ) ( not ( = ?auto_469970 ?auto_469977 ) ) ( not ( = ?auto_469970 ?auto_469978 ) ) ( not ( = ?auto_469970 ?auto_469979 ) ) ( not ( = ?auto_469970 ?auto_469980 ) ) ( not ( = ?auto_469970 ?auto_469981 ) ) ( not ( = ?auto_469970 ?auto_469982 ) ) ( not ( = ?auto_469970 ?auto_469983 ) ) ( not ( = ?auto_469970 ?auto_469984 ) ) ( not ( = ?auto_469971 ?auto_469972 ) ) ( not ( = ?auto_469971 ?auto_469973 ) ) ( not ( = ?auto_469971 ?auto_469974 ) ) ( not ( = ?auto_469971 ?auto_469975 ) ) ( not ( = ?auto_469971 ?auto_469976 ) ) ( not ( = ?auto_469971 ?auto_469977 ) ) ( not ( = ?auto_469971 ?auto_469978 ) ) ( not ( = ?auto_469971 ?auto_469979 ) ) ( not ( = ?auto_469971 ?auto_469980 ) ) ( not ( = ?auto_469971 ?auto_469981 ) ) ( not ( = ?auto_469971 ?auto_469982 ) ) ( not ( = ?auto_469971 ?auto_469983 ) ) ( not ( = ?auto_469971 ?auto_469984 ) ) ( not ( = ?auto_469972 ?auto_469973 ) ) ( not ( = ?auto_469972 ?auto_469974 ) ) ( not ( = ?auto_469972 ?auto_469975 ) ) ( not ( = ?auto_469972 ?auto_469976 ) ) ( not ( = ?auto_469972 ?auto_469977 ) ) ( not ( = ?auto_469972 ?auto_469978 ) ) ( not ( = ?auto_469972 ?auto_469979 ) ) ( not ( = ?auto_469972 ?auto_469980 ) ) ( not ( = ?auto_469972 ?auto_469981 ) ) ( not ( = ?auto_469972 ?auto_469982 ) ) ( not ( = ?auto_469972 ?auto_469983 ) ) ( not ( = ?auto_469972 ?auto_469984 ) ) ( not ( = ?auto_469973 ?auto_469974 ) ) ( not ( = ?auto_469973 ?auto_469975 ) ) ( not ( = ?auto_469973 ?auto_469976 ) ) ( not ( = ?auto_469973 ?auto_469977 ) ) ( not ( = ?auto_469973 ?auto_469978 ) ) ( not ( = ?auto_469973 ?auto_469979 ) ) ( not ( = ?auto_469973 ?auto_469980 ) ) ( not ( = ?auto_469973 ?auto_469981 ) ) ( not ( = ?auto_469973 ?auto_469982 ) ) ( not ( = ?auto_469973 ?auto_469983 ) ) ( not ( = ?auto_469973 ?auto_469984 ) ) ( not ( = ?auto_469974 ?auto_469975 ) ) ( not ( = ?auto_469974 ?auto_469976 ) ) ( not ( = ?auto_469974 ?auto_469977 ) ) ( not ( = ?auto_469974 ?auto_469978 ) ) ( not ( = ?auto_469974 ?auto_469979 ) ) ( not ( = ?auto_469974 ?auto_469980 ) ) ( not ( = ?auto_469974 ?auto_469981 ) ) ( not ( = ?auto_469974 ?auto_469982 ) ) ( not ( = ?auto_469974 ?auto_469983 ) ) ( not ( = ?auto_469974 ?auto_469984 ) ) ( not ( = ?auto_469975 ?auto_469976 ) ) ( not ( = ?auto_469975 ?auto_469977 ) ) ( not ( = ?auto_469975 ?auto_469978 ) ) ( not ( = ?auto_469975 ?auto_469979 ) ) ( not ( = ?auto_469975 ?auto_469980 ) ) ( not ( = ?auto_469975 ?auto_469981 ) ) ( not ( = ?auto_469975 ?auto_469982 ) ) ( not ( = ?auto_469975 ?auto_469983 ) ) ( not ( = ?auto_469975 ?auto_469984 ) ) ( not ( = ?auto_469976 ?auto_469977 ) ) ( not ( = ?auto_469976 ?auto_469978 ) ) ( not ( = ?auto_469976 ?auto_469979 ) ) ( not ( = ?auto_469976 ?auto_469980 ) ) ( not ( = ?auto_469976 ?auto_469981 ) ) ( not ( = ?auto_469976 ?auto_469982 ) ) ( not ( = ?auto_469976 ?auto_469983 ) ) ( not ( = ?auto_469976 ?auto_469984 ) ) ( not ( = ?auto_469977 ?auto_469978 ) ) ( not ( = ?auto_469977 ?auto_469979 ) ) ( not ( = ?auto_469977 ?auto_469980 ) ) ( not ( = ?auto_469977 ?auto_469981 ) ) ( not ( = ?auto_469977 ?auto_469982 ) ) ( not ( = ?auto_469977 ?auto_469983 ) ) ( not ( = ?auto_469977 ?auto_469984 ) ) ( not ( = ?auto_469978 ?auto_469979 ) ) ( not ( = ?auto_469978 ?auto_469980 ) ) ( not ( = ?auto_469978 ?auto_469981 ) ) ( not ( = ?auto_469978 ?auto_469982 ) ) ( not ( = ?auto_469978 ?auto_469983 ) ) ( not ( = ?auto_469978 ?auto_469984 ) ) ( not ( = ?auto_469979 ?auto_469980 ) ) ( not ( = ?auto_469979 ?auto_469981 ) ) ( not ( = ?auto_469979 ?auto_469982 ) ) ( not ( = ?auto_469979 ?auto_469983 ) ) ( not ( = ?auto_469979 ?auto_469984 ) ) ( not ( = ?auto_469980 ?auto_469981 ) ) ( not ( = ?auto_469980 ?auto_469982 ) ) ( not ( = ?auto_469980 ?auto_469983 ) ) ( not ( = ?auto_469980 ?auto_469984 ) ) ( not ( = ?auto_469981 ?auto_469982 ) ) ( not ( = ?auto_469981 ?auto_469983 ) ) ( not ( = ?auto_469981 ?auto_469984 ) ) ( not ( = ?auto_469982 ?auto_469983 ) ) ( not ( = ?auto_469982 ?auto_469984 ) ) ( not ( = ?auto_469983 ?auto_469984 ) ) ( ON ?auto_469982 ?auto_469983 ) ( ON ?auto_469981 ?auto_469982 ) ( ON ?auto_469980 ?auto_469981 ) ( ON ?auto_469979 ?auto_469980 ) ( ON ?auto_469978 ?auto_469979 ) ( ON ?auto_469977 ?auto_469978 ) ( ON ?auto_469976 ?auto_469977 ) ( ON ?auto_469975 ?auto_469976 ) ( ON ?auto_469974 ?auto_469975 ) ( ON ?auto_469973 ?auto_469974 ) ( ON ?auto_469972 ?auto_469973 ) ( CLEAR ?auto_469970 ) ( ON ?auto_469971 ?auto_469972 ) ( CLEAR ?auto_469971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_469969 ?auto_469970 ?auto_469971 )
      ( MAKE-15PILE ?auto_469969 ?auto_469970 ?auto_469971 ?auto_469972 ?auto_469973 ?auto_469974 ?auto_469975 ?auto_469976 ?auto_469977 ?auto_469978 ?auto_469979 ?auto_469980 ?auto_469981 ?auto_469982 ?auto_469983 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_470031 - BLOCK
      ?auto_470032 - BLOCK
      ?auto_470033 - BLOCK
      ?auto_470034 - BLOCK
      ?auto_470035 - BLOCK
      ?auto_470036 - BLOCK
      ?auto_470037 - BLOCK
      ?auto_470038 - BLOCK
      ?auto_470039 - BLOCK
      ?auto_470040 - BLOCK
      ?auto_470041 - BLOCK
      ?auto_470042 - BLOCK
      ?auto_470043 - BLOCK
      ?auto_470044 - BLOCK
      ?auto_470045 - BLOCK
    )
    :vars
    (
      ?auto_470046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470045 ?auto_470046 ) ( ON-TABLE ?auto_470031 ) ( not ( = ?auto_470031 ?auto_470032 ) ) ( not ( = ?auto_470031 ?auto_470033 ) ) ( not ( = ?auto_470031 ?auto_470034 ) ) ( not ( = ?auto_470031 ?auto_470035 ) ) ( not ( = ?auto_470031 ?auto_470036 ) ) ( not ( = ?auto_470031 ?auto_470037 ) ) ( not ( = ?auto_470031 ?auto_470038 ) ) ( not ( = ?auto_470031 ?auto_470039 ) ) ( not ( = ?auto_470031 ?auto_470040 ) ) ( not ( = ?auto_470031 ?auto_470041 ) ) ( not ( = ?auto_470031 ?auto_470042 ) ) ( not ( = ?auto_470031 ?auto_470043 ) ) ( not ( = ?auto_470031 ?auto_470044 ) ) ( not ( = ?auto_470031 ?auto_470045 ) ) ( not ( = ?auto_470031 ?auto_470046 ) ) ( not ( = ?auto_470032 ?auto_470033 ) ) ( not ( = ?auto_470032 ?auto_470034 ) ) ( not ( = ?auto_470032 ?auto_470035 ) ) ( not ( = ?auto_470032 ?auto_470036 ) ) ( not ( = ?auto_470032 ?auto_470037 ) ) ( not ( = ?auto_470032 ?auto_470038 ) ) ( not ( = ?auto_470032 ?auto_470039 ) ) ( not ( = ?auto_470032 ?auto_470040 ) ) ( not ( = ?auto_470032 ?auto_470041 ) ) ( not ( = ?auto_470032 ?auto_470042 ) ) ( not ( = ?auto_470032 ?auto_470043 ) ) ( not ( = ?auto_470032 ?auto_470044 ) ) ( not ( = ?auto_470032 ?auto_470045 ) ) ( not ( = ?auto_470032 ?auto_470046 ) ) ( not ( = ?auto_470033 ?auto_470034 ) ) ( not ( = ?auto_470033 ?auto_470035 ) ) ( not ( = ?auto_470033 ?auto_470036 ) ) ( not ( = ?auto_470033 ?auto_470037 ) ) ( not ( = ?auto_470033 ?auto_470038 ) ) ( not ( = ?auto_470033 ?auto_470039 ) ) ( not ( = ?auto_470033 ?auto_470040 ) ) ( not ( = ?auto_470033 ?auto_470041 ) ) ( not ( = ?auto_470033 ?auto_470042 ) ) ( not ( = ?auto_470033 ?auto_470043 ) ) ( not ( = ?auto_470033 ?auto_470044 ) ) ( not ( = ?auto_470033 ?auto_470045 ) ) ( not ( = ?auto_470033 ?auto_470046 ) ) ( not ( = ?auto_470034 ?auto_470035 ) ) ( not ( = ?auto_470034 ?auto_470036 ) ) ( not ( = ?auto_470034 ?auto_470037 ) ) ( not ( = ?auto_470034 ?auto_470038 ) ) ( not ( = ?auto_470034 ?auto_470039 ) ) ( not ( = ?auto_470034 ?auto_470040 ) ) ( not ( = ?auto_470034 ?auto_470041 ) ) ( not ( = ?auto_470034 ?auto_470042 ) ) ( not ( = ?auto_470034 ?auto_470043 ) ) ( not ( = ?auto_470034 ?auto_470044 ) ) ( not ( = ?auto_470034 ?auto_470045 ) ) ( not ( = ?auto_470034 ?auto_470046 ) ) ( not ( = ?auto_470035 ?auto_470036 ) ) ( not ( = ?auto_470035 ?auto_470037 ) ) ( not ( = ?auto_470035 ?auto_470038 ) ) ( not ( = ?auto_470035 ?auto_470039 ) ) ( not ( = ?auto_470035 ?auto_470040 ) ) ( not ( = ?auto_470035 ?auto_470041 ) ) ( not ( = ?auto_470035 ?auto_470042 ) ) ( not ( = ?auto_470035 ?auto_470043 ) ) ( not ( = ?auto_470035 ?auto_470044 ) ) ( not ( = ?auto_470035 ?auto_470045 ) ) ( not ( = ?auto_470035 ?auto_470046 ) ) ( not ( = ?auto_470036 ?auto_470037 ) ) ( not ( = ?auto_470036 ?auto_470038 ) ) ( not ( = ?auto_470036 ?auto_470039 ) ) ( not ( = ?auto_470036 ?auto_470040 ) ) ( not ( = ?auto_470036 ?auto_470041 ) ) ( not ( = ?auto_470036 ?auto_470042 ) ) ( not ( = ?auto_470036 ?auto_470043 ) ) ( not ( = ?auto_470036 ?auto_470044 ) ) ( not ( = ?auto_470036 ?auto_470045 ) ) ( not ( = ?auto_470036 ?auto_470046 ) ) ( not ( = ?auto_470037 ?auto_470038 ) ) ( not ( = ?auto_470037 ?auto_470039 ) ) ( not ( = ?auto_470037 ?auto_470040 ) ) ( not ( = ?auto_470037 ?auto_470041 ) ) ( not ( = ?auto_470037 ?auto_470042 ) ) ( not ( = ?auto_470037 ?auto_470043 ) ) ( not ( = ?auto_470037 ?auto_470044 ) ) ( not ( = ?auto_470037 ?auto_470045 ) ) ( not ( = ?auto_470037 ?auto_470046 ) ) ( not ( = ?auto_470038 ?auto_470039 ) ) ( not ( = ?auto_470038 ?auto_470040 ) ) ( not ( = ?auto_470038 ?auto_470041 ) ) ( not ( = ?auto_470038 ?auto_470042 ) ) ( not ( = ?auto_470038 ?auto_470043 ) ) ( not ( = ?auto_470038 ?auto_470044 ) ) ( not ( = ?auto_470038 ?auto_470045 ) ) ( not ( = ?auto_470038 ?auto_470046 ) ) ( not ( = ?auto_470039 ?auto_470040 ) ) ( not ( = ?auto_470039 ?auto_470041 ) ) ( not ( = ?auto_470039 ?auto_470042 ) ) ( not ( = ?auto_470039 ?auto_470043 ) ) ( not ( = ?auto_470039 ?auto_470044 ) ) ( not ( = ?auto_470039 ?auto_470045 ) ) ( not ( = ?auto_470039 ?auto_470046 ) ) ( not ( = ?auto_470040 ?auto_470041 ) ) ( not ( = ?auto_470040 ?auto_470042 ) ) ( not ( = ?auto_470040 ?auto_470043 ) ) ( not ( = ?auto_470040 ?auto_470044 ) ) ( not ( = ?auto_470040 ?auto_470045 ) ) ( not ( = ?auto_470040 ?auto_470046 ) ) ( not ( = ?auto_470041 ?auto_470042 ) ) ( not ( = ?auto_470041 ?auto_470043 ) ) ( not ( = ?auto_470041 ?auto_470044 ) ) ( not ( = ?auto_470041 ?auto_470045 ) ) ( not ( = ?auto_470041 ?auto_470046 ) ) ( not ( = ?auto_470042 ?auto_470043 ) ) ( not ( = ?auto_470042 ?auto_470044 ) ) ( not ( = ?auto_470042 ?auto_470045 ) ) ( not ( = ?auto_470042 ?auto_470046 ) ) ( not ( = ?auto_470043 ?auto_470044 ) ) ( not ( = ?auto_470043 ?auto_470045 ) ) ( not ( = ?auto_470043 ?auto_470046 ) ) ( not ( = ?auto_470044 ?auto_470045 ) ) ( not ( = ?auto_470044 ?auto_470046 ) ) ( not ( = ?auto_470045 ?auto_470046 ) ) ( ON ?auto_470044 ?auto_470045 ) ( ON ?auto_470043 ?auto_470044 ) ( ON ?auto_470042 ?auto_470043 ) ( ON ?auto_470041 ?auto_470042 ) ( ON ?auto_470040 ?auto_470041 ) ( ON ?auto_470039 ?auto_470040 ) ( ON ?auto_470038 ?auto_470039 ) ( ON ?auto_470037 ?auto_470038 ) ( ON ?auto_470036 ?auto_470037 ) ( ON ?auto_470035 ?auto_470036 ) ( ON ?auto_470034 ?auto_470035 ) ( ON ?auto_470033 ?auto_470034 ) ( CLEAR ?auto_470031 ) ( ON ?auto_470032 ?auto_470033 ) ( CLEAR ?auto_470032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_470031 ?auto_470032 )
      ( MAKE-15PILE ?auto_470031 ?auto_470032 ?auto_470033 ?auto_470034 ?auto_470035 ?auto_470036 ?auto_470037 ?auto_470038 ?auto_470039 ?auto_470040 ?auto_470041 ?auto_470042 ?auto_470043 ?auto_470044 ?auto_470045 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_470093 - BLOCK
      ?auto_470094 - BLOCK
      ?auto_470095 - BLOCK
      ?auto_470096 - BLOCK
      ?auto_470097 - BLOCK
      ?auto_470098 - BLOCK
      ?auto_470099 - BLOCK
      ?auto_470100 - BLOCK
      ?auto_470101 - BLOCK
      ?auto_470102 - BLOCK
      ?auto_470103 - BLOCK
      ?auto_470104 - BLOCK
      ?auto_470105 - BLOCK
      ?auto_470106 - BLOCK
      ?auto_470107 - BLOCK
    )
    :vars
    (
      ?auto_470108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470107 ?auto_470108 ) ( not ( = ?auto_470093 ?auto_470094 ) ) ( not ( = ?auto_470093 ?auto_470095 ) ) ( not ( = ?auto_470093 ?auto_470096 ) ) ( not ( = ?auto_470093 ?auto_470097 ) ) ( not ( = ?auto_470093 ?auto_470098 ) ) ( not ( = ?auto_470093 ?auto_470099 ) ) ( not ( = ?auto_470093 ?auto_470100 ) ) ( not ( = ?auto_470093 ?auto_470101 ) ) ( not ( = ?auto_470093 ?auto_470102 ) ) ( not ( = ?auto_470093 ?auto_470103 ) ) ( not ( = ?auto_470093 ?auto_470104 ) ) ( not ( = ?auto_470093 ?auto_470105 ) ) ( not ( = ?auto_470093 ?auto_470106 ) ) ( not ( = ?auto_470093 ?auto_470107 ) ) ( not ( = ?auto_470093 ?auto_470108 ) ) ( not ( = ?auto_470094 ?auto_470095 ) ) ( not ( = ?auto_470094 ?auto_470096 ) ) ( not ( = ?auto_470094 ?auto_470097 ) ) ( not ( = ?auto_470094 ?auto_470098 ) ) ( not ( = ?auto_470094 ?auto_470099 ) ) ( not ( = ?auto_470094 ?auto_470100 ) ) ( not ( = ?auto_470094 ?auto_470101 ) ) ( not ( = ?auto_470094 ?auto_470102 ) ) ( not ( = ?auto_470094 ?auto_470103 ) ) ( not ( = ?auto_470094 ?auto_470104 ) ) ( not ( = ?auto_470094 ?auto_470105 ) ) ( not ( = ?auto_470094 ?auto_470106 ) ) ( not ( = ?auto_470094 ?auto_470107 ) ) ( not ( = ?auto_470094 ?auto_470108 ) ) ( not ( = ?auto_470095 ?auto_470096 ) ) ( not ( = ?auto_470095 ?auto_470097 ) ) ( not ( = ?auto_470095 ?auto_470098 ) ) ( not ( = ?auto_470095 ?auto_470099 ) ) ( not ( = ?auto_470095 ?auto_470100 ) ) ( not ( = ?auto_470095 ?auto_470101 ) ) ( not ( = ?auto_470095 ?auto_470102 ) ) ( not ( = ?auto_470095 ?auto_470103 ) ) ( not ( = ?auto_470095 ?auto_470104 ) ) ( not ( = ?auto_470095 ?auto_470105 ) ) ( not ( = ?auto_470095 ?auto_470106 ) ) ( not ( = ?auto_470095 ?auto_470107 ) ) ( not ( = ?auto_470095 ?auto_470108 ) ) ( not ( = ?auto_470096 ?auto_470097 ) ) ( not ( = ?auto_470096 ?auto_470098 ) ) ( not ( = ?auto_470096 ?auto_470099 ) ) ( not ( = ?auto_470096 ?auto_470100 ) ) ( not ( = ?auto_470096 ?auto_470101 ) ) ( not ( = ?auto_470096 ?auto_470102 ) ) ( not ( = ?auto_470096 ?auto_470103 ) ) ( not ( = ?auto_470096 ?auto_470104 ) ) ( not ( = ?auto_470096 ?auto_470105 ) ) ( not ( = ?auto_470096 ?auto_470106 ) ) ( not ( = ?auto_470096 ?auto_470107 ) ) ( not ( = ?auto_470096 ?auto_470108 ) ) ( not ( = ?auto_470097 ?auto_470098 ) ) ( not ( = ?auto_470097 ?auto_470099 ) ) ( not ( = ?auto_470097 ?auto_470100 ) ) ( not ( = ?auto_470097 ?auto_470101 ) ) ( not ( = ?auto_470097 ?auto_470102 ) ) ( not ( = ?auto_470097 ?auto_470103 ) ) ( not ( = ?auto_470097 ?auto_470104 ) ) ( not ( = ?auto_470097 ?auto_470105 ) ) ( not ( = ?auto_470097 ?auto_470106 ) ) ( not ( = ?auto_470097 ?auto_470107 ) ) ( not ( = ?auto_470097 ?auto_470108 ) ) ( not ( = ?auto_470098 ?auto_470099 ) ) ( not ( = ?auto_470098 ?auto_470100 ) ) ( not ( = ?auto_470098 ?auto_470101 ) ) ( not ( = ?auto_470098 ?auto_470102 ) ) ( not ( = ?auto_470098 ?auto_470103 ) ) ( not ( = ?auto_470098 ?auto_470104 ) ) ( not ( = ?auto_470098 ?auto_470105 ) ) ( not ( = ?auto_470098 ?auto_470106 ) ) ( not ( = ?auto_470098 ?auto_470107 ) ) ( not ( = ?auto_470098 ?auto_470108 ) ) ( not ( = ?auto_470099 ?auto_470100 ) ) ( not ( = ?auto_470099 ?auto_470101 ) ) ( not ( = ?auto_470099 ?auto_470102 ) ) ( not ( = ?auto_470099 ?auto_470103 ) ) ( not ( = ?auto_470099 ?auto_470104 ) ) ( not ( = ?auto_470099 ?auto_470105 ) ) ( not ( = ?auto_470099 ?auto_470106 ) ) ( not ( = ?auto_470099 ?auto_470107 ) ) ( not ( = ?auto_470099 ?auto_470108 ) ) ( not ( = ?auto_470100 ?auto_470101 ) ) ( not ( = ?auto_470100 ?auto_470102 ) ) ( not ( = ?auto_470100 ?auto_470103 ) ) ( not ( = ?auto_470100 ?auto_470104 ) ) ( not ( = ?auto_470100 ?auto_470105 ) ) ( not ( = ?auto_470100 ?auto_470106 ) ) ( not ( = ?auto_470100 ?auto_470107 ) ) ( not ( = ?auto_470100 ?auto_470108 ) ) ( not ( = ?auto_470101 ?auto_470102 ) ) ( not ( = ?auto_470101 ?auto_470103 ) ) ( not ( = ?auto_470101 ?auto_470104 ) ) ( not ( = ?auto_470101 ?auto_470105 ) ) ( not ( = ?auto_470101 ?auto_470106 ) ) ( not ( = ?auto_470101 ?auto_470107 ) ) ( not ( = ?auto_470101 ?auto_470108 ) ) ( not ( = ?auto_470102 ?auto_470103 ) ) ( not ( = ?auto_470102 ?auto_470104 ) ) ( not ( = ?auto_470102 ?auto_470105 ) ) ( not ( = ?auto_470102 ?auto_470106 ) ) ( not ( = ?auto_470102 ?auto_470107 ) ) ( not ( = ?auto_470102 ?auto_470108 ) ) ( not ( = ?auto_470103 ?auto_470104 ) ) ( not ( = ?auto_470103 ?auto_470105 ) ) ( not ( = ?auto_470103 ?auto_470106 ) ) ( not ( = ?auto_470103 ?auto_470107 ) ) ( not ( = ?auto_470103 ?auto_470108 ) ) ( not ( = ?auto_470104 ?auto_470105 ) ) ( not ( = ?auto_470104 ?auto_470106 ) ) ( not ( = ?auto_470104 ?auto_470107 ) ) ( not ( = ?auto_470104 ?auto_470108 ) ) ( not ( = ?auto_470105 ?auto_470106 ) ) ( not ( = ?auto_470105 ?auto_470107 ) ) ( not ( = ?auto_470105 ?auto_470108 ) ) ( not ( = ?auto_470106 ?auto_470107 ) ) ( not ( = ?auto_470106 ?auto_470108 ) ) ( not ( = ?auto_470107 ?auto_470108 ) ) ( ON ?auto_470106 ?auto_470107 ) ( ON ?auto_470105 ?auto_470106 ) ( ON ?auto_470104 ?auto_470105 ) ( ON ?auto_470103 ?auto_470104 ) ( ON ?auto_470102 ?auto_470103 ) ( ON ?auto_470101 ?auto_470102 ) ( ON ?auto_470100 ?auto_470101 ) ( ON ?auto_470099 ?auto_470100 ) ( ON ?auto_470098 ?auto_470099 ) ( ON ?auto_470097 ?auto_470098 ) ( ON ?auto_470096 ?auto_470097 ) ( ON ?auto_470095 ?auto_470096 ) ( ON ?auto_470094 ?auto_470095 ) ( ON ?auto_470093 ?auto_470094 ) ( CLEAR ?auto_470093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_470093 )
      ( MAKE-15PILE ?auto_470093 ?auto_470094 ?auto_470095 ?auto_470096 ?auto_470097 ?auto_470098 ?auto_470099 ?auto_470100 ?auto_470101 ?auto_470102 ?auto_470103 ?auto_470104 ?auto_470105 ?auto_470106 ?auto_470107 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470156 - BLOCK
      ?auto_470157 - BLOCK
      ?auto_470158 - BLOCK
      ?auto_470159 - BLOCK
      ?auto_470160 - BLOCK
      ?auto_470161 - BLOCK
      ?auto_470162 - BLOCK
      ?auto_470163 - BLOCK
      ?auto_470164 - BLOCK
      ?auto_470165 - BLOCK
      ?auto_470166 - BLOCK
      ?auto_470167 - BLOCK
      ?auto_470168 - BLOCK
      ?auto_470169 - BLOCK
      ?auto_470170 - BLOCK
      ?auto_470171 - BLOCK
    )
    :vars
    (
      ?auto_470172 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_470170 ) ( ON ?auto_470171 ?auto_470172 ) ( CLEAR ?auto_470171 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_470156 ) ( ON ?auto_470157 ?auto_470156 ) ( ON ?auto_470158 ?auto_470157 ) ( ON ?auto_470159 ?auto_470158 ) ( ON ?auto_470160 ?auto_470159 ) ( ON ?auto_470161 ?auto_470160 ) ( ON ?auto_470162 ?auto_470161 ) ( ON ?auto_470163 ?auto_470162 ) ( ON ?auto_470164 ?auto_470163 ) ( ON ?auto_470165 ?auto_470164 ) ( ON ?auto_470166 ?auto_470165 ) ( ON ?auto_470167 ?auto_470166 ) ( ON ?auto_470168 ?auto_470167 ) ( ON ?auto_470169 ?auto_470168 ) ( ON ?auto_470170 ?auto_470169 ) ( not ( = ?auto_470156 ?auto_470157 ) ) ( not ( = ?auto_470156 ?auto_470158 ) ) ( not ( = ?auto_470156 ?auto_470159 ) ) ( not ( = ?auto_470156 ?auto_470160 ) ) ( not ( = ?auto_470156 ?auto_470161 ) ) ( not ( = ?auto_470156 ?auto_470162 ) ) ( not ( = ?auto_470156 ?auto_470163 ) ) ( not ( = ?auto_470156 ?auto_470164 ) ) ( not ( = ?auto_470156 ?auto_470165 ) ) ( not ( = ?auto_470156 ?auto_470166 ) ) ( not ( = ?auto_470156 ?auto_470167 ) ) ( not ( = ?auto_470156 ?auto_470168 ) ) ( not ( = ?auto_470156 ?auto_470169 ) ) ( not ( = ?auto_470156 ?auto_470170 ) ) ( not ( = ?auto_470156 ?auto_470171 ) ) ( not ( = ?auto_470156 ?auto_470172 ) ) ( not ( = ?auto_470157 ?auto_470158 ) ) ( not ( = ?auto_470157 ?auto_470159 ) ) ( not ( = ?auto_470157 ?auto_470160 ) ) ( not ( = ?auto_470157 ?auto_470161 ) ) ( not ( = ?auto_470157 ?auto_470162 ) ) ( not ( = ?auto_470157 ?auto_470163 ) ) ( not ( = ?auto_470157 ?auto_470164 ) ) ( not ( = ?auto_470157 ?auto_470165 ) ) ( not ( = ?auto_470157 ?auto_470166 ) ) ( not ( = ?auto_470157 ?auto_470167 ) ) ( not ( = ?auto_470157 ?auto_470168 ) ) ( not ( = ?auto_470157 ?auto_470169 ) ) ( not ( = ?auto_470157 ?auto_470170 ) ) ( not ( = ?auto_470157 ?auto_470171 ) ) ( not ( = ?auto_470157 ?auto_470172 ) ) ( not ( = ?auto_470158 ?auto_470159 ) ) ( not ( = ?auto_470158 ?auto_470160 ) ) ( not ( = ?auto_470158 ?auto_470161 ) ) ( not ( = ?auto_470158 ?auto_470162 ) ) ( not ( = ?auto_470158 ?auto_470163 ) ) ( not ( = ?auto_470158 ?auto_470164 ) ) ( not ( = ?auto_470158 ?auto_470165 ) ) ( not ( = ?auto_470158 ?auto_470166 ) ) ( not ( = ?auto_470158 ?auto_470167 ) ) ( not ( = ?auto_470158 ?auto_470168 ) ) ( not ( = ?auto_470158 ?auto_470169 ) ) ( not ( = ?auto_470158 ?auto_470170 ) ) ( not ( = ?auto_470158 ?auto_470171 ) ) ( not ( = ?auto_470158 ?auto_470172 ) ) ( not ( = ?auto_470159 ?auto_470160 ) ) ( not ( = ?auto_470159 ?auto_470161 ) ) ( not ( = ?auto_470159 ?auto_470162 ) ) ( not ( = ?auto_470159 ?auto_470163 ) ) ( not ( = ?auto_470159 ?auto_470164 ) ) ( not ( = ?auto_470159 ?auto_470165 ) ) ( not ( = ?auto_470159 ?auto_470166 ) ) ( not ( = ?auto_470159 ?auto_470167 ) ) ( not ( = ?auto_470159 ?auto_470168 ) ) ( not ( = ?auto_470159 ?auto_470169 ) ) ( not ( = ?auto_470159 ?auto_470170 ) ) ( not ( = ?auto_470159 ?auto_470171 ) ) ( not ( = ?auto_470159 ?auto_470172 ) ) ( not ( = ?auto_470160 ?auto_470161 ) ) ( not ( = ?auto_470160 ?auto_470162 ) ) ( not ( = ?auto_470160 ?auto_470163 ) ) ( not ( = ?auto_470160 ?auto_470164 ) ) ( not ( = ?auto_470160 ?auto_470165 ) ) ( not ( = ?auto_470160 ?auto_470166 ) ) ( not ( = ?auto_470160 ?auto_470167 ) ) ( not ( = ?auto_470160 ?auto_470168 ) ) ( not ( = ?auto_470160 ?auto_470169 ) ) ( not ( = ?auto_470160 ?auto_470170 ) ) ( not ( = ?auto_470160 ?auto_470171 ) ) ( not ( = ?auto_470160 ?auto_470172 ) ) ( not ( = ?auto_470161 ?auto_470162 ) ) ( not ( = ?auto_470161 ?auto_470163 ) ) ( not ( = ?auto_470161 ?auto_470164 ) ) ( not ( = ?auto_470161 ?auto_470165 ) ) ( not ( = ?auto_470161 ?auto_470166 ) ) ( not ( = ?auto_470161 ?auto_470167 ) ) ( not ( = ?auto_470161 ?auto_470168 ) ) ( not ( = ?auto_470161 ?auto_470169 ) ) ( not ( = ?auto_470161 ?auto_470170 ) ) ( not ( = ?auto_470161 ?auto_470171 ) ) ( not ( = ?auto_470161 ?auto_470172 ) ) ( not ( = ?auto_470162 ?auto_470163 ) ) ( not ( = ?auto_470162 ?auto_470164 ) ) ( not ( = ?auto_470162 ?auto_470165 ) ) ( not ( = ?auto_470162 ?auto_470166 ) ) ( not ( = ?auto_470162 ?auto_470167 ) ) ( not ( = ?auto_470162 ?auto_470168 ) ) ( not ( = ?auto_470162 ?auto_470169 ) ) ( not ( = ?auto_470162 ?auto_470170 ) ) ( not ( = ?auto_470162 ?auto_470171 ) ) ( not ( = ?auto_470162 ?auto_470172 ) ) ( not ( = ?auto_470163 ?auto_470164 ) ) ( not ( = ?auto_470163 ?auto_470165 ) ) ( not ( = ?auto_470163 ?auto_470166 ) ) ( not ( = ?auto_470163 ?auto_470167 ) ) ( not ( = ?auto_470163 ?auto_470168 ) ) ( not ( = ?auto_470163 ?auto_470169 ) ) ( not ( = ?auto_470163 ?auto_470170 ) ) ( not ( = ?auto_470163 ?auto_470171 ) ) ( not ( = ?auto_470163 ?auto_470172 ) ) ( not ( = ?auto_470164 ?auto_470165 ) ) ( not ( = ?auto_470164 ?auto_470166 ) ) ( not ( = ?auto_470164 ?auto_470167 ) ) ( not ( = ?auto_470164 ?auto_470168 ) ) ( not ( = ?auto_470164 ?auto_470169 ) ) ( not ( = ?auto_470164 ?auto_470170 ) ) ( not ( = ?auto_470164 ?auto_470171 ) ) ( not ( = ?auto_470164 ?auto_470172 ) ) ( not ( = ?auto_470165 ?auto_470166 ) ) ( not ( = ?auto_470165 ?auto_470167 ) ) ( not ( = ?auto_470165 ?auto_470168 ) ) ( not ( = ?auto_470165 ?auto_470169 ) ) ( not ( = ?auto_470165 ?auto_470170 ) ) ( not ( = ?auto_470165 ?auto_470171 ) ) ( not ( = ?auto_470165 ?auto_470172 ) ) ( not ( = ?auto_470166 ?auto_470167 ) ) ( not ( = ?auto_470166 ?auto_470168 ) ) ( not ( = ?auto_470166 ?auto_470169 ) ) ( not ( = ?auto_470166 ?auto_470170 ) ) ( not ( = ?auto_470166 ?auto_470171 ) ) ( not ( = ?auto_470166 ?auto_470172 ) ) ( not ( = ?auto_470167 ?auto_470168 ) ) ( not ( = ?auto_470167 ?auto_470169 ) ) ( not ( = ?auto_470167 ?auto_470170 ) ) ( not ( = ?auto_470167 ?auto_470171 ) ) ( not ( = ?auto_470167 ?auto_470172 ) ) ( not ( = ?auto_470168 ?auto_470169 ) ) ( not ( = ?auto_470168 ?auto_470170 ) ) ( not ( = ?auto_470168 ?auto_470171 ) ) ( not ( = ?auto_470168 ?auto_470172 ) ) ( not ( = ?auto_470169 ?auto_470170 ) ) ( not ( = ?auto_470169 ?auto_470171 ) ) ( not ( = ?auto_470169 ?auto_470172 ) ) ( not ( = ?auto_470170 ?auto_470171 ) ) ( not ( = ?auto_470170 ?auto_470172 ) ) ( not ( = ?auto_470171 ?auto_470172 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_470171 ?auto_470172 )
      ( !STACK ?auto_470171 ?auto_470170 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470189 - BLOCK
      ?auto_470190 - BLOCK
      ?auto_470191 - BLOCK
      ?auto_470192 - BLOCK
      ?auto_470193 - BLOCK
      ?auto_470194 - BLOCK
      ?auto_470195 - BLOCK
      ?auto_470196 - BLOCK
      ?auto_470197 - BLOCK
      ?auto_470198 - BLOCK
      ?auto_470199 - BLOCK
      ?auto_470200 - BLOCK
      ?auto_470201 - BLOCK
      ?auto_470202 - BLOCK
      ?auto_470203 - BLOCK
      ?auto_470204 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_470203 ) ( ON-TABLE ?auto_470204 ) ( CLEAR ?auto_470204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_470189 ) ( ON ?auto_470190 ?auto_470189 ) ( ON ?auto_470191 ?auto_470190 ) ( ON ?auto_470192 ?auto_470191 ) ( ON ?auto_470193 ?auto_470192 ) ( ON ?auto_470194 ?auto_470193 ) ( ON ?auto_470195 ?auto_470194 ) ( ON ?auto_470196 ?auto_470195 ) ( ON ?auto_470197 ?auto_470196 ) ( ON ?auto_470198 ?auto_470197 ) ( ON ?auto_470199 ?auto_470198 ) ( ON ?auto_470200 ?auto_470199 ) ( ON ?auto_470201 ?auto_470200 ) ( ON ?auto_470202 ?auto_470201 ) ( ON ?auto_470203 ?auto_470202 ) ( not ( = ?auto_470189 ?auto_470190 ) ) ( not ( = ?auto_470189 ?auto_470191 ) ) ( not ( = ?auto_470189 ?auto_470192 ) ) ( not ( = ?auto_470189 ?auto_470193 ) ) ( not ( = ?auto_470189 ?auto_470194 ) ) ( not ( = ?auto_470189 ?auto_470195 ) ) ( not ( = ?auto_470189 ?auto_470196 ) ) ( not ( = ?auto_470189 ?auto_470197 ) ) ( not ( = ?auto_470189 ?auto_470198 ) ) ( not ( = ?auto_470189 ?auto_470199 ) ) ( not ( = ?auto_470189 ?auto_470200 ) ) ( not ( = ?auto_470189 ?auto_470201 ) ) ( not ( = ?auto_470189 ?auto_470202 ) ) ( not ( = ?auto_470189 ?auto_470203 ) ) ( not ( = ?auto_470189 ?auto_470204 ) ) ( not ( = ?auto_470190 ?auto_470191 ) ) ( not ( = ?auto_470190 ?auto_470192 ) ) ( not ( = ?auto_470190 ?auto_470193 ) ) ( not ( = ?auto_470190 ?auto_470194 ) ) ( not ( = ?auto_470190 ?auto_470195 ) ) ( not ( = ?auto_470190 ?auto_470196 ) ) ( not ( = ?auto_470190 ?auto_470197 ) ) ( not ( = ?auto_470190 ?auto_470198 ) ) ( not ( = ?auto_470190 ?auto_470199 ) ) ( not ( = ?auto_470190 ?auto_470200 ) ) ( not ( = ?auto_470190 ?auto_470201 ) ) ( not ( = ?auto_470190 ?auto_470202 ) ) ( not ( = ?auto_470190 ?auto_470203 ) ) ( not ( = ?auto_470190 ?auto_470204 ) ) ( not ( = ?auto_470191 ?auto_470192 ) ) ( not ( = ?auto_470191 ?auto_470193 ) ) ( not ( = ?auto_470191 ?auto_470194 ) ) ( not ( = ?auto_470191 ?auto_470195 ) ) ( not ( = ?auto_470191 ?auto_470196 ) ) ( not ( = ?auto_470191 ?auto_470197 ) ) ( not ( = ?auto_470191 ?auto_470198 ) ) ( not ( = ?auto_470191 ?auto_470199 ) ) ( not ( = ?auto_470191 ?auto_470200 ) ) ( not ( = ?auto_470191 ?auto_470201 ) ) ( not ( = ?auto_470191 ?auto_470202 ) ) ( not ( = ?auto_470191 ?auto_470203 ) ) ( not ( = ?auto_470191 ?auto_470204 ) ) ( not ( = ?auto_470192 ?auto_470193 ) ) ( not ( = ?auto_470192 ?auto_470194 ) ) ( not ( = ?auto_470192 ?auto_470195 ) ) ( not ( = ?auto_470192 ?auto_470196 ) ) ( not ( = ?auto_470192 ?auto_470197 ) ) ( not ( = ?auto_470192 ?auto_470198 ) ) ( not ( = ?auto_470192 ?auto_470199 ) ) ( not ( = ?auto_470192 ?auto_470200 ) ) ( not ( = ?auto_470192 ?auto_470201 ) ) ( not ( = ?auto_470192 ?auto_470202 ) ) ( not ( = ?auto_470192 ?auto_470203 ) ) ( not ( = ?auto_470192 ?auto_470204 ) ) ( not ( = ?auto_470193 ?auto_470194 ) ) ( not ( = ?auto_470193 ?auto_470195 ) ) ( not ( = ?auto_470193 ?auto_470196 ) ) ( not ( = ?auto_470193 ?auto_470197 ) ) ( not ( = ?auto_470193 ?auto_470198 ) ) ( not ( = ?auto_470193 ?auto_470199 ) ) ( not ( = ?auto_470193 ?auto_470200 ) ) ( not ( = ?auto_470193 ?auto_470201 ) ) ( not ( = ?auto_470193 ?auto_470202 ) ) ( not ( = ?auto_470193 ?auto_470203 ) ) ( not ( = ?auto_470193 ?auto_470204 ) ) ( not ( = ?auto_470194 ?auto_470195 ) ) ( not ( = ?auto_470194 ?auto_470196 ) ) ( not ( = ?auto_470194 ?auto_470197 ) ) ( not ( = ?auto_470194 ?auto_470198 ) ) ( not ( = ?auto_470194 ?auto_470199 ) ) ( not ( = ?auto_470194 ?auto_470200 ) ) ( not ( = ?auto_470194 ?auto_470201 ) ) ( not ( = ?auto_470194 ?auto_470202 ) ) ( not ( = ?auto_470194 ?auto_470203 ) ) ( not ( = ?auto_470194 ?auto_470204 ) ) ( not ( = ?auto_470195 ?auto_470196 ) ) ( not ( = ?auto_470195 ?auto_470197 ) ) ( not ( = ?auto_470195 ?auto_470198 ) ) ( not ( = ?auto_470195 ?auto_470199 ) ) ( not ( = ?auto_470195 ?auto_470200 ) ) ( not ( = ?auto_470195 ?auto_470201 ) ) ( not ( = ?auto_470195 ?auto_470202 ) ) ( not ( = ?auto_470195 ?auto_470203 ) ) ( not ( = ?auto_470195 ?auto_470204 ) ) ( not ( = ?auto_470196 ?auto_470197 ) ) ( not ( = ?auto_470196 ?auto_470198 ) ) ( not ( = ?auto_470196 ?auto_470199 ) ) ( not ( = ?auto_470196 ?auto_470200 ) ) ( not ( = ?auto_470196 ?auto_470201 ) ) ( not ( = ?auto_470196 ?auto_470202 ) ) ( not ( = ?auto_470196 ?auto_470203 ) ) ( not ( = ?auto_470196 ?auto_470204 ) ) ( not ( = ?auto_470197 ?auto_470198 ) ) ( not ( = ?auto_470197 ?auto_470199 ) ) ( not ( = ?auto_470197 ?auto_470200 ) ) ( not ( = ?auto_470197 ?auto_470201 ) ) ( not ( = ?auto_470197 ?auto_470202 ) ) ( not ( = ?auto_470197 ?auto_470203 ) ) ( not ( = ?auto_470197 ?auto_470204 ) ) ( not ( = ?auto_470198 ?auto_470199 ) ) ( not ( = ?auto_470198 ?auto_470200 ) ) ( not ( = ?auto_470198 ?auto_470201 ) ) ( not ( = ?auto_470198 ?auto_470202 ) ) ( not ( = ?auto_470198 ?auto_470203 ) ) ( not ( = ?auto_470198 ?auto_470204 ) ) ( not ( = ?auto_470199 ?auto_470200 ) ) ( not ( = ?auto_470199 ?auto_470201 ) ) ( not ( = ?auto_470199 ?auto_470202 ) ) ( not ( = ?auto_470199 ?auto_470203 ) ) ( not ( = ?auto_470199 ?auto_470204 ) ) ( not ( = ?auto_470200 ?auto_470201 ) ) ( not ( = ?auto_470200 ?auto_470202 ) ) ( not ( = ?auto_470200 ?auto_470203 ) ) ( not ( = ?auto_470200 ?auto_470204 ) ) ( not ( = ?auto_470201 ?auto_470202 ) ) ( not ( = ?auto_470201 ?auto_470203 ) ) ( not ( = ?auto_470201 ?auto_470204 ) ) ( not ( = ?auto_470202 ?auto_470203 ) ) ( not ( = ?auto_470202 ?auto_470204 ) ) ( not ( = ?auto_470203 ?auto_470204 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_470204 )
      ( !STACK ?auto_470204 ?auto_470203 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470221 - BLOCK
      ?auto_470222 - BLOCK
      ?auto_470223 - BLOCK
      ?auto_470224 - BLOCK
      ?auto_470225 - BLOCK
      ?auto_470226 - BLOCK
      ?auto_470227 - BLOCK
      ?auto_470228 - BLOCK
      ?auto_470229 - BLOCK
      ?auto_470230 - BLOCK
      ?auto_470231 - BLOCK
      ?auto_470232 - BLOCK
      ?auto_470233 - BLOCK
      ?auto_470234 - BLOCK
      ?auto_470235 - BLOCK
      ?auto_470236 - BLOCK
    )
    :vars
    (
      ?auto_470237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470236 ?auto_470237 ) ( ON-TABLE ?auto_470221 ) ( ON ?auto_470222 ?auto_470221 ) ( ON ?auto_470223 ?auto_470222 ) ( ON ?auto_470224 ?auto_470223 ) ( ON ?auto_470225 ?auto_470224 ) ( ON ?auto_470226 ?auto_470225 ) ( ON ?auto_470227 ?auto_470226 ) ( ON ?auto_470228 ?auto_470227 ) ( ON ?auto_470229 ?auto_470228 ) ( ON ?auto_470230 ?auto_470229 ) ( ON ?auto_470231 ?auto_470230 ) ( ON ?auto_470232 ?auto_470231 ) ( ON ?auto_470233 ?auto_470232 ) ( ON ?auto_470234 ?auto_470233 ) ( not ( = ?auto_470221 ?auto_470222 ) ) ( not ( = ?auto_470221 ?auto_470223 ) ) ( not ( = ?auto_470221 ?auto_470224 ) ) ( not ( = ?auto_470221 ?auto_470225 ) ) ( not ( = ?auto_470221 ?auto_470226 ) ) ( not ( = ?auto_470221 ?auto_470227 ) ) ( not ( = ?auto_470221 ?auto_470228 ) ) ( not ( = ?auto_470221 ?auto_470229 ) ) ( not ( = ?auto_470221 ?auto_470230 ) ) ( not ( = ?auto_470221 ?auto_470231 ) ) ( not ( = ?auto_470221 ?auto_470232 ) ) ( not ( = ?auto_470221 ?auto_470233 ) ) ( not ( = ?auto_470221 ?auto_470234 ) ) ( not ( = ?auto_470221 ?auto_470235 ) ) ( not ( = ?auto_470221 ?auto_470236 ) ) ( not ( = ?auto_470221 ?auto_470237 ) ) ( not ( = ?auto_470222 ?auto_470223 ) ) ( not ( = ?auto_470222 ?auto_470224 ) ) ( not ( = ?auto_470222 ?auto_470225 ) ) ( not ( = ?auto_470222 ?auto_470226 ) ) ( not ( = ?auto_470222 ?auto_470227 ) ) ( not ( = ?auto_470222 ?auto_470228 ) ) ( not ( = ?auto_470222 ?auto_470229 ) ) ( not ( = ?auto_470222 ?auto_470230 ) ) ( not ( = ?auto_470222 ?auto_470231 ) ) ( not ( = ?auto_470222 ?auto_470232 ) ) ( not ( = ?auto_470222 ?auto_470233 ) ) ( not ( = ?auto_470222 ?auto_470234 ) ) ( not ( = ?auto_470222 ?auto_470235 ) ) ( not ( = ?auto_470222 ?auto_470236 ) ) ( not ( = ?auto_470222 ?auto_470237 ) ) ( not ( = ?auto_470223 ?auto_470224 ) ) ( not ( = ?auto_470223 ?auto_470225 ) ) ( not ( = ?auto_470223 ?auto_470226 ) ) ( not ( = ?auto_470223 ?auto_470227 ) ) ( not ( = ?auto_470223 ?auto_470228 ) ) ( not ( = ?auto_470223 ?auto_470229 ) ) ( not ( = ?auto_470223 ?auto_470230 ) ) ( not ( = ?auto_470223 ?auto_470231 ) ) ( not ( = ?auto_470223 ?auto_470232 ) ) ( not ( = ?auto_470223 ?auto_470233 ) ) ( not ( = ?auto_470223 ?auto_470234 ) ) ( not ( = ?auto_470223 ?auto_470235 ) ) ( not ( = ?auto_470223 ?auto_470236 ) ) ( not ( = ?auto_470223 ?auto_470237 ) ) ( not ( = ?auto_470224 ?auto_470225 ) ) ( not ( = ?auto_470224 ?auto_470226 ) ) ( not ( = ?auto_470224 ?auto_470227 ) ) ( not ( = ?auto_470224 ?auto_470228 ) ) ( not ( = ?auto_470224 ?auto_470229 ) ) ( not ( = ?auto_470224 ?auto_470230 ) ) ( not ( = ?auto_470224 ?auto_470231 ) ) ( not ( = ?auto_470224 ?auto_470232 ) ) ( not ( = ?auto_470224 ?auto_470233 ) ) ( not ( = ?auto_470224 ?auto_470234 ) ) ( not ( = ?auto_470224 ?auto_470235 ) ) ( not ( = ?auto_470224 ?auto_470236 ) ) ( not ( = ?auto_470224 ?auto_470237 ) ) ( not ( = ?auto_470225 ?auto_470226 ) ) ( not ( = ?auto_470225 ?auto_470227 ) ) ( not ( = ?auto_470225 ?auto_470228 ) ) ( not ( = ?auto_470225 ?auto_470229 ) ) ( not ( = ?auto_470225 ?auto_470230 ) ) ( not ( = ?auto_470225 ?auto_470231 ) ) ( not ( = ?auto_470225 ?auto_470232 ) ) ( not ( = ?auto_470225 ?auto_470233 ) ) ( not ( = ?auto_470225 ?auto_470234 ) ) ( not ( = ?auto_470225 ?auto_470235 ) ) ( not ( = ?auto_470225 ?auto_470236 ) ) ( not ( = ?auto_470225 ?auto_470237 ) ) ( not ( = ?auto_470226 ?auto_470227 ) ) ( not ( = ?auto_470226 ?auto_470228 ) ) ( not ( = ?auto_470226 ?auto_470229 ) ) ( not ( = ?auto_470226 ?auto_470230 ) ) ( not ( = ?auto_470226 ?auto_470231 ) ) ( not ( = ?auto_470226 ?auto_470232 ) ) ( not ( = ?auto_470226 ?auto_470233 ) ) ( not ( = ?auto_470226 ?auto_470234 ) ) ( not ( = ?auto_470226 ?auto_470235 ) ) ( not ( = ?auto_470226 ?auto_470236 ) ) ( not ( = ?auto_470226 ?auto_470237 ) ) ( not ( = ?auto_470227 ?auto_470228 ) ) ( not ( = ?auto_470227 ?auto_470229 ) ) ( not ( = ?auto_470227 ?auto_470230 ) ) ( not ( = ?auto_470227 ?auto_470231 ) ) ( not ( = ?auto_470227 ?auto_470232 ) ) ( not ( = ?auto_470227 ?auto_470233 ) ) ( not ( = ?auto_470227 ?auto_470234 ) ) ( not ( = ?auto_470227 ?auto_470235 ) ) ( not ( = ?auto_470227 ?auto_470236 ) ) ( not ( = ?auto_470227 ?auto_470237 ) ) ( not ( = ?auto_470228 ?auto_470229 ) ) ( not ( = ?auto_470228 ?auto_470230 ) ) ( not ( = ?auto_470228 ?auto_470231 ) ) ( not ( = ?auto_470228 ?auto_470232 ) ) ( not ( = ?auto_470228 ?auto_470233 ) ) ( not ( = ?auto_470228 ?auto_470234 ) ) ( not ( = ?auto_470228 ?auto_470235 ) ) ( not ( = ?auto_470228 ?auto_470236 ) ) ( not ( = ?auto_470228 ?auto_470237 ) ) ( not ( = ?auto_470229 ?auto_470230 ) ) ( not ( = ?auto_470229 ?auto_470231 ) ) ( not ( = ?auto_470229 ?auto_470232 ) ) ( not ( = ?auto_470229 ?auto_470233 ) ) ( not ( = ?auto_470229 ?auto_470234 ) ) ( not ( = ?auto_470229 ?auto_470235 ) ) ( not ( = ?auto_470229 ?auto_470236 ) ) ( not ( = ?auto_470229 ?auto_470237 ) ) ( not ( = ?auto_470230 ?auto_470231 ) ) ( not ( = ?auto_470230 ?auto_470232 ) ) ( not ( = ?auto_470230 ?auto_470233 ) ) ( not ( = ?auto_470230 ?auto_470234 ) ) ( not ( = ?auto_470230 ?auto_470235 ) ) ( not ( = ?auto_470230 ?auto_470236 ) ) ( not ( = ?auto_470230 ?auto_470237 ) ) ( not ( = ?auto_470231 ?auto_470232 ) ) ( not ( = ?auto_470231 ?auto_470233 ) ) ( not ( = ?auto_470231 ?auto_470234 ) ) ( not ( = ?auto_470231 ?auto_470235 ) ) ( not ( = ?auto_470231 ?auto_470236 ) ) ( not ( = ?auto_470231 ?auto_470237 ) ) ( not ( = ?auto_470232 ?auto_470233 ) ) ( not ( = ?auto_470232 ?auto_470234 ) ) ( not ( = ?auto_470232 ?auto_470235 ) ) ( not ( = ?auto_470232 ?auto_470236 ) ) ( not ( = ?auto_470232 ?auto_470237 ) ) ( not ( = ?auto_470233 ?auto_470234 ) ) ( not ( = ?auto_470233 ?auto_470235 ) ) ( not ( = ?auto_470233 ?auto_470236 ) ) ( not ( = ?auto_470233 ?auto_470237 ) ) ( not ( = ?auto_470234 ?auto_470235 ) ) ( not ( = ?auto_470234 ?auto_470236 ) ) ( not ( = ?auto_470234 ?auto_470237 ) ) ( not ( = ?auto_470235 ?auto_470236 ) ) ( not ( = ?auto_470235 ?auto_470237 ) ) ( not ( = ?auto_470236 ?auto_470237 ) ) ( CLEAR ?auto_470234 ) ( ON ?auto_470235 ?auto_470236 ) ( CLEAR ?auto_470235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_470221 ?auto_470222 ?auto_470223 ?auto_470224 ?auto_470225 ?auto_470226 ?auto_470227 ?auto_470228 ?auto_470229 ?auto_470230 ?auto_470231 ?auto_470232 ?auto_470233 ?auto_470234 ?auto_470235 )
      ( MAKE-16PILE ?auto_470221 ?auto_470222 ?auto_470223 ?auto_470224 ?auto_470225 ?auto_470226 ?auto_470227 ?auto_470228 ?auto_470229 ?auto_470230 ?auto_470231 ?auto_470232 ?auto_470233 ?auto_470234 ?auto_470235 ?auto_470236 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470254 - BLOCK
      ?auto_470255 - BLOCK
      ?auto_470256 - BLOCK
      ?auto_470257 - BLOCK
      ?auto_470258 - BLOCK
      ?auto_470259 - BLOCK
      ?auto_470260 - BLOCK
      ?auto_470261 - BLOCK
      ?auto_470262 - BLOCK
      ?auto_470263 - BLOCK
      ?auto_470264 - BLOCK
      ?auto_470265 - BLOCK
      ?auto_470266 - BLOCK
      ?auto_470267 - BLOCK
      ?auto_470268 - BLOCK
      ?auto_470269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_470269 ) ( ON-TABLE ?auto_470254 ) ( ON ?auto_470255 ?auto_470254 ) ( ON ?auto_470256 ?auto_470255 ) ( ON ?auto_470257 ?auto_470256 ) ( ON ?auto_470258 ?auto_470257 ) ( ON ?auto_470259 ?auto_470258 ) ( ON ?auto_470260 ?auto_470259 ) ( ON ?auto_470261 ?auto_470260 ) ( ON ?auto_470262 ?auto_470261 ) ( ON ?auto_470263 ?auto_470262 ) ( ON ?auto_470264 ?auto_470263 ) ( ON ?auto_470265 ?auto_470264 ) ( ON ?auto_470266 ?auto_470265 ) ( ON ?auto_470267 ?auto_470266 ) ( not ( = ?auto_470254 ?auto_470255 ) ) ( not ( = ?auto_470254 ?auto_470256 ) ) ( not ( = ?auto_470254 ?auto_470257 ) ) ( not ( = ?auto_470254 ?auto_470258 ) ) ( not ( = ?auto_470254 ?auto_470259 ) ) ( not ( = ?auto_470254 ?auto_470260 ) ) ( not ( = ?auto_470254 ?auto_470261 ) ) ( not ( = ?auto_470254 ?auto_470262 ) ) ( not ( = ?auto_470254 ?auto_470263 ) ) ( not ( = ?auto_470254 ?auto_470264 ) ) ( not ( = ?auto_470254 ?auto_470265 ) ) ( not ( = ?auto_470254 ?auto_470266 ) ) ( not ( = ?auto_470254 ?auto_470267 ) ) ( not ( = ?auto_470254 ?auto_470268 ) ) ( not ( = ?auto_470254 ?auto_470269 ) ) ( not ( = ?auto_470255 ?auto_470256 ) ) ( not ( = ?auto_470255 ?auto_470257 ) ) ( not ( = ?auto_470255 ?auto_470258 ) ) ( not ( = ?auto_470255 ?auto_470259 ) ) ( not ( = ?auto_470255 ?auto_470260 ) ) ( not ( = ?auto_470255 ?auto_470261 ) ) ( not ( = ?auto_470255 ?auto_470262 ) ) ( not ( = ?auto_470255 ?auto_470263 ) ) ( not ( = ?auto_470255 ?auto_470264 ) ) ( not ( = ?auto_470255 ?auto_470265 ) ) ( not ( = ?auto_470255 ?auto_470266 ) ) ( not ( = ?auto_470255 ?auto_470267 ) ) ( not ( = ?auto_470255 ?auto_470268 ) ) ( not ( = ?auto_470255 ?auto_470269 ) ) ( not ( = ?auto_470256 ?auto_470257 ) ) ( not ( = ?auto_470256 ?auto_470258 ) ) ( not ( = ?auto_470256 ?auto_470259 ) ) ( not ( = ?auto_470256 ?auto_470260 ) ) ( not ( = ?auto_470256 ?auto_470261 ) ) ( not ( = ?auto_470256 ?auto_470262 ) ) ( not ( = ?auto_470256 ?auto_470263 ) ) ( not ( = ?auto_470256 ?auto_470264 ) ) ( not ( = ?auto_470256 ?auto_470265 ) ) ( not ( = ?auto_470256 ?auto_470266 ) ) ( not ( = ?auto_470256 ?auto_470267 ) ) ( not ( = ?auto_470256 ?auto_470268 ) ) ( not ( = ?auto_470256 ?auto_470269 ) ) ( not ( = ?auto_470257 ?auto_470258 ) ) ( not ( = ?auto_470257 ?auto_470259 ) ) ( not ( = ?auto_470257 ?auto_470260 ) ) ( not ( = ?auto_470257 ?auto_470261 ) ) ( not ( = ?auto_470257 ?auto_470262 ) ) ( not ( = ?auto_470257 ?auto_470263 ) ) ( not ( = ?auto_470257 ?auto_470264 ) ) ( not ( = ?auto_470257 ?auto_470265 ) ) ( not ( = ?auto_470257 ?auto_470266 ) ) ( not ( = ?auto_470257 ?auto_470267 ) ) ( not ( = ?auto_470257 ?auto_470268 ) ) ( not ( = ?auto_470257 ?auto_470269 ) ) ( not ( = ?auto_470258 ?auto_470259 ) ) ( not ( = ?auto_470258 ?auto_470260 ) ) ( not ( = ?auto_470258 ?auto_470261 ) ) ( not ( = ?auto_470258 ?auto_470262 ) ) ( not ( = ?auto_470258 ?auto_470263 ) ) ( not ( = ?auto_470258 ?auto_470264 ) ) ( not ( = ?auto_470258 ?auto_470265 ) ) ( not ( = ?auto_470258 ?auto_470266 ) ) ( not ( = ?auto_470258 ?auto_470267 ) ) ( not ( = ?auto_470258 ?auto_470268 ) ) ( not ( = ?auto_470258 ?auto_470269 ) ) ( not ( = ?auto_470259 ?auto_470260 ) ) ( not ( = ?auto_470259 ?auto_470261 ) ) ( not ( = ?auto_470259 ?auto_470262 ) ) ( not ( = ?auto_470259 ?auto_470263 ) ) ( not ( = ?auto_470259 ?auto_470264 ) ) ( not ( = ?auto_470259 ?auto_470265 ) ) ( not ( = ?auto_470259 ?auto_470266 ) ) ( not ( = ?auto_470259 ?auto_470267 ) ) ( not ( = ?auto_470259 ?auto_470268 ) ) ( not ( = ?auto_470259 ?auto_470269 ) ) ( not ( = ?auto_470260 ?auto_470261 ) ) ( not ( = ?auto_470260 ?auto_470262 ) ) ( not ( = ?auto_470260 ?auto_470263 ) ) ( not ( = ?auto_470260 ?auto_470264 ) ) ( not ( = ?auto_470260 ?auto_470265 ) ) ( not ( = ?auto_470260 ?auto_470266 ) ) ( not ( = ?auto_470260 ?auto_470267 ) ) ( not ( = ?auto_470260 ?auto_470268 ) ) ( not ( = ?auto_470260 ?auto_470269 ) ) ( not ( = ?auto_470261 ?auto_470262 ) ) ( not ( = ?auto_470261 ?auto_470263 ) ) ( not ( = ?auto_470261 ?auto_470264 ) ) ( not ( = ?auto_470261 ?auto_470265 ) ) ( not ( = ?auto_470261 ?auto_470266 ) ) ( not ( = ?auto_470261 ?auto_470267 ) ) ( not ( = ?auto_470261 ?auto_470268 ) ) ( not ( = ?auto_470261 ?auto_470269 ) ) ( not ( = ?auto_470262 ?auto_470263 ) ) ( not ( = ?auto_470262 ?auto_470264 ) ) ( not ( = ?auto_470262 ?auto_470265 ) ) ( not ( = ?auto_470262 ?auto_470266 ) ) ( not ( = ?auto_470262 ?auto_470267 ) ) ( not ( = ?auto_470262 ?auto_470268 ) ) ( not ( = ?auto_470262 ?auto_470269 ) ) ( not ( = ?auto_470263 ?auto_470264 ) ) ( not ( = ?auto_470263 ?auto_470265 ) ) ( not ( = ?auto_470263 ?auto_470266 ) ) ( not ( = ?auto_470263 ?auto_470267 ) ) ( not ( = ?auto_470263 ?auto_470268 ) ) ( not ( = ?auto_470263 ?auto_470269 ) ) ( not ( = ?auto_470264 ?auto_470265 ) ) ( not ( = ?auto_470264 ?auto_470266 ) ) ( not ( = ?auto_470264 ?auto_470267 ) ) ( not ( = ?auto_470264 ?auto_470268 ) ) ( not ( = ?auto_470264 ?auto_470269 ) ) ( not ( = ?auto_470265 ?auto_470266 ) ) ( not ( = ?auto_470265 ?auto_470267 ) ) ( not ( = ?auto_470265 ?auto_470268 ) ) ( not ( = ?auto_470265 ?auto_470269 ) ) ( not ( = ?auto_470266 ?auto_470267 ) ) ( not ( = ?auto_470266 ?auto_470268 ) ) ( not ( = ?auto_470266 ?auto_470269 ) ) ( not ( = ?auto_470267 ?auto_470268 ) ) ( not ( = ?auto_470267 ?auto_470269 ) ) ( not ( = ?auto_470268 ?auto_470269 ) ) ( CLEAR ?auto_470267 ) ( ON ?auto_470268 ?auto_470269 ) ( CLEAR ?auto_470268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_470254 ?auto_470255 ?auto_470256 ?auto_470257 ?auto_470258 ?auto_470259 ?auto_470260 ?auto_470261 ?auto_470262 ?auto_470263 ?auto_470264 ?auto_470265 ?auto_470266 ?auto_470267 ?auto_470268 )
      ( MAKE-16PILE ?auto_470254 ?auto_470255 ?auto_470256 ?auto_470257 ?auto_470258 ?auto_470259 ?auto_470260 ?auto_470261 ?auto_470262 ?auto_470263 ?auto_470264 ?auto_470265 ?auto_470266 ?auto_470267 ?auto_470268 ?auto_470269 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470286 - BLOCK
      ?auto_470287 - BLOCK
      ?auto_470288 - BLOCK
      ?auto_470289 - BLOCK
      ?auto_470290 - BLOCK
      ?auto_470291 - BLOCK
      ?auto_470292 - BLOCK
      ?auto_470293 - BLOCK
      ?auto_470294 - BLOCK
      ?auto_470295 - BLOCK
      ?auto_470296 - BLOCK
      ?auto_470297 - BLOCK
      ?auto_470298 - BLOCK
      ?auto_470299 - BLOCK
      ?auto_470300 - BLOCK
      ?auto_470301 - BLOCK
    )
    :vars
    (
      ?auto_470302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470301 ?auto_470302 ) ( ON-TABLE ?auto_470286 ) ( ON ?auto_470287 ?auto_470286 ) ( ON ?auto_470288 ?auto_470287 ) ( ON ?auto_470289 ?auto_470288 ) ( ON ?auto_470290 ?auto_470289 ) ( ON ?auto_470291 ?auto_470290 ) ( ON ?auto_470292 ?auto_470291 ) ( ON ?auto_470293 ?auto_470292 ) ( ON ?auto_470294 ?auto_470293 ) ( ON ?auto_470295 ?auto_470294 ) ( ON ?auto_470296 ?auto_470295 ) ( ON ?auto_470297 ?auto_470296 ) ( ON ?auto_470298 ?auto_470297 ) ( not ( = ?auto_470286 ?auto_470287 ) ) ( not ( = ?auto_470286 ?auto_470288 ) ) ( not ( = ?auto_470286 ?auto_470289 ) ) ( not ( = ?auto_470286 ?auto_470290 ) ) ( not ( = ?auto_470286 ?auto_470291 ) ) ( not ( = ?auto_470286 ?auto_470292 ) ) ( not ( = ?auto_470286 ?auto_470293 ) ) ( not ( = ?auto_470286 ?auto_470294 ) ) ( not ( = ?auto_470286 ?auto_470295 ) ) ( not ( = ?auto_470286 ?auto_470296 ) ) ( not ( = ?auto_470286 ?auto_470297 ) ) ( not ( = ?auto_470286 ?auto_470298 ) ) ( not ( = ?auto_470286 ?auto_470299 ) ) ( not ( = ?auto_470286 ?auto_470300 ) ) ( not ( = ?auto_470286 ?auto_470301 ) ) ( not ( = ?auto_470286 ?auto_470302 ) ) ( not ( = ?auto_470287 ?auto_470288 ) ) ( not ( = ?auto_470287 ?auto_470289 ) ) ( not ( = ?auto_470287 ?auto_470290 ) ) ( not ( = ?auto_470287 ?auto_470291 ) ) ( not ( = ?auto_470287 ?auto_470292 ) ) ( not ( = ?auto_470287 ?auto_470293 ) ) ( not ( = ?auto_470287 ?auto_470294 ) ) ( not ( = ?auto_470287 ?auto_470295 ) ) ( not ( = ?auto_470287 ?auto_470296 ) ) ( not ( = ?auto_470287 ?auto_470297 ) ) ( not ( = ?auto_470287 ?auto_470298 ) ) ( not ( = ?auto_470287 ?auto_470299 ) ) ( not ( = ?auto_470287 ?auto_470300 ) ) ( not ( = ?auto_470287 ?auto_470301 ) ) ( not ( = ?auto_470287 ?auto_470302 ) ) ( not ( = ?auto_470288 ?auto_470289 ) ) ( not ( = ?auto_470288 ?auto_470290 ) ) ( not ( = ?auto_470288 ?auto_470291 ) ) ( not ( = ?auto_470288 ?auto_470292 ) ) ( not ( = ?auto_470288 ?auto_470293 ) ) ( not ( = ?auto_470288 ?auto_470294 ) ) ( not ( = ?auto_470288 ?auto_470295 ) ) ( not ( = ?auto_470288 ?auto_470296 ) ) ( not ( = ?auto_470288 ?auto_470297 ) ) ( not ( = ?auto_470288 ?auto_470298 ) ) ( not ( = ?auto_470288 ?auto_470299 ) ) ( not ( = ?auto_470288 ?auto_470300 ) ) ( not ( = ?auto_470288 ?auto_470301 ) ) ( not ( = ?auto_470288 ?auto_470302 ) ) ( not ( = ?auto_470289 ?auto_470290 ) ) ( not ( = ?auto_470289 ?auto_470291 ) ) ( not ( = ?auto_470289 ?auto_470292 ) ) ( not ( = ?auto_470289 ?auto_470293 ) ) ( not ( = ?auto_470289 ?auto_470294 ) ) ( not ( = ?auto_470289 ?auto_470295 ) ) ( not ( = ?auto_470289 ?auto_470296 ) ) ( not ( = ?auto_470289 ?auto_470297 ) ) ( not ( = ?auto_470289 ?auto_470298 ) ) ( not ( = ?auto_470289 ?auto_470299 ) ) ( not ( = ?auto_470289 ?auto_470300 ) ) ( not ( = ?auto_470289 ?auto_470301 ) ) ( not ( = ?auto_470289 ?auto_470302 ) ) ( not ( = ?auto_470290 ?auto_470291 ) ) ( not ( = ?auto_470290 ?auto_470292 ) ) ( not ( = ?auto_470290 ?auto_470293 ) ) ( not ( = ?auto_470290 ?auto_470294 ) ) ( not ( = ?auto_470290 ?auto_470295 ) ) ( not ( = ?auto_470290 ?auto_470296 ) ) ( not ( = ?auto_470290 ?auto_470297 ) ) ( not ( = ?auto_470290 ?auto_470298 ) ) ( not ( = ?auto_470290 ?auto_470299 ) ) ( not ( = ?auto_470290 ?auto_470300 ) ) ( not ( = ?auto_470290 ?auto_470301 ) ) ( not ( = ?auto_470290 ?auto_470302 ) ) ( not ( = ?auto_470291 ?auto_470292 ) ) ( not ( = ?auto_470291 ?auto_470293 ) ) ( not ( = ?auto_470291 ?auto_470294 ) ) ( not ( = ?auto_470291 ?auto_470295 ) ) ( not ( = ?auto_470291 ?auto_470296 ) ) ( not ( = ?auto_470291 ?auto_470297 ) ) ( not ( = ?auto_470291 ?auto_470298 ) ) ( not ( = ?auto_470291 ?auto_470299 ) ) ( not ( = ?auto_470291 ?auto_470300 ) ) ( not ( = ?auto_470291 ?auto_470301 ) ) ( not ( = ?auto_470291 ?auto_470302 ) ) ( not ( = ?auto_470292 ?auto_470293 ) ) ( not ( = ?auto_470292 ?auto_470294 ) ) ( not ( = ?auto_470292 ?auto_470295 ) ) ( not ( = ?auto_470292 ?auto_470296 ) ) ( not ( = ?auto_470292 ?auto_470297 ) ) ( not ( = ?auto_470292 ?auto_470298 ) ) ( not ( = ?auto_470292 ?auto_470299 ) ) ( not ( = ?auto_470292 ?auto_470300 ) ) ( not ( = ?auto_470292 ?auto_470301 ) ) ( not ( = ?auto_470292 ?auto_470302 ) ) ( not ( = ?auto_470293 ?auto_470294 ) ) ( not ( = ?auto_470293 ?auto_470295 ) ) ( not ( = ?auto_470293 ?auto_470296 ) ) ( not ( = ?auto_470293 ?auto_470297 ) ) ( not ( = ?auto_470293 ?auto_470298 ) ) ( not ( = ?auto_470293 ?auto_470299 ) ) ( not ( = ?auto_470293 ?auto_470300 ) ) ( not ( = ?auto_470293 ?auto_470301 ) ) ( not ( = ?auto_470293 ?auto_470302 ) ) ( not ( = ?auto_470294 ?auto_470295 ) ) ( not ( = ?auto_470294 ?auto_470296 ) ) ( not ( = ?auto_470294 ?auto_470297 ) ) ( not ( = ?auto_470294 ?auto_470298 ) ) ( not ( = ?auto_470294 ?auto_470299 ) ) ( not ( = ?auto_470294 ?auto_470300 ) ) ( not ( = ?auto_470294 ?auto_470301 ) ) ( not ( = ?auto_470294 ?auto_470302 ) ) ( not ( = ?auto_470295 ?auto_470296 ) ) ( not ( = ?auto_470295 ?auto_470297 ) ) ( not ( = ?auto_470295 ?auto_470298 ) ) ( not ( = ?auto_470295 ?auto_470299 ) ) ( not ( = ?auto_470295 ?auto_470300 ) ) ( not ( = ?auto_470295 ?auto_470301 ) ) ( not ( = ?auto_470295 ?auto_470302 ) ) ( not ( = ?auto_470296 ?auto_470297 ) ) ( not ( = ?auto_470296 ?auto_470298 ) ) ( not ( = ?auto_470296 ?auto_470299 ) ) ( not ( = ?auto_470296 ?auto_470300 ) ) ( not ( = ?auto_470296 ?auto_470301 ) ) ( not ( = ?auto_470296 ?auto_470302 ) ) ( not ( = ?auto_470297 ?auto_470298 ) ) ( not ( = ?auto_470297 ?auto_470299 ) ) ( not ( = ?auto_470297 ?auto_470300 ) ) ( not ( = ?auto_470297 ?auto_470301 ) ) ( not ( = ?auto_470297 ?auto_470302 ) ) ( not ( = ?auto_470298 ?auto_470299 ) ) ( not ( = ?auto_470298 ?auto_470300 ) ) ( not ( = ?auto_470298 ?auto_470301 ) ) ( not ( = ?auto_470298 ?auto_470302 ) ) ( not ( = ?auto_470299 ?auto_470300 ) ) ( not ( = ?auto_470299 ?auto_470301 ) ) ( not ( = ?auto_470299 ?auto_470302 ) ) ( not ( = ?auto_470300 ?auto_470301 ) ) ( not ( = ?auto_470300 ?auto_470302 ) ) ( not ( = ?auto_470301 ?auto_470302 ) ) ( ON ?auto_470300 ?auto_470301 ) ( CLEAR ?auto_470298 ) ( ON ?auto_470299 ?auto_470300 ) ( CLEAR ?auto_470299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_470286 ?auto_470287 ?auto_470288 ?auto_470289 ?auto_470290 ?auto_470291 ?auto_470292 ?auto_470293 ?auto_470294 ?auto_470295 ?auto_470296 ?auto_470297 ?auto_470298 ?auto_470299 )
      ( MAKE-16PILE ?auto_470286 ?auto_470287 ?auto_470288 ?auto_470289 ?auto_470290 ?auto_470291 ?auto_470292 ?auto_470293 ?auto_470294 ?auto_470295 ?auto_470296 ?auto_470297 ?auto_470298 ?auto_470299 ?auto_470300 ?auto_470301 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470319 - BLOCK
      ?auto_470320 - BLOCK
      ?auto_470321 - BLOCK
      ?auto_470322 - BLOCK
      ?auto_470323 - BLOCK
      ?auto_470324 - BLOCK
      ?auto_470325 - BLOCK
      ?auto_470326 - BLOCK
      ?auto_470327 - BLOCK
      ?auto_470328 - BLOCK
      ?auto_470329 - BLOCK
      ?auto_470330 - BLOCK
      ?auto_470331 - BLOCK
      ?auto_470332 - BLOCK
      ?auto_470333 - BLOCK
      ?auto_470334 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_470334 ) ( ON-TABLE ?auto_470319 ) ( ON ?auto_470320 ?auto_470319 ) ( ON ?auto_470321 ?auto_470320 ) ( ON ?auto_470322 ?auto_470321 ) ( ON ?auto_470323 ?auto_470322 ) ( ON ?auto_470324 ?auto_470323 ) ( ON ?auto_470325 ?auto_470324 ) ( ON ?auto_470326 ?auto_470325 ) ( ON ?auto_470327 ?auto_470326 ) ( ON ?auto_470328 ?auto_470327 ) ( ON ?auto_470329 ?auto_470328 ) ( ON ?auto_470330 ?auto_470329 ) ( ON ?auto_470331 ?auto_470330 ) ( not ( = ?auto_470319 ?auto_470320 ) ) ( not ( = ?auto_470319 ?auto_470321 ) ) ( not ( = ?auto_470319 ?auto_470322 ) ) ( not ( = ?auto_470319 ?auto_470323 ) ) ( not ( = ?auto_470319 ?auto_470324 ) ) ( not ( = ?auto_470319 ?auto_470325 ) ) ( not ( = ?auto_470319 ?auto_470326 ) ) ( not ( = ?auto_470319 ?auto_470327 ) ) ( not ( = ?auto_470319 ?auto_470328 ) ) ( not ( = ?auto_470319 ?auto_470329 ) ) ( not ( = ?auto_470319 ?auto_470330 ) ) ( not ( = ?auto_470319 ?auto_470331 ) ) ( not ( = ?auto_470319 ?auto_470332 ) ) ( not ( = ?auto_470319 ?auto_470333 ) ) ( not ( = ?auto_470319 ?auto_470334 ) ) ( not ( = ?auto_470320 ?auto_470321 ) ) ( not ( = ?auto_470320 ?auto_470322 ) ) ( not ( = ?auto_470320 ?auto_470323 ) ) ( not ( = ?auto_470320 ?auto_470324 ) ) ( not ( = ?auto_470320 ?auto_470325 ) ) ( not ( = ?auto_470320 ?auto_470326 ) ) ( not ( = ?auto_470320 ?auto_470327 ) ) ( not ( = ?auto_470320 ?auto_470328 ) ) ( not ( = ?auto_470320 ?auto_470329 ) ) ( not ( = ?auto_470320 ?auto_470330 ) ) ( not ( = ?auto_470320 ?auto_470331 ) ) ( not ( = ?auto_470320 ?auto_470332 ) ) ( not ( = ?auto_470320 ?auto_470333 ) ) ( not ( = ?auto_470320 ?auto_470334 ) ) ( not ( = ?auto_470321 ?auto_470322 ) ) ( not ( = ?auto_470321 ?auto_470323 ) ) ( not ( = ?auto_470321 ?auto_470324 ) ) ( not ( = ?auto_470321 ?auto_470325 ) ) ( not ( = ?auto_470321 ?auto_470326 ) ) ( not ( = ?auto_470321 ?auto_470327 ) ) ( not ( = ?auto_470321 ?auto_470328 ) ) ( not ( = ?auto_470321 ?auto_470329 ) ) ( not ( = ?auto_470321 ?auto_470330 ) ) ( not ( = ?auto_470321 ?auto_470331 ) ) ( not ( = ?auto_470321 ?auto_470332 ) ) ( not ( = ?auto_470321 ?auto_470333 ) ) ( not ( = ?auto_470321 ?auto_470334 ) ) ( not ( = ?auto_470322 ?auto_470323 ) ) ( not ( = ?auto_470322 ?auto_470324 ) ) ( not ( = ?auto_470322 ?auto_470325 ) ) ( not ( = ?auto_470322 ?auto_470326 ) ) ( not ( = ?auto_470322 ?auto_470327 ) ) ( not ( = ?auto_470322 ?auto_470328 ) ) ( not ( = ?auto_470322 ?auto_470329 ) ) ( not ( = ?auto_470322 ?auto_470330 ) ) ( not ( = ?auto_470322 ?auto_470331 ) ) ( not ( = ?auto_470322 ?auto_470332 ) ) ( not ( = ?auto_470322 ?auto_470333 ) ) ( not ( = ?auto_470322 ?auto_470334 ) ) ( not ( = ?auto_470323 ?auto_470324 ) ) ( not ( = ?auto_470323 ?auto_470325 ) ) ( not ( = ?auto_470323 ?auto_470326 ) ) ( not ( = ?auto_470323 ?auto_470327 ) ) ( not ( = ?auto_470323 ?auto_470328 ) ) ( not ( = ?auto_470323 ?auto_470329 ) ) ( not ( = ?auto_470323 ?auto_470330 ) ) ( not ( = ?auto_470323 ?auto_470331 ) ) ( not ( = ?auto_470323 ?auto_470332 ) ) ( not ( = ?auto_470323 ?auto_470333 ) ) ( not ( = ?auto_470323 ?auto_470334 ) ) ( not ( = ?auto_470324 ?auto_470325 ) ) ( not ( = ?auto_470324 ?auto_470326 ) ) ( not ( = ?auto_470324 ?auto_470327 ) ) ( not ( = ?auto_470324 ?auto_470328 ) ) ( not ( = ?auto_470324 ?auto_470329 ) ) ( not ( = ?auto_470324 ?auto_470330 ) ) ( not ( = ?auto_470324 ?auto_470331 ) ) ( not ( = ?auto_470324 ?auto_470332 ) ) ( not ( = ?auto_470324 ?auto_470333 ) ) ( not ( = ?auto_470324 ?auto_470334 ) ) ( not ( = ?auto_470325 ?auto_470326 ) ) ( not ( = ?auto_470325 ?auto_470327 ) ) ( not ( = ?auto_470325 ?auto_470328 ) ) ( not ( = ?auto_470325 ?auto_470329 ) ) ( not ( = ?auto_470325 ?auto_470330 ) ) ( not ( = ?auto_470325 ?auto_470331 ) ) ( not ( = ?auto_470325 ?auto_470332 ) ) ( not ( = ?auto_470325 ?auto_470333 ) ) ( not ( = ?auto_470325 ?auto_470334 ) ) ( not ( = ?auto_470326 ?auto_470327 ) ) ( not ( = ?auto_470326 ?auto_470328 ) ) ( not ( = ?auto_470326 ?auto_470329 ) ) ( not ( = ?auto_470326 ?auto_470330 ) ) ( not ( = ?auto_470326 ?auto_470331 ) ) ( not ( = ?auto_470326 ?auto_470332 ) ) ( not ( = ?auto_470326 ?auto_470333 ) ) ( not ( = ?auto_470326 ?auto_470334 ) ) ( not ( = ?auto_470327 ?auto_470328 ) ) ( not ( = ?auto_470327 ?auto_470329 ) ) ( not ( = ?auto_470327 ?auto_470330 ) ) ( not ( = ?auto_470327 ?auto_470331 ) ) ( not ( = ?auto_470327 ?auto_470332 ) ) ( not ( = ?auto_470327 ?auto_470333 ) ) ( not ( = ?auto_470327 ?auto_470334 ) ) ( not ( = ?auto_470328 ?auto_470329 ) ) ( not ( = ?auto_470328 ?auto_470330 ) ) ( not ( = ?auto_470328 ?auto_470331 ) ) ( not ( = ?auto_470328 ?auto_470332 ) ) ( not ( = ?auto_470328 ?auto_470333 ) ) ( not ( = ?auto_470328 ?auto_470334 ) ) ( not ( = ?auto_470329 ?auto_470330 ) ) ( not ( = ?auto_470329 ?auto_470331 ) ) ( not ( = ?auto_470329 ?auto_470332 ) ) ( not ( = ?auto_470329 ?auto_470333 ) ) ( not ( = ?auto_470329 ?auto_470334 ) ) ( not ( = ?auto_470330 ?auto_470331 ) ) ( not ( = ?auto_470330 ?auto_470332 ) ) ( not ( = ?auto_470330 ?auto_470333 ) ) ( not ( = ?auto_470330 ?auto_470334 ) ) ( not ( = ?auto_470331 ?auto_470332 ) ) ( not ( = ?auto_470331 ?auto_470333 ) ) ( not ( = ?auto_470331 ?auto_470334 ) ) ( not ( = ?auto_470332 ?auto_470333 ) ) ( not ( = ?auto_470332 ?auto_470334 ) ) ( not ( = ?auto_470333 ?auto_470334 ) ) ( ON ?auto_470333 ?auto_470334 ) ( CLEAR ?auto_470331 ) ( ON ?auto_470332 ?auto_470333 ) ( CLEAR ?auto_470332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_470319 ?auto_470320 ?auto_470321 ?auto_470322 ?auto_470323 ?auto_470324 ?auto_470325 ?auto_470326 ?auto_470327 ?auto_470328 ?auto_470329 ?auto_470330 ?auto_470331 ?auto_470332 )
      ( MAKE-16PILE ?auto_470319 ?auto_470320 ?auto_470321 ?auto_470322 ?auto_470323 ?auto_470324 ?auto_470325 ?auto_470326 ?auto_470327 ?auto_470328 ?auto_470329 ?auto_470330 ?auto_470331 ?auto_470332 ?auto_470333 ?auto_470334 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470351 - BLOCK
      ?auto_470352 - BLOCK
      ?auto_470353 - BLOCK
      ?auto_470354 - BLOCK
      ?auto_470355 - BLOCK
      ?auto_470356 - BLOCK
      ?auto_470357 - BLOCK
      ?auto_470358 - BLOCK
      ?auto_470359 - BLOCK
      ?auto_470360 - BLOCK
      ?auto_470361 - BLOCK
      ?auto_470362 - BLOCK
      ?auto_470363 - BLOCK
      ?auto_470364 - BLOCK
      ?auto_470365 - BLOCK
      ?auto_470366 - BLOCK
    )
    :vars
    (
      ?auto_470367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470366 ?auto_470367 ) ( ON-TABLE ?auto_470351 ) ( ON ?auto_470352 ?auto_470351 ) ( ON ?auto_470353 ?auto_470352 ) ( ON ?auto_470354 ?auto_470353 ) ( ON ?auto_470355 ?auto_470354 ) ( ON ?auto_470356 ?auto_470355 ) ( ON ?auto_470357 ?auto_470356 ) ( ON ?auto_470358 ?auto_470357 ) ( ON ?auto_470359 ?auto_470358 ) ( ON ?auto_470360 ?auto_470359 ) ( ON ?auto_470361 ?auto_470360 ) ( ON ?auto_470362 ?auto_470361 ) ( not ( = ?auto_470351 ?auto_470352 ) ) ( not ( = ?auto_470351 ?auto_470353 ) ) ( not ( = ?auto_470351 ?auto_470354 ) ) ( not ( = ?auto_470351 ?auto_470355 ) ) ( not ( = ?auto_470351 ?auto_470356 ) ) ( not ( = ?auto_470351 ?auto_470357 ) ) ( not ( = ?auto_470351 ?auto_470358 ) ) ( not ( = ?auto_470351 ?auto_470359 ) ) ( not ( = ?auto_470351 ?auto_470360 ) ) ( not ( = ?auto_470351 ?auto_470361 ) ) ( not ( = ?auto_470351 ?auto_470362 ) ) ( not ( = ?auto_470351 ?auto_470363 ) ) ( not ( = ?auto_470351 ?auto_470364 ) ) ( not ( = ?auto_470351 ?auto_470365 ) ) ( not ( = ?auto_470351 ?auto_470366 ) ) ( not ( = ?auto_470351 ?auto_470367 ) ) ( not ( = ?auto_470352 ?auto_470353 ) ) ( not ( = ?auto_470352 ?auto_470354 ) ) ( not ( = ?auto_470352 ?auto_470355 ) ) ( not ( = ?auto_470352 ?auto_470356 ) ) ( not ( = ?auto_470352 ?auto_470357 ) ) ( not ( = ?auto_470352 ?auto_470358 ) ) ( not ( = ?auto_470352 ?auto_470359 ) ) ( not ( = ?auto_470352 ?auto_470360 ) ) ( not ( = ?auto_470352 ?auto_470361 ) ) ( not ( = ?auto_470352 ?auto_470362 ) ) ( not ( = ?auto_470352 ?auto_470363 ) ) ( not ( = ?auto_470352 ?auto_470364 ) ) ( not ( = ?auto_470352 ?auto_470365 ) ) ( not ( = ?auto_470352 ?auto_470366 ) ) ( not ( = ?auto_470352 ?auto_470367 ) ) ( not ( = ?auto_470353 ?auto_470354 ) ) ( not ( = ?auto_470353 ?auto_470355 ) ) ( not ( = ?auto_470353 ?auto_470356 ) ) ( not ( = ?auto_470353 ?auto_470357 ) ) ( not ( = ?auto_470353 ?auto_470358 ) ) ( not ( = ?auto_470353 ?auto_470359 ) ) ( not ( = ?auto_470353 ?auto_470360 ) ) ( not ( = ?auto_470353 ?auto_470361 ) ) ( not ( = ?auto_470353 ?auto_470362 ) ) ( not ( = ?auto_470353 ?auto_470363 ) ) ( not ( = ?auto_470353 ?auto_470364 ) ) ( not ( = ?auto_470353 ?auto_470365 ) ) ( not ( = ?auto_470353 ?auto_470366 ) ) ( not ( = ?auto_470353 ?auto_470367 ) ) ( not ( = ?auto_470354 ?auto_470355 ) ) ( not ( = ?auto_470354 ?auto_470356 ) ) ( not ( = ?auto_470354 ?auto_470357 ) ) ( not ( = ?auto_470354 ?auto_470358 ) ) ( not ( = ?auto_470354 ?auto_470359 ) ) ( not ( = ?auto_470354 ?auto_470360 ) ) ( not ( = ?auto_470354 ?auto_470361 ) ) ( not ( = ?auto_470354 ?auto_470362 ) ) ( not ( = ?auto_470354 ?auto_470363 ) ) ( not ( = ?auto_470354 ?auto_470364 ) ) ( not ( = ?auto_470354 ?auto_470365 ) ) ( not ( = ?auto_470354 ?auto_470366 ) ) ( not ( = ?auto_470354 ?auto_470367 ) ) ( not ( = ?auto_470355 ?auto_470356 ) ) ( not ( = ?auto_470355 ?auto_470357 ) ) ( not ( = ?auto_470355 ?auto_470358 ) ) ( not ( = ?auto_470355 ?auto_470359 ) ) ( not ( = ?auto_470355 ?auto_470360 ) ) ( not ( = ?auto_470355 ?auto_470361 ) ) ( not ( = ?auto_470355 ?auto_470362 ) ) ( not ( = ?auto_470355 ?auto_470363 ) ) ( not ( = ?auto_470355 ?auto_470364 ) ) ( not ( = ?auto_470355 ?auto_470365 ) ) ( not ( = ?auto_470355 ?auto_470366 ) ) ( not ( = ?auto_470355 ?auto_470367 ) ) ( not ( = ?auto_470356 ?auto_470357 ) ) ( not ( = ?auto_470356 ?auto_470358 ) ) ( not ( = ?auto_470356 ?auto_470359 ) ) ( not ( = ?auto_470356 ?auto_470360 ) ) ( not ( = ?auto_470356 ?auto_470361 ) ) ( not ( = ?auto_470356 ?auto_470362 ) ) ( not ( = ?auto_470356 ?auto_470363 ) ) ( not ( = ?auto_470356 ?auto_470364 ) ) ( not ( = ?auto_470356 ?auto_470365 ) ) ( not ( = ?auto_470356 ?auto_470366 ) ) ( not ( = ?auto_470356 ?auto_470367 ) ) ( not ( = ?auto_470357 ?auto_470358 ) ) ( not ( = ?auto_470357 ?auto_470359 ) ) ( not ( = ?auto_470357 ?auto_470360 ) ) ( not ( = ?auto_470357 ?auto_470361 ) ) ( not ( = ?auto_470357 ?auto_470362 ) ) ( not ( = ?auto_470357 ?auto_470363 ) ) ( not ( = ?auto_470357 ?auto_470364 ) ) ( not ( = ?auto_470357 ?auto_470365 ) ) ( not ( = ?auto_470357 ?auto_470366 ) ) ( not ( = ?auto_470357 ?auto_470367 ) ) ( not ( = ?auto_470358 ?auto_470359 ) ) ( not ( = ?auto_470358 ?auto_470360 ) ) ( not ( = ?auto_470358 ?auto_470361 ) ) ( not ( = ?auto_470358 ?auto_470362 ) ) ( not ( = ?auto_470358 ?auto_470363 ) ) ( not ( = ?auto_470358 ?auto_470364 ) ) ( not ( = ?auto_470358 ?auto_470365 ) ) ( not ( = ?auto_470358 ?auto_470366 ) ) ( not ( = ?auto_470358 ?auto_470367 ) ) ( not ( = ?auto_470359 ?auto_470360 ) ) ( not ( = ?auto_470359 ?auto_470361 ) ) ( not ( = ?auto_470359 ?auto_470362 ) ) ( not ( = ?auto_470359 ?auto_470363 ) ) ( not ( = ?auto_470359 ?auto_470364 ) ) ( not ( = ?auto_470359 ?auto_470365 ) ) ( not ( = ?auto_470359 ?auto_470366 ) ) ( not ( = ?auto_470359 ?auto_470367 ) ) ( not ( = ?auto_470360 ?auto_470361 ) ) ( not ( = ?auto_470360 ?auto_470362 ) ) ( not ( = ?auto_470360 ?auto_470363 ) ) ( not ( = ?auto_470360 ?auto_470364 ) ) ( not ( = ?auto_470360 ?auto_470365 ) ) ( not ( = ?auto_470360 ?auto_470366 ) ) ( not ( = ?auto_470360 ?auto_470367 ) ) ( not ( = ?auto_470361 ?auto_470362 ) ) ( not ( = ?auto_470361 ?auto_470363 ) ) ( not ( = ?auto_470361 ?auto_470364 ) ) ( not ( = ?auto_470361 ?auto_470365 ) ) ( not ( = ?auto_470361 ?auto_470366 ) ) ( not ( = ?auto_470361 ?auto_470367 ) ) ( not ( = ?auto_470362 ?auto_470363 ) ) ( not ( = ?auto_470362 ?auto_470364 ) ) ( not ( = ?auto_470362 ?auto_470365 ) ) ( not ( = ?auto_470362 ?auto_470366 ) ) ( not ( = ?auto_470362 ?auto_470367 ) ) ( not ( = ?auto_470363 ?auto_470364 ) ) ( not ( = ?auto_470363 ?auto_470365 ) ) ( not ( = ?auto_470363 ?auto_470366 ) ) ( not ( = ?auto_470363 ?auto_470367 ) ) ( not ( = ?auto_470364 ?auto_470365 ) ) ( not ( = ?auto_470364 ?auto_470366 ) ) ( not ( = ?auto_470364 ?auto_470367 ) ) ( not ( = ?auto_470365 ?auto_470366 ) ) ( not ( = ?auto_470365 ?auto_470367 ) ) ( not ( = ?auto_470366 ?auto_470367 ) ) ( ON ?auto_470365 ?auto_470366 ) ( ON ?auto_470364 ?auto_470365 ) ( CLEAR ?auto_470362 ) ( ON ?auto_470363 ?auto_470364 ) ( CLEAR ?auto_470363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_470351 ?auto_470352 ?auto_470353 ?auto_470354 ?auto_470355 ?auto_470356 ?auto_470357 ?auto_470358 ?auto_470359 ?auto_470360 ?auto_470361 ?auto_470362 ?auto_470363 )
      ( MAKE-16PILE ?auto_470351 ?auto_470352 ?auto_470353 ?auto_470354 ?auto_470355 ?auto_470356 ?auto_470357 ?auto_470358 ?auto_470359 ?auto_470360 ?auto_470361 ?auto_470362 ?auto_470363 ?auto_470364 ?auto_470365 ?auto_470366 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470384 - BLOCK
      ?auto_470385 - BLOCK
      ?auto_470386 - BLOCK
      ?auto_470387 - BLOCK
      ?auto_470388 - BLOCK
      ?auto_470389 - BLOCK
      ?auto_470390 - BLOCK
      ?auto_470391 - BLOCK
      ?auto_470392 - BLOCK
      ?auto_470393 - BLOCK
      ?auto_470394 - BLOCK
      ?auto_470395 - BLOCK
      ?auto_470396 - BLOCK
      ?auto_470397 - BLOCK
      ?auto_470398 - BLOCK
      ?auto_470399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_470399 ) ( ON-TABLE ?auto_470384 ) ( ON ?auto_470385 ?auto_470384 ) ( ON ?auto_470386 ?auto_470385 ) ( ON ?auto_470387 ?auto_470386 ) ( ON ?auto_470388 ?auto_470387 ) ( ON ?auto_470389 ?auto_470388 ) ( ON ?auto_470390 ?auto_470389 ) ( ON ?auto_470391 ?auto_470390 ) ( ON ?auto_470392 ?auto_470391 ) ( ON ?auto_470393 ?auto_470392 ) ( ON ?auto_470394 ?auto_470393 ) ( ON ?auto_470395 ?auto_470394 ) ( not ( = ?auto_470384 ?auto_470385 ) ) ( not ( = ?auto_470384 ?auto_470386 ) ) ( not ( = ?auto_470384 ?auto_470387 ) ) ( not ( = ?auto_470384 ?auto_470388 ) ) ( not ( = ?auto_470384 ?auto_470389 ) ) ( not ( = ?auto_470384 ?auto_470390 ) ) ( not ( = ?auto_470384 ?auto_470391 ) ) ( not ( = ?auto_470384 ?auto_470392 ) ) ( not ( = ?auto_470384 ?auto_470393 ) ) ( not ( = ?auto_470384 ?auto_470394 ) ) ( not ( = ?auto_470384 ?auto_470395 ) ) ( not ( = ?auto_470384 ?auto_470396 ) ) ( not ( = ?auto_470384 ?auto_470397 ) ) ( not ( = ?auto_470384 ?auto_470398 ) ) ( not ( = ?auto_470384 ?auto_470399 ) ) ( not ( = ?auto_470385 ?auto_470386 ) ) ( not ( = ?auto_470385 ?auto_470387 ) ) ( not ( = ?auto_470385 ?auto_470388 ) ) ( not ( = ?auto_470385 ?auto_470389 ) ) ( not ( = ?auto_470385 ?auto_470390 ) ) ( not ( = ?auto_470385 ?auto_470391 ) ) ( not ( = ?auto_470385 ?auto_470392 ) ) ( not ( = ?auto_470385 ?auto_470393 ) ) ( not ( = ?auto_470385 ?auto_470394 ) ) ( not ( = ?auto_470385 ?auto_470395 ) ) ( not ( = ?auto_470385 ?auto_470396 ) ) ( not ( = ?auto_470385 ?auto_470397 ) ) ( not ( = ?auto_470385 ?auto_470398 ) ) ( not ( = ?auto_470385 ?auto_470399 ) ) ( not ( = ?auto_470386 ?auto_470387 ) ) ( not ( = ?auto_470386 ?auto_470388 ) ) ( not ( = ?auto_470386 ?auto_470389 ) ) ( not ( = ?auto_470386 ?auto_470390 ) ) ( not ( = ?auto_470386 ?auto_470391 ) ) ( not ( = ?auto_470386 ?auto_470392 ) ) ( not ( = ?auto_470386 ?auto_470393 ) ) ( not ( = ?auto_470386 ?auto_470394 ) ) ( not ( = ?auto_470386 ?auto_470395 ) ) ( not ( = ?auto_470386 ?auto_470396 ) ) ( not ( = ?auto_470386 ?auto_470397 ) ) ( not ( = ?auto_470386 ?auto_470398 ) ) ( not ( = ?auto_470386 ?auto_470399 ) ) ( not ( = ?auto_470387 ?auto_470388 ) ) ( not ( = ?auto_470387 ?auto_470389 ) ) ( not ( = ?auto_470387 ?auto_470390 ) ) ( not ( = ?auto_470387 ?auto_470391 ) ) ( not ( = ?auto_470387 ?auto_470392 ) ) ( not ( = ?auto_470387 ?auto_470393 ) ) ( not ( = ?auto_470387 ?auto_470394 ) ) ( not ( = ?auto_470387 ?auto_470395 ) ) ( not ( = ?auto_470387 ?auto_470396 ) ) ( not ( = ?auto_470387 ?auto_470397 ) ) ( not ( = ?auto_470387 ?auto_470398 ) ) ( not ( = ?auto_470387 ?auto_470399 ) ) ( not ( = ?auto_470388 ?auto_470389 ) ) ( not ( = ?auto_470388 ?auto_470390 ) ) ( not ( = ?auto_470388 ?auto_470391 ) ) ( not ( = ?auto_470388 ?auto_470392 ) ) ( not ( = ?auto_470388 ?auto_470393 ) ) ( not ( = ?auto_470388 ?auto_470394 ) ) ( not ( = ?auto_470388 ?auto_470395 ) ) ( not ( = ?auto_470388 ?auto_470396 ) ) ( not ( = ?auto_470388 ?auto_470397 ) ) ( not ( = ?auto_470388 ?auto_470398 ) ) ( not ( = ?auto_470388 ?auto_470399 ) ) ( not ( = ?auto_470389 ?auto_470390 ) ) ( not ( = ?auto_470389 ?auto_470391 ) ) ( not ( = ?auto_470389 ?auto_470392 ) ) ( not ( = ?auto_470389 ?auto_470393 ) ) ( not ( = ?auto_470389 ?auto_470394 ) ) ( not ( = ?auto_470389 ?auto_470395 ) ) ( not ( = ?auto_470389 ?auto_470396 ) ) ( not ( = ?auto_470389 ?auto_470397 ) ) ( not ( = ?auto_470389 ?auto_470398 ) ) ( not ( = ?auto_470389 ?auto_470399 ) ) ( not ( = ?auto_470390 ?auto_470391 ) ) ( not ( = ?auto_470390 ?auto_470392 ) ) ( not ( = ?auto_470390 ?auto_470393 ) ) ( not ( = ?auto_470390 ?auto_470394 ) ) ( not ( = ?auto_470390 ?auto_470395 ) ) ( not ( = ?auto_470390 ?auto_470396 ) ) ( not ( = ?auto_470390 ?auto_470397 ) ) ( not ( = ?auto_470390 ?auto_470398 ) ) ( not ( = ?auto_470390 ?auto_470399 ) ) ( not ( = ?auto_470391 ?auto_470392 ) ) ( not ( = ?auto_470391 ?auto_470393 ) ) ( not ( = ?auto_470391 ?auto_470394 ) ) ( not ( = ?auto_470391 ?auto_470395 ) ) ( not ( = ?auto_470391 ?auto_470396 ) ) ( not ( = ?auto_470391 ?auto_470397 ) ) ( not ( = ?auto_470391 ?auto_470398 ) ) ( not ( = ?auto_470391 ?auto_470399 ) ) ( not ( = ?auto_470392 ?auto_470393 ) ) ( not ( = ?auto_470392 ?auto_470394 ) ) ( not ( = ?auto_470392 ?auto_470395 ) ) ( not ( = ?auto_470392 ?auto_470396 ) ) ( not ( = ?auto_470392 ?auto_470397 ) ) ( not ( = ?auto_470392 ?auto_470398 ) ) ( not ( = ?auto_470392 ?auto_470399 ) ) ( not ( = ?auto_470393 ?auto_470394 ) ) ( not ( = ?auto_470393 ?auto_470395 ) ) ( not ( = ?auto_470393 ?auto_470396 ) ) ( not ( = ?auto_470393 ?auto_470397 ) ) ( not ( = ?auto_470393 ?auto_470398 ) ) ( not ( = ?auto_470393 ?auto_470399 ) ) ( not ( = ?auto_470394 ?auto_470395 ) ) ( not ( = ?auto_470394 ?auto_470396 ) ) ( not ( = ?auto_470394 ?auto_470397 ) ) ( not ( = ?auto_470394 ?auto_470398 ) ) ( not ( = ?auto_470394 ?auto_470399 ) ) ( not ( = ?auto_470395 ?auto_470396 ) ) ( not ( = ?auto_470395 ?auto_470397 ) ) ( not ( = ?auto_470395 ?auto_470398 ) ) ( not ( = ?auto_470395 ?auto_470399 ) ) ( not ( = ?auto_470396 ?auto_470397 ) ) ( not ( = ?auto_470396 ?auto_470398 ) ) ( not ( = ?auto_470396 ?auto_470399 ) ) ( not ( = ?auto_470397 ?auto_470398 ) ) ( not ( = ?auto_470397 ?auto_470399 ) ) ( not ( = ?auto_470398 ?auto_470399 ) ) ( ON ?auto_470398 ?auto_470399 ) ( ON ?auto_470397 ?auto_470398 ) ( CLEAR ?auto_470395 ) ( ON ?auto_470396 ?auto_470397 ) ( CLEAR ?auto_470396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_470384 ?auto_470385 ?auto_470386 ?auto_470387 ?auto_470388 ?auto_470389 ?auto_470390 ?auto_470391 ?auto_470392 ?auto_470393 ?auto_470394 ?auto_470395 ?auto_470396 )
      ( MAKE-16PILE ?auto_470384 ?auto_470385 ?auto_470386 ?auto_470387 ?auto_470388 ?auto_470389 ?auto_470390 ?auto_470391 ?auto_470392 ?auto_470393 ?auto_470394 ?auto_470395 ?auto_470396 ?auto_470397 ?auto_470398 ?auto_470399 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470416 - BLOCK
      ?auto_470417 - BLOCK
      ?auto_470418 - BLOCK
      ?auto_470419 - BLOCK
      ?auto_470420 - BLOCK
      ?auto_470421 - BLOCK
      ?auto_470422 - BLOCK
      ?auto_470423 - BLOCK
      ?auto_470424 - BLOCK
      ?auto_470425 - BLOCK
      ?auto_470426 - BLOCK
      ?auto_470427 - BLOCK
      ?auto_470428 - BLOCK
      ?auto_470429 - BLOCK
      ?auto_470430 - BLOCK
      ?auto_470431 - BLOCK
    )
    :vars
    (
      ?auto_470432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470431 ?auto_470432 ) ( ON-TABLE ?auto_470416 ) ( ON ?auto_470417 ?auto_470416 ) ( ON ?auto_470418 ?auto_470417 ) ( ON ?auto_470419 ?auto_470418 ) ( ON ?auto_470420 ?auto_470419 ) ( ON ?auto_470421 ?auto_470420 ) ( ON ?auto_470422 ?auto_470421 ) ( ON ?auto_470423 ?auto_470422 ) ( ON ?auto_470424 ?auto_470423 ) ( ON ?auto_470425 ?auto_470424 ) ( ON ?auto_470426 ?auto_470425 ) ( not ( = ?auto_470416 ?auto_470417 ) ) ( not ( = ?auto_470416 ?auto_470418 ) ) ( not ( = ?auto_470416 ?auto_470419 ) ) ( not ( = ?auto_470416 ?auto_470420 ) ) ( not ( = ?auto_470416 ?auto_470421 ) ) ( not ( = ?auto_470416 ?auto_470422 ) ) ( not ( = ?auto_470416 ?auto_470423 ) ) ( not ( = ?auto_470416 ?auto_470424 ) ) ( not ( = ?auto_470416 ?auto_470425 ) ) ( not ( = ?auto_470416 ?auto_470426 ) ) ( not ( = ?auto_470416 ?auto_470427 ) ) ( not ( = ?auto_470416 ?auto_470428 ) ) ( not ( = ?auto_470416 ?auto_470429 ) ) ( not ( = ?auto_470416 ?auto_470430 ) ) ( not ( = ?auto_470416 ?auto_470431 ) ) ( not ( = ?auto_470416 ?auto_470432 ) ) ( not ( = ?auto_470417 ?auto_470418 ) ) ( not ( = ?auto_470417 ?auto_470419 ) ) ( not ( = ?auto_470417 ?auto_470420 ) ) ( not ( = ?auto_470417 ?auto_470421 ) ) ( not ( = ?auto_470417 ?auto_470422 ) ) ( not ( = ?auto_470417 ?auto_470423 ) ) ( not ( = ?auto_470417 ?auto_470424 ) ) ( not ( = ?auto_470417 ?auto_470425 ) ) ( not ( = ?auto_470417 ?auto_470426 ) ) ( not ( = ?auto_470417 ?auto_470427 ) ) ( not ( = ?auto_470417 ?auto_470428 ) ) ( not ( = ?auto_470417 ?auto_470429 ) ) ( not ( = ?auto_470417 ?auto_470430 ) ) ( not ( = ?auto_470417 ?auto_470431 ) ) ( not ( = ?auto_470417 ?auto_470432 ) ) ( not ( = ?auto_470418 ?auto_470419 ) ) ( not ( = ?auto_470418 ?auto_470420 ) ) ( not ( = ?auto_470418 ?auto_470421 ) ) ( not ( = ?auto_470418 ?auto_470422 ) ) ( not ( = ?auto_470418 ?auto_470423 ) ) ( not ( = ?auto_470418 ?auto_470424 ) ) ( not ( = ?auto_470418 ?auto_470425 ) ) ( not ( = ?auto_470418 ?auto_470426 ) ) ( not ( = ?auto_470418 ?auto_470427 ) ) ( not ( = ?auto_470418 ?auto_470428 ) ) ( not ( = ?auto_470418 ?auto_470429 ) ) ( not ( = ?auto_470418 ?auto_470430 ) ) ( not ( = ?auto_470418 ?auto_470431 ) ) ( not ( = ?auto_470418 ?auto_470432 ) ) ( not ( = ?auto_470419 ?auto_470420 ) ) ( not ( = ?auto_470419 ?auto_470421 ) ) ( not ( = ?auto_470419 ?auto_470422 ) ) ( not ( = ?auto_470419 ?auto_470423 ) ) ( not ( = ?auto_470419 ?auto_470424 ) ) ( not ( = ?auto_470419 ?auto_470425 ) ) ( not ( = ?auto_470419 ?auto_470426 ) ) ( not ( = ?auto_470419 ?auto_470427 ) ) ( not ( = ?auto_470419 ?auto_470428 ) ) ( not ( = ?auto_470419 ?auto_470429 ) ) ( not ( = ?auto_470419 ?auto_470430 ) ) ( not ( = ?auto_470419 ?auto_470431 ) ) ( not ( = ?auto_470419 ?auto_470432 ) ) ( not ( = ?auto_470420 ?auto_470421 ) ) ( not ( = ?auto_470420 ?auto_470422 ) ) ( not ( = ?auto_470420 ?auto_470423 ) ) ( not ( = ?auto_470420 ?auto_470424 ) ) ( not ( = ?auto_470420 ?auto_470425 ) ) ( not ( = ?auto_470420 ?auto_470426 ) ) ( not ( = ?auto_470420 ?auto_470427 ) ) ( not ( = ?auto_470420 ?auto_470428 ) ) ( not ( = ?auto_470420 ?auto_470429 ) ) ( not ( = ?auto_470420 ?auto_470430 ) ) ( not ( = ?auto_470420 ?auto_470431 ) ) ( not ( = ?auto_470420 ?auto_470432 ) ) ( not ( = ?auto_470421 ?auto_470422 ) ) ( not ( = ?auto_470421 ?auto_470423 ) ) ( not ( = ?auto_470421 ?auto_470424 ) ) ( not ( = ?auto_470421 ?auto_470425 ) ) ( not ( = ?auto_470421 ?auto_470426 ) ) ( not ( = ?auto_470421 ?auto_470427 ) ) ( not ( = ?auto_470421 ?auto_470428 ) ) ( not ( = ?auto_470421 ?auto_470429 ) ) ( not ( = ?auto_470421 ?auto_470430 ) ) ( not ( = ?auto_470421 ?auto_470431 ) ) ( not ( = ?auto_470421 ?auto_470432 ) ) ( not ( = ?auto_470422 ?auto_470423 ) ) ( not ( = ?auto_470422 ?auto_470424 ) ) ( not ( = ?auto_470422 ?auto_470425 ) ) ( not ( = ?auto_470422 ?auto_470426 ) ) ( not ( = ?auto_470422 ?auto_470427 ) ) ( not ( = ?auto_470422 ?auto_470428 ) ) ( not ( = ?auto_470422 ?auto_470429 ) ) ( not ( = ?auto_470422 ?auto_470430 ) ) ( not ( = ?auto_470422 ?auto_470431 ) ) ( not ( = ?auto_470422 ?auto_470432 ) ) ( not ( = ?auto_470423 ?auto_470424 ) ) ( not ( = ?auto_470423 ?auto_470425 ) ) ( not ( = ?auto_470423 ?auto_470426 ) ) ( not ( = ?auto_470423 ?auto_470427 ) ) ( not ( = ?auto_470423 ?auto_470428 ) ) ( not ( = ?auto_470423 ?auto_470429 ) ) ( not ( = ?auto_470423 ?auto_470430 ) ) ( not ( = ?auto_470423 ?auto_470431 ) ) ( not ( = ?auto_470423 ?auto_470432 ) ) ( not ( = ?auto_470424 ?auto_470425 ) ) ( not ( = ?auto_470424 ?auto_470426 ) ) ( not ( = ?auto_470424 ?auto_470427 ) ) ( not ( = ?auto_470424 ?auto_470428 ) ) ( not ( = ?auto_470424 ?auto_470429 ) ) ( not ( = ?auto_470424 ?auto_470430 ) ) ( not ( = ?auto_470424 ?auto_470431 ) ) ( not ( = ?auto_470424 ?auto_470432 ) ) ( not ( = ?auto_470425 ?auto_470426 ) ) ( not ( = ?auto_470425 ?auto_470427 ) ) ( not ( = ?auto_470425 ?auto_470428 ) ) ( not ( = ?auto_470425 ?auto_470429 ) ) ( not ( = ?auto_470425 ?auto_470430 ) ) ( not ( = ?auto_470425 ?auto_470431 ) ) ( not ( = ?auto_470425 ?auto_470432 ) ) ( not ( = ?auto_470426 ?auto_470427 ) ) ( not ( = ?auto_470426 ?auto_470428 ) ) ( not ( = ?auto_470426 ?auto_470429 ) ) ( not ( = ?auto_470426 ?auto_470430 ) ) ( not ( = ?auto_470426 ?auto_470431 ) ) ( not ( = ?auto_470426 ?auto_470432 ) ) ( not ( = ?auto_470427 ?auto_470428 ) ) ( not ( = ?auto_470427 ?auto_470429 ) ) ( not ( = ?auto_470427 ?auto_470430 ) ) ( not ( = ?auto_470427 ?auto_470431 ) ) ( not ( = ?auto_470427 ?auto_470432 ) ) ( not ( = ?auto_470428 ?auto_470429 ) ) ( not ( = ?auto_470428 ?auto_470430 ) ) ( not ( = ?auto_470428 ?auto_470431 ) ) ( not ( = ?auto_470428 ?auto_470432 ) ) ( not ( = ?auto_470429 ?auto_470430 ) ) ( not ( = ?auto_470429 ?auto_470431 ) ) ( not ( = ?auto_470429 ?auto_470432 ) ) ( not ( = ?auto_470430 ?auto_470431 ) ) ( not ( = ?auto_470430 ?auto_470432 ) ) ( not ( = ?auto_470431 ?auto_470432 ) ) ( ON ?auto_470430 ?auto_470431 ) ( ON ?auto_470429 ?auto_470430 ) ( ON ?auto_470428 ?auto_470429 ) ( CLEAR ?auto_470426 ) ( ON ?auto_470427 ?auto_470428 ) ( CLEAR ?auto_470427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_470416 ?auto_470417 ?auto_470418 ?auto_470419 ?auto_470420 ?auto_470421 ?auto_470422 ?auto_470423 ?auto_470424 ?auto_470425 ?auto_470426 ?auto_470427 )
      ( MAKE-16PILE ?auto_470416 ?auto_470417 ?auto_470418 ?auto_470419 ?auto_470420 ?auto_470421 ?auto_470422 ?auto_470423 ?auto_470424 ?auto_470425 ?auto_470426 ?auto_470427 ?auto_470428 ?auto_470429 ?auto_470430 ?auto_470431 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470449 - BLOCK
      ?auto_470450 - BLOCK
      ?auto_470451 - BLOCK
      ?auto_470452 - BLOCK
      ?auto_470453 - BLOCK
      ?auto_470454 - BLOCK
      ?auto_470455 - BLOCK
      ?auto_470456 - BLOCK
      ?auto_470457 - BLOCK
      ?auto_470458 - BLOCK
      ?auto_470459 - BLOCK
      ?auto_470460 - BLOCK
      ?auto_470461 - BLOCK
      ?auto_470462 - BLOCK
      ?auto_470463 - BLOCK
      ?auto_470464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_470464 ) ( ON-TABLE ?auto_470449 ) ( ON ?auto_470450 ?auto_470449 ) ( ON ?auto_470451 ?auto_470450 ) ( ON ?auto_470452 ?auto_470451 ) ( ON ?auto_470453 ?auto_470452 ) ( ON ?auto_470454 ?auto_470453 ) ( ON ?auto_470455 ?auto_470454 ) ( ON ?auto_470456 ?auto_470455 ) ( ON ?auto_470457 ?auto_470456 ) ( ON ?auto_470458 ?auto_470457 ) ( ON ?auto_470459 ?auto_470458 ) ( not ( = ?auto_470449 ?auto_470450 ) ) ( not ( = ?auto_470449 ?auto_470451 ) ) ( not ( = ?auto_470449 ?auto_470452 ) ) ( not ( = ?auto_470449 ?auto_470453 ) ) ( not ( = ?auto_470449 ?auto_470454 ) ) ( not ( = ?auto_470449 ?auto_470455 ) ) ( not ( = ?auto_470449 ?auto_470456 ) ) ( not ( = ?auto_470449 ?auto_470457 ) ) ( not ( = ?auto_470449 ?auto_470458 ) ) ( not ( = ?auto_470449 ?auto_470459 ) ) ( not ( = ?auto_470449 ?auto_470460 ) ) ( not ( = ?auto_470449 ?auto_470461 ) ) ( not ( = ?auto_470449 ?auto_470462 ) ) ( not ( = ?auto_470449 ?auto_470463 ) ) ( not ( = ?auto_470449 ?auto_470464 ) ) ( not ( = ?auto_470450 ?auto_470451 ) ) ( not ( = ?auto_470450 ?auto_470452 ) ) ( not ( = ?auto_470450 ?auto_470453 ) ) ( not ( = ?auto_470450 ?auto_470454 ) ) ( not ( = ?auto_470450 ?auto_470455 ) ) ( not ( = ?auto_470450 ?auto_470456 ) ) ( not ( = ?auto_470450 ?auto_470457 ) ) ( not ( = ?auto_470450 ?auto_470458 ) ) ( not ( = ?auto_470450 ?auto_470459 ) ) ( not ( = ?auto_470450 ?auto_470460 ) ) ( not ( = ?auto_470450 ?auto_470461 ) ) ( not ( = ?auto_470450 ?auto_470462 ) ) ( not ( = ?auto_470450 ?auto_470463 ) ) ( not ( = ?auto_470450 ?auto_470464 ) ) ( not ( = ?auto_470451 ?auto_470452 ) ) ( not ( = ?auto_470451 ?auto_470453 ) ) ( not ( = ?auto_470451 ?auto_470454 ) ) ( not ( = ?auto_470451 ?auto_470455 ) ) ( not ( = ?auto_470451 ?auto_470456 ) ) ( not ( = ?auto_470451 ?auto_470457 ) ) ( not ( = ?auto_470451 ?auto_470458 ) ) ( not ( = ?auto_470451 ?auto_470459 ) ) ( not ( = ?auto_470451 ?auto_470460 ) ) ( not ( = ?auto_470451 ?auto_470461 ) ) ( not ( = ?auto_470451 ?auto_470462 ) ) ( not ( = ?auto_470451 ?auto_470463 ) ) ( not ( = ?auto_470451 ?auto_470464 ) ) ( not ( = ?auto_470452 ?auto_470453 ) ) ( not ( = ?auto_470452 ?auto_470454 ) ) ( not ( = ?auto_470452 ?auto_470455 ) ) ( not ( = ?auto_470452 ?auto_470456 ) ) ( not ( = ?auto_470452 ?auto_470457 ) ) ( not ( = ?auto_470452 ?auto_470458 ) ) ( not ( = ?auto_470452 ?auto_470459 ) ) ( not ( = ?auto_470452 ?auto_470460 ) ) ( not ( = ?auto_470452 ?auto_470461 ) ) ( not ( = ?auto_470452 ?auto_470462 ) ) ( not ( = ?auto_470452 ?auto_470463 ) ) ( not ( = ?auto_470452 ?auto_470464 ) ) ( not ( = ?auto_470453 ?auto_470454 ) ) ( not ( = ?auto_470453 ?auto_470455 ) ) ( not ( = ?auto_470453 ?auto_470456 ) ) ( not ( = ?auto_470453 ?auto_470457 ) ) ( not ( = ?auto_470453 ?auto_470458 ) ) ( not ( = ?auto_470453 ?auto_470459 ) ) ( not ( = ?auto_470453 ?auto_470460 ) ) ( not ( = ?auto_470453 ?auto_470461 ) ) ( not ( = ?auto_470453 ?auto_470462 ) ) ( not ( = ?auto_470453 ?auto_470463 ) ) ( not ( = ?auto_470453 ?auto_470464 ) ) ( not ( = ?auto_470454 ?auto_470455 ) ) ( not ( = ?auto_470454 ?auto_470456 ) ) ( not ( = ?auto_470454 ?auto_470457 ) ) ( not ( = ?auto_470454 ?auto_470458 ) ) ( not ( = ?auto_470454 ?auto_470459 ) ) ( not ( = ?auto_470454 ?auto_470460 ) ) ( not ( = ?auto_470454 ?auto_470461 ) ) ( not ( = ?auto_470454 ?auto_470462 ) ) ( not ( = ?auto_470454 ?auto_470463 ) ) ( not ( = ?auto_470454 ?auto_470464 ) ) ( not ( = ?auto_470455 ?auto_470456 ) ) ( not ( = ?auto_470455 ?auto_470457 ) ) ( not ( = ?auto_470455 ?auto_470458 ) ) ( not ( = ?auto_470455 ?auto_470459 ) ) ( not ( = ?auto_470455 ?auto_470460 ) ) ( not ( = ?auto_470455 ?auto_470461 ) ) ( not ( = ?auto_470455 ?auto_470462 ) ) ( not ( = ?auto_470455 ?auto_470463 ) ) ( not ( = ?auto_470455 ?auto_470464 ) ) ( not ( = ?auto_470456 ?auto_470457 ) ) ( not ( = ?auto_470456 ?auto_470458 ) ) ( not ( = ?auto_470456 ?auto_470459 ) ) ( not ( = ?auto_470456 ?auto_470460 ) ) ( not ( = ?auto_470456 ?auto_470461 ) ) ( not ( = ?auto_470456 ?auto_470462 ) ) ( not ( = ?auto_470456 ?auto_470463 ) ) ( not ( = ?auto_470456 ?auto_470464 ) ) ( not ( = ?auto_470457 ?auto_470458 ) ) ( not ( = ?auto_470457 ?auto_470459 ) ) ( not ( = ?auto_470457 ?auto_470460 ) ) ( not ( = ?auto_470457 ?auto_470461 ) ) ( not ( = ?auto_470457 ?auto_470462 ) ) ( not ( = ?auto_470457 ?auto_470463 ) ) ( not ( = ?auto_470457 ?auto_470464 ) ) ( not ( = ?auto_470458 ?auto_470459 ) ) ( not ( = ?auto_470458 ?auto_470460 ) ) ( not ( = ?auto_470458 ?auto_470461 ) ) ( not ( = ?auto_470458 ?auto_470462 ) ) ( not ( = ?auto_470458 ?auto_470463 ) ) ( not ( = ?auto_470458 ?auto_470464 ) ) ( not ( = ?auto_470459 ?auto_470460 ) ) ( not ( = ?auto_470459 ?auto_470461 ) ) ( not ( = ?auto_470459 ?auto_470462 ) ) ( not ( = ?auto_470459 ?auto_470463 ) ) ( not ( = ?auto_470459 ?auto_470464 ) ) ( not ( = ?auto_470460 ?auto_470461 ) ) ( not ( = ?auto_470460 ?auto_470462 ) ) ( not ( = ?auto_470460 ?auto_470463 ) ) ( not ( = ?auto_470460 ?auto_470464 ) ) ( not ( = ?auto_470461 ?auto_470462 ) ) ( not ( = ?auto_470461 ?auto_470463 ) ) ( not ( = ?auto_470461 ?auto_470464 ) ) ( not ( = ?auto_470462 ?auto_470463 ) ) ( not ( = ?auto_470462 ?auto_470464 ) ) ( not ( = ?auto_470463 ?auto_470464 ) ) ( ON ?auto_470463 ?auto_470464 ) ( ON ?auto_470462 ?auto_470463 ) ( ON ?auto_470461 ?auto_470462 ) ( CLEAR ?auto_470459 ) ( ON ?auto_470460 ?auto_470461 ) ( CLEAR ?auto_470460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_470449 ?auto_470450 ?auto_470451 ?auto_470452 ?auto_470453 ?auto_470454 ?auto_470455 ?auto_470456 ?auto_470457 ?auto_470458 ?auto_470459 ?auto_470460 )
      ( MAKE-16PILE ?auto_470449 ?auto_470450 ?auto_470451 ?auto_470452 ?auto_470453 ?auto_470454 ?auto_470455 ?auto_470456 ?auto_470457 ?auto_470458 ?auto_470459 ?auto_470460 ?auto_470461 ?auto_470462 ?auto_470463 ?auto_470464 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470481 - BLOCK
      ?auto_470482 - BLOCK
      ?auto_470483 - BLOCK
      ?auto_470484 - BLOCK
      ?auto_470485 - BLOCK
      ?auto_470486 - BLOCK
      ?auto_470487 - BLOCK
      ?auto_470488 - BLOCK
      ?auto_470489 - BLOCK
      ?auto_470490 - BLOCK
      ?auto_470491 - BLOCK
      ?auto_470492 - BLOCK
      ?auto_470493 - BLOCK
      ?auto_470494 - BLOCK
      ?auto_470495 - BLOCK
      ?auto_470496 - BLOCK
    )
    :vars
    (
      ?auto_470497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470496 ?auto_470497 ) ( ON-TABLE ?auto_470481 ) ( ON ?auto_470482 ?auto_470481 ) ( ON ?auto_470483 ?auto_470482 ) ( ON ?auto_470484 ?auto_470483 ) ( ON ?auto_470485 ?auto_470484 ) ( ON ?auto_470486 ?auto_470485 ) ( ON ?auto_470487 ?auto_470486 ) ( ON ?auto_470488 ?auto_470487 ) ( ON ?auto_470489 ?auto_470488 ) ( ON ?auto_470490 ?auto_470489 ) ( not ( = ?auto_470481 ?auto_470482 ) ) ( not ( = ?auto_470481 ?auto_470483 ) ) ( not ( = ?auto_470481 ?auto_470484 ) ) ( not ( = ?auto_470481 ?auto_470485 ) ) ( not ( = ?auto_470481 ?auto_470486 ) ) ( not ( = ?auto_470481 ?auto_470487 ) ) ( not ( = ?auto_470481 ?auto_470488 ) ) ( not ( = ?auto_470481 ?auto_470489 ) ) ( not ( = ?auto_470481 ?auto_470490 ) ) ( not ( = ?auto_470481 ?auto_470491 ) ) ( not ( = ?auto_470481 ?auto_470492 ) ) ( not ( = ?auto_470481 ?auto_470493 ) ) ( not ( = ?auto_470481 ?auto_470494 ) ) ( not ( = ?auto_470481 ?auto_470495 ) ) ( not ( = ?auto_470481 ?auto_470496 ) ) ( not ( = ?auto_470481 ?auto_470497 ) ) ( not ( = ?auto_470482 ?auto_470483 ) ) ( not ( = ?auto_470482 ?auto_470484 ) ) ( not ( = ?auto_470482 ?auto_470485 ) ) ( not ( = ?auto_470482 ?auto_470486 ) ) ( not ( = ?auto_470482 ?auto_470487 ) ) ( not ( = ?auto_470482 ?auto_470488 ) ) ( not ( = ?auto_470482 ?auto_470489 ) ) ( not ( = ?auto_470482 ?auto_470490 ) ) ( not ( = ?auto_470482 ?auto_470491 ) ) ( not ( = ?auto_470482 ?auto_470492 ) ) ( not ( = ?auto_470482 ?auto_470493 ) ) ( not ( = ?auto_470482 ?auto_470494 ) ) ( not ( = ?auto_470482 ?auto_470495 ) ) ( not ( = ?auto_470482 ?auto_470496 ) ) ( not ( = ?auto_470482 ?auto_470497 ) ) ( not ( = ?auto_470483 ?auto_470484 ) ) ( not ( = ?auto_470483 ?auto_470485 ) ) ( not ( = ?auto_470483 ?auto_470486 ) ) ( not ( = ?auto_470483 ?auto_470487 ) ) ( not ( = ?auto_470483 ?auto_470488 ) ) ( not ( = ?auto_470483 ?auto_470489 ) ) ( not ( = ?auto_470483 ?auto_470490 ) ) ( not ( = ?auto_470483 ?auto_470491 ) ) ( not ( = ?auto_470483 ?auto_470492 ) ) ( not ( = ?auto_470483 ?auto_470493 ) ) ( not ( = ?auto_470483 ?auto_470494 ) ) ( not ( = ?auto_470483 ?auto_470495 ) ) ( not ( = ?auto_470483 ?auto_470496 ) ) ( not ( = ?auto_470483 ?auto_470497 ) ) ( not ( = ?auto_470484 ?auto_470485 ) ) ( not ( = ?auto_470484 ?auto_470486 ) ) ( not ( = ?auto_470484 ?auto_470487 ) ) ( not ( = ?auto_470484 ?auto_470488 ) ) ( not ( = ?auto_470484 ?auto_470489 ) ) ( not ( = ?auto_470484 ?auto_470490 ) ) ( not ( = ?auto_470484 ?auto_470491 ) ) ( not ( = ?auto_470484 ?auto_470492 ) ) ( not ( = ?auto_470484 ?auto_470493 ) ) ( not ( = ?auto_470484 ?auto_470494 ) ) ( not ( = ?auto_470484 ?auto_470495 ) ) ( not ( = ?auto_470484 ?auto_470496 ) ) ( not ( = ?auto_470484 ?auto_470497 ) ) ( not ( = ?auto_470485 ?auto_470486 ) ) ( not ( = ?auto_470485 ?auto_470487 ) ) ( not ( = ?auto_470485 ?auto_470488 ) ) ( not ( = ?auto_470485 ?auto_470489 ) ) ( not ( = ?auto_470485 ?auto_470490 ) ) ( not ( = ?auto_470485 ?auto_470491 ) ) ( not ( = ?auto_470485 ?auto_470492 ) ) ( not ( = ?auto_470485 ?auto_470493 ) ) ( not ( = ?auto_470485 ?auto_470494 ) ) ( not ( = ?auto_470485 ?auto_470495 ) ) ( not ( = ?auto_470485 ?auto_470496 ) ) ( not ( = ?auto_470485 ?auto_470497 ) ) ( not ( = ?auto_470486 ?auto_470487 ) ) ( not ( = ?auto_470486 ?auto_470488 ) ) ( not ( = ?auto_470486 ?auto_470489 ) ) ( not ( = ?auto_470486 ?auto_470490 ) ) ( not ( = ?auto_470486 ?auto_470491 ) ) ( not ( = ?auto_470486 ?auto_470492 ) ) ( not ( = ?auto_470486 ?auto_470493 ) ) ( not ( = ?auto_470486 ?auto_470494 ) ) ( not ( = ?auto_470486 ?auto_470495 ) ) ( not ( = ?auto_470486 ?auto_470496 ) ) ( not ( = ?auto_470486 ?auto_470497 ) ) ( not ( = ?auto_470487 ?auto_470488 ) ) ( not ( = ?auto_470487 ?auto_470489 ) ) ( not ( = ?auto_470487 ?auto_470490 ) ) ( not ( = ?auto_470487 ?auto_470491 ) ) ( not ( = ?auto_470487 ?auto_470492 ) ) ( not ( = ?auto_470487 ?auto_470493 ) ) ( not ( = ?auto_470487 ?auto_470494 ) ) ( not ( = ?auto_470487 ?auto_470495 ) ) ( not ( = ?auto_470487 ?auto_470496 ) ) ( not ( = ?auto_470487 ?auto_470497 ) ) ( not ( = ?auto_470488 ?auto_470489 ) ) ( not ( = ?auto_470488 ?auto_470490 ) ) ( not ( = ?auto_470488 ?auto_470491 ) ) ( not ( = ?auto_470488 ?auto_470492 ) ) ( not ( = ?auto_470488 ?auto_470493 ) ) ( not ( = ?auto_470488 ?auto_470494 ) ) ( not ( = ?auto_470488 ?auto_470495 ) ) ( not ( = ?auto_470488 ?auto_470496 ) ) ( not ( = ?auto_470488 ?auto_470497 ) ) ( not ( = ?auto_470489 ?auto_470490 ) ) ( not ( = ?auto_470489 ?auto_470491 ) ) ( not ( = ?auto_470489 ?auto_470492 ) ) ( not ( = ?auto_470489 ?auto_470493 ) ) ( not ( = ?auto_470489 ?auto_470494 ) ) ( not ( = ?auto_470489 ?auto_470495 ) ) ( not ( = ?auto_470489 ?auto_470496 ) ) ( not ( = ?auto_470489 ?auto_470497 ) ) ( not ( = ?auto_470490 ?auto_470491 ) ) ( not ( = ?auto_470490 ?auto_470492 ) ) ( not ( = ?auto_470490 ?auto_470493 ) ) ( not ( = ?auto_470490 ?auto_470494 ) ) ( not ( = ?auto_470490 ?auto_470495 ) ) ( not ( = ?auto_470490 ?auto_470496 ) ) ( not ( = ?auto_470490 ?auto_470497 ) ) ( not ( = ?auto_470491 ?auto_470492 ) ) ( not ( = ?auto_470491 ?auto_470493 ) ) ( not ( = ?auto_470491 ?auto_470494 ) ) ( not ( = ?auto_470491 ?auto_470495 ) ) ( not ( = ?auto_470491 ?auto_470496 ) ) ( not ( = ?auto_470491 ?auto_470497 ) ) ( not ( = ?auto_470492 ?auto_470493 ) ) ( not ( = ?auto_470492 ?auto_470494 ) ) ( not ( = ?auto_470492 ?auto_470495 ) ) ( not ( = ?auto_470492 ?auto_470496 ) ) ( not ( = ?auto_470492 ?auto_470497 ) ) ( not ( = ?auto_470493 ?auto_470494 ) ) ( not ( = ?auto_470493 ?auto_470495 ) ) ( not ( = ?auto_470493 ?auto_470496 ) ) ( not ( = ?auto_470493 ?auto_470497 ) ) ( not ( = ?auto_470494 ?auto_470495 ) ) ( not ( = ?auto_470494 ?auto_470496 ) ) ( not ( = ?auto_470494 ?auto_470497 ) ) ( not ( = ?auto_470495 ?auto_470496 ) ) ( not ( = ?auto_470495 ?auto_470497 ) ) ( not ( = ?auto_470496 ?auto_470497 ) ) ( ON ?auto_470495 ?auto_470496 ) ( ON ?auto_470494 ?auto_470495 ) ( ON ?auto_470493 ?auto_470494 ) ( ON ?auto_470492 ?auto_470493 ) ( CLEAR ?auto_470490 ) ( ON ?auto_470491 ?auto_470492 ) ( CLEAR ?auto_470491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_470481 ?auto_470482 ?auto_470483 ?auto_470484 ?auto_470485 ?auto_470486 ?auto_470487 ?auto_470488 ?auto_470489 ?auto_470490 ?auto_470491 )
      ( MAKE-16PILE ?auto_470481 ?auto_470482 ?auto_470483 ?auto_470484 ?auto_470485 ?auto_470486 ?auto_470487 ?auto_470488 ?auto_470489 ?auto_470490 ?auto_470491 ?auto_470492 ?auto_470493 ?auto_470494 ?auto_470495 ?auto_470496 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470514 - BLOCK
      ?auto_470515 - BLOCK
      ?auto_470516 - BLOCK
      ?auto_470517 - BLOCK
      ?auto_470518 - BLOCK
      ?auto_470519 - BLOCK
      ?auto_470520 - BLOCK
      ?auto_470521 - BLOCK
      ?auto_470522 - BLOCK
      ?auto_470523 - BLOCK
      ?auto_470524 - BLOCK
      ?auto_470525 - BLOCK
      ?auto_470526 - BLOCK
      ?auto_470527 - BLOCK
      ?auto_470528 - BLOCK
      ?auto_470529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_470529 ) ( ON-TABLE ?auto_470514 ) ( ON ?auto_470515 ?auto_470514 ) ( ON ?auto_470516 ?auto_470515 ) ( ON ?auto_470517 ?auto_470516 ) ( ON ?auto_470518 ?auto_470517 ) ( ON ?auto_470519 ?auto_470518 ) ( ON ?auto_470520 ?auto_470519 ) ( ON ?auto_470521 ?auto_470520 ) ( ON ?auto_470522 ?auto_470521 ) ( ON ?auto_470523 ?auto_470522 ) ( not ( = ?auto_470514 ?auto_470515 ) ) ( not ( = ?auto_470514 ?auto_470516 ) ) ( not ( = ?auto_470514 ?auto_470517 ) ) ( not ( = ?auto_470514 ?auto_470518 ) ) ( not ( = ?auto_470514 ?auto_470519 ) ) ( not ( = ?auto_470514 ?auto_470520 ) ) ( not ( = ?auto_470514 ?auto_470521 ) ) ( not ( = ?auto_470514 ?auto_470522 ) ) ( not ( = ?auto_470514 ?auto_470523 ) ) ( not ( = ?auto_470514 ?auto_470524 ) ) ( not ( = ?auto_470514 ?auto_470525 ) ) ( not ( = ?auto_470514 ?auto_470526 ) ) ( not ( = ?auto_470514 ?auto_470527 ) ) ( not ( = ?auto_470514 ?auto_470528 ) ) ( not ( = ?auto_470514 ?auto_470529 ) ) ( not ( = ?auto_470515 ?auto_470516 ) ) ( not ( = ?auto_470515 ?auto_470517 ) ) ( not ( = ?auto_470515 ?auto_470518 ) ) ( not ( = ?auto_470515 ?auto_470519 ) ) ( not ( = ?auto_470515 ?auto_470520 ) ) ( not ( = ?auto_470515 ?auto_470521 ) ) ( not ( = ?auto_470515 ?auto_470522 ) ) ( not ( = ?auto_470515 ?auto_470523 ) ) ( not ( = ?auto_470515 ?auto_470524 ) ) ( not ( = ?auto_470515 ?auto_470525 ) ) ( not ( = ?auto_470515 ?auto_470526 ) ) ( not ( = ?auto_470515 ?auto_470527 ) ) ( not ( = ?auto_470515 ?auto_470528 ) ) ( not ( = ?auto_470515 ?auto_470529 ) ) ( not ( = ?auto_470516 ?auto_470517 ) ) ( not ( = ?auto_470516 ?auto_470518 ) ) ( not ( = ?auto_470516 ?auto_470519 ) ) ( not ( = ?auto_470516 ?auto_470520 ) ) ( not ( = ?auto_470516 ?auto_470521 ) ) ( not ( = ?auto_470516 ?auto_470522 ) ) ( not ( = ?auto_470516 ?auto_470523 ) ) ( not ( = ?auto_470516 ?auto_470524 ) ) ( not ( = ?auto_470516 ?auto_470525 ) ) ( not ( = ?auto_470516 ?auto_470526 ) ) ( not ( = ?auto_470516 ?auto_470527 ) ) ( not ( = ?auto_470516 ?auto_470528 ) ) ( not ( = ?auto_470516 ?auto_470529 ) ) ( not ( = ?auto_470517 ?auto_470518 ) ) ( not ( = ?auto_470517 ?auto_470519 ) ) ( not ( = ?auto_470517 ?auto_470520 ) ) ( not ( = ?auto_470517 ?auto_470521 ) ) ( not ( = ?auto_470517 ?auto_470522 ) ) ( not ( = ?auto_470517 ?auto_470523 ) ) ( not ( = ?auto_470517 ?auto_470524 ) ) ( not ( = ?auto_470517 ?auto_470525 ) ) ( not ( = ?auto_470517 ?auto_470526 ) ) ( not ( = ?auto_470517 ?auto_470527 ) ) ( not ( = ?auto_470517 ?auto_470528 ) ) ( not ( = ?auto_470517 ?auto_470529 ) ) ( not ( = ?auto_470518 ?auto_470519 ) ) ( not ( = ?auto_470518 ?auto_470520 ) ) ( not ( = ?auto_470518 ?auto_470521 ) ) ( not ( = ?auto_470518 ?auto_470522 ) ) ( not ( = ?auto_470518 ?auto_470523 ) ) ( not ( = ?auto_470518 ?auto_470524 ) ) ( not ( = ?auto_470518 ?auto_470525 ) ) ( not ( = ?auto_470518 ?auto_470526 ) ) ( not ( = ?auto_470518 ?auto_470527 ) ) ( not ( = ?auto_470518 ?auto_470528 ) ) ( not ( = ?auto_470518 ?auto_470529 ) ) ( not ( = ?auto_470519 ?auto_470520 ) ) ( not ( = ?auto_470519 ?auto_470521 ) ) ( not ( = ?auto_470519 ?auto_470522 ) ) ( not ( = ?auto_470519 ?auto_470523 ) ) ( not ( = ?auto_470519 ?auto_470524 ) ) ( not ( = ?auto_470519 ?auto_470525 ) ) ( not ( = ?auto_470519 ?auto_470526 ) ) ( not ( = ?auto_470519 ?auto_470527 ) ) ( not ( = ?auto_470519 ?auto_470528 ) ) ( not ( = ?auto_470519 ?auto_470529 ) ) ( not ( = ?auto_470520 ?auto_470521 ) ) ( not ( = ?auto_470520 ?auto_470522 ) ) ( not ( = ?auto_470520 ?auto_470523 ) ) ( not ( = ?auto_470520 ?auto_470524 ) ) ( not ( = ?auto_470520 ?auto_470525 ) ) ( not ( = ?auto_470520 ?auto_470526 ) ) ( not ( = ?auto_470520 ?auto_470527 ) ) ( not ( = ?auto_470520 ?auto_470528 ) ) ( not ( = ?auto_470520 ?auto_470529 ) ) ( not ( = ?auto_470521 ?auto_470522 ) ) ( not ( = ?auto_470521 ?auto_470523 ) ) ( not ( = ?auto_470521 ?auto_470524 ) ) ( not ( = ?auto_470521 ?auto_470525 ) ) ( not ( = ?auto_470521 ?auto_470526 ) ) ( not ( = ?auto_470521 ?auto_470527 ) ) ( not ( = ?auto_470521 ?auto_470528 ) ) ( not ( = ?auto_470521 ?auto_470529 ) ) ( not ( = ?auto_470522 ?auto_470523 ) ) ( not ( = ?auto_470522 ?auto_470524 ) ) ( not ( = ?auto_470522 ?auto_470525 ) ) ( not ( = ?auto_470522 ?auto_470526 ) ) ( not ( = ?auto_470522 ?auto_470527 ) ) ( not ( = ?auto_470522 ?auto_470528 ) ) ( not ( = ?auto_470522 ?auto_470529 ) ) ( not ( = ?auto_470523 ?auto_470524 ) ) ( not ( = ?auto_470523 ?auto_470525 ) ) ( not ( = ?auto_470523 ?auto_470526 ) ) ( not ( = ?auto_470523 ?auto_470527 ) ) ( not ( = ?auto_470523 ?auto_470528 ) ) ( not ( = ?auto_470523 ?auto_470529 ) ) ( not ( = ?auto_470524 ?auto_470525 ) ) ( not ( = ?auto_470524 ?auto_470526 ) ) ( not ( = ?auto_470524 ?auto_470527 ) ) ( not ( = ?auto_470524 ?auto_470528 ) ) ( not ( = ?auto_470524 ?auto_470529 ) ) ( not ( = ?auto_470525 ?auto_470526 ) ) ( not ( = ?auto_470525 ?auto_470527 ) ) ( not ( = ?auto_470525 ?auto_470528 ) ) ( not ( = ?auto_470525 ?auto_470529 ) ) ( not ( = ?auto_470526 ?auto_470527 ) ) ( not ( = ?auto_470526 ?auto_470528 ) ) ( not ( = ?auto_470526 ?auto_470529 ) ) ( not ( = ?auto_470527 ?auto_470528 ) ) ( not ( = ?auto_470527 ?auto_470529 ) ) ( not ( = ?auto_470528 ?auto_470529 ) ) ( ON ?auto_470528 ?auto_470529 ) ( ON ?auto_470527 ?auto_470528 ) ( ON ?auto_470526 ?auto_470527 ) ( ON ?auto_470525 ?auto_470526 ) ( CLEAR ?auto_470523 ) ( ON ?auto_470524 ?auto_470525 ) ( CLEAR ?auto_470524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_470514 ?auto_470515 ?auto_470516 ?auto_470517 ?auto_470518 ?auto_470519 ?auto_470520 ?auto_470521 ?auto_470522 ?auto_470523 ?auto_470524 )
      ( MAKE-16PILE ?auto_470514 ?auto_470515 ?auto_470516 ?auto_470517 ?auto_470518 ?auto_470519 ?auto_470520 ?auto_470521 ?auto_470522 ?auto_470523 ?auto_470524 ?auto_470525 ?auto_470526 ?auto_470527 ?auto_470528 ?auto_470529 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470546 - BLOCK
      ?auto_470547 - BLOCK
      ?auto_470548 - BLOCK
      ?auto_470549 - BLOCK
      ?auto_470550 - BLOCK
      ?auto_470551 - BLOCK
      ?auto_470552 - BLOCK
      ?auto_470553 - BLOCK
      ?auto_470554 - BLOCK
      ?auto_470555 - BLOCK
      ?auto_470556 - BLOCK
      ?auto_470557 - BLOCK
      ?auto_470558 - BLOCK
      ?auto_470559 - BLOCK
      ?auto_470560 - BLOCK
      ?auto_470561 - BLOCK
    )
    :vars
    (
      ?auto_470562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470561 ?auto_470562 ) ( ON-TABLE ?auto_470546 ) ( ON ?auto_470547 ?auto_470546 ) ( ON ?auto_470548 ?auto_470547 ) ( ON ?auto_470549 ?auto_470548 ) ( ON ?auto_470550 ?auto_470549 ) ( ON ?auto_470551 ?auto_470550 ) ( ON ?auto_470552 ?auto_470551 ) ( ON ?auto_470553 ?auto_470552 ) ( ON ?auto_470554 ?auto_470553 ) ( not ( = ?auto_470546 ?auto_470547 ) ) ( not ( = ?auto_470546 ?auto_470548 ) ) ( not ( = ?auto_470546 ?auto_470549 ) ) ( not ( = ?auto_470546 ?auto_470550 ) ) ( not ( = ?auto_470546 ?auto_470551 ) ) ( not ( = ?auto_470546 ?auto_470552 ) ) ( not ( = ?auto_470546 ?auto_470553 ) ) ( not ( = ?auto_470546 ?auto_470554 ) ) ( not ( = ?auto_470546 ?auto_470555 ) ) ( not ( = ?auto_470546 ?auto_470556 ) ) ( not ( = ?auto_470546 ?auto_470557 ) ) ( not ( = ?auto_470546 ?auto_470558 ) ) ( not ( = ?auto_470546 ?auto_470559 ) ) ( not ( = ?auto_470546 ?auto_470560 ) ) ( not ( = ?auto_470546 ?auto_470561 ) ) ( not ( = ?auto_470546 ?auto_470562 ) ) ( not ( = ?auto_470547 ?auto_470548 ) ) ( not ( = ?auto_470547 ?auto_470549 ) ) ( not ( = ?auto_470547 ?auto_470550 ) ) ( not ( = ?auto_470547 ?auto_470551 ) ) ( not ( = ?auto_470547 ?auto_470552 ) ) ( not ( = ?auto_470547 ?auto_470553 ) ) ( not ( = ?auto_470547 ?auto_470554 ) ) ( not ( = ?auto_470547 ?auto_470555 ) ) ( not ( = ?auto_470547 ?auto_470556 ) ) ( not ( = ?auto_470547 ?auto_470557 ) ) ( not ( = ?auto_470547 ?auto_470558 ) ) ( not ( = ?auto_470547 ?auto_470559 ) ) ( not ( = ?auto_470547 ?auto_470560 ) ) ( not ( = ?auto_470547 ?auto_470561 ) ) ( not ( = ?auto_470547 ?auto_470562 ) ) ( not ( = ?auto_470548 ?auto_470549 ) ) ( not ( = ?auto_470548 ?auto_470550 ) ) ( not ( = ?auto_470548 ?auto_470551 ) ) ( not ( = ?auto_470548 ?auto_470552 ) ) ( not ( = ?auto_470548 ?auto_470553 ) ) ( not ( = ?auto_470548 ?auto_470554 ) ) ( not ( = ?auto_470548 ?auto_470555 ) ) ( not ( = ?auto_470548 ?auto_470556 ) ) ( not ( = ?auto_470548 ?auto_470557 ) ) ( not ( = ?auto_470548 ?auto_470558 ) ) ( not ( = ?auto_470548 ?auto_470559 ) ) ( not ( = ?auto_470548 ?auto_470560 ) ) ( not ( = ?auto_470548 ?auto_470561 ) ) ( not ( = ?auto_470548 ?auto_470562 ) ) ( not ( = ?auto_470549 ?auto_470550 ) ) ( not ( = ?auto_470549 ?auto_470551 ) ) ( not ( = ?auto_470549 ?auto_470552 ) ) ( not ( = ?auto_470549 ?auto_470553 ) ) ( not ( = ?auto_470549 ?auto_470554 ) ) ( not ( = ?auto_470549 ?auto_470555 ) ) ( not ( = ?auto_470549 ?auto_470556 ) ) ( not ( = ?auto_470549 ?auto_470557 ) ) ( not ( = ?auto_470549 ?auto_470558 ) ) ( not ( = ?auto_470549 ?auto_470559 ) ) ( not ( = ?auto_470549 ?auto_470560 ) ) ( not ( = ?auto_470549 ?auto_470561 ) ) ( not ( = ?auto_470549 ?auto_470562 ) ) ( not ( = ?auto_470550 ?auto_470551 ) ) ( not ( = ?auto_470550 ?auto_470552 ) ) ( not ( = ?auto_470550 ?auto_470553 ) ) ( not ( = ?auto_470550 ?auto_470554 ) ) ( not ( = ?auto_470550 ?auto_470555 ) ) ( not ( = ?auto_470550 ?auto_470556 ) ) ( not ( = ?auto_470550 ?auto_470557 ) ) ( not ( = ?auto_470550 ?auto_470558 ) ) ( not ( = ?auto_470550 ?auto_470559 ) ) ( not ( = ?auto_470550 ?auto_470560 ) ) ( not ( = ?auto_470550 ?auto_470561 ) ) ( not ( = ?auto_470550 ?auto_470562 ) ) ( not ( = ?auto_470551 ?auto_470552 ) ) ( not ( = ?auto_470551 ?auto_470553 ) ) ( not ( = ?auto_470551 ?auto_470554 ) ) ( not ( = ?auto_470551 ?auto_470555 ) ) ( not ( = ?auto_470551 ?auto_470556 ) ) ( not ( = ?auto_470551 ?auto_470557 ) ) ( not ( = ?auto_470551 ?auto_470558 ) ) ( not ( = ?auto_470551 ?auto_470559 ) ) ( not ( = ?auto_470551 ?auto_470560 ) ) ( not ( = ?auto_470551 ?auto_470561 ) ) ( not ( = ?auto_470551 ?auto_470562 ) ) ( not ( = ?auto_470552 ?auto_470553 ) ) ( not ( = ?auto_470552 ?auto_470554 ) ) ( not ( = ?auto_470552 ?auto_470555 ) ) ( not ( = ?auto_470552 ?auto_470556 ) ) ( not ( = ?auto_470552 ?auto_470557 ) ) ( not ( = ?auto_470552 ?auto_470558 ) ) ( not ( = ?auto_470552 ?auto_470559 ) ) ( not ( = ?auto_470552 ?auto_470560 ) ) ( not ( = ?auto_470552 ?auto_470561 ) ) ( not ( = ?auto_470552 ?auto_470562 ) ) ( not ( = ?auto_470553 ?auto_470554 ) ) ( not ( = ?auto_470553 ?auto_470555 ) ) ( not ( = ?auto_470553 ?auto_470556 ) ) ( not ( = ?auto_470553 ?auto_470557 ) ) ( not ( = ?auto_470553 ?auto_470558 ) ) ( not ( = ?auto_470553 ?auto_470559 ) ) ( not ( = ?auto_470553 ?auto_470560 ) ) ( not ( = ?auto_470553 ?auto_470561 ) ) ( not ( = ?auto_470553 ?auto_470562 ) ) ( not ( = ?auto_470554 ?auto_470555 ) ) ( not ( = ?auto_470554 ?auto_470556 ) ) ( not ( = ?auto_470554 ?auto_470557 ) ) ( not ( = ?auto_470554 ?auto_470558 ) ) ( not ( = ?auto_470554 ?auto_470559 ) ) ( not ( = ?auto_470554 ?auto_470560 ) ) ( not ( = ?auto_470554 ?auto_470561 ) ) ( not ( = ?auto_470554 ?auto_470562 ) ) ( not ( = ?auto_470555 ?auto_470556 ) ) ( not ( = ?auto_470555 ?auto_470557 ) ) ( not ( = ?auto_470555 ?auto_470558 ) ) ( not ( = ?auto_470555 ?auto_470559 ) ) ( not ( = ?auto_470555 ?auto_470560 ) ) ( not ( = ?auto_470555 ?auto_470561 ) ) ( not ( = ?auto_470555 ?auto_470562 ) ) ( not ( = ?auto_470556 ?auto_470557 ) ) ( not ( = ?auto_470556 ?auto_470558 ) ) ( not ( = ?auto_470556 ?auto_470559 ) ) ( not ( = ?auto_470556 ?auto_470560 ) ) ( not ( = ?auto_470556 ?auto_470561 ) ) ( not ( = ?auto_470556 ?auto_470562 ) ) ( not ( = ?auto_470557 ?auto_470558 ) ) ( not ( = ?auto_470557 ?auto_470559 ) ) ( not ( = ?auto_470557 ?auto_470560 ) ) ( not ( = ?auto_470557 ?auto_470561 ) ) ( not ( = ?auto_470557 ?auto_470562 ) ) ( not ( = ?auto_470558 ?auto_470559 ) ) ( not ( = ?auto_470558 ?auto_470560 ) ) ( not ( = ?auto_470558 ?auto_470561 ) ) ( not ( = ?auto_470558 ?auto_470562 ) ) ( not ( = ?auto_470559 ?auto_470560 ) ) ( not ( = ?auto_470559 ?auto_470561 ) ) ( not ( = ?auto_470559 ?auto_470562 ) ) ( not ( = ?auto_470560 ?auto_470561 ) ) ( not ( = ?auto_470560 ?auto_470562 ) ) ( not ( = ?auto_470561 ?auto_470562 ) ) ( ON ?auto_470560 ?auto_470561 ) ( ON ?auto_470559 ?auto_470560 ) ( ON ?auto_470558 ?auto_470559 ) ( ON ?auto_470557 ?auto_470558 ) ( ON ?auto_470556 ?auto_470557 ) ( CLEAR ?auto_470554 ) ( ON ?auto_470555 ?auto_470556 ) ( CLEAR ?auto_470555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_470546 ?auto_470547 ?auto_470548 ?auto_470549 ?auto_470550 ?auto_470551 ?auto_470552 ?auto_470553 ?auto_470554 ?auto_470555 )
      ( MAKE-16PILE ?auto_470546 ?auto_470547 ?auto_470548 ?auto_470549 ?auto_470550 ?auto_470551 ?auto_470552 ?auto_470553 ?auto_470554 ?auto_470555 ?auto_470556 ?auto_470557 ?auto_470558 ?auto_470559 ?auto_470560 ?auto_470561 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470579 - BLOCK
      ?auto_470580 - BLOCK
      ?auto_470581 - BLOCK
      ?auto_470582 - BLOCK
      ?auto_470583 - BLOCK
      ?auto_470584 - BLOCK
      ?auto_470585 - BLOCK
      ?auto_470586 - BLOCK
      ?auto_470587 - BLOCK
      ?auto_470588 - BLOCK
      ?auto_470589 - BLOCK
      ?auto_470590 - BLOCK
      ?auto_470591 - BLOCK
      ?auto_470592 - BLOCK
      ?auto_470593 - BLOCK
      ?auto_470594 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_470594 ) ( ON-TABLE ?auto_470579 ) ( ON ?auto_470580 ?auto_470579 ) ( ON ?auto_470581 ?auto_470580 ) ( ON ?auto_470582 ?auto_470581 ) ( ON ?auto_470583 ?auto_470582 ) ( ON ?auto_470584 ?auto_470583 ) ( ON ?auto_470585 ?auto_470584 ) ( ON ?auto_470586 ?auto_470585 ) ( ON ?auto_470587 ?auto_470586 ) ( not ( = ?auto_470579 ?auto_470580 ) ) ( not ( = ?auto_470579 ?auto_470581 ) ) ( not ( = ?auto_470579 ?auto_470582 ) ) ( not ( = ?auto_470579 ?auto_470583 ) ) ( not ( = ?auto_470579 ?auto_470584 ) ) ( not ( = ?auto_470579 ?auto_470585 ) ) ( not ( = ?auto_470579 ?auto_470586 ) ) ( not ( = ?auto_470579 ?auto_470587 ) ) ( not ( = ?auto_470579 ?auto_470588 ) ) ( not ( = ?auto_470579 ?auto_470589 ) ) ( not ( = ?auto_470579 ?auto_470590 ) ) ( not ( = ?auto_470579 ?auto_470591 ) ) ( not ( = ?auto_470579 ?auto_470592 ) ) ( not ( = ?auto_470579 ?auto_470593 ) ) ( not ( = ?auto_470579 ?auto_470594 ) ) ( not ( = ?auto_470580 ?auto_470581 ) ) ( not ( = ?auto_470580 ?auto_470582 ) ) ( not ( = ?auto_470580 ?auto_470583 ) ) ( not ( = ?auto_470580 ?auto_470584 ) ) ( not ( = ?auto_470580 ?auto_470585 ) ) ( not ( = ?auto_470580 ?auto_470586 ) ) ( not ( = ?auto_470580 ?auto_470587 ) ) ( not ( = ?auto_470580 ?auto_470588 ) ) ( not ( = ?auto_470580 ?auto_470589 ) ) ( not ( = ?auto_470580 ?auto_470590 ) ) ( not ( = ?auto_470580 ?auto_470591 ) ) ( not ( = ?auto_470580 ?auto_470592 ) ) ( not ( = ?auto_470580 ?auto_470593 ) ) ( not ( = ?auto_470580 ?auto_470594 ) ) ( not ( = ?auto_470581 ?auto_470582 ) ) ( not ( = ?auto_470581 ?auto_470583 ) ) ( not ( = ?auto_470581 ?auto_470584 ) ) ( not ( = ?auto_470581 ?auto_470585 ) ) ( not ( = ?auto_470581 ?auto_470586 ) ) ( not ( = ?auto_470581 ?auto_470587 ) ) ( not ( = ?auto_470581 ?auto_470588 ) ) ( not ( = ?auto_470581 ?auto_470589 ) ) ( not ( = ?auto_470581 ?auto_470590 ) ) ( not ( = ?auto_470581 ?auto_470591 ) ) ( not ( = ?auto_470581 ?auto_470592 ) ) ( not ( = ?auto_470581 ?auto_470593 ) ) ( not ( = ?auto_470581 ?auto_470594 ) ) ( not ( = ?auto_470582 ?auto_470583 ) ) ( not ( = ?auto_470582 ?auto_470584 ) ) ( not ( = ?auto_470582 ?auto_470585 ) ) ( not ( = ?auto_470582 ?auto_470586 ) ) ( not ( = ?auto_470582 ?auto_470587 ) ) ( not ( = ?auto_470582 ?auto_470588 ) ) ( not ( = ?auto_470582 ?auto_470589 ) ) ( not ( = ?auto_470582 ?auto_470590 ) ) ( not ( = ?auto_470582 ?auto_470591 ) ) ( not ( = ?auto_470582 ?auto_470592 ) ) ( not ( = ?auto_470582 ?auto_470593 ) ) ( not ( = ?auto_470582 ?auto_470594 ) ) ( not ( = ?auto_470583 ?auto_470584 ) ) ( not ( = ?auto_470583 ?auto_470585 ) ) ( not ( = ?auto_470583 ?auto_470586 ) ) ( not ( = ?auto_470583 ?auto_470587 ) ) ( not ( = ?auto_470583 ?auto_470588 ) ) ( not ( = ?auto_470583 ?auto_470589 ) ) ( not ( = ?auto_470583 ?auto_470590 ) ) ( not ( = ?auto_470583 ?auto_470591 ) ) ( not ( = ?auto_470583 ?auto_470592 ) ) ( not ( = ?auto_470583 ?auto_470593 ) ) ( not ( = ?auto_470583 ?auto_470594 ) ) ( not ( = ?auto_470584 ?auto_470585 ) ) ( not ( = ?auto_470584 ?auto_470586 ) ) ( not ( = ?auto_470584 ?auto_470587 ) ) ( not ( = ?auto_470584 ?auto_470588 ) ) ( not ( = ?auto_470584 ?auto_470589 ) ) ( not ( = ?auto_470584 ?auto_470590 ) ) ( not ( = ?auto_470584 ?auto_470591 ) ) ( not ( = ?auto_470584 ?auto_470592 ) ) ( not ( = ?auto_470584 ?auto_470593 ) ) ( not ( = ?auto_470584 ?auto_470594 ) ) ( not ( = ?auto_470585 ?auto_470586 ) ) ( not ( = ?auto_470585 ?auto_470587 ) ) ( not ( = ?auto_470585 ?auto_470588 ) ) ( not ( = ?auto_470585 ?auto_470589 ) ) ( not ( = ?auto_470585 ?auto_470590 ) ) ( not ( = ?auto_470585 ?auto_470591 ) ) ( not ( = ?auto_470585 ?auto_470592 ) ) ( not ( = ?auto_470585 ?auto_470593 ) ) ( not ( = ?auto_470585 ?auto_470594 ) ) ( not ( = ?auto_470586 ?auto_470587 ) ) ( not ( = ?auto_470586 ?auto_470588 ) ) ( not ( = ?auto_470586 ?auto_470589 ) ) ( not ( = ?auto_470586 ?auto_470590 ) ) ( not ( = ?auto_470586 ?auto_470591 ) ) ( not ( = ?auto_470586 ?auto_470592 ) ) ( not ( = ?auto_470586 ?auto_470593 ) ) ( not ( = ?auto_470586 ?auto_470594 ) ) ( not ( = ?auto_470587 ?auto_470588 ) ) ( not ( = ?auto_470587 ?auto_470589 ) ) ( not ( = ?auto_470587 ?auto_470590 ) ) ( not ( = ?auto_470587 ?auto_470591 ) ) ( not ( = ?auto_470587 ?auto_470592 ) ) ( not ( = ?auto_470587 ?auto_470593 ) ) ( not ( = ?auto_470587 ?auto_470594 ) ) ( not ( = ?auto_470588 ?auto_470589 ) ) ( not ( = ?auto_470588 ?auto_470590 ) ) ( not ( = ?auto_470588 ?auto_470591 ) ) ( not ( = ?auto_470588 ?auto_470592 ) ) ( not ( = ?auto_470588 ?auto_470593 ) ) ( not ( = ?auto_470588 ?auto_470594 ) ) ( not ( = ?auto_470589 ?auto_470590 ) ) ( not ( = ?auto_470589 ?auto_470591 ) ) ( not ( = ?auto_470589 ?auto_470592 ) ) ( not ( = ?auto_470589 ?auto_470593 ) ) ( not ( = ?auto_470589 ?auto_470594 ) ) ( not ( = ?auto_470590 ?auto_470591 ) ) ( not ( = ?auto_470590 ?auto_470592 ) ) ( not ( = ?auto_470590 ?auto_470593 ) ) ( not ( = ?auto_470590 ?auto_470594 ) ) ( not ( = ?auto_470591 ?auto_470592 ) ) ( not ( = ?auto_470591 ?auto_470593 ) ) ( not ( = ?auto_470591 ?auto_470594 ) ) ( not ( = ?auto_470592 ?auto_470593 ) ) ( not ( = ?auto_470592 ?auto_470594 ) ) ( not ( = ?auto_470593 ?auto_470594 ) ) ( ON ?auto_470593 ?auto_470594 ) ( ON ?auto_470592 ?auto_470593 ) ( ON ?auto_470591 ?auto_470592 ) ( ON ?auto_470590 ?auto_470591 ) ( ON ?auto_470589 ?auto_470590 ) ( CLEAR ?auto_470587 ) ( ON ?auto_470588 ?auto_470589 ) ( CLEAR ?auto_470588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_470579 ?auto_470580 ?auto_470581 ?auto_470582 ?auto_470583 ?auto_470584 ?auto_470585 ?auto_470586 ?auto_470587 ?auto_470588 )
      ( MAKE-16PILE ?auto_470579 ?auto_470580 ?auto_470581 ?auto_470582 ?auto_470583 ?auto_470584 ?auto_470585 ?auto_470586 ?auto_470587 ?auto_470588 ?auto_470589 ?auto_470590 ?auto_470591 ?auto_470592 ?auto_470593 ?auto_470594 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470611 - BLOCK
      ?auto_470612 - BLOCK
      ?auto_470613 - BLOCK
      ?auto_470614 - BLOCK
      ?auto_470615 - BLOCK
      ?auto_470616 - BLOCK
      ?auto_470617 - BLOCK
      ?auto_470618 - BLOCK
      ?auto_470619 - BLOCK
      ?auto_470620 - BLOCK
      ?auto_470621 - BLOCK
      ?auto_470622 - BLOCK
      ?auto_470623 - BLOCK
      ?auto_470624 - BLOCK
      ?auto_470625 - BLOCK
      ?auto_470626 - BLOCK
    )
    :vars
    (
      ?auto_470627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470626 ?auto_470627 ) ( ON-TABLE ?auto_470611 ) ( ON ?auto_470612 ?auto_470611 ) ( ON ?auto_470613 ?auto_470612 ) ( ON ?auto_470614 ?auto_470613 ) ( ON ?auto_470615 ?auto_470614 ) ( ON ?auto_470616 ?auto_470615 ) ( ON ?auto_470617 ?auto_470616 ) ( ON ?auto_470618 ?auto_470617 ) ( not ( = ?auto_470611 ?auto_470612 ) ) ( not ( = ?auto_470611 ?auto_470613 ) ) ( not ( = ?auto_470611 ?auto_470614 ) ) ( not ( = ?auto_470611 ?auto_470615 ) ) ( not ( = ?auto_470611 ?auto_470616 ) ) ( not ( = ?auto_470611 ?auto_470617 ) ) ( not ( = ?auto_470611 ?auto_470618 ) ) ( not ( = ?auto_470611 ?auto_470619 ) ) ( not ( = ?auto_470611 ?auto_470620 ) ) ( not ( = ?auto_470611 ?auto_470621 ) ) ( not ( = ?auto_470611 ?auto_470622 ) ) ( not ( = ?auto_470611 ?auto_470623 ) ) ( not ( = ?auto_470611 ?auto_470624 ) ) ( not ( = ?auto_470611 ?auto_470625 ) ) ( not ( = ?auto_470611 ?auto_470626 ) ) ( not ( = ?auto_470611 ?auto_470627 ) ) ( not ( = ?auto_470612 ?auto_470613 ) ) ( not ( = ?auto_470612 ?auto_470614 ) ) ( not ( = ?auto_470612 ?auto_470615 ) ) ( not ( = ?auto_470612 ?auto_470616 ) ) ( not ( = ?auto_470612 ?auto_470617 ) ) ( not ( = ?auto_470612 ?auto_470618 ) ) ( not ( = ?auto_470612 ?auto_470619 ) ) ( not ( = ?auto_470612 ?auto_470620 ) ) ( not ( = ?auto_470612 ?auto_470621 ) ) ( not ( = ?auto_470612 ?auto_470622 ) ) ( not ( = ?auto_470612 ?auto_470623 ) ) ( not ( = ?auto_470612 ?auto_470624 ) ) ( not ( = ?auto_470612 ?auto_470625 ) ) ( not ( = ?auto_470612 ?auto_470626 ) ) ( not ( = ?auto_470612 ?auto_470627 ) ) ( not ( = ?auto_470613 ?auto_470614 ) ) ( not ( = ?auto_470613 ?auto_470615 ) ) ( not ( = ?auto_470613 ?auto_470616 ) ) ( not ( = ?auto_470613 ?auto_470617 ) ) ( not ( = ?auto_470613 ?auto_470618 ) ) ( not ( = ?auto_470613 ?auto_470619 ) ) ( not ( = ?auto_470613 ?auto_470620 ) ) ( not ( = ?auto_470613 ?auto_470621 ) ) ( not ( = ?auto_470613 ?auto_470622 ) ) ( not ( = ?auto_470613 ?auto_470623 ) ) ( not ( = ?auto_470613 ?auto_470624 ) ) ( not ( = ?auto_470613 ?auto_470625 ) ) ( not ( = ?auto_470613 ?auto_470626 ) ) ( not ( = ?auto_470613 ?auto_470627 ) ) ( not ( = ?auto_470614 ?auto_470615 ) ) ( not ( = ?auto_470614 ?auto_470616 ) ) ( not ( = ?auto_470614 ?auto_470617 ) ) ( not ( = ?auto_470614 ?auto_470618 ) ) ( not ( = ?auto_470614 ?auto_470619 ) ) ( not ( = ?auto_470614 ?auto_470620 ) ) ( not ( = ?auto_470614 ?auto_470621 ) ) ( not ( = ?auto_470614 ?auto_470622 ) ) ( not ( = ?auto_470614 ?auto_470623 ) ) ( not ( = ?auto_470614 ?auto_470624 ) ) ( not ( = ?auto_470614 ?auto_470625 ) ) ( not ( = ?auto_470614 ?auto_470626 ) ) ( not ( = ?auto_470614 ?auto_470627 ) ) ( not ( = ?auto_470615 ?auto_470616 ) ) ( not ( = ?auto_470615 ?auto_470617 ) ) ( not ( = ?auto_470615 ?auto_470618 ) ) ( not ( = ?auto_470615 ?auto_470619 ) ) ( not ( = ?auto_470615 ?auto_470620 ) ) ( not ( = ?auto_470615 ?auto_470621 ) ) ( not ( = ?auto_470615 ?auto_470622 ) ) ( not ( = ?auto_470615 ?auto_470623 ) ) ( not ( = ?auto_470615 ?auto_470624 ) ) ( not ( = ?auto_470615 ?auto_470625 ) ) ( not ( = ?auto_470615 ?auto_470626 ) ) ( not ( = ?auto_470615 ?auto_470627 ) ) ( not ( = ?auto_470616 ?auto_470617 ) ) ( not ( = ?auto_470616 ?auto_470618 ) ) ( not ( = ?auto_470616 ?auto_470619 ) ) ( not ( = ?auto_470616 ?auto_470620 ) ) ( not ( = ?auto_470616 ?auto_470621 ) ) ( not ( = ?auto_470616 ?auto_470622 ) ) ( not ( = ?auto_470616 ?auto_470623 ) ) ( not ( = ?auto_470616 ?auto_470624 ) ) ( not ( = ?auto_470616 ?auto_470625 ) ) ( not ( = ?auto_470616 ?auto_470626 ) ) ( not ( = ?auto_470616 ?auto_470627 ) ) ( not ( = ?auto_470617 ?auto_470618 ) ) ( not ( = ?auto_470617 ?auto_470619 ) ) ( not ( = ?auto_470617 ?auto_470620 ) ) ( not ( = ?auto_470617 ?auto_470621 ) ) ( not ( = ?auto_470617 ?auto_470622 ) ) ( not ( = ?auto_470617 ?auto_470623 ) ) ( not ( = ?auto_470617 ?auto_470624 ) ) ( not ( = ?auto_470617 ?auto_470625 ) ) ( not ( = ?auto_470617 ?auto_470626 ) ) ( not ( = ?auto_470617 ?auto_470627 ) ) ( not ( = ?auto_470618 ?auto_470619 ) ) ( not ( = ?auto_470618 ?auto_470620 ) ) ( not ( = ?auto_470618 ?auto_470621 ) ) ( not ( = ?auto_470618 ?auto_470622 ) ) ( not ( = ?auto_470618 ?auto_470623 ) ) ( not ( = ?auto_470618 ?auto_470624 ) ) ( not ( = ?auto_470618 ?auto_470625 ) ) ( not ( = ?auto_470618 ?auto_470626 ) ) ( not ( = ?auto_470618 ?auto_470627 ) ) ( not ( = ?auto_470619 ?auto_470620 ) ) ( not ( = ?auto_470619 ?auto_470621 ) ) ( not ( = ?auto_470619 ?auto_470622 ) ) ( not ( = ?auto_470619 ?auto_470623 ) ) ( not ( = ?auto_470619 ?auto_470624 ) ) ( not ( = ?auto_470619 ?auto_470625 ) ) ( not ( = ?auto_470619 ?auto_470626 ) ) ( not ( = ?auto_470619 ?auto_470627 ) ) ( not ( = ?auto_470620 ?auto_470621 ) ) ( not ( = ?auto_470620 ?auto_470622 ) ) ( not ( = ?auto_470620 ?auto_470623 ) ) ( not ( = ?auto_470620 ?auto_470624 ) ) ( not ( = ?auto_470620 ?auto_470625 ) ) ( not ( = ?auto_470620 ?auto_470626 ) ) ( not ( = ?auto_470620 ?auto_470627 ) ) ( not ( = ?auto_470621 ?auto_470622 ) ) ( not ( = ?auto_470621 ?auto_470623 ) ) ( not ( = ?auto_470621 ?auto_470624 ) ) ( not ( = ?auto_470621 ?auto_470625 ) ) ( not ( = ?auto_470621 ?auto_470626 ) ) ( not ( = ?auto_470621 ?auto_470627 ) ) ( not ( = ?auto_470622 ?auto_470623 ) ) ( not ( = ?auto_470622 ?auto_470624 ) ) ( not ( = ?auto_470622 ?auto_470625 ) ) ( not ( = ?auto_470622 ?auto_470626 ) ) ( not ( = ?auto_470622 ?auto_470627 ) ) ( not ( = ?auto_470623 ?auto_470624 ) ) ( not ( = ?auto_470623 ?auto_470625 ) ) ( not ( = ?auto_470623 ?auto_470626 ) ) ( not ( = ?auto_470623 ?auto_470627 ) ) ( not ( = ?auto_470624 ?auto_470625 ) ) ( not ( = ?auto_470624 ?auto_470626 ) ) ( not ( = ?auto_470624 ?auto_470627 ) ) ( not ( = ?auto_470625 ?auto_470626 ) ) ( not ( = ?auto_470625 ?auto_470627 ) ) ( not ( = ?auto_470626 ?auto_470627 ) ) ( ON ?auto_470625 ?auto_470626 ) ( ON ?auto_470624 ?auto_470625 ) ( ON ?auto_470623 ?auto_470624 ) ( ON ?auto_470622 ?auto_470623 ) ( ON ?auto_470621 ?auto_470622 ) ( ON ?auto_470620 ?auto_470621 ) ( CLEAR ?auto_470618 ) ( ON ?auto_470619 ?auto_470620 ) ( CLEAR ?auto_470619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_470611 ?auto_470612 ?auto_470613 ?auto_470614 ?auto_470615 ?auto_470616 ?auto_470617 ?auto_470618 ?auto_470619 )
      ( MAKE-16PILE ?auto_470611 ?auto_470612 ?auto_470613 ?auto_470614 ?auto_470615 ?auto_470616 ?auto_470617 ?auto_470618 ?auto_470619 ?auto_470620 ?auto_470621 ?auto_470622 ?auto_470623 ?auto_470624 ?auto_470625 ?auto_470626 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470644 - BLOCK
      ?auto_470645 - BLOCK
      ?auto_470646 - BLOCK
      ?auto_470647 - BLOCK
      ?auto_470648 - BLOCK
      ?auto_470649 - BLOCK
      ?auto_470650 - BLOCK
      ?auto_470651 - BLOCK
      ?auto_470652 - BLOCK
      ?auto_470653 - BLOCK
      ?auto_470654 - BLOCK
      ?auto_470655 - BLOCK
      ?auto_470656 - BLOCK
      ?auto_470657 - BLOCK
      ?auto_470658 - BLOCK
      ?auto_470659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_470659 ) ( ON-TABLE ?auto_470644 ) ( ON ?auto_470645 ?auto_470644 ) ( ON ?auto_470646 ?auto_470645 ) ( ON ?auto_470647 ?auto_470646 ) ( ON ?auto_470648 ?auto_470647 ) ( ON ?auto_470649 ?auto_470648 ) ( ON ?auto_470650 ?auto_470649 ) ( ON ?auto_470651 ?auto_470650 ) ( not ( = ?auto_470644 ?auto_470645 ) ) ( not ( = ?auto_470644 ?auto_470646 ) ) ( not ( = ?auto_470644 ?auto_470647 ) ) ( not ( = ?auto_470644 ?auto_470648 ) ) ( not ( = ?auto_470644 ?auto_470649 ) ) ( not ( = ?auto_470644 ?auto_470650 ) ) ( not ( = ?auto_470644 ?auto_470651 ) ) ( not ( = ?auto_470644 ?auto_470652 ) ) ( not ( = ?auto_470644 ?auto_470653 ) ) ( not ( = ?auto_470644 ?auto_470654 ) ) ( not ( = ?auto_470644 ?auto_470655 ) ) ( not ( = ?auto_470644 ?auto_470656 ) ) ( not ( = ?auto_470644 ?auto_470657 ) ) ( not ( = ?auto_470644 ?auto_470658 ) ) ( not ( = ?auto_470644 ?auto_470659 ) ) ( not ( = ?auto_470645 ?auto_470646 ) ) ( not ( = ?auto_470645 ?auto_470647 ) ) ( not ( = ?auto_470645 ?auto_470648 ) ) ( not ( = ?auto_470645 ?auto_470649 ) ) ( not ( = ?auto_470645 ?auto_470650 ) ) ( not ( = ?auto_470645 ?auto_470651 ) ) ( not ( = ?auto_470645 ?auto_470652 ) ) ( not ( = ?auto_470645 ?auto_470653 ) ) ( not ( = ?auto_470645 ?auto_470654 ) ) ( not ( = ?auto_470645 ?auto_470655 ) ) ( not ( = ?auto_470645 ?auto_470656 ) ) ( not ( = ?auto_470645 ?auto_470657 ) ) ( not ( = ?auto_470645 ?auto_470658 ) ) ( not ( = ?auto_470645 ?auto_470659 ) ) ( not ( = ?auto_470646 ?auto_470647 ) ) ( not ( = ?auto_470646 ?auto_470648 ) ) ( not ( = ?auto_470646 ?auto_470649 ) ) ( not ( = ?auto_470646 ?auto_470650 ) ) ( not ( = ?auto_470646 ?auto_470651 ) ) ( not ( = ?auto_470646 ?auto_470652 ) ) ( not ( = ?auto_470646 ?auto_470653 ) ) ( not ( = ?auto_470646 ?auto_470654 ) ) ( not ( = ?auto_470646 ?auto_470655 ) ) ( not ( = ?auto_470646 ?auto_470656 ) ) ( not ( = ?auto_470646 ?auto_470657 ) ) ( not ( = ?auto_470646 ?auto_470658 ) ) ( not ( = ?auto_470646 ?auto_470659 ) ) ( not ( = ?auto_470647 ?auto_470648 ) ) ( not ( = ?auto_470647 ?auto_470649 ) ) ( not ( = ?auto_470647 ?auto_470650 ) ) ( not ( = ?auto_470647 ?auto_470651 ) ) ( not ( = ?auto_470647 ?auto_470652 ) ) ( not ( = ?auto_470647 ?auto_470653 ) ) ( not ( = ?auto_470647 ?auto_470654 ) ) ( not ( = ?auto_470647 ?auto_470655 ) ) ( not ( = ?auto_470647 ?auto_470656 ) ) ( not ( = ?auto_470647 ?auto_470657 ) ) ( not ( = ?auto_470647 ?auto_470658 ) ) ( not ( = ?auto_470647 ?auto_470659 ) ) ( not ( = ?auto_470648 ?auto_470649 ) ) ( not ( = ?auto_470648 ?auto_470650 ) ) ( not ( = ?auto_470648 ?auto_470651 ) ) ( not ( = ?auto_470648 ?auto_470652 ) ) ( not ( = ?auto_470648 ?auto_470653 ) ) ( not ( = ?auto_470648 ?auto_470654 ) ) ( not ( = ?auto_470648 ?auto_470655 ) ) ( not ( = ?auto_470648 ?auto_470656 ) ) ( not ( = ?auto_470648 ?auto_470657 ) ) ( not ( = ?auto_470648 ?auto_470658 ) ) ( not ( = ?auto_470648 ?auto_470659 ) ) ( not ( = ?auto_470649 ?auto_470650 ) ) ( not ( = ?auto_470649 ?auto_470651 ) ) ( not ( = ?auto_470649 ?auto_470652 ) ) ( not ( = ?auto_470649 ?auto_470653 ) ) ( not ( = ?auto_470649 ?auto_470654 ) ) ( not ( = ?auto_470649 ?auto_470655 ) ) ( not ( = ?auto_470649 ?auto_470656 ) ) ( not ( = ?auto_470649 ?auto_470657 ) ) ( not ( = ?auto_470649 ?auto_470658 ) ) ( not ( = ?auto_470649 ?auto_470659 ) ) ( not ( = ?auto_470650 ?auto_470651 ) ) ( not ( = ?auto_470650 ?auto_470652 ) ) ( not ( = ?auto_470650 ?auto_470653 ) ) ( not ( = ?auto_470650 ?auto_470654 ) ) ( not ( = ?auto_470650 ?auto_470655 ) ) ( not ( = ?auto_470650 ?auto_470656 ) ) ( not ( = ?auto_470650 ?auto_470657 ) ) ( not ( = ?auto_470650 ?auto_470658 ) ) ( not ( = ?auto_470650 ?auto_470659 ) ) ( not ( = ?auto_470651 ?auto_470652 ) ) ( not ( = ?auto_470651 ?auto_470653 ) ) ( not ( = ?auto_470651 ?auto_470654 ) ) ( not ( = ?auto_470651 ?auto_470655 ) ) ( not ( = ?auto_470651 ?auto_470656 ) ) ( not ( = ?auto_470651 ?auto_470657 ) ) ( not ( = ?auto_470651 ?auto_470658 ) ) ( not ( = ?auto_470651 ?auto_470659 ) ) ( not ( = ?auto_470652 ?auto_470653 ) ) ( not ( = ?auto_470652 ?auto_470654 ) ) ( not ( = ?auto_470652 ?auto_470655 ) ) ( not ( = ?auto_470652 ?auto_470656 ) ) ( not ( = ?auto_470652 ?auto_470657 ) ) ( not ( = ?auto_470652 ?auto_470658 ) ) ( not ( = ?auto_470652 ?auto_470659 ) ) ( not ( = ?auto_470653 ?auto_470654 ) ) ( not ( = ?auto_470653 ?auto_470655 ) ) ( not ( = ?auto_470653 ?auto_470656 ) ) ( not ( = ?auto_470653 ?auto_470657 ) ) ( not ( = ?auto_470653 ?auto_470658 ) ) ( not ( = ?auto_470653 ?auto_470659 ) ) ( not ( = ?auto_470654 ?auto_470655 ) ) ( not ( = ?auto_470654 ?auto_470656 ) ) ( not ( = ?auto_470654 ?auto_470657 ) ) ( not ( = ?auto_470654 ?auto_470658 ) ) ( not ( = ?auto_470654 ?auto_470659 ) ) ( not ( = ?auto_470655 ?auto_470656 ) ) ( not ( = ?auto_470655 ?auto_470657 ) ) ( not ( = ?auto_470655 ?auto_470658 ) ) ( not ( = ?auto_470655 ?auto_470659 ) ) ( not ( = ?auto_470656 ?auto_470657 ) ) ( not ( = ?auto_470656 ?auto_470658 ) ) ( not ( = ?auto_470656 ?auto_470659 ) ) ( not ( = ?auto_470657 ?auto_470658 ) ) ( not ( = ?auto_470657 ?auto_470659 ) ) ( not ( = ?auto_470658 ?auto_470659 ) ) ( ON ?auto_470658 ?auto_470659 ) ( ON ?auto_470657 ?auto_470658 ) ( ON ?auto_470656 ?auto_470657 ) ( ON ?auto_470655 ?auto_470656 ) ( ON ?auto_470654 ?auto_470655 ) ( ON ?auto_470653 ?auto_470654 ) ( CLEAR ?auto_470651 ) ( ON ?auto_470652 ?auto_470653 ) ( CLEAR ?auto_470652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_470644 ?auto_470645 ?auto_470646 ?auto_470647 ?auto_470648 ?auto_470649 ?auto_470650 ?auto_470651 ?auto_470652 )
      ( MAKE-16PILE ?auto_470644 ?auto_470645 ?auto_470646 ?auto_470647 ?auto_470648 ?auto_470649 ?auto_470650 ?auto_470651 ?auto_470652 ?auto_470653 ?auto_470654 ?auto_470655 ?auto_470656 ?auto_470657 ?auto_470658 ?auto_470659 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470676 - BLOCK
      ?auto_470677 - BLOCK
      ?auto_470678 - BLOCK
      ?auto_470679 - BLOCK
      ?auto_470680 - BLOCK
      ?auto_470681 - BLOCK
      ?auto_470682 - BLOCK
      ?auto_470683 - BLOCK
      ?auto_470684 - BLOCK
      ?auto_470685 - BLOCK
      ?auto_470686 - BLOCK
      ?auto_470687 - BLOCK
      ?auto_470688 - BLOCK
      ?auto_470689 - BLOCK
      ?auto_470690 - BLOCK
      ?auto_470691 - BLOCK
    )
    :vars
    (
      ?auto_470692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470691 ?auto_470692 ) ( ON-TABLE ?auto_470676 ) ( ON ?auto_470677 ?auto_470676 ) ( ON ?auto_470678 ?auto_470677 ) ( ON ?auto_470679 ?auto_470678 ) ( ON ?auto_470680 ?auto_470679 ) ( ON ?auto_470681 ?auto_470680 ) ( ON ?auto_470682 ?auto_470681 ) ( not ( = ?auto_470676 ?auto_470677 ) ) ( not ( = ?auto_470676 ?auto_470678 ) ) ( not ( = ?auto_470676 ?auto_470679 ) ) ( not ( = ?auto_470676 ?auto_470680 ) ) ( not ( = ?auto_470676 ?auto_470681 ) ) ( not ( = ?auto_470676 ?auto_470682 ) ) ( not ( = ?auto_470676 ?auto_470683 ) ) ( not ( = ?auto_470676 ?auto_470684 ) ) ( not ( = ?auto_470676 ?auto_470685 ) ) ( not ( = ?auto_470676 ?auto_470686 ) ) ( not ( = ?auto_470676 ?auto_470687 ) ) ( not ( = ?auto_470676 ?auto_470688 ) ) ( not ( = ?auto_470676 ?auto_470689 ) ) ( not ( = ?auto_470676 ?auto_470690 ) ) ( not ( = ?auto_470676 ?auto_470691 ) ) ( not ( = ?auto_470676 ?auto_470692 ) ) ( not ( = ?auto_470677 ?auto_470678 ) ) ( not ( = ?auto_470677 ?auto_470679 ) ) ( not ( = ?auto_470677 ?auto_470680 ) ) ( not ( = ?auto_470677 ?auto_470681 ) ) ( not ( = ?auto_470677 ?auto_470682 ) ) ( not ( = ?auto_470677 ?auto_470683 ) ) ( not ( = ?auto_470677 ?auto_470684 ) ) ( not ( = ?auto_470677 ?auto_470685 ) ) ( not ( = ?auto_470677 ?auto_470686 ) ) ( not ( = ?auto_470677 ?auto_470687 ) ) ( not ( = ?auto_470677 ?auto_470688 ) ) ( not ( = ?auto_470677 ?auto_470689 ) ) ( not ( = ?auto_470677 ?auto_470690 ) ) ( not ( = ?auto_470677 ?auto_470691 ) ) ( not ( = ?auto_470677 ?auto_470692 ) ) ( not ( = ?auto_470678 ?auto_470679 ) ) ( not ( = ?auto_470678 ?auto_470680 ) ) ( not ( = ?auto_470678 ?auto_470681 ) ) ( not ( = ?auto_470678 ?auto_470682 ) ) ( not ( = ?auto_470678 ?auto_470683 ) ) ( not ( = ?auto_470678 ?auto_470684 ) ) ( not ( = ?auto_470678 ?auto_470685 ) ) ( not ( = ?auto_470678 ?auto_470686 ) ) ( not ( = ?auto_470678 ?auto_470687 ) ) ( not ( = ?auto_470678 ?auto_470688 ) ) ( not ( = ?auto_470678 ?auto_470689 ) ) ( not ( = ?auto_470678 ?auto_470690 ) ) ( not ( = ?auto_470678 ?auto_470691 ) ) ( not ( = ?auto_470678 ?auto_470692 ) ) ( not ( = ?auto_470679 ?auto_470680 ) ) ( not ( = ?auto_470679 ?auto_470681 ) ) ( not ( = ?auto_470679 ?auto_470682 ) ) ( not ( = ?auto_470679 ?auto_470683 ) ) ( not ( = ?auto_470679 ?auto_470684 ) ) ( not ( = ?auto_470679 ?auto_470685 ) ) ( not ( = ?auto_470679 ?auto_470686 ) ) ( not ( = ?auto_470679 ?auto_470687 ) ) ( not ( = ?auto_470679 ?auto_470688 ) ) ( not ( = ?auto_470679 ?auto_470689 ) ) ( not ( = ?auto_470679 ?auto_470690 ) ) ( not ( = ?auto_470679 ?auto_470691 ) ) ( not ( = ?auto_470679 ?auto_470692 ) ) ( not ( = ?auto_470680 ?auto_470681 ) ) ( not ( = ?auto_470680 ?auto_470682 ) ) ( not ( = ?auto_470680 ?auto_470683 ) ) ( not ( = ?auto_470680 ?auto_470684 ) ) ( not ( = ?auto_470680 ?auto_470685 ) ) ( not ( = ?auto_470680 ?auto_470686 ) ) ( not ( = ?auto_470680 ?auto_470687 ) ) ( not ( = ?auto_470680 ?auto_470688 ) ) ( not ( = ?auto_470680 ?auto_470689 ) ) ( not ( = ?auto_470680 ?auto_470690 ) ) ( not ( = ?auto_470680 ?auto_470691 ) ) ( not ( = ?auto_470680 ?auto_470692 ) ) ( not ( = ?auto_470681 ?auto_470682 ) ) ( not ( = ?auto_470681 ?auto_470683 ) ) ( not ( = ?auto_470681 ?auto_470684 ) ) ( not ( = ?auto_470681 ?auto_470685 ) ) ( not ( = ?auto_470681 ?auto_470686 ) ) ( not ( = ?auto_470681 ?auto_470687 ) ) ( not ( = ?auto_470681 ?auto_470688 ) ) ( not ( = ?auto_470681 ?auto_470689 ) ) ( not ( = ?auto_470681 ?auto_470690 ) ) ( not ( = ?auto_470681 ?auto_470691 ) ) ( not ( = ?auto_470681 ?auto_470692 ) ) ( not ( = ?auto_470682 ?auto_470683 ) ) ( not ( = ?auto_470682 ?auto_470684 ) ) ( not ( = ?auto_470682 ?auto_470685 ) ) ( not ( = ?auto_470682 ?auto_470686 ) ) ( not ( = ?auto_470682 ?auto_470687 ) ) ( not ( = ?auto_470682 ?auto_470688 ) ) ( not ( = ?auto_470682 ?auto_470689 ) ) ( not ( = ?auto_470682 ?auto_470690 ) ) ( not ( = ?auto_470682 ?auto_470691 ) ) ( not ( = ?auto_470682 ?auto_470692 ) ) ( not ( = ?auto_470683 ?auto_470684 ) ) ( not ( = ?auto_470683 ?auto_470685 ) ) ( not ( = ?auto_470683 ?auto_470686 ) ) ( not ( = ?auto_470683 ?auto_470687 ) ) ( not ( = ?auto_470683 ?auto_470688 ) ) ( not ( = ?auto_470683 ?auto_470689 ) ) ( not ( = ?auto_470683 ?auto_470690 ) ) ( not ( = ?auto_470683 ?auto_470691 ) ) ( not ( = ?auto_470683 ?auto_470692 ) ) ( not ( = ?auto_470684 ?auto_470685 ) ) ( not ( = ?auto_470684 ?auto_470686 ) ) ( not ( = ?auto_470684 ?auto_470687 ) ) ( not ( = ?auto_470684 ?auto_470688 ) ) ( not ( = ?auto_470684 ?auto_470689 ) ) ( not ( = ?auto_470684 ?auto_470690 ) ) ( not ( = ?auto_470684 ?auto_470691 ) ) ( not ( = ?auto_470684 ?auto_470692 ) ) ( not ( = ?auto_470685 ?auto_470686 ) ) ( not ( = ?auto_470685 ?auto_470687 ) ) ( not ( = ?auto_470685 ?auto_470688 ) ) ( not ( = ?auto_470685 ?auto_470689 ) ) ( not ( = ?auto_470685 ?auto_470690 ) ) ( not ( = ?auto_470685 ?auto_470691 ) ) ( not ( = ?auto_470685 ?auto_470692 ) ) ( not ( = ?auto_470686 ?auto_470687 ) ) ( not ( = ?auto_470686 ?auto_470688 ) ) ( not ( = ?auto_470686 ?auto_470689 ) ) ( not ( = ?auto_470686 ?auto_470690 ) ) ( not ( = ?auto_470686 ?auto_470691 ) ) ( not ( = ?auto_470686 ?auto_470692 ) ) ( not ( = ?auto_470687 ?auto_470688 ) ) ( not ( = ?auto_470687 ?auto_470689 ) ) ( not ( = ?auto_470687 ?auto_470690 ) ) ( not ( = ?auto_470687 ?auto_470691 ) ) ( not ( = ?auto_470687 ?auto_470692 ) ) ( not ( = ?auto_470688 ?auto_470689 ) ) ( not ( = ?auto_470688 ?auto_470690 ) ) ( not ( = ?auto_470688 ?auto_470691 ) ) ( not ( = ?auto_470688 ?auto_470692 ) ) ( not ( = ?auto_470689 ?auto_470690 ) ) ( not ( = ?auto_470689 ?auto_470691 ) ) ( not ( = ?auto_470689 ?auto_470692 ) ) ( not ( = ?auto_470690 ?auto_470691 ) ) ( not ( = ?auto_470690 ?auto_470692 ) ) ( not ( = ?auto_470691 ?auto_470692 ) ) ( ON ?auto_470690 ?auto_470691 ) ( ON ?auto_470689 ?auto_470690 ) ( ON ?auto_470688 ?auto_470689 ) ( ON ?auto_470687 ?auto_470688 ) ( ON ?auto_470686 ?auto_470687 ) ( ON ?auto_470685 ?auto_470686 ) ( ON ?auto_470684 ?auto_470685 ) ( CLEAR ?auto_470682 ) ( ON ?auto_470683 ?auto_470684 ) ( CLEAR ?auto_470683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_470676 ?auto_470677 ?auto_470678 ?auto_470679 ?auto_470680 ?auto_470681 ?auto_470682 ?auto_470683 )
      ( MAKE-16PILE ?auto_470676 ?auto_470677 ?auto_470678 ?auto_470679 ?auto_470680 ?auto_470681 ?auto_470682 ?auto_470683 ?auto_470684 ?auto_470685 ?auto_470686 ?auto_470687 ?auto_470688 ?auto_470689 ?auto_470690 ?auto_470691 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470709 - BLOCK
      ?auto_470710 - BLOCK
      ?auto_470711 - BLOCK
      ?auto_470712 - BLOCK
      ?auto_470713 - BLOCK
      ?auto_470714 - BLOCK
      ?auto_470715 - BLOCK
      ?auto_470716 - BLOCK
      ?auto_470717 - BLOCK
      ?auto_470718 - BLOCK
      ?auto_470719 - BLOCK
      ?auto_470720 - BLOCK
      ?auto_470721 - BLOCK
      ?auto_470722 - BLOCK
      ?auto_470723 - BLOCK
      ?auto_470724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_470724 ) ( ON-TABLE ?auto_470709 ) ( ON ?auto_470710 ?auto_470709 ) ( ON ?auto_470711 ?auto_470710 ) ( ON ?auto_470712 ?auto_470711 ) ( ON ?auto_470713 ?auto_470712 ) ( ON ?auto_470714 ?auto_470713 ) ( ON ?auto_470715 ?auto_470714 ) ( not ( = ?auto_470709 ?auto_470710 ) ) ( not ( = ?auto_470709 ?auto_470711 ) ) ( not ( = ?auto_470709 ?auto_470712 ) ) ( not ( = ?auto_470709 ?auto_470713 ) ) ( not ( = ?auto_470709 ?auto_470714 ) ) ( not ( = ?auto_470709 ?auto_470715 ) ) ( not ( = ?auto_470709 ?auto_470716 ) ) ( not ( = ?auto_470709 ?auto_470717 ) ) ( not ( = ?auto_470709 ?auto_470718 ) ) ( not ( = ?auto_470709 ?auto_470719 ) ) ( not ( = ?auto_470709 ?auto_470720 ) ) ( not ( = ?auto_470709 ?auto_470721 ) ) ( not ( = ?auto_470709 ?auto_470722 ) ) ( not ( = ?auto_470709 ?auto_470723 ) ) ( not ( = ?auto_470709 ?auto_470724 ) ) ( not ( = ?auto_470710 ?auto_470711 ) ) ( not ( = ?auto_470710 ?auto_470712 ) ) ( not ( = ?auto_470710 ?auto_470713 ) ) ( not ( = ?auto_470710 ?auto_470714 ) ) ( not ( = ?auto_470710 ?auto_470715 ) ) ( not ( = ?auto_470710 ?auto_470716 ) ) ( not ( = ?auto_470710 ?auto_470717 ) ) ( not ( = ?auto_470710 ?auto_470718 ) ) ( not ( = ?auto_470710 ?auto_470719 ) ) ( not ( = ?auto_470710 ?auto_470720 ) ) ( not ( = ?auto_470710 ?auto_470721 ) ) ( not ( = ?auto_470710 ?auto_470722 ) ) ( not ( = ?auto_470710 ?auto_470723 ) ) ( not ( = ?auto_470710 ?auto_470724 ) ) ( not ( = ?auto_470711 ?auto_470712 ) ) ( not ( = ?auto_470711 ?auto_470713 ) ) ( not ( = ?auto_470711 ?auto_470714 ) ) ( not ( = ?auto_470711 ?auto_470715 ) ) ( not ( = ?auto_470711 ?auto_470716 ) ) ( not ( = ?auto_470711 ?auto_470717 ) ) ( not ( = ?auto_470711 ?auto_470718 ) ) ( not ( = ?auto_470711 ?auto_470719 ) ) ( not ( = ?auto_470711 ?auto_470720 ) ) ( not ( = ?auto_470711 ?auto_470721 ) ) ( not ( = ?auto_470711 ?auto_470722 ) ) ( not ( = ?auto_470711 ?auto_470723 ) ) ( not ( = ?auto_470711 ?auto_470724 ) ) ( not ( = ?auto_470712 ?auto_470713 ) ) ( not ( = ?auto_470712 ?auto_470714 ) ) ( not ( = ?auto_470712 ?auto_470715 ) ) ( not ( = ?auto_470712 ?auto_470716 ) ) ( not ( = ?auto_470712 ?auto_470717 ) ) ( not ( = ?auto_470712 ?auto_470718 ) ) ( not ( = ?auto_470712 ?auto_470719 ) ) ( not ( = ?auto_470712 ?auto_470720 ) ) ( not ( = ?auto_470712 ?auto_470721 ) ) ( not ( = ?auto_470712 ?auto_470722 ) ) ( not ( = ?auto_470712 ?auto_470723 ) ) ( not ( = ?auto_470712 ?auto_470724 ) ) ( not ( = ?auto_470713 ?auto_470714 ) ) ( not ( = ?auto_470713 ?auto_470715 ) ) ( not ( = ?auto_470713 ?auto_470716 ) ) ( not ( = ?auto_470713 ?auto_470717 ) ) ( not ( = ?auto_470713 ?auto_470718 ) ) ( not ( = ?auto_470713 ?auto_470719 ) ) ( not ( = ?auto_470713 ?auto_470720 ) ) ( not ( = ?auto_470713 ?auto_470721 ) ) ( not ( = ?auto_470713 ?auto_470722 ) ) ( not ( = ?auto_470713 ?auto_470723 ) ) ( not ( = ?auto_470713 ?auto_470724 ) ) ( not ( = ?auto_470714 ?auto_470715 ) ) ( not ( = ?auto_470714 ?auto_470716 ) ) ( not ( = ?auto_470714 ?auto_470717 ) ) ( not ( = ?auto_470714 ?auto_470718 ) ) ( not ( = ?auto_470714 ?auto_470719 ) ) ( not ( = ?auto_470714 ?auto_470720 ) ) ( not ( = ?auto_470714 ?auto_470721 ) ) ( not ( = ?auto_470714 ?auto_470722 ) ) ( not ( = ?auto_470714 ?auto_470723 ) ) ( not ( = ?auto_470714 ?auto_470724 ) ) ( not ( = ?auto_470715 ?auto_470716 ) ) ( not ( = ?auto_470715 ?auto_470717 ) ) ( not ( = ?auto_470715 ?auto_470718 ) ) ( not ( = ?auto_470715 ?auto_470719 ) ) ( not ( = ?auto_470715 ?auto_470720 ) ) ( not ( = ?auto_470715 ?auto_470721 ) ) ( not ( = ?auto_470715 ?auto_470722 ) ) ( not ( = ?auto_470715 ?auto_470723 ) ) ( not ( = ?auto_470715 ?auto_470724 ) ) ( not ( = ?auto_470716 ?auto_470717 ) ) ( not ( = ?auto_470716 ?auto_470718 ) ) ( not ( = ?auto_470716 ?auto_470719 ) ) ( not ( = ?auto_470716 ?auto_470720 ) ) ( not ( = ?auto_470716 ?auto_470721 ) ) ( not ( = ?auto_470716 ?auto_470722 ) ) ( not ( = ?auto_470716 ?auto_470723 ) ) ( not ( = ?auto_470716 ?auto_470724 ) ) ( not ( = ?auto_470717 ?auto_470718 ) ) ( not ( = ?auto_470717 ?auto_470719 ) ) ( not ( = ?auto_470717 ?auto_470720 ) ) ( not ( = ?auto_470717 ?auto_470721 ) ) ( not ( = ?auto_470717 ?auto_470722 ) ) ( not ( = ?auto_470717 ?auto_470723 ) ) ( not ( = ?auto_470717 ?auto_470724 ) ) ( not ( = ?auto_470718 ?auto_470719 ) ) ( not ( = ?auto_470718 ?auto_470720 ) ) ( not ( = ?auto_470718 ?auto_470721 ) ) ( not ( = ?auto_470718 ?auto_470722 ) ) ( not ( = ?auto_470718 ?auto_470723 ) ) ( not ( = ?auto_470718 ?auto_470724 ) ) ( not ( = ?auto_470719 ?auto_470720 ) ) ( not ( = ?auto_470719 ?auto_470721 ) ) ( not ( = ?auto_470719 ?auto_470722 ) ) ( not ( = ?auto_470719 ?auto_470723 ) ) ( not ( = ?auto_470719 ?auto_470724 ) ) ( not ( = ?auto_470720 ?auto_470721 ) ) ( not ( = ?auto_470720 ?auto_470722 ) ) ( not ( = ?auto_470720 ?auto_470723 ) ) ( not ( = ?auto_470720 ?auto_470724 ) ) ( not ( = ?auto_470721 ?auto_470722 ) ) ( not ( = ?auto_470721 ?auto_470723 ) ) ( not ( = ?auto_470721 ?auto_470724 ) ) ( not ( = ?auto_470722 ?auto_470723 ) ) ( not ( = ?auto_470722 ?auto_470724 ) ) ( not ( = ?auto_470723 ?auto_470724 ) ) ( ON ?auto_470723 ?auto_470724 ) ( ON ?auto_470722 ?auto_470723 ) ( ON ?auto_470721 ?auto_470722 ) ( ON ?auto_470720 ?auto_470721 ) ( ON ?auto_470719 ?auto_470720 ) ( ON ?auto_470718 ?auto_470719 ) ( ON ?auto_470717 ?auto_470718 ) ( CLEAR ?auto_470715 ) ( ON ?auto_470716 ?auto_470717 ) ( CLEAR ?auto_470716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_470709 ?auto_470710 ?auto_470711 ?auto_470712 ?auto_470713 ?auto_470714 ?auto_470715 ?auto_470716 )
      ( MAKE-16PILE ?auto_470709 ?auto_470710 ?auto_470711 ?auto_470712 ?auto_470713 ?auto_470714 ?auto_470715 ?auto_470716 ?auto_470717 ?auto_470718 ?auto_470719 ?auto_470720 ?auto_470721 ?auto_470722 ?auto_470723 ?auto_470724 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470741 - BLOCK
      ?auto_470742 - BLOCK
      ?auto_470743 - BLOCK
      ?auto_470744 - BLOCK
      ?auto_470745 - BLOCK
      ?auto_470746 - BLOCK
      ?auto_470747 - BLOCK
      ?auto_470748 - BLOCK
      ?auto_470749 - BLOCK
      ?auto_470750 - BLOCK
      ?auto_470751 - BLOCK
      ?auto_470752 - BLOCK
      ?auto_470753 - BLOCK
      ?auto_470754 - BLOCK
      ?auto_470755 - BLOCK
      ?auto_470756 - BLOCK
    )
    :vars
    (
      ?auto_470757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470756 ?auto_470757 ) ( ON-TABLE ?auto_470741 ) ( ON ?auto_470742 ?auto_470741 ) ( ON ?auto_470743 ?auto_470742 ) ( ON ?auto_470744 ?auto_470743 ) ( ON ?auto_470745 ?auto_470744 ) ( ON ?auto_470746 ?auto_470745 ) ( not ( = ?auto_470741 ?auto_470742 ) ) ( not ( = ?auto_470741 ?auto_470743 ) ) ( not ( = ?auto_470741 ?auto_470744 ) ) ( not ( = ?auto_470741 ?auto_470745 ) ) ( not ( = ?auto_470741 ?auto_470746 ) ) ( not ( = ?auto_470741 ?auto_470747 ) ) ( not ( = ?auto_470741 ?auto_470748 ) ) ( not ( = ?auto_470741 ?auto_470749 ) ) ( not ( = ?auto_470741 ?auto_470750 ) ) ( not ( = ?auto_470741 ?auto_470751 ) ) ( not ( = ?auto_470741 ?auto_470752 ) ) ( not ( = ?auto_470741 ?auto_470753 ) ) ( not ( = ?auto_470741 ?auto_470754 ) ) ( not ( = ?auto_470741 ?auto_470755 ) ) ( not ( = ?auto_470741 ?auto_470756 ) ) ( not ( = ?auto_470741 ?auto_470757 ) ) ( not ( = ?auto_470742 ?auto_470743 ) ) ( not ( = ?auto_470742 ?auto_470744 ) ) ( not ( = ?auto_470742 ?auto_470745 ) ) ( not ( = ?auto_470742 ?auto_470746 ) ) ( not ( = ?auto_470742 ?auto_470747 ) ) ( not ( = ?auto_470742 ?auto_470748 ) ) ( not ( = ?auto_470742 ?auto_470749 ) ) ( not ( = ?auto_470742 ?auto_470750 ) ) ( not ( = ?auto_470742 ?auto_470751 ) ) ( not ( = ?auto_470742 ?auto_470752 ) ) ( not ( = ?auto_470742 ?auto_470753 ) ) ( not ( = ?auto_470742 ?auto_470754 ) ) ( not ( = ?auto_470742 ?auto_470755 ) ) ( not ( = ?auto_470742 ?auto_470756 ) ) ( not ( = ?auto_470742 ?auto_470757 ) ) ( not ( = ?auto_470743 ?auto_470744 ) ) ( not ( = ?auto_470743 ?auto_470745 ) ) ( not ( = ?auto_470743 ?auto_470746 ) ) ( not ( = ?auto_470743 ?auto_470747 ) ) ( not ( = ?auto_470743 ?auto_470748 ) ) ( not ( = ?auto_470743 ?auto_470749 ) ) ( not ( = ?auto_470743 ?auto_470750 ) ) ( not ( = ?auto_470743 ?auto_470751 ) ) ( not ( = ?auto_470743 ?auto_470752 ) ) ( not ( = ?auto_470743 ?auto_470753 ) ) ( not ( = ?auto_470743 ?auto_470754 ) ) ( not ( = ?auto_470743 ?auto_470755 ) ) ( not ( = ?auto_470743 ?auto_470756 ) ) ( not ( = ?auto_470743 ?auto_470757 ) ) ( not ( = ?auto_470744 ?auto_470745 ) ) ( not ( = ?auto_470744 ?auto_470746 ) ) ( not ( = ?auto_470744 ?auto_470747 ) ) ( not ( = ?auto_470744 ?auto_470748 ) ) ( not ( = ?auto_470744 ?auto_470749 ) ) ( not ( = ?auto_470744 ?auto_470750 ) ) ( not ( = ?auto_470744 ?auto_470751 ) ) ( not ( = ?auto_470744 ?auto_470752 ) ) ( not ( = ?auto_470744 ?auto_470753 ) ) ( not ( = ?auto_470744 ?auto_470754 ) ) ( not ( = ?auto_470744 ?auto_470755 ) ) ( not ( = ?auto_470744 ?auto_470756 ) ) ( not ( = ?auto_470744 ?auto_470757 ) ) ( not ( = ?auto_470745 ?auto_470746 ) ) ( not ( = ?auto_470745 ?auto_470747 ) ) ( not ( = ?auto_470745 ?auto_470748 ) ) ( not ( = ?auto_470745 ?auto_470749 ) ) ( not ( = ?auto_470745 ?auto_470750 ) ) ( not ( = ?auto_470745 ?auto_470751 ) ) ( not ( = ?auto_470745 ?auto_470752 ) ) ( not ( = ?auto_470745 ?auto_470753 ) ) ( not ( = ?auto_470745 ?auto_470754 ) ) ( not ( = ?auto_470745 ?auto_470755 ) ) ( not ( = ?auto_470745 ?auto_470756 ) ) ( not ( = ?auto_470745 ?auto_470757 ) ) ( not ( = ?auto_470746 ?auto_470747 ) ) ( not ( = ?auto_470746 ?auto_470748 ) ) ( not ( = ?auto_470746 ?auto_470749 ) ) ( not ( = ?auto_470746 ?auto_470750 ) ) ( not ( = ?auto_470746 ?auto_470751 ) ) ( not ( = ?auto_470746 ?auto_470752 ) ) ( not ( = ?auto_470746 ?auto_470753 ) ) ( not ( = ?auto_470746 ?auto_470754 ) ) ( not ( = ?auto_470746 ?auto_470755 ) ) ( not ( = ?auto_470746 ?auto_470756 ) ) ( not ( = ?auto_470746 ?auto_470757 ) ) ( not ( = ?auto_470747 ?auto_470748 ) ) ( not ( = ?auto_470747 ?auto_470749 ) ) ( not ( = ?auto_470747 ?auto_470750 ) ) ( not ( = ?auto_470747 ?auto_470751 ) ) ( not ( = ?auto_470747 ?auto_470752 ) ) ( not ( = ?auto_470747 ?auto_470753 ) ) ( not ( = ?auto_470747 ?auto_470754 ) ) ( not ( = ?auto_470747 ?auto_470755 ) ) ( not ( = ?auto_470747 ?auto_470756 ) ) ( not ( = ?auto_470747 ?auto_470757 ) ) ( not ( = ?auto_470748 ?auto_470749 ) ) ( not ( = ?auto_470748 ?auto_470750 ) ) ( not ( = ?auto_470748 ?auto_470751 ) ) ( not ( = ?auto_470748 ?auto_470752 ) ) ( not ( = ?auto_470748 ?auto_470753 ) ) ( not ( = ?auto_470748 ?auto_470754 ) ) ( not ( = ?auto_470748 ?auto_470755 ) ) ( not ( = ?auto_470748 ?auto_470756 ) ) ( not ( = ?auto_470748 ?auto_470757 ) ) ( not ( = ?auto_470749 ?auto_470750 ) ) ( not ( = ?auto_470749 ?auto_470751 ) ) ( not ( = ?auto_470749 ?auto_470752 ) ) ( not ( = ?auto_470749 ?auto_470753 ) ) ( not ( = ?auto_470749 ?auto_470754 ) ) ( not ( = ?auto_470749 ?auto_470755 ) ) ( not ( = ?auto_470749 ?auto_470756 ) ) ( not ( = ?auto_470749 ?auto_470757 ) ) ( not ( = ?auto_470750 ?auto_470751 ) ) ( not ( = ?auto_470750 ?auto_470752 ) ) ( not ( = ?auto_470750 ?auto_470753 ) ) ( not ( = ?auto_470750 ?auto_470754 ) ) ( not ( = ?auto_470750 ?auto_470755 ) ) ( not ( = ?auto_470750 ?auto_470756 ) ) ( not ( = ?auto_470750 ?auto_470757 ) ) ( not ( = ?auto_470751 ?auto_470752 ) ) ( not ( = ?auto_470751 ?auto_470753 ) ) ( not ( = ?auto_470751 ?auto_470754 ) ) ( not ( = ?auto_470751 ?auto_470755 ) ) ( not ( = ?auto_470751 ?auto_470756 ) ) ( not ( = ?auto_470751 ?auto_470757 ) ) ( not ( = ?auto_470752 ?auto_470753 ) ) ( not ( = ?auto_470752 ?auto_470754 ) ) ( not ( = ?auto_470752 ?auto_470755 ) ) ( not ( = ?auto_470752 ?auto_470756 ) ) ( not ( = ?auto_470752 ?auto_470757 ) ) ( not ( = ?auto_470753 ?auto_470754 ) ) ( not ( = ?auto_470753 ?auto_470755 ) ) ( not ( = ?auto_470753 ?auto_470756 ) ) ( not ( = ?auto_470753 ?auto_470757 ) ) ( not ( = ?auto_470754 ?auto_470755 ) ) ( not ( = ?auto_470754 ?auto_470756 ) ) ( not ( = ?auto_470754 ?auto_470757 ) ) ( not ( = ?auto_470755 ?auto_470756 ) ) ( not ( = ?auto_470755 ?auto_470757 ) ) ( not ( = ?auto_470756 ?auto_470757 ) ) ( ON ?auto_470755 ?auto_470756 ) ( ON ?auto_470754 ?auto_470755 ) ( ON ?auto_470753 ?auto_470754 ) ( ON ?auto_470752 ?auto_470753 ) ( ON ?auto_470751 ?auto_470752 ) ( ON ?auto_470750 ?auto_470751 ) ( ON ?auto_470749 ?auto_470750 ) ( ON ?auto_470748 ?auto_470749 ) ( CLEAR ?auto_470746 ) ( ON ?auto_470747 ?auto_470748 ) ( CLEAR ?auto_470747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_470741 ?auto_470742 ?auto_470743 ?auto_470744 ?auto_470745 ?auto_470746 ?auto_470747 )
      ( MAKE-16PILE ?auto_470741 ?auto_470742 ?auto_470743 ?auto_470744 ?auto_470745 ?auto_470746 ?auto_470747 ?auto_470748 ?auto_470749 ?auto_470750 ?auto_470751 ?auto_470752 ?auto_470753 ?auto_470754 ?auto_470755 ?auto_470756 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470774 - BLOCK
      ?auto_470775 - BLOCK
      ?auto_470776 - BLOCK
      ?auto_470777 - BLOCK
      ?auto_470778 - BLOCK
      ?auto_470779 - BLOCK
      ?auto_470780 - BLOCK
      ?auto_470781 - BLOCK
      ?auto_470782 - BLOCK
      ?auto_470783 - BLOCK
      ?auto_470784 - BLOCK
      ?auto_470785 - BLOCK
      ?auto_470786 - BLOCK
      ?auto_470787 - BLOCK
      ?auto_470788 - BLOCK
      ?auto_470789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_470789 ) ( ON-TABLE ?auto_470774 ) ( ON ?auto_470775 ?auto_470774 ) ( ON ?auto_470776 ?auto_470775 ) ( ON ?auto_470777 ?auto_470776 ) ( ON ?auto_470778 ?auto_470777 ) ( ON ?auto_470779 ?auto_470778 ) ( not ( = ?auto_470774 ?auto_470775 ) ) ( not ( = ?auto_470774 ?auto_470776 ) ) ( not ( = ?auto_470774 ?auto_470777 ) ) ( not ( = ?auto_470774 ?auto_470778 ) ) ( not ( = ?auto_470774 ?auto_470779 ) ) ( not ( = ?auto_470774 ?auto_470780 ) ) ( not ( = ?auto_470774 ?auto_470781 ) ) ( not ( = ?auto_470774 ?auto_470782 ) ) ( not ( = ?auto_470774 ?auto_470783 ) ) ( not ( = ?auto_470774 ?auto_470784 ) ) ( not ( = ?auto_470774 ?auto_470785 ) ) ( not ( = ?auto_470774 ?auto_470786 ) ) ( not ( = ?auto_470774 ?auto_470787 ) ) ( not ( = ?auto_470774 ?auto_470788 ) ) ( not ( = ?auto_470774 ?auto_470789 ) ) ( not ( = ?auto_470775 ?auto_470776 ) ) ( not ( = ?auto_470775 ?auto_470777 ) ) ( not ( = ?auto_470775 ?auto_470778 ) ) ( not ( = ?auto_470775 ?auto_470779 ) ) ( not ( = ?auto_470775 ?auto_470780 ) ) ( not ( = ?auto_470775 ?auto_470781 ) ) ( not ( = ?auto_470775 ?auto_470782 ) ) ( not ( = ?auto_470775 ?auto_470783 ) ) ( not ( = ?auto_470775 ?auto_470784 ) ) ( not ( = ?auto_470775 ?auto_470785 ) ) ( not ( = ?auto_470775 ?auto_470786 ) ) ( not ( = ?auto_470775 ?auto_470787 ) ) ( not ( = ?auto_470775 ?auto_470788 ) ) ( not ( = ?auto_470775 ?auto_470789 ) ) ( not ( = ?auto_470776 ?auto_470777 ) ) ( not ( = ?auto_470776 ?auto_470778 ) ) ( not ( = ?auto_470776 ?auto_470779 ) ) ( not ( = ?auto_470776 ?auto_470780 ) ) ( not ( = ?auto_470776 ?auto_470781 ) ) ( not ( = ?auto_470776 ?auto_470782 ) ) ( not ( = ?auto_470776 ?auto_470783 ) ) ( not ( = ?auto_470776 ?auto_470784 ) ) ( not ( = ?auto_470776 ?auto_470785 ) ) ( not ( = ?auto_470776 ?auto_470786 ) ) ( not ( = ?auto_470776 ?auto_470787 ) ) ( not ( = ?auto_470776 ?auto_470788 ) ) ( not ( = ?auto_470776 ?auto_470789 ) ) ( not ( = ?auto_470777 ?auto_470778 ) ) ( not ( = ?auto_470777 ?auto_470779 ) ) ( not ( = ?auto_470777 ?auto_470780 ) ) ( not ( = ?auto_470777 ?auto_470781 ) ) ( not ( = ?auto_470777 ?auto_470782 ) ) ( not ( = ?auto_470777 ?auto_470783 ) ) ( not ( = ?auto_470777 ?auto_470784 ) ) ( not ( = ?auto_470777 ?auto_470785 ) ) ( not ( = ?auto_470777 ?auto_470786 ) ) ( not ( = ?auto_470777 ?auto_470787 ) ) ( not ( = ?auto_470777 ?auto_470788 ) ) ( not ( = ?auto_470777 ?auto_470789 ) ) ( not ( = ?auto_470778 ?auto_470779 ) ) ( not ( = ?auto_470778 ?auto_470780 ) ) ( not ( = ?auto_470778 ?auto_470781 ) ) ( not ( = ?auto_470778 ?auto_470782 ) ) ( not ( = ?auto_470778 ?auto_470783 ) ) ( not ( = ?auto_470778 ?auto_470784 ) ) ( not ( = ?auto_470778 ?auto_470785 ) ) ( not ( = ?auto_470778 ?auto_470786 ) ) ( not ( = ?auto_470778 ?auto_470787 ) ) ( not ( = ?auto_470778 ?auto_470788 ) ) ( not ( = ?auto_470778 ?auto_470789 ) ) ( not ( = ?auto_470779 ?auto_470780 ) ) ( not ( = ?auto_470779 ?auto_470781 ) ) ( not ( = ?auto_470779 ?auto_470782 ) ) ( not ( = ?auto_470779 ?auto_470783 ) ) ( not ( = ?auto_470779 ?auto_470784 ) ) ( not ( = ?auto_470779 ?auto_470785 ) ) ( not ( = ?auto_470779 ?auto_470786 ) ) ( not ( = ?auto_470779 ?auto_470787 ) ) ( not ( = ?auto_470779 ?auto_470788 ) ) ( not ( = ?auto_470779 ?auto_470789 ) ) ( not ( = ?auto_470780 ?auto_470781 ) ) ( not ( = ?auto_470780 ?auto_470782 ) ) ( not ( = ?auto_470780 ?auto_470783 ) ) ( not ( = ?auto_470780 ?auto_470784 ) ) ( not ( = ?auto_470780 ?auto_470785 ) ) ( not ( = ?auto_470780 ?auto_470786 ) ) ( not ( = ?auto_470780 ?auto_470787 ) ) ( not ( = ?auto_470780 ?auto_470788 ) ) ( not ( = ?auto_470780 ?auto_470789 ) ) ( not ( = ?auto_470781 ?auto_470782 ) ) ( not ( = ?auto_470781 ?auto_470783 ) ) ( not ( = ?auto_470781 ?auto_470784 ) ) ( not ( = ?auto_470781 ?auto_470785 ) ) ( not ( = ?auto_470781 ?auto_470786 ) ) ( not ( = ?auto_470781 ?auto_470787 ) ) ( not ( = ?auto_470781 ?auto_470788 ) ) ( not ( = ?auto_470781 ?auto_470789 ) ) ( not ( = ?auto_470782 ?auto_470783 ) ) ( not ( = ?auto_470782 ?auto_470784 ) ) ( not ( = ?auto_470782 ?auto_470785 ) ) ( not ( = ?auto_470782 ?auto_470786 ) ) ( not ( = ?auto_470782 ?auto_470787 ) ) ( not ( = ?auto_470782 ?auto_470788 ) ) ( not ( = ?auto_470782 ?auto_470789 ) ) ( not ( = ?auto_470783 ?auto_470784 ) ) ( not ( = ?auto_470783 ?auto_470785 ) ) ( not ( = ?auto_470783 ?auto_470786 ) ) ( not ( = ?auto_470783 ?auto_470787 ) ) ( not ( = ?auto_470783 ?auto_470788 ) ) ( not ( = ?auto_470783 ?auto_470789 ) ) ( not ( = ?auto_470784 ?auto_470785 ) ) ( not ( = ?auto_470784 ?auto_470786 ) ) ( not ( = ?auto_470784 ?auto_470787 ) ) ( not ( = ?auto_470784 ?auto_470788 ) ) ( not ( = ?auto_470784 ?auto_470789 ) ) ( not ( = ?auto_470785 ?auto_470786 ) ) ( not ( = ?auto_470785 ?auto_470787 ) ) ( not ( = ?auto_470785 ?auto_470788 ) ) ( not ( = ?auto_470785 ?auto_470789 ) ) ( not ( = ?auto_470786 ?auto_470787 ) ) ( not ( = ?auto_470786 ?auto_470788 ) ) ( not ( = ?auto_470786 ?auto_470789 ) ) ( not ( = ?auto_470787 ?auto_470788 ) ) ( not ( = ?auto_470787 ?auto_470789 ) ) ( not ( = ?auto_470788 ?auto_470789 ) ) ( ON ?auto_470788 ?auto_470789 ) ( ON ?auto_470787 ?auto_470788 ) ( ON ?auto_470786 ?auto_470787 ) ( ON ?auto_470785 ?auto_470786 ) ( ON ?auto_470784 ?auto_470785 ) ( ON ?auto_470783 ?auto_470784 ) ( ON ?auto_470782 ?auto_470783 ) ( ON ?auto_470781 ?auto_470782 ) ( CLEAR ?auto_470779 ) ( ON ?auto_470780 ?auto_470781 ) ( CLEAR ?auto_470780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_470774 ?auto_470775 ?auto_470776 ?auto_470777 ?auto_470778 ?auto_470779 ?auto_470780 )
      ( MAKE-16PILE ?auto_470774 ?auto_470775 ?auto_470776 ?auto_470777 ?auto_470778 ?auto_470779 ?auto_470780 ?auto_470781 ?auto_470782 ?auto_470783 ?auto_470784 ?auto_470785 ?auto_470786 ?auto_470787 ?auto_470788 ?auto_470789 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470806 - BLOCK
      ?auto_470807 - BLOCK
      ?auto_470808 - BLOCK
      ?auto_470809 - BLOCK
      ?auto_470810 - BLOCK
      ?auto_470811 - BLOCK
      ?auto_470812 - BLOCK
      ?auto_470813 - BLOCK
      ?auto_470814 - BLOCK
      ?auto_470815 - BLOCK
      ?auto_470816 - BLOCK
      ?auto_470817 - BLOCK
      ?auto_470818 - BLOCK
      ?auto_470819 - BLOCK
      ?auto_470820 - BLOCK
      ?auto_470821 - BLOCK
    )
    :vars
    (
      ?auto_470822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470821 ?auto_470822 ) ( ON-TABLE ?auto_470806 ) ( ON ?auto_470807 ?auto_470806 ) ( ON ?auto_470808 ?auto_470807 ) ( ON ?auto_470809 ?auto_470808 ) ( ON ?auto_470810 ?auto_470809 ) ( not ( = ?auto_470806 ?auto_470807 ) ) ( not ( = ?auto_470806 ?auto_470808 ) ) ( not ( = ?auto_470806 ?auto_470809 ) ) ( not ( = ?auto_470806 ?auto_470810 ) ) ( not ( = ?auto_470806 ?auto_470811 ) ) ( not ( = ?auto_470806 ?auto_470812 ) ) ( not ( = ?auto_470806 ?auto_470813 ) ) ( not ( = ?auto_470806 ?auto_470814 ) ) ( not ( = ?auto_470806 ?auto_470815 ) ) ( not ( = ?auto_470806 ?auto_470816 ) ) ( not ( = ?auto_470806 ?auto_470817 ) ) ( not ( = ?auto_470806 ?auto_470818 ) ) ( not ( = ?auto_470806 ?auto_470819 ) ) ( not ( = ?auto_470806 ?auto_470820 ) ) ( not ( = ?auto_470806 ?auto_470821 ) ) ( not ( = ?auto_470806 ?auto_470822 ) ) ( not ( = ?auto_470807 ?auto_470808 ) ) ( not ( = ?auto_470807 ?auto_470809 ) ) ( not ( = ?auto_470807 ?auto_470810 ) ) ( not ( = ?auto_470807 ?auto_470811 ) ) ( not ( = ?auto_470807 ?auto_470812 ) ) ( not ( = ?auto_470807 ?auto_470813 ) ) ( not ( = ?auto_470807 ?auto_470814 ) ) ( not ( = ?auto_470807 ?auto_470815 ) ) ( not ( = ?auto_470807 ?auto_470816 ) ) ( not ( = ?auto_470807 ?auto_470817 ) ) ( not ( = ?auto_470807 ?auto_470818 ) ) ( not ( = ?auto_470807 ?auto_470819 ) ) ( not ( = ?auto_470807 ?auto_470820 ) ) ( not ( = ?auto_470807 ?auto_470821 ) ) ( not ( = ?auto_470807 ?auto_470822 ) ) ( not ( = ?auto_470808 ?auto_470809 ) ) ( not ( = ?auto_470808 ?auto_470810 ) ) ( not ( = ?auto_470808 ?auto_470811 ) ) ( not ( = ?auto_470808 ?auto_470812 ) ) ( not ( = ?auto_470808 ?auto_470813 ) ) ( not ( = ?auto_470808 ?auto_470814 ) ) ( not ( = ?auto_470808 ?auto_470815 ) ) ( not ( = ?auto_470808 ?auto_470816 ) ) ( not ( = ?auto_470808 ?auto_470817 ) ) ( not ( = ?auto_470808 ?auto_470818 ) ) ( not ( = ?auto_470808 ?auto_470819 ) ) ( not ( = ?auto_470808 ?auto_470820 ) ) ( not ( = ?auto_470808 ?auto_470821 ) ) ( not ( = ?auto_470808 ?auto_470822 ) ) ( not ( = ?auto_470809 ?auto_470810 ) ) ( not ( = ?auto_470809 ?auto_470811 ) ) ( not ( = ?auto_470809 ?auto_470812 ) ) ( not ( = ?auto_470809 ?auto_470813 ) ) ( not ( = ?auto_470809 ?auto_470814 ) ) ( not ( = ?auto_470809 ?auto_470815 ) ) ( not ( = ?auto_470809 ?auto_470816 ) ) ( not ( = ?auto_470809 ?auto_470817 ) ) ( not ( = ?auto_470809 ?auto_470818 ) ) ( not ( = ?auto_470809 ?auto_470819 ) ) ( not ( = ?auto_470809 ?auto_470820 ) ) ( not ( = ?auto_470809 ?auto_470821 ) ) ( not ( = ?auto_470809 ?auto_470822 ) ) ( not ( = ?auto_470810 ?auto_470811 ) ) ( not ( = ?auto_470810 ?auto_470812 ) ) ( not ( = ?auto_470810 ?auto_470813 ) ) ( not ( = ?auto_470810 ?auto_470814 ) ) ( not ( = ?auto_470810 ?auto_470815 ) ) ( not ( = ?auto_470810 ?auto_470816 ) ) ( not ( = ?auto_470810 ?auto_470817 ) ) ( not ( = ?auto_470810 ?auto_470818 ) ) ( not ( = ?auto_470810 ?auto_470819 ) ) ( not ( = ?auto_470810 ?auto_470820 ) ) ( not ( = ?auto_470810 ?auto_470821 ) ) ( not ( = ?auto_470810 ?auto_470822 ) ) ( not ( = ?auto_470811 ?auto_470812 ) ) ( not ( = ?auto_470811 ?auto_470813 ) ) ( not ( = ?auto_470811 ?auto_470814 ) ) ( not ( = ?auto_470811 ?auto_470815 ) ) ( not ( = ?auto_470811 ?auto_470816 ) ) ( not ( = ?auto_470811 ?auto_470817 ) ) ( not ( = ?auto_470811 ?auto_470818 ) ) ( not ( = ?auto_470811 ?auto_470819 ) ) ( not ( = ?auto_470811 ?auto_470820 ) ) ( not ( = ?auto_470811 ?auto_470821 ) ) ( not ( = ?auto_470811 ?auto_470822 ) ) ( not ( = ?auto_470812 ?auto_470813 ) ) ( not ( = ?auto_470812 ?auto_470814 ) ) ( not ( = ?auto_470812 ?auto_470815 ) ) ( not ( = ?auto_470812 ?auto_470816 ) ) ( not ( = ?auto_470812 ?auto_470817 ) ) ( not ( = ?auto_470812 ?auto_470818 ) ) ( not ( = ?auto_470812 ?auto_470819 ) ) ( not ( = ?auto_470812 ?auto_470820 ) ) ( not ( = ?auto_470812 ?auto_470821 ) ) ( not ( = ?auto_470812 ?auto_470822 ) ) ( not ( = ?auto_470813 ?auto_470814 ) ) ( not ( = ?auto_470813 ?auto_470815 ) ) ( not ( = ?auto_470813 ?auto_470816 ) ) ( not ( = ?auto_470813 ?auto_470817 ) ) ( not ( = ?auto_470813 ?auto_470818 ) ) ( not ( = ?auto_470813 ?auto_470819 ) ) ( not ( = ?auto_470813 ?auto_470820 ) ) ( not ( = ?auto_470813 ?auto_470821 ) ) ( not ( = ?auto_470813 ?auto_470822 ) ) ( not ( = ?auto_470814 ?auto_470815 ) ) ( not ( = ?auto_470814 ?auto_470816 ) ) ( not ( = ?auto_470814 ?auto_470817 ) ) ( not ( = ?auto_470814 ?auto_470818 ) ) ( not ( = ?auto_470814 ?auto_470819 ) ) ( not ( = ?auto_470814 ?auto_470820 ) ) ( not ( = ?auto_470814 ?auto_470821 ) ) ( not ( = ?auto_470814 ?auto_470822 ) ) ( not ( = ?auto_470815 ?auto_470816 ) ) ( not ( = ?auto_470815 ?auto_470817 ) ) ( not ( = ?auto_470815 ?auto_470818 ) ) ( not ( = ?auto_470815 ?auto_470819 ) ) ( not ( = ?auto_470815 ?auto_470820 ) ) ( not ( = ?auto_470815 ?auto_470821 ) ) ( not ( = ?auto_470815 ?auto_470822 ) ) ( not ( = ?auto_470816 ?auto_470817 ) ) ( not ( = ?auto_470816 ?auto_470818 ) ) ( not ( = ?auto_470816 ?auto_470819 ) ) ( not ( = ?auto_470816 ?auto_470820 ) ) ( not ( = ?auto_470816 ?auto_470821 ) ) ( not ( = ?auto_470816 ?auto_470822 ) ) ( not ( = ?auto_470817 ?auto_470818 ) ) ( not ( = ?auto_470817 ?auto_470819 ) ) ( not ( = ?auto_470817 ?auto_470820 ) ) ( not ( = ?auto_470817 ?auto_470821 ) ) ( not ( = ?auto_470817 ?auto_470822 ) ) ( not ( = ?auto_470818 ?auto_470819 ) ) ( not ( = ?auto_470818 ?auto_470820 ) ) ( not ( = ?auto_470818 ?auto_470821 ) ) ( not ( = ?auto_470818 ?auto_470822 ) ) ( not ( = ?auto_470819 ?auto_470820 ) ) ( not ( = ?auto_470819 ?auto_470821 ) ) ( not ( = ?auto_470819 ?auto_470822 ) ) ( not ( = ?auto_470820 ?auto_470821 ) ) ( not ( = ?auto_470820 ?auto_470822 ) ) ( not ( = ?auto_470821 ?auto_470822 ) ) ( ON ?auto_470820 ?auto_470821 ) ( ON ?auto_470819 ?auto_470820 ) ( ON ?auto_470818 ?auto_470819 ) ( ON ?auto_470817 ?auto_470818 ) ( ON ?auto_470816 ?auto_470817 ) ( ON ?auto_470815 ?auto_470816 ) ( ON ?auto_470814 ?auto_470815 ) ( ON ?auto_470813 ?auto_470814 ) ( ON ?auto_470812 ?auto_470813 ) ( CLEAR ?auto_470810 ) ( ON ?auto_470811 ?auto_470812 ) ( CLEAR ?auto_470811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_470806 ?auto_470807 ?auto_470808 ?auto_470809 ?auto_470810 ?auto_470811 )
      ( MAKE-16PILE ?auto_470806 ?auto_470807 ?auto_470808 ?auto_470809 ?auto_470810 ?auto_470811 ?auto_470812 ?auto_470813 ?auto_470814 ?auto_470815 ?auto_470816 ?auto_470817 ?auto_470818 ?auto_470819 ?auto_470820 ?auto_470821 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470839 - BLOCK
      ?auto_470840 - BLOCK
      ?auto_470841 - BLOCK
      ?auto_470842 - BLOCK
      ?auto_470843 - BLOCK
      ?auto_470844 - BLOCK
      ?auto_470845 - BLOCK
      ?auto_470846 - BLOCK
      ?auto_470847 - BLOCK
      ?auto_470848 - BLOCK
      ?auto_470849 - BLOCK
      ?auto_470850 - BLOCK
      ?auto_470851 - BLOCK
      ?auto_470852 - BLOCK
      ?auto_470853 - BLOCK
      ?auto_470854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_470854 ) ( ON-TABLE ?auto_470839 ) ( ON ?auto_470840 ?auto_470839 ) ( ON ?auto_470841 ?auto_470840 ) ( ON ?auto_470842 ?auto_470841 ) ( ON ?auto_470843 ?auto_470842 ) ( not ( = ?auto_470839 ?auto_470840 ) ) ( not ( = ?auto_470839 ?auto_470841 ) ) ( not ( = ?auto_470839 ?auto_470842 ) ) ( not ( = ?auto_470839 ?auto_470843 ) ) ( not ( = ?auto_470839 ?auto_470844 ) ) ( not ( = ?auto_470839 ?auto_470845 ) ) ( not ( = ?auto_470839 ?auto_470846 ) ) ( not ( = ?auto_470839 ?auto_470847 ) ) ( not ( = ?auto_470839 ?auto_470848 ) ) ( not ( = ?auto_470839 ?auto_470849 ) ) ( not ( = ?auto_470839 ?auto_470850 ) ) ( not ( = ?auto_470839 ?auto_470851 ) ) ( not ( = ?auto_470839 ?auto_470852 ) ) ( not ( = ?auto_470839 ?auto_470853 ) ) ( not ( = ?auto_470839 ?auto_470854 ) ) ( not ( = ?auto_470840 ?auto_470841 ) ) ( not ( = ?auto_470840 ?auto_470842 ) ) ( not ( = ?auto_470840 ?auto_470843 ) ) ( not ( = ?auto_470840 ?auto_470844 ) ) ( not ( = ?auto_470840 ?auto_470845 ) ) ( not ( = ?auto_470840 ?auto_470846 ) ) ( not ( = ?auto_470840 ?auto_470847 ) ) ( not ( = ?auto_470840 ?auto_470848 ) ) ( not ( = ?auto_470840 ?auto_470849 ) ) ( not ( = ?auto_470840 ?auto_470850 ) ) ( not ( = ?auto_470840 ?auto_470851 ) ) ( not ( = ?auto_470840 ?auto_470852 ) ) ( not ( = ?auto_470840 ?auto_470853 ) ) ( not ( = ?auto_470840 ?auto_470854 ) ) ( not ( = ?auto_470841 ?auto_470842 ) ) ( not ( = ?auto_470841 ?auto_470843 ) ) ( not ( = ?auto_470841 ?auto_470844 ) ) ( not ( = ?auto_470841 ?auto_470845 ) ) ( not ( = ?auto_470841 ?auto_470846 ) ) ( not ( = ?auto_470841 ?auto_470847 ) ) ( not ( = ?auto_470841 ?auto_470848 ) ) ( not ( = ?auto_470841 ?auto_470849 ) ) ( not ( = ?auto_470841 ?auto_470850 ) ) ( not ( = ?auto_470841 ?auto_470851 ) ) ( not ( = ?auto_470841 ?auto_470852 ) ) ( not ( = ?auto_470841 ?auto_470853 ) ) ( not ( = ?auto_470841 ?auto_470854 ) ) ( not ( = ?auto_470842 ?auto_470843 ) ) ( not ( = ?auto_470842 ?auto_470844 ) ) ( not ( = ?auto_470842 ?auto_470845 ) ) ( not ( = ?auto_470842 ?auto_470846 ) ) ( not ( = ?auto_470842 ?auto_470847 ) ) ( not ( = ?auto_470842 ?auto_470848 ) ) ( not ( = ?auto_470842 ?auto_470849 ) ) ( not ( = ?auto_470842 ?auto_470850 ) ) ( not ( = ?auto_470842 ?auto_470851 ) ) ( not ( = ?auto_470842 ?auto_470852 ) ) ( not ( = ?auto_470842 ?auto_470853 ) ) ( not ( = ?auto_470842 ?auto_470854 ) ) ( not ( = ?auto_470843 ?auto_470844 ) ) ( not ( = ?auto_470843 ?auto_470845 ) ) ( not ( = ?auto_470843 ?auto_470846 ) ) ( not ( = ?auto_470843 ?auto_470847 ) ) ( not ( = ?auto_470843 ?auto_470848 ) ) ( not ( = ?auto_470843 ?auto_470849 ) ) ( not ( = ?auto_470843 ?auto_470850 ) ) ( not ( = ?auto_470843 ?auto_470851 ) ) ( not ( = ?auto_470843 ?auto_470852 ) ) ( not ( = ?auto_470843 ?auto_470853 ) ) ( not ( = ?auto_470843 ?auto_470854 ) ) ( not ( = ?auto_470844 ?auto_470845 ) ) ( not ( = ?auto_470844 ?auto_470846 ) ) ( not ( = ?auto_470844 ?auto_470847 ) ) ( not ( = ?auto_470844 ?auto_470848 ) ) ( not ( = ?auto_470844 ?auto_470849 ) ) ( not ( = ?auto_470844 ?auto_470850 ) ) ( not ( = ?auto_470844 ?auto_470851 ) ) ( not ( = ?auto_470844 ?auto_470852 ) ) ( not ( = ?auto_470844 ?auto_470853 ) ) ( not ( = ?auto_470844 ?auto_470854 ) ) ( not ( = ?auto_470845 ?auto_470846 ) ) ( not ( = ?auto_470845 ?auto_470847 ) ) ( not ( = ?auto_470845 ?auto_470848 ) ) ( not ( = ?auto_470845 ?auto_470849 ) ) ( not ( = ?auto_470845 ?auto_470850 ) ) ( not ( = ?auto_470845 ?auto_470851 ) ) ( not ( = ?auto_470845 ?auto_470852 ) ) ( not ( = ?auto_470845 ?auto_470853 ) ) ( not ( = ?auto_470845 ?auto_470854 ) ) ( not ( = ?auto_470846 ?auto_470847 ) ) ( not ( = ?auto_470846 ?auto_470848 ) ) ( not ( = ?auto_470846 ?auto_470849 ) ) ( not ( = ?auto_470846 ?auto_470850 ) ) ( not ( = ?auto_470846 ?auto_470851 ) ) ( not ( = ?auto_470846 ?auto_470852 ) ) ( not ( = ?auto_470846 ?auto_470853 ) ) ( not ( = ?auto_470846 ?auto_470854 ) ) ( not ( = ?auto_470847 ?auto_470848 ) ) ( not ( = ?auto_470847 ?auto_470849 ) ) ( not ( = ?auto_470847 ?auto_470850 ) ) ( not ( = ?auto_470847 ?auto_470851 ) ) ( not ( = ?auto_470847 ?auto_470852 ) ) ( not ( = ?auto_470847 ?auto_470853 ) ) ( not ( = ?auto_470847 ?auto_470854 ) ) ( not ( = ?auto_470848 ?auto_470849 ) ) ( not ( = ?auto_470848 ?auto_470850 ) ) ( not ( = ?auto_470848 ?auto_470851 ) ) ( not ( = ?auto_470848 ?auto_470852 ) ) ( not ( = ?auto_470848 ?auto_470853 ) ) ( not ( = ?auto_470848 ?auto_470854 ) ) ( not ( = ?auto_470849 ?auto_470850 ) ) ( not ( = ?auto_470849 ?auto_470851 ) ) ( not ( = ?auto_470849 ?auto_470852 ) ) ( not ( = ?auto_470849 ?auto_470853 ) ) ( not ( = ?auto_470849 ?auto_470854 ) ) ( not ( = ?auto_470850 ?auto_470851 ) ) ( not ( = ?auto_470850 ?auto_470852 ) ) ( not ( = ?auto_470850 ?auto_470853 ) ) ( not ( = ?auto_470850 ?auto_470854 ) ) ( not ( = ?auto_470851 ?auto_470852 ) ) ( not ( = ?auto_470851 ?auto_470853 ) ) ( not ( = ?auto_470851 ?auto_470854 ) ) ( not ( = ?auto_470852 ?auto_470853 ) ) ( not ( = ?auto_470852 ?auto_470854 ) ) ( not ( = ?auto_470853 ?auto_470854 ) ) ( ON ?auto_470853 ?auto_470854 ) ( ON ?auto_470852 ?auto_470853 ) ( ON ?auto_470851 ?auto_470852 ) ( ON ?auto_470850 ?auto_470851 ) ( ON ?auto_470849 ?auto_470850 ) ( ON ?auto_470848 ?auto_470849 ) ( ON ?auto_470847 ?auto_470848 ) ( ON ?auto_470846 ?auto_470847 ) ( ON ?auto_470845 ?auto_470846 ) ( CLEAR ?auto_470843 ) ( ON ?auto_470844 ?auto_470845 ) ( CLEAR ?auto_470844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_470839 ?auto_470840 ?auto_470841 ?auto_470842 ?auto_470843 ?auto_470844 )
      ( MAKE-16PILE ?auto_470839 ?auto_470840 ?auto_470841 ?auto_470842 ?auto_470843 ?auto_470844 ?auto_470845 ?auto_470846 ?auto_470847 ?auto_470848 ?auto_470849 ?auto_470850 ?auto_470851 ?auto_470852 ?auto_470853 ?auto_470854 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470871 - BLOCK
      ?auto_470872 - BLOCK
      ?auto_470873 - BLOCK
      ?auto_470874 - BLOCK
      ?auto_470875 - BLOCK
      ?auto_470876 - BLOCK
      ?auto_470877 - BLOCK
      ?auto_470878 - BLOCK
      ?auto_470879 - BLOCK
      ?auto_470880 - BLOCK
      ?auto_470881 - BLOCK
      ?auto_470882 - BLOCK
      ?auto_470883 - BLOCK
      ?auto_470884 - BLOCK
      ?auto_470885 - BLOCK
      ?auto_470886 - BLOCK
    )
    :vars
    (
      ?auto_470887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470886 ?auto_470887 ) ( ON-TABLE ?auto_470871 ) ( ON ?auto_470872 ?auto_470871 ) ( ON ?auto_470873 ?auto_470872 ) ( ON ?auto_470874 ?auto_470873 ) ( not ( = ?auto_470871 ?auto_470872 ) ) ( not ( = ?auto_470871 ?auto_470873 ) ) ( not ( = ?auto_470871 ?auto_470874 ) ) ( not ( = ?auto_470871 ?auto_470875 ) ) ( not ( = ?auto_470871 ?auto_470876 ) ) ( not ( = ?auto_470871 ?auto_470877 ) ) ( not ( = ?auto_470871 ?auto_470878 ) ) ( not ( = ?auto_470871 ?auto_470879 ) ) ( not ( = ?auto_470871 ?auto_470880 ) ) ( not ( = ?auto_470871 ?auto_470881 ) ) ( not ( = ?auto_470871 ?auto_470882 ) ) ( not ( = ?auto_470871 ?auto_470883 ) ) ( not ( = ?auto_470871 ?auto_470884 ) ) ( not ( = ?auto_470871 ?auto_470885 ) ) ( not ( = ?auto_470871 ?auto_470886 ) ) ( not ( = ?auto_470871 ?auto_470887 ) ) ( not ( = ?auto_470872 ?auto_470873 ) ) ( not ( = ?auto_470872 ?auto_470874 ) ) ( not ( = ?auto_470872 ?auto_470875 ) ) ( not ( = ?auto_470872 ?auto_470876 ) ) ( not ( = ?auto_470872 ?auto_470877 ) ) ( not ( = ?auto_470872 ?auto_470878 ) ) ( not ( = ?auto_470872 ?auto_470879 ) ) ( not ( = ?auto_470872 ?auto_470880 ) ) ( not ( = ?auto_470872 ?auto_470881 ) ) ( not ( = ?auto_470872 ?auto_470882 ) ) ( not ( = ?auto_470872 ?auto_470883 ) ) ( not ( = ?auto_470872 ?auto_470884 ) ) ( not ( = ?auto_470872 ?auto_470885 ) ) ( not ( = ?auto_470872 ?auto_470886 ) ) ( not ( = ?auto_470872 ?auto_470887 ) ) ( not ( = ?auto_470873 ?auto_470874 ) ) ( not ( = ?auto_470873 ?auto_470875 ) ) ( not ( = ?auto_470873 ?auto_470876 ) ) ( not ( = ?auto_470873 ?auto_470877 ) ) ( not ( = ?auto_470873 ?auto_470878 ) ) ( not ( = ?auto_470873 ?auto_470879 ) ) ( not ( = ?auto_470873 ?auto_470880 ) ) ( not ( = ?auto_470873 ?auto_470881 ) ) ( not ( = ?auto_470873 ?auto_470882 ) ) ( not ( = ?auto_470873 ?auto_470883 ) ) ( not ( = ?auto_470873 ?auto_470884 ) ) ( not ( = ?auto_470873 ?auto_470885 ) ) ( not ( = ?auto_470873 ?auto_470886 ) ) ( not ( = ?auto_470873 ?auto_470887 ) ) ( not ( = ?auto_470874 ?auto_470875 ) ) ( not ( = ?auto_470874 ?auto_470876 ) ) ( not ( = ?auto_470874 ?auto_470877 ) ) ( not ( = ?auto_470874 ?auto_470878 ) ) ( not ( = ?auto_470874 ?auto_470879 ) ) ( not ( = ?auto_470874 ?auto_470880 ) ) ( not ( = ?auto_470874 ?auto_470881 ) ) ( not ( = ?auto_470874 ?auto_470882 ) ) ( not ( = ?auto_470874 ?auto_470883 ) ) ( not ( = ?auto_470874 ?auto_470884 ) ) ( not ( = ?auto_470874 ?auto_470885 ) ) ( not ( = ?auto_470874 ?auto_470886 ) ) ( not ( = ?auto_470874 ?auto_470887 ) ) ( not ( = ?auto_470875 ?auto_470876 ) ) ( not ( = ?auto_470875 ?auto_470877 ) ) ( not ( = ?auto_470875 ?auto_470878 ) ) ( not ( = ?auto_470875 ?auto_470879 ) ) ( not ( = ?auto_470875 ?auto_470880 ) ) ( not ( = ?auto_470875 ?auto_470881 ) ) ( not ( = ?auto_470875 ?auto_470882 ) ) ( not ( = ?auto_470875 ?auto_470883 ) ) ( not ( = ?auto_470875 ?auto_470884 ) ) ( not ( = ?auto_470875 ?auto_470885 ) ) ( not ( = ?auto_470875 ?auto_470886 ) ) ( not ( = ?auto_470875 ?auto_470887 ) ) ( not ( = ?auto_470876 ?auto_470877 ) ) ( not ( = ?auto_470876 ?auto_470878 ) ) ( not ( = ?auto_470876 ?auto_470879 ) ) ( not ( = ?auto_470876 ?auto_470880 ) ) ( not ( = ?auto_470876 ?auto_470881 ) ) ( not ( = ?auto_470876 ?auto_470882 ) ) ( not ( = ?auto_470876 ?auto_470883 ) ) ( not ( = ?auto_470876 ?auto_470884 ) ) ( not ( = ?auto_470876 ?auto_470885 ) ) ( not ( = ?auto_470876 ?auto_470886 ) ) ( not ( = ?auto_470876 ?auto_470887 ) ) ( not ( = ?auto_470877 ?auto_470878 ) ) ( not ( = ?auto_470877 ?auto_470879 ) ) ( not ( = ?auto_470877 ?auto_470880 ) ) ( not ( = ?auto_470877 ?auto_470881 ) ) ( not ( = ?auto_470877 ?auto_470882 ) ) ( not ( = ?auto_470877 ?auto_470883 ) ) ( not ( = ?auto_470877 ?auto_470884 ) ) ( not ( = ?auto_470877 ?auto_470885 ) ) ( not ( = ?auto_470877 ?auto_470886 ) ) ( not ( = ?auto_470877 ?auto_470887 ) ) ( not ( = ?auto_470878 ?auto_470879 ) ) ( not ( = ?auto_470878 ?auto_470880 ) ) ( not ( = ?auto_470878 ?auto_470881 ) ) ( not ( = ?auto_470878 ?auto_470882 ) ) ( not ( = ?auto_470878 ?auto_470883 ) ) ( not ( = ?auto_470878 ?auto_470884 ) ) ( not ( = ?auto_470878 ?auto_470885 ) ) ( not ( = ?auto_470878 ?auto_470886 ) ) ( not ( = ?auto_470878 ?auto_470887 ) ) ( not ( = ?auto_470879 ?auto_470880 ) ) ( not ( = ?auto_470879 ?auto_470881 ) ) ( not ( = ?auto_470879 ?auto_470882 ) ) ( not ( = ?auto_470879 ?auto_470883 ) ) ( not ( = ?auto_470879 ?auto_470884 ) ) ( not ( = ?auto_470879 ?auto_470885 ) ) ( not ( = ?auto_470879 ?auto_470886 ) ) ( not ( = ?auto_470879 ?auto_470887 ) ) ( not ( = ?auto_470880 ?auto_470881 ) ) ( not ( = ?auto_470880 ?auto_470882 ) ) ( not ( = ?auto_470880 ?auto_470883 ) ) ( not ( = ?auto_470880 ?auto_470884 ) ) ( not ( = ?auto_470880 ?auto_470885 ) ) ( not ( = ?auto_470880 ?auto_470886 ) ) ( not ( = ?auto_470880 ?auto_470887 ) ) ( not ( = ?auto_470881 ?auto_470882 ) ) ( not ( = ?auto_470881 ?auto_470883 ) ) ( not ( = ?auto_470881 ?auto_470884 ) ) ( not ( = ?auto_470881 ?auto_470885 ) ) ( not ( = ?auto_470881 ?auto_470886 ) ) ( not ( = ?auto_470881 ?auto_470887 ) ) ( not ( = ?auto_470882 ?auto_470883 ) ) ( not ( = ?auto_470882 ?auto_470884 ) ) ( not ( = ?auto_470882 ?auto_470885 ) ) ( not ( = ?auto_470882 ?auto_470886 ) ) ( not ( = ?auto_470882 ?auto_470887 ) ) ( not ( = ?auto_470883 ?auto_470884 ) ) ( not ( = ?auto_470883 ?auto_470885 ) ) ( not ( = ?auto_470883 ?auto_470886 ) ) ( not ( = ?auto_470883 ?auto_470887 ) ) ( not ( = ?auto_470884 ?auto_470885 ) ) ( not ( = ?auto_470884 ?auto_470886 ) ) ( not ( = ?auto_470884 ?auto_470887 ) ) ( not ( = ?auto_470885 ?auto_470886 ) ) ( not ( = ?auto_470885 ?auto_470887 ) ) ( not ( = ?auto_470886 ?auto_470887 ) ) ( ON ?auto_470885 ?auto_470886 ) ( ON ?auto_470884 ?auto_470885 ) ( ON ?auto_470883 ?auto_470884 ) ( ON ?auto_470882 ?auto_470883 ) ( ON ?auto_470881 ?auto_470882 ) ( ON ?auto_470880 ?auto_470881 ) ( ON ?auto_470879 ?auto_470880 ) ( ON ?auto_470878 ?auto_470879 ) ( ON ?auto_470877 ?auto_470878 ) ( ON ?auto_470876 ?auto_470877 ) ( CLEAR ?auto_470874 ) ( ON ?auto_470875 ?auto_470876 ) ( CLEAR ?auto_470875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_470871 ?auto_470872 ?auto_470873 ?auto_470874 ?auto_470875 )
      ( MAKE-16PILE ?auto_470871 ?auto_470872 ?auto_470873 ?auto_470874 ?auto_470875 ?auto_470876 ?auto_470877 ?auto_470878 ?auto_470879 ?auto_470880 ?auto_470881 ?auto_470882 ?auto_470883 ?auto_470884 ?auto_470885 ?auto_470886 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470904 - BLOCK
      ?auto_470905 - BLOCK
      ?auto_470906 - BLOCK
      ?auto_470907 - BLOCK
      ?auto_470908 - BLOCK
      ?auto_470909 - BLOCK
      ?auto_470910 - BLOCK
      ?auto_470911 - BLOCK
      ?auto_470912 - BLOCK
      ?auto_470913 - BLOCK
      ?auto_470914 - BLOCK
      ?auto_470915 - BLOCK
      ?auto_470916 - BLOCK
      ?auto_470917 - BLOCK
      ?auto_470918 - BLOCK
      ?auto_470919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_470919 ) ( ON-TABLE ?auto_470904 ) ( ON ?auto_470905 ?auto_470904 ) ( ON ?auto_470906 ?auto_470905 ) ( ON ?auto_470907 ?auto_470906 ) ( not ( = ?auto_470904 ?auto_470905 ) ) ( not ( = ?auto_470904 ?auto_470906 ) ) ( not ( = ?auto_470904 ?auto_470907 ) ) ( not ( = ?auto_470904 ?auto_470908 ) ) ( not ( = ?auto_470904 ?auto_470909 ) ) ( not ( = ?auto_470904 ?auto_470910 ) ) ( not ( = ?auto_470904 ?auto_470911 ) ) ( not ( = ?auto_470904 ?auto_470912 ) ) ( not ( = ?auto_470904 ?auto_470913 ) ) ( not ( = ?auto_470904 ?auto_470914 ) ) ( not ( = ?auto_470904 ?auto_470915 ) ) ( not ( = ?auto_470904 ?auto_470916 ) ) ( not ( = ?auto_470904 ?auto_470917 ) ) ( not ( = ?auto_470904 ?auto_470918 ) ) ( not ( = ?auto_470904 ?auto_470919 ) ) ( not ( = ?auto_470905 ?auto_470906 ) ) ( not ( = ?auto_470905 ?auto_470907 ) ) ( not ( = ?auto_470905 ?auto_470908 ) ) ( not ( = ?auto_470905 ?auto_470909 ) ) ( not ( = ?auto_470905 ?auto_470910 ) ) ( not ( = ?auto_470905 ?auto_470911 ) ) ( not ( = ?auto_470905 ?auto_470912 ) ) ( not ( = ?auto_470905 ?auto_470913 ) ) ( not ( = ?auto_470905 ?auto_470914 ) ) ( not ( = ?auto_470905 ?auto_470915 ) ) ( not ( = ?auto_470905 ?auto_470916 ) ) ( not ( = ?auto_470905 ?auto_470917 ) ) ( not ( = ?auto_470905 ?auto_470918 ) ) ( not ( = ?auto_470905 ?auto_470919 ) ) ( not ( = ?auto_470906 ?auto_470907 ) ) ( not ( = ?auto_470906 ?auto_470908 ) ) ( not ( = ?auto_470906 ?auto_470909 ) ) ( not ( = ?auto_470906 ?auto_470910 ) ) ( not ( = ?auto_470906 ?auto_470911 ) ) ( not ( = ?auto_470906 ?auto_470912 ) ) ( not ( = ?auto_470906 ?auto_470913 ) ) ( not ( = ?auto_470906 ?auto_470914 ) ) ( not ( = ?auto_470906 ?auto_470915 ) ) ( not ( = ?auto_470906 ?auto_470916 ) ) ( not ( = ?auto_470906 ?auto_470917 ) ) ( not ( = ?auto_470906 ?auto_470918 ) ) ( not ( = ?auto_470906 ?auto_470919 ) ) ( not ( = ?auto_470907 ?auto_470908 ) ) ( not ( = ?auto_470907 ?auto_470909 ) ) ( not ( = ?auto_470907 ?auto_470910 ) ) ( not ( = ?auto_470907 ?auto_470911 ) ) ( not ( = ?auto_470907 ?auto_470912 ) ) ( not ( = ?auto_470907 ?auto_470913 ) ) ( not ( = ?auto_470907 ?auto_470914 ) ) ( not ( = ?auto_470907 ?auto_470915 ) ) ( not ( = ?auto_470907 ?auto_470916 ) ) ( not ( = ?auto_470907 ?auto_470917 ) ) ( not ( = ?auto_470907 ?auto_470918 ) ) ( not ( = ?auto_470907 ?auto_470919 ) ) ( not ( = ?auto_470908 ?auto_470909 ) ) ( not ( = ?auto_470908 ?auto_470910 ) ) ( not ( = ?auto_470908 ?auto_470911 ) ) ( not ( = ?auto_470908 ?auto_470912 ) ) ( not ( = ?auto_470908 ?auto_470913 ) ) ( not ( = ?auto_470908 ?auto_470914 ) ) ( not ( = ?auto_470908 ?auto_470915 ) ) ( not ( = ?auto_470908 ?auto_470916 ) ) ( not ( = ?auto_470908 ?auto_470917 ) ) ( not ( = ?auto_470908 ?auto_470918 ) ) ( not ( = ?auto_470908 ?auto_470919 ) ) ( not ( = ?auto_470909 ?auto_470910 ) ) ( not ( = ?auto_470909 ?auto_470911 ) ) ( not ( = ?auto_470909 ?auto_470912 ) ) ( not ( = ?auto_470909 ?auto_470913 ) ) ( not ( = ?auto_470909 ?auto_470914 ) ) ( not ( = ?auto_470909 ?auto_470915 ) ) ( not ( = ?auto_470909 ?auto_470916 ) ) ( not ( = ?auto_470909 ?auto_470917 ) ) ( not ( = ?auto_470909 ?auto_470918 ) ) ( not ( = ?auto_470909 ?auto_470919 ) ) ( not ( = ?auto_470910 ?auto_470911 ) ) ( not ( = ?auto_470910 ?auto_470912 ) ) ( not ( = ?auto_470910 ?auto_470913 ) ) ( not ( = ?auto_470910 ?auto_470914 ) ) ( not ( = ?auto_470910 ?auto_470915 ) ) ( not ( = ?auto_470910 ?auto_470916 ) ) ( not ( = ?auto_470910 ?auto_470917 ) ) ( not ( = ?auto_470910 ?auto_470918 ) ) ( not ( = ?auto_470910 ?auto_470919 ) ) ( not ( = ?auto_470911 ?auto_470912 ) ) ( not ( = ?auto_470911 ?auto_470913 ) ) ( not ( = ?auto_470911 ?auto_470914 ) ) ( not ( = ?auto_470911 ?auto_470915 ) ) ( not ( = ?auto_470911 ?auto_470916 ) ) ( not ( = ?auto_470911 ?auto_470917 ) ) ( not ( = ?auto_470911 ?auto_470918 ) ) ( not ( = ?auto_470911 ?auto_470919 ) ) ( not ( = ?auto_470912 ?auto_470913 ) ) ( not ( = ?auto_470912 ?auto_470914 ) ) ( not ( = ?auto_470912 ?auto_470915 ) ) ( not ( = ?auto_470912 ?auto_470916 ) ) ( not ( = ?auto_470912 ?auto_470917 ) ) ( not ( = ?auto_470912 ?auto_470918 ) ) ( not ( = ?auto_470912 ?auto_470919 ) ) ( not ( = ?auto_470913 ?auto_470914 ) ) ( not ( = ?auto_470913 ?auto_470915 ) ) ( not ( = ?auto_470913 ?auto_470916 ) ) ( not ( = ?auto_470913 ?auto_470917 ) ) ( not ( = ?auto_470913 ?auto_470918 ) ) ( not ( = ?auto_470913 ?auto_470919 ) ) ( not ( = ?auto_470914 ?auto_470915 ) ) ( not ( = ?auto_470914 ?auto_470916 ) ) ( not ( = ?auto_470914 ?auto_470917 ) ) ( not ( = ?auto_470914 ?auto_470918 ) ) ( not ( = ?auto_470914 ?auto_470919 ) ) ( not ( = ?auto_470915 ?auto_470916 ) ) ( not ( = ?auto_470915 ?auto_470917 ) ) ( not ( = ?auto_470915 ?auto_470918 ) ) ( not ( = ?auto_470915 ?auto_470919 ) ) ( not ( = ?auto_470916 ?auto_470917 ) ) ( not ( = ?auto_470916 ?auto_470918 ) ) ( not ( = ?auto_470916 ?auto_470919 ) ) ( not ( = ?auto_470917 ?auto_470918 ) ) ( not ( = ?auto_470917 ?auto_470919 ) ) ( not ( = ?auto_470918 ?auto_470919 ) ) ( ON ?auto_470918 ?auto_470919 ) ( ON ?auto_470917 ?auto_470918 ) ( ON ?auto_470916 ?auto_470917 ) ( ON ?auto_470915 ?auto_470916 ) ( ON ?auto_470914 ?auto_470915 ) ( ON ?auto_470913 ?auto_470914 ) ( ON ?auto_470912 ?auto_470913 ) ( ON ?auto_470911 ?auto_470912 ) ( ON ?auto_470910 ?auto_470911 ) ( ON ?auto_470909 ?auto_470910 ) ( CLEAR ?auto_470907 ) ( ON ?auto_470908 ?auto_470909 ) ( CLEAR ?auto_470908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_470904 ?auto_470905 ?auto_470906 ?auto_470907 ?auto_470908 )
      ( MAKE-16PILE ?auto_470904 ?auto_470905 ?auto_470906 ?auto_470907 ?auto_470908 ?auto_470909 ?auto_470910 ?auto_470911 ?auto_470912 ?auto_470913 ?auto_470914 ?auto_470915 ?auto_470916 ?auto_470917 ?auto_470918 ?auto_470919 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470936 - BLOCK
      ?auto_470937 - BLOCK
      ?auto_470938 - BLOCK
      ?auto_470939 - BLOCK
      ?auto_470940 - BLOCK
      ?auto_470941 - BLOCK
      ?auto_470942 - BLOCK
      ?auto_470943 - BLOCK
      ?auto_470944 - BLOCK
      ?auto_470945 - BLOCK
      ?auto_470946 - BLOCK
      ?auto_470947 - BLOCK
      ?auto_470948 - BLOCK
      ?auto_470949 - BLOCK
      ?auto_470950 - BLOCK
      ?auto_470951 - BLOCK
    )
    :vars
    (
      ?auto_470952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_470951 ?auto_470952 ) ( ON-TABLE ?auto_470936 ) ( ON ?auto_470937 ?auto_470936 ) ( ON ?auto_470938 ?auto_470937 ) ( not ( = ?auto_470936 ?auto_470937 ) ) ( not ( = ?auto_470936 ?auto_470938 ) ) ( not ( = ?auto_470936 ?auto_470939 ) ) ( not ( = ?auto_470936 ?auto_470940 ) ) ( not ( = ?auto_470936 ?auto_470941 ) ) ( not ( = ?auto_470936 ?auto_470942 ) ) ( not ( = ?auto_470936 ?auto_470943 ) ) ( not ( = ?auto_470936 ?auto_470944 ) ) ( not ( = ?auto_470936 ?auto_470945 ) ) ( not ( = ?auto_470936 ?auto_470946 ) ) ( not ( = ?auto_470936 ?auto_470947 ) ) ( not ( = ?auto_470936 ?auto_470948 ) ) ( not ( = ?auto_470936 ?auto_470949 ) ) ( not ( = ?auto_470936 ?auto_470950 ) ) ( not ( = ?auto_470936 ?auto_470951 ) ) ( not ( = ?auto_470936 ?auto_470952 ) ) ( not ( = ?auto_470937 ?auto_470938 ) ) ( not ( = ?auto_470937 ?auto_470939 ) ) ( not ( = ?auto_470937 ?auto_470940 ) ) ( not ( = ?auto_470937 ?auto_470941 ) ) ( not ( = ?auto_470937 ?auto_470942 ) ) ( not ( = ?auto_470937 ?auto_470943 ) ) ( not ( = ?auto_470937 ?auto_470944 ) ) ( not ( = ?auto_470937 ?auto_470945 ) ) ( not ( = ?auto_470937 ?auto_470946 ) ) ( not ( = ?auto_470937 ?auto_470947 ) ) ( not ( = ?auto_470937 ?auto_470948 ) ) ( not ( = ?auto_470937 ?auto_470949 ) ) ( not ( = ?auto_470937 ?auto_470950 ) ) ( not ( = ?auto_470937 ?auto_470951 ) ) ( not ( = ?auto_470937 ?auto_470952 ) ) ( not ( = ?auto_470938 ?auto_470939 ) ) ( not ( = ?auto_470938 ?auto_470940 ) ) ( not ( = ?auto_470938 ?auto_470941 ) ) ( not ( = ?auto_470938 ?auto_470942 ) ) ( not ( = ?auto_470938 ?auto_470943 ) ) ( not ( = ?auto_470938 ?auto_470944 ) ) ( not ( = ?auto_470938 ?auto_470945 ) ) ( not ( = ?auto_470938 ?auto_470946 ) ) ( not ( = ?auto_470938 ?auto_470947 ) ) ( not ( = ?auto_470938 ?auto_470948 ) ) ( not ( = ?auto_470938 ?auto_470949 ) ) ( not ( = ?auto_470938 ?auto_470950 ) ) ( not ( = ?auto_470938 ?auto_470951 ) ) ( not ( = ?auto_470938 ?auto_470952 ) ) ( not ( = ?auto_470939 ?auto_470940 ) ) ( not ( = ?auto_470939 ?auto_470941 ) ) ( not ( = ?auto_470939 ?auto_470942 ) ) ( not ( = ?auto_470939 ?auto_470943 ) ) ( not ( = ?auto_470939 ?auto_470944 ) ) ( not ( = ?auto_470939 ?auto_470945 ) ) ( not ( = ?auto_470939 ?auto_470946 ) ) ( not ( = ?auto_470939 ?auto_470947 ) ) ( not ( = ?auto_470939 ?auto_470948 ) ) ( not ( = ?auto_470939 ?auto_470949 ) ) ( not ( = ?auto_470939 ?auto_470950 ) ) ( not ( = ?auto_470939 ?auto_470951 ) ) ( not ( = ?auto_470939 ?auto_470952 ) ) ( not ( = ?auto_470940 ?auto_470941 ) ) ( not ( = ?auto_470940 ?auto_470942 ) ) ( not ( = ?auto_470940 ?auto_470943 ) ) ( not ( = ?auto_470940 ?auto_470944 ) ) ( not ( = ?auto_470940 ?auto_470945 ) ) ( not ( = ?auto_470940 ?auto_470946 ) ) ( not ( = ?auto_470940 ?auto_470947 ) ) ( not ( = ?auto_470940 ?auto_470948 ) ) ( not ( = ?auto_470940 ?auto_470949 ) ) ( not ( = ?auto_470940 ?auto_470950 ) ) ( not ( = ?auto_470940 ?auto_470951 ) ) ( not ( = ?auto_470940 ?auto_470952 ) ) ( not ( = ?auto_470941 ?auto_470942 ) ) ( not ( = ?auto_470941 ?auto_470943 ) ) ( not ( = ?auto_470941 ?auto_470944 ) ) ( not ( = ?auto_470941 ?auto_470945 ) ) ( not ( = ?auto_470941 ?auto_470946 ) ) ( not ( = ?auto_470941 ?auto_470947 ) ) ( not ( = ?auto_470941 ?auto_470948 ) ) ( not ( = ?auto_470941 ?auto_470949 ) ) ( not ( = ?auto_470941 ?auto_470950 ) ) ( not ( = ?auto_470941 ?auto_470951 ) ) ( not ( = ?auto_470941 ?auto_470952 ) ) ( not ( = ?auto_470942 ?auto_470943 ) ) ( not ( = ?auto_470942 ?auto_470944 ) ) ( not ( = ?auto_470942 ?auto_470945 ) ) ( not ( = ?auto_470942 ?auto_470946 ) ) ( not ( = ?auto_470942 ?auto_470947 ) ) ( not ( = ?auto_470942 ?auto_470948 ) ) ( not ( = ?auto_470942 ?auto_470949 ) ) ( not ( = ?auto_470942 ?auto_470950 ) ) ( not ( = ?auto_470942 ?auto_470951 ) ) ( not ( = ?auto_470942 ?auto_470952 ) ) ( not ( = ?auto_470943 ?auto_470944 ) ) ( not ( = ?auto_470943 ?auto_470945 ) ) ( not ( = ?auto_470943 ?auto_470946 ) ) ( not ( = ?auto_470943 ?auto_470947 ) ) ( not ( = ?auto_470943 ?auto_470948 ) ) ( not ( = ?auto_470943 ?auto_470949 ) ) ( not ( = ?auto_470943 ?auto_470950 ) ) ( not ( = ?auto_470943 ?auto_470951 ) ) ( not ( = ?auto_470943 ?auto_470952 ) ) ( not ( = ?auto_470944 ?auto_470945 ) ) ( not ( = ?auto_470944 ?auto_470946 ) ) ( not ( = ?auto_470944 ?auto_470947 ) ) ( not ( = ?auto_470944 ?auto_470948 ) ) ( not ( = ?auto_470944 ?auto_470949 ) ) ( not ( = ?auto_470944 ?auto_470950 ) ) ( not ( = ?auto_470944 ?auto_470951 ) ) ( not ( = ?auto_470944 ?auto_470952 ) ) ( not ( = ?auto_470945 ?auto_470946 ) ) ( not ( = ?auto_470945 ?auto_470947 ) ) ( not ( = ?auto_470945 ?auto_470948 ) ) ( not ( = ?auto_470945 ?auto_470949 ) ) ( not ( = ?auto_470945 ?auto_470950 ) ) ( not ( = ?auto_470945 ?auto_470951 ) ) ( not ( = ?auto_470945 ?auto_470952 ) ) ( not ( = ?auto_470946 ?auto_470947 ) ) ( not ( = ?auto_470946 ?auto_470948 ) ) ( not ( = ?auto_470946 ?auto_470949 ) ) ( not ( = ?auto_470946 ?auto_470950 ) ) ( not ( = ?auto_470946 ?auto_470951 ) ) ( not ( = ?auto_470946 ?auto_470952 ) ) ( not ( = ?auto_470947 ?auto_470948 ) ) ( not ( = ?auto_470947 ?auto_470949 ) ) ( not ( = ?auto_470947 ?auto_470950 ) ) ( not ( = ?auto_470947 ?auto_470951 ) ) ( not ( = ?auto_470947 ?auto_470952 ) ) ( not ( = ?auto_470948 ?auto_470949 ) ) ( not ( = ?auto_470948 ?auto_470950 ) ) ( not ( = ?auto_470948 ?auto_470951 ) ) ( not ( = ?auto_470948 ?auto_470952 ) ) ( not ( = ?auto_470949 ?auto_470950 ) ) ( not ( = ?auto_470949 ?auto_470951 ) ) ( not ( = ?auto_470949 ?auto_470952 ) ) ( not ( = ?auto_470950 ?auto_470951 ) ) ( not ( = ?auto_470950 ?auto_470952 ) ) ( not ( = ?auto_470951 ?auto_470952 ) ) ( ON ?auto_470950 ?auto_470951 ) ( ON ?auto_470949 ?auto_470950 ) ( ON ?auto_470948 ?auto_470949 ) ( ON ?auto_470947 ?auto_470948 ) ( ON ?auto_470946 ?auto_470947 ) ( ON ?auto_470945 ?auto_470946 ) ( ON ?auto_470944 ?auto_470945 ) ( ON ?auto_470943 ?auto_470944 ) ( ON ?auto_470942 ?auto_470943 ) ( ON ?auto_470941 ?auto_470942 ) ( ON ?auto_470940 ?auto_470941 ) ( CLEAR ?auto_470938 ) ( ON ?auto_470939 ?auto_470940 ) ( CLEAR ?auto_470939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_470936 ?auto_470937 ?auto_470938 ?auto_470939 )
      ( MAKE-16PILE ?auto_470936 ?auto_470937 ?auto_470938 ?auto_470939 ?auto_470940 ?auto_470941 ?auto_470942 ?auto_470943 ?auto_470944 ?auto_470945 ?auto_470946 ?auto_470947 ?auto_470948 ?auto_470949 ?auto_470950 ?auto_470951 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_470969 - BLOCK
      ?auto_470970 - BLOCK
      ?auto_470971 - BLOCK
      ?auto_470972 - BLOCK
      ?auto_470973 - BLOCK
      ?auto_470974 - BLOCK
      ?auto_470975 - BLOCK
      ?auto_470976 - BLOCK
      ?auto_470977 - BLOCK
      ?auto_470978 - BLOCK
      ?auto_470979 - BLOCK
      ?auto_470980 - BLOCK
      ?auto_470981 - BLOCK
      ?auto_470982 - BLOCK
      ?auto_470983 - BLOCK
      ?auto_470984 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_470984 ) ( ON-TABLE ?auto_470969 ) ( ON ?auto_470970 ?auto_470969 ) ( ON ?auto_470971 ?auto_470970 ) ( not ( = ?auto_470969 ?auto_470970 ) ) ( not ( = ?auto_470969 ?auto_470971 ) ) ( not ( = ?auto_470969 ?auto_470972 ) ) ( not ( = ?auto_470969 ?auto_470973 ) ) ( not ( = ?auto_470969 ?auto_470974 ) ) ( not ( = ?auto_470969 ?auto_470975 ) ) ( not ( = ?auto_470969 ?auto_470976 ) ) ( not ( = ?auto_470969 ?auto_470977 ) ) ( not ( = ?auto_470969 ?auto_470978 ) ) ( not ( = ?auto_470969 ?auto_470979 ) ) ( not ( = ?auto_470969 ?auto_470980 ) ) ( not ( = ?auto_470969 ?auto_470981 ) ) ( not ( = ?auto_470969 ?auto_470982 ) ) ( not ( = ?auto_470969 ?auto_470983 ) ) ( not ( = ?auto_470969 ?auto_470984 ) ) ( not ( = ?auto_470970 ?auto_470971 ) ) ( not ( = ?auto_470970 ?auto_470972 ) ) ( not ( = ?auto_470970 ?auto_470973 ) ) ( not ( = ?auto_470970 ?auto_470974 ) ) ( not ( = ?auto_470970 ?auto_470975 ) ) ( not ( = ?auto_470970 ?auto_470976 ) ) ( not ( = ?auto_470970 ?auto_470977 ) ) ( not ( = ?auto_470970 ?auto_470978 ) ) ( not ( = ?auto_470970 ?auto_470979 ) ) ( not ( = ?auto_470970 ?auto_470980 ) ) ( not ( = ?auto_470970 ?auto_470981 ) ) ( not ( = ?auto_470970 ?auto_470982 ) ) ( not ( = ?auto_470970 ?auto_470983 ) ) ( not ( = ?auto_470970 ?auto_470984 ) ) ( not ( = ?auto_470971 ?auto_470972 ) ) ( not ( = ?auto_470971 ?auto_470973 ) ) ( not ( = ?auto_470971 ?auto_470974 ) ) ( not ( = ?auto_470971 ?auto_470975 ) ) ( not ( = ?auto_470971 ?auto_470976 ) ) ( not ( = ?auto_470971 ?auto_470977 ) ) ( not ( = ?auto_470971 ?auto_470978 ) ) ( not ( = ?auto_470971 ?auto_470979 ) ) ( not ( = ?auto_470971 ?auto_470980 ) ) ( not ( = ?auto_470971 ?auto_470981 ) ) ( not ( = ?auto_470971 ?auto_470982 ) ) ( not ( = ?auto_470971 ?auto_470983 ) ) ( not ( = ?auto_470971 ?auto_470984 ) ) ( not ( = ?auto_470972 ?auto_470973 ) ) ( not ( = ?auto_470972 ?auto_470974 ) ) ( not ( = ?auto_470972 ?auto_470975 ) ) ( not ( = ?auto_470972 ?auto_470976 ) ) ( not ( = ?auto_470972 ?auto_470977 ) ) ( not ( = ?auto_470972 ?auto_470978 ) ) ( not ( = ?auto_470972 ?auto_470979 ) ) ( not ( = ?auto_470972 ?auto_470980 ) ) ( not ( = ?auto_470972 ?auto_470981 ) ) ( not ( = ?auto_470972 ?auto_470982 ) ) ( not ( = ?auto_470972 ?auto_470983 ) ) ( not ( = ?auto_470972 ?auto_470984 ) ) ( not ( = ?auto_470973 ?auto_470974 ) ) ( not ( = ?auto_470973 ?auto_470975 ) ) ( not ( = ?auto_470973 ?auto_470976 ) ) ( not ( = ?auto_470973 ?auto_470977 ) ) ( not ( = ?auto_470973 ?auto_470978 ) ) ( not ( = ?auto_470973 ?auto_470979 ) ) ( not ( = ?auto_470973 ?auto_470980 ) ) ( not ( = ?auto_470973 ?auto_470981 ) ) ( not ( = ?auto_470973 ?auto_470982 ) ) ( not ( = ?auto_470973 ?auto_470983 ) ) ( not ( = ?auto_470973 ?auto_470984 ) ) ( not ( = ?auto_470974 ?auto_470975 ) ) ( not ( = ?auto_470974 ?auto_470976 ) ) ( not ( = ?auto_470974 ?auto_470977 ) ) ( not ( = ?auto_470974 ?auto_470978 ) ) ( not ( = ?auto_470974 ?auto_470979 ) ) ( not ( = ?auto_470974 ?auto_470980 ) ) ( not ( = ?auto_470974 ?auto_470981 ) ) ( not ( = ?auto_470974 ?auto_470982 ) ) ( not ( = ?auto_470974 ?auto_470983 ) ) ( not ( = ?auto_470974 ?auto_470984 ) ) ( not ( = ?auto_470975 ?auto_470976 ) ) ( not ( = ?auto_470975 ?auto_470977 ) ) ( not ( = ?auto_470975 ?auto_470978 ) ) ( not ( = ?auto_470975 ?auto_470979 ) ) ( not ( = ?auto_470975 ?auto_470980 ) ) ( not ( = ?auto_470975 ?auto_470981 ) ) ( not ( = ?auto_470975 ?auto_470982 ) ) ( not ( = ?auto_470975 ?auto_470983 ) ) ( not ( = ?auto_470975 ?auto_470984 ) ) ( not ( = ?auto_470976 ?auto_470977 ) ) ( not ( = ?auto_470976 ?auto_470978 ) ) ( not ( = ?auto_470976 ?auto_470979 ) ) ( not ( = ?auto_470976 ?auto_470980 ) ) ( not ( = ?auto_470976 ?auto_470981 ) ) ( not ( = ?auto_470976 ?auto_470982 ) ) ( not ( = ?auto_470976 ?auto_470983 ) ) ( not ( = ?auto_470976 ?auto_470984 ) ) ( not ( = ?auto_470977 ?auto_470978 ) ) ( not ( = ?auto_470977 ?auto_470979 ) ) ( not ( = ?auto_470977 ?auto_470980 ) ) ( not ( = ?auto_470977 ?auto_470981 ) ) ( not ( = ?auto_470977 ?auto_470982 ) ) ( not ( = ?auto_470977 ?auto_470983 ) ) ( not ( = ?auto_470977 ?auto_470984 ) ) ( not ( = ?auto_470978 ?auto_470979 ) ) ( not ( = ?auto_470978 ?auto_470980 ) ) ( not ( = ?auto_470978 ?auto_470981 ) ) ( not ( = ?auto_470978 ?auto_470982 ) ) ( not ( = ?auto_470978 ?auto_470983 ) ) ( not ( = ?auto_470978 ?auto_470984 ) ) ( not ( = ?auto_470979 ?auto_470980 ) ) ( not ( = ?auto_470979 ?auto_470981 ) ) ( not ( = ?auto_470979 ?auto_470982 ) ) ( not ( = ?auto_470979 ?auto_470983 ) ) ( not ( = ?auto_470979 ?auto_470984 ) ) ( not ( = ?auto_470980 ?auto_470981 ) ) ( not ( = ?auto_470980 ?auto_470982 ) ) ( not ( = ?auto_470980 ?auto_470983 ) ) ( not ( = ?auto_470980 ?auto_470984 ) ) ( not ( = ?auto_470981 ?auto_470982 ) ) ( not ( = ?auto_470981 ?auto_470983 ) ) ( not ( = ?auto_470981 ?auto_470984 ) ) ( not ( = ?auto_470982 ?auto_470983 ) ) ( not ( = ?auto_470982 ?auto_470984 ) ) ( not ( = ?auto_470983 ?auto_470984 ) ) ( ON ?auto_470983 ?auto_470984 ) ( ON ?auto_470982 ?auto_470983 ) ( ON ?auto_470981 ?auto_470982 ) ( ON ?auto_470980 ?auto_470981 ) ( ON ?auto_470979 ?auto_470980 ) ( ON ?auto_470978 ?auto_470979 ) ( ON ?auto_470977 ?auto_470978 ) ( ON ?auto_470976 ?auto_470977 ) ( ON ?auto_470975 ?auto_470976 ) ( ON ?auto_470974 ?auto_470975 ) ( ON ?auto_470973 ?auto_470974 ) ( CLEAR ?auto_470971 ) ( ON ?auto_470972 ?auto_470973 ) ( CLEAR ?auto_470972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_470969 ?auto_470970 ?auto_470971 ?auto_470972 )
      ( MAKE-16PILE ?auto_470969 ?auto_470970 ?auto_470971 ?auto_470972 ?auto_470973 ?auto_470974 ?auto_470975 ?auto_470976 ?auto_470977 ?auto_470978 ?auto_470979 ?auto_470980 ?auto_470981 ?auto_470982 ?auto_470983 ?auto_470984 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_471001 - BLOCK
      ?auto_471002 - BLOCK
      ?auto_471003 - BLOCK
      ?auto_471004 - BLOCK
      ?auto_471005 - BLOCK
      ?auto_471006 - BLOCK
      ?auto_471007 - BLOCK
      ?auto_471008 - BLOCK
      ?auto_471009 - BLOCK
      ?auto_471010 - BLOCK
      ?auto_471011 - BLOCK
      ?auto_471012 - BLOCK
      ?auto_471013 - BLOCK
      ?auto_471014 - BLOCK
      ?auto_471015 - BLOCK
      ?auto_471016 - BLOCK
    )
    :vars
    (
      ?auto_471017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471016 ?auto_471017 ) ( ON-TABLE ?auto_471001 ) ( ON ?auto_471002 ?auto_471001 ) ( not ( = ?auto_471001 ?auto_471002 ) ) ( not ( = ?auto_471001 ?auto_471003 ) ) ( not ( = ?auto_471001 ?auto_471004 ) ) ( not ( = ?auto_471001 ?auto_471005 ) ) ( not ( = ?auto_471001 ?auto_471006 ) ) ( not ( = ?auto_471001 ?auto_471007 ) ) ( not ( = ?auto_471001 ?auto_471008 ) ) ( not ( = ?auto_471001 ?auto_471009 ) ) ( not ( = ?auto_471001 ?auto_471010 ) ) ( not ( = ?auto_471001 ?auto_471011 ) ) ( not ( = ?auto_471001 ?auto_471012 ) ) ( not ( = ?auto_471001 ?auto_471013 ) ) ( not ( = ?auto_471001 ?auto_471014 ) ) ( not ( = ?auto_471001 ?auto_471015 ) ) ( not ( = ?auto_471001 ?auto_471016 ) ) ( not ( = ?auto_471001 ?auto_471017 ) ) ( not ( = ?auto_471002 ?auto_471003 ) ) ( not ( = ?auto_471002 ?auto_471004 ) ) ( not ( = ?auto_471002 ?auto_471005 ) ) ( not ( = ?auto_471002 ?auto_471006 ) ) ( not ( = ?auto_471002 ?auto_471007 ) ) ( not ( = ?auto_471002 ?auto_471008 ) ) ( not ( = ?auto_471002 ?auto_471009 ) ) ( not ( = ?auto_471002 ?auto_471010 ) ) ( not ( = ?auto_471002 ?auto_471011 ) ) ( not ( = ?auto_471002 ?auto_471012 ) ) ( not ( = ?auto_471002 ?auto_471013 ) ) ( not ( = ?auto_471002 ?auto_471014 ) ) ( not ( = ?auto_471002 ?auto_471015 ) ) ( not ( = ?auto_471002 ?auto_471016 ) ) ( not ( = ?auto_471002 ?auto_471017 ) ) ( not ( = ?auto_471003 ?auto_471004 ) ) ( not ( = ?auto_471003 ?auto_471005 ) ) ( not ( = ?auto_471003 ?auto_471006 ) ) ( not ( = ?auto_471003 ?auto_471007 ) ) ( not ( = ?auto_471003 ?auto_471008 ) ) ( not ( = ?auto_471003 ?auto_471009 ) ) ( not ( = ?auto_471003 ?auto_471010 ) ) ( not ( = ?auto_471003 ?auto_471011 ) ) ( not ( = ?auto_471003 ?auto_471012 ) ) ( not ( = ?auto_471003 ?auto_471013 ) ) ( not ( = ?auto_471003 ?auto_471014 ) ) ( not ( = ?auto_471003 ?auto_471015 ) ) ( not ( = ?auto_471003 ?auto_471016 ) ) ( not ( = ?auto_471003 ?auto_471017 ) ) ( not ( = ?auto_471004 ?auto_471005 ) ) ( not ( = ?auto_471004 ?auto_471006 ) ) ( not ( = ?auto_471004 ?auto_471007 ) ) ( not ( = ?auto_471004 ?auto_471008 ) ) ( not ( = ?auto_471004 ?auto_471009 ) ) ( not ( = ?auto_471004 ?auto_471010 ) ) ( not ( = ?auto_471004 ?auto_471011 ) ) ( not ( = ?auto_471004 ?auto_471012 ) ) ( not ( = ?auto_471004 ?auto_471013 ) ) ( not ( = ?auto_471004 ?auto_471014 ) ) ( not ( = ?auto_471004 ?auto_471015 ) ) ( not ( = ?auto_471004 ?auto_471016 ) ) ( not ( = ?auto_471004 ?auto_471017 ) ) ( not ( = ?auto_471005 ?auto_471006 ) ) ( not ( = ?auto_471005 ?auto_471007 ) ) ( not ( = ?auto_471005 ?auto_471008 ) ) ( not ( = ?auto_471005 ?auto_471009 ) ) ( not ( = ?auto_471005 ?auto_471010 ) ) ( not ( = ?auto_471005 ?auto_471011 ) ) ( not ( = ?auto_471005 ?auto_471012 ) ) ( not ( = ?auto_471005 ?auto_471013 ) ) ( not ( = ?auto_471005 ?auto_471014 ) ) ( not ( = ?auto_471005 ?auto_471015 ) ) ( not ( = ?auto_471005 ?auto_471016 ) ) ( not ( = ?auto_471005 ?auto_471017 ) ) ( not ( = ?auto_471006 ?auto_471007 ) ) ( not ( = ?auto_471006 ?auto_471008 ) ) ( not ( = ?auto_471006 ?auto_471009 ) ) ( not ( = ?auto_471006 ?auto_471010 ) ) ( not ( = ?auto_471006 ?auto_471011 ) ) ( not ( = ?auto_471006 ?auto_471012 ) ) ( not ( = ?auto_471006 ?auto_471013 ) ) ( not ( = ?auto_471006 ?auto_471014 ) ) ( not ( = ?auto_471006 ?auto_471015 ) ) ( not ( = ?auto_471006 ?auto_471016 ) ) ( not ( = ?auto_471006 ?auto_471017 ) ) ( not ( = ?auto_471007 ?auto_471008 ) ) ( not ( = ?auto_471007 ?auto_471009 ) ) ( not ( = ?auto_471007 ?auto_471010 ) ) ( not ( = ?auto_471007 ?auto_471011 ) ) ( not ( = ?auto_471007 ?auto_471012 ) ) ( not ( = ?auto_471007 ?auto_471013 ) ) ( not ( = ?auto_471007 ?auto_471014 ) ) ( not ( = ?auto_471007 ?auto_471015 ) ) ( not ( = ?auto_471007 ?auto_471016 ) ) ( not ( = ?auto_471007 ?auto_471017 ) ) ( not ( = ?auto_471008 ?auto_471009 ) ) ( not ( = ?auto_471008 ?auto_471010 ) ) ( not ( = ?auto_471008 ?auto_471011 ) ) ( not ( = ?auto_471008 ?auto_471012 ) ) ( not ( = ?auto_471008 ?auto_471013 ) ) ( not ( = ?auto_471008 ?auto_471014 ) ) ( not ( = ?auto_471008 ?auto_471015 ) ) ( not ( = ?auto_471008 ?auto_471016 ) ) ( not ( = ?auto_471008 ?auto_471017 ) ) ( not ( = ?auto_471009 ?auto_471010 ) ) ( not ( = ?auto_471009 ?auto_471011 ) ) ( not ( = ?auto_471009 ?auto_471012 ) ) ( not ( = ?auto_471009 ?auto_471013 ) ) ( not ( = ?auto_471009 ?auto_471014 ) ) ( not ( = ?auto_471009 ?auto_471015 ) ) ( not ( = ?auto_471009 ?auto_471016 ) ) ( not ( = ?auto_471009 ?auto_471017 ) ) ( not ( = ?auto_471010 ?auto_471011 ) ) ( not ( = ?auto_471010 ?auto_471012 ) ) ( not ( = ?auto_471010 ?auto_471013 ) ) ( not ( = ?auto_471010 ?auto_471014 ) ) ( not ( = ?auto_471010 ?auto_471015 ) ) ( not ( = ?auto_471010 ?auto_471016 ) ) ( not ( = ?auto_471010 ?auto_471017 ) ) ( not ( = ?auto_471011 ?auto_471012 ) ) ( not ( = ?auto_471011 ?auto_471013 ) ) ( not ( = ?auto_471011 ?auto_471014 ) ) ( not ( = ?auto_471011 ?auto_471015 ) ) ( not ( = ?auto_471011 ?auto_471016 ) ) ( not ( = ?auto_471011 ?auto_471017 ) ) ( not ( = ?auto_471012 ?auto_471013 ) ) ( not ( = ?auto_471012 ?auto_471014 ) ) ( not ( = ?auto_471012 ?auto_471015 ) ) ( not ( = ?auto_471012 ?auto_471016 ) ) ( not ( = ?auto_471012 ?auto_471017 ) ) ( not ( = ?auto_471013 ?auto_471014 ) ) ( not ( = ?auto_471013 ?auto_471015 ) ) ( not ( = ?auto_471013 ?auto_471016 ) ) ( not ( = ?auto_471013 ?auto_471017 ) ) ( not ( = ?auto_471014 ?auto_471015 ) ) ( not ( = ?auto_471014 ?auto_471016 ) ) ( not ( = ?auto_471014 ?auto_471017 ) ) ( not ( = ?auto_471015 ?auto_471016 ) ) ( not ( = ?auto_471015 ?auto_471017 ) ) ( not ( = ?auto_471016 ?auto_471017 ) ) ( ON ?auto_471015 ?auto_471016 ) ( ON ?auto_471014 ?auto_471015 ) ( ON ?auto_471013 ?auto_471014 ) ( ON ?auto_471012 ?auto_471013 ) ( ON ?auto_471011 ?auto_471012 ) ( ON ?auto_471010 ?auto_471011 ) ( ON ?auto_471009 ?auto_471010 ) ( ON ?auto_471008 ?auto_471009 ) ( ON ?auto_471007 ?auto_471008 ) ( ON ?auto_471006 ?auto_471007 ) ( ON ?auto_471005 ?auto_471006 ) ( ON ?auto_471004 ?auto_471005 ) ( CLEAR ?auto_471002 ) ( ON ?auto_471003 ?auto_471004 ) ( CLEAR ?auto_471003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_471001 ?auto_471002 ?auto_471003 )
      ( MAKE-16PILE ?auto_471001 ?auto_471002 ?auto_471003 ?auto_471004 ?auto_471005 ?auto_471006 ?auto_471007 ?auto_471008 ?auto_471009 ?auto_471010 ?auto_471011 ?auto_471012 ?auto_471013 ?auto_471014 ?auto_471015 ?auto_471016 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_471034 - BLOCK
      ?auto_471035 - BLOCK
      ?auto_471036 - BLOCK
      ?auto_471037 - BLOCK
      ?auto_471038 - BLOCK
      ?auto_471039 - BLOCK
      ?auto_471040 - BLOCK
      ?auto_471041 - BLOCK
      ?auto_471042 - BLOCK
      ?auto_471043 - BLOCK
      ?auto_471044 - BLOCK
      ?auto_471045 - BLOCK
      ?auto_471046 - BLOCK
      ?auto_471047 - BLOCK
      ?auto_471048 - BLOCK
      ?auto_471049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_471049 ) ( ON-TABLE ?auto_471034 ) ( ON ?auto_471035 ?auto_471034 ) ( not ( = ?auto_471034 ?auto_471035 ) ) ( not ( = ?auto_471034 ?auto_471036 ) ) ( not ( = ?auto_471034 ?auto_471037 ) ) ( not ( = ?auto_471034 ?auto_471038 ) ) ( not ( = ?auto_471034 ?auto_471039 ) ) ( not ( = ?auto_471034 ?auto_471040 ) ) ( not ( = ?auto_471034 ?auto_471041 ) ) ( not ( = ?auto_471034 ?auto_471042 ) ) ( not ( = ?auto_471034 ?auto_471043 ) ) ( not ( = ?auto_471034 ?auto_471044 ) ) ( not ( = ?auto_471034 ?auto_471045 ) ) ( not ( = ?auto_471034 ?auto_471046 ) ) ( not ( = ?auto_471034 ?auto_471047 ) ) ( not ( = ?auto_471034 ?auto_471048 ) ) ( not ( = ?auto_471034 ?auto_471049 ) ) ( not ( = ?auto_471035 ?auto_471036 ) ) ( not ( = ?auto_471035 ?auto_471037 ) ) ( not ( = ?auto_471035 ?auto_471038 ) ) ( not ( = ?auto_471035 ?auto_471039 ) ) ( not ( = ?auto_471035 ?auto_471040 ) ) ( not ( = ?auto_471035 ?auto_471041 ) ) ( not ( = ?auto_471035 ?auto_471042 ) ) ( not ( = ?auto_471035 ?auto_471043 ) ) ( not ( = ?auto_471035 ?auto_471044 ) ) ( not ( = ?auto_471035 ?auto_471045 ) ) ( not ( = ?auto_471035 ?auto_471046 ) ) ( not ( = ?auto_471035 ?auto_471047 ) ) ( not ( = ?auto_471035 ?auto_471048 ) ) ( not ( = ?auto_471035 ?auto_471049 ) ) ( not ( = ?auto_471036 ?auto_471037 ) ) ( not ( = ?auto_471036 ?auto_471038 ) ) ( not ( = ?auto_471036 ?auto_471039 ) ) ( not ( = ?auto_471036 ?auto_471040 ) ) ( not ( = ?auto_471036 ?auto_471041 ) ) ( not ( = ?auto_471036 ?auto_471042 ) ) ( not ( = ?auto_471036 ?auto_471043 ) ) ( not ( = ?auto_471036 ?auto_471044 ) ) ( not ( = ?auto_471036 ?auto_471045 ) ) ( not ( = ?auto_471036 ?auto_471046 ) ) ( not ( = ?auto_471036 ?auto_471047 ) ) ( not ( = ?auto_471036 ?auto_471048 ) ) ( not ( = ?auto_471036 ?auto_471049 ) ) ( not ( = ?auto_471037 ?auto_471038 ) ) ( not ( = ?auto_471037 ?auto_471039 ) ) ( not ( = ?auto_471037 ?auto_471040 ) ) ( not ( = ?auto_471037 ?auto_471041 ) ) ( not ( = ?auto_471037 ?auto_471042 ) ) ( not ( = ?auto_471037 ?auto_471043 ) ) ( not ( = ?auto_471037 ?auto_471044 ) ) ( not ( = ?auto_471037 ?auto_471045 ) ) ( not ( = ?auto_471037 ?auto_471046 ) ) ( not ( = ?auto_471037 ?auto_471047 ) ) ( not ( = ?auto_471037 ?auto_471048 ) ) ( not ( = ?auto_471037 ?auto_471049 ) ) ( not ( = ?auto_471038 ?auto_471039 ) ) ( not ( = ?auto_471038 ?auto_471040 ) ) ( not ( = ?auto_471038 ?auto_471041 ) ) ( not ( = ?auto_471038 ?auto_471042 ) ) ( not ( = ?auto_471038 ?auto_471043 ) ) ( not ( = ?auto_471038 ?auto_471044 ) ) ( not ( = ?auto_471038 ?auto_471045 ) ) ( not ( = ?auto_471038 ?auto_471046 ) ) ( not ( = ?auto_471038 ?auto_471047 ) ) ( not ( = ?auto_471038 ?auto_471048 ) ) ( not ( = ?auto_471038 ?auto_471049 ) ) ( not ( = ?auto_471039 ?auto_471040 ) ) ( not ( = ?auto_471039 ?auto_471041 ) ) ( not ( = ?auto_471039 ?auto_471042 ) ) ( not ( = ?auto_471039 ?auto_471043 ) ) ( not ( = ?auto_471039 ?auto_471044 ) ) ( not ( = ?auto_471039 ?auto_471045 ) ) ( not ( = ?auto_471039 ?auto_471046 ) ) ( not ( = ?auto_471039 ?auto_471047 ) ) ( not ( = ?auto_471039 ?auto_471048 ) ) ( not ( = ?auto_471039 ?auto_471049 ) ) ( not ( = ?auto_471040 ?auto_471041 ) ) ( not ( = ?auto_471040 ?auto_471042 ) ) ( not ( = ?auto_471040 ?auto_471043 ) ) ( not ( = ?auto_471040 ?auto_471044 ) ) ( not ( = ?auto_471040 ?auto_471045 ) ) ( not ( = ?auto_471040 ?auto_471046 ) ) ( not ( = ?auto_471040 ?auto_471047 ) ) ( not ( = ?auto_471040 ?auto_471048 ) ) ( not ( = ?auto_471040 ?auto_471049 ) ) ( not ( = ?auto_471041 ?auto_471042 ) ) ( not ( = ?auto_471041 ?auto_471043 ) ) ( not ( = ?auto_471041 ?auto_471044 ) ) ( not ( = ?auto_471041 ?auto_471045 ) ) ( not ( = ?auto_471041 ?auto_471046 ) ) ( not ( = ?auto_471041 ?auto_471047 ) ) ( not ( = ?auto_471041 ?auto_471048 ) ) ( not ( = ?auto_471041 ?auto_471049 ) ) ( not ( = ?auto_471042 ?auto_471043 ) ) ( not ( = ?auto_471042 ?auto_471044 ) ) ( not ( = ?auto_471042 ?auto_471045 ) ) ( not ( = ?auto_471042 ?auto_471046 ) ) ( not ( = ?auto_471042 ?auto_471047 ) ) ( not ( = ?auto_471042 ?auto_471048 ) ) ( not ( = ?auto_471042 ?auto_471049 ) ) ( not ( = ?auto_471043 ?auto_471044 ) ) ( not ( = ?auto_471043 ?auto_471045 ) ) ( not ( = ?auto_471043 ?auto_471046 ) ) ( not ( = ?auto_471043 ?auto_471047 ) ) ( not ( = ?auto_471043 ?auto_471048 ) ) ( not ( = ?auto_471043 ?auto_471049 ) ) ( not ( = ?auto_471044 ?auto_471045 ) ) ( not ( = ?auto_471044 ?auto_471046 ) ) ( not ( = ?auto_471044 ?auto_471047 ) ) ( not ( = ?auto_471044 ?auto_471048 ) ) ( not ( = ?auto_471044 ?auto_471049 ) ) ( not ( = ?auto_471045 ?auto_471046 ) ) ( not ( = ?auto_471045 ?auto_471047 ) ) ( not ( = ?auto_471045 ?auto_471048 ) ) ( not ( = ?auto_471045 ?auto_471049 ) ) ( not ( = ?auto_471046 ?auto_471047 ) ) ( not ( = ?auto_471046 ?auto_471048 ) ) ( not ( = ?auto_471046 ?auto_471049 ) ) ( not ( = ?auto_471047 ?auto_471048 ) ) ( not ( = ?auto_471047 ?auto_471049 ) ) ( not ( = ?auto_471048 ?auto_471049 ) ) ( ON ?auto_471048 ?auto_471049 ) ( ON ?auto_471047 ?auto_471048 ) ( ON ?auto_471046 ?auto_471047 ) ( ON ?auto_471045 ?auto_471046 ) ( ON ?auto_471044 ?auto_471045 ) ( ON ?auto_471043 ?auto_471044 ) ( ON ?auto_471042 ?auto_471043 ) ( ON ?auto_471041 ?auto_471042 ) ( ON ?auto_471040 ?auto_471041 ) ( ON ?auto_471039 ?auto_471040 ) ( ON ?auto_471038 ?auto_471039 ) ( ON ?auto_471037 ?auto_471038 ) ( CLEAR ?auto_471035 ) ( ON ?auto_471036 ?auto_471037 ) ( CLEAR ?auto_471036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_471034 ?auto_471035 ?auto_471036 )
      ( MAKE-16PILE ?auto_471034 ?auto_471035 ?auto_471036 ?auto_471037 ?auto_471038 ?auto_471039 ?auto_471040 ?auto_471041 ?auto_471042 ?auto_471043 ?auto_471044 ?auto_471045 ?auto_471046 ?auto_471047 ?auto_471048 ?auto_471049 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_471066 - BLOCK
      ?auto_471067 - BLOCK
      ?auto_471068 - BLOCK
      ?auto_471069 - BLOCK
      ?auto_471070 - BLOCK
      ?auto_471071 - BLOCK
      ?auto_471072 - BLOCK
      ?auto_471073 - BLOCK
      ?auto_471074 - BLOCK
      ?auto_471075 - BLOCK
      ?auto_471076 - BLOCK
      ?auto_471077 - BLOCK
      ?auto_471078 - BLOCK
      ?auto_471079 - BLOCK
      ?auto_471080 - BLOCK
      ?auto_471081 - BLOCK
    )
    :vars
    (
      ?auto_471082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471081 ?auto_471082 ) ( ON-TABLE ?auto_471066 ) ( not ( = ?auto_471066 ?auto_471067 ) ) ( not ( = ?auto_471066 ?auto_471068 ) ) ( not ( = ?auto_471066 ?auto_471069 ) ) ( not ( = ?auto_471066 ?auto_471070 ) ) ( not ( = ?auto_471066 ?auto_471071 ) ) ( not ( = ?auto_471066 ?auto_471072 ) ) ( not ( = ?auto_471066 ?auto_471073 ) ) ( not ( = ?auto_471066 ?auto_471074 ) ) ( not ( = ?auto_471066 ?auto_471075 ) ) ( not ( = ?auto_471066 ?auto_471076 ) ) ( not ( = ?auto_471066 ?auto_471077 ) ) ( not ( = ?auto_471066 ?auto_471078 ) ) ( not ( = ?auto_471066 ?auto_471079 ) ) ( not ( = ?auto_471066 ?auto_471080 ) ) ( not ( = ?auto_471066 ?auto_471081 ) ) ( not ( = ?auto_471066 ?auto_471082 ) ) ( not ( = ?auto_471067 ?auto_471068 ) ) ( not ( = ?auto_471067 ?auto_471069 ) ) ( not ( = ?auto_471067 ?auto_471070 ) ) ( not ( = ?auto_471067 ?auto_471071 ) ) ( not ( = ?auto_471067 ?auto_471072 ) ) ( not ( = ?auto_471067 ?auto_471073 ) ) ( not ( = ?auto_471067 ?auto_471074 ) ) ( not ( = ?auto_471067 ?auto_471075 ) ) ( not ( = ?auto_471067 ?auto_471076 ) ) ( not ( = ?auto_471067 ?auto_471077 ) ) ( not ( = ?auto_471067 ?auto_471078 ) ) ( not ( = ?auto_471067 ?auto_471079 ) ) ( not ( = ?auto_471067 ?auto_471080 ) ) ( not ( = ?auto_471067 ?auto_471081 ) ) ( not ( = ?auto_471067 ?auto_471082 ) ) ( not ( = ?auto_471068 ?auto_471069 ) ) ( not ( = ?auto_471068 ?auto_471070 ) ) ( not ( = ?auto_471068 ?auto_471071 ) ) ( not ( = ?auto_471068 ?auto_471072 ) ) ( not ( = ?auto_471068 ?auto_471073 ) ) ( not ( = ?auto_471068 ?auto_471074 ) ) ( not ( = ?auto_471068 ?auto_471075 ) ) ( not ( = ?auto_471068 ?auto_471076 ) ) ( not ( = ?auto_471068 ?auto_471077 ) ) ( not ( = ?auto_471068 ?auto_471078 ) ) ( not ( = ?auto_471068 ?auto_471079 ) ) ( not ( = ?auto_471068 ?auto_471080 ) ) ( not ( = ?auto_471068 ?auto_471081 ) ) ( not ( = ?auto_471068 ?auto_471082 ) ) ( not ( = ?auto_471069 ?auto_471070 ) ) ( not ( = ?auto_471069 ?auto_471071 ) ) ( not ( = ?auto_471069 ?auto_471072 ) ) ( not ( = ?auto_471069 ?auto_471073 ) ) ( not ( = ?auto_471069 ?auto_471074 ) ) ( not ( = ?auto_471069 ?auto_471075 ) ) ( not ( = ?auto_471069 ?auto_471076 ) ) ( not ( = ?auto_471069 ?auto_471077 ) ) ( not ( = ?auto_471069 ?auto_471078 ) ) ( not ( = ?auto_471069 ?auto_471079 ) ) ( not ( = ?auto_471069 ?auto_471080 ) ) ( not ( = ?auto_471069 ?auto_471081 ) ) ( not ( = ?auto_471069 ?auto_471082 ) ) ( not ( = ?auto_471070 ?auto_471071 ) ) ( not ( = ?auto_471070 ?auto_471072 ) ) ( not ( = ?auto_471070 ?auto_471073 ) ) ( not ( = ?auto_471070 ?auto_471074 ) ) ( not ( = ?auto_471070 ?auto_471075 ) ) ( not ( = ?auto_471070 ?auto_471076 ) ) ( not ( = ?auto_471070 ?auto_471077 ) ) ( not ( = ?auto_471070 ?auto_471078 ) ) ( not ( = ?auto_471070 ?auto_471079 ) ) ( not ( = ?auto_471070 ?auto_471080 ) ) ( not ( = ?auto_471070 ?auto_471081 ) ) ( not ( = ?auto_471070 ?auto_471082 ) ) ( not ( = ?auto_471071 ?auto_471072 ) ) ( not ( = ?auto_471071 ?auto_471073 ) ) ( not ( = ?auto_471071 ?auto_471074 ) ) ( not ( = ?auto_471071 ?auto_471075 ) ) ( not ( = ?auto_471071 ?auto_471076 ) ) ( not ( = ?auto_471071 ?auto_471077 ) ) ( not ( = ?auto_471071 ?auto_471078 ) ) ( not ( = ?auto_471071 ?auto_471079 ) ) ( not ( = ?auto_471071 ?auto_471080 ) ) ( not ( = ?auto_471071 ?auto_471081 ) ) ( not ( = ?auto_471071 ?auto_471082 ) ) ( not ( = ?auto_471072 ?auto_471073 ) ) ( not ( = ?auto_471072 ?auto_471074 ) ) ( not ( = ?auto_471072 ?auto_471075 ) ) ( not ( = ?auto_471072 ?auto_471076 ) ) ( not ( = ?auto_471072 ?auto_471077 ) ) ( not ( = ?auto_471072 ?auto_471078 ) ) ( not ( = ?auto_471072 ?auto_471079 ) ) ( not ( = ?auto_471072 ?auto_471080 ) ) ( not ( = ?auto_471072 ?auto_471081 ) ) ( not ( = ?auto_471072 ?auto_471082 ) ) ( not ( = ?auto_471073 ?auto_471074 ) ) ( not ( = ?auto_471073 ?auto_471075 ) ) ( not ( = ?auto_471073 ?auto_471076 ) ) ( not ( = ?auto_471073 ?auto_471077 ) ) ( not ( = ?auto_471073 ?auto_471078 ) ) ( not ( = ?auto_471073 ?auto_471079 ) ) ( not ( = ?auto_471073 ?auto_471080 ) ) ( not ( = ?auto_471073 ?auto_471081 ) ) ( not ( = ?auto_471073 ?auto_471082 ) ) ( not ( = ?auto_471074 ?auto_471075 ) ) ( not ( = ?auto_471074 ?auto_471076 ) ) ( not ( = ?auto_471074 ?auto_471077 ) ) ( not ( = ?auto_471074 ?auto_471078 ) ) ( not ( = ?auto_471074 ?auto_471079 ) ) ( not ( = ?auto_471074 ?auto_471080 ) ) ( not ( = ?auto_471074 ?auto_471081 ) ) ( not ( = ?auto_471074 ?auto_471082 ) ) ( not ( = ?auto_471075 ?auto_471076 ) ) ( not ( = ?auto_471075 ?auto_471077 ) ) ( not ( = ?auto_471075 ?auto_471078 ) ) ( not ( = ?auto_471075 ?auto_471079 ) ) ( not ( = ?auto_471075 ?auto_471080 ) ) ( not ( = ?auto_471075 ?auto_471081 ) ) ( not ( = ?auto_471075 ?auto_471082 ) ) ( not ( = ?auto_471076 ?auto_471077 ) ) ( not ( = ?auto_471076 ?auto_471078 ) ) ( not ( = ?auto_471076 ?auto_471079 ) ) ( not ( = ?auto_471076 ?auto_471080 ) ) ( not ( = ?auto_471076 ?auto_471081 ) ) ( not ( = ?auto_471076 ?auto_471082 ) ) ( not ( = ?auto_471077 ?auto_471078 ) ) ( not ( = ?auto_471077 ?auto_471079 ) ) ( not ( = ?auto_471077 ?auto_471080 ) ) ( not ( = ?auto_471077 ?auto_471081 ) ) ( not ( = ?auto_471077 ?auto_471082 ) ) ( not ( = ?auto_471078 ?auto_471079 ) ) ( not ( = ?auto_471078 ?auto_471080 ) ) ( not ( = ?auto_471078 ?auto_471081 ) ) ( not ( = ?auto_471078 ?auto_471082 ) ) ( not ( = ?auto_471079 ?auto_471080 ) ) ( not ( = ?auto_471079 ?auto_471081 ) ) ( not ( = ?auto_471079 ?auto_471082 ) ) ( not ( = ?auto_471080 ?auto_471081 ) ) ( not ( = ?auto_471080 ?auto_471082 ) ) ( not ( = ?auto_471081 ?auto_471082 ) ) ( ON ?auto_471080 ?auto_471081 ) ( ON ?auto_471079 ?auto_471080 ) ( ON ?auto_471078 ?auto_471079 ) ( ON ?auto_471077 ?auto_471078 ) ( ON ?auto_471076 ?auto_471077 ) ( ON ?auto_471075 ?auto_471076 ) ( ON ?auto_471074 ?auto_471075 ) ( ON ?auto_471073 ?auto_471074 ) ( ON ?auto_471072 ?auto_471073 ) ( ON ?auto_471071 ?auto_471072 ) ( ON ?auto_471070 ?auto_471071 ) ( ON ?auto_471069 ?auto_471070 ) ( ON ?auto_471068 ?auto_471069 ) ( CLEAR ?auto_471066 ) ( ON ?auto_471067 ?auto_471068 ) ( CLEAR ?auto_471067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_471066 ?auto_471067 )
      ( MAKE-16PILE ?auto_471066 ?auto_471067 ?auto_471068 ?auto_471069 ?auto_471070 ?auto_471071 ?auto_471072 ?auto_471073 ?auto_471074 ?auto_471075 ?auto_471076 ?auto_471077 ?auto_471078 ?auto_471079 ?auto_471080 ?auto_471081 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_471099 - BLOCK
      ?auto_471100 - BLOCK
      ?auto_471101 - BLOCK
      ?auto_471102 - BLOCK
      ?auto_471103 - BLOCK
      ?auto_471104 - BLOCK
      ?auto_471105 - BLOCK
      ?auto_471106 - BLOCK
      ?auto_471107 - BLOCK
      ?auto_471108 - BLOCK
      ?auto_471109 - BLOCK
      ?auto_471110 - BLOCK
      ?auto_471111 - BLOCK
      ?auto_471112 - BLOCK
      ?auto_471113 - BLOCK
      ?auto_471114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_471114 ) ( ON-TABLE ?auto_471099 ) ( not ( = ?auto_471099 ?auto_471100 ) ) ( not ( = ?auto_471099 ?auto_471101 ) ) ( not ( = ?auto_471099 ?auto_471102 ) ) ( not ( = ?auto_471099 ?auto_471103 ) ) ( not ( = ?auto_471099 ?auto_471104 ) ) ( not ( = ?auto_471099 ?auto_471105 ) ) ( not ( = ?auto_471099 ?auto_471106 ) ) ( not ( = ?auto_471099 ?auto_471107 ) ) ( not ( = ?auto_471099 ?auto_471108 ) ) ( not ( = ?auto_471099 ?auto_471109 ) ) ( not ( = ?auto_471099 ?auto_471110 ) ) ( not ( = ?auto_471099 ?auto_471111 ) ) ( not ( = ?auto_471099 ?auto_471112 ) ) ( not ( = ?auto_471099 ?auto_471113 ) ) ( not ( = ?auto_471099 ?auto_471114 ) ) ( not ( = ?auto_471100 ?auto_471101 ) ) ( not ( = ?auto_471100 ?auto_471102 ) ) ( not ( = ?auto_471100 ?auto_471103 ) ) ( not ( = ?auto_471100 ?auto_471104 ) ) ( not ( = ?auto_471100 ?auto_471105 ) ) ( not ( = ?auto_471100 ?auto_471106 ) ) ( not ( = ?auto_471100 ?auto_471107 ) ) ( not ( = ?auto_471100 ?auto_471108 ) ) ( not ( = ?auto_471100 ?auto_471109 ) ) ( not ( = ?auto_471100 ?auto_471110 ) ) ( not ( = ?auto_471100 ?auto_471111 ) ) ( not ( = ?auto_471100 ?auto_471112 ) ) ( not ( = ?auto_471100 ?auto_471113 ) ) ( not ( = ?auto_471100 ?auto_471114 ) ) ( not ( = ?auto_471101 ?auto_471102 ) ) ( not ( = ?auto_471101 ?auto_471103 ) ) ( not ( = ?auto_471101 ?auto_471104 ) ) ( not ( = ?auto_471101 ?auto_471105 ) ) ( not ( = ?auto_471101 ?auto_471106 ) ) ( not ( = ?auto_471101 ?auto_471107 ) ) ( not ( = ?auto_471101 ?auto_471108 ) ) ( not ( = ?auto_471101 ?auto_471109 ) ) ( not ( = ?auto_471101 ?auto_471110 ) ) ( not ( = ?auto_471101 ?auto_471111 ) ) ( not ( = ?auto_471101 ?auto_471112 ) ) ( not ( = ?auto_471101 ?auto_471113 ) ) ( not ( = ?auto_471101 ?auto_471114 ) ) ( not ( = ?auto_471102 ?auto_471103 ) ) ( not ( = ?auto_471102 ?auto_471104 ) ) ( not ( = ?auto_471102 ?auto_471105 ) ) ( not ( = ?auto_471102 ?auto_471106 ) ) ( not ( = ?auto_471102 ?auto_471107 ) ) ( not ( = ?auto_471102 ?auto_471108 ) ) ( not ( = ?auto_471102 ?auto_471109 ) ) ( not ( = ?auto_471102 ?auto_471110 ) ) ( not ( = ?auto_471102 ?auto_471111 ) ) ( not ( = ?auto_471102 ?auto_471112 ) ) ( not ( = ?auto_471102 ?auto_471113 ) ) ( not ( = ?auto_471102 ?auto_471114 ) ) ( not ( = ?auto_471103 ?auto_471104 ) ) ( not ( = ?auto_471103 ?auto_471105 ) ) ( not ( = ?auto_471103 ?auto_471106 ) ) ( not ( = ?auto_471103 ?auto_471107 ) ) ( not ( = ?auto_471103 ?auto_471108 ) ) ( not ( = ?auto_471103 ?auto_471109 ) ) ( not ( = ?auto_471103 ?auto_471110 ) ) ( not ( = ?auto_471103 ?auto_471111 ) ) ( not ( = ?auto_471103 ?auto_471112 ) ) ( not ( = ?auto_471103 ?auto_471113 ) ) ( not ( = ?auto_471103 ?auto_471114 ) ) ( not ( = ?auto_471104 ?auto_471105 ) ) ( not ( = ?auto_471104 ?auto_471106 ) ) ( not ( = ?auto_471104 ?auto_471107 ) ) ( not ( = ?auto_471104 ?auto_471108 ) ) ( not ( = ?auto_471104 ?auto_471109 ) ) ( not ( = ?auto_471104 ?auto_471110 ) ) ( not ( = ?auto_471104 ?auto_471111 ) ) ( not ( = ?auto_471104 ?auto_471112 ) ) ( not ( = ?auto_471104 ?auto_471113 ) ) ( not ( = ?auto_471104 ?auto_471114 ) ) ( not ( = ?auto_471105 ?auto_471106 ) ) ( not ( = ?auto_471105 ?auto_471107 ) ) ( not ( = ?auto_471105 ?auto_471108 ) ) ( not ( = ?auto_471105 ?auto_471109 ) ) ( not ( = ?auto_471105 ?auto_471110 ) ) ( not ( = ?auto_471105 ?auto_471111 ) ) ( not ( = ?auto_471105 ?auto_471112 ) ) ( not ( = ?auto_471105 ?auto_471113 ) ) ( not ( = ?auto_471105 ?auto_471114 ) ) ( not ( = ?auto_471106 ?auto_471107 ) ) ( not ( = ?auto_471106 ?auto_471108 ) ) ( not ( = ?auto_471106 ?auto_471109 ) ) ( not ( = ?auto_471106 ?auto_471110 ) ) ( not ( = ?auto_471106 ?auto_471111 ) ) ( not ( = ?auto_471106 ?auto_471112 ) ) ( not ( = ?auto_471106 ?auto_471113 ) ) ( not ( = ?auto_471106 ?auto_471114 ) ) ( not ( = ?auto_471107 ?auto_471108 ) ) ( not ( = ?auto_471107 ?auto_471109 ) ) ( not ( = ?auto_471107 ?auto_471110 ) ) ( not ( = ?auto_471107 ?auto_471111 ) ) ( not ( = ?auto_471107 ?auto_471112 ) ) ( not ( = ?auto_471107 ?auto_471113 ) ) ( not ( = ?auto_471107 ?auto_471114 ) ) ( not ( = ?auto_471108 ?auto_471109 ) ) ( not ( = ?auto_471108 ?auto_471110 ) ) ( not ( = ?auto_471108 ?auto_471111 ) ) ( not ( = ?auto_471108 ?auto_471112 ) ) ( not ( = ?auto_471108 ?auto_471113 ) ) ( not ( = ?auto_471108 ?auto_471114 ) ) ( not ( = ?auto_471109 ?auto_471110 ) ) ( not ( = ?auto_471109 ?auto_471111 ) ) ( not ( = ?auto_471109 ?auto_471112 ) ) ( not ( = ?auto_471109 ?auto_471113 ) ) ( not ( = ?auto_471109 ?auto_471114 ) ) ( not ( = ?auto_471110 ?auto_471111 ) ) ( not ( = ?auto_471110 ?auto_471112 ) ) ( not ( = ?auto_471110 ?auto_471113 ) ) ( not ( = ?auto_471110 ?auto_471114 ) ) ( not ( = ?auto_471111 ?auto_471112 ) ) ( not ( = ?auto_471111 ?auto_471113 ) ) ( not ( = ?auto_471111 ?auto_471114 ) ) ( not ( = ?auto_471112 ?auto_471113 ) ) ( not ( = ?auto_471112 ?auto_471114 ) ) ( not ( = ?auto_471113 ?auto_471114 ) ) ( ON ?auto_471113 ?auto_471114 ) ( ON ?auto_471112 ?auto_471113 ) ( ON ?auto_471111 ?auto_471112 ) ( ON ?auto_471110 ?auto_471111 ) ( ON ?auto_471109 ?auto_471110 ) ( ON ?auto_471108 ?auto_471109 ) ( ON ?auto_471107 ?auto_471108 ) ( ON ?auto_471106 ?auto_471107 ) ( ON ?auto_471105 ?auto_471106 ) ( ON ?auto_471104 ?auto_471105 ) ( ON ?auto_471103 ?auto_471104 ) ( ON ?auto_471102 ?auto_471103 ) ( ON ?auto_471101 ?auto_471102 ) ( CLEAR ?auto_471099 ) ( ON ?auto_471100 ?auto_471101 ) ( CLEAR ?auto_471100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_471099 ?auto_471100 )
      ( MAKE-16PILE ?auto_471099 ?auto_471100 ?auto_471101 ?auto_471102 ?auto_471103 ?auto_471104 ?auto_471105 ?auto_471106 ?auto_471107 ?auto_471108 ?auto_471109 ?auto_471110 ?auto_471111 ?auto_471112 ?auto_471113 ?auto_471114 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_471131 - BLOCK
      ?auto_471132 - BLOCK
      ?auto_471133 - BLOCK
      ?auto_471134 - BLOCK
      ?auto_471135 - BLOCK
      ?auto_471136 - BLOCK
      ?auto_471137 - BLOCK
      ?auto_471138 - BLOCK
      ?auto_471139 - BLOCK
      ?auto_471140 - BLOCK
      ?auto_471141 - BLOCK
      ?auto_471142 - BLOCK
      ?auto_471143 - BLOCK
      ?auto_471144 - BLOCK
      ?auto_471145 - BLOCK
      ?auto_471146 - BLOCK
    )
    :vars
    (
      ?auto_471147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471146 ?auto_471147 ) ( not ( = ?auto_471131 ?auto_471132 ) ) ( not ( = ?auto_471131 ?auto_471133 ) ) ( not ( = ?auto_471131 ?auto_471134 ) ) ( not ( = ?auto_471131 ?auto_471135 ) ) ( not ( = ?auto_471131 ?auto_471136 ) ) ( not ( = ?auto_471131 ?auto_471137 ) ) ( not ( = ?auto_471131 ?auto_471138 ) ) ( not ( = ?auto_471131 ?auto_471139 ) ) ( not ( = ?auto_471131 ?auto_471140 ) ) ( not ( = ?auto_471131 ?auto_471141 ) ) ( not ( = ?auto_471131 ?auto_471142 ) ) ( not ( = ?auto_471131 ?auto_471143 ) ) ( not ( = ?auto_471131 ?auto_471144 ) ) ( not ( = ?auto_471131 ?auto_471145 ) ) ( not ( = ?auto_471131 ?auto_471146 ) ) ( not ( = ?auto_471131 ?auto_471147 ) ) ( not ( = ?auto_471132 ?auto_471133 ) ) ( not ( = ?auto_471132 ?auto_471134 ) ) ( not ( = ?auto_471132 ?auto_471135 ) ) ( not ( = ?auto_471132 ?auto_471136 ) ) ( not ( = ?auto_471132 ?auto_471137 ) ) ( not ( = ?auto_471132 ?auto_471138 ) ) ( not ( = ?auto_471132 ?auto_471139 ) ) ( not ( = ?auto_471132 ?auto_471140 ) ) ( not ( = ?auto_471132 ?auto_471141 ) ) ( not ( = ?auto_471132 ?auto_471142 ) ) ( not ( = ?auto_471132 ?auto_471143 ) ) ( not ( = ?auto_471132 ?auto_471144 ) ) ( not ( = ?auto_471132 ?auto_471145 ) ) ( not ( = ?auto_471132 ?auto_471146 ) ) ( not ( = ?auto_471132 ?auto_471147 ) ) ( not ( = ?auto_471133 ?auto_471134 ) ) ( not ( = ?auto_471133 ?auto_471135 ) ) ( not ( = ?auto_471133 ?auto_471136 ) ) ( not ( = ?auto_471133 ?auto_471137 ) ) ( not ( = ?auto_471133 ?auto_471138 ) ) ( not ( = ?auto_471133 ?auto_471139 ) ) ( not ( = ?auto_471133 ?auto_471140 ) ) ( not ( = ?auto_471133 ?auto_471141 ) ) ( not ( = ?auto_471133 ?auto_471142 ) ) ( not ( = ?auto_471133 ?auto_471143 ) ) ( not ( = ?auto_471133 ?auto_471144 ) ) ( not ( = ?auto_471133 ?auto_471145 ) ) ( not ( = ?auto_471133 ?auto_471146 ) ) ( not ( = ?auto_471133 ?auto_471147 ) ) ( not ( = ?auto_471134 ?auto_471135 ) ) ( not ( = ?auto_471134 ?auto_471136 ) ) ( not ( = ?auto_471134 ?auto_471137 ) ) ( not ( = ?auto_471134 ?auto_471138 ) ) ( not ( = ?auto_471134 ?auto_471139 ) ) ( not ( = ?auto_471134 ?auto_471140 ) ) ( not ( = ?auto_471134 ?auto_471141 ) ) ( not ( = ?auto_471134 ?auto_471142 ) ) ( not ( = ?auto_471134 ?auto_471143 ) ) ( not ( = ?auto_471134 ?auto_471144 ) ) ( not ( = ?auto_471134 ?auto_471145 ) ) ( not ( = ?auto_471134 ?auto_471146 ) ) ( not ( = ?auto_471134 ?auto_471147 ) ) ( not ( = ?auto_471135 ?auto_471136 ) ) ( not ( = ?auto_471135 ?auto_471137 ) ) ( not ( = ?auto_471135 ?auto_471138 ) ) ( not ( = ?auto_471135 ?auto_471139 ) ) ( not ( = ?auto_471135 ?auto_471140 ) ) ( not ( = ?auto_471135 ?auto_471141 ) ) ( not ( = ?auto_471135 ?auto_471142 ) ) ( not ( = ?auto_471135 ?auto_471143 ) ) ( not ( = ?auto_471135 ?auto_471144 ) ) ( not ( = ?auto_471135 ?auto_471145 ) ) ( not ( = ?auto_471135 ?auto_471146 ) ) ( not ( = ?auto_471135 ?auto_471147 ) ) ( not ( = ?auto_471136 ?auto_471137 ) ) ( not ( = ?auto_471136 ?auto_471138 ) ) ( not ( = ?auto_471136 ?auto_471139 ) ) ( not ( = ?auto_471136 ?auto_471140 ) ) ( not ( = ?auto_471136 ?auto_471141 ) ) ( not ( = ?auto_471136 ?auto_471142 ) ) ( not ( = ?auto_471136 ?auto_471143 ) ) ( not ( = ?auto_471136 ?auto_471144 ) ) ( not ( = ?auto_471136 ?auto_471145 ) ) ( not ( = ?auto_471136 ?auto_471146 ) ) ( not ( = ?auto_471136 ?auto_471147 ) ) ( not ( = ?auto_471137 ?auto_471138 ) ) ( not ( = ?auto_471137 ?auto_471139 ) ) ( not ( = ?auto_471137 ?auto_471140 ) ) ( not ( = ?auto_471137 ?auto_471141 ) ) ( not ( = ?auto_471137 ?auto_471142 ) ) ( not ( = ?auto_471137 ?auto_471143 ) ) ( not ( = ?auto_471137 ?auto_471144 ) ) ( not ( = ?auto_471137 ?auto_471145 ) ) ( not ( = ?auto_471137 ?auto_471146 ) ) ( not ( = ?auto_471137 ?auto_471147 ) ) ( not ( = ?auto_471138 ?auto_471139 ) ) ( not ( = ?auto_471138 ?auto_471140 ) ) ( not ( = ?auto_471138 ?auto_471141 ) ) ( not ( = ?auto_471138 ?auto_471142 ) ) ( not ( = ?auto_471138 ?auto_471143 ) ) ( not ( = ?auto_471138 ?auto_471144 ) ) ( not ( = ?auto_471138 ?auto_471145 ) ) ( not ( = ?auto_471138 ?auto_471146 ) ) ( not ( = ?auto_471138 ?auto_471147 ) ) ( not ( = ?auto_471139 ?auto_471140 ) ) ( not ( = ?auto_471139 ?auto_471141 ) ) ( not ( = ?auto_471139 ?auto_471142 ) ) ( not ( = ?auto_471139 ?auto_471143 ) ) ( not ( = ?auto_471139 ?auto_471144 ) ) ( not ( = ?auto_471139 ?auto_471145 ) ) ( not ( = ?auto_471139 ?auto_471146 ) ) ( not ( = ?auto_471139 ?auto_471147 ) ) ( not ( = ?auto_471140 ?auto_471141 ) ) ( not ( = ?auto_471140 ?auto_471142 ) ) ( not ( = ?auto_471140 ?auto_471143 ) ) ( not ( = ?auto_471140 ?auto_471144 ) ) ( not ( = ?auto_471140 ?auto_471145 ) ) ( not ( = ?auto_471140 ?auto_471146 ) ) ( not ( = ?auto_471140 ?auto_471147 ) ) ( not ( = ?auto_471141 ?auto_471142 ) ) ( not ( = ?auto_471141 ?auto_471143 ) ) ( not ( = ?auto_471141 ?auto_471144 ) ) ( not ( = ?auto_471141 ?auto_471145 ) ) ( not ( = ?auto_471141 ?auto_471146 ) ) ( not ( = ?auto_471141 ?auto_471147 ) ) ( not ( = ?auto_471142 ?auto_471143 ) ) ( not ( = ?auto_471142 ?auto_471144 ) ) ( not ( = ?auto_471142 ?auto_471145 ) ) ( not ( = ?auto_471142 ?auto_471146 ) ) ( not ( = ?auto_471142 ?auto_471147 ) ) ( not ( = ?auto_471143 ?auto_471144 ) ) ( not ( = ?auto_471143 ?auto_471145 ) ) ( not ( = ?auto_471143 ?auto_471146 ) ) ( not ( = ?auto_471143 ?auto_471147 ) ) ( not ( = ?auto_471144 ?auto_471145 ) ) ( not ( = ?auto_471144 ?auto_471146 ) ) ( not ( = ?auto_471144 ?auto_471147 ) ) ( not ( = ?auto_471145 ?auto_471146 ) ) ( not ( = ?auto_471145 ?auto_471147 ) ) ( not ( = ?auto_471146 ?auto_471147 ) ) ( ON ?auto_471145 ?auto_471146 ) ( ON ?auto_471144 ?auto_471145 ) ( ON ?auto_471143 ?auto_471144 ) ( ON ?auto_471142 ?auto_471143 ) ( ON ?auto_471141 ?auto_471142 ) ( ON ?auto_471140 ?auto_471141 ) ( ON ?auto_471139 ?auto_471140 ) ( ON ?auto_471138 ?auto_471139 ) ( ON ?auto_471137 ?auto_471138 ) ( ON ?auto_471136 ?auto_471137 ) ( ON ?auto_471135 ?auto_471136 ) ( ON ?auto_471134 ?auto_471135 ) ( ON ?auto_471133 ?auto_471134 ) ( ON ?auto_471132 ?auto_471133 ) ( ON ?auto_471131 ?auto_471132 ) ( CLEAR ?auto_471131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_471131 )
      ( MAKE-16PILE ?auto_471131 ?auto_471132 ?auto_471133 ?auto_471134 ?auto_471135 ?auto_471136 ?auto_471137 ?auto_471138 ?auto_471139 ?auto_471140 ?auto_471141 ?auto_471142 ?auto_471143 ?auto_471144 ?auto_471145 ?auto_471146 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_471164 - BLOCK
      ?auto_471165 - BLOCK
      ?auto_471166 - BLOCK
      ?auto_471167 - BLOCK
      ?auto_471168 - BLOCK
      ?auto_471169 - BLOCK
      ?auto_471170 - BLOCK
      ?auto_471171 - BLOCK
      ?auto_471172 - BLOCK
      ?auto_471173 - BLOCK
      ?auto_471174 - BLOCK
      ?auto_471175 - BLOCK
      ?auto_471176 - BLOCK
      ?auto_471177 - BLOCK
      ?auto_471178 - BLOCK
      ?auto_471179 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_471179 ) ( not ( = ?auto_471164 ?auto_471165 ) ) ( not ( = ?auto_471164 ?auto_471166 ) ) ( not ( = ?auto_471164 ?auto_471167 ) ) ( not ( = ?auto_471164 ?auto_471168 ) ) ( not ( = ?auto_471164 ?auto_471169 ) ) ( not ( = ?auto_471164 ?auto_471170 ) ) ( not ( = ?auto_471164 ?auto_471171 ) ) ( not ( = ?auto_471164 ?auto_471172 ) ) ( not ( = ?auto_471164 ?auto_471173 ) ) ( not ( = ?auto_471164 ?auto_471174 ) ) ( not ( = ?auto_471164 ?auto_471175 ) ) ( not ( = ?auto_471164 ?auto_471176 ) ) ( not ( = ?auto_471164 ?auto_471177 ) ) ( not ( = ?auto_471164 ?auto_471178 ) ) ( not ( = ?auto_471164 ?auto_471179 ) ) ( not ( = ?auto_471165 ?auto_471166 ) ) ( not ( = ?auto_471165 ?auto_471167 ) ) ( not ( = ?auto_471165 ?auto_471168 ) ) ( not ( = ?auto_471165 ?auto_471169 ) ) ( not ( = ?auto_471165 ?auto_471170 ) ) ( not ( = ?auto_471165 ?auto_471171 ) ) ( not ( = ?auto_471165 ?auto_471172 ) ) ( not ( = ?auto_471165 ?auto_471173 ) ) ( not ( = ?auto_471165 ?auto_471174 ) ) ( not ( = ?auto_471165 ?auto_471175 ) ) ( not ( = ?auto_471165 ?auto_471176 ) ) ( not ( = ?auto_471165 ?auto_471177 ) ) ( not ( = ?auto_471165 ?auto_471178 ) ) ( not ( = ?auto_471165 ?auto_471179 ) ) ( not ( = ?auto_471166 ?auto_471167 ) ) ( not ( = ?auto_471166 ?auto_471168 ) ) ( not ( = ?auto_471166 ?auto_471169 ) ) ( not ( = ?auto_471166 ?auto_471170 ) ) ( not ( = ?auto_471166 ?auto_471171 ) ) ( not ( = ?auto_471166 ?auto_471172 ) ) ( not ( = ?auto_471166 ?auto_471173 ) ) ( not ( = ?auto_471166 ?auto_471174 ) ) ( not ( = ?auto_471166 ?auto_471175 ) ) ( not ( = ?auto_471166 ?auto_471176 ) ) ( not ( = ?auto_471166 ?auto_471177 ) ) ( not ( = ?auto_471166 ?auto_471178 ) ) ( not ( = ?auto_471166 ?auto_471179 ) ) ( not ( = ?auto_471167 ?auto_471168 ) ) ( not ( = ?auto_471167 ?auto_471169 ) ) ( not ( = ?auto_471167 ?auto_471170 ) ) ( not ( = ?auto_471167 ?auto_471171 ) ) ( not ( = ?auto_471167 ?auto_471172 ) ) ( not ( = ?auto_471167 ?auto_471173 ) ) ( not ( = ?auto_471167 ?auto_471174 ) ) ( not ( = ?auto_471167 ?auto_471175 ) ) ( not ( = ?auto_471167 ?auto_471176 ) ) ( not ( = ?auto_471167 ?auto_471177 ) ) ( not ( = ?auto_471167 ?auto_471178 ) ) ( not ( = ?auto_471167 ?auto_471179 ) ) ( not ( = ?auto_471168 ?auto_471169 ) ) ( not ( = ?auto_471168 ?auto_471170 ) ) ( not ( = ?auto_471168 ?auto_471171 ) ) ( not ( = ?auto_471168 ?auto_471172 ) ) ( not ( = ?auto_471168 ?auto_471173 ) ) ( not ( = ?auto_471168 ?auto_471174 ) ) ( not ( = ?auto_471168 ?auto_471175 ) ) ( not ( = ?auto_471168 ?auto_471176 ) ) ( not ( = ?auto_471168 ?auto_471177 ) ) ( not ( = ?auto_471168 ?auto_471178 ) ) ( not ( = ?auto_471168 ?auto_471179 ) ) ( not ( = ?auto_471169 ?auto_471170 ) ) ( not ( = ?auto_471169 ?auto_471171 ) ) ( not ( = ?auto_471169 ?auto_471172 ) ) ( not ( = ?auto_471169 ?auto_471173 ) ) ( not ( = ?auto_471169 ?auto_471174 ) ) ( not ( = ?auto_471169 ?auto_471175 ) ) ( not ( = ?auto_471169 ?auto_471176 ) ) ( not ( = ?auto_471169 ?auto_471177 ) ) ( not ( = ?auto_471169 ?auto_471178 ) ) ( not ( = ?auto_471169 ?auto_471179 ) ) ( not ( = ?auto_471170 ?auto_471171 ) ) ( not ( = ?auto_471170 ?auto_471172 ) ) ( not ( = ?auto_471170 ?auto_471173 ) ) ( not ( = ?auto_471170 ?auto_471174 ) ) ( not ( = ?auto_471170 ?auto_471175 ) ) ( not ( = ?auto_471170 ?auto_471176 ) ) ( not ( = ?auto_471170 ?auto_471177 ) ) ( not ( = ?auto_471170 ?auto_471178 ) ) ( not ( = ?auto_471170 ?auto_471179 ) ) ( not ( = ?auto_471171 ?auto_471172 ) ) ( not ( = ?auto_471171 ?auto_471173 ) ) ( not ( = ?auto_471171 ?auto_471174 ) ) ( not ( = ?auto_471171 ?auto_471175 ) ) ( not ( = ?auto_471171 ?auto_471176 ) ) ( not ( = ?auto_471171 ?auto_471177 ) ) ( not ( = ?auto_471171 ?auto_471178 ) ) ( not ( = ?auto_471171 ?auto_471179 ) ) ( not ( = ?auto_471172 ?auto_471173 ) ) ( not ( = ?auto_471172 ?auto_471174 ) ) ( not ( = ?auto_471172 ?auto_471175 ) ) ( not ( = ?auto_471172 ?auto_471176 ) ) ( not ( = ?auto_471172 ?auto_471177 ) ) ( not ( = ?auto_471172 ?auto_471178 ) ) ( not ( = ?auto_471172 ?auto_471179 ) ) ( not ( = ?auto_471173 ?auto_471174 ) ) ( not ( = ?auto_471173 ?auto_471175 ) ) ( not ( = ?auto_471173 ?auto_471176 ) ) ( not ( = ?auto_471173 ?auto_471177 ) ) ( not ( = ?auto_471173 ?auto_471178 ) ) ( not ( = ?auto_471173 ?auto_471179 ) ) ( not ( = ?auto_471174 ?auto_471175 ) ) ( not ( = ?auto_471174 ?auto_471176 ) ) ( not ( = ?auto_471174 ?auto_471177 ) ) ( not ( = ?auto_471174 ?auto_471178 ) ) ( not ( = ?auto_471174 ?auto_471179 ) ) ( not ( = ?auto_471175 ?auto_471176 ) ) ( not ( = ?auto_471175 ?auto_471177 ) ) ( not ( = ?auto_471175 ?auto_471178 ) ) ( not ( = ?auto_471175 ?auto_471179 ) ) ( not ( = ?auto_471176 ?auto_471177 ) ) ( not ( = ?auto_471176 ?auto_471178 ) ) ( not ( = ?auto_471176 ?auto_471179 ) ) ( not ( = ?auto_471177 ?auto_471178 ) ) ( not ( = ?auto_471177 ?auto_471179 ) ) ( not ( = ?auto_471178 ?auto_471179 ) ) ( ON ?auto_471178 ?auto_471179 ) ( ON ?auto_471177 ?auto_471178 ) ( ON ?auto_471176 ?auto_471177 ) ( ON ?auto_471175 ?auto_471176 ) ( ON ?auto_471174 ?auto_471175 ) ( ON ?auto_471173 ?auto_471174 ) ( ON ?auto_471172 ?auto_471173 ) ( ON ?auto_471171 ?auto_471172 ) ( ON ?auto_471170 ?auto_471171 ) ( ON ?auto_471169 ?auto_471170 ) ( ON ?auto_471168 ?auto_471169 ) ( ON ?auto_471167 ?auto_471168 ) ( ON ?auto_471166 ?auto_471167 ) ( ON ?auto_471165 ?auto_471166 ) ( ON ?auto_471164 ?auto_471165 ) ( CLEAR ?auto_471164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_471164 )
      ( MAKE-16PILE ?auto_471164 ?auto_471165 ?auto_471166 ?auto_471167 ?auto_471168 ?auto_471169 ?auto_471170 ?auto_471171 ?auto_471172 ?auto_471173 ?auto_471174 ?auto_471175 ?auto_471176 ?auto_471177 ?auto_471178 ?auto_471179 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_471196 - BLOCK
      ?auto_471197 - BLOCK
      ?auto_471198 - BLOCK
      ?auto_471199 - BLOCK
      ?auto_471200 - BLOCK
      ?auto_471201 - BLOCK
      ?auto_471202 - BLOCK
      ?auto_471203 - BLOCK
      ?auto_471204 - BLOCK
      ?auto_471205 - BLOCK
      ?auto_471206 - BLOCK
      ?auto_471207 - BLOCK
      ?auto_471208 - BLOCK
      ?auto_471209 - BLOCK
      ?auto_471210 - BLOCK
      ?auto_471211 - BLOCK
    )
    :vars
    (
      ?auto_471212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_471196 ?auto_471197 ) ) ( not ( = ?auto_471196 ?auto_471198 ) ) ( not ( = ?auto_471196 ?auto_471199 ) ) ( not ( = ?auto_471196 ?auto_471200 ) ) ( not ( = ?auto_471196 ?auto_471201 ) ) ( not ( = ?auto_471196 ?auto_471202 ) ) ( not ( = ?auto_471196 ?auto_471203 ) ) ( not ( = ?auto_471196 ?auto_471204 ) ) ( not ( = ?auto_471196 ?auto_471205 ) ) ( not ( = ?auto_471196 ?auto_471206 ) ) ( not ( = ?auto_471196 ?auto_471207 ) ) ( not ( = ?auto_471196 ?auto_471208 ) ) ( not ( = ?auto_471196 ?auto_471209 ) ) ( not ( = ?auto_471196 ?auto_471210 ) ) ( not ( = ?auto_471196 ?auto_471211 ) ) ( not ( = ?auto_471197 ?auto_471198 ) ) ( not ( = ?auto_471197 ?auto_471199 ) ) ( not ( = ?auto_471197 ?auto_471200 ) ) ( not ( = ?auto_471197 ?auto_471201 ) ) ( not ( = ?auto_471197 ?auto_471202 ) ) ( not ( = ?auto_471197 ?auto_471203 ) ) ( not ( = ?auto_471197 ?auto_471204 ) ) ( not ( = ?auto_471197 ?auto_471205 ) ) ( not ( = ?auto_471197 ?auto_471206 ) ) ( not ( = ?auto_471197 ?auto_471207 ) ) ( not ( = ?auto_471197 ?auto_471208 ) ) ( not ( = ?auto_471197 ?auto_471209 ) ) ( not ( = ?auto_471197 ?auto_471210 ) ) ( not ( = ?auto_471197 ?auto_471211 ) ) ( not ( = ?auto_471198 ?auto_471199 ) ) ( not ( = ?auto_471198 ?auto_471200 ) ) ( not ( = ?auto_471198 ?auto_471201 ) ) ( not ( = ?auto_471198 ?auto_471202 ) ) ( not ( = ?auto_471198 ?auto_471203 ) ) ( not ( = ?auto_471198 ?auto_471204 ) ) ( not ( = ?auto_471198 ?auto_471205 ) ) ( not ( = ?auto_471198 ?auto_471206 ) ) ( not ( = ?auto_471198 ?auto_471207 ) ) ( not ( = ?auto_471198 ?auto_471208 ) ) ( not ( = ?auto_471198 ?auto_471209 ) ) ( not ( = ?auto_471198 ?auto_471210 ) ) ( not ( = ?auto_471198 ?auto_471211 ) ) ( not ( = ?auto_471199 ?auto_471200 ) ) ( not ( = ?auto_471199 ?auto_471201 ) ) ( not ( = ?auto_471199 ?auto_471202 ) ) ( not ( = ?auto_471199 ?auto_471203 ) ) ( not ( = ?auto_471199 ?auto_471204 ) ) ( not ( = ?auto_471199 ?auto_471205 ) ) ( not ( = ?auto_471199 ?auto_471206 ) ) ( not ( = ?auto_471199 ?auto_471207 ) ) ( not ( = ?auto_471199 ?auto_471208 ) ) ( not ( = ?auto_471199 ?auto_471209 ) ) ( not ( = ?auto_471199 ?auto_471210 ) ) ( not ( = ?auto_471199 ?auto_471211 ) ) ( not ( = ?auto_471200 ?auto_471201 ) ) ( not ( = ?auto_471200 ?auto_471202 ) ) ( not ( = ?auto_471200 ?auto_471203 ) ) ( not ( = ?auto_471200 ?auto_471204 ) ) ( not ( = ?auto_471200 ?auto_471205 ) ) ( not ( = ?auto_471200 ?auto_471206 ) ) ( not ( = ?auto_471200 ?auto_471207 ) ) ( not ( = ?auto_471200 ?auto_471208 ) ) ( not ( = ?auto_471200 ?auto_471209 ) ) ( not ( = ?auto_471200 ?auto_471210 ) ) ( not ( = ?auto_471200 ?auto_471211 ) ) ( not ( = ?auto_471201 ?auto_471202 ) ) ( not ( = ?auto_471201 ?auto_471203 ) ) ( not ( = ?auto_471201 ?auto_471204 ) ) ( not ( = ?auto_471201 ?auto_471205 ) ) ( not ( = ?auto_471201 ?auto_471206 ) ) ( not ( = ?auto_471201 ?auto_471207 ) ) ( not ( = ?auto_471201 ?auto_471208 ) ) ( not ( = ?auto_471201 ?auto_471209 ) ) ( not ( = ?auto_471201 ?auto_471210 ) ) ( not ( = ?auto_471201 ?auto_471211 ) ) ( not ( = ?auto_471202 ?auto_471203 ) ) ( not ( = ?auto_471202 ?auto_471204 ) ) ( not ( = ?auto_471202 ?auto_471205 ) ) ( not ( = ?auto_471202 ?auto_471206 ) ) ( not ( = ?auto_471202 ?auto_471207 ) ) ( not ( = ?auto_471202 ?auto_471208 ) ) ( not ( = ?auto_471202 ?auto_471209 ) ) ( not ( = ?auto_471202 ?auto_471210 ) ) ( not ( = ?auto_471202 ?auto_471211 ) ) ( not ( = ?auto_471203 ?auto_471204 ) ) ( not ( = ?auto_471203 ?auto_471205 ) ) ( not ( = ?auto_471203 ?auto_471206 ) ) ( not ( = ?auto_471203 ?auto_471207 ) ) ( not ( = ?auto_471203 ?auto_471208 ) ) ( not ( = ?auto_471203 ?auto_471209 ) ) ( not ( = ?auto_471203 ?auto_471210 ) ) ( not ( = ?auto_471203 ?auto_471211 ) ) ( not ( = ?auto_471204 ?auto_471205 ) ) ( not ( = ?auto_471204 ?auto_471206 ) ) ( not ( = ?auto_471204 ?auto_471207 ) ) ( not ( = ?auto_471204 ?auto_471208 ) ) ( not ( = ?auto_471204 ?auto_471209 ) ) ( not ( = ?auto_471204 ?auto_471210 ) ) ( not ( = ?auto_471204 ?auto_471211 ) ) ( not ( = ?auto_471205 ?auto_471206 ) ) ( not ( = ?auto_471205 ?auto_471207 ) ) ( not ( = ?auto_471205 ?auto_471208 ) ) ( not ( = ?auto_471205 ?auto_471209 ) ) ( not ( = ?auto_471205 ?auto_471210 ) ) ( not ( = ?auto_471205 ?auto_471211 ) ) ( not ( = ?auto_471206 ?auto_471207 ) ) ( not ( = ?auto_471206 ?auto_471208 ) ) ( not ( = ?auto_471206 ?auto_471209 ) ) ( not ( = ?auto_471206 ?auto_471210 ) ) ( not ( = ?auto_471206 ?auto_471211 ) ) ( not ( = ?auto_471207 ?auto_471208 ) ) ( not ( = ?auto_471207 ?auto_471209 ) ) ( not ( = ?auto_471207 ?auto_471210 ) ) ( not ( = ?auto_471207 ?auto_471211 ) ) ( not ( = ?auto_471208 ?auto_471209 ) ) ( not ( = ?auto_471208 ?auto_471210 ) ) ( not ( = ?auto_471208 ?auto_471211 ) ) ( not ( = ?auto_471209 ?auto_471210 ) ) ( not ( = ?auto_471209 ?auto_471211 ) ) ( not ( = ?auto_471210 ?auto_471211 ) ) ( ON ?auto_471196 ?auto_471212 ) ( not ( = ?auto_471211 ?auto_471212 ) ) ( not ( = ?auto_471210 ?auto_471212 ) ) ( not ( = ?auto_471209 ?auto_471212 ) ) ( not ( = ?auto_471208 ?auto_471212 ) ) ( not ( = ?auto_471207 ?auto_471212 ) ) ( not ( = ?auto_471206 ?auto_471212 ) ) ( not ( = ?auto_471205 ?auto_471212 ) ) ( not ( = ?auto_471204 ?auto_471212 ) ) ( not ( = ?auto_471203 ?auto_471212 ) ) ( not ( = ?auto_471202 ?auto_471212 ) ) ( not ( = ?auto_471201 ?auto_471212 ) ) ( not ( = ?auto_471200 ?auto_471212 ) ) ( not ( = ?auto_471199 ?auto_471212 ) ) ( not ( = ?auto_471198 ?auto_471212 ) ) ( not ( = ?auto_471197 ?auto_471212 ) ) ( not ( = ?auto_471196 ?auto_471212 ) ) ( ON ?auto_471197 ?auto_471196 ) ( ON ?auto_471198 ?auto_471197 ) ( ON ?auto_471199 ?auto_471198 ) ( ON ?auto_471200 ?auto_471199 ) ( ON ?auto_471201 ?auto_471200 ) ( ON ?auto_471202 ?auto_471201 ) ( ON ?auto_471203 ?auto_471202 ) ( ON ?auto_471204 ?auto_471203 ) ( ON ?auto_471205 ?auto_471204 ) ( ON ?auto_471206 ?auto_471205 ) ( ON ?auto_471207 ?auto_471206 ) ( ON ?auto_471208 ?auto_471207 ) ( ON ?auto_471209 ?auto_471208 ) ( ON ?auto_471210 ?auto_471209 ) ( ON ?auto_471211 ?auto_471210 ) ( CLEAR ?auto_471211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_471211 ?auto_471210 ?auto_471209 ?auto_471208 ?auto_471207 ?auto_471206 ?auto_471205 ?auto_471204 ?auto_471203 ?auto_471202 ?auto_471201 ?auto_471200 ?auto_471199 ?auto_471198 ?auto_471197 ?auto_471196 )
      ( MAKE-16PILE ?auto_471196 ?auto_471197 ?auto_471198 ?auto_471199 ?auto_471200 ?auto_471201 ?auto_471202 ?auto_471203 ?auto_471204 ?auto_471205 ?auto_471206 ?auto_471207 ?auto_471208 ?auto_471209 ?auto_471210 ?auto_471211 ) )
  )

)

