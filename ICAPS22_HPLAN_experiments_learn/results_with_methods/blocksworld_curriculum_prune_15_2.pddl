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
      ?auto_371053 - BLOCK
    )
    :vars
    (
      ?auto_371054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371053 ?auto_371054 ) ( CLEAR ?auto_371053 ) ( HAND-EMPTY ) ( not ( = ?auto_371053 ?auto_371054 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371053 ?auto_371054 )
      ( !PUTDOWN ?auto_371053 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_371060 - BLOCK
      ?auto_371061 - BLOCK
    )
    :vars
    (
      ?auto_371062 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371060 ) ( ON ?auto_371061 ?auto_371062 ) ( CLEAR ?auto_371061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371060 ) ( not ( = ?auto_371060 ?auto_371061 ) ) ( not ( = ?auto_371060 ?auto_371062 ) ) ( not ( = ?auto_371061 ?auto_371062 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371061 ?auto_371062 )
      ( !STACK ?auto_371061 ?auto_371060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_371070 - BLOCK
      ?auto_371071 - BLOCK
    )
    :vars
    (
      ?auto_371072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371071 ?auto_371072 ) ( not ( = ?auto_371070 ?auto_371071 ) ) ( not ( = ?auto_371070 ?auto_371072 ) ) ( not ( = ?auto_371071 ?auto_371072 ) ) ( ON ?auto_371070 ?auto_371071 ) ( CLEAR ?auto_371070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371070 )
      ( MAKE-2PILE ?auto_371070 ?auto_371071 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_371081 - BLOCK
      ?auto_371082 - BLOCK
      ?auto_371083 - BLOCK
    )
    :vars
    (
      ?auto_371084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371082 ) ( ON ?auto_371083 ?auto_371084 ) ( CLEAR ?auto_371083 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371081 ) ( ON ?auto_371082 ?auto_371081 ) ( not ( = ?auto_371081 ?auto_371082 ) ) ( not ( = ?auto_371081 ?auto_371083 ) ) ( not ( = ?auto_371081 ?auto_371084 ) ) ( not ( = ?auto_371082 ?auto_371083 ) ) ( not ( = ?auto_371082 ?auto_371084 ) ) ( not ( = ?auto_371083 ?auto_371084 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371083 ?auto_371084 )
      ( !STACK ?auto_371083 ?auto_371082 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_371095 - BLOCK
      ?auto_371096 - BLOCK
      ?auto_371097 - BLOCK
    )
    :vars
    (
      ?auto_371098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371097 ?auto_371098 ) ( ON-TABLE ?auto_371095 ) ( not ( = ?auto_371095 ?auto_371096 ) ) ( not ( = ?auto_371095 ?auto_371097 ) ) ( not ( = ?auto_371095 ?auto_371098 ) ) ( not ( = ?auto_371096 ?auto_371097 ) ) ( not ( = ?auto_371096 ?auto_371098 ) ) ( not ( = ?auto_371097 ?auto_371098 ) ) ( CLEAR ?auto_371095 ) ( ON ?auto_371096 ?auto_371097 ) ( CLEAR ?auto_371096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371095 ?auto_371096 )
      ( MAKE-3PILE ?auto_371095 ?auto_371096 ?auto_371097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_371109 - BLOCK
      ?auto_371110 - BLOCK
      ?auto_371111 - BLOCK
    )
    :vars
    (
      ?auto_371112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371111 ?auto_371112 ) ( not ( = ?auto_371109 ?auto_371110 ) ) ( not ( = ?auto_371109 ?auto_371111 ) ) ( not ( = ?auto_371109 ?auto_371112 ) ) ( not ( = ?auto_371110 ?auto_371111 ) ) ( not ( = ?auto_371110 ?auto_371112 ) ) ( not ( = ?auto_371111 ?auto_371112 ) ) ( ON ?auto_371110 ?auto_371111 ) ( ON ?auto_371109 ?auto_371110 ) ( CLEAR ?auto_371109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371109 )
      ( MAKE-3PILE ?auto_371109 ?auto_371110 ?auto_371111 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_371124 - BLOCK
      ?auto_371125 - BLOCK
      ?auto_371126 - BLOCK
      ?auto_371127 - BLOCK
    )
    :vars
    (
      ?auto_371128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371126 ) ( ON ?auto_371127 ?auto_371128 ) ( CLEAR ?auto_371127 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371124 ) ( ON ?auto_371125 ?auto_371124 ) ( ON ?auto_371126 ?auto_371125 ) ( not ( = ?auto_371124 ?auto_371125 ) ) ( not ( = ?auto_371124 ?auto_371126 ) ) ( not ( = ?auto_371124 ?auto_371127 ) ) ( not ( = ?auto_371124 ?auto_371128 ) ) ( not ( = ?auto_371125 ?auto_371126 ) ) ( not ( = ?auto_371125 ?auto_371127 ) ) ( not ( = ?auto_371125 ?auto_371128 ) ) ( not ( = ?auto_371126 ?auto_371127 ) ) ( not ( = ?auto_371126 ?auto_371128 ) ) ( not ( = ?auto_371127 ?auto_371128 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371127 ?auto_371128 )
      ( !STACK ?auto_371127 ?auto_371126 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_371142 - BLOCK
      ?auto_371143 - BLOCK
      ?auto_371144 - BLOCK
      ?auto_371145 - BLOCK
    )
    :vars
    (
      ?auto_371146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371145 ?auto_371146 ) ( ON-TABLE ?auto_371142 ) ( ON ?auto_371143 ?auto_371142 ) ( not ( = ?auto_371142 ?auto_371143 ) ) ( not ( = ?auto_371142 ?auto_371144 ) ) ( not ( = ?auto_371142 ?auto_371145 ) ) ( not ( = ?auto_371142 ?auto_371146 ) ) ( not ( = ?auto_371143 ?auto_371144 ) ) ( not ( = ?auto_371143 ?auto_371145 ) ) ( not ( = ?auto_371143 ?auto_371146 ) ) ( not ( = ?auto_371144 ?auto_371145 ) ) ( not ( = ?auto_371144 ?auto_371146 ) ) ( not ( = ?auto_371145 ?auto_371146 ) ) ( CLEAR ?auto_371143 ) ( ON ?auto_371144 ?auto_371145 ) ( CLEAR ?auto_371144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371142 ?auto_371143 ?auto_371144 )
      ( MAKE-4PILE ?auto_371142 ?auto_371143 ?auto_371144 ?auto_371145 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_371160 - BLOCK
      ?auto_371161 - BLOCK
      ?auto_371162 - BLOCK
      ?auto_371163 - BLOCK
    )
    :vars
    (
      ?auto_371164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371163 ?auto_371164 ) ( ON-TABLE ?auto_371160 ) ( not ( = ?auto_371160 ?auto_371161 ) ) ( not ( = ?auto_371160 ?auto_371162 ) ) ( not ( = ?auto_371160 ?auto_371163 ) ) ( not ( = ?auto_371160 ?auto_371164 ) ) ( not ( = ?auto_371161 ?auto_371162 ) ) ( not ( = ?auto_371161 ?auto_371163 ) ) ( not ( = ?auto_371161 ?auto_371164 ) ) ( not ( = ?auto_371162 ?auto_371163 ) ) ( not ( = ?auto_371162 ?auto_371164 ) ) ( not ( = ?auto_371163 ?auto_371164 ) ) ( ON ?auto_371162 ?auto_371163 ) ( CLEAR ?auto_371160 ) ( ON ?auto_371161 ?auto_371162 ) ( CLEAR ?auto_371161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371160 ?auto_371161 )
      ( MAKE-4PILE ?auto_371160 ?auto_371161 ?auto_371162 ?auto_371163 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_371178 - BLOCK
      ?auto_371179 - BLOCK
      ?auto_371180 - BLOCK
      ?auto_371181 - BLOCK
    )
    :vars
    (
      ?auto_371182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371181 ?auto_371182 ) ( not ( = ?auto_371178 ?auto_371179 ) ) ( not ( = ?auto_371178 ?auto_371180 ) ) ( not ( = ?auto_371178 ?auto_371181 ) ) ( not ( = ?auto_371178 ?auto_371182 ) ) ( not ( = ?auto_371179 ?auto_371180 ) ) ( not ( = ?auto_371179 ?auto_371181 ) ) ( not ( = ?auto_371179 ?auto_371182 ) ) ( not ( = ?auto_371180 ?auto_371181 ) ) ( not ( = ?auto_371180 ?auto_371182 ) ) ( not ( = ?auto_371181 ?auto_371182 ) ) ( ON ?auto_371180 ?auto_371181 ) ( ON ?auto_371179 ?auto_371180 ) ( ON ?auto_371178 ?auto_371179 ) ( CLEAR ?auto_371178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371178 )
      ( MAKE-4PILE ?auto_371178 ?auto_371179 ?auto_371180 ?auto_371181 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371197 - BLOCK
      ?auto_371198 - BLOCK
      ?auto_371199 - BLOCK
      ?auto_371200 - BLOCK
      ?auto_371201 - BLOCK
    )
    :vars
    (
      ?auto_371202 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371200 ) ( ON ?auto_371201 ?auto_371202 ) ( CLEAR ?auto_371201 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371197 ) ( ON ?auto_371198 ?auto_371197 ) ( ON ?auto_371199 ?auto_371198 ) ( ON ?auto_371200 ?auto_371199 ) ( not ( = ?auto_371197 ?auto_371198 ) ) ( not ( = ?auto_371197 ?auto_371199 ) ) ( not ( = ?auto_371197 ?auto_371200 ) ) ( not ( = ?auto_371197 ?auto_371201 ) ) ( not ( = ?auto_371197 ?auto_371202 ) ) ( not ( = ?auto_371198 ?auto_371199 ) ) ( not ( = ?auto_371198 ?auto_371200 ) ) ( not ( = ?auto_371198 ?auto_371201 ) ) ( not ( = ?auto_371198 ?auto_371202 ) ) ( not ( = ?auto_371199 ?auto_371200 ) ) ( not ( = ?auto_371199 ?auto_371201 ) ) ( not ( = ?auto_371199 ?auto_371202 ) ) ( not ( = ?auto_371200 ?auto_371201 ) ) ( not ( = ?auto_371200 ?auto_371202 ) ) ( not ( = ?auto_371201 ?auto_371202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371201 ?auto_371202 )
      ( !STACK ?auto_371201 ?auto_371200 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371219 - BLOCK
      ?auto_371220 - BLOCK
      ?auto_371221 - BLOCK
      ?auto_371222 - BLOCK
      ?auto_371223 - BLOCK
    )
    :vars
    (
      ?auto_371224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371223 ?auto_371224 ) ( ON-TABLE ?auto_371219 ) ( ON ?auto_371220 ?auto_371219 ) ( ON ?auto_371221 ?auto_371220 ) ( not ( = ?auto_371219 ?auto_371220 ) ) ( not ( = ?auto_371219 ?auto_371221 ) ) ( not ( = ?auto_371219 ?auto_371222 ) ) ( not ( = ?auto_371219 ?auto_371223 ) ) ( not ( = ?auto_371219 ?auto_371224 ) ) ( not ( = ?auto_371220 ?auto_371221 ) ) ( not ( = ?auto_371220 ?auto_371222 ) ) ( not ( = ?auto_371220 ?auto_371223 ) ) ( not ( = ?auto_371220 ?auto_371224 ) ) ( not ( = ?auto_371221 ?auto_371222 ) ) ( not ( = ?auto_371221 ?auto_371223 ) ) ( not ( = ?auto_371221 ?auto_371224 ) ) ( not ( = ?auto_371222 ?auto_371223 ) ) ( not ( = ?auto_371222 ?auto_371224 ) ) ( not ( = ?auto_371223 ?auto_371224 ) ) ( CLEAR ?auto_371221 ) ( ON ?auto_371222 ?auto_371223 ) ( CLEAR ?auto_371222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_371219 ?auto_371220 ?auto_371221 ?auto_371222 )
      ( MAKE-5PILE ?auto_371219 ?auto_371220 ?auto_371221 ?auto_371222 ?auto_371223 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371241 - BLOCK
      ?auto_371242 - BLOCK
      ?auto_371243 - BLOCK
      ?auto_371244 - BLOCK
      ?auto_371245 - BLOCK
    )
    :vars
    (
      ?auto_371246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371245 ?auto_371246 ) ( ON-TABLE ?auto_371241 ) ( ON ?auto_371242 ?auto_371241 ) ( not ( = ?auto_371241 ?auto_371242 ) ) ( not ( = ?auto_371241 ?auto_371243 ) ) ( not ( = ?auto_371241 ?auto_371244 ) ) ( not ( = ?auto_371241 ?auto_371245 ) ) ( not ( = ?auto_371241 ?auto_371246 ) ) ( not ( = ?auto_371242 ?auto_371243 ) ) ( not ( = ?auto_371242 ?auto_371244 ) ) ( not ( = ?auto_371242 ?auto_371245 ) ) ( not ( = ?auto_371242 ?auto_371246 ) ) ( not ( = ?auto_371243 ?auto_371244 ) ) ( not ( = ?auto_371243 ?auto_371245 ) ) ( not ( = ?auto_371243 ?auto_371246 ) ) ( not ( = ?auto_371244 ?auto_371245 ) ) ( not ( = ?auto_371244 ?auto_371246 ) ) ( not ( = ?auto_371245 ?auto_371246 ) ) ( ON ?auto_371244 ?auto_371245 ) ( CLEAR ?auto_371242 ) ( ON ?auto_371243 ?auto_371244 ) ( CLEAR ?auto_371243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371241 ?auto_371242 ?auto_371243 )
      ( MAKE-5PILE ?auto_371241 ?auto_371242 ?auto_371243 ?auto_371244 ?auto_371245 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371263 - BLOCK
      ?auto_371264 - BLOCK
      ?auto_371265 - BLOCK
      ?auto_371266 - BLOCK
      ?auto_371267 - BLOCK
    )
    :vars
    (
      ?auto_371268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371267 ?auto_371268 ) ( ON-TABLE ?auto_371263 ) ( not ( = ?auto_371263 ?auto_371264 ) ) ( not ( = ?auto_371263 ?auto_371265 ) ) ( not ( = ?auto_371263 ?auto_371266 ) ) ( not ( = ?auto_371263 ?auto_371267 ) ) ( not ( = ?auto_371263 ?auto_371268 ) ) ( not ( = ?auto_371264 ?auto_371265 ) ) ( not ( = ?auto_371264 ?auto_371266 ) ) ( not ( = ?auto_371264 ?auto_371267 ) ) ( not ( = ?auto_371264 ?auto_371268 ) ) ( not ( = ?auto_371265 ?auto_371266 ) ) ( not ( = ?auto_371265 ?auto_371267 ) ) ( not ( = ?auto_371265 ?auto_371268 ) ) ( not ( = ?auto_371266 ?auto_371267 ) ) ( not ( = ?auto_371266 ?auto_371268 ) ) ( not ( = ?auto_371267 ?auto_371268 ) ) ( ON ?auto_371266 ?auto_371267 ) ( ON ?auto_371265 ?auto_371266 ) ( CLEAR ?auto_371263 ) ( ON ?auto_371264 ?auto_371265 ) ( CLEAR ?auto_371264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371263 ?auto_371264 )
      ( MAKE-5PILE ?auto_371263 ?auto_371264 ?auto_371265 ?auto_371266 ?auto_371267 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371285 - BLOCK
      ?auto_371286 - BLOCK
      ?auto_371287 - BLOCK
      ?auto_371288 - BLOCK
      ?auto_371289 - BLOCK
    )
    :vars
    (
      ?auto_371290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371289 ?auto_371290 ) ( not ( = ?auto_371285 ?auto_371286 ) ) ( not ( = ?auto_371285 ?auto_371287 ) ) ( not ( = ?auto_371285 ?auto_371288 ) ) ( not ( = ?auto_371285 ?auto_371289 ) ) ( not ( = ?auto_371285 ?auto_371290 ) ) ( not ( = ?auto_371286 ?auto_371287 ) ) ( not ( = ?auto_371286 ?auto_371288 ) ) ( not ( = ?auto_371286 ?auto_371289 ) ) ( not ( = ?auto_371286 ?auto_371290 ) ) ( not ( = ?auto_371287 ?auto_371288 ) ) ( not ( = ?auto_371287 ?auto_371289 ) ) ( not ( = ?auto_371287 ?auto_371290 ) ) ( not ( = ?auto_371288 ?auto_371289 ) ) ( not ( = ?auto_371288 ?auto_371290 ) ) ( not ( = ?auto_371289 ?auto_371290 ) ) ( ON ?auto_371288 ?auto_371289 ) ( ON ?auto_371287 ?auto_371288 ) ( ON ?auto_371286 ?auto_371287 ) ( ON ?auto_371285 ?auto_371286 ) ( CLEAR ?auto_371285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371285 )
      ( MAKE-5PILE ?auto_371285 ?auto_371286 ?auto_371287 ?auto_371288 ?auto_371289 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371308 - BLOCK
      ?auto_371309 - BLOCK
      ?auto_371310 - BLOCK
      ?auto_371311 - BLOCK
      ?auto_371312 - BLOCK
      ?auto_371313 - BLOCK
    )
    :vars
    (
      ?auto_371314 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371312 ) ( ON ?auto_371313 ?auto_371314 ) ( CLEAR ?auto_371313 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371308 ) ( ON ?auto_371309 ?auto_371308 ) ( ON ?auto_371310 ?auto_371309 ) ( ON ?auto_371311 ?auto_371310 ) ( ON ?auto_371312 ?auto_371311 ) ( not ( = ?auto_371308 ?auto_371309 ) ) ( not ( = ?auto_371308 ?auto_371310 ) ) ( not ( = ?auto_371308 ?auto_371311 ) ) ( not ( = ?auto_371308 ?auto_371312 ) ) ( not ( = ?auto_371308 ?auto_371313 ) ) ( not ( = ?auto_371308 ?auto_371314 ) ) ( not ( = ?auto_371309 ?auto_371310 ) ) ( not ( = ?auto_371309 ?auto_371311 ) ) ( not ( = ?auto_371309 ?auto_371312 ) ) ( not ( = ?auto_371309 ?auto_371313 ) ) ( not ( = ?auto_371309 ?auto_371314 ) ) ( not ( = ?auto_371310 ?auto_371311 ) ) ( not ( = ?auto_371310 ?auto_371312 ) ) ( not ( = ?auto_371310 ?auto_371313 ) ) ( not ( = ?auto_371310 ?auto_371314 ) ) ( not ( = ?auto_371311 ?auto_371312 ) ) ( not ( = ?auto_371311 ?auto_371313 ) ) ( not ( = ?auto_371311 ?auto_371314 ) ) ( not ( = ?auto_371312 ?auto_371313 ) ) ( not ( = ?auto_371312 ?auto_371314 ) ) ( not ( = ?auto_371313 ?auto_371314 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371313 ?auto_371314 )
      ( !STACK ?auto_371313 ?auto_371312 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371334 - BLOCK
      ?auto_371335 - BLOCK
      ?auto_371336 - BLOCK
      ?auto_371337 - BLOCK
      ?auto_371338 - BLOCK
      ?auto_371339 - BLOCK
    )
    :vars
    (
      ?auto_371340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371339 ?auto_371340 ) ( ON-TABLE ?auto_371334 ) ( ON ?auto_371335 ?auto_371334 ) ( ON ?auto_371336 ?auto_371335 ) ( ON ?auto_371337 ?auto_371336 ) ( not ( = ?auto_371334 ?auto_371335 ) ) ( not ( = ?auto_371334 ?auto_371336 ) ) ( not ( = ?auto_371334 ?auto_371337 ) ) ( not ( = ?auto_371334 ?auto_371338 ) ) ( not ( = ?auto_371334 ?auto_371339 ) ) ( not ( = ?auto_371334 ?auto_371340 ) ) ( not ( = ?auto_371335 ?auto_371336 ) ) ( not ( = ?auto_371335 ?auto_371337 ) ) ( not ( = ?auto_371335 ?auto_371338 ) ) ( not ( = ?auto_371335 ?auto_371339 ) ) ( not ( = ?auto_371335 ?auto_371340 ) ) ( not ( = ?auto_371336 ?auto_371337 ) ) ( not ( = ?auto_371336 ?auto_371338 ) ) ( not ( = ?auto_371336 ?auto_371339 ) ) ( not ( = ?auto_371336 ?auto_371340 ) ) ( not ( = ?auto_371337 ?auto_371338 ) ) ( not ( = ?auto_371337 ?auto_371339 ) ) ( not ( = ?auto_371337 ?auto_371340 ) ) ( not ( = ?auto_371338 ?auto_371339 ) ) ( not ( = ?auto_371338 ?auto_371340 ) ) ( not ( = ?auto_371339 ?auto_371340 ) ) ( CLEAR ?auto_371337 ) ( ON ?auto_371338 ?auto_371339 ) ( CLEAR ?auto_371338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_371334 ?auto_371335 ?auto_371336 ?auto_371337 ?auto_371338 )
      ( MAKE-6PILE ?auto_371334 ?auto_371335 ?auto_371336 ?auto_371337 ?auto_371338 ?auto_371339 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371360 - BLOCK
      ?auto_371361 - BLOCK
      ?auto_371362 - BLOCK
      ?auto_371363 - BLOCK
      ?auto_371364 - BLOCK
      ?auto_371365 - BLOCK
    )
    :vars
    (
      ?auto_371366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371365 ?auto_371366 ) ( ON-TABLE ?auto_371360 ) ( ON ?auto_371361 ?auto_371360 ) ( ON ?auto_371362 ?auto_371361 ) ( not ( = ?auto_371360 ?auto_371361 ) ) ( not ( = ?auto_371360 ?auto_371362 ) ) ( not ( = ?auto_371360 ?auto_371363 ) ) ( not ( = ?auto_371360 ?auto_371364 ) ) ( not ( = ?auto_371360 ?auto_371365 ) ) ( not ( = ?auto_371360 ?auto_371366 ) ) ( not ( = ?auto_371361 ?auto_371362 ) ) ( not ( = ?auto_371361 ?auto_371363 ) ) ( not ( = ?auto_371361 ?auto_371364 ) ) ( not ( = ?auto_371361 ?auto_371365 ) ) ( not ( = ?auto_371361 ?auto_371366 ) ) ( not ( = ?auto_371362 ?auto_371363 ) ) ( not ( = ?auto_371362 ?auto_371364 ) ) ( not ( = ?auto_371362 ?auto_371365 ) ) ( not ( = ?auto_371362 ?auto_371366 ) ) ( not ( = ?auto_371363 ?auto_371364 ) ) ( not ( = ?auto_371363 ?auto_371365 ) ) ( not ( = ?auto_371363 ?auto_371366 ) ) ( not ( = ?auto_371364 ?auto_371365 ) ) ( not ( = ?auto_371364 ?auto_371366 ) ) ( not ( = ?auto_371365 ?auto_371366 ) ) ( ON ?auto_371364 ?auto_371365 ) ( CLEAR ?auto_371362 ) ( ON ?auto_371363 ?auto_371364 ) ( CLEAR ?auto_371363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_371360 ?auto_371361 ?auto_371362 ?auto_371363 )
      ( MAKE-6PILE ?auto_371360 ?auto_371361 ?auto_371362 ?auto_371363 ?auto_371364 ?auto_371365 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371386 - BLOCK
      ?auto_371387 - BLOCK
      ?auto_371388 - BLOCK
      ?auto_371389 - BLOCK
      ?auto_371390 - BLOCK
      ?auto_371391 - BLOCK
    )
    :vars
    (
      ?auto_371392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371391 ?auto_371392 ) ( ON-TABLE ?auto_371386 ) ( ON ?auto_371387 ?auto_371386 ) ( not ( = ?auto_371386 ?auto_371387 ) ) ( not ( = ?auto_371386 ?auto_371388 ) ) ( not ( = ?auto_371386 ?auto_371389 ) ) ( not ( = ?auto_371386 ?auto_371390 ) ) ( not ( = ?auto_371386 ?auto_371391 ) ) ( not ( = ?auto_371386 ?auto_371392 ) ) ( not ( = ?auto_371387 ?auto_371388 ) ) ( not ( = ?auto_371387 ?auto_371389 ) ) ( not ( = ?auto_371387 ?auto_371390 ) ) ( not ( = ?auto_371387 ?auto_371391 ) ) ( not ( = ?auto_371387 ?auto_371392 ) ) ( not ( = ?auto_371388 ?auto_371389 ) ) ( not ( = ?auto_371388 ?auto_371390 ) ) ( not ( = ?auto_371388 ?auto_371391 ) ) ( not ( = ?auto_371388 ?auto_371392 ) ) ( not ( = ?auto_371389 ?auto_371390 ) ) ( not ( = ?auto_371389 ?auto_371391 ) ) ( not ( = ?auto_371389 ?auto_371392 ) ) ( not ( = ?auto_371390 ?auto_371391 ) ) ( not ( = ?auto_371390 ?auto_371392 ) ) ( not ( = ?auto_371391 ?auto_371392 ) ) ( ON ?auto_371390 ?auto_371391 ) ( ON ?auto_371389 ?auto_371390 ) ( CLEAR ?auto_371387 ) ( ON ?auto_371388 ?auto_371389 ) ( CLEAR ?auto_371388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371386 ?auto_371387 ?auto_371388 )
      ( MAKE-6PILE ?auto_371386 ?auto_371387 ?auto_371388 ?auto_371389 ?auto_371390 ?auto_371391 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371412 - BLOCK
      ?auto_371413 - BLOCK
      ?auto_371414 - BLOCK
      ?auto_371415 - BLOCK
      ?auto_371416 - BLOCK
      ?auto_371417 - BLOCK
    )
    :vars
    (
      ?auto_371418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371417 ?auto_371418 ) ( ON-TABLE ?auto_371412 ) ( not ( = ?auto_371412 ?auto_371413 ) ) ( not ( = ?auto_371412 ?auto_371414 ) ) ( not ( = ?auto_371412 ?auto_371415 ) ) ( not ( = ?auto_371412 ?auto_371416 ) ) ( not ( = ?auto_371412 ?auto_371417 ) ) ( not ( = ?auto_371412 ?auto_371418 ) ) ( not ( = ?auto_371413 ?auto_371414 ) ) ( not ( = ?auto_371413 ?auto_371415 ) ) ( not ( = ?auto_371413 ?auto_371416 ) ) ( not ( = ?auto_371413 ?auto_371417 ) ) ( not ( = ?auto_371413 ?auto_371418 ) ) ( not ( = ?auto_371414 ?auto_371415 ) ) ( not ( = ?auto_371414 ?auto_371416 ) ) ( not ( = ?auto_371414 ?auto_371417 ) ) ( not ( = ?auto_371414 ?auto_371418 ) ) ( not ( = ?auto_371415 ?auto_371416 ) ) ( not ( = ?auto_371415 ?auto_371417 ) ) ( not ( = ?auto_371415 ?auto_371418 ) ) ( not ( = ?auto_371416 ?auto_371417 ) ) ( not ( = ?auto_371416 ?auto_371418 ) ) ( not ( = ?auto_371417 ?auto_371418 ) ) ( ON ?auto_371416 ?auto_371417 ) ( ON ?auto_371415 ?auto_371416 ) ( ON ?auto_371414 ?auto_371415 ) ( CLEAR ?auto_371412 ) ( ON ?auto_371413 ?auto_371414 ) ( CLEAR ?auto_371413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371412 ?auto_371413 )
      ( MAKE-6PILE ?auto_371412 ?auto_371413 ?auto_371414 ?auto_371415 ?auto_371416 ?auto_371417 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371438 - BLOCK
      ?auto_371439 - BLOCK
      ?auto_371440 - BLOCK
      ?auto_371441 - BLOCK
      ?auto_371442 - BLOCK
      ?auto_371443 - BLOCK
    )
    :vars
    (
      ?auto_371444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371443 ?auto_371444 ) ( not ( = ?auto_371438 ?auto_371439 ) ) ( not ( = ?auto_371438 ?auto_371440 ) ) ( not ( = ?auto_371438 ?auto_371441 ) ) ( not ( = ?auto_371438 ?auto_371442 ) ) ( not ( = ?auto_371438 ?auto_371443 ) ) ( not ( = ?auto_371438 ?auto_371444 ) ) ( not ( = ?auto_371439 ?auto_371440 ) ) ( not ( = ?auto_371439 ?auto_371441 ) ) ( not ( = ?auto_371439 ?auto_371442 ) ) ( not ( = ?auto_371439 ?auto_371443 ) ) ( not ( = ?auto_371439 ?auto_371444 ) ) ( not ( = ?auto_371440 ?auto_371441 ) ) ( not ( = ?auto_371440 ?auto_371442 ) ) ( not ( = ?auto_371440 ?auto_371443 ) ) ( not ( = ?auto_371440 ?auto_371444 ) ) ( not ( = ?auto_371441 ?auto_371442 ) ) ( not ( = ?auto_371441 ?auto_371443 ) ) ( not ( = ?auto_371441 ?auto_371444 ) ) ( not ( = ?auto_371442 ?auto_371443 ) ) ( not ( = ?auto_371442 ?auto_371444 ) ) ( not ( = ?auto_371443 ?auto_371444 ) ) ( ON ?auto_371442 ?auto_371443 ) ( ON ?auto_371441 ?auto_371442 ) ( ON ?auto_371440 ?auto_371441 ) ( ON ?auto_371439 ?auto_371440 ) ( ON ?auto_371438 ?auto_371439 ) ( CLEAR ?auto_371438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371438 )
      ( MAKE-6PILE ?auto_371438 ?auto_371439 ?auto_371440 ?auto_371441 ?auto_371442 ?auto_371443 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371465 - BLOCK
      ?auto_371466 - BLOCK
      ?auto_371467 - BLOCK
      ?auto_371468 - BLOCK
      ?auto_371469 - BLOCK
      ?auto_371470 - BLOCK
      ?auto_371471 - BLOCK
    )
    :vars
    (
      ?auto_371472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371470 ) ( ON ?auto_371471 ?auto_371472 ) ( CLEAR ?auto_371471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371465 ) ( ON ?auto_371466 ?auto_371465 ) ( ON ?auto_371467 ?auto_371466 ) ( ON ?auto_371468 ?auto_371467 ) ( ON ?auto_371469 ?auto_371468 ) ( ON ?auto_371470 ?auto_371469 ) ( not ( = ?auto_371465 ?auto_371466 ) ) ( not ( = ?auto_371465 ?auto_371467 ) ) ( not ( = ?auto_371465 ?auto_371468 ) ) ( not ( = ?auto_371465 ?auto_371469 ) ) ( not ( = ?auto_371465 ?auto_371470 ) ) ( not ( = ?auto_371465 ?auto_371471 ) ) ( not ( = ?auto_371465 ?auto_371472 ) ) ( not ( = ?auto_371466 ?auto_371467 ) ) ( not ( = ?auto_371466 ?auto_371468 ) ) ( not ( = ?auto_371466 ?auto_371469 ) ) ( not ( = ?auto_371466 ?auto_371470 ) ) ( not ( = ?auto_371466 ?auto_371471 ) ) ( not ( = ?auto_371466 ?auto_371472 ) ) ( not ( = ?auto_371467 ?auto_371468 ) ) ( not ( = ?auto_371467 ?auto_371469 ) ) ( not ( = ?auto_371467 ?auto_371470 ) ) ( not ( = ?auto_371467 ?auto_371471 ) ) ( not ( = ?auto_371467 ?auto_371472 ) ) ( not ( = ?auto_371468 ?auto_371469 ) ) ( not ( = ?auto_371468 ?auto_371470 ) ) ( not ( = ?auto_371468 ?auto_371471 ) ) ( not ( = ?auto_371468 ?auto_371472 ) ) ( not ( = ?auto_371469 ?auto_371470 ) ) ( not ( = ?auto_371469 ?auto_371471 ) ) ( not ( = ?auto_371469 ?auto_371472 ) ) ( not ( = ?auto_371470 ?auto_371471 ) ) ( not ( = ?auto_371470 ?auto_371472 ) ) ( not ( = ?auto_371471 ?auto_371472 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371471 ?auto_371472 )
      ( !STACK ?auto_371471 ?auto_371470 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371495 - BLOCK
      ?auto_371496 - BLOCK
      ?auto_371497 - BLOCK
      ?auto_371498 - BLOCK
      ?auto_371499 - BLOCK
      ?auto_371500 - BLOCK
      ?auto_371501 - BLOCK
    )
    :vars
    (
      ?auto_371502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371501 ?auto_371502 ) ( ON-TABLE ?auto_371495 ) ( ON ?auto_371496 ?auto_371495 ) ( ON ?auto_371497 ?auto_371496 ) ( ON ?auto_371498 ?auto_371497 ) ( ON ?auto_371499 ?auto_371498 ) ( not ( = ?auto_371495 ?auto_371496 ) ) ( not ( = ?auto_371495 ?auto_371497 ) ) ( not ( = ?auto_371495 ?auto_371498 ) ) ( not ( = ?auto_371495 ?auto_371499 ) ) ( not ( = ?auto_371495 ?auto_371500 ) ) ( not ( = ?auto_371495 ?auto_371501 ) ) ( not ( = ?auto_371495 ?auto_371502 ) ) ( not ( = ?auto_371496 ?auto_371497 ) ) ( not ( = ?auto_371496 ?auto_371498 ) ) ( not ( = ?auto_371496 ?auto_371499 ) ) ( not ( = ?auto_371496 ?auto_371500 ) ) ( not ( = ?auto_371496 ?auto_371501 ) ) ( not ( = ?auto_371496 ?auto_371502 ) ) ( not ( = ?auto_371497 ?auto_371498 ) ) ( not ( = ?auto_371497 ?auto_371499 ) ) ( not ( = ?auto_371497 ?auto_371500 ) ) ( not ( = ?auto_371497 ?auto_371501 ) ) ( not ( = ?auto_371497 ?auto_371502 ) ) ( not ( = ?auto_371498 ?auto_371499 ) ) ( not ( = ?auto_371498 ?auto_371500 ) ) ( not ( = ?auto_371498 ?auto_371501 ) ) ( not ( = ?auto_371498 ?auto_371502 ) ) ( not ( = ?auto_371499 ?auto_371500 ) ) ( not ( = ?auto_371499 ?auto_371501 ) ) ( not ( = ?auto_371499 ?auto_371502 ) ) ( not ( = ?auto_371500 ?auto_371501 ) ) ( not ( = ?auto_371500 ?auto_371502 ) ) ( not ( = ?auto_371501 ?auto_371502 ) ) ( CLEAR ?auto_371499 ) ( ON ?auto_371500 ?auto_371501 ) ( CLEAR ?auto_371500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_371495 ?auto_371496 ?auto_371497 ?auto_371498 ?auto_371499 ?auto_371500 )
      ( MAKE-7PILE ?auto_371495 ?auto_371496 ?auto_371497 ?auto_371498 ?auto_371499 ?auto_371500 ?auto_371501 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371525 - BLOCK
      ?auto_371526 - BLOCK
      ?auto_371527 - BLOCK
      ?auto_371528 - BLOCK
      ?auto_371529 - BLOCK
      ?auto_371530 - BLOCK
      ?auto_371531 - BLOCK
    )
    :vars
    (
      ?auto_371532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371531 ?auto_371532 ) ( ON-TABLE ?auto_371525 ) ( ON ?auto_371526 ?auto_371525 ) ( ON ?auto_371527 ?auto_371526 ) ( ON ?auto_371528 ?auto_371527 ) ( not ( = ?auto_371525 ?auto_371526 ) ) ( not ( = ?auto_371525 ?auto_371527 ) ) ( not ( = ?auto_371525 ?auto_371528 ) ) ( not ( = ?auto_371525 ?auto_371529 ) ) ( not ( = ?auto_371525 ?auto_371530 ) ) ( not ( = ?auto_371525 ?auto_371531 ) ) ( not ( = ?auto_371525 ?auto_371532 ) ) ( not ( = ?auto_371526 ?auto_371527 ) ) ( not ( = ?auto_371526 ?auto_371528 ) ) ( not ( = ?auto_371526 ?auto_371529 ) ) ( not ( = ?auto_371526 ?auto_371530 ) ) ( not ( = ?auto_371526 ?auto_371531 ) ) ( not ( = ?auto_371526 ?auto_371532 ) ) ( not ( = ?auto_371527 ?auto_371528 ) ) ( not ( = ?auto_371527 ?auto_371529 ) ) ( not ( = ?auto_371527 ?auto_371530 ) ) ( not ( = ?auto_371527 ?auto_371531 ) ) ( not ( = ?auto_371527 ?auto_371532 ) ) ( not ( = ?auto_371528 ?auto_371529 ) ) ( not ( = ?auto_371528 ?auto_371530 ) ) ( not ( = ?auto_371528 ?auto_371531 ) ) ( not ( = ?auto_371528 ?auto_371532 ) ) ( not ( = ?auto_371529 ?auto_371530 ) ) ( not ( = ?auto_371529 ?auto_371531 ) ) ( not ( = ?auto_371529 ?auto_371532 ) ) ( not ( = ?auto_371530 ?auto_371531 ) ) ( not ( = ?auto_371530 ?auto_371532 ) ) ( not ( = ?auto_371531 ?auto_371532 ) ) ( ON ?auto_371530 ?auto_371531 ) ( CLEAR ?auto_371528 ) ( ON ?auto_371529 ?auto_371530 ) ( CLEAR ?auto_371529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_371525 ?auto_371526 ?auto_371527 ?auto_371528 ?auto_371529 )
      ( MAKE-7PILE ?auto_371525 ?auto_371526 ?auto_371527 ?auto_371528 ?auto_371529 ?auto_371530 ?auto_371531 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371555 - BLOCK
      ?auto_371556 - BLOCK
      ?auto_371557 - BLOCK
      ?auto_371558 - BLOCK
      ?auto_371559 - BLOCK
      ?auto_371560 - BLOCK
      ?auto_371561 - BLOCK
    )
    :vars
    (
      ?auto_371562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371561 ?auto_371562 ) ( ON-TABLE ?auto_371555 ) ( ON ?auto_371556 ?auto_371555 ) ( ON ?auto_371557 ?auto_371556 ) ( not ( = ?auto_371555 ?auto_371556 ) ) ( not ( = ?auto_371555 ?auto_371557 ) ) ( not ( = ?auto_371555 ?auto_371558 ) ) ( not ( = ?auto_371555 ?auto_371559 ) ) ( not ( = ?auto_371555 ?auto_371560 ) ) ( not ( = ?auto_371555 ?auto_371561 ) ) ( not ( = ?auto_371555 ?auto_371562 ) ) ( not ( = ?auto_371556 ?auto_371557 ) ) ( not ( = ?auto_371556 ?auto_371558 ) ) ( not ( = ?auto_371556 ?auto_371559 ) ) ( not ( = ?auto_371556 ?auto_371560 ) ) ( not ( = ?auto_371556 ?auto_371561 ) ) ( not ( = ?auto_371556 ?auto_371562 ) ) ( not ( = ?auto_371557 ?auto_371558 ) ) ( not ( = ?auto_371557 ?auto_371559 ) ) ( not ( = ?auto_371557 ?auto_371560 ) ) ( not ( = ?auto_371557 ?auto_371561 ) ) ( not ( = ?auto_371557 ?auto_371562 ) ) ( not ( = ?auto_371558 ?auto_371559 ) ) ( not ( = ?auto_371558 ?auto_371560 ) ) ( not ( = ?auto_371558 ?auto_371561 ) ) ( not ( = ?auto_371558 ?auto_371562 ) ) ( not ( = ?auto_371559 ?auto_371560 ) ) ( not ( = ?auto_371559 ?auto_371561 ) ) ( not ( = ?auto_371559 ?auto_371562 ) ) ( not ( = ?auto_371560 ?auto_371561 ) ) ( not ( = ?auto_371560 ?auto_371562 ) ) ( not ( = ?auto_371561 ?auto_371562 ) ) ( ON ?auto_371560 ?auto_371561 ) ( ON ?auto_371559 ?auto_371560 ) ( CLEAR ?auto_371557 ) ( ON ?auto_371558 ?auto_371559 ) ( CLEAR ?auto_371558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_371555 ?auto_371556 ?auto_371557 ?auto_371558 )
      ( MAKE-7PILE ?auto_371555 ?auto_371556 ?auto_371557 ?auto_371558 ?auto_371559 ?auto_371560 ?auto_371561 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371585 - BLOCK
      ?auto_371586 - BLOCK
      ?auto_371587 - BLOCK
      ?auto_371588 - BLOCK
      ?auto_371589 - BLOCK
      ?auto_371590 - BLOCK
      ?auto_371591 - BLOCK
    )
    :vars
    (
      ?auto_371592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371591 ?auto_371592 ) ( ON-TABLE ?auto_371585 ) ( ON ?auto_371586 ?auto_371585 ) ( not ( = ?auto_371585 ?auto_371586 ) ) ( not ( = ?auto_371585 ?auto_371587 ) ) ( not ( = ?auto_371585 ?auto_371588 ) ) ( not ( = ?auto_371585 ?auto_371589 ) ) ( not ( = ?auto_371585 ?auto_371590 ) ) ( not ( = ?auto_371585 ?auto_371591 ) ) ( not ( = ?auto_371585 ?auto_371592 ) ) ( not ( = ?auto_371586 ?auto_371587 ) ) ( not ( = ?auto_371586 ?auto_371588 ) ) ( not ( = ?auto_371586 ?auto_371589 ) ) ( not ( = ?auto_371586 ?auto_371590 ) ) ( not ( = ?auto_371586 ?auto_371591 ) ) ( not ( = ?auto_371586 ?auto_371592 ) ) ( not ( = ?auto_371587 ?auto_371588 ) ) ( not ( = ?auto_371587 ?auto_371589 ) ) ( not ( = ?auto_371587 ?auto_371590 ) ) ( not ( = ?auto_371587 ?auto_371591 ) ) ( not ( = ?auto_371587 ?auto_371592 ) ) ( not ( = ?auto_371588 ?auto_371589 ) ) ( not ( = ?auto_371588 ?auto_371590 ) ) ( not ( = ?auto_371588 ?auto_371591 ) ) ( not ( = ?auto_371588 ?auto_371592 ) ) ( not ( = ?auto_371589 ?auto_371590 ) ) ( not ( = ?auto_371589 ?auto_371591 ) ) ( not ( = ?auto_371589 ?auto_371592 ) ) ( not ( = ?auto_371590 ?auto_371591 ) ) ( not ( = ?auto_371590 ?auto_371592 ) ) ( not ( = ?auto_371591 ?auto_371592 ) ) ( ON ?auto_371590 ?auto_371591 ) ( ON ?auto_371589 ?auto_371590 ) ( ON ?auto_371588 ?auto_371589 ) ( CLEAR ?auto_371586 ) ( ON ?auto_371587 ?auto_371588 ) ( CLEAR ?auto_371587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371585 ?auto_371586 ?auto_371587 )
      ( MAKE-7PILE ?auto_371585 ?auto_371586 ?auto_371587 ?auto_371588 ?auto_371589 ?auto_371590 ?auto_371591 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371615 - BLOCK
      ?auto_371616 - BLOCK
      ?auto_371617 - BLOCK
      ?auto_371618 - BLOCK
      ?auto_371619 - BLOCK
      ?auto_371620 - BLOCK
      ?auto_371621 - BLOCK
    )
    :vars
    (
      ?auto_371622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371621 ?auto_371622 ) ( ON-TABLE ?auto_371615 ) ( not ( = ?auto_371615 ?auto_371616 ) ) ( not ( = ?auto_371615 ?auto_371617 ) ) ( not ( = ?auto_371615 ?auto_371618 ) ) ( not ( = ?auto_371615 ?auto_371619 ) ) ( not ( = ?auto_371615 ?auto_371620 ) ) ( not ( = ?auto_371615 ?auto_371621 ) ) ( not ( = ?auto_371615 ?auto_371622 ) ) ( not ( = ?auto_371616 ?auto_371617 ) ) ( not ( = ?auto_371616 ?auto_371618 ) ) ( not ( = ?auto_371616 ?auto_371619 ) ) ( not ( = ?auto_371616 ?auto_371620 ) ) ( not ( = ?auto_371616 ?auto_371621 ) ) ( not ( = ?auto_371616 ?auto_371622 ) ) ( not ( = ?auto_371617 ?auto_371618 ) ) ( not ( = ?auto_371617 ?auto_371619 ) ) ( not ( = ?auto_371617 ?auto_371620 ) ) ( not ( = ?auto_371617 ?auto_371621 ) ) ( not ( = ?auto_371617 ?auto_371622 ) ) ( not ( = ?auto_371618 ?auto_371619 ) ) ( not ( = ?auto_371618 ?auto_371620 ) ) ( not ( = ?auto_371618 ?auto_371621 ) ) ( not ( = ?auto_371618 ?auto_371622 ) ) ( not ( = ?auto_371619 ?auto_371620 ) ) ( not ( = ?auto_371619 ?auto_371621 ) ) ( not ( = ?auto_371619 ?auto_371622 ) ) ( not ( = ?auto_371620 ?auto_371621 ) ) ( not ( = ?auto_371620 ?auto_371622 ) ) ( not ( = ?auto_371621 ?auto_371622 ) ) ( ON ?auto_371620 ?auto_371621 ) ( ON ?auto_371619 ?auto_371620 ) ( ON ?auto_371618 ?auto_371619 ) ( ON ?auto_371617 ?auto_371618 ) ( CLEAR ?auto_371615 ) ( ON ?auto_371616 ?auto_371617 ) ( CLEAR ?auto_371616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371615 ?auto_371616 )
      ( MAKE-7PILE ?auto_371615 ?auto_371616 ?auto_371617 ?auto_371618 ?auto_371619 ?auto_371620 ?auto_371621 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371645 - BLOCK
      ?auto_371646 - BLOCK
      ?auto_371647 - BLOCK
      ?auto_371648 - BLOCK
      ?auto_371649 - BLOCK
      ?auto_371650 - BLOCK
      ?auto_371651 - BLOCK
    )
    :vars
    (
      ?auto_371652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371651 ?auto_371652 ) ( not ( = ?auto_371645 ?auto_371646 ) ) ( not ( = ?auto_371645 ?auto_371647 ) ) ( not ( = ?auto_371645 ?auto_371648 ) ) ( not ( = ?auto_371645 ?auto_371649 ) ) ( not ( = ?auto_371645 ?auto_371650 ) ) ( not ( = ?auto_371645 ?auto_371651 ) ) ( not ( = ?auto_371645 ?auto_371652 ) ) ( not ( = ?auto_371646 ?auto_371647 ) ) ( not ( = ?auto_371646 ?auto_371648 ) ) ( not ( = ?auto_371646 ?auto_371649 ) ) ( not ( = ?auto_371646 ?auto_371650 ) ) ( not ( = ?auto_371646 ?auto_371651 ) ) ( not ( = ?auto_371646 ?auto_371652 ) ) ( not ( = ?auto_371647 ?auto_371648 ) ) ( not ( = ?auto_371647 ?auto_371649 ) ) ( not ( = ?auto_371647 ?auto_371650 ) ) ( not ( = ?auto_371647 ?auto_371651 ) ) ( not ( = ?auto_371647 ?auto_371652 ) ) ( not ( = ?auto_371648 ?auto_371649 ) ) ( not ( = ?auto_371648 ?auto_371650 ) ) ( not ( = ?auto_371648 ?auto_371651 ) ) ( not ( = ?auto_371648 ?auto_371652 ) ) ( not ( = ?auto_371649 ?auto_371650 ) ) ( not ( = ?auto_371649 ?auto_371651 ) ) ( not ( = ?auto_371649 ?auto_371652 ) ) ( not ( = ?auto_371650 ?auto_371651 ) ) ( not ( = ?auto_371650 ?auto_371652 ) ) ( not ( = ?auto_371651 ?auto_371652 ) ) ( ON ?auto_371650 ?auto_371651 ) ( ON ?auto_371649 ?auto_371650 ) ( ON ?auto_371648 ?auto_371649 ) ( ON ?auto_371647 ?auto_371648 ) ( ON ?auto_371646 ?auto_371647 ) ( ON ?auto_371645 ?auto_371646 ) ( CLEAR ?auto_371645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371645 )
      ( MAKE-7PILE ?auto_371645 ?auto_371646 ?auto_371647 ?auto_371648 ?auto_371649 ?auto_371650 ?auto_371651 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371676 - BLOCK
      ?auto_371677 - BLOCK
      ?auto_371678 - BLOCK
      ?auto_371679 - BLOCK
      ?auto_371680 - BLOCK
      ?auto_371681 - BLOCK
      ?auto_371682 - BLOCK
      ?auto_371683 - BLOCK
    )
    :vars
    (
      ?auto_371684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371682 ) ( ON ?auto_371683 ?auto_371684 ) ( CLEAR ?auto_371683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371676 ) ( ON ?auto_371677 ?auto_371676 ) ( ON ?auto_371678 ?auto_371677 ) ( ON ?auto_371679 ?auto_371678 ) ( ON ?auto_371680 ?auto_371679 ) ( ON ?auto_371681 ?auto_371680 ) ( ON ?auto_371682 ?auto_371681 ) ( not ( = ?auto_371676 ?auto_371677 ) ) ( not ( = ?auto_371676 ?auto_371678 ) ) ( not ( = ?auto_371676 ?auto_371679 ) ) ( not ( = ?auto_371676 ?auto_371680 ) ) ( not ( = ?auto_371676 ?auto_371681 ) ) ( not ( = ?auto_371676 ?auto_371682 ) ) ( not ( = ?auto_371676 ?auto_371683 ) ) ( not ( = ?auto_371676 ?auto_371684 ) ) ( not ( = ?auto_371677 ?auto_371678 ) ) ( not ( = ?auto_371677 ?auto_371679 ) ) ( not ( = ?auto_371677 ?auto_371680 ) ) ( not ( = ?auto_371677 ?auto_371681 ) ) ( not ( = ?auto_371677 ?auto_371682 ) ) ( not ( = ?auto_371677 ?auto_371683 ) ) ( not ( = ?auto_371677 ?auto_371684 ) ) ( not ( = ?auto_371678 ?auto_371679 ) ) ( not ( = ?auto_371678 ?auto_371680 ) ) ( not ( = ?auto_371678 ?auto_371681 ) ) ( not ( = ?auto_371678 ?auto_371682 ) ) ( not ( = ?auto_371678 ?auto_371683 ) ) ( not ( = ?auto_371678 ?auto_371684 ) ) ( not ( = ?auto_371679 ?auto_371680 ) ) ( not ( = ?auto_371679 ?auto_371681 ) ) ( not ( = ?auto_371679 ?auto_371682 ) ) ( not ( = ?auto_371679 ?auto_371683 ) ) ( not ( = ?auto_371679 ?auto_371684 ) ) ( not ( = ?auto_371680 ?auto_371681 ) ) ( not ( = ?auto_371680 ?auto_371682 ) ) ( not ( = ?auto_371680 ?auto_371683 ) ) ( not ( = ?auto_371680 ?auto_371684 ) ) ( not ( = ?auto_371681 ?auto_371682 ) ) ( not ( = ?auto_371681 ?auto_371683 ) ) ( not ( = ?auto_371681 ?auto_371684 ) ) ( not ( = ?auto_371682 ?auto_371683 ) ) ( not ( = ?auto_371682 ?auto_371684 ) ) ( not ( = ?auto_371683 ?auto_371684 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371683 ?auto_371684 )
      ( !STACK ?auto_371683 ?auto_371682 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371710 - BLOCK
      ?auto_371711 - BLOCK
      ?auto_371712 - BLOCK
      ?auto_371713 - BLOCK
      ?auto_371714 - BLOCK
      ?auto_371715 - BLOCK
      ?auto_371716 - BLOCK
      ?auto_371717 - BLOCK
    )
    :vars
    (
      ?auto_371718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371717 ?auto_371718 ) ( ON-TABLE ?auto_371710 ) ( ON ?auto_371711 ?auto_371710 ) ( ON ?auto_371712 ?auto_371711 ) ( ON ?auto_371713 ?auto_371712 ) ( ON ?auto_371714 ?auto_371713 ) ( ON ?auto_371715 ?auto_371714 ) ( not ( = ?auto_371710 ?auto_371711 ) ) ( not ( = ?auto_371710 ?auto_371712 ) ) ( not ( = ?auto_371710 ?auto_371713 ) ) ( not ( = ?auto_371710 ?auto_371714 ) ) ( not ( = ?auto_371710 ?auto_371715 ) ) ( not ( = ?auto_371710 ?auto_371716 ) ) ( not ( = ?auto_371710 ?auto_371717 ) ) ( not ( = ?auto_371710 ?auto_371718 ) ) ( not ( = ?auto_371711 ?auto_371712 ) ) ( not ( = ?auto_371711 ?auto_371713 ) ) ( not ( = ?auto_371711 ?auto_371714 ) ) ( not ( = ?auto_371711 ?auto_371715 ) ) ( not ( = ?auto_371711 ?auto_371716 ) ) ( not ( = ?auto_371711 ?auto_371717 ) ) ( not ( = ?auto_371711 ?auto_371718 ) ) ( not ( = ?auto_371712 ?auto_371713 ) ) ( not ( = ?auto_371712 ?auto_371714 ) ) ( not ( = ?auto_371712 ?auto_371715 ) ) ( not ( = ?auto_371712 ?auto_371716 ) ) ( not ( = ?auto_371712 ?auto_371717 ) ) ( not ( = ?auto_371712 ?auto_371718 ) ) ( not ( = ?auto_371713 ?auto_371714 ) ) ( not ( = ?auto_371713 ?auto_371715 ) ) ( not ( = ?auto_371713 ?auto_371716 ) ) ( not ( = ?auto_371713 ?auto_371717 ) ) ( not ( = ?auto_371713 ?auto_371718 ) ) ( not ( = ?auto_371714 ?auto_371715 ) ) ( not ( = ?auto_371714 ?auto_371716 ) ) ( not ( = ?auto_371714 ?auto_371717 ) ) ( not ( = ?auto_371714 ?auto_371718 ) ) ( not ( = ?auto_371715 ?auto_371716 ) ) ( not ( = ?auto_371715 ?auto_371717 ) ) ( not ( = ?auto_371715 ?auto_371718 ) ) ( not ( = ?auto_371716 ?auto_371717 ) ) ( not ( = ?auto_371716 ?auto_371718 ) ) ( not ( = ?auto_371717 ?auto_371718 ) ) ( CLEAR ?auto_371715 ) ( ON ?auto_371716 ?auto_371717 ) ( CLEAR ?auto_371716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_371710 ?auto_371711 ?auto_371712 ?auto_371713 ?auto_371714 ?auto_371715 ?auto_371716 )
      ( MAKE-8PILE ?auto_371710 ?auto_371711 ?auto_371712 ?auto_371713 ?auto_371714 ?auto_371715 ?auto_371716 ?auto_371717 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371744 - BLOCK
      ?auto_371745 - BLOCK
      ?auto_371746 - BLOCK
      ?auto_371747 - BLOCK
      ?auto_371748 - BLOCK
      ?auto_371749 - BLOCK
      ?auto_371750 - BLOCK
      ?auto_371751 - BLOCK
    )
    :vars
    (
      ?auto_371752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371751 ?auto_371752 ) ( ON-TABLE ?auto_371744 ) ( ON ?auto_371745 ?auto_371744 ) ( ON ?auto_371746 ?auto_371745 ) ( ON ?auto_371747 ?auto_371746 ) ( ON ?auto_371748 ?auto_371747 ) ( not ( = ?auto_371744 ?auto_371745 ) ) ( not ( = ?auto_371744 ?auto_371746 ) ) ( not ( = ?auto_371744 ?auto_371747 ) ) ( not ( = ?auto_371744 ?auto_371748 ) ) ( not ( = ?auto_371744 ?auto_371749 ) ) ( not ( = ?auto_371744 ?auto_371750 ) ) ( not ( = ?auto_371744 ?auto_371751 ) ) ( not ( = ?auto_371744 ?auto_371752 ) ) ( not ( = ?auto_371745 ?auto_371746 ) ) ( not ( = ?auto_371745 ?auto_371747 ) ) ( not ( = ?auto_371745 ?auto_371748 ) ) ( not ( = ?auto_371745 ?auto_371749 ) ) ( not ( = ?auto_371745 ?auto_371750 ) ) ( not ( = ?auto_371745 ?auto_371751 ) ) ( not ( = ?auto_371745 ?auto_371752 ) ) ( not ( = ?auto_371746 ?auto_371747 ) ) ( not ( = ?auto_371746 ?auto_371748 ) ) ( not ( = ?auto_371746 ?auto_371749 ) ) ( not ( = ?auto_371746 ?auto_371750 ) ) ( not ( = ?auto_371746 ?auto_371751 ) ) ( not ( = ?auto_371746 ?auto_371752 ) ) ( not ( = ?auto_371747 ?auto_371748 ) ) ( not ( = ?auto_371747 ?auto_371749 ) ) ( not ( = ?auto_371747 ?auto_371750 ) ) ( not ( = ?auto_371747 ?auto_371751 ) ) ( not ( = ?auto_371747 ?auto_371752 ) ) ( not ( = ?auto_371748 ?auto_371749 ) ) ( not ( = ?auto_371748 ?auto_371750 ) ) ( not ( = ?auto_371748 ?auto_371751 ) ) ( not ( = ?auto_371748 ?auto_371752 ) ) ( not ( = ?auto_371749 ?auto_371750 ) ) ( not ( = ?auto_371749 ?auto_371751 ) ) ( not ( = ?auto_371749 ?auto_371752 ) ) ( not ( = ?auto_371750 ?auto_371751 ) ) ( not ( = ?auto_371750 ?auto_371752 ) ) ( not ( = ?auto_371751 ?auto_371752 ) ) ( ON ?auto_371750 ?auto_371751 ) ( CLEAR ?auto_371748 ) ( ON ?auto_371749 ?auto_371750 ) ( CLEAR ?auto_371749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_371744 ?auto_371745 ?auto_371746 ?auto_371747 ?auto_371748 ?auto_371749 )
      ( MAKE-8PILE ?auto_371744 ?auto_371745 ?auto_371746 ?auto_371747 ?auto_371748 ?auto_371749 ?auto_371750 ?auto_371751 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371778 - BLOCK
      ?auto_371779 - BLOCK
      ?auto_371780 - BLOCK
      ?auto_371781 - BLOCK
      ?auto_371782 - BLOCK
      ?auto_371783 - BLOCK
      ?auto_371784 - BLOCK
      ?auto_371785 - BLOCK
    )
    :vars
    (
      ?auto_371786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371785 ?auto_371786 ) ( ON-TABLE ?auto_371778 ) ( ON ?auto_371779 ?auto_371778 ) ( ON ?auto_371780 ?auto_371779 ) ( ON ?auto_371781 ?auto_371780 ) ( not ( = ?auto_371778 ?auto_371779 ) ) ( not ( = ?auto_371778 ?auto_371780 ) ) ( not ( = ?auto_371778 ?auto_371781 ) ) ( not ( = ?auto_371778 ?auto_371782 ) ) ( not ( = ?auto_371778 ?auto_371783 ) ) ( not ( = ?auto_371778 ?auto_371784 ) ) ( not ( = ?auto_371778 ?auto_371785 ) ) ( not ( = ?auto_371778 ?auto_371786 ) ) ( not ( = ?auto_371779 ?auto_371780 ) ) ( not ( = ?auto_371779 ?auto_371781 ) ) ( not ( = ?auto_371779 ?auto_371782 ) ) ( not ( = ?auto_371779 ?auto_371783 ) ) ( not ( = ?auto_371779 ?auto_371784 ) ) ( not ( = ?auto_371779 ?auto_371785 ) ) ( not ( = ?auto_371779 ?auto_371786 ) ) ( not ( = ?auto_371780 ?auto_371781 ) ) ( not ( = ?auto_371780 ?auto_371782 ) ) ( not ( = ?auto_371780 ?auto_371783 ) ) ( not ( = ?auto_371780 ?auto_371784 ) ) ( not ( = ?auto_371780 ?auto_371785 ) ) ( not ( = ?auto_371780 ?auto_371786 ) ) ( not ( = ?auto_371781 ?auto_371782 ) ) ( not ( = ?auto_371781 ?auto_371783 ) ) ( not ( = ?auto_371781 ?auto_371784 ) ) ( not ( = ?auto_371781 ?auto_371785 ) ) ( not ( = ?auto_371781 ?auto_371786 ) ) ( not ( = ?auto_371782 ?auto_371783 ) ) ( not ( = ?auto_371782 ?auto_371784 ) ) ( not ( = ?auto_371782 ?auto_371785 ) ) ( not ( = ?auto_371782 ?auto_371786 ) ) ( not ( = ?auto_371783 ?auto_371784 ) ) ( not ( = ?auto_371783 ?auto_371785 ) ) ( not ( = ?auto_371783 ?auto_371786 ) ) ( not ( = ?auto_371784 ?auto_371785 ) ) ( not ( = ?auto_371784 ?auto_371786 ) ) ( not ( = ?auto_371785 ?auto_371786 ) ) ( ON ?auto_371784 ?auto_371785 ) ( ON ?auto_371783 ?auto_371784 ) ( CLEAR ?auto_371781 ) ( ON ?auto_371782 ?auto_371783 ) ( CLEAR ?auto_371782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_371778 ?auto_371779 ?auto_371780 ?auto_371781 ?auto_371782 )
      ( MAKE-8PILE ?auto_371778 ?auto_371779 ?auto_371780 ?auto_371781 ?auto_371782 ?auto_371783 ?auto_371784 ?auto_371785 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371812 - BLOCK
      ?auto_371813 - BLOCK
      ?auto_371814 - BLOCK
      ?auto_371815 - BLOCK
      ?auto_371816 - BLOCK
      ?auto_371817 - BLOCK
      ?auto_371818 - BLOCK
      ?auto_371819 - BLOCK
    )
    :vars
    (
      ?auto_371820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371819 ?auto_371820 ) ( ON-TABLE ?auto_371812 ) ( ON ?auto_371813 ?auto_371812 ) ( ON ?auto_371814 ?auto_371813 ) ( not ( = ?auto_371812 ?auto_371813 ) ) ( not ( = ?auto_371812 ?auto_371814 ) ) ( not ( = ?auto_371812 ?auto_371815 ) ) ( not ( = ?auto_371812 ?auto_371816 ) ) ( not ( = ?auto_371812 ?auto_371817 ) ) ( not ( = ?auto_371812 ?auto_371818 ) ) ( not ( = ?auto_371812 ?auto_371819 ) ) ( not ( = ?auto_371812 ?auto_371820 ) ) ( not ( = ?auto_371813 ?auto_371814 ) ) ( not ( = ?auto_371813 ?auto_371815 ) ) ( not ( = ?auto_371813 ?auto_371816 ) ) ( not ( = ?auto_371813 ?auto_371817 ) ) ( not ( = ?auto_371813 ?auto_371818 ) ) ( not ( = ?auto_371813 ?auto_371819 ) ) ( not ( = ?auto_371813 ?auto_371820 ) ) ( not ( = ?auto_371814 ?auto_371815 ) ) ( not ( = ?auto_371814 ?auto_371816 ) ) ( not ( = ?auto_371814 ?auto_371817 ) ) ( not ( = ?auto_371814 ?auto_371818 ) ) ( not ( = ?auto_371814 ?auto_371819 ) ) ( not ( = ?auto_371814 ?auto_371820 ) ) ( not ( = ?auto_371815 ?auto_371816 ) ) ( not ( = ?auto_371815 ?auto_371817 ) ) ( not ( = ?auto_371815 ?auto_371818 ) ) ( not ( = ?auto_371815 ?auto_371819 ) ) ( not ( = ?auto_371815 ?auto_371820 ) ) ( not ( = ?auto_371816 ?auto_371817 ) ) ( not ( = ?auto_371816 ?auto_371818 ) ) ( not ( = ?auto_371816 ?auto_371819 ) ) ( not ( = ?auto_371816 ?auto_371820 ) ) ( not ( = ?auto_371817 ?auto_371818 ) ) ( not ( = ?auto_371817 ?auto_371819 ) ) ( not ( = ?auto_371817 ?auto_371820 ) ) ( not ( = ?auto_371818 ?auto_371819 ) ) ( not ( = ?auto_371818 ?auto_371820 ) ) ( not ( = ?auto_371819 ?auto_371820 ) ) ( ON ?auto_371818 ?auto_371819 ) ( ON ?auto_371817 ?auto_371818 ) ( ON ?auto_371816 ?auto_371817 ) ( CLEAR ?auto_371814 ) ( ON ?auto_371815 ?auto_371816 ) ( CLEAR ?auto_371815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_371812 ?auto_371813 ?auto_371814 ?auto_371815 )
      ( MAKE-8PILE ?auto_371812 ?auto_371813 ?auto_371814 ?auto_371815 ?auto_371816 ?auto_371817 ?auto_371818 ?auto_371819 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371846 - BLOCK
      ?auto_371847 - BLOCK
      ?auto_371848 - BLOCK
      ?auto_371849 - BLOCK
      ?auto_371850 - BLOCK
      ?auto_371851 - BLOCK
      ?auto_371852 - BLOCK
      ?auto_371853 - BLOCK
    )
    :vars
    (
      ?auto_371854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371853 ?auto_371854 ) ( ON-TABLE ?auto_371846 ) ( ON ?auto_371847 ?auto_371846 ) ( not ( = ?auto_371846 ?auto_371847 ) ) ( not ( = ?auto_371846 ?auto_371848 ) ) ( not ( = ?auto_371846 ?auto_371849 ) ) ( not ( = ?auto_371846 ?auto_371850 ) ) ( not ( = ?auto_371846 ?auto_371851 ) ) ( not ( = ?auto_371846 ?auto_371852 ) ) ( not ( = ?auto_371846 ?auto_371853 ) ) ( not ( = ?auto_371846 ?auto_371854 ) ) ( not ( = ?auto_371847 ?auto_371848 ) ) ( not ( = ?auto_371847 ?auto_371849 ) ) ( not ( = ?auto_371847 ?auto_371850 ) ) ( not ( = ?auto_371847 ?auto_371851 ) ) ( not ( = ?auto_371847 ?auto_371852 ) ) ( not ( = ?auto_371847 ?auto_371853 ) ) ( not ( = ?auto_371847 ?auto_371854 ) ) ( not ( = ?auto_371848 ?auto_371849 ) ) ( not ( = ?auto_371848 ?auto_371850 ) ) ( not ( = ?auto_371848 ?auto_371851 ) ) ( not ( = ?auto_371848 ?auto_371852 ) ) ( not ( = ?auto_371848 ?auto_371853 ) ) ( not ( = ?auto_371848 ?auto_371854 ) ) ( not ( = ?auto_371849 ?auto_371850 ) ) ( not ( = ?auto_371849 ?auto_371851 ) ) ( not ( = ?auto_371849 ?auto_371852 ) ) ( not ( = ?auto_371849 ?auto_371853 ) ) ( not ( = ?auto_371849 ?auto_371854 ) ) ( not ( = ?auto_371850 ?auto_371851 ) ) ( not ( = ?auto_371850 ?auto_371852 ) ) ( not ( = ?auto_371850 ?auto_371853 ) ) ( not ( = ?auto_371850 ?auto_371854 ) ) ( not ( = ?auto_371851 ?auto_371852 ) ) ( not ( = ?auto_371851 ?auto_371853 ) ) ( not ( = ?auto_371851 ?auto_371854 ) ) ( not ( = ?auto_371852 ?auto_371853 ) ) ( not ( = ?auto_371852 ?auto_371854 ) ) ( not ( = ?auto_371853 ?auto_371854 ) ) ( ON ?auto_371852 ?auto_371853 ) ( ON ?auto_371851 ?auto_371852 ) ( ON ?auto_371850 ?auto_371851 ) ( ON ?auto_371849 ?auto_371850 ) ( CLEAR ?auto_371847 ) ( ON ?auto_371848 ?auto_371849 ) ( CLEAR ?auto_371848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371846 ?auto_371847 ?auto_371848 )
      ( MAKE-8PILE ?auto_371846 ?auto_371847 ?auto_371848 ?auto_371849 ?auto_371850 ?auto_371851 ?auto_371852 ?auto_371853 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371880 - BLOCK
      ?auto_371881 - BLOCK
      ?auto_371882 - BLOCK
      ?auto_371883 - BLOCK
      ?auto_371884 - BLOCK
      ?auto_371885 - BLOCK
      ?auto_371886 - BLOCK
      ?auto_371887 - BLOCK
    )
    :vars
    (
      ?auto_371888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371887 ?auto_371888 ) ( ON-TABLE ?auto_371880 ) ( not ( = ?auto_371880 ?auto_371881 ) ) ( not ( = ?auto_371880 ?auto_371882 ) ) ( not ( = ?auto_371880 ?auto_371883 ) ) ( not ( = ?auto_371880 ?auto_371884 ) ) ( not ( = ?auto_371880 ?auto_371885 ) ) ( not ( = ?auto_371880 ?auto_371886 ) ) ( not ( = ?auto_371880 ?auto_371887 ) ) ( not ( = ?auto_371880 ?auto_371888 ) ) ( not ( = ?auto_371881 ?auto_371882 ) ) ( not ( = ?auto_371881 ?auto_371883 ) ) ( not ( = ?auto_371881 ?auto_371884 ) ) ( not ( = ?auto_371881 ?auto_371885 ) ) ( not ( = ?auto_371881 ?auto_371886 ) ) ( not ( = ?auto_371881 ?auto_371887 ) ) ( not ( = ?auto_371881 ?auto_371888 ) ) ( not ( = ?auto_371882 ?auto_371883 ) ) ( not ( = ?auto_371882 ?auto_371884 ) ) ( not ( = ?auto_371882 ?auto_371885 ) ) ( not ( = ?auto_371882 ?auto_371886 ) ) ( not ( = ?auto_371882 ?auto_371887 ) ) ( not ( = ?auto_371882 ?auto_371888 ) ) ( not ( = ?auto_371883 ?auto_371884 ) ) ( not ( = ?auto_371883 ?auto_371885 ) ) ( not ( = ?auto_371883 ?auto_371886 ) ) ( not ( = ?auto_371883 ?auto_371887 ) ) ( not ( = ?auto_371883 ?auto_371888 ) ) ( not ( = ?auto_371884 ?auto_371885 ) ) ( not ( = ?auto_371884 ?auto_371886 ) ) ( not ( = ?auto_371884 ?auto_371887 ) ) ( not ( = ?auto_371884 ?auto_371888 ) ) ( not ( = ?auto_371885 ?auto_371886 ) ) ( not ( = ?auto_371885 ?auto_371887 ) ) ( not ( = ?auto_371885 ?auto_371888 ) ) ( not ( = ?auto_371886 ?auto_371887 ) ) ( not ( = ?auto_371886 ?auto_371888 ) ) ( not ( = ?auto_371887 ?auto_371888 ) ) ( ON ?auto_371886 ?auto_371887 ) ( ON ?auto_371885 ?auto_371886 ) ( ON ?auto_371884 ?auto_371885 ) ( ON ?auto_371883 ?auto_371884 ) ( ON ?auto_371882 ?auto_371883 ) ( CLEAR ?auto_371880 ) ( ON ?auto_371881 ?auto_371882 ) ( CLEAR ?auto_371881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371880 ?auto_371881 )
      ( MAKE-8PILE ?auto_371880 ?auto_371881 ?auto_371882 ?auto_371883 ?auto_371884 ?auto_371885 ?auto_371886 ?auto_371887 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371914 - BLOCK
      ?auto_371915 - BLOCK
      ?auto_371916 - BLOCK
      ?auto_371917 - BLOCK
      ?auto_371918 - BLOCK
      ?auto_371919 - BLOCK
      ?auto_371920 - BLOCK
      ?auto_371921 - BLOCK
    )
    :vars
    (
      ?auto_371922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371921 ?auto_371922 ) ( not ( = ?auto_371914 ?auto_371915 ) ) ( not ( = ?auto_371914 ?auto_371916 ) ) ( not ( = ?auto_371914 ?auto_371917 ) ) ( not ( = ?auto_371914 ?auto_371918 ) ) ( not ( = ?auto_371914 ?auto_371919 ) ) ( not ( = ?auto_371914 ?auto_371920 ) ) ( not ( = ?auto_371914 ?auto_371921 ) ) ( not ( = ?auto_371914 ?auto_371922 ) ) ( not ( = ?auto_371915 ?auto_371916 ) ) ( not ( = ?auto_371915 ?auto_371917 ) ) ( not ( = ?auto_371915 ?auto_371918 ) ) ( not ( = ?auto_371915 ?auto_371919 ) ) ( not ( = ?auto_371915 ?auto_371920 ) ) ( not ( = ?auto_371915 ?auto_371921 ) ) ( not ( = ?auto_371915 ?auto_371922 ) ) ( not ( = ?auto_371916 ?auto_371917 ) ) ( not ( = ?auto_371916 ?auto_371918 ) ) ( not ( = ?auto_371916 ?auto_371919 ) ) ( not ( = ?auto_371916 ?auto_371920 ) ) ( not ( = ?auto_371916 ?auto_371921 ) ) ( not ( = ?auto_371916 ?auto_371922 ) ) ( not ( = ?auto_371917 ?auto_371918 ) ) ( not ( = ?auto_371917 ?auto_371919 ) ) ( not ( = ?auto_371917 ?auto_371920 ) ) ( not ( = ?auto_371917 ?auto_371921 ) ) ( not ( = ?auto_371917 ?auto_371922 ) ) ( not ( = ?auto_371918 ?auto_371919 ) ) ( not ( = ?auto_371918 ?auto_371920 ) ) ( not ( = ?auto_371918 ?auto_371921 ) ) ( not ( = ?auto_371918 ?auto_371922 ) ) ( not ( = ?auto_371919 ?auto_371920 ) ) ( not ( = ?auto_371919 ?auto_371921 ) ) ( not ( = ?auto_371919 ?auto_371922 ) ) ( not ( = ?auto_371920 ?auto_371921 ) ) ( not ( = ?auto_371920 ?auto_371922 ) ) ( not ( = ?auto_371921 ?auto_371922 ) ) ( ON ?auto_371920 ?auto_371921 ) ( ON ?auto_371919 ?auto_371920 ) ( ON ?auto_371918 ?auto_371919 ) ( ON ?auto_371917 ?auto_371918 ) ( ON ?auto_371916 ?auto_371917 ) ( ON ?auto_371915 ?auto_371916 ) ( ON ?auto_371914 ?auto_371915 ) ( CLEAR ?auto_371914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371914 )
      ( MAKE-8PILE ?auto_371914 ?auto_371915 ?auto_371916 ?auto_371917 ?auto_371918 ?auto_371919 ?auto_371920 ?auto_371921 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_371949 - BLOCK
      ?auto_371950 - BLOCK
      ?auto_371951 - BLOCK
      ?auto_371952 - BLOCK
      ?auto_371953 - BLOCK
      ?auto_371954 - BLOCK
      ?auto_371955 - BLOCK
      ?auto_371956 - BLOCK
      ?auto_371957 - BLOCK
    )
    :vars
    (
      ?auto_371958 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371956 ) ( ON ?auto_371957 ?auto_371958 ) ( CLEAR ?auto_371957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371949 ) ( ON ?auto_371950 ?auto_371949 ) ( ON ?auto_371951 ?auto_371950 ) ( ON ?auto_371952 ?auto_371951 ) ( ON ?auto_371953 ?auto_371952 ) ( ON ?auto_371954 ?auto_371953 ) ( ON ?auto_371955 ?auto_371954 ) ( ON ?auto_371956 ?auto_371955 ) ( not ( = ?auto_371949 ?auto_371950 ) ) ( not ( = ?auto_371949 ?auto_371951 ) ) ( not ( = ?auto_371949 ?auto_371952 ) ) ( not ( = ?auto_371949 ?auto_371953 ) ) ( not ( = ?auto_371949 ?auto_371954 ) ) ( not ( = ?auto_371949 ?auto_371955 ) ) ( not ( = ?auto_371949 ?auto_371956 ) ) ( not ( = ?auto_371949 ?auto_371957 ) ) ( not ( = ?auto_371949 ?auto_371958 ) ) ( not ( = ?auto_371950 ?auto_371951 ) ) ( not ( = ?auto_371950 ?auto_371952 ) ) ( not ( = ?auto_371950 ?auto_371953 ) ) ( not ( = ?auto_371950 ?auto_371954 ) ) ( not ( = ?auto_371950 ?auto_371955 ) ) ( not ( = ?auto_371950 ?auto_371956 ) ) ( not ( = ?auto_371950 ?auto_371957 ) ) ( not ( = ?auto_371950 ?auto_371958 ) ) ( not ( = ?auto_371951 ?auto_371952 ) ) ( not ( = ?auto_371951 ?auto_371953 ) ) ( not ( = ?auto_371951 ?auto_371954 ) ) ( not ( = ?auto_371951 ?auto_371955 ) ) ( not ( = ?auto_371951 ?auto_371956 ) ) ( not ( = ?auto_371951 ?auto_371957 ) ) ( not ( = ?auto_371951 ?auto_371958 ) ) ( not ( = ?auto_371952 ?auto_371953 ) ) ( not ( = ?auto_371952 ?auto_371954 ) ) ( not ( = ?auto_371952 ?auto_371955 ) ) ( not ( = ?auto_371952 ?auto_371956 ) ) ( not ( = ?auto_371952 ?auto_371957 ) ) ( not ( = ?auto_371952 ?auto_371958 ) ) ( not ( = ?auto_371953 ?auto_371954 ) ) ( not ( = ?auto_371953 ?auto_371955 ) ) ( not ( = ?auto_371953 ?auto_371956 ) ) ( not ( = ?auto_371953 ?auto_371957 ) ) ( not ( = ?auto_371953 ?auto_371958 ) ) ( not ( = ?auto_371954 ?auto_371955 ) ) ( not ( = ?auto_371954 ?auto_371956 ) ) ( not ( = ?auto_371954 ?auto_371957 ) ) ( not ( = ?auto_371954 ?auto_371958 ) ) ( not ( = ?auto_371955 ?auto_371956 ) ) ( not ( = ?auto_371955 ?auto_371957 ) ) ( not ( = ?auto_371955 ?auto_371958 ) ) ( not ( = ?auto_371956 ?auto_371957 ) ) ( not ( = ?auto_371956 ?auto_371958 ) ) ( not ( = ?auto_371957 ?auto_371958 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371957 ?auto_371958 )
      ( !STACK ?auto_371957 ?auto_371956 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_371987 - BLOCK
      ?auto_371988 - BLOCK
      ?auto_371989 - BLOCK
      ?auto_371990 - BLOCK
      ?auto_371991 - BLOCK
      ?auto_371992 - BLOCK
      ?auto_371993 - BLOCK
      ?auto_371994 - BLOCK
      ?auto_371995 - BLOCK
    )
    :vars
    (
      ?auto_371996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371995 ?auto_371996 ) ( ON-TABLE ?auto_371987 ) ( ON ?auto_371988 ?auto_371987 ) ( ON ?auto_371989 ?auto_371988 ) ( ON ?auto_371990 ?auto_371989 ) ( ON ?auto_371991 ?auto_371990 ) ( ON ?auto_371992 ?auto_371991 ) ( ON ?auto_371993 ?auto_371992 ) ( not ( = ?auto_371987 ?auto_371988 ) ) ( not ( = ?auto_371987 ?auto_371989 ) ) ( not ( = ?auto_371987 ?auto_371990 ) ) ( not ( = ?auto_371987 ?auto_371991 ) ) ( not ( = ?auto_371987 ?auto_371992 ) ) ( not ( = ?auto_371987 ?auto_371993 ) ) ( not ( = ?auto_371987 ?auto_371994 ) ) ( not ( = ?auto_371987 ?auto_371995 ) ) ( not ( = ?auto_371987 ?auto_371996 ) ) ( not ( = ?auto_371988 ?auto_371989 ) ) ( not ( = ?auto_371988 ?auto_371990 ) ) ( not ( = ?auto_371988 ?auto_371991 ) ) ( not ( = ?auto_371988 ?auto_371992 ) ) ( not ( = ?auto_371988 ?auto_371993 ) ) ( not ( = ?auto_371988 ?auto_371994 ) ) ( not ( = ?auto_371988 ?auto_371995 ) ) ( not ( = ?auto_371988 ?auto_371996 ) ) ( not ( = ?auto_371989 ?auto_371990 ) ) ( not ( = ?auto_371989 ?auto_371991 ) ) ( not ( = ?auto_371989 ?auto_371992 ) ) ( not ( = ?auto_371989 ?auto_371993 ) ) ( not ( = ?auto_371989 ?auto_371994 ) ) ( not ( = ?auto_371989 ?auto_371995 ) ) ( not ( = ?auto_371989 ?auto_371996 ) ) ( not ( = ?auto_371990 ?auto_371991 ) ) ( not ( = ?auto_371990 ?auto_371992 ) ) ( not ( = ?auto_371990 ?auto_371993 ) ) ( not ( = ?auto_371990 ?auto_371994 ) ) ( not ( = ?auto_371990 ?auto_371995 ) ) ( not ( = ?auto_371990 ?auto_371996 ) ) ( not ( = ?auto_371991 ?auto_371992 ) ) ( not ( = ?auto_371991 ?auto_371993 ) ) ( not ( = ?auto_371991 ?auto_371994 ) ) ( not ( = ?auto_371991 ?auto_371995 ) ) ( not ( = ?auto_371991 ?auto_371996 ) ) ( not ( = ?auto_371992 ?auto_371993 ) ) ( not ( = ?auto_371992 ?auto_371994 ) ) ( not ( = ?auto_371992 ?auto_371995 ) ) ( not ( = ?auto_371992 ?auto_371996 ) ) ( not ( = ?auto_371993 ?auto_371994 ) ) ( not ( = ?auto_371993 ?auto_371995 ) ) ( not ( = ?auto_371993 ?auto_371996 ) ) ( not ( = ?auto_371994 ?auto_371995 ) ) ( not ( = ?auto_371994 ?auto_371996 ) ) ( not ( = ?auto_371995 ?auto_371996 ) ) ( CLEAR ?auto_371993 ) ( ON ?auto_371994 ?auto_371995 ) ( CLEAR ?auto_371994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_371987 ?auto_371988 ?auto_371989 ?auto_371990 ?auto_371991 ?auto_371992 ?auto_371993 ?auto_371994 )
      ( MAKE-9PILE ?auto_371987 ?auto_371988 ?auto_371989 ?auto_371990 ?auto_371991 ?auto_371992 ?auto_371993 ?auto_371994 ?auto_371995 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372025 - BLOCK
      ?auto_372026 - BLOCK
      ?auto_372027 - BLOCK
      ?auto_372028 - BLOCK
      ?auto_372029 - BLOCK
      ?auto_372030 - BLOCK
      ?auto_372031 - BLOCK
      ?auto_372032 - BLOCK
      ?auto_372033 - BLOCK
    )
    :vars
    (
      ?auto_372034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372033 ?auto_372034 ) ( ON-TABLE ?auto_372025 ) ( ON ?auto_372026 ?auto_372025 ) ( ON ?auto_372027 ?auto_372026 ) ( ON ?auto_372028 ?auto_372027 ) ( ON ?auto_372029 ?auto_372028 ) ( ON ?auto_372030 ?auto_372029 ) ( not ( = ?auto_372025 ?auto_372026 ) ) ( not ( = ?auto_372025 ?auto_372027 ) ) ( not ( = ?auto_372025 ?auto_372028 ) ) ( not ( = ?auto_372025 ?auto_372029 ) ) ( not ( = ?auto_372025 ?auto_372030 ) ) ( not ( = ?auto_372025 ?auto_372031 ) ) ( not ( = ?auto_372025 ?auto_372032 ) ) ( not ( = ?auto_372025 ?auto_372033 ) ) ( not ( = ?auto_372025 ?auto_372034 ) ) ( not ( = ?auto_372026 ?auto_372027 ) ) ( not ( = ?auto_372026 ?auto_372028 ) ) ( not ( = ?auto_372026 ?auto_372029 ) ) ( not ( = ?auto_372026 ?auto_372030 ) ) ( not ( = ?auto_372026 ?auto_372031 ) ) ( not ( = ?auto_372026 ?auto_372032 ) ) ( not ( = ?auto_372026 ?auto_372033 ) ) ( not ( = ?auto_372026 ?auto_372034 ) ) ( not ( = ?auto_372027 ?auto_372028 ) ) ( not ( = ?auto_372027 ?auto_372029 ) ) ( not ( = ?auto_372027 ?auto_372030 ) ) ( not ( = ?auto_372027 ?auto_372031 ) ) ( not ( = ?auto_372027 ?auto_372032 ) ) ( not ( = ?auto_372027 ?auto_372033 ) ) ( not ( = ?auto_372027 ?auto_372034 ) ) ( not ( = ?auto_372028 ?auto_372029 ) ) ( not ( = ?auto_372028 ?auto_372030 ) ) ( not ( = ?auto_372028 ?auto_372031 ) ) ( not ( = ?auto_372028 ?auto_372032 ) ) ( not ( = ?auto_372028 ?auto_372033 ) ) ( not ( = ?auto_372028 ?auto_372034 ) ) ( not ( = ?auto_372029 ?auto_372030 ) ) ( not ( = ?auto_372029 ?auto_372031 ) ) ( not ( = ?auto_372029 ?auto_372032 ) ) ( not ( = ?auto_372029 ?auto_372033 ) ) ( not ( = ?auto_372029 ?auto_372034 ) ) ( not ( = ?auto_372030 ?auto_372031 ) ) ( not ( = ?auto_372030 ?auto_372032 ) ) ( not ( = ?auto_372030 ?auto_372033 ) ) ( not ( = ?auto_372030 ?auto_372034 ) ) ( not ( = ?auto_372031 ?auto_372032 ) ) ( not ( = ?auto_372031 ?auto_372033 ) ) ( not ( = ?auto_372031 ?auto_372034 ) ) ( not ( = ?auto_372032 ?auto_372033 ) ) ( not ( = ?auto_372032 ?auto_372034 ) ) ( not ( = ?auto_372033 ?auto_372034 ) ) ( ON ?auto_372032 ?auto_372033 ) ( CLEAR ?auto_372030 ) ( ON ?auto_372031 ?auto_372032 ) ( CLEAR ?auto_372031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_372025 ?auto_372026 ?auto_372027 ?auto_372028 ?auto_372029 ?auto_372030 ?auto_372031 )
      ( MAKE-9PILE ?auto_372025 ?auto_372026 ?auto_372027 ?auto_372028 ?auto_372029 ?auto_372030 ?auto_372031 ?auto_372032 ?auto_372033 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372063 - BLOCK
      ?auto_372064 - BLOCK
      ?auto_372065 - BLOCK
      ?auto_372066 - BLOCK
      ?auto_372067 - BLOCK
      ?auto_372068 - BLOCK
      ?auto_372069 - BLOCK
      ?auto_372070 - BLOCK
      ?auto_372071 - BLOCK
    )
    :vars
    (
      ?auto_372072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372071 ?auto_372072 ) ( ON-TABLE ?auto_372063 ) ( ON ?auto_372064 ?auto_372063 ) ( ON ?auto_372065 ?auto_372064 ) ( ON ?auto_372066 ?auto_372065 ) ( ON ?auto_372067 ?auto_372066 ) ( not ( = ?auto_372063 ?auto_372064 ) ) ( not ( = ?auto_372063 ?auto_372065 ) ) ( not ( = ?auto_372063 ?auto_372066 ) ) ( not ( = ?auto_372063 ?auto_372067 ) ) ( not ( = ?auto_372063 ?auto_372068 ) ) ( not ( = ?auto_372063 ?auto_372069 ) ) ( not ( = ?auto_372063 ?auto_372070 ) ) ( not ( = ?auto_372063 ?auto_372071 ) ) ( not ( = ?auto_372063 ?auto_372072 ) ) ( not ( = ?auto_372064 ?auto_372065 ) ) ( not ( = ?auto_372064 ?auto_372066 ) ) ( not ( = ?auto_372064 ?auto_372067 ) ) ( not ( = ?auto_372064 ?auto_372068 ) ) ( not ( = ?auto_372064 ?auto_372069 ) ) ( not ( = ?auto_372064 ?auto_372070 ) ) ( not ( = ?auto_372064 ?auto_372071 ) ) ( not ( = ?auto_372064 ?auto_372072 ) ) ( not ( = ?auto_372065 ?auto_372066 ) ) ( not ( = ?auto_372065 ?auto_372067 ) ) ( not ( = ?auto_372065 ?auto_372068 ) ) ( not ( = ?auto_372065 ?auto_372069 ) ) ( not ( = ?auto_372065 ?auto_372070 ) ) ( not ( = ?auto_372065 ?auto_372071 ) ) ( not ( = ?auto_372065 ?auto_372072 ) ) ( not ( = ?auto_372066 ?auto_372067 ) ) ( not ( = ?auto_372066 ?auto_372068 ) ) ( not ( = ?auto_372066 ?auto_372069 ) ) ( not ( = ?auto_372066 ?auto_372070 ) ) ( not ( = ?auto_372066 ?auto_372071 ) ) ( not ( = ?auto_372066 ?auto_372072 ) ) ( not ( = ?auto_372067 ?auto_372068 ) ) ( not ( = ?auto_372067 ?auto_372069 ) ) ( not ( = ?auto_372067 ?auto_372070 ) ) ( not ( = ?auto_372067 ?auto_372071 ) ) ( not ( = ?auto_372067 ?auto_372072 ) ) ( not ( = ?auto_372068 ?auto_372069 ) ) ( not ( = ?auto_372068 ?auto_372070 ) ) ( not ( = ?auto_372068 ?auto_372071 ) ) ( not ( = ?auto_372068 ?auto_372072 ) ) ( not ( = ?auto_372069 ?auto_372070 ) ) ( not ( = ?auto_372069 ?auto_372071 ) ) ( not ( = ?auto_372069 ?auto_372072 ) ) ( not ( = ?auto_372070 ?auto_372071 ) ) ( not ( = ?auto_372070 ?auto_372072 ) ) ( not ( = ?auto_372071 ?auto_372072 ) ) ( ON ?auto_372070 ?auto_372071 ) ( ON ?auto_372069 ?auto_372070 ) ( CLEAR ?auto_372067 ) ( ON ?auto_372068 ?auto_372069 ) ( CLEAR ?auto_372068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_372063 ?auto_372064 ?auto_372065 ?auto_372066 ?auto_372067 ?auto_372068 )
      ( MAKE-9PILE ?auto_372063 ?auto_372064 ?auto_372065 ?auto_372066 ?auto_372067 ?auto_372068 ?auto_372069 ?auto_372070 ?auto_372071 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372101 - BLOCK
      ?auto_372102 - BLOCK
      ?auto_372103 - BLOCK
      ?auto_372104 - BLOCK
      ?auto_372105 - BLOCK
      ?auto_372106 - BLOCK
      ?auto_372107 - BLOCK
      ?auto_372108 - BLOCK
      ?auto_372109 - BLOCK
    )
    :vars
    (
      ?auto_372110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372109 ?auto_372110 ) ( ON-TABLE ?auto_372101 ) ( ON ?auto_372102 ?auto_372101 ) ( ON ?auto_372103 ?auto_372102 ) ( ON ?auto_372104 ?auto_372103 ) ( not ( = ?auto_372101 ?auto_372102 ) ) ( not ( = ?auto_372101 ?auto_372103 ) ) ( not ( = ?auto_372101 ?auto_372104 ) ) ( not ( = ?auto_372101 ?auto_372105 ) ) ( not ( = ?auto_372101 ?auto_372106 ) ) ( not ( = ?auto_372101 ?auto_372107 ) ) ( not ( = ?auto_372101 ?auto_372108 ) ) ( not ( = ?auto_372101 ?auto_372109 ) ) ( not ( = ?auto_372101 ?auto_372110 ) ) ( not ( = ?auto_372102 ?auto_372103 ) ) ( not ( = ?auto_372102 ?auto_372104 ) ) ( not ( = ?auto_372102 ?auto_372105 ) ) ( not ( = ?auto_372102 ?auto_372106 ) ) ( not ( = ?auto_372102 ?auto_372107 ) ) ( not ( = ?auto_372102 ?auto_372108 ) ) ( not ( = ?auto_372102 ?auto_372109 ) ) ( not ( = ?auto_372102 ?auto_372110 ) ) ( not ( = ?auto_372103 ?auto_372104 ) ) ( not ( = ?auto_372103 ?auto_372105 ) ) ( not ( = ?auto_372103 ?auto_372106 ) ) ( not ( = ?auto_372103 ?auto_372107 ) ) ( not ( = ?auto_372103 ?auto_372108 ) ) ( not ( = ?auto_372103 ?auto_372109 ) ) ( not ( = ?auto_372103 ?auto_372110 ) ) ( not ( = ?auto_372104 ?auto_372105 ) ) ( not ( = ?auto_372104 ?auto_372106 ) ) ( not ( = ?auto_372104 ?auto_372107 ) ) ( not ( = ?auto_372104 ?auto_372108 ) ) ( not ( = ?auto_372104 ?auto_372109 ) ) ( not ( = ?auto_372104 ?auto_372110 ) ) ( not ( = ?auto_372105 ?auto_372106 ) ) ( not ( = ?auto_372105 ?auto_372107 ) ) ( not ( = ?auto_372105 ?auto_372108 ) ) ( not ( = ?auto_372105 ?auto_372109 ) ) ( not ( = ?auto_372105 ?auto_372110 ) ) ( not ( = ?auto_372106 ?auto_372107 ) ) ( not ( = ?auto_372106 ?auto_372108 ) ) ( not ( = ?auto_372106 ?auto_372109 ) ) ( not ( = ?auto_372106 ?auto_372110 ) ) ( not ( = ?auto_372107 ?auto_372108 ) ) ( not ( = ?auto_372107 ?auto_372109 ) ) ( not ( = ?auto_372107 ?auto_372110 ) ) ( not ( = ?auto_372108 ?auto_372109 ) ) ( not ( = ?auto_372108 ?auto_372110 ) ) ( not ( = ?auto_372109 ?auto_372110 ) ) ( ON ?auto_372108 ?auto_372109 ) ( ON ?auto_372107 ?auto_372108 ) ( ON ?auto_372106 ?auto_372107 ) ( CLEAR ?auto_372104 ) ( ON ?auto_372105 ?auto_372106 ) ( CLEAR ?auto_372105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_372101 ?auto_372102 ?auto_372103 ?auto_372104 ?auto_372105 )
      ( MAKE-9PILE ?auto_372101 ?auto_372102 ?auto_372103 ?auto_372104 ?auto_372105 ?auto_372106 ?auto_372107 ?auto_372108 ?auto_372109 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372139 - BLOCK
      ?auto_372140 - BLOCK
      ?auto_372141 - BLOCK
      ?auto_372142 - BLOCK
      ?auto_372143 - BLOCK
      ?auto_372144 - BLOCK
      ?auto_372145 - BLOCK
      ?auto_372146 - BLOCK
      ?auto_372147 - BLOCK
    )
    :vars
    (
      ?auto_372148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372147 ?auto_372148 ) ( ON-TABLE ?auto_372139 ) ( ON ?auto_372140 ?auto_372139 ) ( ON ?auto_372141 ?auto_372140 ) ( not ( = ?auto_372139 ?auto_372140 ) ) ( not ( = ?auto_372139 ?auto_372141 ) ) ( not ( = ?auto_372139 ?auto_372142 ) ) ( not ( = ?auto_372139 ?auto_372143 ) ) ( not ( = ?auto_372139 ?auto_372144 ) ) ( not ( = ?auto_372139 ?auto_372145 ) ) ( not ( = ?auto_372139 ?auto_372146 ) ) ( not ( = ?auto_372139 ?auto_372147 ) ) ( not ( = ?auto_372139 ?auto_372148 ) ) ( not ( = ?auto_372140 ?auto_372141 ) ) ( not ( = ?auto_372140 ?auto_372142 ) ) ( not ( = ?auto_372140 ?auto_372143 ) ) ( not ( = ?auto_372140 ?auto_372144 ) ) ( not ( = ?auto_372140 ?auto_372145 ) ) ( not ( = ?auto_372140 ?auto_372146 ) ) ( not ( = ?auto_372140 ?auto_372147 ) ) ( not ( = ?auto_372140 ?auto_372148 ) ) ( not ( = ?auto_372141 ?auto_372142 ) ) ( not ( = ?auto_372141 ?auto_372143 ) ) ( not ( = ?auto_372141 ?auto_372144 ) ) ( not ( = ?auto_372141 ?auto_372145 ) ) ( not ( = ?auto_372141 ?auto_372146 ) ) ( not ( = ?auto_372141 ?auto_372147 ) ) ( not ( = ?auto_372141 ?auto_372148 ) ) ( not ( = ?auto_372142 ?auto_372143 ) ) ( not ( = ?auto_372142 ?auto_372144 ) ) ( not ( = ?auto_372142 ?auto_372145 ) ) ( not ( = ?auto_372142 ?auto_372146 ) ) ( not ( = ?auto_372142 ?auto_372147 ) ) ( not ( = ?auto_372142 ?auto_372148 ) ) ( not ( = ?auto_372143 ?auto_372144 ) ) ( not ( = ?auto_372143 ?auto_372145 ) ) ( not ( = ?auto_372143 ?auto_372146 ) ) ( not ( = ?auto_372143 ?auto_372147 ) ) ( not ( = ?auto_372143 ?auto_372148 ) ) ( not ( = ?auto_372144 ?auto_372145 ) ) ( not ( = ?auto_372144 ?auto_372146 ) ) ( not ( = ?auto_372144 ?auto_372147 ) ) ( not ( = ?auto_372144 ?auto_372148 ) ) ( not ( = ?auto_372145 ?auto_372146 ) ) ( not ( = ?auto_372145 ?auto_372147 ) ) ( not ( = ?auto_372145 ?auto_372148 ) ) ( not ( = ?auto_372146 ?auto_372147 ) ) ( not ( = ?auto_372146 ?auto_372148 ) ) ( not ( = ?auto_372147 ?auto_372148 ) ) ( ON ?auto_372146 ?auto_372147 ) ( ON ?auto_372145 ?auto_372146 ) ( ON ?auto_372144 ?auto_372145 ) ( ON ?auto_372143 ?auto_372144 ) ( CLEAR ?auto_372141 ) ( ON ?auto_372142 ?auto_372143 ) ( CLEAR ?auto_372142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_372139 ?auto_372140 ?auto_372141 ?auto_372142 )
      ( MAKE-9PILE ?auto_372139 ?auto_372140 ?auto_372141 ?auto_372142 ?auto_372143 ?auto_372144 ?auto_372145 ?auto_372146 ?auto_372147 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372177 - BLOCK
      ?auto_372178 - BLOCK
      ?auto_372179 - BLOCK
      ?auto_372180 - BLOCK
      ?auto_372181 - BLOCK
      ?auto_372182 - BLOCK
      ?auto_372183 - BLOCK
      ?auto_372184 - BLOCK
      ?auto_372185 - BLOCK
    )
    :vars
    (
      ?auto_372186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372185 ?auto_372186 ) ( ON-TABLE ?auto_372177 ) ( ON ?auto_372178 ?auto_372177 ) ( not ( = ?auto_372177 ?auto_372178 ) ) ( not ( = ?auto_372177 ?auto_372179 ) ) ( not ( = ?auto_372177 ?auto_372180 ) ) ( not ( = ?auto_372177 ?auto_372181 ) ) ( not ( = ?auto_372177 ?auto_372182 ) ) ( not ( = ?auto_372177 ?auto_372183 ) ) ( not ( = ?auto_372177 ?auto_372184 ) ) ( not ( = ?auto_372177 ?auto_372185 ) ) ( not ( = ?auto_372177 ?auto_372186 ) ) ( not ( = ?auto_372178 ?auto_372179 ) ) ( not ( = ?auto_372178 ?auto_372180 ) ) ( not ( = ?auto_372178 ?auto_372181 ) ) ( not ( = ?auto_372178 ?auto_372182 ) ) ( not ( = ?auto_372178 ?auto_372183 ) ) ( not ( = ?auto_372178 ?auto_372184 ) ) ( not ( = ?auto_372178 ?auto_372185 ) ) ( not ( = ?auto_372178 ?auto_372186 ) ) ( not ( = ?auto_372179 ?auto_372180 ) ) ( not ( = ?auto_372179 ?auto_372181 ) ) ( not ( = ?auto_372179 ?auto_372182 ) ) ( not ( = ?auto_372179 ?auto_372183 ) ) ( not ( = ?auto_372179 ?auto_372184 ) ) ( not ( = ?auto_372179 ?auto_372185 ) ) ( not ( = ?auto_372179 ?auto_372186 ) ) ( not ( = ?auto_372180 ?auto_372181 ) ) ( not ( = ?auto_372180 ?auto_372182 ) ) ( not ( = ?auto_372180 ?auto_372183 ) ) ( not ( = ?auto_372180 ?auto_372184 ) ) ( not ( = ?auto_372180 ?auto_372185 ) ) ( not ( = ?auto_372180 ?auto_372186 ) ) ( not ( = ?auto_372181 ?auto_372182 ) ) ( not ( = ?auto_372181 ?auto_372183 ) ) ( not ( = ?auto_372181 ?auto_372184 ) ) ( not ( = ?auto_372181 ?auto_372185 ) ) ( not ( = ?auto_372181 ?auto_372186 ) ) ( not ( = ?auto_372182 ?auto_372183 ) ) ( not ( = ?auto_372182 ?auto_372184 ) ) ( not ( = ?auto_372182 ?auto_372185 ) ) ( not ( = ?auto_372182 ?auto_372186 ) ) ( not ( = ?auto_372183 ?auto_372184 ) ) ( not ( = ?auto_372183 ?auto_372185 ) ) ( not ( = ?auto_372183 ?auto_372186 ) ) ( not ( = ?auto_372184 ?auto_372185 ) ) ( not ( = ?auto_372184 ?auto_372186 ) ) ( not ( = ?auto_372185 ?auto_372186 ) ) ( ON ?auto_372184 ?auto_372185 ) ( ON ?auto_372183 ?auto_372184 ) ( ON ?auto_372182 ?auto_372183 ) ( ON ?auto_372181 ?auto_372182 ) ( ON ?auto_372180 ?auto_372181 ) ( CLEAR ?auto_372178 ) ( ON ?auto_372179 ?auto_372180 ) ( CLEAR ?auto_372179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_372177 ?auto_372178 ?auto_372179 )
      ( MAKE-9PILE ?auto_372177 ?auto_372178 ?auto_372179 ?auto_372180 ?auto_372181 ?auto_372182 ?auto_372183 ?auto_372184 ?auto_372185 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372215 - BLOCK
      ?auto_372216 - BLOCK
      ?auto_372217 - BLOCK
      ?auto_372218 - BLOCK
      ?auto_372219 - BLOCK
      ?auto_372220 - BLOCK
      ?auto_372221 - BLOCK
      ?auto_372222 - BLOCK
      ?auto_372223 - BLOCK
    )
    :vars
    (
      ?auto_372224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372223 ?auto_372224 ) ( ON-TABLE ?auto_372215 ) ( not ( = ?auto_372215 ?auto_372216 ) ) ( not ( = ?auto_372215 ?auto_372217 ) ) ( not ( = ?auto_372215 ?auto_372218 ) ) ( not ( = ?auto_372215 ?auto_372219 ) ) ( not ( = ?auto_372215 ?auto_372220 ) ) ( not ( = ?auto_372215 ?auto_372221 ) ) ( not ( = ?auto_372215 ?auto_372222 ) ) ( not ( = ?auto_372215 ?auto_372223 ) ) ( not ( = ?auto_372215 ?auto_372224 ) ) ( not ( = ?auto_372216 ?auto_372217 ) ) ( not ( = ?auto_372216 ?auto_372218 ) ) ( not ( = ?auto_372216 ?auto_372219 ) ) ( not ( = ?auto_372216 ?auto_372220 ) ) ( not ( = ?auto_372216 ?auto_372221 ) ) ( not ( = ?auto_372216 ?auto_372222 ) ) ( not ( = ?auto_372216 ?auto_372223 ) ) ( not ( = ?auto_372216 ?auto_372224 ) ) ( not ( = ?auto_372217 ?auto_372218 ) ) ( not ( = ?auto_372217 ?auto_372219 ) ) ( not ( = ?auto_372217 ?auto_372220 ) ) ( not ( = ?auto_372217 ?auto_372221 ) ) ( not ( = ?auto_372217 ?auto_372222 ) ) ( not ( = ?auto_372217 ?auto_372223 ) ) ( not ( = ?auto_372217 ?auto_372224 ) ) ( not ( = ?auto_372218 ?auto_372219 ) ) ( not ( = ?auto_372218 ?auto_372220 ) ) ( not ( = ?auto_372218 ?auto_372221 ) ) ( not ( = ?auto_372218 ?auto_372222 ) ) ( not ( = ?auto_372218 ?auto_372223 ) ) ( not ( = ?auto_372218 ?auto_372224 ) ) ( not ( = ?auto_372219 ?auto_372220 ) ) ( not ( = ?auto_372219 ?auto_372221 ) ) ( not ( = ?auto_372219 ?auto_372222 ) ) ( not ( = ?auto_372219 ?auto_372223 ) ) ( not ( = ?auto_372219 ?auto_372224 ) ) ( not ( = ?auto_372220 ?auto_372221 ) ) ( not ( = ?auto_372220 ?auto_372222 ) ) ( not ( = ?auto_372220 ?auto_372223 ) ) ( not ( = ?auto_372220 ?auto_372224 ) ) ( not ( = ?auto_372221 ?auto_372222 ) ) ( not ( = ?auto_372221 ?auto_372223 ) ) ( not ( = ?auto_372221 ?auto_372224 ) ) ( not ( = ?auto_372222 ?auto_372223 ) ) ( not ( = ?auto_372222 ?auto_372224 ) ) ( not ( = ?auto_372223 ?auto_372224 ) ) ( ON ?auto_372222 ?auto_372223 ) ( ON ?auto_372221 ?auto_372222 ) ( ON ?auto_372220 ?auto_372221 ) ( ON ?auto_372219 ?auto_372220 ) ( ON ?auto_372218 ?auto_372219 ) ( ON ?auto_372217 ?auto_372218 ) ( CLEAR ?auto_372215 ) ( ON ?auto_372216 ?auto_372217 ) ( CLEAR ?auto_372216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_372215 ?auto_372216 )
      ( MAKE-9PILE ?auto_372215 ?auto_372216 ?auto_372217 ?auto_372218 ?auto_372219 ?auto_372220 ?auto_372221 ?auto_372222 ?auto_372223 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372253 - BLOCK
      ?auto_372254 - BLOCK
      ?auto_372255 - BLOCK
      ?auto_372256 - BLOCK
      ?auto_372257 - BLOCK
      ?auto_372258 - BLOCK
      ?auto_372259 - BLOCK
      ?auto_372260 - BLOCK
      ?auto_372261 - BLOCK
    )
    :vars
    (
      ?auto_372262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372261 ?auto_372262 ) ( not ( = ?auto_372253 ?auto_372254 ) ) ( not ( = ?auto_372253 ?auto_372255 ) ) ( not ( = ?auto_372253 ?auto_372256 ) ) ( not ( = ?auto_372253 ?auto_372257 ) ) ( not ( = ?auto_372253 ?auto_372258 ) ) ( not ( = ?auto_372253 ?auto_372259 ) ) ( not ( = ?auto_372253 ?auto_372260 ) ) ( not ( = ?auto_372253 ?auto_372261 ) ) ( not ( = ?auto_372253 ?auto_372262 ) ) ( not ( = ?auto_372254 ?auto_372255 ) ) ( not ( = ?auto_372254 ?auto_372256 ) ) ( not ( = ?auto_372254 ?auto_372257 ) ) ( not ( = ?auto_372254 ?auto_372258 ) ) ( not ( = ?auto_372254 ?auto_372259 ) ) ( not ( = ?auto_372254 ?auto_372260 ) ) ( not ( = ?auto_372254 ?auto_372261 ) ) ( not ( = ?auto_372254 ?auto_372262 ) ) ( not ( = ?auto_372255 ?auto_372256 ) ) ( not ( = ?auto_372255 ?auto_372257 ) ) ( not ( = ?auto_372255 ?auto_372258 ) ) ( not ( = ?auto_372255 ?auto_372259 ) ) ( not ( = ?auto_372255 ?auto_372260 ) ) ( not ( = ?auto_372255 ?auto_372261 ) ) ( not ( = ?auto_372255 ?auto_372262 ) ) ( not ( = ?auto_372256 ?auto_372257 ) ) ( not ( = ?auto_372256 ?auto_372258 ) ) ( not ( = ?auto_372256 ?auto_372259 ) ) ( not ( = ?auto_372256 ?auto_372260 ) ) ( not ( = ?auto_372256 ?auto_372261 ) ) ( not ( = ?auto_372256 ?auto_372262 ) ) ( not ( = ?auto_372257 ?auto_372258 ) ) ( not ( = ?auto_372257 ?auto_372259 ) ) ( not ( = ?auto_372257 ?auto_372260 ) ) ( not ( = ?auto_372257 ?auto_372261 ) ) ( not ( = ?auto_372257 ?auto_372262 ) ) ( not ( = ?auto_372258 ?auto_372259 ) ) ( not ( = ?auto_372258 ?auto_372260 ) ) ( not ( = ?auto_372258 ?auto_372261 ) ) ( not ( = ?auto_372258 ?auto_372262 ) ) ( not ( = ?auto_372259 ?auto_372260 ) ) ( not ( = ?auto_372259 ?auto_372261 ) ) ( not ( = ?auto_372259 ?auto_372262 ) ) ( not ( = ?auto_372260 ?auto_372261 ) ) ( not ( = ?auto_372260 ?auto_372262 ) ) ( not ( = ?auto_372261 ?auto_372262 ) ) ( ON ?auto_372260 ?auto_372261 ) ( ON ?auto_372259 ?auto_372260 ) ( ON ?auto_372258 ?auto_372259 ) ( ON ?auto_372257 ?auto_372258 ) ( ON ?auto_372256 ?auto_372257 ) ( ON ?auto_372255 ?auto_372256 ) ( ON ?auto_372254 ?auto_372255 ) ( ON ?auto_372253 ?auto_372254 ) ( CLEAR ?auto_372253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_372253 )
      ( MAKE-9PILE ?auto_372253 ?auto_372254 ?auto_372255 ?auto_372256 ?auto_372257 ?auto_372258 ?auto_372259 ?auto_372260 ?auto_372261 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372292 - BLOCK
      ?auto_372293 - BLOCK
      ?auto_372294 - BLOCK
      ?auto_372295 - BLOCK
      ?auto_372296 - BLOCK
      ?auto_372297 - BLOCK
      ?auto_372298 - BLOCK
      ?auto_372299 - BLOCK
      ?auto_372300 - BLOCK
      ?auto_372301 - BLOCK
    )
    :vars
    (
      ?auto_372302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_372300 ) ( ON ?auto_372301 ?auto_372302 ) ( CLEAR ?auto_372301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_372292 ) ( ON ?auto_372293 ?auto_372292 ) ( ON ?auto_372294 ?auto_372293 ) ( ON ?auto_372295 ?auto_372294 ) ( ON ?auto_372296 ?auto_372295 ) ( ON ?auto_372297 ?auto_372296 ) ( ON ?auto_372298 ?auto_372297 ) ( ON ?auto_372299 ?auto_372298 ) ( ON ?auto_372300 ?auto_372299 ) ( not ( = ?auto_372292 ?auto_372293 ) ) ( not ( = ?auto_372292 ?auto_372294 ) ) ( not ( = ?auto_372292 ?auto_372295 ) ) ( not ( = ?auto_372292 ?auto_372296 ) ) ( not ( = ?auto_372292 ?auto_372297 ) ) ( not ( = ?auto_372292 ?auto_372298 ) ) ( not ( = ?auto_372292 ?auto_372299 ) ) ( not ( = ?auto_372292 ?auto_372300 ) ) ( not ( = ?auto_372292 ?auto_372301 ) ) ( not ( = ?auto_372292 ?auto_372302 ) ) ( not ( = ?auto_372293 ?auto_372294 ) ) ( not ( = ?auto_372293 ?auto_372295 ) ) ( not ( = ?auto_372293 ?auto_372296 ) ) ( not ( = ?auto_372293 ?auto_372297 ) ) ( not ( = ?auto_372293 ?auto_372298 ) ) ( not ( = ?auto_372293 ?auto_372299 ) ) ( not ( = ?auto_372293 ?auto_372300 ) ) ( not ( = ?auto_372293 ?auto_372301 ) ) ( not ( = ?auto_372293 ?auto_372302 ) ) ( not ( = ?auto_372294 ?auto_372295 ) ) ( not ( = ?auto_372294 ?auto_372296 ) ) ( not ( = ?auto_372294 ?auto_372297 ) ) ( not ( = ?auto_372294 ?auto_372298 ) ) ( not ( = ?auto_372294 ?auto_372299 ) ) ( not ( = ?auto_372294 ?auto_372300 ) ) ( not ( = ?auto_372294 ?auto_372301 ) ) ( not ( = ?auto_372294 ?auto_372302 ) ) ( not ( = ?auto_372295 ?auto_372296 ) ) ( not ( = ?auto_372295 ?auto_372297 ) ) ( not ( = ?auto_372295 ?auto_372298 ) ) ( not ( = ?auto_372295 ?auto_372299 ) ) ( not ( = ?auto_372295 ?auto_372300 ) ) ( not ( = ?auto_372295 ?auto_372301 ) ) ( not ( = ?auto_372295 ?auto_372302 ) ) ( not ( = ?auto_372296 ?auto_372297 ) ) ( not ( = ?auto_372296 ?auto_372298 ) ) ( not ( = ?auto_372296 ?auto_372299 ) ) ( not ( = ?auto_372296 ?auto_372300 ) ) ( not ( = ?auto_372296 ?auto_372301 ) ) ( not ( = ?auto_372296 ?auto_372302 ) ) ( not ( = ?auto_372297 ?auto_372298 ) ) ( not ( = ?auto_372297 ?auto_372299 ) ) ( not ( = ?auto_372297 ?auto_372300 ) ) ( not ( = ?auto_372297 ?auto_372301 ) ) ( not ( = ?auto_372297 ?auto_372302 ) ) ( not ( = ?auto_372298 ?auto_372299 ) ) ( not ( = ?auto_372298 ?auto_372300 ) ) ( not ( = ?auto_372298 ?auto_372301 ) ) ( not ( = ?auto_372298 ?auto_372302 ) ) ( not ( = ?auto_372299 ?auto_372300 ) ) ( not ( = ?auto_372299 ?auto_372301 ) ) ( not ( = ?auto_372299 ?auto_372302 ) ) ( not ( = ?auto_372300 ?auto_372301 ) ) ( not ( = ?auto_372300 ?auto_372302 ) ) ( not ( = ?auto_372301 ?auto_372302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_372301 ?auto_372302 )
      ( !STACK ?auto_372301 ?auto_372300 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372334 - BLOCK
      ?auto_372335 - BLOCK
      ?auto_372336 - BLOCK
      ?auto_372337 - BLOCK
      ?auto_372338 - BLOCK
      ?auto_372339 - BLOCK
      ?auto_372340 - BLOCK
      ?auto_372341 - BLOCK
      ?auto_372342 - BLOCK
      ?auto_372343 - BLOCK
    )
    :vars
    (
      ?auto_372344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372343 ?auto_372344 ) ( ON-TABLE ?auto_372334 ) ( ON ?auto_372335 ?auto_372334 ) ( ON ?auto_372336 ?auto_372335 ) ( ON ?auto_372337 ?auto_372336 ) ( ON ?auto_372338 ?auto_372337 ) ( ON ?auto_372339 ?auto_372338 ) ( ON ?auto_372340 ?auto_372339 ) ( ON ?auto_372341 ?auto_372340 ) ( not ( = ?auto_372334 ?auto_372335 ) ) ( not ( = ?auto_372334 ?auto_372336 ) ) ( not ( = ?auto_372334 ?auto_372337 ) ) ( not ( = ?auto_372334 ?auto_372338 ) ) ( not ( = ?auto_372334 ?auto_372339 ) ) ( not ( = ?auto_372334 ?auto_372340 ) ) ( not ( = ?auto_372334 ?auto_372341 ) ) ( not ( = ?auto_372334 ?auto_372342 ) ) ( not ( = ?auto_372334 ?auto_372343 ) ) ( not ( = ?auto_372334 ?auto_372344 ) ) ( not ( = ?auto_372335 ?auto_372336 ) ) ( not ( = ?auto_372335 ?auto_372337 ) ) ( not ( = ?auto_372335 ?auto_372338 ) ) ( not ( = ?auto_372335 ?auto_372339 ) ) ( not ( = ?auto_372335 ?auto_372340 ) ) ( not ( = ?auto_372335 ?auto_372341 ) ) ( not ( = ?auto_372335 ?auto_372342 ) ) ( not ( = ?auto_372335 ?auto_372343 ) ) ( not ( = ?auto_372335 ?auto_372344 ) ) ( not ( = ?auto_372336 ?auto_372337 ) ) ( not ( = ?auto_372336 ?auto_372338 ) ) ( not ( = ?auto_372336 ?auto_372339 ) ) ( not ( = ?auto_372336 ?auto_372340 ) ) ( not ( = ?auto_372336 ?auto_372341 ) ) ( not ( = ?auto_372336 ?auto_372342 ) ) ( not ( = ?auto_372336 ?auto_372343 ) ) ( not ( = ?auto_372336 ?auto_372344 ) ) ( not ( = ?auto_372337 ?auto_372338 ) ) ( not ( = ?auto_372337 ?auto_372339 ) ) ( not ( = ?auto_372337 ?auto_372340 ) ) ( not ( = ?auto_372337 ?auto_372341 ) ) ( not ( = ?auto_372337 ?auto_372342 ) ) ( not ( = ?auto_372337 ?auto_372343 ) ) ( not ( = ?auto_372337 ?auto_372344 ) ) ( not ( = ?auto_372338 ?auto_372339 ) ) ( not ( = ?auto_372338 ?auto_372340 ) ) ( not ( = ?auto_372338 ?auto_372341 ) ) ( not ( = ?auto_372338 ?auto_372342 ) ) ( not ( = ?auto_372338 ?auto_372343 ) ) ( not ( = ?auto_372338 ?auto_372344 ) ) ( not ( = ?auto_372339 ?auto_372340 ) ) ( not ( = ?auto_372339 ?auto_372341 ) ) ( not ( = ?auto_372339 ?auto_372342 ) ) ( not ( = ?auto_372339 ?auto_372343 ) ) ( not ( = ?auto_372339 ?auto_372344 ) ) ( not ( = ?auto_372340 ?auto_372341 ) ) ( not ( = ?auto_372340 ?auto_372342 ) ) ( not ( = ?auto_372340 ?auto_372343 ) ) ( not ( = ?auto_372340 ?auto_372344 ) ) ( not ( = ?auto_372341 ?auto_372342 ) ) ( not ( = ?auto_372341 ?auto_372343 ) ) ( not ( = ?auto_372341 ?auto_372344 ) ) ( not ( = ?auto_372342 ?auto_372343 ) ) ( not ( = ?auto_372342 ?auto_372344 ) ) ( not ( = ?auto_372343 ?auto_372344 ) ) ( CLEAR ?auto_372341 ) ( ON ?auto_372342 ?auto_372343 ) ( CLEAR ?auto_372342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_372334 ?auto_372335 ?auto_372336 ?auto_372337 ?auto_372338 ?auto_372339 ?auto_372340 ?auto_372341 ?auto_372342 )
      ( MAKE-10PILE ?auto_372334 ?auto_372335 ?auto_372336 ?auto_372337 ?auto_372338 ?auto_372339 ?auto_372340 ?auto_372341 ?auto_372342 ?auto_372343 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372376 - BLOCK
      ?auto_372377 - BLOCK
      ?auto_372378 - BLOCK
      ?auto_372379 - BLOCK
      ?auto_372380 - BLOCK
      ?auto_372381 - BLOCK
      ?auto_372382 - BLOCK
      ?auto_372383 - BLOCK
      ?auto_372384 - BLOCK
      ?auto_372385 - BLOCK
    )
    :vars
    (
      ?auto_372386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372385 ?auto_372386 ) ( ON-TABLE ?auto_372376 ) ( ON ?auto_372377 ?auto_372376 ) ( ON ?auto_372378 ?auto_372377 ) ( ON ?auto_372379 ?auto_372378 ) ( ON ?auto_372380 ?auto_372379 ) ( ON ?auto_372381 ?auto_372380 ) ( ON ?auto_372382 ?auto_372381 ) ( not ( = ?auto_372376 ?auto_372377 ) ) ( not ( = ?auto_372376 ?auto_372378 ) ) ( not ( = ?auto_372376 ?auto_372379 ) ) ( not ( = ?auto_372376 ?auto_372380 ) ) ( not ( = ?auto_372376 ?auto_372381 ) ) ( not ( = ?auto_372376 ?auto_372382 ) ) ( not ( = ?auto_372376 ?auto_372383 ) ) ( not ( = ?auto_372376 ?auto_372384 ) ) ( not ( = ?auto_372376 ?auto_372385 ) ) ( not ( = ?auto_372376 ?auto_372386 ) ) ( not ( = ?auto_372377 ?auto_372378 ) ) ( not ( = ?auto_372377 ?auto_372379 ) ) ( not ( = ?auto_372377 ?auto_372380 ) ) ( not ( = ?auto_372377 ?auto_372381 ) ) ( not ( = ?auto_372377 ?auto_372382 ) ) ( not ( = ?auto_372377 ?auto_372383 ) ) ( not ( = ?auto_372377 ?auto_372384 ) ) ( not ( = ?auto_372377 ?auto_372385 ) ) ( not ( = ?auto_372377 ?auto_372386 ) ) ( not ( = ?auto_372378 ?auto_372379 ) ) ( not ( = ?auto_372378 ?auto_372380 ) ) ( not ( = ?auto_372378 ?auto_372381 ) ) ( not ( = ?auto_372378 ?auto_372382 ) ) ( not ( = ?auto_372378 ?auto_372383 ) ) ( not ( = ?auto_372378 ?auto_372384 ) ) ( not ( = ?auto_372378 ?auto_372385 ) ) ( not ( = ?auto_372378 ?auto_372386 ) ) ( not ( = ?auto_372379 ?auto_372380 ) ) ( not ( = ?auto_372379 ?auto_372381 ) ) ( not ( = ?auto_372379 ?auto_372382 ) ) ( not ( = ?auto_372379 ?auto_372383 ) ) ( not ( = ?auto_372379 ?auto_372384 ) ) ( not ( = ?auto_372379 ?auto_372385 ) ) ( not ( = ?auto_372379 ?auto_372386 ) ) ( not ( = ?auto_372380 ?auto_372381 ) ) ( not ( = ?auto_372380 ?auto_372382 ) ) ( not ( = ?auto_372380 ?auto_372383 ) ) ( not ( = ?auto_372380 ?auto_372384 ) ) ( not ( = ?auto_372380 ?auto_372385 ) ) ( not ( = ?auto_372380 ?auto_372386 ) ) ( not ( = ?auto_372381 ?auto_372382 ) ) ( not ( = ?auto_372381 ?auto_372383 ) ) ( not ( = ?auto_372381 ?auto_372384 ) ) ( not ( = ?auto_372381 ?auto_372385 ) ) ( not ( = ?auto_372381 ?auto_372386 ) ) ( not ( = ?auto_372382 ?auto_372383 ) ) ( not ( = ?auto_372382 ?auto_372384 ) ) ( not ( = ?auto_372382 ?auto_372385 ) ) ( not ( = ?auto_372382 ?auto_372386 ) ) ( not ( = ?auto_372383 ?auto_372384 ) ) ( not ( = ?auto_372383 ?auto_372385 ) ) ( not ( = ?auto_372383 ?auto_372386 ) ) ( not ( = ?auto_372384 ?auto_372385 ) ) ( not ( = ?auto_372384 ?auto_372386 ) ) ( not ( = ?auto_372385 ?auto_372386 ) ) ( ON ?auto_372384 ?auto_372385 ) ( CLEAR ?auto_372382 ) ( ON ?auto_372383 ?auto_372384 ) ( CLEAR ?auto_372383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_372376 ?auto_372377 ?auto_372378 ?auto_372379 ?auto_372380 ?auto_372381 ?auto_372382 ?auto_372383 )
      ( MAKE-10PILE ?auto_372376 ?auto_372377 ?auto_372378 ?auto_372379 ?auto_372380 ?auto_372381 ?auto_372382 ?auto_372383 ?auto_372384 ?auto_372385 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372418 - BLOCK
      ?auto_372419 - BLOCK
      ?auto_372420 - BLOCK
      ?auto_372421 - BLOCK
      ?auto_372422 - BLOCK
      ?auto_372423 - BLOCK
      ?auto_372424 - BLOCK
      ?auto_372425 - BLOCK
      ?auto_372426 - BLOCK
      ?auto_372427 - BLOCK
    )
    :vars
    (
      ?auto_372428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372427 ?auto_372428 ) ( ON-TABLE ?auto_372418 ) ( ON ?auto_372419 ?auto_372418 ) ( ON ?auto_372420 ?auto_372419 ) ( ON ?auto_372421 ?auto_372420 ) ( ON ?auto_372422 ?auto_372421 ) ( ON ?auto_372423 ?auto_372422 ) ( not ( = ?auto_372418 ?auto_372419 ) ) ( not ( = ?auto_372418 ?auto_372420 ) ) ( not ( = ?auto_372418 ?auto_372421 ) ) ( not ( = ?auto_372418 ?auto_372422 ) ) ( not ( = ?auto_372418 ?auto_372423 ) ) ( not ( = ?auto_372418 ?auto_372424 ) ) ( not ( = ?auto_372418 ?auto_372425 ) ) ( not ( = ?auto_372418 ?auto_372426 ) ) ( not ( = ?auto_372418 ?auto_372427 ) ) ( not ( = ?auto_372418 ?auto_372428 ) ) ( not ( = ?auto_372419 ?auto_372420 ) ) ( not ( = ?auto_372419 ?auto_372421 ) ) ( not ( = ?auto_372419 ?auto_372422 ) ) ( not ( = ?auto_372419 ?auto_372423 ) ) ( not ( = ?auto_372419 ?auto_372424 ) ) ( not ( = ?auto_372419 ?auto_372425 ) ) ( not ( = ?auto_372419 ?auto_372426 ) ) ( not ( = ?auto_372419 ?auto_372427 ) ) ( not ( = ?auto_372419 ?auto_372428 ) ) ( not ( = ?auto_372420 ?auto_372421 ) ) ( not ( = ?auto_372420 ?auto_372422 ) ) ( not ( = ?auto_372420 ?auto_372423 ) ) ( not ( = ?auto_372420 ?auto_372424 ) ) ( not ( = ?auto_372420 ?auto_372425 ) ) ( not ( = ?auto_372420 ?auto_372426 ) ) ( not ( = ?auto_372420 ?auto_372427 ) ) ( not ( = ?auto_372420 ?auto_372428 ) ) ( not ( = ?auto_372421 ?auto_372422 ) ) ( not ( = ?auto_372421 ?auto_372423 ) ) ( not ( = ?auto_372421 ?auto_372424 ) ) ( not ( = ?auto_372421 ?auto_372425 ) ) ( not ( = ?auto_372421 ?auto_372426 ) ) ( not ( = ?auto_372421 ?auto_372427 ) ) ( not ( = ?auto_372421 ?auto_372428 ) ) ( not ( = ?auto_372422 ?auto_372423 ) ) ( not ( = ?auto_372422 ?auto_372424 ) ) ( not ( = ?auto_372422 ?auto_372425 ) ) ( not ( = ?auto_372422 ?auto_372426 ) ) ( not ( = ?auto_372422 ?auto_372427 ) ) ( not ( = ?auto_372422 ?auto_372428 ) ) ( not ( = ?auto_372423 ?auto_372424 ) ) ( not ( = ?auto_372423 ?auto_372425 ) ) ( not ( = ?auto_372423 ?auto_372426 ) ) ( not ( = ?auto_372423 ?auto_372427 ) ) ( not ( = ?auto_372423 ?auto_372428 ) ) ( not ( = ?auto_372424 ?auto_372425 ) ) ( not ( = ?auto_372424 ?auto_372426 ) ) ( not ( = ?auto_372424 ?auto_372427 ) ) ( not ( = ?auto_372424 ?auto_372428 ) ) ( not ( = ?auto_372425 ?auto_372426 ) ) ( not ( = ?auto_372425 ?auto_372427 ) ) ( not ( = ?auto_372425 ?auto_372428 ) ) ( not ( = ?auto_372426 ?auto_372427 ) ) ( not ( = ?auto_372426 ?auto_372428 ) ) ( not ( = ?auto_372427 ?auto_372428 ) ) ( ON ?auto_372426 ?auto_372427 ) ( ON ?auto_372425 ?auto_372426 ) ( CLEAR ?auto_372423 ) ( ON ?auto_372424 ?auto_372425 ) ( CLEAR ?auto_372424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_372418 ?auto_372419 ?auto_372420 ?auto_372421 ?auto_372422 ?auto_372423 ?auto_372424 )
      ( MAKE-10PILE ?auto_372418 ?auto_372419 ?auto_372420 ?auto_372421 ?auto_372422 ?auto_372423 ?auto_372424 ?auto_372425 ?auto_372426 ?auto_372427 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372460 - BLOCK
      ?auto_372461 - BLOCK
      ?auto_372462 - BLOCK
      ?auto_372463 - BLOCK
      ?auto_372464 - BLOCK
      ?auto_372465 - BLOCK
      ?auto_372466 - BLOCK
      ?auto_372467 - BLOCK
      ?auto_372468 - BLOCK
      ?auto_372469 - BLOCK
    )
    :vars
    (
      ?auto_372470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372469 ?auto_372470 ) ( ON-TABLE ?auto_372460 ) ( ON ?auto_372461 ?auto_372460 ) ( ON ?auto_372462 ?auto_372461 ) ( ON ?auto_372463 ?auto_372462 ) ( ON ?auto_372464 ?auto_372463 ) ( not ( = ?auto_372460 ?auto_372461 ) ) ( not ( = ?auto_372460 ?auto_372462 ) ) ( not ( = ?auto_372460 ?auto_372463 ) ) ( not ( = ?auto_372460 ?auto_372464 ) ) ( not ( = ?auto_372460 ?auto_372465 ) ) ( not ( = ?auto_372460 ?auto_372466 ) ) ( not ( = ?auto_372460 ?auto_372467 ) ) ( not ( = ?auto_372460 ?auto_372468 ) ) ( not ( = ?auto_372460 ?auto_372469 ) ) ( not ( = ?auto_372460 ?auto_372470 ) ) ( not ( = ?auto_372461 ?auto_372462 ) ) ( not ( = ?auto_372461 ?auto_372463 ) ) ( not ( = ?auto_372461 ?auto_372464 ) ) ( not ( = ?auto_372461 ?auto_372465 ) ) ( not ( = ?auto_372461 ?auto_372466 ) ) ( not ( = ?auto_372461 ?auto_372467 ) ) ( not ( = ?auto_372461 ?auto_372468 ) ) ( not ( = ?auto_372461 ?auto_372469 ) ) ( not ( = ?auto_372461 ?auto_372470 ) ) ( not ( = ?auto_372462 ?auto_372463 ) ) ( not ( = ?auto_372462 ?auto_372464 ) ) ( not ( = ?auto_372462 ?auto_372465 ) ) ( not ( = ?auto_372462 ?auto_372466 ) ) ( not ( = ?auto_372462 ?auto_372467 ) ) ( not ( = ?auto_372462 ?auto_372468 ) ) ( not ( = ?auto_372462 ?auto_372469 ) ) ( not ( = ?auto_372462 ?auto_372470 ) ) ( not ( = ?auto_372463 ?auto_372464 ) ) ( not ( = ?auto_372463 ?auto_372465 ) ) ( not ( = ?auto_372463 ?auto_372466 ) ) ( not ( = ?auto_372463 ?auto_372467 ) ) ( not ( = ?auto_372463 ?auto_372468 ) ) ( not ( = ?auto_372463 ?auto_372469 ) ) ( not ( = ?auto_372463 ?auto_372470 ) ) ( not ( = ?auto_372464 ?auto_372465 ) ) ( not ( = ?auto_372464 ?auto_372466 ) ) ( not ( = ?auto_372464 ?auto_372467 ) ) ( not ( = ?auto_372464 ?auto_372468 ) ) ( not ( = ?auto_372464 ?auto_372469 ) ) ( not ( = ?auto_372464 ?auto_372470 ) ) ( not ( = ?auto_372465 ?auto_372466 ) ) ( not ( = ?auto_372465 ?auto_372467 ) ) ( not ( = ?auto_372465 ?auto_372468 ) ) ( not ( = ?auto_372465 ?auto_372469 ) ) ( not ( = ?auto_372465 ?auto_372470 ) ) ( not ( = ?auto_372466 ?auto_372467 ) ) ( not ( = ?auto_372466 ?auto_372468 ) ) ( not ( = ?auto_372466 ?auto_372469 ) ) ( not ( = ?auto_372466 ?auto_372470 ) ) ( not ( = ?auto_372467 ?auto_372468 ) ) ( not ( = ?auto_372467 ?auto_372469 ) ) ( not ( = ?auto_372467 ?auto_372470 ) ) ( not ( = ?auto_372468 ?auto_372469 ) ) ( not ( = ?auto_372468 ?auto_372470 ) ) ( not ( = ?auto_372469 ?auto_372470 ) ) ( ON ?auto_372468 ?auto_372469 ) ( ON ?auto_372467 ?auto_372468 ) ( ON ?auto_372466 ?auto_372467 ) ( CLEAR ?auto_372464 ) ( ON ?auto_372465 ?auto_372466 ) ( CLEAR ?auto_372465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_372460 ?auto_372461 ?auto_372462 ?auto_372463 ?auto_372464 ?auto_372465 )
      ( MAKE-10PILE ?auto_372460 ?auto_372461 ?auto_372462 ?auto_372463 ?auto_372464 ?auto_372465 ?auto_372466 ?auto_372467 ?auto_372468 ?auto_372469 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372502 - BLOCK
      ?auto_372503 - BLOCK
      ?auto_372504 - BLOCK
      ?auto_372505 - BLOCK
      ?auto_372506 - BLOCK
      ?auto_372507 - BLOCK
      ?auto_372508 - BLOCK
      ?auto_372509 - BLOCK
      ?auto_372510 - BLOCK
      ?auto_372511 - BLOCK
    )
    :vars
    (
      ?auto_372512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372511 ?auto_372512 ) ( ON-TABLE ?auto_372502 ) ( ON ?auto_372503 ?auto_372502 ) ( ON ?auto_372504 ?auto_372503 ) ( ON ?auto_372505 ?auto_372504 ) ( not ( = ?auto_372502 ?auto_372503 ) ) ( not ( = ?auto_372502 ?auto_372504 ) ) ( not ( = ?auto_372502 ?auto_372505 ) ) ( not ( = ?auto_372502 ?auto_372506 ) ) ( not ( = ?auto_372502 ?auto_372507 ) ) ( not ( = ?auto_372502 ?auto_372508 ) ) ( not ( = ?auto_372502 ?auto_372509 ) ) ( not ( = ?auto_372502 ?auto_372510 ) ) ( not ( = ?auto_372502 ?auto_372511 ) ) ( not ( = ?auto_372502 ?auto_372512 ) ) ( not ( = ?auto_372503 ?auto_372504 ) ) ( not ( = ?auto_372503 ?auto_372505 ) ) ( not ( = ?auto_372503 ?auto_372506 ) ) ( not ( = ?auto_372503 ?auto_372507 ) ) ( not ( = ?auto_372503 ?auto_372508 ) ) ( not ( = ?auto_372503 ?auto_372509 ) ) ( not ( = ?auto_372503 ?auto_372510 ) ) ( not ( = ?auto_372503 ?auto_372511 ) ) ( not ( = ?auto_372503 ?auto_372512 ) ) ( not ( = ?auto_372504 ?auto_372505 ) ) ( not ( = ?auto_372504 ?auto_372506 ) ) ( not ( = ?auto_372504 ?auto_372507 ) ) ( not ( = ?auto_372504 ?auto_372508 ) ) ( not ( = ?auto_372504 ?auto_372509 ) ) ( not ( = ?auto_372504 ?auto_372510 ) ) ( not ( = ?auto_372504 ?auto_372511 ) ) ( not ( = ?auto_372504 ?auto_372512 ) ) ( not ( = ?auto_372505 ?auto_372506 ) ) ( not ( = ?auto_372505 ?auto_372507 ) ) ( not ( = ?auto_372505 ?auto_372508 ) ) ( not ( = ?auto_372505 ?auto_372509 ) ) ( not ( = ?auto_372505 ?auto_372510 ) ) ( not ( = ?auto_372505 ?auto_372511 ) ) ( not ( = ?auto_372505 ?auto_372512 ) ) ( not ( = ?auto_372506 ?auto_372507 ) ) ( not ( = ?auto_372506 ?auto_372508 ) ) ( not ( = ?auto_372506 ?auto_372509 ) ) ( not ( = ?auto_372506 ?auto_372510 ) ) ( not ( = ?auto_372506 ?auto_372511 ) ) ( not ( = ?auto_372506 ?auto_372512 ) ) ( not ( = ?auto_372507 ?auto_372508 ) ) ( not ( = ?auto_372507 ?auto_372509 ) ) ( not ( = ?auto_372507 ?auto_372510 ) ) ( not ( = ?auto_372507 ?auto_372511 ) ) ( not ( = ?auto_372507 ?auto_372512 ) ) ( not ( = ?auto_372508 ?auto_372509 ) ) ( not ( = ?auto_372508 ?auto_372510 ) ) ( not ( = ?auto_372508 ?auto_372511 ) ) ( not ( = ?auto_372508 ?auto_372512 ) ) ( not ( = ?auto_372509 ?auto_372510 ) ) ( not ( = ?auto_372509 ?auto_372511 ) ) ( not ( = ?auto_372509 ?auto_372512 ) ) ( not ( = ?auto_372510 ?auto_372511 ) ) ( not ( = ?auto_372510 ?auto_372512 ) ) ( not ( = ?auto_372511 ?auto_372512 ) ) ( ON ?auto_372510 ?auto_372511 ) ( ON ?auto_372509 ?auto_372510 ) ( ON ?auto_372508 ?auto_372509 ) ( ON ?auto_372507 ?auto_372508 ) ( CLEAR ?auto_372505 ) ( ON ?auto_372506 ?auto_372507 ) ( CLEAR ?auto_372506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_372502 ?auto_372503 ?auto_372504 ?auto_372505 ?auto_372506 )
      ( MAKE-10PILE ?auto_372502 ?auto_372503 ?auto_372504 ?auto_372505 ?auto_372506 ?auto_372507 ?auto_372508 ?auto_372509 ?auto_372510 ?auto_372511 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372544 - BLOCK
      ?auto_372545 - BLOCK
      ?auto_372546 - BLOCK
      ?auto_372547 - BLOCK
      ?auto_372548 - BLOCK
      ?auto_372549 - BLOCK
      ?auto_372550 - BLOCK
      ?auto_372551 - BLOCK
      ?auto_372552 - BLOCK
      ?auto_372553 - BLOCK
    )
    :vars
    (
      ?auto_372554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372553 ?auto_372554 ) ( ON-TABLE ?auto_372544 ) ( ON ?auto_372545 ?auto_372544 ) ( ON ?auto_372546 ?auto_372545 ) ( not ( = ?auto_372544 ?auto_372545 ) ) ( not ( = ?auto_372544 ?auto_372546 ) ) ( not ( = ?auto_372544 ?auto_372547 ) ) ( not ( = ?auto_372544 ?auto_372548 ) ) ( not ( = ?auto_372544 ?auto_372549 ) ) ( not ( = ?auto_372544 ?auto_372550 ) ) ( not ( = ?auto_372544 ?auto_372551 ) ) ( not ( = ?auto_372544 ?auto_372552 ) ) ( not ( = ?auto_372544 ?auto_372553 ) ) ( not ( = ?auto_372544 ?auto_372554 ) ) ( not ( = ?auto_372545 ?auto_372546 ) ) ( not ( = ?auto_372545 ?auto_372547 ) ) ( not ( = ?auto_372545 ?auto_372548 ) ) ( not ( = ?auto_372545 ?auto_372549 ) ) ( not ( = ?auto_372545 ?auto_372550 ) ) ( not ( = ?auto_372545 ?auto_372551 ) ) ( not ( = ?auto_372545 ?auto_372552 ) ) ( not ( = ?auto_372545 ?auto_372553 ) ) ( not ( = ?auto_372545 ?auto_372554 ) ) ( not ( = ?auto_372546 ?auto_372547 ) ) ( not ( = ?auto_372546 ?auto_372548 ) ) ( not ( = ?auto_372546 ?auto_372549 ) ) ( not ( = ?auto_372546 ?auto_372550 ) ) ( not ( = ?auto_372546 ?auto_372551 ) ) ( not ( = ?auto_372546 ?auto_372552 ) ) ( not ( = ?auto_372546 ?auto_372553 ) ) ( not ( = ?auto_372546 ?auto_372554 ) ) ( not ( = ?auto_372547 ?auto_372548 ) ) ( not ( = ?auto_372547 ?auto_372549 ) ) ( not ( = ?auto_372547 ?auto_372550 ) ) ( not ( = ?auto_372547 ?auto_372551 ) ) ( not ( = ?auto_372547 ?auto_372552 ) ) ( not ( = ?auto_372547 ?auto_372553 ) ) ( not ( = ?auto_372547 ?auto_372554 ) ) ( not ( = ?auto_372548 ?auto_372549 ) ) ( not ( = ?auto_372548 ?auto_372550 ) ) ( not ( = ?auto_372548 ?auto_372551 ) ) ( not ( = ?auto_372548 ?auto_372552 ) ) ( not ( = ?auto_372548 ?auto_372553 ) ) ( not ( = ?auto_372548 ?auto_372554 ) ) ( not ( = ?auto_372549 ?auto_372550 ) ) ( not ( = ?auto_372549 ?auto_372551 ) ) ( not ( = ?auto_372549 ?auto_372552 ) ) ( not ( = ?auto_372549 ?auto_372553 ) ) ( not ( = ?auto_372549 ?auto_372554 ) ) ( not ( = ?auto_372550 ?auto_372551 ) ) ( not ( = ?auto_372550 ?auto_372552 ) ) ( not ( = ?auto_372550 ?auto_372553 ) ) ( not ( = ?auto_372550 ?auto_372554 ) ) ( not ( = ?auto_372551 ?auto_372552 ) ) ( not ( = ?auto_372551 ?auto_372553 ) ) ( not ( = ?auto_372551 ?auto_372554 ) ) ( not ( = ?auto_372552 ?auto_372553 ) ) ( not ( = ?auto_372552 ?auto_372554 ) ) ( not ( = ?auto_372553 ?auto_372554 ) ) ( ON ?auto_372552 ?auto_372553 ) ( ON ?auto_372551 ?auto_372552 ) ( ON ?auto_372550 ?auto_372551 ) ( ON ?auto_372549 ?auto_372550 ) ( ON ?auto_372548 ?auto_372549 ) ( CLEAR ?auto_372546 ) ( ON ?auto_372547 ?auto_372548 ) ( CLEAR ?auto_372547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_372544 ?auto_372545 ?auto_372546 ?auto_372547 )
      ( MAKE-10PILE ?auto_372544 ?auto_372545 ?auto_372546 ?auto_372547 ?auto_372548 ?auto_372549 ?auto_372550 ?auto_372551 ?auto_372552 ?auto_372553 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372586 - BLOCK
      ?auto_372587 - BLOCK
      ?auto_372588 - BLOCK
      ?auto_372589 - BLOCK
      ?auto_372590 - BLOCK
      ?auto_372591 - BLOCK
      ?auto_372592 - BLOCK
      ?auto_372593 - BLOCK
      ?auto_372594 - BLOCK
      ?auto_372595 - BLOCK
    )
    :vars
    (
      ?auto_372596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372595 ?auto_372596 ) ( ON-TABLE ?auto_372586 ) ( ON ?auto_372587 ?auto_372586 ) ( not ( = ?auto_372586 ?auto_372587 ) ) ( not ( = ?auto_372586 ?auto_372588 ) ) ( not ( = ?auto_372586 ?auto_372589 ) ) ( not ( = ?auto_372586 ?auto_372590 ) ) ( not ( = ?auto_372586 ?auto_372591 ) ) ( not ( = ?auto_372586 ?auto_372592 ) ) ( not ( = ?auto_372586 ?auto_372593 ) ) ( not ( = ?auto_372586 ?auto_372594 ) ) ( not ( = ?auto_372586 ?auto_372595 ) ) ( not ( = ?auto_372586 ?auto_372596 ) ) ( not ( = ?auto_372587 ?auto_372588 ) ) ( not ( = ?auto_372587 ?auto_372589 ) ) ( not ( = ?auto_372587 ?auto_372590 ) ) ( not ( = ?auto_372587 ?auto_372591 ) ) ( not ( = ?auto_372587 ?auto_372592 ) ) ( not ( = ?auto_372587 ?auto_372593 ) ) ( not ( = ?auto_372587 ?auto_372594 ) ) ( not ( = ?auto_372587 ?auto_372595 ) ) ( not ( = ?auto_372587 ?auto_372596 ) ) ( not ( = ?auto_372588 ?auto_372589 ) ) ( not ( = ?auto_372588 ?auto_372590 ) ) ( not ( = ?auto_372588 ?auto_372591 ) ) ( not ( = ?auto_372588 ?auto_372592 ) ) ( not ( = ?auto_372588 ?auto_372593 ) ) ( not ( = ?auto_372588 ?auto_372594 ) ) ( not ( = ?auto_372588 ?auto_372595 ) ) ( not ( = ?auto_372588 ?auto_372596 ) ) ( not ( = ?auto_372589 ?auto_372590 ) ) ( not ( = ?auto_372589 ?auto_372591 ) ) ( not ( = ?auto_372589 ?auto_372592 ) ) ( not ( = ?auto_372589 ?auto_372593 ) ) ( not ( = ?auto_372589 ?auto_372594 ) ) ( not ( = ?auto_372589 ?auto_372595 ) ) ( not ( = ?auto_372589 ?auto_372596 ) ) ( not ( = ?auto_372590 ?auto_372591 ) ) ( not ( = ?auto_372590 ?auto_372592 ) ) ( not ( = ?auto_372590 ?auto_372593 ) ) ( not ( = ?auto_372590 ?auto_372594 ) ) ( not ( = ?auto_372590 ?auto_372595 ) ) ( not ( = ?auto_372590 ?auto_372596 ) ) ( not ( = ?auto_372591 ?auto_372592 ) ) ( not ( = ?auto_372591 ?auto_372593 ) ) ( not ( = ?auto_372591 ?auto_372594 ) ) ( not ( = ?auto_372591 ?auto_372595 ) ) ( not ( = ?auto_372591 ?auto_372596 ) ) ( not ( = ?auto_372592 ?auto_372593 ) ) ( not ( = ?auto_372592 ?auto_372594 ) ) ( not ( = ?auto_372592 ?auto_372595 ) ) ( not ( = ?auto_372592 ?auto_372596 ) ) ( not ( = ?auto_372593 ?auto_372594 ) ) ( not ( = ?auto_372593 ?auto_372595 ) ) ( not ( = ?auto_372593 ?auto_372596 ) ) ( not ( = ?auto_372594 ?auto_372595 ) ) ( not ( = ?auto_372594 ?auto_372596 ) ) ( not ( = ?auto_372595 ?auto_372596 ) ) ( ON ?auto_372594 ?auto_372595 ) ( ON ?auto_372593 ?auto_372594 ) ( ON ?auto_372592 ?auto_372593 ) ( ON ?auto_372591 ?auto_372592 ) ( ON ?auto_372590 ?auto_372591 ) ( ON ?auto_372589 ?auto_372590 ) ( CLEAR ?auto_372587 ) ( ON ?auto_372588 ?auto_372589 ) ( CLEAR ?auto_372588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_372586 ?auto_372587 ?auto_372588 )
      ( MAKE-10PILE ?auto_372586 ?auto_372587 ?auto_372588 ?auto_372589 ?auto_372590 ?auto_372591 ?auto_372592 ?auto_372593 ?auto_372594 ?auto_372595 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372628 - BLOCK
      ?auto_372629 - BLOCK
      ?auto_372630 - BLOCK
      ?auto_372631 - BLOCK
      ?auto_372632 - BLOCK
      ?auto_372633 - BLOCK
      ?auto_372634 - BLOCK
      ?auto_372635 - BLOCK
      ?auto_372636 - BLOCK
      ?auto_372637 - BLOCK
    )
    :vars
    (
      ?auto_372638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372637 ?auto_372638 ) ( ON-TABLE ?auto_372628 ) ( not ( = ?auto_372628 ?auto_372629 ) ) ( not ( = ?auto_372628 ?auto_372630 ) ) ( not ( = ?auto_372628 ?auto_372631 ) ) ( not ( = ?auto_372628 ?auto_372632 ) ) ( not ( = ?auto_372628 ?auto_372633 ) ) ( not ( = ?auto_372628 ?auto_372634 ) ) ( not ( = ?auto_372628 ?auto_372635 ) ) ( not ( = ?auto_372628 ?auto_372636 ) ) ( not ( = ?auto_372628 ?auto_372637 ) ) ( not ( = ?auto_372628 ?auto_372638 ) ) ( not ( = ?auto_372629 ?auto_372630 ) ) ( not ( = ?auto_372629 ?auto_372631 ) ) ( not ( = ?auto_372629 ?auto_372632 ) ) ( not ( = ?auto_372629 ?auto_372633 ) ) ( not ( = ?auto_372629 ?auto_372634 ) ) ( not ( = ?auto_372629 ?auto_372635 ) ) ( not ( = ?auto_372629 ?auto_372636 ) ) ( not ( = ?auto_372629 ?auto_372637 ) ) ( not ( = ?auto_372629 ?auto_372638 ) ) ( not ( = ?auto_372630 ?auto_372631 ) ) ( not ( = ?auto_372630 ?auto_372632 ) ) ( not ( = ?auto_372630 ?auto_372633 ) ) ( not ( = ?auto_372630 ?auto_372634 ) ) ( not ( = ?auto_372630 ?auto_372635 ) ) ( not ( = ?auto_372630 ?auto_372636 ) ) ( not ( = ?auto_372630 ?auto_372637 ) ) ( not ( = ?auto_372630 ?auto_372638 ) ) ( not ( = ?auto_372631 ?auto_372632 ) ) ( not ( = ?auto_372631 ?auto_372633 ) ) ( not ( = ?auto_372631 ?auto_372634 ) ) ( not ( = ?auto_372631 ?auto_372635 ) ) ( not ( = ?auto_372631 ?auto_372636 ) ) ( not ( = ?auto_372631 ?auto_372637 ) ) ( not ( = ?auto_372631 ?auto_372638 ) ) ( not ( = ?auto_372632 ?auto_372633 ) ) ( not ( = ?auto_372632 ?auto_372634 ) ) ( not ( = ?auto_372632 ?auto_372635 ) ) ( not ( = ?auto_372632 ?auto_372636 ) ) ( not ( = ?auto_372632 ?auto_372637 ) ) ( not ( = ?auto_372632 ?auto_372638 ) ) ( not ( = ?auto_372633 ?auto_372634 ) ) ( not ( = ?auto_372633 ?auto_372635 ) ) ( not ( = ?auto_372633 ?auto_372636 ) ) ( not ( = ?auto_372633 ?auto_372637 ) ) ( not ( = ?auto_372633 ?auto_372638 ) ) ( not ( = ?auto_372634 ?auto_372635 ) ) ( not ( = ?auto_372634 ?auto_372636 ) ) ( not ( = ?auto_372634 ?auto_372637 ) ) ( not ( = ?auto_372634 ?auto_372638 ) ) ( not ( = ?auto_372635 ?auto_372636 ) ) ( not ( = ?auto_372635 ?auto_372637 ) ) ( not ( = ?auto_372635 ?auto_372638 ) ) ( not ( = ?auto_372636 ?auto_372637 ) ) ( not ( = ?auto_372636 ?auto_372638 ) ) ( not ( = ?auto_372637 ?auto_372638 ) ) ( ON ?auto_372636 ?auto_372637 ) ( ON ?auto_372635 ?auto_372636 ) ( ON ?auto_372634 ?auto_372635 ) ( ON ?auto_372633 ?auto_372634 ) ( ON ?auto_372632 ?auto_372633 ) ( ON ?auto_372631 ?auto_372632 ) ( ON ?auto_372630 ?auto_372631 ) ( CLEAR ?auto_372628 ) ( ON ?auto_372629 ?auto_372630 ) ( CLEAR ?auto_372629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_372628 ?auto_372629 )
      ( MAKE-10PILE ?auto_372628 ?auto_372629 ?auto_372630 ?auto_372631 ?auto_372632 ?auto_372633 ?auto_372634 ?auto_372635 ?auto_372636 ?auto_372637 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372670 - BLOCK
      ?auto_372671 - BLOCK
      ?auto_372672 - BLOCK
      ?auto_372673 - BLOCK
      ?auto_372674 - BLOCK
      ?auto_372675 - BLOCK
      ?auto_372676 - BLOCK
      ?auto_372677 - BLOCK
      ?auto_372678 - BLOCK
      ?auto_372679 - BLOCK
    )
    :vars
    (
      ?auto_372680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372679 ?auto_372680 ) ( not ( = ?auto_372670 ?auto_372671 ) ) ( not ( = ?auto_372670 ?auto_372672 ) ) ( not ( = ?auto_372670 ?auto_372673 ) ) ( not ( = ?auto_372670 ?auto_372674 ) ) ( not ( = ?auto_372670 ?auto_372675 ) ) ( not ( = ?auto_372670 ?auto_372676 ) ) ( not ( = ?auto_372670 ?auto_372677 ) ) ( not ( = ?auto_372670 ?auto_372678 ) ) ( not ( = ?auto_372670 ?auto_372679 ) ) ( not ( = ?auto_372670 ?auto_372680 ) ) ( not ( = ?auto_372671 ?auto_372672 ) ) ( not ( = ?auto_372671 ?auto_372673 ) ) ( not ( = ?auto_372671 ?auto_372674 ) ) ( not ( = ?auto_372671 ?auto_372675 ) ) ( not ( = ?auto_372671 ?auto_372676 ) ) ( not ( = ?auto_372671 ?auto_372677 ) ) ( not ( = ?auto_372671 ?auto_372678 ) ) ( not ( = ?auto_372671 ?auto_372679 ) ) ( not ( = ?auto_372671 ?auto_372680 ) ) ( not ( = ?auto_372672 ?auto_372673 ) ) ( not ( = ?auto_372672 ?auto_372674 ) ) ( not ( = ?auto_372672 ?auto_372675 ) ) ( not ( = ?auto_372672 ?auto_372676 ) ) ( not ( = ?auto_372672 ?auto_372677 ) ) ( not ( = ?auto_372672 ?auto_372678 ) ) ( not ( = ?auto_372672 ?auto_372679 ) ) ( not ( = ?auto_372672 ?auto_372680 ) ) ( not ( = ?auto_372673 ?auto_372674 ) ) ( not ( = ?auto_372673 ?auto_372675 ) ) ( not ( = ?auto_372673 ?auto_372676 ) ) ( not ( = ?auto_372673 ?auto_372677 ) ) ( not ( = ?auto_372673 ?auto_372678 ) ) ( not ( = ?auto_372673 ?auto_372679 ) ) ( not ( = ?auto_372673 ?auto_372680 ) ) ( not ( = ?auto_372674 ?auto_372675 ) ) ( not ( = ?auto_372674 ?auto_372676 ) ) ( not ( = ?auto_372674 ?auto_372677 ) ) ( not ( = ?auto_372674 ?auto_372678 ) ) ( not ( = ?auto_372674 ?auto_372679 ) ) ( not ( = ?auto_372674 ?auto_372680 ) ) ( not ( = ?auto_372675 ?auto_372676 ) ) ( not ( = ?auto_372675 ?auto_372677 ) ) ( not ( = ?auto_372675 ?auto_372678 ) ) ( not ( = ?auto_372675 ?auto_372679 ) ) ( not ( = ?auto_372675 ?auto_372680 ) ) ( not ( = ?auto_372676 ?auto_372677 ) ) ( not ( = ?auto_372676 ?auto_372678 ) ) ( not ( = ?auto_372676 ?auto_372679 ) ) ( not ( = ?auto_372676 ?auto_372680 ) ) ( not ( = ?auto_372677 ?auto_372678 ) ) ( not ( = ?auto_372677 ?auto_372679 ) ) ( not ( = ?auto_372677 ?auto_372680 ) ) ( not ( = ?auto_372678 ?auto_372679 ) ) ( not ( = ?auto_372678 ?auto_372680 ) ) ( not ( = ?auto_372679 ?auto_372680 ) ) ( ON ?auto_372678 ?auto_372679 ) ( ON ?auto_372677 ?auto_372678 ) ( ON ?auto_372676 ?auto_372677 ) ( ON ?auto_372675 ?auto_372676 ) ( ON ?auto_372674 ?auto_372675 ) ( ON ?auto_372673 ?auto_372674 ) ( ON ?auto_372672 ?auto_372673 ) ( ON ?auto_372671 ?auto_372672 ) ( ON ?auto_372670 ?auto_372671 ) ( CLEAR ?auto_372670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_372670 )
      ( MAKE-10PILE ?auto_372670 ?auto_372671 ?auto_372672 ?auto_372673 ?auto_372674 ?auto_372675 ?auto_372676 ?auto_372677 ?auto_372678 ?auto_372679 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372713 - BLOCK
      ?auto_372714 - BLOCK
      ?auto_372715 - BLOCK
      ?auto_372716 - BLOCK
      ?auto_372717 - BLOCK
      ?auto_372718 - BLOCK
      ?auto_372719 - BLOCK
      ?auto_372720 - BLOCK
      ?auto_372721 - BLOCK
      ?auto_372722 - BLOCK
      ?auto_372723 - BLOCK
    )
    :vars
    (
      ?auto_372724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_372722 ) ( ON ?auto_372723 ?auto_372724 ) ( CLEAR ?auto_372723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_372713 ) ( ON ?auto_372714 ?auto_372713 ) ( ON ?auto_372715 ?auto_372714 ) ( ON ?auto_372716 ?auto_372715 ) ( ON ?auto_372717 ?auto_372716 ) ( ON ?auto_372718 ?auto_372717 ) ( ON ?auto_372719 ?auto_372718 ) ( ON ?auto_372720 ?auto_372719 ) ( ON ?auto_372721 ?auto_372720 ) ( ON ?auto_372722 ?auto_372721 ) ( not ( = ?auto_372713 ?auto_372714 ) ) ( not ( = ?auto_372713 ?auto_372715 ) ) ( not ( = ?auto_372713 ?auto_372716 ) ) ( not ( = ?auto_372713 ?auto_372717 ) ) ( not ( = ?auto_372713 ?auto_372718 ) ) ( not ( = ?auto_372713 ?auto_372719 ) ) ( not ( = ?auto_372713 ?auto_372720 ) ) ( not ( = ?auto_372713 ?auto_372721 ) ) ( not ( = ?auto_372713 ?auto_372722 ) ) ( not ( = ?auto_372713 ?auto_372723 ) ) ( not ( = ?auto_372713 ?auto_372724 ) ) ( not ( = ?auto_372714 ?auto_372715 ) ) ( not ( = ?auto_372714 ?auto_372716 ) ) ( not ( = ?auto_372714 ?auto_372717 ) ) ( not ( = ?auto_372714 ?auto_372718 ) ) ( not ( = ?auto_372714 ?auto_372719 ) ) ( not ( = ?auto_372714 ?auto_372720 ) ) ( not ( = ?auto_372714 ?auto_372721 ) ) ( not ( = ?auto_372714 ?auto_372722 ) ) ( not ( = ?auto_372714 ?auto_372723 ) ) ( not ( = ?auto_372714 ?auto_372724 ) ) ( not ( = ?auto_372715 ?auto_372716 ) ) ( not ( = ?auto_372715 ?auto_372717 ) ) ( not ( = ?auto_372715 ?auto_372718 ) ) ( not ( = ?auto_372715 ?auto_372719 ) ) ( not ( = ?auto_372715 ?auto_372720 ) ) ( not ( = ?auto_372715 ?auto_372721 ) ) ( not ( = ?auto_372715 ?auto_372722 ) ) ( not ( = ?auto_372715 ?auto_372723 ) ) ( not ( = ?auto_372715 ?auto_372724 ) ) ( not ( = ?auto_372716 ?auto_372717 ) ) ( not ( = ?auto_372716 ?auto_372718 ) ) ( not ( = ?auto_372716 ?auto_372719 ) ) ( not ( = ?auto_372716 ?auto_372720 ) ) ( not ( = ?auto_372716 ?auto_372721 ) ) ( not ( = ?auto_372716 ?auto_372722 ) ) ( not ( = ?auto_372716 ?auto_372723 ) ) ( not ( = ?auto_372716 ?auto_372724 ) ) ( not ( = ?auto_372717 ?auto_372718 ) ) ( not ( = ?auto_372717 ?auto_372719 ) ) ( not ( = ?auto_372717 ?auto_372720 ) ) ( not ( = ?auto_372717 ?auto_372721 ) ) ( not ( = ?auto_372717 ?auto_372722 ) ) ( not ( = ?auto_372717 ?auto_372723 ) ) ( not ( = ?auto_372717 ?auto_372724 ) ) ( not ( = ?auto_372718 ?auto_372719 ) ) ( not ( = ?auto_372718 ?auto_372720 ) ) ( not ( = ?auto_372718 ?auto_372721 ) ) ( not ( = ?auto_372718 ?auto_372722 ) ) ( not ( = ?auto_372718 ?auto_372723 ) ) ( not ( = ?auto_372718 ?auto_372724 ) ) ( not ( = ?auto_372719 ?auto_372720 ) ) ( not ( = ?auto_372719 ?auto_372721 ) ) ( not ( = ?auto_372719 ?auto_372722 ) ) ( not ( = ?auto_372719 ?auto_372723 ) ) ( not ( = ?auto_372719 ?auto_372724 ) ) ( not ( = ?auto_372720 ?auto_372721 ) ) ( not ( = ?auto_372720 ?auto_372722 ) ) ( not ( = ?auto_372720 ?auto_372723 ) ) ( not ( = ?auto_372720 ?auto_372724 ) ) ( not ( = ?auto_372721 ?auto_372722 ) ) ( not ( = ?auto_372721 ?auto_372723 ) ) ( not ( = ?auto_372721 ?auto_372724 ) ) ( not ( = ?auto_372722 ?auto_372723 ) ) ( not ( = ?auto_372722 ?auto_372724 ) ) ( not ( = ?auto_372723 ?auto_372724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_372723 ?auto_372724 )
      ( !STACK ?auto_372723 ?auto_372722 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372759 - BLOCK
      ?auto_372760 - BLOCK
      ?auto_372761 - BLOCK
      ?auto_372762 - BLOCK
      ?auto_372763 - BLOCK
      ?auto_372764 - BLOCK
      ?auto_372765 - BLOCK
      ?auto_372766 - BLOCK
      ?auto_372767 - BLOCK
      ?auto_372768 - BLOCK
      ?auto_372769 - BLOCK
    )
    :vars
    (
      ?auto_372770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372769 ?auto_372770 ) ( ON-TABLE ?auto_372759 ) ( ON ?auto_372760 ?auto_372759 ) ( ON ?auto_372761 ?auto_372760 ) ( ON ?auto_372762 ?auto_372761 ) ( ON ?auto_372763 ?auto_372762 ) ( ON ?auto_372764 ?auto_372763 ) ( ON ?auto_372765 ?auto_372764 ) ( ON ?auto_372766 ?auto_372765 ) ( ON ?auto_372767 ?auto_372766 ) ( not ( = ?auto_372759 ?auto_372760 ) ) ( not ( = ?auto_372759 ?auto_372761 ) ) ( not ( = ?auto_372759 ?auto_372762 ) ) ( not ( = ?auto_372759 ?auto_372763 ) ) ( not ( = ?auto_372759 ?auto_372764 ) ) ( not ( = ?auto_372759 ?auto_372765 ) ) ( not ( = ?auto_372759 ?auto_372766 ) ) ( not ( = ?auto_372759 ?auto_372767 ) ) ( not ( = ?auto_372759 ?auto_372768 ) ) ( not ( = ?auto_372759 ?auto_372769 ) ) ( not ( = ?auto_372759 ?auto_372770 ) ) ( not ( = ?auto_372760 ?auto_372761 ) ) ( not ( = ?auto_372760 ?auto_372762 ) ) ( not ( = ?auto_372760 ?auto_372763 ) ) ( not ( = ?auto_372760 ?auto_372764 ) ) ( not ( = ?auto_372760 ?auto_372765 ) ) ( not ( = ?auto_372760 ?auto_372766 ) ) ( not ( = ?auto_372760 ?auto_372767 ) ) ( not ( = ?auto_372760 ?auto_372768 ) ) ( not ( = ?auto_372760 ?auto_372769 ) ) ( not ( = ?auto_372760 ?auto_372770 ) ) ( not ( = ?auto_372761 ?auto_372762 ) ) ( not ( = ?auto_372761 ?auto_372763 ) ) ( not ( = ?auto_372761 ?auto_372764 ) ) ( not ( = ?auto_372761 ?auto_372765 ) ) ( not ( = ?auto_372761 ?auto_372766 ) ) ( not ( = ?auto_372761 ?auto_372767 ) ) ( not ( = ?auto_372761 ?auto_372768 ) ) ( not ( = ?auto_372761 ?auto_372769 ) ) ( not ( = ?auto_372761 ?auto_372770 ) ) ( not ( = ?auto_372762 ?auto_372763 ) ) ( not ( = ?auto_372762 ?auto_372764 ) ) ( not ( = ?auto_372762 ?auto_372765 ) ) ( not ( = ?auto_372762 ?auto_372766 ) ) ( not ( = ?auto_372762 ?auto_372767 ) ) ( not ( = ?auto_372762 ?auto_372768 ) ) ( not ( = ?auto_372762 ?auto_372769 ) ) ( not ( = ?auto_372762 ?auto_372770 ) ) ( not ( = ?auto_372763 ?auto_372764 ) ) ( not ( = ?auto_372763 ?auto_372765 ) ) ( not ( = ?auto_372763 ?auto_372766 ) ) ( not ( = ?auto_372763 ?auto_372767 ) ) ( not ( = ?auto_372763 ?auto_372768 ) ) ( not ( = ?auto_372763 ?auto_372769 ) ) ( not ( = ?auto_372763 ?auto_372770 ) ) ( not ( = ?auto_372764 ?auto_372765 ) ) ( not ( = ?auto_372764 ?auto_372766 ) ) ( not ( = ?auto_372764 ?auto_372767 ) ) ( not ( = ?auto_372764 ?auto_372768 ) ) ( not ( = ?auto_372764 ?auto_372769 ) ) ( not ( = ?auto_372764 ?auto_372770 ) ) ( not ( = ?auto_372765 ?auto_372766 ) ) ( not ( = ?auto_372765 ?auto_372767 ) ) ( not ( = ?auto_372765 ?auto_372768 ) ) ( not ( = ?auto_372765 ?auto_372769 ) ) ( not ( = ?auto_372765 ?auto_372770 ) ) ( not ( = ?auto_372766 ?auto_372767 ) ) ( not ( = ?auto_372766 ?auto_372768 ) ) ( not ( = ?auto_372766 ?auto_372769 ) ) ( not ( = ?auto_372766 ?auto_372770 ) ) ( not ( = ?auto_372767 ?auto_372768 ) ) ( not ( = ?auto_372767 ?auto_372769 ) ) ( not ( = ?auto_372767 ?auto_372770 ) ) ( not ( = ?auto_372768 ?auto_372769 ) ) ( not ( = ?auto_372768 ?auto_372770 ) ) ( not ( = ?auto_372769 ?auto_372770 ) ) ( CLEAR ?auto_372767 ) ( ON ?auto_372768 ?auto_372769 ) ( CLEAR ?auto_372768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_372759 ?auto_372760 ?auto_372761 ?auto_372762 ?auto_372763 ?auto_372764 ?auto_372765 ?auto_372766 ?auto_372767 ?auto_372768 )
      ( MAKE-11PILE ?auto_372759 ?auto_372760 ?auto_372761 ?auto_372762 ?auto_372763 ?auto_372764 ?auto_372765 ?auto_372766 ?auto_372767 ?auto_372768 ?auto_372769 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372805 - BLOCK
      ?auto_372806 - BLOCK
      ?auto_372807 - BLOCK
      ?auto_372808 - BLOCK
      ?auto_372809 - BLOCK
      ?auto_372810 - BLOCK
      ?auto_372811 - BLOCK
      ?auto_372812 - BLOCK
      ?auto_372813 - BLOCK
      ?auto_372814 - BLOCK
      ?auto_372815 - BLOCK
    )
    :vars
    (
      ?auto_372816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372815 ?auto_372816 ) ( ON-TABLE ?auto_372805 ) ( ON ?auto_372806 ?auto_372805 ) ( ON ?auto_372807 ?auto_372806 ) ( ON ?auto_372808 ?auto_372807 ) ( ON ?auto_372809 ?auto_372808 ) ( ON ?auto_372810 ?auto_372809 ) ( ON ?auto_372811 ?auto_372810 ) ( ON ?auto_372812 ?auto_372811 ) ( not ( = ?auto_372805 ?auto_372806 ) ) ( not ( = ?auto_372805 ?auto_372807 ) ) ( not ( = ?auto_372805 ?auto_372808 ) ) ( not ( = ?auto_372805 ?auto_372809 ) ) ( not ( = ?auto_372805 ?auto_372810 ) ) ( not ( = ?auto_372805 ?auto_372811 ) ) ( not ( = ?auto_372805 ?auto_372812 ) ) ( not ( = ?auto_372805 ?auto_372813 ) ) ( not ( = ?auto_372805 ?auto_372814 ) ) ( not ( = ?auto_372805 ?auto_372815 ) ) ( not ( = ?auto_372805 ?auto_372816 ) ) ( not ( = ?auto_372806 ?auto_372807 ) ) ( not ( = ?auto_372806 ?auto_372808 ) ) ( not ( = ?auto_372806 ?auto_372809 ) ) ( not ( = ?auto_372806 ?auto_372810 ) ) ( not ( = ?auto_372806 ?auto_372811 ) ) ( not ( = ?auto_372806 ?auto_372812 ) ) ( not ( = ?auto_372806 ?auto_372813 ) ) ( not ( = ?auto_372806 ?auto_372814 ) ) ( not ( = ?auto_372806 ?auto_372815 ) ) ( not ( = ?auto_372806 ?auto_372816 ) ) ( not ( = ?auto_372807 ?auto_372808 ) ) ( not ( = ?auto_372807 ?auto_372809 ) ) ( not ( = ?auto_372807 ?auto_372810 ) ) ( not ( = ?auto_372807 ?auto_372811 ) ) ( not ( = ?auto_372807 ?auto_372812 ) ) ( not ( = ?auto_372807 ?auto_372813 ) ) ( not ( = ?auto_372807 ?auto_372814 ) ) ( not ( = ?auto_372807 ?auto_372815 ) ) ( not ( = ?auto_372807 ?auto_372816 ) ) ( not ( = ?auto_372808 ?auto_372809 ) ) ( not ( = ?auto_372808 ?auto_372810 ) ) ( not ( = ?auto_372808 ?auto_372811 ) ) ( not ( = ?auto_372808 ?auto_372812 ) ) ( not ( = ?auto_372808 ?auto_372813 ) ) ( not ( = ?auto_372808 ?auto_372814 ) ) ( not ( = ?auto_372808 ?auto_372815 ) ) ( not ( = ?auto_372808 ?auto_372816 ) ) ( not ( = ?auto_372809 ?auto_372810 ) ) ( not ( = ?auto_372809 ?auto_372811 ) ) ( not ( = ?auto_372809 ?auto_372812 ) ) ( not ( = ?auto_372809 ?auto_372813 ) ) ( not ( = ?auto_372809 ?auto_372814 ) ) ( not ( = ?auto_372809 ?auto_372815 ) ) ( not ( = ?auto_372809 ?auto_372816 ) ) ( not ( = ?auto_372810 ?auto_372811 ) ) ( not ( = ?auto_372810 ?auto_372812 ) ) ( not ( = ?auto_372810 ?auto_372813 ) ) ( not ( = ?auto_372810 ?auto_372814 ) ) ( not ( = ?auto_372810 ?auto_372815 ) ) ( not ( = ?auto_372810 ?auto_372816 ) ) ( not ( = ?auto_372811 ?auto_372812 ) ) ( not ( = ?auto_372811 ?auto_372813 ) ) ( not ( = ?auto_372811 ?auto_372814 ) ) ( not ( = ?auto_372811 ?auto_372815 ) ) ( not ( = ?auto_372811 ?auto_372816 ) ) ( not ( = ?auto_372812 ?auto_372813 ) ) ( not ( = ?auto_372812 ?auto_372814 ) ) ( not ( = ?auto_372812 ?auto_372815 ) ) ( not ( = ?auto_372812 ?auto_372816 ) ) ( not ( = ?auto_372813 ?auto_372814 ) ) ( not ( = ?auto_372813 ?auto_372815 ) ) ( not ( = ?auto_372813 ?auto_372816 ) ) ( not ( = ?auto_372814 ?auto_372815 ) ) ( not ( = ?auto_372814 ?auto_372816 ) ) ( not ( = ?auto_372815 ?auto_372816 ) ) ( ON ?auto_372814 ?auto_372815 ) ( CLEAR ?auto_372812 ) ( ON ?auto_372813 ?auto_372814 ) ( CLEAR ?auto_372813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_372805 ?auto_372806 ?auto_372807 ?auto_372808 ?auto_372809 ?auto_372810 ?auto_372811 ?auto_372812 ?auto_372813 )
      ( MAKE-11PILE ?auto_372805 ?auto_372806 ?auto_372807 ?auto_372808 ?auto_372809 ?auto_372810 ?auto_372811 ?auto_372812 ?auto_372813 ?auto_372814 ?auto_372815 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372851 - BLOCK
      ?auto_372852 - BLOCK
      ?auto_372853 - BLOCK
      ?auto_372854 - BLOCK
      ?auto_372855 - BLOCK
      ?auto_372856 - BLOCK
      ?auto_372857 - BLOCK
      ?auto_372858 - BLOCK
      ?auto_372859 - BLOCK
      ?auto_372860 - BLOCK
      ?auto_372861 - BLOCK
    )
    :vars
    (
      ?auto_372862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372861 ?auto_372862 ) ( ON-TABLE ?auto_372851 ) ( ON ?auto_372852 ?auto_372851 ) ( ON ?auto_372853 ?auto_372852 ) ( ON ?auto_372854 ?auto_372853 ) ( ON ?auto_372855 ?auto_372854 ) ( ON ?auto_372856 ?auto_372855 ) ( ON ?auto_372857 ?auto_372856 ) ( not ( = ?auto_372851 ?auto_372852 ) ) ( not ( = ?auto_372851 ?auto_372853 ) ) ( not ( = ?auto_372851 ?auto_372854 ) ) ( not ( = ?auto_372851 ?auto_372855 ) ) ( not ( = ?auto_372851 ?auto_372856 ) ) ( not ( = ?auto_372851 ?auto_372857 ) ) ( not ( = ?auto_372851 ?auto_372858 ) ) ( not ( = ?auto_372851 ?auto_372859 ) ) ( not ( = ?auto_372851 ?auto_372860 ) ) ( not ( = ?auto_372851 ?auto_372861 ) ) ( not ( = ?auto_372851 ?auto_372862 ) ) ( not ( = ?auto_372852 ?auto_372853 ) ) ( not ( = ?auto_372852 ?auto_372854 ) ) ( not ( = ?auto_372852 ?auto_372855 ) ) ( not ( = ?auto_372852 ?auto_372856 ) ) ( not ( = ?auto_372852 ?auto_372857 ) ) ( not ( = ?auto_372852 ?auto_372858 ) ) ( not ( = ?auto_372852 ?auto_372859 ) ) ( not ( = ?auto_372852 ?auto_372860 ) ) ( not ( = ?auto_372852 ?auto_372861 ) ) ( not ( = ?auto_372852 ?auto_372862 ) ) ( not ( = ?auto_372853 ?auto_372854 ) ) ( not ( = ?auto_372853 ?auto_372855 ) ) ( not ( = ?auto_372853 ?auto_372856 ) ) ( not ( = ?auto_372853 ?auto_372857 ) ) ( not ( = ?auto_372853 ?auto_372858 ) ) ( not ( = ?auto_372853 ?auto_372859 ) ) ( not ( = ?auto_372853 ?auto_372860 ) ) ( not ( = ?auto_372853 ?auto_372861 ) ) ( not ( = ?auto_372853 ?auto_372862 ) ) ( not ( = ?auto_372854 ?auto_372855 ) ) ( not ( = ?auto_372854 ?auto_372856 ) ) ( not ( = ?auto_372854 ?auto_372857 ) ) ( not ( = ?auto_372854 ?auto_372858 ) ) ( not ( = ?auto_372854 ?auto_372859 ) ) ( not ( = ?auto_372854 ?auto_372860 ) ) ( not ( = ?auto_372854 ?auto_372861 ) ) ( not ( = ?auto_372854 ?auto_372862 ) ) ( not ( = ?auto_372855 ?auto_372856 ) ) ( not ( = ?auto_372855 ?auto_372857 ) ) ( not ( = ?auto_372855 ?auto_372858 ) ) ( not ( = ?auto_372855 ?auto_372859 ) ) ( not ( = ?auto_372855 ?auto_372860 ) ) ( not ( = ?auto_372855 ?auto_372861 ) ) ( not ( = ?auto_372855 ?auto_372862 ) ) ( not ( = ?auto_372856 ?auto_372857 ) ) ( not ( = ?auto_372856 ?auto_372858 ) ) ( not ( = ?auto_372856 ?auto_372859 ) ) ( not ( = ?auto_372856 ?auto_372860 ) ) ( not ( = ?auto_372856 ?auto_372861 ) ) ( not ( = ?auto_372856 ?auto_372862 ) ) ( not ( = ?auto_372857 ?auto_372858 ) ) ( not ( = ?auto_372857 ?auto_372859 ) ) ( not ( = ?auto_372857 ?auto_372860 ) ) ( not ( = ?auto_372857 ?auto_372861 ) ) ( not ( = ?auto_372857 ?auto_372862 ) ) ( not ( = ?auto_372858 ?auto_372859 ) ) ( not ( = ?auto_372858 ?auto_372860 ) ) ( not ( = ?auto_372858 ?auto_372861 ) ) ( not ( = ?auto_372858 ?auto_372862 ) ) ( not ( = ?auto_372859 ?auto_372860 ) ) ( not ( = ?auto_372859 ?auto_372861 ) ) ( not ( = ?auto_372859 ?auto_372862 ) ) ( not ( = ?auto_372860 ?auto_372861 ) ) ( not ( = ?auto_372860 ?auto_372862 ) ) ( not ( = ?auto_372861 ?auto_372862 ) ) ( ON ?auto_372860 ?auto_372861 ) ( ON ?auto_372859 ?auto_372860 ) ( CLEAR ?auto_372857 ) ( ON ?auto_372858 ?auto_372859 ) ( CLEAR ?auto_372858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_372851 ?auto_372852 ?auto_372853 ?auto_372854 ?auto_372855 ?auto_372856 ?auto_372857 ?auto_372858 )
      ( MAKE-11PILE ?auto_372851 ?auto_372852 ?auto_372853 ?auto_372854 ?auto_372855 ?auto_372856 ?auto_372857 ?auto_372858 ?auto_372859 ?auto_372860 ?auto_372861 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372897 - BLOCK
      ?auto_372898 - BLOCK
      ?auto_372899 - BLOCK
      ?auto_372900 - BLOCK
      ?auto_372901 - BLOCK
      ?auto_372902 - BLOCK
      ?auto_372903 - BLOCK
      ?auto_372904 - BLOCK
      ?auto_372905 - BLOCK
      ?auto_372906 - BLOCK
      ?auto_372907 - BLOCK
    )
    :vars
    (
      ?auto_372908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372907 ?auto_372908 ) ( ON-TABLE ?auto_372897 ) ( ON ?auto_372898 ?auto_372897 ) ( ON ?auto_372899 ?auto_372898 ) ( ON ?auto_372900 ?auto_372899 ) ( ON ?auto_372901 ?auto_372900 ) ( ON ?auto_372902 ?auto_372901 ) ( not ( = ?auto_372897 ?auto_372898 ) ) ( not ( = ?auto_372897 ?auto_372899 ) ) ( not ( = ?auto_372897 ?auto_372900 ) ) ( not ( = ?auto_372897 ?auto_372901 ) ) ( not ( = ?auto_372897 ?auto_372902 ) ) ( not ( = ?auto_372897 ?auto_372903 ) ) ( not ( = ?auto_372897 ?auto_372904 ) ) ( not ( = ?auto_372897 ?auto_372905 ) ) ( not ( = ?auto_372897 ?auto_372906 ) ) ( not ( = ?auto_372897 ?auto_372907 ) ) ( not ( = ?auto_372897 ?auto_372908 ) ) ( not ( = ?auto_372898 ?auto_372899 ) ) ( not ( = ?auto_372898 ?auto_372900 ) ) ( not ( = ?auto_372898 ?auto_372901 ) ) ( not ( = ?auto_372898 ?auto_372902 ) ) ( not ( = ?auto_372898 ?auto_372903 ) ) ( not ( = ?auto_372898 ?auto_372904 ) ) ( not ( = ?auto_372898 ?auto_372905 ) ) ( not ( = ?auto_372898 ?auto_372906 ) ) ( not ( = ?auto_372898 ?auto_372907 ) ) ( not ( = ?auto_372898 ?auto_372908 ) ) ( not ( = ?auto_372899 ?auto_372900 ) ) ( not ( = ?auto_372899 ?auto_372901 ) ) ( not ( = ?auto_372899 ?auto_372902 ) ) ( not ( = ?auto_372899 ?auto_372903 ) ) ( not ( = ?auto_372899 ?auto_372904 ) ) ( not ( = ?auto_372899 ?auto_372905 ) ) ( not ( = ?auto_372899 ?auto_372906 ) ) ( not ( = ?auto_372899 ?auto_372907 ) ) ( not ( = ?auto_372899 ?auto_372908 ) ) ( not ( = ?auto_372900 ?auto_372901 ) ) ( not ( = ?auto_372900 ?auto_372902 ) ) ( not ( = ?auto_372900 ?auto_372903 ) ) ( not ( = ?auto_372900 ?auto_372904 ) ) ( not ( = ?auto_372900 ?auto_372905 ) ) ( not ( = ?auto_372900 ?auto_372906 ) ) ( not ( = ?auto_372900 ?auto_372907 ) ) ( not ( = ?auto_372900 ?auto_372908 ) ) ( not ( = ?auto_372901 ?auto_372902 ) ) ( not ( = ?auto_372901 ?auto_372903 ) ) ( not ( = ?auto_372901 ?auto_372904 ) ) ( not ( = ?auto_372901 ?auto_372905 ) ) ( not ( = ?auto_372901 ?auto_372906 ) ) ( not ( = ?auto_372901 ?auto_372907 ) ) ( not ( = ?auto_372901 ?auto_372908 ) ) ( not ( = ?auto_372902 ?auto_372903 ) ) ( not ( = ?auto_372902 ?auto_372904 ) ) ( not ( = ?auto_372902 ?auto_372905 ) ) ( not ( = ?auto_372902 ?auto_372906 ) ) ( not ( = ?auto_372902 ?auto_372907 ) ) ( not ( = ?auto_372902 ?auto_372908 ) ) ( not ( = ?auto_372903 ?auto_372904 ) ) ( not ( = ?auto_372903 ?auto_372905 ) ) ( not ( = ?auto_372903 ?auto_372906 ) ) ( not ( = ?auto_372903 ?auto_372907 ) ) ( not ( = ?auto_372903 ?auto_372908 ) ) ( not ( = ?auto_372904 ?auto_372905 ) ) ( not ( = ?auto_372904 ?auto_372906 ) ) ( not ( = ?auto_372904 ?auto_372907 ) ) ( not ( = ?auto_372904 ?auto_372908 ) ) ( not ( = ?auto_372905 ?auto_372906 ) ) ( not ( = ?auto_372905 ?auto_372907 ) ) ( not ( = ?auto_372905 ?auto_372908 ) ) ( not ( = ?auto_372906 ?auto_372907 ) ) ( not ( = ?auto_372906 ?auto_372908 ) ) ( not ( = ?auto_372907 ?auto_372908 ) ) ( ON ?auto_372906 ?auto_372907 ) ( ON ?auto_372905 ?auto_372906 ) ( ON ?auto_372904 ?auto_372905 ) ( CLEAR ?auto_372902 ) ( ON ?auto_372903 ?auto_372904 ) ( CLEAR ?auto_372903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_372897 ?auto_372898 ?auto_372899 ?auto_372900 ?auto_372901 ?auto_372902 ?auto_372903 )
      ( MAKE-11PILE ?auto_372897 ?auto_372898 ?auto_372899 ?auto_372900 ?auto_372901 ?auto_372902 ?auto_372903 ?auto_372904 ?auto_372905 ?auto_372906 ?auto_372907 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372943 - BLOCK
      ?auto_372944 - BLOCK
      ?auto_372945 - BLOCK
      ?auto_372946 - BLOCK
      ?auto_372947 - BLOCK
      ?auto_372948 - BLOCK
      ?auto_372949 - BLOCK
      ?auto_372950 - BLOCK
      ?auto_372951 - BLOCK
      ?auto_372952 - BLOCK
      ?auto_372953 - BLOCK
    )
    :vars
    (
      ?auto_372954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372953 ?auto_372954 ) ( ON-TABLE ?auto_372943 ) ( ON ?auto_372944 ?auto_372943 ) ( ON ?auto_372945 ?auto_372944 ) ( ON ?auto_372946 ?auto_372945 ) ( ON ?auto_372947 ?auto_372946 ) ( not ( = ?auto_372943 ?auto_372944 ) ) ( not ( = ?auto_372943 ?auto_372945 ) ) ( not ( = ?auto_372943 ?auto_372946 ) ) ( not ( = ?auto_372943 ?auto_372947 ) ) ( not ( = ?auto_372943 ?auto_372948 ) ) ( not ( = ?auto_372943 ?auto_372949 ) ) ( not ( = ?auto_372943 ?auto_372950 ) ) ( not ( = ?auto_372943 ?auto_372951 ) ) ( not ( = ?auto_372943 ?auto_372952 ) ) ( not ( = ?auto_372943 ?auto_372953 ) ) ( not ( = ?auto_372943 ?auto_372954 ) ) ( not ( = ?auto_372944 ?auto_372945 ) ) ( not ( = ?auto_372944 ?auto_372946 ) ) ( not ( = ?auto_372944 ?auto_372947 ) ) ( not ( = ?auto_372944 ?auto_372948 ) ) ( not ( = ?auto_372944 ?auto_372949 ) ) ( not ( = ?auto_372944 ?auto_372950 ) ) ( not ( = ?auto_372944 ?auto_372951 ) ) ( not ( = ?auto_372944 ?auto_372952 ) ) ( not ( = ?auto_372944 ?auto_372953 ) ) ( not ( = ?auto_372944 ?auto_372954 ) ) ( not ( = ?auto_372945 ?auto_372946 ) ) ( not ( = ?auto_372945 ?auto_372947 ) ) ( not ( = ?auto_372945 ?auto_372948 ) ) ( not ( = ?auto_372945 ?auto_372949 ) ) ( not ( = ?auto_372945 ?auto_372950 ) ) ( not ( = ?auto_372945 ?auto_372951 ) ) ( not ( = ?auto_372945 ?auto_372952 ) ) ( not ( = ?auto_372945 ?auto_372953 ) ) ( not ( = ?auto_372945 ?auto_372954 ) ) ( not ( = ?auto_372946 ?auto_372947 ) ) ( not ( = ?auto_372946 ?auto_372948 ) ) ( not ( = ?auto_372946 ?auto_372949 ) ) ( not ( = ?auto_372946 ?auto_372950 ) ) ( not ( = ?auto_372946 ?auto_372951 ) ) ( not ( = ?auto_372946 ?auto_372952 ) ) ( not ( = ?auto_372946 ?auto_372953 ) ) ( not ( = ?auto_372946 ?auto_372954 ) ) ( not ( = ?auto_372947 ?auto_372948 ) ) ( not ( = ?auto_372947 ?auto_372949 ) ) ( not ( = ?auto_372947 ?auto_372950 ) ) ( not ( = ?auto_372947 ?auto_372951 ) ) ( not ( = ?auto_372947 ?auto_372952 ) ) ( not ( = ?auto_372947 ?auto_372953 ) ) ( not ( = ?auto_372947 ?auto_372954 ) ) ( not ( = ?auto_372948 ?auto_372949 ) ) ( not ( = ?auto_372948 ?auto_372950 ) ) ( not ( = ?auto_372948 ?auto_372951 ) ) ( not ( = ?auto_372948 ?auto_372952 ) ) ( not ( = ?auto_372948 ?auto_372953 ) ) ( not ( = ?auto_372948 ?auto_372954 ) ) ( not ( = ?auto_372949 ?auto_372950 ) ) ( not ( = ?auto_372949 ?auto_372951 ) ) ( not ( = ?auto_372949 ?auto_372952 ) ) ( not ( = ?auto_372949 ?auto_372953 ) ) ( not ( = ?auto_372949 ?auto_372954 ) ) ( not ( = ?auto_372950 ?auto_372951 ) ) ( not ( = ?auto_372950 ?auto_372952 ) ) ( not ( = ?auto_372950 ?auto_372953 ) ) ( not ( = ?auto_372950 ?auto_372954 ) ) ( not ( = ?auto_372951 ?auto_372952 ) ) ( not ( = ?auto_372951 ?auto_372953 ) ) ( not ( = ?auto_372951 ?auto_372954 ) ) ( not ( = ?auto_372952 ?auto_372953 ) ) ( not ( = ?auto_372952 ?auto_372954 ) ) ( not ( = ?auto_372953 ?auto_372954 ) ) ( ON ?auto_372952 ?auto_372953 ) ( ON ?auto_372951 ?auto_372952 ) ( ON ?auto_372950 ?auto_372951 ) ( ON ?auto_372949 ?auto_372950 ) ( CLEAR ?auto_372947 ) ( ON ?auto_372948 ?auto_372949 ) ( CLEAR ?auto_372948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_372943 ?auto_372944 ?auto_372945 ?auto_372946 ?auto_372947 ?auto_372948 )
      ( MAKE-11PILE ?auto_372943 ?auto_372944 ?auto_372945 ?auto_372946 ?auto_372947 ?auto_372948 ?auto_372949 ?auto_372950 ?auto_372951 ?auto_372952 ?auto_372953 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372989 - BLOCK
      ?auto_372990 - BLOCK
      ?auto_372991 - BLOCK
      ?auto_372992 - BLOCK
      ?auto_372993 - BLOCK
      ?auto_372994 - BLOCK
      ?auto_372995 - BLOCK
      ?auto_372996 - BLOCK
      ?auto_372997 - BLOCK
      ?auto_372998 - BLOCK
      ?auto_372999 - BLOCK
    )
    :vars
    (
      ?auto_373000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372999 ?auto_373000 ) ( ON-TABLE ?auto_372989 ) ( ON ?auto_372990 ?auto_372989 ) ( ON ?auto_372991 ?auto_372990 ) ( ON ?auto_372992 ?auto_372991 ) ( not ( = ?auto_372989 ?auto_372990 ) ) ( not ( = ?auto_372989 ?auto_372991 ) ) ( not ( = ?auto_372989 ?auto_372992 ) ) ( not ( = ?auto_372989 ?auto_372993 ) ) ( not ( = ?auto_372989 ?auto_372994 ) ) ( not ( = ?auto_372989 ?auto_372995 ) ) ( not ( = ?auto_372989 ?auto_372996 ) ) ( not ( = ?auto_372989 ?auto_372997 ) ) ( not ( = ?auto_372989 ?auto_372998 ) ) ( not ( = ?auto_372989 ?auto_372999 ) ) ( not ( = ?auto_372989 ?auto_373000 ) ) ( not ( = ?auto_372990 ?auto_372991 ) ) ( not ( = ?auto_372990 ?auto_372992 ) ) ( not ( = ?auto_372990 ?auto_372993 ) ) ( not ( = ?auto_372990 ?auto_372994 ) ) ( not ( = ?auto_372990 ?auto_372995 ) ) ( not ( = ?auto_372990 ?auto_372996 ) ) ( not ( = ?auto_372990 ?auto_372997 ) ) ( not ( = ?auto_372990 ?auto_372998 ) ) ( not ( = ?auto_372990 ?auto_372999 ) ) ( not ( = ?auto_372990 ?auto_373000 ) ) ( not ( = ?auto_372991 ?auto_372992 ) ) ( not ( = ?auto_372991 ?auto_372993 ) ) ( not ( = ?auto_372991 ?auto_372994 ) ) ( not ( = ?auto_372991 ?auto_372995 ) ) ( not ( = ?auto_372991 ?auto_372996 ) ) ( not ( = ?auto_372991 ?auto_372997 ) ) ( not ( = ?auto_372991 ?auto_372998 ) ) ( not ( = ?auto_372991 ?auto_372999 ) ) ( not ( = ?auto_372991 ?auto_373000 ) ) ( not ( = ?auto_372992 ?auto_372993 ) ) ( not ( = ?auto_372992 ?auto_372994 ) ) ( not ( = ?auto_372992 ?auto_372995 ) ) ( not ( = ?auto_372992 ?auto_372996 ) ) ( not ( = ?auto_372992 ?auto_372997 ) ) ( not ( = ?auto_372992 ?auto_372998 ) ) ( not ( = ?auto_372992 ?auto_372999 ) ) ( not ( = ?auto_372992 ?auto_373000 ) ) ( not ( = ?auto_372993 ?auto_372994 ) ) ( not ( = ?auto_372993 ?auto_372995 ) ) ( not ( = ?auto_372993 ?auto_372996 ) ) ( not ( = ?auto_372993 ?auto_372997 ) ) ( not ( = ?auto_372993 ?auto_372998 ) ) ( not ( = ?auto_372993 ?auto_372999 ) ) ( not ( = ?auto_372993 ?auto_373000 ) ) ( not ( = ?auto_372994 ?auto_372995 ) ) ( not ( = ?auto_372994 ?auto_372996 ) ) ( not ( = ?auto_372994 ?auto_372997 ) ) ( not ( = ?auto_372994 ?auto_372998 ) ) ( not ( = ?auto_372994 ?auto_372999 ) ) ( not ( = ?auto_372994 ?auto_373000 ) ) ( not ( = ?auto_372995 ?auto_372996 ) ) ( not ( = ?auto_372995 ?auto_372997 ) ) ( not ( = ?auto_372995 ?auto_372998 ) ) ( not ( = ?auto_372995 ?auto_372999 ) ) ( not ( = ?auto_372995 ?auto_373000 ) ) ( not ( = ?auto_372996 ?auto_372997 ) ) ( not ( = ?auto_372996 ?auto_372998 ) ) ( not ( = ?auto_372996 ?auto_372999 ) ) ( not ( = ?auto_372996 ?auto_373000 ) ) ( not ( = ?auto_372997 ?auto_372998 ) ) ( not ( = ?auto_372997 ?auto_372999 ) ) ( not ( = ?auto_372997 ?auto_373000 ) ) ( not ( = ?auto_372998 ?auto_372999 ) ) ( not ( = ?auto_372998 ?auto_373000 ) ) ( not ( = ?auto_372999 ?auto_373000 ) ) ( ON ?auto_372998 ?auto_372999 ) ( ON ?auto_372997 ?auto_372998 ) ( ON ?auto_372996 ?auto_372997 ) ( ON ?auto_372995 ?auto_372996 ) ( ON ?auto_372994 ?auto_372995 ) ( CLEAR ?auto_372992 ) ( ON ?auto_372993 ?auto_372994 ) ( CLEAR ?auto_372993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_372989 ?auto_372990 ?auto_372991 ?auto_372992 ?auto_372993 )
      ( MAKE-11PILE ?auto_372989 ?auto_372990 ?auto_372991 ?auto_372992 ?auto_372993 ?auto_372994 ?auto_372995 ?auto_372996 ?auto_372997 ?auto_372998 ?auto_372999 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_373035 - BLOCK
      ?auto_373036 - BLOCK
      ?auto_373037 - BLOCK
      ?auto_373038 - BLOCK
      ?auto_373039 - BLOCK
      ?auto_373040 - BLOCK
      ?auto_373041 - BLOCK
      ?auto_373042 - BLOCK
      ?auto_373043 - BLOCK
      ?auto_373044 - BLOCK
      ?auto_373045 - BLOCK
    )
    :vars
    (
      ?auto_373046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373045 ?auto_373046 ) ( ON-TABLE ?auto_373035 ) ( ON ?auto_373036 ?auto_373035 ) ( ON ?auto_373037 ?auto_373036 ) ( not ( = ?auto_373035 ?auto_373036 ) ) ( not ( = ?auto_373035 ?auto_373037 ) ) ( not ( = ?auto_373035 ?auto_373038 ) ) ( not ( = ?auto_373035 ?auto_373039 ) ) ( not ( = ?auto_373035 ?auto_373040 ) ) ( not ( = ?auto_373035 ?auto_373041 ) ) ( not ( = ?auto_373035 ?auto_373042 ) ) ( not ( = ?auto_373035 ?auto_373043 ) ) ( not ( = ?auto_373035 ?auto_373044 ) ) ( not ( = ?auto_373035 ?auto_373045 ) ) ( not ( = ?auto_373035 ?auto_373046 ) ) ( not ( = ?auto_373036 ?auto_373037 ) ) ( not ( = ?auto_373036 ?auto_373038 ) ) ( not ( = ?auto_373036 ?auto_373039 ) ) ( not ( = ?auto_373036 ?auto_373040 ) ) ( not ( = ?auto_373036 ?auto_373041 ) ) ( not ( = ?auto_373036 ?auto_373042 ) ) ( not ( = ?auto_373036 ?auto_373043 ) ) ( not ( = ?auto_373036 ?auto_373044 ) ) ( not ( = ?auto_373036 ?auto_373045 ) ) ( not ( = ?auto_373036 ?auto_373046 ) ) ( not ( = ?auto_373037 ?auto_373038 ) ) ( not ( = ?auto_373037 ?auto_373039 ) ) ( not ( = ?auto_373037 ?auto_373040 ) ) ( not ( = ?auto_373037 ?auto_373041 ) ) ( not ( = ?auto_373037 ?auto_373042 ) ) ( not ( = ?auto_373037 ?auto_373043 ) ) ( not ( = ?auto_373037 ?auto_373044 ) ) ( not ( = ?auto_373037 ?auto_373045 ) ) ( not ( = ?auto_373037 ?auto_373046 ) ) ( not ( = ?auto_373038 ?auto_373039 ) ) ( not ( = ?auto_373038 ?auto_373040 ) ) ( not ( = ?auto_373038 ?auto_373041 ) ) ( not ( = ?auto_373038 ?auto_373042 ) ) ( not ( = ?auto_373038 ?auto_373043 ) ) ( not ( = ?auto_373038 ?auto_373044 ) ) ( not ( = ?auto_373038 ?auto_373045 ) ) ( not ( = ?auto_373038 ?auto_373046 ) ) ( not ( = ?auto_373039 ?auto_373040 ) ) ( not ( = ?auto_373039 ?auto_373041 ) ) ( not ( = ?auto_373039 ?auto_373042 ) ) ( not ( = ?auto_373039 ?auto_373043 ) ) ( not ( = ?auto_373039 ?auto_373044 ) ) ( not ( = ?auto_373039 ?auto_373045 ) ) ( not ( = ?auto_373039 ?auto_373046 ) ) ( not ( = ?auto_373040 ?auto_373041 ) ) ( not ( = ?auto_373040 ?auto_373042 ) ) ( not ( = ?auto_373040 ?auto_373043 ) ) ( not ( = ?auto_373040 ?auto_373044 ) ) ( not ( = ?auto_373040 ?auto_373045 ) ) ( not ( = ?auto_373040 ?auto_373046 ) ) ( not ( = ?auto_373041 ?auto_373042 ) ) ( not ( = ?auto_373041 ?auto_373043 ) ) ( not ( = ?auto_373041 ?auto_373044 ) ) ( not ( = ?auto_373041 ?auto_373045 ) ) ( not ( = ?auto_373041 ?auto_373046 ) ) ( not ( = ?auto_373042 ?auto_373043 ) ) ( not ( = ?auto_373042 ?auto_373044 ) ) ( not ( = ?auto_373042 ?auto_373045 ) ) ( not ( = ?auto_373042 ?auto_373046 ) ) ( not ( = ?auto_373043 ?auto_373044 ) ) ( not ( = ?auto_373043 ?auto_373045 ) ) ( not ( = ?auto_373043 ?auto_373046 ) ) ( not ( = ?auto_373044 ?auto_373045 ) ) ( not ( = ?auto_373044 ?auto_373046 ) ) ( not ( = ?auto_373045 ?auto_373046 ) ) ( ON ?auto_373044 ?auto_373045 ) ( ON ?auto_373043 ?auto_373044 ) ( ON ?auto_373042 ?auto_373043 ) ( ON ?auto_373041 ?auto_373042 ) ( ON ?auto_373040 ?auto_373041 ) ( ON ?auto_373039 ?auto_373040 ) ( CLEAR ?auto_373037 ) ( ON ?auto_373038 ?auto_373039 ) ( CLEAR ?auto_373038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_373035 ?auto_373036 ?auto_373037 ?auto_373038 )
      ( MAKE-11PILE ?auto_373035 ?auto_373036 ?auto_373037 ?auto_373038 ?auto_373039 ?auto_373040 ?auto_373041 ?auto_373042 ?auto_373043 ?auto_373044 ?auto_373045 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_373081 - BLOCK
      ?auto_373082 - BLOCK
      ?auto_373083 - BLOCK
      ?auto_373084 - BLOCK
      ?auto_373085 - BLOCK
      ?auto_373086 - BLOCK
      ?auto_373087 - BLOCK
      ?auto_373088 - BLOCK
      ?auto_373089 - BLOCK
      ?auto_373090 - BLOCK
      ?auto_373091 - BLOCK
    )
    :vars
    (
      ?auto_373092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373091 ?auto_373092 ) ( ON-TABLE ?auto_373081 ) ( ON ?auto_373082 ?auto_373081 ) ( not ( = ?auto_373081 ?auto_373082 ) ) ( not ( = ?auto_373081 ?auto_373083 ) ) ( not ( = ?auto_373081 ?auto_373084 ) ) ( not ( = ?auto_373081 ?auto_373085 ) ) ( not ( = ?auto_373081 ?auto_373086 ) ) ( not ( = ?auto_373081 ?auto_373087 ) ) ( not ( = ?auto_373081 ?auto_373088 ) ) ( not ( = ?auto_373081 ?auto_373089 ) ) ( not ( = ?auto_373081 ?auto_373090 ) ) ( not ( = ?auto_373081 ?auto_373091 ) ) ( not ( = ?auto_373081 ?auto_373092 ) ) ( not ( = ?auto_373082 ?auto_373083 ) ) ( not ( = ?auto_373082 ?auto_373084 ) ) ( not ( = ?auto_373082 ?auto_373085 ) ) ( not ( = ?auto_373082 ?auto_373086 ) ) ( not ( = ?auto_373082 ?auto_373087 ) ) ( not ( = ?auto_373082 ?auto_373088 ) ) ( not ( = ?auto_373082 ?auto_373089 ) ) ( not ( = ?auto_373082 ?auto_373090 ) ) ( not ( = ?auto_373082 ?auto_373091 ) ) ( not ( = ?auto_373082 ?auto_373092 ) ) ( not ( = ?auto_373083 ?auto_373084 ) ) ( not ( = ?auto_373083 ?auto_373085 ) ) ( not ( = ?auto_373083 ?auto_373086 ) ) ( not ( = ?auto_373083 ?auto_373087 ) ) ( not ( = ?auto_373083 ?auto_373088 ) ) ( not ( = ?auto_373083 ?auto_373089 ) ) ( not ( = ?auto_373083 ?auto_373090 ) ) ( not ( = ?auto_373083 ?auto_373091 ) ) ( not ( = ?auto_373083 ?auto_373092 ) ) ( not ( = ?auto_373084 ?auto_373085 ) ) ( not ( = ?auto_373084 ?auto_373086 ) ) ( not ( = ?auto_373084 ?auto_373087 ) ) ( not ( = ?auto_373084 ?auto_373088 ) ) ( not ( = ?auto_373084 ?auto_373089 ) ) ( not ( = ?auto_373084 ?auto_373090 ) ) ( not ( = ?auto_373084 ?auto_373091 ) ) ( not ( = ?auto_373084 ?auto_373092 ) ) ( not ( = ?auto_373085 ?auto_373086 ) ) ( not ( = ?auto_373085 ?auto_373087 ) ) ( not ( = ?auto_373085 ?auto_373088 ) ) ( not ( = ?auto_373085 ?auto_373089 ) ) ( not ( = ?auto_373085 ?auto_373090 ) ) ( not ( = ?auto_373085 ?auto_373091 ) ) ( not ( = ?auto_373085 ?auto_373092 ) ) ( not ( = ?auto_373086 ?auto_373087 ) ) ( not ( = ?auto_373086 ?auto_373088 ) ) ( not ( = ?auto_373086 ?auto_373089 ) ) ( not ( = ?auto_373086 ?auto_373090 ) ) ( not ( = ?auto_373086 ?auto_373091 ) ) ( not ( = ?auto_373086 ?auto_373092 ) ) ( not ( = ?auto_373087 ?auto_373088 ) ) ( not ( = ?auto_373087 ?auto_373089 ) ) ( not ( = ?auto_373087 ?auto_373090 ) ) ( not ( = ?auto_373087 ?auto_373091 ) ) ( not ( = ?auto_373087 ?auto_373092 ) ) ( not ( = ?auto_373088 ?auto_373089 ) ) ( not ( = ?auto_373088 ?auto_373090 ) ) ( not ( = ?auto_373088 ?auto_373091 ) ) ( not ( = ?auto_373088 ?auto_373092 ) ) ( not ( = ?auto_373089 ?auto_373090 ) ) ( not ( = ?auto_373089 ?auto_373091 ) ) ( not ( = ?auto_373089 ?auto_373092 ) ) ( not ( = ?auto_373090 ?auto_373091 ) ) ( not ( = ?auto_373090 ?auto_373092 ) ) ( not ( = ?auto_373091 ?auto_373092 ) ) ( ON ?auto_373090 ?auto_373091 ) ( ON ?auto_373089 ?auto_373090 ) ( ON ?auto_373088 ?auto_373089 ) ( ON ?auto_373087 ?auto_373088 ) ( ON ?auto_373086 ?auto_373087 ) ( ON ?auto_373085 ?auto_373086 ) ( ON ?auto_373084 ?auto_373085 ) ( CLEAR ?auto_373082 ) ( ON ?auto_373083 ?auto_373084 ) ( CLEAR ?auto_373083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_373081 ?auto_373082 ?auto_373083 )
      ( MAKE-11PILE ?auto_373081 ?auto_373082 ?auto_373083 ?auto_373084 ?auto_373085 ?auto_373086 ?auto_373087 ?auto_373088 ?auto_373089 ?auto_373090 ?auto_373091 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_373127 - BLOCK
      ?auto_373128 - BLOCK
      ?auto_373129 - BLOCK
      ?auto_373130 - BLOCK
      ?auto_373131 - BLOCK
      ?auto_373132 - BLOCK
      ?auto_373133 - BLOCK
      ?auto_373134 - BLOCK
      ?auto_373135 - BLOCK
      ?auto_373136 - BLOCK
      ?auto_373137 - BLOCK
    )
    :vars
    (
      ?auto_373138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373137 ?auto_373138 ) ( ON-TABLE ?auto_373127 ) ( not ( = ?auto_373127 ?auto_373128 ) ) ( not ( = ?auto_373127 ?auto_373129 ) ) ( not ( = ?auto_373127 ?auto_373130 ) ) ( not ( = ?auto_373127 ?auto_373131 ) ) ( not ( = ?auto_373127 ?auto_373132 ) ) ( not ( = ?auto_373127 ?auto_373133 ) ) ( not ( = ?auto_373127 ?auto_373134 ) ) ( not ( = ?auto_373127 ?auto_373135 ) ) ( not ( = ?auto_373127 ?auto_373136 ) ) ( not ( = ?auto_373127 ?auto_373137 ) ) ( not ( = ?auto_373127 ?auto_373138 ) ) ( not ( = ?auto_373128 ?auto_373129 ) ) ( not ( = ?auto_373128 ?auto_373130 ) ) ( not ( = ?auto_373128 ?auto_373131 ) ) ( not ( = ?auto_373128 ?auto_373132 ) ) ( not ( = ?auto_373128 ?auto_373133 ) ) ( not ( = ?auto_373128 ?auto_373134 ) ) ( not ( = ?auto_373128 ?auto_373135 ) ) ( not ( = ?auto_373128 ?auto_373136 ) ) ( not ( = ?auto_373128 ?auto_373137 ) ) ( not ( = ?auto_373128 ?auto_373138 ) ) ( not ( = ?auto_373129 ?auto_373130 ) ) ( not ( = ?auto_373129 ?auto_373131 ) ) ( not ( = ?auto_373129 ?auto_373132 ) ) ( not ( = ?auto_373129 ?auto_373133 ) ) ( not ( = ?auto_373129 ?auto_373134 ) ) ( not ( = ?auto_373129 ?auto_373135 ) ) ( not ( = ?auto_373129 ?auto_373136 ) ) ( not ( = ?auto_373129 ?auto_373137 ) ) ( not ( = ?auto_373129 ?auto_373138 ) ) ( not ( = ?auto_373130 ?auto_373131 ) ) ( not ( = ?auto_373130 ?auto_373132 ) ) ( not ( = ?auto_373130 ?auto_373133 ) ) ( not ( = ?auto_373130 ?auto_373134 ) ) ( not ( = ?auto_373130 ?auto_373135 ) ) ( not ( = ?auto_373130 ?auto_373136 ) ) ( not ( = ?auto_373130 ?auto_373137 ) ) ( not ( = ?auto_373130 ?auto_373138 ) ) ( not ( = ?auto_373131 ?auto_373132 ) ) ( not ( = ?auto_373131 ?auto_373133 ) ) ( not ( = ?auto_373131 ?auto_373134 ) ) ( not ( = ?auto_373131 ?auto_373135 ) ) ( not ( = ?auto_373131 ?auto_373136 ) ) ( not ( = ?auto_373131 ?auto_373137 ) ) ( not ( = ?auto_373131 ?auto_373138 ) ) ( not ( = ?auto_373132 ?auto_373133 ) ) ( not ( = ?auto_373132 ?auto_373134 ) ) ( not ( = ?auto_373132 ?auto_373135 ) ) ( not ( = ?auto_373132 ?auto_373136 ) ) ( not ( = ?auto_373132 ?auto_373137 ) ) ( not ( = ?auto_373132 ?auto_373138 ) ) ( not ( = ?auto_373133 ?auto_373134 ) ) ( not ( = ?auto_373133 ?auto_373135 ) ) ( not ( = ?auto_373133 ?auto_373136 ) ) ( not ( = ?auto_373133 ?auto_373137 ) ) ( not ( = ?auto_373133 ?auto_373138 ) ) ( not ( = ?auto_373134 ?auto_373135 ) ) ( not ( = ?auto_373134 ?auto_373136 ) ) ( not ( = ?auto_373134 ?auto_373137 ) ) ( not ( = ?auto_373134 ?auto_373138 ) ) ( not ( = ?auto_373135 ?auto_373136 ) ) ( not ( = ?auto_373135 ?auto_373137 ) ) ( not ( = ?auto_373135 ?auto_373138 ) ) ( not ( = ?auto_373136 ?auto_373137 ) ) ( not ( = ?auto_373136 ?auto_373138 ) ) ( not ( = ?auto_373137 ?auto_373138 ) ) ( ON ?auto_373136 ?auto_373137 ) ( ON ?auto_373135 ?auto_373136 ) ( ON ?auto_373134 ?auto_373135 ) ( ON ?auto_373133 ?auto_373134 ) ( ON ?auto_373132 ?auto_373133 ) ( ON ?auto_373131 ?auto_373132 ) ( ON ?auto_373130 ?auto_373131 ) ( ON ?auto_373129 ?auto_373130 ) ( CLEAR ?auto_373127 ) ( ON ?auto_373128 ?auto_373129 ) ( CLEAR ?auto_373128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_373127 ?auto_373128 )
      ( MAKE-11PILE ?auto_373127 ?auto_373128 ?auto_373129 ?auto_373130 ?auto_373131 ?auto_373132 ?auto_373133 ?auto_373134 ?auto_373135 ?auto_373136 ?auto_373137 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_373173 - BLOCK
      ?auto_373174 - BLOCK
      ?auto_373175 - BLOCK
      ?auto_373176 - BLOCK
      ?auto_373177 - BLOCK
      ?auto_373178 - BLOCK
      ?auto_373179 - BLOCK
      ?auto_373180 - BLOCK
      ?auto_373181 - BLOCK
      ?auto_373182 - BLOCK
      ?auto_373183 - BLOCK
    )
    :vars
    (
      ?auto_373184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373183 ?auto_373184 ) ( not ( = ?auto_373173 ?auto_373174 ) ) ( not ( = ?auto_373173 ?auto_373175 ) ) ( not ( = ?auto_373173 ?auto_373176 ) ) ( not ( = ?auto_373173 ?auto_373177 ) ) ( not ( = ?auto_373173 ?auto_373178 ) ) ( not ( = ?auto_373173 ?auto_373179 ) ) ( not ( = ?auto_373173 ?auto_373180 ) ) ( not ( = ?auto_373173 ?auto_373181 ) ) ( not ( = ?auto_373173 ?auto_373182 ) ) ( not ( = ?auto_373173 ?auto_373183 ) ) ( not ( = ?auto_373173 ?auto_373184 ) ) ( not ( = ?auto_373174 ?auto_373175 ) ) ( not ( = ?auto_373174 ?auto_373176 ) ) ( not ( = ?auto_373174 ?auto_373177 ) ) ( not ( = ?auto_373174 ?auto_373178 ) ) ( not ( = ?auto_373174 ?auto_373179 ) ) ( not ( = ?auto_373174 ?auto_373180 ) ) ( not ( = ?auto_373174 ?auto_373181 ) ) ( not ( = ?auto_373174 ?auto_373182 ) ) ( not ( = ?auto_373174 ?auto_373183 ) ) ( not ( = ?auto_373174 ?auto_373184 ) ) ( not ( = ?auto_373175 ?auto_373176 ) ) ( not ( = ?auto_373175 ?auto_373177 ) ) ( not ( = ?auto_373175 ?auto_373178 ) ) ( not ( = ?auto_373175 ?auto_373179 ) ) ( not ( = ?auto_373175 ?auto_373180 ) ) ( not ( = ?auto_373175 ?auto_373181 ) ) ( not ( = ?auto_373175 ?auto_373182 ) ) ( not ( = ?auto_373175 ?auto_373183 ) ) ( not ( = ?auto_373175 ?auto_373184 ) ) ( not ( = ?auto_373176 ?auto_373177 ) ) ( not ( = ?auto_373176 ?auto_373178 ) ) ( not ( = ?auto_373176 ?auto_373179 ) ) ( not ( = ?auto_373176 ?auto_373180 ) ) ( not ( = ?auto_373176 ?auto_373181 ) ) ( not ( = ?auto_373176 ?auto_373182 ) ) ( not ( = ?auto_373176 ?auto_373183 ) ) ( not ( = ?auto_373176 ?auto_373184 ) ) ( not ( = ?auto_373177 ?auto_373178 ) ) ( not ( = ?auto_373177 ?auto_373179 ) ) ( not ( = ?auto_373177 ?auto_373180 ) ) ( not ( = ?auto_373177 ?auto_373181 ) ) ( not ( = ?auto_373177 ?auto_373182 ) ) ( not ( = ?auto_373177 ?auto_373183 ) ) ( not ( = ?auto_373177 ?auto_373184 ) ) ( not ( = ?auto_373178 ?auto_373179 ) ) ( not ( = ?auto_373178 ?auto_373180 ) ) ( not ( = ?auto_373178 ?auto_373181 ) ) ( not ( = ?auto_373178 ?auto_373182 ) ) ( not ( = ?auto_373178 ?auto_373183 ) ) ( not ( = ?auto_373178 ?auto_373184 ) ) ( not ( = ?auto_373179 ?auto_373180 ) ) ( not ( = ?auto_373179 ?auto_373181 ) ) ( not ( = ?auto_373179 ?auto_373182 ) ) ( not ( = ?auto_373179 ?auto_373183 ) ) ( not ( = ?auto_373179 ?auto_373184 ) ) ( not ( = ?auto_373180 ?auto_373181 ) ) ( not ( = ?auto_373180 ?auto_373182 ) ) ( not ( = ?auto_373180 ?auto_373183 ) ) ( not ( = ?auto_373180 ?auto_373184 ) ) ( not ( = ?auto_373181 ?auto_373182 ) ) ( not ( = ?auto_373181 ?auto_373183 ) ) ( not ( = ?auto_373181 ?auto_373184 ) ) ( not ( = ?auto_373182 ?auto_373183 ) ) ( not ( = ?auto_373182 ?auto_373184 ) ) ( not ( = ?auto_373183 ?auto_373184 ) ) ( ON ?auto_373182 ?auto_373183 ) ( ON ?auto_373181 ?auto_373182 ) ( ON ?auto_373180 ?auto_373181 ) ( ON ?auto_373179 ?auto_373180 ) ( ON ?auto_373178 ?auto_373179 ) ( ON ?auto_373177 ?auto_373178 ) ( ON ?auto_373176 ?auto_373177 ) ( ON ?auto_373175 ?auto_373176 ) ( ON ?auto_373174 ?auto_373175 ) ( ON ?auto_373173 ?auto_373174 ) ( CLEAR ?auto_373173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_373173 )
      ( MAKE-11PILE ?auto_373173 ?auto_373174 ?auto_373175 ?auto_373176 ?auto_373177 ?auto_373178 ?auto_373179 ?auto_373180 ?auto_373181 ?auto_373182 ?auto_373183 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373220 - BLOCK
      ?auto_373221 - BLOCK
      ?auto_373222 - BLOCK
      ?auto_373223 - BLOCK
      ?auto_373224 - BLOCK
      ?auto_373225 - BLOCK
      ?auto_373226 - BLOCK
      ?auto_373227 - BLOCK
      ?auto_373228 - BLOCK
      ?auto_373229 - BLOCK
      ?auto_373230 - BLOCK
      ?auto_373231 - BLOCK
    )
    :vars
    (
      ?auto_373232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_373230 ) ( ON ?auto_373231 ?auto_373232 ) ( CLEAR ?auto_373231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_373220 ) ( ON ?auto_373221 ?auto_373220 ) ( ON ?auto_373222 ?auto_373221 ) ( ON ?auto_373223 ?auto_373222 ) ( ON ?auto_373224 ?auto_373223 ) ( ON ?auto_373225 ?auto_373224 ) ( ON ?auto_373226 ?auto_373225 ) ( ON ?auto_373227 ?auto_373226 ) ( ON ?auto_373228 ?auto_373227 ) ( ON ?auto_373229 ?auto_373228 ) ( ON ?auto_373230 ?auto_373229 ) ( not ( = ?auto_373220 ?auto_373221 ) ) ( not ( = ?auto_373220 ?auto_373222 ) ) ( not ( = ?auto_373220 ?auto_373223 ) ) ( not ( = ?auto_373220 ?auto_373224 ) ) ( not ( = ?auto_373220 ?auto_373225 ) ) ( not ( = ?auto_373220 ?auto_373226 ) ) ( not ( = ?auto_373220 ?auto_373227 ) ) ( not ( = ?auto_373220 ?auto_373228 ) ) ( not ( = ?auto_373220 ?auto_373229 ) ) ( not ( = ?auto_373220 ?auto_373230 ) ) ( not ( = ?auto_373220 ?auto_373231 ) ) ( not ( = ?auto_373220 ?auto_373232 ) ) ( not ( = ?auto_373221 ?auto_373222 ) ) ( not ( = ?auto_373221 ?auto_373223 ) ) ( not ( = ?auto_373221 ?auto_373224 ) ) ( not ( = ?auto_373221 ?auto_373225 ) ) ( not ( = ?auto_373221 ?auto_373226 ) ) ( not ( = ?auto_373221 ?auto_373227 ) ) ( not ( = ?auto_373221 ?auto_373228 ) ) ( not ( = ?auto_373221 ?auto_373229 ) ) ( not ( = ?auto_373221 ?auto_373230 ) ) ( not ( = ?auto_373221 ?auto_373231 ) ) ( not ( = ?auto_373221 ?auto_373232 ) ) ( not ( = ?auto_373222 ?auto_373223 ) ) ( not ( = ?auto_373222 ?auto_373224 ) ) ( not ( = ?auto_373222 ?auto_373225 ) ) ( not ( = ?auto_373222 ?auto_373226 ) ) ( not ( = ?auto_373222 ?auto_373227 ) ) ( not ( = ?auto_373222 ?auto_373228 ) ) ( not ( = ?auto_373222 ?auto_373229 ) ) ( not ( = ?auto_373222 ?auto_373230 ) ) ( not ( = ?auto_373222 ?auto_373231 ) ) ( not ( = ?auto_373222 ?auto_373232 ) ) ( not ( = ?auto_373223 ?auto_373224 ) ) ( not ( = ?auto_373223 ?auto_373225 ) ) ( not ( = ?auto_373223 ?auto_373226 ) ) ( not ( = ?auto_373223 ?auto_373227 ) ) ( not ( = ?auto_373223 ?auto_373228 ) ) ( not ( = ?auto_373223 ?auto_373229 ) ) ( not ( = ?auto_373223 ?auto_373230 ) ) ( not ( = ?auto_373223 ?auto_373231 ) ) ( not ( = ?auto_373223 ?auto_373232 ) ) ( not ( = ?auto_373224 ?auto_373225 ) ) ( not ( = ?auto_373224 ?auto_373226 ) ) ( not ( = ?auto_373224 ?auto_373227 ) ) ( not ( = ?auto_373224 ?auto_373228 ) ) ( not ( = ?auto_373224 ?auto_373229 ) ) ( not ( = ?auto_373224 ?auto_373230 ) ) ( not ( = ?auto_373224 ?auto_373231 ) ) ( not ( = ?auto_373224 ?auto_373232 ) ) ( not ( = ?auto_373225 ?auto_373226 ) ) ( not ( = ?auto_373225 ?auto_373227 ) ) ( not ( = ?auto_373225 ?auto_373228 ) ) ( not ( = ?auto_373225 ?auto_373229 ) ) ( not ( = ?auto_373225 ?auto_373230 ) ) ( not ( = ?auto_373225 ?auto_373231 ) ) ( not ( = ?auto_373225 ?auto_373232 ) ) ( not ( = ?auto_373226 ?auto_373227 ) ) ( not ( = ?auto_373226 ?auto_373228 ) ) ( not ( = ?auto_373226 ?auto_373229 ) ) ( not ( = ?auto_373226 ?auto_373230 ) ) ( not ( = ?auto_373226 ?auto_373231 ) ) ( not ( = ?auto_373226 ?auto_373232 ) ) ( not ( = ?auto_373227 ?auto_373228 ) ) ( not ( = ?auto_373227 ?auto_373229 ) ) ( not ( = ?auto_373227 ?auto_373230 ) ) ( not ( = ?auto_373227 ?auto_373231 ) ) ( not ( = ?auto_373227 ?auto_373232 ) ) ( not ( = ?auto_373228 ?auto_373229 ) ) ( not ( = ?auto_373228 ?auto_373230 ) ) ( not ( = ?auto_373228 ?auto_373231 ) ) ( not ( = ?auto_373228 ?auto_373232 ) ) ( not ( = ?auto_373229 ?auto_373230 ) ) ( not ( = ?auto_373229 ?auto_373231 ) ) ( not ( = ?auto_373229 ?auto_373232 ) ) ( not ( = ?auto_373230 ?auto_373231 ) ) ( not ( = ?auto_373230 ?auto_373232 ) ) ( not ( = ?auto_373231 ?auto_373232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_373231 ?auto_373232 )
      ( !STACK ?auto_373231 ?auto_373230 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373270 - BLOCK
      ?auto_373271 - BLOCK
      ?auto_373272 - BLOCK
      ?auto_373273 - BLOCK
      ?auto_373274 - BLOCK
      ?auto_373275 - BLOCK
      ?auto_373276 - BLOCK
      ?auto_373277 - BLOCK
      ?auto_373278 - BLOCK
      ?auto_373279 - BLOCK
      ?auto_373280 - BLOCK
      ?auto_373281 - BLOCK
    )
    :vars
    (
      ?auto_373282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373281 ?auto_373282 ) ( ON-TABLE ?auto_373270 ) ( ON ?auto_373271 ?auto_373270 ) ( ON ?auto_373272 ?auto_373271 ) ( ON ?auto_373273 ?auto_373272 ) ( ON ?auto_373274 ?auto_373273 ) ( ON ?auto_373275 ?auto_373274 ) ( ON ?auto_373276 ?auto_373275 ) ( ON ?auto_373277 ?auto_373276 ) ( ON ?auto_373278 ?auto_373277 ) ( ON ?auto_373279 ?auto_373278 ) ( not ( = ?auto_373270 ?auto_373271 ) ) ( not ( = ?auto_373270 ?auto_373272 ) ) ( not ( = ?auto_373270 ?auto_373273 ) ) ( not ( = ?auto_373270 ?auto_373274 ) ) ( not ( = ?auto_373270 ?auto_373275 ) ) ( not ( = ?auto_373270 ?auto_373276 ) ) ( not ( = ?auto_373270 ?auto_373277 ) ) ( not ( = ?auto_373270 ?auto_373278 ) ) ( not ( = ?auto_373270 ?auto_373279 ) ) ( not ( = ?auto_373270 ?auto_373280 ) ) ( not ( = ?auto_373270 ?auto_373281 ) ) ( not ( = ?auto_373270 ?auto_373282 ) ) ( not ( = ?auto_373271 ?auto_373272 ) ) ( not ( = ?auto_373271 ?auto_373273 ) ) ( not ( = ?auto_373271 ?auto_373274 ) ) ( not ( = ?auto_373271 ?auto_373275 ) ) ( not ( = ?auto_373271 ?auto_373276 ) ) ( not ( = ?auto_373271 ?auto_373277 ) ) ( not ( = ?auto_373271 ?auto_373278 ) ) ( not ( = ?auto_373271 ?auto_373279 ) ) ( not ( = ?auto_373271 ?auto_373280 ) ) ( not ( = ?auto_373271 ?auto_373281 ) ) ( not ( = ?auto_373271 ?auto_373282 ) ) ( not ( = ?auto_373272 ?auto_373273 ) ) ( not ( = ?auto_373272 ?auto_373274 ) ) ( not ( = ?auto_373272 ?auto_373275 ) ) ( not ( = ?auto_373272 ?auto_373276 ) ) ( not ( = ?auto_373272 ?auto_373277 ) ) ( not ( = ?auto_373272 ?auto_373278 ) ) ( not ( = ?auto_373272 ?auto_373279 ) ) ( not ( = ?auto_373272 ?auto_373280 ) ) ( not ( = ?auto_373272 ?auto_373281 ) ) ( not ( = ?auto_373272 ?auto_373282 ) ) ( not ( = ?auto_373273 ?auto_373274 ) ) ( not ( = ?auto_373273 ?auto_373275 ) ) ( not ( = ?auto_373273 ?auto_373276 ) ) ( not ( = ?auto_373273 ?auto_373277 ) ) ( not ( = ?auto_373273 ?auto_373278 ) ) ( not ( = ?auto_373273 ?auto_373279 ) ) ( not ( = ?auto_373273 ?auto_373280 ) ) ( not ( = ?auto_373273 ?auto_373281 ) ) ( not ( = ?auto_373273 ?auto_373282 ) ) ( not ( = ?auto_373274 ?auto_373275 ) ) ( not ( = ?auto_373274 ?auto_373276 ) ) ( not ( = ?auto_373274 ?auto_373277 ) ) ( not ( = ?auto_373274 ?auto_373278 ) ) ( not ( = ?auto_373274 ?auto_373279 ) ) ( not ( = ?auto_373274 ?auto_373280 ) ) ( not ( = ?auto_373274 ?auto_373281 ) ) ( not ( = ?auto_373274 ?auto_373282 ) ) ( not ( = ?auto_373275 ?auto_373276 ) ) ( not ( = ?auto_373275 ?auto_373277 ) ) ( not ( = ?auto_373275 ?auto_373278 ) ) ( not ( = ?auto_373275 ?auto_373279 ) ) ( not ( = ?auto_373275 ?auto_373280 ) ) ( not ( = ?auto_373275 ?auto_373281 ) ) ( not ( = ?auto_373275 ?auto_373282 ) ) ( not ( = ?auto_373276 ?auto_373277 ) ) ( not ( = ?auto_373276 ?auto_373278 ) ) ( not ( = ?auto_373276 ?auto_373279 ) ) ( not ( = ?auto_373276 ?auto_373280 ) ) ( not ( = ?auto_373276 ?auto_373281 ) ) ( not ( = ?auto_373276 ?auto_373282 ) ) ( not ( = ?auto_373277 ?auto_373278 ) ) ( not ( = ?auto_373277 ?auto_373279 ) ) ( not ( = ?auto_373277 ?auto_373280 ) ) ( not ( = ?auto_373277 ?auto_373281 ) ) ( not ( = ?auto_373277 ?auto_373282 ) ) ( not ( = ?auto_373278 ?auto_373279 ) ) ( not ( = ?auto_373278 ?auto_373280 ) ) ( not ( = ?auto_373278 ?auto_373281 ) ) ( not ( = ?auto_373278 ?auto_373282 ) ) ( not ( = ?auto_373279 ?auto_373280 ) ) ( not ( = ?auto_373279 ?auto_373281 ) ) ( not ( = ?auto_373279 ?auto_373282 ) ) ( not ( = ?auto_373280 ?auto_373281 ) ) ( not ( = ?auto_373280 ?auto_373282 ) ) ( not ( = ?auto_373281 ?auto_373282 ) ) ( CLEAR ?auto_373279 ) ( ON ?auto_373280 ?auto_373281 ) ( CLEAR ?auto_373280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_373270 ?auto_373271 ?auto_373272 ?auto_373273 ?auto_373274 ?auto_373275 ?auto_373276 ?auto_373277 ?auto_373278 ?auto_373279 ?auto_373280 )
      ( MAKE-12PILE ?auto_373270 ?auto_373271 ?auto_373272 ?auto_373273 ?auto_373274 ?auto_373275 ?auto_373276 ?auto_373277 ?auto_373278 ?auto_373279 ?auto_373280 ?auto_373281 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373320 - BLOCK
      ?auto_373321 - BLOCK
      ?auto_373322 - BLOCK
      ?auto_373323 - BLOCK
      ?auto_373324 - BLOCK
      ?auto_373325 - BLOCK
      ?auto_373326 - BLOCK
      ?auto_373327 - BLOCK
      ?auto_373328 - BLOCK
      ?auto_373329 - BLOCK
      ?auto_373330 - BLOCK
      ?auto_373331 - BLOCK
    )
    :vars
    (
      ?auto_373332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373331 ?auto_373332 ) ( ON-TABLE ?auto_373320 ) ( ON ?auto_373321 ?auto_373320 ) ( ON ?auto_373322 ?auto_373321 ) ( ON ?auto_373323 ?auto_373322 ) ( ON ?auto_373324 ?auto_373323 ) ( ON ?auto_373325 ?auto_373324 ) ( ON ?auto_373326 ?auto_373325 ) ( ON ?auto_373327 ?auto_373326 ) ( ON ?auto_373328 ?auto_373327 ) ( not ( = ?auto_373320 ?auto_373321 ) ) ( not ( = ?auto_373320 ?auto_373322 ) ) ( not ( = ?auto_373320 ?auto_373323 ) ) ( not ( = ?auto_373320 ?auto_373324 ) ) ( not ( = ?auto_373320 ?auto_373325 ) ) ( not ( = ?auto_373320 ?auto_373326 ) ) ( not ( = ?auto_373320 ?auto_373327 ) ) ( not ( = ?auto_373320 ?auto_373328 ) ) ( not ( = ?auto_373320 ?auto_373329 ) ) ( not ( = ?auto_373320 ?auto_373330 ) ) ( not ( = ?auto_373320 ?auto_373331 ) ) ( not ( = ?auto_373320 ?auto_373332 ) ) ( not ( = ?auto_373321 ?auto_373322 ) ) ( not ( = ?auto_373321 ?auto_373323 ) ) ( not ( = ?auto_373321 ?auto_373324 ) ) ( not ( = ?auto_373321 ?auto_373325 ) ) ( not ( = ?auto_373321 ?auto_373326 ) ) ( not ( = ?auto_373321 ?auto_373327 ) ) ( not ( = ?auto_373321 ?auto_373328 ) ) ( not ( = ?auto_373321 ?auto_373329 ) ) ( not ( = ?auto_373321 ?auto_373330 ) ) ( not ( = ?auto_373321 ?auto_373331 ) ) ( not ( = ?auto_373321 ?auto_373332 ) ) ( not ( = ?auto_373322 ?auto_373323 ) ) ( not ( = ?auto_373322 ?auto_373324 ) ) ( not ( = ?auto_373322 ?auto_373325 ) ) ( not ( = ?auto_373322 ?auto_373326 ) ) ( not ( = ?auto_373322 ?auto_373327 ) ) ( not ( = ?auto_373322 ?auto_373328 ) ) ( not ( = ?auto_373322 ?auto_373329 ) ) ( not ( = ?auto_373322 ?auto_373330 ) ) ( not ( = ?auto_373322 ?auto_373331 ) ) ( not ( = ?auto_373322 ?auto_373332 ) ) ( not ( = ?auto_373323 ?auto_373324 ) ) ( not ( = ?auto_373323 ?auto_373325 ) ) ( not ( = ?auto_373323 ?auto_373326 ) ) ( not ( = ?auto_373323 ?auto_373327 ) ) ( not ( = ?auto_373323 ?auto_373328 ) ) ( not ( = ?auto_373323 ?auto_373329 ) ) ( not ( = ?auto_373323 ?auto_373330 ) ) ( not ( = ?auto_373323 ?auto_373331 ) ) ( not ( = ?auto_373323 ?auto_373332 ) ) ( not ( = ?auto_373324 ?auto_373325 ) ) ( not ( = ?auto_373324 ?auto_373326 ) ) ( not ( = ?auto_373324 ?auto_373327 ) ) ( not ( = ?auto_373324 ?auto_373328 ) ) ( not ( = ?auto_373324 ?auto_373329 ) ) ( not ( = ?auto_373324 ?auto_373330 ) ) ( not ( = ?auto_373324 ?auto_373331 ) ) ( not ( = ?auto_373324 ?auto_373332 ) ) ( not ( = ?auto_373325 ?auto_373326 ) ) ( not ( = ?auto_373325 ?auto_373327 ) ) ( not ( = ?auto_373325 ?auto_373328 ) ) ( not ( = ?auto_373325 ?auto_373329 ) ) ( not ( = ?auto_373325 ?auto_373330 ) ) ( not ( = ?auto_373325 ?auto_373331 ) ) ( not ( = ?auto_373325 ?auto_373332 ) ) ( not ( = ?auto_373326 ?auto_373327 ) ) ( not ( = ?auto_373326 ?auto_373328 ) ) ( not ( = ?auto_373326 ?auto_373329 ) ) ( not ( = ?auto_373326 ?auto_373330 ) ) ( not ( = ?auto_373326 ?auto_373331 ) ) ( not ( = ?auto_373326 ?auto_373332 ) ) ( not ( = ?auto_373327 ?auto_373328 ) ) ( not ( = ?auto_373327 ?auto_373329 ) ) ( not ( = ?auto_373327 ?auto_373330 ) ) ( not ( = ?auto_373327 ?auto_373331 ) ) ( not ( = ?auto_373327 ?auto_373332 ) ) ( not ( = ?auto_373328 ?auto_373329 ) ) ( not ( = ?auto_373328 ?auto_373330 ) ) ( not ( = ?auto_373328 ?auto_373331 ) ) ( not ( = ?auto_373328 ?auto_373332 ) ) ( not ( = ?auto_373329 ?auto_373330 ) ) ( not ( = ?auto_373329 ?auto_373331 ) ) ( not ( = ?auto_373329 ?auto_373332 ) ) ( not ( = ?auto_373330 ?auto_373331 ) ) ( not ( = ?auto_373330 ?auto_373332 ) ) ( not ( = ?auto_373331 ?auto_373332 ) ) ( ON ?auto_373330 ?auto_373331 ) ( CLEAR ?auto_373328 ) ( ON ?auto_373329 ?auto_373330 ) ( CLEAR ?auto_373329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_373320 ?auto_373321 ?auto_373322 ?auto_373323 ?auto_373324 ?auto_373325 ?auto_373326 ?auto_373327 ?auto_373328 ?auto_373329 )
      ( MAKE-12PILE ?auto_373320 ?auto_373321 ?auto_373322 ?auto_373323 ?auto_373324 ?auto_373325 ?auto_373326 ?auto_373327 ?auto_373328 ?auto_373329 ?auto_373330 ?auto_373331 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373370 - BLOCK
      ?auto_373371 - BLOCK
      ?auto_373372 - BLOCK
      ?auto_373373 - BLOCK
      ?auto_373374 - BLOCK
      ?auto_373375 - BLOCK
      ?auto_373376 - BLOCK
      ?auto_373377 - BLOCK
      ?auto_373378 - BLOCK
      ?auto_373379 - BLOCK
      ?auto_373380 - BLOCK
      ?auto_373381 - BLOCK
    )
    :vars
    (
      ?auto_373382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373381 ?auto_373382 ) ( ON-TABLE ?auto_373370 ) ( ON ?auto_373371 ?auto_373370 ) ( ON ?auto_373372 ?auto_373371 ) ( ON ?auto_373373 ?auto_373372 ) ( ON ?auto_373374 ?auto_373373 ) ( ON ?auto_373375 ?auto_373374 ) ( ON ?auto_373376 ?auto_373375 ) ( ON ?auto_373377 ?auto_373376 ) ( not ( = ?auto_373370 ?auto_373371 ) ) ( not ( = ?auto_373370 ?auto_373372 ) ) ( not ( = ?auto_373370 ?auto_373373 ) ) ( not ( = ?auto_373370 ?auto_373374 ) ) ( not ( = ?auto_373370 ?auto_373375 ) ) ( not ( = ?auto_373370 ?auto_373376 ) ) ( not ( = ?auto_373370 ?auto_373377 ) ) ( not ( = ?auto_373370 ?auto_373378 ) ) ( not ( = ?auto_373370 ?auto_373379 ) ) ( not ( = ?auto_373370 ?auto_373380 ) ) ( not ( = ?auto_373370 ?auto_373381 ) ) ( not ( = ?auto_373370 ?auto_373382 ) ) ( not ( = ?auto_373371 ?auto_373372 ) ) ( not ( = ?auto_373371 ?auto_373373 ) ) ( not ( = ?auto_373371 ?auto_373374 ) ) ( not ( = ?auto_373371 ?auto_373375 ) ) ( not ( = ?auto_373371 ?auto_373376 ) ) ( not ( = ?auto_373371 ?auto_373377 ) ) ( not ( = ?auto_373371 ?auto_373378 ) ) ( not ( = ?auto_373371 ?auto_373379 ) ) ( not ( = ?auto_373371 ?auto_373380 ) ) ( not ( = ?auto_373371 ?auto_373381 ) ) ( not ( = ?auto_373371 ?auto_373382 ) ) ( not ( = ?auto_373372 ?auto_373373 ) ) ( not ( = ?auto_373372 ?auto_373374 ) ) ( not ( = ?auto_373372 ?auto_373375 ) ) ( not ( = ?auto_373372 ?auto_373376 ) ) ( not ( = ?auto_373372 ?auto_373377 ) ) ( not ( = ?auto_373372 ?auto_373378 ) ) ( not ( = ?auto_373372 ?auto_373379 ) ) ( not ( = ?auto_373372 ?auto_373380 ) ) ( not ( = ?auto_373372 ?auto_373381 ) ) ( not ( = ?auto_373372 ?auto_373382 ) ) ( not ( = ?auto_373373 ?auto_373374 ) ) ( not ( = ?auto_373373 ?auto_373375 ) ) ( not ( = ?auto_373373 ?auto_373376 ) ) ( not ( = ?auto_373373 ?auto_373377 ) ) ( not ( = ?auto_373373 ?auto_373378 ) ) ( not ( = ?auto_373373 ?auto_373379 ) ) ( not ( = ?auto_373373 ?auto_373380 ) ) ( not ( = ?auto_373373 ?auto_373381 ) ) ( not ( = ?auto_373373 ?auto_373382 ) ) ( not ( = ?auto_373374 ?auto_373375 ) ) ( not ( = ?auto_373374 ?auto_373376 ) ) ( not ( = ?auto_373374 ?auto_373377 ) ) ( not ( = ?auto_373374 ?auto_373378 ) ) ( not ( = ?auto_373374 ?auto_373379 ) ) ( not ( = ?auto_373374 ?auto_373380 ) ) ( not ( = ?auto_373374 ?auto_373381 ) ) ( not ( = ?auto_373374 ?auto_373382 ) ) ( not ( = ?auto_373375 ?auto_373376 ) ) ( not ( = ?auto_373375 ?auto_373377 ) ) ( not ( = ?auto_373375 ?auto_373378 ) ) ( not ( = ?auto_373375 ?auto_373379 ) ) ( not ( = ?auto_373375 ?auto_373380 ) ) ( not ( = ?auto_373375 ?auto_373381 ) ) ( not ( = ?auto_373375 ?auto_373382 ) ) ( not ( = ?auto_373376 ?auto_373377 ) ) ( not ( = ?auto_373376 ?auto_373378 ) ) ( not ( = ?auto_373376 ?auto_373379 ) ) ( not ( = ?auto_373376 ?auto_373380 ) ) ( not ( = ?auto_373376 ?auto_373381 ) ) ( not ( = ?auto_373376 ?auto_373382 ) ) ( not ( = ?auto_373377 ?auto_373378 ) ) ( not ( = ?auto_373377 ?auto_373379 ) ) ( not ( = ?auto_373377 ?auto_373380 ) ) ( not ( = ?auto_373377 ?auto_373381 ) ) ( not ( = ?auto_373377 ?auto_373382 ) ) ( not ( = ?auto_373378 ?auto_373379 ) ) ( not ( = ?auto_373378 ?auto_373380 ) ) ( not ( = ?auto_373378 ?auto_373381 ) ) ( not ( = ?auto_373378 ?auto_373382 ) ) ( not ( = ?auto_373379 ?auto_373380 ) ) ( not ( = ?auto_373379 ?auto_373381 ) ) ( not ( = ?auto_373379 ?auto_373382 ) ) ( not ( = ?auto_373380 ?auto_373381 ) ) ( not ( = ?auto_373380 ?auto_373382 ) ) ( not ( = ?auto_373381 ?auto_373382 ) ) ( ON ?auto_373380 ?auto_373381 ) ( ON ?auto_373379 ?auto_373380 ) ( CLEAR ?auto_373377 ) ( ON ?auto_373378 ?auto_373379 ) ( CLEAR ?auto_373378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_373370 ?auto_373371 ?auto_373372 ?auto_373373 ?auto_373374 ?auto_373375 ?auto_373376 ?auto_373377 ?auto_373378 )
      ( MAKE-12PILE ?auto_373370 ?auto_373371 ?auto_373372 ?auto_373373 ?auto_373374 ?auto_373375 ?auto_373376 ?auto_373377 ?auto_373378 ?auto_373379 ?auto_373380 ?auto_373381 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373420 - BLOCK
      ?auto_373421 - BLOCK
      ?auto_373422 - BLOCK
      ?auto_373423 - BLOCK
      ?auto_373424 - BLOCK
      ?auto_373425 - BLOCK
      ?auto_373426 - BLOCK
      ?auto_373427 - BLOCK
      ?auto_373428 - BLOCK
      ?auto_373429 - BLOCK
      ?auto_373430 - BLOCK
      ?auto_373431 - BLOCK
    )
    :vars
    (
      ?auto_373432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373431 ?auto_373432 ) ( ON-TABLE ?auto_373420 ) ( ON ?auto_373421 ?auto_373420 ) ( ON ?auto_373422 ?auto_373421 ) ( ON ?auto_373423 ?auto_373422 ) ( ON ?auto_373424 ?auto_373423 ) ( ON ?auto_373425 ?auto_373424 ) ( ON ?auto_373426 ?auto_373425 ) ( not ( = ?auto_373420 ?auto_373421 ) ) ( not ( = ?auto_373420 ?auto_373422 ) ) ( not ( = ?auto_373420 ?auto_373423 ) ) ( not ( = ?auto_373420 ?auto_373424 ) ) ( not ( = ?auto_373420 ?auto_373425 ) ) ( not ( = ?auto_373420 ?auto_373426 ) ) ( not ( = ?auto_373420 ?auto_373427 ) ) ( not ( = ?auto_373420 ?auto_373428 ) ) ( not ( = ?auto_373420 ?auto_373429 ) ) ( not ( = ?auto_373420 ?auto_373430 ) ) ( not ( = ?auto_373420 ?auto_373431 ) ) ( not ( = ?auto_373420 ?auto_373432 ) ) ( not ( = ?auto_373421 ?auto_373422 ) ) ( not ( = ?auto_373421 ?auto_373423 ) ) ( not ( = ?auto_373421 ?auto_373424 ) ) ( not ( = ?auto_373421 ?auto_373425 ) ) ( not ( = ?auto_373421 ?auto_373426 ) ) ( not ( = ?auto_373421 ?auto_373427 ) ) ( not ( = ?auto_373421 ?auto_373428 ) ) ( not ( = ?auto_373421 ?auto_373429 ) ) ( not ( = ?auto_373421 ?auto_373430 ) ) ( not ( = ?auto_373421 ?auto_373431 ) ) ( not ( = ?auto_373421 ?auto_373432 ) ) ( not ( = ?auto_373422 ?auto_373423 ) ) ( not ( = ?auto_373422 ?auto_373424 ) ) ( not ( = ?auto_373422 ?auto_373425 ) ) ( not ( = ?auto_373422 ?auto_373426 ) ) ( not ( = ?auto_373422 ?auto_373427 ) ) ( not ( = ?auto_373422 ?auto_373428 ) ) ( not ( = ?auto_373422 ?auto_373429 ) ) ( not ( = ?auto_373422 ?auto_373430 ) ) ( not ( = ?auto_373422 ?auto_373431 ) ) ( not ( = ?auto_373422 ?auto_373432 ) ) ( not ( = ?auto_373423 ?auto_373424 ) ) ( not ( = ?auto_373423 ?auto_373425 ) ) ( not ( = ?auto_373423 ?auto_373426 ) ) ( not ( = ?auto_373423 ?auto_373427 ) ) ( not ( = ?auto_373423 ?auto_373428 ) ) ( not ( = ?auto_373423 ?auto_373429 ) ) ( not ( = ?auto_373423 ?auto_373430 ) ) ( not ( = ?auto_373423 ?auto_373431 ) ) ( not ( = ?auto_373423 ?auto_373432 ) ) ( not ( = ?auto_373424 ?auto_373425 ) ) ( not ( = ?auto_373424 ?auto_373426 ) ) ( not ( = ?auto_373424 ?auto_373427 ) ) ( not ( = ?auto_373424 ?auto_373428 ) ) ( not ( = ?auto_373424 ?auto_373429 ) ) ( not ( = ?auto_373424 ?auto_373430 ) ) ( not ( = ?auto_373424 ?auto_373431 ) ) ( not ( = ?auto_373424 ?auto_373432 ) ) ( not ( = ?auto_373425 ?auto_373426 ) ) ( not ( = ?auto_373425 ?auto_373427 ) ) ( not ( = ?auto_373425 ?auto_373428 ) ) ( not ( = ?auto_373425 ?auto_373429 ) ) ( not ( = ?auto_373425 ?auto_373430 ) ) ( not ( = ?auto_373425 ?auto_373431 ) ) ( not ( = ?auto_373425 ?auto_373432 ) ) ( not ( = ?auto_373426 ?auto_373427 ) ) ( not ( = ?auto_373426 ?auto_373428 ) ) ( not ( = ?auto_373426 ?auto_373429 ) ) ( not ( = ?auto_373426 ?auto_373430 ) ) ( not ( = ?auto_373426 ?auto_373431 ) ) ( not ( = ?auto_373426 ?auto_373432 ) ) ( not ( = ?auto_373427 ?auto_373428 ) ) ( not ( = ?auto_373427 ?auto_373429 ) ) ( not ( = ?auto_373427 ?auto_373430 ) ) ( not ( = ?auto_373427 ?auto_373431 ) ) ( not ( = ?auto_373427 ?auto_373432 ) ) ( not ( = ?auto_373428 ?auto_373429 ) ) ( not ( = ?auto_373428 ?auto_373430 ) ) ( not ( = ?auto_373428 ?auto_373431 ) ) ( not ( = ?auto_373428 ?auto_373432 ) ) ( not ( = ?auto_373429 ?auto_373430 ) ) ( not ( = ?auto_373429 ?auto_373431 ) ) ( not ( = ?auto_373429 ?auto_373432 ) ) ( not ( = ?auto_373430 ?auto_373431 ) ) ( not ( = ?auto_373430 ?auto_373432 ) ) ( not ( = ?auto_373431 ?auto_373432 ) ) ( ON ?auto_373430 ?auto_373431 ) ( ON ?auto_373429 ?auto_373430 ) ( ON ?auto_373428 ?auto_373429 ) ( CLEAR ?auto_373426 ) ( ON ?auto_373427 ?auto_373428 ) ( CLEAR ?auto_373427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_373420 ?auto_373421 ?auto_373422 ?auto_373423 ?auto_373424 ?auto_373425 ?auto_373426 ?auto_373427 )
      ( MAKE-12PILE ?auto_373420 ?auto_373421 ?auto_373422 ?auto_373423 ?auto_373424 ?auto_373425 ?auto_373426 ?auto_373427 ?auto_373428 ?auto_373429 ?auto_373430 ?auto_373431 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373470 - BLOCK
      ?auto_373471 - BLOCK
      ?auto_373472 - BLOCK
      ?auto_373473 - BLOCK
      ?auto_373474 - BLOCK
      ?auto_373475 - BLOCK
      ?auto_373476 - BLOCK
      ?auto_373477 - BLOCK
      ?auto_373478 - BLOCK
      ?auto_373479 - BLOCK
      ?auto_373480 - BLOCK
      ?auto_373481 - BLOCK
    )
    :vars
    (
      ?auto_373482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373481 ?auto_373482 ) ( ON-TABLE ?auto_373470 ) ( ON ?auto_373471 ?auto_373470 ) ( ON ?auto_373472 ?auto_373471 ) ( ON ?auto_373473 ?auto_373472 ) ( ON ?auto_373474 ?auto_373473 ) ( ON ?auto_373475 ?auto_373474 ) ( not ( = ?auto_373470 ?auto_373471 ) ) ( not ( = ?auto_373470 ?auto_373472 ) ) ( not ( = ?auto_373470 ?auto_373473 ) ) ( not ( = ?auto_373470 ?auto_373474 ) ) ( not ( = ?auto_373470 ?auto_373475 ) ) ( not ( = ?auto_373470 ?auto_373476 ) ) ( not ( = ?auto_373470 ?auto_373477 ) ) ( not ( = ?auto_373470 ?auto_373478 ) ) ( not ( = ?auto_373470 ?auto_373479 ) ) ( not ( = ?auto_373470 ?auto_373480 ) ) ( not ( = ?auto_373470 ?auto_373481 ) ) ( not ( = ?auto_373470 ?auto_373482 ) ) ( not ( = ?auto_373471 ?auto_373472 ) ) ( not ( = ?auto_373471 ?auto_373473 ) ) ( not ( = ?auto_373471 ?auto_373474 ) ) ( not ( = ?auto_373471 ?auto_373475 ) ) ( not ( = ?auto_373471 ?auto_373476 ) ) ( not ( = ?auto_373471 ?auto_373477 ) ) ( not ( = ?auto_373471 ?auto_373478 ) ) ( not ( = ?auto_373471 ?auto_373479 ) ) ( not ( = ?auto_373471 ?auto_373480 ) ) ( not ( = ?auto_373471 ?auto_373481 ) ) ( not ( = ?auto_373471 ?auto_373482 ) ) ( not ( = ?auto_373472 ?auto_373473 ) ) ( not ( = ?auto_373472 ?auto_373474 ) ) ( not ( = ?auto_373472 ?auto_373475 ) ) ( not ( = ?auto_373472 ?auto_373476 ) ) ( not ( = ?auto_373472 ?auto_373477 ) ) ( not ( = ?auto_373472 ?auto_373478 ) ) ( not ( = ?auto_373472 ?auto_373479 ) ) ( not ( = ?auto_373472 ?auto_373480 ) ) ( not ( = ?auto_373472 ?auto_373481 ) ) ( not ( = ?auto_373472 ?auto_373482 ) ) ( not ( = ?auto_373473 ?auto_373474 ) ) ( not ( = ?auto_373473 ?auto_373475 ) ) ( not ( = ?auto_373473 ?auto_373476 ) ) ( not ( = ?auto_373473 ?auto_373477 ) ) ( not ( = ?auto_373473 ?auto_373478 ) ) ( not ( = ?auto_373473 ?auto_373479 ) ) ( not ( = ?auto_373473 ?auto_373480 ) ) ( not ( = ?auto_373473 ?auto_373481 ) ) ( not ( = ?auto_373473 ?auto_373482 ) ) ( not ( = ?auto_373474 ?auto_373475 ) ) ( not ( = ?auto_373474 ?auto_373476 ) ) ( not ( = ?auto_373474 ?auto_373477 ) ) ( not ( = ?auto_373474 ?auto_373478 ) ) ( not ( = ?auto_373474 ?auto_373479 ) ) ( not ( = ?auto_373474 ?auto_373480 ) ) ( not ( = ?auto_373474 ?auto_373481 ) ) ( not ( = ?auto_373474 ?auto_373482 ) ) ( not ( = ?auto_373475 ?auto_373476 ) ) ( not ( = ?auto_373475 ?auto_373477 ) ) ( not ( = ?auto_373475 ?auto_373478 ) ) ( not ( = ?auto_373475 ?auto_373479 ) ) ( not ( = ?auto_373475 ?auto_373480 ) ) ( not ( = ?auto_373475 ?auto_373481 ) ) ( not ( = ?auto_373475 ?auto_373482 ) ) ( not ( = ?auto_373476 ?auto_373477 ) ) ( not ( = ?auto_373476 ?auto_373478 ) ) ( not ( = ?auto_373476 ?auto_373479 ) ) ( not ( = ?auto_373476 ?auto_373480 ) ) ( not ( = ?auto_373476 ?auto_373481 ) ) ( not ( = ?auto_373476 ?auto_373482 ) ) ( not ( = ?auto_373477 ?auto_373478 ) ) ( not ( = ?auto_373477 ?auto_373479 ) ) ( not ( = ?auto_373477 ?auto_373480 ) ) ( not ( = ?auto_373477 ?auto_373481 ) ) ( not ( = ?auto_373477 ?auto_373482 ) ) ( not ( = ?auto_373478 ?auto_373479 ) ) ( not ( = ?auto_373478 ?auto_373480 ) ) ( not ( = ?auto_373478 ?auto_373481 ) ) ( not ( = ?auto_373478 ?auto_373482 ) ) ( not ( = ?auto_373479 ?auto_373480 ) ) ( not ( = ?auto_373479 ?auto_373481 ) ) ( not ( = ?auto_373479 ?auto_373482 ) ) ( not ( = ?auto_373480 ?auto_373481 ) ) ( not ( = ?auto_373480 ?auto_373482 ) ) ( not ( = ?auto_373481 ?auto_373482 ) ) ( ON ?auto_373480 ?auto_373481 ) ( ON ?auto_373479 ?auto_373480 ) ( ON ?auto_373478 ?auto_373479 ) ( ON ?auto_373477 ?auto_373478 ) ( CLEAR ?auto_373475 ) ( ON ?auto_373476 ?auto_373477 ) ( CLEAR ?auto_373476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_373470 ?auto_373471 ?auto_373472 ?auto_373473 ?auto_373474 ?auto_373475 ?auto_373476 )
      ( MAKE-12PILE ?auto_373470 ?auto_373471 ?auto_373472 ?auto_373473 ?auto_373474 ?auto_373475 ?auto_373476 ?auto_373477 ?auto_373478 ?auto_373479 ?auto_373480 ?auto_373481 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373520 - BLOCK
      ?auto_373521 - BLOCK
      ?auto_373522 - BLOCK
      ?auto_373523 - BLOCK
      ?auto_373524 - BLOCK
      ?auto_373525 - BLOCK
      ?auto_373526 - BLOCK
      ?auto_373527 - BLOCK
      ?auto_373528 - BLOCK
      ?auto_373529 - BLOCK
      ?auto_373530 - BLOCK
      ?auto_373531 - BLOCK
    )
    :vars
    (
      ?auto_373532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373531 ?auto_373532 ) ( ON-TABLE ?auto_373520 ) ( ON ?auto_373521 ?auto_373520 ) ( ON ?auto_373522 ?auto_373521 ) ( ON ?auto_373523 ?auto_373522 ) ( ON ?auto_373524 ?auto_373523 ) ( not ( = ?auto_373520 ?auto_373521 ) ) ( not ( = ?auto_373520 ?auto_373522 ) ) ( not ( = ?auto_373520 ?auto_373523 ) ) ( not ( = ?auto_373520 ?auto_373524 ) ) ( not ( = ?auto_373520 ?auto_373525 ) ) ( not ( = ?auto_373520 ?auto_373526 ) ) ( not ( = ?auto_373520 ?auto_373527 ) ) ( not ( = ?auto_373520 ?auto_373528 ) ) ( not ( = ?auto_373520 ?auto_373529 ) ) ( not ( = ?auto_373520 ?auto_373530 ) ) ( not ( = ?auto_373520 ?auto_373531 ) ) ( not ( = ?auto_373520 ?auto_373532 ) ) ( not ( = ?auto_373521 ?auto_373522 ) ) ( not ( = ?auto_373521 ?auto_373523 ) ) ( not ( = ?auto_373521 ?auto_373524 ) ) ( not ( = ?auto_373521 ?auto_373525 ) ) ( not ( = ?auto_373521 ?auto_373526 ) ) ( not ( = ?auto_373521 ?auto_373527 ) ) ( not ( = ?auto_373521 ?auto_373528 ) ) ( not ( = ?auto_373521 ?auto_373529 ) ) ( not ( = ?auto_373521 ?auto_373530 ) ) ( not ( = ?auto_373521 ?auto_373531 ) ) ( not ( = ?auto_373521 ?auto_373532 ) ) ( not ( = ?auto_373522 ?auto_373523 ) ) ( not ( = ?auto_373522 ?auto_373524 ) ) ( not ( = ?auto_373522 ?auto_373525 ) ) ( not ( = ?auto_373522 ?auto_373526 ) ) ( not ( = ?auto_373522 ?auto_373527 ) ) ( not ( = ?auto_373522 ?auto_373528 ) ) ( not ( = ?auto_373522 ?auto_373529 ) ) ( not ( = ?auto_373522 ?auto_373530 ) ) ( not ( = ?auto_373522 ?auto_373531 ) ) ( not ( = ?auto_373522 ?auto_373532 ) ) ( not ( = ?auto_373523 ?auto_373524 ) ) ( not ( = ?auto_373523 ?auto_373525 ) ) ( not ( = ?auto_373523 ?auto_373526 ) ) ( not ( = ?auto_373523 ?auto_373527 ) ) ( not ( = ?auto_373523 ?auto_373528 ) ) ( not ( = ?auto_373523 ?auto_373529 ) ) ( not ( = ?auto_373523 ?auto_373530 ) ) ( not ( = ?auto_373523 ?auto_373531 ) ) ( not ( = ?auto_373523 ?auto_373532 ) ) ( not ( = ?auto_373524 ?auto_373525 ) ) ( not ( = ?auto_373524 ?auto_373526 ) ) ( not ( = ?auto_373524 ?auto_373527 ) ) ( not ( = ?auto_373524 ?auto_373528 ) ) ( not ( = ?auto_373524 ?auto_373529 ) ) ( not ( = ?auto_373524 ?auto_373530 ) ) ( not ( = ?auto_373524 ?auto_373531 ) ) ( not ( = ?auto_373524 ?auto_373532 ) ) ( not ( = ?auto_373525 ?auto_373526 ) ) ( not ( = ?auto_373525 ?auto_373527 ) ) ( not ( = ?auto_373525 ?auto_373528 ) ) ( not ( = ?auto_373525 ?auto_373529 ) ) ( not ( = ?auto_373525 ?auto_373530 ) ) ( not ( = ?auto_373525 ?auto_373531 ) ) ( not ( = ?auto_373525 ?auto_373532 ) ) ( not ( = ?auto_373526 ?auto_373527 ) ) ( not ( = ?auto_373526 ?auto_373528 ) ) ( not ( = ?auto_373526 ?auto_373529 ) ) ( not ( = ?auto_373526 ?auto_373530 ) ) ( not ( = ?auto_373526 ?auto_373531 ) ) ( not ( = ?auto_373526 ?auto_373532 ) ) ( not ( = ?auto_373527 ?auto_373528 ) ) ( not ( = ?auto_373527 ?auto_373529 ) ) ( not ( = ?auto_373527 ?auto_373530 ) ) ( not ( = ?auto_373527 ?auto_373531 ) ) ( not ( = ?auto_373527 ?auto_373532 ) ) ( not ( = ?auto_373528 ?auto_373529 ) ) ( not ( = ?auto_373528 ?auto_373530 ) ) ( not ( = ?auto_373528 ?auto_373531 ) ) ( not ( = ?auto_373528 ?auto_373532 ) ) ( not ( = ?auto_373529 ?auto_373530 ) ) ( not ( = ?auto_373529 ?auto_373531 ) ) ( not ( = ?auto_373529 ?auto_373532 ) ) ( not ( = ?auto_373530 ?auto_373531 ) ) ( not ( = ?auto_373530 ?auto_373532 ) ) ( not ( = ?auto_373531 ?auto_373532 ) ) ( ON ?auto_373530 ?auto_373531 ) ( ON ?auto_373529 ?auto_373530 ) ( ON ?auto_373528 ?auto_373529 ) ( ON ?auto_373527 ?auto_373528 ) ( ON ?auto_373526 ?auto_373527 ) ( CLEAR ?auto_373524 ) ( ON ?auto_373525 ?auto_373526 ) ( CLEAR ?auto_373525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_373520 ?auto_373521 ?auto_373522 ?auto_373523 ?auto_373524 ?auto_373525 )
      ( MAKE-12PILE ?auto_373520 ?auto_373521 ?auto_373522 ?auto_373523 ?auto_373524 ?auto_373525 ?auto_373526 ?auto_373527 ?auto_373528 ?auto_373529 ?auto_373530 ?auto_373531 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373570 - BLOCK
      ?auto_373571 - BLOCK
      ?auto_373572 - BLOCK
      ?auto_373573 - BLOCK
      ?auto_373574 - BLOCK
      ?auto_373575 - BLOCK
      ?auto_373576 - BLOCK
      ?auto_373577 - BLOCK
      ?auto_373578 - BLOCK
      ?auto_373579 - BLOCK
      ?auto_373580 - BLOCK
      ?auto_373581 - BLOCK
    )
    :vars
    (
      ?auto_373582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373581 ?auto_373582 ) ( ON-TABLE ?auto_373570 ) ( ON ?auto_373571 ?auto_373570 ) ( ON ?auto_373572 ?auto_373571 ) ( ON ?auto_373573 ?auto_373572 ) ( not ( = ?auto_373570 ?auto_373571 ) ) ( not ( = ?auto_373570 ?auto_373572 ) ) ( not ( = ?auto_373570 ?auto_373573 ) ) ( not ( = ?auto_373570 ?auto_373574 ) ) ( not ( = ?auto_373570 ?auto_373575 ) ) ( not ( = ?auto_373570 ?auto_373576 ) ) ( not ( = ?auto_373570 ?auto_373577 ) ) ( not ( = ?auto_373570 ?auto_373578 ) ) ( not ( = ?auto_373570 ?auto_373579 ) ) ( not ( = ?auto_373570 ?auto_373580 ) ) ( not ( = ?auto_373570 ?auto_373581 ) ) ( not ( = ?auto_373570 ?auto_373582 ) ) ( not ( = ?auto_373571 ?auto_373572 ) ) ( not ( = ?auto_373571 ?auto_373573 ) ) ( not ( = ?auto_373571 ?auto_373574 ) ) ( not ( = ?auto_373571 ?auto_373575 ) ) ( not ( = ?auto_373571 ?auto_373576 ) ) ( not ( = ?auto_373571 ?auto_373577 ) ) ( not ( = ?auto_373571 ?auto_373578 ) ) ( not ( = ?auto_373571 ?auto_373579 ) ) ( not ( = ?auto_373571 ?auto_373580 ) ) ( not ( = ?auto_373571 ?auto_373581 ) ) ( not ( = ?auto_373571 ?auto_373582 ) ) ( not ( = ?auto_373572 ?auto_373573 ) ) ( not ( = ?auto_373572 ?auto_373574 ) ) ( not ( = ?auto_373572 ?auto_373575 ) ) ( not ( = ?auto_373572 ?auto_373576 ) ) ( not ( = ?auto_373572 ?auto_373577 ) ) ( not ( = ?auto_373572 ?auto_373578 ) ) ( not ( = ?auto_373572 ?auto_373579 ) ) ( not ( = ?auto_373572 ?auto_373580 ) ) ( not ( = ?auto_373572 ?auto_373581 ) ) ( not ( = ?auto_373572 ?auto_373582 ) ) ( not ( = ?auto_373573 ?auto_373574 ) ) ( not ( = ?auto_373573 ?auto_373575 ) ) ( not ( = ?auto_373573 ?auto_373576 ) ) ( not ( = ?auto_373573 ?auto_373577 ) ) ( not ( = ?auto_373573 ?auto_373578 ) ) ( not ( = ?auto_373573 ?auto_373579 ) ) ( not ( = ?auto_373573 ?auto_373580 ) ) ( not ( = ?auto_373573 ?auto_373581 ) ) ( not ( = ?auto_373573 ?auto_373582 ) ) ( not ( = ?auto_373574 ?auto_373575 ) ) ( not ( = ?auto_373574 ?auto_373576 ) ) ( not ( = ?auto_373574 ?auto_373577 ) ) ( not ( = ?auto_373574 ?auto_373578 ) ) ( not ( = ?auto_373574 ?auto_373579 ) ) ( not ( = ?auto_373574 ?auto_373580 ) ) ( not ( = ?auto_373574 ?auto_373581 ) ) ( not ( = ?auto_373574 ?auto_373582 ) ) ( not ( = ?auto_373575 ?auto_373576 ) ) ( not ( = ?auto_373575 ?auto_373577 ) ) ( not ( = ?auto_373575 ?auto_373578 ) ) ( not ( = ?auto_373575 ?auto_373579 ) ) ( not ( = ?auto_373575 ?auto_373580 ) ) ( not ( = ?auto_373575 ?auto_373581 ) ) ( not ( = ?auto_373575 ?auto_373582 ) ) ( not ( = ?auto_373576 ?auto_373577 ) ) ( not ( = ?auto_373576 ?auto_373578 ) ) ( not ( = ?auto_373576 ?auto_373579 ) ) ( not ( = ?auto_373576 ?auto_373580 ) ) ( not ( = ?auto_373576 ?auto_373581 ) ) ( not ( = ?auto_373576 ?auto_373582 ) ) ( not ( = ?auto_373577 ?auto_373578 ) ) ( not ( = ?auto_373577 ?auto_373579 ) ) ( not ( = ?auto_373577 ?auto_373580 ) ) ( not ( = ?auto_373577 ?auto_373581 ) ) ( not ( = ?auto_373577 ?auto_373582 ) ) ( not ( = ?auto_373578 ?auto_373579 ) ) ( not ( = ?auto_373578 ?auto_373580 ) ) ( not ( = ?auto_373578 ?auto_373581 ) ) ( not ( = ?auto_373578 ?auto_373582 ) ) ( not ( = ?auto_373579 ?auto_373580 ) ) ( not ( = ?auto_373579 ?auto_373581 ) ) ( not ( = ?auto_373579 ?auto_373582 ) ) ( not ( = ?auto_373580 ?auto_373581 ) ) ( not ( = ?auto_373580 ?auto_373582 ) ) ( not ( = ?auto_373581 ?auto_373582 ) ) ( ON ?auto_373580 ?auto_373581 ) ( ON ?auto_373579 ?auto_373580 ) ( ON ?auto_373578 ?auto_373579 ) ( ON ?auto_373577 ?auto_373578 ) ( ON ?auto_373576 ?auto_373577 ) ( ON ?auto_373575 ?auto_373576 ) ( CLEAR ?auto_373573 ) ( ON ?auto_373574 ?auto_373575 ) ( CLEAR ?auto_373574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_373570 ?auto_373571 ?auto_373572 ?auto_373573 ?auto_373574 )
      ( MAKE-12PILE ?auto_373570 ?auto_373571 ?auto_373572 ?auto_373573 ?auto_373574 ?auto_373575 ?auto_373576 ?auto_373577 ?auto_373578 ?auto_373579 ?auto_373580 ?auto_373581 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373620 - BLOCK
      ?auto_373621 - BLOCK
      ?auto_373622 - BLOCK
      ?auto_373623 - BLOCK
      ?auto_373624 - BLOCK
      ?auto_373625 - BLOCK
      ?auto_373626 - BLOCK
      ?auto_373627 - BLOCK
      ?auto_373628 - BLOCK
      ?auto_373629 - BLOCK
      ?auto_373630 - BLOCK
      ?auto_373631 - BLOCK
    )
    :vars
    (
      ?auto_373632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373631 ?auto_373632 ) ( ON-TABLE ?auto_373620 ) ( ON ?auto_373621 ?auto_373620 ) ( ON ?auto_373622 ?auto_373621 ) ( not ( = ?auto_373620 ?auto_373621 ) ) ( not ( = ?auto_373620 ?auto_373622 ) ) ( not ( = ?auto_373620 ?auto_373623 ) ) ( not ( = ?auto_373620 ?auto_373624 ) ) ( not ( = ?auto_373620 ?auto_373625 ) ) ( not ( = ?auto_373620 ?auto_373626 ) ) ( not ( = ?auto_373620 ?auto_373627 ) ) ( not ( = ?auto_373620 ?auto_373628 ) ) ( not ( = ?auto_373620 ?auto_373629 ) ) ( not ( = ?auto_373620 ?auto_373630 ) ) ( not ( = ?auto_373620 ?auto_373631 ) ) ( not ( = ?auto_373620 ?auto_373632 ) ) ( not ( = ?auto_373621 ?auto_373622 ) ) ( not ( = ?auto_373621 ?auto_373623 ) ) ( not ( = ?auto_373621 ?auto_373624 ) ) ( not ( = ?auto_373621 ?auto_373625 ) ) ( not ( = ?auto_373621 ?auto_373626 ) ) ( not ( = ?auto_373621 ?auto_373627 ) ) ( not ( = ?auto_373621 ?auto_373628 ) ) ( not ( = ?auto_373621 ?auto_373629 ) ) ( not ( = ?auto_373621 ?auto_373630 ) ) ( not ( = ?auto_373621 ?auto_373631 ) ) ( not ( = ?auto_373621 ?auto_373632 ) ) ( not ( = ?auto_373622 ?auto_373623 ) ) ( not ( = ?auto_373622 ?auto_373624 ) ) ( not ( = ?auto_373622 ?auto_373625 ) ) ( not ( = ?auto_373622 ?auto_373626 ) ) ( not ( = ?auto_373622 ?auto_373627 ) ) ( not ( = ?auto_373622 ?auto_373628 ) ) ( not ( = ?auto_373622 ?auto_373629 ) ) ( not ( = ?auto_373622 ?auto_373630 ) ) ( not ( = ?auto_373622 ?auto_373631 ) ) ( not ( = ?auto_373622 ?auto_373632 ) ) ( not ( = ?auto_373623 ?auto_373624 ) ) ( not ( = ?auto_373623 ?auto_373625 ) ) ( not ( = ?auto_373623 ?auto_373626 ) ) ( not ( = ?auto_373623 ?auto_373627 ) ) ( not ( = ?auto_373623 ?auto_373628 ) ) ( not ( = ?auto_373623 ?auto_373629 ) ) ( not ( = ?auto_373623 ?auto_373630 ) ) ( not ( = ?auto_373623 ?auto_373631 ) ) ( not ( = ?auto_373623 ?auto_373632 ) ) ( not ( = ?auto_373624 ?auto_373625 ) ) ( not ( = ?auto_373624 ?auto_373626 ) ) ( not ( = ?auto_373624 ?auto_373627 ) ) ( not ( = ?auto_373624 ?auto_373628 ) ) ( not ( = ?auto_373624 ?auto_373629 ) ) ( not ( = ?auto_373624 ?auto_373630 ) ) ( not ( = ?auto_373624 ?auto_373631 ) ) ( not ( = ?auto_373624 ?auto_373632 ) ) ( not ( = ?auto_373625 ?auto_373626 ) ) ( not ( = ?auto_373625 ?auto_373627 ) ) ( not ( = ?auto_373625 ?auto_373628 ) ) ( not ( = ?auto_373625 ?auto_373629 ) ) ( not ( = ?auto_373625 ?auto_373630 ) ) ( not ( = ?auto_373625 ?auto_373631 ) ) ( not ( = ?auto_373625 ?auto_373632 ) ) ( not ( = ?auto_373626 ?auto_373627 ) ) ( not ( = ?auto_373626 ?auto_373628 ) ) ( not ( = ?auto_373626 ?auto_373629 ) ) ( not ( = ?auto_373626 ?auto_373630 ) ) ( not ( = ?auto_373626 ?auto_373631 ) ) ( not ( = ?auto_373626 ?auto_373632 ) ) ( not ( = ?auto_373627 ?auto_373628 ) ) ( not ( = ?auto_373627 ?auto_373629 ) ) ( not ( = ?auto_373627 ?auto_373630 ) ) ( not ( = ?auto_373627 ?auto_373631 ) ) ( not ( = ?auto_373627 ?auto_373632 ) ) ( not ( = ?auto_373628 ?auto_373629 ) ) ( not ( = ?auto_373628 ?auto_373630 ) ) ( not ( = ?auto_373628 ?auto_373631 ) ) ( not ( = ?auto_373628 ?auto_373632 ) ) ( not ( = ?auto_373629 ?auto_373630 ) ) ( not ( = ?auto_373629 ?auto_373631 ) ) ( not ( = ?auto_373629 ?auto_373632 ) ) ( not ( = ?auto_373630 ?auto_373631 ) ) ( not ( = ?auto_373630 ?auto_373632 ) ) ( not ( = ?auto_373631 ?auto_373632 ) ) ( ON ?auto_373630 ?auto_373631 ) ( ON ?auto_373629 ?auto_373630 ) ( ON ?auto_373628 ?auto_373629 ) ( ON ?auto_373627 ?auto_373628 ) ( ON ?auto_373626 ?auto_373627 ) ( ON ?auto_373625 ?auto_373626 ) ( ON ?auto_373624 ?auto_373625 ) ( CLEAR ?auto_373622 ) ( ON ?auto_373623 ?auto_373624 ) ( CLEAR ?auto_373623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_373620 ?auto_373621 ?auto_373622 ?auto_373623 )
      ( MAKE-12PILE ?auto_373620 ?auto_373621 ?auto_373622 ?auto_373623 ?auto_373624 ?auto_373625 ?auto_373626 ?auto_373627 ?auto_373628 ?auto_373629 ?auto_373630 ?auto_373631 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373670 - BLOCK
      ?auto_373671 - BLOCK
      ?auto_373672 - BLOCK
      ?auto_373673 - BLOCK
      ?auto_373674 - BLOCK
      ?auto_373675 - BLOCK
      ?auto_373676 - BLOCK
      ?auto_373677 - BLOCK
      ?auto_373678 - BLOCK
      ?auto_373679 - BLOCK
      ?auto_373680 - BLOCK
      ?auto_373681 - BLOCK
    )
    :vars
    (
      ?auto_373682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373681 ?auto_373682 ) ( ON-TABLE ?auto_373670 ) ( ON ?auto_373671 ?auto_373670 ) ( not ( = ?auto_373670 ?auto_373671 ) ) ( not ( = ?auto_373670 ?auto_373672 ) ) ( not ( = ?auto_373670 ?auto_373673 ) ) ( not ( = ?auto_373670 ?auto_373674 ) ) ( not ( = ?auto_373670 ?auto_373675 ) ) ( not ( = ?auto_373670 ?auto_373676 ) ) ( not ( = ?auto_373670 ?auto_373677 ) ) ( not ( = ?auto_373670 ?auto_373678 ) ) ( not ( = ?auto_373670 ?auto_373679 ) ) ( not ( = ?auto_373670 ?auto_373680 ) ) ( not ( = ?auto_373670 ?auto_373681 ) ) ( not ( = ?auto_373670 ?auto_373682 ) ) ( not ( = ?auto_373671 ?auto_373672 ) ) ( not ( = ?auto_373671 ?auto_373673 ) ) ( not ( = ?auto_373671 ?auto_373674 ) ) ( not ( = ?auto_373671 ?auto_373675 ) ) ( not ( = ?auto_373671 ?auto_373676 ) ) ( not ( = ?auto_373671 ?auto_373677 ) ) ( not ( = ?auto_373671 ?auto_373678 ) ) ( not ( = ?auto_373671 ?auto_373679 ) ) ( not ( = ?auto_373671 ?auto_373680 ) ) ( not ( = ?auto_373671 ?auto_373681 ) ) ( not ( = ?auto_373671 ?auto_373682 ) ) ( not ( = ?auto_373672 ?auto_373673 ) ) ( not ( = ?auto_373672 ?auto_373674 ) ) ( not ( = ?auto_373672 ?auto_373675 ) ) ( not ( = ?auto_373672 ?auto_373676 ) ) ( not ( = ?auto_373672 ?auto_373677 ) ) ( not ( = ?auto_373672 ?auto_373678 ) ) ( not ( = ?auto_373672 ?auto_373679 ) ) ( not ( = ?auto_373672 ?auto_373680 ) ) ( not ( = ?auto_373672 ?auto_373681 ) ) ( not ( = ?auto_373672 ?auto_373682 ) ) ( not ( = ?auto_373673 ?auto_373674 ) ) ( not ( = ?auto_373673 ?auto_373675 ) ) ( not ( = ?auto_373673 ?auto_373676 ) ) ( not ( = ?auto_373673 ?auto_373677 ) ) ( not ( = ?auto_373673 ?auto_373678 ) ) ( not ( = ?auto_373673 ?auto_373679 ) ) ( not ( = ?auto_373673 ?auto_373680 ) ) ( not ( = ?auto_373673 ?auto_373681 ) ) ( not ( = ?auto_373673 ?auto_373682 ) ) ( not ( = ?auto_373674 ?auto_373675 ) ) ( not ( = ?auto_373674 ?auto_373676 ) ) ( not ( = ?auto_373674 ?auto_373677 ) ) ( not ( = ?auto_373674 ?auto_373678 ) ) ( not ( = ?auto_373674 ?auto_373679 ) ) ( not ( = ?auto_373674 ?auto_373680 ) ) ( not ( = ?auto_373674 ?auto_373681 ) ) ( not ( = ?auto_373674 ?auto_373682 ) ) ( not ( = ?auto_373675 ?auto_373676 ) ) ( not ( = ?auto_373675 ?auto_373677 ) ) ( not ( = ?auto_373675 ?auto_373678 ) ) ( not ( = ?auto_373675 ?auto_373679 ) ) ( not ( = ?auto_373675 ?auto_373680 ) ) ( not ( = ?auto_373675 ?auto_373681 ) ) ( not ( = ?auto_373675 ?auto_373682 ) ) ( not ( = ?auto_373676 ?auto_373677 ) ) ( not ( = ?auto_373676 ?auto_373678 ) ) ( not ( = ?auto_373676 ?auto_373679 ) ) ( not ( = ?auto_373676 ?auto_373680 ) ) ( not ( = ?auto_373676 ?auto_373681 ) ) ( not ( = ?auto_373676 ?auto_373682 ) ) ( not ( = ?auto_373677 ?auto_373678 ) ) ( not ( = ?auto_373677 ?auto_373679 ) ) ( not ( = ?auto_373677 ?auto_373680 ) ) ( not ( = ?auto_373677 ?auto_373681 ) ) ( not ( = ?auto_373677 ?auto_373682 ) ) ( not ( = ?auto_373678 ?auto_373679 ) ) ( not ( = ?auto_373678 ?auto_373680 ) ) ( not ( = ?auto_373678 ?auto_373681 ) ) ( not ( = ?auto_373678 ?auto_373682 ) ) ( not ( = ?auto_373679 ?auto_373680 ) ) ( not ( = ?auto_373679 ?auto_373681 ) ) ( not ( = ?auto_373679 ?auto_373682 ) ) ( not ( = ?auto_373680 ?auto_373681 ) ) ( not ( = ?auto_373680 ?auto_373682 ) ) ( not ( = ?auto_373681 ?auto_373682 ) ) ( ON ?auto_373680 ?auto_373681 ) ( ON ?auto_373679 ?auto_373680 ) ( ON ?auto_373678 ?auto_373679 ) ( ON ?auto_373677 ?auto_373678 ) ( ON ?auto_373676 ?auto_373677 ) ( ON ?auto_373675 ?auto_373676 ) ( ON ?auto_373674 ?auto_373675 ) ( ON ?auto_373673 ?auto_373674 ) ( CLEAR ?auto_373671 ) ( ON ?auto_373672 ?auto_373673 ) ( CLEAR ?auto_373672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_373670 ?auto_373671 ?auto_373672 )
      ( MAKE-12PILE ?auto_373670 ?auto_373671 ?auto_373672 ?auto_373673 ?auto_373674 ?auto_373675 ?auto_373676 ?auto_373677 ?auto_373678 ?auto_373679 ?auto_373680 ?auto_373681 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373720 - BLOCK
      ?auto_373721 - BLOCK
      ?auto_373722 - BLOCK
      ?auto_373723 - BLOCK
      ?auto_373724 - BLOCK
      ?auto_373725 - BLOCK
      ?auto_373726 - BLOCK
      ?auto_373727 - BLOCK
      ?auto_373728 - BLOCK
      ?auto_373729 - BLOCK
      ?auto_373730 - BLOCK
      ?auto_373731 - BLOCK
    )
    :vars
    (
      ?auto_373732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373731 ?auto_373732 ) ( ON-TABLE ?auto_373720 ) ( not ( = ?auto_373720 ?auto_373721 ) ) ( not ( = ?auto_373720 ?auto_373722 ) ) ( not ( = ?auto_373720 ?auto_373723 ) ) ( not ( = ?auto_373720 ?auto_373724 ) ) ( not ( = ?auto_373720 ?auto_373725 ) ) ( not ( = ?auto_373720 ?auto_373726 ) ) ( not ( = ?auto_373720 ?auto_373727 ) ) ( not ( = ?auto_373720 ?auto_373728 ) ) ( not ( = ?auto_373720 ?auto_373729 ) ) ( not ( = ?auto_373720 ?auto_373730 ) ) ( not ( = ?auto_373720 ?auto_373731 ) ) ( not ( = ?auto_373720 ?auto_373732 ) ) ( not ( = ?auto_373721 ?auto_373722 ) ) ( not ( = ?auto_373721 ?auto_373723 ) ) ( not ( = ?auto_373721 ?auto_373724 ) ) ( not ( = ?auto_373721 ?auto_373725 ) ) ( not ( = ?auto_373721 ?auto_373726 ) ) ( not ( = ?auto_373721 ?auto_373727 ) ) ( not ( = ?auto_373721 ?auto_373728 ) ) ( not ( = ?auto_373721 ?auto_373729 ) ) ( not ( = ?auto_373721 ?auto_373730 ) ) ( not ( = ?auto_373721 ?auto_373731 ) ) ( not ( = ?auto_373721 ?auto_373732 ) ) ( not ( = ?auto_373722 ?auto_373723 ) ) ( not ( = ?auto_373722 ?auto_373724 ) ) ( not ( = ?auto_373722 ?auto_373725 ) ) ( not ( = ?auto_373722 ?auto_373726 ) ) ( not ( = ?auto_373722 ?auto_373727 ) ) ( not ( = ?auto_373722 ?auto_373728 ) ) ( not ( = ?auto_373722 ?auto_373729 ) ) ( not ( = ?auto_373722 ?auto_373730 ) ) ( not ( = ?auto_373722 ?auto_373731 ) ) ( not ( = ?auto_373722 ?auto_373732 ) ) ( not ( = ?auto_373723 ?auto_373724 ) ) ( not ( = ?auto_373723 ?auto_373725 ) ) ( not ( = ?auto_373723 ?auto_373726 ) ) ( not ( = ?auto_373723 ?auto_373727 ) ) ( not ( = ?auto_373723 ?auto_373728 ) ) ( not ( = ?auto_373723 ?auto_373729 ) ) ( not ( = ?auto_373723 ?auto_373730 ) ) ( not ( = ?auto_373723 ?auto_373731 ) ) ( not ( = ?auto_373723 ?auto_373732 ) ) ( not ( = ?auto_373724 ?auto_373725 ) ) ( not ( = ?auto_373724 ?auto_373726 ) ) ( not ( = ?auto_373724 ?auto_373727 ) ) ( not ( = ?auto_373724 ?auto_373728 ) ) ( not ( = ?auto_373724 ?auto_373729 ) ) ( not ( = ?auto_373724 ?auto_373730 ) ) ( not ( = ?auto_373724 ?auto_373731 ) ) ( not ( = ?auto_373724 ?auto_373732 ) ) ( not ( = ?auto_373725 ?auto_373726 ) ) ( not ( = ?auto_373725 ?auto_373727 ) ) ( not ( = ?auto_373725 ?auto_373728 ) ) ( not ( = ?auto_373725 ?auto_373729 ) ) ( not ( = ?auto_373725 ?auto_373730 ) ) ( not ( = ?auto_373725 ?auto_373731 ) ) ( not ( = ?auto_373725 ?auto_373732 ) ) ( not ( = ?auto_373726 ?auto_373727 ) ) ( not ( = ?auto_373726 ?auto_373728 ) ) ( not ( = ?auto_373726 ?auto_373729 ) ) ( not ( = ?auto_373726 ?auto_373730 ) ) ( not ( = ?auto_373726 ?auto_373731 ) ) ( not ( = ?auto_373726 ?auto_373732 ) ) ( not ( = ?auto_373727 ?auto_373728 ) ) ( not ( = ?auto_373727 ?auto_373729 ) ) ( not ( = ?auto_373727 ?auto_373730 ) ) ( not ( = ?auto_373727 ?auto_373731 ) ) ( not ( = ?auto_373727 ?auto_373732 ) ) ( not ( = ?auto_373728 ?auto_373729 ) ) ( not ( = ?auto_373728 ?auto_373730 ) ) ( not ( = ?auto_373728 ?auto_373731 ) ) ( not ( = ?auto_373728 ?auto_373732 ) ) ( not ( = ?auto_373729 ?auto_373730 ) ) ( not ( = ?auto_373729 ?auto_373731 ) ) ( not ( = ?auto_373729 ?auto_373732 ) ) ( not ( = ?auto_373730 ?auto_373731 ) ) ( not ( = ?auto_373730 ?auto_373732 ) ) ( not ( = ?auto_373731 ?auto_373732 ) ) ( ON ?auto_373730 ?auto_373731 ) ( ON ?auto_373729 ?auto_373730 ) ( ON ?auto_373728 ?auto_373729 ) ( ON ?auto_373727 ?auto_373728 ) ( ON ?auto_373726 ?auto_373727 ) ( ON ?auto_373725 ?auto_373726 ) ( ON ?auto_373724 ?auto_373725 ) ( ON ?auto_373723 ?auto_373724 ) ( ON ?auto_373722 ?auto_373723 ) ( CLEAR ?auto_373720 ) ( ON ?auto_373721 ?auto_373722 ) ( CLEAR ?auto_373721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_373720 ?auto_373721 )
      ( MAKE-12PILE ?auto_373720 ?auto_373721 ?auto_373722 ?auto_373723 ?auto_373724 ?auto_373725 ?auto_373726 ?auto_373727 ?auto_373728 ?auto_373729 ?auto_373730 ?auto_373731 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373770 - BLOCK
      ?auto_373771 - BLOCK
      ?auto_373772 - BLOCK
      ?auto_373773 - BLOCK
      ?auto_373774 - BLOCK
      ?auto_373775 - BLOCK
      ?auto_373776 - BLOCK
      ?auto_373777 - BLOCK
      ?auto_373778 - BLOCK
      ?auto_373779 - BLOCK
      ?auto_373780 - BLOCK
      ?auto_373781 - BLOCK
    )
    :vars
    (
      ?auto_373782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373781 ?auto_373782 ) ( not ( = ?auto_373770 ?auto_373771 ) ) ( not ( = ?auto_373770 ?auto_373772 ) ) ( not ( = ?auto_373770 ?auto_373773 ) ) ( not ( = ?auto_373770 ?auto_373774 ) ) ( not ( = ?auto_373770 ?auto_373775 ) ) ( not ( = ?auto_373770 ?auto_373776 ) ) ( not ( = ?auto_373770 ?auto_373777 ) ) ( not ( = ?auto_373770 ?auto_373778 ) ) ( not ( = ?auto_373770 ?auto_373779 ) ) ( not ( = ?auto_373770 ?auto_373780 ) ) ( not ( = ?auto_373770 ?auto_373781 ) ) ( not ( = ?auto_373770 ?auto_373782 ) ) ( not ( = ?auto_373771 ?auto_373772 ) ) ( not ( = ?auto_373771 ?auto_373773 ) ) ( not ( = ?auto_373771 ?auto_373774 ) ) ( not ( = ?auto_373771 ?auto_373775 ) ) ( not ( = ?auto_373771 ?auto_373776 ) ) ( not ( = ?auto_373771 ?auto_373777 ) ) ( not ( = ?auto_373771 ?auto_373778 ) ) ( not ( = ?auto_373771 ?auto_373779 ) ) ( not ( = ?auto_373771 ?auto_373780 ) ) ( not ( = ?auto_373771 ?auto_373781 ) ) ( not ( = ?auto_373771 ?auto_373782 ) ) ( not ( = ?auto_373772 ?auto_373773 ) ) ( not ( = ?auto_373772 ?auto_373774 ) ) ( not ( = ?auto_373772 ?auto_373775 ) ) ( not ( = ?auto_373772 ?auto_373776 ) ) ( not ( = ?auto_373772 ?auto_373777 ) ) ( not ( = ?auto_373772 ?auto_373778 ) ) ( not ( = ?auto_373772 ?auto_373779 ) ) ( not ( = ?auto_373772 ?auto_373780 ) ) ( not ( = ?auto_373772 ?auto_373781 ) ) ( not ( = ?auto_373772 ?auto_373782 ) ) ( not ( = ?auto_373773 ?auto_373774 ) ) ( not ( = ?auto_373773 ?auto_373775 ) ) ( not ( = ?auto_373773 ?auto_373776 ) ) ( not ( = ?auto_373773 ?auto_373777 ) ) ( not ( = ?auto_373773 ?auto_373778 ) ) ( not ( = ?auto_373773 ?auto_373779 ) ) ( not ( = ?auto_373773 ?auto_373780 ) ) ( not ( = ?auto_373773 ?auto_373781 ) ) ( not ( = ?auto_373773 ?auto_373782 ) ) ( not ( = ?auto_373774 ?auto_373775 ) ) ( not ( = ?auto_373774 ?auto_373776 ) ) ( not ( = ?auto_373774 ?auto_373777 ) ) ( not ( = ?auto_373774 ?auto_373778 ) ) ( not ( = ?auto_373774 ?auto_373779 ) ) ( not ( = ?auto_373774 ?auto_373780 ) ) ( not ( = ?auto_373774 ?auto_373781 ) ) ( not ( = ?auto_373774 ?auto_373782 ) ) ( not ( = ?auto_373775 ?auto_373776 ) ) ( not ( = ?auto_373775 ?auto_373777 ) ) ( not ( = ?auto_373775 ?auto_373778 ) ) ( not ( = ?auto_373775 ?auto_373779 ) ) ( not ( = ?auto_373775 ?auto_373780 ) ) ( not ( = ?auto_373775 ?auto_373781 ) ) ( not ( = ?auto_373775 ?auto_373782 ) ) ( not ( = ?auto_373776 ?auto_373777 ) ) ( not ( = ?auto_373776 ?auto_373778 ) ) ( not ( = ?auto_373776 ?auto_373779 ) ) ( not ( = ?auto_373776 ?auto_373780 ) ) ( not ( = ?auto_373776 ?auto_373781 ) ) ( not ( = ?auto_373776 ?auto_373782 ) ) ( not ( = ?auto_373777 ?auto_373778 ) ) ( not ( = ?auto_373777 ?auto_373779 ) ) ( not ( = ?auto_373777 ?auto_373780 ) ) ( not ( = ?auto_373777 ?auto_373781 ) ) ( not ( = ?auto_373777 ?auto_373782 ) ) ( not ( = ?auto_373778 ?auto_373779 ) ) ( not ( = ?auto_373778 ?auto_373780 ) ) ( not ( = ?auto_373778 ?auto_373781 ) ) ( not ( = ?auto_373778 ?auto_373782 ) ) ( not ( = ?auto_373779 ?auto_373780 ) ) ( not ( = ?auto_373779 ?auto_373781 ) ) ( not ( = ?auto_373779 ?auto_373782 ) ) ( not ( = ?auto_373780 ?auto_373781 ) ) ( not ( = ?auto_373780 ?auto_373782 ) ) ( not ( = ?auto_373781 ?auto_373782 ) ) ( ON ?auto_373780 ?auto_373781 ) ( ON ?auto_373779 ?auto_373780 ) ( ON ?auto_373778 ?auto_373779 ) ( ON ?auto_373777 ?auto_373778 ) ( ON ?auto_373776 ?auto_373777 ) ( ON ?auto_373775 ?auto_373776 ) ( ON ?auto_373774 ?auto_373775 ) ( ON ?auto_373773 ?auto_373774 ) ( ON ?auto_373772 ?auto_373773 ) ( ON ?auto_373771 ?auto_373772 ) ( ON ?auto_373770 ?auto_373771 ) ( CLEAR ?auto_373770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_373770 )
      ( MAKE-12PILE ?auto_373770 ?auto_373771 ?auto_373772 ?auto_373773 ?auto_373774 ?auto_373775 ?auto_373776 ?auto_373777 ?auto_373778 ?auto_373779 ?auto_373780 ?auto_373781 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_373821 - BLOCK
      ?auto_373822 - BLOCK
      ?auto_373823 - BLOCK
      ?auto_373824 - BLOCK
      ?auto_373825 - BLOCK
      ?auto_373826 - BLOCK
      ?auto_373827 - BLOCK
      ?auto_373828 - BLOCK
      ?auto_373829 - BLOCK
      ?auto_373830 - BLOCK
      ?auto_373831 - BLOCK
      ?auto_373832 - BLOCK
      ?auto_373833 - BLOCK
    )
    :vars
    (
      ?auto_373834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_373832 ) ( ON ?auto_373833 ?auto_373834 ) ( CLEAR ?auto_373833 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_373821 ) ( ON ?auto_373822 ?auto_373821 ) ( ON ?auto_373823 ?auto_373822 ) ( ON ?auto_373824 ?auto_373823 ) ( ON ?auto_373825 ?auto_373824 ) ( ON ?auto_373826 ?auto_373825 ) ( ON ?auto_373827 ?auto_373826 ) ( ON ?auto_373828 ?auto_373827 ) ( ON ?auto_373829 ?auto_373828 ) ( ON ?auto_373830 ?auto_373829 ) ( ON ?auto_373831 ?auto_373830 ) ( ON ?auto_373832 ?auto_373831 ) ( not ( = ?auto_373821 ?auto_373822 ) ) ( not ( = ?auto_373821 ?auto_373823 ) ) ( not ( = ?auto_373821 ?auto_373824 ) ) ( not ( = ?auto_373821 ?auto_373825 ) ) ( not ( = ?auto_373821 ?auto_373826 ) ) ( not ( = ?auto_373821 ?auto_373827 ) ) ( not ( = ?auto_373821 ?auto_373828 ) ) ( not ( = ?auto_373821 ?auto_373829 ) ) ( not ( = ?auto_373821 ?auto_373830 ) ) ( not ( = ?auto_373821 ?auto_373831 ) ) ( not ( = ?auto_373821 ?auto_373832 ) ) ( not ( = ?auto_373821 ?auto_373833 ) ) ( not ( = ?auto_373821 ?auto_373834 ) ) ( not ( = ?auto_373822 ?auto_373823 ) ) ( not ( = ?auto_373822 ?auto_373824 ) ) ( not ( = ?auto_373822 ?auto_373825 ) ) ( not ( = ?auto_373822 ?auto_373826 ) ) ( not ( = ?auto_373822 ?auto_373827 ) ) ( not ( = ?auto_373822 ?auto_373828 ) ) ( not ( = ?auto_373822 ?auto_373829 ) ) ( not ( = ?auto_373822 ?auto_373830 ) ) ( not ( = ?auto_373822 ?auto_373831 ) ) ( not ( = ?auto_373822 ?auto_373832 ) ) ( not ( = ?auto_373822 ?auto_373833 ) ) ( not ( = ?auto_373822 ?auto_373834 ) ) ( not ( = ?auto_373823 ?auto_373824 ) ) ( not ( = ?auto_373823 ?auto_373825 ) ) ( not ( = ?auto_373823 ?auto_373826 ) ) ( not ( = ?auto_373823 ?auto_373827 ) ) ( not ( = ?auto_373823 ?auto_373828 ) ) ( not ( = ?auto_373823 ?auto_373829 ) ) ( not ( = ?auto_373823 ?auto_373830 ) ) ( not ( = ?auto_373823 ?auto_373831 ) ) ( not ( = ?auto_373823 ?auto_373832 ) ) ( not ( = ?auto_373823 ?auto_373833 ) ) ( not ( = ?auto_373823 ?auto_373834 ) ) ( not ( = ?auto_373824 ?auto_373825 ) ) ( not ( = ?auto_373824 ?auto_373826 ) ) ( not ( = ?auto_373824 ?auto_373827 ) ) ( not ( = ?auto_373824 ?auto_373828 ) ) ( not ( = ?auto_373824 ?auto_373829 ) ) ( not ( = ?auto_373824 ?auto_373830 ) ) ( not ( = ?auto_373824 ?auto_373831 ) ) ( not ( = ?auto_373824 ?auto_373832 ) ) ( not ( = ?auto_373824 ?auto_373833 ) ) ( not ( = ?auto_373824 ?auto_373834 ) ) ( not ( = ?auto_373825 ?auto_373826 ) ) ( not ( = ?auto_373825 ?auto_373827 ) ) ( not ( = ?auto_373825 ?auto_373828 ) ) ( not ( = ?auto_373825 ?auto_373829 ) ) ( not ( = ?auto_373825 ?auto_373830 ) ) ( not ( = ?auto_373825 ?auto_373831 ) ) ( not ( = ?auto_373825 ?auto_373832 ) ) ( not ( = ?auto_373825 ?auto_373833 ) ) ( not ( = ?auto_373825 ?auto_373834 ) ) ( not ( = ?auto_373826 ?auto_373827 ) ) ( not ( = ?auto_373826 ?auto_373828 ) ) ( not ( = ?auto_373826 ?auto_373829 ) ) ( not ( = ?auto_373826 ?auto_373830 ) ) ( not ( = ?auto_373826 ?auto_373831 ) ) ( not ( = ?auto_373826 ?auto_373832 ) ) ( not ( = ?auto_373826 ?auto_373833 ) ) ( not ( = ?auto_373826 ?auto_373834 ) ) ( not ( = ?auto_373827 ?auto_373828 ) ) ( not ( = ?auto_373827 ?auto_373829 ) ) ( not ( = ?auto_373827 ?auto_373830 ) ) ( not ( = ?auto_373827 ?auto_373831 ) ) ( not ( = ?auto_373827 ?auto_373832 ) ) ( not ( = ?auto_373827 ?auto_373833 ) ) ( not ( = ?auto_373827 ?auto_373834 ) ) ( not ( = ?auto_373828 ?auto_373829 ) ) ( not ( = ?auto_373828 ?auto_373830 ) ) ( not ( = ?auto_373828 ?auto_373831 ) ) ( not ( = ?auto_373828 ?auto_373832 ) ) ( not ( = ?auto_373828 ?auto_373833 ) ) ( not ( = ?auto_373828 ?auto_373834 ) ) ( not ( = ?auto_373829 ?auto_373830 ) ) ( not ( = ?auto_373829 ?auto_373831 ) ) ( not ( = ?auto_373829 ?auto_373832 ) ) ( not ( = ?auto_373829 ?auto_373833 ) ) ( not ( = ?auto_373829 ?auto_373834 ) ) ( not ( = ?auto_373830 ?auto_373831 ) ) ( not ( = ?auto_373830 ?auto_373832 ) ) ( not ( = ?auto_373830 ?auto_373833 ) ) ( not ( = ?auto_373830 ?auto_373834 ) ) ( not ( = ?auto_373831 ?auto_373832 ) ) ( not ( = ?auto_373831 ?auto_373833 ) ) ( not ( = ?auto_373831 ?auto_373834 ) ) ( not ( = ?auto_373832 ?auto_373833 ) ) ( not ( = ?auto_373832 ?auto_373834 ) ) ( not ( = ?auto_373833 ?auto_373834 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_373833 ?auto_373834 )
      ( !STACK ?auto_373833 ?auto_373832 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_373875 - BLOCK
      ?auto_373876 - BLOCK
      ?auto_373877 - BLOCK
      ?auto_373878 - BLOCK
      ?auto_373879 - BLOCK
      ?auto_373880 - BLOCK
      ?auto_373881 - BLOCK
      ?auto_373882 - BLOCK
      ?auto_373883 - BLOCK
      ?auto_373884 - BLOCK
      ?auto_373885 - BLOCK
      ?auto_373886 - BLOCK
      ?auto_373887 - BLOCK
    )
    :vars
    (
      ?auto_373888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373887 ?auto_373888 ) ( ON-TABLE ?auto_373875 ) ( ON ?auto_373876 ?auto_373875 ) ( ON ?auto_373877 ?auto_373876 ) ( ON ?auto_373878 ?auto_373877 ) ( ON ?auto_373879 ?auto_373878 ) ( ON ?auto_373880 ?auto_373879 ) ( ON ?auto_373881 ?auto_373880 ) ( ON ?auto_373882 ?auto_373881 ) ( ON ?auto_373883 ?auto_373882 ) ( ON ?auto_373884 ?auto_373883 ) ( ON ?auto_373885 ?auto_373884 ) ( not ( = ?auto_373875 ?auto_373876 ) ) ( not ( = ?auto_373875 ?auto_373877 ) ) ( not ( = ?auto_373875 ?auto_373878 ) ) ( not ( = ?auto_373875 ?auto_373879 ) ) ( not ( = ?auto_373875 ?auto_373880 ) ) ( not ( = ?auto_373875 ?auto_373881 ) ) ( not ( = ?auto_373875 ?auto_373882 ) ) ( not ( = ?auto_373875 ?auto_373883 ) ) ( not ( = ?auto_373875 ?auto_373884 ) ) ( not ( = ?auto_373875 ?auto_373885 ) ) ( not ( = ?auto_373875 ?auto_373886 ) ) ( not ( = ?auto_373875 ?auto_373887 ) ) ( not ( = ?auto_373875 ?auto_373888 ) ) ( not ( = ?auto_373876 ?auto_373877 ) ) ( not ( = ?auto_373876 ?auto_373878 ) ) ( not ( = ?auto_373876 ?auto_373879 ) ) ( not ( = ?auto_373876 ?auto_373880 ) ) ( not ( = ?auto_373876 ?auto_373881 ) ) ( not ( = ?auto_373876 ?auto_373882 ) ) ( not ( = ?auto_373876 ?auto_373883 ) ) ( not ( = ?auto_373876 ?auto_373884 ) ) ( not ( = ?auto_373876 ?auto_373885 ) ) ( not ( = ?auto_373876 ?auto_373886 ) ) ( not ( = ?auto_373876 ?auto_373887 ) ) ( not ( = ?auto_373876 ?auto_373888 ) ) ( not ( = ?auto_373877 ?auto_373878 ) ) ( not ( = ?auto_373877 ?auto_373879 ) ) ( not ( = ?auto_373877 ?auto_373880 ) ) ( not ( = ?auto_373877 ?auto_373881 ) ) ( not ( = ?auto_373877 ?auto_373882 ) ) ( not ( = ?auto_373877 ?auto_373883 ) ) ( not ( = ?auto_373877 ?auto_373884 ) ) ( not ( = ?auto_373877 ?auto_373885 ) ) ( not ( = ?auto_373877 ?auto_373886 ) ) ( not ( = ?auto_373877 ?auto_373887 ) ) ( not ( = ?auto_373877 ?auto_373888 ) ) ( not ( = ?auto_373878 ?auto_373879 ) ) ( not ( = ?auto_373878 ?auto_373880 ) ) ( not ( = ?auto_373878 ?auto_373881 ) ) ( not ( = ?auto_373878 ?auto_373882 ) ) ( not ( = ?auto_373878 ?auto_373883 ) ) ( not ( = ?auto_373878 ?auto_373884 ) ) ( not ( = ?auto_373878 ?auto_373885 ) ) ( not ( = ?auto_373878 ?auto_373886 ) ) ( not ( = ?auto_373878 ?auto_373887 ) ) ( not ( = ?auto_373878 ?auto_373888 ) ) ( not ( = ?auto_373879 ?auto_373880 ) ) ( not ( = ?auto_373879 ?auto_373881 ) ) ( not ( = ?auto_373879 ?auto_373882 ) ) ( not ( = ?auto_373879 ?auto_373883 ) ) ( not ( = ?auto_373879 ?auto_373884 ) ) ( not ( = ?auto_373879 ?auto_373885 ) ) ( not ( = ?auto_373879 ?auto_373886 ) ) ( not ( = ?auto_373879 ?auto_373887 ) ) ( not ( = ?auto_373879 ?auto_373888 ) ) ( not ( = ?auto_373880 ?auto_373881 ) ) ( not ( = ?auto_373880 ?auto_373882 ) ) ( not ( = ?auto_373880 ?auto_373883 ) ) ( not ( = ?auto_373880 ?auto_373884 ) ) ( not ( = ?auto_373880 ?auto_373885 ) ) ( not ( = ?auto_373880 ?auto_373886 ) ) ( not ( = ?auto_373880 ?auto_373887 ) ) ( not ( = ?auto_373880 ?auto_373888 ) ) ( not ( = ?auto_373881 ?auto_373882 ) ) ( not ( = ?auto_373881 ?auto_373883 ) ) ( not ( = ?auto_373881 ?auto_373884 ) ) ( not ( = ?auto_373881 ?auto_373885 ) ) ( not ( = ?auto_373881 ?auto_373886 ) ) ( not ( = ?auto_373881 ?auto_373887 ) ) ( not ( = ?auto_373881 ?auto_373888 ) ) ( not ( = ?auto_373882 ?auto_373883 ) ) ( not ( = ?auto_373882 ?auto_373884 ) ) ( not ( = ?auto_373882 ?auto_373885 ) ) ( not ( = ?auto_373882 ?auto_373886 ) ) ( not ( = ?auto_373882 ?auto_373887 ) ) ( not ( = ?auto_373882 ?auto_373888 ) ) ( not ( = ?auto_373883 ?auto_373884 ) ) ( not ( = ?auto_373883 ?auto_373885 ) ) ( not ( = ?auto_373883 ?auto_373886 ) ) ( not ( = ?auto_373883 ?auto_373887 ) ) ( not ( = ?auto_373883 ?auto_373888 ) ) ( not ( = ?auto_373884 ?auto_373885 ) ) ( not ( = ?auto_373884 ?auto_373886 ) ) ( not ( = ?auto_373884 ?auto_373887 ) ) ( not ( = ?auto_373884 ?auto_373888 ) ) ( not ( = ?auto_373885 ?auto_373886 ) ) ( not ( = ?auto_373885 ?auto_373887 ) ) ( not ( = ?auto_373885 ?auto_373888 ) ) ( not ( = ?auto_373886 ?auto_373887 ) ) ( not ( = ?auto_373886 ?auto_373888 ) ) ( not ( = ?auto_373887 ?auto_373888 ) ) ( CLEAR ?auto_373885 ) ( ON ?auto_373886 ?auto_373887 ) ( CLEAR ?auto_373886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_373875 ?auto_373876 ?auto_373877 ?auto_373878 ?auto_373879 ?auto_373880 ?auto_373881 ?auto_373882 ?auto_373883 ?auto_373884 ?auto_373885 ?auto_373886 )
      ( MAKE-13PILE ?auto_373875 ?auto_373876 ?auto_373877 ?auto_373878 ?auto_373879 ?auto_373880 ?auto_373881 ?auto_373882 ?auto_373883 ?auto_373884 ?auto_373885 ?auto_373886 ?auto_373887 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_373929 - BLOCK
      ?auto_373930 - BLOCK
      ?auto_373931 - BLOCK
      ?auto_373932 - BLOCK
      ?auto_373933 - BLOCK
      ?auto_373934 - BLOCK
      ?auto_373935 - BLOCK
      ?auto_373936 - BLOCK
      ?auto_373937 - BLOCK
      ?auto_373938 - BLOCK
      ?auto_373939 - BLOCK
      ?auto_373940 - BLOCK
      ?auto_373941 - BLOCK
    )
    :vars
    (
      ?auto_373942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373941 ?auto_373942 ) ( ON-TABLE ?auto_373929 ) ( ON ?auto_373930 ?auto_373929 ) ( ON ?auto_373931 ?auto_373930 ) ( ON ?auto_373932 ?auto_373931 ) ( ON ?auto_373933 ?auto_373932 ) ( ON ?auto_373934 ?auto_373933 ) ( ON ?auto_373935 ?auto_373934 ) ( ON ?auto_373936 ?auto_373935 ) ( ON ?auto_373937 ?auto_373936 ) ( ON ?auto_373938 ?auto_373937 ) ( not ( = ?auto_373929 ?auto_373930 ) ) ( not ( = ?auto_373929 ?auto_373931 ) ) ( not ( = ?auto_373929 ?auto_373932 ) ) ( not ( = ?auto_373929 ?auto_373933 ) ) ( not ( = ?auto_373929 ?auto_373934 ) ) ( not ( = ?auto_373929 ?auto_373935 ) ) ( not ( = ?auto_373929 ?auto_373936 ) ) ( not ( = ?auto_373929 ?auto_373937 ) ) ( not ( = ?auto_373929 ?auto_373938 ) ) ( not ( = ?auto_373929 ?auto_373939 ) ) ( not ( = ?auto_373929 ?auto_373940 ) ) ( not ( = ?auto_373929 ?auto_373941 ) ) ( not ( = ?auto_373929 ?auto_373942 ) ) ( not ( = ?auto_373930 ?auto_373931 ) ) ( not ( = ?auto_373930 ?auto_373932 ) ) ( not ( = ?auto_373930 ?auto_373933 ) ) ( not ( = ?auto_373930 ?auto_373934 ) ) ( not ( = ?auto_373930 ?auto_373935 ) ) ( not ( = ?auto_373930 ?auto_373936 ) ) ( not ( = ?auto_373930 ?auto_373937 ) ) ( not ( = ?auto_373930 ?auto_373938 ) ) ( not ( = ?auto_373930 ?auto_373939 ) ) ( not ( = ?auto_373930 ?auto_373940 ) ) ( not ( = ?auto_373930 ?auto_373941 ) ) ( not ( = ?auto_373930 ?auto_373942 ) ) ( not ( = ?auto_373931 ?auto_373932 ) ) ( not ( = ?auto_373931 ?auto_373933 ) ) ( not ( = ?auto_373931 ?auto_373934 ) ) ( not ( = ?auto_373931 ?auto_373935 ) ) ( not ( = ?auto_373931 ?auto_373936 ) ) ( not ( = ?auto_373931 ?auto_373937 ) ) ( not ( = ?auto_373931 ?auto_373938 ) ) ( not ( = ?auto_373931 ?auto_373939 ) ) ( not ( = ?auto_373931 ?auto_373940 ) ) ( not ( = ?auto_373931 ?auto_373941 ) ) ( not ( = ?auto_373931 ?auto_373942 ) ) ( not ( = ?auto_373932 ?auto_373933 ) ) ( not ( = ?auto_373932 ?auto_373934 ) ) ( not ( = ?auto_373932 ?auto_373935 ) ) ( not ( = ?auto_373932 ?auto_373936 ) ) ( not ( = ?auto_373932 ?auto_373937 ) ) ( not ( = ?auto_373932 ?auto_373938 ) ) ( not ( = ?auto_373932 ?auto_373939 ) ) ( not ( = ?auto_373932 ?auto_373940 ) ) ( not ( = ?auto_373932 ?auto_373941 ) ) ( not ( = ?auto_373932 ?auto_373942 ) ) ( not ( = ?auto_373933 ?auto_373934 ) ) ( not ( = ?auto_373933 ?auto_373935 ) ) ( not ( = ?auto_373933 ?auto_373936 ) ) ( not ( = ?auto_373933 ?auto_373937 ) ) ( not ( = ?auto_373933 ?auto_373938 ) ) ( not ( = ?auto_373933 ?auto_373939 ) ) ( not ( = ?auto_373933 ?auto_373940 ) ) ( not ( = ?auto_373933 ?auto_373941 ) ) ( not ( = ?auto_373933 ?auto_373942 ) ) ( not ( = ?auto_373934 ?auto_373935 ) ) ( not ( = ?auto_373934 ?auto_373936 ) ) ( not ( = ?auto_373934 ?auto_373937 ) ) ( not ( = ?auto_373934 ?auto_373938 ) ) ( not ( = ?auto_373934 ?auto_373939 ) ) ( not ( = ?auto_373934 ?auto_373940 ) ) ( not ( = ?auto_373934 ?auto_373941 ) ) ( not ( = ?auto_373934 ?auto_373942 ) ) ( not ( = ?auto_373935 ?auto_373936 ) ) ( not ( = ?auto_373935 ?auto_373937 ) ) ( not ( = ?auto_373935 ?auto_373938 ) ) ( not ( = ?auto_373935 ?auto_373939 ) ) ( not ( = ?auto_373935 ?auto_373940 ) ) ( not ( = ?auto_373935 ?auto_373941 ) ) ( not ( = ?auto_373935 ?auto_373942 ) ) ( not ( = ?auto_373936 ?auto_373937 ) ) ( not ( = ?auto_373936 ?auto_373938 ) ) ( not ( = ?auto_373936 ?auto_373939 ) ) ( not ( = ?auto_373936 ?auto_373940 ) ) ( not ( = ?auto_373936 ?auto_373941 ) ) ( not ( = ?auto_373936 ?auto_373942 ) ) ( not ( = ?auto_373937 ?auto_373938 ) ) ( not ( = ?auto_373937 ?auto_373939 ) ) ( not ( = ?auto_373937 ?auto_373940 ) ) ( not ( = ?auto_373937 ?auto_373941 ) ) ( not ( = ?auto_373937 ?auto_373942 ) ) ( not ( = ?auto_373938 ?auto_373939 ) ) ( not ( = ?auto_373938 ?auto_373940 ) ) ( not ( = ?auto_373938 ?auto_373941 ) ) ( not ( = ?auto_373938 ?auto_373942 ) ) ( not ( = ?auto_373939 ?auto_373940 ) ) ( not ( = ?auto_373939 ?auto_373941 ) ) ( not ( = ?auto_373939 ?auto_373942 ) ) ( not ( = ?auto_373940 ?auto_373941 ) ) ( not ( = ?auto_373940 ?auto_373942 ) ) ( not ( = ?auto_373941 ?auto_373942 ) ) ( ON ?auto_373940 ?auto_373941 ) ( CLEAR ?auto_373938 ) ( ON ?auto_373939 ?auto_373940 ) ( CLEAR ?auto_373939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_373929 ?auto_373930 ?auto_373931 ?auto_373932 ?auto_373933 ?auto_373934 ?auto_373935 ?auto_373936 ?auto_373937 ?auto_373938 ?auto_373939 )
      ( MAKE-13PILE ?auto_373929 ?auto_373930 ?auto_373931 ?auto_373932 ?auto_373933 ?auto_373934 ?auto_373935 ?auto_373936 ?auto_373937 ?auto_373938 ?auto_373939 ?auto_373940 ?auto_373941 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_373983 - BLOCK
      ?auto_373984 - BLOCK
      ?auto_373985 - BLOCK
      ?auto_373986 - BLOCK
      ?auto_373987 - BLOCK
      ?auto_373988 - BLOCK
      ?auto_373989 - BLOCK
      ?auto_373990 - BLOCK
      ?auto_373991 - BLOCK
      ?auto_373992 - BLOCK
      ?auto_373993 - BLOCK
      ?auto_373994 - BLOCK
      ?auto_373995 - BLOCK
    )
    :vars
    (
      ?auto_373996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373995 ?auto_373996 ) ( ON-TABLE ?auto_373983 ) ( ON ?auto_373984 ?auto_373983 ) ( ON ?auto_373985 ?auto_373984 ) ( ON ?auto_373986 ?auto_373985 ) ( ON ?auto_373987 ?auto_373986 ) ( ON ?auto_373988 ?auto_373987 ) ( ON ?auto_373989 ?auto_373988 ) ( ON ?auto_373990 ?auto_373989 ) ( ON ?auto_373991 ?auto_373990 ) ( not ( = ?auto_373983 ?auto_373984 ) ) ( not ( = ?auto_373983 ?auto_373985 ) ) ( not ( = ?auto_373983 ?auto_373986 ) ) ( not ( = ?auto_373983 ?auto_373987 ) ) ( not ( = ?auto_373983 ?auto_373988 ) ) ( not ( = ?auto_373983 ?auto_373989 ) ) ( not ( = ?auto_373983 ?auto_373990 ) ) ( not ( = ?auto_373983 ?auto_373991 ) ) ( not ( = ?auto_373983 ?auto_373992 ) ) ( not ( = ?auto_373983 ?auto_373993 ) ) ( not ( = ?auto_373983 ?auto_373994 ) ) ( not ( = ?auto_373983 ?auto_373995 ) ) ( not ( = ?auto_373983 ?auto_373996 ) ) ( not ( = ?auto_373984 ?auto_373985 ) ) ( not ( = ?auto_373984 ?auto_373986 ) ) ( not ( = ?auto_373984 ?auto_373987 ) ) ( not ( = ?auto_373984 ?auto_373988 ) ) ( not ( = ?auto_373984 ?auto_373989 ) ) ( not ( = ?auto_373984 ?auto_373990 ) ) ( not ( = ?auto_373984 ?auto_373991 ) ) ( not ( = ?auto_373984 ?auto_373992 ) ) ( not ( = ?auto_373984 ?auto_373993 ) ) ( not ( = ?auto_373984 ?auto_373994 ) ) ( not ( = ?auto_373984 ?auto_373995 ) ) ( not ( = ?auto_373984 ?auto_373996 ) ) ( not ( = ?auto_373985 ?auto_373986 ) ) ( not ( = ?auto_373985 ?auto_373987 ) ) ( not ( = ?auto_373985 ?auto_373988 ) ) ( not ( = ?auto_373985 ?auto_373989 ) ) ( not ( = ?auto_373985 ?auto_373990 ) ) ( not ( = ?auto_373985 ?auto_373991 ) ) ( not ( = ?auto_373985 ?auto_373992 ) ) ( not ( = ?auto_373985 ?auto_373993 ) ) ( not ( = ?auto_373985 ?auto_373994 ) ) ( not ( = ?auto_373985 ?auto_373995 ) ) ( not ( = ?auto_373985 ?auto_373996 ) ) ( not ( = ?auto_373986 ?auto_373987 ) ) ( not ( = ?auto_373986 ?auto_373988 ) ) ( not ( = ?auto_373986 ?auto_373989 ) ) ( not ( = ?auto_373986 ?auto_373990 ) ) ( not ( = ?auto_373986 ?auto_373991 ) ) ( not ( = ?auto_373986 ?auto_373992 ) ) ( not ( = ?auto_373986 ?auto_373993 ) ) ( not ( = ?auto_373986 ?auto_373994 ) ) ( not ( = ?auto_373986 ?auto_373995 ) ) ( not ( = ?auto_373986 ?auto_373996 ) ) ( not ( = ?auto_373987 ?auto_373988 ) ) ( not ( = ?auto_373987 ?auto_373989 ) ) ( not ( = ?auto_373987 ?auto_373990 ) ) ( not ( = ?auto_373987 ?auto_373991 ) ) ( not ( = ?auto_373987 ?auto_373992 ) ) ( not ( = ?auto_373987 ?auto_373993 ) ) ( not ( = ?auto_373987 ?auto_373994 ) ) ( not ( = ?auto_373987 ?auto_373995 ) ) ( not ( = ?auto_373987 ?auto_373996 ) ) ( not ( = ?auto_373988 ?auto_373989 ) ) ( not ( = ?auto_373988 ?auto_373990 ) ) ( not ( = ?auto_373988 ?auto_373991 ) ) ( not ( = ?auto_373988 ?auto_373992 ) ) ( not ( = ?auto_373988 ?auto_373993 ) ) ( not ( = ?auto_373988 ?auto_373994 ) ) ( not ( = ?auto_373988 ?auto_373995 ) ) ( not ( = ?auto_373988 ?auto_373996 ) ) ( not ( = ?auto_373989 ?auto_373990 ) ) ( not ( = ?auto_373989 ?auto_373991 ) ) ( not ( = ?auto_373989 ?auto_373992 ) ) ( not ( = ?auto_373989 ?auto_373993 ) ) ( not ( = ?auto_373989 ?auto_373994 ) ) ( not ( = ?auto_373989 ?auto_373995 ) ) ( not ( = ?auto_373989 ?auto_373996 ) ) ( not ( = ?auto_373990 ?auto_373991 ) ) ( not ( = ?auto_373990 ?auto_373992 ) ) ( not ( = ?auto_373990 ?auto_373993 ) ) ( not ( = ?auto_373990 ?auto_373994 ) ) ( not ( = ?auto_373990 ?auto_373995 ) ) ( not ( = ?auto_373990 ?auto_373996 ) ) ( not ( = ?auto_373991 ?auto_373992 ) ) ( not ( = ?auto_373991 ?auto_373993 ) ) ( not ( = ?auto_373991 ?auto_373994 ) ) ( not ( = ?auto_373991 ?auto_373995 ) ) ( not ( = ?auto_373991 ?auto_373996 ) ) ( not ( = ?auto_373992 ?auto_373993 ) ) ( not ( = ?auto_373992 ?auto_373994 ) ) ( not ( = ?auto_373992 ?auto_373995 ) ) ( not ( = ?auto_373992 ?auto_373996 ) ) ( not ( = ?auto_373993 ?auto_373994 ) ) ( not ( = ?auto_373993 ?auto_373995 ) ) ( not ( = ?auto_373993 ?auto_373996 ) ) ( not ( = ?auto_373994 ?auto_373995 ) ) ( not ( = ?auto_373994 ?auto_373996 ) ) ( not ( = ?auto_373995 ?auto_373996 ) ) ( ON ?auto_373994 ?auto_373995 ) ( ON ?auto_373993 ?auto_373994 ) ( CLEAR ?auto_373991 ) ( ON ?auto_373992 ?auto_373993 ) ( CLEAR ?auto_373992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_373983 ?auto_373984 ?auto_373985 ?auto_373986 ?auto_373987 ?auto_373988 ?auto_373989 ?auto_373990 ?auto_373991 ?auto_373992 )
      ( MAKE-13PILE ?auto_373983 ?auto_373984 ?auto_373985 ?auto_373986 ?auto_373987 ?auto_373988 ?auto_373989 ?auto_373990 ?auto_373991 ?auto_373992 ?auto_373993 ?auto_373994 ?auto_373995 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374037 - BLOCK
      ?auto_374038 - BLOCK
      ?auto_374039 - BLOCK
      ?auto_374040 - BLOCK
      ?auto_374041 - BLOCK
      ?auto_374042 - BLOCK
      ?auto_374043 - BLOCK
      ?auto_374044 - BLOCK
      ?auto_374045 - BLOCK
      ?auto_374046 - BLOCK
      ?auto_374047 - BLOCK
      ?auto_374048 - BLOCK
      ?auto_374049 - BLOCK
    )
    :vars
    (
      ?auto_374050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374049 ?auto_374050 ) ( ON-TABLE ?auto_374037 ) ( ON ?auto_374038 ?auto_374037 ) ( ON ?auto_374039 ?auto_374038 ) ( ON ?auto_374040 ?auto_374039 ) ( ON ?auto_374041 ?auto_374040 ) ( ON ?auto_374042 ?auto_374041 ) ( ON ?auto_374043 ?auto_374042 ) ( ON ?auto_374044 ?auto_374043 ) ( not ( = ?auto_374037 ?auto_374038 ) ) ( not ( = ?auto_374037 ?auto_374039 ) ) ( not ( = ?auto_374037 ?auto_374040 ) ) ( not ( = ?auto_374037 ?auto_374041 ) ) ( not ( = ?auto_374037 ?auto_374042 ) ) ( not ( = ?auto_374037 ?auto_374043 ) ) ( not ( = ?auto_374037 ?auto_374044 ) ) ( not ( = ?auto_374037 ?auto_374045 ) ) ( not ( = ?auto_374037 ?auto_374046 ) ) ( not ( = ?auto_374037 ?auto_374047 ) ) ( not ( = ?auto_374037 ?auto_374048 ) ) ( not ( = ?auto_374037 ?auto_374049 ) ) ( not ( = ?auto_374037 ?auto_374050 ) ) ( not ( = ?auto_374038 ?auto_374039 ) ) ( not ( = ?auto_374038 ?auto_374040 ) ) ( not ( = ?auto_374038 ?auto_374041 ) ) ( not ( = ?auto_374038 ?auto_374042 ) ) ( not ( = ?auto_374038 ?auto_374043 ) ) ( not ( = ?auto_374038 ?auto_374044 ) ) ( not ( = ?auto_374038 ?auto_374045 ) ) ( not ( = ?auto_374038 ?auto_374046 ) ) ( not ( = ?auto_374038 ?auto_374047 ) ) ( not ( = ?auto_374038 ?auto_374048 ) ) ( not ( = ?auto_374038 ?auto_374049 ) ) ( not ( = ?auto_374038 ?auto_374050 ) ) ( not ( = ?auto_374039 ?auto_374040 ) ) ( not ( = ?auto_374039 ?auto_374041 ) ) ( not ( = ?auto_374039 ?auto_374042 ) ) ( not ( = ?auto_374039 ?auto_374043 ) ) ( not ( = ?auto_374039 ?auto_374044 ) ) ( not ( = ?auto_374039 ?auto_374045 ) ) ( not ( = ?auto_374039 ?auto_374046 ) ) ( not ( = ?auto_374039 ?auto_374047 ) ) ( not ( = ?auto_374039 ?auto_374048 ) ) ( not ( = ?auto_374039 ?auto_374049 ) ) ( not ( = ?auto_374039 ?auto_374050 ) ) ( not ( = ?auto_374040 ?auto_374041 ) ) ( not ( = ?auto_374040 ?auto_374042 ) ) ( not ( = ?auto_374040 ?auto_374043 ) ) ( not ( = ?auto_374040 ?auto_374044 ) ) ( not ( = ?auto_374040 ?auto_374045 ) ) ( not ( = ?auto_374040 ?auto_374046 ) ) ( not ( = ?auto_374040 ?auto_374047 ) ) ( not ( = ?auto_374040 ?auto_374048 ) ) ( not ( = ?auto_374040 ?auto_374049 ) ) ( not ( = ?auto_374040 ?auto_374050 ) ) ( not ( = ?auto_374041 ?auto_374042 ) ) ( not ( = ?auto_374041 ?auto_374043 ) ) ( not ( = ?auto_374041 ?auto_374044 ) ) ( not ( = ?auto_374041 ?auto_374045 ) ) ( not ( = ?auto_374041 ?auto_374046 ) ) ( not ( = ?auto_374041 ?auto_374047 ) ) ( not ( = ?auto_374041 ?auto_374048 ) ) ( not ( = ?auto_374041 ?auto_374049 ) ) ( not ( = ?auto_374041 ?auto_374050 ) ) ( not ( = ?auto_374042 ?auto_374043 ) ) ( not ( = ?auto_374042 ?auto_374044 ) ) ( not ( = ?auto_374042 ?auto_374045 ) ) ( not ( = ?auto_374042 ?auto_374046 ) ) ( not ( = ?auto_374042 ?auto_374047 ) ) ( not ( = ?auto_374042 ?auto_374048 ) ) ( not ( = ?auto_374042 ?auto_374049 ) ) ( not ( = ?auto_374042 ?auto_374050 ) ) ( not ( = ?auto_374043 ?auto_374044 ) ) ( not ( = ?auto_374043 ?auto_374045 ) ) ( not ( = ?auto_374043 ?auto_374046 ) ) ( not ( = ?auto_374043 ?auto_374047 ) ) ( not ( = ?auto_374043 ?auto_374048 ) ) ( not ( = ?auto_374043 ?auto_374049 ) ) ( not ( = ?auto_374043 ?auto_374050 ) ) ( not ( = ?auto_374044 ?auto_374045 ) ) ( not ( = ?auto_374044 ?auto_374046 ) ) ( not ( = ?auto_374044 ?auto_374047 ) ) ( not ( = ?auto_374044 ?auto_374048 ) ) ( not ( = ?auto_374044 ?auto_374049 ) ) ( not ( = ?auto_374044 ?auto_374050 ) ) ( not ( = ?auto_374045 ?auto_374046 ) ) ( not ( = ?auto_374045 ?auto_374047 ) ) ( not ( = ?auto_374045 ?auto_374048 ) ) ( not ( = ?auto_374045 ?auto_374049 ) ) ( not ( = ?auto_374045 ?auto_374050 ) ) ( not ( = ?auto_374046 ?auto_374047 ) ) ( not ( = ?auto_374046 ?auto_374048 ) ) ( not ( = ?auto_374046 ?auto_374049 ) ) ( not ( = ?auto_374046 ?auto_374050 ) ) ( not ( = ?auto_374047 ?auto_374048 ) ) ( not ( = ?auto_374047 ?auto_374049 ) ) ( not ( = ?auto_374047 ?auto_374050 ) ) ( not ( = ?auto_374048 ?auto_374049 ) ) ( not ( = ?auto_374048 ?auto_374050 ) ) ( not ( = ?auto_374049 ?auto_374050 ) ) ( ON ?auto_374048 ?auto_374049 ) ( ON ?auto_374047 ?auto_374048 ) ( ON ?auto_374046 ?auto_374047 ) ( CLEAR ?auto_374044 ) ( ON ?auto_374045 ?auto_374046 ) ( CLEAR ?auto_374045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_374037 ?auto_374038 ?auto_374039 ?auto_374040 ?auto_374041 ?auto_374042 ?auto_374043 ?auto_374044 ?auto_374045 )
      ( MAKE-13PILE ?auto_374037 ?auto_374038 ?auto_374039 ?auto_374040 ?auto_374041 ?auto_374042 ?auto_374043 ?auto_374044 ?auto_374045 ?auto_374046 ?auto_374047 ?auto_374048 ?auto_374049 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374091 - BLOCK
      ?auto_374092 - BLOCK
      ?auto_374093 - BLOCK
      ?auto_374094 - BLOCK
      ?auto_374095 - BLOCK
      ?auto_374096 - BLOCK
      ?auto_374097 - BLOCK
      ?auto_374098 - BLOCK
      ?auto_374099 - BLOCK
      ?auto_374100 - BLOCK
      ?auto_374101 - BLOCK
      ?auto_374102 - BLOCK
      ?auto_374103 - BLOCK
    )
    :vars
    (
      ?auto_374104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374103 ?auto_374104 ) ( ON-TABLE ?auto_374091 ) ( ON ?auto_374092 ?auto_374091 ) ( ON ?auto_374093 ?auto_374092 ) ( ON ?auto_374094 ?auto_374093 ) ( ON ?auto_374095 ?auto_374094 ) ( ON ?auto_374096 ?auto_374095 ) ( ON ?auto_374097 ?auto_374096 ) ( not ( = ?auto_374091 ?auto_374092 ) ) ( not ( = ?auto_374091 ?auto_374093 ) ) ( not ( = ?auto_374091 ?auto_374094 ) ) ( not ( = ?auto_374091 ?auto_374095 ) ) ( not ( = ?auto_374091 ?auto_374096 ) ) ( not ( = ?auto_374091 ?auto_374097 ) ) ( not ( = ?auto_374091 ?auto_374098 ) ) ( not ( = ?auto_374091 ?auto_374099 ) ) ( not ( = ?auto_374091 ?auto_374100 ) ) ( not ( = ?auto_374091 ?auto_374101 ) ) ( not ( = ?auto_374091 ?auto_374102 ) ) ( not ( = ?auto_374091 ?auto_374103 ) ) ( not ( = ?auto_374091 ?auto_374104 ) ) ( not ( = ?auto_374092 ?auto_374093 ) ) ( not ( = ?auto_374092 ?auto_374094 ) ) ( not ( = ?auto_374092 ?auto_374095 ) ) ( not ( = ?auto_374092 ?auto_374096 ) ) ( not ( = ?auto_374092 ?auto_374097 ) ) ( not ( = ?auto_374092 ?auto_374098 ) ) ( not ( = ?auto_374092 ?auto_374099 ) ) ( not ( = ?auto_374092 ?auto_374100 ) ) ( not ( = ?auto_374092 ?auto_374101 ) ) ( not ( = ?auto_374092 ?auto_374102 ) ) ( not ( = ?auto_374092 ?auto_374103 ) ) ( not ( = ?auto_374092 ?auto_374104 ) ) ( not ( = ?auto_374093 ?auto_374094 ) ) ( not ( = ?auto_374093 ?auto_374095 ) ) ( not ( = ?auto_374093 ?auto_374096 ) ) ( not ( = ?auto_374093 ?auto_374097 ) ) ( not ( = ?auto_374093 ?auto_374098 ) ) ( not ( = ?auto_374093 ?auto_374099 ) ) ( not ( = ?auto_374093 ?auto_374100 ) ) ( not ( = ?auto_374093 ?auto_374101 ) ) ( not ( = ?auto_374093 ?auto_374102 ) ) ( not ( = ?auto_374093 ?auto_374103 ) ) ( not ( = ?auto_374093 ?auto_374104 ) ) ( not ( = ?auto_374094 ?auto_374095 ) ) ( not ( = ?auto_374094 ?auto_374096 ) ) ( not ( = ?auto_374094 ?auto_374097 ) ) ( not ( = ?auto_374094 ?auto_374098 ) ) ( not ( = ?auto_374094 ?auto_374099 ) ) ( not ( = ?auto_374094 ?auto_374100 ) ) ( not ( = ?auto_374094 ?auto_374101 ) ) ( not ( = ?auto_374094 ?auto_374102 ) ) ( not ( = ?auto_374094 ?auto_374103 ) ) ( not ( = ?auto_374094 ?auto_374104 ) ) ( not ( = ?auto_374095 ?auto_374096 ) ) ( not ( = ?auto_374095 ?auto_374097 ) ) ( not ( = ?auto_374095 ?auto_374098 ) ) ( not ( = ?auto_374095 ?auto_374099 ) ) ( not ( = ?auto_374095 ?auto_374100 ) ) ( not ( = ?auto_374095 ?auto_374101 ) ) ( not ( = ?auto_374095 ?auto_374102 ) ) ( not ( = ?auto_374095 ?auto_374103 ) ) ( not ( = ?auto_374095 ?auto_374104 ) ) ( not ( = ?auto_374096 ?auto_374097 ) ) ( not ( = ?auto_374096 ?auto_374098 ) ) ( not ( = ?auto_374096 ?auto_374099 ) ) ( not ( = ?auto_374096 ?auto_374100 ) ) ( not ( = ?auto_374096 ?auto_374101 ) ) ( not ( = ?auto_374096 ?auto_374102 ) ) ( not ( = ?auto_374096 ?auto_374103 ) ) ( not ( = ?auto_374096 ?auto_374104 ) ) ( not ( = ?auto_374097 ?auto_374098 ) ) ( not ( = ?auto_374097 ?auto_374099 ) ) ( not ( = ?auto_374097 ?auto_374100 ) ) ( not ( = ?auto_374097 ?auto_374101 ) ) ( not ( = ?auto_374097 ?auto_374102 ) ) ( not ( = ?auto_374097 ?auto_374103 ) ) ( not ( = ?auto_374097 ?auto_374104 ) ) ( not ( = ?auto_374098 ?auto_374099 ) ) ( not ( = ?auto_374098 ?auto_374100 ) ) ( not ( = ?auto_374098 ?auto_374101 ) ) ( not ( = ?auto_374098 ?auto_374102 ) ) ( not ( = ?auto_374098 ?auto_374103 ) ) ( not ( = ?auto_374098 ?auto_374104 ) ) ( not ( = ?auto_374099 ?auto_374100 ) ) ( not ( = ?auto_374099 ?auto_374101 ) ) ( not ( = ?auto_374099 ?auto_374102 ) ) ( not ( = ?auto_374099 ?auto_374103 ) ) ( not ( = ?auto_374099 ?auto_374104 ) ) ( not ( = ?auto_374100 ?auto_374101 ) ) ( not ( = ?auto_374100 ?auto_374102 ) ) ( not ( = ?auto_374100 ?auto_374103 ) ) ( not ( = ?auto_374100 ?auto_374104 ) ) ( not ( = ?auto_374101 ?auto_374102 ) ) ( not ( = ?auto_374101 ?auto_374103 ) ) ( not ( = ?auto_374101 ?auto_374104 ) ) ( not ( = ?auto_374102 ?auto_374103 ) ) ( not ( = ?auto_374102 ?auto_374104 ) ) ( not ( = ?auto_374103 ?auto_374104 ) ) ( ON ?auto_374102 ?auto_374103 ) ( ON ?auto_374101 ?auto_374102 ) ( ON ?auto_374100 ?auto_374101 ) ( ON ?auto_374099 ?auto_374100 ) ( CLEAR ?auto_374097 ) ( ON ?auto_374098 ?auto_374099 ) ( CLEAR ?auto_374098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_374091 ?auto_374092 ?auto_374093 ?auto_374094 ?auto_374095 ?auto_374096 ?auto_374097 ?auto_374098 )
      ( MAKE-13PILE ?auto_374091 ?auto_374092 ?auto_374093 ?auto_374094 ?auto_374095 ?auto_374096 ?auto_374097 ?auto_374098 ?auto_374099 ?auto_374100 ?auto_374101 ?auto_374102 ?auto_374103 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374145 - BLOCK
      ?auto_374146 - BLOCK
      ?auto_374147 - BLOCK
      ?auto_374148 - BLOCK
      ?auto_374149 - BLOCK
      ?auto_374150 - BLOCK
      ?auto_374151 - BLOCK
      ?auto_374152 - BLOCK
      ?auto_374153 - BLOCK
      ?auto_374154 - BLOCK
      ?auto_374155 - BLOCK
      ?auto_374156 - BLOCK
      ?auto_374157 - BLOCK
    )
    :vars
    (
      ?auto_374158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374157 ?auto_374158 ) ( ON-TABLE ?auto_374145 ) ( ON ?auto_374146 ?auto_374145 ) ( ON ?auto_374147 ?auto_374146 ) ( ON ?auto_374148 ?auto_374147 ) ( ON ?auto_374149 ?auto_374148 ) ( ON ?auto_374150 ?auto_374149 ) ( not ( = ?auto_374145 ?auto_374146 ) ) ( not ( = ?auto_374145 ?auto_374147 ) ) ( not ( = ?auto_374145 ?auto_374148 ) ) ( not ( = ?auto_374145 ?auto_374149 ) ) ( not ( = ?auto_374145 ?auto_374150 ) ) ( not ( = ?auto_374145 ?auto_374151 ) ) ( not ( = ?auto_374145 ?auto_374152 ) ) ( not ( = ?auto_374145 ?auto_374153 ) ) ( not ( = ?auto_374145 ?auto_374154 ) ) ( not ( = ?auto_374145 ?auto_374155 ) ) ( not ( = ?auto_374145 ?auto_374156 ) ) ( not ( = ?auto_374145 ?auto_374157 ) ) ( not ( = ?auto_374145 ?auto_374158 ) ) ( not ( = ?auto_374146 ?auto_374147 ) ) ( not ( = ?auto_374146 ?auto_374148 ) ) ( not ( = ?auto_374146 ?auto_374149 ) ) ( not ( = ?auto_374146 ?auto_374150 ) ) ( not ( = ?auto_374146 ?auto_374151 ) ) ( not ( = ?auto_374146 ?auto_374152 ) ) ( not ( = ?auto_374146 ?auto_374153 ) ) ( not ( = ?auto_374146 ?auto_374154 ) ) ( not ( = ?auto_374146 ?auto_374155 ) ) ( not ( = ?auto_374146 ?auto_374156 ) ) ( not ( = ?auto_374146 ?auto_374157 ) ) ( not ( = ?auto_374146 ?auto_374158 ) ) ( not ( = ?auto_374147 ?auto_374148 ) ) ( not ( = ?auto_374147 ?auto_374149 ) ) ( not ( = ?auto_374147 ?auto_374150 ) ) ( not ( = ?auto_374147 ?auto_374151 ) ) ( not ( = ?auto_374147 ?auto_374152 ) ) ( not ( = ?auto_374147 ?auto_374153 ) ) ( not ( = ?auto_374147 ?auto_374154 ) ) ( not ( = ?auto_374147 ?auto_374155 ) ) ( not ( = ?auto_374147 ?auto_374156 ) ) ( not ( = ?auto_374147 ?auto_374157 ) ) ( not ( = ?auto_374147 ?auto_374158 ) ) ( not ( = ?auto_374148 ?auto_374149 ) ) ( not ( = ?auto_374148 ?auto_374150 ) ) ( not ( = ?auto_374148 ?auto_374151 ) ) ( not ( = ?auto_374148 ?auto_374152 ) ) ( not ( = ?auto_374148 ?auto_374153 ) ) ( not ( = ?auto_374148 ?auto_374154 ) ) ( not ( = ?auto_374148 ?auto_374155 ) ) ( not ( = ?auto_374148 ?auto_374156 ) ) ( not ( = ?auto_374148 ?auto_374157 ) ) ( not ( = ?auto_374148 ?auto_374158 ) ) ( not ( = ?auto_374149 ?auto_374150 ) ) ( not ( = ?auto_374149 ?auto_374151 ) ) ( not ( = ?auto_374149 ?auto_374152 ) ) ( not ( = ?auto_374149 ?auto_374153 ) ) ( not ( = ?auto_374149 ?auto_374154 ) ) ( not ( = ?auto_374149 ?auto_374155 ) ) ( not ( = ?auto_374149 ?auto_374156 ) ) ( not ( = ?auto_374149 ?auto_374157 ) ) ( not ( = ?auto_374149 ?auto_374158 ) ) ( not ( = ?auto_374150 ?auto_374151 ) ) ( not ( = ?auto_374150 ?auto_374152 ) ) ( not ( = ?auto_374150 ?auto_374153 ) ) ( not ( = ?auto_374150 ?auto_374154 ) ) ( not ( = ?auto_374150 ?auto_374155 ) ) ( not ( = ?auto_374150 ?auto_374156 ) ) ( not ( = ?auto_374150 ?auto_374157 ) ) ( not ( = ?auto_374150 ?auto_374158 ) ) ( not ( = ?auto_374151 ?auto_374152 ) ) ( not ( = ?auto_374151 ?auto_374153 ) ) ( not ( = ?auto_374151 ?auto_374154 ) ) ( not ( = ?auto_374151 ?auto_374155 ) ) ( not ( = ?auto_374151 ?auto_374156 ) ) ( not ( = ?auto_374151 ?auto_374157 ) ) ( not ( = ?auto_374151 ?auto_374158 ) ) ( not ( = ?auto_374152 ?auto_374153 ) ) ( not ( = ?auto_374152 ?auto_374154 ) ) ( not ( = ?auto_374152 ?auto_374155 ) ) ( not ( = ?auto_374152 ?auto_374156 ) ) ( not ( = ?auto_374152 ?auto_374157 ) ) ( not ( = ?auto_374152 ?auto_374158 ) ) ( not ( = ?auto_374153 ?auto_374154 ) ) ( not ( = ?auto_374153 ?auto_374155 ) ) ( not ( = ?auto_374153 ?auto_374156 ) ) ( not ( = ?auto_374153 ?auto_374157 ) ) ( not ( = ?auto_374153 ?auto_374158 ) ) ( not ( = ?auto_374154 ?auto_374155 ) ) ( not ( = ?auto_374154 ?auto_374156 ) ) ( not ( = ?auto_374154 ?auto_374157 ) ) ( not ( = ?auto_374154 ?auto_374158 ) ) ( not ( = ?auto_374155 ?auto_374156 ) ) ( not ( = ?auto_374155 ?auto_374157 ) ) ( not ( = ?auto_374155 ?auto_374158 ) ) ( not ( = ?auto_374156 ?auto_374157 ) ) ( not ( = ?auto_374156 ?auto_374158 ) ) ( not ( = ?auto_374157 ?auto_374158 ) ) ( ON ?auto_374156 ?auto_374157 ) ( ON ?auto_374155 ?auto_374156 ) ( ON ?auto_374154 ?auto_374155 ) ( ON ?auto_374153 ?auto_374154 ) ( ON ?auto_374152 ?auto_374153 ) ( CLEAR ?auto_374150 ) ( ON ?auto_374151 ?auto_374152 ) ( CLEAR ?auto_374151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_374145 ?auto_374146 ?auto_374147 ?auto_374148 ?auto_374149 ?auto_374150 ?auto_374151 )
      ( MAKE-13PILE ?auto_374145 ?auto_374146 ?auto_374147 ?auto_374148 ?auto_374149 ?auto_374150 ?auto_374151 ?auto_374152 ?auto_374153 ?auto_374154 ?auto_374155 ?auto_374156 ?auto_374157 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374199 - BLOCK
      ?auto_374200 - BLOCK
      ?auto_374201 - BLOCK
      ?auto_374202 - BLOCK
      ?auto_374203 - BLOCK
      ?auto_374204 - BLOCK
      ?auto_374205 - BLOCK
      ?auto_374206 - BLOCK
      ?auto_374207 - BLOCK
      ?auto_374208 - BLOCK
      ?auto_374209 - BLOCK
      ?auto_374210 - BLOCK
      ?auto_374211 - BLOCK
    )
    :vars
    (
      ?auto_374212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374211 ?auto_374212 ) ( ON-TABLE ?auto_374199 ) ( ON ?auto_374200 ?auto_374199 ) ( ON ?auto_374201 ?auto_374200 ) ( ON ?auto_374202 ?auto_374201 ) ( ON ?auto_374203 ?auto_374202 ) ( not ( = ?auto_374199 ?auto_374200 ) ) ( not ( = ?auto_374199 ?auto_374201 ) ) ( not ( = ?auto_374199 ?auto_374202 ) ) ( not ( = ?auto_374199 ?auto_374203 ) ) ( not ( = ?auto_374199 ?auto_374204 ) ) ( not ( = ?auto_374199 ?auto_374205 ) ) ( not ( = ?auto_374199 ?auto_374206 ) ) ( not ( = ?auto_374199 ?auto_374207 ) ) ( not ( = ?auto_374199 ?auto_374208 ) ) ( not ( = ?auto_374199 ?auto_374209 ) ) ( not ( = ?auto_374199 ?auto_374210 ) ) ( not ( = ?auto_374199 ?auto_374211 ) ) ( not ( = ?auto_374199 ?auto_374212 ) ) ( not ( = ?auto_374200 ?auto_374201 ) ) ( not ( = ?auto_374200 ?auto_374202 ) ) ( not ( = ?auto_374200 ?auto_374203 ) ) ( not ( = ?auto_374200 ?auto_374204 ) ) ( not ( = ?auto_374200 ?auto_374205 ) ) ( not ( = ?auto_374200 ?auto_374206 ) ) ( not ( = ?auto_374200 ?auto_374207 ) ) ( not ( = ?auto_374200 ?auto_374208 ) ) ( not ( = ?auto_374200 ?auto_374209 ) ) ( not ( = ?auto_374200 ?auto_374210 ) ) ( not ( = ?auto_374200 ?auto_374211 ) ) ( not ( = ?auto_374200 ?auto_374212 ) ) ( not ( = ?auto_374201 ?auto_374202 ) ) ( not ( = ?auto_374201 ?auto_374203 ) ) ( not ( = ?auto_374201 ?auto_374204 ) ) ( not ( = ?auto_374201 ?auto_374205 ) ) ( not ( = ?auto_374201 ?auto_374206 ) ) ( not ( = ?auto_374201 ?auto_374207 ) ) ( not ( = ?auto_374201 ?auto_374208 ) ) ( not ( = ?auto_374201 ?auto_374209 ) ) ( not ( = ?auto_374201 ?auto_374210 ) ) ( not ( = ?auto_374201 ?auto_374211 ) ) ( not ( = ?auto_374201 ?auto_374212 ) ) ( not ( = ?auto_374202 ?auto_374203 ) ) ( not ( = ?auto_374202 ?auto_374204 ) ) ( not ( = ?auto_374202 ?auto_374205 ) ) ( not ( = ?auto_374202 ?auto_374206 ) ) ( not ( = ?auto_374202 ?auto_374207 ) ) ( not ( = ?auto_374202 ?auto_374208 ) ) ( not ( = ?auto_374202 ?auto_374209 ) ) ( not ( = ?auto_374202 ?auto_374210 ) ) ( not ( = ?auto_374202 ?auto_374211 ) ) ( not ( = ?auto_374202 ?auto_374212 ) ) ( not ( = ?auto_374203 ?auto_374204 ) ) ( not ( = ?auto_374203 ?auto_374205 ) ) ( not ( = ?auto_374203 ?auto_374206 ) ) ( not ( = ?auto_374203 ?auto_374207 ) ) ( not ( = ?auto_374203 ?auto_374208 ) ) ( not ( = ?auto_374203 ?auto_374209 ) ) ( not ( = ?auto_374203 ?auto_374210 ) ) ( not ( = ?auto_374203 ?auto_374211 ) ) ( not ( = ?auto_374203 ?auto_374212 ) ) ( not ( = ?auto_374204 ?auto_374205 ) ) ( not ( = ?auto_374204 ?auto_374206 ) ) ( not ( = ?auto_374204 ?auto_374207 ) ) ( not ( = ?auto_374204 ?auto_374208 ) ) ( not ( = ?auto_374204 ?auto_374209 ) ) ( not ( = ?auto_374204 ?auto_374210 ) ) ( not ( = ?auto_374204 ?auto_374211 ) ) ( not ( = ?auto_374204 ?auto_374212 ) ) ( not ( = ?auto_374205 ?auto_374206 ) ) ( not ( = ?auto_374205 ?auto_374207 ) ) ( not ( = ?auto_374205 ?auto_374208 ) ) ( not ( = ?auto_374205 ?auto_374209 ) ) ( not ( = ?auto_374205 ?auto_374210 ) ) ( not ( = ?auto_374205 ?auto_374211 ) ) ( not ( = ?auto_374205 ?auto_374212 ) ) ( not ( = ?auto_374206 ?auto_374207 ) ) ( not ( = ?auto_374206 ?auto_374208 ) ) ( not ( = ?auto_374206 ?auto_374209 ) ) ( not ( = ?auto_374206 ?auto_374210 ) ) ( not ( = ?auto_374206 ?auto_374211 ) ) ( not ( = ?auto_374206 ?auto_374212 ) ) ( not ( = ?auto_374207 ?auto_374208 ) ) ( not ( = ?auto_374207 ?auto_374209 ) ) ( not ( = ?auto_374207 ?auto_374210 ) ) ( not ( = ?auto_374207 ?auto_374211 ) ) ( not ( = ?auto_374207 ?auto_374212 ) ) ( not ( = ?auto_374208 ?auto_374209 ) ) ( not ( = ?auto_374208 ?auto_374210 ) ) ( not ( = ?auto_374208 ?auto_374211 ) ) ( not ( = ?auto_374208 ?auto_374212 ) ) ( not ( = ?auto_374209 ?auto_374210 ) ) ( not ( = ?auto_374209 ?auto_374211 ) ) ( not ( = ?auto_374209 ?auto_374212 ) ) ( not ( = ?auto_374210 ?auto_374211 ) ) ( not ( = ?auto_374210 ?auto_374212 ) ) ( not ( = ?auto_374211 ?auto_374212 ) ) ( ON ?auto_374210 ?auto_374211 ) ( ON ?auto_374209 ?auto_374210 ) ( ON ?auto_374208 ?auto_374209 ) ( ON ?auto_374207 ?auto_374208 ) ( ON ?auto_374206 ?auto_374207 ) ( ON ?auto_374205 ?auto_374206 ) ( CLEAR ?auto_374203 ) ( ON ?auto_374204 ?auto_374205 ) ( CLEAR ?auto_374204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_374199 ?auto_374200 ?auto_374201 ?auto_374202 ?auto_374203 ?auto_374204 )
      ( MAKE-13PILE ?auto_374199 ?auto_374200 ?auto_374201 ?auto_374202 ?auto_374203 ?auto_374204 ?auto_374205 ?auto_374206 ?auto_374207 ?auto_374208 ?auto_374209 ?auto_374210 ?auto_374211 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374253 - BLOCK
      ?auto_374254 - BLOCK
      ?auto_374255 - BLOCK
      ?auto_374256 - BLOCK
      ?auto_374257 - BLOCK
      ?auto_374258 - BLOCK
      ?auto_374259 - BLOCK
      ?auto_374260 - BLOCK
      ?auto_374261 - BLOCK
      ?auto_374262 - BLOCK
      ?auto_374263 - BLOCK
      ?auto_374264 - BLOCK
      ?auto_374265 - BLOCK
    )
    :vars
    (
      ?auto_374266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374265 ?auto_374266 ) ( ON-TABLE ?auto_374253 ) ( ON ?auto_374254 ?auto_374253 ) ( ON ?auto_374255 ?auto_374254 ) ( ON ?auto_374256 ?auto_374255 ) ( not ( = ?auto_374253 ?auto_374254 ) ) ( not ( = ?auto_374253 ?auto_374255 ) ) ( not ( = ?auto_374253 ?auto_374256 ) ) ( not ( = ?auto_374253 ?auto_374257 ) ) ( not ( = ?auto_374253 ?auto_374258 ) ) ( not ( = ?auto_374253 ?auto_374259 ) ) ( not ( = ?auto_374253 ?auto_374260 ) ) ( not ( = ?auto_374253 ?auto_374261 ) ) ( not ( = ?auto_374253 ?auto_374262 ) ) ( not ( = ?auto_374253 ?auto_374263 ) ) ( not ( = ?auto_374253 ?auto_374264 ) ) ( not ( = ?auto_374253 ?auto_374265 ) ) ( not ( = ?auto_374253 ?auto_374266 ) ) ( not ( = ?auto_374254 ?auto_374255 ) ) ( not ( = ?auto_374254 ?auto_374256 ) ) ( not ( = ?auto_374254 ?auto_374257 ) ) ( not ( = ?auto_374254 ?auto_374258 ) ) ( not ( = ?auto_374254 ?auto_374259 ) ) ( not ( = ?auto_374254 ?auto_374260 ) ) ( not ( = ?auto_374254 ?auto_374261 ) ) ( not ( = ?auto_374254 ?auto_374262 ) ) ( not ( = ?auto_374254 ?auto_374263 ) ) ( not ( = ?auto_374254 ?auto_374264 ) ) ( not ( = ?auto_374254 ?auto_374265 ) ) ( not ( = ?auto_374254 ?auto_374266 ) ) ( not ( = ?auto_374255 ?auto_374256 ) ) ( not ( = ?auto_374255 ?auto_374257 ) ) ( not ( = ?auto_374255 ?auto_374258 ) ) ( not ( = ?auto_374255 ?auto_374259 ) ) ( not ( = ?auto_374255 ?auto_374260 ) ) ( not ( = ?auto_374255 ?auto_374261 ) ) ( not ( = ?auto_374255 ?auto_374262 ) ) ( not ( = ?auto_374255 ?auto_374263 ) ) ( not ( = ?auto_374255 ?auto_374264 ) ) ( not ( = ?auto_374255 ?auto_374265 ) ) ( not ( = ?auto_374255 ?auto_374266 ) ) ( not ( = ?auto_374256 ?auto_374257 ) ) ( not ( = ?auto_374256 ?auto_374258 ) ) ( not ( = ?auto_374256 ?auto_374259 ) ) ( not ( = ?auto_374256 ?auto_374260 ) ) ( not ( = ?auto_374256 ?auto_374261 ) ) ( not ( = ?auto_374256 ?auto_374262 ) ) ( not ( = ?auto_374256 ?auto_374263 ) ) ( not ( = ?auto_374256 ?auto_374264 ) ) ( not ( = ?auto_374256 ?auto_374265 ) ) ( not ( = ?auto_374256 ?auto_374266 ) ) ( not ( = ?auto_374257 ?auto_374258 ) ) ( not ( = ?auto_374257 ?auto_374259 ) ) ( not ( = ?auto_374257 ?auto_374260 ) ) ( not ( = ?auto_374257 ?auto_374261 ) ) ( not ( = ?auto_374257 ?auto_374262 ) ) ( not ( = ?auto_374257 ?auto_374263 ) ) ( not ( = ?auto_374257 ?auto_374264 ) ) ( not ( = ?auto_374257 ?auto_374265 ) ) ( not ( = ?auto_374257 ?auto_374266 ) ) ( not ( = ?auto_374258 ?auto_374259 ) ) ( not ( = ?auto_374258 ?auto_374260 ) ) ( not ( = ?auto_374258 ?auto_374261 ) ) ( not ( = ?auto_374258 ?auto_374262 ) ) ( not ( = ?auto_374258 ?auto_374263 ) ) ( not ( = ?auto_374258 ?auto_374264 ) ) ( not ( = ?auto_374258 ?auto_374265 ) ) ( not ( = ?auto_374258 ?auto_374266 ) ) ( not ( = ?auto_374259 ?auto_374260 ) ) ( not ( = ?auto_374259 ?auto_374261 ) ) ( not ( = ?auto_374259 ?auto_374262 ) ) ( not ( = ?auto_374259 ?auto_374263 ) ) ( not ( = ?auto_374259 ?auto_374264 ) ) ( not ( = ?auto_374259 ?auto_374265 ) ) ( not ( = ?auto_374259 ?auto_374266 ) ) ( not ( = ?auto_374260 ?auto_374261 ) ) ( not ( = ?auto_374260 ?auto_374262 ) ) ( not ( = ?auto_374260 ?auto_374263 ) ) ( not ( = ?auto_374260 ?auto_374264 ) ) ( not ( = ?auto_374260 ?auto_374265 ) ) ( not ( = ?auto_374260 ?auto_374266 ) ) ( not ( = ?auto_374261 ?auto_374262 ) ) ( not ( = ?auto_374261 ?auto_374263 ) ) ( not ( = ?auto_374261 ?auto_374264 ) ) ( not ( = ?auto_374261 ?auto_374265 ) ) ( not ( = ?auto_374261 ?auto_374266 ) ) ( not ( = ?auto_374262 ?auto_374263 ) ) ( not ( = ?auto_374262 ?auto_374264 ) ) ( not ( = ?auto_374262 ?auto_374265 ) ) ( not ( = ?auto_374262 ?auto_374266 ) ) ( not ( = ?auto_374263 ?auto_374264 ) ) ( not ( = ?auto_374263 ?auto_374265 ) ) ( not ( = ?auto_374263 ?auto_374266 ) ) ( not ( = ?auto_374264 ?auto_374265 ) ) ( not ( = ?auto_374264 ?auto_374266 ) ) ( not ( = ?auto_374265 ?auto_374266 ) ) ( ON ?auto_374264 ?auto_374265 ) ( ON ?auto_374263 ?auto_374264 ) ( ON ?auto_374262 ?auto_374263 ) ( ON ?auto_374261 ?auto_374262 ) ( ON ?auto_374260 ?auto_374261 ) ( ON ?auto_374259 ?auto_374260 ) ( ON ?auto_374258 ?auto_374259 ) ( CLEAR ?auto_374256 ) ( ON ?auto_374257 ?auto_374258 ) ( CLEAR ?auto_374257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_374253 ?auto_374254 ?auto_374255 ?auto_374256 ?auto_374257 )
      ( MAKE-13PILE ?auto_374253 ?auto_374254 ?auto_374255 ?auto_374256 ?auto_374257 ?auto_374258 ?auto_374259 ?auto_374260 ?auto_374261 ?auto_374262 ?auto_374263 ?auto_374264 ?auto_374265 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374307 - BLOCK
      ?auto_374308 - BLOCK
      ?auto_374309 - BLOCK
      ?auto_374310 - BLOCK
      ?auto_374311 - BLOCK
      ?auto_374312 - BLOCK
      ?auto_374313 - BLOCK
      ?auto_374314 - BLOCK
      ?auto_374315 - BLOCK
      ?auto_374316 - BLOCK
      ?auto_374317 - BLOCK
      ?auto_374318 - BLOCK
      ?auto_374319 - BLOCK
    )
    :vars
    (
      ?auto_374320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374319 ?auto_374320 ) ( ON-TABLE ?auto_374307 ) ( ON ?auto_374308 ?auto_374307 ) ( ON ?auto_374309 ?auto_374308 ) ( not ( = ?auto_374307 ?auto_374308 ) ) ( not ( = ?auto_374307 ?auto_374309 ) ) ( not ( = ?auto_374307 ?auto_374310 ) ) ( not ( = ?auto_374307 ?auto_374311 ) ) ( not ( = ?auto_374307 ?auto_374312 ) ) ( not ( = ?auto_374307 ?auto_374313 ) ) ( not ( = ?auto_374307 ?auto_374314 ) ) ( not ( = ?auto_374307 ?auto_374315 ) ) ( not ( = ?auto_374307 ?auto_374316 ) ) ( not ( = ?auto_374307 ?auto_374317 ) ) ( not ( = ?auto_374307 ?auto_374318 ) ) ( not ( = ?auto_374307 ?auto_374319 ) ) ( not ( = ?auto_374307 ?auto_374320 ) ) ( not ( = ?auto_374308 ?auto_374309 ) ) ( not ( = ?auto_374308 ?auto_374310 ) ) ( not ( = ?auto_374308 ?auto_374311 ) ) ( not ( = ?auto_374308 ?auto_374312 ) ) ( not ( = ?auto_374308 ?auto_374313 ) ) ( not ( = ?auto_374308 ?auto_374314 ) ) ( not ( = ?auto_374308 ?auto_374315 ) ) ( not ( = ?auto_374308 ?auto_374316 ) ) ( not ( = ?auto_374308 ?auto_374317 ) ) ( not ( = ?auto_374308 ?auto_374318 ) ) ( not ( = ?auto_374308 ?auto_374319 ) ) ( not ( = ?auto_374308 ?auto_374320 ) ) ( not ( = ?auto_374309 ?auto_374310 ) ) ( not ( = ?auto_374309 ?auto_374311 ) ) ( not ( = ?auto_374309 ?auto_374312 ) ) ( not ( = ?auto_374309 ?auto_374313 ) ) ( not ( = ?auto_374309 ?auto_374314 ) ) ( not ( = ?auto_374309 ?auto_374315 ) ) ( not ( = ?auto_374309 ?auto_374316 ) ) ( not ( = ?auto_374309 ?auto_374317 ) ) ( not ( = ?auto_374309 ?auto_374318 ) ) ( not ( = ?auto_374309 ?auto_374319 ) ) ( not ( = ?auto_374309 ?auto_374320 ) ) ( not ( = ?auto_374310 ?auto_374311 ) ) ( not ( = ?auto_374310 ?auto_374312 ) ) ( not ( = ?auto_374310 ?auto_374313 ) ) ( not ( = ?auto_374310 ?auto_374314 ) ) ( not ( = ?auto_374310 ?auto_374315 ) ) ( not ( = ?auto_374310 ?auto_374316 ) ) ( not ( = ?auto_374310 ?auto_374317 ) ) ( not ( = ?auto_374310 ?auto_374318 ) ) ( not ( = ?auto_374310 ?auto_374319 ) ) ( not ( = ?auto_374310 ?auto_374320 ) ) ( not ( = ?auto_374311 ?auto_374312 ) ) ( not ( = ?auto_374311 ?auto_374313 ) ) ( not ( = ?auto_374311 ?auto_374314 ) ) ( not ( = ?auto_374311 ?auto_374315 ) ) ( not ( = ?auto_374311 ?auto_374316 ) ) ( not ( = ?auto_374311 ?auto_374317 ) ) ( not ( = ?auto_374311 ?auto_374318 ) ) ( not ( = ?auto_374311 ?auto_374319 ) ) ( not ( = ?auto_374311 ?auto_374320 ) ) ( not ( = ?auto_374312 ?auto_374313 ) ) ( not ( = ?auto_374312 ?auto_374314 ) ) ( not ( = ?auto_374312 ?auto_374315 ) ) ( not ( = ?auto_374312 ?auto_374316 ) ) ( not ( = ?auto_374312 ?auto_374317 ) ) ( not ( = ?auto_374312 ?auto_374318 ) ) ( not ( = ?auto_374312 ?auto_374319 ) ) ( not ( = ?auto_374312 ?auto_374320 ) ) ( not ( = ?auto_374313 ?auto_374314 ) ) ( not ( = ?auto_374313 ?auto_374315 ) ) ( not ( = ?auto_374313 ?auto_374316 ) ) ( not ( = ?auto_374313 ?auto_374317 ) ) ( not ( = ?auto_374313 ?auto_374318 ) ) ( not ( = ?auto_374313 ?auto_374319 ) ) ( not ( = ?auto_374313 ?auto_374320 ) ) ( not ( = ?auto_374314 ?auto_374315 ) ) ( not ( = ?auto_374314 ?auto_374316 ) ) ( not ( = ?auto_374314 ?auto_374317 ) ) ( not ( = ?auto_374314 ?auto_374318 ) ) ( not ( = ?auto_374314 ?auto_374319 ) ) ( not ( = ?auto_374314 ?auto_374320 ) ) ( not ( = ?auto_374315 ?auto_374316 ) ) ( not ( = ?auto_374315 ?auto_374317 ) ) ( not ( = ?auto_374315 ?auto_374318 ) ) ( not ( = ?auto_374315 ?auto_374319 ) ) ( not ( = ?auto_374315 ?auto_374320 ) ) ( not ( = ?auto_374316 ?auto_374317 ) ) ( not ( = ?auto_374316 ?auto_374318 ) ) ( not ( = ?auto_374316 ?auto_374319 ) ) ( not ( = ?auto_374316 ?auto_374320 ) ) ( not ( = ?auto_374317 ?auto_374318 ) ) ( not ( = ?auto_374317 ?auto_374319 ) ) ( not ( = ?auto_374317 ?auto_374320 ) ) ( not ( = ?auto_374318 ?auto_374319 ) ) ( not ( = ?auto_374318 ?auto_374320 ) ) ( not ( = ?auto_374319 ?auto_374320 ) ) ( ON ?auto_374318 ?auto_374319 ) ( ON ?auto_374317 ?auto_374318 ) ( ON ?auto_374316 ?auto_374317 ) ( ON ?auto_374315 ?auto_374316 ) ( ON ?auto_374314 ?auto_374315 ) ( ON ?auto_374313 ?auto_374314 ) ( ON ?auto_374312 ?auto_374313 ) ( ON ?auto_374311 ?auto_374312 ) ( CLEAR ?auto_374309 ) ( ON ?auto_374310 ?auto_374311 ) ( CLEAR ?auto_374310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_374307 ?auto_374308 ?auto_374309 ?auto_374310 )
      ( MAKE-13PILE ?auto_374307 ?auto_374308 ?auto_374309 ?auto_374310 ?auto_374311 ?auto_374312 ?auto_374313 ?auto_374314 ?auto_374315 ?auto_374316 ?auto_374317 ?auto_374318 ?auto_374319 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374361 - BLOCK
      ?auto_374362 - BLOCK
      ?auto_374363 - BLOCK
      ?auto_374364 - BLOCK
      ?auto_374365 - BLOCK
      ?auto_374366 - BLOCK
      ?auto_374367 - BLOCK
      ?auto_374368 - BLOCK
      ?auto_374369 - BLOCK
      ?auto_374370 - BLOCK
      ?auto_374371 - BLOCK
      ?auto_374372 - BLOCK
      ?auto_374373 - BLOCK
    )
    :vars
    (
      ?auto_374374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374373 ?auto_374374 ) ( ON-TABLE ?auto_374361 ) ( ON ?auto_374362 ?auto_374361 ) ( not ( = ?auto_374361 ?auto_374362 ) ) ( not ( = ?auto_374361 ?auto_374363 ) ) ( not ( = ?auto_374361 ?auto_374364 ) ) ( not ( = ?auto_374361 ?auto_374365 ) ) ( not ( = ?auto_374361 ?auto_374366 ) ) ( not ( = ?auto_374361 ?auto_374367 ) ) ( not ( = ?auto_374361 ?auto_374368 ) ) ( not ( = ?auto_374361 ?auto_374369 ) ) ( not ( = ?auto_374361 ?auto_374370 ) ) ( not ( = ?auto_374361 ?auto_374371 ) ) ( not ( = ?auto_374361 ?auto_374372 ) ) ( not ( = ?auto_374361 ?auto_374373 ) ) ( not ( = ?auto_374361 ?auto_374374 ) ) ( not ( = ?auto_374362 ?auto_374363 ) ) ( not ( = ?auto_374362 ?auto_374364 ) ) ( not ( = ?auto_374362 ?auto_374365 ) ) ( not ( = ?auto_374362 ?auto_374366 ) ) ( not ( = ?auto_374362 ?auto_374367 ) ) ( not ( = ?auto_374362 ?auto_374368 ) ) ( not ( = ?auto_374362 ?auto_374369 ) ) ( not ( = ?auto_374362 ?auto_374370 ) ) ( not ( = ?auto_374362 ?auto_374371 ) ) ( not ( = ?auto_374362 ?auto_374372 ) ) ( not ( = ?auto_374362 ?auto_374373 ) ) ( not ( = ?auto_374362 ?auto_374374 ) ) ( not ( = ?auto_374363 ?auto_374364 ) ) ( not ( = ?auto_374363 ?auto_374365 ) ) ( not ( = ?auto_374363 ?auto_374366 ) ) ( not ( = ?auto_374363 ?auto_374367 ) ) ( not ( = ?auto_374363 ?auto_374368 ) ) ( not ( = ?auto_374363 ?auto_374369 ) ) ( not ( = ?auto_374363 ?auto_374370 ) ) ( not ( = ?auto_374363 ?auto_374371 ) ) ( not ( = ?auto_374363 ?auto_374372 ) ) ( not ( = ?auto_374363 ?auto_374373 ) ) ( not ( = ?auto_374363 ?auto_374374 ) ) ( not ( = ?auto_374364 ?auto_374365 ) ) ( not ( = ?auto_374364 ?auto_374366 ) ) ( not ( = ?auto_374364 ?auto_374367 ) ) ( not ( = ?auto_374364 ?auto_374368 ) ) ( not ( = ?auto_374364 ?auto_374369 ) ) ( not ( = ?auto_374364 ?auto_374370 ) ) ( not ( = ?auto_374364 ?auto_374371 ) ) ( not ( = ?auto_374364 ?auto_374372 ) ) ( not ( = ?auto_374364 ?auto_374373 ) ) ( not ( = ?auto_374364 ?auto_374374 ) ) ( not ( = ?auto_374365 ?auto_374366 ) ) ( not ( = ?auto_374365 ?auto_374367 ) ) ( not ( = ?auto_374365 ?auto_374368 ) ) ( not ( = ?auto_374365 ?auto_374369 ) ) ( not ( = ?auto_374365 ?auto_374370 ) ) ( not ( = ?auto_374365 ?auto_374371 ) ) ( not ( = ?auto_374365 ?auto_374372 ) ) ( not ( = ?auto_374365 ?auto_374373 ) ) ( not ( = ?auto_374365 ?auto_374374 ) ) ( not ( = ?auto_374366 ?auto_374367 ) ) ( not ( = ?auto_374366 ?auto_374368 ) ) ( not ( = ?auto_374366 ?auto_374369 ) ) ( not ( = ?auto_374366 ?auto_374370 ) ) ( not ( = ?auto_374366 ?auto_374371 ) ) ( not ( = ?auto_374366 ?auto_374372 ) ) ( not ( = ?auto_374366 ?auto_374373 ) ) ( not ( = ?auto_374366 ?auto_374374 ) ) ( not ( = ?auto_374367 ?auto_374368 ) ) ( not ( = ?auto_374367 ?auto_374369 ) ) ( not ( = ?auto_374367 ?auto_374370 ) ) ( not ( = ?auto_374367 ?auto_374371 ) ) ( not ( = ?auto_374367 ?auto_374372 ) ) ( not ( = ?auto_374367 ?auto_374373 ) ) ( not ( = ?auto_374367 ?auto_374374 ) ) ( not ( = ?auto_374368 ?auto_374369 ) ) ( not ( = ?auto_374368 ?auto_374370 ) ) ( not ( = ?auto_374368 ?auto_374371 ) ) ( not ( = ?auto_374368 ?auto_374372 ) ) ( not ( = ?auto_374368 ?auto_374373 ) ) ( not ( = ?auto_374368 ?auto_374374 ) ) ( not ( = ?auto_374369 ?auto_374370 ) ) ( not ( = ?auto_374369 ?auto_374371 ) ) ( not ( = ?auto_374369 ?auto_374372 ) ) ( not ( = ?auto_374369 ?auto_374373 ) ) ( not ( = ?auto_374369 ?auto_374374 ) ) ( not ( = ?auto_374370 ?auto_374371 ) ) ( not ( = ?auto_374370 ?auto_374372 ) ) ( not ( = ?auto_374370 ?auto_374373 ) ) ( not ( = ?auto_374370 ?auto_374374 ) ) ( not ( = ?auto_374371 ?auto_374372 ) ) ( not ( = ?auto_374371 ?auto_374373 ) ) ( not ( = ?auto_374371 ?auto_374374 ) ) ( not ( = ?auto_374372 ?auto_374373 ) ) ( not ( = ?auto_374372 ?auto_374374 ) ) ( not ( = ?auto_374373 ?auto_374374 ) ) ( ON ?auto_374372 ?auto_374373 ) ( ON ?auto_374371 ?auto_374372 ) ( ON ?auto_374370 ?auto_374371 ) ( ON ?auto_374369 ?auto_374370 ) ( ON ?auto_374368 ?auto_374369 ) ( ON ?auto_374367 ?auto_374368 ) ( ON ?auto_374366 ?auto_374367 ) ( ON ?auto_374365 ?auto_374366 ) ( ON ?auto_374364 ?auto_374365 ) ( CLEAR ?auto_374362 ) ( ON ?auto_374363 ?auto_374364 ) ( CLEAR ?auto_374363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_374361 ?auto_374362 ?auto_374363 )
      ( MAKE-13PILE ?auto_374361 ?auto_374362 ?auto_374363 ?auto_374364 ?auto_374365 ?auto_374366 ?auto_374367 ?auto_374368 ?auto_374369 ?auto_374370 ?auto_374371 ?auto_374372 ?auto_374373 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374415 - BLOCK
      ?auto_374416 - BLOCK
      ?auto_374417 - BLOCK
      ?auto_374418 - BLOCK
      ?auto_374419 - BLOCK
      ?auto_374420 - BLOCK
      ?auto_374421 - BLOCK
      ?auto_374422 - BLOCK
      ?auto_374423 - BLOCK
      ?auto_374424 - BLOCK
      ?auto_374425 - BLOCK
      ?auto_374426 - BLOCK
      ?auto_374427 - BLOCK
    )
    :vars
    (
      ?auto_374428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374427 ?auto_374428 ) ( ON-TABLE ?auto_374415 ) ( not ( = ?auto_374415 ?auto_374416 ) ) ( not ( = ?auto_374415 ?auto_374417 ) ) ( not ( = ?auto_374415 ?auto_374418 ) ) ( not ( = ?auto_374415 ?auto_374419 ) ) ( not ( = ?auto_374415 ?auto_374420 ) ) ( not ( = ?auto_374415 ?auto_374421 ) ) ( not ( = ?auto_374415 ?auto_374422 ) ) ( not ( = ?auto_374415 ?auto_374423 ) ) ( not ( = ?auto_374415 ?auto_374424 ) ) ( not ( = ?auto_374415 ?auto_374425 ) ) ( not ( = ?auto_374415 ?auto_374426 ) ) ( not ( = ?auto_374415 ?auto_374427 ) ) ( not ( = ?auto_374415 ?auto_374428 ) ) ( not ( = ?auto_374416 ?auto_374417 ) ) ( not ( = ?auto_374416 ?auto_374418 ) ) ( not ( = ?auto_374416 ?auto_374419 ) ) ( not ( = ?auto_374416 ?auto_374420 ) ) ( not ( = ?auto_374416 ?auto_374421 ) ) ( not ( = ?auto_374416 ?auto_374422 ) ) ( not ( = ?auto_374416 ?auto_374423 ) ) ( not ( = ?auto_374416 ?auto_374424 ) ) ( not ( = ?auto_374416 ?auto_374425 ) ) ( not ( = ?auto_374416 ?auto_374426 ) ) ( not ( = ?auto_374416 ?auto_374427 ) ) ( not ( = ?auto_374416 ?auto_374428 ) ) ( not ( = ?auto_374417 ?auto_374418 ) ) ( not ( = ?auto_374417 ?auto_374419 ) ) ( not ( = ?auto_374417 ?auto_374420 ) ) ( not ( = ?auto_374417 ?auto_374421 ) ) ( not ( = ?auto_374417 ?auto_374422 ) ) ( not ( = ?auto_374417 ?auto_374423 ) ) ( not ( = ?auto_374417 ?auto_374424 ) ) ( not ( = ?auto_374417 ?auto_374425 ) ) ( not ( = ?auto_374417 ?auto_374426 ) ) ( not ( = ?auto_374417 ?auto_374427 ) ) ( not ( = ?auto_374417 ?auto_374428 ) ) ( not ( = ?auto_374418 ?auto_374419 ) ) ( not ( = ?auto_374418 ?auto_374420 ) ) ( not ( = ?auto_374418 ?auto_374421 ) ) ( not ( = ?auto_374418 ?auto_374422 ) ) ( not ( = ?auto_374418 ?auto_374423 ) ) ( not ( = ?auto_374418 ?auto_374424 ) ) ( not ( = ?auto_374418 ?auto_374425 ) ) ( not ( = ?auto_374418 ?auto_374426 ) ) ( not ( = ?auto_374418 ?auto_374427 ) ) ( not ( = ?auto_374418 ?auto_374428 ) ) ( not ( = ?auto_374419 ?auto_374420 ) ) ( not ( = ?auto_374419 ?auto_374421 ) ) ( not ( = ?auto_374419 ?auto_374422 ) ) ( not ( = ?auto_374419 ?auto_374423 ) ) ( not ( = ?auto_374419 ?auto_374424 ) ) ( not ( = ?auto_374419 ?auto_374425 ) ) ( not ( = ?auto_374419 ?auto_374426 ) ) ( not ( = ?auto_374419 ?auto_374427 ) ) ( not ( = ?auto_374419 ?auto_374428 ) ) ( not ( = ?auto_374420 ?auto_374421 ) ) ( not ( = ?auto_374420 ?auto_374422 ) ) ( not ( = ?auto_374420 ?auto_374423 ) ) ( not ( = ?auto_374420 ?auto_374424 ) ) ( not ( = ?auto_374420 ?auto_374425 ) ) ( not ( = ?auto_374420 ?auto_374426 ) ) ( not ( = ?auto_374420 ?auto_374427 ) ) ( not ( = ?auto_374420 ?auto_374428 ) ) ( not ( = ?auto_374421 ?auto_374422 ) ) ( not ( = ?auto_374421 ?auto_374423 ) ) ( not ( = ?auto_374421 ?auto_374424 ) ) ( not ( = ?auto_374421 ?auto_374425 ) ) ( not ( = ?auto_374421 ?auto_374426 ) ) ( not ( = ?auto_374421 ?auto_374427 ) ) ( not ( = ?auto_374421 ?auto_374428 ) ) ( not ( = ?auto_374422 ?auto_374423 ) ) ( not ( = ?auto_374422 ?auto_374424 ) ) ( not ( = ?auto_374422 ?auto_374425 ) ) ( not ( = ?auto_374422 ?auto_374426 ) ) ( not ( = ?auto_374422 ?auto_374427 ) ) ( not ( = ?auto_374422 ?auto_374428 ) ) ( not ( = ?auto_374423 ?auto_374424 ) ) ( not ( = ?auto_374423 ?auto_374425 ) ) ( not ( = ?auto_374423 ?auto_374426 ) ) ( not ( = ?auto_374423 ?auto_374427 ) ) ( not ( = ?auto_374423 ?auto_374428 ) ) ( not ( = ?auto_374424 ?auto_374425 ) ) ( not ( = ?auto_374424 ?auto_374426 ) ) ( not ( = ?auto_374424 ?auto_374427 ) ) ( not ( = ?auto_374424 ?auto_374428 ) ) ( not ( = ?auto_374425 ?auto_374426 ) ) ( not ( = ?auto_374425 ?auto_374427 ) ) ( not ( = ?auto_374425 ?auto_374428 ) ) ( not ( = ?auto_374426 ?auto_374427 ) ) ( not ( = ?auto_374426 ?auto_374428 ) ) ( not ( = ?auto_374427 ?auto_374428 ) ) ( ON ?auto_374426 ?auto_374427 ) ( ON ?auto_374425 ?auto_374426 ) ( ON ?auto_374424 ?auto_374425 ) ( ON ?auto_374423 ?auto_374424 ) ( ON ?auto_374422 ?auto_374423 ) ( ON ?auto_374421 ?auto_374422 ) ( ON ?auto_374420 ?auto_374421 ) ( ON ?auto_374419 ?auto_374420 ) ( ON ?auto_374418 ?auto_374419 ) ( ON ?auto_374417 ?auto_374418 ) ( CLEAR ?auto_374415 ) ( ON ?auto_374416 ?auto_374417 ) ( CLEAR ?auto_374416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_374415 ?auto_374416 )
      ( MAKE-13PILE ?auto_374415 ?auto_374416 ?auto_374417 ?auto_374418 ?auto_374419 ?auto_374420 ?auto_374421 ?auto_374422 ?auto_374423 ?auto_374424 ?auto_374425 ?auto_374426 ?auto_374427 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374469 - BLOCK
      ?auto_374470 - BLOCK
      ?auto_374471 - BLOCK
      ?auto_374472 - BLOCK
      ?auto_374473 - BLOCK
      ?auto_374474 - BLOCK
      ?auto_374475 - BLOCK
      ?auto_374476 - BLOCK
      ?auto_374477 - BLOCK
      ?auto_374478 - BLOCK
      ?auto_374479 - BLOCK
      ?auto_374480 - BLOCK
      ?auto_374481 - BLOCK
    )
    :vars
    (
      ?auto_374482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374481 ?auto_374482 ) ( not ( = ?auto_374469 ?auto_374470 ) ) ( not ( = ?auto_374469 ?auto_374471 ) ) ( not ( = ?auto_374469 ?auto_374472 ) ) ( not ( = ?auto_374469 ?auto_374473 ) ) ( not ( = ?auto_374469 ?auto_374474 ) ) ( not ( = ?auto_374469 ?auto_374475 ) ) ( not ( = ?auto_374469 ?auto_374476 ) ) ( not ( = ?auto_374469 ?auto_374477 ) ) ( not ( = ?auto_374469 ?auto_374478 ) ) ( not ( = ?auto_374469 ?auto_374479 ) ) ( not ( = ?auto_374469 ?auto_374480 ) ) ( not ( = ?auto_374469 ?auto_374481 ) ) ( not ( = ?auto_374469 ?auto_374482 ) ) ( not ( = ?auto_374470 ?auto_374471 ) ) ( not ( = ?auto_374470 ?auto_374472 ) ) ( not ( = ?auto_374470 ?auto_374473 ) ) ( not ( = ?auto_374470 ?auto_374474 ) ) ( not ( = ?auto_374470 ?auto_374475 ) ) ( not ( = ?auto_374470 ?auto_374476 ) ) ( not ( = ?auto_374470 ?auto_374477 ) ) ( not ( = ?auto_374470 ?auto_374478 ) ) ( not ( = ?auto_374470 ?auto_374479 ) ) ( not ( = ?auto_374470 ?auto_374480 ) ) ( not ( = ?auto_374470 ?auto_374481 ) ) ( not ( = ?auto_374470 ?auto_374482 ) ) ( not ( = ?auto_374471 ?auto_374472 ) ) ( not ( = ?auto_374471 ?auto_374473 ) ) ( not ( = ?auto_374471 ?auto_374474 ) ) ( not ( = ?auto_374471 ?auto_374475 ) ) ( not ( = ?auto_374471 ?auto_374476 ) ) ( not ( = ?auto_374471 ?auto_374477 ) ) ( not ( = ?auto_374471 ?auto_374478 ) ) ( not ( = ?auto_374471 ?auto_374479 ) ) ( not ( = ?auto_374471 ?auto_374480 ) ) ( not ( = ?auto_374471 ?auto_374481 ) ) ( not ( = ?auto_374471 ?auto_374482 ) ) ( not ( = ?auto_374472 ?auto_374473 ) ) ( not ( = ?auto_374472 ?auto_374474 ) ) ( not ( = ?auto_374472 ?auto_374475 ) ) ( not ( = ?auto_374472 ?auto_374476 ) ) ( not ( = ?auto_374472 ?auto_374477 ) ) ( not ( = ?auto_374472 ?auto_374478 ) ) ( not ( = ?auto_374472 ?auto_374479 ) ) ( not ( = ?auto_374472 ?auto_374480 ) ) ( not ( = ?auto_374472 ?auto_374481 ) ) ( not ( = ?auto_374472 ?auto_374482 ) ) ( not ( = ?auto_374473 ?auto_374474 ) ) ( not ( = ?auto_374473 ?auto_374475 ) ) ( not ( = ?auto_374473 ?auto_374476 ) ) ( not ( = ?auto_374473 ?auto_374477 ) ) ( not ( = ?auto_374473 ?auto_374478 ) ) ( not ( = ?auto_374473 ?auto_374479 ) ) ( not ( = ?auto_374473 ?auto_374480 ) ) ( not ( = ?auto_374473 ?auto_374481 ) ) ( not ( = ?auto_374473 ?auto_374482 ) ) ( not ( = ?auto_374474 ?auto_374475 ) ) ( not ( = ?auto_374474 ?auto_374476 ) ) ( not ( = ?auto_374474 ?auto_374477 ) ) ( not ( = ?auto_374474 ?auto_374478 ) ) ( not ( = ?auto_374474 ?auto_374479 ) ) ( not ( = ?auto_374474 ?auto_374480 ) ) ( not ( = ?auto_374474 ?auto_374481 ) ) ( not ( = ?auto_374474 ?auto_374482 ) ) ( not ( = ?auto_374475 ?auto_374476 ) ) ( not ( = ?auto_374475 ?auto_374477 ) ) ( not ( = ?auto_374475 ?auto_374478 ) ) ( not ( = ?auto_374475 ?auto_374479 ) ) ( not ( = ?auto_374475 ?auto_374480 ) ) ( not ( = ?auto_374475 ?auto_374481 ) ) ( not ( = ?auto_374475 ?auto_374482 ) ) ( not ( = ?auto_374476 ?auto_374477 ) ) ( not ( = ?auto_374476 ?auto_374478 ) ) ( not ( = ?auto_374476 ?auto_374479 ) ) ( not ( = ?auto_374476 ?auto_374480 ) ) ( not ( = ?auto_374476 ?auto_374481 ) ) ( not ( = ?auto_374476 ?auto_374482 ) ) ( not ( = ?auto_374477 ?auto_374478 ) ) ( not ( = ?auto_374477 ?auto_374479 ) ) ( not ( = ?auto_374477 ?auto_374480 ) ) ( not ( = ?auto_374477 ?auto_374481 ) ) ( not ( = ?auto_374477 ?auto_374482 ) ) ( not ( = ?auto_374478 ?auto_374479 ) ) ( not ( = ?auto_374478 ?auto_374480 ) ) ( not ( = ?auto_374478 ?auto_374481 ) ) ( not ( = ?auto_374478 ?auto_374482 ) ) ( not ( = ?auto_374479 ?auto_374480 ) ) ( not ( = ?auto_374479 ?auto_374481 ) ) ( not ( = ?auto_374479 ?auto_374482 ) ) ( not ( = ?auto_374480 ?auto_374481 ) ) ( not ( = ?auto_374480 ?auto_374482 ) ) ( not ( = ?auto_374481 ?auto_374482 ) ) ( ON ?auto_374480 ?auto_374481 ) ( ON ?auto_374479 ?auto_374480 ) ( ON ?auto_374478 ?auto_374479 ) ( ON ?auto_374477 ?auto_374478 ) ( ON ?auto_374476 ?auto_374477 ) ( ON ?auto_374475 ?auto_374476 ) ( ON ?auto_374474 ?auto_374475 ) ( ON ?auto_374473 ?auto_374474 ) ( ON ?auto_374472 ?auto_374473 ) ( ON ?auto_374471 ?auto_374472 ) ( ON ?auto_374470 ?auto_374471 ) ( ON ?auto_374469 ?auto_374470 ) ( CLEAR ?auto_374469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_374469 )
      ( MAKE-13PILE ?auto_374469 ?auto_374470 ?auto_374471 ?auto_374472 ?auto_374473 ?auto_374474 ?auto_374475 ?auto_374476 ?auto_374477 ?auto_374478 ?auto_374479 ?auto_374480 ?auto_374481 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374524 - BLOCK
      ?auto_374525 - BLOCK
      ?auto_374526 - BLOCK
      ?auto_374527 - BLOCK
      ?auto_374528 - BLOCK
      ?auto_374529 - BLOCK
      ?auto_374530 - BLOCK
      ?auto_374531 - BLOCK
      ?auto_374532 - BLOCK
      ?auto_374533 - BLOCK
      ?auto_374534 - BLOCK
      ?auto_374535 - BLOCK
      ?auto_374536 - BLOCK
      ?auto_374537 - BLOCK
    )
    :vars
    (
      ?auto_374538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_374536 ) ( ON ?auto_374537 ?auto_374538 ) ( CLEAR ?auto_374537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_374524 ) ( ON ?auto_374525 ?auto_374524 ) ( ON ?auto_374526 ?auto_374525 ) ( ON ?auto_374527 ?auto_374526 ) ( ON ?auto_374528 ?auto_374527 ) ( ON ?auto_374529 ?auto_374528 ) ( ON ?auto_374530 ?auto_374529 ) ( ON ?auto_374531 ?auto_374530 ) ( ON ?auto_374532 ?auto_374531 ) ( ON ?auto_374533 ?auto_374532 ) ( ON ?auto_374534 ?auto_374533 ) ( ON ?auto_374535 ?auto_374534 ) ( ON ?auto_374536 ?auto_374535 ) ( not ( = ?auto_374524 ?auto_374525 ) ) ( not ( = ?auto_374524 ?auto_374526 ) ) ( not ( = ?auto_374524 ?auto_374527 ) ) ( not ( = ?auto_374524 ?auto_374528 ) ) ( not ( = ?auto_374524 ?auto_374529 ) ) ( not ( = ?auto_374524 ?auto_374530 ) ) ( not ( = ?auto_374524 ?auto_374531 ) ) ( not ( = ?auto_374524 ?auto_374532 ) ) ( not ( = ?auto_374524 ?auto_374533 ) ) ( not ( = ?auto_374524 ?auto_374534 ) ) ( not ( = ?auto_374524 ?auto_374535 ) ) ( not ( = ?auto_374524 ?auto_374536 ) ) ( not ( = ?auto_374524 ?auto_374537 ) ) ( not ( = ?auto_374524 ?auto_374538 ) ) ( not ( = ?auto_374525 ?auto_374526 ) ) ( not ( = ?auto_374525 ?auto_374527 ) ) ( not ( = ?auto_374525 ?auto_374528 ) ) ( not ( = ?auto_374525 ?auto_374529 ) ) ( not ( = ?auto_374525 ?auto_374530 ) ) ( not ( = ?auto_374525 ?auto_374531 ) ) ( not ( = ?auto_374525 ?auto_374532 ) ) ( not ( = ?auto_374525 ?auto_374533 ) ) ( not ( = ?auto_374525 ?auto_374534 ) ) ( not ( = ?auto_374525 ?auto_374535 ) ) ( not ( = ?auto_374525 ?auto_374536 ) ) ( not ( = ?auto_374525 ?auto_374537 ) ) ( not ( = ?auto_374525 ?auto_374538 ) ) ( not ( = ?auto_374526 ?auto_374527 ) ) ( not ( = ?auto_374526 ?auto_374528 ) ) ( not ( = ?auto_374526 ?auto_374529 ) ) ( not ( = ?auto_374526 ?auto_374530 ) ) ( not ( = ?auto_374526 ?auto_374531 ) ) ( not ( = ?auto_374526 ?auto_374532 ) ) ( not ( = ?auto_374526 ?auto_374533 ) ) ( not ( = ?auto_374526 ?auto_374534 ) ) ( not ( = ?auto_374526 ?auto_374535 ) ) ( not ( = ?auto_374526 ?auto_374536 ) ) ( not ( = ?auto_374526 ?auto_374537 ) ) ( not ( = ?auto_374526 ?auto_374538 ) ) ( not ( = ?auto_374527 ?auto_374528 ) ) ( not ( = ?auto_374527 ?auto_374529 ) ) ( not ( = ?auto_374527 ?auto_374530 ) ) ( not ( = ?auto_374527 ?auto_374531 ) ) ( not ( = ?auto_374527 ?auto_374532 ) ) ( not ( = ?auto_374527 ?auto_374533 ) ) ( not ( = ?auto_374527 ?auto_374534 ) ) ( not ( = ?auto_374527 ?auto_374535 ) ) ( not ( = ?auto_374527 ?auto_374536 ) ) ( not ( = ?auto_374527 ?auto_374537 ) ) ( not ( = ?auto_374527 ?auto_374538 ) ) ( not ( = ?auto_374528 ?auto_374529 ) ) ( not ( = ?auto_374528 ?auto_374530 ) ) ( not ( = ?auto_374528 ?auto_374531 ) ) ( not ( = ?auto_374528 ?auto_374532 ) ) ( not ( = ?auto_374528 ?auto_374533 ) ) ( not ( = ?auto_374528 ?auto_374534 ) ) ( not ( = ?auto_374528 ?auto_374535 ) ) ( not ( = ?auto_374528 ?auto_374536 ) ) ( not ( = ?auto_374528 ?auto_374537 ) ) ( not ( = ?auto_374528 ?auto_374538 ) ) ( not ( = ?auto_374529 ?auto_374530 ) ) ( not ( = ?auto_374529 ?auto_374531 ) ) ( not ( = ?auto_374529 ?auto_374532 ) ) ( not ( = ?auto_374529 ?auto_374533 ) ) ( not ( = ?auto_374529 ?auto_374534 ) ) ( not ( = ?auto_374529 ?auto_374535 ) ) ( not ( = ?auto_374529 ?auto_374536 ) ) ( not ( = ?auto_374529 ?auto_374537 ) ) ( not ( = ?auto_374529 ?auto_374538 ) ) ( not ( = ?auto_374530 ?auto_374531 ) ) ( not ( = ?auto_374530 ?auto_374532 ) ) ( not ( = ?auto_374530 ?auto_374533 ) ) ( not ( = ?auto_374530 ?auto_374534 ) ) ( not ( = ?auto_374530 ?auto_374535 ) ) ( not ( = ?auto_374530 ?auto_374536 ) ) ( not ( = ?auto_374530 ?auto_374537 ) ) ( not ( = ?auto_374530 ?auto_374538 ) ) ( not ( = ?auto_374531 ?auto_374532 ) ) ( not ( = ?auto_374531 ?auto_374533 ) ) ( not ( = ?auto_374531 ?auto_374534 ) ) ( not ( = ?auto_374531 ?auto_374535 ) ) ( not ( = ?auto_374531 ?auto_374536 ) ) ( not ( = ?auto_374531 ?auto_374537 ) ) ( not ( = ?auto_374531 ?auto_374538 ) ) ( not ( = ?auto_374532 ?auto_374533 ) ) ( not ( = ?auto_374532 ?auto_374534 ) ) ( not ( = ?auto_374532 ?auto_374535 ) ) ( not ( = ?auto_374532 ?auto_374536 ) ) ( not ( = ?auto_374532 ?auto_374537 ) ) ( not ( = ?auto_374532 ?auto_374538 ) ) ( not ( = ?auto_374533 ?auto_374534 ) ) ( not ( = ?auto_374533 ?auto_374535 ) ) ( not ( = ?auto_374533 ?auto_374536 ) ) ( not ( = ?auto_374533 ?auto_374537 ) ) ( not ( = ?auto_374533 ?auto_374538 ) ) ( not ( = ?auto_374534 ?auto_374535 ) ) ( not ( = ?auto_374534 ?auto_374536 ) ) ( not ( = ?auto_374534 ?auto_374537 ) ) ( not ( = ?auto_374534 ?auto_374538 ) ) ( not ( = ?auto_374535 ?auto_374536 ) ) ( not ( = ?auto_374535 ?auto_374537 ) ) ( not ( = ?auto_374535 ?auto_374538 ) ) ( not ( = ?auto_374536 ?auto_374537 ) ) ( not ( = ?auto_374536 ?auto_374538 ) ) ( not ( = ?auto_374537 ?auto_374538 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_374537 ?auto_374538 )
      ( !STACK ?auto_374537 ?auto_374536 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374582 - BLOCK
      ?auto_374583 - BLOCK
      ?auto_374584 - BLOCK
      ?auto_374585 - BLOCK
      ?auto_374586 - BLOCK
      ?auto_374587 - BLOCK
      ?auto_374588 - BLOCK
      ?auto_374589 - BLOCK
      ?auto_374590 - BLOCK
      ?auto_374591 - BLOCK
      ?auto_374592 - BLOCK
      ?auto_374593 - BLOCK
      ?auto_374594 - BLOCK
      ?auto_374595 - BLOCK
    )
    :vars
    (
      ?auto_374596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374595 ?auto_374596 ) ( ON-TABLE ?auto_374582 ) ( ON ?auto_374583 ?auto_374582 ) ( ON ?auto_374584 ?auto_374583 ) ( ON ?auto_374585 ?auto_374584 ) ( ON ?auto_374586 ?auto_374585 ) ( ON ?auto_374587 ?auto_374586 ) ( ON ?auto_374588 ?auto_374587 ) ( ON ?auto_374589 ?auto_374588 ) ( ON ?auto_374590 ?auto_374589 ) ( ON ?auto_374591 ?auto_374590 ) ( ON ?auto_374592 ?auto_374591 ) ( ON ?auto_374593 ?auto_374592 ) ( not ( = ?auto_374582 ?auto_374583 ) ) ( not ( = ?auto_374582 ?auto_374584 ) ) ( not ( = ?auto_374582 ?auto_374585 ) ) ( not ( = ?auto_374582 ?auto_374586 ) ) ( not ( = ?auto_374582 ?auto_374587 ) ) ( not ( = ?auto_374582 ?auto_374588 ) ) ( not ( = ?auto_374582 ?auto_374589 ) ) ( not ( = ?auto_374582 ?auto_374590 ) ) ( not ( = ?auto_374582 ?auto_374591 ) ) ( not ( = ?auto_374582 ?auto_374592 ) ) ( not ( = ?auto_374582 ?auto_374593 ) ) ( not ( = ?auto_374582 ?auto_374594 ) ) ( not ( = ?auto_374582 ?auto_374595 ) ) ( not ( = ?auto_374582 ?auto_374596 ) ) ( not ( = ?auto_374583 ?auto_374584 ) ) ( not ( = ?auto_374583 ?auto_374585 ) ) ( not ( = ?auto_374583 ?auto_374586 ) ) ( not ( = ?auto_374583 ?auto_374587 ) ) ( not ( = ?auto_374583 ?auto_374588 ) ) ( not ( = ?auto_374583 ?auto_374589 ) ) ( not ( = ?auto_374583 ?auto_374590 ) ) ( not ( = ?auto_374583 ?auto_374591 ) ) ( not ( = ?auto_374583 ?auto_374592 ) ) ( not ( = ?auto_374583 ?auto_374593 ) ) ( not ( = ?auto_374583 ?auto_374594 ) ) ( not ( = ?auto_374583 ?auto_374595 ) ) ( not ( = ?auto_374583 ?auto_374596 ) ) ( not ( = ?auto_374584 ?auto_374585 ) ) ( not ( = ?auto_374584 ?auto_374586 ) ) ( not ( = ?auto_374584 ?auto_374587 ) ) ( not ( = ?auto_374584 ?auto_374588 ) ) ( not ( = ?auto_374584 ?auto_374589 ) ) ( not ( = ?auto_374584 ?auto_374590 ) ) ( not ( = ?auto_374584 ?auto_374591 ) ) ( not ( = ?auto_374584 ?auto_374592 ) ) ( not ( = ?auto_374584 ?auto_374593 ) ) ( not ( = ?auto_374584 ?auto_374594 ) ) ( not ( = ?auto_374584 ?auto_374595 ) ) ( not ( = ?auto_374584 ?auto_374596 ) ) ( not ( = ?auto_374585 ?auto_374586 ) ) ( not ( = ?auto_374585 ?auto_374587 ) ) ( not ( = ?auto_374585 ?auto_374588 ) ) ( not ( = ?auto_374585 ?auto_374589 ) ) ( not ( = ?auto_374585 ?auto_374590 ) ) ( not ( = ?auto_374585 ?auto_374591 ) ) ( not ( = ?auto_374585 ?auto_374592 ) ) ( not ( = ?auto_374585 ?auto_374593 ) ) ( not ( = ?auto_374585 ?auto_374594 ) ) ( not ( = ?auto_374585 ?auto_374595 ) ) ( not ( = ?auto_374585 ?auto_374596 ) ) ( not ( = ?auto_374586 ?auto_374587 ) ) ( not ( = ?auto_374586 ?auto_374588 ) ) ( not ( = ?auto_374586 ?auto_374589 ) ) ( not ( = ?auto_374586 ?auto_374590 ) ) ( not ( = ?auto_374586 ?auto_374591 ) ) ( not ( = ?auto_374586 ?auto_374592 ) ) ( not ( = ?auto_374586 ?auto_374593 ) ) ( not ( = ?auto_374586 ?auto_374594 ) ) ( not ( = ?auto_374586 ?auto_374595 ) ) ( not ( = ?auto_374586 ?auto_374596 ) ) ( not ( = ?auto_374587 ?auto_374588 ) ) ( not ( = ?auto_374587 ?auto_374589 ) ) ( not ( = ?auto_374587 ?auto_374590 ) ) ( not ( = ?auto_374587 ?auto_374591 ) ) ( not ( = ?auto_374587 ?auto_374592 ) ) ( not ( = ?auto_374587 ?auto_374593 ) ) ( not ( = ?auto_374587 ?auto_374594 ) ) ( not ( = ?auto_374587 ?auto_374595 ) ) ( not ( = ?auto_374587 ?auto_374596 ) ) ( not ( = ?auto_374588 ?auto_374589 ) ) ( not ( = ?auto_374588 ?auto_374590 ) ) ( not ( = ?auto_374588 ?auto_374591 ) ) ( not ( = ?auto_374588 ?auto_374592 ) ) ( not ( = ?auto_374588 ?auto_374593 ) ) ( not ( = ?auto_374588 ?auto_374594 ) ) ( not ( = ?auto_374588 ?auto_374595 ) ) ( not ( = ?auto_374588 ?auto_374596 ) ) ( not ( = ?auto_374589 ?auto_374590 ) ) ( not ( = ?auto_374589 ?auto_374591 ) ) ( not ( = ?auto_374589 ?auto_374592 ) ) ( not ( = ?auto_374589 ?auto_374593 ) ) ( not ( = ?auto_374589 ?auto_374594 ) ) ( not ( = ?auto_374589 ?auto_374595 ) ) ( not ( = ?auto_374589 ?auto_374596 ) ) ( not ( = ?auto_374590 ?auto_374591 ) ) ( not ( = ?auto_374590 ?auto_374592 ) ) ( not ( = ?auto_374590 ?auto_374593 ) ) ( not ( = ?auto_374590 ?auto_374594 ) ) ( not ( = ?auto_374590 ?auto_374595 ) ) ( not ( = ?auto_374590 ?auto_374596 ) ) ( not ( = ?auto_374591 ?auto_374592 ) ) ( not ( = ?auto_374591 ?auto_374593 ) ) ( not ( = ?auto_374591 ?auto_374594 ) ) ( not ( = ?auto_374591 ?auto_374595 ) ) ( not ( = ?auto_374591 ?auto_374596 ) ) ( not ( = ?auto_374592 ?auto_374593 ) ) ( not ( = ?auto_374592 ?auto_374594 ) ) ( not ( = ?auto_374592 ?auto_374595 ) ) ( not ( = ?auto_374592 ?auto_374596 ) ) ( not ( = ?auto_374593 ?auto_374594 ) ) ( not ( = ?auto_374593 ?auto_374595 ) ) ( not ( = ?auto_374593 ?auto_374596 ) ) ( not ( = ?auto_374594 ?auto_374595 ) ) ( not ( = ?auto_374594 ?auto_374596 ) ) ( not ( = ?auto_374595 ?auto_374596 ) ) ( CLEAR ?auto_374593 ) ( ON ?auto_374594 ?auto_374595 ) ( CLEAR ?auto_374594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_374582 ?auto_374583 ?auto_374584 ?auto_374585 ?auto_374586 ?auto_374587 ?auto_374588 ?auto_374589 ?auto_374590 ?auto_374591 ?auto_374592 ?auto_374593 ?auto_374594 )
      ( MAKE-14PILE ?auto_374582 ?auto_374583 ?auto_374584 ?auto_374585 ?auto_374586 ?auto_374587 ?auto_374588 ?auto_374589 ?auto_374590 ?auto_374591 ?auto_374592 ?auto_374593 ?auto_374594 ?auto_374595 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374640 - BLOCK
      ?auto_374641 - BLOCK
      ?auto_374642 - BLOCK
      ?auto_374643 - BLOCK
      ?auto_374644 - BLOCK
      ?auto_374645 - BLOCK
      ?auto_374646 - BLOCK
      ?auto_374647 - BLOCK
      ?auto_374648 - BLOCK
      ?auto_374649 - BLOCK
      ?auto_374650 - BLOCK
      ?auto_374651 - BLOCK
      ?auto_374652 - BLOCK
      ?auto_374653 - BLOCK
    )
    :vars
    (
      ?auto_374654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374653 ?auto_374654 ) ( ON-TABLE ?auto_374640 ) ( ON ?auto_374641 ?auto_374640 ) ( ON ?auto_374642 ?auto_374641 ) ( ON ?auto_374643 ?auto_374642 ) ( ON ?auto_374644 ?auto_374643 ) ( ON ?auto_374645 ?auto_374644 ) ( ON ?auto_374646 ?auto_374645 ) ( ON ?auto_374647 ?auto_374646 ) ( ON ?auto_374648 ?auto_374647 ) ( ON ?auto_374649 ?auto_374648 ) ( ON ?auto_374650 ?auto_374649 ) ( not ( = ?auto_374640 ?auto_374641 ) ) ( not ( = ?auto_374640 ?auto_374642 ) ) ( not ( = ?auto_374640 ?auto_374643 ) ) ( not ( = ?auto_374640 ?auto_374644 ) ) ( not ( = ?auto_374640 ?auto_374645 ) ) ( not ( = ?auto_374640 ?auto_374646 ) ) ( not ( = ?auto_374640 ?auto_374647 ) ) ( not ( = ?auto_374640 ?auto_374648 ) ) ( not ( = ?auto_374640 ?auto_374649 ) ) ( not ( = ?auto_374640 ?auto_374650 ) ) ( not ( = ?auto_374640 ?auto_374651 ) ) ( not ( = ?auto_374640 ?auto_374652 ) ) ( not ( = ?auto_374640 ?auto_374653 ) ) ( not ( = ?auto_374640 ?auto_374654 ) ) ( not ( = ?auto_374641 ?auto_374642 ) ) ( not ( = ?auto_374641 ?auto_374643 ) ) ( not ( = ?auto_374641 ?auto_374644 ) ) ( not ( = ?auto_374641 ?auto_374645 ) ) ( not ( = ?auto_374641 ?auto_374646 ) ) ( not ( = ?auto_374641 ?auto_374647 ) ) ( not ( = ?auto_374641 ?auto_374648 ) ) ( not ( = ?auto_374641 ?auto_374649 ) ) ( not ( = ?auto_374641 ?auto_374650 ) ) ( not ( = ?auto_374641 ?auto_374651 ) ) ( not ( = ?auto_374641 ?auto_374652 ) ) ( not ( = ?auto_374641 ?auto_374653 ) ) ( not ( = ?auto_374641 ?auto_374654 ) ) ( not ( = ?auto_374642 ?auto_374643 ) ) ( not ( = ?auto_374642 ?auto_374644 ) ) ( not ( = ?auto_374642 ?auto_374645 ) ) ( not ( = ?auto_374642 ?auto_374646 ) ) ( not ( = ?auto_374642 ?auto_374647 ) ) ( not ( = ?auto_374642 ?auto_374648 ) ) ( not ( = ?auto_374642 ?auto_374649 ) ) ( not ( = ?auto_374642 ?auto_374650 ) ) ( not ( = ?auto_374642 ?auto_374651 ) ) ( not ( = ?auto_374642 ?auto_374652 ) ) ( not ( = ?auto_374642 ?auto_374653 ) ) ( not ( = ?auto_374642 ?auto_374654 ) ) ( not ( = ?auto_374643 ?auto_374644 ) ) ( not ( = ?auto_374643 ?auto_374645 ) ) ( not ( = ?auto_374643 ?auto_374646 ) ) ( not ( = ?auto_374643 ?auto_374647 ) ) ( not ( = ?auto_374643 ?auto_374648 ) ) ( not ( = ?auto_374643 ?auto_374649 ) ) ( not ( = ?auto_374643 ?auto_374650 ) ) ( not ( = ?auto_374643 ?auto_374651 ) ) ( not ( = ?auto_374643 ?auto_374652 ) ) ( not ( = ?auto_374643 ?auto_374653 ) ) ( not ( = ?auto_374643 ?auto_374654 ) ) ( not ( = ?auto_374644 ?auto_374645 ) ) ( not ( = ?auto_374644 ?auto_374646 ) ) ( not ( = ?auto_374644 ?auto_374647 ) ) ( not ( = ?auto_374644 ?auto_374648 ) ) ( not ( = ?auto_374644 ?auto_374649 ) ) ( not ( = ?auto_374644 ?auto_374650 ) ) ( not ( = ?auto_374644 ?auto_374651 ) ) ( not ( = ?auto_374644 ?auto_374652 ) ) ( not ( = ?auto_374644 ?auto_374653 ) ) ( not ( = ?auto_374644 ?auto_374654 ) ) ( not ( = ?auto_374645 ?auto_374646 ) ) ( not ( = ?auto_374645 ?auto_374647 ) ) ( not ( = ?auto_374645 ?auto_374648 ) ) ( not ( = ?auto_374645 ?auto_374649 ) ) ( not ( = ?auto_374645 ?auto_374650 ) ) ( not ( = ?auto_374645 ?auto_374651 ) ) ( not ( = ?auto_374645 ?auto_374652 ) ) ( not ( = ?auto_374645 ?auto_374653 ) ) ( not ( = ?auto_374645 ?auto_374654 ) ) ( not ( = ?auto_374646 ?auto_374647 ) ) ( not ( = ?auto_374646 ?auto_374648 ) ) ( not ( = ?auto_374646 ?auto_374649 ) ) ( not ( = ?auto_374646 ?auto_374650 ) ) ( not ( = ?auto_374646 ?auto_374651 ) ) ( not ( = ?auto_374646 ?auto_374652 ) ) ( not ( = ?auto_374646 ?auto_374653 ) ) ( not ( = ?auto_374646 ?auto_374654 ) ) ( not ( = ?auto_374647 ?auto_374648 ) ) ( not ( = ?auto_374647 ?auto_374649 ) ) ( not ( = ?auto_374647 ?auto_374650 ) ) ( not ( = ?auto_374647 ?auto_374651 ) ) ( not ( = ?auto_374647 ?auto_374652 ) ) ( not ( = ?auto_374647 ?auto_374653 ) ) ( not ( = ?auto_374647 ?auto_374654 ) ) ( not ( = ?auto_374648 ?auto_374649 ) ) ( not ( = ?auto_374648 ?auto_374650 ) ) ( not ( = ?auto_374648 ?auto_374651 ) ) ( not ( = ?auto_374648 ?auto_374652 ) ) ( not ( = ?auto_374648 ?auto_374653 ) ) ( not ( = ?auto_374648 ?auto_374654 ) ) ( not ( = ?auto_374649 ?auto_374650 ) ) ( not ( = ?auto_374649 ?auto_374651 ) ) ( not ( = ?auto_374649 ?auto_374652 ) ) ( not ( = ?auto_374649 ?auto_374653 ) ) ( not ( = ?auto_374649 ?auto_374654 ) ) ( not ( = ?auto_374650 ?auto_374651 ) ) ( not ( = ?auto_374650 ?auto_374652 ) ) ( not ( = ?auto_374650 ?auto_374653 ) ) ( not ( = ?auto_374650 ?auto_374654 ) ) ( not ( = ?auto_374651 ?auto_374652 ) ) ( not ( = ?auto_374651 ?auto_374653 ) ) ( not ( = ?auto_374651 ?auto_374654 ) ) ( not ( = ?auto_374652 ?auto_374653 ) ) ( not ( = ?auto_374652 ?auto_374654 ) ) ( not ( = ?auto_374653 ?auto_374654 ) ) ( ON ?auto_374652 ?auto_374653 ) ( CLEAR ?auto_374650 ) ( ON ?auto_374651 ?auto_374652 ) ( CLEAR ?auto_374651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_374640 ?auto_374641 ?auto_374642 ?auto_374643 ?auto_374644 ?auto_374645 ?auto_374646 ?auto_374647 ?auto_374648 ?auto_374649 ?auto_374650 ?auto_374651 )
      ( MAKE-14PILE ?auto_374640 ?auto_374641 ?auto_374642 ?auto_374643 ?auto_374644 ?auto_374645 ?auto_374646 ?auto_374647 ?auto_374648 ?auto_374649 ?auto_374650 ?auto_374651 ?auto_374652 ?auto_374653 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374698 - BLOCK
      ?auto_374699 - BLOCK
      ?auto_374700 - BLOCK
      ?auto_374701 - BLOCK
      ?auto_374702 - BLOCK
      ?auto_374703 - BLOCK
      ?auto_374704 - BLOCK
      ?auto_374705 - BLOCK
      ?auto_374706 - BLOCK
      ?auto_374707 - BLOCK
      ?auto_374708 - BLOCK
      ?auto_374709 - BLOCK
      ?auto_374710 - BLOCK
      ?auto_374711 - BLOCK
    )
    :vars
    (
      ?auto_374712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374711 ?auto_374712 ) ( ON-TABLE ?auto_374698 ) ( ON ?auto_374699 ?auto_374698 ) ( ON ?auto_374700 ?auto_374699 ) ( ON ?auto_374701 ?auto_374700 ) ( ON ?auto_374702 ?auto_374701 ) ( ON ?auto_374703 ?auto_374702 ) ( ON ?auto_374704 ?auto_374703 ) ( ON ?auto_374705 ?auto_374704 ) ( ON ?auto_374706 ?auto_374705 ) ( ON ?auto_374707 ?auto_374706 ) ( not ( = ?auto_374698 ?auto_374699 ) ) ( not ( = ?auto_374698 ?auto_374700 ) ) ( not ( = ?auto_374698 ?auto_374701 ) ) ( not ( = ?auto_374698 ?auto_374702 ) ) ( not ( = ?auto_374698 ?auto_374703 ) ) ( not ( = ?auto_374698 ?auto_374704 ) ) ( not ( = ?auto_374698 ?auto_374705 ) ) ( not ( = ?auto_374698 ?auto_374706 ) ) ( not ( = ?auto_374698 ?auto_374707 ) ) ( not ( = ?auto_374698 ?auto_374708 ) ) ( not ( = ?auto_374698 ?auto_374709 ) ) ( not ( = ?auto_374698 ?auto_374710 ) ) ( not ( = ?auto_374698 ?auto_374711 ) ) ( not ( = ?auto_374698 ?auto_374712 ) ) ( not ( = ?auto_374699 ?auto_374700 ) ) ( not ( = ?auto_374699 ?auto_374701 ) ) ( not ( = ?auto_374699 ?auto_374702 ) ) ( not ( = ?auto_374699 ?auto_374703 ) ) ( not ( = ?auto_374699 ?auto_374704 ) ) ( not ( = ?auto_374699 ?auto_374705 ) ) ( not ( = ?auto_374699 ?auto_374706 ) ) ( not ( = ?auto_374699 ?auto_374707 ) ) ( not ( = ?auto_374699 ?auto_374708 ) ) ( not ( = ?auto_374699 ?auto_374709 ) ) ( not ( = ?auto_374699 ?auto_374710 ) ) ( not ( = ?auto_374699 ?auto_374711 ) ) ( not ( = ?auto_374699 ?auto_374712 ) ) ( not ( = ?auto_374700 ?auto_374701 ) ) ( not ( = ?auto_374700 ?auto_374702 ) ) ( not ( = ?auto_374700 ?auto_374703 ) ) ( not ( = ?auto_374700 ?auto_374704 ) ) ( not ( = ?auto_374700 ?auto_374705 ) ) ( not ( = ?auto_374700 ?auto_374706 ) ) ( not ( = ?auto_374700 ?auto_374707 ) ) ( not ( = ?auto_374700 ?auto_374708 ) ) ( not ( = ?auto_374700 ?auto_374709 ) ) ( not ( = ?auto_374700 ?auto_374710 ) ) ( not ( = ?auto_374700 ?auto_374711 ) ) ( not ( = ?auto_374700 ?auto_374712 ) ) ( not ( = ?auto_374701 ?auto_374702 ) ) ( not ( = ?auto_374701 ?auto_374703 ) ) ( not ( = ?auto_374701 ?auto_374704 ) ) ( not ( = ?auto_374701 ?auto_374705 ) ) ( not ( = ?auto_374701 ?auto_374706 ) ) ( not ( = ?auto_374701 ?auto_374707 ) ) ( not ( = ?auto_374701 ?auto_374708 ) ) ( not ( = ?auto_374701 ?auto_374709 ) ) ( not ( = ?auto_374701 ?auto_374710 ) ) ( not ( = ?auto_374701 ?auto_374711 ) ) ( not ( = ?auto_374701 ?auto_374712 ) ) ( not ( = ?auto_374702 ?auto_374703 ) ) ( not ( = ?auto_374702 ?auto_374704 ) ) ( not ( = ?auto_374702 ?auto_374705 ) ) ( not ( = ?auto_374702 ?auto_374706 ) ) ( not ( = ?auto_374702 ?auto_374707 ) ) ( not ( = ?auto_374702 ?auto_374708 ) ) ( not ( = ?auto_374702 ?auto_374709 ) ) ( not ( = ?auto_374702 ?auto_374710 ) ) ( not ( = ?auto_374702 ?auto_374711 ) ) ( not ( = ?auto_374702 ?auto_374712 ) ) ( not ( = ?auto_374703 ?auto_374704 ) ) ( not ( = ?auto_374703 ?auto_374705 ) ) ( not ( = ?auto_374703 ?auto_374706 ) ) ( not ( = ?auto_374703 ?auto_374707 ) ) ( not ( = ?auto_374703 ?auto_374708 ) ) ( not ( = ?auto_374703 ?auto_374709 ) ) ( not ( = ?auto_374703 ?auto_374710 ) ) ( not ( = ?auto_374703 ?auto_374711 ) ) ( not ( = ?auto_374703 ?auto_374712 ) ) ( not ( = ?auto_374704 ?auto_374705 ) ) ( not ( = ?auto_374704 ?auto_374706 ) ) ( not ( = ?auto_374704 ?auto_374707 ) ) ( not ( = ?auto_374704 ?auto_374708 ) ) ( not ( = ?auto_374704 ?auto_374709 ) ) ( not ( = ?auto_374704 ?auto_374710 ) ) ( not ( = ?auto_374704 ?auto_374711 ) ) ( not ( = ?auto_374704 ?auto_374712 ) ) ( not ( = ?auto_374705 ?auto_374706 ) ) ( not ( = ?auto_374705 ?auto_374707 ) ) ( not ( = ?auto_374705 ?auto_374708 ) ) ( not ( = ?auto_374705 ?auto_374709 ) ) ( not ( = ?auto_374705 ?auto_374710 ) ) ( not ( = ?auto_374705 ?auto_374711 ) ) ( not ( = ?auto_374705 ?auto_374712 ) ) ( not ( = ?auto_374706 ?auto_374707 ) ) ( not ( = ?auto_374706 ?auto_374708 ) ) ( not ( = ?auto_374706 ?auto_374709 ) ) ( not ( = ?auto_374706 ?auto_374710 ) ) ( not ( = ?auto_374706 ?auto_374711 ) ) ( not ( = ?auto_374706 ?auto_374712 ) ) ( not ( = ?auto_374707 ?auto_374708 ) ) ( not ( = ?auto_374707 ?auto_374709 ) ) ( not ( = ?auto_374707 ?auto_374710 ) ) ( not ( = ?auto_374707 ?auto_374711 ) ) ( not ( = ?auto_374707 ?auto_374712 ) ) ( not ( = ?auto_374708 ?auto_374709 ) ) ( not ( = ?auto_374708 ?auto_374710 ) ) ( not ( = ?auto_374708 ?auto_374711 ) ) ( not ( = ?auto_374708 ?auto_374712 ) ) ( not ( = ?auto_374709 ?auto_374710 ) ) ( not ( = ?auto_374709 ?auto_374711 ) ) ( not ( = ?auto_374709 ?auto_374712 ) ) ( not ( = ?auto_374710 ?auto_374711 ) ) ( not ( = ?auto_374710 ?auto_374712 ) ) ( not ( = ?auto_374711 ?auto_374712 ) ) ( ON ?auto_374710 ?auto_374711 ) ( ON ?auto_374709 ?auto_374710 ) ( CLEAR ?auto_374707 ) ( ON ?auto_374708 ?auto_374709 ) ( CLEAR ?auto_374708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_374698 ?auto_374699 ?auto_374700 ?auto_374701 ?auto_374702 ?auto_374703 ?auto_374704 ?auto_374705 ?auto_374706 ?auto_374707 ?auto_374708 )
      ( MAKE-14PILE ?auto_374698 ?auto_374699 ?auto_374700 ?auto_374701 ?auto_374702 ?auto_374703 ?auto_374704 ?auto_374705 ?auto_374706 ?auto_374707 ?auto_374708 ?auto_374709 ?auto_374710 ?auto_374711 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374756 - BLOCK
      ?auto_374757 - BLOCK
      ?auto_374758 - BLOCK
      ?auto_374759 - BLOCK
      ?auto_374760 - BLOCK
      ?auto_374761 - BLOCK
      ?auto_374762 - BLOCK
      ?auto_374763 - BLOCK
      ?auto_374764 - BLOCK
      ?auto_374765 - BLOCK
      ?auto_374766 - BLOCK
      ?auto_374767 - BLOCK
      ?auto_374768 - BLOCK
      ?auto_374769 - BLOCK
    )
    :vars
    (
      ?auto_374770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374769 ?auto_374770 ) ( ON-TABLE ?auto_374756 ) ( ON ?auto_374757 ?auto_374756 ) ( ON ?auto_374758 ?auto_374757 ) ( ON ?auto_374759 ?auto_374758 ) ( ON ?auto_374760 ?auto_374759 ) ( ON ?auto_374761 ?auto_374760 ) ( ON ?auto_374762 ?auto_374761 ) ( ON ?auto_374763 ?auto_374762 ) ( ON ?auto_374764 ?auto_374763 ) ( not ( = ?auto_374756 ?auto_374757 ) ) ( not ( = ?auto_374756 ?auto_374758 ) ) ( not ( = ?auto_374756 ?auto_374759 ) ) ( not ( = ?auto_374756 ?auto_374760 ) ) ( not ( = ?auto_374756 ?auto_374761 ) ) ( not ( = ?auto_374756 ?auto_374762 ) ) ( not ( = ?auto_374756 ?auto_374763 ) ) ( not ( = ?auto_374756 ?auto_374764 ) ) ( not ( = ?auto_374756 ?auto_374765 ) ) ( not ( = ?auto_374756 ?auto_374766 ) ) ( not ( = ?auto_374756 ?auto_374767 ) ) ( not ( = ?auto_374756 ?auto_374768 ) ) ( not ( = ?auto_374756 ?auto_374769 ) ) ( not ( = ?auto_374756 ?auto_374770 ) ) ( not ( = ?auto_374757 ?auto_374758 ) ) ( not ( = ?auto_374757 ?auto_374759 ) ) ( not ( = ?auto_374757 ?auto_374760 ) ) ( not ( = ?auto_374757 ?auto_374761 ) ) ( not ( = ?auto_374757 ?auto_374762 ) ) ( not ( = ?auto_374757 ?auto_374763 ) ) ( not ( = ?auto_374757 ?auto_374764 ) ) ( not ( = ?auto_374757 ?auto_374765 ) ) ( not ( = ?auto_374757 ?auto_374766 ) ) ( not ( = ?auto_374757 ?auto_374767 ) ) ( not ( = ?auto_374757 ?auto_374768 ) ) ( not ( = ?auto_374757 ?auto_374769 ) ) ( not ( = ?auto_374757 ?auto_374770 ) ) ( not ( = ?auto_374758 ?auto_374759 ) ) ( not ( = ?auto_374758 ?auto_374760 ) ) ( not ( = ?auto_374758 ?auto_374761 ) ) ( not ( = ?auto_374758 ?auto_374762 ) ) ( not ( = ?auto_374758 ?auto_374763 ) ) ( not ( = ?auto_374758 ?auto_374764 ) ) ( not ( = ?auto_374758 ?auto_374765 ) ) ( not ( = ?auto_374758 ?auto_374766 ) ) ( not ( = ?auto_374758 ?auto_374767 ) ) ( not ( = ?auto_374758 ?auto_374768 ) ) ( not ( = ?auto_374758 ?auto_374769 ) ) ( not ( = ?auto_374758 ?auto_374770 ) ) ( not ( = ?auto_374759 ?auto_374760 ) ) ( not ( = ?auto_374759 ?auto_374761 ) ) ( not ( = ?auto_374759 ?auto_374762 ) ) ( not ( = ?auto_374759 ?auto_374763 ) ) ( not ( = ?auto_374759 ?auto_374764 ) ) ( not ( = ?auto_374759 ?auto_374765 ) ) ( not ( = ?auto_374759 ?auto_374766 ) ) ( not ( = ?auto_374759 ?auto_374767 ) ) ( not ( = ?auto_374759 ?auto_374768 ) ) ( not ( = ?auto_374759 ?auto_374769 ) ) ( not ( = ?auto_374759 ?auto_374770 ) ) ( not ( = ?auto_374760 ?auto_374761 ) ) ( not ( = ?auto_374760 ?auto_374762 ) ) ( not ( = ?auto_374760 ?auto_374763 ) ) ( not ( = ?auto_374760 ?auto_374764 ) ) ( not ( = ?auto_374760 ?auto_374765 ) ) ( not ( = ?auto_374760 ?auto_374766 ) ) ( not ( = ?auto_374760 ?auto_374767 ) ) ( not ( = ?auto_374760 ?auto_374768 ) ) ( not ( = ?auto_374760 ?auto_374769 ) ) ( not ( = ?auto_374760 ?auto_374770 ) ) ( not ( = ?auto_374761 ?auto_374762 ) ) ( not ( = ?auto_374761 ?auto_374763 ) ) ( not ( = ?auto_374761 ?auto_374764 ) ) ( not ( = ?auto_374761 ?auto_374765 ) ) ( not ( = ?auto_374761 ?auto_374766 ) ) ( not ( = ?auto_374761 ?auto_374767 ) ) ( not ( = ?auto_374761 ?auto_374768 ) ) ( not ( = ?auto_374761 ?auto_374769 ) ) ( not ( = ?auto_374761 ?auto_374770 ) ) ( not ( = ?auto_374762 ?auto_374763 ) ) ( not ( = ?auto_374762 ?auto_374764 ) ) ( not ( = ?auto_374762 ?auto_374765 ) ) ( not ( = ?auto_374762 ?auto_374766 ) ) ( not ( = ?auto_374762 ?auto_374767 ) ) ( not ( = ?auto_374762 ?auto_374768 ) ) ( not ( = ?auto_374762 ?auto_374769 ) ) ( not ( = ?auto_374762 ?auto_374770 ) ) ( not ( = ?auto_374763 ?auto_374764 ) ) ( not ( = ?auto_374763 ?auto_374765 ) ) ( not ( = ?auto_374763 ?auto_374766 ) ) ( not ( = ?auto_374763 ?auto_374767 ) ) ( not ( = ?auto_374763 ?auto_374768 ) ) ( not ( = ?auto_374763 ?auto_374769 ) ) ( not ( = ?auto_374763 ?auto_374770 ) ) ( not ( = ?auto_374764 ?auto_374765 ) ) ( not ( = ?auto_374764 ?auto_374766 ) ) ( not ( = ?auto_374764 ?auto_374767 ) ) ( not ( = ?auto_374764 ?auto_374768 ) ) ( not ( = ?auto_374764 ?auto_374769 ) ) ( not ( = ?auto_374764 ?auto_374770 ) ) ( not ( = ?auto_374765 ?auto_374766 ) ) ( not ( = ?auto_374765 ?auto_374767 ) ) ( not ( = ?auto_374765 ?auto_374768 ) ) ( not ( = ?auto_374765 ?auto_374769 ) ) ( not ( = ?auto_374765 ?auto_374770 ) ) ( not ( = ?auto_374766 ?auto_374767 ) ) ( not ( = ?auto_374766 ?auto_374768 ) ) ( not ( = ?auto_374766 ?auto_374769 ) ) ( not ( = ?auto_374766 ?auto_374770 ) ) ( not ( = ?auto_374767 ?auto_374768 ) ) ( not ( = ?auto_374767 ?auto_374769 ) ) ( not ( = ?auto_374767 ?auto_374770 ) ) ( not ( = ?auto_374768 ?auto_374769 ) ) ( not ( = ?auto_374768 ?auto_374770 ) ) ( not ( = ?auto_374769 ?auto_374770 ) ) ( ON ?auto_374768 ?auto_374769 ) ( ON ?auto_374767 ?auto_374768 ) ( ON ?auto_374766 ?auto_374767 ) ( CLEAR ?auto_374764 ) ( ON ?auto_374765 ?auto_374766 ) ( CLEAR ?auto_374765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_374756 ?auto_374757 ?auto_374758 ?auto_374759 ?auto_374760 ?auto_374761 ?auto_374762 ?auto_374763 ?auto_374764 ?auto_374765 )
      ( MAKE-14PILE ?auto_374756 ?auto_374757 ?auto_374758 ?auto_374759 ?auto_374760 ?auto_374761 ?auto_374762 ?auto_374763 ?auto_374764 ?auto_374765 ?auto_374766 ?auto_374767 ?auto_374768 ?auto_374769 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374814 - BLOCK
      ?auto_374815 - BLOCK
      ?auto_374816 - BLOCK
      ?auto_374817 - BLOCK
      ?auto_374818 - BLOCK
      ?auto_374819 - BLOCK
      ?auto_374820 - BLOCK
      ?auto_374821 - BLOCK
      ?auto_374822 - BLOCK
      ?auto_374823 - BLOCK
      ?auto_374824 - BLOCK
      ?auto_374825 - BLOCK
      ?auto_374826 - BLOCK
      ?auto_374827 - BLOCK
    )
    :vars
    (
      ?auto_374828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374827 ?auto_374828 ) ( ON-TABLE ?auto_374814 ) ( ON ?auto_374815 ?auto_374814 ) ( ON ?auto_374816 ?auto_374815 ) ( ON ?auto_374817 ?auto_374816 ) ( ON ?auto_374818 ?auto_374817 ) ( ON ?auto_374819 ?auto_374818 ) ( ON ?auto_374820 ?auto_374819 ) ( ON ?auto_374821 ?auto_374820 ) ( not ( = ?auto_374814 ?auto_374815 ) ) ( not ( = ?auto_374814 ?auto_374816 ) ) ( not ( = ?auto_374814 ?auto_374817 ) ) ( not ( = ?auto_374814 ?auto_374818 ) ) ( not ( = ?auto_374814 ?auto_374819 ) ) ( not ( = ?auto_374814 ?auto_374820 ) ) ( not ( = ?auto_374814 ?auto_374821 ) ) ( not ( = ?auto_374814 ?auto_374822 ) ) ( not ( = ?auto_374814 ?auto_374823 ) ) ( not ( = ?auto_374814 ?auto_374824 ) ) ( not ( = ?auto_374814 ?auto_374825 ) ) ( not ( = ?auto_374814 ?auto_374826 ) ) ( not ( = ?auto_374814 ?auto_374827 ) ) ( not ( = ?auto_374814 ?auto_374828 ) ) ( not ( = ?auto_374815 ?auto_374816 ) ) ( not ( = ?auto_374815 ?auto_374817 ) ) ( not ( = ?auto_374815 ?auto_374818 ) ) ( not ( = ?auto_374815 ?auto_374819 ) ) ( not ( = ?auto_374815 ?auto_374820 ) ) ( not ( = ?auto_374815 ?auto_374821 ) ) ( not ( = ?auto_374815 ?auto_374822 ) ) ( not ( = ?auto_374815 ?auto_374823 ) ) ( not ( = ?auto_374815 ?auto_374824 ) ) ( not ( = ?auto_374815 ?auto_374825 ) ) ( not ( = ?auto_374815 ?auto_374826 ) ) ( not ( = ?auto_374815 ?auto_374827 ) ) ( not ( = ?auto_374815 ?auto_374828 ) ) ( not ( = ?auto_374816 ?auto_374817 ) ) ( not ( = ?auto_374816 ?auto_374818 ) ) ( not ( = ?auto_374816 ?auto_374819 ) ) ( not ( = ?auto_374816 ?auto_374820 ) ) ( not ( = ?auto_374816 ?auto_374821 ) ) ( not ( = ?auto_374816 ?auto_374822 ) ) ( not ( = ?auto_374816 ?auto_374823 ) ) ( not ( = ?auto_374816 ?auto_374824 ) ) ( not ( = ?auto_374816 ?auto_374825 ) ) ( not ( = ?auto_374816 ?auto_374826 ) ) ( not ( = ?auto_374816 ?auto_374827 ) ) ( not ( = ?auto_374816 ?auto_374828 ) ) ( not ( = ?auto_374817 ?auto_374818 ) ) ( not ( = ?auto_374817 ?auto_374819 ) ) ( not ( = ?auto_374817 ?auto_374820 ) ) ( not ( = ?auto_374817 ?auto_374821 ) ) ( not ( = ?auto_374817 ?auto_374822 ) ) ( not ( = ?auto_374817 ?auto_374823 ) ) ( not ( = ?auto_374817 ?auto_374824 ) ) ( not ( = ?auto_374817 ?auto_374825 ) ) ( not ( = ?auto_374817 ?auto_374826 ) ) ( not ( = ?auto_374817 ?auto_374827 ) ) ( not ( = ?auto_374817 ?auto_374828 ) ) ( not ( = ?auto_374818 ?auto_374819 ) ) ( not ( = ?auto_374818 ?auto_374820 ) ) ( not ( = ?auto_374818 ?auto_374821 ) ) ( not ( = ?auto_374818 ?auto_374822 ) ) ( not ( = ?auto_374818 ?auto_374823 ) ) ( not ( = ?auto_374818 ?auto_374824 ) ) ( not ( = ?auto_374818 ?auto_374825 ) ) ( not ( = ?auto_374818 ?auto_374826 ) ) ( not ( = ?auto_374818 ?auto_374827 ) ) ( not ( = ?auto_374818 ?auto_374828 ) ) ( not ( = ?auto_374819 ?auto_374820 ) ) ( not ( = ?auto_374819 ?auto_374821 ) ) ( not ( = ?auto_374819 ?auto_374822 ) ) ( not ( = ?auto_374819 ?auto_374823 ) ) ( not ( = ?auto_374819 ?auto_374824 ) ) ( not ( = ?auto_374819 ?auto_374825 ) ) ( not ( = ?auto_374819 ?auto_374826 ) ) ( not ( = ?auto_374819 ?auto_374827 ) ) ( not ( = ?auto_374819 ?auto_374828 ) ) ( not ( = ?auto_374820 ?auto_374821 ) ) ( not ( = ?auto_374820 ?auto_374822 ) ) ( not ( = ?auto_374820 ?auto_374823 ) ) ( not ( = ?auto_374820 ?auto_374824 ) ) ( not ( = ?auto_374820 ?auto_374825 ) ) ( not ( = ?auto_374820 ?auto_374826 ) ) ( not ( = ?auto_374820 ?auto_374827 ) ) ( not ( = ?auto_374820 ?auto_374828 ) ) ( not ( = ?auto_374821 ?auto_374822 ) ) ( not ( = ?auto_374821 ?auto_374823 ) ) ( not ( = ?auto_374821 ?auto_374824 ) ) ( not ( = ?auto_374821 ?auto_374825 ) ) ( not ( = ?auto_374821 ?auto_374826 ) ) ( not ( = ?auto_374821 ?auto_374827 ) ) ( not ( = ?auto_374821 ?auto_374828 ) ) ( not ( = ?auto_374822 ?auto_374823 ) ) ( not ( = ?auto_374822 ?auto_374824 ) ) ( not ( = ?auto_374822 ?auto_374825 ) ) ( not ( = ?auto_374822 ?auto_374826 ) ) ( not ( = ?auto_374822 ?auto_374827 ) ) ( not ( = ?auto_374822 ?auto_374828 ) ) ( not ( = ?auto_374823 ?auto_374824 ) ) ( not ( = ?auto_374823 ?auto_374825 ) ) ( not ( = ?auto_374823 ?auto_374826 ) ) ( not ( = ?auto_374823 ?auto_374827 ) ) ( not ( = ?auto_374823 ?auto_374828 ) ) ( not ( = ?auto_374824 ?auto_374825 ) ) ( not ( = ?auto_374824 ?auto_374826 ) ) ( not ( = ?auto_374824 ?auto_374827 ) ) ( not ( = ?auto_374824 ?auto_374828 ) ) ( not ( = ?auto_374825 ?auto_374826 ) ) ( not ( = ?auto_374825 ?auto_374827 ) ) ( not ( = ?auto_374825 ?auto_374828 ) ) ( not ( = ?auto_374826 ?auto_374827 ) ) ( not ( = ?auto_374826 ?auto_374828 ) ) ( not ( = ?auto_374827 ?auto_374828 ) ) ( ON ?auto_374826 ?auto_374827 ) ( ON ?auto_374825 ?auto_374826 ) ( ON ?auto_374824 ?auto_374825 ) ( ON ?auto_374823 ?auto_374824 ) ( CLEAR ?auto_374821 ) ( ON ?auto_374822 ?auto_374823 ) ( CLEAR ?auto_374822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_374814 ?auto_374815 ?auto_374816 ?auto_374817 ?auto_374818 ?auto_374819 ?auto_374820 ?auto_374821 ?auto_374822 )
      ( MAKE-14PILE ?auto_374814 ?auto_374815 ?auto_374816 ?auto_374817 ?auto_374818 ?auto_374819 ?auto_374820 ?auto_374821 ?auto_374822 ?auto_374823 ?auto_374824 ?auto_374825 ?auto_374826 ?auto_374827 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374872 - BLOCK
      ?auto_374873 - BLOCK
      ?auto_374874 - BLOCK
      ?auto_374875 - BLOCK
      ?auto_374876 - BLOCK
      ?auto_374877 - BLOCK
      ?auto_374878 - BLOCK
      ?auto_374879 - BLOCK
      ?auto_374880 - BLOCK
      ?auto_374881 - BLOCK
      ?auto_374882 - BLOCK
      ?auto_374883 - BLOCK
      ?auto_374884 - BLOCK
      ?auto_374885 - BLOCK
    )
    :vars
    (
      ?auto_374886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374885 ?auto_374886 ) ( ON-TABLE ?auto_374872 ) ( ON ?auto_374873 ?auto_374872 ) ( ON ?auto_374874 ?auto_374873 ) ( ON ?auto_374875 ?auto_374874 ) ( ON ?auto_374876 ?auto_374875 ) ( ON ?auto_374877 ?auto_374876 ) ( ON ?auto_374878 ?auto_374877 ) ( not ( = ?auto_374872 ?auto_374873 ) ) ( not ( = ?auto_374872 ?auto_374874 ) ) ( not ( = ?auto_374872 ?auto_374875 ) ) ( not ( = ?auto_374872 ?auto_374876 ) ) ( not ( = ?auto_374872 ?auto_374877 ) ) ( not ( = ?auto_374872 ?auto_374878 ) ) ( not ( = ?auto_374872 ?auto_374879 ) ) ( not ( = ?auto_374872 ?auto_374880 ) ) ( not ( = ?auto_374872 ?auto_374881 ) ) ( not ( = ?auto_374872 ?auto_374882 ) ) ( not ( = ?auto_374872 ?auto_374883 ) ) ( not ( = ?auto_374872 ?auto_374884 ) ) ( not ( = ?auto_374872 ?auto_374885 ) ) ( not ( = ?auto_374872 ?auto_374886 ) ) ( not ( = ?auto_374873 ?auto_374874 ) ) ( not ( = ?auto_374873 ?auto_374875 ) ) ( not ( = ?auto_374873 ?auto_374876 ) ) ( not ( = ?auto_374873 ?auto_374877 ) ) ( not ( = ?auto_374873 ?auto_374878 ) ) ( not ( = ?auto_374873 ?auto_374879 ) ) ( not ( = ?auto_374873 ?auto_374880 ) ) ( not ( = ?auto_374873 ?auto_374881 ) ) ( not ( = ?auto_374873 ?auto_374882 ) ) ( not ( = ?auto_374873 ?auto_374883 ) ) ( not ( = ?auto_374873 ?auto_374884 ) ) ( not ( = ?auto_374873 ?auto_374885 ) ) ( not ( = ?auto_374873 ?auto_374886 ) ) ( not ( = ?auto_374874 ?auto_374875 ) ) ( not ( = ?auto_374874 ?auto_374876 ) ) ( not ( = ?auto_374874 ?auto_374877 ) ) ( not ( = ?auto_374874 ?auto_374878 ) ) ( not ( = ?auto_374874 ?auto_374879 ) ) ( not ( = ?auto_374874 ?auto_374880 ) ) ( not ( = ?auto_374874 ?auto_374881 ) ) ( not ( = ?auto_374874 ?auto_374882 ) ) ( not ( = ?auto_374874 ?auto_374883 ) ) ( not ( = ?auto_374874 ?auto_374884 ) ) ( not ( = ?auto_374874 ?auto_374885 ) ) ( not ( = ?auto_374874 ?auto_374886 ) ) ( not ( = ?auto_374875 ?auto_374876 ) ) ( not ( = ?auto_374875 ?auto_374877 ) ) ( not ( = ?auto_374875 ?auto_374878 ) ) ( not ( = ?auto_374875 ?auto_374879 ) ) ( not ( = ?auto_374875 ?auto_374880 ) ) ( not ( = ?auto_374875 ?auto_374881 ) ) ( not ( = ?auto_374875 ?auto_374882 ) ) ( not ( = ?auto_374875 ?auto_374883 ) ) ( not ( = ?auto_374875 ?auto_374884 ) ) ( not ( = ?auto_374875 ?auto_374885 ) ) ( not ( = ?auto_374875 ?auto_374886 ) ) ( not ( = ?auto_374876 ?auto_374877 ) ) ( not ( = ?auto_374876 ?auto_374878 ) ) ( not ( = ?auto_374876 ?auto_374879 ) ) ( not ( = ?auto_374876 ?auto_374880 ) ) ( not ( = ?auto_374876 ?auto_374881 ) ) ( not ( = ?auto_374876 ?auto_374882 ) ) ( not ( = ?auto_374876 ?auto_374883 ) ) ( not ( = ?auto_374876 ?auto_374884 ) ) ( not ( = ?auto_374876 ?auto_374885 ) ) ( not ( = ?auto_374876 ?auto_374886 ) ) ( not ( = ?auto_374877 ?auto_374878 ) ) ( not ( = ?auto_374877 ?auto_374879 ) ) ( not ( = ?auto_374877 ?auto_374880 ) ) ( not ( = ?auto_374877 ?auto_374881 ) ) ( not ( = ?auto_374877 ?auto_374882 ) ) ( not ( = ?auto_374877 ?auto_374883 ) ) ( not ( = ?auto_374877 ?auto_374884 ) ) ( not ( = ?auto_374877 ?auto_374885 ) ) ( not ( = ?auto_374877 ?auto_374886 ) ) ( not ( = ?auto_374878 ?auto_374879 ) ) ( not ( = ?auto_374878 ?auto_374880 ) ) ( not ( = ?auto_374878 ?auto_374881 ) ) ( not ( = ?auto_374878 ?auto_374882 ) ) ( not ( = ?auto_374878 ?auto_374883 ) ) ( not ( = ?auto_374878 ?auto_374884 ) ) ( not ( = ?auto_374878 ?auto_374885 ) ) ( not ( = ?auto_374878 ?auto_374886 ) ) ( not ( = ?auto_374879 ?auto_374880 ) ) ( not ( = ?auto_374879 ?auto_374881 ) ) ( not ( = ?auto_374879 ?auto_374882 ) ) ( not ( = ?auto_374879 ?auto_374883 ) ) ( not ( = ?auto_374879 ?auto_374884 ) ) ( not ( = ?auto_374879 ?auto_374885 ) ) ( not ( = ?auto_374879 ?auto_374886 ) ) ( not ( = ?auto_374880 ?auto_374881 ) ) ( not ( = ?auto_374880 ?auto_374882 ) ) ( not ( = ?auto_374880 ?auto_374883 ) ) ( not ( = ?auto_374880 ?auto_374884 ) ) ( not ( = ?auto_374880 ?auto_374885 ) ) ( not ( = ?auto_374880 ?auto_374886 ) ) ( not ( = ?auto_374881 ?auto_374882 ) ) ( not ( = ?auto_374881 ?auto_374883 ) ) ( not ( = ?auto_374881 ?auto_374884 ) ) ( not ( = ?auto_374881 ?auto_374885 ) ) ( not ( = ?auto_374881 ?auto_374886 ) ) ( not ( = ?auto_374882 ?auto_374883 ) ) ( not ( = ?auto_374882 ?auto_374884 ) ) ( not ( = ?auto_374882 ?auto_374885 ) ) ( not ( = ?auto_374882 ?auto_374886 ) ) ( not ( = ?auto_374883 ?auto_374884 ) ) ( not ( = ?auto_374883 ?auto_374885 ) ) ( not ( = ?auto_374883 ?auto_374886 ) ) ( not ( = ?auto_374884 ?auto_374885 ) ) ( not ( = ?auto_374884 ?auto_374886 ) ) ( not ( = ?auto_374885 ?auto_374886 ) ) ( ON ?auto_374884 ?auto_374885 ) ( ON ?auto_374883 ?auto_374884 ) ( ON ?auto_374882 ?auto_374883 ) ( ON ?auto_374881 ?auto_374882 ) ( ON ?auto_374880 ?auto_374881 ) ( CLEAR ?auto_374878 ) ( ON ?auto_374879 ?auto_374880 ) ( CLEAR ?auto_374879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_374872 ?auto_374873 ?auto_374874 ?auto_374875 ?auto_374876 ?auto_374877 ?auto_374878 ?auto_374879 )
      ( MAKE-14PILE ?auto_374872 ?auto_374873 ?auto_374874 ?auto_374875 ?auto_374876 ?auto_374877 ?auto_374878 ?auto_374879 ?auto_374880 ?auto_374881 ?auto_374882 ?auto_374883 ?auto_374884 ?auto_374885 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374930 - BLOCK
      ?auto_374931 - BLOCK
      ?auto_374932 - BLOCK
      ?auto_374933 - BLOCK
      ?auto_374934 - BLOCK
      ?auto_374935 - BLOCK
      ?auto_374936 - BLOCK
      ?auto_374937 - BLOCK
      ?auto_374938 - BLOCK
      ?auto_374939 - BLOCK
      ?auto_374940 - BLOCK
      ?auto_374941 - BLOCK
      ?auto_374942 - BLOCK
      ?auto_374943 - BLOCK
    )
    :vars
    (
      ?auto_374944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374943 ?auto_374944 ) ( ON-TABLE ?auto_374930 ) ( ON ?auto_374931 ?auto_374930 ) ( ON ?auto_374932 ?auto_374931 ) ( ON ?auto_374933 ?auto_374932 ) ( ON ?auto_374934 ?auto_374933 ) ( ON ?auto_374935 ?auto_374934 ) ( not ( = ?auto_374930 ?auto_374931 ) ) ( not ( = ?auto_374930 ?auto_374932 ) ) ( not ( = ?auto_374930 ?auto_374933 ) ) ( not ( = ?auto_374930 ?auto_374934 ) ) ( not ( = ?auto_374930 ?auto_374935 ) ) ( not ( = ?auto_374930 ?auto_374936 ) ) ( not ( = ?auto_374930 ?auto_374937 ) ) ( not ( = ?auto_374930 ?auto_374938 ) ) ( not ( = ?auto_374930 ?auto_374939 ) ) ( not ( = ?auto_374930 ?auto_374940 ) ) ( not ( = ?auto_374930 ?auto_374941 ) ) ( not ( = ?auto_374930 ?auto_374942 ) ) ( not ( = ?auto_374930 ?auto_374943 ) ) ( not ( = ?auto_374930 ?auto_374944 ) ) ( not ( = ?auto_374931 ?auto_374932 ) ) ( not ( = ?auto_374931 ?auto_374933 ) ) ( not ( = ?auto_374931 ?auto_374934 ) ) ( not ( = ?auto_374931 ?auto_374935 ) ) ( not ( = ?auto_374931 ?auto_374936 ) ) ( not ( = ?auto_374931 ?auto_374937 ) ) ( not ( = ?auto_374931 ?auto_374938 ) ) ( not ( = ?auto_374931 ?auto_374939 ) ) ( not ( = ?auto_374931 ?auto_374940 ) ) ( not ( = ?auto_374931 ?auto_374941 ) ) ( not ( = ?auto_374931 ?auto_374942 ) ) ( not ( = ?auto_374931 ?auto_374943 ) ) ( not ( = ?auto_374931 ?auto_374944 ) ) ( not ( = ?auto_374932 ?auto_374933 ) ) ( not ( = ?auto_374932 ?auto_374934 ) ) ( not ( = ?auto_374932 ?auto_374935 ) ) ( not ( = ?auto_374932 ?auto_374936 ) ) ( not ( = ?auto_374932 ?auto_374937 ) ) ( not ( = ?auto_374932 ?auto_374938 ) ) ( not ( = ?auto_374932 ?auto_374939 ) ) ( not ( = ?auto_374932 ?auto_374940 ) ) ( not ( = ?auto_374932 ?auto_374941 ) ) ( not ( = ?auto_374932 ?auto_374942 ) ) ( not ( = ?auto_374932 ?auto_374943 ) ) ( not ( = ?auto_374932 ?auto_374944 ) ) ( not ( = ?auto_374933 ?auto_374934 ) ) ( not ( = ?auto_374933 ?auto_374935 ) ) ( not ( = ?auto_374933 ?auto_374936 ) ) ( not ( = ?auto_374933 ?auto_374937 ) ) ( not ( = ?auto_374933 ?auto_374938 ) ) ( not ( = ?auto_374933 ?auto_374939 ) ) ( not ( = ?auto_374933 ?auto_374940 ) ) ( not ( = ?auto_374933 ?auto_374941 ) ) ( not ( = ?auto_374933 ?auto_374942 ) ) ( not ( = ?auto_374933 ?auto_374943 ) ) ( not ( = ?auto_374933 ?auto_374944 ) ) ( not ( = ?auto_374934 ?auto_374935 ) ) ( not ( = ?auto_374934 ?auto_374936 ) ) ( not ( = ?auto_374934 ?auto_374937 ) ) ( not ( = ?auto_374934 ?auto_374938 ) ) ( not ( = ?auto_374934 ?auto_374939 ) ) ( not ( = ?auto_374934 ?auto_374940 ) ) ( not ( = ?auto_374934 ?auto_374941 ) ) ( not ( = ?auto_374934 ?auto_374942 ) ) ( not ( = ?auto_374934 ?auto_374943 ) ) ( not ( = ?auto_374934 ?auto_374944 ) ) ( not ( = ?auto_374935 ?auto_374936 ) ) ( not ( = ?auto_374935 ?auto_374937 ) ) ( not ( = ?auto_374935 ?auto_374938 ) ) ( not ( = ?auto_374935 ?auto_374939 ) ) ( not ( = ?auto_374935 ?auto_374940 ) ) ( not ( = ?auto_374935 ?auto_374941 ) ) ( not ( = ?auto_374935 ?auto_374942 ) ) ( not ( = ?auto_374935 ?auto_374943 ) ) ( not ( = ?auto_374935 ?auto_374944 ) ) ( not ( = ?auto_374936 ?auto_374937 ) ) ( not ( = ?auto_374936 ?auto_374938 ) ) ( not ( = ?auto_374936 ?auto_374939 ) ) ( not ( = ?auto_374936 ?auto_374940 ) ) ( not ( = ?auto_374936 ?auto_374941 ) ) ( not ( = ?auto_374936 ?auto_374942 ) ) ( not ( = ?auto_374936 ?auto_374943 ) ) ( not ( = ?auto_374936 ?auto_374944 ) ) ( not ( = ?auto_374937 ?auto_374938 ) ) ( not ( = ?auto_374937 ?auto_374939 ) ) ( not ( = ?auto_374937 ?auto_374940 ) ) ( not ( = ?auto_374937 ?auto_374941 ) ) ( not ( = ?auto_374937 ?auto_374942 ) ) ( not ( = ?auto_374937 ?auto_374943 ) ) ( not ( = ?auto_374937 ?auto_374944 ) ) ( not ( = ?auto_374938 ?auto_374939 ) ) ( not ( = ?auto_374938 ?auto_374940 ) ) ( not ( = ?auto_374938 ?auto_374941 ) ) ( not ( = ?auto_374938 ?auto_374942 ) ) ( not ( = ?auto_374938 ?auto_374943 ) ) ( not ( = ?auto_374938 ?auto_374944 ) ) ( not ( = ?auto_374939 ?auto_374940 ) ) ( not ( = ?auto_374939 ?auto_374941 ) ) ( not ( = ?auto_374939 ?auto_374942 ) ) ( not ( = ?auto_374939 ?auto_374943 ) ) ( not ( = ?auto_374939 ?auto_374944 ) ) ( not ( = ?auto_374940 ?auto_374941 ) ) ( not ( = ?auto_374940 ?auto_374942 ) ) ( not ( = ?auto_374940 ?auto_374943 ) ) ( not ( = ?auto_374940 ?auto_374944 ) ) ( not ( = ?auto_374941 ?auto_374942 ) ) ( not ( = ?auto_374941 ?auto_374943 ) ) ( not ( = ?auto_374941 ?auto_374944 ) ) ( not ( = ?auto_374942 ?auto_374943 ) ) ( not ( = ?auto_374942 ?auto_374944 ) ) ( not ( = ?auto_374943 ?auto_374944 ) ) ( ON ?auto_374942 ?auto_374943 ) ( ON ?auto_374941 ?auto_374942 ) ( ON ?auto_374940 ?auto_374941 ) ( ON ?auto_374939 ?auto_374940 ) ( ON ?auto_374938 ?auto_374939 ) ( ON ?auto_374937 ?auto_374938 ) ( CLEAR ?auto_374935 ) ( ON ?auto_374936 ?auto_374937 ) ( CLEAR ?auto_374936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_374930 ?auto_374931 ?auto_374932 ?auto_374933 ?auto_374934 ?auto_374935 ?auto_374936 )
      ( MAKE-14PILE ?auto_374930 ?auto_374931 ?auto_374932 ?auto_374933 ?auto_374934 ?auto_374935 ?auto_374936 ?auto_374937 ?auto_374938 ?auto_374939 ?auto_374940 ?auto_374941 ?auto_374942 ?auto_374943 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374988 - BLOCK
      ?auto_374989 - BLOCK
      ?auto_374990 - BLOCK
      ?auto_374991 - BLOCK
      ?auto_374992 - BLOCK
      ?auto_374993 - BLOCK
      ?auto_374994 - BLOCK
      ?auto_374995 - BLOCK
      ?auto_374996 - BLOCK
      ?auto_374997 - BLOCK
      ?auto_374998 - BLOCK
      ?auto_374999 - BLOCK
      ?auto_375000 - BLOCK
      ?auto_375001 - BLOCK
    )
    :vars
    (
      ?auto_375002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375001 ?auto_375002 ) ( ON-TABLE ?auto_374988 ) ( ON ?auto_374989 ?auto_374988 ) ( ON ?auto_374990 ?auto_374989 ) ( ON ?auto_374991 ?auto_374990 ) ( ON ?auto_374992 ?auto_374991 ) ( not ( = ?auto_374988 ?auto_374989 ) ) ( not ( = ?auto_374988 ?auto_374990 ) ) ( not ( = ?auto_374988 ?auto_374991 ) ) ( not ( = ?auto_374988 ?auto_374992 ) ) ( not ( = ?auto_374988 ?auto_374993 ) ) ( not ( = ?auto_374988 ?auto_374994 ) ) ( not ( = ?auto_374988 ?auto_374995 ) ) ( not ( = ?auto_374988 ?auto_374996 ) ) ( not ( = ?auto_374988 ?auto_374997 ) ) ( not ( = ?auto_374988 ?auto_374998 ) ) ( not ( = ?auto_374988 ?auto_374999 ) ) ( not ( = ?auto_374988 ?auto_375000 ) ) ( not ( = ?auto_374988 ?auto_375001 ) ) ( not ( = ?auto_374988 ?auto_375002 ) ) ( not ( = ?auto_374989 ?auto_374990 ) ) ( not ( = ?auto_374989 ?auto_374991 ) ) ( not ( = ?auto_374989 ?auto_374992 ) ) ( not ( = ?auto_374989 ?auto_374993 ) ) ( not ( = ?auto_374989 ?auto_374994 ) ) ( not ( = ?auto_374989 ?auto_374995 ) ) ( not ( = ?auto_374989 ?auto_374996 ) ) ( not ( = ?auto_374989 ?auto_374997 ) ) ( not ( = ?auto_374989 ?auto_374998 ) ) ( not ( = ?auto_374989 ?auto_374999 ) ) ( not ( = ?auto_374989 ?auto_375000 ) ) ( not ( = ?auto_374989 ?auto_375001 ) ) ( not ( = ?auto_374989 ?auto_375002 ) ) ( not ( = ?auto_374990 ?auto_374991 ) ) ( not ( = ?auto_374990 ?auto_374992 ) ) ( not ( = ?auto_374990 ?auto_374993 ) ) ( not ( = ?auto_374990 ?auto_374994 ) ) ( not ( = ?auto_374990 ?auto_374995 ) ) ( not ( = ?auto_374990 ?auto_374996 ) ) ( not ( = ?auto_374990 ?auto_374997 ) ) ( not ( = ?auto_374990 ?auto_374998 ) ) ( not ( = ?auto_374990 ?auto_374999 ) ) ( not ( = ?auto_374990 ?auto_375000 ) ) ( not ( = ?auto_374990 ?auto_375001 ) ) ( not ( = ?auto_374990 ?auto_375002 ) ) ( not ( = ?auto_374991 ?auto_374992 ) ) ( not ( = ?auto_374991 ?auto_374993 ) ) ( not ( = ?auto_374991 ?auto_374994 ) ) ( not ( = ?auto_374991 ?auto_374995 ) ) ( not ( = ?auto_374991 ?auto_374996 ) ) ( not ( = ?auto_374991 ?auto_374997 ) ) ( not ( = ?auto_374991 ?auto_374998 ) ) ( not ( = ?auto_374991 ?auto_374999 ) ) ( not ( = ?auto_374991 ?auto_375000 ) ) ( not ( = ?auto_374991 ?auto_375001 ) ) ( not ( = ?auto_374991 ?auto_375002 ) ) ( not ( = ?auto_374992 ?auto_374993 ) ) ( not ( = ?auto_374992 ?auto_374994 ) ) ( not ( = ?auto_374992 ?auto_374995 ) ) ( not ( = ?auto_374992 ?auto_374996 ) ) ( not ( = ?auto_374992 ?auto_374997 ) ) ( not ( = ?auto_374992 ?auto_374998 ) ) ( not ( = ?auto_374992 ?auto_374999 ) ) ( not ( = ?auto_374992 ?auto_375000 ) ) ( not ( = ?auto_374992 ?auto_375001 ) ) ( not ( = ?auto_374992 ?auto_375002 ) ) ( not ( = ?auto_374993 ?auto_374994 ) ) ( not ( = ?auto_374993 ?auto_374995 ) ) ( not ( = ?auto_374993 ?auto_374996 ) ) ( not ( = ?auto_374993 ?auto_374997 ) ) ( not ( = ?auto_374993 ?auto_374998 ) ) ( not ( = ?auto_374993 ?auto_374999 ) ) ( not ( = ?auto_374993 ?auto_375000 ) ) ( not ( = ?auto_374993 ?auto_375001 ) ) ( not ( = ?auto_374993 ?auto_375002 ) ) ( not ( = ?auto_374994 ?auto_374995 ) ) ( not ( = ?auto_374994 ?auto_374996 ) ) ( not ( = ?auto_374994 ?auto_374997 ) ) ( not ( = ?auto_374994 ?auto_374998 ) ) ( not ( = ?auto_374994 ?auto_374999 ) ) ( not ( = ?auto_374994 ?auto_375000 ) ) ( not ( = ?auto_374994 ?auto_375001 ) ) ( not ( = ?auto_374994 ?auto_375002 ) ) ( not ( = ?auto_374995 ?auto_374996 ) ) ( not ( = ?auto_374995 ?auto_374997 ) ) ( not ( = ?auto_374995 ?auto_374998 ) ) ( not ( = ?auto_374995 ?auto_374999 ) ) ( not ( = ?auto_374995 ?auto_375000 ) ) ( not ( = ?auto_374995 ?auto_375001 ) ) ( not ( = ?auto_374995 ?auto_375002 ) ) ( not ( = ?auto_374996 ?auto_374997 ) ) ( not ( = ?auto_374996 ?auto_374998 ) ) ( not ( = ?auto_374996 ?auto_374999 ) ) ( not ( = ?auto_374996 ?auto_375000 ) ) ( not ( = ?auto_374996 ?auto_375001 ) ) ( not ( = ?auto_374996 ?auto_375002 ) ) ( not ( = ?auto_374997 ?auto_374998 ) ) ( not ( = ?auto_374997 ?auto_374999 ) ) ( not ( = ?auto_374997 ?auto_375000 ) ) ( not ( = ?auto_374997 ?auto_375001 ) ) ( not ( = ?auto_374997 ?auto_375002 ) ) ( not ( = ?auto_374998 ?auto_374999 ) ) ( not ( = ?auto_374998 ?auto_375000 ) ) ( not ( = ?auto_374998 ?auto_375001 ) ) ( not ( = ?auto_374998 ?auto_375002 ) ) ( not ( = ?auto_374999 ?auto_375000 ) ) ( not ( = ?auto_374999 ?auto_375001 ) ) ( not ( = ?auto_374999 ?auto_375002 ) ) ( not ( = ?auto_375000 ?auto_375001 ) ) ( not ( = ?auto_375000 ?auto_375002 ) ) ( not ( = ?auto_375001 ?auto_375002 ) ) ( ON ?auto_375000 ?auto_375001 ) ( ON ?auto_374999 ?auto_375000 ) ( ON ?auto_374998 ?auto_374999 ) ( ON ?auto_374997 ?auto_374998 ) ( ON ?auto_374996 ?auto_374997 ) ( ON ?auto_374995 ?auto_374996 ) ( ON ?auto_374994 ?auto_374995 ) ( CLEAR ?auto_374992 ) ( ON ?auto_374993 ?auto_374994 ) ( CLEAR ?auto_374993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_374988 ?auto_374989 ?auto_374990 ?auto_374991 ?auto_374992 ?auto_374993 )
      ( MAKE-14PILE ?auto_374988 ?auto_374989 ?auto_374990 ?auto_374991 ?auto_374992 ?auto_374993 ?auto_374994 ?auto_374995 ?auto_374996 ?auto_374997 ?auto_374998 ?auto_374999 ?auto_375000 ?auto_375001 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375046 - BLOCK
      ?auto_375047 - BLOCK
      ?auto_375048 - BLOCK
      ?auto_375049 - BLOCK
      ?auto_375050 - BLOCK
      ?auto_375051 - BLOCK
      ?auto_375052 - BLOCK
      ?auto_375053 - BLOCK
      ?auto_375054 - BLOCK
      ?auto_375055 - BLOCK
      ?auto_375056 - BLOCK
      ?auto_375057 - BLOCK
      ?auto_375058 - BLOCK
      ?auto_375059 - BLOCK
    )
    :vars
    (
      ?auto_375060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375059 ?auto_375060 ) ( ON-TABLE ?auto_375046 ) ( ON ?auto_375047 ?auto_375046 ) ( ON ?auto_375048 ?auto_375047 ) ( ON ?auto_375049 ?auto_375048 ) ( not ( = ?auto_375046 ?auto_375047 ) ) ( not ( = ?auto_375046 ?auto_375048 ) ) ( not ( = ?auto_375046 ?auto_375049 ) ) ( not ( = ?auto_375046 ?auto_375050 ) ) ( not ( = ?auto_375046 ?auto_375051 ) ) ( not ( = ?auto_375046 ?auto_375052 ) ) ( not ( = ?auto_375046 ?auto_375053 ) ) ( not ( = ?auto_375046 ?auto_375054 ) ) ( not ( = ?auto_375046 ?auto_375055 ) ) ( not ( = ?auto_375046 ?auto_375056 ) ) ( not ( = ?auto_375046 ?auto_375057 ) ) ( not ( = ?auto_375046 ?auto_375058 ) ) ( not ( = ?auto_375046 ?auto_375059 ) ) ( not ( = ?auto_375046 ?auto_375060 ) ) ( not ( = ?auto_375047 ?auto_375048 ) ) ( not ( = ?auto_375047 ?auto_375049 ) ) ( not ( = ?auto_375047 ?auto_375050 ) ) ( not ( = ?auto_375047 ?auto_375051 ) ) ( not ( = ?auto_375047 ?auto_375052 ) ) ( not ( = ?auto_375047 ?auto_375053 ) ) ( not ( = ?auto_375047 ?auto_375054 ) ) ( not ( = ?auto_375047 ?auto_375055 ) ) ( not ( = ?auto_375047 ?auto_375056 ) ) ( not ( = ?auto_375047 ?auto_375057 ) ) ( not ( = ?auto_375047 ?auto_375058 ) ) ( not ( = ?auto_375047 ?auto_375059 ) ) ( not ( = ?auto_375047 ?auto_375060 ) ) ( not ( = ?auto_375048 ?auto_375049 ) ) ( not ( = ?auto_375048 ?auto_375050 ) ) ( not ( = ?auto_375048 ?auto_375051 ) ) ( not ( = ?auto_375048 ?auto_375052 ) ) ( not ( = ?auto_375048 ?auto_375053 ) ) ( not ( = ?auto_375048 ?auto_375054 ) ) ( not ( = ?auto_375048 ?auto_375055 ) ) ( not ( = ?auto_375048 ?auto_375056 ) ) ( not ( = ?auto_375048 ?auto_375057 ) ) ( not ( = ?auto_375048 ?auto_375058 ) ) ( not ( = ?auto_375048 ?auto_375059 ) ) ( not ( = ?auto_375048 ?auto_375060 ) ) ( not ( = ?auto_375049 ?auto_375050 ) ) ( not ( = ?auto_375049 ?auto_375051 ) ) ( not ( = ?auto_375049 ?auto_375052 ) ) ( not ( = ?auto_375049 ?auto_375053 ) ) ( not ( = ?auto_375049 ?auto_375054 ) ) ( not ( = ?auto_375049 ?auto_375055 ) ) ( not ( = ?auto_375049 ?auto_375056 ) ) ( not ( = ?auto_375049 ?auto_375057 ) ) ( not ( = ?auto_375049 ?auto_375058 ) ) ( not ( = ?auto_375049 ?auto_375059 ) ) ( not ( = ?auto_375049 ?auto_375060 ) ) ( not ( = ?auto_375050 ?auto_375051 ) ) ( not ( = ?auto_375050 ?auto_375052 ) ) ( not ( = ?auto_375050 ?auto_375053 ) ) ( not ( = ?auto_375050 ?auto_375054 ) ) ( not ( = ?auto_375050 ?auto_375055 ) ) ( not ( = ?auto_375050 ?auto_375056 ) ) ( not ( = ?auto_375050 ?auto_375057 ) ) ( not ( = ?auto_375050 ?auto_375058 ) ) ( not ( = ?auto_375050 ?auto_375059 ) ) ( not ( = ?auto_375050 ?auto_375060 ) ) ( not ( = ?auto_375051 ?auto_375052 ) ) ( not ( = ?auto_375051 ?auto_375053 ) ) ( not ( = ?auto_375051 ?auto_375054 ) ) ( not ( = ?auto_375051 ?auto_375055 ) ) ( not ( = ?auto_375051 ?auto_375056 ) ) ( not ( = ?auto_375051 ?auto_375057 ) ) ( not ( = ?auto_375051 ?auto_375058 ) ) ( not ( = ?auto_375051 ?auto_375059 ) ) ( not ( = ?auto_375051 ?auto_375060 ) ) ( not ( = ?auto_375052 ?auto_375053 ) ) ( not ( = ?auto_375052 ?auto_375054 ) ) ( not ( = ?auto_375052 ?auto_375055 ) ) ( not ( = ?auto_375052 ?auto_375056 ) ) ( not ( = ?auto_375052 ?auto_375057 ) ) ( not ( = ?auto_375052 ?auto_375058 ) ) ( not ( = ?auto_375052 ?auto_375059 ) ) ( not ( = ?auto_375052 ?auto_375060 ) ) ( not ( = ?auto_375053 ?auto_375054 ) ) ( not ( = ?auto_375053 ?auto_375055 ) ) ( not ( = ?auto_375053 ?auto_375056 ) ) ( not ( = ?auto_375053 ?auto_375057 ) ) ( not ( = ?auto_375053 ?auto_375058 ) ) ( not ( = ?auto_375053 ?auto_375059 ) ) ( not ( = ?auto_375053 ?auto_375060 ) ) ( not ( = ?auto_375054 ?auto_375055 ) ) ( not ( = ?auto_375054 ?auto_375056 ) ) ( not ( = ?auto_375054 ?auto_375057 ) ) ( not ( = ?auto_375054 ?auto_375058 ) ) ( not ( = ?auto_375054 ?auto_375059 ) ) ( not ( = ?auto_375054 ?auto_375060 ) ) ( not ( = ?auto_375055 ?auto_375056 ) ) ( not ( = ?auto_375055 ?auto_375057 ) ) ( not ( = ?auto_375055 ?auto_375058 ) ) ( not ( = ?auto_375055 ?auto_375059 ) ) ( not ( = ?auto_375055 ?auto_375060 ) ) ( not ( = ?auto_375056 ?auto_375057 ) ) ( not ( = ?auto_375056 ?auto_375058 ) ) ( not ( = ?auto_375056 ?auto_375059 ) ) ( not ( = ?auto_375056 ?auto_375060 ) ) ( not ( = ?auto_375057 ?auto_375058 ) ) ( not ( = ?auto_375057 ?auto_375059 ) ) ( not ( = ?auto_375057 ?auto_375060 ) ) ( not ( = ?auto_375058 ?auto_375059 ) ) ( not ( = ?auto_375058 ?auto_375060 ) ) ( not ( = ?auto_375059 ?auto_375060 ) ) ( ON ?auto_375058 ?auto_375059 ) ( ON ?auto_375057 ?auto_375058 ) ( ON ?auto_375056 ?auto_375057 ) ( ON ?auto_375055 ?auto_375056 ) ( ON ?auto_375054 ?auto_375055 ) ( ON ?auto_375053 ?auto_375054 ) ( ON ?auto_375052 ?auto_375053 ) ( ON ?auto_375051 ?auto_375052 ) ( CLEAR ?auto_375049 ) ( ON ?auto_375050 ?auto_375051 ) ( CLEAR ?auto_375050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_375046 ?auto_375047 ?auto_375048 ?auto_375049 ?auto_375050 )
      ( MAKE-14PILE ?auto_375046 ?auto_375047 ?auto_375048 ?auto_375049 ?auto_375050 ?auto_375051 ?auto_375052 ?auto_375053 ?auto_375054 ?auto_375055 ?auto_375056 ?auto_375057 ?auto_375058 ?auto_375059 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375104 - BLOCK
      ?auto_375105 - BLOCK
      ?auto_375106 - BLOCK
      ?auto_375107 - BLOCK
      ?auto_375108 - BLOCK
      ?auto_375109 - BLOCK
      ?auto_375110 - BLOCK
      ?auto_375111 - BLOCK
      ?auto_375112 - BLOCK
      ?auto_375113 - BLOCK
      ?auto_375114 - BLOCK
      ?auto_375115 - BLOCK
      ?auto_375116 - BLOCK
      ?auto_375117 - BLOCK
    )
    :vars
    (
      ?auto_375118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375117 ?auto_375118 ) ( ON-TABLE ?auto_375104 ) ( ON ?auto_375105 ?auto_375104 ) ( ON ?auto_375106 ?auto_375105 ) ( not ( = ?auto_375104 ?auto_375105 ) ) ( not ( = ?auto_375104 ?auto_375106 ) ) ( not ( = ?auto_375104 ?auto_375107 ) ) ( not ( = ?auto_375104 ?auto_375108 ) ) ( not ( = ?auto_375104 ?auto_375109 ) ) ( not ( = ?auto_375104 ?auto_375110 ) ) ( not ( = ?auto_375104 ?auto_375111 ) ) ( not ( = ?auto_375104 ?auto_375112 ) ) ( not ( = ?auto_375104 ?auto_375113 ) ) ( not ( = ?auto_375104 ?auto_375114 ) ) ( not ( = ?auto_375104 ?auto_375115 ) ) ( not ( = ?auto_375104 ?auto_375116 ) ) ( not ( = ?auto_375104 ?auto_375117 ) ) ( not ( = ?auto_375104 ?auto_375118 ) ) ( not ( = ?auto_375105 ?auto_375106 ) ) ( not ( = ?auto_375105 ?auto_375107 ) ) ( not ( = ?auto_375105 ?auto_375108 ) ) ( not ( = ?auto_375105 ?auto_375109 ) ) ( not ( = ?auto_375105 ?auto_375110 ) ) ( not ( = ?auto_375105 ?auto_375111 ) ) ( not ( = ?auto_375105 ?auto_375112 ) ) ( not ( = ?auto_375105 ?auto_375113 ) ) ( not ( = ?auto_375105 ?auto_375114 ) ) ( not ( = ?auto_375105 ?auto_375115 ) ) ( not ( = ?auto_375105 ?auto_375116 ) ) ( not ( = ?auto_375105 ?auto_375117 ) ) ( not ( = ?auto_375105 ?auto_375118 ) ) ( not ( = ?auto_375106 ?auto_375107 ) ) ( not ( = ?auto_375106 ?auto_375108 ) ) ( not ( = ?auto_375106 ?auto_375109 ) ) ( not ( = ?auto_375106 ?auto_375110 ) ) ( not ( = ?auto_375106 ?auto_375111 ) ) ( not ( = ?auto_375106 ?auto_375112 ) ) ( not ( = ?auto_375106 ?auto_375113 ) ) ( not ( = ?auto_375106 ?auto_375114 ) ) ( not ( = ?auto_375106 ?auto_375115 ) ) ( not ( = ?auto_375106 ?auto_375116 ) ) ( not ( = ?auto_375106 ?auto_375117 ) ) ( not ( = ?auto_375106 ?auto_375118 ) ) ( not ( = ?auto_375107 ?auto_375108 ) ) ( not ( = ?auto_375107 ?auto_375109 ) ) ( not ( = ?auto_375107 ?auto_375110 ) ) ( not ( = ?auto_375107 ?auto_375111 ) ) ( not ( = ?auto_375107 ?auto_375112 ) ) ( not ( = ?auto_375107 ?auto_375113 ) ) ( not ( = ?auto_375107 ?auto_375114 ) ) ( not ( = ?auto_375107 ?auto_375115 ) ) ( not ( = ?auto_375107 ?auto_375116 ) ) ( not ( = ?auto_375107 ?auto_375117 ) ) ( not ( = ?auto_375107 ?auto_375118 ) ) ( not ( = ?auto_375108 ?auto_375109 ) ) ( not ( = ?auto_375108 ?auto_375110 ) ) ( not ( = ?auto_375108 ?auto_375111 ) ) ( not ( = ?auto_375108 ?auto_375112 ) ) ( not ( = ?auto_375108 ?auto_375113 ) ) ( not ( = ?auto_375108 ?auto_375114 ) ) ( not ( = ?auto_375108 ?auto_375115 ) ) ( not ( = ?auto_375108 ?auto_375116 ) ) ( not ( = ?auto_375108 ?auto_375117 ) ) ( not ( = ?auto_375108 ?auto_375118 ) ) ( not ( = ?auto_375109 ?auto_375110 ) ) ( not ( = ?auto_375109 ?auto_375111 ) ) ( not ( = ?auto_375109 ?auto_375112 ) ) ( not ( = ?auto_375109 ?auto_375113 ) ) ( not ( = ?auto_375109 ?auto_375114 ) ) ( not ( = ?auto_375109 ?auto_375115 ) ) ( not ( = ?auto_375109 ?auto_375116 ) ) ( not ( = ?auto_375109 ?auto_375117 ) ) ( not ( = ?auto_375109 ?auto_375118 ) ) ( not ( = ?auto_375110 ?auto_375111 ) ) ( not ( = ?auto_375110 ?auto_375112 ) ) ( not ( = ?auto_375110 ?auto_375113 ) ) ( not ( = ?auto_375110 ?auto_375114 ) ) ( not ( = ?auto_375110 ?auto_375115 ) ) ( not ( = ?auto_375110 ?auto_375116 ) ) ( not ( = ?auto_375110 ?auto_375117 ) ) ( not ( = ?auto_375110 ?auto_375118 ) ) ( not ( = ?auto_375111 ?auto_375112 ) ) ( not ( = ?auto_375111 ?auto_375113 ) ) ( not ( = ?auto_375111 ?auto_375114 ) ) ( not ( = ?auto_375111 ?auto_375115 ) ) ( not ( = ?auto_375111 ?auto_375116 ) ) ( not ( = ?auto_375111 ?auto_375117 ) ) ( not ( = ?auto_375111 ?auto_375118 ) ) ( not ( = ?auto_375112 ?auto_375113 ) ) ( not ( = ?auto_375112 ?auto_375114 ) ) ( not ( = ?auto_375112 ?auto_375115 ) ) ( not ( = ?auto_375112 ?auto_375116 ) ) ( not ( = ?auto_375112 ?auto_375117 ) ) ( not ( = ?auto_375112 ?auto_375118 ) ) ( not ( = ?auto_375113 ?auto_375114 ) ) ( not ( = ?auto_375113 ?auto_375115 ) ) ( not ( = ?auto_375113 ?auto_375116 ) ) ( not ( = ?auto_375113 ?auto_375117 ) ) ( not ( = ?auto_375113 ?auto_375118 ) ) ( not ( = ?auto_375114 ?auto_375115 ) ) ( not ( = ?auto_375114 ?auto_375116 ) ) ( not ( = ?auto_375114 ?auto_375117 ) ) ( not ( = ?auto_375114 ?auto_375118 ) ) ( not ( = ?auto_375115 ?auto_375116 ) ) ( not ( = ?auto_375115 ?auto_375117 ) ) ( not ( = ?auto_375115 ?auto_375118 ) ) ( not ( = ?auto_375116 ?auto_375117 ) ) ( not ( = ?auto_375116 ?auto_375118 ) ) ( not ( = ?auto_375117 ?auto_375118 ) ) ( ON ?auto_375116 ?auto_375117 ) ( ON ?auto_375115 ?auto_375116 ) ( ON ?auto_375114 ?auto_375115 ) ( ON ?auto_375113 ?auto_375114 ) ( ON ?auto_375112 ?auto_375113 ) ( ON ?auto_375111 ?auto_375112 ) ( ON ?auto_375110 ?auto_375111 ) ( ON ?auto_375109 ?auto_375110 ) ( ON ?auto_375108 ?auto_375109 ) ( CLEAR ?auto_375106 ) ( ON ?auto_375107 ?auto_375108 ) ( CLEAR ?auto_375107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_375104 ?auto_375105 ?auto_375106 ?auto_375107 )
      ( MAKE-14PILE ?auto_375104 ?auto_375105 ?auto_375106 ?auto_375107 ?auto_375108 ?auto_375109 ?auto_375110 ?auto_375111 ?auto_375112 ?auto_375113 ?auto_375114 ?auto_375115 ?auto_375116 ?auto_375117 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375162 - BLOCK
      ?auto_375163 - BLOCK
      ?auto_375164 - BLOCK
      ?auto_375165 - BLOCK
      ?auto_375166 - BLOCK
      ?auto_375167 - BLOCK
      ?auto_375168 - BLOCK
      ?auto_375169 - BLOCK
      ?auto_375170 - BLOCK
      ?auto_375171 - BLOCK
      ?auto_375172 - BLOCK
      ?auto_375173 - BLOCK
      ?auto_375174 - BLOCK
      ?auto_375175 - BLOCK
    )
    :vars
    (
      ?auto_375176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375175 ?auto_375176 ) ( ON-TABLE ?auto_375162 ) ( ON ?auto_375163 ?auto_375162 ) ( not ( = ?auto_375162 ?auto_375163 ) ) ( not ( = ?auto_375162 ?auto_375164 ) ) ( not ( = ?auto_375162 ?auto_375165 ) ) ( not ( = ?auto_375162 ?auto_375166 ) ) ( not ( = ?auto_375162 ?auto_375167 ) ) ( not ( = ?auto_375162 ?auto_375168 ) ) ( not ( = ?auto_375162 ?auto_375169 ) ) ( not ( = ?auto_375162 ?auto_375170 ) ) ( not ( = ?auto_375162 ?auto_375171 ) ) ( not ( = ?auto_375162 ?auto_375172 ) ) ( not ( = ?auto_375162 ?auto_375173 ) ) ( not ( = ?auto_375162 ?auto_375174 ) ) ( not ( = ?auto_375162 ?auto_375175 ) ) ( not ( = ?auto_375162 ?auto_375176 ) ) ( not ( = ?auto_375163 ?auto_375164 ) ) ( not ( = ?auto_375163 ?auto_375165 ) ) ( not ( = ?auto_375163 ?auto_375166 ) ) ( not ( = ?auto_375163 ?auto_375167 ) ) ( not ( = ?auto_375163 ?auto_375168 ) ) ( not ( = ?auto_375163 ?auto_375169 ) ) ( not ( = ?auto_375163 ?auto_375170 ) ) ( not ( = ?auto_375163 ?auto_375171 ) ) ( not ( = ?auto_375163 ?auto_375172 ) ) ( not ( = ?auto_375163 ?auto_375173 ) ) ( not ( = ?auto_375163 ?auto_375174 ) ) ( not ( = ?auto_375163 ?auto_375175 ) ) ( not ( = ?auto_375163 ?auto_375176 ) ) ( not ( = ?auto_375164 ?auto_375165 ) ) ( not ( = ?auto_375164 ?auto_375166 ) ) ( not ( = ?auto_375164 ?auto_375167 ) ) ( not ( = ?auto_375164 ?auto_375168 ) ) ( not ( = ?auto_375164 ?auto_375169 ) ) ( not ( = ?auto_375164 ?auto_375170 ) ) ( not ( = ?auto_375164 ?auto_375171 ) ) ( not ( = ?auto_375164 ?auto_375172 ) ) ( not ( = ?auto_375164 ?auto_375173 ) ) ( not ( = ?auto_375164 ?auto_375174 ) ) ( not ( = ?auto_375164 ?auto_375175 ) ) ( not ( = ?auto_375164 ?auto_375176 ) ) ( not ( = ?auto_375165 ?auto_375166 ) ) ( not ( = ?auto_375165 ?auto_375167 ) ) ( not ( = ?auto_375165 ?auto_375168 ) ) ( not ( = ?auto_375165 ?auto_375169 ) ) ( not ( = ?auto_375165 ?auto_375170 ) ) ( not ( = ?auto_375165 ?auto_375171 ) ) ( not ( = ?auto_375165 ?auto_375172 ) ) ( not ( = ?auto_375165 ?auto_375173 ) ) ( not ( = ?auto_375165 ?auto_375174 ) ) ( not ( = ?auto_375165 ?auto_375175 ) ) ( not ( = ?auto_375165 ?auto_375176 ) ) ( not ( = ?auto_375166 ?auto_375167 ) ) ( not ( = ?auto_375166 ?auto_375168 ) ) ( not ( = ?auto_375166 ?auto_375169 ) ) ( not ( = ?auto_375166 ?auto_375170 ) ) ( not ( = ?auto_375166 ?auto_375171 ) ) ( not ( = ?auto_375166 ?auto_375172 ) ) ( not ( = ?auto_375166 ?auto_375173 ) ) ( not ( = ?auto_375166 ?auto_375174 ) ) ( not ( = ?auto_375166 ?auto_375175 ) ) ( not ( = ?auto_375166 ?auto_375176 ) ) ( not ( = ?auto_375167 ?auto_375168 ) ) ( not ( = ?auto_375167 ?auto_375169 ) ) ( not ( = ?auto_375167 ?auto_375170 ) ) ( not ( = ?auto_375167 ?auto_375171 ) ) ( not ( = ?auto_375167 ?auto_375172 ) ) ( not ( = ?auto_375167 ?auto_375173 ) ) ( not ( = ?auto_375167 ?auto_375174 ) ) ( not ( = ?auto_375167 ?auto_375175 ) ) ( not ( = ?auto_375167 ?auto_375176 ) ) ( not ( = ?auto_375168 ?auto_375169 ) ) ( not ( = ?auto_375168 ?auto_375170 ) ) ( not ( = ?auto_375168 ?auto_375171 ) ) ( not ( = ?auto_375168 ?auto_375172 ) ) ( not ( = ?auto_375168 ?auto_375173 ) ) ( not ( = ?auto_375168 ?auto_375174 ) ) ( not ( = ?auto_375168 ?auto_375175 ) ) ( not ( = ?auto_375168 ?auto_375176 ) ) ( not ( = ?auto_375169 ?auto_375170 ) ) ( not ( = ?auto_375169 ?auto_375171 ) ) ( not ( = ?auto_375169 ?auto_375172 ) ) ( not ( = ?auto_375169 ?auto_375173 ) ) ( not ( = ?auto_375169 ?auto_375174 ) ) ( not ( = ?auto_375169 ?auto_375175 ) ) ( not ( = ?auto_375169 ?auto_375176 ) ) ( not ( = ?auto_375170 ?auto_375171 ) ) ( not ( = ?auto_375170 ?auto_375172 ) ) ( not ( = ?auto_375170 ?auto_375173 ) ) ( not ( = ?auto_375170 ?auto_375174 ) ) ( not ( = ?auto_375170 ?auto_375175 ) ) ( not ( = ?auto_375170 ?auto_375176 ) ) ( not ( = ?auto_375171 ?auto_375172 ) ) ( not ( = ?auto_375171 ?auto_375173 ) ) ( not ( = ?auto_375171 ?auto_375174 ) ) ( not ( = ?auto_375171 ?auto_375175 ) ) ( not ( = ?auto_375171 ?auto_375176 ) ) ( not ( = ?auto_375172 ?auto_375173 ) ) ( not ( = ?auto_375172 ?auto_375174 ) ) ( not ( = ?auto_375172 ?auto_375175 ) ) ( not ( = ?auto_375172 ?auto_375176 ) ) ( not ( = ?auto_375173 ?auto_375174 ) ) ( not ( = ?auto_375173 ?auto_375175 ) ) ( not ( = ?auto_375173 ?auto_375176 ) ) ( not ( = ?auto_375174 ?auto_375175 ) ) ( not ( = ?auto_375174 ?auto_375176 ) ) ( not ( = ?auto_375175 ?auto_375176 ) ) ( ON ?auto_375174 ?auto_375175 ) ( ON ?auto_375173 ?auto_375174 ) ( ON ?auto_375172 ?auto_375173 ) ( ON ?auto_375171 ?auto_375172 ) ( ON ?auto_375170 ?auto_375171 ) ( ON ?auto_375169 ?auto_375170 ) ( ON ?auto_375168 ?auto_375169 ) ( ON ?auto_375167 ?auto_375168 ) ( ON ?auto_375166 ?auto_375167 ) ( ON ?auto_375165 ?auto_375166 ) ( CLEAR ?auto_375163 ) ( ON ?auto_375164 ?auto_375165 ) ( CLEAR ?auto_375164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_375162 ?auto_375163 ?auto_375164 )
      ( MAKE-14PILE ?auto_375162 ?auto_375163 ?auto_375164 ?auto_375165 ?auto_375166 ?auto_375167 ?auto_375168 ?auto_375169 ?auto_375170 ?auto_375171 ?auto_375172 ?auto_375173 ?auto_375174 ?auto_375175 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375220 - BLOCK
      ?auto_375221 - BLOCK
      ?auto_375222 - BLOCK
      ?auto_375223 - BLOCK
      ?auto_375224 - BLOCK
      ?auto_375225 - BLOCK
      ?auto_375226 - BLOCK
      ?auto_375227 - BLOCK
      ?auto_375228 - BLOCK
      ?auto_375229 - BLOCK
      ?auto_375230 - BLOCK
      ?auto_375231 - BLOCK
      ?auto_375232 - BLOCK
      ?auto_375233 - BLOCK
    )
    :vars
    (
      ?auto_375234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375233 ?auto_375234 ) ( ON-TABLE ?auto_375220 ) ( not ( = ?auto_375220 ?auto_375221 ) ) ( not ( = ?auto_375220 ?auto_375222 ) ) ( not ( = ?auto_375220 ?auto_375223 ) ) ( not ( = ?auto_375220 ?auto_375224 ) ) ( not ( = ?auto_375220 ?auto_375225 ) ) ( not ( = ?auto_375220 ?auto_375226 ) ) ( not ( = ?auto_375220 ?auto_375227 ) ) ( not ( = ?auto_375220 ?auto_375228 ) ) ( not ( = ?auto_375220 ?auto_375229 ) ) ( not ( = ?auto_375220 ?auto_375230 ) ) ( not ( = ?auto_375220 ?auto_375231 ) ) ( not ( = ?auto_375220 ?auto_375232 ) ) ( not ( = ?auto_375220 ?auto_375233 ) ) ( not ( = ?auto_375220 ?auto_375234 ) ) ( not ( = ?auto_375221 ?auto_375222 ) ) ( not ( = ?auto_375221 ?auto_375223 ) ) ( not ( = ?auto_375221 ?auto_375224 ) ) ( not ( = ?auto_375221 ?auto_375225 ) ) ( not ( = ?auto_375221 ?auto_375226 ) ) ( not ( = ?auto_375221 ?auto_375227 ) ) ( not ( = ?auto_375221 ?auto_375228 ) ) ( not ( = ?auto_375221 ?auto_375229 ) ) ( not ( = ?auto_375221 ?auto_375230 ) ) ( not ( = ?auto_375221 ?auto_375231 ) ) ( not ( = ?auto_375221 ?auto_375232 ) ) ( not ( = ?auto_375221 ?auto_375233 ) ) ( not ( = ?auto_375221 ?auto_375234 ) ) ( not ( = ?auto_375222 ?auto_375223 ) ) ( not ( = ?auto_375222 ?auto_375224 ) ) ( not ( = ?auto_375222 ?auto_375225 ) ) ( not ( = ?auto_375222 ?auto_375226 ) ) ( not ( = ?auto_375222 ?auto_375227 ) ) ( not ( = ?auto_375222 ?auto_375228 ) ) ( not ( = ?auto_375222 ?auto_375229 ) ) ( not ( = ?auto_375222 ?auto_375230 ) ) ( not ( = ?auto_375222 ?auto_375231 ) ) ( not ( = ?auto_375222 ?auto_375232 ) ) ( not ( = ?auto_375222 ?auto_375233 ) ) ( not ( = ?auto_375222 ?auto_375234 ) ) ( not ( = ?auto_375223 ?auto_375224 ) ) ( not ( = ?auto_375223 ?auto_375225 ) ) ( not ( = ?auto_375223 ?auto_375226 ) ) ( not ( = ?auto_375223 ?auto_375227 ) ) ( not ( = ?auto_375223 ?auto_375228 ) ) ( not ( = ?auto_375223 ?auto_375229 ) ) ( not ( = ?auto_375223 ?auto_375230 ) ) ( not ( = ?auto_375223 ?auto_375231 ) ) ( not ( = ?auto_375223 ?auto_375232 ) ) ( not ( = ?auto_375223 ?auto_375233 ) ) ( not ( = ?auto_375223 ?auto_375234 ) ) ( not ( = ?auto_375224 ?auto_375225 ) ) ( not ( = ?auto_375224 ?auto_375226 ) ) ( not ( = ?auto_375224 ?auto_375227 ) ) ( not ( = ?auto_375224 ?auto_375228 ) ) ( not ( = ?auto_375224 ?auto_375229 ) ) ( not ( = ?auto_375224 ?auto_375230 ) ) ( not ( = ?auto_375224 ?auto_375231 ) ) ( not ( = ?auto_375224 ?auto_375232 ) ) ( not ( = ?auto_375224 ?auto_375233 ) ) ( not ( = ?auto_375224 ?auto_375234 ) ) ( not ( = ?auto_375225 ?auto_375226 ) ) ( not ( = ?auto_375225 ?auto_375227 ) ) ( not ( = ?auto_375225 ?auto_375228 ) ) ( not ( = ?auto_375225 ?auto_375229 ) ) ( not ( = ?auto_375225 ?auto_375230 ) ) ( not ( = ?auto_375225 ?auto_375231 ) ) ( not ( = ?auto_375225 ?auto_375232 ) ) ( not ( = ?auto_375225 ?auto_375233 ) ) ( not ( = ?auto_375225 ?auto_375234 ) ) ( not ( = ?auto_375226 ?auto_375227 ) ) ( not ( = ?auto_375226 ?auto_375228 ) ) ( not ( = ?auto_375226 ?auto_375229 ) ) ( not ( = ?auto_375226 ?auto_375230 ) ) ( not ( = ?auto_375226 ?auto_375231 ) ) ( not ( = ?auto_375226 ?auto_375232 ) ) ( not ( = ?auto_375226 ?auto_375233 ) ) ( not ( = ?auto_375226 ?auto_375234 ) ) ( not ( = ?auto_375227 ?auto_375228 ) ) ( not ( = ?auto_375227 ?auto_375229 ) ) ( not ( = ?auto_375227 ?auto_375230 ) ) ( not ( = ?auto_375227 ?auto_375231 ) ) ( not ( = ?auto_375227 ?auto_375232 ) ) ( not ( = ?auto_375227 ?auto_375233 ) ) ( not ( = ?auto_375227 ?auto_375234 ) ) ( not ( = ?auto_375228 ?auto_375229 ) ) ( not ( = ?auto_375228 ?auto_375230 ) ) ( not ( = ?auto_375228 ?auto_375231 ) ) ( not ( = ?auto_375228 ?auto_375232 ) ) ( not ( = ?auto_375228 ?auto_375233 ) ) ( not ( = ?auto_375228 ?auto_375234 ) ) ( not ( = ?auto_375229 ?auto_375230 ) ) ( not ( = ?auto_375229 ?auto_375231 ) ) ( not ( = ?auto_375229 ?auto_375232 ) ) ( not ( = ?auto_375229 ?auto_375233 ) ) ( not ( = ?auto_375229 ?auto_375234 ) ) ( not ( = ?auto_375230 ?auto_375231 ) ) ( not ( = ?auto_375230 ?auto_375232 ) ) ( not ( = ?auto_375230 ?auto_375233 ) ) ( not ( = ?auto_375230 ?auto_375234 ) ) ( not ( = ?auto_375231 ?auto_375232 ) ) ( not ( = ?auto_375231 ?auto_375233 ) ) ( not ( = ?auto_375231 ?auto_375234 ) ) ( not ( = ?auto_375232 ?auto_375233 ) ) ( not ( = ?auto_375232 ?auto_375234 ) ) ( not ( = ?auto_375233 ?auto_375234 ) ) ( ON ?auto_375232 ?auto_375233 ) ( ON ?auto_375231 ?auto_375232 ) ( ON ?auto_375230 ?auto_375231 ) ( ON ?auto_375229 ?auto_375230 ) ( ON ?auto_375228 ?auto_375229 ) ( ON ?auto_375227 ?auto_375228 ) ( ON ?auto_375226 ?auto_375227 ) ( ON ?auto_375225 ?auto_375226 ) ( ON ?auto_375224 ?auto_375225 ) ( ON ?auto_375223 ?auto_375224 ) ( ON ?auto_375222 ?auto_375223 ) ( CLEAR ?auto_375220 ) ( ON ?auto_375221 ?auto_375222 ) ( CLEAR ?auto_375221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_375220 ?auto_375221 )
      ( MAKE-14PILE ?auto_375220 ?auto_375221 ?auto_375222 ?auto_375223 ?auto_375224 ?auto_375225 ?auto_375226 ?auto_375227 ?auto_375228 ?auto_375229 ?auto_375230 ?auto_375231 ?auto_375232 ?auto_375233 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375278 - BLOCK
      ?auto_375279 - BLOCK
      ?auto_375280 - BLOCK
      ?auto_375281 - BLOCK
      ?auto_375282 - BLOCK
      ?auto_375283 - BLOCK
      ?auto_375284 - BLOCK
      ?auto_375285 - BLOCK
      ?auto_375286 - BLOCK
      ?auto_375287 - BLOCK
      ?auto_375288 - BLOCK
      ?auto_375289 - BLOCK
      ?auto_375290 - BLOCK
      ?auto_375291 - BLOCK
    )
    :vars
    (
      ?auto_375292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375291 ?auto_375292 ) ( not ( = ?auto_375278 ?auto_375279 ) ) ( not ( = ?auto_375278 ?auto_375280 ) ) ( not ( = ?auto_375278 ?auto_375281 ) ) ( not ( = ?auto_375278 ?auto_375282 ) ) ( not ( = ?auto_375278 ?auto_375283 ) ) ( not ( = ?auto_375278 ?auto_375284 ) ) ( not ( = ?auto_375278 ?auto_375285 ) ) ( not ( = ?auto_375278 ?auto_375286 ) ) ( not ( = ?auto_375278 ?auto_375287 ) ) ( not ( = ?auto_375278 ?auto_375288 ) ) ( not ( = ?auto_375278 ?auto_375289 ) ) ( not ( = ?auto_375278 ?auto_375290 ) ) ( not ( = ?auto_375278 ?auto_375291 ) ) ( not ( = ?auto_375278 ?auto_375292 ) ) ( not ( = ?auto_375279 ?auto_375280 ) ) ( not ( = ?auto_375279 ?auto_375281 ) ) ( not ( = ?auto_375279 ?auto_375282 ) ) ( not ( = ?auto_375279 ?auto_375283 ) ) ( not ( = ?auto_375279 ?auto_375284 ) ) ( not ( = ?auto_375279 ?auto_375285 ) ) ( not ( = ?auto_375279 ?auto_375286 ) ) ( not ( = ?auto_375279 ?auto_375287 ) ) ( not ( = ?auto_375279 ?auto_375288 ) ) ( not ( = ?auto_375279 ?auto_375289 ) ) ( not ( = ?auto_375279 ?auto_375290 ) ) ( not ( = ?auto_375279 ?auto_375291 ) ) ( not ( = ?auto_375279 ?auto_375292 ) ) ( not ( = ?auto_375280 ?auto_375281 ) ) ( not ( = ?auto_375280 ?auto_375282 ) ) ( not ( = ?auto_375280 ?auto_375283 ) ) ( not ( = ?auto_375280 ?auto_375284 ) ) ( not ( = ?auto_375280 ?auto_375285 ) ) ( not ( = ?auto_375280 ?auto_375286 ) ) ( not ( = ?auto_375280 ?auto_375287 ) ) ( not ( = ?auto_375280 ?auto_375288 ) ) ( not ( = ?auto_375280 ?auto_375289 ) ) ( not ( = ?auto_375280 ?auto_375290 ) ) ( not ( = ?auto_375280 ?auto_375291 ) ) ( not ( = ?auto_375280 ?auto_375292 ) ) ( not ( = ?auto_375281 ?auto_375282 ) ) ( not ( = ?auto_375281 ?auto_375283 ) ) ( not ( = ?auto_375281 ?auto_375284 ) ) ( not ( = ?auto_375281 ?auto_375285 ) ) ( not ( = ?auto_375281 ?auto_375286 ) ) ( not ( = ?auto_375281 ?auto_375287 ) ) ( not ( = ?auto_375281 ?auto_375288 ) ) ( not ( = ?auto_375281 ?auto_375289 ) ) ( not ( = ?auto_375281 ?auto_375290 ) ) ( not ( = ?auto_375281 ?auto_375291 ) ) ( not ( = ?auto_375281 ?auto_375292 ) ) ( not ( = ?auto_375282 ?auto_375283 ) ) ( not ( = ?auto_375282 ?auto_375284 ) ) ( not ( = ?auto_375282 ?auto_375285 ) ) ( not ( = ?auto_375282 ?auto_375286 ) ) ( not ( = ?auto_375282 ?auto_375287 ) ) ( not ( = ?auto_375282 ?auto_375288 ) ) ( not ( = ?auto_375282 ?auto_375289 ) ) ( not ( = ?auto_375282 ?auto_375290 ) ) ( not ( = ?auto_375282 ?auto_375291 ) ) ( not ( = ?auto_375282 ?auto_375292 ) ) ( not ( = ?auto_375283 ?auto_375284 ) ) ( not ( = ?auto_375283 ?auto_375285 ) ) ( not ( = ?auto_375283 ?auto_375286 ) ) ( not ( = ?auto_375283 ?auto_375287 ) ) ( not ( = ?auto_375283 ?auto_375288 ) ) ( not ( = ?auto_375283 ?auto_375289 ) ) ( not ( = ?auto_375283 ?auto_375290 ) ) ( not ( = ?auto_375283 ?auto_375291 ) ) ( not ( = ?auto_375283 ?auto_375292 ) ) ( not ( = ?auto_375284 ?auto_375285 ) ) ( not ( = ?auto_375284 ?auto_375286 ) ) ( not ( = ?auto_375284 ?auto_375287 ) ) ( not ( = ?auto_375284 ?auto_375288 ) ) ( not ( = ?auto_375284 ?auto_375289 ) ) ( not ( = ?auto_375284 ?auto_375290 ) ) ( not ( = ?auto_375284 ?auto_375291 ) ) ( not ( = ?auto_375284 ?auto_375292 ) ) ( not ( = ?auto_375285 ?auto_375286 ) ) ( not ( = ?auto_375285 ?auto_375287 ) ) ( not ( = ?auto_375285 ?auto_375288 ) ) ( not ( = ?auto_375285 ?auto_375289 ) ) ( not ( = ?auto_375285 ?auto_375290 ) ) ( not ( = ?auto_375285 ?auto_375291 ) ) ( not ( = ?auto_375285 ?auto_375292 ) ) ( not ( = ?auto_375286 ?auto_375287 ) ) ( not ( = ?auto_375286 ?auto_375288 ) ) ( not ( = ?auto_375286 ?auto_375289 ) ) ( not ( = ?auto_375286 ?auto_375290 ) ) ( not ( = ?auto_375286 ?auto_375291 ) ) ( not ( = ?auto_375286 ?auto_375292 ) ) ( not ( = ?auto_375287 ?auto_375288 ) ) ( not ( = ?auto_375287 ?auto_375289 ) ) ( not ( = ?auto_375287 ?auto_375290 ) ) ( not ( = ?auto_375287 ?auto_375291 ) ) ( not ( = ?auto_375287 ?auto_375292 ) ) ( not ( = ?auto_375288 ?auto_375289 ) ) ( not ( = ?auto_375288 ?auto_375290 ) ) ( not ( = ?auto_375288 ?auto_375291 ) ) ( not ( = ?auto_375288 ?auto_375292 ) ) ( not ( = ?auto_375289 ?auto_375290 ) ) ( not ( = ?auto_375289 ?auto_375291 ) ) ( not ( = ?auto_375289 ?auto_375292 ) ) ( not ( = ?auto_375290 ?auto_375291 ) ) ( not ( = ?auto_375290 ?auto_375292 ) ) ( not ( = ?auto_375291 ?auto_375292 ) ) ( ON ?auto_375290 ?auto_375291 ) ( ON ?auto_375289 ?auto_375290 ) ( ON ?auto_375288 ?auto_375289 ) ( ON ?auto_375287 ?auto_375288 ) ( ON ?auto_375286 ?auto_375287 ) ( ON ?auto_375285 ?auto_375286 ) ( ON ?auto_375284 ?auto_375285 ) ( ON ?auto_375283 ?auto_375284 ) ( ON ?auto_375282 ?auto_375283 ) ( ON ?auto_375281 ?auto_375282 ) ( ON ?auto_375280 ?auto_375281 ) ( ON ?auto_375279 ?auto_375280 ) ( ON ?auto_375278 ?auto_375279 ) ( CLEAR ?auto_375278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_375278 )
      ( MAKE-14PILE ?auto_375278 ?auto_375279 ?auto_375280 ?auto_375281 ?auto_375282 ?auto_375283 ?auto_375284 ?auto_375285 ?auto_375286 ?auto_375287 ?auto_375288 ?auto_375289 ?auto_375290 ?auto_375291 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375337 - BLOCK
      ?auto_375338 - BLOCK
      ?auto_375339 - BLOCK
      ?auto_375340 - BLOCK
      ?auto_375341 - BLOCK
      ?auto_375342 - BLOCK
      ?auto_375343 - BLOCK
      ?auto_375344 - BLOCK
      ?auto_375345 - BLOCK
      ?auto_375346 - BLOCK
      ?auto_375347 - BLOCK
      ?auto_375348 - BLOCK
      ?auto_375349 - BLOCK
      ?auto_375350 - BLOCK
      ?auto_375351 - BLOCK
    )
    :vars
    (
      ?auto_375352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_375350 ) ( ON ?auto_375351 ?auto_375352 ) ( CLEAR ?auto_375351 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_375337 ) ( ON ?auto_375338 ?auto_375337 ) ( ON ?auto_375339 ?auto_375338 ) ( ON ?auto_375340 ?auto_375339 ) ( ON ?auto_375341 ?auto_375340 ) ( ON ?auto_375342 ?auto_375341 ) ( ON ?auto_375343 ?auto_375342 ) ( ON ?auto_375344 ?auto_375343 ) ( ON ?auto_375345 ?auto_375344 ) ( ON ?auto_375346 ?auto_375345 ) ( ON ?auto_375347 ?auto_375346 ) ( ON ?auto_375348 ?auto_375347 ) ( ON ?auto_375349 ?auto_375348 ) ( ON ?auto_375350 ?auto_375349 ) ( not ( = ?auto_375337 ?auto_375338 ) ) ( not ( = ?auto_375337 ?auto_375339 ) ) ( not ( = ?auto_375337 ?auto_375340 ) ) ( not ( = ?auto_375337 ?auto_375341 ) ) ( not ( = ?auto_375337 ?auto_375342 ) ) ( not ( = ?auto_375337 ?auto_375343 ) ) ( not ( = ?auto_375337 ?auto_375344 ) ) ( not ( = ?auto_375337 ?auto_375345 ) ) ( not ( = ?auto_375337 ?auto_375346 ) ) ( not ( = ?auto_375337 ?auto_375347 ) ) ( not ( = ?auto_375337 ?auto_375348 ) ) ( not ( = ?auto_375337 ?auto_375349 ) ) ( not ( = ?auto_375337 ?auto_375350 ) ) ( not ( = ?auto_375337 ?auto_375351 ) ) ( not ( = ?auto_375337 ?auto_375352 ) ) ( not ( = ?auto_375338 ?auto_375339 ) ) ( not ( = ?auto_375338 ?auto_375340 ) ) ( not ( = ?auto_375338 ?auto_375341 ) ) ( not ( = ?auto_375338 ?auto_375342 ) ) ( not ( = ?auto_375338 ?auto_375343 ) ) ( not ( = ?auto_375338 ?auto_375344 ) ) ( not ( = ?auto_375338 ?auto_375345 ) ) ( not ( = ?auto_375338 ?auto_375346 ) ) ( not ( = ?auto_375338 ?auto_375347 ) ) ( not ( = ?auto_375338 ?auto_375348 ) ) ( not ( = ?auto_375338 ?auto_375349 ) ) ( not ( = ?auto_375338 ?auto_375350 ) ) ( not ( = ?auto_375338 ?auto_375351 ) ) ( not ( = ?auto_375338 ?auto_375352 ) ) ( not ( = ?auto_375339 ?auto_375340 ) ) ( not ( = ?auto_375339 ?auto_375341 ) ) ( not ( = ?auto_375339 ?auto_375342 ) ) ( not ( = ?auto_375339 ?auto_375343 ) ) ( not ( = ?auto_375339 ?auto_375344 ) ) ( not ( = ?auto_375339 ?auto_375345 ) ) ( not ( = ?auto_375339 ?auto_375346 ) ) ( not ( = ?auto_375339 ?auto_375347 ) ) ( not ( = ?auto_375339 ?auto_375348 ) ) ( not ( = ?auto_375339 ?auto_375349 ) ) ( not ( = ?auto_375339 ?auto_375350 ) ) ( not ( = ?auto_375339 ?auto_375351 ) ) ( not ( = ?auto_375339 ?auto_375352 ) ) ( not ( = ?auto_375340 ?auto_375341 ) ) ( not ( = ?auto_375340 ?auto_375342 ) ) ( not ( = ?auto_375340 ?auto_375343 ) ) ( not ( = ?auto_375340 ?auto_375344 ) ) ( not ( = ?auto_375340 ?auto_375345 ) ) ( not ( = ?auto_375340 ?auto_375346 ) ) ( not ( = ?auto_375340 ?auto_375347 ) ) ( not ( = ?auto_375340 ?auto_375348 ) ) ( not ( = ?auto_375340 ?auto_375349 ) ) ( not ( = ?auto_375340 ?auto_375350 ) ) ( not ( = ?auto_375340 ?auto_375351 ) ) ( not ( = ?auto_375340 ?auto_375352 ) ) ( not ( = ?auto_375341 ?auto_375342 ) ) ( not ( = ?auto_375341 ?auto_375343 ) ) ( not ( = ?auto_375341 ?auto_375344 ) ) ( not ( = ?auto_375341 ?auto_375345 ) ) ( not ( = ?auto_375341 ?auto_375346 ) ) ( not ( = ?auto_375341 ?auto_375347 ) ) ( not ( = ?auto_375341 ?auto_375348 ) ) ( not ( = ?auto_375341 ?auto_375349 ) ) ( not ( = ?auto_375341 ?auto_375350 ) ) ( not ( = ?auto_375341 ?auto_375351 ) ) ( not ( = ?auto_375341 ?auto_375352 ) ) ( not ( = ?auto_375342 ?auto_375343 ) ) ( not ( = ?auto_375342 ?auto_375344 ) ) ( not ( = ?auto_375342 ?auto_375345 ) ) ( not ( = ?auto_375342 ?auto_375346 ) ) ( not ( = ?auto_375342 ?auto_375347 ) ) ( not ( = ?auto_375342 ?auto_375348 ) ) ( not ( = ?auto_375342 ?auto_375349 ) ) ( not ( = ?auto_375342 ?auto_375350 ) ) ( not ( = ?auto_375342 ?auto_375351 ) ) ( not ( = ?auto_375342 ?auto_375352 ) ) ( not ( = ?auto_375343 ?auto_375344 ) ) ( not ( = ?auto_375343 ?auto_375345 ) ) ( not ( = ?auto_375343 ?auto_375346 ) ) ( not ( = ?auto_375343 ?auto_375347 ) ) ( not ( = ?auto_375343 ?auto_375348 ) ) ( not ( = ?auto_375343 ?auto_375349 ) ) ( not ( = ?auto_375343 ?auto_375350 ) ) ( not ( = ?auto_375343 ?auto_375351 ) ) ( not ( = ?auto_375343 ?auto_375352 ) ) ( not ( = ?auto_375344 ?auto_375345 ) ) ( not ( = ?auto_375344 ?auto_375346 ) ) ( not ( = ?auto_375344 ?auto_375347 ) ) ( not ( = ?auto_375344 ?auto_375348 ) ) ( not ( = ?auto_375344 ?auto_375349 ) ) ( not ( = ?auto_375344 ?auto_375350 ) ) ( not ( = ?auto_375344 ?auto_375351 ) ) ( not ( = ?auto_375344 ?auto_375352 ) ) ( not ( = ?auto_375345 ?auto_375346 ) ) ( not ( = ?auto_375345 ?auto_375347 ) ) ( not ( = ?auto_375345 ?auto_375348 ) ) ( not ( = ?auto_375345 ?auto_375349 ) ) ( not ( = ?auto_375345 ?auto_375350 ) ) ( not ( = ?auto_375345 ?auto_375351 ) ) ( not ( = ?auto_375345 ?auto_375352 ) ) ( not ( = ?auto_375346 ?auto_375347 ) ) ( not ( = ?auto_375346 ?auto_375348 ) ) ( not ( = ?auto_375346 ?auto_375349 ) ) ( not ( = ?auto_375346 ?auto_375350 ) ) ( not ( = ?auto_375346 ?auto_375351 ) ) ( not ( = ?auto_375346 ?auto_375352 ) ) ( not ( = ?auto_375347 ?auto_375348 ) ) ( not ( = ?auto_375347 ?auto_375349 ) ) ( not ( = ?auto_375347 ?auto_375350 ) ) ( not ( = ?auto_375347 ?auto_375351 ) ) ( not ( = ?auto_375347 ?auto_375352 ) ) ( not ( = ?auto_375348 ?auto_375349 ) ) ( not ( = ?auto_375348 ?auto_375350 ) ) ( not ( = ?auto_375348 ?auto_375351 ) ) ( not ( = ?auto_375348 ?auto_375352 ) ) ( not ( = ?auto_375349 ?auto_375350 ) ) ( not ( = ?auto_375349 ?auto_375351 ) ) ( not ( = ?auto_375349 ?auto_375352 ) ) ( not ( = ?auto_375350 ?auto_375351 ) ) ( not ( = ?auto_375350 ?auto_375352 ) ) ( not ( = ?auto_375351 ?auto_375352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_375351 ?auto_375352 )
      ( !STACK ?auto_375351 ?auto_375350 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375368 - BLOCK
      ?auto_375369 - BLOCK
      ?auto_375370 - BLOCK
      ?auto_375371 - BLOCK
      ?auto_375372 - BLOCK
      ?auto_375373 - BLOCK
      ?auto_375374 - BLOCK
      ?auto_375375 - BLOCK
      ?auto_375376 - BLOCK
      ?auto_375377 - BLOCK
      ?auto_375378 - BLOCK
      ?auto_375379 - BLOCK
      ?auto_375380 - BLOCK
      ?auto_375381 - BLOCK
      ?auto_375382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_375381 ) ( ON-TABLE ?auto_375382 ) ( CLEAR ?auto_375382 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_375368 ) ( ON ?auto_375369 ?auto_375368 ) ( ON ?auto_375370 ?auto_375369 ) ( ON ?auto_375371 ?auto_375370 ) ( ON ?auto_375372 ?auto_375371 ) ( ON ?auto_375373 ?auto_375372 ) ( ON ?auto_375374 ?auto_375373 ) ( ON ?auto_375375 ?auto_375374 ) ( ON ?auto_375376 ?auto_375375 ) ( ON ?auto_375377 ?auto_375376 ) ( ON ?auto_375378 ?auto_375377 ) ( ON ?auto_375379 ?auto_375378 ) ( ON ?auto_375380 ?auto_375379 ) ( ON ?auto_375381 ?auto_375380 ) ( not ( = ?auto_375368 ?auto_375369 ) ) ( not ( = ?auto_375368 ?auto_375370 ) ) ( not ( = ?auto_375368 ?auto_375371 ) ) ( not ( = ?auto_375368 ?auto_375372 ) ) ( not ( = ?auto_375368 ?auto_375373 ) ) ( not ( = ?auto_375368 ?auto_375374 ) ) ( not ( = ?auto_375368 ?auto_375375 ) ) ( not ( = ?auto_375368 ?auto_375376 ) ) ( not ( = ?auto_375368 ?auto_375377 ) ) ( not ( = ?auto_375368 ?auto_375378 ) ) ( not ( = ?auto_375368 ?auto_375379 ) ) ( not ( = ?auto_375368 ?auto_375380 ) ) ( not ( = ?auto_375368 ?auto_375381 ) ) ( not ( = ?auto_375368 ?auto_375382 ) ) ( not ( = ?auto_375369 ?auto_375370 ) ) ( not ( = ?auto_375369 ?auto_375371 ) ) ( not ( = ?auto_375369 ?auto_375372 ) ) ( not ( = ?auto_375369 ?auto_375373 ) ) ( not ( = ?auto_375369 ?auto_375374 ) ) ( not ( = ?auto_375369 ?auto_375375 ) ) ( not ( = ?auto_375369 ?auto_375376 ) ) ( not ( = ?auto_375369 ?auto_375377 ) ) ( not ( = ?auto_375369 ?auto_375378 ) ) ( not ( = ?auto_375369 ?auto_375379 ) ) ( not ( = ?auto_375369 ?auto_375380 ) ) ( not ( = ?auto_375369 ?auto_375381 ) ) ( not ( = ?auto_375369 ?auto_375382 ) ) ( not ( = ?auto_375370 ?auto_375371 ) ) ( not ( = ?auto_375370 ?auto_375372 ) ) ( not ( = ?auto_375370 ?auto_375373 ) ) ( not ( = ?auto_375370 ?auto_375374 ) ) ( not ( = ?auto_375370 ?auto_375375 ) ) ( not ( = ?auto_375370 ?auto_375376 ) ) ( not ( = ?auto_375370 ?auto_375377 ) ) ( not ( = ?auto_375370 ?auto_375378 ) ) ( not ( = ?auto_375370 ?auto_375379 ) ) ( not ( = ?auto_375370 ?auto_375380 ) ) ( not ( = ?auto_375370 ?auto_375381 ) ) ( not ( = ?auto_375370 ?auto_375382 ) ) ( not ( = ?auto_375371 ?auto_375372 ) ) ( not ( = ?auto_375371 ?auto_375373 ) ) ( not ( = ?auto_375371 ?auto_375374 ) ) ( not ( = ?auto_375371 ?auto_375375 ) ) ( not ( = ?auto_375371 ?auto_375376 ) ) ( not ( = ?auto_375371 ?auto_375377 ) ) ( not ( = ?auto_375371 ?auto_375378 ) ) ( not ( = ?auto_375371 ?auto_375379 ) ) ( not ( = ?auto_375371 ?auto_375380 ) ) ( not ( = ?auto_375371 ?auto_375381 ) ) ( not ( = ?auto_375371 ?auto_375382 ) ) ( not ( = ?auto_375372 ?auto_375373 ) ) ( not ( = ?auto_375372 ?auto_375374 ) ) ( not ( = ?auto_375372 ?auto_375375 ) ) ( not ( = ?auto_375372 ?auto_375376 ) ) ( not ( = ?auto_375372 ?auto_375377 ) ) ( not ( = ?auto_375372 ?auto_375378 ) ) ( not ( = ?auto_375372 ?auto_375379 ) ) ( not ( = ?auto_375372 ?auto_375380 ) ) ( not ( = ?auto_375372 ?auto_375381 ) ) ( not ( = ?auto_375372 ?auto_375382 ) ) ( not ( = ?auto_375373 ?auto_375374 ) ) ( not ( = ?auto_375373 ?auto_375375 ) ) ( not ( = ?auto_375373 ?auto_375376 ) ) ( not ( = ?auto_375373 ?auto_375377 ) ) ( not ( = ?auto_375373 ?auto_375378 ) ) ( not ( = ?auto_375373 ?auto_375379 ) ) ( not ( = ?auto_375373 ?auto_375380 ) ) ( not ( = ?auto_375373 ?auto_375381 ) ) ( not ( = ?auto_375373 ?auto_375382 ) ) ( not ( = ?auto_375374 ?auto_375375 ) ) ( not ( = ?auto_375374 ?auto_375376 ) ) ( not ( = ?auto_375374 ?auto_375377 ) ) ( not ( = ?auto_375374 ?auto_375378 ) ) ( not ( = ?auto_375374 ?auto_375379 ) ) ( not ( = ?auto_375374 ?auto_375380 ) ) ( not ( = ?auto_375374 ?auto_375381 ) ) ( not ( = ?auto_375374 ?auto_375382 ) ) ( not ( = ?auto_375375 ?auto_375376 ) ) ( not ( = ?auto_375375 ?auto_375377 ) ) ( not ( = ?auto_375375 ?auto_375378 ) ) ( not ( = ?auto_375375 ?auto_375379 ) ) ( not ( = ?auto_375375 ?auto_375380 ) ) ( not ( = ?auto_375375 ?auto_375381 ) ) ( not ( = ?auto_375375 ?auto_375382 ) ) ( not ( = ?auto_375376 ?auto_375377 ) ) ( not ( = ?auto_375376 ?auto_375378 ) ) ( not ( = ?auto_375376 ?auto_375379 ) ) ( not ( = ?auto_375376 ?auto_375380 ) ) ( not ( = ?auto_375376 ?auto_375381 ) ) ( not ( = ?auto_375376 ?auto_375382 ) ) ( not ( = ?auto_375377 ?auto_375378 ) ) ( not ( = ?auto_375377 ?auto_375379 ) ) ( not ( = ?auto_375377 ?auto_375380 ) ) ( not ( = ?auto_375377 ?auto_375381 ) ) ( not ( = ?auto_375377 ?auto_375382 ) ) ( not ( = ?auto_375378 ?auto_375379 ) ) ( not ( = ?auto_375378 ?auto_375380 ) ) ( not ( = ?auto_375378 ?auto_375381 ) ) ( not ( = ?auto_375378 ?auto_375382 ) ) ( not ( = ?auto_375379 ?auto_375380 ) ) ( not ( = ?auto_375379 ?auto_375381 ) ) ( not ( = ?auto_375379 ?auto_375382 ) ) ( not ( = ?auto_375380 ?auto_375381 ) ) ( not ( = ?auto_375380 ?auto_375382 ) ) ( not ( = ?auto_375381 ?auto_375382 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_375382 )
      ( !STACK ?auto_375382 ?auto_375381 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375398 - BLOCK
      ?auto_375399 - BLOCK
      ?auto_375400 - BLOCK
      ?auto_375401 - BLOCK
      ?auto_375402 - BLOCK
      ?auto_375403 - BLOCK
      ?auto_375404 - BLOCK
      ?auto_375405 - BLOCK
      ?auto_375406 - BLOCK
      ?auto_375407 - BLOCK
      ?auto_375408 - BLOCK
      ?auto_375409 - BLOCK
      ?auto_375410 - BLOCK
      ?auto_375411 - BLOCK
      ?auto_375412 - BLOCK
    )
    :vars
    (
      ?auto_375413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375412 ?auto_375413 ) ( ON-TABLE ?auto_375398 ) ( ON ?auto_375399 ?auto_375398 ) ( ON ?auto_375400 ?auto_375399 ) ( ON ?auto_375401 ?auto_375400 ) ( ON ?auto_375402 ?auto_375401 ) ( ON ?auto_375403 ?auto_375402 ) ( ON ?auto_375404 ?auto_375403 ) ( ON ?auto_375405 ?auto_375404 ) ( ON ?auto_375406 ?auto_375405 ) ( ON ?auto_375407 ?auto_375406 ) ( ON ?auto_375408 ?auto_375407 ) ( ON ?auto_375409 ?auto_375408 ) ( ON ?auto_375410 ?auto_375409 ) ( not ( = ?auto_375398 ?auto_375399 ) ) ( not ( = ?auto_375398 ?auto_375400 ) ) ( not ( = ?auto_375398 ?auto_375401 ) ) ( not ( = ?auto_375398 ?auto_375402 ) ) ( not ( = ?auto_375398 ?auto_375403 ) ) ( not ( = ?auto_375398 ?auto_375404 ) ) ( not ( = ?auto_375398 ?auto_375405 ) ) ( not ( = ?auto_375398 ?auto_375406 ) ) ( not ( = ?auto_375398 ?auto_375407 ) ) ( not ( = ?auto_375398 ?auto_375408 ) ) ( not ( = ?auto_375398 ?auto_375409 ) ) ( not ( = ?auto_375398 ?auto_375410 ) ) ( not ( = ?auto_375398 ?auto_375411 ) ) ( not ( = ?auto_375398 ?auto_375412 ) ) ( not ( = ?auto_375398 ?auto_375413 ) ) ( not ( = ?auto_375399 ?auto_375400 ) ) ( not ( = ?auto_375399 ?auto_375401 ) ) ( not ( = ?auto_375399 ?auto_375402 ) ) ( not ( = ?auto_375399 ?auto_375403 ) ) ( not ( = ?auto_375399 ?auto_375404 ) ) ( not ( = ?auto_375399 ?auto_375405 ) ) ( not ( = ?auto_375399 ?auto_375406 ) ) ( not ( = ?auto_375399 ?auto_375407 ) ) ( not ( = ?auto_375399 ?auto_375408 ) ) ( not ( = ?auto_375399 ?auto_375409 ) ) ( not ( = ?auto_375399 ?auto_375410 ) ) ( not ( = ?auto_375399 ?auto_375411 ) ) ( not ( = ?auto_375399 ?auto_375412 ) ) ( not ( = ?auto_375399 ?auto_375413 ) ) ( not ( = ?auto_375400 ?auto_375401 ) ) ( not ( = ?auto_375400 ?auto_375402 ) ) ( not ( = ?auto_375400 ?auto_375403 ) ) ( not ( = ?auto_375400 ?auto_375404 ) ) ( not ( = ?auto_375400 ?auto_375405 ) ) ( not ( = ?auto_375400 ?auto_375406 ) ) ( not ( = ?auto_375400 ?auto_375407 ) ) ( not ( = ?auto_375400 ?auto_375408 ) ) ( not ( = ?auto_375400 ?auto_375409 ) ) ( not ( = ?auto_375400 ?auto_375410 ) ) ( not ( = ?auto_375400 ?auto_375411 ) ) ( not ( = ?auto_375400 ?auto_375412 ) ) ( not ( = ?auto_375400 ?auto_375413 ) ) ( not ( = ?auto_375401 ?auto_375402 ) ) ( not ( = ?auto_375401 ?auto_375403 ) ) ( not ( = ?auto_375401 ?auto_375404 ) ) ( not ( = ?auto_375401 ?auto_375405 ) ) ( not ( = ?auto_375401 ?auto_375406 ) ) ( not ( = ?auto_375401 ?auto_375407 ) ) ( not ( = ?auto_375401 ?auto_375408 ) ) ( not ( = ?auto_375401 ?auto_375409 ) ) ( not ( = ?auto_375401 ?auto_375410 ) ) ( not ( = ?auto_375401 ?auto_375411 ) ) ( not ( = ?auto_375401 ?auto_375412 ) ) ( not ( = ?auto_375401 ?auto_375413 ) ) ( not ( = ?auto_375402 ?auto_375403 ) ) ( not ( = ?auto_375402 ?auto_375404 ) ) ( not ( = ?auto_375402 ?auto_375405 ) ) ( not ( = ?auto_375402 ?auto_375406 ) ) ( not ( = ?auto_375402 ?auto_375407 ) ) ( not ( = ?auto_375402 ?auto_375408 ) ) ( not ( = ?auto_375402 ?auto_375409 ) ) ( not ( = ?auto_375402 ?auto_375410 ) ) ( not ( = ?auto_375402 ?auto_375411 ) ) ( not ( = ?auto_375402 ?auto_375412 ) ) ( not ( = ?auto_375402 ?auto_375413 ) ) ( not ( = ?auto_375403 ?auto_375404 ) ) ( not ( = ?auto_375403 ?auto_375405 ) ) ( not ( = ?auto_375403 ?auto_375406 ) ) ( not ( = ?auto_375403 ?auto_375407 ) ) ( not ( = ?auto_375403 ?auto_375408 ) ) ( not ( = ?auto_375403 ?auto_375409 ) ) ( not ( = ?auto_375403 ?auto_375410 ) ) ( not ( = ?auto_375403 ?auto_375411 ) ) ( not ( = ?auto_375403 ?auto_375412 ) ) ( not ( = ?auto_375403 ?auto_375413 ) ) ( not ( = ?auto_375404 ?auto_375405 ) ) ( not ( = ?auto_375404 ?auto_375406 ) ) ( not ( = ?auto_375404 ?auto_375407 ) ) ( not ( = ?auto_375404 ?auto_375408 ) ) ( not ( = ?auto_375404 ?auto_375409 ) ) ( not ( = ?auto_375404 ?auto_375410 ) ) ( not ( = ?auto_375404 ?auto_375411 ) ) ( not ( = ?auto_375404 ?auto_375412 ) ) ( not ( = ?auto_375404 ?auto_375413 ) ) ( not ( = ?auto_375405 ?auto_375406 ) ) ( not ( = ?auto_375405 ?auto_375407 ) ) ( not ( = ?auto_375405 ?auto_375408 ) ) ( not ( = ?auto_375405 ?auto_375409 ) ) ( not ( = ?auto_375405 ?auto_375410 ) ) ( not ( = ?auto_375405 ?auto_375411 ) ) ( not ( = ?auto_375405 ?auto_375412 ) ) ( not ( = ?auto_375405 ?auto_375413 ) ) ( not ( = ?auto_375406 ?auto_375407 ) ) ( not ( = ?auto_375406 ?auto_375408 ) ) ( not ( = ?auto_375406 ?auto_375409 ) ) ( not ( = ?auto_375406 ?auto_375410 ) ) ( not ( = ?auto_375406 ?auto_375411 ) ) ( not ( = ?auto_375406 ?auto_375412 ) ) ( not ( = ?auto_375406 ?auto_375413 ) ) ( not ( = ?auto_375407 ?auto_375408 ) ) ( not ( = ?auto_375407 ?auto_375409 ) ) ( not ( = ?auto_375407 ?auto_375410 ) ) ( not ( = ?auto_375407 ?auto_375411 ) ) ( not ( = ?auto_375407 ?auto_375412 ) ) ( not ( = ?auto_375407 ?auto_375413 ) ) ( not ( = ?auto_375408 ?auto_375409 ) ) ( not ( = ?auto_375408 ?auto_375410 ) ) ( not ( = ?auto_375408 ?auto_375411 ) ) ( not ( = ?auto_375408 ?auto_375412 ) ) ( not ( = ?auto_375408 ?auto_375413 ) ) ( not ( = ?auto_375409 ?auto_375410 ) ) ( not ( = ?auto_375409 ?auto_375411 ) ) ( not ( = ?auto_375409 ?auto_375412 ) ) ( not ( = ?auto_375409 ?auto_375413 ) ) ( not ( = ?auto_375410 ?auto_375411 ) ) ( not ( = ?auto_375410 ?auto_375412 ) ) ( not ( = ?auto_375410 ?auto_375413 ) ) ( not ( = ?auto_375411 ?auto_375412 ) ) ( not ( = ?auto_375411 ?auto_375413 ) ) ( not ( = ?auto_375412 ?auto_375413 ) ) ( CLEAR ?auto_375410 ) ( ON ?auto_375411 ?auto_375412 ) ( CLEAR ?auto_375411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_375398 ?auto_375399 ?auto_375400 ?auto_375401 ?auto_375402 ?auto_375403 ?auto_375404 ?auto_375405 ?auto_375406 ?auto_375407 ?auto_375408 ?auto_375409 ?auto_375410 ?auto_375411 )
      ( MAKE-15PILE ?auto_375398 ?auto_375399 ?auto_375400 ?auto_375401 ?auto_375402 ?auto_375403 ?auto_375404 ?auto_375405 ?auto_375406 ?auto_375407 ?auto_375408 ?auto_375409 ?auto_375410 ?auto_375411 ?auto_375412 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375429 - BLOCK
      ?auto_375430 - BLOCK
      ?auto_375431 - BLOCK
      ?auto_375432 - BLOCK
      ?auto_375433 - BLOCK
      ?auto_375434 - BLOCK
      ?auto_375435 - BLOCK
      ?auto_375436 - BLOCK
      ?auto_375437 - BLOCK
      ?auto_375438 - BLOCK
      ?auto_375439 - BLOCK
      ?auto_375440 - BLOCK
      ?auto_375441 - BLOCK
      ?auto_375442 - BLOCK
      ?auto_375443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375443 ) ( ON-TABLE ?auto_375429 ) ( ON ?auto_375430 ?auto_375429 ) ( ON ?auto_375431 ?auto_375430 ) ( ON ?auto_375432 ?auto_375431 ) ( ON ?auto_375433 ?auto_375432 ) ( ON ?auto_375434 ?auto_375433 ) ( ON ?auto_375435 ?auto_375434 ) ( ON ?auto_375436 ?auto_375435 ) ( ON ?auto_375437 ?auto_375436 ) ( ON ?auto_375438 ?auto_375437 ) ( ON ?auto_375439 ?auto_375438 ) ( ON ?auto_375440 ?auto_375439 ) ( ON ?auto_375441 ?auto_375440 ) ( not ( = ?auto_375429 ?auto_375430 ) ) ( not ( = ?auto_375429 ?auto_375431 ) ) ( not ( = ?auto_375429 ?auto_375432 ) ) ( not ( = ?auto_375429 ?auto_375433 ) ) ( not ( = ?auto_375429 ?auto_375434 ) ) ( not ( = ?auto_375429 ?auto_375435 ) ) ( not ( = ?auto_375429 ?auto_375436 ) ) ( not ( = ?auto_375429 ?auto_375437 ) ) ( not ( = ?auto_375429 ?auto_375438 ) ) ( not ( = ?auto_375429 ?auto_375439 ) ) ( not ( = ?auto_375429 ?auto_375440 ) ) ( not ( = ?auto_375429 ?auto_375441 ) ) ( not ( = ?auto_375429 ?auto_375442 ) ) ( not ( = ?auto_375429 ?auto_375443 ) ) ( not ( = ?auto_375430 ?auto_375431 ) ) ( not ( = ?auto_375430 ?auto_375432 ) ) ( not ( = ?auto_375430 ?auto_375433 ) ) ( not ( = ?auto_375430 ?auto_375434 ) ) ( not ( = ?auto_375430 ?auto_375435 ) ) ( not ( = ?auto_375430 ?auto_375436 ) ) ( not ( = ?auto_375430 ?auto_375437 ) ) ( not ( = ?auto_375430 ?auto_375438 ) ) ( not ( = ?auto_375430 ?auto_375439 ) ) ( not ( = ?auto_375430 ?auto_375440 ) ) ( not ( = ?auto_375430 ?auto_375441 ) ) ( not ( = ?auto_375430 ?auto_375442 ) ) ( not ( = ?auto_375430 ?auto_375443 ) ) ( not ( = ?auto_375431 ?auto_375432 ) ) ( not ( = ?auto_375431 ?auto_375433 ) ) ( not ( = ?auto_375431 ?auto_375434 ) ) ( not ( = ?auto_375431 ?auto_375435 ) ) ( not ( = ?auto_375431 ?auto_375436 ) ) ( not ( = ?auto_375431 ?auto_375437 ) ) ( not ( = ?auto_375431 ?auto_375438 ) ) ( not ( = ?auto_375431 ?auto_375439 ) ) ( not ( = ?auto_375431 ?auto_375440 ) ) ( not ( = ?auto_375431 ?auto_375441 ) ) ( not ( = ?auto_375431 ?auto_375442 ) ) ( not ( = ?auto_375431 ?auto_375443 ) ) ( not ( = ?auto_375432 ?auto_375433 ) ) ( not ( = ?auto_375432 ?auto_375434 ) ) ( not ( = ?auto_375432 ?auto_375435 ) ) ( not ( = ?auto_375432 ?auto_375436 ) ) ( not ( = ?auto_375432 ?auto_375437 ) ) ( not ( = ?auto_375432 ?auto_375438 ) ) ( not ( = ?auto_375432 ?auto_375439 ) ) ( not ( = ?auto_375432 ?auto_375440 ) ) ( not ( = ?auto_375432 ?auto_375441 ) ) ( not ( = ?auto_375432 ?auto_375442 ) ) ( not ( = ?auto_375432 ?auto_375443 ) ) ( not ( = ?auto_375433 ?auto_375434 ) ) ( not ( = ?auto_375433 ?auto_375435 ) ) ( not ( = ?auto_375433 ?auto_375436 ) ) ( not ( = ?auto_375433 ?auto_375437 ) ) ( not ( = ?auto_375433 ?auto_375438 ) ) ( not ( = ?auto_375433 ?auto_375439 ) ) ( not ( = ?auto_375433 ?auto_375440 ) ) ( not ( = ?auto_375433 ?auto_375441 ) ) ( not ( = ?auto_375433 ?auto_375442 ) ) ( not ( = ?auto_375433 ?auto_375443 ) ) ( not ( = ?auto_375434 ?auto_375435 ) ) ( not ( = ?auto_375434 ?auto_375436 ) ) ( not ( = ?auto_375434 ?auto_375437 ) ) ( not ( = ?auto_375434 ?auto_375438 ) ) ( not ( = ?auto_375434 ?auto_375439 ) ) ( not ( = ?auto_375434 ?auto_375440 ) ) ( not ( = ?auto_375434 ?auto_375441 ) ) ( not ( = ?auto_375434 ?auto_375442 ) ) ( not ( = ?auto_375434 ?auto_375443 ) ) ( not ( = ?auto_375435 ?auto_375436 ) ) ( not ( = ?auto_375435 ?auto_375437 ) ) ( not ( = ?auto_375435 ?auto_375438 ) ) ( not ( = ?auto_375435 ?auto_375439 ) ) ( not ( = ?auto_375435 ?auto_375440 ) ) ( not ( = ?auto_375435 ?auto_375441 ) ) ( not ( = ?auto_375435 ?auto_375442 ) ) ( not ( = ?auto_375435 ?auto_375443 ) ) ( not ( = ?auto_375436 ?auto_375437 ) ) ( not ( = ?auto_375436 ?auto_375438 ) ) ( not ( = ?auto_375436 ?auto_375439 ) ) ( not ( = ?auto_375436 ?auto_375440 ) ) ( not ( = ?auto_375436 ?auto_375441 ) ) ( not ( = ?auto_375436 ?auto_375442 ) ) ( not ( = ?auto_375436 ?auto_375443 ) ) ( not ( = ?auto_375437 ?auto_375438 ) ) ( not ( = ?auto_375437 ?auto_375439 ) ) ( not ( = ?auto_375437 ?auto_375440 ) ) ( not ( = ?auto_375437 ?auto_375441 ) ) ( not ( = ?auto_375437 ?auto_375442 ) ) ( not ( = ?auto_375437 ?auto_375443 ) ) ( not ( = ?auto_375438 ?auto_375439 ) ) ( not ( = ?auto_375438 ?auto_375440 ) ) ( not ( = ?auto_375438 ?auto_375441 ) ) ( not ( = ?auto_375438 ?auto_375442 ) ) ( not ( = ?auto_375438 ?auto_375443 ) ) ( not ( = ?auto_375439 ?auto_375440 ) ) ( not ( = ?auto_375439 ?auto_375441 ) ) ( not ( = ?auto_375439 ?auto_375442 ) ) ( not ( = ?auto_375439 ?auto_375443 ) ) ( not ( = ?auto_375440 ?auto_375441 ) ) ( not ( = ?auto_375440 ?auto_375442 ) ) ( not ( = ?auto_375440 ?auto_375443 ) ) ( not ( = ?auto_375441 ?auto_375442 ) ) ( not ( = ?auto_375441 ?auto_375443 ) ) ( not ( = ?auto_375442 ?auto_375443 ) ) ( CLEAR ?auto_375441 ) ( ON ?auto_375442 ?auto_375443 ) ( CLEAR ?auto_375442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_375429 ?auto_375430 ?auto_375431 ?auto_375432 ?auto_375433 ?auto_375434 ?auto_375435 ?auto_375436 ?auto_375437 ?auto_375438 ?auto_375439 ?auto_375440 ?auto_375441 ?auto_375442 )
      ( MAKE-15PILE ?auto_375429 ?auto_375430 ?auto_375431 ?auto_375432 ?auto_375433 ?auto_375434 ?auto_375435 ?auto_375436 ?auto_375437 ?auto_375438 ?auto_375439 ?auto_375440 ?auto_375441 ?auto_375442 ?auto_375443 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375459 - BLOCK
      ?auto_375460 - BLOCK
      ?auto_375461 - BLOCK
      ?auto_375462 - BLOCK
      ?auto_375463 - BLOCK
      ?auto_375464 - BLOCK
      ?auto_375465 - BLOCK
      ?auto_375466 - BLOCK
      ?auto_375467 - BLOCK
      ?auto_375468 - BLOCK
      ?auto_375469 - BLOCK
      ?auto_375470 - BLOCK
      ?auto_375471 - BLOCK
      ?auto_375472 - BLOCK
      ?auto_375473 - BLOCK
    )
    :vars
    (
      ?auto_375474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375473 ?auto_375474 ) ( ON-TABLE ?auto_375459 ) ( ON ?auto_375460 ?auto_375459 ) ( ON ?auto_375461 ?auto_375460 ) ( ON ?auto_375462 ?auto_375461 ) ( ON ?auto_375463 ?auto_375462 ) ( ON ?auto_375464 ?auto_375463 ) ( ON ?auto_375465 ?auto_375464 ) ( ON ?auto_375466 ?auto_375465 ) ( ON ?auto_375467 ?auto_375466 ) ( ON ?auto_375468 ?auto_375467 ) ( ON ?auto_375469 ?auto_375468 ) ( ON ?auto_375470 ?auto_375469 ) ( not ( = ?auto_375459 ?auto_375460 ) ) ( not ( = ?auto_375459 ?auto_375461 ) ) ( not ( = ?auto_375459 ?auto_375462 ) ) ( not ( = ?auto_375459 ?auto_375463 ) ) ( not ( = ?auto_375459 ?auto_375464 ) ) ( not ( = ?auto_375459 ?auto_375465 ) ) ( not ( = ?auto_375459 ?auto_375466 ) ) ( not ( = ?auto_375459 ?auto_375467 ) ) ( not ( = ?auto_375459 ?auto_375468 ) ) ( not ( = ?auto_375459 ?auto_375469 ) ) ( not ( = ?auto_375459 ?auto_375470 ) ) ( not ( = ?auto_375459 ?auto_375471 ) ) ( not ( = ?auto_375459 ?auto_375472 ) ) ( not ( = ?auto_375459 ?auto_375473 ) ) ( not ( = ?auto_375459 ?auto_375474 ) ) ( not ( = ?auto_375460 ?auto_375461 ) ) ( not ( = ?auto_375460 ?auto_375462 ) ) ( not ( = ?auto_375460 ?auto_375463 ) ) ( not ( = ?auto_375460 ?auto_375464 ) ) ( not ( = ?auto_375460 ?auto_375465 ) ) ( not ( = ?auto_375460 ?auto_375466 ) ) ( not ( = ?auto_375460 ?auto_375467 ) ) ( not ( = ?auto_375460 ?auto_375468 ) ) ( not ( = ?auto_375460 ?auto_375469 ) ) ( not ( = ?auto_375460 ?auto_375470 ) ) ( not ( = ?auto_375460 ?auto_375471 ) ) ( not ( = ?auto_375460 ?auto_375472 ) ) ( not ( = ?auto_375460 ?auto_375473 ) ) ( not ( = ?auto_375460 ?auto_375474 ) ) ( not ( = ?auto_375461 ?auto_375462 ) ) ( not ( = ?auto_375461 ?auto_375463 ) ) ( not ( = ?auto_375461 ?auto_375464 ) ) ( not ( = ?auto_375461 ?auto_375465 ) ) ( not ( = ?auto_375461 ?auto_375466 ) ) ( not ( = ?auto_375461 ?auto_375467 ) ) ( not ( = ?auto_375461 ?auto_375468 ) ) ( not ( = ?auto_375461 ?auto_375469 ) ) ( not ( = ?auto_375461 ?auto_375470 ) ) ( not ( = ?auto_375461 ?auto_375471 ) ) ( not ( = ?auto_375461 ?auto_375472 ) ) ( not ( = ?auto_375461 ?auto_375473 ) ) ( not ( = ?auto_375461 ?auto_375474 ) ) ( not ( = ?auto_375462 ?auto_375463 ) ) ( not ( = ?auto_375462 ?auto_375464 ) ) ( not ( = ?auto_375462 ?auto_375465 ) ) ( not ( = ?auto_375462 ?auto_375466 ) ) ( not ( = ?auto_375462 ?auto_375467 ) ) ( not ( = ?auto_375462 ?auto_375468 ) ) ( not ( = ?auto_375462 ?auto_375469 ) ) ( not ( = ?auto_375462 ?auto_375470 ) ) ( not ( = ?auto_375462 ?auto_375471 ) ) ( not ( = ?auto_375462 ?auto_375472 ) ) ( not ( = ?auto_375462 ?auto_375473 ) ) ( not ( = ?auto_375462 ?auto_375474 ) ) ( not ( = ?auto_375463 ?auto_375464 ) ) ( not ( = ?auto_375463 ?auto_375465 ) ) ( not ( = ?auto_375463 ?auto_375466 ) ) ( not ( = ?auto_375463 ?auto_375467 ) ) ( not ( = ?auto_375463 ?auto_375468 ) ) ( not ( = ?auto_375463 ?auto_375469 ) ) ( not ( = ?auto_375463 ?auto_375470 ) ) ( not ( = ?auto_375463 ?auto_375471 ) ) ( not ( = ?auto_375463 ?auto_375472 ) ) ( not ( = ?auto_375463 ?auto_375473 ) ) ( not ( = ?auto_375463 ?auto_375474 ) ) ( not ( = ?auto_375464 ?auto_375465 ) ) ( not ( = ?auto_375464 ?auto_375466 ) ) ( not ( = ?auto_375464 ?auto_375467 ) ) ( not ( = ?auto_375464 ?auto_375468 ) ) ( not ( = ?auto_375464 ?auto_375469 ) ) ( not ( = ?auto_375464 ?auto_375470 ) ) ( not ( = ?auto_375464 ?auto_375471 ) ) ( not ( = ?auto_375464 ?auto_375472 ) ) ( not ( = ?auto_375464 ?auto_375473 ) ) ( not ( = ?auto_375464 ?auto_375474 ) ) ( not ( = ?auto_375465 ?auto_375466 ) ) ( not ( = ?auto_375465 ?auto_375467 ) ) ( not ( = ?auto_375465 ?auto_375468 ) ) ( not ( = ?auto_375465 ?auto_375469 ) ) ( not ( = ?auto_375465 ?auto_375470 ) ) ( not ( = ?auto_375465 ?auto_375471 ) ) ( not ( = ?auto_375465 ?auto_375472 ) ) ( not ( = ?auto_375465 ?auto_375473 ) ) ( not ( = ?auto_375465 ?auto_375474 ) ) ( not ( = ?auto_375466 ?auto_375467 ) ) ( not ( = ?auto_375466 ?auto_375468 ) ) ( not ( = ?auto_375466 ?auto_375469 ) ) ( not ( = ?auto_375466 ?auto_375470 ) ) ( not ( = ?auto_375466 ?auto_375471 ) ) ( not ( = ?auto_375466 ?auto_375472 ) ) ( not ( = ?auto_375466 ?auto_375473 ) ) ( not ( = ?auto_375466 ?auto_375474 ) ) ( not ( = ?auto_375467 ?auto_375468 ) ) ( not ( = ?auto_375467 ?auto_375469 ) ) ( not ( = ?auto_375467 ?auto_375470 ) ) ( not ( = ?auto_375467 ?auto_375471 ) ) ( not ( = ?auto_375467 ?auto_375472 ) ) ( not ( = ?auto_375467 ?auto_375473 ) ) ( not ( = ?auto_375467 ?auto_375474 ) ) ( not ( = ?auto_375468 ?auto_375469 ) ) ( not ( = ?auto_375468 ?auto_375470 ) ) ( not ( = ?auto_375468 ?auto_375471 ) ) ( not ( = ?auto_375468 ?auto_375472 ) ) ( not ( = ?auto_375468 ?auto_375473 ) ) ( not ( = ?auto_375468 ?auto_375474 ) ) ( not ( = ?auto_375469 ?auto_375470 ) ) ( not ( = ?auto_375469 ?auto_375471 ) ) ( not ( = ?auto_375469 ?auto_375472 ) ) ( not ( = ?auto_375469 ?auto_375473 ) ) ( not ( = ?auto_375469 ?auto_375474 ) ) ( not ( = ?auto_375470 ?auto_375471 ) ) ( not ( = ?auto_375470 ?auto_375472 ) ) ( not ( = ?auto_375470 ?auto_375473 ) ) ( not ( = ?auto_375470 ?auto_375474 ) ) ( not ( = ?auto_375471 ?auto_375472 ) ) ( not ( = ?auto_375471 ?auto_375473 ) ) ( not ( = ?auto_375471 ?auto_375474 ) ) ( not ( = ?auto_375472 ?auto_375473 ) ) ( not ( = ?auto_375472 ?auto_375474 ) ) ( not ( = ?auto_375473 ?auto_375474 ) ) ( ON ?auto_375472 ?auto_375473 ) ( CLEAR ?auto_375470 ) ( ON ?auto_375471 ?auto_375472 ) ( CLEAR ?auto_375471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_375459 ?auto_375460 ?auto_375461 ?auto_375462 ?auto_375463 ?auto_375464 ?auto_375465 ?auto_375466 ?auto_375467 ?auto_375468 ?auto_375469 ?auto_375470 ?auto_375471 )
      ( MAKE-15PILE ?auto_375459 ?auto_375460 ?auto_375461 ?auto_375462 ?auto_375463 ?auto_375464 ?auto_375465 ?auto_375466 ?auto_375467 ?auto_375468 ?auto_375469 ?auto_375470 ?auto_375471 ?auto_375472 ?auto_375473 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375490 - BLOCK
      ?auto_375491 - BLOCK
      ?auto_375492 - BLOCK
      ?auto_375493 - BLOCK
      ?auto_375494 - BLOCK
      ?auto_375495 - BLOCK
      ?auto_375496 - BLOCK
      ?auto_375497 - BLOCK
      ?auto_375498 - BLOCK
      ?auto_375499 - BLOCK
      ?auto_375500 - BLOCK
      ?auto_375501 - BLOCK
      ?auto_375502 - BLOCK
      ?auto_375503 - BLOCK
      ?auto_375504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375504 ) ( ON-TABLE ?auto_375490 ) ( ON ?auto_375491 ?auto_375490 ) ( ON ?auto_375492 ?auto_375491 ) ( ON ?auto_375493 ?auto_375492 ) ( ON ?auto_375494 ?auto_375493 ) ( ON ?auto_375495 ?auto_375494 ) ( ON ?auto_375496 ?auto_375495 ) ( ON ?auto_375497 ?auto_375496 ) ( ON ?auto_375498 ?auto_375497 ) ( ON ?auto_375499 ?auto_375498 ) ( ON ?auto_375500 ?auto_375499 ) ( ON ?auto_375501 ?auto_375500 ) ( not ( = ?auto_375490 ?auto_375491 ) ) ( not ( = ?auto_375490 ?auto_375492 ) ) ( not ( = ?auto_375490 ?auto_375493 ) ) ( not ( = ?auto_375490 ?auto_375494 ) ) ( not ( = ?auto_375490 ?auto_375495 ) ) ( not ( = ?auto_375490 ?auto_375496 ) ) ( not ( = ?auto_375490 ?auto_375497 ) ) ( not ( = ?auto_375490 ?auto_375498 ) ) ( not ( = ?auto_375490 ?auto_375499 ) ) ( not ( = ?auto_375490 ?auto_375500 ) ) ( not ( = ?auto_375490 ?auto_375501 ) ) ( not ( = ?auto_375490 ?auto_375502 ) ) ( not ( = ?auto_375490 ?auto_375503 ) ) ( not ( = ?auto_375490 ?auto_375504 ) ) ( not ( = ?auto_375491 ?auto_375492 ) ) ( not ( = ?auto_375491 ?auto_375493 ) ) ( not ( = ?auto_375491 ?auto_375494 ) ) ( not ( = ?auto_375491 ?auto_375495 ) ) ( not ( = ?auto_375491 ?auto_375496 ) ) ( not ( = ?auto_375491 ?auto_375497 ) ) ( not ( = ?auto_375491 ?auto_375498 ) ) ( not ( = ?auto_375491 ?auto_375499 ) ) ( not ( = ?auto_375491 ?auto_375500 ) ) ( not ( = ?auto_375491 ?auto_375501 ) ) ( not ( = ?auto_375491 ?auto_375502 ) ) ( not ( = ?auto_375491 ?auto_375503 ) ) ( not ( = ?auto_375491 ?auto_375504 ) ) ( not ( = ?auto_375492 ?auto_375493 ) ) ( not ( = ?auto_375492 ?auto_375494 ) ) ( not ( = ?auto_375492 ?auto_375495 ) ) ( not ( = ?auto_375492 ?auto_375496 ) ) ( not ( = ?auto_375492 ?auto_375497 ) ) ( not ( = ?auto_375492 ?auto_375498 ) ) ( not ( = ?auto_375492 ?auto_375499 ) ) ( not ( = ?auto_375492 ?auto_375500 ) ) ( not ( = ?auto_375492 ?auto_375501 ) ) ( not ( = ?auto_375492 ?auto_375502 ) ) ( not ( = ?auto_375492 ?auto_375503 ) ) ( not ( = ?auto_375492 ?auto_375504 ) ) ( not ( = ?auto_375493 ?auto_375494 ) ) ( not ( = ?auto_375493 ?auto_375495 ) ) ( not ( = ?auto_375493 ?auto_375496 ) ) ( not ( = ?auto_375493 ?auto_375497 ) ) ( not ( = ?auto_375493 ?auto_375498 ) ) ( not ( = ?auto_375493 ?auto_375499 ) ) ( not ( = ?auto_375493 ?auto_375500 ) ) ( not ( = ?auto_375493 ?auto_375501 ) ) ( not ( = ?auto_375493 ?auto_375502 ) ) ( not ( = ?auto_375493 ?auto_375503 ) ) ( not ( = ?auto_375493 ?auto_375504 ) ) ( not ( = ?auto_375494 ?auto_375495 ) ) ( not ( = ?auto_375494 ?auto_375496 ) ) ( not ( = ?auto_375494 ?auto_375497 ) ) ( not ( = ?auto_375494 ?auto_375498 ) ) ( not ( = ?auto_375494 ?auto_375499 ) ) ( not ( = ?auto_375494 ?auto_375500 ) ) ( not ( = ?auto_375494 ?auto_375501 ) ) ( not ( = ?auto_375494 ?auto_375502 ) ) ( not ( = ?auto_375494 ?auto_375503 ) ) ( not ( = ?auto_375494 ?auto_375504 ) ) ( not ( = ?auto_375495 ?auto_375496 ) ) ( not ( = ?auto_375495 ?auto_375497 ) ) ( not ( = ?auto_375495 ?auto_375498 ) ) ( not ( = ?auto_375495 ?auto_375499 ) ) ( not ( = ?auto_375495 ?auto_375500 ) ) ( not ( = ?auto_375495 ?auto_375501 ) ) ( not ( = ?auto_375495 ?auto_375502 ) ) ( not ( = ?auto_375495 ?auto_375503 ) ) ( not ( = ?auto_375495 ?auto_375504 ) ) ( not ( = ?auto_375496 ?auto_375497 ) ) ( not ( = ?auto_375496 ?auto_375498 ) ) ( not ( = ?auto_375496 ?auto_375499 ) ) ( not ( = ?auto_375496 ?auto_375500 ) ) ( not ( = ?auto_375496 ?auto_375501 ) ) ( not ( = ?auto_375496 ?auto_375502 ) ) ( not ( = ?auto_375496 ?auto_375503 ) ) ( not ( = ?auto_375496 ?auto_375504 ) ) ( not ( = ?auto_375497 ?auto_375498 ) ) ( not ( = ?auto_375497 ?auto_375499 ) ) ( not ( = ?auto_375497 ?auto_375500 ) ) ( not ( = ?auto_375497 ?auto_375501 ) ) ( not ( = ?auto_375497 ?auto_375502 ) ) ( not ( = ?auto_375497 ?auto_375503 ) ) ( not ( = ?auto_375497 ?auto_375504 ) ) ( not ( = ?auto_375498 ?auto_375499 ) ) ( not ( = ?auto_375498 ?auto_375500 ) ) ( not ( = ?auto_375498 ?auto_375501 ) ) ( not ( = ?auto_375498 ?auto_375502 ) ) ( not ( = ?auto_375498 ?auto_375503 ) ) ( not ( = ?auto_375498 ?auto_375504 ) ) ( not ( = ?auto_375499 ?auto_375500 ) ) ( not ( = ?auto_375499 ?auto_375501 ) ) ( not ( = ?auto_375499 ?auto_375502 ) ) ( not ( = ?auto_375499 ?auto_375503 ) ) ( not ( = ?auto_375499 ?auto_375504 ) ) ( not ( = ?auto_375500 ?auto_375501 ) ) ( not ( = ?auto_375500 ?auto_375502 ) ) ( not ( = ?auto_375500 ?auto_375503 ) ) ( not ( = ?auto_375500 ?auto_375504 ) ) ( not ( = ?auto_375501 ?auto_375502 ) ) ( not ( = ?auto_375501 ?auto_375503 ) ) ( not ( = ?auto_375501 ?auto_375504 ) ) ( not ( = ?auto_375502 ?auto_375503 ) ) ( not ( = ?auto_375502 ?auto_375504 ) ) ( not ( = ?auto_375503 ?auto_375504 ) ) ( ON ?auto_375503 ?auto_375504 ) ( CLEAR ?auto_375501 ) ( ON ?auto_375502 ?auto_375503 ) ( CLEAR ?auto_375502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_375490 ?auto_375491 ?auto_375492 ?auto_375493 ?auto_375494 ?auto_375495 ?auto_375496 ?auto_375497 ?auto_375498 ?auto_375499 ?auto_375500 ?auto_375501 ?auto_375502 )
      ( MAKE-15PILE ?auto_375490 ?auto_375491 ?auto_375492 ?auto_375493 ?auto_375494 ?auto_375495 ?auto_375496 ?auto_375497 ?auto_375498 ?auto_375499 ?auto_375500 ?auto_375501 ?auto_375502 ?auto_375503 ?auto_375504 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375520 - BLOCK
      ?auto_375521 - BLOCK
      ?auto_375522 - BLOCK
      ?auto_375523 - BLOCK
      ?auto_375524 - BLOCK
      ?auto_375525 - BLOCK
      ?auto_375526 - BLOCK
      ?auto_375527 - BLOCK
      ?auto_375528 - BLOCK
      ?auto_375529 - BLOCK
      ?auto_375530 - BLOCK
      ?auto_375531 - BLOCK
      ?auto_375532 - BLOCK
      ?auto_375533 - BLOCK
      ?auto_375534 - BLOCK
    )
    :vars
    (
      ?auto_375535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375534 ?auto_375535 ) ( ON-TABLE ?auto_375520 ) ( ON ?auto_375521 ?auto_375520 ) ( ON ?auto_375522 ?auto_375521 ) ( ON ?auto_375523 ?auto_375522 ) ( ON ?auto_375524 ?auto_375523 ) ( ON ?auto_375525 ?auto_375524 ) ( ON ?auto_375526 ?auto_375525 ) ( ON ?auto_375527 ?auto_375526 ) ( ON ?auto_375528 ?auto_375527 ) ( ON ?auto_375529 ?auto_375528 ) ( ON ?auto_375530 ?auto_375529 ) ( not ( = ?auto_375520 ?auto_375521 ) ) ( not ( = ?auto_375520 ?auto_375522 ) ) ( not ( = ?auto_375520 ?auto_375523 ) ) ( not ( = ?auto_375520 ?auto_375524 ) ) ( not ( = ?auto_375520 ?auto_375525 ) ) ( not ( = ?auto_375520 ?auto_375526 ) ) ( not ( = ?auto_375520 ?auto_375527 ) ) ( not ( = ?auto_375520 ?auto_375528 ) ) ( not ( = ?auto_375520 ?auto_375529 ) ) ( not ( = ?auto_375520 ?auto_375530 ) ) ( not ( = ?auto_375520 ?auto_375531 ) ) ( not ( = ?auto_375520 ?auto_375532 ) ) ( not ( = ?auto_375520 ?auto_375533 ) ) ( not ( = ?auto_375520 ?auto_375534 ) ) ( not ( = ?auto_375520 ?auto_375535 ) ) ( not ( = ?auto_375521 ?auto_375522 ) ) ( not ( = ?auto_375521 ?auto_375523 ) ) ( not ( = ?auto_375521 ?auto_375524 ) ) ( not ( = ?auto_375521 ?auto_375525 ) ) ( not ( = ?auto_375521 ?auto_375526 ) ) ( not ( = ?auto_375521 ?auto_375527 ) ) ( not ( = ?auto_375521 ?auto_375528 ) ) ( not ( = ?auto_375521 ?auto_375529 ) ) ( not ( = ?auto_375521 ?auto_375530 ) ) ( not ( = ?auto_375521 ?auto_375531 ) ) ( not ( = ?auto_375521 ?auto_375532 ) ) ( not ( = ?auto_375521 ?auto_375533 ) ) ( not ( = ?auto_375521 ?auto_375534 ) ) ( not ( = ?auto_375521 ?auto_375535 ) ) ( not ( = ?auto_375522 ?auto_375523 ) ) ( not ( = ?auto_375522 ?auto_375524 ) ) ( not ( = ?auto_375522 ?auto_375525 ) ) ( not ( = ?auto_375522 ?auto_375526 ) ) ( not ( = ?auto_375522 ?auto_375527 ) ) ( not ( = ?auto_375522 ?auto_375528 ) ) ( not ( = ?auto_375522 ?auto_375529 ) ) ( not ( = ?auto_375522 ?auto_375530 ) ) ( not ( = ?auto_375522 ?auto_375531 ) ) ( not ( = ?auto_375522 ?auto_375532 ) ) ( not ( = ?auto_375522 ?auto_375533 ) ) ( not ( = ?auto_375522 ?auto_375534 ) ) ( not ( = ?auto_375522 ?auto_375535 ) ) ( not ( = ?auto_375523 ?auto_375524 ) ) ( not ( = ?auto_375523 ?auto_375525 ) ) ( not ( = ?auto_375523 ?auto_375526 ) ) ( not ( = ?auto_375523 ?auto_375527 ) ) ( not ( = ?auto_375523 ?auto_375528 ) ) ( not ( = ?auto_375523 ?auto_375529 ) ) ( not ( = ?auto_375523 ?auto_375530 ) ) ( not ( = ?auto_375523 ?auto_375531 ) ) ( not ( = ?auto_375523 ?auto_375532 ) ) ( not ( = ?auto_375523 ?auto_375533 ) ) ( not ( = ?auto_375523 ?auto_375534 ) ) ( not ( = ?auto_375523 ?auto_375535 ) ) ( not ( = ?auto_375524 ?auto_375525 ) ) ( not ( = ?auto_375524 ?auto_375526 ) ) ( not ( = ?auto_375524 ?auto_375527 ) ) ( not ( = ?auto_375524 ?auto_375528 ) ) ( not ( = ?auto_375524 ?auto_375529 ) ) ( not ( = ?auto_375524 ?auto_375530 ) ) ( not ( = ?auto_375524 ?auto_375531 ) ) ( not ( = ?auto_375524 ?auto_375532 ) ) ( not ( = ?auto_375524 ?auto_375533 ) ) ( not ( = ?auto_375524 ?auto_375534 ) ) ( not ( = ?auto_375524 ?auto_375535 ) ) ( not ( = ?auto_375525 ?auto_375526 ) ) ( not ( = ?auto_375525 ?auto_375527 ) ) ( not ( = ?auto_375525 ?auto_375528 ) ) ( not ( = ?auto_375525 ?auto_375529 ) ) ( not ( = ?auto_375525 ?auto_375530 ) ) ( not ( = ?auto_375525 ?auto_375531 ) ) ( not ( = ?auto_375525 ?auto_375532 ) ) ( not ( = ?auto_375525 ?auto_375533 ) ) ( not ( = ?auto_375525 ?auto_375534 ) ) ( not ( = ?auto_375525 ?auto_375535 ) ) ( not ( = ?auto_375526 ?auto_375527 ) ) ( not ( = ?auto_375526 ?auto_375528 ) ) ( not ( = ?auto_375526 ?auto_375529 ) ) ( not ( = ?auto_375526 ?auto_375530 ) ) ( not ( = ?auto_375526 ?auto_375531 ) ) ( not ( = ?auto_375526 ?auto_375532 ) ) ( not ( = ?auto_375526 ?auto_375533 ) ) ( not ( = ?auto_375526 ?auto_375534 ) ) ( not ( = ?auto_375526 ?auto_375535 ) ) ( not ( = ?auto_375527 ?auto_375528 ) ) ( not ( = ?auto_375527 ?auto_375529 ) ) ( not ( = ?auto_375527 ?auto_375530 ) ) ( not ( = ?auto_375527 ?auto_375531 ) ) ( not ( = ?auto_375527 ?auto_375532 ) ) ( not ( = ?auto_375527 ?auto_375533 ) ) ( not ( = ?auto_375527 ?auto_375534 ) ) ( not ( = ?auto_375527 ?auto_375535 ) ) ( not ( = ?auto_375528 ?auto_375529 ) ) ( not ( = ?auto_375528 ?auto_375530 ) ) ( not ( = ?auto_375528 ?auto_375531 ) ) ( not ( = ?auto_375528 ?auto_375532 ) ) ( not ( = ?auto_375528 ?auto_375533 ) ) ( not ( = ?auto_375528 ?auto_375534 ) ) ( not ( = ?auto_375528 ?auto_375535 ) ) ( not ( = ?auto_375529 ?auto_375530 ) ) ( not ( = ?auto_375529 ?auto_375531 ) ) ( not ( = ?auto_375529 ?auto_375532 ) ) ( not ( = ?auto_375529 ?auto_375533 ) ) ( not ( = ?auto_375529 ?auto_375534 ) ) ( not ( = ?auto_375529 ?auto_375535 ) ) ( not ( = ?auto_375530 ?auto_375531 ) ) ( not ( = ?auto_375530 ?auto_375532 ) ) ( not ( = ?auto_375530 ?auto_375533 ) ) ( not ( = ?auto_375530 ?auto_375534 ) ) ( not ( = ?auto_375530 ?auto_375535 ) ) ( not ( = ?auto_375531 ?auto_375532 ) ) ( not ( = ?auto_375531 ?auto_375533 ) ) ( not ( = ?auto_375531 ?auto_375534 ) ) ( not ( = ?auto_375531 ?auto_375535 ) ) ( not ( = ?auto_375532 ?auto_375533 ) ) ( not ( = ?auto_375532 ?auto_375534 ) ) ( not ( = ?auto_375532 ?auto_375535 ) ) ( not ( = ?auto_375533 ?auto_375534 ) ) ( not ( = ?auto_375533 ?auto_375535 ) ) ( not ( = ?auto_375534 ?auto_375535 ) ) ( ON ?auto_375533 ?auto_375534 ) ( ON ?auto_375532 ?auto_375533 ) ( CLEAR ?auto_375530 ) ( ON ?auto_375531 ?auto_375532 ) ( CLEAR ?auto_375531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_375520 ?auto_375521 ?auto_375522 ?auto_375523 ?auto_375524 ?auto_375525 ?auto_375526 ?auto_375527 ?auto_375528 ?auto_375529 ?auto_375530 ?auto_375531 )
      ( MAKE-15PILE ?auto_375520 ?auto_375521 ?auto_375522 ?auto_375523 ?auto_375524 ?auto_375525 ?auto_375526 ?auto_375527 ?auto_375528 ?auto_375529 ?auto_375530 ?auto_375531 ?auto_375532 ?auto_375533 ?auto_375534 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375551 - BLOCK
      ?auto_375552 - BLOCK
      ?auto_375553 - BLOCK
      ?auto_375554 - BLOCK
      ?auto_375555 - BLOCK
      ?auto_375556 - BLOCK
      ?auto_375557 - BLOCK
      ?auto_375558 - BLOCK
      ?auto_375559 - BLOCK
      ?auto_375560 - BLOCK
      ?auto_375561 - BLOCK
      ?auto_375562 - BLOCK
      ?auto_375563 - BLOCK
      ?auto_375564 - BLOCK
      ?auto_375565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375565 ) ( ON-TABLE ?auto_375551 ) ( ON ?auto_375552 ?auto_375551 ) ( ON ?auto_375553 ?auto_375552 ) ( ON ?auto_375554 ?auto_375553 ) ( ON ?auto_375555 ?auto_375554 ) ( ON ?auto_375556 ?auto_375555 ) ( ON ?auto_375557 ?auto_375556 ) ( ON ?auto_375558 ?auto_375557 ) ( ON ?auto_375559 ?auto_375558 ) ( ON ?auto_375560 ?auto_375559 ) ( ON ?auto_375561 ?auto_375560 ) ( not ( = ?auto_375551 ?auto_375552 ) ) ( not ( = ?auto_375551 ?auto_375553 ) ) ( not ( = ?auto_375551 ?auto_375554 ) ) ( not ( = ?auto_375551 ?auto_375555 ) ) ( not ( = ?auto_375551 ?auto_375556 ) ) ( not ( = ?auto_375551 ?auto_375557 ) ) ( not ( = ?auto_375551 ?auto_375558 ) ) ( not ( = ?auto_375551 ?auto_375559 ) ) ( not ( = ?auto_375551 ?auto_375560 ) ) ( not ( = ?auto_375551 ?auto_375561 ) ) ( not ( = ?auto_375551 ?auto_375562 ) ) ( not ( = ?auto_375551 ?auto_375563 ) ) ( not ( = ?auto_375551 ?auto_375564 ) ) ( not ( = ?auto_375551 ?auto_375565 ) ) ( not ( = ?auto_375552 ?auto_375553 ) ) ( not ( = ?auto_375552 ?auto_375554 ) ) ( not ( = ?auto_375552 ?auto_375555 ) ) ( not ( = ?auto_375552 ?auto_375556 ) ) ( not ( = ?auto_375552 ?auto_375557 ) ) ( not ( = ?auto_375552 ?auto_375558 ) ) ( not ( = ?auto_375552 ?auto_375559 ) ) ( not ( = ?auto_375552 ?auto_375560 ) ) ( not ( = ?auto_375552 ?auto_375561 ) ) ( not ( = ?auto_375552 ?auto_375562 ) ) ( not ( = ?auto_375552 ?auto_375563 ) ) ( not ( = ?auto_375552 ?auto_375564 ) ) ( not ( = ?auto_375552 ?auto_375565 ) ) ( not ( = ?auto_375553 ?auto_375554 ) ) ( not ( = ?auto_375553 ?auto_375555 ) ) ( not ( = ?auto_375553 ?auto_375556 ) ) ( not ( = ?auto_375553 ?auto_375557 ) ) ( not ( = ?auto_375553 ?auto_375558 ) ) ( not ( = ?auto_375553 ?auto_375559 ) ) ( not ( = ?auto_375553 ?auto_375560 ) ) ( not ( = ?auto_375553 ?auto_375561 ) ) ( not ( = ?auto_375553 ?auto_375562 ) ) ( not ( = ?auto_375553 ?auto_375563 ) ) ( not ( = ?auto_375553 ?auto_375564 ) ) ( not ( = ?auto_375553 ?auto_375565 ) ) ( not ( = ?auto_375554 ?auto_375555 ) ) ( not ( = ?auto_375554 ?auto_375556 ) ) ( not ( = ?auto_375554 ?auto_375557 ) ) ( not ( = ?auto_375554 ?auto_375558 ) ) ( not ( = ?auto_375554 ?auto_375559 ) ) ( not ( = ?auto_375554 ?auto_375560 ) ) ( not ( = ?auto_375554 ?auto_375561 ) ) ( not ( = ?auto_375554 ?auto_375562 ) ) ( not ( = ?auto_375554 ?auto_375563 ) ) ( not ( = ?auto_375554 ?auto_375564 ) ) ( not ( = ?auto_375554 ?auto_375565 ) ) ( not ( = ?auto_375555 ?auto_375556 ) ) ( not ( = ?auto_375555 ?auto_375557 ) ) ( not ( = ?auto_375555 ?auto_375558 ) ) ( not ( = ?auto_375555 ?auto_375559 ) ) ( not ( = ?auto_375555 ?auto_375560 ) ) ( not ( = ?auto_375555 ?auto_375561 ) ) ( not ( = ?auto_375555 ?auto_375562 ) ) ( not ( = ?auto_375555 ?auto_375563 ) ) ( not ( = ?auto_375555 ?auto_375564 ) ) ( not ( = ?auto_375555 ?auto_375565 ) ) ( not ( = ?auto_375556 ?auto_375557 ) ) ( not ( = ?auto_375556 ?auto_375558 ) ) ( not ( = ?auto_375556 ?auto_375559 ) ) ( not ( = ?auto_375556 ?auto_375560 ) ) ( not ( = ?auto_375556 ?auto_375561 ) ) ( not ( = ?auto_375556 ?auto_375562 ) ) ( not ( = ?auto_375556 ?auto_375563 ) ) ( not ( = ?auto_375556 ?auto_375564 ) ) ( not ( = ?auto_375556 ?auto_375565 ) ) ( not ( = ?auto_375557 ?auto_375558 ) ) ( not ( = ?auto_375557 ?auto_375559 ) ) ( not ( = ?auto_375557 ?auto_375560 ) ) ( not ( = ?auto_375557 ?auto_375561 ) ) ( not ( = ?auto_375557 ?auto_375562 ) ) ( not ( = ?auto_375557 ?auto_375563 ) ) ( not ( = ?auto_375557 ?auto_375564 ) ) ( not ( = ?auto_375557 ?auto_375565 ) ) ( not ( = ?auto_375558 ?auto_375559 ) ) ( not ( = ?auto_375558 ?auto_375560 ) ) ( not ( = ?auto_375558 ?auto_375561 ) ) ( not ( = ?auto_375558 ?auto_375562 ) ) ( not ( = ?auto_375558 ?auto_375563 ) ) ( not ( = ?auto_375558 ?auto_375564 ) ) ( not ( = ?auto_375558 ?auto_375565 ) ) ( not ( = ?auto_375559 ?auto_375560 ) ) ( not ( = ?auto_375559 ?auto_375561 ) ) ( not ( = ?auto_375559 ?auto_375562 ) ) ( not ( = ?auto_375559 ?auto_375563 ) ) ( not ( = ?auto_375559 ?auto_375564 ) ) ( not ( = ?auto_375559 ?auto_375565 ) ) ( not ( = ?auto_375560 ?auto_375561 ) ) ( not ( = ?auto_375560 ?auto_375562 ) ) ( not ( = ?auto_375560 ?auto_375563 ) ) ( not ( = ?auto_375560 ?auto_375564 ) ) ( not ( = ?auto_375560 ?auto_375565 ) ) ( not ( = ?auto_375561 ?auto_375562 ) ) ( not ( = ?auto_375561 ?auto_375563 ) ) ( not ( = ?auto_375561 ?auto_375564 ) ) ( not ( = ?auto_375561 ?auto_375565 ) ) ( not ( = ?auto_375562 ?auto_375563 ) ) ( not ( = ?auto_375562 ?auto_375564 ) ) ( not ( = ?auto_375562 ?auto_375565 ) ) ( not ( = ?auto_375563 ?auto_375564 ) ) ( not ( = ?auto_375563 ?auto_375565 ) ) ( not ( = ?auto_375564 ?auto_375565 ) ) ( ON ?auto_375564 ?auto_375565 ) ( ON ?auto_375563 ?auto_375564 ) ( CLEAR ?auto_375561 ) ( ON ?auto_375562 ?auto_375563 ) ( CLEAR ?auto_375562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_375551 ?auto_375552 ?auto_375553 ?auto_375554 ?auto_375555 ?auto_375556 ?auto_375557 ?auto_375558 ?auto_375559 ?auto_375560 ?auto_375561 ?auto_375562 )
      ( MAKE-15PILE ?auto_375551 ?auto_375552 ?auto_375553 ?auto_375554 ?auto_375555 ?auto_375556 ?auto_375557 ?auto_375558 ?auto_375559 ?auto_375560 ?auto_375561 ?auto_375562 ?auto_375563 ?auto_375564 ?auto_375565 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375581 - BLOCK
      ?auto_375582 - BLOCK
      ?auto_375583 - BLOCK
      ?auto_375584 - BLOCK
      ?auto_375585 - BLOCK
      ?auto_375586 - BLOCK
      ?auto_375587 - BLOCK
      ?auto_375588 - BLOCK
      ?auto_375589 - BLOCK
      ?auto_375590 - BLOCK
      ?auto_375591 - BLOCK
      ?auto_375592 - BLOCK
      ?auto_375593 - BLOCK
      ?auto_375594 - BLOCK
      ?auto_375595 - BLOCK
    )
    :vars
    (
      ?auto_375596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375595 ?auto_375596 ) ( ON-TABLE ?auto_375581 ) ( ON ?auto_375582 ?auto_375581 ) ( ON ?auto_375583 ?auto_375582 ) ( ON ?auto_375584 ?auto_375583 ) ( ON ?auto_375585 ?auto_375584 ) ( ON ?auto_375586 ?auto_375585 ) ( ON ?auto_375587 ?auto_375586 ) ( ON ?auto_375588 ?auto_375587 ) ( ON ?auto_375589 ?auto_375588 ) ( ON ?auto_375590 ?auto_375589 ) ( not ( = ?auto_375581 ?auto_375582 ) ) ( not ( = ?auto_375581 ?auto_375583 ) ) ( not ( = ?auto_375581 ?auto_375584 ) ) ( not ( = ?auto_375581 ?auto_375585 ) ) ( not ( = ?auto_375581 ?auto_375586 ) ) ( not ( = ?auto_375581 ?auto_375587 ) ) ( not ( = ?auto_375581 ?auto_375588 ) ) ( not ( = ?auto_375581 ?auto_375589 ) ) ( not ( = ?auto_375581 ?auto_375590 ) ) ( not ( = ?auto_375581 ?auto_375591 ) ) ( not ( = ?auto_375581 ?auto_375592 ) ) ( not ( = ?auto_375581 ?auto_375593 ) ) ( not ( = ?auto_375581 ?auto_375594 ) ) ( not ( = ?auto_375581 ?auto_375595 ) ) ( not ( = ?auto_375581 ?auto_375596 ) ) ( not ( = ?auto_375582 ?auto_375583 ) ) ( not ( = ?auto_375582 ?auto_375584 ) ) ( not ( = ?auto_375582 ?auto_375585 ) ) ( not ( = ?auto_375582 ?auto_375586 ) ) ( not ( = ?auto_375582 ?auto_375587 ) ) ( not ( = ?auto_375582 ?auto_375588 ) ) ( not ( = ?auto_375582 ?auto_375589 ) ) ( not ( = ?auto_375582 ?auto_375590 ) ) ( not ( = ?auto_375582 ?auto_375591 ) ) ( not ( = ?auto_375582 ?auto_375592 ) ) ( not ( = ?auto_375582 ?auto_375593 ) ) ( not ( = ?auto_375582 ?auto_375594 ) ) ( not ( = ?auto_375582 ?auto_375595 ) ) ( not ( = ?auto_375582 ?auto_375596 ) ) ( not ( = ?auto_375583 ?auto_375584 ) ) ( not ( = ?auto_375583 ?auto_375585 ) ) ( not ( = ?auto_375583 ?auto_375586 ) ) ( not ( = ?auto_375583 ?auto_375587 ) ) ( not ( = ?auto_375583 ?auto_375588 ) ) ( not ( = ?auto_375583 ?auto_375589 ) ) ( not ( = ?auto_375583 ?auto_375590 ) ) ( not ( = ?auto_375583 ?auto_375591 ) ) ( not ( = ?auto_375583 ?auto_375592 ) ) ( not ( = ?auto_375583 ?auto_375593 ) ) ( not ( = ?auto_375583 ?auto_375594 ) ) ( not ( = ?auto_375583 ?auto_375595 ) ) ( not ( = ?auto_375583 ?auto_375596 ) ) ( not ( = ?auto_375584 ?auto_375585 ) ) ( not ( = ?auto_375584 ?auto_375586 ) ) ( not ( = ?auto_375584 ?auto_375587 ) ) ( not ( = ?auto_375584 ?auto_375588 ) ) ( not ( = ?auto_375584 ?auto_375589 ) ) ( not ( = ?auto_375584 ?auto_375590 ) ) ( not ( = ?auto_375584 ?auto_375591 ) ) ( not ( = ?auto_375584 ?auto_375592 ) ) ( not ( = ?auto_375584 ?auto_375593 ) ) ( not ( = ?auto_375584 ?auto_375594 ) ) ( not ( = ?auto_375584 ?auto_375595 ) ) ( not ( = ?auto_375584 ?auto_375596 ) ) ( not ( = ?auto_375585 ?auto_375586 ) ) ( not ( = ?auto_375585 ?auto_375587 ) ) ( not ( = ?auto_375585 ?auto_375588 ) ) ( not ( = ?auto_375585 ?auto_375589 ) ) ( not ( = ?auto_375585 ?auto_375590 ) ) ( not ( = ?auto_375585 ?auto_375591 ) ) ( not ( = ?auto_375585 ?auto_375592 ) ) ( not ( = ?auto_375585 ?auto_375593 ) ) ( not ( = ?auto_375585 ?auto_375594 ) ) ( not ( = ?auto_375585 ?auto_375595 ) ) ( not ( = ?auto_375585 ?auto_375596 ) ) ( not ( = ?auto_375586 ?auto_375587 ) ) ( not ( = ?auto_375586 ?auto_375588 ) ) ( not ( = ?auto_375586 ?auto_375589 ) ) ( not ( = ?auto_375586 ?auto_375590 ) ) ( not ( = ?auto_375586 ?auto_375591 ) ) ( not ( = ?auto_375586 ?auto_375592 ) ) ( not ( = ?auto_375586 ?auto_375593 ) ) ( not ( = ?auto_375586 ?auto_375594 ) ) ( not ( = ?auto_375586 ?auto_375595 ) ) ( not ( = ?auto_375586 ?auto_375596 ) ) ( not ( = ?auto_375587 ?auto_375588 ) ) ( not ( = ?auto_375587 ?auto_375589 ) ) ( not ( = ?auto_375587 ?auto_375590 ) ) ( not ( = ?auto_375587 ?auto_375591 ) ) ( not ( = ?auto_375587 ?auto_375592 ) ) ( not ( = ?auto_375587 ?auto_375593 ) ) ( not ( = ?auto_375587 ?auto_375594 ) ) ( not ( = ?auto_375587 ?auto_375595 ) ) ( not ( = ?auto_375587 ?auto_375596 ) ) ( not ( = ?auto_375588 ?auto_375589 ) ) ( not ( = ?auto_375588 ?auto_375590 ) ) ( not ( = ?auto_375588 ?auto_375591 ) ) ( not ( = ?auto_375588 ?auto_375592 ) ) ( not ( = ?auto_375588 ?auto_375593 ) ) ( not ( = ?auto_375588 ?auto_375594 ) ) ( not ( = ?auto_375588 ?auto_375595 ) ) ( not ( = ?auto_375588 ?auto_375596 ) ) ( not ( = ?auto_375589 ?auto_375590 ) ) ( not ( = ?auto_375589 ?auto_375591 ) ) ( not ( = ?auto_375589 ?auto_375592 ) ) ( not ( = ?auto_375589 ?auto_375593 ) ) ( not ( = ?auto_375589 ?auto_375594 ) ) ( not ( = ?auto_375589 ?auto_375595 ) ) ( not ( = ?auto_375589 ?auto_375596 ) ) ( not ( = ?auto_375590 ?auto_375591 ) ) ( not ( = ?auto_375590 ?auto_375592 ) ) ( not ( = ?auto_375590 ?auto_375593 ) ) ( not ( = ?auto_375590 ?auto_375594 ) ) ( not ( = ?auto_375590 ?auto_375595 ) ) ( not ( = ?auto_375590 ?auto_375596 ) ) ( not ( = ?auto_375591 ?auto_375592 ) ) ( not ( = ?auto_375591 ?auto_375593 ) ) ( not ( = ?auto_375591 ?auto_375594 ) ) ( not ( = ?auto_375591 ?auto_375595 ) ) ( not ( = ?auto_375591 ?auto_375596 ) ) ( not ( = ?auto_375592 ?auto_375593 ) ) ( not ( = ?auto_375592 ?auto_375594 ) ) ( not ( = ?auto_375592 ?auto_375595 ) ) ( not ( = ?auto_375592 ?auto_375596 ) ) ( not ( = ?auto_375593 ?auto_375594 ) ) ( not ( = ?auto_375593 ?auto_375595 ) ) ( not ( = ?auto_375593 ?auto_375596 ) ) ( not ( = ?auto_375594 ?auto_375595 ) ) ( not ( = ?auto_375594 ?auto_375596 ) ) ( not ( = ?auto_375595 ?auto_375596 ) ) ( ON ?auto_375594 ?auto_375595 ) ( ON ?auto_375593 ?auto_375594 ) ( ON ?auto_375592 ?auto_375593 ) ( CLEAR ?auto_375590 ) ( ON ?auto_375591 ?auto_375592 ) ( CLEAR ?auto_375591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_375581 ?auto_375582 ?auto_375583 ?auto_375584 ?auto_375585 ?auto_375586 ?auto_375587 ?auto_375588 ?auto_375589 ?auto_375590 ?auto_375591 )
      ( MAKE-15PILE ?auto_375581 ?auto_375582 ?auto_375583 ?auto_375584 ?auto_375585 ?auto_375586 ?auto_375587 ?auto_375588 ?auto_375589 ?auto_375590 ?auto_375591 ?auto_375592 ?auto_375593 ?auto_375594 ?auto_375595 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375612 - BLOCK
      ?auto_375613 - BLOCK
      ?auto_375614 - BLOCK
      ?auto_375615 - BLOCK
      ?auto_375616 - BLOCK
      ?auto_375617 - BLOCK
      ?auto_375618 - BLOCK
      ?auto_375619 - BLOCK
      ?auto_375620 - BLOCK
      ?auto_375621 - BLOCK
      ?auto_375622 - BLOCK
      ?auto_375623 - BLOCK
      ?auto_375624 - BLOCK
      ?auto_375625 - BLOCK
      ?auto_375626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375626 ) ( ON-TABLE ?auto_375612 ) ( ON ?auto_375613 ?auto_375612 ) ( ON ?auto_375614 ?auto_375613 ) ( ON ?auto_375615 ?auto_375614 ) ( ON ?auto_375616 ?auto_375615 ) ( ON ?auto_375617 ?auto_375616 ) ( ON ?auto_375618 ?auto_375617 ) ( ON ?auto_375619 ?auto_375618 ) ( ON ?auto_375620 ?auto_375619 ) ( ON ?auto_375621 ?auto_375620 ) ( not ( = ?auto_375612 ?auto_375613 ) ) ( not ( = ?auto_375612 ?auto_375614 ) ) ( not ( = ?auto_375612 ?auto_375615 ) ) ( not ( = ?auto_375612 ?auto_375616 ) ) ( not ( = ?auto_375612 ?auto_375617 ) ) ( not ( = ?auto_375612 ?auto_375618 ) ) ( not ( = ?auto_375612 ?auto_375619 ) ) ( not ( = ?auto_375612 ?auto_375620 ) ) ( not ( = ?auto_375612 ?auto_375621 ) ) ( not ( = ?auto_375612 ?auto_375622 ) ) ( not ( = ?auto_375612 ?auto_375623 ) ) ( not ( = ?auto_375612 ?auto_375624 ) ) ( not ( = ?auto_375612 ?auto_375625 ) ) ( not ( = ?auto_375612 ?auto_375626 ) ) ( not ( = ?auto_375613 ?auto_375614 ) ) ( not ( = ?auto_375613 ?auto_375615 ) ) ( not ( = ?auto_375613 ?auto_375616 ) ) ( not ( = ?auto_375613 ?auto_375617 ) ) ( not ( = ?auto_375613 ?auto_375618 ) ) ( not ( = ?auto_375613 ?auto_375619 ) ) ( not ( = ?auto_375613 ?auto_375620 ) ) ( not ( = ?auto_375613 ?auto_375621 ) ) ( not ( = ?auto_375613 ?auto_375622 ) ) ( not ( = ?auto_375613 ?auto_375623 ) ) ( not ( = ?auto_375613 ?auto_375624 ) ) ( not ( = ?auto_375613 ?auto_375625 ) ) ( not ( = ?auto_375613 ?auto_375626 ) ) ( not ( = ?auto_375614 ?auto_375615 ) ) ( not ( = ?auto_375614 ?auto_375616 ) ) ( not ( = ?auto_375614 ?auto_375617 ) ) ( not ( = ?auto_375614 ?auto_375618 ) ) ( not ( = ?auto_375614 ?auto_375619 ) ) ( not ( = ?auto_375614 ?auto_375620 ) ) ( not ( = ?auto_375614 ?auto_375621 ) ) ( not ( = ?auto_375614 ?auto_375622 ) ) ( not ( = ?auto_375614 ?auto_375623 ) ) ( not ( = ?auto_375614 ?auto_375624 ) ) ( not ( = ?auto_375614 ?auto_375625 ) ) ( not ( = ?auto_375614 ?auto_375626 ) ) ( not ( = ?auto_375615 ?auto_375616 ) ) ( not ( = ?auto_375615 ?auto_375617 ) ) ( not ( = ?auto_375615 ?auto_375618 ) ) ( not ( = ?auto_375615 ?auto_375619 ) ) ( not ( = ?auto_375615 ?auto_375620 ) ) ( not ( = ?auto_375615 ?auto_375621 ) ) ( not ( = ?auto_375615 ?auto_375622 ) ) ( not ( = ?auto_375615 ?auto_375623 ) ) ( not ( = ?auto_375615 ?auto_375624 ) ) ( not ( = ?auto_375615 ?auto_375625 ) ) ( not ( = ?auto_375615 ?auto_375626 ) ) ( not ( = ?auto_375616 ?auto_375617 ) ) ( not ( = ?auto_375616 ?auto_375618 ) ) ( not ( = ?auto_375616 ?auto_375619 ) ) ( not ( = ?auto_375616 ?auto_375620 ) ) ( not ( = ?auto_375616 ?auto_375621 ) ) ( not ( = ?auto_375616 ?auto_375622 ) ) ( not ( = ?auto_375616 ?auto_375623 ) ) ( not ( = ?auto_375616 ?auto_375624 ) ) ( not ( = ?auto_375616 ?auto_375625 ) ) ( not ( = ?auto_375616 ?auto_375626 ) ) ( not ( = ?auto_375617 ?auto_375618 ) ) ( not ( = ?auto_375617 ?auto_375619 ) ) ( not ( = ?auto_375617 ?auto_375620 ) ) ( not ( = ?auto_375617 ?auto_375621 ) ) ( not ( = ?auto_375617 ?auto_375622 ) ) ( not ( = ?auto_375617 ?auto_375623 ) ) ( not ( = ?auto_375617 ?auto_375624 ) ) ( not ( = ?auto_375617 ?auto_375625 ) ) ( not ( = ?auto_375617 ?auto_375626 ) ) ( not ( = ?auto_375618 ?auto_375619 ) ) ( not ( = ?auto_375618 ?auto_375620 ) ) ( not ( = ?auto_375618 ?auto_375621 ) ) ( not ( = ?auto_375618 ?auto_375622 ) ) ( not ( = ?auto_375618 ?auto_375623 ) ) ( not ( = ?auto_375618 ?auto_375624 ) ) ( not ( = ?auto_375618 ?auto_375625 ) ) ( not ( = ?auto_375618 ?auto_375626 ) ) ( not ( = ?auto_375619 ?auto_375620 ) ) ( not ( = ?auto_375619 ?auto_375621 ) ) ( not ( = ?auto_375619 ?auto_375622 ) ) ( not ( = ?auto_375619 ?auto_375623 ) ) ( not ( = ?auto_375619 ?auto_375624 ) ) ( not ( = ?auto_375619 ?auto_375625 ) ) ( not ( = ?auto_375619 ?auto_375626 ) ) ( not ( = ?auto_375620 ?auto_375621 ) ) ( not ( = ?auto_375620 ?auto_375622 ) ) ( not ( = ?auto_375620 ?auto_375623 ) ) ( not ( = ?auto_375620 ?auto_375624 ) ) ( not ( = ?auto_375620 ?auto_375625 ) ) ( not ( = ?auto_375620 ?auto_375626 ) ) ( not ( = ?auto_375621 ?auto_375622 ) ) ( not ( = ?auto_375621 ?auto_375623 ) ) ( not ( = ?auto_375621 ?auto_375624 ) ) ( not ( = ?auto_375621 ?auto_375625 ) ) ( not ( = ?auto_375621 ?auto_375626 ) ) ( not ( = ?auto_375622 ?auto_375623 ) ) ( not ( = ?auto_375622 ?auto_375624 ) ) ( not ( = ?auto_375622 ?auto_375625 ) ) ( not ( = ?auto_375622 ?auto_375626 ) ) ( not ( = ?auto_375623 ?auto_375624 ) ) ( not ( = ?auto_375623 ?auto_375625 ) ) ( not ( = ?auto_375623 ?auto_375626 ) ) ( not ( = ?auto_375624 ?auto_375625 ) ) ( not ( = ?auto_375624 ?auto_375626 ) ) ( not ( = ?auto_375625 ?auto_375626 ) ) ( ON ?auto_375625 ?auto_375626 ) ( ON ?auto_375624 ?auto_375625 ) ( ON ?auto_375623 ?auto_375624 ) ( CLEAR ?auto_375621 ) ( ON ?auto_375622 ?auto_375623 ) ( CLEAR ?auto_375622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_375612 ?auto_375613 ?auto_375614 ?auto_375615 ?auto_375616 ?auto_375617 ?auto_375618 ?auto_375619 ?auto_375620 ?auto_375621 ?auto_375622 )
      ( MAKE-15PILE ?auto_375612 ?auto_375613 ?auto_375614 ?auto_375615 ?auto_375616 ?auto_375617 ?auto_375618 ?auto_375619 ?auto_375620 ?auto_375621 ?auto_375622 ?auto_375623 ?auto_375624 ?auto_375625 ?auto_375626 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375642 - BLOCK
      ?auto_375643 - BLOCK
      ?auto_375644 - BLOCK
      ?auto_375645 - BLOCK
      ?auto_375646 - BLOCK
      ?auto_375647 - BLOCK
      ?auto_375648 - BLOCK
      ?auto_375649 - BLOCK
      ?auto_375650 - BLOCK
      ?auto_375651 - BLOCK
      ?auto_375652 - BLOCK
      ?auto_375653 - BLOCK
      ?auto_375654 - BLOCK
      ?auto_375655 - BLOCK
      ?auto_375656 - BLOCK
    )
    :vars
    (
      ?auto_375657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375656 ?auto_375657 ) ( ON-TABLE ?auto_375642 ) ( ON ?auto_375643 ?auto_375642 ) ( ON ?auto_375644 ?auto_375643 ) ( ON ?auto_375645 ?auto_375644 ) ( ON ?auto_375646 ?auto_375645 ) ( ON ?auto_375647 ?auto_375646 ) ( ON ?auto_375648 ?auto_375647 ) ( ON ?auto_375649 ?auto_375648 ) ( ON ?auto_375650 ?auto_375649 ) ( not ( = ?auto_375642 ?auto_375643 ) ) ( not ( = ?auto_375642 ?auto_375644 ) ) ( not ( = ?auto_375642 ?auto_375645 ) ) ( not ( = ?auto_375642 ?auto_375646 ) ) ( not ( = ?auto_375642 ?auto_375647 ) ) ( not ( = ?auto_375642 ?auto_375648 ) ) ( not ( = ?auto_375642 ?auto_375649 ) ) ( not ( = ?auto_375642 ?auto_375650 ) ) ( not ( = ?auto_375642 ?auto_375651 ) ) ( not ( = ?auto_375642 ?auto_375652 ) ) ( not ( = ?auto_375642 ?auto_375653 ) ) ( not ( = ?auto_375642 ?auto_375654 ) ) ( not ( = ?auto_375642 ?auto_375655 ) ) ( not ( = ?auto_375642 ?auto_375656 ) ) ( not ( = ?auto_375642 ?auto_375657 ) ) ( not ( = ?auto_375643 ?auto_375644 ) ) ( not ( = ?auto_375643 ?auto_375645 ) ) ( not ( = ?auto_375643 ?auto_375646 ) ) ( not ( = ?auto_375643 ?auto_375647 ) ) ( not ( = ?auto_375643 ?auto_375648 ) ) ( not ( = ?auto_375643 ?auto_375649 ) ) ( not ( = ?auto_375643 ?auto_375650 ) ) ( not ( = ?auto_375643 ?auto_375651 ) ) ( not ( = ?auto_375643 ?auto_375652 ) ) ( not ( = ?auto_375643 ?auto_375653 ) ) ( not ( = ?auto_375643 ?auto_375654 ) ) ( not ( = ?auto_375643 ?auto_375655 ) ) ( not ( = ?auto_375643 ?auto_375656 ) ) ( not ( = ?auto_375643 ?auto_375657 ) ) ( not ( = ?auto_375644 ?auto_375645 ) ) ( not ( = ?auto_375644 ?auto_375646 ) ) ( not ( = ?auto_375644 ?auto_375647 ) ) ( not ( = ?auto_375644 ?auto_375648 ) ) ( not ( = ?auto_375644 ?auto_375649 ) ) ( not ( = ?auto_375644 ?auto_375650 ) ) ( not ( = ?auto_375644 ?auto_375651 ) ) ( not ( = ?auto_375644 ?auto_375652 ) ) ( not ( = ?auto_375644 ?auto_375653 ) ) ( not ( = ?auto_375644 ?auto_375654 ) ) ( not ( = ?auto_375644 ?auto_375655 ) ) ( not ( = ?auto_375644 ?auto_375656 ) ) ( not ( = ?auto_375644 ?auto_375657 ) ) ( not ( = ?auto_375645 ?auto_375646 ) ) ( not ( = ?auto_375645 ?auto_375647 ) ) ( not ( = ?auto_375645 ?auto_375648 ) ) ( not ( = ?auto_375645 ?auto_375649 ) ) ( not ( = ?auto_375645 ?auto_375650 ) ) ( not ( = ?auto_375645 ?auto_375651 ) ) ( not ( = ?auto_375645 ?auto_375652 ) ) ( not ( = ?auto_375645 ?auto_375653 ) ) ( not ( = ?auto_375645 ?auto_375654 ) ) ( not ( = ?auto_375645 ?auto_375655 ) ) ( not ( = ?auto_375645 ?auto_375656 ) ) ( not ( = ?auto_375645 ?auto_375657 ) ) ( not ( = ?auto_375646 ?auto_375647 ) ) ( not ( = ?auto_375646 ?auto_375648 ) ) ( not ( = ?auto_375646 ?auto_375649 ) ) ( not ( = ?auto_375646 ?auto_375650 ) ) ( not ( = ?auto_375646 ?auto_375651 ) ) ( not ( = ?auto_375646 ?auto_375652 ) ) ( not ( = ?auto_375646 ?auto_375653 ) ) ( not ( = ?auto_375646 ?auto_375654 ) ) ( not ( = ?auto_375646 ?auto_375655 ) ) ( not ( = ?auto_375646 ?auto_375656 ) ) ( not ( = ?auto_375646 ?auto_375657 ) ) ( not ( = ?auto_375647 ?auto_375648 ) ) ( not ( = ?auto_375647 ?auto_375649 ) ) ( not ( = ?auto_375647 ?auto_375650 ) ) ( not ( = ?auto_375647 ?auto_375651 ) ) ( not ( = ?auto_375647 ?auto_375652 ) ) ( not ( = ?auto_375647 ?auto_375653 ) ) ( not ( = ?auto_375647 ?auto_375654 ) ) ( not ( = ?auto_375647 ?auto_375655 ) ) ( not ( = ?auto_375647 ?auto_375656 ) ) ( not ( = ?auto_375647 ?auto_375657 ) ) ( not ( = ?auto_375648 ?auto_375649 ) ) ( not ( = ?auto_375648 ?auto_375650 ) ) ( not ( = ?auto_375648 ?auto_375651 ) ) ( not ( = ?auto_375648 ?auto_375652 ) ) ( not ( = ?auto_375648 ?auto_375653 ) ) ( not ( = ?auto_375648 ?auto_375654 ) ) ( not ( = ?auto_375648 ?auto_375655 ) ) ( not ( = ?auto_375648 ?auto_375656 ) ) ( not ( = ?auto_375648 ?auto_375657 ) ) ( not ( = ?auto_375649 ?auto_375650 ) ) ( not ( = ?auto_375649 ?auto_375651 ) ) ( not ( = ?auto_375649 ?auto_375652 ) ) ( not ( = ?auto_375649 ?auto_375653 ) ) ( not ( = ?auto_375649 ?auto_375654 ) ) ( not ( = ?auto_375649 ?auto_375655 ) ) ( not ( = ?auto_375649 ?auto_375656 ) ) ( not ( = ?auto_375649 ?auto_375657 ) ) ( not ( = ?auto_375650 ?auto_375651 ) ) ( not ( = ?auto_375650 ?auto_375652 ) ) ( not ( = ?auto_375650 ?auto_375653 ) ) ( not ( = ?auto_375650 ?auto_375654 ) ) ( not ( = ?auto_375650 ?auto_375655 ) ) ( not ( = ?auto_375650 ?auto_375656 ) ) ( not ( = ?auto_375650 ?auto_375657 ) ) ( not ( = ?auto_375651 ?auto_375652 ) ) ( not ( = ?auto_375651 ?auto_375653 ) ) ( not ( = ?auto_375651 ?auto_375654 ) ) ( not ( = ?auto_375651 ?auto_375655 ) ) ( not ( = ?auto_375651 ?auto_375656 ) ) ( not ( = ?auto_375651 ?auto_375657 ) ) ( not ( = ?auto_375652 ?auto_375653 ) ) ( not ( = ?auto_375652 ?auto_375654 ) ) ( not ( = ?auto_375652 ?auto_375655 ) ) ( not ( = ?auto_375652 ?auto_375656 ) ) ( not ( = ?auto_375652 ?auto_375657 ) ) ( not ( = ?auto_375653 ?auto_375654 ) ) ( not ( = ?auto_375653 ?auto_375655 ) ) ( not ( = ?auto_375653 ?auto_375656 ) ) ( not ( = ?auto_375653 ?auto_375657 ) ) ( not ( = ?auto_375654 ?auto_375655 ) ) ( not ( = ?auto_375654 ?auto_375656 ) ) ( not ( = ?auto_375654 ?auto_375657 ) ) ( not ( = ?auto_375655 ?auto_375656 ) ) ( not ( = ?auto_375655 ?auto_375657 ) ) ( not ( = ?auto_375656 ?auto_375657 ) ) ( ON ?auto_375655 ?auto_375656 ) ( ON ?auto_375654 ?auto_375655 ) ( ON ?auto_375653 ?auto_375654 ) ( ON ?auto_375652 ?auto_375653 ) ( CLEAR ?auto_375650 ) ( ON ?auto_375651 ?auto_375652 ) ( CLEAR ?auto_375651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_375642 ?auto_375643 ?auto_375644 ?auto_375645 ?auto_375646 ?auto_375647 ?auto_375648 ?auto_375649 ?auto_375650 ?auto_375651 )
      ( MAKE-15PILE ?auto_375642 ?auto_375643 ?auto_375644 ?auto_375645 ?auto_375646 ?auto_375647 ?auto_375648 ?auto_375649 ?auto_375650 ?auto_375651 ?auto_375652 ?auto_375653 ?auto_375654 ?auto_375655 ?auto_375656 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375673 - BLOCK
      ?auto_375674 - BLOCK
      ?auto_375675 - BLOCK
      ?auto_375676 - BLOCK
      ?auto_375677 - BLOCK
      ?auto_375678 - BLOCK
      ?auto_375679 - BLOCK
      ?auto_375680 - BLOCK
      ?auto_375681 - BLOCK
      ?auto_375682 - BLOCK
      ?auto_375683 - BLOCK
      ?auto_375684 - BLOCK
      ?auto_375685 - BLOCK
      ?auto_375686 - BLOCK
      ?auto_375687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375687 ) ( ON-TABLE ?auto_375673 ) ( ON ?auto_375674 ?auto_375673 ) ( ON ?auto_375675 ?auto_375674 ) ( ON ?auto_375676 ?auto_375675 ) ( ON ?auto_375677 ?auto_375676 ) ( ON ?auto_375678 ?auto_375677 ) ( ON ?auto_375679 ?auto_375678 ) ( ON ?auto_375680 ?auto_375679 ) ( ON ?auto_375681 ?auto_375680 ) ( not ( = ?auto_375673 ?auto_375674 ) ) ( not ( = ?auto_375673 ?auto_375675 ) ) ( not ( = ?auto_375673 ?auto_375676 ) ) ( not ( = ?auto_375673 ?auto_375677 ) ) ( not ( = ?auto_375673 ?auto_375678 ) ) ( not ( = ?auto_375673 ?auto_375679 ) ) ( not ( = ?auto_375673 ?auto_375680 ) ) ( not ( = ?auto_375673 ?auto_375681 ) ) ( not ( = ?auto_375673 ?auto_375682 ) ) ( not ( = ?auto_375673 ?auto_375683 ) ) ( not ( = ?auto_375673 ?auto_375684 ) ) ( not ( = ?auto_375673 ?auto_375685 ) ) ( not ( = ?auto_375673 ?auto_375686 ) ) ( not ( = ?auto_375673 ?auto_375687 ) ) ( not ( = ?auto_375674 ?auto_375675 ) ) ( not ( = ?auto_375674 ?auto_375676 ) ) ( not ( = ?auto_375674 ?auto_375677 ) ) ( not ( = ?auto_375674 ?auto_375678 ) ) ( not ( = ?auto_375674 ?auto_375679 ) ) ( not ( = ?auto_375674 ?auto_375680 ) ) ( not ( = ?auto_375674 ?auto_375681 ) ) ( not ( = ?auto_375674 ?auto_375682 ) ) ( not ( = ?auto_375674 ?auto_375683 ) ) ( not ( = ?auto_375674 ?auto_375684 ) ) ( not ( = ?auto_375674 ?auto_375685 ) ) ( not ( = ?auto_375674 ?auto_375686 ) ) ( not ( = ?auto_375674 ?auto_375687 ) ) ( not ( = ?auto_375675 ?auto_375676 ) ) ( not ( = ?auto_375675 ?auto_375677 ) ) ( not ( = ?auto_375675 ?auto_375678 ) ) ( not ( = ?auto_375675 ?auto_375679 ) ) ( not ( = ?auto_375675 ?auto_375680 ) ) ( not ( = ?auto_375675 ?auto_375681 ) ) ( not ( = ?auto_375675 ?auto_375682 ) ) ( not ( = ?auto_375675 ?auto_375683 ) ) ( not ( = ?auto_375675 ?auto_375684 ) ) ( not ( = ?auto_375675 ?auto_375685 ) ) ( not ( = ?auto_375675 ?auto_375686 ) ) ( not ( = ?auto_375675 ?auto_375687 ) ) ( not ( = ?auto_375676 ?auto_375677 ) ) ( not ( = ?auto_375676 ?auto_375678 ) ) ( not ( = ?auto_375676 ?auto_375679 ) ) ( not ( = ?auto_375676 ?auto_375680 ) ) ( not ( = ?auto_375676 ?auto_375681 ) ) ( not ( = ?auto_375676 ?auto_375682 ) ) ( not ( = ?auto_375676 ?auto_375683 ) ) ( not ( = ?auto_375676 ?auto_375684 ) ) ( not ( = ?auto_375676 ?auto_375685 ) ) ( not ( = ?auto_375676 ?auto_375686 ) ) ( not ( = ?auto_375676 ?auto_375687 ) ) ( not ( = ?auto_375677 ?auto_375678 ) ) ( not ( = ?auto_375677 ?auto_375679 ) ) ( not ( = ?auto_375677 ?auto_375680 ) ) ( not ( = ?auto_375677 ?auto_375681 ) ) ( not ( = ?auto_375677 ?auto_375682 ) ) ( not ( = ?auto_375677 ?auto_375683 ) ) ( not ( = ?auto_375677 ?auto_375684 ) ) ( not ( = ?auto_375677 ?auto_375685 ) ) ( not ( = ?auto_375677 ?auto_375686 ) ) ( not ( = ?auto_375677 ?auto_375687 ) ) ( not ( = ?auto_375678 ?auto_375679 ) ) ( not ( = ?auto_375678 ?auto_375680 ) ) ( not ( = ?auto_375678 ?auto_375681 ) ) ( not ( = ?auto_375678 ?auto_375682 ) ) ( not ( = ?auto_375678 ?auto_375683 ) ) ( not ( = ?auto_375678 ?auto_375684 ) ) ( not ( = ?auto_375678 ?auto_375685 ) ) ( not ( = ?auto_375678 ?auto_375686 ) ) ( not ( = ?auto_375678 ?auto_375687 ) ) ( not ( = ?auto_375679 ?auto_375680 ) ) ( not ( = ?auto_375679 ?auto_375681 ) ) ( not ( = ?auto_375679 ?auto_375682 ) ) ( not ( = ?auto_375679 ?auto_375683 ) ) ( not ( = ?auto_375679 ?auto_375684 ) ) ( not ( = ?auto_375679 ?auto_375685 ) ) ( not ( = ?auto_375679 ?auto_375686 ) ) ( not ( = ?auto_375679 ?auto_375687 ) ) ( not ( = ?auto_375680 ?auto_375681 ) ) ( not ( = ?auto_375680 ?auto_375682 ) ) ( not ( = ?auto_375680 ?auto_375683 ) ) ( not ( = ?auto_375680 ?auto_375684 ) ) ( not ( = ?auto_375680 ?auto_375685 ) ) ( not ( = ?auto_375680 ?auto_375686 ) ) ( not ( = ?auto_375680 ?auto_375687 ) ) ( not ( = ?auto_375681 ?auto_375682 ) ) ( not ( = ?auto_375681 ?auto_375683 ) ) ( not ( = ?auto_375681 ?auto_375684 ) ) ( not ( = ?auto_375681 ?auto_375685 ) ) ( not ( = ?auto_375681 ?auto_375686 ) ) ( not ( = ?auto_375681 ?auto_375687 ) ) ( not ( = ?auto_375682 ?auto_375683 ) ) ( not ( = ?auto_375682 ?auto_375684 ) ) ( not ( = ?auto_375682 ?auto_375685 ) ) ( not ( = ?auto_375682 ?auto_375686 ) ) ( not ( = ?auto_375682 ?auto_375687 ) ) ( not ( = ?auto_375683 ?auto_375684 ) ) ( not ( = ?auto_375683 ?auto_375685 ) ) ( not ( = ?auto_375683 ?auto_375686 ) ) ( not ( = ?auto_375683 ?auto_375687 ) ) ( not ( = ?auto_375684 ?auto_375685 ) ) ( not ( = ?auto_375684 ?auto_375686 ) ) ( not ( = ?auto_375684 ?auto_375687 ) ) ( not ( = ?auto_375685 ?auto_375686 ) ) ( not ( = ?auto_375685 ?auto_375687 ) ) ( not ( = ?auto_375686 ?auto_375687 ) ) ( ON ?auto_375686 ?auto_375687 ) ( ON ?auto_375685 ?auto_375686 ) ( ON ?auto_375684 ?auto_375685 ) ( ON ?auto_375683 ?auto_375684 ) ( CLEAR ?auto_375681 ) ( ON ?auto_375682 ?auto_375683 ) ( CLEAR ?auto_375682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_375673 ?auto_375674 ?auto_375675 ?auto_375676 ?auto_375677 ?auto_375678 ?auto_375679 ?auto_375680 ?auto_375681 ?auto_375682 )
      ( MAKE-15PILE ?auto_375673 ?auto_375674 ?auto_375675 ?auto_375676 ?auto_375677 ?auto_375678 ?auto_375679 ?auto_375680 ?auto_375681 ?auto_375682 ?auto_375683 ?auto_375684 ?auto_375685 ?auto_375686 ?auto_375687 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375703 - BLOCK
      ?auto_375704 - BLOCK
      ?auto_375705 - BLOCK
      ?auto_375706 - BLOCK
      ?auto_375707 - BLOCK
      ?auto_375708 - BLOCK
      ?auto_375709 - BLOCK
      ?auto_375710 - BLOCK
      ?auto_375711 - BLOCK
      ?auto_375712 - BLOCK
      ?auto_375713 - BLOCK
      ?auto_375714 - BLOCK
      ?auto_375715 - BLOCK
      ?auto_375716 - BLOCK
      ?auto_375717 - BLOCK
    )
    :vars
    (
      ?auto_375718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375717 ?auto_375718 ) ( ON-TABLE ?auto_375703 ) ( ON ?auto_375704 ?auto_375703 ) ( ON ?auto_375705 ?auto_375704 ) ( ON ?auto_375706 ?auto_375705 ) ( ON ?auto_375707 ?auto_375706 ) ( ON ?auto_375708 ?auto_375707 ) ( ON ?auto_375709 ?auto_375708 ) ( ON ?auto_375710 ?auto_375709 ) ( not ( = ?auto_375703 ?auto_375704 ) ) ( not ( = ?auto_375703 ?auto_375705 ) ) ( not ( = ?auto_375703 ?auto_375706 ) ) ( not ( = ?auto_375703 ?auto_375707 ) ) ( not ( = ?auto_375703 ?auto_375708 ) ) ( not ( = ?auto_375703 ?auto_375709 ) ) ( not ( = ?auto_375703 ?auto_375710 ) ) ( not ( = ?auto_375703 ?auto_375711 ) ) ( not ( = ?auto_375703 ?auto_375712 ) ) ( not ( = ?auto_375703 ?auto_375713 ) ) ( not ( = ?auto_375703 ?auto_375714 ) ) ( not ( = ?auto_375703 ?auto_375715 ) ) ( not ( = ?auto_375703 ?auto_375716 ) ) ( not ( = ?auto_375703 ?auto_375717 ) ) ( not ( = ?auto_375703 ?auto_375718 ) ) ( not ( = ?auto_375704 ?auto_375705 ) ) ( not ( = ?auto_375704 ?auto_375706 ) ) ( not ( = ?auto_375704 ?auto_375707 ) ) ( not ( = ?auto_375704 ?auto_375708 ) ) ( not ( = ?auto_375704 ?auto_375709 ) ) ( not ( = ?auto_375704 ?auto_375710 ) ) ( not ( = ?auto_375704 ?auto_375711 ) ) ( not ( = ?auto_375704 ?auto_375712 ) ) ( not ( = ?auto_375704 ?auto_375713 ) ) ( not ( = ?auto_375704 ?auto_375714 ) ) ( not ( = ?auto_375704 ?auto_375715 ) ) ( not ( = ?auto_375704 ?auto_375716 ) ) ( not ( = ?auto_375704 ?auto_375717 ) ) ( not ( = ?auto_375704 ?auto_375718 ) ) ( not ( = ?auto_375705 ?auto_375706 ) ) ( not ( = ?auto_375705 ?auto_375707 ) ) ( not ( = ?auto_375705 ?auto_375708 ) ) ( not ( = ?auto_375705 ?auto_375709 ) ) ( not ( = ?auto_375705 ?auto_375710 ) ) ( not ( = ?auto_375705 ?auto_375711 ) ) ( not ( = ?auto_375705 ?auto_375712 ) ) ( not ( = ?auto_375705 ?auto_375713 ) ) ( not ( = ?auto_375705 ?auto_375714 ) ) ( not ( = ?auto_375705 ?auto_375715 ) ) ( not ( = ?auto_375705 ?auto_375716 ) ) ( not ( = ?auto_375705 ?auto_375717 ) ) ( not ( = ?auto_375705 ?auto_375718 ) ) ( not ( = ?auto_375706 ?auto_375707 ) ) ( not ( = ?auto_375706 ?auto_375708 ) ) ( not ( = ?auto_375706 ?auto_375709 ) ) ( not ( = ?auto_375706 ?auto_375710 ) ) ( not ( = ?auto_375706 ?auto_375711 ) ) ( not ( = ?auto_375706 ?auto_375712 ) ) ( not ( = ?auto_375706 ?auto_375713 ) ) ( not ( = ?auto_375706 ?auto_375714 ) ) ( not ( = ?auto_375706 ?auto_375715 ) ) ( not ( = ?auto_375706 ?auto_375716 ) ) ( not ( = ?auto_375706 ?auto_375717 ) ) ( not ( = ?auto_375706 ?auto_375718 ) ) ( not ( = ?auto_375707 ?auto_375708 ) ) ( not ( = ?auto_375707 ?auto_375709 ) ) ( not ( = ?auto_375707 ?auto_375710 ) ) ( not ( = ?auto_375707 ?auto_375711 ) ) ( not ( = ?auto_375707 ?auto_375712 ) ) ( not ( = ?auto_375707 ?auto_375713 ) ) ( not ( = ?auto_375707 ?auto_375714 ) ) ( not ( = ?auto_375707 ?auto_375715 ) ) ( not ( = ?auto_375707 ?auto_375716 ) ) ( not ( = ?auto_375707 ?auto_375717 ) ) ( not ( = ?auto_375707 ?auto_375718 ) ) ( not ( = ?auto_375708 ?auto_375709 ) ) ( not ( = ?auto_375708 ?auto_375710 ) ) ( not ( = ?auto_375708 ?auto_375711 ) ) ( not ( = ?auto_375708 ?auto_375712 ) ) ( not ( = ?auto_375708 ?auto_375713 ) ) ( not ( = ?auto_375708 ?auto_375714 ) ) ( not ( = ?auto_375708 ?auto_375715 ) ) ( not ( = ?auto_375708 ?auto_375716 ) ) ( not ( = ?auto_375708 ?auto_375717 ) ) ( not ( = ?auto_375708 ?auto_375718 ) ) ( not ( = ?auto_375709 ?auto_375710 ) ) ( not ( = ?auto_375709 ?auto_375711 ) ) ( not ( = ?auto_375709 ?auto_375712 ) ) ( not ( = ?auto_375709 ?auto_375713 ) ) ( not ( = ?auto_375709 ?auto_375714 ) ) ( not ( = ?auto_375709 ?auto_375715 ) ) ( not ( = ?auto_375709 ?auto_375716 ) ) ( not ( = ?auto_375709 ?auto_375717 ) ) ( not ( = ?auto_375709 ?auto_375718 ) ) ( not ( = ?auto_375710 ?auto_375711 ) ) ( not ( = ?auto_375710 ?auto_375712 ) ) ( not ( = ?auto_375710 ?auto_375713 ) ) ( not ( = ?auto_375710 ?auto_375714 ) ) ( not ( = ?auto_375710 ?auto_375715 ) ) ( not ( = ?auto_375710 ?auto_375716 ) ) ( not ( = ?auto_375710 ?auto_375717 ) ) ( not ( = ?auto_375710 ?auto_375718 ) ) ( not ( = ?auto_375711 ?auto_375712 ) ) ( not ( = ?auto_375711 ?auto_375713 ) ) ( not ( = ?auto_375711 ?auto_375714 ) ) ( not ( = ?auto_375711 ?auto_375715 ) ) ( not ( = ?auto_375711 ?auto_375716 ) ) ( not ( = ?auto_375711 ?auto_375717 ) ) ( not ( = ?auto_375711 ?auto_375718 ) ) ( not ( = ?auto_375712 ?auto_375713 ) ) ( not ( = ?auto_375712 ?auto_375714 ) ) ( not ( = ?auto_375712 ?auto_375715 ) ) ( not ( = ?auto_375712 ?auto_375716 ) ) ( not ( = ?auto_375712 ?auto_375717 ) ) ( not ( = ?auto_375712 ?auto_375718 ) ) ( not ( = ?auto_375713 ?auto_375714 ) ) ( not ( = ?auto_375713 ?auto_375715 ) ) ( not ( = ?auto_375713 ?auto_375716 ) ) ( not ( = ?auto_375713 ?auto_375717 ) ) ( not ( = ?auto_375713 ?auto_375718 ) ) ( not ( = ?auto_375714 ?auto_375715 ) ) ( not ( = ?auto_375714 ?auto_375716 ) ) ( not ( = ?auto_375714 ?auto_375717 ) ) ( not ( = ?auto_375714 ?auto_375718 ) ) ( not ( = ?auto_375715 ?auto_375716 ) ) ( not ( = ?auto_375715 ?auto_375717 ) ) ( not ( = ?auto_375715 ?auto_375718 ) ) ( not ( = ?auto_375716 ?auto_375717 ) ) ( not ( = ?auto_375716 ?auto_375718 ) ) ( not ( = ?auto_375717 ?auto_375718 ) ) ( ON ?auto_375716 ?auto_375717 ) ( ON ?auto_375715 ?auto_375716 ) ( ON ?auto_375714 ?auto_375715 ) ( ON ?auto_375713 ?auto_375714 ) ( ON ?auto_375712 ?auto_375713 ) ( CLEAR ?auto_375710 ) ( ON ?auto_375711 ?auto_375712 ) ( CLEAR ?auto_375711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_375703 ?auto_375704 ?auto_375705 ?auto_375706 ?auto_375707 ?auto_375708 ?auto_375709 ?auto_375710 ?auto_375711 )
      ( MAKE-15PILE ?auto_375703 ?auto_375704 ?auto_375705 ?auto_375706 ?auto_375707 ?auto_375708 ?auto_375709 ?auto_375710 ?auto_375711 ?auto_375712 ?auto_375713 ?auto_375714 ?auto_375715 ?auto_375716 ?auto_375717 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375734 - BLOCK
      ?auto_375735 - BLOCK
      ?auto_375736 - BLOCK
      ?auto_375737 - BLOCK
      ?auto_375738 - BLOCK
      ?auto_375739 - BLOCK
      ?auto_375740 - BLOCK
      ?auto_375741 - BLOCK
      ?auto_375742 - BLOCK
      ?auto_375743 - BLOCK
      ?auto_375744 - BLOCK
      ?auto_375745 - BLOCK
      ?auto_375746 - BLOCK
      ?auto_375747 - BLOCK
      ?auto_375748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375748 ) ( ON-TABLE ?auto_375734 ) ( ON ?auto_375735 ?auto_375734 ) ( ON ?auto_375736 ?auto_375735 ) ( ON ?auto_375737 ?auto_375736 ) ( ON ?auto_375738 ?auto_375737 ) ( ON ?auto_375739 ?auto_375738 ) ( ON ?auto_375740 ?auto_375739 ) ( ON ?auto_375741 ?auto_375740 ) ( not ( = ?auto_375734 ?auto_375735 ) ) ( not ( = ?auto_375734 ?auto_375736 ) ) ( not ( = ?auto_375734 ?auto_375737 ) ) ( not ( = ?auto_375734 ?auto_375738 ) ) ( not ( = ?auto_375734 ?auto_375739 ) ) ( not ( = ?auto_375734 ?auto_375740 ) ) ( not ( = ?auto_375734 ?auto_375741 ) ) ( not ( = ?auto_375734 ?auto_375742 ) ) ( not ( = ?auto_375734 ?auto_375743 ) ) ( not ( = ?auto_375734 ?auto_375744 ) ) ( not ( = ?auto_375734 ?auto_375745 ) ) ( not ( = ?auto_375734 ?auto_375746 ) ) ( not ( = ?auto_375734 ?auto_375747 ) ) ( not ( = ?auto_375734 ?auto_375748 ) ) ( not ( = ?auto_375735 ?auto_375736 ) ) ( not ( = ?auto_375735 ?auto_375737 ) ) ( not ( = ?auto_375735 ?auto_375738 ) ) ( not ( = ?auto_375735 ?auto_375739 ) ) ( not ( = ?auto_375735 ?auto_375740 ) ) ( not ( = ?auto_375735 ?auto_375741 ) ) ( not ( = ?auto_375735 ?auto_375742 ) ) ( not ( = ?auto_375735 ?auto_375743 ) ) ( not ( = ?auto_375735 ?auto_375744 ) ) ( not ( = ?auto_375735 ?auto_375745 ) ) ( not ( = ?auto_375735 ?auto_375746 ) ) ( not ( = ?auto_375735 ?auto_375747 ) ) ( not ( = ?auto_375735 ?auto_375748 ) ) ( not ( = ?auto_375736 ?auto_375737 ) ) ( not ( = ?auto_375736 ?auto_375738 ) ) ( not ( = ?auto_375736 ?auto_375739 ) ) ( not ( = ?auto_375736 ?auto_375740 ) ) ( not ( = ?auto_375736 ?auto_375741 ) ) ( not ( = ?auto_375736 ?auto_375742 ) ) ( not ( = ?auto_375736 ?auto_375743 ) ) ( not ( = ?auto_375736 ?auto_375744 ) ) ( not ( = ?auto_375736 ?auto_375745 ) ) ( not ( = ?auto_375736 ?auto_375746 ) ) ( not ( = ?auto_375736 ?auto_375747 ) ) ( not ( = ?auto_375736 ?auto_375748 ) ) ( not ( = ?auto_375737 ?auto_375738 ) ) ( not ( = ?auto_375737 ?auto_375739 ) ) ( not ( = ?auto_375737 ?auto_375740 ) ) ( not ( = ?auto_375737 ?auto_375741 ) ) ( not ( = ?auto_375737 ?auto_375742 ) ) ( not ( = ?auto_375737 ?auto_375743 ) ) ( not ( = ?auto_375737 ?auto_375744 ) ) ( not ( = ?auto_375737 ?auto_375745 ) ) ( not ( = ?auto_375737 ?auto_375746 ) ) ( not ( = ?auto_375737 ?auto_375747 ) ) ( not ( = ?auto_375737 ?auto_375748 ) ) ( not ( = ?auto_375738 ?auto_375739 ) ) ( not ( = ?auto_375738 ?auto_375740 ) ) ( not ( = ?auto_375738 ?auto_375741 ) ) ( not ( = ?auto_375738 ?auto_375742 ) ) ( not ( = ?auto_375738 ?auto_375743 ) ) ( not ( = ?auto_375738 ?auto_375744 ) ) ( not ( = ?auto_375738 ?auto_375745 ) ) ( not ( = ?auto_375738 ?auto_375746 ) ) ( not ( = ?auto_375738 ?auto_375747 ) ) ( not ( = ?auto_375738 ?auto_375748 ) ) ( not ( = ?auto_375739 ?auto_375740 ) ) ( not ( = ?auto_375739 ?auto_375741 ) ) ( not ( = ?auto_375739 ?auto_375742 ) ) ( not ( = ?auto_375739 ?auto_375743 ) ) ( not ( = ?auto_375739 ?auto_375744 ) ) ( not ( = ?auto_375739 ?auto_375745 ) ) ( not ( = ?auto_375739 ?auto_375746 ) ) ( not ( = ?auto_375739 ?auto_375747 ) ) ( not ( = ?auto_375739 ?auto_375748 ) ) ( not ( = ?auto_375740 ?auto_375741 ) ) ( not ( = ?auto_375740 ?auto_375742 ) ) ( not ( = ?auto_375740 ?auto_375743 ) ) ( not ( = ?auto_375740 ?auto_375744 ) ) ( not ( = ?auto_375740 ?auto_375745 ) ) ( not ( = ?auto_375740 ?auto_375746 ) ) ( not ( = ?auto_375740 ?auto_375747 ) ) ( not ( = ?auto_375740 ?auto_375748 ) ) ( not ( = ?auto_375741 ?auto_375742 ) ) ( not ( = ?auto_375741 ?auto_375743 ) ) ( not ( = ?auto_375741 ?auto_375744 ) ) ( not ( = ?auto_375741 ?auto_375745 ) ) ( not ( = ?auto_375741 ?auto_375746 ) ) ( not ( = ?auto_375741 ?auto_375747 ) ) ( not ( = ?auto_375741 ?auto_375748 ) ) ( not ( = ?auto_375742 ?auto_375743 ) ) ( not ( = ?auto_375742 ?auto_375744 ) ) ( not ( = ?auto_375742 ?auto_375745 ) ) ( not ( = ?auto_375742 ?auto_375746 ) ) ( not ( = ?auto_375742 ?auto_375747 ) ) ( not ( = ?auto_375742 ?auto_375748 ) ) ( not ( = ?auto_375743 ?auto_375744 ) ) ( not ( = ?auto_375743 ?auto_375745 ) ) ( not ( = ?auto_375743 ?auto_375746 ) ) ( not ( = ?auto_375743 ?auto_375747 ) ) ( not ( = ?auto_375743 ?auto_375748 ) ) ( not ( = ?auto_375744 ?auto_375745 ) ) ( not ( = ?auto_375744 ?auto_375746 ) ) ( not ( = ?auto_375744 ?auto_375747 ) ) ( not ( = ?auto_375744 ?auto_375748 ) ) ( not ( = ?auto_375745 ?auto_375746 ) ) ( not ( = ?auto_375745 ?auto_375747 ) ) ( not ( = ?auto_375745 ?auto_375748 ) ) ( not ( = ?auto_375746 ?auto_375747 ) ) ( not ( = ?auto_375746 ?auto_375748 ) ) ( not ( = ?auto_375747 ?auto_375748 ) ) ( ON ?auto_375747 ?auto_375748 ) ( ON ?auto_375746 ?auto_375747 ) ( ON ?auto_375745 ?auto_375746 ) ( ON ?auto_375744 ?auto_375745 ) ( ON ?auto_375743 ?auto_375744 ) ( CLEAR ?auto_375741 ) ( ON ?auto_375742 ?auto_375743 ) ( CLEAR ?auto_375742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_375734 ?auto_375735 ?auto_375736 ?auto_375737 ?auto_375738 ?auto_375739 ?auto_375740 ?auto_375741 ?auto_375742 )
      ( MAKE-15PILE ?auto_375734 ?auto_375735 ?auto_375736 ?auto_375737 ?auto_375738 ?auto_375739 ?auto_375740 ?auto_375741 ?auto_375742 ?auto_375743 ?auto_375744 ?auto_375745 ?auto_375746 ?auto_375747 ?auto_375748 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375764 - BLOCK
      ?auto_375765 - BLOCK
      ?auto_375766 - BLOCK
      ?auto_375767 - BLOCK
      ?auto_375768 - BLOCK
      ?auto_375769 - BLOCK
      ?auto_375770 - BLOCK
      ?auto_375771 - BLOCK
      ?auto_375772 - BLOCK
      ?auto_375773 - BLOCK
      ?auto_375774 - BLOCK
      ?auto_375775 - BLOCK
      ?auto_375776 - BLOCK
      ?auto_375777 - BLOCK
      ?auto_375778 - BLOCK
    )
    :vars
    (
      ?auto_375779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375778 ?auto_375779 ) ( ON-TABLE ?auto_375764 ) ( ON ?auto_375765 ?auto_375764 ) ( ON ?auto_375766 ?auto_375765 ) ( ON ?auto_375767 ?auto_375766 ) ( ON ?auto_375768 ?auto_375767 ) ( ON ?auto_375769 ?auto_375768 ) ( ON ?auto_375770 ?auto_375769 ) ( not ( = ?auto_375764 ?auto_375765 ) ) ( not ( = ?auto_375764 ?auto_375766 ) ) ( not ( = ?auto_375764 ?auto_375767 ) ) ( not ( = ?auto_375764 ?auto_375768 ) ) ( not ( = ?auto_375764 ?auto_375769 ) ) ( not ( = ?auto_375764 ?auto_375770 ) ) ( not ( = ?auto_375764 ?auto_375771 ) ) ( not ( = ?auto_375764 ?auto_375772 ) ) ( not ( = ?auto_375764 ?auto_375773 ) ) ( not ( = ?auto_375764 ?auto_375774 ) ) ( not ( = ?auto_375764 ?auto_375775 ) ) ( not ( = ?auto_375764 ?auto_375776 ) ) ( not ( = ?auto_375764 ?auto_375777 ) ) ( not ( = ?auto_375764 ?auto_375778 ) ) ( not ( = ?auto_375764 ?auto_375779 ) ) ( not ( = ?auto_375765 ?auto_375766 ) ) ( not ( = ?auto_375765 ?auto_375767 ) ) ( not ( = ?auto_375765 ?auto_375768 ) ) ( not ( = ?auto_375765 ?auto_375769 ) ) ( not ( = ?auto_375765 ?auto_375770 ) ) ( not ( = ?auto_375765 ?auto_375771 ) ) ( not ( = ?auto_375765 ?auto_375772 ) ) ( not ( = ?auto_375765 ?auto_375773 ) ) ( not ( = ?auto_375765 ?auto_375774 ) ) ( not ( = ?auto_375765 ?auto_375775 ) ) ( not ( = ?auto_375765 ?auto_375776 ) ) ( not ( = ?auto_375765 ?auto_375777 ) ) ( not ( = ?auto_375765 ?auto_375778 ) ) ( not ( = ?auto_375765 ?auto_375779 ) ) ( not ( = ?auto_375766 ?auto_375767 ) ) ( not ( = ?auto_375766 ?auto_375768 ) ) ( not ( = ?auto_375766 ?auto_375769 ) ) ( not ( = ?auto_375766 ?auto_375770 ) ) ( not ( = ?auto_375766 ?auto_375771 ) ) ( not ( = ?auto_375766 ?auto_375772 ) ) ( not ( = ?auto_375766 ?auto_375773 ) ) ( not ( = ?auto_375766 ?auto_375774 ) ) ( not ( = ?auto_375766 ?auto_375775 ) ) ( not ( = ?auto_375766 ?auto_375776 ) ) ( not ( = ?auto_375766 ?auto_375777 ) ) ( not ( = ?auto_375766 ?auto_375778 ) ) ( not ( = ?auto_375766 ?auto_375779 ) ) ( not ( = ?auto_375767 ?auto_375768 ) ) ( not ( = ?auto_375767 ?auto_375769 ) ) ( not ( = ?auto_375767 ?auto_375770 ) ) ( not ( = ?auto_375767 ?auto_375771 ) ) ( not ( = ?auto_375767 ?auto_375772 ) ) ( not ( = ?auto_375767 ?auto_375773 ) ) ( not ( = ?auto_375767 ?auto_375774 ) ) ( not ( = ?auto_375767 ?auto_375775 ) ) ( not ( = ?auto_375767 ?auto_375776 ) ) ( not ( = ?auto_375767 ?auto_375777 ) ) ( not ( = ?auto_375767 ?auto_375778 ) ) ( not ( = ?auto_375767 ?auto_375779 ) ) ( not ( = ?auto_375768 ?auto_375769 ) ) ( not ( = ?auto_375768 ?auto_375770 ) ) ( not ( = ?auto_375768 ?auto_375771 ) ) ( not ( = ?auto_375768 ?auto_375772 ) ) ( not ( = ?auto_375768 ?auto_375773 ) ) ( not ( = ?auto_375768 ?auto_375774 ) ) ( not ( = ?auto_375768 ?auto_375775 ) ) ( not ( = ?auto_375768 ?auto_375776 ) ) ( not ( = ?auto_375768 ?auto_375777 ) ) ( not ( = ?auto_375768 ?auto_375778 ) ) ( not ( = ?auto_375768 ?auto_375779 ) ) ( not ( = ?auto_375769 ?auto_375770 ) ) ( not ( = ?auto_375769 ?auto_375771 ) ) ( not ( = ?auto_375769 ?auto_375772 ) ) ( not ( = ?auto_375769 ?auto_375773 ) ) ( not ( = ?auto_375769 ?auto_375774 ) ) ( not ( = ?auto_375769 ?auto_375775 ) ) ( not ( = ?auto_375769 ?auto_375776 ) ) ( not ( = ?auto_375769 ?auto_375777 ) ) ( not ( = ?auto_375769 ?auto_375778 ) ) ( not ( = ?auto_375769 ?auto_375779 ) ) ( not ( = ?auto_375770 ?auto_375771 ) ) ( not ( = ?auto_375770 ?auto_375772 ) ) ( not ( = ?auto_375770 ?auto_375773 ) ) ( not ( = ?auto_375770 ?auto_375774 ) ) ( not ( = ?auto_375770 ?auto_375775 ) ) ( not ( = ?auto_375770 ?auto_375776 ) ) ( not ( = ?auto_375770 ?auto_375777 ) ) ( not ( = ?auto_375770 ?auto_375778 ) ) ( not ( = ?auto_375770 ?auto_375779 ) ) ( not ( = ?auto_375771 ?auto_375772 ) ) ( not ( = ?auto_375771 ?auto_375773 ) ) ( not ( = ?auto_375771 ?auto_375774 ) ) ( not ( = ?auto_375771 ?auto_375775 ) ) ( not ( = ?auto_375771 ?auto_375776 ) ) ( not ( = ?auto_375771 ?auto_375777 ) ) ( not ( = ?auto_375771 ?auto_375778 ) ) ( not ( = ?auto_375771 ?auto_375779 ) ) ( not ( = ?auto_375772 ?auto_375773 ) ) ( not ( = ?auto_375772 ?auto_375774 ) ) ( not ( = ?auto_375772 ?auto_375775 ) ) ( not ( = ?auto_375772 ?auto_375776 ) ) ( not ( = ?auto_375772 ?auto_375777 ) ) ( not ( = ?auto_375772 ?auto_375778 ) ) ( not ( = ?auto_375772 ?auto_375779 ) ) ( not ( = ?auto_375773 ?auto_375774 ) ) ( not ( = ?auto_375773 ?auto_375775 ) ) ( not ( = ?auto_375773 ?auto_375776 ) ) ( not ( = ?auto_375773 ?auto_375777 ) ) ( not ( = ?auto_375773 ?auto_375778 ) ) ( not ( = ?auto_375773 ?auto_375779 ) ) ( not ( = ?auto_375774 ?auto_375775 ) ) ( not ( = ?auto_375774 ?auto_375776 ) ) ( not ( = ?auto_375774 ?auto_375777 ) ) ( not ( = ?auto_375774 ?auto_375778 ) ) ( not ( = ?auto_375774 ?auto_375779 ) ) ( not ( = ?auto_375775 ?auto_375776 ) ) ( not ( = ?auto_375775 ?auto_375777 ) ) ( not ( = ?auto_375775 ?auto_375778 ) ) ( not ( = ?auto_375775 ?auto_375779 ) ) ( not ( = ?auto_375776 ?auto_375777 ) ) ( not ( = ?auto_375776 ?auto_375778 ) ) ( not ( = ?auto_375776 ?auto_375779 ) ) ( not ( = ?auto_375777 ?auto_375778 ) ) ( not ( = ?auto_375777 ?auto_375779 ) ) ( not ( = ?auto_375778 ?auto_375779 ) ) ( ON ?auto_375777 ?auto_375778 ) ( ON ?auto_375776 ?auto_375777 ) ( ON ?auto_375775 ?auto_375776 ) ( ON ?auto_375774 ?auto_375775 ) ( ON ?auto_375773 ?auto_375774 ) ( ON ?auto_375772 ?auto_375773 ) ( CLEAR ?auto_375770 ) ( ON ?auto_375771 ?auto_375772 ) ( CLEAR ?auto_375771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_375764 ?auto_375765 ?auto_375766 ?auto_375767 ?auto_375768 ?auto_375769 ?auto_375770 ?auto_375771 )
      ( MAKE-15PILE ?auto_375764 ?auto_375765 ?auto_375766 ?auto_375767 ?auto_375768 ?auto_375769 ?auto_375770 ?auto_375771 ?auto_375772 ?auto_375773 ?auto_375774 ?auto_375775 ?auto_375776 ?auto_375777 ?auto_375778 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375795 - BLOCK
      ?auto_375796 - BLOCK
      ?auto_375797 - BLOCK
      ?auto_375798 - BLOCK
      ?auto_375799 - BLOCK
      ?auto_375800 - BLOCK
      ?auto_375801 - BLOCK
      ?auto_375802 - BLOCK
      ?auto_375803 - BLOCK
      ?auto_375804 - BLOCK
      ?auto_375805 - BLOCK
      ?auto_375806 - BLOCK
      ?auto_375807 - BLOCK
      ?auto_375808 - BLOCK
      ?auto_375809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375809 ) ( ON-TABLE ?auto_375795 ) ( ON ?auto_375796 ?auto_375795 ) ( ON ?auto_375797 ?auto_375796 ) ( ON ?auto_375798 ?auto_375797 ) ( ON ?auto_375799 ?auto_375798 ) ( ON ?auto_375800 ?auto_375799 ) ( ON ?auto_375801 ?auto_375800 ) ( not ( = ?auto_375795 ?auto_375796 ) ) ( not ( = ?auto_375795 ?auto_375797 ) ) ( not ( = ?auto_375795 ?auto_375798 ) ) ( not ( = ?auto_375795 ?auto_375799 ) ) ( not ( = ?auto_375795 ?auto_375800 ) ) ( not ( = ?auto_375795 ?auto_375801 ) ) ( not ( = ?auto_375795 ?auto_375802 ) ) ( not ( = ?auto_375795 ?auto_375803 ) ) ( not ( = ?auto_375795 ?auto_375804 ) ) ( not ( = ?auto_375795 ?auto_375805 ) ) ( not ( = ?auto_375795 ?auto_375806 ) ) ( not ( = ?auto_375795 ?auto_375807 ) ) ( not ( = ?auto_375795 ?auto_375808 ) ) ( not ( = ?auto_375795 ?auto_375809 ) ) ( not ( = ?auto_375796 ?auto_375797 ) ) ( not ( = ?auto_375796 ?auto_375798 ) ) ( not ( = ?auto_375796 ?auto_375799 ) ) ( not ( = ?auto_375796 ?auto_375800 ) ) ( not ( = ?auto_375796 ?auto_375801 ) ) ( not ( = ?auto_375796 ?auto_375802 ) ) ( not ( = ?auto_375796 ?auto_375803 ) ) ( not ( = ?auto_375796 ?auto_375804 ) ) ( not ( = ?auto_375796 ?auto_375805 ) ) ( not ( = ?auto_375796 ?auto_375806 ) ) ( not ( = ?auto_375796 ?auto_375807 ) ) ( not ( = ?auto_375796 ?auto_375808 ) ) ( not ( = ?auto_375796 ?auto_375809 ) ) ( not ( = ?auto_375797 ?auto_375798 ) ) ( not ( = ?auto_375797 ?auto_375799 ) ) ( not ( = ?auto_375797 ?auto_375800 ) ) ( not ( = ?auto_375797 ?auto_375801 ) ) ( not ( = ?auto_375797 ?auto_375802 ) ) ( not ( = ?auto_375797 ?auto_375803 ) ) ( not ( = ?auto_375797 ?auto_375804 ) ) ( not ( = ?auto_375797 ?auto_375805 ) ) ( not ( = ?auto_375797 ?auto_375806 ) ) ( not ( = ?auto_375797 ?auto_375807 ) ) ( not ( = ?auto_375797 ?auto_375808 ) ) ( not ( = ?auto_375797 ?auto_375809 ) ) ( not ( = ?auto_375798 ?auto_375799 ) ) ( not ( = ?auto_375798 ?auto_375800 ) ) ( not ( = ?auto_375798 ?auto_375801 ) ) ( not ( = ?auto_375798 ?auto_375802 ) ) ( not ( = ?auto_375798 ?auto_375803 ) ) ( not ( = ?auto_375798 ?auto_375804 ) ) ( not ( = ?auto_375798 ?auto_375805 ) ) ( not ( = ?auto_375798 ?auto_375806 ) ) ( not ( = ?auto_375798 ?auto_375807 ) ) ( not ( = ?auto_375798 ?auto_375808 ) ) ( not ( = ?auto_375798 ?auto_375809 ) ) ( not ( = ?auto_375799 ?auto_375800 ) ) ( not ( = ?auto_375799 ?auto_375801 ) ) ( not ( = ?auto_375799 ?auto_375802 ) ) ( not ( = ?auto_375799 ?auto_375803 ) ) ( not ( = ?auto_375799 ?auto_375804 ) ) ( not ( = ?auto_375799 ?auto_375805 ) ) ( not ( = ?auto_375799 ?auto_375806 ) ) ( not ( = ?auto_375799 ?auto_375807 ) ) ( not ( = ?auto_375799 ?auto_375808 ) ) ( not ( = ?auto_375799 ?auto_375809 ) ) ( not ( = ?auto_375800 ?auto_375801 ) ) ( not ( = ?auto_375800 ?auto_375802 ) ) ( not ( = ?auto_375800 ?auto_375803 ) ) ( not ( = ?auto_375800 ?auto_375804 ) ) ( not ( = ?auto_375800 ?auto_375805 ) ) ( not ( = ?auto_375800 ?auto_375806 ) ) ( not ( = ?auto_375800 ?auto_375807 ) ) ( not ( = ?auto_375800 ?auto_375808 ) ) ( not ( = ?auto_375800 ?auto_375809 ) ) ( not ( = ?auto_375801 ?auto_375802 ) ) ( not ( = ?auto_375801 ?auto_375803 ) ) ( not ( = ?auto_375801 ?auto_375804 ) ) ( not ( = ?auto_375801 ?auto_375805 ) ) ( not ( = ?auto_375801 ?auto_375806 ) ) ( not ( = ?auto_375801 ?auto_375807 ) ) ( not ( = ?auto_375801 ?auto_375808 ) ) ( not ( = ?auto_375801 ?auto_375809 ) ) ( not ( = ?auto_375802 ?auto_375803 ) ) ( not ( = ?auto_375802 ?auto_375804 ) ) ( not ( = ?auto_375802 ?auto_375805 ) ) ( not ( = ?auto_375802 ?auto_375806 ) ) ( not ( = ?auto_375802 ?auto_375807 ) ) ( not ( = ?auto_375802 ?auto_375808 ) ) ( not ( = ?auto_375802 ?auto_375809 ) ) ( not ( = ?auto_375803 ?auto_375804 ) ) ( not ( = ?auto_375803 ?auto_375805 ) ) ( not ( = ?auto_375803 ?auto_375806 ) ) ( not ( = ?auto_375803 ?auto_375807 ) ) ( not ( = ?auto_375803 ?auto_375808 ) ) ( not ( = ?auto_375803 ?auto_375809 ) ) ( not ( = ?auto_375804 ?auto_375805 ) ) ( not ( = ?auto_375804 ?auto_375806 ) ) ( not ( = ?auto_375804 ?auto_375807 ) ) ( not ( = ?auto_375804 ?auto_375808 ) ) ( not ( = ?auto_375804 ?auto_375809 ) ) ( not ( = ?auto_375805 ?auto_375806 ) ) ( not ( = ?auto_375805 ?auto_375807 ) ) ( not ( = ?auto_375805 ?auto_375808 ) ) ( not ( = ?auto_375805 ?auto_375809 ) ) ( not ( = ?auto_375806 ?auto_375807 ) ) ( not ( = ?auto_375806 ?auto_375808 ) ) ( not ( = ?auto_375806 ?auto_375809 ) ) ( not ( = ?auto_375807 ?auto_375808 ) ) ( not ( = ?auto_375807 ?auto_375809 ) ) ( not ( = ?auto_375808 ?auto_375809 ) ) ( ON ?auto_375808 ?auto_375809 ) ( ON ?auto_375807 ?auto_375808 ) ( ON ?auto_375806 ?auto_375807 ) ( ON ?auto_375805 ?auto_375806 ) ( ON ?auto_375804 ?auto_375805 ) ( ON ?auto_375803 ?auto_375804 ) ( CLEAR ?auto_375801 ) ( ON ?auto_375802 ?auto_375803 ) ( CLEAR ?auto_375802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_375795 ?auto_375796 ?auto_375797 ?auto_375798 ?auto_375799 ?auto_375800 ?auto_375801 ?auto_375802 )
      ( MAKE-15PILE ?auto_375795 ?auto_375796 ?auto_375797 ?auto_375798 ?auto_375799 ?auto_375800 ?auto_375801 ?auto_375802 ?auto_375803 ?auto_375804 ?auto_375805 ?auto_375806 ?auto_375807 ?auto_375808 ?auto_375809 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375825 - BLOCK
      ?auto_375826 - BLOCK
      ?auto_375827 - BLOCK
      ?auto_375828 - BLOCK
      ?auto_375829 - BLOCK
      ?auto_375830 - BLOCK
      ?auto_375831 - BLOCK
      ?auto_375832 - BLOCK
      ?auto_375833 - BLOCK
      ?auto_375834 - BLOCK
      ?auto_375835 - BLOCK
      ?auto_375836 - BLOCK
      ?auto_375837 - BLOCK
      ?auto_375838 - BLOCK
      ?auto_375839 - BLOCK
    )
    :vars
    (
      ?auto_375840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375839 ?auto_375840 ) ( ON-TABLE ?auto_375825 ) ( ON ?auto_375826 ?auto_375825 ) ( ON ?auto_375827 ?auto_375826 ) ( ON ?auto_375828 ?auto_375827 ) ( ON ?auto_375829 ?auto_375828 ) ( ON ?auto_375830 ?auto_375829 ) ( not ( = ?auto_375825 ?auto_375826 ) ) ( not ( = ?auto_375825 ?auto_375827 ) ) ( not ( = ?auto_375825 ?auto_375828 ) ) ( not ( = ?auto_375825 ?auto_375829 ) ) ( not ( = ?auto_375825 ?auto_375830 ) ) ( not ( = ?auto_375825 ?auto_375831 ) ) ( not ( = ?auto_375825 ?auto_375832 ) ) ( not ( = ?auto_375825 ?auto_375833 ) ) ( not ( = ?auto_375825 ?auto_375834 ) ) ( not ( = ?auto_375825 ?auto_375835 ) ) ( not ( = ?auto_375825 ?auto_375836 ) ) ( not ( = ?auto_375825 ?auto_375837 ) ) ( not ( = ?auto_375825 ?auto_375838 ) ) ( not ( = ?auto_375825 ?auto_375839 ) ) ( not ( = ?auto_375825 ?auto_375840 ) ) ( not ( = ?auto_375826 ?auto_375827 ) ) ( not ( = ?auto_375826 ?auto_375828 ) ) ( not ( = ?auto_375826 ?auto_375829 ) ) ( not ( = ?auto_375826 ?auto_375830 ) ) ( not ( = ?auto_375826 ?auto_375831 ) ) ( not ( = ?auto_375826 ?auto_375832 ) ) ( not ( = ?auto_375826 ?auto_375833 ) ) ( not ( = ?auto_375826 ?auto_375834 ) ) ( not ( = ?auto_375826 ?auto_375835 ) ) ( not ( = ?auto_375826 ?auto_375836 ) ) ( not ( = ?auto_375826 ?auto_375837 ) ) ( not ( = ?auto_375826 ?auto_375838 ) ) ( not ( = ?auto_375826 ?auto_375839 ) ) ( not ( = ?auto_375826 ?auto_375840 ) ) ( not ( = ?auto_375827 ?auto_375828 ) ) ( not ( = ?auto_375827 ?auto_375829 ) ) ( not ( = ?auto_375827 ?auto_375830 ) ) ( not ( = ?auto_375827 ?auto_375831 ) ) ( not ( = ?auto_375827 ?auto_375832 ) ) ( not ( = ?auto_375827 ?auto_375833 ) ) ( not ( = ?auto_375827 ?auto_375834 ) ) ( not ( = ?auto_375827 ?auto_375835 ) ) ( not ( = ?auto_375827 ?auto_375836 ) ) ( not ( = ?auto_375827 ?auto_375837 ) ) ( not ( = ?auto_375827 ?auto_375838 ) ) ( not ( = ?auto_375827 ?auto_375839 ) ) ( not ( = ?auto_375827 ?auto_375840 ) ) ( not ( = ?auto_375828 ?auto_375829 ) ) ( not ( = ?auto_375828 ?auto_375830 ) ) ( not ( = ?auto_375828 ?auto_375831 ) ) ( not ( = ?auto_375828 ?auto_375832 ) ) ( not ( = ?auto_375828 ?auto_375833 ) ) ( not ( = ?auto_375828 ?auto_375834 ) ) ( not ( = ?auto_375828 ?auto_375835 ) ) ( not ( = ?auto_375828 ?auto_375836 ) ) ( not ( = ?auto_375828 ?auto_375837 ) ) ( not ( = ?auto_375828 ?auto_375838 ) ) ( not ( = ?auto_375828 ?auto_375839 ) ) ( not ( = ?auto_375828 ?auto_375840 ) ) ( not ( = ?auto_375829 ?auto_375830 ) ) ( not ( = ?auto_375829 ?auto_375831 ) ) ( not ( = ?auto_375829 ?auto_375832 ) ) ( not ( = ?auto_375829 ?auto_375833 ) ) ( not ( = ?auto_375829 ?auto_375834 ) ) ( not ( = ?auto_375829 ?auto_375835 ) ) ( not ( = ?auto_375829 ?auto_375836 ) ) ( not ( = ?auto_375829 ?auto_375837 ) ) ( not ( = ?auto_375829 ?auto_375838 ) ) ( not ( = ?auto_375829 ?auto_375839 ) ) ( not ( = ?auto_375829 ?auto_375840 ) ) ( not ( = ?auto_375830 ?auto_375831 ) ) ( not ( = ?auto_375830 ?auto_375832 ) ) ( not ( = ?auto_375830 ?auto_375833 ) ) ( not ( = ?auto_375830 ?auto_375834 ) ) ( not ( = ?auto_375830 ?auto_375835 ) ) ( not ( = ?auto_375830 ?auto_375836 ) ) ( not ( = ?auto_375830 ?auto_375837 ) ) ( not ( = ?auto_375830 ?auto_375838 ) ) ( not ( = ?auto_375830 ?auto_375839 ) ) ( not ( = ?auto_375830 ?auto_375840 ) ) ( not ( = ?auto_375831 ?auto_375832 ) ) ( not ( = ?auto_375831 ?auto_375833 ) ) ( not ( = ?auto_375831 ?auto_375834 ) ) ( not ( = ?auto_375831 ?auto_375835 ) ) ( not ( = ?auto_375831 ?auto_375836 ) ) ( not ( = ?auto_375831 ?auto_375837 ) ) ( not ( = ?auto_375831 ?auto_375838 ) ) ( not ( = ?auto_375831 ?auto_375839 ) ) ( not ( = ?auto_375831 ?auto_375840 ) ) ( not ( = ?auto_375832 ?auto_375833 ) ) ( not ( = ?auto_375832 ?auto_375834 ) ) ( not ( = ?auto_375832 ?auto_375835 ) ) ( not ( = ?auto_375832 ?auto_375836 ) ) ( not ( = ?auto_375832 ?auto_375837 ) ) ( not ( = ?auto_375832 ?auto_375838 ) ) ( not ( = ?auto_375832 ?auto_375839 ) ) ( not ( = ?auto_375832 ?auto_375840 ) ) ( not ( = ?auto_375833 ?auto_375834 ) ) ( not ( = ?auto_375833 ?auto_375835 ) ) ( not ( = ?auto_375833 ?auto_375836 ) ) ( not ( = ?auto_375833 ?auto_375837 ) ) ( not ( = ?auto_375833 ?auto_375838 ) ) ( not ( = ?auto_375833 ?auto_375839 ) ) ( not ( = ?auto_375833 ?auto_375840 ) ) ( not ( = ?auto_375834 ?auto_375835 ) ) ( not ( = ?auto_375834 ?auto_375836 ) ) ( not ( = ?auto_375834 ?auto_375837 ) ) ( not ( = ?auto_375834 ?auto_375838 ) ) ( not ( = ?auto_375834 ?auto_375839 ) ) ( not ( = ?auto_375834 ?auto_375840 ) ) ( not ( = ?auto_375835 ?auto_375836 ) ) ( not ( = ?auto_375835 ?auto_375837 ) ) ( not ( = ?auto_375835 ?auto_375838 ) ) ( not ( = ?auto_375835 ?auto_375839 ) ) ( not ( = ?auto_375835 ?auto_375840 ) ) ( not ( = ?auto_375836 ?auto_375837 ) ) ( not ( = ?auto_375836 ?auto_375838 ) ) ( not ( = ?auto_375836 ?auto_375839 ) ) ( not ( = ?auto_375836 ?auto_375840 ) ) ( not ( = ?auto_375837 ?auto_375838 ) ) ( not ( = ?auto_375837 ?auto_375839 ) ) ( not ( = ?auto_375837 ?auto_375840 ) ) ( not ( = ?auto_375838 ?auto_375839 ) ) ( not ( = ?auto_375838 ?auto_375840 ) ) ( not ( = ?auto_375839 ?auto_375840 ) ) ( ON ?auto_375838 ?auto_375839 ) ( ON ?auto_375837 ?auto_375838 ) ( ON ?auto_375836 ?auto_375837 ) ( ON ?auto_375835 ?auto_375836 ) ( ON ?auto_375834 ?auto_375835 ) ( ON ?auto_375833 ?auto_375834 ) ( ON ?auto_375832 ?auto_375833 ) ( CLEAR ?auto_375830 ) ( ON ?auto_375831 ?auto_375832 ) ( CLEAR ?auto_375831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_375825 ?auto_375826 ?auto_375827 ?auto_375828 ?auto_375829 ?auto_375830 ?auto_375831 )
      ( MAKE-15PILE ?auto_375825 ?auto_375826 ?auto_375827 ?auto_375828 ?auto_375829 ?auto_375830 ?auto_375831 ?auto_375832 ?auto_375833 ?auto_375834 ?auto_375835 ?auto_375836 ?auto_375837 ?auto_375838 ?auto_375839 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375856 - BLOCK
      ?auto_375857 - BLOCK
      ?auto_375858 - BLOCK
      ?auto_375859 - BLOCK
      ?auto_375860 - BLOCK
      ?auto_375861 - BLOCK
      ?auto_375862 - BLOCK
      ?auto_375863 - BLOCK
      ?auto_375864 - BLOCK
      ?auto_375865 - BLOCK
      ?auto_375866 - BLOCK
      ?auto_375867 - BLOCK
      ?auto_375868 - BLOCK
      ?auto_375869 - BLOCK
      ?auto_375870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375870 ) ( ON-TABLE ?auto_375856 ) ( ON ?auto_375857 ?auto_375856 ) ( ON ?auto_375858 ?auto_375857 ) ( ON ?auto_375859 ?auto_375858 ) ( ON ?auto_375860 ?auto_375859 ) ( ON ?auto_375861 ?auto_375860 ) ( not ( = ?auto_375856 ?auto_375857 ) ) ( not ( = ?auto_375856 ?auto_375858 ) ) ( not ( = ?auto_375856 ?auto_375859 ) ) ( not ( = ?auto_375856 ?auto_375860 ) ) ( not ( = ?auto_375856 ?auto_375861 ) ) ( not ( = ?auto_375856 ?auto_375862 ) ) ( not ( = ?auto_375856 ?auto_375863 ) ) ( not ( = ?auto_375856 ?auto_375864 ) ) ( not ( = ?auto_375856 ?auto_375865 ) ) ( not ( = ?auto_375856 ?auto_375866 ) ) ( not ( = ?auto_375856 ?auto_375867 ) ) ( not ( = ?auto_375856 ?auto_375868 ) ) ( not ( = ?auto_375856 ?auto_375869 ) ) ( not ( = ?auto_375856 ?auto_375870 ) ) ( not ( = ?auto_375857 ?auto_375858 ) ) ( not ( = ?auto_375857 ?auto_375859 ) ) ( not ( = ?auto_375857 ?auto_375860 ) ) ( not ( = ?auto_375857 ?auto_375861 ) ) ( not ( = ?auto_375857 ?auto_375862 ) ) ( not ( = ?auto_375857 ?auto_375863 ) ) ( not ( = ?auto_375857 ?auto_375864 ) ) ( not ( = ?auto_375857 ?auto_375865 ) ) ( not ( = ?auto_375857 ?auto_375866 ) ) ( not ( = ?auto_375857 ?auto_375867 ) ) ( not ( = ?auto_375857 ?auto_375868 ) ) ( not ( = ?auto_375857 ?auto_375869 ) ) ( not ( = ?auto_375857 ?auto_375870 ) ) ( not ( = ?auto_375858 ?auto_375859 ) ) ( not ( = ?auto_375858 ?auto_375860 ) ) ( not ( = ?auto_375858 ?auto_375861 ) ) ( not ( = ?auto_375858 ?auto_375862 ) ) ( not ( = ?auto_375858 ?auto_375863 ) ) ( not ( = ?auto_375858 ?auto_375864 ) ) ( not ( = ?auto_375858 ?auto_375865 ) ) ( not ( = ?auto_375858 ?auto_375866 ) ) ( not ( = ?auto_375858 ?auto_375867 ) ) ( not ( = ?auto_375858 ?auto_375868 ) ) ( not ( = ?auto_375858 ?auto_375869 ) ) ( not ( = ?auto_375858 ?auto_375870 ) ) ( not ( = ?auto_375859 ?auto_375860 ) ) ( not ( = ?auto_375859 ?auto_375861 ) ) ( not ( = ?auto_375859 ?auto_375862 ) ) ( not ( = ?auto_375859 ?auto_375863 ) ) ( not ( = ?auto_375859 ?auto_375864 ) ) ( not ( = ?auto_375859 ?auto_375865 ) ) ( not ( = ?auto_375859 ?auto_375866 ) ) ( not ( = ?auto_375859 ?auto_375867 ) ) ( not ( = ?auto_375859 ?auto_375868 ) ) ( not ( = ?auto_375859 ?auto_375869 ) ) ( not ( = ?auto_375859 ?auto_375870 ) ) ( not ( = ?auto_375860 ?auto_375861 ) ) ( not ( = ?auto_375860 ?auto_375862 ) ) ( not ( = ?auto_375860 ?auto_375863 ) ) ( not ( = ?auto_375860 ?auto_375864 ) ) ( not ( = ?auto_375860 ?auto_375865 ) ) ( not ( = ?auto_375860 ?auto_375866 ) ) ( not ( = ?auto_375860 ?auto_375867 ) ) ( not ( = ?auto_375860 ?auto_375868 ) ) ( not ( = ?auto_375860 ?auto_375869 ) ) ( not ( = ?auto_375860 ?auto_375870 ) ) ( not ( = ?auto_375861 ?auto_375862 ) ) ( not ( = ?auto_375861 ?auto_375863 ) ) ( not ( = ?auto_375861 ?auto_375864 ) ) ( not ( = ?auto_375861 ?auto_375865 ) ) ( not ( = ?auto_375861 ?auto_375866 ) ) ( not ( = ?auto_375861 ?auto_375867 ) ) ( not ( = ?auto_375861 ?auto_375868 ) ) ( not ( = ?auto_375861 ?auto_375869 ) ) ( not ( = ?auto_375861 ?auto_375870 ) ) ( not ( = ?auto_375862 ?auto_375863 ) ) ( not ( = ?auto_375862 ?auto_375864 ) ) ( not ( = ?auto_375862 ?auto_375865 ) ) ( not ( = ?auto_375862 ?auto_375866 ) ) ( not ( = ?auto_375862 ?auto_375867 ) ) ( not ( = ?auto_375862 ?auto_375868 ) ) ( not ( = ?auto_375862 ?auto_375869 ) ) ( not ( = ?auto_375862 ?auto_375870 ) ) ( not ( = ?auto_375863 ?auto_375864 ) ) ( not ( = ?auto_375863 ?auto_375865 ) ) ( not ( = ?auto_375863 ?auto_375866 ) ) ( not ( = ?auto_375863 ?auto_375867 ) ) ( not ( = ?auto_375863 ?auto_375868 ) ) ( not ( = ?auto_375863 ?auto_375869 ) ) ( not ( = ?auto_375863 ?auto_375870 ) ) ( not ( = ?auto_375864 ?auto_375865 ) ) ( not ( = ?auto_375864 ?auto_375866 ) ) ( not ( = ?auto_375864 ?auto_375867 ) ) ( not ( = ?auto_375864 ?auto_375868 ) ) ( not ( = ?auto_375864 ?auto_375869 ) ) ( not ( = ?auto_375864 ?auto_375870 ) ) ( not ( = ?auto_375865 ?auto_375866 ) ) ( not ( = ?auto_375865 ?auto_375867 ) ) ( not ( = ?auto_375865 ?auto_375868 ) ) ( not ( = ?auto_375865 ?auto_375869 ) ) ( not ( = ?auto_375865 ?auto_375870 ) ) ( not ( = ?auto_375866 ?auto_375867 ) ) ( not ( = ?auto_375866 ?auto_375868 ) ) ( not ( = ?auto_375866 ?auto_375869 ) ) ( not ( = ?auto_375866 ?auto_375870 ) ) ( not ( = ?auto_375867 ?auto_375868 ) ) ( not ( = ?auto_375867 ?auto_375869 ) ) ( not ( = ?auto_375867 ?auto_375870 ) ) ( not ( = ?auto_375868 ?auto_375869 ) ) ( not ( = ?auto_375868 ?auto_375870 ) ) ( not ( = ?auto_375869 ?auto_375870 ) ) ( ON ?auto_375869 ?auto_375870 ) ( ON ?auto_375868 ?auto_375869 ) ( ON ?auto_375867 ?auto_375868 ) ( ON ?auto_375866 ?auto_375867 ) ( ON ?auto_375865 ?auto_375866 ) ( ON ?auto_375864 ?auto_375865 ) ( ON ?auto_375863 ?auto_375864 ) ( CLEAR ?auto_375861 ) ( ON ?auto_375862 ?auto_375863 ) ( CLEAR ?auto_375862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_375856 ?auto_375857 ?auto_375858 ?auto_375859 ?auto_375860 ?auto_375861 ?auto_375862 )
      ( MAKE-15PILE ?auto_375856 ?auto_375857 ?auto_375858 ?auto_375859 ?auto_375860 ?auto_375861 ?auto_375862 ?auto_375863 ?auto_375864 ?auto_375865 ?auto_375866 ?auto_375867 ?auto_375868 ?auto_375869 ?auto_375870 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375886 - BLOCK
      ?auto_375887 - BLOCK
      ?auto_375888 - BLOCK
      ?auto_375889 - BLOCK
      ?auto_375890 - BLOCK
      ?auto_375891 - BLOCK
      ?auto_375892 - BLOCK
      ?auto_375893 - BLOCK
      ?auto_375894 - BLOCK
      ?auto_375895 - BLOCK
      ?auto_375896 - BLOCK
      ?auto_375897 - BLOCK
      ?auto_375898 - BLOCK
      ?auto_375899 - BLOCK
      ?auto_375900 - BLOCK
    )
    :vars
    (
      ?auto_375901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375900 ?auto_375901 ) ( ON-TABLE ?auto_375886 ) ( ON ?auto_375887 ?auto_375886 ) ( ON ?auto_375888 ?auto_375887 ) ( ON ?auto_375889 ?auto_375888 ) ( ON ?auto_375890 ?auto_375889 ) ( not ( = ?auto_375886 ?auto_375887 ) ) ( not ( = ?auto_375886 ?auto_375888 ) ) ( not ( = ?auto_375886 ?auto_375889 ) ) ( not ( = ?auto_375886 ?auto_375890 ) ) ( not ( = ?auto_375886 ?auto_375891 ) ) ( not ( = ?auto_375886 ?auto_375892 ) ) ( not ( = ?auto_375886 ?auto_375893 ) ) ( not ( = ?auto_375886 ?auto_375894 ) ) ( not ( = ?auto_375886 ?auto_375895 ) ) ( not ( = ?auto_375886 ?auto_375896 ) ) ( not ( = ?auto_375886 ?auto_375897 ) ) ( not ( = ?auto_375886 ?auto_375898 ) ) ( not ( = ?auto_375886 ?auto_375899 ) ) ( not ( = ?auto_375886 ?auto_375900 ) ) ( not ( = ?auto_375886 ?auto_375901 ) ) ( not ( = ?auto_375887 ?auto_375888 ) ) ( not ( = ?auto_375887 ?auto_375889 ) ) ( not ( = ?auto_375887 ?auto_375890 ) ) ( not ( = ?auto_375887 ?auto_375891 ) ) ( not ( = ?auto_375887 ?auto_375892 ) ) ( not ( = ?auto_375887 ?auto_375893 ) ) ( not ( = ?auto_375887 ?auto_375894 ) ) ( not ( = ?auto_375887 ?auto_375895 ) ) ( not ( = ?auto_375887 ?auto_375896 ) ) ( not ( = ?auto_375887 ?auto_375897 ) ) ( not ( = ?auto_375887 ?auto_375898 ) ) ( not ( = ?auto_375887 ?auto_375899 ) ) ( not ( = ?auto_375887 ?auto_375900 ) ) ( not ( = ?auto_375887 ?auto_375901 ) ) ( not ( = ?auto_375888 ?auto_375889 ) ) ( not ( = ?auto_375888 ?auto_375890 ) ) ( not ( = ?auto_375888 ?auto_375891 ) ) ( not ( = ?auto_375888 ?auto_375892 ) ) ( not ( = ?auto_375888 ?auto_375893 ) ) ( not ( = ?auto_375888 ?auto_375894 ) ) ( not ( = ?auto_375888 ?auto_375895 ) ) ( not ( = ?auto_375888 ?auto_375896 ) ) ( not ( = ?auto_375888 ?auto_375897 ) ) ( not ( = ?auto_375888 ?auto_375898 ) ) ( not ( = ?auto_375888 ?auto_375899 ) ) ( not ( = ?auto_375888 ?auto_375900 ) ) ( not ( = ?auto_375888 ?auto_375901 ) ) ( not ( = ?auto_375889 ?auto_375890 ) ) ( not ( = ?auto_375889 ?auto_375891 ) ) ( not ( = ?auto_375889 ?auto_375892 ) ) ( not ( = ?auto_375889 ?auto_375893 ) ) ( not ( = ?auto_375889 ?auto_375894 ) ) ( not ( = ?auto_375889 ?auto_375895 ) ) ( not ( = ?auto_375889 ?auto_375896 ) ) ( not ( = ?auto_375889 ?auto_375897 ) ) ( not ( = ?auto_375889 ?auto_375898 ) ) ( not ( = ?auto_375889 ?auto_375899 ) ) ( not ( = ?auto_375889 ?auto_375900 ) ) ( not ( = ?auto_375889 ?auto_375901 ) ) ( not ( = ?auto_375890 ?auto_375891 ) ) ( not ( = ?auto_375890 ?auto_375892 ) ) ( not ( = ?auto_375890 ?auto_375893 ) ) ( not ( = ?auto_375890 ?auto_375894 ) ) ( not ( = ?auto_375890 ?auto_375895 ) ) ( not ( = ?auto_375890 ?auto_375896 ) ) ( not ( = ?auto_375890 ?auto_375897 ) ) ( not ( = ?auto_375890 ?auto_375898 ) ) ( not ( = ?auto_375890 ?auto_375899 ) ) ( not ( = ?auto_375890 ?auto_375900 ) ) ( not ( = ?auto_375890 ?auto_375901 ) ) ( not ( = ?auto_375891 ?auto_375892 ) ) ( not ( = ?auto_375891 ?auto_375893 ) ) ( not ( = ?auto_375891 ?auto_375894 ) ) ( not ( = ?auto_375891 ?auto_375895 ) ) ( not ( = ?auto_375891 ?auto_375896 ) ) ( not ( = ?auto_375891 ?auto_375897 ) ) ( not ( = ?auto_375891 ?auto_375898 ) ) ( not ( = ?auto_375891 ?auto_375899 ) ) ( not ( = ?auto_375891 ?auto_375900 ) ) ( not ( = ?auto_375891 ?auto_375901 ) ) ( not ( = ?auto_375892 ?auto_375893 ) ) ( not ( = ?auto_375892 ?auto_375894 ) ) ( not ( = ?auto_375892 ?auto_375895 ) ) ( not ( = ?auto_375892 ?auto_375896 ) ) ( not ( = ?auto_375892 ?auto_375897 ) ) ( not ( = ?auto_375892 ?auto_375898 ) ) ( not ( = ?auto_375892 ?auto_375899 ) ) ( not ( = ?auto_375892 ?auto_375900 ) ) ( not ( = ?auto_375892 ?auto_375901 ) ) ( not ( = ?auto_375893 ?auto_375894 ) ) ( not ( = ?auto_375893 ?auto_375895 ) ) ( not ( = ?auto_375893 ?auto_375896 ) ) ( not ( = ?auto_375893 ?auto_375897 ) ) ( not ( = ?auto_375893 ?auto_375898 ) ) ( not ( = ?auto_375893 ?auto_375899 ) ) ( not ( = ?auto_375893 ?auto_375900 ) ) ( not ( = ?auto_375893 ?auto_375901 ) ) ( not ( = ?auto_375894 ?auto_375895 ) ) ( not ( = ?auto_375894 ?auto_375896 ) ) ( not ( = ?auto_375894 ?auto_375897 ) ) ( not ( = ?auto_375894 ?auto_375898 ) ) ( not ( = ?auto_375894 ?auto_375899 ) ) ( not ( = ?auto_375894 ?auto_375900 ) ) ( not ( = ?auto_375894 ?auto_375901 ) ) ( not ( = ?auto_375895 ?auto_375896 ) ) ( not ( = ?auto_375895 ?auto_375897 ) ) ( not ( = ?auto_375895 ?auto_375898 ) ) ( not ( = ?auto_375895 ?auto_375899 ) ) ( not ( = ?auto_375895 ?auto_375900 ) ) ( not ( = ?auto_375895 ?auto_375901 ) ) ( not ( = ?auto_375896 ?auto_375897 ) ) ( not ( = ?auto_375896 ?auto_375898 ) ) ( not ( = ?auto_375896 ?auto_375899 ) ) ( not ( = ?auto_375896 ?auto_375900 ) ) ( not ( = ?auto_375896 ?auto_375901 ) ) ( not ( = ?auto_375897 ?auto_375898 ) ) ( not ( = ?auto_375897 ?auto_375899 ) ) ( not ( = ?auto_375897 ?auto_375900 ) ) ( not ( = ?auto_375897 ?auto_375901 ) ) ( not ( = ?auto_375898 ?auto_375899 ) ) ( not ( = ?auto_375898 ?auto_375900 ) ) ( not ( = ?auto_375898 ?auto_375901 ) ) ( not ( = ?auto_375899 ?auto_375900 ) ) ( not ( = ?auto_375899 ?auto_375901 ) ) ( not ( = ?auto_375900 ?auto_375901 ) ) ( ON ?auto_375899 ?auto_375900 ) ( ON ?auto_375898 ?auto_375899 ) ( ON ?auto_375897 ?auto_375898 ) ( ON ?auto_375896 ?auto_375897 ) ( ON ?auto_375895 ?auto_375896 ) ( ON ?auto_375894 ?auto_375895 ) ( ON ?auto_375893 ?auto_375894 ) ( ON ?auto_375892 ?auto_375893 ) ( CLEAR ?auto_375890 ) ( ON ?auto_375891 ?auto_375892 ) ( CLEAR ?auto_375891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_375886 ?auto_375887 ?auto_375888 ?auto_375889 ?auto_375890 ?auto_375891 )
      ( MAKE-15PILE ?auto_375886 ?auto_375887 ?auto_375888 ?auto_375889 ?auto_375890 ?auto_375891 ?auto_375892 ?auto_375893 ?auto_375894 ?auto_375895 ?auto_375896 ?auto_375897 ?auto_375898 ?auto_375899 ?auto_375900 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375917 - BLOCK
      ?auto_375918 - BLOCK
      ?auto_375919 - BLOCK
      ?auto_375920 - BLOCK
      ?auto_375921 - BLOCK
      ?auto_375922 - BLOCK
      ?auto_375923 - BLOCK
      ?auto_375924 - BLOCK
      ?auto_375925 - BLOCK
      ?auto_375926 - BLOCK
      ?auto_375927 - BLOCK
      ?auto_375928 - BLOCK
      ?auto_375929 - BLOCK
      ?auto_375930 - BLOCK
      ?auto_375931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375931 ) ( ON-TABLE ?auto_375917 ) ( ON ?auto_375918 ?auto_375917 ) ( ON ?auto_375919 ?auto_375918 ) ( ON ?auto_375920 ?auto_375919 ) ( ON ?auto_375921 ?auto_375920 ) ( not ( = ?auto_375917 ?auto_375918 ) ) ( not ( = ?auto_375917 ?auto_375919 ) ) ( not ( = ?auto_375917 ?auto_375920 ) ) ( not ( = ?auto_375917 ?auto_375921 ) ) ( not ( = ?auto_375917 ?auto_375922 ) ) ( not ( = ?auto_375917 ?auto_375923 ) ) ( not ( = ?auto_375917 ?auto_375924 ) ) ( not ( = ?auto_375917 ?auto_375925 ) ) ( not ( = ?auto_375917 ?auto_375926 ) ) ( not ( = ?auto_375917 ?auto_375927 ) ) ( not ( = ?auto_375917 ?auto_375928 ) ) ( not ( = ?auto_375917 ?auto_375929 ) ) ( not ( = ?auto_375917 ?auto_375930 ) ) ( not ( = ?auto_375917 ?auto_375931 ) ) ( not ( = ?auto_375918 ?auto_375919 ) ) ( not ( = ?auto_375918 ?auto_375920 ) ) ( not ( = ?auto_375918 ?auto_375921 ) ) ( not ( = ?auto_375918 ?auto_375922 ) ) ( not ( = ?auto_375918 ?auto_375923 ) ) ( not ( = ?auto_375918 ?auto_375924 ) ) ( not ( = ?auto_375918 ?auto_375925 ) ) ( not ( = ?auto_375918 ?auto_375926 ) ) ( not ( = ?auto_375918 ?auto_375927 ) ) ( not ( = ?auto_375918 ?auto_375928 ) ) ( not ( = ?auto_375918 ?auto_375929 ) ) ( not ( = ?auto_375918 ?auto_375930 ) ) ( not ( = ?auto_375918 ?auto_375931 ) ) ( not ( = ?auto_375919 ?auto_375920 ) ) ( not ( = ?auto_375919 ?auto_375921 ) ) ( not ( = ?auto_375919 ?auto_375922 ) ) ( not ( = ?auto_375919 ?auto_375923 ) ) ( not ( = ?auto_375919 ?auto_375924 ) ) ( not ( = ?auto_375919 ?auto_375925 ) ) ( not ( = ?auto_375919 ?auto_375926 ) ) ( not ( = ?auto_375919 ?auto_375927 ) ) ( not ( = ?auto_375919 ?auto_375928 ) ) ( not ( = ?auto_375919 ?auto_375929 ) ) ( not ( = ?auto_375919 ?auto_375930 ) ) ( not ( = ?auto_375919 ?auto_375931 ) ) ( not ( = ?auto_375920 ?auto_375921 ) ) ( not ( = ?auto_375920 ?auto_375922 ) ) ( not ( = ?auto_375920 ?auto_375923 ) ) ( not ( = ?auto_375920 ?auto_375924 ) ) ( not ( = ?auto_375920 ?auto_375925 ) ) ( not ( = ?auto_375920 ?auto_375926 ) ) ( not ( = ?auto_375920 ?auto_375927 ) ) ( not ( = ?auto_375920 ?auto_375928 ) ) ( not ( = ?auto_375920 ?auto_375929 ) ) ( not ( = ?auto_375920 ?auto_375930 ) ) ( not ( = ?auto_375920 ?auto_375931 ) ) ( not ( = ?auto_375921 ?auto_375922 ) ) ( not ( = ?auto_375921 ?auto_375923 ) ) ( not ( = ?auto_375921 ?auto_375924 ) ) ( not ( = ?auto_375921 ?auto_375925 ) ) ( not ( = ?auto_375921 ?auto_375926 ) ) ( not ( = ?auto_375921 ?auto_375927 ) ) ( not ( = ?auto_375921 ?auto_375928 ) ) ( not ( = ?auto_375921 ?auto_375929 ) ) ( not ( = ?auto_375921 ?auto_375930 ) ) ( not ( = ?auto_375921 ?auto_375931 ) ) ( not ( = ?auto_375922 ?auto_375923 ) ) ( not ( = ?auto_375922 ?auto_375924 ) ) ( not ( = ?auto_375922 ?auto_375925 ) ) ( not ( = ?auto_375922 ?auto_375926 ) ) ( not ( = ?auto_375922 ?auto_375927 ) ) ( not ( = ?auto_375922 ?auto_375928 ) ) ( not ( = ?auto_375922 ?auto_375929 ) ) ( not ( = ?auto_375922 ?auto_375930 ) ) ( not ( = ?auto_375922 ?auto_375931 ) ) ( not ( = ?auto_375923 ?auto_375924 ) ) ( not ( = ?auto_375923 ?auto_375925 ) ) ( not ( = ?auto_375923 ?auto_375926 ) ) ( not ( = ?auto_375923 ?auto_375927 ) ) ( not ( = ?auto_375923 ?auto_375928 ) ) ( not ( = ?auto_375923 ?auto_375929 ) ) ( not ( = ?auto_375923 ?auto_375930 ) ) ( not ( = ?auto_375923 ?auto_375931 ) ) ( not ( = ?auto_375924 ?auto_375925 ) ) ( not ( = ?auto_375924 ?auto_375926 ) ) ( not ( = ?auto_375924 ?auto_375927 ) ) ( not ( = ?auto_375924 ?auto_375928 ) ) ( not ( = ?auto_375924 ?auto_375929 ) ) ( not ( = ?auto_375924 ?auto_375930 ) ) ( not ( = ?auto_375924 ?auto_375931 ) ) ( not ( = ?auto_375925 ?auto_375926 ) ) ( not ( = ?auto_375925 ?auto_375927 ) ) ( not ( = ?auto_375925 ?auto_375928 ) ) ( not ( = ?auto_375925 ?auto_375929 ) ) ( not ( = ?auto_375925 ?auto_375930 ) ) ( not ( = ?auto_375925 ?auto_375931 ) ) ( not ( = ?auto_375926 ?auto_375927 ) ) ( not ( = ?auto_375926 ?auto_375928 ) ) ( not ( = ?auto_375926 ?auto_375929 ) ) ( not ( = ?auto_375926 ?auto_375930 ) ) ( not ( = ?auto_375926 ?auto_375931 ) ) ( not ( = ?auto_375927 ?auto_375928 ) ) ( not ( = ?auto_375927 ?auto_375929 ) ) ( not ( = ?auto_375927 ?auto_375930 ) ) ( not ( = ?auto_375927 ?auto_375931 ) ) ( not ( = ?auto_375928 ?auto_375929 ) ) ( not ( = ?auto_375928 ?auto_375930 ) ) ( not ( = ?auto_375928 ?auto_375931 ) ) ( not ( = ?auto_375929 ?auto_375930 ) ) ( not ( = ?auto_375929 ?auto_375931 ) ) ( not ( = ?auto_375930 ?auto_375931 ) ) ( ON ?auto_375930 ?auto_375931 ) ( ON ?auto_375929 ?auto_375930 ) ( ON ?auto_375928 ?auto_375929 ) ( ON ?auto_375927 ?auto_375928 ) ( ON ?auto_375926 ?auto_375927 ) ( ON ?auto_375925 ?auto_375926 ) ( ON ?auto_375924 ?auto_375925 ) ( ON ?auto_375923 ?auto_375924 ) ( CLEAR ?auto_375921 ) ( ON ?auto_375922 ?auto_375923 ) ( CLEAR ?auto_375922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_375917 ?auto_375918 ?auto_375919 ?auto_375920 ?auto_375921 ?auto_375922 )
      ( MAKE-15PILE ?auto_375917 ?auto_375918 ?auto_375919 ?auto_375920 ?auto_375921 ?auto_375922 ?auto_375923 ?auto_375924 ?auto_375925 ?auto_375926 ?auto_375927 ?auto_375928 ?auto_375929 ?auto_375930 ?auto_375931 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375947 - BLOCK
      ?auto_375948 - BLOCK
      ?auto_375949 - BLOCK
      ?auto_375950 - BLOCK
      ?auto_375951 - BLOCK
      ?auto_375952 - BLOCK
      ?auto_375953 - BLOCK
      ?auto_375954 - BLOCK
      ?auto_375955 - BLOCK
      ?auto_375956 - BLOCK
      ?auto_375957 - BLOCK
      ?auto_375958 - BLOCK
      ?auto_375959 - BLOCK
      ?auto_375960 - BLOCK
      ?auto_375961 - BLOCK
    )
    :vars
    (
      ?auto_375962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375961 ?auto_375962 ) ( ON-TABLE ?auto_375947 ) ( ON ?auto_375948 ?auto_375947 ) ( ON ?auto_375949 ?auto_375948 ) ( ON ?auto_375950 ?auto_375949 ) ( not ( = ?auto_375947 ?auto_375948 ) ) ( not ( = ?auto_375947 ?auto_375949 ) ) ( not ( = ?auto_375947 ?auto_375950 ) ) ( not ( = ?auto_375947 ?auto_375951 ) ) ( not ( = ?auto_375947 ?auto_375952 ) ) ( not ( = ?auto_375947 ?auto_375953 ) ) ( not ( = ?auto_375947 ?auto_375954 ) ) ( not ( = ?auto_375947 ?auto_375955 ) ) ( not ( = ?auto_375947 ?auto_375956 ) ) ( not ( = ?auto_375947 ?auto_375957 ) ) ( not ( = ?auto_375947 ?auto_375958 ) ) ( not ( = ?auto_375947 ?auto_375959 ) ) ( not ( = ?auto_375947 ?auto_375960 ) ) ( not ( = ?auto_375947 ?auto_375961 ) ) ( not ( = ?auto_375947 ?auto_375962 ) ) ( not ( = ?auto_375948 ?auto_375949 ) ) ( not ( = ?auto_375948 ?auto_375950 ) ) ( not ( = ?auto_375948 ?auto_375951 ) ) ( not ( = ?auto_375948 ?auto_375952 ) ) ( not ( = ?auto_375948 ?auto_375953 ) ) ( not ( = ?auto_375948 ?auto_375954 ) ) ( not ( = ?auto_375948 ?auto_375955 ) ) ( not ( = ?auto_375948 ?auto_375956 ) ) ( not ( = ?auto_375948 ?auto_375957 ) ) ( not ( = ?auto_375948 ?auto_375958 ) ) ( not ( = ?auto_375948 ?auto_375959 ) ) ( not ( = ?auto_375948 ?auto_375960 ) ) ( not ( = ?auto_375948 ?auto_375961 ) ) ( not ( = ?auto_375948 ?auto_375962 ) ) ( not ( = ?auto_375949 ?auto_375950 ) ) ( not ( = ?auto_375949 ?auto_375951 ) ) ( not ( = ?auto_375949 ?auto_375952 ) ) ( not ( = ?auto_375949 ?auto_375953 ) ) ( not ( = ?auto_375949 ?auto_375954 ) ) ( not ( = ?auto_375949 ?auto_375955 ) ) ( not ( = ?auto_375949 ?auto_375956 ) ) ( not ( = ?auto_375949 ?auto_375957 ) ) ( not ( = ?auto_375949 ?auto_375958 ) ) ( not ( = ?auto_375949 ?auto_375959 ) ) ( not ( = ?auto_375949 ?auto_375960 ) ) ( not ( = ?auto_375949 ?auto_375961 ) ) ( not ( = ?auto_375949 ?auto_375962 ) ) ( not ( = ?auto_375950 ?auto_375951 ) ) ( not ( = ?auto_375950 ?auto_375952 ) ) ( not ( = ?auto_375950 ?auto_375953 ) ) ( not ( = ?auto_375950 ?auto_375954 ) ) ( not ( = ?auto_375950 ?auto_375955 ) ) ( not ( = ?auto_375950 ?auto_375956 ) ) ( not ( = ?auto_375950 ?auto_375957 ) ) ( not ( = ?auto_375950 ?auto_375958 ) ) ( not ( = ?auto_375950 ?auto_375959 ) ) ( not ( = ?auto_375950 ?auto_375960 ) ) ( not ( = ?auto_375950 ?auto_375961 ) ) ( not ( = ?auto_375950 ?auto_375962 ) ) ( not ( = ?auto_375951 ?auto_375952 ) ) ( not ( = ?auto_375951 ?auto_375953 ) ) ( not ( = ?auto_375951 ?auto_375954 ) ) ( not ( = ?auto_375951 ?auto_375955 ) ) ( not ( = ?auto_375951 ?auto_375956 ) ) ( not ( = ?auto_375951 ?auto_375957 ) ) ( not ( = ?auto_375951 ?auto_375958 ) ) ( not ( = ?auto_375951 ?auto_375959 ) ) ( not ( = ?auto_375951 ?auto_375960 ) ) ( not ( = ?auto_375951 ?auto_375961 ) ) ( not ( = ?auto_375951 ?auto_375962 ) ) ( not ( = ?auto_375952 ?auto_375953 ) ) ( not ( = ?auto_375952 ?auto_375954 ) ) ( not ( = ?auto_375952 ?auto_375955 ) ) ( not ( = ?auto_375952 ?auto_375956 ) ) ( not ( = ?auto_375952 ?auto_375957 ) ) ( not ( = ?auto_375952 ?auto_375958 ) ) ( not ( = ?auto_375952 ?auto_375959 ) ) ( not ( = ?auto_375952 ?auto_375960 ) ) ( not ( = ?auto_375952 ?auto_375961 ) ) ( not ( = ?auto_375952 ?auto_375962 ) ) ( not ( = ?auto_375953 ?auto_375954 ) ) ( not ( = ?auto_375953 ?auto_375955 ) ) ( not ( = ?auto_375953 ?auto_375956 ) ) ( not ( = ?auto_375953 ?auto_375957 ) ) ( not ( = ?auto_375953 ?auto_375958 ) ) ( not ( = ?auto_375953 ?auto_375959 ) ) ( not ( = ?auto_375953 ?auto_375960 ) ) ( not ( = ?auto_375953 ?auto_375961 ) ) ( not ( = ?auto_375953 ?auto_375962 ) ) ( not ( = ?auto_375954 ?auto_375955 ) ) ( not ( = ?auto_375954 ?auto_375956 ) ) ( not ( = ?auto_375954 ?auto_375957 ) ) ( not ( = ?auto_375954 ?auto_375958 ) ) ( not ( = ?auto_375954 ?auto_375959 ) ) ( not ( = ?auto_375954 ?auto_375960 ) ) ( not ( = ?auto_375954 ?auto_375961 ) ) ( not ( = ?auto_375954 ?auto_375962 ) ) ( not ( = ?auto_375955 ?auto_375956 ) ) ( not ( = ?auto_375955 ?auto_375957 ) ) ( not ( = ?auto_375955 ?auto_375958 ) ) ( not ( = ?auto_375955 ?auto_375959 ) ) ( not ( = ?auto_375955 ?auto_375960 ) ) ( not ( = ?auto_375955 ?auto_375961 ) ) ( not ( = ?auto_375955 ?auto_375962 ) ) ( not ( = ?auto_375956 ?auto_375957 ) ) ( not ( = ?auto_375956 ?auto_375958 ) ) ( not ( = ?auto_375956 ?auto_375959 ) ) ( not ( = ?auto_375956 ?auto_375960 ) ) ( not ( = ?auto_375956 ?auto_375961 ) ) ( not ( = ?auto_375956 ?auto_375962 ) ) ( not ( = ?auto_375957 ?auto_375958 ) ) ( not ( = ?auto_375957 ?auto_375959 ) ) ( not ( = ?auto_375957 ?auto_375960 ) ) ( not ( = ?auto_375957 ?auto_375961 ) ) ( not ( = ?auto_375957 ?auto_375962 ) ) ( not ( = ?auto_375958 ?auto_375959 ) ) ( not ( = ?auto_375958 ?auto_375960 ) ) ( not ( = ?auto_375958 ?auto_375961 ) ) ( not ( = ?auto_375958 ?auto_375962 ) ) ( not ( = ?auto_375959 ?auto_375960 ) ) ( not ( = ?auto_375959 ?auto_375961 ) ) ( not ( = ?auto_375959 ?auto_375962 ) ) ( not ( = ?auto_375960 ?auto_375961 ) ) ( not ( = ?auto_375960 ?auto_375962 ) ) ( not ( = ?auto_375961 ?auto_375962 ) ) ( ON ?auto_375960 ?auto_375961 ) ( ON ?auto_375959 ?auto_375960 ) ( ON ?auto_375958 ?auto_375959 ) ( ON ?auto_375957 ?auto_375958 ) ( ON ?auto_375956 ?auto_375957 ) ( ON ?auto_375955 ?auto_375956 ) ( ON ?auto_375954 ?auto_375955 ) ( ON ?auto_375953 ?auto_375954 ) ( ON ?auto_375952 ?auto_375953 ) ( CLEAR ?auto_375950 ) ( ON ?auto_375951 ?auto_375952 ) ( CLEAR ?auto_375951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_375947 ?auto_375948 ?auto_375949 ?auto_375950 ?auto_375951 )
      ( MAKE-15PILE ?auto_375947 ?auto_375948 ?auto_375949 ?auto_375950 ?auto_375951 ?auto_375952 ?auto_375953 ?auto_375954 ?auto_375955 ?auto_375956 ?auto_375957 ?auto_375958 ?auto_375959 ?auto_375960 ?auto_375961 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375978 - BLOCK
      ?auto_375979 - BLOCK
      ?auto_375980 - BLOCK
      ?auto_375981 - BLOCK
      ?auto_375982 - BLOCK
      ?auto_375983 - BLOCK
      ?auto_375984 - BLOCK
      ?auto_375985 - BLOCK
      ?auto_375986 - BLOCK
      ?auto_375987 - BLOCK
      ?auto_375988 - BLOCK
      ?auto_375989 - BLOCK
      ?auto_375990 - BLOCK
      ?auto_375991 - BLOCK
      ?auto_375992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375992 ) ( ON-TABLE ?auto_375978 ) ( ON ?auto_375979 ?auto_375978 ) ( ON ?auto_375980 ?auto_375979 ) ( ON ?auto_375981 ?auto_375980 ) ( not ( = ?auto_375978 ?auto_375979 ) ) ( not ( = ?auto_375978 ?auto_375980 ) ) ( not ( = ?auto_375978 ?auto_375981 ) ) ( not ( = ?auto_375978 ?auto_375982 ) ) ( not ( = ?auto_375978 ?auto_375983 ) ) ( not ( = ?auto_375978 ?auto_375984 ) ) ( not ( = ?auto_375978 ?auto_375985 ) ) ( not ( = ?auto_375978 ?auto_375986 ) ) ( not ( = ?auto_375978 ?auto_375987 ) ) ( not ( = ?auto_375978 ?auto_375988 ) ) ( not ( = ?auto_375978 ?auto_375989 ) ) ( not ( = ?auto_375978 ?auto_375990 ) ) ( not ( = ?auto_375978 ?auto_375991 ) ) ( not ( = ?auto_375978 ?auto_375992 ) ) ( not ( = ?auto_375979 ?auto_375980 ) ) ( not ( = ?auto_375979 ?auto_375981 ) ) ( not ( = ?auto_375979 ?auto_375982 ) ) ( not ( = ?auto_375979 ?auto_375983 ) ) ( not ( = ?auto_375979 ?auto_375984 ) ) ( not ( = ?auto_375979 ?auto_375985 ) ) ( not ( = ?auto_375979 ?auto_375986 ) ) ( not ( = ?auto_375979 ?auto_375987 ) ) ( not ( = ?auto_375979 ?auto_375988 ) ) ( not ( = ?auto_375979 ?auto_375989 ) ) ( not ( = ?auto_375979 ?auto_375990 ) ) ( not ( = ?auto_375979 ?auto_375991 ) ) ( not ( = ?auto_375979 ?auto_375992 ) ) ( not ( = ?auto_375980 ?auto_375981 ) ) ( not ( = ?auto_375980 ?auto_375982 ) ) ( not ( = ?auto_375980 ?auto_375983 ) ) ( not ( = ?auto_375980 ?auto_375984 ) ) ( not ( = ?auto_375980 ?auto_375985 ) ) ( not ( = ?auto_375980 ?auto_375986 ) ) ( not ( = ?auto_375980 ?auto_375987 ) ) ( not ( = ?auto_375980 ?auto_375988 ) ) ( not ( = ?auto_375980 ?auto_375989 ) ) ( not ( = ?auto_375980 ?auto_375990 ) ) ( not ( = ?auto_375980 ?auto_375991 ) ) ( not ( = ?auto_375980 ?auto_375992 ) ) ( not ( = ?auto_375981 ?auto_375982 ) ) ( not ( = ?auto_375981 ?auto_375983 ) ) ( not ( = ?auto_375981 ?auto_375984 ) ) ( not ( = ?auto_375981 ?auto_375985 ) ) ( not ( = ?auto_375981 ?auto_375986 ) ) ( not ( = ?auto_375981 ?auto_375987 ) ) ( not ( = ?auto_375981 ?auto_375988 ) ) ( not ( = ?auto_375981 ?auto_375989 ) ) ( not ( = ?auto_375981 ?auto_375990 ) ) ( not ( = ?auto_375981 ?auto_375991 ) ) ( not ( = ?auto_375981 ?auto_375992 ) ) ( not ( = ?auto_375982 ?auto_375983 ) ) ( not ( = ?auto_375982 ?auto_375984 ) ) ( not ( = ?auto_375982 ?auto_375985 ) ) ( not ( = ?auto_375982 ?auto_375986 ) ) ( not ( = ?auto_375982 ?auto_375987 ) ) ( not ( = ?auto_375982 ?auto_375988 ) ) ( not ( = ?auto_375982 ?auto_375989 ) ) ( not ( = ?auto_375982 ?auto_375990 ) ) ( not ( = ?auto_375982 ?auto_375991 ) ) ( not ( = ?auto_375982 ?auto_375992 ) ) ( not ( = ?auto_375983 ?auto_375984 ) ) ( not ( = ?auto_375983 ?auto_375985 ) ) ( not ( = ?auto_375983 ?auto_375986 ) ) ( not ( = ?auto_375983 ?auto_375987 ) ) ( not ( = ?auto_375983 ?auto_375988 ) ) ( not ( = ?auto_375983 ?auto_375989 ) ) ( not ( = ?auto_375983 ?auto_375990 ) ) ( not ( = ?auto_375983 ?auto_375991 ) ) ( not ( = ?auto_375983 ?auto_375992 ) ) ( not ( = ?auto_375984 ?auto_375985 ) ) ( not ( = ?auto_375984 ?auto_375986 ) ) ( not ( = ?auto_375984 ?auto_375987 ) ) ( not ( = ?auto_375984 ?auto_375988 ) ) ( not ( = ?auto_375984 ?auto_375989 ) ) ( not ( = ?auto_375984 ?auto_375990 ) ) ( not ( = ?auto_375984 ?auto_375991 ) ) ( not ( = ?auto_375984 ?auto_375992 ) ) ( not ( = ?auto_375985 ?auto_375986 ) ) ( not ( = ?auto_375985 ?auto_375987 ) ) ( not ( = ?auto_375985 ?auto_375988 ) ) ( not ( = ?auto_375985 ?auto_375989 ) ) ( not ( = ?auto_375985 ?auto_375990 ) ) ( not ( = ?auto_375985 ?auto_375991 ) ) ( not ( = ?auto_375985 ?auto_375992 ) ) ( not ( = ?auto_375986 ?auto_375987 ) ) ( not ( = ?auto_375986 ?auto_375988 ) ) ( not ( = ?auto_375986 ?auto_375989 ) ) ( not ( = ?auto_375986 ?auto_375990 ) ) ( not ( = ?auto_375986 ?auto_375991 ) ) ( not ( = ?auto_375986 ?auto_375992 ) ) ( not ( = ?auto_375987 ?auto_375988 ) ) ( not ( = ?auto_375987 ?auto_375989 ) ) ( not ( = ?auto_375987 ?auto_375990 ) ) ( not ( = ?auto_375987 ?auto_375991 ) ) ( not ( = ?auto_375987 ?auto_375992 ) ) ( not ( = ?auto_375988 ?auto_375989 ) ) ( not ( = ?auto_375988 ?auto_375990 ) ) ( not ( = ?auto_375988 ?auto_375991 ) ) ( not ( = ?auto_375988 ?auto_375992 ) ) ( not ( = ?auto_375989 ?auto_375990 ) ) ( not ( = ?auto_375989 ?auto_375991 ) ) ( not ( = ?auto_375989 ?auto_375992 ) ) ( not ( = ?auto_375990 ?auto_375991 ) ) ( not ( = ?auto_375990 ?auto_375992 ) ) ( not ( = ?auto_375991 ?auto_375992 ) ) ( ON ?auto_375991 ?auto_375992 ) ( ON ?auto_375990 ?auto_375991 ) ( ON ?auto_375989 ?auto_375990 ) ( ON ?auto_375988 ?auto_375989 ) ( ON ?auto_375987 ?auto_375988 ) ( ON ?auto_375986 ?auto_375987 ) ( ON ?auto_375985 ?auto_375986 ) ( ON ?auto_375984 ?auto_375985 ) ( ON ?auto_375983 ?auto_375984 ) ( CLEAR ?auto_375981 ) ( ON ?auto_375982 ?auto_375983 ) ( CLEAR ?auto_375982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_375978 ?auto_375979 ?auto_375980 ?auto_375981 ?auto_375982 )
      ( MAKE-15PILE ?auto_375978 ?auto_375979 ?auto_375980 ?auto_375981 ?auto_375982 ?auto_375983 ?auto_375984 ?auto_375985 ?auto_375986 ?auto_375987 ?auto_375988 ?auto_375989 ?auto_375990 ?auto_375991 ?auto_375992 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376008 - BLOCK
      ?auto_376009 - BLOCK
      ?auto_376010 - BLOCK
      ?auto_376011 - BLOCK
      ?auto_376012 - BLOCK
      ?auto_376013 - BLOCK
      ?auto_376014 - BLOCK
      ?auto_376015 - BLOCK
      ?auto_376016 - BLOCK
      ?auto_376017 - BLOCK
      ?auto_376018 - BLOCK
      ?auto_376019 - BLOCK
      ?auto_376020 - BLOCK
      ?auto_376021 - BLOCK
      ?auto_376022 - BLOCK
    )
    :vars
    (
      ?auto_376023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376022 ?auto_376023 ) ( ON-TABLE ?auto_376008 ) ( ON ?auto_376009 ?auto_376008 ) ( ON ?auto_376010 ?auto_376009 ) ( not ( = ?auto_376008 ?auto_376009 ) ) ( not ( = ?auto_376008 ?auto_376010 ) ) ( not ( = ?auto_376008 ?auto_376011 ) ) ( not ( = ?auto_376008 ?auto_376012 ) ) ( not ( = ?auto_376008 ?auto_376013 ) ) ( not ( = ?auto_376008 ?auto_376014 ) ) ( not ( = ?auto_376008 ?auto_376015 ) ) ( not ( = ?auto_376008 ?auto_376016 ) ) ( not ( = ?auto_376008 ?auto_376017 ) ) ( not ( = ?auto_376008 ?auto_376018 ) ) ( not ( = ?auto_376008 ?auto_376019 ) ) ( not ( = ?auto_376008 ?auto_376020 ) ) ( not ( = ?auto_376008 ?auto_376021 ) ) ( not ( = ?auto_376008 ?auto_376022 ) ) ( not ( = ?auto_376008 ?auto_376023 ) ) ( not ( = ?auto_376009 ?auto_376010 ) ) ( not ( = ?auto_376009 ?auto_376011 ) ) ( not ( = ?auto_376009 ?auto_376012 ) ) ( not ( = ?auto_376009 ?auto_376013 ) ) ( not ( = ?auto_376009 ?auto_376014 ) ) ( not ( = ?auto_376009 ?auto_376015 ) ) ( not ( = ?auto_376009 ?auto_376016 ) ) ( not ( = ?auto_376009 ?auto_376017 ) ) ( not ( = ?auto_376009 ?auto_376018 ) ) ( not ( = ?auto_376009 ?auto_376019 ) ) ( not ( = ?auto_376009 ?auto_376020 ) ) ( not ( = ?auto_376009 ?auto_376021 ) ) ( not ( = ?auto_376009 ?auto_376022 ) ) ( not ( = ?auto_376009 ?auto_376023 ) ) ( not ( = ?auto_376010 ?auto_376011 ) ) ( not ( = ?auto_376010 ?auto_376012 ) ) ( not ( = ?auto_376010 ?auto_376013 ) ) ( not ( = ?auto_376010 ?auto_376014 ) ) ( not ( = ?auto_376010 ?auto_376015 ) ) ( not ( = ?auto_376010 ?auto_376016 ) ) ( not ( = ?auto_376010 ?auto_376017 ) ) ( not ( = ?auto_376010 ?auto_376018 ) ) ( not ( = ?auto_376010 ?auto_376019 ) ) ( not ( = ?auto_376010 ?auto_376020 ) ) ( not ( = ?auto_376010 ?auto_376021 ) ) ( not ( = ?auto_376010 ?auto_376022 ) ) ( not ( = ?auto_376010 ?auto_376023 ) ) ( not ( = ?auto_376011 ?auto_376012 ) ) ( not ( = ?auto_376011 ?auto_376013 ) ) ( not ( = ?auto_376011 ?auto_376014 ) ) ( not ( = ?auto_376011 ?auto_376015 ) ) ( not ( = ?auto_376011 ?auto_376016 ) ) ( not ( = ?auto_376011 ?auto_376017 ) ) ( not ( = ?auto_376011 ?auto_376018 ) ) ( not ( = ?auto_376011 ?auto_376019 ) ) ( not ( = ?auto_376011 ?auto_376020 ) ) ( not ( = ?auto_376011 ?auto_376021 ) ) ( not ( = ?auto_376011 ?auto_376022 ) ) ( not ( = ?auto_376011 ?auto_376023 ) ) ( not ( = ?auto_376012 ?auto_376013 ) ) ( not ( = ?auto_376012 ?auto_376014 ) ) ( not ( = ?auto_376012 ?auto_376015 ) ) ( not ( = ?auto_376012 ?auto_376016 ) ) ( not ( = ?auto_376012 ?auto_376017 ) ) ( not ( = ?auto_376012 ?auto_376018 ) ) ( not ( = ?auto_376012 ?auto_376019 ) ) ( not ( = ?auto_376012 ?auto_376020 ) ) ( not ( = ?auto_376012 ?auto_376021 ) ) ( not ( = ?auto_376012 ?auto_376022 ) ) ( not ( = ?auto_376012 ?auto_376023 ) ) ( not ( = ?auto_376013 ?auto_376014 ) ) ( not ( = ?auto_376013 ?auto_376015 ) ) ( not ( = ?auto_376013 ?auto_376016 ) ) ( not ( = ?auto_376013 ?auto_376017 ) ) ( not ( = ?auto_376013 ?auto_376018 ) ) ( not ( = ?auto_376013 ?auto_376019 ) ) ( not ( = ?auto_376013 ?auto_376020 ) ) ( not ( = ?auto_376013 ?auto_376021 ) ) ( not ( = ?auto_376013 ?auto_376022 ) ) ( not ( = ?auto_376013 ?auto_376023 ) ) ( not ( = ?auto_376014 ?auto_376015 ) ) ( not ( = ?auto_376014 ?auto_376016 ) ) ( not ( = ?auto_376014 ?auto_376017 ) ) ( not ( = ?auto_376014 ?auto_376018 ) ) ( not ( = ?auto_376014 ?auto_376019 ) ) ( not ( = ?auto_376014 ?auto_376020 ) ) ( not ( = ?auto_376014 ?auto_376021 ) ) ( not ( = ?auto_376014 ?auto_376022 ) ) ( not ( = ?auto_376014 ?auto_376023 ) ) ( not ( = ?auto_376015 ?auto_376016 ) ) ( not ( = ?auto_376015 ?auto_376017 ) ) ( not ( = ?auto_376015 ?auto_376018 ) ) ( not ( = ?auto_376015 ?auto_376019 ) ) ( not ( = ?auto_376015 ?auto_376020 ) ) ( not ( = ?auto_376015 ?auto_376021 ) ) ( not ( = ?auto_376015 ?auto_376022 ) ) ( not ( = ?auto_376015 ?auto_376023 ) ) ( not ( = ?auto_376016 ?auto_376017 ) ) ( not ( = ?auto_376016 ?auto_376018 ) ) ( not ( = ?auto_376016 ?auto_376019 ) ) ( not ( = ?auto_376016 ?auto_376020 ) ) ( not ( = ?auto_376016 ?auto_376021 ) ) ( not ( = ?auto_376016 ?auto_376022 ) ) ( not ( = ?auto_376016 ?auto_376023 ) ) ( not ( = ?auto_376017 ?auto_376018 ) ) ( not ( = ?auto_376017 ?auto_376019 ) ) ( not ( = ?auto_376017 ?auto_376020 ) ) ( not ( = ?auto_376017 ?auto_376021 ) ) ( not ( = ?auto_376017 ?auto_376022 ) ) ( not ( = ?auto_376017 ?auto_376023 ) ) ( not ( = ?auto_376018 ?auto_376019 ) ) ( not ( = ?auto_376018 ?auto_376020 ) ) ( not ( = ?auto_376018 ?auto_376021 ) ) ( not ( = ?auto_376018 ?auto_376022 ) ) ( not ( = ?auto_376018 ?auto_376023 ) ) ( not ( = ?auto_376019 ?auto_376020 ) ) ( not ( = ?auto_376019 ?auto_376021 ) ) ( not ( = ?auto_376019 ?auto_376022 ) ) ( not ( = ?auto_376019 ?auto_376023 ) ) ( not ( = ?auto_376020 ?auto_376021 ) ) ( not ( = ?auto_376020 ?auto_376022 ) ) ( not ( = ?auto_376020 ?auto_376023 ) ) ( not ( = ?auto_376021 ?auto_376022 ) ) ( not ( = ?auto_376021 ?auto_376023 ) ) ( not ( = ?auto_376022 ?auto_376023 ) ) ( ON ?auto_376021 ?auto_376022 ) ( ON ?auto_376020 ?auto_376021 ) ( ON ?auto_376019 ?auto_376020 ) ( ON ?auto_376018 ?auto_376019 ) ( ON ?auto_376017 ?auto_376018 ) ( ON ?auto_376016 ?auto_376017 ) ( ON ?auto_376015 ?auto_376016 ) ( ON ?auto_376014 ?auto_376015 ) ( ON ?auto_376013 ?auto_376014 ) ( ON ?auto_376012 ?auto_376013 ) ( CLEAR ?auto_376010 ) ( ON ?auto_376011 ?auto_376012 ) ( CLEAR ?auto_376011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_376008 ?auto_376009 ?auto_376010 ?auto_376011 )
      ( MAKE-15PILE ?auto_376008 ?auto_376009 ?auto_376010 ?auto_376011 ?auto_376012 ?auto_376013 ?auto_376014 ?auto_376015 ?auto_376016 ?auto_376017 ?auto_376018 ?auto_376019 ?auto_376020 ?auto_376021 ?auto_376022 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376039 - BLOCK
      ?auto_376040 - BLOCK
      ?auto_376041 - BLOCK
      ?auto_376042 - BLOCK
      ?auto_376043 - BLOCK
      ?auto_376044 - BLOCK
      ?auto_376045 - BLOCK
      ?auto_376046 - BLOCK
      ?auto_376047 - BLOCK
      ?auto_376048 - BLOCK
      ?auto_376049 - BLOCK
      ?auto_376050 - BLOCK
      ?auto_376051 - BLOCK
      ?auto_376052 - BLOCK
      ?auto_376053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_376053 ) ( ON-TABLE ?auto_376039 ) ( ON ?auto_376040 ?auto_376039 ) ( ON ?auto_376041 ?auto_376040 ) ( not ( = ?auto_376039 ?auto_376040 ) ) ( not ( = ?auto_376039 ?auto_376041 ) ) ( not ( = ?auto_376039 ?auto_376042 ) ) ( not ( = ?auto_376039 ?auto_376043 ) ) ( not ( = ?auto_376039 ?auto_376044 ) ) ( not ( = ?auto_376039 ?auto_376045 ) ) ( not ( = ?auto_376039 ?auto_376046 ) ) ( not ( = ?auto_376039 ?auto_376047 ) ) ( not ( = ?auto_376039 ?auto_376048 ) ) ( not ( = ?auto_376039 ?auto_376049 ) ) ( not ( = ?auto_376039 ?auto_376050 ) ) ( not ( = ?auto_376039 ?auto_376051 ) ) ( not ( = ?auto_376039 ?auto_376052 ) ) ( not ( = ?auto_376039 ?auto_376053 ) ) ( not ( = ?auto_376040 ?auto_376041 ) ) ( not ( = ?auto_376040 ?auto_376042 ) ) ( not ( = ?auto_376040 ?auto_376043 ) ) ( not ( = ?auto_376040 ?auto_376044 ) ) ( not ( = ?auto_376040 ?auto_376045 ) ) ( not ( = ?auto_376040 ?auto_376046 ) ) ( not ( = ?auto_376040 ?auto_376047 ) ) ( not ( = ?auto_376040 ?auto_376048 ) ) ( not ( = ?auto_376040 ?auto_376049 ) ) ( not ( = ?auto_376040 ?auto_376050 ) ) ( not ( = ?auto_376040 ?auto_376051 ) ) ( not ( = ?auto_376040 ?auto_376052 ) ) ( not ( = ?auto_376040 ?auto_376053 ) ) ( not ( = ?auto_376041 ?auto_376042 ) ) ( not ( = ?auto_376041 ?auto_376043 ) ) ( not ( = ?auto_376041 ?auto_376044 ) ) ( not ( = ?auto_376041 ?auto_376045 ) ) ( not ( = ?auto_376041 ?auto_376046 ) ) ( not ( = ?auto_376041 ?auto_376047 ) ) ( not ( = ?auto_376041 ?auto_376048 ) ) ( not ( = ?auto_376041 ?auto_376049 ) ) ( not ( = ?auto_376041 ?auto_376050 ) ) ( not ( = ?auto_376041 ?auto_376051 ) ) ( not ( = ?auto_376041 ?auto_376052 ) ) ( not ( = ?auto_376041 ?auto_376053 ) ) ( not ( = ?auto_376042 ?auto_376043 ) ) ( not ( = ?auto_376042 ?auto_376044 ) ) ( not ( = ?auto_376042 ?auto_376045 ) ) ( not ( = ?auto_376042 ?auto_376046 ) ) ( not ( = ?auto_376042 ?auto_376047 ) ) ( not ( = ?auto_376042 ?auto_376048 ) ) ( not ( = ?auto_376042 ?auto_376049 ) ) ( not ( = ?auto_376042 ?auto_376050 ) ) ( not ( = ?auto_376042 ?auto_376051 ) ) ( not ( = ?auto_376042 ?auto_376052 ) ) ( not ( = ?auto_376042 ?auto_376053 ) ) ( not ( = ?auto_376043 ?auto_376044 ) ) ( not ( = ?auto_376043 ?auto_376045 ) ) ( not ( = ?auto_376043 ?auto_376046 ) ) ( not ( = ?auto_376043 ?auto_376047 ) ) ( not ( = ?auto_376043 ?auto_376048 ) ) ( not ( = ?auto_376043 ?auto_376049 ) ) ( not ( = ?auto_376043 ?auto_376050 ) ) ( not ( = ?auto_376043 ?auto_376051 ) ) ( not ( = ?auto_376043 ?auto_376052 ) ) ( not ( = ?auto_376043 ?auto_376053 ) ) ( not ( = ?auto_376044 ?auto_376045 ) ) ( not ( = ?auto_376044 ?auto_376046 ) ) ( not ( = ?auto_376044 ?auto_376047 ) ) ( not ( = ?auto_376044 ?auto_376048 ) ) ( not ( = ?auto_376044 ?auto_376049 ) ) ( not ( = ?auto_376044 ?auto_376050 ) ) ( not ( = ?auto_376044 ?auto_376051 ) ) ( not ( = ?auto_376044 ?auto_376052 ) ) ( not ( = ?auto_376044 ?auto_376053 ) ) ( not ( = ?auto_376045 ?auto_376046 ) ) ( not ( = ?auto_376045 ?auto_376047 ) ) ( not ( = ?auto_376045 ?auto_376048 ) ) ( not ( = ?auto_376045 ?auto_376049 ) ) ( not ( = ?auto_376045 ?auto_376050 ) ) ( not ( = ?auto_376045 ?auto_376051 ) ) ( not ( = ?auto_376045 ?auto_376052 ) ) ( not ( = ?auto_376045 ?auto_376053 ) ) ( not ( = ?auto_376046 ?auto_376047 ) ) ( not ( = ?auto_376046 ?auto_376048 ) ) ( not ( = ?auto_376046 ?auto_376049 ) ) ( not ( = ?auto_376046 ?auto_376050 ) ) ( not ( = ?auto_376046 ?auto_376051 ) ) ( not ( = ?auto_376046 ?auto_376052 ) ) ( not ( = ?auto_376046 ?auto_376053 ) ) ( not ( = ?auto_376047 ?auto_376048 ) ) ( not ( = ?auto_376047 ?auto_376049 ) ) ( not ( = ?auto_376047 ?auto_376050 ) ) ( not ( = ?auto_376047 ?auto_376051 ) ) ( not ( = ?auto_376047 ?auto_376052 ) ) ( not ( = ?auto_376047 ?auto_376053 ) ) ( not ( = ?auto_376048 ?auto_376049 ) ) ( not ( = ?auto_376048 ?auto_376050 ) ) ( not ( = ?auto_376048 ?auto_376051 ) ) ( not ( = ?auto_376048 ?auto_376052 ) ) ( not ( = ?auto_376048 ?auto_376053 ) ) ( not ( = ?auto_376049 ?auto_376050 ) ) ( not ( = ?auto_376049 ?auto_376051 ) ) ( not ( = ?auto_376049 ?auto_376052 ) ) ( not ( = ?auto_376049 ?auto_376053 ) ) ( not ( = ?auto_376050 ?auto_376051 ) ) ( not ( = ?auto_376050 ?auto_376052 ) ) ( not ( = ?auto_376050 ?auto_376053 ) ) ( not ( = ?auto_376051 ?auto_376052 ) ) ( not ( = ?auto_376051 ?auto_376053 ) ) ( not ( = ?auto_376052 ?auto_376053 ) ) ( ON ?auto_376052 ?auto_376053 ) ( ON ?auto_376051 ?auto_376052 ) ( ON ?auto_376050 ?auto_376051 ) ( ON ?auto_376049 ?auto_376050 ) ( ON ?auto_376048 ?auto_376049 ) ( ON ?auto_376047 ?auto_376048 ) ( ON ?auto_376046 ?auto_376047 ) ( ON ?auto_376045 ?auto_376046 ) ( ON ?auto_376044 ?auto_376045 ) ( ON ?auto_376043 ?auto_376044 ) ( CLEAR ?auto_376041 ) ( ON ?auto_376042 ?auto_376043 ) ( CLEAR ?auto_376042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_376039 ?auto_376040 ?auto_376041 ?auto_376042 )
      ( MAKE-15PILE ?auto_376039 ?auto_376040 ?auto_376041 ?auto_376042 ?auto_376043 ?auto_376044 ?auto_376045 ?auto_376046 ?auto_376047 ?auto_376048 ?auto_376049 ?auto_376050 ?auto_376051 ?auto_376052 ?auto_376053 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376069 - BLOCK
      ?auto_376070 - BLOCK
      ?auto_376071 - BLOCK
      ?auto_376072 - BLOCK
      ?auto_376073 - BLOCK
      ?auto_376074 - BLOCK
      ?auto_376075 - BLOCK
      ?auto_376076 - BLOCK
      ?auto_376077 - BLOCK
      ?auto_376078 - BLOCK
      ?auto_376079 - BLOCK
      ?auto_376080 - BLOCK
      ?auto_376081 - BLOCK
      ?auto_376082 - BLOCK
      ?auto_376083 - BLOCK
    )
    :vars
    (
      ?auto_376084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376083 ?auto_376084 ) ( ON-TABLE ?auto_376069 ) ( ON ?auto_376070 ?auto_376069 ) ( not ( = ?auto_376069 ?auto_376070 ) ) ( not ( = ?auto_376069 ?auto_376071 ) ) ( not ( = ?auto_376069 ?auto_376072 ) ) ( not ( = ?auto_376069 ?auto_376073 ) ) ( not ( = ?auto_376069 ?auto_376074 ) ) ( not ( = ?auto_376069 ?auto_376075 ) ) ( not ( = ?auto_376069 ?auto_376076 ) ) ( not ( = ?auto_376069 ?auto_376077 ) ) ( not ( = ?auto_376069 ?auto_376078 ) ) ( not ( = ?auto_376069 ?auto_376079 ) ) ( not ( = ?auto_376069 ?auto_376080 ) ) ( not ( = ?auto_376069 ?auto_376081 ) ) ( not ( = ?auto_376069 ?auto_376082 ) ) ( not ( = ?auto_376069 ?auto_376083 ) ) ( not ( = ?auto_376069 ?auto_376084 ) ) ( not ( = ?auto_376070 ?auto_376071 ) ) ( not ( = ?auto_376070 ?auto_376072 ) ) ( not ( = ?auto_376070 ?auto_376073 ) ) ( not ( = ?auto_376070 ?auto_376074 ) ) ( not ( = ?auto_376070 ?auto_376075 ) ) ( not ( = ?auto_376070 ?auto_376076 ) ) ( not ( = ?auto_376070 ?auto_376077 ) ) ( not ( = ?auto_376070 ?auto_376078 ) ) ( not ( = ?auto_376070 ?auto_376079 ) ) ( not ( = ?auto_376070 ?auto_376080 ) ) ( not ( = ?auto_376070 ?auto_376081 ) ) ( not ( = ?auto_376070 ?auto_376082 ) ) ( not ( = ?auto_376070 ?auto_376083 ) ) ( not ( = ?auto_376070 ?auto_376084 ) ) ( not ( = ?auto_376071 ?auto_376072 ) ) ( not ( = ?auto_376071 ?auto_376073 ) ) ( not ( = ?auto_376071 ?auto_376074 ) ) ( not ( = ?auto_376071 ?auto_376075 ) ) ( not ( = ?auto_376071 ?auto_376076 ) ) ( not ( = ?auto_376071 ?auto_376077 ) ) ( not ( = ?auto_376071 ?auto_376078 ) ) ( not ( = ?auto_376071 ?auto_376079 ) ) ( not ( = ?auto_376071 ?auto_376080 ) ) ( not ( = ?auto_376071 ?auto_376081 ) ) ( not ( = ?auto_376071 ?auto_376082 ) ) ( not ( = ?auto_376071 ?auto_376083 ) ) ( not ( = ?auto_376071 ?auto_376084 ) ) ( not ( = ?auto_376072 ?auto_376073 ) ) ( not ( = ?auto_376072 ?auto_376074 ) ) ( not ( = ?auto_376072 ?auto_376075 ) ) ( not ( = ?auto_376072 ?auto_376076 ) ) ( not ( = ?auto_376072 ?auto_376077 ) ) ( not ( = ?auto_376072 ?auto_376078 ) ) ( not ( = ?auto_376072 ?auto_376079 ) ) ( not ( = ?auto_376072 ?auto_376080 ) ) ( not ( = ?auto_376072 ?auto_376081 ) ) ( not ( = ?auto_376072 ?auto_376082 ) ) ( not ( = ?auto_376072 ?auto_376083 ) ) ( not ( = ?auto_376072 ?auto_376084 ) ) ( not ( = ?auto_376073 ?auto_376074 ) ) ( not ( = ?auto_376073 ?auto_376075 ) ) ( not ( = ?auto_376073 ?auto_376076 ) ) ( not ( = ?auto_376073 ?auto_376077 ) ) ( not ( = ?auto_376073 ?auto_376078 ) ) ( not ( = ?auto_376073 ?auto_376079 ) ) ( not ( = ?auto_376073 ?auto_376080 ) ) ( not ( = ?auto_376073 ?auto_376081 ) ) ( not ( = ?auto_376073 ?auto_376082 ) ) ( not ( = ?auto_376073 ?auto_376083 ) ) ( not ( = ?auto_376073 ?auto_376084 ) ) ( not ( = ?auto_376074 ?auto_376075 ) ) ( not ( = ?auto_376074 ?auto_376076 ) ) ( not ( = ?auto_376074 ?auto_376077 ) ) ( not ( = ?auto_376074 ?auto_376078 ) ) ( not ( = ?auto_376074 ?auto_376079 ) ) ( not ( = ?auto_376074 ?auto_376080 ) ) ( not ( = ?auto_376074 ?auto_376081 ) ) ( not ( = ?auto_376074 ?auto_376082 ) ) ( not ( = ?auto_376074 ?auto_376083 ) ) ( not ( = ?auto_376074 ?auto_376084 ) ) ( not ( = ?auto_376075 ?auto_376076 ) ) ( not ( = ?auto_376075 ?auto_376077 ) ) ( not ( = ?auto_376075 ?auto_376078 ) ) ( not ( = ?auto_376075 ?auto_376079 ) ) ( not ( = ?auto_376075 ?auto_376080 ) ) ( not ( = ?auto_376075 ?auto_376081 ) ) ( not ( = ?auto_376075 ?auto_376082 ) ) ( not ( = ?auto_376075 ?auto_376083 ) ) ( not ( = ?auto_376075 ?auto_376084 ) ) ( not ( = ?auto_376076 ?auto_376077 ) ) ( not ( = ?auto_376076 ?auto_376078 ) ) ( not ( = ?auto_376076 ?auto_376079 ) ) ( not ( = ?auto_376076 ?auto_376080 ) ) ( not ( = ?auto_376076 ?auto_376081 ) ) ( not ( = ?auto_376076 ?auto_376082 ) ) ( not ( = ?auto_376076 ?auto_376083 ) ) ( not ( = ?auto_376076 ?auto_376084 ) ) ( not ( = ?auto_376077 ?auto_376078 ) ) ( not ( = ?auto_376077 ?auto_376079 ) ) ( not ( = ?auto_376077 ?auto_376080 ) ) ( not ( = ?auto_376077 ?auto_376081 ) ) ( not ( = ?auto_376077 ?auto_376082 ) ) ( not ( = ?auto_376077 ?auto_376083 ) ) ( not ( = ?auto_376077 ?auto_376084 ) ) ( not ( = ?auto_376078 ?auto_376079 ) ) ( not ( = ?auto_376078 ?auto_376080 ) ) ( not ( = ?auto_376078 ?auto_376081 ) ) ( not ( = ?auto_376078 ?auto_376082 ) ) ( not ( = ?auto_376078 ?auto_376083 ) ) ( not ( = ?auto_376078 ?auto_376084 ) ) ( not ( = ?auto_376079 ?auto_376080 ) ) ( not ( = ?auto_376079 ?auto_376081 ) ) ( not ( = ?auto_376079 ?auto_376082 ) ) ( not ( = ?auto_376079 ?auto_376083 ) ) ( not ( = ?auto_376079 ?auto_376084 ) ) ( not ( = ?auto_376080 ?auto_376081 ) ) ( not ( = ?auto_376080 ?auto_376082 ) ) ( not ( = ?auto_376080 ?auto_376083 ) ) ( not ( = ?auto_376080 ?auto_376084 ) ) ( not ( = ?auto_376081 ?auto_376082 ) ) ( not ( = ?auto_376081 ?auto_376083 ) ) ( not ( = ?auto_376081 ?auto_376084 ) ) ( not ( = ?auto_376082 ?auto_376083 ) ) ( not ( = ?auto_376082 ?auto_376084 ) ) ( not ( = ?auto_376083 ?auto_376084 ) ) ( ON ?auto_376082 ?auto_376083 ) ( ON ?auto_376081 ?auto_376082 ) ( ON ?auto_376080 ?auto_376081 ) ( ON ?auto_376079 ?auto_376080 ) ( ON ?auto_376078 ?auto_376079 ) ( ON ?auto_376077 ?auto_376078 ) ( ON ?auto_376076 ?auto_376077 ) ( ON ?auto_376075 ?auto_376076 ) ( ON ?auto_376074 ?auto_376075 ) ( ON ?auto_376073 ?auto_376074 ) ( ON ?auto_376072 ?auto_376073 ) ( CLEAR ?auto_376070 ) ( ON ?auto_376071 ?auto_376072 ) ( CLEAR ?auto_376071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_376069 ?auto_376070 ?auto_376071 )
      ( MAKE-15PILE ?auto_376069 ?auto_376070 ?auto_376071 ?auto_376072 ?auto_376073 ?auto_376074 ?auto_376075 ?auto_376076 ?auto_376077 ?auto_376078 ?auto_376079 ?auto_376080 ?auto_376081 ?auto_376082 ?auto_376083 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376100 - BLOCK
      ?auto_376101 - BLOCK
      ?auto_376102 - BLOCK
      ?auto_376103 - BLOCK
      ?auto_376104 - BLOCK
      ?auto_376105 - BLOCK
      ?auto_376106 - BLOCK
      ?auto_376107 - BLOCK
      ?auto_376108 - BLOCK
      ?auto_376109 - BLOCK
      ?auto_376110 - BLOCK
      ?auto_376111 - BLOCK
      ?auto_376112 - BLOCK
      ?auto_376113 - BLOCK
      ?auto_376114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_376114 ) ( ON-TABLE ?auto_376100 ) ( ON ?auto_376101 ?auto_376100 ) ( not ( = ?auto_376100 ?auto_376101 ) ) ( not ( = ?auto_376100 ?auto_376102 ) ) ( not ( = ?auto_376100 ?auto_376103 ) ) ( not ( = ?auto_376100 ?auto_376104 ) ) ( not ( = ?auto_376100 ?auto_376105 ) ) ( not ( = ?auto_376100 ?auto_376106 ) ) ( not ( = ?auto_376100 ?auto_376107 ) ) ( not ( = ?auto_376100 ?auto_376108 ) ) ( not ( = ?auto_376100 ?auto_376109 ) ) ( not ( = ?auto_376100 ?auto_376110 ) ) ( not ( = ?auto_376100 ?auto_376111 ) ) ( not ( = ?auto_376100 ?auto_376112 ) ) ( not ( = ?auto_376100 ?auto_376113 ) ) ( not ( = ?auto_376100 ?auto_376114 ) ) ( not ( = ?auto_376101 ?auto_376102 ) ) ( not ( = ?auto_376101 ?auto_376103 ) ) ( not ( = ?auto_376101 ?auto_376104 ) ) ( not ( = ?auto_376101 ?auto_376105 ) ) ( not ( = ?auto_376101 ?auto_376106 ) ) ( not ( = ?auto_376101 ?auto_376107 ) ) ( not ( = ?auto_376101 ?auto_376108 ) ) ( not ( = ?auto_376101 ?auto_376109 ) ) ( not ( = ?auto_376101 ?auto_376110 ) ) ( not ( = ?auto_376101 ?auto_376111 ) ) ( not ( = ?auto_376101 ?auto_376112 ) ) ( not ( = ?auto_376101 ?auto_376113 ) ) ( not ( = ?auto_376101 ?auto_376114 ) ) ( not ( = ?auto_376102 ?auto_376103 ) ) ( not ( = ?auto_376102 ?auto_376104 ) ) ( not ( = ?auto_376102 ?auto_376105 ) ) ( not ( = ?auto_376102 ?auto_376106 ) ) ( not ( = ?auto_376102 ?auto_376107 ) ) ( not ( = ?auto_376102 ?auto_376108 ) ) ( not ( = ?auto_376102 ?auto_376109 ) ) ( not ( = ?auto_376102 ?auto_376110 ) ) ( not ( = ?auto_376102 ?auto_376111 ) ) ( not ( = ?auto_376102 ?auto_376112 ) ) ( not ( = ?auto_376102 ?auto_376113 ) ) ( not ( = ?auto_376102 ?auto_376114 ) ) ( not ( = ?auto_376103 ?auto_376104 ) ) ( not ( = ?auto_376103 ?auto_376105 ) ) ( not ( = ?auto_376103 ?auto_376106 ) ) ( not ( = ?auto_376103 ?auto_376107 ) ) ( not ( = ?auto_376103 ?auto_376108 ) ) ( not ( = ?auto_376103 ?auto_376109 ) ) ( not ( = ?auto_376103 ?auto_376110 ) ) ( not ( = ?auto_376103 ?auto_376111 ) ) ( not ( = ?auto_376103 ?auto_376112 ) ) ( not ( = ?auto_376103 ?auto_376113 ) ) ( not ( = ?auto_376103 ?auto_376114 ) ) ( not ( = ?auto_376104 ?auto_376105 ) ) ( not ( = ?auto_376104 ?auto_376106 ) ) ( not ( = ?auto_376104 ?auto_376107 ) ) ( not ( = ?auto_376104 ?auto_376108 ) ) ( not ( = ?auto_376104 ?auto_376109 ) ) ( not ( = ?auto_376104 ?auto_376110 ) ) ( not ( = ?auto_376104 ?auto_376111 ) ) ( not ( = ?auto_376104 ?auto_376112 ) ) ( not ( = ?auto_376104 ?auto_376113 ) ) ( not ( = ?auto_376104 ?auto_376114 ) ) ( not ( = ?auto_376105 ?auto_376106 ) ) ( not ( = ?auto_376105 ?auto_376107 ) ) ( not ( = ?auto_376105 ?auto_376108 ) ) ( not ( = ?auto_376105 ?auto_376109 ) ) ( not ( = ?auto_376105 ?auto_376110 ) ) ( not ( = ?auto_376105 ?auto_376111 ) ) ( not ( = ?auto_376105 ?auto_376112 ) ) ( not ( = ?auto_376105 ?auto_376113 ) ) ( not ( = ?auto_376105 ?auto_376114 ) ) ( not ( = ?auto_376106 ?auto_376107 ) ) ( not ( = ?auto_376106 ?auto_376108 ) ) ( not ( = ?auto_376106 ?auto_376109 ) ) ( not ( = ?auto_376106 ?auto_376110 ) ) ( not ( = ?auto_376106 ?auto_376111 ) ) ( not ( = ?auto_376106 ?auto_376112 ) ) ( not ( = ?auto_376106 ?auto_376113 ) ) ( not ( = ?auto_376106 ?auto_376114 ) ) ( not ( = ?auto_376107 ?auto_376108 ) ) ( not ( = ?auto_376107 ?auto_376109 ) ) ( not ( = ?auto_376107 ?auto_376110 ) ) ( not ( = ?auto_376107 ?auto_376111 ) ) ( not ( = ?auto_376107 ?auto_376112 ) ) ( not ( = ?auto_376107 ?auto_376113 ) ) ( not ( = ?auto_376107 ?auto_376114 ) ) ( not ( = ?auto_376108 ?auto_376109 ) ) ( not ( = ?auto_376108 ?auto_376110 ) ) ( not ( = ?auto_376108 ?auto_376111 ) ) ( not ( = ?auto_376108 ?auto_376112 ) ) ( not ( = ?auto_376108 ?auto_376113 ) ) ( not ( = ?auto_376108 ?auto_376114 ) ) ( not ( = ?auto_376109 ?auto_376110 ) ) ( not ( = ?auto_376109 ?auto_376111 ) ) ( not ( = ?auto_376109 ?auto_376112 ) ) ( not ( = ?auto_376109 ?auto_376113 ) ) ( not ( = ?auto_376109 ?auto_376114 ) ) ( not ( = ?auto_376110 ?auto_376111 ) ) ( not ( = ?auto_376110 ?auto_376112 ) ) ( not ( = ?auto_376110 ?auto_376113 ) ) ( not ( = ?auto_376110 ?auto_376114 ) ) ( not ( = ?auto_376111 ?auto_376112 ) ) ( not ( = ?auto_376111 ?auto_376113 ) ) ( not ( = ?auto_376111 ?auto_376114 ) ) ( not ( = ?auto_376112 ?auto_376113 ) ) ( not ( = ?auto_376112 ?auto_376114 ) ) ( not ( = ?auto_376113 ?auto_376114 ) ) ( ON ?auto_376113 ?auto_376114 ) ( ON ?auto_376112 ?auto_376113 ) ( ON ?auto_376111 ?auto_376112 ) ( ON ?auto_376110 ?auto_376111 ) ( ON ?auto_376109 ?auto_376110 ) ( ON ?auto_376108 ?auto_376109 ) ( ON ?auto_376107 ?auto_376108 ) ( ON ?auto_376106 ?auto_376107 ) ( ON ?auto_376105 ?auto_376106 ) ( ON ?auto_376104 ?auto_376105 ) ( ON ?auto_376103 ?auto_376104 ) ( CLEAR ?auto_376101 ) ( ON ?auto_376102 ?auto_376103 ) ( CLEAR ?auto_376102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_376100 ?auto_376101 ?auto_376102 )
      ( MAKE-15PILE ?auto_376100 ?auto_376101 ?auto_376102 ?auto_376103 ?auto_376104 ?auto_376105 ?auto_376106 ?auto_376107 ?auto_376108 ?auto_376109 ?auto_376110 ?auto_376111 ?auto_376112 ?auto_376113 ?auto_376114 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376130 - BLOCK
      ?auto_376131 - BLOCK
      ?auto_376132 - BLOCK
      ?auto_376133 - BLOCK
      ?auto_376134 - BLOCK
      ?auto_376135 - BLOCK
      ?auto_376136 - BLOCK
      ?auto_376137 - BLOCK
      ?auto_376138 - BLOCK
      ?auto_376139 - BLOCK
      ?auto_376140 - BLOCK
      ?auto_376141 - BLOCK
      ?auto_376142 - BLOCK
      ?auto_376143 - BLOCK
      ?auto_376144 - BLOCK
    )
    :vars
    (
      ?auto_376145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376144 ?auto_376145 ) ( ON-TABLE ?auto_376130 ) ( not ( = ?auto_376130 ?auto_376131 ) ) ( not ( = ?auto_376130 ?auto_376132 ) ) ( not ( = ?auto_376130 ?auto_376133 ) ) ( not ( = ?auto_376130 ?auto_376134 ) ) ( not ( = ?auto_376130 ?auto_376135 ) ) ( not ( = ?auto_376130 ?auto_376136 ) ) ( not ( = ?auto_376130 ?auto_376137 ) ) ( not ( = ?auto_376130 ?auto_376138 ) ) ( not ( = ?auto_376130 ?auto_376139 ) ) ( not ( = ?auto_376130 ?auto_376140 ) ) ( not ( = ?auto_376130 ?auto_376141 ) ) ( not ( = ?auto_376130 ?auto_376142 ) ) ( not ( = ?auto_376130 ?auto_376143 ) ) ( not ( = ?auto_376130 ?auto_376144 ) ) ( not ( = ?auto_376130 ?auto_376145 ) ) ( not ( = ?auto_376131 ?auto_376132 ) ) ( not ( = ?auto_376131 ?auto_376133 ) ) ( not ( = ?auto_376131 ?auto_376134 ) ) ( not ( = ?auto_376131 ?auto_376135 ) ) ( not ( = ?auto_376131 ?auto_376136 ) ) ( not ( = ?auto_376131 ?auto_376137 ) ) ( not ( = ?auto_376131 ?auto_376138 ) ) ( not ( = ?auto_376131 ?auto_376139 ) ) ( not ( = ?auto_376131 ?auto_376140 ) ) ( not ( = ?auto_376131 ?auto_376141 ) ) ( not ( = ?auto_376131 ?auto_376142 ) ) ( not ( = ?auto_376131 ?auto_376143 ) ) ( not ( = ?auto_376131 ?auto_376144 ) ) ( not ( = ?auto_376131 ?auto_376145 ) ) ( not ( = ?auto_376132 ?auto_376133 ) ) ( not ( = ?auto_376132 ?auto_376134 ) ) ( not ( = ?auto_376132 ?auto_376135 ) ) ( not ( = ?auto_376132 ?auto_376136 ) ) ( not ( = ?auto_376132 ?auto_376137 ) ) ( not ( = ?auto_376132 ?auto_376138 ) ) ( not ( = ?auto_376132 ?auto_376139 ) ) ( not ( = ?auto_376132 ?auto_376140 ) ) ( not ( = ?auto_376132 ?auto_376141 ) ) ( not ( = ?auto_376132 ?auto_376142 ) ) ( not ( = ?auto_376132 ?auto_376143 ) ) ( not ( = ?auto_376132 ?auto_376144 ) ) ( not ( = ?auto_376132 ?auto_376145 ) ) ( not ( = ?auto_376133 ?auto_376134 ) ) ( not ( = ?auto_376133 ?auto_376135 ) ) ( not ( = ?auto_376133 ?auto_376136 ) ) ( not ( = ?auto_376133 ?auto_376137 ) ) ( not ( = ?auto_376133 ?auto_376138 ) ) ( not ( = ?auto_376133 ?auto_376139 ) ) ( not ( = ?auto_376133 ?auto_376140 ) ) ( not ( = ?auto_376133 ?auto_376141 ) ) ( not ( = ?auto_376133 ?auto_376142 ) ) ( not ( = ?auto_376133 ?auto_376143 ) ) ( not ( = ?auto_376133 ?auto_376144 ) ) ( not ( = ?auto_376133 ?auto_376145 ) ) ( not ( = ?auto_376134 ?auto_376135 ) ) ( not ( = ?auto_376134 ?auto_376136 ) ) ( not ( = ?auto_376134 ?auto_376137 ) ) ( not ( = ?auto_376134 ?auto_376138 ) ) ( not ( = ?auto_376134 ?auto_376139 ) ) ( not ( = ?auto_376134 ?auto_376140 ) ) ( not ( = ?auto_376134 ?auto_376141 ) ) ( not ( = ?auto_376134 ?auto_376142 ) ) ( not ( = ?auto_376134 ?auto_376143 ) ) ( not ( = ?auto_376134 ?auto_376144 ) ) ( not ( = ?auto_376134 ?auto_376145 ) ) ( not ( = ?auto_376135 ?auto_376136 ) ) ( not ( = ?auto_376135 ?auto_376137 ) ) ( not ( = ?auto_376135 ?auto_376138 ) ) ( not ( = ?auto_376135 ?auto_376139 ) ) ( not ( = ?auto_376135 ?auto_376140 ) ) ( not ( = ?auto_376135 ?auto_376141 ) ) ( not ( = ?auto_376135 ?auto_376142 ) ) ( not ( = ?auto_376135 ?auto_376143 ) ) ( not ( = ?auto_376135 ?auto_376144 ) ) ( not ( = ?auto_376135 ?auto_376145 ) ) ( not ( = ?auto_376136 ?auto_376137 ) ) ( not ( = ?auto_376136 ?auto_376138 ) ) ( not ( = ?auto_376136 ?auto_376139 ) ) ( not ( = ?auto_376136 ?auto_376140 ) ) ( not ( = ?auto_376136 ?auto_376141 ) ) ( not ( = ?auto_376136 ?auto_376142 ) ) ( not ( = ?auto_376136 ?auto_376143 ) ) ( not ( = ?auto_376136 ?auto_376144 ) ) ( not ( = ?auto_376136 ?auto_376145 ) ) ( not ( = ?auto_376137 ?auto_376138 ) ) ( not ( = ?auto_376137 ?auto_376139 ) ) ( not ( = ?auto_376137 ?auto_376140 ) ) ( not ( = ?auto_376137 ?auto_376141 ) ) ( not ( = ?auto_376137 ?auto_376142 ) ) ( not ( = ?auto_376137 ?auto_376143 ) ) ( not ( = ?auto_376137 ?auto_376144 ) ) ( not ( = ?auto_376137 ?auto_376145 ) ) ( not ( = ?auto_376138 ?auto_376139 ) ) ( not ( = ?auto_376138 ?auto_376140 ) ) ( not ( = ?auto_376138 ?auto_376141 ) ) ( not ( = ?auto_376138 ?auto_376142 ) ) ( not ( = ?auto_376138 ?auto_376143 ) ) ( not ( = ?auto_376138 ?auto_376144 ) ) ( not ( = ?auto_376138 ?auto_376145 ) ) ( not ( = ?auto_376139 ?auto_376140 ) ) ( not ( = ?auto_376139 ?auto_376141 ) ) ( not ( = ?auto_376139 ?auto_376142 ) ) ( not ( = ?auto_376139 ?auto_376143 ) ) ( not ( = ?auto_376139 ?auto_376144 ) ) ( not ( = ?auto_376139 ?auto_376145 ) ) ( not ( = ?auto_376140 ?auto_376141 ) ) ( not ( = ?auto_376140 ?auto_376142 ) ) ( not ( = ?auto_376140 ?auto_376143 ) ) ( not ( = ?auto_376140 ?auto_376144 ) ) ( not ( = ?auto_376140 ?auto_376145 ) ) ( not ( = ?auto_376141 ?auto_376142 ) ) ( not ( = ?auto_376141 ?auto_376143 ) ) ( not ( = ?auto_376141 ?auto_376144 ) ) ( not ( = ?auto_376141 ?auto_376145 ) ) ( not ( = ?auto_376142 ?auto_376143 ) ) ( not ( = ?auto_376142 ?auto_376144 ) ) ( not ( = ?auto_376142 ?auto_376145 ) ) ( not ( = ?auto_376143 ?auto_376144 ) ) ( not ( = ?auto_376143 ?auto_376145 ) ) ( not ( = ?auto_376144 ?auto_376145 ) ) ( ON ?auto_376143 ?auto_376144 ) ( ON ?auto_376142 ?auto_376143 ) ( ON ?auto_376141 ?auto_376142 ) ( ON ?auto_376140 ?auto_376141 ) ( ON ?auto_376139 ?auto_376140 ) ( ON ?auto_376138 ?auto_376139 ) ( ON ?auto_376137 ?auto_376138 ) ( ON ?auto_376136 ?auto_376137 ) ( ON ?auto_376135 ?auto_376136 ) ( ON ?auto_376134 ?auto_376135 ) ( ON ?auto_376133 ?auto_376134 ) ( ON ?auto_376132 ?auto_376133 ) ( CLEAR ?auto_376130 ) ( ON ?auto_376131 ?auto_376132 ) ( CLEAR ?auto_376131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376130 ?auto_376131 )
      ( MAKE-15PILE ?auto_376130 ?auto_376131 ?auto_376132 ?auto_376133 ?auto_376134 ?auto_376135 ?auto_376136 ?auto_376137 ?auto_376138 ?auto_376139 ?auto_376140 ?auto_376141 ?auto_376142 ?auto_376143 ?auto_376144 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376161 - BLOCK
      ?auto_376162 - BLOCK
      ?auto_376163 - BLOCK
      ?auto_376164 - BLOCK
      ?auto_376165 - BLOCK
      ?auto_376166 - BLOCK
      ?auto_376167 - BLOCK
      ?auto_376168 - BLOCK
      ?auto_376169 - BLOCK
      ?auto_376170 - BLOCK
      ?auto_376171 - BLOCK
      ?auto_376172 - BLOCK
      ?auto_376173 - BLOCK
      ?auto_376174 - BLOCK
      ?auto_376175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_376175 ) ( ON-TABLE ?auto_376161 ) ( not ( = ?auto_376161 ?auto_376162 ) ) ( not ( = ?auto_376161 ?auto_376163 ) ) ( not ( = ?auto_376161 ?auto_376164 ) ) ( not ( = ?auto_376161 ?auto_376165 ) ) ( not ( = ?auto_376161 ?auto_376166 ) ) ( not ( = ?auto_376161 ?auto_376167 ) ) ( not ( = ?auto_376161 ?auto_376168 ) ) ( not ( = ?auto_376161 ?auto_376169 ) ) ( not ( = ?auto_376161 ?auto_376170 ) ) ( not ( = ?auto_376161 ?auto_376171 ) ) ( not ( = ?auto_376161 ?auto_376172 ) ) ( not ( = ?auto_376161 ?auto_376173 ) ) ( not ( = ?auto_376161 ?auto_376174 ) ) ( not ( = ?auto_376161 ?auto_376175 ) ) ( not ( = ?auto_376162 ?auto_376163 ) ) ( not ( = ?auto_376162 ?auto_376164 ) ) ( not ( = ?auto_376162 ?auto_376165 ) ) ( not ( = ?auto_376162 ?auto_376166 ) ) ( not ( = ?auto_376162 ?auto_376167 ) ) ( not ( = ?auto_376162 ?auto_376168 ) ) ( not ( = ?auto_376162 ?auto_376169 ) ) ( not ( = ?auto_376162 ?auto_376170 ) ) ( not ( = ?auto_376162 ?auto_376171 ) ) ( not ( = ?auto_376162 ?auto_376172 ) ) ( not ( = ?auto_376162 ?auto_376173 ) ) ( not ( = ?auto_376162 ?auto_376174 ) ) ( not ( = ?auto_376162 ?auto_376175 ) ) ( not ( = ?auto_376163 ?auto_376164 ) ) ( not ( = ?auto_376163 ?auto_376165 ) ) ( not ( = ?auto_376163 ?auto_376166 ) ) ( not ( = ?auto_376163 ?auto_376167 ) ) ( not ( = ?auto_376163 ?auto_376168 ) ) ( not ( = ?auto_376163 ?auto_376169 ) ) ( not ( = ?auto_376163 ?auto_376170 ) ) ( not ( = ?auto_376163 ?auto_376171 ) ) ( not ( = ?auto_376163 ?auto_376172 ) ) ( not ( = ?auto_376163 ?auto_376173 ) ) ( not ( = ?auto_376163 ?auto_376174 ) ) ( not ( = ?auto_376163 ?auto_376175 ) ) ( not ( = ?auto_376164 ?auto_376165 ) ) ( not ( = ?auto_376164 ?auto_376166 ) ) ( not ( = ?auto_376164 ?auto_376167 ) ) ( not ( = ?auto_376164 ?auto_376168 ) ) ( not ( = ?auto_376164 ?auto_376169 ) ) ( not ( = ?auto_376164 ?auto_376170 ) ) ( not ( = ?auto_376164 ?auto_376171 ) ) ( not ( = ?auto_376164 ?auto_376172 ) ) ( not ( = ?auto_376164 ?auto_376173 ) ) ( not ( = ?auto_376164 ?auto_376174 ) ) ( not ( = ?auto_376164 ?auto_376175 ) ) ( not ( = ?auto_376165 ?auto_376166 ) ) ( not ( = ?auto_376165 ?auto_376167 ) ) ( not ( = ?auto_376165 ?auto_376168 ) ) ( not ( = ?auto_376165 ?auto_376169 ) ) ( not ( = ?auto_376165 ?auto_376170 ) ) ( not ( = ?auto_376165 ?auto_376171 ) ) ( not ( = ?auto_376165 ?auto_376172 ) ) ( not ( = ?auto_376165 ?auto_376173 ) ) ( not ( = ?auto_376165 ?auto_376174 ) ) ( not ( = ?auto_376165 ?auto_376175 ) ) ( not ( = ?auto_376166 ?auto_376167 ) ) ( not ( = ?auto_376166 ?auto_376168 ) ) ( not ( = ?auto_376166 ?auto_376169 ) ) ( not ( = ?auto_376166 ?auto_376170 ) ) ( not ( = ?auto_376166 ?auto_376171 ) ) ( not ( = ?auto_376166 ?auto_376172 ) ) ( not ( = ?auto_376166 ?auto_376173 ) ) ( not ( = ?auto_376166 ?auto_376174 ) ) ( not ( = ?auto_376166 ?auto_376175 ) ) ( not ( = ?auto_376167 ?auto_376168 ) ) ( not ( = ?auto_376167 ?auto_376169 ) ) ( not ( = ?auto_376167 ?auto_376170 ) ) ( not ( = ?auto_376167 ?auto_376171 ) ) ( not ( = ?auto_376167 ?auto_376172 ) ) ( not ( = ?auto_376167 ?auto_376173 ) ) ( not ( = ?auto_376167 ?auto_376174 ) ) ( not ( = ?auto_376167 ?auto_376175 ) ) ( not ( = ?auto_376168 ?auto_376169 ) ) ( not ( = ?auto_376168 ?auto_376170 ) ) ( not ( = ?auto_376168 ?auto_376171 ) ) ( not ( = ?auto_376168 ?auto_376172 ) ) ( not ( = ?auto_376168 ?auto_376173 ) ) ( not ( = ?auto_376168 ?auto_376174 ) ) ( not ( = ?auto_376168 ?auto_376175 ) ) ( not ( = ?auto_376169 ?auto_376170 ) ) ( not ( = ?auto_376169 ?auto_376171 ) ) ( not ( = ?auto_376169 ?auto_376172 ) ) ( not ( = ?auto_376169 ?auto_376173 ) ) ( not ( = ?auto_376169 ?auto_376174 ) ) ( not ( = ?auto_376169 ?auto_376175 ) ) ( not ( = ?auto_376170 ?auto_376171 ) ) ( not ( = ?auto_376170 ?auto_376172 ) ) ( not ( = ?auto_376170 ?auto_376173 ) ) ( not ( = ?auto_376170 ?auto_376174 ) ) ( not ( = ?auto_376170 ?auto_376175 ) ) ( not ( = ?auto_376171 ?auto_376172 ) ) ( not ( = ?auto_376171 ?auto_376173 ) ) ( not ( = ?auto_376171 ?auto_376174 ) ) ( not ( = ?auto_376171 ?auto_376175 ) ) ( not ( = ?auto_376172 ?auto_376173 ) ) ( not ( = ?auto_376172 ?auto_376174 ) ) ( not ( = ?auto_376172 ?auto_376175 ) ) ( not ( = ?auto_376173 ?auto_376174 ) ) ( not ( = ?auto_376173 ?auto_376175 ) ) ( not ( = ?auto_376174 ?auto_376175 ) ) ( ON ?auto_376174 ?auto_376175 ) ( ON ?auto_376173 ?auto_376174 ) ( ON ?auto_376172 ?auto_376173 ) ( ON ?auto_376171 ?auto_376172 ) ( ON ?auto_376170 ?auto_376171 ) ( ON ?auto_376169 ?auto_376170 ) ( ON ?auto_376168 ?auto_376169 ) ( ON ?auto_376167 ?auto_376168 ) ( ON ?auto_376166 ?auto_376167 ) ( ON ?auto_376165 ?auto_376166 ) ( ON ?auto_376164 ?auto_376165 ) ( ON ?auto_376163 ?auto_376164 ) ( CLEAR ?auto_376161 ) ( ON ?auto_376162 ?auto_376163 ) ( CLEAR ?auto_376162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376161 ?auto_376162 )
      ( MAKE-15PILE ?auto_376161 ?auto_376162 ?auto_376163 ?auto_376164 ?auto_376165 ?auto_376166 ?auto_376167 ?auto_376168 ?auto_376169 ?auto_376170 ?auto_376171 ?auto_376172 ?auto_376173 ?auto_376174 ?auto_376175 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376191 - BLOCK
      ?auto_376192 - BLOCK
      ?auto_376193 - BLOCK
      ?auto_376194 - BLOCK
      ?auto_376195 - BLOCK
      ?auto_376196 - BLOCK
      ?auto_376197 - BLOCK
      ?auto_376198 - BLOCK
      ?auto_376199 - BLOCK
      ?auto_376200 - BLOCK
      ?auto_376201 - BLOCK
      ?auto_376202 - BLOCK
      ?auto_376203 - BLOCK
      ?auto_376204 - BLOCK
      ?auto_376205 - BLOCK
    )
    :vars
    (
      ?auto_376206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376205 ?auto_376206 ) ( not ( = ?auto_376191 ?auto_376192 ) ) ( not ( = ?auto_376191 ?auto_376193 ) ) ( not ( = ?auto_376191 ?auto_376194 ) ) ( not ( = ?auto_376191 ?auto_376195 ) ) ( not ( = ?auto_376191 ?auto_376196 ) ) ( not ( = ?auto_376191 ?auto_376197 ) ) ( not ( = ?auto_376191 ?auto_376198 ) ) ( not ( = ?auto_376191 ?auto_376199 ) ) ( not ( = ?auto_376191 ?auto_376200 ) ) ( not ( = ?auto_376191 ?auto_376201 ) ) ( not ( = ?auto_376191 ?auto_376202 ) ) ( not ( = ?auto_376191 ?auto_376203 ) ) ( not ( = ?auto_376191 ?auto_376204 ) ) ( not ( = ?auto_376191 ?auto_376205 ) ) ( not ( = ?auto_376191 ?auto_376206 ) ) ( not ( = ?auto_376192 ?auto_376193 ) ) ( not ( = ?auto_376192 ?auto_376194 ) ) ( not ( = ?auto_376192 ?auto_376195 ) ) ( not ( = ?auto_376192 ?auto_376196 ) ) ( not ( = ?auto_376192 ?auto_376197 ) ) ( not ( = ?auto_376192 ?auto_376198 ) ) ( not ( = ?auto_376192 ?auto_376199 ) ) ( not ( = ?auto_376192 ?auto_376200 ) ) ( not ( = ?auto_376192 ?auto_376201 ) ) ( not ( = ?auto_376192 ?auto_376202 ) ) ( not ( = ?auto_376192 ?auto_376203 ) ) ( not ( = ?auto_376192 ?auto_376204 ) ) ( not ( = ?auto_376192 ?auto_376205 ) ) ( not ( = ?auto_376192 ?auto_376206 ) ) ( not ( = ?auto_376193 ?auto_376194 ) ) ( not ( = ?auto_376193 ?auto_376195 ) ) ( not ( = ?auto_376193 ?auto_376196 ) ) ( not ( = ?auto_376193 ?auto_376197 ) ) ( not ( = ?auto_376193 ?auto_376198 ) ) ( not ( = ?auto_376193 ?auto_376199 ) ) ( not ( = ?auto_376193 ?auto_376200 ) ) ( not ( = ?auto_376193 ?auto_376201 ) ) ( not ( = ?auto_376193 ?auto_376202 ) ) ( not ( = ?auto_376193 ?auto_376203 ) ) ( not ( = ?auto_376193 ?auto_376204 ) ) ( not ( = ?auto_376193 ?auto_376205 ) ) ( not ( = ?auto_376193 ?auto_376206 ) ) ( not ( = ?auto_376194 ?auto_376195 ) ) ( not ( = ?auto_376194 ?auto_376196 ) ) ( not ( = ?auto_376194 ?auto_376197 ) ) ( not ( = ?auto_376194 ?auto_376198 ) ) ( not ( = ?auto_376194 ?auto_376199 ) ) ( not ( = ?auto_376194 ?auto_376200 ) ) ( not ( = ?auto_376194 ?auto_376201 ) ) ( not ( = ?auto_376194 ?auto_376202 ) ) ( not ( = ?auto_376194 ?auto_376203 ) ) ( not ( = ?auto_376194 ?auto_376204 ) ) ( not ( = ?auto_376194 ?auto_376205 ) ) ( not ( = ?auto_376194 ?auto_376206 ) ) ( not ( = ?auto_376195 ?auto_376196 ) ) ( not ( = ?auto_376195 ?auto_376197 ) ) ( not ( = ?auto_376195 ?auto_376198 ) ) ( not ( = ?auto_376195 ?auto_376199 ) ) ( not ( = ?auto_376195 ?auto_376200 ) ) ( not ( = ?auto_376195 ?auto_376201 ) ) ( not ( = ?auto_376195 ?auto_376202 ) ) ( not ( = ?auto_376195 ?auto_376203 ) ) ( not ( = ?auto_376195 ?auto_376204 ) ) ( not ( = ?auto_376195 ?auto_376205 ) ) ( not ( = ?auto_376195 ?auto_376206 ) ) ( not ( = ?auto_376196 ?auto_376197 ) ) ( not ( = ?auto_376196 ?auto_376198 ) ) ( not ( = ?auto_376196 ?auto_376199 ) ) ( not ( = ?auto_376196 ?auto_376200 ) ) ( not ( = ?auto_376196 ?auto_376201 ) ) ( not ( = ?auto_376196 ?auto_376202 ) ) ( not ( = ?auto_376196 ?auto_376203 ) ) ( not ( = ?auto_376196 ?auto_376204 ) ) ( not ( = ?auto_376196 ?auto_376205 ) ) ( not ( = ?auto_376196 ?auto_376206 ) ) ( not ( = ?auto_376197 ?auto_376198 ) ) ( not ( = ?auto_376197 ?auto_376199 ) ) ( not ( = ?auto_376197 ?auto_376200 ) ) ( not ( = ?auto_376197 ?auto_376201 ) ) ( not ( = ?auto_376197 ?auto_376202 ) ) ( not ( = ?auto_376197 ?auto_376203 ) ) ( not ( = ?auto_376197 ?auto_376204 ) ) ( not ( = ?auto_376197 ?auto_376205 ) ) ( not ( = ?auto_376197 ?auto_376206 ) ) ( not ( = ?auto_376198 ?auto_376199 ) ) ( not ( = ?auto_376198 ?auto_376200 ) ) ( not ( = ?auto_376198 ?auto_376201 ) ) ( not ( = ?auto_376198 ?auto_376202 ) ) ( not ( = ?auto_376198 ?auto_376203 ) ) ( not ( = ?auto_376198 ?auto_376204 ) ) ( not ( = ?auto_376198 ?auto_376205 ) ) ( not ( = ?auto_376198 ?auto_376206 ) ) ( not ( = ?auto_376199 ?auto_376200 ) ) ( not ( = ?auto_376199 ?auto_376201 ) ) ( not ( = ?auto_376199 ?auto_376202 ) ) ( not ( = ?auto_376199 ?auto_376203 ) ) ( not ( = ?auto_376199 ?auto_376204 ) ) ( not ( = ?auto_376199 ?auto_376205 ) ) ( not ( = ?auto_376199 ?auto_376206 ) ) ( not ( = ?auto_376200 ?auto_376201 ) ) ( not ( = ?auto_376200 ?auto_376202 ) ) ( not ( = ?auto_376200 ?auto_376203 ) ) ( not ( = ?auto_376200 ?auto_376204 ) ) ( not ( = ?auto_376200 ?auto_376205 ) ) ( not ( = ?auto_376200 ?auto_376206 ) ) ( not ( = ?auto_376201 ?auto_376202 ) ) ( not ( = ?auto_376201 ?auto_376203 ) ) ( not ( = ?auto_376201 ?auto_376204 ) ) ( not ( = ?auto_376201 ?auto_376205 ) ) ( not ( = ?auto_376201 ?auto_376206 ) ) ( not ( = ?auto_376202 ?auto_376203 ) ) ( not ( = ?auto_376202 ?auto_376204 ) ) ( not ( = ?auto_376202 ?auto_376205 ) ) ( not ( = ?auto_376202 ?auto_376206 ) ) ( not ( = ?auto_376203 ?auto_376204 ) ) ( not ( = ?auto_376203 ?auto_376205 ) ) ( not ( = ?auto_376203 ?auto_376206 ) ) ( not ( = ?auto_376204 ?auto_376205 ) ) ( not ( = ?auto_376204 ?auto_376206 ) ) ( not ( = ?auto_376205 ?auto_376206 ) ) ( ON ?auto_376204 ?auto_376205 ) ( ON ?auto_376203 ?auto_376204 ) ( ON ?auto_376202 ?auto_376203 ) ( ON ?auto_376201 ?auto_376202 ) ( ON ?auto_376200 ?auto_376201 ) ( ON ?auto_376199 ?auto_376200 ) ( ON ?auto_376198 ?auto_376199 ) ( ON ?auto_376197 ?auto_376198 ) ( ON ?auto_376196 ?auto_376197 ) ( ON ?auto_376195 ?auto_376196 ) ( ON ?auto_376194 ?auto_376195 ) ( ON ?auto_376193 ?auto_376194 ) ( ON ?auto_376192 ?auto_376193 ) ( ON ?auto_376191 ?auto_376192 ) ( CLEAR ?auto_376191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376191 )
      ( MAKE-15PILE ?auto_376191 ?auto_376192 ?auto_376193 ?auto_376194 ?auto_376195 ?auto_376196 ?auto_376197 ?auto_376198 ?auto_376199 ?auto_376200 ?auto_376201 ?auto_376202 ?auto_376203 ?auto_376204 ?auto_376205 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376222 - BLOCK
      ?auto_376223 - BLOCK
      ?auto_376224 - BLOCK
      ?auto_376225 - BLOCK
      ?auto_376226 - BLOCK
      ?auto_376227 - BLOCK
      ?auto_376228 - BLOCK
      ?auto_376229 - BLOCK
      ?auto_376230 - BLOCK
      ?auto_376231 - BLOCK
      ?auto_376232 - BLOCK
      ?auto_376233 - BLOCK
      ?auto_376234 - BLOCK
      ?auto_376235 - BLOCK
      ?auto_376236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_376236 ) ( not ( = ?auto_376222 ?auto_376223 ) ) ( not ( = ?auto_376222 ?auto_376224 ) ) ( not ( = ?auto_376222 ?auto_376225 ) ) ( not ( = ?auto_376222 ?auto_376226 ) ) ( not ( = ?auto_376222 ?auto_376227 ) ) ( not ( = ?auto_376222 ?auto_376228 ) ) ( not ( = ?auto_376222 ?auto_376229 ) ) ( not ( = ?auto_376222 ?auto_376230 ) ) ( not ( = ?auto_376222 ?auto_376231 ) ) ( not ( = ?auto_376222 ?auto_376232 ) ) ( not ( = ?auto_376222 ?auto_376233 ) ) ( not ( = ?auto_376222 ?auto_376234 ) ) ( not ( = ?auto_376222 ?auto_376235 ) ) ( not ( = ?auto_376222 ?auto_376236 ) ) ( not ( = ?auto_376223 ?auto_376224 ) ) ( not ( = ?auto_376223 ?auto_376225 ) ) ( not ( = ?auto_376223 ?auto_376226 ) ) ( not ( = ?auto_376223 ?auto_376227 ) ) ( not ( = ?auto_376223 ?auto_376228 ) ) ( not ( = ?auto_376223 ?auto_376229 ) ) ( not ( = ?auto_376223 ?auto_376230 ) ) ( not ( = ?auto_376223 ?auto_376231 ) ) ( not ( = ?auto_376223 ?auto_376232 ) ) ( not ( = ?auto_376223 ?auto_376233 ) ) ( not ( = ?auto_376223 ?auto_376234 ) ) ( not ( = ?auto_376223 ?auto_376235 ) ) ( not ( = ?auto_376223 ?auto_376236 ) ) ( not ( = ?auto_376224 ?auto_376225 ) ) ( not ( = ?auto_376224 ?auto_376226 ) ) ( not ( = ?auto_376224 ?auto_376227 ) ) ( not ( = ?auto_376224 ?auto_376228 ) ) ( not ( = ?auto_376224 ?auto_376229 ) ) ( not ( = ?auto_376224 ?auto_376230 ) ) ( not ( = ?auto_376224 ?auto_376231 ) ) ( not ( = ?auto_376224 ?auto_376232 ) ) ( not ( = ?auto_376224 ?auto_376233 ) ) ( not ( = ?auto_376224 ?auto_376234 ) ) ( not ( = ?auto_376224 ?auto_376235 ) ) ( not ( = ?auto_376224 ?auto_376236 ) ) ( not ( = ?auto_376225 ?auto_376226 ) ) ( not ( = ?auto_376225 ?auto_376227 ) ) ( not ( = ?auto_376225 ?auto_376228 ) ) ( not ( = ?auto_376225 ?auto_376229 ) ) ( not ( = ?auto_376225 ?auto_376230 ) ) ( not ( = ?auto_376225 ?auto_376231 ) ) ( not ( = ?auto_376225 ?auto_376232 ) ) ( not ( = ?auto_376225 ?auto_376233 ) ) ( not ( = ?auto_376225 ?auto_376234 ) ) ( not ( = ?auto_376225 ?auto_376235 ) ) ( not ( = ?auto_376225 ?auto_376236 ) ) ( not ( = ?auto_376226 ?auto_376227 ) ) ( not ( = ?auto_376226 ?auto_376228 ) ) ( not ( = ?auto_376226 ?auto_376229 ) ) ( not ( = ?auto_376226 ?auto_376230 ) ) ( not ( = ?auto_376226 ?auto_376231 ) ) ( not ( = ?auto_376226 ?auto_376232 ) ) ( not ( = ?auto_376226 ?auto_376233 ) ) ( not ( = ?auto_376226 ?auto_376234 ) ) ( not ( = ?auto_376226 ?auto_376235 ) ) ( not ( = ?auto_376226 ?auto_376236 ) ) ( not ( = ?auto_376227 ?auto_376228 ) ) ( not ( = ?auto_376227 ?auto_376229 ) ) ( not ( = ?auto_376227 ?auto_376230 ) ) ( not ( = ?auto_376227 ?auto_376231 ) ) ( not ( = ?auto_376227 ?auto_376232 ) ) ( not ( = ?auto_376227 ?auto_376233 ) ) ( not ( = ?auto_376227 ?auto_376234 ) ) ( not ( = ?auto_376227 ?auto_376235 ) ) ( not ( = ?auto_376227 ?auto_376236 ) ) ( not ( = ?auto_376228 ?auto_376229 ) ) ( not ( = ?auto_376228 ?auto_376230 ) ) ( not ( = ?auto_376228 ?auto_376231 ) ) ( not ( = ?auto_376228 ?auto_376232 ) ) ( not ( = ?auto_376228 ?auto_376233 ) ) ( not ( = ?auto_376228 ?auto_376234 ) ) ( not ( = ?auto_376228 ?auto_376235 ) ) ( not ( = ?auto_376228 ?auto_376236 ) ) ( not ( = ?auto_376229 ?auto_376230 ) ) ( not ( = ?auto_376229 ?auto_376231 ) ) ( not ( = ?auto_376229 ?auto_376232 ) ) ( not ( = ?auto_376229 ?auto_376233 ) ) ( not ( = ?auto_376229 ?auto_376234 ) ) ( not ( = ?auto_376229 ?auto_376235 ) ) ( not ( = ?auto_376229 ?auto_376236 ) ) ( not ( = ?auto_376230 ?auto_376231 ) ) ( not ( = ?auto_376230 ?auto_376232 ) ) ( not ( = ?auto_376230 ?auto_376233 ) ) ( not ( = ?auto_376230 ?auto_376234 ) ) ( not ( = ?auto_376230 ?auto_376235 ) ) ( not ( = ?auto_376230 ?auto_376236 ) ) ( not ( = ?auto_376231 ?auto_376232 ) ) ( not ( = ?auto_376231 ?auto_376233 ) ) ( not ( = ?auto_376231 ?auto_376234 ) ) ( not ( = ?auto_376231 ?auto_376235 ) ) ( not ( = ?auto_376231 ?auto_376236 ) ) ( not ( = ?auto_376232 ?auto_376233 ) ) ( not ( = ?auto_376232 ?auto_376234 ) ) ( not ( = ?auto_376232 ?auto_376235 ) ) ( not ( = ?auto_376232 ?auto_376236 ) ) ( not ( = ?auto_376233 ?auto_376234 ) ) ( not ( = ?auto_376233 ?auto_376235 ) ) ( not ( = ?auto_376233 ?auto_376236 ) ) ( not ( = ?auto_376234 ?auto_376235 ) ) ( not ( = ?auto_376234 ?auto_376236 ) ) ( not ( = ?auto_376235 ?auto_376236 ) ) ( ON ?auto_376235 ?auto_376236 ) ( ON ?auto_376234 ?auto_376235 ) ( ON ?auto_376233 ?auto_376234 ) ( ON ?auto_376232 ?auto_376233 ) ( ON ?auto_376231 ?auto_376232 ) ( ON ?auto_376230 ?auto_376231 ) ( ON ?auto_376229 ?auto_376230 ) ( ON ?auto_376228 ?auto_376229 ) ( ON ?auto_376227 ?auto_376228 ) ( ON ?auto_376226 ?auto_376227 ) ( ON ?auto_376225 ?auto_376226 ) ( ON ?auto_376224 ?auto_376225 ) ( ON ?auto_376223 ?auto_376224 ) ( ON ?auto_376222 ?auto_376223 ) ( CLEAR ?auto_376222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376222 )
      ( MAKE-15PILE ?auto_376222 ?auto_376223 ?auto_376224 ?auto_376225 ?auto_376226 ?auto_376227 ?auto_376228 ?auto_376229 ?auto_376230 ?auto_376231 ?auto_376232 ?auto_376233 ?auto_376234 ?auto_376235 ?auto_376236 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376252 - BLOCK
      ?auto_376253 - BLOCK
      ?auto_376254 - BLOCK
      ?auto_376255 - BLOCK
      ?auto_376256 - BLOCK
      ?auto_376257 - BLOCK
      ?auto_376258 - BLOCK
      ?auto_376259 - BLOCK
      ?auto_376260 - BLOCK
      ?auto_376261 - BLOCK
      ?auto_376262 - BLOCK
      ?auto_376263 - BLOCK
      ?auto_376264 - BLOCK
      ?auto_376265 - BLOCK
      ?auto_376266 - BLOCK
    )
    :vars
    (
      ?auto_376267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_376252 ?auto_376253 ) ) ( not ( = ?auto_376252 ?auto_376254 ) ) ( not ( = ?auto_376252 ?auto_376255 ) ) ( not ( = ?auto_376252 ?auto_376256 ) ) ( not ( = ?auto_376252 ?auto_376257 ) ) ( not ( = ?auto_376252 ?auto_376258 ) ) ( not ( = ?auto_376252 ?auto_376259 ) ) ( not ( = ?auto_376252 ?auto_376260 ) ) ( not ( = ?auto_376252 ?auto_376261 ) ) ( not ( = ?auto_376252 ?auto_376262 ) ) ( not ( = ?auto_376252 ?auto_376263 ) ) ( not ( = ?auto_376252 ?auto_376264 ) ) ( not ( = ?auto_376252 ?auto_376265 ) ) ( not ( = ?auto_376252 ?auto_376266 ) ) ( not ( = ?auto_376253 ?auto_376254 ) ) ( not ( = ?auto_376253 ?auto_376255 ) ) ( not ( = ?auto_376253 ?auto_376256 ) ) ( not ( = ?auto_376253 ?auto_376257 ) ) ( not ( = ?auto_376253 ?auto_376258 ) ) ( not ( = ?auto_376253 ?auto_376259 ) ) ( not ( = ?auto_376253 ?auto_376260 ) ) ( not ( = ?auto_376253 ?auto_376261 ) ) ( not ( = ?auto_376253 ?auto_376262 ) ) ( not ( = ?auto_376253 ?auto_376263 ) ) ( not ( = ?auto_376253 ?auto_376264 ) ) ( not ( = ?auto_376253 ?auto_376265 ) ) ( not ( = ?auto_376253 ?auto_376266 ) ) ( not ( = ?auto_376254 ?auto_376255 ) ) ( not ( = ?auto_376254 ?auto_376256 ) ) ( not ( = ?auto_376254 ?auto_376257 ) ) ( not ( = ?auto_376254 ?auto_376258 ) ) ( not ( = ?auto_376254 ?auto_376259 ) ) ( not ( = ?auto_376254 ?auto_376260 ) ) ( not ( = ?auto_376254 ?auto_376261 ) ) ( not ( = ?auto_376254 ?auto_376262 ) ) ( not ( = ?auto_376254 ?auto_376263 ) ) ( not ( = ?auto_376254 ?auto_376264 ) ) ( not ( = ?auto_376254 ?auto_376265 ) ) ( not ( = ?auto_376254 ?auto_376266 ) ) ( not ( = ?auto_376255 ?auto_376256 ) ) ( not ( = ?auto_376255 ?auto_376257 ) ) ( not ( = ?auto_376255 ?auto_376258 ) ) ( not ( = ?auto_376255 ?auto_376259 ) ) ( not ( = ?auto_376255 ?auto_376260 ) ) ( not ( = ?auto_376255 ?auto_376261 ) ) ( not ( = ?auto_376255 ?auto_376262 ) ) ( not ( = ?auto_376255 ?auto_376263 ) ) ( not ( = ?auto_376255 ?auto_376264 ) ) ( not ( = ?auto_376255 ?auto_376265 ) ) ( not ( = ?auto_376255 ?auto_376266 ) ) ( not ( = ?auto_376256 ?auto_376257 ) ) ( not ( = ?auto_376256 ?auto_376258 ) ) ( not ( = ?auto_376256 ?auto_376259 ) ) ( not ( = ?auto_376256 ?auto_376260 ) ) ( not ( = ?auto_376256 ?auto_376261 ) ) ( not ( = ?auto_376256 ?auto_376262 ) ) ( not ( = ?auto_376256 ?auto_376263 ) ) ( not ( = ?auto_376256 ?auto_376264 ) ) ( not ( = ?auto_376256 ?auto_376265 ) ) ( not ( = ?auto_376256 ?auto_376266 ) ) ( not ( = ?auto_376257 ?auto_376258 ) ) ( not ( = ?auto_376257 ?auto_376259 ) ) ( not ( = ?auto_376257 ?auto_376260 ) ) ( not ( = ?auto_376257 ?auto_376261 ) ) ( not ( = ?auto_376257 ?auto_376262 ) ) ( not ( = ?auto_376257 ?auto_376263 ) ) ( not ( = ?auto_376257 ?auto_376264 ) ) ( not ( = ?auto_376257 ?auto_376265 ) ) ( not ( = ?auto_376257 ?auto_376266 ) ) ( not ( = ?auto_376258 ?auto_376259 ) ) ( not ( = ?auto_376258 ?auto_376260 ) ) ( not ( = ?auto_376258 ?auto_376261 ) ) ( not ( = ?auto_376258 ?auto_376262 ) ) ( not ( = ?auto_376258 ?auto_376263 ) ) ( not ( = ?auto_376258 ?auto_376264 ) ) ( not ( = ?auto_376258 ?auto_376265 ) ) ( not ( = ?auto_376258 ?auto_376266 ) ) ( not ( = ?auto_376259 ?auto_376260 ) ) ( not ( = ?auto_376259 ?auto_376261 ) ) ( not ( = ?auto_376259 ?auto_376262 ) ) ( not ( = ?auto_376259 ?auto_376263 ) ) ( not ( = ?auto_376259 ?auto_376264 ) ) ( not ( = ?auto_376259 ?auto_376265 ) ) ( not ( = ?auto_376259 ?auto_376266 ) ) ( not ( = ?auto_376260 ?auto_376261 ) ) ( not ( = ?auto_376260 ?auto_376262 ) ) ( not ( = ?auto_376260 ?auto_376263 ) ) ( not ( = ?auto_376260 ?auto_376264 ) ) ( not ( = ?auto_376260 ?auto_376265 ) ) ( not ( = ?auto_376260 ?auto_376266 ) ) ( not ( = ?auto_376261 ?auto_376262 ) ) ( not ( = ?auto_376261 ?auto_376263 ) ) ( not ( = ?auto_376261 ?auto_376264 ) ) ( not ( = ?auto_376261 ?auto_376265 ) ) ( not ( = ?auto_376261 ?auto_376266 ) ) ( not ( = ?auto_376262 ?auto_376263 ) ) ( not ( = ?auto_376262 ?auto_376264 ) ) ( not ( = ?auto_376262 ?auto_376265 ) ) ( not ( = ?auto_376262 ?auto_376266 ) ) ( not ( = ?auto_376263 ?auto_376264 ) ) ( not ( = ?auto_376263 ?auto_376265 ) ) ( not ( = ?auto_376263 ?auto_376266 ) ) ( not ( = ?auto_376264 ?auto_376265 ) ) ( not ( = ?auto_376264 ?auto_376266 ) ) ( not ( = ?auto_376265 ?auto_376266 ) ) ( ON ?auto_376252 ?auto_376267 ) ( not ( = ?auto_376266 ?auto_376267 ) ) ( not ( = ?auto_376265 ?auto_376267 ) ) ( not ( = ?auto_376264 ?auto_376267 ) ) ( not ( = ?auto_376263 ?auto_376267 ) ) ( not ( = ?auto_376262 ?auto_376267 ) ) ( not ( = ?auto_376261 ?auto_376267 ) ) ( not ( = ?auto_376260 ?auto_376267 ) ) ( not ( = ?auto_376259 ?auto_376267 ) ) ( not ( = ?auto_376258 ?auto_376267 ) ) ( not ( = ?auto_376257 ?auto_376267 ) ) ( not ( = ?auto_376256 ?auto_376267 ) ) ( not ( = ?auto_376255 ?auto_376267 ) ) ( not ( = ?auto_376254 ?auto_376267 ) ) ( not ( = ?auto_376253 ?auto_376267 ) ) ( not ( = ?auto_376252 ?auto_376267 ) ) ( ON ?auto_376253 ?auto_376252 ) ( ON ?auto_376254 ?auto_376253 ) ( ON ?auto_376255 ?auto_376254 ) ( ON ?auto_376256 ?auto_376255 ) ( ON ?auto_376257 ?auto_376256 ) ( ON ?auto_376258 ?auto_376257 ) ( ON ?auto_376259 ?auto_376258 ) ( ON ?auto_376260 ?auto_376259 ) ( ON ?auto_376261 ?auto_376260 ) ( ON ?auto_376262 ?auto_376261 ) ( ON ?auto_376263 ?auto_376262 ) ( ON ?auto_376264 ?auto_376263 ) ( ON ?auto_376265 ?auto_376264 ) ( ON ?auto_376266 ?auto_376265 ) ( CLEAR ?auto_376266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_376266 ?auto_376265 ?auto_376264 ?auto_376263 ?auto_376262 ?auto_376261 ?auto_376260 ?auto_376259 ?auto_376258 ?auto_376257 ?auto_376256 ?auto_376255 ?auto_376254 ?auto_376253 ?auto_376252 )
      ( MAKE-15PILE ?auto_376252 ?auto_376253 ?auto_376254 ?auto_376255 ?auto_376256 ?auto_376257 ?auto_376258 ?auto_376259 ?auto_376260 ?auto_376261 ?auto_376262 ?auto_376263 ?auto_376264 ?auto_376265 ?auto_376266 ) )
  )

)

