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
      ?auto_100097 - BLOCK
    )
    :vars
    (
      ?auto_100098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100097 ?auto_100098 ) ( CLEAR ?auto_100097 ) ( HAND-EMPTY ) ( not ( = ?auto_100097 ?auto_100098 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100097 ?auto_100098 )
      ( !PUTDOWN ?auto_100097 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100104 - BLOCK
      ?auto_100105 - BLOCK
    )
    :vars
    (
      ?auto_100106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100104 ) ( ON ?auto_100105 ?auto_100106 ) ( CLEAR ?auto_100105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100104 ) ( not ( = ?auto_100104 ?auto_100105 ) ) ( not ( = ?auto_100104 ?auto_100106 ) ) ( not ( = ?auto_100105 ?auto_100106 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100105 ?auto_100106 )
      ( !STACK ?auto_100105 ?auto_100104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100114 - BLOCK
      ?auto_100115 - BLOCK
    )
    :vars
    (
      ?auto_100116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100115 ?auto_100116 ) ( not ( = ?auto_100114 ?auto_100115 ) ) ( not ( = ?auto_100114 ?auto_100116 ) ) ( not ( = ?auto_100115 ?auto_100116 ) ) ( ON ?auto_100114 ?auto_100115 ) ( CLEAR ?auto_100114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100114 )
      ( MAKE-2PILE ?auto_100114 ?auto_100115 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100125 - BLOCK
      ?auto_100126 - BLOCK
      ?auto_100127 - BLOCK
    )
    :vars
    (
      ?auto_100128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100126 ) ( ON ?auto_100127 ?auto_100128 ) ( CLEAR ?auto_100127 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100125 ) ( ON ?auto_100126 ?auto_100125 ) ( not ( = ?auto_100125 ?auto_100126 ) ) ( not ( = ?auto_100125 ?auto_100127 ) ) ( not ( = ?auto_100125 ?auto_100128 ) ) ( not ( = ?auto_100126 ?auto_100127 ) ) ( not ( = ?auto_100126 ?auto_100128 ) ) ( not ( = ?auto_100127 ?auto_100128 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100127 ?auto_100128 )
      ( !STACK ?auto_100127 ?auto_100126 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100139 - BLOCK
      ?auto_100140 - BLOCK
      ?auto_100141 - BLOCK
    )
    :vars
    (
      ?auto_100142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100141 ?auto_100142 ) ( ON-TABLE ?auto_100139 ) ( not ( = ?auto_100139 ?auto_100140 ) ) ( not ( = ?auto_100139 ?auto_100141 ) ) ( not ( = ?auto_100139 ?auto_100142 ) ) ( not ( = ?auto_100140 ?auto_100141 ) ) ( not ( = ?auto_100140 ?auto_100142 ) ) ( not ( = ?auto_100141 ?auto_100142 ) ) ( CLEAR ?auto_100139 ) ( ON ?auto_100140 ?auto_100141 ) ( CLEAR ?auto_100140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100139 ?auto_100140 )
      ( MAKE-3PILE ?auto_100139 ?auto_100140 ?auto_100141 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100153 - BLOCK
      ?auto_100154 - BLOCK
      ?auto_100155 - BLOCK
    )
    :vars
    (
      ?auto_100156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100155 ?auto_100156 ) ( not ( = ?auto_100153 ?auto_100154 ) ) ( not ( = ?auto_100153 ?auto_100155 ) ) ( not ( = ?auto_100153 ?auto_100156 ) ) ( not ( = ?auto_100154 ?auto_100155 ) ) ( not ( = ?auto_100154 ?auto_100156 ) ) ( not ( = ?auto_100155 ?auto_100156 ) ) ( ON ?auto_100154 ?auto_100155 ) ( ON ?auto_100153 ?auto_100154 ) ( CLEAR ?auto_100153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100153 )
      ( MAKE-3PILE ?auto_100153 ?auto_100154 ?auto_100155 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100168 - BLOCK
      ?auto_100169 - BLOCK
      ?auto_100170 - BLOCK
      ?auto_100171 - BLOCK
    )
    :vars
    (
      ?auto_100172 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100170 ) ( ON ?auto_100171 ?auto_100172 ) ( CLEAR ?auto_100171 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100168 ) ( ON ?auto_100169 ?auto_100168 ) ( ON ?auto_100170 ?auto_100169 ) ( not ( = ?auto_100168 ?auto_100169 ) ) ( not ( = ?auto_100168 ?auto_100170 ) ) ( not ( = ?auto_100168 ?auto_100171 ) ) ( not ( = ?auto_100168 ?auto_100172 ) ) ( not ( = ?auto_100169 ?auto_100170 ) ) ( not ( = ?auto_100169 ?auto_100171 ) ) ( not ( = ?auto_100169 ?auto_100172 ) ) ( not ( = ?auto_100170 ?auto_100171 ) ) ( not ( = ?auto_100170 ?auto_100172 ) ) ( not ( = ?auto_100171 ?auto_100172 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100171 ?auto_100172 )
      ( !STACK ?auto_100171 ?auto_100170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100186 - BLOCK
      ?auto_100187 - BLOCK
      ?auto_100188 - BLOCK
      ?auto_100189 - BLOCK
    )
    :vars
    (
      ?auto_100190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100189 ?auto_100190 ) ( ON-TABLE ?auto_100186 ) ( ON ?auto_100187 ?auto_100186 ) ( not ( = ?auto_100186 ?auto_100187 ) ) ( not ( = ?auto_100186 ?auto_100188 ) ) ( not ( = ?auto_100186 ?auto_100189 ) ) ( not ( = ?auto_100186 ?auto_100190 ) ) ( not ( = ?auto_100187 ?auto_100188 ) ) ( not ( = ?auto_100187 ?auto_100189 ) ) ( not ( = ?auto_100187 ?auto_100190 ) ) ( not ( = ?auto_100188 ?auto_100189 ) ) ( not ( = ?auto_100188 ?auto_100190 ) ) ( not ( = ?auto_100189 ?auto_100190 ) ) ( CLEAR ?auto_100187 ) ( ON ?auto_100188 ?auto_100189 ) ( CLEAR ?auto_100188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100186 ?auto_100187 ?auto_100188 )
      ( MAKE-4PILE ?auto_100186 ?auto_100187 ?auto_100188 ?auto_100189 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100204 - BLOCK
      ?auto_100205 - BLOCK
      ?auto_100206 - BLOCK
      ?auto_100207 - BLOCK
    )
    :vars
    (
      ?auto_100208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100207 ?auto_100208 ) ( ON-TABLE ?auto_100204 ) ( not ( = ?auto_100204 ?auto_100205 ) ) ( not ( = ?auto_100204 ?auto_100206 ) ) ( not ( = ?auto_100204 ?auto_100207 ) ) ( not ( = ?auto_100204 ?auto_100208 ) ) ( not ( = ?auto_100205 ?auto_100206 ) ) ( not ( = ?auto_100205 ?auto_100207 ) ) ( not ( = ?auto_100205 ?auto_100208 ) ) ( not ( = ?auto_100206 ?auto_100207 ) ) ( not ( = ?auto_100206 ?auto_100208 ) ) ( not ( = ?auto_100207 ?auto_100208 ) ) ( ON ?auto_100206 ?auto_100207 ) ( CLEAR ?auto_100204 ) ( ON ?auto_100205 ?auto_100206 ) ( CLEAR ?auto_100205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100204 ?auto_100205 )
      ( MAKE-4PILE ?auto_100204 ?auto_100205 ?auto_100206 ?auto_100207 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100222 - BLOCK
      ?auto_100223 - BLOCK
      ?auto_100224 - BLOCK
      ?auto_100225 - BLOCK
    )
    :vars
    (
      ?auto_100226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100225 ?auto_100226 ) ( not ( = ?auto_100222 ?auto_100223 ) ) ( not ( = ?auto_100222 ?auto_100224 ) ) ( not ( = ?auto_100222 ?auto_100225 ) ) ( not ( = ?auto_100222 ?auto_100226 ) ) ( not ( = ?auto_100223 ?auto_100224 ) ) ( not ( = ?auto_100223 ?auto_100225 ) ) ( not ( = ?auto_100223 ?auto_100226 ) ) ( not ( = ?auto_100224 ?auto_100225 ) ) ( not ( = ?auto_100224 ?auto_100226 ) ) ( not ( = ?auto_100225 ?auto_100226 ) ) ( ON ?auto_100224 ?auto_100225 ) ( ON ?auto_100223 ?auto_100224 ) ( ON ?auto_100222 ?auto_100223 ) ( CLEAR ?auto_100222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100222 )
      ( MAKE-4PILE ?auto_100222 ?auto_100223 ?auto_100224 ?auto_100225 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100241 - BLOCK
      ?auto_100242 - BLOCK
      ?auto_100243 - BLOCK
      ?auto_100244 - BLOCK
      ?auto_100245 - BLOCK
    )
    :vars
    (
      ?auto_100246 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100244 ) ( ON ?auto_100245 ?auto_100246 ) ( CLEAR ?auto_100245 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100241 ) ( ON ?auto_100242 ?auto_100241 ) ( ON ?auto_100243 ?auto_100242 ) ( ON ?auto_100244 ?auto_100243 ) ( not ( = ?auto_100241 ?auto_100242 ) ) ( not ( = ?auto_100241 ?auto_100243 ) ) ( not ( = ?auto_100241 ?auto_100244 ) ) ( not ( = ?auto_100241 ?auto_100245 ) ) ( not ( = ?auto_100241 ?auto_100246 ) ) ( not ( = ?auto_100242 ?auto_100243 ) ) ( not ( = ?auto_100242 ?auto_100244 ) ) ( not ( = ?auto_100242 ?auto_100245 ) ) ( not ( = ?auto_100242 ?auto_100246 ) ) ( not ( = ?auto_100243 ?auto_100244 ) ) ( not ( = ?auto_100243 ?auto_100245 ) ) ( not ( = ?auto_100243 ?auto_100246 ) ) ( not ( = ?auto_100244 ?auto_100245 ) ) ( not ( = ?auto_100244 ?auto_100246 ) ) ( not ( = ?auto_100245 ?auto_100246 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100245 ?auto_100246 )
      ( !STACK ?auto_100245 ?auto_100244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100263 - BLOCK
      ?auto_100264 - BLOCK
      ?auto_100265 - BLOCK
      ?auto_100266 - BLOCK
      ?auto_100267 - BLOCK
    )
    :vars
    (
      ?auto_100268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100267 ?auto_100268 ) ( ON-TABLE ?auto_100263 ) ( ON ?auto_100264 ?auto_100263 ) ( ON ?auto_100265 ?auto_100264 ) ( not ( = ?auto_100263 ?auto_100264 ) ) ( not ( = ?auto_100263 ?auto_100265 ) ) ( not ( = ?auto_100263 ?auto_100266 ) ) ( not ( = ?auto_100263 ?auto_100267 ) ) ( not ( = ?auto_100263 ?auto_100268 ) ) ( not ( = ?auto_100264 ?auto_100265 ) ) ( not ( = ?auto_100264 ?auto_100266 ) ) ( not ( = ?auto_100264 ?auto_100267 ) ) ( not ( = ?auto_100264 ?auto_100268 ) ) ( not ( = ?auto_100265 ?auto_100266 ) ) ( not ( = ?auto_100265 ?auto_100267 ) ) ( not ( = ?auto_100265 ?auto_100268 ) ) ( not ( = ?auto_100266 ?auto_100267 ) ) ( not ( = ?auto_100266 ?auto_100268 ) ) ( not ( = ?auto_100267 ?auto_100268 ) ) ( CLEAR ?auto_100265 ) ( ON ?auto_100266 ?auto_100267 ) ( CLEAR ?auto_100266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100263 ?auto_100264 ?auto_100265 ?auto_100266 )
      ( MAKE-5PILE ?auto_100263 ?auto_100264 ?auto_100265 ?auto_100266 ?auto_100267 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100285 - BLOCK
      ?auto_100286 - BLOCK
      ?auto_100287 - BLOCK
      ?auto_100288 - BLOCK
      ?auto_100289 - BLOCK
    )
    :vars
    (
      ?auto_100290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100289 ?auto_100290 ) ( ON-TABLE ?auto_100285 ) ( ON ?auto_100286 ?auto_100285 ) ( not ( = ?auto_100285 ?auto_100286 ) ) ( not ( = ?auto_100285 ?auto_100287 ) ) ( not ( = ?auto_100285 ?auto_100288 ) ) ( not ( = ?auto_100285 ?auto_100289 ) ) ( not ( = ?auto_100285 ?auto_100290 ) ) ( not ( = ?auto_100286 ?auto_100287 ) ) ( not ( = ?auto_100286 ?auto_100288 ) ) ( not ( = ?auto_100286 ?auto_100289 ) ) ( not ( = ?auto_100286 ?auto_100290 ) ) ( not ( = ?auto_100287 ?auto_100288 ) ) ( not ( = ?auto_100287 ?auto_100289 ) ) ( not ( = ?auto_100287 ?auto_100290 ) ) ( not ( = ?auto_100288 ?auto_100289 ) ) ( not ( = ?auto_100288 ?auto_100290 ) ) ( not ( = ?auto_100289 ?auto_100290 ) ) ( ON ?auto_100288 ?auto_100289 ) ( CLEAR ?auto_100286 ) ( ON ?auto_100287 ?auto_100288 ) ( CLEAR ?auto_100287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100285 ?auto_100286 ?auto_100287 )
      ( MAKE-5PILE ?auto_100285 ?auto_100286 ?auto_100287 ?auto_100288 ?auto_100289 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100307 - BLOCK
      ?auto_100308 - BLOCK
      ?auto_100309 - BLOCK
      ?auto_100310 - BLOCK
      ?auto_100311 - BLOCK
    )
    :vars
    (
      ?auto_100312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100311 ?auto_100312 ) ( ON-TABLE ?auto_100307 ) ( not ( = ?auto_100307 ?auto_100308 ) ) ( not ( = ?auto_100307 ?auto_100309 ) ) ( not ( = ?auto_100307 ?auto_100310 ) ) ( not ( = ?auto_100307 ?auto_100311 ) ) ( not ( = ?auto_100307 ?auto_100312 ) ) ( not ( = ?auto_100308 ?auto_100309 ) ) ( not ( = ?auto_100308 ?auto_100310 ) ) ( not ( = ?auto_100308 ?auto_100311 ) ) ( not ( = ?auto_100308 ?auto_100312 ) ) ( not ( = ?auto_100309 ?auto_100310 ) ) ( not ( = ?auto_100309 ?auto_100311 ) ) ( not ( = ?auto_100309 ?auto_100312 ) ) ( not ( = ?auto_100310 ?auto_100311 ) ) ( not ( = ?auto_100310 ?auto_100312 ) ) ( not ( = ?auto_100311 ?auto_100312 ) ) ( ON ?auto_100310 ?auto_100311 ) ( ON ?auto_100309 ?auto_100310 ) ( CLEAR ?auto_100307 ) ( ON ?auto_100308 ?auto_100309 ) ( CLEAR ?auto_100308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100307 ?auto_100308 )
      ( MAKE-5PILE ?auto_100307 ?auto_100308 ?auto_100309 ?auto_100310 ?auto_100311 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100329 - BLOCK
      ?auto_100330 - BLOCK
      ?auto_100331 - BLOCK
      ?auto_100332 - BLOCK
      ?auto_100333 - BLOCK
    )
    :vars
    (
      ?auto_100334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100333 ?auto_100334 ) ( not ( = ?auto_100329 ?auto_100330 ) ) ( not ( = ?auto_100329 ?auto_100331 ) ) ( not ( = ?auto_100329 ?auto_100332 ) ) ( not ( = ?auto_100329 ?auto_100333 ) ) ( not ( = ?auto_100329 ?auto_100334 ) ) ( not ( = ?auto_100330 ?auto_100331 ) ) ( not ( = ?auto_100330 ?auto_100332 ) ) ( not ( = ?auto_100330 ?auto_100333 ) ) ( not ( = ?auto_100330 ?auto_100334 ) ) ( not ( = ?auto_100331 ?auto_100332 ) ) ( not ( = ?auto_100331 ?auto_100333 ) ) ( not ( = ?auto_100331 ?auto_100334 ) ) ( not ( = ?auto_100332 ?auto_100333 ) ) ( not ( = ?auto_100332 ?auto_100334 ) ) ( not ( = ?auto_100333 ?auto_100334 ) ) ( ON ?auto_100332 ?auto_100333 ) ( ON ?auto_100331 ?auto_100332 ) ( ON ?auto_100330 ?auto_100331 ) ( ON ?auto_100329 ?auto_100330 ) ( CLEAR ?auto_100329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100329 )
      ( MAKE-5PILE ?auto_100329 ?auto_100330 ?auto_100331 ?auto_100332 ?auto_100333 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100352 - BLOCK
      ?auto_100353 - BLOCK
      ?auto_100354 - BLOCK
      ?auto_100355 - BLOCK
      ?auto_100356 - BLOCK
      ?auto_100357 - BLOCK
    )
    :vars
    (
      ?auto_100358 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100356 ) ( ON ?auto_100357 ?auto_100358 ) ( CLEAR ?auto_100357 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100352 ) ( ON ?auto_100353 ?auto_100352 ) ( ON ?auto_100354 ?auto_100353 ) ( ON ?auto_100355 ?auto_100354 ) ( ON ?auto_100356 ?auto_100355 ) ( not ( = ?auto_100352 ?auto_100353 ) ) ( not ( = ?auto_100352 ?auto_100354 ) ) ( not ( = ?auto_100352 ?auto_100355 ) ) ( not ( = ?auto_100352 ?auto_100356 ) ) ( not ( = ?auto_100352 ?auto_100357 ) ) ( not ( = ?auto_100352 ?auto_100358 ) ) ( not ( = ?auto_100353 ?auto_100354 ) ) ( not ( = ?auto_100353 ?auto_100355 ) ) ( not ( = ?auto_100353 ?auto_100356 ) ) ( not ( = ?auto_100353 ?auto_100357 ) ) ( not ( = ?auto_100353 ?auto_100358 ) ) ( not ( = ?auto_100354 ?auto_100355 ) ) ( not ( = ?auto_100354 ?auto_100356 ) ) ( not ( = ?auto_100354 ?auto_100357 ) ) ( not ( = ?auto_100354 ?auto_100358 ) ) ( not ( = ?auto_100355 ?auto_100356 ) ) ( not ( = ?auto_100355 ?auto_100357 ) ) ( not ( = ?auto_100355 ?auto_100358 ) ) ( not ( = ?auto_100356 ?auto_100357 ) ) ( not ( = ?auto_100356 ?auto_100358 ) ) ( not ( = ?auto_100357 ?auto_100358 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100357 ?auto_100358 )
      ( !STACK ?auto_100357 ?auto_100356 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100378 - BLOCK
      ?auto_100379 - BLOCK
      ?auto_100380 - BLOCK
      ?auto_100381 - BLOCK
      ?auto_100382 - BLOCK
      ?auto_100383 - BLOCK
    )
    :vars
    (
      ?auto_100384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100383 ?auto_100384 ) ( ON-TABLE ?auto_100378 ) ( ON ?auto_100379 ?auto_100378 ) ( ON ?auto_100380 ?auto_100379 ) ( ON ?auto_100381 ?auto_100380 ) ( not ( = ?auto_100378 ?auto_100379 ) ) ( not ( = ?auto_100378 ?auto_100380 ) ) ( not ( = ?auto_100378 ?auto_100381 ) ) ( not ( = ?auto_100378 ?auto_100382 ) ) ( not ( = ?auto_100378 ?auto_100383 ) ) ( not ( = ?auto_100378 ?auto_100384 ) ) ( not ( = ?auto_100379 ?auto_100380 ) ) ( not ( = ?auto_100379 ?auto_100381 ) ) ( not ( = ?auto_100379 ?auto_100382 ) ) ( not ( = ?auto_100379 ?auto_100383 ) ) ( not ( = ?auto_100379 ?auto_100384 ) ) ( not ( = ?auto_100380 ?auto_100381 ) ) ( not ( = ?auto_100380 ?auto_100382 ) ) ( not ( = ?auto_100380 ?auto_100383 ) ) ( not ( = ?auto_100380 ?auto_100384 ) ) ( not ( = ?auto_100381 ?auto_100382 ) ) ( not ( = ?auto_100381 ?auto_100383 ) ) ( not ( = ?auto_100381 ?auto_100384 ) ) ( not ( = ?auto_100382 ?auto_100383 ) ) ( not ( = ?auto_100382 ?auto_100384 ) ) ( not ( = ?auto_100383 ?auto_100384 ) ) ( CLEAR ?auto_100381 ) ( ON ?auto_100382 ?auto_100383 ) ( CLEAR ?auto_100382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100378 ?auto_100379 ?auto_100380 ?auto_100381 ?auto_100382 )
      ( MAKE-6PILE ?auto_100378 ?auto_100379 ?auto_100380 ?auto_100381 ?auto_100382 ?auto_100383 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100404 - BLOCK
      ?auto_100405 - BLOCK
      ?auto_100406 - BLOCK
      ?auto_100407 - BLOCK
      ?auto_100408 - BLOCK
      ?auto_100409 - BLOCK
    )
    :vars
    (
      ?auto_100410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100409 ?auto_100410 ) ( ON-TABLE ?auto_100404 ) ( ON ?auto_100405 ?auto_100404 ) ( ON ?auto_100406 ?auto_100405 ) ( not ( = ?auto_100404 ?auto_100405 ) ) ( not ( = ?auto_100404 ?auto_100406 ) ) ( not ( = ?auto_100404 ?auto_100407 ) ) ( not ( = ?auto_100404 ?auto_100408 ) ) ( not ( = ?auto_100404 ?auto_100409 ) ) ( not ( = ?auto_100404 ?auto_100410 ) ) ( not ( = ?auto_100405 ?auto_100406 ) ) ( not ( = ?auto_100405 ?auto_100407 ) ) ( not ( = ?auto_100405 ?auto_100408 ) ) ( not ( = ?auto_100405 ?auto_100409 ) ) ( not ( = ?auto_100405 ?auto_100410 ) ) ( not ( = ?auto_100406 ?auto_100407 ) ) ( not ( = ?auto_100406 ?auto_100408 ) ) ( not ( = ?auto_100406 ?auto_100409 ) ) ( not ( = ?auto_100406 ?auto_100410 ) ) ( not ( = ?auto_100407 ?auto_100408 ) ) ( not ( = ?auto_100407 ?auto_100409 ) ) ( not ( = ?auto_100407 ?auto_100410 ) ) ( not ( = ?auto_100408 ?auto_100409 ) ) ( not ( = ?auto_100408 ?auto_100410 ) ) ( not ( = ?auto_100409 ?auto_100410 ) ) ( ON ?auto_100408 ?auto_100409 ) ( CLEAR ?auto_100406 ) ( ON ?auto_100407 ?auto_100408 ) ( CLEAR ?auto_100407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100404 ?auto_100405 ?auto_100406 ?auto_100407 )
      ( MAKE-6PILE ?auto_100404 ?auto_100405 ?auto_100406 ?auto_100407 ?auto_100408 ?auto_100409 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100430 - BLOCK
      ?auto_100431 - BLOCK
      ?auto_100432 - BLOCK
      ?auto_100433 - BLOCK
      ?auto_100434 - BLOCK
      ?auto_100435 - BLOCK
    )
    :vars
    (
      ?auto_100436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100435 ?auto_100436 ) ( ON-TABLE ?auto_100430 ) ( ON ?auto_100431 ?auto_100430 ) ( not ( = ?auto_100430 ?auto_100431 ) ) ( not ( = ?auto_100430 ?auto_100432 ) ) ( not ( = ?auto_100430 ?auto_100433 ) ) ( not ( = ?auto_100430 ?auto_100434 ) ) ( not ( = ?auto_100430 ?auto_100435 ) ) ( not ( = ?auto_100430 ?auto_100436 ) ) ( not ( = ?auto_100431 ?auto_100432 ) ) ( not ( = ?auto_100431 ?auto_100433 ) ) ( not ( = ?auto_100431 ?auto_100434 ) ) ( not ( = ?auto_100431 ?auto_100435 ) ) ( not ( = ?auto_100431 ?auto_100436 ) ) ( not ( = ?auto_100432 ?auto_100433 ) ) ( not ( = ?auto_100432 ?auto_100434 ) ) ( not ( = ?auto_100432 ?auto_100435 ) ) ( not ( = ?auto_100432 ?auto_100436 ) ) ( not ( = ?auto_100433 ?auto_100434 ) ) ( not ( = ?auto_100433 ?auto_100435 ) ) ( not ( = ?auto_100433 ?auto_100436 ) ) ( not ( = ?auto_100434 ?auto_100435 ) ) ( not ( = ?auto_100434 ?auto_100436 ) ) ( not ( = ?auto_100435 ?auto_100436 ) ) ( ON ?auto_100434 ?auto_100435 ) ( ON ?auto_100433 ?auto_100434 ) ( CLEAR ?auto_100431 ) ( ON ?auto_100432 ?auto_100433 ) ( CLEAR ?auto_100432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100430 ?auto_100431 ?auto_100432 )
      ( MAKE-6PILE ?auto_100430 ?auto_100431 ?auto_100432 ?auto_100433 ?auto_100434 ?auto_100435 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100456 - BLOCK
      ?auto_100457 - BLOCK
      ?auto_100458 - BLOCK
      ?auto_100459 - BLOCK
      ?auto_100460 - BLOCK
      ?auto_100461 - BLOCK
    )
    :vars
    (
      ?auto_100462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100461 ?auto_100462 ) ( ON-TABLE ?auto_100456 ) ( not ( = ?auto_100456 ?auto_100457 ) ) ( not ( = ?auto_100456 ?auto_100458 ) ) ( not ( = ?auto_100456 ?auto_100459 ) ) ( not ( = ?auto_100456 ?auto_100460 ) ) ( not ( = ?auto_100456 ?auto_100461 ) ) ( not ( = ?auto_100456 ?auto_100462 ) ) ( not ( = ?auto_100457 ?auto_100458 ) ) ( not ( = ?auto_100457 ?auto_100459 ) ) ( not ( = ?auto_100457 ?auto_100460 ) ) ( not ( = ?auto_100457 ?auto_100461 ) ) ( not ( = ?auto_100457 ?auto_100462 ) ) ( not ( = ?auto_100458 ?auto_100459 ) ) ( not ( = ?auto_100458 ?auto_100460 ) ) ( not ( = ?auto_100458 ?auto_100461 ) ) ( not ( = ?auto_100458 ?auto_100462 ) ) ( not ( = ?auto_100459 ?auto_100460 ) ) ( not ( = ?auto_100459 ?auto_100461 ) ) ( not ( = ?auto_100459 ?auto_100462 ) ) ( not ( = ?auto_100460 ?auto_100461 ) ) ( not ( = ?auto_100460 ?auto_100462 ) ) ( not ( = ?auto_100461 ?auto_100462 ) ) ( ON ?auto_100460 ?auto_100461 ) ( ON ?auto_100459 ?auto_100460 ) ( ON ?auto_100458 ?auto_100459 ) ( CLEAR ?auto_100456 ) ( ON ?auto_100457 ?auto_100458 ) ( CLEAR ?auto_100457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100456 ?auto_100457 )
      ( MAKE-6PILE ?auto_100456 ?auto_100457 ?auto_100458 ?auto_100459 ?auto_100460 ?auto_100461 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100482 - BLOCK
      ?auto_100483 - BLOCK
      ?auto_100484 - BLOCK
      ?auto_100485 - BLOCK
      ?auto_100486 - BLOCK
      ?auto_100487 - BLOCK
    )
    :vars
    (
      ?auto_100488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100487 ?auto_100488 ) ( not ( = ?auto_100482 ?auto_100483 ) ) ( not ( = ?auto_100482 ?auto_100484 ) ) ( not ( = ?auto_100482 ?auto_100485 ) ) ( not ( = ?auto_100482 ?auto_100486 ) ) ( not ( = ?auto_100482 ?auto_100487 ) ) ( not ( = ?auto_100482 ?auto_100488 ) ) ( not ( = ?auto_100483 ?auto_100484 ) ) ( not ( = ?auto_100483 ?auto_100485 ) ) ( not ( = ?auto_100483 ?auto_100486 ) ) ( not ( = ?auto_100483 ?auto_100487 ) ) ( not ( = ?auto_100483 ?auto_100488 ) ) ( not ( = ?auto_100484 ?auto_100485 ) ) ( not ( = ?auto_100484 ?auto_100486 ) ) ( not ( = ?auto_100484 ?auto_100487 ) ) ( not ( = ?auto_100484 ?auto_100488 ) ) ( not ( = ?auto_100485 ?auto_100486 ) ) ( not ( = ?auto_100485 ?auto_100487 ) ) ( not ( = ?auto_100485 ?auto_100488 ) ) ( not ( = ?auto_100486 ?auto_100487 ) ) ( not ( = ?auto_100486 ?auto_100488 ) ) ( not ( = ?auto_100487 ?auto_100488 ) ) ( ON ?auto_100486 ?auto_100487 ) ( ON ?auto_100485 ?auto_100486 ) ( ON ?auto_100484 ?auto_100485 ) ( ON ?auto_100483 ?auto_100484 ) ( ON ?auto_100482 ?auto_100483 ) ( CLEAR ?auto_100482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100482 )
      ( MAKE-6PILE ?auto_100482 ?auto_100483 ?auto_100484 ?auto_100485 ?auto_100486 ?auto_100487 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100509 - BLOCK
      ?auto_100510 - BLOCK
      ?auto_100511 - BLOCK
      ?auto_100512 - BLOCK
      ?auto_100513 - BLOCK
      ?auto_100514 - BLOCK
      ?auto_100515 - BLOCK
    )
    :vars
    (
      ?auto_100516 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100514 ) ( ON ?auto_100515 ?auto_100516 ) ( CLEAR ?auto_100515 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100509 ) ( ON ?auto_100510 ?auto_100509 ) ( ON ?auto_100511 ?auto_100510 ) ( ON ?auto_100512 ?auto_100511 ) ( ON ?auto_100513 ?auto_100512 ) ( ON ?auto_100514 ?auto_100513 ) ( not ( = ?auto_100509 ?auto_100510 ) ) ( not ( = ?auto_100509 ?auto_100511 ) ) ( not ( = ?auto_100509 ?auto_100512 ) ) ( not ( = ?auto_100509 ?auto_100513 ) ) ( not ( = ?auto_100509 ?auto_100514 ) ) ( not ( = ?auto_100509 ?auto_100515 ) ) ( not ( = ?auto_100509 ?auto_100516 ) ) ( not ( = ?auto_100510 ?auto_100511 ) ) ( not ( = ?auto_100510 ?auto_100512 ) ) ( not ( = ?auto_100510 ?auto_100513 ) ) ( not ( = ?auto_100510 ?auto_100514 ) ) ( not ( = ?auto_100510 ?auto_100515 ) ) ( not ( = ?auto_100510 ?auto_100516 ) ) ( not ( = ?auto_100511 ?auto_100512 ) ) ( not ( = ?auto_100511 ?auto_100513 ) ) ( not ( = ?auto_100511 ?auto_100514 ) ) ( not ( = ?auto_100511 ?auto_100515 ) ) ( not ( = ?auto_100511 ?auto_100516 ) ) ( not ( = ?auto_100512 ?auto_100513 ) ) ( not ( = ?auto_100512 ?auto_100514 ) ) ( not ( = ?auto_100512 ?auto_100515 ) ) ( not ( = ?auto_100512 ?auto_100516 ) ) ( not ( = ?auto_100513 ?auto_100514 ) ) ( not ( = ?auto_100513 ?auto_100515 ) ) ( not ( = ?auto_100513 ?auto_100516 ) ) ( not ( = ?auto_100514 ?auto_100515 ) ) ( not ( = ?auto_100514 ?auto_100516 ) ) ( not ( = ?auto_100515 ?auto_100516 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100515 ?auto_100516 )
      ( !STACK ?auto_100515 ?auto_100514 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100539 - BLOCK
      ?auto_100540 - BLOCK
      ?auto_100541 - BLOCK
      ?auto_100542 - BLOCK
      ?auto_100543 - BLOCK
      ?auto_100544 - BLOCK
      ?auto_100545 - BLOCK
    )
    :vars
    (
      ?auto_100546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100545 ?auto_100546 ) ( ON-TABLE ?auto_100539 ) ( ON ?auto_100540 ?auto_100539 ) ( ON ?auto_100541 ?auto_100540 ) ( ON ?auto_100542 ?auto_100541 ) ( ON ?auto_100543 ?auto_100542 ) ( not ( = ?auto_100539 ?auto_100540 ) ) ( not ( = ?auto_100539 ?auto_100541 ) ) ( not ( = ?auto_100539 ?auto_100542 ) ) ( not ( = ?auto_100539 ?auto_100543 ) ) ( not ( = ?auto_100539 ?auto_100544 ) ) ( not ( = ?auto_100539 ?auto_100545 ) ) ( not ( = ?auto_100539 ?auto_100546 ) ) ( not ( = ?auto_100540 ?auto_100541 ) ) ( not ( = ?auto_100540 ?auto_100542 ) ) ( not ( = ?auto_100540 ?auto_100543 ) ) ( not ( = ?auto_100540 ?auto_100544 ) ) ( not ( = ?auto_100540 ?auto_100545 ) ) ( not ( = ?auto_100540 ?auto_100546 ) ) ( not ( = ?auto_100541 ?auto_100542 ) ) ( not ( = ?auto_100541 ?auto_100543 ) ) ( not ( = ?auto_100541 ?auto_100544 ) ) ( not ( = ?auto_100541 ?auto_100545 ) ) ( not ( = ?auto_100541 ?auto_100546 ) ) ( not ( = ?auto_100542 ?auto_100543 ) ) ( not ( = ?auto_100542 ?auto_100544 ) ) ( not ( = ?auto_100542 ?auto_100545 ) ) ( not ( = ?auto_100542 ?auto_100546 ) ) ( not ( = ?auto_100543 ?auto_100544 ) ) ( not ( = ?auto_100543 ?auto_100545 ) ) ( not ( = ?auto_100543 ?auto_100546 ) ) ( not ( = ?auto_100544 ?auto_100545 ) ) ( not ( = ?auto_100544 ?auto_100546 ) ) ( not ( = ?auto_100545 ?auto_100546 ) ) ( CLEAR ?auto_100543 ) ( ON ?auto_100544 ?auto_100545 ) ( CLEAR ?auto_100544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100539 ?auto_100540 ?auto_100541 ?auto_100542 ?auto_100543 ?auto_100544 )
      ( MAKE-7PILE ?auto_100539 ?auto_100540 ?auto_100541 ?auto_100542 ?auto_100543 ?auto_100544 ?auto_100545 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100569 - BLOCK
      ?auto_100570 - BLOCK
      ?auto_100571 - BLOCK
      ?auto_100572 - BLOCK
      ?auto_100573 - BLOCK
      ?auto_100574 - BLOCK
      ?auto_100575 - BLOCK
    )
    :vars
    (
      ?auto_100576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100575 ?auto_100576 ) ( ON-TABLE ?auto_100569 ) ( ON ?auto_100570 ?auto_100569 ) ( ON ?auto_100571 ?auto_100570 ) ( ON ?auto_100572 ?auto_100571 ) ( not ( = ?auto_100569 ?auto_100570 ) ) ( not ( = ?auto_100569 ?auto_100571 ) ) ( not ( = ?auto_100569 ?auto_100572 ) ) ( not ( = ?auto_100569 ?auto_100573 ) ) ( not ( = ?auto_100569 ?auto_100574 ) ) ( not ( = ?auto_100569 ?auto_100575 ) ) ( not ( = ?auto_100569 ?auto_100576 ) ) ( not ( = ?auto_100570 ?auto_100571 ) ) ( not ( = ?auto_100570 ?auto_100572 ) ) ( not ( = ?auto_100570 ?auto_100573 ) ) ( not ( = ?auto_100570 ?auto_100574 ) ) ( not ( = ?auto_100570 ?auto_100575 ) ) ( not ( = ?auto_100570 ?auto_100576 ) ) ( not ( = ?auto_100571 ?auto_100572 ) ) ( not ( = ?auto_100571 ?auto_100573 ) ) ( not ( = ?auto_100571 ?auto_100574 ) ) ( not ( = ?auto_100571 ?auto_100575 ) ) ( not ( = ?auto_100571 ?auto_100576 ) ) ( not ( = ?auto_100572 ?auto_100573 ) ) ( not ( = ?auto_100572 ?auto_100574 ) ) ( not ( = ?auto_100572 ?auto_100575 ) ) ( not ( = ?auto_100572 ?auto_100576 ) ) ( not ( = ?auto_100573 ?auto_100574 ) ) ( not ( = ?auto_100573 ?auto_100575 ) ) ( not ( = ?auto_100573 ?auto_100576 ) ) ( not ( = ?auto_100574 ?auto_100575 ) ) ( not ( = ?auto_100574 ?auto_100576 ) ) ( not ( = ?auto_100575 ?auto_100576 ) ) ( ON ?auto_100574 ?auto_100575 ) ( CLEAR ?auto_100572 ) ( ON ?auto_100573 ?auto_100574 ) ( CLEAR ?auto_100573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100569 ?auto_100570 ?auto_100571 ?auto_100572 ?auto_100573 )
      ( MAKE-7PILE ?auto_100569 ?auto_100570 ?auto_100571 ?auto_100572 ?auto_100573 ?auto_100574 ?auto_100575 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100599 - BLOCK
      ?auto_100600 - BLOCK
      ?auto_100601 - BLOCK
      ?auto_100602 - BLOCK
      ?auto_100603 - BLOCK
      ?auto_100604 - BLOCK
      ?auto_100605 - BLOCK
    )
    :vars
    (
      ?auto_100606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100605 ?auto_100606 ) ( ON-TABLE ?auto_100599 ) ( ON ?auto_100600 ?auto_100599 ) ( ON ?auto_100601 ?auto_100600 ) ( not ( = ?auto_100599 ?auto_100600 ) ) ( not ( = ?auto_100599 ?auto_100601 ) ) ( not ( = ?auto_100599 ?auto_100602 ) ) ( not ( = ?auto_100599 ?auto_100603 ) ) ( not ( = ?auto_100599 ?auto_100604 ) ) ( not ( = ?auto_100599 ?auto_100605 ) ) ( not ( = ?auto_100599 ?auto_100606 ) ) ( not ( = ?auto_100600 ?auto_100601 ) ) ( not ( = ?auto_100600 ?auto_100602 ) ) ( not ( = ?auto_100600 ?auto_100603 ) ) ( not ( = ?auto_100600 ?auto_100604 ) ) ( not ( = ?auto_100600 ?auto_100605 ) ) ( not ( = ?auto_100600 ?auto_100606 ) ) ( not ( = ?auto_100601 ?auto_100602 ) ) ( not ( = ?auto_100601 ?auto_100603 ) ) ( not ( = ?auto_100601 ?auto_100604 ) ) ( not ( = ?auto_100601 ?auto_100605 ) ) ( not ( = ?auto_100601 ?auto_100606 ) ) ( not ( = ?auto_100602 ?auto_100603 ) ) ( not ( = ?auto_100602 ?auto_100604 ) ) ( not ( = ?auto_100602 ?auto_100605 ) ) ( not ( = ?auto_100602 ?auto_100606 ) ) ( not ( = ?auto_100603 ?auto_100604 ) ) ( not ( = ?auto_100603 ?auto_100605 ) ) ( not ( = ?auto_100603 ?auto_100606 ) ) ( not ( = ?auto_100604 ?auto_100605 ) ) ( not ( = ?auto_100604 ?auto_100606 ) ) ( not ( = ?auto_100605 ?auto_100606 ) ) ( ON ?auto_100604 ?auto_100605 ) ( ON ?auto_100603 ?auto_100604 ) ( CLEAR ?auto_100601 ) ( ON ?auto_100602 ?auto_100603 ) ( CLEAR ?auto_100602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100599 ?auto_100600 ?auto_100601 ?auto_100602 )
      ( MAKE-7PILE ?auto_100599 ?auto_100600 ?auto_100601 ?auto_100602 ?auto_100603 ?auto_100604 ?auto_100605 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100629 - BLOCK
      ?auto_100630 - BLOCK
      ?auto_100631 - BLOCK
      ?auto_100632 - BLOCK
      ?auto_100633 - BLOCK
      ?auto_100634 - BLOCK
      ?auto_100635 - BLOCK
    )
    :vars
    (
      ?auto_100636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100635 ?auto_100636 ) ( ON-TABLE ?auto_100629 ) ( ON ?auto_100630 ?auto_100629 ) ( not ( = ?auto_100629 ?auto_100630 ) ) ( not ( = ?auto_100629 ?auto_100631 ) ) ( not ( = ?auto_100629 ?auto_100632 ) ) ( not ( = ?auto_100629 ?auto_100633 ) ) ( not ( = ?auto_100629 ?auto_100634 ) ) ( not ( = ?auto_100629 ?auto_100635 ) ) ( not ( = ?auto_100629 ?auto_100636 ) ) ( not ( = ?auto_100630 ?auto_100631 ) ) ( not ( = ?auto_100630 ?auto_100632 ) ) ( not ( = ?auto_100630 ?auto_100633 ) ) ( not ( = ?auto_100630 ?auto_100634 ) ) ( not ( = ?auto_100630 ?auto_100635 ) ) ( not ( = ?auto_100630 ?auto_100636 ) ) ( not ( = ?auto_100631 ?auto_100632 ) ) ( not ( = ?auto_100631 ?auto_100633 ) ) ( not ( = ?auto_100631 ?auto_100634 ) ) ( not ( = ?auto_100631 ?auto_100635 ) ) ( not ( = ?auto_100631 ?auto_100636 ) ) ( not ( = ?auto_100632 ?auto_100633 ) ) ( not ( = ?auto_100632 ?auto_100634 ) ) ( not ( = ?auto_100632 ?auto_100635 ) ) ( not ( = ?auto_100632 ?auto_100636 ) ) ( not ( = ?auto_100633 ?auto_100634 ) ) ( not ( = ?auto_100633 ?auto_100635 ) ) ( not ( = ?auto_100633 ?auto_100636 ) ) ( not ( = ?auto_100634 ?auto_100635 ) ) ( not ( = ?auto_100634 ?auto_100636 ) ) ( not ( = ?auto_100635 ?auto_100636 ) ) ( ON ?auto_100634 ?auto_100635 ) ( ON ?auto_100633 ?auto_100634 ) ( ON ?auto_100632 ?auto_100633 ) ( CLEAR ?auto_100630 ) ( ON ?auto_100631 ?auto_100632 ) ( CLEAR ?auto_100631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100629 ?auto_100630 ?auto_100631 )
      ( MAKE-7PILE ?auto_100629 ?auto_100630 ?auto_100631 ?auto_100632 ?auto_100633 ?auto_100634 ?auto_100635 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100659 - BLOCK
      ?auto_100660 - BLOCK
      ?auto_100661 - BLOCK
      ?auto_100662 - BLOCK
      ?auto_100663 - BLOCK
      ?auto_100664 - BLOCK
      ?auto_100665 - BLOCK
    )
    :vars
    (
      ?auto_100666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100665 ?auto_100666 ) ( ON-TABLE ?auto_100659 ) ( not ( = ?auto_100659 ?auto_100660 ) ) ( not ( = ?auto_100659 ?auto_100661 ) ) ( not ( = ?auto_100659 ?auto_100662 ) ) ( not ( = ?auto_100659 ?auto_100663 ) ) ( not ( = ?auto_100659 ?auto_100664 ) ) ( not ( = ?auto_100659 ?auto_100665 ) ) ( not ( = ?auto_100659 ?auto_100666 ) ) ( not ( = ?auto_100660 ?auto_100661 ) ) ( not ( = ?auto_100660 ?auto_100662 ) ) ( not ( = ?auto_100660 ?auto_100663 ) ) ( not ( = ?auto_100660 ?auto_100664 ) ) ( not ( = ?auto_100660 ?auto_100665 ) ) ( not ( = ?auto_100660 ?auto_100666 ) ) ( not ( = ?auto_100661 ?auto_100662 ) ) ( not ( = ?auto_100661 ?auto_100663 ) ) ( not ( = ?auto_100661 ?auto_100664 ) ) ( not ( = ?auto_100661 ?auto_100665 ) ) ( not ( = ?auto_100661 ?auto_100666 ) ) ( not ( = ?auto_100662 ?auto_100663 ) ) ( not ( = ?auto_100662 ?auto_100664 ) ) ( not ( = ?auto_100662 ?auto_100665 ) ) ( not ( = ?auto_100662 ?auto_100666 ) ) ( not ( = ?auto_100663 ?auto_100664 ) ) ( not ( = ?auto_100663 ?auto_100665 ) ) ( not ( = ?auto_100663 ?auto_100666 ) ) ( not ( = ?auto_100664 ?auto_100665 ) ) ( not ( = ?auto_100664 ?auto_100666 ) ) ( not ( = ?auto_100665 ?auto_100666 ) ) ( ON ?auto_100664 ?auto_100665 ) ( ON ?auto_100663 ?auto_100664 ) ( ON ?auto_100662 ?auto_100663 ) ( ON ?auto_100661 ?auto_100662 ) ( CLEAR ?auto_100659 ) ( ON ?auto_100660 ?auto_100661 ) ( CLEAR ?auto_100660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100659 ?auto_100660 )
      ( MAKE-7PILE ?auto_100659 ?auto_100660 ?auto_100661 ?auto_100662 ?auto_100663 ?auto_100664 ?auto_100665 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100689 - BLOCK
      ?auto_100690 - BLOCK
      ?auto_100691 - BLOCK
      ?auto_100692 - BLOCK
      ?auto_100693 - BLOCK
      ?auto_100694 - BLOCK
      ?auto_100695 - BLOCK
    )
    :vars
    (
      ?auto_100696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100695 ?auto_100696 ) ( not ( = ?auto_100689 ?auto_100690 ) ) ( not ( = ?auto_100689 ?auto_100691 ) ) ( not ( = ?auto_100689 ?auto_100692 ) ) ( not ( = ?auto_100689 ?auto_100693 ) ) ( not ( = ?auto_100689 ?auto_100694 ) ) ( not ( = ?auto_100689 ?auto_100695 ) ) ( not ( = ?auto_100689 ?auto_100696 ) ) ( not ( = ?auto_100690 ?auto_100691 ) ) ( not ( = ?auto_100690 ?auto_100692 ) ) ( not ( = ?auto_100690 ?auto_100693 ) ) ( not ( = ?auto_100690 ?auto_100694 ) ) ( not ( = ?auto_100690 ?auto_100695 ) ) ( not ( = ?auto_100690 ?auto_100696 ) ) ( not ( = ?auto_100691 ?auto_100692 ) ) ( not ( = ?auto_100691 ?auto_100693 ) ) ( not ( = ?auto_100691 ?auto_100694 ) ) ( not ( = ?auto_100691 ?auto_100695 ) ) ( not ( = ?auto_100691 ?auto_100696 ) ) ( not ( = ?auto_100692 ?auto_100693 ) ) ( not ( = ?auto_100692 ?auto_100694 ) ) ( not ( = ?auto_100692 ?auto_100695 ) ) ( not ( = ?auto_100692 ?auto_100696 ) ) ( not ( = ?auto_100693 ?auto_100694 ) ) ( not ( = ?auto_100693 ?auto_100695 ) ) ( not ( = ?auto_100693 ?auto_100696 ) ) ( not ( = ?auto_100694 ?auto_100695 ) ) ( not ( = ?auto_100694 ?auto_100696 ) ) ( not ( = ?auto_100695 ?auto_100696 ) ) ( ON ?auto_100694 ?auto_100695 ) ( ON ?auto_100693 ?auto_100694 ) ( ON ?auto_100692 ?auto_100693 ) ( ON ?auto_100691 ?auto_100692 ) ( ON ?auto_100690 ?auto_100691 ) ( ON ?auto_100689 ?auto_100690 ) ( CLEAR ?auto_100689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100689 )
      ( MAKE-7PILE ?auto_100689 ?auto_100690 ?auto_100691 ?auto_100692 ?auto_100693 ?auto_100694 ?auto_100695 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100720 - BLOCK
      ?auto_100721 - BLOCK
      ?auto_100722 - BLOCK
      ?auto_100723 - BLOCK
      ?auto_100724 - BLOCK
      ?auto_100725 - BLOCK
      ?auto_100726 - BLOCK
      ?auto_100727 - BLOCK
    )
    :vars
    (
      ?auto_100728 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100726 ) ( ON ?auto_100727 ?auto_100728 ) ( CLEAR ?auto_100727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100720 ) ( ON ?auto_100721 ?auto_100720 ) ( ON ?auto_100722 ?auto_100721 ) ( ON ?auto_100723 ?auto_100722 ) ( ON ?auto_100724 ?auto_100723 ) ( ON ?auto_100725 ?auto_100724 ) ( ON ?auto_100726 ?auto_100725 ) ( not ( = ?auto_100720 ?auto_100721 ) ) ( not ( = ?auto_100720 ?auto_100722 ) ) ( not ( = ?auto_100720 ?auto_100723 ) ) ( not ( = ?auto_100720 ?auto_100724 ) ) ( not ( = ?auto_100720 ?auto_100725 ) ) ( not ( = ?auto_100720 ?auto_100726 ) ) ( not ( = ?auto_100720 ?auto_100727 ) ) ( not ( = ?auto_100720 ?auto_100728 ) ) ( not ( = ?auto_100721 ?auto_100722 ) ) ( not ( = ?auto_100721 ?auto_100723 ) ) ( not ( = ?auto_100721 ?auto_100724 ) ) ( not ( = ?auto_100721 ?auto_100725 ) ) ( not ( = ?auto_100721 ?auto_100726 ) ) ( not ( = ?auto_100721 ?auto_100727 ) ) ( not ( = ?auto_100721 ?auto_100728 ) ) ( not ( = ?auto_100722 ?auto_100723 ) ) ( not ( = ?auto_100722 ?auto_100724 ) ) ( not ( = ?auto_100722 ?auto_100725 ) ) ( not ( = ?auto_100722 ?auto_100726 ) ) ( not ( = ?auto_100722 ?auto_100727 ) ) ( not ( = ?auto_100722 ?auto_100728 ) ) ( not ( = ?auto_100723 ?auto_100724 ) ) ( not ( = ?auto_100723 ?auto_100725 ) ) ( not ( = ?auto_100723 ?auto_100726 ) ) ( not ( = ?auto_100723 ?auto_100727 ) ) ( not ( = ?auto_100723 ?auto_100728 ) ) ( not ( = ?auto_100724 ?auto_100725 ) ) ( not ( = ?auto_100724 ?auto_100726 ) ) ( not ( = ?auto_100724 ?auto_100727 ) ) ( not ( = ?auto_100724 ?auto_100728 ) ) ( not ( = ?auto_100725 ?auto_100726 ) ) ( not ( = ?auto_100725 ?auto_100727 ) ) ( not ( = ?auto_100725 ?auto_100728 ) ) ( not ( = ?auto_100726 ?auto_100727 ) ) ( not ( = ?auto_100726 ?auto_100728 ) ) ( not ( = ?auto_100727 ?auto_100728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100727 ?auto_100728 )
      ( !STACK ?auto_100727 ?auto_100726 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100754 - BLOCK
      ?auto_100755 - BLOCK
      ?auto_100756 - BLOCK
      ?auto_100757 - BLOCK
      ?auto_100758 - BLOCK
      ?auto_100759 - BLOCK
      ?auto_100760 - BLOCK
      ?auto_100761 - BLOCK
    )
    :vars
    (
      ?auto_100762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100761 ?auto_100762 ) ( ON-TABLE ?auto_100754 ) ( ON ?auto_100755 ?auto_100754 ) ( ON ?auto_100756 ?auto_100755 ) ( ON ?auto_100757 ?auto_100756 ) ( ON ?auto_100758 ?auto_100757 ) ( ON ?auto_100759 ?auto_100758 ) ( not ( = ?auto_100754 ?auto_100755 ) ) ( not ( = ?auto_100754 ?auto_100756 ) ) ( not ( = ?auto_100754 ?auto_100757 ) ) ( not ( = ?auto_100754 ?auto_100758 ) ) ( not ( = ?auto_100754 ?auto_100759 ) ) ( not ( = ?auto_100754 ?auto_100760 ) ) ( not ( = ?auto_100754 ?auto_100761 ) ) ( not ( = ?auto_100754 ?auto_100762 ) ) ( not ( = ?auto_100755 ?auto_100756 ) ) ( not ( = ?auto_100755 ?auto_100757 ) ) ( not ( = ?auto_100755 ?auto_100758 ) ) ( not ( = ?auto_100755 ?auto_100759 ) ) ( not ( = ?auto_100755 ?auto_100760 ) ) ( not ( = ?auto_100755 ?auto_100761 ) ) ( not ( = ?auto_100755 ?auto_100762 ) ) ( not ( = ?auto_100756 ?auto_100757 ) ) ( not ( = ?auto_100756 ?auto_100758 ) ) ( not ( = ?auto_100756 ?auto_100759 ) ) ( not ( = ?auto_100756 ?auto_100760 ) ) ( not ( = ?auto_100756 ?auto_100761 ) ) ( not ( = ?auto_100756 ?auto_100762 ) ) ( not ( = ?auto_100757 ?auto_100758 ) ) ( not ( = ?auto_100757 ?auto_100759 ) ) ( not ( = ?auto_100757 ?auto_100760 ) ) ( not ( = ?auto_100757 ?auto_100761 ) ) ( not ( = ?auto_100757 ?auto_100762 ) ) ( not ( = ?auto_100758 ?auto_100759 ) ) ( not ( = ?auto_100758 ?auto_100760 ) ) ( not ( = ?auto_100758 ?auto_100761 ) ) ( not ( = ?auto_100758 ?auto_100762 ) ) ( not ( = ?auto_100759 ?auto_100760 ) ) ( not ( = ?auto_100759 ?auto_100761 ) ) ( not ( = ?auto_100759 ?auto_100762 ) ) ( not ( = ?auto_100760 ?auto_100761 ) ) ( not ( = ?auto_100760 ?auto_100762 ) ) ( not ( = ?auto_100761 ?auto_100762 ) ) ( CLEAR ?auto_100759 ) ( ON ?auto_100760 ?auto_100761 ) ( CLEAR ?auto_100760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100754 ?auto_100755 ?auto_100756 ?auto_100757 ?auto_100758 ?auto_100759 ?auto_100760 )
      ( MAKE-8PILE ?auto_100754 ?auto_100755 ?auto_100756 ?auto_100757 ?auto_100758 ?auto_100759 ?auto_100760 ?auto_100761 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100788 - BLOCK
      ?auto_100789 - BLOCK
      ?auto_100790 - BLOCK
      ?auto_100791 - BLOCK
      ?auto_100792 - BLOCK
      ?auto_100793 - BLOCK
      ?auto_100794 - BLOCK
      ?auto_100795 - BLOCK
    )
    :vars
    (
      ?auto_100796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100795 ?auto_100796 ) ( ON-TABLE ?auto_100788 ) ( ON ?auto_100789 ?auto_100788 ) ( ON ?auto_100790 ?auto_100789 ) ( ON ?auto_100791 ?auto_100790 ) ( ON ?auto_100792 ?auto_100791 ) ( not ( = ?auto_100788 ?auto_100789 ) ) ( not ( = ?auto_100788 ?auto_100790 ) ) ( not ( = ?auto_100788 ?auto_100791 ) ) ( not ( = ?auto_100788 ?auto_100792 ) ) ( not ( = ?auto_100788 ?auto_100793 ) ) ( not ( = ?auto_100788 ?auto_100794 ) ) ( not ( = ?auto_100788 ?auto_100795 ) ) ( not ( = ?auto_100788 ?auto_100796 ) ) ( not ( = ?auto_100789 ?auto_100790 ) ) ( not ( = ?auto_100789 ?auto_100791 ) ) ( not ( = ?auto_100789 ?auto_100792 ) ) ( not ( = ?auto_100789 ?auto_100793 ) ) ( not ( = ?auto_100789 ?auto_100794 ) ) ( not ( = ?auto_100789 ?auto_100795 ) ) ( not ( = ?auto_100789 ?auto_100796 ) ) ( not ( = ?auto_100790 ?auto_100791 ) ) ( not ( = ?auto_100790 ?auto_100792 ) ) ( not ( = ?auto_100790 ?auto_100793 ) ) ( not ( = ?auto_100790 ?auto_100794 ) ) ( not ( = ?auto_100790 ?auto_100795 ) ) ( not ( = ?auto_100790 ?auto_100796 ) ) ( not ( = ?auto_100791 ?auto_100792 ) ) ( not ( = ?auto_100791 ?auto_100793 ) ) ( not ( = ?auto_100791 ?auto_100794 ) ) ( not ( = ?auto_100791 ?auto_100795 ) ) ( not ( = ?auto_100791 ?auto_100796 ) ) ( not ( = ?auto_100792 ?auto_100793 ) ) ( not ( = ?auto_100792 ?auto_100794 ) ) ( not ( = ?auto_100792 ?auto_100795 ) ) ( not ( = ?auto_100792 ?auto_100796 ) ) ( not ( = ?auto_100793 ?auto_100794 ) ) ( not ( = ?auto_100793 ?auto_100795 ) ) ( not ( = ?auto_100793 ?auto_100796 ) ) ( not ( = ?auto_100794 ?auto_100795 ) ) ( not ( = ?auto_100794 ?auto_100796 ) ) ( not ( = ?auto_100795 ?auto_100796 ) ) ( ON ?auto_100794 ?auto_100795 ) ( CLEAR ?auto_100792 ) ( ON ?auto_100793 ?auto_100794 ) ( CLEAR ?auto_100793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100788 ?auto_100789 ?auto_100790 ?auto_100791 ?auto_100792 ?auto_100793 )
      ( MAKE-8PILE ?auto_100788 ?auto_100789 ?auto_100790 ?auto_100791 ?auto_100792 ?auto_100793 ?auto_100794 ?auto_100795 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100822 - BLOCK
      ?auto_100823 - BLOCK
      ?auto_100824 - BLOCK
      ?auto_100825 - BLOCK
      ?auto_100826 - BLOCK
      ?auto_100827 - BLOCK
      ?auto_100828 - BLOCK
      ?auto_100829 - BLOCK
    )
    :vars
    (
      ?auto_100830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100829 ?auto_100830 ) ( ON-TABLE ?auto_100822 ) ( ON ?auto_100823 ?auto_100822 ) ( ON ?auto_100824 ?auto_100823 ) ( ON ?auto_100825 ?auto_100824 ) ( not ( = ?auto_100822 ?auto_100823 ) ) ( not ( = ?auto_100822 ?auto_100824 ) ) ( not ( = ?auto_100822 ?auto_100825 ) ) ( not ( = ?auto_100822 ?auto_100826 ) ) ( not ( = ?auto_100822 ?auto_100827 ) ) ( not ( = ?auto_100822 ?auto_100828 ) ) ( not ( = ?auto_100822 ?auto_100829 ) ) ( not ( = ?auto_100822 ?auto_100830 ) ) ( not ( = ?auto_100823 ?auto_100824 ) ) ( not ( = ?auto_100823 ?auto_100825 ) ) ( not ( = ?auto_100823 ?auto_100826 ) ) ( not ( = ?auto_100823 ?auto_100827 ) ) ( not ( = ?auto_100823 ?auto_100828 ) ) ( not ( = ?auto_100823 ?auto_100829 ) ) ( not ( = ?auto_100823 ?auto_100830 ) ) ( not ( = ?auto_100824 ?auto_100825 ) ) ( not ( = ?auto_100824 ?auto_100826 ) ) ( not ( = ?auto_100824 ?auto_100827 ) ) ( not ( = ?auto_100824 ?auto_100828 ) ) ( not ( = ?auto_100824 ?auto_100829 ) ) ( not ( = ?auto_100824 ?auto_100830 ) ) ( not ( = ?auto_100825 ?auto_100826 ) ) ( not ( = ?auto_100825 ?auto_100827 ) ) ( not ( = ?auto_100825 ?auto_100828 ) ) ( not ( = ?auto_100825 ?auto_100829 ) ) ( not ( = ?auto_100825 ?auto_100830 ) ) ( not ( = ?auto_100826 ?auto_100827 ) ) ( not ( = ?auto_100826 ?auto_100828 ) ) ( not ( = ?auto_100826 ?auto_100829 ) ) ( not ( = ?auto_100826 ?auto_100830 ) ) ( not ( = ?auto_100827 ?auto_100828 ) ) ( not ( = ?auto_100827 ?auto_100829 ) ) ( not ( = ?auto_100827 ?auto_100830 ) ) ( not ( = ?auto_100828 ?auto_100829 ) ) ( not ( = ?auto_100828 ?auto_100830 ) ) ( not ( = ?auto_100829 ?auto_100830 ) ) ( ON ?auto_100828 ?auto_100829 ) ( ON ?auto_100827 ?auto_100828 ) ( CLEAR ?auto_100825 ) ( ON ?auto_100826 ?auto_100827 ) ( CLEAR ?auto_100826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100822 ?auto_100823 ?auto_100824 ?auto_100825 ?auto_100826 )
      ( MAKE-8PILE ?auto_100822 ?auto_100823 ?auto_100824 ?auto_100825 ?auto_100826 ?auto_100827 ?auto_100828 ?auto_100829 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100856 - BLOCK
      ?auto_100857 - BLOCK
      ?auto_100858 - BLOCK
      ?auto_100859 - BLOCK
      ?auto_100860 - BLOCK
      ?auto_100861 - BLOCK
      ?auto_100862 - BLOCK
      ?auto_100863 - BLOCK
    )
    :vars
    (
      ?auto_100864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100863 ?auto_100864 ) ( ON-TABLE ?auto_100856 ) ( ON ?auto_100857 ?auto_100856 ) ( ON ?auto_100858 ?auto_100857 ) ( not ( = ?auto_100856 ?auto_100857 ) ) ( not ( = ?auto_100856 ?auto_100858 ) ) ( not ( = ?auto_100856 ?auto_100859 ) ) ( not ( = ?auto_100856 ?auto_100860 ) ) ( not ( = ?auto_100856 ?auto_100861 ) ) ( not ( = ?auto_100856 ?auto_100862 ) ) ( not ( = ?auto_100856 ?auto_100863 ) ) ( not ( = ?auto_100856 ?auto_100864 ) ) ( not ( = ?auto_100857 ?auto_100858 ) ) ( not ( = ?auto_100857 ?auto_100859 ) ) ( not ( = ?auto_100857 ?auto_100860 ) ) ( not ( = ?auto_100857 ?auto_100861 ) ) ( not ( = ?auto_100857 ?auto_100862 ) ) ( not ( = ?auto_100857 ?auto_100863 ) ) ( not ( = ?auto_100857 ?auto_100864 ) ) ( not ( = ?auto_100858 ?auto_100859 ) ) ( not ( = ?auto_100858 ?auto_100860 ) ) ( not ( = ?auto_100858 ?auto_100861 ) ) ( not ( = ?auto_100858 ?auto_100862 ) ) ( not ( = ?auto_100858 ?auto_100863 ) ) ( not ( = ?auto_100858 ?auto_100864 ) ) ( not ( = ?auto_100859 ?auto_100860 ) ) ( not ( = ?auto_100859 ?auto_100861 ) ) ( not ( = ?auto_100859 ?auto_100862 ) ) ( not ( = ?auto_100859 ?auto_100863 ) ) ( not ( = ?auto_100859 ?auto_100864 ) ) ( not ( = ?auto_100860 ?auto_100861 ) ) ( not ( = ?auto_100860 ?auto_100862 ) ) ( not ( = ?auto_100860 ?auto_100863 ) ) ( not ( = ?auto_100860 ?auto_100864 ) ) ( not ( = ?auto_100861 ?auto_100862 ) ) ( not ( = ?auto_100861 ?auto_100863 ) ) ( not ( = ?auto_100861 ?auto_100864 ) ) ( not ( = ?auto_100862 ?auto_100863 ) ) ( not ( = ?auto_100862 ?auto_100864 ) ) ( not ( = ?auto_100863 ?auto_100864 ) ) ( ON ?auto_100862 ?auto_100863 ) ( ON ?auto_100861 ?auto_100862 ) ( ON ?auto_100860 ?auto_100861 ) ( CLEAR ?auto_100858 ) ( ON ?auto_100859 ?auto_100860 ) ( CLEAR ?auto_100859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100856 ?auto_100857 ?auto_100858 ?auto_100859 )
      ( MAKE-8PILE ?auto_100856 ?auto_100857 ?auto_100858 ?auto_100859 ?auto_100860 ?auto_100861 ?auto_100862 ?auto_100863 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100890 - BLOCK
      ?auto_100891 - BLOCK
      ?auto_100892 - BLOCK
      ?auto_100893 - BLOCK
      ?auto_100894 - BLOCK
      ?auto_100895 - BLOCK
      ?auto_100896 - BLOCK
      ?auto_100897 - BLOCK
    )
    :vars
    (
      ?auto_100898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100897 ?auto_100898 ) ( ON-TABLE ?auto_100890 ) ( ON ?auto_100891 ?auto_100890 ) ( not ( = ?auto_100890 ?auto_100891 ) ) ( not ( = ?auto_100890 ?auto_100892 ) ) ( not ( = ?auto_100890 ?auto_100893 ) ) ( not ( = ?auto_100890 ?auto_100894 ) ) ( not ( = ?auto_100890 ?auto_100895 ) ) ( not ( = ?auto_100890 ?auto_100896 ) ) ( not ( = ?auto_100890 ?auto_100897 ) ) ( not ( = ?auto_100890 ?auto_100898 ) ) ( not ( = ?auto_100891 ?auto_100892 ) ) ( not ( = ?auto_100891 ?auto_100893 ) ) ( not ( = ?auto_100891 ?auto_100894 ) ) ( not ( = ?auto_100891 ?auto_100895 ) ) ( not ( = ?auto_100891 ?auto_100896 ) ) ( not ( = ?auto_100891 ?auto_100897 ) ) ( not ( = ?auto_100891 ?auto_100898 ) ) ( not ( = ?auto_100892 ?auto_100893 ) ) ( not ( = ?auto_100892 ?auto_100894 ) ) ( not ( = ?auto_100892 ?auto_100895 ) ) ( not ( = ?auto_100892 ?auto_100896 ) ) ( not ( = ?auto_100892 ?auto_100897 ) ) ( not ( = ?auto_100892 ?auto_100898 ) ) ( not ( = ?auto_100893 ?auto_100894 ) ) ( not ( = ?auto_100893 ?auto_100895 ) ) ( not ( = ?auto_100893 ?auto_100896 ) ) ( not ( = ?auto_100893 ?auto_100897 ) ) ( not ( = ?auto_100893 ?auto_100898 ) ) ( not ( = ?auto_100894 ?auto_100895 ) ) ( not ( = ?auto_100894 ?auto_100896 ) ) ( not ( = ?auto_100894 ?auto_100897 ) ) ( not ( = ?auto_100894 ?auto_100898 ) ) ( not ( = ?auto_100895 ?auto_100896 ) ) ( not ( = ?auto_100895 ?auto_100897 ) ) ( not ( = ?auto_100895 ?auto_100898 ) ) ( not ( = ?auto_100896 ?auto_100897 ) ) ( not ( = ?auto_100896 ?auto_100898 ) ) ( not ( = ?auto_100897 ?auto_100898 ) ) ( ON ?auto_100896 ?auto_100897 ) ( ON ?auto_100895 ?auto_100896 ) ( ON ?auto_100894 ?auto_100895 ) ( ON ?auto_100893 ?auto_100894 ) ( CLEAR ?auto_100891 ) ( ON ?auto_100892 ?auto_100893 ) ( CLEAR ?auto_100892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100890 ?auto_100891 ?auto_100892 )
      ( MAKE-8PILE ?auto_100890 ?auto_100891 ?auto_100892 ?auto_100893 ?auto_100894 ?auto_100895 ?auto_100896 ?auto_100897 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100924 - BLOCK
      ?auto_100925 - BLOCK
      ?auto_100926 - BLOCK
      ?auto_100927 - BLOCK
      ?auto_100928 - BLOCK
      ?auto_100929 - BLOCK
      ?auto_100930 - BLOCK
      ?auto_100931 - BLOCK
    )
    :vars
    (
      ?auto_100932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100931 ?auto_100932 ) ( ON-TABLE ?auto_100924 ) ( not ( = ?auto_100924 ?auto_100925 ) ) ( not ( = ?auto_100924 ?auto_100926 ) ) ( not ( = ?auto_100924 ?auto_100927 ) ) ( not ( = ?auto_100924 ?auto_100928 ) ) ( not ( = ?auto_100924 ?auto_100929 ) ) ( not ( = ?auto_100924 ?auto_100930 ) ) ( not ( = ?auto_100924 ?auto_100931 ) ) ( not ( = ?auto_100924 ?auto_100932 ) ) ( not ( = ?auto_100925 ?auto_100926 ) ) ( not ( = ?auto_100925 ?auto_100927 ) ) ( not ( = ?auto_100925 ?auto_100928 ) ) ( not ( = ?auto_100925 ?auto_100929 ) ) ( not ( = ?auto_100925 ?auto_100930 ) ) ( not ( = ?auto_100925 ?auto_100931 ) ) ( not ( = ?auto_100925 ?auto_100932 ) ) ( not ( = ?auto_100926 ?auto_100927 ) ) ( not ( = ?auto_100926 ?auto_100928 ) ) ( not ( = ?auto_100926 ?auto_100929 ) ) ( not ( = ?auto_100926 ?auto_100930 ) ) ( not ( = ?auto_100926 ?auto_100931 ) ) ( not ( = ?auto_100926 ?auto_100932 ) ) ( not ( = ?auto_100927 ?auto_100928 ) ) ( not ( = ?auto_100927 ?auto_100929 ) ) ( not ( = ?auto_100927 ?auto_100930 ) ) ( not ( = ?auto_100927 ?auto_100931 ) ) ( not ( = ?auto_100927 ?auto_100932 ) ) ( not ( = ?auto_100928 ?auto_100929 ) ) ( not ( = ?auto_100928 ?auto_100930 ) ) ( not ( = ?auto_100928 ?auto_100931 ) ) ( not ( = ?auto_100928 ?auto_100932 ) ) ( not ( = ?auto_100929 ?auto_100930 ) ) ( not ( = ?auto_100929 ?auto_100931 ) ) ( not ( = ?auto_100929 ?auto_100932 ) ) ( not ( = ?auto_100930 ?auto_100931 ) ) ( not ( = ?auto_100930 ?auto_100932 ) ) ( not ( = ?auto_100931 ?auto_100932 ) ) ( ON ?auto_100930 ?auto_100931 ) ( ON ?auto_100929 ?auto_100930 ) ( ON ?auto_100928 ?auto_100929 ) ( ON ?auto_100927 ?auto_100928 ) ( ON ?auto_100926 ?auto_100927 ) ( CLEAR ?auto_100924 ) ( ON ?auto_100925 ?auto_100926 ) ( CLEAR ?auto_100925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100924 ?auto_100925 )
      ( MAKE-8PILE ?auto_100924 ?auto_100925 ?auto_100926 ?auto_100927 ?auto_100928 ?auto_100929 ?auto_100930 ?auto_100931 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100958 - BLOCK
      ?auto_100959 - BLOCK
      ?auto_100960 - BLOCK
      ?auto_100961 - BLOCK
      ?auto_100962 - BLOCK
      ?auto_100963 - BLOCK
      ?auto_100964 - BLOCK
      ?auto_100965 - BLOCK
    )
    :vars
    (
      ?auto_100966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100965 ?auto_100966 ) ( not ( = ?auto_100958 ?auto_100959 ) ) ( not ( = ?auto_100958 ?auto_100960 ) ) ( not ( = ?auto_100958 ?auto_100961 ) ) ( not ( = ?auto_100958 ?auto_100962 ) ) ( not ( = ?auto_100958 ?auto_100963 ) ) ( not ( = ?auto_100958 ?auto_100964 ) ) ( not ( = ?auto_100958 ?auto_100965 ) ) ( not ( = ?auto_100958 ?auto_100966 ) ) ( not ( = ?auto_100959 ?auto_100960 ) ) ( not ( = ?auto_100959 ?auto_100961 ) ) ( not ( = ?auto_100959 ?auto_100962 ) ) ( not ( = ?auto_100959 ?auto_100963 ) ) ( not ( = ?auto_100959 ?auto_100964 ) ) ( not ( = ?auto_100959 ?auto_100965 ) ) ( not ( = ?auto_100959 ?auto_100966 ) ) ( not ( = ?auto_100960 ?auto_100961 ) ) ( not ( = ?auto_100960 ?auto_100962 ) ) ( not ( = ?auto_100960 ?auto_100963 ) ) ( not ( = ?auto_100960 ?auto_100964 ) ) ( not ( = ?auto_100960 ?auto_100965 ) ) ( not ( = ?auto_100960 ?auto_100966 ) ) ( not ( = ?auto_100961 ?auto_100962 ) ) ( not ( = ?auto_100961 ?auto_100963 ) ) ( not ( = ?auto_100961 ?auto_100964 ) ) ( not ( = ?auto_100961 ?auto_100965 ) ) ( not ( = ?auto_100961 ?auto_100966 ) ) ( not ( = ?auto_100962 ?auto_100963 ) ) ( not ( = ?auto_100962 ?auto_100964 ) ) ( not ( = ?auto_100962 ?auto_100965 ) ) ( not ( = ?auto_100962 ?auto_100966 ) ) ( not ( = ?auto_100963 ?auto_100964 ) ) ( not ( = ?auto_100963 ?auto_100965 ) ) ( not ( = ?auto_100963 ?auto_100966 ) ) ( not ( = ?auto_100964 ?auto_100965 ) ) ( not ( = ?auto_100964 ?auto_100966 ) ) ( not ( = ?auto_100965 ?auto_100966 ) ) ( ON ?auto_100964 ?auto_100965 ) ( ON ?auto_100963 ?auto_100964 ) ( ON ?auto_100962 ?auto_100963 ) ( ON ?auto_100961 ?auto_100962 ) ( ON ?auto_100960 ?auto_100961 ) ( ON ?auto_100959 ?auto_100960 ) ( ON ?auto_100958 ?auto_100959 ) ( CLEAR ?auto_100958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100958 )
      ( MAKE-8PILE ?auto_100958 ?auto_100959 ?auto_100960 ?auto_100961 ?auto_100962 ?auto_100963 ?auto_100964 ?auto_100965 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_100993 - BLOCK
      ?auto_100994 - BLOCK
      ?auto_100995 - BLOCK
      ?auto_100996 - BLOCK
      ?auto_100997 - BLOCK
      ?auto_100998 - BLOCK
      ?auto_100999 - BLOCK
      ?auto_101000 - BLOCK
      ?auto_101001 - BLOCK
    )
    :vars
    (
      ?auto_101002 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101000 ) ( ON ?auto_101001 ?auto_101002 ) ( CLEAR ?auto_101001 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100993 ) ( ON ?auto_100994 ?auto_100993 ) ( ON ?auto_100995 ?auto_100994 ) ( ON ?auto_100996 ?auto_100995 ) ( ON ?auto_100997 ?auto_100996 ) ( ON ?auto_100998 ?auto_100997 ) ( ON ?auto_100999 ?auto_100998 ) ( ON ?auto_101000 ?auto_100999 ) ( not ( = ?auto_100993 ?auto_100994 ) ) ( not ( = ?auto_100993 ?auto_100995 ) ) ( not ( = ?auto_100993 ?auto_100996 ) ) ( not ( = ?auto_100993 ?auto_100997 ) ) ( not ( = ?auto_100993 ?auto_100998 ) ) ( not ( = ?auto_100993 ?auto_100999 ) ) ( not ( = ?auto_100993 ?auto_101000 ) ) ( not ( = ?auto_100993 ?auto_101001 ) ) ( not ( = ?auto_100993 ?auto_101002 ) ) ( not ( = ?auto_100994 ?auto_100995 ) ) ( not ( = ?auto_100994 ?auto_100996 ) ) ( not ( = ?auto_100994 ?auto_100997 ) ) ( not ( = ?auto_100994 ?auto_100998 ) ) ( not ( = ?auto_100994 ?auto_100999 ) ) ( not ( = ?auto_100994 ?auto_101000 ) ) ( not ( = ?auto_100994 ?auto_101001 ) ) ( not ( = ?auto_100994 ?auto_101002 ) ) ( not ( = ?auto_100995 ?auto_100996 ) ) ( not ( = ?auto_100995 ?auto_100997 ) ) ( not ( = ?auto_100995 ?auto_100998 ) ) ( not ( = ?auto_100995 ?auto_100999 ) ) ( not ( = ?auto_100995 ?auto_101000 ) ) ( not ( = ?auto_100995 ?auto_101001 ) ) ( not ( = ?auto_100995 ?auto_101002 ) ) ( not ( = ?auto_100996 ?auto_100997 ) ) ( not ( = ?auto_100996 ?auto_100998 ) ) ( not ( = ?auto_100996 ?auto_100999 ) ) ( not ( = ?auto_100996 ?auto_101000 ) ) ( not ( = ?auto_100996 ?auto_101001 ) ) ( not ( = ?auto_100996 ?auto_101002 ) ) ( not ( = ?auto_100997 ?auto_100998 ) ) ( not ( = ?auto_100997 ?auto_100999 ) ) ( not ( = ?auto_100997 ?auto_101000 ) ) ( not ( = ?auto_100997 ?auto_101001 ) ) ( not ( = ?auto_100997 ?auto_101002 ) ) ( not ( = ?auto_100998 ?auto_100999 ) ) ( not ( = ?auto_100998 ?auto_101000 ) ) ( not ( = ?auto_100998 ?auto_101001 ) ) ( not ( = ?auto_100998 ?auto_101002 ) ) ( not ( = ?auto_100999 ?auto_101000 ) ) ( not ( = ?auto_100999 ?auto_101001 ) ) ( not ( = ?auto_100999 ?auto_101002 ) ) ( not ( = ?auto_101000 ?auto_101001 ) ) ( not ( = ?auto_101000 ?auto_101002 ) ) ( not ( = ?auto_101001 ?auto_101002 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101001 ?auto_101002 )
      ( !STACK ?auto_101001 ?auto_101000 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101031 - BLOCK
      ?auto_101032 - BLOCK
      ?auto_101033 - BLOCK
      ?auto_101034 - BLOCK
      ?auto_101035 - BLOCK
      ?auto_101036 - BLOCK
      ?auto_101037 - BLOCK
      ?auto_101038 - BLOCK
      ?auto_101039 - BLOCK
    )
    :vars
    (
      ?auto_101040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101039 ?auto_101040 ) ( ON-TABLE ?auto_101031 ) ( ON ?auto_101032 ?auto_101031 ) ( ON ?auto_101033 ?auto_101032 ) ( ON ?auto_101034 ?auto_101033 ) ( ON ?auto_101035 ?auto_101034 ) ( ON ?auto_101036 ?auto_101035 ) ( ON ?auto_101037 ?auto_101036 ) ( not ( = ?auto_101031 ?auto_101032 ) ) ( not ( = ?auto_101031 ?auto_101033 ) ) ( not ( = ?auto_101031 ?auto_101034 ) ) ( not ( = ?auto_101031 ?auto_101035 ) ) ( not ( = ?auto_101031 ?auto_101036 ) ) ( not ( = ?auto_101031 ?auto_101037 ) ) ( not ( = ?auto_101031 ?auto_101038 ) ) ( not ( = ?auto_101031 ?auto_101039 ) ) ( not ( = ?auto_101031 ?auto_101040 ) ) ( not ( = ?auto_101032 ?auto_101033 ) ) ( not ( = ?auto_101032 ?auto_101034 ) ) ( not ( = ?auto_101032 ?auto_101035 ) ) ( not ( = ?auto_101032 ?auto_101036 ) ) ( not ( = ?auto_101032 ?auto_101037 ) ) ( not ( = ?auto_101032 ?auto_101038 ) ) ( not ( = ?auto_101032 ?auto_101039 ) ) ( not ( = ?auto_101032 ?auto_101040 ) ) ( not ( = ?auto_101033 ?auto_101034 ) ) ( not ( = ?auto_101033 ?auto_101035 ) ) ( not ( = ?auto_101033 ?auto_101036 ) ) ( not ( = ?auto_101033 ?auto_101037 ) ) ( not ( = ?auto_101033 ?auto_101038 ) ) ( not ( = ?auto_101033 ?auto_101039 ) ) ( not ( = ?auto_101033 ?auto_101040 ) ) ( not ( = ?auto_101034 ?auto_101035 ) ) ( not ( = ?auto_101034 ?auto_101036 ) ) ( not ( = ?auto_101034 ?auto_101037 ) ) ( not ( = ?auto_101034 ?auto_101038 ) ) ( not ( = ?auto_101034 ?auto_101039 ) ) ( not ( = ?auto_101034 ?auto_101040 ) ) ( not ( = ?auto_101035 ?auto_101036 ) ) ( not ( = ?auto_101035 ?auto_101037 ) ) ( not ( = ?auto_101035 ?auto_101038 ) ) ( not ( = ?auto_101035 ?auto_101039 ) ) ( not ( = ?auto_101035 ?auto_101040 ) ) ( not ( = ?auto_101036 ?auto_101037 ) ) ( not ( = ?auto_101036 ?auto_101038 ) ) ( not ( = ?auto_101036 ?auto_101039 ) ) ( not ( = ?auto_101036 ?auto_101040 ) ) ( not ( = ?auto_101037 ?auto_101038 ) ) ( not ( = ?auto_101037 ?auto_101039 ) ) ( not ( = ?auto_101037 ?auto_101040 ) ) ( not ( = ?auto_101038 ?auto_101039 ) ) ( not ( = ?auto_101038 ?auto_101040 ) ) ( not ( = ?auto_101039 ?auto_101040 ) ) ( CLEAR ?auto_101037 ) ( ON ?auto_101038 ?auto_101039 ) ( CLEAR ?auto_101038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_101031 ?auto_101032 ?auto_101033 ?auto_101034 ?auto_101035 ?auto_101036 ?auto_101037 ?auto_101038 )
      ( MAKE-9PILE ?auto_101031 ?auto_101032 ?auto_101033 ?auto_101034 ?auto_101035 ?auto_101036 ?auto_101037 ?auto_101038 ?auto_101039 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101069 - BLOCK
      ?auto_101070 - BLOCK
      ?auto_101071 - BLOCK
      ?auto_101072 - BLOCK
      ?auto_101073 - BLOCK
      ?auto_101074 - BLOCK
      ?auto_101075 - BLOCK
      ?auto_101076 - BLOCK
      ?auto_101077 - BLOCK
    )
    :vars
    (
      ?auto_101078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101077 ?auto_101078 ) ( ON-TABLE ?auto_101069 ) ( ON ?auto_101070 ?auto_101069 ) ( ON ?auto_101071 ?auto_101070 ) ( ON ?auto_101072 ?auto_101071 ) ( ON ?auto_101073 ?auto_101072 ) ( ON ?auto_101074 ?auto_101073 ) ( not ( = ?auto_101069 ?auto_101070 ) ) ( not ( = ?auto_101069 ?auto_101071 ) ) ( not ( = ?auto_101069 ?auto_101072 ) ) ( not ( = ?auto_101069 ?auto_101073 ) ) ( not ( = ?auto_101069 ?auto_101074 ) ) ( not ( = ?auto_101069 ?auto_101075 ) ) ( not ( = ?auto_101069 ?auto_101076 ) ) ( not ( = ?auto_101069 ?auto_101077 ) ) ( not ( = ?auto_101069 ?auto_101078 ) ) ( not ( = ?auto_101070 ?auto_101071 ) ) ( not ( = ?auto_101070 ?auto_101072 ) ) ( not ( = ?auto_101070 ?auto_101073 ) ) ( not ( = ?auto_101070 ?auto_101074 ) ) ( not ( = ?auto_101070 ?auto_101075 ) ) ( not ( = ?auto_101070 ?auto_101076 ) ) ( not ( = ?auto_101070 ?auto_101077 ) ) ( not ( = ?auto_101070 ?auto_101078 ) ) ( not ( = ?auto_101071 ?auto_101072 ) ) ( not ( = ?auto_101071 ?auto_101073 ) ) ( not ( = ?auto_101071 ?auto_101074 ) ) ( not ( = ?auto_101071 ?auto_101075 ) ) ( not ( = ?auto_101071 ?auto_101076 ) ) ( not ( = ?auto_101071 ?auto_101077 ) ) ( not ( = ?auto_101071 ?auto_101078 ) ) ( not ( = ?auto_101072 ?auto_101073 ) ) ( not ( = ?auto_101072 ?auto_101074 ) ) ( not ( = ?auto_101072 ?auto_101075 ) ) ( not ( = ?auto_101072 ?auto_101076 ) ) ( not ( = ?auto_101072 ?auto_101077 ) ) ( not ( = ?auto_101072 ?auto_101078 ) ) ( not ( = ?auto_101073 ?auto_101074 ) ) ( not ( = ?auto_101073 ?auto_101075 ) ) ( not ( = ?auto_101073 ?auto_101076 ) ) ( not ( = ?auto_101073 ?auto_101077 ) ) ( not ( = ?auto_101073 ?auto_101078 ) ) ( not ( = ?auto_101074 ?auto_101075 ) ) ( not ( = ?auto_101074 ?auto_101076 ) ) ( not ( = ?auto_101074 ?auto_101077 ) ) ( not ( = ?auto_101074 ?auto_101078 ) ) ( not ( = ?auto_101075 ?auto_101076 ) ) ( not ( = ?auto_101075 ?auto_101077 ) ) ( not ( = ?auto_101075 ?auto_101078 ) ) ( not ( = ?auto_101076 ?auto_101077 ) ) ( not ( = ?auto_101076 ?auto_101078 ) ) ( not ( = ?auto_101077 ?auto_101078 ) ) ( ON ?auto_101076 ?auto_101077 ) ( CLEAR ?auto_101074 ) ( ON ?auto_101075 ?auto_101076 ) ( CLEAR ?auto_101075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101069 ?auto_101070 ?auto_101071 ?auto_101072 ?auto_101073 ?auto_101074 ?auto_101075 )
      ( MAKE-9PILE ?auto_101069 ?auto_101070 ?auto_101071 ?auto_101072 ?auto_101073 ?auto_101074 ?auto_101075 ?auto_101076 ?auto_101077 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101107 - BLOCK
      ?auto_101108 - BLOCK
      ?auto_101109 - BLOCK
      ?auto_101110 - BLOCK
      ?auto_101111 - BLOCK
      ?auto_101112 - BLOCK
      ?auto_101113 - BLOCK
      ?auto_101114 - BLOCK
      ?auto_101115 - BLOCK
    )
    :vars
    (
      ?auto_101116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101115 ?auto_101116 ) ( ON-TABLE ?auto_101107 ) ( ON ?auto_101108 ?auto_101107 ) ( ON ?auto_101109 ?auto_101108 ) ( ON ?auto_101110 ?auto_101109 ) ( ON ?auto_101111 ?auto_101110 ) ( not ( = ?auto_101107 ?auto_101108 ) ) ( not ( = ?auto_101107 ?auto_101109 ) ) ( not ( = ?auto_101107 ?auto_101110 ) ) ( not ( = ?auto_101107 ?auto_101111 ) ) ( not ( = ?auto_101107 ?auto_101112 ) ) ( not ( = ?auto_101107 ?auto_101113 ) ) ( not ( = ?auto_101107 ?auto_101114 ) ) ( not ( = ?auto_101107 ?auto_101115 ) ) ( not ( = ?auto_101107 ?auto_101116 ) ) ( not ( = ?auto_101108 ?auto_101109 ) ) ( not ( = ?auto_101108 ?auto_101110 ) ) ( not ( = ?auto_101108 ?auto_101111 ) ) ( not ( = ?auto_101108 ?auto_101112 ) ) ( not ( = ?auto_101108 ?auto_101113 ) ) ( not ( = ?auto_101108 ?auto_101114 ) ) ( not ( = ?auto_101108 ?auto_101115 ) ) ( not ( = ?auto_101108 ?auto_101116 ) ) ( not ( = ?auto_101109 ?auto_101110 ) ) ( not ( = ?auto_101109 ?auto_101111 ) ) ( not ( = ?auto_101109 ?auto_101112 ) ) ( not ( = ?auto_101109 ?auto_101113 ) ) ( not ( = ?auto_101109 ?auto_101114 ) ) ( not ( = ?auto_101109 ?auto_101115 ) ) ( not ( = ?auto_101109 ?auto_101116 ) ) ( not ( = ?auto_101110 ?auto_101111 ) ) ( not ( = ?auto_101110 ?auto_101112 ) ) ( not ( = ?auto_101110 ?auto_101113 ) ) ( not ( = ?auto_101110 ?auto_101114 ) ) ( not ( = ?auto_101110 ?auto_101115 ) ) ( not ( = ?auto_101110 ?auto_101116 ) ) ( not ( = ?auto_101111 ?auto_101112 ) ) ( not ( = ?auto_101111 ?auto_101113 ) ) ( not ( = ?auto_101111 ?auto_101114 ) ) ( not ( = ?auto_101111 ?auto_101115 ) ) ( not ( = ?auto_101111 ?auto_101116 ) ) ( not ( = ?auto_101112 ?auto_101113 ) ) ( not ( = ?auto_101112 ?auto_101114 ) ) ( not ( = ?auto_101112 ?auto_101115 ) ) ( not ( = ?auto_101112 ?auto_101116 ) ) ( not ( = ?auto_101113 ?auto_101114 ) ) ( not ( = ?auto_101113 ?auto_101115 ) ) ( not ( = ?auto_101113 ?auto_101116 ) ) ( not ( = ?auto_101114 ?auto_101115 ) ) ( not ( = ?auto_101114 ?auto_101116 ) ) ( not ( = ?auto_101115 ?auto_101116 ) ) ( ON ?auto_101114 ?auto_101115 ) ( ON ?auto_101113 ?auto_101114 ) ( CLEAR ?auto_101111 ) ( ON ?auto_101112 ?auto_101113 ) ( CLEAR ?auto_101112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101107 ?auto_101108 ?auto_101109 ?auto_101110 ?auto_101111 ?auto_101112 )
      ( MAKE-9PILE ?auto_101107 ?auto_101108 ?auto_101109 ?auto_101110 ?auto_101111 ?auto_101112 ?auto_101113 ?auto_101114 ?auto_101115 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101145 - BLOCK
      ?auto_101146 - BLOCK
      ?auto_101147 - BLOCK
      ?auto_101148 - BLOCK
      ?auto_101149 - BLOCK
      ?auto_101150 - BLOCK
      ?auto_101151 - BLOCK
      ?auto_101152 - BLOCK
      ?auto_101153 - BLOCK
    )
    :vars
    (
      ?auto_101154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101153 ?auto_101154 ) ( ON-TABLE ?auto_101145 ) ( ON ?auto_101146 ?auto_101145 ) ( ON ?auto_101147 ?auto_101146 ) ( ON ?auto_101148 ?auto_101147 ) ( not ( = ?auto_101145 ?auto_101146 ) ) ( not ( = ?auto_101145 ?auto_101147 ) ) ( not ( = ?auto_101145 ?auto_101148 ) ) ( not ( = ?auto_101145 ?auto_101149 ) ) ( not ( = ?auto_101145 ?auto_101150 ) ) ( not ( = ?auto_101145 ?auto_101151 ) ) ( not ( = ?auto_101145 ?auto_101152 ) ) ( not ( = ?auto_101145 ?auto_101153 ) ) ( not ( = ?auto_101145 ?auto_101154 ) ) ( not ( = ?auto_101146 ?auto_101147 ) ) ( not ( = ?auto_101146 ?auto_101148 ) ) ( not ( = ?auto_101146 ?auto_101149 ) ) ( not ( = ?auto_101146 ?auto_101150 ) ) ( not ( = ?auto_101146 ?auto_101151 ) ) ( not ( = ?auto_101146 ?auto_101152 ) ) ( not ( = ?auto_101146 ?auto_101153 ) ) ( not ( = ?auto_101146 ?auto_101154 ) ) ( not ( = ?auto_101147 ?auto_101148 ) ) ( not ( = ?auto_101147 ?auto_101149 ) ) ( not ( = ?auto_101147 ?auto_101150 ) ) ( not ( = ?auto_101147 ?auto_101151 ) ) ( not ( = ?auto_101147 ?auto_101152 ) ) ( not ( = ?auto_101147 ?auto_101153 ) ) ( not ( = ?auto_101147 ?auto_101154 ) ) ( not ( = ?auto_101148 ?auto_101149 ) ) ( not ( = ?auto_101148 ?auto_101150 ) ) ( not ( = ?auto_101148 ?auto_101151 ) ) ( not ( = ?auto_101148 ?auto_101152 ) ) ( not ( = ?auto_101148 ?auto_101153 ) ) ( not ( = ?auto_101148 ?auto_101154 ) ) ( not ( = ?auto_101149 ?auto_101150 ) ) ( not ( = ?auto_101149 ?auto_101151 ) ) ( not ( = ?auto_101149 ?auto_101152 ) ) ( not ( = ?auto_101149 ?auto_101153 ) ) ( not ( = ?auto_101149 ?auto_101154 ) ) ( not ( = ?auto_101150 ?auto_101151 ) ) ( not ( = ?auto_101150 ?auto_101152 ) ) ( not ( = ?auto_101150 ?auto_101153 ) ) ( not ( = ?auto_101150 ?auto_101154 ) ) ( not ( = ?auto_101151 ?auto_101152 ) ) ( not ( = ?auto_101151 ?auto_101153 ) ) ( not ( = ?auto_101151 ?auto_101154 ) ) ( not ( = ?auto_101152 ?auto_101153 ) ) ( not ( = ?auto_101152 ?auto_101154 ) ) ( not ( = ?auto_101153 ?auto_101154 ) ) ( ON ?auto_101152 ?auto_101153 ) ( ON ?auto_101151 ?auto_101152 ) ( ON ?auto_101150 ?auto_101151 ) ( CLEAR ?auto_101148 ) ( ON ?auto_101149 ?auto_101150 ) ( CLEAR ?auto_101149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101145 ?auto_101146 ?auto_101147 ?auto_101148 ?auto_101149 )
      ( MAKE-9PILE ?auto_101145 ?auto_101146 ?auto_101147 ?auto_101148 ?auto_101149 ?auto_101150 ?auto_101151 ?auto_101152 ?auto_101153 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101183 - BLOCK
      ?auto_101184 - BLOCK
      ?auto_101185 - BLOCK
      ?auto_101186 - BLOCK
      ?auto_101187 - BLOCK
      ?auto_101188 - BLOCK
      ?auto_101189 - BLOCK
      ?auto_101190 - BLOCK
      ?auto_101191 - BLOCK
    )
    :vars
    (
      ?auto_101192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101191 ?auto_101192 ) ( ON-TABLE ?auto_101183 ) ( ON ?auto_101184 ?auto_101183 ) ( ON ?auto_101185 ?auto_101184 ) ( not ( = ?auto_101183 ?auto_101184 ) ) ( not ( = ?auto_101183 ?auto_101185 ) ) ( not ( = ?auto_101183 ?auto_101186 ) ) ( not ( = ?auto_101183 ?auto_101187 ) ) ( not ( = ?auto_101183 ?auto_101188 ) ) ( not ( = ?auto_101183 ?auto_101189 ) ) ( not ( = ?auto_101183 ?auto_101190 ) ) ( not ( = ?auto_101183 ?auto_101191 ) ) ( not ( = ?auto_101183 ?auto_101192 ) ) ( not ( = ?auto_101184 ?auto_101185 ) ) ( not ( = ?auto_101184 ?auto_101186 ) ) ( not ( = ?auto_101184 ?auto_101187 ) ) ( not ( = ?auto_101184 ?auto_101188 ) ) ( not ( = ?auto_101184 ?auto_101189 ) ) ( not ( = ?auto_101184 ?auto_101190 ) ) ( not ( = ?auto_101184 ?auto_101191 ) ) ( not ( = ?auto_101184 ?auto_101192 ) ) ( not ( = ?auto_101185 ?auto_101186 ) ) ( not ( = ?auto_101185 ?auto_101187 ) ) ( not ( = ?auto_101185 ?auto_101188 ) ) ( not ( = ?auto_101185 ?auto_101189 ) ) ( not ( = ?auto_101185 ?auto_101190 ) ) ( not ( = ?auto_101185 ?auto_101191 ) ) ( not ( = ?auto_101185 ?auto_101192 ) ) ( not ( = ?auto_101186 ?auto_101187 ) ) ( not ( = ?auto_101186 ?auto_101188 ) ) ( not ( = ?auto_101186 ?auto_101189 ) ) ( not ( = ?auto_101186 ?auto_101190 ) ) ( not ( = ?auto_101186 ?auto_101191 ) ) ( not ( = ?auto_101186 ?auto_101192 ) ) ( not ( = ?auto_101187 ?auto_101188 ) ) ( not ( = ?auto_101187 ?auto_101189 ) ) ( not ( = ?auto_101187 ?auto_101190 ) ) ( not ( = ?auto_101187 ?auto_101191 ) ) ( not ( = ?auto_101187 ?auto_101192 ) ) ( not ( = ?auto_101188 ?auto_101189 ) ) ( not ( = ?auto_101188 ?auto_101190 ) ) ( not ( = ?auto_101188 ?auto_101191 ) ) ( not ( = ?auto_101188 ?auto_101192 ) ) ( not ( = ?auto_101189 ?auto_101190 ) ) ( not ( = ?auto_101189 ?auto_101191 ) ) ( not ( = ?auto_101189 ?auto_101192 ) ) ( not ( = ?auto_101190 ?auto_101191 ) ) ( not ( = ?auto_101190 ?auto_101192 ) ) ( not ( = ?auto_101191 ?auto_101192 ) ) ( ON ?auto_101190 ?auto_101191 ) ( ON ?auto_101189 ?auto_101190 ) ( ON ?auto_101188 ?auto_101189 ) ( ON ?auto_101187 ?auto_101188 ) ( CLEAR ?auto_101185 ) ( ON ?auto_101186 ?auto_101187 ) ( CLEAR ?auto_101186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101183 ?auto_101184 ?auto_101185 ?auto_101186 )
      ( MAKE-9PILE ?auto_101183 ?auto_101184 ?auto_101185 ?auto_101186 ?auto_101187 ?auto_101188 ?auto_101189 ?auto_101190 ?auto_101191 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101221 - BLOCK
      ?auto_101222 - BLOCK
      ?auto_101223 - BLOCK
      ?auto_101224 - BLOCK
      ?auto_101225 - BLOCK
      ?auto_101226 - BLOCK
      ?auto_101227 - BLOCK
      ?auto_101228 - BLOCK
      ?auto_101229 - BLOCK
    )
    :vars
    (
      ?auto_101230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101229 ?auto_101230 ) ( ON-TABLE ?auto_101221 ) ( ON ?auto_101222 ?auto_101221 ) ( not ( = ?auto_101221 ?auto_101222 ) ) ( not ( = ?auto_101221 ?auto_101223 ) ) ( not ( = ?auto_101221 ?auto_101224 ) ) ( not ( = ?auto_101221 ?auto_101225 ) ) ( not ( = ?auto_101221 ?auto_101226 ) ) ( not ( = ?auto_101221 ?auto_101227 ) ) ( not ( = ?auto_101221 ?auto_101228 ) ) ( not ( = ?auto_101221 ?auto_101229 ) ) ( not ( = ?auto_101221 ?auto_101230 ) ) ( not ( = ?auto_101222 ?auto_101223 ) ) ( not ( = ?auto_101222 ?auto_101224 ) ) ( not ( = ?auto_101222 ?auto_101225 ) ) ( not ( = ?auto_101222 ?auto_101226 ) ) ( not ( = ?auto_101222 ?auto_101227 ) ) ( not ( = ?auto_101222 ?auto_101228 ) ) ( not ( = ?auto_101222 ?auto_101229 ) ) ( not ( = ?auto_101222 ?auto_101230 ) ) ( not ( = ?auto_101223 ?auto_101224 ) ) ( not ( = ?auto_101223 ?auto_101225 ) ) ( not ( = ?auto_101223 ?auto_101226 ) ) ( not ( = ?auto_101223 ?auto_101227 ) ) ( not ( = ?auto_101223 ?auto_101228 ) ) ( not ( = ?auto_101223 ?auto_101229 ) ) ( not ( = ?auto_101223 ?auto_101230 ) ) ( not ( = ?auto_101224 ?auto_101225 ) ) ( not ( = ?auto_101224 ?auto_101226 ) ) ( not ( = ?auto_101224 ?auto_101227 ) ) ( not ( = ?auto_101224 ?auto_101228 ) ) ( not ( = ?auto_101224 ?auto_101229 ) ) ( not ( = ?auto_101224 ?auto_101230 ) ) ( not ( = ?auto_101225 ?auto_101226 ) ) ( not ( = ?auto_101225 ?auto_101227 ) ) ( not ( = ?auto_101225 ?auto_101228 ) ) ( not ( = ?auto_101225 ?auto_101229 ) ) ( not ( = ?auto_101225 ?auto_101230 ) ) ( not ( = ?auto_101226 ?auto_101227 ) ) ( not ( = ?auto_101226 ?auto_101228 ) ) ( not ( = ?auto_101226 ?auto_101229 ) ) ( not ( = ?auto_101226 ?auto_101230 ) ) ( not ( = ?auto_101227 ?auto_101228 ) ) ( not ( = ?auto_101227 ?auto_101229 ) ) ( not ( = ?auto_101227 ?auto_101230 ) ) ( not ( = ?auto_101228 ?auto_101229 ) ) ( not ( = ?auto_101228 ?auto_101230 ) ) ( not ( = ?auto_101229 ?auto_101230 ) ) ( ON ?auto_101228 ?auto_101229 ) ( ON ?auto_101227 ?auto_101228 ) ( ON ?auto_101226 ?auto_101227 ) ( ON ?auto_101225 ?auto_101226 ) ( ON ?auto_101224 ?auto_101225 ) ( CLEAR ?auto_101222 ) ( ON ?auto_101223 ?auto_101224 ) ( CLEAR ?auto_101223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101221 ?auto_101222 ?auto_101223 )
      ( MAKE-9PILE ?auto_101221 ?auto_101222 ?auto_101223 ?auto_101224 ?auto_101225 ?auto_101226 ?auto_101227 ?auto_101228 ?auto_101229 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101259 - BLOCK
      ?auto_101260 - BLOCK
      ?auto_101261 - BLOCK
      ?auto_101262 - BLOCK
      ?auto_101263 - BLOCK
      ?auto_101264 - BLOCK
      ?auto_101265 - BLOCK
      ?auto_101266 - BLOCK
      ?auto_101267 - BLOCK
    )
    :vars
    (
      ?auto_101268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101267 ?auto_101268 ) ( ON-TABLE ?auto_101259 ) ( not ( = ?auto_101259 ?auto_101260 ) ) ( not ( = ?auto_101259 ?auto_101261 ) ) ( not ( = ?auto_101259 ?auto_101262 ) ) ( not ( = ?auto_101259 ?auto_101263 ) ) ( not ( = ?auto_101259 ?auto_101264 ) ) ( not ( = ?auto_101259 ?auto_101265 ) ) ( not ( = ?auto_101259 ?auto_101266 ) ) ( not ( = ?auto_101259 ?auto_101267 ) ) ( not ( = ?auto_101259 ?auto_101268 ) ) ( not ( = ?auto_101260 ?auto_101261 ) ) ( not ( = ?auto_101260 ?auto_101262 ) ) ( not ( = ?auto_101260 ?auto_101263 ) ) ( not ( = ?auto_101260 ?auto_101264 ) ) ( not ( = ?auto_101260 ?auto_101265 ) ) ( not ( = ?auto_101260 ?auto_101266 ) ) ( not ( = ?auto_101260 ?auto_101267 ) ) ( not ( = ?auto_101260 ?auto_101268 ) ) ( not ( = ?auto_101261 ?auto_101262 ) ) ( not ( = ?auto_101261 ?auto_101263 ) ) ( not ( = ?auto_101261 ?auto_101264 ) ) ( not ( = ?auto_101261 ?auto_101265 ) ) ( not ( = ?auto_101261 ?auto_101266 ) ) ( not ( = ?auto_101261 ?auto_101267 ) ) ( not ( = ?auto_101261 ?auto_101268 ) ) ( not ( = ?auto_101262 ?auto_101263 ) ) ( not ( = ?auto_101262 ?auto_101264 ) ) ( not ( = ?auto_101262 ?auto_101265 ) ) ( not ( = ?auto_101262 ?auto_101266 ) ) ( not ( = ?auto_101262 ?auto_101267 ) ) ( not ( = ?auto_101262 ?auto_101268 ) ) ( not ( = ?auto_101263 ?auto_101264 ) ) ( not ( = ?auto_101263 ?auto_101265 ) ) ( not ( = ?auto_101263 ?auto_101266 ) ) ( not ( = ?auto_101263 ?auto_101267 ) ) ( not ( = ?auto_101263 ?auto_101268 ) ) ( not ( = ?auto_101264 ?auto_101265 ) ) ( not ( = ?auto_101264 ?auto_101266 ) ) ( not ( = ?auto_101264 ?auto_101267 ) ) ( not ( = ?auto_101264 ?auto_101268 ) ) ( not ( = ?auto_101265 ?auto_101266 ) ) ( not ( = ?auto_101265 ?auto_101267 ) ) ( not ( = ?auto_101265 ?auto_101268 ) ) ( not ( = ?auto_101266 ?auto_101267 ) ) ( not ( = ?auto_101266 ?auto_101268 ) ) ( not ( = ?auto_101267 ?auto_101268 ) ) ( ON ?auto_101266 ?auto_101267 ) ( ON ?auto_101265 ?auto_101266 ) ( ON ?auto_101264 ?auto_101265 ) ( ON ?auto_101263 ?auto_101264 ) ( ON ?auto_101262 ?auto_101263 ) ( ON ?auto_101261 ?auto_101262 ) ( CLEAR ?auto_101259 ) ( ON ?auto_101260 ?auto_101261 ) ( CLEAR ?auto_101260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101259 ?auto_101260 )
      ( MAKE-9PILE ?auto_101259 ?auto_101260 ?auto_101261 ?auto_101262 ?auto_101263 ?auto_101264 ?auto_101265 ?auto_101266 ?auto_101267 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101297 - BLOCK
      ?auto_101298 - BLOCK
      ?auto_101299 - BLOCK
      ?auto_101300 - BLOCK
      ?auto_101301 - BLOCK
      ?auto_101302 - BLOCK
      ?auto_101303 - BLOCK
      ?auto_101304 - BLOCK
      ?auto_101305 - BLOCK
    )
    :vars
    (
      ?auto_101306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101305 ?auto_101306 ) ( not ( = ?auto_101297 ?auto_101298 ) ) ( not ( = ?auto_101297 ?auto_101299 ) ) ( not ( = ?auto_101297 ?auto_101300 ) ) ( not ( = ?auto_101297 ?auto_101301 ) ) ( not ( = ?auto_101297 ?auto_101302 ) ) ( not ( = ?auto_101297 ?auto_101303 ) ) ( not ( = ?auto_101297 ?auto_101304 ) ) ( not ( = ?auto_101297 ?auto_101305 ) ) ( not ( = ?auto_101297 ?auto_101306 ) ) ( not ( = ?auto_101298 ?auto_101299 ) ) ( not ( = ?auto_101298 ?auto_101300 ) ) ( not ( = ?auto_101298 ?auto_101301 ) ) ( not ( = ?auto_101298 ?auto_101302 ) ) ( not ( = ?auto_101298 ?auto_101303 ) ) ( not ( = ?auto_101298 ?auto_101304 ) ) ( not ( = ?auto_101298 ?auto_101305 ) ) ( not ( = ?auto_101298 ?auto_101306 ) ) ( not ( = ?auto_101299 ?auto_101300 ) ) ( not ( = ?auto_101299 ?auto_101301 ) ) ( not ( = ?auto_101299 ?auto_101302 ) ) ( not ( = ?auto_101299 ?auto_101303 ) ) ( not ( = ?auto_101299 ?auto_101304 ) ) ( not ( = ?auto_101299 ?auto_101305 ) ) ( not ( = ?auto_101299 ?auto_101306 ) ) ( not ( = ?auto_101300 ?auto_101301 ) ) ( not ( = ?auto_101300 ?auto_101302 ) ) ( not ( = ?auto_101300 ?auto_101303 ) ) ( not ( = ?auto_101300 ?auto_101304 ) ) ( not ( = ?auto_101300 ?auto_101305 ) ) ( not ( = ?auto_101300 ?auto_101306 ) ) ( not ( = ?auto_101301 ?auto_101302 ) ) ( not ( = ?auto_101301 ?auto_101303 ) ) ( not ( = ?auto_101301 ?auto_101304 ) ) ( not ( = ?auto_101301 ?auto_101305 ) ) ( not ( = ?auto_101301 ?auto_101306 ) ) ( not ( = ?auto_101302 ?auto_101303 ) ) ( not ( = ?auto_101302 ?auto_101304 ) ) ( not ( = ?auto_101302 ?auto_101305 ) ) ( not ( = ?auto_101302 ?auto_101306 ) ) ( not ( = ?auto_101303 ?auto_101304 ) ) ( not ( = ?auto_101303 ?auto_101305 ) ) ( not ( = ?auto_101303 ?auto_101306 ) ) ( not ( = ?auto_101304 ?auto_101305 ) ) ( not ( = ?auto_101304 ?auto_101306 ) ) ( not ( = ?auto_101305 ?auto_101306 ) ) ( ON ?auto_101304 ?auto_101305 ) ( ON ?auto_101303 ?auto_101304 ) ( ON ?auto_101302 ?auto_101303 ) ( ON ?auto_101301 ?auto_101302 ) ( ON ?auto_101300 ?auto_101301 ) ( ON ?auto_101299 ?auto_101300 ) ( ON ?auto_101298 ?auto_101299 ) ( ON ?auto_101297 ?auto_101298 ) ( CLEAR ?auto_101297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101297 )
      ( MAKE-9PILE ?auto_101297 ?auto_101298 ?auto_101299 ?auto_101300 ?auto_101301 ?auto_101302 ?auto_101303 ?auto_101304 ?auto_101305 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101336 - BLOCK
      ?auto_101337 - BLOCK
      ?auto_101338 - BLOCK
      ?auto_101339 - BLOCK
      ?auto_101340 - BLOCK
      ?auto_101341 - BLOCK
      ?auto_101342 - BLOCK
      ?auto_101343 - BLOCK
      ?auto_101344 - BLOCK
      ?auto_101345 - BLOCK
    )
    :vars
    (
      ?auto_101346 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101344 ) ( ON ?auto_101345 ?auto_101346 ) ( CLEAR ?auto_101345 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101336 ) ( ON ?auto_101337 ?auto_101336 ) ( ON ?auto_101338 ?auto_101337 ) ( ON ?auto_101339 ?auto_101338 ) ( ON ?auto_101340 ?auto_101339 ) ( ON ?auto_101341 ?auto_101340 ) ( ON ?auto_101342 ?auto_101341 ) ( ON ?auto_101343 ?auto_101342 ) ( ON ?auto_101344 ?auto_101343 ) ( not ( = ?auto_101336 ?auto_101337 ) ) ( not ( = ?auto_101336 ?auto_101338 ) ) ( not ( = ?auto_101336 ?auto_101339 ) ) ( not ( = ?auto_101336 ?auto_101340 ) ) ( not ( = ?auto_101336 ?auto_101341 ) ) ( not ( = ?auto_101336 ?auto_101342 ) ) ( not ( = ?auto_101336 ?auto_101343 ) ) ( not ( = ?auto_101336 ?auto_101344 ) ) ( not ( = ?auto_101336 ?auto_101345 ) ) ( not ( = ?auto_101336 ?auto_101346 ) ) ( not ( = ?auto_101337 ?auto_101338 ) ) ( not ( = ?auto_101337 ?auto_101339 ) ) ( not ( = ?auto_101337 ?auto_101340 ) ) ( not ( = ?auto_101337 ?auto_101341 ) ) ( not ( = ?auto_101337 ?auto_101342 ) ) ( not ( = ?auto_101337 ?auto_101343 ) ) ( not ( = ?auto_101337 ?auto_101344 ) ) ( not ( = ?auto_101337 ?auto_101345 ) ) ( not ( = ?auto_101337 ?auto_101346 ) ) ( not ( = ?auto_101338 ?auto_101339 ) ) ( not ( = ?auto_101338 ?auto_101340 ) ) ( not ( = ?auto_101338 ?auto_101341 ) ) ( not ( = ?auto_101338 ?auto_101342 ) ) ( not ( = ?auto_101338 ?auto_101343 ) ) ( not ( = ?auto_101338 ?auto_101344 ) ) ( not ( = ?auto_101338 ?auto_101345 ) ) ( not ( = ?auto_101338 ?auto_101346 ) ) ( not ( = ?auto_101339 ?auto_101340 ) ) ( not ( = ?auto_101339 ?auto_101341 ) ) ( not ( = ?auto_101339 ?auto_101342 ) ) ( not ( = ?auto_101339 ?auto_101343 ) ) ( not ( = ?auto_101339 ?auto_101344 ) ) ( not ( = ?auto_101339 ?auto_101345 ) ) ( not ( = ?auto_101339 ?auto_101346 ) ) ( not ( = ?auto_101340 ?auto_101341 ) ) ( not ( = ?auto_101340 ?auto_101342 ) ) ( not ( = ?auto_101340 ?auto_101343 ) ) ( not ( = ?auto_101340 ?auto_101344 ) ) ( not ( = ?auto_101340 ?auto_101345 ) ) ( not ( = ?auto_101340 ?auto_101346 ) ) ( not ( = ?auto_101341 ?auto_101342 ) ) ( not ( = ?auto_101341 ?auto_101343 ) ) ( not ( = ?auto_101341 ?auto_101344 ) ) ( not ( = ?auto_101341 ?auto_101345 ) ) ( not ( = ?auto_101341 ?auto_101346 ) ) ( not ( = ?auto_101342 ?auto_101343 ) ) ( not ( = ?auto_101342 ?auto_101344 ) ) ( not ( = ?auto_101342 ?auto_101345 ) ) ( not ( = ?auto_101342 ?auto_101346 ) ) ( not ( = ?auto_101343 ?auto_101344 ) ) ( not ( = ?auto_101343 ?auto_101345 ) ) ( not ( = ?auto_101343 ?auto_101346 ) ) ( not ( = ?auto_101344 ?auto_101345 ) ) ( not ( = ?auto_101344 ?auto_101346 ) ) ( not ( = ?auto_101345 ?auto_101346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101345 ?auto_101346 )
      ( !STACK ?auto_101345 ?auto_101344 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101357 - BLOCK
      ?auto_101358 - BLOCK
      ?auto_101359 - BLOCK
      ?auto_101360 - BLOCK
      ?auto_101361 - BLOCK
      ?auto_101362 - BLOCK
      ?auto_101363 - BLOCK
      ?auto_101364 - BLOCK
      ?auto_101365 - BLOCK
      ?auto_101366 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101365 ) ( ON-TABLE ?auto_101366 ) ( CLEAR ?auto_101366 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101357 ) ( ON ?auto_101358 ?auto_101357 ) ( ON ?auto_101359 ?auto_101358 ) ( ON ?auto_101360 ?auto_101359 ) ( ON ?auto_101361 ?auto_101360 ) ( ON ?auto_101362 ?auto_101361 ) ( ON ?auto_101363 ?auto_101362 ) ( ON ?auto_101364 ?auto_101363 ) ( ON ?auto_101365 ?auto_101364 ) ( not ( = ?auto_101357 ?auto_101358 ) ) ( not ( = ?auto_101357 ?auto_101359 ) ) ( not ( = ?auto_101357 ?auto_101360 ) ) ( not ( = ?auto_101357 ?auto_101361 ) ) ( not ( = ?auto_101357 ?auto_101362 ) ) ( not ( = ?auto_101357 ?auto_101363 ) ) ( not ( = ?auto_101357 ?auto_101364 ) ) ( not ( = ?auto_101357 ?auto_101365 ) ) ( not ( = ?auto_101357 ?auto_101366 ) ) ( not ( = ?auto_101358 ?auto_101359 ) ) ( not ( = ?auto_101358 ?auto_101360 ) ) ( not ( = ?auto_101358 ?auto_101361 ) ) ( not ( = ?auto_101358 ?auto_101362 ) ) ( not ( = ?auto_101358 ?auto_101363 ) ) ( not ( = ?auto_101358 ?auto_101364 ) ) ( not ( = ?auto_101358 ?auto_101365 ) ) ( not ( = ?auto_101358 ?auto_101366 ) ) ( not ( = ?auto_101359 ?auto_101360 ) ) ( not ( = ?auto_101359 ?auto_101361 ) ) ( not ( = ?auto_101359 ?auto_101362 ) ) ( not ( = ?auto_101359 ?auto_101363 ) ) ( not ( = ?auto_101359 ?auto_101364 ) ) ( not ( = ?auto_101359 ?auto_101365 ) ) ( not ( = ?auto_101359 ?auto_101366 ) ) ( not ( = ?auto_101360 ?auto_101361 ) ) ( not ( = ?auto_101360 ?auto_101362 ) ) ( not ( = ?auto_101360 ?auto_101363 ) ) ( not ( = ?auto_101360 ?auto_101364 ) ) ( not ( = ?auto_101360 ?auto_101365 ) ) ( not ( = ?auto_101360 ?auto_101366 ) ) ( not ( = ?auto_101361 ?auto_101362 ) ) ( not ( = ?auto_101361 ?auto_101363 ) ) ( not ( = ?auto_101361 ?auto_101364 ) ) ( not ( = ?auto_101361 ?auto_101365 ) ) ( not ( = ?auto_101361 ?auto_101366 ) ) ( not ( = ?auto_101362 ?auto_101363 ) ) ( not ( = ?auto_101362 ?auto_101364 ) ) ( not ( = ?auto_101362 ?auto_101365 ) ) ( not ( = ?auto_101362 ?auto_101366 ) ) ( not ( = ?auto_101363 ?auto_101364 ) ) ( not ( = ?auto_101363 ?auto_101365 ) ) ( not ( = ?auto_101363 ?auto_101366 ) ) ( not ( = ?auto_101364 ?auto_101365 ) ) ( not ( = ?auto_101364 ?auto_101366 ) ) ( not ( = ?auto_101365 ?auto_101366 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_101366 )
      ( !STACK ?auto_101366 ?auto_101365 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101377 - BLOCK
      ?auto_101378 - BLOCK
      ?auto_101379 - BLOCK
      ?auto_101380 - BLOCK
      ?auto_101381 - BLOCK
      ?auto_101382 - BLOCK
      ?auto_101383 - BLOCK
      ?auto_101384 - BLOCK
      ?auto_101385 - BLOCK
      ?auto_101386 - BLOCK
    )
    :vars
    (
      ?auto_101387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101386 ?auto_101387 ) ( ON-TABLE ?auto_101377 ) ( ON ?auto_101378 ?auto_101377 ) ( ON ?auto_101379 ?auto_101378 ) ( ON ?auto_101380 ?auto_101379 ) ( ON ?auto_101381 ?auto_101380 ) ( ON ?auto_101382 ?auto_101381 ) ( ON ?auto_101383 ?auto_101382 ) ( ON ?auto_101384 ?auto_101383 ) ( not ( = ?auto_101377 ?auto_101378 ) ) ( not ( = ?auto_101377 ?auto_101379 ) ) ( not ( = ?auto_101377 ?auto_101380 ) ) ( not ( = ?auto_101377 ?auto_101381 ) ) ( not ( = ?auto_101377 ?auto_101382 ) ) ( not ( = ?auto_101377 ?auto_101383 ) ) ( not ( = ?auto_101377 ?auto_101384 ) ) ( not ( = ?auto_101377 ?auto_101385 ) ) ( not ( = ?auto_101377 ?auto_101386 ) ) ( not ( = ?auto_101377 ?auto_101387 ) ) ( not ( = ?auto_101378 ?auto_101379 ) ) ( not ( = ?auto_101378 ?auto_101380 ) ) ( not ( = ?auto_101378 ?auto_101381 ) ) ( not ( = ?auto_101378 ?auto_101382 ) ) ( not ( = ?auto_101378 ?auto_101383 ) ) ( not ( = ?auto_101378 ?auto_101384 ) ) ( not ( = ?auto_101378 ?auto_101385 ) ) ( not ( = ?auto_101378 ?auto_101386 ) ) ( not ( = ?auto_101378 ?auto_101387 ) ) ( not ( = ?auto_101379 ?auto_101380 ) ) ( not ( = ?auto_101379 ?auto_101381 ) ) ( not ( = ?auto_101379 ?auto_101382 ) ) ( not ( = ?auto_101379 ?auto_101383 ) ) ( not ( = ?auto_101379 ?auto_101384 ) ) ( not ( = ?auto_101379 ?auto_101385 ) ) ( not ( = ?auto_101379 ?auto_101386 ) ) ( not ( = ?auto_101379 ?auto_101387 ) ) ( not ( = ?auto_101380 ?auto_101381 ) ) ( not ( = ?auto_101380 ?auto_101382 ) ) ( not ( = ?auto_101380 ?auto_101383 ) ) ( not ( = ?auto_101380 ?auto_101384 ) ) ( not ( = ?auto_101380 ?auto_101385 ) ) ( not ( = ?auto_101380 ?auto_101386 ) ) ( not ( = ?auto_101380 ?auto_101387 ) ) ( not ( = ?auto_101381 ?auto_101382 ) ) ( not ( = ?auto_101381 ?auto_101383 ) ) ( not ( = ?auto_101381 ?auto_101384 ) ) ( not ( = ?auto_101381 ?auto_101385 ) ) ( not ( = ?auto_101381 ?auto_101386 ) ) ( not ( = ?auto_101381 ?auto_101387 ) ) ( not ( = ?auto_101382 ?auto_101383 ) ) ( not ( = ?auto_101382 ?auto_101384 ) ) ( not ( = ?auto_101382 ?auto_101385 ) ) ( not ( = ?auto_101382 ?auto_101386 ) ) ( not ( = ?auto_101382 ?auto_101387 ) ) ( not ( = ?auto_101383 ?auto_101384 ) ) ( not ( = ?auto_101383 ?auto_101385 ) ) ( not ( = ?auto_101383 ?auto_101386 ) ) ( not ( = ?auto_101383 ?auto_101387 ) ) ( not ( = ?auto_101384 ?auto_101385 ) ) ( not ( = ?auto_101384 ?auto_101386 ) ) ( not ( = ?auto_101384 ?auto_101387 ) ) ( not ( = ?auto_101385 ?auto_101386 ) ) ( not ( = ?auto_101385 ?auto_101387 ) ) ( not ( = ?auto_101386 ?auto_101387 ) ) ( CLEAR ?auto_101384 ) ( ON ?auto_101385 ?auto_101386 ) ( CLEAR ?auto_101385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_101377 ?auto_101378 ?auto_101379 ?auto_101380 ?auto_101381 ?auto_101382 ?auto_101383 ?auto_101384 ?auto_101385 )
      ( MAKE-10PILE ?auto_101377 ?auto_101378 ?auto_101379 ?auto_101380 ?auto_101381 ?auto_101382 ?auto_101383 ?auto_101384 ?auto_101385 ?auto_101386 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101398 - BLOCK
      ?auto_101399 - BLOCK
      ?auto_101400 - BLOCK
      ?auto_101401 - BLOCK
      ?auto_101402 - BLOCK
      ?auto_101403 - BLOCK
      ?auto_101404 - BLOCK
      ?auto_101405 - BLOCK
      ?auto_101406 - BLOCK
      ?auto_101407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101407 ) ( ON-TABLE ?auto_101398 ) ( ON ?auto_101399 ?auto_101398 ) ( ON ?auto_101400 ?auto_101399 ) ( ON ?auto_101401 ?auto_101400 ) ( ON ?auto_101402 ?auto_101401 ) ( ON ?auto_101403 ?auto_101402 ) ( ON ?auto_101404 ?auto_101403 ) ( ON ?auto_101405 ?auto_101404 ) ( not ( = ?auto_101398 ?auto_101399 ) ) ( not ( = ?auto_101398 ?auto_101400 ) ) ( not ( = ?auto_101398 ?auto_101401 ) ) ( not ( = ?auto_101398 ?auto_101402 ) ) ( not ( = ?auto_101398 ?auto_101403 ) ) ( not ( = ?auto_101398 ?auto_101404 ) ) ( not ( = ?auto_101398 ?auto_101405 ) ) ( not ( = ?auto_101398 ?auto_101406 ) ) ( not ( = ?auto_101398 ?auto_101407 ) ) ( not ( = ?auto_101399 ?auto_101400 ) ) ( not ( = ?auto_101399 ?auto_101401 ) ) ( not ( = ?auto_101399 ?auto_101402 ) ) ( not ( = ?auto_101399 ?auto_101403 ) ) ( not ( = ?auto_101399 ?auto_101404 ) ) ( not ( = ?auto_101399 ?auto_101405 ) ) ( not ( = ?auto_101399 ?auto_101406 ) ) ( not ( = ?auto_101399 ?auto_101407 ) ) ( not ( = ?auto_101400 ?auto_101401 ) ) ( not ( = ?auto_101400 ?auto_101402 ) ) ( not ( = ?auto_101400 ?auto_101403 ) ) ( not ( = ?auto_101400 ?auto_101404 ) ) ( not ( = ?auto_101400 ?auto_101405 ) ) ( not ( = ?auto_101400 ?auto_101406 ) ) ( not ( = ?auto_101400 ?auto_101407 ) ) ( not ( = ?auto_101401 ?auto_101402 ) ) ( not ( = ?auto_101401 ?auto_101403 ) ) ( not ( = ?auto_101401 ?auto_101404 ) ) ( not ( = ?auto_101401 ?auto_101405 ) ) ( not ( = ?auto_101401 ?auto_101406 ) ) ( not ( = ?auto_101401 ?auto_101407 ) ) ( not ( = ?auto_101402 ?auto_101403 ) ) ( not ( = ?auto_101402 ?auto_101404 ) ) ( not ( = ?auto_101402 ?auto_101405 ) ) ( not ( = ?auto_101402 ?auto_101406 ) ) ( not ( = ?auto_101402 ?auto_101407 ) ) ( not ( = ?auto_101403 ?auto_101404 ) ) ( not ( = ?auto_101403 ?auto_101405 ) ) ( not ( = ?auto_101403 ?auto_101406 ) ) ( not ( = ?auto_101403 ?auto_101407 ) ) ( not ( = ?auto_101404 ?auto_101405 ) ) ( not ( = ?auto_101404 ?auto_101406 ) ) ( not ( = ?auto_101404 ?auto_101407 ) ) ( not ( = ?auto_101405 ?auto_101406 ) ) ( not ( = ?auto_101405 ?auto_101407 ) ) ( not ( = ?auto_101406 ?auto_101407 ) ) ( CLEAR ?auto_101405 ) ( ON ?auto_101406 ?auto_101407 ) ( CLEAR ?auto_101406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_101398 ?auto_101399 ?auto_101400 ?auto_101401 ?auto_101402 ?auto_101403 ?auto_101404 ?auto_101405 ?auto_101406 )
      ( MAKE-10PILE ?auto_101398 ?auto_101399 ?auto_101400 ?auto_101401 ?auto_101402 ?auto_101403 ?auto_101404 ?auto_101405 ?auto_101406 ?auto_101407 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101418 - BLOCK
      ?auto_101419 - BLOCK
      ?auto_101420 - BLOCK
      ?auto_101421 - BLOCK
      ?auto_101422 - BLOCK
      ?auto_101423 - BLOCK
      ?auto_101424 - BLOCK
      ?auto_101425 - BLOCK
      ?auto_101426 - BLOCK
      ?auto_101427 - BLOCK
    )
    :vars
    (
      ?auto_101428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101427 ?auto_101428 ) ( ON-TABLE ?auto_101418 ) ( ON ?auto_101419 ?auto_101418 ) ( ON ?auto_101420 ?auto_101419 ) ( ON ?auto_101421 ?auto_101420 ) ( ON ?auto_101422 ?auto_101421 ) ( ON ?auto_101423 ?auto_101422 ) ( ON ?auto_101424 ?auto_101423 ) ( not ( = ?auto_101418 ?auto_101419 ) ) ( not ( = ?auto_101418 ?auto_101420 ) ) ( not ( = ?auto_101418 ?auto_101421 ) ) ( not ( = ?auto_101418 ?auto_101422 ) ) ( not ( = ?auto_101418 ?auto_101423 ) ) ( not ( = ?auto_101418 ?auto_101424 ) ) ( not ( = ?auto_101418 ?auto_101425 ) ) ( not ( = ?auto_101418 ?auto_101426 ) ) ( not ( = ?auto_101418 ?auto_101427 ) ) ( not ( = ?auto_101418 ?auto_101428 ) ) ( not ( = ?auto_101419 ?auto_101420 ) ) ( not ( = ?auto_101419 ?auto_101421 ) ) ( not ( = ?auto_101419 ?auto_101422 ) ) ( not ( = ?auto_101419 ?auto_101423 ) ) ( not ( = ?auto_101419 ?auto_101424 ) ) ( not ( = ?auto_101419 ?auto_101425 ) ) ( not ( = ?auto_101419 ?auto_101426 ) ) ( not ( = ?auto_101419 ?auto_101427 ) ) ( not ( = ?auto_101419 ?auto_101428 ) ) ( not ( = ?auto_101420 ?auto_101421 ) ) ( not ( = ?auto_101420 ?auto_101422 ) ) ( not ( = ?auto_101420 ?auto_101423 ) ) ( not ( = ?auto_101420 ?auto_101424 ) ) ( not ( = ?auto_101420 ?auto_101425 ) ) ( not ( = ?auto_101420 ?auto_101426 ) ) ( not ( = ?auto_101420 ?auto_101427 ) ) ( not ( = ?auto_101420 ?auto_101428 ) ) ( not ( = ?auto_101421 ?auto_101422 ) ) ( not ( = ?auto_101421 ?auto_101423 ) ) ( not ( = ?auto_101421 ?auto_101424 ) ) ( not ( = ?auto_101421 ?auto_101425 ) ) ( not ( = ?auto_101421 ?auto_101426 ) ) ( not ( = ?auto_101421 ?auto_101427 ) ) ( not ( = ?auto_101421 ?auto_101428 ) ) ( not ( = ?auto_101422 ?auto_101423 ) ) ( not ( = ?auto_101422 ?auto_101424 ) ) ( not ( = ?auto_101422 ?auto_101425 ) ) ( not ( = ?auto_101422 ?auto_101426 ) ) ( not ( = ?auto_101422 ?auto_101427 ) ) ( not ( = ?auto_101422 ?auto_101428 ) ) ( not ( = ?auto_101423 ?auto_101424 ) ) ( not ( = ?auto_101423 ?auto_101425 ) ) ( not ( = ?auto_101423 ?auto_101426 ) ) ( not ( = ?auto_101423 ?auto_101427 ) ) ( not ( = ?auto_101423 ?auto_101428 ) ) ( not ( = ?auto_101424 ?auto_101425 ) ) ( not ( = ?auto_101424 ?auto_101426 ) ) ( not ( = ?auto_101424 ?auto_101427 ) ) ( not ( = ?auto_101424 ?auto_101428 ) ) ( not ( = ?auto_101425 ?auto_101426 ) ) ( not ( = ?auto_101425 ?auto_101427 ) ) ( not ( = ?auto_101425 ?auto_101428 ) ) ( not ( = ?auto_101426 ?auto_101427 ) ) ( not ( = ?auto_101426 ?auto_101428 ) ) ( not ( = ?auto_101427 ?auto_101428 ) ) ( ON ?auto_101426 ?auto_101427 ) ( CLEAR ?auto_101424 ) ( ON ?auto_101425 ?auto_101426 ) ( CLEAR ?auto_101425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_101418 ?auto_101419 ?auto_101420 ?auto_101421 ?auto_101422 ?auto_101423 ?auto_101424 ?auto_101425 )
      ( MAKE-10PILE ?auto_101418 ?auto_101419 ?auto_101420 ?auto_101421 ?auto_101422 ?auto_101423 ?auto_101424 ?auto_101425 ?auto_101426 ?auto_101427 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101439 - BLOCK
      ?auto_101440 - BLOCK
      ?auto_101441 - BLOCK
      ?auto_101442 - BLOCK
      ?auto_101443 - BLOCK
      ?auto_101444 - BLOCK
      ?auto_101445 - BLOCK
      ?auto_101446 - BLOCK
      ?auto_101447 - BLOCK
      ?auto_101448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101448 ) ( ON-TABLE ?auto_101439 ) ( ON ?auto_101440 ?auto_101439 ) ( ON ?auto_101441 ?auto_101440 ) ( ON ?auto_101442 ?auto_101441 ) ( ON ?auto_101443 ?auto_101442 ) ( ON ?auto_101444 ?auto_101443 ) ( ON ?auto_101445 ?auto_101444 ) ( not ( = ?auto_101439 ?auto_101440 ) ) ( not ( = ?auto_101439 ?auto_101441 ) ) ( not ( = ?auto_101439 ?auto_101442 ) ) ( not ( = ?auto_101439 ?auto_101443 ) ) ( not ( = ?auto_101439 ?auto_101444 ) ) ( not ( = ?auto_101439 ?auto_101445 ) ) ( not ( = ?auto_101439 ?auto_101446 ) ) ( not ( = ?auto_101439 ?auto_101447 ) ) ( not ( = ?auto_101439 ?auto_101448 ) ) ( not ( = ?auto_101440 ?auto_101441 ) ) ( not ( = ?auto_101440 ?auto_101442 ) ) ( not ( = ?auto_101440 ?auto_101443 ) ) ( not ( = ?auto_101440 ?auto_101444 ) ) ( not ( = ?auto_101440 ?auto_101445 ) ) ( not ( = ?auto_101440 ?auto_101446 ) ) ( not ( = ?auto_101440 ?auto_101447 ) ) ( not ( = ?auto_101440 ?auto_101448 ) ) ( not ( = ?auto_101441 ?auto_101442 ) ) ( not ( = ?auto_101441 ?auto_101443 ) ) ( not ( = ?auto_101441 ?auto_101444 ) ) ( not ( = ?auto_101441 ?auto_101445 ) ) ( not ( = ?auto_101441 ?auto_101446 ) ) ( not ( = ?auto_101441 ?auto_101447 ) ) ( not ( = ?auto_101441 ?auto_101448 ) ) ( not ( = ?auto_101442 ?auto_101443 ) ) ( not ( = ?auto_101442 ?auto_101444 ) ) ( not ( = ?auto_101442 ?auto_101445 ) ) ( not ( = ?auto_101442 ?auto_101446 ) ) ( not ( = ?auto_101442 ?auto_101447 ) ) ( not ( = ?auto_101442 ?auto_101448 ) ) ( not ( = ?auto_101443 ?auto_101444 ) ) ( not ( = ?auto_101443 ?auto_101445 ) ) ( not ( = ?auto_101443 ?auto_101446 ) ) ( not ( = ?auto_101443 ?auto_101447 ) ) ( not ( = ?auto_101443 ?auto_101448 ) ) ( not ( = ?auto_101444 ?auto_101445 ) ) ( not ( = ?auto_101444 ?auto_101446 ) ) ( not ( = ?auto_101444 ?auto_101447 ) ) ( not ( = ?auto_101444 ?auto_101448 ) ) ( not ( = ?auto_101445 ?auto_101446 ) ) ( not ( = ?auto_101445 ?auto_101447 ) ) ( not ( = ?auto_101445 ?auto_101448 ) ) ( not ( = ?auto_101446 ?auto_101447 ) ) ( not ( = ?auto_101446 ?auto_101448 ) ) ( not ( = ?auto_101447 ?auto_101448 ) ) ( ON ?auto_101447 ?auto_101448 ) ( CLEAR ?auto_101445 ) ( ON ?auto_101446 ?auto_101447 ) ( CLEAR ?auto_101446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_101439 ?auto_101440 ?auto_101441 ?auto_101442 ?auto_101443 ?auto_101444 ?auto_101445 ?auto_101446 )
      ( MAKE-10PILE ?auto_101439 ?auto_101440 ?auto_101441 ?auto_101442 ?auto_101443 ?auto_101444 ?auto_101445 ?auto_101446 ?auto_101447 ?auto_101448 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101459 - BLOCK
      ?auto_101460 - BLOCK
      ?auto_101461 - BLOCK
      ?auto_101462 - BLOCK
      ?auto_101463 - BLOCK
      ?auto_101464 - BLOCK
      ?auto_101465 - BLOCK
      ?auto_101466 - BLOCK
      ?auto_101467 - BLOCK
      ?auto_101468 - BLOCK
    )
    :vars
    (
      ?auto_101469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101468 ?auto_101469 ) ( ON-TABLE ?auto_101459 ) ( ON ?auto_101460 ?auto_101459 ) ( ON ?auto_101461 ?auto_101460 ) ( ON ?auto_101462 ?auto_101461 ) ( ON ?auto_101463 ?auto_101462 ) ( ON ?auto_101464 ?auto_101463 ) ( not ( = ?auto_101459 ?auto_101460 ) ) ( not ( = ?auto_101459 ?auto_101461 ) ) ( not ( = ?auto_101459 ?auto_101462 ) ) ( not ( = ?auto_101459 ?auto_101463 ) ) ( not ( = ?auto_101459 ?auto_101464 ) ) ( not ( = ?auto_101459 ?auto_101465 ) ) ( not ( = ?auto_101459 ?auto_101466 ) ) ( not ( = ?auto_101459 ?auto_101467 ) ) ( not ( = ?auto_101459 ?auto_101468 ) ) ( not ( = ?auto_101459 ?auto_101469 ) ) ( not ( = ?auto_101460 ?auto_101461 ) ) ( not ( = ?auto_101460 ?auto_101462 ) ) ( not ( = ?auto_101460 ?auto_101463 ) ) ( not ( = ?auto_101460 ?auto_101464 ) ) ( not ( = ?auto_101460 ?auto_101465 ) ) ( not ( = ?auto_101460 ?auto_101466 ) ) ( not ( = ?auto_101460 ?auto_101467 ) ) ( not ( = ?auto_101460 ?auto_101468 ) ) ( not ( = ?auto_101460 ?auto_101469 ) ) ( not ( = ?auto_101461 ?auto_101462 ) ) ( not ( = ?auto_101461 ?auto_101463 ) ) ( not ( = ?auto_101461 ?auto_101464 ) ) ( not ( = ?auto_101461 ?auto_101465 ) ) ( not ( = ?auto_101461 ?auto_101466 ) ) ( not ( = ?auto_101461 ?auto_101467 ) ) ( not ( = ?auto_101461 ?auto_101468 ) ) ( not ( = ?auto_101461 ?auto_101469 ) ) ( not ( = ?auto_101462 ?auto_101463 ) ) ( not ( = ?auto_101462 ?auto_101464 ) ) ( not ( = ?auto_101462 ?auto_101465 ) ) ( not ( = ?auto_101462 ?auto_101466 ) ) ( not ( = ?auto_101462 ?auto_101467 ) ) ( not ( = ?auto_101462 ?auto_101468 ) ) ( not ( = ?auto_101462 ?auto_101469 ) ) ( not ( = ?auto_101463 ?auto_101464 ) ) ( not ( = ?auto_101463 ?auto_101465 ) ) ( not ( = ?auto_101463 ?auto_101466 ) ) ( not ( = ?auto_101463 ?auto_101467 ) ) ( not ( = ?auto_101463 ?auto_101468 ) ) ( not ( = ?auto_101463 ?auto_101469 ) ) ( not ( = ?auto_101464 ?auto_101465 ) ) ( not ( = ?auto_101464 ?auto_101466 ) ) ( not ( = ?auto_101464 ?auto_101467 ) ) ( not ( = ?auto_101464 ?auto_101468 ) ) ( not ( = ?auto_101464 ?auto_101469 ) ) ( not ( = ?auto_101465 ?auto_101466 ) ) ( not ( = ?auto_101465 ?auto_101467 ) ) ( not ( = ?auto_101465 ?auto_101468 ) ) ( not ( = ?auto_101465 ?auto_101469 ) ) ( not ( = ?auto_101466 ?auto_101467 ) ) ( not ( = ?auto_101466 ?auto_101468 ) ) ( not ( = ?auto_101466 ?auto_101469 ) ) ( not ( = ?auto_101467 ?auto_101468 ) ) ( not ( = ?auto_101467 ?auto_101469 ) ) ( not ( = ?auto_101468 ?auto_101469 ) ) ( ON ?auto_101467 ?auto_101468 ) ( ON ?auto_101466 ?auto_101467 ) ( CLEAR ?auto_101464 ) ( ON ?auto_101465 ?auto_101466 ) ( CLEAR ?auto_101465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101459 ?auto_101460 ?auto_101461 ?auto_101462 ?auto_101463 ?auto_101464 ?auto_101465 )
      ( MAKE-10PILE ?auto_101459 ?auto_101460 ?auto_101461 ?auto_101462 ?auto_101463 ?auto_101464 ?auto_101465 ?auto_101466 ?auto_101467 ?auto_101468 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101480 - BLOCK
      ?auto_101481 - BLOCK
      ?auto_101482 - BLOCK
      ?auto_101483 - BLOCK
      ?auto_101484 - BLOCK
      ?auto_101485 - BLOCK
      ?auto_101486 - BLOCK
      ?auto_101487 - BLOCK
      ?auto_101488 - BLOCK
      ?auto_101489 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101489 ) ( ON-TABLE ?auto_101480 ) ( ON ?auto_101481 ?auto_101480 ) ( ON ?auto_101482 ?auto_101481 ) ( ON ?auto_101483 ?auto_101482 ) ( ON ?auto_101484 ?auto_101483 ) ( ON ?auto_101485 ?auto_101484 ) ( not ( = ?auto_101480 ?auto_101481 ) ) ( not ( = ?auto_101480 ?auto_101482 ) ) ( not ( = ?auto_101480 ?auto_101483 ) ) ( not ( = ?auto_101480 ?auto_101484 ) ) ( not ( = ?auto_101480 ?auto_101485 ) ) ( not ( = ?auto_101480 ?auto_101486 ) ) ( not ( = ?auto_101480 ?auto_101487 ) ) ( not ( = ?auto_101480 ?auto_101488 ) ) ( not ( = ?auto_101480 ?auto_101489 ) ) ( not ( = ?auto_101481 ?auto_101482 ) ) ( not ( = ?auto_101481 ?auto_101483 ) ) ( not ( = ?auto_101481 ?auto_101484 ) ) ( not ( = ?auto_101481 ?auto_101485 ) ) ( not ( = ?auto_101481 ?auto_101486 ) ) ( not ( = ?auto_101481 ?auto_101487 ) ) ( not ( = ?auto_101481 ?auto_101488 ) ) ( not ( = ?auto_101481 ?auto_101489 ) ) ( not ( = ?auto_101482 ?auto_101483 ) ) ( not ( = ?auto_101482 ?auto_101484 ) ) ( not ( = ?auto_101482 ?auto_101485 ) ) ( not ( = ?auto_101482 ?auto_101486 ) ) ( not ( = ?auto_101482 ?auto_101487 ) ) ( not ( = ?auto_101482 ?auto_101488 ) ) ( not ( = ?auto_101482 ?auto_101489 ) ) ( not ( = ?auto_101483 ?auto_101484 ) ) ( not ( = ?auto_101483 ?auto_101485 ) ) ( not ( = ?auto_101483 ?auto_101486 ) ) ( not ( = ?auto_101483 ?auto_101487 ) ) ( not ( = ?auto_101483 ?auto_101488 ) ) ( not ( = ?auto_101483 ?auto_101489 ) ) ( not ( = ?auto_101484 ?auto_101485 ) ) ( not ( = ?auto_101484 ?auto_101486 ) ) ( not ( = ?auto_101484 ?auto_101487 ) ) ( not ( = ?auto_101484 ?auto_101488 ) ) ( not ( = ?auto_101484 ?auto_101489 ) ) ( not ( = ?auto_101485 ?auto_101486 ) ) ( not ( = ?auto_101485 ?auto_101487 ) ) ( not ( = ?auto_101485 ?auto_101488 ) ) ( not ( = ?auto_101485 ?auto_101489 ) ) ( not ( = ?auto_101486 ?auto_101487 ) ) ( not ( = ?auto_101486 ?auto_101488 ) ) ( not ( = ?auto_101486 ?auto_101489 ) ) ( not ( = ?auto_101487 ?auto_101488 ) ) ( not ( = ?auto_101487 ?auto_101489 ) ) ( not ( = ?auto_101488 ?auto_101489 ) ) ( ON ?auto_101488 ?auto_101489 ) ( ON ?auto_101487 ?auto_101488 ) ( CLEAR ?auto_101485 ) ( ON ?auto_101486 ?auto_101487 ) ( CLEAR ?auto_101486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101480 ?auto_101481 ?auto_101482 ?auto_101483 ?auto_101484 ?auto_101485 ?auto_101486 )
      ( MAKE-10PILE ?auto_101480 ?auto_101481 ?auto_101482 ?auto_101483 ?auto_101484 ?auto_101485 ?auto_101486 ?auto_101487 ?auto_101488 ?auto_101489 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101500 - BLOCK
      ?auto_101501 - BLOCK
      ?auto_101502 - BLOCK
      ?auto_101503 - BLOCK
      ?auto_101504 - BLOCK
      ?auto_101505 - BLOCK
      ?auto_101506 - BLOCK
      ?auto_101507 - BLOCK
      ?auto_101508 - BLOCK
      ?auto_101509 - BLOCK
    )
    :vars
    (
      ?auto_101510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101509 ?auto_101510 ) ( ON-TABLE ?auto_101500 ) ( ON ?auto_101501 ?auto_101500 ) ( ON ?auto_101502 ?auto_101501 ) ( ON ?auto_101503 ?auto_101502 ) ( ON ?auto_101504 ?auto_101503 ) ( not ( = ?auto_101500 ?auto_101501 ) ) ( not ( = ?auto_101500 ?auto_101502 ) ) ( not ( = ?auto_101500 ?auto_101503 ) ) ( not ( = ?auto_101500 ?auto_101504 ) ) ( not ( = ?auto_101500 ?auto_101505 ) ) ( not ( = ?auto_101500 ?auto_101506 ) ) ( not ( = ?auto_101500 ?auto_101507 ) ) ( not ( = ?auto_101500 ?auto_101508 ) ) ( not ( = ?auto_101500 ?auto_101509 ) ) ( not ( = ?auto_101500 ?auto_101510 ) ) ( not ( = ?auto_101501 ?auto_101502 ) ) ( not ( = ?auto_101501 ?auto_101503 ) ) ( not ( = ?auto_101501 ?auto_101504 ) ) ( not ( = ?auto_101501 ?auto_101505 ) ) ( not ( = ?auto_101501 ?auto_101506 ) ) ( not ( = ?auto_101501 ?auto_101507 ) ) ( not ( = ?auto_101501 ?auto_101508 ) ) ( not ( = ?auto_101501 ?auto_101509 ) ) ( not ( = ?auto_101501 ?auto_101510 ) ) ( not ( = ?auto_101502 ?auto_101503 ) ) ( not ( = ?auto_101502 ?auto_101504 ) ) ( not ( = ?auto_101502 ?auto_101505 ) ) ( not ( = ?auto_101502 ?auto_101506 ) ) ( not ( = ?auto_101502 ?auto_101507 ) ) ( not ( = ?auto_101502 ?auto_101508 ) ) ( not ( = ?auto_101502 ?auto_101509 ) ) ( not ( = ?auto_101502 ?auto_101510 ) ) ( not ( = ?auto_101503 ?auto_101504 ) ) ( not ( = ?auto_101503 ?auto_101505 ) ) ( not ( = ?auto_101503 ?auto_101506 ) ) ( not ( = ?auto_101503 ?auto_101507 ) ) ( not ( = ?auto_101503 ?auto_101508 ) ) ( not ( = ?auto_101503 ?auto_101509 ) ) ( not ( = ?auto_101503 ?auto_101510 ) ) ( not ( = ?auto_101504 ?auto_101505 ) ) ( not ( = ?auto_101504 ?auto_101506 ) ) ( not ( = ?auto_101504 ?auto_101507 ) ) ( not ( = ?auto_101504 ?auto_101508 ) ) ( not ( = ?auto_101504 ?auto_101509 ) ) ( not ( = ?auto_101504 ?auto_101510 ) ) ( not ( = ?auto_101505 ?auto_101506 ) ) ( not ( = ?auto_101505 ?auto_101507 ) ) ( not ( = ?auto_101505 ?auto_101508 ) ) ( not ( = ?auto_101505 ?auto_101509 ) ) ( not ( = ?auto_101505 ?auto_101510 ) ) ( not ( = ?auto_101506 ?auto_101507 ) ) ( not ( = ?auto_101506 ?auto_101508 ) ) ( not ( = ?auto_101506 ?auto_101509 ) ) ( not ( = ?auto_101506 ?auto_101510 ) ) ( not ( = ?auto_101507 ?auto_101508 ) ) ( not ( = ?auto_101507 ?auto_101509 ) ) ( not ( = ?auto_101507 ?auto_101510 ) ) ( not ( = ?auto_101508 ?auto_101509 ) ) ( not ( = ?auto_101508 ?auto_101510 ) ) ( not ( = ?auto_101509 ?auto_101510 ) ) ( ON ?auto_101508 ?auto_101509 ) ( ON ?auto_101507 ?auto_101508 ) ( ON ?auto_101506 ?auto_101507 ) ( CLEAR ?auto_101504 ) ( ON ?auto_101505 ?auto_101506 ) ( CLEAR ?auto_101505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101500 ?auto_101501 ?auto_101502 ?auto_101503 ?auto_101504 ?auto_101505 )
      ( MAKE-10PILE ?auto_101500 ?auto_101501 ?auto_101502 ?auto_101503 ?auto_101504 ?auto_101505 ?auto_101506 ?auto_101507 ?auto_101508 ?auto_101509 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101521 - BLOCK
      ?auto_101522 - BLOCK
      ?auto_101523 - BLOCK
      ?auto_101524 - BLOCK
      ?auto_101525 - BLOCK
      ?auto_101526 - BLOCK
      ?auto_101527 - BLOCK
      ?auto_101528 - BLOCK
      ?auto_101529 - BLOCK
      ?auto_101530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101530 ) ( ON-TABLE ?auto_101521 ) ( ON ?auto_101522 ?auto_101521 ) ( ON ?auto_101523 ?auto_101522 ) ( ON ?auto_101524 ?auto_101523 ) ( ON ?auto_101525 ?auto_101524 ) ( not ( = ?auto_101521 ?auto_101522 ) ) ( not ( = ?auto_101521 ?auto_101523 ) ) ( not ( = ?auto_101521 ?auto_101524 ) ) ( not ( = ?auto_101521 ?auto_101525 ) ) ( not ( = ?auto_101521 ?auto_101526 ) ) ( not ( = ?auto_101521 ?auto_101527 ) ) ( not ( = ?auto_101521 ?auto_101528 ) ) ( not ( = ?auto_101521 ?auto_101529 ) ) ( not ( = ?auto_101521 ?auto_101530 ) ) ( not ( = ?auto_101522 ?auto_101523 ) ) ( not ( = ?auto_101522 ?auto_101524 ) ) ( not ( = ?auto_101522 ?auto_101525 ) ) ( not ( = ?auto_101522 ?auto_101526 ) ) ( not ( = ?auto_101522 ?auto_101527 ) ) ( not ( = ?auto_101522 ?auto_101528 ) ) ( not ( = ?auto_101522 ?auto_101529 ) ) ( not ( = ?auto_101522 ?auto_101530 ) ) ( not ( = ?auto_101523 ?auto_101524 ) ) ( not ( = ?auto_101523 ?auto_101525 ) ) ( not ( = ?auto_101523 ?auto_101526 ) ) ( not ( = ?auto_101523 ?auto_101527 ) ) ( not ( = ?auto_101523 ?auto_101528 ) ) ( not ( = ?auto_101523 ?auto_101529 ) ) ( not ( = ?auto_101523 ?auto_101530 ) ) ( not ( = ?auto_101524 ?auto_101525 ) ) ( not ( = ?auto_101524 ?auto_101526 ) ) ( not ( = ?auto_101524 ?auto_101527 ) ) ( not ( = ?auto_101524 ?auto_101528 ) ) ( not ( = ?auto_101524 ?auto_101529 ) ) ( not ( = ?auto_101524 ?auto_101530 ) ) ( not ( = ?auto_101525 ?auto_101526 ) ) ( not ( = ?auto_101525 ?auto_101527 ) ) ( not ( = ?auto_101525 ?auto_101528 ) ) ( not ( = ?auto_101525 ?auto_101529 ) ) ( not ( = ?auto_101525 ?auto_101530 ) ) ( not ( = ?auto_101526 ?auto_101527 ) ) ( not ( = ?auto_101526 ?auto_101528 ) ) ( not ( = ?auto_101526 ?auto_101529 ) ) ( not ( = ?auto_101526 ?auto_101530 ) ) ( not ( = ?auto_101527 ?auto_101528 ) ) ( not ( = ?auto_101527 ?auto_101529 ) ) ( not ( = ?auto_101527 ?auto_101530 ) ) ( not ( = ?auto_101528 ?auto_101529 ) ) ( not ( = ?auto_101528 ?auto_101530 ) ) ( not ( = ?auto_101529 ?auto_101530 ) ) ( ON ?auto_101529 ?auto_101530 ) ( ON ?auto_101528 ?auto_101529 ) ( ON ?auto_101527 ?auto_101528 ) ( CLEAR ?auto_101525 ) ( ON ?auto_101526 ?auto_101527 ) ( CLEAR ?auto_101526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101521 ?auto_101522 ?auto_101523 ?auto_101524 ?auto_101525 ?auto_101526 )
      ( MAKE-10PILE ?auto_101521 ?auto_101522 ?auto_101523 ?auto_101524 ?auto_101525 ?auto_101526 ?auto_101527 ?auto_101528 ?auto_101529 ?auto_101530 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101541 - BLOCK
      ?auto_101542 - BLOCK
      ?auto_101543 - BLOCK
      ?auto_101544 - BLOCK
      ?auto_101545 - BLOCK
      ?auto_101546 - BLOCK
      ?auto_101547 - BLOCK
      ?auto_101548 - BLOCK
      ?auto_101549 - BLOCK
      ?auto_101550 - BLOCK
    )
    :vars
    (
      ?auto_101551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101550 ?auto_101551 ) ( ON-TABLE ?auto_101541 ) ( ON ?auto_101542 ?auto_101541 ) ( ON ?auto_101543 ?auto_101542 ) ( ON ?auto_101544 ?auto_101543 ) ( not ( = ?auto_101541 ?auto_101542 ) ) ( not ( = ?auto_101541 ?auto_101543 ) ) ( not ( = ?auto_101541 ?auto_101544 ) ) ( not ( = ?auto_101541 ?auto_101545 ) ) ( not ( = ?auto_101541 ?auto_101546 ) ) ( not ( = ?auto_101541 ?auto_101547 ) ) ( not ( = ?auto_101541 ?auto_101548 ) ) ( not ( = ?auto_101541 ?auto_101549 ) ) ( not ( = ?auto_101541 ?auto_101550 ) ) ( not ( = ?auto_101541 ?auto_101551 ) ) ( not ( = ?auto_101542 ?auto_101543 ) ) ( not ( = ?auto_101542 ?auto_101544 ) ) ( not ( = ?auto_101542 ?auto_101545 ) ) ( not ( = ?auto_101542 ?auto_101546 ) ) ( not ( = ?auto_101542 ?auto_101547 ) ) ( not ( = ?auto_101542 ?auto_101548 ) ) ( not ( = ?auto_101542 ?auto_101549 ) ) ( not ( = ?auto_101542 ?auto_101550 ) ) ( not ( = ?auto_101542 ?auto_101551 ) ) ( not ( = ?auto_101543 ?auto_101544 ) ) ( not ( = ?auto_101543 ?auto_101545 ) ) ( not ( = ?auto_101543 ?auto_101546 ) ) ( not ( = ?auto_101543 ?auto_101547 ) ) ( not ( = ?auto_101543 ?auto_101548 ) ) ( not ( = ?auto_101543 ?auto_101549 ) ) ( not ( = ?auto_101543 ?auto_101550 ) ) ( not ( = ?auto_101543 ?auto_101551 ) ) ( not ( = ?auto_101544 ?auto_101545 ) ) ( not ( = ?auto_101544 ?auto_101546 ) ) ( not ( = ?auto_101544 ?auto_101547 ) ) ( not ( = ?auto_101544 ?auto_101548 ) ) ( not ( = ?auto_101544 ?auto_101549 ) ) ( not ( = ?auto_101544 ?auto_101550 ) ) ( not ( = ?auto_101544 ?auto_101551 ) ) ( not ( = ?auto_101545 ?auto_101546 ) ) ( not ( = ?auto_101545 ?auto_101547 ) ) ( not ( = ?auto_101545 ?auto_101548 ) ) ( not ( = ?auto_101545 ?auto_101549 ) ) ( not ( = ?auto_101545 ?auto_101550 ) ) ( not ( = ?auto_101545 ?auto_101551 ) ) ( not ( = ?auto_101546 ?auto_101547 ) ) ( not ( = ?auto_101546 ?auto_101548 ) ) ( not ( = ?auto_101546 ?auto_101549 ) ) ( not ( = ?auto_101546 ?auto_101550 ) ) ( not ( = ?auto_101546 ?auto_101551 ) ) ( not ( = ?auto_101547 ?auto_101548 ) ) ( not ( = ?auto_101547 ?auto_101549 ) ) ( not ( = ?auto_101547 ?auto_101550 ) ) ( not ( = ?auto_101547 ?auto_101551 ) ) ( not ( = ?auto_101548 ?auto_101549 ) ) ( not ( = ?auto_101548 ?auto_101550 ) ) ( not ( = ?auto_101548 ?auto_101551 ) ) ( not ( = ?auto_101549 ?auto_101550 ) ) ( not ( = ?auto_101549 ?auto_101551 ) ) ( not ( = ?auto_101550 ?auto_101551 ) ) ( ON ?auto_101549 ?auto_101550 ) ( ON ?auto_101548 ?auto_101549 ) ( ON ?auto_101547 ?auto_101548 ) ( ON ?auto_101546 ?auto_101547 ) ( CLEAR ?auto_101544 ) ( ON ?auto_101545 ?auto_101546 ) ( CLEAR ?auto_101545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101541 ?auto_101542 ?auto_101543 ?auto_101544 ?auto_101545 )
      ( MAKE-10PILE ?auto_101541 ?auto_101542 ?auto_101543 ?auto_101544 ?auto_101545 ?auto_101546 ?auto_101547 ?auto_101548 ?auto_101549 ?auto_101550 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101562 - BLOCK
      ?auto_101563 - BLOCK
      ?auto_101564 - BLOCK
      ?auto_101565 - BLOCK
      ?auto_101566 - BLOCK
      ?auto_101567 - BLOCK
      ?auto_101568 - BLOCK
      ?auto_101569 - BLOCK
      ?auto_101570 - BLOCK
      ?auto_101571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101571 ) ( ON-TABLE ?auto_101562 ) ( ON ?auto_101563 ?auto_101562 ) ( ON ?auto_101564 ?auto_101563 ) ( ON ?auto_101565 ?auto_101564 ) ( not ( = ?auto_101562 ?auto_101563 ) ) ( not ( = ?auto_101562 ?auto_101564 ) ) ( not ( = ?auto_101562 ?auto_101565 ) ) ( not ( = ?auto_101562 ?auto_101566 ) ) ( not ( = ?auto_101562 ?auto_101567 ) ) ( not ( = ?auto_101562 ?auto_101568 ) ) ( not ( = ?auto_101562 ?auto_101569 ) ) ( not ( = ?auto_101562 ?auto_101570 ) ) ( not ( = ?auto_101562 ?auto_101571 ) ) ( not ( = ?auto_101563 ?auto_101564 ) ) ( not ( = ?auto_101563 ?auto_101565 ) ) ( not ( = ?auto_101563 ?auto_101566 ) ) ( not ( = ?auto_101563 ?auto_101567 ) ) ( not ( = ?auto_101563 ?auto_101568 ) ) ( not ( = ?auto_101563 ?auto_101569 ) ) ( not ( = ?auto_101563 ?auto_101570 ) ) ( not ( = ?auto_101563 ?auto_101571 ) ) ( not ( = ?auto_101564 ?auto_101565 ) ) ( not ( = ?auto_101564 ?auto_101566 ) ) ( not ( = ?auto_101564 ?auto_101567 ) ) ( not ( = ?auto_101564 ?auto_101568 ) ) ( not ( = ?auto_101564 ?auto_101569 ) ) ( not ( = ?auto_101564 ?auto_101570 ) ) ( not ( = ?auto_101564 ?auto_101571 ) ) ( not ( = ?auto_101565 ?auto_101566 ) ) ( not ( = ?auto_101565 ?auto_101567 ) ) ( not ( = ?auto_101565 ?auto_101568 ) ) ( not ( = ?auto_101565 ?auto_101569 ) ) ( not ( = ?auto_101565 ?auto_101570 ) ) ( not ( = ?auto_101565 ?auto_101571 ) ) ( not ( = ?auto_101566 ?auto_101567 ) ) ( not ( = ?auto_101566 ?auto_101568 ) ) ( not ( = ?auto_101566 ?auto_101569 ) ) ( not ( = ?auto_101566 ?auto_101570 ) ) ( not ( = ?auto_101566 ?auto_101571 ) ) ( not ( = ?auto_101567 ?auto_101568 ) ) ( not ( = ?auto_101567 ?auto_101569 ) ) ( not ( = ?auto_101567 ?auto_101570 ) ) ( not ( = ?auto_101567 ?auto_101571 ) ) ( not ( = ?auto_101568 ?auto_101569 ) ) ( not ( = ?auto_101568 ?auto_101570 ) ) ( not ( = ?auto_101568 ?auto_101571 ) ) ( not ( = ?auto_101569 ?auto_101570 ) ) ( not ( = ?auto_101569 ?auto_101571 ) ) ( not ( = ?auto_101570 ?auto_101571 ) ) ( ON ?auto_101570 ?auto_101571 ) ( ON ?auto_101569 ?auto_101570 ) ( ON ?auto_101568 ?auto_101569 ) ( ON ?auto_101567 ?auto_101568 ) ( CLEAR ?auto_101565 ) ( ON ?auto_101566 ?auto_101567 ) ( CLEAR ?auto_101566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101562 ?auto_101563 ?auto_101564 ?auto_101565 ?auto_101566 )
      ( MAKE-10PILE ?auto_101562 ?auto_101563 ?auto_101564 ?auto_101565 ?auto_101566 ?auto_101567 ?auto_101568 ?auto_101569 ?auto_101570 ?auto_101571 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101582 - BLOCK
      ?auto_101583 - BLOCK
      ?auto_101584 - BLOCK
      ?auto_101585 - BLOCK
      ?auto_101586 - BLOCK
      ?auto_101587 - BLOCK
      ?auto_101588 - BLOCK
      ?auto_101589 - BLOCK
      ?auto_101590 - BLOCK
      ?auto_101591 - BLOCK
    )
    :vars
    (
      ?auto_101592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101591 ?auto_101592 ) ( ON-TABLE ?auto_101582 ) ( ON ?auto_101583 ?auto_101582 ) ( ON ?auto_101584 ?auto_101583 ) ( not ( = ?auto_101582 ?auto_101583 ) ) ( not ( = ?auto_101582 ?auto_101584 ) ) ( not ( = ?auto_101582 ?auto_101585 ) ) ( not ( = ?auto_101582 ?auto_101586 ) ) ( not ( = ?auto_101582 ?auto_101587 ) ) ( not ( = ?auto_101582 ?auto_101588 ) ) ( not ( = ?auto_101582 ?auto_101589 ) ) ( not ( = ?auto_101582 ?auto_101590 ) ) ( not ( = ?auto_101582 ?auto_101591 ) ) ( not ( = ?auto_101582 ?auto_101592 ) ) ( not ( = ?auto_101583 ?auto_101584 ) ) ( not ( = ?auto_101583 ?auto_101585 ) ) ( not ( = ?auto_101583 ?auto_101586 ) ) ( not ( = ?auto_101583 ?auto_101587 ) ) ( not ( = ?auto_101583 ?auto_101588 ) ) ( not ( = ?auto_101583 ?auto_101589 ) ) ( not ( = ?auto_101583 ?auto_101590 ) ) ( not ( = ?auto_101583 ?auto_101591 ) ) ( not ( = ?auto_101583 ?auto_101592 ) ) ( not ( = ?auto_101584 ?auto_101585 ) ) ( not ( = ?auto_101584 ?auto_101586 ) ) ( not ( = ?auto_101584 ?auto_101587 ) ) ( not ( = ?auto_101584 ?auto_101588 ) ) ( not ( = ?auto_101584 ?auto_101589 ) ) ( not ( = ?auto_101584 ?auto_101590 ) ) ( not ( = ?auto_101584 ?auto_101591 ) ) ( not ( = ?auto_101584 ?auto_101592 ) ) ( not ( = ?auto_101585 ?auto_101586 ) ) ( not ( = ?auto_101585 ?auto_101587 ) ) ( not ( = ?auto_101585 ?auto_101588 ) ) ( not ( = ?auto_101585 ?auto_101589 ) ) ( not ( = ?auto_101585 ?auto_101590 ) ) ( not ( = ?auto_101585 ?auto_101591 ) ) ( not ( = ?auto_101585 ?auto_101592 ) ) ( not ( = ?auto_101586 ?auto_101587 ) ) ( not ( = ?auto_101586 ?auto_101588 ) ) ( not ( = ?auto_101586 ?auto_101589 ) ) ( not ( = ?auto_101586 ?auto_101590 ) ) ( not ( = ?auto_101586 ?auto_101591 ) ) ( not ( = ?auto_101586 ?auto_101592 ) ) ( not ( = ?auto_101587 ?auto_101588 ) ) ( not ( = ?auto_101587 ?auto_101589 ) ) ( not ( = ?auto_101587 ?auto_101590 ) ) ( not ( = ?auto_101587 ?auto_101591 ) ) ( not ( = ?auto_101587 ?auto_101592 ) ) ( not ( = ?auto_101588 ?auto_101589 ) ) ( not ( = ?auto_101588 ?auto_101590 ) ) ( not ( = ?auto_101588 ?auto_101591 ) ) ( not ( = ?auto_101588 ?auto_101592 ) ) ( not ( = ?auto_101589 ?auto_101590 ) ) ( not ( = ?auto_101589 ?auto_101591 ) ) ( not ( = ?auto_101589 ?auto_101592 ) ) ( not ( = ?auto_101590 ?auto_101591 ) ) ( not ( = ?auto_101590 ?auto_101592 ) ) ( not ( = ?auto_101591 ?auto_101592 ) ) ( ON ?auto_101590 ?auto_101591 ) ( ON ?auto_101589 ?auto_101590 ) ( ON ?auto_101588 ?auto_101589 ) ( ON ?auto_101587 ?auto_101588 ) ( ON ?auto_101586 ?auto_101587 ) ( CLEAR ?auto_101584 ) ( ON ?auto_101585 ?auto_101586 ) ( CLEAR ?auto_101585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101582 ?auto_101583 ?auto_101584 ?auto_101585 )
      ( MAKE-10PILE ?auto_101582 ?auto_101583 ?auto_101584 ?auto_101585 ?auto_101586 ?auto_101587 ?auto_101588 ?auto_101589 ?auto_101590 ?auto_101591 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101603 - BLOCK
      ?auto_101604 - BLOCK
      ?auto_101605 - BLOCK
      ?auto_101606 - BLOCK
      ?auto_101607 - BLOCK
      ?auto_101608 - BLOCK
      ?auto_101609 - BLOCK
      ?auto_101610 - BLOCK
      ?auto_101611 - BLOCK
      ?auto_101612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101612 ) ( ON-TABLE ?auto_101603 ) ( ON ?auto_101604 ?auto_101603 ) ( ON ?auto_101605 ?auto_101604 ) ( not ( = ?auto_101603 ?auto_101604 ) ) ( not ( = ?auto_101603 ?auto_101605 ) ) ( not ( = ?auto_101603 ?auto_101606 ) ) ( not ( = ?auto_101603 ?auto_101607 ) ) ( not ( = ?auto_101603 ?auto_101608 ) ) ( not ( = ?auto_101603 ?auto_101609 ) ) ( not ( = ?auto_101603 ?auto_101610 ) ) ( not ( = ?auto_101603 ?auto_101611 ) ) ( not ( = ?auto_101603 ?auto_101612 ) ) ( not ( = ?auto_101604 ?auto_101605 ) ) ( not ( = ?auto_101604 ?auto_101606 ) ) ( not ( = ?auto_101604 ?auto_101607 ) ) ( not ( = ?auto_101604 ?auto_101608 ) ) ( not ( = ?auto_101604 ?auto_101609 ) ) ( not ( = ?auto_101604 ?auto_101610 ) ) ( not ( = ?auto_101604 ?auto_101611 ) ) ( not ( = ?auto_101604 ?auto_101612 ) ) ( not ( = ?auto_101605 ?auto_101606 ) ) ( not ( = ?auto_101605 ?auto_101607 ) ) ( not ( = ?auto_101605 ?auto_101608 ) ) ( not ( = ?auto_101605 ?auto_101609 ) ) ( not ( = ?auto_101605 ?auto_101610 ) ) ( not ( = ?auto_101605 ?auto_101611 ) ) ( not ( = ?auto_101605 ?auto_101612 ) ) ( not ( = ?auto_101606 ?auto_101607 ) ) ( not ( = ?auto_101606 ?auto_101608 ) ) ( not ( = ?auto_101606 ?auto_101609 ) ) ( not ( = ?auto_101606 ?auto_101610 ) ) ( not ( = ?auto_101606 ?auto_101611 ) ) ( not ( = ?auto_101606 ?auto_101612 ) ) ( not ( = ?auto_101607 ?auto_101608 ) ) ( not ( = ?auto_101607 ?auto_101609 ) ) ( not ( = ?auto_101607 ?auto_101610 ) ) ( not ( = ?auto_101607 ?auto_101611 ) ) ( not ( = ?auto_101607 ?auto_101612 ) ) ( not ( = ?auto_101608 ?auto_101609 ) ) ( not ( = ?auto_101608 ?auto_101610 ) ) ( not ( = ?auto_101608 ?auto_101611 ) ) ( not ( = ?auto_101608 ?auto_101612 ) ) ( not ( = ?auto_101609 ?auto_101610 ) ) ( not ( = ?auto_101609 ?auto_101611 ) ) ( not ( = ?auto_101609 ?auto_101612 ) ) ( not ( = ?auto_101610 ?auto_101611 ) ) ( not ( = ?auto_101610 ?auto_101612 ) ) ( not ( = ?auto_101611 ?auto_101612 ) ) ( ON ?auto_101611 ?auto_101612 ) ( ON ?auto_101610 ?auto_101611 ) ( ON ?auto_101609 ?auto_101610 ) ( ON ?auto_101608 ?auto_101609 ) ( ON ?auto_101607 ?auto_101608 ) ( CLEAR ?auto_101605 ) ( ON ?auto_101606 ?auto_101607 ) ( CLEAR ?auto_101606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101603 ?auto_101604 ?auto_101605 ?auto_101606 )
      ( MAKE-10PILE ?auto_101603 ?auto_101604 ?auto_101605 ?auto_101606 ?auto_101607 ?auto_101608 ?auto_101609 ?auto_101610 ?auto_101611 ?auto_101612 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101623 - BLOCK
      ?auto_101624 - BLOCK
      ?auto_101625 - BLOCK
      ?auto_101626 - BLOCK
      ?auto_101627 - BLOCK
      ?auto_101628 - BLOCK
      ?auto_101629 - BLOCK
      ?auto_101630 - BLOCK
      ?auto_101631 - BLOCK
      ?auto_101632 - BLOCK
    )
    :vars
    (
      ?auto_101633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101632 ?auto_101633 ) ( ON-TABLE ?auto_101623 ) ( ON ?auto_101624 ?auto_101623 ) ( not ( = ?auto_101623 ?auto_101624 ) ) ( not ( = ?auto_101623 ?auto_101625 ) ) ( not ( = ?auto_101623 ?auto_101626 ) ) ( not ( = ?auto_101623 ?auto_101627 ) ) ( not ( = ?auto_101623 ?auto_101628 ) ) ( not ( = ?auto_101623 ?auto_101629 ) ) ( not ( = ?auto_101623 ?auto_101630 ) ) ( not ( = ?auto_101623 ?auto_101631 ) ) ( not ( = ?auto_101623 ?auto_101632 ) ) ( not ( = ?auto_101623 ?auto_101633 ) ) ( not ( = ?auto_101624 ?auto_101625 ) ) ( not ( = ?auto_101624 ?auto_101626 ) ) ( not ( = ?auto_101624 ?auto_101627 ) ) ( not ( = ?auto_101624 ?auto_101628 ) ) ( not ( = ?auto_101624 ?auto_101629 ) ) ( not ( = ?auto_101624 ?auto_101630 ) ) ( not ( = ?auto_101624 ?auto_101631 ) ) ( not ( = ?auto_101624 ?auto_101632 ) ) ( not ( = ?auto_101624 ?auto_101633 ) ) ( not ( = ?auto_101625 ?auto_101626 ) ) ( not ( = ?auto_101625 ?auto_101627 ) ) ( not ( = ?auto_101625 ?auto_101628 ) ) ( not ( = ?auto_101625 ?auto_101629 ) ) ( not ( = ?auto_101625 ?auto_101630 ) ) ( not ( = ?auto_101625 ?auto_101631 ) ) ( not ( = ?auto_101625 ?auto_101632 ) ) ( not ( = ?auto_101625 ?auto_101633 ) ) ( not ( = ?auto_101626 ?auto_101627 ) ) ( not ( = ?auto_101626 ?auto_101628 ) ) ( not ( = ?auto_101626 ?auto_101629 ) ) ( not ( = ?auto_101626 ?auto_101630 ) ) ( not ( = ?auto_101626 ?auto_101631 ) ) ( not ( = ?auto_101626 ?auto_101632 ) ) ( not ( = ?auto_101626 ?auto_101633 ) ) ( not ( = ?auto_101627 ?auto_101628 ) ) ( not ( = ?auto_101627 ?auto_101629 ) ) ( not ( = ?auto_101627 ?auto_101630 ) ) ( not ( = ?auto_101627 ?auto_101631 ) ) ( not ( = ?auto_101627 ?auto_101632 ) ) ( not ( = ?auto_101627 ?auto_101633 ) ) ( not ( = ?auto_101628 ?auto_101629 ) ) ( not ( = ?auto_101628 ?auto_101630 ) ) ( not ( = ?auto_101628 ?auto_101631 ) ) ( not ( = ?auto_101628 ?auto_101632 ) ) ( not ( = ?auto_101628 ?auto_101633 ) ) ( not ( = ?auto_101629 ?auto_101630 ) ) ( not ( = ?auto_101629 ?auto_101631 ) ) ( not ( = ?auto_101629 ?auto_101632 ) ) ( not ( = ?auto_101629 ?auto_101633 ) ) ( not ( = ?auto_101630 ?auto_101631 ) ) ( not ( = ?auto_101630 ?auto_101632 ) ) ( not ( = ?auto_101630 ?auto_101633 ) ) ( not ( = ?auto_101631 ?auto_101632 ) ) ( not ( = ?auto_101631 ?auto_101633 ) ) ( not ( = ?auto_101632 ?auto_101633 ) ) ( ON ?auto_101631 ?auto_101632 ) ( ON ?auto_101630 ?auto_101631 ) ( ON ?auto_101629 ?auto_101630 ) ( ON ?auto_101628 ?auto_101629 ) ( ON ?auto_101627 ?auto_101628 ) ( ON ?auto_101626 ?auto_101627 ) ( CLEAR ?auto_101624 ) ( ON ?auto_101625 ?auto_101626 ) ( CLEAR ?auto_101625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101623 ?auto_101624 ?auto_101625 )
      ( MAKE-10PILE ?auto_101623 ?auto_101624 ?auto_101625 ?auto_101626 ?auto_101627 ?auto_101628 ?auto_101629 ?auto_101630 ?auto_101631 ?auto_101632 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101644 - BLOCK
      ?auto_101645 - BLOCK
      ?auto_101646 - BLOCK
      ?auto_101647 - BLOCK
      ?auto_101648 - BLOCK
      ?auto_101649 - BLOCK
      ?auto_101650 - BLOCK
      ?auto_101651 - BLOCK
      ?auto_101652 - BLOCK
      ?auto_101653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101653 ) ( ON-TABLE ?auto_101644 ) ( ON ?auto_101645 ?auto_101644 ) ( not ( = ?auto_101644 ?auto_101645 ) ) ( not ( = ?auto_101644 ?auto_101646 ) ) ( not ( = ?auto_101644 ?auto_101647 ) ) ( not ( = ?auto_101644 ?auto_101648 ) ) ( not ( = ?auto_101644 ?auto_101649 ) ) ( not ( = ?auto_101644 ?auto_101650 ) ) ( not ( = ?auto_101644 ?auto_101651 ) ) ( not ( = ?auto_101644 ?auto_101652 ) ) ( not ( = ?auto_101644 ?auto_101653 ) ) ( not ( = ?auto_101645 ?auto_101646 ) ) ( not ( = ?auto_101645 ?auto_101647 ) ) ( not ( = ?auto_101645 ?auto_101648 ) ) ( not ( = ?auto_101645 ?auto_101649 ) ) ( not ( = ?auto_101645 ?auto_101650 ) ) ( not ( = ?auto_101645 ?auto_101651 ) ) ( not ( = ?auto_101645 ?auto_101652 ) ) ( not ( = ?auto_101645 ?auto_101653 ) ) ( not ( = ?auto_101646 ?auto_101647 ) ) ( not ( = ?auto_101646 ?auto_101648 ) ) ( not ( = ?auto_101646 ?auto_101649 ) ) ( not ( = ?auto_101646 ?auto_101650 ) ) ( not ( = ?auto_101646 ?auto_101651 ) ) ( not ( = ?auto_101646 ?auto_101652 ) ) ( not ( = ?auto_101646 ?auto_101653 ) ) ( not ( = ?auto_101647 ?auto_101648 ) ) ( not ( = ?auto_101647 ?auto_101649 ) ) ( not ( = ?auto_101647 ?auto_101650 ) ) ( not ( = ?auto_101647 ?auto_101651 ) ) ( not ( = ?auto_101647 ?auto_101652 ) ) ( not ( = ?auto_101647 ?auto_101653 ) ) ( not ( = ?auto_101648 ?auto_101649 ) ) ( not ( = ?auto_101648 ?auto_101650 ) ) ( not ( = ?auto_101648 ?auto_101651 ) ) ( not ( = ?auto_101648 ?auto_101652 ) ) ( not ( = ?auto_101648 ?auto_101653 ) ) ( not ( = ?auto_101649 ?auto_101650 ) ) ( not ( = ?auto_101649 ?auto_101651 ) ) ( not ( = ?auto_101649 ?auto_101652 ) ) ( not ( = ?auto_101649 ?auto_101653 ) ) ( not ( = ?auto_101650 ?auto_101651 ) ) ( not ( = ?auto_101650 ?auto_101652 ) ) ( not ( = ?auto_101650 ?auto_101653 ) ) ( not ( = ?auto_101651 ?auto_101652 ) ) ( not ( = ?auto_101651 ?auto_101653 ) ) ( not ( = ?auto_101652 ?auto_101653 ) ) ( ON ?auto_101652 ?auto_101653 ) ( ON ?auto_101651 ?auto_101652 ) ( ON ?auto_101650 ?auto_101651 ) ( ON ?auto_101649 ?auto_101650 ) ( ON ?auto_101648 ?auto_101649 ) ( ON ?auto_101647 ?auto_101648 ) ( CLEAR ?auto_101645 ) ( ON ?auto_101646 ?auto_101647 ) ( CLEAR ?auto_101646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101644 ?auto_101645 ?auto_101646 )
      ( MAKE-10PILE ?auto_101644 ?auto_101645 ?auto_101646 ?auto_101647 ?auto_101648 ?auto_101649 ?auto_101650 ?auto_101651 ?auto_101652 ?auto_101653 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101664 - BLOCK
      ?auto_101665 - BLOCK
      ?auto_101666 - BLOCK
      ?auto_101667 - BLOCK
      ?auto_101668 - BLOCK
      ?auto_101669 - BLOCK
      ?auto_101670 - BLOCK
      ?auto_101671 - BLOCK
      ?auto_101672 - BLOCK
      ?auto_101673 - BLOCK
    )
    :vars
    (
      ?auto_101674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101673 ?auto_101674 ) ( ON-TABLE ?auto_101664 ) ( not ( = ?auto_101664 ?auto_101665 ) ) ( not ( = ?auto_101664 ?auto_101666 ) ) ( not ( = ?auto_101664 ?auto_101667 ) ) ( not ( = ?auto_101664 ?auto_101668 ) ) ( not ( = ?auto_101664 ?auto_101669 ) ) ( not ( = ?auto_101664 ?auto_101670 ) ) ( not ( = ?auto_101664 ?auto_101671 ) ) ( not ( = ?auto_101664 ?auto_101672 ) ) ( not ( = ?auto_101664 ?auto_101673 ) ) ( not ( = ?auto_101664 ?auto_101674 ) ) ( not ( = ?auto_101665 ?auto_101666 ) ) ( not ( = ?auto_101665 ?auto_101667 ) ) ( not ( = ?auto_101665 ?auto_101668 ) ) ( not ( = ?auto_101665 ?auto_101669 ) ) ( not ( = ?auto_101665 ?auto_101670 ) ) ( not ( = ?auto_101665 ?auto_101671 ) ) ( not ( = ?auto_101665 ?auto_101672 ) ) ( not ( = ?auto_101665 ?auto_101673 ) ) ( not ( = ?auto_101665 ?auto_101674 ) ) ( not ( = ?auto_101666 ?auto_101667 ) ) ( not ( = ?auto_101666 ?auto_101668 ) ) ( not ( = ?auto_101666 ?auto_101669 ) ) ( not ( = ?auto_101666 ?auto_101670 ) ) ( not ( = ?auto_101666 ?auto_101671 ) ) ( not ( = ?auto_101666 ?auto_101672 ) ) ( not ( = ?auto_101666 ?auto_101673 ) ) ( not ( = ?auto_101666 ?auto_101674 ) ) ( not ( = ?auto_101667 ?auto_101668 ) ) ( not ( = ?auto_101667 ?auto_101669 ) ) ( not ( = ?auto_101667 ?auto_101670 ) ) ( not ( = ?auto_101667 ?auto_101671 ) ) ( not ( = ?auto_101667 ?auto_101672 ) ) ( not ( = ?auto_101667 ?auto_101673 ) ) ( not ( = ?auto_101667 ?auto_101674 ) ) ( not ( = ?auto_101668 ?auto_101669 ) ) ( not ( = ?auto_101668 ?auto_101670 ) ) ( not ( = ?auto_101668 ?auto_101671 ) ) ( not ( = ?auto_101668 ?auto_101672 ) ) ( not ( = ?auto_101668 ?auto_101673 ) ) ( not ( = ?auto_101668 ?auto_101674 ) ) ( not ( = ?auto_101669 ?auto_101670 ) ) ( not ( = ?auto_101669 ?auto_101671 ) ) ( not ( = ?auto_101669 ?auto_101672 ) ) ( not ( = ?auto_101669 ?auto_101673 ) ) ( not ( = ?auto_101669 ?auto_101674 ) ) ( not ( = ?auto_101670 ?auto_101671 ) ) ( not ( = ?auto_101670 ?auto_101672 ) ) ( not ( = ?auto_101670 ?auto_101673 ) ) ( not ( = ?auto_101670 ?auto_101674 ) ) ( not ( = ?auto_101671 ?auto_101672 ) ) ( not ( = ?auto_101671 ?auto_101673 ) ) ( not ( = ?auto_101671 ?auto_101674 ) ) ( not ( = ?auto_101672 ?auto_101673 ) ) ( not ( = ?auto_101672 ?auto_101674 ) ) ( not ( = ?auto_101673 ?auto_101674 ) ) ( ON ?auto_101672 ?auto_101673 ) ( ON ?auto_101671 ?auto_101672 ) ( ON ?auto_101670 ?auto_101671 ) ( ON ?auto_101669 ?auto_101670 ) ( ON ?auto_101668 ?auto_101669 ) ( ON ?auto_101667 ?auto_101668 ) ( ON ?auto_101666 ?auto_101667 ) ( CLEAR ?auto_101664 ) ( ON ?auto_101665 ?auto_101666 ) ( CLEAR ?auto_101665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101664 ?auto_101665 )
      ( MAKE-10PILE ?auto_101664 ?auto_101665 ?auto_101666 ?auto_101667 ?auto_101668 ?auto_101669 ?auto_101670 ?auto_101671 ?auto_101672 ?auto_101673 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101685 - BLOCK
      ?auto_101686 - BLOCK
      ?auto_101687 - BLOCK
      ?auto_101688 - BLOCK
      ?auto_101689 - BLOCK
      ?auto_101690 - BLOCK
      ?auto_101691 - BLOCK
      ?auto_101692 - BLOCK
      ?auto_101693 - BLOCK
      ?auto_101694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101694 ) ( ON-TABLE ?auto_101685 ) ( not ( = ?auto_101685 ?auto_101686 ) ) ( not ( = ?auto_101685 ?auto_101687 ) ) ( not ( = ?auto_101685 ?auto_101688 ) ) ( not ( = ?auto_101685 ?auto_101689 ) ) ( not ( = ?auto_101685 ?auto_101690 ) ) ( not ( = ?auto_101685 ?auto_101691 ) ) ( not ( = ?auto_101685 ?auto_101692 ) ) ( not ( = ?auto_101685 ?auto_101693 ) ) ( not ( = ?auto_101685 ?auto_101694 ) ) ( not ( = ?auto_101686 ?auto_101687 ) ) ( not ( = ?auto_101686 ?auto_101688 ) ) ( not ( = ?auto_101686 ?auto_101689 ) ) ( not ( = ?auto_101686 ?auto_101690 ) ) ( not ( = ?auto_101686 ?auto_101691 ) ) ( not ( = ?auto_101686 ?auto_101692 ) ) ( not ( = ?auto_101686 ?auto_101693 ) ) ( not ( = ?auto_101686 ?auto_101694 ) ) ( not ( = ?auto_101687 ?auto_101688 ) ) ( not ( = ?auto_101687 ?auto_101689 ) ) ( not ( = ?auto_101687 ?auto_101690 ) ) ( not ( = ?auto_101687 ?auto_101691 ) ) ( not ( = ?auto_101687 ?auto_101692 ) ) ( not ( = ?auto_101687 ?auto_101693 ) ) ( not ( = ?auto_101687 ?auto_101694 ) ) ( not ( = ?auto_101688 ?auto_101689 ) ) ( not ( = ?auto_101688 ?auto_101690 ) ) ( not ( = ?auto_101688 ?auto_101691 ) ) ( not ( = ?auto_101688 ?auto_101692 ) ) ( not ( = ?auto_101688 ?auto_101693 ) ) ( not ( = ?auto_101688 ?auto_101694 ) ) ( not ( = ?auto_101689 ?auto_101690 ) ) ( not ( = ?auto_101689 ?auto_101691 ) ) ( not ( = ?auto_101689 ?auto_101692 ) ) ( not ( = ?auto_101689 ?auto_101693 ) ) ( not ( = ?auto_101689 ?auto_101694 ) ) ( not ( = ?auto_101690 ?auto_101691 ) ) ( not ( = ?auto_101690 ?auto_101692 ) ) ( not ( = ?auto_101690 ?auto_101693 ) ) ( not ( = ?auto_101690 ?auto_101694 ) ) ( not ( = ?auto_101691 ?auto_101692 ) ) ( not ( = ?auto_101691 ?auto_101693 ) ) ( not ( = ?auto_101691 ?auto_101694 ) ) ( not ( = ?auto_101692 ?auto_101693 ) ) ( not ( = ?auto_101692 ?auto_101694 ) ) ( not ( = ?auto_101693 ?auto_101694 ) ) ( ON ?auto_101693 ?auto_101694 ) ( ON ?auto_101692 ?auto_101693 ) ( ON ?auto_101691 ?auto_101692 ) ( ON ?auto_101690 ?auto_101691 ) ( ON ?auto_101689 ?auto_101690 ) ( ON ?auto_101688 ?auto_101689 ) ( ON ?auto_101687 ?auto_101688 ) ( CLEAR ?auto_101685 ) ( ON ?auto_101686 ?auto_101687 ) ( CLEAR ?auto_101686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101685 ?auto_101686 )
      ( MAKE-10PILE ?auto_101685 ?auto_101686 ?auto_101687 ?auto_101688 ?auto_101689 ?auto_101690 ?auto_101691 ?auto_101692 ?auto_101693 ?auto_101694 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101705 - BLOCK
      ?auto_101706 - BLOCK
      ?auto_101707 - BLOCK
      ?auto_101708 - BLOCK
      ?auto_101709 - BLOCK
      ?auto_101710 - BLOCK
      ?auto_101711 - BLOCK
      ?auto_101712 - BLOCK
      ?auto_101713 - BLOCK
      ?auto_101714 - BLOCK
    )
    :vars
    (
      ?auto_101715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101714 ?auto_101715 ) ( not ( = ?auto_101705 ?auto_101706 ) ) ( not ( = ?auto_101705 ?auto_101707 ) ) ( not ( = ?auto_101705 ?auto_101708 ) ) ( not ( = ?auto_101705 ?auto_101709 ) ) ( not ( = ?auto_101705 ?auto_101710 ) ) ( not ( = ?auto_101705 ?auto_101711 ) ) ( not ( = ?auto_101705 ?auto_101712 ) ) ( not ( = ?auto_101705 ?auto_101713 ) ) ( not ( = ?auto_101705 ?auto_101714 ) ) ( not ( = ?auto_101705 ?auto_101715 ) ) ( not ( = ?auto_101706 ?auto_101707 ) ) ( not ( = ?auto_101706 ?auto_101708 ) ) ( not ( = ?auto_101706 ?auto_101709 ) ) ( not ( = ?auto_101706 ?auto_101710 ) ) ( not ( = ?auto_101706 ?auto_101711 ) ) ( not ( = ?auto_101706 ?auto_101712 ) ) ( not ( = ?auto_101706 ?auto_101713 ) ) ( not ( = ?auto_101706 ?auto_101714 ) ) ( not ( = ?auto_101706 ?auto_101715 ) ) ( not ( = ?auto_101707 ?auto_101708 ) ) ( not ( = ?auto_101707 ?auto_101709 ) ) ( not ( = ?auto_101707 ?auto_101710 ) ) ( not ( = ?auto_101707 ?auto_101711 ) ) ( not ( = ?auto_101707 ?auto_101712 ) ) ( not ( = ?auto_101707 ?auto_101713 ) ) ( not ( = ?auto_101707 ?auto_101714 ) ) ( not ( = ?auto_101707 ?auto_101715 ) ) ( not ( = ?auto_101708 ?auto_101709 ) ) ( not ( = ?auto_101708 ?auto_101710 ) ) ( not ( = ?auto_101708 ?auto_101711 ) ) ( not ( = ?auto_101708 ?auto_101712 ) ) ( not ( = ?auto_101708 ?auto_101713 ) ) ( not ( = ?auto_101708 ?auto_101714 ) ) ( not ( = ?auto_101708 ?auto_101715 ) ) ( not ( = ?auto_101709 ?auto_101710 ) ) ( not ( = ?auto_101709 ?auto_101711 ) ) ( not ( = ?auto_101709 ?auto_101712 ) ) ( not ( = ?auto_101709 ?auto_101713 ) ) ( not ( = ?auto_101709 ?auto_101714 ) ) ( not ( = ?auto_101709 ?auto_101715 ) ) ( not ( = ?auto_101710 ?auto_101711 ) ) ( not ( = ?auto_101710 ?auto_101712 ) ) ( not ( = ?auto_101710 ?auto_101713 ) ) ( not ( = ?auto_101710 ?auto_101714 ) ) ( not ( = ?auto_101710 ?auto_101715 ) ) ( not ( = ?auto_101711 ?auto_101712 ) ) ( not ( = ?auto_101711 ?auto_101713 ) ) ( not ( = ?auto_101711 ?auto_101714 ) ) ( not ( = ?auto_101711 ?auto_101715 ) ) ( not ( = ?auto_101712 ?auto_101713 ) ) ( not ( = ?auto_101712 ?auto_101714 ) ) ( not ( = ?auto_101712 ?auto_101715 ) ) ( not ( = ?auto_101713 ?auto_101714 ) ) ( not ( = ?auto_101713 ?auto_101715 ) ) ( not ( = ?auto_101714 ?auto_101715 ) ) ( ON ?auto_101713 ?auto_101714 ) ( ON ?auto_101712 ?auto_101713 ) ( ON ?auto_101711 ?auto_101712 ) ( ON ?auto_101710 ?auto_101711 ) ( ON ?auto_101709 ?auto_101710 ) ( ON ?auto_101708 ?auto_101709 ) ( ON ?auto_101707 ?auto_101708 ) ( ON ?auto_101706 ?auto_101707 ) ( ON ?auto_101705 ?auto_101706 ) ( CLEAR ?auto_101705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101705 )
      ( MAKE-10PILE ?auto_101705 ?auto_101706 ?auto_101707 ?auto_101708 ?auto_101709 ?auto_101710 ?auto_101711 ?auto_101712 ?auto_101713 ?auto_101714 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101726 - BLOCK
      ?auto_101727 - BLOCK
      ?auto_101728 - BLOCK
      ?auto_101729 - BLOCK
      ?auto_101730 - BLOCK
      ?auto_101731 - BLOCK
      ?auto_101732 - BLOCK
      ?auto_101733 - BLOCK
      ?auto_101734 - BLOCK
      ?auto_101735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101735 ) ( not ( = ?auto_101726 ?auto_101727 ) ) ( not ( = ?auto_101726 ?auto_101728 ) ) ( not ( = ?auto_101726 ?auto_101729 ) ) ( not ( = ?auto_101726 ?auto_101730 ) ) ( not ( = ?auto_101726 ?auto_101731 ) ) ( not ( = ?auto_101726 ?auto_101732 ) ) ( not ( = ?auto_101726 ?auto_101733 ) ) ( not ( = ?auto_101726 ?auto_101734 ) ) ( not ( = ?auto_101726 ?auto_101735 ) ) ( not ( = ?auto_101727 ?auto_101728 ) ) ( not ( = ?auto_101727 ?auto_101729 ) ) ( not ( = ?auto_101727 ?auto_101730 ) ) ( not ( = ?auto_101727 ?auto_101731 ) ) ( not ( = ?auto_101727 ?auto_101732 ) ) ( not ( = ?auto_101727 ?auto_101733 ) ) ( not ( = ?auto_101727 ?auto_101734 ) ) ( not ( = ?auto_101727 ?auto_101735 ) ) ( not ( = ?auto_101728 ?auto_101729 ) ) ( not ( = ?auto_101728 ?auto_101730 ) ) ( not ( = ?auto_101728 ?auto_101731 ) ) ( not ( = ?auto_101728 ?auto_101732 ) ) ( not ( = ?auto_101728 ?auto_101733 ) ) ( not ( = ?auto_101728 ?auto_101734 ) ) ( not ( = ?auto_101728 ?auto_101735 ) ) ( not ( = ?auto_101729 ?auto_101730 ) ) ( not ( = ?auto_101729 ?auto_101731 ) ) ( not ( = ?auto_101729 ?auto_101732 ) ) ( not ( = ?auto_101729 ?auto_101733 ) ) ( not ( = ?auto_101729 ?auto_101734 ) ) ( not ( = ?auto_101729 ?auto_101735 ) ) ( not ( = ?auto_101730 ?auto_101731 ) ) ( not ( = ?auto_101730 ?auto_101732 ) ) ( not ( = ?auto_101730 ?auto_101733 ) ) ( not ( = ?auto_101730 ?auto_101734 ) ) ( not ( = ?auto_101730 ?auto_101735 ) ) ( not ( = ?auto_101731 ?auto_101732 ) ) ( not ( = ?auto_101731 ?auto_101733 ) ) ( not ( = ?auto_101731 ?auto_101734 ) ) ( not ( = ?auto_101731 ?auto_101735 ) ) ( not ( = ?auto_101732 ?auto_101733 ) ) ( not ( = ?auto_101732 ?auto_101734 ) ) ( not ( = ?auto_101732 ?auto_101735 ) ) ( not ( = ?auto_101733 ?auto_101734 ) ) ( not ( = ?auto_101733 ?auto_101735 ) ) ( not ( = ?auto_101734 ?auto_101735 ) ) ( ON ?auto_101734 ?auto_101735 ) ( ON ?auto_101733 ?auto_101734 ) ( ON ?auto_101732 ?auto_101733 ) ( ON ?auto_101731 ?auto_101732 ) ( ON ?auto_101730 ?auto_101731 ) ( ON ?auto_101729 ?auto_101730 ) ( ON ?auto_101728 ?auto_101729 ) ( ON ?auto_101727 ?auto_101728 ) ( ON ?auto_101726 ?auto_101727 ) ( CLEAR ?auto_101726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101726 )
      ( MAKE-10PILE ?auto_101726 ?auto_101727 ?auto_101728 ?auto_101729 ?auto_101730 ?auto_101731 ?auto_101732 ?auto_101733 ?auto_101734 ?auto_101735 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101746 - BLOCK
      ?auto_101747 - BLOCK
      ?auto_101748 - BLOCK
      ?auto_101749 - BLOCK
      ?auto_101750 - BLOCK
      ?auto_101751 - BLOCK
      ?auto_101752 - BLOCK
      ?auto_101753 - BLOCK
      ?auto_101754 - BLOCK
      ?auto_101755 - BLOCK
    )
    :vars
    (
      ?auto_101756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101746 ?auto_101747 ) ) ( not ( = ?auto_101746 ?auto_101748 ) ) ( not ( = ?auto_101746 ?auto_101749 ) ) ( not ( = ?auto_101746 ?auto_101750 ) ) ( not ( = ?auto_101746 ?auto_101751 ) ) ( not ( = ?auto_101746 ?auto_101752 ) ) ( not ( = ?auto_101746 ?auto_101753 ) ) ( not ( = ?auto_101746 ?auto_101754 ) ) ( not ( = ?auto_101746 ?auto_101755 ) ) ( not ( = ?auto_101747 ?auto_101748 ) ) ( not ( = ?auto_101747 ?auto_101749 ) ) ( not ( = ?auto_101747 ?auto_101750 ) ) ( not ( = ?auto_101747 ?auto_101751 ) ) ( not ( = ?auto_101747 ?auto_101752 ) ) ( not ( = ?auto_101747 ?auto_101753 ) ) ( not ( = ?auto_101747 ?auto_101754 ) ) ( not ( = ?auto_101747 ?auto_101755 ) ) ( not ( = ?auto_101748 ?auto_101749 ) ) ( not ( = ?auto_101748 ?auto_101750 ) ) ( not ( = ?auto_101748 ?auto_101751 ) ) ( not ( = ?auto_101748 ?auto_101752 ) ) ( not ( = ?auto_101748 ?auto_101753 ) ) ( not ( = ?auto_101748 ?auto_101754 ) ) ( not ( = ?auto_101748 ?auto_101755 ) ) ( not ( = ?auto_101749 ?auto_101750 ) ) ( not ( = ?auto_101749 ?auto_101751 ) ) ( not ( = ?auto_101749 ?auto_101752 ) ) ( not ( = ?auto_101749 ?auto_101753 ) ) ( not ( = ?auto_101749 ?auto_101754 ) ) ( not ( = ?auto_101749 ?auto_101755 ) ) ( not ( = ?auto_101750 ?auto_101751 ) ) ( not ( = ?auto_101750 ?auto_101752 ) ) ( not ( = ?auto_101750 ?auto_101753 ) ) ( not ( = ?auto_101750 ?auto_101754 ) ) ( not ( = ?auto_101750 ?auto_101755 ) ) ( not ( = ?auto_101751 ?auto_101752 ) ) ( not ( = ?auto_101751 ?auto_101753 ) ) ( not ( = ?auto_101751 ?auto_101754 ) ) ( not ( = ?auto_101751 ?auto_101755 ) ) ( not ( = ?auto_101752 ?auto_101753 ) ) ( not ( = ?auto_101752 ?auto_101754 ) ) ( not ( = ?auto_101752 ?auto_101755 ) ) ( not ( = ?auto_101753 ?auto_101754 ) ) ( not ( = ?auto_101753 ?auto_101755 ) ) ( not ( = ?auto_101754 ?auto_101755 ) ) ( ON ?auto_101746 ?auto_101756 ) ( not ( = ?auto_101755 ?auto_101756 ) ) ( not ( = ?auto_101754 ?auto_101756 ) ) ( not ( = ?auto_101753 ?auto_101756 ) ) ( not ( = ?auto_101752 ?auto_101756 ) ) ( not ( = ?auto_101751 ?auto_101756 ) ) ( not ( = ?auto_101750 ?auto_101756 ) ) ( not ( = ?auto_101749 ?auto_101756 ) ) ( not ( = ?auto_101748 ?auto_101756 ) ) ( not ( = ?auto_101747 ?auto_101756 ) ) ( not ( = ?auto_101746 ?auto_101756 ) ) ( ON ?auto_101747 ?auto_101746 ) ( ON ?auto_101748 ?auto_101747 ) ( ON ?auto_101749 ?auto_101748 ) ( ON ?auto_101750 ?auto_101749 ) ( ON ?auto_101751 ?auto_101750 ) ( ON ?auto_101752 ?auto_101751 ) ( ON ?auto_101753 ?auto_101752 ) ( ON ?auto_101754 ?auto_101753 ) ( ON ?auto_101755 ?auto_101754 ) ( CLEAR ?auto_101755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_101755 ?auto_101754 ?auto_101753 ?auto_101752 ?auto_101751 ?auto_101750 ?auto_101749 ?auto_101748 ?auto_101747 ?auto_101746 )
      ( MAKE-10PILE ?auto_101746 ?auto_101747 ?auto_101748 ?auto_101749 ?auto_101750 ?auto_101751 ?auto_101752 ?auto_101753 ?auto_101754 ?auto_101755 ) )
  )

)

