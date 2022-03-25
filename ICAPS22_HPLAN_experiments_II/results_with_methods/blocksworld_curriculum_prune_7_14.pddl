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
      ?auto_27037 - BLOCK
    )
    :vars
    (
      ?auto_27038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27037 ?auto_27038 ) ( CLEAR ?auto_27037 ) ( HAND-EMPTY ) ( not ( = ?auto_27037 ?auto_27038 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27037 ?auto_27038 )
      ( !PUTDOWN ?auto_27037 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27044 - BLOCK
      ?auto_27045 - BLOCK
    )
    :vars
    (
      ?auto_27046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27044 ) ( ON ?auto_27045 ?auto_27046 ) ( CLEAR ?auto_27045 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27044 ) ( not ( = ?auto_27044 ?auto_27045 ) ) ( not ( = ?auto_27044 ?auto_27046 ) ) ( not ( = ?auto_27045 ?auto_27046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27045 ?auto_27046 )
      ( !STACK ?auto_27045 ?auto_27044 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27054 - BLOCK
      ?auto_27055 - BLOCK
    )
    :vars
    (
      ?auto_27056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27055 ?auto_27056 ) ( not ( = ?auto_27054 ?auto_27055 ) ) ( not ( = ?auto_27054 ?auto_27056 ) ) ( not ( = ?auto_27055 ?auto_27056 ) ) ( ON ?auto_27054 ?auto_27055 ) ( CLEAR ?auto_27054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27054 )
      ( MAKE-2PILE ?auto_27054 ?auto_27055 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27065 - BLOCK
      ?auto_27066 - BLOCK
      ?auto_27067 - BLOCK
    )
    :vars
    (
      ?auto_27068 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27066 ) ( ON ?auto_27067 ?auto_27068 ) ( CLEAR ?auto_27067 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27065 ) ( ON ?auto_27066 ?auto_27065 ) ( not ( = ?auto_27065 ?auto_27066 ) ) ( not ( = ?auto_27065 ?auto_27067 ) ) ( not ( = ?auto_27065 ?auto_27068 ) ) ( not ( = ?auto_27066 ?auto_27067 ) ) ( not ( = ?auto_27066 ?auto_27068 ) ) ( not ( = ?auto_27067 ?auto_27068 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27067 ?auto_27068 )
      ( !STACK ?auto_27067 ?auto_27066 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27079 - BLOCK
      ?auto_27080 - BLOCK
      ?auto_27081 - BLOCK
    )
    :vars
    (
      ?auto_27082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27081 ?auto_27082 ) ( ON-TABLE ?auto_27079 ) ( not ( = ?auto_27079 ?auto_27080 ) ) ( not ( = ?auto_27079 ?auto_27081 ) ) ( not ( = ?auto_27079 ?auto_27082 ) ) ( not ( = ?auto_27080 ?auto_27081 ) ) ( not ( = ?auto_27080 ?auto_27082 ) ) ( not ( = ?auto_27081 ?auto_27082 ) ) ( CLEAR ?auto_27079 ) ( ON ?auto_27080 ?auto_27081 ) ( CLEAR ?auto_27080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27079 ?auto_27080 )
      ( MAKE-3PILE ?auto_27079 ?auto_27080 ?auto_27081 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27093 - BLOCK
      ?auto_27094 - BLOCK
      ?auto_27095 - BLOCK
    )
    :vars
    (
      ?auto_27096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27095 ?auto_27096 ) ( not ( = ?auto_27093 ?auto_27094 ) ) ( not ( = ?auto_27093 ?auto_27095 ) ) ( not ( = ?auto_27093 ?auto_27096 ) ) ( not ( = ?auto_27094 ?auto_27095 ) ) ( not ( = ?auto_27094 ?auto_27096 ) ) ( not ( = ?auto_27095 ?auto_27096 ) ) ( ON ?auto_27094 ?auto_27095 ) ( ON ?auto_27093 ?auto_27094 ) ( CLEAR ?auto_27093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27093 )
      ( MAKE-3PILE ?auto_27093 ?auto_27094 ?auto_27095 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27108 - BLOCK
      ?auto_27109 - BLOCK
      ?auto_27110 - BLOCK
      ?auto_27111 - BLOCK
    )
    :vars
    (
      ?auto_27112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27110 ) ( ON ?auto_27111 ?auto_27112 ) ( CLEAR ?auto_27111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27108 ) ( ON ?auto_27109 ?auto_27108 ) ( ON ?auto_27110 ?auto_27109 ) ( not ( = ?auto_27108 ?auto_27109 ) ) ( not ( = ?auto_27108 ?auto_27110 ) ) ( not ( = ?auto_27108 ?auto_27111 ) ) ( not ( = ?auto_27108 ?auto_27112 ) ) ( not ( = ?auto_27109 ?auto_27110 ) ) ( not ( = ?auto_27109 ?auto_27111 ) ) ( not ( = ?auto_27109 ?auto_27112 ) ) ( not ( = ?auto_27110 ?auto_27111 ) ) ( not ( = ?auto_27110 ?auto_27112 ) ) ( not ( = ?auto_27111 ?auto_27112 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27111 ?auto_27112 )
      ( !STACK ?auto_27111 ?auto_27110 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27126 - BLOCK
      ?auto_27127 - BLOCK
      ?auto_27128 - BLOCK
      ?auto_27129 - BLOCK
    )
    :vars
    (
      ?auto_27130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27129 ?auto_27130 ) ( ON-TABLE ?auto_27126 ) ( ON ?auto_27127 ?auto_27126 ) ( not ( = ?auto_27126 ?auto_27127 ) ) ( not ( = ?auto_27126 ?auto_27128 ) ) ( not ( = ?auto_27126 ?auto_27129 ) ) ( not ( = ?auto_27126 ?auto_27130 ) ) ( not ( = ?auto_27127 ?auto_27128 ) ) ( not ( = ?auto_27127 ?auto_27129 ) ) ( not ( = ?auto_27127 ?auto_27130 ) ) ( not ( = ?auto_27128 ?auto_27129 ) ) ( not ( = ?auto_27128 ?auto_27130 ) ) ( not ( = ?auto_27129 ?auto_27130 ) ) ( CLEAR ?auto_27127 ) ( ON ?auto_27128 ?auto_27129 ) ( CLEAR ?auto_27128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27126 ?auto_27127 ?auto_27128 )
      ( MAKE-4PILE ?auto_27126 ?auto_27127 ?auto_27128 ?auto_27129 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27144 - BLOCK
      ?auto_27145 - BLOCK
      ?auto_27146 - BLOCK
      ?auto_27147 - BLOCK
    )
    :vars
    (
      ?auto_27148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27147 ?auto_27148 ) ( ON-TABLE ?auto_27144 ) ( not ( = ?auto_27144 ?auto_27145 ) ) ( not ( = ?auto_27144 ?auto_27146 ) ) ( not ( = ?auto_27144 ?auto_27147 ) ) ( not ( = ?auto_27144 ?auto_27148 ) ) ( not ( = ?auto_27145 ?auto_27146 ) ) ( not ( = ?auto_27145 ?auto_27147 ) ) ( not ( = ?auto_27145 ?auto_27148 ) ) ( not ( = ?auto_27146 ?auto_27147 ) ) ( not ( = ?auto_27146 ?auto_27148 ) ) ( not ( = ?auto_27147 ?auto_27148 ) ) ( ON ?auto_27146 ?auto_27147 ) ( CLEAR ?auto_27144 ) ( ON ?auto_27145 ?auto_27146 ) ( CLEAR ?auto_27145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27144 ?auto_27145 )
      ( MAKE-4PILE ?auto_27144 ?auto_27145 ?auto_27146 ?auto_27147 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27162 - BLOCK
      ?auto_27163 - BLOCK
      ?auto_27164 - BLOCK
      ?auto_27165 - BLOCK
    )
    :vars
    (
      ?auto_27166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27165 ?auto_27166 ) ( not ( = ?auto_27162 ?auto_27163 ) ) ( not ( = ?auto_27162 ?auto_27164 ) ) ( not ( = ?auto_27162 ?auto_27165 ) ) ( not ( = ?auto_27162 ?auto_27166 ) ) ( not ( = ?auto_27163 ?auto_27164 ) ) ( not ( = ?auto_27163 ?auto_27165 ) ) ( not ( = ?auto_27163 ?auto_27166 ) ) ( not ( = ?auto_27164 ?auto_27165 ) ) ( not ( = ?auto_27164 ?auto_27166 ) ) ( not ( = ?auto_27165 ?auto_27166 ) ) ( ON ?auto_27164 ?auto_27165 ) ( ON ?auto_27163 ?auto_27164 ) ( ON ?auto_27162 ?auto_27163 ) ( CLEAR ?auto_27162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27162 )
      ( MAKE-4PILE ?auto_27162 ?auto_27163 ?auto_27164 ?auto_27165 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27181 - BLOCK
      ?auto_27182 - BLOCK
      ?auto_27183 - BLOCK
      ?auto_27184 - BLOCK
      ?auto_27185 - BLOCK
    )
    :vars
    (
      ?auto_27186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27184 ) ( ON ?auto_27185 ?auto_27186 ) ( CLEAR ?auto_27185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27181 ) ( ON ?auto_27182 ?auto_27181 ) ( ON ?auto_27183 ?auto_27182 ) ( ON ?auto_27184 ?auto_27183 ) ( not ( = ?auto_27181 ?auto_27182 ) ) ( not ( = ?auto_27181 ?auto_27183 ) ) ( not ( = ?auto_27181 ?auto_27184 ) ) ( not ( = ?auto_27181 ?auto_27185 ) ) ( not ( = ?auto_27181 ?auto_27186 ) ) ( not ( = ?auto_27182 ?auto_27183 ) ) ( not ( = ?auto_27182 ?auto_27184 ) ) ( not ( = ?auto_27182 ?auto_27185 ) ) ( not ( = ?auto_27182 ?auto_27186 ) ) ( not ( = ?auto_27183 ?auto_27184 ) ) ( not ( = ?auto_27183 ?auto_27185 ) ) ( not ( = ?auto_27183 ?auto_27186 ) ) ( not ( = ?auto_27184 ?auto_27185 ) ) ( not ( = ?auto_27184 ?auto_27186 ) ) ( not ( = ?auto_27185 ?auto_27186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27185 ?auto_27186 )
      ( !STACK ?auto_27185 ?auto_27184 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27203 - BLOCK
      ?auto_27204 - BLOCK
      ?auto_27205 - BLOCK
      ?auto_27206 - BLOCK
      ?auto_27207 - BLOCK
    )
    :vars
    (
      ?auto_27208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27207 ?auto_27208 ) ( ON-TABLE ?auto_27203 ) ( ON ?auto_27204 ?auto_27203 ) ( ON ?auto_27205 ?auto_27204 ) ( not ( = ?auto_27203 ?auto_27204 ) ) ( not ( = ?auto_27203 ?auto_27205 ) ) ( not ( = ?auto_27203 ?auto_27206 ) ) ( not ( = ?auto_27203 ?auto_27207 ) ) ( not ( = ?auto_27203 ?auto_27208 ) ) ( not ( = ?auto_27204 ?auto_27205 ) ) ( not ( = ?auto_27204 ?auto_27206 ) ) ( not ( = ?auto_27204 ?auto_27207 ) ) ( not ( = ?auto_27204 ?auto_27208 ) ) ( not ( = ?auto_27205 ?auto_27206 ) ) ( not ( = ?auto_27205 ?auto_27207 ) ) ( not ( = ?auto_27205 ?auto_27208 ) ) ( not ( = ?auto_27206 ?auto_27207 ) ) ( not ( = ?auto_27206 ?auto_27208 ) ) ( not ( = ?auto_27207 ?auto_27208 ) ) ( CLEAR ?auto_27205 ) ( ON ?auto_27206 ?auto_27207 ) ( CLEAR ?auto_27206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27203 ?auto_27204 ?auto_27205 ?auto_27206 )
      ( MAKE-5PILE ?auto_27203 ?auto_27204 ?auto_27205 ?auto_27206 ?auto_27207 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27225 - BLOCK
      ?auto_27226 - BLOCK
      ?auto_27227 - BLOCK
      ?auto_27228 - BLOCK
      ?auto_27229 - BLOCK
    )
    :vars
    (
      ?auto_27230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27229 ?auto_27230 ) ( ON-TABLE ?auto_27225 ) ( ON ?auto_27226 ?auto_27225 ) ( not ( = ?auto_27225 ?auto_27226 ) ) ( not ( = ?auto_27225 ?auto_27227 ) ) ( not ( = ?auto_27225 ?auto_27228 ) ) ( not ( = ?auto_27225 ?auto_27229 ) ) ( not ( = ?auto_27225 ?auto_27230 ) ) ( not ( = ?auto_27226 ?auto_27227 ) ) ( not ( = ?auto_27226 ?auto_27228 ) ) ( not ( = ?auto_27226 ?auto_27229 ) ) ( not ( = ?auto_27226 ?auto_27230 ) ) ( not ( = ?auto_27227 ?auto_27228 ) ) ( not ( = ?auto_27227 ?auto_27229 ) ) ( not ( = ?auto_27227 ?auto_27230 ) ) ( not ( = ?auto_27228 ?auto_27229 ) ) ( not ( = ?auto_27228 ?auto_27230 ) ) ( not ( = ?auto_27229 ?auto_27230 ) ) ( ON ?auto_27228 ?auto_27229 ) ( CLEAR ?auto_27226 ) ( ON ?auto_27227 ?auto_27228 ) ( CLEAR ?auto_27227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27225 ?auto_27226 ?auto_27227 )
      ( MAKE-5PILE ?auto_27225 ?auto_27226 ?auto_27227 ?auto_27228 ?auto_27229 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27247 - BLOCK
      ?auto_27248 - BLOCK
      ?auto_27249 - BLOCK
      ?auto_27250 - BLOCK
      ?auto_27251 - BLOCK
    )
    :vars
    (
      ?auto_27252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27251 ?auto_27252 ) ( ON-TABLE ?auto_27247 ) ( not ( = ?auto_27247 ?auto_27248 ) ) ( not ( = ?auto_27247 ?auto_27249 ) ) ( not ( = ?auto_27247 ?auto_27250 ) ) ( not ( = ?auto_27247 ?auto_27251 ) ) ( not ( = ?auto_27247 ?auto_27252 ) ) ( not ( = ?auto_27248 ?auto_27249 ) ) ( not ( = ?auto_27248 ?auto_27250 ) ) ( not ( = ?auto_27248 ?auto_27251 ) ) ( not ( = ?auto_27248 ?auto_27252 ) ) ( not ( = ?auto_27249 ?auto_27250 ) ) ( not ( = ?auto_27249 ?auto_27251 ) ) ( not ( = ?auto_27249 ?auto_27252 ) ) ( not ( = ?auto_27250 ?auto_27251 ) ) ( not ( = ?auto_27250 ?auto_27252 ) ) ( not ( = ?auto_27251 ?auto_27252 ) ) ( ON ?auto_27250 ?auto_27251 ) ( ON ?auto_27249 ?auto_27250 ) ( CLEAR ?auto_27247 ) ( ON ?auto_27248 ?auto_27249 ) ( CLEAR ?auto_27248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27247 ?auto_27248 )
      ( MAKE-5PILE ?auto_27247 ?auto_27248 ?auto_27249 ?auto_27250 ?auto_27251 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27269 - BLOCK
      ?auto_27270 - BLOCK
      ?auto_27271 - BLOCK
      ?auto_27272 - BLOCK
      ?auto_27273 - BLOCK
    )
    :vars
    (
      ?auto_27274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27273 ?auto_27274 ) ( not ( = ?auto_27269 ?auto_27270 ) ) ( not ( = ?auto_27269 ?auto_27271 ) ) ( not ( = ?auto_27269 ?auto_27272 ) ) ( not ( = ?auto_27269 ?auto_27273 ) ) ( not ( = ?auto_27269 ?auto_27274 ) ) ( not ( = ?auto_27270 ?auto_27271 ) ) ( not ( = ?auto_27270 ?auto_27272 ) ) ( not ( = ?auto_27270 ?auto_27273 ) ) ( not ( = ?auto_27270 ?auto_27274 ) ) ( not ( = ?auto_27271 ?auto_27272 ) ) ( not ( = ?auto_27271 ?auto_27273 ) ) ( not ( = ?auto_27271 ?auto_27274 ) ) ( not ( = ?auto_27272 ?auto_27273 ) ) ( not ( = ?auto_27272 ?auto_27274 ) ) ( not ( = ?auto_27273 ?auto_27274 ) ) ( ON ?auto_27272 ?auto_27273 ) ( ON ?auto_27271 ?auto_27272 ) ( ON ?auto_27270 ?auto_27271 ) ( ON ?auto_27269 ?auto_27270 ) ( CLEAR ?auto_27269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27269 )
      ( MAKE-5PILE ?auto_27269 ?auto_27270 ?auto_27271 ?auto_27272 ?auto_27273 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_27292 - BLOCK
      ?auto_27293 - BLOCK
      ?auto_27294 - BLOCK
      ?auto_27295 - BLOCK
      ?auto_27296 - BLOCK
      ?auto_27297 - BLOCK
    )
    :vars
    (
      ?auto_27298 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27296 ) ( ON ?auto_27297 ?auto_27298 ) ( CLEAR ?auto_27297 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27292 ) ( ON ?auto_27293 ?auto_27292 ) ( ON ?auto_27294 ?auto_27293 ) ( ON ?auto_27295 ?auto_27294 ) ( ON ?auto_27296 ?auto_27295 ) ( not ( = ?auto_27292 ?auto_27293 ) ) ( not ( = ?auto_27292 ?auto_27294 ) ) ( not ( = ?auto_27292 ?auto_27295 ) ) ( not ( = ?auto_27292 ?auto_27296 ) ) ( not ( = ?auto_27292 ?auto_27297 ) ) ( not ( = ?auto_27292 ?auto_27298 ) ) ( not ( = ?auto_27293 ?auto_27294 ) ) ( not ( = ?auto_27293 ?auto_27295 ) ) ( not ( = ?auto_27293 ?auto_27296 ) ) ( not ( = ?auto_27293 ?auto_27297 ) ) ( not ( = ?auto_27293 ?auto_27298 ) ) ( not ( = ?auto_27294 ?auto_27295 ) ) ( not ( = ?auto_27294 ?auto_27296 ) ) ( not ( = ?auto_27294 ?auto_27297 ) ) ( not ( = ?auto_27294 ?auto_27298 ) ) ( not ( = ?auto_27295 ?auto_27296 ) ) ( not ( = ?auto_27295 ?auto_27297 ) ) ( not ( = ?auto_27295 ?auto_27298 ) ) ( not ( = ?auto_27296 ?auto_27297 ) ) ( not ( = ?auto_27296 ?auto_27298 ) ) ( not ( = ?auto_27297 ?auto_27298 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27297 ?auto_27298 )
      ( !STACK ?auto_27297 ?auto_27296 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_27318 - BLOCK
      ?auto_27319 - BLOCK
      ?auto_27320 - BLOCK
      ?auto_27321 - BLOCK
      ?auto_27322 - BLOCK
      ?auto_27323 - BLOCK
    )
    :vars
    (
      ?auto_27324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27323 ?auto_27324 ) ( ON-TABLE ?auto_27318 ) ( ON ?auto_27319 ?auto_27318 ) ( ON ?auto_27320 ?auto_27319 ) ( ON ?auto_27321 ?auto_27320 ) ( not ( = ?auto_27318 ?auto_27319 ) ) ( not ( = ?auto_27318 ?auto_27320 ) ) ( not ( = ?auto_27318 ?auto_27321 ) ) ( not ( = ?auto_27318 ?auto_27322 ) ) ( not ( = ?auto_27318 ?auto_27323 ) ) ( not ( = ?auto_27318 ?auto_27324 ) ) ( not ( = ?auto_27319 ?auto_27320 ) ) ( not ( = ?auto_27319 ?auto_27321 ) ) ( not ( = ?auto_27319 ?auto_27322 ) ) ( not ( = ?auto_27319 ?auto_27323 ) ) ( not ( = ?auto_27319 ?auto_27324 ) ) ( not ( = ?auto_27320 ?auto_27321 ) ) ( not ( = ?auto_27320 ?auto_27322 ) ) ( not ( = ?auto_27320 ?auto_27323 ) ) ( not ( = ?auto_27320 ?auto_27324 ) ) ( not ( = ?auto_27321 ?auto_27322 ) ) ( not ( = ?auto_27321 ?auto_27323 ) ) ( not ( = ?auto_27321 ?auto_27324 ) ) ( not ( = ?auto_27322 ?auto_27323 ) ) ( not ( = ?auto_27322 ?auto_27324 ) ) ( not ( = ?auto_27323 ?auto_27324 ) ) ( CLEAR ?auto_27321 ) ( ON ?auto_27322 ?auto_27323 ) ( CLEAR ?auto_27322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27318 ?auto_27319 ?auto_27320 ?auto_27321 ?auto_27322 )
      ( MAKE-6PILE ?auto_27318 ?auto_27319 ?auto_27320 ?auto_27321 ?auto_27322 ?auto_27323 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_27344 - BLOCK
      ?auto_27345 - BLOCK
      ?auto_27346 - BLOCK
      ?auto_27347 - BLOCK
      ?auto_27348 - BLOCK
      ?auto_27349 - BLOCK
    )
    :vars
    (
      ?auto_27350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27349 ?auto_27350 ) ( ON-TABLE ?auto_27344 ) ( ON ?auto_27345 ?auto_27344 ) ( ON ?auto_27346 ?auto_27345 ) ( not ( = ?auto_27344 ?auto_27345 ) ) ( not ( = ?auto_27344 ?auto_27346 ) ) ( not ( = ?auto_27344 ?auto_27347 ) ) ( not ( = ?auto_27344 ?auto_27348 ) ) ( not ( = ?auto_27344 ?auto_27349 ) ) ( not ( = ?auto_27344 ?auto_27350 ) ) ( not ( = ?auto_27345 ?auto_27346 ) ) ( not ( = ?auto_27345 ?auto_27347 ) ) ( not ( = ?auto_27345 ?auto_27348 ) ) ( not ( = ?auto_27345 ?auto_27349 ) ) ( not ( = ?auto_27345 ?auto_27350 ) ) ( not ( = ?auto_27346 ?auto_27347 ) ) ( not ( = ?auto_27346 ?auto_27348 ) ) ( not ( = ?auto_27346 ?auto_27349 ) ) ( not ( = ?auto_27346 ?auto_27350 ) ) ( not ( = ?auto_27347 ?auto_27348 ) ) ( not ( = ?auto_27347 ?auto_27349 ) ) ( not ( = ?auto_27347 ?auto_27350 ) ) ( not ( = ?auto_27348 ?auto_27349 ) ) ( not ( = ?auto_27348 ?auto_27350 ) ) ( not ( = ?auto_27349 ?auto_27350 ) ) ( ON ?auto_27348 ?auto_27349 ) ( CLEAR ?auto_27346 ) ( ON ?auto_27347 ?auto_27348 ) ( CLEAR ?auto_27347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27344 ?auto_27345 ?auto_27346 ?auto_27347 )
      ( MAKE-6PILE ?auto_27344 ?auto_27345 ?auto_27346 ?auto_27347 ?auto_27348 ?auto_27349 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_27370 - BLOCK
      ?auto_27371 - BLOCK
      ?auto_27372 - BLOCK
      ?auto_27373 - BLOCK
      ?auto_27374 - BLOCK
      ?auto_27375 - BLOCK
    )
    :vars
    (
      ?auto_27376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27375 ?auto_27376 ) ( ON-TABLE ?auto_27370 ) ( ON ?auto_27371 ?auto_27370 ) ( not ( = ?auto_27370 ?auto_27371 ) ) ( not ( = ?auto_27370 ?auto_27372 ) ) ( not ( = ?auto_27370 ?auto_27373 ) ) ( not ( = ?auto_27370 ?auto_27374 ) ) ( not ( = ?auto_27370 ?auto_27375 ) ) ( not ( = ?auto_27370 ?auto_27376 ) ) ( not ( = ?auto_27371 ?auto_27372 ) ) ( not ( = ?auto_27371 ?auto_27373 ) ) ( not ( = ?auto_27371 ?auto_27374 ) ) ( not ( = ?auto_27371 ?auto_27375 ) ) ( not ( = ?auto_27371 ?auto_27376 ) ) ( not ( = ?auto_27372 ?auto_27373 ) ) ( not ( = ?auto_27372 ?auto_27374 ) ) ( not ( = ?auto_27372 ?auto_27375 ) ) ( not ( = ?auto_27372 ?auto_27376 ) ) ( not ( = ?auto_27373 ?auto_27374 ) ) ( not ( = ?auto_27373 ?auto_27375 ) ) ( not ( = ?auto_27373 ?auto_27376 ) ) ( not ( = ?auto_27374 ?auto_27375 ) ) ( not ( = ?auto_27374 ?auto_27376 ) ) ( not ( = ?auto_27375 ?auto_27376 ) ) ( ON ?auto_27374 ?auto_27375 ) ( ON ?auto_27373 ?auto_27374 ) ( CLEAR ?auto_27371 ) ( ON ?auto_27372 ?auto_27373 ) ( CLEAR ?auto_27372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27370 ?auto_27371 ?auto_27372 )
      ( MAKE-6PILE ?auto_27370 ?auto_27371 ?auto_27372 ?auto_27373 ?auto_27374 ?auto_27375 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_27396 - BLOCK
      ?auto_27397 - BLOCK
      ?auto_27398 - BLOCK
      ?auto_27399 - BLOCK
      ?auto_27400 - BLOCK
      ?auto_27401 - BLOCK
    )
    :vars
    (
      ?auto_27402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27401 ?auto_27402 ) ( ON-TABLE ?auto_27396 ) ( not ( = ?auto_27396 ?auto_27397 ) ) ( not ( = ?auto_27396 ?auto_27398 ) ) ( not ( = ?auto_27396 ?auto_27399 ) ) ( not ( = ?auto_27396 ?auto_27400 ) ) ( not ( = ?auto_27396 ?auto_27401 ) ) ( not ( = ?auto_27396 ?auto_27402 ) ) ( not ( = ?auto_27397 ?auto_27398 ) ) ( not ( = ?auto_27397 ?auto_27399 ) ) ( not ( = ?auto_27397 ?auto_27400 ) ) ( not ( = ?auto_27397 ?auto_27401 ) ) ( not ( = ?auto_27397 ?auto_27402 ) ) ( not ( = ?auto_27398 ?auto_27399 ) ) ( not ( = ?auto_27398 ?auto_27400 ) ) ( not ( = ?auto_27398 ?auto_27401 ) ) ( not ( = ?auto_27398 ?auto_27402 ) ) ( not ( = ?auto_27399 ?auto_27400 ) ) ( not ( = ?auto_27399 ?auto_27401 ) ) ( not ( = ?auto_27399 ?auto_27402 ) ) ( not ( = ?auto_27400 ?auto_27401 ) ) ( not ( = ?auto_27400 ?auto_27402 ) ) ( not ( = ?auto_27401 ?auto_27402 ) ) ( ON ?auto_27400 ?auto_27401 ) ( ON ?auto_27399 ?auto_27400 ) ( ON ?auto_27398 ?auto_27399 ) ( CLEAR ?auto_27396 ) ( ON ?auto_27397 ?auto_27398 ) ( CLEAR ?auto_27397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27396 ?auto_27397 )
      ( MAKE-6PILE ?auto_27396 ?auto_27397 ?auto_27398 ?auto_27399 ?auto_27400 ?auto_27401 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_27422 - BLOCK
      ?auto_27423 - BLOCK
      ?auto_27424 - BLOCK
      ?auto_27425 - BLOCK
      ?auto_27426 - BLOCK
      ?auto_27427 - BLOCK
    )
    :vars
    (
      ?auto_27428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27427 ?auto_27428 ) ( not ( = ?auto_27422 ?auto_27423 ) ) ( not ( = ?auto_27422 ?auto_27424 ) ) ( not ( = ?auto_27422 ?auto_27425 ) ) ( not ( = ?auto_27422 ?auto_27426 ) ) ( not ( = ?auto_27422 ?auto_27427 ) ) ( not ( = ?auto_27422 ?auto_27428 ) ) ( not ( = ?auto_27423 ?auto_27424 ) ) ( not ( = ?auto_27423 ?auto_27425 ) ) ( not ( = ?auto_27423 ?auto_27426 ) ) ( not ( = ?auto_27423 ?auto_27427 ) ) ( not ( = ?auto_27423 ?auto_27428 ) ) ( not ( = ?auto_27424 ?auto_27425 ) ) ( not ( = ?auto_27424 ?auto_27426 ) ) ( not ( = ?auto_27424 ?auto_27427 ) ) ( not ( = ?auto_27424 ?auto_27428 ) ) ( not ( = ?auto_27425 ?auto_27426 ) ) ( not ( = ?auto_27425 ?auto_27427 ) ) ( not ( = ?auto_27425 ?auto_27428 ) ) ( not ( = ?auto_27426 ?auto_27427 ) ) ( not ( = ?auto_27426 ?auto_27428 ) ) ( not ( = ?auto_27427 ?auto_27428 ) ) ( ON ?auto_27426 ?auto_27427 ) ( ON ?auto_27425 ?auto_27426 ) ( ON ?auto_27424 ?auto_27425 ) ( ON ?auto_27423 ?auto_27424 ) ( ON ?auto_27422 ?auto_27423 ) ( CLEAR ?auto_27422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27422 )
      ( MAKE-6PILE ?auto_27422 ?auto_27423 ?auto_27424 ?auto_27425 ?auto_27426 ?auto_27427 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27449 - BLOCK
      ?auto_27450 - BLOCK
      ?auto_27451 - BLOCK
      ?auto_27452 - BLOCK
      ?auto_27453 - BLOCK
      ?auto_27454 - BLOCK
      ?auto_27455 - BLOCK
    )
    :vars
    (
      ?auto_27456 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27454 ) ( ON ?auto_27455 ?auto_27456 ) ( CLEAR ?auto_27455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27449 ) ( ON ?auto_27450 ?auto_27449 ) ( ON ?auto_27451 ?auto_27450 ) ( ON ?auto_27452 ?auto_27451 ) ( ON ?auto_27453 ?auto_27452 ) ( ON ?auto_27454 ?auto_27453 ) ( not ( = ?auto_27449 ?auto_27450 ) ) ( not ( = ?auto_27449 ?auto_27451 ) ) ( not ( = ?auto_27449 ?auto_27452 ) ) ( not ( = ?auto_27449 ?auto_27453 ) ) ( not ( = ?auto_27449 ?auto_27454 ) ) ( not ( = ?auto_27449 ?auto_27455 ) ) ( not ( = ?auto_27449 ?auto_27456 ) ) ( not ( = ?auto_27450 ?auto_27451 ) ) ( not ( = ?auto_27450 ?auto_27452 ) ) ( not ( = ?auto_27450 ?auto_27453 ) ) ( not ( = ?auto_27450 ?auto_27454 ) ) ( not ( = ?auto_27450 ?auto_27455 ) ) ( not ( = ?auto_27450 ?auto_27456 ) ) ( not ( = ?auto_27451 ?auto_27452 ) ) ( not ( = ?auto_27451 ?auto_27453 ) ) ( not ( = ?auto_27451 ?auto_27454 ) ) ( not ( = ?auto_27451 ?auto_27455 ) ) ( not ( = ?auto_27451 ?auto_27456 ) ) ( not ( = ?auto_27452 ?auto_27453 ) ) ( not ( = ?auto_27452 ?auto_27454 ) ) ( not ( = ?auto_27452 ?auto_27455 ) ) ( not ( = ?auto_27452 ?auto_27456 ) ) ( not ( = ?auto_27453 ?auto_27454 ) ) ( not ( = ?auto_27453 ?auto_27455 ) ) ( not ( = ?auto_27453 ?auto_27456 ) ) ( not ( = ?auto_27454 ?auto_27455 ) ) ( not ( = ?auto_27454 ?auto_27456 ) ) ( not ( = ?auto_27455 ?auto_27456 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27455 ?auto_27456 )
      ( !STACK ?auto_27455 ?auto_27454 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27464 - BLOCK
      ?auto_27465 - BLOCK
      ?auto_27466 - BLOCK
      ?auto_27467 - BLOCK
      ?auto_27468 - BLOCK
      ?auto_27469 - BLOCK
      ?auto_27470 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27469 ) ( ON-TABLE ?auto_27470 ) ( CLEAR ?auto_27470 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27464 ) ( ON ?auto_27465 ?auto_27464 ) ( ON ?auto_27466 ?auto_27465 ) ( ON ?auto_27467 ?auto_27466 ) ( ON ?auto_27468 ?auto_27467 ) ( ON ?auto_27469 ?auto_27468 ) ( not ( = ?auto_27464 ?auto_27465 ) ) ( not ( = ?auto_27464 ?auto_27466 ) ) ( not ( = ?auto_27464 ?auto_27467 ) ) ( not ( = ?auto_27464 ?auto_27468 ) ) ( not ( = ?auto_27464 ?auto_27469 ) ) ( not ( = ?auto_27464 ?auto_27470 ) ) ( not ( = ?auto_27465 ?auto_27466 ) ) ( not ( = ?auto_27465 ?auto_27467 ) ) ( not ( = ?auto_27465 ?auto_27468 ) ) ( not ( = ?auto_27465 ?auto_27469 ) ) ( not ( = ?auto_27465 ?auto_27470 ) ) ( not ( = ?auto_27466 ?auto_27467 ) ) ( not ( = ?auto_27466 ?auto_27468 ) ) ( not ( = ?auto_27466 ?auto_27469 ) ) ( not ( = ?auto_27466 ?auto_27470 ) ) ( not ( = ?auto_27467 ?auto_27468 ) ) ( not ( = ?auto_27467 ?auto_27469 ) ) ( not ( = ?auto_27467 ?auto_27470 ) ) ( not ( = ?auto_27468 ?auto_27469 ) ) ( not ( = ?auto_27468 ?auto_27470 ) ) ( not ( = ?auto_27469 ?auto_27470 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_27470 )
      ( !STACK ?auto_27470 ?auto_27469 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27478 - BLOCK
      ?auto_27479 - BLOCK
      ?auto_27480 - BLOCK
      ?auto_27481 - BLOCK
      ?auto_27482 - BLOCK
      ?auto_27483 - BLOCK
      ?auto_27484 - BLOCK
    )
    :vars
    (
      ?auto_27485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27484 ?auto_27485 ) ( ON-TABLE ?auto_27478 ) ( ON ?auto_27479 ?auto_27478 ) ( ON ?auto_27480 ?auto_27479 ) ( ON ?auto_27481 ?auto_27480 ) ( ON ?auto_27482 ?auto_27481 ) ( not ( = ?auto_27478 ?auto_27479 ) ) ( not ( = ?auto_27478 ?auto_27480 ) ) ( not ( = ?auto_27478 ?auto_27481 ) ) ( not ( = ?auto_27478 ?auto_27482 ) ) ( not ( = ?auto_27478 ?auto_27483 ) ) ( not ( = ?auto_27478 ?auto_27484 ) ) ( not ( = ?auto_27478 ?auto_27485 ) ) ( not ( = ?auto_27479 ?auto_27480 ) ) ( not ( = ?auto_27479 ?auto_27481 ) ) ( not ( = ?auto_27479 ?auto_27482 ) ) ( not ( = ?auto_27479 ?auto_27483 ) ) ( not ( = ?auto_27479 ?auto_27484 ) ) ( not ( = ?auto_27479 ?auto_27485 ) ) ( not ( = ?auto_27480 ?auto_27481 ) ) ( not ( = ?auto_27480 ?auto_27482 ) ) ( not ( = ?auto_27480 ?auto_27483 ) ) ( not ( = ?auto_27480 ?auto_27484 ) ) ( not ( = ?auto_27480 ?auto_27485 ) ) ( not ( = ?auto_27481 ?auto_27482 ) ) ( not ( = ?auto_27481 ?auto_27483 ) ) ( not ( = ?auto_27481 ?auto_27484 ) ) ( not ( = ?auto_27481 ?auto_27485 ) ) ( not ( = ?auto_27482 ?auto_27483 ) ) ( not ( = ?auto_27482 ?auto_27484 ) ) ( not ( = ?auto_27482 ?auto_27485 ) ) ( not ( = ?auto_27483 ?auto_27484 ) ) ( not ( = ?auto_27483 ?auto_27485 ) ) ( not ( = ?auto_27484 ?auto_27485 ) ) ( CLEAR ?auto_27482 ) ( ON ?auto_27483 ?auto_27484 ) ( CLEAR ?auto_27483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_27478 ?auto_27479 ?auto_27480 ?auto_27481 ?auto_27482 ?auto_27483 )
      ( MAKE-7PILE ?auto_27478 ?auto_27479 ?auto_27480 ?auto_27481 ?auto_27482 ?auto_27483 ?auto_27484 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27493 - BLOCK
      ?auto_27494 - BLOCK
      ?auto_27495 - BLOCK
      ?auto_27496 - BLOCK
      ?auto_27497 - BLOCK
      ?auto_27498 - BLOCK
      ?auto_27499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27499 ) ( ON-TABLE ?auto_27493 ) ( ON ?auto_27494 ?auto_27493 ) ( ON ?auto_27495 ?auto_27494 ) ( ON ?auto_27496 ?auto_27495 ) ( ON ?auto_27497 ?auto_27496 ) ( not ( = ?auto_27493 ?auto_27494 ) ) ( not ( = ?auto_27493 ?auto_27495 ) ) ( not ( = ?auto_27493 ?auto_27496 ) ) ( not ( = ?auto_27493 ?auto_27497 ) ) ( not ( = ?auto_27493 ?auto_27498 ) ) ( not ( = ?auto_27493 ?auto_27499 ) ) ( not ( = ?auto_27494 ?auto_27495 ) ) ( not ( = ?auto_27494 ?auto_27496 ) ) ( not ( = ?auto_27494 ?auto_27497 ) ) ( not ( = ?auto_27494 ?auto_27498 ) ) ( not ( = ?auto_27494 ?auto_27499 ) ) ( not ( = ?auto_27495 ?auto_27496 ) ) ( not ( = ?auto_27495 ?auto_27497 ) ) ( not ( = ?auto_27495 ?auto_27498 ) ) ( not ( = ?auto_27495 ?auto_27499 ) ) ( not ( = ?auto_27496 ?auto_27497 ) ) ( not ( = ?auto_27496 ?auto_27498 ) ) ( not ( = ?auto_27496 ?auto_27499 ) ) ( not ( = ?auto_27497 ?auto_27498 ) ) ( not ( = ?auto_27497 ?auto_27499 ) ) ( not ( = ?auto_27498 ?auto_27499 ) ) ( CLEAR ?auto_27497 ) ( ON ?auto_27498 ?auto_27499 ) ( CLEAR ?auto_27498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_27493 ?auto_27494 ?auto_27495 ?auto_27496 ?auto_27497 ?auto_27498 )
      ( MAKE-7PILE ?auto_27493 ?auto_27494 ?auto_27495 ?auto_27496 ?auto_27497 ?auto_27498 ?auto_27499 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27507 - BLOCK
      ?auto_27508 - BLOCK
      ?auto_27509 - BLOCK
      ?auto_27510 - BLOCK
      ?auto_27511 - BLOCK
      ?auto_27512 - BLOCK
      ?auto_27513 - BLOCK
    )
    :vars
    (
      ?auto_27514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27513 ?auto_27514 ) ( ON-TABLE ?auto_27507 ) ( ON ?auto_27508 ?auto_27507 ) ( ON ?auto_27509 ?auto_27508 ) ( ON ?auto_27510 ?auto_27509 ) ( not ( = ?auto_27507 ?auto_27508 ) ) ( not ( = ?auto_27507 ?auto_27509 ) ) ( not ( = ?auto_27507 ?auto_27510 ) ) ( not ( = ?auto_27507 ?auto_27511 ) ) ( not ( = ?auto_27507 ?auto_27512 ) ) ( not ( = ?auto_27507 ?auto_27513 ) ) ( not ( = ?auto_27507 ?auto_27514 ) ) ( not ( = ?auto_27508 ?auto_27509 ) ) ( not ( = ?auto_27508 ?auto_27510 ) ) ( not ( = ?auto_27508 ?auto_27511 ) ) ( not ( = ?auto_27508 ?auto_27512 ) ) ( not ( = ?auto_27508 ?auto_27513 ) ) ( not ( = ?auto_27508 ?auto_27514 ) ) ( not ( = ?auto_27509 ?auto_27510 ) ) ( not ( = ?auto_27509 ?auto_27511 ) ) ( not ( = ?auto_27509 ?auto_27512 ) ) ( not ( = ?auto_27509 ?auto_27513 ) ) ( not ( = ?auto_27509 ?auto_27514 ) ) ( not ( = ?auto_27510 ?auto_27511 ) ) ( not ( = ?auto_27510 ?auto_27512 ) ) ( not ( = ?auto_27510 ?auto_27513 ) ) ( not ( = ?auto_27510 ?auto_27514 ) ) ( not ( = ?auto_27511 ?auto_27512 ) ) ( not ( = ?auto_27511 ?auto_27513 ) ) ( not ( = ?auto_27511 ?auto_27514 ) ) ( not ( = ?auto_27512 ?auto_27513 ) ) ( not ( = ?auto_27512 ?auto_27514 ) ) ( not ( = ?auto_27513 ?auto_27514 ) ) ( ON ?auto_27512 ?auto_27513 ) ( CLEAR ?auto_27510 ) ( ON ?auto_27511 ?auto_27512 ) ( CLEAR ?auto_27511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27507 ?auto_27508 ?auto_27509 ?auto_27510 ?auto_27511 )
      ( MAKE-7PILE ?auto_27507 ?auto_27508 ?auto_27509 ?auto_27510 ?auto_27511 ?auto_27512 ?auto_27513 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27522 - BLOCK
      ?auto_27523 - BLOCK
      ?auto_27524 - BLOCK
      ?auto_27525 - BLOCK
      ?auto_27526 - BLOCK
      ?auto_27527 - BLOCK
      ?auto_27528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27528 ) ( ON-TABLE ?auto_27522 ) ( ON ?auto_27523 ?auto_27522 ) ( ON ?auto_27524 ?auto_27523 ) ( ON ?auto_27525 ?auto_27524 ) ( not ( = ?auto_27522 ?auto_27523 ) ) ( not ( = ?auto_27522 ?auto_27524 ) ) ( not ( = ?auto_27522 ?auto_27525 ) ) ( not ( = ?auto_27522 ?auto_27526 ) ) ( not ( = ?auto_27522 ?auto_27527 ) ) ( not ( = ?auto_27522 ?auto_27528 ) ) ( not ( = ?auto_27523 ?auto_27524 ) ) ( not ( = ?auto_27523 ?auto_27525 ) ) ( not ( = ?auto_27523 ?auto_27526 ) ) ( not ( = ?auto_27523 ?auto_27527 ) ) ( not ( = ?auto_27523 ?auto_27528 ) ) ( not ( = ?auto_27524 ?auto_27525 ) ) ( not ( = ?auto_27524 ?auto_27526 ) ) ( not ( = ?auto_27524 ?auto_27527 ) ) ( not ( = ?auto_27524 ?auto_27528 ) ) ( not ( = ?auto_27525 ?auto_27526 ) ) ( not ( = ?auto_27525 ?auto_27527 ) ) ( not ( = ?auto_27525 ?auto_27528 ) ) ( not ( = ?auto_27526 ?auto_27527 ) ) ( not ( = ?auto_27526 ?auto_27528 ) ) ( not ( = ?auto_27527 ?auto_27528 ) ) ( ON ?auto_27527 ?auto_27528 ) ( CLEAR ?auto_27525 ) ( ON ?auto_27526 ?auto_27527 ) ( CLEAR ?auto_27526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27522 ?auto_27523 ?auto_27524 ?auto_27525 ?auto_27526 )
      ( MAKE-7PILE ?auto_27522 ?auto_27523 ?auto_27524 ?auto_27525 ?auto_27526 ?auto_27527 ?auto_27528 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27536 - BLOCK
      ?auto_27537 - BLOCK
      ?auto_27538 - BLOCK
      ?auto_27539 - BLOCK
      ?auto_27540 - BLOCK
      ?auto_27541 - BLOCK
      ?auto_27542 - BLOCK
    )
    :vars
    (
      ?auto_27543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27542 ?auto_27543 ) ( ON-TABLE ?auto_27536 ) ( ON ?auto_27537 ?auto_27536 ) ( ON ?auto_27538 ?auto_27537 ) ( not ( = ?auto_27536 ?auto_27537 ) ) ( not ( = ?auto_27536 ?auto_27538 ) ) ( not ( = ?auto_27536 ?auto_27539 ) ) ( not ( = ?auto_27536 ?auto_27540 ) ) ( not ( = ?auto_27536 ?auto_27541 ) ) ( not ( = ?auto_27536 ?auto_27542 ) ) ( not ( = ?auto_27536 ?auto_27543 ) ) ( not ( = ?auto_27537 ?auto_27538 ) ) ( not ( = ?auto_27537 ?auto_27539 ) ) ( not ( = ?auto_27537 ?auto_27540 ) ) ( not ( = ?auto_27537 ?auto_27541 ) ) ( not ( = ?auto_27537 ?auto_27542 ) ) ( not ( = ?auto_27537 ?auto_27543 ) ) ( not ( = ?auto_27538 ?auto_27539 ) ) ( not ( = ?auto_27538 ?auto_27540 ) ) ( not ( = ?auto_27538 ?auto_27541 ) ) ( not ( = ?auto_27538 ?auto_27542 ) ) ( not ( = ?auto_27538 ?auto_27543 ) ) ( not ( = ?auto_27539 ?auto_27540 ) ) ( not ( = ?auto_27539 ?auto_27541 ) ) ( not ( = ?auto_27539 ?auto_27542 ) ) ( not ( = ?auto_27539 ?auto_27543 ) ) ( not ( = ?auto_27540 ?auto_27541 ) ) ( not ( = ?auto_27540 ?auto_27542 ) ) ( not ( = ?auto_27540 ?auto_27543 ) ) ( not ( = ?auto_27541 ?auto_27542 ) ) ( not ( = ?auto_27541 ?auto_27543 ) ) ( not ( = ?auto_27542 ?auto_27543 ) ) ( ON ?auto_27541 ?auto_27542 ) ( ON ?auto_27540 ?auto_27541 ) ( CLEAR ?auto_27538 ) ( ON ?auto_27539 ?auto_27540 ) ( CLEAR ?auto_27539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27536 ?auto_27537 ?auto_27538 ?auto_27539 )
      ( MAKE-7PILE ?auto_27536 ?auto_27537 ?auto_27538 ?auto_27539 ?auto_27540 ?auto_27541 ?auto_27542 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27551 - BLOCK
      ?auto_27552 - BLOCK
      ?auto_27553 - BLOCK
      ?auto_27554 - BLOCK
      ?auto_27555 - BLOCK
      ?auto_27556 - BLOCK
      ?auto_27557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27557 ) ( ON-TABLE ?auto_27551 ) ( ON ?auto_27552 ?auto_27551 ) ( ON ?auto_27553 ?auto_27552 ) ( not ( = ?auto_27551 ?auto_27552 ) ) ( not ( = ?auto_27551 ?auto_27553 ) ) ( not ( = ?auto_27551 ?auto_27554 ) ) ( not ( = ?auto_27551 ?auto_27555 ) ) ( not ( = ?auto_27551 ?auto_27556 ) ) ( not ( = ?auto_27551 ?auto_27557 ) ) ( not ( = ?auto_27552 ?auto_27553 ) ) ( not ( = ?auto_27552 ?auto_27554 ) ) ( not ( = ?auto_27552 ?auto_27555 ) ) ( not ( = ?auto_27552 ?auto_27556 ) ) ( not ( = ?auto_27552 ?auto_27557 ) ) ( not ( = ?auto_27553 ?auto_27554 ) ) ( not ( = ?auto_27553 ?auto_27555 ) ) ( not ( = ?auto_27553 ?auto_27556 ) ) ( not ( = ?auto_27553 ?auto_27557 ) ) ( not ( = ?auto_27554 ?auto_27555 ) ) ( not ( = ?auto_27554 ?auto_27556 ) ) ( not ( = ?auto_27554 ?auto_27557 ) ) ( not ( = ?auto_27555 ?auto_27556 ) ) ( not ( = ?auto_27555 ?auto_27557 ) ) ( not ( = ?auto_27556 ?auto_27557 ) ) ( ON ?auto_27556 ?auto_27557 ) ( ON ?auto_27555 ?auto_27556 ) ( CLEAR ?auto_27553 ) ( ON ?auto_27554 ?auto_27555 ) ( CLEAR ?auto_27554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27551 ?auto_27552 ?auto_27553 ?auto_27554 )
      ( MAKE-7PILE ?auto_27551 ?auto_27552 ?auto_27553 ?auto_27554 ?auto_27555 ?auto_27556 ?auto_27557 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27565 - BLOCK
      ?auto_27566 - BLOCK
      ?auto_27567 - BLOCK
      ?auto_27568 - BLOCK
      ?auto_27569 - BLOCK
      ?auto_27570 - BLOCK
      ?auto_27571 - BLOCK
    )
    :vars
    (
      ?auto_27572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27571 ?auto_27572 ) ( ON-TABLE ?auto_27565 ) ( ON ?auto_27566 ?auto_27565 ) ( not ( = ?auto_27565 ?auto_27566 ) ) ( not ( = ?auto_27565 ?auto_27567 ) ) ( not ( = ?auto_27565 ?auto_27568 ) ) ( not ( = ?auto_27565 ?auto_27569 ) ) ( not ( = ?auto_27565 ?auto_27570 ) ) ( not ( = ?auto_27565 ?auto_27571 ) ) ( not ( = ?auto_27565 ?auto_27572 ) ) ( not ( = ?auto_27566 ?auto_27567 ) ) ( not ( = ?auto_27566 ?auto_27568 ) ) ( not ( = ?auto_27566 ?auto_27569 ) ) ( not ( = ?auto_27566 ?auto_27570 ) ) ( not ( = ?auto_27566 ?auto_27571 ) ) ( not ( = ?auto_27566 ?auto_27572 ) ) ( not ( = ?auto_27567 ?auto_27568 ) ) ( not ( = ?auto_27567 ?auto_27569 ) ) ( not ( = ?auto_27567 ?auto_27570 ) ) ( not ( = ?auto_27567 ?auto_27571 ) ) ( not ( = ?auto_27567 ?auto_27572 ) ) ( not ( = ?auto_27568 ?auto_27569 ) ) ( not ( = ?auto_27568 ?auto_27570 ) ) ( not ( = ?auto_27568 ?auto_27571 ) ) ( not ( = ?auto_27568 ?auto_27572 ) ) ( not ( = ?auto_27569 ?auto_27570 ) ) ( not ( = ?auto_27569 ?auto_27571 ) ) ( not ( = ?auto_27569 ?auto_27572 ) ) ( not ( = ?auto_27570 ?auto_27571 ) ) ( not ( = ?auto_27570 ?auto_27572 ) ) ( not ( = ?auto_27571 ?auto_27572 ) ) ( ON ?auto_27570 ?auto_27571 ) ( ON ?auto_27569 ?auto_27570 ) ( ON ?auto_27568 ?auto_27569 ) ( CLEAR ?auto_27566 ) ( ON ?auto_27567 ?auto_27568 ) ( CLEAR ?auto_27567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27565 ?auto_27566 ?auto_27567 )
      ( MAKE-7PILE ?auto_27565 ?auto_27566 ?auto_27567 ?auto_27568 ?auto_27569 ?auto_27570 ?auto_27571 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27580 - BLOCK
      ?auto_27581 - BLOCK
      ?auto_27582 - BLOCK
      ?auto_27583 - BLOCK
      ?auto_27584 - BLOCK
      ?auto_27585 - BLOCK
      ?auto_27586 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27586 ) ( ON-TABLE ?auto_27580 ) ( ON ?auto_27581 ?auto_27580 ) ( not ( = ?auto_27580 ?auto_27581 ) ) ( not ( = ?auto_27580 ?auto_27582 ) ) ( not ( = ?auto_27580 ?auto_27583 ) ) ( not ( = ?auto_27580 ?auto_27584 ) ) ( not ( = ?auto_27580 ?auto_27585 ) ) ( not ( = ?auto_27580 ?auto_27586 ) ) ( not ( = ?auto_27581 ?auto_27582 ) ) ( not ( = ?auto_27581 ?auto_27583 ) ) ( not ( = ?auto_27581 ?auto_27584 ) ) ( not ( = ?auto_27581 ?auto_27585 ) ) ( not ( = ?auto_27581 ?auto_27586 ) ) ( not ( = ?auto_27582 ?auto_27583 ) ) ( not ( = ?auto_27582 ?auto_27584 ) ) ( not ( = ?auto_27582 ?auto_27585 ) ) ( not ( = ?auto_27582 ?auto_27586 ) ) ( not ( = ?auto_27583 ?auto_27584 ) ) ( not ( = ?auto_27583 ?auto_27585 ) ) ( not ( = ?auto_27583 ?auto_27586 ) ) ( not ( = ?auto_27584 ?auto_27585 ) ) ( not ( = ?auto_27584 ?auto_27586 ) ) ( not ( = ?auto_27585 ?auto_27586 ) ) ( ON ?auto_27585 ?auto_27586 ) ( ON ?auto_27584 ?auto_27585 ) ( ON ?auto_27583 ?auto_27584 ) ( CLEAR ?auto_27581 ) ( ON ?auto_27582 ?auto_27583 ) ( CLEAR ?auto_27582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27580 ?auto_27581 ?auto_27582 )
      ( MAKE-7PILE ?auto_27580 ?auto_27581 ?auto_27582 ?auto_27583 ?auto_27584 ?auto_27585 ?auto_27586 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27594 - BLOCK
      ?auto_27595 - BLOCK
      ?auto_27596 - BLOCK
      ?auto_27597 - BLOCK
      ?auto_27598 - BLOCK
      ?auto_27599 - BLOCK
      ?auto_27600 - BLOCK
    )
    :vars
    (
      ?auto_27601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27600 ?auto_27601 ) ( ON-TABLE ?auto_27594 ) ( not ( = ?auto_27594 ?auto_27595 ) ) ( not ( = ?auto_27594 ?auto_27596 ) ) ( not ( = ?auto_27594 ?auto_27597 ) ) ( not ( = ?auto_27594 ?auto_27598 ) ) ( not ( = ?auto_27594 ?auto_27599 ) ) ( not ( = ?auto_27594 ?auto_27600 ) ) ( not ( = ?auto_27594 ?auto_27601 ) ) ( not ( = ?auto_27595 ?auto_27596 ) ) ( not ( = ?auto_27595 ?auto_27597 ) ) ( not ( = ?auto_27595 ?auto_27598 ) ) ( not ( = ?auto_27595 ?auto_27599 ) ) ( not ( = ?auto_27595 ?auto_27600 ) ) ( not ( = ?auto_27595 ?auto_27601 ) ) ( not ( = ?auto_27596 ?auto_27597 ) ) ( not ( = ?auto_27596 ?auto_27598 ) ) ( not ( = ?auto_27596 ?auto_27599 ) ) ( not ( = ?auto_27596 ?auto_27600 ) ) ( not ( = ?auto_27596 ?auto_27601 ) ) ( not ( = ?auto_27597 ?auto_27598 ) ) ( not ( = ?auto_27597 ?auto_27599 ) ) ( not ( = ?auto_27597 ?auto_27600 ) ) ( not ( = ?auto_27597 ?auto_27601 ) ) ( not ( = ?auto_27598 ?auto_27599 ) ) ( not ( = ?auto_27598 ?auto_27600 ) ) ( not ( = ?auto_27598 ?auto_27601 ) ) ( not ( = ?auto_27599 ?auto_27600 ) ) ( not ( = ?auto_27599 ?auto_27601 ) ) ( not ( = ?auto_27600 ?auto_27601 ) ) ( ON ?auto_27599 ?auto_27600 ) ( ON ?auto_27598 ?auto_27599 ) ( ON ?auto_27597 ?auto_27598 ) ( ON ?auto_27596 ?auto_27597 ) ( CLEAR ?auto_27594 ) ( ON ?auto_27595 ?auto_27596 ) ( CLEAR ?auto_27595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27594 ?auto_27595 )
      ( MAKE-7PILE ?auto_27594 ?auto_27595 ?auto_27596 ?auto_27597 ?auto_27598 ?auto_27599 ?auto_27600 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27609 - BLOCK
      ?auto_27610 - BLOCK
      ?auto_27611 - BLOCK
      ?auto_27612 - BLOCK
      ?auto_27613 - BLOCK
      ?auto_27614 - BLOCK
      ?auto_27615 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27615 ) ( ON-TABLE ?auto_27609 ) ( not ( = ?auto_27609 ?auto_27610 ) ) ( not ( = ?auto_27609 ?auto_27611 ) ) ( not ( = ?auto_27609 ?auto_27612 ) ) ( not ( = ?auto_27609 ?auto_27613 ) ) ( not ( = ?auto_27609 ?auto_27614 ) ) ( not ( = ?auto_27609 ?auto_27615 ) ) ( not ( = ?auto_27610 ?auto_27611 ) ) ( not ( = ?auto_27610 ?auto_27612 ) ) ( not ( = ?auto_27610 ?auto_27613 ) ) ( not ( = ?auto_27610 ?auto_27614 ) ) ( not ( = ?auto_27610 ?auto_27615 ) ) ( not ( = ?auto_27611 ?auto_27612 ) ) ( not ( = ?auto_27611 ?auto_27613 ) ) ( not ( = ?auto_27611 ?auto_27614 ) ) ( not ( = ?auto_27611 ?auto_27615 ) ) ( not ( = ?auto_27612 ?auto_27613 ) ) ( not ( = ?auto_27612 ?auto_27614 ) ) ( not ( = ?auto_27612 ?auto_27615 ) ) ( not ( = ?auto_27613 ?auto_27614 ) ) ( not ( = ?auto_27613 ?auto_27615 ) ) ( not ( = ?auto_27614 ?auto_27615 ) ) ( ON ?auto_27614 ?auto_27615 ) ( ON ?auto_27613 ?auto_27614 ) ( ON ?auto_27612 ?auto_27613 ) ( ON ?auto_27611 ?auto_27612 ) ( CLEAR ?auto_27609 ) ( ON ?auto_27610 ?auto_27611 ) ( CLEAR ?auto_27610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27609 ?auto_27610 )
      ( MAKE-7PILE ?auto_27609 ?auto_27610 ?auto_27611 ?auto_27612 ?auto_27613 ?auto_27614 ?auto_27615 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27623 - BLOCK
      ?auto_27624 - BLOCK
      ?auto_27625 - BLOCK
      ?auto_27626 - BLOCK
      ?auto_27627 - BLOCK
      ?auto_27628 - BLOCK
      ?auto_27629 - BLOCK
    )
    :vars
    (
      ?auto_27630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27629 ?auto_27630 ) ( not ( = ?auto_27623 ?auto_27624 ) ) ( not ( = ?auto_27623 ?auto_27625 ) ) ( not ( = ?auto_27623 ?auto_27626 ) ) ( not ( = ?auto_27623 ?auto_27627 ) ) ( not ( = ?auto_27623 ?auto_27628 ) ) ( not ( = ?auto_27623 ?auto_27629 ) ) ( not ( = ?auto_27623 ?auto_27630 ) ) ( not ( = ?auto_27624 ?auto_27625 ) ) ( not ( = ?auto_27624 ?auto_27626 ) ) ( not ( = ?auto_27624 ?auto_27627 ) ) ( not ( = ?auto_27624 ?auto_27628 ) ) ( not ( = ?auto_27624 ?auto_27629 ) ) ( not ( = ?auto_27624 ?auto_27630 ) ) ( not ( = ?auto_27625 ?auto_27626 ) ) ( not ( = ?auto_27625 ?auto_27627 ) ) ( not ( = ?auto_27625 ?auto_27628 ) ) ( not ( = ?auto_27625 ?auto_27629 ) ) ( not ( = ?auto_27625 ?auto_27630 ) ) ( not ( = ?auto_27626 ?auto_27627 ) ) ( not ( = ?auto_27626 ?auto_27628 ) ) ( not ( = ?auto_27626 ?auto_27629 ) ) ( not ( = ?auto_27626 ?auto_27630 ) ) ( not ( = ?auto_27627 ?auto_27628 ) ) ( not ( = ?auto_27627 ?auto_27629 ) ) ( not ( = ?auto_27627 ?auto_27630 ) ) ( not ( = ?auto_27628 ?auto_27629 ) ) ( not ( = ?auto_27628 ?auto_27630 ) ) ( not ( = ?auto_27629 ?auto_27630 ) ) ( ON ?auto_27628 ?auto_27629 ) ( ON ?auto_27627 ?auto_27628 ) ( ON ?auto_27626 ?auto_27627 ) ( ON ?auto_27625 ?auto_27626 ) ( ON ?auto_27624 ?auto_27625 ) ( ON ?auto_27623 ?auto_27624 ) ( CLEAR ?auto_27623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27623 )
      ( MAKE-7PILE ?auto_27623 ?auto_27624 ?auto_27625 ?auto_27626 ?auto_27627 ?auto_27628 ?auto_27629 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27638 - BLOCK
      ?auto_27639 - BLOCK
      ?auto_27640 - BLOCK
      ?auto_27641 - BLOCK
      ?auto_27642 - BLOCK
      ?auto_27643 - BLOCK
      ?auto_27644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27644 ) ( not ( = ?auto_27638 ?auto_27639 ) ) ( not ( = ?auto_27638 ?auto_27640 ) ) ( not ( = ?auto_27638 ?auto_27641 ) ) ( not ( = ?auto_27638 ?auto_27642 ) ) ( not ( = ?auto_27638 ?auto_27643 ) ) ( not ( = ?auto_27638 ?auto_27644 ) ) ( not ( = ?auto_27639 ?auto_27640 ) ) ( not ( = ?auto_27639 ?auto_27641 ) ) ( not ( = ?auto_27639 ?auto_27642 ) ) ( not ( = ?auto_27639 ?auto_27643 ) ) ( not ( = ?auto_27639 ?auto_27644 ) ) ( not ( = ?auto_27640 ?auto_27641 ) ) ( not ( = ?auto_27640 ?auto_27642 ) ) ( not ( = ?auto_27640 ?auto_27643 ) ) ( not ( = ?auto_27640 ?auto_27644 ) ) ( not ( = ?auto_27641 ?auto_27642 ) ) ( not ( = ?auto_27641 ?auto_27643 ) ) ( not ( = ?auto_27641 ?auto_27644 ) ) ( not ( = ?auto_27642 ?auto_27643 ) ) ( not ( = ?auto_27642 ?auto_27644 ) ) ( not ( = ?auto_27643 ?auto_27644 ) ) ( ON ?auto_27643 ?auto_27644 ) ( ON ?auto_27642 ?auto_27643 ) ( ON ?auto_27641 ?auto_27642 ) ( ON ?auto_27640 ?auto_27641 ) ( ON ?auto_27639 ?auto_27640 ) ( ON ?auto_27638 ?auto_27639 ) ( CLEAR ?auto_27638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27638 )
      ( MAKE-7PILE ?auto_27638 ?auto_27639 ?auto_27640 ?auto_27641 ?auto_27642 ?auto_27643 ?auto_27644 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_27652 - BLOCK
      ?auto_27653 - BLOCK
      ?auto_27654 - BLOCK
      ?auto_27655 - BLOCK
      ?auto_27656 - BLOCK
      ?auto_27657 - BLOCK
      ?auto_27658 - BLOCK
    )
    :vars
    (
      ?auto_27659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27652 ?auto_27653 ) ) ( not ( = ?auto_27652 ?auto_27654 ) ) ( not ( = ?auto_27652 ?auto_27655 ) ) ( not ( = ?auto_27652 ?auto_27656 ) ) ( not ( = ?auto_27652 ?auto_27657 ) ) ( not ( = ?auto_27652 ?auto_27658 ) ) ( not ( = ?auto_27653 ?auto_27654 ) ) ( not ( = ?auto_27653 ?auto_27655 ) ) ( not ( = ?auto_27653 ?auto_27656 ) ) ( not ( = ?auto_27653 ?auto_27657 ) ) ( not ( = ?auto_27653 ?auto_27658 ) ) ( not ( = ?auto_27654 ?auto_27655 ) ) ( not ( = ?auto_27654 ?auto_27656 ) ) ( not ( = ?auto_27654 ?auto_27657 ) ) ( not ( = ?auto_27654 ?auto_27658 ) ) ( not ( = ?auto_27655 ?auto_27656 ) ) ( not ( = ?auto_27655 ?auto_27657 ) ) ( not ( = ?auto_27655 ?auto_27658 ) ) ( not ( = ?auto_27656 ?auto_27657 ) ) ( not ( = ?auto_27656 ?auto_27658 ) ) ( not ( = ?auto_27657 ?auto_27658 ) ) ( ON ?auto_27652 ?auto_27659 ) ( not ( = ?auto_27658 ?auto_27659 ) ) ( not ( = ?auto_27657 ?auto_27659 ) ) ( not ( = ?auto_27656 ?auto_27659 ) ) ( not ( = ?auto_27655 ?auto_27659 ) ) ( not ( = ?auto_27654 ?auto_27659 ) ) ( not ( = ?auto_27653 ?auto_27659 ) ) ( not ( = ?auto_27652 ?auto_27659 ) ) ( ON ?auto_27653 ?auto_27652 ) ( ON ?auto_27654 ?auto_27653 ) ( ON ?auto_27655 ?auto_27654 ) ( ON ?auto_27656 ?auto_27655 ) ( ON ?auto_27657 ?auto_27656 ) ( ON ?auto_27658 ?auto_27657 ) ( CLEAR ?auto_27658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_27658 ?auto_27657 ?auto_27656 ?auto_27655 ?auto_27654 ?auto_27653 ?auto_27652 )
      ( MAKE-7PILE ?auto_27652 ?auto_27653 ?auto_27654 ?auto_27655 ?auto_27656 ?auto_27657 ?auto_27658 ) )
  )

)
