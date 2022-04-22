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
      ?auto_163946 - BLOCK
    )
    :vars
    (
      ?auto_163947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163946 ?auto_163947 ) ( CLEAR ?auto_163946 ) ( HAND-EMPTY ) ( not ( = ?auto_163946 ?auto_163947 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163946 ?auto_163947 )
      ( !PUTDOWN ?auto_163946 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163953 - BLOCK
      ?auto_163954 - BLOCK
    )
    :vars
    (
      ?auto_163955 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_163953 ) ( ON ?auto_163954 ?auto_163955 ) ( CLEAR ?auto_163954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163953 ) ( not ( = ?auto_163953 ?auto_163954 ) ) ( not ( = ?auto_163953 ?auto_163955 ) ) ( not ( = ?auto_163954 ?auto_163955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163954 ?auto_163955 )
      ( !STACK ?auto_163954 ?auto_163953 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163963 - BLOCK
      ?auto_163964 - BLOCK
    )
    :vars
    (
      ?auto_163965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163964 ?auto_163965 ) ( not ( = ?auto_163963 ?auto_163964 ) ) ( not ( = ?auto_163963 ?auto_163965 ) ) ( not ( = ?auto_163964 ?auto_163965 ) ) ( ON ?auto_163963 ?auto_163964 ) ( CLEAR ?auto_163963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163963 )
      ( MAKE-2PILE ?auto_163963 ?auto_163964 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163974 - BLOCK
      ?auto_163975 - BLOCK
      ?auto_163976 - BLOCK
    )
    :vars
    (
      ?auto_163977 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_163975 ) ( ON ?auto_163976 ?auto_163977 ) ( CLEAR ?auto_163976 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163974 ) ( ON ?auto_163975 ?auto_163974 ) ( not ( = ?auto_163974 ?auto_163975 ) ) ( not ( = ?auto_163974 ?auto_163976 ) ) ( not ( = ?auto_163974 ?auto_163977 ) ) ( not ( = ?auto_163975 ?auto_163976 ) ) ( not ( = ?auto_163975 ?auto_163977 ) ) ( not ( = ?auto_163976 ?auto_163977 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163976 ?auto_163977 )
      ( !STACK ?auto_163976 ?auto_163975 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_163988 - BLOCK
      ?auto_163989 - BLOCK
      ?auto_163990 - BLOCK
    )
    :vars
    (
      ?auto_163991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163990 ?auto_163991 ) ( ON-TABLE ?auto_163988 ) ( not ( = ?auto_163988 ?auto_163989 ) ) ( not ( = ?auto_163988 ?auto_163990 ) ) ( not ( = ?auto_163988 ?auto_163991 ) ) ( not ( = ?auto_163989 ?auto_163990 ) ) ( not ( = ?auto_163989 ?auto_163991 ) ) ( not ( = ?auto_163990 ?auto_163991 ) ) ( CLEAR ?auto_163988 ) ( ON ?auto_163989 ?auto_163990 ) ( CLEAR ?auto_163989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163988 ?auto_163989 )
      ( MAKE-3PILE ?auto_163988 ?auto_163989 ?auto_163990 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164002 - BLOCK
      ?auto_164003 - BLOCK
      ?auto_164004 - BLOCK
    )
    :vars
    (
      ?auto_164005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164004 ?auto_164005 ) ( not ( = ?auto_164002 ?auto_164003 ) ) ( not ( = ?auto_164002 ?auto_164004 ) ) ( not ( = ?auto_164002 ?auto_164005 ) ) ( not ( = ?auto_164003 ?auto_164004 ) ) ( not ( = ?auto_164003 ?auto_164005 ) ) ( not ( = ?auto_164004 ?auto_164005 ) ) ( ON ?auto_164003 ?auto_164004 ) ( ON ?auto_164002 ?auto_164003 ) ( CLEAR ?auto_164002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164002 )
      ( MAKE-3PILE ?auto_164002 ?auto_164003 ?auto_164004 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164017 - BLOCK
      ?auto_164018 - BLOCK
      ?auto_164019 - BLOCK
      ?auto_164020 - BLOCK
    )
    :vars
    (
      ?auto_164021 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_164019 ) ( ON ?auto_164020 ?auto_164021 ) ( CLEAR ?auto_164020 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164017 ) ( ON ?auto_164018 ?auto_164017 ) ( ON ?auto_164019 ?auto_164018 ) ( not ( = ?auto_164017 ?auto_164018 ) ) ( not ( = ?auto_164017 ?auto_164019 ) ) ( not ( = ?auto_164017 ?auto_164020 ) ) ( not ( = ?auto_164017 ?auto_164021 ) ) ( not ( = ?auto_164018 ?auto_164019 ) ) ( not ( = ?auto_164018 ?auto_164020 ) ) ( not ( = ?auto_164018 ?auto_164021 ) ) ( not ( = ?auto_164019 ?auto_164020 ) ) ( not ( = ?auto_164019 ?auto_164021 ) ) ( not ( = ?auto_164020 ?auto_164021 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164020 ?auto_164021 )
      ( !STACK ?auto_164020 ?auto_164019 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164035 - BLOCK
      ?auto_164036 - BLOCK
      ?auto_164037 - BLOCK
      ?auto_164038 - BLOCK
    )
    :vars
    (
      ?auto_164039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164038 ?auto_164039 ) ( ON-TABLE ?auto_164035 ) ( ON ?auto_164036 ?auto_164035 ) ( not ( = ?auto_164035 ?auto_164036 ) ) ( not ( = ?auto_164035 ?auto_164037 ) ) ( not ( = ?auto_164035 ?auto_164038 ) ) ( not ( = ?auto_164035 ?auto_164039 ) ) ( not ( = ?auto_164036 ?auto_164037 ) ) ( not ( = ?auto_164036 ?auto_164038 ) ) ( not ( = ?auto_164036 ?auto_164039 ) ) ( not ( = ?auto_164037 ?auto_164038 ) ) ( not ( = ?auto_164037 ?auto_164039 ) ) ( not ( = ?auto_164038 ?auto_164039 ) ) ( CLEAR ?auto_164036 ) ( ON ?auto_164037 ?auto_164038 ) ( CLEAR ?auto_164037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164035 ?auto_164036 ?auto_164037 )
      ( MAKE-4PILE ?auto_164035 ?auto_164036 ?auto_164037 ?auto_164038 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164053 - BLOCK
      ?auto_164054 - BLOCK
      ?auto_164055 - BLOCK
      ?auto_164056 - BLOCK
    )
    :vars
    (
      ?auto_164057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164056 ?auto_164057 ) ( ON-TABLE ?auto_164053 ) ( not ( = ?auto_164053 ?auto_164054 ) ) ( not ( = ?auto_164053 ?auto_164055 ) ) ( not ( = ?auto_164053 ?auto_164056 ) ) ( not ( = ?auto_164053 ?auto_164057 ) ) ( not ( = ?auto_164054 ?auto_164055 ) ) ( not ( = ?auto_164054 ?auto_164056 ) ) ( not ( = ?auto_164054 ?auto_164057 ) ) ( not ( = ?auto_164055 ?auto_164056 ) ) ( not ( = ?auto_164055 ?auto_164057 ) ) ( not ( = ?auto_164056 ?auto_164057 ) ) ( ON ?auto_164055 ?auto_164056 ) ( CLEAR ?auto_164053 ) ( ON ?auto_164054 ?auto_164055 ) ( CLEAR ?auto_164054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164053 ?auto_164054 )
      ( MAKE-4PILE ?auto_164053 ?auto_164054 ?auto_164055 ?auto_164056 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164071 - BLOCK
      ?auto_164072 - BLOCK
      ?auto_164073 - BLOCK
      ?auto_164074 - BLOCK
    )
    :vars
    (
      ?auto_164075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164074 ?auto_164075 ) ( not ( = ?auto_164071 ?auto_164072 ) ) ( not ( = ?auto_164071 ?auto_164073 ) ) ( not ( = ?auto_164071 ?auto_164074 ) ) ( not ( = ?auto_164071 ?auto_164075 ) ) ( not ( = ?auto_164072 ?auto_164073 ) ) ( not ( = ?auto_164072 ?auto_164074 ) ) ( not ( = ?auto_164072 ?auto_164075 ) ) ( not ( = ?auto_164073 ?auto_164074 ) ) ( not ( = ?auto_164073 ?auto_164075 ) ) ( not ( = ?auto_164074 ?auto_164075 ) ) ( ON ?auto_164073 ?auto_164074 ) ( ON ?auto_164072 ?auto_164073 ) ( ON ?auto_164071 ?auto_164072 ) ( CLEAR ?auto_164071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164071 )
      ( MAKE-4PILE ?auto_164071 ?auto_164072 ?auto_164073 ?auto_164074 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164090 - BLOCK
      ?auto_164091 - BLOCK
      ?auto_164092 - BLOCK
      ?auto_164093 - BLOCK
      ?auto_164094 - BLOCK
    )
    :vars
    (
      ?auto_164095 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_164093 ) ( ON ?auto_164094 ?auto_164095 ) ( CLEAR ?auto_164094 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164090 ) ( ON ?auto_164091 ?auto_164090 ) ( ON ?auto_164092 ?auto_164091 ) ( ON ?auto_164093 ?auto_164092 ) ( not ( = ?auto_164090 ?auto_164091 ) ) ( not ( = ?auto_164090 ?auto_164092 ) ) ( not ( = ?auto_164090 ?auto_164093 ) ) ( not ( = ?auto_164090 ?auto_164094 ) ) ( not ( = ?auto_164090 ?auto_164095 ) ) ( not ( = ?auto_164091 ?auto_164092 ) ) ( not ( = ?auto_164091 ?auto_164093 ) ) ( not ( = ?auto_164091 ?auto_164094 ) ) ( not ( = ?auto_164091 ?auto_164095 ) ) ( not ( = ?auto_164092 ?auto_164093 ) ) ( not ( = ?auto_164092 ?auto_164094 ) ) ( not ( = ?auto_164092 ?auto_164095 ) ) ( not ( = ?auto_164093 ?auto_164094 ) ) ( not ( = ?auto_164093 ?auto_164095 ) ) ( not ( = ?auto_164094 ?auto_164095 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164094 ?auto_164095 )
      ( !STACK ?auto_164094 ?auto_164093 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164112 - BLOCK
      ?auto_164113 - BLOCK
      ?auto_164114 - BLOCK
      ?auto_164115 - BLOCK
      ?auto_164116 - BLOCK
    )
    :vars
    (
      ?auto_164117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164116 ?auto_164117 ) ( ON-TABLE ?auto_164112 ) ( ON ?auto_164113 ?auto_164112 ) ( ON ?auto_164114 ?auto_164113 ) ( not ( = ?auto_164112 ?auto_164113 ) ) ( not ( = ?auto_164112 ?auto_164114 ) ) ( not ( = ?auto_164112 ?auto_164115 ) ) ( not ( = ?auto_164112 ?auto_164116 ) ) ( not ( = ?auto_164112 ?auto_164117 ) ) ( not ( = ?auto_164113 ?auto_164114 ) ) ( not ( = ?auto_164113 ?auto_164115 ) ) ( not ( = ?auto_164113 ?auto_164116 ) ) ( not ( = ?auto_164113 ?auto_164117 ) ) ( not ( = ?auto_164114 ?auto_164115 ) ) ( not ( = ?auto_164114 ?auto_164116 ) ) ( not ( = ?auto_164114 ?auto_164117 ) ) ( not ( = ?auto_164115 ?auto_164116 ) ) ( not ( = ?auto_164115 ?auto_164117 ) ) ( not ( = ?auto_164116 ?auto_164117 ) ) ( CLEAR ?auto_164114 ) ( ON ?auto_164115 ?auto_164116 ) ( CLEAR ?auto_164115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164112 ?auto_164113 ?auto_164114 ?auto_164115 )
      ( MAKE-5PILE ?auto_164112 ?auto_164113 ?auto_164114 ?auto_164115 ?auto_164116 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164134 - BLOCK
      ?auto_164135 - BLOCK
      ?auto_164136 - BLOCK
      ?auto_164137 - BLOCK
      ?auto_164138 - BLOCK
    )
    :vars
    (
      ?auto_164139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164138 ?auto_164139 ) ( ON-TABLE ?auto_164134 ) ( ON ?auto_164135 ?auto_164134 ) ( not ( = ?auto_164134 ?auto_164135 ) ) ( not ( = ?auto_164134 ?auto_164136 ) ) ( not ( = ?auto_164134 ?auto_164137 ) ) ( not ( = ?auto_164134 ?auto_164138 ) ) ( not ( = ?auto_164134 ?auto_164139 ) ) ( not ( = ?auto_164135 ?auto_164136 ) ) ( not ( = ?auto_164135 ?auto_164137 ) ) ( not ( = ?auto_164135 ?auto_164138 ) ) ( not ( = ?auto_164135 ?auto_164139 ) ) ( not ( = ?auto_164136 ?auto_164137 ) ) ( not ( = ?auto_164136 ?auto_164138 ) ) ( not ( = ?auto_164136 ?auto_164139 ) ) ( not ( = ?auto_164137 ?auto_164138 ) ) ( not ( = ?auto_164137 ?auto_164139 ) ) ( not ( = ?auto_164138 ?auto_164139 ) ) ( ON ?auto_164137 ?auto_164138 ) ( CLEAR ?auto_164135 ) ( ON ?auto_164136 ?auto_164137 ) ( CLEAR ?auto_164136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164134 ?auto_164135 ?auto_164136 )
      ( MAKE-5PILE ?auto_164134 ?auto_164135 ?auto_164136 ?auto_164137 ?auto_164138 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164156 - BLOCK
      ?auto_164157 - BLOCK
      ?auto_164158 - BLOCK
      ?auto_164159 - BLOCK
      ?auto_164160 - BLOCK
    )
    :vars
    (
      ?auto_164161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164160 ?auto_164161 ) ( ON-TABLE ?auto_164156 ) ( not ( = ?auto_164156 ?auto_164157 ) ) ( not ( = ?auto_164156 ?auto_164158 ) ) ( not ( = ?auto_164156 ?auto_164159 ) ) ( not ( = ?auto_164156 ?auto_164160 ) ) ( not ( = ?auto_164156 ?auto_164161 ) ) ( not ( = ?auto_164157 ?auto_164158 ) ) ( not ( = ?auto_164157 ?auto_164159 ) ) ( not ( = ?auto_164157 ?auto_164160 ) ) ( not ( = ?auto_164157 ?auto_164161 ) ) ( not ( = ?auto_164158 ?auto_164159 ) ) ( not ( = ?auto_164158 ?auto_164160 ) ) ( not ( = ?auto_164158 ?auto_164161 ) ) ( not ( = ?auto_164159 ?auto_164160 ) ) ( not ( = ?auto_164159 ?auto_164161 ) ) ( not ( = ?auto_164160 ?auto_164161 ) ) ( ON ?auto_164159 ?auto_164160 ) ( ON ?auto_164158 ?auto_164159 ) ( CLEAR ?auto_164156 ) ( ON ?auto_164157 ?auto_164158 ) ( CLEAR ?auto_164157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164156 ?auto_164157 )
      ( MAKE-5PILE ?auto_164156 ?auto_164157 ?auto_164158 ?auto_164159 ?auto_164160 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164178 - BLOCK
      ?auto_164179 - BLOCK
      ?auto_164180 - BLOCK
      ?auto_164181 - BLOCK
      ?auto_164182 - BLOCK
    )
    :vars
    (
      ?auto_164183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164182 ?auto_164183 ) ( not ( = ?auto_164178 ?auto_164179 ) ) ( not ( = ?auto_164178 ?auto_164180 ) ) ( not ( = ?auto_164178 ?auto_164181 ) ) ( not ( = ?auto_164178 ?auto_164182 ) ) ( not ( = ?auto_164178 ?auto_164183 ) ) ( not ( = ?auto_164179 ?auto_164180 ) ) ( not ( = ?auto_164179 ?auto_164181 ) ) ( not ( = ?auto_164179 ?auto_164182 ) ) ( not ( = ?auto_164179 ?auto_164183 ) ) ( not ( = ?auto_164180 ?auto_164181 ) ) ( not ( = ?auto_164180 ?auto_164182 ) ) ( not ( = ?auto_164180 ?auto_164183 ) ) ( not ( = ?auto_164181 ?auto_164182 ) ) ( not ( = ?auto_164181 ?auto_164183 ) ) ( not ( = ?auto_164182 ?auto_164183 ) ) ( ON ?auto_164181 ?auto_164182 ) ( ON ?auto_164180 ?auto_164181 ) ( ON ?auto_164179 ?auto_164180 ) ( ON ?auto_164178 ?auto_164179 ) ( CLEAR ?auto_164178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164178 )
      ( MAKE-5PILE ?auto_164178 ?auto_164179 ?auto_164180 ?auto_164181 ?auto_164182 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164201 - BLOCK
      ?auto_164202 - BLOCK
      ?auto_164203 - BLOCK
      ?auto_164204 - BLOCK
      ?auto_164205 - BLOCK
      ?auto_164206 - BLOCK
    )
    :vars
    (
      ?auto_164207 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_164205 ) ( ON ?auto_164206 ?auto_164207 ) ( CLEAR ?auto_164206 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164201 ) ( ON ?auto_164202 ?auto_164201 ) ( ON ?auto_164203 ?auto_164202 ) ( ON ?auto_164204 ?auto_164203 ) ( ON ?auto_164205 ?auto_164204 ) ( not ( = ?auto_164201 ?auto_164202 ) ) ( not ( = ?auto_164201 ?auto_164203 ) ) ( not ( = ?auto_164201 ?auto_164204 ) ) ( not ( = ?auto_164201 ?auto_164205 ) ) ( not ( = ?auto_164201 ?auto_164206 ) ) ( not ( = ?auto_164201 ?auto_164207 ) ) ( not ( = ?auto_164202 ?auto_164203 ) ) ( not ( = ?auto_164202 ?auto_164204 ) ) ( not ( = ?auto_164202 ?auto_164205 ) ) ( not ( = ?auto_164202 ?auto_164206 ) ) ( not ( = ?auto_164202 ?auto_164207 ) ) ( not ( = ?auto_164203 ?auto_164204 ) ) ( not ( = ?auto_164203 ?auto_164205 ) ) ( not ( = ?auto_164203 ?auto_164206 ) ) ( not ( = ?auto_164203 ?auto_164207 ) ) ( not ( = ?auto_164204 ?auto_164205 ) ) ( not ( = ?auto_164204 ?auto_164206 ) ) ( not ( = ?auto_164204 ?auto_164207 ) ) ( not ( = ?auto_164205 ?auto_164206 ) ) ( not ( = ?auto_164205 ?auto_164207 ) ) ( not ( = ?auto_164206 ?auto_164207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164206 ?auto_164207 )
      ( !STACK ?auto_164206 ?auto_164205 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164227 - BLOCK
      ?auto_164228 - BLOCK
      ?auto_164229 - BLOCK
      ?auto_164230 - BLOCK
      ?auto_164231 - BLOCK
      ?auto_164232 - BLOCK
    )
    :vars
    (
      ?auto_164233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164232 ?auto_164233 ) ( ON-TABLE ?auto_164227 ) ( ON ?auto_164228 ?auto_164227 ) ( ON ?auto_164229 ?auto_164228 ) ( ON ?auto_164230 ?auto_164229 ) ( not ( = ?auto_164227 ?auto_164228 ) ) ( not ( = ?auto_164227 ?auto_164229 ) ) ( not ( = ?auto_164227 ?auto_164230 ) ) ( not ( = ?auto_164227 ?auto_164231 ) ) ( not ( = ?auto_164227 ?auto_164232 ) ) ( not ( = ?auto_164227 ?auto_164233 ) ) ( not ( = ?auto_164228 ?auto_164229 ) ) ( not ( = ?auto_164228 ?auto_164230 ) ) ( not ( = ?auto_164228 ?auto_164231 ) ) ( not ( = ?auto_164228 ?auto_164232 ) ) ( not ( = ?auto_164228 ?auto_164233 ) ) ( not ( = ?auto_164229 ?auto_164230 ) ) ( not ( = ?auto_164229 ?auto_164231 ) ) ( not ( = ?auto_164229 ?auto_164232 ) ) ( not ( = ?auto_164229 ?auto_164233 ) ) ( not ( = ?auto_164230 ?auto_164231 ) ) ( not ( = ?auto_164230 ?auto_164232 ) ) ( not ( = ?auto_164230 ?auto_164233 ) ) ( not ( = ?auto_164231 ?auto_164232 ) ) ( not ( = ?auto_164231 ?auto_164233 ) ) ( not ( = ?auto_164232 ?auto_164233 ) ) ( CLEAR ?auto_164230 ) ( ON ?auto_164231 ?auto_164232 ) ( CLEAR ?auto_164231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164227 ?auto_164228 ?auto_164229 ?auto_164230 ?auto_164231 )
      ( MAKE-6PILE ?auto_164227 ?auto_164228 ?auto_164229 ?auto_164230 ?auto_164231 ?auto_164232 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164253 - BLOCK
      ?auto_164254 - BLOCK
      ?auto_164255 - BLOCK
      ?auto_164256 - BLOCK
      ?auto_164257 - BLOCK
      ?auto_164258 - BLOCK
    )
    :vars
    (
      ?auto_164259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164258 ?auto_164259 ) ( ON-TABLE ?auto_164253 ) ( ON ?auto_164254 ?auto_164253 ) ( ON ?auto_164255 ?auto_164254 ) ( not ( = ?auto_164253 ?auto_164254 ) ) ( not ( = ?auto_164253 ?auto_164255 ) ) ( not ( = ?auto_164253 ?auto_164256 ) ) ( not ( = ?auto_164253 ?auto_164257 ) ) ( not ( = ?auto_164253 ?auto_164258 ) ) ( not ( = ?auto_164253 ?auto_164259 ) ) ( not ( = ?auto_164254 ?auto_164255 ) ) ( not ( = ?auto_164254 ?auto_164256 ) ) ( not ( = ?auto_164254 ?auto_164257 ) ) ( not ( = ?auto_164254 ?auto_164258 ) ) ( not ( = ?auto_164254 ?auto_164259 ) ) ( not ( = ?auto_164255 ?auto_164256 ) ) ( not ( = ?auto_164255 ?auto_164257 ) ) ( not ( = ?auto_164255 ?auto_164258 ) ) ( not ( = ?auto_164255 ?auto_164259 ) ) ( not ( = ?auto_164256 ?auto_164257 ) ) ( not ( = ?auto_164256 ?auto_164258 ) ) ( not ( = ?auto_164256 ?auto_164259 ) ) ( not ( = ?auto_164257 ?auto_164258 ) ) ( not ( = ?auto_164257 ?auto_164259 ) ) ( not ( = ?auto_164258 ?auto_164259 ) ) ( ON ?auto_164257 ?auto_164258 ) ( CLEAR ?auto_164255 ) ( ON ?auto_164256 ?auto_164257 ) ( CLEAR ?auto_164256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164253 ?auto_164254 ?auto_164255 ?auto_164256 )
      ( MAKE-6PILE ?auto_164253 ?auto_164254 ?auto_164255 ?auto_164256 ?auto_164257 ?auto_164258 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164279 - BLOCK
      ?auto_164280 - BLOCK
      ?auto_164281 - BLOCK
      ?auto_164282 - BLOCK
      ?auto_164283 - BLOCK
      ?auto_164284 - BLOCK
    )
    :vars
    (
      ?auto_164285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164284 ?auto_164285 ) ( ON-TABLE ?auto_164279 ) ( ON ?auto_164280 ?auto_164279 ) ( not ( = ?auto_164279 ?auto_164280 ) ) ( not ( = ?auto_164279 ?auto_164281 ) ) ( not ( = ?auto_164279 ?auto_164282 ) ) ( not ( = ?auto_164279 ?auto_164283 ) ) ( not ( = ?auto_164279 ?auto_164284 ) ) ( not ( = ?auto_164279 ?auto_164285 ) ) ( not ( = ?auto_164280 ?auto_164281 ) ) ( not ( = ?auto_164280 ?auto_164282 ) ) ( not ( = ?auto_164280 ?auto_164283 ) ) ( not ( = ?auto_164280 ?auto_164284 ) ) ( not ( = ?auto_164280 ?auto_164285 ) ) ( not ( = ?auto_164281 ?auto_164282 ) ) ( not ( = ?auto_164281 ?auto_164283 ) ) ( not ( = ?auto_164281 ?auto_164284 ) ) ( not ( = ?auto_164281 ?auto_164285 ) ) ( not ( = ?auto_164282 ?auto_164283 ) ) ( not ( = ?auto_164282 ?auto_164284 ) ) ( not ( = ?auto_164282 ?auto_164285 ) ) ( not ( = ?auto_164283 ?auto_164284 ) ) ( not ( = ?auto_164283 ?auto_164285 ) ) ( not ( = ?auto_164284 ?auto_164285 ) ) ( ON ?auto_164283 ?auto_164284 ) ( ON ?auto_164282 ?auto_164283 ) ( CLEAR ?auto_164280 ) ( ON ?auto_164281 ?auto_164282 ) ( CLEAR ?auto_164281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164279 ?auto_164280 ?auto_164281 )
      ( MAKE-6PILE ?auto_164279 ?auto_164280 ?auto_164281 ?auto_164282 ?auto_164283 ?auto_164284 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164305 - BLOCK
      ?auto_164306 - BLOCK
      ?auto_164307 - BLOCK
      ?auto_164308 - BLOCK
      ?auto_164309 - BLOCK
      ?auto_164310 - BLOCK
    )
    :vars
    (
      ?auto_164311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164310 ?auto_164311 ) ( ON-TABLE ?auto_164305 ) ( not ( = ?auto_164305 ?auto_164306 ) ) ( not ( = ?auto_164305 ?auto_164307 ) ) ( not ( = ?auto_164305 ?auto_164308 ) ) ( not ( = ?auto_164305 ?auto_164309 ) ) ( not ( = ?auto_164305 ?auto_164310 ) ) ( not ( = ?auto_164305 ?auto_164311 ) ) ( not ( = ?auto_164306 ?auto_164307 ) ) ( not ( = ?auto_164306 ?auto_164308 ) ) ( not ( = ?auto_164306 ?auto_164309 ) ) ( not ( = ?auto_164306 ?auto_164310 ) ) ( not ( = ?auto_164306 ?auto_164311 ) ) ( not ( = ?auto_164307 ?auto_164308 ) ) ( not ( = ?auto_164307 ?auto_164309 ) ) ( not ( = ?auto_164307 ?auto_164310 ) ) ( not ( = ?auto_164307 ?auto_164311 ) ) ( not ( = ?auto_164308 ?auto_164309 ) ) ( not ( = ?auto_164308 ?auto_164310 ) ) ( not ( = ?auto_164308 ?auto_164311 ) ) ( not ( = ?auto_164309 ?auto_164310 ) ) ( not ( = ?auto_164309 ?auto_164311 ) ) ( not ( = ?auto_164310 ?auto_164311 ) ) ( ON ?auto_164309 ?auto_164310 ) ( ON ?auto_164308 ?auto_164309 ) ( ON ?auto_164307 ?auto_164308 ) ( CLEAR ?auto_164305 ) ( ON ?auto_164306 ?auto_164307 ) ( CLEAR ?auto_164306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164305 ?auto_164306 )
      ( MAKE-6PILE ?auto_164305 ?auto_164306 ?auto_164307 ?auto_164308 ?auto_164309 ?auto_164310 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164331 - BLOCK
      ?auto_164332 - BLOCK
      ?auto_164333 - BLOCK
      ?auto_164334 - BLOCK
      ?auto_164335 - BLOCK
      ?auto_164336 - BLOCK
    )
    :vars
    (
      ?auto_164337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164336 ?auto_164337 ) ( not ( = ?auto_164331 ?auto_164332 ) ) ( not ( = ?auto_164331 ?auto_164333 ) ) ( not ( = ?auto_164331 ?auto_164334 ) ) ( not ( = ?auto_164331 ?auto_164335 ) ) ( not ( = ?auto_164331 ?auto_164336 ) ) ( not ( = ?auto_164331 ?auto_164337 ) ) ( not ( = ?auto_164332 ?auto_164333 ) ) ( not ( = ?auto_164332 ?auto_164334 ) ) ( not ( = ?auto_164332 ?auto_164335 ) ) ( not ( = ?auto_164332 ?auto_164336 ) ) ( not ( = ?auto_164332 ?auto_164337 ) ) ( not ( = ?auto_164333 ?auto_164334 ) ) ( not ( = ?auto_164333 ?auto_164335 ) ) ( not ( = ?auto_164333 ?auto_164336 ) ) ( not ( = ?auto_164333 ?auto_164337 ) ) ( not ( = ?auto_164334 ?auto_164335 ) ) ( not ( = ?auto_164334 ?auto_164336 ) ) ( not ( = ?auto_164334 ?auto_164337 ) ) ( not ( = ?auto_164335 ?auto_164336 ) ) ( not ( = ?auto_164335 ?auto_164337 ) ) ( not ( = ?auto_164336 ?auto_164337 ) ) ( ON ?auto_164335 ?auto_164336 ) ( ON ?auto_164334 ?auto_164335 ) ( ON ?auto_164333 ?auto_164334 ) ( ON ?auto_164332 ?auto_164333 ) ( ON ?auto_164331 ?auto_164332 ) ( CLEAR ?auto_164331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164331 )
      ( MAKE-6PILE ?auto_164331 ?auto_164332 ?auto_164333 ?auto_164334 ?auto_164335 ?auto_164336 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_164358 - BLOCK
      ?auto_164359 - BLOCK
      ?auto_164360 - BLOCK
      ?auto_164361 - BLOCK
      ?auto_164362 - BLOCK
      ?auto_164363 - BLOCK
      ?auto_164364 - BLOCK
    )
    :vars
    (
      ?auto_164365 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_164363 ) ( ON ?auto_164364 ?auto_164365 ) ( CLEAR ?auto_164364 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164358 ) ( ON ?auto_164359 ?auto_164358 ) ( ON ?auto_164360 ?auto_164359 ) ( ON ?auto_164361 ?auto_164360 ) ( ON ?auto_164362 ?auto_164361 ) ( ON ?auto_164363 ?auto_164362 ) ( not ( = ?auto_164358 ?auto_164359 ) ) ( not ( = ?auto_164358 ?auto_164360 ) ) ( not ( = ?auto_164358 ?auto_164361 ) ) ( not ( = ?auto_164358 ?auto_164362 ) ) ( not ( = ?auto_164358 ?auto_164363 ) ) ( not ( = ?auto_164358 ?auto_164364 ) ) ( not ( = ?auto_164358 ?auto_164365 ) ) ( not ( = ?auto_164359 ?auto_164360 ) ) ( not ( = ?auto_164359 ?auto_164361 ) ) ( not ( = ?auto_164359 ?auto_164362 ) ) ( not ( = ?auto_164359 ?auto_164363 ) ) ( not ( = ?auto_164359 ?auto_164364 ) ) ( not ( = ?auto_164359 ?auto_164365 ) ) ( not ( = ?auto_164360 ?auto_164361 ) ) ( not ( = ?auto_164360 ?auto_164362 ) ) ( not ( = ?auto_164360 ?auto_164363 ) ) ( not ( = ?auto_164360 ?auto_164364 ) ) ( not ( = ?auto_164360 ?auto_164365 ) ) ( not ( = ?auto_164361 ?auto_164362 ) ) ( not ( = ?auto_164361 ?auto_164363 ) ) ( not ( = ?auto_164361 ?auto_164364 ) ) ( not ( = ?auto_164361 ?auto_164365 ) ) ( not ( = ?auto_164362 ?auto_164363 ) ) ( not ( = ?auto_164362 ?auto_164364 ) ) ( not ( = ?auto_164362 ?auto_164365 ) ) ( not ( = ?auto_164363 ?auto_164364 ) ) ( not ( = ?auto_164363 ?auto_164365 ) ) ( not ( = ?auto_164364 ?auto_164365 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164364 ?auto_164365 )
      ( !STACK ?auto_164364 ?auto_164363 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_164388 - BLOCK
      ?auto_164389 - BLOCK
      ?auto_164390 - BLOCK
      ?auto_164391 - BLOCK
      ?auto_164392 - BLOCK
      ?auto_164393 - BLOCK
      ?auto_164394 - BLOCK
    )
    :vars
    (
      ?auto_164395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164394 ?auto_164395 ) ( ON-TABLE ?auto_164388 ) ( ON ?auto_164389 ?auto_164388 ) ( ON ?auto_164390 ?auto_164389 ) ( ON ?auto_164391 ?auto_164390 ) ( ON ?auto_164392 ?auto_164391 ) ( not ( = ?auto_164388 ?auto_164389 ) ) ( not ( = ?auto_164388 ?auto_164390 ) ) ( not ( = ?auto_164388 ?auto_164391 ) ) ( not ( = ?auto_164388 ?auto_164392 ) ) ( not ( = ?auto_164388 ?auto_164393 ) ) ( not ( = ?auto_164388 ?auto_164394 ) ) ( not ( = ?auto_164388 ?auto_164395 ) ) ( not ( = ?auto_164389 ?auto_164390 ) ) ( not ( = ?auto_164389 ?auto_164391 ) ) ( not ( = ?auto_164389 ?auto_164392 ) ) ( not ( = ?auto_164389 ?auto_164393 ) ) ( not ( = ?auto_164389 ?auto_164394 ) ) ( not ( = ?auto_164389 ?auto_164395 ) ) ( not ( = ?auto_164390 ?auto_164391 ) ) ( not ( = ?auto_164390 ?auto_164392 ) ) ( not ( = ?auto_164390 ?auto_164393 ) ) ( not ( = ?auto_164390 ?auto_164394 ) ) ( not ( = ?auto_164390 ?auto_164395 ) ) ( not ( = ?auto_164391 ?auto_164392 ) ) ( not ( = ?auto_164391 ?auto_164393 ) ) ( not ( = ?auto_164391 ?auto_164394 ) ) ( not ( = ?auto_164391 ?auto_164395 ) ) ( not ( = ?auto_164392 ?auto_164393 ) ) ( not ( = ?auto_164392 ?auto_164394 ) ) ( not ( = ?auto_164392 ?auto_164395 ) ) ( not ( = ?auto_164393 ?auto_164394 ) ) ( not ( = ?auto_164393 ?auto_164395 ) ) ( not ( = ?auto_164394 ?auto_164395 ) ) ( CLEAR ?auto_164392 ) ( ON ?auto_164393 ?auto_164394 ) ( CLEAR ?auto_164393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164388 ?auto_164389 ?auto_164390 ?auto_164391 ?auto_164392 ?auto_164393 )
      ( MAKE-7PILE ?auto_164388 ?auto_164389 ?auto_164390 ?auto_164391 ?auto_164392 ?auto_164393 ?auto_164394 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_164418 - BLOCK
      ?auto_164419 - BLOCK
      ?auto_164420 - BLOCK
      ?auto_164421 - BLOCK
      ?auto_164422 - BLOCK
      ?auto_164423 - BLOCK
      ?auto_164424 - BLOCK
    )
    :vars
    (
      ?auto_164425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164424 ?auto_164425 ) ( ON-TABLE ?auto_164418 ) ( ON ?auto_164419 ?auto_164418 ) ( ON ?auto_164420 ?auto_164419 ) ( ON ?auto_164421 ?auto_164420 ) ( not ( = ?auto_164418 ?auto_164419 ) ) ( not ( = ?auto_164418 ?auto_164420 ) ) ( not ( = ?auto_164418 ?auto_164421 ) ) ( not ( = ?auto_164418 ?auto_164422 ) ) ( not ( = ?auto_164418 ?auto_164423 ) ) ( not ( = ?auto_164418 ?auto_164424 ) ) ( not ( = ?auto_164418 ?auto_164425 ) ) ( not ( = ?auto_164419 ?auto_164420 ) ) ( not ( = ?auto_164419 ?auto_164421 ) ) ( not ( = ?auto_164419 ?auto_164422 ) ) ( not ( = ?auto_164419 ?auto_164423 ) ) ( not ( = ?auto_164419 ?auto_164424 ) ) ( not ( = ?auto_164419 ?auto_164425 ) ) ( not ( = ?auto_164420 ?auto_164421 ) ) ( not ( = ?auto_164420 ?auto_164422 ) ) ( not ( = ?auto_164420 ?auto_164423 ) ) ( not ( = ?auto_164420 ?auto_164424 ) ) ( not ( = ?auto_164420 ?auto_164425 ) ) ( not ( = ?auto_164421 ?auto_164422 ) ) ( not ( = ?auto_164421 ?auto_164423 ) ) ( not ( = ?auto_164421 ?auto_164424 ) ) ( not ( = ?auto_164421 ?auto_164425 ) ) ( not ( = ?auto_164422 ?auto_164423 ) ) ( not ( = ?auto_164422 ?auto_164424 ) ) ( not ( = ?auto_164422 ?auto_164425 ) ) ( not ( = ?auto_164423 ?auto_164424 ) ) ( not ( = ?auto_164423 ?auto_164425 ) ) ( not ( = ?auto_164424 ?auto_164425 ) ) ( ON ?auto_164423 ?auto_164424 ) ( CLEAR ?auto_164421 ) ( ON ?auto_164422 ?auto_164423 ) ( CLEAR ?auto_164422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164418 ?auto_164419 ?auto_164420 ?auto_164421 ?auto_164422 )
      ( MAKE-7PILE ?auto_164418 ?auto_164419 ?auto_164420 ?auto_164421 ?auto_164422 ?auto_164423 ?auto_164424 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_164448 - BLOCK
      ?auto_164449 - BLOCK
      ?auto_164450 - BLOCK
      ?auto_164451 - BLOCK
      ?auto_164452 - BLOCK
      ?auto_164453 - BLOCK
      ?auto_164454 - BLOCK
    )
    :vars
    (
      ?auto_164455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164454 ?auto_164455 ) ( ON-TABLE ?auto_164448 ) ( ON ?auto_164449 ?auto_164448 ) ( ON ?auto_164450 ?auto_164449 ) ( not ( = ?auto_164448 ?auto_164449 ) ) ( not ( = ?auto_164448 ?auto_164450 ) ) ( not ( = ?auto_164448 ?auto_164451 ) ) ( not ( = ?auto_164448 ?auto_164452 ) ) ( not ( = ?auto_164448 ?auto_164453 ) ) ( not ( = ?auto_164448 ?auto_164454 ) ) ( not ( = ?auto_164448 ?auto_164455 ) ) ( not ( = ?auto_164449 ?auto_164450 ) ) ( not ( = ?auto_164449 ?auto_164451 ) ) ( not ( = ?auto_164449 ?auto_164452 ) ) ( not ( = ?auto_164449 ?auto_164453 ) ) ( not ( = ?auto_164449 ?auto_164454 ) ) ( not ( = ?auto_164449 ?auto_164455 ) ) ( not ( = ?auto_164450 ?auto_164451 ) ) ( not ( = ?auto_164450 ?auto_164452 ) ) ( not ( = ?auto_164450 ?auto_164453 ) ) ( not ( = ?auto_164450 ?auto_164454 ) ) ( not ( = ?auto_164450 ?auto_164455 ) ) ( not ( = ?auto_164451 ?auto_164452 ) ) ( not ( = ?auto_164451 ?auto_164453 ) ) ( not ( = ?auto_164451 ?auto_164454 ) ) ( not ( = ?auto_164451 ?auto_164455 ) ) ( not ( = ?auto_164452 ?auto_164453 ) ) ( not ( = ?auto_164452 ?auto_164454 ) ) ( not ( = ?auto_164452 ?auto_164455 ) ) ( not ( = ?auto_164453 ?auto_164454 ) ) ( not ( = ?auto_164453 ?auto_164455 ) ) ( not ( = ?auto_164454 ?auto_164455 ) ) ( ON ?auto_164453 ?auto_164454 ) ( ON ?auto_164452 ?auto_164453 ) ( CLEAR ?auto_164450 ) ( ON ?auto_164451 ?auto_164452 ) ( CLEAR ?auto_164451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164448 ?auto_164449 ?auto_164450 ?auto_164451 )
      ( MAKE-7PILE ?auto_164448 ?auto_164449 ?auto_164450 ?auto_164451 ?auto_164452 ?auto_164453 ?auto_164454 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_164478 - BLOCK
      ?auto_164479 - BLOCK
      ?auto_164480 - BLOCK
      ?auto_164481 - BLOCK
      ?auto_164482 - BLOCK
      ?auto_164483 - BLOCK
      ?auto_164484 - BLOCK
    )
    :vars
    (
      ?auto_164485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164484 ?auto_164485 ) ( ON-TABLE ?auto_164478 ) ( ON ?auto_164479 ?auto_164478 ) ( not ( = ?auto_164478 ?auto_164479 ) ) ( not ( = ?auto_164478 ?auto_164480 ) ) ( not ( = ?auto_164478 ?auto_164481 ) ) ( not ( = ?auto_164478 ?auto_164482 ) ) ( not ( = ?auto_164478 ?auto_164483 ) ) ( not ( = ?auto_164478 ?auto_164484 ) ) ( not ( = ?auto_164478 ?auto_164485 ) ) ( not ( = ?auto_164479 ?auto_164480 ) ) ( not ( = ?auto_164479 ?auto_164481 ) ) ( not ( = ?auto_164479 ?auto_164482 ) ) ( not ( = ?auto_164479 ?auto_164483 ) ) ( not ( = ?auto_164479 ?auto_164484 ) ) ( not ( = ?auto_164479 ?auto_164485 ) ) ( not ( = ?auto_164480 ?auto_164481 ) ) ( not ( = ?auto_164480 ?auto_164482 ) ) ( not ( = ?auto_164480 ?auto_164483 ) ) ( not ( = ?auto_164480 ?auto_164484 ) ) ( not ( = ?auto_164480 ?auto_164485 ) ) ( not ( = ?auto_164481 ?auto_164482 ) ) ( not ( = ?auto_164481 ?auto_164483 ) ) ( not ( = ?auto_164481 ?auto_164484 ) ) ( not ( = ?auto_164481 ?auto_164485 ) ) ( not ( = ?auto_164482 ?auto_164483 ) ) ( not ( = ?auto_164482 ?auto_164484 ) ) ( not ( = ?auto_164482 ?auto_164485 ) ) ( not ( = ?auto_164483 ?auto_164484 ) ) ( not ( = ?auto_164483 ?auto_164485 ) ) ( not ( = ?auto_164484 ?auto_164485 ) ) ( ON ?auto_164483 ?auto_164484 ) ( ON ?auto_164482 ?auto_164483 ) ( ON ?auto_164481 ?auto_164482 ) ( CLEAR ?auto_164479 ) ( ON ?auto_164480 ?auto_164481 ) ( CLEAR ?auto_164480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164478 ?auto_164479 ?auto_164480 )
      ( MAKE-7PILE ?auto_164478 ?auto_164479 ?auto_164480 ?auto_164481 ?auto_164482 ?auto_164483 ?auto_164484 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_164508 - BLOCK
      ?auto_164509 - BLOCK
      ?auto_164510 - BLOCK
      ?auto_164511 - BLOCK
      ?auto_164512 - BLOCK
      ?auto_164513 - BLOCK
      ?auto_164514 - BLOCK
    )
    :vars
    (
      ?auto_164515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164514 ?auto_164515 ) ( ON-TABLE ?auto_164508 ) ( not ( = ?auto_164508 ?auto_164509 ) ) ( not ( = ?auto_164508 ?auto_164510 ) ) ( not ( = ?auto_164508 ?auto_164511 ) ) ( not ( = ?auto_164508 ?auto_164512 ) ) ( not ( = ?auto_164508 ?auto_164513 ) ) ( not ( = ?auto_164508 ?auto_164514 ) ) ( not ( = ?auto_164508 ?auto_164515 ) ) ( not ( = ?auto_164509 ?auto_164510 ) ) ( not ( = ?auto_164509 ?auto_164511 ) ) ( not ( = ?auto_164509 ?auto_164512 ) ) ( not ( = ?auto_164509 ?auto_164513 ) ) ( not ( = ?auto_164509 ?auto_164514 ) ) ( not ( = ?auto_164509 ?auto_164515 ) ) ( not ( = ?auto_164510 ?auto_164511 ) ) ( not ( = ?auto_164510 ?auto_164512 ) ) ( not ( = ?auto_164510 ?auto_164513 ) ) ( not ( = ?auto_164510 ?auto_164514 ) ) ( not ( = ?auto_164510 ?auto_164515 ) ) ( not ( = ?auto_164511 ?auto_164512 ) ) ( not ( = ?auto_164511 ?auto_164513 ) ) ( not ( = ?auto_164511 ?auto_164514 ) ) ( not ( = ?auto_164511 ?auto_164515 ) ) ( not ( = ?auto_164512 ?auto_164513 ) ) ( not ( = ?auto_164512 ?auto_164514 ) ) ( not ( = ?auto_164512 ?auto_164515 ) ) ( not ( = ?auto_164513 ?auto_164514 ) ) ( not ( = ?auto_164513 ?auto_164515 ) ) ( not ( = ?auto_164514 ?auto_164515 ) ) ( ON ?auto_164513 ?auto_164514 ) ( ON ?auto_164512 ?auto_164513 ) ( ON ?auto_164511 ?auto_164512 ) ( ON ?auto_164510 ?auto_164511 ) ( CLEAR ?auto_164508 ) ( ON ?auto_164509 ?auto_164510 ) ( CLEAR ?auto_164509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164508 ?auto_164509 )
      ( MAKE-7PILE ?auto_164508 ?auto_164509 ?auto_164510 ?auto_164511 ?auto_164512 ?auto_164513 ?auto_164514 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_164538 - BLOCK
      ?auto_164539 - BLOCK
      ?auto_164540 - BLOCK
      ?auto_164541 - BLOCK
      ?auto_164542 - BLOCK
      ?auto_164543 - BLOCK
      ?auto_164544 - BLOCK
    )
    :vars
    (
      ?auto_164545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164544 ?auto_164545 ) ( not ( = ?auto_164538 ?auto_164539 ) ) ( not ( = ?auto_164538 ?auto_164540 ) ) ( not ( = ?auto_164538 ?auto_164541 ) ) ( not ( = ?auto_164538 ?auto_164542 ) ) ( not ( = ?auto_164538 ?auto_164543 ) ) ( not ( = ?auto_164538 ?auto_164544 ) ) ( not ( = ?auto_164538 ?auto_164545 ) ) ( not ( = ?auto_164539 ?auto_164540 ) ) ( not ( = ?auto_164539 ?auto_164541 ) ) ( not ( = ?auto_164539 ?auto_164542 ) ) ( not ( = ?auto_164539 ?auto_164543 ) ) ( not ( = ?auto_164539 ?auto_164544 ) ) ( not ( = ?auto_164539 ?auto_164545 ) ) ( not ( = ?auto_164540 ?auto_164541 ) ) ( not ( = ?auto_164540 ?auto_164542 ) ) ( not ( = ?auto_164540 ?auto_164543 ) ) ( not ( = ?auto_164540 ?auto_164544 ) ) ( not ( = ?auto_164540 ?auto_164545 ) ) ( not ( = ?auto_164541 ?auto_164542 ) ) ( not ( = ?auto_164541 ?auto_164543 ) ) ( not ( = ?auto_164541 ?auto_164544 ) ) ( not ( = ?auto_164541 ?auto_164545 ) ) ( not ( = ?auto_164542 ?auto_164543 ) ) ( not ( = ?auto_164542 ?auto_164544 ) ) ( not ( = ?auto_164542 ?auto_164545 ) ) ( not ( = ?auto_164543 ?auto_164544 ) ) ( not ( = ?auto_164543 ?auto_164545 ) ) ( not ( = ?auto_164544 ?auto_164545 ) ) ( ON ?auto_164543 ?auto_164544 ) ( ON ?auto_164542 ?auto_164543 ) ( ON ?auto_164541 ?auto_164542 ) ( ON ?auto_164540 ?auto_164541 ) ( ON ?auto_164539 ?auto_164540 ) ( ON ?auto_164538 ?auto_164539 ) ( CLEAR ?auto_164538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164538 )
      ( MAKE-7PILE ?auto_164538 ?auto_164539 ?auto_164540 ?auto_164541 ?auto_164542 ?auto_164543 ?auto_164544 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_164569 - BLOCK
      ?auto_164570 - BLOCK
      ?auto_164571 - BLOCK
      ?auto_164572 - BLOCK
      ?auto_164573 - BLOCK
      ?auto_164574 - BLOCK
      ?auto_164575 - BLOCK
      ?auto_164576 - BLOCK
    )
    :vars
    (
      ?auto_164577 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_164575 ) ( ON ?auto_164576 ?auto_164577 ) ( CLEAR ?auto_164576 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164569 ) ( ON ?auto_164570 ?auto_164569 ) ( ON ?auto_164571 ?auto_164570 ) ( ON ?auto_164572 ?auto_164571 ) ( ON ?auto_164573 ?auto_164572 ) ( ON ?auto_164574 ?auto_164573 ) ( ON ?auto_164575 ?auto_164574 ) ( not ( = ?auto_164569 ?auto_164570 ) ) ( not ( = ?auto_164569 ?auto_164571 ) ) ( not ( = ?auto_164569 ?auto_164572 ) ) ( not ( = ?auto_164569 ?auto_164573 ) ) ( not ( = ?auto_164569 ?auto_164574 ) ) ( not ( = ?auto_164569 ?auto_164575 ) ) ( not ( = ?auto_164569 ?auto_164576 ) ) ( not ( = ?auto_164569 ?auto_164577 ) ) ( not ( = ?auto_164570 ?auto_164571 ) ) ( not ( = ?auto_164570 ?auto_164572 ) ) ( not ( = ?auto_164570 ?auto_164573 ) ) ( not ( = ?auto_164570 ?auto_164574 ) ) ( not ( = ?auto_164570 ?auto_164575 ) ) ( not ( = ?auto_164570 ?auto_164576 ) ) ( not ( = ?auto_164570 ?auto_164577 ) ) ( not ( = ?auto_164571 ?auto_164572 ) ) ( not ( = ?auto_164571 ?auto_164573 ) ) ( not ( = ?auto_164571 ?auto_164574 ) ) ( not ( = ?auto_164571 ?auto_164575 ) ) ( not ( = ?auto_164571 ?auto_164576 ) ) ( not ( = ?auto_164571 ?auto_164577 ) ) ( not ( = ?auto_164572 ?auto_164573 ) ) ( not ( = ?auto_164572 ?auto_164574 ) ) ( not ( = ?auto_164572 ?auto_164575 ) ) ( not ( = ?auto_164572 ?auto_164576 ) ) ( not ( = ?auto_164572 ?auto_164577 ) ) ( not ( = ?auto_164573 ?auto_164574 ) ) ( not ( = ?auto_164573 ?auto_164575 ) ) ( not ( = ?auto_164573 ?auto_164576 ) ) ( not ( = ?auto_164573 ?auto_164577 ) ) ( not ( = ?auto_164574 ?auto_164575 ) ) ( not ( = ?auto_164574 ?auto_164576 ) ) ( not ( = ?auto_164574 ?auto_164577 ) ) ( not ( = ?auto_164575 ?auto_164576 ) ) ( not ( = ?auto_164575 ?auto_164577 ) ) ( not ( = ?auto_164576 ?auto_164577 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164576 ?auto_164577 )
      ( !STACK ?auto_164576 ?auto_164575 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_164603 - BLOCK
      ?auto_164604 - BLOCK
      ?auto_164605 - BLOCK
      ?auto_164606 - BLOCK
      ?auto_164607 - BLOCK
      ?auto_164608 - BLOCK
      ?auto_164609 - BLOCK
      ?auto_164610 - BLOCK
    )
    :vars
    (
      ?auto_164611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164610 ?auto_164611 ) ( ON-TABLE ?auto_164603 ) ( ON ?auto_164604 ?auto_164603 ) ( ON ?auto_164605 ?auto_164604 ) ( ON ?auto_164606 ?auto_164605 ) ( ON ?auto_164607 ?auto_164606 ) ( ON ?auto_164608 ?auto_164607 ) ( not ( = ?auto_164603 ?auto_164604 ) ) ( not ( = ?auto_164603 ?auto_164605 ) ) ( not ( = ?auto_164603 ?auto_164606 ) ) ( not ( = ?auto_164603 ?auto_164607 ) ) ( not ( = ?auto_164603 ?auto_164608 ) ) ( not ( = ?auto_164603 ?auto_164609 ) ) ( not ( = ?auto_164603 ?auto_164610 ) ) ( not ( = ?auto_164603 ?auto_164611 ) ) ( not ( = ?auto_164604 ?auto_164605 ) ) ( not ( = ?auto_164604 ?auto_164606 ) ) ( not ( = ?auto_164604 ?auto_164607 ) ) ( not ( = ?auto_164604 ?auto_164608 ) ) ( not ( = ?auto_164604 ?auto_164609 ) ) ( not ( = ?auto_164604 ?auto_164610 ) ) ( not ( = ?auto_164604 ?auto_164611 ) ) ( not ( = ?auto_164605 ?auto_164606 ) ) ( not ( = ?auto_164605 ?auto_164607 ) ) ( not ( = ?auto_164605 ?auto_164608 ) ) ( not ( = ?auto_164605 ?auto_164609 ) ) ( not ( = ?auto_164605 ?auto_164610 ) ) ( not ( = ?auto_164605 ?auto_164611 ) ) ( not ( = ?auto_164606 ?auto_164607 ) ) ( not ( = ?auto_164606 ?auto_164608 ) ) ( not ( = ?auto_164606 ?auto_164609 ) ) ( not ( = ?auto_164606 ?auto_164610 ) ) ( not ( = ?auto_164606 ?auto_164611 ) ) ( not ( = ?auto_164607 ?auto_164608 ) ) ( not ( = ?auto_164607 ?auto_164609 ) ) ( not ( = ?auto_164607 ?auto_164610 ) ) ( not ( = ?auto_164607 ?auto_164611 ) ) ( not ( = ?auto_164608 ?auto_164609 ) ) ( not ( = ?auto_164608 ?auto_164610 ) ) ( not ( = ?auto_164608 ?auto_164611 ) ) ( not ( = ?auto_164609 ?auto_164610 ) ) ( not ( = ?auto_164609 ?auto_164611 ) ) ( not ( = ?auto_164610 ?auto_164611 ) ) ( CLEAR ?auto_164608 ) ( ON ?auto_164609 ?auto_164610 ) ( CLEAR ?auto_164609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164603 ?auto_164604 ?auto_164605 ?auto_164606 ?auto_164607 ?auto_164608 ?auto_164609 )
      ( MAKE-8PILE ?auto_164603 ?auto_164604 ?auto_164605 ?auto_164606 ?auto_164607 ?auto_164608 ?auto_164609 ?auto_164610 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_164637 - BLOCK
      ?auto_164638 - BLOCK
      ?auto_164639 - BLOCK
      ?auto_164640 - BLOCK
      ?auto_164641 - BLOCK
      ?auto_164642 - BLOCK
      ?auto_164643 - BLOCK
      ?auto_164644 - BLOCK
    )
    :vars
    (
      ?auto_164645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164644 ?auto_164645 ) ( ON-TABLE ?auto_164637 ) ( ON ?auto_164638 ?auto_164637 ) ( ON ?auto_164639 ?auto_164638 ) ( ON ?auto_164640 ?auto_164639 ) ( ON ?auto_164641 ?auto_164640 ) ( not ( = ?auto_164637 ?auto_164638 ) ) ( not ( = ?auto_164637 ?auto_164639 ) ) ( not ( = ?auto_164637 ?auto_164640 ) ) ( not ( = ?auto_164637 ?auto_164641 ) ) ( not ( = ?auto_164637 ?auto_164642 ) ) ( not ( = ?auto_164637 ?auto_164643 ) ) ( not ( = ?auto_164637 ?auto_164644 ) ) ( not ( = ?auto_164637 ?auto_164645 ) ) ( not ( = ?auto_164638 ?auto_164639 ) ) ( not ( = ?auto_164638 ?auto_164640 ) ) ( not ( = ?auto_164638 ?auto_164641 ) ) ( not ( = ?auto_164638 ?auto_164642 ) ) ( not ( = ?auto_164638 ?auto_164643 ) ) ( not ( = ?auto_164638 ?auto_164644 ) ) ( not ( = ?auto_164638 ?auto_164645 ) ) ( not ( = ?auto_164639 ?auto_164640 ) ) ( not ( = ?auto_164639 ?auto_164641 ) ) ( not ( = ?auto_164639 ?auto_164642 ) ) ( not ( = ?auto_164639 ?auto_164643 ) ) ( not ( = ?auto_164639 ?auto_164644 ) ) ( not ( = ?auto_164639 ?auto_164645 ) ) ( not ( = ?auto_164640 ?auto_164641 ) ) ( not ( = ?auto_164640 ?auto_164642 ) ) ( not ( = ?auto_164640 ?auto_164643 ) ) ( not ( = ?auto_164640 ?auto_164644 ) ) ( not ( = ?auto_164640 ?auto_164645 ) ) ( not ( = ?auto_164641 ?auto_164642 ) ) ( not ( = ?auto_164641 ?auto_164643 ) ) ( not ( = ?auto_164641 ?auto_164644 ) ) ( not ( = ?auto_164641 ?auto_164645 ) ) ( not ( = ?auto_164642 ?auto_164643 ) ) ( not ( = ?auto_164642 ?auto_164644 ) ) ( not ( = ?auto_164642 ?auto_164645 ) ) ( not ( = ?auto_164643 ?auto_164644 ) ) ( not ( = ?auto_164643 ?auto_164645 ) ) ( not ( = ?auto_164644 ?auto_164645 ) ) ( ON ?auto_164643 ?auto_164644 ) ( CLEAR ?auto_164641 ) ( ON ?auto_164642 ?auto_164643 ) ( CLEAR ?auto_164642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164637 ?auto_164638 ?auto_164639 ?auto_164640 ?auto_164641 ?auto_164642 )
      ( MAKE-8PILE ?auto_164637 ?auto_164638 ?auto_164639 ?auto_164640 ?auto_164641 ?auto_164642 ?auto_164643 ?auto_164644 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_164671 - BLOCK
      ?auto_164672 - BLOCK
      ?auto_164673 - BLOCK
      ?auto_164674 - BLOCK
      ?auto_164675 - BLOCK
      ?auto_164676 - BLOCK
      ?auto_164677 - BLOCK
      ?auto_164678 - BLOCK
    )
    :vars
    (
      ?auto_164679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164678 ?auto_164679 ) ( ON-TABLE ?auto_164671 ) ( ON ?auto_164672 ?auto_164671 ) ( ON ?auto_164673 ?auto_164672 ) ( ON ?auto_164674 ?auto_164673 ) ( not ( = ?auto_164671 ?auto_164672 ) ) ( not ( = ?auto_164671 ?auto_164673 ) ) ( not ( = ?auto_164671 ?auto_164674 ) ) ( not ( = ?auto_164671 ?auto_164675 ) ) ( not ( = ?auto_164671 ?auto_164676 ) ) ( not ( = ?auto_164671 ?auto_164677 ) ) ( not ( = ?auto_164671 ?auto_164678 ) ) ( not ( = ?auto_164671 ?auto_164679 ) ) ( not ( = ?auto_164672 ?auto_164673 ) ) ( not ( = ?auto_164672 ?auto_164674 ) ) ( not ( = ?auto_164672 ?auto_164675 ) ) ( not ( = ?auto_164672 ?auto_164676 ) ) ( not ( = ?auto_164672 ?auto_164677 ) ) ( not ( = ?auto_164672 ?auto_164678 ) ) ( not ( = ?auto_164672 ?auto_164679 ) ) ( not ( = ?auto_164673 ?auto_164674 ) ) ( not ( = ?auto_164673 ?auto_164675 ) ) ( not ( = ?auto_164673 ?auto_164676 ) ) ( not ( = ?auto_164673 ?auto_164677 ) ) ( not ( = ?auto_164673 ?auto_164678 ) ) ( not ( = ?auto_164673 ?auto_164679 ) ) ( not ( = ?auto_164674 ?auto_164675 ) ) ( not ( = ?auto_164674 ?auto_164676 ) ) ( not ( = ?auto_164674 ?auto_164677 ) ) ( not ( = ?auto_164674 ?auto_164678 ) ) ( not ( = ?auto_164674 ?auto_164679 ) ) ( not ( = ?auto_164675 ?auto_164676 ) ) ( not ( = ?auto_164675 ?auto_164677 ) ) ( not ( = ?auto_164675 ?auto_164678 ) ) ( not ( = ?auto_164675 ?auto_164679 ) ) ( not ( = ?auto_164676 ?auto_164677 ) ) ( not ( = ?auto_164676 ?auto_164678 ) ) ( not ( = ?auto_164676 ?auto_164679 ) ) ( not ( = ?auto_164677 ?auto_164678 ) ) ( not ( = ?auto_164677 ?auto_164679 ) ) ( not ( = ?auto_164678 ?auto_164679 ) ) ( ON ?auto_164677 ?auto_164678 ) ( ON ?auto_164676 ?auto_164677 ) ( CLEAR ?auto_164674 ) ( ON ?auto_164675 ?auto_164676 ) ( CLEAR ?auto_164675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164671 ?auto_164672 ?auto_164673 ?auto_164674 ?auto_164675 )
      ( MAKE-8PILE ?auto_164671 ?auto_164672 ?auto_164673 ?auto_164674 ?auto_164675 ?auto_164676 ?auto_164677 ?auto_164678 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_164705 - BLOCK
      ?auto_164706 - BLOCK
      ?auto_164707 - BLOCK
      ?auto_164708 - BLOCK
      ?auto_164709 - BLOCK
      ?auto_164710 - BLOCK
      ?auto_164711 - BLOCK
      ?auto_164712 - BLOCK
    )
    :vars
    (
      ?auto_164713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164712 ?auto_164713 ) ( ON-TABLE ?auto_164705 ) ( ON ?auto_164706 ?auto_164705 ) ( ON ?auto_164707 ?auto_164706 ) ( not ( = ?auto_164705 ?auto_164706 ) ) ( not ( = ?auto_164705 ?auto_164707 ) ) ( not ( = ?auto_164705 ?auto_164708 ) ) ( not ( = ?auto_164705 ?auto_164709 ) ) ( not ( = ?auto_164705 ?auto_164710 ) ) ( not ( = ?auto_164705 ?auto_164711 ) ) ( not ( = ?auto_164705 ?auto_164712 ) ) ( not ( = ?auto_164705 ?auto_164713 ) ) ( not ( = ?auto_164706 ?auto_164707 ) ) ( not ( = ?auto_164706 ?auto_164708 ) ) ( not ( = ?auto_164706 ?auto_164709 ) ) ( not ( = ?auto_164706 ?auto_164710 ) ) ( not ( = ?auto_164706 ?auto_164711 ) ) ( not ( = ?auto_164706 ?auto_164712 ) ) ( not ( = ?auto_164706 ?auto_164713 ) ) ( not ( = ?auto_164707 ?auto_164708 ) ) ( not ( = ?auto_164707 ?auto_164709 ) ) ( not ( = ?auto_164707 ?auto_164710 ) ) ( not ( = ?auto_164707 ?auto_164711 ) ) ( not ( = ?auto_164707 ?auto_164712 ) ) ( not ( = ?auto_164707 ?auto_164713 ) ) ( not ( = ?auto_164708 ?auto_164709 ) ) ( not ( = ?auto_164708 ?auto_164710 ) ) ( not ( = ?auto_164708 ?auto_164711 ) ) ( not ( = ?auto_164708 ?auto_164712 ) ) ( not ( = ?auto_164708 ?auto_164713 ) ) ( not ( = ?auto_164709 ?auto_164710 ) ) ( not ( = ?auto_164709 ?auto_164711 ) ) ( not ( = ?auto_164709 ?auto_164712 ) ) ( not ( = ?auto_164709 ?auto_164713 ) ) ( not ( = ?auto_164710 ?auto_164711 ) ) ( not ( = ?auto_164710 ?auto_164712 ) ) ( not ( = ?auto_164710 ?auto_164713 ) ) ( not ( = ?auto_164711 ?auto_164712 ) ) ( not ( = ?auto_164711 ?auto_164713 ) ) ( not ( = ?auto_164712 ?auto_164713 ) ) ( ON ?auto_164711 ?auto_164712 ) ( ON ?auto_164710 ?auto_164711 ) ( ON ?auto_164709 ?auto_164710 ) ( CLEAR ?auto_164707 ) ( ON ?auto_164708 ?auto_164709 ) ( CLEAR ?auto_164708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164705 ?auto_164706 ?auto_164707 ?auto_164708 )
      ( MAKE-8PILE ?auto_164705 ?auto_164706 ?auto_164707 ?auto_164708 ?auto_164709 ?auto_164710 ?auto_164711 ?auto_164712 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_164739 - BLOCK
      ?auto_164740 - BLOCK
      ?auto_164741 - BLOCK
      ?auto_164742 - BLOCK
      ?auto_164743 - BLOCK
      ?auto_164744 - BLOCK
      ?auto_164745 - BLOCK
      ?auto_164746 - BLOCK
    )
    :vars
    (
      ?auto_164747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164746 ?auto_164747 ) ( ON-TABLE ?auto_164739 ) ( ON ?auto_164740 ?auto_164739 ) ( not ( = ?auto_164739 ?auto_164740 ) ) ( not ( = ?auto_164739 ?auto_164741 ) ) ( not ( = ?auto_164739 ?auto_164742 ) ) ( not ( = ?auto_164739 ?auto_164743 ) ) ( not ( = ?auto_164739 ?auto_164744 ) ) ( not ( = ?auto_164739 ?auto_164745 ) ) ( not ( = ?auto_164739 ?auto_164746 ) ) ( not ( = ?auto_164739 ?auto_164747 ) ) ( not ( = ?auto_164740 ?auto_164741 ) ) ( not ( = ?auto_164740 ?auto_164742 ) ) ( not ( = ?auto_164740 ?auto_164743 ) ) ( not ( = ?auto_164740 ?auto_164744 ) ) ( not ( = ?auto_164740 ?auto_164745 ) ) ( not ( = ?auto_164740 ?auto_164746 ) ) ( not ( = ?auto_164740 ?auto_164747 ) ) ( not ( = ?auto_164741 ?auto_164742 ) ) ( not ( = ?auto_164741 ?auto_164743 ) ) ( not ( = ?auto_164741 ?auto_164744 ) ) ( not ( = ?auto_164741 ?auto_164745 ) ) ( not ( = ?auto_164741 ?auto_164746 ) ) ( not ( = ?auto_164741 ?auto_164747 ) ) ( not ( = ?auto_164742 ?auto_164743 ) ) ( not ( = ?auto_164742 ?auto_164744 ) ) ( not ( = ?auto_164742 ?auto_164745 ) ) ( not ( = ?auto_164742 ?auto_164746 ) ) ( not ( = ?auto_164742 ?auto_164747 ) ) ( not ( = ?auto_164743 ?auto_164744 ) ) ( not ( = ?auto_164743 ?auto_164745 ) ) ( not ( = ?auto_164743 ?auto_164746 ) ) ( not ( = ?auto_164743 ?auto_164747 ) ) ( not ( = ?auto_164744 ?auto_164745 ) ) ( not ( = ?auto_164744 ?auto_164746 ) ) ( not ( = ?auto_164744 ?auto_164747 ) ) ( not ( = ?auto_164745 ?auto_164746 ) ) ( not ( = ?auto_164745 ?auto_164747 ) ) ( not ( = ?auto_164746 ?auto_164747 ) ) ( ON ?auto_164745 ?auto_164746 ) ( ON ?auto_164744 ?auto_164745 ) ( ON ?auto_164743 ?auto_164744 ) ( ON ?auto_164742 ?auto_164743 ) ( CLEAR ?auto_164740 ) ( ON ?auto_164741 ?auto_164742 ) ( CLEAR ?auto_164741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164739 ?auto_164740 ?auto_164741 )
      ( MAKE-8PILE ?auto_164739 ?auto_164740 ?auto_164741 ?auto_164742 ?auto_164743 ?auto_164744 ?auto_164745 ?auto_164746 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_164773 - BLOCK
      ?auto_164774 - BLOCK
      ?auto_164775 - BLOCK
      ?auto_164776 - BLOCK
      ?auto_164777 - BLOCK
      ?auto_164778 - BLOCK
      ?auto_164779 - BLOCK
      ?auto_164780 - BLOCK
    )
    :vars
    (
      ?auto_164781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164780 ?auto_164781 ) ( ON-TABLE ?auto_164773 ) ( not ( = ?auto_164773 ?auto_164774 ) ) ( not ( = ?auto_164773 ?auto_164775 ) ) ( not ( = ?auto_164773 ?auto_164776 ) ) ( not ( = ?auto_164773 ?auto_164777 ) ) ( not ( = ?auto_164773 ?auto_164778 ) ) ( not ( = ?auto_164773 ?auto_164779 ) ) ( not ( = ?auto_164773 ?auto_164780 ) ) ( not ( = ?auto_164773 ?auto_164781 ) ) ( not ( = ?auto_164774 ?auto_164775 ) ) ( not ( = ?auto_164774 ?auto_164776 ) ) ( not ( = ?auto_164774 ?auto_164777 ) ) ( not ( = ?auto_164774 ?auto_164778 ) ) ( not ( = ?auto_164774 ?auto_164779 ) ) ( not ( = ?auto_164774 ?auto_164780 ) ) ( not ( = ?auto_164774 ?auto_164781 ) ) ( not ( = ?auto_164775 ?auto_164776 ) ) ( not ( = ?auto_164775 ?auto_164777 ) ) ( not ( = ?auto_164775 ?auto_164778 ) ) ( not ( = ?auto_164775 ?auto_164779 ) ) ( not ( = ?auto_164775 ?auto_164780 ) ) ( not ( = ?auto_164775 ?auto_164781 ) ) ( not ( = ?auto_164776 ?auto_164777 ) ) ( not ( = ?auto_164776 ?auto_164778 ) ) ( not ( = ?auto_164776 ?auto_164779 ) ) ( not ( = ?auto_164776 ?auto_164780 ) ) ( not ( = ?auto_164776 ?auto_164781 ) ) ( not ( = ?auto_164777 ?auto_164778 ) ) ( not ( = ?auto_164777 ?auto_164779 ) ) ( not ( = ?auto_164777 ?auto_164780 ) ) ( not ( = ?auto_164777 ?auto_164781 ) ) ( not ( = ?auto_164778 ?auto_164779 ) ) ( not ( = ?auto_164778 ?auto_164780 ) ) ( not ( = ?auto_164778 ?auto_164781 ) ) ( not ( = ?auto_164779 ?auto_164780 ) ) ( not ( = ?auto_164779 ?auto_164781 ) ) ( not ( = ?auto_164780 ?auto_164781 ) ) ( ON ?auto_164779 ?auto_164780 ) ( ON ?auto_164778 ?auto_164779 ) ( ON ?auto_164777 ?auto_164778 ) ( ON ?auto_164776 ?auto_164777 ) ( ON ?auto_164775 ?auto_164776 ) ( CLEAR ?auto_164773 ) ( ON ?auto_164774 ?auto_164775 ) ( CLEAR ?auto_164774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164773 ?auto_164774 )
      ( MAKE-8PILE ?auto_164773 ?auto_164774 ?auto_164775 ?auto_164776 ?auto_164777 ?auto_164778 ?auto_164779 ?auto_164780 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_164807 - BLOCK
      ?auto_164808 - BLOCK
      ?auto_164809 - BLOCK
      ?auto_164810 - BLOCK
      ?auto_164811 - BLOCK
      ?auto_164812 - BLOCK
      ?auto_164813 - BLOCK
      ?auto_164814 - BLOCK
    )
    :vars
    (
      ?auto_164815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164814 ?auto_164815 ) ( not ( = ?auto_164807 ?auto_164808 ) ) ( not ( = ?auto_164807 ?auto_164809 ) ) ( not ( = ?auto_164807 ?auto_164810 ) ) ( not ( = ?auto_164807 ?auto_164811 ) ) ( not ( = ?auto_164807 ?auto_164812 ) ) ( not ( = ?auto_164807 ?auto_164813 ) ) ( not ( = ?auto_164807 ?auto_164814 ) ) ( not ( = ?auto_164807 ?auto_164815 ) ) ( not ( = ?auto_164808 ?auto_164809 ) ) ( not ( = ?auto_164808 ?auto_164810 ) ) ( not ( = ?auto_164808 ?auto_164811 ) ) ( not ( = ?auto_164808 ?auto_164812 ) ) ( not ( = ?auto_164808 ?auto_164813 ) ) ( not ( = ?auto_164808 ?auto_164814 ) ) ( not ( = ?auto_164808 ?auto_164815 ) ) ( not ( = ?auto_164809 ?auto_164810 ) ) ( not ( = ?auto_164809 ?auto_164811 ) ) ( not ( = ?auto_164809 ?auto_164812 ) ) ( not ( = ?auto_164809 ?auto_164813 ) ) ( not ( = ?auto_164809 ?auto_164814 ) ) ( not ( = ?auto_164809 ?auto_164815 ) ) ( not ( = ?auto_164810 ?auto_164811 ) ) ( not ( = ?auto_164810 ?auto_164812 ) ) ( not ( = ?auto_164810 ?auto_164813 ) ) ( not ( = ?auto_164810 ?auto_164814 ) ) ( not ( = ?auto_164810 ?auto_164815 ) ) ( not ( = ?auto_164811 ?auto_164812 ) ) ( not ( = ?auto_164811 ?auto_164813 ) ) ( not ( = ?auto_164811 ?auto_164814 ) ) ( not ( = ?auto_164811 ?auto_164815 ) ) ( not ( = ?auto_164812 ?auto_164813 ) ) ( not ( = ?auto_164812 ?auto_164814 ) ) ( not ( = ?auto_164812 ?auto_164815 ) ) ( not ( = ?auto_164813 ?auto_164814 ) ) ( not ( = ?auto_164813 ?auto_164815 ) ) ( not ( = ?auto_164814 ?auto_164815 ) ) ( ON ?auto_164813 ?auto_164814 ) ( ON ?auto_164812 ?auto_164813 ) ( ON ?auto_164811 ?auto_164812 ) ( ON ?auto_164810 ?auto_164811 ) ( ON ?auto_164809 ?auto_164810 ) ( ON ?auto_164808 ?auto_164809 ) ( ON ?auto_164807 ?auto_164808 ) ( CLEAR ?auto_164807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164807 )
      ( MAKE-8PILE ?auto_164807 ?auto_164808 ?auto_164809 ?auto_164810 ?auto_164811 ?auto_164812 ?auto_164813 ?auto_164814 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_164842 - BLOCK
      ?auto_164843 - BLOCK
      ?auto_164844 - BLOCK
      ?auto_164845 - BLOCK
      ?auto_164846 - BLOCK
      ?auto_164847 - BLOCK
      ?auto_164848 - BLOCK
      ?auto_164849 - BLOCK
      ?auto_164850 - BLOCK
    )
    :vars
    (
      ?auto_164851 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_164849 ) ( ON ?auto_164850 ?auto_164851 ) ( CLEAR ?auto_164850 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164842 ) ( ON ?auto_164843 ?auto_164842 ) ( ON ?auto_164844 ?auto_164843 ) ( ON ?auto_164845 ?auto_164844 ) ( ON ?auto_164846 ?auto_164845 ) ( ON ?auto_164847 ?auto_164846 ) ( ON ?auto_164848 ?auto_164847 ) ( ON ?auto_164849 ?auto_164848 ) ( not ( = ?auto_164842 ?auto_164843 ) ) ( not ( = ?auto_164842 ?auto_164844 ) ) ( not ( = ?auto_164842 ?auto_164845 ) ) ( not ( = ?auto_164842 ?auto_164846 ) ) ( not ( = ?auto_164842 ?auto_164847 ) ) ( not ( = ?auto_164842 ?auto_164848 ) ) ( not ( = ?auto_164842 ?auto_164849 ) ) ( not ( = ?auto_164842 ?auto_164850 ) ) ( not ( = ?auto_164842 ?auto_164851 ) ) ( not ( = ?auto_164843 ?auto_164844 ) ) ( not ( = ?auto_164843 ?auto_164845 ) ) ( not ( = ?auto_164843 ?auto_164846 ) ) ( not ( = ?auto_164843 ?auto_164847 ) ) ( not ( = ?auto_164843 ?auto_164848 ) ) ( not ( = ?auto_164843 ?auto_164849 ) ) ( not ( = ?auto_164843 ?auto_164850 ) ) ( not ( = ?auto_164843 ?auto_164851 ) ) ( not ( = ?auto_164844 ?auto_164845 ) ) ( not ( = ?auto_164844 ?auto_164846 ) ) ( not ( = ?auto_164844 ?auto_164847 ) ) ( not ( = ?auto_164844 ?auto_164848 ) ) ( not ( = ?auto_164844 ?auto_164849 ) ) ( not ( = ?auto_164844 ?auto_164850 ) ) ( not ( = ?auto_164844 ?auto_164851 ) ) ( not ( = ?auto_164845 ?auto_164846 ) ) ( not ( = ?auto_164845 ?auto_164847 ) ) ( not ( = ?auto_164845 ?auto_164848 ) ) ( not ( = ?auto_164845 ?auto_164849 ) ) ( not ( = ?auto_164845 ?auto_164850 ) ) ( not ( = ?auto_164845 ?auto_164851 ) ) ( not ( = ?auto_164846 ?auto_164847 ) ) ( not ( = ?auto_164846 ?auto_164848 ) ) ( not ( = ?auto_164846 ?auto_164849 ) ) ( not ( = ?auto_164846 ?auto_164850 ) ) ( not ( = ?auto_164846 ?auto_164851 ) ) ( not ( = ?auto_164847 ?auto_164848 ) ) ( not ( = ?auto_164847 ?auto_164849 ) ) ( not ( = ?auto_164847 ?auto_164850 ) ) ( not ( = ?auto_164847 ?auto_164851 ) ) ( not ( = ?auto_164848 ?auto_164849 ) ) ( not ( = ?auto_164848 ?auto_164850 ) ) ( not ( = ?auto_164848 ?auto_164851 ) ) ( not ( = ?auto_164849 ?auto_164850 ) ) ( not ( = ?auto_164849 ?auto_164851 ) ) ( not ( = ?auto_164850 ?auto_164851 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164850 ?auto_164851 )
      ( !STACK ?auto_164850 ?auto_164849 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_164880 - BLOCK
      ?auto_164881 - BLOCK
      ?auto_164882 - BLOCK
      ?auto_164883 - BLOCK
      ?auto_164884 - BLOCK
      ?auto_164885 - BLOCK
      ?auto_164886 - BLOCK
      ?auto_164887 - BLOCK
      ?auto_164888 - BLOCK
    )
    :vars
    (
      ?auto_164889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164888 ?auto_164889 ) ( ON-TABLE ?auto_164880 ) ( ON ?auto_164881 ?auto_164880 ) ( ON ?auto_164882 ?auto_164881 ) ( ON ?auto_164883 ?auto_164882 ) ( ON ?auto_164884 ?auto_164883 ) ( ON ?auto_164885 ?auto_164884 ) ( ON ?auto_164886 ?auto_164885 ) ( not ( = ?auto_164880 ?auto_164881 ) ) ( not ( = ?auto_164880 ?auto_164882 ) ) ( not ( = ?auto_164880 ?auto_164883 ) ) ( not ( = ?auto_164880 ?auto_164884 ) ) ( not ( = ?auto_164880 ?auto_164885 ) ) ( not ( = ?auto_164880 ?auto_164886 ) ) ( not ( = ?auto_164880 ?auto_164887 ) ) ( not ( = ?auto_164880 ?auto_164888 ) ) ( not ( = ?auto_164880 ?auto_164889 ) ) ( not ( = ?auto_164881 ?auto_164882 ) ) ( not ( = ?auto_164881 ?auto_164883 ) ) ( not ( = ?auto_164881 ?auto_164884 ) ) ( not ( = ?auto_164881 ?auto_164885 ) ) ( not ( = ?auto_164881 ?auto_164886 ) ) ( not ( = ?auto_164881 ?auto_164887 ) ) ( not ( = ?auto_164881 ?auto_164888 ) ) ( not ( = ?auto_164881 ?auto_164889 ) ) ( not ( = ?auto_164882 ?auto_164883 ) ) ( not ( = ?auto_164882 ?auto_164884 ) ) ( not ( = ?auto_164882 ?auto_164885 ) ) ( not ( = ?auto_164882 ?auto_164886 ) ) ( not ( = ?auto_164882 ?auto_164887 ) ) ( not ( = ?auto_164882 ?auto_164888 ) ) ( not ( = ?auto_164882 ?auto_164889 ) ) ( not ( = ?auto_164883 ?auto_164884 ) ) ( not ( = ?auto_164883 ?auto_164885 ) ) ( not ( = ?auto_164883 ?auto_164886 ) ) ( not ( = ?auto_164883 ?auto_164887 ) ) ( not ( = ?auto_164883 ?auto_164888 ) ) ( not ( = ?auto_164883 ?auto_164889 ) ) ( not ( = ?auto_164884 ?auto_164885 ) ) ( not ( = ?auto_164884 ?auto_164886 ) ) ( not ( = ?auto_164884 ?auto_164887 ) ) ( not ( = ?auto_164884 ?auto_164888 ) ) ( not ( = ?auto_164884 ?auto_164889 ) ) ( not ( = ?auto_164885 ?auto_164886 ) ) ( not ( = ?auto_164885 ?auto_164887 ) ) ( not ( = ?auto_164885 ?auto_164888 ) ) ( not ( = ?auto_164885 ?auto_164889 ) ) ( not ( = ?auto_164886 ?auto_164887 ) ) ( not ( = ?auto_164886 ?auto_164888 ) ) ( not ( = ?auto_164886 ?auto_164889 ) ) ( not ( = ?auto_164887 ?auto_164888 ) ) ( not ( = ?auto_164887 ?auto_164889 ) ) ( not ( = ?auto_164888 ?auto_164889 ) ) ( CLEAR ?auto_164886 ) ( ON ?auto_164887 ?auto_164888 ) ( CLEAR ?auto_164887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164880 ?auto_164881 ?auto_164882 ?auto_164883 ?auto_164884 ?auto_164885 ?auto_164886 ?auto_164887 )
      ( MAKE-9PILE ?auto_164880 ?auto_164881 ?auto_164882 ?auto_164883 ?auto_164884 ?auto_164885 ?auto_164886 ?auto_164887 ?auto_164888 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_164918 - BLOCK
      ?auto_164919 - BLOCK
      ?auto_164920 - BLOCK
      ?auto_164921 - BLOCK
      ?auto_164922 - BLOCK
      ?auto_164923 - BLOCK
      ?auto_164924 - BLOCK
      ?auto_164925 - BLOCK
      ?auto_164926 - BLOCK
    )
    :vars
    (
      ?auto_164927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164926 ?auto_164927 ) ( ON-TABLE ?auto_164918 ) ( ON ?auto_164919 ?auto_164918 ) ( ON ?auto_164920 ?auto_164919 ) ( ON ?auto_164921 ?auto_164920 ) ( ON ?auto_164922 ?auto_164921 ) ( ON ?auto_164923 ?auto_164922 ) ( not ( = ?auto_164918 ?auto_164919 ) ) ( not ( = ?auto_164918 ?auto_164920 ) ) ( not ( = ?auto_164918 ?auto_164921 ) ) ( not ( = ?auto_164918 ?auto_164922 ) ) ( not ( = ?auto_164918 ?auto_164923 ) ) ( not ( = ?auto_164918 ?auto_164924 ) ) ( not ( = ?auto_164918 ?auto_164925 ) ) ( not ( = ?auto_164918 ?auto_164926 ) ) ( not ( = ?auto_164918 ?auto_164927 ) ) ( not ( = ?auto_164919 ?auto_164920 ) ) ( not ( = ?auto_164919 ?auto_164921 ) ) ( not ( = ?auto_164919 ?auto_164922 ) ) ( not ( = ?auto_164919 ?auto_164923 ) ) ( not ( = ?auto_164919 ?auto_164924 ) ) ( not ( = ?auto_164919 ?auto_164925 ) ) ( not ( = ?auto_164919 ?auto_164926 ) ) ( not ( = ?auto_164919 ?auto_164927 ) ) ( not ( = ?auto_164920 ?auto_164921 ) ) ( not ( = ?auto_164920 ?auto_164922 ) ) ( not ( = ?auto_164920 ?auto_164923 ) ) ( not ( = ?auto_164920 ?auto_164924 ) ) ( not ( = ?auto_164920 ?auto_164925 ) ) ( not ( = ?auto_164920 ?auto_164926 ) ) ( not ( = ?auto_164920 ?auto_164927 ) ) ( not ( = ?auto_164921 ?auto_164922 ) ) ( not ( = ?auto_164921 ?auto_164923 ) ) ( not ( = ?auto_164921 ?auto_164924 ) ) ( not ( = ?auto_164921 ?auto_164925 ) ) ( not ( = ?auto_164921 ?auto_164926 ) ) ( not ( = ?auto_164921 ?auto_164927 ) ) ( not ( = ?auto_164922 ?auto_164923 ) ) ( not ( = ?auto_164922 ?auto_164924 ) ) ( not ( = ?auto_164922 ?auto_164925 ) ) ( not ( = ?auto_164922 ?auto_164926 ) ) ( not ( = ?auto_164922 ?auto_164927 ) ) ( not ( = ?auto_164923 ?auto_164924 ) ) ( not ( = ?auto_164923 ?auto_164925 ) ) ( not ( = ?auto_164923 ?auto_164926 ) ) ( not ( = ?auto_164923 ?auto_164927 ) ) ( not ( = ?auto_164924 ?auto_164925 ) ) ( not ( = ?auto_164924 ?auto_164926 ) ) ( not ( = ?auto_164924 ?auto_164927 ) ) ( not ( = ?auto_164925 ?auto_164926 ) ) ( not ( = ?auto_164925 ?auto_164927 ) ) ( not ( = ?auto_164926 ?auto_164927 ) ) ( ON ?auto_164925 ?auto_164926 ) ( CLEAR ?auto_164923 ) ( ON ?auto_164924 ?auto_164925 ) ( CLEAR ?auto_164924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164918 ?auto_164919 ?auto_164920 ?auto_164921 ?auto_164922 ?auto_164923 ?auto_164924 )
      ( MAKE-9PILE ?auto_164918 ?auto_164919 ?auto_164920 ?auto_164921 ?auto_164922 ?auto_164923 ?auto_164924 ?auto_164925 ?auto_164926 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_164956 - BLOCK
      ?auto_164957 - BLOCK
      ?auto_164958 - BLOCK
      ?auto_164959 - BLOCK
      ?auto_164960 - BLOCK
      ?auto_164961 - BLOCK
      ?auto_164962 - BLOCK
      ?auto_164963 - BLOCK
      ?auto_164964 - BLOCK
    )
    :vars
    (
      ?auto_164965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164964 ?auto_164965 ) ( ON-TABLE ?auto_164956 ) ( ON ?auto_164957 ?auto_164956 ) ( ON ?auto_164958 ?auto_164957 ) ( ON ?auto_164959 ?auto_164958 ) ( ON ?auto_164960 ?auto_164959 ) ( not ( = ?auto_164956 ?auto_164957 ) ) ( not ( = ?auto_164956 ?auto_164958 ) ) ( not ( = ?auto_164956 ?auto_164959 ) ) ( not ( = ?auto_164956 ?auto_164960 ) ) ( not ( = ?auto_164956 ?auto_164961 ) ) ( not ( = ?auto_164956 ?auto_164962 ) ) ( not ( = ?auto_164956 ?auto_164963 ) ) ( not ( = ?auto_164956 ?auto_164964 ) ) ( not ( = ?auto_164956 ?auto_164965 ) ) ( not ( = ?auto_164957 ?auto_164958 ) ) ( not ( = ?auto_164957 ?auto_164959 ) ) ( not ( = ?auto_164957 ?auto_164960 ) ) ( not ( = ?auto_164957 ?auto_164961 ) ) ( not ( = ?auto_164957 ?auto_164962 ) ) ( not ( = ?auto_164957 ?auto_164963 ) ) ( not ( = ?auto_164957 ?auto_164964 ) ) ( not ( = ?auto_164957 ?auto_164965 ) ) ( not ( = ?auto_164958 ?auto_164959 ) ) ( not ( = ?auto_164958 ?auto_164960 ) ) ( not ( = ?auto_164958 ?auto_164961 ) ) ( not ( = ?auto_164958 ?auto_164962 ) ) ( not ( = ?auto_164958 ?auto_164963 ) ) ( not ( = ?auto_164958 ?auto_164964 ) ) ( not ( = ?auto_164958 ?auto_164965 ) ) ( not ( = ?auto_164959 ?auto_164960 ) ) ( not ( = ?auto_164959 ?auto_164961 ) ) ( not ( = ?auto_164959 ?auto_164962 ) ) ( not ( = ?auto_164959 ?auto_164963 ) ) ( not ( = ?auto_164959 ?auto_164964 ) ) ( not ( = ?auto_164959 ?auto_164965 ) ) ( not ( = ?auto_164960 ?auto_164961 ) ) ( not ( = ?auto_164960 ?auto_164962 ) ) ( not ( = ?auto_164960 ?auto_164963 ) ) ( not ( = ?auto_164960 ?auto_164964 ) ) ( not ( = ?auto_164960 ?auto_164965 ) ) ( not ( = ?auto_164961 ?auto_164962 ) ) ( not ( = ?auto_164961 ?auto_164963 ) ) ( not ( = ?auto_164961 ?auto_164964 ) ) ( not ( = ?auto_164961 ?auto_164965 ) ) ( not ( = ?auto_164962 ?auto_164963 ) ) ( not ( = ?auto_164962 ?auto_164964 ) ) ( not ( = ?auto_164962 ?auto_164965 ) ) ( not ( = ?auto_164963 ?auto_164964 ) ) ( not ( = ?auto_164963 ?auto_164965 ) ) ( not ( = ?auto_164964 ?auto_164965 ) ) ( ON ?auto_164963 ?auto_164964 ) ( ON ?auto_164962 ?auto_164963 ) ( CLEAR ?auto_164960 ) ( ON ?auto_164961 ?auto_164962 ) ( CLEAR ?auto_164961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164956 ?auto_164957 ?auto_164958 ?auto_164959 ?auto_164960 ?auto_164961 )
      ( MAKE-9PILE ?auto_164956 ?auto_164957 ?auto_164958 ?auto_164959 ?auto_164960 ?auto_164961 ?auto_164962 ?auto_164963 ?auto_164964 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_164994 - BLOCK
      ?auto_164995 - BLOCK
      ?auto_164996 - BLOCK
      ?auto_164997 - BLOCK
      ?auto_164998 - BLOCK
      ?auto_164999 - BLOCK
      ?auto_165000 - BLOCK
      ?auto_165001 - BLOCK
      ?auto_165002 - BLOCK
    )
    :vars
    (
      ?auto_165003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165002 ?auto_165003 ) ( ON-TABLE ?auto_164994 ) ( ON ?auto_164995 ?auto_164994 ) ( ON ?auto_164996 ?auto_164995 ) ( ON ?auto_164997 ?auto_164996 ) ( not ( = ?auto_164994 ?auto_164995 ) ) ( not ( = ?auto_164994 ?auto_164996 ) ) ( not ( = ?auto_164994 ?auto_164997 ) ) ( not ( = ?auto_164994 ?auto_164998 ) ) ( not ( = ?auto_164994 ?auto_164999 ) ) ( not ( = ?auto_164994 ?auto_165000 ) ) ( not ( = ?auto_164994 ?auto_165001 ) ) ( not ( = ?auto_164994 ?auto_165002 ) ) ( not ( = ?auto_164994 ?auto_165003 ) ) ( not ( = ?auto_164995 ?auto_164996 ) ) ( not ( = ?auto_164995 ?auto_164997 ) ) ( not ( = ?auto_164995 ?auto_164998 ) ) ( not ( = ?auto_164995 ?auto_164999 ) ) ( not ( = ?auto_164995 ?auto_165000 ) ) ( not ( = ?auto_164995 ?auto_165001 ) ) ( not ( = ?auto_164995 ?auto_165002 ) ) ( not ( = ?auto_164995 ?auto_165003 ) ) ( not ( = ?auto_164996 ?auto_164997 ) ) ( not ( = ?auto_164996 ?auto_164998 ) ) ( not ( = ?auto_164996 ?auto_164999 ) ) ( not ( = ?auto_164996 ?auto_165000 ) ) ( not ( = ?auto_164996 ?auto_165001 ) ) ( not ( = ?auto_164996 ?auto_165002 ) ) ( not ( = ?auto_164996 ?auto_165003 ) ) ( not ( = ?auto_164997 ?auto_164998 ) ) ( not ( = ?auto_164997 ?auto_164999 ) ) ( not ( = ?auto_164997 ?auto_165000 ) ) ( not ( = ?auto_164997 ?auto_165001 ) ) ( not ( = ?auto_164997 ?auto_165002 ) ) ( not ( = ?auto_164997 ?auto_165003 ) ) ( not ( = ?auto_164998 ?auto_164999 ) ) ( not ( = ?auto_164998 ?auto_165000 ) ) ( not ( = ?auto_164998 ?auto_165001 ) ) ( not ( = ?auto_164998 ?auto_165002 ) ) ( not ( = ?auto_164998 ?auto_165003 ) ) ( not ( = ?auto_164999 ?auto_165000 ) ) ( not ( = ?auto_164999 ?auto_165001 ) ) ( not ( = ?auto_164999 ?auto_165002 ) ) ( not ( = ?auto_164999 ?auto_165003 ) ) ( not ( = ?auto_165000 ?auto_165001 ) ) ( not ( = ?auto_165000 ?auto_165002 ) ) ( not ( = ?auto_165000 ?auto_165003 ) ) ( not ( = ?auto_165001 ?auto_165002 ) ) ( not ( = ?auto_165001 ?auto_165003 ) ) ( not ( = ?auto_165002 ?auto_165003 ) ) ( ON ?auto_165001 ?auto_165002 ) ( ON ?auto_165000 ?auto_165001 ) ( ON ?auto_164999 ?auto_165000 ) ( CLEAR ?auto_164997 ) ( ON ?auto_164998 ?auto_164999 ) ( CLEAR ?auto_164998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164994 ?auto_164995 ?auto_164996 ?auto_164997 ?auto_164998 )
      ( MAKE-9PILE ?auto_164994 ?auto_164995 ?auto_164996 ?auto_164997 ?auto_164998 ?auto_164999 ?auto_165000 ?auto_165001 ?auto_165002 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_165032 - BLOCK
      ?auto_165033 - BLOCK
      ?auto_165034 - BLOCK
      ?auto_165035 - BLOCK
      ?auto_165036 - BLOCK
      ?auto_165037 - BLOCK
      ?auto_165038 - BLOCK
      ?auto_165039 - BLOCK
      ?auto_165040 - BLOCK
    )
    :vars
    (
      ?auto_165041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165040 ?auto_165041 ) ( ON-TABLE ?auto_165032 ) ( ON ?auto_165033 ?auto_165032 ) ( ON ?auto_165034 ?auto_165033 ) ( not ( = ?auto_165032 ?auto_165033 ) ) ( not ( = ?auto_165032 ?auto_165034 ) ) ( not ( = ?auto_165032 ?auto_165035 ) ) ( not ( = ?auto_165032 ?auto_165036 ) ) ( not ( = ?auto_165032 ?auto_165037 ) ) ( not ( = ?auto_165032 ?auto_165038 ) ) ( not ( = ?auto_165032 ?auto_165039 ) ) ( not ( = ?auto_165032 ?auto_165040 ) ) ( not ( = ?auto_165032 ?auto_165041 ) ) ( not ( = ?auto_165033 ?auto_165034 ) ) ( not ( = ?auto_165033 ?auto_165035 ) ) ( not ( = ?auto_165033 ?auto_165036 ) ) ( not ( = ?auto_165033 ?auto_165037 ) ) ( not ( = ?auto_165033 ?auto_165038 ) ) ( not ( = ?auto_165033 ?auto_165039 ) ) ( not ( = ?auto_165033 ?auto_165040 ) ) ( not ( = ?auto_165033 ?auto_165041 ) ) ( not ( = ?auto_165034 ?auto_165035 ) ) ( not ( = ?auto_165034 ?auto_165036 ) ) ( not ( = ?auto_165034 ?auto_165037 ) ) ( not ( = ?auto_165034 ?auto_165038 ) ) ( not ( = ?auto_165034 ?auto_165039 ) ) ( not ( = ?auto_165034 ?auto_165040 ) ) ( not ( = ?auto_165034 ?auto_165041 ) ) ( not ( = ?auto_165035 ?auto_165036 ) ) ( not ( = ?auto_165035 ?auto_165037 ) ) ( not ( = ?auto_165035 ?auto_165038 ) ) ( not ( = ?auto_165035 ?auto_165039 ) ) ( not ( = ?auto_165035 ?auto_165040 ) ) ( not ( = ?auto_165035 ?auto_165041 ) ) ( not ( = ?auto_165036 ?auto_165037 ) ) ( not ( = ?auto_165036 ?auto_165038 ) ) ( not ( = ?auto_165036 ?auto_165039 ) ) ( not ( = ?auto_165036 ?auto_165040 ) ) ( not ( = ?auto_165036 ?auto_165041 ) ) ( not ( = ?auto_165037 ?auto_165038 ) ) ( not ( = ?auto_165037 ?auto_165039 ) ) ( not ( = ?auto_165037 ?auto_165040 ) ) ( not ( = ?auto_165037 ?auto_165041 ) ) ( not ( = ?auto_165038 ?auto_165039 ) ) ( not ( = ?auto_165038 ?auto_165040 ) ) ( not ( = ?auto_165038 ?auto_165041 ) ) ( not ( = ?auto_165039 ?auto_165040 ) ) ( not ( = ?auto_165039 ?auto_165041 ) ) ( not ( = ?auto_165040 ?auto_165041 ) ) ( ON ?auto_165039 ?auto_165040 ) ( ON ?auto_165038 ?auto_165039 ) ( ON ?auto_165037 ?auto_165038 ) ( ON ?auto_165036 ?auto_165037 ) ( CLEAR ?auto_165034 ) ( ON ?auto_165035 ?auto_165036 ) ( CLEAR ?auto_165035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165032 ?auto_165033 ?auto_165034 ?auto_165035 )
      ( MAKE-9PILE ?auto_165032 ?auto_165033 ?auto_165034 ?auto_165035 ?auto_165036 ?auto_165037 ?auto_165038 ?auto_165039 ?auto_165040 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_165070 - BLOCK
      ?auto_165071 - BLOCK
      ?auto_165072 - BLOCK
      ?auto_165073 - BLOCK
      ?auto_165074 - BLOCK
      ?auto_165075 - BLOCK
      ?auto_165076 - BLOCK
      ?auto_165077 - BLOCK
      ?auto_165078 - BLOCK
    )
    :vars
    (
      ?auto_165079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165078 ?auto_165079 ) ( ON-TABLE ?auto_165070 ) ( ON ?auto_165071 ?auto_165070 ) ( not ( = ?auto_165070 ?auto_165071 ) ) ( not ( = ?auto_165070 ?auto_165072 ) ) ( not ( = ?auto_165070 ?auto_165073 ) ) ( not ( = ?auto_165070 ?auto_165074 ) ) ( not ( = ?auto_165070 ?auto_165075 ) ) ( not ( = ?auto_165070 ?auto_165076 ) ) ( not ( = ?auto_165070 ?auto_165077 ) ) ( not ( = ?auto_165070 ?auto_165078 ) ) ( not ( = ?auto_165070 ?auto_165079 ) ) ( not ( = ?auto_165071 ?auto_165072 ) ) ( not ( = ?auto_165071 ?auto_165073 ) ) ( not ( = ?auto_165071 ?auto_165074 ) ) ( not ( = ?auto_165071 ?auto_165075 ) ) ( not ( = ?auto_165071 ?auto_165076 ) ) ( not ( = ?auto_165071 ?auto_165077 ) ) ( not ( = ?auto_165071 ?auto_165078 ) ) ( not ( = ?auto_165071 ?auto_165079 ) ) ( not ( = ?auto_165072 ?auto_165073 ) ) ( not ( = ?auto_165072 ?auto_165074 ) ) ( not ( = ?auto_165072 ?auto_165075 ) ) ( not ( = ?auto_165072 ?auto_165076 ) ) ( not ( = ?auto_165072 ?auto_165077 ) ) ( not ( = ?auto_165072 ?auto_165078 ) ) ( not ( = ?auto_165072 ?auto_165079 ) ) ( not ( = ?auto_165073 ?auto_165074 ) ) ( not ( = ?auto_165073 ?auto_165075 ) ) ( not ( = ?auto_165073 ?auto_165076 ) ) ( not ( = ?auto_165073 ?auto_165077 ) ) ( not ( = ?auto_165073 ?auto_165078 ) ) ( not ( = ?auto_165073 ?auto_165079 ) ) ( not ( = ?auto_165074 ?auto_165075 ) ) ( not ( = ?auto_165074 ?auto_165076 ) ) ( not ( = ?auto_165074 ?auto_165077 ) ) ( not ( = ?auto_165074 ?auto_165078 ) ) ( not ( = ?auto_165074 ?auto_165079 ) ) ( not ( = ?auto_165075 ?auto_165076 ) ) ( not ( = ?auto_165075 ?auto_165077 ) ) ( not ( = ?auto_165075 ?auto_165078 ) ) ( not ( = ?auto_165075 ?auto_165079 ) ) ( not ( = ?auto_165076 ?auto_165077 ) ) ( not ( = ?auto_165076 ?auto_165078 ) ) ( not ( = ?auto_165076 ?auto_165079 ) ) ( not ( = ?auto_165077 ?auto_165078 ) ) ( not ( = ?auto_165077 ?auto_165079 ) ) ( not ( = ?auto_165078 ?auto_165079 ) ) ( ON ?auto_165077 ?auto_165078 ) ( ON ?auto_165076 ?auto_165077 ) ( ON ?auto_165075 ?auto_165076 ) ( ON ?auto_165074 ?auto_165075 ) ( ON ?auto_165073 ?auto_165074 ) ( CLEAR ?auto_165071 ) ( ON ?auto_165072 ?auto_165073 ) ( CLEAR ?auto_165072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165070 ?auto_165071 ?auto_165072 )
      ( MAKE-9PILE ?auto_165070 ?auto_165071 ?auto_165072 ?auto_165073 ?auto_165074 ?auto_165075 ?auto_165076 ?auto_165077 ?auto_165078 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_165108 - BLOCK
      ?auto_165109 - BLOCK
      ?auto_165110 - BLOCK
      ?auto_165111 - BLOCK
      ?auto_165112 - BLOCK
      ?auto_165113 - BLOCK
      ?auto_165114 - BLOCK
      ?auto_165115 - BLOCK
      ?auto_165116 - BLOCK
    )
    :vars
    (
      ?auto_165117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165116 ?auto_165117 ) ( ON-TABLE ?auto_165108 ) ( not ( = ?auto_165108 ?auto_165109 ) ) ( not ( = ?auto_165108 ?auto_165110 ) ) ( not ( = ?auto_165108 ?auto_165111 ) ) ( not ( = ?auto_165108 ?auto_165112 ) ) ( not ( = ?auto_165108 ?auto_165113 ) ) ( not ( = ?auto_165108 ?auto_165114 ) ) ( not ( = ?auto_165108 ?auto_165115 ) ) ( not ( = ?auto_165108 ?auto_165116 ) ) ( not ( = ?auto_165108 ?auto_165117 ) ) ( not ( = ?auto_165109 ?auto_165110 ) ) ( not ( = ?auto_165109 ?auto_165111 ) ) ( not ( = ?auto_165109 ?auto_165112 ) ) ( not ( = ?auto_165109 ?auto_165113 ) ) ( not ( = ?auto_165109 ?auto_165114 ) ) ( not ( = ?auto_165109 ?auto_165115 ) ) ( not ( = ?auto_165109 ?auto_165116 ) ) ( not ( = ?auto_165109 ?auto_165117 ) ) ( not ( = ?auto_165110 ?auto_165111 ) ) ( not ( = ?auto_165110 ?auto_165112 ) ) ( not ( = ?auto_165110 ?auto_165113 ) ) ( not ( = ?auto_165110 ?auto_165114 ) ) ( not ( = ?auto_165110 ?auto_165115 ) ) ( not ( = ?auto_165110 ?auto_165116 ) ) ( not ( = ?auto_165110 ?auto_165117 ) ) ( not ( = ?auto_165111 ?auto_165112 ) ) ( not ( = ?auto_165111 ?auto_165113 ) ) ( not ( = ?auto_165111 ?auto_165114 ) ) ( not ( = ?auto_165111 ?auto_165115 ) ) ( not ( = ?auto_165111 ?auto_165116 ) ) ( not ( = ?auto_165111 ?auto_165117 ) ) ( not ( = ?auto_165112 ?auto_165113 ) ) ( not ( = ?auto_165112 ?auto_165114 ) ) ( not ( = ?auto_165112 ?auto_165115 ) ) ( not ( = ?auto_165112 ?auto_165116 ) ) ( not ( = ?auto_165112 ?auto_165117 ) ) ( not ( = ?auto_165113 ?auto_165114 ) ) ( not ( = ?auto_165113 ?auto_165115 ) ) ( not ( = ?auto_165113 ?auto_165116 ) ) ( not ( = ?auto_165113 ?auto_165117 ) ) ( not ( = ?auto_165114 ?auto_165115 ) ) ( not ( = ?auto_165114 ?auto_165116 ) ) ( not ( = ?auto_165114 ?auto_165117 ) ) ( not ( = ?auto_165115 ?auto_165116 ) ) ( not ( = ?auto_165115 ?auto_165117 ) ) ( not ( = ?auto_165116 ?auto_165117 ) ) ( ON ?auto_165115 ?auto_165116 ) ( ON ?auto_165114 ?auto_165115 ) ( ON ?auto_165113 ?auto_165114 ) ( ON ?auto_165112 ?auto_165113 ) ( ON ?auto_165111 ?auto_165112 ) ( ON ?auto_165110 ?auto_165111 ) ( CLEAR ?auto_165108 ) ( ON ?auto_165109 ?auto_165110 ) ( CLEAR ?auto_165109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165108 ?auto_165109 )
      ( MAKE-9PILE ?auto_165108 ?auto_165109 ?auto_165110 ?auto_165111 ?auto_165112 ?auto_165113 ?auto_165114 ?auto_165115 ?auto_165116 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_165146 - BLOCK
      ?auto_165147 - BLOCK
      ?auto_165148 - BLOCK
      ?auto_165149 - BLOCK
      ?auto_165150 - BLOCK
      ?auto_165151 - BLOCK
      ?auto_165152 - BLOCK
      ?auto_165153 - BLOCK
      ?auto_165154 - BLOCK
    )
    :vars
    (
      ?auto_165155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165154 ?auto_165155 ) ( not ( = ?auto_165146 ?auto_165147 ) ) ( not ( = ?auto_165146 ?auto_165148 ) ) ( not ( = ?auto_165146 ?auto_165149 ) ) ( not ( = ?auto_165146 ?auto_165150 ) ) ( not ( = ?auto_165146 ?auto_165151 ) ) ( not ( = ?auto_165146 ?auto_165152 ) ) ( not ( = ?auto_165146 ?auto_165153 ) ) ( not ( = ?auto_165146 ?auto_165154 ) ) ( not ( = ?auto_165146 ?auto_165155 ) ) ( not ( = ?auto_165147 ?auto_165148 ) ) ( not ( = ?auto_165147 ?auto_165149 ) ) ( not ( = ?auto_165147 ?auto_165150 ) ) ( not ( = ?auto_165147 ?auto_165151 ) ) ( not ( = ?auto_165147 ?auto_165152 ) ) ( not ( = ?auto_165147 ?auto_165153 ) ) ( not ( = ?auto_165147 ?auto_165154 ) ) ( not ( = ?auto_165147 ?auto_165155 ) ) ( not ( = ?auto_165148 ?auto_165149 ) ) ( not ( = ?auto_165148 ?auto_165150 ) ) ( not ( = ?auto_165148 ?auto_165151 ) ) ( not ( = ?auto_165148 ?auto_165152 ) ) ( not ( = ?auto_165148 ?auto_165153 ) ) ( not ( = ?auto_165148 ?auto_165154 ) ) ( not ( = ?auto_165148 ?auto_165155 ) ) ( not ( = ?auto_165149 ?auto_165150 ) ) ( not ( = ?auto_165149 ?auto_165151 ) ) ( not ( = ?auto_165149 ?auto_165152 ) ) ( not ( = ?auto_165149 ?auto_165153 ) ) ( not ( = ?auto_165149 ?auto_165154 ) ) ( not ( = ?auto_165149 ?auto_165155 ) ) ( not ( = ?auto_165150 ?auto_165151 ) ) ( not ( = ?auto_165150 ?auto_165152 ) ) ( not ( = ?auto_165150 ?auto_165153 ) ) ( not ( = ?auto_165150 ?auto_165154 ) ) ( not ( = ?auto_165150 ?auto_165155 ) ) ( not ( = ?auto_165151 ?auto_165152 ) ) ( not ( = ?auto_165151 ?auto_165153 ) ) ( not ( = ?auto_165151 ?auto_165154 ) ) ( not ( = ?auto_165151 ?auto_165155 ) ) ( not ( = ?auto_165152 ?auto_165153 ) ) ( not ( = ?auto_165152 ?auto_165154 ) ) ( not ( = ?auto_165152 ?auto_165155 ) ) ( not ( = ?auto_165153 ?auto_165154 ) ) ( not ( = ?auto_165153 ?auto_165155 ) ) ( not ( = ?auto_165154 ?auto_165155 ) ) ( ON ?auto_165153 ?auto_165154 ) ( ON ?auto_165152 ?auto_165153 ) ( ON ?auto_165151 ?auto_165152 ) ( ON ?auto_165150 ?auto_165151 ) ( ON ?auto_165149 ?auto_165150 ) ( ON ?auto_165148 ?auto_165149 ) ( ON ?auto_165147 ?auto_165148 ) ( ON ?auto_165146 ?auto_165147 ) ( CLEAR ?auto_165146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165146 )
      ( MAKE-9PILE ?auto_165146 ?auto_165147 ?auto_165148 ?auto_165149 ?auto_165150 ?auto_165151 ?auto_165152 ?auto_165153 ?auto_165154 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_165185 - BLOCK
      ?auto_165186 - BLOCK
      ?auto_165187 - BLOCK
      ?auto_165188 - BLOCK
      ?auto_165189 - BLOCK
      ?auto_165190 - BLOCK
      ?auto_165191 - BLOCK
      ?auto_165192 - BLOCK
      ?auto_165193 - BLOCK
      ?auto_165194 - BLOCK
    )
    :vars
    (
      ?auto_165195 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_165193 ) ( ON ?auto_165194 ?auto_165195 ) ( CLEAR ?auto_165194 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165185 ) ( ON ?auto_165186 ?auto_165185 ) ( ON ?auto_165187 ?auto_165186 ) ( ON ?auto_165188 ?auto_165187 ) ( ON ?auto_165189 ?auto_165188 ) ( ON ?auto_165190 ?auto_165189 ) ( ON ?auto_165191 ?auto_165190 ) ( ON ?auto_165192 ?auto_165191 ) ( ON ?auto_165193 ?auto_165192 ) ( not ( = ?auto_165185 ?auto_165186 ) ) ( not ( = ?auto_165185 ?auto_165187 ) ) ( not ( = ?auto_165185 ?auto_165188 ) ) ( not ( = ?auto_165185 ?auto_165189 ) ) ( not ( = ?auto_165185 ?auto_165190 ) ) ( not ( = ?auto_165185 ?auto_165191 ) ) ( not ( = ?auto_165185 ?auto_165192 ) ) ( not ( = ?auto_165185 ?auto_165193 ) ) ( not ( = ?auto_165185 ?auto_165194 ) ) ( not ( = ?auto_165185 ?auto_165195 ) ) ( not ( = ?auto_165186 ?auto_165187 ) ) ( not ( = ?auto_165186 ?auto_165188 ) ) ( not ( = ?auto_165186 ?auto_165189 ) ) ( not ( = ?auto_165186 ?auto_165190 ) ) ( not ( = ?auto_165186 ?auto_165191 ) ) ( not ( = ?auto_165186 ?auto_165192 ) ) ( not ( = ?auto_165186 ?auto_165193 ) ) ( not ( = ?auto_165186 ?auto_165194 ) ) ( not ( = ?auto_165186 ?auto_165195 ) ) ( not ( = ?auto_165187 ?auto_165188 ) ) ( not ( = ?auto_165187 ?auto_165189 ) ) ( not ( = ?auto_165187 ?auto_165190 ) ) ( not ( = ?auto_165187 ?auto_165191 ) ) ( not ( = ?auto_165187 ?auto_165192 ) ) ( not ( = ?auto_165187 ?auto_165193 ) ) ( not ( = ?auto_165187 ?auto_165194 ) ) ( not ( = ?auto_165187 ?auto_165195 ) ) ( not ( = ?auto_165188 ?auto_165189 ) ) ( not ( = ?auto_165188 ?auto_165190 ) ) ( not ( = ?auto_165188 ?auto_165191 ) ) ( not ( = ?auto_165188 ?auto_165192 ) ) ( not ( = ?auto_165188 ?auto_165193 ) ) ( not ( = ?auto_165188 ?auto_165194 ) ) ( not ( = ?auto_165188 ?auto_165195 ) ) ( not ( = ?auto_165189 ?auto_165190 ) ) ( not ( = ?auto_165189 ?auto_165191 ) ) ( not ( = ?auto_165189 ?auto_165192 ) ) ( not ( = ?auto_165189 ?auto_165193 ) ) ( not ( = ?auto_165189 ?auto_165194 ) ) ( not ( = ?auto_165189 ?auto_165195 ) ) ( not ( = ?auto_165190 ?auto_165191 ) ) ( not ( = ?auto_165190 ?auto_165192 ) ) ( not ( = ?auto_165190 ?auto_165193 ) ) ( not ( = ?auto_165190 ?auto_165194 ) ) ( not ( = ?auto_165190 ?auto_165195 ) ) ( not ( = ?auto_165191 ?auto_165192 ) ) ( not ( = ?auto_165191 ?auto_165193 ) ) ( not ( = ?auto_165191 ?auto_165194 ) ) ( not ( = ?auto_165191 ?auto_165195 ) ) ( not ( = ?auto_165192 ?auto_165193 ) ) ( not ( = ?auto_165192 ?auto_165194 ) ) ( not ( = ?auto_165192 ?auto_165195 ) ) ( not ( = ?auto_165193 ?auto_165194 ) ) ( not ( = ?auto_165193 ?auto_165195 ) ) ( not ( = ?auto_165194 ?auto_165195 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165194 ?auto_165195 )
      ( !STACK ?auto_165194 ?auto_165193 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_165227 - BLOCK
      ?auto_165228 - BLOCK
      ?auto_165229 - BLOCK
      ?auto_165230 - BLOCK
      ?auto_165231 - BLOCK
      ?auto_165232 - BLOCK
      ?auto_165233 - BLOCK
      ?auto_165234 - BLOCK
      ?auto_165235 - BLOCK
      ?auto_165236 - BLOCK
    )
    :vars
    (
      ?auto_165237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165236 ?auto_165237 ) ( ON-TABLE ?auto_165227 ) ( ON ?auto_165228 ?auto_165227 ) ( ON ?auto_165229 ?auto_165228 ) ( ON ?auto_165230 ?auto_165229 ) ( ON ?auto_165231 ?auto_165230 ) ( ON ?auto_165232 ?auto_165231 ) ( ON ?auto_165233 ?auto_165232 ) ( ON ?auto_165234 ?auto_165233 ) ( not ( = ?auto_165227 ?auto_165228 ) ) ( not ( = ?auto_165227 ?auto_165229 ) ) ( not ( = ?auto_165227 ?auto_165230 ) ) ( not ( = ?auto_165227 ?auto_165231 ) ) ( not ( = ?auto_165227 ?auto_165232 ) ) ( not ( = ?auto_165227 ?auto_165233 ) ) ( not ( = ?auto_165227 ?auto_165234 ) ) ( not ( = ?auto_165227 ?auto_165235 ) ) ( not ( = ?auto_165227 ?auto_165236 ) ) ( not ( = ?auto_165227 ?auto_165237 ) ) ( not ( = ?auto_165228 ?auto_165229 ) ) ( not ( = ?auto_165228 ?auto_165230 ) ) ( not ( = ?auto_165228 ?auto_165231 ) ) ( not ( = ?auto_165228 ?auto_165232 ) ) ( not ( = ?auto_165228 ?auto_165233 ) ) ( not ( = ?auto_165228 ?auto_165234 ) ) ( not ( = ?auto_165228 ?auto_165235 ) ) ( not ( = ?auto_165228 ?auto_165236 ) ) ( not ( = ?auto_165228 ?auto_165237 ) ) ( not ( = ?auto_165229 ?auto_165230 ) ) ( not ( = ?auto_165229 ?auto_165231 ) ) ( not ( = ?auto_165229 ?auto_165232 ) ) ( not ( = ?auto_165229 ?auto_165233 ) ) ( not ( = ?auto_165229 ?auto_165234 ) ) ( not ( = ?auto_165229 ?auto_165235 ) ) ( not ( = ?auto_165229 ?auto_165236 ) ) ( not ( = ?auto_165229 ?auto_165237 ) ) ( not ( = ?auto_165230 ?auto_165231 ) ) ( not ( = ?auto_165230 ?auto_165232 ) ) ( not ( = ?auto_165230 ?auto_165233 ) ) ( not ( = ?auto_165230 ?auto_165234 ) ) ( not ( = ?auto_165230 ?auto_165235 ) ) ( not ( = ?auto_165230 ?auto_165236 ) ) ( not ( = ?auto_165230 ?auto_165237 ) ) ( not ( = ?auto_165231 ?auto_165232 ) ) ( not ( = ?auto_165231 ?auto_165233 ) ) ( not ( = ?auto_165231 ?auto_165234 ) ) ( not ( = ?auto_165231 ?auto_165235 ) ) ( not ( = ?auto_165231 ?auto_165236 ) ) ( not ( = ?auto_165231 ?auto_165237 ) ) ( not ( = ?auto_165232 ?auto_165233 ) ) ( not ( = ?auto_165232 ?auto_165234 ) ) ( not ( = ?auto_165232 ?auto_165235 ) ) ( not ( = ?auto_165232 ?auto_165236 ) ) ( not ( = ?auto_165232 ?auto_165237 ) ) ( not ( = ?auto_165233 ?auto_165234 ) ) ( not ( = ?auto_165233 ?auto_165235 ) ) ( not ( = ?auto_165233 ?auto_165236 ) ) ( not ( = ?auto_165233 ?auto_165237 ) ) ( not ( = ?auto_165234 ?auto_165235 ) ) ( not ( = ?auto_165234 ?auto_165236 ) ) ( not ( = ?auto_165234 ?auto_165237 ) ) ( not ( = ?auto_165235 ?auto_165236 ) ) ( not ( = ?auto_165235 ?auto_165237 ) ) ( not ( = ?auto_165236 ?auto_165237 ) ) ( CLEAR ?auto_165234 ) ( ON ?auto_165235 ?auto_165236 ) ( CLEAR ?auto_165235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_165227 ?auto_165228 ?auto_165229 ?auto_165230 ?auto_165231 ?auto_165232 ?auto_165233 ?auto_165234 ?auto_165235 )
      ( MAKE-10PILE ?auto_165227 ?auto_165228 ?auto_165229 ?auto_165230 ?auto_165231 ?auto_165232 ?auto_165233 ?auto_165234 ?auto_165235 ?auto_165236 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_165269 - BLOCK
      ?auto_165270 - BLOCK
      ?auto_165271 - BLOCK
      ?auto_165272 - BLOCK
      ?auto_165273 - BLOCK
      ?auto_165274 - BLOCK
      ?auto_165275 - BLOCK
      ?auto_165276 - BLOCK
      ?auto_165277 - BLOCK
      ?auto_165278 - BLOCK
    )
    :vars
    (
      ?auto_165279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165278 ?auto_165279 ) ( ON-TABLE ?auto_165269 ) ( ON ?auto_165270 ?auto_165269 ) ( ON ?auto_165271 ?auto_165270 ) ( ON ?auto_165272 ?auto_165271 ) ( ON ?auto_165273 ?auto_165272 ) ( ON ?auto_165274 ?auto_165273 ) ( ON ?auto_165275 ?auto_165274 ) ( not ( = ?auto_165269 ?auto_165270 ) ) ( not ( = ?auto_165269 ?auto_165271 ) ) ( not ( = ?auto_165269 ?auto_165272 ) ) ( not ( = ?auto_165269 ?auto_165273 ) ) ( not ( = ?auto_165269 ?auto_165274 ) ) ( not ( = ?auto_165269 ?auto_165275 ) ) ( not ( = ?auto_165269 ?auto_165276 ) ) ( not ( = ?auto_165269 ?auto_165277 ) ) ( not ( = ?auto_165269 ?auto_165278 ) ) ( not ( = ?auto_165269 ?auto_165279 ) ) ( not ( = ?auto_165270 ?auto_165271 ) ) ( not ( = ?auto_165270 ?auto_165272 ) ) ( not ( = ?auto_165270 ?auto_165273 ) ) ( not ( = ?auto_165270 ?auto_165274 ) ) ( not ( = ?auto_165270 ?auto_165275 ) ) ( not ( = ?auto_165270 ?auto_165276 ) ) ( not ( = ?auto_165270 ?auto_165277 ) ) ( not ( = ?auto_165270 ?auto_165278 ) ) ( not ( = ?auto_165270 ?auto_165279 ) ) ( not ( = ?auto_165271 ?auto_165272 ) ) ( not ( = ?auto_165271 ?auto_165273 ) ) ( not ( = ?auto_165271 ?auto_165274 ) ) ( not ( = ?auto_165271 ?auto_165275 ) ) ( not ( = ?auto_165271 ?auto_165276 ) ) ( not ( = ?auto_165271 ?auto_165277 ) ) ( not ( = ?auto_165271 ?auto_165278 ) ) ( not ( = ?auto_165271 ?auto_165279 ) ) ( not ( = ?auto_165272 ?auto_165273 ) ) ( not ( = ?auto_165272 ?auto_165274 ) ) ( not ( = ?auto_165272 ?auto_165275 ) ) ( not ( = ?auto_165272 ?auto_165276 ) ) ( not ( = ?auto_165272 ?auto_165277 ) ) ( not ( = ?auto_165272 ?auto_165278 ) ) ( not ( = ?auto_165272 ?auto_165279 ) ) ( not ( = ?auto_165273 ?auto_165274 ) ) ( not ( = ?auto_165273 ?auto_165275 ) ) ( not ( = ?auto_165273 ?auto_165276 ) ) ( not ( = ?auto_165273 ?auto_165277 ) ) ( not ( = ?auto_165273 ?auto_165278 ) ) ( not ( = ?auto_165273 ?auto_165279 ) ) ( not ( = ?auto_165274 ?auto_165275 ) ) ( not ( = ?auto_165274 ?auto_165276 ) ) ( not ( = ?auto_165274 ?auto_165277 ) ) ( not ( = ?auto_165274 ?auto_165278 ) ) ( not ( = ?auto_165274 ?auto_165279 ) ) ( not ( = ?auto_165275 ?auto_165276 ) ) ( not ( = ?auto_165275 ?auto_165277 ) ) ( not ( = ?auto_165275 ?auto_165278 ) ) ( not ( = ?auto_165275 ?auto_165279 ) ) ( not ( = ?auto_165276 ?auto_165277 ) ) ( not ( = ?auto_165276 ?auto_165278 ) ) ( not ( = ?auto_165276 ?auto_165279 ) ) ( not ( = ?auto_165277 ?auto_165278 ) ) ( not ( = ?auto_165277 ?auto_165279 ) ) ( not ( = ?auto_165278 ?auto_165279 ) ) ( ON ?auto_165277 ?auto_165278 ) ( CLEAR ?auto_165275 ) ( ON ?auto_165276 ?auto_165277 ) ( CLEAR ?auto_165276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165269 ?auto_165270 ?auto_165271 ?auto_165272 ?auto_165273 ?auto_165274 ?auto_165275 ?auto_165276 )
      ( MAKE-10PILE ?auto_165269 ?auto_165270 ?auto_165271 ?auto_165272 ?auto_165273 ?auto_165274 ?auto_165275 ?auto_165276 ?auto_165277 ?auto_165278 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_165311 - BLOCK
      ?auto_165312 - BLOCK
      ?auto_165313 - BLOCK
      ?auto_165314 - BLOCK
      ?auto_165315 - BLOCK
      ?auto_165316 - BLOCK
      ?auto_165317 - BLOCK
      ?auto_165318 - BLOCK
      ?auto_165319 - BLOCK
      ?auto_165320 - BLOCK
    )
    :vars
    (
      ?auto_165321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165320 ?auto_165321 ) ( ON-TABLE ?auto_165311 ) ( ON ?auto_165312 ?auto_165311 ) ( ON ?auto_165313 ?auto_165312 ) ( ON ?auto_165314 ?auto_165313 ) ( ON ?auto_165315 ?auto_165314 ) ( ON ?auto_165316 ?auto_165315 ) ( not ( = ?auto_165311 ?auto_165312 ) ) ( not ( = ?auto_165311 ?auto_165313 ) ) ( not ( = ?auto_165311 ?auto_165314 ) ) ( not ( = ?auto_165311 ?auto_165315 ) ) ( not ( = ?auto_165311 ?auto_165316 ) ) ( not ( = ?auto_165311 ?auto_165317 ) ) ( not ( = ?auto_165311 ?auto_165318 ) ) ( not ( = ?auto_165311 ?auto_165319 ) ) ( not ( = ?auto_165311 ?auto_165320 ) ) ( not ( = ?auto_165311 ?auto_165321 ) ) ( not ( = ?auto_165312 ?auto_165313 ) ) ( not ( = ?auto_165312 ?auto_165314 ) ) ( not ( = ?auto_165312 ?auto_165315 ) ) ( not ( = ?auto_165312 ?auto_165316 ) ) ( not ( = ?auto_165312 ?auto_165317 ) ) ( not ( = ?auto_165312 ?auto_165318 ) ) ( not ( = ?auto_165312 ?auto_165319 ) ) ( not ( = ?auto_165312 ?auto_165320 ) ) ( not ( = ?auto_165312 ?auto_165321 ) ) ( not ( = ?auto_165313 ?auto_165314 ) ) ( not ( = ?auto_165313 ?auto_165315 ) ) ( not ( = ?auto_165313 ?auto_165316 ) ) ( not ( = ?auto_165313 ?auto_165317 ) ) ( not ( = ?auto_165313 ?auto_165318 ) ) ( not ( = ?auto_165313 ?auto_165319 ) ) ( not ( = ?auto_165313 ?auto_165320 ) ) ( not ( = ?auto_165313 ?auto_165321 ) ) ( not ( = ?auto_165314 ?auto_165315 ) ) ( not ( = ?auto_165314 ?auto_165316 ) ) ( not ( = ?auto_165314 ?auto_165317 ) ) ( not ( = ?auto_165314 ?auto_165318 ) ) ( not ( = ?auto_165314 ?auto_165319 ) ) ( not ( = ?auto_165314 ?auto_165320 ) ) ( not ( = ?auto_165314 ?auto_165321 ) ) ( not ( = ?auto_165315 ?auto_165316 ) ) ( not ( = ?auto_165315 ?auto_165317 ) ) ( not ( = ?auto_165315 ?auto_165318 ) ) ( not ( = ?auto_165315 ?auto_165319 ) ) ( not ( = ?auto_165315 ?auto_165320 ) ) ( not ( = ?auto_165315 ?auto_165321 ) ) ( not ( = ?auto_165316 ?auto_165317 ) ) ( not ( = ?auto_165316 ?auto_165318 ) ) ( not ( = ?auto_165316 ?auto_165319 ) ) ( not ( = ?auto_165316 ?auto_165320 ) ) ( not ( = ?auto_165316 ?auto_165321 ) ) ( not ( = ?auto_165317 ?auto_165318 ) ) ( not ( = ?auto_165317 ?auto_165319 ) ) ( not ( = ?auto_165317 ?auto_165320 ) ) ( not ( = ?auto_165317 ?auto_165321 ) ) ( not ( = ?auto_165318 ?auto_165319 ) ) ( not ( = ?auto_165318 ?auto_165320 ) ) ( not ( = ?auto_165318 ?auto_165321 ) ) ( not ( = ?auto_165319 ?auto_165320 ) ) ( not ( = ?auto_165319 ?auto_165321 ) ) ( not ( = ?auto_165320 ?auto_165321 ) ) ( ON ?auto_165319 ?auto_165320 ) ( ON ?auto_165318 ?auto_165319 ) ( CLEAR ?auto_165316 ) ( ON ?auto_165317 ?auto_165318 ) ( CLEAR ?auto_165317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165311 ?auto_165312 ?auto_165313 ?auto_165314 ?auto_165315 ?auto_165316 ?auto_165317 )
      ( MAKE-10PILE ?auto_165311 ?auto_165312 ?auto_165313 ?auto_165314 ?auto_165315 ?auto_165316 ?auto_165317 ?auto_165318 ?auto_165319 ?auto_165320 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_165353 - BLOCK
      ?auto_165354 - BLOCK
      ?auto_165355 - BLOCK
      ?auto_165356 - BLOCK
      ?auto_165357 - BLOCK
      ?auto_165358 - BLOCK
      ?auto_165359 - BLOCK
      ?auto_165360 - BLOCK
      ?auto_165361 - BLOCK
      ?auto_165362 - BLOCK
    )
    :vars
    (
      ?auto_165363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165362 ?auto_165363 ) ( ON-TABLE ?auto_165353 ) ( ON ?auto_165354 ?auto_165353 ) ( ON ?auto_165355 ?auto_165354 ) ( ON ?auto_165356 ?auto_165355 ) ( ON ?auto_165357 ?auto_165356 ) ( not ( = ?auto_165353 ?auto_165354 ) ) ( not ( = ?auto_165353 ?auto_165355 ) ) ( not ( = ?auto_165353 ?auto_165356 ) ) ( not ( = ?auto_165353 ?auto_165357 ) ) ( not ( = ?auto_165353 ?auto_165358 ) ) ( not ( = ?auto_165353 ?auto_165359 ) ) ( not ( = ?auto_165353 ?auto_165360 ) ) ( not ( = ?auto_165353 ?auto_165361 ) ) ( not ( = ?auto_165353 ?auto_165362 ) ) ( not ( = ?auto_165353 ?auto_165363 ) ) ( not ( = ?auto_165354 ?auto_165355 ) ) ( not ( = ?auto_165354 ?auto_165356 ) ) ( not ( = ?auto_165354 ?auto_165357 ) ) ( not ( = ?auto_165354 ?auto_165358 ) ) ( not ( = ?auto_165354 ?auto_165359 ) ) ( not ( = ?auto_165354 ?auto_165360 ) ) ( not ( = ?auto_165354 ?auto_165361 ) ) ( not ( = ?auto_165354 ?auto_165362 ) ) ( not ( = ?auto_165354 ?auto_165363 ) ) ( not ( = ?auto_165355 ?auto_165356 ) ) ( not ( = ?auto_165355 ?auto_165357 ) ) ( not ( = ?auto_165355 ?auto_165358 ) ) ( not ( = ?auto_165355 ?auto_165359 ) ) ( not ( = ?auto_165355 ?auto_165360 ) ) ( not ( = ?auto_165355 ?auto_165361 ) ) ( not ( = ?auto_165355 ?auto_165362 ) ) ( not ( = ?auto_165355 ?auto_165363 ) ) ( not ( = ?auto_165356 ?auto_165357 ) ) ( not ( = ?auto_165356 ?auto_165358 ) ) ( not ( = ?auto_165356 ?auto_165359 ) ) ( not ( = ?auto_165356 ?auto_165360 ) ) ( not ( = ?auto_165356 ?auto_165361 ) ) ( not ( = ?auto_165356 ?auto_165362 ) ) ( not ( = ?auto_165356 ?auto_165363 ) ) ( not ( = ?auto_165357 ?auto_165358 ) ) ( not ( = ?auto_165357 ?auto_165359 ) ) ( not ( = ?auto_165357 ?auto_165360 ) ) ( not ( = ?auto_165357 ?auto_165361 ) ) ( not ( = ?auto_165357 ?auto_165362 ) ) ( not ( = ?auto_165357 ?auto_165363 ) ) ( not ( = ?auto_165358 ?auto_165359 ) ) ( not ( = ?auto_165358 ?auto_165360 ) ) ( not ( = ?auto_165358 ?auto_165361 ) ) ( not ( = ?auto_165358 ?auto_165362 ) ) ( not ( = ?auto_165358 ?auto_165363 ) ) ( not ( = ?auto_165359 ?auto_165360 ) ) ( not ( = ?auto_165359 ?auto_165361 ) ) ( not ( = ?auto_165359 ?auto_165362 ) ) ( not ( = ?auto_165359 ?auto_165363 ) ) ( not ( = ?auto_165360 ?auto_165361 ) ) ( not ( = ?auto_165360 ?auto_165362 ) ) ( not ( = ?auto_165360 ?auto_165363 ) ) ( not ( = ?auto_165361 ?auto_165362 ) ) ( not ( = ?auto_165361 ?auto_165363 ) ) ( not ( = ?auto_165362 ?auto_165363 ) ) ( ON ?auto_165361 ?auto_165362 ) ( ON ?auto_165360 ?auto_165361 ) ( ON ?auto_165359 ?auto_165360 ) ( CLEAR ?auto_165357 ) ( ON ?auto_165358 ?auto_165359 ) ( CLEAR ?auto_165358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165353 ?auto_165354 ?auto_165355 ?auto_165356 ?auto_165357 ?auto_165358 )
      ( MAKE-10PILE ?auto_165353 ?auto_165354 ?auto_165355 ?auto_165356 ?auto_165357 ?auto_165358 ?auto_165359 ?auto_165360 ?auto_165361 ?auto_165362 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_165395 - BLOCK
      ?auto_165396 - BLOCK
      ?auto_165397 - BLOCK
      ?auto_165398 - BLOCK
      ?auto_165399 - BLOCK
      ?auto_165400 - BLOCK
      ?auto_165401 - BLOCK
      ?auto_165402 - BLOCK
      ?auto_165403 - BLOCK
      ?auto_165404 - BLOCK
    )
    :vars
    (
      ?auto_165405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165404 ?auto_165405 ) ( ON-TABLE ?auto_165395 ) ( ON ?auto_165396 ?auto_165395 ) ( ON ?auto_165397 ?auto_165396 ) ( ON ?auto_165398 ?auto_165397 ) ( not ( = ?auto_165395 ?auto_165396 ) ) ( not ( = ?auto_165395 ?auto_165397 ) ) ( not ( = ?auto_165395 ?auto_165398 ) ) ( not ( = ?auto_165395 ?auto_165399 ) ) ( not ( = ?auto_165395 ?auto_165400 ) ) ( not ( = ?auto_165395 ?auto_165401 ) ) ( not ( = ?auto_165395 ?auto_165402 ) ) ( not ( = ?auto_165395 ?auto_165403 ) ) ( not ( = ?auto_165395 ?auto_165404 ) ) ( not ( = ?auto_165395 ?auto_165405 ) ) ( not ( = ?auto_165396 ?auto_165397 ) ) ( not ( = ?auto_165396 ?auto_165398 ) ) ( not ( = ?auto_165396 ?auto_165399 ) ) ( not ( = ?auto_165396 ?auto_165400 ) ) ( not ( = ?auto_165396 ?auto_165401 ) ) ( not ( = ?auto_165396 ?auto_165402 ) ) ( not ( = ?auto_165396 ?auto_165403 ) ) ( not ( = ?auto_165396 ?auto_165404 ) ) ( not ( = ?auto_165396 ?auto_165405 ) ) ( not ( = ?auto_165397 ?auto_165398 ) ) ( not ( = ?auto_165397 ?auto_165399 ) ) ( not ( = ?auto_165397 ?auto_165400 ) ) ( not ( = ?auto_165397 ?auto_165401 ) ) ( not ( = ?auto_165397 ?auto_165402 ) ) ( not ( = ?auto_165397 ?auto_165403 ) ) ( not ( = ?auto_165397 ?auto_165404 ) ) ( not ( = ?auto_165397 ?auto_165405 ) ) ( not ( = ?auto_165398 ?auto_165399 ) ) ( not ( = ?auto_165398 ?auto_165400 ) ) ( not ( = ?auto_165398 ?auto_165401 ) ) ( not ( = ?auto_165398 ?auto_165402 ) ) ( not ( = ?auto_165398 ?auto_165403 ) ) ( not ( = ?auto_165398 ?auto_165404 ) ) ( not ( = ?auto_165398 ?auto_165405 ) ) ( not ( = ?auto_165399 ?auto_165400 ) ) ( not ( = ?auto_165399 ?auto_165401 ) ) ( not ( = ?auto_165399 ?auto_165402 ) ) ( not ( = ?auto_165399 ?auto_165403 ) ) ( not ( = ?auto_165399 ?auto_165404 ) ) ( not ( = ?auto_165399 ?auto_165405 ) ) ( not ( = ?auto_165400 ?auto_165401 ) ) ( not ( = ?auto_165400 ?auto_165402 ) ) ( not ( = ?auto_165400 ?auto_165403 ) ) ( not ( = ?auto_165400 ?auto_165404 ) ) ( not ( = ?auto_165400 ?auto_165405 ) ) ( not ( = ?auto_165401 ?auto_165402 ) ) ( not ( = ?auto_165401 ?auto_165403 ) ) ( not ( = ?auto_165401 ?auto_165404 ) ) ( not ( = ?auto_165401 ?auto_165405 ) ) ( not ( = ?auto_165402 ?auto_165403 ) ) ( not ( = ?auto_165402 ?auto_165404 ) ) ( not ( = ?auto_165402 ?auto_165405 ) ) ( not ( = ?auto_165403 ?auto_165404 ) ) ( not ( = ?auto_165403 ?auto_165405 ) ) ( not ( = ?auto_165404 ?auto_165405 ) ) ( ON ?auto_165403 ?auto_165404 ) ( ON ?auto_165402 ?auto_165403 ) ( ON ?auto_165401 ?auto_165402 ) ( ON ?auto_165400 ?auto_165401 ) ( CLEAR ?auto_165398 ) ( ON ?auto_165399 ?auto_165400 ) ( CLEAR ?auto_165399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165395 ?auto_165396 ?auto_165397 ?auto_165398 ?auto_165399 )
      ( MAKE-10PILE ?auto_165395 ?auto_165396 ?auto_165397 ?auto_165398 ?auto_165399 ?auto_165400 ?auto_165401 ?auto_165402 ?auto_165403 ?auto_165404 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_165437 - BLOCK
      ?auto_165438 - BLOCK
      ?auto_165439 - BLOCK
      ?auto_165440 - BLOCK
      ?auto_165441 - BLOCK
      ?auto_165442 - BLOCK
      ?auto_165443 - BLOCK
      ?auto_165444 - BLOCK
      ?auto_165445 - BLOCK
      ?auto_165446 - BLOCK
    )
    :vars
    (
      ?auto_165447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165446 ?auto_165447 ) ( ON-TABLE ?auto_165437 ) ( ON ?auto_165438 ?auto_165437 ) ( ON ?auto_165439 ?auto_165438 ) ( not ( = ?auto_165437 ?auto_165438 ) ) ( not ( = ?auto_165437 ?auto_165439 ) ) ( not ( = ?auto_165437 ?auto_165440 ) ) ( not ( = ?auto_165437 ?auto_165441 ) ) ( not ( = ?auto_165437 ?auto_165442 ) ) ( not ( = ?auto_165437 ?auto_165443 ) ) ( not ( = ?auto_165437 ?auto_165444 ) ) ( not ( = ?auto_165437 ?auto_165445 ) ) ( not ( = ?auto_165437 ?auto_165446 ) ) ( not ( = ?auto_165437 ?auto_165447 ) ) ( not ( = ?auto_165438 ?auto_165439 ) ) ( not ( = ?auto_165438 ?auto_165440 ) ) ( not ( = ?auto_165438 ?auto_165441 ) ) ( not ( = ?auto_165438 ?auto_165442 ) ) ( not ( = ?auto_165438 ?auto_165443 ) ) ( not ( = ?auto_165438 ?auto_165444 ) ) ( not ( = ?auto_165438 ?auto_165445 ) ) ( not ( = ?auto_165438 ?auto_165446 ) ) ( not ( = ?auto_165438 ?auto_165447 ) ) ( not ( = ?auto_165439 ?auto_165440 ) ) ( not ( = ?auto_165439 ?auto_165441 ) ) ( not ( = ?auto_165439 ?auto_165442 ) ) ( not ( = ?auto_165439 ?auto_165443 ) ) ( not ( = ?auto_165439 ?auto_165444 ) ) ( not ( = ?auto_165439 ?auto_165445 ) ) ( not ( = ?auto_165439 ?auto_165446 ) ) ( not ( = ?auto_165439 ?auto_165447 ) ) ( not ( = ?auto_165440 ?auto_165441 ) ) ( not ( = ?auto_165440 ?auto_165442 ) ) ( not ( = ?auto_165440 ?auto_165443 ) ) ( not ( = ?auto_165440 ?auto_165444 ) ) ( not ( = ?auto_165440 ?auto_165445 ) ) ( not ( = ?auto_165440 ?auto_165446 ) ) ( not ( = ?auto_165440 ?auto_165447 ) ) ( not ( = ?auto_165441 ?auto_165442 ) ) ( not ( = ?auto_165441 ?auto_165443 ) ) ( not ( = ?auto_165441 ?auto_165444 ) ) ( not ( = ?auto_165441 ?auto_165445 ) ) ( not ( = ?auto_165441 ?auto_165446 ) ) ( not ( = ?auto_165441 ?auto_165447 ) ) ( not ( = ?auto_165442 ?auto_165443 ) ) ( not ( = ?auto_165442 ?auto_165444 ) ) ( not ( = ?auto_165442 ?auto_165445 ) ) ( not ( = ?auto_165442 ?auto_165446 ) ) ( not ( = ?auto_165442 ?auto_165447 ) ) ( not ( = ?auto_165443 ?auto_165444 ) ) ( not ( = ?auto_165443 ?auto_165445 ) ) ( not ( = ?auto_165443 ?auto_165446 ) ) ( not ( = ?auto_165443 ?auto_165447 ) ) ( not ( = ?auto_165444 ?auto_165445 ) ) ( not ( = ?auto_165444 ?auto_165446 ) ) ( not ( = ?auto_165444 ?auto_165447 ) ) ( not ( = ?auto_165445 ?auto_165446 ) ) ( not ( = ?auto_165445 ?auto_165447 ) ) ( not ( = ?auto_165446 ?auto_165447 ) ) ( ON ?auto_165445 ?auto_165446 ) ( ON ?auto_165444 ?auto_165445 ) ( ON ?auto_165443 ?auto_165444 ) ( ON ?auto_165442 ?auto_165443 ) ( ON ?auto_165441 ?auto_165442 ) ( CLEAR ?auto_165439 ) ( ON ?auto_165440 ?auto_165441 ) ( CLEAR ?auto_165440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165437 ?auto_165438 ?auto_165439 ?auto_165440 )
      ( MAKE-10PILE ?auto_165437 ?auto_165438 ?auto_165439 ?auto_165440 ?auto_165441 ?auto_165442 ?auto_165443 ?auto_165444 ?auto_165445 ?auto_165446 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_165479 - BLOCK
      ?auto_165480 - BLOCK
      ?auto_165481 - BLOCK
      ?auto_165482 - BLOCK
      ?auto_165483 - BLOCK
      ?auto_165484 - BLOCK
      ?auto_165485 - BLOCK
      ?auto_165486 - BLOCK
      ?auto_165487 - BLOCK
      ?auto_165488 - BLOCK
    )
    :vars
    (
      ?auto_165489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165488 ?auto_165489 ) ( ON-TABLE ?auto_165479 ) ( ON ?auto_165480 ?auto_165479 ) ( not ( = ?auto_165479 ?auto_165480 ) ) ( not ( = ?auto_165479 ?auto_165481 ) ) ( not ( = ?auto_165479 ?auto_165482 ) ) ( not ( = ?auto_165479 ?auto_165483 ) ) ( not ( = ?auto_165479 ?auto_165484 ) ) ( not ( = ?auto_165479 ?auto_165485 ) ) ( not ( = ?auto_165479 ?auto_165486 ) ) ( not ( = ?auto_165479 ?auto_165487 ) ) ( not ( = ?auto_165479 ?auto_165488 ) ) ( not ( = ?auto_165479 ?auto_165489 ) ) ( not ( = ?auto_165480 ?auto_165481 ) ) ( not ( = ?auto_165480 ?auto_165482 ) ) ( not ( = ?auto_165480 ?auto_165483 ) ) ( not ( = ?auto_165480 ?auto_165484 ) ) ( not ( = ?auto_165480 ?auto_165485 ) ) ( not ( = ?auto_165480 ?auto_165486 ) ) ( not ( = ?auto_165480 ?auto_165487 ) ) ( not ( = ?auto_165480 ?auto_165488 ) ) ( not ( = ?auto_165480 ?auto_165489 ) ) ( not ( = ?auto_165481 ?auto_165482 ) ) ( not ( = ?auto_165481 ?auto_165483 ) ) ( not ( = ?auto_165481 ?auto_165484 ) ) ( not ( = ?auto_165481 ?auto_165485 ) ) ( not ( = ?auto_165481 ?auto_165486 ) ) ( not ( = ?auto_165481 ?auto_165487 ) ) ( not ( = ?auto_165481 ?auto_165488 ) ) ( not ( = ?auto_165481 ?auto_165489 ) ) ( not ( = ?auto_165482 ?auto_165483 ) ) ( not ( = ?auto_165482 ?auto_165484 ) ) ( not ( = ?auto_165482 ?auto_165485 ) ) ( not ( = ?auto_165482 ?auto_165486 ) ) ( not ( = ?auto_165482 ?auto_165487 ) ) ( not ( = ?auto_165482 ?auto_165488 ) ) ( not ( = ?auto_165482 ?auto_165489 ) ) ( not ( = ?auto_165483 ?auto_165484 ) ) ( not ( = ?auto_165483 ?auto_165485 ) ) ( not ( = ?auto_165483 ?auto_165486 ) ) ( not ( = ?auto_165483 ?auto_165487 ) ) ( not ( = ?auto_165483 ?auto_165488 ) ) ( not ( = ?auto_165483 ?auto_165489 ) ) ( not ( = ?auto_165484 ?auto_165485 ) ) ( not ( = ?auto_165484 ?auto_165486 ) ) ( not ( = ?auto_165484 ?auto_165487 ) ) ( not ( = ?auto_165484 ?auto_165488 ) ) ( not ( = ?auto_165484 ?auto_165489 ) ) ( not ( = ?auto_165485 ?auto_165486 ) ) ( not ( = ?auto_165485 ?auto_165487 ) ) ( not ( = ?auto_165485 ?auto_165488 ) ) ( not ( = ?auto_165485 ?auto_165489 ) ) ( not ( = ?auto_165486 ?auto_165487 ) ) ( not ( = ?auto_165486 ?auto_165488 ) ) ( not ( = ?auto_165486 ?auto_165489 ) ) ( not ( = ?auto_165487 ?auto_165488 ) ) ( not ( = ?auto_165487 ?auto_165489 ) ) ( not ( = ?auto_165488 ?auto_165489 ) ) ( ON ?auto_165487 ?auto_165488 ) ( ON ?auto_165486 ?auto_165487 ) ( ON ?auto_165485 ?auto_165486 ) ( ON ?auto_165484 ?auto_165485 ) ( ON ?auto_165483 ?auto_165484 ) ( ON ?auto_165482 ?auto_165483 ) ( CLEAR ?auto_165480 ) ( ON ?auto_165481 ?auto_165482 ) ( CLEAR ?auto_165481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165479 ?auto_165480 ?auto_165481 )
      ( MAKE-10PILE ?auto_165479 ?auto_165480 ?auto_165481 ?auto_165482 ?auto_165483 ?auto_165484 ?auto_165485 ?auto_165486 ?auto_165487 ?auto_165488 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_165521 - BLOCK
      ?auto_165522 - BLOCK
      ?auto_165523 - BLOCK
      ?auto_165524 - BLOCK
      ?auto_165525 - BLOCK
      ?auto_165526 - BLOCK
      ?auto_165527 - BLOCK
      ?auto_165528 - BLOCK
      ?auto_165529 - BLOCK
      ?auto_165530 - BLOCK
    )
    :vars
    (
      ?auto_165531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165530 ?auto_165531 ) ( ON-TABLE ?auto_165521 ) ( not ( = ?auto_165521 ?auto_165522 ) ) ( not ( = ?auto_165521 ?auto_165523 ) ) ( not ( = ?auto_165521 ?auto_165524 ) ) ( not ( = ?auto_165521 ?auto_165525 ) ) ( not ( = ?auto_165521 ?auto_165526 ) ) ( not ( = ?auto_165521 ?auto_165527 ) ) ( not ( = ?auto_165521 ?auto_165528 ) ) ( not ( = ?auto_165521 ?auto_165529 ) ) ( not ( = ?auto_165521 ?auto_165530 ) ) ( not ( = ?auto_165521 ?auto_165531 ) ) ( not ( = ?auto_165522 ?auto_165523 ) ) ( not ( = ?auto_165522 ?auto_165524 ) ) ( not ( = ?auto_165522 ?auto_165525 ) ) ( not ( = ?auto_165522 ?auto_165526 ) ) ( not ( = ?auto_165522 ?auto_165527 ) ) ( not ( = ?auto_165522 ?auto_165528 ) ) ( not ( = ?auto_165522 ?auto_165529 ) ) ( not ( = ?auto_165522 ?auto_165530 ) ) ( not ( = ?auto_165522 ?auto_165531 ) ) ( not ( = ?auto_165523 ?auto_165524 ) ) ( not ( = ?auto_165523 ?auto_165525 ) ) ( not ( = ?auto_165523 ?auto_165526 ) ) ( not ( = ?auto_165523 ?auto_165527 ) ) ( not ( = ?auto_165523 ?auto_165528 ) ) ( not ( = ?auto_165523 ?auto_165529 ) ) ( not ( = ?auto_165523 ?auto_165530 ) ) ( not ( = ?auto_165523 ?auto_165531 ) ) ( not ( = ?auto_165524 ?auto_165525 ) ) ( not ( = ?auto_165524 ?auto_165526 ) ) ( not ( = ?auto_165524 ?auto_165527 ) ) ( not ( = ?auto_165524 ?auto_165528 ) ) ( not ( = ?auto_165524 ?auto_165529 ) ) ( not ( = ?auto_165524 ?auto_165530 ) ) ( not ( = ?auto_165524 ?auto_165531 ) ) ( not ( = ?auto_165525 ?auto_165526 ) ) ( not ( = ?auto_165525 ?auto_165527 ) ) ( not ( = ?auto_165525 ?auto_165528 ) ) ( not ( = ?auto_165525 ?auto_165529 ) ) ( not ( = ?auto_165525 ?auto_165530 ) ) ( not ( = ?auto_165525 ?auto_165531 ) ) ( not ( = ?auto_165526 ?auto_165527 ) ) ( not ( = ?auto_165526 ?auto_165528 ) ) ( not ( = ?auto_165526 ?auto_165529 ) ) ( not ( = ?auto_165526 ?auto_165530 ) ) ( not ( = ?auto_165526 ?auto_165531 ) ) ( not ( = ?auto_165527 ?auto_165528 ) ) ( not ( = ?auto_165527 ?auto_165529 ) ) ( not ( = ?auto_165527 ?auto_165530 ) ) ( not ( = ?auto_165527 ?auto_165531 ) ) ( not ( = ?auto_165528 ?auto_165529 ) ) ( not ( = ?auto_165528 ?auto_165530 ) ) ( not ( = ?auto_165528 ?auto_165531 ) ) ( not ( = ?auto_165529 ?auto_165530 ) ) ( not ( = ?auto_165529 ?auto_165531 ) ) ( not ( = ?auto_165530 ?auto_165531 ) ) ( ON ?auto_165529 ?auto_165530 ) ( ON ?auto_165528 ?auto_165529 ) ( ON ?auto_165527 ?auto_165528 ) ( ON ?auto_165526 ?auto_165527 ) ( ON ?auto_165525 ?auto_165526 ) ( ON ?auto_165524 ?auto_165525 ) ( ON ?auto_165523 ?auto_165524 ) ( CLEAR ?auto_165521 ) ( ON ?auto_165522 ?auto_165523 ) ( CLEAR ?auto_165522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165521 ?auto_165522 )
      ( MAKE-10PILE ?auto_165521 ?auto_165522 ?auto_165523 ?auto_165524 ?auto_165525 ?auto_165526 ?auto_165527 ?auto_165528 ?auto_165529 ?auto_165530 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_165563 - BLOCK
      ?auto_165564 - BLOCK
      ?auto_165565 - BLOCK
      ?auto_165566 - BLOCK
      ?auto_165567 - BLOCK
      ?auto_165568 - BLOCK
      ?auto_165569 - BLOCK
      ?auto_165570 - BLOCK
      ?auto_165571 - BLOCK
      ?auto_165572 - BLOCK
    )
    :vars
    (
      ?auto_165573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165572 ?auto_165573 ) ( not ( = ?auto_165563 ?auto_165564 ) ) ( not ( = ?auto_165563 ?auto_165565 ) ) ( not ( = ?auto_165563 ?auto_165566 ) ) ( not ( = ?auto_165563 ?auto_165567 ) ) ( not ( = ?auto_165563 ?auto_165568 ) ) ( not ( = ?auto_165563 ?auto_165569 ) ) ( not ( = ?auto_165563 ?auto_165570 ) ) ( not ( = ?auto_165563 ?auto_165571 ) ) ( not ( = ?auto_165563 ?auto_165572 ) ) ( not ( = ?auto_165563 ?auto_165573 ) ) ( not ( = ?auto_165564 ?auto_165565 ) ) ( not ( = ?auto_165564 ?auto_165566 ) ) ( not ( = ?auto_165564 ?auto_165567 ) ) ( not ( = ?auto_165564 ?auto_165568 ) ) ( not ( = ?auto_165564 ?auto_165569 ) ) ( not ( = ?auto_165564 ?auto_165570 ) ) ( not ( = ?auto_165564 ?auto_165571 ) ) ( not ( = ?auto_165564 ?auto_165572 ) ) ( not ( = ?auto_165564 ?auto_165573 ) ) ( not ( = ?auto_165565 ?auto_165566 ) ) ( not ( = ?auto_165565 ?auto_165567 ) ) ( not ( = ?auto_165565 ?auto_165568 ) ) ( not ( = ?auto_165565 ?auto_165569 ) ) ( not ( = ?auto_165565 ?auto_165570 ) ) ( not ( = ?auto_165565 ?auto_165571 ) ) ( not ( = ?auto_165565 ?auto_165572 ) ) ( not ( = ?auto_165565 ?auto_165573 ) ) ( not ( = ?auto_165566 ?auto_165567 ) ) ( not ( = ?auto_165566 ?auto_165568 ) ) ( not ( = ?auto_165566 ?auto_165569 ) ) ( not ( = ?auto_165566 ?auto_165570 ) ) ( not ( = ?auto_165566 ?auto_165571 ) ) ( not ( = ?auto_165566 ?auto_165572 ) ) ( not ( = ?auto_165566 ?auto_165573 ) ) ( not ( = ?auto_165567 ?auto_165568 ) ) ( not ( = ?auto_165567 ?auto_165569 ) ) ( not ( = ?auto_165567 ?auto_165570 ) ) ( not ( = ?auto_165567 ?auto_165571 ) ) ( not ( = ?auto_165567 ?auto_165572 ) ) ( not ( = ?auto_165567 ?auto_165573 ) ) ( not ( = ?auto_165568 ?auto_165569 ) ) ( not ( = ?auto_165568 ?auto_165570 ) ) ( not ( = ?auto_165568 ?auto_165571 ) ) ( not ( = ?auto_165568 ?auto_165572 ) ) ( not ( = ?auto_165568 ?auto_165573 ) ) ( not ( = ?auto_165569 ?auto_165570 ) ) ( not ( = ?auto_165569 ?auto_165571 ) ) ( not ( = ?auto_165569 ?auto_165572 ) ) ( not ( = ?auto_165569 ?auto_165573 ) ) ( not ( = ?auto_165570 ?auto_165571 ) ) ( not ( = ?auto_165570 ?auto_165572 ) ) ( not ( = ?auto_165570 ?auto_165573 ) ) ( not ( = ?auto_165571 ?auto_165572 ) ) ( not ( = ?auto_165571 ?auto_165573 ) ) ( not ( = ?auto_165572 ?auto_165573 ) ) ( ON ?auto_165571 ?auto_165572 ) ( ON ?auto_165570 ?auto_165571 ) ( ON ?auto_165569 ?auto_165570 ) ( ON ?auto_165568 ?auto_165569 ) ( ON ?auto_165567 ?auto_165568 ) ( ON ?auto_165566 ?auto_165567 ) ( ON ?auto_165565 ?auto_165566 ) ( ON ?auto_165564 ?auto_165565 ) ( ON ?auto_165563 ?auto_165564 ) ( CLEAR ?auto_165563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165563 )
      ( MAKE-10PILE ?auto_165563 ?auto_165564 ?auto_165565 ?auto_165566 ?auto_165567 ?auto_165568 ?auto_165569 ?auto_165570 ?auto_165571 ?auto_165572 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_165606 - BLOCK
      ?auto_165607 - BLOCK
      ?auto_165608 - BLOCK
      ?auto_165609 - BLOCK
      ?auto_165610 - BLOCK
      ?auto_165611 - BLOCK
      ?auto_165612 - BLOCK
      ?auto_165613 - BLOCK
      ?auto_165614 - BLOCK
      ?auto_165615 - BLOCK
      ?auto_165616 - BLOCK
    )
    :vars
    (
      ?auto_165617 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_165615 ) ( ON ?auto_165616 ?auto_165617 ) ( CLEAR ?auto_165616 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165606 ) ( ON ?auto_165607 ?auto_165606 ) ( ON ?auto_165608 ?auto_165607 ) ( ON ?auto_165609 ?auto_165608 ) ( ON ?auto_165610 ?auto_165609 ) ( ON ?auto_165611 ?auto_165610 ) ( ON ?auto_165612 ?auto_165611 ) ( ON ?auto_165613 ?auto_165612 ) ( ON ?auto_165614 ?auto_165613 ) ( ON ?auto_165615 ?auto_165614 ) ( not ( = ?auto_165606 ?auto_165607 ) ) ( not ( = ?auto_165606 ?auto_165608 ) ) ( not ( = ?auto_165606 ?auto_165609 ) ) ( not ( = ?auto_165606 ?auto_165610 ) ) ( not ( = ?auto_165606 ?auto_165611 ) ) ( not ( = ?auto_165606 ?auto_165612 ) ) ( not ( = ?auto_165606 ?auto_165613 ) ) ( not ( = ?auto_165606 ?auto_165614 ) ) ( not ( = ?auto_165606 ?auto_165615 ) ) ( not ( = ?auto_165606 ?auto_165616 ) ) ( not ( = ?auto_165606 ?auto_165617 ) ) ( not ( = ?auto_165607 ?auto_165608 ) ) ( not ( = ?auto_165607 ?auto_165609 ) ) ( not ( = ?auto_165607 ?auto_165610 ) ) ( not ( = ?auto_165607 ?auto_165611 ) ) ( not ( = ?auto_165607 ?auto_165612 ) ) ( not ( = ?auto_165607 ?auto_165613 ) ) ( not ( = ?auto_165607 ?auto_165614 ) ) ( not ( = ?auto_165607 ?auto_165615 ) ) ( not ( = ?auto_165607 ?auto_165616 ) ) ( not ( = ?auto_165607 ?auto_165617 ) ) ( not ( = ?auto_165608 ?auto_165609 ) ) ( not ( = ?auto_165608 ?auto_165610 ) ) ( not ( = ?auto_165608 ?auto_165611 ) ) ( not ( = ?auto_165608 ?auto_165612 ) ) ( not ( = ?auto_165608 ?auto_165613 ) ) ( not ( = ?auto_165608 ?auto_165614 ) ) ( not ( = ?auto_165608 ?auto_165615 ) ) ( not ( = ?auto_165608 ?auto_165616 ) ) ( not ( = ?auto_165608 ?auto_165617 ) ) ( not ( = ?auto_165609 ?auto_165610 ) ) ( not ( = ?auto_165609 ?auto_165611 ) ) ( not ( = ?auto_165609 ?auto_165612 ) ) ( not ( = ?auto_165609 ?auto_165613 ) ) ( not ( = ?auto_165609 ?auto_165614 ) ) ( not ( = ?auto_165609 ?auto_165615 ) ) ( not ( = ?auto_165609 ?auto_165616 ) ) ( not ( = ?auto_165609 ?auto_165617 ) ) ( not ( = ?auto_165610 ?auto_165611 ) ) ( not ( = ?auto_165610 ?auto_165612 ) ) ( not ( = ?auto_165610 ?auto_165613 ) ) ( not ( = ?auto_165610 ?auto_165614 ) ) ( not ( = ?auto_165610 ?auto_165615 ) ) ( not ( = ?auto_165610 ?auto_165616 ) ) ( not ( = ?auto_165610 ?auto_165617 ) ) ( not ( = ?auto_165611 ?auto_165612 ) ) ( not ( = ?auto_165611 ?auto_165613 ) ) ( not ( = ?auto_165611 ?auto_165614 ) ) ( not ( = ?auto_165611 ?auto_165615 ) ) ( not ( = ?auto_165611 ?auto_165616 ) ) ( not ( = ?auto_165611 ?auto_165617 ) ) ( not ( = ?auto_165612 ?auto_165613 ) ) ( not ( = ?auto_165612 ?auto_165614 ) ) ( not ( = ?auto_165612 ?auto_165615 ) ) ( not ( = ?auto_165612 ?auto_165616 ) ) ( not ( = ?auto_165612 ?auto_165617 ) ) ( not ( = ?auto_165613 ?auto_165614 ) ) ( not ( = ?auto_165613 ?auto_165615 ) ) ( not ( = ?auto_165613 ?auto_165616 ) ) ( not ( = ?auto_165613 ?auto_165617 ) ) ( not ( = ?auto_165614 ?auto_165615 ) ) ( not ( = ?auto_165614 ?auto_165616 ) ) ( not ( = ?auto_165614 ?auto_165617 ) ) ( not ( = ?auto_165615 ?auto_165616 ) ) ( not ( = ?auto_165615 ?auto_165617 ) ) ( not ( = ?auto_165616 ?auto_165617 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165616 ?auto_165617 )
      ( !STACK ?auto_165616 ?auto_165615 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_165652 - BLOCK
      ?auto_165653 - BLOCK
      ?auto_165654 - BLOCK
      ?auto_165655 - BLOCK
      ?auto_165656 - BLOCK
      ?auto_165657 - BLOCK
      ?auto_165658 - BLOCK
      ?auto_165659 - BLOCK
      ?auto_165660 - BLOCK
      ?auto_165661 - BLOCK
      ?auto_165662 - BLOCK
    )
    :vars
    (
      ?auto_165663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165662 ?auto_165663 ) ( ON-TABLE ?auto_165652 ) ( ON ?auto_165653 ?auto_165652 ) ( ON ?auto_165654 ?auto_165653 ) ( ON ?auto_165655 ?auto_165654 ) ( ON ?auto_165656 ?auto_165655 ) ( ON ?auto_165657 ?auto_165656 ) ( ON ?auto_165658 ?auto_165657 ) ( ON ?auto_165659 ?auto_165658 ) ( ON ?auto_165660 ?auto_165659 ) ( not ( = ?auto_165652 ?auto_165653 ) ) ( not ( = ?auto_165652 ?auto_165654 ) ) ( not ( = ?auto_165652 ?auto_165655 ) ) ( not ( = ?auto_165652 ?auto_165656 ) ) ( not ( = ?auto_165652 ?auto_165657 ) ) ( not ( = ?auto_165652 ?auto_165658 ) ) ( not ( = ?auto_165652 ?auto_165659 ) ) ( not ( = ?auto_165652 ?auto_165660 ) ) ( not ( = ?auto_165652 ?auto_165661 ) ) ( not ( = ?auto_165652 ?auto_165662 ) ) ( not ( = ?auto_165652 ?auto_165663 ) ) ( not ( = ?auto_165653 ?auto_165654 ) ) ( not ( = ?auto_165653 ?auto_165655 ) ) ( not ( = ?auto_165653 ?auto_165656 ) ) ( not ( = ?auto_165653 ?auto_165657 ) ) ( not ( = ?auto_165653 ?auto_165658 ) ) ( not ( = ?auto_165653 ?auto_165659 ) ) ( not ( = ?auto_165653 ?auto_165660 ) ) ( not ( = ?auto_165653 ?auto_165661 ) ) ( not ( = ?auto_165653 ?auto_165662 ) ) ( not ( = ?auto_165653 ?auto_165663 ) ) ( not ( = ?auto_165654 ?auto_165655 ) ) ( not ( = ?auto_165654 ?auto_165656 ) ) ( not ( = ?auto_165654 ?auto_165657 ) ) ( not ( = ?auto_165654 ?auto_165658 ) ) ( not ( = ?auto_165654 ?auto_165659 ) ) ( not ( = ?auto_165654 ?auto_165660 ) ) ( not ( = ?auto_165654 ?auto_165661 ) ) ( not ( = ?auto_165654 ?auto_165662 ) ) ( not ( = ?auto_165654 ?auto_165663 ) ) ( not ( = ?auto_165655 ?auto_165656 ) ) ( not ( = ?auto_165655 ?auto_165657 ) ) ( not ( = ?auto_165655 ?auto_165658 ) ) ( not ( = ?auto_165655 ?auto_165659 ) ) ( not ( = ?auto_165655 ?auto_165660 ) ) ( not ( = ?auto_165655 ?auto_165661 ) ) ( not ( = ?auto_165655 ?auto_165662 ) ) ( not ( = ?auto_165655 ?auto_165663 ) ) ( not ( = ?auto_165656 ?auto_165657 ) ) ( not ( = ?auto_165656 ?auto_165658 ) ) ( not ( = ?auto_165656 ?auto_165659 ) ) ( not ( = ?auto_165656 ?auto_165660 ) ) ( not ( = ?auto_165656 ?auto_165661 ) ) ( not ( = ?auto_165656 ?auto_165662 ) ) ( not ( = ?auto_165656 ?auto_165663 ) ) ( not ( = ?auto_165657 ?auto_165658 ) ) ( not ( = ?auto_165657 ?auto_165659 ) ) ( not ( = ?auto_165657 ?auto_165660 ) ) ( not ( = ?auto_165657 ?auto_165661 ) ) ( not ( = ?auto_165657 ?auto_165662 ) ) ( not ( = ?auto_165657 ?auto_165663 ) ) ( not ( = ?auto_165658 ?auto_165659 ) ) ( not ( = ?auto_165658 ?auto_165660 ) ) ( not ( = ?auto_165658 ?auto_165661 ) ) ( not ( = ?auto_165658 ?auto_165662 ) ) ( not ( = ?auto_165658 ?auto_165663 ) ) ( not ( = ?auto_165659 ?auto_165660 ) ) ( not ( = ?auto_165659 ?auto_165661 ) ) ( not ( = ?auto_165659 ?auto_165662 ) ) ( not ( = ?auto_165659 ?auto_165663 ) ) ( not ( = ?auto_165660 ?auto_165661 ) ) ( not ( = ?auto_165660 ?auto_165662 ) ) ( not ( = ?auto_165660 ?auto_165663 ) ) ( not ( = ?auto_165661 ?auto_165662 ) ) ( not ( = ?auto_165661 ?auto_165663 ) ) ( not ( = ?auto_165662 ?auto_165663 ) ) ( CLEAR ?auto_165660 ) ( ON ?auto_165661 ?auto_165662 ) ( CLEAR ?auto_165661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_165652 ?auto_165653 ?auto_165654 ?auto_165655 ?auto_165656 ?auto_165657 ?auto_165658 ?auto_165659 ?auto_165660 ?auto_165661 )
      ( MAKE-11PILE ?auto_165652 ?auto_165653 ?auto_165654 ?auto_165655 ?auto_165656 ?auto_165657 ?auto_165658 ?auto_165659 ?auto_165660 ?auto_165661 ?auto_165662 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_165698 - BLOCK
      ?auto_165699 - BLOCK
      ?auto_165700 - BLOCK
      ?auto_165701 - BLOCK
      ?auto_165702 - BLOCK
      ?auto_165703 - BLOCK
      ?auto_165704 - BLOCK
      ?auto_165705 - BLOCK
      ?auto_165706 - BLOCK
      ?auto_165707 - BLOCK
      ?auto_165708 - BLOCK
    )
    :vars
    (
      ?auto_165709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165708 ?auto_165709 ) ( ON-TABLE ?auto_165698 ) ( ON ?auto_165699 ?auto_165698 ) ( ON ?auto_165700 ?auto_165699 ) ( ON ?auto_165701 ?auto_165700 ) ( ON ?auto_165702 ?auto_165701 ) ( ON ?auto_165703 ?auto_165702 ) ( ON ?auto_165704 ?auto_165703 ) ( ON ?auto_165705 ?auto_165704 ) ( not ( = ?auto_165698 ?auto_165699 ) ) ( not ( = ?auto_165698 ?auto_165700 ) ) ( not ( = ?auto_165698 ?auto_165701 ) ) ( not ( = ?auto_165698 ?auto_165702 ) ) ( not ( = ?auto_165698 ?auto_165703 ) ) ( not ( = ?auto_165698 ?auto_165704 ) ) ( not ( = ?auto_165698 ?auto_165705 ) ) ( not ( = ?auto_165698 ?auto_165706 ) ) ( not ( = ?auto_165698 ?auto_165707 ) ) ( not ( = ?auto_165698 ?auto_165708 ) ) ( not ( = ?auto_165698 ?auto_165709 ) ) ( not ( = ?auto_165699 ?auto_165700 ) ) ( not ( = ?auto_165699 ?auto_165701 ) ) ( not ( = ?auto_165699 ?auto_165702 ) ) ( not ( = ?auto_165699 ?auto_165703 ) ) ( not ( = ?auto_165699 ?auto_165704 ) ) ( not ( = ?auto_165699 ?auto_165705 ) ) ( not ( = ?auto_165699 ?auto_165706 ) ) ( not ( = ?auto_165699 ?auto_165707 ) ) ( not ( = ?auto_165699 ?auto_165708 ) ) ( not ( = ?auto_165699 ?auto_165709 ) ) ( not ( = ?auto_165700 ?auto_165701 ) ) ( not ( = ?auto_165700 ?auto_165702 ) ) ( not ( = ?auto_165700 ?auto_165703 ) ) ( not ( = ?auto_165700 ?auto_165704 ) ) ( not ( = ?auto_165700 ?auto_165705 ) ) ( not ( = ?auto_165700 ?auto_165706 ) ) ( not ( = ?auto_165700 ?auto_165707 ) ) ( not ( = ?auto_165700 ?auto_165708 ) ) ( not ( = ?auto_165700 ?auto_165709 ) ) ( not ( = ?auto_165701 ?auto_165702 ) ) ( not ( = ?auto_165701 ?auto_165703 ) ) ( not ( = ?auto_165701 ?auto_165704 ) ) ( not ( = ?auto_165701 ?auto_165705 ) ) ( not ( = ?auto_165701 ?auto_165706 ) ) ( not ( = ?auto_165701 ?auto_165707 ) ) ( not ( = ?auto_165701 ?auto_165708 ) ) ( not ( = ?auto_165701 ?auto_165709 ) ) ( not ( = ?auto_165702 ?auto_165703 ) ) ( not ( = ?auto_165702 ?auto_165704 ) ) ( not ( = ?auto_165702 ?auto_165705 ) ) ( not ( = ?auto_165702 ?auto_165706 ) ) ( not ( = ?auto_165702 ?auto_165707 ) ) ( not ( = ?auto_165702 ?auto_165708 ) ) ( not ( = ?auto_165702 ?auto_165709 ) ) ( not ( = ?auto_165703 ?auto_165704 ) ) ( not ( = ?auto_165703 ?auto_165705 ) ) ( not ( = ?auto_165703 ?auto_165706 ) ) ( not ( = ?auto_165703 ?auto_165707 ) ) ( not ( = ?auto_165703 ?auto_165708 ) ) ( not ( = ?auto_165703 ?auto_165709 ) ) ( not ( = ?auto_165704 ?auto_165705 ) ) ( not ( = ?auto_165704 ?auto_165706 ) ) ( not ( = ?auto_165704 ?auto_165707 ) ) ( not ( = ?auto_165704 ?auto_165708 ) ) ( not ( = ?auto_165704 ?auto_165709 ) ) ( not ( = ?auto_165705 ?auto_165706 ) ) ( not ( = ?auto_165705 ?auto_165707 ) ) ( not ( = ?auto_165705 ?auto_165708 ) ) ( not ( = ?auto_165705 ?auto_165709 ) ) ( not ( = ?auto_165706 ?auto_165707 ) ) ( not ( = ?auto_165706 ?auto_165708 ) ) ( not ( = ?auto_165706 ?auto_165709 ) ) ( not ( = ?auto_165707 ?auto_165708 ) ) ( not ( = ?auto_165707 ?auto_165709 ) ) ( not ( = ?auto_165708 ?auto_165709 ) ) ( ON ?auto_165707 ?auto_165708 ) ( CLEAR ?auto_165705 ) ( ON ?auto_165706 ?auto_165707 ) ( CLEAR ?auto_165706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_165698 ?auto_165699 ?auto_165700 ?auto_165701 ?auto_165702 ?auto_165703 ?auto_165704 ?auto_165705 ?auto_165706 )
      ( MAKE-11PILE ?auto_165698 ?auto_165699 ?auto_165700 ?auto_165701 ?auto_165702 ?auto_165703 ?auto_165704 ?auto_165705 ?auto_165706 ?auto_165707 ?auto_165708 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_165744 - BLOCK
      ?auto_165745 - BLOCK
      ?auto_165746 - BLOCK
      ?auto_165747 - BLOCK
      ?auto_165748 - BLOCK
      ?auto_165749 - BLOCK
      ?auto_165750 - BLOCK
      ?auto_165751 - BLOCK
      ?auto_165752 - BLOCK
      ?auto_165753 - BLOCK
      ?auto_165754 - BLOCK
    )
    :vars
    (
      ?auto_165755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165754 ?auto_165755 ) ( ON-TABLE ?auto_165744 ) ( ON ?auto_165745 ?auto_165744 ) ( ON ?auto_165746 ?auto_165745 ) ( ON ?auto_165747 ?auto_165746 ) ( ON ?auto_165748 ?auto_165747 ) ( ON ?auto_165749 ?auto_165748 ) ( ON ?auto_165750 ?auto_165749 ) ( not ( = ?auto_165744 ?auto_165745 ) ) ( not ( = ?auto_165744 ?auto_165746 ) ) ( not ( = ?auto_165744 ?auto_165747 ) ) ( not ( = ?auto_165744 ?auto_165748 ) ) ( not ( = ?auto_165744 ?auto_165749 ) ) ( not ( = ?auto_165744 ?auto_165750 ) ) ( not ( = ?auto_165744 ?auto_165751 ) ) ( not ( = ?auto_165744 ?auto_165752 ) ) ( not ( = ?auto_165744 ?auto_165753 ) ) ( not ( = ?auto_165744 ?auto_165754 ) ) ( not ( = ?auto_165744 ?auto_165755 ) ) ( not ( = ?auto_165745 ?auto_165746 ) ) ( not ( = ?auto_165745 ?auto_165747 ) ) ( not ( = ?auto_165745 ?auto_165748 ) ) ( not ( = ?auto_165745 ?auto_165749 ) ) ( not ( = ?auto_165745 ?auto_165750 ) ) ( not ( = ?auto_165745 ?auto_165751 ) ) ( not ( = ?auto_165745 ?auto_165752 ) ) ( not ( = ?auto_165745 ?auto_165753 ) ) ( not ( = ?auto_165745 ?auto_165754 ) ) ( not ( = ?auto_165745 ?auto_165755 ) ) ( not ( = ?auto_165746 ?auto_165747 ) ) ( not ( = ?auto_165746 ?auto_165748 ) ) ( not ( = ?auto_165746 ?auto_165749 ) ) ( not ( = ?auto_165746 ?auto_165750 ) ) ( not ( = ?auto_165746 ?auto_165751 ) ) ( not ( = ?auto_165746 ?auto_165752 ) ) ( not ( = ?auto_165746 ?auto_165753 ) ) ( not ( = ?auto_165746 ?auto_165754 ) ) ( not ( = ?auto_165746 ?auto_165755 ) ) ( not ( = ?auto_165747 ?auto_165748 ) ) ( not ( = ?auto_165747 ?auto_165749 ) ) ( not ( = ?auto_165747 ?auto_165750 ) ) ( not ( = ?auto_165747 ?auto_165751 ) ) ( not ( = ?auto_165747 ?auto_165752 ) ) ( not ( = ?auto_165747 ?auto_165753 ) ) ( not ( = ?auto_165747 ?auto_165754 ) ) ( not ( = ?auto_165747 ?auto_165755 ) ) ( not ( = ?auto_165748 ?auto_165749 ) ) ( not ( = ?auto_165748 ?auto_165750 ) ) ( not ( = ?auto_165748 ?auto_165751 ) ) ( not ( = ?auto_165748 ?auto_165752 ) ) ( not ( = ?auto_165748 ?auto_165753 ) ) ( not ( = ?auto_165748 ?auto_165754 ) ) ( not ( = ?auto_165748 ?auto_165755 ) ) ( not ( = ?auto_165749 ?auto_165750 ) ) ( not ( = ?auto_165749 ?auto_165751 ) ) ( not ( = ?auto_165749 ?auto_165752 ) ) ( not ( = ?auto_165749 ?auto_165753 ) ) ( not ( = ?auto_165749 ?auto_165754 ) ) ( not ( = ?auto_165749 ?auto_165755 ) ) ( not ( = ?auto_165750 ?auto_165751 ) ) ( not ( = ?auto_165750 ?auto_165752 ) ) ( not ( = ?auto_165750 ?auto_165753 ) ) ( not ( = ?auto_165750 ?auto_165754 ) ) ( not ( = ?auto_165750 ?auto_165755 ) ) ( not ( = ?auto_165751 ?auto_165752 ) ) ( not ( = ?auto_165751 ?auto_165753 ) ) ( not ( = ?auto_165751 ?auto_165754 ) ) ( not ( = ?auto_165751 ?auto_165755 ) ) ( not ( = ?auto_165752 ?auto_165753 ) ) ( not ( = ?auto_165752 ?auto_165754 ) ) ( not ( = ?auto_165752 ?auto_165755 ) ) ( not ( = ?auto_165753 ?auto_165754 ) ) ( not ( = ?auto_165753 ?auto_165755 ) ) ( not ( = ?auto_165754 ?auto_165755 ) ) ( ON ?auto_165753 ?auto_165754 ) ( ON ?auto_165752 ?auto_165753 ) ( CLEAR ?auto_165750 ) ( ON ?auto_165751 ?auto_165752 ) ( CLEAR ?auto_165751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165744 ?auto_165745 ?auto_165746 ?auto_165747 ?auto_165748 ?auto_165749 ?auto_165750 ?auto_165751 )
      ( MAKE-11PILE ?auto_165744 ?auto_165745 ?auto_165746 ?auto_165747 ?auto_165748 ?auto_165749 ?auto_165750 ?auto_165751 ?auto_165752 ?auto_165753 ?auto_165754 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_165790 - BLOCK
      ?auto_165791 - BLOCK
      ?auto_165792 - BLOCK
      ?auto_165793 - BLOCK
      ?auto_165794 - BLOCK
      ?auto_165795 - BLOCK
      ?auto_165796 - BLOCK
      ?auto_165797 - BLOCK
      ?auto_165798 - BLOCK
      ?auto_165799 - BLOCK
      ?auto_165800 - BLOCK
    )
    :vars
    (
      ?auto_165801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165800 ?auto_165801 ) ( ON-TABLE ?auto_165790 ) ( ON ?auto_165791 ?auto_165790 ) ( ON ?auto_165792 ?auto_165791 ) ( ON ?auto_165793 ?auto_165792 ) ( ON ?auto_165794 ?auto_165793 ) ( ON ?auto_165795 ?auto_165794 ) ( not ( = ?auto_165790 ?auto_165791 ) ) ( not ( = ?auto_165790 ?auto_165792 ) ) ( not ( = ?auto_165790 ?auto_165793 ) ) ( not ( = ?auto_165790 ?auto_165794 ) ) ( not ( = ?auto_165790 ?auto_165795 ) ) ( not ( = ?auto_165790 ?auto_165796 ) ) ( not ( = ?auto_165790 ?auto_165797 ) ) ( not ( = ?auto_165790 ?auto_165798 ) ) ( not ( = ?auto_165790 ?auto_165799 ) ) ( not ( = ?auto_165790 ?auto_165800 ) ) ( not ( = ?auto_165790 ?auto_165801 ) ) ( not ( = ?auto_165791 ?auto_165792 ) ) ( not ( = ?auto_165791 ?auto_165793 ) ) ( not ( = ?auto_165791 ?auto_165794 ) ) ( not ( = ?auto_165791 ?auto_165795 ) ) ( not ( = ?auto_165791 ?auto_165796 ) ) ( not ( = ?auto_165791 ?auto_165797 ) ) ( not ( = ?auto_165791 ?auto_165798 ) ) ( not ( = ?auto_165791 ?auto_165799 ) ) ( not ( = ?auto_165791 ?auto_165800 ) ) ( not ( = ?auto_165791 ?auto_165801 ) ) ( not ( = ?auto_165792 ?auto_165793 ) ) ( not ( = ?auto_165792 ?auto_165794 ) ) ( not ( = ?auto_165792 ?auto_165795 ) ) ( not ( = ?auto_165792 ?auto_165796 ) ) ( not ( = ?auto_165792 ?auto_165797 ) ) ( not ( = ?auto_165792 ?auto_165798 ) ) ( not ( = ?auto_165792 ?auto_165799 ) ) ( not ( = ?auto_165792 ?auto_165800 ) ) ( not ( = ?auto_165792 ?auto_165801 ) ) ( not ( = ?auto_165793 ?auto_165794 ) ) ( not ( = ?auto_165793 ?auto_165795 ) ) ( not ( = ?auto_165793 ?auto_165796 ) ) ( not ( = ?auto_165793 ?auto_165797 ) ) ( not ( = ?auto_165793 ?auto_165798 ) ) ( not ( = ?auto_165793 ?auto_165799 ) ) ( not ( = ?auto_165793 ?auto_165800 ) ) ( not ( = ?auto_165793 ?auto_165801 ) ) ( not ( = ?auto_165794 ?auto_165795 ) ) ( not ( = ?auto_165794 ?auto_165796 ) ) ( not ( = ?auto_165794 ?auto_165797 ) ) ( not ( = ?auto_165794 ?auto_165798 ) ) ( not ( = ?auto_165794 ?auto_165799 ) ) ( not ( = ?auto_165794 ?auto_165800 ) ) ( not ( = ?auto_165794 ?auto_165801 ) ) ( not ( = ?auto_165795 ?auto_165796 ) ) ( not ( = ?auto_165795 ?auto_165797 ) ) ( not ( = ?auto_165795 ?auto_165798 ) ) ( not ( = ?auto_165795 ?auto_165799 ) ) ( not ( = ?auto_165795 ?auto_165800 ) ) ( not ( = ?auto_165795 ?auto_165801 ) ) ( not ( = ?auto_165796 ?auto_165797 ) ) ( not ( = ?auto_165796 ?auto_165798 ) ) ( not ( = ?auto_165796 ?auto_165799 ) ) ( not ( = ?auto_165796 ?auto_165800 ) ) ( not ( = ?auto_165796 ?auto_165801 ) ) ( not ( = ?auto_165797 ?auto_165798 ) ) ( not ( = ?auto_165797 ?auto_165799 ) ) ( not ( = ?auto_165797 ?auto_165800 ) ) ( not ( = ?auto_165797 ?auto_165801 ) ) ( not ( = ?auto_165798 ?auto_165799 ) ) ( not ( = ?auto_165798 ?auto_165800 ) ) ( not ( = ?auto_165798 ?auto_165801 ) ) ( not ( = ?auto_165799 ?auto_165800 ) ) ( not ( = ?auto_165799 ?auto_165801 ) ) ( not ( = ?auto_165800 ?auto_165801 ) ) ( ON ?auto_165799 ?auto_165800 ) ( ON ?auto_165798 ?auto_165799 ) ( ON ?auto_165797 ?auto_165798 ) ( CLEAR ?auto_165795 ) ( ON ?auto_165796 ?auto_165797 ) ( CLEAR ?auto_165796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165790 ?auto_165791 ?auto_165792 ?auto_165793 ?auto_165794 ?auto_165795 ?auto_165796 )
      ( MAKE-11PILE ?auto_165790 ?auto_165791 ?auto_165792 ?auto_165793 ?auto_165794 ?auto_165795 ?auto_165796 ?auto_165797 ?auto_165798 ?auto_165799 ?auto_165800 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_165836 - BLOCK
      ?auto_165837 - BLOCK
      ?auto_165838 - BLOCK
      ?auto_165839 - BLOCK
      ?auto_165840 - BLOCK
      ?auto_165841 - BLOCK
      ?auto_165842 - BLOCK
      ?auto_165843 - BLOCK
      ?auto_165844 - BLOCK
      ?auto_165845 - BLOCK
      ?auto_165846 - BLOCK
    )
    :vars
    (
      ?auto_165847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165846 ?auto_165847 ) ( ON-TABLE ?auto_165836 ) ( ON ?auto_165837 ?auto_165836 ) ( ON ?auto_165838 ?auto_165837 ) ( ON ?auto_165839 ?auto_165838 ) ( ON ?auto_165840 ?auto_165839 ) ( not ( = ?auto_165836 ?auto_165837 ) ) ( not ( = ?auto_165836 ?auto_165838 ) ) ( not ( = ?auto_165836 ?auto_165839 ) ) ( not ( = ?auto_165836 ?auto_165840 ) ) ( not ( = ?auto_165836 ?auto_165841 ) ) ( not ( = ?auto_165836 ?auto_165842 ) ) ( not ( = ?auto_165836 ?auto_165843 ) ) ( not ( = ?auto_165836 ?auto_165844 ) ) ( not ( = ?auto_165836 ?auto_165845 ) ) ( not ( = ?auto_165836 ?auto_165846 ) ) ( not ( = ?auto_165836 ?auto_165847 ) ) ( not ( = ?auto_165837 ?auto_165838 ) ) ( not ( = ?auto_165837 ?auto_165839 ) ) ( not ( = ?auto_165837 ?auto_165840 ) ) ( not ( = ?auto_165837 ?auto_165841 ) ) ( not ( = ?auto_165837 ?auto_165842 ) ) ( not ( = ?auto_165837 ?auto_165843 ) ) ( not ( = ?auto_165837 ?auto_165844 ) ) ( not ( = ?auto_165837 ?auto_165845 ) ) ( not ( = ?auto_165837 ?auto_165846 ) ) ( not ( = ?auto_165837 ?auto_165847 ) ) ( not ( = ?auto_165838 ?auto_165839 ) ) ( not ( = ?auto_165838 ?auto_165840 ) ) ( not ( = ?auto_165838 ?auto_165841 ) ) ( not ( = ?auto_165838 ?auto_165842 ) ) ( not ( = ?auto_165838 ?auto_165843 ) ) ( not ( = ?auto_165838 ?auto_165844 ) ) ( not ( = ?auto_165838 ?auto_165845 ) ) ( not ( = ?auto_165838 ?auto_165846 ) ) ( not ( = ?auto_165838 ?auto_165847 ) ) ( not ( = ?auto_165839 ?auto_165840 ) ) ( not ( = ?auto_165839 ?auto_165841 ) ) ( not ( = ?auto_165839 ?auto_165842 ) ) ( not ( = ?auto_165839 ?auto_165843 ) ) ( not ( = ?auto_165839 ?auto_165844 ) ) ( not ( = ?auto_165839 ?auto_165845 ) ) ( not ( = ?auto_165839 ?auto_165846 ) ) ( not ( = ?auto_165839 ?auto_165847 ) ) ( not ( = ?auto_165840 ?auto_165841 ) ) ( not ( = ?auto_165840 ?auto_165842 ) ) ( not ( = ?auto_165840 ?auto_165843 ) ) ( not ( = ?auto_165840 ?auto_165844 ) ) ( not ( = ?auto_165840 ?auto_165845 ) ) ( not ( = ?auto_165840 ?auto_165846 ) ) ( not ( = ?auto_165840 ?auto_165847 ) ) ( not ( = ?auto_165841 ?auto_165842 ) ) ( not ( = ?auto_165841 ?auto_165843 ) ) ( not ( = ?auto_165841 ?auto_165844 ) ) ( not ( = ?auto_165841 ?auto_165845 ) ) ( not ( = ?auto_165841 ?auto_165846 ) ) ( not ( = ?auto_165841 ?auto_165847 ) ) ( not ( = ?auto_165842 ?auto_165843 ) ) ( not ( = ?auto_165842 ?auto_165844 ) ) ( not ( = ?auto_165842 ?auto_165845 ) ) ( not ( = ?auto_165842 ?auto_165846 ) ) ( not ( = ?auto_165842 ?auto_165847 ) ) ( not ( = ?auto_165843 ?auto_165844 ) ) ( not ( = ?auto_165843 ?auto_165845 ) ) ( not ( = ?auto_165843 ?auto_165846 ) ) ( not ( = ?auto_165843 ?auto_165847 ) ) ( not ( = ?auto_165844 ?auto_165845 ) ) ( not ( = ?auto_165844 ?auto_165846 ) ) ( not ( = ?auto_165844 ?auto_165847 ) ) ( not ( = ?auto_165845 ?auto_165846 ) ) ( not ( = ?auto_165845 ?auto_165847 ) ) ( not ( = ?auto_165846 ?auto_165847 ) ) ( ON ?auto_165845 ?auto_165846 ) ( ON ?auto_165844 ?auto_165845 ) ( ON ?auto_165843 ?auto_165844 ) ( ON ?auto_165842 ?auto_165843 ) ( CLEAR ?auto_165840 ) ( ON ?auto_165841 ?auto_165842 ) ( CLEAR ?auto_165841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165836 ?auto_165837 ?auto_165838 ?auto_165839 ?auto_165840 ?auto_165841 )
      ( MAKE-11PILE ?auto_165836 ?auto_165837 ?auto_165838 ?auto_165839 ?auto_165840 ?auto_165841 ?auto_165842 ?auto_165843 ?auto_165844 ?auto_165845 ?auto_165846 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_165882 - BLOCK
      ?auto_165883 - BLOCK
      ?auto_165884 - BLOCK
      ?auto_165885 - BLOCK
      ?auto_165886 - BLOCK
      ?auto_165887 - BLOCK
      ?auto_165888 - BLOCK
      ?auto_165889 - BLOCK
      ?auto_165890 - BLOCK
      ?auto_165891 - BLOCK
      ?auto_165892 - BLOCK
    )
    :vars
    (
      ?auto_165893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165892 ?auto_165893 ) ( ON-TABLE ?auto_165882 ) ( ON ?auto_165883 ?auto_165882 ) ( ON ?auto_165884 ?auto_165883 ) ( ON ?auto_165885 ?auto_165884 ) ( not ( = ?auto_165882 ?auto_165883 ) ) ( not ( = ?auto_165882 ?auto_165884 ) ) ( not ( = ?auto_165882 ?auto_165885 ) ) ( not ( = ?auto_165882 ?auto_165886 ) ) ( not ( = ?auto_165882 ?auto_165887 ) ) ( not ( = ?auto_165882 ?auto_165888 ) ) ( not ( = ?auto_165882 ?auto_165889 ) ) ( not ( = ?auto_165882 ?auto_165890 ) ) ( not ( = ?auto_165882 ?auto_165891 ) ) ( not ( = ?auto_165882 ?auto_165892 ) ) ( not ( = ?auto_165882 ?auto_165893 ) ) ( not ( = ?auto_165883 ?auto_165884 ) ) ( not ( = ?auto_165883 ?auto_165885 ) ) ( not ( = ?auto_165883 ?auto_165886 ) ) ( not ( = ?auto_165883 ?auto_165887 ) ) ( not ( = ?auto_165883 ?auto_165888 ) ) ( not ( = ?auto_165883 ?auto_165889 ) ) ( not ( = ?auto_165883 ?auto_165890 ) ) ( not ( = ?auto_165883 ?auto_165891 ) ) ( not ( = ?auto_165883 ?auto_165892 ) ) ( not ( = ?auto_165883 ?auto_165893 ) ) ( not ( = ?auto_165884 ?auto_165885 ) ) ( not ( = ?auto_165884 ?auto_165886 ) ) ( not ( = ?auto_165884 ?auto_165887 ) ) ( not ( = ?auto_165884 ?auto_165888 ) ) ( not ( = ?auto_165884 ?auto_165889 ) ) ( not ( = ?auto_165884 ?auto_165890 ) ) ( not ( = ?auto_165884 ?auto_165891 ) ) ( not ( = ?auto_165884 ?auto_165892 ) ) ( not ( = ?auto_165884 ?auto_165893 ) ) ( not ( = ?auto_165885 ?auto_165886 ) ) ( not ( = ?auto_165885 ?auto_165887 ) ) ( not ( = ?auto_165885 ?auto_165888 ) ) ( not ( = ?auto_165885 ?auto_165889 ) ) ( not ( = ?auto_165885 ?auto_165890 ) ) ( not ( = ?auto_165885 ?auto_165891 ) ) ( not ( = ?auto_165885 ?auto_165892 ) ) ( not ( = ?auto_165885 ?auto_165893 ) ) ( not ( = ?auto_165886 ?auto_165887 ) ) ( not ( = ?auto_165886 ?auto_165888 ) ) ( not ( = ?auto_165886 ?auto_165889 ) ) ( not ( = ?auto_165886 ?auto_165890 ) ) ( not ( = ?auto_165886 ?auto_165891 ) ) ( not ( = ?auto_165886 ?auto_165892 ) ) ( not ( = ?auto_165886 ?auto_165893 ) ) ( not ( = ?auto_165887 ?auto_165888 ) ) ( not ( = ?auto_165887 ?auto_165889 ) ) ( not ( = ?auto_165887 ?auto_165890 ) ) ( not ( = ?auto_165887 ?auto_165891 ) ) ( not ( = ?auto_165887 ?auto_165892 ) ) ( not ( = ?auto_165887 ?auto_165893 ) ) ( not ( = ?auto_165888 ?auto_165889 ) ) ( not ( = ?auto_165888 ?auto_165890 ) ) ( not ( = ?auto_165888 ?auto_165891 ) ) ( not ( = ?auto_165888 ?auto_165892 ) ) ( not ( = ?auto_165888 ?auto_165893 ) ) ( not ( = ?auto_165889 ?auto_165890 ) ) ( not ( = ?auto_165889 ?auto_165891 ) ) ( not ( = ?auto_165889 ?auto_165892 ) ) ( not ( = ?auto_165889 ?auto_165893 ) ) ( not ( = ?auto_165890 ?auto_165891 ) ) ( not ( = ?auto_165890 ?auto_165892 ) ) ( not ( = ?auto_165890 ?auto_165893 ) ) ( not ( = ?auto_165891 ?auto_165892 ) ) ( not ( = ?auto_165891 ?auto_165893 ) ) ( not ( = ?auto_165892 ?auto_165893 ) ) ( ON ?auto_165891 ?auto_165892 ) ( ON ?auto_165890 ?auto_165891 ) ( ON ?auto_165889 ?auto_165890 ) ( ON ?auto_165888 ?auto_165889 ) ( ON ?auto_165887 ?auto_165888 ) ( CLEAR ?auto_165885 ) ( ON ?auto_165886 ?auto_165887 ) ( CLEAR ?auto_165886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165882 ?auto_165883 ?auto_165884 ?auto_165885 ?auto_165886 )
      ( MAKE-11PILE ?auto_165882 ?auto_165883 ?auto_165884 ?auto_165885 ?auto_165886 ?auto_165887 ?auto_165888 ?auto_165889 ?auto_165890 ?auto_165891 ?auto_165892 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_165928 - BLOCK
      ?auto_165929 - BLOCK
      ?auto_165930 - BLOCK
      ?auto_165931 - BLOCK
      ?auto_165932 - BLOCK
      ?auto_165933 - BLOCK
      ?auto_165934 - BLOCK
      ?auto_165935 - BLOCK
      ?auto_165936 - BLOCK
      ?auto_165937 - BLOCK
      ?auto_165938 - BLOCK
    )
    :vars
    (
      ?auto_165939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165938 ?auto_165939 ) ( ON-TABLE ?auto_165928 ) ( ON ?auto_165929 ?auto_165928 ) ( ON ?auto_165930 ?auto_165929 ) ( not ( = ?auto_165928 ?auto_165929 ) ) ( not ( = ?auto_165928 ?auto_165930 ) ) ( not ( = ?auto_165928 ?auto_165931 ) ) ( not ( = ?auto_165928 ?auto_165932 ) ) ( not ( = ?auto_165928 ?auto_165933 ) ) ( not ( = ?auto_165928 ?auto_165934 ) ) ( not ( = ?auto_165928 ?auto_165935 ) ) ( not ( = ?auto_165928 ?auto_165936 ) ) ( not ( = ?auto_165928 ?auto_165937 ) ) ( not ( = ?auto_165928 ?auto_165938 ) ) ( not ( = ?auto_165928 ?auto_165939 ) ) ( not ( = ?auto_165929 ?auto_165930 ) ) ( not ( = ?auto_165929 ?auto_165931 ) ) ( not ( = ?auto_165929 ?auto_165932 ) ) ( not ( = ?auto_165929 ?auto_165933 ) ) ( not ( = ?auto_165929 ?auto_165934 ) ) ( not ( = ?auto_165929 ?auto_165935 ) ) ( not ( = ?auto_165929 ?auto_165936 ) ) ( not ( = ?auto_165929 ?auto_165937 ) ) ( not ( = ?auto_165929 ?auto_165938 ) ) ( not ( = ?auto_165929 ?auto_165939 ) ) ( not ( = ?auto_165930 ?auto_165931 ) ) ( not ( = ?auto_165930 ?auto_165932 ) ) ( not ( = ?auto_165930 ?auto_165933 ) ) ( not ( = ?auto_165930 ?auto_165934 ) ) ( not ( = ?auto_165930 ?auto_165935 ) ) ( not ( = ?auto_165930 ?auto_165936 ) ) ( not ( = ?auto_165930 ?auto_165937 ) ) ( not ( = ?auto_165930 ?auto_165938 ) ) ( not ( = ?auto_165930 ?auto_165939 ) ) ( not ( = ?auto_165931 ?auto_165932 ) ) ( not ( = ?auto_165931 ?auto_165933 ) ) ( not ( = ?auto_165931 ?auto_165934 ) ) ( not ( = ?auto_165931 ?auto_165935 ) ) ( not ( = ?auto_165931 ?auto_165936 ) ) ( not ( = ?auto_165931 ?auto_165937 ) ) ( not ( = ?auto_165931 ?auto_165938 ) ) ( not ( = ?auto_165931 ?auto_165939 ) ) ( not ( = ?auto_165932 ?auto_165933 ) ) ( not ( = ?auto_165932 ?auto_165934 ) ) ( not ( = ?auto_165932 ?auto_165935 ) ) ( not ( = ?auto_165932 ?auto_165936 ) ) ( not ( = ?auto_165932 ?auto_165937 ) ) ( not ( = ?auto_165932 ?auto_165938 ) ) ( not ( = ?auto_165932 ?auto_165939 ) ) ( not ( = ?auto_165933 ?auto_165934 ) ) ( not ( = ?auto_165933 ?auto_165935 ) ) ( not ( = ?auto_165933 ?auto_165936 ) ) ( not ( = ?auto_165933 ?auto_165937 ) ) ( not ( = ?auto_165933 ?auto_165938 ) ) ( not ( = ?auto_165933 ?auto_165939 ) ) ( not ( = ?auto_165934 ?auto_165935 ) ) ( not ( = ?auto_165934 ?auto_165936 ) ) ( not ( = ?auto_165934 ?auto_165937 ) ) ( not ( = ?auto_165934 ?auto_165938 ) ) ( not ( = ?auto_165934 ?auto_165939 ) ) ( not ( = ?auto_165935 ?auto_165936 ) ) ( not ( = ?auto_165935 ?auto_165937 ) ) ( not ( = ?auto_165935 ?auto_165938 ) ) ( not ( = ?auto_165935 ?auto_165939 ) ) ( not ( = ?auto_165936 ?auto_165937 ) ) ( not ( = ?auto_165936 ?auto_165938 ) ) ( not ( = ?auto_165936 ?auto_165939 ) ) ( not ( = ?auto_165937 ?auto_165938 ) ) ( not ( = ?auto_165937 ?auto_165939 ) ) ( not ( = ?auto_165938 ?auto_165939 ) ) ( ON ?auto_165937 ?auto_165938 ) ( ON ?auto_165936 ?auto_165937 ) ( ON ?auto_165935 ?auto_165936 ) ( ON ?auto_165934 ?auto_165935 ) ( ON ?auto_165933 ?auto_165934 ) ( ON ?auto_165932 ?auto_165933 ) ( CLEAR ?auto_165930 ) ( ON ?auto_165931 ?auto_165932 ) ( CLEAR ?auto_165931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165928 ?auto_165929 ?auto_165930 ?auto_165931 )
      ( MAKE-11PILE ?auto_165928 ?auto_165929 ?auto_165930 ?auto_165931 ?auto_165932 ?auto_165933 ?auto_165934 ?auto_165935 ?auto_165936 ?auto_165937 ?auto_165938 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_165974 - BLOCK
      ?auto_165975 - BLOCK
      ?auto_165976 - BLOCK
      ?auto_165977 - BLOCK
      ?auto_165978 - BLOCK
      ?auto_165979 - BLOCK
      ?auto_165980 - BLOCK
      ?auto_165981 - BLOCK
      ?auto_165982 - BLOCK
      ?auto_165983 - BLOCK
      ?auto_165984 - BLOCK
    )
    :vars
    (
      ?auto_165985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165984 ?auto_165985 ) ( ON-TABLE ?auto_165974 ) ( ON ?auto_165975 ?auto_165974 ) ( not ( = ?auto_165974 ?auto_165975 ) ) ( not ( = ?auto_165974 ?auto_165976 ) ) ( not ( = ?auto_165974 ?auto_165977 ) ) ( not ( = ?auto_165974 ?auto_165978 ) ) ( not ( = ?auto_165974 ?auto_165979 ) ) ( not ( = ?auto_165974 ?auto_165980 ) ) ( not ( = ?auto_165974 ?auto_165981 ) ) ( not ( = ?auto_165974 ?auto_165982 ) ) ( not ( = ?auto_165974 ?auto_165983 ) ) ( not ( = ?auto_165974 ?auto_165984 ) ) ( not ( = ?auto_165974 ?auto_165985 ) ) ( not ( = ?auto_165975 ?auto_165976 ) ) ( not ( = ?auto_165975 ?auto_165977 ) ) ( not ( = ?auto_165975 ?auto_165978 ) ) ( not ( = ?auto_165975 ?auto_165979 ) ) ( not ( = ?auto_165975 ?auto_165980 ) ) ( not ( = ?auto_165975 ?auto_165981 ) ) ( not ( = ?auto_165975 ?auto_165982 ) ) ( not ( = ?auto_165975 ?auto_165983 ) ) ( not ( = ?auto_165975 ?auto_165984 ) ) ( not ( = ?auto_165975 ?auto_165985 ) ) ( not ( = ?auto_165976 ?auto_165977 ) ) ( not ( = ?auto_165976 ?auto_165978 ) ) ( not ( = ?auto_165976 ?auto_165979 ) ) ( not ( = ?auto_165976 ?auto_165980 ) ) ( not ( = ?auto_165976 ?auto_165981 ) ) ( not ( = ?auto_165976 ?auto_165982 ) ) ( not ( = ?auto_165976 ?auto_165983 ) ) ( not ( = ?auto_165976 ?auto_165984 ) ) ( not ( = ?auto_165976 ?auto_165985 ) ) ( not ( = ?auto_165977 ?auto_165978 ) ) ( not ( = ?auto_165977 ?auto_165979 ) ) ( not ( = ?auto_165977 ?auto_165980 ) ) ( not ( = ?auto_165977 ?auto_165981 ) ) ( not ( = ?auto_165977 ?auto_165982 ) ) ( not ( = ?auto_165977 ?auto_165983 ) ) ( not ( = ?auto_165977 ?auto_165984 ) ) ( not ( = ?auto_165977 ?auto_165985 ) ) ( not ( = ?auto_165978 ?auto_165979 ) ) ( not ( = ?auto_165978 ?auto_165980 ) ) ( not ( = ?auto_165978 ?auto_165981 ) ) ( not ( = ?auto_165978 ?auto_165982 ) ) ( not ( = ?auto_165978 ?auto_165983 ) ) ( not ( = ?auto_165978 ?auto_165984 ) ) ( not ( = ?auto_165978 ?auto_165985 ) ) ( not ( = ?auto_165979 ?auto_165980 ) ) ( not ( = ?auto_165979 ?auto_165981 ) ) ( not ( = ?auto_165979 ?auto_165982 ) ) ( not ( = ?auto_165979 ?auto_165983 ) ) ( not ( = ?auto_165979 ?auto_165984 ) ) ( not ( = ?auto_165979 ?auto_165985 ) ) ( not ( = ?auto_165980 ?auto_165981 ) ) ( not ( = ?auto_165980 ?auto_165982 ) ) ( not ( = ?auto_165980 ?auto_165983 ) ) ( not ( = ?auto_165980 ?auto_165984 ) ) ( not ( = ?auto_165980 ?auto_165985 ) ) ( not ( = ?auto_165981 ?auto_165982 ) ) ( not ( = ?auto_165981 ?auto_165983 ) ) ( not ( = ?auto_165981 ?auto_165984 ) ) ( not ( = ?auto_165981 ?auto_165985 ) ) ( not ( = ?auto_165982 ?auto_165983 ) ) ( not ( = ?auto_165982 ?auto_165984 ) ) ( not ( = ?auto_165982 ?auto_165985 ) ) ( not ( = ?auto_165983 ?auto_165984 ) ) ( not ( = ?auto_165983 ?auto_165985 ) ) ( not ( = ?auto_165984 ?auto_165985 ) ) ( ON ?auto_165983 ?auto_165984 ) ( ON ?auto_165982 ?auto_165983 ) ( ON ?auto_165981 ?auto_165982 ) ( ON ?auto_165980 ?auto_165981 ) ( ON ?auto_165979 ?auto_165980 ) ( ON ?auto_165978 ?auto_165979 ) ( ON ?auto_165977 ?auto_165978 ) ( CLEAR ?auto_165975 ) ( ON ?auto_165976 ?auto_165977 ) ( CLEAR ?auto_165976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165974 ?auto_165975 ?auto_165976 )
      ( MAKE-11PILE ?auto_165974 ?auto_165975 ?auto_165976 ?auto_165977 ?auto_165978 ?auto_165979 ?auto_165980 ?auto_165981 ?auto_165982 ?auto_165983 ?auto_165984 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_166020 - BLOCK
      ?auto_166021 - BLOCK
      ?auto_166022 - BLOCK
      ?auto_166023 - BLOCK
      ?auto_166024 - BLOCK
      ?auto_166025 - BLOCK
      ?auto_166026 - BLOCK
      ?auto_166027 - BLOCK
      ?auto_166028 - BLOCK
      ?auto_166029 - BLOCK
      ?auto_166030 - BLOCK
    )
    :vars
    (
      ?auto_166031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166030 ?auto_166031 ) ( ON-TABLE ?auto_166020 ) ( not ( = ?auto_166020 ?auto_166021 ) ) ( not ( = ?auto_166020 ?auto_166022 ) ) ( not ( = ?auto_166020 ?auto_166023 ) ) ( not ( = ?auto_166020 ?auto_166024 ) ) ( not ( = ?auto_166020 ?auto_166025 ) ) ( not ( = ?auto_166020 ?auto_166026 ) ) ( not ( = ?auto_166020 ?auto_166027 ) ) ( not ( = ?auto_166020 ?auto_166028 ) ) ( not ( = ?auto_166020 ?auto_166029 ) ) ( not ( = ?auto_166020 ?auto_166030 ) ) ( not ( = ?auto_166020 ?auto_166031 ) ) ( not ( = ?auto_166021 ?auto_166022 ) ) ( not ( = ?auto_166021 ?auto_166023 ) ) ( not ( = ?auto_166021 ?auto_166024 ) ) ( not ( = ?auto_166021 ?auto_166025 ) ) ( not ( = ?auto_166021 ?auto_166026 ) ) ( not ( = ?auto_166021 ?auto_166027 ) ) ( not ( = ?auto_166021 ?auto_166028 ) ) ( not ( = ?auto_166021 ?auto_166029 ) ) ( not ( = ?auto_166021 ?auto_166030 ) ) ( not ( = ?auto_166021 ?auto_166031 ) ) ( not ( = ?auto_166022 ?auto_166023 ) ) ( not ( = ?auto_166022 ?auto_166024 ) ) ( not ( = ?auto_166022 ?auto_166025 ) ) ( not ( = ?auto_166022 ?auto_166026 ) ) ( not ( = ?auto_166022 ?auto_166027 ) ) ( not ( = ?auto_166022 ?auto_166028 ) ) ( not ( = ?auto_166022 ?auto_166029 ) ) ( not ( = ?auto_166022 ?auto_166030 ) ) ( not ( = ?auto_166022 ?auto_166031 ) ) ( not ( = ?auto_166023 ?auto_166024 ) ) ( not ( = ?auto_166023 ?auto_166025 ) ) ( not ( = ?auto_166023 ?auto_166026 ) ) ( not ( = ?auto_166023 ?auto_166027 ) ) ( not ( = ?auto_166023 ?auto_166028 ) ) ( not ( = ?auto_166023 ?auto_166029 ) ) ( not ( = ?auto_166023 ?auto_166030 ) ) ( not ( = ?auto_166023 ?auto_166031 ) ) ( not ( = ?auto_166024 ?auto_166025 ) ) ( not ( = ?auto_166024 ?auto_166026 ) ) ( not ( = ?auto_166024 ?auto_166027 ) ) ( not ( = ?auto_166024 ?auto_166028 ) ) ( not ( = ?auto_166024 ?auto_166029 ) ) ( not ( = ?auto_166024 ?auto_166030 ) ) ( not ( = ?auto_166024 ?auto_166031 ) ) ( not ( = ?auto_166025 ?auto_166026 ) ) ( not ( = ?auto_166025 ?auto_166027 ) ) ( not ( = ?auto_166025 ?auto_166028 ) ) ( not ( = ?auto_166025 ?auto_166029 ) ) ( not ( = ?auto_166025 ?auto_166030 ) ) ( not ( = ?auto_166025 ?auto_166031 ) ) ( not ( = ?auto_166026 ?auto_166027 ) ) ( not ( = ?auto_166026 ?auto_166028 ) ) ( not ( = ?auto_166026 ?auto_166029 ) ) ( not ( = ?auto_166026 ?auto_166030 ) ) ( not ( = ?auto_166026 ?auto_166031 ) ) ( not ( = ?auto_166027 ?auto_166028 ) ) ( not ( = ?auto_166027 ?auto_166029 ) ) ( not ( = ?auto_166027 ?auto_166030 ) ) ( not ( = ?auto_166027 ?auto_166031 ) ) ( not ( = ?auto_166028 ?auto_166029 ) ) ( not ( = ?auto_166028 ?auto_166030 ) ) ( not ( = ?auto_166028 ?auto_166031 ) ) ( not ( = ?auto_166029 ?auto_166030 ) ) ( not ( = ?auto_166029 ?auto_166031 ) ) ( not ( = ?auto_166030 ?auto_166031 ) ) ( ON ?auto_166029 ?auto_166030 ) ( ON ?auto_166028 ?auto_166029 ) ( ON ?auto_166027 ?auto_166028 ) ( ON ?auto_166026 ?auto_166027 ) ( ON ?auto_166025 ?auto_166026 ) ( ON ?auto_166024 ?auto_166025 ) ( ON ?auto_166023 ?auto_166024 ) ( ON ?auto_166022 ?auto_166023 ) ( CLEAR ?auto_166020 ) ( ON ?auto_166021 ?auto_166022 ) ( CLEAR ?auto_166021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166020 ?auto_166021 )
      ( MAKE-11PILE ?auto_166020 ?auto_166021 ?auto_166022 ?auto_166023 ?auto_166024 ?auto_166025 ?auto_166026 ?auto_166027 ?auto_166028 ?auto_166029 ?auto_166030 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_166066 - BLOCK
      ?auto_166067 - BLOCK
      ?auto_166068 - BLOCK
      ?auto_166069 - BLOCK
      ?auto_166070 - BLOCK
      ?auto_166071 - BLOCK
      ?auto_166072 - BLOCK
      ?auto_166073 - BLOCK
      ?auto_166074 - BLOCK
      ?auto_166075 - BLOCK
      ?auto_166076 - BLOCK
    )
    :vars
    (
      ?auto_166077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166076 ?auto_166077 ) ( not ( = ?auto_166066 ?auto_166067 ) ) ( not ( = ?auto_166066 ?auto_166068 ) ) ( not ( = ?auto_166066 ?auto_166069 ) ) ( not ( = ?auto_166066 ?auto_166070 ) ) ( not ( = ?auto_166066 ?auto_166071 ) ) ( not ( = ?auto_166066 ?auto_166072 ) ) ( not ( = ?auto_166066 ?auto_166073 ) ) ( not ( = ?auto_166066 ?auto_166074 ) ) ( not ( = ?auto_166066 ?auto_166075 ) ) ( not ( = ?auto_166066 ?auto_166076 ) ) ( not ( = ?auto_166066 ?auto_166077 ) ) ( not ( = ?auto_166067 ?auto_166068 ) ) ( not ( = ?auto_166067 ?auto_166069 ) ) ( not ( = ?auto_166067 ?auto_166070 ) ) ( not ( = ?auto_166067 ?auto_166071 ) ) ( not ( = ?auto_166067 ?auto_166072 ) ) ( not ( = ?auto_166067 ?auto_166073 ) ) ( not ( = ?auto_166067 ?auto_166074 ) ) ( not ( = ?auto_166067 ?auto_166075 ) ) ( not ( = ?auto_166067 ?auto_166076 ) ) ( not ( = ?auto_166067 ?auto_166077 ) ) ( not ( = ?auto_166068 ?auto_166069 ) ) ( not ( = ?auto_166068 ?auto_166070 ) ) ( not ( = ?auto_166068 ?auto_166071 ) ) ( not ( = ?auto_166068 ?auto_166072 ) ) ( not ( = ?auto_166068 ?auto_166073 ) ) ( not ( = ?auto_166068 ?auto_166074 ) ) ( not ( = ?auto_166068 ?auto_166075 ) ) ( not ( = ?auto_166068 ?auto_166076 ) ) ( not ( = ?auto_166068 ?auto_166077 ) ) ( not ( = ?auto_166069 ?auto_166070 ) ) ( not ( = ?auto_166069 ?auto_166071 ) ) ( not ( = ?auto_166069 ?auto_166072 ) ) ( not ( = ?auto_166069 ?auto_166073 ) ) ( not ( = ?auto_166069 ?auto_166074 ) ) ( not ( = ?auto_166069 ?auto_166075 ) ) ( not ( = ?auto_166069 ?auto_166076 ) ) ( not ( = ?auto_166069 ?auto_166077 ) ) ( not ( = ?auto_166070 ?auto_166071 ) ) ( not ( = ?auto_166070 ?auto_166072 ) ) ( not ( = ?auto_166070 ?auto_166073 ) ) ( not ( = ?auto_166070 ?auto_166074 ) ) ( not ( = ?auto_166070 ?auto_166075 ) ) ( not ( = ?auto_166070 ?auto_166076 ) ) ( not ( = ?auto_166070 ?auto_166077 ) ) ( not ( = ?auto_166071 ?auto_166072 ) ) ( not ( = ?auto_166071 ?auto_166073 ) ) ( not ( = ?auto_166071 ?auto_166074 ) ) ( not ( = ?auto_166071 ?auto_166075 ) ) ( not ( = ?auto_166071 ?auto_166076 ) ) ( not ( = ?auto_166071 ?auto_166077 ) ) ( not ( = ?auto_166072 ?auto_166073 ) ) ( not ( = ?auto_166072 ?auto_166074 ) ) ( not ( = ?auto_166072 ?auto_166075 ) ) ( not ( = ?auto_166072 ?auto_166076 ) ) ( not ( = ?auto_166072 ?auto_166077 ) ) ( not ( = ?auto_166073 ?auto_166074 ) ) ( not ( = ?auto_166073 ?auto_166075 ) ) ( not ( = ?auto_166073 ?auto_166076 ) ) ( not ( = ?auto_166073 ?auto_166077 ) ) ( not ( = ?auto_166074 ?auto_166075 ) ) ( not ( = ?auto_166074 ?auto_166076 ) ) ( not ( = ?auto_166074 ?auto_166077 ) ) ( not ( = ?auto_166075 ?auto_166076 ) ) ( not ( = ?auto_166075 ?auto_166077 ) ) ( not ( = ?auto_166076 ?auto_166077 ) ) ( ON ?auto_166075 ?auto_166076 ) ( ON ?auto_166074 ?auto_166075 ) ( ON ?auto_166073 ?auto_166074 ) ( ON ?auto_166072 ?auto_166073 ) ( ON ?auto_166071 ?auto_166072 ) ( ON ?auto_166070 ?auto_166071 ) ( ON ?auto_166069 ?auto_166070 ) ( ON ?auto_166068 ?auto_166069 ) ( ON ?auto_166067 ?auto_166068 ) ( ON ?auto_166066 ?auto_166067 ) ( CLEAR ?auto_166066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166066 )
      ( MAKE-11PILE ?auto_166066 ?auto_166067 ?auto_166068 ?auto_166069 ?auto_166070 ?auto_166071 ?auto_166072 ?auto_166073 ?auto_166074 ?auto_166075 ?auto_166076 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166113 - BLOCK
      ?auto_166114 - BLOCK
      ?auto_166115 - BLOCK
      ?auto_166116 - BLOCK
      ?auto_166117 - BLOCK
      ?auto_166118 - BLOCK
      ?auto_166119 - BLOCK
      ?auto_166120 - BLOCK
      ?auto_166121 - BLOCK
      ?auto_166122 - BLOCK
      ?auto_166123 - BLOCK
      ?auto_166124 - BLOCK
    )
    :vars
    (
      ?auto_166125 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166123 ) ( ON ?auto_166124 ?auto_166125 ) ( CLEAR ?auto_166124 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166113 ) ( ON ?auto_166114 ?auto_166113 ) ( ON ?auto_166115 ?auto_166114 ) ( ON ?auto_166116 ?auto_166115 ) ( ON ?auto_166117 ?auto_166116 ) ( ON ?auto_166118 ?auto_166117 ) ( ON ?auto_166119 ?auto_166118 ) ( ON ?auto_166120 ?auto_166119 ) ( ON ?auto_166121 ?auto_166120 ) ( ON ?auto_166122 ?auto_166121 ) ( ON ?auto_166123 ?auto_166122 ) ( not ( = ?auto_166113 ?auto_166114 ) ) ( not ( = ?auto_166113 ?auto_166115 ) ) ( not ( = ?auto_166113 ?auto_166116 ) ) ( not ( = ?auto_166113 ?auto_166117 ) ) ( not ( = ?auto_166113 ?auto_166118 ) ) ( not ( = ?auto_166113 ?auto_166119 ) ) ( not ( = ?auto_166113 ?auto_166120 ) ) ( not ( = ?auto_166113 ?auto_166121 ) ) ( not ( = ?auto_166113 ?auto_166122 ) ) ( not ( = ?auto_166113 ?auto_166123 ) ) ( not ( = ?auto_166113 ?auto_166124 ) ) ( not ( = ?auto_166113 ?auto_166125 ) ) ( not ( = ?auto_166114 ?auto_166115 ) ) ( not ( = ?auto_166114 ?auto_166116 ) ) ( not ( = ?auto_166114 ?auto_166117 ) ) ( not ( = ?auto_166114 ?auto_166118 ) ) ( not ( = ?auto_166114 ?auto_166119 ) ) ( not ( = ?auto_166114 ?auto_166120 ) ) ( not ( = ?auto_166114 ?auto_166121 ) ) ( not ( = ?auto_166114 ?auto_166122 ) ) ( not ( = ?auto_166114 ?auto_166123 ) ) ( not ( = ?auto_166114 ?auto_166124 ) ) ( not ( = ?auto_166114 ?auto_166125 ) ) ( not ( = ?auto_166115 ?auto_166116 ) ) ( not ( = ?auto_166115 ?auto_166117 ) ) ( not ( = ?auto_166115 ?auto_166118 ) ) ( not ( = ?auto_166115 ?auto_166119 ) ) ( not ( = ?auto_166115 ?auto_166120 ) ) ( not ( = ?auto_166115 ?auto_166121 ) ) ( not ( = ?auto_166115 ?auto_166122 ) ) ( not ( = ?auto_166115 ?auto_166123 ) ) ( not ( = ?auto_166115 ?auto_166124 ) ) ( not ( = ?auto_166115 ?auto_166125 ) ) ( not ( = ?auto_166116 ?auto_166117 ) ) ( not ( = ?auto_166116 ?auto_166118 ) ) ( not ( = ?auto_166116 ?auto_166119 ) ) ( not ( = ?auto_166116 ?auto_166120 ) ) ( not ( = ?auto_166116 ?auto_166121 ) ) ( not ( = ?auto_166116 ?auto_166122 ) ) ( not ( = ?auto_166116 ?auto_166123 ) ) ( not ( = ?auto_166116 ?auto_166124 ) ) ( not ( = ?auto_166116 ?auto_166125 ) ) ( not ( = ?auto_166117 ?auto_166118 ) ) ( not ( = ?auto_166117 ?auto_166119 ) ) ( not ( = ?auto_166117 ?auto_166120 ) ) ( not ( = ?auto_166117 ?auto_166121 ) ) ( not ( = ?auto_166117 ?auto_166122 ) ) ( not ( = ?auto_166117 ?auto_166123 ) ) ( not ( = ?auto_166117 ?auto_166124 ) ) ( not ( = ?auto_166117 ?auto_166125 ) ) ( not ( = ?auto_166118 ?auto_166119 ) ) ( not ( = ?auto_166118 ?auto_166120 ) ) ( not ( = ?auto_166118 ?auto_166121 ) ) ( not ( = ?auto_166118 ?auto_166122 ) ) ( not ( = ?auto_166118 ?auto_166123 ) ) ( not ( = ?auto_166118 ?auto_166124 ) ) ( not ( = ?auto_166118 ?auto_166125 ) ) ( not ( = ?auto_166119 ?auto_166120 ) ) ( not ( = ?auto_166119 ?auto_166121 ) ) ( not ( = ?auto_166119 ?auto_166122 ) ) ( not ( = ?auto_166119 ?auto_166123 ) ) ( not ( = ?auto_166119 ?auto_166124 ) ) ( not ( = ?auto_166119 ?auto_166125 ) ) ( not ( = ?auto_166120 ?auto_166121 ) ) ( not ( = ?auto_166120 ?auto_166122 ) ) ( not ( = ?auto_166120 ?auto_166123 ) ) ( not ( = ?auto_166120 ?auto_166124 ) ) ( not ( = ?auto_166120 ?auto_166125 ) ) ( not ( = ?auto_166121 ?auto_166122 ) ) ( not ( = ?auto_166121 ?auto_166123 ) ) ( not ( = ?auto_166121 ?auto_166124 ) ) ( not ( = ?auto_166121 ?auto_166125 ) ) ( not ( = ?auto_166122 ?auto_166123 ) ) ( not ( = ?auto_166122 ?auto_166124 ) ) ( not ( = ?auto_166122 ?auto_166125 ) ) ( not ( = ?auto_166123 ?auto_166124 ) ) ( not ( = ?auto_166123 ?auto_166125 ) ) ( not ( = ?auto_166124 ?auto_166125 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166124 ?auto_166125 )
      ( !STACK ?auto_166124 ?auto_166123 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166138 - BLOCK
      ?auto_166139 - BLOCK
      ?auto_166140 - BLOCK
      ?auto_166141 - BLOCK
      ?auto_166142 - BLOCK
      ?auto_166143 - BLOCK
      ?auto_166144 - BLOCK
      ?auto_166145 - BLOCK
      ?auto_166146 - BLOCK
      ?auto_166147 - BLOCK
      ?auto_166148 - BLOCK
      ?auto_166149 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166148 ) ( ON-TABLE ?auto_166149 ) ( CLEAR ?auto_166149 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166138 ) ( ON ?auto_166139 ?auto_166138 ) ( ON ?auto_166140 ?auto_166139 ) ( ON ?auto_166141 ?auto_166140 ) ( ON ?auto_166142 ?auto_166141 ) ( ON ?auto_166143 ?auto_166142 ) ( ON ?auto_166144 ?auto_166143 ) ( ON ?auto_166145 ?auto_166144 ) ( ON ?auto_166146 ?auto_166145 ) ( ON ?auto_166147 ?auto_166146 ) ( ON ?auto_166148 ?auto_166147 ) ( not ( = ?auto_166138 ?auto_166139 ) ) ( not ( = ?auto_166138 ?auto_166140 ) ) ( not ( = ?auto_166138 ?auto_166141 ) ) ( not ( = ?auto_166138 ?auto_166142 ) ) ( not ( = ?auto_166138 ?auto_166143 ) ) ( not ( = ?auto_166138 ?auto_166144 ) ) ( not ( = ?auto_166138 ?auto_166145 ) ) ( not ( = ?auto_166138 ?auto_166146 ) ) ( not ( = ?auto_166138 ?auto_166147 ) ) ( not ( = ?auto_166138 ?auto_166148 ) ) ( not ( = ?auto_166138 ?auto_166149 ) ) ( not ( = ?auto_166139 ?auto_166140 ) ) ( not ( = ?auto_166139 ?auto_166141 ) ) ( not ( = ?auto_166139 ?auto_166142 ) ) ( not ( = ?auto_166139 ?auto_166143 ) ) ( not ( = ?auto_166139 ?auto_166144 ) ) ( not ( = ?auto_166139 ?auto_166145 ) ) ( not ( = ?auto_166139 ?auto_166146 ) ) ( not ( = ?auto_166139 ?auto_166147 ) ) ( not ( = ?auto_166139 ?auto_166148 ) ) ( not ( = ?auto_166139 ?auto_166149 ) ) ( not ( = ?auto_166140 ?auto_166141 ) ) ( not ( = ?auto_166140 ?auto_166142 ) ) ( not ( = ?auto_166140 ?auto_166143 ) ) ( not ( = ?auto_166140 ?auto_166144 ) ) ( not ( = ?auto_166140 ?auto_166145 ) ) ( not ( = ?auto_166140 ?auto_166146 ) ) ( not ( = ?auto_166140 ?auto_166147 ) ) ( not ( = ?auto_166140 ?auto_166148 ) ) ( not ( = ?auto_166140 ?auto_166149 ) ) ( not ( = ?auto_166141 ?auto_166142 ) ) ( not ( = ?auto_166141 ?auto_166143 ) ) ( not ( = ?auto_166141 ?auto_166144 ) ) ( not ( = ?auto_166141 ?auto_166145 ) ) ( not ( = ?auto_166141 ?auto_166146 ) ) ( not ( = ?auto_166141 ?auto_166147 ) ) ( not ( = ?auto_166141 ?auto_166148 ) ) ( not ( = ?auto_166141 ?auto_166149 ) ) ( not ( = ?auto_166142 ?auto_166143 ) ) ( not ( = ?auto_166142 ?auto_166144 ) ) ( not ( = ?auto_166142 ?auto_166145 ) ) ( not ( = ?auto_166142 ?auto_166146 ) ) ( not ( = ?auto_166142 ?auto_166147 ) ) ( not ( = ?auto_166142 ?auto_166148 ) ) ( not ( = ?auto_166142 ?auto_166149 ) ) ( not ( = ?auto_166143 ?auto_166144 ) ) ( not ( = ?auto_166143 ?auto_166145 ) ) ( not ( = ?auto_166143 ?auto_166146 ) ) ( not ( = ?auto_166143 ?auto_166147 ) ) ( not ( = ?auto_166143 ?auto_166148 ) ) ( not ( = ?auto_166143 ?auto_166149 ) ) ( not ( = ?auto_166144 ?auto_166145 ) ) ( not ( = ?auto_166144 ?auto_166146 ) ) ( not ( = ?auto_166144 ?auto_166147 ) ) ( not ( = ?auto_166144 ?auto_166148 ) ) ( not ( = ?auto_166144 ?auto_166149 ) ) ( not ( = ?auto_166145 ?auto_166146 ) ) ( not ( = ?auto_166145 ?auto_166147 ) ) ( not ( = ?auto_166145 ?auto_166148 ) ) ( not ( = ?auto_166145 ?auto_166149 ) ) ( not ( = ?auto_166146 ?auto_166147 ) ) ( not ( = ?auto_166146 ?auto_166148 ) ) ( not ( = ?auto_166146 ?auto_166149 ) ) ( not ( = ?auto_166147 ?auto_166148 ) ) ( not ( = ?auto_166147 ?auto_166149 ) ) ( not ( = ?auto_166148 ?auto_166149 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_166149 )
      ( !STACK ?auto_166149 ?auto_166148 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166162 - BLOCK
      ?auto_166163 - BLOCK
      ?auto_166164 - BLOCK
      ?auto_166165 - BLOCK
      ?auto_166166 - BLOCK
      ?auto_166167 - BLOCK
      ?auto_166168 - BLOCK
      ?auto_166169 - BLOCK
      ?auto_166170 - BLOCK
      ?auto_166171 - BLOCK
      ?auto_166172 - BLOCK
      ?auto_166173 - BLOCK
    )
    :vars
    (
      ?auto_166174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166173 ?auto_166174 ) ( ON-TABLE ?auto_166162 ) ( ON ?auto_166163 ?auto_166162 ) ( ON ?auto_166164 ?auto_166163 ) ( ON ?auto_166165 ?auto_166164 ) ( ON ?auto_166166 ?auto_166165 ) ( ON ?auto_166167 ?auto_166166 ) ( ON ?auto_166168 ?auto_166167 ) ( ON ?auto_166169 ?auto_166168 ) ( ON ?auto_166170 ?auto_166169 ) ( ON ?auto_166171 ?auto_166170 ) ( not ( = ?auto_166162 ?auto_166163 ) ) ( not ( = ?auto_166162 ?auto_166164 ) ) ( not ( = ?auto_166162 ?auto_166165 ) ) ( not ( = ?auto_166162 ?auto_166166 ) ) ( not ( = ?auto_166162 ?auto_166167 ) ) ( not ( = ?auto_166162 ?auto_166168 ) ) ( not ( = ?auto_166162 ?auto_166169 ) ) ( not ( = ?auto_166162 ?auto_166170 ) ) ( not ( = ?auto_166162 ?auto_166171 ) ) ( not ( = ?auto_166162 ?auto_166172 ) ) ( not ( = ?auto_166162 ?auto_166173 ) ) ( not ( = ?auto_166162 ?auto_166174 ) ) ( not ( = ?auto_166163 ?auto_166164 ) ) ( not ( = ?auto_166163 ?auto_166165 ) ) ( not ( = ?auto_166163 ?auto_166166 ) ) ( not ( = ?auto_166163 ?auto_166167 ) ) ( not ( = ?auto_166163 ?auto_166168 ) ) ( not ( = ?auto_166163 ?auto_166169 ) ) ( not ( = ?auto_166163 ?auto_166170 ) ) ( not ( = ?auto_166163 ?auto_166171 ) ) ( not ( = ?auto_166163 ?auto_166172 ) ) ( not ( = ?auto_166163 ?auto_166173 ) ) ( not ( = ?auto_166163 ?auto_166174 ) ) ( not ( = ?auto_166164 ?auto_166165 ) ) ( not ( = ?auto_166164 ?auto_166166 ) ) ( not ( = ?auto_166164 ?auto_166167 ) ) ( not ( = ?auto_166164 ?auto_166168 ) ) ( not ( = ?auto_166164 ?auto_166169 ) ) ( not ( = ?auto_166164 ?auto_166170 ) ) ( not ( = ?auto_166164 ?auto_166171 ) ) ( not ( = ?auto_166164 ?auto_166172 ) ) ( not ( = ?auto_166164 ?auto_166173 ) ) ( not ( = ?auto_166164 ?auto_166174 ) ) ( not ( = ?auto_166165 ?auto_166166 ) ) ( not ( = ?auto_166165 ?auto_166167 ) ) ( not ( = ?auto_166165 ?auto_166168 ) ) ( not ( = ?auto_166165 ?auto_166169 ) ) ( not ( = ?auto_166165 ?auto_166170 ) ) ( not ( = ?auto_166165 ?auto_166171 ) ) ( not ( = ?auto_166165 ?auto_166172 ) ) ( not ( = ?auto_166165 ?auto_166173 ) ) ( not ( = ?auto_166165 ?auto_166174 ) ) ( not ( = ?auto_166166 ?auto_166167 ) ) ( not ( = ?auto_166166 ?auto_166168 ) ) ( not ( = ?auto_166166 ?auto_166169 ) ) ( not ( = ?auto_166166 ?auto_166170 ) ) ( not ( = ?auto_166166 ?auto_166171 ) ) ( not ( = ?auto_166166 ?auto_166172 ) ) ( not ( = ?auto_166166 ?auto_166173 ) ) ( not ( = ?auto_166166 ?auto_166174 ) ) ( not ( = ?auto_166167 ?auto_166168 ) ) ( not ( = ?auto_166167 ?auto_166169 ) ) ( not ( = ?auto_166167 ?auto_166170 ) ) ( not ( = ?auto_166167 ?auto_166171 ) ) ( not ( = ?auto_166167 ?auto_166172 ) ) ( not ( = ?auto_166167 ?auto_166173 ) ) ( not ( = ?auto_166167 ?auto_166174 ) ) ( not ( = ?auto_166168 ?auto_166169 ) ) ( not ( = ?auto_166168 ?auto_166170 ) ) ( not ( = ?auto_166168 ?auto_166171 ) ) ( not ( = ?auto_166168 ?auto_166172 ) ) ( not ( = ?auto_166168 ?auto_166173 ) ) ( not ( = ?auto_166168 ?auto_166174 ) ) ( not ( = ?auto_166169 ?auto_166170 ) ) ( not ( = ?auto_166169 ?auto_166171 ) ) ( not ( = ?auto_166169 ?auto_166172 ) ) ( not ( = ?auto_166169 ?auto_166173 ) ) ( not ( = ?auto_166169 ?auto_166174 ) ) ( not ( = ?auto_166170 ?auto_166171 ) ) ( not ( = ?auto_166170 ?auto_166172 ) ) ( not ( = ?auto_166170 ?auto_166173 ) ) ( not ( = ?auto_166170 ?auto_166174 ) ) ( not ( = ?auto_166171 ?auto_166172 ) ) ( not ( = ?auto_166171 ?auto_166173 ) ) ( not ( = ?auto_166171 ?auto_166174 ) ) ( not ( = ?auto_166172 ?auto_166173 ) ) ( not ( = ?auto_166172 ?auto_166174 ) ) ( not ( = ?auto_166173 ?auto_166174 ) ) ( CLEAR ?auto_166171 ) ( ON ?auto_166172 ?auto_166173 ) ( CLEAR ?auto_166172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_166162 ?auto_166163 ?auto_166164 ?auto_166165 ?auto_166166 ?auto_166167 ?auto_166168 ?auto_166169 ?auto_166170 ?auto_166171 ?auto_166172 )
      ( MAKE-12PILE ?auto_166162 ?auto_166163 ?auto_166164 ?auto_166165 ?auto_166166 ?auto_166167 ?auto_166168 ?auto_166169 ?auto_166170 ?auto_166171 ?auto_166172 ?auto_166173 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166187 - BLOCK
      ?auto_166188 - BLOCK
      ?auto_166189 - BLOCK
      ?auto_166190 - BLOCK
      ?auto_166191 - BLOCK
      ?auto_166192 - BLOCK
      ?auto_166193 - BLOCK
      ?auto_166194 - BLOCK
      ?auto_166195 - BLOCK
      ?auto_166196 - BLOCK
      ?auto_166197 - BLOCK
      ?auto_166198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166198 ) ( ON-TABLE ?auto_166187 ) ( ON ?auto_166188 ?auto_166187 ) ( ON ?auto_166189 ?auto_166188 ) ( ON ?auto_166190 ?auto_166189 ) ( ON ?auto_166191 ?auto_166190 ) ( ON ?auto_166192 ?auto_166191 ) ( ON ?auto_166193 ?auto_166192 ) ( ON ?auto_166194 ?auto_166193 ) ( ON ?auto_166195 ?auto_166194 ) ( ON ?auto_166196 ?auto_166195 ) ( not ( = ?auto_166187 ?auto_166188 ) ) ( not ( = ?auto_166187 ?auto_166189 ) ) ( not ( = ?auto_166187 ?auto_166190 ) ) ( not ( = ?auto_166187 ?auto_166191 ) ) ( not ( = ?auto_166187 ?auto_166192 ) ) ( not ( = ?auto_166187 ?auto_166193 ) ) ( not ( = ?auto_166187 ?auto_166194 ) ) ( not ( = ?auto_166187 ?auto_166195 ) ) ( not ( = ?auto_166187 ?auto_166196 ) ) ( not ( = ?auto_166187 ?auto_166197 ) ) ( not ( = ?auto_166187 ?auto_166198 ) ) ( not ( = ?auto_166188 ?auto_166189 ) ) ( not ( = ?auto_166188 ?auto_166190 ) ) ( not ( = ?auto_166188 ?auto_166191 ) ) ( not ( = ?auto_166188 ?auto_166192 ) ) ( not ( = ?auto_166188 ?auto_166193 ) ) ( not ( = ?auto_166188 ?auto_166194 ) ) ( not ( = ?auto_166188 ?auto_166195 ) ) ( not ( = ?auto_166188 ?auto_166196 ) ) ( not ( = ?auto_166188 ?auto_166197 ) ) ( not ( = ?auto_166188 ?auto_166198 ) ) ( not ( = ?auto_166189 ?auto_166190 ) ) ( not ( = ?auto_166189 ?auto_166191 ) ) ( not ( = ?auto_166189 ?auto_166192 ) ) ( not ( = ?auto_166189 ?auto_166193 ) ) ( not ( = ?auto_166189 ?auto_166194 ) ) ( not ( = ?auto_166189 ?auto_166195 ) ) ( not ( = ?auto_166189 ?auto_166196 ) ) ( not ( = ?auto_166189 ?auto_166197 ) ) ( not ( = ?auto_166189 ?auto_166198 ) ) ( not ( = ?auto_166190 ?auto_166191 ) ) ( not ( = ?auto_166190 ?auto_166192 ) ) ( not ( = ?auto_166190 ?auto_166193 ) ) ( not ( = ?auto_166190 ?auto_166194 ) ) ( not ( = ?auto_166190 ?auto_166195 ) ) ( not ( = ?auto_166190 ?auto_166196 ) ) ( not ( = ?auto_166190 ?auto_166197 ) ) ( not ( = ?auto_166190 ?auto_166198 ) ) ( not ( = ?auto_166191 ?auto_166192 ) ) ( not ( = ?auto_166191 ?auto_166193 ) ) ( not ( = ?auto_166191 ?auto_166194 ) ) ( not ( = ?auto_166191 ?auto_166195 ) ) ( not ( = ?auto_166191 ?auto_166196 ) ) ( not ( = ?auto_166191 ?auto_166197 ) ) ( not ( = ?auto_166191 ?auto_166198 ) ) ( not ( = ?auto_166192 ?auto_166193 ) ) ( not ( = ?auto_166192 ?auto_166194 ) ) ( not ( = ?auto_166192 ?auto_166195 ) ) ( not ( = ?auto_166192 ?auto_166196 ) ) ( not ( = ?auto_166192 ?auto_166197 ) ) ( not ( = ?auto_166192 ?auto_166198 ) ) ( not ( = ?auto_166193 ?auto_166194 ) ) ( not ( = ?auto_166193 ?auto_166195 ) ) ( not ( = ?auto_166193 ?auto_166196 ) ) ( not ( = ?auto_166193 ?auto_166197 ) ) ( not ( = ?auto_166193 ?auto_166198 ) ) ( not ( = ?auto_166194 ?auto_166195 ) ) ( not ( = ?auto_166194 ?auto_166196 ) ) ( not ( = ?auto_166194 ?auto_166197 ) ) ( not ( = ?auto_166194 ?auto_166198 ) ) ( not ( = ?auto_166195 ?auto_166196 ) ) ( not ( = ?auto_166195 ?auto_166197 ) ) ( not ( = ?auto_166195 ?auto_166198 ) ) ( not ( = ?auto_166196 ?auto_166197 ) ) ( not ( = ?auto_166196 ?auto_166198 ) ) ( not ( = ?auto_166197 ?auto_166198 ) ) ( CLEAR ?auto_166196 ) ( ON ?auto_166197 ?auto_166198 ) ( CLEAR ?auto_166197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_166187 ?auto_166188 ?auto_166189 ?auto_166190 ?auto_166191 ?auto_166192 ?auto_166193 ?auto_166194 ?auto_166195 ?auto_166196 ?auto_166197 )
      ( MAKE-12PILE ?auto_166187 ?auto_166188 ?auto_166189 ?auto_166190 ?auto_166191 ?auto_166192 ?auto_166193 ?auto_166194 ?auto_166195 ?auto_166196 ?auto_166197 ?auto_166198 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166211 - BLOCK
      ?auto_166212 - BLOCK
      ?auto_166213 - BLOCK
      ?auto_166214 - BLOCK
      ?auto_166215 - BLOCK
      ?auto_166216 - BLOCK
      ?auto_166217 - BLOCK
      ?auto_166218 - BLOCK
      ?auto_166219 - BLOCK
      ?auto_166220 - BLOCK
      ?auto_166221 - BLOCK
      ?auto_166222 - BLOCK
    )
    :vars
    (
      ?auto_166223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166222 ?auto_166223 ) ( ON-TABLE ?auto_166211 ) ( ON ?auto_166212 ?auto_166211 ) ( ON ?auto_166213 ?auto_166212 ) ( ON ?auto_166214 ?auto_166213 ) ( ON ?auto_166215 ?auto_166214 ) ( ON ?auto_166216 ?auto_166215 ) ( ON ?auto_166217 ?auto_166216 ) ( ON ?auto_166218 ?auto_166217 ) ( ON ?auto_166219 ?auto_166218 ) ( not ( = ?auto_166211 ?auto_166212 ) ) ( not ( = ?auto_166211 ?auto_166213 ) ) ( not ( = ?auto_166211 ?auto_166214 ) ) ( not ( = ?auto_166211 ?auto_166215 ) ) ( not ( = ?auto_166211 ?auto_166216 ) ) ( not ( = ?auto_166211 ?auto_166217 ) ) ( not ( = ?auto_166211 ?auto_166218 ) ) ( not ( = ?auto_166211 ?auto_166219 ) ) ( not ( = ?auto_166211 ?auto_166220 ) ) ( not ( = ?auto_166211 ?auto_166221 ) ) ( not ( = ?auto_166211 ?auto_166222 ) ) ( not ( = ?auto_166211 ?auto_166223 ) ) ( not ( = ?auto_166212 ?auto_166213 ) ) ( not ( = ?auto_166212 ?auto_166214 ) ) ( not ( = ?auto_166212 ?auto_166215 ) ) ( not ( = ?auto_166212 ?auto_166216 ) ) ( not ( = ?auto_166212 ?auto_166217 ) ) ( not ( = ?auto_166212 ?auto_166218 ) ) ( not ( = ?auto_166212 ?auto_166219 ) ) ( not ( = ?auto_166212 ?auto_166220 ) ) ( not ( = ?auto_166212 ?auto_166221 ) ) ( not ( = ?auto_166212 ?auto_166222 ) ) ( not ( = ?auto_166212 ?auto_166223 ) ) ( not ( = ?auto_166213 ?auto_166214 ) ) ( not ( = ?auto_166213 ?auto_166215 ) ) ( not ( = ?auto_166213 ?auto_166216 ) ) ( not ( = ?auto_166213 ?auto_166217 ) ) ( not ( = ?auto_166213 ?auto_166218 ) ) ( not ( = ?auto_166213 ?auto_166219 ) ) ( not ( = ?auto_166213 ?auto_166220 ) ) ( not ( = ?auto_166213 ?auto_166221 ) ) ( not ( = ?auto_166213 ?auto_166222 ) ) ( not ( = ?auto_166213 ?auto_166223 ) ) ( not ( = ?auto_166214 ?auto_166215 ) ) ( not ( = ?auto_166214 ?auto_166216 ) ) ( not ( = ?auto_166214 ?auto_166217 ) ) ( not ( = ?auto_166214 ?auto_166218 ) ) ( not ( = ?auto_166214 ?auto_166219 ) ) ( not ( = ?auto_166214 ?auto_166220 ) ) ( not ( = ?auto_166214 ?auto_166221 ) ) ( not ( = ?auto_166214 ?auto_166222 ) ) ( not ( = ?auto_166214 ?auto_166223 ) ) ( not ( = ?auto_166215 ?auto_166216 ) ) ( not ( = ?auto_166215 ?auto_166217 ) ) ( not ( = ?auto_166215 ?auto_166218 ) ) ( not ( = ?auto_166215 ?auto_166219 ) ) ( not ( = ?auto_166215 ?auto_166220 ) ) ( not ( = ?auto_166215 ?auto_166221 ) ) ( not ( = ?auto_166215 ?auto_166222 ) ) ( not ( = ?auto_166215 ?auto_166223 ) ) ( not ( = ?auto_166216 ?auto_166217 ) ) ( not ( = ?auto_166216 ?auto_166218 ) ) ( not ( = ?auto_166216 ?auto_166219 ) ) ( not ( = ?auto_166216 ?auto_166220 ) ) ( not ( = ?auto_166216 ?auto_166221 ) ) ( not ( = ?auto_166216 ?auto_166222 ) ) ( not ( = ?auto_166216 ?auto_166223 ) ) ( not ( = ?auto_166217 ?auto_166218 ) ) ( not ( = ?auto_166217 ?auto_166219 ) ) ( not ( = ?auto_166217 ?auto_166220 ) ) ( not ( = ?auto_166217 ?auto_166221 ) ) ( not ( = ?auto_166217 ?auto_166222 ) ) ( not ( = ?auto_166217 ?auto_166223 ) ) ( not ( = ?auto_166218 ?auto_166219 ) ) ( not ( = ?auto_166218 ?auto_166220 ) ) ( not ( = ?auto_166218 ?auto_166221 ) ) ( not ( = ?auto_166218 ?auto_166222 ) ) ( not ( = ?auto_166218 ?auto_166223 ) ) ( not ( = ?auto_166219 ?auto_166220 ) ) ( not ( = ?auto_166219 ?auto_166221 ) ) ( not ( = ?auto_166219 ?auto_166222 ) ) ( not ( = ?auto_166219 ?auto_166223 ) ) ( not ( = ?auto_166220 ?auto_166221 ) ) ( not ( = ?auto_166220 ?auto_166222 ) ) ( not ( = ?auto_166220 ?auto_166223 ) ) ( not ( = ?auto_166221 ?auto_166222 ) ) ( not ( = ?auto_166221 ?auto_166223 ) ) ( not ( = ?auto_166222 ?auto_166223 ) ) ( ON ?auto_166221 ?auto_166222 ) ( CLEAR ?auto_166219 ) ( ON ?auto_166220 ?auto_166221 ) ( CLEAR ?auto_166220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_166211 ?auto_166212 ?auto_166213 ?auto_166214 ?auto_166215 ?auto_166216 ?auto_166217 ?auto_166218 ?auto_166219 ?auto_166220 )
      ( MAKE-12PILE ?auto_166211 ?auto_166212 ?auto_166213 ?auto_166214 ?auto_166215 ?auto_166216 ?auto_166217 ?auto_166218 ?auto_166219 ?auto_166220 ?auto_166221 ?auto_166222 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166236 - BLOCK
      ?auto_166237 - BLOCK
      ?auto_166238 - BLOCK
      ?auto_166239 - BLOCK
      ?auto_166240 - BLOCK
      ?auto_166241 - BLOCK
      ?auto_166242 - BLOCK
      ?auto_166243 - BLOCK
      ?auto_166244 - BLOCK
      ?auto_166245 - BLOCK
      ?auto_166246 - BLOCK
      ?auto_166247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166247 ) ( ON-TABLE ?auto_166236 ) ( ON ?auto_166237 ?auto_166236 ) ( ON ?auto_166238 ?auto_166237 ) ( ON ?auto_166239 ?auto_166238 ) ( ON ?auto_166240 ?auto_166239 ) ( ON ?auto_166241 ?auto_166240 ) ( ON ?auto_166242 ?auto_166241 ) ( ON ?auto_166243 ?auto_166242 ) ( ON ?auto_166244 ?auto_166243 ) ( not ( = ?auto_166236 ?auto_166237 ) ) ( not ( = ?auto_166236 ?auto_166238 ) ) ( not ( = ?auto_166236 ?auto_166239 ) ) ( not ( = ?auto_166236 ?auto_166240 ) ) ( not ( = ?auto_166236 ?auto_166241 ) ) ( not ( = ?auto_166236 ?auto_166242 ) ) ( not ( = ?auto_166236 ?auto_166243 ) ) ( not ( = ?auto_166236 ?auto_166244 ) ) ( not ( = ?auto_166236 ?auto_166245 ) ) ( not ( = ?auto_166236 ?auto_166246 ) ) ( not ( = ?auto_166236 ?auto_166247 ) ) ( not ( = ?auto_166237 ?auto_166238 ) ) ( not ( = ?auto_166237 ?auto_166239 ) ) ( not ( = ?auto_166237 ?auto_166240 ) ) ( not ( = ?auto_166237 ?auto_166241 ) ) ( not ( = ?auto_166237 ?auto_166242 ) ) ( not ( = ?auto_166237 ?auto_166243 ) ) ( not ( = ?auto_166237 ?auto_166244 ) ) ( not ( = ?auto_166237 ?auto_166245 ) ) ( not ( = ?auto_166237 ?auto_166246 ) ) ( not ( = ?auto_166237 ?auto_166247 ) ) ( not ( = ?auto_166238 ?auto_166239 ) ) ( not ( = ?auto_166238 ?auto_166240 ) ) ( not ( = ?auto_166238 ?auto_166241 ) ) ( not ( = ?auto_166238 ?auto_166242 ) ) ( not ( = ?auto_166238 ?auto_166243 ) ) ( not ( = ?auto_166238 ?auto_166244 ) ) ( not ( = ?auto_166238 ?auto_166245 ) ) ( not ( = ?auto_166238 ?auto_166246 ) ) ( not ( = ?auto_166238 ?auto_166247 ) ) ( not ( = ?auto_166239 ?auto_166240 ) ) ( not ( = ?auto_166239 ?auto_166241 ) ) ( not ( = ?auto_166239 ?auto_166242 ) ) ( not ( = ?auto_166239 ?auto_166243 ) ) ( not ( = ?auto_166239 ?auto_166244 ) ) ( not ( = ?auto_166239 ?auto_166245 ) ) ( not ( = ?auto_166239 ?auto_166246 ) ) ( not ( = ?auto_166239 ?auto_166247 ) ) ( not ( = ?auto_166240 ?auto_166241 ) ) ( not ( = ?auto_166240 ?auto_166242 ) ) ( not ( = ?auto_166240 ?auto_166243 ) ) ( not ( = ?auto_166240 ?auto_166244 ) ) ( not ( = ?auto_166240 ?auto_166245 ) ) ( not ( = ?auto_166240 ?auto_166246 ) ) ( not ( = ?auto_166240 ?auto_166247 ) ) ( not ( = ?auto_166241 ?auto_166242 ) ) ( not ( = ?auto_166241 ?auto_166243 ) ) ( not ( = ?auto_166241 ?auto_166244 ) ) ( not ( = ?auto_166241 ?auto_166245 ) ) ( not ( = ?auto_166241 ?auto_166246 ) ) ( not ( = ?auto_166241 ?auto_166247 ) ) ( not ( = ?auto_166242 ?auto_166243 ) ) ( not ( = ?auto_166242 ?auto_166244 ) ) ( not ( = ?auto_166242 ?auto_166245 ) ) ( not ( = ?auto_166242 ?auto_166246 ) ) ( not ( = ?auto_166242 ?auto_166247 ) ) ( not ( = ?auto_166243 ?auto_166244 ) ) ( not ( = ?auto_166243 ?auto_166245 ) ) ( not ( = ?auto_166243 ?auto_166246 ) ) ( not ( = ?auto_166243 ?auto_166247 ) ) ( not ( = ?auto_166244 ?auto_166245 ) ) ( not ( = ?auto_166244 ?auto_166246 ) ) ( not ( = ?auto_166244 ?auto_166247 ) ) ( not ( = ?auto_166245 ?auto_166246 ) ) ( not ( = ?auto_166245 ?auto_166247 ) ) ( not ( = ?auto_166246 ?auto_166247 ) ) ( ON ?auto_166246 ?auto_166247 ) ( CLEAR ?auto_166244 ) ( ON ?auto_166245 ?auto_166246 ) ( CLEAR ?auto_166245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_166236 ?auto_166237 ?auto_166238 ?auto_166239 ?auto_166240 ?auto_166241 ?auto_166242 ?auto_166243 ?auto_166244 ?auto_166245 )
      ( MAKE-12PILE ?auto_166236 ?auto_166237 ?auto_166238 ?auto_166239 ?auto_166240 ?auto_166241 ?auto_166242 ?auto_166243 ?auto_166244 ?auto_166245 ?auto_166246 ?auto_166247 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166260 - BLOCK
      ?auto_166261 - BLOCK
      ?auto_166262 - BLOCK
      ?auto_166263 - BLOCK
      ?auto_166264 - BLOCK
      ?auto_166265 - BLOCK
      ?auto_166266 - BLOCK
      ?auto_166267 - BLOCK
      ?auto_166268 - BLOCK
      ?auto_166269 - BLOCK
      ?auto_166270 - BLOCK
      ?auto_166271 - BLOCK
    )
    :vars
    (
      ?auto_166272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166271 ?auto_166272 ) ( ON-TABLE ?auto_166260 ) ( ON ?auto_166261 ?auto_166260 ) ( ON ?auto_166262 ?auto_166261 ) ( ON ?auto_166263 ?auto_166262 ) ( ON ?auto_166264 ?auto_166263 ) ( ON ?auto_166265 ?auto_166264 ) ( ON ?auto_166266 ?auto_166265 ) ( ON ?auto_166267 ?auto_166266 ) ( not ( = ?auto_166260 ?auto_166261 ) ) ( not ( = ?auto_166260 ?auto_166262 ) ) ( not ( = ?auto_166260 ?auto_166263 ) ) ( not ( = ?auto_166260 ?auto_166264 ) ) ( not ( = ?auto_166260 ?auto_166265 ) ) ( not ( = ?auto_166260 ?auto_166266 ) ) ( not ( = ?auto_166260 ?auto_166267 ) ) ( not ( = ?auto_166260 ?auto_166268 ) ) ( not ( = ?auto_166260 ?auto_166269 ) ) ( not ( = ?auto_166260 ?auto_166270 ) ) ( not ( = ?auto_166260 ?auto_166271 ) ) ( not ( = ?auto_166260 ?auto_166272 ) ) ( not ( = ?auto_166261 ?auto_166262 ) ) ( not ( = ?auto_166261 ?auto_166263 ) ) ( not ( = ?auto_166261 ?auto_166264 ) ) ( not ( = ?auto_166261 ?auto_166265 ) ) ( not ( = ?auto_166261 ?auto_166266 ) ) ( not ( = ?auto_166261 ?auto_166267 ) ) ( not ( = ?auto_166261 ?auto_166268 ) ) ( not ( = ?auto_166261 ?auto_166269 ) ) ( not ( = ?auto_166261 ?auto_166270 ) ) ( not ( = ?auto_166261 ?auto_166271 ) ) ( not ( = ?auto_166261 ?auto_166272 ) ) ( not ( = ?auto_166262 ?auto_166263 ) ) ( not ( = ?auto_166262 ?auto_166264 ) ) ( not ( = ?auto_166262 ?auto_166265 ) ) ( not ( = ?auto_166262 ?auto_166266 ) ) ( not ( = ?auto_166262 ?auto_166267 ) ) ( not ( = ?auto_166262 ?auto_166268 ) ) ( not ( = ?auto_166262 ?auto_166269 ) ) ( not ( = ?auto_166262 ?auto_166270 ) ) ( not ( = ?auto_166262 ?auto_166271 ) ) ( not ( = ?auto_166262 ?auto_166272 ) ) ( not ( = ?auto_166263 ?auto_166264 ) ) ( not ( = ?auto_166263 ?auto_166265 ) ) ( not ( = ?auto_166263 ?auto_166266 ) ) ( not ( = ?auto_166263 ?auto_166267 ) ) ( not ( = ?auto_166263 ?auto_166268 ) ) ( not ( = ?auto_166263 ?auto_166269 ) ) ( not ( = ?auto_166263 ?auto_166270 ) ) ( not ( = ?auto_166263 ?auto_166271 ) ) ( not ( = ?auto_166263 ?auto_166272 ) ) ( not ( = ?auto_166264 ?auto_166265 ) ) ( not ( = ?auto_166264 ?auto_166266 ) ) ( not ( = ?auto_166264 ?auto_166267 ) ) ( not ( = ?auto_166264 ?auto_166268 ) ) ( not ( = ?auto_166264 ?auto_166269 ) ) ( not ( = ?auto_166264 ?auto_166270 ) ) ( not ( = ?auto_166264 ?auto_166271 ) ) ( not ( = ?auto_166264 ?auto_166272 ) ) ( not ( = ?auto_166265 ?auto_166266 ) ) ( not ( = ?auto_166265 ?auto_166267 ) ) ( not ( = ?auto_166265 ?auto_166268 ) ) ( not ( = ?auto_166265 ?auto_166269 ) ) ( not ( = ?auto_166265 ?auto_166270 ) ) ( not ( = ?auto_166265 ?auto_166271 ) ) ( not ( = ?auto_166265 ?auto_166272 ) ) ( not ( = ?auto_166266 ?auto_166267 ) ) ( not ( = ?auto_166266 ?auto_166268 ) ) ( not ( = ?auto_166266 ?auto_166269 ) ) ( not ( = ?auto_166266 ?auto_166270 ) ) ( not ( = ?auto_166266 ?auto_166271 ) ) ( not ( = ?auto_166266 ?auto_166272 ) ) ( not ( = ?auto_166267 ?auto_166268 ) ) ( not ( = ?auto_166267 ?auto_166269 ) ) ( not ( = ?auto_166267 ?auto_166270 ) ) ( not ( = ?auto_166267 ?auto_166271 ) ) ( not ( = ?auto_166267 ?auto_166272 ) ) ( not ( = ?auto_166268 ?auto_166269 ) ) ( not ( = ?auto_166268 ?auto_166270 ) ) ( not ( = ?auto_166268 ?auto_166271 ) ) ( not ( = ?auto_166268 ?auto_166272 ) ) ( not ( = ?auto_166269 ?auto_166270 ) ) ( not ( = ?auto_166269 ?auto_166271 ) ) ( not ( = ?auto_166269 ?auto_166272 ) ) ( not ( = ?auto_166270 ?auto_166271 ) ) ( not ( = ?auto_166270 ?auto_166272 ) ) ( not ( = ?auto_166271 ?auto_166272 ) ) ( ON ?auto_166270 ?auto_166271 ) ( ON ?auto_166269 ?auto_166270 ) ( CLEAR ?auto_166267 ) ( ON ?auto_166268 ?auto_166269 ) ( CLEAR ?auto_166268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_166260 ?auto_166261 ?auto_166262 ?auto_166263 ?auto_166264 ?auto_166265 ?auto_166266 ?auto_166267 ?auto_166268 )
      ( MAKE-12PILE ?auto_166260 ?auto_166261 ?auto_166262 ?auto_166263 ?auto_166264 ?auto_166265 ?auto_166266 ?auto_166267 ?auto_166268 ?auto_166269 ?auto_166270 ?auto_166271 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166285 - BLOCK
      ?auto_166286 - BLOCK
      ?auto_166287 - BLOCK
      ?auto_166288 - BLOCK
      ?auto_166289 - BLOCK
      ?auto_166290 - BLOCK
      ?auto_166291 - BLOCK
      ?auto_166292 - BLOCK
      ?auto_166293 - BLOCK
      ?auto_166294 - BLOCK
      ?auto_166295 - BLOCK
      ?auto_166296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166296 ) ( ON-TABLE ?auto_166285 ) ( ON ?auto_166286 ?auto_166285 ) ( ON ?auto_166287 ?auto_166286 ) ( ON ?auto_166288 ?auto_166287 ) ( ON ?auto_166289 ?auto_166288 ) ( ON ?auto_166290 ?auto_166289 ) ( ON ?auto_166291 ?auto_166290 ) ( ON ?auto_166292 ?auto_166291 ) ( not ( = ?auto_166285 ?auto_166286 ) ) ( not ( = ?auto_166285 ?auto_166287 ) ) ( not ( = ?auto_166285 ?auto_166288 ) ) ( not ( = ?auto_166285 ?auto_166289 ) ) ( not ( = ?auto_166285 ?auto_166290 ) ) ( not ( = ?auto_166285 ?auto_166291 ) ) ( not ( = ?auto_166285 ?auto_166292 ) ) ( not ( = ?auto_166285 ?auto_166293 ) ) ( not ( = ?auto_166285 ?auto_166294 ) ) ( not ( = ?auto_166285 ?auto_166295 ) ) ( not ( = ?auto_166285 ?auto_166296 ) ) ( not ( = ?auto_166286 ?auto_166287 ) ) ( not ( = ?auto_166286 ?auto_166288 ) ) ( not ( = ?auto_166286 ?auto_166289 ) ) ( not ( = ?auto_166286 ?auto_166290 ) ) ( not ( = ?auto_166286 ?auto_166291 ) ) ( not ( = ?auto_166286 ?auto_166292 ) ) ( not ( = ?auto_166286 ?auto_166293 ) ) ( not ( = ?auto_166286 ?auto_166294 ) ) ( not ( = ?auto_166286 ?auto_166295 ) ) ( not ( = ?auto_166286 ?auto_166296 ) ) ( not ( = ?auto_166287 ?auto_166288 ) ) ( not ( = ?auto_166287 ?auto_166289 ) ) ( not ( = ?auto_166287 ?auto_166290 ) ) ( not ( = ?auto_166287 ?auto_166291 ) ) ( not ( = ?auto_166287 ?auto_166292 ) ) ( not ( = ?auto_166287 ?auto_166293 ) ) ( not ( = ?auto_166287 ?auto_166294 ) ) ( not ( = ?auto_166287 ?auto_166295 ) ) ( not ( = ?auto_166287 ?auto_166296 ) ) ( not ( = ?auto_166288 ?auto_166289 ) ) ( not ( = ?auto_166288 ?auto_166290 ) ) ( not ( = ?auto_166288 ?auto_166291 ) ) ( not ( = ?auto_166288 ?auto_166292 ) ) ( not ( = ?auto_166288 ?auto_166293 ) ) ( not ( = ?auto_166288 ?auto_166294 ) ) ( not ( = ?auto_166288 ?auto_166295 ) ) ( not ( = ?auto_166288 ?auto_166296 ) ) ( not ( = ?auto_166289 ?auto_166290 ) ) ( not ( = ?auto_166289 ?auto_166291 ) ) ( not ( = ?auto_166289 ?auto_166292 ) ) ( not ( = ?auto_166289 ?auto_166293 ) ) ( not ( = ?auto_166289 ?auto_166294 ) ) ( not ( = ?auto_166289 ?auto_166295 ) ) ( not ( = ?auto_166289 ?auto_166296 ) ) ( not ( = ?auto_166290 ?auto_166291 ) ) ( not ( = ?auto_166290 ?auto_166292 ) ) ( not ( = ?auto_166290 ?auto_166293 ) ) ( not ( = ?auto_166290 ?auto_166294 ) ) ( not ( = ?auto_166290 ?auto_166295 ) ) ( not ( = ?auto_166290 ?auto_166296 ) ) ( not ( = ?auto_166291 ?auto_166292 ) ) ( not ( = ?auto_166291 ?auto_166293 ) ) ( not ( = ?auto_166291 ?auto_166294 ) ) ( not ( = ?auto_166291 ?auto_166295 ) ) ( not ( = ?auto_166291 ?auto_166296 ) ) ( not ( = ?auto_166292 ?auto_166293 ) ) ( not ( = ?auto_166292 ?auto_166294 ) ) ( not ( = ?auto_166292 ?auto_166295 ) ) ( not ( = ?auto_166292 ?auto_166296 ) ) ( not ( = ?auto_166293 ?auto_166294 ) ) ( not ( = ?auto_166293 ?auto_166295 ) ) ( not ( = ?auto_166293 ?auto_166296 ) ) ( not ( = ?auto_166294 ?auto_166295 ) ) ( not ( = ?auto_166294 ?auto_166296 ) ) ( not ( = ?auto_166295 ?auto_166296 ) ) ( ON ?auto_166295 ?auto_166296 ) ( ON ?auto_166294 ?auto_166295 ) ( CLEAR ?auto_166292 ) ( ON ?auto_166293 ?auto_166294 ) ( CLEAR ?auto_166293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_166285 ?auto_166286 ?auto_166287 ?auto_166288 ?auto_166289 ?auto_166290 ?auto_166291 ?auto_166292 ?auto_166293 )
      ( MAKE-12PILE ?auto_166285 ?auto_166286 ?auto_166287 ?auto_166288 ?auto_166289 ?auto_166290 ?auto_166291 ?auto_166292 ?auto_166293 ?auto_166294 ?auto_166295 ?auto_166296 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166309 - BLOCK
      ?auto_166310 - BLOCK
      ?auto_166311 - BLOCK
      ?auto_166312 - BLOCK
      ?auto_166313 - BLOCK
      ?auto_166314 - BLOCK
      ?auto_166315 - BLOCK
      ?auto_166316 - BLOCK
      ?auto_166317 - BLOCK
      ?auto_166318 - BLOCK
      ?auto_166319 - BLOCK
      ?auto_166320 - BLOCK
    )
    :vars
    (
      ?auto_166321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166320 ?auto_166321 ) ( ON-TABLE ?auto_166309 ) ( ON ?auto_166310 ?auto_166309 ) ( ON ?auto_166311 ?auto_166310 ) ( ON ?auto_166312 ?auto_166311 ) ( ON ?auto_166313 ?auto_166312 ) ( ON ?auto_166314 ?auto_166313 ) ( ON ?auto_166315 ?auto_166314 ) ( not ( = ?auto_166309 ?auto_166310 ) ) ( not ( = ?auto_166309 ?auto_166311 ) ) ( not ( = ?auto_166309 ?auto_166312 ) ) ( not ( = ?auto_166309 ?auto_166313 ) ) ( not ( = ?auto_166309 ?auto_166314 ) ) ( not ( = ?auto_166309 ?auto_166315 ) ) ( not ( = ?auto_166309 ?auto_166316 ) ) ( not ( = ?auto_166309 ?auto_166317 ) ) ( not ( = ?auto_166309 ?auto_166318 ) ) ( not ( = ?auto_166309 ?auto_166319 ) ) ( not ( = ?auto_166309 ?auto_166320 ) ) ( not ( = ?auto_166309 ?auto_166321 ) ) ( not ( = ?auto_166310 ?auto_166311 ) ) ( not ( = ?auto_166310 ?auto_166312 ) ) ( not ( = ?auto_166310 ?auto_166313 ) ) ( not ( = ?auto_166310 ?auto_166314 ) ) ( not ( = ?auto_166310 ?auto_166315 ) ) ( not ( = ?auto_166310 ?auto_166316 ) ) ( not ( = ?auto_166310 ?auto_166317 ) ) ( not ( = ?auto_166310 ?auto_166318 ) ) ( not ( = ?auto_166310 ?auto_166319 ) ) ( not ( = ?auto_166310 ?auto_166320 ) ) ( not ( = ?auto_166310 ?auto_166321 ) ) ( not ( = ?auto_166311 ?auto_166312 ) ) ( not ( = ?auto_166311 ?auto_166313 ) ) ( not ( = ?auto_166311 ?auto_166314 ) ) ( not ( = ?auto_166311 ?auto_166315 ) ) ( not ( = ?auto_166311 ?auto_166316 ) ) ( not ( = ?auto_166311 ?auto_166317 ) ) ( not ( = ?auto_166311 ?auto_166318 ) ) ( not ( = ?auto_166311 ?auto_166319 ) ) ( not ( = ?auto_166311 ?auto_166320 ) ) ( not ( = ?auto_166311 ?auto_166321 ) ) ( not ( = ?auto_166312 ?auto_166313 ) ) ( not ( = ?auto_166312 ?auto_166314 ) ) ( not ( = ?auto_166312 ?auto_166315 ) ) ( not ( = ?auto_166312 ?auto_166316 ) ) ( not ( = ?auto_166312 ?auto_166317 ) ) ( not ( = ?auto_166312 ?auto_166318 ) ) ( not ( = ?auto_166312 ?auto_166319 ) ) ( not ( = ?auto_166312 ?auto_166320 ) ) ( not ( = ?auto_166312 ?auto_166321 ) ) ( not ( = ?auto_166313 ?auto_166314 ) ) ( not ( = ?auto_166313 ?auto_166315 ) ) ( not ( = ?auto_166313 ?auto_166316 ) ) ( not ( = ?auto_166313 ?auto_166317 ) ) ( not ( = ?auto_166313 ?auto_166318 ) ) ( not ( = ?auto_166313 ?auto_166319 ) ) ( not ( = ?auto_166313 ?auto_166320 ) ) ( not ( = ?auto_166313 ?auto_166321 ) ) ( not ( = ?auto_166314 ?auto_166315 ) ) ( not ( = ?auto_166314 ?auto_166316 ) ) ( not ( = ?auto_166314 ?auto_166317 ) ) ( not ( = ?auto_166314 ?auto_166318 ) ) ( not ( = ?auto_166314 ?auto_166319 ) ) ( not ( = ?auto_166314 ?auto_166320 ) ) ( not ( = ?auto_166314 ?auto_166321 ) ) ( not ( = ?auto_166315 ?auto_166316 ) ) ( not ( = ?auto_166315 ?auto_166317 ) ) ( not ( = ?auto_166315 ?auto_166318 ) ) ( not ( = ?auto_166315 ?auto_166319 ) ) ( not ( = ?auto_166315 ?auto_166320 ) ) ( not ( = ?auto_166315 ?auto_166321 ) ) ( not ( = ?auto_166316 ?auto_166317 ) ) ( not ( = ?auto_166316 ?auto_166318 ) ) ( not ( = ?auto_166316 ?auto_166319 ) ) ( not ( = ?auto_166316 ?auto_166320 ) ) ( not ( = ?auto_166316 ?auto_166321 ) ) ( not ( = ?auto_166317 ?auto_166318 ) ) ( not ( = ?auto_166317 ?auto_166319 ) ) ( not ( = ?auto_166317 ?auto_166320 ) ) ( not ( = ?auto_166317 ?auto_166321 ) ) ( not ( = ?auto_166318 ?auto_166319 ) ) ( not ( = ?auto_166318 ?auto_166320 ) ) ( not ( = ?auto_166318 ?auto_166321 ) ) ( not ( = ?auto_166319 ?auto_166320 ) ) ( not ( = ?auto_166319 ?auto_166321 ) ) ( not ( = ?auto_166320 ?auto_166321 ) ) ( ON ?auto_166319 ?auto_166320 ) ( ON ?auto_166318 ?auto_166319 ) ( ON ?auto_166317 ?auto_166318 ) ( CLEAR ?auto_166315 ) ( ON ?auto_166316 ?auto_166317 ) ( CLEAR ?auto_166316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166309 ?auto_166310 ?auto_166311 ?auto_166312 ?auto_166313 ?auto_166314 ?auto_166315 ?auto_166316 )
      ( MAKE-12PILE ?auto_166309 ?auto_166310 ?auto_166311 ?auto_166312 ?auto_166313 ?auto_166314 ?auto_166315 ?auto_166316 ?auto_166317 ?auto_166318 ?auto_166319 ?auto_166320 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166334 - BLOCK
      ?auto_166335 - BLOCK
      ?auto_166336 - BLOCK
      ?auto_166337 - BLOCK
      ?auto_166338 - BLOCK
      ?auto_166339 - BLOCK
      ?auto_166340 - BLOCK
      ?auto_166341 - BLOCK
      ?auto_166342 - BLOCK
      ?auto_166343 - BLOCK
      ?auto_166344 - BLOCK
      ?auto_166345 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166345 ) ( ON-TABLE ?auto_166334 ) ( ON ?auto_166335 ?auto_166334 ) ( ON ?auto_166336 ?auto_166335 ) ( ON ?auto_166337 ?auto_166336 ) ( ON ?auto_166338 ?auto_166337 ) ( ON ?auto_166339 ?auto_166338 ) ( ON ?auto_166340 ?auto_166339 ) ( not ( = ?auto_166334 ?auto_166335 ) ) ( not ( = ?auto_166334 ?auto_166336 ) ) ( not ( = ?auto_166334 ?auto_166337 ) ) ( not ( = ?auto_166334 ?auto_166338 ) ) ( not ( = ?auto_166334 ?auto_166339 ) ) ( not ( = ?auto_166334 ?auto_166340 ) ) ( not ( = ?auto_166334 ?auto_166341 ) ) ( not ( = ?auto_166334 ?auto_166342 ) ) ( not ( = ?auto_166334 ?auto_166343 ) ) ( not ( = ?auto_166334 ?auto_166344 ) ) ( not ( = ?auto_166334 ?auto_166345 ) ) ( not ( = ?auto_166335 ?auto_166336 ) ) ( not ( = ?auto_166335 ?auto_166337 ) ) ( not ( = ?auto_166335 ?auto_166338 ) ) ( not ( = ?auto_166335 ?auto_166339 ) ) ( not ( = ?auto_166335 ?auto_166340 ) ) ( not ( = ?auto_166335 ?auto_166341 ) ) ( not ( = ?auto_166335 ?auto_166342 ) ) ( not ( = ?auto_166335 ?auto_166343 ) ) ( not ( = ?auto_166335 ?auto_166344 ) ) ( not ( = ?auto_166335 ?auto_166345 ) ) ( not ( = ?auto_166336 ?auto_166337 ) ) ( not ( = ?auto_166336 ?auto_166338 ) ) ( not ( = ?auto_166336 ?auto_166339 ) ) ( not ( = ?auto_166336 ?auto_166340 ) ) ( not ( = ?auto_166336 ?auto_166341 ) ) ( not ( = ?auto_166336 ?auto_166342 ) ) ( not ( = ?auto_166336 ?auto_166343 ) ) ( not ( = ?auto_166336 ?auto_166344 ) ) ( not ( = ?auto_166336 ?auto_166345 ) ) ( not ( = ?auto_166337 ?auto_166338 ) ) ( not ( = ?auto_166337 ?auto_166339 ) ) ( not ( = ?auto_166337 ?auto_166340 ) ) ( not ( = ?auto_166337 ?auto_166341 ) ) ( not ( = ?auto_166337 ?auto_166342 ) ) ( not ( = ?auto_166337 ?auto_166343 ) ) ( not ( = ?auto_166337 ?auto_166344 ) ) ( not ( = ?auto_166337 ?auto_166345 ) ) ( not ( = ?auto_166338 ?auto_166339 ) ) ( not ( = ?auto_166338 ?auto_166340 ) ) ( not ( = ?auto_166338 ?auto_166341 ) ) ( not ( = ?auto_166338 ?auto_166342 ) ) ( not ( = ?auto_166338 ?auto_166343 ) ) ( not ( = ?auto_166338 ?auto_166344 ) ) ( not ( = ?auto_166338 ?auto_166345 ) ) ( not ( = ?auto_166339 ?auto_166340 ) ) ( not ( = ?auto_166339 ?auto_166341 ) ) ( not ( = ?auto_166339 ?auto_166342 ) ) ( not ( = ?auto_166339 ?auto_166343 ) ) ( not ( = ?auto_166339 ?auto_166344 ) ) ( not ( = ?auto_166339 ?auto_166345 ) ) ( not ( = ?auto_166340 ?auto_166341 ) ) ( not ( = ?auto_166340 ?auto_166342 ) ) ( not ( = ?auto_166340 ?auto_166343 ) ) ( not ( = ?auto_166340 ?auto_166344 ) ) ( not ( = ?auto_166340 ?auto_166345 ) ) ( not ( = ?auto_166341 ?auto_166342 ) ) ( not ( = ?auto_166341 ?auto_166343 ) ) ( not ( = ?auto_166341 ?auto_166344 ) ) ( not ( = ?auto_166341 ?auto_166345 ) ) ( not ( = ?auto_166342 ?auto_166343 ) ) ( not ( = ?auto_166342 ?auto_166344 ) ) ( not ( = ?auto_166342 ?auto_166345 ) ) ( not ( = ?auto_166343 ?auto_166344 ) ) ( not ( = ?auto_166343 ?auto_166345 ) ) ( not ( = ?auto_166344 ?auto_166345 ) ) ( ON ?auto_166344 ?auto_166345 ) ( ON ?auto_166343 ?auto_166344 ) ( ON ?auto_166342 ?auto_166343 ) ( CLEAR ?auto_166340 ) ( ON ?auto_166341 ?auto_166342 ) ( CLEAR ?auto_166341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166334 ?auto_166335 ?auto_166336 ?auto_166337 ?auto_166338 ?auto_166339 ?auto_166340 ?auto_166341 )
      ( MAKE-12PILE ?auto_166334 ?auto_166335 ?auto_166336 ?auto_166337 ?auto_166338 ?auto_166339 ?auto_166340 ?auto_166341 ?auto_166342 ?auto_166343 ?auto_166344 ?auto_166345 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166358 - BLOCK
      ?auto_166359 - BLOCK
      ?auto_166360 - BLOCK
      ?auto_166361 - BLOCK
      ?auto_166362 - BLOCK
      ?auto_166363 - BLOCK
      ?auto_166364 - BLOCK
      ?auto_166365 - BLOCK
      ?auto_166366 - BLOCK
      ?auto_166367 - BLOCK
      ?auto_166368 - BLOCK
      ?auto_166369 - BLOCK
    )
    :vars
    (
      ?auto_166370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166369 ?auto_166370 ) ( ON-TABLE ?auto_166358 ) ( ON ?auto_166359 ?auto_166358 ) ( ON ?auto_166360 ?auto_166359 ) ( ON ?auto_166361 ?auto_166360 ) ( ON ?auto_166362 ?auto_166361 ) ( ON ?auto_166363 ?auto_166362 ) ( not ( = ?auto_166358 ?auto_166359 ) ) ( not ( = ?auto_166358 ?auto_166360 ) ) ( not ( = ?auto_166358 ?auto_166361 ) ) ( not ( = ?auto_166358 ?auto_166362 ) ) ( not ( = ?auto_166358 ?auto_166363 ) ) ( not ( = ?auto_166358 ?auto_166364 ) ) ( not ( = ?auto_166358 ?auto_166365 ) ) ( not ( = ?auto_166358 ?auto_166366 ) ) ( not ( = ?auto_166358 ?auto_166367 ) ) ( not ( = ?auto_166358 ?auto_166368 ) ) ( not ( = ?auto_166358 ?auto_166369 ) ) ( not ( = ?auto_166358 ?auto_166370 ) ) ( not ( = ?auto_166359 ?auto_166360 ) ) ( not ( = ?auto_166359 ?auto_166361 ) ) ( not ( = ?auto_166359 ?auto_166362 ) ) ( not ( = ?auto_166359 ?auto_166363 ) ) ( not ( = ?auto_166359 ?auto_166364 ) ) ( not ( = ?auto_166359 ?auto_166365 ) ) ( not ( = ?auto_166359 ?auto_166366 ) ) ( not ( = ?auto_166359 ?auto_166367 ) ) ( not ( = ?auto_166359 ?auto_166368 ) ) ( not ( = ?auto_166359 ?auto_166369 ) ) ( not ( = ?auto_166359 ?auto_166370 ) ) ( not ( = ?auto_166360 ?auto_166361 ) ) ( not ( = ?auto_166360 ?auto_166362 ) ) ( not ( = ?auto_166360 ?auto_166363 ) ) ( not ( = ?auto_166360 ?auto_166364 ) ) ( not ( = ?auto_166360 ?auto_166365 ) ) ( not ( = ?auto_166360 ?auto_166366 ) ) ( not ( = ?auto_166360 ?auto_166367 ) ) ( not ( = ?auto_166360 ?auto_166368 ) ) ( not ( = ?auto_166360 ?auto_166369 ) ) ( not ( = ?auto_166360 ?auto_166370 ) ) ( not ( = ?auto_166361 ?auto_166362 ) ) ( not ( = ?auto_166361 ?auto_166363 ) ) ( not ( = ?auto_166361 ?auto_166364 ) ) ( not ( = ?auto_166361 ?auto_166365 ) ) ( not ( = ?auto_166361 ?auto_166366 ) ) ( not ( = ?auto_166361 ?auto_166367 ) ) ( not ( = ?auto_166361 ?auto_166368 ) ) ( not ( = ?auto_166361 ?auto_166369 ) ) ( not ( = ?auto_166361 ?auto_166370 ) ) ( not ( = ?auto_166362 ?auto_166363 ) ) ( not ( = ?auto_166362 ?auto_166364 ) ) ( not ( = ?auto_166362 ?auto_166365 ) ) ( not ( = ?auto_166362 ?auto_166366 ) ) ( not ( = ?auto_166362 ?auto_166367 ) ) ( not ( = ?auto_166362 ?auto_166368 ) ) ( not ( = ?auto_166362 ?auto_166369 ) ) ( not ( = ?auto_166362 ?auto_166370 ) ) ( not ( = ?auto_166363 ?auto_166364 ) ) ( not ( = ?auto_166363 ?auto_166365 ) ) ( not ( = ?auto_166363 ?auto_166366 ) ) ( not ( = ?auto_166363 ?auto_166367 ) ) ( not ( = ?auto_166363 ?auto_166368 ) ) ( not ( = ?auto_166363 ?auto_166369 ) ) ( not ( = ?auto_166363 ?auto_166370 ) ) ( not ( = ?auto_166364 ?auto_166365 ) ) ( not ( = ?auto_166364 ?auto_166366 ) ) ( not ( = ?auto_166364 ?auto_166367 ) ) ( not ( = ?auto_166364 ?auto_166368 ) ) ( not ( = ?auto_166364 ?auto_166369 ) ) ( not ( = ?auto_166364 ?auto_166370 ) ) ( not ( = ?auto_166365 ?auto_166366 ) ) ( not ( = ?auto_166365 ?auto_166367 ) ) ( not ( = ?auto_166365 ?auto_166368 ) ) ( not ( = ?auto_166365 ?auto_166369 ) ) ( not ( = ?auto_166365 ?auto_166370 ) ) ( not ( = ?auto_166366 ?auto_166367 ) ) ( not ( = ?auto_166366 ?auto_166368 ) ) ( not ( = ?auto_166366 ?auto_166369 ) ) ( not ( = ?auto_166366 ?auto_166370 ) ) ( not ( = ?auto_166367 ?auto_166368 ) ) ( not ( = ?auto_166367 ?auto_166369 ) ) ( not ( = ?auto_166367 ?auto_166370 ) ) ( not ( = ?auto_166368 ?auto_166369 ) ) ( not ( = ?auto_166368 ?auto_166370 ) ) ( not ( = ?auto_166369 ?auto_166370 ) ) ( ON ?auto_166368 ?auto_166369 ) ( ON ?auto_166367 ?auto_166368 ) ( ON ?auto_166366 ?auto_166367 ) ( ON ?auto_166365 ?auto_166366 ) ( CLEAR ?auto_166363 ) ( ON ?auto_166364 ?auto_166365 ) ( CLEAR ?auto_166364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166358 ?auto_166359 ?auto_166360 ?auto_166361 ?auto_166362 ?auto_166363 ?auto_166364 )
      ( MAKE-12PILE ?auto_166358 ?auto_166359 ?auto_166360 ?auto_166361 ?auto_166362 ?auto_166363 ?auto_166364 ?auto_166365 ?auto_166366 ?auto_166367 ?auto_166368 ?auto_166369 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166383 - BLOCK
      ?auto_166384 - BLOCK
      ?auto_166385 - BLOCK
      ?auto_166386 - BLOCK
      ?auto_166387 - BLOCK
      ?auto_166388 - BLOCK
      ?auto_166389 - BLOCK
      ?auto_166390 - BLOCK
      ?auto_166391 - BLOCK
      ?auto_166392 - BLOCK
      ?auto_166393 - BLOCK
      ?auto_166394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166394 ) ( ON-TABLE ?auto_166383 ) ( ON ?auto_166384 ?auto_166383 ) ( ON ?auto_166385 ?auto_166384 ) ( ON ?auto_166386 ?auto_166385 ) ( ON ?auto_166387 ?auto_166386 ) ( ON ?auto_166388 ?auto_166387 ) ( not ( = ?auto_166383 ?auto_166384 ) ) ( not ( = ?auto_166383 ?auto_166385 ) ) ( not ( = ?auto_166383 ?auto_166386 ) ) ( not ( = ?auto_166383 ?auto_166387 ) ) ( not ( = ?auto_166383 ?auto_166388 ) ) ( not ( = ?auto_166383 ?auto_166389 ) ) ( not ( = ?auto_166383 ?auto_166390 ) ) ( not ( = ?auto_166383 ?auto_166391 ) ) ( not ( = ?auto_166383 ?auto_166392 ) ) ( not ( = ?auto_166383 ?auto_166393 ) ) ( not ( = ?auto_166383 ?auto_166394 ) ) ( not ( = ?auto_166384 ?auto_166385 ) ) ( not ( = ?auto_166384 ?auto_166386 ) ) ( not ( = ?auto_166384 ?auto_166387 ) ) ( not ( = ?auto_166384 ?auto_166388 ) ) ( not ( = ?auto_166384 ?auto_166389 ) ) ( not ( = ?auto_166384 ?auto_166390 ) ) ( not ( = ?auto_166384 ?auto_166391 ) ) ( not ( = ?auto_166384 ?auto_166392 ) ) ( not ( = ?auto_166384 ?auto_166393 ) ) ( not ( = ?auto_166384 ?auto_166394 ) ) ( not ( = ?auto_166385 ?auto_166386 ) ) ( not ( = ?auto_166385 ?auto_166387 ) ) ( not ( = ?auto_166385 ?auto_166388 ) ) ( not ( = ?auto_166385 ?auto_166389 ) ) ( not ( = ?auto_166385 ?auto_166390 ) ) ( not ( = ?auto_166385 ?auto_166391 ) ) ( not ( = ?auto_166385 ?auto_166392 ) ) ( not ( = ?auto_166385 ?auto_166393 ) ) ( not ( = ?auto_166385 ?auto_166394 ) ) ( not ( = ?auto_166386 ?auto_166387 ) ) ( not ( = ?auto_166386 ?auto_166388 ) ) ( not ( = ?auto_166386 ?auto_166389 ) ) ( not ( = ?auto_166386 ?auto_166390 ) ) ( not ( = ?auto_166386 ?auto_166391 ) ) ( not ( = ?auto_166386 ?auto_166392 ) ) ( not ( = ?auto_166386 ?auto_166393 ) ) ( not ( = ?auto_166386 ?auto_166394 ) ) ( not ( = ?auto_166387 ?auto_166388 ) ) ( not ( = ?auto_166387 ?auto_166389 ) ) ( not ( = ?auto_166387 ?auto_166390 ) ) ( not ( = ?auto_166387 ?auto_166391 ) ) ( not ( = ?auto_166387 ?auto_166392 ) ) ( not ( = ?auto_166387 ?auto_166393 ) ) ( not ( = ?auto_166387 ?auto_166394 ) ) ( not ( = ?auto_166388 ?auto_166389 ) ) ( not ( = ?auto_166388 ?auto_166390 ) ) ( not ( = ?auto_166388 ?auto_166391 ) ) ( not ( = ?auto_166388 ?auto_166392 ) ) ( not ( = ?auto_166388 ?auto_166393 ) ) ( not ( = ?auto_166388 ?auto_166394 ) ) ( not ( = ?auto_166389 ?auto_166390 ) ) ( not ( = ?auto_166389 ?auto_166391 ) ) ( not ( = ?auto_166389 ?auto_166392 ) ) ( not ( = ?auto_166389 ?auto_166393 ) ) ( not ( = ?auto_166389 ?auto_166394 ) ) ( not ( = ?auto_166390 ?auto_166391 ) ) ( not ( = ?auto_166390 ?auto_166392 ) ) ( not ( = ?auto_166390 ?auto_166393 ) ) ( not ( = ?auto_166390 ?auto_166394 ) ) ( not ( = ?auto_166391 ?auto_166392 ) ) ( not ( = ?auto_166391 ?auto_166393 ) ) ( not ( = ?auto_166391 ?auto_166394 ) ) ( not ( = ?auto_166392 ?auto_166393 ) ) ( not ( = ?auto_166392 ?auto_166394 ) ) ( not ( = ?auto_166393 ?auto_166394 ) ) ( ON ?auto_166393 ?auto_166394 ) ( ON ?auto_166392 ?auto_166393 ) ( ON ?auto_166391 ?auto_166392 ) ( ON ?auto_166390 ?auto_166391 ) ( CLEAR ?auto_166388 ) ( ON ?auto_166389 ?auto_166390 ) ( CLEAR ?auto_166389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166383 ?auto_166384 ?auto_166385 ?auto_166386 ?auto_166387 ?auto_166388 ?auto_166389 )
      ( MAKE-12PILE ?auto_166383 ?auto_166384 ?auto_166385 ?auto_166386 ?auto_166387 ?auto_166388 ?auto_166389 ?auto_166390 ?auto_166391 ?auto_166392 ?auto_166393 ?auto_166394 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166407 - BLOCK
      ?auto_166408 - BLOCK
      ?auto_166409 - BLOCK
      ?auto_166410 - BLOCK
      ?auto_166411 - BLOCK
      ?auto_166412 - BLOCK
      ?auto_166413 - BLOCK
      ?auto_166414 - BLOCK
      ?auto_166415 - BLOCK
      ?auto_166416 - BLOCK
      ?auto_166417 - BLOCK
      ?auto_166418 - BLOCK
    )
    :vars
    (
      ?auto_166419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166418 ?auto_166419 ) ( ON-TABLE ?auto_166407 ) ( ON ?auto_166408 ?auto_166407 ) ( ON ?auto_166409 ?auto_166408 ) ( ON ?auto_166410 ?auto_166409 ) ( ON ?auto_166411 ?auto_166410 ) ( not ( = ?auto_166407 ?auto_166408 ) ) ( not ( = ?auto_166407 ?auto_166409 ) ) ( not ( = ?auto_166407 ?auto_166410 ) ) ( not ( = ?auto_166407 ?auto_166411 ) ) ( not ( = ?auto_166407 ?auto_166412 ) ) ( not ( = ?auto_166407 ?auto_166413 ) ) ( not ( = ?auto_166407 ?auto_166414 ) ) ( not ( = ?auto_166407 ?auto_166415 ) ) ( not ( = ?auto_166407 ?auto_166416 ) ) ( not ( = ?auto_166407 ?auto_166417 ) ) ( not ( = ?auto_166407 ?auto_166418 ) ) ( not ( = ?auto_166407 ?auto_166419 ) ) ( not ( = ?auto_166408 ?auto_166409 ) ) ( not ( = ?auto_166408 ?auto_166410 ) ) ( not ( = ?auto_166408 ?auto_166411 ) ) ( not ( = ?auto_166408 ?auto_166412 ) ) ( not ( = ?auto_166408 ?auto_166413 ) ) ( not ( = ?auto_166408 ?auto_166414 ) ) ( not ( = ?auto_166408 ?auto_166415 ) ) ( not ( = ?auto_166408 ?auto_166416 ) ) ( not ( = ?auto_166408 ?auto_166417 ) ) ( not ( = ?auto_166408 ?auto_166418 ) ) ( not ( = ?auto_166408 ?auto_166419 ) ) ( not ( = ?auto_166409 ?auto_166410 ) ) ( not ( = ?auto_166409 ?auto_166411 ) ) ( not ( = ?auto_166409 ?auto_166412 ) ) ( not ( = ?auto_166409 ?auto_166413 ) ) ( not ( = ?auto_166409 ?auto_166414 ) ) ( not ( = ?auto_166409 ?auto_166415 ) ) ( not ( = ?auto_166409 ?auto_166416 ) ) ( not ( = ?auto_166409 ?auto_166417 ) ) ( not ( = ?auto_166409 ?auto_166418 ) ) ( not ( = ?auto_166409 ?auto_166419 ) ) ( not ( = ?auto_166410 ?auto_166411 ) ) ( not ( = ?auto_166410 ?auto_166412 ) ) ( not ( = ?auto_166410 ?auto_166413 ) ) ( not ( = ?auto_166410 ?auto_166414 ) ) ( not ( = ?auto_166410 ?auto_166415 ) ) ( not ( = ?auto_166410 ?auto_166416 ) ) ( not ( = ?auto_166410 ?auto_166417 ) ) ( not ( = ?auto_166410 ?auto_166418 ) ) ( not ( = ?auto_166410 ?auto_166419 ) ) ( not ( = ?auto_166411 ?auto_166412 ) ) ( not ( = ?auto_166411 ?auto_166413 ) ) ( not ( = ?auto_166411 ?auto_166414 ) ) ( not ( = ?auto_166411 ?auto_166415 ) ) ( not ( = ?auto_166411 ?auto_166416 ) ) ( not ( = ?auto_166411 ?auto_166417 ) ) ( not ( = ?auto_166411 ?auto_166418 ) ) ( not ( = ?auto_166411 ?auto_166419 ) ) ( not ( = ?auto_166412 ?auto_166413 ) ) ( not ( = ?auto_166412 ?auto_166414 ) ) ( not ( = ?auto_166412 ?auto_166415 ) ) ( not ( = ?auto_166412 ?auto_166416 ) ) ( not ( = ?auto_166412 ?auto_166417 ) ) ( not ( = ?auto_166412 ?auto_166418 ) ) ( not ( = ?auto_166412 ?auto_166419 ) ) ( not ( = ?auto_166413 ?auto_166414 ) ) ( not ( = ?auto_166413 ?auto_166415 ) ) ( not ( = ?auto_166413 ?auto_166416 ) ) ( not ( = ?auto_166413 ?auto_166417 ) ) ( not ( = ?auto_166413 ?auto_166418 ) ) ( not ( = ?auto_166413 ?auto_166419 ) ) ( not ( = ?auto_166414 ?auto_166415 ) ) ( not ( = ?auto_166414 ?auto_166416 ) ) ( not ( = ?auto_166414 ?auto_166417 ) ) ( not ( = ?auto_166414 ?auto_166418 ) ) ( not ( = ?auto_166414 ?auto_166419 ) ) ( not ( = ?auto_166415 ?auto_166416 ) ) ( not ( = ?auto_166415 ?auto_166417 ) ) ( not ( = ?auto_166415 ?auto_166418 ) ) ( not ( = ?auto_166415 ?auto_166419 ) ) ( not ( = ?auto_166416 ?auto_166417 ) ) ( not ( = ?auto_166416 ?auto_166418 ) ) ( not ( = ?auto_166416 ?auto_166419 ) ) ( not ( = ?auto_166417 ?auto_166418 ) ) ( not ( = ?auto_166417 ?auto_166419 ) ) ( not ( = ?auto_166418 ?auto_166419 ) ) ( ON ?auto_166417 ?auto_166418 ) ( ON ?auto_166416 ?auto_166417 ) ( ON ?auto_166415 ?auto_166416 ) ( ON ?auto_166414 ?auto_166415 ) ( ON ?auto_166413 ?auto_166414 ) ( CLEAR ?auto_166411 ) ( ON ?auto_166412 ?auto_166413 ) ( CLEAR ?auto_166412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166407 ?auto_166408 ?auto_166409 ?auto_166410 ?auto_166411 ?auto_166412 )
      ( MAKE-12PILE ?auto_166407 ?auto_166408 ?auto_166409 ?auto_166410 ?auto_166411 ?auto_166412 ?auto_166413 ?auto_166414 ?auto_166415 ?auto_166416 ?auto_166417 ?auto_166418 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166432 - BLOCK
      ?auto_166433 - BLOCK
      ?auto_166434 - BLOCK
      ?auto_166435 - BLOCK
      ?auto_166436 - BLOCK
      ?auto_166437 - BLOCK
      ?auto_166438 - BLOCK
      ?auto_166439 - BLOCK
      ?auto_166440 - BLOCK
      ?auto_166441 - BLOCK
      ?auto_166442 - BLOCK
      ?auto_166443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166443 ) ( ON-TABLE ?auto_166432 ) ( ON ?auto_166433 ?auto_166432 ) ( ON ?auto_166434 ?auto_166433 ) ( ON ?auto_166435 ?auto_166434 ) ( ON ?auto_166436 ?auto_166435 ) ( not ( = ?auto_166432 ?auto_166433 ) ) ( not ( = ?auto_166432 ?auto_166434 ) ) ( not ( = ?auto_166432 ?auto_166435 ) ) ( not ( = ?auto_166432 ?auto_166436 ) ) ( not ( = ?auto_166432 ?auto_166437 ) ) ( not ( = ?auto_166432 ?auto_166438 ) ) ( not ( = ?auto_166432 ?auto_166439 ) ) ( not ( = ?auto_166432 ?auto_166440 ) ) ( not ( = ?auto_166432 ?auto_166441 ) ) ( not ( = ?auto_166432 ?auto_166442 ) ) ( not ( = ?auto_166432 ?auto_166443 ) ) ( not ( = ?auto_166433 ?auto_166434 ) ) ( not ( = ?auto_166433 ?auto_166435 ) ) ( not ( = ?auto_166433 ?auto_166436 ) ) ( not ( = ?auto_166433 ?auto_166437 ) ) ( not ( = ?auto_166433 ?auto_166438 ) ) ( not ( = ?auto_166433 ?auto_166439 ) ) ( not ( = ?auto_166433 ?auto_166440 ) ) ( not ( = ?auto_166433 ?auto_166441 ) ) ( not ( = ?auto_166433 ?auto_166442 ) ) ( not ( = ?auto_166433 ?auto_166443 ) ) ( not ( = ?auto_166434 ?auto_166435 ) ) ( not ( = ?auto_166434 ?auto_166436 ) ) ( not ( = ?auto_166434 ?auto_166437 ) ) ( not ( = ?auto_166434 ?auto_166438 ) ) ( not ( = ?auto_166434 ?auto_166439 ) ) ( not ( = ?auto_166434 ?auto_166440 ) ) ( not ( = ?auto_166434 ?auto_166441 ) ) ( not ( = ?auto_166434 ?auto_166442 ) ) ( not ( = ?auto_166434 ?auto_166443 ) ) ( not ( = ?auto_166435 ?auto_166436 ) ) ( not ( = ?auto_166435 ?auto_166437 ) ) ( not ( = ?auto_166435 ?auto_166438 ) ) ( not ( = ?auto_166435 ?auto_166439 ) ) ( not ( = ?auto_166435 ?auto_166440 ) ) ( not ( = ?auto_166435 ?auto_166441 ) ) ( not ( = ?auto_166435 ?auto_166442 ) ) ( not ( = ?auto_166435 ?auto_166443 ) ) ( not ( = ?auto_166436 ?auto_166437 ) ) ( not ( = ?auto_166436 ?auto_166438 ) ) ( not ( = ?auto_166436 ?auto_166439 ) ) ( not ( = ?auto_166436 ?auto_166440 ) ) ( not ( = ?auto_166436 ?auto_166441 ) ) ( not ( = ?auto_166436 ?auto_166442 ) ) ( not ( = ?auto_166436 ?auto_166443 ) ) ( not ( = ?auto_166437 ?auto_166438 ) ) ( not ( = ?auto_166437 ?auto_166439 ) ) ( not ( = ?auto_166437 ?auto_166440 ) ) ( not ( = ?auto_166437 ?auto_166441 ) ) ( not ( = ?auto_166437 ?auto_166442 ) ) ( not ( = ?auto_166437 ?auto_166443 ) ) ( not ( = ?auto_166438 ?auto_166439 ) ) ( not ( = ?auto_166438 ?auto_166440 ) ) ( not ( = ?auto_166438 ?auto_166441 ) ) ( not ( = ?auto_166438 ?auto_166442 ) ) ( not ( = ?auto_166438 ?auto_166443 ) ) ( not ( = ?auto_166439 ?auto_166440 ) ) ( not ( = ?auto_166439 ?auto_166441 ) ) ( not ( = ?auto_166439 ?auto_166442 ) ) ( not ( = ?auto_166439 ?auto_166443 ) ) ( not ( = ?auto_166440 ?auto_166441 ) ) ( not ( = ?auto_166440 ?auto_166442 ) ) ( not ( = ?auto_166440 ?auto_166443 ) ) ( not ( = ?auto_166441 ?auto_166442 ) ) ( not ( = ?auto_166441 ?auto_166443 ) ) ( not ( = ?auto_166442 ?auto_166443 ) ) ( ON ?auto_166442 ?auto_166443 ) ( ON ?auto_166441 ?auto_166442 ) ( ON ?auto_166440 ?auto_166441 ) ( ON ?auto_166439 ?auto_166440 ) ( ON ?auto_166438 ?auto_166439 ) ( CLEAR ?auto_166436 ) ( ON ?auto_166437 ?auto_166438 ) ( CLEAR ?auto_166437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166432 ?auto_166433 ?auto_166434 ?auto_166435 ?auto_166436 ?auto_166437 )
      ( MAKE-12PILE ?auto_166432 ?auto_166433 ?auto_166434 ?auto_166435 ?auto_166436 ?auto_166437 ?auto_166438 ?auto_166439 ?auto_166440 ?auto_166441 ?auto_166442 ?auto_166443 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166456 - BLOCK
      ?auto_166457 - BLOCK
      ?auto_166458 - BLOCK
      ?auto_166459 - BLOCK
      ?auto_166460 - BLOCK
      ?auto_166461 - BLOCK
      ?auto_166462 - BLOCK
      ?auto_166463 - BLOCK
      ?auto_166464 - BLOCK
      ?auto_166465 - BLOCK
      ?auto_166466 - BLOCK
      ?auto_166467 - BLOCK
    )
    :vars
    (
      ?auto_166468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166467 ?auto_166468 ) ( ON-TABLE ?auto_166456 ) ( ON ?auto_166457 ?auto_166456 ) ( ON ?auto_166458 ?auto_166457 ) ( ON ?auto_166459 ?auto_166458 ) ( not ( = ?auto_166456 ?auto_166457 ) ) ( not ( = ?auto_166456 ?auto_166458 ) ) ( not ( = ?auto_166456 ?auto_166459 ) ) ( not ( = ?auto_166456 ?auto_166460 ) ) ( not ( = ?auto_166456 ?auto_166461 ) ) ( not ( = ?auto_166456 ?auto_166462 ) ) ( not ( = ?auto_166456 ?auto_166463 ) ) ( not ( = ?auto_166456 ?auto_166464 ) ) ( not ( = ?auto_166456 ?auto_166465 ) ) ( not ( = ?auto_166456 ?auto_166466 ) ) ( not ( = ?auto_166456 ?auto_166467 ) ) ( not ( = ?auto_166456 ?auto_166468 ) ) ( not ( = ?auto_166457 ?auto_166458 ) ) ( not ( = ?auto_166457 ?auto_166459 ) ) ( not ( = ?auto_166457 ?auto_166460 ) ) ( not ( = ?auto_166457 ?auto_166461 ) ) ( not ( = ?auto_166457 ?auto_166462 ) ) ( not ( = ?auto_166457 ?auto_166463 ) ) ( not ( = ?auto_166457 ?auto_166464 ) ) ( not ( = ?auto_166457 ?auto_166465 ) ) ( not ( = ?auto_166457 ?auto_166466 ) ) ( not ( = ?auto_166457 ?auto_166467 ) ) ( not ( = ?auto_166457 ?auto_166468 ) ) ( not ( = ?auto_166458 ?auto_166459 ) ) ( not ( = ?auto_166458 ?auto_166460 ) ) ( not ( = ?auto_166458 ?auto_166461 ) ) ( not ( = ?auto_166458 ?auto_166462 ) ) ( not ( = ?auto_166458 ?auto_166463 ) ) ( not ( = ?auto_166458 ?auto_166464 ) ) ( not ( = ?auto_166458 ?auto_166465 ) ) ( not ( = ?auto_166458 ?auto_166466 ) ) ( not ( = ?auto_166458 ?auto_166467 ) ) ( not ( = ?auto_166458 ?auto_166468 ) ) ( not ( = ?auto_166459 ?auto_166460 ) ) ( not ( = ?auto_166459 ?auto_166461 ) ) ( not ( = ?auto_166459 ?auto_166462 ) ) ( not ( = ?auto_166459 ?auto_166463 ) ) ( not ( = ?auto_166459 ?auto_166464 ) ) ( not ( = ?auto_166459 ?auto_166465 ) ) ( not ( = ?auto_166459 ?auto_166466 ) ) ( not ( = ?auto_166459 ?auto_166467 ) ) ( not ( = ?auto_166459 ?auto_166468 ) ) ( not ( = ?auto_166460 ?auto_166461 ) ) ( not ( = ?auto_166460 ?auto_166462 ) ) ( not ( = ?auto_166460 ?auto_166463 ) ) ( not ( = ?auto_166460 ?auto_166464 ) ) ( not ( = ?auto_166460 ?auto_166465 ) ) ( not ( = ?auto_166460 ?auto_166466 ) ) ( not ( = ?auto_166460 ?auto_166467 ) ) ( not ( = ?auto_166460 ?auto_166468 ) ) ( not ( = ?auto_166461 ?auto_166462 ) ) ( not ( = ?auto_166461 ?auto_166463 ) ) ( not ( = ?auto_166461 ?auto_166464 ) ) ( not ( = ?auto_166461 ?auto_166465 ) ) ( not ( = ?auto_166461 ?auto_166466 ) ) ( not ( = ?auto_166461 ?auto_166467 ) ) ( not ( = ?auto_166461 ?auto_166468 ) ) ( not ( = ?auto_166462 ?auto_166463 ) ) ( not ( = ?auto_166462 ?auto_166464 ) ) ( not ( = ?auto_166462 ?auto_166465 ) ) ( not ( = ?auto_166462 ?auto_166466 ) ) ( not ( = ?auto_166462 ?auto_166467 ) ) ( not ( = ?auto_166462 ?auto_166468 ) ) ( not ( = ?auto_166463 ?auto_166464 ) ) ( not ( = ?auto_166463 ?auto_166465 ) ) ( not ( = ?auto_166463 ?auto_166466 ) ) ( not ( = ?auto_166463 ?auto_166467 ) ) ( not ( = ?auto_166463 ?auto_166468 ) ) ( not ( = ?auto_166464 ?auto_166465 ) ) ( not ( = ?auto_166464 ?auto_166466 ) ) ( not ( = ?auto_166464 ?auto_166467 ) ) ( not ( = ?auto_166464 ?auto_166468 ) ) ( not ( = ?auto_166465 ?auto_166466 ) ) ( not ( = ?auto_166465 ?auto_166467 ) ) ( not ( = ?auto_166465 ?auto_166468 ) ) ( not ( = ?auto_166466 ?auto_166467 ) ) ( not ( = ?auto_166466 ?auto_166468 ) ) ( not ( = ?auto_166467 ?auto_166468 ) ) ( ON ?auto_166466 ?auto_166467 ) ( ON ?auto_166465 ?auto_166466 ) ( ON ?auto_166464 ?auto_166465 ) ( ON ?auto_166463 ?auto_166464 ) ( ON ?auto_166462 ?auto_166463 ) ( ON ?auto_166461 ?auto_166462 ) ( CLEAR ?auto_166459 ) ( ON ?auto_166460 ?auto_166461 ) ( CLEAR ?auto_166460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166456 ?auto_166457 ?auto_166458 ?auto_166459 ?auto_166460 )
      ( MAKE-12PILE ?auto_166456 ?auto_166457 ?auto_166458 ?auto_166459 ?auto_166460 ?auto_166461 ?auto_166462 ?auto_166463 ?auto_166464 ?auto_166465 ?auto_166466 ?auto_166467 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166481 - BLOCK
      ?auto_166482 - BLOCK
      ?auto_166483 - BLOCK
      ?auto_166484 - BLOCK
      ?auto_166485 - BLOCK
      ?auto_166486 - BLOCK
      ?auto_166487 - BLOCK
      ?auto_166488 - BLOCK
      ?auto_166489 - BLOCK
      ?auto_166490 - BLOCK
      ?auto_166491 - BLOCK
      ?auto_166492 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166492 ) ( ON-TABLE ?auto_166481 ) ( ON ?auto_166482 ?auto_166481 ) ( ON ?auto_166483 ?auto_166482 ) ( ON ?auto_166484 ?auto_166483 ) ( not ( = ?auto_166481 ?auto_166482 ) ) ( not ( = ?auto_166481 ?auto_166483 ) ) ( not ( = ?auto_166481 ?auto_166484 ) ) ( not ( = ?auto_166481 ?auto_166485 ) ) ( not ( = ?auto_166481 ?auto_166486 ) ) ( not ( = ?auto_166481 ?auto_166487 ) ) ( not ( = ?auto_166481 ?auto_166488 ) ) ( not ( = ?auto_166481 ?auto_166489 ) ) ( not ( = ?auto_166481 ?auto_166490 ) ) ( not ( = ?auto_166481 ?auto_166491 ) ) ( not ( = ?auto_166481 ?auto_166492 ) ) ( not ( = ?auto_166482 ?auto_166483 ) ) ( not ( = ?auto_166482 ?auto_166484 ) ) ( not ( = ?auto_166482 ?auto_166485 ) ) ( not ( = ?auto_166482 ?auto_166486 ) ) ( not ( = ?auto_166482 ?auto_166487 ) ) ( not ( = ?auto_166482 ?auto_166488 ) ) ( not ( = ?auto_166482 ?auto_166489 ) ) ( not ( = ?auto_166482 ?auto_166490 ) ) ( not ( = ?auto_166482 ?auto_166491 ) ) ( not ( = ?auto_166482 ?auto_166492 ) ) ( not ( = ?auto_166483 ?auto_166484 ) ) ( not ( = ?auto_166483 ?auto_166485 ) ) ( not ( = ?auto_166483 ?auto_166486 ) ) ( not ( = ?auto_166483 ?auto_166487 ) ) ( not ( = ?auto_166483 ?auto_166488 ) ) ( not ( = ?auto_166483 ?auto_166489 ) ) ( not ( = ?auto_166483 ?auto_166490 ) ) ( not ( = ?auto_166483 ?auto_166491 ) ) ( not ( = ?auto_166483 ?auto_166492 ) ) ( not ( = ?auto_166484 ?auto_166485 ) ) ( not ( = ?auto_166484 ?auto_166486 ) ) ( not ( = ?auto_166484 ?auto_166487 ) ) ( not ( = ?auto_166484 ?auto_166488 ) ) ( not ( = ?auto_166484 ?auto_166489 ) ) ( not ( = ?auto_166484 ?auto_166490 ) ) ( not ( = ?auto_166484 ?auto_166491 ) ) ( not ( = ?auto_166484 ?auto_166492 ) ) ( not ( = ?auto_166485 ?auto_166486 ) ) ( not ( = ?auto_166485 ?auto_166487 ) ) ( not ( = ?auto_166485 ?auto_166488 ) ) ( not ( = ?auto_166485 ?auto_166489 ) ) ( not ( = ?auto_166485 ?auto_166490 ) ) ( not ( = ?auto_166485 ?auto_166491 ) ) ( not ( = ?auto_166485 ?auto_166492 ) ) ( not ( = ?auto_166486 ?auto_166487 ) ) ( not ( = ?auto_166486 ?auto_166488 ) ) ( not ( = ?auto_166486 ?auto_166489 ) ) ( not ( = ?auto_166486 ?auto_166490 ) ) ( not ( = ?auto_166486 ?auto_166491 ) ) ( not ( = ?auto_166486 ?auto_166492 ) ) ( not ( = ?auto_166487 ?auto_166488 ) ) ( not ( = ?auto_166487 ?auto_166489 ) ) ( not ( = ?auto_166487 ?auto_166490 ) ) ( not ( = ?auto_166487 ?auto_166491 ) ) ( not ( = ?auto_166487 ?auto_166492 ) ) ( not ( = ?auto_166488 ?auto_166489 ) ) ( not ( = ?auto_166488 ?auto_166490 ) ) ( not ( = ?auto_166488 ?auto_166491 ) ) ( not ( = ?auto_166488 ?auto_166492 ) ) ( not ( = ?auto_166489 ?auto_166490 ) ) ( not ( = ?auto_166489 ?auto_166491 ) ) ( not ( = ?auto_166489 ?auto_166492 ) ) ( not ( = ?auto_166490 ?auto_166491 ) ) ( not ( = ?auto_166490 ?auto_166492 ) ) ( not ( = ?auto_166491 ?auto_166492 ) ) ( ON ?auto_166491 ?auto_166492 ) ( ON ?auto_166490 ?auto_166491 ) ( ON ?auto_166489 ?auto_166490 ) ( ON ?auto_166488 ?auto_166489 ) ( ON ?auto_166487 ?auto_166488 ) ( ON ?auto_166486 ?auto_166487 ) ( CLEAR ?auto_166484 ) ( ON ?auto_166485 ?auto_166486 ) ( CLEAR ?auto_166485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166481 ?auto_166482 ?auto_166483 ?auto_166484 ?auto_166485 )
      ( MAKE-12PILE ?auto_166481 ?auto_166482 ?auto_166483 ?auto_166484 ?auto_166485 ?auto_166486 ?auto_166487 ?auto_166488 ?auto_166489 ?auto_166490 ?auto_166491 ?auto_166492 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166505 - BLOCK
      ?auto_166506 - BLOCK
      ?auto_166507 - BLOCK
      ?auto_166508 - BLOCK
      ?auto_166509 - BLOCK
      ?auto_166510 - BLOCK
      ?auto_166511 - BLOCK
      ?auto_166512 - BLOCK
      ?auto_166513 - BLOCK
      ?auto_166514 - BLOCK
      ?auto_166515 - BLOCK
      ?auto_166516 - BLOCK
    )
    :vars
    (
      ?auto_166517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166516 ?auto_166517 ) ( ON-TABLE ?auto_166505 ) ( ON ?auto_166506 ?auto_166505 ) ( ON ?auto_166507 ?auto_166506 ) ( not ( = ?auto_166505 ?auto_166506 ) ) ( not ( = ?auto_166505 ?auto_166507 ) ) ( not ( = ?auto_166505 ?auto_166508 ) ) ( not ( = ?auto_166505 ?auto_166509 ) ) ( not ( = ?auto_166505 ?auto_166510 ) ) ( not ( = ?auto_166505 ?auto_166511 ) ) ( not ( = ?auto_166505 ?auto_166512 ) ) ( not ( = ?auto_166505 ?auto_166513 ) ) ( not ( = ?auto_166505 ?auto_166514 ) ) ( not ( = ?auto_166505 ?auto_166515 ) ) ( not ( = ?auto_166505 ?auto_166516 ) ) ( not ( = ?auto_166505 ?auto_166517 ) ) ( not ( = ?auto_166506 ?auto_166507 ) ) ( not ( = ?auto_166506 ?auto_166508 ) ) ( not ( = ?auto_166506 ?auto_166509 ) ) ( not ( = ?auto_166506 ?auto_166510 ) ) ( not ( = ?auto_166506 ?auto_166511 ) ) ( not ( = ?auto_166506 ?auto_166512 ) ) ( not ( = ?auto_166506 ?auto_166513 ) ) ( not ( = ?auto_166506 ?auto_166514 ) ) ( not ( = ?auto_166506 ?auto_166515 ) ) ( not ( = ?auto_166506 ?auto_166516 ) ) ( not ( = ?auto_166506 ?auto_166517 ) ) ( not ( = ?auto_166507 ?auto_166508 ) ) ( not ( = ?auto_166507 ?auto_166509 ) ) ( not ( = ?auto_166507 ?auto_166510 ) ) ( not ( = ?auto_166507 ?auto_166511 ) ) ( not ( = ?auto_166507 ?auto_166512 ) ) ( not ( = ?auto_166507 ?auto_166513 ) ) ( not ( = ?auto_166507 ?auto_166514 ) ) ( not ( = ?auto_166507 ?auto_166515 ) ) ( not ( = ?auto_166507 ?auto_166516 ) ) ( not ( = ?auto_166507 ?auto_166517 ) ) ( not ( = ?auto_166508 ?auto_166509 ) ) ( not ( = ?auto_166508 ?auto_166510 ) ) ( not ( = ?auto_166508 ?auto_166511 ) ) ( not ( = ?auto_166508 ?auto_166512 ) ) ( not ( = ?auto_166508 ?auto_166513 ) ) ( not ( = ?auto_166508 ?auto_166514 ) ) ( not ( = ?auto_166508 ?auto_166515 ) ) ( not ( = ?auto_166508 ?auto_166516 ) ) ( not ( = ?auto_166508 ?auto_166517 ) ) ( not ( = ?auto_166509 ?auto_166510 ) ) ( not ( = ?auto_166509 ?auto_166511 ) ) ( not ( = ?auto_166509 ?auto_166512 ) ) ( not ( = ?auto_166509 ?auto_166513 ) ) ( not ( = ?auto_166509 ?auto_166514 ) ) ( not ( = ?auto_166509 ?auto_166515 ) ) ( not ( = ?auto_166509 ?auto_166516 ) ) ( not ( = ?auto_166509 ?auto_166517 ) ) ( not ( = ?auto_166510 ?auto_166511 ) ) ( not ( = ?auto_166510 ?auto_166512 ) ) ( not ( = ?auto_166510 ?auto_166513 ) ) ( not ( = ?auto_166510 ?auto_166514 ) ) ( not ( = ?auto_166510 ?auto_166515 ) ) ( not ( = ?auto_166510 ?auto_166516 ) ) ( not ( = ?auto_166510 ?auto_166517 ) ) ( not ( = ?auto_166511 ?auto_166512 ) ) ( not ( = ?auto_166511 ?auto_166513 ) ) ( not ( = ?auto_166511 ?auto_166514 ) ) ( not ( = ?auto_166511 ?auto_166515 ) ) ( not ( = ?auto_166511 ?auto_166516 ) ) ( not ( = ?auto_166511 ?auto_166517 ) ) ( not ( = ?auto_166512 ?auto_166513 ) ) ( not ( = ?auto_166512 ?auto_166514 ) ) ( not ( = ?auto_166512 ?auto_166515 ) ) ( not ( = ?auto_166512 ?auto_166516 ) ) ( not ( = ?auto_166512 ?auto_166517 ) ) ( not ( = ?auto_166513 ?auto_166514 ) ) ( not ( = ?auto_166513 ?auto_166515 ) ) ( not ( = ?auto_166513 ?auto_166516 ) ) ( not ( = ?auto_166513 ?auto_166517 ) ) ( not ( = ?auto_166514 ?auto_166515 ) ) ( not ( = ?auto_166514 ?auto_166516 ) ) ( not ( = ?auto_166514 ?auto_166517 ) ) ( not ( = ?auto_166515 ?auto_166516 ) ) ( not ( = ?auto_166515 ?auto_166517 ) ) ( not ( = ?auto_166516 ?auto_166517 ) ) ( ON ?auto_166515 ?auto_166516 ) ( ON ?auto_166514 ?auto_166515 ) ( ON ?auto_166513 ?auto_166514 ) ( ON ?auto_166512 ?auto_166513 ) ( ON ?auto_166511 ?auto_166512 ) ( ON ?auto_166510 ?auto_166511 ) ( ON ?auto_166509 ?auto_166510 ) ( CLEAR ?auto_166507 ) ( ON ?auto_166508 ?auto_166509 ) ( CLEAR ?auto_166508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166505 ?auto_166506 ?auto_166507 ?auto_166508 )
      ( MAKE-12PILE ?auto_166505 ?auto_166506 ?auto_166507 ?auto_166508 ?auto_166509 ?auto_166510 ?auto_166511 ?auto_166512 ?auto_166513 ?auto_166514 ?auto_166515 ?auto_166516 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166530 - BLOCK
      ?auto_166531 - BLOCK
      ?auto_166532 - BLOCK
      ?auto_166533 - BLOCK
      ?auto_166534 - BLOCK
      ?auto_166535 - BLOCK
      ?auto_166536 - BLOCK
      ?auto_166537 - BLOCK
      ?auto_166538 - BLOCK
      ?auto_166539 - BLOCK
      ?auto_166540 - BLOCK
      ?auto_166541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166541 ) ( ON-TABLE ?auto_166530 ) ( ON ?auto_166531 ?auto_166530 ) ( ON ?auto_166532 ?auto_166531 ) ( not ( = ?auto_166530 ?auto_166531 ) ) ( not ( = ?auto_166530 ?auto_166532 ) ) ( not ( = ?auto_166530 ?auto_166533 ) ) ( not ( = ?auto_166530 ?auto_166534 ) ) ( not ( = ?auto_166530 ?auto_166535 ) ) ( not ( = ?auto_166530 ?auto_166536 ) ) ( not ( = ?auto_166530 ?auto_166537 ) ) ( not ( = ?auto_166530 ?auto_166538 ) ) ( not ( = ?auto_166530 ?auto_166539 ) ) ( not ( = ?auto_166530 ?auto_166540 ) ) ( not ( = ?auto_166530 ?auto_166541 ) ) ( not ( = ?auto_166531 ?auto_166532 ) ) ( not ( = ?auto_166531 ?auto_166533 ) ) ( not ( = ?auto_166531 ?auto_166534 ) ) ( not ( = ?auto_166531 ?auto_166535 ) ) ( not ( = ?auto_166531 ?auto_166536 ) ) ( not ( = ?auto_166531 ?auto_166537 ) ) ( not ( = ?auto_166531 ?auto_166538 ) ) ( not ( = ?auto_166531 ?auto_166539 ) ) ( not ( = ?auto_166531 ?auto_166540 ) ) ( not ( = ?auto_166531 ?auto_166541 ) ) ( not ( = ?auto_166532 ?auto_166533 ) ) ( not ( = ?auto_166532 ?auto_166534 ) ) ( not ( = ?auto_166532 ?auto_166535 ) ) ( not ( = ?auto_166532 ?auto_166536 ) ) ( not ( = ?auto_166532 ?auto_166537 ) ) ( not ( = ?auto_166532 ?auto_166538 ) ) ( not ( = ?auto_166532 ?auto_166539 ) ) ( not ( = ?auto_166532 ?auto_166540 ) ) ( not ( = ?auto_166532 ?auto_166541 ) ) ( not ( = ?auto_166533 ?auto_166534 ) ) ( not ( = ?auto_166533 ?auto_166535 ) ) ( not ( = ?auto_166533 ?auto_166536 ) ) ( not ( = ?auto_166533 ?auto_166537 ) ) ( not ( = ?auto_166533 ?auto_166538 ) ) ( not ( = ?auto_166533 ?auto_166539 ) ) ( not ( = ?auto_166533 ?auto_166540 ) ) ( not ( = ?auto_166533 ?auto_166541 ) ) ( not ( = ?auto_166534 ?auto_166535 ) ) ( not ( = ?auto_166534 ?auto_166536 ) ) ( not ( = ?auto_166534 ?auto_166537 ) ) ( not ( = ?auto_166534 ?auto_166538 ) ) ( not ( = ?auto_166534 ?auto_166539 ) ) ( not ( = ?auto_166534 ?auto_166540 ) ) ( not ( = ?auto_166534 ?auto_166541 ) ) ( not ( = ?auto_166535 ?auto_166536 ) ) ( not ( = ?auto_166535 ?auto_166537 ) ) ( not ( = ?auto_166535 ?auto_166538 ) ) ( not ( = ?auto_166535 ?auto_166539 ) ) ( not ( = ?auto_166535 ?auto_166540 ) ) ( not ( = ?auto_166535 ?auto_166541 ) ) ( not ( = ?auto_166536 ?auto_166537 ) ) ( not ( = ?auto_166536 ?auto_166538 ) ) ( not ( = ?auto_166536 ?auto_166539 ) ) ( not ( = ?auto_166536 ?auto_166540 ) ) ( not ( = ?auto_166536 ?auto_166541 ) ) ( not ( = ?auto_166537 ?auto_166538 ) ) ( not ( = ?auto_166537 ?auto_166539 ) ) ( not ( = ?auto_166537 ?auto_166540 ) ) ( not ( = ?auto_166537 ?auto_166541 ) ) ( not ( = ?auto_166538 ?auto_166539 ) ) ( not ( = ?auto_166538 ?auto_166540 ) ) ( not ( = ?auto_166538 ?auto_166541 ) ) ( not ( = ?auto_166539 ?auto_166540 ) ) ( not ( = ?auto_166539 ?auto_166541 ) ) ( not ( = ?auto_166540 ?auto_166541 ) ) ( ON ?auto_166540 ?auto_166541 ) ( ON ?auto_166539 ?auto_166540 ) ( ON ?auto_166538 ?auto_166539 ) ( ON ?auto_166537 ?auto_166538 ) ( ON ?auto_166536 ?auto_166537 ) ( ON ?auto_166535 ?auto_166536 ) ( ON ?auto_166534 ?auto_166535 ) ( CLEAR ?auto_166532 ) ( ON ?auto_166533 ?auto_166534 ) ( CLEAR ?auto_166533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166530 ?auto_166531 ?auto_166532 ?auto_166533 )
      ( MAKE-12PILE ?auto_166530 ?auto_166531 ?auto_166532 ?auto_166533 ?auto_166534 ?auto_166535 ?auto_166536 ?auto_166537 ?auto_166538 ?auto_166539 ?auto_166540 ?auto_166541 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166554 - BLOCK
      ?auto_166555 - BLOCK
      ?auto_166556 - BLOCK
      ?auto_166557 - BLOCK
      ?auto_166558 - BLOCK
      ?auto_166559 - BLOCK
      ?auto_166560 - BLOCK
      ?auto_166561 - BLOCK
      ?auto_166562 - BLOCK
      ?auto_166563 - BLOCK
      ?auto_166564 - BLOCK
      ?auto_166565 - BLOCK
    )
    :vars
    (
      ?auto_166566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166565 ?auto_166566 ) ( ON-TABLE ?auto_166554 ) ( ON ?auto_166555 ?auto_166554 ) ( not ( = ?auto_166554 ?auto_166555 ) ) ( not ( = ?auto_166554 ?auto_166556 ) ) ( not ( = ?auto_166554 ?auto_166557 ) ) ( not ( = ?auto_166554 ?auto_166558 ) ) ( not ( = ?auto_166554 ?auto_166559 ) ) ( not ( = ?auto_166554 ?auto_166560 ) ) ( not ( = ?auto_166554 ?auto_166561 ) ) ( not ( = ?auto_166554 ?auto_166562 ) ) ( not ( = ?auto_166554 ?auto_166563 ) ) ( not ( = ?auto_166554 ?auto_166564 ) ) ( not ( = ?auto_166554 ?auto_166565 ) ) ( not ( = ?auto_166554 ?auto_166566 ) ) ( not ( = ?auto_166555 ?auto_166556 ) ) ( not ( = ?auto_166555 ?auto_166557 ) ) ( not ( = ?auto_166555 ?auto_166558 ) ) ( not ( = ?auto_166555 ?auto_166559 ) ) ( not ( = ?auto_166555 ?auto_166560 ) ) ( not ( = ?auto_166555 ?auto_166561 ) ) ( not ( = ?auto_166555 ?auto_166562 ) ) ( not ( = ?auto_166555 ?auto_166563 ) ) ( not ( = ?auto_166555 ?auto_166564 ) ) ( not ( = ?auto_166555 ?auto_166565 ) ) ( not ( = ?auto_166555 ?auto_166566 ) ) ( not ( = ?auto_166556 ?auto_166557 ) ) ( not ( = ?auto_166556 ?auto_166558 ) ) ( not ( = ?auto_166556 ?auto_166559 ) ) ( not ( = ?auto_166556 ?auto_166560 ) ) ( not ( = ?auto_166556 ?auto_166561 ) ) ( not ( = ?auto_166556 ?auto_166562 ) ) ( not ( = ?auto_166556 ?auto_166563 ) ) ( not ( = ?auto_166556 ?auto_166564 ) ) ( not ( = ?auto_166556 ?auto_166565 ) ) ( not ( = ?auto_166556 ?auto_166566 ) ) ( not ( = ?auto_166557 ?auto_166558 ) ) ( not ( = ?auto_166557 ?auto_166559 ) ) ( not ( = ?auto_166557 ?auto_166560 ) ) ( not ( = ?auto_166557 ?auto_166561 ) ) ( not ( = ?auto_166557 ?auto_166562 ) ) ( not ( = ?auto_166557 ?auto_166563 ) ) ( not ( = ?auto_166557 ?auto_166564 ) ) ( not ( = ?auto_166557 ?auto_166565 ) ) ( not ( = ?auto_166557 ?auto_166566 ) ) ( not ( = ?auto_166558 ?auto_166559 ) ) ( not ( = ?auto_166558 ?auto_166560 ) ) ( not ( = ?auto_166558 ?auto_166561 ) ) ( not ( = ?auto_166558 ?auto_166562 ) ) ( not ( = ?auto_166558 ?auto_166563 ) ) ( not ( = ?auto_166558 ?auto_166564 ) ) ( not ( = ?auto_166558 ?auto_166565 ) ) ( not ( = ?auto_166558 ?auto_166566 ) ) ( not ( = ?auto_166559 ?auto_166560 ) ) ( not ( = ?auto_166559 ?auto_166561 ) ) ( not ( = ?auto_166559 ?auto_166562 ) ) ( not ( = ?auto_166559 ?auto_166563 ) ) ( not ( = ?auto_166559 ?auto_166564 ) ) ( not ( = ?auto_166559 ?auto_166565 ) ) ( not ( = ?auto_166559 ?auto_166566 ) ) ( not ( = ?auto_166560 ?auto_166561 ) ) ( not ( = ?auto_166560 ?auto_166562 ) ) ( not ( = ?auto_166560 ?auto_166563 ) ) ( not ( = ?auto_166560 ?auto_166564 ) ) ( not ( = ?auto_166560 ?auto_166565 ) ) ( not ( = ?auto_166560 ?auto_166566 ) ) ( not ( = ?auto_166561 ?auto_166562 ) ) ( not ( = ?auto_166561 ?auto_166563 ) ) ( not ( = ?auto_166561 ?auto_166564 ) ) ( not ( = ?auto_166561 ?auto_166565 ) ) ( not ( = ?auto_166561 ?auto_166566 ) ) ( not ( = ?auto_166562 ?auto_166563 ) ) ( not ( = ?auto_166562 ?auto_166564 ) ) ( not ( = ?auto_166562 ?auto_166565 ) ) ( not ( = ?auto_166562 ?auto_166566 ) ) ( not ( = ?auto_166563 ?auto_166564 ) ) ( not ( = ?auto_166563 ?auto_166565 ) ) ( not ( = ?auto_166563 ?auto_166566 ) ) ( not ( = ?auto_166564 ?auto_166565 ) ) ( not ( = ?auto_166564 ?auto_166566 ) ) ( not ( = ?auto_166565 ?auto_166566 ) ) ( ON ?auto_166564 ?auto_166565 ) ( ON ?auto_166563 ?auto_166564 ) ( ON ?auto_166562 ?auto_166563 ) ( ON ?auto_166561 ?auto_166562 ) ( ON ?auto_166560 ?auto_166561 ) ( ON ?auto_166559 ?auto_166560 ) ( ON ?auto_166558 ?auto_166559 ) ( ON ?auto_166557 ?auto_166558 ) ( CLEAR ?auto_166555 ) ( ON ?auto_166556 ?auto_166557 ) ( CLEAR ?auto_166556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166554 ?auto_166555 ?auto_166556 )
      ( MAKE-12PILE ?auto_166554 ?auto_166555 ?auto_166556 ?auto_166557 ?auto_166558 ?auto_166559 ?auto_166560 ?auto_166561 ?auto_166562 ?auto_166563 ?auto_166564 ?auto_166565 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166579 - BLOCK
      ?auto_166580 - BLOCK
      ?auto_166581 - BLOCK
      ?auto_166582 - BLOCK
      ?auto_166583 - BLOCK
      ?auto_166584 - BLOCK
      ?auto_166585 - BLOCK
      ?auto_166586 - BLOCK
      ?auto_166587 - BLOCK
      ?auto_166588 - BLOCK
      ?auto_166589 - BLOCK
      ?auto_166590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166590 ) ( ON-TABLE ?auto_166579 ) ( ON ?auto_166580 ?auto_166579 ) ( not ( = ?auto_166579 ?auto_166580 ) ) ( not ( = ?auto_166579 ?auto_166581 ) ) ( not ( = ?auto_166579 ?auto_166582 ) ) ( not ( = ?auto_166579 ?auto_166583 ) ) ( not ( = ?auto_166579 ?auto_166584 ) ) ( not ( = ?auto_166579 ?auto_166585 ) ) ( not ( = ?auto_166579 ?auto_166586 ) ) ( not ( = ?auto_166579 ?auto_166587 ) ) ( not ( = ?auto_166579 ?auto_166588 ) ) ( not ( = ?auto_166579 ?auto_166589 ) ) ( not ( = ?auto_166579 ?auto_166590 ) ) ( not ( = ?auto_166580 ?auto_166581 ) ) ( not ( = ?auto_166580 ?auto_166582 ) ) ( not ( = ?auto_166580 ?auto_166583 ) ) ( not ( = ?auto_166580 ?auto_166584 ) ) ( not ( = ?auto_166580 ?auto_166585 ) ) ( not ( = ?auto_166580 ?auto_166586 ) ) ( not ( = ?auto_166580 ?auto_166587 ) ) ( not ( = ?auto_166580 ?auto_166588 ) ) ( not ( = ?auto_166580 ?auto_166589 ) ) ( not ( = ?auto_166580 ?auto_166590 ) ) ( not ( = ?auto_166581 ?auto_166582 ) ) ( not ( = ?auto_166581 ?auto_166583 ) ) ( not ( = ?auto_166581 ?auto_166584 ) ) ( not ( = ?auto_166581 ?auto_166585 ) ) ( not ( = ?auto_166581 ?auto_166586 ) ) ( not ( = ?auto_166581 ?auto_166587 ) ) ( not ( = ?auto_166581 ?auto_166588 ) ) ( not ( = ?auto_166581 ?auto_166589 ) ) ( not ( = ?auto_166581 ?auto_166590 ) ) ( not ( = ?auto_166582 ?auto_166583 ) ) ( not ( = ?auto_166582 ?auto_166584 ) ) ( not ( = ?auto_166582 ?auto_166585 ) ) ( not ( = ?auto_166582 ?auto_166586 ) ) ( not ( = ?auto_166582 ?auto_166587 ) ) ( not ( = ?auto_166582 ?auto_166588 ) ) ( not ( = ?auto_166582 ?auto_166589 ) ) ( not ( = ?auto_166582 ?auto_166590 ) ) ( not ( = ?auto_166583 ?auto_166584 ) ) ( not ( = ?auto_166583 ?auto_166585 ) ) ( not ( = ?auto_166583 ?auto_166586 ) ) ( not ( = ?auto_166583 ?auto_166587 ) ) ( not ( = ?auto_166583 ?auto_166588 ) ) ( not ( = ?auto_166583 ?auto_166589 ) ) ( not ( = ?auto_166583 ?auto_166590 ) ) ( not ( = ?auto_166584 ?auto_166585 ) ) ( not ( = ?auto_166584 ?auto_166586 ) ) ( not ( = ?auto_166584 ?auto_166587 ) ) ( not ( = ?auto_166584 ?auto_166588 ) ) ( not ( = ?auto_166584 ?auto_166589 ) ) ( not ( = ?auto_166584 ?auto_166590 ) ) ( not ( = ?auto_166585 ?auto_166586 ) ) ( not ( = ?auto_166585 ?auto_166587 ) ) ( not ( = ?auto_166585 ?auto_166588 ) ) ( not ( = ?auto_166585 ?auto_166589 ) ) ( not ( = ?auto_166585 ?auto_166590 ) ) ( not ( = ?auto_166586 ?auto_166587 ) ) ( not ( = ?auto_166586 ?auto_166588 ) ) ( not ( = ?auto_166586 ?auto_166589 ) ) ( not ( = ?auto_166586 ?auto_166590 ) ) ( not ( = ?auto_166587 ?auto_166588 ) ) ( not ( = ?auto_166587 ?auto_166589 ) ) ( not ( = ?auto_166587 ?auto_166590 ) ) ( not ( = ?auto_166588 ?auto_166589 ) ) ( not ( = ?auto_166588 ?auto_166590 ) ) ( not ( = ?auto_166589 ?auto_166590 ) ) ( ON ?auto_166589 ?auto_166590 ) ( ON ?auto_166588 ?auto_166589 ) ( ON ?auto_166587 ?auto_166588 ) ( ON ?auto_166586 ?auto_166587 ) ( ON ?auto_166585 ?auto_166586 ) ( ON ?auto_166584 ?auto_166585 ) ( ON ?auto_166583 ?auto_166584 ) ( ON ?auto_166582 ?auto_166583 ) ( CLEAR ?auto_166580 ) ( ON ?auto_166581 ?auto_166582 ) ( CLEAR ?auto_166581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166579 ?auto_166580 ?auto_166581 )
      ( MAKE-12PILE ?auto_166579 ?auto_166580 ?auto_166581 ?auto_166582 ?auto_166583 ?auto_166584 ?auto_166585 ?auto_166586 ?auto_166587 ?auto_166588 ?auto_166589 ?auto_166590 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166603 - BLOCK
      ?auto_166604 - BLOCK
      ?auto_166605 - BLOCK
      ?auto_166606 - BLOCK
      ?auto_166607 - BLOCK
      ?auto_166608 - BLOCK
      ?auto_166609 - BLOCK
      ?auto_166610 - BLOCK
      ?auto_166611 - BLOCK
      ?auto_166612 - BLOCK
      ?auto_166613 - BLOCK
      ?auto_166614 - BLOCK
    )
    :vars
    (
      ?auto_166615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166614 ?auto_166615 ) ( ON-TABLE ?auto_166603 ) ( not ( = ?auto_166603 ?auto_166604 ) ) ( not ( = ?auto_166603 ?auto_166605 ) ) ( not ( = ?auto_166603 ?auto_166606 ) ) ( not ( = ?auto_166603 ?auto_166607 ) ) ( not ( = ?auto_166603 ?auto_166608 ) ) ( not ( = ?auto_166603 ?auto_166609 ) ) ( not ( = ?auto_166603 ?auto_166610 ) ) ( not ( = ?auto_166603 ?auto_166611 ) ) ( not ( = ?auto_166603 ?auto_166612 ) ) ( not ( = ?auto_166603 ?auto_166613 ) ) ( not ( = ?auto_166603 ?auto_166614 ) ) ( not ( = ?auto_166603 ?auto_166615 ) ) ( not ( = ?auto_166604 ?auto_166605 ) ) ( not ( = ?auto_166604 ?auto_166606 ) ) ( not ( = ?auto_166604 ?auto_166607 ) ) ( not ( = ?auto_166604 ?auto_166608 ) ) ( not ( = ?auto_166604 ?auto_166609 ) ) ( not ( = ?auto_166604 ?auto_166610 ) ) ( not ( = ?auto_166604 ?auto_166611 ) ) ( not ( = ?auto_166604 ?auto_166612 ) ) ( not ( = ?auto_166604 ?auto_166613 ) ) ( not ( = ?auto_166604 ?auto_166614 ) ) ( not ( = ?auto_166604 ?auto_166615 ) ) ( not ( = ?auto_166605 ?auto_166606 ) ) ( not ( = ?auto_166605 ?auto_166607 ) ) ( not ( = ?auto_166605 ?auto_166608 ) ) ( not ( = ?auto_166605 ?auto_166609 ) ) ( not ( = ?auto_166605 ?auto_166610 ) ) ( not ( = ?auto_166605 ?auto_166611 ) ) ( not ( = ?auto_166605 ?auto_166612 ) ) ( not ( = ?auto_166605 ?auto_166613 ) ) ( not ( = ?auto_166605 ?auto_166614 ) ) ( not ( = ?auto_166605 ?auto_166615 ) ) ( not ( = ?auto_166606 ?auto_166607 ) ) ( not ( = ?auto_166606 ?auto_166608 ) ) ( not ( = ?auto_166606 ?auto_166609 ) ) ( not ( = ?auto_166606 ?auto_166610 ) ) ( not ( = ?auto_166606 ?auto_166611 ) ) ( not ( = ?auto_166606 ?auto_166612 ) ) ( not ( = ?auto_166606 ?auto_166613 ) ) ( not ( = ?auto_166606 ?auto_166614 ) ) ( not ( = ?auto_166606 ?auto_166615 ) ) ( not ( = ?auto_166607 ?auto_166608 ) ) ( not ( = ?auto_166607 ?auto_166609 ) ) ( not ( = ?auto_166607 ?auto_166610 ) ) ( not ( = ?auto_166607 ?auto_166611 ) ) ( not ( = ?auto_166607 ?auto_166612 ) ) ( not ( = ?auto_166607 ?auto_166613 ) ) ( not ( = ?auto_166607 ?auto_166614 ) ) ( not ( = ?auto_166607 ?auto_166615 ) ) ( not ( = ?auto_166608 ?auto_166609 ) ) ( not ( = ?auto_166608 ?auto_166610 ) ) ( not ( = ?auto_166608 ?auto_166611 ) ) ( not ( = ?auto_166608 ?auto_166612 ) ) ( not ( = ?auto_166608 ?auto_166613 ) ) ( not ( = ?auto_166608 ?auto_166614 ) ) ( not ( = ?auto_166608 ?auto_166615 ) ) ( not ( = ?auto_166609 ?auto_166610 ) ) ( not ( = ?auto_166609 ?auto_166611 ) ) ( not ( = ?auto_166609 ?auto_166612 ) ) ( not ( = ?auto_166609 ?auto_166613 ) ) ( not ( = ?auto_166609 ?auto_166614 ) ) ( not ( = ?auto_166609 ?auto_166615 ) ) ( not ( = ?auto_166610 ?auto_166611 ) ) ( not ( = ?auto_166610 ?auto_166612 ) ) ( not ( = ?auto_166610 ?auto_166613 ) ) ( not ( = ?auto_166610 ?auto_166614 ) ) ( not ( = ?auto_166610 ?auto_166615 ) ) ( not ( = ?auto_166611 ?auto_166612 ) ) ( not ( = ?auto_166611 ?auto_166613 ) ) ( not ( = ?auto_166611 ?auto_166614 ) ) ( not ( = ?auto_166611 ?auto_166615 ) ) ( not ( = ?auto_166612 ?auto_166613 ) ) ( not ( = ?auto_166612 ?auto_166614 ) ) ( not ( = ?auto_166612 ?auto_166615 ) ) ( not ( = ?auto_166613 ?auto_166614 ) ) ( not ( = ?auto_166613 ?auto_166615 ) ) ( not ( = ?auto_166614 ?auto_166615 ) ) ( ON ?auto_166613 ?auto_166614 ) ( ON ?auto_166612 ?auto_166613 ) ( ON ?auto_166611 ?auto_166612 ) ( ON ?auto_166610 ?auto_166611 ) ( ON ?auto_166609 ?auto_166610 ) ( ON ?auto_166608 ?auto_166609 ) ( ON ?auto_166607 ?auto_166608 ) ( ON ?auto_166606 ?auto_166607 ) ( ON ?auto_166605 ?auto_166606 ) ( CLEAR ?auto_166603 ) ( ON ?auto_166604 ?auto_166605 ) ( CLEAR ?auto_166604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166603 ?auto_166604 )
      ( MAKE-12PILE ?auto_166603 ?auto_166604 ?auto_166605 ?auto_166606 ?auto_166607 ?auto_166608 ?auto_166609 ?auto_166610 ?auto_166611 ?auto_166612 ?auto_166613 ?auto_166614 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166628 - BLOCK
      ?auto_166629 - BLOCK
      ?auto_166630 - BLOCK
      ?auto_166631 - BLOCK
      ?auto_166632 - BLOCK
      ?auto_166633 - BLOCK
      ?auto_166634 - BLOCK
      ?auto_166635 - BLOCK
      ?auto_166636 - BLOCK
      ?auto_166637 - BLOCK
      ?auto_166638 - BLOCK
      ?auto_166639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166639 ) ( ON-TABLE ?auto_166628 ) ( not ( = ?auto_166628 ?auto_166629 ) ) ( not ( = ?auto_166628 ?auto_166630 ) ) ( not ( = ?auto_166628 ?auto_166631 ) ) ( not ( = ?auto_166628 ?auto_166632 ) ) ( not ( = ?auto_166628 ?auto_166633 ) ) ( not ( = ?auto_166628 ?auto_166634 ) ) ( not ( = ?auto_166628 ?auto_166635 ) ) ( not ( = ?auto_166628 ?auto_166636 ) ) ( not ( = ?auto_166628 ?auto_166637 ) ) ( not ( = ?auto_166628 ?auto_166638 ) ) ( not ( = ?auto_166628 ?auto_166639 ) ) ( not ( = ?auto_166629 ?auto_166630 ) ) ( not ( = ?auto_166629 ?auto_166631 ) ) ( not ( = ?auto_166629 ?auto_166632 ) ) ( not ( = ?auto_166629 ?auto_166633 ) ) ( not ( = ?auto_166629 ?auto_166634 ) ) ( not ( = ?auto_166629 ?auto_166635 ) ) ( not ( = ?auto_166629 ?auto_166636 ) ) ( not ( = ?auto_166629 ?auto_166637 ) ) ( not ( = ?auto_166629 ?auto_166638 ) ) ( not ( = ?auto_166629 ?auto_166639 ) ) ( not ( = ?auto_166630 ?auto_166631 ) ) ( not ( = ?auto_166630 ?auto_166632 ) ) ( not ( = ?auto_166630 ?auto_166633 ) ) ( not ( = ?auto_166630 ?auto_166634 ) ) ( not ( = ?auto_166630 ?auto_166635 ) ) ( not ( = ?auto_166630 ?auto_166636 ) ) ( not ( = ?auto_166630 ?auto_166637 ) ) ( not ( = ?auto_166630 ?auto_166638 ) ) ( not ( = ?auto_166630 ?auto_166639 ) ) ( not ( = ?auto_166631 ?auto_166632 ) ) ( not ( = ?auto_166631 ?auto_166633 ) ) ( not ( = ?auto_166631 ?auto_166634 ) ) ( not ( = ?auto_166631 ?auto_166635 ) ) ( not ( = ?auto_166631 ?auto_166636 ) ) ( not ( = ?auto_166631 ?auto_166637 ) ) ( not ( = ?auto_166631 ?auto_166638 ) ) ( not ( = ?auto_166631 ?auto_166639 ) ) ( not ( = ?auto_166632 ?auto_166633 ) ) ( not ( = ?auto_166632 ?auto_166634 ) ) ( not ( = ?auto_166632 ?auto_166635 ) ) ( not ( = ?auto_166632 ?auto_166636 ) ) ( not ( = ?auto_166632 ?auto_166637 ) ) ( not ( = ?auto_166632 ?auto_166638 ) ) ( not ( = ?auto_166632 ?auto_166639 ) ) ( not ( = ?auto_166633 ?auto_166634 ) ) ( not ( = ?auto_166633 ?auto_166635 ) ) ( not ( = ?auto_166633 ?auto_166636 ) ) ( not ( = ?auto_166633 ?auto_166637 ) ) ( not ( = ?auto_166633 ?auto_166638 ) ) ( not ( = ?auto_166633 ?auto_166639 ) ) ( not ( = ?auto_166634 ?auto_166635 ) ) ( not ( = ?auto_166634 ?auto_166636 ) ) ( not ( = ?auto_166634 ?auto_166637 ) ) ( not ( = ?auto_166634 ?auto_166638 ) ) ( not ( = ?auto_166634 ?auto_166639 ) ) ( not ( = ?auto_166635 ?auto_166636 ) ) ( not ( = ?auto_166635 ?auto_166637 ) ) ( not ( = ?auto_166635 ?auto_166638 ) ) ( not ( = ?auto_166635 ?auto_166639 ) ) ( not ( = ?auto_166636 ?auto_166637 ) ) ( not ( = ?auto_166636 ?auto_166638 ) ) ( not ( = ?auto_166636 ?auto_166639 ) ) ( not ( = ?auto_166637 ?auto_166638 ) ) ( not ( = ?auto_166637 ?auto_166639 ) ) ( not ( = ?auto_166638 ?auto_166639 ) ) ( ON ?auto_166638 ?auto_166639 ) ( ON ?auto_166637 ?auto_166638 ) ( ON ?auto_166636 ?auto_166637 ) ( ON ?auto_166635 ?auto_166636 ) ( ON ?auto_166634 ?auto_166635 ) ( ON ?auto_166633 ?auto_166634 ) ( ON ?auto_166632 ?auto_166633 ) ( ON ?auto_166631 ?auto_166632 ) ( ON ?auto_166630 ?auto_166631 ) ( CLEAR ?auto_166628 ) ( ON ?auto_166629 ?auto_166630 ) ( CLEAR ?auto_166629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166628 ?auto_166629 )
      ( MAKE-12PILE ?auto_166628 ?auto_166629 ?auto_166630 ?auto_166631 ?auto_166632 ?auto_166633 ?auto_166634 ?auto_166635 ?auto_166636 ?auto_166637 ?auto_166638 ?auto_166639 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166652 - BLOCK
      ?auto_166653 - BLOCK
      ?auto_166654 - BLOCK
      ?auto_166655 - BLOCK
      ?auto_166656 - BLOCK
      ?auto_166657 - BLOCK
      ?auto_166658 - BLOCK
      ?auto_166659 - BLOCK
      ?auto_166660 - BLOCK
      ?auto_166661 - BLOCK
      ?auto_166662 - BLOCK
      ?auto_166663 - BLOCK
    )
    :vars
    (
      ?auto_166664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166663 ?auto_166664 ) ( not ( = ?auto_166652 ?auto_166653 ) ) ( not ( = ?auto_166652 ?auto_166654 ) ) ( not ( = ?auto_166652 ?auto_166655 ) ) ( not ( = ?auto_166652 ?auto_166656 ) ) ( not ( = ?auto_166652 ?auto_166657 ) ) ( not ( = ?auto_166652 ?auto_166658 ) ) ( not ( = ?auto_166652 ?auto_166659 ) ) ( not ( = ?auto_166652 ?auto_166660 ) ) ( not ( = ?auto_166652 ?auto_166661 ) ) ( not ( = ?auto_166652 ?auto_166662 ) ) ( not ( = ?auto_166652 ?auto_166663 ) ) ( not ( = ?auto_166652 ?auto_166664 ) ) ( not ( = ?auto_166653 ?auto_166654 ) ) ( not ( = ?auto_166653 ?auto_166655 ) ) ( not ( = ?auto_166653 ?auto_166656 ) ) ( not ( = ?auto_166653 ?auto_166657 ) ) ( not ( = ?auto_166653 ?auto_166658 ) ) ( not ( = ?auto_166653 ?auto_166659 ) ) ( not ( = ?auto_166653 ?auto_166660 ) ) ( not ( = ?auto_166653 ?auto_166661 ) ) ( not ( = ?auto_166653 ?auto_166662 ) ) ( not ( = ?auto_166653 ?auto_166663 ) ) ( not ( = ?auto_166653 ?auto_166664 ) ) ( not ( = ?auto_166654 ?auto_166655 ) ) ( not ( = ?auto_166654 ?auto_166656 ) ) ( not ( = ?auto_166654 ?auto_166657 ) ) ( not ( = ?auto_166654 ?auto_166658 ) ) ( not ( = ?auto_166654 ?auto_166659 ) ) ( not ( = ?auto_166654 ?auto_166660 ) ) ( not ( = ?auto_166654 ?auto_166661 ) ) ( not ( = ?auto_166654 ?auto_166662 ) ) ( not ( = ?auto_166654 ?auto_166663 ) ) ( not ( = ?auto_166654 ?auto_166664 ) ) ( not ( = ?auto_166655 ?auto_166656 ) ) ( not ( = ?auto_166655 ?auto_166657 ) ) ( not ( = ?auto_166655 ?auto_166658 ) ) ( not ( = ?auto_166655 ?auto_166659 ) ) ( not ( = ?auto_166655 ?auto_166660 ) ) ( not ( = ?auto_166655 ?auto_166661 ) ) ( not ( = ?auto_166655 ?auto_166662 ) ) ( not ( = ?auto_166655 ?auto_166663 ) ) ( not ( = ?auto_166655 ?auto_166664 ) ) ( not ( = ?auto_166656 ?auto_166657 ) ) ( not ( = ?auto_166656 ?auto_166658 ) ) ( not ( = ?auto_166656 ?auto_166659 ) ) ( not ( = ?auto_166656 ?auto_166660 ) ) ( not ( = ?auto_166656 ?auto_166661 ) ) ( not ( = ?auto_166656 ?auto_166662 ) ) ( not ( = ?auto_166656 ?auto_166663 ) ) ( not ( = ?auto_166656 ?auto_166664 ) ) ( not ( = ?auto_166657 ?auto_166658 ) ) ( not ( = ?auto_166657 ?auto_166659 ) ) ( not ( = ?auto_166657 ?auto_166660 ) ) ( not ( = ?auto_166657 ?auto_166661 ) ) ( not ( = ?auto_166657 ?auto_166662 ) ) ( not ( = ?auto_166657 ?auto_166663 ) ) ( not ( = ?auto_166657 ?auto_166664 ) ) ( not ( = ?auto_166658 ?auto_166659 ) ) ( not ( = ?auto_166658 ?auto_166660 ) ) ( not ( = ?auto_166658 ?auto_166661 ) ) ( not ( = ?auto_166658 ?auto_166662 ) ) ( not ( = ?auto_166658 ?auto_166663 ) ) ( not ( = ?auto_166658 ?auto_166664 ) ) ( not ( = ?auto_166659 ?auto_166660 ) ) ( not ( = ?auto_166659 ?auto_166661 ) ) ( not ( = ?auto_166659 ?auto_166662 ) ) ( not ( = ?auto_166659 ?auto_166663 ) ) ( not ( = ?auto_166659 ?auto_166664 ) ) ( not ( = ?auto_166660 ?auto_166661 ) ) ( not ( = ?auto_166660 ?auto_166662 ) ) ( not ( = ?auto_166660 ?auto_166663 ) ) ( not ( = ?auto_166660 ?auto_166664 ) ) ( not ( = ?auto_166661 ?auto_166662 ) ) ( not ( = ?auto_166661 ?auto_166663 ) ) ( not ( = ?auto_166661 ?auto_166664 ) ) ( not ( = ?auto_166662 ?auto_166663 ) ) ( not ( = ?auto_166662 ?auto_166664 ) ) ( not ( = ?auto_166663 ?auto_166664 ) ) ( ON ?auto_166662 ?auto_166663 ) ( ON ?auto_166661 ?auto_166662 ) ( ON ?auto_166660 ?auto_166661 ) ( ON ?auto_166659 ?auto_166660 ) ( ON ?auto_166658 ?auto_166659 ) ( ON ?auto_166657 ?auto_166658 ) ( ON ?auto_166656 ?auto_166657 ) ( ON ?auto_166655 ?auto_166656 ) ( ON ?auto_166654 ?auto_166655 ) ( ON ?auto_166653 ?auto_166654 ) ( ON ?auto_166652 ?auto_166653 ) ( CLEAR ?auto_166652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166652 )
      ( MAKE-12PILE ?auto_166652 ?auto_166653 ?auto_166654 ?auto_166655 ?auto_166656 ?auto_166657 ?auto_166658 ?auto_166659 ?auto_166660 ?auto_166661 ?auto_166662 ?auto_166663 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166677 - BLOCK
      ?auto_166678 - BLOCK
      ?auto_166679 - BLOCK
      ?auto_166680 - BLOCK
      ?auto_166681 - BLOCK
      ?auto_166682 - BLOCK
      ?auto_166683 - BLOCK
      ?auto_166684 - BLOCK
      ?auto_166685 - BLOCK
      ?auto_166686 - BLOCK
      ?auto_166687 - BLOCK
      ?auto_166688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166688 ) ( not ( = ?auto_166677 ?auto_166678 ) ) ( not ( = ?auto_166677 ?auto_166679 ) ) ( not ( = ?auto_166677 ?auto_166680 ) ) ( not ( = ?auto_166677 ?auto_166681 ) ) ( not ( = ?auto_166677 ?auto_166682 ) ) ( not ( = ?auto_166677 ?auto_166683 ) ) ( not ( = ?auto_166677 ?auto_166684 ) ) ( not ( = ?auto_166677 ?auto_166685 ) ) ( not ( = ?auto_166677 ?auto_166686 ) ) ( not ( = ?auto_166677 ?auto_166687 ) ) ( not ( = ?auto_166677 ?auto_166688 ) ) ( not ( = ?auto_166678 ?auto_166679 ) ) ( not ( = ?auto_166678 ?auto_166680 ) ) ( not ( = ?auto_166678 ?auto_166681 ) ) ( not ( = ?auto_166678 ?auto_166682 ) ) ( not ( = ?auto_166678 ?auto_166683 ) ) ( not ( = ?auto_166678 ?auto_166684 ) ) ( not ( = ?auto_166678 ?auto_166685 ) ) ( not ( = ?auto_166678 ?auto_166686 ) ) ( not ( = ?auto_166678 ?auto_166687 ) ) ( not ( = ?auto_166678 ?auto_166688 ) ) ( not ( = ?auto_166679 ?auto_166680 ) ) ( not ( = ?auto_166679 ?auto_166681 ) ) ( not ( = ?auto_166679 ?auto_166682 ) ) ( not ( = ?auto_166679 ?auto_166683 ) ) ( not ( = ?auto_166679 ?auto_166684 ) ) ( not ( = ?auto_166679 ?auto_166685 ) ) ( not ( = ?auto_166679 ?auto_166686 ) ) ( not ( = ?auto_166679 ?auto_166687 ) ) ( not ( = ?auto_166679 ?auto_166688 ) ) ( not ( = ?auto_166680 ?auto_166681 ) ) ( not ( = ?auto_166680 ?auto_166682 ) ) ( not ( = ?auto_166680 ?auto_166683 ) ) ( not ( = ?auto_166680 ?auto_166684 ) ) ( not ( = ?auto_166680 ?auto_166685 ) ) ( not ( = ?auto_166680 ?auto_166686 ) ) ( not ( = ?auto_166680 ?auto_166687 ) ) ( not ( = ?auto_166680 ?auto_166688 ) ) ( not ( = ?auto_166681 ?auto_166682 ) ) ( not ( = ?auto_166681 ?auto_166683 ) ) ( not ( = ?auto_166681 ?auto_166684 ) ) ( not ( = ?auto_166681 ?auto_166685 ) ) ( not ( = ?auto_166681 ?auto_166686 ) ) ( not ( = ?auto_166681 ?auto_166687 ) ) ( not ( = ?auto_166681 ?auto_166688 ) ) ( not ( = ?auto_166682 ?auto_166683 ) ) ( not ( = ?auto_166682 ?auto_166684 ) ) ( not ( = ?auto_166682 ?auto_166685 ) ) ( not ( = ?auto_166682 ?auto_166686 ) ) ( not ( = ?auto_166682 ?auto_166687 ) ) ( not ( = ?auto_166682 ?auto_166688 ) ) ( not ( = ?auto_166683 ?auto_166684 ) ) ( not ( = ?auto_166683 ?auto_166685 ) ) ( not ( = ?auto_166683 ?auto_166686 ) ) ( not ( = ?auto_166683 ?auto_166687 ) ) ( not ( = ?auto_166683 ?auto_166688 ) ) ( not ( = ?auto_166684 ?auto_166685 ) ) ( not ( = ?auto_166684 ?auto_166686 ) ) ( not ( = ?auto_166684 ?auto_166687 ) ) ( not ( = ?auto_166684 ?auto_166688 ) ) ( not ( = ?auto_166685 ?auto_166686 ) ) ( not ( = ?auto_166685 ?auto_166687 ) ) ( not ( = ?auto_166685 ?auto_166688 ) ) ( not ( = ?auto_166686 ?auto_166687 ) ) ( not ( = ?auto_166686 ?auto_166688 ) ) ( not ( = ?auto_166687 ?auto_166688 ) ) ( ON ?auto_166687 ?auto_166688 ) ( ON ?auto_166686 ?auto_166687 ) ( ON ?auto_166685 ?auto_166686 ) ( ON ?auto_166684 ?auto_166685 ) ( ON ?auto_166683 ?auto_166684 ) ( ON ?auto_166682 ?auto_166683 ) ( ON ?auto_166681 ?auto_166682 ) ( ON ?auto_166680 ?auto_166681 ) ( ON ?auto_166679 ?auto_166680 ) ( ON ?auto_166678 ?auto_166679 ) ( ON ?auto_166677 ?auto_166678 ) ( CLEAR ?auto_166677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166677 )
      ( MAKE-12PILE ?auto_166677 ?auto_166678 ?auto_166679 ?auto_166680 ?auto_166681 ?auto_166682 ?auto_166683 ?auto_166684 ?auto_166685 ?auto_166686 ?auto_166687 ?auto_166688 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_166701 - BLOCK
      ?auto_166702 - BLOCK
      ?auto_166703 - BLOCK
      ?auto_166704 - BLOCK
      ?auto_166705 - BLOCK
      ?auto_166706 - BLOCK
      ?auto_166707 - BLOCK
      ?auto_166708 - BLOCK
      ?auto_166709 - BLOCK
      ?auto_166710 - BLOCK
      ?auto_166711 - BLOCK
      ?auto_166712 - BLOCK
    )
    :vars
    (
      ?auto_166713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166701 ?auto_166702 ) ) ( not ( = ?auto_166701 ?auto_166703 ) ) ( not ( = ?auto_166701 ?auto_166704 ) ) ( not ( = ?auto_166701 ?auto_166705 ) ) ( not ( = ?auto_166701 ?auto_166706 ) ) ( not ( = ?auto_166701 ?auto_166707 ) ) ( not ( = ?auto_166701 ?auto_166708 ) ) ( not ( = ?auto_166701 ?auto_166709 ) ) ( not ( = ?auto_166701 ?auto_166710 ) ) ( not ( = ?auto_166701 ?auto_166711 ) ) ( not ( = ?auto_166701 ?auto_166712 ) ) ( not ( = ?auto_166702 ?auto_166703 ) ) ( not ( = ?auto_166702 ?auto_166704 ) ) ( not ( = ?auto_166702 ?auto_166705 ) ) ( not ( = ?auto_166702 ?auto_166706 ) ) ( not ( = ?auto_166702 ?auto_166707 ) ) ( not ( = ?auto_166702 ?auto_166708 ) ) ( not ( = ?auto_166702 ?auto_166709 ) ) ( not ( = ?auto_166702 ?auto_166710 ) ) ( not ( = ?auto_166702 ?auto_166711 ) ) ( not ( = ?auto_166702 ?auto_166712 ) ) ( not ( = ?auto_166703 ?auto_166704 ) ) ( not ( = ?auto_166703 ?auto_166705 ) ) ( not ( = ?auto_166703 ?auto_166706 ) ) ( not ( = ?auto_166703 ?auto_166707 ) ) ( not ( = ?auto_166703 ?auto_166708 ) ) ( not ( = ?auto_166703 ?auto_166709 ) ) ( not ( = ?auto_166703 ?auto_166710 ) ) ( not ( = ?auto_166703 ?auto_166711 ) ) ( not ( = ?auto_166703 ?auto_166712 ) ) ( not ( = ?auto_166704 ?auto_166705 ) ) ( not ( = ?auto_166704 ?auto_166706 ) ) ( not ( = ?auto_166704 ?auto_166707 ) ) ( not ( = ?auto_166704 ?auto_166708 ) ) ( not ( = ?auto_166704 ?auto_166709 ) ) ( not ( = ?auto_166704 ?auto_166710 ) ) ( not ( = ?auto_166704 ?auto_166711 ) ) ( not ( = ?auto_166704 ?auto_166712 ) ) ( not ( = ?auto_166705 ?auto_166706 ) ) ( not ( = ?auto_166705 ?auto_166707 ) ) ( not ( = ?auto_166705 ?auto_166708 ) ) ( not ( = ?auto_166705 ?auto_166709 ) ) ( not ( = ?auto_166705 ?auto_166710 ) ) ( not ( = ?auto_166705 ?auto_166711 ) ) ( not ( = ?auto_166705 ?auto_166712 ) ) ( not ( = ?auto_166706 ?auto_166707 ) ) ( not ( = ?auto_166706 ?auto_166708 ) ) ( not ( = ?auto_166706 ?auto_166709 ) ) ( not ( = ?auto_166706 ?auto_166710 ) ) ( not ( = ?auto_166706 ?auto_166711 ) ) ( not ( = ?auto_166706 ?auto_166712 ) ) ( not ( = ?auto_166707 ?auto_166708 ) ) ( not ( = ?auto_166707 ?auto_166709 ) ) ( not ( = ?auto_166707 ?auto_166710 ) ) ( not ( = ?auto_166707 ?auto_166711 ) ) ( not ( = ?auto_166707 ?auto_166712 ) ) ( not ( = ?auto_166708 ?auto_166709 ) ) ( not ( = ?auto_166708 ?auto_166710 ) ) ( not ( = ?auto_166708 ?auto_166711 ) ) ( not ( = ?auto_166708 ?auto_166712 ) ) ( not ( = ?auto_166709 ?auto_166710 ) ) ( not ( = ?auto_166709 ?auto_166711 ) ) ( not ( = ?auto_166709 ?auto_166712 ) ) ( not ( = ?auto_166710 ?auto_166711 ) ) ( not ( = ?auto_166710 ?auto_166712 ) ) ( not ( = ?auto_166711 ?auto_166712 ) ) ( ON ?auto_166701 ?auto_166713 ) ( not ( = ?auto_166712 ?auto_166713 ) ) ( not ( = ?auto_166711 ?auto_166713 ) ) ( not ( = ?auto_166710 ?auto_166713 ) ) ( not ( = ?auto_166709 ?auto_166713 ) ) ( not ( = ?auto_166708 ?auto_166713 ) ) ( not ( = ?auto_166707 ?auto_166713 ) ) ( not ( = ?auto_166706 ?auto_166713 ) ) ( not ( = ?auto_166705 ?auto_166713 ) ) ( not ( = ?auto_166704 ?auto_166713 ) ) ( not ( = ?auto_166703 ?auto_166713 ) ) ( not ( = ?auto_166702 ?auto_166713 ) ) ( not ( = ?auto_166701 ?auto_166713 ) ) ( ON ?auto_166702 ?auto_166701 ) ( ON ?auto_166703 ?auto_166702 ) ( ON ?auto_166704 ?auto_166703 ) ( ON ?auto_166705 ?auto_166704 ) ( ON ?auto_166706 ?auto_166705 ) ( ON ?auto_166707 ?auto_166706 ) ( ON ?auto_166708 ?auto_166707 ) ( ON ?auto_166709 ?auto_166708 ) ( ON ?auto_166710 ?auto_166709 ) ( ON ?auto_166711 ?auto_166710 ) ( ON ?auto_166712 ?auto_166711 ) ( CLEAR ?auto_166712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_166712 ?auto_166711 ?auto_166710 ?auto_166709 ?auto_166708 ?auto_166707 ?auto_166706 ?auto_166705 ?auto_166704 ?auto_166703 ?auto_166702 ?auto_166701 )
      ( MAKE-12PILE ?auto_166701 ?auto_166702 ?auto_166703 ?auto_166704 ?auto_166705 ?auto_166706 ?auto_166707 ?auto_166708 ?auto_166709 ?auto_166710 ?auto_166711 ?auto_166712 ) )
  )

)

