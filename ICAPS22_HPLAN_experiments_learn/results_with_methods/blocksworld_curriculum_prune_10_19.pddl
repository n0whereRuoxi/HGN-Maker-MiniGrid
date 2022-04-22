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
      ?auto_105080 - BLOCK
    )
    :vars
    (
      ?auto_105081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105080 ?auto_105081 ) ( CLEAR ?auto_105080 ) ( HAND-EMPTY ) ( not ( = ?auto_105080 ?auto_105081 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105080 ?auto_105081 )
      ( !PUTDOWN ?auto_105080 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105087 - BLOCK
      ?auto_105088 - BLOCK
    )
    :vars
    (
      ?auto_105089 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_105087 ) ( ON ?auto_105088 ?auto_105089 ) ( CLEAR ?auto_105088 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105087 ) ( not ( = ?auto_105087 ?auto_105088 ) ) ( not ( = ?auto_105087 ?auto_105089 ) ) ( not ( = ?auto_105088 ?auto_105089 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105088 ?auto_105089 )
      ( !STACK ?auto_105088 ?auto_105087 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105097 - BLOCK
      ?auto_105098 - BLOCK
    )
    :vars
    (
      ?auto_105099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105098 ?auto_105099 ) ( not ( = ?auto_105097 ?auto_105098 ) ) ( not ( = ?auto_105097 ?auto_105099 ) ) ( not ( = ?auto_105098 ?auto_105099 ) ) ( ON ?auto_105097 ?auto_105098 ) ( CLEAR ?auto_105097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105097 )
      ( MAKE-2PILE ?auto_105097 ?auto_105098 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105108 - BLOCK
      ?auto_105109 - BLOCK
      ?auto_105110 - BLOCK
    )
    :vars
    (
      ?auto_105111 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_105109 ) ( ON ?auto_105110 ?auto_105111 ) ( CLEAR ?auto_105110 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105108 ) ( ON ?auto_105109 ?auto_105108 ) ( not ( = ?auto_105108 ?auto_105109 ) ) ( not ( = ?auto_105108 ?auto_105110 ) ) ( not ( = ?auto_105108 ?auto_105111 ) ) ( not ( = ?auto_105109 ?auto_105110 ) ) ( not ( = ?auto_105109 ?auto_105111 ) ) ( not ( = ?auto_105110 ?auto_105111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105110 ?auto_105111 )
      ( !STACK ?auto_105110 ?auto_105109 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105122 - BLOCK
      ?auto_105123 - BLOCK
      ?auto_105124 - BLOCK
    )
    :vars
    (
      ?auto_105125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105124 ?auto_105125 ) ( ON-TABLE ?auto_105122 ) ( not ( = ?auto_105122 ?auto_105123 ) ) ( not ( = ?auto_105122 ?auto_105124 ) ) ( not ( = ?auto_105122 ?auto_105125 ) ) ( not ( = ?auto_105123 ?auto_105124 ) ) ( not ( = ?auto_105123 ?auto_105125 ) ) ( not ( = ?auto_105124 ?auto_105125 ) ) ( CLEAR ?auto_105122 ) ( ON ?auto_105123 ?auto_105124 ) ( CLEAR ?auto_105123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105122 ?auto_105123 )
      ( MAKE-3PILE ?auto_105122 ?auto_105123 ?auto_105124 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105136 - BLOCK
      ?auto_105137 - BLOCK
      ?auto_105138 - BLOCK
    )
    :vars
    (
      ?auto_105139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105138 ?auto_105139 ) ( not ( = ?auto_105136 ?auto_105137 ) ) ( not ( = ?auto_105136 ?auto_105138 ) ) ( not ( = ?auto_105136 ?auto_105139 ) ) ( not ( = ?auto_105137 ?auto_105138 ) ) ( not ( = ?auto_105137 ?auto_105139 ) ) ( not ( = ?auto_105138 ?auto_105139 ) ) ( ON ?auto_105137 ?auto_105138 ) ( ON ?auto_105136 ?auto_105137 ) ( CLEAR ?auto_105136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105136 )
      ( MAKE-3PILE ?auto_105136 ?auto_105137 ?auto_105138 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105151 - BLOCK
      ?auto_105152 - BLOCK
      ?auto_105153 - BLOCK
      ?auto_105154 - BLOCK
    )
    :vars
    (
      ?auto_105155 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_105153 ) ( ON ?auto_105154 ?auto_105155 ) ( CLEAR ?auto_105154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105151 ) ( ON ?auto_105152 ?auto_105151 ) ( ON ?auto_105153 ?auto_105152 ) ( not ( = ?auto_105151 ?auto_105152 ) ) ( not ( = ?auto_105151 ?auto_105153 ) ) ( not ( = ?auto_105151 ?auto_105154 ) ) ( not ( = ?auto_105151 ?auto_105155 ) ) ( not ( = ?auto_105152 ?auto_105153 ) ) ( not ( = ?auto_105152 ?auto_105154 ) ) ( not ( = ?auto_105152 ?auto_105155 ) ) ( not ( = ?auto_105153 ?auto_105154 ) ) ( not ( = ?auto_105153 ?auto_105155 ) ) ( not ( = ?auto_105154 ?auto_105155 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105154 ?auto_105155 )
      ( !STACK ?auto_105154 ?auto_105153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105169 - BLOCK
      ?auto_105170 - BLOCK
      ?auto_105171 - BLOCK
      ?auto_105172 - BLOCK
    )
    :vars
    (
      ?auto_105173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105172 ?auto_105173 ) ( ON-TABLE ?auto_105169 ) ( ON ?auto_105170 ?auto_105169 ) ( not ( = ?auto_105169 ?auto_105170 ) ) ( not ( = ?auto_105169 ?auto_105171 ) ) ( not ( = ?auto_105169 ?auto_105172 ) ) ( not ( = ?auto_105169 ?auto_105173 ) ) ( not ( = ?auto_105170 ?auto_105171 ) ) ( not ( = ?auto_105170 ?auto_105172 ) ) ( not ( = ?auto_105170 ?auto_105173 ) ) ( not ( = ?auto_105171 ?auto_105172 ) ) ( not ( = ?auto_105171 ?auto_105173 ) ) ( not ( = ?auto_105172 ?auto_105173 ) ) ( CLEAR ?auto_105170 ) ( ON ?auto_105171 ?auto_105172 ) ( CLEAR ?auto_105171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105169 ?auto_105170 ?auto_105171 )
      ( MAKE-4PILE ?auto_105169 ?auto_105170 ?auto_105171 ?auto_105172 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105187 - BLOCK
      ?auto_105188 - BLOCK
      ?auto_105189 - BLOCK
      ?auto_105190 - BLOCK
    )
    :vars
    (
      ?auto_105191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105190 ?auto_105191 ) ( ON-TABLE ?auto_105187 ) ( not ( = ?auto_105187 ?auto_105188 ) ) ( not ( = ?auto_105187 ?auto_105189 ) ) ( not ( = ?auto_105187 ?auto_105190 ) ) ( not ( = ?auto_105187 ?auto_105191 ) ) ( not ( = ?auto_105188 ?auto_105189 ) ) ( not ( = ?auto_105188 ?auto_105190 ) ) ( not ( = ?auto_105188 ?auto_105191 ) ) ( not ( = ?auto_105189 ?auto_105190 ) ) ( not ( = ?auto_105189 ?auto_105191 ) ) ( not ( = ?auto_105190 ?auto_105191 ) ) ( ON ?auto_105189 ?auto_105190 ) ( CLEAR ?auto_105187 ) ( ON ?auto_105188 ?auto_105189 ) ( CLEAR ?auto_105188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105187 ?auto_105188 )
      ( MAKE-4PILE ?auto_105187 ?auto_105188 ?auto_105189 ?auto_105190 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105205 - BLOCK
      ?auto_105206 - BLOCK
      ?auto_105207 - BLOCK
      ?auto_105208 - BLOCK
    )
    :vars
    (
      ?auto_105209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105208 ?auto_105209 ) ( not ( = ?auto_105205 ?auto_105206 ) ) ( not ( = ?auto_105205 ?auto_105207 ) ) ( not ( = ?auto_105205 ?auto_105208 ) ) ( not ( = ?auto_105205 ?auto_105209 ) ) ( not ( = ?auto_105206 ?auto_105207 ) ) ( not ( = ?auto_105206 ?auto_105208 ) ) ( not ( = ?auto_105206 ?auto_105209 ) ) ( not ( = ?auto_105207 ?auto_105208 ) ) ( not ( = ?auto_105207 ?auto_105209 ) ) ( not ( = ?auto_105208 ?auto_105209 ) ) ( ON ?auto_105207 ?auto_105208 ) ( ON ?auto_105206 ?auto_105207 ) ( ON ?auto_105205 ?auto_105206 ) ( CLEAR ?auto_105205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105205 )
      ( MAKE-4PILE ?auto_105205 ?auto_105206 ?auto_105207 ?auto_105208 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105224 - BLOCK
      ?auto_105225 - BLOCK
      ?auto_105226 - BLOCK
      ?auto_105227 - BLOCK
      ?auto_105228 - BLOCK
    )
    :vars
    (
      ?auto_105229 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_105227 ) ( ON ?auto_105228 ?auto_105229 ) ( CLEAR ?auto_105228 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105224 ) ( ON ?auto_105225 ?auto_105224 ) ( ON ?auto_105226 ?auto_105225 ) ( ON ?auto_105227 ?auto_105226 ) ( not ( = ?auto_105224 ?auto_105225 ) ) ( not ( = ?auto_105224 ?auto_105226 ) ) ( not ( = ?auto_105224 ?auto_105227 ) ) ( not ( = ?auto_105224 ?auto_105228 ) ) ( not ( = ?auto_105224 ?auto_105229 ) ) ( not ( = ?auto_105225 ?auto_105226 ) ) ( not ( = ?auto_105225 ?auto_105227 ) ) ( not ( = ?auto_105225 ?auto_105228 ) ) ( not ( = ?auto_105225 ?auto_105229 ) ) ( not ( = ?auto_105226 ?auto_105227 ) ) ( not ( = ?auto_105226 ?auto_105228 ) ) ( not ( = ?auto_105226 ?auto_105229 ) ) ( not ( = ?auto_105227 ?auto_105228 ) ) ( not ( = ?auto_105227 ?auto_105229 ) ) ( not ( = ?auto_105228 ?auto_105229 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105228 ?auto_105229 )
      ( !STACK ?auto_105228 ?auto_105227 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105246 - BLOCK
      ?auto_105247 - BLOCK
      ?auto_105248 - BLOCK
      ?auto_105249 - BLOCK
      ?auto_105250 - BLOCK
    )
    :vars
    (
      ?auto_105251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105250 ?auto_105251 ) ( ON-TABLE ?auto_105246 ) ( ON ?auto_105247 ?auto_105246 ) ( ON ?auto_105248 ?auto_105247 ) ( not ( = ?auto_105246 ?auto_105247 ) ) ( not ( = ?auto_105246 ?auto_105248 ) ) ( not ( = ?auto_105246 ?auto_105249 ) ) ( not ( = ?auto_105246 ?auto_105250 ) ) ( not ( = ?auto_105246 ?auto_105251 ) ) ( not ( = ?auto_105247 ?auto_105248 ) ) ( not ( = ?auto_105247 ?auto_105249 ) ) ( not ( = ?auto_105247 ?auto_105250 ) ) ( not ( = ?auto_105247 ?auto_105251 ) ) ( not ( = ?auto_105248 ?auto_105249 ) ) ( not ( = ?auto_105248 ?auto_105250 ) ) ( not ( = ?auto_105248 ?auto_105251 ) ) ( not ( = ?auto_105249 ?auto_105250 ) ) ( not ( = ?auto_105249 ?auto_105251 ) ) ( not ( = ?auto_105250 ?auto_105251 ) ) ( CLEAR ?auto_105248 ) ( ON ?auto_105249 ?auto_105250 ) ( CLEAR ?auto_105249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105246 ?auto_105247 ?auto_105248 ?auto_105249 )
      ( MAKE-5PILE ?auto_105246 ?auto_105247 ?auto_105248 ?auto_105249 ?auto_105250 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105268 - BLOCK
      ?auto_105269 - BLOCK
      ?auto_105270 - BLOCK
      ?auto_105271 - BLOCK
      ?auto_105272 - BLOCK
    )
    :vars
    (
      ?auto_105273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105272 ?auto_105273 ) ( ON-TABLE ?auto_105268 ) ( ON ?auto_105269 ?auto_105268 ) ( not ( = ?auto_105268 ?auto_105269 ) ) ( not ( = ?auto_105268 ?auto_105270 ) ) ( not ( = ?auto_105268 ?auto_105271 ) ) ( not ( = ?auto_105268 ?auto_105272 ) ) ( not ( = ?auto_105268 ?auto_105273 ) ) ( not ( = ?auto_105269 ?auto_105270 ) ) ( not ( = ?auto_105269 ?auto_105271 ) ) ( not ( = ?auto_105269 ?auto_105272 ) ) ( not ( = ?auto_105269 ?auto_105273 ) ) ( not ( = ?auto_105270 ?auto_105271 ) ) ( not ( = ?auto_105270 ?auto_105272 ) ) ( not ( = ?auto_105270 ?auto_105273 ) ) ( not ( = ?auto_105271 ?auto_105272 ) ) ( not ( = ?auto_105271 ?auto_105273 ) ) ( not ( = ?auto_105272 ?auto_105273 ) ) ( ON ?auto_105271 ?auto_105272 ) ( CLEAR ?auto_105269 ) ( ON ?auto_105270 ?auto_105271 ) ( CLEAR ?auto_105270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105268 ?auto_105269 ?auto_105270 )
      ( MAKE-5PILE ?auto_105268 ?auto_105269 ?auto_105270 ?auto_105271 ?auto_105272 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105290 - BLOCK
      ?auto_105291 - BLOCK
      ?auto_105292 - BLOCK
      ?auto_105293 - BLOCK
      ?auto_105294 - BLOCK
    )
    :vars
    (
      ?auto_105295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105294 ?auto_105295 ) ( ON-TABLE ?auto_105290 ) ( not ( = ?auto_105290 ?auto_105291 ) ) ( not ( = ?auto_105290 ?auto_105292 ) ) ( not ( = ?auto_105290 ?auto_105293 ) ) ( not ( = ?auto_105290 ?auto_105294 ) ) ( not ( = ?auto_105290 ?auto_105295 ) ) ( not ( = ?auto_105291 ?auto_105292 ) ) ( not ( = ?auto_105291 ?auto_105293 ) ) ( not ( = ?auto_105291 ?auto_105294 ) ) ( not ( = ?auto_105291 ?auto_105295 ) ) ( not ( = ?auto_105292 ?auto_105293 ) ) ( not ( = ?auto_105292 ?auto_105294 ) ) ( not ( = ?auto_105292 ?auto_105295 ) ) ( not ( = ?auto_105293 ?auto_105294 ) ) ( not ( = ?auto_105293 ?auto_105295 ) ) ( not ( = ?auto_105294 ?auto_105295 ) ) ( ON ?auto_105293 ?auto_105294 ) ( ON ?auto_105292 ?auto_105293 ) ( CLEAR ?auto_105290 ) ( ON ?auto_105291 ?auto_105292 ) ( CLEAR ?auto_105291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105290 ?auto_105291 )
      ( MAKE-5PILE ?auto_105290 ?auto_105291 ?auto_105292 ?auto_105293 ?auto_105294 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105312 - BLOCK
      ?auto_105313 - BLOCK
      ?auto_105314 - BLOCK
      ?auto_105315 - BLOCK
      ?auto_105316 - BLOCK
    )
    :vars
    (
      ?auto_105317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105316 ?auto_105317 ) ( not ( = ?auto_105312 ?auto_105313 ) ) ( not ( = ?auto_105312 ?auto_105314 ) ) ( not ( = ?auto_105312 ?auto_105315 ) ) ( not ( = ?auto_105312 ?auto_105316 ) ) ( not ( = ?auto_105312 ?auto_105317 ) ) ( not ( = ?auto_105313 ?auto_105314 ) ) ( not ( = ?auto_105313 ?auto_105315 ) ) ( not ( = ?auto_105313 ?auto_105316 ) ) ( not ( = ?auto_105313 ?auto_105317 ) ) ( not ( = ?auto_105314 ?auto_105315 ) ) ( not ( = ?auto_105314 ?auto_105316 ) ) ( not ( = ?auto_105314 ?auto_105317 ) ) ( not ( = ?auto_105315 ?auto_105316 ) ) ( not ( = ?auto_105315 ?auto_105317 ) ) ( not ( = ?auto_105316 ?auto_105317 ) ) ( ON ?auto_105315 ?auto_105316 ) ( ON ?auto_105314 ?auto_105315 ) ( ON ?auto_105313 ?auto_105314 ) ( ON ?auto_105312 ?auto_105313 ) ( CLEAR ?auto_105312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105312 )
      ( MAKE-5PILE ?auto_105312 ?auto_105313 ?auto_105314 ?auto_105315 ?auto_105316 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105335 - BLOCK
      ?auto_105336 - BLOCK
      ?auto_105337 - BLOCK
      ?auto_105338 - BLOCK
      ?auto_105339 - BLOCK
      ?auto_105340 - BLOCK
    )
    :vars
    (
      ?auto_105341 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_105339 ) ( ON ?auto_105340 ?auto_105341 ) ( CLEAR ?auto_105340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105335 ) ( ON ?auto_105336 ?auto_105335 ) ( ON ?auto_105337 ?auto_105336 ) ( ON ?auto_105338 ?auto_105337 ) ( ON ?auto_105339 ?auto_105338 ) ( not ( = ?auto_105335 ?auto_105336 ) ) ( not ( = ?auto_105335 ?auto_105337 ) ) ( not ( = ?auto_105335 ?auto_105338 ) ) ( not ( = ?auto_105335 ?auto_105339 ) ) ( not ( = ?auto_105335 ?auto_105340 ) ) ( not ( = ?auto_105335 ?auto_105341 ) ) ( not ( = ?auto_105336 ?auto_105337 ) ) ( not ( = ?auto_105336 ?auto_105338 ) ) ( not ( = ?auto_105336 ?auto_105339 ) ) ( not ( = ?auto_105336 ?auto_105340 ) ) ( not ( = ?auto_105336 ?auto_105341 ) ) ( not ( = ?auto_105337 ?auto_105338 ) ) ( not ( = ?auto_105337 ?auto_105339 ) ) ( not ( = ?auto_105337 ?auto_105340 ) ) ( not ( = ?auto_105337 ?auto_105341 ) ) ( not ( = ?auto_105338 ?auto_105339 ) ) ( not ( = ?auto_105338 ?auto_105340 ) ) ( not ( = ?auto_105338 ?auto_105341 ) ) ( not ( = ?auto_105339 ?auto_105340 ) ) ( not ( = ?auto_105339 ?auto_105341 ) ) ( not ( = ?auto_105340 ?auto_105341 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105340 ?auto_105341 )
      ( !STACK ?auto_105340 ?auto_105339 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105361 - BLOCK
      ?auto_105362 - BLOCK
      ?auto_105363 - BLOCK
      ?auto_105364 - BLOCK
      ?auto_105365 - BLOCK
      ?auto_105366 - BLOCK
    )
    :vars
    (
      ?auto_105367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105366 ?auto_105367 ) ( ON-TABLE ?auto_105361 ) ( ON ?auto_105362 ?auto_105361 ) ( ON ?auto_105363 ?auto_105362 ) ( ON ?auto_105364 ?auto_105363 ) ( not ( = ?auto_105361 ?auto_105362 ) ) ( not ( = ?auto_105361 ?auto_105363 ) ) ( not ( = ?auto_105361 ?auto_105364 ) ) ( not ( = ?auto_105361 ?auto_105365 ) ) ( not ( = ?auto_105361 ?auto_105366 ) ) ( not ( = ?auto_105361 ?auto_105367 ) ) ( not ( = ?auto_105362 ?auto_105363 ) ) ( not ( = ?auto_105362 ?auto_105364 ) ) ( not ( = ?auto_105362 ?auto_105365 ) ) ( not ( = ?auto_105362 ?auto_105366 ) ) ( not ( = ?auto_105362 ?auto_105367 ) ) ( not ( = ?auto_105363 ?auto_105364 ) ) ( not ( = ?auto_105363 ?auto_105365 ) ) ( not ( = ?auto_105363 ?auto_105366 ) ) ( not ( = ?auto_105363 ?auto_105367 ) ) ( not ( = ?auto_105364 ?auto_105365 ) ) ( not ( = ?auto_105364 ?auto_105366 ) ) ( not ( = ?auto_105364 ?auto_105367 ) ) ( not ( = ?auto_105365 ?auto_105366 ) ) ( not ( = ?auto_105365 ?auto_105367 ) ) ( not ( = ?auto_105366 ?auto_105367 ) ) ( CLEAR ?auto_105364 ) ( ON ?auto_105365 ?auto_105366 ) ( CLEAR ?auto_105365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105361 ?auto_105362 ?auto_105363 ?auto_105364 ?auto_105365 )
      ( MAKE-6PILE ?auto_105361 ?auto_105362 ?auto_105363 ?auto_105364 ?auto_105365 ?auto_105366 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105387 - BLOCK
      ?auto_105388 - BLOCK
      ?auto_105389 - BLOCK
      ?auto_105390 - BLOCK
      ?auto_105391 - BLOCK
      ?auto_105392 - BLOCK
    )
    :vars
    (
      ?auto_105393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105392 ?auto_105393 ) ( ON-TABLE ?auto_105387 ) ( ON ?auto_105388 ?auto_105387 ) ( ON ?auto_105389 ?auto_105388 ) ( not ( = ?auto_105387 ?auto_105388 ) ) ( not ( = ?auto_105387 ?auto_105389 ) ) ( not ( = ?auto_105387 ?auto_105390 ) ) ( not ( = ?auto_105387 ?auto_105391 ) ) ( not ( = ?auto_105387 ?auto_105392 ) ) ( not ( = ?auto_105387 ?auto_105393 ) ) ( not ( = ?auto_105388 ?auto_105389 ) ) ( not ( = ?auto_105388 ?auto_105390 ) ) ( not ( = ?auto_105388 ?auto_105391 ) ) ( not ( = ?auto_105388 ?auto_105392 ) ) ( not ( = ?auto_105388 ?auto_105393 ) ) ( not ( = ?auto_105389 ?auto_105390 ) ) ( not ( = ?auto_105389 ?auto_105391 ) ) ( not ( = ?auto_105389 ?auto_105392 ) ) ( not ( = ?auto_105389 ?auto_105393 ) ) ( not ( = ?auto_105390 ?auto_105391 ) ) ( not ( = ?auto_105390 ?auto_105392 ) ) ( not ( = ?auto_105390 ?auto_105393 ) ) ( not ( = ?auto_105391 ?auto_105392 ) ) ( not ( = ?auto_105391 ?auto_105393 ) ) ( not ( = ?auto_105392 ?auto_105393 ) ) ( ON ?auto_105391 ?auto_105392 ) ( CLEAR ?auto_105389 ) ( ON ?auto_105390 ?auto_105391 ) ( CLEAR ?auto_105390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105387 ?auto_105388 ?auto_105389 ?auto_105390 )
      ( MAKE-6PILE ?auto_105387 ?auto_105388 ?auto_105389 ?auto_105390 ?auto_105391 ?auto_105392 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105413 - BLOCK
      ?auto_105414 - BLOCK
      ?auto_105415 - BLOCK
      ?auto_105416 - BLOCK
      ?auto_105417 - BLOCK
      ?auto_105418 - BLOCK
    )
    :vars
    (
      ?auto_105419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105418 ?auto_105419 ) ( ON-TABLE ?auto_105413 ) ( ON ?auto_105414 ?auto_105413 ) ( not ( = ?auto_105413 ?auto_105414 ) ) ( not ( = ?auto_105413 ?auto_105415 ) ) ( not ( = ?auto_105413 ?auto_105416 ) ) ( not ( = ?auto_105413 ?auto_105417 ) ) ( not ( = ?auto_105413 ?auto_105418 ) ) ( not ( = ?auto_105413 ?auto_105419 ) ) ( not ( = ?auto_105414 ?auto_105415 ) ) ( not ( = ?auto_105414 ?auto_105416 ) ) ( not ( = ?auto_105414 ?auto_105417 ) ) ( not ( = ?auto_105414 ?auto_105418 ) ) ( not ( = ?auto_105414 ?auto_105419 ) ) ( not ( = ?auto_105415 ?auto_105416 ) ) ( not ( = ?auto_105415 ?auto_105417 ) ) ( not ( = ?auto_105415 ?auto_105418 ) ) ( not ( = ?auto_105415 ?auto_105419 ) ) ( not ( = ?auto_105416 ?auto_105417 ) ) ( not ( = ?auto_105416 ?auto_105418 ) ) ( not ( = ?auto_105416 ?auto_105419 ) ) ( not ( = ?auto_105417 ?auto_105418 ) ) ( not ( = ?auto_105417 ?auto_105419 ) ) ( not ( = ?auto_105418 ?auto_105419 ) ) ( ON ?auto_105417 ?auto_105418 ) ( ON ?auto_105416 ?auto_105417 ) ( CLEAR ?auto_105414 ) ( ON ?auto_105415 ?auto_105416 ) ( CLEAR ?auto_105415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105413 ?auto_105414 ?auto_105415 )
      ( MAKE-6PILE ?auto_105413 ?auto_105414 ?auto_105415 ?auto_105416 ?auto_105417 ?auto_105418 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105439 - BLOCK
      ?auto_105440 - BLOCK
      ?auto_105441 - BLOCK
      ?auto_105442 - BLOCK
      ?auto_105443 - BLOCK
      ?auto_105444 - BLOCK
    )
    :vars
    (
      ?auto_105445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105444 ?auto_105445 ) ( ON-TABLE ?auto_105439 ) ( not ( = ?auto_105439 ?auto_105440 ) ) ( not ( = ?auto_105439 ?auto_105441 ) ) ( not ( = ?auto_105439 ?auto_105442 ) ) ( not ( = ?auto_105439 ?auto_105443 ) ) ( not ( = ?auto_105439 ?auto_105444 ) ) ( not ( = ?auto_105439 ?auto_105445 ) ) ( not ( = ?auto_105440 ?auto_105441 ) ) ( not ( = ?auto_105440 ?auto_105442 ) ) ( not ( = ?auto_105440 ?auto_105443 ) ) ( not ( = ?auto_105440 ?auto_105444 ) ) ( not ( = ?auto_105440 ?auto_105445 ) ) ( not ( = ?auto_105441 ?auto_105442 ) ) ( not ( = ?auto_105441 ?auto_105443 ) ) ( not ( = ?auto_105441 ?auto_105444 ) ) ( not ( = ?auto_105441 ?auto_105445 ) ) ( not ( = ?auto_105442 ?auto_105443 ) ) ( not ( = ?auto_105442 ?auto_105444 ) ) ( not ( = ?auto_105442 ?auto_105445 ) ) ( not ( = ?auto_105443 ?auto_105444 ) ) ( not ( = ?auto_105443 ?auto_105445 ) ) ( not ( = ?auto_105444 ?auto_105445 ) ) ( ON ?auto_105443 ?auto_105444 ) ( ON ?auto_105442 ?auto_105443 ) ( ON ?auto_105441 ?auto_105442 ) ( CLEAR ?auto_105439 ) ( ON ?auto_105440 ?auto_105441 ) ( CLEAR ?auto_105440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105439 ?auto_105440 )
      ( MAKE-6PILE ?auto_105439 ?auto_105440 ?auto_105441 ?auto_105442 ?auto_105443 ?auto_105444 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105465 - BLOCK
      ?auto_105466 - BLOCK
      ?auto_105467 - BLOCK
      ?auto_105468 - BLOCK
      ?auto_105469 - BLOCK
      ?auto_105470 - BLOCK
    )
    :vars
    (
      ?auto_105471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105470 ?auto_105471 ) ( not ( = ?auto_105465 ?auto_105466 ) ) ( not ( = ?auto_105465 ?auto_105467 ) ) ( not ( = ?auto_105465 ?auto_105468 ) ) ( not ( = ?auto_105465 ?auto_105469 ) ) ( not ( = ?auto_105465 ?auto_105470 ) ) ( not ( = ?auto_105465 ?auto_105471 ) ) ( not ( = ?auto_105466 ?auto_105467 ) ) ( not ( = ?auto_105466 ?auto_105468 ) ) ( not ( = ?auto_105466 ?auto_105469 ) ) ( not ( = ?auto_105466 ?auto_105470 ) ) ( not ( = ?auto_105466 ?auto_105471 ) ) ( not ( = ?auto_105467 ?auto_105468 ) ) ( not ( = ?auto_105467 ?auto_105469 ) ) ( not ( = ?auto_105467 ?auto_105470 ) ) ( not ( = ?auto_105467 ?auto_105471 ) ) ( not ( = ?auto_105468 ?auto_105469 ) ) ( not ( = ?auto_105468 ?auto_105470 ) ) ( not ( = ?auto_105468 ?auto_105471 ) ) ( not ( = ?auto_105469 ?auto_105470 ) ) ( not ( = ?auto_105469 ?auto_105471 ) ) ( not ( = ?auto_105470 ?auto_105471 ) ) ( ON ?auto_105469 ?auto_105470 ) ( ON ?auto_105468 ?auto_105469 ) ( ON ?auto_105467 ?auto_105468 ) ( ON ?auto_105466 ?auto_105467 ) ( ON ?auto_105465 ?auto_105466 ) ( CLEAR ?auto_105465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105465 )
      ( MAKE-6PILE ?auto_105465 ?auto_105466 ?auto_105467 ?auto_105468 ?auto_105469 ?auto_105470 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105492 - BLOCK
      ?auto_105493 - BLOCK
      ?auto_105494 - BLOCK
      ?auto_105495 - BLOCK
      ?auto_105496 - BLOCK
      ?auto_105497 - BLOCK
      ?auto_105498 - BLOCK
    )
    :vars
    (
      ?auto_105499 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_105497 ) ( ON ?auto_105498 ?auto_105499 ) ( CLEAR ?auto_105498 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105492 ) ( ON ?auto_105493 ?auto_105492 ) ( ON ?auto_105494 ?auto_105493 ) ( ON ?auto_105495 ?auto_105494 ) ( ON ?auto_105496 ?auto_105495 ) ( ON ?auto_105497 ?auto_105496 ) ( not ( = ?auto_105492 ?auto_105493 ) ) ( not ( = ?auto_105492 ?auto_105494 ) ) ( not ( = ?auto_105492 ?auto_105495 ) ) ( not ( = ?auto_105492 ?auto_105496 ) ) ( not ( = ?auto_105492 ?auto_105497 ) ) ( not ( = ?auto_105492 ?auto_105498 ) ) ( not ( = ?auto_105492 ?auto_105499 ) ) ( not ( = ?auto_105493 ?auto_105494 ) ) ( not ( = ?auto_105493 ?auto_105495 ) ) ( not ( = ?auto_105493 ?auto_105496 ) ) ( not ( = ?auto_105493 ?auto_105497 ) ) ( not ( = ?auto_105493 ?auto_105498 ) ) ( not ( = ?auto_105493 ?auto_105499 ) ) ( not ( = ?auto_105494 ?auto_105495 ) ) ( not ( = ?auto_105494 ?auto_105496 ) ) ( not ( = ?auto_105494 ?auto_105497 ) ) ( not ( = ?auto_105494 ?auto_105498 ) ) ( not ( = ?auto_105494 ?auto_105499 ) ) ( not ( = ?auto_105495 ?auto_105496 ) ) ( not ( = ?auto_105495 ?auto_105497 ) ) ( not ( = ?auto_105495 ?auto_105498 ) ) ( not ( = ?auto_105495 ?auto_105499 ) ) ( not ( = ?auto_105496 ?auto_105497 ) ) ( not ( = ?auto_105496 ?auto_105498 ) ) ( not ( = ?auto_105496 ?auto_105499 ) ) ( not ( = ?auto_105497 ?auto_105498 ) ) ( not ( = ?auto_105497 ?auto_105499 ) ) ( not ( = ?auto_105498 ?auto_105499 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105498 ?auto_105499 )
      ( !STACK ?auto_105498 ?auto_105497 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105522 - BLOCK
      ?auto_105523 - BLOCK
      ?auto_105524 - BLOCK
      ?auto_105525 - BLOCK
      ?auto_105526 - BLOCK
      ?auto_105527 - BLOCK
      ?auto_105528 - BLOCK
    )
    :vars
    (
      ?auto_105529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105528 ?auto_105529 ) ( ON-TABLE ?auto_105522 ) ( ON ?auto_105523 ?auto_105522 ) ( ON ?auto_105524 ?auto_105523 ) ( ON ?auto_105525 ?auto_105524 ) ( ON ?auto_105526 ?auto_105525 ) ( not ( = ?auto_105522 ?auto_105523 ) ) ( not ( = ?auto_105522 ?auto_105524 ) ) ( not ( = ?auto_105522 ?auto_105525 ) ) ( not ( = ?auto_105522 ?auto_105526 ) ) ( not ( = ?auto_105522 ?auto_105527 ) ) ( not ( = ?auto_105522 ?auto_105528 ) ) ( not ( = ?auto_105522 ?auto_105529 ) ) ( not ( = ?auto_105523 ?auto_105524 ) ) ( not ( = ?auto_105523 ?auto_105525 ) ) ( not ( = ?auto_105523 ?auto_105526 ) ) ( not ( = ?auto_105523 ?auto_105527 ) ) ( not ( = ?auto_105523 ?auto_105528 ) ) ( not ( = ?auto_105523 ?auto_105529 ) ) ( not ( = ?auto_105524 ?auto_105525 ) ) ( not ( = ?auto_105524 ?auto_105526 ) ) ( not ( = ?auto_105524 ?auto_105527 ) ) ( not ( = ?auto_105524 ?auto_105528 ) ) ( not ( = ?auto_105524 ?auto_105529 ) ) ( not ( = ?auto_105525 ?auto_105526 ) ) ( not ( = ?auto_105525 ?auto_105527 ) ) ( not ( = ?auto_105525 ?auto_105528 ) ) ( not ( = ?auto_105525 ?auto_105529 ) ) ( not ( = ?auto_105526 ?auto_105527 ) ) ( not ( = ?auto_105526 ?auto_105528 ) ) ( not ( = ?auto_105526 ?auto_105529 ) ) ( not ( = ?auto_105527 ?auto_105528 ) ) ( not ( = ?auto_105527 ?auto_105529 ) ) ( not ( = ?auto_105528 ?auto_105529 ) ) ( CLEAR ?auto_105526 ) ( ON ?auto_105527 ?auto_105528 ) ( CLEAR ?auto_105527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105522 ?auto_105523 ?auto_105524 ?auto_105525 ?auto_105526 ?auto_105527 )
      ( MAKE-7PILE ?auto_105522 ?auto_105523 ?auto_105524 ?auto_105525 ?auto_105526 ?auto_105527 ?auto_105528 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105552 - BLOCK
      ?auto_105553 - BLOCK
      ?auto_105554 - BLOCK
      ?auto_105555 - BLOCK
      ?auto_105556 - BLOCK
      ?auto_105557 - BLOCK
      ?auto_105558 - BLOCK
    )
    :vars
    (
      ?auto_105559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105558 ?auto_105559 ) ( ON-TABLE ?auto_105552 ) ( ON ?auto_105553 ?auto_105552 ) ( ON ?auto_105554 ?auto_105553 ) ( ON ?auto_105555 ?auto_105554 ) ( not ( = ?auto_105552 ?auto_105553 ) ) ( not ( = ?auto_105552 ?auto_105554 ) ) ( not ( = ?auto_105552 ?auto_105555 ) ) ( not ( = ?auto_105552 ?auto_105556 ) ) ( not ( = ?auto_105552 ?auto_105557 ) ) ( not ( = ?auto_105552 ?auto_105558 ) ) ( not ( = ?auto_105552 ?auto_105559 ) ) ( not ( = ?auto_105553 ?auto_105554 ) ) ( not ( = ?auto_105553 ?auto_105555 ) ) ( not ( = ?auto_105553 ?auto_105556 ) ) ( not ( = ?auto_105553 ?auto_105557 ) ) ( not ( = ?auto_105553 ?auto_105558 ) ) ( not ( = ?auto_105553 ?auto_105559 ) ) ( not ( = ?auto_105554 ?auto_105555 ) ) ( not ( = ?auto_105554 ?auto_105556 ) ) ( not ( = ?auto_105554 ?auto_105557 ) ) ( not ( = ?auto_105554 ?auto_105558 ) ) ( not ( = ?auto_105554 ?auto_105559 ) ) ( not ( = ?auto_105555 ?auto_105556 ) ) ( not ( = ?auto_105555 ?auto_105557 ) ) ( not ( = ?auto_105555 ?auto_105558 ) ) ( not ( = ?auto_105555 ?auto_105559 ) ) ( not ( = ?auto_105556 ?auto_105557 ) ) ( not ( = ?auto_105556 ?auto_105558 ) ) ( not ( = ?auto_105556 ?auto_105559 ) ) ( not ( = ?auto_105557 ?auto_105558 ) ) ( not ( = ?auto_105557 ?auto_105559 ) ) ( not ( = ?auto_105558 ?auto_105559 ) ) ( ON ?auto_105557 ?auto_105558 ) ( CLEAR ?auto_105555 ) ( ON ?auto_105556 ?auto_105557 ) ( CLEAR ?auto_105556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105552 ?auto_105553 ?auto_105554 ?auto_105555 ?auto_105556 )
      ( MAKE-7PILE ?auto_105552 ?auto_105553 ?auto_105554 ?auto_105555 ?auto_105556 ?auto_105557 ?auto_105558 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105582 - BLOCK
      ?auto_105583 - BLOCK
      ?auto_105584 - BLOCK
      ?auto_105585 - BLOCK
      ?auto_105586 - BLOCK
      ?auto_105587 - BLOCK
      ?auto_105588 - BLOCK
    )
    :vars
    (
      ?auto_105589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105588 ?auto_105589 ) ( ON-TABLE ?auto_105582 ) ( ON ?auto_105583 ?auto_105582 ) ( ON ?auto_105584 ?auto_105583 ) ( not ( = ?auto_105582 ?auto_105583 ) ) ( not ( = ?auto_105582 ?auto_105584 ) ) ( not ( = ?auto_105582 ?auto_105585 ) ) ( not ( = ?auto_105582 ?auto_105586 ) ) ( not ( = ?auto_105582 ?auto_105587 ) ) ( not ( = ?auto_105582 ?auto_105588 ) ) ( not ( = ?auto_105582 ?auto_105589 ) ) ( not ( = ?auto_105583 ?auto_105584 ) ) ( not ( = ?auto_105583 ?auto_105585 ) ) ( not ( = ?auto_105583 ?auto_105586 ) ) ( not ( = ?auto_105583 ?auto_105587 ) ) ( not ( = ?auto_105583 ?auto_105588 ) ) ( not ( = ?auto_105583 ?auto_105589 ) ) ( not ( = ?auto_105584 ?auto_105585 ) ) ( not ( = ?auto_105584 ?auto_105586 ) ) ( not ( = ?auto_105584 ?auto_105587 ) ) ( not ( = ?auto_105584 ?auto_105588 ) ) ( not ( = ?auto_105584 ?auto_105589 ) ) ( not ( = ?auto_105585 ?auto_105586 ) ) ( not ( = ?auto_105585 ?auto_105587 ) ) ( not ( = ?auto_105585 ?auto_105588 ) ) ( not ( = ?auto_105585 ?auto_105589 ) ) ( not ( = ?auto_105586 ?auto_105587 ) ) ( not ( = ?auto_105586 ?auto_105588 ) ) ( not ( = ?auto_105586 ?auto_105589 ) ) ( not ( = ?auto_105587 ?auto_105588 ) ) ( not ( = ?auto_105587 ?auto_105589 ) ) ( not ( = ?auto_105588 ?auto_105589 ) ) ( ON ?auto_105587 ?auto_105588 ) ( ON ?auto_105586 ?auto_105587 ) ( CLEAR ?auto_105584 ) ( ON ?auto_105585 ?auto_105586 ) ( CLEAR ?auto_105585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105582 ?auto_105583 ?auto_105584 ?auto_105585 )
      ( MAKE-7PILE ?auto_105582 ?auto_105583 ?auto_105584 ?auto_105585 ?auto_105586 ?auto_105587 ?auto_105588 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105612 - BLOCK
      ?auto_105613 - BLOCK
      ?auto_105614 - BLOCK
      ?auto_105615 - BLOCK
      ?auto_105616 - BLOCK
      ?auto_105617 - BLOCK
      ?auto_105618 - BLOCK
    )
    :vars
    (
      ?auto_105619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105618 ?auto_105619 ) ( ON-TABLE ?auto_105612 ) ( ON ?auto_105613 ?auto_105612 ) ( not ( = ?auto_105612 ?auto_105613 ) ) ( not ( = ?auto_105612 ?auto_105614 ) ) ( not ( = ?auto_105612 ?auto_105615 ) ) ( not ( = ?auto_105612 ?auto_105616 ) ) ( not ( = ?auto_105612 ?auto_105617 ) ) ( not ( = ?auto_105612 ?auto_105618 ) ) ( not ( = ?auto_105612 ?auto_105619 ) ) ( not ( = ?auto_105613 ?auto_105614 ) ) ( not ( = ?auto_105613 ?auto_105615 ) ) ( not ( = ?auto_105613 ?auto_105616 ) ) ( not ( = ?auto_105613 ?auto_105617 ) ) ( not ( = ?auto_105613 ?auto_105618 ) ) ( not ( = ?auto_105613 ?auto_105619 ) ) ( not ( = ?auto_105614 ?auto_105615 ) ) ( not ( = ?auto_105614 ?auto_105616 ) ) ( not ( = ?auto_105614 ?auto_105617 ) ) ( not ( = ?auto_105614 ?auto_105618 ) ) ( not ( = ?auto_105614 ?auto_105619 ) ) ( not ( = ?auto_105615 ?auto_105616 ) ) ( not ( = ?auto_105615 ?auto_105617 ) ) ( not ( = ?auto_105615 ?auto_105618 ) ) ( not ( = ?auto_105615 ?auto_105619 ) ) ( not ( = ?auto_105616 ?auto_105617 ) ) ( not ( = ?auto_105616 ?auto_105618 ) ) ( not ( = ?auto_105616 ?auto_105619 ) ) ( not ( = ?auto_105617 ?auto_105618 ) ) ( not ( = ?auto_105617 ?auto_105619 ) ) ( not ( = ?auto_105618 ?auto_105619 ) ) ( ON ?auto_105617 ?auto_105618 ) ( ON ?auto_105616 ?auto_105617 ) ( ON ?auto_105615 ?auto_105616 ) ( CLEAR ?auto_105613 ) ( ON ?auto_105614 ?auto_105615 ) ( CLEAR ?auto_105614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105612 ?auto_105613 ?auto_105614 )
      ( MAKE-7PILE ?auto_105612 ?auto_105613 ?auto_105614 ?auto_105615 ?auto_105616 ?auto_105617 ?auto_105618 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105642 - BLOCK
      ?auto_105643 - BLOCK
      ?auto_105644 - BLOCK
      ?auto_105645 - BLOCK
      ?auto_105646 - BLOCK
      ?auto_105647 - BLOCK
      ?auto_105648 - BLOCK
    )
    :vars
    (
      ?auto_105649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105648 ?auto_105649 ) ( ON-TABLE ?auto_105642 ) ( not ( = ?auto_105642 ?auto_105643 ) ) ( not ( = ?auto_105642 ?auto_105644 ) ) ( not ( = ?auto_105642 ?auto_105645 ) ) ( not ( = ?auto_105642 ?auto_105646 ) ) ( not ( = ?auto_105642 ?auto_105647 ) ) ( not ( = ?auto_105642 ?auto_105648 ) ) ( not ( = ?auto_105642 ?auto_105649 ) ) ( not ( = ?auto_105643 ?auto_105644 ) ) ( not ( = ?auto_105643 ?auto_105645 ) ) ( not ( = ?auto_105643 ?auto_105646 ) ) ( not ( = ?auto_105643 ?auto_105647 ) ) ( not ( = ?auto_105643 ?auto_105648 ) ) ( not ( = ?auto_105643 ?auto_105649 ) ) ( not ( = ?auto_105644 ?auto_105645 ) ) ( not ( = ?auto_105644 ?auto_105646 ) ) ( not ( = ?auto_105644 ?auto_105647 ) ) ( not ( = ?auto_105644 ?auto_105648 ) ) ( not ( = ?auto_105644 ?auto_105649 ) ) ( not ( = ?auto_105645 ?auto_105646 ) ) ( not ( = ?auto_105645 ?auto_105647 ) ) ( not ( = ?auto_105645 ?auto_105648 ) ) ( not ( = ?auto_105645 ?auto_105649 ) ) ( not ( = ?auto_105646 ?auto_105647 ) ) ( not ( = ?auto_105646 ?auto_105648 ) ) ( not ( = ?auto_105646 ?auto_105649 ) ) ( not ( = ?auto_105647 ?auto_105648 ) ) ( not ( = ?auto_105647 ?auto_105649 ) ) ( not ( = ?auto_105648 ?auto_105649 ) ) ( ON ?auto_105647 ?auto_105648 ) ( ON ?auto_105646 ?auto_105647 ) ( ON ?auto_105645 ?auto_105646 ) ( ON ?auto_105644 ?auto_105645 ) ( CLEAR ?auto_105642 ) ( ON ?auto_105643 ?auto_105644 ) ( CLEAR ?auto_105643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105642 ?auto_105643 )
      ( MAKE-7PILE ?auto_105642 ?auto_105643 ?auto_105644 ?auto_105645 ?auto_105646 ?auto_105647 ?auto_105648 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105672 - BLOCK
      ?auto_105673 - BLOCK
      ?auto_105674 - BLOCK
      ?auto_105675 - BLOCK
      ?auto_105676 - BLOCK
      ?auto_105677 - BLOCK
      ?auto_105678 - BLOCK
    )
    :vars
    (
      ?auto_105679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105678 ?auto_105679 ) ( not ( = ?auto_105672 ?auto_105673 ) ) ( not ( = ?auto_105672 ?auto_105674 ) ) ( not ( = ?auto_105672 ?auto_105675 ) ) ( not ( = ?auto_105672 ?auto_105676 ) ) ( not ( = ?auto_105672 ?auto_105677 ) ) ( not ( = ?auto_105672 ?auto_105678 ) ) ( not ( = ?auto_105672 ?auto_105679 ) ) ( not ( = ?auto_105673 ?auto_105674 ) ) ( not ( = ?auto_105673 ?auto_105675 ) ) ( not ( = ?auto_105673 ?auto_105676 ) ) ( not ( = ?auto_105673 ?auto_105677 ) ) ( not ( = ?auto_105673 ?auto_105678 ) ) ( not ( = ?auto_105673 ?auto_105679 ) ) ( not ( = ?auto_105674 ?auto_105675 ) ) ( not ( = ?auto_105674 ?auto_105676 ) ) ( not ( = ?auto_105674 ?auto_105677 ) ) ( not ( = ?auto_105674 ?auto_105678 ) ) ( not ( = ?auto_105674 ?auto_105679 ) ) ( not ( = ?auto_105675 ?auto_105676 ) ) ( not ( = ?auto_105675 ?auto_105677 ) ) ( not ( = ?auto_105675 ?auto_105678 ) ) ( not ( = ?auto_105675 ?auto_105679 ) ) ( not ( = ?auto_105676 ?auto_105677 ) ) ( not ( = ?auto_105676 ?auto_105678 ) ) ( not ( = ?auto_105676 ?auto_105679 ) ) ( not ( = ?auto_105677 ?auto_105678 ) ) ( not ( = ?auto_105677 ?auto_105679 ) ) ( not ( = ?auto_105678 ?auto_105679 ) ) ( ON ?auto_105677 ?auto_105678 ) ( ON ?auto_105676 ?auto_105677 ) ( ON ?auto_105675 ?auto_105676 ) ( ON ?auto_105674 ?auto_105675 ) ( ON ?auto_105673 ?auto_105674 ) ( ON ?auto_105672 ?auto_105673 ) ( CLEAR ?auto_105672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105672 )
      ( MAKE-7PILE ?auto_105672 ?auto_105673 ?auto_105674 ?auto_105675 ?auto_105676 ?auto_105677 ?auto_105678 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_105703 - BLOCK
      ?auto_105704 - BLOCK
      ?auto_105705 - BLOCK
      ?auto_105706 - BLOCK
      ?auto_105707 - BLOCK
      ?auto_105708 - BLOCK
      ?auto_105709 - BLOCK
      ?auto_105710 - BLOCK
    )
    :vars
    (
      ?auto_105711 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_105709 ) ( ON ?auto_105710 ?auto_105711 ) ( CLEAR ?auto_105710 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105703 ) ( ON ?auto_105704 ?auto_105703 ) ( ON ?auto_105705 ?auto_105704 ) ( ON ?auto_105706 ?auto_105705 ) ( ON ?auto_105707 ?auto_105706 ) ( ON ?auto_105708 ?auto_105707 ) ( ON ?auto_105709 ?auto_105708 ) ( not ( = ?auto_105703 ?auto_105704 ) ) ( not ( = ?auto_105703 ?auto_105705 ) ) ( not ( = ?auto_105703 ?auto_105706 ) ) ( not ( = ?auto_105703 ?auto_105707 ) ) ( not ( = ?auto_105703 ?auto_105708 ) ) ( not ( = ?auto_105703 ?auto_105709 ) ) ( not ( = ?auto_105703 ?auto_105710 ) ) ( not ( = ?auto_105703 ?auto_105711 ) ) ( not ( = ?auto_105704 ?auto_105705 ) ) ( not ( = ?auto_105704 ?auto_105706 ) ) ( not ( = ?auto_105704 ?auto_105707 ) ) ( not ( = ?auto_105704 ?auto_105708 ) ) ( not ( = ?auto_105704 ?auto_105709 ) ) ( not ( = ?auto_105704 ?auto_105710 ) ) ( not ( = ?auto_105704 ?auto_105711 ) ) ( not ( = ?auto_105705 ?auto_105706 ) ) ( not ( = ?auto_105705 ?auto_105707 ) ) ( not ( = ?auto_105705 ?auto_105708 ) ) ( not ( = ?auto_105705 ?auto_105709 ) ) ( not ( = ?auto_105705 ?auto_105710 ) ) ( not ( = ?auto_105705 ?auto_105711 ) ) ( not ( = ?auto_105706 ?auto_105707 ) ) ( not ( = ?auto_105706 ?auto_105708 ) ) ( not ( = ?auto_105706 ?auto_105709 ) ) ( not ( = ?auto_105706 ?auto_105710 ) ) ( not ( = ?auto_105706 ?auto_105711 ) ) ( not ( = ?auto_105707 ?auto_105708 ) ) ( not ( = ?auto_105707 ?auto_105709 ) ) ( not ( = ?auto_105707 ?auto_105710 ) ) ( not ( = ?auto_105707 ?auto_105711 ) ) ( not ( = ?auto_105708 ?auto_105709 ) ) ( not ( = ?auto_105708 ?auto_105710 ) ) ( not ( = ?auto_105708 ?auto_105711 ) ) ( not ( = ?auto_105709 ?auto_105710 ) ) ( not ( = ?auto_105709 ?auto_105711 ) ) ( not ( = ?auto_105710 ?auto_105711 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105710 ?auto_105711 )
      ( !STACK ?auto_105710 ?auto_105709 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_105737 - BLOCK
      ?auto_105738 - BLOCK
      ?auto_105739 - BLOCK
      ?auto_105740 - BLOCK
      ?auto_105741 - BLOCK
      ?auto_105742 - BLOCK
      ?auto_105743 - BLOCK
      ?auto_105744 - BLOCK
    )
    :vars
    (
      ?auto_105745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105744 ?auto_105745 ) ( ON-TABLE ?auto_105737 ) ( ON ?auto_105738 ?auto_105737 ) ( ON ?auto_105739 ?auto_105738 ) ( ON ?auto_105740 ?auto_105739 ) ( ON ?auto_105741 ?auto_105740 ) ( ON ?auto_105742 ?auto_105741 ) ( not ( = ?auto_105737 ?auto_105738 ) ) ( not ( = ?auto_105737 ?auto_105739 ) ) ( not ( = ?auto_105737 ?auto_105740 ) ) ( not ( = ?auto_105737 ?auto_105741 ) ) ( not ( = ?auto_105737 ?auto_105742 ) ) ( not ( = ?auto_105737 ?auto_105743 ) ) ( not ( = ?auto_105737 ?auto_105744 ) ) ( not ( = ?auto_105737 ?auto_105745 ) ) ( not ( = ?auto_105738 ?auto_105739 ) ) ( not ( = ?auto_105738 ?auto_105740 ) ) ( not ( = ?auto_105738 ?auto_105741 ) ) ( not ( = ?auto_105738 ?auto_105742 ) ) ( not ( = ?auto_105738 ?auto_105743 ) ) ( not ( = ?auto_105738 ?auto_105744 ) ) ( not ( = ?auto_105738 ?auto_105745 ) ) ( not ( = ?auto_105739 ?auto_105740 ) ) ( not ( = ?auto_105739 ?auto_105741 ) ) ( not ( = ?auto_105739 ?auto_105742 ) ) ( not ( = ?auto_105739 ?auto_105743 ) ) ( not ( = ?auto_105739 ?auto_105744 ) ) ( not ( = ?auto_105739 ?auto_105745 ) ) ( not ( = ?auto_105740 ?auto_105741 ) ) ( not ( = ?auto_105740 ?auto_105742 ) ) ( not ( = ?auto_105740 ?auto_105743 ) ) ( not ( = ?auto_105740 ?auto_105744 ) ) ( not ( = ?auto_105740 ?auto_105745 ) ) ( not ( = ?auto_105741 ?auto_105742 ) ) ( not ( = ?auto_105741 ?auto_105743 ) ) ( not ( = ?auto_105741 ?auto_105744 ) ) ( not ( = ?auto_105741 ?auto_105745 ) ) ( not ( = ?auto_105742 ?auto_105743 ) ) ( not ( = ?auto_105742 ?auto_105744 ) ) ( not ( = ?auto_105742 ?auto_105745 ) ) ( not ( = ?auto_105743 ?auto_105744 ) ) ( not ( = ?auto_105743 ?auto_105745 ) ) ( not ( = ?auto_105744 ?auto_105745 ) ) ( CLEAR ?auto_105742 ) ( ON ?auto_105743 ?auto_105744 ) ( CLEAR ?auto_105743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105737 ?auto_105738 ?auto_105739 ?auto_105740 ?auto_105741 ?auto_105742 ?auto_105743 )
      ( MAKE-8PILE ?auto_105737 ?auto_105738 ?auto_105739 ?auto_105740 ?auto_105741 ?auto_105742 ?auto_105743 ?auto_105744 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_105771 - BLOCK
      ?auto_105772 - BLOCK
      ?auto_105773 - BLOCK
      ?auto_105774 - BLOCK
      ?auto_105775 - BLOCK
      ?auto_105776 - BLOCK
      ?auto_105777 - BLOCK
      ?auto_105778 - BLOCK
    )
    :vars
    (
      ?auto_105779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105778 ?auto_105779 ) ( ON-TABLE ?auto_105771 ) ( ON ?auto_105772 ?auto_105771 ) ( ON ?auto_105773 ?auto_105772 ) ( ON ?auto_105774 ?auto_105773 ) ( ON ?auto_105775 ?auto_105774 ) ( not ( = ?auto_105771 ?auto_105772 ) ) ( not ( = ?auto_105771 ?auto_105773 ) ) ( not ( = ?auto_105771 ?auto_105774 ) ) ( not ( = ?auto_105771 ?auto_105775 ) ) ( not ( = ?auto_105771 ?auto_105776 ) ) ( not ( = ?auto_105771 ?auto_105777 ) ) ( not ( = ?auto_105771 ?auto_105778 ) ) ( not ( = ?auto_105771 ?auto_105779 ) ) ( not ( = ?auto_105772 ?auto_105773 ) ) ( not ( = ?auto_105772 ?auto_105774 ) ) ( not ( = ?auto_105772 ?auto_105775 ) ) ( not ( = ?auto_105772 ?auto_105776 ) ) ( not ( = ?auto_105772 ?auto_105777 ) ) ( not ( = ?auto_105772 ?auto_105778 ) ) ( not ( = ?auto_105772 ?auto_105779 ) ) ( not ( = ?auto_105773 ?auto_105774 ) ) ( not ( = ?auto_105773 ?auto_105775 ) ) ( not ( = ?auto_105773 ?auto_105776 ) ) ( not ( = ?auto_105773 ?auto_105777 ) ) ( not ( = ?auto_105773 ?auto_105778 ) ) ( not ( = ?auto_105773 ?auto_105779 ) ) ( not ( = ?auto_105774 ?auto_105775 ) ) ( not ( = ?auto_105774 ?auto_105776 ) ) ( not ( = ?auto_105774 ?auto_105777 ) ) ( not ( = ?auto_105774 ?auto_105778 ) ) ( not ( = ?auto_105774 ?auto_105779 ) ) ( not ( = ?auto_105775 ?auto_105776 ) ) ( not ( = ?auto_105775 ?auto_105777 ) ) ( not ( = ?auto_105775 ?auto_105778 ) ) ( not ( = ?auto_105775 ?auto_105779 ) ) ( not ( = ?auto_105776 ?auto_105777 ) ) ( not ( = ?auto_105776 ?auto_105778 ) ) ( not ( = ?auto_105776 ?auto_105779 ) ) ( not ( = ?auto_105777 ?auto_105778 ) ) ( not ( = ?auto_105777 ?auto_105779 ) ) ( not ( = ?auto_105778 ?auto_105779 ) ) ( ON ?auto_105777 ?auto_105778 ) ( CLEAR ?auto_105775 ) ( ON ?auto_105776 ?auto_105777 ) ( CLEAR ?auto_105776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105771 ?auto_105772 ?auto_105773 ?auto_105774 ?auto_105775 ?auto_105776 )
      ( MAKE-8PILE ?auto_105771 ?auto_105772 ?auto_105773 ?auto_105774 ?auto_105775 ?auto_105776 ?auto_105777 ?auto_105778 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_105805 - BLOCK
      ?auto_105806 - BLOCK
      ?auto_105807 - BLOCK
      ?auto_105808 - BLOCK
      ?auto_105809 - BLOCK
      ?auto_105810 - BLOCK
      ?auto_105811 - BLOCK
      ?auto_105812 - BLOCK
    )
    :vars
    (
      ?auto_105813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105812 ?auto_105813 ) ( ON-TABLE ?auto_105805 ) ( ON ?auto_105806 ?auto_105805 ) ( ON ?auto_105807 ?auto_105806 ) ( ON ?auto_105808 ?auto_105807 ) ( not ( = ?auto_105805 ?auto_105806 ) ) ( not ( = ?auto_105805 ?auto_105807 ) ) ( not ( = ?auto_105805 ?auto_105808 ) ) ( not ( = ?auto_105805 ?auto_105809 ) ) ( not ( = ?auto_105805 ?auto_105810 ) ) ( not ( = ?auto_105805 ?auto_105811 ) ) ( not ( = ?auto_105805 ?auto_105812 ) ) ( not ( = ?auto_105805 ?auto_105813 ) ) ( not ( = ?auto_105806 ?auto_105807 ) ) ( not ( = ?auto_105806 ?auto_105808 ) ) ( not ( = ?auto_105806 ?auto_105809 ) ) ( not ( = ?auto_105806 ?auto_105810 ) ) ( not ( = ?auto_105806 ?auto_105811 ) ) ( not ( = ?auto_105806 ?auto_105812 ) ) ( not ( = ?auto_105806 ?auto_105813 ) ) ( not ( = ?auto_105807 ?auto_105808 ) ) ( not ( = ?auto_105807 ?auto_105809 ) ) ( not ( = ?auto_105807 ?auto_105810 ) ) ( not ( = ?auto_105807 ?auto_105811 ) ) ( not ( = ?auto_105807 ?auto_105812 ) ) ( not ( = ?auto_105807 ?auto_105813 ) ) ( not ( = ?auto_105808 ?auto_105809 ) ) ( not ( = ?auto_105808 ?auto_105810 ) ) ( not ( = ?auto_105808 ?auto_105811 ) ) ( not ( = ?auto_105808 ?auto_105812 ) ) ( not ( = ?auto_105808 ?auto_105813 ) ) ( not ( = ?auto_105809 ?auto_105810 ) ) ( not ( = ?auto_105809 ?auto_105811 ) ) ( not ( = ?auto_105809 ?auto_105812 ) ) ( not ( = ?auto_105809 ?auto_105813 ) ) ( not ( = ?auto_105810 ?auto_105811 ) ) ( not ( = ?auto_105810 ?auto_105812 ) ) ( not ( = ?auto_105810 ?auto_105813 ) ) ( not ( = ?auto_105811 ?auto_105812 ) ) ( not ( = ?auto_105811 ?auto_105813 ) ) ( not ( = ?auto_105812 ?auto_105813 ) ) ( ON ?auto_105811 ?auto_105812 ) ( ON ?auto_105810 ?auto_105811 ) ( CLEAR ?auto_105808 ) ( ON ?auto_105809 ?auto_105810 ) ( CLEAR ?auto_105809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105805 ?auto_105806 ?auto_105807 ?auto_105808 ?auto_105809 )
      ( MAKE-8PILE ?auto_105805 ?auto_105806 ?auto_105807 ?auto_105808 ?auto_105809 ?auto_105810 ?auto_105811 ?auto_105812 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_105839 - BLOCK
      ?auto_105840 - BLOCK
      ?auto_105841 - BLOCK
      ?auto_105842 - BLOCK
      ?auto_105843 - BLOCK
      ?auto_105844 - BLOCK
      ?auto_105845 - BLOCK
      ?auto_105846 - BLOCK
    )
    :vars
    (
      ?auto_105847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105846 ?auto_105847 ) ( ON-TABLE ?auto_105839 ) ( ON ?auto_105840 ?auto_105839 ) ( ON ?auto_105841 ?auto_105840 ) ( not ( = ?auto_105839 ?auto_105840 ) ) ( not ( = ?auto_105839 ?auto_105841 ) ) ( not ( = ?auto_105839 ?auto_105842 ) ) ( not ( = ?auto_105839 ?auto_105843 ) ) ( not ( = ?auto_105839 ?auto_105844 ) ) ( not ( = ?auto_105839 ?auto_105845 ) ) ( not ( = ?auto_105839 ?auto_105846 ) ) ( not ( = ?auto_105839 ?auto_105847 ) ) ( not ( = ?auto_105840 ?auto_105841 ) ) ( not ( = ?auto_105840 ?auto_105842 ) ) ( not ( = ?auto_105840 ?auto_105843 ) ) ( not ( = ?auto_105840 ?auto_105844 ) ) ( not ( = ?auto_105840 ?auto_105845 ) ) ( not ( = ?auto_105840 ?auto_105846 ) ) ( not ( = ?auto_105840 ?auto_105847 ) ) ( not ( = ?auto_105841 ?auto_105842 ) ) ( not ( = ?auto_105841 ?auto_105843 ) ) ( not ( = ?auto_105841 ?auto_105844 ) ) ( not ( = ?auto_105841 ?auto_105845 ) ) ( not ( = ?auto_105841 ?auto_105846 ) ) ( not ( = ?auto_105841 ?auto_105847 ) ) ( not ( = ?auto_105842 ?auto_105843 ) ) ( not ( = ?auto_105842 ?auto_105844 ) ) ( not ( = ?auto_105842 ?auto_105845 ) ) ( not ( = ?auto_105842 ?auto_105846 ) ) ( not ( = ?auto_105842 ?auto_105847 ) ) ( not ( = ?auto_105843 ?auto_105844 ) ) ( not ( = ?auto_105843 ?auto_105845 ) ) ( not ( = ?auto_105843 ?auto_105846 ) ) ( not ( = ?auto_105843 ?auto_105847 ) ) ( not ( = ?auto_105844 ?auto_105845 ) ) ( not ( = ?auto_105844 ?auto_105846 ) ) ( not ( = ?auto_105844 ?auto_105847 ) ) ( not ( = ?auto_105845 ?auto_105846 ) ) ( not ( = ?auto_105845 ?auto_105847 ) ) ( not ( = ?auto_105846 ?auto_105847 ) ) ( ON ?auto_105845 ?auto_105846 ) ( ON ?auto_105844 ?auto_105845 ) ( ON ?auto_105843 ?auto_105844 ) ( CLEAR ?auto_105841 ) ( ON ?auto_105842 ?auto_105843 ) ( CLEAR ?auto_105842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105839 ?auto_105840 ?auto_105841 ?auto_105842 )
      ( MAKE-8PILE ?auto_105839 ?auto_105840 ?auto_105841 ?auto_105842 ?auto_105843 ?auto_105844 ?auto_105845 ?auto_105846 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_105873 - BLOCK
      ?auto_105874 - BLOCK
      ?auto_105875 - BLOCK
      ?auto_105876 - BLOCK
      ?auto_105877 - BLOCK
      ?auto_105878 - BLOCK
      ?auto_105879 - BLOCK
      ?auto_105880 - BLOCK
    )
    :vars
    (
      ?auto_105881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105880 ?auto_105881 ) ( ON-TABLE ?auto_105873 ) ( ON ?auto_105874 ?auto_105873 ) ( not ( = ?auto_105873 ?auto_105874 ) ) ( not ( = ?auto_105873 ?auto_105875 ) ) ( not ( = ?auto_105873 ?auto_105876 ) ) ( not ( = ?auto_105873 ?auto_105877 ) ) ( not ( = ?auto_105873 ?auto_105878 ) ) ( not ( = ?auto_105873 ?auto_105879 ) ) ( not ( = ?auto_105873 ?auto_105880 ) ) ( not ( = ?auto_105873 ?auto_105881 ) ) ( not ( = ?auto_105874 ?auto_105875 ) ) ( not ( = ?auto_105874 ?auto_105876 ) ) ( not ( = ?auto_105874 ?auto_105877 ) ) ( not ( = ?auto_105874 ?auto_105878 ) ) ( not ( = ?auto_105874 ?auto_105879 ) ) ( not ( = ?auto_105874 ?auto_105880 ) ) ( not ( = ?auto_105874 ?auto_105881 ) ) ( not ( = ?auto_105875 ?auto_105876 ) ) ( not ( = ?auto_105875 ?auto_105877 ) ) ( not ( = ?auto_105875 ?auto_105878 ) ) ( not ( = ?auto_105875 ?auto_105879 ) ) ( not ( = ?auto_105875 ?auto_105880 ) ) ( not ( = ?auto_105875 ?auto_105881 ) ) ( not ( = ?auto_105876 ?auto_105877 ) ) ( not ( = ?auto_105876 ?auto_105878 ) ) ( not ( = ?auto_105876 ?auto_105879 ) ) ( not ( = ?auto_105876 ?auto_105880 ) ) ( not ( = ?auto_105876 ?auto_105881 ) ) ( not ( = ?auto_105877 ?auto_105878 ) ) ( not ( = ?auto_105877 ?auto_105879 ) ) ( not ( = ?auto_105877 ?auto_105880 ) ) ( not ( = ?auto_105877 ?auto_105881 ) ) ( not ( = ?auto_105878 ?auto_105879 ) ) ( not ( = ?auto_105878 ?auto_105880 ) ) ( not ( = ?auto_105878 ?auto_105881 ) ) ( not ( = ?auto_105879 ?auto_105880 ) ) ( not ( = ?auto_105879 ?auto_105881 ) ) ( not ( = ?auto_105880 ?auto_105881 ) ) ( ON ?auto_105879 ?auto_105880 ) ( ON ?auto_105878 ?auto_105879 ) ( ON ?auto_105877 ?auto_105878 ) ( ON ?auto_105876 ?auto_105877 ) ( CLEAR ?auto_105874 ) ( ON ?auto_105875 ?auto_105876 ) ( CLEAR ?auto_105875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105873 ?auto_105874 ?auto_105875 )
      ( MAKE-8PILE ?auto_105873 ?auto_105874 ?auto_105875 ?auto_105876 ?auto_105877 ?auto_105878 ?auto_105879 ?auto_105880 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_105907 - BLOCK
      ?auto_105908 - BLOCK
      ?auto_105909 - BLOCK
      ?auto_105910 - BLOCK
      ?auto_105911 - BLOCK
      ?auto_105912 - BLOCK
      ?auto_105913 - BLOCK
      ?auto_105914 - BLOCK
    )
    :vars
    (
      ?auto_105915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105914 ?auto_105915 ) ( ON-TABLE ?auto_105907 ) ( not ( = ?auto_105907 ?auto_105908 ) ) ( not ( = ?auto_105907 ?auto_105909 ) ) ( not ( = ?auto_105907 ?auto_105910 ) ) ( not ( = ?auto_105907 ?auto_105911 ) ) ( not ( = ?auto_105907 ?auto_105912 ) ) ( not ( = ?auto_105907 ?auto_105913 ) ) ( not ( = ?auto_105907 ?auto_105914 ) ) ( not ( = ?auto_105907 ?auto_105915 ) ) ( not ( = ?auto_105908 ?auto_105909 ) ) ( not ( = ?auto_105908 ?auto_105910 ) ) ( not ( = ?auto_105908 ?auto_105911 ) ) ( not ( = ?auto_105908 ?auto_105912 ) ) ( not ( = ?auto_105908 ?auto_105913 ) ) ( not ( = ?auto_105908 ?auto_105914 ) ) ( not ( = ?auto_105908 ?auto_105915 ) ) ( not ( = ?auto_105909 ?auto_105910 ) ) ( not ( = ?auto_105909 ?auto_105911 ) ) ( not ( = ?auto_105909 ?auto_105912 ) ) ( not ( = ?auto_105909 ?auto_105913 ) ) ( not ( = ?auto_105909 ?auto_105914 ) ) ( not ( = ?auto_105909 ?auto_105915 ) ) ( not ( = ?auto_105910 ?auto_105911 ) ) ( not ( = ?auto_105910 ?auto_105912 ) ) ( not ( = ?auto_105910 ?auto_105913 ) ) ( not ( = ?auto_105910 ?auto_105914 ) ) ( not ( = ?auto_105910 ?auto_105915 ) ) ( not ( = ?auto_105911 ?auto_105912 ) ) ( not ( = ?auto_105911 ?auto_105913 ) ) ( not ( = ?auto_105911 ?auto_105914 ) ) ( not ( = ?auto_105911 ?auto_105915 ) ) ( not ( = ?auto_105912 ?auto_105913 ) ) ( not ( = ?auto_105912 ?auto_105914 ) ) ( not ( = ?auto_105912 ?auto_105915 ) ) ( not ( = ?auto_105913 ?auto_105914 ) ) ( not ( = ?auto_105913 ?auto_105915 ) ) ( not ( = ?auto_105914 ?auto_105915 ) ) ( ON ?auto_105913 ?auto_105914 ) ( ON ?auto_105912 ?auto_105913 ) ( ON ?auto_105911 ?auto_105912 ) ( ON ?auto_105910 ?auto_105911 ) ( ON ?auto_105909 ?auto_105910 ) ( CLEAR ?auto_105907 ) ( ON ?auto_105908 ?auto_105909 ) ( CLEAR ?auto_105908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105907 ?auto_105908 )
      ( MAKE-8PILE ?auto_105907 ?auto_105908 ?auto_105909 ?auto_105910 ?auto_105911 ?auto_105912 ?auto_105913 ?auto_105914 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_105941 - BLOCK
      ?auto_105942 - BLOCK
      ?auto_105943 - BLOCK
      ?auto_105944 - BLOCK
      ?auto_105945 - BLOCK
      ?auto_105946 - BLOCK
      ?auto_105947 - BLOCK
      ?auto_105948 - BLOCK
    )
    :vars
    (
      ?auto_105949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105948 ?auto_105949 ) ( not ( = ?auto_105941 ?auto_105942 ) ) ( not ( = ?auto_105941 ?auto_105943 ) ) ( not ( = ?auto_105941 ?auto_105944 ) ) ( not ( = ?auto_105941 ?auto_105945 ) ) ( not ( = ?auto_105941 ?auto_105946 ) ) ( not ( = ?auto_105941 ?auto_105947 ) ) ( not ( = ?auto_105941 ?auto_105948 ) ) ( not ( = ?auto_105941 ?auto_105949 ) ) ( not ( = ?auto_105942 ?auto_105943 ) ) ( not ( = ?auto_105942 ?auto_105944 ) ) ( not ( = ?auto_105942 ?auto_105945 ) ) ( not ( = ?auto_105942 ?auto_105946 ) ) ( not ( = ?auto_105942 ?auto_105947 ) ) ( not ( = ?auto_105942 ?auto_105948 ) ) ( not ( = ?auto_105942 ?auto_105949 ) ) ( not ( = ?auto_105943 ?auto_105944 ) ) ( not ( = ?auto_105943 ?auto_105945 ) ) ( not ( = ?auto_105943 ?auto_105946 ) ) ( not ( = ?auto_105943 ?auto_105947 ) ) ( not ( = ?auto_105943 ?auto_105948 ) ) ( not ( = ?auto_105943 ?auto_105949 ) ) ( not ( = ?auto_105944 ?auto_105945 ) ) ( not ( = ?auto_105944 ?auto_105946 ) ) ( not ( = ?auto_105944 ?auto_105947 ) ) ( not ( = ?auto_105944 ?auto_105948 ) ) ( not ( = ?auto_105944 ?auto_105949 ) ) ( not ( = ?auto_105945 ?auto_105946 ) ) ( not ( = ?auto_105945 ?auto_105947 ) ) ( not ( = ?auto_105945 ?auto_105948 ) ) ( not ( = ?auto_105945 ?auto_105949 ) ) ( not ( = ?auto_105946 ?auto_105947 ) ) ( not ( = ?auto_105946 ?auto_105948 ) ) ( not ( = ?auto_105946 ?auto_105949 ) ) ( not ( = ?auto_105947 ?auto_105948 ) ) ( not ( = ?auto_105947 ?auto_105949 ) ) ( not ( = ?auto_105948 ?auto_105949 ) ) ( ON ?auto_105947 ?auto_105948 ) ( ON ?auto_105946 ?auto_105947 ) ( ON ?auto_105945 ?auto_105946 ) ( ON ?auto_105944 ?auto_105945 ) ( ON ?auto_105943 ?auto_105944 ) ( ON ?auto_105942 ?auto_105943 ) ( ON ?auto_105941 ?auto_105942 ) ( CLEAR ?auto_105941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105941 )
      ( MAKE-8PILE ?auto_105941 ?auto_105942 ?auto_105943 ?auto_105944 ?auto_105945 ?auto_105946 ?auto_105947 ?auto_105948 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_105976 - BLOCK
      ?auto_105977 - BLOCK
      ?auto_105978 - BLOCK
      ?auto_105979 - BLOCK
      ?auto_105980 - BLOCK
      ?auto_105981 - BLOCK
      ?auto_105982 - BLOCK
      ?auto_105983 - BLOCK
      ?auto_105984 - BLOCK
    )
    :vars
    (
      ?auto_105985 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_105983 ) ( ON ?auto_105984 ?auto_105985 ) ( CLEAR ?auto_105984 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105976 ) ( ON ?auto_105977 ?auto_105976 ) ( ON ?auto_105978 ?auto_105977 ) ( ON ?auto_105979 ?auto_105978 ) ( ON ?auto_105980 ?auto_105979 ) ( ON ?auto_105981 ?auto_105980 ) ( ON ?auto_105982 ?auto_105981 ) ( ON ?auto_105983 ?auto_105982 ) ( not ( = ?auto_105976 ?auto_105977 ) ) ( not ( = ?auto_105976 ?auto_105978 ) ) ( not ( = ?auto_105976 ?auto_105979 ) ) ( not ( = ?auto_105976 ?auto_105980 ) ) ( not ( = ?auto_105976 ?auto_105981 ) ) ( not ( = ?auto_105976 ?auto_105982 ) ) ( not ( = ?auto_105976 ?auto_105983 ) ) ( not ( = ?auto_105976 ?auto_105984 ) ) ( not ( = ?auto_105976 ?auto_105985 ) ) ( not ( = ?auto_105977 ?auto_105978 ) ) ( not ( = ?auto_105977 ?auto_105979 ) ) ( not ( = ?auto_105977 ?auto_105980 ) ) ( not ( = ?auto_105977 ?auto_105981 ) ) ( not ( = ?auto_105977 ?auto_105982 ) ) ( not ( = ?auto_105977 ?auto_105983 ) ) ( not ( = ?auto_105977 ?auto_105984 ) ) ( not ( = ?auto_105977 ?auto_105985 ) ) ( not ( = ?auto_105978 ?auto_105979 ) ) ( not ( = ?auto_105978 ?auto_105980 ) ) ( not ( = ?auto_105978 ?auto_105981 ) ) ( not ( = ?auto_105978 ?auto_105982 ) ) ( not ( = ?auto_105978 ?auto_105983 ) ) ( not ( = ?auto_105978 ?auto_105984 ) ) ( not ( = ?auto_105978 ?auto_105985 ) ) ( not ( = ?auto_105979 ?auto_105980 ) ) ( not ( = ?auto_105979 ?auto_105981 ) ) ( not ( = ?auto_105979 ?auto_105982 ) ) ( not ( = ?auto_105979 ?auto_105983 ) ) ( not ( = ?auto_105979 ?auto_105984 ) ) ( not ( = ?auto_105979 ?auto_105985 ) ) ( not ( = ?auto_105980 ?auto_105981 ) ) ( not ( = ?auto_105980 ?auto_105982 ) ) ( not ( = ?auto_105980 ?auto_105983 ) ) ( not ( = ?auto_105980 ?auto_105984 ) ) ( not ( = ?auto_105980 ?auto_105985 ) ) ( not ( = ?auto_105981 ?auto_105982 ) ) ( not ( = ?auto_105981 ?auto_105983 ) ) ( not ( = ?auto_105981 ?auto_105984 ) ) ( not ( = ?auto_105981 ?auto_105985 ) ) ( not ( = ?auto_105982 ?auto_105983 ) ) ( not ( = ?auto_105982 ?auto_105984 ) ) ( not ( = ?auto_105982 ?auto_105985 ) ) ( not ( = ?auto_105983 ?auto_105984 ) ) ( not ( = ?auto_105983 ?auto_105985 ) ) ( not ( = ?auto_105984 ?auto_105985 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105984 ?auto_105985 )
      ( !STACK ?auto_105984 ?auto_105983 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_106014 - BLOCK
      ?auto_106015 - BLOCK
      ?auto_106016 - BLOCK
      ?auto_106017 - BLOCK
      ?auto_106018 - BLOCK
      ?auto_106019 - BLOCK
      ?auto_106020 - BLOCK
      ?auto_106021 - BLOCK
      ?auto_106022 - BLOCK
    )
    :vars
    (
      ?auto_106023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106022 ?auto_106023 ) ( ON-TABLE ?auto_106014 ) ( ON ?auto_106015 ?auto_106014 ) ( ON ?auto_106016 ?auto_106015 ) ( ON ?auto_106017 ?auto_106016 ) ( ON ?auto_106018 ?auto_106017 ) ( ON ?auto_106019 ?auto_106018 ) ( ON ?auto_106020 ?auto_106019 ) ( not ( = ?auto_106014 ?auto_106015 ) ) ( not ( = ?auto_106014 ?auto_106016 ) ) ( not ( = ?auto_106014 ?auto_106017 ) ) ( not ( = ?auto_106014 ?auto_106018 ) ) ( not ( = ?auto_106014 ?auto_106019 ) ) ( not ( = ?auto_106014 ?auto_106020 ) ) ( not ( = ?auto_106014 ?auto_106021 ) ) ( not ( = ?auto_106014 ?auto_106022 ) ) ( not ( = ?auto_106014 ?auto_106023 ) ) ( not ( = ?auto_106015 ?auto_106016 ) ) ( not ( = ?auto_106015 ?auto_106017 ) ) ( not ( = ?auto_106015 ?auto_106018 ) ) ( not ( = ?auto_106015 ?auto_106019 ) ) ( not ( = ?auto_106015 ?auto_106020 ) ) ( not ( = ?auto_106015 ?auto_106021 ) ) ( not ( = ?auto_106015 ?auto_106022 ) ) ( not ( = ?auto_106015 ?auto_106023 ) ) ( not ( = ?auto_106016 ?auto_106017 ) ) ( not ( = ?auto_106016 ?auto_106018 ) ) ( not ( = ?auto_106016 ?auto_106019 ) ) ( not ( = ?auto_106016 ?auto_106020 ) ) ( not ( = ?auto_106016 ?auto_106021 ) ) ( not ( = ?auto_106016 ?auto_106022 ) ) ( not ( = ?auto_106016 ?auto_106023 ) ) ( not ( = ?auto_106017 ?auto_106018 ) ) ( not ( = ?auto_106017 ?auto_106019 ) ) ( not ( = ?auto_106017 ?auto_106020 ) ) ( not ( = ?auto_106017 ?auto_106021 ) ) ( not ( = ?auto_106017 ?auto_106022 ) ) ( not ( = ?auto_106017 ?auto_106023 ) ) ( not ( = ?auto_106018 ?auto_106019 ) ) ( not ( = ?auto_106018 ?auto_106020 ) ) ( not ( = ?auto_106018 ?auto_106021 ) ) ( not ( = ?auto_106018 ?auto_106022 ) ) ( not ( = ?auto_106018 ?auto_106023 ) ) ( not ( = ?auto_106019 ?auto_106020 ) ) ( not ( = ?auto_106019 ?auto_106021 ) ) ( not ( = ?auto_106019 ?auto_106022 ) ) ( not ( = ?auto_106019 ?auto_106023 ) ) ( not ( = ?auto_106020 ?auto_106021 ) ) ( not ( = ?auto_106020 ?auto_106022 ) ) ( not ( = ?auto_106020 ?auto_106023 ) ) ( not ( = ?auto_106021 ?auto_106022 ) ) ( not ( = ?auto_106021 ?auto_106023 ) ) ( not ( = ?auto_106022 ?auto_106023 ) ) ( CLEAR ?auto_106020 ) ( ON ?auto_106021 ?auto_106022 ) ( CLEAR ?auto_106021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_106014 ?auto_106015 ?auto_106016 ?auto_106017 ?auto_106018 ?auto_106019 ?auto_106020 ?auto_106021 )
      ( MAKE-9PILE ?auto_106014 ?auto_106015 ?auto_106016 ?auto_106017 ?auto_106018 ?auto_106019 ?auto_106020 ?auto_106021 ?auto_106022 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_106052 - BLOCK
      ?auto_106053 - BLOCK
      ?auto_106054 - BLOCK
      ?auto_106055 - BLOCK
      ?auto_106056 - BLOCK
      ?auto_106057 - BLOCK
      ?auto_106058 - BLOCK
      ?auto_106059 - BLOCK
      ?auto_106060 - BLOCK
    )
    :vars
    (
      ?auto_106061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106060 ?auto_106061 ) ( ON-TABLE ?auto_106052 ) ( ON ?auto_106053 ?auto_106052 ) ( ON ?auto_106054 ?auto_106053 ) ( ON ?auto_106055 ?auto_106054 ) ( ON ?auto_106056 ?auto_106055 ) ( ON ?auto_106057 ?auto_106056 ) ( not ( = ?auto_106052 ?auto_106053 ) ) ( not ( = ?auto_106052 ?auto_106054 ) ) ( not ( = ?auto_106052 ?auto_106055 ) ) ( not ( = ?auto_106052 ?auto_106056 ) ) ( not ( = ?auto_106052 ?auto_106057 ) ) ( not ( = ?auto_106052 ?auto_106058 ) ) ( not ( = ?auto_106052 ?auto_106059 ) ) ( not ( = ?auto_106052 ?auto_106060 ) ) ( not ( = ?auto_106052 ?auto_106061 ) ) ( not ( = ?auto_106053 ?auto_106054 ) ) ( not ( = ?auto_106053 ?auto_106055 ) ) ( not ( = ?auto_106053 ?auto_106056 ) ) ( not ( = ?auto_106053 ?auto_106057 ) ) ( not ( = ?auto_106053 ?auto_106058 ) ) ( not ( = ?auto_106053 ?auto_106059 ) ) ( not ( = ?auto_106053 ?auto_106060 ) ) ( not ( = ?auto_106053 ?auto_106061 ) ) ( not ( = ?auto_106054 ?auto_106055 ) ) ( not ( = ?auto_106054 ?auto_106056 ) ) ( not ( = ?auto_106054 ?auto_106057 ) ) ( not ( = ?auto_106054 ?auto_106058 ) ) ( not ( = ?auto_106054 ?auto_106059 ) ) ( not ( = ?auto_106054 ?auto_106060 ) ) ( not ( = ?auto_106054 ?auto_106061 ) ) ( not ( = ?auto_106055 ?auto_106056 ) ) ( not ( = ?auto_106055 ?auto_106057 ) ) ( not ( = ?auto_106055 ?auto_106058 ) ) ( not ( = ?auto_106055 ?auto_106059 ) ) ( not ( = ?auto_106055 ?auto_106060 ) ) ( not ( = ?auto_106055 ?auto_106061 ) ) ( not ( = ?auto_106056 ?auto_106057 ) ) ( not ( = ?auto_106056 ?auto_106058 ) ) ( not ( = ?auto_106056 ?auto_106059 ) ) ( not ( = ?auto_106056 ?auto_106060 ) ) ( not ( = ?auto_106056 ?auto_106061 ) ) ( not ( = ?auto_106057 ?auto_106058 ) ) ( not ( = ?auto_106057 ?auto_106059 ) ) ( not ( = ?auto_106057 ?auto_106060 ) ) ( not ( = ?auto_106057 ?auto_106061 ) ) ( not ( = ?auto_106058 ?auto_106059 ) ) ( not ( = ?auto_106058 ?auto_106060 ) ) ( not ( = ?auto_106058 ?auto_106061 ) ) ( not ( = ?auto_106059 ?auto_106060 ) ) ( not ( = ?auto_106059 ?auto_106061 ) ) ( not ( = ?auto_106060 ?auto_106061 ) ) ( ON ?auto_106059 ?auto_106060 ) ( CLEAR ?auto_106057 ) ( ON ?auto_106058 ?auto_106059 ) ( CLEAR ?auto_106058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106052 ?auto_106053 ?auto_106054 ?auto_106055 ?auto_106056 ?auto_106057 ?auto_106058 )
      ( MAKE-9PILE ?auto_106052 ?auto_106053 ?auto_106054 ?auto_106055 ?auto_106056 ?auto_106057 ?auto_106058 ?auto_106059 ?auto_106060 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_106090 - BLOCK
      ?auto_106091 - BLOCK
      ?auto_106092 - BLOCK
      ?auto_106093 - BLOCK
      ?auto_106094 - BLOCK
      ?auto_106095 - BLOCK
      ?auto_106096 - BLOCK
      ?auto_106097 - BLOCK
      ?auto_106098 - BLOCK
    )
    :vars
    (
      ?auto_106099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106098 ?auto_106099 ) ( ON-TABLE ?auto_106090 ) ( ON ?auto_106091 ?auto_106090 ) ( ON ?auto_106092 ?auto_106091 ) ( ON ?auto_106093 ?auto_106092 ) ( ON ?auto_106094 ?auto_106093 ) ( not ( = ?auto_106090 ?auto_106091 ) ) ( not ( = ?auto_106090 ?auto_106092 ) ) ( not ( = ?auto_106090 ?auto_106093 ) ) ( not ( = ?auto_106090 ?auto_106094 ) ) ( not ( = ?auto_106090 ?auto_106095 ) ) ( not ( = ?auto_106090 ?auto_106096 ) ) ( not ( = ?auto_106090 ?auto_106097 ) ) ( not ( = ?auto_106090 ?auto_106098 ) ) ( not ( = ?auto_106090 ?auto_106099 ) ) ( not ( = ?auto_106091 ?auto_106092 ) ) ( not ( = ?auto_106091 ?auto_106093 ) ) ( not ( = ?auto_106091 ?auto_106094 ) ) ( not ( = ?auto_106091 ?auto_106095 ) ) ( not ( = ?auto_106091 ?auto_106096 ) ) ( not ( = ?auto_106091 ?auto_106097 ) ) ( not ( = ?auto_106091 ?auto_106098 ) ) ( not ( = ?auto_106091 ?auto_106099 ) ) ( not ( = ?auto_106092 ?auto_106093 ) ) ( not ( = ?auto_106092 ?auto_106094 ) ) ( not ( = ?auto_106092 ?auto_106095 ) ) ( not ( = ?auto_106092 ?auto_106096 ) ) ( not ( = ?auto_106092 ?auto_106097 ) ) ( not ( = ?auto_106092 ?auto_106098 ) ) ( not ( = ?auto_106092 ?auto_106099 ) ) ( not ( = ?auto_106093 ?auto_106094 ) ) ( not ( = ?auto_106093 ?auto_106095 ) ) ( not ( = ?auto_106093 ?auto_106096 ) ) ( not ( = ?auto_106093 ?auto_106097 ) ) ( not ( = ?auto_106093 ?auto_106098 ) ) ( not ( = ?auto_106093 ?auto_106099 ) ) ( not ( = ?auto_106094 ?auto_106095 ) ) ( not ( = ?auto_106094 ?auto_106096 ) ) ( not ( = ?auto_106094 ?auto_106097 ) ) ( not ( = ?auto_106094 ?auto_106098 ) ) ( not ( = ?auto_106094 ?auto_106099 ) ) ( not ( = ?auto_106095 ?auto_106096 ) ) ( not ( = ?auto_106095 ?auto_106097 ) ) ( not ( = ?auto_106095 ?auto_106098 ) ) ( not ( = ?auto_106095 ?auto_106099 ) ) ( not ( = ?auto_106096 ?auto_106097 ) ) ( not ( = ?auto_106096 ?auto_106098 ) ) ( not ( = ?auto_106096 ?auto_106099 ) ) ( not ( = ?auto_106097 ?auto_106098 ) ) ( not ( = ?auto_106097 ?auto_106099 ) ) ( not ( = ?auto_106098 ?auto_106099 ) ) ( ON ?auto_106097 ?auto_106098 ) ( ON ?auto_106096 ?auto_106097 ) ( CLEAR ?auto_106094 ) ( ON ?auto_106095 ?auto_106096 ) ( CLEAR ?auto_106095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106090 ?auto_106091 ?auto_106092 ?auto_106093 ?auto_106094 ?auto_106095 )
      ( MAKE-9PILE ?auto_106090 ?auto_106091 ?auto_106092 ?auto_106093 ?auto_106094 ?auto_106095 ?auto_106096 ?auto_106097 ?auto_106098 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_106128 - BLOCK
      ?auto_106129 - BLOCK
      ?auto_106130 - BLOCK
      ?auto_106131 - BLOCK
      ?auto_106132 - BLOCK
      ?auto_106133 - BLOCK
      ?auto_106134 - BLOCK
      ?auto_106135 - BLOCK
      ?auto_106136 - BLOCK
    )
    :vars
    (
      ?auto_106137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106136 ?auto_106137 ) ( ON-TABLE ?auto_106128 ) ( ON ?auto_106129 ?auto_106128 ) ( ON ?auto_106130 ?auto_106129 ) ( ON ?auto_106131 ?auto_106130 ) ( not ( = ?auto_106128 ?auto_106129 ) ) ( not ( = ?auto_106128 ?auto_106130 ) ) ( not ( = ?auto_106128 ?auto_106131 ) ) ( not ( = ?auto_106128 ?auto_106132 ) ) ( not ( = ?auto_106128 ?auto_106133 ) ) ( not ( = ?auto_106128 ?auto_106134 ) ) ( not ( = ?auto_106128 ?auto_106135 ) ) ( not ( = ?auto_106128 ?auto_106136 ) ) ( not ( = ?auto_106128 ?auto_106137 ) ) ( not ( = ?auto_106129 ?auto_106130 ) ) ( not ( = ?auto_106129 ?auto_106131 ) ) ( not ( = ?auto_106129 ?auto_106132 ) ) ( not ( = ?auto_106129 ?auto_106133 ) ) ( not ( = ?auto_106129 ?auto_106134 ) ) ( not ( = ?auto_106129 ?auto_106135 ) ) ( not ( = ?auto_106129 ?auto_106136 ) ) ( not ( = ?auto_106129 ?auto_106137 ) ) ( not ( = ?auto_106130 ?auto_106131 ) ) ( not ( = ?auto_106130 ?auto_106132 ) ) ( not ( = ?auto_106130 ?auto_106133 ) ) ( not ( = ?auto_106130 ?auto_106134 ) ) ( not ( = ?auto_106130 ?auto_106135 ) ) ( not ( = ?auto_106130 ?auto_106136 ) ) ( not ( = ?auto_106130 ?auto_106137 ) ) ( not ( = ?auto_106131 ?auto_106132 ) ) ( not ( = ?auto_106131 ?auto_106133 ) ) ( not ( = ?auto_106131 ?auto_106134 ) ) ( not ( = ?auto_106131 ?auto_106135 ) ) ( not ( = ?auto_106131 ?auto_106136 ) ) ( not ( = ?auto_106131 ?auto_106137 ) ) ( not ( = ?auto_106132 ?auto_106133 ) ) ( not ( = ?auto_106132 ?auto_106134 ) ) ( not ( = ?auto_106132 ?auto_106135 ) ) ( not ( = ?auto_106132 ?auto_106136 ) ) ( not ( = ?auto_106132 ?auto_106137 ) ) ( not ( = ?auto_106133 ?auto_106134 ) ) ( not ( = ?auto_106133 ?auto_106135 ) ) ( not ( = ?auto_106133 ?auto_106136 ) ) ( not ( = ?auto_106133 ?auto_106137 ) ) ( not ( = ?auto_106134 ?auto_106135 ) ) ( not ( = ?auto_106134 ?auto_106136 ) ) ( not ( = ?auto_106134 ?auto_106137 ) ) ( not ( = ?auto_106135 ?auto_106136 ) ) ( not ( = ?auto_106135 ?auto_106137 ) ) ( not ( = ?auto_106136 ?auto_106137 ) ) ( ON ?auto_106135 ?auto_106136 ) ( ON ?auto_106134 ?auto_106135 ) ( ON ?auto_106133 ?auto_106134 ) ( CLEAR ?auto_106131 ) ( ON ?auto_106132 ?auto_106133 ) ( CLEAR ?auto_106132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106128 ?auto_106129 ?auto_106130 ?auto_106131 ?auto_106132 )
      ( MAKE-9PILE ?auto_106128 ?auto_106129 ?auto_106130 ?auto_106131 ?auto_106132 ?auto_106133 ?auto_106134 ?auto_106135 ?auto_106136 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_106166 - BLOCK
      ?auto_106167 - BLOCK
      ?auto_106168 - BLOCK
      ?auto_106169 - BLOCK
      ?auto_106170 - BLOCK
      ?auto_106171 - BLOCK
      ?auto_106172 - BLOCK
      ?auto_106173 - BLOCK
      ?auto_106174 - BLOCK
    )
    :vars
    (
      ?auto_106175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106174 ?auto_106175 ) ( ON-TABLE ?auto_106166 ) ( ON ?auto_106167 ?auto_106166 ) ( ON ?auto_106168 ?auto_106167 ) ( not ( = ?auto_106166 ?auto_106167 ) ) ( not ( = ?auto_106166 ?auto_106168 ) ) ( not ( = ?auto_106166 ?auto_106169 ) ) ( not ( = ?auto_106166 ?auto_106170 ) ) ( not ( = ?auto_106166 ?auto_106171 ) ) ( not ( = ?auto_106166 ?auto_106172 ) ) ( not ( = ?auto_106166 ?auto_106173 ) ) ( not ( = ?auto_106166 ?auto_106174 ) ) ( not ( = ?auto_106166 ?auto_106175 ) ) ( not ( = ?auto_106167 ?auto_106168 ) ) ( not ( = ?auto_106167 ?auto_106169 ) ) ( not ( = ?auto_106167 ?auto_106170 ) ) ( not ( = ?auto_106167 ?auto_106171 ) ) ( not ( = ?auto_106167 ?auto_106172 ) ) ( not ( = ?auto_106167 ?auto_106173 ) ) ( not ( = ?auto_106167 ?auto_106174 ) ) ( not ( = ?auto_106167 ?auto_106175 ) ) ( not ( = ?auto_106168 ?auto_106169 ) ) ( not ( = ?auto_106168 ?auto_106170 ) ) ( not ( = ?auto_106168 ?auto_106171 ) ) ( not ( = ?auto_106168 ?auto_106172 ) ) ( not ( = ?auto_106168 ?auto_106173 ) ) ( not ( = ?auto_106168 ?auto_106174 ) ) ( not ( = ?auto_106168 ?auto_106175 ) ) ( not ( = ?auto_106169 ?auto_106170 ) ) ( not ( = ?auto_106169 ?auto_106171 ) ) ( not ( = ?auto_106169 ?auto_106172 ) ) ( not ( = ?auto_106169 ?auto_106173 ) ) ( not ( = ?auto_106169 ?auto_106174 ) ) ( not ( = ?auto_106169 ?auto_106175 ) ) ( not ( = ?auto_106170 ?auto_106171 ) ) ( not ( = ?auto_106170 ?auto_106172 ) ) ( not ( = ?auto_106170 ?auto_106173 ) ) ( not ( = ?auto_106170 ?auto_106174 ) ) ( not ( = ?auto_106170 ?auto_106175 ) ) ( not ( = ?auto_106171 ?auto_106172 ) ) ( not ( = ?auto_106171 ?auto_106173 ) ) ( not ( = ?auto_106171 ?auto_106174 ) ) ( not ( = ?auto_106171 ?auto_106175 ) ) ( not ( = ?auto_106172 ?auto_106173 ) ) ( not ( = ?auto_106172 ?auto_106174 ) ) ( not ( = ?auto_106172 ?auto_106175 ) ) ( not ( = ?auto_106173 ?auto_106174 ) ) ( not ( = ?auto_106173 ?auto_106175 ) ) ( not ( = ?auto_106174 ?auto_106175 ) ) ( ON ?auto_106173 ?auto_106174 ) ( ON ?auto_106172 ?auto_106173 ) ( ON ?auto_106171 ?auto_106172 ) ( ON ?auto_106170 ?auto_106171 ) ( CLEAR ?auto_106168 ) ( ON ?auto_106169 ?auto_106170 ) ( CLEAR ?auto_106169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106166 ?auto_106167 ?auto_106168 ?auto_106169 )
      ( MAKE-9PILE ?auto_106166 ?auto_106167 ?auto_106168 ?auto_106169 ?auto_106170 ?auto_106171 ?auto_106172 ?auto_106173 ?auto_106174 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_106204 - BLOCK
      ?auto_106205 - BLOCK
      ?auto_106206 - BLOCK
      ?auto_106207 - BLOCK
      ?auto_106208 - BLOCK
      ?auto_106209 - BLOCK
      ?auto_106210 - BLOCK
      ?auto_106211 - BLOCK
      ?auto_106212 - BLOCK
    )
    :vars
    (
      ?auto_106213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106212 ?auto_106213 ) ( ON-TABLE ?auto_106204 ) ( ON ?auto_106205 ?auto_106204 ) ( not ( = ?auto_106204 ?auto_106205 ) ) ( not ( = ?auto_106204 ?auto_106206 ) ) ( not ( = ?auto_106204 ?auto_106207 ) ) ( not ( = ?auto_106204 ?auto_106208 ) ) ( not ( = ?auto_106204 ?auto_106209 ) ) ( not ( = ?auto_106204 ?auto_106210 ) ) ( not ( = ?auto_106204 ?auto_106211 ) ) ( not ( = ?auto_106204 ?auto_106212 ) ) ( not ( = ?auto_106204 ?auto_106213 ) ) ( not ( = ?auto_106205 ?auto_106206 ) ) ( not ( = ?auto_106205 ?auto_106207 ) ) ( not ( = ?auto_106205 ?auto_106208 ) ) ( not ( = ?auto_106205 ?auto_106209 ) ) ( not ( = ?auto_106205 ?auto_106210 ) ) ( not ( = ?auto_106205 ?auto_106211 ) ) ( not ( = ?auto_106205 ?auto_106212 ) ) ( not ( = ?auto_106205 ?auto_106213 ) ) ( not ( = ?auto_106206 ?auto_106207 ) ) ( not ( = ?auto_106206 ?auto_106208 ) ) ( not ( = ?auto_106206 ?auto_106209 ) ) ( not ( = ?auto_106206 ?auto_106210 ) ) ( not ( = ?auto_106206 ?auto_106211 ) ) ( not ( = ?auto_106206 ?auto_106212 ) ) ( not ( = ?auto_106206 ?auto_106213 ) ) ( not ( = ?auto_106207 ?auto_106208 ) ) ( not ( = ?auto_106207 ?auto_106209 ) ) ( not ( = ?auto_106207 ?auto_106210 ) ) ( not ( = ?auto_106207 ?auto_106211 ) ) ( not ( = ?auto_106207 ?auto_106212 ) ) ( not ( = ?auto_106207 ?auto_106213 ) ) ( not ( = ?auto_106208 ?auto_106209 ) ) ( not ( = ?auto_106208 ?auto_106210 ) ) ( not ( = ?auto_106208 ?auto_106211 ) ) ( not ( = ?auto_106208 ?auto_106212 ) ) ( not ( = ?auto_106208 ?auto_106213 ) ) ( not ( = ?auto_106209 ?auto_106210 ) ) ( not ( = ?auto_106209 ?auto_106211 ) ) ( not ( = ?auto_106209 ?auto_106212 ) ) ( not ( = ?auto_106209 ?auto_106213 ) ) ( not ( = ?auto_106210 ?auto_106211 ) ) ( not ( = ?auto_106210 ?auto_106212 ) ) ( not ( = ?auto_106210 ?auto_106213 ) ) ( not ( = ?auto_106211 ?auto_106212 ) ) ( not ( = ?auto_106211 ?auto_106213 ) ) ( not ( = ?auto_106212 ?auto_106213 ) ) ( ON ?auto_106211 ?auto_106212 ) ( ON ?auto_106210 ?auto_106211 ) ( ON ?auto_106209 ?auto_106210 ) ( ON ?auto_106208 ?auto_106209 ) ( ON ?auto_106207 ?auto_106208 ) ( CLEAR ?auto_106205 ) ( ON ?auto_106206 ?auto_106207 ) ( CLEAR ?auto_106206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106204 ?auto_106205 ?auto_106206 )
      ( MAKE-9PILE ?auto_106204 ?auto_106205 ?auto_106206 ?auto_106207 ?auto_106208 ?auto_106209 ?auto_106210 ?auto_106211 ?auto_106212 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_106242 - BLOCK
      ?auto_106243 - BLOCK
      ?auto_106244 - BLOCK
      ?auto_106245 - BLOCK
      ?auto_106246 - BLOCK
      ?auto_106247 - BLOCK
      ?auto_106248 - BLOCK
      ?auto_106249 - BLOCK
      ?auto_106250 - BLOCK
    )
    :vars
    (
      ?auto_106251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106250 ?auto_106251 ) ( ON-TABLE ?auto_106242 ) ( not ( = ?auto_106242 ?auto_106243 ) ) ( not ( = ?auto_106242 ?auto_106244 ) ) ( not ( = ?auto_106242 ?auto_106245 ) ) ( not ( = ?auto_106242 ?auto_106246 ) ) ( not ( = ?auto_106242 ?auto_106247 ) ) ( not ( = ?auto_106242 ?auto_106248 ) ) ( not ( = ?auto_106242 ?auto_106249 ) ) ( not ( = ?auto_106242 ?auto_106250 ) ) ( not ( = ?auto_106242 ?auto_106251 ) ) ( not ( = ?auto_106243 ?auto_106244 ) ) ( not ( = ?auto_106243 ?auto_106245 ) ) ( not ( = ?auto_106243 ?auto_106246 ) ) ( not ( = ?auto_106243 ?auto_106247 ) ) ( not ( = ?auto_106243 ?auto_106248 ) ) ( not ( = ?auto_106243 ?auto_106249 ) ) ( not ( = ?auto_106243 ?auto_106250 ) ) ( not ( = ?auto_106243 ?auto_106251 ) ) ( not ( = ?auto_106244 ?auto_106245 ) ) ( not ( = ?auto_106244 ?auto_106246 ) ) ( not ( = ?auto_106244 ?auto_106247 ) ) ( not ( = ?auto_106244 ?auto_106248 ) ) ( not ( = ?auto_106244 ?auto_106249 ) ) ( not ( = ?auto_106244 ?auto_106250 ) ) ( not ( = ?auto_106244 ?auto_106251 ) ) ( not ( = ?auto_106245 ?auto_106246 ) ) ( not ( = ?auto_106245 ?auto_106247 ) ) ( not ( = ?auto_106245 ?auto_106248 ) ) ( not ( = ?auto_106245 ?auto_106249 ) ) ( not ( = ?auto_106245 ?auto_106250 ) ) ( not ( = ?auto_106245 ?auto_106251 ) ) ( not ( = ?auto_106246 ?auto_106247 ) ) ( not ( = ?auto_106246 ?auto_106248 ) ) ( not ( = ?auto_106246 ?auto_106249 ) ) ( not ( = ?auto_106246 ?auto_106250 ) ) ( not ( = ?auto_106246 ?auto_106251 ) ) ( not ( = ?auto_106247 ?auto_106248 ) ) ( not ( = ?auto_106247 ?auto_106249 ) ) ( not ( = ?auto_106247 ?auto_106250 ) ) ( not ( = ?auto_106247 ?auto_106251 ) ) ( not ( = ?auto_106248 ?auto_106249 ) ) ( not ( = ?auto_106248 ?auto_106250 ) ) ( not ( = ?auto_106248 ?auto_106251 ) ) ( not ( = ?auto_106249 ?auto_106250 ) ) ( not ( = ?auto_106249 ?auto_106251 ) ) ( not ( = ?auto_106250 ?auto_106251 ) ) ( ON ?auto_106249 ?auto_106250 ) ( ON ?auto_106248 ?auto_106249 ) ( ON ?auto_106247 ?auto_106248 ) ( ON ?auto_106246 ?auto_106247 ) ( ON ?auto_106245 ?auto_106246 ) ( ON ?auto_106244 ?auto_106245 ) ( CLEAR ?auto_106242 ) ( ON ?auto_106243 ?auto_106244 ) ( CLEAR ?auto_106243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106242 ?auto_106243 )
      ( MAKE-9PILE ?auto_106242 ?auto_106243 ?auto_106244 ?auto_106245 ?auto_106246 ?auto_106247 ?auto_106248 ?auto_106249 ?auto_106250 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_106280 - BLOCK
      ?auto_106281 - BLOCK
      ?auto_106282 - BLOCK
      ?auto_106283 - BLOCK
      ?auto_106284 - BLOCK
      ?auto_106285 - BLOCK
      ?auto_106286 - BLOCK
      ?auto_106287 - BLOCK
      ?auto_106288 - BLOCK
    )
    :vars
    (
      ?auto_106289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106288 ?auto_106289 ) ( not ( = ?auto_106280 ?auto_106281 ) ) ( not ( = ?auto_106280 ?auto_106282 ) ) ( not ( = ?auto_106280 ?auto_106283 ) ) ( not ( = ?auto_106280 ?auto_106284 ) ) ( not ( = ?auto_106280 ?auto_106285 ) ) ( not ( = ?auto_106280 ?auto_106286 ) ) ( not ( = ?auto_106280 ?auto_106287 ) ) ( not ( = ?auto_106280 ?auto_106288 ) ) ( not ( = ?auto_106280 ?auto_106289 ) ) ( not ( = ?auto_106281 ?auto_106282 ) ) ( not ( = ?auto_106281 ?auto_106283 ) ) ( not ( = ?auto_106281 ?auto_106284 ) ) ( not ( = ?auto_106281 ?auto_106285 ) ) ( not ( = ?auto_106281 ?auto_106286 ) ) ( not ( = ?auto_106281 ?auto_106287 ) ) ( not ( = ?auto_106281 ?auto_106288 ) ) ( not ( = ?auto_106281 ?auto_106289 ) ) ( not ( = ?auto_106282 ?auto_106283 ) ) ( not ( = ?auto_106282 ?auto_106284 ) ) ( not ( = ?auto_106282 ?auto_106285 ) ) ( not ( = ?auto_106282 ?auto_106286 ) ) ( not ( = ?auto_106282 ?auto_106287 ) ) ( not ( = ?auto_106282 ?auto_106288 ) ) ( not ( = ?auto_106282 ?auto_106289 ) ) ( not ( = ?auto_106283 ?auto_106284 ) ) ( not ( = ?auto_106283 ?auto_106285 ) ) ( not ( = ?auto_106283 ?auto_106286 ) ) ( not ( = ?auto_106283 ?auto_106287 ) ) ( not ( = ?auto_106283 ?auto_106288 ) ) ( not ( = ?auto_106283 ?auto_106289 ) ) ( not ( = ?auto_106284 ?auto_106285 ) ) ( not ( = ?auto_106284 ?auto_106286 ) ) ( not ( = ?auto_106284 ?auto_106287 ) ) ( not ( = ?auto_106284 ?auto_106288 ) ) ( not ( = ?auto_106284 ?auto_106289 ) ) ( not ( = ?auto_106285 ?auto_106286 ) ) ( not ( = ?auto_106285 ?auto_106287 ) ) ( not ( = ?auto_106285 ?auto_106288 ) ) ( not ( = ?auto_106285 ?auto_106289 ) ) ( not ( = ?auto_106286 ?auto_106287 ) ) ( not ( = ?auto_106286 ?auto_106288 ) ) ( not ( = ?auto_106286 ?auto_106289 ) ) ( not ( = ?auto_106287 ?auto_106288 ) ) ( not ( = ?auto_106287 ?auto_106289 ) ) ( not ( = ?auto_106288 ?auto_106289 ) ) ( ON ?auto_106287 ?auto_106288 ) ( ON ?auto_106286 ?auto_106287 ) ( ON ?auto_106285 ?auto_106286 ) ( ON ?auto_106284 ?auto_106285 ) ( ON ?auto_106283 ?auto_106284 ) ( ON ?auto_106282 ?auto_106283 ) ( ON ?auto_106281 ?auto_106282 ) ( ON ?auto_106280 ?auto_106281 ) ( CLEAR ?auto_106280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106280 )
      ( MAKE-9PILE ?auto_106280 ?auto_106281 ?auto_106282 ?auto_106283 ?auto_106284 ?auto_106285 ?auto_106286 ?auto_106287 ?auto_106288 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106319 - BLOCK
      ?auto_106320 - BLOCK
      ?auto_106321 - BLOCK
      ?auto_106322 - BLOCK
      ?auto_106323 - BLOCK
      ?auto_106324 - BLOCK
      ?auto_106325 - BLOCK
      ?auto_106326 - BLOCK
      ?auto_106327 - BLOCK
      ?auto_106328 - BLOCK
    )
    :vars
    (
      ?auto_106329 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_106327 ) ( ON ?auto_106328 ?auto_106329 ) ( CLEAR ?auto_106328 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106319 ) ( ON ?auto_106320 ?auto_106319 ) ( ON ?auto_106321 ?auto_106320 ) ( ON ?auto_106322 ?auto_106321 ) ( ON ?auto_106323 ?auto_106322 ) ( ON ?auto_106324 ?auto_106323 ) ( ON ?auto_106325 ?auto_106324 ) ( ON ?auto_106326 ?auto_106325 ) ( ON ?auto_106327 ?auto_106326 ) ( not ( = ?auto_106319 ?auto_106320 ) ) ( not ( = ?auto_106319 ?auto_106321 ) ) ( not ( = ?auto_106319 ?auto_106322 ) ) ( not ( = ?auto_106319 ?auto_106323 ) ) ( not ( = ?auto_106319 ?auto_106324 ) ) ( not ( = ?auto_106319 ?auto_106325 ) ) ( not ( = ?auto_106319 ?auto_106326 ) ) ( not ( = ?auto_106319 ?auto_106327 ) ) ( not ( = ?auto_106319 ?auto_106328 ) ) ( not ( = ?auto_106319 ?auto_106329 ) ) ( not ( = ?auto_106320 ?auto_106321 ) ) ( not ( = ?auto_106320 ?auto_106322 ) ) ( not ( = ?auto_106320 ?auto_106323 ) ) ( not ( = ?auto_106320 ?auto_106324 ) ) ( not ( = ?auto_106320 ?auto_106325 ) ) ( not ( = ?auto_106320 ?auto_106326 ) ) ( not ( = ?auto_106320 ?auto_106327 ) ) ( not ( = ?auto_106320 ?auto_106328 ) ) ( not ( = ?auto_106320 ?auto_106329 ) ) ( not ( = ?auto_106321 ?auto_106322 ) ) ( not ( = ?auto_106321 ?auto_106323 ) ) ( not ( = ?auto_106321 ?auto_106324 ) ) ( not ( = ?auto_106321 ?auto_106325 ) ) ( not ( = ?auto_106321 ?auto_106326 ) ) ( not ( = ?auto_106321 ?auto_106327 ) ) ( not ( = ?auto_106321 ?auto_106328 ) ) ( not ( = ?auto_106321 ?auto_106329 ) ) ( not ( = ?auto_106322 ?auto_106323 ) ) ( not ( = ?auto_106322 ?auto_106324 ) ) ( not ( = ?auto_106322 ?auto_106325 ) ) ( not ( = ?auto_106322 ?auto_106326 ) ) ( not ( = ?auto_106322 ?auto_106327 ) ) ( not ( = ?auto_106322 ?auto_106328 ) ) ( not ( = ?auto_106322 ?auto_106329 ) ) ( not ( = ?auto_106323 ?auto_106324 ) ) ( not ( = ?auto_106323 ?auto_106325 ) ) ( not ( = ?auto_106323 ?auto_106326 ) ) ( not ( = ?auto_106323 ?auto_106327 ) ) ( not ( = ?auto_106323 ?auto_106328 ) ) ( not ( = ?auto_106323 ?auto_106329 ) ) ( not ( = ?auto_106324 ?auto_106325 ) ) ( not ( = ?auto_106324 ?auto_106326 ) ) ( not ( = ?auto_106324 ?auto_106327 ) ) ( not ( = ?auto_106324 ?auto_106328 ) ) ( not ( = ?auto_106324 ?auto_106329 ) ) ( not ( = ?auto_106325 ?auto_106326 ) ) ( not ( = ?auto_106325 ?auto_106327 ) ) ( not ( = ?auto_106325 ?auto_106328 ) ) ( not ( = ?auto_106325 ?auto_106329 ) ) ( not ( = ?auto_106326 ?auto_106327 ) ) ( not ( = ?auto_106326 ?auto_106328 ) ) ( not ( = ?auto_106326 ?auto_106329 ) ) ( not ( = ?auto_106327 ?auto_106328 ) ) ( not ( = ?auto_106327 ?auto_106329 ) ) ( not ( = ?auto_106328 ?auto_106329 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106328 ?auto_106329 )
      ( !STACK ?auto_106328 ?auto_106327 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106340 - BLOCK
      ?auto_106341 - BLOCK
      ?auto_106342 - BLOCK
      ?auto_106343 - BLOCK
      ?auto_106344 - BLOCK
      ?auto_106345 - BLOCK
      ?auto_106346 - BLOCK
      ?auto_106347 - BLOCK
      ?auto_106348 - BLOCK
      ?auto_106349 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_106348 ) ( ON-TABLE ?auto_106349 ) ( CLEAR ?auto_106349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106340 ) ( ON ?auto_106341 ?auto_106340 ) ( ON ?auto_106342 ?auto_106341 ) ( ON ?auto_106343 ?auto_106342 ) ( ON ?auto_106344 ?auto_106343 ) ( ON ?auto_106345 ?auto_106344 ) ( ON ?auto_106346 ?auto_106345 ) ( ON ?auto_106347 ?auto_106346 ) ( ON ?auto_106348 ?auto_106347 ) ( not ( = ?auto_106340 ?auto_106341 ) ) ( not ( = ?auto_106340 ?auto_106342 ) ) ( not ( = ?auto_106340 ?auto_106343 ) ) ( not ( = ?auto_106340 ?auto_106344 ) ) ( not ( = ?auto_106340 ?auto_106345 ) ) ( not ( = ?auto_106340 ?auto_106346 ) ) ( not ( = ?auto_106340 ?auto_106347 ) ) ( not ( = ?auto_106340 ?auto_106348 ) ) ( not ( = ?auto_106340 ?auto_106349 ) ) ( not ( = ?auto_106341 ?auto_106342 ) ) ( not ( = ?auto_106341 ?auto_106343 ) ) ( not ( = ?auto_106341 ?auto_106344 ) ) ( not ( = ?auto_106341 ?auto_106345 ) ) ( not ( = ?auto_106341 ?auto_106346 ) ) ( not ( = ?auto_106341 ?auto_106347 ) ) ( not ( = ?auto_106341 ?auto_106348 ) ) ( not ( = ?auto_106341 ?auto_106349 ) ) ( not ( = ?auto_106342 ?auto_106343 ) ) ( not ( = ?auto_106342 ?auto_106344 ) ) ( not ( = ?auto_106342 ?auto_106345 ) ) ( not ( = ?auto_106342 ?auto_106346 ) ) ( not ( = ?auto_106342 ?auto_106347 ) ) ( not ( = ?auto_106342 ?auto_106348 ) ) ( not ( = ?auto_106342 ?auto_106349 ) ) ( not ( = ?auto_106343 ?auto_106344 ) ) ( not ( = ?auto_106343 ?auto_106345 ) ) ( not ( = ?auto_106343 ?auto_106346 ) ) ( not ( = ?auto_106343 ?auto_106347 ) ) ( not ( = ?auto_106343 ?auto_106348 ) ) ( not ( = ?auto_106343 ?auto_106349 ) ) ( not ( = ?auto_106344 ?auto_106345 ) ) ( not ( = ?auto_106344 ?auto_106346 ) ) ( not ( = ?auto_106344 ?auto_106347 ) ) ( not ( = ?auto_106344 ?auto_106348 ) ) ( not ( = ?auto_106344 ?auto_106349 ) ) ( not ( = ?auto_106345 ?auto_106346 ) ) ( not ( = ?auto_106345 ?auto_106347 ) ) ( not ( = ?auto_106345 ?auto_106348 ) ) ( not ( = ?auto_106345 ?auto_106349 ) ) ( not ( = ?auto_106346 ?auto_106347 ) ) ( not ( = ?auto_106346 ?auto_106348 ) ) ( not ( = ?auto_106346 ?auto_106349 ) ) ( not ( = ?auto_106347 ?auto_106348 ) ) ( not ( = ?auto_106347 ?auto_106349 ) ) ( not ( = ?auto_106348 ?auto_106349 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_106349 )
      ( !STACK ?auto_106349 ?auto_106348 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106360 - BLOCK
      ?auto_106361 - BLOCK
      ?auto_106362 - BLOCK
      ?auto_106363 - BLOCK
      ?auto_106364 - BLOCK
      ?auto_106365 - BLOCK
      ?auto_106366 - BLOCK
      ?auto_106367 - BLOCK
      ?auto_106368 - BLOCK
      ?auto_106369 - BLOCK
    )
    :vars
    (
      ?auto_106370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106369 ?auto_106370 ) ( ON-TABLE ?auto_106360 ) ( ON ?auto_106361 ?auto_106360 ) ( ON ?auto_106362 ?auto_106361 ) ( ON ?auto_106363 ?auto_106362 ) ( ON ?auto_106364 ?auto_106363 ) ( ON ?auto_106365 ?auto_106364 ) ( ON ?auto_106366 ?auto_106365 ) ( ON ?auto_106367 ?auto_106366 ) ( not ( = ?auto_106360 ?auto_106361 ) ) ( not ( = ?auto_106360 ?auto_106362 ) ) ( not ( = ?auto_106360 ?auto_106363 ) ) ( not ( = ?auto_106360 ?auto_106364 ) ) ( not ( = ?auto_106360 ?auto_106365 ) ) ( not ( = ?auto_106360 ?auto_106366 ) ) ( not ( = ?auto_106360 ?auto_106367 ) ) ( not ( = ?auto_106360 ?auto_106368 ) ) ( not ( = ?auto_106360 ?auto_106369 ) ) ( not ( = ?auto_106360 ?auto_106370 ) ) ( not ( = ?auto_106361 ?auto_106362 ) ) ( not ( = ?auto_106361 ?auto_106363 ) ) ( not ( = ?auto_106361 ?auto_106364 ) ) ( not ( = ?auto_106361 ?auto_106365 ) ) ( not ( = ?auto_106361 ?auto_106366 ) ) ( not ( = ?auto_106361 ?auto_106367 ) ) ( not ( = ?auto_106361 ?auto_106368 ) ) ( not ( = ?auto_106361 ?auto_106369 ) ) ( not ( = ?auto_106361 ?auto_106370 ) ) ( not ( = ?auto_106362 ?auto_106363 ) ) ( not ( = ?auto_106362 ?auto_106364 ) ) ( not ( = ?auto_106362 ?auto_106365 ) ) ( not ( = ?auto_106362 ?auto_106366 ) ) ( not ( = ?auto_106362 ?auto_106367 ) ) ( not ( = ?auto_106362 ?auto_106368 ) ) ( not ( = ?auto_106362 ?auto_106369 ) ) ( not ( = ?auto_106362 ?auto_106370 ) ) ( not ( = ?auto_106363 ?auto_106364 ) ) ( not ( = ?auto_106363 ?auto_106365 ) ) ( not ( = ?auto_106363 ?auto_106366 ) ) ( not ( = ?auto_106363 ?auto_106367 ) ) ( not ( = ?auto_106363 ?auto_106368 ) ) ( not ( = ?auto_106363 ?auto_106369 ) ) ( not ( = ?auto_106363 ?auto_106370 ) ) ( not ( = ?auto_106364 ?auto_106365 ) ) ( not ( = ?auto_106364 ?auto_106366 ) ) ( not ( = ?auto_106364 ?auto_106367 ) ) ( not ( = ?auto_106364 ?auto_106368 ) ) ( not ( = ?auto_106364 ?auto_106369 ) ) ( not ( = ?auto_106364 ?auto_106370 ) ) ( not ( = ?auto_106365 ?auto_106366 ) ) ( not ( = ?auto_106365 ?auto_106367 ) ) ( not ( = ?auto_106365 ?auto_106368 ) ) ( not ( = ?auto_106365 ?auto_106369 ) ) ( not ( = ?auto_106365 ?auto_106370 ) ) ( not ( = ?auto_106366 ?auto_106367 ) ) ( not ( = ?auto_106366 ?auto_106368 ) ) ( not ( = ?auto_106366 ?auto_106369 ) ) ( not ( = ?auto_106366 ?auto_106370 ) ) ( not ( = ?auto_106367 ?auto_106368 ) ) ( not ( = ?auto_106367 ?auto_106369 ) ) ( not ( = ?auto_106367 ?auto_106370 ) ) ( not ( = ?auto_106368 ?auto_106369 ) ) ( not ( = ?auto_106368 ?auto_106370 ) ) ( not ( = ?auto_106369 ?auto_106370 ) ) ( CLEAR ?auto_106367 ) ( ON ?auto_106368 ?auto_106369 ) ( CLEAR ?auto_106368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_106360 ?auto_106361 ?auto_106362 ?auto_106363 ?auto_106364 ?auto_106365 ?auto_106366 ?auto_106367 ?auto_106368 )
      ( MAKE-10PILE ?auto_106360 ?auto_106361 ?auto_106362 ?auto_106363 ?auto_106364 ?auto_106365 ?auto_106366 ?auto_106367 ?auto_106368 ?auto_106369 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106381 - BLOCK
      ?auto_106382 - BLOCK
      ?auto_106383 - BLOCK
      ?auto_106384 - BLOCK
      ?auto_106385 - BLOCK
      ?auto_106386 - BLOCK
      ?auto_106387 - BLOCK
      ?auto_106388 - BLOCK
      ?auto_106389 - BLOCK
      ?auto_106390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106390 ) ( ON-TABLE ?auto_106381 ) ( ON ?auto_106382 ?auto_106381 ) ( ON ?auto_106383 ?auto_106382 ) ( ON ?auto_106384 ?auto_106383 ) ( ON ?auto_106385 ?auto_106384 ) ( ON ?auto_106386 ?auto_106385 ) ( ON ?auto_106387 ?auto_106386 ) ( ON ?auto_106388 ?auto_106387 ) ( not ( = ?auto_106381 ?auto_106382 ) ) ( not ( = ?auto_106381 ?auto_106383 ) ) ( not ( = ?auto_106381 ?auto_106384 ) ) ( not ( = ?auto_106381 ?auto_106385 ) ) ( not ( = ?auto_106381 ?auto_106386 ) ) ( not ( = ?auto_106381 ?auto_106387 ) ) ( not ( = ?auto_106381 ?auto_106388 ) ) ( not ( = ?auto_106381 ?auto_106389 ) ) ( not ( = ?auto_106381 ?auto_106390 ) ) ( not ( = ?auto_106382 ?auto_106383 ) ) ( not ( = ?auto_106382 ?auto_106384 ) ) ( not ( = ?auto_106382 ?auto_106385 ) ) ( not ( = ?auto_106382 ?auto_106386 ) ) ( not ( = ?auto_106382 ?auto_106387 ) ) ( not ( = ?auto_106382 ?auto_106388 ) ) ( not ( = ?auto_106382 ?auto_106389 ) ) ( not ( = ?auto_106382 ?auto_106390 ) ) ( not ( = ?auto_106383 ?auto_106384 ) ) ( not ( = ?auto_106383 ?auto_106385 ) ) ( not ( = ?auto_106383 ?auto_106386 ) ) ( not ( = ?auto_106383 ?auto_106387 ) ) ( not ( = ?auto_106383 ?auto_106388 ) ) ( not ( = ?auto_106383 ?auto_106389 ) ) ( not ( = ?auto_106383 ?auto_106390 ) ) ( not ( = ?auto_106384 ?auto_106385 ) ) ( not ( = ?auto_106384 ?auto_106386 ) ) ( not ( = ?auto_106384 ?auto_106387 ) ) ( not ( = ?auto_106384 ?auto_106388 ) ) ( not ( = ?auto_106384 ?auto_106389 ) ) ( not ( = ?auto_106384 ?auto_106390 ) ) ( not ( = ?auto_106385 ?auto_106386 ) ) ( not ( = ?auto_106385 ?auto_106387 ) ) ( not ( = ?auto_106385 ?auto_106388 ) ) ( not ( = ?auto_106385 ?auto_106389 ) ) ( not ( = ?auto_106385 ?auto_106390 ) ) ( not ( = ?auto_106386 ?auto_106387 ) ) ( not ( = ?auto_106386 ?auto_106388 ) ) ( not ( = ?auto_106386 ?auto_106389 ) ) ( not ( = ?auto_106386 ?auto_106390 ) ) ( not ( = ?auto_106387 ?auto_106388 ) ) ( not ( = ?auto_106387 ?auto_106389 ) ) ( not ( = ?auto_106387 ?auto_106390 ) ) ( not ( = ?auto_106388 ?auto_106389 ) ) ( not ( = ?auto_106388 ?auto_106390 ) ) ( not ( = ?auto_106389 ?auto_106390 ) ) ( CLEAR ?auto_106388 ) ( ON ?auto_106389 ?auto_106390 ) ( CLEAR ?auto_106389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_106381 ?auto_106382 ?auto_106383 ?auto_106384 ?auto_106385 ?auto_106386 ?auto_106387 ?auto_106388 ?auto_106389 )
      ( MAKE-10PILE ?auto_106381 ?auto_106382 ?auto_106383 ?auto_106384 ?auto_106385 ?auto_106386 ?auto_106387 ?auto_106388 ?auto_106389 ?auto_106390 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106401 - BLOCK
      ?auto_106402 - BLOCK
      ?auto_106403 - BLOCK
      ?auto_106404 - BLOCK
      ?auto_106405 - BLOCK
      ?auto_106406 - BLOCK
      ?auto_106407 - BLOCK
      ?auto_106408 - BLOCK
      ?auto_106409 - BLOCK
      ?auto_106410 - BLOCK
    )
    :vars
    (
      ?auto_106411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106410 ?auto_106411 ) ( ON-TABLE ?auto_106401 ) ( ON ?auto_106402 ?auto_106401 ) ( ON ?auto_106403 ?auto_106402 ) ( ON ?auto_106404 ?auto_106403 ) ( ON ?auto_106405 ?auto_106404 ) ( ON ?auto_106406 ?auto_106405 ) ( ON ?auto_106407 ?auto_106406 ) ( not ( = ?auto_106401 ?auto_106402 ) ) ( not ( = ?auto_106401 ?auto_106403 ) ) ( not ( = ?auto_106401 ?auto_106404 ) ) ( not ( = ?auto_106401 ?auto_106405 ) ) ( not ( = ?auto_106401 ?auto_106406 ) ) ( not ( = ?auto_106401 ?auto_106407 ) ) ( not ( = ?auto_106401 ?auto_106408 ) ) ( not ( = ?auto_106401 ?auto_106409 ) ) ( not ( = ?auto_106401 ?auto_106410 ) ) ( not ( = ?auto_106401 ?auto_106411 ) ) ( not ( = ?auto_106402 ?auto_106403 ) ) ( not ( = ?auto_106402 ?auto_106404 ) ) ( not ( = ?auto_106402 ?auto_106405 ) ) ( not ( = ?auto_106402 ?auto_106406 ) ) ( not ( = ?auto_106402 ?auto_106407 ) ) ( not ( = ?auto_106402 ?auto_106408 ) ) ( not ( = ?auto_106402 ?auto_106409 ) ) ( not ( = ?auto_106402 ?auto_106410 ) ) ( not ( = ?auto_106402 ?auto_106411 ) ) ( not ( = ?auto_106403 ?auto_106404 ) ) ( not ( = ?auto_106403 ?auto_106405 ) ) ( not ( = ?auto_106403 ?auto_106406 ) ) ( not ( = ?auto_106403 ?auto_106407 ) ) ( not ( = ?auto_106403 ?auto_106408 ) ) ( not ( = ?auto_106403 ?auto_106409 ) ) ( not ( = ?auto_106403 ?auto_106410 ) ) ( not ( = ?auto_106403 ?auto_106411 ) ) ( not ( = ?auto_106404 ?auto_106405 ) ) ( not ( = ?auto_106404 ?auto_106406 ) ) ( not ( = ?auto_106404 ?auto_106407 ) ) ( not ( = ?auto_106404 ?auto_106408 ) ) ( not ( = ?auto_106404 ?auto_106409 ) ) ( not ( = ?auto_106404 ?auto_106410 ) ) ( not ( = ?auto_106404 ?auto_106411 ) ) ( not ( = ?auto_106405 ?auto_106406 ) ) ( not ( = ?auto_106405 ?auto_106407 ) ) ( not ( = ?auto_106405 ?auto_106408 ) ) ( not ( = ?auto_106405 ?auto_106409 ) ) ( not ( = ?auto_106405 ?auto_106410 ) ) ( not ( = ?auto_106405 ?auto_106411 ) ) ( not ( = ?auto_106406 ?auto_106407 ) ) ( not ( = ?auto_106406 ?auto_106408 ) ) ( not ( = ?auto_106406 ?auto_106409 ) ) ( not ( = ?auto_106406 ?auto_106410 ) ) ( not ( = ?auto_106406 ?auto_106411 ) ) ( not ( = ?auto_106407 ?auto_106408 ) ) ( not ( = ?auto_106407 ?auto_106409 ) ) ( not ( = ?auto_106407 ?auto_106410 ) ) ( not ( = ?auto_106407 ?auto_106411 ) ) ( not ( = ?auto_106408 ?auto_106409 ) ) ( not ( = ?auto_106408 ?auto_106410 ) ) ( not ( = ?auto_106408 ?auto_106411 ) ) ( not ( = ?auto_106409 ?auto_106410 ) ) ( not ( = ?auto_106409 ?auto_106411 ) ) ( not ( = ?auto_106410 ?auto_106411 ) ) ( ON ?auto_106409 ?auto_106410 ) ( CLEAR ?auto_106407 ) ( ON ?auto_106408 ?auto_106409 ) ( CLEAR ?auto_106408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_106401 ?auto_106402 ?auto_106403 ?auto_106404 ?auto_106405 ?auto_106406 ?auto_106407 ?auto_106408 )
      ( MAKE-10PILE ?auto_106401 ?auto_106402 ?auto_106403 ?auto_106404 ?auto_106405 ?auto_106406 ?auto_106407 ?auto_106408 ?auto_106409 ?auto_106410 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106422 - BLOCK
      ?auto_106423 - BLOCK
      ?auto_106424 - BLOCK
      ?auto_106425 - BLOCK
      ?auto_106426 - BLOCK
      ?auto_106427 - BLOCK
      ?auto_106428 - BLOCK
      ?auto_106429 - BLOCK
      ?auto_106430 - BLOCK
      ?auto_106431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106431 ) ( ON-TABLE ?auto_106422 ) ( ON ?auto_106423 ?auto_106422 ) ( ON ?auto_106424 ?auto_106423 ) ( ON ?auto_106425 ?auto_106424 ) ( ON ?auto_106426 ?auto_106425 ) ( ON ?auto_106427 ?auto_106426 ) ( ON ?auto_106428 ?auto_106427 ) ( not ( = ?auto_106422 ?auto_106423 ) ) ( not ( = ?auto_106422 ?auto_106424 ) ) ( not ( = ?auto_106422 ?auto_106425 ) ) ( not ( = ?auto_106422 ?auto_106426 ) ) ( not ( = ?auto_106422 ?auto_106427 ) ) ( not ( = ?auto_106422 ?auto_106428 ) ) ( not ( = ?auto_106422 ?auto_106429 ) ) ( not ( = ?auto_106422 ?auto_106430 ) ) ( not ( = ?auto_106422 ?auto_106431 ) ) ( not ( = ?auto_106423 ?auto_106424 ) ) ( not ( = ?auto_106423 ?auto_106425 ) ) ( not ( = ?auto_106423 ?auto_106426 ) ) ( not ( = ?auto_106423 ?auto_106427 ) ) ( not ( = ?auto_106423 ?auto_106428 ) ) ( not ( = ?auto_106423 ?auto_106429 ) ) ( not ( = ?auto_106423 ?auto_106430 ) ) ( not ( = ?auto_106423 ?auto_106431 ) ) ( not ( = ?auto_106424 ?auto_106425 ) ) ( not ( = ?auto_106424 ?auto_106426 ) ) ( not ( = ?auto_106424 ?auto_106427 ) ) ( not ( = ?auto_106424 ?auto_106428 ) ) ( not ( = ?auto_106424 ?auto_106429 ) ) ( not ( = ?auto_106424 ?auto_106430 ) ) ( not ( = ?auto_106424 ?auto_106431 ) ) ( not ( = ?auto_106425 ?auto_106426 ) ) ( not ( = ?auto_106425 ?auto_106427 ) ) ( not ( = ?auto_106425 ?auto_106428 ) ) ( not ( = ?auto_106425 ?auto_106429 ) ) ( not ( = ?auto_106425 ?auto_106430 ) ) ( not ( = ?auto_106425 ?auto_106431 ) ) ( not ( = ?auto_106426 ?auto_106427 ) ) ( not ( = ?auto_106426 ?auto_106428 ) ) ( not ( = ?auto_106426 ?auto_106429 ) ) ( not ( = ?auto_106426 ?auto_106430 ) ) ( not ( = ?auto_106426 ?auto_106431 ) ) ( not ( = ?auto_106427 ?auto_106428 ) ) ( not ( = ?auto_106427 ?auto_106429 ) ) ( not ( = ?auto_106427 ?auto_106430 ) ) ( not ( = ?auto_106427 ?auto_106431 ) ) ( not ( = ?auto_106428 ?auto_106429 ) ) ( not ( = ?auto_106428 ?auto_106430 ) ) ( not ( = ?auto_106428 ?auto_106431 ) ) ( not ( = ?auto_106429 ?auto_106430 ) ) ( not ( = ?auto_106429 ?auto_106431 ) ) ( not ( = ?auto_106430 ?auto_106431 ) ) ( ON ?auto_106430 ?auto_106431 ) ( CLEAR ?auto_106428 ) ( ON ?auto_106429 ?auto_106430 ) ( CLEAR ?auto_106429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_106422 ?auto_106423 ?auto_106424 ?auto_106425 ?auto_106426 ?auto_106427 ?auto_106428 ?auto_106429 )
      ( MAKE-10PILE ?auto_106422 ?auto_106423 ?auto_106424 ?auto_106425 ?auto_106426 ?auto_106427 ?auto_106428 ?auto_106429 ?auto_106430 ?auto_106431 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106442 - BLOCK
      ?auto_106443 - BLOCK
      ?auto_106444 - BLOCK
      ?auto_106445 - BLOCK
      ?auto_106446 - BLOCK
      ?auto_106447 - BLOCK
      ?auto_106448 - BLOCK
      ?auto_106449 - BLOCK
      ?auto_106450 - BLOCK
      ?auto_106451 - BLOCK
    )
    :vars
    (
      ?auto_106452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106451 ?auto_106452 ) ( ON-TABLE ?auto_106442 ) ( ON ?auto_106443 ?auto_106442 ) ( ON ?auto_106444 ?auto_106443 ) ( ON ?auto_106445 ?auto_106444 ) ( ON ?auto_106446 ?auto_106445 ) ( ON ?auto_106447 ?auto_106446 ) ( not ( = ?auto_106442 ?auto_106443 ) ) ( not ( = ?auto_106442 ?auto_106444 ) ) ( not ( = ?auto_106442 ?auto_106445 ) ) ( not ( = ?auto_106442 ?auto_106446 ) ) ( not ( = ?auto_106442 ?auto_106447 ) ) ( not ( = ?auto_106442 ?auto_106448 ) ) ( not ( = ?auto_106442 ?auto_106449 ) ) ( not ( = ?auto_106442 ?auto_106450 ) ) ( not ( = ?auto_106442 ?auto_106451 ) ) ( not ( = ?auto_106442 ?auto_106452 ) ) ( not ( = ?auto_106443 ?auto_106444 ) ) ( not ( = ?auto_106443 ?auto_106445 ) ) ( not ( = ?auto_106443 ?auto_106446 ) ) ( not ( = ?auto_106443 ?auto_106447 ) ) ( not ( = ?auto_106443 ?auto_106448 ) ) ( not ( = ?auto_106443 ?auto_106449 ) ) ( not ( = ?auto_106443 ?auto_106450 ) ) ( not ( = ?auto_106443 ?auto_106451 ) ) ( not ( = ?auto_106443 ?auto_106452 ) ) ( not ( = ?auto_106444 ?auto_106445 ) ) ( not ( = ?auto_106444 ?auto_106446 ) ) ( not ( = ?auto_106444 ?auto_106447 ) ) ( not ( = ?auto_106444 ?auto_106448 ) ) ( not ( = ?auto_106444 ?auto_106449 ) ) ( not ( = ?auto_106444 ?auto_106450 ) ) ( not ( = ?auto_106444 ?auto_106451 ) ) ( not ( = ?auto_106444 ?auto_106452 ) ) ( not ( = ?auto_106445 ?auto_106446 ) ) ( not ( = ?auto_106445 ?auto_106447 ) ) ( not ( = ?auto_106445 ?auto_106448 ) ) ( not ( = ?auto_106445 ?auto_106449 ) ) ( not ( = ?auto_106445 ?auto_106450 ) ) ( not ( = ?auto_106445 ?auto_106451 ) ) ( not ( = ?auto_106445 ?auto_106452 ) ) ( not ( = ?auto_106446 ?auto_106447 ) ) ( not ( = ?auto_106446 ?auto_106448 ) ) ( not ( = ?auto_106446 ?auto_106449 ) ) ( not ( = ?auto_106446 ?auto_106450 ) ) ( not ( = ?auto_106446 ?auto_106451 ) ) ( not ( = ?auto_106446 ?auto_106452 ) ) ( not ( = ?auto_106447 ?auto_106448 ) ) ( not ( = ?auto_106447 ?auto_106449 ) ) ( not ( = ?auto_106447 ?auto_106450 ) ) ( not ( = ?auto_106447 ?auto_106451 ) ) ( not ( = ?auto_106447 ?auto_106452 ) ) ( not ( = ?auto_106448 ?auto_106449 ) ) ( not ( = ?auto_106448 ?auto_106450 ) ) ( not ( = ?auto_106448 ?auto_106451 ) ) ( not ( = ?auto_106448 ?auto_106452 ) ) ( not ( = ?auto_106449 ?auto_106450 ) ) ( not ( = ?auto_106449 ?auto_106451 ) ) ( not ( = ?auto_106449 ?auto_106452 ) ) ( not ( = ?auto_106450 ?auto_106451 ) ) ( not ( = ?auto_106450 ?auto_106452 ) ) ( not ( = ?auto_106451 ?auto_106452 ) ) ( ON ?auto_106450 ?auto_106451 ) ( ON ?auto_106449 ?auto_106450 ) ( CLEAR ?auto_106447 ) ( ON ?auto_106448 ?auto_106449 ) ( CLEAR ?auto_106448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106442 ?auto_106443 ?auto_106444 ?auto_106445 ?auto_106446 ?auto_106447 ?auto_106448 )
      ( MAKE-10PILE ?auto_106442 ?auto_106443 ?auto_106444 ?auto_106445 ?auto_106446 ?auto_106447 ?auto_106448 ?auto_106449 ?auto_106450 ?auto_106451 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106463 - BLOCK
      ?auto_106464 - BLOCK
      ?auto_106465 - BLOCK
      ?auto_106466 - BLOCK
      ?auto_106467 - BLOCK
      ?auto_106468 - BLOCK
      ?auto_106469 - BLOCK
      ?auto_106470 - BLOCK
      ?auto_106471 - BLOCK
      ?auto_106472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106472 ) ( ON-TABLE ?auto_106463 ) ( ON ?auto_106464 ?auto_106463 ) ( ON ?auto_106465 ?auto_106464 ) ( ON ?auto_106466 ?auto_106465 ) ( ON ?auto_106467 ?auto_106466 ) ( ON ?auto_106468 ?auto_106467 ) ( not ( = ?auto_106463 ?auto_106464 ) ) ( not ( = ?auto_106463 ?auto_106465 ) ) ( not ( = ?auto_106463 ?auto_106466 ) ) ( not ( = ?auto_106463 ?auto_106467 ) ) ( not ( = ?auto_106463 ?auto_106468 ) ) ( not ( = ?auto_106463 ?auto_106469 ) ) ( not ( = ?auto_106463 ?auto_106470 ) ) ( not ( = ?auto_106463 ?auto_106471 ) ) ( not ( = ?auto_106463 ?auto_106472 ) ) ( not ( = ?auto_106464 ?auto_106465 ) ) ( not ( = ?auto_106464 ?auto_106466 ) ) ( not ( = ?auto_106464 ?auto_106467 ) ) ( not ( = ?auto_106464 ?auto_106468 ) ) ( not ( = ?auto_106464 ?auto_106469 ) ) ( not ( = ?auto_106464 ?auto_106470 ) ) ( not ( = ?auto_106464 ?auto_106471 ) ) ( not ( = ?auto_106464 ?auto_106472 ) ) ( not ( = ?auto_106465 ?auto_106466 ) ) ( not ( = ?auto_106465 ?auto_106467 ) ) ( not ( = ?auto_106465 ?auto_106468 ) ) ( not ( = ?auto_106465 ?auto_106469 ) ) ( not ( = ?auto_106465 ?auto_106470 ) ) ( not ( = ?auto_106465 ?auto_106471 ) ) ( not ( = ?auto_106465 ?auto_106472 ) ) ( not ( = ?auto_106466 ?auto_106467 ) ) ( not ( = ?auto_106466 ?auto_106468 ) ) ( not ( = ?auto_106466 ?auto_106469 ) ) ( not ( = ?auto_106466 ?auto_106470 ) ) ( not ( = ?auto_106466 ?auto_106471 ) ) ( not ( = ?auto_106466 ?auto_106472 ) ) ( not ( = ?auto_106467 ?auto_106468 ) ) ( not ( = ?auto_106467 ?auto_106469 ) ) ( not ( = ?auto_106467 ?auto_106470 ) ) ( not ( = ?auto_106467 ?auto_106471 ) ) ( not ( = ?auto_106467 ?auto_106472 ) ) ( not ( = ?auto_106468 ?auto_106469 ) ) ( not ( = ?auto_106468 ?auto_106470 ) ) ( not ( = ?auto_106468 ?auto_106471 ) ) ( not ( = ?auto_106468 ?auto_106472 ) ) ( not ( = ?auto_106469 ?auto_106470 ) ) ( not ( = ?auto_106469 ?auto_106471 ) ) ( not ( = ?auto_106469 ?auto_106472 ) ) ( not ( = ?auto_106470 ?auto_106471 ) ) ( not ( = ?auto_106470 ?auto_106472 ) ) ( not ( = ?auto_106471 ?auto_106472 ) ) ( ON ?auto_106471 ?auto_106472 ) ( ON ?auto_106470 ?auto_106471 ) ( CLEAR ?auto_106468 ) ( ON ?auto_106469 ?auto_106470 ) ( CLEAR ?auto_106469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106463 ?auto_106464 ?auto_106465 ?auto_106466 ?auto_106467 ?auto_106468 ?auto_106469 )
      ( MAKE-10PILE ?auto_106463 ?auto_106464 ?auto_106465 ?auto_106466 ?auto_106467 ?auto_106468 ?auto_106469 ?auto_106470 ?auto_106471 ?auto_106472 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106483 - BLOCK
      ?auto_106484 - BLOCK
      ?auto_106485 - BLOCK
      ?auto_106486 - BLOCK
      ?auto_106487 - BLOCK
      ?auto_106488 - BLOCK
      ?auto_106489 - BLOCK
      ?auto_106490 - BLOCK
      ?auto_106491 - BLOCK
      ?auto_106492 - BLOCK
    )
    :vars
    (
      ?auto_106493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106492 ?auto_106493 ) ( ON-TABLE ?auto_106483 ) ( ON ?auto_106484 ?auto_106483 ) ( ON ?auto_106485 ?auto_106484 ) ( ON ?auto_106486 ?auto_106485 ) ( ON ?auto_106487 ?auto_106486 ) ( not ( = ?auto_106483 ?auto_106484 ) ) ( not ( = ?auto_106483 ?auto_106485 ) ) ( not ( = ?auto_106483 ?auto_106486 ) ) ( not ( = ?auto_106483 ?auto_106487 ) ) ( not ( = ?auto_106483 ?auto_106488 ) ) ( not ( = ?auto_106483 ?auto_106489 ) ) ( not ( = ?auto_106483 ?auto_106490 ) ) ( not ( = ?auto_106483 ?auto_106491 ) ) ( not ( = ?auto_106483 ?auto_106492 ) ) ( not ( = ?auto_106483 ?auto_106493 ) ) ( not ( = ?auto_106484 ?auto_106485 ) ) ( not ( = ?auto_106484 ?auto_106486 ) ) ( not ( = ?auto_106484 ?auto_106487 ) ) ( not ( = ?auto_106484 ?auto_106488 ) ) ( not ( = ?auto_106484 ?auto_106489 ) ) ( not ( = ?auto_106484 ?auto_106490 ) ) ( not ( = ?auto_106484 ?auto_106491 ) ) ( not ( = ?auto_106484 ?auto_106492 ) ) ( not ( = ?auto_106484 ?auto_106493 ) ) ( not ( = ?auto_106485 ?auto_106486 ) ) ( not ( = ?auto_106485 ?auto_106487 ) ) ( not ( = ?auto_106485 ?auto_106488 ) ) ( not ( = ?auto_106485 ?auto_106489 ) ) ( not ( = ?auto_106485 ?auto_106490 ) ) ( not ( = ?auto_106485 ?auto_106491 ) ) ( not ( = ?auto_106485 ?auto_106492 ) ) ( not ( = ?auto_106485 ?auto_106493 ) ) ( not ( = ?auto_106486 ?auto_106487 ) ) ( not ( = ?auto_106486 ?auto_106488 ) ) ( not ( = ?auto_106486 ?auto_106489 ) ) ( not ( = ?auto_106486 ?auto_106490 ) ) ( not ( = ?auto_106486 ?auto_106491 ) ) ( not ( = ?auto_106486 ?auto_106492 ) ) ( not ( = ?auto_106486 ?auto_106493 ) ) ( not ( = ?auto_106487 ?auto_106488 ) ) ( not ( = ?auto_106487 ?auto_106489 ) ) ( not ( = ?auto_106487 ?auto_106490 ) ) ( not ( = ?auto_106487 ?auto_106491 ) ) ( not ( = ?auto_106487 ?auto_106492 ) ) ( not ( = ?auto_106487 ?auto_106493 ) ) ( not ( = ?auto_106488 ?auto_106489 ) ) ( not ( = ?auto_106488 ?auto_106490 ) ) ( not ( = ?auto_106488 ?auto_106491 ) ) ( not ( = ?auto_106488 ?auto_106492 ) ) ( not ( = ?auto_106488 ?auto_106493 ) ) ( not ( = ?auto_106489 ?auto_106490 ) ) ( not ( = ?auto_106489 ?auto_106491 ) ) ( not ( = ?auto_106489 ?auto_106492 ) ) ( not ( = ?auto_106489 ?auto_106493 ) ) ( not ( = ?auto_106490 ?auto_106491 ) ) ( not ( = ?auto_106490 ?auto_106492 ) ) ( not ( = ?auto_106490 ?auto_106493 ) ) ( not ( = ?auto_106491 ?auto_106492 ) ) ( not ( = ?auto_106491 ?auto_106493 ) ) ( not ( = ?auto_106492 ?auto_106493 ) ) ( ON ?auto_106491 ?auto_106492 ) ( ON ?auto_106490 ?auto_106491 ) ( ON ?auto_106489 ?auto_106490 ) ( CLEAR ?auto_106487 ) ( ON ?auto_106488 ?auto_106489 ) ( CLEAR ?auto_106488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106483 ?auto_106484 ?auto_106485 ?auto_106486 ?auto_106487 ?auto_106488 )
      ( MAKE-10PILE ?auto_106483 ?auto_106484 ?auto_106485 ?auto_106486 ?auto_106487 ?auto_106488 ?auto_106489 ?auto_106490 ?auto_106491 ?auto_106492 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106504 - BLOCK
      ?auto_106505 - BLOCK
      ?auto_106506 - BLOCK
      ?auto_106507 - BLOCK
      ?auto_106508 - BLOCK
      ?auto_106509 - BLOCK
      ?auto_106510 - BLOCK
      ?auto_106511 - BLOCK
      ?auto_106512 - BLOCK
      ?auto_106513 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106513 ) ( ON-TABLE ?auto_106504 ) ( ON ?auto_106505 ?auto_106504 ) ( ON ?auto_106506 ?auto_106505 ) ( ON ?auto_106507 ?auto_106506 ) ( ON ?auto_106508 ?auto_106507 ) ( not ( = ?auto_106504 ?auto_106505 ) ) ( not ( = ?auto_106504 ?auto_106506 ) ) ( not ( = ?auto_106504 ?auto_106507 ) ) ( not ( = ?auto_106504 ?auto_106508 ) ) ( not ( = ?auto_106504 ?auto_106509 ) ) ( not ( = ?auto_106504 ?auto_106510 ) ) ( not ( = ?auto_106504 ?auto_106511 ) ) ( not ( = ?auto_106504 ?auto_106512 ) ) ( not ( = ?auto_106504 ?auto_106513 ) ) ( not ( = ?auto_106505 ?auto_106506 ) ) ( not ( = ?auto_106505 ?auto_106507 ) ) ( not ( = ?auto_106505 ?auto_106508 ) ) ( not ( = ?auto_106505 ?auto_106509 ) ) ( not ( = ?auto_106505 ?auto_106510 ) ) ( not ( = ?auto_106505 ?auto_106511 ) ) ( not ( = ?auto_106505 ?auto_106512 ) ) ( not ( = ?auto_106505 ?auto_106513 ) ) ( not ( = ?auto_106506 ?auto_106507 ) ) ( not ( = ?auto_106506 ?auto_106508 ) ) ( not ( = ?auto_106506 ?auto_106509 ) ) ( not ( = ?auto_106506 ?auto_106510 ) ) ( not ( = ?auto_106506 ?auto_106511 ) ) ( not ( = ?auto_106506 ?auto_106512 ) ) ( not ( = ?auto_106506 ?auto_106513 ) ) ( not ( = ?auto_106507 ?auto_106508 ) ) ( not ( = ?auto_106507 ?auto_106509 ) ) ( not ( = ?auto_106507 ?auto_106510 ) ) ( not ( = ?auto_106507 ?auto_106511 ) ) ( not ( = ?auto_106507 ?auto_106512 ) ) ( not ( = ?auto_106507 ?auto_106513 ) ) ( not ( = ?auto_106508 ?auto_106509 ) ) ( not ( = ?auto_106508 ?auto_106510 ) ) ( not ( = ?auto_106508 ?auto_106511 ) ) ( not ( = ?auto_106508 ?auto_106512 ) ) ( not ( = ?auto_106508 ?auto_106513 ) ) ( not ( = ?auto_106509 ?auto_106510 ) ) ( not ( = ?auto_106509 ?auto_106511 ) ) ( not ( = ?auto_106509 ?auto_106512 ) ) ( not ( = ?auto_106509 ?auto_106513 ) ) ( not ( = ?auto_106510 ?auto_106511 ) ) ( not ( = ?auto_106510 ?auto_106512 ) ) ( not ( = ?auto_106510 ?auto_106513 ) ) ( not ( = ?auto_106511 ?auto_106512 ) ) ( not ( = ?auto_106511 ?auto_106513 ) ) ( not ( = ?auto_106512 ?auto_106513 ) ) ( ON ?auto_106512 ?auto_106513 ) ( ON ?auto_106511 ?auto_106512 ) ( ON ?auto_106510 ?auto_106511 ) ( CLEAR ?auto_106508 ) ( ON ?auto_106509 ?auto_106510 ) ( CLEAR ?auto_106509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106504 ?auto_106505 ?auto_106506 ?auto_106507 ?auto_106508 ?auto_106509 )
      ( MAKE-10PILE ?auto_106504 ?auto_106505 ?auto_106506 ?auto_106507 ?auto_106508 ?auto_106509 ?auto_106510 ?auto_106511 ?auto_106512 ?auto_106513 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106524 - BLOCK
      ?auto_106525 - BLOCK
      ?auto_106526 - BLOCK
      ?auto_106527 - BLOCK
      ?auto_106528 - BLOCK
      ?auto_106529 - BLOCK
      ?auto_106530 - BLOCK
      ?auto_106531 - BLOCK
      ?auto_106532 - BLOCK
      ?auto_106533 - BLOCK
    )
    :vars
    (
      ?auto_106534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106533 ?auto_106534 ) ( ON-TABLE ?auto_106524 ) ( ON ?auto_106525 ?auto_106524 ) ( ON ?auto_106526 ?auto_106525 ) ( ON ?auto_106527 ?auto_106526 ) ( not ( = ?auto_106524 ?auto_106525 ) ) ( not ( = ?auto_106524 ?auto_106526 ) ) ( not ( = ?auto_106524 ?auto_106527 ) ) ( not ( = ?auto_106524 ?auto_106528 ) ) ( not ( = ?auto_106524 ?auto_106529 ) ) ( not ( = ?auto_106524 ?auto_106530 ) ) ( not ( = ?auto_106524 ?auto_106531 ) ) ( not ( = ?auto_106524 ?auto_106532 ) ) ( not ( = ?auto_106524 ?auto_106533 ) ) ( not ( = ?auto_106524 ?auto_106534 ) ) ( not ( = ?auto_106525 ?auto_106526 ) ) ( not ( = ?auto_106525 ?auto_106527 ) ) ( not ( = ?auto_106525 ?auto_106528 ) ) ( not ( = ?auto_106525 ?auto_106529 ) ) ( not ( = ?auto_106525 ?auto_106530 ) ) ( not ( = ?auto_106525 ?auto_106531 ) ) ( not ( = ?auto_106525 ?auto_106532 ) ) ( not ( = ?auto_106525 ?auto_106533 ) ) ( not ( = ?auto_106525 ?auto_106534 ) ) ( not ( = ?auto_106526 ?auto_106527 ) ) ( not ( = ?auto_106526 ?auto_106528 ) ) ( not ( = ?auto_106526 ?auto_106529 ) ) ( not ( = ?auto_106526 ?auto_106530 ) ) ( not ( = ?auto_106526 ?auto_106531 ) ) ( not ( = ?auto_106526 ?auto_106532 ) ) ( not ( = ?auto_106526 ?auto_106533 ) ) ( not ( = ?auto_106526 ?auto_106534 ) ) ( not ( = ?auto_106527 ?auto_106528 ) ) ( not ( = ?auto_106527 ?auto_106529 ) ) ( not ( = ?auto_106527 ?auto_106530 ) ) ( not ( = ?auto_106527 ?auto_106531 ) ) ( not ( = ?auto_106527 ?auto_106532 ) ) ( not ( = ?auto_106527 ?auto_106533 ) ) ( not ( = ?auto_106527 ?auto_106534 ) ) ( not ( = ?auto_106528 ?auto_106529 ) ) ( not ( = ?auto_106528 ?auto_106530 ) ) ( not ( = ?auto_106528 ?auto_106531 ) ) ( not ( = ?auto_106528 ?auto_106532 ) ) ( not ( = ?auto_106528 ?auto_106533 ) ) ( not ( = ?auto_106528 ?auto_106534 ) ) ( not ( = ?auto_106529 ?auto_106530 ) ) ( not ( = ?auto_106529 ?auto_106531 ) ) ( not ( = ?auto_106529 ?auto_106532 ) ) ( not ( = ?auto_106529 ?auto_106533 ) ) ( not ( = ?auto_106529 ?auto_106534 ) ) ( not ( = ?auto_106530 ?auto_106531 ) ) ( not ( = ?auto_106530 ?auto_106532 ) ) ( not ( = ?auto_106530 ?auto_106533 ) ) ( not ( = ?auto_106530 ?auto_106534 ) ) ( not ( = ?auto_106531 ?auto_106532 ) ) ( not ( = ?auto_106531 ?auto_106533 ) ) ( not ( = ?auto_106531 ?auto_106534 ) ) ( not ( = ?auto_106532 ?auto_106533 ) ) ( not ( = ?auto_106532 ?auto_106534 ) ) ( not ( = ?auto_106533 ?auto_106534 ) ) ( ON ?auto_106532 ?auto_106533 ) ( ON ?auto_106531 ?auto_106532 ) ( ON ?auto_106530 ?auto_106531 ) ( ON ?auto_106529 ?auto_106530 ) ( CLEAR ?auto_106527 ) ( ON ?auto_106528 ?auto_106529 ) ( CLEAR ?auto_106528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106524 ?auto_106525 ?auto_106526 ?auto_106527 ?auto_106528 )
      ( MAKE-10PILE ?auto_106524 ?auto_106525 ?auto_106526 ?auto_106527 ?auto_106528 ?auto_106529 ?auto_106530 ?auto_106531 ?auto_106532 ?auto_106533 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106545 - BLOCK
      ?auto_106546 - BLOCK
      ?auto_106547 - BLOCK
      ?auto_106548 - BLOCK
      ?auto_106549 - BLOCK
      ?auto_106550 - BLOCK
      ?auto_106551 - BLOCK
      ?auto_106552 - BLOCK
      ?auto_106553 - BLOCK
      ?auto_106554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106554 ) ( ON-TABLE ?auto_106545 ) ( ON ?auto_106546 ?auto_106545 ) ( ON ?auto_106547 ?auto_106546 ) ( ON ?auto_106548 ?auto_106547 ) ( not ( = ?auto_106545 ?auto_106546 ) ) ( not ( = ?auto_106545 ?auto_106547 ) ) ( not ( = ?auto_106545 ?auto_106548 ) ) ( not ( = ?auto_106545 ?auto_106549 ) ) ( not ( = ?auto_106545 ?auto_106550 ) ) ( not ( = ?auto_106545 ?auto_106551 ) ) ( not ( = ?auto_106545 ?auto_106552 ) ) ( not ( = ?auto_106545 ?auto_106553 ) ) ( not ( = ?auto_106545 ?auto_106554 ) ) ( not ( = ?auto_106546 ?auto_106547 ) ) ( not ( = ?auto_106546 ?auto_106548 ) ) ( not ( = ?auto_106546 ?auto_106549 ) ) ( not ( = ?auto_106546 ?auto_106550 ) ) ( not ( = ?auto_106546 ?auto_106551 ) ) ( not ( = ?auto_106546 ?auto_106552 ) ) ( not ( = ?auto_106546 ?auto_106553 ) ) ( not ( = ?auto_106546 ?auto_106554 ) ) ( not ( = ?auto_106547 ?auto_106548 ) ) ( not ( = ?auto_106547 ?auto_106549 ) ) ( not ( = ?auto_106547 ?auto_106550 ) ) ( not ( = ?auto_106547 ?auto_106551 ) ) ( not ( = ?auto_106547 ?auto_106552 ) ) ( not ( = ?auto_106547 ?auto_106553 ) ) ( not ( = ?auto_106547 ?auto_106554 ) ) ( not ( = ?auto_106548 ?auto_106549 ) ) ( not ( = ?auto_106548 ?auto_106550 ) ) ( not ( = ?auto_106548 ?auto_106551 ) ) ( not ( = ?auto_106548 ?auto_106552 ) ) ( not ( = ?auto_106548 ?auto_106553 ) ) ( not ( = ?auto_106548 ?auto_106554 ) ) ( not ( = ?auto_106549 ?auto_106550 ) ) ( not ( = ?auto_106549 ?auto_106551 ) ) ( not ( = ?auto_106549 ?auto_106552 ) ) ( not ( = ?auto_106549 ?auto_106553 ) ) ( not ( = ?auto_106549 ?auto_106554 ) ) ( not ( = ?auto_106550 ?auto_106551 ) ) ( not ( = ?auto_106550 ?auto_106552 ) ) ( not ( = ?auto_106550 ?auto_106553 ) ) ( not ( = ?auto_106550 ?auto_106554 ) ) ( not ( = ?auto_106551 ?auto_106552 ) ) ( not ( = ?auto_106551 ?auto_106553 ) ) ( not ( = ?auto_106551 ?auto_106554 ) ) ( not ( = ?auto_106552 ?auto_106553 ) ) ( not ( = ?auto_106552 ?auto_106554 ) ) ( not ( = ?auto_106553 ?auto_106554 ) ) ( ON ?auto_106553 ?auto_106554 ) ( ON ?auto_106552 ?auto_106553 ) ( ON ?auto_106551 ?auto_106552 ) ( ON ?auto_106550 ?auto_106551 ) ( CLEAR ?auto_106548 ) ( ON ?auto_106549 ?auto_106550 ) ( CLEAR ?auto_106549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106545 ?auto_106546 ?auto_106547 ?auto_106548 ?auto_106549 )
      ( MAKE-10PILE ?auto_106545 ?auto_106546 ?auto_106547 ?auto_106548 ?auto_106549 ?auto_106550 ?auto_106551 ?auto_106552 ?auto_106553 ?auto_106554 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106565 - BLOCK
      ?auto_106566 - BLOCK
      ?auto_106567 - BLOCK
      ?auto_106568 - BLOCK
      ?auto_106569 - BLOCK
      ?auto_106570 - BLOCK
      ?auto_106571 - BLOCK
      ?auto_106572 - BLOCK
      ?auto_106573 - BLOCK
      ?auto_106574 - BLOCK
    )
    :vars
    (
      ?auto_106575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106574 ?auto_106575 ) ( ON-TABLE ?auto_106565 ) ( ON ?auto_106566 ?auto_106565 ) ( ON ?auto_106567 ?auto_106566 ) ( not ( = ?auto_106565 ?auto_106566 ) ) ( not ( = ?auto_106565 ?auto_106567 ) ) ( not ( = ?auto_106565 ?auto_106568 ) ) ( not ( = ?auto_106565 ?auto_106569 ) ) ( not ( = ?auto_106565 ?auto_106570 ) ) ( not ( = ?auto_106565 ?auto_106571 ) ) ( not ( = ?auto_106565 ?auto_106572 ) ) ( not ( = ?auto_106565 ?auto_106573 ) ) ( not ( = ?auto_106565 ?auto_106574 ) ) ( not ( = ?auto_106565 ?auto_106575 ) ) ( not ( = ?auto_106566 ?auto_106567 ) ) ( not ( = ?auto_106566 ?auto_106568 ) ) ( not ( = ?auto_106566 ?auto_106569 ) ) ( not ( = ?auto_106566 ?auto_106570 ) ) ( not ( = ?auto_106566 ?auto_106571 ) ) ( not ( = ?auto_106566 ?auto_106572 ) ) ( not ( = ?auto_106566 ?auto_106573 ) ) ( not ( = ?auto_106566 ?auto_106574 ) ) ( not ( = ?auto_106566 ?auto_106575 ) ) ( not ( = ?auto_106567 ?auto_106568 ) ) ( not ( = ?auto_106567 ?auto_106569 ) ) ( not ( = ?auto_106567 ?auto_106570 ) ) ( not ( = ?auto_106567 ?auto_106571 ) ) ( not ( = ?auto_106567 ?auto_106572 ) ) ( not ( = ?auto_106567 ?auto_106573 ) ) ( not ( = ?auto_106567 ?auto_106574 ) ) ( not ( = ?auto_106567 ?auto_106575 ) ) ( not ( = ?auto_106568 ?auto_106569 ) ) ( not ( = ?auto_106568 ?auto_106570 ) ) ( not ( = ?auto_106568 ?auto_106571 ) ) ( not ( = ?auto_106568 ?auto_106572 ) ) ( not ( = ?auto_106568 ?auto_106573 ) ) ( not ( = ?auto_106568 ?auto_106574 ) ) ( not ( = ?auto_106568 ?auto_106575 ) ) ( not ( = ?auto_106569 ?auto_106570 ) ) ( not ( = ?auto_106569 ?auto_106571 ) ) ( not ( = ?auto_106569 ?auto_106572 ) ) ( not ( = ?auto_106569 ?auto_106573 ) ) ( not ( = ?auto_106569 ?auto_106574 ) ) ( not ( = ?auto_106569 ?auto_106575 ) ) ( not ( = ?auto_106570 ?auto_106571 ) ) ( not ( = ?auto_106570 ?auto_106572 ) ) ( not ( = ?auto_106570 ?auto_106573 ) ) ( not ( = ?auto_106570 ?auto_106574 ) ) ( not ( = ?auto_106570 ?auto_106575 ) ) ( not ( = ?auto_106571 ?auto_106572 ) ) ( not ( = ?auto_106571 ?auto_106573 ) ) ( not ( = ?auto_106571 ?auto_106574 ) ) ( not ( = ?auto_106571 ?auto_106575 ) ) ( not ( = ?auto_106572 ?auto_106573 ) ) ( not ( = ?auto_106572 ?auto_106574 ) ) ( not ( = ?auto_106572 ?auto_106575 ) ) ( not ( = ?auto_106573 ?auto_106574 ) ) ( not ( = ?auto_106573 ?auto_106575 ) ) ( not ( = ?auto_106574 ?auto_106575 ) ) ( ON ?auto_106573 ?auto_106574 ) ( ON ?auto_106572 ?auto_106573 ) ( ON ?auto_106571 ?auto_106572 ) ( ON ?auto_106570 ?auto_106571 ) ( ON ?auto_106569 ?auto_106570 ) ( CLEAR ?auto_106567 ) ( ON ?auto_106568 ?auto_106569 ) ( CLEAR ?auto_106568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106565 ?auto_106566 ?auto_106567 ?auto_106568 )
      ( MAKE-10PILE ?auto_106565 ?auto_106566 ?auto_106567 ?auto_106568 ?auto_106569 ?auto_106570 ?auto_106571 ?auto_106572 ?auto_106573 ?auto_106574 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106586 - BLOCK
      ?auto_106587 - BLOCK
      ?auto_106588 - BLOCK
      ?auto_106589 - BLOCK
      ?auto_106590 - BLOCK
      ?auto_106591 - BLOCK
      ?auto_106592 - BLOCK
      ?auto_106593 - BLOCK
      ?auto_106594 - BLOCK
      ?auto_106595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106595 ) ( ON-TABLE ?auto_106586 ) ( ON ?auto_106587 ?auto_106586 ) ( ON ?auto_106588 ?auto_106587 ) ( not ( = ?auto_106586 ?auto_106587 ) ) ( not ( = ?auto_106586 ?auto_106588 ) ) ( not ( = ?auto_106586 ?auto_106589 ) ) ( not ( = ?auto_106586 ?auto_106590 ) ) ( not ( = ?auto_106586 ?auto_106591 ) ) ( not ( = ?auto_106586 ?auto_106592 ) ) ( not ( = ?auto_106586 ?auto_106593 ) ) ( not ( = ?auto_106586 ?auto_106594 ) ) ( not ( = ?auto_106586 ?auto_106595 ) ) ( not ( = ?auto_106587 ?auto_106588 ) ) ( not ( = ?auto_106587 ?auto_106589 ) ) ( not ( = ?auto_106587 ?auto_106590 ) ) ( not ( = ?auto_106587 ?auto_106591 ) ) ( not ( = ?auto_106587 ?auto_106592 ) ) ( not ( = ?auto_106587 ?auto_106593 ) ) ( not ( = ?auto_106587 ?auto_106594 ) ) ( not ( = ?auto_106587 ?auto_106595 ) ) ( not ( = ?auto_106588 ?auto_106589 ) ) ( not ( = ?auto_106588 ?auto_106590 ) ) ( not ( = ?auto_106588 ?auto_106591 ) ) ( not ( = ?auto_106588 ?auto_106592 ) ) ( not ( = ?auto_106588 ?auto_106593 ) ) ( not ( = ?auto_106588 ?auto_106594 ) ) ( not ( = ?auto_106588 ?auto_106595 ) ) ( not ( = ?auto_106589 ?auto_106590 ) ) ( not ( = ?auto_106589 ?auto_106591 ) ) ( not ( = ?auto_106589 ?auto_106592 ) ) ( not ( = ?auto_106589 ?auto_106593 ) ) ( not ( = ?auto_106589 ?auto_106594 ) ) ( not ( = ?auto_106589 ?auto_106595 ) ) ( not ( = ?auto_106590 ?auto_106591 ) ) ( not ( = ?auto_106590 ?auto_106592 ) ) ( not ( = ?auto_106590 ?auto_106593 ) ) ( not ( = ?auto_106590 ?auto_106594 ) ) ( not ( = ?auto_106590 ?auto_106595 ) ) ( not ( = ?auto_106591 ?auto_106592 ) ) ( not ( = ?auto_106591 ?auto_106593 ) ) ( not ( = ?auto_106591 ?auto_106594 ) ) ( not ( = ?auto_106591 ?auto_106595 ) ) ( not ( = ?auto_106592 ?auto_106593 ) ) ( not ( = ?auto_106592 ?auto_106594 ) ) ( not ( = ?auto_106592 ?auto_106595 ) ) ( not ( = ?auto_106593 ?auto_106594 ) ) ( not ( = ?auto_106593 ?auto_106595 ) ) ( not ( = ?auto_106594 ?auto_106595 ) ) ( ON ?auto_106594 ?auto_106595 ) ( ON ?auto_106593 ?auto_106594 ) ( ON ?auto_106592 ?auto_106593 ) ( ON ?auto_106591 ?auto_106592 ) ( ON ?auto_106590 ?auto_106591 ) ( CLEAR ?auto_106588 ) ( ON ?auto_106589 ?auto_106590 ) ( CLEAR ?auto_106589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106586 ?auto_106587 ?auto_106588 ?auto_106589 )
      ( MAKE-10PILE ?auto_106586 ?auto_106587 ?auto_106588 ?auto_106589 ?auto_106590 ?auto_106591 ?auto_106592 ?auto_106593 ?auto_106594 ?auto_106595 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106606 - BLOCK
      ?auto_106607 - BLOCK
      ?auto_106608 - BLOCK
      ?auto_106609 - BLOCK
      ?auto_106610 - BLOCK
      ?auto_106611 - BLOCK
      ?auto_106612 - BLOCK
      ?auto_106613 - BLOCK
      ?auto_106614 - BLOCK
      ?auto_106615 - BLOCK
    )
    :vars
    (
      ?auto_106616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106615 ?auto_106616 ) ( ON-TABLE ?auto_106606 ) ( ON ?auto_106607 ?auto_106606 ) ( not ( = ?auto_106606 ?auto_106607 ) ) ( not ( = ?auto_106606 ?auto_106608 ) ) ( not ( = ?auto_106606 ?auto_106609 ) ) ( not ( = ?auto_106606 ?auto_106610 ) ) ( not ( = ?auto_106606 ?auto_106611 ) ) ( not ( = ?auto_106606 ?auto_106612 ) ) ( not ( = ?auto_106606 ?auto_106613 ) ) ( not ( = ?auto_106606 ?auto_106614 ) ) ( not ( = ?auto_106606 ?auto_106615 ) ) ( not ( = ?auto_106606 ?auto_106616 ) ) ( not ( = ?auto_106607 ?auto_106608 ) ) ( not ( = ?auto_106607 ?auto_106609 ) ) ( not ( = ?auto_106607 ?auto_106610 ) ) ( not ( = ?auto_106607 ?auto_106611 ) ) ( not ( = ?auto_106607 ?auto_106612 ) ) ( not ( = ?auto_106607 ?auto_106613 ) ) ( not ( = ?auto_106607 ?auto_106614 ) ) ( not ( = ?auto_106607 ?auto_106615 ) ) ( not ( = ?auto_106607 ?auto_106616 ) ) ( not ( = ?auto_106608 ?auto_106609 ) ) ( not ( = ?auto_106608 ?auto_106610 ) ) ( not ( = ?auto_106608 ?auto_106611 ) ) ( not ( = ?auto_106608 ?auto_106612 ) ) ( not ( = ?auto_106608 ?auto_106613 ) ) ( not ( = ?auto_106608 ?auto_106614 ) ) ( not ( = ?auto_106608 ?auto_106615 ) ) ( not ( = ?auto_106608 ?auto_106616 ) ) ( not ( = ?auto_106609 ?auto_106610 ) ) ( not ( = ?auto_106609 ?auto_106611 ) ) ( not ( = ?auto_106609 ?auto_106612 ) ) ( not ( = ?auto_106609 ?auto_106613 ) ) ( not ( = ?auto_106609 ?auto_106614 ) ) ( not ( = ?auto_106609 ?auto_106615 ) ) ( not ( = ?auto_106609 ?auto_106616 ) ) ( not ( = ?auto_106610 ?auto_106611 ) ) ( not ( = ?auto_106610 ?auto_106612 ) ) ( not ( = ?auto_106610 ?auto_106613 ) ) ( not ( = ?auto_106610 ?auto_106614 ) ) ( not ( = ?auto_106610 ?auto_106615 ) ) ( not ( = ?auto_106610 ?auto_106616 ) ) ( not ( = ?auto_106611 ?auto_106612 ) ) ( not ( = ?auto_106611 ?auto_106613 ) ) ( not ( = ?auto_106611 ?auto_106614 ) ) ( not ( = ?auto_106611 ?auto_106615 ) ) ( not ( = ?auto_106611 ?auto_106616 ) ) ( not ( = ?auto_106612 ?auto_106613 ) ) ( not ( = ?auto_106612 ?auto_106614 ) ) ( not ( = ?auto_106612 ?auto_106615 ) ) ( not ( = ?auto_106612 ?auto_106616 ) ) ( not ( = ?auto_106613 ?auto_106614 ) ) ( not ( = ?auto_106613 ?auto_106615 ) ) ( not ( = ?auto_106613 ?auto_106616 ) ) ( not ( = ?auto_106614 ?auto_106615 ) ) ( not ( = ?auto_106614 ?auto_106616 ) ) ( not ( = ?auto_106615 ?auto_106616 ) ) ( ON ?auto_106614 ?auto_106615 ) ( ON ?auto_106613 ?auto_106614 ) ( ON ?auto_106612 ?auto_106613 ) ( ON ?auto_106611 ?auto_106612 ) ( ON ?auto_106610 ?auto_106611 ) ( ON ?auto_106609 ?auto_106610 ) ( CLEAR ?auto_106607 ) ( ON ?auto_106608 ?auto_106609 ) ( CLEAR ?auto_106608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106606 ?auto_106607 ?auto_106608 )
      ( MAKE-10PILE ?auto_106606 ?auto_106607 ?auto_106608 ?auto_106609 ?auto_106610 ?auto_106611 ?auto_106612 ?auto_106613 ?auto_106614 ?auto_106615 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106627 - BLOCK
      ?auto_106628 - BLOCK
      ?auto_106629 - BLOCK
      ?auto_106630 - BLOCK
      ?auto_106631 - BLOCK
      ?auto_106632 - BLOCK
      ?auto_106633 - BLOCK
      ?auto_106634 - BLOCK
      ?auto_106635 - BLOCK
      ?auto_106636 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106636 ) ( ON-TABLE ?auto_106627 ) ( ON ?auto_106628 ?auto_106627 ) ( not ( = ?auto_106627 ?auto_106628 ) ) ( not ( = ?auto_106627 ?auto_106629 ) ) ( not ( = ?auto_106627 ?auto_106630 ) ) ( not ( = ?auto_106627 ?auto_106631 ) ) ( not ( = ?auto_106627 ?auto_106632 ) ) ( not ( = ?auto_106627 ?auto_106633 ) ) ( not ( = ?auto_106627 ?auto_106634 ) ) ( not ( = ?auto_106627 ?auto_106635 ) ) ( not ( = ?auto_106627 ?auto_106636 ) ) ( not ( = ?auto_106628 ?auto_106629 ) ) ( not ( = ?auto_106628 ?auto_106630 ) ) ( not ( = ?auto_106628 ?auto_106631 ) ) ( not ( = ?auto_106628 ?auto_106632 ) ) ( not ( = ?auto_106628 ?auto_106633 ) ) ( not ( = ?auto_106628 ?auto_106634 ) ) ( not ( = ?auto_106628 ?auto_106635 ) ) ( not ( = ?auto_106628 ?auto_106636 ) ) ( not ( = ?auto_106629 ?auto_106630 ) ) ( not ( = ?auto_106629 ?auto_106631 ) ) ( not ( = ?auto_106629 ?auto_106632 ) ) ( not ( = ?auto_106629 ?auto_106633 ) ) ( not ( = ?auto_106629 ?auto_106634 ) ) ( not ( = ?auto_106629 ?auto_106635 ) ) ( not ( = ?auto_106629 ?auto_106636 ) ) ( not ( = ?auto_106630 ?auto_106631 ) ) ( not ( = ?auto_106630 ?auto_106632 ) ) ( not ( = ?auto_106630 ?auto_106633 ) ) ( not ( = ?auto_106630 ?auto_106634 ) ) ( not ( = ?auto_106630 ?auto_106635 ) ) ( not ( = ?auto_106630 ?auto_106636 ) ) ( not ( = ?auto_106631 ?auto_106632 ) ) ( not ( = ?auto_106631 ?auto_106633 ) ) ( not ( = ?auto_106631 ?auto_106634 ) ) ( not ( = ?auto_106631 ?auto_106635 ) ) ( not ( = ?auto_106631 ?auto_106636 ) ) ( not ( = ?auto_106632 ?auto_106633 ) ) ( not ( = ?auto_106632 ?auto_106634 ) ) ( not ( = ?auto_106632 ?auto_106635 ) ) ( not ( = ?auto_106632 ?auto_106636 ) ) ( not ( = ?auto_106633 ?auto_106634 ) ) ( not ( = ?auto_106633 ?auto_106635 ) ) ( not ( = ?auto_106633 ?auto_106636 ) ) ( not ( = ?auto_106634 ?auto_106635 ) ) ( not ( = ?auto_106634 ?auto_106636 ) ) ( not ( = ?auto_106635 ?auto_106636 ) ) ( ON ?auto_106635 ?auto_106636 ) ( ON ?auto_106634 ?auto_106635 ) ( ON ?auto_106633 ?auto_106634 ) ( ON ?auto_106632 ?auto_106633 ) ( ON ?auto_106631 ?auto_106632 ) ( ON ?auto_106630 ?auto_106631 ) ( CLEAR ?auto_106628 ) ( ON ?auto_106629 ?auto_106630 ) ( CLEAR ?auto_106629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106627 ?auto_106628 ?auto_106629 )
      ( MAKE-10PILE ?auto_106627 ?auto_106628 ?auto_106629 ?auto_106630 ?auto_106631 ?auto_106632 ?auto_106633 ?auto_106634 ?auto_106635 ?auto_106636 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106647 - BLOCK
      ?auto_106648 - BLOCK
      ?auto_106649 - BLOCK
      ?auto_106650 - BLOCK
      ?auto_106651 - BLOCK
      ?auto_106652 - BLOCK
      ?auto_106653 - BLOCK
      ?auto_106654 - BLOCK
      ?auto_106655 - BLOCK
      ?auto_106656 - BLOCK
    )
    :vars
    (
      ?auto_106657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106656 ?auto_106657 ) ( ON-TABLE ?auto_106647 ) ( not ( = ?auto_106647 ?auto_106648 ) ) ( not ( = ?auto_106647 ?auto_106649 ) ) ( not ( = ?auto_106647 ?auto_106650 ) ) ( not ( = ?auto_106647 ?auto_106651 ) ) ( not ( = ?auto_106647 ?auto_106652 ) ) ( not ( = ?auto_106647 ?auto_106653 ) ) ( not ( = ?auto_106647 ?auto_106654 ) ) ( not ( = ?auto_106647 ?auto_106655 ) ) ( not ( = ?auto_106647 ?auto_106656 ) ) ( not ( = ?auto_106647 ?auto_106657 ) ) ( not ( = ?auto_106648 ?auto_106649 ) ) ( not ( = ?auto_106648 ?auto_106650 ) ) ( not ( = ?auto_106648 ?auto_106651 ) ) ( not ( = ?auto_106648 ?auto_106652 ) ) ( not ( = ?auto_106648 ?auto_106653 ) ) ( not ( = ?auto_106648 ?auto_106654 ) ) ( not ( = ?auto_106648 ?auto_106655 ) ) ( not ( = ?auto_106648 ?auto_106656 ) ) ( not ( = ?auto_106648 ?auto_106657 ) ) ( not ( = ?auto_106649 ?auto_106650 ) ) ( not ( = ?auto_106649 ?auto_106651 ) ) ( not ( = ?auto_106649 ?auto_106652 ) ) ( not ( = ?auto_106649 ?auto_106653 ) ) ( not ( = ?auto_106649 ?auto_106654 ) ) ( not ( = ?auto_106649 ?auto_106655 ) ) ( not ( = ?auto_106649 ?auto_106656 ) ) ( not ( = ?auto_106649 ?auto_106657 ) ) ( not ( = ?auto_106650 ?auto_106651 ) ) ( not ( = ?auto_106650 ?auto_106652 ) ) ( not ( = ?auto_106650 ?auto_106653 ) ) ( not ( = ?auto_106650 ?auto_106654 ) ) ( not ( = ?auto_106650 ?auto_106655 ) ) ( not ( = ?auto_106650 ?auto_106656 ) ) ( not ( = ?auto_106650 ?auto_106657 ) ) ( not ( = ?auto_106651 ?auto_106652 ) ) ( not ( = ?auto_106651 ?auto_106653 ) ) ( not ( = ?auto_106651 ?auto_106654 ) ) ( not ( = ?auto_106651 ?auto_106655 ) ) ( not ( = ?auto_106651 ?auto_106656 ) ) ( not ( = ?auto_106651 ?auto_106657 ) ) ( not ( = ?auto_106652 ?auto_106653 ) ) ( not ( = ?auto_106652 ?auto_106654 ) ) ( not ( = ?auto_106652 ?auto_106655 ) ) ( not ( = ?auto_106652 ?auto_106656 ) ) ( not ( = ?auto_106652 ?auto_106657 ) ) ( not ( = ?auto_106653 ?auto_106654 ) ) ( not ( = ?auto_106653 ?auto_106655 ) ) ( not ( = ?auto_106653 ?auto_106656 ) ) ( not ( = ?auto_106653 ?auto_106657 ) ) ( not ( = ?auto_106654 ?auto_106655 ) ) ( not ( = ?auto_106654 ?auto_106656 ) ) ( not ( = ?auto_106654 ?auto_106657 ) ) ( not ( = ?auto_106655 ?auto_106656 ) ) ( not ( = ?auto_106655 ?auto_106657 ) ) ( not ( = ?auto_106656 ?auto_106657 ) ) ( ON ?auto_106655 ?auto_106656 ) ( ON ?auto_106654 ?auto_106655 ) ( ON ?auto_106653 ?auto_106654 ) ( ON ?auto_106652 ?auto_106653 ) ( ON ?auto_106651 ?auto_106652 ) ( ON ?auto_106650 ?auto_106651 ) ( ON ?auto_106649 ?auto_106650 ) ( CLEAR ?auto_106647 ) ( ON ?auto_106648 ?auto_106649 ) ( CLEAR ?auto_106648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106647 ?auto_106648 )
      ( MAKE-10PILE ?auto_106647 ?auto_106648 ?auto_106649 ?auto_106650 ?auto_106651 ?auto_106652 ?auto_106653 ?auto_106654 ?auto_106655 ?auto_106656 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106668 - BLOCK
      ?auto_106669 - BLOCK
      ?auto_106670 - BLOCK
      ?auto_106671 - BLOCK
      ?auto_106672 - BLOCK
      ?auto_106673 - BLOCK
      ?auto_106674 - BLOCK
      ?auto_106675 - BLOCK
      ?auto_106676 - BLOCK
      ?auto_106677 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106677 ) ( ON-TABLE ?auto_106668 ) ( not ( = ?auto_106668 ?auto_106669 ) ) ( not ( = ?auto_106668 ?auto_106670 ) ) ( not ( = ?auto_106668 ?auto_106671 ) ) ( not ( = ?auto_106668 ?auto_106672 ) ) ( not ( = ?auto_106668 ?auto_106673 ) ) ( not ( = ?auto_106668 ?auto_106674 ) ) ( not ( = ?auto_106668 ?auto_106675 ) ) ( not ( = ?auto_106668 ?auto_106676 ) ) ( not ( = ?auto_106668 ?auto_106677 ) ) ( not ( = ?auto_106669 ?auto_106670 ) ) ( not ( = ?auto_106669 ?auto_106671 ) ) ( not ( = ?auto_106669 ?auto_106672 ) ) ( not ( = ?auto_106669 ?auto_106673 ) ) ( not ( = ?auto_106669 ?auto_106674 ) ) ( not ( = ?auto_106669 ?auto_106675 ) ) ( not ( = ?auto_106669 ?auto_106676 ) ) ( not ( = ?auto_106669 ?auto_106677 ) ) ( not ( = ?auto_106670 ?auto_106671 ) ) ( not ( = ?auto_106670 ?auto_106672 ) ) ( not ( = ?auto_106670 ?auto_106673 ) ) ( not ( = ?auto_106670 ?auto_106674 ) ) ( not ( = ?auto_106670 ?auto_106675 ) ) ( not ( = ?auto_106670 ?auto_106676 ) ) ( not ( = ?auto_106670 ?auto_106677 ) ) ( not ( = ?auto_106671 ?auto_106672 ) ) ( not ( = ?auto_106671 ?auto_106673 ) ) ( not ( = ?auto_106671 ?auto_106674 ) ) ( not ( = ?auto_106671 ?auto_106675 ) ) ( not ( = ?auto_106671 ?auto_106676 ) ) ( not ( = ?auto_106671 ?auto_106677 ) ) ( not ( = ?auto_106672 ?auto_106673 ) ) ( not ( = ?auto_106672 ?auto_106674 ) ) ( not ( = ?auto_106672 ?auto_106675 ) ) ( not ( = ?auto_106672 ?auto_106676 ) ) ( not ( = ?auto_106672 ?auto_106677 ) ) ( not ( = ?auto_106673 ?auto_106674 ) ) ( not ( = ?auto_106673 ?auto_106675 ) ) ( not ( = ?auto_106673 ?auto_106676 ) ) ( not ( = ?auto_106673 ?auto_106677 ) ) ( not ( = ?auto_106674 ?auto_106675 ) ) ( not ( = ?auto_106674 ?auto_106676 ) ) ( not ( = ?auto_106674 ?auto_106677 ) ) ( not ( = ?auto_106675 ?auto_106676 ) ) ( not ( = ?auto_106675 ?auto_106677 ) ) ( not ( = ?auto_106676 ?auto_106677 ) ) ( ON ?auto_106676 ?auto_106677 ) ( ON ?auto_106675 ?auto_106676 ) ( ON ?auto_106674 ?auto_106675 ) ( ON ?auto_106673 ?auto_106674 ) ( ON ?auto_106672 ?auto_106673 ) ( ON ?auto_106671 ?auto_106672 ) ( ON ?auto_106670 ?auto_106671 ) ( CLEAR ?auto_106668 ) ( ON ?auto_106669 ?auto_106670 ) ( CLEAR ?auto_106669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106668 ?auto_106669 )
      ( MAKE-10PILE ?auto_106668 ?auto_106669 ?auto_106670 ?auto_106671 ?auto_106672 ?auto_106673 ?auto_106674 ?auto_106675 ?auto_106676 ?auto_106677 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106688 - BLOCK
      ?auto_106689 - BLOCK
      ?auto_106690 - BLOCK
      ?auto_106691 - BLOCK
      ?auto_106692 - BLOCK
      ?auto_106693 - BLOCK
      ?auto_106694 - BLOCK
      ?auto_106695 - BLOCK
      ?auto_106696 - BLOCK
      ?auto_106697 - BLOCK
    )
    :vars
    (
      ?auto_106698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106697 ?auto_106698 ) ( not ( = ?auto_106688 ?auto_106689 ) ) ( not ( = ?auto_106688 ?auto_106690 ) ) ( not ( = ?auto_106688 ?auto_106691 ) ) ( not ( = ?auto_106688 ?auto_106692 ) ) ( not ( = ?auto_106688 ?auto_106693 ) ) ( not ( = ?auto_106688 ?auto_106694 ) ) ( not ( = ?auto_106688 ?auto_106695 ) ) ( not ( = ?auto_106688 ?auto_106696 ) ) ( not ( = ?auto_106688 ?auto_106697 ) ) ( not ( = ?auto_106688 ?auto_106698 ) ) ( not ( = ?auto_106689 ?auto_106690 ) ) ( not ( = ?auto_106689 ?auto_106691 ) ) ( not ( = ?auto_106689 ?auto_106692 ) ) ( not ( = ?auto_106689 ?auto_106693 ) ) ( not ( = ?auto_106689 ?auto_106694 ) ) ( not ( = ?auto_106689 ?auto_106695 ) ) ( not ( = ?auto_106689 ?auto_106696 ) ) ( not ( = ?auto_106689 ?auto_106697 ) ) ( not ( = ?auto_106689 ?auto_106698 ) ) ( not ( = ?auto_106690 ?auto_106691 ) ) ( not ( = ?auto_106690 ?auto_106692 ) ) ( not ( = ?auto_106690 ?auto_106693 ) ) ( not ( = ?auto_106690 ?auto_106694 ) ) ( not ( = ?auto_106690 ?auto_106695 ) ) ( not ( = ?auto_106690 ?auto_106696 ) ) ( not ( = ?auto_106690 ?auto_106697 ) ) ( not ( = ?auto_106690 ?auto_106698 ) ) ( not ( = ?auto_106691 ?auto_106692 ) ) ( not ( = ?auto_106691 ?auto_106693 ) ) ( not ( = ?auto_106691 ?auto_106694 ) ) ( not ( = ?auto_106691 ?auto_106695 ) ) ( not ( = ?auto_106691 ?auto_106696 ) ) ( not ( = ?auto_106691 ?auto_106697 ) ) ( not ( = ?auto_106691 ?auto_106698 ) ) ( not ( = ?auto_106692 ?auto_106693 ) ) ( not ( = ?auto_106692 ?auto_106694 ) ) ( not ( = ?auto_106692 ?auto_106695 ) ) ( not ( = ?auto_106692 ?auto_106696 ) ) ( not ( = ?auto_106692 ?auto_106697 ) ) ( not ( = ?auto_106692 ?auto_106698 ) ) ( not ( = ?auto_106693 ?auto_106694 ) ) ( not ( = ?auto_106693 ?auto_106695 ) ) ( not ( = ?auto_106693 ?auto_106696 ) ) ( not ( = ?auto_106693 ?auto_106697 ) ) ( not ( = ?auto_106693 ?auto_106698 ) ) ( not ( = ?auto_106694 ?auto_106695 ) ) ( not ( = ?auto_106694 ?auto_106696 ) ) ( not ( = ?auto_106694 ?auto_106697 ) ) ( not ( = ?auto_106694 ?auto_106698 ) ) ( not ( = ?auto_106695 ?auto_106696 ) ) ( not ( = ?auto_106695 ?auto_106697 ) ) ( not ( = ?auto_106695 ?auto_106698 ) ) ( not ( = ?auto_106696 ?auto_106697 ) ) ( not ( = ?auto_106696 ?auto_106698 ) ) ( not ( = ?auto_106697 ?auto_106698 ) ) ( ON ?auto_106696 ?auto_106697 ) ( ON ?auto_106695 ?auto_106696 ) ( ON ?auto_106694 ?auto_106695 ) ( ON ?auto_106693 ?auto_106694 ) ( ON ?auto_106692 ?auto_106693 ) ( ON ?auto_106691 ?auto_106692 ) ( ON ?auto_106690 ?auto_106691 ) ( ON ?auto_106689 ?auto_106690 ) ( ON ?auto_106688 ?auto_106689 ) ( CLEAR ?auto_106688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106688 )
      ( MAKE-10PILE ?auto_106688 ?auto_106689 ?auto_106690 ?auto_106691 ?auto_106692 ?auto_106693 ?auto_106694 ?auto_106695 ?auto_106696 ?auto_106697 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106709 - BLOCK
      ?auto_106710 - BLOCK
      ?auto_106711 - BLOCK
      ?auto_106712 - BLOCK
      ?auto_106713 - BLOCK
      ?auto_106714 - BLOCK
      ?auto_106715 - BLOCK
      ?auto_106716 - BLOCK
      ?auto_106717 - BLOCK
      ?auto_106718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106718 ) ( not ( = ?auto_106709 ?auto_106710 ) ) ( not ( = ?auto_106709 ?auto_106711 ) ) ( not ( = ?auto_106709 ?auto_106712 ) ) ( not ( = ?auto_106709 ?auto_106713 ) ) ( not ( = ?auto_106709 ?auto_106714 ) ) ( not ( = ?auto_106709 ?auto_106715 ) ) ( not ( = ?auto_106709 ?auto_106716 ) ) ( not ( = ?auto_106709 ?auto_106717 ) ) ( not ( = ?auto_106709 ?auto_106718 ) ) ( not ( = ?auto_106710 ?auto_106711 ) ) ( not ( = ?auto_106710 ?auto_106712 ) ) ( not ( = ?auto_106710 ?auto_106713 ) ) ( not ( = ?auto_106710 ?auto_106714 ) ) ( not ( = ?auto_106710 ?auto_106715 ) ) ( not ( = ?auto_106710 ?auto_106716 ) ) ( not ( = ?auto_106710 ?auto_106717 ) ) ( not ( = ?auto_106710 ?auto_106718 ) ) ( not ( = ?auto_106711 ?auto_106712 ) ) ( not ( = ?auto_106711 ?auto_106713 ) ) ( not ( = ?auto_106711 ?auto_106714 ) ) ( not ( = ?auto_106711 ?auto_106715 ) ) ( not ( = ?auto_106711 ?auto_106716 ) ) ( not ( = ?auto_106711 ?auto_106717 ) ) ( not ( = ?auto_106711 ?auto_106718 ) ) ( not ( = ?auto_106712 ?auto_106713 ) ) ( not ( = ?auto_106712 ?auto_106714 ) ) ( not ( = ?auto_106712 ?auto_106715 ) ) ( not ( = ?auto_106712 ?auto_106716 ) ) ( not ( = ?auto_106712 ?auto_106717 ) ) ( not ( = ?auto_106712 ?auto_106718 ) ) ( not ( = ?auto_106713 ?auto_106714 ) ) ( not ( = ?auto_106713 ?auto_106715 ) ) ( not ( = ?auto_106713 ?auto_106716 ) ) ( not ( = ?auto_106713 ?auto_106717 ) ) ( not ( = ?auto_106713 ?auto_106718 ) ) ( not ( = ?auto_106714 ?auto_106715 ) ) ( not ( = ?auto_106714 ?auto_106716 ) ) ( not ( = ?auto_106714 ?auto_106717 ) ) ( not ( = ?auto_106714 ?auto_106718 ) ) ( not ( = ?auto_106715 ?auto_106716 ) ) ( not ( = ?auto_106715 ?auto_106717 ) ) ( not ( = ?auto_106715 ?auto_106718 ) ) ( not ( = ?auto_106716 ?auto_106717 ) ) ( not ( = ?auto_106716 ?auto_106718 ) ) ( not ( = ?auto_106717 ?auto_106718 ) ) ( ON ?auto_106717 ?auto_106718 ) ( ON ?auto_106716 ?auto_106717 ) ( ON ?auto_106715 ?auto_106716 ) ( ON ?auto_106714 ?auto_106715 ) ( ON ?auto_106713 ?auto_106714 ) ( ON ?auto_106712 ?auto_106713 ) ( ON ?auto_106711 ?auto_106712 ) ( ON ?auto_106710 ?auto_106711 ) ( ON ?auto_106709 ?auto_106710 ) ( CLEAR ?auto_106709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106709 )
      ( MAKE-10PILE ?auto_106709 ?auto_106710 ?auto_106711 ?auto_106712 ?auto_106713 ?auto_106714 ?auto_106715 ?auto_106716 ?auto_106717 ?auto_106718 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_106729 - BLOCK
      ?auto_106730 - BLOCK
      ?auto_106731 - BLOCK
      ?auto_106732 - BLOCK
      ?auto_106733 - BLOCK
      ?auto_106734 - BLOCK
      ?auto_106735 - BLOCK
      ?auto_106736 - BLOCK
      ?auto_106737 - BLOCK
      ?auto_106738 - BLOCK
    )
    :vars
    (
      ?auto_106739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106729 ?auto_106730 ) ) ( not ( = ?auto_106729 ?auto_106731 ) ) ( not ( = ?auto_106729 ?auto_106732 ) ) ( not ( = ?auto_106729 ?auto_106733 ) ) ( not ( = ?auto_106729 ?auto_106734 ) ) ( not ( = ?auto_106729 ?auto_106735 ) ) ( not ( = ?auto_106729 ?auto_106736 ) ) ( not ( = ?auto_106729 ?auto_106737 ) ) ( not ( = ?auto_106729 ?auto_106738 ) ) ( not ( = ?auto_106730 ?auto_106731 ) ) ( not ( = ?auto_106730 ?auto_106732 ) ) ( not ( = ?auto_106730 ?auto_106733 ) ) ( not ( = ?auto_106730 ?auto_106734 ) ) ( not ( = ?auto_106730 ?auto_106735 ) ) ( not ( = ?auto_106730 ?auto_106736 ) ) ( not ( = ?auto_106730 ?auto_106737 ) ) ( not ( = ?auto_106730 ?auto_106738 ) ) ( not ( = ?auto_106731 ?auto_106732 ) ) ( not ( = ?auto_106731 ?auto_106733 ) ) ( not ( = ?auto_106731 ?auto_106734 ) ) ( not ( = ?auto_106731 ?auto_106735 ) ) ( not ( = ?auto_106731 ?auto_106736 ) ) ( not ( = ?auto_106731 ?auto_106737 ) ) ( not ( = ?auto_106731 ?auto_106738 ) ) ( not ( = ?auto_106732 ?auto_106733 ) ) ( not ( = ?auto_106732 ?auto_106734 ) ) ( not ( = ?auto_106732 ?auto_106735 ) ) ( not ( = ?auto_106732 ?auto_106736 ) ) ( not ( = ?auto_106732 ?auto_106737 ) ) ( not ( = ?auto_106732 ?auto_106738 ) ) ( not ( = ?auto_106733 ?auto_106734 ) ) ( not ( = ?auto_106733 ?auto_106735 ) ) ( not ( = ?auto_106733 ?auto_106736 ) ) ( not ( = ?auto_106733 ?auto_106737 ) ) ( not ( = ?auto_106733 ?auto_106738 ) ) ( not ( = ?auto_106734 ?auto_106735 ) ) ( not ( = ?auto_106734 ?auto_106736 ) ) ( not ( = ?auto_106734 ?auto_106737 ) ) ( not ( = ?auto_106734 ?auto_106738 ) ) ( not ( = ?auto_106735 ?auto_106736 ) ) ( not ( = ?auto_106735 ?auto_106737 ) ) ( not ( = ?auto_106735 ?auto_106738 ) ) ( not ( = ?auto_106736 ?auto_106737 ) ) ( not ( = ?auto_106736 ?auto_106738 ) ) ( not ( = ?auto_106737 ?auto_106738 ) ) ( ON ?auto_106729 ?auto_106739 ) ( not ( = ?auto_106738 ?auto_106739 ) ) ( not ( = ?auto_106737 ?auto_106739 ) ) ( not ( = ?auto_106736 ?auto_106739 ) ) ( not ( = ?auto_106735 ?auto_106739 ) ) ( not ( = ?auto_106734 ?auto_106739 ) ) ( not ( = ?auto_106733 ?auto_106739 ) ) ( not ( = ?auto_106732 ?auto_106739 ) ) ( not ( = ?auto_106731 ?auto_106739 ) ) ( not ( = ?auto_106730 ?auto_106739 ) ) ( not ( = ?auto_106729 ?auto_106739 ) ) ( ON ?auto_106730 ?auto_106729 ) ( ON ?auto_106731 ?auto_106730 ) ( ON ?auto_106732 ?auto_106731 ) ( ON ?auto_106733 ?auto_106732 ) ( ON ?auto_106734 ?auto_106733 ) ( ON ?auto_106735 ?auto_106734 ) ( ON ?auto_106736 ?auto_106735 ) ( ON ?auto_106737 ?auto_106736 ) ( ON ?auto_106738 ?auto_106737 ) ( CLEAR ?auto_106738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_106738 ?auto_106737 ?auto_106736 ?auto_106735 ?auto_106734 ?auto_106733 ?auto_106732 ?auto_106731 ?auto_106730 ?auto_106729 )
      ( MAKE-10PILE ?auto_106729 ?auto_106730 ?auto_106731 ?auto_106732 ?auto_106733 ?auto_106734 ?auto_106735 ?auto_106736 ?auto_106737 ?auto_106738 ) )
  )

)

