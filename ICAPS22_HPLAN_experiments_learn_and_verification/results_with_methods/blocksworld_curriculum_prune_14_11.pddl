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
      ?auto_322056 - BLOCK
    )
    :vars
    (
      ?auto_322057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322056 ?auto_322057 ) ( CLEAR ?auto_322056 ) ( HAND-EMPTY ) ( not ( = ?auto_322056 ?auto_322057 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_322056 ?auto_322057 )
      ( !PUTDOWN ?auto_322056 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_322063 - BLOCK
      ?auto_322064 - BLOCK
    )
    :vars
    (
      ?auto_322065 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_322063 ) ( ON ?auto_322064 ?auto_322065 ) ( CLEAR ?auto_322064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_322063 ) ( not ( = ?auto_322063 ?auto_322064 ) ) ( not ( = ?auto_322063 ?auto_322065 ) ) ( not ( = ?auto_322064 ?auto_322065 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_322064 ?auto_322065 )
      ( !STACK ?auto_322064 ?auto_322063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_322073 - BLOCK
      ?auto_322074 - BLOCK
    )
    :vars
    (
      ?auto_322075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322074 ?auto_322075 ) ( not ( = ?auto_322073 ?auto_322074 ) ) ( not ( = ?auto_322073 ?auto_322075 ) ) ( not ( = ?auto_322074 ?auto_322075 ) ) ( ON ?auto_322073 ?auto_322074 ) ( CLEAR ?auto_322073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_322073 )
      ( MAKE-2PILE ?auto_322073 ?auto_322074 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_322084 - BLOCK
      ?auto_322085 - BLOCK
      ?auto_322086 - BLOCK
    )
    :vars
    (
      ?auto_322087 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_322085 ) ( ON ?auto_322086 ?auto_322087 ) ( CLEAR ?auto_322086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_322084 ) ( ON ?auto_322085 ?auto_322084 ) ( not ( = ?auto_322084 ?auto_322085 ) ) ( not ( = ?auto_322084 ?auto_322086 ) ) ( not ( = ?auto_322084 ?auto_322087 ) ) ( not ( = ?auto_322085 ?auto_322086 ) ) ( not ( = ?auto_322085 ?auto_322087 ) ) ( not ( = ?auto_322086 ?auto_322087 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_322086 ?auto_322087 )
      ( !STACK ?auto_322086 ?auto_322085 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_322098 - BLOCK
      ?auto_322099 - BLOCK
      ?auto_322100 - BLOCK
    )
    :vars
    (
      ?auto_322101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322100 ?auto_322101 ) ( ON-TABLE ?auto_322098 ) ( not ( = ?auto_322098 ?auto_322099 ) ) ( not ( = ?auto_322098 ?auto_322100 ) ) ( not ( = ?auto_322098 ?auto_322101 ) ) ( not ( = ?auto_322099 ?auto_322100 ) ) ( not ( = ?auto_322099 ?auto_322101 ) ) ( not ( = ?auto_322100 ?auto_322101 ) ) ( CLEAR ?auto_322098 ) ( ON ?auto_322099 ?auto_322100 ) ( CLEAR ?auto_322099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_322098 ?auto_322099 )
      ( MAKE-3PILE ?auto_322098 ?auto_322099 ?auto_322100 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_322112 - BLOCK
      ?auto_322113 - BLOCK
      ?auto_322114 - BLOCK
    )
    :vars
    (
      ?auto_322115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322114 ?auto_322115 ) ( not ( = ?auto_322112 ?auto_322113 ) ) ( not ( = ?auto_322112 ?auto_322114 ) ) ( not ( = ?auto_322112 ?auto_322115 ) ) ( not ( = ?auto_322113 ?auto_322114 ) ) ( not ( = ?auto_322113 ?auto_322115 ) ) ( not ( = ?auto_322114 ?auto_322115 ) ) ( ON ?auto_322113 ?auto_322114 ) ( ON ?auto_322112 ?auto_322113 ) ( CLEAR ?auto_322112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_322112 )
      ( MAKE-3PILE ?auto_322112 ?auto_322113 ?auto_322114 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_322127 - BLOCK
      ?auto_322128 - BLOCK
      ?auto_322129 - BLOCK
      ?auto_322130 - BLOCK
    )
    :vars
    (
      ?auto_322131 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_322129 ) ( ON ?auto_322130 ?auto_322131 ) ( CLEAR ?auto_322130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_322127 ) ( ON ?auto_322128 ?auto_322127 ) ( ON ?auto_322129 ?auto_322128 ) ( not ( = ?auto_322127 ?auto_322128 ) ) ( not ( = ?auto_322127 ?auto_322129 ) ) ( not ( = ?auto_322127 ?auto_322130 ) ) ( not ( = ?auto_322127 ?auto_322131 ) ) ( not ( = ?auto_322128 ?auto_322129 ) ) ( not ( = ?auto_322128 ?auto_322130 ) ) ( not ( = ?auto_322128 ?auto_322131 ) ) ( not ( = ?auto_322129 ?auto_322130 ) ) ( not ( = ?auto_322129 ?auto_322131 ) ) ( not ( = ?auto_322130 ?auto_322131 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_322130 ?auto_322131 )
      ( !STACK ?auto_322130 ?auto_322129 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_322145 - BLOCK
      ?auto_322146 - BLOCK
      ?auto_322147 - BLOCK
      ?auto_322148 - BLOCK
    )
    :vars
    (
      ?auto_322149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322148 ?auto_322149 ) ( ON-TABLE ?auto_322145 ) ( ON ?auto_322146 ?auto_322145 ) ( not ( = ?auto_322145 ?auto_322146 ) ) ( not ( = ?auto_322145 ?auto_322147 ) ) ( not ( = ?auto_322145 ?auto_322148 ) ) ( not ( = ?auto_322145 ?auto_322149 ) ) ( not ( = ?auto_322146 ?auto_322147 ) ) ( not ( = ?auto_322146 ?auto_322148 ) ) ( not ( = ?auto_322146 ?auto_322149 ) ) ( not ( = ?auto_322147 ?auto_322148 ) ) ( not ( = ?auto_322147 ?auto_322149 ) ) ( not ( = ?auto_322148 ?auto_322149 ) ) ( CLEAR ?auto_322146 ) ( ON ?auto_322147 ?auto_322148 ) ( CLEAR ?auto_322147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_322145 ?auto_322146 ?auto_322147 )
      ( MAKE-4PILE ?auto_322145 ?auto_322146 ?auto_322147 ?auto_322148 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_322163 - BLOCK
      ?auto_322164 - BLOCK
      ?auto_322165 - BLOCK
      ?auto_322166 - BLOCK
    )
    :vars
    (
      ?auto_322167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322166 ?auto_322167 ) ( ON-TABLE ?auto_322163 ) ( not ( = ?auto_322163 ?auto_322164 ) ) ( not ( = ?auto_322163 ?auto_322165 ) ) ( not ( = ?auto_322163 ?auto_322166 ) ) ( not ( = ?auto_322163 ?auto_322167 ) ) ( not ( = ?auto_322164 ?auto_322165 ) ) ( not ( = ?auto_322164 ?auto_322166 ) ) ( not ( = ?auto_322164 ?auto_322167 ) ) ( not ( = ?auto_322165 ?auto_322166 ) ) ( not ( = ?auto_322165 ?auto_322167 ) ) ( not ( = ?auto_322166 ?auto_322167 ) ) ( ON ?auto_322165 ?auto_322166 ) ( CLEAR ?auto_322163 ) ( ON ?auto_322164 ?auto_322165 ) ( CLEAR ?auto_322164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_322163 ?auto_322164 )
      ( MAKE-4PILE ?auto_322163 ?auto_322164 ?auto_322165 ?auto_322166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_322181 - BLOCK
      ?auto_322182 - BLOCK
      ?auto_322183 - BLOCK
      ?auto_322184 - BLOCK
    )
    :vars
    (
      ?auto_322185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322184 ?auto_322185 ) ( not ( = ?auto_322181 ?auto_322182 ) ) ( not ( = ?auto_322181 ?auto_322183 ) ) ( not ( = ?auto_322181 ?auto_322184 ) ) ( not ( = ?auto_322181 ?auto_322185 ) ) ( not ( = ?auto_322182 ?auto_322183 ) ) ( not ( = ?auto_322182 ?auto_322184 ) ) ( not ( = ?auto_322182 ?auto_322185 ) ) ( not ( = ?auto_322183 ?auto_322184 ) ) ( not ( = ?auto_322183 ?auto_322185 ) ) ( not ( = ?auto_322184 ?auto_322185 ) ) ( ON ?auto_322183 ?auto_322184 ) ( ON ?auto_322182 ?auto_322183 ) ( ON ?auto_322181 ?auto_322182 ) ( CLEAR ?auto_322181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_322181 )
      ( MAKE-4PILE ?auto_322181 ?auto_322182 ?auto_322183 ?auto_322184 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_322200 - BLOCK
      ?auto_322201 - BLOCK
      ?auto_322202 - BLOCK
      ?auto_322203 - BLOCK
      ?auto_322204 - BLOCK
    )
    :vars
    (
      ?auto_322205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_322203 ) ( ON ?auto_322204 ?auto_322205 ) ( CLEAR ?auto_322204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_322200 ) ( ON ?auto_322201 ?auto_322200 ) ( ON ?auto_322202 ?auto_322201 ) ( ON ?auto_322203 ?auto_322202 ) ( not ( = ?auto_322200 ?auto_322201 ) ) ( not ( = ?auto_322200 ?auto_322202 ) ) ( not ( = ?auto_322200 ?auto_322203 ) ) ( not ( = ?auto_322200 ?auto_322204 ) ) ( not ( = ?auto_322200 ?auto_322205 ) ) ( not ( = ?auto_322201 ?auto_322202 ) ) ( not ( = ?auto_322201 ?auto_322203 ) ) ( not ( = ?auto_322201 ?auto_322204 ) ) ( not ( = ?auto_322201 ?auto_322205 ) ) ( not ( = ?auto_322202 ?auto_322203 ) ) ( not ( = ?auto_322202 ?auto_322204 ) ) ( not ( = ?auto_322202 ?auto_322205 ) ) ( not ( = ?auto_322203 ?auto_322204 ) ) ( not ( = ?auto_322203 ?auto_322205 ) ) ( not ( = ?auto_322204 ?auto_322205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_322204 ?auto_322205 )
      ( !STACK ?auto_322204 ?auto_322203 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_322222 - BLOCK
      ?auto_322223 - BLOCK
      ?auto_322224 - BLOCK
      ?auto_322225 - BLOCK
      ?auto_322226 - BLOCK
    )
    :vars
    (
      ?auto_322227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322226 ?auto_322227 ) ( ON-TABLE ?auto_322222 ) ( ON ?auto_322223 ?auto_322222 ) ( ON ?auto_322224 ?auto_322223 ) ( not ( = ?auto_322222 ?auto_322223 ) ) ( not ( = ?auto_322222 ?auto_322224 ) ) ( not ( = ?auto_322222 ?auto_322225 ) ) ( not ( = ?auto_322222 ?auto_322226 ) ) ( not ( = ?auto_322222 ?auto_322227 ) ) ( not ( = ?auto_322223 ?auto_322224 ) ) ( not ( = ?auto_322223 ?auto_322225 ) ) ( not ( = ?auto_322223 ?auto_322226 ) ) ( not ( = ?auto_322223 ?auto_322227 ) ) ( not ( = ?auto_322224 ?auto_322225 ) ) ( not ( = ?auto_322224 ?auto_322226 ) ) ( not ( = ?auto_322224 ?auto_322227 ) ) ( not ( = ?auto_322225 ?auto_322226 ) ) ( not ( = ?auto_322225 ?auto_322227 ) ) ( not ( = ?auto_322226 ?auto_322227 ) ) ( CLEAR ?auto_322224 ) ( ON ?auto_322225 ?auto_322226 ) ( CLEAR ?auto_322225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_322222 ?auto_322223 ?auto_322224 ?auto_322225 )
      ( MAKE-5PILE ?auto_322222 ?auto_322223 ?auto_322224 ?auto_322225 ?auto_322226 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_322244 - BLOCK
      ?auto_322245 - BLOCK
      ?auto_322246 - BLOCK
      ?auto_322247 - BLOCK
      ?auto_322248 - BLOCK
    )
    :vars
    (
      ?auto_322249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322248 ?auto_322249 ) ( ON-TABLE ?auto_322244 ) ( ON ?auto_322245 ?auto_322244 ) ( not ( = ?auto_322244 ?auto_322245 ) ) ( not ( = ?auto_322244 ?auto_322246 ) ) ( not ( = ?auto_322244 ?auto_322247 ) ) ( not ( = ?auto_322244 ?auto_322248 ) ) ( not ( = ?auto_322244 ?auto_322249 ) ) ( not ( = ?auto_322245 ?auto_322246 ) ) ( not ( = ?auto_322245 ?auto_322247 ) ) ( not ( = ?auto_322245 ?auto_322248 ) ) ( not ( = ?auto_322245 ?auto_322249 ) ) ( not ( = ?auto_322246 ?auto_322247 ) ) ( not ( = ?auto_322246 ?auto_322248 ) ) ( not ( = ?auto_322246 ?auto_322249 ) ) ( not ( = ?auto_322247 ?auto_322248 ) ) ( not ( = ?auto_322247 ?auto_322249 ) ) ( not ( = ?auto_322248 ?auto_322249 ) ) ( ON ?auto_322247 ?auto_322248 ) ( CLEAR ?auto_322245 ) ( ON ?auto_322246 ?auto_322247 ) ( CLEAR ?auto_322246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_322244 ?auto_322245 ?auto_322246 )
      ( MAKE-5PILE ?auto_322244 ?auto_322245 ?auto_322246 ?auto_322247 ?auto_322248 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_322266 - BLOCK
      ?auto_322267 - BLOCK
      ?auto_322268 - BLOCK
      ?auto_322269 - BLOCK
      ?auto_322270 - BLOCK
    )
    :vars
    (
      ?auto_322271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322270 ?auto_322271 ) ( ON-TABLE ?auto_322266 ) ( not ( = ?auto_322266 ?auto_322267 ) ) ( not ( = ?auto_322266 ?auto_322268 ) ) ( not ( = ?auto_322266 ?auto_322269 ) ) ( not ( = ?auto_322266 ?auto_322270 ) ) ( not ( = ?auto_322266 ?auto_322271 ) ) ( not ( = ?auto_322267 ?auto_322268 ) ) ( not ( = ?auto_322267 ?auto_322269 ) ) ( not ( = ?auto_322267 ?auto_322270 ) ) ( not ( = ?auto_322267 ?auto_322271 ) ) ( not ( = ?auto_322268 ?auto_322269 ) ) ( not ( = ?auto_322268 ?auto_322270 ) ) ( not ( = ?auto_322268 ?auto_322271 ) ) ( not ( = ?auto_322269 ?auto_322270 ) ) ( not ( = ?auto_322269 ?auto_322271 ) ) ( not ( = ?auto_322270 ?auto_322271 ) ) ( ON ?auto_322269 ?auto_322270 ) ( ON ?auto_322268 ?auto_322269 ) ( CLEAR ?auto_322266 ) ( ON ?auto_322267 ?auto_322268 ) ( CLEAR ?auto_322267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_322266 ?auto_322267 )
      ( MAKE-5PILE ?auto_322266 ?auto_322267 ?auto_322268 ?auto_322269 ?auto_322270 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_322288 - BLOCK
      ?auto_322289 - BLOCK
      ?auto_322290 - BLOCK
      ?auto_322291 - BLOCK
      ?auto_322292 - BLOCK
    )
    :vars
    (
      ?auto_322293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322292 ?auto_322293 ) ( not ( = ?auto_322288 ?auto_322289 ) ) ( not ( = ?auto_322288 ?auto_322290 ) ) ( not ( = ?auto_322288 ?auto_322291 ) ) ( not ( = ?auto_322288 ?auto_322292 ) ) ( not ( = ?auto_322288 ?auto_322293 ) ) ( not ( = ?auto_322289 ?auto_322290 ) ) ( not ( = ?auto_322289 ?auto_322291 ) ) ( not ( = ?auto_322289 ?auto_322292 ) ) ( not ( = ?auto_322289 ?auto_322293 ) ) ( not ( = ?auto_322290 ?auto_322291 ) ) ( not ( = ?auto_322290 ?auto_322292 ) ) ( not ( = ?auto_322290 ?auto_322293 ) ) ( not ( = ?auto_322291 ?auto_322292 ) ) ( not ( = ?auto_322291 ?auto_322293 ) ) ( not ( = ?auto_322292 ?auto_322293 ) ) ( ON ?auto_322291 ?auto_322292 ) ( ON ?auto_322290 ?auto_322291 ) ( ON ?auto_322289 ?auto_322290 ) ( ON ?auto_322288 ?auto_322289 ) ( CLEAR ?auto_322288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_322288 )
      ( MAKE-5PILE ?auto_322288 ?auto_322289 ?auto_322290 ?auto_322291 ?auto_322292 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_322311 - BLOCK
      ?auto_322312 - BLOCK
      ?auto_322313 - BLOCK
      ?auto_322314 - BLOCK
      ?auto_322315 - BLOCK
      ?auto_322316 - BLOCK
    )
    :vars
    (
      ?auto_322317 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_322315 ) ( ON ?auto_322316 ?auto_322317 ) ( CLEAR ?auto_322316 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_322311 ) ( ON ?auto_322312 ?auto_322311 ) ( ON ?auto_322313 ?auto_322312 ) ( ON ?auto_322314 ?auto_322313 ) ( ON ?auto_322315 ?auto_322314 ) ( not ( = ?auto_322311 ?auto_322312 ) ) ( not ( = ?auto_322311 ?auto_322313 ) ) ( not ( = ?auto_322311 ?auto_322314 ) ) ( not ( = ?auto_322311 ?auto_322315 ) ) ( not ( = ?auto_322311 ?auto_322316 ) ) ( not ( = ?auto_322311 ?auto_322317 ) ) ( not ( = ?auto_322312 ?auto_322313 ) ) ( not ( = ?auto_322312 ?auto_322314 ) ) ( not ( = ?auto_322312 ?auto_322315 ) ) ( not ( = ?auto_322312 ?auto_322316 ) ) ( not ( = ?auto_322312 ?auto_322317 ) ) ( not ( = ?auto_322313 ?auto_322314 ) ) ( not ( = ?auto_322313 ?auto_322315 ) ) ( not ( = ?auto_322313 ?auto_322316 ) ) ( not ( = ?auto_322313 ?auto_322317 ) ) ( not ( = ?auto_322314 ?auto_322315 ) ) ( not ( = ?auto_322314 ?auto_322316 ) ) ( not ( = ?auto_322314 ?auto_322317 ) ) ( not ( = ?auto_322315 ?auto_322316 ) ) ( not ( = ?auto_322315 ?auto_322317 ) ) ( not ( = ?auto_322316 ?auto_322317 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_322316 ?auto_322317 )
      ( !STACK ?auto_322316 ?auto_322315 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_322337 - BLOCK
      ?auto_322338 - BLOCK
      ?auto_322339 - BLOCK
      ?auto_322340 - BLOCK
      ?auto_322341 - BLOCK
      ?auto_322342 - BLOCK
    )
    :vars
    (
      ?auto_322343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322342 ?auto_322343 ) ( ON-TABLE ?auto_322337 ) ( ON ?auto_322338 ?auto_322337 ) ( ON ?auto_322339 ?auto_322338 ) ( ON ?auto_322340 ?auto_322339 ) ( not ( = ?auto_322337 ?auto_322338 ) ) ( not ( = ?auto_322337 ?auto_322339 ) ) ( not ( = ?auto_322337 ?auto_322340 ) ) ( not ( = ?auto_322337 ?auto_322341 ) ) ( not ( = ?auto_322337 ?auto_322342 ) ) ( not ( = ?auto_322337 ?auto_322343 ) ) ( not ( = ?auto_322338 ?auto_322339 ) ) ( not ( = ?auto_322338 ?auto_322340 ) ) ( not ( = ?auto_322338 ?auto_322341 ) ) ( not ( = ?auto_322338 ?auto_322342 ) ) ( not ( = ?auto_322338 ?auto_322343 ) ) ( not ( = ?auto_322339 ?auto_322340 ) ) ( not ( = ?auto_322339 ?auto_322341 ) ) ( not ( = ?auto_322339 ?auto_322342 ) ) ( not ( = ?auto_322339 ?auto_322343 ) ) ( not ( = ?auto_322340 ?auto_322341 ) ) ( not ( = ?auto_322340 ?auto_322342 ) ) ( not ( = ?auto_322340 ?auto_322343 ) ) ( not ( = ?auto_322341 ?auto_322342 ) ) ( not ( = ?auto_322341 ?auto_322343 ) ) ( not ( = ?auto_322342 ?auto_322343 ) ) ( CLEAR ?auto_322340 ) ( ON ?auto_322341 ?auto_322342 ) ( CLEAR ?auto_322341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_322337 ?auto_322338 ?auto_322339 ?auto_322340 ?auto_322341 )
      ( MAKE-6PILE ?auto_322337 ?auto_322338 ?auto_322339 ?auto_322340 ?auto_322341 ?auto_322342 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_322363 - BLOCK
      ?auto_322364 - BLOCK
      ?auto_322365 - BLOCK
      ?auto_322366 - BLOCK
      ?auto_322367 - BLOCK
      ?auto_322368 - BLOCK
    )
    :vars
    (
      ?auto_322369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322368 ?auto_322369 ) ( ON-TABLE ?auto_322363 ) ( ON ?auto_322364 ?auto_322363 ) ( ON ?auto_322365 ?auto_322364 ) ( not ( = ?auto_322363 ?auto_322364 ) ) ( not ( = ?auto_322363 ?auto_322365 ) ) ( not ( = ?auto_322363 ?auto_322366 ) ) ( not ( = ?auto_322363 ?auto_322367 ) ) ( not ( = ?auto_322363 ?auto_322368 ) ) ( not ( = ?auto_322363 ?auto_322369 ) ) ( not ( = ?auto_322364 ?auto_322365 ) ) ( not ( = ?auto_322364 ?auto_322366 ) ) ( not ( = ?auto_322364 ?auto_322367 ) ) ( not ( = ?auto_322364 ?auto_322368 ) ) ( not ( = ?auto_322364 ?auto_322369 ) ) ( not ( = ?auto_322365 ?auto_322366 ) ) ( not ( = ?auto_322365 ?auto_322367 ) ) ( not ( = ?auto_322365 ?auto_322368 ) ) ( not ( = ?auto_322365 ?auto_322369 ) ) ( not ( = ?auto_322366 ?auto_322367 ) ) ( not ( = ?auto_322366 ?auto_322368 ) ) ( not ( = ?auto_322366 ?auto_322369 ) ) ( not ( = ?auto_322367 ?auto_322368 ) ) ( not ( = ?auto_322367 ?auto_322369 ) ) ( not ( = ?auto_322368 ?auto_322369 ) ) ( ON ?auto_322367 ?auto_322368 ) ( CLEAR ?auto_322365 ) ( ON ?auto_322366 ?auto_322367 ) ( CLEAR ?auto_322366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_322363 ?auto_322364 ?auto_322365 ?auto_322366 )
      ( MAKE-6PILE ?auto_322363 ?auto_322364 ?auto_322365 ?auto_322366 ?auto_322367 ?auto_322368 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_322389 - BLOCK
      ?auto_322390 - BLOCK
      ?auto_322391 - BLOCK
      ?auto_322392 - BLOCK
      ?auto_322393 - BLOCK
      ?auto_322394 - BLOCK
    )
    :vars
    (
      ?auto_322395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322394 ?auto_322395 ) ( ON-TABLE ?auto_322389 ) ( ON ?auto_322390 ?auto_322389 ) ( not ( = ?auto_322389 ?auto_322390 ) ) ( not ( = ?auto_322389 ?auto_322391 ) ) ( not ( = ?auto_322389 ?auto_322392 ) ) ( not ( = ?auto_322389 ?auto_322393 ) ) ( not ( = ?auto_322389 ?auto_322394 ) ) ( not ( = ?auto_322389 ?auto_322395 ) ) ( not ( = ?auto_322390 ?auto_322391 ) ) ( not ( = ?auto_322390 ?auto_322392 ) ) ( not ( = ?auto_322390 ?auto_322393 ) ) ( not ( = ?auto_322390 ?auto_322394 ) ) ( not ( = ?auto_322390 ?auto_322395 ) ) ( not ( = ?auto_322391 ?auto_322392 ) ) ( not ( = ?auto_322391 ?auto_322393 ) ) ( not ( = ?auto_322391 ?auto_322394 ) ) ( not ( = ?auto_322391 ?auto_322395 ) ) ( not ( = ?auto_322392 ?auto_322393 ) ) ( not ( = ?auto_322392 ?auto_322394 ) ) ( not ( = ?auto_322392 ?auto_322395 ) ) ( not ( = ?auto_322393 ?auto_322394 ) ) ( not ( = ?auto_322393 ?auto_322395 ) ) ( not ( = ?auto_322394 ?auto_322395 ) ) ( ON ?auto_322393 ?auto_322394 ) ( ON ?auto_322392 ?auto_322393 ) ( CLEAR ?auto_322390 ) ( ON ?auto_322391 ?auto_322392 ) ( CLEAR ?auto_322391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_322389 ?auto_322390 ?auto_322391 )
      ( MAKE-6PILE ?auto_322389 ?auto_322390 ?auto_322391 ?auto_322392 ?auto_322393 ?auto_322394 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_322415 - BLOCK
      ?auto_322416 - BLOCK
      ?auto_322417 - BLOCK
      ?auto_322418 - BLOCK
      ?auto_322419 - BLOCK
      ?auto_322420 - BLOCK
    )
    :vars
    (
      ?auto_322421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322420 ?auto_322421 ) ( ON-TABLE ?auto_322415 ) ( not ( = ?auto_322415 ?auto_322416 ) ) ( not ( = ?auto_322415 ?auto_322417 ) ) ( not ( = ?auto_322415 ?auto_322418 ) ) ( not ( = ?auto_322415 ?auto_322419 ) ) ( not ( = ?auto_322415 ?auto_322420 ) ) ( not ( = ?auto_322415 ?auto_322421 ) ) ( not ( = ?auto_322416 ?auto_322417 ) ) ( not ( = ?auto_322416 ?auto_322418 ) ) ( not ( = ?auto_322416 ?auto_322419 ) ) ( not ( = ?auto_322416 ?auto_322420 ) ) ( not ( = ?auto_322416 ?auto_322421 ) ) ( not ( = ?auto_322417 ?auto_322418 ) ) ( not ( = ?auto_322417 ?auto_322419 ) ) ( not ( = ?auto_322417 ?auto_322420 ) ) ( not ( = ?auto_322417 ?auto_322421 ) ) ( not ( = ?auto_322418 ?auto_322419 ) ) ( not ( = ?auto_322418 ?auto_322420 ) ) ( not ( = ?auto_322418 ?auto_322421 ) ) ( not ( = ?auto_322419 ?auto_322420 ) ) ( not ( = ?auto_322419 ?auto_322421 ) ) ( not ( = ?auto_322420 ?auto_322421 ) ) ( ON ?auto_322419 ?auto_322420 ) ( ON ?auto_322418 ?auto_322419 ) ( ON ?auto_322417 ?auto_322418 ) ( CLEAR ?auto_322415 ) ( ON ?auto_322416 ?auto_322417 ) ( CLEAR ?auto_322416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_322415 ?auto_322416 )
      ( MAKE-6PILE ?auto_322415 ?auto_322416 ?auto_322417 ?auto_322418 ?auto_322419 ?auto_322420 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_322441 - BLOCK
      ?auto_322442 - BLOCK
      ?auto_322443 - BLOCK
      ?auto_322444 - BLOCK
      ?auto_322445 - BLOCK
      ?auto_322446 - BLOCK
    )
    :vars
    (
      ?auto_322447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322446 ?auto_322447 ) ( not ( = ?auto_322441 ?auto_322442 ) ) ( not ( = ?auto_322441 ?auto_322443 ) ) ( not ( = ?auto_322441 ?auto_322444 ) ) ( not ( = ?auto_322441 ?auto_322445 ) ) ( not ( = ?auto_322441 ?auto_322446 ) ) ( not ( = ?auto_322441 ?auto_322447 ) ) ( not ( = ?auto_322442 ?auto_322443 ) ) ( not ( = ?auto_322442 ?auto_322444 ) ) ( not ( = ?auto_322442 ?auto_322445 ) ) ( not ( = ?auto_322442 ?auto_322446 ) ) ( not ( = ?auto_322442 ?auto_322447 ) ) ( not ( = ?auto_322443 ?auto_322444 ) ) ( not ( = ?auto_322443 ?auto_322445 ) ) ( not ( = ?auto_322443 ?auto_322446 ) ) ( not ( = ?auto_322443 ?auto_322447 ) ) ( not ( = ?auto_322444 ?auto_322445 ) ) ( not ( = ?auto_322444 ?auto_322446 ) ) ( not ( = ?auto_322444 ?auto_322447 ) ) ( not ( = ?auto_322445 ?auto_322446 ) ) ( not ( = ?auto_322445 ?auto_322447 ) ) ( not ( = ?auto_322446 ?auto_322447 ) ) ( ON ?auto_322445 ?auto_322446 ) ( ON ?auto_322444 ?auto_322445 ) ( ON ?auto_322443 ?auto_322444 ) ( ON ?auto_322442 ?auto_322443 ) ( ON ?auto_322441 ?auto_322442 ) ( CLEAR ?auto_322441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_322441 )
      ( MAKE-6PILE ?auto_322441 ?auto_322442 ?auto_322443 ?auto_322444 ?auto_322445 ?auto_322446 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_322468 - BLOCK
      ?auto_322469 - BLOCK
      ?auto_322470 - BLOCK
      ?auto_322471 - BLOCK
      ?auto_322472 - BLOCK
      ?auto_322473 - BLOCK
      ?auto_322474 - BLOCK
    )
    :vars
    (
      ?auto_322475 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_322473 ) ( ON ?auto_322474 ?auto_322475 ) ( CLEAR ?auto_322474 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_322468 ) ( ON ?auto_322469 ?auto_322468 ) ( ON ?auto_322470 ?auto_322469 ) ( ON ?auto_322471 ?auto_322470 ) ( ON ?auto_322472 ?auto_322471 ) ( ON ?auto_322473 ?auto_322472 ) ( not ( = ?auto_322468 ?auto_322469 ) ) ( not ( = ?auto_322468 ?auto_322470 ) ) ( not ( = ?auto_322468 ?auto_322471 ) ) ( not ( = ?auto_322468 ?auto_322472 ) ) ( not ( = ?auto_322468 ?auto_322473 ) ) ( not ( = ?auto_322468 ?auto_322474 ) ) ( not ( = ?auto_322468 ?auto_322475 ) ) ( not ( = ?auto_322469 ?auto_322470 ) ) ( not ( = ?auto_322469 ?auto_322471 ) ) ( not ( = ?auto_322469 ?auto_322472 ) ) ( not ( = ?auto_322469 ?auto_322473 ) ) ( not ( = ?auto_322469 ?auto_322474 ) ) ( not ( = ?auto_322469 ?auto_322475 ) ) ( not ( = ?auto_322470 ?auto_322471 ) ) ( not ( = ?auto_322470 ?auto_322472 ) ) ( not ( = ?auto_322470 ?auto_322473 ) ) ( not ( = ?auto_322470 ?auto_322474 ) ) ( not ( = ?auto_322470 ?auto_322475 ) ) ( not ( = ?auto_322471 ?auto_322472 ) ) ( not ( = ?auto_322471 ?auto_322473 ) ) ( not ( = ?auto_322471 ?auto_322474 ) ) ( not ( = ?auto_322471 ?auto_322475 ) ) ( not ( = ?auto_322472 ?auto_322473 ) ) ( not ( = ?auto_322472 ?auto_322474 ) ) ( not ( = ?auto_322472 ?auto_322475 ) ) ( not ( = ?auto_322473 ?auto_322474 ) ) ( not ( = ?auto_322473 ?auto_322475 ) ) ( not ( = ?auto_322474 ?auto_322475 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_322474 ?auto_322475 )
      ( !STACK ?auto_322474 ?auto_322473 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_322498 - BLOCK
      ?auto_322499 - BLOCK
      ?auto_322500 - BLOCK
      ?auto_322501 - BLOCK
      ?auto_322502 - BLOCK
      ?auto_322503 - BLOCK
      ?auto_322504 - BLOCK
    )
    :vars
    (
      ?auto_322505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322504 ?auto_322505 ) ( ON-TABLE ?auto_322498 ) ( ON ?auto_322499 ?auto_322498 ) ( ON ?auto_322500 ?auto_322499 ) ( ON ?auto_322501 ?auto_322500 ) ( ON ?auto_322502 ?auto_322501 ) ( not ( = ?auto_322498 ?auto_322499 ) ) ( not ( = ?auto_322498 ?auto_322500 ) ) ( not ( = ?auto_322498 ?auto_322501 ) ) ( not ( = ?auto_322498 ?auto_322502 ) ) ( not ( = ?auto_322498 ?auto_322503 ) ) ( not ( = ?auto_322498 ?auto_322504 ) ) ( not ( = ?auto_322498 ?auto_322505 ) ) ( not ( = ?auto_322499 ?auto_322500 ) ) ( not ( = ?auto_322499 ?auto_322501 ) ) ( not ( = ?auto_322499 ?auto_322502 ) ) ( not ( = ?auto_322499 ?auto_322503 ) ) ( not ( = ?auto_322499 ?auto_322504 ) ) ( not ( = ?auto_322499 ?auto_322505 ) ) ( not ( = ?auto_322500 ?auto_322501 ) ) ( not ( = ?auto_322500 ?auto_322502 ) ) ( not ( = ?auto_322500 ?auto_322503 ) ) ( not ( = ?auto_322500 ?auto_322504 ) ) ( not ( = ?auto_322500 ?auto_322505 ) ) ( not ( = ?auto_322501 ?auto_322502 ) ) ( not ( = ?auto_322501 ?auto_322503 ) ) ( not ( = ?auto_322501 ?auto_322504 ) ) ( not ( = ?auto_322501 ?auto_322505 ) ) ( not ( = ?auto_322502 ?auto_322503 ) ) ( not ( = ?auto_322502 ?auto_322504 ) ) ( not ( = ?auto_322502 ?auto_322505 ) ) ( not ( = ?auto_322503 ?auto_322504 ) ) ( not ( = ?auto_322503 ?auto_322505 ) ) ( not ( = ?auto_322504 ?auto_322505 ) ) ( CLEAR ?auto_322502 ) ( ON ?auto_322503 ?auto_322504 ) ( CLEAR ?auto_322503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_322498 ?auto_322499 ?auto_322500 ?auto_322501 ?auto_322502 ?auto_322503 )
      ( MAKE-7PILE ?auto_322498 ?auto_322499 ?auto_322500 ?auto_322501 ?auto_322502 ?auto_322503 ?auto_322504 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_322528 - BLOCK
      ?auto_322529 - BLOCK
      ?auto_322530 - BLOCK
      ?auto_322531 - BLOCK
      ?auto_322532 - BLOCK
      ?auto_322533 - BLOCK
      ?auto_322534 - BLOCK
    )
    :vars
    (
      ?auto_322535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322534 ?auto_322535 ) ( ON-TABLE ?auto_322528 ) ( ON ?auto_322529 ?auto_322528 ) ( ON ?auto_322530 ?auto_322529 ) ( ON ?auto_322531 ?auto_322530 ) ( not ( = ?auto_322528 ?auto_322529 ) ) ( not ( = ?auto_322528 ?auto_322530 ) ) ( not ( = ?auto_322528 ?auto_322531 ) ) ( not ( = ?auto_322528 ?auto_322532 ) ) ( not ( = ?auto_322528 ?auto_322533 ) ) ( not ( = ?auto_322528 ?auto_322534 ) ) ( not ( = ?auto_322528 ?auto_322535 ) ) ( not ( = ?auto_322529 ?auto_322530 ) ) ( not ( = ?auto_322529 ?auto_322531 ) ) ( not ( = ?auto_322529 ?auto_322532 ) ) ( not ( = ?auto_322529 ?auto_322533 ) ) ( not ( = ?auto_322529 ?auto_322534 ) ) ( not ( = ?auto_322529 ?auto_322535 ) ) ( not ( = ?auto_322530 ?auto_322531 ) ) ( not ( = ?auto_322530 ?auto_322532 ) ) ( not ( = ?auto_322530 ?auto_322533 ) ) ( not ( = ?auto_322530 ?auto_322534 ) ) ( not ( = ?auto_322530 ?auto_322535 ) ) ( not ( = ?auto_322531 ?auto_322532 ) ) ( not ( = ?auto_322531 ?auto_322533 ) ) ( not ( = ?auto_322531 ?auto_322534 ) ) ( not ( = ?auto_322531 ?auto_322535 ) ) ( not ( = ?auto_322532 ?auto_322533 ) ) ( not ( = ?auto_322532 ?auto_322534 ) ) ( not ( = ?auto_322532 ?auto_322535 ) ) ( not ( = ?auto_322533 ?auto_322534 ) ) ( not ( = ?auto_322533 ?auto_322535 ) ) ( not ( = ?auto_322534 ?auto_322535 ) ) ( ON ?auto_322533 ?auto_322534 ) ( CLEAR ?auto_322531 ) ( ON ?auto_322532 ?auto_322533 ) ( CLEAR ?auto_322532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_322528 ?auto_322529 ?auto_322530 ?auto_322531 ?auto_322532 )
      ( MAKE-7PILE ?auto_322528 ?auto_322529 ?auto_322530 ?auto_322531 ?auto_322532 ?auto_322533 ?auto_322534 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_322558 - BLOCK
      ?auto_322559 - BLOCK
      ?auto_322560 - BLOCK
      ?auto_322561 - BLOCK
      ?auto_322562 - BLOCK
      ?auto_322563 - BLOCK
      ?auto_322564 - BLOCK
    )
    :vars
    (
      ?auto_322565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322564 ?auto_322565 ) ( ON-TABLE ?auto_322558 ) ( ON ?auto_322559 ?auto_322558 ) ( ON ?auto_322560 ?auto_322559 ) ( not ( = ?auto_322558 ?auto_322559 ) ) ( not ( = ?auto_322558 ?auto_322560 ) ) ( not ( = ?auto_322558 ?auto_322561 ) ) ( not ( = ?auto_322558 ?auto_322562 ) ) ( not ( = ?auto_322558 ?auto_322563 ) ) ( not ( = ?auto_322558 ?auto_322564 ) ) ( not ( = ?auto_322558 ?auto_322565 ) ) ( not ( = ?auto_322559 ?auto_322560 ) ) ( not ( = ?auto_322559 ?auto_322561 ) ) ( not ( = ?auto_322559 ?auto_322562 ) ) ( not ( = ?auto_322559 ?auto_322563 ) ) ( not ( = ?auto_322559 ?auto_322564 ) ) ( not ( = ?auto_322559 ?auto_322565 ) ) ( not ( = ?auto_322560 ?auto_322561 ) ) ( not ( = ?auto_322560 ?auto_322562 ) ) ( not ( = ?auto_322560 ?auto_322563 ) ) ( not ( = ?auto_322560 ?auto_322564 ) ) ( not ( = ?auto_322560 ?auto_322565 ) ) ( not ( = ?auto_322561 ?auto_322562 ) ) ( not ( = ?auto_322561 ?auto_322563 ) ) ( not ( = ?auto_322561 ?auto_322564 ) ) ( not ( = ?auto_322561 ?auto_322565 ) ) ( not ( = ?auto_322562 ?auto_322563 ) ) ( not ( = ?auto_322562 ?auto_322564 ) ) ( not ( = ?auto_322562 ?auto_322565 ) ) ( not ( = ?auto_322563 ?auto_322564 ) ) ( not ( = ?auto_322563 ?auto_322565 ) ) ( not ( = ?auto_322564 ?auto_322565 ) ) ( ON ?auto_322563 ?auto_322564 ) ( ON ?auto_322562 ?auto_322563 ) ( CLEAR ?auto_322560 ) ( ON ?auto_322561 ?auto_322562 ) ( CLEAR ?auto_322561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_322558 ?auto_322559 ?auto_322560 ?auto_322561 )
      ( MAKE-7PILE ?auto_322558 ?auto_322559 ?auto_322560 ?auto_322561 ?auto_322562 ?auto_322563 ?auto_322564 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_322588 - BLOCK
      ?auto_322589 - BLOCK
      ?auto_322590 - BLOCK
      ?auto_322591 - BLOCK
      ?auto_322592 - BLOCK
      ?auto_322593 - BLOCK
      ?auto_322594 - BLOCK
    )
    :vars
    (
      ?auto_322595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322594 ?auto_322595 ) ( ON-TABLE ?auto_322588 ) ( ON ?auto_322589 ?auto_322588 ) ( not ( = ?auto_322588 ?auto_322589 ) ) ( not ( = ?auto_322588 ?auto_322590 ) ) ( not ( = ?auto_322588 ?auto_322591 ) ) ( not ( = ?auto_322588 ?auto_322592 ) ) ( not ( = ?auto_322588 ?auto_322593 ) ) ( not ( = ?auto_322588 ?auto_322594 ) ) ( not ( = ?auto_322588 ?auto_322595 ) ) ( not ( = ?auto_322589 ?auto_322590 ) ) ( not ( = ?auto_322589 ?auto_322591 ) ) ( not ( = ?auto_322589 ?auto_322592 ) ) ( not ( = ?auto_322589 ?auto_322593 ) ) ( not ( = ?auto_322589 ?auto_322594 ) ) ( not ( = ?auto_322589 ?auto_322595 ) ) ( not ( = ?auto_322590 ?auto_322591 ) ) ( not ( = ?auto_322590 ?auto_322592 ) ) ( not ( = ?auto_322590 ?auto_322593 ) ) ( not ( = ?auto_322590 ?auto_322594 ) ) ( not ( = ?auto_322590 ?auto_322595 ) ) ( not ( = ?auto_322591 ?auto_322592 ) ) ( not ( = ?auto_322591 ?auto_322593 ) ) ( not ( = ?auto_322591 ?auto_322594 ) ) ( not ( = ?auto_322591 ?auto_322595 ) ) ( not ( = ?auto_322592 ?auto_322593 ) ) ( not ( = ?auto_322592 ?auto_322594 ) ) ( not ( = ?auto_322592 ?auto_322595 ) ) ( not ( = ?auto_322593 ?auto_322594 ) ) ( not ( = ?auto_322593 ?auto_322595 ) ) ( not ( = ?auto_322594 ?auto_322595 ) ) ( ON ?auto_322593 ?auto_322594 ) ( ON ?auto_322592 ?auto_322593 ) ( ON ?auto_322591 ?auto_322592 ) ( CLEAR ?auto_322589 ) ( ON ?auto_322590 ?auto_322591 ) ( CLEAR ?auto_322590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_322588 ?auto_322589 ?auto_322590 )
      ( MAKE-7PILE ?auto_322588 ?auto_322589 ?auto_322590 ?auto_322591 ?auto_322592 ?auto_322593 ?auto_322594 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_322618 - BLOCK
      ?auto_322619 - BLOCK
      ?auto_322620 - BLOCK
      ?auto_322621 - BLOCK
      ?auto_322622 - BLOCK
      ?auto_322623 - BLOCK
      ?auto_322624 - BLOCK
    )
    :vars
    (
      ?auto_322625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322624 ?auto_322625 ) ( ON-TABLE ?auto_322618 ) ( not ( = ?auto_322618 ?auto_322619 ) ) ( not ( = ?auto_322618 ?auto_322620 ) ) ( not ( = ?auto_322618 ?auto_322621 ) ) ( not ( = ?auto_322618 ?auto_322622 ) ) ( not ( = ?auto_322618 ?auto_322623 ) ) ( not ( = ?auto_322618 ?auto_322624 ) ) ( not ( = ?auto_322618 ?auto_322625 ) ) ( not ( = ?auto_322619 ?auto_322620 ) ) ( not ( = ?auto_322619 ?auto_322621 ) ) ( not ( = ?auto_322619 ?auto_322622 ) ) ( not ( = ?auto_322619 ?auto_322623 ) ) ( not ( = ?auto_322619 ?auto_322624 ) ) ( not ( = ?auto_322619 ?auto_322625 ) ) ( not ( = ?auto_322620 ?auto_322621 ) ) ( not ( = ?auto_322620 ?auto_322622 ) ) ( not ( = ?auto_322620 ?auto_322623 ) ) ( not ( = ?auto_322620 ?auto_322624 ) ) ( not ( = ?auto_322620 ?auto_322625 ) ) ( not ( = ?auto_322621 ?auto_322622 ) ) ( not ( = ?auto_322621 ?auto_322623 ) ) ( not ( = ?auto_322621 ?auto_322624 ) ) ( not ( = ?auto_322621 ?auto_322625 ) ) ( not ( = ?auto_322622 ?auto_322623 ) ) ( not ( = ?auto_322622 ?auto_322624 ) ) ( not ( = ?auto_322622 ?auto_322625 ) ) ( not ( = ?auto_322623 ?auto_322624 ) ) ( not ( = ?auto_322623 ?auto_322625 ) ) ( not ( = ?auto_322624 ?auto_322625 ) ) ( ON ?auto_322623 ?auto_322624 ) ( ON ?auto_322622 ?auto_322623 ) ( ON ?auto_322621 ?auto_322622 ) ( ON ?auto_322620 ?auto_322621 ) ( CLEAR ?auto_322618 ) ( ON ?auto_322619 ?auto_322620 ) ( CLEAR ?auto_322619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_322618 ?auto_322619 )
      ( MAKE-7PILE ?auto_322618 ?auto_322619 ?auto_322620 ?auto_322621 ?auto_322622 ?auto_322623 ?auto_322624 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_322648 - BLOCK
      ?auto_322649 - BLOCK
      ?auto_322650 - BLOCK
      ?auto_322651 - BLOCK
      ?auto_322652 - BLOCK
      ?auto_322653 - BLOCK
      ?auto_322654 - BLOCK
    )
    :vars
    (
      ?auto_322655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322654 ?auto_322655 ) ( not ( = ?auto_322648 ?auto_322649 ) ) ( not ( = ?auto_322648 ?auto_322650 ) ) ( not ( = ?auto_322648 ?auto_322651 ) ) ( not ( = ?auto_322648 ?auto_322652 ) ) ( not ( = ?auto_322648 ?auto_322653 ) ) ( not ( = ?auto_322648 ?auto_322654 ) ) ( not ( = ?auto_322648 ?auto_322655 ) ) ( not ( = ?auto_322649 ?auto_322650 ) ) ( not ( = ?auto_322649 ?auto_322651 ) ) ( not ( = ?auto_322649 ?auto_322652 ) ) ( not ( = ?auto_322649 ?auto_322653 ) ) ( not ( = ?auto_322649 ?auto_322654 ) ) ( not ( = ?auto_322649 ?auto_322655 ) ) ( not ( = ?auto_322650 ?auto_322651 ) ) ( not ( = ?auto_322650 ?auto_322652 ) ) ( not ( = ?auto_322650 ?auto_322653 ) ) ( not ( = ?auto_322650 ?auto_322654 ) ) ( not ( = ?auto_322650 ?auto_322655 ) ) ( not ( = ?auto_322651 ?auto_322652 ) ) ( not ( = ?auto_322651 ?auto_322653 ) ) ( not ( = ?auto_322651 ?auto_322654 ) ) ( not ( = ?auto_322651 ?auto_322655 ) ) ( not ( = ?auto_322652 ?auto_322653 ) ) ( not ( = ?auto_322652 ?auto_322654 ) ) ( not ( = ?auto_322652 ?auto_322655 ) ) ( not ( = ?auto_322653 ?auto_322654 ) ) ( not ( = ?auto_322653 ?auto_322655 ) ) ( not ( = ?auto_322654 ?auto_322655 ) ) ( ON ?auto_322653 ?auto_322654 ) ( ON ?auto_322652 ?auto_322653 ) ( ON ?auto_322651 ?auto_322652 ) ( ON ?auto_322650 ?auto_322651 ) ( ON ?auto_322649 ?auto_322650 ) ( ON ?auto_322648 ?auto_322649 ) ( CLEAR ?auto_322648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_322648 )
      ( MAKE-7PILE ?auto_322648 ?auto_322649 ?auto_322650 ?auto_322651 ?auto_322652 ?auto_322653 ?auto_322654 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_322679 - BLOCK
      ?auto_322680 - BLOCK
      ?auto_322681 - BLOCK
      ?auto_322682 - BLOCK
      ?auto_322683 - BLOCK
      ?auto_322684 - BLOCK
      ?auto_322685 - BLOCK
      ?auto_322686 - BLOCK
    )
    :vars
    (
      ?auto_322687 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_322685 ) ( ON ?auto_322686 ?auto_322687 ) ( CLEAR ?auto_322686 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_322679 ) ( ON ?auto_322680 ?auto_322679 ) ( ON ?auto_322681 ?auto_322680 ) ( ON ?auto_322682 ?auto_322681 ) ( ON ?auto_322683 ?auto_322682 ) ( ON ?auto_322684 ?auto_322683 ) ( ON ?auto_322685 ?auto_322684 ) ( not ( = ?auto_322679 ?auto_322680 ) ) ( not ( = ?auto_322679 ?auto_322681 ) ) ( not ( = ?auto_322679 ?auto_322682 ) ) ( not ( = ?auto_322679 ?auto_322683 ) ) ( not ( = ?auto_322679 ?auto_322684 ) ) ( not ( = ?auto_322679 ?auto_322685 ) ) ( not ( = ?auto_322679 ?auto_322686 ) ) ( not ( = ?auto_322679 ?auto_322687 ) ) ( not ( = ?auto_322680 ?auto_322681 ) ) ( not ( = ?auto_322680 ?auto_322682 ) ) ( not ( = ?auto_322680 ?auto_322683 ) ) ( not ( = ?auto_322680 ?auto_322684 ) ) ( not ( = ?auto_322680 ?auto_322685 ) ) ( not ( = ?auto_322680 ?auto_322686 ) ) ( not ( = ?auto_322680 ?auto_322687 ) ) ( not ( = ?auto_322681 ?auto_322682 ) ) ( not ( = ?auto_322681 ?auto_322683 ) ) ( not ( = ?auto_322681 ?auto_322684 ) ) ( not ( = ?auto_322681 ?auto_322685 ) ) ( not ( = ?auto_322681 ?auto_322686 ) ) ( not ( = ?auto_322681 ?auto_322687 ) ) ( not ( = ?auto_322682 ?auto_322683 ) ) ( not ( = ?auto_322682 ?auto_322684 ) ) ( not ( = ?auto_322682 ?auto_322685 ) ) ( not ( = ?auto_322682 ?auto_322686 ) ) ( not ( = ?auto_322682 ?auto_322687 ) ) ( not ( = ?auto_322683 ?auto_322684 ) ) ( not ( = ?auto_322683 ?auto_322685 ) ) ( not ( = ?auto_322683 ?auto_322686 ) ) ( not ( = ?auto_322683 ?auto_322687 ) ) ( not ( = ?auto_322684 ?auto_322685 ) ) ( not ( = ?auto_322684 ?auto_322686 ) ) ( not ( = ?auto_322684 ?auto_322687 ) ) ( not ( = ?auto_322685 ?auto_322686 ) ) ( not ( = ?auto_322685 ?auto_322687 ) ) ( not ( = ?auto_322686 ?auto_322687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_322686 ?auto_322687 )
      ( !STACK ?auto_322686 ?auto_322685 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_322713 - BLOCK
      ?auto_322714 - BLOCK
      ?auto_322715 - BLOCK
      ?auto_322716 - BLOCK
      ?auto_322717 - BLOCK
      ?auto_322718 - BLOCK
      ?auto_322719 - BLOCK
      ?auto_322720 - BLOCK
    )
    :vars
    (
      ?auto_322721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322720 ?auto_322721 ) ( ON-TABLE ?auto_322713 ) ( ON ?auto_322714 ?auto_322713 ) ( ON ?auto_322715 ?auto_322714 ) ( ON ?auto_322716 ?auto_322715 ) ( ON ?auto_322717 ?auto_322716 ) ( ON ?auto_322718 ?auto_322717 ) ( not ( = ?auto_322713 ?auto_322714 ) ) ( not ( = ?auto_322713 ?auto_322715 ) ) ( not ( = ?auto_322713 ?auto_322716 ) ) ( not ( = ?auto_322713 ?auto_322717 ) ) ( not ( = ?auto_322713 ?auto_322718 ) ) ( not ( = ?auto_322713 ?auto_322719 ) ) ( not ( = ?auto_322713 ?auto_322720 ) ) ( not ( = ?auto_322713 ?auto_322721 ) ) ( not ( = ?auto_322714 ?auto_322715 ) ) ( not ( = ?auto_322714 ?auto_322716 ) ) ( not ( = ?auto_322714 ?auto_322717 ) ) ( not ( = ?auto_322714 ?auto_322718 ) ) ( not ( = ?auto_322714 ?auto_322719 ) ) ( not ( = ?auto_322714 ?auto_322720 ) ) ( not ( = ?auto_322714 ?auto_322721 ) ) ( not ( = ?auto_322715 ?auto_322716 ) ) ( not ( = ?auto_322715 ?auto_322717 ) ) ( not ( = ?auto_322715 ?auto_322718 ) ) ( not ( = ?auto_322715 ?auto_322719 ) ) ( not ( = ?auto_322715 ?auto_322720 ) ) ( not ( = ?auto_322715 ?auto_322721 ) ) ( not ( = ?auto_322716 ?auto_322717 ) ) ( not ( = ?auto_322716 ?auto_322718 ) ) ( not ( = ?auto_322716 ?auto_322719 ) ) ( not ( = ?auto_322716 ?auto_322720 ) ) ( not ( = ?auto_322716 ?auto_322721 ) ) ( not ( = ?auto_322717 ?auto_322718 ) ) ( not ( = ?auto_322717 ?auto_322719 ) ) ( not ( = ?auto_322717 ?auto_322720 ) ) ( not ( = ?auto_322717 ?auto_322721 ) ) ( not ( = ?auto_322718 ?auto_322719 ) ) ( not ( = ?auto_322718 ?auto_322720 ) ) ( not ( = ?auto_322718 ?auto_322721 ) ) ( not ( = ?auto_322719 ?auto_322720 ) ) ( not ( = ?auto_322719 ?auto_322721 ) ) ( not ( = ?auto_322720 ?auto_322721 ) ) ( CLEAR ?auto_322718 ) ( ON ?auto_322719 ?auto_322720 ) ( CLEAR ?auto_322719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_322713 ?auto_322714 ?auto_322715 ?auto_322716 ?auto_322717 ?auto_322718 ?auto_322719 )
      ( MAKE-8PILE ?auto_322713 ?auto_322714 ?auto_322715 ?auto_322716 ?auto_322717 ?auto_322718 ?auto_322719 ?auto_322720 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_322747 - BLOCK
      ?auto_322748 - BLOCK
      ?auto_322749 - BLOCK
      ?auto_322750 - BLOCK
      ?auto_322751 - BLOCK
      ?auto_322752 - BLOCK
      ?auto_322753 - BLOCK
      ?auto_322754 - BLOCK
    )
    :vars
    (
      ?auto_322755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322754 ?auto_322755 ) ( ON-TABLE ?auto_322747 ) ( ON ?auto_322748 ?auto_322747 ) ( ON ?auto_322749 ?auto_322748 ) ( ON ?auto_322750 ?auto_322749 ) ( ON ?auto_322751 ?auto_322750 ) ( not ( = ?auto_322747 ?auto_322748 ) ) ( not ( = ?auto_322747 ?auto_322749 ) ) ( not ( = ?auto_322747 ?auto_322750 ) ) ( not ( = ?auto_322747 ?auto_322751 ) ) ( not ( = ?auto_322747 ?auto_322752 ) ) ( not ( = ?auto_322747 ?auto_322753 ) ) ( not ( = ?auto_322747 ?auto_322754 ) ) ( not ( = ?auto_322747 ?auto_322755 ) ) ( not ( = ?auto_322748 ?auto_322749 ) ) ( not ( = ?auto_322748 ?auto_322750 ) ) ( not ( = ?auto_322748 ?auto_322751 ) ) ( not ( = ?auto_322748 ?auto_322752 ) ) ( not ( = ?auto_322748 ?auto_322753 ) ) ( not ( = ?auto_322748 ?auto_322754 ) ) ( not ( = ?auto_322748 ?auto_322755 ) ) ( not ( = ?auto_322749 ?auto_322750 ) ) ( not ( = ?auto_322749 ?auto_322751 ) ) ( not ( = ?auto_322749 ?auto_322752 ) ) ( not ( = ?auto_322749 ?auto_322753 ) ) ( not ( = ?auto_322749 ?auto_322754 ) ) ( not ( = ?auto_322749 ?auto_322755 ) ) ( not ( = ?auto_322750 ?auto_322751 ) ) ( not ( = ?auto_322750 ?auto_322752 ) ) ( not ( = ?auto_322750 ?auto_322753 ) ) ( not ( = ?auto_322750 ?auto_322754 ) ) ( not ( = ?auto_322750 ?auto_322755 ) ) ( not ( = ?auto_322751 ?auto_322752 ) ) ( not ( = ?auto_322751 ?auto_322753 ) ) ( not ( = ?auto_322751 ?auto_322754 ) ) ( not ( = ?auto_322751 ?auto_322755 ) ) ( not ( = ?auto_322752 ?auto_322753 ) ) ( not ( = ?auto_322752 ?auto_322754 ) ) ( not ( = ?auto_322752 ?auto_322755 ) ) ( not ( = ?auto_322753 ?auto_322754 ) ) ( not ( = ?auto_322753 ?auto_322755 ) ) ( not ( = ?auto_322754 ?auto_322755 ) ) ( ON ?auto_322753 ?auto_322754 ) ( CLEAR ?auto_322751 ) ( ON ?auto_322752 ?auto_322753 ) ( CLEAR ?auto_322752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_322747 ?auto_322748 ?auto_322749 ?auto_322750 ?auto_322751 ?auto_322752 )
      ( MAKE-8PILE ?auto_322747 ?auto_322748 ?auto_322749 ?auto_322750 ?auto_322751 ?auto_322752 ?auto_322753 ?auto_322754 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_322781 - BLOCK
      ?auto_322782 - BLOCK
      ?auto_322783 - BLOCK
      ?auto_322784 - BLOCK
      ?auto_322785 - BLOCK
      ?auto_322786 - BLOCK
      ?auto_322787 - BLOCK
      ?auto_322788 - BLOCK
    )
    :vars
    (
      ?auto_322789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322788 ?auto_322789 ) ( ON-TABLE ?auto_322781 ) ( ON ?auto_322782 ?auto_322781 ) ( ON ?auto_322783 ?auto_322782 ) ( ON ?auto_322784 ?auto_322783 ) ( not ( = ?auto_322781 ?auto_322782 ) ) ( not ( = ?auto_322781 ?auto_322783 ) ) ( not ( = ?auto_322781 ?auto_322784 ) ) ( not ( = ?auto_322781 ?auto_322785 ) ) ( not ( = ?auto_322781 ?auto_322786 ) ) ( not ( = ?auto_322781 ?auto_322787 ) ) ( not ( = ?auto_322781 ?auto_322788 ) ) ( not ( = ?auto_322781 ?auto_322789 ) ) ( not ( = ?auto_322782 ?auto_322783 ) ) ( not ( = ?auto_322782 ?auto_322784 ) ) ( not ( = ?auto_322782 ?auto_322785 ) ) ( not ( = ?auto_322782 ?auto_322786 ) ) ( not ( = ?auto_322782 ?auto_322787 ) ) ( not ( = ?auto_322782 ?auto_322788 ) ) ( not ( = ?auto_322782 ?auto_322789 ) ) ( not ( = ?auto_322783 ?auto_322784 ) ) ( not ( = ?auto_322783 ?auto_322785 ) ) ( not ( = ?auto_322783 ?auto_322786 ) ) ( not ( = ?auto_322783 ?auto_322787 ) ) ( not ( = ?auto_322783 ?auto_322788 ) ) ( not ( = ?auto_322783 ?auto_322789 ) ) ( not ( = ?auto_322784 ?auto_322785 ) ) ( not ( = ?auto_322784 ?auto_322786 ) ) ( not ( = ?auto_322784 ?auto_322787 ) ) ( not ( = ?auto_322784 ?auto_322788 ) ) ( not ( = ?auto_322784 ?auto_322789 ) ) ( not ( = ?auto_322785 ?auto_322786 ) ) ( not ( = ?auto_322785 ?auto_322787 ) ) ( not ( = ?auto_322785 ?auto_322788 ) ) ( not ( = ?auto_322785 ?auto_322789 ) ) ( not ( = ?auto_322786 ?auto_322787 ) ) ( not ( = ?auto_322786 ?auto_322788 ) ) ( not ( = ?auto_322786 ?auto_322789 ) ) ( not ( = ?auto_322787 ?auto_322788 ) ) ( not ( = ?auto_322787 ?auto_322789 ) ) ( not ( = ?auto_322788 ?auto_322789 ) ) ( ON ?auto_322787 ?auto_322788 ) ( ON ?auto_322786 ?auto_322787 ) ( CLEAR ?auto_322784 ) ( ON ?auto_322785 ?auto_322786 ) ( CLEAR ?auto_322785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_322781 ?auto_322782 ?auto_322783 ?auto_322784 ?auto_322785 )
      ( MAKE-8PILE ?auto_322781 ?auto_322782 ?auto_322783 ?auto_322784 ?auto_322785 ?auto_322786 ?auto_322787 ?auto_322788 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_322815 - BLOCK
      ?auto_322816 - BLOCK
      ?auto_322817 - BLOCK
      ?auto_322818 - BLOCK
      ?auto_322819 - BLOCK
      ?auto_322820 - BLOCK
      ?auto_322821 - BLOCK
      ?auto_322822 - BLOCK
    )
    :vars
    (
      ?auto_322823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322822 ?auto_322823 ) ( ON-TABLE ?auto_322815 ) ( ON ?auto_322816 ?auto_322815 ) ( ON ?auto_322817 ?auto_322816 ) ( not ( = ?auto_322815 ?auto_322816 ) ) ( not ( = ?auto_322815 ?auto_322817 ) ) ( not ( = ?auto_322815 ?auto_322818 ) ) ( not ( = ?auto_322815 ?auto_322819 ) ) ( not ( = ?auto_322815 ?auto_322820 ) ) ( not ( = ?auto_322815 ?auto_322821 ) ) ( not ( = ?auto_322815 ?auto_322822 ) ) ( not ( = ?auto_322815 ?auto_322823 ) ) ( not ( = ?auto_322816 ?auto_322817 ) ) ( not ( = ?auto_322816 ?auto_322818 ) ) ( not ( = ?auto_322816 ?auto_322819 ) ) ( not ( = ?auto_322816 ?auto_322820 ) ) ( not ( = ?auto_322816 ?auto_322821 ) ) ( not ( = ?auto_322816 ?auto_322822 ) ) ( not ( = ?auto_322816 ?auto_322823 ) ) ( not ( = ?auto_322817 ?auto_322818 ) ) ( not ( = ?auto_322817 ?auto_322819 ) ) ( not ( = ?auto_322817 ?auto_322820 ) ) ( not ( = ?auto_322817 ?auto_322821 ) ) ( not ( = ?auto_322817 ?auto_322822 ) ) ( not ( = ?auto_322817 ?auto_322823 ) ) ( not ( = ?auto_322818 ?auto_322819 ) ) ( not ( = ?auto_322818 ?auto_322820 ) ) ( not ( = ?auto_322818 ?auto_322821 ) ) ( not ( = ?auto_322818 ?auto_322822 ) ) ( not ( = ?auto_322818 ?auto_322823 ) ) ( not ( = ?auto_322819 ?auto_322820 ) ) ( not ( = ?auto_322819 ?auto_322821 ) ) ( not ( = ?auto_322819 ?auto_322822 ) ) ( not ( = ?auto_322819 ?auto_322823 ) ) ( not ( = ?auto_322820 ?auto_322821 ) ) ( not ( = ?auto_322820 ?auto_322822 ) ) ( not ( = ?auto_322820 ?auto_322823 ) ) ( not ( = ?auto_322821 ?auto_322822 ) ) ( not ( = ?auto_322821 ?auto_322823 ) ) ( not ( = ?auto_322822 ?auto_322823 ) ) ( ON ?auto_322821 ?auto_322822 ) ( ON ?auto_322820 ?auto_322821 ) ( ON ?auto_322819 ?auto_322820 ) ( CLEAR ?auto_322817 ) ( ON ?auto_322818 ?auto_322819 ) ( CLEAR ?auto_322818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_322815 ?auto_322816 ?auto_322817 ?auto_322818 )
      ( MAKE-8PILE ?auto_322815 ?auto_322816 ?auto_322817 ?auto_322818 ?auto_322819 ?auto_322820 ?auto_322821 ?auto_322822 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_322849 - BLOCK
      ?auto_322850 - BLOCK
      ?auto_322851 - BLOCK
      ?auto_322852 - BLOCK
      ?auto_322853 - BLOCK
      ?auto_322854 - BLOCK
      ?auto_322855 - BLOCK
      ?auto_322856 - BLOCK
    )
    :vars
    (
      ?auto_322857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322856 ?auto_322857 ) ( ON-TABLE ?auto_322849 ) ( ON ?auto_322850 ?auto_322849 ) ( not ( = ?auto_322849 ?auto_322850 ) ) ( not ( = ?auto_322849 ?auto_322851 ) ) ( not ( = ?auto_322849 ?auto_322852 ) ) ( not ( = ?auto_322849 ?auto_322853 ) ) ( not ( = ?auto_322849 ?auto_322854 ) ) ( not ( = ?auto_322849 ?auto_322855 ) ) ( not ( = ?auto_322849 ?auto_322856 ) ) ( not ( = ?auto_322849 ?auto_322857 ) ) ( not ( = ?auto_322850 ?auto_322851 ) ) ( not ( = ?auto_322850 ?auto_322852 ) ) ( not ( = ?auto_322850 ?auto_322853 ) ) ( not ( = ?auto_322850 ?auto_322854 ) ) ( not ( = ?auto_322850 ?auto_322855 ) ) ( not ( = ?auto_322850 ?auto_322856 ) ) ( not ( = ?auto_322850 ?auto_322857 ) ) ( not ( = ?auto_322851 ?auto_322852 ) ) ( not ( = ?auto_322851 ?auto_322853 ) ) ( not ( = ?auto_322851 ?auto_322854 ) ) ( not ( = ?auto_322851 ?auto_322855 ) ) ( not ( = ?auto_322851 ?auto_322856 ) ) ( not ( = ?auto_322851 ?auto_322857 ) ) ( not ( = ?auto_322852 ?auto_322853 ) ) ( not ( = ?auto_322852 ?auto_322854 ) ) ( not ( = ?auto_322852 ?auto_322855 ) ) ( not ( = ?auto_322852 ?auto_322856 ) ) ( not ( = ?auto_322852 ?auto_322857 ) ) ( not ( = ?auto_322853 ?auto_322854 ) ) ( not ( = ?auto_322853 ?auto_322855 ) ) ( not ( = ?auto_322853 ?auto_322856 ) ) ( not ( = ?auto_322853 ?auto_322857 ) ) ( not ( = ?auto_322854 ?auto_322855 ) ) ( not ( = ?auto_322854 ?auto_322856 ) ) ( not ( = ?auto_322854 ?auto_322857 ) ) ( not ( = ?auto_322855 ?auto_322856 ) ) ( not ( = ?auto_322855 ?auto_322857 ) ) ( not ( = ?auto_322856 ?auto_322857 ) ) ( ON ?auto_322855 ?auto_322856 ) ( ON ?auto_322854 ?auto_322855 ) ( ON ?auto_322853 ?auto_322854 ) ( ON ?auto_322852 ?auto_322853 ) ( CLEAR ?auto_322850 ) ( ON ?auto_322851 ?auto_322852 ) ( CLEAR ?auto_322851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_322849 ?auto_322850 ?auto_322851 )
      ( MAKE-8PILE ?auto_322849 ?auto_322850 ?auto_322851 ?auto_322852 ?auto_322853 ?auto_322854 ?auto_322855 ?auto_322856 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_322883 - BLOCK
      ?auto_322884 - BLOCK
      ?auto_322885 - BLOCK
      ?auto_322886 - BLOCK
      ?auto_322887 - BLOCK
      ?auto_322888 - BLOCK
      ?auto_322889 - BLOCK
      ?auto_322890 - BLOCK
    )
    :vars
    (
      ?auto_322891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322890 ?auto_322891 ) ( ON-TABLE ?auto_322883 ) ( not ( = ?auto_322883 ?auto_322884 ) ) ( not ( = ?auto_322883 ?auto_322885 ) ) ( not ( = ?auto_322883 ?auto_322886 ) ) ( not ( = ?auto_322883 ?auto_322887 ) ) ( not ( = ?auto_322883 ?auto_322888 ) ) ( not ( = ?auto_322883 ?auto_322889 ) ) ( not ( = ?auto_322883 ?auto_322890 ) ) ( not ( = ?auto_322883 ?auto_322891 ) ) ( not ( = ?auto_322884 ?auto_322885 ) ) ( not ( = ?auto_322884 ?auto_322886 ) ) ( not ( = ?auto_322884 ?auto_322887 ) ) ( not ( = ?auto_322884 ?auto_322888 ) ) ( not ( = ?auto_322884 ?auto_322889 ) ) ( not ( = ?auto_322884 ?auto_322890 ) ) ( not ( = ?auto_322884 ?auto_322891 ) ) ( not ( = ?auto_322885 ?auto_322886 ) ) ( not ( = ?auto_322885 ?auto_322887 ) ) ( not ( = ?auto_322885 ?auto_322888 ) ) ( not ( = ?auto_322885 ?auto_322889 ) ) ( not ( = ?auto_322885 ?auto_322890 ) ) ( not ( = ?auto_322885 ?auto_322891 ) ) ( not ( = ?auto_322886 ?auto_322887 ) ) ( not ( = ?auto_322886 ?auto_322888 ) ) ( not ( = ?auto_322886 ?auto_322889 ) ) ( not ( = ?auto_322886 ?auto_322890 ) ) ( not ( = ?auto_322886 ?auto_322891 ) ) ( not ( = ?auto_322887 ?auto_322888 ) ) ( not ( = ?auto_322887 ?auto_322889 ) ) ( not ( = ?auto_322887 ?auto_322890 ) ) ( not ( = ?auto_322887 ?auto_322891 ) ) ( not ( = ?auto_322888 ?auto_322889 ) ) ( not ( = ?auto_322888 ?auto_322890 ) ) ( not ( = ?auto_322888 ?auto_322891 ) ) ( not ( = ?auto_322889 ?auto_322890 ) ) ( not ( = ?auto_322889 ?auto_322891 ) ) ( not ( = ?auto_322890 ?auto_322891 ) ) ( ON ?auto_322889 ?auto_322890 ) ( ON ?auto_322888 ?auto_322889 ) ( ON ?auto_322887 ?auto_322888 ) ( ON ?auto_322886 ?auto_322887 ) ( ON ?auto_322885 ?auto_322886 ) ( CLEAR ?auto_322883 ) ( ON ?auto_322884 ?auto_322885 ) ( CLEAR ?auto_322884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_322883 ?auto_322884 )
      ( MAKE-8PILE ?auto_322883 ?auto_322884 ?auto_322885 ?auto_322886 ?auto_322887 ?auto_322888 ?auto_322889 ?auto_322890 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_322917 - BLOCK
      ?auto_322918 - BLOCK
      ?auto_322919 - BLOCK
      ?auto_322920 - BLOCK
      ?auto_322921 - BLOCK
      ?auto_322922 - BLOCK
      ?auto_322923 - BLOCK
      ?auto_322924 - BLOCK
    )
    :vars
    (
      ?auto_322925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322924 ?auto_322925 ) ( not ( = ?auto_322917 ?auto_322918 ) ) ( not ( = ?auto_322917 ?auto_322919 ) ) ( not ( = ?auto_322917 ?auto_322920 ) ) ( not ( = ?auto_322917 ?auto_322921 ) ) ( not ( = ?auto_322917 ?auto_322922 ) ) ( not ( = ?auto_322917 ?auto_322923 ) ) ( not ( = ?auto_322917 ?auto_322924 ) ) ( not ( = ?auto_322917 ?auto_322925 ) ) ( not ( = ?auto_322918 ?auto_322919 ) ) ( not ( = ?auto_322918 ?auto_322920 ) ) ( not ( = ?auto_322918 ?auto_322921 ) ) ( not ( = ?auto_322918 ?auto_322922 ) ) ( not ( = ?auto_322918 ?auto_322923 ) ) ( not ( = ?auto_322918 ?auto_322924 ) ) ( not ( = ?auto_322918 ?auto_322925 ) ) ( not ( = ?auto_322919 ?auto_322920 ) ) ( not ( = ?auto_322919 ?auto_322921 ) ) ( not ( = ?auto_322919 ?auto_322922 ) ) ( not ( = ?auto_322919 ?auto_322923 ) ) ( not ( = ?auto_322919 ?auto_322924 ) ) ( not ( = ?auto_322919 ?auto_322925 ) ) ( not ( = ?auto_322920 ?auto_322921 ) ) ( not ( = ?auto_322920 ?auto_322922 ) ) ( not ( = ?auto_322920 ?auto_322923 ) ) ( not ( = ?auto_322920 ?auto_322924 ) ) ( not ( = ?auto_322920 ?auto_322925 ) ) ( not ( = ?auto_322921 ?auto_322922 ) ) ( not ( = ?auto_322921 ?auto_322923 ) ) ( not ( = ?auto_322921 ?auto_322924 ) ) ( not ( = ?auto_322921 ?auto_322925 ) ) ( not ( = ?auto_322922 ?auto_322923 ) ) ( not ( = ?auto_322922 ?auto_322924 ) ) ( not ( = ?auto_322922 ?auto_322925 ) ) ( not ( = ?auto_322923 ?auto_322924 ) ) ( not ( = ?auto_322923 ?auto_322925 ) ) ( not ( = ?auto_322924 ?auto_322925 ) ) ( ON ?auto_322923 ?auto_322924 ) ( ON ?auto_322922 ?auto_322923 ) ( ON ?auto_322921 ?auto_322922 ) ( ON ?auto_322920 ?auto_322921 ) ( ON ?auto_322919 ?auto_322920 ) ( ON ?auto_322918 ?auto_322919 ) ( ON ?auto_322917 ?auto_322918 ) ( CLEAR ?auto_322917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_322917 )
      ( MAKE-8PILE ?auto_322917 ?auto_322918 ?auto_322919 ?auto_322920 ?auto_322921 ?auto_322922 ?auto_322923 ?auto_322924 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_322952 - BLOCK
      ?auto_322953 - BLOCK
      ?auto_322954 - BLOCK
      ?auto_322955 - BLOCK
      ?auto_322956 - BLOCK
      ?auto_322957 - BLOCK
      ?auto_322958 - BLOCK
      ?auto_322959 - BLOCK
      ?auto_322960 - BLOCK
    )
    :vars
    (
      ?auto_322961 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_322959 ) ( ON ?auto_322960 ?auto_322961 ) ( CLEAR ?auto_322960 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_322952 ) ( ON ?auto_322953 ?auto_322952 ) ( ON ?auto_322954 ?auto_322953 ) ( ON ?auto_322955 ?auto_322954 ) ( ON ?auto_322956 ?auto_322955 ) ( ON ?auto_322957 ?auto_322956 ) ( ON ?auto_322958 ?auto_322957 ) ( ON ?auto_322959 ?auto_322958 ) ( not ( = ?auto_322952 ?auto_322953 ) ) ( not ( = ?auto_322952 ?auto_322954 ) ) ( not ( = ?auto_322952 ?auto_322955 ) ) ( not ( = ?auto_322952 ?auto_322956 ) ) ( not ( = ?auto_322952 ?auto_322957 ) ) ( not ( = ?auto_322952 ?auto_322958 ) ) ( not ( = ?auto_322952 ?auto_322959 ) ) ( not ( = ?auto_322952 ?auto_322960 ) ) ( not ( = ?auto_322952 ?auto_322961 ) ) ( not ( = ?auto_322953 ?auto_322954 ) ) ( not ( = ?auto_322953 ?auto_322955 ) ) ( not ( = ?auto_322953 ?auto_322956 ) ) ( not ( = ?auto_322953 ?auto_322957 ) ) ( not ( = ?auto_322953 ?auto_322958 ) ) ( not ( = ?auto_322953 ?auto_322959 ) ) ( not ( = ?auto_322953 ?auto_322960 ) ) ( not ( = ?auto_322953 ?auto_322961 ) ) ( not ( = ?auto_322954 ?auto_322955 ) ) ( not ( = ?auto_322954 ?auto_322956 ) ) ( not ( = ?auto_322954 ?auto_322957 ) ) ( not ( = ?auto_322954 ?auto_322958 ) ) ( not ( = ?auto_322954 ?auto_322959 ) ) ( not ( = ?auto_322954 ?auto_322960 ) ) ( not ( = ?auto_322954 ?auto_322961 ) ) ( not ( = ?auto_322955 ?auto_322956 ) ) ( not ( = ?auto_322955 ?auto_322957 ) ) ( not ( = ?auto_322955 ?auto_322958 ) ) ( not ( = ?auto_322955 ?auto_322959 ) ) ( not ( = ?auto_322955 ?auto_322960 ) ) ( not ( = ?auto_322955 ?auto_322961 ) ) ( not ( = ?auto_322956 ?auto_322957 ) ) ( not ( = ?auto_322956 ?auto_322958 ) ) ( not ( = ?auto_322956 ?auto_322959 ) ) ( not ( = ?auto_322956 ?auto_322960 ) ) ( not ( = ?auto_322956 ?auto_322961 ) ) ( not ( = ?auto_322957 ?auto_322958 ) ) ( not ( = ?auto_322957 ?auto_322959 ) ) ( not ( = ?auto_322957 ?auto_322960 ) ) ( not ( = ?auto_322957 ?auto_322961 ) ) ( not ( = ?auto_322958 ?auto_322959 ) ) ( not ( = ?auto_322958 ?auto_322960 ) ) ( not ( = ?auto_322958 ?auto_322961 ) ) ( not ( = ?auto_322959 ?auto_322960 ) ) ( not ( = ?auto_322959 ?auto_322961 ) ) ( not ( = ?auto_322960 ?auto_322961 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_322960 ?auto_322961 )
      ( !STACK ?auto_322960 ?auto_322959 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_322990 - BLOCK
      ?auto_322991 - BLOCK
      ?auto_322992 - BLOCK
      ?auto_322993 - BLOCK
      ?auto_322994 - BLOCK
      ?auto_322995 - BLOCK
      ?auto_322996 - BLOCK
      ?auto_322997 - BLOCK
      ?auto_322998 - BLOCK
    )
    :vars
    (
      ?auto_322999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_322998 ?auto_322999 ) ( ON-TABLE ?auto_322990 ) ( ON ?auto_322991 ?auto_322990 ) ( ON ?auto_322992 ?auto_322991 ) ( ON ?auto_322993 ?auto_322992 ) ( ON ?auto_322994 ?auto_322993 ) ( ON ?auto_322995 ?auto_322994 ) ( ON ?auto_322996 ?auto_322995 ) ( not ( = ?auto_322990 ?auto_322991 ) ) ( not ( = ?auto_322990 ?auto_322992 ) ) ( not ( = ?auto_322990 ?auto_322993 ) ) ( not ( = ?auto_322990 ?auto_322994 ) ) ( not ( = ?auto_322990 ?auto_322995 ) ) ( not ( = ?auto_322990 ?auto_322996 ) ) ( not ( = ?auto_322990 ?auto_322997 ) ) ( not ( = ?auto_322990 ?auto_322998 ) ) ( not ( = ?auto_322990 ?auto_322999 ) ) ( not ( = ?auto_322991 ?auto_322992 ) ) ( not ( = ?auto_322991 ?auto_322993 ) ) ( not ( = ?auto_322991 ?auto_322994 ) ) ( not ( = ?auto_322991 ?auto_322995 ) ) ( not ( = ?auto_322991 ?auto_322996 ) ) ( not ( = ?auto_322991 ?auto_322997 ) ) ( not ( = ?auto_322991 ?auto_322998 ) ) ( not ( = ?auto_322991 ?auto_322999 ) ) ( not ( = ?auto_322992 ?auto_322993 ) ) ( not ( = ?auto_322992 ?auto_322994 ) ) ( not ( = ?auto_322992 ?auto_322995 ) ) ( not ( = ?auto_322992 ?auto_322996 ) ) ( not ( = ?auto_322992 ?auto_322997 ) ) ( not ( = ?auto_322992 ?auto_322998 ) ) ( not ( = ?auto_322992 ?auto_322999 ) ) ( not ( = ?auto_322993 ?auto_322994 ) ) ( not ( = ?auto_322993 ?auto_322995 ) ) ( not ( = ?auto_322993 ?auto_322996 ) ) ( not ( = ?auto_322993 ?auto_322997 ) ) ( not ( = ?auto_322993 ?auto_322998 ) ) ( not ( = ?auto_322993 ?auto_322999 ) ) ( not ( = ?auto_322994 ?auto_322995 ) ) ( not ( = ?auto_322994 ?auto_322996 ) ) ( not ( = ?auto_322994 ?auto_322997 ) ) ( not ( = ?auto_322994 ?auto_322998 ) ) ( not ( = ?auto_322994 ?auto_322999 ) ) ( not ( = ?auto_322995 ?auto_322996 ) ) ( not ( = ?auto_322995 ?auto_322997 ) ) ( not ( = ?auto_322995 ?auto_322998 ) ) ( not ( = ?auto_322995 ?auto_322999 ) ) ( not ( = ?auto_322996 ?auto_322997 ) ) ( not ( = ?auto_322996 ?auto_322998 ) ) ( not ( = ?auto_322996 ?auto_322999 ) ) ( not ( = ?auto_322997 ?auto_322998 ) ) ( not ( = ?auto_322997 ?auto_322999 ) ) ( not ( = ?auto_322998 ?auto_322999 ) ) ( CLEAR ?auto_322996 ) ( ON ?auto_322997 ?auto_322998 ) ( CLEAR ?auto_322997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_322990 ?auto_322991 ?auto_322992 ?auto_322993 ?auto_322994 ?auto_322995 ?auto_322996 ?auto_322997 )
      ( MAKE-9PILE ?auto_322990 ?auto_322991 ?auto_322992 ?auto_322993 ?auto_322994 ?auto_322995 ?auto_322996 ?auto_322997 ?auto_322998 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_323028 - BLOCK
      ?auto_323029 - BLOCK
      ?auto_323030 - BLOCK
      ?auto_323031 - BLOCK
      ?auto_323032 - BLOCK
      ?auto_323033 - BLOCK
      ?auto_323034 - BLOCK
      ?auto_323035 - BLOCK
      ?auto_323036 - BLOCK
    )
    :vars
    (
      ?auto_323037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323036 ?auto_323037 ) ( ON-TABLE ?auto_323028 ) ( ON ?auto_323029 ?auto_323028 ) ( ON ?auto_323030 ?auto_323029 ) ( ON ?auto_323031 ?auto_323030 ) ( ON ?auto_323032 ?auto_323031 ) ( ON ?auto_323033 ?auto_323032 ) ( not ( = ?auto_323028 ?auto_323029 ) ) ( not ( = ?auto_323028 ?auto_323030 ) ) ( not ( = ?auto_323028 ?auto_323031 ) ) ( not ( = ?auto_323028 ?auto_323032 ) ) ( not ( = ?auto_323028 ?auto_323033 ) ) ( not ( = ?auto_323028 ?auto_323034 ) ) ( not ( = ?auto_323028 ?auto_323035 ) ) ( not ( = ?auto_323028 ?auto_323036 ) ) ( not ( = ?auto_323028 ?auto_323037 ) ) ( not ( = ?auto_323029 ?auto_323030 ) ) ( not ( = ?auto_323029 ?auto_323031 ) ) ( not ( = ?auto_323029 ?auto_323032 ) ) ( not ( = ?auto_323029 ?auto_323033 ) ) ( not ( = ?auto_323029 ?auto_323034 ) ) ( not ( = ?auto_323029 ?auto_323035 ) ) ( not ( = ?auto_323029 ?auto_323036 ) ) ( not ( = ?auto_323029 ?auto_323037 ) ) ( not ( = ?auto_323030 ?auto_323031 ) ) ( not ( = ?auto_323030 ?auto_323032 ) ) ( not ( = ?auto_323030 ?auto_323033 ) ) ( not ( = ?auto_323030 ?auto_323034 ) ) ( not ( = ?auto_323030 ?auto_323035 ) ) ( not ( = ?auto_323030 ?auto_323036 ) ) ( not ( = ?auto_323030 ?auto_323037 ) ) ( not ( = ?auto_323031 ?auto_323032 ) ) ( not ( = ?auto_323031 ?auto_323033 ) ) ( not ( = ?auto_323031 ?auto_323034 ) ) ( not ( = ?auto_323031 ?auto_323035 ) ) ( not ( = ?auto_323031 ?auto_323036 ) ) ( not ( = ?auto_323031 ?auto_323037 ) ) ( not ( = ?auto_323032 ?auto_323033 ) ) ( not ( = ?auto_323032 ?auto_323034 ) ) ( not ( = ?auto_323032 ?auto_323035 ) ) ( not ( = ?auto_323032 ?auto_323036 ) ) ( not ( = ?auto_323032 ?auto_323037 ) ) ( not ( = ?auto_323033 ?auto_323034 ) ) ( not ( = ?auto_323033 ?auto_323035 ) ) ( not ( = ?auto_323033 ?auto_323036 ) ) ( not ( = ?auto_323033 ?auto_323037 ) ) ( not ( = ?auto_323034 ?auto_323035 ) ) ( not ( = ?auto_323034 ?auto_323036 ) ) ( not ( = ?auto_323034 ?auto_323037 ) ) ( not ( = ?auto_323035 ?auto_323036 ) ) ( not ( = ?auto_323035 ?auto_323037 ) ) ( not ( = ?auto_323036 ?auto_323037 ) ) ( ON ?auto_323035 ?auto_323036 ) ( CLEAR ?auto_323033 ) ( ON ?auto_323034 ?auto_323035 ) ( CLEAR ?auto_323034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_323028 ?auto_323029 ?auto_323030 ?auto_323031 ?auto_323032 ?auto_323033 ?auto_323034 )
      ( MAKE-9PILE ?auto_323028 ?auto_323029 ?auto_323030 ?auto_323031 ?auto_323032 ?auto_323033 ?auto_323034 ?auto_323035 ?auto_323036 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_323066 - BLOCK
      ?auto_323067 - BLOCK
      ?auto_323068 - BLOCK
      ?auto_323069 - BLOCK
      ?auto_323070 - BLOCK
      ?auto_323071 - BLOCK
      ?auto_323072 - BLOCK
      ?auto_323073 - BLOCK
      ?auto_323074 - BLOCK
    )
    :vars
    (
      ?auto_323075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323074 ?auto_323075 ) ( ON-TABLE ?auto_323066 ) ( ON ?auto_323067 ?auto_323066 ) ( ON ?auto_323068 ?auto_323067 ) ( ON ?auto_323069 ?auto_323068 ) ( ON ?auto_323070 ?auto_323069 ) ( not ( = ?auto_323066 ?auto_323067 ) ) ( not ( = ?auto_323066 ?auto_323068 ) ) ( not ( = ?auto_323066 ?auto_323069 ) ) ( not ( = ?auto_323066 ?auto_323070 ) ) ( not ( = ?auto_323066 ?auto_323071 ) ) ( not ( = ?auto_323066 ?auto_323072 ) ) ( not ( = ?auto_323066 ?auto_323073 ) ) ( not ( = ?auto_323066 ?auto_323074 ) ) ( not ( = ?auto_323066 ?auto_323075 ) ) ( not ( = ?auto_323067 ?auto_323068 ) ) ( not ( = ?auto_323067 ?auto_323069 ) ) ( not ( = ?auto_323067 ?auto_323070 ) ) ( not ( = ?auto_323067 ?auto_323071 ) ) ( not ( = ?auto_323067 ?auto_323072 ) ) ( not ( = ?auto_323067 ?auto_323073 ) ) ( not ( = ?auto_323067 ?auto_323074 ) ) ( not ( = ?auto_323067 ?auto_323075 ) ) ( not ( = ?auto_323068 ?auto_323069 ) ) ( not ( = ?auto_323068 ?auto_323070 ) ) ( not ( = ?auto_323068 ?auto_323071 ) ) ( not ( = ?auto_323068 ?auto_323072 ) ) ( not ( = ?auto_323068 ?auto_323073 ) ) ( not ( = ?auto_323068 ?auto_323074 ) ) ( not ( = ?auto_323068 ?auto_323075 ) ) ( not ( = ?auto_323069 ?auto_323070 ) ) ( not ( = ?auto_323069 ?auto_323071 ) ) ( not ( = ?auto_323069 ?auto_323072 ) ) ( not ( = ?auto_323069 ?auto_323073 ) ) ( not ( = ?auto_323069 ?auto_323074 ) ) ( not ( = ?auto_323069 ?auto_323075 ) ) ( not ( = ?auto_323070 ?auto_323071 ) ) ( not ( = ?auto_323070 ?auto_323072 ) ) ( not ( = ?auto_323070 ?auto_323073 ) ) ( not ( = ?auto_323070 ?auto_323074 ) ) ( not ( = ?auto_323070 ?auto_323075 ) ) ( not ( = ?auto_323071 ?auto_323072 ) ) ( not ( = ?auto_323071 ?auto_323073 ) ) ( not ( = ?auto_323071 ?auto_323074 ) ) ( not ( = ?auto_323071 ?auto_323075 ) ) ( not ( = ?auto_323072 ?auto_323073 ) ) ( not ( = ?auto_323072 ?auto_323074 ) ) ( not ( = ?auto_323072 ?auto_323075 ) ) ( not ( = ?auto_323073 ?auto_323074 ) ) ( not ( = ?auto_323073 ?auto_323075 ) ) ( not ( = ?auto_323074 ?auto_323075 ) ) ( ON ?auto_323073 ?auto_323074 ) ( ON ?auto_323072 ?auto_323073 ) ( CLEAR ?auto_323070 ) ( ON ?auto_323071 ?auto_323072 ) ( CLEAR ?auto_323071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_323066 ?auto_323067 ?auto_323068 ?auto_323069 ?auto_323070 ?auto_323071 )
      ( MAKE-9PILE ?auto_323066 ?auto_323067 ?auto_323068 ?auto_323069 ?auto_323070 ?auto_323071 ?auto_323072 ?auto_323073 ?auto_323074 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_323104 - BLOCK
      ?auto_323105 - BLOCK
      ?auto_323106 - BLOCK
      ?auto_323107 - BLOCK
      ?auto_323108 - BLOCK
      ?auto_323109 - BLOCK
      ?auto_323110 - BLOCK
      ?auto_323111 - BLOCK
      ?auto_323112 - BLOCK
    )
    :vars
    (
      ?auto_323113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323112 ?auto_323113 ) ( ON-TABLE ?auto_323104 ) ( ON ?auto_323105 ?auto_323104 ) ( ON ?auto_323106 ?auto_323105 ) ( ON ?auto_323107 ?auto_323106 ) ( not ( = ?auto_323104 ?auto_323105 ) ) ( not ( = ?auto_323104 ?auto_323106 ) ) ( not ( = ?auto_323104 ?auto_323107 ) ) ( not ( = ?auto_323104 ?auto_323108 ) ) ( not ( = ?auto_323104 ?auto_323109 ) ) ( not ( = ?auto_323104 ?auto_323110 ) ) ( not ( = ?auto_323104 ?auto_323111 ) ) ( not ( = ?auto_323104 ?auto_323112 ) ) ( not ( = ?auto_323104 ?auto_323113 ) ) ( not ( = ?auto_323105 ?auto_323106 ) ) ( not ( = ?auto_323105 ?auto_323107 ) ) ( not ( = ?auto_323105 ?auto_323108 ) ) ( not ( = ?auto_323105 ?auto_323109 ) ) ( not ( = ?auto_323105 ?auto_323110 ) ) ( not ( = ?auto_323105 ?auto_323111 ) ) ( not ( = ?auto_323105 ?auto_323112 ) ) ( not ( = ?auto_323105 ?auto_323113 ) ) ( not ( = ?auto_323106 ?auto_323107 ) ) ( not ( = ?auto_323106 ?auto_323108 ) ) ( not ( = ?auto_323106 ?auto_323109 ) ) ( not ( = ?auto_323106 ?auto_323110 ) ) ( not ( = ?auto_323106 ?auto_323111 ) ) ( not ( = ?auto_323106 ?auto_323112 ) ) ( not ( = ?auto_323106 ?auto_323113 ) ) ( not ( = ?auto_323107 ?auto_323108 ) ) ( not ( = ?auto_323107 ?auto_323109 ) ) ( not ( = ?auto_323107 ?auto_323110 ) ) ( not ( = ?auto_323107 ?auto_323111 ) ) ( not ( = ?auto_323107 ?auto_323112 ) ) ( not ( = ?auto_323107 ?auto_323113 ) ) ( not ( = ?auto_323108 ?auto_323109 ) ) ( not ( = ?auto_323108 ?auto_323110 ) ) ( not ( = ?auto_323108 ?auto_323111 ) ) ( not ( = ?auto_323108 ?auto_323112 ) ) ( not ( = ?auto_323108 ?auto_323113 ) ) ( not ( = ?auto_323109 ?auto_323110 ) ) ( not ( = ?auto_323109 ?auto_323111 ) ) ( not ( = ?auto_323109 ?auto_323112 ) ) ( not ( = ?auto_323109 ?auto_323113 ) ) ( not ( = ?auto_323110 ?auto_323111 ) ) ( not ( = ?auto_323110 ?auto_323112 ) ) ( not ( = ?auto_323110 ?auto_323113 ) ) ( not ( = ?auto_323111 ?auto_323112 ) ) ( not ( = ?auto_323111 ?auto_323113 ) ) ( not ( = ?auto_323112 ?auto_323113 ) ) ( ON ?auto_323111 ?auto_323112 ) ( ON ?auto_323110 ?auto_323111 ) ( ON ?auto_323109 ?auto_323110 ) ( CLEAR ?auto_323107 ) ( ON ?auto_323108 ?auto_323109 ) ( CLEAR ?auto_323108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_323104 ?auto_323105 ?auto_323106 ?auto_323107 ?auto_323108 )
      ( MAKE-9PILE ?auto_323104 ?auto_323105 ?auto_323106 ?auto_323107 ?auto_323108 ?auto_323109 ?auto_323110 ?auto_323111 ?auto_323112 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_323142 - BLOCK
      ?auto_323143 - BLOCK
      ?auto_323144 - BLOCK
      ?auto_323145 - BLOCK
      ?auto_323146 - BLOCK
      ?auto_323147 - BLOCK
      ?auto_323148 - BLOCK
      ?auto_323149 - BLOCK
      ?auto_323150 - BLOCK
    )
    :vars
    (
      ?auto_323151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323150 ?auto_323151 ) ( ON-TABLE ?auto_323142 ) ( ON ?auto_323143 ?auto_323142 ) ( ON ?auto_323144 ?auto_323143 ) ( not ( = ?auto_323142 ?auto_323143 ) ) ( not ( = ?auto_323142 ?auto_323144 ) ) ( not ( = ?auto_323142 ?auto_323145 ) ) ( not ( = ?auto_323142 ?auto_323146 ) ) ( not ( = ?auto_323142 ?auto_323147 ) ) ( not ( = ?auto_323142 ?auto_323148 ) ) ( not ( = ?auto_323142 ?auto_323149 ) ) ( not ( = ?auto_323142 ?auto_323150 ) ) ( not ( = ?auto_323142 ?auto_323151 ) ) ( not ( = ?auto_323143 ?auto_323144 ) ) ( not ( = ?auto_323143 ?auto_323145 ) ) ( not ( = ?auto_323143 ?auto_323146 ) ) ( not ( = ?auto_323143 ?auto_323147 ) ) ( not ( = ?auto_323143 ?auto_323148 ) ) ( not ( = ?auto_323143 ?auto_323149 ) ) ( not ( = ?auto_323143 ?auto_323150 ) ) ( not ( = ?auto_323143 ?auto_323151 ) ) ( not ( = ?auto_323144 ?auto_323145 ) ) ( not ( = ?auto_323144 ?auto_323146 ) ) ( not ( = ?auto_323144 ?auto_323147 ) ) ( not ( = ?auto_323144 ?auto_323148 ) ) ( not ( = ?auto_323144 ?auto_323149 ) ) ( not ( = ?auto_323144 ?auto_323150 ) ) ( not ( = ?auto_323144 ?auto_323151 ) ) ( not ( = ?auto_323145 ?auto_323146 ) ) ( not ( = ?auto_323145 ?auto_323147 ) ) ( not ( = ?auto_323145 ?auto_323148 ) ) ( not ( = ?auto_323145 ?auto_323149 ) ) ( not ( = ?auto_323145 ?auto_323150 ) ) ( not ( = ?auto_323145 ?auto_323151 ) ) ( not ( = ?auto_323146 ?auto_323147 ) ) ( not ( = ?auto_323146 ?auto_323148 ) ) ( not ( = ?auto_323146 ?auto_323149 ) ) ( not ( = ?auto_323146 ?auto_323150 ) ) ( not ( = ?auto_323146 ?auto_323151 ) ) ( not ( = ?auto_323147 ?auto_323148 ) ) ( not ( = ?auto_323147 ?auto_323149 ) ) ( not ( = ?auto_323147 ?auto_323150 ) ) ( not ( = ?auto_323147 ?auto_323151 ) ) ( not ( = ?auto_323148 ?auto_323149 ) ) ( not ( = ?auto_323148 ?auto_323150 ) ) ( not ( = ?auto_323148 ?auto_323151 ) ) ( not ( = ?auto_323149 ?auto_323150 ) ) ( not ( = ?auto_323149 ?auto_323151 ) ) ( not ( = ?auto_323150 ?auto_323151 ) ) ( ON ?auto_323149 ?auto_323150 ) ( ON ?auto_323148 ?auto_323149 ) ( ON ?auto_323147 ?auto_323148 ) ( ON ?auto_323146 ?auto_323147 ) ( CLEAR ?auto_323144 ) ( ON ?auto_323145 ?auto_323146 ) ( CLEAR ?auto_323145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_323142 ?auto_323143 ?auto_323144 ?auto_323145 )
      ( MAKE-9PILE ?auto_323142 ?auto_323143 ?auto_323144 ?auto_323145 ?auto_323146 ?auto_323147 ?auto_323148 ?auto_323149 ?auto_323150 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_323180 - BLOCK
      ?auto_323181 - BLOCK
      ?auto_323182 - BLOCK
      ?auto_323183 - BLOCK
      ?auto_323184 - BLOCK
      ?auto_323185 - BLOCK
      ?auto_323186 - BLOCK
      ?auto_323187 - BLOCK
      ?auto_323188 - BLOCK
    )
    :vars
    (
      ?auto_323189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323188 ?auto_323189 ) ( ON-TABLE ?auto_323180 ) ( ON ?auto_323181 ?auto_323180 ) ( not ( = ?auto_323180 ?auto_323181 ) ) ( not ( = ?auto_323180 ?auto_323182 ) ) ( not ( = ?auto_323180 ?auto_323183 ) ) ( not ( = ?auto_323180 ?auto_323184 ) ) ( not ( = ?auto_323180 ?auto_323185 ) ) ( not ( = ?auto_323180 ?auto_323186 ) ) ( not ( = ?auto_323180 ?auto_323187 ) ) ( not ( = ?auto_323180 ?auto_323188 ) ) ( not ( = ?auto_323180 ?auto_323189 ) ) ( not ( = ?auto_323181 ?auto_323182 ) ) ( not ( = ?auto_323181 ?auto_323183 ) ) ( not ( = ?auto_323181 ?auto_323184 ) ) ( not ( = ?auto_323181 ?auto_323185 ) ) ( not ( = ?auto_323181 ?auto_323186 ) ) ( not ( = ?auto_323181 ?auto_323187 ) ) ( not ( = ?auto_323181 ?auto_323188 ) ) ( not ( = ?auto_323181 ?auto_323189 ) ) ( not ( = ?auto_323182 ?auto_323183 ) ) ( not ( = ?auto_323182 ?auto_323184 ) ) ( not ( = ?auto_323182 ?auto_323185 ) ) ( not ( = ?auto_323182 ?auto_323186 ) ) ( not ( = ?auto_323182 ?auto_323187 ) ) ( not ( = ?auto_323182 ?auto_323188 ) ) ( not ( = ?auto_323182 ?auto_323189 ) ) ( not ( = ?auto_323183 ?auto_323184 ) ) ( not ( = ?auto_323183 ?auto_323185 ) ) ( not ( = ?auto_323183 ?auto_323186 ) ) ( not ( = ?auto_323183 ?auto_323187 ) ) ( not ( = ?auto_323183 ?auto_323188 ) ) ( not ( = ?auto_323183 ?auto_323189 ) ) ( not ( = ?auto_323184 ?auto_323185 ) ) ( not ( = ?auto_323184 ?auto_323186 ) ) ( not ( = ?auto_323184 ?auto_323187 ) ) ( not ( = ?auto_323184 ?auto_323188 ) ) ( not ( = ?auto_323184 ?auto_323189 ) ) ( not ( = ?auto_323185 ?auto_323186 ) ) ( not ( = ?auto_323185 ?auto_323187 ) ) ( not ( = ?auto_323185 ?auto_323188 ) ) ( not ( = ?auto_323185 ?auto_323189 ) ) ( not ( = ?auto_323186 ?auto_323187 ) ) ( not ( = ?auto_323186 ?auto_323188 ) ) ( not ( = ?auto_323186 ?auto_323189 ) ) ( not ( = ?auto_323187 ?auto_323188 ) ) ( not ( = ?auto_323187 ?auto_323189 ) ) ( not ( = ?auto_323188 ?auto_323189 ) ) ( ON ?auto_323187 ?auto_323188 ) ( ON ?auto_323186 ?auto_323187 ) ( ON ?auto_323185 ?auto_323186 ) ( ON ?auto_323184 ?auto_323185 ) ( ON ?auto_323183 ?auto_323184 ) ( CLEAR ?auto_323181 ) ( ON ?auto_323182 ?auto_323183 ) ( CLEAR ?auto_323182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_323180 ?auto_323181 ?auto_323182 )
      ( MAKE-9PILE ?auto_323180 ?auto_323181 ?auto_323182 ?auto_323183 ?auto_323184 ?auto_323185 ?auto_323186 ?auto_323187 ?auto_323188 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_323218 - BLOCK
      ?auto_323219 - BLOCK
      ?auto_323220 - BLOCK
      ?auto_323221 - BLOCK
      ?auto_323222 - BLOCK
      ?auto_323223 - BLOCK
      ?auto_323224 - BLOCK
      ?auto_323225 - BLOCK
      ?auto_323226 - BLOCK
    )
    :vars
    (
      ?auto_323227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323226 ?auto_323227 ) ( ON-TABLE ?auto_323218 ) ( not ( = ?auto_323218 ?auto_323219 ) ) ( not ( = ?auto_323218 ?auto_323220 ) ) ( not ( = ?auto_323218 ?auto_323221 ) ) ( not ( = ?auto_323218 ?auto_323222 ) ) ( not ( = ?auto_323218 ?auto_323223 ) ) ( not ( = ?auto_323218 ?auto_323224 ) ) ( not ( = ?auto_323218 ?auto_323225 ) ) ( not ( = ?auto_323218 ?auto_323226 ) ) ( not ( = ?auto_323218 ?auto_323227 ) ) ( not ( = ?auto_323219 ?auto_323220 ) ) ( not ( = ?auto_323219 ?auto_323221 ) ) ( not ( = ?auto_323219 ?auto_323222 ) ) ( not ( = ?auto_323219 ?auto_323223 ) ) ( not ( = ?auto_323219 ?auto_323224 ) ) ( not ( = ?auto_323219 ?auto_323225 ) ) ( not ( = ?auto_323219 ?auto_323226 ) ) ( not ( = ?auto_323219 ?auto_323227 ) ) ( not ( = ?auto_323220 ?auto_323221 ) ) ( not ( = ?auto_323220 ?auto_323222 ) ) ( not ( = ?auto_323220 ?auto_323223 ) ) ( not ( = ?auto_323220 ?auto_323224 ) ) ( not ( = ?auto_323220 ?auto_323225 ) ) ( not ( = ?auto_323220 ?auto_323226 ) ) ( not ( = ?auto_323220 ?auto_323227 ) ) ( not ( = ?auto_323221 ?auto_323222 ) ) ( not ( = ?auto_323221 ?auto_323223 ) ) ( not ( = ?auto_323221 ?auto_323224 ) ) ( not ( = ?auto_323221 ?auto_323225 ) ) ( not ( = ?auto_323221 ?auto_323226 ) ) ( not ( = ?auto_323221 ?auto_323227 ) ) ( not ( = ?auto_323222 ?auto_323223 ) ) ( not ( = ?auto_323222 ?auto_323224 ) ) ( not ( = ?auto_323222 ?auto_323225 ) ) ( not ( = ?auto_323222 ?auto_323226 ) ) ( not ( = ?auto_323222 ?auto_323227 ) ) ( not ( = ?auto_323223 ?auto_323224 ) ) ( not ( = ?auto_323223 ?auto_323225 ) ) ( not ( = ?auto_323223 ?auto_323226 ) ) ( not ( = ?auto_323223 ?auto_323227 ) ) ( not ( = ?auto_323224 ?auto_323225 ) ) ( not ( = ?auto_323224 ?auto_323226 ) ) ( not ( = ?auto_323224 ?auto_323227 ) ) ( not ( = ?auto_323225 ?auto_323226 ) ) ( not ( = ?auto_323225 ?auto_323227 ) ) ( not ( = ?auto_323226 ?auto_323227 ) ) ( ON ?auto_323225 ?auto_323226 ) ( ON ?auto_323224 ?auto_323225 ) ( ON ?auto_323223 ?auto_323224 ) ( ON ?auto_323222 ?auto_323223 ) ( ON ?auto_323221 ?auto_323222 ) ( ON ?auto_323220 ?auto_323221 ) ( CLEAR ?auto_323218 ) ( ON ?auto_323219 ?auto_323220 ) ( CLEAR ?auto_323219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_323218 ?auto_323219 )
      ( MAKE-9PILE ?auto_323218 ?auto_323219 ?auto_323220 ?auto_323221 ?auto_323222 ?auto_323223 ?auto_323224 ?auto_323225 ?auto_323226 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_323256 - BLOCK
      ?auto_323257 - BLOCK
      ?auto_323258 - BLOCK
      ?auto_323259 - BLOCK
      ?auto_323260 - BLOCK
      ?auto_323261 - BLOCK
      ?auto_323262 - BLOCK
      ?auto_323263 - BLOCK
      ?auto_323264 - BLOCK
    )
    :vars
    (
      ?auto_323265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323264 ?auto_323265 ) ( not ( = ?auto_323256 ?auto_323257 ) ) ( not ( = ?auto_323256 ?auto_323258 ) ) ( not ( = ?auto_323256 ?auto_323259 ) ) ( not ( = ?auto_323256 ?auto_323260 ) ) ( not ( = ?auto_323256 ?auto_323261 ) ) ( not ( = ?auto_323256 ?auto_323262 ) ) ( not ( = ?auto_323256 ?auto_323263 ) ) ( not ( = ?auto_323256 ?auto_323264 ) ) ( not ( = ?auto_323256 ?auto_323265 ) ) ( not ( = ?auto_323257 ?auto_323258 ) ) ( not ( = ?auto_323257 ?auto_323259 ) ) ( not ( = ?auto_323257 ?auto_323260 ) ) ( not ( = ?auto_323257 ?auto_323261 ) ) ( not ( = ?auto_323257 ?auto_323262 ) ) ( not ( = ?auto_323257 ?auto_323263 ) ) ( not ( = ?auto_323257 ?auto_323264 ) ) ( not ( = ?auto_323257 ?auto_323265 ) ) ( not ( = ?auto_323258 ?auto_323259 ) ) ( not ( = ?auto_323258 ?auto_323260 ) ) ( not ( = ?auto_323258 ?auto_323261 ) ) ( not ( = ?auto_323258 ?auto_323262 ) ) ( not ( = ?auto_323258 ?auto_323263 ) ) ( not ( = ?auto_323258 ?auto_323264 ) ) ( not ( = ?auto_323258 ?auto_323265 ) ) ( not ( = ?auto_323259 ?auto_323260 ) ) ( not ( = ?auto_323259 ?auto_323261 ) ) ( not ( = ?auto_323259 ?auto_323262 ) ) ( not ( = ?auto_323259 ?auto_323263 ) ) ( not ( = ?auto_323259 ?auto_323264 ) ) ( not ( = ?auto_323259 ?auto_323265 ) ) ( not ( = ?auto_323260 ?auto_323261 ) ) ( not ( = ?auto_323260 ?auto_323262 ) ) ( not ( = ?auto_323260 ?auto_323263 ) ) ( not ( = ?auto_323260 ?auto_323264 ) ) ( not ( = ?auto_323260 ?auto_323265 ) ) ( not ( = ?auto_323261 ?auto_323262 ) ) ( not ( = ?auto_323261 ?auto_323263 ) ) ( not ( = ?auto_323261 ?auto_323264 ) ) ( not ( = ?auto_323261 ?auto_323265 ) ) ( not ( = ?auto_323262 ?auto_323263 ) ) ( not ( = ?auto_323262 ?auto_323264 ) ) ( not ( = ?auto_323262 ?auto_323265 ) ) ( not ( = ?auto_323263 ?auto_323264 ) ) ( not ( = ?auto_323263 ?auto_323265 ) ) ( not ( = ?auto_323264 ?auto_323265 ) ) ( ON ?auto_323263 ?auto_323264 ) ( ON ?auto_323262 ?auto_323263 ) ( ON ?auto_323261 ?auto_323262 ) ( ON ?auto_323260 ?auto_323261 ) ( ON ?auto_323259 ?auto_323260 ) ( ON ?auto_323258 ?auto_323259 ) ( ON ?auto_323257 ?auto_323258 ) ( ON ?auto_323256 ?auto_323257 ) ( CLEAR ?auto_323256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_323256 )
      ( MAKE-9PILE ?auto_323256 ?auto_323257 ?auto_323258 ?auto_323259 ?auto_323260 ?auto_323261 ?auto_323262 ?auto_323263 ?auto_323264 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_323295 - BLOCK
      ?auto_323296 - BLOCK
      ?auto_323297 - BLOCK
      ?auto_323298 - BLOCK
      ?auto_323299 - BLOCK
      ?auto_323300 - BLOCK
      ?auto_323301 - BLOCK
      ?auto_323302 - BLOCK
      ?auto_323303 - BLOCK
      ?auto_323304 - BLOCK
    )
    :vars
    (
      ?auto_323305 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_323303 ) ( ON ?auto_323304 ?auto_323305 ) ( CLEAR ?auto_323304 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_323295 ) ( ON ?auto_323296 ?auto_323295 ) ( ON ?auto_323297 ?auto_323296 ) ( ON ?auto_323298 ?auto_323297 ) ( ON ?auto_323299 ?auto_323298 ) ( ON ?auto_323300 ?auto_323299 ) ( ON ?auto_323301 ?auto_323300 ) ( ON ?auto_323302 ?auto_323301 ) ( ON ?auto_323303 ?auto_323302 ) ( not ( = ?auto_323295 ?auto_323296 ) ) ( not ( = ?auto_323295 ?auto_323297 ) ) ( not ( = ?auto_323295 ?auto_323298 ) ) ( not ( = ?auto_323295 ?auto_323299 ) ) ( not ( = ?auto_323295 ?auto_323300 ) ) ( not ( = ?auto_323295 ?auto_323301 ) ) ( not ( = ?auto_323295 ?auto_323302 ) ) ( not ( = ?auto_323295 ?auto_323303 ) ) ( not ( = ?auto_323295 ?auto_323304 ) ) ( not ( = ?auto_323295 ?auto_323305 ) ) ( not ( = ?auto_323296 ?auto_323297 ) ) ( not ( = ?auto_323296 ?auto_323298 ) ) ( not ( = ?auto_323296 ?auto_323299 ) ) ( not ( = ?auto_323296 ?auto_323300 ) ) ( not ( = ?auto_323296 ?auto_323301 ) ) ( not ( = ?auto_323296 ?auto_323302 ) ) ( not ( = ?auto_323296 ?auto_323303 ) ) ( not ( = ?auto_323296 ?auto_323304 ) ) ( not ( = ?auto_323296 ?auto_323305 ) ) ( not ( = ?auto_323297 ?auto_323298 ) ) ( not ( = ?auto_323297 ?auto_323299 ) ) ( not ( = ?auto_323297 ?auto_323300 ) ) ( not ( = ?auto_323297 ?auto_323301 ) ) ( not ( = ?auto_323297 ?auto_323302 ) ) ( not ( = ?auto_323297 ?auto_323303 ) ) ( not ( = ?auto_323297 ?auto_323304 ) ) ( not ( = ?auto_323297 ?auto_323305 ) ) ( not ( = ?auto_323298 ?auto_323299 ) ) ( not ( = ?auto_323298 ?auto_323300 ) ) ( not ( = ?auto_323298 ?auto_323301 ) ) ( not ( = ?auto_323298 ?auto_323302 ) ) ( not ( = ?auto_323298 ?auto_323303 ) ) ( not ( = ?auto_323298 ?auto_323304 ) ) ( not ( = ?auto_323298 ?auto_323305 ) ) ( not ( = ?auto_323299 ?auto_323300 ) ) ( not ( = ?auto_323299 ?auto_323301 ) ) ( not ( = ?auto_323299 ?auto_323302 ) ) ( not ( = ?auto_323299 ?auto_323303 ) ) ( not ( = ?auto_323299 ?auto_323304 ) ) ( not ( = ?auto_323299 ?auto_323305 ) ) ( not ( = ?auto_323300 ?auto_323301 ) ) ( not ( = ?auto_323300 ?auto_323302 ) ) ( not ( = ?auto_323300 ?auto_323303 ) ) ( not ( = ?auto_323300 ?auto_323304 ) ) ( not ( = ?auto_323300 ?auto_323305 ) ) ( not ( = ?auto_323301 ?auto_323302 ) ) ( not ( = ?auto_323301 ?auto_323303 ) ) ( not ( = ?auto_323301 ?auto_323304 ) ) ( not ( = ?auto_323301 ?auto_323305 ) ) ( not ( = ?auto_323302 ?auto_323303 ) ) ( not ( = ?auto_323302 ?auto_323304 ) ) ( not ( = ?auto_323302 ?auto_323305 ) ) ( not ( = ?auto_323303 ?auto_323304 ) ) ( not ( = ?auto_323303 ?auto_323305 ) ) ( not ( = ?auto_323304 ?auto_323305 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_323304 ?auto_323305 )
      ( !STACK ?auto_323304 ?auto_323303 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_323337 - BLOCK
      ?auto_323338 - BLOCK
      ?auto_323339 - BLOCK
      ?auto_323340 - BLOCK
      ?auto_323341 - BLOCK
      ?auto_323342 - BLOCK
      ?auto_323343 - BLOCK
      ?auto_323344 - BLOCK
      ?auto_323345 - BLOCK
      ?auto_323346 - BLOCK
    )
    :vars
    (
      ?auto_323347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323346 ?auto_323347 ) ( ON-TABLE ?auto_323337 ) ( ON ?auto_323338 ?auto_323337 ) ( ON ?auto_323339 ?auto_323338 ) ( ON ?auto_323340 ?auto_323339 ) ( ON ?auto_323341 ?auto_323340 ) ( ON ?auto_323342 ?auto_323341 ) ( ON ?auto_323343 ?auto_323342 ) ( ON ?auto_323344 ?auto_323343 ) ( not ( = ?auto_323337 ?auto_323338 ) ) ( not ( = ?auto_323337 ?auto_323339 ) ) ( not ( = ?auto_323337 ?auto_323340 ) ) ( not ( = ?auto_323337 ?auto_323341 ) ) ( not ( = ?auto_323337 ?auto_323342 ) ) ( not ( = ?auto_323337 ?auto_323343 ) ) ( not ( = ?auto_323337 ?auto_323344 ) ) ( not ( = ?auto_323337 ?auto_323345 ) ) ( not ( = ?auto_323337 ?auto_323346 ) ) ( not ( = ?auto_323337 ?auto_323347 ) ) ( not ( = ?auto_323338 ?auto_323339 ) ) ( not ( = ?auto_323338 ?auto_323340 ) ) ( not ( = ?auto_323338 ?auto_323341 ) ) ( not ( = ?auto_323338 ?auto_323342 ) ) ( not ( = ?auto_323338 ?auto_323343 ) ) ( not ( = ?auto_323338 ?auto_323344 ) ) ( not ( = ?auto_323338 ?auto_323345 ) ) ( not ( = ?auto_323338 ?auto_323346 ) ) ( not ( = ?auto_323338 ?auto_323347 ) ) ( not ( = ?auto_323339 ?auto_323340 ) ) ( not ( = ?auto_323339 ?auto_323341 ) ) ( not ( = ?auto_323339 ?auto_323342 ) ) ( not ( = ?auto_323339 ?auto_323343 ) ) ( not ( = ?auto_323339 ?auto_323344 ) ) ( not ( = ?auto_323339 ?auto_323345 ) ) ( not ( = ?auto_323339 ?auto_323346 ) ) ( not ( = ?auto_323339 ?auto_323347 ) ) ( not ( = ?auto_323340 ?auto_323341 ) ) ( not ( = ?auto_323340 ?auto_323342 ) ) ( not ( = ?auto_323340 ?auto_323343 ) ) ( not ( = ?auto_323340 ?auto_323344 ) ) ( not ( = ?auto_323340 ?auto_323345 ) ) ( not ( = ?auto_323340 ?auto_323346 ) ) ( not ( = ?auto_323340 ?auto_323347 ) ) ( not ( = ?auto_323341 ?auto_323342 ) ) ( not ( = ?auto_323341 ?auto_323343 ) ) ( not ( = ?auto_323341 ?auto_323344 ) ) ( not ( = ?auto_323341 ?auto_323345 ) ) ( not ( = ?auto_323341 ?auto_323346 ) ) ( not ( = ?auto_323341 ?auto_323347 ) ) ( not ( = ?auto_323342 ?auto_323343 ) ) ( not ( = ?auto_323342 ?auto_323344 ) ) ( not ( = ?auto_323342 ?auto_323345 ) ) ( not ( = ?auto_323342 ?auto_323346 ) ) ( not ( = ?auto_323342 ?auto_323347 ) ) ( not ( = ?auto_323343 ?auto_323344 ) ) ( not ( = ?auto_323343 ?auto_323345 ) ) ( not ( = ?auto_323343 ?auto_323346 ) ) ( not ( = ?auto_323343 ?auto_323347 ) ) ( not ( = ?auto_323344 ?auto_323345 ) ) ( not ( = ?auto_323344 ?auto_323346 ) ) ( not ( = ?auto_323344 ?auto_323347 ) ) ( not ( = ?auto_323345 ?auto_323346 ) ) ( not ( = ?auto_323345 ?auto_323347 ) ) ( not ( = ?auto_323346 ?auto_323347 ) ) ( CLEAR ?auto_323344 ) ( ON ?auto_323345 ?auto_323346 ) ( CLEAR ?auto_323345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_323337 ?auto_323338 ?auto_323339 ?auto_323340 ?auto_323341 ?auto_323342 ?auto_323343 ?auto_323344 ?auto_323345 )
      ( MAKE-10PILE ?auto_323337 ?auto_323338 ?auto_323339 ?auto_323340 ?auto_323341 ?auto_323342 ?auto_323343 ?auto_323344 ?auto_323345 ?auto_323346 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_323379 - BLOCK
      ?auto_323380 - BLOCK
      ?auto_323381 - BLOCK
      ?auto_323382 - BLOCK
      ?auto_323383 - BLOCK
      ?auto_323384 - BLOCK
      ?auto_323385 - BLOCK
      ?auto_323386 - BLOCK
      ?auto_323387 - BLOCK
      ?auto_323388 - BLOCK
    )
    :vars
    (
      ?auto_323389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323388 ?auto_323389 ) ( ON-TABLE ?auto_323379 ) ( ON ?auto_323380 ?auto_323379 ) ( ON ?auto_323381 ?auto_323380 ) ( ON ?auto_323382 ?auto_323381 ) ( ON ?auto_323383 ?auto_323382 ) ( ON ?auto_323384 ?auto_323383 ) ( ON ?auto_323385 ?auto_323384 ) ( not ( = ?auto_323379 ?auto_323380 ) ) ( not ( = ?auto_323379 ?auto_323381 ) ) ( not ( = ?auto_323379 ?auto_323382 ) ) ( not ( = ?auto_323379 ?auto_323383 ) ) ( not ( = ?auto_323379 ?auto_323384 ) ) ( not ( = ?auto_323379 ?auto_323385 ) ) ( not ( = ?auto_323379 ?auto_323386 ) ) ( not ( = ?auto_323379 ?auto_323387 ) ) ( not ( = ?auto_323379 ?auto_323388 ) ) ( not ( = ?auto_323379 ?auto_323389 ) ) ( not ( = ?auto_323380 ?auto_323381 ) ) ( not ( = ?auto_323380 ?auto_323382 ) ) ( not ( = ?auto_323380 ?auto_323383 ) ) ( not ( = ?auto_323380 ?auto_323384 ) ) ( not ( = ?auto_323380 ?auto_323385 ) ) ( not ( = ?auto_323380 ?auto_323386 ) ) ( not ( = ?auto_323380 ?auto_323387 ) ) ( not ( = ?auto_323380 ?auto_323388 ) ) ( not ( = ?auto_323380 ?auto_323389 ) ) ( not ( = ?auto_323381 ?auto_323382 ) ) ( not ( = ?auto_323381 ?auto_323383 ) ) ( not ( = ?auto_323381 ?auto_323384 ) ) ( not ( = ?auto_323381 ?auto_323385 ) ) ( not ( = ?auto_323381 ?auto_323386 ) ) ( not ( = ?auto_323381 ?auto_323387 ) ) ( not ( = ?auto_323381 ?auto_323388 ) ) ( not ( = ?auto_323381 ?auto_323389 ) ) ( not ( = ?auto_323382 ?auto_323383 ) ) ( not ( = ?auto_323382 ?auto_323384 ) ) ( not ( = ?auto_323382 ?auto_323385 ) ) ( not ( = ?auto_323382 ?auto_323386 ) ) ( not ( = ?auto_323382 ?auto_323387 ) ) ( not ( = ?auto_323382 ?auto_323388 ) ) ( not ( = ?auto_323382 ?auto_323389 ) ) ( not ( = ?auto_323383 ?auto_323384 ) ) ( not ( = ?auto_323383 ?auto_323385 ) ) ( not ( = ?auto_323383 ?auto_323386 ) ) ( not ( = ?auto_323383 ?auto_323387 ) ) ( not ( = ?auto_323383 ?auto_323388 ) ) ( not ( = ?auto_323383 ?auto_323389 ) ) ( not ( = ?auto_323384 ?auto_323385 ) ) ( not ( = ?auto_323384 ?auto_323386 ) ) ( not ( = ?auto_323384 ?auto_323387 ) ) ( not ( = ?auto_323384 ?auto_323388 ) ) ( not ( = ?auto_323384 ?auto_323389 ) ) ( not ( = ?auto_323385 ?auto_323386 ) ) ( not ( = ?auto_323385 ?auto_323387 ) ) ( not ( = ?auto_323385 ?auto_323388 ) ) ( not ( = ?auto_323385 ?auto_323389 ) ) ( not ( = ?auto_323386 ?auto_323387 ) ) ( not ( = ?auto_323386 ?auto_323388 ) ) ( not ( = ?auto_323386 ?auto_323389 ) ) ( not ( = ?auto_323387 ?auto_323388 ) ) ( not ( = ?auto_323387 ?auto_323389 ) ) ( not ( = ?auto_323388 ?auto_323389 ) ) ( ON ?auto_323387 ?auto_323388 ) ( CLEAR ?auto_323385 ) ( ON ?auto_323386 ?auto_323387 ) ( CLEAR ?auto_323386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_323379 ?auto_323380 ?auto_323381 ?auto_323382 ?auto_323383 ?auto_323384 ?auto_323385 ?auto_323386 )
      ( MAKE-10PILE ?auto_323379 ?auto_323380 ?auto_323381 ?auto_323382 ?auto_323383 ?auto_323384 ?auto_323385 ?auto_323386 ?auto_323387 ?auto_323388 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_323421 - BLOCK
      ?auto_323422 - BLOCK
      ?auto_323423 - BLOCK
      ?auto_323424 - BLOCK
      ?auto_323425 - BLOCK
      ?auto_323426 - BLOCK
      ?auto_323427 - BLOCK
      ?auto_323428 - BLOCK
      ?auto_323429 - BLOCK
      ?auto_323430 - BLOCK
    )
    :vars
    (
      ?auto_323431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323430 ?auto_323431 ) ( ON-TABLE ?auto_323421 ) ( ON ?auto_323422 ?auto_323421 ) ( ON ?auto_323423 ?auto_323422 ) ( ON ?auto_323424 ?auto_323423 ) ( ON ?auto_323425 ?auto_323424 ) ( ON ?auto_323426 ?auto_323425 ) ( not ( = ?auto_323421 ?auto_323422 ) ) ( not ( = ?auto_323421 ?auto_323423 ) ) ( not ( = ?auto_323421 ?auto_323424 ) ) ( not ( = ?auto_323421 ?auto_323425 ) ) ( not ( = ?auto_323421 ?auto_323426 ) ) ( not ( = ?auto_323421 ?auto_323427 ) ) ( not ( = ?auto_323421 ?auto_323428 ) ) ( not ( = ?auto_323421 ?auto_323429 ) ) ( not ( = ?auto_323421 ?auto_323430 ) ) ( not ( = ?auto_323421 ?auto_323431 ) ) ( not ( = ?auto_323422 ?auto_323423 ) ) ( not ( = ?auto_323422 ?auto_323424 ) ) ( not ( = ?auto_323422 ?auto_323425 ) ) ( not ( = ?auto_323422 ?auto_323426 ) ) ( not ( = ?auto_323422 ?auto_323427 ) ) ( not ( = ?auto_323422 ?auto_323428 ) ) ( not ( = ?auto_323422 ?auto_323429 ) ) ( not ( = ?auto_323422 ?auto_323430 ) ) ( not ( = ?auto_323422 ?auto_323431 ) ) ( not ( = ?auto_323423 ?auto_323424 ) ) ( not ( = ?auto_323423 ?auto_323425 ) ) ( not ( = ?auto_323423 ?auto_323426 ) ) ( not ( = ?auto_323423 ?auto_323427 ) ) ( not ( = ?auto_323423 ?auto_323428 ) ) ( not ( = ?auto_323423 ?auto_323429 ) ) ( not ( = ?auto_323423 ?auto_323430 ) ) ( not ( = ?auto_323423 ?auto_323431 ) ) ( not ( = ?auto_323424 ?auto_323425 ) ) ( not ( = ?auto_323424 ?auto_323426 ) ) ( not ( = ?auto_323424 ?auto_323427 ) ) ( not ( = ?auto_323424 ?auto_323428 ) ) ( not ( = ?auto_323424 ?auto_323429 ) ) ( not ( = ?auto_323424 ?auto_323430 ) ) ( not ( = ?auto_323424 ?auto_323431 ) ) ( not ( = ?auto_323425 ?auto_323426 ) ) ( not ( = ?auto_323425 ?auto_323427 ) ) ( not ( = ?auto_323425 ?auto_323428 ) ) ( not ( = ?auto_323425 ?auto_323429 ) ) ( not ( = ?auto_323425 ?auto_323430 ) ) ( not ( = ?auto_323425 ?auto_323431 ) ) ( not ( = ?auto_323426 ?auto_323427 ) ) ( not ( = ?auto_323426 ?auto_323428 ) ) ( not ( = ?auto_323426 ?auto_323429 ) ) ( not ( = ?auto_323426 ?auto_323430 ) ) ( not ( = ?auto_323426 ?auto_323431 ) ) ( not ( = ?auto_323427 ?auto_323428 ) ) ( not ( = ?auto_323427 ?auto_323429 ) ) ( not ( = ?auto_323427 ?auto_323430 ) ) ( not ( = ?auto_323427 ?auto_323431 ) ) ( not ( = ?auto_323428 ?auto_323429 ) ) ( not ( = ?auto_323428 ?auto_323430 ) ) ( not ( = ?auto_323428 ?auto_323431 ) ) ( not ( = ?auto_323429 ?auto_323430 ) ) ( not ( = ?auto_323429 ?auto_323431 ) ) ( not ( = ?auto_323430 ?auto_323431 ) ) ( ON ?auto_323429 ?auto_323430 ) ( ON ?auto_323428 ?auto_323429 ) ( CLEAR ?auto_323426 ) ( ON ?auto_323427 ?auto_323428 ) ( CLEAR ?auto_323427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_323421 ?auto_323422 ?auto_323423 ?auto_323424 ?auto_323425 ?auto_323426 ?auto_323427 )
      ( MAKE-10PILE ?auto_323421 ?auto_323422 ?auto_323423 ?auto_323424 ?auto_323425 ?auto_323426 ?auto_323427 ?auto_323428 ?auto_323429 ?auto_323430 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_323463 - BLOCK
      ?auto_323464 - BLOCK
      ?auto_323465 - BLOCK
      ?auto_323466 - BLOCK
      ?auto_323467 - BLOCK
      ?auto_323468 - BLOCK
      ?auto_323469 - BLOCK
      ?auto_323470 - BLOCK
      ?auto_323471 - BLOCK
      ?auto_323472 - BLOCK
    )
    :vars
    (
      ?auto_323473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323472 ?auto_323473 ) ( ON-TABLE ?auto_323463 ) ( ON ?auto_323464 ?auto_323463 ) ( ON ?auto_323465 ?auto_323464 ) ( ON ?auto_323466 ?auto_323465 ) ( ON ?auto_323467 ?auto_323466 ) ( not ( = ?auto_323463 ?auto_323464 ) ) ( not ( = ?auto_323463 ?auto_323465 ) ) ( not ( = ?auto_323463 ?auto_323466 ) ) ( not ( = ?auto_323463 ?auto_323467 ) ) ( not ( = ?auto_323463 ?auto_323468 ) ) ( not ( = ?auto_323463 ?auto_323469 ) ) ( not ( = ?auto_323463 ?auto_323470 ) ) ( not ( = ?auto_323463 ?auto_323471 ) ) ( not ( = ?auto_323463 ?auto_323472 ) ) ( not ( = ?auto_323463 ?auto_323473 ) ) ( not ( = ?auto_323464 ?auto_323465 ) ) ( not ( = ?auto_323464 ?auto_323466 ) ) ( not ( = ?auto_323464 ?auto_323467 ) ) ( not ( = ?auto_323464 ?auto_323468 ) ) ( not ( = ?auto_323464 ?auto_323469 ) ) ( not ( = ?auto_323464 ?auto_323470 ) ) ( not ( = ?auto_323464 ?auto_323471 ) ) ( not ( = ?auto_323464 ?auto_323472 ) ) ( not ( = ?auto_323464 ?auto_323473 ) ) ( not ( = ?auto_323465 ?auto_323466 ) ) ( not ( = ?auto_323465 ?auto_323467 ) ) ( not ( = ?auto_323465 ?auto_323468 ) ) ( not ( = ?auto_323465 ?auto_323469 ) ) ( not ( = ?auto_323465 ?auto_323470 ) ) ( not ( = ?auto_323465 ?auto_323471 ) ) ( not ( = ?auto_323465 ?auto_323472 ) ) ( not ( = ?auto_323465 ?auto_323473 ) ) ( not ( = ?auto_323466 ?auto_323467 ) ) ( not ( = ?auto_323466 ?auto_323468 ) ) ( not ( = ?auto_323466 ?auto_323469 ) ) ( not ( = ?auto_323466 ?auto_323470 ) ) ( not ( = ?auto_323466 ?auto_323471 ) ) ( not ( = ?auto_323466 ?auto_323472 ) ) ( not ( = ?auto_323466 ?auto_323473 ) ) ( not ( = ?auto_323467 ?auto_323468 ) ) ( not ( = ?auto_323467 ?auto_323469 ) ) ( not ( = ?auto_323467 ?auto_323470 ) ) ( not ( = ?auto_323467 ?auto_323471 ) ) ( not ( = ?auto_323467 ?auto_323472 ) ) ( not ( = ?auto_323467 ?auto_323473 ) ) ( not ( = ?auto_323468 ?auto_323469 ) ) ( not ( = ?auto_323468 ?auto_323470 ) ) ( not ( = ?auto_323468 ?auto_323471 ) ) ( not ( = ?auto_323468 ?auto_323472 ) ) ( not ( = ?auto_323468 ?auto_323473 ) ) ( not ( = ?auto_323469 ?auto_323470 ) ) ( not ( = ?auto_323469 ?auto_323471 ) ) ( not ( = ?auto_323469 ?auto_323472 ) ) ( not ( = ?auto_323469 ?auto_323473 ) ) ( not ( = ?auto_323470 ?auto_323471 ) ) ( not ( = ?auto_323470 ?auto_323472 ) ) ( not ( = ?auto_323470 ?auto_323473 ) ) ( not ( = ?auto_323471 ?auto_323472 ) ) ( not ( = ?auto_323471 ?auto_323473 ) ) ( not ( = ?auto_323472 ?auto_323473 ) ) ( ON ?auto_323471 ?auto_323472 ) ( ON ?auto_323470 ?auto_323471 ) ( ON ?auto_323469 ?auto_323470 ) ( CLEAR ?auto_323467 ) ( ON ?auto_323468 ?auto_323469 ) ( CLEAR ?auto_323468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_323463 ?auto_323464 ?auto_323465 ?auto_323466 ?auto_323467 ?auto_323468 )
      ( MAKE-10PILE ?auto_323463 ?auto_323464 ?auto_323465 ?auto_323466 ?auto_323467 ?auto_323468 ?auto_323469 ?auto_323470 ?auto_323471 ?auto_323472 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_323505 - BLOCK
      ?auto_323506 - BLOCK
      ?auto_323507 - BLOCK
      ?auto_323508 - BLOCK
      ?auto_323509 - BLOCK
      ?auto_323510 - BLOCK
      ?auto_323511 - BLOCK
      ?auto_323512 - BLOCK
      ?auto_323513 - BLOCK
      ?auto_323514 - BLOCK
    )
    :vars
    (
      ?auto_323515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323514 ?auto_323515 ) ( ON-TABLE ?auto_323505 ) ( ON ?auto_323506 ?auto_323505 ) ( ON ?auto_323507 ?auto_323506 ) ( ON ?auto_323508 ?auto_323507 ) ( not ( = ?auto_323505 ?auto_323506 ) ) ( not ( = ?auto_323505 ?auto_323507 ) ) ( not ( = ?auto_323505 ?auto_323508 ) ) ( not ( = ?auto_323505 ?auto_323509 ) ) ( not ( = ?auto_323505 ?auto_323510 ) ) ( not ( = ?auto_323505 ?auto_323511 ) ) ( not ( = ?auto_323505 ?auto_323512 ) ) ( not ( = ?auto_323505 ?auto_323513 ) ) ( not ( = ?auto_323505 ?auto_323514 ) ) ( not ( = ?auto_323505 ?auto_323515 ) ) ( not ( = ?auto_323506 ?auto_323507 ) ) ( not ( = ?auto_323506 ?auto_323508 ) ) ( not ( = ?auto_323506 ?auto_323509 ) ) ( not ( = ?auto_323506 ?auto_323510 ) ) ( not ( = ?auto_323506 ?auto_323511 ) ) ( not ( = ?auto_323506 ?auto_323512 ) ) ( not ( = ?auto_323506 ?auto_323513 ) ) ( not ( = ?auto_323506 ?auto_323514 ) ) ( not ( = ?auto_323506 ?auto_323515 ) ) ( not ( = ?auto_323507 ?auto_323508 ) ) ( not ( = ?auto_323507 ?auto_323509 ) ) ( not ( = ?auto_323507 ?auto_323510 ) ) ( not ( = ?auto_323507 ?auto_323511 ) ) ( not ( = ?auto_323507 ?auto_323512 ) ) ( not ( = ?auto_323507 ?auto_323513 ) ) ( not ( = ?auto_323507 ?auto_323514 ) ) ( not ( = ?auto_323507 ?auto_323515 ) ) ( not ( = ?auto_323508 ?auto_323509 ) ) ( not ( = ?auto_323508 ?auto_323510 ) ) ( not ( = ?auto_323508 ?auto_323511 ) ) ( not ( = ?auto_323508 ?auto_323512 ) ) ( not ( = ?auto_323508 ?auto_323513 ) ) ( not ( = ?auto_323508 ?auto_323514 ) ) ( not ( = ?auto_323508 ?auto_323515 ) ) ( not ( = ?auto_323509 ?auto_323510 ) ) ( not ( = ?auto_323509 ?auto_323511 ) ) ( not ( = ?auto_323509 ?auto_323512 ) ) ( not ( = ?auto_323509 ?auto_323513 ) ) ( not ( = ?auto_323509 ?auto_323514 ) ) ( not ( = ?auto_323509 ?auto_323515 ) ) ( not ( = ?auto_323510 ?auto_323511 ) ) ( not ( = ?auto_323510 ?auto_323512 ) ) ( not ( = ?auto_323510 ?auto_323513 ) ) ( not ( = ?auto_323510 ?auto_323514 ) ) ( not ( = ?auto_323510 ?auto_323515 ) ) ( not ( = ?auto_323511 ?auto_323512 ) ) ( not ( = ?auto_323511 ?auto_323513 ) ) ( not ( = ?auto_323511 ?auto_323514 ) ) ( not ( = ?auto_323511 ?auto_323515 ) ) ( not ( = ?auto_323512 ?auto_323513 ) ) ( not ( = ?auto_323512 ?auto_323514 ) ) ( not ( = ?auto_323512 ?auto_323515 ) ) ( not ( = ?auto_323513 ?auto_323514 ) ) ( not ( = ?auto_323513 ?auto_323515 ) ) ( not ( = ?auto_323514 ?auto_323515 ) ) ( ON ?auto_323513 ?auto_323514 ) ( ON ?auto_323512 ?auto_323513 ) ( ON ?auto_323511 ?auto_323512 ) ( ON ?auto_323510 ?auto_323511 ) ( CLEAR ?auto_323508 ) ( ON ?auto_323509 ?auto_323510 ) ( CLEAR ?auto_323509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_323505 ?auto_323506 ?auto_323507 ?auto_323508 ?auto_323509 )
      ( MAKE-10PILE ?auto_323505 ?auto_323506 ?auto_323507 ?auto_323508 ?auto_323509 ?auto_323510 ?auto_323511 ?auto_323512 ?auto_323513 ?auto_323514 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_323547 - BLOCK
      ?auto_323548 - BLOCK
      ?auto_323549 - BLOCK
      ?auto_323550 - BLOCK
      ?auto_323551 - BLOCK
      ?auto_323552 - BLOCK
      ?auto_323553 - BLOCK
      ?auto_323554 - BLOCK
      ?auto_323555 - BLOCK
      ?auto_323556 - BLOCK
    )
    :vars
    (
      ?auto_323557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323556 ?auto_323557 ) ( ON-TABLE ?auto_323547 ) ( ON ?auto_323548 ?auto_323547 ) ( ON ?auto_323549 ?auto_323548 ) ( not ( = ?auto_323547 ?auto_323548 ) ) ( not ( = ?auto_323547 ?auto_323549 ) ) ( not ( = ?auto_323547 ?auto_323550 ) ) ( not ( = ?auto_323547 ?auto_323551 ) ) ( not ( = ?auto_323547 ?auto_323552 ) ) ( not ( = ?auto_323547 ?auto_323553 ) ) ( not ( = ?auto_323547 ?auto_323554 ) ) ( not ( = ?auto_323547 ?auto_323555 ) ) ( not ( = ?auto_323547 ?auto_323556 ) ) ( not ( = ?auto_323547 ?auto_323557 ) ) ( not ( = ?auto_323548 ?auto_323549 ) ) ( not ( = ?auto_323548 ?auto_323550 ) ) ( not ( = ?auto_323548 ?auto_323551 ) ) ( not ( = ?auto_323548 ?auto_323552 ) ) ( not ( = ?auto_323548 ?auto_323553 ) ) ( not ( = ?auto_323548 ?auto_323554 ) ) ( not ( = ?auto_323548 ?auto_323555 ) ) ( not ( = ?auto_323548 ?auto_323556 ) ) ( not ( = ?auto_323548 ?auto_323557 ) ) ( not ( = ?auto_323549 ?auto_323550 ) ) ( not ( = ?auto_323549 ?auto_323551 ) ) ( not ( = ?auto_323549 ?auto_323552 ) ) ( not ( = ?auto_323549 ?auto_323553 ) ) ( not ( = ?auto_323549 ?auto_323554 ) ) ( not ( = ?auto_323549 ?auto_323555 ) ) ( not ( = ?auto_323549 ?auto_323556 ) ) ( not ( = ?auto_323549 ?auto_323557 ) ) ( not ( = ?auto_323550 ?auto_323551 ) ) ( not ( = ?auto_323550 ?auto_323552 ) ) ( not ( = ?auto_323550 ?auto_323553 ) ) ( not ( = ?auto_323550 ?auto_323554 ) ) ( not ( = ?auto_323550 ?auto_323555 ) ) ( not ( = ?auto_323550 ?auto_323556 ) ) ( not ( = ?auto_323550 ?auto_323557 ) ) ( not ( = ?auto_323551 ?auto_323552 ) ) ( not ( = ?auto_323551 ?auto_323553 ) ) ( not ( = ?auto_323551 ?auto_323554 ) ) ( not ( = ?auto_323551 ?auto_323555 ) ) ( not ( = ?auto_323551 ?auto_323556 ) ) ( not ( = ?auto_323551 ?auto_323557 ) ) ( not ( = ?auto_323552 ?auto_323553 ) ) ( not ( = ?auto_323552 ?auto_323554 ) ) ( not ( = ?auto_323552 ?auto_323555 ) ) ( not ( = ?auto_323552 ?auto_323556 ) ) ( not ( = ?auto_323552 ?auto_323557 ) ) ( not ( = ?auto_323553 ?auto_323554 ) ) ( not ( = ?auto_323553 ?auto_323555 ) ) ( not ( = ?auto_323553 ?auto_323556 ) ) ( not ( = ?auto_323553 ?auto_323557 ) ) ( not ( = ?auto_323554 ?auto_323555 ) ) ( not ( = ?auto_323554 ?auto_323556 ) ) ( not ( = ?auto_323554 ?auto_323557 ) ) ( not ( = ?auto_323555 ?auto_323556 ) ) ( not ( = ?auto_323555 ?auto_323557 ) ) ( not ( = ?auto_323556 ?auto_323557 ) ) ( ON ?auto_323555 ?auto_323556 ) ( ON ?auto_323554 ?auto_323555 ) ( ON ?auto_323553 ?auto_323554 ) ( ON ?auto_323552 ?auto_323553 ) ( ON ?auto_323551 ?auto_323552 ) ( CLEAR ?auto_323549 ) ( ON ?auto_323550 ?auto_323551 ) ( CLEAR ?auto_323550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_323547 ?auto_323548 ?auto_323549 ?auto_323550 )
      ( MAKE-10PILE ?auto_323547 ?auto_323548 ?auto_323549 ?auto_323550 ?auto_323551 ?auto_323552 ?auto_323553 ?auto_323554 ?auto_323555 ?auto_323556 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_323589 - BLOCK
      ?auto_323590 - BLOCK
      ?auto_323591 - BLOCK
      ?auto_323592 - BLOCK
      ?auto_323593 - BLOCK
      ?auto_323594 - BLOCK
      ?auto_323595 - BLOCK
      ?auto_323596 - BLOCK
      ?auto_323597 - BLOCK
      ?auto_323598 - BLOCK
    )
    :vars
    (
      ?auto_323599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323598 ?auto_323599 ) ( ON-TABLE ?auto_323589 ) ( ON ?auto_323590 ?auto_323589 ) ( not ( = ?auto_323589 ?auto_323590 ) ) ( not ( = ?auto_323589 ?auto_323591 ) ) ( not ( = ?auto_323589 ?auto_323592 ) ) ( not ( = ?auto_323589 ?auto_323593 ) ) ( not ( = ?auto_323589 ?auto_323594 ) ) ( not ( = ?auto_323589 ?auto_323595 ) ) ( not ( = ?auto_323589 ?auto_323596 ) ) ( not ( = ?auto_323589 ?auto_323597 ) ) ( not ( = ?auto_323589 ?auto_323598 ) ) ( not ( = ?auto_323589 ?auto_323599 ) ) ( not ( = ?auto_323590 ?auto_323591 ) ) ( not ( = ?auto_323590 ?auto_323592 ) ) ( not ( = ?auto_323590 ?auto_323593 ) ) ( not ( = ?auto_323590 ?auto_323594 ) ) ( not ( = ?auto_323590 ?auto_323595 ) ) ( not ( = ?auto_323590 ?auto_323596 ) ) ( not ( = ?auto_323590 ?auto_323597 ) ) ( not ( = ?auto_323590 ?auto_323598 ) ) ( not ( = ?auto_323590 ?auto_323599 ) ) ( not ( = ?auto_323591 ?auto_323592 ) ) ( not ( = ?auto_323591 ?auto_323593 ) ) ( not ( = ?auto_323591 ?auto_323594 ) ) ( not ( = ?auto_323591 ?auto_323595 ) ) ( not ( = ?auto_323591 ?auto_323596 ) ) ( not ( = ?auto_323591 ?auto_323597 ) ) ( not ( = ?auto_323591 ?auto_323598 ) ) ( not ( = ?auto_323591 ?auto_323599 ) ) ( not ( = ?auto_323592 ?auto_323593 ) ) ( not ( = ?auto_323592 ?auto_323594 ) ) ( not ( = ?auto_323592 ?auto_323595 ) ) ( not ( = ?auto_323592 ?auto_323596 ) ) ( not ( = ?auto_323592 ?auto_323597 ) ) ( not ( = ?auto_323592 ?auto_323598 ) ) ( not ( = ?auto_323592 ?auto_323599 ) ) ( not ( = ?auto_323593 ?auto_323594 ) ) ( not ( = ?auto_323593 ?auto_323595 ) ) ( not ( = ?auto_323593 ?auto_323596 ) ) ( not ( = ?auto_323593 ?auto_323597 ) ) ( not ( = ?auto_323593 ?auto_323598 ) ) ( not ( = ?auto_323593 ?auto_323599 ) ) ( not ( = ?auto_323594 ?auto_323595 ) ) ( not ( = ?auto_323594 ?auto_323596 ) ) ( not ( = ?auto_323594 ?auto_323597 ) ) ( not ( = ?auto_323594 ?auto_323598 ) ) ( not ( = ?auto_323594 ?auto_323599 ) ) ( not ( = ?auto_323595 ?auto_323596 ) ) ( not ( = ?auto_323595 ?auto_323597 ) ) ( not ( = ?auto_323595 ?auto_323598 ) ) ( not ( = ?auto_323595 ?auto_323599 ) ) ( not ( = ?auto_323596 ?auto_323597 ) ) ( not ( = ?auto_323596 ?auto_323598 ) ) ( not ( = ?auto_323596 ?auto_323599 ) ) ( not ( = ?auto_323597 ?auto_323598 ) ) ( not ( = ?auto_323597 ?auto_323599 ) ) ( not ( = ?auto_323598 ?auto_323599 ) ) ( ON ?auto_323597 ?auto_323598 ) ( ON ?auto_323596 ?auto_323597 ) ( ON ?auto_323595 ?auto_323596 ) ( ON ?auto_323594 ?auto_323595 ) ( ON ?auto_323593 ?auto_323594 ) ( ON ?auto_323592 ?auto_323593 ) ( CLEAR ?auto_323590 ) ( ON ?auto_323591 ?auto_323592 ) ( CLEAR ?auto_323591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_323589 ?auto_323590 ?auto_323591 )
      ( MAKE-10PILE ?auto_323589 ?auto_323590 ?auto_323591 ?auto_323592 ?auto_323593 ?auto_323594 ?auto_323595 ?auto_323596 ?auto_323597 ?auto_323598 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_323631 - BLOCK
      ?auto_323632 - BLOCK
      ?auto_323633 - BLOCK
      ?auto_323634 - BLOCK
      ?auto_323635 - BLOCK
      ?auto_323636 - BLOCK
      ?auto_323637 - BLOCK
      ?auto_323638 - BLOCK
      ?auto_323639 - BLOCK
      ?auto_323640 - BLOCK
    )
    :vars
    (
      ?auto_323641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323640 ?auto_323641 ) ( ON-TABLE ?auto_323631 ) ( not ( = ?auto_323631 ?auto_323632 ) ) ( not ( = ?auto_323631 ?auto_323633 ) ) ( not ( = ?auto_323631 ?auto_323634 ) ) ( not ( = ?auto_323631 ?auto_323635 ) ) ( not ( = ?auto_323631 ?auto_323636 ) ) ( not ( = ?auto_323631 ?auto_323637 ) ) ( not ( = ?auto_323631 ?auto_323638 ) ) ( not ( = ?auto_323631 ?auto_323639 ) ) ( not ( = ?auto_323631 ?auto_323640 ) ) ( not ( = ?auto_323631 ?auto_323641 ) ) ( not ( = ?auto_323632 ?auto_323633 ) ) ( not ( = ?auto_323632 ?auto_323634 ) ) ( not ( = ?auto_323632 ?auto_323635 ) ) ( not ( = ?auto_323632 ?auto_323636 ) ) ( not ( = ?auto_323632 ?auto_323637 ) ) ( not ( = ?auto_323632 ?auto_323638 ) ) ( not ( = ?auto_323632 ?auto_323639 ) ) ( not ( = ?auto_323632 ?auto_323640 ) ) ( not ( = ?auto_323632 ?auto_323641 ) ) ( not ( = ?auto_323633 ?auto_323634 ) ) ( not ( = ?auto_323633 ?auto_323635 ) ) ( not ( = ?auto_323633 ?auto_323636 ) ) ( not ( = ?auto_323633 ?auto_323637 ) ) ( not ( = ?auto_323633 ?auto_323638 ) ) ( not ( = ?auto_323633 ?auto_323639 ) ) ( not ( = ?auto_323633 ?auto_323640 ) ) ( not ( = ?auto_323633 ?auto_323641 ) ) ( not ( = ?auto_323634 ?auto_323635 ) ) ( not ( = ?auto_323634 ?auto_323636 ) ) ( not ( = ?auto_323634 ?auto_323637 ) ) ( not ( = ?auto_323634 ?auto_323638 ) ) ( not ( = ?auto_323634 ?auto_323639 ) ) ( not ( = ?auto_323634 ?auto_323640 ) ) ( not ( = ?auto_323634 ?auto_323641 ) ) ( not ( = ?auto_323635 ?auto_323636 ) ) ( not ( = ?auto_323635 ?auto_323637 ) ) ( not ( = ?auto_323635 ?auto_323638 ) ) ( not ( = ?auto_323635 ?auto_323639 ) ) ( not ( = ?auto_323635 ?auto_323640 ) ) ( not ( = ?auto_323635 ?auto_323641 ) ) ( not ( = ?auto_323636 ?auto_323637 ) ) ( not ( = ?auto_323636 ?auto_323638 ) ) ( not ( = ?auto_323636 ?auto_323639 ) ) ( not ( = ?auto_323636 ?auto_323640 ) ) ( not ( = ?auto_323636 ?auto_323641 ) ) ( not ( = ?auto_323637 ?auto_323638 ) ) ( not ( = ?auto_323637 ?auto_323639 ) ) ( not ( = ?auto_323637 ?auto_323640 ) ) ( not ( = ?auto_323637 ?auto_323641 ) ) ( not ( = ?auto_323638 ?auto_323639 ) ) ( not ( = ?auto_323638 ?auto_323640 ) ) ( not ( = ?auto_323638 ?auto_323641 ) ) ( not ( = ?auto_323639 ?auto_323640 ) ) ( not ( = ?auto_323639 ?auto_323641 ) ) ( not ( = ?auto_323640 ?auto_323641 ) ) ( ON ?auto_323639 ?auto_323640 ) ( ON ?auto_323638 ?auto_323639 ) ( ON ?auto_323637 ?auto_323638 ) ( ON ?auto_323636 ?auto_323637 ) ( ON ?auto_323635 ?auto_323636 ) ( ON ?auto_323634 ?auto_323635 ) ( ON ?auto_323633 ?auto_323634 ) ( CLEAR ?auto_323631 ) ( ON ?auto_323632 ?auto_323633 ) ( CLEAR ?auto_323632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_323631 ?auto_323632 )
      ( MAKE-10PILE ?auto_323631 ?auto_323632 ?auto_323633 ?auto_323634 ?auto_323635 ?auto_323636 ?auto_323637 ?auto_323638 ?auto_323639 ?auto_323640 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_323673 - BLOCK
      ?auto_323674 - BLOCK
      ?auto_323675 - BLOCK
      ?auto_323676 - BLOCK
      ?auto_323677 - BLOCK
      ?auto_323678 - BLOCK
      ?auto_323679 - BLOCK
      ?auto_323680 - BLOCK
      ?auto_323681 - BLOCK
      ?auto_323682 - BLOCK
    )
    :vars
    (
      ?auto_323683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323682 ?auto_323683 ) ( not ( = ?auto_323673 ?auto_323674 ) ) ( not ( = ?auto_323673 ?auto_323675 ) ) ( not ( = ?auto_323673 ?auto_323676 ) ) ( not ( = ?auto_323673 ?auto_323677 ) ) ( not ( = ?auto_323673 ?auto_323678 ) ) ( not ( = ?auto_323673 ?auto_323679 ) ) ( not ( = ?auto_323673 ?auto_323680 ) ) ( not ( = ?auto_323673 ?auto_323681 ) ) ( not ( = ?auto_323673 ?auto_323682 ) ) ( not ( = ?auto_323673 ?auto_323683 ) ) ( not ( = ?auto_323674 ?auto_323675 ) ) ( not ( = ?auto_323674 ?auto_323676 ) ) ( not ( = ?auto_323674 ?auto_323677 ) ) ( not ( = ?auto_323674 ?auto_323678 ) ) ( not ( = ?auto_323674 ?auto_323679 ) ) ( not ( = ?auto_323674 ?auto_323680 ) ) ( not ( = ?auto_323674 ?auto_323681 ) ) ( not ( = ?auto_323674 ?auto_323682 ) ) ( not ( = ?auto_323674 ?auto_323683 ) ) ( not ( = ?auto_323675 ?auto_323676 ) ) ( not ( = ?auto_323675 ?auto_323677 ) ) ( not ( = ?auto_323675 ?auto_323678 ) ) ( not ( = ?auto_323675 ?auto_323679 ) ) ( not ( = ?auto_323675 ?auto_323680 ) ) ( not ( = ?auto_323675 ?auto_323681 ) ) ( not ( = ?auto_323675 ?auto_323682 ) ) ( not ( = ?auto_323675 ?auto_323683 ) ) ( not ( = ?auto_323676 ?auto_323677 ) ) ( not ( = ?auto_323676 ?auto_323678 ) ) ( not ( = ?auto_323676 ?auto_323679 ) ) ( not ( = ?auto_323676 ?auto_323680 ) ) ( not ( = ?auto_323676 ?auto_323681 ) ) ( not ( = ?auto_323676 ?auto_323682 ) ) ( not ( = ?auto_323676 ?auto_323683 ) ) ( not ( = ?auto_323677 ?auto_323678 ) ) ( not ( = ?auto_323677 ?auto_323679 ) ) ( not ( = ?auto_323677 ?auto_323680 ) ) ( not ( = ?auto_323677 ?auto_323681 ) ) ( not ( = ?auto_323677 ?auto_323682 ) ) ( not ( = ?auto_323677 ?auto_323683 ) ) ( not ( = ?auto_323678 ?auto_323679 ) ) ( not ( = ?auto_323678 ?auto_323680 ) ) ( not ( = ?auto_323678 ?auto_323681 ) ) ( not ( = ?auto_323678 ?auto_323682 ) ) ( not ( = ?auto_323678 ?auto_323683 ) ) ( not ( = ?auto_323679 ?auto_323680 ) ) ( not ( = ?auto_323679 ?auto_323681 ) ) ( not ( = ?auto_323679 ?auto_323682 ) ) ( not ( = ?auto_323679 ?auto_323683 ) ) ( not ( = ?auto_323680 ?auto_323681 ) ) ( not ( = ?auto_323680 ?auto_323682 ) ) ( not ( = ?auto_323680 ?auto_323683 ) ) ( not ( = ?auto_323681 ?auto_323682 ) ) ( not ( = ?auto_323681 ?auto_323683 ) ) ( not ( = ?auto_323682 ?auto_323683 ) ) ( ON ?auto_323681 ?auto_323682 ) ( ON ?auto_323680 ?auto_323681 ) ( ON ?auto_323679 ?auto_323680 ) ( ON ?auto_323678 ?auto_323679 ) ( ON ?auto_323677 ?auto_323678 ) ( ON ?auto_323676 ?auto_323677 ) ( ON ?auto_323675 ?auto_323676 ) ( ON ?auto_323674 ?auto_323675 ) ( ON ?auto_323673 ?auto_323674 ) ( CLEAR ?auto_323673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_323673 )
      ( MAKE-10PILE ?auto_323673 ?auto_323674 ?auto_323675 ?auto_323676 ?auto_323677 ?auto_323678 ?auto_323679 ?auto_323680 ?auto_323681 ?auto_323682 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_323716 - BLOCK
      ?auto_323717 - BLOCK
      ?auto_323718 - BLOCK
      ?auto_323719 - BLOCK
      ?auto_323720 - BLOCK
      ?auto_323721 - BLOCK
      ?auto_323722 - BLOCK
      ?auto_323723 - BLOCK
      ?auto_323724 - BLOCK
      ?auto_323725 - BLOCK
      ?auto_323726 - BLOCK
    )
    :vars
    (
      ?auto_323727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_323725 ) ( ON ?auto_323726 ?auto_323727 ) ( CLEAR ?auto_323726 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_323716 ) ( ON ?auto_323717 ?auto_323716 ) ( ON ?auto_323718 ?auto_323717 ) ( ON ?auto_323719 ?auto_323718 ) ( ON ?auto_323720 ?auto_323719 ) ( ON ?auto_323721 ?auto_323720 ) ( ON ?auto_323722 ?auto_323721 ) ( ON ?auto_323723 ?auto_323722 ) ( ON ?auto_323724 ?auto_323723 ) ( ON ?auto_323725 ?auto_323724 ) ( not ( = ?auto_323716 ?auto_323717 ) ) ( not ( = ?auto_323716 ?auto_323718 ) ) ( not ( = ?auto_323716 ?auto_323719 ) ) ( not ( = ?auto_323716 ?auto_323720 ) ) ( not ( = ?auto_323716 ?auto_323721 ) ) ( not ( = ?auto_323716 ?auto_323722 ) ) ( not ( = ?auto_323716 ?auto_323723 ) ) ( not ( = ?auto_323716 ?auto_323724 ) ) ( not ( = ?auto_323716 ?auto_323725 ) ) ( not ( = ?auto_323716 ?auto_323726 ) ) ( not ( = ?auto_323716 ?auto_323727 ) ) ( not ( = ?auto_323717 ?auto_323718 ) ) ( not ( = ?auto_323717 ?auto_323719 ) ) ( not ( = ?auto_323717 ?auto_323720 ) ) ( not ( = ?auto_323717 ?auto_323721 ) ) ( not ( = ?auto_323717 ?auto_323722 ) ) ( not ( = ?auto_323717 ?auto_323723 ) ) ( not ( = ?auto_323717 ?auto_323724 ) ) ( not ( = ?auto_323717 ?auto_323725 ) ) ( not ( = ?auto_323717 ?auto_323726 ) ) ( not ( = ?auto_323717 ?auto_323727 ) ) ( not ( = ?auto_323718 ?auto_323719 ) ) ( not ( = ?auto_323718 ?auto_323720 ) ) ( not ( = ?auto_323718 ?auto_323721 ) ) ( not ( = ?auto_323718 ?auto_323722 ) ) ( not ( = ?auto_323718 ?auto_323723 ) ) ( not ( = ?auto_323718 ?auto_323724 ) ) ( not ( = ?auto_323718 ?auto_323725 ) ) ( not ( = ?auto_323718 ?auto_323726 ) ) ( not ( = ?auto_323718 ?auto_323727 ) ) ( not ( = ?auto_323719 ?auto_323720 ) ) ( not ( = ?auto_323719 ?auto_323721 ) ) ( not ( = ?auto_323719 ?auto_323722 ) ) ( not ( = ?auto_323719 ?auto_323723 ) ) ( not ( = ?auto_323719 ?auto_323724 ) ) ( not ( = ?auto_323719 ?auto_323725 ) ) ( not ( = ?auto_323719 ?auto_323726 ) ) ( not ( = ?auto_323719 ?auto_323727 ) ) ( not ( = ?auto_323720 ?auto_323721 ) ) ( not ( = ?auto_323720 ?auto_323722 ) ) ( not ( = ?auto_323720 ?auto_323723 ) ) ( not ( = ?auto_323720 ?auto_323724 ) ) ( not ( = ?auto_323720 ?auto_323725 ) ) ( not ( = ?auto_323720 ?auto_323726 ) ) ( not ( = ?auto_323720 ?auto_323727 ) ) ( not ( = ?auto_323721 ?auto_323722 ) ) ( not ( = ?auto_323721 ?auto_323723 ) ) ( not ( = ?auto_323721 ?auto_323724 ) ) ( not ( = ?auto_323721 ?auto_323725 ) ) ( not ( = ?auto_323721 ?auto_323726 ) ) ( not ( = ?auto_323721 ?auto_323727 ) ) ( not ( = ?auto_323722 ?auto_323723 ) ) ( not ( = ?auto_323722 ?auto_323724 ) ) ( not ( = ?auto_323722 ?auto_323725 ) ) ( not ( = ?auto_323722 ?auto_323726 ) ) ( not ( = ?auto_323722 ?auto_323727 ) ) ( not ( = ?auto_323723 ?auto_323724 ) ) ( not ( = ?auto_323723 ?auto_323725 ) ) ( not ( = ?auto_323723 ?auto_323726 ) ) ( not ( = ?auto_323723 ?auto_323727 ) ) ( not ( = ?auto_323724 ?auto_323725 ) ) ( not ( = ?auto_323724 ?auto_323726 ) ) ( not ( = ?auto_323724 ?auto_323727 ) ) ( not ( = ?auto_323725 ?auto_323726 ) ) ( not ( = ?auto_323725 ?auto_323727 ) ) ( not ( = ?auto_323726 ?auto_323727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_323726 ?auto_323727 )
      ( !STACK ?auto_323726 ?auto_323725 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_323762 - BLOCK
      ?auto_323763 - BLOCK
      ?auto_323764 - BLOCK
      ?auto_323765 - BLOCK
      ?auto_323766 - BLOCK
      ?auto_323767 - BLOCK
      ?auto_323768 - BLOCK
      ?auto_323769 - BLOCK
      ?auto_323770 - BLOCK
      ?auto_323771 - BLOCK
      ?auto_323772 - BLOCK
    )
    :vars
    (
      ?auto_323773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323772 ?auto_323773 ) ( ON-TABLE ?auto_323762 ) ( ON ?auto_323763 ?auto_323762 ) ( ON ?auto_323764 ?auto_323763 ) ( ON ?auto_323765 ?auto_323764 ) ( ON ?auto_323766 ?auto_323765 ) ( ON ?auto_323767 ?auto_323766 ) ( ON ?auto_323768 ?auto_323767 ) ( ON ?auto_323769 ?auto_323768 ) ( ON ?auto_323770 ?auto_323769 ) ( not ( = ?auto_323762 ?auto_323763 ) ) ( not ( = ?auto_323762 ?auto_323764 ) ) ( not ( = ?auto_323762 ?auto_323765 ) ) ( not ( = ?auto_323762 ?auto_323766 ) ) ( not ( = ?auto_323762 ?auto_323767 ) ) ( not ( = ?auto_323762 ?auto_323768 ) ) ( not ( = ?auto_323762 ?auto_323769 ) ) ( not ( = ?auto_323762 ?auto_323770 ) ) ( not ( = ?auto_323762 ?auto_323771 ) ) ( not ( = ?auto_323762 ?auto_323772 ) ) ( not ( = ?auto_323762 ?auto_323773 ) ) ( not ( = ?auto_323763 ?auto_323764 ) ) ( not ( = ?auto_323763 ?auto_323765 ) ) ( not ( = ?auto_323763 ?auto_323766 ) ) ( not ( = ?auto_323763 ?auto_323767 ) ) ( not ( = ?auto_323763 ?auto_323768 ) ) ( not ( = ?auto_323763 ?auto_323769 ) ) ( not ( = ?auto_323763 ?auto_323770 ) ) ( not ( = ?auto_323763 ?auto_323771 ) ) ( not ( = ?auto_323763 ?auto_323772 ) ) ( not ( = ?auto_323763 ?auto_323773 ) ) ( not ( = ?auto_323764 ?auto_323765 ) ) ( not ( = ?auto_323764 ?auto_323766 ) ) ( not ( = ?auto_323764 ?auto_323767 ) ) ( not ( = ?auto_323764 ?auto_323768 ) ) ( not ( = ?auto_323764 ?auto_323769 ) ) ( not ( = ?auto_323764 ?auto_323770 ) ) ( not ( = ?auto_323764 ?auto_323771 ) ) ( not ( = ?auto_323764 ?auto_323772 ) ) ( not ( = ?auto_323764 ?auto_323773 ) ) ( not ( = ?auto_323765 ?auto_323766 ) ) ( not ( = ?auto_323765 ?auto_323767 ) ) ( not ( = ?auto_323765 ?auto_323768 ) ) ( not ( = ?auto_323765 ?auto_323769 ) ) ( not ( = ?auto_323765 ?auto_323770 ) ) ( not ( = ?auto_323765 ?auto_323771 ) ) ( not ( = ?auto_323765 ?auto_323772 ) ) ( not ( = ?auto_323765 ?auto_323773 ) ) ( not ( = ?auto_323766 ?auto_323767 ) ) ( not ( = ?auto_323766 ?auto_323768 ) ) ( not ( = ?auto_323766 ?auto_323769 ) ) ( not ( = ?auto_323766 ?auto_323770 ) ) ( not ( = ?auto_323766 ?auto_323771 ) ) ( not ( = ?auto_323766 ?auto_323772 ) ) ( not ( = ?auto_323766 ?auto_323773 ) ) ( not ( = ?auto_323767 ?auto_323768 ) ) ( not ( = ?auto_323767 ?auto_323769 ) ) ( not ( = ?auto_323767 ?auto_323770 ) ) ( not ( = ?auto_323767 ?auto_323771 ) ) ( not ( = ?auto_323767 ?auto_323772 ) ) ( not ( = ?auto_323767 ?auto_323773 ) ) ( not ( = ?auto_323768 ?auto_323769 ) ) ( not ( = ?auto_323768 ?auto_323770 ) ) ( not ( = ?auto_323768 ?auto_323771 ) ) ( not ( = ?auto_323768 ?auto_323772 ) ) ( not ( = ?auto_323768 ?auto_323773 ) ) ( not ( = ?auto_323769 ?auto_323770 ) ) ( not ( = ?auto_323769 ?auto_323771 ) ) ( not ( = ?auto_323769 ?auto_323772 ) ) ( not ( = ?auto_323769 ?auto_323773 ) ) ( not ( = ?auto_323770 ?auto_323771 ) ) ( not ( = ?auto_323770 ?auto_323772 ) ) ( not ( = ?auto_323770 ?auto_323773 ) ) ( not ( = ?auto_323771 ?auto_323772 ) ) ( not ( = ?auto_323771 ?auto_323773 ) ) ( not ( = ?auto_323772 ?auto_323773 ) ) ( CLEAR ?auto_323770 ) ( ON ?auto_323771 ?auto_323772 ) ( CLEAR ?auto_323771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_323762 ?auto_323763 ?auto_323764 ?auto_323765 ?auto_323766 ?auto_323767 ?auto_323768 ?auto_323769 ?auto_323770 ?auto_323771 )
      ( MAKE-11PILE ?auto_323762 ?auto_323763 ?auto_323764 ?auto_323765 ?auto_323766 ?auto_323767 ?auto_323768 ?auto_323769 ?auto_323770 ?auto_323771 ?auto_323772 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_323808 - BLOCK
      ?auto_323809 - BLOCK
      ?auto_323810 - BLOCK
      ?auto_323811 - BLOCK
      ?auto_323812 - BLOCK
      ?auto_323813 - BLOCK
      ?auto_323814 - BLOCK
      ?auto_323815 - BLOCK
      ?auto_323816 - BLOCK
      ?auto_323817 - BLOCK
      ?auto_323818 - BLOCK
    )
    :vars
    (
      ?auto_323819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323818 ?auto_323819 ) ( ON-TABLE ?auto_323808 ) ( ON ?auto_323809 ?auto_323808 ) ( ON ?auto_323810 ?auto_323809 ) ( ON ?auto_323811 ?auto_323810 ) ( ON ?auto_323812 ?auto_323811 ) ( ON ?auto_323813 ?auto_323812 ) ( ON ?auto_323814 ?auto_323813 ) ( ON ?auto_323815 ?auto_323814 ) ( not ( = ?auto_323808 ?auto_323809 ) ) ( not ( = ?auto_323808 ?auto_323810 ) ) ( not ( = ?auto_323808 ?auto_323811 ) ) ( not ( = ?auto_323808 ?auto_323812 ) ) ( not ( = ?auto_323808 ?auto_323813 ) ) ( not ( = ?auto_323808 ?auto_323814 ) ) ( not ( = ?auto_323808 ?auto_323815 ) ) ( not ( = ?auto_323808 ?auto_323816 ) ) ( not ( = ?auto_323808 ?auto_323817 ) ) ( not ( = ?auto_323808 ?auto_323818 ) ) ( not ( = ?auto_323808 ?auto_323819 ) ) ( not ( = ?auto_323809 ?auto_323810 ) ) ( not ( = ?auto_323809 ?auto_323811 ) ) ( not ( = ?auto_323809 ?auto_323812 ) ) ( not ( = ?auto_323809 ?auto_323813 ) ) ( not ( = ?auto_323809 ?auto_323814 ) ) ( not ( = ?auto_323809 ?auto_323815 ) ) ( not ( = ?auto_323809 ?auto_323816 ) ) ( not ( = ?auto_323809 ?auto_323817 ) ) ( not ( = ?auto_323809 ?auto_323818 ) ) ( not ( = ?auto_323809 ?auto_323819 ) ) ( not ( = ?auto_323810 ?auto_323811 ) ) ( not ( = ?auto_323810 ?auto_323812 ) ) ( not ( = ?auto_323810 ?auto_323813 ) ) ( not ( = ?auto_323810 ?auto_323814 ) ) ( not ( = ?auto_323810 ?auto_323815 ) ) ( not ( = ?auto_323810 ?auto_323816 ) ) ( not ( = ?auto_323810 ?auto_323817 ) ) ( not ( = ?auto_323810 ?auto_323818 ) ) ( not ( = ?auto_323810 ?auto_323819 ) ) ( not ( = ?auto_323811 ?auto_323812 ) ) ( not ( = ?auto_323811 ?auto_323813 ) ) ( not ( = ?auto_323811 ?auto_323814 ) ) ( not ( = ?auto_323811 ?auto_323815 ) ) ( not ( = ?auto_323811 ?auto_323816 ) ) ( not ( = ?auto_323811 ?auto_323817 ) ) ( not ( = ?auto_323811 ?auto_323818 ) ) ( not ( = ?auto_323811 ?auto_323819 ) ) ( not ( = ?auto_323812 ?auto_323813 ) ) ( not ( = ?auto_323812 ?auto_323814 ) ) ( not ( = ?auto_323812 ?auto_323815 ) ) ( not ( = ?auto_323812 ?auto_323816 ) ) ( not ( = ?auto_323812 ?auto_323817 ) ) ( not ( = ?auto_323812 ?auto_323818 ) ) ( not ( = ?auto_323812 ?auto_323819 ) ) ( not ( = ?auto_323813 ?auto_323814 ) ) ( not ( = ?auto_323813 ?auto_323815 ) ) ( not ( = ?auto_323813 ?auto_323816 ) ) ( not ( = ?auto_323813 ?auto_323817 ) ) ( not ( = ?auto_323813 ?auto_323818 ) ) ( not ( = ?auto_323813 ?auto_323819 ) ) ( not ( = ?auto_323814 ?auto_323815 ) ) ( not ( = ?auto_323814 ?auto_323816 ) ) ( not ( = ?auto_323814 ?auto_323817 ) ) ( not ( = ?auto_323814 ?auto_323818 ) ) ( not ( = ?auto_323814 ?auto_323819 ) ) ( not ( = ?auto_323815 ?auto_323816 ) ) ( not ( = ?auto_323815 ?auto_323817 ) ) ( not ( = ?auto_323815 ?auto_323818 ) ) ( not ( = ?auto_323815 ?auto_323819 ) ) ( not ( = ?auto_323816 ?auto_323817 ) ) ( not ( = ?auto_323816 ?auto_323818 ) ) ( not ( = ?auto_323816 ?auto_323819 ) ) ( not ( = ?auto_323817 ?auto_323818 ) ) ( not ( = ?auto_323817 ?auto_323819 ) ) ( not ( = ?auto_323818 ?auto_323819 ) ) ( ON ?auto_323817 ?auto_323818 ) ( CLEAR ?auto_323815 ) ( ON ?auto_323816 ?auto_323817 ) ( CLEAR ?auto_323816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_323808 ?auto_323809 ?auto_323810 ?auto_323811 ?auto_323812 ?auto_323813 ?auto_323814 ?auto_323815 ?auto_323816 )
      ( MAKE-11PILE ?auto_323808 ?auto_323809 ?auto_323810 ?auto_323811 ?auto_323812 ?auto_323813 ?auto_323814 ?auto_323815 ?auto_323816 ?auto_323817 ?auto_323818 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_323854 - BLOCK
      ?auto_323855 - BLOCK
      ?auto_323856 - BLOCK
      ?auto_323857 - BLOCK
      ?auto_323858 - BLOCK
      ?auto_323859 - BLOCK
      ?auto_323860 - BLOCK
      ?auto_323861 - BLOCK
      ?auto_323862 - BLOCK
      ?auto_323863 - BLOCK
      ?auto_323864 - BLOCK
    )
    :vars
    (
      ?auto_323865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323864 ?auto_323865 ) ( ON-TABLE ?auto_323854 ) ( ON ?auto_323855 ?auto_323854 ) ( ON ?auto_323856 ?auto_323855 ) ( ON ?auto_323857 ?auto_323856 ) ( ON ?auto_323858 ?auto_323857 ) ( ON ?auto_323859 ?auto_323858 ) ( ON ?auto_323860 ?auto_323859 ) ( not ( = ?auto_323854 ?auto_323855 ) ) ( not ( = ?auto_323854 ?auto_323856 ) ) ( not ( = ?auto_323854 ?auto_323857 ) ) ( not ( = ?auto_323854 ?auto_323858 ) ) ( not ( = ?auto_323854 ?auto_323859 ) ) ( not ( = ?auto_323854 ?auto_323860 ) ) ( not ( = ?auto_323854 ?auto_323861 ) ) ( not ( = ?auto_323854 ?auto_323862 ) ) ( not ( = ?auto_323854 ?auto_323863 ) ) ( not ( = ?auto_323854 ?auto_323864 ) ) ( not ( = ?auto_323854 ?auto_323865 ) ) ( not ( = ?auto_323855 ?auto_323856 ) ) ( not ( = ?auto_323855 ?auto_323857 ) ) ( not ( = ?auto_323855 ?auto_323858 ) ) ( not ( = ?auto_323855 ?auto_323859 ) ) ( not ( = ?auto_323855 ?auto_323860 ) ) ( not ( = ?auto_323855 ?auto_323861 ) ) ( not ( = ?auto_323855 ?auto_323862 ) ) ( not ( = ?auto_323855 ?auto_323863 ) ) ( not ( = ?auto_323855 ?auto_323864 ) ) ( not ( = ?auto_323855 ?auto_323865 ) ) ( not ( = ?auto_323856 ?auto_323857 ) ) ( not ( = ?auto_323856 ?auto_323858 ) ) ( not ( = ?auto_323856 ?auto_323859 ) ) ( not ( = ?auto_323856 ?auto_323860 ) ) ( not ( = ?auto_323856 ?auto_323861 ) ) ( not ( = ?auto_323856 ?auto_323862 ) ) ( not ( = ?auto_323856 ?auto_323863 ) ) ( not ( = ?auto_323856 ?auto_323864 ) ) ( not ( = ?auto_323856 ?auto_323865 ) ) ( not ( = ?auto_323857 ?auto_323858 ) ) ( not ( = ?auto_323857 ?auto_323859 ) ) ( not ( = ?auto_323857 ?auto_323860 ) ) ( not ( = ?auto_323857 ?auto_323861 ) ) ( not ( = ?auto_323857 ?auto_323862 ) ) ( not ( = ?auto_323857 ?auto_323863 ) ) ( not ( = ?auto_323857 ?auto_323864 ) ) ( not ( = ?auto_323857 ?auto_323865 ) ) ( not ( = ?auto_323858 ?auto_323859 ) ) ( not ( = ?auto_323858 ?auto_323860 ) ) ( not ( = ?auto_323858 ?auto_323861 ) ) ( not ( = ?auto_323858 ?auto_323862 ) ) ( not ( = ?auto_323858 ?auto_323863 ) ) ( not ( = ?auto_323858 ?auto_323864 ) ) ( not ( = ?auto_323858 ?auto_323865 ) ) ( not ( = ?auto_323859 ?auto_323860 ) ) ( not ( = ?auto_323859 ?auto_323861 ) ) ( not ( = ?auto_323859 ?auto_323862 ) ) ( not ( = ?auto_323859 ?auto_323863 ) ) ( not ( = ?auto_323859 ?auto_323864 ) ) ( not ( = ?auto_323859 ?auto_323865 ) ) ( not ( = ?auto_323860 ?auto_323861 ) ) ( not ( = ?auto_323860 ?auto_323862 ) ) ( not ( = ?auto_323860 ?auto_323863 ) ) ( not ( = ?auto_323860 ?auto_323864 ) ) ( not ( = ?auto_323860 ?auto_323865 ) ) ( not ( = ?auto_323861 ?auto_323862 ) ) ( not ( = ?auto_323861 ?auto_323863 ) ) ( not ( = ?auto_323861 ?auto_323864 ) ) ( not ( = ?auto_323861 ?auto_323865 ) ) ( not ( = ?auto_323862 ?auto_323863 ) ) ( not ( = ?auto_323862 ?auto_323864 ) ) ( not ( = ?auto_323862 ?auto_323865 ) ) ( not ( = ?auto_323863 ?auto_323864 ) ) ( not ( = ?auto_323863 ?auto_323865 ) ) ( not ( = ?auto_323864 ?auto_323865 ) ) ( ON ?auto_323863 ?auto_323864 ) ( ON ?auto_323862 ?auto_323863 ) ( CLEAR ?auto_323860 ) ( ON ?auto_323861 ?auto_323862 ) ( CLEAR ?auto_323861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_323854 ?auto_323855 ?auto_323856 ?auto_323857 ?auto_323858 ?auto_323859 ?auto_323860 ?auto_323861 )
      ( MAKE-11PILE ?auto_323854 ?auto_323855 ?auto_323856 ?auto_323857 ?auto_323858 ?auto_323859 ?auto_323860 ?auto_323861 ?auto_323862 ?auto_323863 ?auto_323864 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_323900 - BLOCK
      ?auto_323901 - BLOCK
      ?auto_323902 - BLOCK
      ?auto_323903 - BLOCK
      ?auto_323904 - BLOCK
      ?auto_323905 - BLOCK
      ?auto_323906 - BLOCK
      ?auto_323907 - BLOCK
      ?auto_323908 - BLOCK
      ?auto_323909 - BLOCK
      ?auto_323910 - BLOCK
    )
    :vars
    (
      ?auto_323911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323910 ?auto_323911 ) ( ON-TABLE ?auto_323900 ) ( ON ?auto_323901 ?auto_323900 ) ( ON ?auto_323902 ?auto_323901 ) ( ON ?auto_323903 ?auto_323902 ) ( ON ?auto_323904 ?auto_323903 ) ( ON ?auto_323905 ?auto_323904 ) ( not ( = ?auto_323900 ?auto_323901 ) ) ( not ( = ?auto_323900 ?auto_323902 ) ) ( not ( = ?auto_323900 ?auto_323903 ) ) ( not ( = ?auto_323900 ?auto_323904 ) ) ( not ( = ?auto_323900 ?auto_323905 ) ) ( not ( = ?auto_323900 ?auto_323906 ) ) ( not ( = ?auto_323900 ?auto_323907 ) ) ( not ( = ?auto_323900 ?auto_323908 ) ) ( not ( = ?auto_323900 ?auto_323909 ) ) ( not ( = ?auto_323900 ?auto_323910 ) ) ( not ( = ?auto_323900 ?auto_323911 ) ) ( not ( = ?auto_323901 ?auto_323902 ) ) ( not ( = ?auto_323901 ?auto_323903 ) ) ( not ( = ?auto_323901 ?auto_323904 ) ) ( not ( = ?auto_323901 ?auto_323905 ) ) ( not ( = ?auto_323901 ?auto_323906 ) ) ( not ( = ?auto_323901 ?auto_323907 ) ) ( not ( = ?auto_323901 ?auto_323908 ) ) ( not ( = ?auto_323901 ?auto_323909 ) ) ( not ( = ?auto_323901 ?auto_323910 ) ) ( not ( = ?auto_323901 ?auto_323911 ) ) ( not ( = ?auto_323902 ?auto_323903 ) ) ( not ( = ?auto_323902 ?auto_323904 ) ) ( not ( = ?auto_323902 ?auto_323905 ) ) ( not ( = ?auto_323902 ?auto_323906 ) ) ( not ( = ?auto_323902 ?auto_323907 ) ) ( not ( = ?auto_323902 ?auto_323908 ) ) ( not ( = ?auto_323902 ?auto_323909 ) ) ( not ( = ?auto_323902 ?auto_323910 ) ) ( not ( = ?auto_323902 ?auto_323911 ) ) ( not ( = ?auto_323903 ?auto_323904 ) ) ( not ( = ?auto_323903 ?auto_323905 ) ) ( not ( = ?auto_323903 ?auto_323906 ) ) ( not ( = ?auto_323903 ?auto_323907 ) ) ( not ( = ?auto_323903 ?auto_323908 ) ) ( not ( = ?auto_323903 ?auto_323909 ) ) ( not ( = ?auto_323903 ?auto_323910 ) ) ( not ( = ?auto_323903 ?auto_323911 ) ) ( not ( = ?auto_323904 ?auto_323905 ) ) ( not ( = ?auto_323904 ?auto_323906 ) ) ( not ( = ?auto_323904 ?auto_323907 ) ) ( not ( = ?auto_323904 ?auto_323908 ) ) ( not ( = ?auto_323904 ?auto_323909 ) ) ( not ( = ?auto_323904 ?auto_323910 ) ) ( not ( = ?auto_323904 ?auto_323911 ) ) ( not ( = ?auto_323905 ?auto_323906 ) ) ( not ( = ?auto_323905 ?auto_323907 ) ) ( not ( = ?auto_323905 ?auto_323908 ) ) ( not ( = ?auto_323905 ?auto_323909 ) ) ( not ( = ?auto_323905 ?auto_323910 ) ) ( not ( = ?auto_323905 ?auto_323911 ) ) ( not ( = ?auto_323906 ?auto_323907 ) ) ( not ( = ?auto_323906 ?auto_323908 ) ) ( not ( = ?auto_323906 ?auto_323909 ) ) ( not ( = ?auto_323906 ?auto_323910 ) ) ( not ( = ?auto_323906 ?auto_323911 ) ) ( not ( = ?auto_323907 ?auto_323908 ) ) ( not ( = ?auto_323907 ?auto_323909 ) ) ( not ( = ?auto_323907 ?auto_323910 ) ) ( not ( = ?auto_323907 ?auto_323911 ) ) ( not ( = ?auto_323908 ?auto_323909 ) ) ( not ( = ?auto_323908 ?auto_323910 ) ) ( not ( = ?auto_323908 ?auto_323911 ) ) ( not ( = ?auto_323909 ?auto_323910 ) ) ( not ( = ?auto_323909 ?auto_323911 ) ) ( not ( = ?auto_323910 ?auto_323911 ) ) ( ON ?auto_323909 ?auto_323910 ) ( ON ?auto_323908 ?auto_323909 ) ( ON ?auto_323907 ?auto_323908 ) ( CLEAR ?auto_323905 ) ( ON ?auto_323906 ?auto_323907 ) ( CLEAR ?auto_323906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_323900 ?auto_323901 ?auto_323902 ?auto_323903 ?auto_323904 ?auto_323905 ?auto_323906 )
      ( MAKE-11PILE ?auto_323900 ?auto_323901 ?auto_323902 ?auto_323903 ?auto_323904 ?auto_323905 ?auto_323906 ?auto_323907 ?auto_323908 ?auto_323909 ?auto_323910 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_323946 - BLOCK
      ?auto_323947 - BLOCK
      ?auto_323948 - BLOCK
      ?auto_323949 - BLOCK
      ?auto_323950 - BLOCK
      ?auto_323951 - BLOCK
      ?auto_323952 - BLOCK
      ?auto_323953 - BLOCK
      ?auto_323954 - BLOCK
      ?auto_323955 - BLOCK
      ?auto_323956 - BLOCK
    )
    :vars
    (
      ?auto_323957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_323956 ?auto_323957 ) ( ON-TABLE ?auto_323946 ) ( ON ?auto_323947 ?auto_323946 ) ( ON ?auto_323948 ?auto_323947 ) ( ON ?auto_323949 ?auto_323948 ) ( ON ?auto_323950 ?auto_323949 ) ( not ( = ?auto_323946 ?auto_323947 ) ) ( not ( = ?auto_323946 ?auto_323948 ) ) ( not ( = ?auto_323946 ?auto_323949 ) ) ( not ( = ?auto_323946 ?auto_323950 ) ) ( not ( = ?auto_323946 ?auto_323951 ) ) ( not ( = ?auto_323946 ?auto_323952 ) ) ( not ( = ?auto_323946 ?auto_323953 ) ) ( not ( = ?auto_323946 ?auto_323954 ) ) ( not ( = ?auto_323946 ?auto_323955 ) ) ( not ( = ?auto_323946 ?auto_323956 ) ) ( not ( = ?auto_323946 ?auto_323957 ) ) ( not ( = ?auto_323947 ?auto_323948 ) ) ( not ( = ?auto_323947 ?auto_323949 ) ) ( not ( = ?auto_323947 ?auto_323950 ) ) ( not ( = ?auto_323947 ?auto_323951 ) ) ( not ( = ?auto_323947 ?auto_323952 ) ) ( not ( = ?auto_323947 ?auto_323953 ) ) ( not ( = ?auto_323947 ?auto_323954 ) ) ( not ( = ?auto_323947 ?auto_323955 ) ) ( not ( = ?auto_323947 ?auto_323956 ) ) ( not ( = ?auto_323947 ?auto_323957 ) ) ( not ( = ?auto_323948 ?auto_323949 ) ) ( not ( = ?auto_323948 ?auto_323950 ) ) ( not ( = ?auto_323948 ?auto_323951 ) ) ( not ( = ?auto_323948 ?auto_323952 ) ) ( not ( = ?auto_323948 ?auto_323953 ) ) ( not ( = ?auto_323948 ?auto_323954 ) ) ( not ( = ?auto_323948 ?auto_323955 ) ) ( not ( = ?auto_323948 ?auto_323956 ) ) ( not ( = ?auto_323948 ?auto_323957 ) ) ( not ( = ?auto_323949 ?auto_323950 ) ) ( not ( = ?auto_323949 ?auto_323951 ) ) ( not ( = ?auto_323949 ?auto_323952 ) ) ( not ( = ?auto_323949 ?auto_323953 ) ) ( not ( = ?auto_323949 ?auto_323954 ) ) ( not ( = ?auto_323949 ?auto_323955 ) ) ( not ( = ?auto_323949 ?auto_323956 ) ) ( not ( = ?auto_323949 ?auto_323957 ) ) ( not ( = ?auto_323950 ?auto_323951 ) ) ( not ( = ?auto_323950 ?auto_323952 ) ) ( not ( = ?auto_323950 ?auto_323953 ) ) ( not ( = ?auto_323950 ?auto_323954 ) ) ( not ( = ?auto_323950 ?auto_323955 ) ) ( not ( = ?auto_323950 ?auto_323956 ) ) ( not ( = ?auto_323950 ?auto_323957 ) ) ( not ( = ?auto_323951 ?auto_323952 ) ) ( not ( = ?auto_323951 ?auto_323953 ) ) ( not ( = ?auto_323951 ?auto_323954 ) ) ( not ( = ?auto_323951 ?auto_323955 ) ) ( not ( = ?auto_323951 ?auto_323956 ) ) ( not ( = ?auto_323951 ?auto_323957 ) ) ( not ( = ?auto_323952 ?auto_323953 ) ) ( not ( = ?auto_323952 ?auto_323954 ) ) ( not ( = ?auto_323952 ?auto_323955 ) ) ( not ( = ?auto_323952 ?auto_323956 ) ) ( not ( = ?auto_323952 ?auto_323957 ) ) ( not ( = ?auto_323953 ?auto_323954 ) ) ( not ( = ?auto_323953 ?auto_323955 ) ) ( not ( = ?auto_323953 ?auto_323956 ) ) ( not ( = ?auto_323953 ?auto_323957 ) ) ( not ( = ?auto_323954 ?auto_323955 ) ) ( not ( = ?auto_323954 ?auto_323956 ) ) ( not ( = ?auto_323954 ?auto_323957 ) ) ( not ( = ?auto_323955 ?auto_323956 ) ) ( not ( = ?auto_323955 ?auto_323957 ) ) ( not ( = ?auto_323956 ?auto_323957 ) ) ( ON ?auto_323955 ?auto_323956 ) ( ON ?auto_323954 ?auto_323955 ) ( ON ?auto_323953 ?auto_323954 ) ( ON ?auto_323952 ?auto_323953 ) ( CLEAR ?auto_323950 ) ( ON ?auto_323951 ?auto_323952 ) ( CLEAR ?auto_323951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_323946 ?auto_323947 ?auto_323948 ?auto_323949 ?auto_323950 ?auto_323951 )
      ( MAKE-11PILE ?auto_323946 ?auto_323947 ?auto_323948 ?auto_323949 ?auto_323950 ?auto_323951 ?auto_323952 ?auto_323953 ?auto_323954 ?auto_323955 ?auto_323956 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_323992 - BLOCK
      ?auto_323993 - BLOCK
      ?auto_323994 - BLOCK
      ?auto_323995 - BLOCK
      ?auto_323996 - BLOCK
      ?auto_323997 - BLOCK
      ?auto_323998 - BLOCK
      ?auto_323999 - BLOCK
      ?auto_324000 - BLOCK
      ?auto_324001 - BLOCK
      ?auto_324002 - BLOCK
    )
    :vars
    (
      ?auto_324003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324002 ?auto_324003 ) ( ON-TABLE ?auto_323992 ) ( ON ?auto_323993 ?auto_323992 ) ( ON ?auto_323994 ?auto_323993 ) ( ON ?auto_323995 ?auto_323994 ) ( not ( = ?auto_323992 ?auto_323993 ) ) ( not ( = ?auto_323992 ?auto_323994 ) ) ( not ( = ?auto_323992 ?auto_323995 ) ) ( not ( = ?auto_323992 ?auto_323996 ) ) ( not ( = ?auto_323992 ?auto_323997 ) ) ( not ( = ?auto_323992 ?auto_323998 ) ) ( not ( = ?auto_323992 ?auto_323999 ) ) ( not ( = ?auto_323992 ?auto_324000 ) ) ( not ( = ?auto_323992 ?auto_324001 ) ) ( not ( = ?auto_323992 ?auto_324002 ) ) ( not ( = ?auto_323992 ?auto_324003 ) ) ( not ( = ?auto_323993 ?auto_323994 ) ) ( not ( = ?auto_323993 ?auto_323995 ) ) ( not ( = ?auto_323993 ?auto_323996 ) ) ( not ( = ?auto_323993 ?auto_323997 ) ) ( not ( = ?auto_323993 ?auto_323998 ) ) ( not ( = ?auto_323993 ?auto_323999 ) ) ( not ( = ?auto_323993 ?auto_324000 ) ) ( not ( = ?auto_323993 ?auto_324001 ) ) ( not ( = ?auto_323993 ?auto_324002 ) ) ( not ( = ?auto_323993 ?auto_324003 ) ) ( not ( = ?auto_323994 ?auto_323995 ) ) ( not ( = ?auto_323994 ?auto_323996 ) ) ( not ( = ?auto_323994 ?auto_323997 ) ) ( not ( = ?auto_323994 ?auto_323998 ) ) ( not ( = ?auto_323994 ?auto_323999 ) ) ( not ( = ?auto_323994 ?auto_324000 ) ) ( not ( = ?auto_323994 ?auto_324001 ) ) ( not ( = ?auto_323994 ?auto_324002 ) ) ( not ( = ?auto_323994 ?auto_324003 ) ) ( not ( = ?auto_323995 ?auto_323996 ) ) ( not ( = ?auto_323995 ?auto_323997 ) ) ( not ( = ?auto_323995 ?auto_323998 ) ) ( not ( = ?auto_323995 ?auto_323999 ) ) ( not ( = ?auto_323995 ?auto_324000 ) ) ( not ( = ?auto_323995 ?auto_324001 ) ) ( not ( = ?auto_323995 ?auto_324002 ) ) ( not ( = ?auto_323995 ?auto_324003 ) ) ( not ( = ?auto_323996 ?auto_323997 ) ) ( not ( = ?auto_323996 ?auto_323998 ) ) ( not ( = ?auto_323996 ?auto_323999 ) ) ( not ( = ?auto_323996 ?auto_324000 ) ) ( not ( = ?auto_323996 ?auto_324001 ) ) ( not ( = ?auto_323996 ?auto_324002 ) ) ( not ( = ?auto_323996 ?auto_324003 ) ) ( not ( = ?auto_323997 ?auto_323998 ) ) ( not ( = ?auto_323997 ?auto_323999 ) ) ( not ( = ?auto_323997 ?auto_324000 ) ) ( not ( = ?auto_323997 ?auto_324001 ) ) ( not ( = ?auto_323997 ?auto_324002 ) ) ( not ( = ?auto_323997 ?auto_324003 ) ) ( not ( = ?auto_323998 ?auto_323999 ) ) ( not ( = ?auto_323998 ?auto_324000 ) ) ( not ( = ?auto_323998 ?auto_324001 ) ) ( not ( = ?auto_323998 ?auto_324002 ) ) ( not ( = ?auto_323998 ?auto_324003 ) ) ( not ( = ?auto_323999 ?auto_324000 ) ) ( not ( = ?auto_323999 ?auto_324001 ) ) ( not ( = ?auto_323999 ?auto_324002 ) ) ( not ( = ?auto_323999 ?auto_324003 ) ) ( not ( = ?auto_324000 ?auto_324001 ) ) ( not ( = ?auto_324000 ?auto_324002 ) ) ( not ( = ?auto_324000 ?auto_324003 ) ) ( not ( = ?auto_324001 ?auto_324002 ) ) ( not ( = ?auto_324001 ?auto_324003 ) ) ( not ( = ?auto_324002 ?auto_324003 ) ) ( ON ?auto_324001 ?auto_324002 ) ( ON ?auto_324000 ?auto_324001 ) ( ON ?auto_323999 ?auto_324000 ) ( ON ?auto_323998 ?auto_323999 ) ( ON ?auto_323997 ?auto_323998 ) ( CLEAR ?auto_323995 ) ( ON ?auto_323996 ?auto_323997 ) ( CLEAR ?auto_323996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_323992 ?auto_323993 ?auto_323994 ?auto_323995 ?auto_323996 )
      ( MAKE-11PILE ?auto_323992 ?auto_323993 ?auto_323994 ?auto_323995 ?auto_323996 ?auto_323997 ?auto_323998 ?auto_323999 ?auto_324000 ?auto_324001 ?auto_324002 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_324038 - BLOCK
      ?auto_324039 - BLOCK
      ?auto_324040 - BLOCK
      ?auto_324041 - BLOCK
      ?auto_324042 - BLOCK
      ?auto_324043 - BLOCK
      ?auto_324044 - BLOCK
      ?auto_324045 - BLOCK
      ?auto_324046 - BLOCK
      ?auto_324047 - BLOCK
      ?auto_324048 - BLOCK
    )
    :vars
    (
      ?auto_324049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324048 ?auto_324049 ) ( ON-TABLE ?auto_324038 ) ( ON ?auto_324039 ?auto_324038 ) ( ON ?auto_324040 ?auto_324039 ) ( not ( = ?auto_324038 ?auto_324039 ) ) ( not ( = ?auto_324038 ?auto_324040 ) ) ( not ( = ?auto_324038 ?auto_324041 ) ) ( not ( = ?auto_324038 ?auto_324042 ) ) ( not ( = ?auto_324038 ?auto_324043 ) ) ( not ( = ?auto_324038 ?auto_324044 ) ) ( not ( = ?auto_324038 ?auto_324045 ) ) ( not ( = ?auto_324038 ?auto_324046 ) ) ( not ( = ?auto_324038 ?auto_324047 ) ) ( not ( = ?auto_324038 ?auto_324048 ) ) ( not ( = ?auto_324038 ?auto_324049 ) ) ( not ( = ?auto_324039 ?auto_324040 ) ) ( not ( = ?auto_324039 ?auto_324041 ) ) ( not ( = ?auto_324039 ?auto_324042 ) ) ( not ( = ?auto_324039 ?auto_324043 ) ) ( not ( = ?auto_324039 ?auto_324044 ) ) ( not ( = ?auto_324039 ?auto_324045 ) ) ( not ( = ?auto_324039 ?auto_324046 ) ) ( not ( = ?auto_324039 ?auto_324047 ) ) ( not ( = ?auto_324039 ?auto_324048 ) ) ( not ( = ?auto_324039 ?auto_324049 ) ) ( not ( = ?auto_324040 ?auto_324041 ) ) ( not ( = ?auto_324040 ?auto_324042 ) ) ( not ( = ?auto_324040 ?auto_324043 ) ) ( not ( = ?auto_324040 ?auto_324044 ) ) ( not ( = ?auto_324040 ?auto_324045 ) ) ( not ( = ?auto_324040 ?auto_324046 ) ) ( not ( = ?auto_324040 ?auto_324047 ) ) ( not ( = ?auto_324040 ?auto_324048 ) ) ( not ( = ?auto_324040 ?auto_324049 ) ) ( not ( = ?auto_324041 ?auto_324042 ) ) ( not ( = ?auto_324041 ?auto_324043 ) ) ( not ( = ?auto_324041 ?auto_324044 ) ) ( not ( = ?auto_324041 ?auto_324045 ) ) ( not ( = ?auto_324041 ?auto_324046 ) ) ( not ( = ?auto_324041 ?auto_324047 ) ) ( not ( = ?auto_324041 ?auto_324048 ) ) ( not ( = ?auto_324041 ?auto_324049 ) ) ( not ( = ?auto_324042 ?auto_324043 ) ) ( not ( = ?auto_324042 ?auto_324044 ) ) ( not ( = ?auto_324042 ?auto_324045 ) ) ( not ( = ?auto_324042 ?auto_324046 ) ) ( not ( = ?auto_324042 ?auto_324047 ) ) ( not ( = ?auto_324042 ?auto_324048 ) ) ( not ( = ?auto_324042 ?auto_324049 ) ) ( not ( = ?auto_324043 ?auto_324044 ) ) ( not ( = ?auto_324043 ?auto_324045 ) ) ( not ( = ?auto_324043 ?auto_324046 ) ) ( not ( = ?auto_324043 ?auto_324047 ) ) ( not ( = ?auto_324043 ?auto_324048 ) ) ( not ( = ?auto_324043 ?auto_324049 ) ) ( not ( = ?auto_324044 ?auto_324045 ) ) ( not ( = ?auto_324044 ?auto_324046 ) ) ( not ( = ?auto_324044 ?auto_324047 ) ) ( not ( = ?auto_324044 ?auto_324048 ) ) ( not ( = ?auto_324044 ?auto_324049 ) ) ( not ( = ?auto_324045 ?auto_324046 ) ) ( not ( = ?auto_324045 ?auto_324047 ) ) ( not ( = ?auto_324045 ?auto_324048 ) ) ( not ( = ?auto_324045 ?auto_324049 ) ) ( not ( = ?auto_324046 ?auto_324047 ) ) ( not ( = ?auto_324046 ?auto_324048 ) ) ( not ( = ?auto_324046 ?auto_324049 ) ) ( not ( = ?auto_324047 ?auto_324048 ) ) ( not ( = ?auto_324047 ?auto_324049 ) ) ( not ( = ?auto_324048 ?auto_324049 ) ) ( ON ?auto_324047 ?auto_324048 ) ( ON ?auto_324046 ?auto_324047 ) ( ON ?auto_324045 ?auto_324046 ) ( ON ?auto_324044 ?auto_324045 ) ( ON ?auto_324043 ?auto_324044 ) ( ON ?auto_324042 ?auto_324043 ) ( CLEAR ?auto_324040 ) ( ON ?auto_324041 ?auto_324042 ) ( CLEAR ?auto_324041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_324038 ?auto_324039 ?auto_324040 ?auto_324041 )
      ( MAKE-11PILE ?auto_324038 ?auto_324039 ?auto_324040 ?auto_324041 ?auto_324042 ?auto_324043 ?auto_324044 ?auto_324045 ?auto_324046 ?auto_324047 ?auto_324048 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_324084 - BLOCK
      ?auto_324085 - BLOCK
      ?auto_324086 - BLOCK
      ?auto_324087 - BLOCK
      ?auto_324088 - BLOCK
      ?auto_324089 - BLOCK
      ?auto_324090 - BLOCK
      ?auto_324091 - BLOCK
      ?auto_324092 - BLOCK
      ?auto_324093 - BLOCK
      ?auto_324094 - BLOCK
    )
    :vars
    (
      ?auto_324095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324094 ?auto_324095 ) ( ON-TABLE ?auto_324084 ) ( ON ?auto_324085 ?auto_324084 ) ( not ( = ?auto_324084 ?auto_324085 ) ) ( not ( = ?auto_324084 ?auto_324086 ) ) ( not ( = ?auto_324084 ?auto_324087 ) ) ( not ( = ?auto_324084 ?auto_324088 ) ) ( not ( = ?auto_324084 ?auto_324089 ) ) ( not ( = ?auto_324084 ?auto_324090 ) ) ( not ( = ?auto_324084 ?auto_324091 ) ) ( not ( = ?auto_324084 ?auto_324092 ) ) ( not ( = ?auto_324084 ?auto_324093 ) ) ( not ( = ?auto_324084 ?auto_324094 ) ) ( not ( = ?auto_324084 ?auto_324095 ) ) ( not ( = ?auto_324085 ?auto_324086 ) ) ( not ( = ?auto_324085 ?auto_324087 ) ) ( not ( = ?auto_324085 ?auto_324088 ) ) ( not ( = ?auto_324085 ?auto_324089 ) ) ( not ( = ?auto_324085 ?auto_324090 ) ) ( not ( = ?auto_324085 ?auto_324091 ) ) ( not ( = ?auto_324085 ?auto_324092 ) ) ( not ( = ?auto_324085 ?auto_324093 ) ) ( not ( = ?auto_324085 ?auto_324094 ) ) ( not ( = ?auto_324085 ?auto_324095 ) ) ( not ( = ?auto_324086 ?auto_324087 ) ) ( not ( = ?auto_324086 ?auto_324088 ) ) ( not ( = ?auto_324086 ?auto_324089 ) ) ( not ( = ?auto_324086 ?auto_324090 ) ) ( not ( = ?auto_324086 ?auto_324091 ) ) ( not ( = ?auto_324086 ?auto_324092 ) ) ( not ( = ?auto_324086 ?auto_324093 ) ) ( not ( = ?auto_324086 ?auto_324094 ) ) ( not ( = ?auto_324086 ?auto_324095 ) ) ( not ( = ?auto_324087 ?auto_324088 ) ) ( not ( = ?auto_324087 ?auto_324089 ) ) ( not ( = ?auto_324087 ?auto_324090 ) ) ( not ( = ?auto_324087 ?auto_324091 ) ) ( not ( = ?auto_324087 ?auto_324092 ) ) ( not ( = ?auto_324087 ?auto_324093 ) ) ( not ( = ?auto_324087 ?auto_324094 ) ) ( not ( = ?auto_324087 ?auto_324095 ) ) ( not ( = ?auto_324088 ?auto_324089 ) ) ( not ( = ?auto_324088 ?auto_324090 ) ) ( not ( = ?auto_324088 ?auto_324091 ) ) ( not ( = ?auto_324088 ?auto_324092 ) ) ( not ( = ?auto_324088 ?auto_324093 ) ) ( not ( = ?auto_324088 ?auto_324094 ) ) ( not ( = ?auto_324088 ?auto_324095 ) ) ( not ( = ?auto_324089 ?auto_324090 ) ) ( not ( = ?auto_324089 ?auto_324091 ) ) ( not ( = ?auto_324089 ?auto_324092 ) ) ( not ( = ?auto_324089 ?auto_324093 ) ) ( not ( = ?auto_324089 ?auto_324094 ) ) ( not ( = ?auto_324089 ?auto_324095 ) ) ( not ( = ?auto_324090 ?auto_324091 ) ) ( not ( = ?auto_324090 ?auto_324092 ) ) ( not ( = ?auto_324090 ?auto_324093 ) ) ( not ( = ?auto_324090 ?auto_324094 ) ) ( not ( = ?auto_324090 ?auto_324095 ) ) ( not ( = ?auto_324091 ?auto_324092 ) ) ( not ( = ?auto_324091 ?auto_324093 ) ) ( not ( = ?auto_324091 ?auto_324094 ) ) ( not ( = ?auto_324091 ?auto_324095 ) ) ( not ( = ?auto_324092 ?auto_324093 ) ) ( not ( = ?auto_324092 ?auto_324094 ) ) ( not ( = ?auto_324092 ?auto_324095 ) ) ( not ( = ?auto_324093 ?auto_324094 ) ) ( not ( = ?auto_324093 ?auto_324095 ) ) ( not ( = ?auto_324094 ?auto_324095 ) ) ( ON ?auto_324093 ?auto_324094 ) ( ON ?auto_324092 ?auto_324093 ) ( ON ?auto_324091 ?auto_324092 ) ( ON ?auto_324090 ?auto_324091 ) ( ON ?auto_324089 ?auto_324090 ) ( ON ?auto_324088 ?auto_324089 ) ( ON ?auto_324087 ?auto_324088 ) ( CLEAR ?auto_324085 ) ( ON ?auto_324086 ?auto_324087 ) ( CLEAR ?auto_324086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_324084 ?auto_324085 ?auto_324086 )
      ( MAKE-11PILE ?auto_324084 ?auto_324085 ?auto_324086 ?auto_324087 ?auto_324088 ?auto_324089 ?auto_324090 ?auto_324091 ?auto_324092 ?auto_324093 ?auto_324094 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_324130 - BLOCK
      ?auto_324131 - BLOCK
      ?auto_324132 - BLOCK
      ?auto_324133 - BLOCK
      ?auto_324134 - BLOCK
      ?auto_324135 - BLOCK
      ?auto_324136 - BLOCK
      ?auto_324137 - BLOCK
      ?auto_324138 - BLOCK
      ?auto_324139 - BLOCK
      ?auto_324140 - BLOCK
    )
    :vars
    (
      ?auto_324141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324140 ?auto_324141 ) ( ON-TABLE ?auto_324130 ) ( not ( = ?auto_324130 ?auto_324131 ) ) ( not ( = ?auto_324130 ?auto_324132 ) ) ( not ( = ?auto_324130 ?auto_324133 ) ) ( not ( = ?auto_324130 ?auto_324134 ) ) ( not ( = ?auto_324130 ?auto_324135 ) ) ( not ( = ?auto_324130 ?auto_324136 ) ) ( not ( = ?auto_324130 ?auto_324137 ) ) ( not ( = ?auto_324130 ?auto_324138 ) ) ( not ( = ?auto_324130 ?auto_324139 ) ) ( not ( = ?auto_324130 ?auto_324140 ) ) ( not ( = ?auto_324130 ?auto_324141 ) ) ( not ( = ?auto_324131 ?auto_324132 ) ) ( not ( = ?auto_324131 ?auto_324133 ) ) ( not ( = ?auto_324131 ?auto_324134 ) ) ( not ( = ?auto_324131 ?auto_324135 ) ) ( not ( = ?auto_324131 ?auto_324136 ) ) ( not ( = ?auto_324131 ?auto_324137 ) ) ( not ( = ?auto_324131 ?auto_324138 ) ) ( not ( = ?auto_324131 ?auto_324139 ) ) ( not ( = ?auto_324131 ?auto_324140 ) ) ( not ( = ?auto_324131 ?auto_324141 ) ) ( not ( = ?auto_324132 ?auto_324133 ) ) ( not ( = ?auto_324132 ?auto_324134 ) ) ( not ( = ?auto_324132 ?auto_324135 ) ) ( not ( = ?auto_324132 ?auto_324136 ) ) ( not ( = ?auto_324132 ?auto_324137 ) ) ( not ( = ?auto_324132 ?auto_324138 ) ) ( not ( = ?auto_324132 ?auto_324139 ) ) ( not ( = ?auto_324132 ?auto_324140 ) ) ( not ( = ?auto_324132 ?auto_324141 ) ) ( not ( = ?auto_324133 ?auto_324134 ) ) ( not ( = ?auto_324133 ?auto_324135 ) ) ( not ( = ?auto_324133 ?auto_324136 ) ) ( not ( = ?auto_324133 ?auto_324137 ) ) ( not ( = ?auto_324133 ?auto_324138 ) ) ( not ( = ?auto_324133 ?auto_324139 ) ) ( not ( = ?auto_324133 ?auto_324140 ) ) ( not ( = ?auto_324133 ?auto_324141 ) ) ( not ( = ?auto_324134 ?auto_324135 ) ) ( not ( = ?auto_324134 ?auto_324136 ) ) ( not ( = ?auto_324134 ?auto_324137 ) ) ( not ( = ?auto_324134 ?auto_324138 ) ) ( not ( = ?auto_324134 ?auto_324139 ) ) ( not ( = ?auto_324134 ?auto_324140 ) ) ( not ( = ?auto_324134 ?auto_324141 ) ) ( not ( = ?auto_324135 ?auto_324136 ) ) ( not ( = ?auto_324135 ?auto_324137 ) ) ( not ( = ?auto_324135 ?auto_324138 ) ) ( not ( = ?auto_324135 ?auto_324139 ) ) ( not ( = ?auto_324135 ?auto_324140 ) ) ( not ( = ?auto_324135 ?auto_324141 ) ) ( not ( = ?auto_324136 ?auto_324137 ) ) ( not ( = ?auto_324136 ?auto_324138 ) ) ( not ( = ?auto_324136 ?auto_324139 ) ) ( not ( = ?auto_324136 ?auto_324140 ) ) ( not ( = ?auto_324136 ?auto_324141 ) ) ( not ( = ?auto_324137 ?auto_324138 ) ) ( not ( = ?auto_324137 ?auto_324139 ) ) ( not ( = ?auto_324137 ?auto_324140 ) ) ( not ( = ?auto_324137 ?auto_324141 ) ) ( not ( = ?auto_324138 ?auto_324139 ) ) ( not ( = ?auto_324138 ?auto_324140 ) ) ( not ( = ?auto_324138 ?auto_324141 ) ) ( not ( = ?auto_324139 ?auto_324140 ) ) ( not ( = ?auto_324139 ?auto_324141 ) ) ( not ( = ?auto_324140 ?auto_324141 ) ) ( ON ?auto_324139 ?auto_324140 ) ( ON ?auto_324138 ?auto_324139 ) ( ON ?auto_324137 ?auto_324138 ) ( ON ?auto_324136 ?auto_324137 ) ( ON ?auto_324135 ?auto_324136 ) ( ON ?auto_324134 ?auto_324135 ) ( ON ?auto_324133 ?auto_324134 ) ( ON ?auto_324132 ?auto_324133 ) ( CLEAR ?auto_324130 ) ( ON ?auto_324131 ?auto_324132 ) ( CLEAR ?auto_324131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_324130 ?auto_324131 )
      ( MAKE-11PILE ?auto_324130 ?auto_324131 ?auto_324132 ?auto_324133 ?auto_324134 ?auto_324135 ?auto_324136 ?auto_324137 ?auto_324138 ?auto_324139 ?auto_324140 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_324176 - BLOCK
      ?auto_324177 - BLOCK
      ?auto_324178 - BLOCK
      ?auto_324179 - BLOCK
      ?auto_324180 - BLOCK
      ?auto_324181 - BLOCK
      ?auto_324182 - BLOCK
      ?auto_324183 - BLOCK
      ?auto_324184 - BLOCK
      ?auto_324185 - BLOCK
      ?auto_324186 - BLOCK
    )
    :vars
    (
      ?auto_324187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324186 ?auto_324187 ) ( not ( = ?auto_324176 ?auto_324177 ) ) ( not ( = ?auto_324176 ?auto_324178 ) ) ( not ( = ?auto_324176 ?auto_324179 ) ) ( not ( = ?auto_324176 ?auto_324180 ) ) ( not ( = ?auto_324176 ?auto_324181 ) ) ( not ( = ?auto_324176 ?auto_324182 ) ) ( not ( = ?auto_324176 ?auto_324183 ) ) ( not ( = ?auto_324176 ?auto_324184 ) ) ( not ( = ?auto_324176 ?auto_324185 ) ) ( not ( = ?auto_324176 ?auto_324186 ) ) ( not ( = ?auto_324176 ?auto_324187 ) ) ( not ( = ?auto_324177 ?auto_324178 ) ) ( not ( = ?auto_324177 ?auto_324179 ) ) ( not ( = ?auto_324177 ?auto_324180 ) ) ( not ( = ?auto_324177 ?auto_324181 ) ) ( not ( = ?auto_324177 ?auto_324182 ) ) ( not ( = ?auto_324177 ?auto_324183 ) ) ( not ( = ?auto_324177 ?auto_324184 ) ) ( not ( = ?auto_324177 ?auto_324185 ) ) ( not ( = ?auto_324177 ?auto_324186 ) ) ( not ( = ?auto_324177 ?auto_324187 ) ) ( not ( = ?auto_324178 ?auto_324179 ) ) ( not ( = ?auto_324178 ?auto_324180 ) ) ( not ( = ?auto_324178 ?auto_324181 ) ) ( not ( = ?auto_324178 ?auto_324182 ) ) ( not ( = ?auto_324178 ?auto_324183 ) ) ( not ( = ?auto_324178 ?auto_324184 ) ) ( not ( = ?auto_324178 ?auto_324185 ) ) ( not ( = ?auto_324178 ?auto_324186 ) ) ( not ( = ?auto_324178 ?auto_324187 ) ) ( not ( = ?auto_324179 ?auto_324180 ) ) ( not ( = ?auto_324179 ?auto_324181 ) ) ( not ( = ?auto_324179 ?auto_324182 ) ) ( not ( = ?auto_324179 ?auto_324183 ) ) ( not ( = ?auto_324179 ?auto_324184 ) ) ( not ( = ?auto_324179 ?auto_324185 ) ) ( not ( = ?auto_324179 ?auto_324186 ) ) ( not ( = ?auto_324179 ?auto_324187 ) ) ( not ( = ?auto_324180 ?auto_324181 ) ) ( not ( = ?auto_324180 ?auto_324182 ) ) ( not ( = ?auto_324180 ?auto_324183 ) ) ( not ( = ?auto_324180 ?auto_324184 ) ) ( not ( = ?auto_324180 ?auto_324185 ) ) ( not ( = ?auto_324180 ?auto_324186 ) ) ( not ( = ?auto_324180 ?auto_324187 ) ) ( not ( = ?auto_324181 ?auto_324182 ) ) ( not ( = ?auto_324181 ?auto_324183 ) ) ( not ( = ?auto_324181 ?auto_324184 ) ) ( not ( = ?auto_324181 ?auto_324185 ) ) ( not ( = ?auto_324181 ?auto_324186 ) ) ( not ( = ?auto_324181 ?auto_324187 ) ) ( not ( = ?auto_324182 ?auto_324183 ) ) ( not ( = ?auto_324182 ?auto_324184 ) ) ( not ( = ?auto_324182 ?auto_324185 ) ) ( not ( = ?auto_324182 ?auto_324186 ) ) ( not ( = ?auto_324182 ?auto_324187 ) ) ( not ( = ?auto_324183 ?auto_324184 ) ) ( not ( = ?auto_324183 ?auto_324185 ) ) ( not ( = ?auto_324183 ?auto_324186 ) ) ( not ( = ?auto_324183 ?auto_324187 ) ) ( not ( = ?auto_324184 ?auto_324185 ) ) ( not ( = ?auto_324184 ?auto_324186 ) ) ( not ( = ?auto_324184 ?auto_324187 ) ) ( not ( = ?auto_324185 ?auto_324186 ) ) ( not ( = ?auto_324185 ?auto_324187 ) ) ( not ( = ?auto_324186 ?auto_324187 ) ) ( ON ?auto_324185 ?auto_324186 ) ( ON ?auto_324184 ?auto_324185 ) ( ON ?auto_324183 ?auto_324184 ) ( ON ?auto_324182 ?auto_324183 ) ( ON ?auto_324181 ?auto_324182 ) ( ON ?auto_324180 ?auto_324181 ) ( ON ?auto_324179 ?auto_324180 ) ( ON ?auto_324178 ?auto_324179 ) ( ON ?auto_324177 ?auto_324178 ) ( ON ?auto_324176 ?auto_324177 ) ( CLEAR ?auto_324176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_324176 )
      ( MAKE-11PILE ?auto_324176 ?auto_324177 ?auto_324178 ?auto_324179 ?auto_324180 ?auto_324181 ?auto_324182 ?auto_324183 ?auto_324184 ?auto_324185 ?auto_324186 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_324223 - BLOCK
      ?auto_324224 - BLOCK
      ?auto_324225 - BLOCK
      ?auto_324226 - BLOCK
      ?auto_324227 - BLOCK
      ?auto_324228 - BLOCK
      ?auto_324229 - BLOCK
      ?auto_324230 - BLOCK
      ?auto_324231 - BLOCK
      ?auto_324232 - BLOCK
      ?auto_324233 - BLOCK
      ?auto_324234 - BLOCK
    )
    :vars
    (
      ?auto_324235 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_324233 ) ( ON ?auto_324234 ?auto_324235 ) ( CLEAR ?auto_324234 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_324223 ) ( ON ?auto_324224 ?auto_324223 ) ( ON ?auto_324225 ?auto_324224 ) ( ON ?auto_324226 ?auto_324225 ) ( ON ?auto_324227 ?auto_324226 ) ( ON ?auto_324228 ?auto_324227 ) ( ON ?auto_324229 ?auto_324228 ) ( ON ?auto_324230 ?auto_324229 ) ( ON ?auto_324231 ?auto_324230 ) ( ON ?auto_324232 ?auto_324231 ) ( ON ?auto_324233 ?auto_324232 ) ( not ( = ?auto_324223 ?auto_324224 ) ) ( not ( = ?auto_324223 ?auto_324225 ) ) ( not ( = ?auto_324223 ?auto_324226 ) ) ( not ( = ?auto_324223 ?auto_324227 ) ) ( not ( = ?auto_324223 ?auto_324228 ) ) ( not ( = ?auto_324223 ?auto_324229 ) ) ( not ( = ?auto_324223 ?auto_324230 ) ) ( not ( = ?auto_324223 ?auto_324231 ) ) ( not ( = ?auto_324223 ?auto_324232 ) ) ( not ( = ?auto_324223 ?auto_324233 ) ) ( not ( = ?auto_324223 ?auto_324234 ) ) ( not ( = ?auto_324223 ?auto_324235 ) ) ( not ( = ?auto_324224 ?auto_324225 ) ) ( not ( = ?auto_324224 ?auto_324226 ) ) ( not ( = ?auto_324224 ?auto_324227 ) ) ( not ( = ?auto_324224 ?auto_324228 ) ) ( not ( = ?auto_324224 ?auto_324229 ) ) ( not ( = ?auto_324224 ?auto_324230 ) ) ( not ( = ?auto_324224 ?auto_324231 ) ) ( not ( = ?auto_324224 ?auto_324232 ) ) ( not ( = ?auto_324224 ?auto_324233 ) ) ( not ( = ?auto_324224 ?auto_324234 ) ) ( not ( = ?auto_324224 ?auto_324235 ) ) ( not ( = ?auto_324225 ?auto_324226 ) ) ( not ( = ?auto_324225 ?auto_324227 ) ) ( not ( = ?auto_324225 ?auto_324228 ) ) ( not ( = ?auto_324225 ?auto_324229 ) ) ( not ( = ?auto_324225 ?auto_324230 ) ) ( not ( = ?auto_324225 ?auto_324231 ) ) ( not ( = ?auto_324225 ?auto_324232 ) ) ( not ( = ?auto_324225 ?auto_324233 ) ) ( not ( = ?auto_324225 ?auto_324234 ) ) ( not ( = ?auto_324225 ?auto_324235 ) ) ( not ( = ?auto_324226 ?auto_324227 ) ) ( not ( = ?auto_324226 ?auto_324228 ) ) ( not ( = ?auto_324226 ?auto_324229 ) ) ( not ( = ?auto_324226 ?auto_324230 ) ) ( not ( = ?auto_324226 ?auto_324231 ) ) ( not ( = ?auto_324226 ?auto_324232 ) ) ( not ( = ?auto_324226 ?auto_324233 ) ) ( not ( = ?auto_324226 ?auto_324234 ) ) ( not ( = ?auto_324226 ?auto_324235 ) ) ( not ( = ?auto_324227 ?auto_324228 ) ) ( not ( = ?auto_324227 ?auto_324229 ) ) ( not ( = ?auto_324227 ?auto_324230 ) ) ( not ( = ?auto_324227 ?auto_324231 ) ) ( not ( = ?auto_324227 ?auto_324232 ) ) ( not ( = ?auto_324227 ?auto_324233 ) ) ( not ( = ?auto_324227 ?auto_324234 ) ) ( not ( = ?auto_324227 ?auto_324235 ) ) ( not ( = ?auto_324228 ?auto_324229 ) ) ( not ( = ?auto_324228 ?auto_324230 ) ) ( not ( = ?auto_324228 ?auto_324231 ) ) ( not ( = ?auto_324228 ?auto_324232 ) ) ( not ( = ?auto_324228 ?auto_324233 ) ) ( not ( = ?auto_324228 ?auto_324234 ) ) ( not ( = ?auto_324228 ?auto_324235 ) ) ( not ( = ?auto_324229 ?auto_324230 ) ) ( not ( = ?auto_324229 ?auto_324231 ) ) ( not ( = ?auto_324229 ?auto_324232 ) ) ( not ( = ?auto_324229 ?auto_324233 ) ) ( not ( = ?auto_324229 ?auto_324234 ) ) ( not ( = ?auto_324229 ?auto_324235 ) ) ( not ( = ?auto_324230 ?auto_324231 ) ) ( not ( = ?auto_324230 ?auto_324232 ) ) ( not ( = ?auto_324230 ?auto_324233 ) ) ( not ( = ?auto_324230 ?auto_324234 ) ) ( not ( = ?auto_324230 ?auto_324235 ) ) ( not ( = ?auto_324231 ?auto_324232 ) ) ( not ( = ?auto_324231 ?auto_324233 ) ) ( not ( = ?auto_324231 ?auto_324234 ) ) ( not ( = ?auto_324231 ?auto_324235 ) ) ( not ( = ?auto_324232 ?auto_324233 ) ) ( not ( = ?auto_324232 ?auto_324234 ) ) ( not ( = ?auto_324232 ?auto_324235 ) ) ( not ( = ?auto_324233 ?auto_324234 ) ) ( not ( = ?auto_324233 ?auto_324235 ) ) ( not ( = ?auto_324234 ?auto_324235 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_324234 ?auto_324235 )
      ( !STACK ?auto_324234 ?auto_324233 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_324273 - BLOCK
      ?auto_324274 - BLOCK
      ?auto_324275 - BLOCK
      ?auto_324276 - BLOCK
      ?auto_324277 - BLOCK
      ?auto_324278 - BLOCK
      ?auto_324279 - BLOCK
      ?auto_324280 - BLOCK
      ?auto_324281 - BLOCK
      ?auto_324282 - BLOCK
      ?auto_324283 - BLOCK
      ?auto_324284 - BLOCK
    )
    :vars
    (
      ?auto_324285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324284 ?auto_324285 ) ( ON-TABLE ?auto_324273 ) ( ON ?auto_324274 ?auto_324273 ) ( ON ?auto_324275 ?auto_324274 ) ( ON ?auto_324276 ?auto_324275 ) ( ON ?auto_324277 ?auto_324276 ) ( ON ?auto_324278 ?auto_324277 ) ( ON ?auto_324279 ?auto_324278 ) ( ON ?auto_324280 ?auto_324279 ) ( ON ?auto_324281 ?auto_324280 ) ( ON ?auto_324282 ?auto_324281 ) ( not ( = ?auto_324273 ?auto_324274 ) ) ( not ( = ?auto_324273 ?auto_324275 ) ) ( not ( = ?auto_324273 ?auto_324276 ) ) ( not ( = ?auto_324273 ?auto_324277 ) ) ( not ( = ?auto_324273 ?auto_324278 ) ) ( not ( = ?auto_324273 ?auto_324279 ) ) ( not ( = ?auto_324273 ?auto_324280 ) ) ( not ( = ?auto_324273 ?auto_324281 ) ) ( not ( = ?auto_324273 ?auto_324282 ) ) ( not ( = ?auto_324273 ?auto_324283 ) ) ( not ( = ?auto_324273 ?auto_324284 ) ) ( not ( = ?auto_324273 ?auto_324285 ) ) ( not ( = ?auto_324274 ?auto_324275 ) ) ( not ( = ?auto_324274 ?auto_324276 ) ) ( not ( = ?auto_324274 ?auto_324277 ) ) ( not ( = ?auto_324274 ?auto_324278 ) ) ( not ( = ?auto_324274 ?auto_324279 ) ) ( not ( = ?auto_324274 ?auto_324280 ) ) ( not ( = ?auto_324274 ?auto_324281 ) ) ( not ( = ?auto_324274 ?auto_324282 ) ) ( not ( = ?auto_324274 ?auto_324283 ) ) ( not ( = ?auto_324274 ?auto_324284 ) ) ( not ( = ?auto_324274 ?auto_324285 ) ) ( not ( = ?auto_324275 ?auto_324276 ) ) ( not ( = ?auto_324275 ?auto_324277 ) ) ( not ( = ?auto_324275 ?auto_324278 ) ) ( not ( = ?auto_324275 ?auto_324279 ) ) ( not ( = ?auto_324275 ?auto_324280 ) ) ( not ( = ?auto_324275 ?auto_324281 ) ) ( not ( = ?auto_324275 ?auto_324282 ) ) ( not ( = ?auto_324275 ?auto_324283 ) ) ( not ( = ?auto_324275 ?auto_324284 ) ) ( not ( = ?auto_324275 ?auto_324285 ) ) ( not ( = ?auto_324276 ?auto_324277 ) ) ( not ( = ?auto_324276 ?auto_324278 ) ) ( not ( = ?auto_324276 ?auto_324279 ) ) ( not ( = ?auto_324276 ?auto_324280 ) ) ( not ( = ?auto_324276 ?auto_324281 ) ) ( not ( = ?auto_324276 ?auto_324282 ) ) ( not ( = ?auto_324276 ?auto_324283 ) ) ( not ( = ?auto_324276 ?auto_324284 ) ) ( not ( = ?auto_324276 ?auto_324285 ) ) ( not ( = ?auto_324277 ?auto_324278 ) ) ( not ( = ?auto_324277 ?auto_324279 ) ) ( not ( = ?auto_324277 ?auto_324280 ) ) ( not ( = ?auto_324277 ?auto_324281 ) ) ( not ( = ?auto_324277 ?auto_324282 ) ) ( not ( = ?auto_324277 ?auto_324283 ) ) ( not ( = ?auto_324277 ?auto_324284 ) ) ( not ( = ?auto_324277 ?auto_324285 ) ) ( not ( = ?auto_324278 ?auto_324279 ) ) ( not ( = ?auto_324278 ?auto_324280 ) ) ( not ( = ?auto_324278 ?auto_324281 ) ) ( not ( = ?auto_324278 ?auto_324282 ) ) ( not ( = ?auto_324278 ?auto_324283 ) ) ( not ( = ?auto_324278 ?auto_324284 ) ) ( not ( = ?auto_324278 ?auto_324285 ) ) ( not ( = ?auto_324279 ?auto_324280 ) ) ( not ( = ?auto_324279 ?auto_324281 ) ) ( not ( = ?auto_324279 ?auto_324282 ) ) ( not ( = ?auto_324279 ?auto_324283 ) ) ( not ( = ?auto_324279 ?auto_324284 ) ) ( not ( = ?auto_324279 ?auto_324285 ) ) ( not ( = ?auto_324280 ?auto_324281 ) ) ( not ( = ?auto_324280 ?auto_324282 ) ) ( not ( = ?auto_324280 ?auto_324283 ) ) ( not ( = ?auto_324280 ?auto_324284 ) ) ( not ( = ?auto_324280 ?auto_324285 ) ) ( not ( = ?auto_324281 ?auto_324282 ) ) ( not ( = ?auto_324281 ?auto_324283 ) ) ( not ( = ?auto_324281 ?auto_324284 ) ) ( not ( = ?auto_324281 ?auto_324285 ) ) ( not ( = ?auto_324282 ?auto_324283 ) ) ( not ( = ?auto_324282 ?auto_324284 ) ) ( not ( = ?auto_324282 ?auto_324285 ) ) ( not ( = ?auto_324283 ?auto_324284 ) ) ( not ( = ?auto_324283 ?auto_324285 ) ) ( not ( = ?auto_324284 ?auto_324285 ) ) ( CLEAR ?auto_324282 ) ( ON ?auto_324283 ?auto_324284 ) ( CLEAR ?auto_324283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_324273 ?auto_324274 ?auto_324275 ?auto_324276 ?auto_324277 ?auto_324278 ?auto_324279 ?auto_324280 ?auto_324281 ?auto_324282 ?auto_324283 )
      ( MAKE-12PILE ?auto_324273 ?auto_324274 ?auto_324275 ?auto_324276 ?auto_324277 ?auto_324278 ?auto_324279 ?auto_324280 ?auto_324281 ?auto_324282 ?auto_324283 ?auto_324284 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_324323 - BLOCK
      ?auto_324324 - BLOCK
      ?auto_324325 - BLOCK
      ?auto_324326 - BLOCK
      ?auto_324327 - BLOCK
      ?auto_324328 - BLOCK
      ?auto_324329 - BLOCK
      ?auto_324330 - BLOCK
      ?auto_324331 - BLOCK
      ?auto_324332 - BLOCK
      ?auto_324333 - BLOCK
      ?auto_324334 - BLOCK
    )
    :vars
    (
      ?auto_324335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324334 ?auto_324335 ) ( ON-TABLE ?auto_324323 ) ( ON ?auto_324324 ?auto_324323 ) ( ON ?auto_324325 ?auto_324324 ) ( ON ?auto_324326 ?auto_324325 ) ( ON ?auto_324327 ?auto_324326 ) ( ON ?auto_324328 ?auto_324327 ) ( ON ?auto_324329 ?auto_324328 ) ( ON ?auto_324330 ?auto_324329 ) ( ON ?auto_324331 ?auto_324330 ) ( not ( = ?auto_324323 ?auto_324324 ) ) ( not ( = ?auto_324323 ?auto_324325 ) ) ( not ( = ?auto_324323 ?auto_324326 ) ) ( not ( = ?auto_324323 ?auto_324327 ) ) ( not ( = ?auto_324323 ?auto_324328 ) ) ( not ( = ?auto_324323 ?auto_324329 ) ) ( not ( = ?auto_324323 ?auto_324330 ) ) ( not ( = ?auto_324323 ?auto_324331 ) ) ( not ( = ?auto_324323 ?auto_324332 ) ) ( not ( = ?auto_324323 ?auto_324333 ) ) ( not ( = ?auto_324323 ?auto_324334 ) ) ( not ( = ?auto_324323 ?auto_324335 ) ) ( not ( = ?auto_324324 ?auto_324325 ) ) ( not ( = ?auto_324324 ?auto_324326 ) ) ( not ( = ?auto_324324 ?auto_324327 ) ) ( not ( = ?auto_324324 ?auto_324328 ) ) ( not ( = ?auto_324324 ?auto_324329 ) ) ( not ( = ?auto_324324 ?auto_324330 ) ) ( not ( = ?auto_324324 ?auto_324331 ) ) ( not ( = ?auto_324324 ?auto_324332 ) ) ( not ( = ?auto_324324 ?auto_324333 ) ) ( not ( = ?auto_324324 ?auto_324334 ) ) ( not ( = ?auto_324324 ?auto_324335 ) ) ( not ( = ?auto_324325 ?auto_324326 ) ) ( not ( = ?auto_324325 ?auto_324327 ) ) ( not ( = ?auto_324325 ?auto_324328 ) ) ( not ( = ?auto_324325 ?auto_324329 ) ) ( not ( = ?auto_324325 ?auto_324330 ) ) ( not ( = ?auto_324325 ?auto_324331 ) ) ( not ( = ?auto_324325 ?auto_324332 ) ) ( not ( = ?auto_324325 ?auto_324333 ) ) ( not ( = ?auto_324325 ?auto_324334 ) ) ( not ( = ?auto_324325 ?auto_324335 ) ) ( not ( = ?auto_324326 ?auto_324327 ) ) ( not ( = ?auto_324326 ?auto_324328 ) ) ( not ( = ?auto_324326 ?auto_324329 ) ) ( not ( = ?auto_324326 ?auto_324330 ) ) ( not ( = ?auto_324326 ?auto_324331 ) ) ( not ( = ?auto_324326 ?auto_324332 ) ) ( not ( = ?auto_324326 ?auto_324333 ) ) ( not ( = ?auto_324326 ?auto_324334 ) ) ( not ( = ?auto_324326 ?auto_324335 ) ) ( not ( = ?auto_324327 ?auto_324328 ) ) ( not ( = ?auto_324327 ?auto_324329 ) ) ( not ( = ?auto_324327 ?auto_324330 ) ) ( not ( = ?auto_324327 ?auto_324331 ) ) ( not ( = ?auto_324327 ?auto_324332 ) ) ( not ( = ?auto_324327 ?auto_324333 ) ) ( not ( = ?auto_324327 ?auto_324334 ) ) ( not ( = ?auto_324327 ?auto_324335 ) ) ( not ( = ?auto_324328 ?auto_324329 ) ) ( not ( = ?auto_324328 ?auto_324330 ) ) ( not ( = ?auto_324328 ?auto_324331 ) ) ( not ( = ?auto_324328 ?auto_324332 ) ) ( not ( = ?auto_324328 ?auto_324333 ) ) ( not ( = ?auto_324328 ?auto_324334 ) ) ( not ( = ?auto_324328 ?auto_324335 ) ) ( not ( = ?auto_324329 ?auto_324330 ) ) ( not ( = ?auto_324329 ?auto_324331 ) ) ( not ( = ?auto_324329 ?auto_324332 ) ) ( not ( = ?auto_324329 ?auto_324333 ) ) ( not ( = ?auto_324329 ?auto_324334 ) ) ( not ( = ?auto_324329 ?auto_324335 ) ) ( not ( = ?auto_324330 ?auto_324331 ) ) ( not ( = ?auto_324330 ?auto_324332 ) ) ( not ( = ?auto_324330 ?auto_324333 ) ) ( not ( = ?auto_324330 ?auto_324334 ) ) ( not ( = ?auto_324330 ?auto_324335 ) ) ( not ( = ?auto_324331 ?auto_324332 ) ) ( not ( = ?auto_324331 ?auto_324333 ) ) ( not ( = ?auto_324331 ?auto_324334 ) ) ( not ( = ?auto_324331 ?auto_324335 ) ) ( not ( = ?auto_324332 ?auto_324333 ) ) ( not ( = ?auto_324332 ?auto_324334 ) ) ( not ( = ?auto_324332 ?auto_324335 ) ) ( not ( = ?auto_324333 ?auto_324334 ) ) ( not ( = ?auto_324333 ?auto_324335 ) ) ( not ( = ?auto_324334 ?auto_324335 ) ) ( ON ?auto_324333 ?auto_324334 ) ( CLEAR ?auto_324331 ) ( ON ?auto_324332 ?auto_324333 ) ( CLEAR ?auto_324332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_324323 ?auto_324324 ?auto_324325 ?auto_324326 ?auto_324327 ?auto_324328 ?auto_324329 ?auto_324330 ?auto_324331 ?auto_324332 )
      ( MAKE-12PILE ?auto_324323 ?auto_324324 ?auto_324325 ?auto_324326 ?auto_324327 ?auto_324328 ?auto_324329 ?auto_324330 ?auto_324331 ?auto_324332 ?auto_324333 ?auto_324334 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_324373 - BLOCK
      ?auto_324374 - BLOCK
      ?auto_324375 - BLOCK
      ?auto_324376 - BLOCK
      ?auto_324377 - BLOCK
      ?auto_324378 - BLOCK
      ?auto_324379 - BLOCK
      ?auto_324380 - BLOCK
      ?auto_324381 - BLOCK
      ?auto_324382 - BLOCK
      ?auto_324383 - BLOCK
      ?auto_324384 - BLOCK
    )
    :vars
    (
      ?auto_324385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324384 ?auto_324385 ) ( ON-TABLE ?auto_324373 ) ( ON ?auto_324374 ?auto_324373 ) ( ON ?auto_324375 ?auto_324374 ) ( ON ?auto_324376 ?auto_324375 ) ( ON ?auto_324377 ?auto_324376 ) ( ON ?auto_324378 ?auto_324377 ) ( ON ?auto_324379 ?auto_324378 ) ( ON ?auto_324380 ?auto_324379 ) ( not ( = ?auto_324373 ?auto_324374 ) ) ( not ( = ?auto_324373 ?auto_324375 ) ) ( not ( = ?auto_324373 ?auto_324376 ) ) ( not ( = ?auto_324373 ?auto_324377 ) ) ( not ( = ?auto_324373 ?auto_324378 ) ) ( not ( = ?auto_324373 ?auto_324379 ) ) ( not ( = ?auto_324373 ?auto_324380 ) ) ( not ( = ?auto_324373 ?auto_324381 ) ) ( not ( = ?auto_324373 ?auto_324382 ) ) ( not ( = ?auto_324373 ?auto_324383 ) ) ( not ( = ?auto_324373 ?auto_324384 ) ) ( not ( = ?auto_324373 ?auto_324385 ) ) ( not ( = ?auto_324374 ?auto_324375 ) ) ( not ( = ?auto_324374 ?auto_324376 ) ) ( not ( = ?auto_324374 ?auto_324377 ) ) ( not ( = ?auto_324374 ?auto_324378 ) ) ( not ( = ?auto_324374 ?auto_324379 ) ) ( not ( = ?auto_324374 ?auto_324380 ) ) ( not ( = ?auto_324374 ?auto_324381 ) ) ( not ( = ?auto_324374 ?auto_324382 ) ) ( not ( = ?auto_324374 ?auto_324383 ) ) ( not ( = ?auto_324374 ?auto_324384 ) ) ( not ( = ?auto_324374 ?auto_324385 ) ) ( not ( = ?auto_324375 ?auto_324376 ) ) ( not ( = ?auto_324375 ?auto_324377 ) ) ( not ( = ?auto_324375 ?auto_324378 ) ) ( not ( = ?auto_324375 ?auto_324379 ) ) ( not ( = ?auto_324375 ?auto_324380 ) ) ( not ( = ?auto_324375 ?auto_324381 ) ) ( not ( = ?auto_324375 ?auto_324382 ) ) ( not ( = ?auto_324375 ?auto_324383 ) ) ( not ( = ?auto_324375 ?auto_324384 ) ) ( not ( = ?auto_324375 ?auto_324385 ) ) ( not ( = ?auto_324376 ?auto_324377 ) ) ( not ( = ?auto_324376 ?auto_324378 ) ) ( not ( = ?auto_324376 ?auto_324379 ) ) ( not ( = ?auto_324376 ?auto_324380 ) ) ( not ( = ?auto_324376 ?auto_324381 ) ) ( not ( = ?auto_324376 ?auto_324382 ) ) ( not ( = ?auto_324376 ?auto_324383 ) ) ( not ( = ?auto_324376 ?auto_324384 ) ) ( not ( = ?auto_324376 ?auto_324385 ) ) ( not ( = ?auto_324377 ?auto_324378 ) ) ( not ( = ?auto_324377 ?auto_324379 ) ) ( not ( = ?auto_324377 ?auto_324380 ) ) ( not ( = ?auto_324377 ?auto_324381 ) ) ( not ( = ?auto_324377 ?auto_324382 ) ) ( not ( = ?auto_324377 ?auto_324383 ) ) ( not ( = ?auto_324377 ?auto_324384 ) ) ( not ( = ?auto_324377 ?auto_324385 ) ) ( not ( = ?auto_324378 ?auto_324379 ) ) ( not ( = ?auto_324378 ?auto_324380 ) ) ( not ( = ?auto_324378 ?auto_324381 ) ) ( not ( = ?auto_324378 ?auto_324382 ) ) ( not ( = ?auto_324378 ?auto_324383 ) ) ( not ( = ?auto_324378 ?auto_324384 ) ) ( not ( = ?auto_324378 ?auto_324385 ) ) ( not ( = ?auto_324379 ?auto_324380 ) ) ( not ( = ?auto_324379 ?auto_324381 ) ) ( not ( = ?auto_324379 ?auto_324382 ) ) ( not ( = ?auto_324379 ?auto_324383 ) ) ( not ( = ?auto_324379 ?auto_324384 ) ) ( not ( = ?auto_324379 ?auto_324385 ) ) ( not ( = ?auto_324380 ?auto_324381 ) ) ( not ( = ?auto_324380 ?auto_324382 ) ) ( not ( = ?auto_324380 ?auto_324383 ) ) ( not ( = ?auto_324380 ?auto_324384 ) ) ( not ( = ?auto_324380 ?auto_324385 ) ) ( not ( = ?auto_324381 ?auto_324382 ) ) ( not ( = ?auto_324381 ?auto_324383 ) ) ( not ( = ?auto_324381 ?auto_324384 ) ) ( not ( = ?auto_324381 ?auto_324385 ) ) ( not ( = ?auto_324382 ?auto_324383 ) ) ( not ( = ?auto_324382 ?auto_324384 ) ) ( not ( = ?auto_324382 ?auto_324385 ) ) ( not ( = ?auto_324383 ?auto_324384 ) ) ( not ( = ?auto_324383 ?auto_324385 ) ) ( not ( = ?auto_324384 ?auto_324385 ) ) ( ON ?auto_324383 ?auto_324384 ) ( ON ?auto_324382 ?auto_324383 ) ( CLEAR ?auto_324380 ) ( ON ?auto_324381 ?auto_324382 ) ( CLEAR ?auto_324381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_324373 ?auto_324374 ?auto_324375 ?auto_324376 ?auto_324377 ?auto_324378 ?auto_324379 ?auto_324380 ?auto_324381 )
      ( MAKE-12PILE ?auto_324373 ?auto_324374 ?auto_324375 ?auto_324376 ?auto_324377 ?auto_324378 ?auto_324379 ?auto_324380 ?auto_324381 ?auto_324382 ?auto_324383 ?auto_324384 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_324423 - BLOCK
      ?auto_324424 - BLOCK
      ?auto_324425 - BLOCK
      ?auto_324426 - BLOCK
      ?auto_324427 - BLOCK
      ?auto_324428 - BLOCK
      ?auto_324429 - BLOCK
      ?auto_324430 - BLOCK
      ?auto_324431 - BLOCK
      ?auto_324432 - BLOCK
      ?auto_324433 - BLOCK
      ?auto_324434 - BLOCK
    )
    :vars
    (
      ?auto_324435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324434 ?auto_324435 ) ( ON-TABLE ?auto_324423 ) ( ON ?auto_324424 ?auto_324423 ) ( ON ?auto_324425 ?auto_324424 ) ( ON ?auto_324426 ?auto_324425 ) ( ON ?auto_324427 ?auto_324426 ) ( ON ?auto_324428 ?auto_324427 ) ( ON ?auto_324429 ?auto_324428 ) ( not ( = ?auto_324423 ?auto_324424 ) ) ( not ( = ?auto_324423 ?auto_324425 ) ) ( not ( = ?auto_324423 ?auto_324426 ) ) ( not ( = ?auto_324423 ?auto_324427 ) ) ( not ( = ?auto_324423 ?auto_324428 ) ) ( not ( = ?auto_324423 ?auto_324429 ) ) ( not ( = ?auto_324423 ?auto_324430 ) ) ( not ( = ?auto_324423 ?auto_324431 ) ) ( not ( = ?auto_324423 ?auto_324432 ) ) ( not ( = ?auto_324423 ?auto_324433 ) ) ( not ( = ?auto_324423 ?auto_324434 ) ) ( not ( = ?auto_324423 ?auto_324435 ) ) ( not ( = ?auto_324424 ?auto_324425 ) ) ( not ( = ?auto_324424 ?auto_324426 ) ) ( not ( = ?auto_324424 ?auto_324427 ) ) ( not ( = ?auto_324424 ?auto_324428 ) ) ( not ( = ?auto_324424 ?auto_324429 ) ) ( not ( = ?auto_324424 ?auto_324430 ) ) ( not ( = ?auto_324424 ?auto_324431 ) ) ( not ( = ?auto_324424 ?auto_324432 ) ) ( not ( = ?auto_324424 ?auto_324433 ) ) ( not ( = ?auto_324424 ?auto_324434 ) ) ( not ( = ?auto_324424 ?auto_324435 ) ) ( not ( = ?auto_324425 ?auto_324426 ) ) ( not ( = ?auto_324425 ?auto_324427 ) ) ( not ( = ?auto_324425 ?auto_324428 ) ) ( not ( = ?auto_324425 ?auto_324429 ) ) ( not ( = ?auto_324425 ?auto_324430 ) ) ( not ( = ?auto_324425 ?auto_324431 ) ) ( not ( = ?auto_324425 ?auto_324432 ) ) ( not ( = ?auto_324425 ?auto_324433 ) ) ( not ( = ?auto_324425 ?auto_324434 ) ) ( not ( = ?auto_324425 ?auto_324435 ) ) ( not ( = ?auto_324426 ?auto_324427 ) ) ( not ( = ?auto_324426 ?auto_324428 ) ) ( not ( = ?auto_324426 ?auto_324429 ) ) ( not ( = ?auto_324426 ?auto_324430 ) ) ( not ( = ?auto_324426 ?auto_324431 ) ) ( not ( = ?auto_324426 ?auto_324432 ) ) ( not ( = ?auto_324426 ?auto_324433 ) ) ( not ( = ?auto_324426 ?auto_324434 ) ) ( not ( = ?auto_324426 ?auto_324435 ) ) ( not ( = ?auto_324427 ?auto_324428 ) ) ( not ( = ?auto_324427 ?auto_324429 ) ) ( not ( = ?auto_324427 ?auto_324430 ) ) ( not ( = ?auto_324427 ?auto_324431 ) ) ( not ( = ?auto_324427 ?auto_324432 ) ) ( not ( = ?auto_324427 ?auto_324433 ) ) ( not ( = ?auto_324427 ?auto_324434 ) ) ( not ( = ?auto_324427 ?auto_324435 ) ) ( not ( = ?auto_324428 ?auto_324429 ) ) ( not ( = ?auto_324428 ?auto_324430 ) ) ( not ( = ?auto_324428 ?auto_324431 ) ) ( not ( = ?auto_324428 ?auto_324432 ) ) ( not ( = ?auto_324428 ?auto_324433 ) ) ( not ( = ?auto_324428 ?auto_324434 ) ) ( not ( = ?auto_324428 ?auto_324435 ) ) ( not ( = ?auto_324429 ?auto_324430 ) ) ( not ( = ?auto_324429 ?auto_324431 ) ) ( not ( = ?auto_324429 ?auto_324432 ) ) ( not ( = ?auto_324429 ?auto_324433 ) ) ( not ( = ?auto_324429 ?auto_324434 ) ) ( not ( = ?auto_324429 ?auto_324435 ) ) ( not ( = ?auto_324430 ?auto_324431 ) ) ( not ( = ?auto_324430 ?auto_324432 ) ) ( not ( = ?auto_324430 ?auto_324433 ) ) ( not ( = ?auto_324430 ?auto_324434 ) ) ( not ( = ?auto_324430 ?auto_324435 ) ) ( not ( = ?auto_324431 ?auto_324432 ) ) ( not ( = ?auto_324431 ?auto_324433 ) ) ( not ( = ?auto_324431 ?auto_324434 ) ) ( not ( = ?auto_324431 ?auto_324435 ) ) ( not ( = ?auto_324432 ?auto_324433 ) ) ( not ( = ?auto_324432 ?auto_324434 ) ) ( not ( = ?auto_324432 ?auto_324435 ) ) ( not ( = ?auto_324433 ?auto_324434 ) ) ( not ( = ?auto_324433 ?auto_324435 ) ) ( not ( = ?auto_324434 ?auto_324435 ) ) ( ON ?auto_324433 ?auto_324434 ) ( ON ?auto_324432 ?auto_324433 ) ( ON ?auto_324431 ?auto_324432 ) ( CLEAR ?auto_324429 ) ( ON ?auto_324430 ?auto_324431 ) ( CLEAR ?auto_324430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_324423 ?auto_324424 ?auto_324425 ?auto_324426 ?auto_324427 ?auto_324428 ?auto_324429 ?auto_324430 )
      ( MAKE-12PILE ?auto_324423 ?auto_324424 ?auto_324425 ?auto_324426 ?auto_324427 ?auto_324428 ?auto_324429 ?auto_324430 ?auto_324431 ?auto_324432 ?auto_324433 ?auto_324434 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_324473 - BLOCK
      ?auto_324474 - BLOCK
      ?auto_324475 - BLOCK
      ?auto_324476 - BLOCK
      ?auto_324477 - BLOCK
      ?auto_324478 - BLOCK
      ?auto_324479 - BLOCK
      ?auto_324480 - BLOCK
      ?auto_324481 - BLOCK
      ?auto_324482 - BLOCK
      ?auto_324483 - BLOCK
      ?auto_324484 - BLOCK
    )
    :vars
    (
      ?auto_324485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324484 ?auto_324485 ) ( ON-TABLE ?auto_324473 ) ( ON ?auto_324474 ?auto_324473 ) ( ON ?auto_324475 ?auto_324474 ) ( ON ?auto_324476 ?auto_324475 ) ( ON ?auto_324477 ?auto_324476 ) ( ON ?auto_324478 ?auto_324477 ) ( not ( = ?auto_324473 ?auto_324474 ) ) ( not ( = ?auto_324473 ?auto_324475 ) ) ( not ( = ?auto_324473 ?auto_324476 ) ) ( not ( = ?auto_324473 ?auto_324477 ) ) ( not ( = ?auto_324473 ?auto_324478 ) ) ( not ( = ?auto_324473 ?auto_324479 ) ) ( not ( = ?auto_324473 ?auto_324480 ) ) ( not ( = ?auto_324473 ?auto_324481 ) ) ( not ( = ?auto_324473 ?auto_324482 ) ) ( not ( = ?auto_324473 ?auto_324483 ) ) ( not ( = ?auto_324473 ?auto_324484 ) ) ( not ( = ?auto_324473 ?auto_324485 ) ) ( not ( = ?auto_324474 ?auto_324475 ) ) ( not ( = ?auto_324474 ?auto_324476 ) ) ( not ( = ?auto_324474 ?auto_324477 ) ) ( not ( = ?auto_324474 ?auto_324478 ) ) ( not ( = ?auto_324474 ?auto_324479 ) ) ( not ( = ?auto_324474 ?auto_324480 ) ) ( not ( = ?auto_324474 ?auto_324481 ) ) ( not ( = ?auto_324474 ?auto_324482 ) ) ( not ( = ?auto_324474 ?auto_324483 ) ) ( not ( = ?auto_324474 ?auto_324484 ) ) ( not ( = ?auto_324474 ?auto_324485 ) ) ( not ( = ?auto_324475 ?auto_324476 ) ) ( not ( = ?auto_324475 ?auto_324477 ) ) ( not ( = ?auto_324475 ?auto_324478 ) ) ( not ( = ?auto_324475 ?auto_324479 ) ) ( not ( = ?auto_324475 ?auto_324480 ) ) ( not ( = ?auto_324475 ?auto_324481 ) ) ( not ( = ?auto_324475 ?auto_324482 ) ) ( not ( = ?auto_324475 ?auto_324483 ) ) ( not ( = ?auto_324475 ?auto_324484 ) ) ( not ( = ?auto_324475 ?auto_324485 ) ) ( not ( = ?auto_324476 ?auto_324477 ) ) ( not ( = ?auto_324476 ?auto_324478 ) ) ( not ( = ?auto_324476 ?auto_324479 ) ) ( not ( = ?auto_324476 ?auto_324480 ) ) ( not ( = ?auto_324476 ?auto_324481 ) ) ( not ( = ?auto_324476 ?auto_324482 ) ) ( not ( = ?auto_324476 ?auto_324483 ) ) ( not ( = ?auto_324476 ?auto_324484 ) ) ( not ( = ?auto_324476 ?auto_324485 ) ) ( not ( = ?auto_324477 ?auto_324478 ) ) ( not ( = ?auto_324477 ?auto_324479 ) ) ( not ( = ?auto_324477 ?auto_324480 ) ) ( not ( = ?auto_324477 ?auto_324481 ) ) ( not ( = ?auto_324477 ?auto_324482 ) ) ( not ( = ?auto_324477 ?auto_324483 ) ) ( not ( = ?auto_324477 ?auto_324484 ) ) ( not ( = ?auto_324477 ?auto_324485 ) ) ( not ( = ?auto_324478 ?auto_324479 ) ) ( not ( = ?auto_324478 ?auto_324480 ) ) ( not ( = ?auto_324478 ?auto_324481 ) ) ( not ( = ?auto_324478 ?auto_324482 ) ) ( not ( = ?auto_324478 ?auto_324483 ) ) ( not ( = ?auto_324478 ?auto_324484 ) ) ( not ( = ?auto_324478 ?auto_324485 ) ) ( not ( = ?auto_324479 ?auto_324480 ) ) ( not ( = ?auto_324479 ?auto_324481 ) ) ( not ( = ?auto_324479 ?auto_324482 ) ) ( not ( = ?auto_324479 ?auto_324483 ) ) ( not ( = ?auto_324479 ?auto_324484 ) ) ( not ( = ?auto_324479 ?auto_324485 ) ) ( not ( = ?auto_324480 ?auto_324481 ) ) ( not ( = ?auto_324480 ?auto_324482 ) ) ( not ( = ?auto_324480 ?auto_324483 ) ) ( not ( = ?auto_324480 ?auto_324484 ) ) ( not ( = ?auto_324480 ?auto_324485 ) ) ( not ( = ?auto_324481 ?auto_324482 ) ) ( not ( = ?auto_324481 ?auto_324483 ) ) ( not ( = ?auto_324481 ?auto_324484 ) ) ( not ( = ?auto_324481 ?auto_324485 ) ) ( not ( = ?auto_324482 ?auto_324483 ) ) ( not ( = ?auto_324482 ?auto_324484 ) ) ( not ( = ?auto_324482 ?auto_324485 ) ) ( not ( = ?auto_324483 ?auto_324484 ) ) ( not ( = ?auto_324483 ?auto_324485 ) ) ( not ( = ?auto_324484 ?auto_324485 ) ) ( ON ?auto_324483 ?auto_324484 ) ( ON ?auto_324482 ?auto_324483 ) ( ON ?auto_324481 ?auto_324482 ) ( ON ?auto_324480 ?auto_324481 ) ( CLEAR ?auto_324478 ) ( ON ?auto_324479 ?auto_324480 ) ( CLEAR ?auto_324479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_324473 ?auto_324474 ?auto_324475 ?auto_324476 ?auto_324477 ?auto_324478 ?auto_324479 )
      ( MAKE-12PILE ?auto_324473 ?auto_324474 ?auto_324475 ?auto_324476 ?auto_324477 ?auto_324478 ?auto_324479 ?auto_324480 ?auto_324481 ?auto_324482 ?auto_324483 ?auto_324484 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_324523 - BLOCK
      ?auto_324524 - BLOCK
      ?auto_324525 - BLOCK
      ?auto_324526 - BLOCK
      ?auto_324527 - BLOCK
      ?auto_324528 - BLOCK
      ?auto_324529 - BLOCK
      ?auto_324530 - BLOCK
      ?auto_324531 - BLOCK
      ?auto_324532 - BLOCK
      ?auto_324533 - BLOCK
      ?auto_324534 - BLOCK
    )
    :vars
    (
      ?auto_324535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324534 ?auto_324535 ) ( ON-TABLE ?auto_324523 ) ( ON ?auto_324524 ?auto_324523 ) ( ON ?auto_324525 ?auto_324524 ) ( ON ?auto_324526 ?auto_324525 ) ( ON ?auto_324527 ?auto_324526 ) ( not ( = ?auto_324523 ?auto_324524 ) ) ( not ( = ?auto_324523 ?auto_324525 ) ) ( not ( = ?auto_324523 ?auto_324526 ) ) ( not ( = ?auto_324523 ?auto_324527 ) ) ( not ( = ?auto_324523 ?auto_324528 ) ) ( not ( = ?auto_324523 ?auto_324529 ) ) ( not ( = ?auto_324523 ?auto_324530 ) ) ( not ( = ?auto_324523 ?auto_324531 ) ) ( not ( = ?auto_324523 ?auto_324532 ) ) ( not ( = ?auto_324523 ?auto_324533 ) ) ( not ( = ?auto_324523 ?auto_324534 ) ) ( not ( = ?auto_324523 ?auto_324535 ) ) ( not ( = ?auto_324524 ?auto_324525 ) ) ( not ( = ?auto_324524 ?auto_324526 ) ) ( not ( = ?auto_324524 ?auto_324527 ) ) ( not ( = ?auto_324524 ?auto_324528 ) ) ( not ( = ?auto_324524 ?auto_324529 ) ) ( not ( = ?auto_324524 ?auto_324530 ) ) ( not ( = ?auto_324524 ?auto_324531 ) ) ( not ( = ?auto_324524 ?auto_324532 ) ) ( not ( = ?auto_324524 ?auto_324533 ) ) ( not ( = ?auto_324524 ?auto_324534 ) ) ( not ( = ?auto_324524 ?auto_324535 ) ) ( not ( = ?auto_324525 ?auto_324526 ) ) ( not ( = ?auto_324525 ?auto_324527 ) ) ( not ( = ?auto_324525 ?auto_324528 ) ) ( not ( = ?auto_324525 ?auto_324529 ) ) ( not ( = ?auto_324525 ?auto_324530 ) ) ( not ( = ?auto_324525 ?auto_324531 ) ) ( not ( = ?auto_324525 ?auto_324532 ) ) ( not ( = ?auto_324525 ?auto_324533 ) ) ( not ( = ?auto_324525 ?auto_324534 ) ) ( not ( = ?auto_324525 ?auto_324535 ) ) ( not ( = ?auto_324526 ?auto_324527 ) ) ( not ( = ?auto_324526 ?auto_324528 ) ) ( not ( = ?auto_324526 ?auto_324529 ) ) ( not ( = ?auto_324526 ?auto_324530 ) ) ( not ( = ?auto_324526 ?auto_324531 ) ) ( not ( = ?auto_324526 ?auto_324532 ) ) ( not ( = ?auto_324526 ?auto_324533 ) ) ( not ( = ?auto_324526 ?auto_324534 ) ) ( not ( = ?auto_324526 ?auto_324535 ) ) ( not ( = ?auto_324527 ?auto_324528 ) ) ( not ( = ?auto_324527 ?auto_324529 ) ) ( not ( = ?auto_324527 ?auto_324530 ) ) ( not ( = ?auto_324527 ?auto_324531 ) ) ( not ( = ?auto_324527 ?auto_324532 ) ) ( not ( = ?auto_324527 ?auto_324533 ) ) ( not ( = ?auto_324527 ?auto_324534 ) ) ( not ( = ?auto_324527 ?auto_324535 ) ) ( not ( = ?auto_324528 ?auto_324529 ) ) ( not ( = ?auto_324528 ?auto_324530 ) ) ( not ( = ?auto_324528 ?auto_324531 ) ) ( not ( = ?auto_324528 ?auto_324532 ) ) ( not ( = ?auto_324528 ?auto_324533 ) ) ( not ( = ?auto_324528 ?auto_324534 ) ) ( not ( = ?auto_324528 ?auto_324535 ) ) ( not ( = ?auto_324529 ?auto_324530 ) ) ( not ( = ?auto_324529 ?auto_324531 ) ) ( not ( = ?auto_324529 ?auto_324532 ) ) ( not ( = ?auto_324529 ?auto_324533 ) ) ( not ( = ?auto_324529 ?auto_324534 ) ) ( not ( = ?auto_324529 ?auto_324535 ) ) ( not ( = ?auto_324530 ?auto_324531 ) ) ( not ( = ?auto_324530 ?auto_324532 ) ) ( not ( = ?auto_324530 ?auto_324533 ) ) ( not ( = ?auto_324530 ?auto_324534 ) ) ( not ( = ?auto_324530 ?auto_324535 ) ) ( not ( = ?auto_324531 ?auto_324532 ) ) ( not ( = ?auto_324531 ?auto_324533 ) ) ( not ( = ?auto_324531 ?auto_324534 ) ) ( not ( = ?auto_324531 ?auto_324535 ) ) ( not ( = ?auto_324532 ?auto_324533 ) ) ( not ( = ?auto_324532 ?auto_324534 ) ) ( not ( = ?auto_324532 ?auto_324535 ) ) ( not ( = ?auto_324533 ?auto_324534 ) ) ( not ( = ?auto_324533 ?auto_324535 ) ) ( not ( = ?auto_324534 ?auto_324535 ) ) ( ON ?auto_324533 ?auto_324534 ) ( ON ?auto_324532 ?auto_324533 ) ( ON ?auto_324531 ?auto_324532 ) ( ON ?auto_324530 ?auto_324531 ) ( ON ?auto_324529 ?auto_324530 ) ( CLEAR ?auto_324527 ) ( ON ?auto_324528 ?auto_324529 ) ( CLEAR ?auto_324528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_324523 ?auto_324524 ?auto_324525 ?auto_324526 ?auto_324527 ?auto_324528 )
      ( MAKE-12PILE ?auto_324523 ?auto_324524 ?auto_324525 ?auto_324526 ?auto_324527 ?auto_324528 ?auto_324529 ?auto_324530 ?auto_324531 ?auto_324532 ?auto_324533 ?auto_324534 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_324573 - BLOCK
      ?auto_324574 - BLOCK
      ?auto_324575 - BLOCK
      ?auto_324576 - BLOCK
      ?auto_324577 - BLOCK
      ?auto_324578 - BLOCK
      ?auto_324579 - BLOCK
      ?auto_324580 - BLOCK
      ?auto_324581 - BLOCK
      ?auto_324582 - BLOCK
      ?auto_324583 - BLOCK
      ?auto_324584 - BLOCK
    )
    :vars
    (
      ?auto_324585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324584 ?auto_324585 ) ( ON-TABLE ?auto_324573 ) ( ON ?auto_324574 ?auto_324573 ) ( ON ?auto_324575 ?auto_324574 ) ( ON ?auto_324576 ?auto_324575 ) ( not ( = ?auto_324573 ?auto_324574 ) ) ( not ( = ?auto_324573 ?auto_324575 ) ) ( not ( = ?auto_324573 ?auto_324576 ) ) ( not ( = ?auto_324573 ?auto_324577 ) ) ( not ( = ?auto_324573 ?auto_324578 ) ) ( not ( = ?auto_324573 ?auto_324579 ) ) ( not ( = ?auto_324573 ?auto_324580 ) ) ( not ( = ?auto_324573 ?auto_324581 ) ) ( not ( = ?auto_324573 ?auto_324582 ) ) ( not ( = ?auto_324573 ?auto_324583 ) ) ( not ( = ?auto_324573 ?auto_324584 ) ) ( not ( = ?auto_324573 ?auto_324585 ) ) ( not ( = ?auto_324574 ?auto_324575 ) ) ( not ( = ?auto_324574 ?auto_324576 ) ) ( not ( = ?auto_324574 ?auto_324577 ) ) ( not ( = ?auto_324574 ?auto_324578 ) ) ( not ( = ?auto_324574 ?auto_324579 ) ) ( not ( = ?auto_324574 ?auto_324580 ) ) ( not ( = ?auto_324574 ?auto_324581 ) ) ( not ( = ?auto_324574 ?auto_324582 ) ) ( not ( = ?auto_324574 ?auto_324583 ) ) ( not ( = ?auto_324574 ?auto_324584 ) ) ( not ( = ?auto_324574 ?auto_324585 ) ) ( not ( = ?auto_324575 ?auto_324576 ) ) ( not ( = ?auto_324575 ?auto_324577 ) ) ( not ( = ?auto_324575 ?auto_324578 ) ) ( not ( = ?auto_324575 ?auto_324579 ) ) ( not ( = ?auto_324575 ?auto_324580 ) ) ( not ( = ?auto_324575 ?auto_324581 ) ) ( not ( = ?auto_324575 ?auto_324582 ) ) ( not ( = ?auto_324575 ?auto_324583 ) ) ( not ( = ?auto_324575 ?auto_324584 ) ) ( not ( = ?auto_324575 ?auto_324585 ) ) ( not ( = ?auto_324576 ?auto_324577 ) ) ( not ( = ?auto_324576 ?auto_324578 ) ) ( not ( = ?auto_324576 ?auto_324579 ) ) ( not ( = ?auto_324576 ?auto_324580 ) ) ( not ( = ?auto_324576 ?auto_324581 ) ) ( not ( = ?auto_324576 ?auto_324582 ) ) ( not ( = ?auto_324576 ?auto_324583 ) ) ( not ( = ?auto_324576 ?auto_324584 ) ) ( not ( = ?auto_324576 ?auto_324585 ) ) ( not ( = ?auto_324577 ?auto_324578 ) ) ( not ( = ?auto_324577 ?auto_324579 ) ) ( not ( = ?auto_324577 ?auto_324580 ) ) ( not ( = ?auto_324577 ?auto_324581 ) ) ( not ( = ?auto_324577 ?auto_324582 ) ) ( not ( = ?auto_324577 ?auto_324583 ) ) ( not ( = ?auto_324577 ?auto_324584 ) ) ( not ( = ?auto_324577 ?auto_324585 ) ) ( not ( = ?auto_324578 ?auto_324579 ) ) ( not ( = ?auto_324578 ?auto_324580 ) ) ( not ( = ?auto_324578 ?auto_324581 ) ) ( not ( = ?auto_324578 ?auto_324582 ) ) ( not ( = ?auto_324578 ?auto_324583 ) ) ( not ( = ?auto_324578 ?auto_324584 ) ) ( not ( = ?auto_324578 ?auto_324585 ) ) ( not ( = ?auto_324579 ?auto_324580 ) ) ( not ( = ?auto_324579 ?auto_324581 ) ) ( not ( = ?auto_324579 ?auto_324582 ) ) ( not ( = ?auto_324579 ?auto_324583 ) ) ( not ( = ?auto_324579 ?auto_324584 ) ) ( not ( = ?auto_324579 ?auto_324585 ) ) ( not ( = ?auto_324580 ?auto_324581 ) ) ( not ( = ?auto_324580 ?auto_324582 ) ) ( not ( = ?auto_324580 ?auto_324583 ) ) ( not ( = ?auto_324580 ?auto_324584 ) ) ( not ( = ?auto_324580 ?auto_324585 ) ) ( not ( = ?auto_324581 ?auto_324582 ) ) ( not ( = ?auto_324581 ?auto_324583 ) ) ( not ( = ?auto_324581 ?auto_324584 ) ) ( not ( = ?auto_324581 ?auto_324585 ) ) ( not ( = ?auto_324582 ?auto_324583 ) ) ( not ( = ?auto_324582 ?auto_324584 ) ) ( not ( = ?auto_324582 ?auto_324585 ) ) ( not ( = ?auto_324583 ?auto_324584 ) ) ( not ( = ?auto_324583 ?auto_324585 ) ) ( not ( = ?auto_324584 ?auto_324585 ) ) ( ON ?auto_324583 ?auto_324584 ) ( ON ?auto_324582 ?auto_324583 ) ( ON ?auto_324581 ?auto_324582 ) ( ON ?auto_324580 ?auto_324581 ) ( ON ?auto_324579 ?auto_324580 ) ( ON ?auto_324578 ?auto_324579 ) ( CLEAR ?auto_324576 ) ( ON ?auto_324577 ?auto_324578 ) ( CLEAR ?auto_324577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_324573 ?auto_324574 ?auto_324575 ?auto_324576 ?auto_324577 )
      ( MAKE-12PILE ?auto_324573 ?auto_324574 ?auto_324575 ?auto_324576 ?auto_324577 ?auto_324578 ?auto_324579 ?auto_324580 ?auto_324581 ?auto_324582 ?auto_324583 ?auto_324584 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_324623 - BLOCK
      ?auto_324624 - BLOCK
      ?auto_324625 - BLOCK
      ?auto_324626 - BLOCK
      ?auto_324627 - BLOCK
      ?auto_324628 - BLOCK
      ?auto_324629 - BLOCK
      ?auto_324630 - BLOCK
      ?auto_324631 - BLOCK
      ?auto_324632 - BLOCK
      ?auto_324633 - BLOCK
      ?auto_324634 - BLOCK
    )
    :vars
    (
      ?auto_324635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324634 ?auto_324635 ) ( ON-TABLE ?auto_324623 ) ( ON ?auto_324624 ?auto_324623 ) ( ON ?auto_324625 ?auto_324624 ) ( not ( = ?auto_324623 ?auto_324624 ) ) ( not ( = ?auto_324623 ?auto_324625 ) ) ( not ( = ?auto_324623 ?auto_324626 ) ) ( not ( = ?auto_324623 ?auto_324627 ) ) ( not ( = ?auto_324623 ?auto_324628 ) ) ( not ( = ?auto_324623 ?auto_324629 ) ) ( not ( = ?auto_324623 ?auto_324630 ) ) ( not ( = ?auto_324623 ?auto_324631 ) ) ( not ( = ?auto_324623 ?auto_324632 ) ) ( not ( = ?auto_324623 ?auto_324633 ) ) ( not ( = ?auto_324623 ?auto_324634 ) ) ( not ( = ?auto_324623 ?auto_324635 ) ) ( not ( = ?auto_324624 ?auto_324625 ) ) ( not ( = ?auto_324624 ?auto_324626 ) ) ( not ( = ?auto_324624 ?auto_324627 ) ) ( not ( = ?auto_324624 ?auto_324628 ) ) ( not ( = ?auto_324624 ?auto_324629 ) ) ( not ( = ?auto_324624 ?auto_324630 ) ) ( not ( = ?auto_324624 ?auto_324631 ) ) ( not ( = ?auto_324624 ?auto_324632 ) ) ( not ( = ?auto_324624 ?auto_324633 ) ) ( not ( = ?auto_324624 ?auto_324634 ) ) ( not ( = ?auto_324624 ?auto_324635 ) ) ( not ( = ?auto_324625 ?auto_324626 ) ) ( not ( = ?auto_324625 ?auto_324627 ) ) ( not ( = ?auto_324625 ?auto_324628 ) ) ( not ( = ?auto_324625 ?auto_324629 ) ) ( not ( = ?auto_324625 ?auto_324630 ) ) ( not ( = ?auto_324625 ?auto_324631 ) ) ( not ( = ?auto_324625 ?auto_324632 ) ) ( not ( = ?auto_324625 ?auto_324633 ) ) ( not ( = ?auto_324625 ?auto_324634 ) ) ( not ( = ?auto_324625 ?auto_324635 ) ) ( not ( = ?auto_324626 ?auto_324627 ) ) ( not ( = ?auto_324626 ?auto_324628 ) ) ( not ( = ?auto_324626 ?auto_324629 ) ) ( not ( = ?auto_324626 ?auto_324630 ) ) ( not ( = ?auto_324626 ?auto_324631 ) ) ( not ( = ?auto_324626 ?auto_324632 ) ) ( not ( = ?auto_324626 ?auto_324633 ) ) ( not ( = ?auto_324626 ?auto_324634 ) ) ( not ( = ?auto_324626 ?auto_324635 ) ) ( not ( = ?auto_324627 ?auto_324628 ) ) ( not ( = ?auto_324627 ?auto_324629 ) ) ( not ( = ?auto_324627 ?auto_324630 ) ) ( not ( = ?auto_324627 ?auto_324631 ) ) ( not ( = ?auto_324627 ?auto_324632 ) ) ( not ( = ?auto_324627 ?auto_324633 ) ) ( not ( = ?auto_324627 ?auto_324634 ) ) ( not ( = ?auto_324627 ?auto_324635 ) ) ( not ( = ?auto_324628 ?auto_324629 ) ) ( not ( = ?auto_324628 ?auto_324630 ) ) ( not ( = ?auto_324628 ?auto_324631 ) ) ( not ( = ?auto_324628 ?auto_324632 ) ) ( not ( = ?auto_324628 ?auto_324633 ) ) ( not ( = ?auto_324628 ?auto_324634 ) ) ( not ( = ?auto_324628 ?auto_324635 ) ) ( not ( = ?auto_324629 ?auto_324630 ) ) ( not ( = ?auto_324629 ?auto_324631 ) ) ( not ( = ?auto_324629 ?auto_324632 ) ) ( not ( = ?auto_324629 ?auto_324633 ) ) ( not ( = ?auto_324629 ?auto_324634 ) ) ( not ( = ?auto_324629 ?auto_324635 ) ) ( not ( = ?auto_324630 ?auto_324631 ) ) ( not ( = ?auto_324630 ?auto_324632 ) ) ( not ( = ?auto_324630 ?auto_324633 ) ) ( not ( = ?auto_324630 ?auto_324634 ) ) ( not ( = ?auto_324630 ?auto_324635 ) ) ( not ( = ?auto_324631 ?auto_324632 ) ) ( not ( = ?auto_324631 ?auto_324633 ) ) ( not ( = ?auto_324631 ?auto_324634 ) ) ( not ( = ?auto_324631 ?auto_324635 ) ) ( not ( = ?auto_324632 ?auto_324633 ) ) ( not ( = ?auto_324632 ?auto_324634 ) ) ( not ( = ?auto_324632 ?auto_324635 ) ) ( not ( = ?auto_324633 ?auto_324634 ) ) ( not ( = ?auto_324633 ?auto_324635 ) ) ( not ( = ?auto_324634 ?auto_324635 ) ) ( ON ?auto_324633 ?auto_324634 ) ( ON ?auto_324632 ?auto_324633 ) ( ON ?auto_324631 ?auto_324632 ) ( ON ?auto_324630 ?auto_324631 ) ( ON ?auto_324629 ?auto_324630 ) ( ON ?auto_324628 ?auto_324629 ) ( ON ?auto_324627 ?auto_324628 ) ( CLEAR ?auto_324625 ) ( ON ?auto_324626 ?auto_324627 ) ( CLEAR ?auto_324626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_324623 ?auto_324624 ?auto_324625 ?auto_324626 )
      ( MAKE-12PILE ?auto_324623 ?auto_324624 ?auto_324625 ?auto_324626 ?auto_324627 ?auto_324628 ?auto_324629 ?auto_324630 ?auto_324631 ?auto_324632 ?auto_324633 ?auto_324634 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_324673 - BLOCK
      ?auto_324674 - BLOCK
      ?auto_324675 - BLOCK
      ?auto_324676 - BLOCK
      ?auto_324677 - BLOCK
      ?auto_324678 - BLOCK
      ?auto_324679 - BLOCK
      ?auto_324680 - BLOCK
      ?auto_324681 - BLOCK
      ?auto_324682 - BLOCK
      ?auto_324683 - BLOCK
      ?auto_324684 - BLOCK
    )
    :vars
    (
      ?auto_324685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324684 ?auto_324685 ) ( ON-TABLE ?auto_324673 ) ( ON ?auto_324674 ?auto_324673 ) ( not ( = ?auto_324673 ?auto_324674 ) ) ( not ( = ?auto_324673 ?auto_324675 ) ) ( not ( = ?auto_324673 ?auto_324676 ) ) ( not ( = ?auto_324673 ?auto_324677 ) ) ( not ( = ?auto_324673 ?auto_324678 ) ) ( not ( = ?auto_324673 ?auto_324679 ) ) ( not ( = ?auto_324673 ?auto_324680 ) ) ( not ( = ?auto_324673 ?auto_324681 ) ) ( not ( = ?auto_324673 ?auto_324682 ) ) ( not ( = ?auto_324673 ?auto_324683 ) ) ( not ( = ?auto_324673 ?auto_324684 ) ) ( not ( = ?auto_324673 ?auto_324685 ) ) ( not ( = ?auto_324674 ?auto_324675 ) ) ( not ( = ?auto_324674 ?auto_324676 ) ) ( not ( = ?auto_324674 ?auto_324677 ) ) ( not ( = ?auto_324674 ?auto_324678 ) ) ( not ( = ?auto_324674 ?auto_324679 ) ) ( not ( = ?auto_324674 ?auto_324680 ) ) ( not ( = ?auto_324674 ?auto_324681 ) ) ( not ( = ?auto_324674 ?auto_324682 ) ) ( not ( = ?auto_324674 ?auto_324683 ) ) ( not ( = ?auto_324674 ?auto_324684 ) ) ( not ( = ?auto_324674 ?auto_324685 ) ) ( not ( = ?auto_324675 ?auto_324676 ) ) ( not ( = ?auto_324675 ?auto_324677 ) ) ( not ( = ?auto_324675 ?auto_324678 ) ) ( not ( = ?auto_324675 ?auto_324679 ) ) ( not ( = ?auto_324675 ?auto_324680 ) ) ( not ( = ?auto_324675 ?auto_324681 ) ) ( not ( = ?auto_324675 ?auto_324682 ) ) ( not ( = ?auto_324675 ?auto_324683 ) ) ( not ( = ?auto_324675 ?auto_324684 ) ) ( not ( = ?auto_324675 ?auto_324685 ) ) ( not ( = ?auto_324676 ?auto_324677 ) ) ( not ( = ?auto_324676 ?auto_324678 ) ) ( not ( = ?auto_324676 ?auto_324679 ) ) ( not ( = ?auto_324676 ?auto_324680 ) ) ( not ( = ?auto_324676 ?auto_324681 ) ) ( not ( = ?auto_324676 ?auto_324682 ) ) ( not ( = ?auto_324676 ?auto_324683 ) ) ( not ( = ?auto_324676 ?auto_324684 ) ) ( not ( = ?auto_324676 ?auto_324685 ) ) ( not ( = ?auto_324677 ?auto_324678 ) ) ( not ( = ?auto_324677 ?auto_324679 ) ) ( not ( = ?auto_324677 ?auto_324680 ) ) ( not ( = ?auto_324677 ?auto_324681 ) ) ( not ( = ?auto_324677 ?auto_324682 ) ) ( not ( = ?auto_324677 ?auto_324683 ) ) ( not ( = ?auto_324677 ?auto_324684 ) ) ( not ( = ?auto_324677 ?auto_324685 ) ) ( not ( = ?auto_324678 ?auto_324679 ) ) ( not ( = ?auto_324678 ?auto_324680 ) ) ( not ( = ?auto_324678 ?auto_324681 ) ) ( not ( = ?auto_324678 ?auto_324682 ) ) ( not ( = ?auto_324678 ?auto_324683 ) ) ( not ( = ?auto_324678 ?auto_324684 ) ) ( not ( = ?auto_324678 ?auto_324685 ) ) ( not ( = ?auto_324679 ?auto_324680 ) ) ( not ( = ?auto_324679 ?auto_324681 ) ) ( not ( = ?auto_324679 ?auto_324682 ) ) ( not ( = ?auto_324679 ?auto_324683 ) ) ( not ( = ?auto_324679 ?auto_324684 ) ) ( not ( = ?auto_324679 ?auto_324685 ) ) ( not ( = ?auto_324680 ?auto_324681 ) ) ( not ( = ?auto_324680 ?auto_324682 ) ) ( not ( = ?auto_324680 ?auto_324683 ) ) ( not ( = ?auto_324680 ?auto_324684 ) ) ( not ( = ?auto_324680 ?auto_324685 ) ) ( not ( = ?auto_324681 ?auto_324682 ) ) ( not ( = ?auto_324681 ?auto_324683 ) ) ( not ( = ?auto_324681 ?auto_324684 ) ) ( not ( = ?auto_324681 ?auto_324685 ) ) ( not ( = ?auto_324682 ?auto_324683 ) ) ( not ( = ?auto_324682 ?auto_324684 ) ) ( not ( = ?auto_324682 ?auto_324685 ) ) ( not ( = ?auto_324683 ?auto_324684 ) ) ( not ( = ?auto_324683 ?auto_324685 ) ) ( not ( = ?auto_324684 ?auto_324685 ) ) ( ON ?auto_324683 ?auto_324684 ) ( ON ?auto_324682 ?auto_324683 ) ( ON ?auto_324681 ?auto_324682 ) ( ON ?auto_324680 ?auto_324681 ) ( ON ?auto_324679 ?auto_324680 ) ( ON ?auto_324678 ?auto_324679 ) ( ON ?auto_324677 ?auto_324678 ) ( ON ?auto_324676 ?auto_324677 ) ( CLEAR ?auto_324674 ) ( ON ?auto_324675 ?auto_324676 ) ( CLEAR ?auto_324675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_324673 ?auto_324674 ?auto_324675 )
      ( MAKE-12PILE ?auto_324673 ?auto_324674 ?auto_324675 ?auto_324676 ?auto_324677 ?auto_324678 ?auto_324679 ?auto_324680 ?auto_324681 ?auto_324682 ?auto_324683 ?auto_324684 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_324723 - BLOCK
      ?auto_324724 - BLOCK
      ?auto_324725 - BLOCK
      ?auto_324726 - BLOCK
      ?auto_324727 - BLOCK
      ?auto_324728 - BLOCK
      ?auto_324729 - BLOCK
      ?auto_324730 - BLOCK
      ?auto_324731 - BLOCK
      ?auto_324732 - BLOCK
      ?auto_324733 - BLOCK
      ?auto_324734 - BLOCK
    )
    :vars
    (
      ?auto_324735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324734 ?auto_324735 ) ( ON-TABLE ?auto_324723 ) ( not ( = ?auto_324723 ?auto_324724 ) ) ( not ( = ?auto_324723 ?auto_324725 ) ) ( not ( = ?auto_324723 ?auto_324726 ) ) ( not ( = ?auto_324723 ?auto_324727 ) ) ( not ( = ?auto_324723 ?auto_324728 ) ) ( not ( = ?auto_324723 ?auto_324729 ) ) ( not ( = ?auto_324723 ?auto_324730 ) ) ( not ( = ?auto_324723 ?auto_324731 ) ) ( not ( = ?auto_324723 ?auto_324732 ) ) ( not ( = ?auto_324723 ?auto_324733 ) ) ( not ( = ?auto_324723 ?auto_324734 ) ) ( not ( = ?auto_324723 ?auto_324735 ) ) ( not ( = ?auto_324724 ?auto_324725 ) ) ( not ( = ?auto_324724 ?auto_324726 ) ) ( not ( = ?auto_324724 ?auto_324727 ) ) ( not ( = ?auto_324724 ?auto_324728 ) ) ( not ( = ?auto_324724 ?auto_324729 ) ) ( not ( = ?auto_324724 ?auto_324730 ) ) ( not ( = ?auto_324724 ?auto_324731 ) ) ( not ( = ?auto_324724 ?auto_324732 ) ) ( not ( = ?auto_324724 ?auto_324733 ) ) ( not ( = ?auto_324724 ?auto_324734 ) ) ( not ( = ?auto_324724 ?auto_324735 ) ) ( not ( = ?auto_324725 ?auto_324726 ) ) ( not ( = ?auto_324725 ?auto_324727 ) ) ( not ( = ?auto_324725 ?auto_324728 ) ) ( not ( = ?auto_324725 ?auto_324729 ) ) ( not ( = ?auto_324725 ?auto_324730 ) ) ( not ( = ?auto_324725 ?auto_324731 ) ) ( not ( = ?auto_324725 ?auto_324732 ) ) ( not ( = ?auto_324725 ?auto_324733 ) ) ( not ( = ?auto_324725 ?auto_324734 ) ) ( not ( = ?auto_324725 ?auto_324735 ) ) ( not ( = ?auto_324726 ?auto_324727 ) ) ( not ( = ?auto_324726 ?auto_324728 ) ) ( not ( = ?auto_324726 ?auto_324729 ) ) ( not ( = ?auto_324726 ?auto_324730 ) ) ( not ( = ?auto_324726 ?auto_324731 ) ) ( not ( = ?auto_324726 ?auto_324732 ) ) ( not ( = ?auto_324726 ?auto_324733 ) ) ( not ( = ?auto_324726 ?auto_324734 ) ) ( not ( = ?auto_324726 ?auto_324735 ) ) ( not ( = ?auto_324727 ?auto_324728 ) ) ( not ( = ?auto_324727 ?auto_324729 ) ) ( not ( = ?auto_324727 ?auto_324730 ) ) ( not ( = ?auto_324727 ?auto_324731 ) ) ( not ( = ?auto_324727 ?auto_324732 ) ) ( not ( = ?auto_324727 ?auto_324733 ) ) ( not ( = ?auto_324727 ?auto_324734 ) ) ( not ( = ?auto_324727 ?auto_324735 ) ) ( not ( = ?auto_324728 ?auto_324729 ) ) ( not ( = ?auto_324728 ?auto_324730 ) ) ( not ( = ?auto_324728 ?auto_324731 ) ) ( not ( = ?auto_324728 ?auto_324732 ) ) ( not ( = ?auto_324728 ?auto_324733 ) ) ( not ( = ?auto_324728 ?auto_324734 ) ) ( not ( = ?auto_324728 ?auto_324735 ) ) ( not ( = ?auto_324729 ?auto_324730 ) ) ( not ( = ?auto_324729 ?auto_324731 ) ) ( not ( = ?auto_324729 ?auto_324732 ) ) ( not ( = ?auto_324729 ?auto_324733 ) ) ( not ( = ?auto_324729 ?auto_324734 ) ) ( not ( = ?auto_324729 ?auto_324735 ) ) ( not ( = ?auto_324730 ?auto_324731 ) ) ( not ( = ?auto_324730 ?auto_324732 ) ) ( not ( = ?auto_324730 ?auto_324733 ) ) ( not ( = ?auto_324730 ?auto_324734 ) ) ( not ( = ?auto_324730 ?auto_324735 ) ) ( not ( = ?auto_324731 ?auto_324732 ) ) ( not ( = ?auto_324731 ?auto_324733 ) ) ( not ( = ?auto_324731 ?auto_324734 ) ) ( not ( = ?auto_324731 ?auto_324735 ) ) ( not ( = ?auto_324732 ?auto_324733 ) ) ( not ( = ?auto_324732 ?auto_324734 ) ) ( not ( = ?auto_324732 ?auto_324735 ) ) ( not ( = ?auto_324733 ?auto_324734 ) ) ( not ( = ?auto_324733 ?auto_324735 ) ) ( not ( = ?auto_324734 ?auto_324735 ) ) ( ON ?auto_324733 ?auto_324734 ) ( ON ?auto_324732 ?auto_324733 ) ( ON ?auto_324731 ?auto_324732 ) ( ON ?auto_324730 ?auto_324731 ) ( ON ?auto_324729 ?auto_324730 ) ( ON ?auto_324728 ?auto_324729 ) ( ON ?auto_324727 ?auto_324728 ) ( ON ?auto_324726 ?auto_324727 ) ( ON ?auto_324725 ?auto_324726 ) ( CLEAR ?auto_324723 ) ( ON ?auto_324724 ?auto_324725 ) ( CLEAR ?auto_324724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_324723 ?auto_324724 )
      ( MAKE-12PILE ?auto_324723 ?auto_324724 ?auto_324725 ?auto_324726 ?auto_324727 ?auto_324728 ?auto_324729 ?auto_324730 ?auto_324731 ?auto_324732 ?auto_324733 ?auto_324734 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_324773 - BLOCK
      ?auto_324774 - BLOCK
      ?auto_324775 - BLOCK
      ?auto_324776 - BLOCK
      ?auto_324777 - BLOCK
      ?auto_324778 - BLOCK
      ?auto_324779 - BLOCK
      ?auto_324780 - BLOCK
      ?auto_324781 - BLOCK
      ?auto_324782 - BLOCK
      ?auto_324783 - BLOCK
      ?auto_324784 - BLOCK
    )
    :vars
    (
      ?auto_324785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324784 ?auto_324785 ) ( not ( = ?auto_324773 ?auto_324774 ) ) ( not ( = ?auto_324773 ?auto_324775 ) ) ( not ( = ?auto_324773 ?auto_324776 ) ) ( not ( = ?auto_324773 ?auto_324777 ) ) ( not ( = ?auto_324773 ?auto_324778 ) ) ( not ( = ?auto_324773 ?auto_324779 ) ) ( not ( = ?auto_324773 ?auto_324780 ) ) ( not ( = ?auto_324773 ?auto_324781 ) ) ( not ( = ?auto_324773 ?auto_324782 ) ) ( not ( = ?auto_324773 ?auto_324783 ) ) ( not ( = ?auto_324773 ?auto_324784 ) ) ( not ( = ?auto_324773 ?auto_324785 ) ) ( not ( = ?auto_324774 ?auto_324775 ) ) ( not ( = ?auto_324774 ?auto_324776 ) ) ( not ( = ?auto_324774 ?auto_324777 ) ) ( not ( = ?auto_324774 ?auto_324778 ) ) ( not ( = ?auto_324774 ?auto_324779 ) ) ( not ( = ?auto_324774 ?auto_324780 ) ) ( not ( = ?auto_324774 ?auto_324781 ) ) ( not ( = ?auto_324774 ?auto_324782 ) ) ( not ( = ?auto_324774 ?auto_324783 ) ) ( not ( = ?auto_324774 ?auto_324784 ) ) ( not ( = ?auto_324774 ?auto_324785 ) ) ( not ( = ?auto_324775 ?auto_324776 ) ) ( not ( = ?auto_324775 ?auto_324777 ) ) ( not ( = ?auto_324775 ?auto_324778 ) ) ( not ( = ?auto_324775 ?auto_324779 ) ) ( not ( = ?auto_324775 ?auto_324780 ) ) ( not ( = ?auto_324775 ?auto_324781 ) ) ( not ( = ?auto_324775 ?auto_324782 ) ) ( not ( = ?auto_324775 ?auto_324783 ) ) ( not ( = ?auto_324775 ?auto_324784 ) ) ( not ( = ?auto_324775 ?auto_324785 ) ) ( not ( = ?auto_324776 ?auto_324777 ) ) ( not ( = ?auto_324776 ?auto_324778 ) ) ( not ( = ?auto_324776 ?auto_324779 ) ) ( not ( = ?auto_324776 ?auto_324780 ) ) ( not ( = ?auto_324776 ?auto_324781 ) ) ( not ( = ?auto_324776 ?auto_324782 ) ) ( not ( = ?auto_324776 ?auto_324783 ) ) ( not ( = ?auto_324776 ?auto_324784 ) ) ( not ( = ?auto_324776 ?auto_324785 ) ) ( not ( = ?auto_324777 ?auto_324778 ) ) ( not ( = ?auto_324777 ?auto_324779 ) ) ( not ( = ?auto_324777 ?auto_324780 ) ) ( not ( = ?auto_324777 ?auto_324781 ) ) ( not ( = ?auto_324777 ?auto_324782 ) ) ( not ( = ?auto_324777 ?auto_324783 ) ) ( not ( = ?auto_324777 ?auto_324784 ) ) ( not ( = ?auto_324777 ?auto_324785 ) ) ( not ( = ?auto_324778 ?auto_324779 ) ) ( not ( = ?auto_324778 ?auto_324780 ) ) ( not ( = ?auto_324778 ?auto_324781 ) ) ( not ( = ?auto_324778 ?auto_324782 ) ) ( not ( = ?auto_324778 ?auto_324783 ) ) ( not ( = ?auto_324778 ?auto_324784 ) ) ( not ( = ?auto_324778 ?auto_324785 ) ) ( not ( = ?auto_324779 ?auto_324780 ) ) ( not ( = ?auto_324779 ?auto_324781 ) ) ( not ( = ?auto_324779 ?auto_324782 ) ) ( not ( = ?auto_324779 ?auto_324783 ) ) ( not ( = ?auto_324779 ?auto_324784 ) ) ( not ( = ?auto_324779 ?auto_324785 ) ) ( not ( = ?auto_324780 ?auto_324781 ) ) ( not ( = ?auto_324780 ?auto_324782 ) ) ( not ( = ?auto_324780 ?auto_324783 ) ) ( not ( = ?auto_324780 ?auto_324784 ) ) ( not ( = ?auto_324780 ?auto_324785 ) ) ( not ( = ?auto_324781 ?auto_324782 ) ) ( not ( = ?auto_324781 ?auto_324783 ) ) ( not ( = ?auto_324781 ?auto_324784 ) ) ( not ( = ?auto_324781 ?auto_324785 ) ) ( not ( = ?auto_324782 ?auto_324783 ) ) ( not ( = ?auto_324782 ?auto_324784 ) ) ( not ( = ?auto_324782 ?auto_324785 ) ) ( not ( = ?auto_324783 ?auto_324784 ) ) ( not ( = ?auto_324783 ?auto_324785 ) ) ( not ( = ?auto_324784 ?auto_324785 ) ) ( ON ?auto_324783 ?auto_324784 ) ( ON ?auto_324782 ?auto_324783 ) ( ON ?auto_324781 ?auto_324782 ) ( ON ?auto_324780 ?auto_324781 ) ( ON ?auto_324779 ?auto_324780 ) ( ON ?auto_324778 ?auto_324779 ) ( ON ?auto_324777 ?auto_324778 ) ( ON ?auto_324776 ?auto_324777 ) ( ON ?auto_324775 ?auto_324776 ) ( ON ?auto_324774 ?auto_324775 ) ( ON ?auto_324773 ?auto_324774 ) ( CLEAR ?auto_324773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_324773 )
      ( MAKE-12PILE ?auto_324773 ?auto_324774 ?auto_324775 ?auto_324776 ?auto_324777 ?auto_324778 ?auto_324779 ?auto_324780 ?auto_324781 ?auto_324782 ?auto_324783 ?auto_324784 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_324824 - BLOCK
      ?auto_324825 - BLOCK
      ?auto_324826 - BLOCK
      ?auto_324827 - BLOCK
      ?auto_324828 - BLOCK
      ?auto_324829 - BLOCK
      ?auto_324830 - BLOCK
      ?auto_324831 - BLOCK
      ?auto_324832 - BLOCK
      ?auto_324833 - BLOCK
      ?auto_324834 - BLOCK
      ?auto_324835 - BLOCK
      ?auto_324836 - BLOCK
    )
    :vars
    (
      ?auto_324837 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_324835 ) ( ON ?auto_324836 ?auto_324837 ) ( CLEAR ?auto_324836 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_324824 ) ( ON ?auto_324825 ?auto_324824 ) ( ON ?auto_324826 ?auto_324825 ) ( ON ?auto_324827 ?auto_324826 ) ( ON ?auto_324828 ?auto_324827 ) ( ON ?auto_324829 ?auto_324828 ) ( ON ?auto_324830 ?auto_324829 ) ( ON ?auto_324831 ?auto_324830 ) ( ON ?auto_324832 ?auto_324831 ) ( ON ?auto_324833 ?auto_324832 ) ( ON ?auto_324834 ?auto_324833 ) ( ON ?auto_324835 ?auto_324834 ) ( not ( = ?auto_324824 ?auto_324825 ) ) ( not ( = ?auto_324824 ?auto_324826 ) ) ( not ( = ?auto_324824 ?auto_324827 ) ) ( not ( = ?auto_324824 ?auto_324828 ) ) ( not ( = ?auto_324824 ?auto_324829 ) ) ( not ( = ?auto_324824 ?auto_324830 ) ) ( not ( = ?auto_324824 ?auto_324831 ) ) ( not ( = ?auto_324824 ?auto_324832 ) ) ( not ( = ?auto_324824 ?auto_324833 ) ) ( not ( = ?auto_324824 ?auto_324834 ) ) ( not ( = ?auto_324824 ?auto_324835 ) ) ( not ( = ?auto_324824 ?auto_324836 ) ) ( not ( = ?auto_324824 ?auto_324837 ) ) ( not ( = ?auto_324825 ?auto_324826 ) ) ( not ( = ?auto_324825 ?auto_324827 ) ) ( not ( = ?auto_324825 ?auto_324828 ) ) ( not ( = ?auto_324825 ?auto_324829 ) ) ( not ( = ?auto_324825 ?auto_324830 ) ) ( not ( = ?auto_324825 ?auto_324831 ) ) ( not ( = ?auto_324825 ?auto_324832 ) ) ( not ( = ?auto_324825 ?auto_324833 ) ) ( not ( = ?auto_324825 ?auto_324834 ) ) ( not ( = ?auto_324825 ?auto_324835 ) ) ( not ( = ?auto_324825 ?auto_324836 ) ) ( not ( = ?auto_324825 ?auto_324837 ) ) ( not ( = ?auto_324826 ?auto_324827 ) ) ( not ( = ?auto_324826 ?auto_324828 ) ) ( not ( = ?auto_324826 ?auto_324829 ) ) ( not ( = ?auto_324826 ?auto_324830 ) ) ( not ( = ?auto_324826 ?auto_324831 ) ) ( not ( = ?auto_324826 ?auto_324832 ) ) ( not ( = ?auto_324826 ?auto_324833 ) ) ( not ( = ?auto_324826 ?auto_324834 ) ) ( not ( = ?auto_324826 ?auto_324835 ) ) ( not ( = ?auto_324826 ?auto_324836 ) ) ( not ( = ?auto_324826 ?auto_324837 ) ) ( not ( = ?auto_324827 ?auto_324828 ) ) ( not ( = ?auto_324827 ?auto_324829 ) ) ( not ( = ?auto_324827 ?auto_324830 ) ) ( not ( = ?auto_324827 ?auto_324831 ) ) ( not ( = ?auto_324827 ?auto_324832 ) ) ( not ( = ?auto_324827 ?auto_324833 ) ) ( not ( = ?auto_324827 ?auto_324834 ) ) ( not ( = ?auto_324827 ?auto_324835 ) ) ( not ( = ?auto_324827 ?auto_324836 ) ) ( not ( = ?auto_324827 ?auto_324837 ) ) ( not ( = ?auto_324828 ?auto_324829 ) ) ( not ( = ?auto_324828 ?auto_324830 ) ) ( not ( = ?auto_324828 ?auto_324831 ) ) ( not ( = ?auto_324828 ?auto_324832 ) ) ( not ( = ?auto_324828 ?auto_324833 ) ) ( not ( = ?auto_324828 ?auto_324834 ) ) ( not ( = ?auto_324828 ?auto_324835 ) ) ( not ( = ?auto_324828 ?auto_324836 ) ) ( not ( = ?auto_324828 ?auto_324837 ) ) ( not ( = ?auto_324829 ?auto_324830 ) ) ( not ( = ?auto_324829 ?auto_324831 ) ) ( not ( = ?auto_324829 ?auto_324832 ) ) ( not ( = ?auto_324829 ?auto_324833 ) ) ( not ( = ?auto_324829 ?auto_324834 ) ) ( not ( = ?auto_324829 ?auto_324835 ) ) ( not ( = ?auto_324829 ?auto_324836 ) ) ( not ( = ?auto_324829 ?auto_324837 ) ) ( not ( = ?auto_324830 ?auto_324831 ) ) ( not ( = ?auto_324830 ?auto_324832 ) ) ( not ( = ?auto_324830 ?auto_324833 ) ) ( not ( = ?auto_324830 ?auto_324834 ) ) ( not ( = ?auto_324830 ?auto_324835 ) ) ( not ( = ?auto_324830 ?auto_324836 ) ) ( not ( = ?auto_324830 ?auto_324837 ) ) ( not ( = ?auto_324831 ?auto_324832 ) ) ( not ( = ?auto_324831 ?auto_324833 ) ) ( not ( = ?auto_324831 ?auto_324834 ) ) ( not ( = ?auto_324831 ?auto_324835 ) ) ( not ( = ?auto_324831 ?auto_324836 ) ) ( not ( = ?auto_324831 ?auto_324837 ) ) ( not ( = ?auto_324832 ?auto_324833 ) ) ( not ( = ?auto_324832 ?auto_324834 ) ) ( not ( = ?auto_324832 ?auto_324835 ) ) ( not ( = ?auto_324832 ?auto_324836 ) ) ( not ( = ?auto_324832 ?auto_324837 ) ) ( not ( = ?auto_324833 ?auto_324834 ) ) ( not ( = ?auto_324833 ?auto_324835 ) ) ( not ( = ?auto_324833 ?auto_324836 ) ) ( not ( = ?auto_324833 ?auto_324837 ) ) ( not ( = ?auto_324834 ?auto_324835 ) ) ( not ( = ?auto_324834 ?auto_324836 ) ) ( not ( = ?auto_324834 ?auto_324837 ) ) ( not ( = ?auto_324835 ?auto_324836 ) ) ( not ( = ?auto_324835 ?auto_324837 ) ) ( not ( = ?auto_324836 ?auto_324837 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_324836 ?auto_324837 )
      ( !STACK ?auto_324836 ?auto_324835 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_324878 - BLOCK
      ?auto_324879 - BLOCK
      ?auto_324880 - BLOCK
      ?auto_324881 - BLOCK
      ?auto_324882 - BLOCK
      ?auto_324883 - BLOCK
      ?auto_324884 - BLOCK
      ?auto_324885 - BLOCK
      ?auto_324886 - BLOCK
      ?auto_324887 - BLOCK
      ?auto_324888 - BLOCK
      ?auto_324889 - BLOCK
      ?auto_324890 - BLOCK
    )
    :vars
    (
      ?auto_324891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324890 ?auto_324891 ) ( ON-TABLE ?auto_324878 ) ( ON ?auto_324879 ?auto_324878 ) ( ON ?auto_324880 ?auto_324879 ) ( ON ?auto_324881 ?auto_324880 ) ( ON ?auto_324882 ?auto_324881 ) ( ON ?auto_324883 ?auto_324882 ) ( ON ?auto_324884 ?auto_324883 ) ( ON ?auto_324885 ?auto_324884 ) ( ON ?auto_324886 ?auto_324885 ) ( ON ?auto_324887 ?auto_324886 ) ( ON ?auto_324888 ?auto_324887 ) ( not ( = ?auto_324878 ?auto_324879 ) ) ( not ( = ?auto_324878 ?auto_324880 ) ) ( not ( = ?auto_324878 ?auto_324881 ) ) ( not ( = ?auto_324878 ?auto_324882 ) ) ( not ( = ?auto_324878 ?auto_324883 ) ) ( not ( = ?auto_324878 ?auto_324884 ) ) ( not ( = ?auto_324878 ?auto_324885 ) ) ( not ( = ?auto_324878 ?auto_324886 ) ) ( not ( = ?auto_324878 ?auto_324887 ) ) ( not ( = ?auto_324878 ?auto_324888 ) ) ( not ( = ?auto_324878 ?auto_324889 ) ) ( not ( = ?auto_324878 ?auto_324890 ) ) ( not ( = ?auto_324878 ?auto_324891 ) ) ( not ( = ?auto_324879 ?auto_324880 ) ) ( not ( = ?auto_324879 ?auto_324881 ) ) ( not ( = ?auto_324879 ?auto_324882 ) ) ( not ( = ?auto_324879 ?auto_324883 ) ) ( not ( = ?auto_324879 ?auto_324884 ) ) ( not ( = ?auto_324879 ?auto_324885 ) ) ( not ( = ?auto_324879 ?auto_324886 ) ) ( not ( = ?auto_324879 ?auto_324887 ) ) ( not ( = ?auto_324879 ?auto_324888 ) ) ( not ( = ?auto_324879 ?auto_324889 ) ) ( not ( = ?auto_324879 ?auto_324890 ) ) ( not ( = ?auto_324879 ?auto_324891 ) ) ( not ( = ?auto_324880 ?auto_324881 ) ) ( not ( = ?auto_324880 ?auto_324882 ) ) ( not ( = ?auto_324880 ?auto_324883 ) ) ( not ( = ?auto_324880 ?auto_324884 ) ) ( not ( = ?auto_324880 ?auto_324885 ) ) ( not ( = ?auto_324880 ?auto_324886 ) ) ( not ( = ?auto_324880 ?auto_324887 ) ) ( not ( = ?auto_324880 ?auto_324888 ) ) ( not ( = ?auto_324880 ?auto_324889 ) ) ( not ( = ?auto_324880 ?auto_324890 ) ) ( not ( = ?auto_324880 ?auto_324891 ) ) ( not ( = ?auto_324881 ?auto_324882 ) ) ( not ( = ?auto_324881 ?auto_324883 ) ) ( not ( = ?auto_324881 ?auto_324884 ) ) ( not ( = ?auto_324881 ?auto_324885 ) ) ( not ( = ?auto_324881 ?auto_324886 ) ) ( not ( = ?auto_324881 ?auto_324887 ) ) ( not ( = ?auto_324881 ?auto_324888 ) ) ( not ( = ?auto_324881 ?auto_324889 ) ) ( not ( = ?auto_324881 ?auto_324890 ) ) ( not ( = ?auto_324881 ?auto_324891 ) ) ( not ( = ?auto_324882 ?auto_324883 ) ) ( not ( = ?auto_324882 ?auto_324884 ) ) ( not ( = ?auto_324882 ?auto_324885 ) ) ( not ( = ?auto_324882 ?auto_324886 ) ) ( not ( = ?auto_324882 ?auto_324887 ) ) ( not ( = ?auto_324882 ?auto_324888 ) ) ( not ( = ?auto_324882 ?auto_324889 ) ) ( not ( = ?auto_324882 ?auto_324890 ) ) ( not ( = ?auto_324882 ?auto_324891 ) ) ( not ( = ?auto_324883 ?auto_324884 ) ) ( not ( = ?auto_324883 ?auto_324885 ) ) ( not ( = ?auto_324883 ?auto_324886 ) ) ( not ( = ?auto_324883 ?auto_324887 ) ) ( not ( = ?auto_324883 ?auto_324888 ) ) ( not ( = ?auto_324883 ?auto_324889 ) ) ( not ( = ?auto_324883 ?auto_324890 ) ) ( not ( = ?auto_324883 ?auto_324891 ) ) ( not ( = ?auto_324884 ?auto_324885 ) ) ( not ( = ?auto_324884 ?auto_324886 ) ) ( not ( = ?auto_324884 ?auto_324887 ) ) ( not ( = ?auto_324884 ?auto_324888 ) ) ( not ( = ?auto_324884 ?auto_324889 ) ) ( not ( = ?auto_324884 ?auto_324890 ) ) ( not ( = ?auto_324884 ?auto_324891 ) ) ( not ( = ?auto_324885 ?auto_324886 ) ) ( not ( = ?auto_324885 ?auto_324887 ) ) ( not ( = ?auto_324885 ?auto_324888 ) ) ( not ( = ?auto_324885 ?auto_324889 ) ) ( not ( = ?auto_324885 ?auto_324890 ) ) ( not ( = ?auto_324885 ?auto_324891 ) ) ( not ( = ?auto_324886 ?auto_324887 ) ) ( not ( = ?auto_324886 ?auto_324888 ) ) ( not ( = ?auto_324886 ?auto_324889 ) ) ( not ( = ?auto_324886 ?auto_324890 ) ) ( not ( = ?auto_324886 ?auto_324891 ) ) ( not ( = ?auto_324887 ?auto_324888 ) ) ( not ( = ?auto_324887 ?auto_324889 ) ) ( not ( = ?auto_324887 ?auto_324890 ) ) ( not ( = ?auto_324887 ?auto_324891 ) ) ( not ( = ?auto_324888 ?auto_324889 ) ) ( not ( = ?auto_324888 ?auto_324890 ) ) ( not ( = ?auto_324888 ?auto_324891 ) ) ( not ( = ?auto_324889 ?auto_324890 ) ) ( not ( = ?auto_324889 ?auto_324891 ) ) ( not ( = ?auto_324890 ?auto_324891 ) ) ( CLEAR ?auto_324888 ) ( ON ?auto_324889 ?auto_324890 ) ( CLEAR ?auto_324889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_324878 ?auto_324879 ?auto_324880 ?auto_324881 ?auto_324882 ?auto_324883 ?auto_324884 ?auto_324885 ?auto_324886 ?auto_324887 ?auto_324888 ?auto_324889 )
      ( MAKE-13PILE ?auto_324878 ?auto_324879 ?auto_324880 ?auto_324881 ?auto_324882 ?auto_324883 ?auto_324884 ?auto_324885 ?auto_324886 ?auto_324887 ?auto_324888 ?auto_324889 ?auto_324890 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_324932 - BLOCK
      ?auto_324933 - BLOCK
      ?auto_324934 - BLOCK
      ?auto_324935 - BLOCK
      ?auto_324936 - BLOCK
      ?auto_324937 - BLOCK
      ?auto_324938 - BLOCK
      ?auto_324939 - BLOCK
      ?auto_324940 - BLOCK
      ?auto_324941 - BLOCK
      ?auto_324942 - BLOCK
      ?auto_324943 - BLOCK
      ?auto_324944 - BLOCK
    )
    :vars
    (
      ?auto_324945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324944 ?auto_324945 ) ( ON-TABLE ?auto_324932 ) ( ON ?auto_324933 ?auto_324932 ) ( ON ?auto_324934 ?auto_324933 ) ( ON ?auto_324935 ?auto_324934 ) ( ON ?auto_324936 ?auto_324935 ) ( ON ?auto_324937 ?auto_324936 ) ( ON ?auto_324938 ?auto_324937 ) ( ON ?auto_324939 ?auto_324938 ) ( ON ?auto_324940 ?auto_324939 ) ( ON ?auto_324941 ?auto_324940 ) ( not ( = ?auto_324932 ?auto_324933 ) ) ( not ( = ?auto_324932 ?auto_324934 ) ) ( not ( = ?auto_324932 ?auto_324935 ) ) ( not ( = ?auto_324932 ?auto_324936 ) ) ( not ( = ?auto_324932 ?auto_324937 ) ) ( not ( = ?auto_324932 ?auto_324938 ) ) ( not ( = ?auto_324932 ?auto_324939 ) ) ( not ( = ?auto_324932 ?auto_324940 ) ) ( not ( = ?auto_324932 ?auto_324941 ) ) ( not ( = ?auto_324932 ?auto_324942 ) ) ( not ( = ?auto_324932 ?auto_324943 ) ) ( not ( = ?auto_324932 ?auto_324944 ) ) ( not ( = ?auto_324932 ?auto_324945 ) ) ( not ( = ?auto_324933 ?auto_324934 ) ) ( not ( = ?auto_324933 ?auto_324935 ) ) ( not ( = ?auto_324933 ?auto_324936 ) ) ( not ( = ?auto_324933 ?auto_324937 ) ) ( not ( = ?auto_324933 ?auto_324938 ) ) ( not ( = ?auto_324933 ?auto_324939 ) ) ( not ( = ?auto_324933 ?auto_324940 ) ) ( not ( = ?auto_324933 ?auto_324941 ) ) ( not ( = ?auto_324933 ?auto_324942 ) ) ( not ( = ?auto_324933 ?auto_324943 ) ) ( not ( = ?auto_324933 ?auto_324944 ) ) ( not ( = ?auto_324933 ?auto_324945 ) ) ( not ( = ?auto_324934 ?auto_324935 ) ) ( not ( = ?auto_324934 ?auto_324936 ) ) ( not ( = ?auto_324934 ?auto_324937 ) ) ( not ( = ?auto_324934 ?auto_324938 ) ) ( not ( = ?auto_324934 ?auto_324939 ) ) ( not ( = ?auto_324934 ?auto_324940 ) ) ( not ( = ?auto_324934 ?auto_324941 ) ) ( not ( = ?auto_324934 ?auto_324942 ) ) ( not ( = ?auto_324934 ?auto_324943 ) ) ( not ( = ?auto_324934 ?auto_324944 ) ) ( not ( = ?auto_324934 ?auto_324945 ) ) ( not ( = ?auto_324935 ?auto_324936 ) ) ( not ( = ?auto_324935 ?auto_324937 ) ) ( not ( = ?auto_324935 ?auto_324938 ) ) ( not ( = ?auto_324935 ?auto_324939 ) ) ( not ( = ?auto_324935 ?auto_324940 ) ) ( not ( = ?auto_324935 ?auto_324941 ) ) ( not ( = ?auto_324935 ?auto_324942 ) ) ( not ( = ?auto_324935 ?auto_324943 ) ) ( not ( = ?auto_324935 ?auto_324944 ) ) ( not ( = ?auto_324935 ?auto_324945 ) ) ( not ( = ?auto_324936 ?auto_324937 ) ) ( not ( = ?auto_324936 ?auto_324938 ) ) ( not ( = ?auto_324936 ?auto_324939 ) ) ( not ( = ?auto_324936 ?auto_324940 ) ) ( not ( = ?auto_324936 ?auto_324941 ) ) ( not ( = ?auto_324936 ?auto_324942 ) ) ( not ( = ?auto_324936 ?auto_324943 ) ) ( not ( = ?auto_324936 ?auto_324944 ) ) ( not ( = ?auto_324936 ?auto_324945 ) ) ( not ( = ?auto_324937 ?auto_324938 ) ) ( not ( = ?auto_324937 ?auto_324939 ) ) ( not ( = ?auto_324937 ?auto_324940 ) ) ( not ( = ?auto_324937 ?auto_324941 ) ) ( not ( = ?auto_324937 ?auto_324942 ) ) ( not ( = ?auto_324937 ?auto_324943 ) ) ( not ( = ?auto_324937 ?auto_324944 ) ) ( not ( = ?auto_324937 ?auto_324945 ) ) ( not ( = ?auto_324938 ?auto_324939 ) ) ( not ( = ?auto_324938 ?auto_324940 ) ) ( not ( = ?auto_324938 ?auto_324941 ) ) ( not ( = ?auto_324938 ?auto_324942 ) ) ( not ( = ?auto_324938 ?auto_324943 ) ) ( not ( = ?auto_324938 ?auto_324944 ) ) ( not ( = ?auto_324938 ?auto_324945 ) ) ( not ( = ?auto_324939 ?auto_324940 ) ) ( not ( = ?auto_324939 ?auto_324941 ) ) ( not ( = ?auto_324939 ?auto_324942 ) ) ( not ( = ?auto_324939 ?auto_324943 ) ) ( not ( = ?auto_324939 ?auto_324944 ) ) ( not ( = ?auto_324939 ?auto_324945 ) ) ( not ( = ?auto_324940 ?auto_324941 ) ) ( not ( = ?auto_324940 ?auto_324942 ) ) ( not ( = ?auto_324940 ?auto_324943 ) ) ( not ( = ?auto_324940 ?auto_324944 ) ) ( not ( = ?auto_324940 ?auto_324945 ) ) ( not ( = ?auto_324941 ?auto_324942 ) ) ( not ( = ?auto_324941 ?auto_324943 ) ) ( not ( = ?auto_324941 ?auto_324944 ) ) ( not ( = ?auto_324941 ?auto_324945 ) ) ( not ( = ?auto_324942 ?auto_324943 ) ) ( not ( = ?auto_324942 ?auto_324944 ) ) ( not ( = ?auto_324942 ?auto_324945 ) ) ( not ( = ?auto_324943 ?auto_324944 ) ) ( not ( = ?auto_324943 ?auto_324945 ) ) ( not ( = ?auto_324944 ?auto_324945 ) ) ( ON ?auto_324943 ?auto_324944 ) ( CLEAR ?auto_324941 ) ( ON ?auto_324942 ?auto_324943 ) ( CLEAR ?auto_324942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_324932 ?auto_324933 ?auto_324934 ?auto_324935 ?auto_324936 ?auto_324937 ?auto_324938 ?auto_324939 ?auto_324940 ?auto_324941 ?auto_324942 )
      ( MAKE-13PILE ?auto_324932 ?auto_324933 ?auto_324934 ?auto_324935 ?auto_324936 ?auto_324937 ?auto_324938 ?auto_324939 ?auto_324940 ?auto_324941 ?auto_324942 ?auto_324943 ?auto_324944 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_324986 - BLOCK
      ?auto_324987 - BLOCK
      ?auto_324988 - BLOCK
      ?auto_324989 - BLOCK
      ?auto_324990 - BLOCK
      ?auto_324991 - BLOCK
      ?auto_324992 - BLOCK
      ?auto_324993 - BLOCK
      ?auto_324994 - BLOCK
      ?auto_324995 - BLOCK
      ?auto_324996 - BLOCK
      ?auto_324997 - BLOCK
      ?auto_324998 - BLOCK
    )
    :vars
    (
      ?auto_324999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_324998 ?auto_324999 ) ( ON-TABLE ?auto_324986 ) ( ON ?auto_324987 ?auto_324986 ) ( ON ?auto_324988 ?auto_324987 ) ( ON ?auto_324989 ?auto_324988 ) ( ON ?auto_324990 ?auto_324989 ) ( ON ?auto_324991 ?auto_324990 ) ( ON ?auto_324992 ?auto_324991 ) ( ON ?auto_324993 ?auto_324992 ) ( ON ?auto_324994 ?auto_324993 ) ( not ( = ?auto_324986 ?auto_324987 ) ) ( not ( = ?auto_324986 ?auto_324988 ) ) ( not ( = ?auto_324986 ?auto_324989 ) ) ( not ( = ?auto_324986 ?auto_324990 ) ) ( not ( = ?auto_324986 ?auto_324991 ) ) ( not ( = ?auto_324986 ?auto_324992 ) ) ( not ( = ?auto_324986 ?auto_324993 ) ) ( not ( = ?auto_324986 ?auto_324994 ) ) ( not ( = ?auto_324986 ?auto_324995 ) ) ( not ( = ?auto_324986 ?auto_324996 ) ) ( not ( = ?auto_324986 ?auto_324997 ) ) ( not ( = ?auto_324986 ?auto_324998 ) ) ( not ( = ?auto_324986 ?auto_324999 ) ) ( not ( = ?auto_324987 ?auto_324988 ) ) ( not ( = ?auto_324987 ?auto_324989 ) ) ( not ( = ?auto_324987 ?auto_324990 ) ) ( not ( = ?auto_324987 ?auto_324991 ) ) ( not ( = ?auto_324987 ?auto_324992 ) ) ( not ( = ?auto_324987 ?auto_324993 ) ) ( not ( = ?auto_324987 ?auto_324994 ) ) ( not ( = ?auto_324987 ?auto_324995 ) ) ( not ( = ?auto_324987 ?auto_324996 ) ) ( not ( = ?auto_324987 ?auto_324997 ) ) ( not ( = ?auto_324987 ?auto_324998 ) ) ( not ( = ?auto_324987 ?auto_324999 ) ) ( not ( = ?auto_324988 ?auto_324989 ) ) ( not ( = ?auto_324988 ?auto_324990 ) ) ( not ( = ?auto_324988 ?auto_324991 ) ) ( not ( = ?auto_324988 ?auto_324992 ) ) ( not ( = ?auto_324988 ?auto_324993 ) ) ( not ( = ?auto_324988 ?auto_324994 ) ) ( not ( = ?auto_324988 ?auto_324995 ) ) ( not ( = ?auto_324988 ?auto_324996 ) ) ( not ( = ?auto_324988 ?auto_324997 ) ) ( not ( = ?auto_324988 ?auto_324998 ) ) ( not ( = ?auto_324988 ?auto_324999 ) ) ( not ( = ?auto_324989 ?auto_324990 ) ) ( not ( = ?auto_324989 ?auto_324991 ) ) ( not ( = ?auto_324989 ?auto_324992 ) ) ( not ( = ?auto_324989 ?auto_324993 ) ) ( not ( = ?auto_324989 ?auto_324994 ) ) ( not ( = ?auto_324989 ?auto_324995 ) ) ( not ( = ?auto_324989 ?auto_324996 ) ) ( not ( = ?auto_324989 ?auto_324997 ) ) ( not ( = ?auto_324989 ?auto_324998 ) ) ( not ( = ?auto_324989 ?auto_324999 ) ) ( not ( = ?auto_324990 ?auto_324991 ) ) ( not ( = ?auto_324990 ?auto_324992 ) ) ( not ( = ?auto_324990 ?auto_324993 ) ) ( not ( = ?auto_324990 ?auto_324994 ) ) ( not ( = ?auto_324990 ?auto_324995 ) ) ( not ( = ?auto_324990 ?auto_324996 ) ) ( not ( = ?auto_324990 ?auto_324997 ) ) ( not ( = ?auto_324990 ?auto_324998 ) ) ( not ( = ?auto_324990 ?auto_324999 ) ) ( not ( = ?auto_324991 ?auto_324992 ) ) ( not ( = ?auto_324991 ?auto_324993 ) ) ( not ( = ?auto_324991 ?auto_324994 ) ) ( not ( = ?auto_324991 ?auto_324995 ) ) ( not ( = ?auto_324991 ?auto_324996 ) ) ( not ( = ?auto_324991 ?auto_324997 ) ) ( not ( = ?auto_324991 ?auto_324998 ) ) ( not ( = ?auto_324991 ?auto_324999 ) ) ( not ( = ?auto_324992 ?auto_324993 ) ) ( not ( = ?auto_324992 ?auto_324994 ) ) ( not ( = ?auto_324992 ?auto_324995 ) ) ( not ( = ?auto_324992 ?auto_324996 ) ) ( not ( = ?auto_324992 ?auto_324997 ) ) ( not ( = ?auto_324992 ?auto_324998 ) ) ( not ( = ?auto_324992 ?auto_324999 ) ) ( not ( = ?auto_324993 ?auto_324994 ) ) ( not ( = ?auto_324993 ?auto_324995 ) ) ( not ( = ?auto_324993 ?auto_324996 ) ) ( not ( = ?auto_324993 ?auto_324997 ) ) ( not ( = ?auto_324993 ?auto_324998 ) ) ( not ( = ?auto_324993 ?auto_324999 ) ) ( not ( = ?auto_324994 ?auto_324995 ) ) ( not ( = ?auto_324994 ?auto_324996 ) ) ( not ( = ?auto_324994 ?auto_324997 ) ) ( not ( = ?auto_324994 ?auto_324998 ) ) ( not ( = ?auto_324994 ?auto_324999 ) ) ( not ( = ?auto_324995 ?auto_324996 ) ) ( not ( = ?auto_324995 ?auto_324997 ) ) ( not ( = ?auto_324995 ?auto_324998 ) ) ( not ( = ?auto_324995 ?auto_324999 ) ) ( not ( = ?auto_324996 ?auto_324997 ) ) ( not ( = ?auto_324996 ?auto_324998 ) ) ( not ( = ?auto_324996 ?auto_324999 ) ) ( not ( = ?auto_324997 ?auto_324998 ) ) ( not ( = ?auto_324997 ?auto_324999 ) ) ( not ( = ?auto_324998 ?auto_324999 ) ) ( ON ?auto_324997 ?auto_324998 ) ( ON ?auto_324996 ?auto_324997 ) ( CLEAR ?auto_324994 ) ( ON ?auto_324995 ?auto_324996 ) ( CLEAR ?auto_324995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_324986 ?auto_324987 ?auto_324988 ?auto_324989 ?auto_324990 ?auto_324991 ?auto_324992 ?auto_324993 ?auto_324994 ?auto_324995 )
      ( MAKE-13PILE ?auto_324986 ?auto_324987 ?auto_324988 ?auto_324989 ?auto_324990 ?auto_324991 ?auto_324992 ?auto_324993 ?auto_324994 ?auto_324995 ?auto_324996 ?auto_324997 ?auto_324998 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_325040 - BLOCK
      ?auto_325041 - BLOCK
      ?auto_325042 - BLOCK
      ?auto_325043 - BLOCK
      ?auto_325044 - BLOCK
      ?auto_325045 - BLOCK
      ?auto_325046 - BLOCK
      ?auto_325047 - BLOCK
      ?auto_325048 - BLOCK
      ?auto_325049 - BLOCK
      ?auto_325050 - BLOCK
      ?auto_325051 - BLOCK
      ?auto_325052 - BLOCK
    )
    :vars
    (
      ?auto_325053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325052 ?auto_325053 ) ( ON-TABLE ?auto_325040 ) ( ON ?auto_325041 ?auto_325040 ) ( ON ?auto_325042 ?auto_325041 ) ( ON ?auto_325043 ?auto_325042 ) ( ON ?auto_325044 ?auto_325043 ) ( ON ?auto_325045 ?auto_325044 ) ( ON ?auto_325046 ?auto_325045 ) ( ON ?auto_325047 ?auto_325046 ) ( not ( = ?auto_325040 ?auto_325041 ) ) ( not ( = ?auto_325040 ?auto_325042 ) ) ( not ( = ?auto_325040 ?auto_325043 ) ) ( not ( = ?auto_325040 ?auto_325044 ) ) ( not ( = ?auto_325040 ?auto_325045 ) ) ( not ( = ?auto_325040 ?auto_325046 ) ) ( not ( = ?auto_325040 ?auto_325047 ) ) ( not ( = ?auto_325040 ?auto_325048 ) ) ( not ( = ?auto_325040 ?auto_325049 ) ) ( not ( = ?auto_325040 ?auto_325050 ) ) ( not ( = ?auto_325040 ?auto_325051 ) ) ( not ( = ?auto_325040 ?auto_325052 ) ) ( not ( = ?auto_325040 ?auto_325053 ) ) ( not ( = ?auto_325041 ?auto_325042 ) ) ( not ( = ?auto_325041 ?auto_325043 ) ) ( not ( = ?auto_325041 ?auto_325044 ) ) ( not ( = ?auto_325041 ?auto_325045 ) ) ( not ( = ?auto_325041 ?auto_325046 ) ) ( not ( = ?auto_325041 ?auto_325047 ) ) ( not ( = ?auto_325041 ?auto_325048 ) ) ( not ( = ?auto_325041 ?auto_325049 ) ) ( not ( = ?auto_325041 ?auto_325050 ) ) ( not ( = ?auto_325041 ?auto_325051 ) ) ( not ( = ?auto_325041 ?auto_325052 ) ) ( not ( = ?auto_325041 ?auto_325053 ) ) ( not ( = ?auto_325042 ?auto_325043 ) ) ( not ( = ?auto_325042 ?auto_325044 ) ) ( not ( = ?auto_325042 ?auto_325045 ) ) ( not ( = ?auto_325042 ?auto_325046 ) ) ( not ( = ?auto_325042 ?auto_325047 ) ) ( not ( = ?auto_325042 ?auto_325048 ) ) ( not ( = ?auto_325042 ?auto_325049 ) ) ( not ( = ?auto_325042 ?auto_325050 ) ) ( not ( = ?auto_325042 ?auto_325051 ) ) ( not ( = ?auto_325042 ?auto_325052 ) ) ( not ( = ?auto_325042 ?auto_325053 ) ) ( not ( = ?auto_325043 ?auto_325044 ) ) ( not ( = ?auto_325043 ?auto_325045 ) ) ( not ( = ?auto_325043 ?auto_325046 ) ) ( not ( = ?auto_325043 ?auto_325047 ) ) ( not ( = ?auto_325043 ?auto_325048 ) ) ( not ( = ?auto_325043 ?auto_325049 ) ) ( not ( = ?auto_325043 ?auto_325050 ) ) ( not ( = ?auto_325043 ?auto_325051 ) ) ( not ( = ?auto_325043 ?auto_325052 ) ) ( not ( = ?auto_325043 ?auto_325053 ) ) ( not ( = ?auto_325044 ?auto_325045 ) ) ( not ( = ?auto_325044 ?auto_325046 ) ) ( not ( = ?auto_325044 ?auto_325047 ) ) ( not ( = ?auto_325044 ?auto_325048 ) ) ( not ( = ?auto_325044 ?auto_325049 ) ) ( not ( = ?auto_325044 ?auto_325050 ) ) ( not ( = ?auto_325044 ?auto_325051 ) ) ( not ( = ?auto_325044 ?auto_325052 ) ) ( not ( = ?auto_325044 ?auto_325053 ) ) ( not ( = ?auto_325045 ?auto_325046 ) ) ( not ( = ?auto_325045 ?auto_325047 ) ) ( not ( = ?auto_325045 ?auto_325048 ) ) ( not ( = ?auto_325045 ?auto_325049 ) ) ( not ( = ?auto_325045 ?auto_325050 ) ) ( not ( = ?auto_325045 ?auto_325051 ) ) ( not ( = ?auto_325045 ?auto_325052 ) ) ( not ( = ?auto_325045 ?auto_325053 ) ) ( not ( = ?auto_325046 ?auto_325047 ) ) ( not ( = ?auto_325046 ?auto_325048 ) ) ( not ( = ?auto_325046 ?auto_325049 ) ) ( not ( = ?auto_325046 ?auto_325050 ) ) ( not ( = ?auto_325046 ?auto_325051 ) ) ( not ( = ?auto_325046 ?auto_325052 ) ) ( not ( = ?auto_325046 ?auto_325053 ) ) ( not ( = ?auto_325047 ?auto_325048 ) ) ( not ( = ?auto_325047 ?auto_325049 ) ) ( not ( = ?auto_325047 ?auto_325050 ) ) ( not ( = ?auto_325047 ?auto_325051 ) ) ( not ( = ?auto_325047 ?auto_325052 ) ) ( not ( = ?auto_325047 ?auto_325053 ) ) ( not ( = ?auto_325048 ?auto_325049 ) ) ( not ( = ?auto_325048 ?auto_325050 ) ) ( not ( = ?auto_325048 ?auto_325051 ) ) ( not ( = ?auto_325048 ?auto_325052 ) ) ( not ( = ?auto_325048 ?auto_325053 ) ) ( not ( = ?auto_325049 ?auto_325050 ) ) ( not ( = ?auto_325049 ?auto_325051 ) ) ( not ( = ?auto_325049 ?auto_325052 ) ) ( not ( = ?auto_325049 ?auto_325053 ) ) ( not ( = ?auto_325050 ?auto_325051 ) ) ( not ( = ?auto_325050 ?auto_325052 ) ) ( not ( = ?auto_325050 ?auto_325053 ) ) ( not ( = ?auto_325051 ?auto_325052 ) ) ( not ( = ?auto_325051 ?auto_325053 ) ) ( not ( = ?auto_325052 ?auto_325053 ) ) ( ON ?auto_325051 ?auto_325052 ) ( ON ?auto_325050 ?auto_325051 ) ( ON ?auto_325049 ?auto_325050 ) ( CLEAR ?auto_325047 ) ( ON ?auto_325048 ?auto_325049 ) ( CLEAR ?auto_325048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_325040 ?auto_325041 ?auto_325042 ?auto_325043 ?auto_325044 ?auto_325045 ?auto_325046 ?auto_325047 ?auto_325048 )
      ( MAKE-13PILE ?auto_325040 ?auto_325041 ?auto_325042 ?auto_325043 ?auto_325044 ?auto_325045 ?auto_325046 ?auto_325047 ?auto_325048 ?auto_325049 ?auto_325050 ?auto_325051 ?auto_325052 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_325094 - BLOCK
      ?auto_325095 - BLOCK
      ?auto_325096 - BLOCK
      ?auto_325097 - BLOCK
      ?auto_325098 - BLOCK
      ?auto_325099 - BLOCK
      ?auto_325100 - BLOCK
      ?auto_325101 - BLOCK
      ?auto_325102 - BLOCK
      ?auto_325103 - BLOCK
      ?auto_325104 - BLOCK
      ?auto_325105 - BLOCK
      ?auto_325106 - BLOCK
    )
    :vars
    (
      ?auto_325107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325106 ?auto_325107 ) ( ON-TABLE ?auto_325094 ) ( ON ?auto_325095 ?auto_325094 ) ( ON ?auto_325096 ?auto_325095 ) ( ON ?auto_325097 ?auto_325096 ) ( ON ?auto_325098 ?auto_325097 ) ( ON ?auto_325099 ?auto_325098 ) ( ON ?auto_325100 ?auto_325099 ) ( not ( = ?auto_325094 ?auto_325095 ) ) ( not ( = ?auto_325094 ?auto_325096 ) ) ( not ( = ?auto_325094 ?auto_325097 ) ) ( not ( = ?auto_325094 ?auto_325098 ) ) ( not ( = ?auto_325094 ?auto_325099 ) ) ( not ( = ?auto_325094 ?auto_325100 ) ) ( not ( = ?auto_325094 ?auto_325101 ) ) ( not ( = ?auto_325094 ?auto_325102 ) ) ( not ( = ?auto_325094 ?auto_325103 ) ) ( not ( = ?auto_325094 ?auto_325104 ) ) ( not ( = ?auto_325094 ?auto_325105 ) ) ( not ( = ?auto_325094 ?auto_325106 ) ) ( not ( = ?auto_325094 ?auto_325107 ) ) ( not ( = ?auto_325095 ?auto_325096 ) ) ( not ( = ?auto_325095 ?auto_325097 ) ) ( not ( = ?auto_325095 ?auto_325098 ) ) ( not ( = ?auto_325095 ?auto_325099 ) ) ( not ( = ?auto_325095 ?auto_325100 ) ) ( not ( = ?auto_325095 ?auto_325101 ) ) ( not ( = ?auto_325095 ?auto_325102 ) ) ( not ( = ?auto_325095 ?auto_325103 ) ) ( not ( = ?auto_325095 ?auto_325104 ) ) ( not ( = ?auto_325095 ?auto_325105 ) ) ( not ( = ?auto_325095 ?auto_325106 ) ) ( not ( = ?auto_325095 ?auto_325107 ) ) ( not ( = ?auto_325096 ?auto_325097 ) ) ( not ( = ?auto_325096 ?auto_325098 ) ) ( not ( = ?auto_325096 ?auto_325099 ) ) ( not ( = ?auto_325096 ?auto_325100 ) ) ( not ( = ?auto_325096 ?auto_325101 ) ) ( not ( = ?auto_325096 ?auto_325102 ) ) ( not ( = ?auto_325096 ?auto_325103 ) ) ( not ( = ?auto_325096 ?auto_325104 ) ) ( not ( = ?auto_325096 ?auto_325105 ) ) ( not ( = ?auto_325096 ?auto_325106 ) ) ( not ( = ?auto_325096 ?auto_325107 ) ) ( not ( = ?auto_325097 ?auto_325098 ) ) ( not ( = ?auto_325097 ?auto_325099 ) ) ( not ( = ?auto_325097 ?auto_325100 ) ) ( not ( = ?auto_325097 ?auto_325101 ) ) ( not ( = ?auto_325097 ?auto_325102 ) ) ( not ( = ?auto_325097 ?auto_325103 ) ) ( not ( = ?auto_325097 ?auto_325104 ) ) ( not ( = ?auto_325097 ?auto_325105 ) ) ( not ( = ?auto_325097 ?auto_325106 ) ) ( not ( = ?auto_325097 ?auto_325107 ) ) ( not ( = ?auto_325098 ?auto_325099 ) ) ( not ( = ?auto_325098 ?auto_325100 ) ) ( not ( = ?auto_325098 ?auto_325101 ) ) ( not ( = ?auto_325098 ?auto_325102 ) ) ( not ( = ?auto_325098 ?auto_325103 ) ) ( not ( = ?auto_325098 ?auto_325104 ) ) ( not ( = ?auto_325098 ?auto_325105 ) ) ( not ( = ?auto_325098 ?auto_325106 ) ) ( not ( = ?auto_325098 ?auto_325107 ) ) ( not ( = ?auto_325099 ?auto_325100 ) ) ( not ( = ?auto_325099 ?auto_325101 ) ) ( not ( = ?auto_325099 ?auto_325102 ) ) ( not ( = ?auto_325099 ?auto_325103 ) ) ( not ( = ?auto_325099 ?auto_325104 ) ) ( not ( = ?auto_325099 ?auto_325105 ) ) ( not ( = ?auto_325099 ?auto_325106 ) ) ( not ( = ?auto_325099 ?auto_325107 ) ) ( not ( = ?auto_325100 ?auto_325101 ) ) ( not ( = ?auto_325100 ?auto_325102 ) ) ( not ( = ?auto_325100 ?auto_325103 ) ) ( not ( = ?auto_325100 ?auto_325104 ) ) ( not ( = ?auto_325100 ?auto_325105 ) ) ( not ( = ?auto_325100 ?auto_325106 ) ) ( not ( = ?auto_325100 ?auto_325107 ) ) ( not ( = ?auto_325101 ?auto_325102 ) ) ( not ( = ?auto_325101 ?auto_325103 ) ) ( not ( = ?auto_325101 ?auto_325104 ) ) ( not ( = ?auto_325101 ?auto_325105 ) ) ( not ( = ?auto_325101 ?auto_325106 ) ) ( not ( = ?auto_325101 ?auto_325107 ) ) ( not ( = ?auto_325102 ?auto_325103 ) ) ( not ( = ?auto_325102 ?auto_325104 ) ) ( not ( = ?auto_325102 ?auto_325105 ) ) ( not ( = ?auto_325102 ?auto_325106 ) ) ( not ( = ?auto_325102 ?auto_325107 ) ) ( not ( = ?auto_325103 ?auto_325104 ) ) ( not ( = ?auto_325103 ?auto_325105 ) ) ( not ( = ?auto_325103 ?auto_325106 ) ) ( not ( = ?auto_325103 ?auto_325107 ) ) ( not ( = ?auto_325104 ?auto_325105 ) ) ( not ( = ?auto_325104 ?auto_325106 ) ) ( not ( = ?auto_325104 ?auto_325107 ) ) ( not ( = ?auto_325105 ?auto_325106 ) ) ( not ( = ?auto_325105 ?auto_325107 ) ) ( not ( = ?auto_325106 ?auto_325107 ) ) ( ON ?auto_325105 ?auto_325106 ) ( ON ?auto_325104 ?auto_325105 ) ( ON ?auto_325103 ?auto_325104 ) ( ON ?auto_325102 ?auto_325103 ) ( CLEAR ?auto_325100 ) ( ON ?auto_325101 ?auto_325102 ) ( CLEAR ?auto_325101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_325094 ?auto_325095 ?auto_325096 ?auto_325097 ?auto_325098 ?auto_325099 ?auto_325100 ?auto_325101 )
      ( MAKE-13PILE ?auto_325094 ?auto_325095 ?auto_325096 ?auto_325097 ?auto_325098 ?auto_325099 ?auto_325100 ?auto_325101 ?auto_325102 ?auto_325103 ?auto_325104 ?auto_325105 ?auto_325106 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_325148 - BLOCK
      ?auto_325149 - BLOCK
      ?auto_325150 - BLOCK
      ?auto_325151 - BLOCK
      ?auto_325152 - BLOCK
      ?auto_325153 - BLOCK
      ?auto_325154 - BLOCK
      ?auto_325155 - BLOCK
      ?auto_325156 - BLOCK
      ?auto_325157 - BLOCK
      ?auto_325158 - BLOCK
      ?auto_325159 - BLOCK
      ?auto_325160 - BLOCK
    )
    :vars
    (
      ?auto_325161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325160 ?auto_325161 ) ( ON-TABLE ?auto_325148 ) ( ON ?auto_325149 ?auto_325148 ) ( ON ?auto_325150 ?auto_325149 ) ( ON ?auto_325151 ?auto_325150 ) ( ON ?auto_325152 ?auto_325151 ) ( ON ?auto_325153 ?auto_325152 ) ( not ( = ?auto_325148 ?auto_325149 ) ) ( not ( = ?auto_325148 ?auto_325150 ) ) ( not ( = ?auto_325148 ?auto_325151 ) ) ( not ( = ?auto_325148 ?auto_325152 ) ) ( not ( = ?auto_325148 ?auto_325153 ) ) ( not ( = ?auto_325148 ?auto_325154 ) ) ( not ( = ?auto_325148 ?auto_325155 ) ) ( not ( = ?auto_325148 ?auto_325156 ) ) ( not ( = ?auto_325148 ?auto_325157 ) ) ( not ( = ?auto_325148 ?auto_325158 ) ) ( not ( = ?auto_325148 ?auto_325159 ) ) ( not ( = ?auto_325148 ?auto_325160 ) ) ( not ( = ?auto_325148 ?auto_325161 ) ) ( not ( = ?auto_325149 ?auto_325150 ) ) ( not ( = ?auto_325149 ?auto_325151 ) ) ( not ( = ?auto_325149 ?auto_325152 ) ) ( not ( = ?auto_325149 ?auto_325153 ) ) ( not ( = ?auto_325149 ?auto_325154 ) ) ( not ( = ?auto_325149 ?auto_325155 ) ) ( not ( = ?auto_325149 ?auto_325156 ) ) ( not ( = ?auto_325149 ?auto_325157 ) ) ( not ( = ?auto_325149 ?auto_325158 ) ) ( not ( = ?auto_325149 ?auto_325159 ) ) ( not ( = ?auto_325149 ?auto_325160 ) ) ( not ( = ?auto_325149 ?auto_325161 ) ) ( not ( = ?auto_325150 ?auto_325151 ) ) ( not ( = ?auto_325150 ?auto_325152 ) ) ( not ( = ?auto_325150 ?auto_325153 ) ) ( not ( = ?auto_325150 ?auto_325154 ) ) ( not ( = ?auto_325150 ?auto_325155 ) ) ( not ( = ?auto_325150 ?auto_325156 ) ) ( not ( = ?auto_325150 ?auto_325157 ) ) ( not ( = ?auto_325150 ?auto_325158 ) ) ( not ( = ?auto_325150 ?auto_325159 ) ) ( not ( = ?auto_325150 ?auto_325160 ) ) ( not ( = ?auto_325150 ?auto_325161 ) ) ( not ( = ?auto_325151 ?auto_325152 ) ) ( not ( = ?auto_325151 ?auto_325153 ) ) ( not ( = ?auto_325151 ?auto_325154 ) ) ( not ( = ?auto_325151 ?auto_325155 ) ) ( not ( = ?auto_325151 ?auto_325156 ) ) ( not ( = ?auto_325151 ?auto_325157 ) ) ( not ( = ?auto_325151 ?auto_325158 ) ) ( not ( = ?auto_325151 ?auto_325159 ) ) ( not ( = ?auto_325151 ?auto_325160 ) ) ( not ( = ?auto_325151 ?auto_325161 ) ) ( not ( = ?auto_325152 ?auto_325153 ) ) ( not ( = ?auto_325152 ?auto_325154 ) ) ( not ( = ?auto_325152 ?auto_325155 ) ) ( not ( = ?auto_325152 ?auto_325156 ) ) ( not ( = ?auto_325152 ?auto_325157 ) ) ( not ( = ?auto_325152 ?auto_325158 ) ) ( not ( = ?auto_325152 ?auto_325159 ) ) ( not ( = ?auto_325152 ?auto_325160 ) ) ( not ( = ?auto_325152 ?auto_325161 ) ) ( not ( = ?auto_325153 ?auto_325154 ) ) ( not ( = ?auto_325153 ?auto_325155 ) ) ( not ( = ?auto_325153 ?auto_325156 ) ) ( not ( = ?auto_325153 ?auto_325157 ) ) ( not ( = ?auto_325153 ?auto_325158 ) ) ( not ( = ?auto_325153 ?auto_325159 ) ) ( not ( = ?auto_325153 ?auto_325160 ) ) ( not ( = ?auto_325153 ?auto_325161 ) ) ( not ( = ?auto_325154 ?auto_325155 ) ) ( not ( = ?auto_325154 ?auto_325156 ) ) ( not ( = ?auto_325154 ?auto_325157 ) ) ( not ( = ?auto_325154 ?auto_325158 ) ) ( not ( = ?auto_325154 ?auto_325159 ) ) ( not ( = ?auto_325154 ?auto_325160 ) ) ( not ( = ?auto_325154 ?auto_325161 ) ) ( not ( = ?auto_325155 ?auto_325156 ) ) ( not ( = ?auto_325155 ?auto_325157 ) ) ( not ( = ?auto_325155 ?auto_325158 ) ) ( not ( = ?auto_325155 ?auto_325159 ) ) ( not ( = ?auto_325155 ?auto_325160 ) ) ( not ( = ?auto_325155 ?auto_325161 ) ) ( not ( = ?auto_325156 ?auto_325157 ) ) ( not ( = ?auto_325156 ?auto_325158 ) ) ( not ( = ?auto_325156 ?auto_325159 ) ) ( not ( = ?auto_325156 ?auto_325160 ) ) ( not ( = ?auto_325156 ?auto_325161 ) ) ( not ( = ?auto_325157 ?auto_325158 ) ) ( not ( = ?auto_325157 ?auto_325159 ) ) ( not ( = ?auto_325157 ?auto_325160 ) ) ( not ( = ?auto_325157 ?auto_325161 ) ) ( not ( = ?auto_325158 ?auto_325159 ) ) ( not ( = ?auto_325158 ?auto_325160 ) ) ( not ( = ?auto_325158 ?auto_325161 ) ) ( not ( = ?auto_325159 ?auto_325160 ) ) ( not ( = ?auto_325159 ?auto_325161 ) ) ( not ( = ?auto_325160 ?auto_325161 ) ) ( ON ?auto_325159 ?auto_325160 ) ( ON ?auto_325158 ?auto_325159 ) ( ON ?auto_325157 ?auto_325158 ) ( ON ?auto_325156 ?auto_325157 ) ( ON ?auto_325155 ?auto_325156 ) ( CLEAR ?auto_325153 ) ( ON ?auto_325154 ?auto_325155 ) ( CLEAR ?auto_325154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_325148 ?auto_325149 ?auto_325150 ?auto_325151 ?auto_325152 ?auto_325153 ?auto_325154 )
      ( MAKE-13PILE ?auto_325148 ?auto_325149 ?auto_325150 ?auto_325151 ?auto_325152 ?auto_325153 ?auto_325154 ?auto_325155 ?auto_325156 ?auto_325157 ?auto_325158 ?auto_325159 ?auto_325160 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_325202 - BLOCK
      ?auto_325203 - BLOCK
      ?auto_325204 - BLOCK
      ?auto_325205 - BLOCK
      ?auto_325206 - BLOCK
      ?auto_325207 - BLOCK
      ?auto_325208 - BLOCK
      ?auto_325209 - BLOCK
      ?auto_325210 - BLOCK
      ?auto_325211 - BLOCK
      ?auto_325212 - BLOCK
      ?auto_325213 - BLOCK
      ?auto_325214 - BLOCK
    )
    :vars
    (
      ?auto_325215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325214 ?auto_325215 ) ( ON-TABLE ?auto_325202 ) ( ON ?auto_325203 ?auto_325202 ) ( ON ?auto_325204 ?auto_325203 ) ( ON ?auto_325205 ?auto_325204 ) ( ON ?auto_325206 ?auto_325205 ) ( not ( = ?auto_325202 ?auto_325203 ) ) ( not ( = ?auto_325202 ?auto_325204 ) ) ( not ( = ?auto_325202 ?auto_325205 ) ) ( not ( = ?auto_325202 ?auto_325206 ) ) ( not ( = ?auto_325202 ?auto_325207 ) ) ( not ( = ?auto_325202 ?auto_325208 ) ) ( not ( = ?auto_325202 ?auto_325209 ) ) ( not ( = ?auto_325202 ?auto_325210 ) ) ( not ( = ?auto_325202 ?auto_325211 ) ) ( not ( = ?auto_325202 ?auto_325212 ) ) ( not ( = ?auto_325202 ?auto_325213 ) ) ( not ( = ?auto_325202 ?auto_325214 ) ) ( not ( = ?auto_325202 ?auto_325215 ) ) ( not ( = ?auto_325203 ?auto_325204 ) ) ( not ( = ?auto_325203 ?auto_325205 ) ) ( not ( = ?auto_325203 ?auto_325206 ) ) ( not ( = ?auto_325203 ?auto_325207 ) ) ( not ( = ?auto_325203 ?auto_325208 ) ) ( not ( = ?auto_325203 ?auto_325209 ) ) ( not ( = ?auto_325203 ?auto_325210 ) ) ( not ( = ?auto_325203 ?auto_325211 ) ) ( not ( = ?auto_325203 ?auto_325212 ) ) ( not ( = ?auto_325203 ?auto_325213 ) ) ( not ( = ?auto_325203 ?auto_325214 ) ) ( not ( = ?auto_325203 ?auto_325215 ) ) ( not ( = ?auto_325204 ?auto_325205 ) ) ( not ( = ?auto_325204 ?auto_325206 ) ) ( not ( = ?auto_325204 ?auto_325207 ) ) ( not ( = ?auto_325204 ?auto_325208 ) ) ( not ( = ?auto_325204 ?auto_325209 ) ) ( not ( = ?auto_325204 ?auto_325210 ) ) ( not ( = ?auto_325204 ?auto_325211 ) ) ( not ( = ?auto_325204 ?auto_325212 ) ) ( not ( = ?auto_325204 ?auto_325213 ) ) ( not ( = ?auto_325204 ?auto_325214 ) ) ( not ( = ?auto_325204 ?auto_325215 ) ) ( not ( = ?auto_325205 ?auto_325206 ) ) ( not ( = ?auto_325205 ?auto_325207 ) ) ( not ( = ?auto_325205 ?auto_325208 ) ) ( not ( = ?auto_325205 ?auto_325209 ) ) ( not ( = ?auto_325205 ?auto_325210 ) ) ( not ( = ?auto_325205 ?auto_325211 ) ) ( not ( = ?auto_325205 ?auto_325212 ) ) ( not ( = ?auto_325205 ?auto_325213 ) ) ( not ( = ?auto_325205 ?auto_325214 ) ) ( not ( = ?auto_325205 ?auto_325215 ) ) ( not ( = ?auto_325206 ?auto_325207 ) ) ( not ( = ?auto_325206 ?auto_325208 ) ) ( not ( = ?auto_325206 ?auto_325209 ) ) ( not ( = ?auto_325206 ?auto_325210 ) ) ( not ( = ?auto_325206 ?auto_325211 ) ) ( not ( = ?auto_325206 ?auto_325212 ) ) ( not ( = ?auto_325206 ?auto_325213 ) ) ( not ( = ?auto_325206 ?auto_325214 ) ) ( not ( = ?auto_325206 ?auto_325215 ) ) ( not ( = ?auto_325207 ?auto_325208 ) ) ( not ( = ?auto_325207 ?auto_325209 ) ) ( not ( = ?auto_325207 ?auto_325210 ) ) ( not ( = ?auto_325207 ?auto_325211 ) ) ( not ( = ?auto_325207 ?auto_325212 ) ) ( not ( = ?auto_325207 ?auto_325213 ) ) ( not ( = ?auto_325207 ?auto_325214 ) ) ( not ( = ?auto_325207 ?auto_325215 ) ) ( not ( = ?auto_325208 ?auto_325209 ) ) ( not ( = ?auto_325208 ?auto_325210 ) ) ( not ( = ?auto_325208 ?auto_325211 ) ) ( not ( = ?auto_325208 ?auto_325212 ) ) ( not ( = ?auto_325208 ?auto_325213 ) ) ( not ( = ?auto_325208 ?auto_325214 ) ) ( not ( = ?auto_325208 ?auto_325215 ) ) ( not ( = ?auto_325209 ?auto_325210 ) ) ( not ( = ?auto_325209 ?auto_325211 ) ) ( not ( = ?auto_325209 ?auto_325212 ) ) ( not ( = ?auto_325209 ?auto_325213 ) ) ( not ( = ?auto_325209 ?auto_325214 ) ) ( not ( = ?auto_325209 ?auto_325215 ) ) ( not ( = ?auto_325210 ?auto_325211 ) ) ( not ( = ?auto_325210 ?auto_325212 ) ) ( not ( = ?auto_325210 ?auto_325213 ) ) ( not ( = ?auto_325210 ?auto_325214 ) ) ( not ( = ?auto_325210 ?auto_325215 ) ) ( not ( = ?auto_325211 ?auto_325212 ) ) ( not ( = ?auto_325211 ?auto_325213 ) ) ( not ( = ?auto_325211 ?auto_325214 ) ) ( not ( = ?auto_325211 ?auto_325215 ) ) ( not ( = ?auto_325212 ?auto_325213 ) ) ( not ( = ?auto_325212 ?auto_325214 ) ) ( not ( = ?auto_325212 ?auto_325215 ) ) ( not ( = ?auto_325213 ?auto_325214 ) ) ( not ( = ?auto_325213 ?auto_325215 ) ) ( not ( = ?auto_325214 ?auto_325215 ) ) ( ON ?auto_325213 ?auto_325214 ) ( ON ?auto_325212 ?auto_325213 ) ( ON ?auto_325211 ?auto_325212 ) ( ON ?auto_325210 ?auto_325211 ) ( ON ?auto_325209 ?auto_325210 ) ( ON ?auto_325208 ?auto_325209 ) ( CLEAR ?auto_325206 ) ( ON ?auto_325207 ?auto_325208 ) ( CLEAR ?auto_325207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_325202 ?auto_325203 ?auto_325204 ?auto_325205 ?auto_325206 ?auto_325207 )
      ( MAKE-13PILE ?auto_325202 ?auto_325203 ?auto_325204 ?auto_325205 ?auto_325206 ?auto_325207 ?auto_325208 ?auto_325209 ?auto_325210 ?auto_325211 ?auto_325212 ?auto_325213 ?auto_325214 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_325256 - BLOCK
      ?auto_325257 - BLOCK
      ?auto_325258 - BLOCK
      ?auto_325259 - BLOCK
      ?auto_325260 - BLOCK
      ?auto_325261 - BLOCK
      ?auto_325262 - BLOCK
      ?auto_325263 - BLOCK
      ?auto_325264 - BLOCK
      ?auto_325265 - BLOCK
      ?auto_325266 - BLOCK
      ?auto_325267 - BLOCK
      ?auto_325268 - BLOCK
    )
    :vars
    (
      ?auto_325269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325268 ?auto_325269 ) ( ON-TABLE ?auto_325256 ) ( ON ?auto_325257 ?auto_325256 ) ( ON ?auto_325258 ?auto_325257 ) ( ON ?auto_325259 ?auto_325258 ) ( not ( = ?auto_325256 ?auto_325257 ) ) ( not ( = ?auto_325256 ?auto_325258 ) ) ( not ( = ?auto_325256 ?auto_325259 ) ) ( not ( = ?auto_325256 ?auto_325260 ) ) ( not ( = ?auto_325256 ?auto_325261 ) ) ( not ( = ?auto_325256 ?auto_325262 ) ) ( not ( = ?auto_325256 ?auto_325263 ) ) ( not ( = ?auto_325256 ?auto_325264 ) ) ( not ( = ?auto_325256 ?auto_325265 ) ) ( not ( = ?auto_325256 ?auto_325266 ) ) ( not ( = ?auto_325256 ?auto_325267 ) ) ( not ( = ?auto_325256 ?auto_325268 ) ) ( not ( = ?auto_325256 ?auto_325269 ) ) ( not ( = ?auto_325257 ?auto_325258 ) ) ( not ( = ?auto_325257 ?auto_325259 ) ) ( not ( = ?auto_325257 ?auto_325260 ) ) ( not ( = ?auto_325257 ?auto_325261 ) ) ( not ( = ?auto_325257 ?auto_325262 ) ) ( not ( = ?auto_325257 ?auto_325263 ) ) ( not ( = ?auto_325257 ?auto_325264 ) ) ( not ( = ?auto_325257 ?auto_325265 ) ) ( not ( = ?auto_325257 ?auto_325266 ) ) ( not ( = ?auto_325257 ?auto_325267 ) ) ( not ( = ?auto_325257 ?auto_325268 ) ) ( not ( = ?auto_325257 ?auto_325269 ) ) ( not ( = ?auto_325258 ?auto_325259 ) ) ( not ( = ?auto_325258 ?auto_325260 ) ) ( not ( = ?auto_325258 ?auto_325261 ) ) ( not ( = ?auto_325258 ?auto_325262 ) ) ( not ( = ?auto_325258 ?auto_325263 ) ) ( not ( = ?auto_325258 ?auto_325264 ) ) ( not ( = ?auto_325258 ?auto_325265 ) ) ( not ( = ?auto_325258 ?auto_325266 ) ) ( not ( = ?auto_325258 ?auto_325267 ) ) ( not ( = ?auto_325258 ?auto_325268 ) ) ( not ( = ?auto_325258 ?auto_325269 ) ) ( not ( = ?auto_325259 ?auto_325260 ) ) ( not ( = ?auto_325259 ?auto_325261 ) ) ( not ( = ?auto_325259 ?auto_325262 ) ) ( not ( = ?auto_325259 ?auto_325263 ) ) ( not ( = ?auto_325259 ?auto_325264 ) ) ( not ( = ?auto_325259 ?auto_325265 ) ) ( not ( = ?auto_325259 ?auto_325266 ) ) ( not ( = ?auto_325259 ?auto_325267 ) ) ( not ( = ?auto_325259 ?auto_325268 ) ) ( not ( = ?auto_325259 ?auto_325269 ) ) ( not ( = ?auto_325260 ?auto_325261 ) ) ( not ( = ?auto_325260 ?auto_325262 ) ) ( not ( = ?auto_325260 ?auto_325263 ) ) ( not ( = ?auto_325260 ?auto_325264 ) ) ( not ( = ?auto_325260 ?auto_325265 ) ) ( not ( = ?auto_325260 ?auto_325266 ) ) ( not ( = ?auto_325260 ?auto_325267 ) ) ( not ( = ?auto_325260 ?auto_325268 ) ) ( not ( = ?auto_325260 ?auto_325269 ) ) ( not ( = ?auto_325261 ?auto_325262 ) ) ( not ( = ?auto_325261 ?auto_325263 ) ) ( not ( = ?auto_325261 ?auto_325264 ) ) ( not ( = ?auto_325261 ?auto_325265 ) ) ( not ( = ?auto_325261 ?auto_325266 ) ) ( not ( = ?auto_325261 ?auto_325267 ) ) ( not ( = ?auto_325261 ?auto_325268 ) ) ( not ( = ?auto_325261 ?auto_325269 ) ) ( not ( = ?auto_325262 ?auto_325263 ) ) ( not ( = ?auto_325262 ?auto_325264 ) ) ( not ( = ?auto_325262 ?auto_325265 ) ) ( not ( = ?auto_325262 ?auto_325266 ) ) ( not ( = ?auto_325262 ?auto_325267 ) ) ( not ( = ?auto_325262 ?auto_325268 ) ) ( not ( = ?auto_325262 ?auto_325269 ) ) ( not ( = ?auto_325263 ?auto_325264 ) ) ( not ( = ?auto_325263 ?auto_325265 ) ) ( not ( = ?auto_325263 ?auto_325266 ) ) ( not ( = ?auto_325263 ?auto_325267 ) ) ( not ( = ?auto_325263 ?auto_325268 ) ) ( not ( = ?auto_325263 ?auto_325269 ) ) ( not ( = ?auto_325264 ?auto_325265 ) ) ( not ( = ?auto_325264 ?auto_325266 ) ) ( not ( = ?auto_325264 ?auto_325267 ) ) ( not ( = ?auto_325264 ?auto_325268 ) ) ( not ( = ?auto_325264 ?auto_325269 ) ) ( not ( = ?auto_325265 ?auto_325266 ) ) ( not ( = ?auto_325265 ?auto_325267 ) ) ( not ( = ?auto_325265 ?auto_325268 ) ) ( not ( = ?auto_325265 ?auto_325269 ) ) ( not ( = ?auto_325266 ?auto_325267 ) ) ( not ( = ?auto_325266 ?auto_325268 ) ) ( not ( = ?auto_325266 ?auto_325269 ) ) ( not ( = ?auto_325267 ?auto_325268 ) ) ( not ( = ?auto_325267 ?auto_325269 ) ) ( not ( = ?auto_325268 ?auto_325269 ) ) ( ON ?auto_325267 ?auto_325268 ) ( ON ?auto_325266 ?auto_325267 ) ( ON ?auto_325265 ?auto_325266 ) ( ON ?auto_325264 ?auto_325265 ) ( ON ?auto_325263 ?auto_325264 ) ( ON ?auto_325262 ?auto_325263 ) ( ON ?auto_325261 ?auto_325262 ) ( CLEAR ?auto_325259 ) ( ON ?auto_325260 ?auto_325261 ) ( CLEAR ?auto_325260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_325256 ?auto_325257 ?auto_325258 ?auto_325259 ?auto_325260 )
      ( MAKE-13PILE ?auto_325256 ?auto_325257 ?auto_325258 ?auto_325259 ?auto_325260 ?auto_325261 ?auto_325262 ?auto_325263 ?auto_325264 ?auto_325265 ?auto_325266 ?auto_325267 ?auto_325268 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_325310 - BLOCK
      ?auto_325311 - BLOCK
      ?auto_325312 - BLOCK
      ?auto_325313 - BLOCK
      ?auto_325314 - BLOCK
      ?auto_325315 - BLOCK
      ?auto_325316 - BLOCK
      ?auto_325317 - BLOCK
      ?auto_325318 - BLOCK
      ?auto_325319 - BLOCK
      ?auto_325320 - BLOCK
      ?auto_325321 - BLOCK
      ?auto_325322 - BLOCK
    )
    :vars
    (
      ?auto_325323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325322 ?auto_325323 ) ( ON-TABLE ?auto_325310 ) ( ON ?auto_325311 ?auto_325310 ) ( ON ?auto_325312 ?auto_325311 ) ( not ( = ?auto_325310 ?auto_325311 ) ) ( not ( = ?auto_325310 ?auto_325312 ) ) ( not ( = ?auto_325310 ?auto_325313 ) ) ( not ( = ?auto_325310 ?auto_325314 ) ) ( not ( = ?auto_325310 ?auto_325315 ) ) ( not ( = ?auto_325310 ?auto_325316 ) ) ( not ( = ?auto_325310 ?auto_325317 ) ) ( not ( = ?auto_325310 ?auto_325318 ) ) ( not ( = ?auto_325310 ?auto_325319 ) ) ( not ( = ?auto_325310 ?auto_325320 ) ) ( not ( = ?auto_325310 ?auto_325321 ) ) ( not ( = ?auto_325310 ?auto_325322 ) ) ( not ( = ?auto_325310 ?auto_325323 ) ) ( not ( = ?auto_325311 ?auto_325312 ) ) ( not ( = ?auto_325311 ?auto_325313 ) ) ( not ( = ?auto_325311 ?auto_325314 ) ) ( not ( = ?auto_325311 ?auto_325315 ) ) ( not ( = ?auto_325311 ?auto_325316 ) ) ( not ( = ?auto_325311 ?auto_325317 ) ) ( not ( = ?auto_325311 ?auto_325318 ) ) ( not ( = ?auto_325311 ?auto_325319 ) ) ( not ( = ?auto_325311 ?auto_325320 ) ) ( not ( = ?auto_325311 ?auto_325321 ) ) ( not ( = ?auto_325311 ?auto_325322 ) ) ( not ( = ?auto_325311 ?auto_325323 ) ) ( not ( = ?auto_325312 ?auto_325313 ) ) ( not ( = ?auto_325312 ?auto_325314 ) ) ( not ( = ?auto_325312 ?auto_325315 ) ) ( not ( = ?auto_325312 ?auto_325316 ) ) ( not ( = ?auto_325312 ?auto_325317 ) ) ( not ( = ?auto_325312 ?auto_325318 ) ) ( not ( = ?auto_325312 ?auto_325319 ) ) ( not ( = ?auto_325312 ?auto_325320 ) ) ( not ( = ?auto_325312 ?auto_325321 ) ) ( not ( = ?auto_325312 ?auto_325322 ) ) ( not ( = ?auto_325312 ?auto_325323 ) ) ( not ( = ?auto_325313 ?auto_325314 ) ) ( not ( = ?auto_325313 ?auto_325315 ) ) ( not ( = ?auto_325313 ?auto_325316 ) ) ( not ( = ?auto_325313 ?auto_325317 ) ) ( not ( = ?auto_325313 ?auto_325318 ) ) ( not ( = ?auto_325313 ?auto_325319 ) ) ( not ( = ?auto_325313 ?auto_325320 ) ) ( not ( = ?auto_325313 ?auto_325321 ) ) ( not ( = ?auto_325313 ?auto_325322 ) ) ( not ( = ?auto_325313 ?auto_325323 ) ) ( not ( = ?auto_325314 ?auto_325315 ) ) ( not ( = ?auto_325314 ?auto_325316 ) ) ( not ( = ?auto_325314 ?auto_325317 ) ) ( not ( = ?auto_325314 ?auto_325318 ) ) ( not ( = ?auto_325314 ?auto_325319 ) ) ( not ( = ?auto_325314 ?auto_325320 ) ) ( not ( = ?auto_325314 ?auto_325321 ) ) ( not ( = ?auto_325314 ?auto_325322 ) ) ( not ( = ?auto_325314 ?auto_325323 ) ) ( not ( = ?auto_325315 ?auto_325316 ) ) ( not ( = ?auto_325315 ?auto_325317 ) ) ( not ( = ?auto_325315 ?auto_325318 ) ) ( not ( = ?auto_325315 ?auto_325319 ) ) ( not ( = ?auto_325315 ?auto_325320 ) ) ( not ( = ?auto_325315 ?auto_325321 ) ) ( not ( = ?auto_325315 ?auto_325322 ) ) ( not ( = ?auto_325315 ?auto_325323 ) ) ( not ( = ?auto_325316 ?auto_325317 ) ) ( not ( = ?auto_325316 ?auto_325318 ) ) ( not ( = ?auto_325316 ?auto_325319 ) ) ( not ( = ?auto_325316 ?auto_325320 ) ) ( not ( = ?auto_325316 ?auto_325321 ) ) ( not ( = ?auto_325316 ?auto_325322 ) ) ( not ( = ?auto_325316 ?auto_325323 ) ) ( not ( = ?auto_325317 ?auto_325318 ) ) ( not ( = ?auto_325317 ?auto_325319 ) ) ( not ( = ?auto_325317 ?auto_325320 ) ) ( not ( = ?auto_325317 ?auto_325321 ) ) ( not ( = ?auto_325317 ?auto_325322 ) ) ( not ( = ?auto_325317 ?auto_325323 ) ) ( not ( = ?auto_325318 ?auto_325319 ) ) ( not ( = ?auto_325318 ?auto_325320 ) ) ( not ( = ?auto_325318 ?auto_325321 ) ) ( not ( = ?auto_325318 ?auto_325322 ) ) ( not ( = ?auto_325318 ?auto_325323 ) ) ( not ( = ?auto_325319 ?auto_325320 ) ) ( not ( = ?auto_325319 ?auto_325321 ) ) ( not ( = ?auto_325319 ?auto_325322 ) ) ( not ( = ?auto_325319 ?auto_325323 ) ) ( not ( = ?auto_325320 ?auto_325321 ) ) ( not ( = ?auto_325320 ?auto_325322 ) ) ( not ( = ?auto_325320 ?auto_325323 ) ) ( not ( = ?auto_325321 ?auto_325322 ) ) ( not ( = ?auto_325321 ?auto_325323 ) ) ( not ( = ?auto_325322 ?auto_325323 ) ) ( ON ?auto_325321 ?auto_325322 ) ( ON ?auto_325320 ?auto_325321 ) ( ON ?auto_325319 ?auto_325320 ) ( ON ?auto_325318 ?auto_325319 ) ( ON ?auto_325317 ?auto_325318 ) ( ON ?auto_325316 ?auto_325317 ) ( ON ?auto_325315 ?auto_325316 ) ( ON ?auto_325314 ?auto_325315 ) ( CLEAR ?auto_325312 ) ( ON ?auto_325313 ?auto_325314 ) ( CLEAR ?auto_325313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_325310 ?auto_325311 ?auto_325312 ?auto_325313 )
      ( MAKE-13PILE ?auto_325310 ?auto_325311 ?auto_325312 ?auto_325313 ?auto_325314 ?auto_325315 ?auto_325316 ?auto_325317 ?auto_325318 ?auto_325319 ?auto_325320 ?auto_325321 ?auto_325322 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_325364 - BLOCK
      ?auto_325365 - BLOCK
      ?auto_325366 - BLOCK
      ?auto_325367 - BLOCK
      ?auto_325368 - BLOCK
      ?auto_325369 - BLOCK
      ?auto_325370 - BLOCK
      ?auto_325371 - BLOCK
      ?auto_325372 - BLOCK
      ?auto_325373 - BLOCK
      ?auto_325374 - BLOCK
      ?auto_325375 - BLOCK
      ?auto_325376 - BLOCK
    )
    :vars
    (
      ?auto_325377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325376 ?auto_325377 ) ( ON-TABLE ?auto_325364 ) ( ON ?auto_325365 ?auto_325364 ) ( not ( = ?auto_325364 ?auto_325365 ) ) ( not ( = ?auto_325364 ?auto_325366 ) ) ( not ( = ?auto_325364 ?auto_325367 ) ) ( not ( = ?auto_325364 ?auto_325368 ) ) ( not ( = ?auto_325364 ?auto_325369 ) ) ( not ( = ?auto_325364 ?auto_325370 ) ) ( not ( = ?auto_325364 ?auto_325371 ) ) ( not ( = ?auto_325364 ?auto_325372 ) ) ( not ( = ?auto_325364 ?auto_325373 ) ) ( not ( = ?auto_325364 ?auto_325374 ) ) ( not ( = ?auto_325364 ?auto_325375 ) ) ( not ( = ?auto_325364 ?auto_325376 ) ) ( not ( = ?auto_325364 ?auto_325377 ) ) ( not ( = ?auto_325365 ?auto_325366 ) ) ( not ( = ?auto_325365 ?auto_325367 ) ) ( not ( = ?auto_325365 ?auto_325368 ) ) ( not ( = ?auto_325365 ?auto_325369 ) ) ( not ( = ?auto_325365 ?auto_325370 ) ) ( not ( = ?auto_325365 ?auto_325371 ) ) ( not ( = ?auto_325365 ?auto_325372 ) ) ( not ( = ?auto_325365 ?auto_325373 ) ) ( not ( = ?auto_325365 ?auto_325374 ) ) ( not ( = ?auto_325365 ?auto_325375 ) ) ( not ( = ?auto_325365 ?auto_325376 ) ) ( not ( = ?auto_325365 ?auto_325377 ) ) ( not ( = ?auto_325366 ?auto_325367 ) ) ( not ( = ?auto_325366 ?auto_325368 ) ) ( not ( = ?auto_325366 ?auto_325369 ) ) ( not ( = ?auto_325366 ?auto_325370 ) ) ( not ( = ?auto_325366 ?auto_325371 ) ) ( not ( = ?auto_325366 ?auto_325372 ) ) ( not ( = ?auto_325366 ?auto_325373 ) ) ( not ( = ?auto_325366 ?auto_325374 ) ) ( not ( = ?auto_325366 ?auto_325375 ) ) ( not ( = ?auto_325366 ?auto_325376 ) ) ( not ( = ?auto_325366 ?auto_325377 ) ) ( not ( = ?auto_325367 ?auto_325368 ) ) ( not ( = ?auto_325367 ?auto_325369 ) ) ( not ( = ?auto_325367 ?auto_325370 ) ) ( not ( = ?auto_325367 ?auto_325371 ) ) ( not ( = ?auto_325367 ?auto_325372 ) ) ( not ( = ?auto_325367 ?auto_325373 ) ) ( not ( = ?auto_325367 ?auto_325374 ) ) ( not ( = ?auto_325367 ?auto_325375 ) ) ( not ( = ?auto_325367 ?auto_325376 ) ) ( not ( = ?auto_325367 ?auto_325377 ) ) ( not ( = ?auto_325368 ?auto_325369 ) ) ( not ( = ?auto_325368 ?auto_325370 ) ) ( not ( = ?auto_325368 ?auto_325371 ) ) ( not ( = ?auto_325368 ?auto_325372 ) ) ( not ( = ?auto_325368 ?auto_325373 ) ) ( not ( = ?auto_325368 ?auto_325374 ) ) ( not ( = ?auto_325368 ?auto_325375 ) ) ( not ( = ?auto_325368 ?auto_325376 ) ) ( not ( = ?auto_325368 ?auto_325377 ) ) ( not ( = ?auto_325369 ?auto_325370 ) ) ( not ( = ?auto_325369 ?auto_325371 ) ) ( not ( = ?auto_325369 ?auto_325372 ) ) ( not ( = ?auto_325369 ?auto_325373 ) ) ( not ( = ?auto_325369 ?auto_325374 ) ) ( not ( = ?auto_325369 ?auto_325375 ) ) ( not ( = ?auto_325369 ?auto_325376 ) ) ( not ( = ?auto_325369 ?auto_325377 ) ) ( not ( = ?auto_325370 ?auto_325371 ) ) ( not ( = ?auto_325370 ?auto_325372 ) ) ( not ( = ?auto_325370 ?auto_325373 ) ) ( not ( = ?auto_325370 ?auto_325374 ) ) ( not ( = ?auto_325370 ?auto_325375 ) ) ( not ( = ?auto_325370 ?auto_325376 ) ) ( not ( = ?auto_325370 ?auto_325377 ) ) ( not ( = ?auto_325371 ?auto_325372 ) ) ( not ( = ?auto_325371 ?auto_325373 ) ) ( not ( = ?auto_325371 ?auto_325374 ) ) ( not ( = ?auto_325371 ?auto_325375 ) ) ( not ( = ?auto_325371 ?auto_325376 ) ) ( not ( = ?auto_325371 ?auto_325377 ) ) ( not ( = ?auto_325372 ?auto_325373 ) ) ( not ( = ?auto_325372 ?auto_325374 ) ) ( not ( = ?auto_325372 ?auto_325375 ) ) ( not ( = ?auto_325372 ?auto_325376 ) ) ( not ( = ?auto_325372 ?auto_325377 ) ) ( not ( = ?auto_325373 ?auto_325374 ) ) ( not ( = ?auto_325373 ?auto_325375 ) ) ( not ( = ?auto_325373 ?auto_325376 ) ) ( not ( = ?auto_325373 ?auto_325377 ) ) ( not ( = ?auto_325374 ?auto_325375 ) ) ( not ( = ?auto_325374 ?auto_325376 ) ) ( not ( = ?auto_325374 ?auto_325377 ) ) ( not ( = ?auto_325375 ?auto_325376 ) ) ( not ( = ?auto_325375 ?auto_325377 ) ) ( not ( = ?auto_325376 ?auto_325377 ) ) ( ON ?auto_325375 ?auto_325376 ) ( ON ?auto_325374 ?auto_325375 ) ( ON ?auto_325373 ?auto_325374 ) ( ON ?auto_325372 ?auto_325373 ) ( ON ?auto_325371 ?auto_325372 ) ( ON ?auto_325370 ?auto_325371 ) ( ON ?auto_325369 ?auto_325370 ) ( ON ?auto_325368 ?auto_325369 ) ( ON ?auto_325367 ?auto_325368 ) ( CLEAR ?auto_325365 ) ( ON ?auto_325366 ?auto_325367 ) ( CLEAR ?auto_325366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_325364 ?auto_325365 ?auto_325366 )
      ( MAKE-13PILE ?auto_325364 ?auto_325365 ?auto_325366 ?auto_325367 ?auto_325368 ?auto_325369 ?auto_325370 ?auto_325371 ?auto_325372 ?auto_325373 ?auto_325374 ?auto_325375 ?auto_325376 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_325418 - BLOCK
      ?auto_325419 - BLOCK
      ?auto_325420 - BLOCK
      ?auto_325421 - BLOCK
      ?auto_325422 - BLOCK
      ?auto_325423 - BLOCK
      ?auto_325424 - BLOCK
      ?auto_325425 - BLOCK
      ?auto_325426 - BLOCK
      ?auto_325427 - BLOCK
      ?auto_325428 - BLOCK
      ?auto_325429 - BLOCK
      ?auto_325430 - BLOCK
    )
    :vars
    (
      ?auto_325431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325430 ?auto_325431 ) ( ON-TABLE ?auto_325418 ) ( not ( = ?auto_325418 ?auto_325419 ) ) ( not ( = ?auto_325418 ?auto_325420 ) ) ( not ( = ?auto_325418 ?auto_325421 ) ) ( not ( = ?auto_325418 ?auto_325422 ) ) ( not ( = ?auto_325418 ?auto_325423 ) ) ( not ( = ?auto_325418 ?auto_325424 ) ) ( not ( = ?auto_325418 ?auto_325425 ) ) ( not ( = ?auto_325418 ?auto_325426 ) ) ( not ( = ?auto_325418 ?auto_325427 ) ) ( not ( = ?auto_325418 ?auto_325428 ) ) ( not ( = ?auto_325418 ?auto_325429 ) ) ( not ( = ?auto_325418 ?auto_325430 ) ) ( not ( = ?auto_325418 ?auto_325431 ) ) ( not ( = ?auto_325419 ?auto_325420 ) ) ( not ( = ?auto_325419 ?auto_325421 ) ) ( not ( = ?auto_325419 ?auto_325422 ) ) ( not ( = ?auto_325419 ?auto_325423 ) ) ( not ( = ?auto_325419 ?auto_325424 ) ) ( not ( = ?auto_325419 ?auto_325425 ) ) ( not ( = ?auto_325419 ?auto_325426 ) ) ( not ( = ?auto_325419 ?auto_325427 ) ) ( not ( = ?auto_325419 ?auto_325428 ) ) ( not ( = ?auto_325419 ?auto_325429 ) ) ( not ( = ?auto_325419 ?auto_325430 ) ) ( not ( = ?auto_325419 ?auto_325431 ) ) ( not ( = ?auto_325420 ?auto_325421 ) ) ( not ( = ?auto_325420 ?auto_325422 ) ) ( not ( = ?auto_325420 ?auto_325423 ) ) ( not ( = ?auto_325420 ?auto_325424 ) ) ( not ( = ?auto_325420 ?auto_325425 ) ) ( not ( = ?auto_325420 ?auto_325426 ) ) ( not ( = ?auto_325420 ?auto_325427 ) ) ( not ( = ?auto_325420 ?auto_325428 ) ) ( not ( = ?auto_325420 ?auto_325429 ) ) ( not ( = ?auto_325420 ?auto_325430 ) ) ( not ( = ?auto_325420 ?auto_325431 ) ) ( not ( = ?auto_325421 ?auto_325422 ) ) ( not ( = ?auto_325421 ?auto_325423 ) ) ( not ( = ?auto_325421 ?auto_325424 ) ) ( not ( = ?auto_325421 ?auto_325425 ) ) ( not ( = ?auto_325421 ?auto_325426 ) ) ( not ( = ?auto_325421 ?auto_325427 ) ) ( not ( = ?auto_325421 ?auto_325428 ) ) ( not ( = ?auto_325421 ?auto_325429 ) ) ( not ( = ?auto_325421 ?auto_325430 ) ) ( not ( = ?auto_325421 ?auto_325431 ) ) ( not ( = ?auto_325422 ?auto_325423 ) ) ( not ( = ?auto_325422 ?auto_325424 ) ) ( not ( = ?auto_325422 ?auto_325425 ) ) ( not ( = ?auto_325422 ?auto_325426 ) ) ( not ( = ?auto_325422 ?auto_325427 ) ) ( not ( = ?auto_325422 ?auto_325428 ) ) ( not ( = ?auto_325422 ?auto_325429 ) ) ( not ( = ?auto_325422 ?auto_325430 ) ) ( not ( = ?auto_325422 ?auto_325431 ) ) ( not ( = ?auto_325423 ?auto_325424 ) ) ( not ( = ?auto_325423 ?auto_325425 ) ) ( not ( = ?auto_325423 ?auto_325426 ) ) ( not ( = ?auto_325423 ?auto_325427 ) ) ( not ( = ?auto_325423 ?auto_325428 ) ) ( not ( = ?auto_325423 ?auto_325429 ) ) ( not ( = ?auto_325423 ?auto_325430 ) ) ( not ( = ?auto_325423 ?auto_325431 ) ) ( not ( = ?auto_325424 ?auto_325425 ) ) ( not ( = ?auto_325424 ?auto_325426 ) ) ( not ( = ?auto_325424 ?auto_325427 ) ) ( not ( = ?auto_325424 ?auto_325428 ) ) ( not ( = ?auto_325424 ?auto_325429 ) ) ( not ( = ?auto_325424 ?auto_325430 ) ) ( not ( = ?auto_325424 ?auto_325431 ) ) ( not ( = ?auto_325425 ?auto_325426 ) ) ( not ( = ?auto_325425 ?auto_325427 ) ) ( not ( = ?auto_325425 ?auto_325428 ) ) ( not ( = ?auto_325425 ?auto_325429 ) ) ( not ( = ?auto_325425 ?auto_325430 ) ) ( not ( = ?auto_325425 ?auto_325431 ) ) ( not ( = ?auto_325426 ?auto_325427 ) ) ( not ( = ?auto_325426 ?auto_325428 ) ) ( not ( = ?auto_325426 ?auto_325429 ) ) ( not ( = ?auto_325426 ?auto_325430 ) ) ( not ( = ?auto_325426 ?auto_325431 ) ) ( not ( = ?auto_325427 ?auto_325428 ) ) ( not ( = ?auto_325427 ?auto_325429 ) ) ( not ( = ?auto_325427 ?auto_325430 ) ) ( not ( = ?auto_325427 ?auto_325431 ) ) ( not ( = ?auto_325428 ?auto_325429 ) ) ( not ( = ?auto_325428 ?auto_325430 ) ) ( not ( = ?auto_325428 ?auto_325431 ) ) ( not ( = ?auto_325429 ?auto_325430 ) ) ( not ( = ?auto_325429 ?auto_325431 ) ) ( not ( = ?auto_325430 ?auto_325431 ) ) ( ON ?auto_325429 ?auto_325430 ) ( ON ?auto_325428 ?auto_325429 ) ( ON ?auto_325427 ?auto_325428 ) ( ON ?auto_325426 ?auto_325427 ) ( ON ?auto_325425 ?auto_325426 ) ( ON ?auto_325424 ?auto_325425 ) ( ON ?auto_325423 ?auto_325424 ) ( ON ?auto_325422 ?auto_325423 ) ( ON ?auto_325421 ?auto_325422 ) ( ON ?auto_325420 ?auto_325421 ) ( CLEAR ?auto_325418 ) ( ON ?auto_325419 ?auto_325420 ) ( CLEAR ?auto_325419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_325418 ?auto_325419 )
      ( MAKE-13PILE ?auto_325418 ?auto_325419 ?auto_325420 ?auto_325421 ?auto_325422 ?auto_325423 ?auto_325424 ?auto_325425 ?auto_325426 ?auto_325427 ?auto_325428 ?auto_325429 ?auto_325430 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_325472 - BLOCK
      ?auto_325473 - BLOCK
      ?auto_325474 - BLOCK
      ?auto_325475 - BLOCK
      ?auto_325476 - BLOCK
      ?auto_325477 - BLOCK
      ?auto_325478 - BLOCK
      ?auto_325479 - BLOCK
      ?auto_325480 - BLOCK
      ?auto_325481 - BLOCK
      ?auto_325482 - BLOCK
      ?auto_325483 - BLOCK
      ?auto_325484 - BLOCK
    )
    :vars
    (
      ?auto_325485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325484 ?auto_325485 ) ( not ( = ?auto_325472 ?auto_325473 ) ) ( not ( = ?auto_325472 ?auto_325474 ) ) ( not ( = ?auto_325472 ?auto_325475 ) ) ( not ( = ?auto_325472 ?auto_325476 ) ) ( not ( = ?auto_325472 ?auto_325477 ) ) ( not ( = ?auto_325472 ?auto_325478 ) ) ( not ( = ?auto_325472 ?auto_325479 ) ) ( not ( = ?auto_325472 ?auto_325480 ) ) ( not ( = ?auto_325472 ?auto_325481 ) ) ( not ( = ?auto_325472 ?auto_325482 ) ) ( not ( = ?auto_325472 ?auto_325483 ) ) ( not ( = ?auto_325472 ?auto_325484 ) ) ( not ( = ?auto_325472 ?auto_325485 ) ) ( not ( = ?auto_325473 ?auto_325474 ) ) ( not ( = ?auto_325473 ?auto_325475 ) ) ( not ( = ?auto_325473 ?auto_325476 ) ) ( not ( = ?auto_325473 ?auto_325477 ) ) ( not ( = ?auto_325473 ?auto_325478 ) ) ( not ( = ?auto_325473 ?auto_325479 ) ) ( not ( = ?auto_325473 ?auto_325480 ) ) ( not ( = ?auto_325473 ?auto_325481 ) ) ( not ( = ?auto_325473 ?auto_325482 ) ) ( not ( = ?auto_325473 ?auto_325483 ) ) ( not ( = ?auto_325473 ?auto_325484 ) ) ( not ( = ?auto_325473 ?auto_325485 ) ) ( not ( = ?auto_325474 ?auto_325475 ) ) ( not ( = ?auto_325474 ?auto_325476 ) ) ( not ( = ?auto_325474 ?auto_325477 ) ) ( not ( = ?auto_325474 ?auto_325478 ) ) ( not ( = ?auto_325474 ?auto_325479 ) ) ( not ( = ?auto_325474 ?auto_325480 ) ) ( not ( = ?auto_325474 ?auto_325481 ) ) ( not ( = ?auto_325474 ?auto_325482 ) ) ( not ( = ?auto_325474 ?auto_325483 ) ) ( not ( = ?auto_325474 ?auto_325484 ) ) ( not ( = ?auto_325474 ?auto_325485 ) ) ( not ( = ?auto_325475 ?auto_325476 ) ) ( not ( = ?auto_325475 ?auto_325477 ) ) ( not ( = ?auto_325475 ?auto_325478 ) ) ( not ( = ?auto_325475 ?auto_325479 ) ) ( not ( = ?auto_325475 ?auto_325480 ) ) ( not ( = ?auto_325475 ?auto_325481 ) ) ( not ( = ?auto_325475 ?auto_325482 ) ) ( not ( = ?auto_325475 ?auto_325483 ) ) ( not ( = ?auto_325475 ?auto_325484 ) ) ( not ( = ?auto_325475 ?auto_325485 ) ) ( not ( = ?auto_325476 ?auto_325477 ) ) ( not ( = ?auto_325476 ?auto_325478 ) ) ( not ( = ?auto_325476 ?auto_325479 ) ) ( not ( = ?auto_325476 ?auto_325480 ) ) ( not ( = ?auto_325476 ?auto_325481 ) ) ( not ( = ?auto_325476 ?auto_325482 ) ) ( not ( = ?auto_325476 ?auto_325483 ) ) ( not ( = ?auto_325476 ?auto_325484 ) ) ( not ( = ?auto_325476 ?auto_325485 ) ) ( not ( = ?auto_325477 ?auto_325478 ) ) ( not ( = ?auto_325477 ?auto_325479 ) ) ( not ( = ?auto_325477 ?auto_325480 ) ) ( not ( = ?auto_325477 ?auto_325481 ) ) ( not ( = ?auto_325477 ?auto_325482 ) ) ( not ( = ?auto_325477 ?auto_325483 ) ) ( not ( = ?auto_325477 ?auto_325484 ) ) ( not ( = ?auto_325477 ?auto_325485 ) ) ( not ( = ?auto_325478 ?auto_325479 ) ) ( not ( = ?auto_325478 ?auto_325480 ) ) ( not ( = ?auto_325478 ?auto_325481 ) ) ( not ( = ?auto_325478 ?auto_325482 ) ) ( not ( = ?auto_325478 ?auto_325483 ) ) ( not ( = ?auto_325478 ?auto_325484 ) ) ( not ( = ?auto_325478 ?auto_325485 ) ) ( not ( = ?auto_325479 ?auto_325480 ) ) ( not ( = ?auto_325479 ?auto_325481 ) ) ( not ( = ?auto_325479 ?auto_325482 ) ) ( not ( = ?auto_325479 ?auto_325483 ) ) ( not ( = ?auto_325479 ?auto_325484 ) ) ( not ( = ?auto_325479 ?auto_325485 ) ) ( not ( = ?auto_325480 ?auto_325481 ) ) ( not ( = ?auto_325480 ?auto_325482 ) ) ( not ( = ?auto_325480 ?auto_325483 ) ) ( not ( = ?auto_325480 ?auto_325484 ) ) ( not ( = ?auto_325480 ?auto_325485 ) ) ( not ( = ?auto_325481 ?auto_325482 ) ) ( not ( = ?auto_325481 ?auto_325483 ) ) ( not ( = ?auto_325481 ?auto_325484 ) ) ( not ( = ?auto_325481 ?auto_325485 ) ) ( not ( = ?auto_325482 ?auto_325483 ) ) ( not ( = ?auto_325482 ?auto_325484 ) ) ( not ( = ?auto_325482 ?auto_325485 ) ) ( not ( = ?auto_325483 ?auto_325484 ) ) ( not ( = ?auto_325483 ?auto_325485 ) ) ( not ( = ?auto_325484 ?auto_325485 ) ) ( ON ?auto_325483 ?auto_325484 ) ( ON ?auto_325482 ?auto_325483 ) ( ON ?auto_325481 ?auto_325482 ) ( ON ?auto_325480 ?auto_325481 ) ( ON ?auto_325479 ?auto_325480 ) ( ON ?auto_325478 ?auto_325479 ) ( ON ?auto_325477 ?auto_325478 ) ( ON ?auto_325476 ?auto_325477 ) ( ON ?auto_325475 ?auto_325476 ) ( ON ?auto_325474 ?auto_325475 ) ( ON ?auto_325473 ?auto_325474 ) ( ON ?auto_325472 ?auto_325473 ) ( CLEAR ?auto_325472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_325472 )
      ( MAKE-13PILE ?auto_325472 ?auto_325473 ?auto_325474 ?auto_325475 ?auto_325476 ?auto_325477 ?auto_325478 ?auto_325479 ?auto_325480 ?auto_325481 ?auto_325482 ?auto_325483 ?auto_325484 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325527 - BLOCK
      ?auto_325528 - BLOCK
      ?auto_325529 - BLOCK
      ?auto_325530 - BLOCK
      ?auto_325531 - BLOCK
      ?auto_325532 - BLOCK
      ?auto_325533 - BLOCK
      ?auto_325534 - BLOCK
      ?auto_325535 - BLOCK
      ?auto_325536 - BLOCK
      ?auto_325537 - BLOCK
      ?auto_325538 - BLOCK
      ?auto_325539 - BLOCK
      ?auto_325540 - BLOCK
    )
    :vars
    (
      ?auto_325541 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_325539 ) ( ON ?auto_325540 ?auto_325541 ) ( CLEAR ?auto_325540 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_325527 ) ( ON ?auto_325528 ?auto_325527 ) ( ON ?auto_325529 ?auto_325528 ) ( ON ?auto_325530 ?auto_325529 ) ( ON ?auto_325531 ?auto_325530 ) ( ON ?auto_325532 ?auto_325531 ) ( ON ?auto_325533 ?auto_325532 ) ( ON ?auto_325534 ?auto_325533 ) ( ON ?auto_325535 ?auto_325534 ) ( ON ?auto_325536 ?auto_325535 ) ( ON ?auto_325537 ?auto_325536 ) ( ON ?auto_325538 ?auto_325537 ) ( ON ?auto_325539 ?auto_325538 ) ( not ( = ?auto_325527 ?auto_325528 ) ) ( not ( = ?auto_325527 ?auto_325529 ) ) ( not ( = ?auto_325527 ?auto_325530 ) ) ( not ( = ?auto_325527 ?auto_325531 ) ) ( not ( = ?auto_325527 ?auto_325532 ) ) ( not ( = ?auto_325527 ?auto_325533 ) ) ( not ( = ?auto_325527 ?auto_325534 ) ) ( not ( = ?auto_325527 ?auto_325535 ) ) ( not ( = ?auto_325527 ?auto_325536 ) ) ( not ( = ?auto_325527 ?auto_325537 ) ) ( not ( = ?auto_325527 ?auto_325538 ) ) ( not ( = ?auto_325527 ?auto_325539 ) ) ( not ( = ?auto_325527 ?auto_325540 ) ) ( not ( = ?auto_325527 ?auto_325541 ) ) ( not ( = ?auto_325528 ?auto_325529 ) ) ( not ( = ?auto_325528 ?auto_325530 ) ) ( not ( = ?auto_325528 ?auto_325531 ) ) ( not ( = ?auto_325528 ?auto_325532 ) ) ( not ( = ?auto_325528 ?auto_325533 ) ) ( not ( = ?auto_325528 ?auto_325534 ) ) ( not ( = ?auto_325528 ?auto_325535 ) ) ( not ( = ?auto_325528 ?auto_325536 ) ) ( not ( = ?auto_325528 ?auto_325537 ) ) ( not ( = ?auto_325528 ?auto_325538 ) ) ( not ( = ?auto_325528 ?auto_325539 ) ) ( not ( = ?auto_325528 ?auto_325540 ) ) ( not ( = ?auto_325528 ?auto_325541 ) ) ( not ( = ?auto_325529 ?auto_325530 ) ) ( not ( = ?auto_325529 ?auto_325531 ) ) ( not ( = ?auto_325529 ?auto_325532 ) ) ( not ( = ?auto_325529 ?auto_325533 ) ) ( not ( = ?auto_325529 ?auto_325534 ) ) ( not ( = ?auto_325529 ?auto_325535 ) ) ( not ( = ?auto_325529 ?auto_325536 ) ) ( not ( = ?auto_325529 ?auto_325537 ) ) ( not ( = ?auto_325529 ?auto_325538 ) ) ( not ( = ?auto_325529 ?auto_325539 ) ) ( not ( = ?auto_325529 ?auto_325540 ) ) ( not ( = ?auto_325529 ?auto_325541 ) ) ( not ( = ?auto_325530 ?auto_325531 ) ) ( not ( = ?auto_325530 ?auto_325532 ) ) ( not ( = ?auto_325530 ?auto_325533 ) ) ( not ( = ?auto_325530 ?auto_325534 ) ) ( not ( = ?auto_325530 ?auto_325535 ) ) ( not ( = ?auto_325530 ?auto_325536 ) ) ( not ( = ?auto_325530 ?auto_325537 ) ) ( not ( = ?auto_325530 ?auto_325538 ) ) ( not ( = ?auto_325530 ?auto_325539 ) ) ( not ( = ?auto_325530 ?auto_325540 ) ) ( not ( = ?auto_325530 ?auto_325541 ) ) ( not ( = ?auto_325531 ?auto_325532 ) ) ( not ( = ?auto_325531 ?auto_325533 ) ) ( not ( = ?auto_325531 ?auto_325534 ) ) ( not ( = ?auto_325531 ?auto_325535 ) ) ( not ( = ?auto_325531 ?auto_325536 ) ) ( not ( = ?auto_325531 ?auto_325537 ) ) ( not ( = ?auto_325531 ?auto_325538 ) ) ( not ( = ?auto_325531 ?auto_325539 ) ) ( not ( = ?auto_325531 ?auto_325540 ) ) ( not ( = ?auto_325531 ?auto_325541 ) ) ( not ( = ?auto_325532 ?auto_325533 ) ) ( not ( = ?auto_325532 ?auto_325534 ) ) ( not ( = ?auto_325532 ?auto_325535 ) ) ( not ( = ?auto_325532 ?auto_325536 ) ) ( not ( = ?auto_325532 ?auto_325537 ) ) ( not ( = ?auto_325532 ?auto_325538 ) ) ( not ( = ?auto_325532 ?auto_325539 ) ) ( not ( = ?auto_325532 ?auto_325540 ) ) ( not ( = ?auto_325532 ?auto_325541 ) ) ( not ( = ?auto_325533 ?auto_325534 ) ) ( not ( = ?auto_325533 ?auto_325535 ) ) ( not ( = ?auto_325533 ?auto_325536 ) ) ( not ( = ?auto_325533 ?auto_325537 ) ) ( not ( = ?auto_325533 ?auto_325538 ) ) ( not ( = ?auto_325533 ?auto_325539 ) ) ( not ( = ?auto_325533 ?auto_325540 ) ) ( not ( = ?auto_325533 ?auto_325541 ) ) ( not ( = ?auto_325534 ?auto_325535 ) ) ( not ( = ?auto_325534 ?auto_325536 ) ) ( not ( = ?auto_325534 ?auto_325537 ) ) ( not ( = ?auto_325534 ?auto_325538 ) ) ( not ( = ?auto_325534 ?auto_325539 ) ) ( not ( = ?auto_325534 ?auto_325540 ) ) ( not ( = ?auto_325534 ?auto_325541 ) ) ( not ( = ?auto_325535 ?auto_325536 ) ) ( not ( = ?auto_325535 ?auto_325537 ) ) ( not ( = ?auto_325535 ?auto_325538 ) ) ( not ( = ?auto_325535 ?auto_325539 ) ) ( not ( = ?auto_325535 ?auto_325540 ) ) ( not ( = ?auto_325535 ?auto_325541 ) ) ( not ( = ?auto_325536 ?auto_325537 ) ) ( not ( = ?auto_325536 ?auto_325538 ) ) ( not ( = ?auto_325536 ?auto_325539 ) ) ( not ( = ?auto_325536 ?auto_325540 ) ) ( not ( = ?auto_325536 ?auto_325541 ) ) ( not ( = ?auto_325537 ?auto_325538 ) ) ( not ( = ?auto_325537 ?auto_325539 ) ) ( not ( = ?auto_325537 ?auto_325540 ) ) ( not ( = ?auto_325537 ?auto_325541 ) ) ( not ( = ?auto_325538 ?auto_325539 ) ) ( not ( = ?auto_325538 ?auto_325540 ) ) ( not ( = ?auto_325538 ?auto_325541 ) ) ( not ( = ?auto_325539 ?auto_325540 ) ) ( not ( = ?auto_325539 ?auto_325541 ) ) ( not ( = ?auto_325540 ?auto_325541 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_325540 ?auto_325541 )
      ( !STACK ?auto_325540 ?auto_325539 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325556 - BLOCK
      ?auto_325557 - BLOCK
      ?auto_325558 - BLOCK
      ?auto_325559 - BLOCK
      ?auto_325560 - BLOCK
      ?auto_325561 - BLOCK
      ?auto_325562 - BLOCK
      ?auto_325563 - BLOCK
      ?auto_325564 - BLOCK
      ?auto_325565 - BLOCK
      ?auto_325566 - BLOCK
      ?auto_325567 - BLOCK
      ?auto_325568 - BLOCK
      ?auto_325569 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_325568 ) ( ON-TABLE ?auto_325569 ) ( CLEAR ?auto_325569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_325556 ) ( ON ?auto_325557 ?auto_325556 ) ( ON ?auto_325558 ?auto_325557 ) ( ON ?auto_325559 ?auto_325558 ) ( ON ?auto_325560 ?auto_325559 ) ( ON ?auto_325561 ?auto_325560 ) ( ON ?auto_325562 ?auto_325561 ) ( ON ?auto_325563 ?auto_325562 ) ( ON ?auto_325564 ?auto_325563 ) ( ON ?auto_325565 ?auto_325564 ) ( ON ?auto_325566 ?auto_325565 ) ( ON ?auto_325567 ?auto_325566 ) ( ON ?auto_325568 ?auto_325567 ) ( not ( = ?auto_325556 ?auto_325557 ) ) ( not ( = ?auto_325556 ?auto_325558 ) ) ( not ( = ?auto_325556 ?auto_325559 ) ) ( not ( = ?auto_325556 ?auto_325560 ) ) ( not ( = ?auto_325556 ?auto_325561 ) ) ( not ( = ?auto_325556 ?auto_325562 ) ) ( not ( = ?auto_325556 ?auto_325563 ) ) ( not ( = ?auto_325556 ?auto_325564 ) ) ( not ( = ?auto_325556 ?auto_325565 ) ) ( not ( = ?auto_325556 ?auto_325566 ) ) ( not ( = ?auto_325556 ?auto_325567 ) ) ( not ( = ?auto_325556 ?auto_325568 ) ) ( not ( = ?auto_325556 ?auto_325569 ) ) ( not ( = ?auto_325557 ?auto_325558 ) ) ( not ( = ?auto_325557 ?auto_325559 ) ) ( not ( = ?auto_325557 ?auto_325560 ) ) ( not ( = ?auto_325557 ?auto_325561 ) ) ( not ( = ?auto_325557 ?auto_325562 ) ) ( not ( = ?auto_325557 ?auto_325563 ) ) ( not ( = ?auto_325557 ?auto_325564 ) ) ( not ( = ?auto_325557 ?auto_325565 ) ) ( not ( = ?auto_325557 ?auto_325566 ) ) ( not ( = ?auto_325557 ?auto_325567 ) ) ( not ( = ?auto_325557 ?auto_325568 ) ) ( not ( = ?auto_325557 ?auto_325569 ) ) ( not ( = ?auto_325558 ?auto_325559 ) ) ( not ( = ?auto_325558 ?auto_325560 ) ) ( not ( = ?auto_325558 ?auto_325561 ) ) ( not ( = ?auto_325558 ?auto_325562 ) ) ( not ( = ?auto_325558 ?auto_325563 ) ) ( not ( = ?auto_325558 ?auto_325564 ) ) ( not ( = ?auto_325558 ?auto_325565 ) ) ( not ( = ?auto_325558 ?auto_325566 ) ) ( not ( = ?auto_325558 ?auto_325567 ) ) ( not ( = ?auto_325558 ?auto_325568 ) ) ( not ( = ?auto_325558 ?auto_325569 ) ) ( not ( = ?auto_325559 ?auto_325560 ) ) ( not ( = ?auto_325559 ?auto_325561 ) ) ( not ( = ?auto_325559 ?auto_325562 ) ) ( not ( = ?auto_325559 ?auto_325563 ) ) ( not ( = ?auto_325559 ?auto_325564 ) ) ( not ( = ?auto_325559 ?auto_325565 ) ) ( not ( = ?auto_325559 ?auto_325566 ) ) ( not ( = ?auto_325559 ?auto_325567 ) ) ( not ( = ?auto_325559 ?auto_325568 ) ) ( not ( = ?auto_325559 ?auto_325569 ) ) ( not ( = ?auto_325560 ?auto_325561 ) ) ( not ( = ?auto_325560 ?auto_325562 ) ) ( not ( = ?auto_325560 ?auto_325563 ) ) ( not ( = ?auto_325560 ?auto_325564 ) ) ( not ( = ?auto_325560 ?auto_325565 ) ) ( not ( = ?auto_325560 ?auto_325566 ) ) ( not ( = ?auto_325560 ?auto_325567 ) ) ( not ( = ?auto_325560 ?auto_325568 ) ) ( not ( = ?auto_325560 ?auto_325569 ) ) ( not ( = ?auto_325561 ?auto_325562 ) ) ( not ( = ?auto_325561 ?auto_325563 ) ) ( not ( = ?auto_325561 ?auto_325564 ) ) ( not ( = ?auto_325561 ?auto_325565 ) ) ( not ( = ?auto_325561 ?auto_325566 ) ) ( not ( = ?auto_325561 ?auto_325567 ) ) ( not ( = ?auto_325561 ?auto_325568 ) ) ( not ( = ?auto_325561 ?auto_325569 ) ) ( not ( = ?auto_325562 ?auto_325563 ) ) ( not ( = ?auto_325562 ?auto_325564 ) ) ( not ( = ?auto_325562 ?auto_325565 ) ) ( not ( = ?auto_325562 ?auto_325566 ) ) ( not ( = ?auto_325562 ?auto_325567 ) ) ( not ( = ?auto_325562 ?auto_325568 ) ) ( not ( = ?auto_325562 ?auto_325569 ) ) ( not ( = ?auto_325563 ?auto_325564 ) ) ( not ( = ?auto_325563 ?auto_325565 ) ) ( not ( = ?auto_325563 ?auto_325566 ) ) ( not ( = ?auto_325563 ?auto_325567 ) ) ( not ( = ?auto_325563 ?auto_325568 ) ) ( not ( = ?auto_325563 ?auto_325569 ) ) ( not ( = ?auto_325564 ?auto_325565 ) ) ( not ( = ?auto_325564 ?auto_325566 ) ) ( not ( = ?auto_325564 ?auto_325567 ) ) ( not ( = ?auto_325564 ?auto_325568 ) ) ( not ( = ?auto_325564 ?auto_325569 ) ) ( not ( = ?auto_325565 ?auto_325566 ) ) ( not ( = ?auto_325565 ?auto_325567 ) ) ( not ( = ?auto_325565 ?auto_325568 ) ) ( not ( = ?auto_325565 ?auto_325569 ) ) ( not ( = ?auto_325566 ?auto_325567 ) ) ( not ( = ?auto_325566 ?auto_325568 ) ) ( not ( = ?auto_325566 ?auto_325569 ) ) ( not ( = ?auto_325567 ?auto_325568 ) ) ( not ( = ?auto_325567 ?auto_325569 ) ) ( not ( = ?auto_325568 ?auto_325569 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_325569 )
      ( !STACK ?auto_325569 ?auto_325568 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325584 - BLOCK
      ?auto_325585 - BLOCK
      ?auto_325586 - BLOCK
      ?auto_325587 - BLOCK
      ?auto_325588 - BLOCK
      ?auto_325589 - BLOCK
      ?auto_325590 - BLOCK
      ?auto_325591 - BLOCK
      ?auto_325592 - BLOCK
      ?auto_325593 - BLOCK
      ?auto_325594 - BLOCK
      ?auto_325595 - BLOCK
      ?auto_325596 - BLOCK
      ?auto_325597 - BLOCK
    )
    :vars
    (
      ?auto_325598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325597 ?auto_325598 ) ( ON-TABLE ?auto_325584 ) ( ON ?auto_325585 ?auto_325584 ) ( ON ?auto_325586 ?auto_325585 ) ( ON ?auto_325587 ?auto_325586 ) ( ON ?auto_325588 ?auto_325587 ) ( ON ?auto_325589 ?auto_325588 ) ( ON ?auto_325590 ?auto_325589 ) ( ON ?auto_325591 ?auto_325590 ) ( ON ?auto_325592 ?auto_325591 ) ( ON ?auto_325593 ?auto_325592 ) ( ON ?auto_325594 ?auto_325593 ) ( ON ?auto_325595 ?auto_325594 ) ( not ( = ?auto_325584 ?auto_325585 ) ) ( not ( = ?auto_325584 ?auto_325586 ) ) ( not ( = ?auto_325584 ?auto_325587 ) ) ( not ( = ?auto_325584 ?auto_325588 ) ) ( not ( = ?auto_325584 ?auto_325589 ) ) ( not ( = ?auto_325584 ?auto_325590 ) ) ( not ( = ?auto_325584 ?auto_325591 ) ) ( not ( = ?auto_325584 ?auto_325592 ) ) ( not ( = ?auto_325584 ?auto_325593 ) ) ( not ( = ?auto_325584 ?auto_325594 ) ) ( not ( = ?auto_325584 ?auto_325595 ) ) ( not ( = ?auto_325584 ?auto_325596 ) ) ( not ( = ?auto_325584 ?auto_325597 ) ) ( not ( = ?auto_325584 ?auto_325598 ) ) ( not ( = ?auto_325585 ?auto_325586 ) ) ( not ( = ?auto_325585 ?auto_325587 ) ) ( not ( = ?auto_325585 ?auto_325588 ) ) ( not ( = ?auto_325585 ?auto_325589 ) ) ( not ( = ?auto_325585 ?auto_325590 ) ) ( not ( = ?auto_325585 ?auto_325591 ) ) ( not ( = ?auto_325585 ?auto_325592 ) ) ( not ( = ?auto_325585 ?auto_325593 ) ) ( not ( = ?auto_325585 ?auto_325594 ) ) ( not ( = ?auto_325585 ?auto_325595 ) ) ( not ( = ?auto_325585 ?auto_325596 ) ) ( not ( = ?auto_325585 ?auto_325597 ) ) ( not ( = ?auto_325585 ?auto_325598 ) ) ( not ( = ?auto_325586 ?auto_325587 ) ) ( not ( = ?auto_325586 ?auto_325588 ) ) ( not ( = ?auto_325586 ?auto_325589 ) ) ( not ( = ?auto_325586 ?auto_325590 ) ) ( not ( = ?auto_325586 ?auto_325591 ) ) ( not ( = ?auto_325586 ?auto_325592 ) ) ( not ( = ?auto_325586 ?auto_325593 ) ) ( not ( = ?auto_325586 ?auto_325594 ) ) ( not ( = ?auto_325586 ?auto_325595 ) ) ( not ( = ?auto_325586 ?auto_325596 ) ) ( not ( = ?auto_325586 ?auto_325597 ) ) ( not ( = ?auto_325586 ?auto_325598 ) ) ( not ( = ?auto_325587 ?auto_325588 ) ) ( not ( = ?auto_325587 ?auto_325589 ) ) ( not ( = ?auto_325587 ?auto_325590 ) ) ( not ( = ?auto_325587 ?auto_325591 ) ) ( not ( = ?auto_325587 ?auto_325592 ) ) ( not ( = ?auto_325587 ?auto_325593 ) ) ( not ( = ?auto_325587 ?auto_325594 ) ) ( not ( = ?auto_325587 ?auto_325595 ) ) ( not ( = ?auto_325587 ?auto_325596 ) ) ( not ( = ?auto_325587 ?auto_325597 ) ) ( not ( = ?auto_325587 ?auto_325598 ) ) ( not ( = ?auto_325588 ?auto_325589 ) ) ( not ( = ?auto_325588 ?auto_325590 ) ) ( not ( = ?auto_325588 ?auto_325591 ) ) ( not ( = ?auto_325588 ?auto_325592 ) ) ( not ( = ?auto_325588 ?auto_325593 ) ) ( not ( = ?auto_325588 ?auto_325594 ) ) ( not ( = ?auto_325588 ?auto_325595 ) ) ( not ( = ?auto_325588 ?auto_325596 ) ) ( not ( = ?auto_325588 ?auto_325597 ) ) ( not ( = ?auto_325588 ?auto_325598 ) ) ( not ( = ?auto_325589 ?auto_325590 ) ) ( not ( = ?auto_325589 ?auto_325591 ) ) ( not ( = ?auto_325589 ?auto_325592 ) ) ( not ( = ?auto_325589 ?auto_325593 ) ) ( not ( = ?auto_325589 ?auto_325594 ) ) ( not ( = ?auto_325589 ?auto_325595 ) ) ( not ( = ?auto_325589 ?auto_325596 ) ) ( not ( = ?auto_325589 ?auto_325597 ) ) ( not ( = ?auto_325589 ?auto_325598 ) ) ( not ( = ?auto_325590 ?auto_325591 ) ) ( not ( = ?auto_325590 ?auto_325592 ) ) ( not ( = ?auto_325590 ?auto_325593 ) ) ( not ( = ?auto_325590 ?auto_325594 ) ) ( not ( = ?auto_325590 ?auto_325595 ) ) ( not ( = ?auto_325590 ?auto_325596 ) ) ( not ( = ?auto_325590 ?auto_325597 ) ) ( not ( = ?auto_325590 ?auto_325598 ) ) ( not ( = ?auto_325591 ?auto_325592 ) ) ( not ( = ?auto_325591 ?auto_325593 ) ) ( not ( = ?auto_325591 ?auto_325594 ) ) ( not ( = ?auto_325591 ?auto_325595 ) ) ( not ( = ?auto_325591 ?auto_325596 ) ) ( not ( = ?auto_325591 ?auto_325597 ) ) ( not ( = ?auto_325591 ?auto_325598 ) ) ( not ( = ?auto_325592 ?auto_325593 ) ) ( not ( = ?auto_325592 ?auto_325594 ) ) ( not ( = ?auto_325592 ?auto_325595 ) ) ( not ( = ?auto_325592 ?auto_325596 ) ) ( not ( = ?auto_325592 ?auto_325597 ) ) ( not ( = ?auto_325592 ?auto_325598 ) ) ( not ( = ?auto_325593 ?auto_325594 ) ) ( not ( = ?auto_325593 ?auto_325595 ) ) ( not ( = ?auto_325593 ?auto_325596 ) ) ( not ( = ?auto_325593 ?auto_325597 ) ) ( not ( = ?auto_325593 ?auto_325598 ) ) ( not ( = ?auto_325594 ?auto_325595 ) ) ( not ( = ?auto_325594 ?auto_325596 ) ) ( not ( = ?auto_325594 ?auto_325597 ) ) ( not ( = ?auto_325594 ?auto_325598 ) ) ( not ( = ?auto_325595 ?auto_325596 ) ) ( not ( = ?auto_325595 ?auto_325597 ) ) ( not ( = ?auto_325595 ?auto_325598 ) ) ( not ( = ?auto_325596 ?auto_325597 ) ) ( not ( = ?auto_325596 ?auto_325598 ) ) ( not ( = ?auto_325597 ?auto_325598 ) ) ( CLEAR ?auto_325595 ) ( ON ?auto_325596 ?auto_325597 ) ( CLEAR ?auto_325596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_325584 ?auto_325585 ?auto_325586 ?auto_325587 ?auto_325588 ?auto_325589 ?auto_325590 ?auto_325591 ?auto_325592 ?auto_325593 ?auto_325594 ?auto_325595 ?auto_325596 )
      ( MAKE-14PILE ?auto_325584 ?auto_325585 ?auto_325586 ?auto_325587 ?auto_325588 ?auto_325589 ?auto_325590 ?auto_325591 ?auto_325592 ?auto_325593 ?auto_325594 ?auto_325595 ?auto_325596 ?auto_325597 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325613 - BLOCK
      ?auto_325614 - BLOCK
      ?auto_325615 - BLOCK
      ?auto_325616 - BLOCK
      ?auto_325617 - BLOCK
      ?auto_325618 - BLOCK
      ?auto_325619 - BLOCK
      ?auto_325620 - BLOCK
      ?auto_325621 - BLOCK
      ?auto_325622 - BLOCK
      ?auto_325623 - BLOCK
      ?auto_325624 - BLOCK
      ?auto_325625 - BLOCK
      ?auto_325626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_325626 ) ( ON-TABLE ?auto_325613 ) ( ON ?auto_325614 ?auto_325613 ) ( ON ?auto_325615 ?auto_325614 ) ( ON ?auto_325616 ?auto_325615 ) ( ON ?auto_325617 ?auto_325616 ) ( ON ?auto_325618 ?auto_325617 ) ( ON ?auto_325619 ?auto_325618 ) ( ON ?auto_325620 ?auto_325619 ) ( ON ?auto_325621 ?auto_325620 ) ( ON ?auto_325622 ?auto_325621 ) ( ON ?auto_325623 ?auto_325622 ) ( ON ?auto_325624 ?auto_325623 ) ( not ( = ?auto_325613 ?auto_325614 ) ) ( not ( = ?auto_325613 ?auto_325615 ) ) ( not ( = ?auto_325613 ?auto_325616 ) ) ( not ( = ?auto_325613 ?auto_325617 ) ) ( not ( = ?auto_325613 ?auto_325618 ) ) ( not ( = ?auto_325613 ?auto_325619 ) ) ( not ( = ?auto_325613 ?auto_325620 ) ) ( not ( = ?auto_325613 ?auto_325621 ) ) ( not ( = ?auto_325613 ?auto_325622 ) ) ( not ( = ?auto_325613 ?auto_325623 ) ) ( not ( = ?auto_325613 ?auto_325624 ) ) ( not ( = ?auto_325613 ?auto_325625 ) ) ( not ( = ?auto_325613 ?auto_325626 ) ) ( not ( = ?auto_325614 ?auto_325615 ) ) ( not ( = ?auto_325614 ?auto_325616 ) ) ( not ( = ?auto_325614 ?auto_325617 ) ) ( not ( = ?auto_325614 ?auto_325618 ) ) ( not ( = ?auto_325614 ?auto_325619 ) ) ( not ( = ?auto_325614 ?auto_325620 ) ) ( not ( = ?auto_325614 ?auto_325621 ) ) ( not ( = ?auto_325614 ?auto_325622 ) ) ( not ( = ?auto_325614 ?auto_325623 ) ) ( not ( = ?auto_325614 ?auto_325624 ) ) ( not ( = ?auto_325614 ?auto_325625 ) ) ( not ( = ?auto_325614 ?auto_325626 ) ) ( not ( = ?auto_325615 ?auto_325616 ) ) ( not ( = ?auto_325615 ?auto_325617 ) ) ( not ( = ?auto_325615 ?auto_325618 ) ) ( not ( = ?auto_325615 ?auto_325619 ) ) ( not ( = ?auto_325615 ?auto_325620 ) ) ( not ( = ?auto_325615 ?auto_325621 ) ) ( not ( = ?auto_325615 ?auto_325622 ) ) ( not ( = ?auto_325615 ?auto_325623 ) ) ( not ( = ?auto_325615 ?auto_325624 ) ) ( not ( = ?auto_325615 ?auto_325625 ) ) ( not ( = ?auto_325615 ?auto_325626 ) ) ( not ( = ?auto_325616 ?auto_325617 ) ) ( not ( = ?auto_325616 ?auto_325618 ) ) ( not ( = ?auto_325616 ?auto_325619 ) ) ( not ( = ?auto_325616 ?auto_325620 ) ) ( not ( = ?auto_325616 ?auto_325621 ) ) ( not ( = ?auto_325616 ?auto_325622 ) ) ( not ( = ?auto_325616 ?auto_325623 ) ) ( not ( = ?auto_325616 ?auto_325624 ) ) ( not ( = ?auto_325616 ?auto_325625 ) ) ( not ( = ?auto_325616 ?auto_325626 ) ) ( not ( = ?auto_325617 ?auto_325618 ) ) ( not ( = ?auto_325617 ?auto_325619 ) ) ( not ( = ?auto_325617 ?auto_325620 ) ) ( not ( = ?auto_325617 ?auto_325621 ) ) ( not ( = ?auto_325617 ?auto_325622 ) ) ( not ( = ?auto_325617 ?auto_325623 ) ) ( not ( = ?auto_325617 ?auto_325624 ) ) ( not ( = ?auto_325617 ?auto_325625 ) ) ( not ( = ?auto_325617 ?auto_325626 ) ) ( not ( = ?auto_325618 ?auto_325619 ) ) ( not ( = ?auto_325618 ?auto_325620 ) ) ( not ( = ?auto_325618 ?auto_325621 ) ) ( not ( = ?auto_325618 ?auto_325622 ) ) ( not ( = ?auto_325618 ?auto_325623 ) ) ( not ( = ?auto_325618 ?auto_325624 ) ) ( not ( = ?auto_325618 ?auto_325625 ) ) ( not ( = ?auto_325618 ?auto_325626 ) ) ( not ( = ?auto_325619 ?auto_325620 ) ) ( not ( = ?auto_325619 ?auto_325621 ) ) ( not ( = ?auto_325619 ?auto_325622 ) ) ( not ( = ?auto_325619 ?auto_325623 ) ) ( not ( = ?auto_325619 ?auto_325624 ) ) ( not ( = ?auto_325619 ?auto_325625 ) ) ( not ( = ?auto_325619 ?auto_325626 ) ) ( not ( = ?auto_325620 ?auto_325621 ) ) ( not ( = ?auto_325620 ?auto_325622 ) ) ( not ( = ?auto_325620 ?auto_325623 ) ) ( not ( = ?auto_325620 ?auto_325624 ) ) ( not ( = ?auto_325620 ?auto_325625 ) ) ( not ( = ?auto_325620 ?auto_325626 ) ) ( not ( = ?auto_325621 ?auto_325622 ) ) ( not ( = ?auto_325621 ?auto_325623 ) ) ( not ( = ?auto_325621 ?auto_325624 ) ) ( not ( = ?auto_325621 ?auto_325625 ) ) ( not ( = ?auto_325621 ?auto_325626 ) ) ( not ( = ?auto_325622 ?auto_325623 ) ) ( not ( = ?auto_325622 ?auto_325624 ) ) ( not ( = ?auto_325622 ?auto_325625 ) ) ( not ( = ?auto_325622 ?auto_325626 ) ) ( not ( = ?auto_325623 ?auto_325624 ) ) ( not ( = ?auto_325623 ?auto_325625 ) ) ( not ( = ?auto_325623 ?auto_325626 ) ) ( not ( = ?auto_325624 ?auto_325625 ) ) ( not ( = ?auto_325624 ?auto_325626 ) ) ( not ( = ?auto_325625 ?auto_325626 ) ) ( CLEAR ?auto_325624 ) ( ON ?auto_325625 ?auto_325626 ) ( CLEAR ?auto_325625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_325613 ?auto_325614 ?auto_325615 ?auto_325616 ?auto_325617 ?auto_325618 ?auto_325619 ?auto_325620 ?auto_325621 ?auto_325622 ?auto_325623 ?auto_325624 ?auto_325625 )
      ( MAKE-14PILE ?auto_325613 ?auto_325614 ?auto_325615 ?auto_325616 ?auto_325617 ?auto_325618 ?auto_325619 ?auto_325620 ?auto_325621 ?auto_325622 ?auto_325623 ?auto_325624 ?auto_325625 ?auto_325626 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325641 - BLOCK
      ?auto_325642 - BLOCK
      ?auto_325643 - BLOCK
      ?auto_325644 - BLOCK
      ?auto_325645 - BLOCK
      ?auto_325646 - BLOCK
      ?auto_325647 - BLOCK
      ?auto_325648 - BLOCK
      ?auto_325649 - BLOCK
      ?auto_325650 - BLOCK
      ?auto_325651 - BLOCK
      ?auto_325652 - BLOCK
      ?auto_325653 - BLOCK
      ?auto_325654 - BLOCK
    )
    :vars
    (
      ?auto_325655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325654 ?auto_325655 ) ( ON-TABLE ?auto_325641 ) ( ON ?auto_325642 ?auto_325641 ) ( ON ?auto_325643 ?auto_325642 ) ( ON ?auto_325644 ?auto_325643 ) ( ON ?auto_325645 ?auto_325644 ) ( ON ?auto_325646 ?auto_325645 ) ( ON ?auto_325647 ?auto_325646 ) ( ON ?auto_325648 ?auto_325647 ) ( ON ?auto_325649 ?auto_325648 ) ( ON ?auto_325650 ?auto_325649 ) ( ON ?auto_325651 ?auto_325650 ) ( not ( = ?auto_325641 ?auto_325642 ) ) ( not ( = ?auto_325641 ?auto_325643 ) ) ( not ( = ?auto_325641 ?auto_325644 ) ) ( not ( = ?auto_325641 ?auto_325645 ) ) ( not ( = ?auto_325641 ?auto_325646 ) ) ( not ( = ?auto_325641 ?auto_325647 ) ) ( not ( = ?auto_325641 ?auto_325648 ) ) ( not ( = ?auto_325641 ?auto_325649 ) ) ( not ( = ?auto_325641 ?auto_325650 ) ) ( not ( = ?auto_325641 ?auto_325651 ) ) ( not ( = ?auto_325641 ?auto_325652 ) ) ( not ( = ?auto_325641 ?auto_325653 ) ) ( not ( = ?auto_325641 ?auto_325654 ) ) ( not ( = ?auto_325641 ?auto_325655 ) ) ( not ( = ?auto_325642 ?auto_325643 ) ) ( not ( = ?auto_325642 ?auto_325644 ) ) ( not ( = ?auto_325642 ?auto_325645 ) ) ( not ( = ?auto_325642 ?auto_325646 ) ) ( not ( = ?auto_325642 ?auto_325647 ) ) ( not ( = ?auto_325642 ?auto_325648 ) ) ( not ( = ?auto_325642 ?auto_325649 ) ) ( not ( = ?auto_325642 ?auto_325650 ) ) ( not ( = ?auto_325642 ?auto_325651 ) ) ( not ( = ?auto_325642 ?auto_325652 ) ) ( not ( = ?auto_325642 ?auto_325653 ) ) ( not ( = ?auto_325642 ?auto_325654 ) ) ( not ( = ?auto_325642 ?auto_325655 ) ) ( not ( = ?auto_325643 ?auto_325644 ) ) ( not ( = ?auto_325643 ?auto_325645 ) ) ( not ( = ?auto_325643 ?auto_325646 ) ) ( not ( = ?auto_325643 ?auto_325647 ) ) ( not ( = ?auto_325643 ?auto_325648 ) ) ( not ( = ?auto_325643 ?auto_325649 ) ) ( not ( = ?auto_325643 ?auto_325650 ) ) ( not ( = ?auto_325643 ?auto_325651 ) ) ( not ( = ?auto_325643 ?auto_325652 ) ) ( not ( = ?auto_325643 ?auto_325653 ) ) ( not ( = ?auto_325643 ?auto_325654 ) ) ( not ( = ?auto_325643 ?auto_325655 ) ) ( not ( = ?auto_325644 ?auto_325645 ) ) ( not ( = ?auto_325644 ?auto_325646 ) ) ( not ( = ?auto_325644 ?auto_325647 ) ) ( not ( = ?auto_325644 ?auto_325648 ) ) ( not ( = ?auto_325644 ?auto_325649 ) ) ( not ( = ?auto_325644 ?auto_325650 ) ) ( not ( = ?auto_325644 ?auto_325651 ) ) ( not ( = ?auto_325644 ?auto_325652 ) ) ( not ( = ?auto_325644 ?auto_325653 ) ) ( not ( = ?auto_325644 ?auto_325654 ) ) ( not ( = ?auto_325644 ?auto_325655 ) ) ( not ( = ?auto_325645 ?auto_325646 ) ) ( not ( = ?auto_325645 ?auto_325647 ) ) ( not ( = ?auto_325645 ?auto_325648 ) ) ( not ( = ?auto_325645 ?auto_325649 ) ) ( not ( = ?auto_325645 ?auto_325650 ) ) ( not ( = ?auto_325645 ?auto_325651 ) ) ( not ( = ?auto_325645 ?auto_325652 ) ) ( not ( = ?auto_325645 ?auto_325653 ) ) ( not ( = ?auto_325645 ?auto_325654 ) ) ( not ( = ?auto_325645 ?auto_325655 ) ) ( not ( = ?auto_325646 ?auto_325647 ) ) ( not ( = ?auto_325646 ?auto_325648 ) ) ( not ( = ?auto_325646 ?auto_325649 ) ) ( not ( = ?auto_325646 ?auto_325650 ) ) ( not ( = ?auto_325646 ?auto_325651 ) ) ( not ( = ?auto_325646 ?auto_325652 ) ) ( not ( = ?auto_325646 ?auto_325653 ) ) ( not ( = ?auto_325646 ?auto_325654 ) ) ( not ( = ?auto_325646 ?auto_325655 ) ) ( not ( = ?auto_325647 ?auto_325648 ) ) ( not ( = ?auto_325647 ?auto_325649 ) ) ( not ( = ?auto_325647 ?auto_325650 ) ) ( not ( = ?auto_325647 ?auto_325651 ) ) ( not ( = ?auto_325647 ?auto_325652 ) ) ( not ( = ?auto_325647 ?auto_325653 ) ) ( not ( = ?auto_325647 ?auto_325654 ) ) ( not ( = ?auto_325647 ?auto_325655 ) ) ( not ( = ?auto_325648 ?auto_325649 ) ) ( not ( = ?auto_325648 ?auto_325650 ) ) ( not ( = ?auto_325648 ?auto_325651 ) ) ( not ( = ?auto_325648 ?auto_325652 ) ) ( not ( = ?auto_325648 ?auto_325653 ) ) ( not ( = ?auto_325648 ?auto_325654 ) ) ( not ( = ?auto_325648 ?auto_325655 ) ) ( not ( = ?auto_325649 ?auto_325650 ) ) ( not ( = ?auto_325649 ?auto_325651 ) ) ( not ( = ?auto_325649 ?auto_325652 ) ) ( not ( = ?auto_325649 ?auto_325653 ) ) ( not ( = ?auto_325649 ?auto_325654 ) ) ( not ( = ?auto_325649 ?auto_325655 ) ) ( not ( = ?auto_325650 ?auto_325651 ) ) ( not ( = ?auto_325650 ?auto_325652 ) ) ( not ( = ?auto_325650 ?auto_325653 ) ) ( not ( = ?auto_325650 ?auto_325654 ) ) ( not ( = ?auto_325650 ?auto_325655 ) ) ( not ( = ?auto_325651 ?auto_325652 ) ) ( not ( = ?auto_325651 ?auto_325653 ) ) ( not ( = ?auto_325651 ?auto_325654 ) ) ( not ( = ?auto_325651 ?auto_325655 ) ) ( not ( = ?auto_325652 ?auto_325653 ) ) ( not ( = ?auto_325652 ?auto_325654 ) ) ( not ( = ?auto_325652 ?auto_325655 ) ) ( not ( = ?auto_325653 ?auto_325654 ) ) ( not ( = ?auto_325653 ?auto_325655 ) ) ( not ( = ?auto_325654 ?auto_325655 ) ) ( ON ?auto_325653 ?auto_325654 ) ( CLEAR ?auto_325651 ) ( ON ?auto_325652 ?auto_325653 ) ( CLEAR ?auto_325652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_325641 ?auto_325642 ?auto_325643 ?auto_325644 ?auto_325645 ?auto_325646 ?auto_325647 ?auto_325648 ?auto_325649 ?auto_325650 ?auto_325651 ?auto_325652 )
      ( MAKE-14PILE ?auto_325641 ?auto_325642 ?auto_325643 ?auto_325644 ?auto_325645 ?auto_325646 ?auto_325647 ?auto_325648 ?auto_325649 ?auto_325650 ?auto_325651 ?auto_325652 ?auto_325653 ?auto_325654 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325670 - BLOCK
      ?auto_325671 - BLOCK
      ?auto_325672 - BLOCK
      ?auto_325673 - BLOCK
      ?auto_325674 - BLOCK
      ?auto_325675 - BLOCK
      ?auto_325676 - BLOCK
      ?auto_325677 - BLOCK
      ?auto_325678 - BLOCK
      ?auto_325679 - BLOCK
      ?auto_325680 - BLOCK
      ?auto_325681 - BLOCK
      ?auto_325682 - BLOCK
      ?auto_325683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_325683 ) ( ON-TABLE ?auto_325670 ) ( ON ?auto_325671 ?auto_325670 ) ( ON ?auto_325672 ?auto_325671 ) ( ON ?auto_325673 ?auto_325672 ) ( ON ?auto_325674 ?auto_325673 ) ( ON ?auto_325675 ?auto_325674 ) ( ON ?auto_325676 ?auto_325675 ) ( ON ?auto_325677 ?auto_325676 ) ( ON ?auto_325678 ?auto_325677 ) ( ON ?auto_325679 ?auto_325678 ) ( ON ?auto_325680 ?auto_325679 ) ( not ( = ?auto_325670 ?auto_325671 ) ) ( not ( = ?auto_325670 ?auto_325672 ) ) ( not ( = ?auto_325670 ?auto_325673 ) ) ( not ( = ?auto_325670 ?auto_325674 ) ) ( not ( = ?auto_325670 ?auto_325675 ) ) ( not ( = ?auto_325670 ?auto_325676 ) ) ( not ( = ?auto_325670 ?auto_325677 ) ) ( not ( = ?auto_325670 ?auto_325678 ) ) ( not ( = ?auto_325670 ?auto_325679 ) ) ( not ( = ?auto_325670 ?auto_325680 ) ) ( not ( = ?auto_325670 ?auto_325681 ) ) ( not ( = ?auto_325670 ?auto_325682 ) ) ( not ( = ?auto_325670 ?auto_325683 ) ) ( not ( = ?auto_325671 ?auto_325672 ) ) ( not ( = ?auto_325671 ?auto_325673 ) ) ( not ( = ?auto_325671 ?auto_325674 ) ) ( not ( = ?auto_325671 ?auto_325675 ) ) ( not ( = ?auto_325671 ?auto_325676 ) ) ( not ( = ?auto_325671 ?auto_325677 ) ) ( not ( = ?auto_325671 ?auto_325678 ) ) ( not ( = ?auto_325671 ?auto_325679 ) ) ( not ( = ?auto_325671 ?auto_325680 ) ) ( not ( = ?auto_325671 ?auto_325681 ) ) ( not ( = ?auto_325671 ?auto_325682 ) ) ( not ( = ?auto_325671 ?auto_325683 ) ) ( not ( = ?auto_325672 ?auto_325673 ) ) ( not ( = ?auto_325672 ?auto_325674 ) ) ( not ( = ?auto_325672 ?auto_325675 ) ) ( not ( = ?auto_325672 ?auto_325676 ) ) ( not ( = ?auto_325672 ?auto_325677 ) ) ( not ( = ?auto_325672 ?auto_325678 ) ) ( not ( = ?auto_325672 ?auto_325679 ) ) ( not ( = ?auto_325672 ?auto_325680 ) ) ( not ( = ?auto_325672 ?auto_325681 ) ) ( not ( = ?auto_325672 ?auto_325682 ) ) ( not ( = ?auto_325672 ?auto_325683 ) ) ( not ( = ?auto_325673 ?auto_325674 ) ) ( not ( = ?auto_325673 ?auto_325675 ) ) ( not ( = ?auto_325673 ?auto_325676 ) ) ( not ( = ?auto_325673 ?auto_325677 ) ) ( not ( = ?auto_325673 ?auto_325678 ) ) ( not ( = ?auto_325673 ?auto_325679 ) ) ( not ( = ?auto_325673 ?auto_325680 ) ) ( not ( = ?auto_325673 ?auto_325681 ) ) ( not ( = ?auto_325673 ?auto_325682 ) ) ( not ( = ?auto_325673 ?auto_325683 ) ) ( not ( = ?auto_325674 ?auto_325675 ) ) ( not ( = ?auto_325674 ?auto_325676 ) ) ( not ( = ?auto_325674 ?auto_325677 ) ) ( not ( = ?auto_325674 ?auto_325678 ) ) ( not ( = ?auto_325674 ?auto_325679 ) ) ( not ( = ?auto_325674 ?auto_325680 ) ) ( not ( = ?auto_325674 ?auto_325681 ) ) ( not ( = ?auto_325674 ?auto_325682 ) ) ( not ( = ?auto_325674 ?auto_325683 ) ) ( not ( = ?auto_325675 ?auto_325676 ) ) ( not ( = ?auto_325675 ?auto_325677 ) ) ( not ( = ?auto_325675 ?auto_325678 ) ) ( not ( = ?auto_325675 ?auto_325679 ) ) ( not ( = ?auto_325675 ?auto_325680 ) ) ( not ( = ?auto_325675 ?auto_325681 ) ) ( not ( = ?auto_325675 ?auto_325682 ) ) ( not ( = ?auto_325675 ?auto_325683 ) ) ( not ( = ?auto_325676 ?auto_325677 ) ) ( not ( = ?auto_325676 ?auto_325678 ) ) ( not ( = ?auto_325676 ?auto_325679 ) ) ( not ( = ?auto_325676 ?auto_325680 ) ) ( not ( = ?auto_325676 ?auto_325681 ) ) ( not ( = ?auto_325676 ?auto_325682 ) ) ( not ( = ?auto_325676 ?auto_325683 ) ) ( not ( = ?auto_325677 ?auto_325678 ) ) ( not ( = ?auto_325677 ?auto_325679 ) ) ( not ( = ?auto_325677 ?auto_325680 ) ) ( not ( = ?auto_325677 ?auto_325681 ) ) ( not ( = ?auto_325677 ?auto_325682 ) ) ( not ( = ?auto_325677 ?auto_325683 ) ) ( not ( = ?auto_325678 ?auto_325679 ) ) ( not ( = ?auto_325678 ?auto_325680 ) ) ( not ( = ?auto_325678 ?auto_325681 ) ) ( not ( = ?auto_325678 ?auto_325682 ) ) ( not ( = ?auto_325678 ?auto_325683 ) ) ( not ( = ?auto_325679 ?auto_325680 ) ) ( not ( = ?auto_325679 ?auto_325681 ) ) ( not ( = ?auto_325679 ?auto_325682 ) ) ( not ( = ?auto_325679 ?auto_325683 ) ) ( not ( = ?auto_325680 ?auto_325681 ) ) ( not ( = ?auto_325680 ?auto_325682 ) ) ( not ( = ?auto_325680 ?auto_325683 ) ) ( not ( = ?auto_325681 ?auto_325682 ) ) ( not ( = ?auto_325681 ?auto_325683 ) ) ( not ( = ?auto_325682 ?auto_325683 ) ) ( ON ?auto_325682 ?auto_325683 ) ( CLEAR ?auto_325680 ) ( ON ?auto_325681 ?auto_325682 ) ( CLEAR ?auto_325681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_325670 ?auto_325671 ?auto_325672 ?auto_325673 ?auto_325674 ?auto_325675 ?auto_325676 ?auto_325677 ?auto_325678 ?auto_325679 ?auto_325680 ?auto_325681 )
      ( MAKE-14PILE ?auto_325670 ?auto_325671 ?auto_325672 ?auto_325673 ?auto_325674 ?auto_325675 ?auto_325676 ?auto_325677 ?auto_325678 ?auto_325679 ?auto_325680 ?auto_325681 ?auto_325682 ?auto_325683 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325698 - BLOCK
      ?auto_325699 - BLOCK
      ?auto_325700 - BLOCK
      ?auto_325701 - BLOCK
      ?auto_325702 - BLOCK
      ?auto_325703 - BLOCK
      ?auto_325704 - BLOCK
      ?auto_325705 - BLOCK
      ?auto_325706 - BLOCK
      ?auto_325707 - BLOCK
      ?auto_325708 - BLOCK
      ?auto_325709 - BLOCK
      ?auto_325710 - BLOCK
      ?auto_325711 - BLOCK
    )
    :vars
    (
      ?auto_325712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325711 ?auto_325712 ) ( ON-TABLE ?auto_325698 ) ( ON ?auto_325699 ?auto_325698 ) ( ON ?auto_325700 ?auto_325699 ) ( ON ?auto_325701 ?auto_325700 ) ( ON ?auto_325702 ?auto_325701 ) ( ON ?auto_325703 ?auto_325702 ) ( ON ?auto_325704 ?auto_325703 ) ( ON ?auto_325705 ?auto_325704 ) ( ON ?auto_325706 ?auto_325705 ) ( ON ?auto_325707 ?auto_325706 ) ( not ( = ?auto_325698 ?auto_325699 ) ) ( not ( = ?auto_325698 ?auto_325700 ) ) ( not ( = ?auto_325698 ?auto_325701 ) ) ( not ( = ?auto_325698 ?auto_325702 ) ) ( not ( = ?auto_325698 ?auto_325703 ) ) ( not ( = ?auto_325698 ?auto_325704 ) ) ( not ( = ?auto_325698 ?auto_325705 ) ) ( not ( = ?auto_325698 ?auto_325706 ) ) ( not ( = ?auto_325698 ?auto_325707 ) ) ( not ( = ?auto_325698 ?auto_325708 ) ) ( not ( = ?auto_325698 ?auto_325709 ) ) ( not ( = ?auto_325698 ?auto_325710 ) ) ( not ( = ?auto_325698 ?auto_325711 ) ) ( not ( = ?auto_325698 ?auto_325712 ) ) ( not ( = ?auto_325699 ?auto_325700 ) ) ( not ( = ?auto_325699 ?auto_325701 ) ) ( not ( = ?auto_325699 ?auto_325702 ) ) ( not ( = ?auto_325699 ?auto_325703 ) ) ( not ( = ?auto_325699 ?auto_325704 ) ) ( not ( = ?auto_325699 ?auto_325705 ) ) ( not ( = ?auto_325699 ?auto_325706 ) ) ( not ( = ?auto_325699 ?auto_325707 ) ) ( not ( = ?auto_325699 ?auto_325708 ) ) ( not ( = ?auto_325699 ?auto_325709 ) ) ( not ( = ?auto_325699 ?auto_325710 ) ) ( not ( = ?auto_325699 ?auto_325711 ) ) ( not ( = ?auto_325699 ?auto_325712 ) ) ( not ( = ?auto_325700 ?auto_325701 ) ) ( not ( = ?auto_325700 ?auto_325702 ) ) ( not ( = ?auto_325700 ?auto_325703 ) ) ( not ( = ?auto_325700 ?auto_325704 ) ) ( not ( = ?auto_325700 ?auto_325705 ) ) ( not ( = ?auto_325700 ?auto_325706 ) ) ( not ( = ?auto_325700 ?auto_325707 ) ) ( not ( = ?auto_325700 ?auto_325708 ) ) ( not ( = ?auto_325700 ?auto_325709 ) ) ( not ( = ?auto_325700 ?auto_325710 ) ) ( not ( = ?auto_325700 ?auto_325711 ) ) ( not ( = ?auto_325700 ?auto_325712 ) ) ( not ( = ?auto_325701 ?auto_325702 ) ) ( not ( = ?auto_325701 ?auto_325703 ) ) ( not ( = ?auto_325701 ?auto_325704 ) ) ( not ( = ?auto_325701 ?auto_325705 ) ) ( not ( = ?auto_325701 ?auto_325706 ) ) ( not ( = ?auto_325701 ?auto_325707 ) ) ( not ( = ?auto_325701 ?auto_325708 ) ) ( not ( = ?auto_325701 ?auto_325709 ) ) ( not ( = ?auto_325701 ?auto_325710 ) ) ( not ( = ?auto_325701 ?auto_325711 ) ) ( not ( = ?auto_325701 ?auto_325712 ) ) ( not ( = ?auto_325702 ?auto_325703 ) ) ( not ( = ?auto_325702 ?auto_325704 ) ) ( not ( = ?auto_325702 ?auto_325705 ) ) ( not ( = ?auto_325702 ?auto_325706 ) ) ( not ( = ?auto_325702 ?auto_325707 ) ) ( not ( = ?auto_325702 ?auto_325708 ) ) ( not ( = ?auto_325702 ?auto_325709 ) ) ( not ( = ?auto_325702 ?auto_325710 ) ) ( not ( = ?auto_325702 ?auto_325711 ) ) ( not ( = ?auto_325702 ?auto_325712 ) ) ( not ( = ?auto_325703 ?auto_325704 ) ) ( not ( = ?auto_325703 ?auto_325705 ) ) ( not ( = ?auto_325703 ?auto_325706 ) ) ( not ( = ?auto_325703 ?auto_325707 ) ) ( not ( = ?auto_325703 ?auto_325708 ) ) ( not ( = ?auto_325703 ?auto_325709 ) ) ( not ( = ?auto_325703 ?auto_325710 ) ) ( not ( = ?auto_325703 ?auto_325711 ) ) ( not ( = ?auto_325703 ?auto_325712 ) ) ( not ( = ?auto_325704 ?auto_325705 ) ) ( not ( = ?auto_325704 ?auto_325706 ) ) ( not ( = ?auto_325704 ?auto_325707 ) ) ( not ( = ?auto_325704 ?auto_325708 ) ) ( not ( = ?auto_325704 ?auto_325709 ) ) ( not ( = ?auto_325704 ?auto_325710 ) ) ( not ( = ?auto_325704 ?auto_325711 ) ) ( not ( = ?auto_325704 ?auto_325712 ) ) ( not ( = ?auto_325705 ?auto_325706 ) ) ( not ( = ?auto_325705 ?auto_325707 ) ) ( not ( = ?auto_325705 ?auto_325708 ) ) ( not ( = ?auto_325705 ?auto_325709 ) ) ( not ( = ?auto_325705 ?auto_325710 ) ) ( not ( = ?auto_325705 ?auto_325711 ) ) ( not ( = ?auto_325705 ?auto_325712 ) ) ( not ( = ?auto_325706 ?auto_325707 ) ) ( not ( = ?auto_325706 ?auto_325708 ) ) ( not ( = ?auto_325706 ?auto_325709 ) ) ( not ( = ?auto_325706 ?auto_325710 ) ) ( not ( = ?auto_325706 ?auto_325711 ) ) ( not ( = ?auto_325706 ?auto_325712 ) ) ( not ( = ?auto_325707 ?auto_325708 ) ) ( not ( = ?auto_325707 ?auto_325709 ) ) ( not ( = ?auto_325707 ?auto_325710 ) ) ( not ( = ?auto_325707 ?auto_325711 ) ) ( not ( = ?auto_325707 ?auto_325712 ) ) ( not ( = ?auto_325708 ?auto_325709 ) ) ( not ( = ?auto_325708 ?auto_325710 ) ) ( not ( = ?auto_325708 ?auto_325711 ) ) ( not ( = ?auto_325708 ?auto_325712 ) ) ( not ( = ?auto_325709 ?auto_325710 ) ) ( not ( = ?auto_325709 ?auto_325711 ) ) ( not ( = ?auto_325709 ?auto_325712 ) ) ( not ( = ?auto_325710 ?auto_325711 ) ) ( not ( = ?auto_325710 ?auto_325712 ) ) ( not ( = ?auto_325711 ?auto_325712 ) ) ( ON ?auto_325710 ?auto_325711 ) ( ON ?auto_325709 ?auto_325710 ) ( CLEAR ?auto_325707 ) ( ON ?auto_325708 ?auto_325709 ) ( CLEAR ?auto_325708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_325698 ?auto_325699 ?auto_325700 ?auto_325701 ?auto_325702 ?auto_325703 ?auto_325704 ?auto_325705 ?auto_325706 ?auto_325707 ?auto_325708 )
      ( MAKE-14PILE ?auto_325698 ?auto_325699 ?auto_325700 ?auto_325701 ?auto_325702 ?auto_325703 ?auto_325704 ?auto_325705 ?auto_325706 ?auto_325707 ?auto_325708 ?auto_325709 ?auto_325710 ?auto_325711 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325727 - BLOCK
      ?auto_325728 - BLOCK
      ?auto_325729 - BLOCK
      ?auto_325730 - BLOCK
      ?auto_325731 - BLOCK
      ?auto_325732 - BLOCK
      ?auto_325733 - BLOCK
      ?auto_325734 - BLOCK
      ?auto_325735 - BLOCK
      ?auto_325736 - BLOCK
      ?auto_325737 - BLOCK
      ?auto_325738 - BLOCK
      ?auto_325739 - BLOCK
      ?auto_325740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_325740 ) ( ON-TABLE ?auto_325727 ) ( ON ?auto_325728 ?auto_325727 ) ( ON ?auto_325729 ?auto_325728 ) ( ON ?auto_325730 ?auto_325729 ) ( ON ?auto_325731 ?auto_325730 ) ( ON ?auto_325732 ?auto_325731 ) ( ON ?auto_325733 ?auto_325732 ) ( ON ?auto_325734 ?auto_325733 ) ( ON ?auto_325735 ?auto_325734 ) ( ON ?auto_325736 ?auto_325735 ) ( not ( = ?auto_325727 ?auto_325728 ) ) ( not ( = ?auto_325727 ?auto_325729 ) ) ( not ( = ?auto_325727 ?auto_325730 ) ) ( not ( = ?auto_325727 ?auto_325731 ) ) ( not ( = ?auto_325727 ?auto_325732 ) ) ( not ( = ?auto_325727 ?auto_325733 ) ) ( not ( = ?auto_325727 ?auto_325734 ) ) ( not ( = ?auto_325727 ?auto_325735 ) ) ( not ( = ?auto_325727 ?auto_325736 ) ) ( not ( = ?auto_325727 ?auto_325737 ) ) ( not ( = ?auto_325727 ?auto_325738 ) ) ( not ( = ?auto_325727 ?auto_325739 ) ) ( not ( = ?auto_325727 ?auto_325740 ) ) ( not ( = ?auto_325728 ?auto_325729 ) ) ( not ( = ?auto_325728 ?auto_325730 ) ) ( not ( = ?auto_325728 ?auto_325731 ) ) ( not ( = ?auto_325728 ?auto_325732 ) ) ( not ( = ?auto_325728 ?auto_325733 ) ) ( not ( = ?auto_325728 ?auto_325734 ) ) ( not ( = ?auto_325728 ?auto_325735 ) ) ( not ( = ?auto_325728 ?auto_325736 ) ) ( not ( = ?auto_325728 ?auto_325737 ) ) ( not ( = ?auto_325728 ?auto_325738 ) ) ( not ( = ?auto_325728 ?auto_325739 ) ) ( not ( = ?auto_325728 ?auto_325740 ) ) ( not ( = ?auto_325729 ?auto_325730 ) ) ( not ( = ?auto_325729 ?auto_325731 ) ) ( not ( = ?auto_325729 ?auto_325732 ) ) ( not ( = ?auto_325729 ?auto_325733 ) ) ( not ( = ?auto_325729 ?auto_325734 ) ) ( not ( = ?auto_325729 ?auto_325735 ) ) ( not ( = ?auto_325729 ?auto_325736 ) ) ( not ( = ?auto_325729 ?auto_325737 ) ) ( not ( = ?auto_325729 ?auto_325738 ) ) ( not ( = ?auto_325729 ?auto_325739 ) ) ( not ( = ?auto_325729 ?auto_325740 ) ) ( not ( = ?auto_325730 ?auto_325731 ) ) ( not ( = ?auto_325730 ?auto_325732 ) ) ( not ( = ?auto_325730 ?auto_325733 ) ) ( not ( = ?auto_325730 ?auto_325734 ) ) ( not ( = ?auto_325730 ?auto_325735 ) ) ( not ( = ?auto_325730 ?auto_325736 ) ) ( not ( = ?auto_325730 ?auto_325737 ) ) ( not ( = ?auto_325730 ?auto_325738 ) ) ( not ( = ?auto_325730 ?auto_325739 ) ) ( not ( = ?auto_325730 ?auto_325740 ) ) ( not ( = ?auto_325731 ?auto_325732 ) ) ( not ( = ?auto_325731 ?auto_325733 ) ) ( not ( = ?auto_325731 ?auto_325734 ) ) ( not ( = ?auto_325731 ?auto_325735 ) ) ( not ( = ?auto_325731 ?auto_325736 ) ) ( not ( = ?auto_325731 ?auto_325737 ) ) ( not ( = ?auto_325731 ?auto_325738 ) ) ( not ( = ?auto_325731 ?auto_325739 ) ) ( not ( = ?auto_325731 ?auto_325740 ) ) ( not ( = ?auto_325732 ?auto_325733 ) ) ( not ( = ?auto_325732 ?auto_325734 ) ) ( not ( = ?auto_325732 ?auto_325735 ) ) ( not ( = ?auto_325732 ?auto_325736 ) ) ( not ( = ?auto_325732 ?auto_325737 ) ) ( not ( = ?auto_325732 ?auto_325738 ) ) ( not ( = ?auto_325732 ?auto_325739 ) ) ( not ( = ?auto_325732 ?auto_325740 ) ) ( not ( = ?auto_325733 ?auto_325734 ) ) ( not ( = ?auto_325733 ?auto_325735 ) ) ( not ( = ?auto_325733 ?auto_325736 ) ) ( not ( = ?auto_325733 ?auto_325737 ) ) ( not ( = ?auto_325733 ?auto_325738 ) ) ( not ( = ?auto_325733 ?auto_325739 ) ) ( not ( = ?auto_325733 ?auto_325740 ) ) ( not ( = ?auto_325734 ?auto_325735 ) ) ( not ( = ?auto_325734 ?auto_325736 ) ) ( not ( = ?auto_325734 ?auto_325737 ) ) ( not ( = ?auto_325734 ?auto_325738 ) ) ( not ( = ?auto_325734 ?auto_325739 ) ) ( not ( = ?auto_325734 ?auto_325740 ) ) ( not ( = ?auto_325735 ?auto_325736 ) ) ( not ( = ?auto_325735 ?auto_325737 ) ) ( not ( = ?auto_325735 ?auto_325738 ) ) ( not ( = ?auto_325735 ?auto_325739 ) ) ( not ( = ?auto_325735 ?auto_325740 ) ) ( not ( = ?auto_325736 ?auto_325737 ) ) ( not ( = ?auto_325736 ?auto_325738 ) ) ( not ( = ?auto_325736 ?auto_325739 ) ) ( not ( = ?auto_325736 ?auto_325740 ) ) ( not ( = ?auto_325737 ?auto_325738 ) ) ( not ( = ?auto_325737 ?auto_325739 ) ) ( not ( = ?auto_325737 ?auto_325740 ) ) ( not ( = ?auto_325738 ?auto_325739 ) ) ( not ( = ?auto_325738 ?auto_325740 ) ) ( not ( = ?auto_325739 ?auto_325740 ) ) ( ON ?auto_325739 ?auto_325740 ) ( ON ?auto_325738 ?auto_325739 ) ( CLEAR ?auto_325736 ) ( ON ?auto_325737 ?auto_325738 ) ( CLEAR ?auto_325737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_325727 ?auto_325728 ?auto_325729 ?auto_325730 ?auto_325731 ?auto_325732 ?auto_325733 ?auto_325734 ?auto_325735 ?auto_325736 ?auto_325737 )
      ( MAKE-14PILE ?auto_325727 ?auto_325728 ?auto_325729 ?auto_325730 ?auto_325731 ?auto_325732 ?auto_325733 ?auto_325734 ?auto_325735 ?auto_325736 ?auto_325737 ?auto_325738 ?auto_325739 ?auto_325740 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325755 - BLOCK
      ?auto_325756 - BLOCK
      ?auto_325757 - BLOCK
      ?auto_325758 - BLOCK
      ?auto_325759 - BLOCK
      ?auto_325760 - BLOCK
      ?auto_325761 - BLOCK
      ?auto_325762 - BLOCK
      ?auto_325763 - BLOCK
      ?auto_325764 - BLOCK
      ?auto_325765 - BLOCK
      ?auto_325766 - BLOCK
      ?auto_325767 - BLOCK
      ?auto_325768 - BLOCK
    )
    :vars
    (
      ?auto_325769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325768 ?auto_325769 ) ( ON-TABLE ?auto_325755 ) ( ON ?auto_325756 ?auto_325755 ) ( ON ?auto_325757 ?auto_325756 ) ( ON ?auto_325758 ?auto_325757 ) ( ON ?auto_325759 ?auto_325758 ) ( ON ?auto_325760 ?auto_325759 ) ( ON ?auto_325761 ?auto_325760 ) ( ON ?auto_325762 ?auto_325761 ) ( ON ?auto_325763 ?auto_325762 ) ( not ( = ?auto_325755 ?auto_325756 ) ) ( not ( = ?auto_325755 ?auto_325757 ) ) ( not ( = ?auto_325755 ?auto_325758 ) ) ( not ( = ?auto_325755 ?auto_325759 ) ) ( not ( = ?auto_325755 ?auto_325760 ) ) ( not ( = ?auto_325755 ?auto_325761 ) ) ( not ( = ?auto_325755 ?auto_325762 ) ) ( not ( = ?auto_325755 ?auto_325763 ) ) ( not ( = ?auto_325755 ?auto_325764 ) ) ( not ( = ?auto_325755 ?auto_325765 ) ) ( not ( = ?auto_325755 ?auto_325766 ) ) ( not ( = ?auto_325755 ?auto_325767 ) ) ( not ( = ?auto_325755 ?auto_325768 ) ) ( not ( = ?auto_325755 ?auto_325769 ) ) ( not ( = ?auto_325756 ?auto_325757 ) ) ( not ( = ?auto_325756 ?auto_325758 ) ) ( not ( = ?auto_325756 ?auto_325759 ) ) ( not ( = ?auto_325756 ?auto_325760 ) ) ( not ( = ?auto_325756 ?auto_325761 ) ) ( not ( = ?auto_325756 ?auto_325762 ) ) ( not ( = ?auto_325756 ?auto_325763 ) ) ( not ( = ?auto_325756 ?auto_325764 ) ) ( not ( = ?auto_325756 ?auto_325765 ) ) ( not ( = ?auto_325756 ?auto_325766 ) ) ( not ( = ?auto_325756 ?auto_325767 ) ) ( not ( = ?auto_325756 ?auto_325768 ) ) ( not ( = ?auto_325756 ?auto_325769 ) ) ( not ( = ?auto_325757 ?auto_325758 ) ) ( not ( = ?auto_325757 ?auto_325759 ) ) ( not ( = ?auto_325757 ?auto_325760 ) ) ( not ( = ?auto_325757 ?auto_325761 ) ) ( not ( = ?auto_325757 ?auto_325762 ) ) ( not ( = ?auto_325757 ?auto_325763 ) ) ( not ( = ?auto_325757 ?auto_325764 ) ) ( not ( = ?auto_325757 ?auto_325765 ) ) ( not ( = ?auto_325757 ?auto_325766 ) ) ( not ( = ?auto_325757 ?auto_325767 ) ) ( not ( = ?auto_325757 ?auto_325768 ) ) ( not ( = ?auto_325757 ?auto_325769 ) ) ( not ( = ?auto_325758 ?auto_325759 ) ) ( not ( = ?auto_325758 ?auto_325760 ) ) ( not ( = ?auto_325758 ?auto_325761 ) ) ( not ( = ?auto_325758 ?auto_325762 ) ) ( not ( = ?auto_325758 ?auto_325763 ) ) ( not ( = ?auto_325758 ?auto_325764 ) ) ( not ( = ?auto_325758 ?auto_325765 ) ) ( not ( = ?auto_325758 ?auto_325766 ) ) ( not ( = ?auto_325758 ?auto_325767 ) ) ( not ( = ?auto_325758 ?auto_325768 ) ) ( not ( = ?auto_325758 ?auto_325769 ) ) ( not ( = ?auto_325759 ?auto_325760 ) ) ( not ( = ?auto_325759 ?auto_325761 ) ) ( not ( = ?auto_325759 ?auto_325762 ) ) ( not ( = ?auto_325759 ?auto_325763 ) ) ( not ( = ?auto_325759 ?auto_325764 ) ) ( not ( = ?auto_325759 ?auto_325765 ) ) ( not ( = ?auto_325759 ?auto_325766 ) ) ( not ( = ?auto_325759 ?auto_325767 ) ) ( not ( = ?auto_325759 ?auto_325768 ) ) ( not ( = ?auto_325759 ?auto_325769 ) ) ( not ( = ?auto_325760 ?auto_325761 ) ) ( not ( = ?auto_325760 ?auto_325762 ) ) ( not ( = ?auto_325760 ?auto_325763 ) ) ( not ( = ?auto_325760 ?auto_325764 ) ) ( not ( = ?auto_325760 ?auto_325765 ) ) ( not ( = ?auto_325760 ?auto_325766 ) ) ( not ( = ?auto_325760 ?auto_325767 ) ) ( not ( = ?auto_325760 ?auto_325768 ) ) ( not ( = ?auto_325760 ?auto_325769 ) ) ( not ( = ?auto_325761 ?auto_325762 ) ) ( not ( = ?auto_325761 ?auto_325763 ) ) ( not ( = ?auto_325761 ?auto_325764 ) ) ( not ( = ?auto_325761 ?auto_325765 ) ) ( not ( = ?auto_325761 ?auto_325766 ) ) ( not ( = ?auto_325761 ?auto_325767 ) ) ( not ( = ?auto_325761 ?auto_325768 ) ) ( not ( = ?auto_325761 ?auto_325769 ) ) ( not ( = ?auto_325762 ?auto_325763 ) ) ( not ( = ?auto_325762 ?auto_325764 ) ) ( not ( = ?auto_325762 ?auto_325765 ) ) ( not ( = ?auto_325762 ?auto_325766 ) ) ( not ( = ?auto_325762 ?auto_325767 ) ) ( not ( = ?auto_325762 ?auto_325768 ) ) ( not ( = ?auto_325762 ?auto_325769 ) ) ( not ( = ?auto_325763 ?auto_325764 ) ) ( not ( = ?auto_325763 ?auto_325765 ) ) ( not ( = ?auto_325763 ?auto_325766 ) ) ( not ( = ?auto_325763 ?auto_325767 ) ) ( not ( = ?auto_325763 ?auto_325768 ) ) ( not ( = ?auto_325763 ?auto_325769 ) ) ( not ( = ?auto_325764 ?auto_325765 ) ) ( not ( = ?auto_325764 ?auto_325766 ) ) ( not ( = ?auto_325764 ?auto_325767 ) ) ( not ( = ?auto_325764 ?auto_325768 ) ) ( not ( = ?auto_325764 ?auto_325769 ) ) ( not ( = ?auto_325765 ?auto_325766 ) ) ( not ( = ?auto_325765 ?auto_325767 ) ) ( not ( = ?auto_325765 ?auto_325768 ) ) ( not ( = ?auto_325765 ?auto_325769 ) ) ( not ( = ?auto_325766 ?auto_325767 ) ) ( not ( = ?auto_325766 ?auto_325768 ) ) ( not ( = ?auto_325766 ?auto_325769 ) ) ( not ( = ?auto_325767 ?auto_325768 ) ) ( not ( = ?auto_325767 ?auto_325769 ) ) ( not ( = ?auto_325768 ?auto_325769 ) ) ( ON ?auto_325767 ?auto_325768 ) ( ON ?auto_325766 ?auto_325767 ) ( ON ?auto_325765 ?auto_325766 ) ( CLEAR ?auto_325763 ) ( ON ?auto_325764 ?auto_325765 ) ( CLEAR ?auto_325764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_325755 ?auto_325756 ?auto_325757 ?auto_325758 ?auto_325759 ?auto_325760 ?auto_325761 ?auto_325762 ?auto_325763 ?auto_325764 )
      ( MAKE-14PILE ?auto_325755 ?auto_325756 ?auto_325757 ?auto_325758 ?auto_325759 ?auto_325760 ?auto_325761 ?auto_325762 ?auto_325763 ?auto_325764 ?auto_325765 ?auto_325766 ?auto_325767 ?auto_325768 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325784 - BLOCK
      ?auto_325785 - BLOCK
      ?auto_325786 - BLOCK
      ?auto_325787 - BLOCK
      ?auto_325788 - BLOCK
      ?auto_325789 - BLOCK
      ?auto_325790 - BLOCK
      ?auto_325791 - BLOCK
      ?auto_325792 - BLOCK
      ?auto_325793 - BLOCK
      ?auto_325794 - BLOCK
      ?auto_325795 - BLOCK
      ?auto_325796 - BLOCK
      ?auto_325797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_325797 ) ( ON-TABLE ?auto_325784 ) ( ON ?auto_325785 ?auto_325784 ) ( ON ?auto_325786 ?auto_325785 ) ( ON ?auto_325787 ?auto_325786 ) ( ON ?auto_325788 ?auto_325787 ) ( ON ?auto_325789 ?auto_325788 ) ( ON ?auto_325790 ?auto_325789 ) ( ON ?auto_325791 ?auto_325790 ) ( ON ?auto_325792 ?auto_325791 ) ( not ( = ?auto_325784 ?auto_325785 ) ) ( not ( = ?auto_325784 ?auto_325786 ) ) ( not ( = ?auto_325784 ?auto_325787 ) ) ( not ( = ?auto_325784 ?auto_325788 ) ) ( not ( = ?auto_325784 ?auto_325789 ) ) ( not ( = ?auto_325784 ?auto_325790 ) ) ( not ( = ?auto_325784 ?auto_325791 ) ) ( not ( = ?auto_325784 ?auto_325792 ) ) ( not ( = ?auto_325784 ?auto_325793 ) ) ( not ( = ?auto_325784 ?auto_325794 ) ) ( not ( = ?auto_325784 ?auto_325795 ) ) ( not ( = ?auto_325784 ?auto_325796 ) ) ( not ( = ?auto_325784 ?auto_325797 ) ) ( not ( = ?auto_325785 ?auto_325786 ) ) ( not ( = ?auto_325785 ?auto_325787 ) ) ( not ( = ?auto_325785 ?auto_325788 ) ) ( not ( = ?auto_325785 ?auto_325789 ) ) ( not ( = ?auto_325785 ?auto_325790 ) ) ( not ( = ?auto_325785 ?auto_325791 ) ) ( not ( = ?auto_325785 ?auto_325792 ) ) ( not ( = ?auto_325785 ?auto_325793 ) ) ( not ( = ?auto_325785 ?auto_325794 ) ) ( not ( = ?auto_325785 ?auto_325795 ) ) ( not ( = ?auto_325785 ?auto_325796 ) ) ( not ( = ?auto_325785 ?auto_325797 ) ) ( not ( = ?auto_325786 ?auto_325787 ) ) ( not ( = ?auto_325786 ?auto_325788 ) ) ( not ( = ?auto_325786 ?auto_325789 ) ) ( not ( = ?auto_325786 ?auto_325790 ) ) ( not ( = ?auto_325786 ?auto_325791 ) ) ( not ( = ?auto_325786 ?auto_325792 ) ) ( not ( = ?auto_325786 ?auto_325793 ) ) ( not ( = ?auto_325786 ?auto_325794 ) ) ( not ( = ?auto_325786 ?auto_325795 ) ) ( not ( = ?auto_325786 ?auto_325796 ) ) ( not ( = ?auto_325786 ?auto_325797 ) ) ( not ( = ?auto_325787 ?auto_325788 ) ) ( not ( = ?auto_325787 ?auto_325789 ) ) ( not ( = ?auto_325787 ?auto_325790 ) ) ( not ( = ?auto_325787 ?auto_325791 ) ) ( not ( = ?auto_325787 ?auto_325792 ) ) ( not ( = ?auto_325787 ?auto_325793 ) ) ( not ( = ?auto_325787 ?auto_325794 ) ) ( not ( = ?auto_325787 ?auto_325795 ) ) ( not ( = ?auto_325787 ?auto_325796 ) ) ( not ( = ?auto_325787 ?auto_325797 ) ) ( not ( = ?auto_325788 ?auto_325789 ) ) ( not ( = ?auto_325788 ?auto_325790 ) ) ( not ( = ?auto_325788 ?auto_325791 ) ) ( not ( = ?auto_325788 ?auto_325792 ) ) ( not ( = ?auto_325788 ?auto_325793 ) ) ( not ( = ?auto_325788 ?auto_325794 ) ) ( not ( = ?auto_325788 ?auto_325795 ) ) ( not ( = ?auto_325788 ?auto_325796 ) ) ( not ( = ?auto_325788 ?auto_325797 ) ) ( not ( = ?auto_325789 ?auto_325790 ) ) ( not ( = ?auto_325789 ?auto_325791 ) ) ( not ( = ?auto_325789 ?auto_325792 ) ) ( not ( = ?auto_325789 ?auto_325793 ) ) ( not ( = ?auto_325789 ?auto_325794 ) ) ( not ( = ?auto_325789 ?auto_325795 ) ) ( not ( = ?auto_325789 ?auto_325796 ) ) ( not ( = ?auto_325789 ?auto_325797 ) ) ( not ( = ?auto_325790 ?auto_325791 ) ) ( not ( = ?auto_325790 ?auto_325792 ) ) ( not ( = ?auto_325790 ?auto_325793 ) ) ( not ( = ?auto_325790 ?auto_325794 ) ) ( not ( = ?auto_325790 ?auto_325795 ) ) ( not ( = ?auto_325790 ?auto_325796 ) ) ( not ( = ?auto_325790 ?auto_325797 ) ) ( not ( = ?auto_325791 ?auto_325792 ) ) ( not ( = ?auto_325791 ?auto_325793 ) ) ( not ( = ?auto_325791 ?auto_325794 ) ) ( not ( = ?auto_325791 ?auto_325795 ) ) ( not ( = ?auto_325791 ?auto_325796 ) ) ( not ( = ?auto_325791 ?auto_325797 ) ) ( not ( = ?auto_325792 ?auto_325793 ) ) ( not ( = ?auto_325792 ?auto_325794 ) ) ( not ( = ?auto_325792 ?auto_325795 ) ) ( not ( = ?auto_325792 ?auto_325796 ) ) ( not ( = ?auto_325792 ?auto_325797 ) ) ( not ( = ?auto_325793 ?auto_325794 ) ) ( not ( = ?auto_325793 ?auto_325795 ) ) ( not ( = ?auto_325793 ?auto_325796 ) ) ( not ( = ?auto_325793 ?auto_325797 ) ) ( not ( = ?auto_325794 ?auto_325795 ) ) ( not ( = ?auto_325794 ?auto_325796 ) ) ( not ( = ?auto_325794 ?auto_325797 ) ) ( not ( = ?auto_325795 ?auto_325796 ) ) ( not ( = ?auto_325795 ?auto_325797 ) ) ( not ( = ?auto_325796 ?auto_325797 ) ) ( ON ?auto_325796 ?auto_325797 ) ( ON ?auto_325795 ?auto_325796 ) ( ON ?auto_325794 ?auto_325795 ) ( CLEAR ?auto_325792 ) ( ON ?auto_325793 ?auto_325794 ) ( CLEAR ?auto_325793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_325784 ?auto_325785 ?auto_325786 ?auto_325787 ?auto_325788 ?auto_325789 ?auto_325790 ?auto_325791 ?auto_325792 ?auto_325793 )
      ( MAKE-14PILE ?auto_325784 ?auto_325785 ?auto_325786 ?auto_325787 ?auto_325788 ?auto_325789 ?auto_325790 ?auto_325791 ?auto_325792 ?auto_325793 ?auto_325794 ?auto_325795 ?auto_325796 ?auto_325797 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325812 - BLOCK
      ?auto_325813 - BLOCK
      ?auto_325814 - BLOCK
      ?auto_325815 - BLOCK
      ?auto_325816 - BLOCK
      ?auto_325817 - BLOCK
      ?auto_325818 - BLOCK
      ?auto_325819 - BLOCK
      ?auto_325820 - BLOCK
      ?auto_325821 - BLOCK
      ?auto_325822 - BLOCK
      ?auto_325823 - BLOCK
      ?auto_325824 - BLOCK
      ?auto_325825 - BLOCK
    )
    :vars
    (
      ?auto_325826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325825 ?auto_325826 ) ( ON-TABLE ?auto_325812 ) ( ON ?auto_325813 ?auto_325812 ) ( ON ?auto_325814 ?auto_325813 ) ( ON ?auto_325815 ?auto_325814 ) ( ON ?auto_325816 ?auto_325815 ) ( ON ?auto_325817 ?auto_325816 ) ( ON ?auto_325818 ?auto_325817 ) ( ON ?auto_325819 ?auto_325818 ) ( not ( = ?auto_325812 ?auto_325813 ) ) ( not ( = ?auto_325812 ?auto_325814 ) ) ( not ( = ?auto_325812 ?auto_325815 ) ) ( not ( = ?auto_325812 ?auto_325816 ) ) ( not ( = ?auto_325812 ?auto_325817 ) ) ( not ( = ?auto_325812 ?auto_325818 ) ) ( not ( = ?auto_325812 ?auto_325819 ) ) ( not ( = ?auto_325812 ?auto_325820 ) ) ( not ( = ?auto_325812 ?auto_325821 ) ) ( not ( = ?auto_325812 ?auto_325822 ) ) ( not ( = ?auto_325812 ?auto_325823 ) ) ( not ( = ?auto_325812 ?auto_325824 ) ) ( not ( = ?auto_325812 ?auto_325825 ) ) ( not ( = ?auto_325812 ?auto_325826 ) ) ( not ( = ?auto_325813 ?auto_325814 ) ) ( not ( = ?auto_325813 ?auto_325815 ) ) ( not ( = ?auto_325813 ?auto_325816 ) ) ( not ( = ?auto_325813 ?auto_325817 ) ) ( not ( = ?auto_325813 ?auto_325818 ) ) ( not ( = ?auto_325813 ?auto_325819 ) ) ( not ( = ?auto_325813 ?auto_325820 ) ) ( not ( = ?auto_325813 ?auto_325821 ) ) ( not ( = ?auto_325813 ?auto_325822 ) ) ( not ( = ?auto_325813 ?auto_325823 ) ) ( not ( = ?auto_325813 ?auto_325824 ) ) ( not ( = ?auto_325813 ?auto_325825 ) ) ( not ( = ?auto_325813 ?auto_325826 ) ) ( not ( = ?auto_325814 ?auto_325815 ) ) ( not ( = ?auto_325814 ?auto_325816 ) ) ( not ( = ?auto_325814 ?auto_325817 ) ) ( not ( = ?auto_325814 ?auto_325818 ) ) ( not ( = ?auto_325814 ?auto_325819 ) ) ( not ( = ?auto_325814 ?auto_325820 ) ) ( not ( = ?auto_325814 ?auto_325821 ) ) ( not ( = ?auto_325814 ?auto_325822 ) ) ( not ( = ?auto_325814 ?auto_325823 ) ) ( not ( = ?auto_325814 ?auto_325824 ) ) ( not ( = ?auto_325814 ?auto_325825 ) ) ( not ( = ?auto_325814 ?auto_325826 ) ) ( not ( = ?auto_325815 ?auto_325816 ) ) ( not ( = ?auto_325815 ?auto_325817 ) ) ( not ( = ?auto_325815 ?auto_325818 ) ) ( not ( = ?auto_325815 ?auto_325819 ) ) ( not ( = ?auto_325815 ?auto_325820 ) ) ( not ( = ?auto_325815 ?auto_325821 ) ) ( not ( = ?auto_325815 ?auto_325822 ) ) ( not ( = ?auto_325815 ?auto_325823 ) ) ( not ( = ?auto_325815 ?auto_325824 ) ) ( not ( = ?auto_325815 ?auto_325825 ) ) ( not ( = ?auto_325815 ?auto_325826 ) ) ( not ( = ?auto_325816 ?auto_325817 ) ) ( not ( = ?auto_325816 ?auto_325818 ) ) ( not ( = ?auto_325816 ?auto_325819 ) ) ( not ( = ?auto_325816 ?auto_325820 ) ) ( not ( = ?auto_325816 ?auto_325821 ) ) ( not ( = ?auto_325816 ?auto_325822 ) ) ( not ( = ?auto_325816 ?auto_325823 ) ) ( not ( = ?auto_325816 ?auto_325824 ) ) ( not ( = ?auto_325816 ?auto_325825 ) ) ( not ( = ?auto_325816 ?auto_325826 ) ) ( not ( = ?auto_325817 ?auto_325818 ) ) ( not ( = ?auto_325817 ?auto_325819 ) ) ( not ( = ?auto_325817 ?auto_325820 ) ) ( not ( = ?auto_325817 ?auto_325821 ) ) ( not ( = ?auto_325817 ?auto_325822 ) ) ( not ( = ?auto_325817 ?auto_325823 ) ) ( not ( = ?auto_325817 ?auto_325824 ) ) ( not ( = ?auto_325817 ?auto_325825 ) ) ( not ( = ?auto_325817 ?auto_325826 ) ) ( not ( = ?auto_325818 ?auto_325819 ) ) ( not ( = ?auto_325818 ?auto_325820 ) ) ( not ( = ?auto_325818 ?auto_325821 ) ) ( not ( = ?auto_325818 ?auto_325822 ) ) ( not ( = ?auto_325818 ?auto_325823 ) ) ( not ( = ?auto_325818 ?auto_325824 ) ) ( not ( = ?auto_325818 ?auto_325825 ) ) ( not ( = ?auto_325818 ?auto_325826 ) ) ( not ( = ?auto_325819 ?auto_325820 ) ) ( not ( = ?auto_325819 ?auto_325821 ) ) ( not ( = ?auto_325819 ?auto_325822 ) ) ( not ( = ?auto_325819 ?auto_325823 ) ) ( not ( = ?auto_325819 ?auto_325824 ) ) ( not ( = ?auto_325819 ?auto_325825 ) ) ( not ( = ?auto_325819 ?auto_325826 ) ) ( not ( = ?auto_325820 ?auto_325821 ) ) ( not ( = ?auto_325820 ?auto_325822 ) ) ( not ( = ?auto_325820 ?auto_325823 ) ) ( not ( = ?auto_325820 ?auto_325824 ) ) ( not ( = ?auto_325820 ?auto_325825 ) ) ( not ( = ?auto_325820 ?auto_325826 ) ) ( not ( = ?auto_325821 ?auto_325822 ) ) ( not ( = ?auto_325821 ?auto_325823 ) ) ( not ( = ?auto_325821 ?auto_325824 ) ) ( not ( = ?auto_325821 ?auto_325825 ) ) ( not ( = ?auto_325821 ?auto_325826 ) ) ( not ( = ?auto_325822 ?auto_325823 ) ) ( not ( = ?auto_325822 ?auto_325824 ) ) ( not ( = ?auto_325822 ?auto_325825 ) ) ( not ( = ?auto_325822 ?auto_325826 ) ) ( not ( = ?auto_325823 ?auto_325824 ) ) ( not ( = ?auto_325823 ?auto_325825 ) ) ( not ( = ?auto_325823 ?auto_325826 ) ) ( not ( = ?auto_325824 ?auto_325825 ) ) ( not ( = ?auto_325824 ?auto_325826 ) ) ( not ( = ?auto_325825 ?auto_325826 ) ) ( ON ?auto_325824 ?auto_325825 ) ( ON ?auto_325823 ?auto_325824 ) ( ON ?auto_325822 ?auto_325823 ) ( ON ?auto_325821 ?auto_325822 ) ( CLEAR ?auto_325819 ) ( ON ?auto_325820 ?auto_325821 ) ( CLEAR ?auto_325820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_325812 ?auto_325813 ?auto_325814 ?auto_325815 ?auto_325816 ?auto_325817 ?auto_325818 ?auto_325819 ?auto_325820 )
      ( MAKE-14PILE ?auto_325812 ?auto_325813 ?auto_325814 ?auto_325815 ?auto_325816 ?auto_325817 ?auto_325818 ?auto_325819 ?auto_325820 ?auto_325821 ?auto_325822 ?auto_325823 ?auto_325824 ?auto_325825 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325841 - BLOCK
      ?auto_325842 - BLOCK
      ?auto_325843 - BLOCK
      ?auto_325844 - BLOCK
      ?auto_325845 - BLOCK
      ?auto_325846 - BLOCK
      ?auto_325847 - BLOCK
      ?auto_325848 - BLOCK
      ?auto_325849 - BLOCK
      ?auto_325850 - BLOCK
      ?auto_325851 - BLOCK
      ?auto_325852 - BLOCK
      ?auto_325853 - BLOCK
      ?auto_325854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_325854 ) ( ON-TABLE ?auto_325841 ) ( ON ?auto_325842 ?auto_325841 ) ( ON ?auto_325843 ?auto_325842 ) ( ON ?auto_325844 ?auto_325843 ) ( ON ?auto_325845 ?auto_325844 ) ( ON ?auto_325846 ?auto_325845 ) ( ON ?auto_325847 ?auto_325846 ) ( ON ?auto_325848 ?auto_325847 ) ( not ( = ?auto_325841 ?auto_325842 ) ) ( not ( = ?auto_325841 ?auto_325843 ) ) ( not ( = ?auto_325841 ?auto_325844 ) ) ( not ( = ?auto_325841 ?auto_325845 ) ) ( not ( = ?auto_325841 ?auto_325846 ) ) ( not ( = ?auto_325841 ?auto_325847 ) ) ( not ( = ?auto_325841 ?auto_325848 ) ) ( not ( = ?auto_325841 ?auto_325849 ) ) ( not ( = ?auto_325841 ?auto_325850 ) ) ( not ( = ?auto_325841 ?auto_325851 ) ) ( not ( = ?auto_325841 ?auto_325852 ) ) ( not ( = ?auto_325841 ?auto_325853 ) ) ( not ( = ?auto_325841 ?auto_325854 ) ) ( not ( = ?auto_325842 ?auto_325843 ) ) ( not ( = ?auto_325842 ?auto_325844 ) ) ( not ( = ?auto_325842 ?auto_325845 ) ) ( not ( = ?auto_325842 ?auto_325846 ) ) ( not ( = ?auto_325842 ?auto_325847 ) ) ( not ( = ?auto_325842 ?auto_325848 ) ) ( not ( = ?auto_325842 ?auto_325849 ) ) ( not ( = ?auto_325842 ?auto_325850 ) ) ( not ( = ?auto_325842 ?auto_325851 ) ) ( not ( = ?auto_325842 ?auto_325852 ) ) ( not ( = ?auto_325842 ?auto_325853 ) ) ( not ( = ?auto_325842 ?auto_325854 ) ) ( not ( = ?auto_325843 ?auto_325844 ) ) ( not ( = ?auto_325843 ?auto_325845 ) ) ( not ( = ?auto_325843 ?auto_325846 ) ) ( not ( = ?auto_325843 ?auto_325847 ) ) ( not ( = ?auto_325843 ?auto_325848 ) ) ( not ( = ?auto_325843 ?auto_325849 ) ) ( not ( = ?auto_325843 ?auto_325850 ) ) ( not ( = ?auto_325843 ?auto_325851 ) ) ( not ( = ?auto_325843 ?auto_325852 ) ) ( not ( = ?auto_325843 ?auto_325853 ) ) ( not ( = ?auto_325843 ?auto_325854 ) ) ( not ( = ?auto_325844 ?auto_325845 ) ) ( not ( = ?auto_325844 ?auto_325846 ) ) ( not ( = ?auto_325844 ?auto_325847 ) ) ( not ( = ?auto_325844 ?auto_325848 ) ) ( not ( = ?auto_325844 ?auto_325849 ) ) ( not ( = ?auto_325844 ?auto_325850 ) ) ( not ( = ?auto_325844 ?auto_325851 ) ) ( not ( = ?auto_325844 ?auto_325852 ) ) ( not ( = ?auto_325844 ?auto_325853 ) ) ( not ( = ?auto_325844 ?auto_325854 ) ) ( not ( = ?auto_325845 ?auto_325846 ) ) ( not ( = ?auto_325845 ?auto_325847 ) ) ( not ( = ?auto_325845 ?auto_325848 ) ) ( not ( = ?auto_325845 ?auto_325849 ) ) ( not ( = ?auto_325845 ?auto_325850 ) ) ( not ( = ?auto_325845 ?auto_325851 ) ) ( not ( = ?auto_325845 ?auto_325852 ) ) ( not ( = ?auto_325845 ?auto_325853 ) ) ( not ( = ?auto_325845 ?auto_325854 ) ) ( not ( = ?auto_325846 ?auto_325847 ) ) ( not ( = ?auto_325846 ?auto_325848 ) ) ( not ( = ?auto_325846 ?auto_325849 ) ) ( not ( = ?auto_325846 ?auto_325850 ) ) ( not ( = ?auto_325846 ?auto_325851 ) ) ( not ( = ?auto_325846 ?auto_325852 ) ) ( not ( = ?auto_325846 ?auto_325853 ) ) ( not ( = ?auto_325846 ?auto_325854 ) ) ( not ( = ?auto_325847 ?auto_325848 ) ) ( not ( = ?auto_325847 ?auto_325849 ) ) ( not ( = ?auto_325847 ?auto_325850 ) ) ( not ( = ?auto_325847 ?auto_325851 ) ) ( not ( = ?auto_325847 ?auto_325852 ) ) ( not ( = ?auto_325847 ?auto_325853 ) ) ( not ( = ?auto_325847 ?auto_325854 ) ) ( not ( = ?auto_325848 ?auto_325849 ) ) ( not ( = ?auto_325848 ?auto_325850 ) ) ( not ( = ?auto_325848 ?auto_325851 ) ) ( not ( = ?auto_325848 ?auto_325852 ) ) ( not ( = ?auto_325848 ?auto_325853 ) ) ( not ( = ?auto_325848 ?auto_325854 ) ) ( not ( = ?auto_325849 ?auto_325850 ) ) ( not ( = ?auto_325849 ?auto_325851 ) ) ( not ( = ?auto_325849 ?auto_325852 ) ) ( not ( = ?auto_325849 ?auto_325853 ) ) ( not ( = ?auto_325849 ?auto_325854 ) ) ( not ( = ?auto_325850 ?auto_325851 ) ) ( not ( = ?auto_325850 ?auto_325852 ) ) ( not ( = ?auto_325850 ?auto_325853 ) ) ( not ( = ?auto_325850 ?auto_325854 ) ) ( not ( = ?auto_325851 ?auto_325852 ) ) ( not ( = ?auto_325851 ?auto_325853 ) ) ( not ( = ?auto_325851 ?auto_325854 ) ) ( not ( = ?auto_325852 ?auto_325853 ) ) ( not ( = ?auto_325852 ?auto_325854 ) ) ( not ( = ?auto_325853 ?auto_325854 ) ) ( ON ?auto_325853 ?auto_325854 ) ( ON ?auto_325852 ?auto_325853 ) ( ON ?auto_325851 ?auto_325852 ) ( ON ?auto_325850 ?auto_325851 ) ( CLEAR ?auto_325848 ) ( ON ?auto_325849 ?auto_325850 ) ( CLEAR ?auto_325849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_325841 ?auto_325842 ?auto_325843 ?auto_325844 ?auto_325845 ?auto_325846 ?auto_325847 ?auto_325848 ?auto_325849 )
      ( MAKE-14PILE ?auto_325841 ?auto_325842 ?auto_325843 ?auto_325844 ?auto_325845 ?auto_325846 ?auto_325847 ?auto_325848 ?auto_325849 ?auto_325850 ?auto_325851 ?auto_325852 ?auto_325853 ?auto_325854 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325869 - BLOCK
      ?auto_325870 - BLOCK
      ?auto_325871 - BLOCK
      ?auto_325872 - BLOCK
      ?auto_325873 - BLOCK
      ?auto_325874 - BLOCK
      ?auto_325875 - BLOCK
      ?auto_325876 - BLOCK
      ?auto_325877 - BLOCK
      ?auto_325878 - BLOCK
      ?auto_325879 - BLOCK
      ?auto_325880 - BLOCK
      ?auto_325881 - BLOCK
      ?auto_325882 - BLOCK
    )
    :vars
    (
      ?auto_325883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325882 ?auto_325883 ) ( ON-TABLE ?auto_325869 ) ( ON ?auto_325870 ?auto_325869 ) ( ON ?auto_325871 ?auto_325870 ) ( ON ?auto_325872 ?auto_325871 ) ( ON ?auto_325873 ?auto_325872 ) ( ON ?auto_325874 ?auto_325873 ) ( ON ?auto_325875 ?auto_325874 ) ( not ( = ?auto_325869 ?auto_325870 ) ) ( not ( = ?auto_325869 ?auto_325871 ) ) ( not ( = ?auto_325869 ?auto_325872 ) ) ( not ( = ?auto_325869 ?auto_325873 ) ) ( not ( = ?auto_325869 ?auto_325874 ) ) ( not ( = ?auto_325869 ?auto_325875 ) ) ( not ( = ?auto_325869 ?auto_325876 ) ) ( not ( = ?auto_325869 ?auto_325877 ) ) ( not ( = ?auto_325869 ?auto_325878 ) ) ( not ( = ?auto_325869 ?auto_325879 ) ) ( not ( = ?auto_325869 ?auto_325880 ) ) ( not ( = ?auto_325869 ?auto_325881 ) ) ( not ( = ?auto_325869 ?auto_325882 ) ) ( not ( = ?auto_325869 ?auto_325883 ) ) ( not ( = ?auto_325870 ?auto_325871 ) ) ( not ( = ?auto_325870 ?auto_325872 ) ) ( not ( = ?auto_325870 ?auto_325873 ) ) ( not ( = ?auto_325870 ?auto_325874 ) ) ( not ( = ?auto_325870 ?auto_325875 ) ) ( not ( = ?auto_325870 ?auto_325876 ) ) ( not ( = ?auto_325870 ?auto_325877 ) ) ( not ( = ?auto_325870 ?auto_325878 ) ) ( not ( = ?auto_325870 ?auto_325879 ) ) ( not ( = ?auto_325870 ?auto_325880 ) ) ( not ( = ?auto_325870 ?auto_325881 ) ) ( not ( = ?auto_325870 ?auto_325882 ) ) ( not ( = ?auto_325870 ?auto_325883 ) ) ( not ( = ?auto_325871 ?auto_325872 ) ) ( not ( = ?auto_325871 ?auto_325873 ) ) ( not ( = ?auto_325871 ?auto_325874 ) ) ( not ( = ?auto_325871 ?auto_325875 ) ) ( not ( = ?auto_325871 ?auto_325876 ) ) ( not ( = ?auto_325871 ?auto_325877 ) ) ( not ( = ?auto_325871 ?auto_325878 ) ) ( not ( = ?auto_325871 ?auto_325879 ) ) ( not ( = ?auto_325871 ?auto_325880 ) ) ( not ( = ?auto_325871 ?auto_325881 ) ) ( not ( = ?auto_325871 ?auto_325882 ) ) ( not ( = ?auto_325871 ?auto_325883 ) ) ( not ( = ?auto_325872 ?auto_325873 ) ) ( not ( = ?auto_325872 ?auto_325874 ) ) ( not ( = ?auto_325872 ?auto_325875 ) ) ( not ( = ?auto_325872 ?auto_325876 ) ) ( not ( = ?auto_325872 ?auto_325877 ) ) ( not ( = ?auto_325872 ?auto_325878 ) ) ( not ( = ?auto_325872 ?auto_325879 ) ) ( not ( = ?auto_325872 ?auto_325880 ) ) ( not ( = ?auto_325872 ?auto_325881 ) ) ( not ( = ?auto_325872 ?auto_325882 ) ) ( not ( = ?auto_325872 ?auto_325883 ) ) ( not ( = ?auto_325873 ?auto_325874 ) ) ( not ( = ?auto_325873 ?auto_325875 ) ) ( not ( = ?auto_325873 ?auto_325876 ) ) ( not ( = ?auto_325873 ?auto_325877 ) ) ( not ( = ?auto_325873 ?auto_325878 ) ) ( not ( = ?auto_325873 ?auto_325879 ) ) ( not ( = ?auto_325873 ?auto_325880 ) ) ( not ( = ?auto_325873 ?auto_325881 ) ) ( not ( = ?auto_325873 ?auto_325882 ) ) ( not ( = ?auto_325873 ?auto_325883 ) ) ( not ( = ?auto_325874 ?auto_325875 ) ) ( not ( = ?auto_325874 ?auto_325876 ) ) ( not ( = ?auto_325874 ?auto_325877 ) ) ( not ( = ?auto_325874 ?auto_325878 ) ) ( not ( = ?auto_325874 ?auto_325879 ) ) ( not ( = ?auto_325874 ?auto_325880 ) ) ( not ( = ?auto_325874 ?auto_325881 ) ) ( not ( = ?auto_325874 ?auto_325882 ) ) ( not ( = ?auto_325874 ?auto_325883 ) ) ( not ( = ?auto_325875 ?auto_325876 ) ) ( not ( = ?auto_325875 ?auto_325877 ) ) ( not ( = ?auto_325875 ?auto_325878 ) ) ( not ( = ?auto_325875 ?auto_325879 ) ) ( not ( = ?auto_325875 ?auto_325880 ) ) ( not ( = ?auto_325875 ?auto_325881 ) ) ( not ( = ?auto_325875 ?auto_325882 ) ) ( not ( = ?auto_325875 ?auto_325883 ) ) ( not ( = ?auto_325876 ?auto_325877 ) ) ( not ( = ?auto_325876 ?auto_325878 ) ) ( not ( = ?auto_325876 ?auto_325879 ) ) ( not ( = ?auto_325876 ?auto_325880 ) ) ( not ( = ?auto_325876 ?auto_325881 ) ) ( not ( = ?auto_325876 ?auto_325882 ) ) ( not ( = ?auto_325876 ?auto_325883 ) ) ( not ( = ?auto_325877 ?auto_325878 ) ) ( not ( = ?auto_325877 ?auto_325879 ) ) ( not ( = ?auto_325877 ?auto_325880 ) ) ( not ( = ?auto_325877 ?auto_325881 ) ) ( not ( = ?auto_325877 ?auto_325882 ) ) ( not ( = ?auto_325877 ?auto_325883 ) ) ( not ( = ?auto_325878 ?auto_325879 ) ) ( not ( = ?auto_325878 ?auto_325880 ) ) ( not ( = ?auto_325878 ?auto_325881 ) ) ( not ( = ?auto_325878 ?auto_325882 ) ) ( not ( = ?auto_325878 ?auto_325883 ) ) ( not ( = ?auto_325879 ?auto_325880 ) ) ( not ( = ?auto_325879 ?auto_325881 ) ) ( not ( = ?auto_325879 ?auto_325882 ) ) ( not ( = ?auto_325879 ?auto_325883 ) ) ( not ( = ?auto_325880 ?auto_325881 ) ) ( not ( = ?auto_325880 ?auto_325882 ) ) ( not ( = ?auto_325880 ?auto_325883 ) ) ( not ( = ?auto_325881 ?auto_325882 ) ) ( not ( = ?auto_325881 ?auto_325883 ) ) ( not ( = ?auto_325882 ?auto_325883 ) ) ( ON ?auto_325881 ?auto_325882 ) ( ON ?auto_325880 ?auto_325881 ) ( ON ?auto_325879 ?auto_325880 ) ( ON ?auto_325878 ?auto_325879 ) ( ON ?auto_325877 ?auto_325878 ) ( CLEAR ?auto_325875 ) ( ON ?auto_325876 ?auto_325877 ) ( CLEAR ?auto_325876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_325869 ?auto_325870 ?auto_325871 ?auto_325872 ?auto_325873 ?auto_325874 ?auto_325875 ?auto_325876 )
      ( MAKE-14PILE ?auto_325869 ?auto_325870 ?auto_325871 ?auto_325872 ?auto_325873 ?auto_325874 ?auto_325875 ?auto_325876 ?auto_325877 ?auto_325878 ?auto_325879 ?auto_325880 ?auto_325881 ?auto_325882 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325898 - BLOCK
      ?auto_325899 - BLOCK
      ?auto_325900 - BLOCK
      ?auto_325901 - BLOCK
      ?auto_325902 - BLOCK
      ?auto_325903 - BLOCK
      ?auto_325904 - BLOCK
      ?auto_325905 - BLOCK
      ?auto_325906 - BLOCK
      ?auto_325907 - BLOCK
      ?auto_325908 - BLOCK
      ?auto_325909 - BLOCK
      ?auto_325910 - BLOCK
      ?auto_325911 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_325911 ) ( ON-TABLE ?auto_325898 ) ( ON ?auto_325899 ?auto_325898 ) ( ON ?auto_325900 ?auto_325899 ) ( ON ?auto_325901 ?auto_325900 ) ( ON ?auto_325902 ?auto_325901 ) ( ON ?auto_325903 ?auto_325902 ) ( ON ?auto_325904 ?auto_325903 ) ( not ( = ?auto_325898 ?auto_325899 ) ) ( not ( = ?auto_325898 ?auto_325900 ) ) ( not ( = ?auto_325898 ?auto_325901 ) ) ( not ( = ?auto_325898 ?auto_325902 ) ) ( not ( = ?auto_325898 ?auto_325903 ) ) ( not ( = ?auto_325898 ?auto_325904 ) ) ( not ( = ?auto_325898 ?auto_325905 ) ) ( not ( = ?auto_325898 ?auto_325906 ) ) ( not ( = ?auto_325898 ?auto_325907 ) ) ( not ( = ?auto_325898 ?auto_325908 ) ) ( not ( = ?auto_325898 ?auto_325909 ) ) ( not ( = ?auto_325898 ?auto_325910 ) ) ( not ( = ?auto_325898 ?auto_325911 ) ) ( not ( = ?auto_325899 ?auto_325900 ) ) ( not ( = ?auto_325899 ?auto_325901 ) ) ( not ( = ?auto_325899 ?auto_325902 ) ) ( not ( = ?auto_325899 ?auto_325903 ) ) ( not ( = ?auto_325899 ?auto_325904 ) ) ( not ( = ?auto_325899 ?auto_325905 ) ) ( not ( = ?auto_325899 ?auto_325906 ) ) ( not ( = ?auto_325899 ?auto_325907 ) ) ( not ( = ?auto_325899 ?auto_325908 ) ) ( not ( = ?auto_325899 ?auto_325909 ) ) ( not ( = ?auto_325899 ?auto_325910 ) ) ( not ( = ?auto_325899 ?auto_325911 ) ) ( not ( = ?auto_325900 ?auto_325901 ) ) ( not ( = ?auto_325900 ?auto_325902 ) ) ( not ( = ?auto_325900 ?auto_325903 ) ) ( not ( = ?auto_325900 ?auto_325904 ) ) ( not ( = ?auto_325900 ?auto_325905 ) ) ( not ( = ?auto_325900 ?auto_325906 ) ) ( not ( = ?auto_325900 ?auto_325907 ) ) ( not ( = ?auto_325900 ?auto_325908 ) ) ( not ( = ?auto_325900 ?auto_325909 ) ) ( not ( = ?auto_325900 ?auto_325910 ) ) ( not ( = ?auto_325900 ?auto_325911 ) ) ( not ( = ?auto_325901 ?auto_325902 ) ) ( not ( = ?auto_325901 ?auto_325903 ) ) ( not ( = ?auto_325901 ?auto_325904 ) ) ( not ( = ?auto_325901 ?auto_325905 ) ) ( not ( = ?auto_325901 ?auto_325906 ) ) ( not ( = ?auto_325901 ?auto_325907 ) ) ( not ( = ?auto_325901 ?auto_325908 ) ) ( not ( = ?auto_325901 ?auto_325909 ) ) ( not ( = ?auto_325901 ?auto_325910 ) ) ( not ( = ?auto_325901 ?auto_325911 ) ) ( not ( = ?auto_325902 ?auto_325903 ) ) ( not ( = ?auto_325902 ?auto_325904 ) ) ( not ( = ?auto_325902 ?auto_325905 ) ) ( not ( = ?auto_325902 ?auto_325906 ) ) ( not ( = ?auto_325902 ?auto_325907 ) ) ( not ( = ?auto_325902 ?auto_325908 ) ) ( not ( = ?auto_325902 ?auto_325909 ) ) ( not ( = ?auto_325902 ?auto_325910 ) ) ( not ( = ?auto_325902 ?auto_325911 ) ) ( not ( = ?auto_325903 ?auto_325904 ) ) ( not ( = ?auto_325903 ?auto_325905 ) ) ( not ( = ?auto_325903 ?auto_325906 ) ) ( not ( = ?auto_325903 ?auto_325907 ) ) ( not ( = ?auto_325903 ?auto_325908 ) ) ( not ( = ?auto_325903 ?auto_325909 ) ) ( not ( = ?auto_325903 ?auto_325910 ) ) ( not ( = ?auto_325903 ?auto_325911 ) ) ( not ( = ?auto_325904 ?auto_325905 ) ) ( not ( = ?auto_325904 ?auto_325906 ) ) ( not ( = ?auto_325904 ?auto_325907 ) ) ( not ( = ?auto_325904 ?auto_325908 ) ) ( not ( = ?auto_325904 ?auto_325909 ) ) ( not ( = ?auto_325904 ?auto_325910 ) ) ( not ( = ?auto_325904 ?auto_325911 ) ) ( not ( = ?auto_325905 ?auto_325906 ) ) ( not ( = ?auto_325905 ?auto_325907 ) ) ( not ( = ?auto_325905 ?auto_325908 ) ) ( not ( = ?auto_325905 ?auto_325909 ) ) ( not ( = ?auto_325905 ?auto_325910 ) ) ( not ( = ?auto_325905 ?auto_325911 ) ) ( not ( = ?auto_325906 ?auto_325907 ) ) ( not ( = ?auto_325906 ?auto_325908 ) ) ( not ( = ?auto_325906 ?auto_325909 ) ) ( not ( = ?auto_325906 ?auto_325910 ) ) ( not ( = ?auto_325906 ?auto_325911 ) ) ( not ( = ?auto_325907 ?auto_325908 ) ) ( not ( = ?auto_325907 ?auto_325909 ) ) ( not ( = ?auto_325907 ?auto_325910 ) ) ( not ( = ?auto_325907 ?auto_325911 ) ) ( not ( = ?auto_325908 ?auto_325909 ) ) ( not ( = ?auto_325908 ?auto_325910 ) ) ( not ( = ?auto_325908 ?auto_325911 ) ) ( not ( = ?auto_325909 ?auto_325910 ) ) ( not ( = ?auto_325909 ?auto_325911 ) ) ( not ( = ?auto_325910 ?auto_325911 ) ) ( ON ?auto_325910 ?auto_325911 ) ( ON ?auto_325909 ?auto_325910 ) ( ON ?auto_325908 ?auto_325909 ) ( ON ?auto_325907 ?auto_325908 ) ( ON ?auto_325906 ?auto_325907 ) ( CLEAR ?auto_325904 ) ( ON ?auto_325905 ?auto_325906 ) ( CLEAR ?auto_325905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_325898 ?auto_325899 ?auto_325900 ?auto_325901 ?auto_325902 ?auto_325903 ?auto_325904 ?auto_325905 )
      ( MAKE-14PILE ?auto_325898 ?auto_325899 ?auto_325900 ?auto_325901 ?auto_325902 ?auto_325903 ?auto_325904 ?auto_325905 ?auto_325906 ?auto_325907 ?auto_325908 ?auto_325909 ?auto_325910 ?auto_325911 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325926 - BLOCK
      ?auto_325927 - BLOCK
      ?auto_325928 - BLOCK
      ?auto_325929 - BLOCK
      ?auto_325930 - BLOCK
      ?auto_325931 - BLOCK
      ?auto_325932 - BLOCK
      ?auto_325933 - BLOCK
      ?auto_325934 - BLOCK
      ?auto_325935 - BLOCK
      ?auto_325936 - BLOCK
      ?auto_325937 - BLOCK
      ?auto_325938 - BLOCK
      ?auto_325939 - BLOCK
    )
    :vars
    (
      ?auto_325940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325939 ?auto_325940 ) ( ON-TABLE ?auto_325926 ) ( ON ?auto_325927 ?auto_325926 ) ( ON ?auto_325928 ?auto_325927 ) ( ON ?auto_325929 ?auto_325928 ) ( ON ?auto_325930 ?auto_325929 ) ( ON ?auto_325931 ?auto_325930 ) ( not ( = ?auto_325926 ?auto_325927 ) ) ( not ( = ?auto_325926 ?auto_325928 ) ) ( not ( = ?auto_325926 ?auto_325929 ) ) ( not ( = ?auto_325926 ?auto_325930 ) ) ( not ( = ?auto_325926 ?auto_325931 ) ) ( not ( = ?auto_325926 ?auto_325932 ) ) ( not ( = ?auto_325926 ?auto_325933 ) ) ( not ( = ?auto_325926 ?auto_325934 ) ) ( not ( = ?auto_325926 ?auto_325935 ) ) ( not ( = ?auto_325926 ?auto_325936 ) ) ( not ( = ?auto_325926 ?auto_325937 ) ) ( not ( = ?auto_325926 ?auto_325938 ) ) ( not ( = ?auto_325926 ?auto_325939 ) ) ( not ( = ?auto_325926 ?auto_325940 ) ) ( not ( = ?auto_325927 ?auto_325928 ) ) ( not ( = ?auto_325927 ?auto_325929 ) ) ( not ( = ?auto_325927 ?auto_325930 ) ) ( not ( = ?auto_325927 ?auto_325931 ) ) ( not ( = ?auto_325927 ?auto_325932 ) ) ( not ( = ?auto_325927 ?auto_325933 ) ) ( not ( = ?auto_325927 ?auto_325934 ) ) ( not ( = ?auto_325927 ?auto_325935 ) ) ( not ( = ?auto_325927 ?auto_325936 ) ) ( not ( = ?auto_325927 ?auto_325937 ) ) ( not ( = ?auto_325927 ?auto_325938 ) ) ( not ( = ?auto_325927 ?auto_325939 ) ) ( not ( = ?auto_325927 ?auto_325940 ) ) ( not ( = ?auto_325928 ?auto_325929 ) ) ( not ( = ?auto_325928 ?auto_325930 ) ) ( not ( = ?auto_325928 ?auto_325931 ) ) ( not ( = ?auto_325928 ?auto_325932 ) ) ( not ( = ?auto_325928 ?auto_325933 ) ) ( not ( = ?auto_325928 ?auto_325934 ) ) ( not ( = ?auto_325928 ?auto_325935 ) ) ( not ( = ?auto_325928 ?auto_325936 ) ) ( not ( = ?auto_325928 ?auto_325937 ) ) ( not ( = ?auto_325928 ?auto_325938 ) ) ( not ( = ?auto_325928 ?auto_325939 ) ) ( not ( = ?auto_325928 ?auto_325940 ) ) ( not ( = ?auto_325929 ?auto_325930 ) ) ( not ( = ?auto_325929 ?auto_325931 ) ) ( not ( = ?auto_325929 ?auto_325932 ) ) ( not ( = ?auto_325929 ?auto_325933 ) ) ( not ( = ?auto_325929 ?auto_325934 ) ) ( not ( = ?auto_325929 ?auto_325935 ) ) ( not ( = ?auto_325929 ?auto_325936 ) ) ( not ( = ?auto_325929 ?auto_325937 ) ) ( not ( = ?auto_325929 ?auto_325938 ) ) ( not ( = ?auto_325929 ?auto_325939 ) ) ( not ( = ?auto_325929 ?auto_325940 ) ) ( not ( = ?auto_325930 ?auto_325931 ) ) ( not ( = ?auto_325930 ?auto_325932 ) ) ( not ( = ?auto_325930 ?auto_325933 ) ) ( not ( = ?auto_325930 ?auto_325934 ) ) ( not ( = ?auto_325930 ?auto_325935 ) ) ( not ( = ?auto_325930 ?auto_325936 ) ) ( not ( = ?auto_325930 ?auto_325937 ) ) ( not ( = ?auto_325930 ?auto_325938 ) ) ( not ( = ?auto_325930 ?auto_325939 ) ) ( not ( = ?auto_325930 ?auto_325940 ) ) ( not ( = ?auto_325931 ?auto_325932 ) ) ( not ( = ?auto_325931 ?auto_325933 ) ) ( not ( = ?auto_325931 ?auto_325934 ) ) ( not ( = ?auto_325931 ?auto_325935 ) ) ( not ( = ?auto_325931 ?auto_325936 ) ) ( not ( = ?auto_325931 ?auto_325937 ) ) ( not ( = ?auto_325931 ?auto_325938 ) ) ( not ( = ?auto_325931 ?auto_325939 ) ) ( not ( = ?auto_325931 ?auto_325940 ) ) ( not ( = ?auto_325932 ?auto_325933 ) ) ( not ( = ?auto_325932 ?auto_325934 ) ) ( not ( = ?auto_325932 ?auto_325935 ) ) ( not ( = ?auto_325932 ?auto_325936 ) ) ( not ( = ?auto_325932 ?auto_325937 ) ) ( not ( = ?auto_325932 ?auto_325938 ) ) ( not ( = ?auto_325932 ?auto_325939 ) ) ( not ( = ?auto_325932 ?auto_325940 ) ) ( not ( = ?auto_325933 ?auto_325934 ) ) ( not ( = ?auto_325933 ?auto_325935 ) ) ( not ( = ?auto_325933 ?auto_325936 ) ) ( not ( = ?auto_325933 ?auto_325937 ) ) ( not ( = ?auto_325933 ?auto_325938 ) ) ( not ( = ?auto_325933 ?auto_325939 ) ) ( not ( = ?auto_325933 ?auto_325940 ) ) ( not ( = ?auto_325934 ?auto_325935 ) ) ( not ( = ?auto_325934 ?auto_325936 ) ) ( not ( = ?auto_325934 ?auto_325937 ) ) ( not ( = ?auto_325934 ?auto_325938 ) ) ( not ( = ?auto_325934 ?auto_325939 ) ) ( not ( = ?auto_325934 ?auto_325940 ) ) ( not ( = ?auto_325935 ?auto_325936 ) ) ( not ( = ?auto_325935 ?auto_325937 ) ) ( not ( = ?auto_325935 ?auto_325938 ) ) ( not ( = ?auto_325935 ?auto_325939 ) ) ( not ( = ?auto_325935 ?auto_325940 ) ) ( not ( = ?auto_325936 ?auto_325937 ) ) ( not ( = ?auto_325936 ?auto_325938 ) ) ( not ( = ?auto_325936 ?auto_325939 ) ) ( not ( = ?auto_325936 ?auto_325940 ) ) ( not ( = ?auto_325937 ?auto_325938 ) ) ( not ( = ?auto_325937 ?auto_325939 ) ) ( not ( = ?auto_325937 ?auto_325940 ) ) ( not ( = ?auto_325938 ?auto_325939 ) ) ( not ( = ?auto_325938 ?auto_325940 ) ) ( not ( = ?auto_325939 ?auto_325940 ) ) ( ON ?auto_325938 ?auto_325939 ) ( ON ?auto_325937 ?auto_325938 ) ( ON ?auto_325936 ?auto_325937 ) ( ON ?auto_325935 ?auto_325936 ) ( ON ?auto_325934 ?auto_325935 ) ( ON ?auto_325933 ?auto_325934 ) ( CLEAR ?auto_325931 ) ( ON ?auto_325932 ?auto_325933 ) ( CLEAR ?auto_325932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_325926 ?auto_325927 ?auto_325928 ?auto_325929 ?auto_325930 ?auto_325931 ?auto_325932 )
      ( MAKE-14PILE ?auto_325926 ?auto_325927 ?auto_325928 ?auto_325929 ?auto_325930 ?auto_325931 ?auto_325932 ?auto_325933 ?auto_325934 ?auto_325935 ?auto_325936 ?auto_325937 ?auto_325938 ?auto_325939 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325955 - BLOCK
      ?auto_325956 - BLOCK
      ?auto_325957 - BLOCK
      ?auto_325958 - BLOCK
      ?auto_325959 - BLOCK
      ?auto_325960 - BLOCK
      ?auto_325961 - BLOCK
      ?auto_325962 - BLOCK
      ?auto_325963 - BLOCK
      ?auto_325964 - BLOCK
      ?auto_325965 - BLOCK
      ?auto_325966 - BLOCK
      ?auto_325967 - BLOCK
      ?auto_325968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_325968 ) ( ON-TABLE ?auto_325955 ) ( ON ?auto_325956 ?auto_325955 ) ( ON ?auto_325957 ?auto_325956 ) ( ON ?auto_325958 ?auto_325957 ) ( ON ?auto_325959 ?auto_325958 ) ( ON ?auto_325960 ?auto_325959 ) ( not ( = ?auto_325955 ?auto_325956 ) ) ( not ( = ?auto_325955 ?auto_325957 ) ) ( not ( = ?auto_325955 ?auto_325958 ) ) ( not ( = ?auto_325955 ?auto_325959 ) ) ( not ( = ?auto_325955 ?auto_325960 ) ) ( not ( = ?auto_325955 ?auto_325961 ) ) ( not ( = ?auto_325955 ?auto_325962 ) ) ( not ( = ?auto_325955 ?auto_325963 ) ) ( not ( = ?auto_325955 ?auto_325964 ) ) ( not ( = ?auto_325955 ?auto_325965 ) ) ( not ( = ?auto_325955 ?auto_325966 ) ) ( not ( = ?auto_325955 ?auto_325967 ) ) ( not ( = ?auto_325955 ?auto_325968 ) ) ( not ( = ?auto_325956 ?auto_325957 ) ) ( not ( = ?auto_325956 ?auto_325958 ) ) ( not ( = ?auto_325956 ?auto_325959 ) ) ( not ( = ?auto_325956 ?auto_325960 ) ) ( not ( = ?auto_325956 ?auto_325961 ) ) ( not ( = ?auto_325956 ?auto_325962 ) ) ( not ( = ?auto_325956 ?auto_325963 ) ) ( not ( = ?auto_325956 ?auto_325964 ) ) ( not ( = ?auto_325956 ?auto_325965 ) ) ( not ( = ?auto_325956 ?auto_325966 ) ) ( not ( = ?auto_325956 ?auto_325967 ) ) ( not ( = ?auto_325956 ?auto_325968 ) ) ( not ( = ?auto_325957 ?auto_325958 ) ) ( not ( = ?auto_325957 ?auto_325959 ) ) ( not ( = ?auto_325957 ?auto_325960 ) ) ( not ( = ?auto_325957 ?auto_325961 ) ) ( not ( = ?auto_325957 ?auto_325962 ) ) ( not ( = ?auto_325957 ?auto_325963 ) ) ( not ( = ?auto_325957 ?auto_325964 ) ) ( not ( = ?auto_325957 ?auto_325965 ) ) ( not ( = ?auto_325957 ?auto_325966 ) ) ( not ( = ?auto_325957 ?auto_325967 ) ) ( not ( = ?auto_325957 ?auto_325968 ) ) ( not ( = ?auto_325958 ?auto_325959 ) ) ( not ( = ?auto_325958 ?auto_325960 ) ) ( not ( = ?auto_325958 ?auto_325961 ) ) ( not ( = ?auto_325958 ?auto_325962 ) ) ( not ( = ?auto_325958 ?auto_325963 ) ) ( not ( = ?auto_325958 ?auto_325964 ) ) ( not ( = ?auto_325958 ?auto_325965 ) ) ( not ( = ?auto_325958 ?auto_325966 ) ) ( not ( = ?auto_325958 ?auto_325967 ) ) ( not ( = ?auto_325958 ?auto_325968 ) ) ( not ( = ?auto_325959 ?auto_325960 ) ) ( not ( = ?auto_325959 ?auto_325961 ) ) ( not ( = ?auto_325959 ?auto_325962 ) ) ( not ( = ?auto_325959 ?auto_325963 ) ) ( not ( = ?auto_325959 ?auto_325964 ) ) ( not ( = ?auto_325959 ?auto_325965 ) ) ( not ( = ?auto_325959 ?auto_325966 ) ) ( not ( = ?auto_325959 ?auto_325967 ) ) ( not ( = ?auto_325959 ?auto_325968 ) ) ( not ( = ?auto_325960 ?auto_325961 ) ) ( not ( = ?auto_325960 ?auto_325962 ) ) ( not ( = ?auto_325960 ?auto_325963 ) ) ( not ( = ?auto_325960 ?auto_325964 ) ) ( not ( = ?auto_325960 ?auto_325965 ) ) ( not ( = ?auto_325960 ?auto_325966 ) ) ( not ( = ?auto_325960 ?auto_325967 ) ) ( not ( = ?auto_325960 ?auto_325968 ) ) ( not ( = ?auto_325961 ?auto_325962 ) ) ( not ( = ?auto_325961 ?auto_325963 ) ) ( not ( = ?auto_325961 ?auto_325964 ) ) ( not ( = ?auto_325961 ?auto_325965 ) ) ( not ( = ?auto_325961 ?auto_325966 ) ) ( not ( = ?auto_325961 ?auto_325967 ) ) ( not ( = ?auto_325961 ?auto_325968 ) ) ( not ( = ?auto_325962 ?auto_325963 ) ) ( not ( = ?auto_325962 ?auto_325964 ) ) ( not ( = ?auto_325962 ?auto_325965 ) ) ( not ( = ?auto_325962 ?auto_325966 ) ) ( not ( = ?auto_325962 ?auto_325967 ) ) ( not ( = ?auto_325962 ?auto_325968 ) ) ( not ( = ?auto_325963 ?auto_325964 ) ) ( not ( = ?auto_325963 ?auto_325965 ) ) ( not ( = ?auto_325963 ?auto_325966 ) ) ( not ( = ?auto_325963 ?auto_325967 ) ) ( not ( = ?auto_325963 ?auto_325968 ) ) ( not ( = ?auto_325964 ?auto_325965 ) ) ( not ( = ?auto_325964 ?auto_325966 ) ) ( not ( = ?auto_325964 ?auto_325967 ) ) ( not ( = ?auto_325964 ?auto_325968 ) ) ( not ( = ?auto_325965 ?auto_325966 ) ) ( not ( = ?auto_325965 ?auto_325967 ) ) ( not ( = ?auto_325965 ?auto_325968 ) ) ( not ( = ?auto_325966 ?auto_325967 ) ) ( not ( = ?auto_325966 ?auto_325968 ) ) ( not ( = ?auto_325967 ?auto_325968 ) ) ( ON ?auto_325967 ?auto_325968 ) ( ON ?auto_325966 ?auto_325967 ) ( ON ?auto_325965 ?auto_325966 ) ( ON ?auto_325964 ?auto_325965 ) ( ON ?auto_325963 ?auto_325964 ) ( ON ?auto_325962 ?auto_325963 ) ( CLEAR ?auto_325960 ) ( ON ?auto_325961 ?auto_325962 ) ( CLEAR ?auto_325961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_325955 ?auto_325956 ?auto_325957 ?auto_325958 ?auto_325959 ?auto_325960 ?auto_325961 )
      ( MAKE-14PILE ?auto_325955 ?auto_325956 ?auto_325957 ?auto_325958 ?auto_325959 ?auto_325960 ?auto_325961 ?auto_325962 ?auto_325963 ?auto_325964 ?auto_325965 ?auto_325966 ?auto_325967 ?auto_325968 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_325983 - BLOCK
      ?auto_325984 - BLOCK
      ?auto_325985 - BLOCK
      ?auto_325986 - BLOCK
      ?auto_325987 - BLOCK
      ?auto_325988 - BLOCK
      ?auto_325989 - BLOCK
      ?auto_325990 - BLOCK
      ?auto_325991 - BLOCK
      ?auto_325992 - BLOCK
      ?auto_325993 - BLOCK
      ?auto_325994 - BLOCK
      ?auto_325995 - BLOCK
      ?auto_325996 - BLOCK
    )
    :vars
    (
      ?auto_325997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_325996 ?auto_325997 ) ( ON-TABLE ?auto_325983 ) ( ON ?auto_325984 ?auto_325983 ) ( ON ?auto_325985 ?auto_325984 ) ( ON ?auto_325986 ?auto_325985 ) ( ON ?auto_325987 ?auto_325986 ) ( not ( = ?auto_325983 ?auto_325984 ) ) ( not ( = ?auto_325983 ?auto_325985 ) ) ( not ( = ?auto_325983 ?auto_325986 ) ) ( not ( = ?auto_325983 ?auto_325987 ) ) ( not ( = ?auto_325983 ?auto_325988 ) ) ( not ( = ?auto_325983 ?auto_325989 ) ) ( not ( = ?auto_325983 ?auto_325990 ) ) ( not ( = ?auto_325983 ?auto_325991 ) ) ( not ( = ?auto_325983 ?auto_325992 ) ) ( not ( = ?auto_325983 ?auto_325993 ) ) ( not ( = ?auto_325983 ?auto_325994 ) ) ( not ( = ?auto_325983 ?auto_325995 ) ) ( not ( = ?auto_325983 ?auto_325996 ) ) ( not ( = ?auto_325983 ?auto_325997 ) ) ( not ( = ?auto_325984 ?auto_325985 ) ) ( not ( = ?auto_325984 ?auto_325986 ) ) ( not ( = ?auto_325984 ?auto_325987 ) ) ( not ( = ?auto_325984 ?auto_325988 ) ) ( not ( = ?auto_325984 ?auto_325989 ) ) ( not ( = ?auto_325984 ?auto_325990 ) ) ( not ( = ?auto_325984 ?auto_325991 ) ) ( not ( = ?auto_325984 ?auto_325992 ) ) ( not ( = ?auto_325984 ?auto_325993 ) ) ( not ( = ?auto_325984 ?auto_325994 ) ) ( not ( = ?auto_325984 ?auto_325995 ) ) ( not ( = ?auto_325984 ?auto_325996 ) ) ( not ( = ?auto_325984 ?auto_325997 ) ) ( not ( = ?auto_325985 ?auto_325986 ) ) ( not ( = ?auto_325985 ?auto_325987 ) ) ( not ( = ?auto_325985 ?auto_325988 ) ) ( not ( = ?auto_325985 ?auto_325989 ) ) ( not ( = ?auto_325985 ?auto_325990 ) ) ( not ( = ?auto_325985 ?auto_325991 ) ) ( not ( = ?auto_325985 ?auto_325992 ) ) ( not ( = ?auto_325985 ?auto_325993 ) ) ( not ( = ?auto_325985 ?auto_325994 ) ) ( not ( = ?auto_325985 ?auto_325995 ) ) ( not ( = ?auto_325985 ?auto_325996 ) ) ( not ( = ?auto_325985 ?auto_325997 ) ) ( not ( = ?auto_325986 ?auto_325987 ) ) ( not ( = ?auto_325986 ?auto_325988 ) ) ( not ( = ?auto_325986 ?auto_325989 ) ) ( not ( = ?auto_325986 ?auto_325990 ) ) ( not ( = ?auto_325986 ?auto_325991 ) ) ( not ( = ?auto_325986 ?auto_325992 ) ) ( not ( = ?auto_325986 ?auto_325993 ) ) ( not ( = ?auto_325986 ?auto_325994 ) ) ( not ( = ?auto_325986 ?auto_325995 ) ) ( not ( = ?auto_325986 ?auto_325996 ) ) ( not ( = ?auto_325986 ?auto_325997 ) ) ( not ( = ?auto_325987 ?auto_325988 ) ) ( not ( = ?auto_325987 ?auto_325989 ) ) ( not ( = ?auto_325987 ?auto_325990 ) ) ( not ( = ?auto_325987 ?auto_325991 ) ) ( not ( = ?auto_325987 ?auto_325992 ) ) ( not ( = ?auto_325987 ?auto_325993 ) ) ( not ( = ?auto_325987 ?auto_325994 ) ) ( not ( = ?auto_325987 ?auto_325995 ) ) ( not ( = ?auto_325987 ?auto_325996 ) ) ( not ( = ?auto_325987 ?auto_325997 ) ) ( not ( = ?auto_325988 ?auto_325989 ) ) ( not ( = ?auto_325988 ?auto_325990 ) ) ( not ( = ?auto_325988 ?auto_325991 ) ) ( not ( = ?auto_325988 ?auto_325992 ) ) ( not ( = ?auto_325988 ?auto_325993 ) ) ( not ( = ?auto_325988 ?auto_325994 ) ) ( not ( = ?auto_325988 ?auto_325995 ) ) ( not ( = ?auto_325988 ?auto_325996 ) ) ( not ( = ?auto_325988 ?auto_325997 ) ) ( not ( = ?auto_325989 ?auto_325990 ) ) ( not ( = ?auto_325989 ?auto_325991 ) ) ( not ( = ?auto_325989 ?auto_325992 ) ) ( not ( = ?auto_325989 ?auto_325993 ) ) ( not ( = ?auto_325989 ?auto_325994 ) ) ( not ( = ?auto_325989 ?auto_325995 ) ) ( not ( = ?auto_325989 ?auto_325996 ) ) ( not ( = ?auto_325989 ?auto_325997 ) ) ( not ( = ?auto_325990 ?auto_325991 ) ) ( not ( = ?auto_325990 ?auto_325992 ) ) ( not ( = ?auto_325990 ?auto_325993 ) ) ( not ( = ?auto_325990 ?auto_325994 ) ) ( not ( = ?auto_325990 ?auto_325995 ) ) ( not ( = ?auto_325990 ?auto_325996 ) ) ( not ( = ?auto_325990 ?auto_325997 ) ) ( not ( = ?auto_325991 ?auto_325992 ) ) ( not ( = ?auto_325991 ?auto_325993 ) ) ( not ( = ?auto_325991 ?auto_325994 ) ) ( not ( = ?auto_325991 ?auto_325995 ) ) ( not ( = ?auto_325991 ?auto_325996 ) ) ( not ( = ?auto_325991 ?auto_325997 ) ) ( not ( = ?auto_325992 ?auto_325993 ) ) ( not ( = ?auto_325992 ?auto_325994 ) ) ( not ( = ?auto_325992 ?auto_325995 ) ) ( not ( = ?auto_325992 ?auto_325996 ) ) ( not ( = ?auto_325992 ?auto_325997 ) ) ( not ( = ?auto_325993 ?auto_325994 ) ) ( not ( = ?auto_325993 ?auto_325995 ) ) ( not ( = ?auto_325993 ?auto_325996 ) ) ( not ( = ?auto_325993 ?auto_325997 ) ) ( not ( = ?auto_325994 ?auto_325995 ) ) ( not ( = ?auto_325994 ?auto_325996 ) ) ( not ( = ?auto_325994 ?auto_325997 ) ) ( not ( = ?auto_325995 ?auto_325996 ) ) ( not ( = ?auto_325995 ?auto_325997 ) ) ( not ( = ?auto_325996 ?auto_325997 ) ) ( ON ?auto_325995 ?auto_325996 ) ( ON ?auto_325994 ?auto_325995 ) ( ON ?auto_325993 ?auto_325994 ) ( ON ?auto_325992 ?auto_325993 ) ( ON ?auto_325991 ?auto_325992 ) ( ON ?auto_325990 ?auto_325991 ) ( ON ?auto_325989 ?auto_325990 ) ( CLEAR ?auto_325987 ) ( ON ?auto_325988 ?auto_325989 ) ( CLEAR ?auto_325988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_325983 ?auto_325984 ?auto_325985 ?auto_325986 ?auto_325987 ?auto_325988 )
      ( MAKE-14PILE ?auto_325983 ?auto_325984 ?auto_325985 ?auto_325986 ?auto_325987 ?auto_325988 ?auto_325989 ?auto_325990 ?auto_325991 ?auto_325992 ?auto_325993 ?auto_325994 ?auto_325995 ?auto_325996 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_326012 - BLOCK
      ?auto_326013 - BLOCK
      ?auto_326014 - BLOCK
      ?auto_326015 - BLOCK
      ?auto_326016 - BLOCK
      ?auto_326017 - BLOCK
      ?auto_326018 - BLOCK
      ?auto_326019 - BLOCK
      ?auto_326020 - BLOCK
      ?auto_326021 - BLOCK
      ?auto_326022 - BLOCK
      ?auto_326023 - BLOCK
      ?auto_326024 - BLOCK
      ?auto_326025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_326025 ) ( ON-TABLE ?auto_326012 ) ( ON ?auto_326013 ?auto_326012 ) ( ON ?auto_326014 ?auto_326013 ) ( ON ?auto_326015 ?auto_326014 ) ( ON ?auto_326016 ?auto_326015 ) ( not ( = ?auto_326012 ?auto_326013 ) ) ( not ( = ?auto_326012 ?auto_326014 ) ) ( not ( = ?auto_326012 ?auto_326015 ) ) ( not ( = ?auto_326012 ?auto_326016 ) ) ( not ( = ?auto_326012 ?auto_326017 ) ) ( not ( = ?auto_326012 ?auto_326018 ) ) ( not ( = ?auto_326012 ?auto_326019 ) ) ( not ( = ?auto_326012 ?auto_326020 ) ) ( not ( = ?auto_326012 ?auto_326021 ) ) ( not ( = ?auto_326012 ?auto_326022 ) ) ( not ( = ?auto_326012 ?auto_326023 ) ) ( not ( = ?auto_326012 ?auto_326024 ) ) ( not ( = ?auto_326012 ?auto_326025 ) ) ( not ( = ?auto_326013 ?auto_326014 ) ) ( not ( = ?auto_326013 ?auto_326015 ) ) ( not ( = ?auto_326013 ?auto_326016 ) ) ( not ( = ?auto_326013 ?auto_326017 ) ) ( not ( = ?auto_326013 ?auto_326018 ) ) ( not ( = ?auto_326013 ?auto_326019 ) ) ( not ( = ?auto_326013 ?auto_326020 ) ) ( not ( = ?auto_326013 ?auto_326021 ) ) ( not ( = ?auto_326013 ?auto_326022 ) ) ( not ( = ?auto_326013 ?auto_326023 ) ) ( not ( = ?auto_326013 ?auto_326024 ) ) ( not ( = ?auto_326013 ?auto_326025 ) ) ( not ( = ?auto_326014 ?auto_326015 ) ) ( not ( = ?auto_326014 ?auto_326016 ) ) ( not ( = ?auto_326014 ?auto_326017 ) ) ( not ( = ?auto_326014 ?auto_326018 ) ) ( not ( = ?auto_326014 ?auto_326019 ) ) ( not ( = ?auto_326014 ?auto_326020 ) ) ( not ( = ?auto_326014 ?auto_326021 ) ) ( not ( = ?auto_326014 ?auto_326022 ) ) ( not ( = ?auto_326014 ?auto_326023 ) ) ( not ( = ?auto_326014 ?auto_326024 ) ) ( not ( = ?auto_326014 ?auto_326025 ) ) ( not ( = ?auto_326015 ?auto_326016 ) ) ( not ( = ?auto_326015 ?auto_326017 ) ) ( not ( = ?auto_326015 ?auto_326018 ) ) ( not ( = ?auto_326015 ?auto_326019 ) ) ( not ( = ?auto_326015 ?auto_326020 ) ) ( not ( = ?auto_326015 ?auto_326021 ) ) ( not ( = ?auto_326015 ?auto_326022 ) ) ( not ( = ?auto_326015 ?auto_326023 ) ) ( not ( = ?auto_326015 ?auto_326024 ) ) ( not ( = ?auto_326015 ?auto_326025 ) ) ( not ( = ?auto_326016 ?auto_326017 ) ) ( not ( = ?auto_326016 ?auto_326018 ) ) ( not ( = ?auto_326016 ?auto_326019 ) ) ( not ( = ?auto_326016 ?auto_326020 ) ) ( not ( = ?auto_326016 ?auto_326021 ) ) ( not ( = ?auto_326016 ?auto_326022 ) ) ( not ( = ?auto_326016 ?auto_326023 ) ) ( not ( = ?auto_326016 ?auto_326024 ) ) ( not ( = ?auto_326016 ?auto_326025 ) ) ( not ( = ?auto_326017 ?auto_326018 ) ) ( not ( = ?auto_326017 ?auto_326019 ) ) ( not ( = ?auto_326017 ?auto_326020 ) ) ( not ( = ?auto_326017 ?auto_326021 ) ) ( not ( = ?auto_326017 ?auto_326022 ) ) ( not ( = ?auto_326017 ?auto_326023 ) ) ( not ( = ?auto_326017 ?auto_326024 ) ) ( not ( = ?auto_326017 ?auto_326025 ) ) ( not ( = ?auto_326018 ?auto_326019 ) ) ( not ( = ?auto_326018 ?auto_326020 ) ) ( not ( = ?auto_326018 ?auto_326021 ) ) ( not ( = ?auto_326018 ?auto_326022 ) ) ( not ( = ?auto_326018 ?auto_326023 ) ) ( not ( = ?auto_326018 ?auto_326024 ) ) ( not ( = ?auto_326018 ?auto_326025 ) ) ( not ( = ?auto_326019 ?auto_326020 ) ) ( not ( = ?auto_326019 ?auto_326021 ) ) ( not ( = ?auto_326019 ?auto_326022 ) ) ( not ( = ?auto_326019 ?auto_326023 ) ) ( not ( = ?auto_326019 ?auto_326024 ) ) ( not ( = ?auto_326019 ?auto_326025 ) ) ( not ( = ?auto_326020 ?auto_326021 ) ) ( not ( = ?auto_326020 ?auto_326022 ) ) ( not ( = ?auto_326020 ?auto_326023 ) ) ( not ( = ?auto_326020 ?auto_326024 ) ) ( not ( = ?auto_326020 ?auto_326025 ) ) ( not ( = ?auto_326021 ?auto_326022 ) ) ( not ( = ?auto_326021 ?auto_326023 ) ) ( not ( = ?auto_326021 ?auto_326024 ) ) ( not ( = ?auto_326021 ?auto_326025 ) ) ( not ( = ?auto_326022 ?auto_326023 ) ) ( not ( = ?auto_326022 ?auto_326024 ) ) ( not ( = ?auto_326022 ?auto_326025 ) ) ( not ( = ?auto_326023 ?auto_326024 ) ) ( not ( = ?auto_326023 ?auto_326025 ) ) ( not ( = ?auto_326024 ?auto_326025 ) ) ( ON ?auto_326024 ?auto_326025 ) ( ON ?auto_326023 ?auto_326024 ) ( ON ?auto_326022 ?auto_326023 ) ( ON ?auto_326021 ?auto_326022 ) ( ON ?auto_326020 ?auto_326021 ) ( ON ?auto_326019 ?auto_326020 ) ( ON ?auto_326018 ?auto_326019 ) ( CLEAR ?auto_326016 ) ( ON ?auto_326017 ?auto_326018 ) ( CLEAR ?auto_326017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_326012 ?auto_326013 ?auto_326014 ?auto_326015 ?auto_326016 ?auto_326017 )
      ( MAKE-14PILE ?auto_326012 ?auto_326013 ?auto_326014 ?auto_326015 ?auto_326016 ?auto_326017 ?auto_326018 ?auto_326019 ?auto_326020 ?auto_326021 ?auto_326022 ?auto_326023 ?auto_326024 ?auto_326025 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_326040 - BLOCK
      ?auto_326041 - BLOCK
      ?auto_326042 - BLOCK
      ?auto_326043 - BLOCK
      ?auto_326044 - BLOCK
      ?auto_326045 - BLOCK
      ?auto_326046 - BLOCK
      ?auto_326047 - BLOCK
      ?auto_326048 - BLOCK
      ?auto_326049 - BLOCK
      ?auto_326050 - BLOCK
      ?auto_326051 - BLOCK
      ?auto_326052 - BLOCK
      ?auto_326053 - BLOCK
    )
    :vars
    (
      ?auto_326054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326053 ?auto_326054 ) ( ON-TABLE ?auto_326040 ) ( ON ?auto_326041 ?auto_326040 ) ( ON ?auto_326042 ?auto_326041 ) ( ON ?auto_326043 ?auto_326042 ) ( not ( = ?auto_326040 ?auto_326041 ) ) ( not ( = ?auto_326040 ?auto_326042 ) ) ( not ( = ?auto_326040 ?auto_326043 ) ) ( not ( = ?auto_326040 ?auto_326044 ) ) ( not ( = ?auto_326040 ?auto_326045 ) ) ( not ( = ?auto_326040 ?auto_326046 ) ) ( not ( = ?auto_326040 ?auto_326047 ) ) ( not ( = ?auto_326040 ?auto_326048 ) ) ( not ( = ?auto_326040 ?auto_326049 ) ) ( not ( = ?auto_326040 ?auto_326050 ) ) ( not ( = ?auto_326040 ?auto_326051 ) ) ( not ( = ?auto_326040 ?auto_326052 ) ) ( not ( = ?auto_326040 ?auto_326053 ) ) ( not ( = ?auto_326040 ?auto_326054 ) ) ( not ( = ?auto_326041 ?auto_326042 ) ) ( not ( = ?auto_326041 ?auto_326043 ) ) ( not ( = ?auto_326041 ?auto_326044 ) ) ( not ( = ?auto_326041 ?auto_326045 ) ) ( not ( = ?auto_326041 ?auto_326046 ) ) ( not ( = ?auto_326041 ?auto_326047 ) ) ( not ( = ?auto_326041 ?auto_326048 ) ) ( not ( = ?auto_326041 ?auto_326049 ) ) ( not ( = ?auto_326041 ?auto_326050 ) ) ( not ( = ?auto_326041 ?auto_326051 ) ) ( not ( = ?auto_326041 ?auto_326052 ) ) ( not ( = ?auto_326041 ?auto_326053 ) ) ( not ( = ?auto_326041 ?auto_326054 ) ) ( not ( = ?auto_326042 ?auto_326043 ) ) ( not ( = ?auto_326042 ?auto_326044 ) ) ( not ( = ?auto_326042 ?auto_326045 ) ) ( not ( = ?auto_326042 ?auto_326046 ) ) ( not ( = ?auto_326042 ?auto_326047 ) ) ( not ( = ?auto_326042 ?auto_326048 ) ) ( not ( = ?auto_326042 ?auto_326049 ) ) ( not ( = ?auto_326042 ?auto_326050 ) ) ( not ( = ?auto_326042 ?auto_326051 ) ) ( not ( = ?auto_326042 ?auto_326052 ) ) ( not ( = ?auto_326042 ?auto_326053 ) ) ( not ( = ?auto_326042 ?auto_326054 ) ) ( not ( = ?auto_326043 ?auto_326044 ) ) ( not ( = ?auto_326043 ?auto_326045 ) ) ( not ( = ?auto_326043 ?auto_326046 ) ) ( not ( = ?auto_326043 ?auto_326047 ) ) ( not ( = ?auto_326043 ?auto_326048 ) ) ( not ( = ?auto_326043 ?auto_326049 ) ) ( not ( = ?auto_326043 ?auto_326050 ) ) ( not ( = ?auto_326043 ?auto_326051 ) ) ( not ( = ?auto_326043 ?auto_326052 ) ) ( not ( = ?auto_326043 ?auto_326053 ) ) ( not ( = ?auto_326043 ?auto_326054 ) ) ( not ( = ?auto_326044 ?auto_326045 ) ) ( not ( = ?auto_326044 ?auto_326046 ) ) ( not ( = ?auto_326044 ?auto_326047 ) ) ( not ( = ?auto_326044 ?auto_326048 ) ) ( not ( = ?auto_326044 ?auto_326049 ) ) ( not ( = ?auto_326044 ?auto_326050 ) ) ( not ( = ?auto_326044 ?auto_326051 ) ) ( not ( = ?auto_326044 ?auto_326052 ) ) ( not ( = ?auto_326044 ?auto_326053 ) ) ( not ( = ?auto_326044 ?auto_326054 ) ) ( not ( = ?auto_326045 ?auto_326046 ) ) ( not ( = ?auto_326045 ?auto_326047 ) ) ( not ( = ?auto_326045 ?auto_326048 ) ) ( not ( = ?auto_326045 ?auto_326049 ) ) ( not ( = ?auto_326045 ?auto_326050 ) ) ( not ( = ?auto_326045 ?auto_326051 ) ) ( not ( = ?auto_326045 ?auto_326052 ) ) ( not ( = ?auto_326045 ?auto_326053 ) ) ( not ( = ?auto_326045 ?auto_326054 ) ) ( not ( = ?auto_326046 ?auto_326047 ) ) ( not ( = ?auto_326046 ?auto_326048 ) ) ( not ( = ?auto_326046 ?auto_326049 ) ) ( not ( = ?auto_326046 ?auto_326050 ) ) ( not ( = ?auto_326046 ?auto_326051 ) ) ( not ( = ?auto_326046 ?auto_326052 ) ) ( not ( = ?auto_326046 ?auto_326053 ) ) ( not ( = ?auto_326046 ?auto_326054 ) ) ( not ( = ?auto_326047 ?auto_326048 ) ) ( not ( = ?auto_326047 ?auto_326049 ) ) ( not ( = ?auto_326047 ?auto_326050 ) ) ( not ( = ?auto_326047 ?auto_326051 ) ) ( not ( = ?auto_326047 ?auto_326052 ) ) ( not ( = ?auto_326047 ?auto_326053 ) ) ( not ( = ?auto_326047 ?auto_326054 ) ) ( not ( = ?auto_326048 ?auto_326049 ) ) ( not ( = ?auto_326048 ?auto_326050 ) ) ( not ( = ?auto_326048 ?auto_326051 ) ) ( not ( = ?auto_326048 ?auto_326052 ) ) ( not ( = ?auto_326048 ?auto_326053 ) ) ( not ( = ?auto_326048 ?auto_326054 ) ) ( not ( = ?auto_326049 ?auto_326050 ) ) ( not ( = ?auto_326049 ?auto_326051 ) ) ( not ( = ?auto_326049 ?auto_326052 ) ) ( not ( = ?auto_326049 ?auto_326053 ) ) ( not ( = ?auto_326049 ?auto_326054 ) ) ( not ( = ?auto_326050 ?auto_326051 ) ) ( not ( = ?auto_326050 ?auto_326052 ) ) ( not ( = ?auto_326050 ?auto_326053 ) ) ( not ( = ?auto_326050 ?auto_326054 ) ) ( not ( = ?auto_326051 ?auto_326052 ) ) ( not ( = ?auto_326051 ?auto_326053 ) ) ( not ( = ?auto_326051 ?auto_326054 ) ) ( not ( = ?auto_326052 ?auto_326053 ) ) ( not ( = ?auto_326052 ?auto_326054 ) ) ( not ( = ?auto_326053 ?auto_326054 ) ) ( ON ?auto_326052 ?auto_326053 ) ( ON ?auto_326051 ?auto_326052 ) ( ON ?auto_326050 ?auto_326051 ) ( ON ?auto_326049 ?auto_326050 ) ( ON ?auto_326048 ?auto_326049 ) ( ON ?auto_326047 ?auto_326048 ) ( ON ?auto_326046 ?auto_326047 ) ( ON ?auto_326045 ?auto_326046 ) ( CLEAR ?auto_326043 ) ( ON ?auto_326044 ?auto_326045 ) ( CLEAR ?auto_326044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_326040 ?auto_326041 ?auto_326042 ?auto_326043 ?auto_326044 )
      ( MAKE-14PILE ?auto_326040 ?auto_326041 ?auto_326042 ?auto_326043 ?auto_326044 ?auto_326045 ?auto_326046 ?auto_326047 ?auto_326048 ?auto_326049 ?auto_326050 ?auto_326051 ?auto_326052 ?auto_326053 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_326069 - BLOCK
      ?auto_326070 - BLOCK
      ?auto_326071 - BLOCK
      ?auto_326072 - BLOCK
      ?auto_326073 - BLOCK
      ?auto_326074 - BLOCK
      ?auto_326075 - BLOCK
      ?auto_326076 - BLOCK
      ?auto_326077 - BLOCK
      ?auto_326078 - BLOCK
      ?auto_326079 - BLOCK
      ?auto_326080 - BLOCK
      ?auto_326081 - BLOCK
      ?auto_326082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_326082 ) ( ON-TABLE ?auto_326069 ) ( ON ?auto_326070 ?auto_326069 ) ( ON ?auto_326071 ?auto_326070 ) ( ON ?auto_326072 ?auto_326071 ) ( not ( = ?auto_326069 ?auto_326070 ) ) ( not ( = ?auto_326069 ?auto_326071 ) ) ( not ( = ?auto_326069 ?auto_326072 ) ) ( not ( = ?auto_326069 ?auto_326073 ) ) ( not ( = ?auto_326069 ?auto_326074 ) ) ( not ( = ?auto_326069 ?auto_326075 ) ) ( not ( = ?auto_326069 ?auto_326076 ) ) ( not ( = ?auto_326069 ?auto_326077 ) ) ( not ( = ?auto_326069 ?auto_326078 ) ) ( not ( = ?auto_326069 ?auto_326079 ) ) ( not ( = ?auto_326069 ?auto_326080 ) ) ( not ( = ?auto_326069 ?auto_326081 ) ) ( not ( = ?auto_326069 ?auto_326082 ) ) ( not ( = ?auto_326070 ?auto_326071 ) ) ( not ( = ?auto_326070 ?auto_326072 ) ) ( not ( = ?auto_326070 ?auto_326073 ) ) ( not ( = ?auto_326070 ?auto_326074 ) ) ( not ( = ?auto_326070 ?auto_326075 ) ) ( not ( = ?auto_326070 ?auto_326076 ) ) ( not ( = ?auto_326070 ?auto_326077 ) ) ( not ( = ?auto_326070 ?auto_326078 ) ) ( not ( = ?auto_326070 ?auto_326079 ) ) ( not ( = ?auto_326070 ?auto_326080 ) ) ( not ( = ?auto_326070 ?auto_326081 ) ) ( not ( = ?auto_326070 ?auto_326082 ) ) ( not ( = ?auto_326071 ?auto_326072 ) ) ( not ( = ?auto_326071 ?auto_326073 ) ) ( not ( = ?auto_326071 ?auto_326074 ) ) ( not ( = ?auto_326071 ?auto_326075 ) ) ( not ( = ?auto_326071 ?auto_326076 ) ) ( not ( = ?auto_326071 ?auto_326077 ) ) ( not ( = ?auto_326071 ?auto_326078 ) ) ( not ( = ?auto_326071 ?auto_326079 ) ) ( not ( = ?auto_326071 ?auto_326080 ) ) ( not ( = ?auto_326071 ?auto_326081 ) ) ( not ( = ?auto_326071 ?auto_326082 ) ) ( not ( = ?auto_326072 ?auto_326073 ) ) ( not ( = ?auto_326072 ?auto_326074 ) ) ( not ( = ?auto_326072 ?auto_326075 ) ) ( not ( = ?auto_326072 ?auto_326076 ) ) ( not ( = ?auto_326072 ?auto_326077 ) ) ( not ( = ?auto_326072 ?auto_326078 ) ) ( not ( = ?auto_326072 ?auto_326079 ) ) ( not ( = ?auto_326072 ?auto_326080 ) ) ( not ( = ?auto_326072 ?auto_326081 ) ) ( not ( = ?auto_326072 ?auto_326082 ) ) ( not ( = ?auto_326073 ?auto_326074 ) ) ( not ( = ?auto_326073 ?auto_326075 ) ) ( not ( = ?auto_326073 ?auto_326076 ) ) ( not ( = ?auto_326073 ?auto_326077 ) ) ( not ( = ?auto_326073 ?auto_326078 ) ) ( not ( = ?auto_326073 ?auto_326079 ) ) ( not ( = ?auto_326073 ?auto_326080 ) ) ( not ( = ?auto_326073 ?auto_326081 ) ) ( not ( = ?auto_326073 ?auto_326082 ) ) ( not ( = ?auto_326074 ?auto_326075 ) ) ( not ( = ?auto_326074 ?auto_326076 ) ) ( not ( = ?auto_326074 ?auto_326077 ) ) ( not ( = ?auto_326074 ?auto_326078 ) ) ( not ( = ?auto_326074 ?auto_326079 ) ) ( not ( = ?auto_326074 ?auto_326080 ) ) ( not ( = ?auto_326074 ?auto_326081 ) ) ( not ( = ?auto_326074 ?auto_326082 ) ) ( not ( = ?auto_326075 ?auto_326076 ) ) ( not ( = ?auto_326075 ?auto_326077 ) ) ( not ( = ?auto_326075 ?auto_326078 ) ) ( not ( = ?auto_326075 ?auto_326079 ) ) ( not ( = ?auto_326075 ?auto_326080 ) ) ( not ( = ?auto_326075 ?auto_326081 ) ) ( not ( = ?auto_326075 ?auto_326082 ) ) ( not ( = ?auto_326076 ?auto_326077 ) ) ( not ( = ?auto_326076 ?auto_326078 ) ) ( not ( = ?auto_326076 ?auto_326079 ) ) ( not ( = ?auto_326076 ?auto_326080 ) ) ( not ( = ?auto_326076 ?auto_326081 ) ) ( not ( = ?auto_326076 ?auto_326082 ) ) ( not ( = ?auto_326077 ?auto_326078 ) ) ( not ( = ?auto_326077 ?auto_326079 ) ) ( not ( = ?auto_326077 ?auto_326080 ) ) ( not ( = ?auto_326077 ?auto_326081 ) ) ( not ( = ?auto_326077 ?auto_326082 ) ) ( not ( = ?auto_326078 ?auto_326079 ) ) ( not ( = ?auto_326078 ?auto_326080 ) ) ( not ( = ?auto_326078 ?auto_326081 ) ) ( not ( = ?auto_326078 ?auto_326082 ) ) ( not ( = ?auto_326079 ?auto_326080 ) ) ( not ( = ?auto_326079 ?auto_326081 ) ) ( not ( = ?auto_326079 ?auto_326082 ) ) ( not ( = ?auto_326080 ?auto_326081 ) ) ( not ( = ?auto_326080 ?auto_326082 ) ) ( not ( = ?auto_326081 ?auto_326082 ) ) ( ON ?auto_326081 ?auto_326082 ) ( ON ?auto_326080 ?auto_326081 ) ( ON ?auto_326079 ?auto_326080 ) ( ON ?auto_326078 ?auto_326079 ) ( ON ?auto_326077 ?auto_326078 ) ( ON ?auto_326076 ?auto_326077 ) ( ON ?auto_326075 ?auto_326076 ) ( ON ?auto_326074 ?auto_326075 ) ( CLEAR ?auto_326072 ) ( ON ?auto_326073 ?auto_326074 ) ( CLEAR ?auto_326073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_326069 ?auto_326070 ?auto_326071 ?auto_326072 ?auto_326073 )
      ( MAKE-14PILE ?auto_326069 ?auto_326070 ?auto_326071 ?auto_326072 ?auto_326073 ?auto_326074 ?auto_326075 ?auto_326076 ?auto_326077 ?auto_326078 ?auto_326079 ?auto_326080 ?auto_326081 ?auto_326082 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_326097 - BLOCK
      ?auto_326098 - BLOCK
      ?auto_326099 - BLOCK
      ?auto_326100 - BLOCK
      ?auto_326101 - BLOCK
      ?auto_326102 - BLOCK
      ?auto_326103 - BLOCK
      ?auto_326104 - BLOCK
      ?auto_326105 - BLOCK
      ?auto_326106 - BLOCK
      ?auto_326107 - BLOCK
      ?auto_326108 - BLOCK
      ?auto_326109 - BLOCK
      ?auto_326110 - BLOCK
    )
    :vars
    (
      ?auto_326111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326110 ?auto_326111 ) ( ON-TABLE ?auto_326097 ) ( ON ?auto_326098 ?auto_326097 ) ( ON ?auto_326099 ?auto_326098 ) ( not ( = ?auto_326097 ?auto_326098 ) ) ( not ( = ?auto_326097 ?auto_326099 ) ) ( not ( = ?auto_326097 ?auto_326100 ) ) ( not ( = ?auto_326097 ?auto_326101 ) ) ( not ( = ?auto_326097 ?auto_326102 ) ) ( not ( = ?auto_326097 ?auto_326103 ) ) ( not ( = ?auto_326097 ?auto_326104 ) ) ( not ( = ?auto_326097 ?auto_326105 ) ) ( not ( = ?auto_326097 ?auto_326106 ) ) ( not ( = ?auto_326097 ?auto_326107 ) ) ( not ( = ?auto_326097 ?auto_326108 ) ) ( not ( = ?auto_326097 ?auto_326109 ) ) ( not ( = ?auto_326097 ?auto_326110 ) ) ( not ( = ?auto_326097 ?auto_326111 ) ) ( not ( = ?auto_326098 ?auto_326099 ) ) ( not ( = ?auto_326098 ?auto_326100 ) ) ( not ( = ?auto_326098 ?auto_326101 ) ) ( not ( = ?auto_326098 ?auto_326102 ) ) ( not ( = ?auto_326098 ?auto_326103 ) ) ( not ( = ?auto_326098 ?auto_326104 ) ) ( not ( = ?auto_326098 ?auto_326105 ) ) ( not ( = ?auto_326098 ?auto_326106 ) ) ( not ( = ?auto_326098 ?auto_326107 ) ) ( not ( = ?auto_326098 ?auto_326108 ) ) ( not ( = ?auto_326098 ?auto_326109 ) ) ( not ( = ?auto_326098 ?auto_326110 ) ) ( not ( = ?auto_326098 ?auto_326111 ) ) ( not ( = ?auto_326099 ?auto_326100 ) ) ( not ( = ?auto_326099 ?auto_326101 ) ) ( not ( = ?auto_326099 ?auto_326102 ) ) ( not ( = ?auto_326099 ?auto_326103 ) ) ( not ( = ?auto_326099 ?auto_326104 ) ) ( not ( = ?auto_326099 ?auto_326105 ) ) ( not ( = ?auto_326099 ?auto_326106 ) ) ( not ( = ?auto_326099 ?auto_326107 ) ) ( not ( = ?auto_326099 ?auto_326108 ) ) ( not ( = ?auto_326099 ?auto_326109 ) ) ( not ( = ?auto_326099 ?auto_326110 ) ) ( not ( = ?auto_326099 ?auto_326111 ) ) ( not ( = ?auto_326100 ?auto_326101 ) ) ( not ( = ?auto_326100 ?auto_326102 ) ) ( not ( = ?auto_326100 ?auto_326103 ) ) ( not ( = ?auto_326100 ?auto_326104 ) ) ( not ( = ?auto_326100 ?auto_326105 ) ) ( not ( = ?auto_326100 ?auto_326106 ) ) ( not ( = ?auto_326100 ?auto_326107 ) ) ( not ( = ?auto_326100 ?auto_326108 ) ) ( not ( = ?auto_326100 ?auto_326109 ) ) ( not ( = ?auto_326100 ?auto_326110 ) ) ( not ( = ?auto_326100 ?auto_326111 ) ) ( not ( = ?auto_326101 ?auto_326102 ) ) ( not ( = ?auto_326101 ?auto_326103 ) ) ( not ( = ?auto_326101 ?auto_326104 ) ) ( not ( = ?auto_326101 ?auto_326105 ) ) ( not ( = ?auto_326101 ?auto_326106 ) ) ( not ( = ?auto_326101 ?auto_326107 ) ) ( not ( = ?auto_326101 ?auto_326108 ) ) ( not ( = ?auto_326101 ?auto_326109 ) ) ( not ( = ?auto_326101 ?auto_326110 ) ) ( not ( = ?auto_326101 ?auto_326111 ) ) ( not ( = ?auto_326102 ?auto_326103 ) ) ( not ( = ?auto_326102 ?auto_326104 ) ) ( not ( = ?auto_326102 ?auto_326105 ) ) ( not ( = ?auto_326102 ?auto_326106 ) ) ( not ( = ?auto_326102 ?auto_326107 ) ) ( not ( = ?auto_326102 ?auto_326108 ) ) ( not ( = ?auto_326102 ?auto_326109 ) ) ( not ( = ?auto_326102 ?auto_326110 ) ) ( not ( = ?auto_326102 ?auto_326111 ) ) ( not ( = ?auto_326103 ?auto_326104 ) ) ( not ( = ?auto_326103 ?auto_326105 ) ) ( not ( = ?auto_326103 ?auto_326106 ) ) ( not ( = ?auto_326103 ?auto_326107 ) ) ( not ( = ?auto_326103 ?auto_326108 ) ) ( not ( = ?auto_326103 ?auto_326109 ) ) ( not ( = ?auto_326103 ?auto_326110 ) ) ( not ( = ?auto_326103 ?auto_326111 ) ) ( not ( = ?auto_326104 ?auto_326105 ) ) ( not ( = ?auto_326104 ?auto_326106 ) ) ( not ( = ?auto_326104 ?auto_326107 ) ) ( not ( = ?auto_326104 ?auto_326108 ) ) ( not ( = ?auto_326104 ?auto_326109 ) ) ( not ( = ?auto_326104 ?auto_326110 ) ) ( not ( = ?auto_326104 ?auto_326111 ) ) ( not ( = ?auto_326105 ?auto_326106 ) ) ( not ( = ?auto_326105 ?auto_326107 ) ) ( not ( = ?auto_326105 ?auto_326108 ) ) ( not ( = ?auto_326105 ?auto_326109 ) ) ( not ( = ?auto_326105 ?auto_326110 ) ) ( not ( = ?auto_326105 ?auto_326111 ) ) ( not ( = ?auto_326106 ?auto_326107 ) ) ( not ( = ?auto_326106 ?auto_326108 ) ) ( not ( = ?auto_326106 ?auto_326109 ) ) ( not ( = ?auto_326106 ?auto_326110 ) ) ( not ( = ?auto_326106 ?auto_326111 ) ) ( not ( = ?auto_326107 ?auto_326108 ) ) ( not ( = ?auto_326107 ?auto_326109 ) ) ( not ( = ?auto_326107 ?auto_326110 ) ) ( not ( = ?auto_326107 ?auto_326111 ) ) ( not ( = ?auto_326108 ?auto_326109 ) ) ( not ( = ?auto_326108 ?auto_326110 ) ) ( not ( = ?auto_326108 ?auto_326111 ) ) ( not ( = ?auto_326109 ?auto_326110 ) ) ( not ( = ?auto_326109 ?auto_326111 ) ) ( not ( = ?auto_326110 ?auto_326111 ) ) ( ON ?auto_326109 ?auto_326110 ) ( ON ?auto_326108 ?auto_326109 ) ( ON ?auto_326107 ?auto_326108 ) ( ON ?auto_326106 ?auto_326107 ) ( ON ?auto_326105 ?auto_326106 ) ( ON ?auto_326104 ?auto_326105 ) ( ON ?auto_326103 ?auto_326104 ) ( ON ?auto_326102 ?auto_326103 ) ( ON ?auto_326101 ?auto_326102 ) ( CLEAR ?auto_326099 ) ( ON ?auto_326100 ?auto_326101 ) ( CLEAR ?auto_326100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_326097 ?auto_326098 ?auto_326099 ?auto_326100 )
      ( MAKE-14PILE ?auto_326097 ?auto_326098 ?auto_326099 ?auto_326100 ?auto_326101 ?auto_326102 ?auto_326103 ?auto_326104 ?auto_326105 ?auto_326106 ?auto_326107 ?auto_326108 ?auto_326109 ?auto_326110 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_326126 - BLOCK
      ?auto_326127 - BLOCK
      ?auto_326128 - BLOCK
      ?auto_326129 - BLOCK
      ?auto_326130 - BLOCK
      ?auto_326131 - BLOCK
      ?auto_326132 - BLOCK
      ?auto_326133 - BLOCK
      ?auto_326134 - BLOCK
      ?auto_326135 - BLOCK
      ?auto_326136 - BLOCK
      ?auto_326137 - BLOCK
      ?auto_326138 - BLOCK
      ?auto_326139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_326139 ) ( ON-TABLE ?auto_326126 ) ( ON ?auto_326127 ?auto_326126 ) ( ON ?auto_326128 ?auto_326127 ) ( not ( = ?auto_326126 ?auto_326127 ) ) ( not ( = ?auto_326126 ?auto_326128 ) ) ( not ( = ?auto_326126 ?auto_326129 ) ) ( not ( = ?auto_326126 ?auto_326130 ) ) ( not ( = ?auto_326126 ?auto_326131 ) ) ( not ( = ?auto_326126 ?auto_326132 ) ) ( not ( = ?auto_326126 ?auto_326133 ) ) ( not ( = ?auto_326126 ?auto_326134 ) ) ( not ( = ?auto_326126 ?auto_326135 ) ) ( not ( = ?auto_326126 ?auto_326136 ) ) ( not ( = ?auto_326126 ?auto_326137 ) ) ( not ( = ?auto_326126 ?auto_326138 ) ) ( not ( = ?auto_326126 ?auto_326139 ) ) ( not ( = ?auto_326127 ?auto_326128 ) ) ( not ( = ?auto_326127 ?auto_326129 ) ) ( not ( = ?auto_326127 ?auto_326130 ) ) ( not ( = ?auto_326127 ?auto_326131 ) ) ( not ( = ?auto_326127 ?auto_326132 ) ) ( not ( = ?auto_326127 ?auto_326133 ) ) ( not ( = ?auto_326127 ?auto_326134 ) ) ( not ( = ?auto_326127 ?auto_326135 ) ) ( not ( = ?auto_326127 ?auto_326136 ) ) ( not ( = ?auto_326127 ?auto_326137 ) ) ( not ( = ?auto_326127 ?auto_326138 ) ) ( not ( = ?auto_326127 ?auto_326139 ) ) ( not ( = ?auto_326128 ?auto_326129 ) ) ( not ( = ?auto_326128 ?auto_326130 ) ) ( not ( = ?auto_326128 ?auto_326131 ) ) ( not ( = ?auto_326128 ?auto_326132 ) ) ( not ( = ?auto_326128 ?auto_326133 ) ) ( not ( = ?auto_326128 ?auto_326134 ) ) ( not ( = ?auto_326128 ?auto_326135 ) ) ( not ( = ?auto_326128 ?auto_326136 ) ) ( not ( = ?auto_326128 ?auto_326137 ) ) ( not ( = ?auto_326128 ?auto_326138 ) ) ( not ( = ?auto_326128 ?auto_326139 ) ) ( not ( = ?auto_326129 ?auto_326130 ) ) ( not ( = ?auto_326129 ?auto_326131 ) ) ( not ( = ?auto_326129 ?auto_326132 ) ) ( not ( = ?auto_326129 ?auto_326133 ) ) ( not ( = ?auto_326129 ?auto_326134 ) ) ( not ( = ?auto_326129 ?auto_326135 ) ) ( not ( = ?auto_326129 ?auto_326136 ) ) ( not ( = ?auto_326129 ?auto_326137 ) ) ( not ( = ?auto_326129 ?auto_326138 ) ) ( not ( = ?auto_326129 ?auto_326139 ) ) ( not ( = ?auto_326130 ?auto_326131 ) ) ( not ( = ?auto_326130 ?auto_326132 ) ) ( not ( = ?auto_326130 ?auto_326133 ) ) ( not ( = ?auto_326130 ?auto_326134 ) ) ( not ( = ?auto_326130 ?auto_326135 ) ) ( not ( = ?auto_326130 ?auto_326136 ) ) ( not ( = ?auto_326130 ?auto_326137 ) ) ( not ( = ?auto_326130 ?auto_326138 ) ) ( not ( = ?auto_326130 ?auto_326139 ) ) ( not ( = ?auto_326131 ?auto_326132 ) ) ( not ( = ?auto_326131 ?auto_326133 ) ) ( not ( = ?auto_326131 ?auto_326134 ) ) ( not ( = ?auto_326131 ?auto_326135 ) ) ( not ( = ?auto_326131 ?auto_326136 ) ) ( not ( = ?auto_326131 ?auto_326137 ) ) ( not ( = ?auto_326131 ?auto_326138 ) ) ( not ( = ?auto_326131 ?auto_326139 ) ) ( not ( = ?auto_326132 ?auto_326133 ) ) ( not ( = ?auto_326132 ?auto_326134 ) ) ( not ( = ?auto_326132 ?auto_326135 ) ) ( not ( = ?auto_326132 ?auto_326136 ) ) ( not ( = ?auto_326132 ?auto_326137 ) ) ( not ( = ?auto_326132 ?auto_326138 ) ) ( not ( = ?auto_326132 ?auto_326139 ) ) ( not ( = ?auto_326133 ?auto_326134 ) ) ( not ( = ?auto_326133 ?auto_326135 ) ) ( not ( = ?auto_326133 ?auto_326136 ) ) ( not ( = ?auto_326133 ?auto_326137 ) ) ( not ( = ?auto_326133 ?auto_326138 ) ) ( not ( = ?auto_326133 ?auto_326139 ) ) ( not ( = ?auto_326134 ?auto_326135 ) ) ( not ( = ?auto_326134 ?auto_326136 ) ) ( not ( = ?auto_326134 ?auto_326137 ) ) ( not ( = ?auto_326134 ?auto_326138 ) ) ( not ( = ?auto_326134 ?auto_326139 ) ) ( not ( = ?auto_326135 ?auto_326136 ) ) ( not ( = ?auto_326135 ?auto_326137 ) ) ( not ( = ?auto_326135 ?auto_326138 ) ) ( not ( = ?auto_326135 ?auto_326139 ) ) ( not ( = ?auto_326136 ?auto_326137 ) ) ( not ( = ?auto_326136 ?auto_326138 ) ) ( not ( = ?auto_326136 ?auto_326139 ) ) ( not ( = ?auto_326137 ?auto_326138 ) ) ( not ( = ?auto_326137 ?auto_326139 ) ) ( not ( = ?auto_326138 ?auto_326139 ) ) ( ON ?auto_326138 ?auto_326139 ) ( ON ?auto_326137 ?auto_326138 ) ( ON ?auto_326136 ?auto_326137 ) ( ON ?auto_326135 ?auto_326136 ) ( ON ?auto_326134 ?auto_326135 ) ( ON ?auto_326133 ?auto_326134 ) ( ON ?auto_326132 ?auto_326133 ) ( ON ?auto_326131 ?auto_326132 ) ( ON ?auto_326130 ?auto_326131 ) ( CLEAR ?auto_326128 ) ( ON ?auto_326129 ?auto_326130 ) ( CLEAR ?auto_326129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_326126 ?auto_326127 ?auto_326128 ?auto_326129 )
      ( MAKE-14PILE ?auto_326126 ?auto_326127 ?auto_326128 ?auto_326129 ?auto_326130 ?auto_326131 ?auto_326132 ?auto_326133 ?auto_326134 ?auto_326135 ?auto_326136 ?auto_326137 ?auto_326138 ?auto_326139 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_326154 - BLOCK
      ?auto_326155 - BLOCK
      ?auto_326156 - BLOCK
      ?auto_326157 - BLOCK
      ?auto_326158 - BLOCK
      ?auto_326159 - BLOCK
      ?auto_326160 - BLOCK
      ?auto_326161 - BLOCK
      ?auto_326162 - BLOCK
      ?auto_326163 - BLOCK
      ?auto_326164 - BLOCK
      ?auto_326165 - BLOCK
      ?auto_326166 - BLOCK
      ?auto_326167 - BLOCK
    )
    :vars
    (
      ?auto_326168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326167 ?auto_326168 ) ( ON-TABLE ?auto_326154 ) ( ON ?auto_326155 ?auto_326154 ) ( not ( = ?auto_326154 ?auto_326155 ) ) ( not ( = ?auto_326154 ?auto_326156 ) ) ( not ( = ?auto_326154 ?auto_326157 ) ) ( not ( = ?auto_326154 ?auto_326158 ) ) ( not ( = ?auto_326154 ?auto_326159 ) ) ( not ( = ?auto_326154 ?auto_326160 ) ) ( not ( = ?auto_326154 ?auto_326161 ) ) ( not ( = ?auto_326154 ?auto_326162 ) ) ( not ( = ?auto_326154 ?auto_326163 ) ) ( not ( = ?auto_326154 ?auto_326164 ) ) ( not ( = ?auto_326154 ?auto_326165 ) ) ( not ( = ?auto_326154 ?auto_326166 ) ) ( not ( = ?auto_326154 ?auto_326167 ) ) ( not ( = ?auto_326154 ?auto_326168 ) ) ( not ( = ?auto_326155 ?auto_326156 ) ) ( not ( = ?auto_326155 ?auto_326157 ) ) ( not ( = ?auto_326155 ?auto_326158 ) ) ( not ( = ?auto_326155 ?auto_326159 ) ) ( not ( = ?auto_326155 ?auto_326160 ) ) ( not ( = ?auto_326155 ?auto_326161 ) ) ( not ( = ?auto_326155 ?auto_326162 ) ) ( not ( = ?auto_326155 ?auto_326163 ) ) ( not ( = ?auto_326155 ?auto_326164 ) ) ( not ( = ?auto_326155 ?auto_326165 ) ) ( not ( = ?auto_326155 ?auto_326166 ) ) ( not ( = ?auto_326155 ?auto_326167 ) ) ( not ( = ?auto_326155 ?auto_326168 ) ) ( not ( = ?auto_326156 ?auto_326157 ) ) ( not ( = ?auto_326156 ?auto_326158 ) ) ( not ( = ?auto_326156 ?auto_326159 ) ) ( not ( = ?auto_326156 ?auto_326160 ) ) ( not ( = ?auto_326156 ?auto_326161 ) ) ( not ( = ?auto_326156 ?auto_326162 ) ) ( not ( = ?auto_326156 ?auto_326163 ) ) ( not ( = ?auto_326156 ?auto_326164 ) ) ( not ( = ?auto_326156 ?auto_326165 ) ) ( not ( = ?auto_326156 ?auto_326166 ) ) ( not ( = ?auto_326156 ?auto_326167 ) ) ( not ( = ?auto_326156 ?auto_326168 ) ) ( not ( = ?auto_326157 ?auto_326158 ) ) ( not ( = ?auto_326157 ?auto_326159 ) ) ( not ( = ?auto_326157 ?auto_326160 ) ) ( not ( = ?auto_326157 ?auto_326161 ) ) ( not ( = ?auto_326157 ?auto_326162 ) ) ( not ( = ?auto_326157 ?auto_326163 ) ) ( not ( = ?auto_326157 ?auto_326164 ) ) ( not ( = ?auto_326157 ?auto_326165 ) ) ( not ( = ?auto_326157 ?auto_326166 ) ) ( not ( = ?auto_326157 ?auto_326167 ) ) ( not ( = ?auto_326157 ?auto_326168 ) ) ( not ( = ?auto_326158 ?auto_326159 ) ) ( not ( = ?auto_326158 ?auto_326160 ) ) ( not ( = ?auto_326158 ?auto_326161 ) ) ( not ( = ?auto_326158 ?auto_326162 ) ) ( not ( = ?auto_326158 ?auto_326163 ) ) ( not ( = ?auto_326158 ?auto_326164 ) ) ( not ( = ?auto_326158 ?auto_326165 ) ) ( not ( = ?auto_326158 ?auto_326166 ) ) ( not ( = ?auto_326158 ?auto_326167 ) ) ( not ( = ?auto_326158 ?auto_326168 ) ) ( not ( = ?auto_326159 ?auto_326160 ) ) ( not ( = ?auto_326159 ?auto_326161 ) ) ( not ( = ?auto_326159 ?auto_326162 ) ) ( not ( = ?auto_326159 ?auto_326163 ) ) ( not ( = ?auto_326159 ?auto_326164 ) ) ( not ( = ?auto_326159 ?auto_326165 ) ) ( not ( = ?auto_326159 ?auto_326166 ) ) ( not ( = ?auto_326159 ?auto_326167 ) ) ( not ( = ?auto_326159 ?auto_326168 ) ) ( not ( = ?auto_326160 ?auto_326161 ) ) ( not ( = ?auto_326160 ?auto_326162 ) ) ( not ( = ?auto_326160 ?auto_326163 ) ) ( not ( = ?auto_326160 ?auto_326164 ) ) ( not ( = ?auto_326160 ?auto_326165 ) ) ( not ( = ?auto_326160 ?auto_326166 ) ) ( not ( = ?auto_326160 ?auto_326167 ) ) ( not ( = ?auto_326160 ?auto_326168 ) ) ( not ( = ?auto_326161 ?auto_326162 ) ) ( not ( = ?auto_326161 ?auto_326163 ) ) ( not ( = ?auto_326161 ?auto_326164 ) ) ( not ( = ?auto_326161 ?auto_326165 ) ) ( not ( = ?auto_326161 ?auto_326166 ) ) ( not ( = ?auto_326161 ?auto_326167 ) ) ( not ( = ?auto_326161 ?auto_326168 ) ) ( not ( = ?auto_326162 ?auto_326163 ) ) ( not ( = ?auto_326162 ?auto_326164 ) ) ( not ( = ?auto_326162 ?auto_326165 ) ) ( not ( = ?auto_326162 ?auto_326166 ) ) ( not ( = ?auto_326162 ?auto_326167 ) ) ( not ( = ?auto_326162 ?auto_326168 ) ) ( not ( = ?auto_326163 ?auto_326164 ) ) ( not ( = ?auto_326163 ?auto_326165 ) ) ( not ( = ?auto_326163 ?auto_326166 ) ) ( not ( = ?auto_326163 ?auto_326167 ) ) ( not ( = ?auto_326163 ?auto_326168 ) ) ( not ( = ?auto_326164 ?auto_326165 ) ) ( not ( = ?auto_326164 ?auto_326166 ) ) ( not ( = ?auto_326164 ?auto_326167 ) ) ( not ( = ?auto_326164 ?auto_326168 ) ) ( not ( = ?auto_326165 ?auto_326166 ) ) ( not ( = ?auto_326165 ?auto_326167 ) ) ( not ( = ?auto_326165 ?auto_326168 ) ) ( not ( = ?auto_326166 ?auto_326167 ) ) ( not ( = ?auto_326166 ?auto_326168 ) ) ( not ( = ?auto_326167 ?auto_326168 ) ) ( ON ?auto_326166 ?auto_326167 ) ( ON ?auto_326165 ?auto_326166 ) ( ON ?auto_326164 ?auto_326165 ) ( ON ?auto_326163 ?auto_326164 ) ( ON ?auto_326162 ?auto_326163 ) ( ON ?auto_326161 ?auto_326162 ) ( ON ?auto_326160 ?auto_326161 ) ( ON ?auto_326159 ?auto_326160 ) ( ON ?auto_326158 ?auto_326159 ) ( ON ?auto_326157 ?auto_326158 ) ( CLEAR ?auto_326155 ) ( ON ?auto_326156 ?auto_326157 ) ( CLEAR ?auto_326156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_326154 ?auto_326155 ?auto_326156 )
      ( MAKE-14PILE ?auto_326154 ?auto_326155 ?auto_326156 ?auto_326157 ?auto_326158 ?auto_326159 ?auto_326160 ?auto_326161 ?auto_326162 ?auto_326163 ?auto_326164 ?auto_326165 ?auto_326166 ?auto_326167 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_326183 - BLOCK
      ?auto_326184 - BLOCK
      ?auto_326185 - BLOCK
      ?auto_326186 - BLOCK
      ?auto_326187 - BLOCK
      ?auto_326188 - BLOCK
      ?auto_326189 - BLOCK
      ?auto_326190 - BLOCK
      ?auto_326191 - BLOCK
      ?auto_326192 - BLOCK
      ?auto_326193 - BLOCK
      ?auto_326194 - BLOCK
      ?auto_326195 - BLOCK
      ?auto_326196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_326196 ) ( ON-TABLE ?auto_326183 ) ( ON ?auto_326184 ?auto_326183 ) ( not ( = ?auto_326183 ?auto_326184 ) ) ( not ( = ?auto_326183 ?auto_326185 ) ) ( not ( = ?auto_326183 ?auto_326186 ) ) ( not ( = ?auto_326183 ?auto_326187 ) ) ( not ( = ?auto_326183 ?auto_326188 ) ) ( not ( = ?auto_326183 ?auto_326189 ) ) ( not ( = ?auto_326183 ?auto_326190 ) ) ( not ( = ?auto_326183 ?auto_326191 ) ) ( not ( = ?auto_326183 ?auto_326192 ) ) ( not ( = ?auto_326183 ?auto_326193 ) ) ( not ( = ?auto_326183 ?auto_326194 ) ) ( not ( = ?auto_326183 ?auto_326195 ) ) ( not ( = ?auto_326183 ?auto_326196 ) ) ( not ( = ?auto_326184 ?auto_326185 ) ) ( not ( = ?auto_326184 ?auto_326186 ) ) ( not ( = ?auto_326184 ?auto_326187 ) ) ( not ( = ?auto_326184 ?auto_326188 ) ) ( not ( = ?auto_326184 ?auto_326189 ) ) ( not ( = ?auto_326184 ?auto_326190 ) ) ( not ( = ?auto_326184 ?auto_326191 ) ) ( not ( = ?auto_326184 ?auto_326192 ) ) ( not ( = ?auto_326184 ?auto_326193 ) ) ( not ( = ?auto_326184 ?auto_326194 ) ) ( not ( = ?auto_326184 ?auto_326195 ) ) ( not ( = ?auto_326184 ?auto_326196 ) ) ( not ( = ?auto_326185 ?auto_326186 ) ) ( not ( = ?auto_326185 ?auto_326187 ) ) ( not ( = ?auto_326185 ?auto_326188 ) ) ( not ( = ?auto_326185 ?auto_326189 ) ) ( not ( = ?auto_326185 ?auto_326190 ) ) ( not ( = ?auto_326185 ?auto_326191 ) ) ( not ( = ?auto_326185 ?auto_326192 ) ) ( not ( = ?auto_326185 ?auto_326193 ) ) ( not ( = ?auto_326185 ?auto_326194 ) ) ( not ( = ?auto_326185 ?auto_326195 ) ) ( not ( = ?auto_326185 ?auto_326196 ) ) ( not ( = ?auto_326186 ?auto_326187 ) ) ( not ( = ?auto_326186 ?auto_326188 ) ) ( not ( = ?auto_326186 ?auto_326189 ) ) ( not ( = ?auto_326186 ?auto_326190 ) ) ( not ( = ?auto_326186 ?auto_326191 ) ) ( not ( = ?auto_326186 ?auto_326192 ) ) ( not ( = ?auto_326186 ?auto_326193 ) ) ( not ( = ?auto_326186 ?auto_326194 ) ) ( not ( = ?auto_326186 ?auto_326195 ) ) ( not ( = ?auto_326186 ?auto_326196 ) ) ( not ( = ?auto_326187 ?auto_326188 ) ) ( not ( = ?auto_326187 ?auto_326189 ) ) ( not ( = ?auto_326187 ?auto_326190 ) ) ( not ( = ?auto_326187 ?auto_326191 ) ) ( not ( = ?auto_326187 ?auto_326192 ) ) ( not ( = ?auto_326187 ?auto_326193 ) ) ( not ( = ?auto_326187 ?auto_326194 ) ) ( not ( = ?auto_326187 ?auto_326195 ) ) ( not ( = ?auto_326187 ?auto_326196 ) ) ( not ( = ?auto_326188 ?auto_326189 ) ) ( not ( = ?auto_326188 ?auto_326190 ) ) ( not ( = ?auto_326188 ?auto_326191 ) ) ( not ( = ?auto_326188 ?auto_326192 ) ) ( not ( = ?auto_326188 ?auto_326193 ) ) ( not ( = ?auto_326188 ?auto_326194 ) ) ( not ( = ?auto_326188 ?auto_326195 ) ) ( not ( = ?auto_326188 ?auto_326196 ) ) ( not ( = ?auto_326189 ?auto_326190 ) ) ( not ( = ?auto_326189 ?auto_326191 ) ) ( not ( = ?auto_326189 ?auto_326192 ) ) ( not ( = ?auto_326189 ?auto_326193 ) ) ( not ( = ?auto_326189 ?auto_326194 ) ) ( not ( = ?auto_326189 ?auto_326195 ) ) ( not ( = ?auto_326189 ?auto_326196 ) ) ( not ( = ?auto_326190 ?auto_326191 ) ) ( not ( = ?auto_326190 ?auto_326192 ) ) ( not ( = ?auto_326190 ?auto_326193 ) ) ( not ( = ?auto_326190 ?auto_326194 ) ) ( not ( = ?auto_326190 ?auto_326195 ) ) ( not ( = ?auto_326190 ?auto_326196 ) ) ( not ( = ?auto_326191 ?auto_326192 ) ) ( not ( = ?auto_326191 ?auto_326193 ) ) ( not ( = ?auto_326191 ?auto_326194 ) ) ( not ( = ?auto_326191 ?auto_326195 ) ) ( not ( = ?auto_326191 ?auto_326196 ) ) ( not ( = ?auto_326192 ?auto_326193 ) ) ( not ( = ?auto_326192 ?auto_326194 ) ) ( not ( = ?auto_326192 ?auto_326195 ) ) ( not ( = ?auto_326192 ?auto_326196 ) ) ( not ( = ?auto_326193 ?auto_326194 ) ) ( not ( = ?auto_326193 ?auto_326195 ) ) ( not ( = ?auto_326193 ?auto_326196 ) ) ( not ( = ?auto_326194 ?auto_326195 ) ) ( not ( = ?auto_326194 ?auto_326196 ) ) ( not ( = ?auto_326195 ?auto_326196 ) ) ( ON ?auto_326195 ?auto_326196 ) ( ON ?auto_326194 ?auto_326195 ) ( ON ?auto_326193 ?auto_326194 ) ( ON ?auto_326192 ?auto_326193 ) ( ON ?auto_326191 ?auto_326192 ) ( ON ?auto_326190 ?auto_326191 ) ( ON ?auto_326189 ?auto_326190 ) ( ON ?auto_326188 ?auto_326189 ) ( ON ?auto_326187 ?auto_326188 ) ( ON ?auto_326186 ?auto_326187 ) ( CLEAR ?auto_326184 ) ( ON ?auto_326185 ?auto_326186 ) ( CLEAR ?auto_326185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_326183 ?auto_326184 ?auto_326185 )
      ( MAKE-14PILE ?auto_326183 ?auto_326184 ?auto_326185 ?auto_326186 ?auto_326187 ?auto_326188 ?auto_326189 ?auto_326190 ?auto_326191 ?auto_326192 ?auto_326193 ?auto_326194 ?auto_326195 ?auto_326196 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_326211 - BLOCK
      ?auto_326212 - BLOCK
      ?auto_326213 - BLOCK
      ?auto_326214 - BLOCK
      ?auto_326215 - BLOCK
      ?auto_326216 - BLOCK
      ?auto_326217 - BLOCK
      ?auto_326218 - BLOCK
      ?auto_326219 - BLOCK
      ?auto_326220 - BLOCK
      ?auto_326221 - BLOCK
      ?auto_326222 - BLOCK
      ?auto_326223 - BLOCK
      ?auto_326224 - BLOCK
    )
    :vars
    (
      ?auto_326225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326224 ?auto_326225 ) ( ON-TABLE ?auto_326211 ) ( not ( = ?auto_326211 ?auto_326212 ) ) ( not ( = ?auto_326211 ?auto_326213 ) ) ( not ( = ?auto_326211 ?auto_326214 ) ) ( not ( = ?auto_326211 ?auto_326215 ) ) ( not ( = ?auto_326211 ?auto_326216 ) ) ( not ( = ?auto_326211 ?auto_326217 ) ) ( not ( = ?auto_326211 ?auto_326218 ) ) ( not ( = ?auto_326211 ?auto_326219 ) ) ( not ( = ?auto_326211 ?auto_326220 ) ) ( not ( = ?auto_326211 ?auto_326221 ) ) ( not ( = ?auto_326211 ?auto_326222 ) ) ( not ( = ?auto_326211 ?auto_326223 ) ) ( not ( = ?auto_326211 ?auto_326224 ) ) ( not ( = ?auto_326211 ?auto_326225 ) ) ( not ( = ?auto_326212 ?auto_326213 ) ) ( not ( = ?auto_326212 ?auto_326214 ) ) ( not ( = ?auto_326212 ?auto_326215 ) ) ( not ( = ?auto_326212 ?auto_326216 ) ) ( not ( = ?auto_326212 ?auto_326217 ) ) ( not ( = ?auto_326212 ?auto_326218 ) ) ( not ( = ?auto_326212 ?auto_326219 ) ) ( not ( = ?auto_326212 ?auto_326220 ) ) ( not ( = ?auto_326212 ?auto_326221 ) ) ( not ( = ?auto_326212 ?auto_326222 ) ) ( not ( = ?auto_326212 ?auto_326223 ) ) ( not ( = ?auto_326212 ?auto_326224 ) ) ( not ( = ?auto_326212 ?auto_326225 ) ) ( not ( = ?auto_326213 ?auto_326214 ) ) ( not ( = ?auto_326213 ?auto_326215 ) ) ( not ( = ?auto_326213 ?auto_326216 ) ) ( not ( = ?auto_326213 ?auto_326217 ) ) ( not ( = ?auto_326213 ?auto_326218 ) ) ( not ( = ?auto_326213 ?auto_326219 ) ) ( not ( = ?auto_326213 ?auto_326220 ) ) ( not ( = ?auto_326213 ?auto_326221 ) ) ( not ( = ?auto_326213 ?auto_326222 ) ) ( not ( = ?auto_326213 ?auto_326223 ) ) ( not ( = ?auto_326213 ?auto_326224 ) ) ( not ( = ?auto_326213 ?auto_326225 ) ) ( not ( = ?auto_326214 ?auto_326215 ) ) ( not ( = ?auto_326214 ?auto_326216 ) ) ( not ( = ?auto_326214 ?auto_326217 ) ) ( not ( = ?auto_326214 ?auto_326218 ) ) ( not ( = ?auto_326214 ?auto_326219 ) ) ( not ( = ?auto_326214 ?auto_326220 ) ) ( not ( = ?auto_326214 ?auto_326221 ) ) ( not ( = ?auto_326214 ?auto_326222 ) ) ( not ( = ?auto_326214 ?auto_326223 ) ) ( not ( = ?auto_326214 ?auto_326224 ) ) ( not ( = ?auto_326214 ?auto_326225 ) ) ( not ( = ?auto_326215 ?auto_326216 ) ) ( not ( = ?auto_326215 ?auto_326217 ) ) ( not ( = ?auto_326215 ?auto_326218 ) ) ( not ( = ?auto_326215 ?auto_326219 ) ) ( not ( = ?auto_326215 ?auto_326220 ) ) ( not ( = ?auto_326215 ?auto_326221 ) ) ( not ( = ?auto_326215 ?auto_326222 ) ) ( not ( = ?auto_326215 ?auto_326223 ) ) ( not ( = ?auto_326215 ?auto_326224 ) ) ( not ( = ?auto_326215 ?auto_326225 ) ) ( not ( = ?auto_326216 ?auto_326217 ) ) ( not ( = ?auto_326216 ?auto_326218 ) ) ( not ( = ?auto_326216 ?auto_326219 ) ) ( not ( = ?auto_326216 ?auto_326220 ) ) ( not ( = ?auto_326216 ?auto_326221 ) ) ( not ( = ?auto_326216 ?auto_326222 ) ) ( not ( = ?auto_326216 ?auto_326223 ) ) ( not ( = ?auto_326216 ?auto_326224 ) ) ( not ( = ?auto_326216 ?auto_326225 ) ) ( not ( = ?auto_326217 ?auto_326218 ) ) ( not ( = ?auto_326217 ?auto_326219 ) ) ( not ( = ?auto_326217 ?auto_326220 ) ) ( not ( = ?auto_326217 ?auto_326221 ) ) ( not ( = ?auto_326217 ?auto_326222 ) ) ( not ( = ?auto_326217 ?auto_326223 ) ) ( not ( = ?auto_326217 ?auto_326224 ) ) ( not ( = ?auto_326217 ?auto_326225 ) ) ( not ( = ?auto_326218 ?auto_326219 ) ) ( not ( = ?auto_326218 ?auto_326220 ) ) ( not ( = ?auto_326218 ?auto_326221 ) ) ( not ( = ?auto_326218 ?auto_326222 ) ) ( not ( = ?auto_326218 ?auto_326223 ) ) ( not ( = ?auto_326218 ?auto_326224 ) ) ( not ( = ?auto_326218 ?auto_326225 ) ) ( not ( = ?auto_326219 ?auto_326220 ) ) ( not ( = ?auto_326219 ?auto_326221 ) ) ( not ( = ?auto_326219 ?auto_326222 ) ) ( not ( = ?auto_326219 ?auto_326223 ) ) ( not ( = ?auto_326219 ?auto_326224 ) ) ( not ( = ?auto_326219 ?auto_326225 ) ) ( not ( = ?auto_326220 ?auto_326221 ) ) ( not ( = ?auto_326220 ?auto_326222 ) ) ( not ( = ?auto_326220 ?auto_326223 ) ) ( not ( = ?auto_326220 ?auto_326224 ) ) ( not ( = ?auto_326220 ?auto_326225 ) ) ( not ( = ?auto_326221 ?auto_326222 ) ) ( not ( = ?auto_326221 ?auto_326223 ) ) ( not ( = ?auto_326221 ?auto_326224 ) ) ( not ( = ?auto_326221 ?auto_326225 ) ) ( not ( = ?auto_326222 ?auto_326223 ) ) ( not ( = ?auto_326222 ?auto_326224 ) ) ( not ( = ?auto_326222 ?auto_326225 ) ) ( not ( = ?auto_326223 ?auto_326224 ) ) ( not ( = ?auto_326223 ?auto_326225 ) ) ( not ( = ?auto_326224 ?auto_326225 ) ) ( ON ?auto_326223 ?auto_326224 ) ( ON ?auto_326222 ?auto_326223 ) ( ON ?auto_326221 ?auto_326222 ) ( ON ?auto_326220 ?auto_326221 ) ( ON ?auto_326219 ?auto_326220 ) ( ON ?auto_326218 ?auto_326219 ) ( ON ?auto_326217 ?auto_326218 ) ( ON ?auto_326216 ?auto_326217 ) ( ON ?auto_326215 ?auto_326216 ) ( ON ?auto_326214 ?auto_326215 ) ( ON ?auto_326213 ?auto_326214 ) ( CLEAR ?auto_326211 ) ( ON ?auto_326212 ?auto_326213 ) ( CLEAR ?auto_326212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_326211 ?auto_326212 )
      ( MAKE-14PILE ?auto_326211 ?auto_326212 ?auto_326213 ?auto_326214 ?auto_326215 ?auto_326216 ?auto_326217 ?auto_326218 ?auto_326219 ?auto_326220 ?auto_326221 ?auto_326222 ?auto_326223 ?auto_326224 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_326240 - BLOCK
      ?auto_326241 - BLOCK
      ?auto_326242 - BLOCK
      ?auto_326243 - BLOCK
      ?auto_326244 - BLOCK
      ?auto_326245 - BLOCK
      ?auto_326246 - BLOCK
      ?auto_326247 - BLOCK
      ?auto_326248 - BLOCK
      ?auto_326249 - BLOCK
      ?auto_326250 - BLOCK
      ?auto_326251 - BLOCK
      ?auto_326252 - BLOCK
      ?auto_326253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_326253 ) ( ON-TABLE ?auto_326240 ) ( not ( = ?auto_326240 ?auto_326241 ) ) ( not ( = ?auto_326240 ?auto_326242 ) ) ( not ( = ?auto_326240 ?auto_326243 ) ) ( not ( = ?auto_326240 ?auto_326244 ) ) ( not ( = ?auto_326240 ?auto_326245 ) ) ( not ( = ?auto_326240 ?auto_326246 ) ) ( not ( = ?auto_326240 ?auto_326247 ) ) ( not ( = ?auto_326240 ?auto_326248 ) ) ( not ( = ?auto_326240 ?auto_326249 ) ) ( not ( = ?auto_326240 ?auto_326250 ) ) ( not ( = ?auto_326240 ?auto_326251 ) ) ( not ( = ?auto_326240 ?auto_326252 ) ) ( not ( = ?auto_326240 ?auto_326253 ) ) ( not ( = ?auto_326241 ?auto_326242 ) ) ( not ( = ?auto_326241 ?auto_326243 ) ) ( not ( = ?auto_326241 ?auto_326244 ) ) ( not ( = ?auto_326241 ?auto_326245 ) ) ( not ( = ?auto_326241 ?auto_326246 ) ) ( not ( = ?auto_326241 ?auto_326247 ) ) ( not ( = ?auto_326241 ?auto_326248 ) ) ( not ( = ?auto_326241 ?auto_326249 ) ) ( not ( = ?auto_326241 ?auto_326250 ) ) ( not ( = ?auto_326241 ?auto_326251 ) ) ( not ( = ?auto_326241 ?auto_326252 ) ) ( not ( = ?auto_326241 ?auto_326253 ) ) ( not ( = ?auto_326242 ?auto_326243 ) ) ( not ( = ?auto_326242 ?auto_326244 ) ) ( not ( = ?auto_326242 ?auto_326245 ) ) ( not ( = ?auto_326242 ?auto_326246 ) ) ( not ( = ?auto_326242 ?auto_326247 ) ) ( not ( = ?auto_326242 ?auto_326248 ) ) ( not ( = ?auto_326242 ?auto_326249 ) ) ( not ( = ?auto_326242 ?auto_326250 ) ) ( not ( = ?auto_326242 ?auto_326251 ) ) ( not ( = ?auto_326242 ?auto_326252 ) ) ( not ( = ?auto_326242 ?auto_326253 ) ) ( not ( = ?auto_326243 ?auto_326244 ) ) ( not ( = ?auto_326243 ?auto_326245 ) ) ( not ( = ?auto_326243 ?auto_326246 ) ) ( not ( = ?auto_326243 ?auto_326247 ) ) ( not ( = ?auto_326243 ?auto_326248 ) ) ( not ( = ?auto_326243 ?auto_326249 ) ) ( not ( = ?auto_326243 ?auto_326250 ) ) ( not ( = ?auto_326243 ?auto_326251 ) ) ( not ( = ?auto_326243 ?auto_326252 ) ) ( not ( = ?auto_326243 ?auto_326253 ) ) ( not ( = ?auto_326244 ?auto_326245 ) ) ( not ( = ?auto_326244 ?auto_326246 ) ) ( not ( = ?auto_326244 ?auto_326247 ) ) ( not ( = ?auto_326244 ?auto_326248 ) ) ( not ( = ?auto_326244 ?auto_326249 ) ) ( not ( = ?auto_326244 ?auto_326250 ) ) ( not ( = ?auto_326244 ?auto_326251 ) ) ( not ( = ?auto_326244 ?auto_326252 ) ) ( not ( = ?auto_326244 ?auto_326253 ) ) ( not ( = ?auto_326245 ?auto_326246 ) ) ( not ( = ?auto_326245 ?auto_326247 ) ) ( not ( = ?auto_326245 ?auto_326248 ) ) ( not ( = ?auto_326245 ?auto_326249 ) ) ( not ( = ?auto_326245 ?auto_326250 ) ) ( not ( = ?auto_326245 ?auto_326251 ) ) ( not ( = ?auto_326245 ?auto_326252 ) ) ( not ( = ?auto_326245 ?auto_326253 ) ) ( not ( = ?auto_326246 ?auto_326247 ) ) ( not ( = ?auto_326246 ?auto_326248 ) ) ( not ( = ?auto_326246 ?auto_326249 ) ) ( not ( = ?auto_326246 ?auto_326250 ) ) ( not ( = ?auto_326246 ?auto_326251 ) ) ( not ( = ?auto_326246 ?auto_326252 ) ) ( not ( = ?auto_326246 ?auto_326253 ) ) ( not ( = ?auto_326247 ?auto_326248 ) ) ( not ( = ?auto_326247 ?auto_326249 ) ) ( not ( = ?auto_326247 ?auto_326250 ) ) ( not ( = ?auto_326247 ?auto_326251 ) ) ( not ( = ?auto_326247 ?auto_326252 ) ) ( not ( = ?auto_326247 ?auto_326253 ) ) ( not ( = ?auto_326248 ?auto_326249 ) ) ( not ( = ?auto_326248 ?auto_326250 ) ) ( not ( = ?auto_326248 ?auto_326251 ) ) ( not ( = ?auto_326248 ?auto_326252 ) ) ( not ( = ?auto_326248 ?auto_326253 ) ) ( not ( = ?auto_326249 ?auto_326250 ) ) ( not ( = ?auto_326249 ?auto_326251 ) ) ( not ( = ?auto_326249 ?auto_326252 ) ) ( not ( = ?auto_326249 ?auto_326253 ) ) ( not ( = ?auto_326250 ?auto_326251 ) ) ( not ( = ?auto_326250 ?auto_326252 ) ) ( not ( = ?auto_326250 ?auto_326253 ) ) ( not ( = ?auto_326251 ?auto_326252 ) ) ( not ( = ?auto_326251 ?auto_326253 ) ) ( not ( = ?auto_326252 ?auto_326253 ) ) ( ON ?auto_326252 ?auto_326253 ) ( ON ?auto_326251 ?auto_326252 ) ( ON ?auto_326250 ?auto_326251 ) ( ON ?auto_326249 ?auto_326250 ) ( ON ?auto_326248 ?auto_326249 ) ( ON ?auto_326247 ?auto_326248 ) ( ON ?auto_326246 ?auto_326247 ) ( ON ?auto_326245 ?auto_326246 ) ( ON ?auto_326244 ?auto_326245 ) ( ON ?auto_326243 ?auto_326244 ) ( ON ?auto_326242 ?auto_326243 ) ( CLEAR ?auto_326240 ) ( ON ?auto_326241 ?auto_326242 ) ( CLEAR ?auto_326241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_326240 ?auto_326241 )
      ( MAKE-14PILE ?auto_326240 ?auto_326241 ?auto_326242 ?auto_326243 ?auto_326244 ?auto_326245 ?auto_326246 ?auto_326247 ?auto_326248 ?auto_326249 ?auto_326250 ?auto_326251 ?auto_326252 ?auto_326253 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_326268 - BLOCK
      ?auto_326269 - BLOCK
      ?auto_326270 - BLOCK
      ?auto_326271 - BLOCK
      ?auto_326272 - BLOCK
      ?auto_326273 - BLOCK
      ?auto_326274 - BLOCK
      ?auto_326275 - BLOCK
      ?auto_326276 - BLOCK
      ?auto_326277 - BLOCK
      ?auto_326278 - BLOCK
      ?auto_326279 - BLOCK
      ?auto_326280 - BLOCK
      ?auto_326281 - BLOCK
    )
    :vars
    (
      ?auto_326282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326281 ?auto_326282 ) ( not ( = ?auto_326268 ?auto_326269 ) ) ( not ( = ?auto_326268 ?auto_326270 ) ) ( not ( = ?auto_326268 ?auto_326271 ) ) ( not ( = ?auto_326268 ?auto_326272 ) ) ( not ( = ?auto_326268 ?auto_326273 ) ) ( not ( = ?auto_326268 ?auto_326274 ) ) ( not ( = ?auto_326268 ?auto_326275 ) ) ( not ( = ?auto_326268 ?auto_326276 ) ) ( not ( = ?auto_326268 ?auto_326277 ) ) ( not ( = ?auto_326268 ?auto_326278 ) ) ( not ( = ?auto_326268 ?auto_326279 ) ) ( not ( = ?auto_326268 ?auto_326280 ) ) ( not ( = ?auto_326268 ?auto_326281 ) ) ( not ( = ?auto_326268 ?auto_326282 ) ) ( not ( = ?auto_326269 ?auto_326270 ) ) ( not ( = ?auto_326269 ?auto_326271 ) ) ( not ( = ?auto_326269 ?auto_326272 ) ) ( not ( = ?auto_326269 ?auto_326273 ) ) ( not ( = ?auto_326269 ?auto_326274 ) ) ( not ( = ?auto_326269 ?auto_326275 ) ) ( not ( = ?auto_326269 ?auto_326276 ) ) ( not ( = ?auto_326269 ?auto_326277 ) ) ( not ( = ?auto_326269 ?auto_326278 ) ) ( not ( = ?auto_326269 ?auto_326279 ) ) ( not ( = ?auto_326269 ?auto_326280 ) ) ( not ( = ?auto_326269 ?auto_326281 ) ) ( not ( = ?auto_326269 ?auto_326282 ) ) ( not ( = ?auto_326270 ?auto_326271 ) ) ( not ( = ?auto_326270 ?auto_326272 ) ) ( not ( = ?auto_326270 ?auto_326273 ) ) ( not ( = ?auto_326270 ?auto_326274 ) ) ( not ( = ?auto_326270 ?auto_326275 ) ) ( not ( = ?auto_326270 ?auto_326276 ) ) ( not ( = ?auto_326270 ?auto_326277 ) ) ( not ( = ?auto_326270 ?auto_326278 ) ) ( not ( = ?auto_326270 ?auto_326279 ) ) ( not ( = ?auto_326270 ?auto_326280 ) ) ( not ( = ?auto_326270 ?auto_326281 ) ) ( not ( = ?auto_326270 ?auto_326282 ) ) ( not ( = ?auto_326271 ?auto_326272 ) ) ( not ( = ?auto_326271 ?auto_326273 ) ) ( not ( = ?auto_326271 ?auto_326274 ) ) ( not ( = ?auto_326271 ?auto_326275 ) ) ( not ( = ?auto_326271 ?auto_326276 ) ) ( not ( = ?auto_326271 ?auto_326277 ) ) ( not ( = ?auto_326271 ?auto_326278 ) ) ( not ( = ?auto_326271 ?auto_326279 ) ) ( not ( = ?auto_326271 ?auto_326280 ) ) ( not ( = ?auto_326271 ?auto_326281 ) ) ( not ( = ?auto_326271 ?auto_326282 ) ) ( not ( = ?auto_326272 ?auto_326273 ) ) ( not ( = ?auto_326272 ?auto_326274 ) ) ( not ( = ?auto_326272 ?auto_326275 ) ) ( not ( = ?auto_326272 ?auto_326276 ) ) ( not ( = ?auto_326272 ?auto_326277 ) ) ( not ( = ?auto_326272 ?auto_326278 ) ) ( not ( = ?auto_326272 ?auto_326279 ) ) ( not ( = ?auto_326272 ?auto_326280 ) ) ( not ( = ?auto_326272 ?auto_326281 ) ) ( not ( = ?auto_326272 ?auto_326282 ) ) ( not ( = ?auto_326273 ?auto_326274 ) ) ( not ( = ?auto_326273 ?auto_326275 ) ) ( not ( = ?auto_326273 ?auto_326276 ) ) ( not ( = ?auto_326273 ?auto_326277 ) ) ( not ( = ?auto_326273 ?auto_326278 ) ) ( not ( = ?auto_326273 ?auto_326279 ) ) ( not ( = ?auto_326273 ?auto_326280 ) ) ( not ( = ?auto_326273 ?auto_326281 ) ) ( not ( = ?auto_326273 ?auto_326282 ) ) ( not ( = ?auto_326274 ?auto_326275 ) ) ( not ( = ?auto_326274 ?auto_326276 ) ) ( not ( = ?auto_326274 ?auto_326277 ) ) ( not ( = ?auto_326274 ?auto_326278 ) ) ( not ( = ?auto_326274 ?auto_326279 ) ) ( not ( = ?auto_326274 ?auto_326280 ) ) ( not ( = ?auto_326274 ?auto_326281 ) ) ( not ( = ?auto_326274 ?auto_326282 ) ) ( not ( = ?auto_326275 ?auto_326276 ) ) ( not ( = ?auto_326275 ?auto_326277 ) ) ( not ( = ?auto_326275 ?auto_326278 ) ) ( not ( = ?auto_326275 ?auto_326279 ) ) ( not ( = ?auto_326275 ?auto_326280 ) ) ( not ( = ?auto_326275 ?auto_326281 ) ) ( not ( = ?auto_326275 ?auto_326282 ) ) ( not ( = ?auto_326276 ?auto_326277 ) ) ( not ( = ?auto_326276 ?auto_326278 ) ) ( not ( = ?auto_326276 ?auto_326279 ) ) ( not ( = ?auto_326276 ?auto_326280 ) ) ( not ( = ?auto_326276 ?auto_326281 ) ) ( not ( = ?auto_326276 ?auto_326282 ) ) ( not ( = ?auto_326277 ?auto_326278 ) ) ( not ( = ?auto_326277 ?auto_326279 ) ) ( not ( = ?auto_326277 ?auto_326280 ) ) ( not ( = ?auto_326277 ?auto_326281 ) ) ( not ( = ?auto_326277 ?auto_326282 ) ) ( not ( = ?auto_326278 ?auto_326279 ) ) ( not ( = ?auto_326278 ?auto_326280 ) ) ( not ( = ?auto_326278 ?auto_326281 ) ) ( not ( = ?auto_326278 ?auto_326282 ) ) ( not ( = ?auto_326279 ?auto_326280 ) ) ( not ( = ?auto_326279 ?auto_326281 ) ) ( not ( = ?auto_326279 ?auto_326282 ) ) ( not ( = ?auto_326280 ?auto_326281 ) ) ( not ( = ?auto_326280 ?auto_326282 ) ) ( not ( = ?auto_326281 ?auto_326282 ) ) ( ON ?auto_326280 ?auto_326281 ) ( ON ?auto_326279 ?auto_326280 ) ( ON ?auto_326278 ?auto_326279 ) ( ON ?auto_326277 ?auto_326278 ) ( ON ?auto_326276 ?auto_326277 ) ( ON ?auto_326275 ?auto_326276 ) ( ON ?auto_326274 ?auto_326275 ) ( ON ?auto_326273 ?auto_326274 ) ( ON ?auto_326272 ?auto_326273 ) ( ON ?auto_326271 ?auto_326272 ) ( ON ?auto_326270 ?auto_326271 ) ( ON ?auto_326269 ?auto_326270 ) ( ON ?auto_326268 ?auto_326269 ) ( CLEAR ?auto_326268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_326268 )
      ( MAKE-14PILE ?auto_326268 ?auto_326269 ?auto_326270 ?auto_326271 ?auto_326272 ?auto_326273 ?auto_326274 ?auto_326275 ?auto_326276 ?auto_326277 ?auto_326278 ?auto_326279 ?auto_326280 ?auto_326281 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_326297 - BLOCK
      ?auto_326298 - BLOCK
      ?auto_326299 - BLOCK
      ?auto_326300 - BLOCK
      ?auto_326301 - BLOCK
      ?auto_326302 - BLOCK
      ?auto_326303 - BLOCK
      ?auto_326304 - BLOCK
      ?auto_326305 - BLOCK
      ?auto_326306 - BLOCK
      ?auto_326307 - BLOCK
      ?auto_326308 - BLOCK
      ?auto_326309 - BLOCK
      ?auto_326310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_326310 ) ( not ( = ?auto_326297 ?auto_326298 ) ) ( not ( = ?auto_326297 ?auto_326299 ) ) ( not ( = ?auto_326297 ?auto_326300 ) ) ( not ( = ?auto_326297 ?auto_326301 ) ) ( not ( = ?auto_326297 ?auto_326302 ) ) ( not ( = ?auto_326297 ?auto_326303 ) ) ( not ( = ?auto_326297 ?auto_326304 ) ) ( not ( = ?auto_326297 ?auto_326305 ) ) ( not ( = ?auto_326297 ?auto_326306 ) ) ( not ( = ?auto_326297 ?auto_326307 ) ) ( not ( = ?auto_326297 ?auto_326308 ) ) ( not ( = ?auto_326297 ?auto_326309 ) ) ( not ( = ?auto_326297 ?auto_326310 ) ) ( not ( = ?auto_326298 ?auto_326299 ) ) ( not ( = ?auto_326298 ?auto_326300 ) ) ( not ( = ?auto_326298 ?auto_326301 ) ) ( not ( = ?auto_326298 ?auto_326302 ) ) ( not ( = ?auto_326298 ?auto_326303 ) ) ( not ( = ?auto_326298 ?auto_326304 ) ) ( not ( = ?auto_326298 ?auto_326305 ) ) ( not ( = ?auto_326298 ?auto_326306 ) ) ( not ( = ?auto_326298 ?auto_326307 ) ) ( not ( = ?auto_326298 ?auto_326308 ) ) ( not ( = ?auto_326298 ?auto_326309 ) ) ( not ( = ?auto_326298 ?auto_326310 ) ) ( not ( = ?auto_326299 ?auto_326300 ) ) ( not ( = ?auto_326299 ?auto_326301 ) ) ( not ( = ?auto_326299 ?auto_326302 ) ) ( not ( = ?auto_326299 ?auto_326303 ) ) ( not ( = ?auto_326299 ?auto_326304 ) ) ( not ( = ?auto_326299 ?auto_326305 ) ) ( not ( = ?auto_326299 ?auto_326306 ) ) ( not ( = ?auto_326299 ?auto_326307 ) ) ( not ( = ?auto_326299 ?auto_326308 ) ) ( not ( = ?auto_326299 ?auto_326309 ) ) ( not ( = ?auto_326299 ?auto_326310 ) ) ( not ( = ?auto_326300 ?auto_326301 ) ) ( not ( = ?auto_326300 ?auto_326302 ) ) ( not ( = ?auto_326300 ?auto_326303 ) ) ( not ( = ?auto_326300 ?auto_326304 ) ) ( not ( = ?auto_326300 ?auto_326305 ) ) ( not ( = ?auto_326300 ?auto_326306 ) ) ( not ( = ?auto_326300 ?auto_326307 ) ) ( not ( = ?auto_326300 ?auto_326308 ) ) ( not ( = ?auto_326300 ?auto_326309 ) ) ( not ( = ?auto_326300 ?auto_326310 ) ) ( not ( = ?auto_326301 ?auto_326302 ) ) ( not ( = ?auto_326301 ?auto_326303 ) ) ( not ( = ?auto_326301 ?auto_326304 ) ) ( not ( = ?auto_326301 ?auto_326305 ) ) ( not ( = ?auto_326301 ?auto_326306 ) ) ( not ( = ?auto_326301 ?auto_326307 ) ) ( not ( = ?auto_326301 ?auto_326308 ) ) ( not ( = ?auto_326301 ?auto_326309 ) ) ( not ( = ?auto_326301 ?auto_326310 ) ) ( not ( = ?auto_326302 ?auto_326303 ) ) ( not ( = ?auto_326302 ?auto_326304 ) ) ( not ( = ?auto_326302 ?auto_326305 ) ) ( not ( = ?auto_326302 ?auto_326306 ) ) ( not ( = ?auto_326302 ?auto_326307 ) ) ( not ( = ?auto_326302 ?auto_326308 ) ) ( not ( = ?auto_326302 ?auto_326309 ) ) ( not ( = ?auto_326302 ?auto_326310 ) ) ( not ( = ?auto_326303 ?auto_326304 ) ) ( not ( = ?auto_326303 ?auto_326305 ) ) ( not ( = ?auto_326303 ?auto_326306 ) ) ( not ( = ?auto_326303 ?auto_326307 ) ) ( not ( = ?auto_326303 ?auto_326308 ) ) ( not ( = ?auto_326303 ?auto_326309 ) ) ( not ( = ?auto_326303 ?auto_326310 ) ) ( not ( = ?auto_326304 ?auto_326305 ) ) ( not ( = ?auto_326304 ?auto_326306 ) ) ( not ( = ?auto_326304 ?auto_326307 ) ) ( not ( = ?auto_326304 ?auto_326308 ) ) ( not ( = ?auto_326304 ?auto_326309 ) ) ( not ( = ?auto_326304 ?auto_326310 ) ) ( not ( = ?auto_326305 ?auto_326306 ) ) ( not ( = ?auto_326305 ?auto_326307 ) ) ( not ( = ?auto_326305 ?auto_326308 ) ) ( not ( = ?auto_326305 ?auto_326309 ) ) ( not ( = ?auto_326305 ?auto_326310 ) ) ( not ( = ?auto_326306 ?auto_326307 ) ) ( not ( = ?auto_326306 ?auto_326308 ) ) ( not ( = ?auto_326306 ?auto_326309 ) ) ( not ( = ?auto_326306 ?auto_326310 ) ) ( not ( = ?auto_326307 ?auto_326308 ) ) ( not ( = ?auto_326307 ?auto_326309 ) ) ( not ( = ?auto_326307 ?auto_326310 ) ) ( not ( = ?auto_326308 ?auto_326309 ) ) ( not ( = ?auto_326308 ?auto_326310 ) ) ( not ( = ?auto_326309 ?auto_326310 ) ) ( ON ?auto_326309 ?auto_326310 ) ( ON ?auto_326308 ?auto_326309 ) ( ON ?auto_326307 ?auto_326308 ) ( ON ?auto_326306 ?auto_326307 ) ( ON ?auto_326305 ?auto_326306 ) ( ON ?auto_326304 ?auto_326305 ) ( ON ?auto_326303 ?auto_326304 ) ( ON ?auto_326302 ?auto_326303 ) ( ON ?auto_326301 ?auto_326302 ) ( ON ?auto_326300 ?auto_326301 ) ( ON ?auto_326299 ?auto_326300 ) ( ON ?auto_326298 ?auto_326299 ) ( ON ?auto_326297 ?auto_326298 ) ( CLEAR ?auto_326297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_326297 )
      ( MAKE-14PILE ?auto_326297 ?auto_326298 ?auto_326299 ?auto_326300 ?auto_326301 ?auto_326302 ?auto_326303 ?auto_326304 ?auto_326305 ?auto_326306 ?auto_326307 ?auto_326308 ?auto_326309 ?auto_326310 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_326325 - BLOCK
      ?auto_326326 - BLOCK
      ?auto_326327 - BLOCK
      ?auto_326328 - BLOCK
      ?auto_326329 - BLOCK
      ?auto_326330 - BLOCK
      ?auto_326331 - BLOCK
      ?auto_326332 - BLOCK
      ?auto_326333 - BLOCK
      ?auto_326334 - BLOCK
      ?auto_326335 - BLOCK
      ?auto_326336 - BLOCK
      ?auto_326337 - BLOCK
      ?auto_326338 - BLOCK
    )
    :vars
    (
      ?auto_326339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_326325 ?auto_326326 ) ) ( not ( = ?auto_326325 ?auto_326327 ) ) ( not ( = ?auto_326325 ?auto_326328 ) ) ( not ( = ?auto_326325 ?auto_326329 ) ) ( not ( = ?auto_326325 ?auto_326330 ) ) ( not ( = ?auto_326325 ?auto_326331 ) ) ( not ( = ?auto_326325 ?auto_326332 ) ) ( not ( = ?auto_326325 ?auto_326333 ) ) ( not ( = ?auto_326325 ?auto_326334 ) ) ( not ( = ?auto_326325 ?auto_326335 ) ) ( not ( = ?auto_326325 ?auto_326336 ) ) ( not ( = ?auto_326325 ?auto_326337 ) ) ( not ( = ?auto_326325 ?auto_326338 ) ) ( not ( = ?auto_326326 ?auto_326327 ) ) ( not ( = ?auto_326326 ?auto_326328 ) ) ( not ( = ?auto_326326 ?auto_326329 ) ) ( not ( = ?auto_326326 ?auto_326330 ) ) ( not ( = ?auto_326326 ?auto_326331 ) ) ( not ( = ?auto_326326 ?auto_326332 ) ) ( not ( = ?auto_326326 ?auto_326333 ) ) ( not ( = ?auto_326326 ?auto_326334 ) ) ( not ( = ?auto_326326 ?auto_326335 ) ) ( not ( = ?auto_326326 ?auto_326336 ) ) ( not ( = ?auto_326326 ?auto_326337 ) ) ( not ( = ?auto_326326 ?auto_326338 ) ) ( not ( = ?auto_326327 ?auto_326328 ) ) ( not ( = ?auto_326327 ?auto_326329 ) ) ( not ( = ?auto_326327 ?auto_326330 ) ) ( not ( = ?auto_326327 ?auto_326331 ) ) ( not ( = ?auto_326327 ?auto_326332 ) ) ( not ( = ?auto_326327 ?auto_326333 ) ) ( not ( = ?auto_326327 ?auto_326334 ) ) ( not ( = ?auto_326327 ?auto_326335 ) ) ( not ( = ?auto_326327 ?auto_326336 ) ) ( not ( = ?auto_326327 ?auto_326337 ) ) ( not ( = ?auto_326327 ?auto_326338 ) ) ( not ( = ?auto_326328 ?auto_326329 ) ) ( not ( = ?auto_326328 ?auto_326330 ) ) ( not ( = ?auto_326328 ?auto_326331 ) ) ( not ( = ?auto_326328 ?auto_326332 ) ) ( not ( = ?auto_326328 ?auto_326333 ) ) ( not ( = ?auto_326328 ?auto_326334 ) ) ( not ( = ?auto_326328 ?auto_326335 ) ) ( not ( = ?auto_326328 ?auto_326336 ) ) ( not ( = ?auto_326328 ?auto_326337 ) ) ( not ( = ?auto_326328 ?auto_326338 ) ) ( not ( = ?auto_326329 ?auto_326330 ) ) ( not ( = ?auto_326329 ?auto_326331 ) ) ( not ( = ?auto_326329 ?auto_326332 ) ) ( not ( = ?auto_326329 ?auto_326333 ) ) ( not ( = ?auto_326329 ?auto_326334 ) ) ( not ( = ?auto_326329 ?auto_326335 ) ) ( not ( = ?auto_326329 ?auto_326336 ) ) ( not ( = ?auto_326329 ?auto_326337 ) ) ( not ( = ?auto_326329 ?auto_326338 ) ) ( not ( = ?auto_326330 ?auto_326331 ) ) ( not ( = ?auto_326330 ?auto_326332 ) ) ( not ( = ?auto_326330 ?auto_326333 ) ) ( not ( = ?auto_326330 ?auto_326334 ) ) ( not ( = ?auto_326330 ?auto_326335 ) ) ( not ( = ?auto_326330 ?auto_326336 ) ) ( not ( = ?auto_326330 ?auto_326337 ) ) ( not ( = ?auto_326330 ?auto_326338 ) ) ( not ( = ?auto_326331 ?auto_326332 ) ) ( not ( = ?auto_326331 ?auto_326333 ) ) ( not ( = ?auto_326331 ?auto_326334 ) ) ( not ( = ?auto_326331 ?auto_326335 ) ) ( not ( = ?auto_326331 ?auto_326336 ) ) ( not ( = ?auto_326331 ?auto_326337 ) ) ( not ( = ?auto_326331 ?auto_326338 ) ) ( not ( = ?auto_326332 ?auto_326333 ) ) ( not ( = ?auto_326332 ?auto_326334 ) ) ( not ( = ?auto_326332 ?auto_326335 ) ) ( not ( = ?auto_326332 ?auto_326336 ) ) ( not ( = ?auto_326332 ?auto_326337 ) ) ( not ( = ?auto_326332 ?auto_326338 ) ) ( not ( = ?auto_326333 ?auto_326334 ) ) ( not ( = ?auto_326333 ?auto_326335 ) ) ( not ( = ?auto_326333 ?auto_326336 ) ) ( not ( = ?auto_326333 ?auto_326337 ) ) ( not ( = ?auto_326333 ?auto_326338 ) ) ( not ( = ?auto_326334 ?auto_326335 ) ) ( not ( = ?auto_326334 ?auto_326336 ) ) ( not ( = ?auto_326334 ?auto_326337 ) ) ( not ( = ?auto_326334 ?auto_326338 ) ) ( not ( = ?auto_326335 ?auto_326336 ) ) ( not ( = ?auto_326335 ?auto_326337 ) ) ( not ( = ?auto_326335 ?auto_326338 ) ) ( not ( = ?auto_326336 ?auto_326337 ) ) ( not ( = ?auto_326336 ?auto_326338 ) ) ( not ( = ?auto_326337 ?auto_326338 ) ) ( ON ?auto_326325 ?auto_326339 ) ( not ( = ?auto_326338 ?auto_326339 ) ) ( not ( = ?auto_326337 ?auto_326339 ) ) ( not ( = ?auto_326336 ?auto_326339 ) ) ( not ( = ?auto_326335 ?auto_326339 ) ) ( not ( = ?auto_326334 ?auto_326339 ) ) ( not ( = ?auto_326333 ?auto_326339 ) ) ( not ( = ?auto_326332 ?auto_326339 ) ) ( not ( = ?auto_326331 ?auto_326339 ) ) ( not ( = ?auto_326330 ?auto_326339 ) ) ( not ( = ?auto_326329 ?auto_326339 ) ) ( not ( = ?auto_326328 ?auto_326339 ) ) ( not ( = ?auto_326327 ?auto_326339 ) ) ( not ( = ?auto_326326 ?auto_326339 ) ) ( not ( = ?auto_326325 ?auto_326339 ) ) ( ON ?auto_326326 ?auto_326325 ) ( ON ?auto_326327 ?auto_326326 ) ( ON ?auto_326328 ?auto_326327 ) ( ON ?auto_326329 ?auto_326328 ) ( ON ?auto_326330 ?auto_326329 ) ( ON ?auto_326331 ?auto_326330 ) ( ON ?auto_326332 ?auto_326331 ) ( ON ?auto_326333 ?auto_326332 ) ( ON ?auto_326334 ?auto_326333 ) ( ON ?auto_326335 ?auto_326334 ) ( ON ?auto_326336 ?auto_326335 ) ( ON ?auto_326337 ?auto_326336 ) ( ON ?auto_326338 ?auto_326337 ) ( CLEAR ?auto_326338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_326338 ?auto_326337 ?auto_326336 ?auto_326335 ?auto_326334 ?auto_326333 ?auto_326332 ?auto_326331 ?auto_326330 ?auto_326329 ?auto_326328 ?auto_326327 ?auto_326326 ?auto_326325 )
      ( MAKE-14PILE ?auto_326325 ?auto_326326 ?auto_326327 ?auto_326328 ?auto_326329 ?auto_326330 ?auto_326331 ?auto_326332 ?auto_326333 ?auto_326334 ?auto_326335 ?auto_326336 ?auto_326337 ?auto_326338 ) )
  )

)

