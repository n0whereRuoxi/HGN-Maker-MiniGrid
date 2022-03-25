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
      ?auto_854042 - BLOCK
    )
    :vars
    (
      ?auto_854043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854042 ?auto_854043 ) ( CLEAR ?auto_854042 ) ( HAND-EMPTY ) ( not ( = ?auto_854042 ?auto_854043 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_854042 ?auto_854043 )
      ( !PUTDOWN ?auto_854042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_854049 - BLOCK
      ?auto_854050 - BLOCK
    )
    :vars
    (
      ?auto_854051 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_854049 ) ( ON ?auto_854050 ?auto_854051 ) ( CLEAR ?auto_854050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_854049 ) ( not ( = ?auto_854049 ?auto_854050 ) ) ( not ( = ?auto_854049 ?auto_854051 ) ) ( not ( = ?auto_854050 ?auto_854051 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_854050 ?auto_854051 )
      ( !STACK ?auto_854050 ?auto_854049 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_854059 - BLOCK
      ?auto_854060 - BLOCK
    )
    :vars
    (
      ?auto_854061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854060 ?auto_854061 ) ( not ( = ?auto_854059 ?auto_854060 ) ) ( not ( = ?auto_854059 ?auto_854061 ) ) ( not ( = ?auto_854060 ?auto_854061 ) ) ( ON ?auto_854059 ?auto_854060 ) ( CLEAR ?auto_854059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_854059 )
      ( MAKE-2PILE ?auto_854059 ?auto_854060 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_854070 - BLOCK
      ?auto_854071 - BLOCK
      ?auto_854072 - BLOCK
    )
    :vars
    (
      ?auto_854073 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_854071 ) ( ON ?auto_854072 ?auto_854073 ) ( CLEAR ?auto_854072 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_854070 ) ( ON ?auto_854071 ?auto_854070 ) ( not ( = ?auto_854070 ?auto_854071 ) ) ( not ( = ?auto_854070 ?auto_854072 ) ) ( not ( = ?auto_854070 ?auto_854073 ) ) ( not ( = ?auto_854071 ?auto_854072 ) ) ( not ( = ?auto_854071 ?auto_854073 ) ) ( not ( = ?auto_854072 ?auto_854073 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_854072 ?auto_854073 )
      ( !STACK ?auto_854072 ?auto_854071 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_854084 - BLOCK
      ?auto_854085 - BLOCK
      ?auto_854086 - BLOCK
    )
    :vars
    (
      ?auto_854087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854086 ?auto_854087 ) ( ON-TABLE ?auto_854084 ) ( not ( = ?auto_854084 ?auto_854085 ) ) ( not ( = ?auto_854084 ?auto_854086 ) ) ( not ( = ?auto_854084 ?auto_854087 ) ) ( not ( = ?auto_854085 ?auto_854086 ) ) ( not ( = ?auto_854085 ?auto_854087 ) ) ( not ( = ?auto_854086 ?auto_854087 ) ) ( CLEAR ?auto_854084 ) ( ON ?auto_854085 ?auto_854086 ) ( CLEAR ?auto_854085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_854084 ?auto_854085 )
      ( MAKE-3PILE ?auto_854084 ?auto_854085 ?auto_854086 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_854098 - BLOCK
      ?auto_854099 - BLOCK
      ?auto_854100 - BLOCK
    )
    :vars
    (
      ?auto_854101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854100 ?auto_854101 ) ( not ( = ?auto_854098 ?auto_854099 ) ) ( not ( = ?auto_854098 ?auto_854100 ) ) ( not ( = ?auto_854098 ?auto_854101 ) ) ( not ( = ?auto_854099 ?auto_854100 ) ) ( not ( = ?auto_854099 ?auto_854101 ) ) ( not ( = ?auto_854100 ?auto_854101 ) ) ( ON ?auto_854099 ?auto_854100 ) ( ON ?auto_854098 ?auto_854099 ) ( CLEAR ?auto_854098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_854098 )
      ( MAKE-3PILE ?auto_854098 ?auto_854099 ?auto_854100 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_854113 - BLOCK
      ?auto_854114 - BLOCK
      ?auto_854115 - BLOCK
      ?auto_854116 - BLOCK
    )
    :vars
    (
      ?auto_854117 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_854115 ) ( ON ?auto_854116 ?auto_854117 ) ( CLEAR ?auto_854116 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_854113 ) ( ON ?auto_854114 ?auto_854113 ) ( ON ?auto_854115 ?auto_854114 ) ( not ( = ?auto_854113 ?auto_854114 ) ) ( not ( = ?auto_854113 ?auto_854115 ) ) ( not ( = ?auto_854113 ?auto_854116 ) ) ( not ( = ?auto_854113 ?auto_854117 ) ) ( not ( = ?auto_854114 ?auto_854115 ) ) ( not ( = ?auto_854114 ?auto_854116 ) ) ( not ( = ?auto_854114 ?auto_854117 ) ) ( not ( = ?auto_854115 ?auto_854116 ) ) ( not ( = ?auto_854115 ?auto_854117 ) ) ( not ( = ?auto_854116 ?auto_854117 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_854116 ?auto_854117 )
      ( !STACK ?auto_854116 ?auto_854115 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_854131 - BLOCK
      ?auto_854132 - BLOCK
      ?auto_854133 - BLOCK
      ?auto_854134 - BLOCK
    )
    :vars
    (
      ?auto_854135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854134 ?auto_854135 ) ( ON-TABLE ?auto_854131 ) ( ON ?auto_854132 ?auto_854131 ) ( not ( = ?auto_854131 ?auto_854132 ) ) ( not ( = ?auto_854131 ?auto_854133 ) ) ( not ( = ?auto_854131 ?auto_854134 ) ) ( not ( = ?auto_854131 ?auto_854135 ) ) ( not ( = ?auto_854132 ?auto_854133 ) ) ( not ( = ?auto_854132 ?auto_854134 ) ) ( not ( = ?auto_854132 ?auto_854135 ) ) ( not ( = ?auto_854133 ?auto_854134 ) ) ( not ( = ?auto_854133 ?auto_854135 ) ) ( not ( = ?auto_854134 ?auto_854135 ) ) ( CLEAR ?auto_854132 ) ( ON ?auto_854133 ?auto_854134 ) ( CLEAR ?auto_854133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_854131 ?auto_854132 ?auto_854133 )
      ( MAKE-4PILE ?auto_854131 ?auto_854132 ?auto_854133 ?auto_854134 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_854149 - BLOCK
      ?auto_854150 - BLOCK
      ?auto_854151 - BLOCK
      ?auto_854152 - BLOCK
    )
    :vars
    (
      ?auto_854153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854152 ?auto_854153 ) ( ON-TABLE ?auto_854149 ) ( not ( = ?auto_854149 ?auto_854150 ) ) ( not ( = ?auto_854149 ?auto_854151 ) ) ( not ( = ?auto_854149 ?auto_854152 ) ) ( not ( = ?auto_854149 ?auto_854153 ) ) ( not ( = ?auto_854150 ?auto_854151 ) ) ( not ( = ?auto_854150 ?auto_854152 ) ) ( not ( = ?auto_854150 ?auto_854153 ) ) ( not ( = ?auto_854151 ?auto_854152 ) ) ( not ( = ?auto_854151 ?auto_854153 ) ) ( not ( = ?auto_854152 ?auto_854153 ) ) ( ON ?auto_854151 ?auto_854152 ) ( CLEAR ?auto_854149 ) ( ON ?auto_854150 ?auto_854151 ) ( CLEAR ?auto_854150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_854149 ?auto_854150 )
      ( MAKE-4PILE ?auto_854149 ?auto_854150 ?auto_854151 ?auto_854152 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_854167 - BLOCK
      ?auto_854168 - BLOCK
      ?auto_854169 - BLOCK
      ?auto_854170 - BLOCK
    )
    :vars
    (
      ?auto_854171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854170 ?auto_854171 ) ( not ( = ?auto_854167 ?auto_854168 ) ) ( not ( = ?auto_854167 ?auto_854169 ) ) ( not ( = ?auto_854167 ?auto_854170 ) ) ( not ( = ?auto_854167 ?auto_854171 ) ) ( not ( = ?auto_854168 ?auto_854169 ) ) ( not ( = ?auto_854168 ?auto_854170 ) ) ( not ( = ?auto_854168 ?auto_854171 ) ) ( not ( = ?auto_854169 ?auto_854170 ) ) ( not ( = ?auto_854169 ?auto_854171 ) ) ( not ( = ?auto_854170 ?auto_854171 ) ) ( ON ?auto_854169 ?auto_854170 ) ( ON ?auto_854168 ?auto_854169 ) ( ON ?auto_854167 ?auto_854168 ) ( CLEAR ?auto_854167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_854167 )
      ( MAKE-4PILE ?auto_854167 ?auto_854168 ?auto_854169 ?auto_854170 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_854186 - BLOCK
      ?auto_854187 - BLOCK
      ?auto_854188 - BLOCK
      ?auto_854189 - BLOCK
      ?auto_854190 - BLOCK
    )
    :vars
    (
      ?auto_854191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_854189 ) ( ON ?auto_854190 ?auto_854191 ) ( CLEAR ?auto_854190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_854186 ) ( ON ?auto_854187 ?auto_854186 ) ( ON ?auto_854188 ?auto_854187 ) ( ON ?auto_854189 ?auto_854188 ) ( not ( = ?auto_854186 ?auto_854187 ) ) ( not ( = ?auto_854186 ?auto_854188 ) ) ( not ( = ?auto_854186 ?auto_854189 ) ) ( not ( = ?auto_854186 ?auto_854190 ) ) ( not ( = ?auto_854186 ?auto_854191 ) ) ( not ( = ?auto_854187 ?auto_854188 ) ) ( not ( = ?auto_854187 ?auto_854189 ) ) ( not ( = ?auto_854187 ?auto_854190 ) ) ( not ( = ?auto_854187 ?auto_854191 ) ) ( not ( = ?auto_854188 ?auto_854189 ) ) ( not ( = ?auto_854188 ?auto_854190 ) ) ( not ( = ?auto_854188 ?auto_854191 ) ) ( not ( = ?auto_854189 ?auto_854190 ) ) ( not ( = ?auto_854189 ?auto_854191 ) ) ( not ( = ?auto_854190 ?auto_854191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_854190 ?auto_854191 )
      ( !STACK ?auto_854190 ?auto_854189 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_854208 - BLOCK
      ?auto_854209 - BLOCK
      ?auto_854210 - BLOCK
      ?auto_854211 - BLOCK
      ?auto_854212 - BLOCK
    )
    :vars
    (
      ?auto_854213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854212 ?auto_854213 ) ( ON-TABLE ?auto_854208 ) ( ON ?auto_854209 ?auto_854208 ) ( ON ?auto_854210 ?auto_854209 ) ( not ( = ?auto_854208 ?auto_854209 ) ) ( not ( = ?auto_854208 ?auto_854210 ) ) ( not ( = ?auto_854208 ?auto_854211 ) ) ( not ( = ?auto_854208 ?auto_854212 ) ) ( not ( = ?auto_854208 ?auto_854213 ) ) ( not ( = ?auto_854209 ?auto_854210 ) ) ( not ( = ?auto_854209 ?auto_854211 ) ) ( not ( = ?auto_854209 ?auto_854212 ) ) ( not ( = ?auto_854209 ?auto_854213 ) ) ( not ( = ?auto_854210 ?auto_854211 ) ) ( not ( = ?auto_854210 ?auto_854212 ) ) ( not ( = ?auto_854210 ?auto_854213 ) ) ( not ( = ?auto_854211 ?auto_854212 ) ) ( not ( = ?auto_854211 ?auto_854213 ) ) ( not ( = ?auto_854212 ?auto_854213 ) ) ( CLEAR ?auto_854210 ) ( ON ?auto_854211 ?auto_854212 ) ( CLEAR ?auto_854211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_854208 ?auto_854209 ?auto_854210 ?auto_854211 )
      ( MAKE-5PILE ?auto_854208 ?auto_854209 ?auto_854210 ?auto_854211 ?auto_854212 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_854230 - BLOCK
      ?auto_854231 - BLOCK
      ?auto_854232 - BLOCK
      ?auto_854233 - BLOCK
      ?auto_854234 - BLOCK
    )
    :vars
    (
      ?auto_854235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854234 ?auto_854235 ) ( ON-TABLE ?auto_854230 ) ( ON ?auto_854231 ?auto_854230 ) ( not ( = ?auto_854230 ?auto_854231 ) ) ( not ( = ?auto_854230 ?auto_854232 ) ) ( not ( = ?auto_854230 ?auto_854233 ) ) ( not ( = ?auto_854230 ?auto_854234 ) ) ( not ( = ?auto_854230 ?auto_854235 ) ) ( not ( = ?auto_854231 ?auto_854232 ) ) ( not ( = ?auto_854231 ?auto_854233 ) ) ( not ( = ?auto_854231 ?auto_854234 ) ) ( not ( = ?auto_854231 ?auto_854235 ) ) ( not ( = ?auto_854232 ?auto_854233 ) ) ( not ( = ?auto_854232 ?auto_854234 ) ) ( not ( = ?auto_854232 ?auto_854235 ) ) ( not ( = ?auto_854233 ?auto_854234 ) ) ( not ( = ?auto_854233 ?auto_854235 ) ) ( not ( = ?auto_854234 ?auto_854235 ) ) ( ON ?auto_854233 ?auto_854234 ) ( CLEAR ?auto_854231 ) ( ON ?auto_854232 ?auto_854233 ) ( CLEAR ?auto_854232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_854230 ?auto_854231 ?auto_854232 )
      ( MAKE-5PILE ?auto_854230 ?auto_854231 ?auto_854232 ?auto_854233 ?auto_854234 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_854252 - BLOCK
      ?auto_854253 - BLOCK
      ?auto_854254 - BLOCK
      ?auto_854255 - BLOCK
      ?auto_854256 - BLOCK
    )
    :vars
    (
      ?auto_854257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854256 ?auto_854257 ) ( ON-TABLE ?auto_854252 ) ( not ( = ?auto_854252 ?auto_854253 ) ) ( not ( = ?auto_854252 ?auto_854254 ) ) ( not ( = ?auto_854252 ?auto_854255 ) ) ( not ( = ?auto_854252 ?auto_854256 ) ) ( not ( = ?auto_854252 ?auto_854257 ) ) ( not ( = ?auto_854253 ?auto_854254 ) ) ( not ( = ?auto_854253 ?auto_854255 ) ) ( not ( = ?auto_854253 ?auto_854256 ) ) ( not ( = ?auto_854253 ?auto_854257 ) ) ( not ( = ?auto_854254 ?auto_854255 ) ) ( not ( = ?auto_854254 ?auto_854256 ) ) ( not ( = ?auto_854254 ?auto_854257 ) ) ( not ( = ?auto_854255 ?auto_854256 ) ) ( not ( = ?auto_854255 ?auto_854257 ) ) ( not ( = ?auto_854256 ?auto_854257 ) ) ( ON ?auto_854255 ?auto_854256 ) ( ON ?auto_854254 ?auto_854255 ) ( CLEAR ?auto_854252 ) ( ON ?auto_854253 ?auto_854254 ) ( CLEAR ?auto_854253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_854252 ?auto_854253 )
      ( MAKE-5PILE ?auto_854252 ?auto_854253 ?auto_854254 ?auto_854255 ?auto_854256 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_854274 - BLOCK
      ?auto_854275 - BLOCK
      ?auto_854276 - BLOCK
      ?auto_854277 - BLOCK
      ?auto_854278 - BLOCK
    )
    :vars
    (
      ?auto_854279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854278 ?auto_854279 ) ( not ( = ?auto_854274 ?auto_854275 ) ) ( not ( = ?auto_854274 ?auto_854276 ) ) ( not ( = ?auto_854274 ?auto_854277 ) ) ( not ( = ?auto_854274 ?auto_854278 ) ) ( not ( = ?auto_854274 ?auto_854279 ) ) ( not ( = ?auto_854275 ?auto_854276 ) ) ( not ( = ?auto_854275 ?auto_854277 ) ) ( not ( = ?auto_854275 ?auto_854278 ) ) ( not ( = ?auto_854275 ?auto_854279 ) ) ( not ( = ?auto_854276 ?auto_854277 ) ) ( not ( = ?auto_854276 ?auto_854278 ) ) ( not ( = ?auto_854276 ?auto_854279 ) ) ( not ( = ?auto_854277 ?auto_854278 ) ) ( not ( = ?auto_854277 ?auto_854279 ) ) ( not ( = ?auto_854278 ?auto_854279 ) ) ( ON ?auto_854277 ?auto_854278 ) ( ON ?auto_854276 ?auto_854277 ) ( ON ?auto_854275 ?auto_854276 ) ( ON ?auto_854274 ?auto_854275 ) ( CLEAR ?auto_854274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_854274 )
      ( MAKE-5PILE ?auto_854274 ?auto_854275 ?auto_854276 ?auto_854277 ?auto_854278 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_854297 - BLOCK
      ?auto_854298 - BLOCK
      ?auto_854299 - BLOCK
      ?auto_854300 - BLOCK
      ?auto_854301 - BLOCK
      ?auto_854302 - BLOCK
    )
    :vars
    (
      ?auto_854303 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_854301 ) ( ON ?auto_854302 ?auto_854303 ) ( CLEAR ?auto_854302 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_854297 ) ( ON ?auto_854298 ?auto_854297 ) ( ON ?auto_854299 ?auto_854298 ) ( ON ?auto_854300 ?auto_854299 ) ( ON ?auto_854301 ?auto_854300 ) ( not ( = ?auto_854297 ?auto_854298 ) ) ( not ( = ?auto_854297 ?auto_854299 ) ) ( not ( = ?auto_854297 ?auto_854300 ) ) ( not ( = ?auto_854297 ?auto_854301 ) ) ( not ( = ?auto_854297 ?auto_854302 ) ) ( not ( = ?auto_854297 ?auto_854303 ) ) ( not ( = ?auto_854298 ?auto_854299 ) ) ( not ( = ?auto_854298 ?auto_854300 ) ) ( not ( = ?auto_854298 ?auto_854301 ) ) ( not ( = ?auto_854298 ?auto_854302 ) ) ( not ( = ?auto_854298 ?auto_854303 ) ) ( not ( = ?auto_854299 ?auto_854300 ) ) ( not ( = ?auto_854299 ?auto_854301 ) ) ( not ( = ?auto_854299 ?auto_854302 ) ) ( not ( = ?auto_854299 ?auto_854303 ) ) ( not ( = ?auto_854300 ?auto_854301 ) ) ( not ( = ?auto_854300 ?auto_854302 ) ) ( not ( = ?auto_854300 ?auto_854303 ) ) ( not ( = ?auto_854301 ?auto_854302 ) ) ( not ( = ?auto_854301 ?auto_854303 ) ) ( not ( = ?auto_854302 ?auto_854303 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_854302 ?auto_854303 )
      ( !STACK ?auto_854302 ?auto_854301 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_854323 - BLOCK
      ?auto_854324 - BLOCK
      ?auto_854325 - BLOCK
      ?auto_854326 - BLOCK
      ?auto_854327 - BLOCK
      ?auto_854328 - BLOCK
    )
    :vars
    (
      ?auto_854329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854328 ?auto_854329 ) ( ON-TABLE ?auto_854323 ) ( ON ?auto_854324 ?auto_854323 ) ( ON ?auto_854325 ?auto_854324 ) ( ON ?auto_854326 ?auto_854325 ) ( not ( = ?auto_854323 ?auto_854324 ) ) ( not ( = ?auto_854323 ?auto_854325 ) ) ( not ( = ?auto_854323 ?auto_854326 ) ) ( not ( = ?auto_854323 ?auto_854327 ) ) ( not ( = ?auto_854323 ?auto_854328 ) ) ( not ( = ?auto_854323 ?auto_854329 ) ) ( not ( = ?auto_854324 ?auto_854325 ) ) ( not ( = ?auto_854324 ?auto_854326 ) ) ( not ( = ?auto_854324 ?auto_854327 ) ) ( not ( = ?auto_854324 ?auto_854328 ) ) ( not ( = ?auto_854324 ?auto_854329 ) ) ( not ( = ?auto_854325 ?auto_854326 ) ) ( not ( = ?auto_854325 ?auto_854327 ) ) ( not ( = ?auto_854325 ?auto_854328 ) ) ( not ( = ?auto_854325 ?auto_854329 ) ) ( not ( = ?auto_854326 ?auto_854327 ) ) ( not ( = ?auto_854326 ?auto_854328 ) ) ( not ( = ?auto_854326 ?auto_854329 ) ) ( not ( = ?auto_854327 ?auto_854328 ) ) ( not ( = ?auto_854327 ?auto_854329 ) ) ( not ( = ?auto_854328 ?auto_854329 ) ) ( CLEAR ?auto_854326 ) ( ON ?auto_854327 ?auto_854328 ) ( CLEAR ?auto_854327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_854323 ?auto_854324 ?auto_854325 ?auto_854326 ?auto_854327 )
      ( MAKE-6PILE ?auto_854323 ?auto_854324 ?auto_854325 ?auto_854326 ?auto_854327 ?auto_854328 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_854349 - BLOCK
      ?auto_854350 - BLOCK
      ?auto_854351 - BLOCK
      ?auto_854352 - BLOCK
      ?auto_854353 - BLOCK
      ?auto_854354 - BLOCK
    )
    :vars
    (
      ?auto_854355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854354 ?auto_854355 ) ( ON-TABLE ?auto_854349 ) ( ON ?auto_854350 ?auto_854349 ) ( ON ?auto_854351 ?auto_854350 ) ( not ( = ?auto_854349 ?auto_854350 ) ) ( not ( = ?auto_854349 ?auto_854351 ) ) ( not ( = ?auto_854349 ?auto_854352 ) ) ( not ( = ?auto_854349 ?auto_854353 ) ) ( not ( = ?auto_854349 ?auto_854354 ) ) ( not ( = ?auto_854349 ?auto_854355 ) ) ( not ( = ?auto_854350 ?auto_854351 ) ) ( not ( = ?auto_854350 ?auto_854352 ) ) ( not ( = ?auto_854350 ?auto_854353 ) ) ( not ( = ?auto_854350 ?auto_854354 ) ) ( not ( = ?auto_854350 ?auto_854355 ) ) ( not ( = ?auto_854351 ?auto_854352 ) ) ( not ( = ?auto_854351 ?auto_854353 ) ) ( not ( = ?auto_854351 ?auto_854354 ) ) ( not ( = ?auto_854351 ?auto_854355 ) ) ( not ( = ?auto_854352 ?auto_854353 ) ) ( not ( = ?auto_854352 ?auto_854354 ) ) ( not ( = ?auto_854352 ?auto_854355 ) ) ( not ( = ?auto_854353 ?auto_854354 ) ) ( not ( = ?auto_854353 ?auto_854355 ) ) ( not ( = ?auto_854354 ?auto_854355 ) ) ( ON ?auto_854353 ?auto_854354 ) ( CLEAR ?auto_854351 ) ( ON ?auto_854352 ?auto_854353 ) ( CLEAR ?auto_854352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_854349 ?auto_854350 ?auto_854351 ?auto_854352 )
      ( MAKE-6PILE ?auto_854349 ?auto_854350 ?auto_854351 ?auto_854352 ?auto_854353 ?auto_854354 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_854375 - BLOCK
      ?auto_854376 - BLOCK
      ?auto_854377 - BLOCK
      ?auto_854378 - BLOCK
      ?auto_854379 - BLOCK
      ?auto_854380 - BLOCK
    )
    :vars
    (
      ?auto_854381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854380 ?auto_854381 ) ( ON-TABLE ?auto_854375 ) ( ON ?auto_854376 ?auto_854375 ) ( not ( = ?auto_854375 ?auto_854376 ) ) ( not ( = ?auto_854375 ?auto_854377 ) ) ( not ( = ?auto_854375 ?auto_854378 ) ) ( not ( = ?auto_854375 ?auto_854379 ) ) ( not ( = ?auto_854375 ?auto_854380 ) ) ( not ( = ?auto_854375 ?auto_854381 ) ) ( not ( = ?auto_854376 ?auto_854377 ) ) ( not ( = ?auto_854376 ?auto_854378 ) ) ( not ( = ?auto_854376 ?auto_854379 ) ) ( not ( = ?auto_854376 ?auto_854380 ) ) ( not ( = ?auto_854376 ?auto_854381 ) ) ( not ( = ?auto_854377 ?auto_854378 ) ) ( not ( = ?auto_854377 ?auto_854379 ) ) ( not ( = ?auto_854377 ?auto_854380 ) ) ( not ( = ?auto_854377 ?auto_854381 ) ) ( not ( = ?auto_854378 ?auto_854379 ) ) ( not ( = ?auto_854378 ?auto_854380 ) ) ( not ( = ?auto_854378 ?auto_854381 ) ) ( not ( = ?auto_854379 ?auto_854380 ) ) ( not ( = ?auto_854379 ?auto_854381 ) ) ( not ( = ?auto_854380 ?auto_854381 ) ) ( ON ?auto_854379 ?auto_854380 ) ( ON ?auto_854378 ?auto_854379 ) ( CLEAR ?auto_854376 ) ( ON ?auto_854377 ?auto_854378 ) ( CLEAR ?auto_854377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_854375 ?auto_854376 ?auto_854377 )
      ( MAKE-6PILE ?auto_854375 ?auto_854376 ?auto_854377 ?auto_854378 ?auto_854379 ?auto_854380 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_854401 - BLOCK
      ?auto_854402 - BLOCK
      ?auto_854403 - BLOCK
      ?auto_854404 - BLOCK
      ?auto_854405 - BLOCK
      ?auto_854406 - BLOCK
    )
    :vars
    (
      ?auto_854407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854406 ?auto_854407 ) ( ON-TABLE ?auto_854401 ) ( not ( = ?auto_854401 ?auto_854402 ) ) ( not ( = ?auto_854401 ?auto_854403 ) ) ( not ( = ?auto_854401 ?auto_854404 ) ) ( not ( = ?auto_854401 ?auto_854405 ) ) ( not ( = ?auto_854401 ?auto_854406 ) ) ( not ( = ?auto_854401 ?auto_854407 ) ) ( not ( = ?auto_854402 ?auto_854403 ) ) ( not ( = ?auto_854402 ?auto_854404 ) ) ( not ( = ?auto_854402 ?auto_854405 ) ) ( not ( = ?auto_854402 ?auto_854406 ) ) ( not ( = ?auto_854402 ?auto_854407 ) ) ( not ( = ?auto_854403 ?auto_854404 ) ) ( not ( = ?auto_854403 ?auto_854405 ) ) ( not ( = ?auto_854403 ?auto_854406 ) ) ( not ( = ?auto_854403 ?auto_854407 ) ) ( not ( = ?auto_854404 ?auto_854405 ) ) ( not ( = ?auto_854404 ?auto_854406 ) ) ( not ( = ?auto_854404 ?auto_854407 ) ) ( not ( = ?auto_854405 ?auto_854406 ) ) ( not ( = ?auto_854405 ?auto_854407 ) ) ( not ( = ?auto_854406 ?auto_854407 ) ) ( ON ?auto_854405 ?auto_854406 ) ( ON ?auto_854404 ?auto_854405 ) ( ON ?auto_854403 ?auto_854404 ) ( CLEAR ?auto_854401 ) ( ON ?auto_854402 ?auto_854403 ) ( CLEAR ?auto_854402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_854401 ?auto_854402 )
      ( MAKE-6PILE ?auto_854401 ?auto_854402 ?auto_854403 ?auto_854404 ?auto_854405 ?auto_854406 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_854427 - BLOCK
      ?auto_854428 - BLOCK
      ?auto_854429 - BLOCK
      ?auto_854430 - BLOCK
      ?auto_854431 - BLOCK
      ?auto_854432 - BLOCK
    )
    :vars
    (
      ?auto_854433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854432 ?auto_854433 ) ( not ( = ?auto_854427 ?auto_854428 ) ) ( not ( = ?auto_854427 ?auto_854429 ) ) ( not ( = ?auto_854427 ?auto_854430 ) ) ( not ( = ?auto_854427 ?auto_854431 ) ) ( not ( = ?auto_854427 ?auto_854432 ) ) ( not ( = ?auto_854427 ?auto_854433 ) ) ( not ( = ?auto_854428 ?auto_854429 ) ) ( not ( = ?auto_854428 ?auto_854430 ) ) ( not ( = ?auto_854428 ?auto_854431 ) ) ( not ( = ?auto_854428 ?auto_854432 ) ) ( not ( = ?auto_854428 ?auto_854433 ) ) ( not ( = ?auto_854429 ?auto_854430 ) ) ( not ( = ?auto_854429 ?auto_854431 ) ) ( not ( = ?auto_854429 ?auto_854432 ) ) ( not ( = ?auto_854429 ?auto_854433 ) ) ( not ( = ?auto_854430 ?auto_854431 ) ) ( not ( = ?auto_854430 ?auto_854432 ) ) ( not ( = ?auto_854430 ?auto_854433 ) ) ( not ( = ?auto_854431 ?auto_854432 ) ) ( not ( = ?auto_854431 ?auto_854433 ) ) ( not ( = ?auto_854432 ?auto_854433 ) ) ( ON ?auto_854431 ?auto_854432 ) ( ON ?auto_854430 ?auto_854431 ) ( ON ?auto_854429 ?auto_854430 ) ( ON ?auto_854428 ?auto_854429 ) ( ON ?auto_854427 ?auto_854428 ) ( CLEAR ?auto_854427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_854427 )
      ( MAKE-6PILE ?auto_854427 ?auto_854428 ?auto_854429 ?auto_854430 ?auto_854431 ?auto_854432 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_854454 - BLOCK
      ?auto_854455 - BLOCK
      ?auto_854456 - BLOCK
      ?auto_854457 - BLOCK
      ?auto_854458 - BLOCK
      ?auto_854459 - BLOCK
      ?auto_854460 - BLOCK
    )
    :vars
    (
      ?auto_854461 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_854459 ) ( ON ?auto_854460 ?auto_854461 ) ( CLEAR ?auto_854460 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_854454 ) ( ON ?auto_854455 ?auto_854454 ) ( ON ?auto_854456 ?auto_854455 ) ( ON ?auto_854457 ?auto_854456 ) ( ON ?auto_854458 ?auto_854457 ) ( ON ?auto_854459 ?auto_854458 ) ( not ( = ?auto_854454 ?auto_854455 ) ) ( not ( = ?auto_854454 ?auto_854456 ) ) ( not ( = ?auto_854454 ?auto_854457 ) ) ( not ( = ?auto_854454 ?auto_854458 ) ) ( not ( = ?auto_854454 ?auto_854459 ) ) ( not ( = ?auto_854454 ?auto_854460 ) ) ( not ( = ?auto_854454 ?auto_854461 ) ) ( not ( = ?auto_854455 ?auto_854456 ) ) ( not ( = ?auto_854455 ?auto_854457 ) ) ( not ( = ?auto_854455 ?auto_854458 ) ) ( not ( = ?auto_854455 ?auto_854459 ) ) ( not ( = ?auto_854455 ?auto_854460 ) ) ( not ( = ?auto_854455 ?auto_854461 ) ) ( not ( = ?auto_854456 ?auto_854457 ) ) ( not ( = ?auto_854456 ?auto_854458 ) ) ( not ( = ?auto_854456 ?auto_854459 ) ) ( not ( = ?auto_854456 ?auto_854460 ) ) ( not ( = ?auto_854456 ?auto_854461 ) ) ( not ( = ?auto_854457 ?auto_854458 ) ) ( not ( = ?auto_854457 ?auto_854459 ) ) ( not ( = ?auto_854457 ?auto_854460 ) ) ( not ( = ?auto_854457 ?auto_854461 ) ) ( not ( = ?auto_854458 ?auto_854459 ) ) ( not ( = ?auto_854458 ?auto_854460 ) ) ( not ( = ?auto_854458 ?auto_854461 ) ) ( not ( = ?auto_854459 ?auto_854460 ) ) ( not ( = ?auto_854459 ?auto_854461 ) ) ( not ( = ?auto_854460 ?auto_854461 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_854460 ?auto_854461 )
      ( !STACK ?auto_854460 ?auto_854459 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_854484 - BLOCK
      ?auto_854485 - BLOCK
      ?auto_854486 - BLOCK
      ?auto_854487 - BLOCK
      ?auto_854488 - BLOCK
      ?auto_854489 - BLOCK
      ?auto_854490 - BLOCK
    )
    :vars
    (
      ?auto_854491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854490 ?auto_854491 ) ( ON-TABLE ?auto_854484 ) ( ON ?auto_854485 ?auto_854484 ) ( ON ?auto_854486 ?auto_854485 ) ( ON ?auto_854487 ?auto_854486 ) ( ON ?auto_854488 ?auto_854487 ) ( not ( = ?auto_854484 ?auto_854485 ) ) ( not ( = ?auto_854484 ?auto_854486 ) ) ( not ( = ?auto_854484 ?auto_854487 ) ) ( not ( = ?auto_854484 ?auto_854488 ) ) ( not ( = ?auto_854484 ?auto_854489 ) ) ( not ( = ?auto_854484 ?auto_854490 ) ) ( not ( = ?auto_854484 ?auto_854491 ) ) ( not ( = ?auto_854485 ?auto_854486 ) ) ( not ( = ?auto_854485 ?auto_854487 ) ) ( not ( = ?auto_854485 ?auto_854488 ) ) ( not ( = ?auto_854485 ?auto_854489 ) ) ( not ( = ?auto_854485 ?auto_854490 ) ) ( not ( = ?auto_854485 ?auto_854491 ) ) ( not ( = ?auto_854486 ?auto_854487 ) ) ( not ( = ?auto_854486 ?auto_854488 ) ) ( not ( = ?auto_854486 ?auto_854489 ) ) ( not ( = ?auto_854486 ?auto_854490 ) ) ( not ( = ?auto_854486 ?auto_854491 ) ) ( not ( = ?auto_854487 ?auto_854488 ) ) ( not ( = ?auto_854487 ?auto_854489 ) ) ( not ( = ?auto_854487 ?auto_854490 ) ) ( not ( = ?auto_854487 ?auto_854491 ) ) ( not ( = ?auto_854488 ?auto_854489 ) ) ( not ( = ?auto_854488 ?auto_854490 ) ) ( not ( = ?auto_854488 ?auto_854491 ) ) ( not ( = ?auto_854489 ?auto_854490 ) ) ( not ( = ?auto_854489 ?auto_854491 ) ) ( not ( = ?auto_854490 ?auto_854491 ) ) ( CLEAR ?auto_854488 ) ( ON ?auto_854489 ?auto_854490 ) ( CLEAR ?auto_854489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_854484 ?auto_854485 ?auto_854486 ?auto_854487 ?auto_854488 ?auto_854489 )
      ( MAKE-7PILE ?auto_854484 ?auto_854485 ?auto_854486 ?auto_854487 ?auto_854488 ?auto_854489 ?auto_854490 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_854514 - BLOCK
      ?auto_854515 - BLOCK
      ?auto_854516 - BLOCK
      ?auto_854517 - BLOCK
      ?auto_854518 - BLOCK
      ?auto_854519 - BLOCK
      ?auto_854520 - BLOCK
    )
    :vars
    (
      ?auto_854521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854520 ?auto_854521 ) ( ON-TABLE ?auto_854514 ) ( ON ?auto_854515 ?auto_854514 ) ( ON ?auto_854516 ?auto_854515 ) ( ON ?auto_854517 ?auto_854516 ) ( not ( = ?auto_854514 ?auto_854515 ) ) ( not ( = ?auto_854514 ?auto_854516 ) ) ( not ( = ?auto_854514 ?auto_854517 ) ) ( not ( = ?auto_854514 ?auto_854518 ) ) ( not ( = ?auto_854514 ?auto_854519 ) ) ( not ( = ?auto_854514 ?auto_854520 ) ) ( not ( = ?auto_854514 ?auto_854521 ) ) ( not ( = ?auto_854515 ?auto_854516 ) ) ( not ( = ?auto_854515 ?auto_854517 ) ) ( not ( = ?auto_854515 ?auto_854518 ) ) ( not ( = ?auto_854515 ?auto_854519 ) ) ( not ( = ?auto_854515 ?auto_854520 ) ) ( not ( = ?auto_854515 ?auto_854521 ) ) ( not ( = ?auto_854516 ?auto_854517 ) ) ( not ( = ?auto_854516 ?auto_854518 ) ) ( not ( = ?auto_854516 ?auto_854519 ) ) ( not ( = ?auto_854516 ?auto_854520 ) ) ( not ( = ?auto_854516 ?auto_854521 ) ) ( not ( = ?auto_854517 ?auto_854518 ) ) ( not ( = ?auto_854517 ?auto_854519 ) ) ( not ( = ?auto_854517 ?auto_854520 ) ) ( not ( = ?auto_854517 ?auto_854521 ) ) ( not ( = ?auto_854518 ?auto_854519 ) ) ( not ( = ?auto_854518 ?auto_854520 ) ) ( not ( = ?auto_854518 ?auto_854521 ) ) ( not ( = ?auto_854519 ?auto_854520 ) ) ( not ( = ?auto_854519 ?auto_854521 ) ) ( not ( = ?auto_854520 ?auto_854521 ) ) ( ON ?auto_854519 ?auto_854520 ) ( CLEAR ?auto_854517 ) ( ON ?auto_854518 ?auto_854519 ) ( CLEAR ?auto_854518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_854514 ?auto_854515 ?auto_854516 ?auto_854517 ?auto_854518 )
      ( MAKE-7PILE ?auto_854514 ?auto_854515 ?auto_854516 ?auto_854517 ?auto_854518 ?auto_854519 ?auto_854520 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_854544 - BLOCK
      ?auto_854545 - BLOCK
      ?auto_854546 - BLOCK
      ?auto_854547 - BLOCK
      ?auto_854548 - BLOCK
      ?auto_854549 - BLOCK
      ?auto_854550 - BLOCK
    )
    :vars
    (
      ?auto_854551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854550 ?auto_854551 ) ( ON-TABLE ?auto_854544 ) ( ON ?auto_854545 ?auto_854544 ) ( ON ?auto_854546 ?auto_854545 ) ( not ( = ?auto_854544 ?auto_854545 ) ) ( not ( = ?auto_854544 ?auto_854546 ) ) ( not ( = ?auto_854544 ?auto_854547 ) ) ( not ( = ?auto_854544 ?auto_854548 ) ) ( not ( = ?auto_854544 ?auto_854549 ) ) ( not ( = ?auto_854544 ?auto_854550 ) ) ( not ( = ?auto_854544 ?auto_854551 ) ) ( not ( = ?auto_854545 ?auto_854546 ) ) ( not ( = ?auto_854545 ?auto_854547 ) ) ( not ( = ?auto_854545 ?auto_854548 ) ) ( not ( = ?auto_854545 ?auto_854549 ) ) ( not ( = ?auto_854545 ?auto_854550 ) ) ( not ( = ?auto_854545 ?auto_854551 ) ) ( not ( = ?auto_854546 ?auto_854547 ) ) ( not ( = ?auto_854546 ?auto_854548 ) ) ( not ( = ?auto_854546 ?auto_854549 ) ) ( not ( = ?auto_854546 ?auto_854550 ) ) ( not ( = ?auto_854546 ?auto_854551 ) ) ( not ( = ?auto_854547 ?auto_854548 ) ) ( not ( = ?auto_854547 ?auto_854549 ) ) ( not ( = ?auto_854547 ?auto_854550 ) ) ( not ( = ?auto_854547 ?auto_854551 ) ) ( not ( = ?auto_854548 ?auto_854549 ) ) ( not ( = ?auto_854548 ?auto_854550 ) ) ( not ( = ?auto_854548 ?auto_854551 ) ) ( not ( = ?auto_854549 ?auto_854550 ) ) ( not ( = ?auto_854549 ?auto_854551 ) ) ( not ( = ?auto_854550 ?auto_854551 ) ) ( ON ?auto_854549 ?auto_854550 ) ( ON ?auto_854548 ?auto_854549 ) ( CLEAR ?auto_854546 ) ( ON ?auto_854547 ?auto_854548 ) ( CLEAR ?auto_854547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_854544 ?auto_854545 ?auto_854546 ?auto_854547 )
      ( MAKE-7PILE ?auto_854544 ?auto_854545 ?auto_854546 ?auto_854547 ?auto_854548 ?auto_854549 ?auto_854550 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_854574 - BLOCK
      ?auto_854575 - BLOCK
      ?auto_854576 - BLOCK
      ?auto_854577 - BLOCK
      ?auto_854578 - BLOCK
      ?auto_854579 - BLOCK
      ?auto_854580 - BLOCK
    )
    :vars
    (
      ?auto_854581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854580 ?auto_854581 ) ( ON-TABLE ?auto_854574 ) ( ON ?auto_854575 ?auto_854574 ) ( not ( = ?auto_854574 ?auto_854575 ) ) ( not ( = ?auto_854574 ?auto_854576 ) ) ( not ( = ?auto_854574 ?auto_854577 ) ) ( not ( = ?auto_854574 ?auto_854578 ) ) ( not ( = ?auto_854574 ?auto_854579 ) ) ( not ( = ?auto_854574 ?auto_854580 ) ) ( not ( = ?auto_854574 ?auto_854581 ) ) ( not ( = ?auto_854575 ?auto_854576 ) ) ( not ( = ?auto_854575 ?auto_854577 ) ) ( not ( = ?auto_854575 ?auto_854578 ) ) ( not ( = ?auto_854575 ?auto_854579 ) ) ( not ( = ?auto_854575 ?auto_854580 ) ) ( not ( = ?auto_854575 ?auto_854581 ) ) ( not ( = ?auto_854576 ?auto_854577 ) ) ( not ( = ?auto_854576 ?auto_854578 ) ) ( not ( = ?auto_854576 ?auto_854579 ) ) ( not ( = ?auto_854576 ?auto_854580 ) ) ( not ( = ?auto_854576 ?auto_854581 ) ) ( not ( = ?auto_854577 ?auto_854578 ) ) ( not ( = ?auto_854577 ?auto_854579 ) ) ( not ( = ?auto_854577 ?auto_854580 ) ) ( not ( = ?auto_854577 ?auto_854581 ) ) ( not ( = ?auto_854578 ?auto_854579 ) ) ( not ( = ?auto_854578 ?auto_854580 ) ) ( not ( = ?auto_854578 ?auto_854581 ) ) ( not ( = ?auto_854579 ?auto_854580 ) ) ( not ( = ?auto_854579 ?auto_854581 ) ) ( not ( = ?auto_854580 ?auto_854581 ) ) ( ON ?auto_854579 ?auto_854580 ) ( ON ?auto_854578 ?auto_854579 ) ( ON ?auto_854577 ?auto_854578 ) ( CLEAR ?auto_854575 ) ( ON ?auto_854576 ?auto_854577 ) ( CLEAR ?auto_854576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_854574 ?auto_854575 ?auto_854576 )
      ( MAKE-7PILE ?auto_854574 ?auto_854575 ?auto_854576 ?auto_854577 ?auto_854578 ?auto_854579 ?auto_854580 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_854604 - BLOCK
      ?auto_854605 - BLOCK
      ?auto_854606 - BLOCK
      ?auto_854607 - BLOCK
      ?auto_854608 - BLOCK
      ?auto_854609 - BLOCK
      ?auto_854610 - BLOCK
    )
    :vars
    (
      ?auto_854611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854610 ?auto_854611 ) ( ON-TABLE ?auto_854604 ) ( not ( = ?auto_854604 ?auto_854605 ) ) ( not ( = ?auto_854604 ?auto_854606 ) ) ( not ( = ?auto_854604 ?auto_854607 ) ) ( not ( = ?auto_854604 ?auto_854608 ) ) ( not ( = ?auto_854604 ?auto_854609 ) ) ( not ( = ?auto_854604 ?auto_854610 ) ) ( not ( = ?auto_854604 ?auto_854611 ) ) ( not ( = ?auto_854605 ?auto_854606 ) ) ( not ( = ?auto_854605 ?auto_854607 ) ) ( not ( = ?auto_854605 ?auto_854608 ) ) ( not ( = ?auto_854605 ?auto_854609 ) ) ( not ( = ?auto_854605 ?auto_854610 ) ) ( not ( = ?auto_854605 ?auto_854611 ) ) ( not ( = ?auto_854606 ?auto_854607 ) ) ( not ( = ?auto_854606 ?auto_854608 ) ) ( not ( = ?auto_854606 ?auto_854609 ) ) ( not ( = ?auto_854606 ?auto_854610 ) ) ( not ( = ?auto_854606 ?auto_854611 ) ) ( not ( = ?auto_854607 ?auto_854608 ) ) ( not ( = ?auto_854607 ?auto_854609 ) ) ( not ( = ?auto_854607 ?auto_854610 ) ) ( not ( = ?auto_854607 ?auto_854611 ) ) ( not ( = ?auto_854608 ?auto_854609 ) ) ( not ( = ?auto_854608 ?auto_854610 ) ) ( not ( = ?auto_854608 ?auto_854611 ) ) ( not ( = ?auto_854609 ?auto_854610 ) ) ( not ( = ?auto_854609 ?auto_854611 ) ) ( not ( = ?auto_854610 ?auto_854611 ) ) ( ON ?auto_854609 ?auto_854610 ) ( ON ?auto_854608 ?auto_854609 ) ( ON ?auto_854607 ?auto_854608 ) ( ON ?auto_854606 ?auto_854607 ) ( CLEAR ?auto_854604 ) ( ON ?auto_854605 ?auto_854606 ) ( CLEAR ?auto_854605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_854604 ?auto_854605 )
      ( MAKE-7PILE ?auto_854604 ?auto_854605 ?auto_854606 ?auto_854607 ?auto_854608 ?auto_854609 ?auto_854610 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_854634 - BLOCK
      ?auto_854635 - BLOCK
      ?auto_854636 - BLOCK
      ?auto_854637 - BLOCK
      ?auto_854638 - BLOCK
      ?auto_854639 - BLOCK
      ?auto_854640 - BLOCK
    )
    :vars
    (
      ?auto_854641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854640 ?auto_854641 ) ( not ( = ?auto_854634 ?auto_854635 ) ) ( not ( = ?auto_854634 ?auto_854636 ) ) ( not ( = ?auto_854634 ?auto_854637 ) ) ( not ( = ?auto_854634 ?auto_854638 ) ) ( not ( = ?auto_854634 ?auto_854639 ) ) ( not ( = ?auto_854634 ?auto_854640 ) ) ( not ( = ?auto_854634 ?auto_854641 ) ) ( not ( = ?auto_854635 ?auto_854636 ) ) ( not ( = ?auto_854635 ?auto_854637 ) ) ( not ( = ?auto_854635 ?auto_854638 ) ) ( not ( = ?auto_854635 ?auto_854639 ) ) ( not ( = ?auto_854635 ?auto_854640 ) ) ( not ( = ?auto_854635 ?auto_854641 ) ) ( not ( = ?auto_854636 ?auto_854637 ) ) ( not ( = ?auto_854636 ?auto_854638 ) ) ( not ( = ?auto_854636 ?auto_854639 ) ) ( not ( = ?auto_854636 ?auto_854640 ) ) ( not ( = ?auto_854636 ?auto_854641 ) ) ( not ( = ?auto_854637 ?auto_854638 ) ) ( not ( = ?auto_854637 ?auto_854639 ) ) ( not ( = ?auto_854637 ?auto_854640 ) ) ( not ( = ?auto_854637 ?auto_854641 ) ) ( not ( = ?auto_854638 ?auto_854639 ) ) ( not ( = ?auto_854638 ?auto_854640 ) ) ( not ( = ?auto_854638 ?auto_854641 ) ) ( not ( = ?auto_854639 ?auto_854640 ) ) ( not ( = ?auto_854639 ?auto_854641 ) ) ( not ( = ?auto_854640 ?auto_854641 ) ) ( ON ?auto_854639 ?auto_854640 ) ( ON ?auto_854638 ?auto_854639 ) ( ON ?auto_854637 ?auto_854638 ) ( ON ?auto_854636 ?auto_854637 ) ( ON ?auto_854635 ?auto_854636 ) ( ON ?auto_854634 ?auto_854635 ) ( CLEAR ?auto_854634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_854634 )
      ( MAKE-7PILE ?auto_854634 ?auto_854635 ?auto_854636 ?auto_854637 ?auto_854638 ?auto_854639 ?auto_854640 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_854665 - BLOCK
      ?auto_854666 - BLOCK
      ?auto_854667 - BLOCK
      ?auto_854668 - BLOCK
      ?auto_854669 - BLOCK
      ?auto_854670 - BLOCK
      ?auto_854671 - BLOCK
      ?auto_854672 - BLOCK
    )
    :vars
    (
      ?auto_854673 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_854671 ) ( ON ?auto_854672 ?auto_854673 ) ( CLEAR ?auto_854672 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_854665 ) ( ON ?auto_854666 ?auto_854665 ) ( ON ?auto_854667 ?auto_854666 ) ( ON ?auto_854668 ?auto_854667 ) ( ON ?auto_854669 ?auto_854668 ) ( ON ?auto_854670 ?auto_854669 ) ( ON ?auto_854671 ?auto_854670 ) ( not ( = ?auto_854665 ?auto_854666 ) ) ( not ( = ?auto_854665 ?auto_854667 ) ) ( not ( = ?auto_854665 ?auto_854668 ) ) ( not ( = ?auto_854665 ?auto_854669 ) ) ( not ( = ?auto_854665 ?auto_854670 ) ) ( not ( = ?auto_854665 ?auto_854671 ) ) ( not ( = ?auto_854665 ?auto_854672 ) ) ( not ( = ?auto_854665 ?auto_854673 ) ) ( not ( = ?auto_854666 ?auto_854667 ) ) ( not ( = ?auto_854666 ?auto_854668 ) ) ( not ( = ?auto_854666 ?auto_854669 ) ) ( not ( = ?auto_854666 ?auto_854670 ) ) ( not ( = ?auto_854666 ?auto_854671 ) ) ( not ( = ?auto_854666 ?auto_854672 ) ) ( not ( = ?auto_854666 ?auto_854673 ) ) ( not ( = ?auto_854667 ?auto_854668 ) ) ( not ( = ?auto_854667 ?auto_854669 ) ) ( not ( = ?auto_854667 ?auto_854670 ) ) ( not ( = ?auto_854667 ?auto_854671 ) ) ( not ( = ?auto_854667 ?auto_854672 ) ) ( not ( = ?auto_854667 ?auto_854673 ) ) ( not ( = ?auto_854668 ?auto_854669 ) ) ( not ( = ?auto_854668 ?auto_854670 ) ) ( not ( = ?auto_854668 ?auto_854671 ) ) ( not ( = ?auto_854668 ?auto_854672 ) ) ( not ( = ?auto_854668 ?auto_854673 ) ) ( not ( = ?auto_854669 ?auto_854670 ) ) ( not ( = ?auto_854669 ?auto_854671 ) ) ( not ( = ?auto_854669 ?auto_854672 ) ) ( not ( = ?auto_854669 ?auto_854673 ) ) ( not ( = ?auto_854670 ?auto_854671 ) ) ( not ( = ?auto_854670 ?auto_854672 ) ) ( not ( = ?auto_854670 ?auto_854673 ) ) ( not ( = ?auto_854671 ?auto_854672 ) ) ( not ( = ?auto_854671 ?auto_854673 ) ) ( not ( = ?auto_854672 ?auto_854673 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_854672 ?auto_854673 )
      ( !STACK ?auto_854672 ?auto_854671 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_854699 - BLOCK
      ?auto_854700 - BLOCK
      ?auto_854701 - BLOCK
      ?auto_854702 - BLOCK
      ?auto_854703 - BLOCK
      ?auto_854704 - BLOCK
      ?auto_854705 - BLOCK
      ?auto_854706 - BLOCK
    )
    :vars
    (
      ?auto_854707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854706 ?auto_854707 ) ( ON-TABLE ?auto_854699 ) ( ON ?auto_854700 ?auto_854699 ) ( ON ?auto_854701 ?auto_854700 ) ( ON ?auto_854702 ?auto_854701 ) ( ON ?auto_854703 ?auto_854702 ) ( ON ?auto_854704 ?auto_854703 ) ( not ( = ?auto_854699 ?auto_854700 ) ) ( not ( = ?auto_854699 ?auto_854701 ) ) ( not ( = ?auto_854699 ?auto_854702 ) ) ( not ( = ?auto_854699 ?auto_854703 ) ) ( not ( = ?auto_854699 ?auto_854704 ) ) ( not ( = ?auto_854699 ?auto_854705 ) ) ( not ( = ?auto_854699 ?auto_854706 ) ) ( not ( = ?auto_854699 ?auto_854707 ) ) ( not ( = ?auto_854700 ?auto_854701 ) ) ( not ( = ?auto_854700 ?auto_854702 ) ) ( not ( = ?auto_854700 ?auto_854703 ) ) ( not ( = ?auto_854700 ?auto_854704 ) ) ( not ( = ?auto_854700 ?auto_854705 ) ) ( not ( = ?auto_854700 ?auto_854706 ) ) ( not ( = ?auto_854700 ?auto_854707 ) ) ( not ( = ?auto_854701 ?auto_854702 ) ) ( not ( = ?auto_854701 ?auto_854703 ) ) ( not ( = ?auto_854701 ?auto_854704 ) ) ( not ( = ?auto_854701 ?auto_854705 ) ) ( not ( = ?auto_854701 ?auto_854706 ) ) ( not ( = ?auto_854701 ?auto_854707 ) ) ( not ( = ?auto_854702 ?auto_854703 ) ) ( not ( = ?auto_854702 ?auto_854704 ) ) ( not ( = ?auto_854702 ?auto_854705 ) ) ( not ( = ?auto_854702 ?auto_854706 ) ) ( not ( = ?auto_854702 ?auto_854707 ) ) ( not ( = ?auto_854703 ?auto_854704 ) ) ( not ( = ?auto_854703 ?auto_854705 ) ) ( not ( = ?auto_854703 ?auto_854706 ) ) ( not ( = ?auto_854703 ?auto_854707 ) ) ( not ( = ?auto_854704 ?auto_854705 ) ) ( not ( = ?auto_854704 ?auto_854706 ) ) ( not ( = ?auto_854704 ?auto_854707 ) ) ( not ( = ?auto_854705 ?auto_854706 ) ) ( not ( = ?auto_854705 ?auto_854707 ) ) ( not ( = ?auto_854706 ?auto_854707 ) ) ( CLEAR ?auto_854704 ) ( ON ?auto_854705 ?auto_854706 ) ( CLEAR ?auto_854705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_854699 ?auto_854700 ?auto_854701 ?auto_854702 ?auto_854703 ?auto_854704 ?auto_854705 )
      ( MAKE-8PILE ?auto_854699 ?auto_854700 ?auto_854701 ?auto_854702 ?auto_854703 ?auto_854704 ?auto_854705 ?auto_854706 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_854733 - BLOCK
      ?auto_854734 - BLOCK
      ?auto_854735 - BLOCK
      ?auto_854736 - BLOCK
      ?auto_854737 - BLOCK
      ?auto_854738 - BLOCK
      ?auto_854739 - BLOCK
      ?auto_854740 - BLOCK
    )
    :vars
    (
      ?auto_854741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854740 ?auto_854741 ) ( ON-TABLE ?auto_854733 ) ( ON ?auto_854734 ?auto_854733 ) ( ON ?auto_854735 ?auto_854734 ) ( ON ?auto_854736 ?auto_854735 ) ( ON ?auto_854737 ?auto_854736 ) ( not ( = ?auto_854733 ?auto_854734 ) ) ( not ( = ?auto_854733 ?auto_854735 ) ) ( not ( = ?auto_854733 ?auto_854736 ) ) ( not ( = ?auto_854733 ?auto_854737 ) ) ( not ( = ?auto_854733 ?auto_854738 ) ) ( not ( = ?auto_854733 ?auto_854739 ) ) ( not ( = ?auto_854733 ?auto_854740 ) ) ( not ( = ?auto_854733 ?auto_854741 ) ) ( not ( = ?auto_854734 ?auto_854735 ) ) ( not ( = ?auto_854734 ?auto_854736 ) ) ( not ( = ?auto_854734 ?auto_854737 ) ) ( not ( = ?auto_854734 ?auto_854738 ) ) ( not ( = ?auto_854734 ?auto_854739 ) ) ( not ( = ?auto_854734 ?auto_854740 ) ) ( not ( = ?auto_854734 ?auto_854741 ) ) ( not ( = ?auto_854735 ?auto_854736 ) ) ( not ( = ?auto_854735 ?auto_854737 ) ) ( not ( = ?auto_854735 ?auto_854738 ) ) ( not ( = ?auto_854735 ?auto_854739 ) ) ( not ( = ?auto_854735 ?auto_854740 ) ) ( not ( = ?auto_854735 ?auto_854741 ) ) ( not ( = ?auto_854736 ?auto_854737 ) ) ( not ( = ?auto_854736 ?auto_854738 ) ) ( not ( = ?auto_854736 ?auto_854739 ) ) ( not ( = ?auto_854736 ?auto_854740 ) ) ( not ( = ?auto_854736 ?auto_854741 ) ) ( not ( = ?auto_854737 ?auto_854738 ) ) ( not ( = ?auto_854737 ?auto_854739 ) ) ( not ( = ?auto_854737 ?auto_854740 ) ) ( not ( = ?auto_854737 ?auto_854741 ) ) ( not ( = ?auto_854738 ?auto_854739 ) ) ( not ( = ?auto_854738 ?auto_854740 ) ) ( not ( = ?auto_854738 ?auto_854741 ) ) ( not ( = ?auto_854739 ?auto_854740 ) ) ( not ( = ?auto_854739 ?auto_854741 ) ) ( not ( = ?auto_854740 ?auto_854741 ) ) ( ON ?auto_854739 ?auto_854740 ) ( CLEAR ?auto_854737 ) ( ON ?auto_854738 ?auto_854739 ) ( CLEAR ?auto_854738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_854733 ?auto_854734 ?auto_854735 ?auto_854736 ?auto_854737 ?auto_854738 )
      ( MAKE-8PILE ?auto_854733 ?auto_854734 ?auto_854735 ?auto_854736 ?auto_854737 ?auto_854738 ?auto_854739 ?auto_854740 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_854767 - BLOCK
      ?auto_854768 - BLOCK
      ?auto_854769 - BLOCK
      ?auto_854770 - BLOCK
      ?auto_854771 - BLOCK
      ?auto_854772 - BLOCK
      ?auto_854773 - BLOCK
      ?auto_854774 - BLOCK
    )
    :vars
    (
      ?auto_854775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854774 ?auto_854775 ) ( ON-TABLE ?auto_854767 ) ( ON ?auto_854768 ?auto_854767 ) ( ON ?auto_854769 ?auto_854768 ) ( ON ?auto_854770 ?auto_854769 ) ( not ( = ?auto_854767 ?auto_854768 ) ) ( not ( = ?auto_854767 ?auto_854769 ) ) ( not ( = ?auto_854767 ?auto_854770 ) ) ( not ( = ?auto_854767 ?auto_854771 ) ) ( not ( = ?auto_854767 ?auto_854772 ) ) ( not ( = ?auto_854767 ?auto_854773 ) ) ( not ( = ?auto_854767 ?auto_854774 ) ) ( not ( = ?auto_854767 ?auto_854775 ) ) ( not ( = ?auto_854768 ?auto_854769 ) ) ( not ( = ?auto_854768 ?auto_854770 ) ) ( not ( = ?auto_854768 ?auto_854771 ) ) ( not ( = ?auto_854768 ?auto_854772 ) ) ( not ( = ?auto_854768 ?auto_854773 ) ) ( not ( = ?auto_854768 ?auto_854774 ) ) ( not ( = ?auto_854768 ?auto_854775 ) ) ( not ( = ?auto_854769 ?auto_854770 ) ) ( not ( = ?auto_854769 ?auto_854771 ) ) ( not ( = ?auto_854769 ?auto_854772 ) ) ( not ( = ?auto_854769 ?auto_854773 ) ) ( not ( = ?auto_854769 ?auto_854774 ) ) ( not ( = ?auto_854769 ?auto_854775 ) ) ( not ( = ?auto_854770 ?auto_854771 ) ) ( not ( = ?auto_854770 ?auto_854772 ) ) ( not ( = ?auto_854770 ?auto_854773 ) ) ( not ( = ?auto_854770 ?auto_854774 ) ) ( not ( = ?auto_854770 ?auto_854775 ) ) ( not ( = ?auto_854771 ?auto_854772 ) ) ( not ( = ?auto_854771 ?auto_854773 ) ) ( not ( = ?auto_854771 ?auto_854774 ) ) ( not ( = ?auto_854771 ?auto_854775 ) ) ( not ( = ?auto_854772 ?auto_854773 ) ) ( not ( = ?auto_854772 ?auto_854774 ) ) ( not ( = ?auto_854772 ?auto_854775 ) ) ( not ( = ?auto_854773 ?auto_854774 ) ) ( not ( = ?auto_854773 ?auto_854775 ) ) ( not ( = ?auto_854774 ?auto_854775 ) ) ( ON ?auto_854773 ?auto_854774 ) ( ON ?auto_854772 ?auto_854773 ) ( CLEAR ?auto_854770 ) ( ON ?auto_854771 ?auto_854772 ) ( CLEAR ?auto_854771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_854767 ?auto_854768 ?auto_854769 ?auto_854770 ?auto_854771 )
      ( MAKE-8PILE ?auto_854767 ?auto_854768 ?auto_854769 ?auto_854770 ?auto_854771 ?auto_854772 ?auto_854773 ?auto_854774 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_854801 - BLOCK
      ?auto_854802 - BLOCK
      ?auto_854803 - BLOCK
      ?auto_854804 - BLOCK
      ?auto_854805 - BLOCK
      ?auto_854806 - BLOCK
      ?auto_854807 - BLOCK
      ?auto_854808 - BLOCK
    )
    :vars
    (
      ?auto_854809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854808 ?auto_854809 ) ( ON-TABLE ?auto_854801 ) ( ON ?auto_854802 ?auto_854801 ) ( ON ?auto_854803 ?auto_854802 ) ( not ( = ?auto_854801 ?auto_854802 ) ) ( not ( = ?auto_854801 ?auto_854803 ) ) ( not ( = ?auto_854801 ?auto_854804 ) ) ( not ( = ?auto_854801 ?auto_854805 ) ) ( not ( = ?auto_854801 ?auto_854806 ) ) ( not ( = ?auto_854801 ?auto_854807 ) ) ( not ( = ?auto_854801 ?auto_854808 ) ) ( not ( = ?auto_854801 ?auto_854809 ) ) ( not ( = ?auto_854802 ?auto_854803 ) ) ( not ( = ?auto_854802 ?auto_854804 ) ) ( not ( = ?auto_854802 ?auto_854805 ) ) ( not ( = ?auto_854802 ?auto_854806 ) ) ( not ( = ?auto_854802 ?auto_854807 ) ) ( not ( = ?auto_854802 ?auto_854808 ) ) ( not ( = ?auto_854802 ?auto_854809 ) ) ( not ( = ?auto_854803 ?auto_854804 ) ) ( not ( = ?auto_854803 ?auto_854805 ) ) ( not ( = ?auto_854803 ?auto_854806 ) ) ( not ( = ?auto_854803 ?auto_854807 ) ) ( not ( = ?auto_854803 ?auto_854808 ) ) ( not ( = ?auto_854803 ?auto_854809 ) ) ( not ( = ?auto_854804 ?auto_854805 ) ) ( not ( = ?auto_854804 ?auto_854806 ) ) ( not ( = ?auto_854804 ?auto_854807 ) ) ( not ( = ?auto_854804 ?auto_854808 ) ) ( not ( = ?auto_854804 ?auto_854809 ) ) ( not ( = ?auto_854805 ?auto_854806 ) ) ( not ( = ?auto_854805 ?auto_854807 ) ) ( not ( = ?auto_854805 ?auto_854808 ) ) ( not ( = ?auto_854805 ?auto_854809 ) ) ( not ( = ?auto_854806 ?auto_854807 ) ) ( not ( = ?auto_854806 ?auto_854808 ) ) ( not ( = ?auto_854806 ?auto_854809 ) ) ( not ( = ?auto_854807 ?auto_854808 ) ) ( not ( = ?auto_854807 ?auto_854809 ) ) ( not ( = ?auto_854808 ?auto_854809 ) ) ( ON ?auto_854807 ?auto_854808 ) ( ON ?auto_854806 ?auto_854807 ) ( ON ?auto_854805 ?auto_854806 ) ( CLEAR ?auto_854803 ) ( ON ?auto_854804 ?auto_854805 ) ( CLEAR ?auto_854804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_854801 ?auto_854802 ?auto_854803 ?auto_854804 )
      ( MAKE-8PILE ?auto_854801 ?auto_854802 ?auto_854803 ?auto_854804 ?auto_854805 ?auto_854806 ?auto_854807 ?auto_854808 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_854835 - BLOCK
      ?auto_854836 - BLOCK
      ?auto_854837 - BLOCK
      ?auto_854838 - BLOCK
      ?auto_854839 - BLOCK
      ?auto_854840 - BLOCK
      ?auto_854841 - BLOCK
      ?auto_854842 - BLOCK
    )
    :vars
    (
      ?auto_854843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854842 ?auto_854843 ) ( ON-TABLE ?auto_854835 ) ( ON ?auto_854836 ?auto_854835 ) ( not ( = ?auto_854835 ?auto_854836 ) ) ( not ( = ?auto_854835 ?auto_854837 ) ) ( not ( = ?auto_854835 ?auto_854838 ) ) ( not ( = ?auto_854835 ?auto_854839 ) ) ( not ( = ?auto_854835 ?auto_854840 ) ) ( not ( = ?auto_854835 ?auto_854841 ) ) ( not ( = ?auto_854835 ?auto_854842 ) ) ( not ( = ?auto_854835 ?auto_854843 ) ) ( not ( = ?auto_854836 ?auto_854837 ) ) ( not ( = ?auto_854836 ?auto_854838 ) ) ( not ( = ?auto_854836 ?auto_854839 ) ) ( not ( = ?auto_854836 ?auto_854840 ) ) ( not ( = ?auto_854836 ?auto_854841 ) ) ( not ( = ?auto_854836 ?auto_854842 ) ) ( not ( = ?auto_854836 ?auto_854843 ) ) ( not ( = ?auto_854837 ?auto_854838 ) ) ( not ( = ?auto_854837 ?auto_854839 ) ) ( not ( = ?auto_854837 ?auto_854840 ) ) ( not ( = ?auto_854837 ?auto_854841 ) ) ( not ( = ?auto_854837 ?auto_854842 ) ) ( not ( = ?auto_854837 ?auto_854843 ) ) ( not ( = ?auto_854838 ?auto_854839 ) ) ( not ( = ?auto_854838 ?auto_854840 ) ) ( not ( = ?auto_854838 ?auto_854841 ) ) ( not ( = ?auto_854838 ?auto_854842 ) ) ( not ( = ?auto_854838 ?auto_854843 ) ) ( not ( = ?auto_854839 ?auto_854840 ) ) ( not ( = ?auto_854839 ?auto_854841 ) ) ( not ( = ?auto_854839 ?auto_854842 ) ) ( not ( = ?auto_854839 ?auto_854843 ) ) ( not ( = ?auto_854840 ?auto_854841 ) ) ( not ( = ?auto_854840 ?auto_854842 ) ) ( not ( = ?auto_854840 ?auto_854843 ) ) ( not ( = ?auto_854841 ?auto_854842 ) ) ( not ( = ?auto_854841 ?auto_854843 ) ) ( not ( = ?auto_854842 ?auto_854843 ) ) ( ON ?auto_854841 ?auto_854842 ) ( ON ?auto_854840 ?auto_854841 ) ( ON ?auto_854839 ?auto_854840 ) ( ON ?auto_854838 ?auto_854839 ) ( CLEAR ?auto_854836 ) ( ON ?auto_854837 ?auto_854838 ) ( CLEAR ?auto_854837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_854835 ?auto_854836 ?auto_854837 )
      ( MAKE-8PILE ?auto_854835 ?auto_854836 ?auto_854837 ?auto_854838 ?auto_854839 ?auto_854840 ?auto_854841 ?auto_854842 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_854869 - BLOCK
      ?auto_854870 - BLOCK
      ?auto_854871 - BLOCK
      ?auto_854872 - BLOCK
      ?auto_854873 - BLOCK
      ?auto_854874 - BLOCK
      ?auto_854875 - BLOCK
      ?auto_854876 - BLOCK
    )
    :vars
    (
      ?auto_854877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854876 ?auto_854877 ) ( ON-TABLE ?auto_854869 ) ( not ( = ?auto_854869 ?auto_854870 ) ) ( not ( = ?auto_854869 ?auto_854871 ) ) ( not ( = ?auto_854869 ?auto_854872 ) ) ( not ( = ?auto_854869 ?auto_854873 ) ) ( not ( = ?auto_854869 ?auto_854874 ) ) ( not ( = ?auto_854869 ?auto_854875 ) ) ( not ( = ?auto_854869 ?auto_854876 ) ) ( not ( = ?auto_854869 ?auto_854877 ) ) ( not ( = ?auto_854870 ?auto_854871 ) ) ( not ( = ?auto_854870 ?auto_854872 ) ) ( not ( = ?auto_854870 ?auto_854873 ) ) ( not ( = ?auto_854870 ?auto_854874 ) ) ( not ( = ?auto_854870 ?auto_854875 ) ) ( not ( = ?auto_854870 ?auto_854876 ) ) ( not ( = ?auto_854870 ?auto_854877 ) ) ( not ( = ?auto_854871 ?auto_854872 ) ) ( not ( = ?auto_854871 ?auto_854873 ) ) ( not ( = ?auto_854871 ?auto_854874 ) ) ( not ( = ?auto_854871 ?auto_854875 ) ) ( not ( = ?auto_854871 ?auto_854876 ) ) ( not ( = ?auto_854871 ?auto_854877 ) ) ( not ( = ?auto_854872 ?auto_854873 ) ) ( not ( = ?auto_854872 ?auto_854874 ) ) ( not ( = ?auto_854872 ?auto_854875 ) ) ( not ( = ?auto_854872 ?auto_854876 ) ) ( not ( = ?auto_854872 ?auto_854877 ) ) ( not ( = ?auto_854873 ?auto_854874 ) ) ( not ( = ?auto_854873 ?auto_854875 ) ) ( not ( = ?auto_854873 ?auto_854876 ) ) ( not ( = ?auto_854873 ?auto_854877 ) ) ( not ( = ?auto_854874 ?auto_854875 ) ) ( not ( = ?auto_854874 ?auto_854876 ) ) ( not ( = ?auto_854874 ?auto_854877 ) ) ( not ( = ?auto_854875 ?auto_854876 ) ) ( not ( = ?auto_854875 ?auto_854877 ) ) ( not ( = ?auto_854876 ?auto_854877 ) ) ( ON ?auto_854875 ?auto_854876 ) ( ON ?auto_854874 ?auto_854875 ) ( ON ?auto_854873 ?auto_854874 ) ( ON ?auto_854872 ?auto_854873 ) ( ON ?auto_854871 ?auto_854872 ) ( CLEAR ?auto_854869 ) ( ON ?auto_854870 ?auto_854871 ) ( CLEAR ?auto_854870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_854869 ?auto_854870 )
      ( MAKE-8PILE ?auto_854869 ?auto_854870 ?auto_854871 ?auto_854872 ?auto_854873 ?auto_854874 ?auto_854875 ?auto_854876 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_854903 - BLOCK
      ?auto_854904 - BLOCK
      ?auto_854905 - BLOCK
      ?auto_854906 - BLOCK
      ?auto_854907 - BLOCK
      ?auto_854908 - BLOCK
      ?auto_854909 - BLOCK
      ?auto_854910 - BLOCK
    )
    :vars
    (
      ?auto_854911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854910 ?auto_854911 ) ( not ( = ?auto_854903 ?auto_854904 ) ) ( not ( = ?auto_854903 ?auto_854905 ) ) ( not ( = ?auto_854903 ?auto_854906 ) ) ( not ( = ?auto_854903 ?auto_854907 ) ) ( not ( = ?auto_854903 ?auto_854908 ) ) ( not ( = ?auto_854903 ?auto_854909 ) ) ( not ( = ?auto_854903 ?auto_854910 ) ) ( not ( = ?auto_854903 ?auto_854911 ) ) ( not ( = ?auto_854904 ?auto_854905 ) ) ( not ( = ?auto_854904 ?auto_854906 ) ) ( not ( = ?auto_854904 ?auto_854907 ) ) ( not ( = ?auto_854904 ?auto_854908 ) ) ( not ( = ?auto_854904 ?auto_854909 ) ) ( not ( = ?auto_854904 ?auto_854910 ) ) ( not ( = ?auto_854904 ?auto_854911 ) ) ( not ( = ?auto_854905 ?auto_854906 ) ) ( not ( = ?auto_854905 ?auto_854907 ) ) ( not ( = ?auto_854905 ?auto_854908 ) ) ( not ( = ?auto_854905 ?auto_854909 ) ) ( not ( = ?auto_854905 ?auto_854910 ) ) ( not ( = ?auto_854905 ?auto_854911 ) ) ( not ( = ?auto_854906 ?auto_854907 ) ) ( not ( = ?auto_854906 ?auto_854908 ) ) ( not ( = ?auto_854906 ?auto_854909 ) ) ( not ( = ?auto_854906 ?auto_854910 ) ) ( not ( = ?auto_854906 ?auto_854911 ) ) ( not ( = ?auto_854907 ?auto_854908 ) ) ( not ( = ?auto_854907 ?auto_854909 ) ) ( not ( = ?auto_854907 ?auto_854910 ) ) ( not ( = ?auto_854907 ?auto_854911 ) ) ( not ( = ?auto_854908 ?auto_854909 ) ) ( not ( = ?auto_854908 ?auto_854910 ) ) ( not ( = ?auto_854908 ?auto_854911 ) ) ( not ( = ?auto_854909 ?auto_854910 ) ) ( not ( = ?auto_854909 ?auto_854911 ) ) ( not ( = ?auto_854910 ?auto_854911 ) ) ( ON ?auto_854909 ?auto_854910 ) ( ON ?auto_854908 ?auto_854909 ) ( ON ?auto_854907 ?auto_854908 ) ( ON ?auto_854906 ?auto_854907 ) ( ON ?auto_854905 ?auto_854906 ) ( ON ?auto_854904 ?auto_854905 ) ( ON ?auto_854903 ?auto_854904 ) ( CLEAR ?auto_854903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_854903 )
      ( MAKE-8PILE ?auto_854903 ?auto_854904 ?auto_854905 ?auto_854906 ?auto_854907 ?auto_854908 ?auto_854909 ?auto_854910 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_854938 - BLOCK
      ?auto_854939 - BLOCK
      ?auto_854940 - BLOCK
      ?auto_854941 - BLOCK
      ?auto_854942 - BLOCK
      ?auto_854943 - BLOCK
      ?auto_854944 - BLOCK
      ?auto_854945 - BLOCK
      ?auto_854946 - BLOCK
    )
    :vars
    (
      ?auto_854947 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_854945 ) ( ON ?auto_854946 ?auto_854947 ) ( CLEAR ?auto_854946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_854938 ) ( ON ?auto_854939 ?auto_854938 ) ( ON ?auto_854940 ?auto_854939 ) ( ON ?auto_854941 ?auto_854940 ) ( ON ?auto_854942 ?auto_854941 ) ( ON ?auto_854943 ?auto_854942 ) ( ON ?auto_854944 ?auto_854943 ) ( ON ?auto_854945 ?auto_854944 ) ( not ( = ?auto_854938 ?auto_854939 ) ) ( not ( = ?auto_854938 ?auto_854940 ) ) ( not ( = ?auto_854938 ?auto_854941 ) ) ( not ( = ?auto_854938 ?auto_854942 ) ) ( not ( = ?auto_854938 ?auto_854943 ) ) ( not ( = ?auto_854938 ?auto_854944 ) ) ( not ( = ?auto_854938 ?auto_854945 ) ) ( not ( = ?auto_854938 ?auto_854946 ) ) ( not ( = ?auto_854938 ?auto_854947 ) ) ( not ( = ?auto_854939 ?auto_854940 ) ) ( not ( = ?auto_854939 ?auto_854941 ) ) ( not ( = ?auto_854939 ?auto_854942 ) ) ( not ( = ?auto_854939 ?auto_854943 ) ) ( not ( = ?auto_854939 ?auto_854944 ) ) ( not ( = ?auto_854939 ?auto_854945 ) ) ( not ( = ?auto_854939 ?auto_854946 ) ) ( not ( = ?auto_854939 ?auto_854947 ) ) ( not ( = ?auto_854940 ?auto_854941 ) ) ( not ( = ?auto_854940 ?auto_854942 ) ) ( not ( = ?auto_854940 ?auto_854943 ) ) ( not ( = ?auto_854940 ?auto_854944 ) ) ( not ( = ?auto_854940 ?auto_854945 ) ) ( not ( = ?auto_854940 ?auto_854946 ) ) ( not ( = ?auto_854940 ?auto_854947 ) ) ( not ( = ?auto_854941 ?auto_854942 ) ) ( not ( = ?auto_854941 ?auto_854943 ) ) ( not ( = ?auto_854941 ?auto_854944 ) ) ( not ( = ?auto_854941 ?auto_854945 ) ) ( not ( = ?auto_854941 ?auto_854946 ) ) ( not ( = ?auto_854941 ?auto_854947 ) ) ( not ( = ?auto_854942 ?auto_854943 ) ) ( not ( = ?auto_854942 ?auto_854944 ) ) ( not ( = ?auto_854942 ?auto_854945 ) ) ( not ( = ?auto_854942 ?auto_854946 ) ) ( not ( = ?auto_854942 ?auto_854947 ) ) ( not ( = ?auto_854943 ?auto_854944 ) ) ( not ( = ?auto_854943 ?auto_854945 ) ) ( not ( = ?auto_854943 ?auto_854946 ) ) ( not ( = ?auto_854943 ?auto_854947 ) ) ( not ( = ?auto_854944 ?auto_854945 ) ) ( not ( = ?auto_854944 ?auto_854946 ) ) ( not ( = ?auto_854944 ?auto_854947 ) ) ( not ( = ?auto_854945 ?auto_854946 ) ) ( not ( = ?auto_854945 ?auto_854947 ) ) ( not ( = ?auto_854946 ?auto_854947 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_854946 ?auto_854947 )
      ( !STACK ?auto_854946 ?auto_854945 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_854976 - BLOCK
      ?auto_854977 - BLOCK
      ?auto_854978 - BLOCK
      ?auto_854979 - BLOCK
      ?auto_854980 - BLOCK
      ?auto_854981 - BLOCK
      ?auto_854982 - BLOCK
      ?auto_854983 - BLOCK
      ?auto_854984 - BLOCK
    )
    :vars
    (
      ?auto_854985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_854984 ?auto_854985 ) ( ON-TABLE ?auto_854976 ) ( ON ?auto_854977 ?auto_854976 ) ( ON ?auto_854978 ?auto_854977 ) ( ON ?auto_854979 ?auto_854978 ) ( ON ?auto_854980 ?auto_854979 ) ( ON ?auto_854981 ?auto_854980 ) ( ON ?auto_854982 ?auto_854981 ) ( not ( = ?auto_854976 ?auto_854977 ) ) ( not ( = ?auto_854976 ?auto_854978 ) ) ( not ( = ?auto_854976 ?auto_854979 ) ) ( not ( = ?auto_854976 ?auto_854980 ) ) ( not ( = ?auto_854976 ?auto_854981 ) ) ( not ( = ?auto_854976 ?auto_854982 ) ) ( not ( = ?auto_854976 ?auto_854983 ) ) ( not ( = ?auto_854976 ?auto_854984 ) ) ( not ( = ?auto_854976 ?auto_854985 ) ) ( not ( = ?auto_854977 ?auto_854978 ) ) ( not ( = ?auto_854977 ?auto_854979 ) ) ( not ( = ?auto_854977 ?auto_854980 ) ) ( not ( = ?auto_854977 ?auto_854981 ) ) ( not ( = ?auto_854977 ?auto_854982 ) ) ( not ( = ?auto_854977 ?auto_854983 ) ) ( not ( = ?auto_854977 ?auto_854984 ) ) ( not ( = ?auto_854977 ?auto_854985 ) ) ( not ( = ?auto_854978 ?auto_854979 ) ) ( not ( = ?auto_854978 ?auto_854980 ) ) ( not ( = ?auto_854978 ?auto_854981 ) ) ( not ( = ?auto_854978 ?auto_854982 ) ) ( not ( = ?auto_854978 ?auto_854983 ) ) ( not ( = ?auto_854978 ?auto_854984 ) ) ( not ( = ?auto_854978 ?auto_854985 ) ) ( not ( = ?auto_854979 ?auto_854980 ) ) ( not ( = ?auto_854979 ?auto_854981 ) ) ( not ( = ?auto_854979 ?auto_854982 ) ) ( not ( = ?auto_854979 ?auto_854983 ) ) ( not ( = ?auto_854979 ?auto_854984 ) ) ( not ( = ?auto_854979 ?auto_854985 ) ) ( not ( = ?auto_854980 ?auto_854981 ) ) ( not ( = ?auto_854980 ?auto_854982 ) ) ( not ( = ?auto_854980 ?auto_854983 ) ) ( not ( = ?auto_854980 ?auto_854984 ) ) ( not ( = ?auto_854980 ?auto_854985 ) ) ( not ( = ?auto_854981 ?auto_854982 ) ) ( not ( = ?auto_854981 ?auto_854983 ) ) ( not ( = ?auto_854981 ?auto_854984 ) ) ( not ( = ?auto_854981 ?auto_854985 ) ) ( not ( = ?auto_854982 ?auto_854983 ) ) ( not ( = ?auto_854982 ?auto_854984 ) ) ( not ( = ?auto_854982 ?auto_854985 ) ) ( not ( = ?auto_854983 ?auto_854984 ) ) ( not ( = ?auto_854983 ?auto_854985 ) ) ( not ( = ?auto_854984 ?auto_854985 ) ) ( CLEAR ?auto_854982 ) ( ON ?auto_854983 ?auto_854984 ) ( CLEAR ?auto_854983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_854976 ?auto_854977 ?auto_854978 ?auto_854979 ?auto_854980 ?auto_854981 ?auto_854982 ?auto_854983 )
      ( MAKE-9PILE ?auto_854976 ?auto_854977 ?auto_854978 ?auto_854979 ?auto_854980 ?auto_854981 ?auto_854982 ?auto_854983 ?auto_854984 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_855014 - BLOCK
      ?auto_855015 - BLOCK
      ?auto_855016 - BLOCK
      ?auto_855017 - BLOCK
      ?auto_855018 - BLOCK
      ?auto_855019 - BLOCK
      ?auto_855020 - BLOCK
      ?auto_855021 - BLOCK
      ?auto_855022 - BLOCK
    )
    :vars
    (
      ?auto_855023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855022 ?auto_855023 ) ( ON-TABLE ?auto_855014 ) ( ON ?auto_855015 ?auto_855014 ) ( ON ?auto_855016 ?auto_855015 ) ( ON ?auto_855017 ?auto_855016 ) ( ON ?auto_855018 ?auto_855017 ) ( ON ?auto_855019 ?auto_855018 ) ( not ( = ?auto_855014 ?auto_855015 ) ) ( not ( = ?auto_855014 ?auto_855016 ) ) ( not ( = ?auto_855014 ?auto_855017 ) ) ( not ( = ?auto_855014 ?auto_855018 ) ) ( not ( = ?auto_855014 ?auto_855019 ) ) ( not ( = ?auto_855014 ?auto_855020 ) ) ( not ( = ?auto_855014 ?auto_855021 ) ) ( not ( = ?auto_855014 ?auto_855022 ) ) ( not ( = ?auto_855014 ?auto_855023 ) ) ( not ( = ?auto_855015 ?auto_855016 ) ) ( not ( = ?auto_855015 ?auto_855017 ) ) ( not ( = ?auto_855015 ?auto_855018 ) ) ( not ( = ?auto_855015 ?auto_855019 ) ) ( not ( = ?auto_855015 ?auto_855020 ) ) ( not ( = ?auto_855015 ?auto_855021 ) ) ( not ( = ?auto_855015 ?auto_855022 ) ) ( not ( = ?auto_855015 ?auto_855023 ) ) ( not ( = ?auto_855016 ?auto_855017 ) ) ( not ( = ?auto_855016 ?auto_855018 ) ) ( not ( = ?auto_855016 ?auto_855019 ) ) ( not ( = ?auto_855016 ?auto_855020 ) ) ( not ( = ?auto_855016 ?auto_855021 ) ) ( not ( = ?auto_855016 ?auto_855022 ) ) ( not ( = ?auto_855016 ?auto_855023 ) ) ( not ( = ?auto_855017 ?auto_855018 ) ) ( not ( = ?auto_855017 ?auto_855019 ) ) ( not ( = ?auto_855017 ?auto_855020 ) ) ( not ( = ?auto_855017 ?auto_855021 ) ) ( not ( = ?auto_855017 ?auto_855022 ) ) ( not ( = ?auto_855017 ?auto_855023 ) ) ( not ( = ?auto_855018 ?auto_855019 ) ) ( not ( = ?auto_855018 ?auto_855020 ) ) ( not ( = ?auto_855018 ?auto_855021 ) ) ( not ( = ?auto_855018 ?auto_855022 ) ) ( not ( = ?auto_855018 ?auto_855023 ) ) ( not ( = ?auto_855019 ?auto_855020 ) ) ( not ( = ?auto_855019 ?auto_855021 ) ) ( not ( = ?auto_855019 ?auto_855022 ) ) ( not ( = ?auto_855019 ?auto_855023 ) ) ( not ( = ?auto_855020 ?auto_855021 ) ) ( not ( = ?auto_855020 ?auto_855022 ) ) ( not ( = ?auto_855020 ?auto_855023 ) ) ( not ( = ?auto_855021 ?auto_855022 ) ) ( not ( = ?auto_855021 ?auto_855023 ) ) ( not ( = ?auto_855022 ?auto_855023 ) ) ( ON ?auto_855021 ?auto_855022 ) ( CLEAR ?auto_855019 ) ( ON ?auto_855020 ?auto_855021 ) ( CLEAR ?auto_855020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_855014 ?auto_855015 ?auto_855016 ?auto_855017 ?auto_855018 ?auto_855019 ?auto_855020 )
      ( MAKE-9PILE ?auto_855014 ?auto_855015 ?auto_855016 ?auto_855017 ?auto_855018 ?auto_855019 ?auto_855020 ?auto_855021 ?auto_855022 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_855052 - BLOCK
      ?auto_855053 - BLOCK
      ?auto_855054 - BLOCK
      ?auto_855055 - BLOCK
      ?auto_855056 - BLOCK
      ?auto_855057 - BLOCK
      ?auto_855058 - BLOCK
      ?auto_855059 - BLOCK
      ?auto_855060 - BLOCK
    )
    :vars
    (
      ?auto_855061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855060 ?auto_855061 ) ( ON-TABLE ?auto_855052 ) ( ON ?auto_855053 ?auto_855052 ) ( ON ?auto_855054 ?auto_855053 ) ( ON ?auto_855055 ?auto_855054 ) ( ON ?auto_855056 ?auto_855055 ) ( not ( = ?auto_855052 ?auto_855053 ) ) ( not ( = ?auto_855052 ?auto_855054 ) ) ( not ( = ?auto_855052 ?auto_855055 ) ) ( not ( = ?auto_855052 ?auto_855056 ) ) ( not ( = ?auto_855052 ?auto_855057 ) ) ( not ( = ?auto_855052 ?auto_855058 ) ) ( not ( = ?auto_855052 ?auto_855059 ) ) ( not ( = ?auto_855052 ?auto_855060 ) ) ( not ( = ?auto_855052 ?auto_855061 ) ) ( not ( = ?auto_855053 ?auto_855054 ) ) ( not ( = ?auto_855053 ?auto_855055 ) ) ( not ( = ?auto_855053 ?auto_855056 ) ) ( not ( = ?auto_855053 ?auto_855057 ) ) ( not ( = ?auto_855053 ?auto_855058 ) ) ( not ( = ?auto_855053 ?auto_855059 ) ) ( not ( = ?auto_855053 ?auto_855060 ) ) ( not ( = ?auto_855053 ?auto_855061 ) ) ( not ( = ?auto_855054 ?auto_855055 ) ) ( not ( = ?auto_855054 ?auto_855056 ) ) ( not ( = ?auto_855054 ?auto_855057 ) ) ( not ( = ?auto_855054 ?auto_855058 ) ) ( not ( = ?auto_855054 ?auto_855059 ) ) ( not ( = ?auto_855054 ?auto_855060 ) ) ( not ( = ?auto_855054 ?auto_855061 ) ) ( not ( = ?auto_855055 ?auto_855056 ) ) ( not ( = ?auto_855055 ?auto_855057 ) ) ( not ( = ?auto_855055 ?auto_855058 ) ) ( not ( = ?auto_855055 ?auto_855059 ) ) ( not ( = ?auto_855055 ?auto_855060 ) ) ( not ( = ?auto_855055 ?auto_855061 ) ) ( not ( = ?auto_855056 ?auto_855057 ) ) ( not ( = ?auto_855056 ?auto_855058 ) ) ( not ( = ?auto_855056 ?auto_855059 ) ) ( not ( = ?auto_855056 ?auto_855060 ) ) ( not ( = ?auto_855056 ?auto_855061 ) ) ( not ( = ?auto_855057 ?auto_855058 ) ) ( not ( = ?auto_855057 ?auto_855059 ) ) ( not ( = ?auto_855057 ?auto_855060 ) ) ( not ( = ?auto_855057 ?auto_855061 ) ) ( not ( = ?auto_855058 ?auto_855059 ) ) ( not ( = ?auto_855058 ?auto_855060 ) ) ( not ( = ?auto_855058 ?auto_855061 ) ) ( not ( = ?auto_855059 ?auto_855060 ) ) ( not ( = ?auto_855059 ?auto_855061 ) ) ( not ( = ?auto_855060 ?auto_855061 ) ) ( ON ?auto_855059 ?auto_855060 ) ( ON ?auto_855058 ?auto_855059 ) ( CLEAR ?auto_855056 ) ( ON ?auto_855057 ?auto_855058 ) ( CLEAR ?auto_855057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_855052 ?auto_855053 ?auto_855054 ?auto_855055 ?auto_855056 ?auto_855057 )
      ( MAKE-9PILE ?auto_855052 ?auto_855053 ?auto_855054 ?auto_855055 ?auto_855056 ?auto_855057 ?auto_855058 ?auto_855059 ?auto_855060 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_855090 - BLOCK
      ?auto_855091 - BLOCK
      ?auto_855092 - BLOCK
      ?auto_855093 - BLOCK
      ?auto_855094 - BLOCK
      ?auto_855095 - BLOCK
      ?auto_855096 - BLOCK
      ?auto_855097 - BLOCK
      ?auto_855098 - BLOCK
    )
    :vars
    (
      ?auto_855099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855098 ?auto_855099 ) ( ON-TABLE ?auto_855090 ) ( ON ?auto_855091 ?auto_855090 ) ( ON ?auto_855092 ?auto_855091 ) ( ON ?auto_855093 ?auto_855092 ) ( not ( = ?auto_855090 ?auto_855091 ) ) ( not ( = ?auto_855090 ?auto_855092 ) ) ( not ( = ?auto_855090 ?auto_855093 ) ) ( not ( = ?auto_855090 ?auto_855094 ) ) ( not ( = ?auto_855090 ?auto_855095 ) ) ( not ( = ?auto_855090 ?auto_855096 ) ) ( not ( = ?auto_855090 ?auto_855097 ) ) ( not ( = ?auto_855090 ?auto_855098 ) ) ( not ( = ?auto_855090 ?auto_855099 ) ) ( not ( = ?auto_855091 ?auto_855092 ) ) ( not ( = ?auto_855091 ?auto_855093 ) ) ( not ( = ?auto_855091 ?auto_855094 ) ) ( not ( = ?auto_855091 ?auto_855095 ) ) ( not ( = ?auto_855091 ?auto_855096 ) ) ( not ( = ?auto_855091 ?auto_855097 ) ) ( not ( = ?auto_855091 ?auto_855098 ) ) ( not ( = ?auto_855091 ?auto_855099 ) ) ( not ( = ?auto_855092 ?auto_855093 ) ) ( not ( = ?auto_855092 ?auto_855094 ) ) ( not ( = ?auto_855092 ?auto_855095 ) ) ( not ( = ?auto_855092 ?auto_855096 ) ) ( not ( = ?auto_855092 ?auto_855097 ) ) ( not ( = ?auto_855092 ?auto_855098 ) ) ( not ( = ?auto_855092 ?auto_855099 ) ) ( not ( = ?auto_855093 ?auto_855094 ) ) ( not ( = ?auto_855093 ?auto_855095 ) ) ( not ( = ?auto_855093 ?auto_855096 ) ) ( not ( = ?auto_855093 ?auto_855097 ) ) ( not ( = ?auto_855093 ?auto_855098 ) ) ( not ( = ?auto_855093 ?auto_855099 ) ) ( not ( = ?auto_855094 ?auto_855095 ) ) ( not ( = ?auto_855094 ?auto_855096 ) ) ( not ( = ?auto_855094 ?auto_855097 ) ) ( not ( = ?auto_855094 ?auto_855098 ) ) ( not ( = ?auto_855094 ?auto_855099 ) ) ( not ( = ?auto_855095 ?auto_855096 ) ) ( not ( = ?auto_855095 ?auto_855097 ) ) ( not ( = ?auto_855095 ?auto_855098 ) ) ( not ( = ?auto_855095 ?auto_855099 ) ) ( not ( = ?auto_855096 ?auto_855097 ) ) ( not ( = ?auto_855096 ?auto_855098 ) ) ( not ( = ?auto_855096 ?auto_855099 ) ) ( not ( = ?auto_855097 ?auto_855098 ) ) ( not ( = ?auto_855097 ?auto_855099 ) ) ( not ( = ?auto_855098 ?auto_855099 ) ) ( ON ?auto_855097 ?auto_855098 ) ( ON ?auto_855096 ?auto_855097 ) ( ON ?auto_855095 ?auto_855096 ) ( CLEAR ?auto_855093 ) ( ON ?auto_855094 ?auto_855095 ) ( CLEAR ?auto_855094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_855090 ?auto_855091 ?auto_855092 ?auto_855093 ?auto_855094 )
      ( MAKE-9PILE ?auto_855090 ?auto_855091 ?auto_855092 ?auto_855093 ?auto_855094 ?auto_855095 ?auto_855096 ?auto_855097 ?auto_855098 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_855128 - BLOCK
      ?auto_855129 - BLOCK
      ?auto_855130 - BLOCK
      ?auto_855131 - BLOCK
      ?auto_855132 - BLOCK
      ?auto_855133 - BLOCK
      ?auto_855134 - BLOCK
      ?auto_855135 - BLOCK
      ?auto_855136 - BLOCK
    )
    :vars
    (
      ?auto_855137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855136 ?auto_855137 ) ( ON-TABLE ?auto_855128 ) ( ON ?auto_855129 ?auto_855128 ) ( ON ?auto_855130 ?auto_855129 ) ( not ( = ?auto_855128 ?auto_855129 ) ) ( not ( = ?auto_855128 ?auto_855130 ) ) ( not ( = ?auto_855128 ?auto_855131 ) ) ( not ( = ?auto_855128 ?auto_855132 ) ) ( not ( = ?auto_855128 ?auto_855133 ) ) ( not ( = ?auto_855128 ?auto_855134 ) ) ( not ( = ?auto_855128 ?auto_855135 ) ) ( not ( = ?auto_855128 ?auto_855136 ) ) ( not ( = ?auto_855128 ?auto_855137 ) ) ( not ( = ?auto_855129 ?auto_855130 ) ) ( not ( = ?auto_855129 ?auto_855131 ) ) ( not ( = ?auto_855129 ?auto_855132 ) ) ( not ( = ?auto_855129 ?auto_855133 ) ) ( not ( = ?auto_855129 ?auto_855134 ) ) ( not ( = ?auto_855129 ?auto_855135 ) ) ( not ( = ?auto_855129 ?auto_855136 ) ) ( not ( = ?auto_855129 ?auto_855137 ) ) ( not ( = ?auto_855130 ?auto_855131 ) ) ( not ( = ?auto_855130 ?auto_855132 ) ) ( not ( = ?auto_855130 ?auto_855133 ) ) ( not ( = ?auto_855130 ?auto_855134 ) ) ( not ( = ?auto_855130 ?auto_855135 ) ) ( not ( = ?auto_855130 ?auto_855136 ) ) ( not ( = ?auto_855130 ?auto_855137 ) ) ( not ( = ?auto_855131 ?auto_855132 ) ) ( not ( = ?auto_855131 ?auto_855133 ) ) ( not ( = ?auto_855131 ?auto_855134 ) ) ( not ( = ?auto_855131 ?auto_855135 ) ) ( not ( = ?auto_855131 ?auto_855136 ) ) ( not ( = ?auto_855131 ?auto_855137 ) ) ( not ( = ?auto_855132 ?auto_855133 ) ) ( not ( = ?auto_855132 ?auto_855134 ) ) ( not ( = ?auto_855132 ?auto_855135 ) ) ( not ( = ?auto_855132 ?auto_855136 ) ) ( not ( = ?auto_855132 ?auto_855137 ) ) ( not ( = ?auto_855133 ?auto_855134 ) ) ( not ( = ?auto_855133 ?auto_855135 ) ) ( not ( = ?auto_855133 ?auto_855136 ) ) ( not ( = ?auto_855133 ?auto_855137 ) ) ( not ( = ?auto_855134 ?auto_855135 ) ) ( not ( = ?auto_855134 ?auto_855136 ) ) ( not ( = ?auto_855134 ?auto_855137 ) ) ( not ( = ?auto_855135 ?auto_855136 ) ) ( not ( = ?auto_855135 ?auto_855137 ) ) ( not ( = ?auto_855136 ?auto_855137 ) ) ( ON ?auto_855135 ?auto_855136 ) ( ON ?auto_855134 ?auto_855135 ) ( ON ?auto_855133 ?auto_855134 ) ( ON ?auto_855132 ?auto_855133 ) ( CLEAR ?auto_855130 ) ( ON ?auto_855131 ?auto_855132 ) ( CLEAR ?auto_855131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_855128 ?auto_855129 ?auto_855130 ?auto_855131 )
      ( MAKE-9PILE ?auto_855128 ?auto_855129 ?auto_855130 ?auto_855131 ?auto_855132 ?auto_855133 ?auto_855134 ?auto_855135 ?auto_855136 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_855166 - BLOCK
      ?auto_855167 - BLOCK
      ?auto_855168 - BLOCK
      ?auto_855169 - BLOCK
      ?auto_855170 - BLOCK
      ?auto_855171 - BLOCK
      ?auto_855172 - BLOCK
      ?auto_855173 - BLOCK
      ?auto_855174 - BLOCK
    )
    :vars
    (
      ?auto_855175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855174 ?auto_855175 ) ( ON-TABLE ?auto_855166 ) ( ON ?auto_855167 ?auto_855166 ) ( not ( = ?auto_855166 ?auto_855167 ) ) ( not ( = ?auto_855166 ?auto_855168 ) ) ( not ( = ?auto_855166 ?auto_855169 ) ) ( not ( = ?auto_855166 ?auto_855170 ) ) ( not ( = ?auto_855166 ?auto_855171 ) ) ( not ( = ?auto_855166 ?auto_855172 ) ) ( not ( = ?auto_855166 ?auto_855173 ) ) ( not ( = ?auto_855166 ?auto_855174 ) ) ( not ( = ?auto_855166 ?auto_855175 ) ) ( not ( = ?auto_855167 ?auto_855168 ) ) ( not ( = ?auto_855167 ?auto_855169 ) ) ( not ( = ?auto_855167 ?auto_855170 ) ) ( not ( = ?auto_855167 ?auto_855171 ) ) ( not ( = ?auto_855167 ?auto_855172 ) ) ( not ( = ?auto_855167 ?auto_855173 ) ) ( not ( = ?auto_855167 ?auto_855174 ) ) ( not ( = ?auto_855167 ?auto_855175 ) ) ( not ( = ?auto_855168 ?auto_855169 ) ) ( not ( = ?auto_855168 ?auto_855170 ) ) ( not ( = ?auto_855168 ?auto_855171 ) ) ( not ( = ?auto_855168 ?auto_855172 ) ) ( not ( = ?auto_855168 ?auto_855173 ) ) ( not ( = ?auto_855168 ?auto_855174 ) ) ( not ( = ?auto_855168 ?auto_855175 ) ) ( not ( = ?auto_855169 ?auto_855170 ) ) ( not ( = ?auto_855169 ?auto_855171 ) ) ( not ( = ?auto_855169 ?auto_855172 ) ) ( not ( = ?auto_855169 ?auto_855173 ) ) ( not ( = ?auto_855169 ?auto_855174 ) ) ( not ( = ?auto_855169 ?auto_855175 ) ) ( not ( = ?auto_855170 ?auto_855171 ) ) ( not ( = ?auto_855170 ?auto_855172 ) ) ( not ( = ?auto_855170 ?auto_855173 ) ) ( not ( = ?auto_855170 ?auto_855174 ) ) ( not ( = ?auto_855170 ?auto_855175 ) ) ( not ( = ?auto_855171 ?auto_855172 ) ) ( not ( = ?auto_855171 ?auto_855173 ) ) ( not ( = ?auto_855171 ?auto_855174 ) ) ( not ( = ?auto_855171 ?auto_855175 ) ) ( not ( = ?auto_855172 ?auto_855173 ) ) ( not ( = ?auto_855172 ?auto_855174 ) ) ( not ( = ?auto_855172 ?auto_855175 ) ) ( not ( = ?auto_855173 ?auto_855174 ) ) ( not ( = ?auto_855173 ?auto_855175 ) ) ( not ( = ?auto_855174 ?auto_855175 ) ) ( ON ?auto_855173 ?auto_855174 ) ( ON ?auto_855172 ?auto_855173 ) ( ON ?auto_855171 ?auto_855172 ) ( ON ?auto_855170 ?auto_855171 ) ( ON ?auto_855169 ?auto_855170 ) ( CLEAR ?auto_855167 ) ( ON ?auto_855168 ?auto_855169 ) ( CLEAR ?auto_855168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_855166 ?auto_855167 ?auto_855168 )
      ( MAKE-9PILE ?auto_855166 ?auto_855167 ?auto_855168 ?auto_855169 ?auto_855170 ?auto_855171 ?auto_855172 ?auto_855173 ?auto_855174 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_855204 - BLOCK
      ?auto_855205 - BLOCK
      ?auto_855206 - BLOCK
      ?auto_855207 - BLOCK
      ?auto_855208 - BLOCK
      ?auto_855209 - BLOCK
      ?auto_855210 - BLOCK
      ?auto_855211 - BLOCK
      ?auto_855212 - BLOCK
    )
    :vars
    (
      ?auto_855213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855212 ?auto_855213 ) ( ON-TABLE ?auto_855204 ) ( not ( = ?auto_855204 ?auto_855205 ) ) ( not ( = ?auto_855204 ?auto_855206 ) ) ( not ( = ?auto_855204 ?auto_855207 ) ) ( not ( = ?auto_855204 ?auto_855208 ) ) ( not ( = ?auto_855204 ?auto_855209 ) ) ( not ( = ?auto_855204 ?auto_855210 ) ) ( not ( = ?auto_855204 ?auto_855211 ) ) ( not ( = ?auto_855204 ?auto_855212 ) ) ( not ( = ?auto_855204 ?auto_855213 ) ) ( not ( = ?auto_855205 ?auto_855206 ) ) ( not ( = ?auto_855205 ?auto_855207 ) ) ( not ( = ?auto_855205 ?auto_855208 ) ) ( not ( = ?auto_855205 ?auto_855209 ) ) ( not ( = ?auto_855205 ?auto_855210 ) ) ( not ( = ?auto_855205 ?auto_855211 ) ) ( not ( = ?auto_855205 ?auto_855212 ) ) ( not ( = ?auto_855205 ?auto_855213 ) ) ( not ( = ?auto_855206 ?auto_855207 ) ) ( not ( = ?auto_855206 ?auto_855208 ) ) ( not ( = ?auto_855206 ?auto_855209 ) ) ( not ( = ?auto_855206 ?auto_855210 ) ) ( not ( = ?auto_855206 ?auto_855211 ) ) ( not ( = ?auto_855206 ?auto_855212 ) ) ( not ( = ?auto_855206 ?auto_855213 ) ) ( not ( = ?auto_855207 ?auto_855208 ) ) ( not ( = ?auto_855207 ?auto_855209 ) ) ( not ( = ?auto_855207 ?auto_855210 ) ) ( not ( = ?auto_855207 ?auto_855211 ) ) ( not ( = ?auto_855207 ?auto_855212 ) ) ( not ( = ?auto_855207 ?auto_855213 ) ) ( not ( = ?auto_855208 ?auto_855209 ) ) ( not ( = ?auto_855208 ?auto_855210 ) ) ( not ( = ?auto_855208 ?auto_855211 ) ) ( not ( = ?auto_855208 ?auto_855212 ) ) ( not ( = ?auto_855208 ?auto_855213 ) ) ( not ( = ?auto_855209 ?auto_855210 ) ) ( not ( = ?auto_855209 ?auto_855211 ) ) ( not ( = ?auto_855209 ?auto_855212 ) ) ( not ( = ?auto_855209 ?auto_855213 ) ) ( not ( = ?auto_855210 ?auto_855211 ) ) ( not ( = ?auto_855210 ?auto_855212 ) ) ( not ( = ?auto_855210 ?auto_855213 ) ) ( not ( = ?auto_855211 ?auto_855212 ) ) ( not ( = ?auto_855211 ?auto_855213 ) ) ( not ( = ?auto_855212 ?auto_855213 ) ) ( ON ?auto_855211 ?auto_855212 ) ( ON ?auto_855210 ?auto_855211 ) ( ON ?auto_855209 ?auto_855210 ) ( ON ?auto_855208 ?auto_855209 ) ( ON ?auto_855207 ?auto_855208 ) ( ON ?auto_855206 ?auto_855207 ) ( CLEAR ?auto_855204 ) ( ON ?auto_855205 ?auto_855206 ) ( CLEAR ?auto_855205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_855204 ?auto_855205 )
      ( MAKE-9PILE ?auto_855204 ?auto_855205 ?auto_855206 ?auto_855207 ?auto_855208 ?auto_855209 ?auto_855210 ?auto_855211 ?auto_855212 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_855242 - BLOCK
      ?auto_855243 - BLOCK
      ?auto_855244 - BLOCK
      ?auto_855245 - BLOCK
      ?auto_855246 - BLOCK
      ?auto_855247 - BLOCK
      ?auto_855248 - BLOCK
      ?auto_855249 - BLOCK
      ?auto_855250 - BLOCK
    )
    :vars
    (
      ?auto_855251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855250 ?auto_855251 ) ( not ( = ?auto_855242 ?auto_855243 ) ) ( not ( = ?auto_855242 ?auto_855244 ) ) ( not ( = ?auto_855242 ?auto_855245 ) ) ( not ( = ?auto_855242 ?auto_855246 ) ) ( not ( = ?auto_855242 ?auto_855247 ) ) ( not ( = ?auto_855242 ?auto_855248 ) ) ( not ( = ?auto_855242 ?auto_855249 ) ) ( not ( = ?auto_855242 ?auto_855250 ) ) ( not ( = ?auto_855242 ?auto_855251 ) ) ( not ( = ?auto_855243 ?auto_855244 ) ) ( not ( = ?auto_855243 ?auto_855245 ) ) ( not ( = ?auto_855243 ?auto_855246 ) ) ( not ( = ?auto_855243 ?auto_855247 ) ) ( not ( = ?auto_855243 ?auto_855248 ) ) ( not ( = ?auto_855243 ?auto_855249 ) ) ( not ( = ?auto_855243 ?auto_855250 ) ) ( not ( = ?auto_855243 ?auto_855251 ) ) ( not ( = ?auto_855244 ?auto_855245 ) ) ( not ( = ?auto_855244 ?auto_855246 ) ) ( not ( = ?auto_855244 ?auto_855247 ) ) ( not ( = ?auto_855244 ?auto_855248 ) ) ( not ( = ?auto_855244 ?auto_855249 ) ) ( not ( = ?auto_855244 ?auto_855250 ) ) ( not ( = ?auto_855244 ?auto_855251 ) ) ( not ( = ?auto_855245 ?auto_855246 ) ) ( not ( = ?auto_855245 ?auto_855247 ) ) ( not ( = ?auto_855245 ?auto_855248 ) ) ( not ( = ?auto_855245 ?auto_855249 ) ) ( not ( = ?auto_855245 ?auto_855250 ) ) ( not ( = ?auto_855245 ?auto_855251 ) ) ( not ( = ?auto_855246 ?auto_855247 ) ) ( not ( = ?auto_855246 ?auto_855248 ) ) ( not ( = ?auto_855246 ?auto_855249 ) ) ( not ( = ?auto_855246 ?auto_855250 ) ) ( not ( = ?auto_855246 ?auto_855251 ) ) ( not ( = ?auto_855247 ?auto_855248 ) ) ( not ( = ?auto_855247 ?auto_855249 ) ) ( not ( = ?auto_855247 ?auto_855250 ) ) ( not ( = ?auto_855247 ?auto_855251 ) ) ( not ( = ?auto_855248 ?auto_855249 ) ) ( not ( = ?auto_855248 ?auto_855250 ) ) ( not ( = ?auto_855248 ?auto_855251 ) ) ( not ( = ?auto_855249 ?auto_855250 ) ) ( not ( = ?auto_855249 ?auto_855251 ) ) ( not ( = ?auto_855250 ?auto_855251 ) ) ( ON ?auto_855249 ?auto_855250 ) ( ON ?auto_855248 ?auto_855249 ) ( ON ?auto_855247 ?auto_855248 ) ( ON ?auto_855246 ?auto_855247 ) ( ON ?auto_855245 ?auto_855246 ) ( ON ?auto_855244 ?auto_855245 ) ( ON ?auto_855243 ?auto_855244 ) ( ON ?auto_855242 ?auto_855243 ) ( CLEAR ?auto_855242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_855242 )
      ( MAKE-9PILE ?auto_855242 ?auto_855243 ?auto_855244 ?auto_855245 ?auto_855246 ?auto_855247 ?auto_855248 ?auto_855249 ?auto_855250 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_855281 - BLOCK
      ?auto_855282 - BLOCK
      ?auto_855283 - BLOCK
      ?auto_855284 - BLOCK
      ?auto_855285 - BLOCK
      ?auto_855286 - BLOCK
      ?auto_855287 - BLOCK
      ?auto_855288 - BLOCK
      ?auto_855289 - BLOCK
      ?auto_855290 - BLOCK
    )
    :vars
    (
      ?auto_855291 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_855289 ) ( ON ?auto_855290 ?auto_855291 ) ( CLEAR ?auto_855290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_855281 ) ( ON ?auto_855282 ?auto_855281 ) ( ON ?auto_855283 ?auto_855282 ) ( ON ?auto_855284 ?auto_855283 ) ( ON ?auto_855285 ?auto_855284 ) ( ON ?auto_855286 ?auto_855285 ) ( ON ?auto_855287 ?auto_855286 ) ( ON ?auto_855288 ?auto_855287 ) ( ON ?auto_855289 ?auto_855288 ) ( not ( = ?auto_855281 ?auto_855282 ) ) ( not ( = ?auto_855281 ?auto_855283 ) ) ( not ( = ?auto_855281 ?auto_855284 ) ) ( not ( = ?auto_855281 ?auto_855285 ) ) ( not ( = ?auto_855281 ?auto_855286 ) ) ( not ( = ?auto_855281 ?auto_855287 ) ) ( not ( = ?auto_855281 ?auto_855288 ) ) ( not ( = ?auto_855281 ?auto_855289 ) ) ( not ( = ?auto_855281 ?auto_855290 ) ) ( not ( = ?auto_855281 ?auto_855291 ) ) ( not ( = ?auto_855282 ?auto_855283 ) ) ( not ( = ?auto_855282 ?auto_855284 ) ) ( not ( = ?auto_855282 ?auto_855285 ) ) ( not ( = ?auto_855282 ?auto_855286 ) ) ( not ( = ?auto_855282 ?auto_855287 ) ) ( not ( = ?auto_855282 ?auto_855288 ) ) ( not ( = ?auto_855282 ?auto_855289 ) ) ( not ( = ?auto_855282 ?auto_855290 ) ) ( not ( = ?auto_855282 ?auto_855291 ) ) ( not ( = ?auto_855283 ?auto_855284 ) ) ( not ( = ?auto_855283 ?auto_855285 ) ) ( not ( = ?auto_855283 ?auto_855286 ) ) ( not ( = ?auto_855283 ?auto_855287 ) ) ( not ( = ?auto_855283 ?auto_855288 ) ) ( not ( = ?auto_855283 ?auto_855289 ) ) ( not ( = ?auto_855283 ?auto_855290 ) ) ( not ( = ?auto_855283 ?auto_855291 ) ) ( not ( = ?auto_855284 ?auto_855285 ) ) ( not ( = ?auto_855284 ?auto_855286 ) ) ( not ( = ?auto_855284 ?auto_855287 ) ) ( not ( = ?auto_855284 ?auto_855288 ) ) ( not ( = ?auto_855284 ?auto_855289 ) ) ( not ( = ?auto_855284 ?auto_855290 ) ) ( not ( = ?auto_855284 ?auto_855291 ) ) ( not ( = ?auto_855285 ?auto_855286 ) ) ( not ( = ?auto_855285 ?auto_855287 ) ) ( not ( = ?auto_855285 ?auto_855288 ) ) ( not ( = ?auto_855285 ?auto_855289 ) ) ( not ( = ?auto_855285 ?auto_855290 ) ) ( not ( = ?auto_855285 ?auto_855291 ) ) ( not ( = ?auto_855286 ?auto_855287 ) ) ( not ( = ?auto_855286 ?auto_855288 ) ) ( not ( = ?auto_855286 ?auto_855289 ) ) ( not ( = ?auto_855286 ?auto_855290 ) ) ( not ( = ?auto_855286 ?auto_855291 ) ) ( not ( = ?auto_855287 ?auto_855288 ) ) ( not ( = ?auto_855287 ?auto_855289 ) ) ( not ( = ?auto_855287 ?auto_855290 ) ) ( not ( = ?auto_855287 ?auto_855291 ) ) ( not ( = ?auto_855288 ?auto_855289 ) ) ( not ( = ?auto_855288 ?auto_855290 ) ) ( not ( = ?auto_855288 ?auto_855291 ) ) ( not ( = ?auto_855289 ?auto_855290 ) ) ( not ( = ?auto_855289 ?auto_855291 ) ) ( not ( = ?auto_855290 ?auto_855291 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_855290 ?auto_855291 )
      ( !STACK ?auto_855290 ?auto_855289 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_855323 - BLOCK
      ?auto_855324 - BLOCK
      ?auto_855325 - BLOCK
      ?auto_855326 - BLOCK
      ?auto_855327 - BLOCK
      ?auto_855328 - BLOCK
      ?auto_855329 - BLOCK
      ?auto_855330 - BLOCK
      ?auto_855331 - BLOCK
      ?auto_855332 - BLOCK
    )
    :vars
    (
      ?auto_855333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855332 ?auto_855333 ) ( ON-TABLE ?auto_855323 ) ( ON ?auto_855324 ?auto_855323 ) ( ON ?auto_855325 ?auto_855324 ) ( ON ?auto_855326 ?auto_855325 ) ( ON ?auto_855327 ?auto_855326 ) ( ON ?auto_855328 ?auto_855327 ) ( ON ?auto_855329 ?auto_855328 ) ( ON ?auto_855330 ?auto_855329 ) ( not ( = ?auto_855323 ?auto_855324 ) ) ( not ( = ?auto_855323 ?auto_855325 ) ) ( not ( = ?auto_855323 ?auto_855326 ) ) ( not ( = ?auto_855323 ?auto_855327 ) ) ( not ( = ?auto_855323 ?auto_855328 ) ) ( not ( = ?auto_855323 ?auto_855329 ) ) ( not ( = ?auto_855323 ?auto_855330 ) ) ( not ( = ?auto_855323 ?auto_855331 ) ) ( not ( = ?auto_855323 ?auto_855332 ) ) ( not ( = ?auto_855323 ?auto_855333 ) ) ( not ( = ?auto_855324 ?auto_855325 ) ) ( not ( = ?auto_855324 ?auto_855326 ) ) ( not ( = ?auto_855324 ?auto_855327 ) ) ( not ( = ?auto_855324 ?auto_855328 ) ) ( not ( = ?auto_855324 ?auto_855329 ) ) ( not ( = ?auto_855324 ?auto_855330 ) ) ( not ( = ?auto_855324 ?auto_855331 ) ) ( not ( = ?auto_855324 ?auto_855332 ) ) ( not ( = ?auto_855324 ?auto_855333 ) ) ( not ( = ?auto_855325 ?auto_855326 ) ) ( not ( = ?auto_855325 ?auto_855327 ) ) ( not ( = ?auto_855325 ?auto_855328 ) ) ( not ( = ?auto_855325 ?auto_855329 ) ) ( not ( = ?auto_855325 ?auto_855330 ) ) ( not ( = ?auto_855325 ?auto_855331 ) ) ( not ( = ?auto_855325 ?auto_855332 ) ) ( not ( = ?auto_855325 ?auto_855333 ) ) ( not ( = ?auto_855326 ?auto_855327 ) ) ( not ( = ?auto_855326 ?auto_855328 ) ) ( not ( = ?auto_855326 ?auto_855329 ) ) ( not ( = ?auto_855326 ?auto_855330 ) ) ( not ( = ?auto_855326 ?auto_855331 ) ) ( not ( = ?auto_855326 ?auto_855332 ) ) ( not ( = ?auto_855326 ?auto_855333 ) ) ( not ( = ?auto_855327 ?auto_855328 ) ) ( not ( = ?auto_855327 ?auto_855329 ) ) ( not ( = ?auto_855327 ?auto_855330 ) ) ( not ( = ?auto_855327 ?auto_855331 ) ) ( not ( = ?auto_855327 ?auto_855332 ) ) ( not ( = ?auto_855327 ?auto_855333 ) ) ( not ( = ?auto_855328 ?auto_855329 ) ) ( not ( = ?auto_855328 ?auto_855330 ) ) ( not ( = ?auto_855328 ?auto_855331 ) ) ( not ( = ?auto_855328 ?auto_855332 ) ) ( not ( = ?auto_855328 ?auto_855333 ) ) ( not ( = ?auto_855329 ?auto_855330 ) ) ( not ( = ?auto_855329 ?auto_855331 ) ) ( not ( = ?auto_855329 ?auto_855332 ) ) ( not ( = ?auto_855329 ?auto_855333 ) ) ( not ( = ?auto_855330 ?auto_855331 ) ) ( not ( = ?auto_855330 ?auto_855332 ) ) ( not ( = ?auto_855330 ?auto_855333 ) ) ( not ( = ?auto_855331 ?auto_855332 ) ) ( not ( = ?auto_855331 ?auto_855333 ) ) ( not ( = ?auto_855332 ?auto_855333 ) ) ( CLEAR ?auto_855330 ) ( ON ?auto_855331 ?auto_855332 ) ( CLEAR ?auto_855331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_855323 ?auto_855324 ?auto_855325 ?auto_855326 ?auto_855327 ?auto_855328 ?auto_855329 ?auto_855330 ?auto_855331 )
      ( MAKE-10PILE ?auto_855323 ?auto_855324 ?auto_855325 ?auto_855326 ?auto_855327 ?auto_855328 ?auto_855329 ?auto_855330 ?auto_855331 ?auto_855332 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_855365 - BLOCK
      ?auto_855366 - BLOCK
      ?auto_855367 - BLOCK
      ?auto_855368 - BLOCK
      ?auto_855369 - BLOCK
      ?auto_855370 - BLOCK
      ?auto_855371 - BLOCK
      ?auto_855372 - BLOCK
      ?auto_855373 - BLOCK
      ?auto_855374 - BLOCK
    )
    :vars
    (
      ?auto_855375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855374 ?auto_855375 ) ( ON-TABLE ?auto_855365 ) ( ON ?auto_855366 ?auto_855365 ) ( ON ?auto_855367 ?auto_855366 ) ( ON ?auto_855368 ?auto_855367 ) ( ON ?auto_855369 ?auto_855368 ) ( ON ?auto_855370 ?auto_855369 ) ( ON ?auto_855371 ?auto_855370 ) ( not ( = ?auto_855365 ?auto_855366 ) ) ( not ( = ?auto_855365 ?auto_855367 ) ) ( not ( = ?auto_855365 ?auto_855368 ) ) ( not ( = ?auto_855365 ?auto_855369 ) ) ( not ( = ?auto_855365 ?auto_855370 ) ) ( not ( = ?auto_855365 ?auto_855371 ) ) ( not ( = ?auto_855365 ?auto_855372 ) ) ( not ( = ?auto_855365 ?auto_855373 ) ) ( not ( = ?auto_855365 ?auto_855374 ) ) ( not ( = ?auto_855365 ?auto_855375 ) ) ( not ( = ?auto_855366 ?auto_855367 ) ) ( not ( = ?auto_855366 ?auto_855368 ) ) ( not ( = ?auto_855366 ?auto_855369 ) ) ( not ( = ?auto_855366 ?auto_855370 ) ) ( not ( = ?auto_855366 ?auto_855371 ) ) ( not ( = ?auto_855366 ?auto_855372 ) ) ( not ( = ?auto_855366 ?auto_855373 ) ) ( not ( = ?auto_855366 ?auto_855374 ) ) ( not ( = ?auto_855366 ?auto_855375 ) ) ( not ( = ?auto_855367 ?auto_855368 ) ) ( not ( = ?auto_855367 ?auto_855369 ) ) ( not ( = ?auto_855367 ?auto_855370 ) ) ( not ( = ?auto_855367 ?auto_855371 ) ) ( not ( = ?auto_855367 ?auto_855372 ) ) ( not ( = ?auto_855367 ?auto_855373 ) ) ( not ( = ?auto_855367 ?auto_855374 ) ) ( not ( = ?auto_855367 ?auto_855375 ) ) ( not ( = ?auto_855368 ?auto_855369 ) ) ( not ( = ?auto_855368 ?auto_855370 ) ) ( not ( = ?auto_855368 ?auto_855371 ) ) ( not ( = ?auto_855368 ?auto_855372 ) ) ( not ( = ?auto_855368 ?auto_855373 ) ) ( not ( = ?auto_855368 ?auto_855374 ) ) ( not ( = ?auto_855368 ?auto_855375 ) ) ( not ( = ?auto_855369 ?auto_855370 ) ) ( not ( = ?auto_855369 ?auto_855371 ) ) ( not ( = ?auto_855369 ?auto_855372 ) ) ( not ( = ?auto_855369 ?auto_855373 ) ) ( not ( = ?auto_855369 ?auto_855374 ) ) ( not ( = ?auto_855369 ?auto_855375 ) ) ( not ( = ?auto_855370 ?auto_855371 ) ) ( not ( = ?auto_855370 ?auto_855372 ) ) ( not ( = ?auto_855370 ?auto_855373 ) ) ( not ( = ?auto_855370 ?auto_855374 ) ) ( not ( = ?auto_855370 ?auto_855375 ) ) ( not ( = ?auto_855371 ?auto_855372 ) ) ( not ( = ?auto_855371 ?auto_855373 ) ) ( not ( = ?auto_855371 ?auto_855374 ) ) ( not ( = ?auto_855371 ?auto_855375 ) ) ( not ( = ?auto_855372 ?auto_855373 ) ) ( not ( = ?auto_855372 ?auto_855374 ) ) ( not ( = ?auto_855372 ?auto_855375 ) ) ( not ( = ?auto_855373 ?auto_855374 ) ) ( not ( = ?auto_855373 ?auto_855375 ) ) ( not ( = ?auto_855374 ?auto_855375 ) ) ( ON ?auto_855373 ?auto_855374 ) ( CLEAR ?auto_855371 ) ( ON ?auto_855372 ?auto_855373 ) ( CLEAR ?auto_855372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_855365 ?auto_855366 ?auto_855367 ?auto_855368 ?auto_855369 ?auto_855370 ?auto_855371 ?auto_855372 )
      ( MAKE-10PILE ?auto_855365 ?auto_855366 ?auto_855367 ?auto_855368 ?auto_855369 ?auto_855370 ?auto_855371 ?auto_855372 ?auto_855373 ?auto_855374 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_855407 - BLOCK
      ?auto_855408 - BLOCK
      ?auto_855409 - BLOCK
      ?auto_855410 - BLOCK
      ?auto_855411 - BLOCK
      ?auto_855412 - BLOCK
      ?auto_855413 - BLOCK
      ?auto_855414 - BLOCK
      ?auto_855415 - BLOCK
      ?auto_855416 - BLOCK
    )
    :vars
    (
      ?auto_855417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855416 ?auto_855417 ) ( ON-TABLE ?auto_855407 ) ( ON ?auto_855408 ?auto_855407 ) ( ON ?auto_855409 ?auto_855408 ) ( ON ?auto_855410 ?auto_855409 ) ( ON ?auto_855411 ?auto_855410 ) ( ON ?auto_855412 ?auto_855411 ) ( not ( = ?auto_855407 ?auto_855408 ) ) ( not ( = ?auto_855407 ?auto_855409 ) ) ( not ( = ?auto_855407 ?auto_855410 ) ) ( not ( = ?auto_855407 ?auto_855411 ) ) ( not ( = ?auto_855407 ?auto_855412 ) ) ( not ( = ?auto_855407 ?auto_855413 ) ) ( not ( = ?auto_855407 ?auto_855414 ) ) ( not ( = ?auto_855407 ?auto_855415 ) ) ( not ( = ?auto_855407 ?auto_855416 ) ) ( not ( = ?auto_855407 ?auto_855417 ) ) ( not ( = ?auto_855408 ?auto_855409 ) ) ( not ( = ?auto_855408 ?auto_855410 ) ) ( not ( = ?auto_855408 ?auto_855411 ) ) ( not ( = ?auto_855408 ?auto_855412 ) ) ( not ( = ?auto_855408 ?auto_855413 ) ) ( not ( = ?auto_855408 ?auto_855414 ) ) ( not ( = ?auto_855408 ?auto_855415 ) ) ( not ( = ?auto_855408 ?auto_855416 ) ) ( not ( = ?auto_855408 ?auto_855417 ) ) ( not ( = ?auto_855409 ?auto_855410 ) ) ( not ( = ?auto_855409 ?auto_855411 ) ) ( not ( = ?auto_855409 ?auto_855412 ) ) ( not ( = ?auto_855409 ?auto_855413 ) ) ( not ( = ?auto_855409 ?auto_855414 ) ) ( not ( = ?auto_855409 ?auto_855415 ) ) ( not ( = ?auto_855409 ?auto_855416 ) ) ( not ( = ?auto_855409 ?auto_855417 ) ) ( not ( = ?auto_855410 ?auto_855411 ) ) ( not ( = ?auto_855410 ?auto_855412 ) ) ( not ( = ?auto_855410 ?auto_855413 ) ) ( not ( = ?auto_855410 ?auto_855414 ) ) ( not ( = ?auto_855410 ?auto_855415 ) ) ( not ( = ?auto_855410 ?auto_855416 ) ) ( not ( = ?auto_855410 ?auto_855417 ) ) ( not ( = ?auto_855411 ?auto_855412 ) ) ( not ( = ?auto_855411 ?auto_855413 ) ) ( not ( = ?auto_855411 ?auto_855414 ) ) ( not ( = ?auto_855411 ?auto_855415 ) ) ( not ( = ?auto_855411 ?auto_855416 ) ) ( not ( = ?auto_855411 ?auto_855417 ) ) ( not ( = ?auto_855412 ?auto_855413 ) ) ( not ( = ?auto_855412 ?auto_855414 ) ) ( not ( = ?auto_855412 ?auto_855415 ) ) ( not ( = ?auto_855412 ?auto_855416 ) ) ( not ( = ?auto_855412 ?auto_855417 ) ) ( not ( = ?auto_855413 ?auto_855414 ) ) ( not ( = ?auto_855413 ?auto_855415 ) ) ( not ( = ?auto_855413 ?auto_855416 ) ) ( not ( = ?auto_855413 ?auto_855417 ) ) ( not ( = ?auto_855414 ?auto_855415 ) ) ( not ( = ?auto_855414 ?auto_855416 ) ) ( not ( = ?auto_855414 ?auto_855417 ) ) ( not ( = ?auto_855415 ?auto_855416 ) ) ( not ( = ?auto_855415 ?auto_855417 ) ) ( not ( = ?auto_855416 ?auto_855417 ) ) ( ON ?auto_855415 ?auto_855416 ) ( ON ?auto_855414 ?auto_855415 ) ( CLEAR ?auto_855412 ) ( ON ?auto_855413 ?auto_855414 ) ( CLEAR ?auto_855413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_855407 ?auto_855408 ?auto_855409 ?auto_855410 ?auto_855411 ?auto_855412 ?auto_855413 )
      ( MAKE-10PILE ?auto_855407 ?auto_855408 ?auto_855409 ?auto_855410 ?auto_855411 ?auto_855412 ?auto_855413 ?auto_855414 ?auto_855415 ?auto_855416 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_855449 - BLOCK
      ?auto_855450 - BLOCK
      ?auto_855451 - BLOCK
      ?auto_855452 - BLOCK
      ?auto_855453 - BLOCK
      ?auto_855454 - BLOCK
      ?auto_855455 - BLOCK
      ?auto_855456 - BLOCK
      ?auto_855457 - BLOCK
      ?auto_855458 - BLOCK
    )
    :vars
    (
      ?auto_855459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855458 ?auto_855459 ) ( ON-TABLE ?auto_855449 ) ( ON ?auto_855450 ?auto_855449 ) ( ON ?auto_855451 ?auto_855450 ) ( ON ?auto_855452 ?auto_855451 ) ( ON ?auto_855453 ?auto_855452 ) ( not ( = ?auto_855449 ?auto_855450 ) ) ( not ( = ?auto_855449 ?auto_855451 ) ) ( not ( = ?auto_855449 ?auto_855452 ) ) ( not ( = ?auto_855449 ?auto_855453 ) ) ( not ( = ?auto_855449 ?auto_855454 ) ) ( not ( = ?auto_855449 ?auto_855455 ) ) ( not ( = ?auto_855449 ?auto_855456 ) ) ( not ( = ?auto_855449 ?auto_855457 ) ) ( not ( = ?auto_855449 ?auto_855458 ) ) ( not ( = ?auto_855449 ?auto_855459 ) ) ( not ( = ?auto_855450 ?auto_855451 ) ) ( not ( = ?auto_855450 ?auto_855452 ) ) ( not ( = ?auto_855450 ?auto_855453 ) ) ( not ( = ?auto_855450 ?auto_855454 ) ) ( not ( = ?auto_855450 ?auto_855455 ) ) ( not ( = ?auto_855450 ?auto_855456 ) ) ( not ( = ?auto_855450 ?auto_855457 ) ) ( not ( = ?auto_855450 ?auto_855458 ) ) ( not ( = ?auto_855450 ?auto_855459 ) ) ( not ( = ?auto_855451 ?auto_855452 ) ) ( not ( = ?auto_855451 ?auto_855453 ) ) ( not ( = ?auto_855451 ?auto_855454 ) ) ( not ( = ?auto_855451 ?auto_855455 ) ) ( not ( = ?auto_855451 ?auto_855456 ) ) ( not ( = ?auto_855451 ?auto_855457 ) ) ( not ( = ?auto_855451 ?auto_855458 ) ) ( not ( = ?auto_855451 ?auto_855459 ) ) ( not ( = ?auto_855452 ?auto_855453 ) ) ( not ( = ?auto_855452 ?auto_855454 ) ) ( not ( = ?auto_855452 ?auto_855455 ) ) ( not ( = ?auto_855452 ?auto_855456 ) ) ( not ( = ?auto_855452 ?auto_855457 ) ) ( not ( = ?auto_855452 ?auto_855458 ) ) ( not ( = ?auto_855452 ?auto_855459 ) ) ( not ( = ?auto_855453 ?auto_855454 ) ) ( not ( = ?auto_855453 ?auto_855455 ) ) ( not ( = ?auto_855453 ?auto_855456 ) ) ( not ( = ?auto_855453 ?auto_855457 ) ) ( not ( = ?auto_855453 ?auto_855458 ) ) ( not ( = ?auto_855453 ?auto_855459 ) ) ( not ( = ?auto_855454 ?auto_855455 ) ) ( not ( = ?auto_855454 ?auto_855456 ) ) ( not ( = ?auto_855454 ?auto_855457 ) ) ( not ( = ?auto_855454 ?auto_855458 ) ) ( not ( = ?auto_855454 ?auto_855459 ) ) ( not ( = ?auto_855455 ?auto_855456 ) ) ( not ( = ?auto_855455 ?auto_855457 ) ) ( not ( = ?auto_855455 ?auto_855458 ) ) ( not ( = ?auto_855455 ?auto_855459 ) ) ( not ( = ?auto_855456 ?auto_855457 ) ) ( not ( = ?auto_855456 ?auto_855458 ) ) ( not ( = ?auto_855456 ?auto_855459 ) ) ( not ( = ?auto_855457 ?auto_855458 ) ) ( not ( = ?auto_855457 ?auto_855459 ) ) ( not ( = ?auto_855458 ?auto_855459 ) ) ( ON ?auto_855457 ?auto_855458 ) ( ON ?auto_855456 ?auto_855457 ) ( ON ?auto_855455 ?auto_855456 ) ( CLEAR ?auto_855453 ) ( ON ?auto_855454 ?auto_855455 ) ( CLEAR ?auto_855454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_855449 ?auto_855450 ?auto_855451 ?auto_855452 ?auto_855453 ?auto_855454 )
      ( MAKE-10PILE ?auto_855449 ?auto_855450 ?auto_855451 ?auto_855452 ?auto_855453 ?auto_855454 ?auto_855455 ?auto_855456 ?auto_855457 ?auto_855458 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_855491 - BLOCK
      ?auto_855492 - BLOCK
      ?auto_855493 - BLOCK
      ?auto_855494 - BLOCK
      ?auto_855495 - BLOCK
      ?auto_855496 - BLOCK
      ?auto_855497 - BLOCK
      ?auto_855498 - BLOCK
      ?auto_855499 - BLOCK
      ?auto_855500 - BLOCK
    )
    :vars
    (
      ?auto_855501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855500 ?auto_855501 ) ( ON-TABLE ?auto_855491 ) ( ON ?auto_855492 ?auto_855491 ) ( ON ?auto_855493 ?auto_855492 ) ( ON ?auto_855494 ?auto_855493 ) ( not ( = ?auto_855491 ?auto_855492 ) ) ( not ( = ?auto_855491 ?auto_855493 ) ) ( not ( = ?auto_855491 ?auto_855494 ) ) ( not ( = ?auto_855491 ?auto_855495 ) ) ( not ( = ?auto_855491 ?auto_855496 ) ) ( not ( = ?auto_855491 ?auto_855497 ) ) ( not ( = ?auto_855491 ?auto_855498 ) ) ( not ( = ?auto_855491 ?auto_855499 ) ) ( not ( = ?auto_855491 ?auto_855500 ) ) ( not ( = ?auto_855491 ?auto_855501 ) ) ( not ( = ?auto_855492 ?auto_855493 ) ) ( not ( = ?auto_855492 ?auto_855494 ) ) ( not ( = ?auto_855492 ?auto_855495 ) ) ( not ( = ?auto_855492 ?auto_855496 ) ) ( not ( = ?auto_855492 ?auto_855497 ) ) ( not ( = ?auto_855492 ?auto_855498 ) ) ( not ( = ?auto_855492 ?auto_855499 ) ) ( not ( = ?auto_855492 ?auto_855500 ) ) ( not ( = ?auto_855492 ?auto_855501 ) ) ( not ( = ?auto_855493 ?auto_855494 ) ) ( not ( = ?auto_855493 ?auto_855495 ) ) ( not ( = ?auto_855493 ?auto_855496 ) ) ( not ( = ?auto_855493 ?auto_855497 ) ) ( not ( = ?auto_855493 ?auto_855498 ) ) ( not ( = ?auto_855493 ?auto_855499 ) ) ( not ( = ?auto_855493 ?auto_855500 ) ) ( not ( = ?auto_855493 ?auto_855501 ) ) ( not ( = ?auto_855494 ?auto_855495 ) ) ( not ( = ?auto_855494 ?auto_855496 ) ) ( not ( = ?auto_855494 ?auto_855497 ) ) ( not ( = ?auto_855494 ?auto_855498 ) ) ( not ( = ?auto_855494 ?auto_855499 ) ) ( not ( = ?auto_855494 ?auto_855500 ) ) ( not ( = ?auto_855494 ?auto_855501 ) ) ( not ( = ?auto_855495 ?auto_855496 ) ) ( not ( = ?auto_855495 ?auto_855497 ) ) ( not ( = ?auto_855495 ?auto_855498 ) ) ( not ( = ?auto_855495 ?auto_855499 ) ) ( not ( = ?auto_855495 ?auto_855500 ) ) ( not ( = ?auto_855495 ?auto_855501 ) ) ( not ( = ?auto_855496 ?auto_855497 ) ) ( not ( = ?auto_855496 ?auto_855498 ) ) ( not ( = ?auto_855496 ?auto_855499 ) ) ( not ( = ?auto_855496 ?auto_855500 ) ) ( not ( = ?auto_855496 ?auto_855501 ) ) ( not ( = ?auto_855497 ?auto_855498 ) ) ( not ( = ?auto_855497 ?auto_855499 ) ) ( not ( = ?auto_855497 ?auto_855500 ) ) ( not ( = ?auto_855497 ?auto_855501 ) ) ( not ( = ?auto_855498 ?auto_855499 ) ) ( not ( = ?auto_855498 ?auto_855500 ) ) ( not ( = ?auto_855498 ?auto_855501 ) ) ( not ( = ?auto_855499 ?auto_855500 ) ) ( not ( = ?auto_855499 ?auto_855501 ) ) ( not ( = ?auto_855500 ?auto_855501 ) ) ( ON ?auto_855499 ?auto_855500 ) ( ON ?auto_855498 ?auto_855499 ) ( ON ?auto_855497 ?auto_855498 ) ( ON ?auto_855496 ?auto_855497 ) ( CLEAR ?auto_855494 ) ( ON ?auto_855495 ?auto_855496 ) ( CLEAR ?auto_855495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_855491 ?auto_855492 ?auto_855493 ?auto_855494 ?auto_855495 )
      ( MAKE-10PILE ?auto_855491 ?auto_855492 ?auto_855493 ?auto_855494 ?auto_855495 ?auto_855496 ?auto_855497 ?auto_855498 ?auto_855499 ?auto_855500 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_855533 - BLOCK
      ?auto_855534 - BLOCK
      ?auto_855535 - BLOCK
      ?auto_855536 - BLOCK
      ?auto_855537 - BLOCK
      ?auto_855538 - BLOCK
      ?auto_855539 - BLOCK
      ?auto_855540 - BLOCK
      ?auto_855541 - BLOCK
      ?auto_855542 - BLOCK
    )
    :vars
    (
      ?auto_855543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855542 ?auto_855543 ) ( ON-TABLE ?auto_855533 ) ( ON ?auto_855534 ?auto_855533 ) ( ON ?auto_855535 ?auto_855534 ) ( not ( = ?auto_855533 ?auto_855534 ) ) ( not ( = ?auto_855533 ?auto_855535 ) ) ( not ( = ?auto_855533 ?auto_855536 ) ) ( not ( = ?auto_855533 ?auto_855537 ) ) ( not ( = ?auto_855533 ?auto_855538 ) ) ( not ( = ?auto_855533 ?auto_855539 ) ) ( not ( = ?auto_855533 ?auto_855540 ) ) ( not ( = ?auto_855533 ?auto_855541 ) ) ( not ( = ?auto_855533 ?auto_855542 ) ) ( not ( = ?auto_855533 ?auto_855543 ) ) ( not ( = ?auto_855534 ?auto_855535 ) ) ( not ( = ?auto_855534 ?auto_855536 ) ) ( not ( = ?auto_855534 ?auto_855537 ) ) ( not ( = ?auto_855534 ?auto_855538 ) ) ( not ( = ?auto_855534 ?auto_855539 ) ) ( not ( = ?auto_855534 ?auto_855540 ) ) ( not ( = ?auto_855534 ?auto_855541 ) ) ( not ( = ?auto_855534 ?auto_855542 ) ) ( not ( = ?auto_855534 ?auto_855543 ) ) ( not ( = ?auto_855535 ?auto_855536 ) ) ( not ( = ?auto_855535 ?auto_855537 ) ) ( not ( = ?auto_855535 ?auto_855538 ) ) ( not ( = ?auto_855535 ?auto_855539 ) ) ( not ( = ?auto_855535 ?auto_855540 ) ) ( not ( = ?auto_855535 ?auto_855541 ) ) ( not ( = ?auto_855535 ?auto_855542 ) ) ( not ( = ?auto_855535 ?auto_855543 ) ) ( not ( = ?auto_855536 ?auto_855537 ) ) ( not ( = ?auto_855536 ?auto_855538 ) ) ( not ( = ?auto_855536 ?auto_855539 ) ) ( not ( = ?auto_855536 ?auto_855540 ) ) ( not ( = ?auto_855536 ?auto_855541 ) ) ( not ( = ?auto_855536 ?auto_855542 ) ) ( not ( = ?auto_855536 ?auto_855543 ) ) ( not ( = ?auto_855537 ?auto_855538 ) ) ( not ( = ?auto_855537 ?auto_855539 ) ) ( not ( = ?auto_855537 ?auto_855540 ) ) ( not ( = ?auto_855537 ?auto_855541 ) ) ( not ( = ?auto_855537 ?auto_855542 ) ) ( not ( = ?auto_855537 ?auto_855543 ) ) ( not ( = ?auto_855538 ?auto_855539 ) ) ( not ( = ?auto_855538 ?auto_855540 ) ) ( not ( = ?auto_855538 ?auto_855541 ) ) ( not ( = ?auto_855538 ?auto_855542 ) ) ( not ( = ?auto_855538 ?auto_855543 ) ) ( not ( = ?auto_855539 ?auto_855540 ) ) ( not ( = ?auto_855539 ?auto_855541 ) ) ( not ( = ?auto_855539 ?auto_855542 ) ) ( not ( = ?auto_855539 ?auto_855543 ) ) ( not ( = ?auto_855540 ?auto_855541 ) ) ( not ( = ?auto_855540 ?auto_855542 ) ) ( not ( = ?auto_855540 ?auto_855543 ) ) ( not ( = ?auto_855541 ?auto_855542 ) ) ( not ( = ?auto_855541 ?auto_855543 ) ) ( not ( = ?auto_855542 ?auto_855543 ) ) ( ON ?auto_855541 ?auto_855542 ) ( ON ?auto_855540 ?auto_855541 ) ( ON ?auto_855539 ?auto_855540 ) ( ON ?auto_855538 ?auto_855539 ) ( ON ?auto_855537 ?auto_855538 ) ( CLEAR ?auto_855535 ) ( ON ?auto_855536 ?auto_855537 ) ( CLEAR ?auto_855536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_855533 ?auto_855534 ?auto_855535 ?auto_855536 )
      ( MAKE-10PILE ?auto_855533 ?auto_855534 ?auto_855535 ?auto_855536 ?auto_855537 ?auto_855538 ?auto_855539 ?auto_855540 ?auto_855541 ?auto_855542 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_855575 - BLOCK
      ?auto_855576 - BLOCK
      ?auto_855577 - BLOCK
      ?auto_855578 - BLOCK
      ?auto_855579 - BLOCK
      ?auto_855580 - BLOCK
      ?auto_855581 - BLOCK
      ?auto_855582 - BLOCK
      ?auto_855583 - BLOCK
      ?auto_855584 - BLOCK
    )
    :vars
    (
      ?auto_855585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855584 ?auto_855585 ) ( ON-TABLE ?auto_855575 ) ( ON ?auto_855576 ?auto_855575 ) ( not ( = ?auto_855575 ?auto_855576 ) ) ( not ( = ?auto_855575 ?auto_855577 ) ) ( not ( = ?auto_855575 ?auto_855578 ) ) ( not ( = ?auto_855575 ?auto_855579 ) ) ( not ( = ?auto_855575 ?auto_855580 ) ) ( not ( = ?auto_855575 ?auto_855581 ) ) ( not ( = ?auto_855575 ?auto_855582 ) ) ( not ( = ?auto_855575 ?auto_855583 ) ) ( not ( = ?auto_855575 ?auto_855584 ) ) ( not ( = ?auto_855575 ?auto_855585 ) ) ( not ( = ?auto_855576 ?auto_855577 ) ) ( not ( = ?auto_855576 ?auto_855578 ) ) ( not ( = ?auto_855576 ?auto_855579 ) ) ( not ( = ?auto_855576 ?auto_855580 ) ) ( not ( = ?auto_855576 ?auto_855581 ) ) ( not ( = ?auto_855576 ?auto_855582 ) ) ( not ( = ?auto_855576 ?auto_855583 ) ) ( not ( = ?auto_855576 ?auto_855584 ) ) ( not ( = ?auto_855576 ?auto_855585 ) ) ( not ( = ?auto_855577 ?auto_855578 ) ) ( not ( = ?auto_855577 ?auto_855579 ) ) ( not ( = ?auto_855577 ?auto_855580 ) ) ( not ( = ?auto_855577 ?auto_855581 ) ) ( not ( = ?auto_855577 ?auto_855582 ) ) ( not ( = ?auto_855577 ?auto_855583 ) ) ( not ( = ?auto_855577 ?auto_855584 ) ) ( not ( = ?auto_855577 ?auto_855585 ) ) ( not ( = ?auto_855578 ?auto_855579 ) ) ( not ( = ?auto_855578 ?auto_855580 ) ) ( not ( = ?auto_855578 ?auto_855581 ) ) ( not ( = ?auto_855578 ?auto_855582 ) ) ( not ( = ?auto_855578 ?auto_855583 ) ) ( not ( = ?auto_855578 ?auto_855584 ) ) ( not ( = ?auto_855578 ?auto_855585 ) ) ( not ( = ?auto_855579 ?auto_855580 ) ) ( not ( = ?auto_855579 ?auto_855581 ) ) ( not ( = ?auto_855579 ?auto_855582 ) ) ( not ( = ?auto_855579 ?auto_855583 ) ) ( not ( = ?auto_855579 ?auto_855584 ) ) ( not ( = ?auto_855579 ?auto_855585 ) ) ( not ( = ?auto_855580 ?auto_855581 ) ) ( not ( = ?auto_855580 ?auto_855582 ) ) ( not ( = ?auto_855580 ?auto_855583 ) ) ( not ( = ?auto_855580 ?auto_855584 ) ) ( not ( = ?auto_855580 ?auto_855585 ) ) ( not ( = ?auto_855581 ?auto_855582 ) ) ( not ( = ?auto_855581 ?auto_855583 ) ) ( not ( = ?auto_855581 ?auto_855584 ) ) ( not ( = ?auto_855581 ?auto_855585 ) ) ( not ( = ?auto_855582 ?auto_855583 ) ) ( not ( = ?auto_855582 ?auto_855584 ) ) ( not ( = ?auto_855582 ?auto_855585 ) ) ( not ( = ?auto_855583 ?auto_855584 ) ) ( not ( = ?auto_855583 ?auto_855585 ) ) ( not ( = ?auto_855584 ?auto_855585 ) ) ( ON ?auto_855583 ?auto_855584 ) ( ON ?auto_855582 ?auto_855583 ) ( ON ?auto_855581 ?auto_855582 ) ( ON ?auto_855580 ?auto_855581 ) ( ON ?auto_855579 ?auto_855580 ) ( ON ?auto_855578 ?auto_855579 ) ( CLEAR ?auto_855576 ) ( ON ?auto_855577 ?auto_855578 ) ( CLEAR ?auto_855577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_855575 ?auto_855576 ?auto_855577 )
      ( MAKE-10PILE ?auto_855575 ?auto_855576 ?auto_855577 ?auto_855578 ?auto_855579 ?auto_855580 ?auto_855581 ?auto_855582 ?auto_855583 ?auto_855584 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_855617 - BLOCK
      ?auto_855618 - BLOCK
      ?auto_855619 - BLOCK
      ?auto_855620 - BLOCK
      ?auto_855621 - BLOCK
      ?auto_855622 - BLOCK
      ?auto_855623 - BLOCK
      ?auto_855624 - BLOCK
      ?auto_855625 - BLOCK
      ?auto_855626 - BLOCK
    )
    :vars
    (
      ?auto_855627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855626 ?auto_855627 ) ( ON-TABLE ?auto_855617 ) ( not ( = ?auto_855617 ?auto_855618 ) ) ( not ( = ?auto_855617 ?auto_855619 ) ) ( not ( = ?auto_855617 ?auto_855620 ) ) ( not ( = ?auto_855617 ?auto_855621 ) ) ( not ( = ?auto_855617 ?auto_855622 ) ) ( not ( = ?auto_855617 ?auto_855623 ) ) ( not ( = ?auto_855617 ?auto_855624 ) ) ( not ( = ?auto_855617 ?auto_855625 ) ) ( not ( = ?auto_855617 ?auto_855626 ) ) ( not ( = ?auto_855617 ?auto_855627 ) ) ( not ( = ?auto_855618 ?auto_855619 ) ) ( not ( = ?auto_855618 ?auto_855620 ) ) ( not ( = ?auto_855618 ?auto_855621 ) ) ( not ( = ?auto_855618 ?auto_855622 ) ) ( not ( = ?auto_855618 ?auto_855623 ) ) ( not ( = ?auto_855618 ?auto_855624 ) ) ( not ( = ?auto_855618 ?auto_855625 ) ) ( not ( = ?auto_855618 ?auto_855626 ) ) ( not ( = ?auto_855618 ?auto_855627 ) ) ( not ( = ?auto_855619 ?auto_855620 ) ) ( not ( = ?auto_855619 ?auto_855621 ) ) ( not ( = ?auto_855619 ?auto_855622 ) ) ( not ( = ?auto_855619 ?auto_855623 ) ) ( not ( = ?auto_855619 ?auto_855624 ) ) ( not ( = ?auto_855619 ?auto_855625 ) ) ( not ( = ?auto_855619 ?auto_855626 ) ) ( not ( = ?auto_855619 ?auto_855627 ) ) ( not ( = ?auto_855620 ?auto_855621 ) ) ( not ( = ?auto_855620 ?auto_855622 ) ) ( not ( = ?auto_855620 ?auto_855623 ) ) ( not ( = ?auto_855620 ?auto_855624 ) ) ( not ( = ?auto_855620 ?auto_855625 ) ) ( not ( = ?auto_855620 ?auto_855626 ) ) ( not ( = ?auto_855620 ?auto_855627 ) ) ( not ( = ?auto_855621 ?auto_855622 ) ) ( not ( = ?auto_855621 ?auto_855623 ) ) ( not ( = ?auto_855621 ?auto_855624 ) ) ( not ( = ?auto_855621 ?auto_855625 ) ) ( not ( = ?auto_855621 ?auto_855626 ) ) ( not ( = ?auto_855621 ?auto_855627 ) ) ( not ( = ?auto_855622 ?auto_855623 ) ) ( not ( = ?auto_855622 ?auto_855624 ) ) ( not ( = ?auto_855622 ?auto_855625 ) ) ( not ( = ?auto_855622 ?auto_855626 ) ) ( not ( = ?auto_855622 ?auto_855627 ) ) ( not ( = ?auto_855623 ?auto_855624 ) ) ( not ( = ?auto_855623 ?auto_855625 ) ) ( not ( = ?auto_855623 ?auto_855626 ) ) ( not ( = ?auto_855623 ?auto_855627 ) ) ( not ( = ?auto_855624 ?auto_855625 ) ) ( not ( = ?auto_855624 ?auto_855626 ) ) ( not ( = ?auto_855624 ?auto_855627 ) ) ( not ( = ?auto_855625 ?auto_855626 ) ) ( not ( = ?auto_855625 ?auto_855627 ) ) ( not ( = ?auto_855626 ?auto_855627 ) ) ( ON ?auto_855625 ?auto_855626 ) ( ON ?auto_855624 ?auto_855625 ) ( ON ?auto_855623 ?auto_855624 ) ( ON ?auto_855622 ?auto_855623 ) ( ON ?auto_855621 ?auto_855622 ) ( ON ?auto_855620 ?auto_855621 ) ( ON ?auto_855619 ?auto_855620 ) ( CLEAR ?auto_855617 ) ( ON ?auto_855618 ?auto_855619 ) ( CLEAR ?auto_855618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_855617 ?auto_855618 )
      ( MAKE-10PILE ?auto_855617 ?auto_855618 ?auto_855619 ?auto_855620 ?auto_855621 ?auto_855622 ?auto_855623 ?auto_855624 ?auto_855625 ?auto_855626 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_855659 - BLOCK
      ?auto_855660 - BLOCK
      ?auto_855661 - BLOCK
      ?auto_855662 - BLOCK
      ?auto_855663 - BLOCK
      ?auto_855664 - BLOCK
      ?auto_855665 - BLOCK
      ?auto_855666 - BLOCK
      ?auto_855667 - BLOCK
      ?auto_855668 - BLOCK
    )
    :vars
    (
      ?auto_855669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855668 ?auto_855669 ) ( not ( = ?auto_855659 ?auto_855660 ) ) ( not ( = ?auto_855659 ?auto_855661 ) ) ( not ( = ?auto_855659 ?auto_855662 ) ) ( not ( = ?auto_855659 ?auto_855663 ) ) ( not ( = ?auto_855659 ?auto_855664 ) ) ( not ( = ?auto_855659 ?auto_855665 ) ) ( not ( = ?auto_855659 ?auto_855666 ) ) ( not ( = ?auto_855659 ?auto_855667 ) ) ( not ( = ?auto_855659 ?auto_855668 ) ) ( not ( = ?auto_855659 ?auto_855669 ) ) ( not ( = ?auto_855660 ?auto_855661 ) ) ( not ( = ?auto_855660 ?auto_855662 ) ) ( not ( = ?auto_855660 ?auto_855663 ) ) ( not ( = ?auto_855660 ?auto_855664 ) ) ( not ( = ?auto_855660 ?auto_855665 ) ) ( not ( = ?auto_855660 ?auto_855666 ) ) ( not ( = ?auto_855660 ?auto_855667 ) ) ( not ( = ?auto_855660 ?auto_855668 ) ) ( not ( = ?auto_855660 ?auto_855669 ) ) ( not ( = ?auto_855661 ?auto_855662 ) ) ( not ( = ?auto_855661 ?auto_855663 ) ) ( not ( = ?auto_855661 ?auto_855664 ) ) ( not ( = ?auto_855661 ?auto_855665 ) ) ( not ( = ?auto_855661 ?auto_855666 ) ) ( not ( = ?auto_855661 ?auto_855667 ) ) ( not ( = ?auto_855661 ?auto_855668 ) ) ( not ( = ?auto_855661 ?auto_855669 ) ) ( not ( = ?auto_855662 ?auto_855663 ) ) ( not ( = ?auto_855662 ?auto_855664 ) ) ( not ( = ?auto_855662 ?auto_855665 ) ) ( not ( = ?auto_855662 ?auto_855666 ) ) ( not ( = ?auto_855662 ?auto_855667 ) ) ( not ( = ?auto_855662 ?auto_855668 ) ) ( not ( = ?auto_855662 ?auto_855669 ) ) ( not ( = ?auto_855663 ?auto_855664 ) ) ( not ( = ?auto_855663 ?auto_855665 ) ) ( not ( = ?auto_855663 ?auto_855666 ) ) ( not ( = ?auto_855663 ?auto_855667 ) ) ( not ( = ?auto_855663 ?auto_855668 ) ) ( not ( = ?auto_855663 ?auto_855669 ) ) ( not ( = ?auto_855664 ?auto_855665 ) ) ( not ( = ?auto_855664 ?auto_855666 ) ) ( not ( = ?auto_855664 ?auto_855667 ) ) ( not ( = ?auto_855664 ?auto_855668 ) ) ( not ( = ?auto_855664 ?auto_855669 ) ) ( not ( = ?auto_855665 ?auto_855666 ) ) ( not ( = ?auto_855665 ?auto_855667 ) ) ( not ( = ?auto_855665 ?auto_855668 ) ) ( not ( = ?auto_855665 ?auto_855669 ) ) ( not ( = ?auto_855666 ?auto_855667 ) ) ( not ( = ?auto_855666 ?auto_855668 ) ) ( not ( = ?auto_855666 ?auto_855669 ) ) ( not ( = ?auto_855667 ?auto_855668 ) ) ( not ( = ?auto_855667 ?auto_855669 ) ) ( not ( = ?auto_855668 ?auto_855669 ) ) ( ON ?auto_855667 ?auto_855668 ) ( ON ?auto_855666 ?auto_855667 ) ( ON ?auto_855665 ?auto_855666 ) ( ON ?auto_855664 ?auto_855665 ) ( ON ?auto_855663 ?auto_855664 ) ( ON ?auto_855662 ?auto_855663 ) ( ON ?auto_855661 ?auto_855662 ) ( ON ?auto_855660 ?auto_855661 ) ( ON ?auto_855659 ?auto_855660 ) ( CLEAR ?auto_855659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_855659 )
      ( MAKE-10PILE ?auto_855659 ?auto_855660 ?auto_855661 ?auto_855662 ?auto_855663 ?auto_855664 ?auto_855665 ?auto_855666 ?auto_855667 ?auto_855668 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_855702 - BLOCK
      ?auto_855703 - BLOCK
      ?auto_855704 - BLOCK
      ?auto_855705 - BLOCK
      ?auto_855706 - BLOCK
      ?auto_855707 - BLOCK
      ?auto_855708 - BLOCK
      ?auto_855709 - BLOCK
      ?auto_855710 - BLOCK
      ?auto_855711 - BLOCK
      ?auto_855712 - BLOCK
    )
    :vars
    (
      ?auto_855713 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_855711 ) ( ON ?auto_855712 ?auto_855713 ) ( CLEAR ?auto_855712 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_855702 ) ( ON ?auto_855703 ?auto_855702 ) ( ON ?auto_855704 ?auto_855703 ) ( ON ?auto_855705 ?auto_855704 ) ( ON ?auto_855706 ?auto_855705 ) ( ON ?auto_855707 ?auto_855706 ) ( ON ?auto_855708 ?auto_855707 ) ( ON ?auto_855709 ?auto_855708 ) ( ON ?auto_855710 ?auto_855709 ) ( ON ?auto_855711 ?auto_855710 ) ( not ( = ?auto_855702 ?auto_855703 ) ) ( not ( = ?auto_855702 ?auto_855704 ) ) ( not ( = ?auto_855702 ?auto_855705 ) ) ( not ( = ?auto_855702 ?auto_855706 ) ) ( not ( = ?auto_855702 ?auto_855707 ) ) ( not ( = ?auto_855702 ?auto_855708 ) ) ( not ( = ?auto_855702 ?auto_855709 ) ) ( not ( = ?auto_855702 ?auto_855710 ) ) ( not ( = ?auto_855702 ?auto_855711 ) ) ( not ( = ?auto_855702 ?auto_855712 ) ) ( not ( = ?auto_855702 ?auto_855713 ) ) ( not ( = ?auto_855703 ?auto_855704 ) ) ( not ( = ?auto_855703 ?auto_855705 ) ) ( not ( = ?auto_855703 ?auto_855706 ) ) ( not ( = ?auto_855703 ?auto_855707 ) ) ( not ( = ?auto_855703 ?auto_855708 ) ) ( not ( = ?auto_855703 ?auto_855709 ) ) ( not ( = ?auto_855703 ?auto_855710 ) ) ( not ( = ?auto_855703 ?auto_855711 ) ) ( not ( = ?auto_855703 ?auto_855712 ) ) ( not ( = ?auto_855703 ?auto_855713 ) ) ( not ( = ?auto_855704 ?auto_855705 ) ) ( not ( = ?auto_855704 ?auto_855706 ) ) ( not ( = ?auto_855704 ?auto_855707 ) ) ( not ( = ?auto_855704 ?auto_855708 ) ) ( not ( = ?auto_855704 ?auto_855709 ) ) ( not ( = ?auto_855704 ?auto_855710 ) ) ( not ( = ?auto_855704 ?auto_855711 ) ) ( not ( = ?auto_855704 ?auto_855712 ) ) ( not ( = ?auto_855704 ?auto_855713 ) ) ( not ( = ?auto_855705 ?auto_855706 ) ) ( not ( = ?auto_855705 ?auto_855707 ) ) ( not ( = ?auto_855705 ?auto_855708 ) ) ( not ( = ?auto_855705 ?auto_855709 ) ) ( not ( = ?auto_855705 ?auto_855710 ) ) ( not ( = ?auto_855705 ?auto_855711 ) ) ( not ( = ?auto_855705 ?auto_855712 ) ) ( not ( = ?auto_855705 ?auto_855713 ) ) ( not ( = ?auto_855706 ?auto_855707 ) ) ( not ( = ?auto_855706 ?auto_855708 ) ) ( not ( = ?auto_855706 ?auto_855709 ) ) ( not ( = ?auto_855706 ?auto_855710 ) ) ( not ( = ?auto_855706 ?auto_855711 ) ) ( not ( = ?auto_855706 ?auto_855712 ) ) ( not ( = ?auto_855706 ?auto_855713 ) ) ( not ( = ?auto_855707 ?auto_855708 ) ) ( not ( = ?auto_855707 ?auto_855709 ) ) ( not ( = ?auto_855707 ?auto_855710 ) ) ( not ( = ?auto_855707 ?auto_855711 ) ) ( not ( = ?auto_855707 ?auto_855712 ) ) ( not ( = ?auto_855707 ?auto_855713 ) ) ( not ( = ?auto_855708 ?auto_855709 ) ) ( not ( = ?auto_855708 ?auto_855710 ) ) ( not ( = ?auto_855708 ?auto_855711 ) ) ( not ( = ?auto_855708 ?auto_855712 ) ) ( not ( = ?auto_855708 ?auto_855713 ) ) ( not ( = ?auto_855709 ?auto_855710 ) ) ( not ( = ?auto_855709 ?auto_855711 ) ) ( not ( = ?auto_855709 ?auto_855712 ) ) ( not ( = ?auto_855709 ?auto_855713 ) ) ( not ( = ?auto_855710 ?auto_855711 ) ) ( not ( = ?auto_855710 ?auto_855712 ) ) ( not ( = ?auto_855710 ?auto_855713 ) ) ( not ( = ?auto_855711 ?auto_855712 ) ) ( not ( = ?auto_855711 ?auto_855713 ) ) ( not ( = ?auto_855712 ?auto_855713 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_855712 ?auto_855713 )
      ( !STACK ?auto_855712 ?auto_855711 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_855748 - BLOCK
      ?auto_855749 - BLOCK
      ?auto_855750 - BLOCK
      ?auto_855751 - BLOCK
      ?auto_855752 - BLOCK
      ?auto_855753 - BLOCK
      ?auto_855754 - BLOCK
      ?auto_855755 - BLOCK
      ?auto_855756 - BLOCK
      ?auto_855757 - BLOCK
      ?auto_855758 - BLOCK
    )
    :vars
    (
      ?auto_855759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855758 ?auto_855759 ) ( ON-TABLE ?auto_855748 ) ( ON ?auto_855749 ?auto_855748 ) ( ON ?auto_855750 ?auto_855749 ) ( ON ?auto_855751 ?auto_855750 ) ( ON ?auto_855752 ?auto_855751 ) ( ON ?auto_855753 ?auto_855752 ) ( ON ?auto_855754 ?auto_855753 ) ( ON ?auto_855755 ?auto_855754 ) ( ON ?auto_855756 ?auto_855755 ) ( not ( = ?auto_855748 ?auto_855749 ) ) ( not ( = ?auto_855748 ?auto_855750 ) ) ( not ( = ?auto_855748 ?auto_855751 ) ) ( not ( = ?auto_855748 ?auto_855752 ) ) ( not ( = ?auto_855748 ?auto_855753 ) ) ( not ( = ?auto_855748 ?auto_855754 ) ) ( not ( = ?auto_855748 ?auto_855755 ) ) ( not ( = ?auto_855748 ?auto_855756 ) ) ( not ( = ?auto_855748 ?auto_855757 ) ) ( not ( = ?auto_855748 ?auto_855758 ) ) ( not ( = ?auto_855748 ?auto_855759 ) ) ( not ( = ?auto_855749 ?auto_855750 ) ) ( not ( = ?auto_855749 ?auto_855751 ) ) ( not ( = ?auto_855749 ?auto_855752 ) ) ( not ( = ?auto_855749 ?auto_855753 ) ) ( not ( = ?auto_855749 ?auto_855754 ) ) ( not ( = ?auto_855749 ?auto_855755 ) ) ( not ( = ?auto_855749 ?auto_855756 ) ) ( not ( = ?auto_855749 ?auto_855757 ) ) ( not ( = ?auto_855749 ?auto_855758 ) ) ( not ( = ?auto_855749 ?auto_855759 ) ) ( not ( = ?auto_855750 ?auto_855751 ) ) ( not ( = ?auto_855750 ?auto_855752 ) ) ( not ( = ?auto_855750 ?auto_855753 ) ) ( not ( = ?auto_855750 ?auto_855754 ) ) ( not ( = ?auto_855750 ?auto_855755 ) ) ( not ( = ?auto_855750 ?auto_855756 ) ) ( not ( = ?auto_855750 ?auto_855757 ) ) ( not ( = ?auto_855750 ?auto_855758 ) ) ( not ( = ?auto_855750 ?auto_855759 ) ) ( not ( = ?auto_855751 ?auto_855752 ) ) ( not ( = ?auto_855751 ?auto_855753 ) ) ( not ( = ?auto_855751 ?auto_855754 ) ) ( not ( = ?auto_855751 ?auto_855755 ) ) ( not ( = ?auto_855751 ?auto_855756 ) ) ( not ( = ?auto_855751 ?auto_855757 ) ) ( not ( = ?auto_855751 ?auto_855758 ) ) ( not ( = ?auto_855751 ?auto_855759 ) ) ( not ( = ?auto_855752 ?auto_855753 ) ) ( not ( = ?auto_855752 ?auto_855754 ) ) ( not ( = ?auto_855752 ?auto_855755 ) ) ( not ( = ?auto_855752 ?auto_855756 ) ) ( not ( = ?auto_855752 ?auto_855757 ) ) ( not ( = ?auto_855752 ?auto_855758 ) ) ( not ( = ?auto_855752 ?auto_855759 ) ) ( not ( = ?auto_855753 ?auto_855754 ) ) ( not ( = ?auto_855753 ?auto_855755 ) ) ( not ( = ?auto_855753 ?auto_855756 ) ) ( not ( = ?auto_855753 ?auto_855757 ) ) ( not ( = ?auto_855753 ?auto_855758 ) ) ( not ( = ?auto_855753 ?auto_855759 ) ) ( not ( = ?auto_855754 ?auto_855755 ) ) ( not ( = ?auto_855754 ?auto_855756 ) ) ( not ( = ?auto_855754 ?auto_855757 ) ) ( not ( = ?auto_855754 ?auto_855758 ) ) ( not ( = ?auto_855754 ?auto_855759 ) ) ( not ( = ?auto_855755 ?auto_855756 ) ) ( not ( = ?auto_855755 ?auto_855757 ) ) ( not ( = ?auto_855755 ?auto_855758 ) ) ( not ( = ?auto_855755 ?auto_855759 ) ) ( not ( = ?auto_855756 ?auto_855757 ) ) ( not ( = ?auto_855756 ?auto_855758 ) ) ( not ( = ?auto_855756 ?auto_855759 ) ) ( not ( = ?auto_855757 ?auto_855758 ) ) ( not ( = ?auto_855757 ?auto_855759 ) ) ( not ( = ?auto_855758 ?auto_855759 ) ) ( CLEAR ?auto_855756 ) ( ON ?auto_855757 ?auto_855758 ) ( CLEAR ?auto_855757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_855748 ?auto_855749 ?auto_855750 ?auto_855751 ?auto_855752 ?auto_855753 ?auto_855754 ?auto_855755 ?auto_855756 ?auto_855757 )
      ( MAKE-11PILE ?auto_855748 ?auto_855749 ?auto_855750 ?auto_855751 ?auto_855752 ?auto_855753 ?auto_855754 ?auto_855755 ?auto_855756 ?auto_855757 ?auto_855758 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_855794 - BLOCK
      ?auto_855795 - BLOCK
      ?auto_855796 - BLOCK
      ?auto_855797 - BLOCK
      ?auto_855798 - BLOCK
      ?auto_855799 - BLOCK
      ?auto_855800 - BLOCK
      ?auto_855801 - BLOCK
      ?auto_855802 - BLOCK
      ?auto_855803 - BLOCK
      ?auto_855804 - BLOCK
    )
    :vars
    (
      ?auto_855805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855804 ?auto_855805 ) ( ON-TABLE ?auto_855794 ) ( ON ?auto_855795 ?auto_855794 ) ( ON ?auto_855796 ?auto_855795 ) ( ON ?auto_855797 ?auto_855796 ) ( ON ?auto_855798 ?auto_855797 ) ( ON ?auto_855799 ?auto_855798 ) ( ON ?auto_855800 ?auto_855799 ) ( ON ?auto_855801 ?auto_855800 ) ( not ( = ?auto_855794 ?auto_855795 ) ) ( not ( = ?auto_855794 ?auto_855796 ) ) ( not ( = ?auto_855794 ?auto_855797 ) ) ( not ( = ?auto_855794 ?auto_855798 ) ) ( not ( = ?auto_855794 ?auto_855799 ) ) ( not ( = ?auto_855794 ?auto_855800 ) ) ( not ( = ?auto_855794 ?auto_855801 ) ) ( not ( = ?auto_855794 ?auto_855802 ) ) ( not ( = ?auto_855794 ?auto_855803 ) ) ( not ( = ?auto_855794 ?auto_855804 ) ) ( not ( = ?auto_855794 ?auto_855805 ) ) ( not ( = ?auto_855795 ?auto_855796 ) ) ( not ( = ?auto_855795 ?auto_855797 ) ) ( not ( = ?auto_855795 ?auto_855798 ) ) ( not ( = ?auto_855795 ?auto_855799 ) ) ( not ( = ?auto_855795 ?auto_855800 ) ) ( not ( = ?auto_855795 ?auto_855801 ) ) ( not ( = ?auto_855795 ?auto_855802 ) ) ( not ( = ?auto_855795 ?auto_855803 ) ) ( not ( = ?auto_855795 ?auto_855804 ) ) ( not ( = ?auto_855795 ?auto_855805 ) ) ( not ( = ?auto_855796 ?auto_855797 ) ) ( not ( = ?auto_855796 ?auto_855798 ) ) ( not ( = ?auto_855796 ?auto_855799 ) ) ( not ( = ?auto_855796 ?auto_855800 ) ) ( not ( = ?auto_855796 ?auto_855801 ) ) ( not ( = ?auto_855796 ?auto_855802 ) ) ( not ( = ?auto_855796 ?auto_855803 ) ) ( not ( = ?auto_855796 ?auto_855804 ) ) ( not ( = ?auto_855796 ?auto_855805 ) ) ( not ( = ?auto_855797 ?auto_855798 ) ) ( not ( = ?auto_855797 ?auto_855799 ) ) ( not ( = ?auto_855797 ?auto_855800 ) ) ( not ( = ?auto_855797 ?auto_855801 ) ) ( not ( = ?auto_855797 ?auto_855802 ) ) ( not ( = ?auto_855797 ?auto_855803 ) ) ( not ( = ?auto_855797 ?auto_855804 ) ) ( not ( = ?auto_855797 ?auto_855805 ) ) ( not ( = ?auto_855798 ?auto_855799 ) ) ( not ( = ?auto_855798 ?auto_855800 ) ) ( not ( = ?auto_855798 ?auto_855801 ) ) ( not ( = ?auto_855798 ?auto_855802 ) ) ( not ( = ?auto_855798 ?auto_855803 ) ) ( not ( = ?auto_855798 ?auto_855804 ) ) ( not ( = ?auto_855798 ?auto_855805 ) ) ( not ( = ?auto_855799 ?auto_855800 ) ) ( not ( = ?auto_855799 ?auto_855801 ) ) ( not ( = ?auto_855799 ?auto_855802 ) ) ( not ( = ?auto_855799 ?auto_855803 ) ) ( not ( = ?auto_855799 ?auto_855804 ) ) ( not ( = ?auto_855799 ?auto_855805 ) ) ( not ( = ?auto_855800 ?auto_855801 ) ) ( not ( = ?auto_855800 ?auto_855802 ) ) ( not ( = ?auto_855800 ?auto_855803 ) ) ( not ( = ?auto_855800 ?auto_855804 ) ) ( not ( = ?auto_855800 ?auto_855805 ) ) ( not ( = ?auto_855801 ?auto_855802 ) ) ( not ( = ?auto_855801 ?auto_855803 ) ) ( not ( = ?auto_855801 ?auto_855804 ) ) ( not ( = ?auto_855801 ?auto_855805 ) ) ( not ( = ?auto_855802 ?auto_855803 ) ) ( not ( = ?auto_855802 ?auto_855804 ) ) ( not ( = ?auto_855802 ?auto_855805 ) ) ( not ( = ?auto_855803 ?auto_855804 ) ) ( not ( = ?auto_855803 ?auto_855805 ) ) ( not ( = ?auto_855804 ?auto_855805 ) ) ( ON ?auto_855803 ?auto_855804 ) ( CLEAR ?auto_855801 ) ( ON ?auto_855802 ?auto_855803 ) ( CLEAR ?auto_855802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_855794 ?auto_855795 ?auto_855796 ?auto_855797 ?auto_855798 ?auto_855799 ?auto_855800 ?auto_855801 ?auto_855802 )
      ( MAKE-11PILE ?auto_855794 ?auto_855795 ?auto_855796 ?auto_855797 ?auto_855798 ?auto_855799 ?auto_855800 ?auto_855801 ?auto_855802 ?auto_855803 ?auto_855804 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_855840 - BLOCK
      ?auto_855841 - BLOCK
      ?auto_855842 - BLOCK
      ?auto_855843 - BLOCK
      ?auto_855844 - BLOCK
      ?auto_855845 - BLOCK
      ?auto_855846 - BLOCK
      ?auto_855847 - BLOCK
      ?auto_855848 - BLOCK
      ?auto_855849 - BLOCK
      ?auto_855850 - BLOCK
    )
    :vars
    (
      ?auto_855851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855850 ?auto_855851 ) ( ON-TABLE ?auto_855840 ) ( ON ?auto_855841 ?auto_855840 ) ( ON ?auto_855842 ?auto_855841 ) ( ON ?auto_855843 ?auto_855842 ) ( ON ?auto_855844 ?auto_855843 ) ( ON ?auto_855845 ?auto_855844 ) ( ON ?auto_855846 ?auto_855845 ) ( not ( = ?auto_855840 ?auto_855841 ) ) ( not ( = ?auto_855840 ?auto_855842 ) ) ( not ( = ?auto_855840 ?auto_855843 ) ) ( not ( = ?auto_855840 ?auto_855844 ) ) ( not ( = ?auto_855840 ?auto_855845 ) ) ( not ( = ?auto_855840 ?auto_855846 ) ) ( not ( = ?auto_855840 ?auto_855847 ) ) ( not ( = ?auto_855840 ?auto_855848 ) ) ( not ( = ?auto_855840 ?auto_855849 ) ) ( not ( = ?auto_855840 ?auto_855850 ) ) ( not ( = ?auto_855840 ?auto_855851 ) ) ( not ( = ?auto_855841 ?auto_855842 ) ) ( not ( = ?auto_855841 ?auto_855843 ) ) ( not ( = ?auto_855841 ?auto_855844 ) ) ( not ( = ?auto_855841 ?auto_855845 ) ) ( not ( = ?auto_855841 ?auto_855846 ) ) ( not ( = ?auto_855841 ?auto_855847 ) ) ( not ( = ?auto_855841 ?auto_855848 ) ) ( not ( = ?auto_855841 ?auto_855849 ) ) ( not ( = ?auto_855841 ?auto_855850 ) ) ( not ( = ?auto_855841 ?auto_855851 ) ) ( not ( = ?auto_855842 ?auto_855843 ) ) ( not ( = ?auto_855842 ?auto_855844 ) ) ( not ( = ?auto_855842 ?auto_855845 ) ) ( not ( = ?auto_855842 ?auto_855846 ) ) ( not ( = ?auto_855842 ?auto_855847 ) ) ( not ( = ?auto_855842 ?auto_855848 ) ) ( not ( = ?auto_855842 ?auto_855849 ) ) ( not ( = ?auto_855842 ?auto_855850 ) ) ( not ( = ?auto_855842 ?auto_855851 ) ) ( not ( = ?auto_855843 ?auto_855844 ) ) ( not ( = ?auto_855843 ?auto_855845 ) ) ( not ( = ?auto_855843 ?auto_855846 ) ) ( not ( = ?auto_855843 ?auto_855847 ) ) ( not ( = ?auto_855843 ?auto_855848 ) ) ( not ( = ?auto_855843 ?auto_855849 ) ) ( not ( = ?auto_855843 ?auto_855850 ) ) ( not ( = ?auto_855843 ?auto_855851 ) ) ( not ( = ?auto_855844 ?auto_855845 ) ) ( not ( = ?auto_855844 ?auto_855846 ) ) ( not ( = ?auto_855844 ?auto_855847 ) ) ( not ( = ?auto_855844 ?auto_855848 ) ) ( not ( = ?auto_855844 ?auto_855849 ) ) ( not ( = ?auto_855844 ?auto_855850 ) ) ( not ( = ?auto_855844 ?auto_855851 ) ) ( not ( = ?auto_855845 ?auto_855846 ) ) ( not ( = ?auto_855845 ?auto_855847 ) ) ( not ( = ?auto_855845 ?auto_855848 ) ) ( not ( = ?auto_855845 ?auto_855849 ) ) ( not ( = ?auto_855845 ?auto_855850 ) ) ( not ( = ?auto_855845 ?auto_855851 ) ) ( not ( = ?auto_855846 ?auto_855847 ) ) ( not ( = ?auto_855846 ?auto_855848 ) ) ( not ( = ?auto_855846 ?auto_855849 ) ) ( not ( = ?auto_855846 ?auto_855850 ) ) ( not ( = ?auto_855846 ?auto_855851 ) ) ( not ( = ?auto_855847 ?auto_855848 ) ) ( not ( = ?auto_855847 ?auto_855849 ) ) ( not ( = ?auto_855847 ?auto_855850 ) ) ( not ( = ?auto_855847 ?auto_855851 ) ) ( not ( = ?auto_855848 ?auto_855849 ) ) ( not ( = ?auto_855848 ?auto_855850 ) ) ( not ( = ?auto_855848 ?auto_855851 ) ) ( not ( = ?auto_855849 ?auto_855850 ) ) ( not ( = ?auto_855849 ?auto_855851 ) ) ( not ( = ?auto_855850 ?auto_855851 ) ) ( ON ?auto_855849 ?auto_855850 ) ( ON ?auto_855848 ?auto_855849 ) ( CLEAR ?auto_855846 ) ( ON ?auto_855847 ?auto_855848 ) ( CLEAR ?auto_855847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_855840 ?auto_855841 ?auto_855842 ?auto_855843 ?auto_855844 ?auto_855845 ?auto_855846 ?auto_855847 )
      ( MAKE-11PILE ?auto_855840 ?auto_855841 ?auto_855842 ?auto_855843 ?auto_855844 ?auto_855845 ?auto_855846 ?auto_855847 ?auto_855848 ?auto_855849 ?auto_855850 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_855886 - BLOCK
      ?auto_855887 - BLOCK
      ?auto_855888 - BLOCK
      ?auto_855889 - BLOCK
      ?auto_855890 - BLOCK
      ?auto_855891 - BLOCK
      ?auto_855892 - BLOCK
      ?auto_855893 - BLOCK
      ?auto_855894 - BLOCK
      ?auto_855895 - BLOCK
      ?auto_855896 - BLOCK
    )
    :vars
    (
      ?auto_855897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855896 ?auto_855897 ) ( ON-TABLE ?auto_855886 ) ( ON ?auto_855887 ?auto_855886 ) ( ON ?auto_855888 ?auto_855887 ) ( ON ?auto_855889 ?auto_855888 ) ( ON ?auto_855890 ?auto_855889 ) ( ON ?auto_855891 ?auto_855890 ) ( not ( = ?auto_855886 ?auto_855887 ) ) ( not ( = ?auto_855886 ?auto_855888 ) ) ( not ( = ?auto_855886 ?auto_855889 ) ) ( not ( = ?auto_855886 ?auto_855890 ) ) ( not ( = ?auto_855886 ?auto_855891 ) ) ( not ( = ?auto_855886 ?auto_855892 ) ) ( not ( = ?auto_855886 ?auto_855893 ) ) ( not ( = ?auto_855886 ?auto_855894 ) ) ( not ( = ?auto_855886 ?auto_855895 ) ) ( not ( = ?auto_855886 ?auto_855896 ) ) ( not ( = ?auto_855886 ?auto_855897 ) ) ( not ( = ?auto_855887 ?auto_855888 ) ) ( not ( = ?auto_855887 ?auto_855889 ) ) ( not ( = ?auto_855887 ?auto_855890 ) ) ( not ( = ?auto_855887 ?auto_855891 ) ) ( not ( = ?auto_855887 ?auto_855892 ) ) ( not ( = ?auto_855887 ?auto_855893 ) ) ( not ( = ?auto_855887 ?auto_855894 ) ) ( not ( = ?auto_855887 ?auto_855895 ) ) ( not ( = ?auto_855887 ?auto_855896 ) ) ( not ( = ?auto_855887 ?auto_855897 ) ) ( not ( = ?auto_855888 ?auto_855889 ) ) ( not ( = ?auto_855888 ?auto_855890 ) ) ( not ( = ?auto_855888 ?auto_855891 ) ) ( not ( = ?auto_855888 ?auto_855892 ) ) ( not ( = ?auto_855888 ?auto_855893 ) ) ( not ( = ?auto_855888 ?auto_855894 ) ) ( not ( = ?auto_855888 ?auto_855895 ) ) ( not ( = ?auto_855888 ?auto_855896 ) ) ( not ( = ?auto_855888 ?auto_855897 ) ) ( not ( = ?auto_855889 ?auto_855890 ) ) ( not ( = ?auto_855889 ?auto_855891 ) ) ( not ( = ?auto_855889 ?auto_855892 ) ) ( not ( = ?auto_855889 ?auto_855893 ) ) ( not ( = ?auto_855889 ?auto_855894 ) ) ( not ( = ?auto_855889 ?auto_855895 ) ) ( not ( = ?auto_855889 ?auto_855896 ) ) ( not ( = ?auto_855889 ?auto_855897 ) ) ( not ( = ?auto_855890 ?auto_855891 ) ) ( not ( = ?auto_855890 ?auto_855892 ) ) ( not ( = ?auto_855890 ?auto_855893 ) ) ( not ( = ?auto_855890 ?auto_855894 ) ) ( not ( = ?auto_855890 ?auto_855895 ) ) ( not ( = ?auto_855890 ?auto_855896 ) ) ( not ( = ?auto_855890 ?auto_855897 ) ) ( not ( = ?auto_855891 ?auto_855892 ) ) ( not ( = ?auto_855891 ?auto_855893 ) ) ( not ( = ?auto_855891 ?auto_855894 ) ) ( not ( = ?auto_855891 ?auto_855895 ) ) ( not ( = ?auto_855891 ?auto_855896 ) ) ( not ( = ?auto_855891 ?auto_855897 ) ) ( not ( = ?auto_855892 ?auto_855893 ) ) ( not ( = ?auto_855892 ?auto_855894 ) ) ( not ( = ?auto_855892 ?auto_855895 ) ) ( not ( = ?auto_855892 ?auto_855896 ) ) ( not ( = ?auto_855892 ?auto_855897 ) ) ( not ( = ?auto_855893 ?auto_855894 ) ) ( not ( = ?auto_855893 ?auto_855895 ) ) ( not ( = ?auto_855893 ?auto_855896 ) ) ( not ( = ?auto_855893 ?auto_855897 ) ) ( not ( = ?auto_855894 ?auto_855895 ) ) ( not ( = ?auto_855894 ?auto_855896 ) ) ( not ( = ?auto_855894 ?auto_855897 ) ) ( not ( = ?auto_855895 ?auto_855896 ) ) ( not ( = ?auto_855895 ?auto_855897 ) ) ( not ( = ?auto_855896 ?auto_855897 ) ) ( ON ?auto_855895 ?auto_855896 ) ( ON ?auto_855894 ?auto_855895 ) ( ON ?auto_855893 ?auto_855894 ) ( CLEAR ?auto_855891 ) ( ON ?auto_855892 ?auto_855893 ) ( CLEAR ?auto_855892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_855886 ?auto_855887 ?auto_855888 ?auto_855889 ?auto_855890 ?auto_855891 ?auto_855892 )
      ( MAKE-11PILE ?auto_855886 ?auto_855887 ?auto_855888 ?auto_855889 ?auto_855890 ?auto_855891 ?auto_855892 ?auto_855893 ?auto_855894 ?auto_855895 ?auto_855896 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_855932 - BLOCK
      ?auto_855933 - BLOCK
      ?auto_855934 - BLOCK
      ?auto_855935 - BLOCK
      ?auto_855936 - BLOCK
      ?auto_855937 - BLOCK
      ?auto_855938 - BLOCK
      ?auto_855939 - BLOCK
      ?auto_855940 - BLOCK
      ?auto_855941 - BLOCK
      ?auto_855942 - BLOCK
    )
    :vars
    (
      ?auto_855943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855942 ?auto_855943 ) ( ON-TABLE ?auto_855932 ) ( ON ?auto_855933 ?auto_855932 ) ( ON ?auto_855934 ?auto_855933 ) ( ON ?auto_855935 ?auto_855934 ) ( ON ?auto_855936 ?auto_855935 ) ( not ( = ?auto_855932 ?auto_855933 ) ) ( not ( = ?auto_855932 ?auto_855934 ) ) ( not ( = ?auto_855932 ?auto_855935 ) ) ( not ( = ?auto_855932 ?auto_855936 ) ) ( not ( = ?auto_855932 ?auto_855937 ) ) ( not ( = ?auto_855932 ?auto_855938 ) ) ( not ( = ?auto_855932 ?auto_855939 ) ) ( not ( = ?auto_855932 ?auto_855940 ) ) ( not ( = ?auto_855932 ?auto_855941 ) ) ( not ( = ?auto_855932 ?auto_855942 ) ) ( not ( = ?auto_855932 ?auto_855943 ) ) ( not ( = ?auto_855933 ?auto_855934 ) ) ( not ( = ?auto_855933 ?auto_855935 ) ) ( not ( = ?auto_855933 ?auto_855936 ) ) ( not ( = ?auto_855933 ?auto_855937 ) ) ( not ( = ?auto_855933 ?auto_855938 ) ) ( not ( = ?auto_855933 ?auto_855939 ) ) ( not ( = ?auto_855933 ?auto_855940 ) ) ( not ( = ?auto_855933 ?auto_855941 ) ) ( not ( = ?auto_855933 ?auto_855942 ) ) ( not ( = ?auto_855933 ?auto_855943 ) ) ( not ( = ?auto_855934 ?auto_855935 ) ) ( not ( = ?auto_855934 ?auto_855936 ) ) ( not ( = ?auto_855934 ?auto_855937 ) ) ( not ( = ?auto_855934 ?auto_855938 ) ) ( not ( = ?auto_855934 ?auto_855939 ) ) ( not ( = ?auto_855934 ?auto_855940 ) ) ( not ( = ?auto_855934 ?auto_855941 ) ) ( not ( = ?auto_855934 ?auto_855942 ) ) ( not ( = ?auto_855934 ?auto_855943 ) ) ( not ( = ?auto_855935 ?auto_855936 ) ) ( not ( = ?auto_855935 ?auto_855937 ) ) ( not ( = ?auto_855935 ?auto_855938 ) ) ( not ( = ?auto_855935 ?auto_855939 ) ) ( not ( = ?auto_855935 ?auto_855940 ) ) ( not ( = ?auto_855935 ?auto_855941 ) ) ( not ( = ?auto_855935 ?auto_855942 ) ) ( not ( = ?auto_855935 ?auto_855943 ) ) ( not ( = ?auto_855936 ?auto_855937 ) ) ( not ( = ?auto_855936 ?auto_855938 ) ) ( not ( = ?auto_855936 ?auto_855939 ) ) ( not ( = ?auto_855936 ?auto_855940 ) ) ( not ( = ?auto_855936 ?auto_855941 ) ) ( not ( = ?auto_855936 ?auto_855942 ) ) ( not ( = ?auto_855936 ?auto_855943 ) ) ( not ( = ?auto_855937 ?auto_855938 ) ) ( not ( = ?auto_855937 ?auto_855939 ) ) ( not ( = ?auto_855937 ?auto_855940 ) ) ( not ( = ?auto_855937 ?auto_855941 ) ) ( not ( = ?auto_855937 ?auto_855942 ) ) ( not ( = ?auto_855937 ?auto_855943 ) ) ( not ( = ?auto_855938 ?auto_855939 ) ) ( not ( = ?auto_855938 ?auto_855940 ) ) ( not ( = ?auto_855938 ?auto_855941 ) ) ( not ( = ?auto_855938 ?auto_855942 ) ) ( not ( = ?auto_855938 ?auto_855943 ) ) ( not ( = ?auto_855939 ?auto_855940 ) ) ( not ( = ?auto_855939 ?auto_855941 ) ) ( not ( = ?auto_855939 ?auto_855942 ) ) ( not ( = ?auto_855939 ?auto_855943 ) ) ( not ( = ?auto_855940 ?auto_855941 ) ) ( not ( = ?auto_855940 ?auto_855942 ) ) ( not ( = ?auto_855940 ?auto_855943 ) ) ( not ( = ?auto_855941 ?auto_855942 ) ) ( not ( = ?auto_855941 ?auto_855943 ) ) ( not ( = ?auto_855942 ?auto_855943 ) ) ( ON ?auto_855941 ?auto_855942 ) ( ON ?auto_855940 ?auto_855941 ) ( ON ?auto_855939 ?auto_855940 ) ( ON ?auto_855938 ?auto_855939 ) ( CLEAR ?auto_855936 ) ( ON ?auto_855937 ?auto_855938 ) ( CLEAR ?auto_855937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_855932 ?auto_855933 ?auto_855934 ?auto_855935 ?auto_855936 ?auto_855937 )
      ( MAKE-11PILE ?auto_855932 ?auto_855933 ?auto_855934 ?auto_855935 ?auto_855936 ?auto_855937 ?auto_855938 ?auto_855939 ?auto_855940 ?auto_855941 ?auto_855942 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_855978 - BLOCK
      ?auto_855979 - BLOCK
      ?auto_855980 - BLOCK
      ?auto_855981 - BLOCK
      ?auto_855982 - BLOCK
      ?auto_855983 - BLOCK
      ?auto_855984 - BLOCK
      ?auto_855985 - BLOCK
      ?auto_855986 - BLOCK
      ?auto_855987 - BLOCK
      ?auto_855988 - BLOCK
    )
    :vars
    (
      ?auto_855989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_855988 ?auto_855989 ) ( ON-TABLE ?auto_855978 ) ( ON ?auto_855979 ?auto_855978 ) ( ON ?auto_855980 ?auto_855979 ) ( ON ?auto_855981 ?auto_855980 ) ( not ( = ?auto_855978 ?auto_855979 ) ) ( not ( = ?auto_855978 ?auto_855980 ) ) ( not ( = ?auto_855978 ?auto_855981 ) ) ( not ( = ?auto_855978 ?auto_855982 ) ) ( not ( = ?auto_855978 ?auto_855983 ) ) ( not ( = ?auto_855978 ?auto_855984 ) ) ( not ( = ?auto_855978 ?auto_855985 ) ) ( not ( = ?auto_855978 ?auto_855986 ) ) ( not ( = ?auto_855978 ?auto_855987 ) ) ( not ( = ?auto_855978 ?auto_855988 ) ) ( not ( = ?auto_855978 ?auto_855989 ) ) ( not ( = ?auto_855979 ?auto_855980 ) ) ( not ( = ?auto_855979 ?auto_855981 ) ) ( not ( = ?auto_855979 ?auto_855982 ) ) ( not ( = ?auto_855979 ?auto_855983 ) ) ( not ( = ?auto_855979 ?auto_855984 ) ) ( not ( = ?auto_855979 ?auto_855985 ) ) ( not ( = ?auto_855979 ?auto_855986 ) ) ( not ( = ?auto_855979 ?auto_855987 ) ) ( not ( = ?auto_855979 ?auto_855988 ) ) ( not ( = ?auto_855979 ?auto_855989 ) ) ( not ( = ?auto_855980 ?auto_855981 ) ) ( not ( = ?auto_855980 ?auto_855982 ) ) ( not ( = ?auto_855980 ?auto_855983 ) ) ( not ( = ?auto_855980 ?auto_855984 ) ) ( not ( = ?auto_855980 ?auto_855985 ) ) ( not ( = ?auto_855980 ?auto_855986 ) ) ( not ( = ?auto_855980 ?auto_855987 ) ) ( not ( = ?auto_855980 ?auto_855988 ) ) ( not ( = ?auto_855980 ?auto_855989 ) ) ( not ( = ?auto_855981 ?auto_855982 ) ) ( not ( = ?auto_855981 ?auto_855983 ) ) ( not ( = ?auto_855981 ?auto_855984 ) ) ( not ( = ?auto_855981 ?auto_855985 ) ) ( not ( = ?auto_855981 ?auto_855986 ) ) ( not ( = ?auto_855981 ?auto_855987 ) ) ( not ( = ?auto_855981 ?auto_855988 ) ) ( not ( = ?auto_855981 ?auto_855989 ) ) ( not ( = ?auto_855982 ?auto_855983 ) ) ( not ( = ?auto_855982 ?auto_855984 ) ) ( not ( = ?auto_855982 ?auto_855985 ) ) ( not ( = ?auto_855982 ?auto_855986 ) ) ( not ( = ?auto_855982 ?auto_855987 ) ) ( not ( = ?auto_855982 ?auto_855988 ) ) ( not ( = ?auto_855982 ?auto_855989 ) ) ( not ( = ?auto_855983 ?auto_855984 ) ) ( not ( = ?auto_855983 ?auto_855985 ) ) ( not ( = ?auto_855983 ?auto_855986 ) ) ( not ( = ?auto_855983 ?auto_855987 ) ) ( not ( = ?auto_855983 ?auto_855988 ) ) ( not ( = ?auto_855983 ?auto_855989 ) ) ( not ( = ?auto_855984 ?auto_855985 ) ) ( not ( = ?auto_855984 ?auto_855986 ) ) ( not ( = ?auto_855984 ?auto_855987 ) ) ( not ( = ?auto_855984 ?auto_855988 ) ) ( not ( = ?auto_855984 ?auto_855989 ) ) ( not ( = ?auto_855985 ?auto_855986 ) ) ( not ( = ?auto_855985 ?auto_855987 ) ) ( not ( = ?auto_855985 ?auto_855988 ) ) ( not ( = ?auto_855985 ?auto_855989 ) ) ( not ( = ?auto_855986 ?auto_855987 ) ) ( not ( = ?auto_855986 ?auto_855988 ) ) ( not ( = ?auto_855986 ?auto_855989 ) ) ( not ( = ?auto_855987 ?auto_855988 ) ) ( not ( = ?auto_855987 ?auto_855989 ) ) ( not ( = ?auto_855988 ?auto_855989 ) ) ( ON ?auto_855987 ?auto_855988 ) ( ON ?auto_855986 ?auto_855987 ) ( ON ?auto_855985 ?auto_855986 ) ( ON ?auto_855984 ?auto_855985 ) ( ON ?auto_855983 ?auto_855984 ) ( CLEAR ?auto_855981 ) ( ON ?auto_855982 ?auto_855983 ) ( CLEAR ?auto_855982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_855978 ?auto_855979 ?auto_855980 ?auto_855981 ?auto_855982 )
      ( MAKE-11PILE ?auto_855978 ?auto_855979 ?auto_855980 ?auto_855981 ?auto_855982 ?auto_855983 ?auto_855984 ?auto_855985 ?auto_855986 ?auto_855987 ?auto_855988 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_856024 - BLOCK
      ?auto_856025 - BLOCK
      ?auto_856026 - BLOCK
      ?auto_856027 - BLOCK
      ?auto_856028 - BLOCK
      ?auto_856029 - BLOCK
      ?auto_856030 - BLOCK
      ?auto_856031 - BLOCK
      ?auto_856032 - BLOCK
      ?auto_856033 - BLOCK
      ?auto_856034 - BLOCK
    )
    :vars
    (
      ?auto_856035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856034 ?auto_856035 ) ( ON-TABLE ?auto_856024 ) ( ON ?auto_856025 ?auto_856024 ) ( ON ?auto_856026 ?auto_856025 ) ( not ( = ?auto_856024 ?auto_856025 ) ) ( not ( = ?auto_856024 ?auto_856026 ) ) ( not ( = ?auto_856024 ?auto_856027 ) ) ( not ( = ?auto_856024 ?auto_856028 ) ) ( not ( = ?auto_856024 ?auto_856029 ) ) ( not ( = ?auto_856024 ?auto_856030 ) ) ( not ( = ?auto_856024 ?auto_856031 ) ) ( not ( = ?auto_856024 ?auto_856032 ) ) ( not ( = ?auto_856024 ?auto_856033 ) ) ( not ( = ?auto_856024 ?auto_856034 ) ) ( not ( = ?auto_856024 ?auto_856035 ) ) ( not ( = ?auto_856025 ?auto_856026 ) ) ( not ( = ?auto_856025 ?auto_856027 ) ) ( not ( = ?auto_856025 ?auto_856028 ) ) ( not ( = ?auto_856025 ?auto_856029 ) ) ( not ( = ?auto_856025 ?auto_856030 ) ) ( not ( = ?auto_856025 ?auto_856031 ) ) ( not ( = ?auto_856025 ?auto_856032 ) ) ( not ( = ?auto_856025 ?auto_856033 ) ) ( not ( = ?auto_856025 ?auto_856034 ) ) ( not ( = ?auto_856025 ?auto_856035 ) ) ( not ( = ?auto_856026 ?auto_856027 ) ) ( not ( = ?auto_856026 ?auto_856028 ) ) ( not ( = ?auto_856026 ?auto_856029 ) ) ( not ( = ?auto_856026 ?auto_856030 ) ) ( not ( = ?auto_856026 ?auto_856031 ) ) ( not ( = ?auto_856026 ?auto_856032 ) ) ( not ( = ?auto_856026 ?auto_856033 ) ) ( not ( = ?auto_856026 ?auto_856034 ) ) ( not ( = ?auto_856026 ?auto_856035 ) ) ( not ( = ?auto_856027 ?auto_856028 ) ) ( not ( = ?auto_856027 ?auto_856029 ) ) ( not ( = ?auto_856027 ?auto_856030 ) ) ( not ( = ?auto_856027 ?auto_856031 ) ) ( not ( = ?auto_856027 ?auto_856032 ) ) ( not ( = ?auto_856027 ?auto_856033 ) ) ( not ( = ?auto_856027 ?auto_856034 ) ) ( not ( = ?auto_856027 ?auto_856035 ) ) ( not ( = ?auto_856028 ?auto_856029 ) ) ( not ( = ?auto_856028 ?auto_856030 ) ) ( not ( = ?auto_856028 ?auto_856031 ) ) ( not ( = ?auto_856028 ?auto_856032 ) ) ( not ( = ?auto_856028 ?auto_856033 ) ) ( not ( = ?auto_856028 ?auto_856034 ) ) ( not ( = ?auto_856028 ?auto_856035 ) ) ( not ( = ?auto_856029 ?auto_856030 ) ) ( not ( = ?auto_856029 ?auto_856031 ) ) ( not ( = ?auto_856029 ?auto_856032 ) ) ( not ( = ?auto_856029 ?auto_856033 ) ) ( not ( = ?auto_856029 ?auto_856034 ) ) ( not ( = ?auto_856029 ?auto_856035 ) ) ( not ( = ?auto_856030 ?auto_856031 ) ) ( not ( = ?auto_856030 ?auto_856032 ) ) ( not ( = ?auto_856030 ?auto_856033 ) ) ( not ( = ?auto_856030 ?auto_856034 ) ) ( not ( = ?auto_856030 ?auto_856035 ) ) ( not ( = ?auto_856031 ?auto_856032 ) ) ( not ( = ?auto_856031 ?auto_856033 ) ) ( not ( = ?auto_856031 ?auto_856034 ) ) ( not ( = ?auto_856031 ?auto_856035 ) ) ( not ( = ?auto_856032 ?auto_856033 ) ) ( not ( = ?auto_856032 ?auto_856034 ) ) ( not ( = ?auto_856032 ?auto_856035 ) ) ( not ( = ?auto_856033 ?auto_856034 ) ) ( not ( = ?auto_856033 ?auto_856035 ) ) ( not ( = ?auto_856034 ?auto_856035 ) ) ( ON ?auto_856033 ?auto_856034 ) ( ON ?auto_856032 ?auto_856033 ) ( ON ?auto_856031 ?auto_856032 ) ( ON ?auto_856030 ?auto_856031 ) ( ON ?auto_856029 ?auto_856030 ) ( ON ?auto_856028 ?auto_856029 ) ( CLEAR ?auto_856026 ) ( ON ?auto_856027 ?auto_856028 ) ( CLEAR ?auto_856027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_856024 ?auto_856025 ?auto_856026 ?auto_856027 )
      ( MAKE-11PILE ?auto_856024 ?auto_856025 ?auto_856026 ?auto_856027 ?auto_856028 ?auto_856029 ?auto_856030 ?auto_856031 ?auto_856032 ?auto_856033 ?auto_856034 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_856070 - BLOCK
      ?auto_856071 - BLOCK
      ?auto_856072 - BLOCK
      ?auto_856073 - BLOCK
      ?auto_856074 - BLOCK
      ?auto_856075 - BLOCK
      ?auto_856076 - BLOCK
      ?auto_856077 - BLOCK
      ?auto_856078 - BLOCK
      ?auto_856079 - BLOCK
      ?auto_856080 - BLOCK
    )
    :vars
    (
      ?auto_856081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856080 ?auto_856081 ) ( ON-TABLE ?auto_856070 ) ( ON ?auto_856071 ?auto_856070 ) ( not ( = ?auto_856070 ?auto_856071 ) ) ( not ( = ?auto_856070 ?auto_856072 ) ) ( not ( = ?auto_856070 ?auto_856073 ) ) ( not ( = ?auto_856070 ?auto_856074 ) ) ( not ( = ?auto_856070 ?auto_856075 ) ) ( not ( = ?auto_856070 ?auto_856076 ) ) ( not ( = ?auto_856070 ?auto_856077 ) ) ( not ( = ?auto_856070 ?auto_856078 ) ) ( not ( = ?auto_856070 ?auto_856079 ) ) ( not ( = ?auto_856070 ?auto_856080 ) ) ( not ( = ?auto_856070 ?auto_856081 ) ) ( not ( = ?auto_856071 ?auto_856072 ) ) ( not ( = ?auto_856071 ?auto_856073 ) ) ( not ( = ?auto_856071 ?auto_856074 ) ) ( not ( = ?auto_856071 ?auto_856075 ) ) ( not ( = ?auto_856071 ?auto_856076 ) ) ( not ( = ?auto_856071 ?auto_856077 ) ) ( not ( = ?auto_856071 ?auto_856078 ) ) ( not ( = ?auto_856071 ?auto_856079 ) ) ( not ( = ?auto_856071 ?auto_856080 ) ) ( not ( = ?auto_856071 ?auto_856081 ) ) ( not ( = ?auto_856072 ?auto_856073 ) ) ( not ( = ?auto_856072 ?auto_856074 ) ) ( not ( = ?auto_856072 ?auto_856075 ) ) ( not ( = ?auto_856072 ?auto_856076 ) ) ( not ( = ?auto_856072 ?auto_856077 ) ) ( not ( = ?auto_856072 ?auto_856078 ) ) ( not ( = ?auto_856072 ?auto_856079 ) ) ( not ( = ?auto_856072 ?auto_856080 ) ) ( not ( = ?auto_856072 ?auto_856081 ) ) ( not ( = ?auto_856073 ?auto_856074 ) ) ( not ( = ?auto_856073 ?auto_856075 ) ) ( not ( = ?auto_856073 ?auto_856076 ) ) ( not ( = ?auto_856073 ?auto_856077 ) ) ( not ( = ?auto_856073 ?auto_856078 ) ) ( not ( = ?auto_856073 ?auto_856079 ) ) ( not ( = ?auto_856073 ?auto_856080 ) ) ( not ( = ?auto_856073 ?auto_856081 ) ) ( not ( = ?auto_856074 ?auto_856075 ) ) ( not ( = ?auto_856074 ?auto_856076 ) ) ( not ( = ?auto_856074 ?auto_856077 ) ) ( not ( = ?auto_856074 ?auto_856078 ) ) ( not ( = ?auto_856074 ?auto_856079 ) ) ( not ( = ?auto_856074 ?auto_856080 ) ) ( not ( = ?auto_856074 ?auto_856081 ) ) ( not ( = ?auto_856075 ?auto_856076 ) ) ( not ( = ?auto_856075 ?auto_856077 ) ) ( not ( = ?auto_856075 ?auto_856078 ) ) ( not ( = ?auto_856075 ?auto_856079 ) ) ( not ( = ?auto_856075 ?auto_856080 ) ) ( not ( = ?auto_856075 ?auto_856081 ) ) ( not ( = ?auto_856076 ?auto_856077 ) ) ( not ( = ?auto_856076 ?auto_856078 ) ) ( not ( = ?auto_856076 ?auto_856079 ) ) ( not ( = ?auto_856076 ?auto_856080 ) ) ( not ( = ?auto_856076 ?auto_856081 ) ) ( not ( = ?auto_856077 ?auto_856078 ) ) ( not ( = ?auto_856077 ?auto_856079 ) ) ( not ( = ?auto_856077 ?auto_856080 ) ) ( not ( = ?auto_856077 ?auto_856081 ) ) ( not ( = ?auto_856078 ?auto_856079 ) ) ( not ( = ?auto_856078 ?auto_856080 ) ) ( not ( = ?auto_856078 ?auto_856081 ) ) ( not ( = ?auto_856079 ?auto_856080 ) ) ( not ( = ?auto_856079 ?auto_856081 ) ) ( not ( = ?auto_856080 ?auto_856081 ) ) ( ON ?auto_856079 ?auto_856080 ) ( ON ?auto_856078 ?auto_856079 ) ( ON ?auto_856077 ?auto_856078 ) ( ON ?auto_856076 ?auto_856077 ) ( ON ?auto_856075 ?auto_856076 ) ( ON ?auto_856074 ?auto_856075 ) ( ON ?auto_856073 ?auto_856074 ) ( CLEAR ?auto_856071 ) ( ON ?auto_856072 ?auto_856073 ) ( CLEAR ?auto_856072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_856070 ?auto_856071 ?auto_856072 )
      ( MAKE-11PILE ?auto_856070 ?auto_856071 ?auto_856072 ?auto_856073 ?auto_856074 ?auto_856075 ?auto_856076 ?auto_856077 ?auto_856078 ?auto_856079 ?auto_856080 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_856116 - BLOCK
      ?auto_856117 - BLOCK
      ?auto_856118 - BLOCK
      ?auto_856119 - BLOCK
      ?auto_856120 - BLOCK
      ?auto_856121 - BLOCK
      ?auto_856122 - BLOCK
      ?auto_856123 - BLOCK
      ?auto_856124 - BLOCK
      ?auto_856125 - BLOCK
      ?auto_856126 - BLOCK
    )
    :vars
    (
      ?auto_856127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856126 ?auto_856127 ) ( ON-TABLE ?auto_856116 ) ( not ( = ?auto_856116 ?auto_856117 ) ) ( not ( = ?auto_856116 ?auto_856118 ) ) ( not ( = ?auto_856116 ?auto_856119 ) ) ( not ( = ?auto_856116 ?auto_856120 ) ) ( not ( = ?auto_856116 ?auto_856121 ) ) ( not ( = ?auto_856116 ?auto_856122 ) ) ( not ( = ?auto_856116 ?auto_856123 ) ) ( not ( = ?auto_856116 ?auto_856124 ) ) ( not ( = ?auto_856116 ?auto_856125 ) ) ( not ( = ?auto_856116 ?auto_856126 ) ) ( not ( = ?auto_856116 ?auto_856127 ) ) ( not ( = ?auto_856117 ?auto_856118 ) ) ( not ( = ?auto_856117 ?auto_856119 ) ) ( not ( = ?auto_856117 ?auto_856120 ) ) ( not ( = ?auto_856117 ?auto_856121 ) ) ( not ( = ?auto_856117 ?auto_856122 ) ) ( not ( = ?auto_856117 ?auto_856123 ) ) ( not ( = ?auto_856117 ?auto_856124 ) ) ( not ( = ?auto_856117 ?auto_856125 ) ) ( not ( = ?auto_856117 ?auto_856126 ) ) ( not ( = ?auto_856117 ?auto_856127 ) ) ( not ( = ?auto_856118 ?auto_856119 ) ) ( not ( = ?auto_856118 ?auto_856120 ) ) ( not ( = ?auto_856118 ?auto_856121 ) ) ( not ( = ?auto_856118 ?auto_856122 ) ) ( not ( = ?auto_856118 ?auto_856123 ) ) ( not ( = ?auto_856118 ?auto_856124 ) ) ( not ( = ?auto_856118 ?auto_856125 ) ) ( not ( = ?auto_856118 ?auto_856126 ) ) ( not ( = ?auto_856118 ?auto_856127 ) ) ( not ( = ?auto_856119 ?auto_856120 ) ) ( not ( = ?auto_856119 ?auto_856121 ) ) ( not ( = ?auto_856119 ?auto_856122 ) ) ( not ( = ?auto_856119 ?auto_856123 ) ) ( not ( = ?auto_856119 ?auto_856124 ) ) ( not ( = ?auto_856119 ?auto_856125 ) ) ( not ( = ?auto_856119 ?auto_856126 ) ) ( not ( = ?auto_856119 ?auto_856127 ) ) ( not ( = ?auto_856120 ?auto_856121 ) ) ( not ( = ?auto_856120 ?auto_856122 ) ) ( not ( = ?auto_856120 ?auto_856123 ) ) ( not ( = ?auto_856120 ?auto_856124 ) ) ( not ( = ?auto_856120 ?auto_856125 ) ) ( not ( = ?auto_856120 ?auto_856126 ) ) ( not ( = ?auto_856120 ?auto_856127 ) ) ( not ( = ?auto_856121 ?auto_856122 ) ) ( not ( = ?auto_856121 ?auto_856123 ) ) ( not ( = ?auto_856121 ?auto_856124 ) ) ( not ( = ?auto_856121 ?auto_856125 ) ) ( not ( = ?auto_856121 ?auto_856126 ) ) ( not ( = ?auto_856121 ?auto_856127 ) ) ( not ( = ?auto_856122 ?auto_856123 ) ) ( not ( = ?auto_856122 ?auto_856124 ) ) ( not ( = ?auto_856122 ?auto_856125 ) ) ( not ( = ?auto_856122 ?auto_856126 ) ) ( not ( = ?auto_856122 ?auto_856127 ) ) ( not ( = ?auto_856123 ?auto_856124 ) ) ( not ( = ?auto_856123 ?auto_856125 ) ) ( not ( = ?auto_856123 ?auto_856126 ) ) ( not ( = ?auto_856123 ?auto_856127 ) ) ( not ( = ?auto_856124 ?auto_856125 ) ) ( not ( = ?auto_856124 ?auto_856126 ) ) ( not ( = ?auto_856124 ?auto_856127 ) ) ( not ( = ?auto_856125 ?auto_856126 ) ) ( not ( = ?auto_856125 ?auto_856127 ) ) ( not ( = ?auto_856126 ?auto_856127 ) ) ( ON ?auto_856125 ?auto_856126 ) ( ON ?auto_856124 ?auto_856125 ) ( ON ?auto_856123 ?auto_856124 ) ( ON ?auto_856122 ?auto_856123 ) ( ON ?auto_856121 ?auto_856122 ) ( ON ?auto_856120 ?auto_856121 ) ( ON ?auto_856119 ?auto_856120 ) ( ON ?auto_856118 ?auto_856119 ) ( CLEAR ?auto_856116 ) ( ON ?auto_856117 ?auto_856118 ) ( CLEAR ?auto_856117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_856116 ?auto_856117 )
      ( MAKE-11PILE ?auto_856116 ?auto_856117 ?auto_856118 ?auto_856119 ?auto_856120 ?auto_856121 ?auto_856122 ?auto_856123 ?auto_856124 ?auto_856125 ?auto_856126 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_856162 - BLOCK
      ?auto_856163 - BLOCK
      ?auto_856164 - BLOCK
      ?auto_856165 - BLOCK
      ?auto_856166 - BLOCK
      ?auto_856167 - BLOCK
      ?auto_856168 - BLOCK
      ?auto_856169 - BLOCK
      ?auto_856170 - BLOCK
      ?auto_856171 - BLOCK
      ?auto_856172 - BLOCK
    )
    :vars
    (
      ?auto_856173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856172 ?auto_856173 ) ( not ( = ?auto_856162 ?auto_856163 ) ) ( not ( = ?auto_856162 ?auto_856164 ) ) ( not ( = ?auto_856162 ?auto_856165 ) ) ( not ( = ?auto_856162 ?auto_856166 ) ) ( not ( = ?auto_856162 ?auto_856167 ) ) ( not ( = ?auto_856162 ?auto_856168 ) ) ( not ( = ?auto_856162 ?auto_856169 ) ) ( not ( = ?auto_856162 ?auto_856170 ) ) ( not ( = ?auto_856162 ?auto_856171 ) ) ( not ( = ?auto_856162 ?auto_856172 ) ) ( not ( = ?auto_856162 ?auto_856173 ) ) ( not ( = ?auto_856163 ?auto_856164 ) ) ( not ( = ?auto_856163 ?auto_856165 ) ) ( not ( = ?auto_856163 ?auto_856166 ) ) ( not ( = ?auto_856163 ?auto_856167 ) ) ( not ( = ?auto_856163 ?auto_856168 ) ) ( not ( = ?auto_856163 ?auto_856169 ) ) ( not ( = ?auto_856163 ?auto_856170 ) ) ( not ( = ?auto_856163 ?auto_856171 ) ) ( not ( = ?auto_856163 ?auto_856172 ) ) ( not ( = ?auto_856163 ?auto_856173 ) ) ( not ( = ?auto_856164 ?auto_856165 ) ) ( not ( = ?auto_856164 ?auto_856166 ) ) ( not ( = ?auto_856164 ?auto_856167 ) ) ( not ( = ?auto_856164 ?auto_856168 ) ) ( not ( = ?auto_856164 ?auto_856169 ) ) ( not ( = ?auto_856164 ?auto_856170 ) ) ( not ( = ?auto_856164 ?auto_856171 ) ) ( not ( = ?auto_856164 ?auto_856172 ) ) ( not ( = ?auto_856164 ?auto_856173 ) ) ( not ( = ?auto_856165 ?auto_856166 ) ) ( not ( = ?auto_856165 ?auto_856167 ) ) ( not ( = ?auto_856165 ?auto_856168 ) ) ( not ( = ?auto_856165 ?auto_856169 ) ) ( not ( = ?auto_856165 ?auto_856170 ) ) ( not ( = ?auto_856165 ?auto_856171 ) ) ( not ( = ?auto_856165 ?auto_856172 ) ) ( not ( = ?auto_856165 ?auto_856173 ) ) ( not ( = ?auto_856166 ?auto_856167 ) ) ( not ( = ?auto_856166 ?auto_856168 ) ) ( not ( = ?auto_856166 ?auto_856169 ) ) ( not ( = ?auto_856166 ?auto_856170 ) ) ( not ( = ?auto_856166 ?auto_856171 ) ) ( not ( = ?auto_856166 ?auto_856172 ) ) ( not ( = ?auto_856166 ?auto_856173 ) ) ( not ( = ?auto_856167 ?auto_856168 ) ) ( not ( = ?auto_856167 ?auto_856169 ) ) ( not ( = ?auto_856167 ?auto_856170 ) ) ( not ( = ?auto_856167 ?auto_856171 ) ) ( not ( = ?auto_856167 ?auto_856172 ) ) ( not ( = ?auto_856167 ?auto_856173 ) ) ( not ( = ?auto_856168 ?auto_856169 ) ) ( not ( = ?auto_856168 ?auto_856170 ) ) ( not ( = ?auto_856168 ?auto_856171 ) ) ( not ( = ?auto_856168 ?auto_856172 ) ) ( not ( = ?auto_856168 ?auto_856173 ) ) ( not ( = ?auto_856169 ?auto_856170 ) ) ( not ( = ?auto_856169 ?auto_856171 ) ) ( not ( = ?auto_856169 ?auto_856172 ) ) ( not ( = ?auto_856169 ?auto_856173 ) ) ( not ( = ?auto_856170 ?auto_856171 ) ) ( not ( = ?auto_856170 ?auto_856172 ) ) ( not ( = ?auto_856170 ?auto_856173 ) ) ( not ( = ?auto_856171 ?auto_856172 ) ) ( not ( = ?auto_856171 ?auto_856173 ) ) ( not ( = ?auto_856172 ?auto_856173 ) ) ( ON ?auto_856171 ?auto_856172 ) ( ON ?auto_856170 ?auto_856171 ) ( ON ?auto_856169 ?auto_856170 ) ( ON ?auto_856168 ?auto_856169 ) ( ON ?auto_856167 ?auto_856168 ) ( ON ?auto_856166 ?auto_856167 ) ( ON ?auto_856165 ?auto_856166 ) ( ON ?auto_856164 ?auto_856165 ) ( ON ?auto_856163 ?auto_856164 ) ( ON ?auto_856162 ?auto_856163 ) ( CLEAR ?auto_856162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_856162 )
      ( MAKE-11PILE ?auto_856162 ?auto_856163 ?auto_856164 ?auto_856165 ?auto_856166 ?auto_856167 ?auto_856168 ?auto_856169 ?auto_856170 ?auto_856171 ?auto_856172 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_856209 - BLOCK
      ?auto_856210 - BLOCK
      ?auto_856211 - BLOCK
      ?auto_856212 - BLOCK
      ?auto_856213 - BLOCK
      ?auto_856214 - BLOCK
      ?auto_856215 - BLOCK
      ?auto_856216 - BLOCK
      ?auto_856217 - BLOCK
      ?auto_856218 - BLOCK
      ?auto_856219 - BLOCK
      ?auto_856220 - BLOCK
    )
    :vars
    (
      ?auto_856221 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_856219 ) ( ON ?auto_856220 ?auto_856221 ) ( CLEAR ?auto_856220 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_856209 ) ( ON ?auto_856210 ?auto_856209 ) ( ON ?auto_856211 ?auto_856210 ) ( ON ?auto_856212 ?auto_856211 ) ( ON ?auto_856213 ?auto_856212 ) ( ON ?auto_856214 ?auto_856213 ) ( ON ?auto_856215 ?auto_856214 ) ( ON ?auto_856216 ?auto_856215 ) ( ON ?auto_856217 ?auto_856216 ) ( ON ?auto_856218 ?auto_856217 ) ( ON ?auto_856219 ?auto_856218 ) ( not ( = ?auto_856209 ?auto_856210 ) ) ( not ( = ?auto_856209 ?auto_856211 ) ) ( not ( = ?auto_856209 ?auto_856212 ) ) ( not ( = ?auto_856209 ?auto_856213 ) ) ( not ( = ?auto_856209 ?auto_856214 ) ) ( not ( = ?auto_856209 ?auto_856215 ) ) ( not ( = ?auto_856209 ?auto_856216 ) ) ( not ( = ?auto_856209 ?auto_856217 ) ) ( not ( = ?auto_856209 ?auto_856218 ) ) ( not ( = ?auto_856209 ?auto_856219 ) ) ( not ( = ?auto_856209 ?auto_856220 ) ) ( not ( = ?auto_856209 ?auto_856221 ) ) ( not ( = ?auto_856210 ?auto_856211 ) ) ( not ( = ?auto_856210 ?auto_856212 ) ) ( not ( = ?auto_856210 ?auto_856213 ) ) ( not ( = ?auto_856210 ?auto_856214 ) ) ( not ( = ?auto_856210 ?auto_856215 ) ) ( not ( = ?auto_856210 ?auto_856216 ) ) ( not ( = ?auto_856210 ?auto_856217 ) ) ( not ( = ?auto_856210 ?auto_856218 ) ) ( not ( = ?auto_856210 ?auto_856219 ) ) ( not ( = ?auto_856210 ?auto_856220 ) ) ( not ( = ?auto_856210 ?auto_856221 ) ) ( not ( = ?auto_856211 ?auto_856212 ) ) ( not ( = ?auto_856211 ?auto_856213 ) ) ( not ( = ?auto_856211 ?auto_856214 ) ) ( not ( = ?auto_856211 ?auto_856215 ) ) ( not ( = ?auto_856211 ?auto_856216 ) ) ( not ( = ?auto_856211 ?auto_856217 ) ) ( not ( = ?auto_856211 ?auto_856218 ) ) ( not ( = ?auto_856211 ?auto_856219 ) ) ( not ( = ?auto_856211 ?auto_856220 ) ) ( not ( = ?auto_856211 ?auto_856221 ) ) ( not ( = ?auto_856212 ?auto_856213 ) ) ( not ( = ?auto_856212 ?auto_856214 ) ) ( not ( = ?auto_856212 ?auto_856215 ) ) ( not ( = ?auto_856212 ?auto_856216 ) ) ( not ( = ?auto_856212 ?auto_856217 ) ) ( not ( = ?auto_856212 ?auto_856218 ) ) ( not ( = ?auto_856212 ?auto_856219 ) ) ( not ( = ?auto_856212 ?auto_856220 ) ) ( not ( = ?auto_856212 ?auto_856221 ) ) ( not ( = ?auto_856213 ?auto_856214 ) ) ( not ( = ?auto_856213 ?auto_856215 ) ) ( not ( = ?auto_856213 ?auto_856216 ) ) ( not ( = ?auto_856213 ?auto_856217 ) ) ( not ( = ?auto_856213 ?auto_856218 ) ) ( not ( = ?auto_856213 ?auto_856219 ) ) ( not ( = ?auto_856213 ?auto_856220 ) ) ( not ( = ?auto_856213 ?auto_856221 ) ) ( not ( = ?auto_856214 ?auto_856215 ) ) ( not ( = ?auto_856214 ?auto_856216 ) ) ( not ( = ?auto_856214 ?auto_856217 ) ) ( not ( = ?auto_856214 ?auto_856218 ) ) ( not ( = ?auto_856214 ?auto_856219 ) ) ( not ( = ?auto_856214 ?auto_856220 ) ) ( not ( = ?auto_856214 ?auto_856221 ) ) ( not ( = ?auto_856215 ?auto_856216 ) ) ( not ( = ?auto_856215 ?auto_856217 ) ) ( not ( = ?auto_856215 ?auto_856218 ) ) ( not ( = ?auto_856215 ?auto_856219 ) ) ( not ( = ?auto_856215 ?auto_856220 ) ) ( not ( = ?auto_856215 ?auto_856221 ) ) ( not ( = ?auto_856216 ?auto_856217 ) ) ( not ( = ?auto_856216 ?auto_856218 ) ) ( not ( = ?auto_856216 ?auto_856219 ) ) ( not ( = ?auto_856216 ?auto_856220 ) ) ( not ( = ?auto_856216 ?auto_856221 ) ) ( not ( = ?auto_856217 ?auto_856218 ) ) ( not ( = ?auto_856217 ?auto_856219 ) ) ( not ( = ?auto_856217 ?auto_856220 ) ) ( not ( = ?auto_856217 ?auto_856221 ) ) ( not ( = ?auto_856218 ?auto_856219 ) ) ( not ( = ?auto_856218 ?auto_856220 ) ) ( not ( = ?auto_856218 ?auto_856221 ) ) ( not ( = ?auto_856219 ?auto_856220 ) ) ( not ( = ?auto_856219 ?auto_856221 ) ) ( not ( = ?auto_856220 ?auto_856221 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_856220 ?auto_856221 )
      ( !STACK ?auto_856220 ?auto_856219 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_856259 - BLOCK
      ?auto_856260 - BLOCK
      ?auto_856261 - BLOCK
      ?auto_856262 - BLOCK
      ?auto_856263 - BLOCK
      ?auto_856264 - BLOCK
      ?auto_856265 - BLOCK
      ?auto_856266 - BLOCK
      ?auto_856267 - BLOCK
      ?auto_856268 - BLOCK
      ?auto_856269 - BLOCK
      ?auto_856270 - BLOCK
    )
    :vars
    (
      ?auto_856271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856270 ?auto_856271 ) ( ON-TABLE ?auto_856259 ) ( ON ?auto_856260 ?auto_856259 ) ( ON ?auto_856261 ?auto_856260 ) ( ON ?auto_856262 ?auto_856261 ) ( ON ?auto_856263 ?auto_856262 ) ( ON ?auto_856264 ?auto_856263 ) ( ON ?auto_856265 ?auto_856264 ) ( ON ?auto_856266 ?auto_856265 ) ( ON ?auto_856267 ?auto_856266 ) ( ON ?auto_856268 ?auto_856267 ) ( not ( = ?auto_856259 ?auto_856260 ) ) ( not ( = ?auto_856259 ?auto_856261 ) ) ( not ( = ?auto_856259 ?auto_856262 ) ) ( not ( = ?auto_856259 ?auto_856263 ) ) ( not ( = ?auto_856259 ?auto_856264 ) ) ( not ( = ?auto_856259 ?auto_856265 ) ) ( not ( = ?auto_856259 ?auto_856266 ) ) ( not ( = ?auto_856259 ?auto_856267 ) ) ( not ( = ?auto_856259 ?auto_856268 ) ) ( not ( = ?auto_856259 ?auto_856269 ) ) ( not ( = ?auto_856259 ?auto_856270 ) ) ( not ( = ?auto_856259 ?auto_856271 ) ) ( not ( = ?auto_856260 ?auto_856261 ) ) ( not ( = ?auto_856260 ?auto_856262 ) ) ( not ( = ?auto_856260 ?auto_856263 ) ) ( not ( = ?auto_856260 ?auto_856264 ) ) ( not ( = ?auto_856260 ?auto_856265 ) ) ( not ( = ?auto_856260 ?auto_856266 ) ) ( not ( = ?auto_856260 ?auto_856267 ) ) ( not ( = ?auto_856260 ?auto_856268 ) ) ( not ( = ?auto_856260 ?auto_856269 ) ) ( not ( = ?auto_856260 ?auto_856270 ) ) ( not ( = ?auto_856260 ?auto_856271 ) ) ( not ( = ?auto_856261 ?auto_856262 ) ) ( not ( = ?auto_856261 ?auto_856263 ) ) ( not ( = ?auto_856261 ?auto_856264 ) ) ( not ( = ?auto_856261 ?auto_856265 ) ) ( not ( = ?auto_856261 ?auto_856266 ) ) ( not ( = ?auto_856261 ?auto_856267 ) ) ( not ( = ?auto_856261 ?auto_856268 ) ) ( not ( = ?auto_856261 ?auto_856269 ) ) ( not ( = ?auto_856261 ?auto_856270 ) ) ( not ( = ?auto_856261 ?auto_856271 ) ) ( not ( = ?auto_856262 ?auto_856263 ) ) ( not ( = ?auto_856262 ?auto_856264 ) ) ( not ( = ?auto_856262 ?auto_856265 ) ) ( not ( = ?auto_856262 ?auto_856266 ) ) ( not ( = ?auto_856262 ?auto_856267 ) ) ( not ( = ?auto_856262 ?auto_856268 ) ) ( not ( = ?auto_856262 ?auto_856269 ) ) ( not ( = ?auto_856262 ?auto_856270 ) ) ( not ( = ?auto_856262 ?auto_856271 ) ) ( not ( = ?auto_856263 ?auto_856264 ) ) ( not ( = ?auto_856263 ?auto_856265 ) ) ( not ( = ?auto_856263 ?auto_856266 ) ) ( not ( = ?auto_856263 ?auto_856267 ) ) ( not ( = ?auto_856263 ?auto_856268 ) ) ( not ( = ?auto_856263 ?auto_856269 ) ) ( not ( = ?auto_856263 ?auto_856270 ) ) ( not ( = ?auto_856263 ?auto_856271 ) ) ( not ( = ?auto_856264 ?auto_856265 ) ) ( not ( = ?auto_856264 ?auto_856266 ) ) ( not ( = ?auto_856264 ?auto_856267 ) ) ( not ( = ?auto_856264 ?auto_856268 ) ) ( not ( = ?auto_856264 ?auto_856269 ) ) ( not ( = ?auto_856264 ?auto_856270 ) ) ( not ( = ?auto_856264 ?auto_856271 ) ) ( not ( = ?auto_856265 ?auto_856266 ) ) ( not ( = ?auto_856265 ?auto_856267 ) ) ( not ( = ?auto_856265 ?auto_856268 ) ) ( not ( = ?auto_856265 ?auto_856269 ) ) ( not ( = ?auto_856265 ?auto_856270 ) ) ( not ( = ?auto_856265 ?auto_856271 ) ) ( not ( = ?auto_856266 ?auto_856267 ) ) ( not ( = ?auto_856266 ?auto_856268 ) ) ( not ( = ?auto_856266 ?auto_856269 ) ) ( not ( = ?auto_856266 ?auto_856270 ) ) ( not ( = ?auto_856266 ?auto_856271 ) ) ( not ( = ?auto_856267 ?auto_856268 ) ) ( not ( = ?auto_856267 ?auto_856269 ) ) ( not ( = ?auto_856267 ?auto_856270 ) ) ( not ( = ?auto_856267 ?auto_856271 ) ) ( not ( = ?auto_856268 ?auto_856269 ) ) ( not ( = ?auto_856268 ?auto_856270 ) ) ( not ( = ?auto_856268 ?auto_856271 ) ) ( not ( = ?auto_856269 ?auto_856270 ) ) ( not ( = ?auto_856269 ?auto_856271 ) ) ( not ( = ?auto_856270 ?auto_856271 ) ) ( CLEAR ?auto_856268 ) ( ON ?auto_856269 ?auto_856270 ) ( CLEAR ?auto_856269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_856259 ?auto_856260 ?auto_856261 ?auto_856262 ?auto_856263 ?auto_856264 ?auto_856265 ?auto_856266 ?auto_856267 ?auto_856268 ?auto_856269 )
      ( MAKE-12PILE ?auto_856259 ?auto_856260 ?auto_856261 ?auto_856262 ?auto_856263 ?auto_856264 ?auto_856265 ?auto_856266 ?auto_856267 ?auto_856268 ?auto_856269 ?auto_856270 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_856309 - BLOCK
      ?auto_856310 - BLOCK
      ?auto_856311 - BLOCK
      ?auto_856312 - BLOCK
      ?auto_856313 - BLOCK
      ?auto_856314 - BLOCK
      ?auto_856315 - BLOCK
      ?auto_856316 - BLOCK
      ?auto_856317 - BLOCK
      ?auto_856318 - BLOCK
      ?auto_856319 - BLOCK
      ?auto_856320 - BLOCK
    )
    :vars
    (
      ?auto_856321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856320 ?auto_856321 ) ( ON-TABLE ?auto_856309 ) ( ON ?auto_856310 ?auto_856309 ) ( ON ?auto_856311 ?auto_856310 ) ( ON ?auto_856312 ?auto_856311 ) ( ON ?auto_856313 ?auto_856312 ) ( ON ?auto_856314 ?auto_856313 ) ( ON ?auto_856315 ?auto_856314 ) ( ON ?auto_856316 ?auto_856315 ) ( ON ?auto_856317 ?auto_856316 ) ( not ( = ?auto_856309 ?auto_856310 ) ) ( not ( = ?auto_856309 ?auto_856311 ) ) ( not ( = ?auto_856309 ?auto_856312 ) ) ( not ( = ?auto_856309 ?auto_856313 ) ) ( not ( = ?auto_856309 ?auto_856314 ) ) ( not ( = ?auto_856309 ?auto_856315 ) ) ( not ( = ?auto_856309 ?auto_856316 ) ) ( not ( = ?auto_856309 ?auto_856317 ) ) ( not ( = ?auto_856309 ?auto_856318 ) ) ( not ( = ?auto_856309 ?auto_856319 ) ) ( not ( = ?auto_856309 ?auto_856320 ) ) ( not ( = ?auto_856309 ?auto_856321 ) ) ( not ( = ?auto_856310 ?auto_856311 ) ) ( not ( = ?auto_856310 ?auto_856312 ) ) ( not ( = ?auto_856310 ?auto_856313 ) ) ( not ( = ?auto_856310 ?auto_856314 ) ) ( not ( = ?auto_856310 ?auto_856315 ) ) ( not ( = ?auto_856310 ?auto_856316 ) ) ( not ( = ?auto_856310 ?auto_856317 ) ) ( not ( = ?auto_856310 ?auto_856318 ) ) ( not ( = ?auto_856310 ?auto_856319 ) ) ( not ( = ?auto_856310 ?auto_856320 ) ) ( not ( = ?auto_856310 ?auto_856321 ) ) ( not ( = ?auto_856311 ?auto_856312 ) ) ( not ( = ?auto_856311 ?auto_856313 ) ) ( not ( = ?auto_856311 ?auto_856314 ) ) ( not ( = ?auto_856311 ?auto_856315 ) ) ( not ( = ?auto_856311 ?auto_856316 ) ) ( not ( = ?auto_856311 ?auto_856317 ) ) ( not ( = ?auto_856311 ?auto_856318 ) ) ( not ( = ?auto_856311 ?auto_856319 ) ) ( not ( = ?auto_856311 ?auto_856320 ) ) ( not ( = ?auto_856311 ?auto_856321 ) ) ( not ( = ?auto_856312 ?auto_856313 ) ) ( not ( = ?auto_856312 ?auto_856314 ) ) ( not ( = ?auto_856312 ?auto_856315 ) ) ( not ( = ?auto_856312 ?auto_856316 ) ) ( not ( = ?auto_856312 ?auto_856317 ) ) ( not ( = ?auto_856312 ?auto_856318 ) ) ( not ( = ?auto_856312 ?auto_856319 ) ) ( not ( = ?auto_856312 ?auto_856320 ) ) ( not ( = ?auto_856312 ?auto_856321 ) ) ( not ( = ?auto_856313 ?auto_856314 ) ) ( not ( = ?auto_856313 ?auto_856315 ) ) ( not ( = ?auto_856313 ?auto_856316 ) ) ( not ( = ?auto_856313 ?auto_856317 ) ) ( not ( = ?auto_856313 ?auto_856318 ) ) ( not ( = ?auto_856313 ?auto_856319 ) ) ( not ( = ?auto_856313 ?auto_856320 ) ) ( not ( = ?auto_856313 ?auto_856321 ) ) ( not ( = ?auto_856314 ?auto_856315 ) ) ( not ( = ?auto_856314 ?auto_856316 ) ) ( not ( = ?auto_856314 ?auto_856317 ) ) ( not ( = ?auto_856314 ?auto_856318 ) ) ( not ( = ?auto_856314 ?auto_856319 ) ) ( not ( = ?auto_856314 ?auto_856320 ) ) ( not ( = ?auto_856314 ?auto_856321 ) ) ( not ( = ?auto_856315 ?auto_856316 ) ) ( not ( = ?auto_856315 ?auto_856317 ) ) ( not ( = ?auto_856315 ?auto_856318 ) ) ( not ( = ?auto_856315 ?auto_856319 ) ) ( not ( = ?auto_856315 ?auto_856320 ) ) ( not ( = ?auto_856315 ?auto_856321 ) ) ( not ( = ?auto_856316 ?auto_856317 ) ) ( not ( = ?auto_856316 ?auto_856318 ) ) ( not ( = ?auto_856316 ?auto_856319 ) ) ( not ( = ?auto_856316 ?auto_856320 ) ) ( not ( = ?auto_856316 ?auto_856321 ) ) ( not ( = ?auto_856317 ?auto_856318 ) ) ( not ( = ?auto_856317 ?auto_856319 ) ) ( not ( = ?auto_856317 ?auto_856320 ) ) ( not ( = ?auto_856317 ?auto_856321 ) ) ( not ( = ?auto_856318 ?auto_856319 ) ) ( not ( = ?auto_856318 ?auto_856320 ) ) ( not ( = ?auto_856318 ?auto_856321 ) ) ( not ( = ?auto_856319 ?auto_856320 ) ) ( not ( = ?auto_856319 ?auto_856321 ) ) ( not ( = ?auto_856320 ?auto_856321 ) ) ( ON ?auto_856319 ?auto_856320 ) ( CLEAR ?auto_856317 ) ( ON ?auto_856318 ?auto_856319 ) ( CLEAR ?auto_856318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_856309 ?auto_856310 ?auto_856311 ?auto_856312 ?auto_856313 ?auto_856314 ?auto_856315 ?auto_856316 ?auto_856317 ?auto_856318 )
      ( MAKE-12PILE ?auto_856309 ?auto_856310 ?auto_856311 ?auto_856312 ?auto_856313 ?auto_856314 ?auto_856315 ?auto_856316 ?auto_856317 ?auto_856318 ?auto_856319 ?auto_856320 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_856359 - BLOCK
      ?auto_856360 - BLOCK
      ?auto_856361 - BLOCK
      ?auto_856362 - BLOCK
      ?auto_856363 - BLOCK
      ?auto_856364 - BLOCK
      ?auto_856365 - BLOCK
      ?auto_856366 - BLOCK
      ?auto_856367 - BLOCK
      ?auto_856368 - BLOCK
      ?auto_856369 - BLOCK
      ?auto_856370 - BLOCK
    )
    :vars
    (
      ?auto_856371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856370 ?auto_856371 ) ( ON-TABLE ?auto_856359 ) ( ON ?auto_856360 ?auto_856359 ) ( ON ?auto_856361 ?auto_856360 ) ( ON ?auto_856362 ?auto_856361 ) ( ON ?auto_856363 ?auto_856362 ) ( ON ?auto_856364 ?auto_856363 ) ( ON ?auto_856365 ?auto_856364 ) ( ON ?auto_856366 ?auto_856365 ) ( not ( = ?auto_856359 ?auto_856360 ) ) ( not ( = ?auto_856359 ?auto_856361 ) ) ( not ( = ?auto_856359 ?auto_856362 ) ) ( not ( = ?auto_856359 ?auto_856363 ) ) ( not ( = ?auto_856359 ?auto_856364 ) ) ( not ( = ?auto_856359 ?auto_856365 ) ) ( not ( = ?auto_856359 ?auto_856366 ) ) ( not ( = ?auto_856359 ?auto_856367 ) ) ( not ( = ?auto_856359 ?auto_856368 ) ) ( not ( = ?auto_856359 ?auto_856369 ) ) ( not ( = ?auto_856359 ?auto_856370 ) ) ( not ( = ?auto_856359 ?auto_856371 ) ) ( not ( = ?auto_856360 ?auto_856361 ) ) ( not ( = ?auto_856360 ?auto_856362 ) ) ( not ( = ?auto_856360 ?auto_856363 ) ) ( not ( = ?auto_856360 ?auto_856364 ) ) ( not ( = ?auto_856360 ?auto_856365 ) ) ( not ( = ?auto_856360 ?auto_856366 ) ) ( not ( = ?auto_856360 ?auto_856367 ) ) ( not ( = ?auto_856360 ?auto_856368 ) ) ( not ( = ?auto_856360 ?auto_856369 ) ) ( not ( = ?auto_856360 ?auto_856370 ) ) ( not ( = ?auto_856360 ?auto_856371 ) ) ( not ( = ?auto_856361 ?auto_856362 ) ) ( not ( = ?auto_856361 ?auto_856363 ) ) ( not ( = ?auto_856361 ?auto_856364 ) ) ( not ( = ?auto_856361 ?auto_856365 ) ) ( not ( = ?auto_856361 ?auto_856366 ) ) ( not ( = ?auto_856361 ?auto_856367 ) ) ( not ( = ?auto_856361 ?auto_856368 ) ) ( not ( = ?auto_856361 ?auto_856369 ) ) ( not ( = ?auto_856361 ?auto_856370 ) ) ( not ( = ?auto_856361 ?auto_856371 ) ) ( not ( = ?auto_856362 ?auto_856363 ) ) ( not ( = ?auto_856362 ?auto_856364 ) ) ( not ( = ?auto_856362 ?auto_856365 ) ) ( not ( = ?auto_856362 ?auto_856366 ) ) ( not ( = ?auto_856362 ?auto_856367 ) ) ( not ( = ?auto_856362 ?auto_856368 ) ) ( not ( = ?auto_856362 ?auto_856369 ) ) ( not ( = ?auto_856362 ?auto_856370 ) ) ( not ( = ?auto_856362 ?auto_856371 ) ) ( not ( = ?auto_856363 ?auto_856364 ) ) ( not ( = ?auto_856363 ?auto_856365 ) ) ( not ( = ?auto_856363 ?auto_856366 ) ) ( not ( = ?auto_856363 ?auto_856367 ) ) ( not ( = ?auto_856363 ?auto_856368 ) ) ( not ( = ?auto_856363 ?auto_856369 ) ) ( not ( = ?auto_856363 ?auto_856370 ) ) ( not ( = ?auto_856363 ?auto_856371 ) ) ( not ( = ?auto_856364 ?auto_856365 ) ) ( not ( = ?auto_856364 ?auto_856366 ) ) ( not ( = ?auto_856364 ?auto_856367 ) ) ( not ( = ?auto_856364 ?auto_856368 ) ) ( not ( = ?auto_856364 ?auto_856369 ) ) ( not ( = ?auto_856364 ?auto_856370 ) ) ( not ( = ?auto_856364 ?auto_856371 ) ) ( not ( = ?auto_856365 ?auto_856366 ) ) ( not ( = ?auto_856365 ?auto_856367 ) ) ( not ( = ?auto_856365 ?auto_856368 ) ) ( not ( = ?auto_856365 ?auto_856369 ) ) ( not ( = ?auto_856365 ?auto_856370 ) ) ( not ( = ?auto_856365 ?auto_856371 ) ) ( not ( = ?auto_856366 ?auto_856367 ) ) ( not ( = ?auto_856366 ?auto_856368 ) ) ( not ( = ?auto_856366 ?auto_856369 ) ) ( not ( = ?auto_856366 ?auto_856370 ) ) ( not ( = ?auto_856366 ?auto_856371 ) ) ( not ( = ?auto_856367 ?auto_856368 ) ) ( not ( = ?auto_856367 ?auto_856369 ) ) ( not ( = ?auto_856367 ?auto_856370 ) ) ( not ( = ?auto_856367 ?auto_856371 ) ) ( not ( = ?auto_856368 ?auto_856369 ) ) ( not ( = ?auto_856368 ?auto_856370 ) ) ( not ( = ?auto_856368 ?auto_856371 ) ) ( not ( = ?auto_856369 ?auto_856370 ) ) ( not ( = ?auto_856369 ?auto_856371 ) ) ( not ( = ?auto_856370 ?auto_856371 ) ) ( ON ?auto_856369 ?auto_856370 ) ( ON ?auto_856368 ?auto_856369 ) ( CLEAR ?auto_856366 ) ( ON ?auto_856367 ?auto_856368 ) ( CLEAR ?auto_856367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_856359 ?auto_856360 ?auto_856361 ?auto_856362 ?auto_856363 ?auto_856364 ?auto_856365 ?auto_856366 ?auto_856367 )
      ( MAKE-12PILE ?auto_856359 ?auto_856360 ?auto_856361 ?auto_856362 ?auto_856363 ?auto_856364 ?auto_856365 ?auto_856366 ?auto_856367 ?auto_856368 ?auto_856369 ?auto_856370 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_856409 - BLOCK
      ?auto_856410 - BLOCK
      ?auto_856411 - BLOCK
      ?auto_856412 - BLOCK
      ?auto_856413 - BLOCK
      ?auto_856414 - BLOCK
      ?auto_856415 - BLOCK
      ?auto_856416 - BLOCK
      ?auto_856417 - BLOCK
      ?auto_856418 - BLOCK
      ?auto_856419 - BLOCK
      ?auto_856420 - BLOCK
    )
    :vars
    (
      ?auto_856421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856420 ?auto_856421 ) ( ON-TABLE ?auto_856409 ) ( ON ?auto_856410 ?auto_856409 ) ( ON ?auto_856411 ?auto_856410 ) ( ON ?auto_856412 ?auto_856411 ) ( ON ?auto_856413 ?auto_856412 ) ( ON ?auto_856414 ?auto_856413 ) ( ON ?auto_856415 ?auto_856414 ) ( not ( = ?auto_856409 ?auto_856410 ) ) ( not ( = ?auto_856409 ?auto_856411 ) ) ( not ( = ?auto_856409 ?auto_856412 ) ) ( not ( = ?auto_856409 ?auto_856413 ) ) ( not ( = ?auto_856409 ?auto_856414 ) ) ( not ( = ?auto_856409 ?auto_856415 ) ) ( not ( = ?auto_856409 ?auto_856416 ) ) ( not ( = ?auto_856409 ?auto_856417 ) ) ( not ( = ?auto_856409 ?auto_856418 ) ) ( not ( = ?auto_856409 ?auto_856419 ) ) ( not ( = ?auto_856409 ?auto_856420 ) ) ( not ( = ?auto_856409 ?auto_856421 ) ) ( not ( = ?auto_856410 ?auto_856411 ) ) ( not ( = ?auto_856410 ?auto_856412 ) ) ( not ( = ?auto_856410 ?auto_856413 ) ) ( not ( = ?auto_856410 ?auto_856414 ) ) ( not ( = ?auto_856410 ?auto_856415 ) ) ( not ( = ?auto_856410 ?auto_856416 ) ) ( not ( = ?auto_856410 ?auto_856417 ) ) ( not ( = ?auto_856410 ?auto_856418 ) ) ( not ( = ?auto_856410 ?auto_856419 ) ) ( not ( = ?auto_856410 ?auto_856420 ) ) ( not ( = ?auto_856410 ?auto_856421 ) ) ( not ( = ?auto_856411 ?auto_856412 ) ) ( not ( = ?auto_856411 ?auto_856413 ) ) ( not ( = ?auto_856411 ?auto_856414 ) ) ( not ( = ?auto_856411 ?auto_856415 ) ) ( not ( = ?auto_856411 ?auto_856416 ) ) ( not ( = ?auto_856411 ?auto_856417 ) ) ( not ( = ?auto_856411 ?auto_856418 ) ) ( not ( = ?auto_856411 ?auto_856419 ) ) ( not ( = ?auto_856411 ?auto_856420 ) ) ( not ( = ?auto_856411 ?auto_856421 ) ) ( not ( = ?auto_856412 ?auto_856413 ) ) ( not ( = ?auto_856412 ?auto_856414 ) ) ( not ( = ?auto_856412 ?auto_856415 ) ) ( not ( = ?auto_856412 ?auto_856416 ) ) ( not ( = ?auto_856412 ?auto_856417 ) ) ( not ( = ?auto_856412 ?auto_856418 ) ) ( not ( = ?auto_856412 ?auto_856419 ) ) ( not ( = ?auto_856412 ?auto_856420 ) ) ( not ( = ?auto_856412 ?auto_856421 ) ) ( not ( = ?auto_856413 ?auto_856414 ) ) ( not ( = ?auto_856413 ?auto_856415 ) ) ( not ( = ?auto_856413 ?auto_856416 ) ) ( not ( = ?auto_856413 ?auto_856417 ) ) ( not ( = ?auto_856413 ?auto_856418 ) ) ( not ( = ?auto_856413 ?auto_856419 ) ) ( not ( = ?auto_856413 ?auto_856420 ) ) ( not ( = ?auto_856413 ?auto_856421 ) ) ( not ( = ?auto_856414 ?auto_856415 ) ) ( not ( = ?auto_856414 ?auto_856416 ) ) ( not ( = ?auto_856414 ?auto_856417 ) ) ( not ( = ?auto_856414 ?auto_856418 ) ) ( not ( = ?auto_856414 ?auto_856419 ) ) ( not ( = ?auto_856414 ?auto_856420 ) ) ( not ( = ?auto_856414 ?auto_856421 ) ) ( not ( = ?auto_856415 ?auto_856416 ) ) ( not ( = ?auto_856415 ?auto_856417 ) ) ( not ( = ?auto_856415 ?auto_856418 ) ) ( not ( = ?auto_856415 ?auto_856419 ) ) ( not ( = ?auto_856415 ?auto_856420 ) ) ( not ( = ?auto_856415 ?auto_856421 ) ) ( not ( = ?auto_856416 ?auto_856417 ) ) ( not ( = ?auto_856416 ?auto_856418 ) ) ( not ( = ?auto_856416 ?auto_856419 ) ) ( not ( = ?auto_856416 ?auto_856420 ) ) ( not ( = ?auto_856416 ?auto_856421 ) ) ( not ( = ?auto_856417 ?auto_856418 ) ) ( not ( = ?auto_856417 ?auto_856419 ) ) ( not ( = ?auto_856417 ?auto_856420 ) ) ( not ( = ?auto_856417 ?auto_856421 ) ) ( not ( = ?auto_856418 ?auto_856419 ) ) ( not ( = ?auto_856418 ?auto_856420 ) ) ( not ( = ?auto_856418 ?auto_856421 ) ) ( not ( = ?auto_856419 ?auto_856420 ) ) ( not ( = ?auto_856419 ?auto_856421 ) ) ( not ( = ?auto_856420 ?auto_856421 ) ) ( ON ?auto_856419 ?auto_856420 ) ( ON ?auto_856418 ?auto_856419 ) ( ON ?auto_856417 ?auto_856418 ) ( CLEAR ?auto_856415 ) ( ON ?auto_856416 ?auto_856417 ) ( CLEAR ?auto_856416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_856409 ?auto_856410 ?auto_856411 ?auto_856412 ?auto_856413 ?auto_856414 ?auto_856415 ?auto_856416 )
      ( MAKE-12PILE ?auto_856409 ?auto_856410 ?auto_856411 ?auto_856412 ?auto_856413 ?auto_856414 ?auto_856415 ?auto_856416 ?auto_856417 ?auto_856418 ?auto_856419 ?auto_856420 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_856459 - BLOCK
      ?auto_856460 - BLOCK
      ?auto_856461 - BLOCK
      ?auto_856462 - BLOCK
      ?auto_856463 - BLOCK
      ?auto_856464 - BLOCK
      ?auto_856465 - BLOCK
      ?auto_856466 - BLOCK
      ?auto_856467 - BLOCK
      ?auto_856468 - BLOCK
      ?auto_856469 - BLOCK
      ?auto_856470 - BLOCK
    )
    :vars
    (
      ?auto_856471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856470 ?auto_856471 ) ( ON-TABLE ?auto_856459 ) ( ON ?auto_856460 ?auto_856459 ) ( ON ?auto_856461 ?auto_856460 ) ( ON ?auto_856462 ?auto_856461 ) ( ON ?auto_856463 ?auto_856462 ) ( ON ?auto_856464 ?auto_856463 ) ( not ( = ?auto_856459 ?auto_856460 ) ) ( not ( = ?auto_856459 ?auto_856461 ) ) ( not ( = ?auto_856459 ?auto_856462 ) ) ( not ( = ?auto_856459 ?auto_856463 ) ) ( not ( = ?auto_856459 ?auto_856464 ) ) ( not ( = ?auto_856459 ?auto_856465 ) ) ( not ( = ?auto_856459 ?auto_856466 ) ) ( not ( = ?auto_856459 ?auto_856467 ) ) ( not ( = ?auto_856459 ?auto_856468 ) ) ( not ( = ?auto_856459 ?auto_856469 ) ) ( not ( = ?auto_856459 ?auto_856470 ) ) ( not ( = ?auto_856459 ?auto_856471 ) ) ( not ( = ?auto_856460 ?auto_856461 ) ) ( not ( = ?auto_856460 ?auto_856462 ) ) ( not ( = ?auto_856460 ?auto_856463 ) ) ( not ( = ?auto_856460 ?auto_856464 ) ) ( not ( = ?auto_856460 ?auto_856465 ) ) ( not ( = ?auto_856460 ?auto_856466 ) ) ( not ( = ?auto_856460 ?auto_856467 ) ) ( not ( = ?auto_856460 ?auto_856468 ) ) ( not ( = ?auto_856460 ?auto_856469 ) ) ( not ( = ?auto_856460 ?auto_856470 ) ) ( not ( = ?auto_856460 ?auto_856471 ) ) ( not ( = ?auto_856461 ?auto_856462 ) ) ( not ( = ?auto_856461 ?auto_856463 ) ) ( not ( = ?auto_856461 ?auto_856464 ) ) ( not ( = ?auto_856461 ?auto_856465 ) ) ( not ( = ?auto_856461 ?auto_856466 ) ) ( not ( = ?auto_856461 ?auto_856467 ) ) ( not ( = ?auto_856461 ?auto_856468 ) ) ( not ( = ?auto_856461 ?auto_856469 ) ) ( not ( = ?auto_856461 ?auto_856470 ) ) ( not ( = ?auto_856461 ?auto_856471 ) ) ( not ( = ?auto_856462 ?auto_856463 ) ) ( not ( = ?auto_856462 ?auto_856464 ) ) ( not ( = ?auto_856462 ?auto_856465 ) ) ( not ( = ?auto_856462 ?auto_856466 ) ) ( not ( = ?auto_856462 ?auto_856467 ) ) ( not ( = ?auto_856462 ?auto_856468 ) ) ( not ( = ?auto_856462 ?auto_856469 ) ) ( not ( = ?auto_856462 ?auto_856470 ) ) ( not ( = ?auto_856462 ?auto_856471 ) ) ( not ( = ?auto_856463 ?auto_856464 ) ) ( not ( = ?auto_856463 ?auto_856465 ) ) ( not ( = ?auto_856463 ?auto_856466 ) ) ( not ( = ?auto_856463 ?auto_856467 ) ) ( not ( = ?auto_856463 ?auto_856468 ) ) ( not ( = ?auto_856463 ?auto_856469 ) ) ( not ( = ?auto_856463 ?auto_856470 ) ) ( not ( = ?auto_856463 ?auto_856471 ) ) ( not ( = ?auto_856464 ?auto_856465 ) ) ( not ( = ?auto_856464 ?auto_856466 ) ) ( not ( = ?auto_856464 ?auto_856467 ) ) ( not ( = ?auto_856464 ?auto_856468 ) ) ( not ( = ?auto_856464 ?auto_856469 ) ) ( not ( = ?auto_856464 ?auto_856470 ) ) ( not ( = ?auto_856464 ?auto_856471 ) ) ( not ( = ?auto_856465 ?auto_856466 ) ) ( not ( = ?auto_856465 ?auto_856467 ) ) ( not ( = ?auto_856465 ?auto_856468 ) ) ( not ( = ?auto_856465 ?auto_856469 ) ) ( not ( = ?auto_856465 ?auto_856470 ) ) ( not ( = ?auto_856465 ?auto_856471 ) ) ( not ( = ?auto_856466 ?auto_856467 ) ) ( not ( = ?auto_856466 ?auto_856468 ) ) ( not ( = ?auto_856466 ?auto_856469 ) ) ( not ( = ?auto_856466 ?auto_856470 ) ) ( not ( = ?auto_856466 ?auto_856471 ) ) ( not ( = ?auto_856467 ?auto_856468 ) ) ( not ( = ?auto_856467 ?auto_856469 ) ) ( not ( = ?auto_856467 ?auto_856470 ) ) ( not ( = ?auto_856467 ?auto_856471 ) ) ( not ( = ?auto_856468 ?auto_856469 ) ) ( not ( = ?auto_856468 ?auto_856470 ) ) ( not ( = ?auto_856468 ?auto_856471 ) ) ( not ( = ?auto_856469 ?auto_856470 ) ) ( not ( = ?auto_856469 ?auto_856471 ) ) ( not ( = ?auto_856470 ?auto_856471 ) ) ( ON ?auto_856469 ?auto_856470 ) ( ON ?auto_856468 ?auto_856469 ) ( ON ?auto_856467 ?auto_856468 ) ( ON ?auto_856466 ?auto_856467 ) ( CLEAR ?auto_856464 ) ( ON ?auto_856465 ?auto_856466 ) ( CLEAR ?auto_856465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_856459 ?auto_856460 ?auto_856461 ?auto_856462 ?auto_856463 ?auto_856464 ?auto_856465 )
      ( MAKE-12PILE ?auto_856459 ?auto_856460 ?auto_856461 ?auto_856462 ?auto_856463 ?auto_856464 ?auto_856465 ?auto_856466 ?auto_856467 ?auto_856468 ?auto_856469 ?auto_856470 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_856509 - BLOCK
      ?auto_856510 - BLOCK
      ?auto_856511 - BLOCK
      ?auto_856512 - BLOCK
      ?auto_856513 - BLOCK
      ?auto_856514 - BLOCK
      ?auto_856515 - BLOCK
      ?auto_856516 - BLOCK
      ?auto_856517 - BLOCK
      ?auto_856518 - BLOCK
      ?auto_856519 - BLOCK
      ?auto_856520 - BLOCK
    )
    :vars
    (
      ?auto_856521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856520 ?auto_856521 ) ( ON-TABLE ?auto_856509 ) ( ON ?auto_856510 ?auto_856509 ) ( ON ?auto_856511 ?auto_856510 ) ( ON ?auto_856512 ?auto_856511 ) ( ON ?auto_856513 ?auto_856512 ) ( not ( = ?auto_856509 ?auto_856510 ) ) ( not ( = ?auto_856509 ?auto_856511 ) ) ( not ( = ?auto_856509 ?auto_856512 ) ) ( not ( = ?auto_856509 ?auto_856513 ) ) ( not ( = ?auto_856509 ?auto_856514 ) ) ( not ( = ?auto_856509 ?auto_856515 ) ) ( not ( = ?auto_856509 ?auto_856516 ) ) ( not ( = ?auto_856509 ?auto_856517 ) ) ( not ( = ?auto_856509 ?auto_856518 ) ) ( not ( = ?auto_856509 ?auto_856519 ) ) ( not ( = ?auto_856509 ?auto_856520 ) ) ( not ( = ?auto_856509 ?auto_856521 ) ) ( not ( = ?auto_856510 ?auto_856511 ) ) ( not ( = ?auto_856510 ?auto_856512 ) ) ( not ( = ?auto_856510 ?auto_856513 ) ) ( not ( = ?auto_856510 ?auto_856514 ) ) ( not ( = ?auto_856510 ?auto_856515 ) ) ( not ( = ?auto_856510 ?auto_856516 ) ) ( not ( = ?auto_856510 ?auto_856517 ) ) ( not ( = ?auto_856510 ?auto_856518 ) ) ( not ( = ?auto_856510 ?auto_856519 ) ) ( not ( = ?auto_856510 ?auto_856520 ) ) ( not ( = ?auto_856510 ?auto_856521 ) ) ( not ( = ?auto_856511 ?auto_856512 ) ) ( not ( = ?auto_856511 ?auto_856513 ) ) ( not ( = ?auto_856511 ?auto_856514 ) ) ( not ( = ?auto_856511 ?auto_856515 ) ) ( not ( = ?auto_856511 ?auto_856516 ) ) ( not ( = ?auto_856511 ?auto_856517 ) ) ( not ( = ?auto_856511 ?auto_856518 ) ) ( not ( = ?auto_856511 ?auto_856519 ) ) ( not ( = ?auto_856511 ?auto_856520 ) ) ( not ( = ?auto_856511 ?auto_856521 ) ) ( not ( = ?auto_856512 ?auto_856513 ) ) ( not ( = ?auto_856512 ?auto_856514 ) ) ( not ( = ?auto_856512 ?auto_856515 ) ) ( not ( = ?auto_856512 ?auto_856516 ) ) ( not ( = ?auto_856512 ?auto_856517 ) ) ( not ( = ?auto_856512 ?auto_856518 ) ) ( not ( = ?auto_856512 ?auto_856519 ) ) ( not ( = ?auto_856512 ?auto_856520 ) ) ( not ( = ?auto_856512 ?auto_856521 ) ) ( not ( = ?auto_856513 ?auto_856514 ) ) ( not ( = ?auto_856513 ?auto_856515 ) ) ( not ( = ?auto_856513 ?auto_856516 ) ) ( not ( = ?auto_856513 ?auto_856517 ) ) ( not ( = ?auto_856513 ?auto_856518 ) ) ( not ( = ?auto_856513 ?auto_856519 ) ) ( not ( = ?auto_856513 ?auto_856520 ) ) ( not ( = ?auto_856513 ?auto_856521 ) ) ( not ( = ?auto_856514 ?auto_856515 ) ) ( not ( = ?auto_856514 ?auto_856516 ) ) ( not ( = ?auto_856514 ?auto_856517 ) ) ( not ( = ?auto_856514 ?auto_856518 ) ) ( not ( = ?auto_856514 ?auto_856519 ) ) ( not ( = ?auto_856514 ?auto_856520 ) ) ( not ( = ?auto_856514 ?auto_856521 ) ) ( not ( = ?auto_856515 ?auto_856516 ) ) ( not ( = ?auto_856515 ?auto_856517 ) ) ( not ( = ?auto_856515 ?auto_856518 ) ) ( not ( = ?auto_856515 ?auto_856519 ) ) ( not ( = ?auto_856515 ?auto_856520 ) ) ( not ( = ?auto_856515 ?auto_856521 ) ) ( not ( = ?auto_856516 ?auto_856517 ) ) ( not ( = ?auto_856516 ?auto_856518 ) ) ( not ( = ?auto_856516 ?auto_856519 ) ) ( not ( = ?auto_856516 ?auto_856520 ) ) ( not ( = ?auto_856516 ?auto_856521 ) ) ( not ( = ?auto_856517 ?auto_856518 ) ) ( not ( = ?auto_856517 ?auto_856519 ) ) ( not ( = ?auto_856517 ?auto_856520 ) ) ( not ( = ?auto_856517 ?auto_856521 ) ) ( not ( = ?auto_856518 ?auto_856519 ) ) ( not ( = ?auto_856518 ?auto_856520 ) ) ( not ( = ?auto_856518 ?auto_856521 ) ) ( not ( = ?auto_856519 ?auto_856520 ) ) ( not ( = ?auto_856519 ?auto_856521 ) ) ( not ( = ?auto_856520 ?auto_856521 ) ) ( ON ?auto_856519 ?auto_856520 ) ( ON ?auto_856518 ?auto_856519 ) ( ON ?auto_856517 ?auto_856518 ) ( ON ?auto_856516 ?auto_856517 ) ( ON ?auto_856515 ?auto_856516 ) ( CLEAR ?auto_856513 ) ( ON ?auto_856514 ?auto_856515 ) ( CLEAR ?auto_856514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_856509 ?auto_856510 ?auto_856511 ?auto_856512 ?auto_856513 ?auto_856514 )
      ( MAKE-12PILE ?auto_856509 ?auto_856510 ?auto_856511 ?auto_856512 ?auto_856513 ?auto_856514 ?auto_856515 ?auto_856516 ?auto_856517 ?auto_856518 ?auto_856519 ?auto_856520 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_856559 - BLOCK
      ?auto_856560 - BLOCK
      ?auto_856561 - BLOCK
      ?auto_856562 - BLOCK
      ?auto_856563 - BLOCK
      ?auto_856564 - BLOCK
      ?auto_856565 - BLOCK
      ?auto_856566 - BLOCK
      ?auto_856567 - BLOCK
      ?auto_856568 - BLOCK
      ?auto_856569 - BLOCK
      ?auto_856570 - BLOCK
    )
    :vars
    (
      ?auto_856571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856570 ?auto_856571 ) ( ON-TABLE ?auto_856559 ) ( ON ?auto_856560 ?auto_856559 ) ( ON ?auto_856561 ?auto_856560 ) ( ON ?auto_856562 ?auto_856561 ) ( not ( = ?auto_856559 ?auto_856560 ) ) ( not ( = ?auto_856559 ?auto_856561 ) ) ( not ( = ?auto_856559 ?auto_856562 ) ) ( not ( = ?auto_856559 ?auto_856563 ) ) ( not ( = ?auto_856559 ?auto_856564 ) ) ( not ( = ?auto_856559 ?auto_856565 ) ) ( not ( = ?auto_856559 ?auto_856566 ) ) ( not ( = ?auto_856559 ?auto_856567 ) ) ( not ( = ?auto_856559 ?auto_856568 ) ) ( not ( = ?auto_856559 ?auto_856569 ) ) ( not ( = ?auto_856559 ?auto_856570 ) ) ( not ( = ?auto_856559 ?auto_856571 ) ) ( not ( = ?auto_856560 ?auto_856561 ) ) ( not ( = ?auto_856560 ?auto_856562 ) ) ( not ( = ?auto_856560 ?auto_856563 ) ) ( not ( = ?auto_856560 ?auto_856564 ) ) ( not ( = ?auto_856560 ?auto_856565 ) ) ( not ( = ?auto_856560 ?auto_856566 ) ) ( not ( = ?auto_856560 ?auto_856567 ) ) ( not ( = ?auto_856560 ?auto_856568 ) ) ( not ( = ?auto_856560 ?auto_856569 ) ) ( not ( = ?auto_856560 ?auto_856570 ) ) ( not ( = ?auto_856560 ?auto_856571 ) ) ( not ( = ?auto_856561 ?auto_856562 ) ) ( not ( = ?auto_856561 ?auto_856563 ) ) ( not ( = ?auto_856561 ?auto_856564 ) ) ( not ( = ?auto_856561 ?auto_856565 ) ) ( not ( = ?auto_856561 ?auto_856566 ) ) ( not ( = ?auto_856561 ?auto_856567 ) ) ( not ( = ?auto_856561 ?auto_856568 ) ) ( not ( = ?auto_856561 ?auto_856569 ) ) ( not ( = ?auto_856561 ?auto_856570 ) ) ( not ( = ?auto_856561 ?auto_856571 ) ) ( not ( = ?auto_856562 ?auto_856563 ) ) ( not ( = ?auto_856562 ?auto_856564 ) ) ( not ( = ?auto_856562 ?auto_856565 ) ) ( not ( = ?auto_856562 ?auto_856566 ) ) ( not ( = ?auto_856562 ?auto_856567 ) ) ( not ( = ?auto_856562 ?auto_856568 ) ) ( not ( = ?auto_856562 ?auto_856569 ) ) ( not ( = ?auto_856562 ?auto_856570 ) ) ( not ( = ?auto_856562 ?auto_856571 ) ) ( not ( = ?auto_856563 ?auto_856564 ) ) ( not ( = ?auto_856563 ?auto_856565 ) ) ( not ( = ?auto_856563 ?auto_856566 ) ) ( not ( = ?auto_856563 ?auto_856567 ) ) ( not ( = ?auto_856563 ?auto_856568 ) ) ( not ( = ?auto_856563 ?auto_856569 ) ) ( not ( = ?auto_856563 ?auto_856570 ) ) ( not ( = ?auto_856563 ?auto_856571 ) ) ( not ( = ?auto_856564 ?auto_856565 ) ) ( not ( = ?auto_856564 ?auto_856566 ) ) ( not ( = ?auto_856564 ?auto_856567 ) ) ( not ( = ?auto_856564 ?auto_856568 ) ) ( not ( = ?auto_856564 ?auto_856569 ) ) ( not ( = ?auto_856564 ?auto_856570 ) ) ( not ( = ?auto_856564 ?auto_856571 ) ) ( not ( = ?auto_856565 ?auto_856566 ) ) ( not ( = ?auto_856565 ?auto_856567 ) ) ( not ( = ?auto_856565 ?auto_856568 ) ) ( not ( = ?auto_856565 ?auto_856569 ) ) ( not ( = ?auto_856565 ?auto_856570 ) ) ( not ( = ?auto_856565 ?auto_856571 ) ) ( not ( = ?auto_856566 ?auto_856567 ) ) ( not ( = ?auto_856566 ?auto_856568 ) ) ( not ( = ?auto_856566 ?auto_856569 ) ) ( not ( = ?auto_856566 ?auto_856570 ) ) ( not ( = ?auto_856566 ?auto_856571 ) ) ( not ( = ?auto_856567 ?auto_856568 ) ) ( not ( = ?auto_856567 ?auto_856569 ) ) ( not ( = ?auto_856567 ?auto_856570 ) ) ( not ( = ?auto_856567 ?auto_856571 ) ) ( not ( = ?auto_856568 ?auto_856569 ) ) ( not ( = ?auto_856568 ?auto_856570 ) ) ( not ( = ?auto_856568 ?auto_856571 ) ) ( not ( = ?auto_856569 ?auto_856570 ) ) ( not ( = ?auto_856569 ?auto_856571 ) ) ( not ( = ?auto_856570 ?auto_856571 ) ) ( ON ?auto_856569 ?auto_856570 ) ( ON ?auto_856568 ?auto_856569 ) ( ON ?auto_856567 ?auto_856568 ) ( ON ?auto_856566 ?auto_856567 ) ( ON ?auto_856565 ?auto_856566 ) ( ON ?auto_856564 ?auto_856565 ) ( CLEAR ?auto_856562 ) ( ON ?auto_856563 ?auto_856564 ) ( CLEAR ?auto_856563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_856559 ?auto_856560 ?auto_856561 ?auto_856562 ?auto_856563 )
      ( MAKE-12PILE ?auto_856559 ?auto_856560 ?auto_856561 ?auto_856562 ?auto_856563 ?auto_856564 ?auto_856565 ?auto_856566 ?auto_856567 ?auto_856568 ?auto_856569 ?auto_856570 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_856609 - BLOCK
      ?auto_856610 - BLOCK
      ?auto_856611 - BLOCK
      ?auto_856612 - BLOCK
      ?auto_856613 - BLOCK
      ?auto_856614 - BLOCK
      ?auto_856615 - BLOCK
      ?auto_856616 - BLOCK
      ?auto_856617 - BLOCK
      ?auto_856618 - BLOCK
      ?auto_856619 - BLOCK
      ?auto_856620 - BLOCK
    )
    :vars
    (
      ?auto_856621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856620 ?auto_856621 ) ( ON-TABLE ?auto_856609 ) ( ON ?auto_856610 ?auto_856609 ) ( ON ?auto_856611 ?auto_856610 ) ( not ( = ?auto_856609 ?auto_856610 ) ) ( not ( = ?auto_856609 ?auto_856611 ) ) ( not ( = ?auto_856609 ?auto_856612 ) ) ( not ( = ?auto_856609 ?auto_856613 ) ) ( not ( = ?auto_856609 ?auto_856614 ) ) ( not ( = ?auto_856609 ?auto_856615 ) ) ( not ( = ?auto_856609 ?auto_856616 ) ) ( not ( = ?auto_856609 ?auto_856617 ) ) ( not ( = ?auto_856609 ?auto_856618 ) ) ( not ( = ?auto_856609 ?auto_856619 ) ) ( not ( = ?auto_856609 ?auto_856620 ) ) ( not ( = ?auto_856609 ?auto_856621 ) ) ( not ( = ?auto_856610 ?auto_856611 ) ) ( not ( = ?auto_856610 ?auto_856612 ) ) ( not ( = ?auto_856610 ?auto_856613 ) ) ( not ( = ?auto_856610 ?auto_856614 ) ) ( not ( = ?auto_856610 ?auto_856615 ) ) ( not ( = ?auto_856610 ?auto_856616 ) ) ( not ( = ?auto_856610 ?auto_856617 ) ) ( not ( = ?auto_856610 ?auto_856618 ) ) ( not ( = ?auto_856610 ?auto_856619 ) ) ( not ( = ?auto_856610 ?auto_856620 ) ) ( not ( = ?auto_856610 ?auto_856621 ) ) ( not ( = ?auto_856611 ?auto_856612 ) ) ( not ( = ?auto_856611 ?auto_856613 ) ) ( not ( = ?auto_856611 ?auto_856614 ) ) ( not ( = ?auto_856611 ?auto_856615 ) ) ( not ( = ?auto_856611 ?auto_856616 ) ) ( not ( = ?auto_856611 ?auto_856617 ) ) ( not ( = ?auto_856611 ?auto_856618 ) ) ( not ( = ?auto_856611 ?auto_856619 ) ) ( not ( = ?auto_856611 ?auto_856620 ) ) ( not ( = ?auto_856611 ?auto_856621 ) ) ( not ( = ?auto_856612 ?auto_856613 ) ) ( not ( = ?auto_856612 ?auto_856614 ) ) ( not ( = ?auto_856612 ?auto_856615 ) ) ( not ( = ?auto_856612 ?auto_856616 ) ) ( not ( = ?auto_856612 ?auto_856617 ) ) ( not ( = ?auto_856612 ?auto_856618 ) ) ( not ( = ?auto_856612 ?auto_856619 ) ) ( not ( = ?auto_856612 ?auto_856620 ) ) ( not ( = ?auto_856612 ?auto_856621 ) ) ( not ( = ?auto_856613 ?auto_856614 ) ) ( not ( = ?auto_856613 ?auto_856615 ) ) ( not ( = ?auto_856613 ?auto_856616 ) ) ( not ( = ?auto_856613 ?auto_856617 ) ) ( not ( = ?auto_856613 ?auto_856618 ) ) ( not ( = ?auto_856613 ?auto_856619 ) ) ( not ( = ?auto_856613 ?auto_856620 ) ) ( not ( = ?auto_856613 ?auto_856621 ) ) ( not ( = ?auto_856614 ?auto_856615 ) ) ( not ( = ?auto_856614 ?auto_856616 ) ) ( not ( = ?auto_856614 ?auto_856617 ) ) ( not ( = ?auto_856614 ?auto_856618 ) ) ( not ( = ?auto_856614 ?auto_856619 ) ) ( not ( = ?auto_856614 ?auto_856620 ) ) ( not ( = ?auto_856614 ?auto_856621 ) ) ( not ( = ?auto_856615 ?auto_856616 ) ) ( not ( = ?auto_856615 ?auto_856617 ) ) ( not ( = ?auto_856615 ?auto_856618 ) ) ( not ( = ?auto_856615 ?auto_856619 ) ) ( not ( = ?auto_856615 ?auto_856620 ) ) ( not ( = ?auto_856615 ?auto_856621 ) ) ( not ( = ?auto_856616 ?auto_856617 ) ) ( not ( = ?auto_856616 ?auto_856618 ) ) ( not ( = ?auto_856616 ?auto_856619 ) ) ( not ( = ?auto_856616 ?auto_856620 ) ) ( not ( = ?auto_856616 ?auto_856621 ) ) ( not ( = ?auto_856617 ?auto_856618 ) ) ( not ( = ?auto_856617 ?auto_856619 ) ) ( not ( = ?auto_856617 ?auto_856620 ) ) ( not ( = ?auto_856617 ?auto_856621 ) ) ( not ( = ?auto_856618 ?auto_856619 ) ) ( not ( = ?auto_856618 ?auto_856620 ) ) ( not ( = ?auto_856618 ?auto_856621 ) ) ( not ( = ?auto_856619 ?auto_856620 ) ) ( not ( = ?auto_856619 ?auto_856621 ) ) ( not ( = ?auto_856620 ?auto_856621 ) ) ( ON ?auto_856619 ?auto_856620 ) ( ON ?auto_856618 ?auto_856619 ) ( ON ?auto_856617 ?auto_856618 ) ( ON ?auto_856616 ?auto_856617 ) ( ON ?auto_856615 ?auto_856616 ) ( ON ?auto_856614 ?auto_856615 ) ( ON ?auto_856613 ?auto_856614 ) ( CLEAR ?auto_856611 ) ( ON ?auto_856612 ?auto_856613 ) ( CLEAR ?auto_856612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_856609 ?auto_856610 ?auto_856611 ?auto_856612 )
      ( MAKE-12PILE ?auto_856609 ?auto_856610 ?auto_856611 ?auto_856612 ?auto_856613 ?auto_856614 ?auto_856615 ?auto_856616 ?auto_856617 ?auto_856618 ?auto_856619 ?auto_856620 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_856659 - BLOCK
      ?auto_856660 - BLOCK
      ?auto_856661 - BLOCK
      ?auto_856662 - BLOCK
      ?auto_856663 - BLOCK
      ?auto_856664 - BLOCK
      ?auto_856665 - BLOCK
      ?auto_856666 - BLOCK
      ?auto_856667 - BLOCK
      ?auto_856668 - BLOCK
      ?auto_856669 - BLOCK
      ?auto_856670 - BLOCK
    )
    :vars
    (
      ?auto_856671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856670 ?auto_856671 ) ( ON-TABLE ?auto_856659 ) ( ON ?auto_856660 ?auto_856659 ) ( not ( = ?auto_856659 ?auto_856660 ) ) ( not ( = ?auto_856659 ?auto_856661 ) ) ( not ( = ?auto_856659 ?auto_856662 ) ) ( not ( = ?auto_856659 ?auto_856663 ) ) ( not ( = ?auto_856659 ?auto_856664 ) ) ( not ( = ?auto_856659 ?auto_856665 ) ) ( not ( = ?auto_856659 ?auto_856666 ) ) ( not ( = ?auto_856659 ?auto_856667 ) ) ( not ( = ?auto_856659 ?auto_856668 ) ) ( not ( = ?auto_856659 ?auto_856669 ) ) ( not ( = ?auto_856659 ?auto_856670 ) ) ( not ( = ?auto_856659 ?auto_856671 ) ) ( not ( = ?auto_856660 ?auto_856661 ) ) ( not ( = ?auto_856660 ?auto_856662 ) ) ( not ( = ?auto_856660 ?auto_856663 ) ) ( not ( = ?auto_856660 ?auto_856664 ) ) ( not ( = ?auto_856660 ?auto_856665 ) ) ( not ( = ?auto_856660 ?auto_856666 ) ) ( not ( = ?auto_856660 ?auto_856667 ) ) ( not ( = ?auto_856660 ?auto_856668 ) ) ( not ( = ?auto_856660 ?auto_856669 ) ) ( not ( = ?auto_856660 ?auto_856670 ) ) ( not ( = ?auto_856660 ?auto_856671 ) ) ( not ( = ?auto_856661 ?auto_856662 ) ) ( not ( = ?auto_856661 ?auto_856663 ) ) ( not ( = ?auto_856661 ?auto_856664 ) ) ( not ( = ?auto_856661 ?auto_856665 ) ) ( not ( = ?auto_856661 ?auto_856666 ) ) ( not ( = ?auto_856661 ?auto_856667 ) ) ( not ( = ?auto_856661 ?auto_856668 ) ) ( not ( = ?auto_856661 ?auto_856669 ) ) ( not ( = ?auto_856661 ?auto_856670 ) ) ( not ( = ?auto_856661 ?auto_856671 ) ) ( not ( = ?auto_856662 ?auto_856663 ) ) ( not ( = ?auto_856662 ?auto_856664 ) ) ( not ( = ?auto_856662 ?auto_856665 ) ) ( not ( = ?auto_856662 ?auto_856666 ) ) ( not ( = ?auto_856662 ?auto_856667 ) ) ( not ( = ?auto_856662 ?auto_856668 ) ) ( not ( = ?auto_856662 ?auto_856669 ) ) ( not ( = ?auto_856662 ?auto_856670 ) ) ( not ( = ?auto_856662 ?auto_856671 ) ) ( not ( = ?auto_856663 ?auto_856664 ) ) ( not ( = ?auto_856663 ?auto_856665 ) ) ( not ( = ?auto_856663 ?auto_856666 ) ) ( not ( = ?auto_856663 ?auto_856667 ) ) ( not ( = ?auto_856663 ?auto_856668 ) ) ( not ( = ?auto_856663 ?auto_856669 ) ) ( not ( = ?auto_856663 ?auto_856670 ) ) ( not ( = ?auto_856663 ?auto_856671 ) ) ( not ( = ?auto_856664 ?auto_856665 ) ) ( not ( = ?auto_856664 ?auto_856666 ) ) ( not ( = ?auto_856664 ?auto_856667 ) ) ( not ( = ?auto_856664 ?auto_856668 ) ) ( not ( = ?auto_856664 ?auto_856669 ) ) ( not ( = ?auto_856664 ?auto_856670 ) ) ( not ( = ?auto_856664 ?auto_856671 ) ) ( not ( = ?auto_856665 ?auto_856666 ) ) ( not ( = ?auto_856665 ?auto_856667 ) ) ( not ( = ?auto_856665 ?auto_856668 ) ) ( not ( = ?auto_856665 ?auto_856669 ) ) ( not ( = ?auto_856665 ?auto_856670 ) ) ( not ( = ?auto_856665 ?auto_856671 ) ) ( not ( = ?auto_856666 ?auto_856667 ) ) ( not ( = ?auto_856666 ?auto_856668 ) ) ( not ( = ?auto_856666 ?auto_856669 ) ) ( not ( = ?auto_856666 ?auto_856670 ) ) ( not ( = ?auto_856666 ?auto_856671 ) ) ( not ( = ?auto_856667 ?auto_856668 ) ) ( not ( = ?auto_856667 ?auto_856669 ) ) ( not ( = ?auto_856667 ?auto_856670 ) ) ( not ( = ?auto_856667 ?auto_856671 ) ) ( not ( = ?auto_856668 ?auto_856669 ) ) ( not ( = ?auto_856668 ?auto_856670 ) ) ( not ( = ?auto_856668 ?auto_856671 ) ) ( not ( = ?auto_856669 ?auto_856670 ) ) ( not ( = ?auto_856669 ?auto_856671 ) ) ( not ( = ?auto_856670 ?auto_856671 ) ) ( ON ?auto_856669 ?auto_856670 ) ( ON ?auto_856668 ?auto_856669 ) ( ON ?auto_856667 ?auto_856668 ) ( ON ?auto_856666 ?auto_856667 ) ( ON ?auto_856665 ?auto_856666 ) ( ON ?auto_856664 ?auto_856665 ) ( ON ?auto_856663 ?auto_856664 ) ( ON ?auto_856662 ?auto_856663 ) ( CLEAR ?auto_856660 ) ( ON ?auto_856661 ?auto_856662 ) ( CLEAR ?auto_856661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_856659 ?auto_856660 ?auto_856661 )
      ( MAKE-12PILE ?auto_856659 ?auto_856660 ?auto_856661 ?auto_856662 ?auto_856663 ?auto_856664 ?auto_856665 ?auto_856666 ?auto_856667 ?auto_856668 ?auto_856669 ?auto_856670 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_856709 - BLOCK
      ?auto_856710 - BLOCK
      ?auto_856711 - BLOCK
      ?auto_856712 - BLOCK
      ?auto_856713 - BLOCK
      ?auto_856714 - BLOCK
      ?auto_856715 - BLOCK
      ?auto_856716 - BLOCK
      ?auto_856717 - BLOCK
      ?auto_856718 - BLOCK
      ?auto_856719 - BLOCK
      ?auto_856720 - BLOCK
    )
    :vars
    (
      ?auto_856721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856720 ?auto_856721 ) ( ON-TABLE ?auto_856709 ) ( not ( = ?auto_856709 ?auto_856710 ) ) ( not ( = ?auto_856709 ?auto_856711 ) ) ( not ( = ?auto_856709 ?auto_856712 ) ) ( not ( = ?auto_856709 ?auto_856713 ) ) ( not ( = ?auto_856709 ?auto_856714 ) ) ( not ( = ?auto_856709 ?auto_856715 ) ) ( not ( = ?auto_856709 ?auto_856716 ) ) ( not ( = ?auto_856709 ?auto_856717 ) ) ( not ( = ?auto_856709 ?auto_856718 ) ) ( not ( = ?auto_856709 ?auto_856719 ) ) ( not ( = ?auto_856709 ?auto_856720 ) ) ( not ( = ?auto_856709 ?auto_856721 ) ) ( not ( = ?auto_856710 ?auto_856711 ) ) ( not ( = ?auto_856710 ?auto_856712 ) ) ( not ( = ?auto_856710 ?auto_856713 ) ) ( not ( = ?auto_856710 ?auto_856714 ) ) ( not ( = ?auto_856710 ?auto_856715 ) ) ( not ( = ?auto_856710 ?auto_856716 ) ) ( not ( = ?auto_856710 ?auto_856717 ) ) ( not ( = ?auto_856710 ?auto_856718 ) ) ( not ( = ?auto_856710 ?auto_856719 ) ) ( not ( = ?auto_856710 ?auto_856720 ) ) ( not ( = ?auto_856710 ?auto_856721 ) ) ( not ( = ?auto_856711 ?auto_856712 ) ) ( not ( = ?auto_856711 ?auto_856713 ) ) ( not ( = ?auto_856711 ?auto_856714 ) ) ( not ( = ?auto_856711 ?auto_856715 ) ) ( not ( = ?auto_856711 ?auto_856716 ) ) ( not ( = ?auto_856711 ?auto_856717 ) ) ( not ( = ?auto_856711 ?auto_856718 ) ) ( not ( = ?auto_856711 ?auto_856719 ) ) ( not ( = ?auto_856711 ?auto_856720 ) ) ( not ( = ?auto_856711 ?auto_856721 ) ) ( not ( = ?auto_856712 ?auto_856713 ) ) ( not ( = ?auto_856712 ?auto_856714 ) ) ( not ( = ?auto_856712 ?auto_856715 ) ) ( not ( = ?auto_856712 ?auto_856716 ) ) ( not ( = ?auto_856712 ?auto_856717 ) ) ( not ( = ?auto_856712 ?auto_856718 ) ) ( not ( = ?auto_856712 ?auto_856719 ) ) ( not ( = ?auto_856712 ?auto_856720 ) ) ( not ( = ?auto_856712 ?auto_856721 ) ) ( not ( = ?auto_856713 ?auto_856714 ) ) ( not ( = ?auto_856713 ?auto_856715 ) ) ( not ( = ?auto_856713 ?auto_856716 ) ) ( not ( = ?auto_856713 ?auto_856717 ) ) ( not ( = ?auto_856713 ?auto_856718 ) ) ( not ( = ?auto_856713 ?auto_856719 ) ) ( not ( = ?auto_856713 ?auto_856720 ) ) ( not ( = ?auto_856713 ?auto_856721 ) ) ( not ( = ?auto_856714 ?auto_856715 ) ) ( not ( = ?auto_856714 ?auto_856716 ) ) ( not ( = ?auto_856714 ?auto_856717 ) ) ( not ( = ?auto_856714 ?auto_856718 ) ) ( not ( = ?auto_856714 ?auto_856719 ) ) ( not ( = ?auto_856714 ?auto_856720 ) ) ( not ( = ?auto_856714 ?auto_856721 ) ) ( not ( = ?auto_856715 ?auto_856716 ) ) ( not ( = ?auto_856715 ?auto_856717 ) ) ( not ( = ?auto_856715 ?auto_856718 ) ) ( not ( = ?auto_856715 ?auto_856719 ) ) ( not ( = ?auto_856715 ?auto_856720 ) ) ( not ( = ?auto_856715 ?auto_856721 ) ) ( not ( = ?auto_856716 ?auto_856717 ) ) ( not ( = ?auto_856716 ?auto_856718 ) ) ( not ( = ?auto_856716 ?auto_856719 ) ) ( not ( = ?auto_856716 ?auto_856720 ) ) ( not ( = ?auto_856716 ?auto_856721 ) ) ( not ( = ?auto_856717 ?auto_856718 ) ) ( not ( = ?auto_856717 ?auto_856719 ) ) ( not ( = ?auto_856717 ?auto_856720 ) ) ( not ( = ?auto_856717 ?auto_856721 ) ) ( not ( = ?auto_856718 ?auto_856719 ) ) ( not ( = ?auto_856718 ?auto_856720 ) ) ( not ( = ?auto_856718 ?auto_856721 ) ) ( not ( = ?auto_856719 ?auto_856720 ) ) ( not ( = ?auto_856719 ?auto_856721 ) ) ( not ( = ?auto_856720 ?auto_856721 ) ) ( ON ?auto_856719 ?auto_856720 ) ( ON ?auto_856718 ?auto_856719 ) ( ON ?auto_856717 ?auto_856718 ) ( ON ?auto_856716 ?auto_856717 ) ( ON ?auto_856715 ?auto_856716 ) ( ON ?auto_856714 ?auto_856715 ) ( ON ?auto_856713 ?auto_856714 ) ( ON ?auto_856712 ?auto_856713 ) ( ON ?auto_856711 ?auto_856712 ) ( CLEAR ?auto_856709 ) ( ON ?auto_856710 ?auto_856711 ) ( CLEAR ?auto_856710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_856709 ?auto_856710 )
      ( MAKE-12PILE ?auto_856709 ?auto_856710 ?auto_856711 ?auto_856712 ?auto_856713 ?auto_856714 ?auto_856715 ?auto_856716 ?auto_856717 ?auto_856718 ?auto_856719 ?auto_856720 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_856759 - BLOCK
      ?auto_856760 - BLOCK
      ?auto_856761 - BLOCK
      ?auto_856762 - BLOCK
      ?auto_856763 - BLOCK
      ?auto_856764 - BLOCK
      ?auto_856765 - BLOCK
      ?auto_856766 - BLOCK
      ?auto_856767 - BLOCK
      ?auto_856768 - BLOCK
      ?auto_856769 - BLOCK
      ?auto_856770 - BLOCK
    )
    :vars
    (
      ?auto_856771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856770 ?auto_856771 ) ( not ( = ?auto_856759 ?auto_856760 ) ) ( not ( = ?auto_856759 ?auto_856761 ) ) ( not ( = ?auto_856759 ?auto_856762 ) ) ( not ( = ?auto_856759 ?auto_856763 ) ) ( not ( = ?auto_856759 ?auto_856764 ) ) ( not ( = ?auto_856759 ?auto_856765 ) ) ( not ( = ?auto_856759 ?auto_856766 ) ) ( not ( = ?auto_856759 ?auto_856767 ) ) ( not ( = ?auto_856759 ?auto_856768 ) ) ( not ( = ?auto_856759 ?auto_856769 ) ) ( not ( = ?auto_856759 ?auto_856770 ) ) ( not ( = ?auto_856759 ?auto_856771 ) ) ( not ( = ?auto_856760 ?auto_856761 ) ) ( not ( = ?auto_856760 ?auto_856762 ) ) ( not ( = ?auto_856760 ?auto_856763 ) ) ( not ( = ?auto_856760 ?auto_856764 ) ) ( not ( = ?auto_856760 ?auto_856765 ) ) ( not ( = ?auto_856760 ?auto_856766 ) ) ( not ( = ?auto_856760 ?auto_856767 ) ) ( not ( = ?auto_856760 ?auto_856768 ) ) ( not ( = ?auto_856760 ?auto_856769 ) ) ( not ( = ?auto_856760 ?auto_856770 ) ) ( not ( = ?auto_856760 ?auto_856771 ) ) ( not ( = ?auto_856761 ?auto_856762 ) ) ( not ( = ?auto_856761 ?auto_856763 ) ) ( not ( = ?auto_856761 ?auto_856764 ) ) ( not ( = ?auto_856761 ?auto_856765 ) ) ( not ( = ?auto_856761 ?auto_856766 ) ) ( not ( = ?auto_856761 ?auto_856767 ) ) ( not ( = ?auto_856761 ?auto_856768 ) ) ( not ( = ?auto_856761 ?auto_856769 ) ) ( not ( = ?auto_856761 ?auto_856770 ) ) ( not ( = ?auto_856761 ?auto_856771 ) ) ( not ( = ?auto_856762 ?auto_856763 ) ) ( not ( = ?auto_856762 ?auto_856764 ) ) ( not ( = ?auto_856762 ?auto_856765 ) ) ( not ( = ?auto_856762 ?auto_856766 ) ) ( not ( = ?auto_856762 ?auto_856767 ) ) ( not ( = ?auto_856762 ?auto_856768 ) ) ( not ( = ?auto_856762 ?auto_856769 ) ) ( not ( = ?auto_856762 ?auto_856770 ) ) ( not ( = ?auto_856762 ?auto_856771 ) ) ( not ( = ?auto_856763 ?auto_856764 ) ) ( not ( = ?auto_856763 ?auto_856765 ) ) ( not ( = ?auto_856763 ?auto_856766 ) ) ( not ( = ?auto_856763 ?auto_856767 ) ) ( not ( = ?auto_856763 ?auto_856768 ) ) ( not ( = ?auto_856763 ?auto_856769 ) ) ( not ( = ?auto_856763 ?auto_856770 ) ) ( not ( = ?auto_856763 ?auto_856771 ) ) ( not ( = ?auto_856764 ?auto_856765 ) ) ( not ( = ?auto_856764 ?auto_856766 ) ) ( not ( = ?auto_856764 ?auto_856767 ) ) ( not ( = ?auto_856764 ?auto_856768 ) ) ( not ( = ?auto_856764 ?auto_856769 ) ) ( not ( = ?auto_856764 ?auto_856770 ) ) ( not ( = ?auto_856764 ?auto_856771 ) ) ( not ( = ?auto_856765 ?auto_856766 ) ) ( not ( = ?auto_856765 ?auto_856767 ) ) ( not ( = ?auto_856765 ?auto_856768 ) ) ( not ( = ?auto_856765 ?auto_856769 ) ) ( not ( = ?auto_856765 ?auto_856770 ) ) ( not ( = ?auto_856765 ?auto_856771 ) ) ( not ( = ?auto_856766 ?auto_856767 ) ) ( not ( = ?auto_856766 ?auto_856768 ) ) ( not ( = ?auto_856766 ?auto_856769 ) ) ( not ( = ?auto_856766 ?auto_856770 ) ) ( not ( = ?auto_856766 ?auto_856771 ) ) ( not ( = ?auto_856767 ?auto_856768 ) ) ( not ( = ?auto_856767 ?auto_856769 ) ) ( not ( = ?auto_856767 ?auto_856770 ) ) ( not ( = ?auto_856767 ?auto_856771 ) ) ( not ( = ?auto_856768 ?auto_856769 ) ) ( not ( = ?auto_856768 ?auto_856770 ) ) ( not ( = ?auto_856768 ?auto_856771 ) ) ( not ( = ?auto_856769 ?auto_856770 ) ) ( not ( = ?auto_856769 ?auto_856771 ) ) ( not ( = ?auto_856770 ?auto_856771 ) ) ( ON ?auto_856769 ?auto_856770 ) ( ON ?auto_856768 ?auto_856769 ) ( ON ?auto_856767 ?auto_856768 ) ( ON ?auto_856766 ?auto_856767 ) ( ON ?auto_856765 ?auto_856766 ) ( ON ?auto_856764 ?auto_856765 ) ( ON ?auto_856763 ?auto_856764 ) ( ON ?auto_856762 ?auto_856763 ) ( ON ?auto_856761 ?auto_856762 ) ( ON ?auto_856760 ?auto_856761 ) ( ON ?auto_856759 ?auto_856760 ) ( CLEAR ?auto_856759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_856759 )
      ( MAKE-12PILE ?auto_856759 ?auto_856760 ?auto_856761 ?auto_856762 ?auto_856763 ?auto_856764 ?auto_856765 ?auto_856766 ?auto_856767 ?auto_856768 ?auto_856769 ?auto_856770 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_856810 - BLOCK
      ?auto_856811 - BLOCK
      ?auto_856812 - BLOCK
      ?auto_856813 - BLOCK
      ?auto_856814 - BLOCK
      ?auto_856815 - BLOCK
      ?auto_856816 - BLOCK
      ?auto_856817 - BLOCK
      ?auto_856818 - BLOCK
      ?auto_856819 - BLOCK
      ?auto_856820 - BLOCK
      ?auto_856821 - BLOCK
      ?auto_856822 - BLOCK
    )
    :vars
    (
      ?auto_856823 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_856821 ) ( ON ?auto_856822 ?auto_856823 ) ( CLEAR ?auto_856822 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_856810 ) ( ON ?auto_856811 ?auto_856810 ) ( ON ?auto_856812 ?auto_856811 ) ( ON ?auto_856813 ?auto_856812 ) ( ON ?auto_856814 ?auto_856813 ) ( ON ?auto_856815 ?auto_856814 ) ( ON ?auto_856816 ?auto_856815 ) ( ON ?auto_856817 ?auto_856816 ) ( ON ?auto_856818 ?auto_856817 ) ( ON ?auto_856819 ?auto_856818 ) ( ON ?auto_856820 ?auto_856819 ) ( ON ?auto_856821 ?auto_856820 ) ( not ( = ?auto_856810 ?auto_856811 ) ) ( not ( = ?auto_856810 ?auto_856812 ) ) ( not ( = ?auto_856810 ?auto_856813 ) ) ( not ( = ?auto_856810 ?auto_856814 ) ) ( not ( = ?auto_856810 ?auto_856815 ) ) ( not ( = ?auto_856810 ?auto_856816 ) ) ( not ( = ?auto_856810 ?auto_856817 ) ) ( not ( = ?auto_856810 ?auto_856818 ) ) ( not ( = ?auto_856810 ?auto_856819 ) ) ( not ( = ?auto_856810 ?auto_856820 ) ) ( not ( = ?auto_856810 ?auto_856821 ) ) ( not ( = ?auto_856810 ?auto_856822 ) ) ( not ( = ?auto_856810 ?auto_856823 ) ) ( not ( = ?auto_856811 ?auto_856812 ) ) ( not ( = ?auto_856811 ?auto_856813 ) ) ( not ( = ?auto_856811 ?auto_856814 ) ) ( not ( = ?auto_856811 ?auto_856815 ) ) ( not ( = ?auto_856811 ?auto_856816 ) ) ( not ( = ?auto_856811 ?auto_856817 ) ) ( not ( = ?auto_856811 ?auto_856818 ) ) ( not ( = ?auto_856811 ?auto_856819 ) ) ( not ( = ?auto_856811 ?auto_856820 ) ) ( not ( = ?auto_856811 ?auto_856821 ) ) ( not ( = ?auto_856811 ?auto_856822 ) ) ( not ( = ?auto_856811 ?auto_856823 ) ) ( not ( = ?auto_856812 ?auto_856813 ) ) ( not ( = ?auto_856812 ?auto_856814 ) ) ( not ( = ?auto_856812 ?auto_856815 ) ) ( not ( = ?auto_856812 ?auto_856816 ) ) ( not ( = ?auto_856812 ?auto_856817 ) ) ( not ( = ?auto_856812 ?auto_856818 ) ) ( not ( = ?auto_856812 ?auto_856819 ) ) ( not ( = ?auto_856812 ?auto_856820 ) ) ( not ( = ?auto_856812 ?auto_856821 ) ) ( not ( = ?auto_856812 ?auto_856822 ) ) ( not ( = ?auto_856812 ?auto_856823 ) ) ( not ( = ?auto_856813 ?auto_856814 ) ) ( not ( = ?auto_856813 ?auto_856815 ) ) ( not ( = ?auto_856813 ?auto_856816 ) ) ( not ( = ?auto_856813 ?auto_856817 ) ) ( not ( = ?auto_856813 ?auto_856818 ) ) ( not ( = ?auto_856813 ?auto_856819 ) ) ( not ( = ?auto_856813 ?auto_856820 ) ) ( not ( = ?auto_856813 ?auto_856821 ) ) ( not ( = ?auto_856813 ?auto_856822 ) ) ( not ( = ?auto_856813 ?auto_856823 ) ) ( not ( = ?auto_856814 ?auto_856815 ) ) ( not ( = ?auto_856814 ?auto_856816 ) ) ( not ( = ?auto_856814 ?auto_856817 ) ) ( not ( = ?auto_856814 ?auto_856818 ) ) ( not ( = ?auto_856814 ?auto_856819 ) ) ( not ( = ?auto_856814 ?auto_856820 ) ) ( not ( = ?auto_856814 ?auto_856821 ) ) ( not ( = ?auto_856814 ?auto_856822 ) ) ( not ( = ?auto_856814 ?auto_856823 ) ) ( not ( = ?auto_856815 ?auto_856816 ) ) ( not ( = ?auto_856815 ?auto_856817 ) ) ( not ( = ?auto_856815 ?auto_856818 ) ) ( not ( = ?auto_856815 ?auto_856819 ) ) ( not ( = ?auto_856815 ?auto_856820 ) ) ( not ( = ?auto_856815 ?auto_856821 ) ) ( not ( = ?auto_856815 ?auto_856822 ) ) ( not ( = ?auto_856815 ?auto_856823 ) ) ( not ( = ?auto_856816 ?auto_856817 ) ) ( not ( = ?auto_856816 ?auto_856818 ) ) ( not ( = ?auto_856816 ?auto_856819 ) ) ( not ( = ?auto_856816 ?auto_856820 ) ) ( not ( = ?auto_856816 ?auto_856821 ) ) ( not ( = ?auto_856816 ?auto_856822 ) ) ( not ( = ?auto_856816 ?auto_856823 ) ) ( not ( = ?auto_856817 ?auto_856818 ) ) ( not ( = ?auto_856817 ?auto_856819 ) ) ( not ( = ?auto_856817 ?auto_856820 ) ) ( not ( = ?auto_856817 ?auto_856821 ) ) ( not ( = ?auto_856817 ?auto_856822 ) ) ( not ( = ?auto_856817 ?auto_856823 ) ) ( not ( = ?auto_856818 ?auto_856819 ) ) ( not ( = ?auto_856818 ?auto_856820 ) ) ( not ( = ?auto_856818 ?auto_856821 ) ) ( not ( = ?auto_856818 ?auto_856822 ) ) ( not ( = ?auto_856818 ?auto_856823 ) ) ( not ( = ?auto_856819 ?auto_856820 ) ) ( not ( = ?auto_856819 ?auto_856821 ) ) ( not ( = ?auto_856819 ?auto_856822 ) ) ( not ( = ?auto_856819 ?auto_856823 ) ) ( not ( = ?auto_856820 ?auto_856821 ) ) ( not ( = ?auto_856820 ?auto_856822 ) ) ( not ( = ?auto_856820 ?auto_856823 ) ) ( not ( = ?auto_856821 ?auto_856822 ) ) ( not ( = ?auto_856821 ?auto_856823 ) ) ( not ( = ?auto_856822 ?auto_856823 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_856822 ?auto_856823 )
      ( !STACK ?auto_856822 ?auto_856821 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_856864 - BLOCK
      ?auto_856865 - BLOCK
      ?auto_856866 - BLOCK
      ?auto_856867 - BLOCK
      ?auto_856868 - BLOCK
      ?auto_856869 - BLOCK
      ?auto_856870 - BLOCK
      ?auto_856871 - BLOCK
      ?auto_856872 - BLOCK
      ?auto_856873 - BLOCK
      ?auto_856874 - BLOCK
      ?auto_856875 - BLOCK
      ?auto_856876 - BLOCK
    )
    :vars
    (
      ?auto_856877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856876 ?auto_856877 ) ( ON-TABLE ?auto_856864 ) ( ON ?auto_856865 ?auto_856864 ) ( ON ?auto_856866 ?auto_856865 ) ( ON ?auto_856867 ?auto_856866 ) ( ON ?auto_856868 ?auto_856867 ) ( ON ?auto_856869 ?auto_856868 ) ( ON ?auto_856870 ?auto_856869 ) ( ON ?auto_856871 ?auto_856870 ) ( ON ?auto_856872 ?auto_856871 ) ( ON ?auto_856873 ?auto_856872 ) ( ON ?auto_856874 ?auto_856873 ) ( not ( = ?auto_856864 ?auto_856865 ) ) ( not ( = ?auto_856864 ?auto_856866 ) ) ( not ( = ?auto_856864 ?auto_856867 ) ) ( not ( = ?auto_856864 ?auto_856868 ) ) ( not ( = ?auto_856864 ?auto_856869 ) ) ( not ( = ?auto_856864 ?auto_856870 ) ) ( not ( = ?auto_856864 ?auto_856871 ) ) ( not ( = ?auto_856864 ?auto_856872 ) ) ( not ( = ?auto_856864 ?auto_856873 ) ) ( not ( = ?auto_856864 ?auto_856874 ) ) ( not ( = ?auto_856864 ?auto_856875 ) ) ( not ( = ?auto_856864 ?auto_856876 ) ) ( not ( = ?auto_856864 ?auto_856877 ) ) ( not ( = ?auto_856865 ?auto_856866 ) ) ( not ( = ?auto_856865 ?auto_856867 ) ) ( not ( = ?auto_856865 ?auto_856868 ) ) ( not ( = ?auto_856865 ?auto_856869 ) ) ( not ( = ?auto_856865 ?auto_856870 ) ) ( not ( = ?auto_856865 ?auto_856871 ) ) ( not ( = ?auto_856865 ?auto_856872 ) ) ( not ( = ?auto_856865 ?auto_856873 ) ) ( not ( = ?auto_856865 ?auto_856874 ) ) ( not ( = ?auto_856865 ?auto_856875 ) ) ( not ( = ?auto_856865 ?auto_856876 ) ) ( not ( = ?auto_856865 ?auto_856877 ) ) ( not ( = ?auto_856866 ?auto_856867 ) ) ( not ( = ?auto_856866 ?auto_856868 ) ) ( not ( = ?auto_856866 ?auto_856869 ) ) ( not ( = ?auto_856866 ?auto_856870 ) ) ( not ( = ?auto_856866 ?auto_856871 ) ) ( not ( = ?auto_856866 ?auto_856872 ) ) ( not ( = ?auto_856866 ?auto_856873 ) ) ( not ( = ?auto_856866 ?auto_856874 ) ) ( not ( = ?auto_856866 ?auto_856875 ) ) ( not ( = ?auto_856866 ?auto_856876 ) ) ( not ( = ?auto_856866 ?auto_856877 ) ) ( not ( = ?auto_856867 ?auto_856868 ) ) ( not ( = ?auto_856867 ?auto_856869 ) ) ( not ( = ?auto_856867 ?auto_856870 ) ) ( not ( = ?auto_856867 ?auto_856871 ) ) ( not ( = ?auto_856867 ?auto_856872 ) ) ( not ( = ?auto_856867 ?auto_856873 ) ) ( not ( = ?auto_856867 ?auto_856874 ) ) ( not ( = ?auto_856867 ?auto_856875 ) ) ( not ( = ?auto_856867 ?auto_856876 ) ) ( not ( = ?auto_856867 ?auto_856877 ) ) ( not ( = ?auto_856868 ?auto_856869 ) ) ( not ( = ?auto_856868 ?auto_856870 ) ) ( not ( = ?auto_856868 ?auto_856871 ) ) ( not ( = ?auto_856868 ?auto_856872 ) ) ( not ( = ?auto_856868 ?auto_856873 ) ) ( not ( = ?auto_856868 ?auto_856874 ) ) ( not ( = ?auto_856868 ?auto_856875 ) ) ( not ( = ?auto_856868 ?auto_856876 ) ) ( not ( = ?auto_856868 ?auto_856877 ) ) ( not ( = ?auto_856869 ?auto_856870 ) ) ( not ( = ?auto_856869 ?auto_856871 ) ) ( not ( = ?auto_856869 ?auto_856872 ) ) ( not ( = ?auto_856869 ?auto_856873 ) ) ( not ( = ?auto_856869 ?auto_856874 ) ) ( not ( = ?auto_856869 ?auto_856875 ) ) ( not ( = ?auto_856869 ?auto_856876 ) ) ( not ( = ?auto_856869 ?auto_856877 ) ) ( not ( = ?auto_856870 ?auto_856871 ) ) ( not ( = ?auto_856870 ?auto_856872 ) ) ( not ( = ?auto_856870 ?auto_856873 ) ) ( not ( = ?auto_856870 ?auto_856874 ) ) ( not ( = ?auto_856870 ?auto_856875 ) ) ( not ( = ?auto_856870 ?auto_856876 ) ) ( not ( = ?auto_856870 ?auto_856877 ) ) ( not ( = ?auto_856871 ?auto_856872 ) ) ( not ( = ?auto_856871 ?auto_856873 ) ) ( not ( = ?auto_856871 ?auto_856874 ) ) ( not ( = ?auto_856871 ?auto_856875 ) ) ( not ( = ?auto_856871 ?auto_856876 ) ) ( not ( = ?auto_856871 ?auto_856877 ) ) ( not ( = ?auto_856872 ?auto_856873 ) ) ( not ( = ?auto_856872 ?auto_856874 ) ) ( not ( = ?auto_856872 ?auto_856875 ) ) ( not ( = ?auto_856872 ?auto_856876 ) ) ( not ( = ?auto_856872 ?auto_856877 ) ) ( not ( = ?auto_856873 ?auto_856874 ) ) ( not ( = ?auto_856873 ?auto_856875 ) ) ( not ( = ?auto_856873 ?auto_856876 ) ) ( not ( = ?auto_856873 ?auto_856877 ) ) ( not ( = ?auto_856874 ?auto_856875 ) ) ( not ( = ?auto_856874 ?auto_856876 ) ) ( not ( = ?auto_856874 ?auto_856877 ) ) ( not ( = ?auto_856875 ?auto_856876 ) ) ( not ( = ?auto_856875 ?auto_856877 ) ) ( not ( = ?auto_856876 ?auto_856877 ) ) ( CLEAR ?auto_856874 ) ( ON ?auto_856875 ?auto_856876 ) ( CLEAR ?auto_856875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_856864 ?auto_856865 ?auto_856866 ?auto_856867 ?auto_856868 ?auto_856869 ?auto_856870 ?auto_856871 ?auto_856872 ?auto_856873 ?auto_856874 ?auto_856875 )
      ( MAKE-13PILE ?auto_856864 ?auto_856865 ?auto_856866 ?auto_856867 ?auto_856868 ?auto_856869 ?auto_856870 ?auto_856871 ?auto_856872 ?auto_856873 ?auto_856874 ?auto_856875 ?auto_856876 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_856918 - BLOCK
      ?auto_856919 - BLOCK
      ?auto_856920 - BLOCK
      ?auto_856921 - BLOCK
      ?auto_856922 - BLOCK
      ?auto_856923 - BLOCK
      ?auto_856924 - BLOCK
      ?auto_856925 - BLOCK
      ?auto_856926 - BLOCK
      ?auto_856927 - BLOCK
      ?auto_856928 - BLOCK
      ?auto_856929 - BLOCK
      ?auto_856930 - BLOCK
    )
    :vars
    (
      ?auto_856931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856930 ?auto_856931 ) ( ON-TABLE ?auto_856918 ) ( ON ?auto_856919 ?auto_856918 ) ( ON ?auto_856920 ?auto_856919 ) ( ON ?auto_856921 ?auto_856920 ) ( ON ?auto_856922 ?auto_856921 ) ( ON ?auto_856923 ?auto_856922 ) ( ON ?auto_856924 ?auto_856923 ) ( ON ?auto_856925 ?auto_856924 ) ( ON ?auto_856926 ?auto_856925 ) ( ON ?auto_856927 ?auto_856926 ) ( not ( = ?auto_856918 ?auto_856919 ) ) ( not ( = ?auto_856918 ?auto_856920 ) ) ( not ( = ?auto_856918 ?auto_856921 ) ) ( not ( = ?auto_856918 ?auto_856922 ) ) ( not ( = ?auto_856918 ?auto_856923 ) ) ( not ( = ?auto_856918 ?auto_856924 ) ) ( not ( = ?auto_856918 ?auto_856925 ) ) ( not ( = ?auto_856918 ?auto_856926 ) ) ( not ( = ?auto_856918 ?auto_856927 ) ) ( not ( = ?auto_856918 ?auto_856928 ) ) ( not ( = ?auto_856918 ?auto_856929 ) ) ( not ( = ?auto_856918 ?auto_856930 ) ) ( not ( = ?auto_856918 ?auto_856931 ) ) ( not ( = ?auto_856919 ?auto_856920 ) ) ( not ( = ?auto_856919 ?auto_856921 ) ) ( not ( = ?auto_856919 ?auto_856922 ) ) ( not ( = ?auto_856919 ?auto_856923 ) ) ( not ( = ?auto_856919 ?auto_856924 ) ) ( not ( = ?auto_856919 ?auto_856925 ) ) ( not ( = ?auto_856919 ?auto_856926 ) ) ( not ( = ?auto_856919 ?auto_856927 ) ) ( not ( = ?auto_856919 ?auto_856928 ) ) ( not ( = ?auto_856919 ?auto_856929 ) ) ( not ( = ?auto_856919 ?auto_856930 ) ) ( not ( = ?auto_856919 ?auto_856931 ) ) ( not ( = ?auto_856920 ?auto_856921 ) ) ( not ( = ?auto_856920 ?auto_856922 ) ) ( not ( = ?auto_856920 ?auto_856923 ) ) ( not ( = ?auto_856920 ?auto_856924 ) ) ( not ( = ?auto_856920 ?auto_856925 ) ) ( not ( = ?auto_856920 ?auto_856926 ) ) ( not ( = ?auto_856920 ?auto_856927 ) ) ( not ( = ?auto_856920 ?auto_856928 ) ) ( not ( = ?auto_856920 ?auto_856929 ) ) ( not ( = ?auto_856920 ?auto_856930 ) ) ( not ( = ?auto_856920 ?auto_856931 ) ) ( not ( = ?auto_856921 ?auto_856922 ) ) ( not ( = ?auto_856921 ?auto_856923 ) ) ( not ( = ?auto_856921 ?auto_856924 ) ) ( not ( = ?auto_856921 ?auto_856925 ) ) ( not ( = ?auto_856921 ?auto_856926 ) ) ( not ( = ?auto_856921 ?auto_856927 ) ) ( not ( = ?auto_856921 ?auto_856928 ) ) ( not ( = ?auto_856921 ?auto_856929 ) ) ( not ( = ?auto_856921 ?auto_856930 ) ) ( not ( = ?auto_856921 ?auto_856931 ) ) ( not ( = ?auto_856922 ?auto_856923 ) ) ( not ( = ?auto_856922 ?auto_856924 ) ) ( not ( = ?auto_856922 ?auto_856925 ) ) ( not ( = ?auto_856922 ?auto_856926 ) ) ( not ( = ?auto_856922 ?auto_856927 ) ) ( not ( = ?auto_856922 ?auto_856928 ) ) ( not ( = ?auto_856922 ?auto_856929 ) ) ( not ( = ?auto_856922 ?auto_856930 ) ) ( not ( = ?auto_856922 ?auto_856931 ) ) ( not ( = ?auto_856923 ?auto_856924 ) ) ( not ( = ?auto_856923 ?auto_856925 ) ) ( not ( = ?auto_856923 ?auto_856926 ) ) ( not ( = ?auto_856923 ?auto_856927 ) ) ( not ( = ?auto_856923 ?auto_856928 ) ) ( not ( = ?auto_856923 ?auto_856929 ) ) ( not ( = ?auto_856923 ?auto_856930 ) ) ( not ( = ?auto_856923 ?auto_856931 ) ) ( not ( = ?auto_856924 ?auto_856925 ) ) ( not ( = ?auto_856924 ?auto_856926 ) ) ( not ( = ?auto_856924 ?auto_856927 ) ) ( not ( = ?auto_856924 ?auto_856928 ) ) ( not ( = ?auto_856924 ?auto_856929 ) ) ( not ( = ?auto_856924 ?auto_856930 ) ) ( not ( = ?auto_856924 ?auto_856931 ) ) ( not ( = ?auto_856925 ?auto_856926 ) ) ( not ( = ?auto_856925 ?auto_856927 ) ) ( not ( = ?auto_856925 ?auto_856928 ) ) ( not ( = ?auto_856925 ?auto_856929 ) ) ( not ( = ?auto_856925 ?auto_856930 ) ) ( not ( = ?auto_856925 ?auto_856931 ) ) ( not ( = ?auto_856926 ?auto_856927 ) ) ( not ( = ?auto_856926 ?auto_856928 ) ) ( not ( = ?auto_856926 ?auto_856929 ) ) ( not ( = ?auto_856926 ?auto_856930 ) ) ( not ( = ?auto_856926 ?auto_856931 ) ) ( not ( = ?auto_856927 ?auto_856928 ) ) ( not ( = ?auto_856927 ?auto_856929 ) ) ( not ( = ?auto_856927 ?auto_856930 ) ) ( not ( = ?auto_856927 ?auto_856931 ) ) ( not ( = ?auto_856928 ?auto_856929 ) ) ( not ( = ?auto_856928 ?auto_856930 ) ) ( not ( = ?auto_856928 ?auto_856931 ) ) ( not ( = ?auto_856929 ?auto_856930 ) ) ( not ( = ?auto_856929 ?auto_856931 ) ) ( not ( = ?auto_856930 ?auto_856931 ) ) ( ON ?auto_856929 ?auto_856930 ) ( CLEAR ?auto_856927 ) ( ON ?auto_856928 ?auto_856929 ) ( CLEAR ?auto_856928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_856918 ?auto_856919 ?auto_856920 ?auto_856921 ?auto_856922 ?auto_856923 ?auto_856924 ?auto_856925 ?auto_856926 ?auto_856927 ?auto_856928 )
      ( MAKE-13PILE ?auto_856918 ?auto_856919 ?auto_856920 ?auto_856921 ?auto_856922 ?auto_856923 ?auto_856924 ?auto_856925 ?auto_856926 ?auto_856927 ?auto_856928 ?auto_856929 ?auto_856930 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_856972 - BLOCK
      ?auto_856973 - BLOCK
      ?auto_856974 - BLOCK
      ?auto_856975 - BLOCK
      ?auto_856976 - BLOCK
      ?auto_856977 - BLOCK
      ?auto_856978 - BLOCK
      ?auto_856979 - BLOCK
      ?auto_856980 - BLOCK
      ?auto_856981 - BLOCK
      ?auto_856982 - BLOCK
      ?auto_856983 - BLOCK
      ?auto_856984 - BLOCK
    )
    :vars
    (
      ?auto_856985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_856984 ?auto_856985 ) ( ON-TABLE ?auto_856972 ) ( ON ?auto_856973 ?auto_856972 ) ( ON ?auto_856974 ?auto_856973 ) ( ON ?auto_856975 ?auto_856974 ) ( ON ?auto_856976 ?auto_856975 ) ( ON ?auto_856977 ?auto_856976 ) ( ON ?auto_856978 ?auto_856977 ) ( ON ?auto_856979 ?auto_856978 ) ( ON ?auto_856980 ?auto_856979 ) ( not ( = ?auto_856972 ?auto_856973 ) ) ( not ( = ?auto_856972 ?auto_856974 ) ) ( not ( = ?auto_856972 ?auto_856975 ) ) ( not ( = ?auto_856972 ?auto_856976 ) ) ( not ( = ?auto_856972 ?auto_856977 ) ) ( not ( = ?auto_856972 ?auto_856978 ) ) ( not ( = ?auto_856972 ?auto_856979 ) ) ( not ( = ?auto_856972 ?auto_856980 ) ) ( not ( = ?auto_856972 ?auto_856981 ) ) ( not ( = ?auto_856972 ?auto_856982 ) ) ( not ( = ?auto_856972 ?auto_856983 ) ) ( not ( = ?auto_856972 ?auto_856984 ) ) ( not ( = ?auto_856972 ?auto_856985 ) ) ( not ( = ?auto_856973 ?auto_856974 ) ) ( not ( = ?auto_856973 ?auto_856975 ) ) ( not ( = ?auto_856973 ?auto_856976 ) ) ( not ( = ?auto_856973 ?auto_856977 ) ) ( not ( = ?auto_856973 ?auto_856978 ) ) ( not ( = ?auto_856973 ?auto_856979 ) ) ( not ( = ?auto_856973 ?auto_856980 ) ) ( not ( = ?auto_856973 ?auto_856981 ) ) ( not ( = ?auto_856973 ?auto_856982 ) ) ( not ( = ?auto_856973 ?auto_856983 ) ) ( not ( = ?auto_856973 ?auto_856984 ) ) ( not ( = ?auto_856973 ?auto_856985 ) ) ( not ( = ?auto_856974 ?auto_856975 ) ) ( not ( = ?auto_856974 ?auto_856976 ) ) ( not ( = ?auto_856974 ?auto_856977 ) ) ( not ( = ?auto_856974 ?auto_856978 ) ) ( not ( = ?auto_856974 ?auto_856979 ) ) ( not ( = ?auto_856974 ?auto_856980 ) ) ( not ( = ?auto_856974 ?auto_856981 ) ) ( not ( = ?auto_856974 ?auto_856982 ) ) ( not ( = ?auto_856974 ?auto_856983 ) ) ( not ( = ?auto_856974 ?auto_856984 ) ) ( not ( = ?auto_856974 ?auto_856985 ) ) ( not ( = ?auto_856975 ?auto_856976 ) ) ( not ( = ?auto_856975 ?auto_856977 ) ) ( not ( = ?auto_856975 ?auto_856978 ) ) ( not ( = ?auto_856975 ?auto_856979 ) ) ( not ( = ?auto_856975 ?auto_856980 ) ) ( not ( = ?auto_856975 ?auto_856981 ) ) ( not ( = ?auto_856975 ?auto_856982 ) ) ( not ( = ?auto_856975 ?auto_856983 ) ) ( not ( = ?auto_856975 ?auto_856984 ) ) ( not ( = ?auto_856975 ?auto_856985 ) ) ( not ( = ?auto_856976 ?auto_856977 ) ) ( not ( = ?auto_856976 ?auto_856978 ) ) ( not ( = ?auto_856976 ?auto_856979 ) ) ( not ( = ?auto_856976 ?auto_856980 ) ) ( not ( = ?auto_856976 ?auto_856981 ) ) ( not ( = ?auto_856976 ?auto_856982 ) ) ( not ( = ?auto_856976 ?auto_856983 ) ) ( not ( = ?auto_856976 ?auto_856984 ) ) ( not ( = ?auto_856976 ?auto_856985 ) ) ( not ( = ?auto_856977 ?auto_856978 ) ) ( not ( = ?auto_856977 ?auto_856979 ) ) ( not ( = ?auto_856977 ?auto_856980 ) ) ( not ( = ?auto_856977 ?auto_856981 ) ) ( not ( = ?auto_856977 ?auto_856982 ) ) ( not ( = ?auto_856977 ?auto_856983 ) ) ( not ( = ?auto_856977 ?auto_856984 ) ) ( not ( = ?auto_856977 ?auto_856985 ) ) ( not ( = ?auto_856978 ?auto_856979 ) ) ( not ( = ?auto_856978 ?auto_856980 ) ) ( not ( = ?auto_856978 ?auto_856981 ) ) ( not ( = ?auto_856978 ?auto_856982 ) ) ( not ( = ?auto_856978 ?auto_856983 ) ) ( not ( = ?auto_856978 ?auto_856984 ) ) ( not ( = ?auto_856978 ?auto_856985 ) ) ( not ( = ?auto_856979 ?auto_856980 ) ) ( not ( = ?auto_856979 ?auto_856981 ) ) ( not ( = ?auto_856979 ?auto_856982 ) ) ( not ( = ?auto_856979 ?auto_856983 ) ) ( not ( = ?auto_856979 ?auto_856984 ) ) ( not ( = ?auto_856979 ?auto_856985 ) ) ( not ( = ?auto_856980 ?auto_856981 ) ) ( not ( = ?auto_856980 ?auto_856982 ) ) ( not ( = ?auto_856980 ?auto_856983 ) ) ( not ( = ?auto_856980 ?auto_856984 ) ) ( not ( = ?auto_856980 ?auto_856985 ) ) ( not ( = ?auto_856981 ?auto_856982 ) ) ( not ( = ?auto_856981 ?auto_856983 ) ) ( not ( = ?auto_856981 ?auto_856984 ) ) ( not ( = ?auto_856981 ?auto_856985 ) ) ( not ( = ?auto_856982 ?auto_856983 ) ) ( not ( = ?auto_856982 ?auto_856984 ) ) ( not ( = ?auto_856982 ?auto_856985 ) ) ( not ( = ?auto_856983 ?auto_856984 ) ) ( not ( = ?auto_856983 ?auto_856985 ) ) ( not ( = ?auto_856984 ?auto_856985 ) ) ( ON ?auto_856983 ?auto_856984 ) ( ON ?auto_856982 ?auto_856983 ) ( CLEAR ?auto_856980 ) ( ON ?auto_856981 ?auto_856982 ) ( CLEAR ?auto_856981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_856972 ?auto_856973 ?auto_856974 ?auto_856975 ?auto_856976 ?auto_856977 ?auto_856978 ?auto_856979 ?auto_856980 ?auto_856981 )
      ( MAKE-13PILE ?auto_856972 ?auto_856973 ?auto_856974 ?auto_856975 ?auto_856976 ?auto_856977 ?auto_856978 ?auto_856979 ?auto_856980 ?auto_856981 ?auto_856982 ?auto_856983 ?auto_856984 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_857026 - BLOCK
      ?auto_857027 - BLOCK
      ?auto_857028 - BLOCK
      ?auto_857029 - BLOCK
      ?auto_857030 - BLOCK
      ?auto_857031 - BLOCK
      ?auto_857032 - BLOCK
      ?auto_857033 - BLOCK
      ?auto_857034 - BLOCK
      ?auto_857035 - BLOCK
      ?auto_857036 - BLOCK
      ?auto_857037 - BLOCK
      ?auto_857038 - BLOCK
    )
    :vars
    (
      ?auto_857039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857038 ?auto_857039 ) ( ON-TABLE ?auto_857026 ) ( ON ?auto_857027 ?auto_857026 ) ( ON ?auto_857028 ?auto_857027 ) ( ON ?auto_857029 ?auto_857028 ) ( ON ?auto_857030 ?auto_857029 ) ( ON ?auto_857031 ?auto_857030 ) ( ON ?auto_857032 ?auto_857031 ) ( ON ?auto_857033 ?auto_857032 ) ( not ( = ?auto_857026 ?auto_857027 ) ) ( not ( = ?auto_857026 ?auto_857028 ) ) ( not ( = ?auto_857026 ?auto_857029 ) ) ( not ( = ?auto_857026 ?auto_857030 ) ) ( not ( = ?auto_857026 ?auto_857031 ) ) ( not ( = ?auto_857026 ?auto_857032 ) ) ( not ( = ?auto_857026 ?auto_857033 ) ) ( not ( = ?auto_857026 ?auto_857034 ) ) ( not ( = ?auto_857026 ?auto_857035 ) ) ( not ( = ?auto_857026 ?auto_857036 ) ) ( not ( = ?auto_857026 ?auto_857037 ) ) ( not ( = ?auto_857026 ?auto_857038 ) ) ( not ( = ?auto_857026 ?auto_857039 ) ) ( not ( = ?auto_857027 ?auto_857028 ) ) ( not ( = ?auto_857027 ?auto_857029 ) ) ( not ( = ?auto_857027 ?auto_857030 ) ) ( not ( = ?auto_857027 ?auto_857031 ) ) ( not ( = ?auto_857027 ?auto_857032 ) ) ( not ( = ?auto_857027 ?auto_857033 ) ) ( not ( = ?auto_857027 ?auto_857034 ) ) ( not ( = ?auto_857027 ?auto_857035 ) ) ( not ( = ?auto_857027 ?auto_857036 ) ) ( not ( = ?auto_857027 ?auto_857037 ) ) ( not ( = ?auto_857027 ?auto_857038 ) ) ( not ( = ?auto_857027 ?auto_857039 ) ) ( not ( = ?auto_857028 ?auto_857029 ) ) ( not ( = ?auto_857028 ?auto_857030 ) ) ( not ( = ?auto_857028 ?auto_857031 ) ) ( not ( = ?auto_857028 ?auto_857032 ) ) ( not ( = ?auto_857028 ?auto_857033 ) ) ( not ( = ?auto_857028 ?auto_857034 ) ) ( not ( = ?auto_857028 ?auto_857035 ) ) ( not ( = ?auto_857028 ?auto_857036 ) ) ( not ( = ?auto_857028 ?auto_857037 ) ) ( not ( = ?auto_857028 ?auto_857038 ) ) ( not ( = ?auto_857028 ?auto_857039 ) ) ( not ( = ?auto_857029 ?auto_857030 ) ) ( not ( = ?auto_857029 ?auto_857031 ) ) ( not ( = ?auto_857029 ?auto_857032 ) ) ( not ( = ?auto_857029 ?auto_857033 ) ) ( not ( = ?auto_857029 ?auto_857034 ) ) ( not ( = ?auto_857029 ?auto_857035 ) ) ( not ( = ?auto_857029 ?auto_857036 ) ) ( not ( = ?auto_857029 ?auto_857037 ) ) ( not ( = ?auto_857029 ?auto_857038 ) ) ( not ( = ?auto_857029 ?auto_857039 ) ) ( not ( = ?auto_857030 ?auto_857031 ) ) ( not ( = ?auto_857030 ?auto_857032 ) ) ( not ( = ?auto_857030 ?auto_857033 ) ) ( not ( = ?auto_857030 ?auto_857034 ) ) ( not ( = ?auto_857030 ?auto_857035 ) ) ( not ( = ?auto_857030 ?auto_857036 ) ) ( not ( = ?auto_857030 ?auto_857037 ) ) ( not ( = ?auto_857030 ?auto_857038 ) ) ( not ( = ?auto_857030 ?auto_857039 ) ) ( not ( = ?auto_857031 ?auto_857032 ) ) ( not ( = ?auto_857031 ?auto_857033 ) ) ( not ( = ?auto_857031 ?auto_857034 ) ) ( not ( = ?auto_857031 ?auto_857035 ) ) ( not ( = ?auto_857031 ?auto_857036 ) ) ( not ( = ?auto_857031 ?auto_857037 ) ) ( not ( = ?auto_857031 ?auto_857038 ) ) ( not ( = ?auto_857031 ?auto_857039 ) ) ( not ( = ?auto_857032 ?auto_857033 ) ) ( not ( = ?auto_857032 ?auto_857034 ) ) ( not ( = ?auto_857032 ?auto_857035 ) ) ( not ( = ?auto_857032 ?auto_857036 ) ) ( not ( = ?auto_857032 ?auto_857037 ) ) ( not ( = ?auto_857032 ?auto_857038 ) ) ( not ( = ?auto_857032 ?auto_857039 ) ) ( not ( = ?auto_857033 ?auto_857034 ) ) ( not ( = ?auto_857033 ?auto_857035 ) ) ( not ( = ?auto_857033 ?auto_857036 ) ) ( not ( = ?auto_857033 ?auto_857037 ) ) ( not ( = ?auto_857033 ?auto_857038 ) ) ( not ( = ?auto_857033 ?auto_857039 ) ) ( not ( = ?auto_857034 ?auto_857035 ) ) ( not ( = ?auto_857034 ?auto_857036 ) ) ( not ( = ?auto_857034 ?auto_857037 ) ) ( not ( = ?auto_857034 ?auto_857038 ) ) ( not ( = ?auto_857034 ?auto_857039 ) ) ( not ( = ?auto_857035 ?auto_857036 ) ) ( not ( = ?auto_857035 ?auto_857037 ) ) ( not ( = ?auto_857035 ?auto_857038 ) ) ( not ( = ?auto_857035 ?auto_857039 ) ) ( not ( = ?auto_857036 ?auto_857037 ) ) ( not ( = ?auto_857036 ?auto_857038 ) ) ( not ( = ?auto_857036 ?auto_857039 ) ) ( not ( = ?auto_857037 ?auto_857038 ) ) ( not ( = ?auto_857037 ?auto_857039 ) ) ( not ( = ?auto_857038 ?auto_857039 ) ) ( ON ?auto_857037 ?auto_857038 ) ( ON ?auto_857036 ?auto_857037 ) ( ON ?auto_857035 ?auto_857036 ) ( CLEAR ?auto_857033 ) ( ON ?auto_857034 ?auto_857035 ) ( CLEAR ?auto_857034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_857026 ?auto_857027 ?auto_857028 ?auto_857029 ?auto_857030 ?auto_857031 ?auto_857032 ?auto_857033 ?auto_857034 )
      ( MAKE-13PILE ?auto_857026 ?auto_857027 ?auto_857028 ?auto_857029 ?auto_857030 ?auto_857031 ?auto_857032 ?auto_857033 ?auto_857034 ?auto_857035 ?auto_857036 ?auto_857037 ?auto_857038 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_857080 - BLOCK
      ?auto_857081 - BLOCK
      ?auto_857082 - BLOCK
      ?auto_857083 - BLOCK
      ?auto_857084 - BLOCK
      ?auto_857085 - BLOCK
      ?auto_857086 - BLOCK
      ?auto_857087 - BLOCK
      ?auto_857088 - BLOCK
      ?auto_857089 - BLOCK
      ?auto_857090 - BLOCK
      ?auto_857091 - BLOCK
      ?auto_857092 - BLOCK
    )
    :vars
    (
      ?auto_857093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857092 ?auto_857093 ) ( ON-TABLE ?auto_857080 ) ( ON ?auto_857081 ?auto_857080 ) ( ON ?auto_857082 ?auto_857081 ) ( ON ?auto_857083 ?auto_857082 ) ( ON ?auto_857084 ?auto_857083 ) ( ON ?auto_857085 ?auto_857084 ) ( ON ?auto_857086 ?auto_857085 ) ( not ( = ?auto_857080 ?auto_857081 ) ) ( not ( = ?auto_857080 ?auto_857082 ) ) ( not ( = ?auto_857080 ?auto_857083 ) ) ( not ( = ?auto_857080 ?auto_857084 ) ) ( not ( = ?auto_857080 ?auto_857085 ) ) ( not ( = ?auto_857080 ?auto_857086 ) ) ( not ( = ?auto_857080 ?auto_857087 ) ) ( not ( = ?auto_857080 ?auto_857088 ) ) ( not ( = ?auto_857080 ?auto_857089 ) ) ( not ( = ?auto_857080 ?auto_857090 ) ) ( not ( = ?auto_857080 ?auto_857091 ) ) ( not ( = ?auto_857080 ?auto_857092 ) ) ( not ( = ?auto_857080 ?auto_857093 ) ) ( not ( = ?auto_857081 ?auto_857082 ) ) ( not ( = ?auto_857081 ?auto_857083 ) ) ( not ( = ?auto_857081 ?auto_857084 ) ) ( not ( = ?auto_857081 ?auto_857085 ) ) ( not ( = ?auto_857081 ?auto_857086 ) ) ( not ( = ?auto_857081 ?auto_857087 ) ) ( not ( = ?auto_857081 ?auto_857088 ) ) ( not ( = ?auto_857081 ?auto_857089 ) ) ( not ( = ?auto_857081 ?auto_857090 ) ) ( not ( = ?auto_857081 ?auto_857091 ) ) ( not ( = ?auto_857081 ?auto_857092 ) ) ( not ( = ?auto_857081 ?auto_857093 ) ) ( not ( = ?auto_857082 ?auto_857083 ) ) ( not ( = ?auto_857082 ?auto_857084 ) ) ( not ( = ?auto_857082 ?auto_857085 ) ) ( not ( = ?auto_857082 ?auto_857086 ) ) ( not ( = ?auto_857082 ?auto_857087 ) ) ( not ( = ?auto_857082 ?auto_857088 ) ) ( not ( = ?auto_857082 ?auto_857089 ) ) ( not ( = ?auto_857082 ?auto_857090 ) ) ( not ( = ?auto_857082 ?auto_857091 ) ) ( not ( = ?auto_857082 ?auto_857092 ) ) ( not ( = ?auto_857082 ?auto_857093 ) ) ( not ( = ?auto_857083 ?auto_857084 ) ) ( not ( = ?auto_857083 ?auto_857085 ) ) ( not ( = ?auto_857083 ?auto_857086 ) ) ( not ( = ?auto_857083 ?auto_857087 ) ) ( not ( = ?auto_857083 ?auto_857088 ) ) ( not ( = ?auto_857083 ?auto_857089 ) ) ( not ( = ?auto_857083 ?auto_857090 ) ) ( not ( = ?auto_857083 ?auto_857091 ) ) ( not ( = ?auto_857083 ?auto_857092 ) ) ( not ( = ?auto_857083 ?auto_857093 ) ) ( not ( = ?auto_857084 ?auto_857085 ) ) ( not ( = ?auto_857084 ?auto_857086 ) ) ( not ( = ?auto_857084 ?auto_857087 ) ) ( not ( = ?auto_857084 ?auto_857088 ) ) ( not ( = ?auto_857084 ?auto_857089 ) ) ( not ( = ?auto_857084 ?auto_857090 ) ) ( not ( = ?auto_857084 ?auto_857091 ) ) ( not ( = ?auto_857084 ?auto_857092 ) ) ( not ( = ?auto_857084 ?auto_857093 ) ) ( not ( = ?auto_857085 ?auto_857086 ) ) ( not ( = ?auto_857085 ?auto_857087 ) ) ( not ( = ?auto_857085 ?auto_857088 ) ) ( not ( = ?auto_857085 ?auto_857089 ) ) ( not ( = ?auto_857085 ?auto_857090 ) ) ( not ( = ?auto_857085 ?auto_857091 ) ) ( not ( = ?auto_857085 ?auto_857092 ) ) ( not ( = ?auto_857085 ?auto_857093 ) ) ( not ( = ?auto_857086 ?auto_857087 ) ) ( not ( = ?auto_857086 ?auto_857088 ) ) ( not ( = ?auto_857086 ?auto_857089 ) ) ( not ( = ?auto_857086 ?auto_857090 ) ) ( not ( = ?auto_857086 ?auto_857091 ) ) ( not ( = ?auto_857086 ?auto_857092 ) ) ( not ( = ?auto_857086 ?auto_857093 ) ) ( not ( = ?auto_857087 ?auto_857088 ) ) ( not ( = ?auto_857087 ?auto_857089 ) ) ( not ( = ?auto_857087 ?auto_857090 ) ) ( not ( = ?auto_857087 ?auto_857091 ) ) ( not ( = ?auto_857087 ?auto_857092 ) ) ( not ( = ?auto_857087 ?auto_857093 ) ) ( not ( = ?auto_857088 ?auto_857089 ) ) ( not ( = ?auto_857088 ?auto_857090 ) ) ( not ( = ?auto_857088 ?auto_857091 ) ) ( not ( = ?auto_857088 ?auto_857092 ) ) ( not ( = ?auto_857088 ?auto_857093 ) ) ( not ( = ?auto_857089 ?auto_857090 ) ) ( not ( = ?auto_857089 ?auto_857091 ) ) ( not ( = ?auto_857089 ?auto_857092 ) ) ( not ( = ?auto_857089 ?auto_857093 ) ) ( not ( = ?auto_857090 ?auto_857091 ) ) ( not ( = ?auto_857090 ?auto_857092 ) ) ( not ( = ?auto_857090 ?auto_857093 ) ) ( not ( = ?auto_857091 ?auto_857092 ) ) ( not ( = ?auto_857091 ?auto_857093 ) ) ( not ( = ?auto_857092 ?auto_857093 ) ) ( ON ?auto_857091 ?auto_857092 ) ( ON ?auto_857090 ?auto_857091 ) ( ON ?auto_857089 ?auto_857090 ) ( ON ?auto_857088 ?auto_857089 ) ( CLEAR ?auto_857086 ) ( ON ?auto_857087 ?auto_857088 ) ( CLEAR ?auto_857087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_857080 ?auto_857081 ?auto_857082 ?auto_857083 ?auto_857084 ?auto_857085 ?auto_857086 ?auto_857087 )
      ( MAKE-13PILE ?auto_857080 ?auto_857081 ?auto_857082 ?auto_857083 ?auto_857084 ?auto_857085 ?auto_857086 ?auto_857087 ?auto_857088 ?auto_857089 ?auto_857090 ?auto_857091 ?auto_857092 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_857134 - BLOCK
      ?auto_857135 - BLOCK
      ?auto_857136 - BLOCK
      ?auto_857137 - BLOCK
      ?auto_857138 - BLOCK
      ?auto_857139 - BLOCK
      ?auto_857140 - BLOCK
      ?auto_857141 - BLOCK
      ?auto_857142 - BLOCK
      ?auto_857143 - BLOCK
      ?auto_857144 - BLOCK
      ?auto_857145 - BLOCK
      ?auto_857146 - BLOCK
    )
    :vars
    (
      ?auto_857147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857146 ?auto_857147 ) ( ON-TABLE ?auto_857134 ) ( ON ?auto_857135 ?auto_857134 ) ( ON ?auto_857136 ?auto_857135 ) ( ON ?auto_857137 ?auto_857136 ) ( ON ?auto_857138 ?auto_857137 ) ( ON ?auto_857139 ?auto_857138 ) ( not ( = ?auto_857134 ?auto_857135 ) ) ( not ( = ?auto_857134 ?auto_857136 ) ) ( not ( = ?auto_857134 ?auto_857137 ) ) ( not ( = ?auto_857134 ?auto_857138 ) ) ( not ( = ?auto_857134 ?auto_857139 ) ) ( not ( = ?auto_857134 ?auto_857140 ) ) ( not ( = ?auto_857134 ?auto_857141 ) ) ( not ( = ?auto_857134 ?auto_857142 ) ) ( not ( = ?auto_857134 ?auto_857143 ) ) ( not ( = ?auto_857134 ?auto_857144 ) ) ( not ( = ?auto_857134 ?auto_857145 ) ) ( not ( = ?auto_857134 ?auto_857146 ) ) ( not ( = ?auto_857134 ?auto_857147 ) ) ( not ( = ?auto_857135 ?auto_857136 ) ) ( not ( = ?auto_857135 ?auto_857137 ) ) ( not ( = ?auto_857135 ?auto_857138 ) ) ( not ( = ?auto_857135 ?auto_857139 ) ) ( not ( = ?auto_857135 ?auto_857140 ) ) ( not ( = ?auto_857135 ?auto_857141 ) ) ( not ( = ?auto_857135 ?auto_857142 ) ) ( not ( = ?auto_857135 ?auto_857143 ) ) ( not ( = ?auto_857135 ?auto_857144 ) ) ( not ( = ?auto_857135 ?auto_857145 ) ) ( not ( = ?auto_857135 ?auto_857146 ) ) ( not ( = ?auto_857135 ?auto_857147 ) ) ( not ( = ?auto_857136 ?auto_857137 ) ) ( not ( = ?auto_857136 ?auto_857138 ) ) ( not ( = ?auto_857136 ?auto_857139 ) ) ( not ( = ?auto_857136 ?auto_857140 ) ) ( not ( = ?auto_857136 ?auto_857141 ) ) ( not ( = ?auto_857136 ?auto_857142 ) ) ( not ( = ?auto_857136 ?auto_857143 ) ) ( not ( = ?auto_857136 ?auto_857144 ) ) ( not ( = ?auto_857136 ?auto_857145 ) ) ( not ( = ?auto_857136 ?auto_857146 ) ) ( not ( = ?auto_857136 ?auto_857147 ) ) ( not ( = ?auto_857137 ?auto_857138 ) ) ( not ( = ?auto_857137 ?auto_857139 ) ) ( not ( = ?auto_857137 ?auto_857140 ) ) ( not ( = ?auto_857137 ?auto_857141 ) ) ( not ( = ?auto_857137 ?auto_857142 ) ) ( not ( = ?auto_857137 ?auto_857143 ) ) ( not ( = ?auto_857137 ?auto_857144 ) ) ( not ( = ?auto_857137 ?auto_857145 ) ) ( not ( = ?auto_857137 ?auto_857146 ) ) ( not ( = ?auto_857137 ?auto_857147 ) ) ( not ( = ?auto_857138 ?auto_857139 ) ) ( not ( = ?auto_857138 ?auto_857140 ) ) ( not ( = ?auto_857138 ?auto_857141 ) ) ( not ( = ?auto_857138 ?auto_857142 ) ) ( not ( = ?auto_857138 ?auto_857143 ) ) ( not ( = ?auto_857138 ?auto_857144 ) ) ( not ( = ?auto_857138 ?auto_857145 ) ) ( not ( = ?auto_857138 ?auto_857146 ) ) ( not ( = ?auto_857138 ?auto_857147 ) ) ( not ( = ?auto_857139 ?auto_857140 ) ) ( not ( = ?auto_857139 ?auto_857141 ) ) ( not ( = ?auto_857139 ?auto_857142 ) ) ( not ( = ?auto_857139 ?auto_857143 ) ) ( not ( = ?auto_857139 ?auto_857144 ) ) ( not ( = ?auto_857139 ?auto_857145 ) ) ( not ( = ?auto_857139 ?auto_857146 ) ) ( not ( = ?auto_857139 ?auto_857147 ) ) ( not ( = ?auto_857140 ?auto_857141 ) ) ( not ( = ?auto_857140 ?auto_857142 ) ) ( not ( = ?auto_857140 ?auto_857143 ) ) ( not ( = ?auto_857140 ?auto_857144 ) ) ( not ( = ?auto_857140 ?auto_857145 ) ) ( not ( = ?auto_857140 ?auto_857146 ) ) ( not ( = ?auto_857140 ?auto_857147 ) ) ( not ( = ?auto_857141 ?auto_857142 ) ) ( not ( = ?auto_857141 ?auto_857143 ) ) ( not ( = ?auto_857141 ?auto_857144 ) ) ( not ( = ?auto_857141 ?auto_857145 ) ) ( not ( = ?auto_857141 ?auto_857146 ) ) ( not ( = ?auto_857141 ?auto_857147 ) ) ( not ( = ?auto_857142 ?auto_857143 ) ) ( not ( = ?auto_857142 ?auto_857144 ) ) ( not ( = ?auto_857142 ?auto_857145 ) ) ( not ( = ?auto_857142 ?auto_857146 ) ) ( not ( = ?auto_857142 ?auto_857147 ) ) ( not ( = ?auto_857143 ?auto_857144 ) ) ( not ( = ?auto_857143 ?auto_857145 ) ) ( not ( = ?auto_857143 ?auto_857146 ) ) ( not ( = ?auto_857143 ?auto_857147 ) ) ( not ( = ?auto_857144 ?auto_857145 ) ) ( not ( = ?auto_857144 ?auto_857146 ) ) ( not ( = ?auto_857144 ?auto_857147 ) ) ( not ( = ?auto_857145 ?auto_857146 ) ) ( not ( = ?auto_857145 ?auto_857147 ) ) ( not ( = ?auto_857146 ?auto_857147 ) ) ( ON ?auto_857145 ?auto_857146 ) ( ON ?auto_857144 ?auto_857145 ) ( ON ?auto_857143 ?auto_857144 ) ( ON ?auto_857142 ?auto_857143 ) ( ON ?auto_857141 ?auto_857142 ) ( CLEAR ?auto_857139 ) ( ON ?auto_857140 ?auto_857141 ) ( CLEAR ?auto_857140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_857134 ?auto_857135 ?auto_857136 ?auto_857137 ?auto_857138 ?auto_857139 ?auto_857140 )
      ( MAKE-13PILE ?auto_857134 ?auto_857135 ?auto_857136 ?auto_857137 ?auto_857138 ?auto_857139 ?auto_857140 ?auto_857141 ?auto_857142 ?auto_857143 ?auto_857144 ?auto_857145 ?auto_857146 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_857188 - BLOCK
      ?auto_857189 - BLOCK
      ?auto_857190 - BLOCK
      ?auto_857191 - BLOCK
      ?auto_857192 - BLOCK
      ?auto_857193 - BLOCK
      ?auto_857194 - BLOCK
      ?auto_857195 - BLOCK
      ?auto_857196 - BLOCK
      ?auto_857197 - BLOCK
      ?auto_857198 - BLOCK
      ?auto_857199 - BLOCK
      ?auto_857200 - BLOCK
    )
    :vars
    (
      ?auto_857201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857200 ?auto_857201 ) ( ON-TABLE ?auto_857188 ) ( ON ?auto_857189 ?auto_857188 ) ( ON ?auto_857190 ?auto_857189 ) ( ON ?auto_857191 ?auto_857190 ) ( ON ?auto_857192 ?auto_857191 ) ( not ( = ?auto_857188 ?auto_857189 ) ) ( not ( = ?auto_857188 ?auto_857190 ) ) ( not ( = ?auto_857188 ?auto_857191 ) ) ( not ( = ?auto_857188 ?auto_857192 ) ) ( not ( = ?auto_857188 ?auto_857193 ) ) ( not ( = ?auto_857188 ?auto_857194 ) ) ( not ( = ?auto_857188 ?auto_857195 ) ) ( not ( = ?auto_857188 ?auto_857196 ) ) ( not ( = ?auto_857188 ?auto_857197 ) ) ( not ( = ?auto_857188 ?auto_857198 ) ) ( not ( = ?auto_857188 ?auto_857199 ) ) ( not ( = ?auto_857188 ?auto_857200 ) ) ( not ( = ?auto_857188 ?auto_857201 ) ) ( not ( = ?auto_857189 ?auto_857190 ) ) ( not ( = ?auto_857189 ?auto_857191 ) ) ( not ( = ?auto_857189 ?auto_857192 ) ) ( not ( = ?auto_857189 ?auto_857193 ) ) ( not ( = ?auto_857189 ?auto_857194 ) ) ( not ( = ?auto_857189 ?auto_857195 ) ) ( not ( = ?auto_857189 ?auto_857196 ) ) ( not ( = ?auto_857189 ?auto_857197 ) ) ( not ( = ?auto_857189 ?auto_857198 ) ) ( not ( = ?auto_857189 ?auto_857199 ) ) ( not ( = ?auto_857189 ?auto_857200 ) ) ( not ( = ?auto_857189 ?auto_857201 ) ) ( not ( = ?auto_857190 ?auto_857191 ) ) ( not ( = ?auto_857190 ?auto_857192 ) ) ( not ( = ?auto_857190 ?auto_857193 ) ) ( not ( = ?auto_857190 ?auto_857194 ) ) ( not ( = ?auto_857190 ?auto_857195 ) ) ( not ( = ?auto_857190 ?auto_857196 ) ) ( not ( = ?auto_857190 ?auto_857197 ) ) ( not ( = ?auto_857190 ?auto_857198 ) ) ( not ( = ?auto_857190 ?auto_857199 ) ) ( not ( = ?auto_857190 ?auto_857200 ) ) ( not ( = ?auto_857190 ?auto_857201 ) ) ( not ( = ?auto_857191 ?auto_857192 ) ) ( not ( = ?auto_857191 ?auto_857193 ) ) ( not ( = ?auto_857191 ?auto_857194 ) ) ( not ( = ?auto_857191 ?auto_857195 ) ) ( not ( = ?auto_857191 ?auto_857196 ) ) ( not ( = ?auto_857191 ?auto_857197 ) ) ( not ( = ?auto_857191 ?auto_857198 ) ) ( not ( = ?auto_857191 ?auto_857199 ) ) ( not ( = ?auto_857191 ?auto_857200 ) ) ( not ( = ?auto_857191 ?auto_857201 ) ) ( not ( = ?auto_857192 ?auto_857193 ) ) ( not ( = ?auto_857192 ?auto_857194 ) ) ( not ( = ?auto_857192 ?auto_857195 ) ) ( not ( = ?auto_857192 ?auto_857196 ) ) ( not ( = ?auto_857192 ?auto_857197 ) ) ( not ( = ?auto_857192 ?auto_857198 ) ) ( not ( = ?auto_857192 ?auto_857199 ) ) ( not ( = ?auto_857192 ?auto_857200 ) ) ( not ( = ?auto_857192 ?auto_857201 ) ) ( not ( = ?auto_857193 ?auto_857194 ) ) ( not ( = ?auto_857193 ?auto_857195 ) ) ( not ( = ?auto_857193 ?auto_857196 ) ) ( not ( = ?auto_857193 ?auto_857197 ) ) ( not ( = ?auto_857193 ?auto_857198 ) ) ( not ( = ?auto_857193 ?auto_857199 ) ) ( not ( = ?auto_857193 ?auto_857200 ) ) ( not ( = ?auto_857193 ?auto_857201 ) ) ( not ( = ?auto_857194 ?auto_857195 ) ) ( not ( = ?auto_857194 ?auto_857196 ) ) ( not ( = ?auto_857194 ?auto_857197 ) ) ( not ( = ?auto_857194 ?auto_857198 ) ) ( not ( = ?auto_857194 ?auto_857199 ) ) ( not ( = ?auto_857194 ?auto_857200 ) ) ( not ( = ?auto_857194 ?auto_857201 ) ) ( not ( = ?auto_857195 ?auto_857196 ) ) ( not ( = ?auto_857195 ?auto_857197 ) ) ( not ( = ?auto_857195 ?auto_857198 ) ) ( not ( = ?auto_857195 ?auto_857199 ) ) ( not ( = ?auto_857195 ?auto_857200 ) ) ( not ( = ?auto_857195 ?auto_857201 ) ) ( not ( = ?auto_857196 ?auto_857197 ) ) ( not ( = ?auto_857196 ?auto_857198 ) ) ( not ( = ?auto_857196 ?auto_857199 ) ) ( not ( = ?auto_857196 ?auto_857200 ) ) ( not ( = ?auto_857196 ?auto_857201 ) ) ( not ( = ?auto_857197 ?auto_857198 ) ) ( not ( = ?auto_857197 ?auto_857199 ) ) ( not ( = ?auto_857197 ?auto_857200 ) ) ( not ( = ?auto_857197 ?auto_857201 ) ) ( not ( = ?auto_857198 ?auto_857199 ) ) ( not ( = ?auto_857198 ?auto_857200 ) ) ( not ( = ?auto_857198 ?auto_857201 ) ) ( not ( = ?auto_857199 ?auto_857200 ) ) ( not ( = ?auto_857199 ?auto_857201 ) ) ( not ( = ?auto_857200 ?auto_857201 ) ) ( ON ?auto_857199 ?auto_857200 ) ( ON ?auto_857198 ?auto_857199 ) ( ON ?auto_857197 ?auto_857198 ) ( ON ?auto_857196 ?auto_857197 ) ( ON ?auto_857195 ?auto_857196 ) ( ON ?auto_857194 ?auto_857195 ) ( CLEAR ?auto_857192 ) ( ON ?auto_857193 ?auto_857194 ) ( CLEAR ?auto_857193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_857188 ?auto_857189 ?auto_857190 ?auto_857191 ?auto_857192 ?auto_857193 )
      ( MAKE-13PILE ?auto_857188 ?auto_857189 ?auto_857190 ?auto_857191 ?auto_857192 ?auto_857193 ?auto_857194 ?auto_857195 ?auto_857196 ?auto_857197 ?auto_857198 ?auto_857199 ?auto_857200 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_857242 - BLOCK
      ?auto_857243 - BLOCK
      ?auto_857244 - BLOCK
      ?auto_857245 - BLOCK
      ?auto_857246 - BLOCK
      ?auto_857247 - BLOCK
      ?auto_857248 - BLOCK
      ?auto_857249 - BLOCK
      ?auto_857250 - BLOCK
      ?auto_857251 - BLOCK
      ?auto_857252 - BLOCK
      ?auto_857253 - BLOCK
      ?auto_857254 - BLOCK
    )
    :vars
    (
      ?auto_857255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857254 ?auto_857255 ) ( ON-TABLE ?auto_857242 ) ( ON ?auto_857243 ?auto_857242 ) ( ON ?auto_857244 ?auto_857243 ) ( ON ?auto_857245 ?auto_857244 ) ( not ( = ?auto_857242 ?auto_857243 ) ) ( not ( = ?auto_857242 ?auto_857244 ) ) ( not ( = ?auto_857242 ?auto_857245 ) ) ( not ( = ?auto_857242 ?auto_857246 ) ) ( not ( = ?auto_857242 ?auto_857247 ) ) ( not ( = ?auto_857242 ?auto_857248 ) ) ( not ( = ?auto_857242 ?auto_857249 ) ) ( not ( = ?auto_857242 ?auto_857250 ) ) ( not ( = ?auto_857242 ?auto_857251 ) ) ( not ( = ?auto_857242 ?auto_857252 ) ) ( not ( = ?auto_857242 ?auto_857253 ) ) ( not ( = ?auto_857242 ?auto_857254 ) ) ( not ( = ?auto_857242 ?auto_857255 ) ) ( not ( = ?auto_857243 ?auto_857244 ) ) ( not ( = ?auto_857243 ?auto_857245 ) ) ( not ( = ?auto_857243 ?auto_857246 ) ) ( not ( = ?auto_857243 ?auto_857247 ) ) ( not ( = ?auto_857243 ?auto_857248 ) ) ( not ( = ?auto_857243 ?auto_857249 ) ) ( not ( = ?auto_857243 ?auto_857250 ) ) ( not ( = ?auto_857243 ?auto_857251 ) ) ( not ( = ?auto_857243 ?auto_857252 ) ) ( not ( = ?auto_857243 ?auto_857253 ) ) ( not ( = ?auto_857243 ?auto_857254 ) ) ( not ( = ?auto_857243 ?auto_857255 ) ) ( not ( = ?auto_857244 ?auto_857245 ) ) ( not ( = ?auto_857244 ?auto_857246 ) ) ( not ( = ?auto_857244 ?auto_857247 ) ) ( not ( = ?auto_857244 ?auto_857248 ) ) ( not ( = ?auto_857244 ?auto_857249 ) ) ( not ( = ?auto_857244 ?auto_857250 ) ) ( not ( = ?auto_857244 ?auto_857251 ) ) ( not ( = ?auto_857244 ?auto_857252 ) ) ( not ( = ?auto_857244 ?auto_857253 ) ) ( not ( = ?auto_857244 ?auto_857254 ) ) ( not ( = ?auto_857244 ?auto_857255 ) ) ( not ( = ?auto_857245 ?auto_857246 ) ) ( not ( = ?auto_857245 ?auto_857247 ) ) ( not ( = ?auto_857245 ?auto_857248 ) ) ( not ( = ?auto_857245 ?auto_857249 ) ) ( not ( = ?auto_857245 ?auto_857250 ) ) ( not ( = ?auto_857245 ?auto_857251 ) ) ( not ( = ?auto_857245 ?auto_857252 ) ) ( not ( = ?auto_857245 ?auto_857253 ) ) ( not ( = ?auto_857245 ?auto_857254 ) ) ( not ( = ?auto_857245 ?auto_857255 ) ) ( not ( = ?auto_857246 ?auto_857247 ) ) ( not ( = ?auto_857246 ?auto_857248 ) ) ( not ( = ?auto_857246 ?auto_857249 ) ) ( not ( = ?auto_857246 ?auto_857250 ) ) ( not ( = ?auto_857246 ?auto_857251 ) ) ( not ( = ?auto_857246 ?auto_857252 ) ) ( not ( = ?auto_857246 ?auto_857253 ) ) ( not ( = ?auto_857246 ?auto_857254 ) ) ( not ( = ?auto_857246 ?auto_857255 ) ) ( not ( = ?auto_857247 ?auto_857248 ) ) ( not ( = ?auto_857247 ?auto_857249 ) ) ( not ( = ?auto_857247 ?auto_857250 ) ) ( not ( = ?auto_857247 ?auto_857251 ) ) ( not ( = ?auto_857247 ?auto_857252 ) ) ( not ( = ?auto_857247 ?auto_857253 ) ) ( not ( = ?auto_857247 ?auto_857254 ) ) ( not ( = ?auto_857247 ?auto_857255 ) ) ( not ( = ?auto_857248 ?auto_857249 ) ) ( not ( = ?auto_857248 ?auto_857250 ) ) ( not ( = ?auto_857248 ?auto_857251 ) ) ( not ( = ?auto_857248 ?auto_857252 ) ) ( not ( = ?auto_857248 ?auto_857253 ) ) ( not ( = ?auto_857248 ?auto_857254 ) ) ( not ( = ?auto_857248 ?auto_857255 ) ) ( not ( = ?auto_857249 ?auto_857250 ) ) ( not ( = ?auto_857249 ?auto_857251 ) ) ( not ( = ?auto_857249 ?auto_857252 ) ) ( not ( = ?auto_857249 ?auto_857253 ) ) ( not ( = ?auto_857249 ?auto_857254 ) ) ( not ( = ?auto_857249 ?auto_857255 ) ) ( not ( = ?auto_857250 ?auto_857251 ) ) ( not ( = ?auto_857250 ?auto_857252 ) ) ( not ( = ?auto_857250 ?auto_857253 ) ) ( not ( = ?auto_857250 ?auto_857254 ) ) ( not ( = ?auto_857250 ?auto_857255 ) ) ( not ( = ?auto_857251 ?auto_857252 ) ) ( not ( = ?auto_857251 ?auto_857253 ) ) ( not ( = ?auto_857251 ?auto_857254 ) ) ( not ( = ?auto_857251 ?auto_857255 ) ) ( not ( = ?auto_857252 ?auto_857253 ) ) ( not ( = ?auto_857252 ?auto_857254 ) ) ( not ( = ?auto_857252 ?auto_857255 ) ) ( not ( = ?auto_857253 ?auto_857254 ) ) ( not ( = ?auto_857253 ?auto_857255 ) ) ( not ( = ?auto_857254 ?auto_857255 ) ) ( ON ?auto_857253 ?auto_857254 ) ( ON ?auto_857252 ?auto_857253 ) ( ON ?auto_857251 ?auto_857252 ) ( ON ?auto_857250 ?auto_857251 ) ( ON ?auto_857249 ?auto_857250 ) ( ON ?auto_857248 ?auto_857249 ) ( ON ?auto_857247 ?auto_857248 ) ( CLEAR ?auto_857245 ) ( ON ?auto_857246 ?auto_857247 ) ( CLEAR ?auto_857246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_857242 ?auto_857243 ?auto_857244 ?auto_857245 ?auto_857246 )
      ( MAKE-13PILE ?auto_857242 ?auto_857243 ?auto_857244 ?auto_857245 ?auto_857246 ?auto_857247 ?auto_857248 ?auto_857249 ?auto_857250 ?auto_857251 ?auto_857252 ?auto_857253 ?auto_857254 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_857296 - BLOCK
      ?auto_857297 - BLOCK
      ?auto_857298 - BLOCK
      ?auto_857299 - BLOCK
      ?auto_857300 - BLOCK
      ?auto_857301 - BLOCK
      ?auto_857302 - BLOCK
      ?auto_857303 - BLOCK
      ?auto_857304 - BLOCK
      ?auto_857305 - BLOCK
      ?auto_857306 - BLOCK
      ?auto_857307 - BLOCK
      ?auto_857308 - BLOCK
    )
    :vars
    (
      ?auto_857309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857308 ?auto_857309 ) ( ON-TABLE ?auto_857296 ) ( ON ?auto_857297 ?auto_857296 ) ( ON ?auto_857298 ?auto_857297 ) ( not ( = ?auto_857296 ?auto_857297 ) ) ( not ( = ?auto_857296 ?auto_857298 ) ) ( not ( = ?auto_857296 ?auto_857299 ) ) ( not ( = ?auto_857296 ?auto_857300 ) ) ( not ( = ?auto_857296 ?auto_857301 ) ) ( not ( = ?auto_857296 ?auto_857302 ) ) ( not ( = ?auto_857296 ?auto_857303 ) ) ( not ( = ?auto_857296 ?auto_857304 ) ) ( not ( = ?auto_857296 ?auto_857305 ) ) ( not ( = ?auto_857296 ?auto_857306 ) ) ( not ( = ?auto_857296 ?auto_857307 ) ) ( not ( = ?auto_857296 ?auto_857308 ) ) ( not ( = ?auto_857296 ?auto_857309 ) ) ( not ( = ?auto_857297 ?auto_857298 ) ) ( not ( = ?auto_857297 ?auto_857299 ) ) ( not ( = ?auto_857297 ?auto_857300 ) ) ( not ( = ?auto_857297 ?auto_857301 ) ) ( not ( = ?auto_857297 ?auto_857302 ) ) ( not ( = ?auto_857297 ?auto_857303 ) ) ( not ( = ?auto_857297 ?auto_857304 ) ) ( not ( = ?auto_857297 ?auto_857305 ) ) ( not ( = ?auto_857297 ?auto_857306 ) ) ( not ( = ?auto_857297 ?auto_857307 ) ) ( not ( = ?auto_857297 ?auto_857308 ) ) ( not ( = ?auto_857297 ?auto_857309 ) ) ( not ( = ?auto_857298 ?auto_857299 ) ) ( not ( = ?auto_857298 ?auto_857300 ) ) ( not ( = ?auto_857298 ?auto_857301 ) ) ( not ( = ?auto_857298 ?auto_857302 ) ) ( not ( = ?auto_857298 ?auto_857303 ) ) ( not ( = ?auto_857298 ?auto_857304 ) ) ( not ( = ?auto_857298 ?auto_857305 ) ) ( not ( = ?auto_857298 ?auto_857306 ) ) ( not ( = ?auto_857298 ?auto_857307 ) ) ( not ( = ?auto_857298 ?auto_857308 ) ) ( not ( = ?auto_857298 ?auto_857309 ) ) ( not ( = ?auto_857299 ?auto_857300 ) ) ( not ( = ?auto_857299 ?auto_857301 ) ) ( not ( = ?auto_857299 ?auto_857302 ) ) ( not ( = ?auto_857299 ?auto_857303 ) ) ( not ( = ?auto_857299 ?auto_857304 ) ) ( not ( = ?auto_857299 ?auto_857305 ) ) ( not ( = ?auto_857299 ?auto_857306 ) ) ( not ( = ?auto_857299 ?auto_857307 ) ) ( not ( = ?auto_857299 ?auto_857308 ) ) ( not ( = ?auto_857299 ?auto_857309 ) ) ( not ( = ?auto_857300 ?auto_857301 ) ) ( not ( = ?auto_857300 ?auto_857302 ) ) ( not ( = ?auto_857300 ?auto_857303 ) ) ( not ( = ?auto_857300 ?auto_857304 ) ) ( not ( = ?auto_857300 ?auto_857305 ) ) ( not ( = ?auto_857300 ?auto_857306 ) ) ( not ( = ?auto_857300 ?auto_857307 ) ) ( not ( = ?auto_857300 ?auto_857308 ) ) ( not ( = ?auto_857300 ?auto_857309 ) ) ( not ( = ?auto_857301 ?auto_857302 ) ) ( not ( = ?auto_857301 ?auto_857303 ) ) ( not ( = ?auto_857301 ?auto_857304 ) ) ( not ( = ?auto_857301 ?auto_857305 ) ) ( not ( = ?auto_857301 ?auto_857306 ) ) ( not ( = ?auto_857301 ?auto_857307 ) ) ( not ( = ?auto_857301 ?auto_857308 ) ) ( not ( = ?auto_857301 ?auto_857309 ) ) ( not ( = ?auto_857302 ?auto_857303 ) ) ( not ( = ?auto_857302 ?auto_857304 ) ) ( not ( = ?auto_857302 ?auto_857305 ) ) ( not ( = ?auto_857302 ?auto_857306 ) ) ( not ( = ?auto_857302 ?auto_857307 ) ) ( not ( = ?auto_857302 ?auto_857308 ) ) ( not ( = ?auto_857302 ?auto_857309 ) ) ( not ( = ?auto_857303 ?auto_857304 ) ) ( not ( = ?auto_857303 ?auto_857305 ) ) ( not ( = ?auto_857303 ?auto_857306 ) ) ( not ( = ?auto_857303 ?auto_857307 ) ) ( not ( = ?auto_857303 ?auto_857308 ) ) ( not ( = ?auto_857303 ?auto_857309 ) ) ( not ( = ?auto_857304 ?auto_857305 ) ) ( not ( = ?auto_857304 ?auto_857306 ) ) ( not ( = ?auto_857304 ?auto_857307 ) ) ( not ( = ?auto_857304 ?auto_857308 ) ) ( not ( = ?auto_857304 ?auto_857309 ) ) ( not ( = ?auto_857305 ?auto_857306 ) ) ( not ( = ?auto_857305 ?auto_857307 ) ) ( not ( = ?auto_857305 ?auto_857308 ) ) ( not ( = ?auto_857305 ?auto_857309 ) ) ( not ( = ?auto_857306 ?auto_857307 ) ) ( not ( = ?auto_857306 ?auto_857308 ) ) ( not ( = ?auto_857306 ?auto_857309 ) ) ( not ( = ?auto_857307 ?auto_857308 ) ) ( not ( = ?auto_857307 ?auto_857309 ) ) ( not ( = ?auto_857308 ?auto_857309 ) ) ( ON ?auto_857307 ?auto_857308 ) ( ON ?auto_857306 ?auto_857307 ) ( ON ?auto_857305 ?auto_857306 ) ( ON ?auto_857304 ?auto_857305 ) ( ON ?auto_857303 ?auto_857304 ) ( ON ?auto_857302 ?auto_857303 ) ( ON ?auto_857301 ?auto_857302 ) ( ON ?auto_857300 ?auto_857301 ) ( CLEAR ?auto_857298 ) ( ON ?auto_857299 ?auto_857300 ) ( CLEAR ?auto_857299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_857296 ?auto_857297 ?auto_857298 ?auto_857299 )
      ( MAKE-13PILE ?auto_857296 ?auto_857297 ?auto_857298 ?auto_857299 ?auto_857300 ?auto_857301 ?auto_857302 ?auto_857303 ?auto_857304 ?auto_857305 ?auto_857306 ?auto_857307 ?auto_857308 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_857350 - BLOCK
      ?auto_857351 - BLOCK
      ?auto_857352 - BLOCK
      ?auto_857353 - BLOCK
      ?auto_857354 - BLOCK
      ?auto_857355 - BLOCK
      ?auto_857356 - BLOCK
      ?auto_857357 - BLOCK
      ?auto_857358 - BLOCK
      ?auto_857359 - BLOCK
      ?auto_857360 - BLOCK
      ?auto_857361 - BLOCK
      ?auto_857362 - BLOCK
    )
    :vars
    (
      ?auto_857363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857362 ?auto_857363 ) ( ON-TABLE ?auto_857350 ) ( ON ?auto_857351 ?auto_857350 ) ( not ( = ?auto_857350 ?auto_857351 ) ) ( not ( = ?auto_857350 ?auto_857352 ) ) ( not ( = ?auto_857350 ?auto_857353 ) ) ( not ( = ?auto_857350 ?auto_857354 ) ) ( not ( = ?auto_857350 ?auto_857355 ) ) ( not ( = ?auto_857350 ?auto_857356 ) ) ( not ( = ?auto_857350 ?auto_857357 ) ) ( not ( = ?auto_857350 ?auto_857358 ) ) ( not ( = ?auto_857350 ?auto_857359 ) ) ( not ( = ?auto_857350 ?auto_857360 ) ) ( not ( = ?auto_857350 ?auto_857361 ) ) ( not ( = ?auto_857350 ?auto_857362 ) ) ( not ( = ?auto_857350 ?auto_857363 ) ) ( not ( = ?auto_857351 ?auto_857352 ) ) ( not ( = ?auto_857351 ?auto_857353 ) ) ( not ( = ?auto_857351 ?auto_857354 ) ) ( not ( = ?auto_857351 ?auto_857355 ) ) ( not ( = ?auto_857351 ?auto_857356 ) ) ( not ( = ?auto_857351 ?auto_857357 ) ) ( not ( = ?auto_857351 ?auto_857358 ) ) ( not ( = ?auto_857351 ?auto_857359 ) ) ( not ( = ?auto_857351 ?auto_857360 ) ) ( not ( = ?auto_857351 ?auto_857361 ) ) ( not ( = ?auto_857351 ?auto_857362 ) ) ( not ( = ?auto_857351 ?auto_857363 ) ) ( not ( = ?auto_857352 ?auto_857353 ) ) ( not ( = ?auto_857352 ?auto_857354 ) ) ( not ( = ?auto_857352 ?auto_857355 ) ) ( not ( = ?auto_857352 ?auto_857356 ) ) ( not ( = ?auto_857352 ?auto_857357 ) ) ( not ( = ?auto_857352 ?auto_857358 ) ) ( not ( = ?auto_857352 ?auto_857359 ) ) ( not ( = ?auto_857352 ?auto_857360 ) ) ( not ( = ?auto_857352 ?auto_857361 ) ) ( not ( = ?auto_857352 ?auto_857362 ) ) ( not ( = ?auto_857352 ?auto_857363 ) ) ( not ( = ?auto_857353 ?auto_857354 ) ) ( not ( = ?auto_857353 ?auto_857355 ) ) ( not ( = ?auto_857353 ?auto_857356 ) ) ( not ( = ?auto_857353 ?auto_857357 ) ) ( not ( = ?auto_857353 ?auto_857358 ) ) ( not ( = ?auto_857353 ?auto_857359 ) ) ( not ( = ?auto_857353 ?auto_857360 ) ) ( not ( = ?auto_857353 ?auto_857361 ) ) ( not ( = ?auto_857353 ?auto_857362 ) ) ( not ( = ?auto_857353 ?auto_857363 ) ) ( not ( = ?auto_857354 ?auto_857355 ) ) ( not ( = ?auto_857354 ?auto_857356 ) ) ( not ( = ?auto_857354 ?auto_857357 ) ) ( not ( = ?auto_857354 ?auto_857358 ) ) ( not ( = ?auto_857354 ?auto_857359 ) ) ( not ( = ?auto_857354 ?auto_857360 ) ) ( not ( = ?auto_857354 ?auto_857361 ) ) ( not ( = ?auto_857354 ?auto_857362 ) ) ( not ( = ?auto_857354 ?auto_857363 ) ) ( not ( = ?auto_857355 ?auto_857356 ) ) ( not ( = ?auto_857355 ?auto_857357 ) ) ( not ( = ?auto_857355 ?auto_857358 ) ) ( not ( = ?auto_857355 ?auto_857359 ) ) ( not ( = ?auto_857355 ?auto_857360 ) ) ( not ( = ?auto_857355 ?auto_857361 ) ) ( not ( = ?auto_857355 ?auto_857362 ) ) ( not ( = ?auto_857355 ?auto_857363 ) ) ( not ( = ?auto_857356 ?auto_857357 ) ) ( not ( = ?auto_857356 ?auto_857358 ) ) ( not ( = ?auto_857356 ?auto_857359 ) ) ( not ( = ?auto_857356 ?auto_857360 ) ) ( not ( = ?auto_857356 ?auto_857361 ) ) ( not ( = ?auto_857356 ?auto_857362 ) ) ( not ( = ?auto_857356 ?auto_857363 ) ) ( not ( = ?auto_857357 ?auto_857358 ) ) ( not ( = ?auto_857357 ?auto_857359 ) ) ( not ( = ?auto_857357 ?auto_857360 ) ) ( not ( = ?auto_857357 ?auto_857361 ) ) ( not ( = ?auto_857357 ?auto_857362 ) ) ( not ( = ?auto_857357 ?auto_857363 ) ) ( not ( = ?auto_857358 ?auto_857359 ) ) ( not ( = ?auto_857358 ?auto_857360 ) ) ( not ( = ?auto_857358 ?auto_857361 ) ) ( not ( = ?auto_857358 ?auto_857362 ) ) ( not ( = ?auto_857358 ?auto_857363 ) ) ( not ( = ?auto_857359 ?auto_857360 ) ) ( not ( = ?auto_857359 ?auto_857361 ) ) ( not ( = ?auto_857359 ?auto_857362 ) ) ( not ( = ?auto_857359 ?auto_857363 ) ) ( not ( = ?auto_857360 ?auto_857361 ) ) ( not ( = ?auto_857360 ?auto_857362 ) ) ( not ( = ?auto_857360 ?auto_857363 ) ) ( not ( = ?auto_857361 ?auto_857362 ) ) ( not ( = ?auto_857361 ?auto_857363 ) ) ( not ( = ?auto_857362 ?auto_857363 ) ) ( ON ?auto_857361 ?auto_857362 ) ( ON ?auto_857360 ?auto_857361 ) ( ON ?auto_857359 ?auto_857360 ) ( ON ?auto_857358 ?auto_857359 ) ( ON ?auto_857357 ?auto_857358 ) ( ON ?auto_857356 ?auto_857357 ) ( ON ?auto_857355 ?auto_857356 ) ( ON ?auto_857354 ?auto_857355 ) ( ON ?auto_857353 ?auto_857354 ) ( CLEAR ?auto_857351 ) ( ON ?auto_857352 ?auto_857353 ) ( CLEAR ?auto_857352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_857350 ?auto_857351 ?auto_857352 )
      ( MAKE-13PILE ?auto_857350 ?auto_857351 ?auto_857352 ?auto_857353 ?auto_857354 ?auto_857355 ?auto_857356 ?auto_857357 ?auto_857358 ?auto_857359 ?auto_857360 ?auto_857361 ?auto_857362 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_857404 - BLOCK
      ?auto_857405 - BLOCK
      ?auto_857406 - BLOCK
      ?auto_857407 - BLOCK
      ?auto_857408 - BLOCK
      ?auto_857409 - BLOCK
      ?auto_857410 - BLOCK
      ?auto_857411 - BLOCK
      ?auto_857412 - BLOCK
      ?auto_857413 - BLOCK
      ?auto_857414 - BLOCK
      ?auto_857415 - BLOCK
      ?auto_857416 - BLOCK
    )
    :vars
    (
      ?auto_857417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857416 ?auto_857417 ) ( ON-TABLE ?auto_857404 ) ( not ( = ?auto_857404 ?auto_857405 ) ) ( not ( = ?auto_857404 ?auto_857406 ) ) ( not ( = ?auto_857404 ?auto_857407 ) ) ( not ( = ?auto_857404 ?auto_857408 ) ) ( not ( = ?auto_857404 ?auto_857409 ) ) ( not ( = ?auto_857404 ?auto_857410 ) ) ( not ( = ?auto_857404 ?auto_857411 ) ) ( not ( = ?auto_857404 ?auto_857412 ) ) ( not ( = ?auto_857404 ?auto_857413 ) ) ( not ( = ?auto_857404 ?auto_857414 ) ) ( not ( = ?auto_857404 ?auto_857415 ) ) ( not ( = ?auto_857404 ?auto_857416 ) ) ( not ( = ?auto_857404 ?auto_857417 ) ) ( not ( = ?auto_857405 ?auto_857406 ) ) ( not ( = ?auto_857405 ?auto_857407 ) ) ( not ( = ?auto_857405 ?auto_857408 ) ) ( not ( = ?auto_857405 ?auto_857409 ) ) ( not ( = ?auto_857405 ?auto_857410 ) ) ( not ( = ?auto_857405 ?auto_857411 ) ) ( not ( = ?auto_857405 ?auto_857412 ) ) ( not ( = ?auto_857405 ?auto_857413 ) ) ( not ( = ?auto_857405 ?auto_857414 ) ) ( not ( = ?auto_857405 ?auto_857415 ) ) ( not ( = ?auto_857405 ?auto_857416 ) ) ( not ( = ?auto_857405 ?auto_857417 ) ) ( not ( = ?auto_857406 ?auto_857407 ) ) ( not ( = ?auto_857406 ?auto_857408 ) ) ( not ( = ?auto_857406 ?auto_857409 ) ) ( not ( = ?auto_857406 ?auto_857410 ) ) ( not ( = ?auto_857406 ?auto_857411 ) ) ( not ( = ?auto_857406 ?auto_857412 ) ) ( not ( = ?auto_857406 ?auto_857413 ) ) ( not ( = ?auto_857406 ?auto_857414 ) ) ( not ( = ?auto_857406 ?auto_857415 ) ) ( not ( = ?auto_857406 ?auto_857416 ) ) ( not ( = ?auto_857406 ?auto_857417 ) ) ( not ( = ?auto_857407 ?auto_857408 ) ) ( not ( = ?auto_857407 ?auto_857409 ) ) ( not ( = ?auto_857407 ?auto_857410 ) ) ( not ( = ?auto_857407 ?auto_857411 ) ) ( not ( = ?auto_857407 ?auto_857412 ) ) ( not ( = ?auto_857407 ?auto_857413 ) ) ( not ( = ?auto_857407 ?auto_857414 ) ) ( not ( = ?auto_857407 ?auto_857415 ) ) ( not ( = ?auto_857407 ?auto_857416 ) ) ( not ( = ?auto_857407 ?auto_857417 ) ) ( not ( = ?auto_857408 ?auto_857409 ) ) ( not ( = ?auto_857408 ?auto_857410 ) ) ( not ( = ?auto_857408 ?auto_857411 ) ) ( not ( = ?auto_857408 ?auto_857412 ) ) ( not ( = ?auto_857408 ?auto_857413 ) ) ( not ( = ?auto_857408 ?auto_857414 ) ) ( not ( = ?auto_857408 ?auto_857415 ) ) ( not ( = ?auto_857408 ?auto_857416 ) ) ( not ( = ?auto_857408 ?auto_857417 ) ) ( not ( = ?auto_857409 ?auto_857410 ) ) ( not ( = ?auto_857409 ?auto_857411 ) ) ( not ( = ?auto_857409 ?auto_857412 ) ) ( not ( = ?auto_857409 ?auto_857413 ) ) ( not ( = ?auto_857409 ?auto_857414 ) ) ( not ( = ?auto_857409 ?auto_857415 ) ) ( not ( = ?auto_857409 ?auto_857416 ) ) ( not ( = ?auto_857409 ?auto_857417 ) ) ( not ( = ?auto_857410 ?auto_857411 ) ) ( not ( = ?auto_857410 ?auto_857412 ) ) ( not ( = ?auto_857410 ?auto_857413 ) ) ( not ( = ?auto_857410 ?auto_857414 ) ) ( not ( = ?auto_857410 ?auto_857415 ) ) ( not ( = ?auto_857410 ?auto_857416 ) ) ( not ( = ?auto_857410 ?auto_857417 ) ) ( not ( = ?auto_857411 ?auto_857412 ) ) ( not ( = ?auto_857411 ?auto_857413 ) ) ( not ( = ?auto_857411 ?auto_857414 ) ) ( not ( = ?auto_857411 ?auto_857415 ) ) ( not ( = ?auto_857411 ?auto_857416 ) ) ( not ( = ?auto_857411 ?auto_857417 ) ) ( not ( = ?auto_857412 ?auto_857413 ) ) ( not ( = ?auto_857412 ?auto_857414 ) ) ( not ( = ?auto_857412 ?auto_857415 ) ) ( not ( = ?auto_857412 ?auto_857416 ) ) ( not ( = ?auto_857412 ?auto_857417 ) ) ( not ( = ?auto_857413 ?auto_857414 ) ) ( not ( = ?auto_857413 ?auto_857415 ) ) ( not ( = ?auto_857413 ?auto_857416 ) ) ( not ( = ?auto_857413 ?auto_857417 ) ) ( not ( = ?auto_857414 ?auto_857415 ) ) ( not ( = ?auto_857414 ?auto_857416 ) ) ( not ( = ?auto_857414 ?auto_857417 ) ) ( not ( = ?auto_857415 ?auto_857416 ) ) ( not ( = ?auto_857415 ?auto_857417 ) ) ( not ( = ?auto_857416 ?auto_857417 ) ) ( ON ?auto_857415 ?auto_857416 ) ( ON ?auto_857414 ?auto_857415 ) ( ON ?auto_857413 ?auto_857414 ) ( ON ?auto_857412 ?auto_857413 ) ( ON ?auto_857411 ?auto_857412 ) ( ON ?auto_857410 ?auto_857411 ) ( ON ?auto_857409 ?auto_857410 ) ( ON ?auto_857408 ?auto_857409 ) ( ON ?auto_857407 ?auto_857408 ) ( ON ?auto_857406 ?auto_857407 ) ( CLEAR ?auto_857404 ) ( ON ?auto_857405 ?auto_857406 ) ( CLEAR ?auto_857405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_857404 ?auto_857405 )
      ( MAKE-13PILE ?auto_857404 ?auto_857405 ?auto_857406 ?auto_857407 ?auto_857408 ?auto_857409 ?auto_857410 ?auto_857411 ?auto_857412 ?auto_857413 ?auto_857414 ?auto_857415 ?auto_857416 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_857458 - BLOCK
      ?auto_857459 - BLOCK
      ?auto_857460 - BLOCK
      ?auto_857461 - BLOCK
      ?auto_857462 - BLOCK
      ?auto_857463 - BLOCK
      ?auto_857464 - BLOCK
      ?auto_857465 - BLOCK
      ?auto_857466 - BLOCK
      ?auto_857467 - BLOCK
      ?auto_857468 - BLOCK
      ?auto_857469 - BLOCK
      ?auto_857470 - BLOCK
    )
    :vars
    (
      ?auto_857471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857470 ?auto_857471 ) ( not ( = ?auto_857458 ?auto_857459 ) ) ( not ( = ?auto_857458 ?auto_857460 ) ) ( not ( = ?auto_857458 ?auto_857461 ) ) ( not ( = ?auto_857458 ?auto_857462 ) ) ( not ( = ?auto_857458 ?auto_857463 ) ) ( not ( = ?auto_857458 ?auto_857464 ) ) ( not ( = ?auto_857458 ?auto_857465 ) ) ( not ( = ?auto_857458 ?auto_857466 ) ) ( not ( = ?auto_857458 ?auto_857467 ) ) ( not ( = ?auto_857458 ?auto_857468 ) ) ( not ( = ?auto_857458 ?auto_857469 ) ) ( not ( = ?auto_857458 ?auto_857470 ) ) ( not ( = ?auto_857458 ?auto_857471 ) ) ( not ( = ?auto_857459 ?auto_857460 ) ) ( not ( = ?auto_857459 ?auto_857461 ) ) ( not ( = ?auto_857459 ?auto_857462 ) ) ( not ( = ?auto_857459 ?auto_857463 ) ) ( not ( = ?auto_857459 ?auto_857464 ) ) ( not ( = ?auto_857459 ?auto_857465 ) ) ( not ( = ?auto_857459 ?auto_857466 ) ) ( not ( = ?auto_857459 ?auto_857467 ) ) ( not ( = ?auto_857459 ?auto_857468 ) ) ( not ( = ?auto_857459 ?auto_857469 ) ) ( not ( = ?auto_857459 ?auto_857470 ) ) ( not ( = ?auto_857459 ?auto_857471 ) ) ( not ( = ?auto_857460 ?auto_857461 ) ) ( not ( = ?auto_857460 ?auto_857462 ) ) ( not ( = ?auto_857460 ?auto_857463 ) ) ( not ( = ?auto_857460 ?auto_857464 ) ) ( not ( = ?auto_857460 ?auto_857465 ) ) ( not ( = ?auto_857460 ?auto_857466 ) ) ( not ( = ?auto_857460 ?auto_857467 ) ) ( not ( = ?auto_857460 ?auto_857468 ) ) ( not ( = ?auto_857460 ?auto_857469 ) ) ( not ( = ?auto_857460 ?auto_857470 ) ) ( not ( = ?auto_857460 ?auto_857471 ) ) ( not ( = ?auto_857461 ?auto_857462 ) ) ( not ( = ?auto_857461 ?auto_857463 ) ) ( not ( = ?auto_857461 ?auto_857464 ) ) ( not ( = ?auto_857461 ?auto_857465 ) ) ( not ( = ?auto_857461 ?auto_857466 ) ) ( not ( = ?auto_857461 ?auto_857467 ) ) ( not ( = ?auto_857461 ?auto_857468 ) ) ( not ( = ?auto_857461 ?auto_857469 ) ) ( not ( = ?auto_857461 ?auto_857470 ) ) ( not ( = ?auto_857461 ?auto_857471 ) ) ( not ( = ?auto_857462 ?auto_857463 ) ) ( not ( = ?auto_857462 ?auto_857464 ) ) ( not ( = ?auto_857462 ?auto_857465 ) ) ( not ( = ?auto_857462 ?auto_857466 ) ) ( not ( = ?auto_857462 ?auto_857467 ) ) ( not ( = ?auto_857462 ?auto_857468 ) ) ( not ( = ?auto_857462 ?auto_857469 ) ) ( not ( = ?auto_857462 ?auto_857470 ) ) ( not ( = ?auto_857462 ?auto_857471 ) ) ( not ( = ?auto_857463 ?auto_857464 ) ) ( not ( = ?auto_857463 ?auto_857465 ) ) ( not ( = ?auto_857463 ?auto_857466 ) ) ( not ( = ?auto_857463 ?auto_857467 ) ) ( not ( = ?auto_857463 ?auto_857468 ) ) ( not ( = ?auto_857463 ?auto_857469 ) ) ( not ( = ?auto_857463 ?auto_857470 ) ) ( not ( = ?auto_857463 ?auto_857471 ) ) ( not ( = ?auto_857464 ?auto_857465 ) ) ( not ( = ?auto_857464 ?auto_857466 ) ) ( not ( = ?auto_857464 ?auto_857467 ) ) ( not ( = ?auto_857464 ?auto_857468 ) ) ( not ( = ?auto_857464 ?auto_857469 ) ) ( not ( = ?auto_857464 ?auto_857470 ) ) ( not ( = ?auto_857464 ?auto_857471 ) ) ( not ( = ?auto_857465 ?auto_857466 ) ) ( not ( = ?auto_857465 ?auto_857467 ) ) ( not ( = ?auto_857465 ?auto_857468 ) ) ( not ( = ?auto_857465 ?auto_857469 ) ) ( not ( = ?auto_857465 ?auto_857470 ) ) ( not ( = ?auto_857465 ?auto_857471 ) ) ( not ( = ?auto_857466 ?auto_857467 ) ) ( not ( = ?auto_857466 ?auto_857468 ) ) ( not ( = ?auto_857466 ?auto_857469 ) ) ( not ( = ?auto_857466 ?auto_857470 ) ) ( not ( = ?auto_857466 ?auto_857471 ) ) ( not ( = ?auto_857467 ?auto_857468 ) ) ( not ( = ?auto_857467 ?auto_857469 ) ) ( not ( = ?auto_857467 ?auto_857470 ) ) ( not ( = ?auto_857467 ?auto_857471 ) ) ( not ( = ?auto_857468 ?auto_857469 ) ) ( not ( = ?auto_857468 ?auto_857470 ) ) ( not ( = ?auto_857468 ?auto_857471 ) ) ( not ( = ?auto_857469 ?auto_857470 ) ) ( not ( = ?auto_857469 ?auto_857471 ) ) ( not ( = ?auto_857470 ?auto_857471 ) ) ( ON ?auto_857469 ?auto_857470 ) ( ON ?auto_857468 ?auto_857469 ) ( ON ?auto_857467 ?auto_857468 ) ( ON ?auto_857466 ?auto_857467 ) ( ON ?auto_857465 ?auto_857466 ) ( ON ?auto_857464 ?auto_857465 ) ( ON ?auto_857463 ?auto_857464 ) ( ON ?auto_857462 ?auto_857463 ) ( ON ?auto_857461 ?auto_857462 ) ( ON ?auto_857460 ?auto_857461 ) ( ON ?auto_857459 ?auto_857460 ) ( ON ?auto_857458 ?auto_857459 ) ( CLEAR ?auto_857458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_857458 )
      ( MAKE-13PILE ?auto_857458 ?auto_857459 ?auto_857460 ?auto_857461 ?auto_857462 ?auto_857463 ?auto_857464 ?auto_857465 ?auto_857466 ?auto_857467 ?auto_857468 ?auto_857469 ?auto_857470 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_857513 - BLOCK
      ?auto_857514 - BLOCK
      ?auto_857515 - BLOCK
      ?auto_857516 - BLOCK
      ?auto_857517 - BLOCK
      ?auto_857518 - BLOCK
      ?auto_857519 - BLOCK
      ?auto_857520 - BLOCK
      ?auto_857521 - BLOCK
      ?auto_857522 - BLOCK
      ?auto_857523 - BLOCK
      ?auto_857524 - BLOCK
      ?auto_857525 - BLOCK
      ?auto_857526 - BLOCK
    )
    :vars
    (
      ?auto_857527 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_857525 ) ( ON ?auto_857526 ?auto_857527 ) ( CLEAR ?auto_857526 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_857513 ) ( ON ?auto_857514 ?auto_857513 ) ( ON ?auto_857515 ?auto_857514 ) ( ON ?auto_857516 ?auto_857515 ) ( ON ?auto_857517 ?auto_857516 ) ( ON ?auto_857518 ?auto_857517 ) ( ON ?auto_857519 ?auto_857518 ) ( ON ?auto_857520 ?auto_857519 ) ( ON ?auto_857521 ?auto_857520 ) ( ON ?auto_857522 ?auto_857521 ) ( ON ?auto_857523 ?auto_857522 ) ( ON ?auto_857524 ?auto_857523 ) ( ON ?auto_857525 ?auto_857524 ) ( not ( = ?auto_857513 ?auto_857514 ) ) ( not ( = ?auto_857513 ?auto_857515 ) ) ( not ( = ?auto_857513 ?auto_857516 ) ) ( not ( = ?auto_857513 ?auto_857517 ) ) ( not ( = ?auto_857513 ?auto_857518 ) ) ( not ( = ?auto_857513 ?auto_857519 ) ) ( not ( = ?auto_857513 ?auto_857520 ) ) ( not ( = ?auto_857513 ?auto_857521 ) ) ( not ( = ?auto_857513 ?auto_857522 ) ) ( not ( = ?auto_857513 ?auto_857523 ) ) ( not ( = ?auto_857513 ?auto_857524 ) ) ( not ( = ?auto_857513 ?auto_857525 ) ) ( not ( = ?auto_857513 ?auto_857526 ) ) ( not ( = ?auto_857513 ?auto_857527 ) ) ( not ( = ?auto_857514 ?auto_857515 ) ) ( not ( = ?auto_857514 ?auto_857516 ) ) ( not ( = ?auto_857514 ?auto_857517 ) ) ( not ( = ?auto_857514 ?auto_857518 ) ) ( not ( = ?auto_857514 ?auto_857519 ) ) ( not ( = ?auto_857514 ?auto_857520 ) ) ( not ( = ?auto_857514 ?auto_857521 ) ) ( not ( = ?auto_857514 ?auto_857522 ) ) ( not ( = ?auto_857514 ?auto_857523 ) ) ( not ( = ?auto_857514 ?auto_857524 ) ) ( not ( = ?auto_857514 ?auto_857525 ) ) ( not ( = ?auto_857514 ?auto_857526 ) ) ( not ( = ?auto_857514 ?auto_857527 ) ) ( not ( = ?auto_857515 ?auto_857516 ) ) ( not ( = ?auto_857515 ?auto_857517 ) ) ( not ( = ?auto_857515 ?auto_857518 ) ) ( not ( = ?auto_857515 ?auto_857519 ) ) ( not ( = ?auto_857515 ?auto_857520 ) ) ( not ( = ?auto_857515 ?auto_857521 ) ) ( not ( = ?auto_857515 ?auto_857522 ) ) ( not ( = ?auto_857515 ?auto_857523 ) ) ( not ( = ?auto_857515 ?auto_857524 ) ) ( not ( = ?auto_857515 ?auto_857525 ) ) ( not ( = ?auto_857515 ?auto_857526 ) ) ( not ( = ?auto_857515 ?auto_857527 ) ) ( not ( = ?auto_857516 ?auto_857517 ) ) ( not ( = ?auto_857516 ?auto_857518 ) ) ( not ( = ?auto_857516 ?auto_857519 ) ) ( not ( = ?auto_857516 ?auto_857520 ) ) ( not ( = ?auto_857516 ?auto_857521 ) ) ( not ( = ?auto_857516 ?auto_857522 ) ) ( not ( = ?auto_857516 ?auto_857523 ) ) ( not ( = ?auto_857516 ?auto_857524 ) ) ( not ( = ?auto_857516 ?auto_857525 ) ) ( not ( = ?auto_857516 ?auto_857526 ) ) ( not ( = ?auto_857516 ?auto_857527 ) ) ( not ( = ?auto_857517 ?auto_857518 ) ) ( not ( = ?auto_857517 ?auto_857519 ) ) ( not ( = ?auto_857517 ?auto_857520 ) ) ( not ( = ?auto_857517 ?auto_857521 ) ) ( not ( = ?auto_857517 ?auto_857522 ) ) ( not ( = ?auto_857517 ?auto_857523 ) ) ( not ( = ?auto_857517 ?auto_857524 ) ) ( not ( = ?auto_857517 ?auto_857525 ) ) ( not ( = ?auto_857517 ?auto_857526 ) ) ( not ( = ?auto_857517 ?auto_857527 ) ) ( not ( = ?auto_857518 ?auto_857519 ) ) ( not ( = ?auto_857518 ?auto_857520 ) ) ( not ( = ?auto_857518 ?auto_857521 ) ) ( not ( = ?auto_857518 ?auto_857522 ) ) ( not ( = ?auto_857518 ?auto_857523 ) ) ( not ( = ?auto_857518 ?auto_857524 ) ) ( not ( = ?auto_857518 ?auto_857525 ) ) ( not ( = ?auto_857518 ?auto_857526 ) ) ( not ( = ?auto_857518 ?auto_857527 ) ) ( not ( = ?auto_857519 ?auto_857520 ) ) ( not ( = ?auto_857519 ?auto_857521 ) ) ( not ( = ?auto_857519 ?auto_857522 ) ) ( not ( = ?auto_857519 ?auto_857523 ) ) ( not ( = ?auto_857519 ?auto_857524 ) ) ( not ( = ?auto_857519 ?auto_857525 ) ) ( not ( = ?auto_857519 ?auto_857526 ) ) ( not ( = ?auto_857519 ?auto_857527 ) ) ( not ( = ?auto_857520 ?auto_857521 ) ) ( not ( = ?auto_857520 ?auto_857522 ) ) ( not ( = ?auto_857520 ?auto_857523 ) ) ( not ( = ?auto_857520 ?auto_857524 ) ) ( not ( = ?auto_857520 ?auto_857525 ) ) ( not ( = ?auto_857520 ?auto_857526 ) ) ( not ( = ?auto_857520 ?auto_857527 ) ) ( not ( = ?auto_857521 ?auto_857522 ) ) ( not ( = ?auto_857521 ?auto_857523 ) ) ( not ( = ?auto_857521 ?auto_857524 ) ) ( not ( = ?auto_857521 ?auto_857525 ) ) ( not ( = ?auto_857521 ?auto_857526 ) ) ( not ( = ?auto_857521 ?auto_857527 ) ) ( not ( = ?auto_857522 ?auto_857523 ) ) ( not ( = ?auto_857522 ?auto_857524 ) ) ( not ( = ?auto_857522 ?auto_857525 ) ) ( not ( = ?auto_857522 ?auto_857526 ) ) ( not ( = ?auto_857522 ?auto_857527 ) ) ( not ( = ?auto_857523 ?auto_857524 ) ) ( not ( = ?auto_857523 ?auto_857525 ) ) ( not ( = ?auto_857523 ?auto_857526 ) ) ( not ( = ?auto_857523 ?auto_857527 ) ) ( not ( = ?auto_857524 ?auto_857525 ) ) ( not ( = ?auto_857524 ?auto_857526 ) ) ( not ( = ?auto_857524 ?auto_857527 ) ) ( not ( = ?auto_857525 ?auto_857526 ) ) ( not ( = ?auto_857525 ?auto_857527 ) ) ( not ( = ?auto_857526 ?auto_857527 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_857526 ?auto_857527 )
      ( !STACK ?auto_857526 ?auto_857525 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_857571 - BLOCK
      ?auto_857572 - BLOCK
      ?auto_857573 - BLOCK
      ?auto_857574 - BLOCK
      ?auto_857575 - BLOCK
      ?auto_857576 - BLOCK
      ?auto_857577 - BLOCK
      ?auto_857578 - BLOCK
      ?auto_857579 - BLOCK
      ?auto_857580 - BLOCK
      ?auto_857581 - BLOCK
      ?auto_857582 - BLOCK
      ?auto_857583 - BLOCK
      ?auto_857584 - BLOCK
    )
    :vars
    (
      ?auto_857585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857584 ?auto_857585 ) ( ON-TABLE ?auto_857571 ) ( ON ?auto_857572 ?auto_857571 ) ( ON ?auto_857573 ?auto_857572 ) ( ON ?auto_857574 ?auto_857573 ) ( ON ?auto_857575 ?auto_857574 ) ( ON ?auto_857576 ?auto_857575 ) ( ON ?auto_857577 ?auto_857576 ) ( ON ?auto_857578 ?auto_857577 ) ( ON ?auto_857579 ?auto_857578 ) ( ON ?auto_857580 ?auto_857579 ) ( ON ?auto_857581 ?auto_857580 ) ( ON ?auto_857582 ?auto_857581 ) ( not ( = ?auto_857571 ?auto_857572 ) ) ( not ( = ?auto_857571 ?auto_857573 ) ) ( not ( = ?auto_857571 ?auto_857574 ) ) ( not ( = ?auto_857571 ?auto_857575 ) ) ( not ( = ?auto_857571 ?auto_857576 ) ) ( not ( = ?auto_857571 ?auto_857577 ) ) ( not ( = ?auto_857571 ?auto_857578 ) ) ( not ( = ?auto_857571 ?auto_857579 ) ) ( not ( = ?auto_857571 ?auto_857580 ) ) ( not ( = ?auto_857571 ?auto_857581 ) ) ( not ( = ?auto_857571 ?auto_857582 ) ) ( not ( = ?auto_857571 ?auto_857583 ) ) ( not ( = ?auto_857571 ?auto_857584 ) ) ( not ( = ?auto_857571 ?auto_857585 ) ) ( not ( = ?auto_857572 ?auto_857573 ) ) ( not ( = ?auto_857572 ?auto_857574 ) ) ( not ( = ?auto_857572 ?auto_857575 ) ) ( not ( = ?auto_857572 ?auto_857576 ) ) ( not ( = ?auto_857572 ?auto_857577 ) ) ( not ( = ?auto_857572 ?auto_857578 ) ) ( not ( = ?auto_857572 ?auto_857579 ) ) ( not ( = ?auto_857572 ?auto_857580 ) ) ( not ( = ?auto_857572 ?auto_857581 ) ) ( not ( = ?auto_857572 ?auto_857582 ) ) ( not ( = ?auto_857572 ?auto_857583 ) ) ( not ( = ?auto_857572 ?auto_857584 ) ) ( not ( = ?auto_857572 ?auto_857585 ) ) ( not ( = ?auto_857573 ?auto_857574 ) ) ( not ( = ?auto_857573 ?auto_857575 ) ) ( not ( = ?auto_857573 ?auto_857576 ) ) ( not ( = ?auto_857573 ?auto_857577 ) ) ( not ( = ?auto_857573 ?auto_857578 ) ) ( not ( = ?auto_857573 ?auto_857579 ) ) ( not ( = ?auto_857573 ?auto_857580 ) ) ( not ( = ?auto_857573 ?auto_857581 ) ) ( not ( = ?auto_857573 ?auto_857582 ) ) ( not ( = ?auto_857573 ?auto_857583 ) ) ( not ( = ?auto_857573 ?auto_857584 ) ) ( not ( = ?auto_857573 ?auto_857585 ) ) ( not ( = ?auto_857574 ?auto_857575 ) ) ( not ( = ?auto_857574 ?auto_857576 ) ) ( not ( = ?auto_857574 ?auto_857577 ) ) ( not ( = ?auto_857574 ?auto_857578 ) ) ( not ( = ?auto_857574 ?auto_857579 ) ) ( not ( = ?auto_857574 ?auto_857580 ) ) ( not ( = ?auto_857574 ?auto_857581 ) ) ( not ( = ?auto_857574 ?auto_857582 ) ) ( not ( = ?auto_857574 ?auto_857583 ) ) ( not ( = ?auto_857574 ?auto_857584 ) ) ( not ( = ?auto_857574 ?auto_857585 ) ) ( not ( = ?auto_857575 ?auto_857576 ) ) ( not ( = ?auto_857575 ?auto_857577 ) ) ( not ( = ?auto_857575 ?auto_857578 ) ) ( not ( = ?auto_857575 ?auto_857579 ) ) ( not ( = ?auto_857575 ?auto_857580 ) ) ( not ( = ?auto_857575 ?auto_857581 ) ) ( not ( = ?auto_857575 ?auto_857582 ) ) ( not ( = ?auto_857575 ?auto_857583 ) ) ( not ( = ?auto_857575 ?auto_857584 ) ) ( not ( = ?auto_857575 ?auto_857585 ) ) ( not ( = ?auto_857576 ?auto_857577 ) ) ( not ( = ?auto_857576 ?auto_857578 ) ) ( not ( = ?auto_857576 ?auto_857579 ) ) ( not ( = ?auto_857576 ?auto_857580 ) ) ( not ( = ?auto_857576 ?auto_857581 ) ) ( not ( = ?auto_857576 ?auto_857582 ) ) ( not ( = ?auto_857576 ?auto_857583 ) ) ( not ( = ?auto_857576 ?auto_857584 ) ) ( not ( = ?auto_857576 ?auto_857585 ) ) ( not ( = ?auto_857577 ?auto_857578 ) ) ( not ( = ?auto_857577 ?auto_857579 ) ) ( not ( = ?auto_857577 ?auto_857580 ) ) ( not ( = ?auto_857577 ?auto_857581 ) ) ( not ( = ?auto_857577 ?auto_857582 ) ) ( not ( = ?auto_857577 ?auto_857583 ) ) ( not ( = ?auto_857577 ?auto_857584 ) ) ( not ( = ?auto_857577 ?auto_857585 ) ) ( not ( = ?auto_857578 ?auto_857579 ) ) ( not ( = ?auto_857578 ?auto_857580 ) ) ( not ( = ?auto_857578 ?auto_857581 ) ) ( not ( = ?auto_857578 ?auto_857582 ) ) ( not ( = ?auto_857578 ?auto_857583 ) ) ( not ( = ?auto_857578 ?auto_857584 ) ) ( not ( = ?auto_857578 ?auto_857585 ) ) ( not ( = ?auto_857579 ?auto_857580 ) ) ( not ( = ?auto_857579 ?auto_857581 ) ) ( not ( = ?auto_857579 ?auto_857582 ) ) ( not ( = ?auto_857579 ?auto_857583 ) ) ( not ( = ?auto_857579 ?auto_857584 ) ) ( not ( = ?auto_857579 ?auto_857585 ) ) ( not ( = ?auto_857580 ?auto_857581 ) ) ( not ( = ?auto_857580 ?auto_857582 ) ) ( not ( = ?auto_857580 ?auto_857583 ) ) ( not ( = ?auto_857580 ?auto_857584 ) ) ( not ( = ?auto_857580 ?auto_857585 ) ) ( not ( = ?auto_857581 ?auto_857582 ) ) ( not ( = ?auto_857581 ?auto_857583 ) ) ( not ( = ?auto_857581 ?auto_857584 ) ) ( not ( = ?auto_857581 ?auto_857585 ) ) ( not ( = ?auto_857582 ?auto_857583 ) ) ( not ( = ?auto_857582 ?auto_857584 ) ) ( not ( = ?auto_857582 ?auto_857585 ) ) ( not ( = ?auto_857583 ?auto_857584 ) ) ( not ( = ?auto_857583 ?auto_857585 ) ) ( not ( = ?auto_857584 ?auto_857585 ) ) ( CLEAR ?auto_857582 ) ( ON ?auto_857583 ?auto_857584 ) ( CLEAR ?auto_857583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_857571 ?auto_857572 ?auto_857573 ?auto_857574 ?auto_857575 ?auto_857576 ?auto_857577 ?auto_857578 ?auto_857579 ?auto_857580 ?auto_857581 ?auto_857582 ?auto_857583 )
      ( MAKE-14PILE ?auto_857571 ?auto_857572 ?auto_857573 ?auto_857574 ?auto_857575 ?auto_857576 ?auto_857577 ?auto_857578 ?auto_857579 ?auto_857580 ?auto_857581 ?auto_857582 ?auto_857583 ?auto_857584 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_857629 - BLOCK
      ?auto_857630 - BLOCK
      ?auto_857631 - BLOCK
      ?auto_857632 - BLOCK
      ?auto_857633 - BLOCK
      ?auto_857634 - BLOCK
      ?auto_857635 - BLOCK
      ?auto_857636 - BLOCK
      ?auto_857637 - BLOCK
      ?auto_857638 - BLOCK
      ?auto_857639 - BLOCK
      ?auto_857640 - BLOCK
      ?auto_857641 - BLOCK
      ?auto_857642 - BLOCK
    )
    :vars
    (
      ?auto_857643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857642 ?auto_857643 ) ( ON-TABLE ?auto_857629 ) ( ON ?auto_857630 ?auto_857629 ) ( ON ?auto_857631 ?auto_857630 ) ( ON ?auto_857632 ?auto_857631 ) ( ON ?auto_857633 ?auto_857632 ) ( ON ?auto_857634 ?auto_857633 ) ( ON ?auto_857635 ?auto_857634 ) ( ON ?auto_857636 ?auto_857635 ) ( ON ?auto_857637 ?auto_857636 ) ( ON ?auto_857638 ?auto_857637 ) ( ON ?auto_857639 ?auto_857638 ) ( not ( = ?auto_857629 ?auto_857630 ) ) ( not ( = ?auto_857629 ?auto_857631 ) ) ( not ( = ?auto_857629 ?auto_857632 ) ) ( not ( = ?auto_857629 ?auto_857633 ) ) ( not ( = ?auto_857629 ?auto_857634 ) ) ( not ( = ?auto_857629 ?auto_857635 ) ) ( not ( = ?auto_857629 ?auto_857636 ) ) ( not ( = ?auto_857629 ?auto_857637 ) ) ( not ( = ?auto_857629 ?auto_857638 ) ) ( not ( = ?auto_857629 ?auto_857639 ) ) ( not ( = ?auto_857629 ?auto_857640 ) ) ( not ( = ?auto_857629 ?auto_857641 ) ) ( not ( = ?auto_857629 ?auto_857642 ) ) ( not ( = ?auto_857629 ?auto_857643 ) ) ( not ( = ?auto_857630 ?auto_857631 ) ) ( not ( = ?auto_857630 ?auto_857632 ) ) ( not ( = ?auto_857630 ?auto_857633 ) ) ( not ( = ?auto_857630 ?auto_857634 ) ) ( not ( = ?auto_857630 ?auto_857635 ) ) ( not ( = ?auto_857630 ?auto_857636 ) ) ( not ( = ?auto_857630 ?auto_857637 ) ) ( not ( = ?auto_857630 ?auto_857638 ) ) ( not ( = ?auto_857630 ?auto_857639 ) ) ( not ( = ?auto_857630 ?auto_857640 ) ) ( not ( = ?auto_857630 ?auto_857641 ) ) ( not ( = ?auto_857630 ?auto_857642 ) ) ( not ( = ?auto_857630 ?auto_857643 ) ) ( not ( = ?auto_857631 ?auto_857632 ) ) ( not ( = ?auto_857631 ?auto_857633 ) ) ( not ( = ?auto_857631 ?auto_857634 ) ) ( not ( = ?auto_857631 ?auto_857635 ) ) ( not ( = ?auto_857631 ?auto_857636 ) ) ( not ( = ?auto_857631 ?auto_857637 ) ) ( not ( = ?auto_857631 ?auto_857638 ) ) ( not ( = ?auto_857631 ?auto_857639 ) ) ( not ( = ?auto_857631 ?auto_857640 ) ) ( not ( = ?auto_857631 ?auto_857641 ) ) ( not ( = ?auto_857631 ?auto_857642 ) ) ( not ( = ?auto_857631 ?auto_857643 ) ) ( not ( = ?auto_857632 ?auto_857633 ) ) ( not ( = ?auto_857632 ?auto_857634 ) ) ( not ( = ?auto_857632 ?auto_857635 ) ) ( not ( = ?auto_857632 ?auto_857636 ) ) ( not ( = ?auto_857632 ?auto_857637 ) ) ( not ( = ?auto_857632 ?auto_857638 ) ) ( not ( = ?auto_857632 ?auto_857639 ) ) ( not ( = ?auto_857632 ?auto_857640 ) ) ( not ( = ?auto_857632 ?auto_857641 ) ) ( not ( = ?auto_857632 ?auto_857642 ) ) ( not ( = ?auto_857632 ?auto_857643 ) ) ( not ( = ?auto_857633 ?auto_857634 ) ) ( not ( = ?auto_857633 ?auto_857635 ) ) ( not ( = ?auto_857633 ?auto_857636 ) ) ( not ( = ?auto_857633 ?auto_857637 ) ) ( not ( = ?auto_857633 ?auto_857638 ) ) ( not ( = ?auto_857633 ?auto_857639 ) ) ( not ( = ?auto_857633 ?auto_857640 ) ) ( not ( = ?auto_857633 ?auto_857641 ) ) ( not ( = ?auto_857633 ?auto_857642 ) ) ( not ( = ?auto_857633 ?auto_857643 ) ) ( not ( = ?auto_857634 ?auto_857635 ) ) ( not ( = ?auto_857634 ?auto_857636 ) ) ( not ( = ?auto_857634 ?auto_857637 ) ) ( not ( = ?auto_857634 ?auto_857638 ) ) ( not ( = ?auto_857634 ?auto_857639 ) ) ( not ( = ?auto_857634 ?auto_857640 ) ) ( not ( = ?auto_857634 ?auto_857641 ) ) ( not ( = ?auto_857634 ?auto_857642 ) ) ( not ( = ?auto_857634 ?auto_857643 ) ) ( not ( = ?auto_857635 ?auto_857636 ) ) ( not ( = ?auto_857635 ?auto_857637 ) ) ( not ( = ?auto_857635 ?auto_857638 ) ) ( not ( = ?auto_857635 ?auto_857639 ) ) ( not ( = ?auto_857635 ?auto_857640 ) ) ( not ( = ?auto_857635 ?auto_857641 ) ) ( not ( = ?auto_857635 ?auto_857642 ) ) ( not ( = ?auto_857635 ?auto_857643 ) ) ( not ( = ?auto_857636 ?auto_857637 ) ) ( not ( = ?auto_857636 ?auto_857638 ) ) ( not ( = ?auto_857636 ?auto_857639 ) ) ( not ( = ?auto_857636 ?auto_857640 ) ) ( not ( = ?auto_857636 ?auto_857641 ) ) ( not ( = ?auto_857636 ?auto_857642 ) ) ( not ( = ?auto_857636 ?auto_857643 ) ) ( not ( = ?auto_857637 ?auto_857638 ) ) ( not ( = ?auto_857637 ?auto_857639 ) ) ( not ( = ?auto_857637 ?auto_857640 ) ) ( not ( = ?auto_857637 ?auto_857641 ) ) ( not ( = ?auto_857637 ?auto_857642 ) ) ( not ( = ?auto_857637 ?auto_857643 ) ) ( not ( = ?auto_857638 ?auto_857639 ) ) ( not ( = ?auto_857638 ?auto_857640 ) ) ( not ( = ?auto_857638 ?auto_857641 ) ) ( not ( = ?auto_857638 ?auto_857642 ) ) ( not ( = ?auto_857638 ?auto_857643 ) ) ( not ( = ?auto_857639 ?auto_857640 ) ) ( not ( = ?auto_857639 ?auto_857641 ) ) ( not ( = ?auto_857639 ?auto_857642 ) ) ( not ( = ?auto_857639 ?auto_857643 ) ) ( not ( = ?auto_857640 ?auto_857641 ) ) ( not ( = ?auto_857640 ?auto_857642 ) ) ( not ( = ?auto_857640 ?auto_857643 ) ) ( not ( = ?auto_857641 ?auto_857642 ) ) ( not ( = ?auto_857641 ?auto_857643 ) ) ( not ( = ?auto_857642 ?auto_857643 ) ) ( ON ?auto_857641 ?auto_857642 ) ( CLEAR ?auto_857639 ) ( ON ?auto_857640 ?auto_857641 ) ( CLEAR ?auto_857640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_857629 ?auto_857630 ?auto_857631 ?auto_857632 ?auto_857633 ?auto_857634 ?auto_857635 ?auto_857636 ?auto_857637 ?auto_857638 ?auto_857639 ?auto_857640 )
      ( MAKE-14PILE ?auto_857629 ?auto_857630 ?auto_857631 ?auto_857632 ?auto_857633 ?auto_857634 ?auto_857635 ?auto_857636 ?auto_857637 ?auto_857638 ?auto_857639 ?auto_857640 ?auto_857641 ?auto_857642 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_857687 - BLOCK
      ?auto_857688 - BLOCK
      ?auto_857689 - BLOCK
      ?auto_857690 - BLOCK
      ?auto_857691 - BLOCK
      ?auto_857692 - BLOCK
      ?auto_857693 - BLOCK
      ?auto_857694 - BLOCK
      ?auto_857695 - BLOCK
      ?auto_857696 - BLOCK
      ?auto_857697 - BLOCK
      ?auto_857698 - BLOCK
      ?auto_857699 - BLOCK
      ?auto_857700 - BLOCK
    )
    :vars
    (
      ?auto_857701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857700 ?auto_857701 ) ( ON-TABLE ?auto_857687 ) ( ON ?auto_857688 ?auto_857687 ) ( ON ?auto_857689 ?auto_857688 ) ( ON ?auto_857690 ?auto_857689 ) ( ON ?auto_857691 ?auto_857690 ) ( ON ?auto_857692 ?auto_857691 ) ( ON ?auto_857693 ?auto_857692 ) ( ON ?auto_857694 ?auto_857693 ) ( ON ?auto_857695 ?auto_857694 ) ( ON ?auto_857696 ?auto_857695 ) ( not ( = ?auto_857687 ?auto_857688 ) ) ( not ( = ?auto_857687 ?auto_857689 ) ) ( not ( = ?auto_857687 ?auto_857690 ) ) ( not ( = ?auto_857687 ?auto_857691 ) ) ( not ( = ?auto_857687 ?auto_857692 ) ) ( not ( = ?auto_857687 ?auto_857693 ) ) ( not ( = ?auto_857687 ?auto_857694 ) ) ( not ( = ?auto_857687 ?auto_857695 ) ) ( not ( = ?auto_857687 ?auto_857696 ) ) ( not ( = ?auto_857687 ?auto_857697 ) ) ( not ( = ?auto_857687 ?auto_857698 ) ) ( not ( = ?auto_857687 ?auto_857699 ) ) ( not ( = ?auto_857687 ?auto_857700 ) ) ( not ( = ?auto_857687 ?auto_857701 ) ) ( not ( = ?auto_857688 ?auto_857689 ) ) ( not ( = ?auto_857688 ?auto_857690 ) ) ( not ( = ?auto_857688 ?auto_857691 ) ) ( not ( = ?auto_857688 ?auto_857692 ) ) ( not ( = ?auto_857688 ?auto_857693 ) ) ( not ( = ?auto_857688 ?auto_857694 ) ) ( not ( = ?auto_857688 ?auto_857695 ) ) ( not ( = ?auto_857688 ?auto_857696 ) ) ( not ( = ?auto_857688 ?auto_857697 ) ) ( not ( = ?auto_857688 ?auto_857698 ) ) ( not ( = ?auto_857688 ?auto_857699 ) ) ( not ( = ?auto_857688 ?auto_857700 ) ) ( not ( = ?auto_857688 ?auto_857701 ) ) ( not ( = ?auto_857689 ?auto_857690 ) ) ( not ( = ?auto_857689 ?auto_857691 ) ) ( not ( = ?auto_857689 ?auto_857692 ) ) ( not ( = ?auto_857689 ?auto_857693 ) ) ( not ( = ?auto_857689 ?auto_857694 ) ) ( not ( = ?auto_857689 ?auto_857695 ) ) ( not ( = ?auto_857689 ?auto_857696 ) ) ( not ( = ?auto_857689 ?auto_857697 ) ) ( not ( = ?auto_857689 ?auto_857698 ) ) ( not ( = ?auto_857689 ?auto_857699 ) ) ( not ( = ?auto_857689 ?auto_857700 ) ) ( not ( = ?auto_857689 ?auto_857701 ) ) ( not ( = ?auto_857690 ?auto_857691 ) ) ( not ( = ?auto_857690 ?auto_857692 ) ) ( not ( = ?auto_857690 ?auto_857693 ) ) ( not ( = ?auto_857690 ?auto_857694 ) ) ( not ( = ?auto_857690 ?auto_857695 ) ) ( not ( = ?auto_857690 ?auto_857696 ) ) ( not ( = ?auto_857690 ?auto_857697 ) ) ( not ( = ?auto_857690 ?auto_857698 ) ) ( not ( = ?auto_857690 ?auto_857699 ) ) ( not ( = ?auto_857690 ?auto_857700 ) ) ( not ( = ?auto_857690 ?auto_857701 ) ) ( not ( = ?auto_857691 ?auto_857692 ) ) ( not ( = ?auto_857691 ?auto_857693 ) ) ( not ( = ?auto_857691 ?auto_857694 ) ) ( not ( = ?auto_857691 ?auto_857695 ) ) ( not ( = ?auto_857691 ?auto_857696 ) ) ( not ( = ?auto_857691 ?auto_857697 ) ) ( not ( = ?auto_857691 ?auto_857698 ) ) ( not ( = ?auto_857691 ?auto_857699 ) ) ( not ( = ?auto_857691 ?auto_857700 ) ) ( not ( = ?auto_857691 ?auto_857701 ) ) ( not ( = ?auto_857692 ?auto_857693 ) ) ( not ( = ?auto_857692 ?auto_857694 ) ) ( not ( = ?auto_857692 ?auto_857695 ) ) ( not ( = ?auto_857692 ?auto_857696 ) ) ( not ( = ?auto_857692 ?auto_857697 ) ) ( not ( = ?auto_857692 ?auto_857698 ) ) ( not ( = ?auto_857692 ?auto_857699 ) ) ( not ( = ?auto_857692 ?auto_857700 ) ) ( not ( = ?auto_857692 ?auto_857701 ) ) ( not ( = ?auto_857693 ?auto_857694 ) ) ( not ( = ?auto_857693 ?auto_857695 ) ) ( not ( = ?auto_857693 ?auto_857696 ) ) ( not ( = ?auto_857693 ?auto_857697 ) ) ( not ( = ?auto_857693 ?auto_857698 ) ) ( not ( = ?auto_857693 ?auto_857699 ) ) ( not ( = ?auto_857693 ?auto_857700 ) ) ( not ( = ?auto_857693 ?auto_857701 ) ) ( not ( = ?auto_857694 ?auto_857695 ) ) ( not ( = ?auto_857694 ?auto_857696 ) ) ( not ( = ?auto_857694 ?auto_857697 ) ) ( not ( = ?auto_857694 ?auto_857698 ) ) ( not ( = ?auto_857694 ?auto_857699 ) ) ( not ( = ?auto_857694 ?auto_857700 ) ) ( not ( = ?auto_857694 ?auto_857701 ) ) ( not ( = ?auto_857695 ?auto_857696 ) ) ( not ( = ?auto_857695 ?auto_857697 ) ) ( not ( = ?auto_857695 ?auto_857698 ) ) ( not ( = ?auto_857695 ?auto_857699 ) ) ( not ( = ?auto_857695 ?auto_857700 ) ) ( not ( = ?auto_857695 ?auto_857701 ) ) ( not ( = ?auto_857696 ?auto_857697 ) ) ( not ( = ?auto_857696 ?auto_857698 ) ) ( not ( = ?auto_857696 ?auto_857699 ) ) ( not ( = ?auto_857696 ?auto_857700 ) ) ( not ( = ?auto_857696 ?auto_857701 ) ) ( not ( = ?auto_857697 ?auto_857698 ) ) ( not ( = ?auto_857697 ?auto_857699 ) ) ( not ( = ?auto_857697 ?auto_857700 ) ) ( not ( = ?auto_857697 ?auto_857701 ) ) ( not ( = ?auto_857698 ?auto_857699 ) ) ( not ( = ?auto_857698 ?auto_857700 ) ) ( not ( = ?auto_857698 ?auto_857701 ) ) ( not ( = ?auto_857699 ?auto_857700 ) ) ( not ( = ?auto_857699 ?auto_857701 ) ) ( not ( = ?auto_857700 ?auto_857701 ) ) ( ON ?auto_857699 ?auto_857700 ) ( ON ?auto_857698 ?auto_857699 ) ( CLEAR ?auto_857696 ) ( ON ?auto_857697 ?auto_857698 ) ( CLEAR ?auto_857697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_857687 ?auto_857688 ?auto_857689 ?auto_857690 ?auto_857691 ?auto_857692 ?auto_857693 ?auto_857694 ?auto_857695 ?auto_857696 ?auto_857697 )
      ( MAKE-14PILE ?auto_857687 ?auto_857688 ?auto_857689 ?auto_857690 ?auto_857691 ?auto_857692 ?auto_857693 ?auto_857694 ?auto_857695 ?auto_857696 ?auto_857697 ?auto_857698 ?auto_857699 ?auto_857700 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_857745 - BLOCK
      ?auto_857746 - BLOCK
      ?auto_857747 - BLOCK
      ?auto_857748 - BLOCK
      ?auto_857749 - BLOCK
      ?auto_857750 - BLOCK
      ?auto_857751 - BLOCK
      ?auto_857752 - BLOCK
      ?auto_857753 - BLOCK
      ?auto_857754 - BLOCK
      ?auto_857755 - BLOCK
      ?auto_857756 - BLOCK
      ?auto_857757 - BLOCK
      ?auto_857758 - BLOCK
    )
    :vars
    (
      ?auto_857759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857758 ?auto_857759 ) ( ON-TABLE ?auto_857745 ) ( ON ?auto_857746 ?auto_857745 ) ( ON ?auto_857747 ?auto_857746 ) ( ON ?auto_857748 ?auto_857747 ) ( ON ?auto_857749 ?auto_857748 ) ( ON ?auto_857750 ?auto_857749 ) ( ON ?auto_857751 ?auto_857750 ) ( ON ?auto_857752 ?auto_857751 ) ( ON ?auto_857753 ?auto_857752 ) ( not ( = ?auto_857745 ?auto_857746 ) ) ( not ( = ?auto_857745 ?auto_857747 ) ) ( not ( = ?auto_857745 ?auto_857748 ) ) ( not ( = ?auto_857745 ?auto_857749 ) ) ( not ( = ?auto_857745 ?auto_857750 ) ) ( not ( = ?auto_857745 ?auto_857751 ) ) ( not ( = ?auto_857745 ?auto_857752 ) ) ( not ( = ?auto_857745 ?auto_857753 ) ) ( not ( = ?auto_857745 ?auto_857754 ) ) ( not ( = ?auto_857745 ?auto_857755 ) ) ( not ( = ?auto_857745 ?auto_857756 ) ) ( not ( = ?auto_857745 ?auto_857757 ) ) ( not ( = ?auto_857745 ?auto_857758 ) ) ( not ( = ?auto_857745 ?auto_857759 ) ) ( not ( = ?auto_857746 ?auto_857747 ) ) ( not ( = ?auto_857746 ?auto_857748 ) ) ( not ( = ?auto_857746 ?auto_857749 ) ) ( not ( = ?auto_857746 ?auto_857750 ) ) ( not ( = ?auto_857746 ?auto_857751 ) ) ( not ( = ?auto_857746 ?auto_857752 ) ) ( not ( = ?auto_857746 ?auto_857753 ) ) ( not ( = ?auto_857746 ?auto_857754 ) ) ( not ( = ?auto_857746 ?auto_857755 ) ) ( not ( = ?auto_857746 ?auto_857756 ) ) ( not ( = ?auto_857746 ?auto_857757 ) ) ( not ( = ?auto_857746 ?auto_857758 ) ) ( not ( = ?auto_857746 ?auto_857759 ) ) ( not ( = ?auto_857747 ?auto_857748 ) ) ( not ( = ?auto_857747 ?auto_857749 ) ) ( not ( = ?auto_857747 ?auto_857750 ) ) ( not ( = ?auto_857747 ?auto_857751 ) ) ( not ( = ?auto_857747 ?auto_857752 ) ) ( not ( = ?auto_857747 ?auto_857753 ) ) ( not ( = ?auto_857747 ?auto_857754 ) ) ( not ( = ?auto_857747 ?auto_857755 ) ) ( not ( = ?auto_857747 ?auto_857756 ) ) ( not ( = ?auto_857747 ?auto_857757 ) ) ( not ( = ?auto_857747 ?auto_857758 ) ) ( not ( = ?auto_857747 ?auto_857759 ) ) ( not ( = ?auto_857748 ?auto_857749 ) ) ( not ( = ?auto_857748 ?auto_857750 ) ) ( not ( = ?auto_857748 ?auto_857751 ) ) ( not ( = ?auto_857748 ?auto_857752 ) ) ( not ( = ?auto_857748 ?auto_857753 ) ) ( not ( = ?auto_857748 ?auto_857754 ) ) ( not ( = ?auto_857748 ?auto_857755 ) ) ( not ( = ?auto_857748 ?auto_857756 ) ) ( not ( = ?auto_857748 ?auto_857757 ) ) ( not ( = ?auto_857748 ?auto_857758 ) ) ( not ( = ?auto_857748 ?auto_857759 ) ) ( not ( = ?auto_857749 ?auto_857750 ) ) ( not ( = ?auto_857749 ?auto_857751 ) ) ( not ( = ?auto_857749 ?auto_857752 ) ) ( not ( = ?auto_857749 ?auto_857753 ) ) ( not ( = ?auto_857749 ?auto_857754 ) ) ( not ( = ?auto_857749 ?auto_857755 ) ) ( not ( = ?auto_857749 ?auto_857756 ) ) ( not ( = ?auto_857749 ?auto_857757 ) ) ( not ( = ?auto_857749 ?auto_857758 ) ) ( not ( = ?auto_857749 ?auto_857759 ) ) ( not ( = ?auto_857750 ?auto_857751 ) ) ( not ( = ?auto_857750 ?auto_857752 ) ) ( not ( = ?auto_857750 ?auto_857753 ) ) ( not ( = ?auto_857750 ?auto_857754 ) ) ( not ( = ?auto_857750 ?auto_857755 ) ) ( not ( = ?auto_857750 ?auto_857756 ) ) ( not ( = ?auto_857750 ?auto_857757 ) ) ( not ( = ?auto_857750 ?auto_857758 ) ) ( not ( = ?auto_857750 ?auto_857759 ) ) ( not ( = ?auto_857751 ?auto_857752 ) ) ( not ( = ?auto_857751 ?auto_857753 ) ) ( not ( = ?auto_857751 ?auto_857754 ) ) ( not ( = ?auto_857751 ?auto_857755 ) ) ( not ( = ?auto_857751 ?auto_857756 ) ) ( not ( = ?auto_857751 ?auto_857757 ) ) ( not ( = ?auto_857751 ?auto_857758 ) ) ( not ( = ?auto_857751 ?auto_857759 ) ) ( not ( = ?auto_857752 ?auto_857753 ) ) ( not ( = ?auto_857752 ?auto_857754 ) ) ( not ( = ?auto_857752 ?auto_857755 ) ) ( not ( = ?auto_857752 ?auto_857756 ) ) ( not ( = ?auto_857752 ?auto_857757 ) ) ( not ( = ?auto_857752 ?auto_857758 ) ) ( not ( = ?auto_857752 ?auto_857759 ) ) ( not ( = ?auto_857753 ?auto_857754 ) ) ( not ( = ?auto_857753 ?auto_857755 ) ) ( not ( = ?auto_857753 ?auto_857756 ) ) ( not ( = ?auto_857753 ?auto_857757 ) ) ( not ( = ?auto_857753 ?auto_857758 ) ) ( not ( = ?auto_857753 ?auto_857759 ) ) ( not ( = ?auto_857754 ?auto_857755 ) ) ( not ( = ?auto_857754 ?auto_857756 ) ) ( not ( = ?auto_857754 ?auto_857757 ) ) ( not ( = ?auto_857754 ?auto_857758 ) ) ( not ( = ?auto_857754 ?auto_857759 ) ) ( not ( = ?auto_857755 ?auto_857756 ) ) ( not ( = ?auto_857755 ?auto_857757 ) ) ( not ( = ?auto_857755 ?auto_857758 ) ) ( not ( = ?auto_857755 ?auto_857759 ) ) ( not ( = ?auto_857756 ?auto_857757 ) ) ( not ( = ?auto_857756 ?auto_857758 ) ) ( not ( = ?auto_857756 ?auto_857759 ) ) ( not ( = ?auto_857757 ?auto_857758 ) ) ( not ( = ?auto_857757 ?auto_857759 ) ) ( not ( = ?auto_857758 ?auto_857759 ) ) ( ON ?auto_857757 ?auto_857758 ) ( ON ?auto_857756 ?auto_857757 ) ( ON ?auto_857755 ?auto_857756 ) ( CLEAR ?auto_857753 ) ( ON ?auto_857754 ?auto_857755 ) ( CLEAR ?auto_857754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_857745 ?auto_857746 ?auto_857747 ?auto_857748 ?auto_857749 ?auto_857750 ?auto_857751 ?auto_857752 ?auto_857753 ?auto_857754 )
      ( MAKE-14PILE ?auto_857745 ?auto_857746 ?auto_857747 ?auto_857748 ?auto_857749 ?auto_857750 ?auto_857751 ?auto_857752 ?auto_857753 ?auto_857754 ?auto_857755 ?auto_857756 ?auto_857757 ?auto_857758 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_857803 - BLOCK
      ?auto_857804 - BLOCK
      ?auto_857805 - BLOCK
      ?auto_857806 - BLOCK
      ?auto_857807 - BLOCK
      ?auto_857808 - BLOCK
      ?auto_857809 - BLOCK
      ?auto_857810 - BLOCK
      ?auto_857811 - BLOCK
      ?auto_857812 - BLOCK
      ?auto_857813 - BLOCK
      ?auto_857814 - BLOCK
      ?auto_857815 - BLOCK
      ?auto_857816 - BLOCK
    )
    :vars
    (
      ?auto_857817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857816 ?auto_857817 ) ( ON-TABLE ?auto_857803 ) ( ON ?auto_857804 ?auto_857803 ) ( ON ?auto_857805 ?auto_857804 ) ( ON ?auto_857806 ?auto_857805 ) ( ON ?auto_857807 ?auto_857806 ) ( ON ?auto_857808 ?auto_857807 ) ( ON ?auto_857809 ?auto_857808 ) ( ON ?auto_857810 ?auto_857809 ) ( not ( = ?auto_857803 ?auto_857804 ) ) ( not ( = ?auto_857803 ?auto_857805 ) ) ( not ( = ?auto_857803 ?auto_857806 ) ) ( not ( = ?auto_857803 ?auto_857807 ) ) ( not ( = ?auto_857803 ?auto_857808 ) ) ( not ( = ?auto_857803 ?auto_857809 ) ) ( not ( = ?auto_857803 ?auto_857810 ) ) ( not ( = ?auto_857803 ?auto_857811 ) ) ( not ( = ?auto_857803 ?auto_857812 ) ) ( not ( = ?auto_857803 ?auto_857813 ) ) ( not ( = ?auto_857803 ?auto_857814 ) ) ( not ( = ?auto_857803 ?auto_857815 ) ) ( not ( = ?auto_857803 ?auto_857816 ) ) ( not ( = ?auto_857803 ?auto_857817 ) ) ( not ( = ?auto_857804 ?auto_857805 ) ) ( not ( = ?auto_857804 ?auto_857806 ) ) ( not ( = ?auto_857804 ?auto_857807 ) ) ( not ( = ?auto_857804 ?auto_857808 ) ) ( not ( = ?auto_857804 ?auto_857809 ) ) ( not ( = ?auto_857804 ?auto_857810 ) ) ( not ( = ?auto_857804 ?auto_857811 ) ) ( not ( = ?auto_857804 ?auto_857812 ) ) ( not ( = ?auto_857804 ?auto_857813 ) ) ( not ( = ?auto_857804 ?auto_857814 ) ) ( not ( = ?auto_857804 ?auto_857815 ) ) ( not ( = ?auto_857804 ?auto_857816 ) ) ( not ( = ?auto_857804 ?auto_857817 ) ) ( not ( = ?auto_857805 ?auto_857806 ) ) ( not ( = ?auto_857805 ?auto_857807 ) ) ( not ( = ?auto_857805 ?auto_857808 ) ) ( not ( = ?auto_857805 ?auto_857809 ) ) ( not ( = ?auto_857805 ?auto_857810 ) ) ( not ( = ?auto_857805 ?auto_857811 ) ) ( not ( = ?auto_857805 ?auto_857812 ) ) ( not ( = ?auto_857805 ?auto_857813 ) ) ( not ( = ?auto_857805 ?auto_857814 ) ) ( not ( = ?auto_857805 ?auto_857815 ) ) ( not ( = ?auto_857805 ?auto_857816 ) ) ( not ( = ?auto_857805 ?auto_857817 ) ) ( not ( = ?auto_857806 ?auto_857807 ) ) ( not ( = ?auto_857806 ?auto_857808 ) ) ( not ( = ?auto_857806 ?auto_857809 ) ) ( not ( = ?auto_857806 ?auto_857810 ) ) ( not ( = ?auto_857806 ?auto_857811 ) ) ( not ( = ?auto_857806 ?auto_857812 ) ) ( not ( = ?auto_857806 ?auto_857813 ) ) ( not ( = ?auto_857806 ?auto_857814 ) ) ( not ( = ?auto_857806 ?auto_857815 ) ) ( not ( = ?auto_857806 ?auto_857816 ) ) ( not ( = ?auto_857806 ?auto_857817 ) ) ( not ( = ?auto_857807 ?auto_857808 ) ) ( not ( = ?auto_857807 ?auto_857809 ) ) ( not ( = ?auto_857807 ?auto_857810 ) ) ( not ( = ?auto_857807 ?auto_857811 ) ) ( not ( = ?auto_857807 ?auto_857812 ) ) ( not ( = ?auto_857807 ?auto_857813 ) ) ( not ( = ?auto_857807 ?auto_857814 ) ) ( not ( = ?auto_857807 ?auto_857815 ) ) ( not ( = ?auto_857807 ?auto_857816 ) ) ( not ( = ?auto_857807 ?auto_857817 ) ) ( not ( = ?auto_857808 ?auto_857809 ) ) ( not ( = ?auto_857808 ?auto_857810 ) ) ( not ( = ?auto_857808 ?auto_857811 ) ) ( not ( = ?auto_857808 ?auto_857812 ) ) ( not ( = ?auto_857808 ?auto_857813 ) ) ( not ( = ?auto_857808 ?auto_857814 ) ) ( not ( = ?auto_857808 ?auto_857815 ) ) ( not ( = ?auto_857808 ?auto_857816 ) ) ( not ( = ?auto_857808 ?auto_857817 ) ) ( not ( = ?auto_857809 ?auto_857810 ) ) ( not ( = ?auto_857809 ?auto_857811 ) ) ( not ( = ?auto_857809 ?auto_857812 ) ) ( not ( = ?auto_857809 ?auto_857813 ) ) ( not ( = ?auto_857809 ?auto_857814 ) ) ( not ( = ?auto_857809 ?auto_857815 ) ) ( not ( = ?auto_857809 ?auto_857816 ) ) ( not ( = ?auto_857809 ?auto_857817 ) ) ( not ( = ?auto_857810 ?auto_857811 ) ) ( not ( = ?auto_857810 ?auto_857812 ) ) ( not ( = ?auto_857810 ?auto_857813 ) ) ( not ( = ?auto_857810 ?auto_857814 ) ) ( not ( = ?auto_857810 ?auto_857815 ) ) ( not ( = ?auto_857810 ?auto_857816 ) ) ( not ( = ?auto_857810 ?auto_857817 ) ) ( not ( = ?auto_857811 ?auto_857812 ) ) ( not ( = ?auto_857811 ?auto_857813 ) ) ( not ( = ?auto_857811 ?auto_857814 ) ) ( not ( = ?auto_857811 ?auto_857815 ) ) ( not ( = ?auto_857811 ?auto_857816 ) ) ( not ( = ?auto_857811 ?auto_857817 ) ) ( not ( = ?auto_857812 ?auto_857813 ) ) ( not ( = ?auto_857812 ?auto_857814 ) ) ( not ( = ?auto_857812 ?auto_857815 ) ) ( not ( = ?auto_857812 ?auto_857816 ) ) ( not ( = ?auto_857812 ?auto_857817 ) ) ( not ( = ?auto_857813 ?auto_857814 ) ) ( not ( = ?auto_857813 ?auto_857815 ) ) ( not ( = ?auto_857813 ?auto_857816 ) ) ( not ( = ?auto_857813 ?auto_857817 ) ) ( not ( = ?auto_857814 ?auto_857815 ) ) ( not ( = ?auto_857814 ?auto_857816 ) ) ( not ( = ?auto_857814 ?auto_857817 ) ) ( not ( = ?auto_857815 ?auto_857816 ) ) ( not ( = ?auto_857815 ?auto_857817 ) ) ( not ( = ?auto_857816 ?auto_857817 ) ) ( ON ?auto_857815 ?auto_857816 ) ( ON ?auto_857814 ?auto_857815 ) ( ON ?auto_857813 ?auto_857814 ) ( ON ?auto_857812 ?auto_857813 ) ( CLEAR ?auto_857810 ) ( ON ?auto_857811 ?auto_857812 ) ( CLEAR ?auto_857811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_857803 ?auto_857804 ?auto_857805 ?auto_857806 ?auto_857807 ?auto_857808 ?auto_857809 ?auto_857810 ?auto_857811 )
      ( MAKE-14PILE ?auto_857803 ?auto_857804 ?auto_857805 ?auto_857806 ?auto_857807 ?auto_857808 ?auto_857809 ?auto_857810 ?auto_857811 ?auto_857812 ?auto_857813 ?auto_857814 ?auto_857815 ?auto_857816 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_857861 - BLOCK
      ?auto_857862 - BLOCK
      ?auto_857863 - BLOCK
      ?auto_857864 - BLOCK
      ?auto_857865 - BLOCK
      ?auto_857866 - BLOCK
      ?auto_857867 - BLOCK
      ?auto_857868 - BLOCK
      ?auto_857869 - BLOCK
      ?auto_857870 - BLOCK
      ?auto_857871 - BLOCK
      ?auto_857872 - BLOCK
      ?auto_857873 - BLOCK
      ?auto_857874 - BLOCK
    )
    :vars
    (
      ?auto_857875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857874 ?auto_857875 ) ( ON-TABLE ?auto_857861 ) ( ON ?auto_857862 ?auto_857861 ) ( ON ?auto_857863 ?auto_857862 ) ( ON ?auto_857864 ?auto_857863 ) ( ON ?auto_857865 ?auto_857864 ) ( ON ?auto_857866 ?auto_857865 ) ( ON ?auto_857867 ?auto_857866 ) ( not ( = ?auto_857861 ?auto_857862 ) ) ( not ( = ?auto_857861 ?auto_857863 ) ) ( not ( = ?auto_857861 ?auto_857864 ) ) ( not ( = ?auto_857861 ?auto_857865 ) ) ( not ( = ?auto_857861 ?auto_857866 ) ) ( not ( = ?auto_857861 ?auto_857867 ) ) ( not ( = ?auto_857861 ?auto_857868 ) ) ( not ( = ?auto_857861 ?auto_857869 ) ) ( not ( = ?auto_857861 ?auto_857870 ) ) ( not ( = ?auto_857861 ?auto_857871 ) ) ( not ( = ?auto_857861 ?auto_857872 ) ) ( not ( = ?auto_857861 ?auto_857873 ) ) ( not ( = ?auto_857861 ?auto_857874 ) ) ( not ( = ?auto_857861 ?auto_857875 ) ) ( not ( = ?auto_857862 ?auto_857863 ) ) ( not ( = ?auto_857862 ?auto_857864 ) ) ( not ( = ?auto_857862 ?auto_857865 ) ) ( not ( = ?auto_857862 ?auto_857866 ) ) ( not ( = ?auto_857862 ?auto_857867 ) ) ( not ( = ?auto_857862 ?auto_857868 ) ) ( not ( = ?auto_857862 ?auto_857869 ) ) ( not ( = ?auto_857862 ?auto_857870 ) ) ( not ( = ?auto_857862 ?auto_857871 ) ) ( not ( = ?auto_857862 ?auto_857872 ) ) ( not ( = ?auto_857862 ?auto_857873 ) ) ( not ( = ?auto_857862 ?auto_857874 ) ) ( not ( = ?auto_857862 ?auto_857875 ) ) ( not ( = ?auto_857863 ?auto_857864 ) ) ( not ( = ?auto_857863 ?auto_857865 ) ) ( not ( = ?auto_857863 ?auto_857866 ) ) ( not ( = ?auto_857863 ?auto_857867 ) ) ( not ( = ?auto_857863 ?auto_857868 ) ) ( not ( = ?auto_857863 ?auto_857869 ) ) ( not ( = ?auto_857863 ?auto_857870 ) ) ( not ( = ?auto_857863 ?auto_857871 ) ) ( not ( = ?auto_857863 ?auto_857872 ) ) ( not ( = ?auto_857863 ?auto_857873 ) ) ( not ( = ?auto_857863 ?auto_857874 ) ) ( not ( = ?auto_857863 ?auto_857875 ) ) ( not ( = ?auto_857864 ?auto_857865 ) ) ( not ( = ?auto_857864 ?auto_857866 ) ) ( not ( = ?auto_857864 ?auto_857867 ) ) ( not ( = ?auto_857864 ?auto_857868 ) ) ( not ( = ?auto_857864 ?auto_857869 ) ) ( not ( = ?auto_857864 ?auto_857870 ) ) ( not ( = ?auto_857864 ?auto_857871 ) ) ( not ( = ?auto_857864 ?auto_857872 ) ) ( not ( = ?auto_857864 ?auto_857873 ) ) ( not ( = ?auto_857864 ?auto_857874 ) ) ( not ( = ?auto_857864 ?auto_857875 ) ) ( not ( = ?auto_857865 ?auto_857866 ) ) ( not ( = ?auto_857865 ?auto_857867 ) ) ( not ( = ?auto_857865 ?auto_857868 ) ) ( not ( = ?auto_857865 ?auto_857869 ) ) ( not ( = ?auto_857865 ?auto_857870 ) ) ( not ( = ?auto_857865 ?auto_857871 ) ) ( not ( = ?auto_857865 ?auto_857872 ) ) ( not ( = ?auto_857865 ?auto_857873 ) ) ( not ( = ?auto_857865 ?auto_857874 ) ) ( not ( = ?auto_857865 ?auto_857875 ) ) ( not ( = ?auto_857866 ?auto_857867 ) ) ( not ( = ?auto_857866 ?auto_857868 ) ) ( not ( = ?auto_857866 ?auto_857869 ) ) ( not ( = ?auto_857866 ?auto_857870 ) ) ( not ( = ?auto_857866 ?auto_857871 ) ) ( not ( = ?auto_857866 ?auto_857872 ) ) ( not ( = ?auto_857866 ?auto_857873 ) ) ( not ( = ?auto_857866 ?auto_857874 ) ) ( not ( = ?auto_857866 ?auto_857875 ) ) ( not ( = ?auto_857867 ?auto_857868 ) ) ( not ( = ?auto_857867 ?auto_857869 ) ) ( not ( = ?auto_857867 ?auto_857870 ) ) ( not ( = ?auto_857867 ?auto_857871 ) ) ( not ( = ?auto_857867 ?auto_857872 ) ) ( not ( = ?auto_857867 ?auto_857873 ) ) ( not ( = ?auto_857867 ?auto_857874 ) ) ( not ( = ?auto_857867 ?auto_857875 ) ) ( not ( = ?auto_857868 ?auto_857869 ) ) ( not ( = ?auto_857868 ?auto_857870 ) ) ( not ( = ?auto_857868 ?auto_857871 ) ) ( not ( = ?auto_857868 ?auto_857872 ) ) ( not ( = ?auto_857868 ?auto_857873 ) ) ( not ( = ?auto_857868 ?auto_857874 ) ) ( not ( = ?auto_857868 ?auto_857875 ) ) ( not ( = ?auto_857869 ?auto_857870 ) ) ( not ( = ?auto_857869 ?auto_857871 ) ) ( not ( = ?auto_857869 ?auto_857872 ) ) ( not ( = ?auto_857869 ?auto_857873 ) ) ( not ( = ?auto_857869 ?auto_857874 ) ) ( not ( = ?auto_857869 ?auto_857875 ) ) ( not ( = ?auto_857870 ?auto_857871 ) ) ( not ( = ?auto_857870 ?auto_857872 ) ) ( not ( = ?auto_857870 ?auto_857873 ) ) ( not ( = ?auto_857870 ?auto_857874 ) ) ( not ( = ?auto_857870 ?auto_857875 ) ) ( not ( = ?auto_857871 ?auto_857872 ) ) ( not ( = ?auto_857871 ?auto_857873 ) ) ( not ( = ?auto_857871 ?auto_857874 ) ) ( not ( = ?auto_857871 ?auto_857875 ) ) ( not ( = ?auto_857872 ?auto_857873 ) ) ( not ( = ?auto_857872 ?auto_857874 ) ) ( not ( = ?auto_857872 ?auto_857875 ) ) ( not ( = ?auto_857873 ?auto_857874 ) ) ( not ( = ?auto_857873 ?auto_857875 ) ) ( not ( = ?auto_857874 ?auto_857875 ) ) ( ON ?auto_857873 ?auto_857874 ) ( ON ?auto_857872 ?auto_857873 ) ( ON ?auto_857871 ?auto_857872 ) ( ON ?auto_857870 ?auto_857871 ) ( ON ?auto_857869 ?auto_857870 ) ( CLEAR ?auto_857867 ) ( ON ?auto_857868 ?auto_857869 ) ( CLEAR ?auto_857868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_857861 ?auto_857862 ?auto_857863 ?auto_857864 ?auto_857865 ?auto_857866 ?auto_857867 ?auto_857868 )
      ( MAKE-14PILE ?auto_857861 ?auto_857862 ?auto_857863 ?auto_857864 ?auto_857865 ?auto_857866 ?auto_857867 ?auto_857868 ?auto_857869 ?auto_857870 ?auto_857871 ?auto_857872 ?auto_857873 ?auto_857874 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_857919 - BLOCK
      ?auto_857920 - BLOCK
      ?auto_857921 - BLOCK
      ?auto_857922 - BLOCK
      ?auto_857923 - BLOCK
      ?auto_857924 - BLOCK
      ?auto_857925 - BLOCK
      ?auto_857926 - BLOCK
      ?auto_857927 - BLOCK
      ?auto_857928 - BLOCK
      ?auto_857929 - BLOCK
      ?auto_857930 - BLOCK
      ?auto_857931 - BLOCK
      ?auto_857932 - BLOCK
    )
    :vars
    (
      ?auto_857933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857932 ?auto_857933 ) ( ON-TABLE ?auto_857919 ) ( ON ?auto_857920 ?auto_857919 ) ( ON ?auto_857921 ?auto_857920 ) ( ON ?auto_857922 ?auto_857921 ) ( ON ?auto_857923 ?auto_857922 ) ( ON ?auto_857924 ?auto_857923 ) ( not ( = ?auto_857919 ?auto_857920 ) ) ( not ( = ?auto_857919 ?auto_857921 ) ) ( not ( = ?auto_857919 ?auto_857922 ) ) ( not ( = ?auto_857919 ?auto_857923 ) ) ( not ( = ?auto_857919 ?auto_857924 ) ) ( not ( = ?auto_857919 ?auto_857925 ) ) ( not ( = ?auto_857919 ?auto_857926 ) ) ( not ( = ?auto_857919 ?auto_857927 ) ) ( not ( = ?auto_857919 ?auto_857928 ) ) ( not ( = ?auto_857919 ?auto_857929 ) ) ( not ( = ?auto_857919 ?auto_857930 ) ) ( not ( = ?auto_857919 ?auto_857931 ) ) ( not ( = ?auto_857919 ?auto_857932 ) ) ( not ( = ?auto_857919 ?auto_857933 ) ) ( not ( = ?auto_857920 ?auto_857921 ) ) ( not ( = ?auto_857920 ?auto_857922 ) ) ( not ( = ?auto_857920 ?auto_857923 ) ) ( not ( = ?auto_857920 ?auto_857924 ) ) ( not ( = ?auto_857920 ?auto_857925 ) ) ( not ( = ?auto_857920 ?auto_857926 ) ) ( not ( = ?auto_857920 ?auto_857927 ) ) ( not ( = ?auto_857920 ?auto_857928 ) ) ( not ( = ?auto_857920 ?auto_857929 ) ) ( not ( = ?auto_857920 ?auto_857930 ) ) ( not ( = ?auto_857920 ?auto_857931 ) ) ( not ( = ?auto_857920 ?auto_857932 ) ) ( not ( = ?auto_857920 ?auto_857933 ) ) ( not ( = ?auto_857921 ?auto_857922 ) ) ( not ( = ?auto_857921 ?auto_857923 ) ) ( not ( = ?auto_857921 ?auto_857924 ) ) ( not ( = ?auto_857921 ?auto_857925 ) ) ( not ( = ?auto_857921 ?auto_857926 ) ) ( not ( = ?auto_857921 ?auto_857927 ) ) ( not ( = ?auto_857921 ?auto_857928 ) ) ( not ( = ?auto_857921 ?auto_857929 ) ) ( not ( = ?auto_857921 ?auto_857930 ) ) ( not ( = ?auto_857921 ?auto_857931 ) ) ( not ( = ?auto_857921 ?auto_857932 ) ) ( not ( = ?auto_857921 ?auto_857933 ) ) ( not ( = ?auto_857922 ?auto_857923 ) ) ( not ( = ?auto_857922 ?auto_857924 ) ) ( not ( = ?auto_857922 ?auto_857925 ) ) ( not ( = ?auto_857922 ?auto_857926 ) ) ( not ( = ?auto_857922 ?auto_857927 ) ) ( not ( = ?auto_857922 ?auto_857928 ) ) ( not ( = ?auto_857922 ?auto_857929 ) ) ( not ( = ?auto_857922 ?auto_857930 ) ) ( not ( = ?auto_857922 ?auto_857931 ) ) ( not ( = ?auto_857922 ?auto_857932 ) ) ( not ( = ?auto_857922 ?auto_857933 ) ) ( not ( = ?auto_857923 ?auto_857924 ) ) ( not ( = ?auto_857923 ?auto_857925 ) ) ( not ( = ?auto_857923 ?auto_857926 ) ) ( not ( = ?auto_857923 ?auto_857927 ) ) ( not ( = ?auto_857923 ?auto_857928 ) ) ( not ( = ?auto_857923 ?auto_857929 ) ) ( not ( = ?auto_857923 ?auto_857930 ) ) ( not ( = ?auto_857923 ?auto_857931 ) ) ( not ( = ?auto_857923 ?auto_857932 ) ) ( not ( = ?auto_857923 ?auto_857933 ) ) ( not ( = ?auto_857924 ?auto_857925 ) ) ( not ( = ?auto_857924 ?auto_857926 ) ) ( not ( = ?auto_857924 ?auto_857927 ) ) ( not ( = ?auto_857924 ?auto_857928 ) ) ( not ( = ?auto_857924 ?auto_857929 ) ) ( not ( = ?auto_857924 ?auto_857930 ) ) ( not ( = ?auto_857924 ?auto_857931 ) ) ( not ( = ?auto_857924 ?auto_857932 ) ) ( not ( = ?auto_857924 ?auto_857933 ) ) ( not ( = ?auto_857925 ?auto_857926 ) ) ( not ( = ?auto_857925 ?auto_857927 ) ) ( not ( = ?auto_857925 ?auto_857928 ) ) ( not ( = ?auto_857925 ?auto_857929 ) ) ( not ( = ?auto_857925 ?auto_857930 ) ) ( not ( = ?auto_857925 ?auto_857931 ) ) ( not ( = ?auto_857925 ?auto_857932 ) ) ( not ( = ?auto_857925 ?auto_857933 ) ) ( not ( = ?auto_857926 ?auto_857927 ) ) ( not ( = ?auto_857926 ?auto_857928 ) ) ( not ( = ?auto_857926 ?auto_857929 ) ) ( not ( = ?auto_857926 ?auto_857930 ) ) ( not ( = ?auto_857926 ?auto_857931 ) ) ( not ( = ?auto_857926 ?auto_857932 ) ) ( not ( = ?auto_857926 ?auto_857933 ) ) ( not ( = ?auto_857927 ?auto_857928 ) ) ( not ( = ?auto_857927 ?auto_857929 ) ) ( not ( = ?auto_857927 ?auto_857930 ) ) ( not ( = ?auto_857927 ?auto_857931 ) ) ( not ( = ?auto_857927 ?auto_857932 ) ) ( not ( = ?auto_857927 ?auto_857933 ) ) ( not ( = ?auto_857928 ?auto_857929 ) ) ( not ( = ?auto_857928 ?auto_857930 ) ) ( not ( = ?auto_857928 ?auto_857931 ) ) ( not ( = ?auto_857928 ?auto_857932 ) ) ( not ( = ?auto_857928 ?auto_857933 ) ) ( not ( = ?auto_857929 ?auto_857930 ) ) ( not ( = ?auto_857929 ?auto_857931 ) ) ( not ( = ?auto_857929 ?auto_857932 ) ) ( not ( = ?auto_857929 ?auto_857933 ) ) ( not ( = ?auto_857930 ?auto_857931 ) ) ( not ( = ?auto_857930 ?auto_857932 ) ) ( not ( = ?auto_857930 ?auto_857933 ) ) ( not ( = ?auto_857931 ?auto_857932 ) ) ( not ( = ?auto_857931 ?auto_857933 ) ) ( not ( = ?auto_857932 ?auto_857933 ) ) ( ON ?auto_857931 ?auto_857932 ) ( ON ?auto_857930 ?auto_857931 ) ( ON ?auto_857929 ?auto_857930 ) ( ON ?auto_857928 ?auto_857929 ) ( ON ?auto_857927 ?auto_857928 ) ( ON ?auto_857926 ?auto_857927 ) ( CLEAR ?auto_857924 ) ( ON ?auto_857925 ?auto_857926 ) ( CLEAR ?auto_857925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_857919 ?auto_857920 ?auto_857921 ?auto_857922 ?auto_857923 ?auto_857924 ?auto_857925 )
      ( MAKE-14PILE ?auto_857919 ?auto_857920 ?auto_857921 ?auto_857922 ?auto_857923 ?auto_857924 ?auto_857925 ?auto_857926 ?auto_857927 ?auto_857928 ?auto_857929 ?auto_857930 ?auto_857931 ?auto_857932 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_857977 - BLOCK
      ?auto_857978 - BLOCK
      ?auto_857979 - BLOCK
      ?auto_857980 - BLOCK
      ?auto_857981 - BLOCK
      ?auto_857982 - BLOCK
      ?auto_857983 - BLOCK
      ?auto_857984 - BLOCK
      ?auto_857985 - BLOCK
      ?auto_857986 - BLOCK
      ?auto_857987 - BLOCK
      ?auto_857988 - BLOCK
      ?auto_857989 - BLOCK
      ?auto_857990 - BLOCK
    )
    :vars
    (
      ?auto_857991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_857990 ?auto_857991 ) ( ON-TABLE ?auto_857977 ) ( ON ?auto_857978 ?auto_857977 ) ( ON ?auto_857979 ?auto_857978 ) ( ON ?auto_857980 ?auto_857979 ) ( ON ?auto_857981 ?auto_857980 ) ( not ( = ?auto_857977 ?auto_857978 ) ) ( not ( = ?auto_857977 ?auto_857979 ) ) ( not ( = ?auto_857977 ?auto_857980 ) ) ( not ( = ?auto_857977 ?auto_857981 ) ) ( not ( = ?auto_857977 ?auto_857982 ) ) ( not ( = ?auto_857977 ?auto_857983 ) ) ( not ( = ?auto_857977 ?auto_857984 ) ) ( not ( = ?auto_857977 ?auto_857985 ) ) ( not ( = ?auto_857977 ?auto_857986 ) ) ( not ( = ?auto_857977 ?auto_857987 ) ) ( not ( = ?auto_857977 ?auto_857988 ) ) ( not ( = ?auto_857977 ?auto_857989 ) ) ( not ( = ?auto_857977 ?auto_857990 ) ) ( not ( = ?auto_857977 ?auto_857991 ) ) ( not ( = ?auto_857978 ?auto_857979 ) ) ( not ( = ?auto_857978 ?auto_857980 ) ) ( not ( = ?auto_857978 ?auto_857981 ) ) ( not ( = ?auto_857978 ?auto_857982 ) ) ( not ( = ?auto_857978 ?auto_857983 ) ) ( not ( = ?auto_857978 ?auto_857984 ) ) ( not ( = ?auto_857978 ?auto_857985 ) ) ( not ( = ?auto_857978 ?auto_857986 ) ) ( not ( = ?auto_857978 ?auto_857987 ) ) ( not ( = ?auto_857978 ?auto_857988 ) ) ( not ( = ?auto_857978 ?auto_857989 ) ) ( not ( = ?auto_857978 ?auto_857990 ) ) ( not ( = ?auto_857978 ?auto_857991 ) ) ( not ( = ?auto_857979 ?auto_857980 ) ) ( not ( = ?auto_857979 ?auto_857981 ) ) ( not ( = ?auto_857979 ?auto_857982 ) ) ( not ( = ?auto_857979 ?auto_857983 ) ) ( not ( = ?auto_857979 ?auto_857984 ) ) ( not ( = ?auto_857979 ?auto_857985 ) ) ( not ( = ?auto_857979 ?auto_857986 ) ) ( not ( = ?auto_857979 ?auto_857987 ) ) ( not ( = ?auto_857979 ?auto_857988 ) ) ( not ( = ?auto_857979 ?auto_857989 ) ) ( not ( = ?auto_857979 ?auto_857990 ) ) ( not ( = ?auto_857979 ?auto_857991 ) ) ( not ( = ?auto_857980 ?auto_857981 ) ) ( not ( = ?auto_857980 ?auto_857982 ) ) ( not ( = ?auto_857980 ?auto_857983 ) ) ( not ( = ?auto_857980 ?auto_857984 ) ) ( not ( = ?auto_857980 ?auto_857985 ) ) ( not ( = ?auto_857980 ?auto_857986 ) ) ( not ( = ?auto_857980 ?auto_857987 ) ) ( not ( = ?auto_857980 ?auto_857988 ) ) ( not ( = ?auto_857980 ?auto_857989 ) ) ( not ( = ?auto_857980 ?auto_857990 ) ) ( not ( = ?auto_857980 ?auto_857991 ) ) ( not ( = ?auto_857981 ?auto_857982 ) ) ( not ( = ?auto_857981 ?auto_857983 ) ) ( not ( = ?auto_857981 ?auto_857984 ) ) ( not ( = ?auto_857981 ?auto_857985 ) ) ( not ( = ?auto_857981 ?auto_857986 ) ) ( not ( = ?auto_857981 ?auto_857987 ) ) ( not ( = ?auto_857981 ?auto_857988 ) ) ( not ( = ?auto_857981 ?auto_857989 ) ) ( not ( = ?auto_857981 ?auto_857990 ) ) ( not ( = ?auto_857981 ?auto_857991 ) ) ( not ( = ?auto_857982 ?auto_857983 ) ) ( not ( = ?auto_857982 ?auto_857984 ) ) ( not ( = ?auto_857982 ?auto_857985 ) ) ( not ( = ?auto_857982 ?auto_857986 ) ) ( not ( = ?auto_857982 ?auto_857987 ) ) ( not ( = ?auto_857982 ?auto_857988 ) ) ( not ( = ?auto_857982 ?auto_857989 ) ) ( not ( = ?auto_857982 ?auto_857990 ) ) ( not ( = ?auto_857982 ?auto_857991 ) ) ( not ( = ?auto_857983 ?auto_857984 ) ) ( not ( = ?auto_857983 ?auto_857985 ) ) ( not ( = ?auto_857983 ?auto_857986 ) ) ( not ( = ?auto_857983 ?auto_857987 ) ) ( not ( = ?auto_857983 ?auto_857988 ) ) ( not ( = ?auto_857983 ?auto_857989 ) ) ( not ( = ?auto_857983 ?auto_857990 ) ) ( not ( = ?auto_857983 ?auto_857991 ) ) ( not ( = ?auto_857984 ?auto_857985 ) ) ( not ( = ?auto_857984 ?auto_857986 ) ) ( not ( = ?auto_857984 ?auto_857987 ) ) ( not ( = ?auto_857984 ?auto_857988 ) ) ( not ( = ?auto_857984 ?auto_857989 ) ) ( not ( = ?auto_857984 ?auto_857990 ) ) ( not ( = ?auto_857984 ?auto_857991 ) ) ( not ( = ?auto_857985 ?auto_857986 ) ) ( not ( = ?auto_857985 ?auto_857987 ) ) ( not ( = ?auto_857985 ?auto_857988 ) ) ( not ( = ?auto_857985 ?auto_857989 ) ) ( not ( = ?auto_857985 ?auto_857990 ) ) ( not ( = ?auto_857985 ?auto_857991 ) ) ( not ( = ?auto_857986 ?auto_857987 ) ) ( not ( = ?auto_857986 ?auto_857988 ) ) ( not ( = ?auto_857986 ?auto_857989 ) ) ( not ( = ?auto_857986 ?auto_857990 ) ) ( not ( = ?auto_857986 ?auto_857991 ) ) ( not ( = ?auto_857987 ?auto_857988 ) ) ( not ( = ?auto_857987 ?auto_857989 ) ) ( not ( = ?auto_857987 ?auto_857990 ) ) ( not ( = ?auto_857987 ?auto_857991 ) ) ( not ( = ?auto_857988 ?auto_857989 ) ) ( not ( = ?auto_857988 ?auto_857990 ) ) ( not ( = ?auto_857988 ?auto_857991 ) ) ( not ( = ?auto_857989 ?auto_857990 ) ) ( not ( = ?auto_857989 ?auto_857991 ) ) ( not ( = ?auto_857990 ?auto_857991 ) ) ( ON ?auto_857989 ?auto_857990 ) ( ON ?auto_857988 ?auto_857989 ) ( ON ?auto_857987 ?auto_857988 ) ( ON ?auto_857986 ?auto_857987 ) ( ON ?auto_857985 ?auto_857986 ) ( ON ?auto_857984 ?auto_857985 ) ( ON ?auto_857983 ?auto_857984 ) ( CLEAR ?auto_857981 ) ( ON ?auto_857982 ?auto_857983 ) ( CLEAR ?auto_857982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_857977 ?auto_857978 ?auto_857979 ?auto_857980 ?auto_857981 ?auto_857982 )
      ( MAKE-14PILE ?auto_857977 ?auto_857978 ?auto_857979 ?auto_857980 ?auto_857981 ?auto_857982 ?auto_857983 ?auto_857984 ?auto_857985 ?auto_857986 ?auto_857987 ?auto_857988 ?auto_857989 ?auto_857990 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_858035 - BLOCK
      ?auto_858036 - BLOCK
      ?auto_858037 - BLOCK
      ?auto_858038 - BLOCK
      ?auto_858039 - BLOCK
      ?auto_858040 - BLOCK
      ?auto_858041 - BLOCK
      ?auto_858042 - BLOCK
      ?auto_858043 - BLOCK
      ?auto_858044 - BLOCK
      ?auto_858045 - BLOCK
      ?auto_858046 - BLOCK
      ?auto_858047 - BLOCK
      ?auto_858048 - BLOCK
    )
    :vars
    (
      ?auto_858049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858048 ?auto_858049 ) ( ON-TABLE ?auto_858035 ) ( ON ?auto_858036 ?auto_858035 ) ( ON ?auto_858037 ?auto_858036 ) ( ON ?auto_858038 ?auto_858037 ) ( not ( = ?auto_858035 ?auto_858036 ) ) ( not ( = ?auto_858035 ?auto_858037 ) ) ( not ( = ?auto_858035 ?auto_858038 ) ) ( not ( = ?auto_858035 ?auto_858039 ) ) ( not ( = ?auto_858035 ?auto_858040 ) ) ( not ( = ?auto_858035 ?auto_858041 ) ) ( not ( = ?auto_858035 ?auto_858042 ) ) ( not ( = ?auto_858035 ?auto_858043 ) ) ( not ( = ?auto_858035 ?auto_858044 ) ) ( not ( = ?auto_858035 ?auto_858045 ) ) ( not ( = ?auto_858035 ?auto_858046 ) ) ( not ( = ?auto_858035 ?auto_858047 ) ) ( not ( = ?auto_858035 ?auto_858048 ) ) ( not ( = ?auto_858035 ?auto_858049 ) ) ( not ( = ?auto_858036 ?auto_858037 ) ) ( not ( = ?auto_858036 ?auto_858038 ) ) ( not ( = ?auto_858036 ?auto_858039 ) ) ( not ( = ?auto_858036 ?auto_858040 ) ) ( not ( = ?auto_858036 ?auto_858041 ) ) ( not ( = ?auto_858036 ?auto_858042 ) ) ( not ( = ?auto_858036 ?auto_858043 ) ) ( not ( = ?auto_858036 ?auto_858044 ) ) ( not ( = ?auto_858036 ?auto_858045 ) ) ( not ( = ?auto_858036 ?auto_858046 ) ) ( not ( = ?auto_858036 ?auto_858047 ) ) ( not ( = ?auto_858036 ?auto_858048 ) ) ( not ( = ?auto_858036 ?auto_858049 ) ) ( not ( = ?auto_858037 ?auto_858038 ) ) ( not ( = ?auto_858037 ?auto_858039 ) ) ( not ( = ?auto_858037 ?auto_858040 ) ) ( not ( = ?auto_858037 ?auto_858041 ) ) ( not ( = ?auto_858037 ?auto_858042 ) ) ( not ( = ?auto_858037 ?auto_858043 ) ) ( not ( = ?auto_858037 ?auto_858044 ) ) ( not ( = ?auto_858037 ?auto_858045 ) ) ( not ( = ?auto_858037 ?auto_858046 ) ) ( not ( = ?auto_858037 ?auto_858047 ) ) ( not ( = ?auto_858037 ?auto_858048 ) ) ( not ( = ?auto_858037 ?auto_858049 ) ) ( not ( = ?auto_858038 ?auto_858039 ) ) ( not ( = ?auto_858038 ?auto_858040 ) ) ( not ( = ?auto_858038 ?auto_858041 ) ) ( not ( = ?auto_858038 ?auto_858042 ) ) ( not ( = ?auto_858038 ?auto_858043 ) ) ( not ( = ?auto_858038 ?auto_858044 ) ) ( not ( = ?auto_858038 ?auto_858045 ) ) ( not ( = ?auto_858038 ?auto_858046 ) ) ( not ( = ?auto_858038 ?auto_858047 ) ) ( not ( = ?auto_858038 ?auto_858048 ) ) ( not ( = ?auto_858038 ?auto_858049 ) ) ( not ( = ?auto_858039 ?auto_858040 ) ) ( not ( = ?auto_858039 ?auto_858041 ) ) ( not ( = ?auto_858039 ?auto_858042 ) ) ( not ( = ?auto_858039 ?auto_858043 ) ) ( not ( = ?auto_858039 ?auto_858044 ) ) ( not ( = ?auto_858039 ?auto_858045 ) ) ( not ( = ?auto_858039 ?auto_858046 ) ) ( not ( = ?auto_858039 ?auto_858047 ) ) ( not ( = ?auto_858039 ?auto_858048 ) ) ( not ( = ?auto_858039 ?auto_858049 ) ) ( not ( = ?auto_858040 ?auto_858041 ) ) ( not ( = ?auto_858040 ?auto_858042 ) ) ( not ( = ?auto_858040 ?auto_858043 ) ) ( not ( = ?auto_858040 ?auto_858044 ) ) ( not ( = ?auto_858040 ?auto_858045 ) ) ( not ( = ?auto_858040 ?auto_858046 ) ) ( not ( = ?auto_858040 ?auto_858047 ) ) ( not ( = ?auto_858040 ?auto_858048 ) ) ( not ( = ?auto_858040 ?auto_858049 ) ) ( not ( = ?auto_858041 ?auto_858042 ) ) ( not ( = ?auto_858041 ?auto_858043 ) ) ( not ( = ?auto_858041 ?auto_858044 ) ) ( not ( = ?auto_858041 ?auto_858045 ) ) ( not ( = ?auto_858041 ?auto_858046 ) ) ( not ( = ?auto_858041 ?auto_858047 ) ) ( not ( = ?auto_858041 ?auto_858048 ) ) ( not ( = ?auto_858041 ?auto_858049 ) ) ( not ( = ?auto_858042 ?auto_858043 ) ) ( not ( = ?auto_858042 ?auto_858044 ) ) ( not ( = ?auto_858042 ?auto_858045 ) ) ( not ( = ?auto_858042 ?auto_858046 ) ) ( not ( = ?auto_858042 ?auto_858047 ) ) ( not ( = ?auto_858042 ?auto_858048 ) ) ( not ( = ?auto_858042 ?auto_858049 ) ) ( not ( = ?auto_858043 ?auto_858044 ) ) ( not ( = ?auto_858043 ?auto_858045 ) ) ( not ( = ?auto_858043 ?auto_858046 ) ) ( not ( = ?auto_858043 ?auto_858047 ) ) ( not ( = ?auto_858043 ?auto_858048 ) ) ( not ( = ?auto_858043 ?auto_858049 ) ) ( not ( = ?auto_858044 ?auto_858045 ) ) ( not ( = ?auto_858044 ?auto_858046 ) ) ( not ( = ?auto_858044 ?auto_858047 ) ) ( not ( = ?auto_858044 ?auto_858048 ) ) ( not ( = ?auto_858044 ?auto_858049 ) ) ( not ( = ?auto_858045 ?auto_858046 ) ) ( not ( = ?auto_858045 ?auto_858047 ) ) ( not ( = ?auto_858045 ?auto_858048 ) ) ( not ( = ?auto_858045 ?auto_858049 ) ) ( not ( = ?auto_858046 ?auto_858047 ) ) ( not ( = ?auto_858046 ?auto_858048 ) ) ( not ( = ?auto_858046 ?auto_858049 ) ) ( not ( = ?auto_858047 ?auto_858048 ) ) ( not ( = ?auto_858047 ?auto_858049 ) ) ( not ( = ?auto_858048 ?auto_858049 ) ) ( ON ?auto_858047 ?auto_858048 ) ( ON ?auto_858046 ?auto_858047 ) ( ON ?auto_858045 ?auto_858046 ) ( ON ?auto_858044 ?auto_858045 ) ( ON ?auto_858043 ?auto_858044 ) ( ON ?auto_858042 ?auto_858043 ) ( ON ?auto_858041 ?auto_858042 ) ( ON ?auto_858040 ?auto_858041 ) ( CLEAR ?auto_858038 ) ( ON ?auto_858039 ?auto_858040 ) ( CLEAR ?auto_858039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_858035 ?auto_858036 ?auto_858037 ?auto_858038 ?auto_858039 )
      ( MAKE-14PILE ?auto_858035 ?auto_858036 ?auto_858037 ?auto_858038 ?auto_858039 ?auto_858040 ?auto_858041 ?auto_858042 ?auto_858043 ?auto_858044 ?auto_858045 ?auto_858046 ?auto_858047 ?auto_858048 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_858093 - BLOCK
      ?auto_858094 - BLOCK
      ?auto_858095 - BLOCK
      ?auto_858096 - BLOCK
      ?auto_858097 - BLOCK
      ?auto_858098 - BLOCK
      ?auto_858099 - BLOCK
      ?auto_858100 - BLOCK
      ?auto_858101 - BLOCK
      ?auto_858102 - BLOCK
      ?auto_858103 - BLOCK
      ?auto_858104 - BLOCK
      ?auto_858105 - BLOCK
      ?auto_858106 - BLOCK
    )
    :vars
    (
      ?auto_858107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858106 ?auto_858107 ) ( ON-TABLE ?auto_858093 ) ( ON ?auto_858094 ?auto_858093 ) ( ON ?auto_858095 ?auto_858094 ) ( not ( = ?auto_858093 ?auto_858094 ) ) ( not ( = ?auto_858093 ?auto_858095 ) ) ( not ( = ?auto_858093 ?auto_858096 ) ) ( not ( = ?auto_858093 ?auto_858097 ) ) ( not ( = ?auto_858093 ?auto_858098 ) ) ( not ( = ?auto_858093 ?auto_858099 ) ) ( not ( = ?auto_858093 ?auto_858100 ) ) ( not ( = ?auto_858093 ?auto_858101 ) ) ( not ( = ?auto_858093 ?auto_858102 ) ) ( not ( = ?auto_858093 ?auto_858103 ) ) ( not ( = ?auto_858093 ?auto_858104 ) ) ( not ( = ?auto_858093 ?auto_858105 ) ) ( not ( = ?auto_858093 ?auto_858106 ) ) ( not ( = ?auto_858093 ?auto_858107 ) ) ( not ( = ?auto_858094 ?auto_858095 ) ) ( not ( = ?auto_858094 ?auto_858096 ) ) ( not ( = ?auto_858094 ?auto_858097 ) ) ( not ( = ?auto_858094 ?auto_858098 ) ) ( not ( = ?auto_858094 ?auto_858099 ) ) ( not ( = ?auto_858094 ?auto_858100 ) ) ( not ( = ?auto_858094 ?auto_858101 ) ) ( not ( = ?auto_858094 ?auto_858102 ) ) ( not ( = ?auto_858094 ?auto_858103 ) ) ( not ( = ?auto_858094 ?auto_858104 ) ) ( not ( = ?auto_858094 ?auto_858105 ) ) ( not ( = ?auto_858094 ?auto_858106 ) ) ( not ( = ?auto_858094 ?auto_858107 ) ) ( not ( = ?auto_858095 ?auto_858096 ) ) ( not ( = ?auto_858095 ?auto_858097 ) ) ( not ( = ?auto_858095 ?auto_858098 ) ) ( not ( = ?auto_858095 ?auto_858099 ) ) ( not ( = ?auto_858095 ?auto_858100 ) ) ( not ( = ?auto_858095 ?auto_858101 ) ) ( not ( = ?auto_858095 ?auto_858102 ) ) ( not ( = ?auto_858095 ?auto_858103 ) ) ( not ( = ?auto_858095 ?auto_858104 ) ) ( not ( = ?auto_858095 ?auto_858105 ) ) ( not ( = ?auto_858095 ?auto_858106 ) ) ( not ( = ?auto_858095 ?auto_858107 ) ) ( not ( = ?auto_858096 ?auto_858097 ) ) ( not ( = ?auto_858096 ?auto_858098 ) ) ( not ( = ?auto_858096 ?auto_858099 ) ) ( not ( = ?auto_858096 ?auto_858100 ) ) ( not ( = ?auto_858096 ?auto_858101 ) ) ( not ( = ?auto_858096 ?auto_858102 ) ) ( not ( = ?auto_858096 ?auto_858103 ) ) ( not ( = ?auto_858096 ?auto_858104 ) ) ( not ( = ?auto_858096 ?auto_858105 ) ) ( not ( = ?auto_858096 ?auto_858106 ) ) ( not ( = ?auto_858096 ?auto_858107 ) ) ( not ( = ?auto_858097 ?auto_858098 ) ) ( not ( = ?auto_858097 ?auto_858099 ) ) ( not ( = ?auto_858097 ?auto_858100 ) ) ( not ( = ?auto_858097 ?auto_858101 ) ) ( not ( = ?auto_858097 ?auto_858102 ) ) ( not ( = ?auto_858097 ?auto_858103 ) ) ( not ( = ?auto_858097 ?auto_858104 ) ) ( not ( = ?auto_858097 ?auto_858105 ) ) ( not ( = ?auto_858097 ?auto_858106 ) ) ( not ( = ?auto_858097 ?auto_858107 ) ) ( not ( = ?auto_858098 ?auto_858099 ) ) ( not ( = ?auto_858098 ?auto_858100 ) ) ( not ( = ?auto_858098 ?auto_858101 ) ) ( not ( = ?auto_858098 ?auto_858102 ) ) ( not ( = ?auto_858098 ?auto_858103 ) ) ( not ( = ?auto_858098 ?auto_858104 ) ) ( not ( = ?auto_858098 ?auto_858105 ) ) ( not ( = ?auto_858098 ?auto_858106 ) ) ( not ( = ?auto_858098 ?auto_858107 ) ) ( not ( = ?auto_858099 ?auto_858100 ) ) ( not ( = ?auto_858099 ?auto_858101 ) ) ( not ( = ?auto_858099 ?auto_858102 ) ) ( not ( = ?auto_858099 ?auto_858103 ) ) ( not ( = ?auto_858099 ?auto_858104 ) ) ( not ( = ?auto_858099 ?auto_858105 ) ) ( not ( = ?auto_858099 ?auto_858106 ) ) ( not ( = ?auto_858099 ?auto_858107 ) ) ( not ( = ?auto_858100 ?auto_858101 ) ) ( not ( = ?auto_858100 ?auto_858102 ) ) ( not ( = ?auto_858100 ?auto_858103 ) ) ( not ( = ?auto_858100 ?auto_858104 ) ) ( not ( = ?auto_858100 ?auto_858105 ) ) ( not ( = ?auto_858100 ?auto_858106 ) ) ( not ( = ?auto_858100 ?auto_858107 ) ) ( not ( = ?auto_858101 ?auto_858102 ) ) ( not ( = ?auto_858101 ?auto_858103 ) ) ( not ( = ?auto_858101 ?auto_858104 ) ) ( not ( = ?auto_858101 ?auto_858105 ) ) ( not ( = ?auto_858101 ?auto_858106 ) ) ( not ( = ?auto_858101 ?auto_858107 ) ) ( not ( = ?auto_858102 ?auto_858103 ) ) ( not ( = ?auto_858102 ?auto_858104 ) ) ( not ( = ?auto_858102 ?auto_858105 ) ) ( not ( = ?auto_858102 ?auto_858106 ) ) ( not ( = ?auto_858102 ?auto_858107 ) ) ( not ( = ?auto_858103 ?auto_858104 ) ) ( not ( = ?auto_858103 ?auto_858105 ) ) ( not ( = ?auto_858103 ?auto_858106 ) ) ( not ( = ?auto_858103 ?auto_858107 ) ) ( not ( = ?auto_858104 ?auto_858105 ) ) ( not ( = ?auto_858104 ?auto_858106 ) ) ( not ( = ?auto_858104 ?auto_858107 ) ) ( not ( = ?auto_858105 ?auto_858106 ) ) ( not ( = ?auto_858105 ?auto_858107 ) ) ( not ( = ?auto_858106 ?auto_858107 ) ) ( ON ?auto_858105 ?auto_858106 ) ( ON ?auto_858104 ?auto_858105 ) ( ON ?auto_858103 ?auto_858104 ) ( ON ?auto_858102 ?auto_858103 ) ( ON ?auto_858101 ?auto_858102 ) ( ON ?auto_858100 ?auto_858101 ) ( ON ?auto_858099 ?auto_858100 ) ( ON ?auto_858098 ?auto_858099 ) ( ON ?auto_858097 ?auto_858098 ) ( CLEAR ?auto_858095 ) ( ON ?auto_858096 ?auto_858097 ) ( CLEAR ?auto_858096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_858093 ?auto_858094 ?auto_858095 ?auto_858096 )
      ( MAKE-14PILE ?auto_858093 ?auto_858094 ?auto_858095 ?auto_858096 ?auto_858097 ?auto_858098 ?auto_858099 ?auto_858100 ?auto_858101 ?auto_858102 ?auto_858103 ?auto_858104 ?auto_858105 ?auto_858106 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_858151 - BLOCK
      ?auto_858152 - BLOCK
      ?auto_858153 - BLOCK
      ?auto_858154 - BLOCK
      ?auto_858155 - BLOCK
      ?auto_858156 - BLOCK
      ?auto_858157 - BLOCK
      ?auto_858158 - BLOCK
      ?auto_858159 - BLOCK
      ?auto_858160 - BLOCK
      ?auto_858161 - BLOCK
      ?auto_858162 - BLOCK
      ?auto_858163 - BLOCK
      ?auto_858164 - BLOCK
    )
    :vars
    (
      ?auto_858165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858164 ?auto_858165 ) ( ON-TABLE ?auto_858151 ) ( ON ?auto_858152 ?auto_858151 ) ( not ( = ?auto_858151 ?auto_858152 ) ) ( not ( = ?auto_858151 ?auto_858153 ) ) ( not ( = ?auto_858151 ?auto_858154 ) ) ( not ( = ?auto_858151 ?auto_858155 ) ) ( not ( = ?auto_858151 ?auto_858156 ) ) ( not ( = ?auto_858151 ?auto_858157 ) ) ( not ( = ?auto_858151 ?auto_858158 ) ) ( not ( = ?auto_858151 ?auto_858159 ) ) ( not ( = ?auto_858151 ?auto_858160 ) ) ( not ( = ?auto_858151 ?auto_858161 ) ) ( not ( = ?auto_858151 ?auto_858162 ) ) ( not ( = ?auto_858151 ?auto_858163 ) ) ( not ( = ?auto_858151 ?auto_858164 ) ) ( not ( = ?auto_858151 ?auto_858165 ) ) ( not ( = ?auto_858152 ?auto_858153 ) ) ( not ( = ?auto_858152 ?auto_858154 ) ) ( not ( = ?auto_858152 ?auto_858155 ) ) ( not ( = ?auto_858152 ?auto_858156 ) ) ( not ( = ?auto_858152 ?auto_858157 ) ) ( not ( = ?auto_858152 ?auto_858158 ) ) ( not ( = ?auto_858152 ?auto_858159 ) ) ( not ( = ?auto_858152 ?auto_858160 ) ) ( not ( = ?auto_858152 ?auto_858161 ) ) ( not ( = ?auto_858152 ?auto_858162 ) ) ( not ( = ?auto_858152 ?auto_858163 ) ) ( not ( = ?auto_858152 ?auto_858164 ) ) ( not ( = ?auto_858152 ?auto_858165 ) ) ( not ( = ?auto_858153 ?auto_858154 ) ) ( not ( = ?auto_858153 ?auto_858155 ) ) ( not ( = ?auto_858153 ?auto_858156 ) ) ( not ( = ?auto_858153 ?auto_858157 ) ) ( not ( = ?auto_858153 ?auto_858158 ) ) ( not ( = ?auto_858153 ?auto_858159 ) ) ( not ( = ?auto_858153 ?auto_858160 ) ) ( not ( = ?auto_858153 ?auto_858161 ) ) ( not ( = ?auto_858153 ?auto_858162 ) ) ( not ( = ?auto_858153 ?auto_858163 ) ) ( not ( = ?auto_858153 ?auto_858164 ) ) ( not ( = ?auto_858153 ?auto_858165 ) ) ( not ( = ?auto_858154 ?auto_858155 ) ) ( not ( = ?auto_858154 ?auto_858156 ) ) ( not ( = ?auto_858154 ?auto_858157 ) ) ( not ( = ?auto_858154 ?auto_858158 ) ) ( not ( = ?auto_858154 ?auto_858159 ) ) ( not ( = ?auto_858154 ?auto_858160 ) ) ( not ( = ?auto_858154 ?auto_858161 ) ) ( not ( = ?auto_858154 ?auto_858162 ) ) ( not ( = ?auto_858154 ?auto_858163 ) ) ( not ( = ?auto_858154 ?auto_858164 ) ) ( not ( = ?auto_858154 ?auto_858165 ) ) ( not ( = ?auto_858155 ?auto_858156 ) ) ( not ( = ?auto_858155 ?auto_858157 ) ) ( not ( = ?auto_858155 ?auto_858158 ) ) ( not ( = ?auto_858155 ?auto_858159 ) ) ( not ( = ?auto_858155 ?auto_858160 ) ) ( not ( = ?auto_858155 ?auto_858161 ) ) ( not ( = ?auto_858155 ?auto_858162 ) ) ( not ( = ?auto_858155 ?auto_858163 ) ) ( not ( = ?auto_858155 ?auto_858164 ) ) ( not ( = ?auto_858155 ?auto_858165 ) ) ( not ( = ?auto_858156 ?auto_858157 ) ) ( not ( = ?auto_858156 ?auto_858158 ) ) ( not ( = ?auto_858156 ?auto_858159 ) ) ( not ( = ?auto_858156 ?auto_858160 ) ) ( not ( = ?auto_858156 ?auto_858161 ) ) ( not ( = ?auto_858156 ?auto_858162 ) ) ( not ( = ?auto_858156 ?auto_858163 ) ) ( not ( = ?auto_858156 ?auto_858164 ) ) ( not ( = ?auto_858156 ?auto_858165 ) ) ( not ( = ?auto_858157 ?auto_858158 ) ) ( not ( = ?auto_858157 ?auto_858159 ) ) ( not ( = ?auto_858157 ?auto_858160 ) ) ( not ( = ?auto_858157 ?auto_858161 ) ) ( not ( = ?auto_858157 ?auto_858162 ) ) ( not ( = ?auto_858157 ?auto_858163 ) ) ( not ( = ?auto_858157 ?auto_858164 ) ) ( not ( = ?auto_858157 ?auto_858165 ) ) ( not ( = ?auto_858158 ?auto_858159 ) ) ( not ( = ?auto_858158 ?auto_858160 ) ) ( not ( = ?auto_858158 ?auto_858161 ) ) ( not ( = ?auto_858158 ?auto_858162 ) ) ( not ( = ?auto_858158 ?auto_858163 ) ) ( not ( = ?auto_858158 ?auto_858164 ) ) ( not ( = ?auto_858158 ?auto_858165 ) ) ( not ( = ?auto_858159 ?auto_858160 ) ) ( not ( = ?auto_858159 ?auto_858161 ) ) ( not ( = ?auto_858159 ?auto_858162 ) ) ( not ( = ?auto_858159 ?auto_858163 ) ) ( not ( = ?auto_858159 ?auto_858164 ) ) ( not ( = ?auto_858159 ?auto_858165 ) ) ( not ( = ?auto_858160 ?auto_858161 ) ) ( not ( = ?auto_858160 ?auto_858162 ) ) ( not ( = ?auto_858160 ?auto_858163 ) ) ( not ( = ?auto_858160 ?auto_858164 ) ) ( not ( = ?auto_858160 ?auto_858165 ) ) ( not ( = ?auto_858161 ?auto_858162 ) ) ( not ( = ?auto_858161 ?auto_858163 ) ) ( not ( = ?auto_858161 ?auto_858164 ) ) ( not ( = ?auto_858161 ?auto_858165 ) ) ( not ( = ?auto_858162 ?auto_858163 ) ) ( not ( = ?auto_858162 ?auto_858164 ) ) ( not ( = ?auto_858162 ?auto_858165 ) ) ( not ( = ?auto_858163 ?auto_858164 ) ) ( not ( = ?auto_858163 ?auto_858165 ) ) ( not ( = ?auto_858164 ?auto_858165 ) ) ( ON ?auto_858163 ?auto_858164 ) ( ON ?auto_858162 ?auto_858163 ) ( ON ?auto_858161 ?auto_858162 ) ( ON ?auto_858160 ?auto_858161 ) ( ON ?auto_858159 ?auto_858160 ) ( ON ?auto_858158 ?auto_858159 ) ( ON ?auto_858157 ?auto_858158 ) ( ON ?auto_858156 ?auto_858157 ) ( ON ?auto_858155 ?auto_858156 ) ( ON ?auto_858154 ?auto_858155 ) ( CLEAR ?auto_858152 ) ( ON ?auto_858153 ?auto_858154 ) ( CLEAR ?auto_858153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_858151 ?auto_858152 ?auto_858153 )
      ( MAKE-14PILE ?auto_858151 ?auto_858152 ?auto_858153 ?auto_858154 ?auto_858155 ?auto_858156 ?auto_858157 ?auto_858158 ?auto_858159 ?auto_858160 ?auto_858161 ?auto_858162 ?auto_858163 ?auto_858164 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_858209 - BLOCK
      ?auto_858210 - BLOCK
      ?auto_858211 - BLOCK
      ?auto_858212 - BLOCK
      ?auto_858213 - BLOCK
      ?auto_858214 - BLOCK
      ?auto_858215 - BLOCK
      ?auto_858216 - BLOCK
      ?auto_858217 - BLOCK
      ?auto_858218 - BLOCK
      ?auto_858219 - BLOCK
      ?auto_858220 - BLOCK
      ?auto_858221 - BLOCK
      ?auto_858222 - BLOCK
    )
    :vars
    (
      ?auto_858223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858222 ?auto_858223 ) ( ON-TABLE ?auto_858209 ) ( not ( = ?auto_858209 ?auto_858210 ) ) ( not ( = ?auto_858209 ?auto_858211 ) ) ( not ( = ?auto_858209 ?auto_858212 ) ) ( not ( = ?auto_858209 ?auto_858213 ) ) ( not ( = ?auto_858209 ?auto_858214 ) ) ( not ( = ?auto_858209 ?auto_858215 ) ) ( not ( = ?auto_858209 ?auto_858216 ) ) ( not ( = ?auto_858209 ?auto_858217 ) ) ( not ( = ?auto_858209 ?auto_858218 ) ) ( not ( = ?auto_858209 ?auto_858219 ) ) ( not ( = ?auto_858209 ?auto_858220 ) ) ( not ( = ?auto_858209 ?auto_858221 ) ) ( not ( = ?auto_858209 ?auto_858222 ) ) ( not ( = ?auto_858209 ?auto_858223 ) ) ( not ( = ?auto_858210 ?auto_858211 ) ) ( not ( = ?auto_858210 ?auto_858212 ) ) ( not ( = ?auto_858210 ?auto_858213 ) ) ( not ( = ?auto_858210 ?auto_858214 ) ) ( not ( = ?auto_858210 ?auto_858215 ) ) ( not ( = ?auto_858210 ?auto_858216 ) ) ( not ( = ?auto_858210 ?auto_858217 ) ) ( not ( = ?auto_858210 ?auto_858218 ) ) ( not ( = ?auto_858210 ?auto_858219 ) ) ( not ( = ?auto_858210 ?auto_858220 ) ) ( not ( = ?auto_858210 ?auto_858221 ) ) ( not ( = ?auto_858210 ?auto_858222 ) ) ( not ( = ?auto_858210 ?auto_858223 ) ) ( not ( = ?auto_858211 ?auto_858212 ) ) ( not ( = ?auto_858211 ?auto_858213 ) ) ( not ( = ?auto_858211 ?auto_858214 ) ) ( not ( = ?auto_858211 ?auto_858215 ) ) ( not ( = ?auto_858211 ?auto_858216 ) ) ( not ( = ?auto_858211 ?auto_858217 ) ) ( not ( = ?auto_858211 ?auto_858218 ) ) ( not ( = ?auto_858211 ?auto_858219 ) ) ( not ( = ?auto_858211 ?auto_858220 ) ) ( not ( = ?auto_858211 ?auto_858221 ) ) ( not ( = ?auto_858211 ?auto_858222 ) ) ( not ( = ?auto_858211 ?auto_858223 ) ) ( not ( = ?auto_858212 ?auto_858213 ) ) ( not ( = ?auto_858212 ?auto_858214 ) ) ( not ( = ?auto_858212 ?auto_858215 ) ) ( not ( = ?auto_858212 ?auto_858216 ) ) ( not ( = ?auto_858212 ?auto_858217 ) ) ( not ( = ?auto_858212 ?auto_858218 ) ) ( not ( = ?auto_858212 ?auto_858219 ) ) ( not ( = ?auto_858212 ?auto_858220 ) ) ( not ( = ?auto_858212 ?auto_858221 ) ) ( not ( = ?auto_858212 ?auto_858222 ) ) ( not ( = ?auto_858212 ?auto_858223 ) ) ( not ( = ?auto_858213 ?auto_858214 ) ) ( not ( = ?auto_858213 ?auto_858215 ) ) ( not ( = ?auto_858213 ?auto_858216 ) ) ( not ( = ?auto_858213 ?auto_858217 ) ) ( not ( = ?auto_858213 ?auto_858218 ) ) ( not ( = ?auto_858213 ?auto_858219 ) ) ( not ( = ?auto_858213 ?auto_858220 ) ) ( not ( = ?auto_858213 ?auto_858221 ) ) ( not ( = ?auto_858213 ?auto_858222 ) ) ( not ( = ?auto_858213 ?auto_858223 ) ) ( not ( = ?auto_858214 ?auto_858215 ) ) ( not ( = ?auto_858214 ?auto_858216 ) ) ( not ( = ?auto_858214 ?auto_858217 ) ) ( not ( = ?auto_858214 ?auto_858218 ) ) ( not ( = ?auto_858214 ?auto_858219 ) ) ( not ( = ?auto_858214 ?auto_858220 ) ) ( not ( = ?auto_858214 ?auto_858221 ) ) ( not ( = ?auto_858214 ?auto_858222 ) ) ( not ( = ?auto_858214 ?auto_858223 ) ) ( not ( = ?auto_858215 ?auto_858216 ) ) ( not ( = ?auto_858215 ?auto_858217 ) ) ( not ( = ?auto_858215 ?auto_858218 ) ) ( not ( = ?auto_858215 ?auto_858219 ) ) ( not ( = ?auto_858215 ?auto_858220 ) ) ( not ( = ?auto_858215 ?auto_858221 ) ) ( not ( = ?auto_858215 ?auto_858222 ) ) ( not ( = ?auto_858215 ?auto_858223 ) ) ( not ( = ?auto_858216 ?auto_858217 ) ) ( not ( = ?auto_858216 ?auto_858218 ) ) ( not ( = ?auto_858216 ?auto_858219 ) ) ( not ( = ?auto_858216 ?auto_858220 ) ) ( not ( = ?auto_858216 ?auto_858221 ) ) ( not ( = ?auto_858216 ?auto_858222 ) ) ( not ( = ?auto_858216 ?auto_858223 ) ) ( not ( = ?auto_858217 ?auto_858218 ) ) ( not ( = ?auto_858217 ?auto_858219 ) ) ( not ( = ?auto_858217 ?auto_858220 ) ) ( not ( = ?auto_858217 ?auto_858221 ) ) ( not ( = ?auto_858217 ?auto_858222 ) ) ( not ( = ?auto_858217 ?auto_858223 ) ) ( not ( = ?auto_858218 ?auto_858219 ) ) ( not ( = ?auto_858218 ?auto_858220 ) ) ( not ( = ?auto_858218 ?auto_858221 ) ) ( not ( = ?auto_858218 ?auto_858222 ) ) ( not ( = ?auto_858218 ?auto_858223 ) ) ( not ( = ?auto_858219 ?auto_858220 ) ) ( not ( = ?auto_858219 ?auto_858221 ) ) ( not ( = ?auto_858219 ?auto_858222 ) ) ( not ( = ?auto_858219 ?auto_858223 ) ) ( not ( = ?auto_858220 ?auto_858221 ) ) ( not ( = ?auto_858220 ?auto_858222 ) ) ( not ( = ?auto_858220 ?auto_858223 ) ) ( not ( = ?auto_858221 ?auto_858222 ) ) ( not ( = ?auto_858221 ?auto_858223 ) ) ( not ( = ?auto_858222 ?auto_858223 ) ) ( ON ?auto_858221 ?auto_858222 ) ( ON ?auto_858220 ?auto_858221 ) ( ON ?auto_858219 ?auto_858220 ) ( ON ?auto_858218 ?auto_858219 ) ( ON ?auto_858217 ?auto_858218 ) ( ON ?auto_858216 ?auto_858217 ) ( ON ?auto_858215 ?auto_858216 ) ( ON ?auto_858214 ?auto_858215 ) ( ON ?auto_858213 ?auto_858214 ) ( ON ?auto_858212 ?auto_858213 ) ( ON ?auto_858211 ?auto_858212 ) ( CLEAR ?auto_858209 ) ( ON ?auto_858210 ?auto_858211 ) ( CLEAR ?auto_858210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_858209 ?auto_858210 )
      ( MAKE-14PILE ?auto_858209 ?auto_858210 ?auto_858211 ?auto_858212 ?auto_858213 ?auto_858214 ?auto_858215 ?auto_858216 ?auto_858217 ?auto_858218 ?auto_858219 ?auto_858220 ?auto_858221 ?auto_858222 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_858267 - BLOCK
      ?auto_858268 - BLOCK
      ?auto_858269 - BLOCK
      ?auto_858270 - BLOCK
      ?auto_858271 - BLOCK
      ?auto_858272 - BLOCK
      ?auto_858273 - BLOCK
      ?auto_858274 - BLOCK
      ?auto_858275 - BLOCK
      ?auto_858276 - BLOCK
      ?auto_858277 - BLOCK
      ?auto_858278 - BLOCK
      ?auto_858279 - BLOCK
      ?auto_858280 - BLOCK
    )
    :vars
    (
      ?auto_858281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858280 ?auto_858281 ) ( not ( = ?auto_858267 ?auto_858268 ) ) ( not ( = ?auto_858267 ?auto_858269 ) ) ( not ( = ?auto_858267 ?auto_858270 ) ) ( not ( = ?auto_858267 ?auto_858271 ) ) ( not ( = ?auto_858267 ?auto_858272 ) ) ( not ( = ?auto_858267 ?auto_858273 ) ) ( not ( = ?auto_858267 ?auto_858274 ) ) ( not ( = ?auto_858267 ?auto_858275 ) ) ( not ( = ?auto_858267 ?auto_858276 ) ) ( not ( = ?auto_858267 ?auto_858277 ) ) ( not ( = ?auto_858267 ?auto_858278 ) ) ( not ( = ?auto_858267 ?auto_858279 ) ) ( not ( = ?auto_858267 ?auto_858280 ) ) ( not ( = ?auto_858267 ?auto_858281 ) ) ( not ( = ?auto_858268 ?auto_858269 ) ) ( not ( = ?auto_858268 ?auto_858270 ) ) ( not ( = ?auto_858268 ?auto_858271 ) ) ( not ( = ?auto_858268 ?auto_858272 ) ) ( not ( = ?auto_858268 ?auto_858273 ) ) ( not ( = ?auto_858268 ?auto_858274 ) ) ( not ( = ?auto_858268 ?auto_858275 ) ) ( not ( = ?auto_858268 ?auto_858276 ) ) ( not ( = ?auto_858268 ?auto_858277 ) ) ( not ( = ?auto_858268 ?auto_858278 ) ) ( not ( = ?auto_858268 ?auto_858279 ) ) ( not ( = ?auto_858268 ?auto_858280 ) ) ( not ( = ?auto_858268 ?auto_858281 ) ) ( not ( = ?auto_858269 ?auto_858270 ) ) ( not ( = ?auto_858269 ?auto_858271 ) ) ( not ( = ?auto_858269 ?auto_858272 ) ) ( not ( = ?auto_858269 ?auto_858273 ) ) ( not ( = ?auto_858269 ?auto_858274 ) ) ( not ( = ?auto_858269 ?auto_858275 ) ) ( not ( = ?auto_858269 ?auto_858276 ) ) ( not ( = ?auto_858269 ?auto_858277 ) ) ( not ( = ?auto_858269 ?auto_858278 ) ) ( not ( = ?auto_858269 ?auto_858279 ) ) ( not ( = ?auto_858269 ?auto_858280 ) ) ( not ( = ?auto_858269 ?auto_858281 ) ) ( not ( = ?auto_858270 ?auto_858271 ) ) ( not ( = ?auto_858270 ?auto_858272 ) ) ( not ( = ?auto_858270 ?auto_858273 ) ) ( not ( = ?auto_858270 ?auto_858274 ) ) ( not ( = ?auto_858270 ?auto_858275 ) ) ( not ( = ?auto_858270 ?auto_858276 ) ) ( not ( = ?auto_858270 ?auto_858277 ) ) ( not ( = ?auto_858270 ?auto_858278 ) ) ( not ( = ?auto_858270 ?auto_858279 ) ) ( not ( = ?auto_858270 ?auto_858280 ) ) ( not ( = ?auto_858270 ?auto_858281 ) ) ( not ( = ?auto_858271 ?auto_858272 ) ) ( not ( = ?auto_858271 ?auto_858273 ) ) ( not ( = ?auto_858271 ?auto_858274 ) ) ( not ( = ?auto_858271 ?auto_858275 ) ) ( not ( = ?auto_858271 ?auto_858276 ) ) ( not ( = ?auto_858271 ?auto_858277 ) ) ( not ( = ?auto_858271 ?auto_858278 ) ) ( not ( = ?auto_858271 ?auto_858279 ) ) ( not ( = ?auto_858271 ?auto_858280 ) ) ( not ( = ?auto_858271 ?auto_858281 ) ) ( not ( = ?auto_858272 ?auto_858273 ) ) ( not ( = ?auto_858272 ?auto_858274 ) ) ( not ( = ?auto_858272 ?auto_858275 ) ) ( not ( = ?auto_858272 ?auto_858276 ) ) ( not ( = ?auto_858272 ?auto_858277 ) ) ( not ( = ?auto_858272 ?auto_858278 ) ) ( not ( = ?auto_858272 ?auto_858279 ) ) ( not ( = ?auto_858272 ?auto_858280 ) ) ( not ( = ?auto_858272 ?auto_858281 ) ) ( not ( = ?auto_858273 ?auto_858274 ) ) ( not ( = ?auto_858273 ?auto_858275 ) ) ( not ( = ?auto_858273 ?auto_858276 ) ) ( not ( = ?auto_858273 ?auto_858277 ) ) ( not ( = ?auto_858273 ?auto_858278 ) ) ( not ( = ?auto_858273 ?auto_858279 ) ) ( not ( = ?auto_858273 ?auto_858280 ) ) ( not ( = ?auto_858273 ?auto_858281 ) ) ( not ( = ?auto_858274 ?auto_858275 ) ) ( not ( = ?auto_858274 ?auto_858276 ) ) ( not ( = ?auto_858274 ?auto_858277 ) ) ( not ( = ?auto_858274 ?auto_858278 ) ) ( not ( = ?auto_858274 ?auto_858279 ) ) ( not ( = ?auto_858274 ?auto_858280 ) ) ( not ( = ?auto_858274 ?auto_858281 ) ) ( not ( = ?auto_858275 ?auto_858276 ) ) ( not ( = ?auto_858275 ?auto_858277 ) ) ( not ( = ?auto_858275 ?auto_858278 ) ) ( not ( = ?auto_858275 ?auto_858279 ) ) ( not ( = ?auto_858275 ?auto_858280 ) ) ( not ( = ?auto_858275 ?auto_858281 ) ) ( not ( = ?auto_858276 ?auto_858277 ) ) ( not ( = ?auto_858276 ?auto_858278 ) ) ( not ( = ?auto_858276 ?auto_858279 ) ) ( not ( = ?auto_858276 ?auto_858280 ) ) ( not ( = ?auto_858276 ?auto_858281 ) ) ( not ( = ?auto_858277 ?auto_858278 ) ) ( not ( = ?auto_858277 ?auto_858279 ) ) ( not ( = ?auto_858277 ?auto_858280 ) ) ( not ( = ?auto_858277 ?auto_858281 ) ) ( not ( = ?auto_858278 ?auto_858279 ) ) ( not ( = ?auto_858278 ?auto_858280 ) ) ( not ( = ?auto_858278 ?auto_858281 ) ) ( not ( = ?auto_858279 ?auto_858280 ) ) ( not ( = ?auto_858279 ?auto_858281 ) ) ( not ( = ?auto_858280 ?auto_858281 ) ) ( ON ?auto_858279 ?auto_858280 ) ( ON ?auto_858278 ?auto_858279 ) ( ON ?auto_858277 ?auto_858278 ) ( ON ?auto_858276 ?auto_858277 ) ( ON ?auto_858275 ?auto_858276 ) ( ON ?auto_858274 ?auto_858275 ) ( ON ?auto_858273 ?auto_858274 ) ( ON ?auto_858272 ?auto_858273 ) ( ON ?auto_858271 ?auto_858272 ) ( ON ?auto_858270 ?auto_858271 ) ( ON ?auto_858269 ?auto_858270 ) ( ON ?auto_858268 ?auto_858269 ) ( ON ?auto_858267 ?auto_858268 ) ( CLEAR ?auto_858267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_858267 )
      ( MAKE-14PILE ?auto_858267 ?auto_858268 ?auto_858269 ?auto_858270 ?auto_858271 ?auto_858272 ?auto_858273 ?auto_858274 ?auto_858275 ?auto_858276 ?auto_858277 ?auto_858278 ?auto_858279 ?auto_858280 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_858326 - BLOCK
      ?auto_858327 - BLOCK
      ?auto_858328 - BLOCK
      ?auto_858329 - BLOCK
      ?auto_858330 - BLOCK
      ?auto_858331 - BLOCK
      ?auto_858332 - BLOCK
      ?auto_858333 - BLOCK
      ?auto_858334 - BLOCK
      ?auto_858335 - BLOCK
      ?auto_858336 - BLOCK
      ?auto_858337 - BLOCK
      ?auto_858338 - BLOCK
      ?auto_858339 - BLOCK
      ?auto_858340 - BLOCK
    )
    :vars
    (
      ?auto_858341 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_858339 ) ( ON ?auto_858340 ?auto_858341 ) ( CLEAR ?auto_858340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_858326 ) ( ON ?auto_858327 ?auto_858326 ) ( ON ?auto_858328 ?auto_858327 ) ( ON ?auto_858329 ?auto_858328 ) ( ON ?auto_858330 ?auto_858329 ) ( ON ?auto_858331 ?auto_858330 ) ( ON ?auto_858332 ?auto_858331 ) ( ON ?auto_858333 ?auto_858332 ) ( ON ?auto_858334 ?auto_858333 ) ( ON ?auto_858335 ?auto_858334 ) ( ON ?auto_858336 ?auto_858335 ) ( ON ?auto_858337 ?auto_858336 ) ( ON ?auto_858338 ?auto_858337 ) ( ON ?auto_858339 ?auto_858338 ) ( not ( = ?auto_858326 ?auto_858327 ) ) ( not ( = ?auto_858326 ?auto_858328 ) ) ( not ( = ?auto_858326 ?auto_858329 ) ) ( not ( = ?auto_858326 ?auto_858330 ) ) ( not ( = ?auto_858326 ?auto_858331 ) ) ( not ( = ?auto_858326 ?auto_858332 ) ) ( not ( = ?auto_858326 ?auto_858333 ) ) ( not ( = ?auto_858326 ?auto_858334 ) ) ( not ( = ?auto_858326 ?auto_858335 ) ) ( not ( = ?auto_858326 ?auto_858336 ) ) ( not ( = ?auto_858326 ?auto_858337 ) ) ( not ( = ?auto_858326 ?auto_858338 ) ) ( not ( = ?auto_858326 ?auto_858339 ) ) ( not ( = ?auto_858326 ?auto_858340 ) ) ( not ( = ?auto_858326 ?auto_858341 ) ) ( not ( = ?auto_858327 ?auto_858328 ) ) ( not ( = ?auto_858327 ?auto_858329 ) ) ( not ( = ?auto_858327 ?auto_858330 ) ) ( not ( = ?auto_858327 ?auto_858331 ) ) ( not ( = ?auto_858327 ?auto_858332 ) ) ( not ( = ?auto_858327 ?auto_858333 ) ) ( not ( = ?auto_858327 ?auto_858334 ) ) ( not ( = ?auto_858327 ?auto_858335 ) ) ( not ( = ?auto_858327 ?auto_858336 ) ) ( not ( = ?auto_858327 ?auto_858337 ) ) ( not ( = ?auto_858327 ?auto_858338 ) ) ( not ( = ?auto_858327 ?auto_858339 ) ) ( not ( = ?auto_858327 ?auto_858340 ) ) ( not ( = ?auto_858327 ?auto_858341 ) ) ( not ( = ?auto_858328 ?auto_858329 ) ) ( not ( = ?auto_858328 ?auto_858330 ) ) ( not ( = ?auto_858328 ?auto_858331 ) ) ( not ( = ?auto_858328 ?auto_858332 ) ) ( not ( = ?auto_858328 ?auto_858333 ) ) ( not ( = ?auto_858328 ?auto_858334 ) ) ( not ( = ?auto_858328 ?auto_858335 ) ) ( not ( = ?auto_858328 ?auto_858336 ) ) ( not ( = ?auto_858328 ?auto_858337 ) ) ( not ( = ?auto_858328 ?auto_858338 ) ) ( not ( = ?auto_858328 ?auto_858339 ) ) ( not ( = ?auto_858328 ?auto_858340 ) ) ( not ( = ?auto_858328 ?auto_858341 ) ) ( not ( = ?auto_858329 ?auto_858330 ) ) ( not ( = ?auto_858329 ?auto_858331 ) ) ( not ( = ?auto_858329 ?auto_858332 ) ) ( not ( = ?auto_858329 ?auto_858333 ) ) ( not ( = ?auto_858329 ?auto_858334 ) ) ( not ( = ?auto_858329 ?auto_858335 ) ) ( not ( = ?auto_858329 ?auto_858336 ) ) ( not ( = ?auto_858329 ?auto_858337 ) ) ( not ( = ?auto_858329 ?auto_858338 ) ) ( not ( = ?auto_858329 ?auto_858339 ) ) ( not ( = ?auto_858329 ?auto_858340 ) ) ( not ( = ?auto_858329 ?auto_858341 ) ) ( not ( = ?auto_858330 ?auto_858331 ) ) ( not ( = ?auto_858330 ?auto_858332 ) ) ( not ( = ?auto_858330 ?auto_858333 ) ) ( not ( = ?auto_858330 ?auto_858334 ) ) ( not ( = ?auto_858330 ?auto_858335 ) ) ( not ( = ?auto_858330 ?auto_858336 ) ) ( not ( = ?auto_858330 ?auto_858337 ) ) ( not ( = ?auto_858330 ?auto_858338 ) ) ( not ( = ?auto_858330 ?auto_858339 ) ) ( not ( = ?auto_858330 ?auto_858340 ) ) ( not ( = ?auto_858330 ?auto_858341 ) ) ( not ( = ?auto_858331 ?auto_858332 ) ) ( not ( = ?auto_858331 ?auto_858333 ) ) ( not ( = ?auto_858331 ?auto_858334 ) ) ( not ( = ?auto_858331 ?auto_858335 ) ) ( not ( = ?auto_858331 ?auto_858336 ) ) ( not ( = ?auto_858331 ?auto_858337 ) ) ( not ( = ?auto_858331 ?auto_858338 ) ) ( not ( = ?auto_858331 ?auto_858339 ) ) ( not ( = ?auto_858331 ?auto_858340 ) ) ( not ( = ?auto_858331 ?auto_858341 ) ) ( not ( = ?auto_858332 ?auto_858333 ) ) ( not ( = ?auto_858332 ?auto_858334 ) ) ( not ( = ?auto_858332 ?auto_858335 ) ) ( not ( = ?auto_858332 ?auto_858336 ) ) ( not ( = ?auto_858332 ?auto_858337 ) ) ( not ( = ?auto_858332 ?auto_858338 ) ) ( not ( = ?auto_858332 ?auto_858339 ) ) ( not ( = ?auto_858332 ?auto_858340 ) ) ( not ( = ?auto_858332 ?auto_858341 ) ) ( not ( = ?auto_858333 ?auto_858334 ) ) ( not ( = ?auto_858333 ?auto_858335 ) ) ( not ( = ?auto_858333 ?auto_858336 ) ) ( not ( = ?auto_858333 ?auto_858337 ) ) ( not ( = ?auto_858333 ?auto_858338 ) ) ( not ( = ?auto_858333 ?auto_858339 ) ) ( not ( = ?auto_858333 ?auto_858340 ) ) ( not ( = ?auto_858333 ?auto_858341 ) ) ( not ( = ?auto_858334 ?auto_858335 ) ) ( not ( = ?auto_858334 ?auto_858336 ) ) ( not ( = ?auto_858334 ?auto_858337 ) ) ( not ( = ?auto_858334 ?auto_858338 ) ) ( not ( = ?auto_858334 ?auto_858339 ) ) ( not ( = ?auto_858334 ?auto_858340 ) ) ( not ( = ?auto_858334 ?auto_858341 ) ) ( not ( = ?auto_858335 ?auto_858336 ) ) ( not ( = ?auto_858335 ?auto_858337 ) ) ( not ( = ?auto_858335 ?auto_858338 ) ) ( not ( = ?auto_858335 ?auto_858339 ) ) ( not ( = ?auto_858335 ?auto_858340 ) ) ( not ( = ?auto_858335 ?auto_858341 ) ) ( not ( = ?auto_858336 ?auto_858337 ) ) ( not ( = ?auto_858336 ?auto_858338 ) ) ( not ( = ?auto_858336 ?auto_858339 ) ) ( not ( = ?auto_858336 ?auto_858340 ) ) ( not ( = ?auto_858336 ?auto_858341 ) ) ( not ( = ?auto_858337 ?auto_858338 ) ) ( not ( = ?auto_858337 ?auto_858339 ) ) ( not ( = ?auto_858337 ?auto_858340 ) ) ( not ( = ?auto_858337 ?auto_858341 ) ) ( not ( = ?auto_858338 ?auto_858339 ) ) ( not ( = ?auto_858338 ?auto_858340 ) ) ( not ( = ?auto_858338 ?auto_858341 ) ) ( not ( = ?auto_858339 ?auto_858340 ) ) ( not ( = ?auto_858339 ?auto_858341 ) ) ( not ( = ?auto_858340 ?auto_858341 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_858340 ?auto_858341 )
      ( !STACK ?auto_858340 ?auto_858339 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_858388 - BLOCK
      ?auto_858389 - BLOCK
      ?auto_858390 - BLOCK
      ?auto_858391 - BLOCK
      ?auto_858392 - BLOCK
      ?auto_858393 - BLOCK
      ?auto_858394 - BLOCK
      ?auto_858395 - BLOCK
      ?auto_858396 - BLOCK
      ?auto_858397 - BLOCK
      ?auto_858398 - BLOCK
      ?auto_858399 - BLOCK
      ?auto_858400 - BLOCK
      ?auto_858401 - BLOCK
      ?auto_858402 - BLOCK
    )
    :vars
    (
      ?auto_858403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858402 ?auto_858403 ) ( ON-TABLE ?auto_858388 ) ( ON ?auto_858389 ?auto_858388 ) ( ON ?auto_858390 ?auto_858389 ) ( ON ?auto_858391 ?auto_858390 ) ( ON ?auto_858392 ?auto_858391 ) ( ON ?auto_858393 ?auto_858392 ) ( ON ?auto_858394 ?auto_858393 ) ( ON ?auto_858395 ?auto_858394 ) ( ON ?auto_858396 ?auto_858395 ) ( ON ?auto_858397 ?auto_858396 ) ( ON ?auto_858398 ?auto_858397 ) ( ON ?auto_858399 ?auto_858398 ) ( ON ?auto_858400 ?auto_858399 ) ( not ( = ?auto_858388 ?auto_858389 ) ) ( not ( = ?auto_858388 ?auto_858390 ) ) ( not ( = ?auto_858388 ?auto_858391 ) ) ( not ( = ?auto_858388 ?auto_858392 ) ) ( not ( = ?auto_858388 ?auto_858393 ) ) ( not ( = ?auto_858388 ?auto_858394 ) ) ( not ( = ?auto_858388 ?auto_858395 ) ) ( not ( = ?auto_858388 ?auto_858396 ) ) ( not ( = ?auto_858388 ?auto_858397 ) ) ( not ( = ?auto_858388 ?auto_858398 ) ) ( not ( = ?auto_858388 ?auto_858399 ) ) ( not ( = ?auto_858388 ?auto_858400 ) ) ( not ( = ?auto_858388 ?auto_858401 ) ) ( not ( = ?auto_858388 ?auto_858402 ) ) ( not ( = ?auto_858388 ?auto_858403 ) ) ( not ( = ?auto_858389 ?auto_858390 ) ) ( not ( = ?auto_858389 ?auto_858391 ) ) ( not ( = ?auto_858389 ?auto_858392 ) ) ( not ( = ?auto_858389 ?auto_858393 ) ) ( not ( = ?auto_858389 ?auto_858394 ) ) ( not ( = ?auto_858389 ?auto_858395 ) ) ( not ( = ?auto_858389 ?auto_858396 ) ) ( not ( = ?auto_858389 ?auto_858397 ) ) ( not ( = ?auto_858389 ?auto_858398 ) ) ( not ( = ?auto_858389 ?auto_858399 ) ) ( not ( = ?auto_858389 ?auto_858400 ) ) ( not ( = ?auto_858389 ?auto_858401 ) ) ( not ( = ?auto_858389 ?auto_858402 ) ) ( not ( = ?auto_858389 ?auto_858403 ) ) ( not ( = ?auto_858390 ?auto_858391 ) ) ( not ( = ?auto_858390 ?auto_858392 ) ) ( not ( = ?auto_858390 ?auto_858393 ) ) ( not ( = ?auto_858390 ?auto_858394 ) ) ( not ( = ?auto_858390 ?auto_858395 ) ) ( not ( = ?auto_858390 ?auto_858396 ) ) ( not ( = ?auto_858390 ?auto_858397 ) ) ( not ( = ?auto_858390 ?auto_858398 ) ) ( not ( = ?auto_858390 ?auto_858399 ) ) ( not ( = ?auto_858390 ?auto_858400 ) ) ( not ( = ?auto_858390 ?auto_858401 ) ) ( not ( = ?auto_858390 ?auto_858402 ) ) ( not ( = ?auto_858390 ?auto_858403 ) ) ( not ( = ?auto_858391 ?auto_858392 ) ) ( not ( = ?auto_858391 ?auto_858393 ) ) ( not ( = ?auto_858391 ?auto_858394 ) ) ( not ( = ?auto_858391 ?auto_858395 ) ) ( not ( = ?auto_858391 ?auto_858396 ) ) ( not ( = ?auto_858391 ?auto_858397 ) ) ( not ( = ?auto_858391 ?auto_858398 ) ) ( not ( = ?auto_858391 ?auto_858399 ) ) ( not ( = ?auto_858391 ?auto_858400 ) ) ( not ( = ?auto_858391 ?auto_858401 ) ) ( not ( = ?auto_858391 ?auto_858402 ) ) ( not ( = ?auto_858391 ?auto_858403 ) ) ( not ( = ?auto_858392 ?auto_858393 ) ) ( not ( = ?auto_858392 ?auto_858394 ) ) ( not ( = ?auto_858392 ?auto_858395 ) ) ( not ( = ?auto_858392 ?auto_858396 ) ) ( not ( = ?auto_858392 ?auto_858397 ) ) ( not ( = ?auto_858392 ?auto_858398 ) ) ( not ( = ?auto_858392 ?auto_858399 ) ) ( not ( = ?auto_858392 ?auto_858400 ) ) ( not ( = ?auto_858392 ?auto_858401 ) ) ( not ( = ?auto_858392 ?auto_858402 ) ) ( not ( = ?auto_858392 ?auto_858403 ) ) ( not ( = ?auto_858393 ?auto_858394 ) ) ( not ( = ?auto_858393 ?auto_858395 ) ) ( not ( = ?auto_858393 ?auto_858396 ) ) ( not ( = ?auto_858393 ?auto_858397 ) ) ( not ( = ?auto_858393 ?auto_858398 ) ) ( not ( = ?auto_858393 ?auto_858399 ) ) ( not ( = ?auto_858393 ?auto_858400 ) ) ( not ( = ?auto_858393 ?auto_858401 ) ) ( not ( = ?auto_858393 ?auto_858402 ) ) ( not ( = ?auto_858393 ?auto_858403 ) ) ( not ( = ?auto_858394 ?auto_858395 ) ) ( not ( = ?auto_858394 ?auto_858396 ) ) ( not ( = ?auto_858394 ?auto_858397 ) ) ( not ( = ?auto_858394 ?auto_858398 ) ) ( not ( = ?auto_858394 ?auto_858399 ) ) ( not ( = ?auto_858394 ?auto_858400 ) ) ( not ( = ?auto_858394 ?auto_858401 ) ) ( not ( = ?auto_858394 ?auto_858402 ) ) ( not ( = ?auto_858394 ?auto_858403 ) ) ( not ( = ?auto_858395 ?auto_858396 ) ) ( not ( = ?auto_858395 ?auto_858397 ) ) ( not ( = ?auto_858395 ?auto_858398 ) ) ( not ( = ?auto_858395 ?auto_858399 ) ) ( not ( = ?auto_858395 ?auto_858400 ) ) ( not ( = ?auto_858395 ?auto_858401 ) ) ( not ( = ?auto_858395 ?auto_858402 ) ) ( not ( = ?auto_858395 ?auto_858403 ) ) ( not ( = ?auto_858396 ?auto_858397 ) ) ( not ( = ?auto_858396 ?auto_858398 ) ) ( not ( = ?auto_858396 ?auto_858399 ) ) ( not ( = ?auto_858396 ?auto_858400 ) ) ( not ( = ?auto_858396 ?auto_858401 ) ) ( not ( = ?auto_858396 ?auto_858402 ) ) ( not ( = ?auto_858396 ?auto_858403 ) ) ( not ( = ?auto_858397 ?auto_858398 ) ) ( not ( = ?auto_858397 ?auto_858399 ) ) ( not ( = ?auto_858397 ?auto_858400 ) ) ( not ( = ?auto_858397 ?auto_858401 ) ) ( not ( = ?auto_858397 ?auto_858402 ) ) ( not ( = ?auto_858397 ?auto_858403 ) ) ( not ( = ?auto_858398 ?auto_858399 ) ) ( not ( = ?auto_858398 ?auto_858400 ) ) ( not ( = ?auto_858398 ?auto_858401 ) ) ( not ( = ?auto_858398 ?auto_858402 ) ) ( not ( = ?auto_858398 ?auto_858403 ) ) ( not ( = ?auto_858399 ?auto_858400 ) ) ( not ( = ?auto_858399 ?auto_858401 ) ) ( not ( = ?auto_858399 ?auto_858402 ) ) ( not ( = ?auto_858399 ?auto_858403 ) ) ( not ( = ?auto_858400 ?auto_858401 ) ) ( not ( = ?auto_858400 ?auto_858402 ) ) ( not ( = ?auto_858400 ?auto_858403 ) ) ( not ( = ?auto_858401 ?auto_858402 ) ) ( not ( = ?auto_858401 ?auto_858403 ) ) ( not ( = ?auto_858402 ?auto_858403 ) ) ( CLEAR ?auto_858400 ) ( ON ?auto_858401 ?auto_858402 ) ( CLEAR ?auto_858401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_858388 ?auto_858389 ?auto_858390 ?auto_858391 ?auto_858392 ?auto_858393 ?auto_858394 ?auto_858395 ?auto_858396 ?auto_858397 ?auto_858398 ?auto_858399 ?auto_858400 ?auto_858401 )
      ( MAKE-15PILE ?auto_858388 ?auto_858389 ?auto_858390 ?auto_858391 ?auto_858392 ?auto_858393 ?auto_858394 ?auto_858395 ?auto_858396 ?auto_858397 ?auto_858398 ?auto_858399 ?auto_858400 ?auto_858401 ?auto_858402 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_858450 - BLOCK
      ?auto_858451 - BLOCK
      ?auto_858452 - BLOCK
      ?auto_858453 - BLOCK
      ?auto_858454 - BLOCK
      ?auto_858455 - BLOCK
      ?auto_858456 - BLOCK
      ?auto_858457 - BLOCK
      ?auto_858458 - BLOCK
      ?auto_858459 - BLOCK
      ?auto_858460 - BLOCK
      ?auto_858461 - BLOCK
      ?auto_858462 - BLOCK
      ?auto_858463 - BLOCK
      ?auto_858464 - BLOCK
    )
    :vars
    (
      ?auto_858465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858464 ?auto_858465 ) ( ON-TABLE ?auto_858450 ) ( ON ?auto_858451 ?auto_858450 ) ( ON ?auto_858452 ?auto_858451 ) ( ON ?auto_858453 ?auto_858452 ) ( ON ?auto_858454 ?auto_858453 ) ( ON ?auto_858455 ?auto_858454 ) ( ON ?auto_858456 ?auto_858455 ) ( ON ?auto_858457 ?auto_858456 ) ( ON ?auto_858458 ?auto_858457 ) ( ON ?auto_858459 ?auto_858458 ) ( ON ?auto_858460 ?auto_858459 ) ( ON ?auto_858461 ?auto_858460 ) ( not ( = ?auto_858450 ?auto_858451 ) ) ( not ( = ?auto_858450 ?auto_858452 ) ) ( not ( = ?auto_858450 ?auto_858453 ) ) ( not ( = ?auto_858450 ?auto_858454 ) ) ( not ( = ?auto_858450 ?auto_858455 ) ) ( not ( = ?auto_858450 ?auto_858456 ) ) ( not ( = ?auto_858450 ?auto_858457 ) ) ( not ( = ?auto_858450 ?auto_858458 ) ) ( not ( = ?auto_858450 ?auto_858459 ) ) ( not ( = ?auto_858450 ?auto_858460 ) ) ( not ( = ?auto_858450 ?auto_858461 ) ) ( not ( = ?auto_858450 ?auto_858462 ) ) ( not ( = ?auto_858450 ?auto_858463 ) ) ( not ( = ?auto_858450 ?auto_858464 ) ) ( not ( = ?auto_858450 ?auto_858465 ) ) ( not ( = ?auto_858451 ?auto_858452 ) ) ( not ( = ?auto_858451 ?auto_858453 ) ) ( not ( = ?auto_858451 ?auto_858454 ) ) ( not ( = ?auto_858451 ?auto_858455 ) ) ( not ( = ?auto_858451 ?auto_858456 ) ) ( not ( = ?auto_858451 ?auto_858457 ) ) ( not ( = ?auto_858451 ?auto_858458 ) ) ( not ( = ?auto_858451 ?auto_858459 ) ) ( not ( = ?auto_858451 ?auto_858460 ) ) ( not ( = ?auto_858451 ?auto_858461 ) ) ( not ( = ?auto_858451 ?auto_858462 ) ) ( not ( = ?auto_858451 ?auto_858463 ) ) ( not ( = ?auto_858451 ?auto_858464 ) ) ( not ( = ?auto_858451 ?auto_858465 ) ) ( not ( = ?auto_858452 ?auto_858453 ) ) ( not ( = ?auto_858452 ?auto_858454 ) ) ( not ( = ?auto_858452 ?auto_858455 ) ) ( not ( = ?auto_858452 ?auto_858456 ) ) ( not ( = ?auto_858452 ?auto_858457 ) ) ( not ( = ?auto_858452 ?auto_858458 ) ) ( not ( = ?auto_858452 ?auto_858459 ) ) ( not ( = ?auto_858452 ?auto_858460 ) ) ( not ( = ?auto_858452 ?auto_858461 ) ) ( not ( = ?auto_858452 ?auto_858462 ) ) ( not ( = ?auto_858452 ?auto_858463 ) ) ( not ( = ?auto_858452 ?auto_858464 ) ) ( not ( = ?auto_858452 ?auto_858465 ) ) ( not ( = ?auto_858453 ?auto_858454 ) ) ( not ( = ?auto_858453 ?auto_858455 ) ) ( not ( = ?auto_858453 ?auto_858456 ) ) ( not ( = ?auto_858453 ?auto_858457 ) ) ( not ( = ?auto_858453 ?auto_858458 ) ) ( not ( = ?auto_858453 ?auto_858459 ) ) ( not ( = ?auto_858453 ?auto_858460 ) ) ( not ( = ?auto_858453 ?auto_858461 ) ) ( not ( = ?auto_858453 ?auto_858462 ) ) ( not ( = ?auto_858453 ?auto_858463 ) ) ( not ( = ?auto_858453 ?auto_858464 ) ) ( not ( = ?auto_858453 ?auto_858465 ) ) ( not ( = ?auto_858454 ?auto_858455 ) ) ( not ( = ?auto_858454 ?auto_858456 ) ) ( not ( = ?auto_858454 ?auto_858457 ) ) ( not ( = ?auto_858454 ?auto_858458 ) ) ( not ( = ?auto_858454 ?auto_858459 ) ) ( not ( = ?auto_858454 ?auto_858460 ) ) ( not ( = ?auto_858454 ?auto_858461 ) ) ( not ( = ?auto_858454 ?auto_858462 ) ) ( not ( = ?auto_858454 ?auto_858463 ) ) ( not ( = ?auto_858454 ?auto_858464 ) ) ( not ( = ?auto_858454 ?auto_858465 ) ) ( not ( = ?auto_858455 ?auto_858456 ) ) ( not ( = ?auto_858455 ?auto_858457 ) ) ( not ( = ?auto_858455 ?auto_858458 ) ) ( not ( = ?auto_858455 ?auto_858459 ) ) ( not ( = ?auto_858455 ?auto_858460 ) ) ( not ( = ?auto_858455 ?auto_858461 ) ) ( not ( = ?auto_858455 ?auto_858462 ) ) ( not ( = ?auto_858455 ?auto_858463 ) ) ( not ( = ?auto_858455 ?auto_858464 ) ) ( not ( = ?auto_858455 ?auto_858465 ) ) ( not ( = ?auto_858456 ?auto_858457 ) ) ( not ( = ?auto_858456 ?auto_858458 ) ) ( not ( = ?auto_858456 ?auto_858459 ) ) ( not ( = ?auto_858456 ?auto_858460 ) ) ( not ( = ?auto_858456 ?auto_858461 ) ) ( not ( = ?auto_858456 ?auto_858462 ) ) ( not ( = ?auto_858456 ?auto_858463 ) ) ( not ( = ?auto_858456 ?auto_858464 ) ) ( not ( = ?auto_858456 ?auto_858465 ) ) ( not ( = ?auto_858457 ?auto_858458 ) ) ( not ( = ?auto_858457 ?auto_858459 ) ) ( not ( = ?auto_858457 ?auto_858460 ) ) ( not ( = ?auto_858457 ?auto_858461 ) ) ( not ( = ?auto_858457 ?auto_858462 ) ) ( not ( = ?auto_858457 ?auto_858463 ) ) ( not ( = ?auto_858457 ?auto_858464 ) ) ( not ( = ?auto_858457 ?auto_858465 ) ) ( not ( = ?auto_858458 ?auto_858459 ) ) ( not ( = ?auto_858458 ?auto_858460 ) ) ( not ( = ?auto_858458 ?auto_858461 ) ) ( not ( = ?auto_858458 ?auto_858462 ) ) ( not ( = ?auto_858458 ?auto_858463 ) ) ( not ( = ?auto_858458 ?auto_858464 ) ) ( not ( = ?auto_858458 ?auto_858465 ) ) ( not ( = ?auto_858459 ?auto_858460 ) ) ( not ( = ?auto_858459 ?auto_858461 ) ) ( not ( = ?auto_858459 ?auto_858462 ) ) ( not ( = ?auto_858459 ?auto_858463 ) ) ( not ( = ?auto_858459 ?auto_858464 ) ) ( not ( = ?auto_858459 ?auto_858465 ) ) ( not ( = ?auto_858460 ?auto_858461 ) ) ( not ( = ?auto_858460 ?auto_858462 ) ) ( not ( = ?auto_858460 ?auto_858463 ) ) ( not ( = ?auto_858460 ?auto_858464 ) ) ( not ( = ?auto_858460 ?auto_858465 ) ) ( not ( = ?auto_858461 ?auto_858462 ) ) ( not ( = ?auto_858461 ?auto_858463 ) ) ( not ( = ?auto_858461 ?auto_858464 ) ) ( not ( = ?auto_858461 ?auto_858465 ) ) ( not ( = ?auto_858462 ?auto_858463 ) ) ( not ( = ?auto_858462 ?auto_858464 ) ) ( not ( = ?auto_858462 ?auto_858465 ) ) ( not ( = ?auto_858463 ?auto_858464 ) ) ( not ( = ?auto_858463 ?auto_858465 ) ) ( not ( = ?auto_858464 ?auto_858465 ) ) ( ON ?auto_858463 ?auto_858464 ) ( CLEAR ?auto_858461 ) ( ON ?auto_858462 ?auto_858463 ) ( CLEAR ?auto_858462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_858450 ?auto_858451 ?auto_858452 ?auto_858453 ?auto_858454 ?auto_858455 ?auto_858456 ?auto_858457 ?auto_858458 ?auto_858459 ?auto_858460 ?auto_858461 ?auto_858462 )
      ( MAKE-15PILE ?auto_858450 ?auto_858451 ?auto_858452 ?auto_858453 ?auto_858454 ?auto_858455 ?auto_858456 ?auto_858457 ?auto_858458 ?auto_858459 ?auto_858460 ?auto_858461 ?auto_858462 ?auto_858463 ?auto_858464 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_858512 - BLOCK
      ?auto_858513 - BLOCK
      ?auto_858514 - BLOCK
      ?auto_858515 - BLOCK
      ?auto_858516 - BLOCK
      ?auto_858517 - BLOCK
      ?auto_858518 - BLOCK
      ?auto_858519 - BLOCK
      ?auto_858520 - BLOCK
      ?auto_858521 - BLOCK
      ?auto_858522 - BLOCK
      ?auto_858523 - BLOCK
      ?auto_858524 - BLOCK
      ?auto_858525 - BLOCK
      ?auto_858526 - BLOCK
    )
    :vars
    (
      ?auto_858527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858526 ?auto_858527 ) ( ON-TABLE ?auto_858512 ) ( ON ?auto_858513 ?auto_858512 ) ( ON ?auto_858514 ?auto_858513 ) ( ON ?auto_858515 ?auto_858514 ) ( ON ?auto_858516 ?auto_858515 ) ( ON ?auto_858517 ?auto_858516 ) ( ON ?auto_858518 ?auto_858517 ) ( ON ?auto_858519 ?auto_858518 ) ( ON ?auto_858520 ?auto_858519 ) ( ON ?auto_858521 ?auto_858520 ) ( ON ?auto_858522 ?auto_858521 ) ( not ( = ?auto_858512 ?auto_858513 ) ) ( not ( = ?auto_858512 ?auto_858514 ) ) ( not ( = ?auto_858512 ?auto_858515 ) ) ( not ( = ?auto_858512 ?auto_858516 ) ) ( not ( = ?auto_858512 ?auto_858517 ) ) ( not ( = ?auto_858512 ?auto_858518 ) ) ( not ( = ?auto_858512 ?auto_858519 ) ) ( not ( = ?auto_858512 ?auto_858520 ) ) ( not ( = ?auto_858512 ?auto_858521 ) ) ( not ( = ?auto_858512 ?auto_858522 ) ) ( not ( = ?auto_858512 ?auto_858523 ) ) ( not ( = ?auto_858512 ?auto_858524 ) ) ( not ( = ?auto_858512 ?auto_858525 ) ) ( not ( = ?auto_858512 ?auto_858526 ) ) ( not ( = ?auto_858512 ?auto_858527 ) ) ( not ( = ?auto_858513 ?auto_858514 ) ) ( not ( = ?auto_858513 ?auto_858515 ) ) ( not ( = ?auto_858513 ?auto_858516 ) ) ( not ( = ?auto_858513 ?auto_858517 ) ) ( not ( = ?auto_858513 ?auto_858518 ) ) ( not ( = ?auto_858513 ?auto_858519 ) ) ( not ( = ?auto_858513 ?auto_858520 ) ) ( not ( = ?auto_858513 ?auto_858521 ) ) ( not ( = ?auto_858513 ?auto_858522 ) ) ( not ( = ?auto_858513 ?auto_858523 ) ) ( not ( = ?auto_858513 ?auto_858524 ) ) ( not ( = ?auto_858513 ?auto_858525 ) ) ( not ( = ?auto_858513 ?auto_858526 ) ) ( not ( = ?auto_858513 ?auto_858527 ) ) ( not ( = ?auto_858514 ?auto_858515 ) ) ( not ( = ?auto_858514 ?auto_858516 ) ) ( not ( = ?auto_858514 ?auto_858517 ) ) ( not ( = ?auto_858514 ?auto_858518 ) ) ( not ( = ?auto_858514 ?auto_858519 ) ) ( not ( = ?auto_858514 ?auto_858520 ) ) ( not ( = ?auto_858514 ?auto_858521 ) ) ( not ( = ?auto_858514 ?auto_858522 ) ) ( not ( = ?auto_858514 ?auto_858523 ) ) ( not ( = ?auto_858514 ?auto_858524 ) ) ( not ( = ?auto_858514 ?auto_858525 ) ) ( not ( = ?auto_858514 ?auto_858526 ) ) ( not ( = ?auto_858514 ?auto_858527 ) ) ( not ( = ?auto_858515 ?auto_858516 ) ) ( not ( = ?auto_858515 ?auto_858517 ) ) ( not ( = ?auto_858515 ?auto_858518 ) ) ( not ( = ?auto_858515 ?auto_858519 ) ) ( not ( = ?auto_858515 ?auto_858520 ) ) ( not ( = ?auto_858515 ?auto_858521 ) ) ( not ( = ?auto_858515 ?auto_858522 ) ) ( not ( = ?auto_858515 ?auto_858523 ) ) ( not ( = ?auto_858515 ?auto_858524 ) ) ( not ( = ?auto_858515 ?auto_858525 ) ) ( not ( = ?auto_858515 ?auto_858526 ) ) ( not ( = ?auto_858515 ?auto_858527 ) ) ( not ( = ?auto_858516 ?auto_858517 ) ) ( not ( = ?auto_858516 ?auto_858518 ) ) ( not ( = ?auto_858516 ?auto_858519 ) ) ( not ( = ?auto_858516 ?auto_858520 ) ) ( not ( = ?auto_858516 ?auto_858521 ) ) ( not ( = ?auto_858516 ?auto_858522 ) ) ( not ( = ?auto_858516 ?auto_858523 ) ) ( not ( = ?auto_858516 ?auto_858524 ) ) ( not ( = ?auto_858516 ?auto_858525 ) ) ( not ( = ?auto_858516 ?auto_858526 ) ) ( not ( = ?auto_858516 ?auto_858527 ) ) ( not ( = ?auto_858517 ?auto_858518 ) ) ( not ( = ?auto_858517 ?auto_858519 ) ) ( not ( = ?auto_858517 ?auto_858520 ) ) ( not ( = ?auto_858517 ?auto_858521 ) ) ( not ( = ?auto_858517 ?auto_858522 ) ) ( not ( = ?auto_858517 ?auto_858523 ) ) ( not ( = ?auto_858517 ?auto_858524 ) ) ( not ( = ?auto_858517 ?auto_858525 ) ) ( not ( = ?auto_858517 ?auto_858526 ) ) ( not ( = ?auto_858517 ?auto_858527 ) ) ( not ( = ?auto_858518 ?auto_858519 ) ) ( not ( = ?auto_858518 ?auto_858520 ) ) ( not ( = ?auto_858518 ?auto_858521 ) ) ( not ( = ?auto_858518 ?auto_858522 ) ) ( not ( = ?auto_858518 ?auto_858523 ) ) ( not ( = ?auto_858518 ?auto_858524 ) ) ( not ( = ?auto_858518 ?auto_858525 ) ) ( not ( = ?auto_858518 ?auto_858526 ) ) ( not ( = ?auto_858518 ?auto_858527 ) ) ( not ( = ?auto_858519 ?auto_858520 ) ) ( not ( = ?auto_858519 ?auto_858521 ) ) ( not ( = ?auto_858519 ?auto_858522 ) ) ( not ( = ?auto_858519 ?auto_858523 ) ) ( not ( = ?auto_858519 ?auto_858524 ) ) ( not ( = ?auto_858519 ?auto_858525 ) ) ( not ( = ?auto_858519 ?auto_858526 ) ) ( not ( = ?auto_858519 ?auto_858527 ) ) ( not ( = ?auto_858520 ?auto_858521 ) ) ( not ( = ?auto_858520 ?auto_858522 ) ) ( not ( = ?auto_858520 ?auto_858523 ) ) ( not ( = ?auto_858520 ?auto_858524 ) ) ( not ( = ?auto_858520 ?auto_858525 ) ) ( not ( = ?auto_858520 ?auto_858526 ) ) ( not ( = ?auto_858520 ?auto_858527 ) ) ( not ( = ?auto_858521 ?auto_858522 ) ) ( not ( = ?auto_858521 ?auto_858523 ) ) ( not ( = ?auto_858521 ?auto_858524 ) ) ( not ( = ?auto_858521 ?auto_858525 ) ) ( not ( = ?auto_858521 ?auto_858526 ) ) ( not ( = ?auto_858521 ?auto_858527 ) ) ( not ( = ?auto_858522 ?auto_858523 ) ) ( not ( = ?auto_858522 ?auto_858524 ) ) ( not ( = ?auto_858522 ?auto_858525 ) ) ( not ( = ?auto_858522 ?auto_858526 ) ) ( not ( = ?auto_858522 ?auto_858527 ) ) ( not ( = ?auto_858523 ?auto_858524 ) ) ( not ( = ?auto_858523 ?auto_858525 ) ) ( not ( = ?auto_858523 ?auto_858526 ) ) ( not ( = ?auto_858523 ?auto_858527 ) ) ( not ( = ?auto_858524 ?auto_858525 ) ) ( not ( = ?auto_858524 ?auto_858526 ) ) ( not ( = ?auto_858524 ?auto_858527 ) ) ( not ( = ?auto_858525 ?auto_858526 ) ) ( not ( = ?auto_858525 ?auto_858527 ) ) ( not ( = ?auto_858526 ?auto_858527 ) ) ( ON ?auto_858525 ?auto_858526 ) ( ON ?auto_858524 ?auto_858525 ) ( CLEAR ?auto_858522 ) ( ON ?auto_858523 ?auto_858524 ) ( CLEAR ?auto_858523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_858512 ?auto_858513 ?auto_858514 ?auto_858515 ?auto_858516 ?auto_858517 ?auto_858518 ?auto_858519 ?auto_858520 ?auto_858521 ?auto_858522 ?auto_858523 )
      ( MAKE-15PILE ?auto_858512 ?auto_858513 ?auto_858514 ?auto_858515 ?auto_858516 ?auto_858517 ?auto_858518 ?auto_858519 ?auto_858520 ?auto_858521 ?auto_858522 ?auto_858523 ?auto_858524 ?auto_858525 ?auto_858526 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_858574 - BLOCK
      ?auto_858575 - BLOCK
      ?auto_858576 - BLOCK
      ?auto_858577 - BLOCK
      ?auto_858578 - BLOCK
      ?auto_858579 - BLOCK
      ?auto_858580 - BLOCK
      ?auto_858581 - BLOCK
      ?auto_858582 - BLOCK
      ?auto_858583 - BLOCK
      ?auto_858584 - BLOCK
      ?auto_858585 - BLOCK
      ?auto_858586 - BLOCK
      ?auto_858587 - BLOCK
      ?auto_858588 - BLOCK
    )
    :vars
    (
      ?auto_858589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858588 ?auto_858589 ) ( ON-TABLE ?auto_858574 ) ( ON ?auto_858575 ?auto_858574 ) ( ON ?auto_858576 ?auto_858575 ) ( ON ?auto_858577 ?auto_858576 ) ( ON ?auto_858578 ?auto_858577 ) ( ON ?auto_858579 ?auto_858578 ) ( ON ?auto_858580 ?auto_858579 ) ( ON ?auto_858581 ?auto_858580 ) ( ON ?auto_858582 ?auto_858581 ) ( ON ?auto_858583 ?auto_858582 ) ( not ( = ?auto_858574 ?auto_858575 ) ) ( not ( = ?auto_858574 ?auto_858576 ) ) ( not ( = ?auto_858574 ?auto_858577 ) ) ( not ( = ?auto_858574 ?auto_858578 ) ) ( not ( = ?auto_858574 ?auto_858579 ) ) ( not ( = ?auto_858574 ?auto_858580 ) ) ( not ( = ?auto_858574 ?auto_858581 ) ) ( not ( = ?auto_858574 ?auto_858582 ) ) ( not ( = ?auto_858574 ?auto_858583 ) ) ( not ( = ?auto_858574 ?auto_858584 ) ) ( not ( = ?auto_858574 ?auto_858585 ) ) ( not ( = ?auto_858574 ?auto_858586 ) ) ( not ( = ?auto_858574 ?auto_858587 ) ) ( not ( = ?auto_858574 ?auto_858588 ) ) ( not ( = ?auto_858574 ?auto_858589 ) ) ( not ( = ?auto_858575 ?auto_858576 ) ) ( not ( = ?auto_858575 ?auto_858577 ) ) ( not ( = ?auto_858575 ?auto_858578 ) ) ( not ( = ?auto_858575 ?auto_858579 ) ) ( not ( = ?auto_858575 ?auto_858580 ) ) ( not ( = ?auto_858575 ?auto_858581 ) ) ( not ( = ?auto_858575 ?auto_858582 ) ) ( not ( = ?auto_858575 ?auto_858583 ) ) ( not ( = ?auto_858575 ?auto_858584 ) ) ( not ( = ?auto_858575 ?auto_858585 ) ) ( not ( = ?auto_858575 ?auto_858586 ) ) ( not ( = ?auto_858575 ?auto_858587 ) ) ( not ( = ?auto_858575 ?auto_858588 ) ) ( not ( = ?auto_858575 ?auto_858589 ) ) ( not ( = ?auto_858576 ?auto_858577 ) ) ( not ( = ?auto_858576 ?auto_858578 ) ) ( not ( = ?auto_858576 ?auto_858579 ) ) ( not ( = ?auto_858576 ?auto_858580 ) ) ( not ( = ?auto_858576 ?auto_858581 ) ) ( not ( = ?auto_858576 ?auto_858582 ) ) ( not ( = ?auto_858576 ?auto_858583 ) ) ( not ( = ?auto_858576 ?auto_858584 ) ) ( not ( = ?auto_858576 ?auto_858585 ) ) ( not ( = ?auto_858576 ?auto_858586 ) ) ( not ( = ?auto_858576 ?auto_858587 ) ) ( not ( = ?auto_858576 ?auto_858588 ) ) ( not ( = ?auto_858576 ?auto_858589 ) ) ( not ( = ?auto_858577 ?auto_858578 ) ) ( not ( = ?auto_858577 ?auto_858579 ) ) ( not ( = ?auto_858577 ?auto_858580 ) ) ( not ( = ?auto_858577 ?auto_858581 ) ) ( not ( = ?auto_858577 ?auto_858582 ) ) ( not ( = ?auto_858577 ?auto_858583 ) ) ( not ( = ?auto_858577 ?auto_858584 ) ) ( not ( = ?auto_858577 ?auto_858585 ) ) ( not ( = ?auto_858577 ?auto_858586 ) ) ( not ( = ?auto_858577 ?auto_858587 ) ) ( not ( = ?auto_858577 ?auto_858588 ) ) ( not ( = ?auto_858577 ?auto_858589 ) ) ( not ( = ?auto_858578 ?auto_858579 ) ) ( not ( = ?auto_858578 ?auto_858580 ) ) ( not ( = ?auto_858578 ?auto_858581 ) ) ( not ( = ?auto_858578 ?auto_858582 ) ) ( not ( = ?auto_858578 ?auto_858583 ) ) ( not ( = ?auto_858578 ?auto_858584 ) ) ( not ( = ?auto_858578 ?auto_858585 ) ) ( not ( = ?auto_858578 ?auto_858586 ) ) ( not ( = ?auto_858578 ?auto_858587 ) ) ( not ( = ?auto_858578 ?auto_858588 ) ) ( not ( = ?auto_858578 ?auto_858589 ) ) ( not ( = ?auto_858579 ?auto_858580 ) ) ( not ( = ?auto_858579 ?auto_858581 ) ) ( not ( = ?auto_858579 ?auto_858582 ) ) ( not ( = ?auto_858579 ?auto_858583 ) ) ( not ( = ?auto_858579 ?auto_858584 ) ) ( not ( = ?auto_858579 ?auto_858585 ) ) ( not ( = ?auto_858579 ?auto_858586 ) ) ( not ( = ?auto_858579 ?auto_858587 ) ) ( not ( = ?auto_858579 ?auto_858588 ) ) ( not ( = ?auto_858579 ?auto_858589 ) ) ( not ( = ?auto_858580 ?auto_858581 ) ) ( not ( = ?auto_858580 ?auto_858582 ) ) ( not ( = ?auto_858580 ?auto_858583 ) ) ( not ( = ?auto_858580 ?auto_858584 ) ) ( not ( = ?auto_858580 ?auto_858585 ) ) ( not ( = ?auto_858580 ?auto_858586 ) ) ( not ( = ?auto_858580 ?auto_858587 ) ) ( not ( = ?auto_858580 ?auto_858588 ) ) ( not ( = ?auto_858580 ?auto_858589 ) ) ( not ( = ?auto_858581 ?auto_858582 ) ) ( not ( = ?auto_858581 ?auto_858583 ) ) ( not ( = ?auto_858581 ?auto_858584 ) ) ( not ( = ?auto_858581 ?auto_858585 ) ) ( not ( = ?auto_858581 ?auto_858586 ) ) ( not ( = ?auto_858581 ?auto_858587 ) ) ( not ( = ?auto_858581 ?auto_858588 ) ) ( not ( = ?auto_858581 ?auto_858589 ) ) ( not ( = ?auto_858582 ?auto_858583 ) ) ( not ( = ?auto_858582 ?auto_858584 ) ) ( not ( = ?auto_858582 ?auto_858585 ) ) ( not ( = ?auto_858582 ?auto_858586 ) ) ( not ( = ?auto_858582 ?auto_858587 ) ) ( not ( = ?auto_858582 ?auto_858588 ) ) ( not ( = ?auto_858582 ?auto_858589 ) ) ( not ( = ?auto_858583 ?auto_858584 ) ) ( not ( = ?auto_858583 ?auto_858585 ) ) ( not ( = ?auto_858583 ?auto_858586 ) ) ( not ( = ?auto_858583 ?auto_858587 ) ) ( not ( = ?auto_858583 ?auto_858588 ) ) ( not ( = ?auto_858583 ?auto_858589 ) ) ( not ( = ?auto_858584 ?auto_858585 ) ) ( not ( = ?auto_858584 ?auto_858586 ) ) ( not ( = ?auto_858584 ?auto_858587 ) ) ( not ( = ?auto_858584 ?auto_858588 ) ) ( not ( = ?auto_858584 ?auto_858589 ) ) ( not ( = ?auto_858585 ?auto_858586 ) ) ( not ( = ?auto_858585 ?auto_858587 ) ) ( not ( = ?auto_858585 ?auto_858588 ) ) ( not ( = ?auto_858585 ?auto_858589 ) ) ( not ( = ?auto_858586 ?auto_858587 ) ) ( not ( = ?auto_858586 ?auto_858588 ) ) ( not ( = ?auto_858586 ?auto_858589 ) ) ( not ( = ?auto_858587 ?auto_858588 ) ) ( not ( = ?auto_858587 ?auto_858589 ) ) ( not ( = ?auto_858588 ?auto_858589 ) ) ( ON ?auto_858587 ?auto_858588 ) ( ON ?auto_858586 ?auto_858587 ) ( ON ?auto_858585 ?auto_858586 ) ( CLEAR ?auto_858583 ) ( ON ?auto_858584 ?auto_858585 ) ( CLEAR ?auto_858584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_858574 ?auto_858575 ?auto_858576 ?auto_858577 ?auto_858578 ?auto_858579 ?auto_858580 ?auto_858581 ?auto_858582 ?auto_858583 ?auto_858584 )
      ( MAKE-15PILE ?auto_858574 ?auto_858575 ?auto_858576 ?auto_858577 ?auto_858578 ?auto_858579 ?auto_858580 ?auto_858581 ?auto_858582 ?auto_858583 ?auto_858584 ?auto_858585 ?auto_858586 ?auto_858587 ?auto_858588 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_858636 - BLOCK
      ?auto_858637 - BLOCK
      ?auto_858638 - BLOCK
      ?auto_858639 - BLOCK
      ?auto_858640 - BLOCK
      ?auto_858641 - BLOCK
      ?auto_858642 - BLOCK
      ?auto_858643 - BLOCK
      ?auto_858644 - BLOCK
      ?auto_858645 - BLOCK
      ?auto_858646 - BLOCK
      ?auto_858647 - BLOCK
      ?auto_858648 - BLOCK
      ?auto_858649 - BLOCK
      ?auto_858650 - BLOCK
    )
    :vars
    (
      ?auto_858651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858650 ?auto_858651 ) ( ON-TABLE ?auto_858636 ) ( ON ?auto_858637 ?auto_858636 ) ( ON ?auto_858638 ?auto_858637 ) ( ON ?auto_858639 ?auto_858638 ) ( ON ?auto_858640 ?auto_858639 ) ( ON ?auto_858641 ?auto_858640 ) ( ON ?auto_858642 ?auto_858641 ) ( ON ?auto_858643 ?auto_858642 ) ( ON ?auto_858644 ?auto_858643 ) ( not ( = ?auto_858636 ?auto_858637 ) ) ( not ( = ?auto_858636 ?auto_858638 ) ) ( not ( = ?auto_858636 ?auto_858639 ) ) ( not ( = ?auto_858636 ?auto_858640 ) ) ( not ( = ?auto_858636 ?auto_858641 ) ) ( not ( = ?auto_858636 ?auto_858642 ) ) ( not ( = ?auto_858636 ?auto_858643 ) ) ( not ( = ?auto_858636 ?auto_858644 ) ) ( not ( = ?auto_858636 ?auto_858645 ) ) ( not ( = ?auto_858636 ?auto_858646 ) ) ( not ( = ?auto_858636 ?auto_858647 ) ) ( not ( = ?auto_858636 ?auto_858648 ) ) ( not ( = ?auto_858636 ?auto_858649 ) ) ( not ( = ?auto_858636 ?auto_858650 ) ) ( not ( = ?auto_858636 ?auto_858651 ) ) ( not ( = ?auto_858637 ?auto_858638 ) ) ( not ( = ?auto_858637 ?auto_858639 ) ) ( not ( = ?auto_858637 ?auto_858640 ) ) ( not ( = ?auto_858637 ?auto_858641 ) ) ( not ( = ?auto_858637 ?auto_858642 ) ) ( not ( = ?auto_858637 ?auto_858643 ) ) ( not ( = ?auto_858637 ?auto_858644 ) ) ( not ( = ?auto_858637 ?auto_858645 ) ) ( not ( = ?auto_858637 ?auto_858646 ) ) ( not ( = ?auto_858637 ?auto_858647 ) ) ( not ( = ?auto_858637 ?auto_858648 ) ) ( not ( = ?auto_858637 ?auto_858649 ) ) ( not ( = ?auto_858637 ?auto_858650 ) ) ( not ( = ?auto_858637 ?auto_858651 ) ) ( not ( = ?auto_858638 ?auto_858639 ) ) ( not ( = ?auto_858638 ?auto_858640 ) ) ( not ( = ?auto_858638 ?auto_858641 ) ) ( not ( = ?auto_858638 ?auto_858642 ) ) ( not ( = ?auto_858638 ?auto_858643 ) ) ( not ( = ?auto_858638 ?auto_858644 ) ) ( not ( = ?auto_858638 ?auto_858645 ) ) ( not ( = ?auto_858638 ?auto_858646 ) ) ( not ( = ?auto_858638 ?auto_858647 ) ) ( not ( = ?auto_858638 ?auto_858648 ) ) ( not ( = ?auto_858638 ?auto_858649 ) ) ( not ( = ?auto_858638 ?auto_858650 ) ) ( not ( = ?auto_858638 ?auto_858651 ) ) ( not ( = ?auto_858639 ?auto_858640 ) ) ( not ( = ?auto_858639 ?auto_858641 ) ) ( not ( = ?auto_858639 ?auto_858642 ) ) ( not ( = ?auto_858639 ?auto_858643 ) ) ( not ( = ?auto_858639 ?auto_858644 ) ) ( not ( = ?auto_858639 ?auto_858645 ) ) ( not ( = ?auto_858639 ?auto_858646 ) ) ( not ( = ?auto_858639 ?auto_858647 ) ) ( not ( = ?auto_858639 ?auto_858648 ) ) ( not ( = ?auto_858639 ?auto_858649 ) ) ( not ( = ?auto_858639 ?auto_858650 ) ) ( not ( = ?auto_858639 ?auto_858651 ) ) ( not ( = ?auto_858640 ?auto_858641 ) ) ( not ( = ?auto_858640 ?auto_858642 ) ) ( not ( = ?auto_858640 ?auto_858643 ) ) ( not ( = ?auto_858640 ?auto_858644 ) ) ( not ( = ?auto_858640 ?auto_858645 ) ) ( not ( = ?auto_858640 ?auto_858646 ) ) ( not ( = ?auto_858640 ?auto_858647 ) ) ( not ( = ?auto_858640 ?auto_858648 ) ) ( not ( = ?auto_858640 ?auto_858649 ) ) ( not ( = ?auto_858640 ?auto_858650 ) ) ( not ( = ?auto_858640 ?auto_858651 ) ) ( not ( = ?auto_858641 ?auto_858642 ) ) ( not ( = ?auto_858641 ?auto_858643 ) ) ( not ( = ?auto_858641 ?auto_858644 ) ) ( not ( = ?auto_858641 ?auto_858645 ) ) ( not ( = ?auto_858641 ?auto_858646 ) ) ( not ( = ?auto_858641 ?auto_858647 ) ) ( not ( = ?auto_858641 ?auto_858648 ) ) ( not ( = ?auto_858641 ?auto_858649 ) ) ( not ( = ?auto_858641 ?auto_858650 ) ) ( not ( = ?auto_858641 ?auto_858651 ) ) ( not ( = ?auto_858642 ?auto_858643 ) ) ( not ( = ?auto_858642 ?auto_858644 ) ) ( not ( = ?auto_858642 ?auto_858645 ) ) ( not ( = ?auto_858642 ?auto_858646 ) ) ( not ( = ?auto_858642 ?auto_858647 ) ) ( not ( = ?auto_858642 ?auto_858648 ) ) ( not ( = ?auto_858642 ?auto_858649 ) ) ( not ( = ?auto_858642 ?auto_858650 ) ) ( not ( = ?auto_858642 ?auto_858651 ) ) ( not ( = ?auto_858643 ?auto_858644 ) ) ( not ( = ?auto_858643 ?auto_858645 ) ) ( not ( = ?auto_858643 ?auto_858646 ) ) ( not ( = ?auto_858643 ?auto_858647 ) ) ( not ( = ?auto_858643 ?auto_858648 ) ) ( not ( = ?auto_858643 ?auto_858649 ) ) ( not ( = ?auto_858643 ?auto_858650 ) ) ( not ( = ?auto_858643 ?auto_858651 ) ) ( not ( = ?auto_858644 ?auto_858645 ) ) ( not ( = ?auto_858644 ?auto_858646 ) ) ( not ( = ?auto_858644 ?auto_858647 ) ) ( not ( = ?auto_858644 ?auto_858648 ) ) ( not ( = ?auto_858644 ?auto_858649 ) ) ( not ( = ?auto_858644 ?auto_858650 ) ) ( not ( = ?auto_858644 ?auto_858651 ) ) ( not ( = ?auto_858645 ?auto_858646 ) ) ( not ( = ?auto_858645 ?auto_858647 ) ) ( not ( = ?auto_858645 ?auto_858648 ) ) ( not ( = ?auto_858645 ?auto_858649 ) ) ( not ( = ?auto_858645 ?auto_858650 ) ) ( not ( = ?auto_858645 ?auto_858651 ) ) ( not ( = ?auto_858646 ?auto_858647 ) ) ( not ( = ?auto_858646 ?auto_858648 ) ) ( not ( = ?auto_858646 ?auto_858649 ) ) ( not ( = ?auto_858646 ?auto_858650 ) ) ( not ( = ?auto_858646 ?auto_858651 ) ) ( not ( = ?auto_858647 ?auto_858648 ) ) ( not ( = ?auto_858647 ?auto_858649 ) ) ( not ( = ?auto_858647 ?auto_858650 ) ) ( not ( = ?auto_858647 ?auto_858651 ) ) ( not ( = ?auto_858648 ?auto_858649 ) ) ( not ( = ?auto_858648 ?auto_858650 ) ) ( not ( = ?auto_858648 ?auto_858651 ) ) ( not ( = ?auto_858649 ?auto_858650 ) ) ( not ( = ?auto_858649 ?auto_858651 ) ) ( not ( = ?auto_858650 ?auto_858651 ) ) ( ON ?auto_858649 ?auto_858650 ) ( ON ?auto_858648 ?auto_858649 ) ( ON ?auto_858647 ?auto_858648 ) ( ON ?auto_858646 ?auto_858647 ) ( CLEAR ?auto_858644 ) ( ON ?auto_858645 ?auto_858646 ) ( CLEAR ?auto_858645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_858636 ?auto_858637 ?auto_858638 ?auto_858639 ?auto_858640 ?auto_858641 ?auto_858642 ?auto_858643 ?auto_858644 ?auto_858645 )
      ( MAKE-15PILE ?auto_858636 ?auto_858637 ?auto_858638 ?auto_858639 ?auto_858640 ?auto_858641 ?auto_858642 ?auto_858643 ?auto_858644 ?auto_858645 ?auto_858646 ?auto_858647 ?auto_858648 ?auto_858649 ?auto_858650 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_858698 - BLOCK
      ?auto_858699 - BLOCK
      ?auto_858700 - BLOCK
      ?auto_858701 - BLOCK
      ?auto_858702 - BLOCK
      ?auto_858703 - BLOCK
      ?auto_858704 - BLOCK
      ?auto_858705 - BLOCK
      ?auto_858706 - BLOCK
      ?auto_858707 - BLOCK
      ?auto_858708 - BLOCK
      ?auto_858709 - BLOCK
      ?auto_858710 - BLOCK
      ?auto_858711 - BLOCK
      ?auto_858712 - BLOCK
    )
    :vars
    (
      ?auto_858713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858712 ?auto_858713 ) ( ON-TABLE ?auto_858698 ) ( ON ?auto_858699 ?auto_858698 ) ( ON ?auto_858700 ?auto_858699 ) ( ON ?auto_858701 ?auto_858700 ) ( ON ?auto_858702 ?auto_858701 ) ( ON ?auto_858703 ?auto_858702 ) ( ON ?auto_858704 ?auto_858703 ) ( ON ?auto_858705 ?auto_858704 ) ( not ( = ?auto_858698 ?auto_858699 ) ) ( not ( = ?auto_858698 ?auto_858700 ) ) ( not ( = ?auto_858698 ?auto_858701 ) ) ( not ( = ?auto_858698 ?auto_858702 ) ) ( not ( = ?auto_858698 ?auto_858703 ) ) ( not ( = ?auto_858698 ?auto_858704 ) ) ( not ( = ?auto_858698 ?auto_858705 ) ) ( not ( = ?auto_858698 ?auto_858706 ) ) ( not ( = ?auto_858698 ?auto_858707 ) ) ( not ( = ?auto_858698 ?auto_858708 ) ) ( not ( = ?auto_858698 ?auto_858709 ) ) ( not ( = ?auto_858698 ?auto_858710 ) ) ( not ( = ?auto_858698 ?auto_858711 ) ) ( not ( = ?auto_858698 ?auto_858712 ) ) ( not ( = ?auto_858698 ?auto_858713 ) ) ( not ( = ?auto_858699 ?auto_858700 ) ) ( not ( = ?auto_858699 ?auto_858701 ) ) ( not ( = ?auto_858699 ?auto_858702 ) ) ( not ( = ?auto_858699 ?auto_858703 ) ) ( not ( = ?auto_858699 ?auto_858704 ) ) ( not ( = ?auto_858699 ?auto_858705 ) ) ( not ( = ?auto_858699 ?auto_858706 ) ) ( not ( = ?auto_858699 ?auto_858707 ) ) ( not ( = ?auto_858699 ?auto_858708 ) ) ( not ( = ?auto_858699 ?auto_858709 ) ) ( not ( = ?auto_858699 ?auto_858710 ) ) ( not ( = ?auto_858699 ?auto_858711 ) ) ( not ( = ?auto_858699 ?auto_858712 ) ) ( not ( = ?auto_858699 ?auto_858713 ) ) ( not ( = ?auto_858700 ?auto_858701 ) ) ( not ( = ?auto_858700 ?auto_858702 ) ) ( not ( = ?auto_858700 ?auto_858703 ) ) ( not ( = ?auto_858700 ?auto_858704 ) ) ( not ( = ?auto_858700 ?auto_858705 ) ) ( not ( = ?auto_858700 ?auto_858706 ) ) ( not ( = ?auto_858700 ?auto_858707 ) ) ( not ( = ?auto_858700 ?auto_858708 ) ) ( not ( = ?auto_858700 ?auto_858709 ) ) ( not ( = ?auto_858700 ?auto_858710 ) ) ( not ( = ?auto_858700 ?auto_858711 ) ) ( not ( = ?auto_858700 ?auto_858712 ) ) ( not ( = ?auto_858700 ?auto_858713 ) ) ( not ( = ?auto_858701 ?auto_858702 ) ) ( not ( = ?auto_858701 ?auto_858703 ) ) ( not ( = ?auto_858701 ?auto_858704 ) ) ( not ( = ?auto_858701 ?auto_858705 ) ) ( not ( = ?auto_858701 ?auto_858706 ) ) ( not ( = ?auto_858701 ?auto_858707 ) ) ( not ( = ?auto_858701 ?auto_858708 ) ) ( not ( = ?auto_858701 ?auto_858709 ) ) ( not ( = ?auto_858701 ?auto_858710 ) ) ( not ( = ?auto_858701 ?auto_858711 ) ) ( not ( = ?auto_858701 ?auto_858712 ) ) ( not ( = ?auto_858701 ?auto_858713 ) ) ( not ( = ?auto_858702 ?auto_858703 ) ) ( not ( = ?auto_858702 ?auto_858704 ) ) ( not ( = ?auto_858702 ?auto_858705 ) ) ( not ( = ?auto_858702 ?auto_858706 ) ) ( not ( = ?auto_858702 ?auto_858707 ) ) ( not ( = ?auto_858702 ?auto_858708 ) ) ( not ( = ?auto_858702 ?auto_858709 ) ) ( not ( = ?auto_858702 ?auto_858710 ) ) ( not ( = ?auto_858702 ?auto_858711 ) ) ( not ( = ?auto_858702 ?auto_858712 ) ) ( not ( = ?auto_858702 ?auto_858713 ) ) ( not ( = ?auto_858703 ?auto_858704 ) ) ( not ( = ?auto_858703 ?auto_858705 ) ) ( not ( = ?auto_858703 ?auto_858706 ) ) ( not ( = ?auto_858703 ?auto_858707 ) ) ( not ( = ?auto_858703 ?auto_858708 ) ) ( not ( = ?auto_858703 ?auto_858709 ) ) ( not ( = ?auto_858703 ?auto_858710 ) ) ( not ( = ?auto_858703 ?auto_858711 ) ) ( not ( = ?auto_858703 ?auto_858712 ) ) ( not ( = ?auto_858703 ?auto_858713 ) ) ( not ( = ?auto_858704 ?auto_858705 ) ) ( not ( = ?auto_858704 ?auto_858706 ) ) ( not ( = ?auto_858704 ?auto_858707 ) ) ( not ( = ?auto_858704 ?auto_858708 ) ) ( not ( = ?auto_858704 ?auto_858709 ) ) ( not ( = ?auto_858704 ?auto_858710 ) ) ( not ( = ?auto_858704 ?auto_858711 ) ) ( not ( = ?auto_858704 ?auto_858712 ) ) ( not ( = ?auto_858704 ?auto_858713 ) ) ( not ( = ?auto_858705 ?auto_858706 ) ) ( not ( = ?auto_858705 ?auto_858707 ) ) ( not ( = ?auto_858705 ?auto_858708 ) ) ( not ( = ?auto_858705 ?auto_858709 ) ) ( not ( = ?auto_858705 ?auto_858710 ) ) ( not ( = ?auto_858705 ?auto_858711 ) ) ( not ( = ?auto_858705 ?auto_858712 ) ) ( not ( = ?auto_858705 ?auto_858713 ) ) ( not ( = ?auto_858706 ?auto_858707 ) ) ( not ( = ?auto_858706 ?auto_858708 ) ) ( not ( = ?auto_858706 ?auto_858709 ) ) ( not ( = ?auto_858706 ?auto_858710 ) ) ( not ( = ?auto_858706 ?auto_858711 ) ) ( not ( = ?auto_858706 ?auto_858712 ) ) ( not ( = ?auto_858706 ?auto_858713 ) ) ( not ( = ?auto_858707 ?auto_858708 ) ) ( not ( = ?auto_858707 ?auto_858709 ) ) ( not ( = ?auto_858707 ?auto_858710 ) ) ( not ( = ?auto_858707 ?auto_858711 ) ) ( not ( = ?auto_858707 ?auto_858712 ) ) ( not ( = ?auto_858707 ?auto_858713 ) ) ( not ( = ?auto_858708 ?auto_858709 ) ) ( not ( = ?auto_858708 ?auto_858710 ) ) ( not ( = ?auto_858708 ?auto_858711 ) ) ( not ( = ?auto_858708 ?auto_858712 ) ) ( not ( = ?auto_858708 ?auto_858713 ) ) ( not ( = ?auto_858709 ?auto_858710 ) ) ( not ( = ?auto_858709 ?auto_858711 ) ) ( not ( = ?auto_858709 ?auto_858712 ) ) ( not ( = ?auto_858709 ?auto_858713 ) ) ( not ( = ?auto_858710 ?auto_858711 ) ) ( not ( = ?auto_858710 ?auto_858712 ) ) ( not ( = ?auto_858710 ?auto_858713 ) ) ( not ( = ?auto_858711 ?auto_858712 ) ) ( not ( = ?auto_858711 ?auto_858713 ) ) ( not ( = ?auto_858712 ?auto_858713 ) ) ( ON ?auto_858711 ?auto_858712 ) ( ON ?auto_858710 ?auto_858711 ) ( ON ?auto_858709 ?auto_858710 ) ( ON ?auto_858708 ?auto_858709 ) ( ON ?auto_858707 ?auto_858708 ) ( CLEAR ?auto_858705 ) ( ON ?auto_858706 ?auto_858707 ) ( CLEAR ?auto_858706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_858698 ?auto_858699 ?auto_858700 ?auto_858701 ?auto_858702 ?auto_858703 ?auto_858704 ?auto_858705 ?auto_858706 )
      ( MAKE-15PILE ?auto_858698 ?auto_858699 ?auto_858700 ?auto_858701 ?auto_858702 ?auto_858703 ?auto_858704 ?auto_858705 ?auto_858706 ?auto_858707 ?auto_858708 ?auto_858709 ?auto_858710 ?auto_858711 ?auto_858712 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_858760 - BLOCK
      ?auto_858761 - BLOCK
      ?auto_858762 - BLOCK
      ?auto_858763 - BLOCK
      ?auto_858764 - BLOCK
      ?auto_858765 - BLOCK
      ?auto_858766 - BLOCK
      ?auto_858767 - BLOCK
      ?auto_858768 - BLOCK
      ?auto_858769 - BLOCK
      ?auto_858770 - BLOCK
      ?auto_858771 - BLOCK
      ?auto_858772 - BLOCK
      ?auto_858773 - BLOCK
      ?auto_858774 - BLOCK
    )
    :vars
    (
      ?auto_858775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858774 ?auto_858775 ) ( ON-TABLE ?auto_858760 ) ( ON ?auto_858761 ?auto_858760 ) ( ON ?auto_858762 ?auto_858761 ) ( ON ?auto_858763 ?auto_858762 ) ( ON ?auto_858764 ?auto_858763 ) ( ON ?auto_858765 ?auto_858764 ) ( ON ?auto_858766 ?auto_858765 ) ( not ( = ?auto_858760 ?auto_858761 ) ) ( not ( = ?auto_858760 ?auto_858762 ) ) ( not ( = ?auto_858760 ?auto_858763 ) ) ( not ( = ?auto_858760 ?auto_858764 ) ) ( not ( = ?auto_858760 ?auto_858765 ) ) ( not ( = ?auto_858760 ?auto_858766 ) ) ( not ( = ?auto_858760 ?auto_858767 ) ) ( not ( = ?auto_858760 ?auto_858768 ) ) ( not ( = ?auto_858760 ?auto_858769 ) ) ( not ( = ?auto_858760 ?auto_858770 ) ) ( not ( = ?auto_858760 ?auto_858771 ) ) ( not ( = ?auto_858760 ?auto_858772 ) ) ( not ( = ?auto_858760 ?auto_858773 ) ) ( not ( = ?auto_858760 ?auto_858774 ) ) ( not ( = ?auto_858760 ?auto_858775 ) ) ( not ( = ?auto_858761 ?auto_858762 ) ) ( not ( = ?auto_858761 ?auto_858763 ) ) ( not ( = ?auto_858761 ?auto_858764 ) ) ( not ( = ?auto_858761 ?auto_858765 ) ) ( not ( = ?auto_858761 ?auto_858766 ) ) ( not ( = ?auto_858761 ?auto_858767 ) ) ( not ( = ?auto_858761 ?auto_858768 ) ) ( not ( = ?auto_858761 ?auto_858769 ) ) ( not ( = ?auto_858761 ?auto_858770 ) ) ( not ( = ?auto_858761 ?auto_858771 ) ) ( not ( = ?auto_858761 ?auto_858772 ) ) ( not ( = ?auto_858761 ?auto_858773 ) ) ( not ( = ?auto_858761 ?auto_858774 ) ) ( not ( = ?auto_858761 ?auto_858775 ) ) ( not ( = ?auto_858762 ?auto_858763 ) ) ( not ( = ?auto_858762 ?auto_858764 ) ) ( not ( = ?auto_858762 ?auto_858765 ) ) ( not ( = ?auto_858762 ?auto_858766 ) ) ( not ( = ?auto_858762 ?auto_858767 ) ) ( not ( = ?auto_858762 ?auto_858768 ) ) ( not ( = ?auto_858762 ?auto_858769 ) ) ( not ( = ?auto_858762 ?auto_858770 ) ) ( not ( = ?auto_858762 ?auto_858771 ) ) ( not ( = ?auto_858762 ?auto_858772 ) ) ( not ( = ?auto_858762 ?auto_858773 ) ) ( not ( = ?auto_858762 ?auto_858774 ) ) ( not ( = ?auto_858762 ?auto_858775 ) ) ( not ( = ?auto_858763 ?auto_858764 ) ) ( not ( = ?auto_858763 ?auto_858765 ) ) ( not ( = ?auto_858763 ?auto_858766 ) ) ( not ( = ?auto_858763 ?auto_858767 ) ) ( not ( = ?auto_858763 ?auto_858768 ) ) ( not ( = ?auto_858763 ?auto_858769 ) ) ( not ( = ?auto_858763 ?auto_858770 ) ) ( not ( = ?auto_858763 ?auto_858771 ) ) ( not ( = ?auto_858763 ?auto_858772 ) ) ( not ( = ?auto_858763 ?auto_858773 ) ) ( not ( = ?auto_858763 ?auto_858774 ) ) ( not ( = ?auto_858763 ?auto_858775 ) ) ( not ( = ?auto_858764 ?auto_858765 ) ) ( not ( = ?auto_858764 ?auto_858766 ) ) ( not ( = ?auto_858764 ?auto_858767 ) ) ( not ( = ?auto_858764 ?auto_858768 ) ) ( not ( = ?auto_858764 ?auto_858769 ) ) ( not ( = ?auto_858764 ?auto_858770 ) ) ( not ( = ?auto_858764 ?auto_858771 ) ) ( not ( = ?auto_858764 ?auto_858772 ) ) ( not ( = ?auto_858764 ?auto_858773 ) ) ( not ( = ?auto_858764 ?auto_858774 ) ) ( not ( = ?auto_858764 ?auto_858775 ) ) ( not ( = ?auto_858765 ?auto_858766 ) ) ( not ( = ?auto_858765 ?auto_858767 ) ) ( not ( = ?auto_858765 ?auto_858768 ) ) ( not ( = ?auto_858765 ?auto_858769 ) ) ( not ( = ?auto_858765 ?auto_858770 ) ) ( not ( = ?auto_858765 ?auto_858771 ) ) ( not ( = ?auto_858765 ?auto_858772 ) ) ( not ( = ?auto_858765 ?auto_858773 ) ) ( not ( = ?auto_858765 ?auto_858774 ) ) ( not ( = ?auto_858765 ?auto_858775 ) ) ( not ( = ?auto_858766 ?auto_858767 ) ) ( not ( = ?auto_858766 ?auto_858768 ) ) ( not ( = ?auto_858766 ?auto_858769 ) ) ( not ( = ?auto_858766 ?auto_858770 ) ) ( not ( = ?auto_858766 ?auto_858771 ) ) ( not ( = ?auto_858766 ?auto_858772 ) ) ( not ( = ?auto_858766 ?auto_858773 ) ) ( not ( = ?auto_858766 ?auto_858774 ) ) ( not ( = ?auto_858766 ?auto_858775 ) ) ( not ( = ?auto_858767 ?auto_858768 ) ) ( not ( = ?auto_858767 ?auto_858769 ) ) ( not ( = ?auto_858767 ?auto_858770 ) ) ( not ( = ?auto_858767 ?auto_858771 ) ) ( not ( = ?auto_858767 ?auto_858772 ) ) ( not ( = ?auto_858767 ?auto_858773 ) ) ( not ( = ?auto_858767 ?auto_858774 ) ) ( not ( = ?auto_858767 ?auto_858775 ) ) ( not ( = ?auto_858768 ?auto_858769 ) ) ( not ( = ?auto_858768 ?auto_858770 ) ) ( not ( = ?auto_858768 ?auto_858771 ) ) ( not ( = ?auto_858768 ?auto_858772 ) ) ( not ( = ?auto_858768 ?auto_858773 ) ) ( not ( = ?auto_858768 ?auto_858774 ) ) ( not ( = ?auto_858768 ?auto_858775 ) ) ( not ( = ?auto_858769 ?auto_858770 ) ) ( not ( = ?auto_858769 ?auto_858771 ) ) ( not ( = ?auto_858769 ?auto_858772 ) ) ( not ( = ?auto_858769 ?auto_858773 ) ) ( not ( = ?auto_858769 ?auto_858774 ) ) ( not ( = ?auto_858769 ?auto_858775 ) ) ( not ( = ?auto_858770 ?auto_858771 ) ) ( not ( = ?auto_858770 ?auto_858772 ) ) ( not ( = ?auto_858770 ?auto_858773 ) ) ( not ( = ?auto_858770 ?auto_858774 ) ) ( not ( = ?auto_858770 ?auto_858775 ) ) ( not ( = ?auto_858771 ?auto_858772 ) ) ( not ( = ?auto_858771 ?auto_858773 ) ) ( not ( = ?auto_858771 ?auto_858774 ) ) ( not ( = ?auto_858771 ?auto_858775 ) ) ( not ( = ?auto_858772 ?auto_858773 ) ) ( not ( = ?auto_858772 ?auto_858774 ) ) ( not ( = ?auto_858772 ?auto_858775 ) ) ( not ( = ?auto_858773 ?auto_858774 ) ) ( not ( = ?auto_858773 ?auto_858775 ) ) ( not ( = ?auto_858774 ?auto_858775 ) ) ( ON ?auto_858773 ?auto_858774 ) ( ON ?auto_858772 ?auto_858773 ) ( ON ?auto_858771 ?auto_858772 ) ( ON ?auto_858770 ?auto_858771 ) ( ON ?auto_858769 ?auto_858770 ) ( ON ?auto_858768 ?auto_858769 ) ( CLEAR ?auto_858766 ) ( ON ?auto_858767 ?auto_858768 ) ( CLEAR ?auto_858767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_858760 ?auto_858761 ?auto_858762 ?auto_858763 ?auto_858764 ?auto_858765 ?auto_858766 ?auto_858767 )
      ( MAKE-15PILE ?auto_858760 ?auto_858761 ?auto_858762 ?auto_858763 ?auto_858764 ?auto_858765 ?auto_858766 ?auto_858767 ?auto_858768 ?auto_858769 ?auto_858770 ?auto_858771 ?auto_858772 ?auto_858773 ?auto_858774 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_858822 - BLOCK
      ?auto_858823 - BLOCK
      ?auto_858824 - BLOCK
      ?auto_858825 - BLOCK
      ?auto_858826 - BLOCK
      ?auto_858827 - BLOCK
      ?auto_858828 - BLOCK
      ?auto_858829 - BLOCK
      ?auto_858830 - BLOCK
      ?auto_858831 - BLOCK
      ?auto_858832 - BLOCK
      ?auto_858833 - BLOCK
      ?auto_858834 - BLOCK
      ?auto_858835 - BLOCK
      ?auto_858836 - BLOCK
    )
    :vars
    (
      ?auto_858837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858836 ?auto_858837 ) ( ON-TABLE ?auto_858822 ) ( ON ?auto_858823 ?auto_858822 ) ( ON ?auto_858824 ?auto_858823 ) ( ON ?auto_858825 ?auto_858824 ) ( ON ?auto_858826 ?auto_858825 ) ( ON ?auto_858827 ?auto_858826 ) ( not ( = ?auto_858822 ?auto_858823 ) ) ( not ( = ?auto_858822 ?auto_858824 ) ) ( not ( = ?auto_858822 ?auto_858825 ) ) ( not ( = ?auto_858822 ?auto_858826 ) ) ( not ( = ?auto_858822 ?auto_858827 ) ) ( not ( = ?auto_858822 ?auto_858828 ) ) ( not ( = ?auto_858822 ?auto_858829 ) ) ( not ( = ?auto_858822 ?auto_858830 ) ) ( not ( = ?auto_858822 ?auto_858831 ) ) ( not ( = ?auto_858822 ?auto_858832 ) ) ( not ( = ?auto_858822 ?auto_858833 ) ) ( not ( = ?auto_858822 ?auto_858834 ) ) ( not ( = ?auto_858822 ?auto_858835 ) ) ( not ( = ?auto_858822 ?auto_858836 ) ) ( not ( = ?auto_858822 ?auto_858837 ) ) ( not ( = ?auto_858823 ?auto_858824 ) ) ( not ( = ?auto_858823 ?auto_858825 ) ) ( not ( = ?auto_858823 ?auto_858826 ) ) ( not ( = ?auto_858823 ?auto_858827 ) ) ( not ( = ?auto_858823 ?auto_858828 ) ) ( not ( = ?auto_858823 ?auto_858829 ) ) ( not ( = ?auto_858823 ?auto_858830 ) ) ( not ( = ?auto_858823 ?auto_858831 ) ) ( not ( = ?auto_858823 ?auto_858832 ) ) ( not ( = ?auto_858823 ?auto_858833 ) ) ( not ( = ?auto_858823 ?auto_858834 ) ) ( not ( = ?auto_858823 ?auto_858835 ) ) ( not ( = ?auto_858823 ?auto_858836 ) ) ( not ( = ?auto_858823 ?auto_858837 ) ) ( not ( = ?auto_858824 ?auto_858825 ) ) ( not ( = ?auto_858824 ?auto_858826 ) ) ( not ( = ?auto_858824 ?auto_858827 ) ) ( not ( = ?auto_858824 ?auto_858828 ) ) ( not ( = ?auto_858824 ?auto_858829 ) ) ( not ( = ?auto_858824 ?auto_858830 ) ) ( not ( = ?auto_858824 ?auto_858831 ) ) ( not ( = ?auto_858824 ?auto_858832 ) ) ( not ( = ?auto_858824 ?auto_858833 ) ) ( not ( = ?auto_858824 ?auto_858834 ) ) ( not ( = ?auto_858824 ?auto_858835 ) ) ( not ( = ?auto_858824 ?auto_858836 ) ) ( not ( = ?auto_858824 ?auto_858837 ) ) ( not ( = ?auto_858825 ?auto_858826 ) ) ( not ( = ?auto_858825 ?auto_858827 ) ) ( not ( = ?auto_858825 ?auto_858828 ) ) ( not ( = ?auto_858825 ?auto_858829 ) ) ( not ( = ?auto_858825 ?auto_858830 ) ) ( not ( = ?auto_858825 ?auto_858831 ) ) ( not ( = ?auto_858825 ?auto_858832 ) ) ( not ( = ?auto_858825 ?auto_858833 ) ) ( not ( = ?auto_858825 ?auto_858834 ) ) ( not ( = ?auto_858825 ?auto_858835 ) ) ( not ( = ?auto_858825 ?auto_858836 ) ) ( not ( = ?auto_858825 ?auto_858837 ) ) ( not ( = ?auto_858826 ?auto_858827 ) ) ( not ( = ?auto_858826 ?auto_858828 ) ) ( not ( = ?auto_858826 ?auto_858829 ) ) ( not ( = ?auto_858826 ?auto_858830 ) ) ( not ( = ?auto_858826 ?auto_858831 ) ) ( not ( = ?auto_858826 ?auto_858832 ) ) ( not ( = ?auto_858826 ?auto_858833 ) ) ( not ( = ?auto_858826 ?auto_858834 ) ) ( not ( = ?auto_858826 ?auto_858835 ) ) ( not ( = ?auto_858826 ?auto_858836 ) ) ( not ( = ?auto_858826 ?auto_858837 ) ) ( not ( = ?auto_858827 ?auto_858828 ) ) ( not ( = ?auto_858827 ?auto_858829 ) ) ( not ( = ?auto_858827 ?auto_858830 ) ) ( not ( = ?auto_858827 ?auto_858831 ) ) ( not ( = ?auto_858827 ?auto_858832 ) ) ( not ( = ?auto_858827 ?auto_858833 ) ) ( not ( = ?auto_858827 ?auto_858834 ) ) ( not ( = ?auto_858827 ?auto_858835 ) ) ( not ( = ?auto_858827 ?auto_858836 ) ) ( not ( = ?auto_858827 ?auto_858837 ) ) ( not ( = ?auto_858828 ?auto_858829 ) ) ( not ( = ?auto_858828 ?auto_858830 ) ) ( not ( = ?auto_858828 ?auto_858831 ) ) ( not ( = ?auto_858828 ?auto_858832 ) ) ( not ( = ?auto_858828 ?auto_858833 ) ) ( not ( = ?auto_858828 ?auto_858834 ) ) ( not ( = ?auto_858828 ?auto_858835 ) ) ( not ( = ?auto_858828 ?auto_858836 ) ) ( not ( = ?auto_858828 ?auto_858837 ) ) ( not ( = ?auto_858829 ?auto_858830 ) ) ( not ( = ?auto_858829 ?auto_858831 ) ) ( not ( = ?auto_858829 ?auto_858832 ) ) ( not ( = ?auto_858829 ?auto_858833 ) ) ( not ( = ?auto_858829 ?auto_858834 ) ) ( not ( = ?auto_858829 ?auto_858835 ) ) ( not ( = ?auto_858829 ?auto_858836 ) ) ( not ( = ?auto_858829 ?auto_858837 ) ) ( not ( = ?auto_858830 ?auto_858831 ) ) ( not ( = ?auto_858830 ?auto_858832 ) ) ( not ( = ?auto_858830 ?auto_858833 ) ) ( not ( = ?auto_858830 ?auto_858834 ) ) ( not ( = ?auto_858830 ?auto_858835 ) ) ( not ( = ?auto_858830 ?auto_858836 ) ) ( not ( = ?auto_858830 ?auto_858837 ) ) ( not ( = ?auto_858831 ?auto_858832 ) ) ( not ( = ?auto_858831 ?auto_858833 ) ) ( not ( = ?auto_858831 ?auto_858834 ) ) ( not ( = ?auto_858831 ?auto_858835 ) ) ( not ( = ?auto_858831 ?auto_858836 ) ) ( not ( = ?auto_858831 ?auto_858837 ) ) ( not ( = ?auto_858832 ?auto_858833 ) ) ( not ( = ?auto_858832 ?auto_858834 ) ) ( not ( = ?auto_858832 ?auto_858835 ) ) ( not ( = ?auto_858832 ?auto_858836 ) ) ( not ( = ?auto_858832 ?auto_858837 ) ) ( not ( = ?auto_858833 ?auto_858834 ) ) ( not ( = ?auto_858833 ?auto_858835 ) ) ( not ( = ?auto_858833 ?auto_858836 ) ) ( not ( = ?auto_858833 ?auto_858837 ) ) ( not ( = ?auto_858834 ?auto_858835 ) ) ( not ( = ?auto_858834 ?auto_858836 ) ) ( not ( = ?auto_858834 ?auto_858837 ) ) ( not ( = ?auto_858835 ?auto_858836 ) ) ( not ( = ?auto_858835 ?auto_858837 ) ) ( not ( = ?auto_858836 ?auto_858837 ) ) ( ON ?auto_858835 ?auto_858836 ) ( ON ?auto_858834 ?auto_858835 ) ( ON ?auto_858833 ?auto_858834 ) ( ON ?auto_858832 ?auto_858833 ) ( ON ?auto_858831 ?auto_858832 ) ( ON ?auto_858830 ?auto_858831 ) ( ON ?auto_858829 ?auto_858830 ) ( CLEAR ?auto_858827 ) ( ON ?auto_858828 ?auto_858829 ) ( CLEAR ?auto_858828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_858822 ?auto_858823 ?auto_858824 ?auto_858825 ?auto_858826 ?auto_858827 ?auto_858828 )
      ( MAKE-15PILE ?auto_858822 ?auto_858823 ?auto_858824 ?auto_858825 ?auto_858826 ?auto_858827 ?auto_858828 ?auto_858829 ?auto_858830 ?auto_858831 ?auto_858832 ?auto_858833 ?auto_858834 ?auto_858835 ?auto_858836 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_858884 - BLOCK
      ?auto_858885 - BLOCK
      ?auto_858886 - BLOCK
      ?auto_858887 - BLOCK
      ?auto_858888 - BLOCK
      ?auto_858889 - BLOCK
      ?auto_858890 - BLOCK
      ?auto_858891 - BLOCK
      ?auto_858892 - BLOCK
      ?auto_858893 - BLOCK
      ?auto_858894 - BLOCK
      ?auto_858895 - BLOCK
      ?auto_858896 - BLOCK
      ?auto_858897 - BLOCK
      ?auto_858898 - BLOCK
    )
    :vars
    (
      ?auto_858899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858898 ?auto_858899 ) ( ON-TABLE ?auto_858884 ) ( ON ?auto_858885 ?auto_858884 ) ( ON ?auto_858886 ?auto_858885 ) ( ON ?auto_858887 ?auto_858886 ) ( ON ?auto_858888 ?auto_858887 ) ( not ( = ?auto_858884 ?auto_858885 ) ) ( not ( = ?auto_858884 ?auto_858886 ) ) ( not ( = ?auto_858884 ?auto_858887 ) ) ( not ( = ?auto_858884 ?auto_858888 ) ) ( not ( = ?auto_858884 ?auto_858889 ) ) ( not ( = ?auto_858884 ?auto_858890 ) ) ( not ( = ?auto_858884 ?auto_858891 ) ) ( not ( = ?auto_858884 ?auto_858892 ) ) ( not ( = ?auto_858884 ?auto_858893 ) ) ( not ( = ?auto_858884 ?auto_858894 ) ) ( not ( = ?auto_858884 ?auto_858895 ) ) ( not ( = ?auto_858884 ?auto_858896 ) ) ( not ( = ?auto_858884 ?auto_858897 ) ) ( not ( = ?auto_858884 ?auto_858898 ) ) ( not ( = ?auto_858884 ?auto_858899 ) ) ( not ( = ?auto_858885 ?auto_858886 ) ) ( not ( = ?auto_858885 ?auto_858887 ) ) ( not ( = ?auto_858885 ?auto_858888 ) ) ( not ( = ?auto_858885 ?auto_858889 ) ) ( not ( = ?auto_858885 ?auto_858890 ) ) ( not ( = ?auto_858885 ?auto_858891 ) ) ( not ( = ?auto_858885 ?auto_858892 ) ) ( not ( = ?auto_858885 ?auto_858893 ) ) ( not ( = ?auto_858885 ?auto_858894 ) ) ( not ( = ?auto_858885 ?auto_858895 ) ) ( not ( = ?auto_858885 ?auto_858896 ) ) ( not ( = ?auto_858885 ?auto_858897 ) ) ( not ( = ?auto_858885 ?auto_858898 ) ) ( not ( = ?auto_858885 ?auto_858899 ) ) ( not ( = ?auto_858886 ?auto_858887 ) ) ( not ( = ?auto_858886 ?auto_858888 ) ) ( not ( = ?auto_858886 ?auto_858889 ) ) ( not ( = ?auto_858886 ?auto_858890 ) ) ( not ( = ?auto_858886 ?auto_858891 ) ) ( not ( = ?auto_858886 ?auto_858892 ) ) ( not ( = ?auto_858886 ?auto_858893 ) ) ( not ( = ?auto_858886 ?auto_858894 ) ) ( not ( = ?auto_858886 ?auto_858895 ) ) ( not ( = ?auto_858886 ?auto_858896 ) ) ( not ( = ?auto_858886 ?auto_858897 ) ) ( not ( = ?auto_858886 ?auto_858898 ) ) ( not ( = ?auto_858886 ?auto_858899 ) ) ( not ( = ?auto_858887 ?auto_858888 ) ) ( not ( = ?auto_858887 ?auto_858889 ) ) ( not ( = ?auto_858887 ?auto_858890 ) ) ( not ( = ?auto_858887 ?auto_858891 ) ) ( not ( = ?auto_858887 ?auto_858892 ) ) ( not ( = ?auto_858887 ?auto_858893 ) ) ( not ( = ?auto_858887 ?auto_858894 ) ) ( not ( = ?auto_858887 ?auto_858895 ) ) ( not ( = ?auto_858887 ?auto_858896 ) ) ( not ( = ?auto_858887 ?auto_858897 ) ) ( not ( = ?auto_858887 ?auto_858898 ) ) ( not ( = ?auto_858887 ?auto_858899 ) ) ( not ( = ?auto_858888 ?auto_858889 ) ) ( not ( = ?auto_858888 ?auto_858890 ) ) ( not ( = ?auto_858888 ?auto_858891 ) ) ( not ( = ?auto_858888 ?auto_858892 ) ) ( not ( = ?auto_858888 ?auto_858893 ) ) ( not ( = ?auto_858888 ?auto_858894 ) ) ( not ( = ?auto_858888 ?auto_858895 ) ) ( not ( = ?auto_858888 ?auto_858896 ) ) ( not ( = ?auto_858888 ?auto_858897 ) ) ( not ( = ?auto_858888 ?auto_858898 ) ) ( not ( = ?auto_858888 ?auto_858899 ) ) ( not ( = ?auto_858889 ?auto_858890 ) ) ( not ( = ?auto_858889 ?auto_858891 ) ) ( not ( = ?auto_858889 ?auto_858892 ) ) ( not ( = ?auto_858889 ?auto_858893 ) ) ( not ( = ?auto_858889 ?auto_858894 ) ) ( not ( = ?auto_858889 ?auto_858895 ) ) ( not ( = ?auto_858889 ?auto_858896 ) ) ( not ( = ?auto_858889 ?auto_858897 ) ) ( not ( = ?auto_858889 ?auto_858898 ) ) ( not ( = ?auto_858889 ?auto_858899 ) ) ( not ( = ?auto_858890 ?auto_858891 ) ) ( not ( = ?auto_858890 ?auto_858892 ) ) ( not ( = ?auto_858890 ?auto_858893 ) ) ( not ( = ?auto_858890 ?auto_858894 ) ) ( not ( = ?auto_858890 ?auto_858895 ) ) ( not ( = ?auto_858890 ?auto_858896 ) ) ( not ( = ?auto_858890 ?auto_858897 ) ) ( not ( = ?auto_858890 ?auto_858898 ) ) ( not ( = ?auto_858890 ?auto_858899 ) ) ( not ( = ?auto_858891 ?auto_858892 ) ) ( not ( = ?auto_858891 ?auto_858893 ) ) ( not ( = ?auto_858891 ?auto_858894 ) ) ( not ( = ?auto_858891 ?auto_858895 ) ) ( not ( = ?auto_858891 ?auto_858896 ) ) ( not ( = ?auto_858891 ?auto_858897 ) ) ( not ( = ?auto_858891 ?auto_858898 ) ) ( not ( = ?auto_858891 ?auto_858899 ) ) ( not ( = ?auto_858892 ?auto_858893 ) ) ( not ( = ?auto_858892 ?auto_858894 ) ) ( not ( = ?auto_858892 ?auto_858895 ) ) ( not ( = ?auto_858892 ?auto_858896 ) ) ( not ( = ?auto_858892 ?auto_858897 ) ) ( not ( = ?auto_858892 ?auto_858898 ) ) ( not ( = ?auto_858892 ?auto_858899 ) ) ( not ( = ?auto_858893 ?auto_858894 ) ) ( not ( = ?auto_858893 ?auto_858895 ) ) ( not ( = ?auto_858893 ?auto_858896 ) ) ( not ( = ?auto_858893 ?auto_858897 ) ) ( not ( = ?auto_858893 ?auto_858898 ) ) ( not ( = ?auto_858893 ?auto_858899 ) ) ( not ( = ?auto_858894 ?auto_858895 ) ) ( not ( = ?auto_858894 ?auto_858896 ) ) ( not ( = ?auto_858894 ?auto_858897 ) ) ( not ( = ?auto_858894 ?auto_858898 ) ) ( not ( = ?auto_858894 ?auto_858899 ) ) ( not ( = ?auto_858895 ?auto_858896 ) ) ( not ( = ?auto_858895 ?auto_858897 ) ) ( not ( = ?auto_858895 ?auto_858898 ) ) ( not ( = ?auto_858895 ?auto_858899 ) ) ( not ( = ?auto_858896 ?auto_858897 ) ) ( not ( = ?auto_858896 ?auto_858898 ) ) ( not ( = ?auto_858896 ?auto_858899 ) ) ( not ( = ?auto_858897 ?auto_858898 ) ) ( not ( = ?auto_858897 ?auto_858899 ) ) ( not ( = ?auto_858898 ?auto_858899 ) ) ( ON ?auto_858897 ?auto_858898 ) ( ON ?auto_858896 ?auto_858897 ) ( ON ?auto_858895 ?auto_858896 ) ( ON ?auto_858894 ?auto_858895 ) ( ON ?auto_858893 ?auto_858894 ) ( ON ?auto_858892 ?auto_858893 ) ( ON ?auto_858891 ?auto_858892 ) ( ON ?auto_858890 ?auto_858891 ) ( CLEAR ?auto_858888 ) ( ON ?auto_858889 ?auto_858890 ) ( CLEAR ?auto_858889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_858884 ?auto_858885 ?auto_858886 ?auto_858887 ?auto_858888 ?auto_858889 )
      ( MAKE-15PILE ?auto_858884 ?auto_858885 ?auto_858886 ?auto_858887 ?auto_858888 ?auto_858889 ?auto_858890 ?auto_858891 ?auto_858892 ?auto_858893 ?auto_858894 ?auto_858895 ?auto_858896 ?auto_858897 ?auto_858898 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_858946 - BLOCK
      ?auto_858947 - BLOCK
      ?auto_858948 - BLOCK
      ?auto_858949 - BLOCK
      ?auto_858950 - BLOCK
      ?auto_858951 - BLOCK
      ?auto_858952 - BLOCK
      ?auto_858953 - BLOCK
      ?auto_858954 - BLOCK
      ?auto_858955 - BLOCK
      ?auto_858956 - BLOCK
      ?auto_858957 - BLOCK
      ?auto_858958 - BLOCK
      ?auto_858959 - BLOCK
      ?auto_858960 - BLOCK
    )
    :vars
    (
      ?auto_858961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_858960 ?auto_858961 ) ( ON-TABLE ?auto_858946 ) ( ON ?auto_858947 ?auto_858946 ) ( ON ?auto_858948 ?auto_858947 ) ( ON ?auto_858949 ?auto_858948 ) ( not ( = ?auto_858946 ?auto_858947 ) ) ( not ( = ?auto_858946 ?auto_858948 ) ) ( not ( = ?auto_858946 ?auto_858949 ) ) ( not ( = ?auto_858946 ?auto_858950 ) ) ( not ( = ?auto_858946 ?auto_858951 ) ) ( not ( = ?auto_858946 ?auto_858952 ) ) ( not ( = ?auto_858946 ?auto_858953 ) ) ( not ( = ?auto_858946 ?auto_858954 ) ) ( not ( = ?auto_858946 ?auto_858955 ) ) ( not ( = ?auto_858946 ?auto_858956 ) ) ( not ( = ?auto_858946 ?auto_858957 ) ) ( not ( = ?auto_858946 ?auto_858958 ) ) ( not ( = ?auto_858946 ?auto_858959 ) ) ( not ( = ?auto_858946 ?auto_858960 ) ) ( not ( = ?auto_858946 ?auto_858961 ) ) ( not ( = ?auto_858947 ?auto_858948 ) ) ( not ( = ?auto_858947 ?auto_858949 ) ) ( not ( = ?auto_858947 ?auto_858950 ) ) ( not ( = ?auto_858947 ?auto_858951 ) ) ( not ( = ?auto_858947 ?auto_858952 ) ) ( not ( = ?auto_858947 ?auto_858953 ) ) ( not ( = ?auto_858947 ?auto_858954 ) ) ( not ( = ?auto_858947 ?auto_858955 ) ) ( not ( = ?auto_858947 ?auto_858956 ) ) ( not ( = ?auto_858947 ?auto_858957 ) ) ( not ( = ?auto_858947 ?auto_858958 ) ) ( not ( = ?auto_858947 ?auto_858959 ) ) ( not ( = ?auto_858947 ?auto_858960 ) ) ( not ( = ?auto_858947 ?auto_858961 ) ) ( not ( = ?auto_858948 ?auto_858949 ) ) ( not ( = ?auto_858948 ?auto_858950 ) ) ( not ( = ?auto_858948 ?auto_858951 ) ) ( not ( = ?auto_858948 ?auto_858952 ) ) ( not ( = ?auto_858948 ?auto_858953 ) ) ( not ( = ?auto_858948 ?auto_858954 ) ) ( not ( = ?auto_858948 ?auto_858955 ) ) ( not ( = ?auto_858948 ?auto_858956 ) ) ( not ( = ?auto_858948 ?auto_858957 ) ) ( not ( = ?auto_858948 ?auto_858958 ) ) ( not ( = ?auto_858948 ?auto_858959 ) ) ( not ( = ?auto_858948 ?auto_858960 ) ) ( not ( = ?auto_858948 ?auto_858961 ) ) ( not ( = ?auto_858949 ?auto_858950 ) ) ( not ( = ?auto_858949 ?auto_858951 ) ) ( not ( = ?auto_858949 ?auto_858952 ) ) ( not ( = ?auto_858949 ?auto_858953 ) ) ( not ( = ?auto_858949 ?auto_858954 ) ) ( not ( = ?auto_858949 ?auto_858955 ) ) ( not ( = ?auto_858949 ?auto_858956 ) ) ( not ( = ?auto_858949 ?auto_858957 ) ) ( not ( = ?auto_858949 ?auto_858958 ) ) ( not ( = ?auto_858949 ?auto_858959 ) ) ( not ( = ?auto_858949 ?auto_858960 ) ) ( not ( = ?auto_858949 ?auto_858961 ) ) ( not ( = ?auto_858950 ?auto_858951 ) ) ( not ( = ?auto_858950 ?auto_858952 ) ) ( not ( = ?auto_858950 ?auto_858953 ) ) ( not ( = ?auto_858950 ?auto_858954 ) ) ( not ( = ?auto_858950 ?auto_858955 ) ) ( not ( = ?auto_858950 ?auto_858956 ) ) ( not ( = ?auto_858950 ?auto_858957 ) ) ( not ( = ?auto_858950 ?auto_858958 ) ) ( not ( = ?auto_858950 ?auto_858959 ) ) ( not ( = ?auto_858950 ?auto_858960 ) ) ( not ( = ?auto_858950 ?auto_858961 ) ) ( not ( = ?auto_858951 ?auto_858952 ) ) ( not ( = ?auto_858951 ?auto_858953 ) ) ( not ( = ?auto_858951 ?auto_858954 ) ) ( not ( = ?auto_858951 ?auto_858955 ) ) ( not ( = ?auto_858951 ?auto_858956 ) ) ( not ( = ?auto_858951 ?auto_858957 ) ) ( not ( = ?auto_858951 ?auto_858958 ) ) ( not ( = ?auto_858951 ?auto_858959 ) ) ( not ( = ?auto_858951 ?auto_858960 ) ) ( not ( = ?auto_858951 ?auto_858961 ) ) ( not ( = ?auto_858952 ?auto_858953 ) ) ( not ( = ?auto_858952 ?auto_858954 ) ) ( not ( = ?auto_858952 ?auto_858955 ) ) ( not ( = ?auto_858952 ?auto_858956 ) ) ( not ( = ?auto_858952 ?auto_858957 ) ) ( not ( = ?auto_858952 ?auto_858958 ) ) ( not ( = ?auto_858952 ?auto_858959 ) ) ( not ( = ?auto_858952 ?auto_858960 ) ) ( not ( = ?auto_858952 ?auto_858961 ) ) ( not ( = ?auto_858953 ?auto_858954 ) ) ( not ( = ?auto_858953 ?auto_858955 ) ) ( not ( = ?auto_858953 ?auto_858956 ) ) ( not ( = ?auto_858953 ?auto_858957 ) ) ( not ( = ?auto_858953 ?auto_858958 ) ) ( not ( = ?auto_858953 ?auto_858959 ) ) ( not ( = ?auto_858953 ?auto_858960 ) ) ( not ( = ?auto_858953 ?auto_858961 ) ) ( not ( = ?auto_858954 ?auto_858955 ) ) ( not ( = ?auto_858954 ?auto_858956 ) ) ( not ( = ?auto_858954 ?auto_858957 ) ) ( not ( = ?auto_858954 ?auto_858958 ) ) ( not ( = ?auto_858954 ?auto_858959 ) ) ( not ( = ?auto_858954 ?auto_858960 ) ) ( not ( = ?auto_858954 ?auto_858961 ) ) ( not ( = ?auto_858955 ?auto_858956 ) ) ( not ( = ?auto_858955 ?auto_858957 ) ) ( not ( = ?auto_858955 ?auto_858958 ) ) ( not ( = ?auto_858955 ?auto_858959 ) ) ( not ( = ?auto_858955 ?auto_858960 ) ) ( not ( = ?auto_858955 ?auto_858961 ) ) ( not ( = ?auto_858956 ?auto_858957 ) ) ( not ( = ?auto_858956 ?auto_858958 ) ) ( not ( = ?auto_858956 ?auto_858959 ) ) ( not ( = ?auto_858956 ?auto_858960 ) ) ( not ( = ?auto_858956 ?auto_858961 ) ) ( not ( = ?auto_858957 ?auto_858958 ) ) ( not ( = ?auto_858957 ?auto_858959 ) ) ( not ( = ?auto_858957 ?auto_858960 ) ) ( not ( = ?auto_858957 ?auto_858961 ) ) ( not ( = ?auto_858958 ?auto_858959 ) ) ( not ( = ?auto_858958 ?auto_858960 ) ) ( not ( = ?auto_858958 ?auto_858961 ) ) ( not ( = ?auto_858959 ?auto_858960 ) ) ( not ( = ?auto_858959 ?auto_858961 ) ) ( not ( = ?auto_858960 ?auto_858961 ) ) ( ON ?auto_858959 ?auto_858960 ) ( ON ?auto_858958 ?auto_858959 ) ( ON ?auto_858957 ?auto_858958 ) ( ON ?auto_858956 ?auto_858957 ) ( ON ?auto_858955 ?auto_858956 ) ( ON ?auto_858954 ?auto_858955 ) ( ON ?auto_858953 ?auto_858954 ) ( ON ?auto_858952 ?auto_858953 ) ( ON ?auto_858951 ?auto_858952 ) ( CLEAR ?auto_858949 ) ( ON ?auto_858950 ?auto_858951 ) ( CLEAR ?auto_858950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_858946 ?auto_858947 ?auto_858948 ?auto_858949 ?auto_858950 )
      ( MAKE-15PILE ?auto_858946 ?auto_858947 ?auto_858948 ?auto_858949 ?auto_858950 ?auto_858951 ?auto_858952 ?auto_858953 ?auto_858954 ?auto_858955 ?auto_858956 ?auto_858957 ?auto_858958 ?auto_858959 ?auto_858960 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_859008 - BLOCK
      ?auto_859009 - BLOCK
      ?auto_859010 - BLOCK
      ?auto_859011 - BLOCK
      ?auto_859012 - BLOCK
      ?auto_859013 - BLOCK
      ?auto_859014 - BLOCK
      ?auto_859015 - BLOCK
      ?auto_859016 - BLOCK
      ?auto_859017 - BLOCK
      ?auto_859018 - BLOCK
      ?auto_859019 - BLOCK
      ?auto_859020 - BLOCK
      ?auto_859021 - BLOCK
      ?auto_859022 - BLOCK
    )
    :vars
    (
      ?auto_859023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859022 ?auto_859023 ) ( ON-TABLE ?auto_859008 ) ( ON ?auto_859009 ?auto_859008 ) ( ON ?auto_859010 ?auto_859009 ) ( not ( = ?auto_859008 ?auto_859009 ) ) ( not ( = ?auto_859008 ?auto_859010 ) ) ( not ( = ?auto_859008 ?auto_859011 ) ) ( not ( = ?auto_859008 ?auto_859012 ) ) ( not ( = ?auto_859008 ?auto_859013 ) ) ( not ( = ?auto_859008 ?auto_859014 ) ) ( not ( = ?auto_859008 ?auto_859015 ) ) ( not ( = ?auto_859008 ?auto_859016 ) ) ( not ( = ?auto_859008 ?auto_859017 ) ) ( not ( = ?auto_859008 ?auto_859018 ) ) ( not ( = ?auto_859008 ?auto_859019 ) ) ( not ( = ?auto_859008 ?auto_859020 ) ) ( not ( = ?auto_859008 ?auto_859021 ) ) ( not ( = ?auto_859008 ?auto_859022 ) ) ( not ( = ?auto_859008 ?auto_859023 ) ) ( not ( = ?auto_859009 ?auto_859010 ) ) ( not ( = ?auto_859009 ?auto_859011 ) ) ( not ( = ?auto_859009 ?auto_859012 ) ) ( not ( = ?auto_859009 ?auto_859013 ) ) ( not ( = ?auto_859009 ?auto_859014 ) ) ( not ( = ?auto_859009 ?auto_859015 ) ) ( not ( = ?auto_859009 ?auto_859016 ) ) ( not ( = ?auto_859009 ?auto_859017 ) ) ( not ( = ?auto_859009 ?auto_859018 ) ) ( not ( = ?auto_859009 ?auto_859019 ) ) ( not ( = ?auto_859009 ?auto_859020 ) ) ( not ( = ?auto_859009 ?auto_859021 ) ) ( not ( = ?auto_859009 ?auto_859022 ) ) ( not ( = ?auto_859009 ?auto_859023 ) ) ( not ( = ?auto_859010 ?auto_859011 ) ) ( not ( = ?auto_859010 ?auto_859012 ) ) ( not ( = ?auto_859010 ?auto_859013 ) ) ( not ( = ?auto_859010 ?auto_859014 ) ) ( not ( = ?auto_859010 ?auto_859015 ) ) ( not ( = ?auto_859010 ?auto_859016 ) ) ( not ( = ?auto_859010 ?auto_859017 ) ) ( not ( = ?auto_859010 ?auto_859018 ) ) ( not ( = ?auto_859010 ?auto_859019 ) ) ( not ( = ?auto_859010 ?auto_859020 ) ) ( not ( = ?auto_859010 ?auto_859021 ) ) ( not ( = ?auto_859010 ?auto_859022 ) ) ( not ( = ?auto_859010 ?auto_859023 ) ) ( not ( = ?auto_859011 ?auto_859012 ) ) ( not ( = ?auto_859011 ?auto_859013 ) ) ( not ( = ?auto_859011 ?auto_859014 ) ) ( not ( = ?auto_859011 ?auto_859015 ) ) ( not ( = ?auto_859011 ?auto_859016 ) ) ( not ( = ?auto_859011 ?auto_859017 ) ) ( not ( = ?auto_859011 ?auto_859018 ) ) ( not ( = ?auto_859011 ?auto_859019 ) ) ( not ( = ?auto_859011 ?auto_859020 ) ) ( not ( = ?auto_859011 ?auto_859021 ) ) ( not ( = ?auto_859011 ?auto_859022 ) ) ( not ( = ?auto_859011 ?auto_859023 ) ) ( not ( = ?auto_859012 ?auto_859013 ) ) ( not ( = ?auto_859012 ?auto_859014 ) ) ( not ( = ?auto_859012 ?auto_859015 ) ) ( not ( = ?auto_859012 ?auto_859016 ) ) ( not ( = ?auto_859012 ?auto_859017 ) ) ( not ( = ?auto_859012 ?auto_859018 ) ) ( not ( = ?auto_859012 ?auto_859019 ) ) ( not ( = ?auto_859012 ?auto_859020 ) ) ( not ( = ?auto_859012 ?auto_859021 ) ) ( not ( = ?auto_859012 ?auto_859022 ) ) ( not ( = ?auto_859012 ?auto_859023 ) ) ( not ( = ?auto_859013 ?auto_859014 ) ) ( not ( = ?auto_859013 ?auto_859015 ) ) ( not ( = ?auto_859013 ?auto_859016 ) ) ( not ( = ?auto_859013 ?auto_859017 ) ) ( not ( = ?auto_859013 ?auto_859018 ) ) ( not ( = ?auto_859013 ?auto_859019 ) ) ( not ( = ?auto_859013 ?auto_859020 ) ) ( not ( = ?auto_859013 ?auto_859021 ) ) ( not ( = ?auto_859013 ?auto_859022 ) ) ( not ( = ?auto_859013 ?auto_859023 ) ) ( not ( = ?auto_859014 ?auto_859015 ) ) ( not ( = ?auto_859014 ?auto_859016 ) ) ( not ( = ?auto_859014 ?auto_859017 ) ) ( not ( = ?auto_859014 ?auto_859018 ) ) ( not ( = ?auto_859014 ?auto_859019 ) ) ( not ( = ?auto_859014 ?auto_859020 ) ) ( not ( = ?auto_859014 ?auto_859021 ) ) ( not ( = ?auto_859014 ?auto_859022 ) ) ( not ( = ?auto_859014 ?auto_859023 ) ) ( not ( = ?auto_859015 ?auto_859016 ) ) ( not ( = ?auto_859015 ?auto_859017 ) ) ( not ( = ?auto_859015 ?auto_859018 ) ) ( not ( = ?auto_859015 ?auto_859019 ) ) ( not ( = ?auto_859015 ?auto_859020 ) ) ( not ( = ?auto_859015 ?auto_859021 ) ) ( not ( = ?auto_859015 ?auto_859022 ) ) ( not ( = ?auto_859015 ?auto_859023 ) ) ( not ( = ?auto_859016 ?auto_859017 ) ) ( not ( = ?auto_859016 ?auto_859018 ) ) ( not ( = ?auto_859016 ?auto_859019 ) ) ( not ( = ?auto_859016 ?auto_859020 ) ) ( not ( = ?auto_859016 ?auto_859021 ) ) ( not ( = ?auto_859016 ?auto_859022 ) ) ( not ( = ?auto_859016 ?auto_859023 ) ) ( not ( = ?auto_859017 ?auto_859018 ) ) ( not ( = ?auto_859017 ?auto_859019 ) ) ( not ( = ?auto_859017 ?auto_859020 ) ) ( not ( = ?auto_859017 ?auto_859021 ) ) ( not ( = ?auto_859017 ?auto_859022 ) ) ( not ( = ?auto_859017 ?auto_859023 ) ) ( not ( = ?auto_859018 ?auto_859019 ) ) ( not ( = ?auto_859018 ?auto_859020 ) ) ( not ( = ?auto_859018 ?auto_859021 ) ) ( not ( = ?auto_859018 ?auto_859022 ) ) ( not ( = ?auto_859018 ?auto_859023 ) ) ( not ( = ?auto_859019 ?auto_859020 ) ) ( not ( = ?auto_859019 ?auto_859021 ) ) ( not ( = ?auto_859019 ?auto_859022 ) ) ( not ( = ?auto_859019 ?auto_859023 ) ) ( not ( = ?auto_859020 ?auto_859021 ) ) ( not ( = ?auto_859020 ?auto_859022 ) ) ( not ( = ?auto_859020 ?auto_859023 ) ) ( not ( = ?auto_859021 ?auto_859022 ) ) ( not ( = ?auto_859021 ?auto_859023 ) ) ( not ( = ?auto_859022 ?auto_859023 ) ) ( ON ?auto_859021 ?auto_859022 ) ( ON ?auto_859020 ?auto_859021 ) ( ON ?auto_859019 ?auto_859020 ) ( ON ?auto_859018 ?auto_859019 ) ( ON ?auto_859017 ?auto_859018 ) ( ON ?auto_859016 ?auto_859017 ) ( ON ?auto_859015 ?auto_859016 ) ( ON ?auto_859014 ?auto_859015 ) ( ON ?auto_859013 ?auto_859014 ) ( ON ?auto_859012 ?auto_859013 ) ( CLEAR ?auto_859010 ) ( ON ?auto_859011 ?auto_859012 ) ( CLEAR ?auto_859011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_859008 ?auto_859009 ?auto_859010 ?auto_859011 )
      ( MAKE-15PILE ?auto_859008 ?auto_859009 ?auto_859010 ?auto_859011 ?auto_859012 ?auto_859013 ?auto_859014 ?auto_859015 ?auto_859016 ?auto_859017 ?auto_859018 ?auto_859019 ?auto_859020 ?auto_859021 ?auto_859022 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_859070 - BLOCK
      ?auto_859071 - BLOCK
      ?auto_859072 - BLOCK
      ?auto_859073 - BLOCK
      ?auto_859074 - BLOCK
      ?auto_859075 - BLOCK
      ?auto_859076 - BLOCK
      ?auto_859077 - BLOCK
      ?auto_859078 - BLOCK
      ?auto_859079 - BLOCK
      ?auto_859080 - BLOCK
      ?auto_859081 - BLOCK
      ?auto_859082 - BLOCK
      ?auto_859083 - BLOCK
      ?auto_859084 - BLOCK
    )
    :vars
    (
      ?auto_859085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859084 ?auto_859085 ) ( ON-TABLE ?auto_859070 ) ( ON ?auto_859071 ?auto_859070 ) ( not ( = ?auto_859070 ?auto_859071 ) ) ( not ( = ?auto_859070 ?auto_859072 ) ) ( not ( = ?auto_859070 ?auto_859073 ) ) ( not ( = ?auto_859070 ?auto_859074 ) ) ( not ( = ?auto_859070 ?auto_859075 ) ) ( not ( = ?auto_859070 ?auto_859076 ) ) ( not ( = ?auto_859070 ?auto_859077 ) ) ( not ( = ?auto_859070 ?auto_859078 ) ) ( not ( = ?auto_859070 ?auto_859079 ) ) ( not ( = ?auto_859070 ?auto_859080 ) ) ( not ( = ?auto_859070 ?auto_859081 ) ) ( not ( = ?auto_859070 ?auto_859082 ) ) ( not ( = ?auto_859070 ?auto_859083 ) ) ( not ( = ?auto_859070 ?auto_859084 ) ) ( not ( = ?auto_859070 ?auto_859085 ) ) ( not ( = ?auto_859071 ?auto_859072 ) ) ( not ( = ?auto_859071 ?auto_859073 ) ) ( not ( = ?auto_859071 ?auto_859074 ) ) ( not ( = ?auto_859071 ?auto_859075 ) ) ( not ( = ?auto_859071 ?auto_859076 ) ) ( not ( = ?auto_859071 ?auto_859077 ) ) ( not ( = ?auto_859071 ?auto_859078 ) ) ( not ( = ?auto_859071 ?auto_859079 ) ) ( not ( = ?auto_859071 ?auto_859080 ) ) ( not ( = ?auto_859071 ?auto_859081 ) ) ( not ( = ?auto_859071 ?auto_859082 ) ) ( not ( = ?auto_859071 ?auto_859083 ) ) ( not ( = ?auto_859071 ?auto_859084 ) ) ( not ( = ?auto_859071 ?auto_859085 ) ) ( not ( = ?auto_859072 ?auto_859073 ) ) ( not ( = ?auto_859072 ?auto_859074 ) ) ( not ( = ?auto_859072 ?auto_859075 ) ) ( not ( = ?auto_859072 ?auto_859076 ) ) ( not ( = ?auto_859072 ?auto_859077 ) ) ( not ( = ?auto_859072 ?auto_859078 ) ) ( not ( = ?auto_859072 ?auto_859079 ) ) ( not ( = ?auto_859072 ?auto_859080 ) ) ( not ( = ?auto_859072 ?auto_859081 ) ) ( not ( = ?auto_859072 ?auto_859082 ) ) ( not ( = ?auto_859072 ?auto_859083 ) ) ( not ( = ?auto_859072 ?auto_859084 ) ) ( not ( = ?auto_859072 ?auto_859085 ) ) ( not ( = ?auto_859073 ?auto_859074 ) ) ( not ( = ?auto_859073 ?auto_859075 ) ) ( not ( = ?auto_859073 ?auto_859076 ) ) ( not ( = ?auto_859073 ?auto_859077 ) ) ( not ( = ?auto_859073 ?auto_859078 ) ) ( not ( = ?auto_859073 ?auto_859079 ) ) ( not ( = ?auto_859073 ?auto_859080 ) ) ( not ( = ?auto_859073 ?auto_859081 ) ) ( not ( = ?auto_859073 ?auto_859082 ) ) ( not ( = ?auto_859073 ?auto_859083 ) ) ( not ( = ?auto_859073 ?auto_859084 ) ) ( not ( = ?auto_859073 ?auto_859085 ) ) ( not ( = ?auto_859074 ?auto_859075 ) ) ( not ( = ?auto_859074 ?auto_859076 ) ) ( not ( = ?auto_859074 ?auto_859077 ) ) ( not ( = ?auto_859074 ?auto_859078 ) ) ( not ( = ?auto_859074 ?auto_859079 ) ) ( not ( = ?auto_859074 ?auto_859080 ) ) ( not ( = ?auto_859074 ?auto_859081 ) ) ( not ( = ?auto_859074 ?auto_859082 ) ) ( not ( = ?auto_859074 ?auto_859083 ) ) ( not ( = ?auto_859074 ?auto_859084 ) ) ( not ( = ?auto_859074 ?auto_859085 ) ) ( not ( = ?auto_859075 ?auto_859076 ) ) ( not ( = ?auto_859075 ?auto_859077 ) ) ( not ( = ?auto_859075 ?auto_859078 ) ) ( not ( = ?auto_859075 ?auto_859079 ) ) ( not ( = ?auto_859075 ?auto_859080 ) ) ( not ( = ?auto_859075 ?auto_859081 ) ) ( not ( = ?auto_859075 ?auto_859082 ) ) ( not ( = ?auto_859075 ?auto_859083 ) ) ( not ( = ?auto_859075 ?auto_859084 ) ) ( not ( = ?auto_859075 ?auto_859085 ) ) ( not ( = ?auto_859076 ?auto_859077 ) ) ( not ( = ?auto_859076 ?auto_859078 ) ) ( not ( = ?auto_859076 ?auto_859079 ) ) ( not ( = ?auto_859076 ?auto_859080 ) ) ( not ( = ?auto_859076 ?auto_859081 ) ) ( not ( = ?auto_859076 ?auto_859082 ) ) ( not ( = ?auto_859076 ?auto_859083 ) ) ( not ( = ?auto_859076 ?auto_859084 ) ) ( not ( = ?auto_859076 ?auto_859085 ) ) ( not ( = ?auto_859077 ?auto_859078 ) ) ( not ( = ?auto_859077 ?auto_859079 ) ) ( not ( = ?auto_859077 ?auto_859080 ) ) ( not ( = ?auto_859077 ?auto_859081 ) ) ( not ( = ?auto_859077 ?auto_859082 ) ) ( not ( = ?auto_859077 ?auto_859083 ) ) ( not ( = ?auto_859077 ?auto_859084 ) ) ( not ( = ?auto_859077 ?auto_859085 ) ) ( not ( = ?auto_859078 ?auto_859079 ) ) ( not ( = ?auto_859078 ?auto_859080 ) ) ( not ( = ?auto_859078 ?auto_859081 ) ) ( not ( = ?auto_859078 ?auto_859082 ) ) ( not ( = ?auto_859078 ?auto_859083 ) ) ( not ( = ?auto_859078 ?auto_859084 ) ) ( not ( = ?auto_859078 ?auto_859085 ) ) ( not ( = ?auto_859079 ?auto_859080 ) ) ( not ( = ?auto_859079 ?auto_859081 ) ) ( not ( = ?auto_859079 ?auto_859082 ) ) ( not ( = ?auto_859079 ?auto_859083 ) ) ( not ( = ?auto_859079 ?auto_859084 ) ) ( not ( = ?auto_859079 ?auto_859085 ) ) ( not ( = ?auto_859080 ?auto_859081 ) ) ( not ( = ?auto_859080 ?auto_859082 ) ) ( not ( = ?auto_859080 ?auto_859083 ) ) ( not ( = ?auto_859080 ?auto_859084 ) ) ( not ( = ?auto_859080 ?auto_859085 ) ) ( not ( = ?auto_859081 ?auto_859082 ) ) ( not ( = ?auto_859081 ?auto_859083 ) ) ( not ( = ?auto_859081 ?auto_859084 ) ) ( not ( = ?auto_859081 ?auto_859085 ) ) ( not ( = ?auto_859082 ?auto_859083 ) ) ( not ( = ?auto_859082 ?auto_859084 ) ) ( not ( = ?auto_859082 ?auto_859085 ) ) ( not ( = ?auto_859083 ?auto_859084 ) ) ( not ( = ?auto_859083 ?auto_859085 ) ) ( not ( = ?auto_859084 ?auto_859085 ) ) ( ON ?auto_859083 ?auto_859084 ) ( ON ?auto_859082 ?auto_859083 ) ( ON ?auto_859081 ?auto_859082 ) ( ON ?auto_859080 ?auto_859081 ) ( ON ?auto_859079 ?auto_859080 ) ( ON ?auto_859078 ?auto_859079 ) ( ON ?auto_859077 ?auto_859078 ) ( ON ?auto_859076 ?auto_859077 ) ( ON ?auto_859075 ?auto_859076 ) ( ON ?auto_859074 ?auto_859075 ) ( ON ?auto_859073 ?auto_859074 ) ( CLEAR ?auto_859071 ) ( ON ?auto_859072 ?auto_859073 ) ( CLEAR ?auto_859072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_859070 ?auto_859071 ?auto_859072 )
      ( MAKE-15PILE ?auto_859070 ?auto_859071 ?auto_859072 ?auto_859073 ?auto_859074 ?auto_859075 ?auto_859076 ?auto_859077 ?auto_859078 ?auto_859079 ?auto_859080 ?auto_859081 ?auto_859082 ?auto_859083 ?auto_859084 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_859132 - BLOCK
      ?auto_859133 - BLOCK
      ?auto_859134 - BLOCK
      ?auto_859135 - BLOCK
      ?auto_859136 - BLOCK
      ?auto_859137 - BLOCK
      ?auto_859138 - BLOCK
      ?auto_859139 - BLOCK
      ?auto_859140 - BLOCK
      ?auto_859141 - BLOCK
      ?auto_859142 - BLOCK
      ?auto_859143 - BLOCK
      ?auto_859144 - BLOCK
      ?auto_859145 - BLOCK
      ?auto_859146 - BLOCK
    )
    :vars
    (
      ?auto_859147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859146 ?auto_859147 ) ( ON-TABLE ?auto_859132 ) ( not ( = ?auto_859132 ?auto_859133 ) ) ( not ( = ?auto_859132 ?auto_859134 ) ) ( not ( = ?auto_859132 ?auto_859135 ) ) ( not ( = ?auto_859132 ?auto_859136 ) ) ( not ( = ?auto_859132 ?auto_859137 ) ) ( not ( = ?auto_859132 ?auto_859138 ) ) ( not ( = ?auto_859132 ?auto_859139 ) ) ( not ( = ?auto_859132 ?auto_859140 ) ) ( not ( = ?auto_859132 ?auto_859141 ) ) ( not ( = ?auto_859132 ?auto_859142 ) ) ( not ( = ?auto_859132 ?auto_859143 ) ) ( not ( = ?auto_859132 ?auto_859144 ) ) ( not ( = ?auto_859132 ?auto_859145 ) ) ( not ( = ?auto_859132 ?auto_859146 ) ) ( not ( = ?auto_859132 ?auto_859147 ) ) ( not ( = ?auto_859133 ?auto_859134 ) ) ( not ( = ?auto_859133 ?auto_859135 ) ) ( not ( = ?auto_859133 ?auto_859136 ) ) ( not ( = ?auto_859133 ?auto_859137 ) ) ( not ( = ?auto_859133 ?auto_859138 ) ) ( not ( = ?auto_859133 ?auto_859139 ) ) ( not ( = ?auto_859133 ?auto_859140 ) ) ( not ( = ?auto_859133 ?auto_859141 ) ) ( not ( = ?auto_859133 ?auto_859142 ) ) ( not ( = ?auto_859133 ?auto_859143 ) ) ( not ( = ?auto_859133 ?auto_859144 ) ) ( not ( = ?auto_859133 ?auto_859145 ) ) ( not ( = ?auto_859133 ?auto_859146 ) ) ( not ( = ?auto_859133 ?auto_859147 ) ) ( not ( = ?auto_859134 ?auto_859135 ) ) ( not ( = ?auto_859134 ?auto_859136 ) ) ( not ( = ?auto_859134 ?auto_859137 ) ) ( not ( = ?auto_859134 ?auto_859138 ) ) ( not ( = ?auto_859134 ?auto_859139 ) ) ( not ( = ?auto_859134 ?auto_859140 ) ) ( not ( = ?auto_859134 ?auto_859141 ) ) ( not ( = ?auto_859134 ?auto_859142 ) ) ( not ( = ?auto_859134 ?auto_859143 ) ) ( not ( = ?auto_859134 ?auto_859144 ) ) ( not ( = ?auto_859134 ?auto_859145 ) ) ( not ( = ?auto_859134 ?auto_859146 ) ) ( not ( = ?auto_859134 ?auto_859147 ) ) ( not ( = ?auto_859135 ?auto_859136 ) ) ( not ( = ?auto_859135 ?auto_859137 ) ) ( not ( = ?auto_859135 ?auto_859138 ) ) ( not ( = ?auto_859135 ?auto_859139 ) ) ( not ( = ?auto_859135 ?auto_859140 ) ) ( not ( = ?auto_859135 ?auto_859141 ) ) ( not ( = ?auto_859135 ?auto_859142 ) ) ( not ( = ?auto_859135 ?auto_859143 ) ) ( not ( = ?auto_859135 ?auto_859144 ) ) ( not ( = ?auto_859135 ?auto_859145 ) ) ( not ( = ?auto_859135 ?auto_859146 ) ) ( not ( = ?auto_859135 ?auto_859147 ) ) ( not ( = ?auto_859136 ?auto_859137 ) ) ( not ( = ?auto_859136 ?auto_859138 ) ) ( not ( = ?auto_859136 ?auto_859139 ) ) ( not ( = ?auto_859136 ?auto_859140 ) ) ( not ( = ?auto_859136 ?auto_859141 ) ) ( not ( = ?auto_859136 ?auto_859142 ) ) ( not ( = ?auto_859136 ?auto_859143 ) ) ( not ( = ?auto_859136 ?auto_859144 ) ) ( not ( = ?auto_859136 ?auto_859145 ) ) ( not ( = ?auto_859136 ?auto_859146 ) ) ( not ( = ?auto_859136 ?auto_859147 ) ) ( not ( = ?auto_859137 ?auto_859138 ) ) ( not ( = ?auto_859137 ?auto_859139 ) ) ( not ( = ?auto_859137 ?auto_859140 ) ) ( not ( = ?auto_859137 ?auto_859141 ) ) ( not ( = ?auto_859137 ?auto_859142 ) ) ( not ( = ?auto_859137 ?auto_859143 ) ) ( not ( = ?auto_859137 ?auto_859144 ) ) ( not ( = ?auto_859137 ?auto_859145 ) ) ( not ( = ?auto_859137 ?auto_859146 ) ) ( not ( = ?auto_859137 ?auto_859147 ) ) ( not ( = ?auto_859138 ?auto_859139 ) ) ( not ( = ?auto_859138 ?auto_859140 ) ) ( not ( = ?auto_859138 ?auto_859141 ) ) ( not ( = ?auto_859138 ?auto_859142 ) ) ( not ( = ?auto_859138 ?auto_859143 ) ) ( not ( = ?auto_859138 ?auto_859144 ) ) ( not ( = ?auto_859138 ?auto_859145 ) ) ( not ( = ?auto_859138 ?auto_859146 ) ) ( not ( = ?auto_859138 ?auto_859147 ) ) ( not ( = ?auto_859139 ?auto_859140 ) ) ( not ( = ?auto_859139 ?auto_859141 ) ) ( not ( = ?auto_859139 ?auto_859142 ) ) ( not ( = ?auto_859139 ?auto_859143 ) ) ( not ( = ?auto_859139 ?auto_859144 ) ) ( not ( = ?auto_859139 ?auto_859145 ) ) ( not ( = ?auto_859139 ?auto_859146 ) ) ( not ( = ?auto_859139 ?auto_859147 ) ) ( not ( = ?auto_859140 ?auto_859141 ) ) ( not ( = ?auto_859140 ?auto_859142 ) ) ( not ( = ?auto_859140 ?auto_859143 ) ) ( not ( = ?auto_859140 ?auto_859144 ) ) ( not ( = ?auto_859140 ?auto_859145 ) ) ( not ( = ?auto_859140 ?auto_859146 ) ) ( not ( = ?auto_859140 ?auto_859147 ) ) ( not ( = ?auto_859141 ?auto_859142 ) ) ( not ( = ?auto_859141 ?auto_859143 ) ) ( not ( = ?auto_859141 ?auto_859144 ) ) ( not ( = ?auto_859141 ?auto_859145 ) ) ( not ( = ?auto_859141 ?auto_859146 ) ) ( not ( = ?auto_859141 ?auto_859147 ) ) ( not ( = ?auto_859142 ?auto_859143 ) ) ( not ( = ?auto_859142 ?auto_859144 ) ) ( not ( = ?auto_859142 ?auto_859145 ) ) ( not ( = ?auto_859142 ?auto_859146 ) ) ( not ( = ?auto_859142 ?auto_859147 ) ) ( not ( = ?auto_859143 ?auto_859144 ) ) ( not ( = ?auto_859143 ?auto_859145 ) ) ( not ( = ?auto_859143 ?auto_859146 ) ) ( not ( = ?auto_859143 ?auto_859147 ) ) ( not ( = ?auto_859144 ?auto_859145 ) ) ( not ( = ?auto_859144 ?auto_859146 ) ) ( not ( = ?auto_859144 ?auto_859147 ) ) ( not ( = ?auto_859145 ?auto_859146 ) ) ( not ( = ?auto_859145 ?auto_859147 ) ) ( not ( = ?auto_859146 ?auto_859147 ) ) ( ON ?auto_859145 ?auto_859146 ) ( ON ?auto_859144 ?auto_859145 ) ( ON ?auto_859143 ?auto_859144 ) ( ON ?auto_859142 ?auto_859143 ) ( ON ?auto_859141 ?auto_859142 ) ( ON ?auto_859140 ?auto_859141 ) ( ON ?auto_859139 ?auto_859140 ) ( ON ?auto_859138 ?auto_859139 ) ( ON ?auto_859137 ?auto_859138 ) ( ON ?auto_859136 ?auto_859137 ) ( ON ?auto_859135 ?auto_859136 ) ( ON ?auto_859134 ?auto_859135 ) ( CLEAR ?auto_859132 ) ( ON ?auto_859133 ?auto_859134 ) ( CLEAR ?auto_859133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_859132 ?auto_859133 )
      ( MAKE-15PILE ?auto_859132 ?auto_859133 ?auto_859134 ?auto_859135 ?auto_859136 ?auto_859137 ?auto_859138 ?auto_859139 ?auto_859140 ?auto_859141 ?auto_859142 ?auto_859143 ?auto_859144 ?auto_859145 ?auto_859146 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_859194 - BLOCK
      ?auto_859195 - BLOCK
      ?auto_859196 - BLOCK
      ?auto_859197 - BLOCK
      ?auto_859198 - BLOCK
      ?auto_859199 - BLOCK
      ?auto_859200 - BLOCK
      ?auto_859201 - BLOCK
      ?auto_859202 - BLOCK
      ?auto_859203 - BLOCK
      ?auto_859204 - BLOCK
      ?auto_859205 - BLOCK
      ?auto_859206 - BLOCK
      ?auto_859207 - BLOCK
      ?auto_859208 - BLOCK
    )
    :vars
    (
      ?auto_859209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859208 ?auto_859209 ) ( not ( = ?auto_859194 ?auto_859195 ) ) ( not ( = ?auto_859194 ?auto_859196 ) ) ( not ( = ?auto_859194 ?auto_859197 ) ) ( not ( = ?auto_859194 ?auto_859198 ) ) ( not ( = ?auto_859194 ?auto_859199 ) ) ( not ( = ?auto_859194 ?auto_859200 ) ) ( not ( = ?auto_859194 ?auto_859201 ) ) ( not ( = ?auto_859194 ?auto_859202 ) ) ( not ( = ?auto_859194 ?auto_859203 ) ) ( not ( = ?auto_859194 ?auto_859204 ) ) ( not ( = ?auto_859194 ?auto_859205 ) ) ( not ( = ?auto_859194 ?auto_859206 ) ) ( not ( = ?auto_859194 ?auto_859207 ) ) ( not ( = ?auto_859194 ?auto_859208 ) ) ( not ( = ?auto_859194 ?auto_859209 ) ) ( not ( = ?auto_859195 ?auto_859196 ) ) ( not ( = ?auto_859195 ?auto_859197 ) ) ( not ( = ?auto_859195 ?auto_859198 ) ) ( not ( = ?auto_859195 ?auto_859199 ) ) ( not ( = ?auto_859195 ?auto_859200 ) ) ( not ( = ?auto_859195 ?auto_859201 ) ) ( not ( = ?auto_859195 ?auto_859202 ) ) ( not ( = ?auto_859195 ?auto_859203 ) ) ( not ( = ?auto_859195 ?auto_859204 ) ) ( not ( = ?auto_859195 ?auto_859205 ) ) ( not ( = ?auto_859195 ?auto_859206 ) ) ( not ( = ?auto_859195 ?auto_859207 ) ) ( not ( = ?auto_859195 ?auto_859208 ) ) ( not ( = ?auto_859195 ?auto_859209 ) ) ( not ( = ?auto_859196 ?auto_859197 ) ) ( not ( = ?auto_859196 ?auto_859198 ) ) ( not ( = ?auto_859196 ?auto_859199 ) ) ( not ( = ?auto_859196 ?auto_859200 ) ) ( not ( = ?auto_859196 ?auto_859201 ) ) ( not ( = ?auto_859196 ?auto_859202 ) ) ( not ( = ?auto_859196 ?auto_859203 ) ) ( not ( = ?auto_859196 ?auto_859204 ) ) ( not ( = ?auto_859196 ?auto_859205 ) ) ( not ( = ?auto_859196 ?auto_859206 ) ) ( not ( = ?auto_859196 ?auto_859207 ) ) ( not ( = ?auto_859196 ?auto_859208 ) ) ( not ( = ?auto_859196 ?auto_859209 ) ) ( not ( = ?auto_859197 ?auto_859198 ) ) ( not ( = ?auto_859197 ?auto_859199 ) ) ( not ( = ?auto_859197 ?auto_859200 ) ) ( not ( = ?auto_859197 ?auto_859201 ) ) ( not ( = ?auto_859197 ?auto_859202 ) ) ( not ( = ?auto_859197 ?auto_859203 ) ) ( not ( = ?auto_859197 ?auto_859204 ) ) ( not ( = ?auto_859197 ?auto_859205 ) ) ( not ( = ?auto_859197 ?auto_859206 ) ) ( not ( = ?auto_859197 ?auto_859207 ) ) ( not ( = ?auto_859197 ?auto_859208 ) ) ( not ( = ?auto_859197 ?auto_859209 ) ) ( not ( = ?auto_859198 ?auto_859199 ) ) ( not ( = ?auto_859198 ?auto_859200 ) ) ( not ( = ?auto_859198 ?auto_859201 ) ) ( not ( = ?auto_859198 ?auto_859202 ) ) ( not ( = ?auto_859198 ?auto_859203 ) ) ( not ( = ?auto_859198 ?auto_859204 ) ) ( not ( = ?auto_859198 ?auto_859205 ) ) ( not ( = ?auto_859198 ?auto_859206 ) ) ( not ( = ?auto_859198 ?auto_859207 ) ) ( not ( = ?auto_859198 ?auto_859208 ) ) ( not ( = ?auto_859198 ?auto_859209 ) ) ( not ( = ?auto_859199 ?auto_859200 ) ) ( not ( = ?auto_859199 ?auto_859201 ) ) ( not ( = ?auto_859199 ?auto_859202 ) ) ( not ( = ?auto_859199 ?auto_859203 ) ) ( not ( = ?auto_859199 ?auto_859204 ) ) ( not ( = ?auto_859199 ?auto_859205 ) ) ( not ( = ?auto_859199 ?auto_859206 ) ) ( not ( = ?auto_859199 ?auto_859207 ) ) ( not ( = ?auto_859199 ?auto_859208 ) ) ( not ( = ?auto_859199 ?auto_859209 ) ) ( not ( = ?auto_859200 ?auto_859201 ) ) ( not ( = ?auto_859200 ?auto_859202 ) ) ( not ( = ?auto_859200 ?auto_859203 ) ) ( not ( = ?auto_859200 ?auto_859204 ) ) ( not ( = ?auto_859200 ?auto_859205 ) ) ( not ( = ?auto_859200 ?auto_859206 ) ) ( not ( = ?auto_859200 ?auto_859207 ) ) ( not ( = ?auto_859200 ?auto_859208 ) ) ( not ( = ?auto_859200 ?auto_859209 ) ) ( not ( = ?auto_859201 ?auto_859202 ) ) ( not ( = ?auto_859201 ?auto_859203 ) ) ( not ( = ?auto_859201 ?auto_859204 ) ) ( not ( = ?auto_859201 ?auto_859205 ) ) ( not ( = ?auto_859201 ?auto_859206 ) ) ( not ( = ?auto_859201 ?auto_859207 ) ) ( not ( = ?auto_859201 ?auto_859208 ) ) ( not ( = ?auto_859201 ?auto_859209 ) ) ( not ( = ?auto_859202 ?auto_859203 ) ) ( not ( = ?auto_859202 ?auto_859204 ) ) ( not ( = ?auto_859202 ?auto_859205 ) ) ( not ( = ?auto_859202 ?auto_859206 ) ) ( not ( = ?auto_859202 ?auto_859207 ) ) ( not ( = ?auto_859202 ?auto_859208 ) ) ( not ( = ?auto_859202 ?auto_859209 ) ) ( not ( = ?auto_859203 ?auto_859204 ) ) ( not ( = ?auto_859203 ?auto_859205 ) ) ( not ( = ?auto_859203 ?auto_859206 ) ) ( not ( = ?auto_859203 ?auto_859207 ) ) ( not ( = ?auto_859203 ?auto_859208 ) ) ( not ( = ?auto_859203 ?auto_859209 ) ) ( not ( = ?auto_859204 ?auto_859205 ) ) ( not ( = ?auto_859204 ?auto_859206 ) ) ( not ( = ?auto_859204 ?auto_859207 ) ) ( not ( = ?auto_859204 ?auto_859208 ) ) ( not ( = ?auto_859204 ?auto_859209 ) ) ( not ( = ?auto_859205 ?auto_859206 ) ) ( not ( = ?auto_859205 ?auto_859207 ) ) ( not ( = ?auto_859205 ?auto_859208 ) ) ( not ( = ?auto_859205 ?auto_859209 ) ) ( not ( = ?auto_859206 ?auto_859207 ) ) ( not ( = ?auto_859206 ?auto_859208 ) ) ( not ( = ?auto_859206 ?auto_859209 ) ) ( not ( = ?auto_859207 ?auto_859208 ) ) ( not ( = ?auto_859207 ?auto_859209 ) ) ( not ( = ?auto_859208 ?auto_859209 ) ) ( ON ?auto_859207 ?auto_859208 ) ( ON ?auto_859206 ?auto_859207 ) ( ON ?auto_859205 ?auto_859206 ) ( ON ?auto_859204 ?auto_859205 ) ( ON ?auto_859203 ?auto_859204 ) ( ON ?auto_859202 ?auto_859203 ) ( ON ?auto_859201 ?auto_859202 ) ( ON ?auto_859200 ?auto_859201 ) ( ON ?auto_859199 ?auto_859200 ) ( ON ?auto_859198 ?auto_859199 ) ( ON ?auto_859197 ?auto_859198 ) ( ON ?auto_859196 ?auto_859197 ) ( ON ?auto_859195 ?auto_859196 ) ( ON ?auto_859194 ?auto_859195 ) ( CLEAR ?auto_859194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_859194 )
      ( MAKE-15PILE ?auto_859194 ?auto_859195 ?auto_859196 ?auto_859197 ?auto_859198 ?auto_859199 ?auto_859200 ?auto_859201 ?auto_859202 ?auto_859203 ?auto_859204 ?auto_859205 ?auto_859206 ?auto_859207 ?auto_859208 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_859257 - BLOCK
      ?auto_859258 - BLOCK
      ?auto_859259 - BLOCK
      ?auto_859260 - BLOCK
      ?auto_859261 - BLOCK
      ?auto_859262 - BLOCK
      ?auto_859263 - BLOCK
      ?auto_859264 - BLOCK
      ?auto_859265 - BLOCK
      ?auto_859266 - BLOCK
      ?auto_859267 - BLOCK
      ?auto_859268 - BLOCK
      ?auto_859269 - BLOCK
      ?auto_859270 - BLOCK
      ?auto_859271 - BLOCK
      ?auto_859272 - BLOCK
    )
    :vars
    (
      ?auto_859273 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_859271 ) ( ON ?auto_859272 ?auto_859273 ) ( CLEAR ?auto_859272 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_859257 ) ( ON ?auto_859258 ?auto_859257 ) ( ON ?auto_859259 ?auto_859258 ) ( ON ?auto_859260 ?auto_859259 ) ( ON ?auto_859261 ?auto_859260 ) ( ON ?auto_859262 ?auto_859261 ) ( ON ?auto_859263 ?auto_859262 ) ( ON ?auto_859264 ?auto_859263 ) ( ON ?auto_859265 ?auto_859264 ) ( ON ?auto_859266 ?auto_859265 ) ( ON ?auto_859267 ?auto_859266 ) ( ON ?auto_859268 ?auto_859267 ) ( ON ?auto_859269 ?auto_859268 ) ( ON ?auto_859270 ?auto_859269 ) ( ON ?auto_859271 ?auto_859270 ) ( not ( = ?auto_859257 ?auto_859258 ) ) ( not ( = ?auto_859257 ?auto_859259 ) ) ( not ( = ?auto_859257 ?auto_859260 ) ) ( not ( = ?auto_859257 ?auto_859261 ) ) ( not ( = ?auto_859257 ?auto_859262 ) ) ( not ( = ?auto_859257 ?auto_859263 ) ) ( not ( = ?auto_859257 ?auto_859264 ) ) ( not ( = ?auto_859257 ?auto_859265 ) ) ( not ( = ?auto_859257 ?auto_859266 ) ) ( not ( = ?auto_859257 ?auto_859267 ) ) ( not ( = ?auto_859257 ?auto_859268 ) ) ( not ( = ?auto_859257 ?auto_859269 ) ) ( not ( = ?auto_859257 ?auto_859270 ) ) ( not ( = ?auto_859257 ?auto_859271 ) ) ( not ( = ?auto_859257 ?auto_859272 ) ) ( not ( = ?auto_859257 ?auto_859273 ) ) ( not ( = ?auto_859258 ?auto_859259 ) ) ( not ( = ?auto_859258 ?auto_859260 ) ) ( not ( = ?auto_859258 ?auto_859261 ) ) ( not ( = ?auto_859258 ?auto_859262 ) ) ( not ( = ?auto_859258 ?auto_859263 ) ) ( not ( = ?auto_859258 ?auto_859264 ) ) ( not ( = ?auto_859258 ?auto_859265 ) ) ( not ( = ?auto_859258 ?auto_859266 ) ) ( not ( = ?auto_859258 ?auto_859267 ) ) ( not ( = ?auto_859258 ?auto_859268 ) ) ( not ( = ?auto_859258 ?auto_859269 ) ) ( not ( = ?auto_859258 ?auto_859270 ) ) ( not ( = ?auto_859258 ?auto_859271 ) ) ( not ( = ?auto_859258 ?auto_859272 ) ) ( not ( = ?auto_859258 ?auto_859273 ) ) ( not ( = ?auto_859259 ?auto_859260 ) ) ( not ( = ?auto_859259 ?auto_859261 ) ) ( not ( = ?auto_859259 ?auto_859262 ) ) ( not ( = ?auto_859259 ?auto_859263 ) ) ( not ( = ?auto_859259 ?auto_859264 ) ) ( not ( = ?auto_859259 ?auto_859265 ) ) ( not ( = ?auto_859259 ?auto_859266 ) ) ( not ( = ?auto_859259 ?auto_859267 ) ) ( not ( = ?auto_859259 ?auto_859268 ) ) ( not ( = ?auto_859259 ?auto_859269 ) ) ( not ( = ?auto_859259 ?auto_859270 ) ) ( not ( = ?auto_859259 ?auto_859271 ) ) ( not ( = ?auto_859259 ?auto_859272 ) ) ( not ( = ?auto_859259 ?auto_859273 ) ) ( not ( = ?auto_859260 ?auto_859261 ) ) ( not ( = ?auto_859260 ?auto_859262 ) ) ( not ( = ?auto_859260 ?auto_859263 ) ) ( not ( = ?auto_859260 ?auto_859264 ) ) ( not ( = ?auto_859260 ?auto_859265 ) ) ( not ( = ?auto_859260 ?auto_859266 ) ) ( not ( = ?auto_859260 ?auto_859267 ) ) ( not ( = ?auto_859260 ?auto_859268 ) ) ( not ( = ?auto_859260 ?auto_859269 ) ) ( not ( = ?auto_859260 ?auto_859270 ) ) ( not ( = ?auto_859260 ?auto_859271 ) ) ( not ( = ?auto_859260 ?auto_859272 ) ) ( not ( = ?auto_859260 ?auto_859273 ) ) ( not ( = ?auto_859261 ?auto_859262 ) ) ( not ( = ?auto_859261 ?auto_859263 ) ) ( not ( = ?auto_859261 ?auto_859264 ) ) ( not ( = ?auto_859261 ?auto_859265 ) ) ( not ( = ?auto_859261 ?auto_859266 ) ) ( not ( = ?auto_859261 ?auto_859267 ) ) ( not ( = ?auto_859261 ?auto_859268 ) ) ( not ( = ?auto_859261 ?auto_859269 ) ) ( not ( = ?auto_859261 ?auto_859270 ) ) ( not ( = ?auto_859261 ?auto_859271 ) ) ( not ( = ?auto_859261 ?auto_859272 ) ) ( not ( = ?auto_859261 ?auto_859273 ) ) ( not ( = ?auto_859262 ?auto_859263 ) ) ( not ( = ?auto_859262 ?auto_859264 ) ) ( not ( = ?auto_859262 ?auto_859265 ) ) ( not ( = ?auto_859262 ?auto_859266 ) ) ( not ( = ?auto_859262 ?auto_859267 ) ) ( not ( = ?auto_859262 ?auto_859268 ) ) ( not ( = ?auto_859262 ?auto_859269 ) ) ( not ( = ?auto_859262 ?auto_859270 ) ) ( not ( = ?auto_859262 ?auto_859271 ) ) ( not ( = ?auto_859262 ?auto_859272 ) ) ( not ( = ?auto_859262 ?auto_859273 ) ) ( not ( = ?auto_859263 ?auto_859264 ) ) ( not ( = ?auto_859263 ?auto_859265 ) ) ( not ( = ?auto_859263 ?auto_859266 ) ) ( not ( = ?auto_859263 ?auto_859267 ) ) ( not ( = ?auto_859263 ?auto_859268 ) ) ( not ( = ?auto_859263 ?auto_859269 ) ) ( not ( = ?auto_859263 ?auto_859270 ) ) ( not ( = ?auto_859263 ?auto_859271 ) ) ( not ( = ?auto_859263 ?auto_859272 ) ) ( not ( = ?auto_859263 ?auto_859273 ) ) ( not ( = ?auto_859264 ?auto_859265 ) ) ( not ( = ?auto_859264 ?auto_859266 ) ) ( not ( = ?auto_859264 ?auto_859267 ) ) ( not ( = ?auto_859264 ?auto_859268 ) ) ( not ( = ?auto_859264 ?auto_859269 ) ) ( not ( = ?auto_859264 ?auto_859270 ) ) ( not ( = ?auto_859264 ?auto_859271 ) ) ( not ( = ?auto_859264 ?auto_859272 ) ) ( not ( = ?auto_859264 ?auto_859273 ) ) ( not ( = ?auto_859265 ?auto_859266 ) ) ( not ( = ?auto_859265 ?auto_859267 ) ) ( not ( = ?auto_859265 ?auto_859268 ) ) ( not ( = ?auto_859265 ?auto_859269 ) ) ( not ( = ?auto_859265 ?auto_859270 ) ) ( not ( = ?auto_859265 ?auto_859271 ) ) ( not ( = ?auto_859265 ?auto_859272 ) ) ( not ( = ?auto_859265 ?auto_859273 ) ) ( not ( = ?auto_859266 ?auto_859267 ) ) ( not ( = ?auto_859266 ?auto_859268 ) ) ( not ( = ?auto_859266 ?auto_859269 ) ) ( not ( = ?auto_859266 ?auto_859270 ) ) ( not ( = ?auto_859266 ?auto_859271 ) ) ( not ( = ?auto_859266 ?auto_859272 ) ) ( not ( = ?auto_859266 ?auto_859273 ) ) ( not ( = ?auto_859267 ?auto_859268 ) ) ( not ( = ?auto_859267 ?auto_859269 ) ) ( not ( = ?auto_859267 ?auto_859270 ) ) ( not ( = ?auto_859267 ?auto_859271 ) ) ( not ( = ?auto_859267 ?auto_859272 ) ) ( not ( = ?auto_859267 ?auto_859273 ) ) ( not ( = ?auto_859268 ?auto_859269 ) ) ( not ( = ?auto_859268 ?auto_859270 ) ) ( not ( = ?auto_859268 ?auto_859271 ) ) ( not ( = ?auto_859268 ?auto_859272 ) ) ( not ( = ?auto_859268 ?auto_859273 ) ) ( not ( = ?auto_859269 ?auto_859270 ) ) ( not ( = ?auto_859269 ?auto_859271 ) ) ( not ( = ?auto_859269 ?auto_859272 ) ) ( not ( = ?auto_859269 ?auto_859273 ) ) ( not ( = ?auto_859270 ?auto_859271 ) ) ( not ( = ?auto_859270 ?auto_859272 ) ) ( not ( = ?auto_859270 ?auto_859273 ) ) ( not ( = ?auto_859271 ?auto_859272 ) ) ( not ( = ?auto_859271 ?auto_859273 ) ) ( not ( = ?auto_859272 ?auto_859273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_859272 ?auto_859273 )
      ( !STACK ?auto_859272 ?auto_859271 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_859323 - BLOCK
      ?auto_859324 - BLOCK
      ?auto_859325 - BLOCK
      ?auto_859326 - BLOCK
      ?auto_859327 - BLOCK
      ?auto_859328 - BLOCK
      ?auto_859329 - BLOCK
      ?auto_859330 - BLOCK
      ?auto_859331 - BLOCK
      ?auto_859332 - BLOCK
      ?auto_859333 - BLOCK
      ?auto_859334 - BLOCK
      ?auto_859335 - BLOCK
      ?auto_859336 - BLOCK
      ?auto_859337 - BLOCK
      ?auto_859338 - BLOCK
    )
    :vars
    (
      ?auto_859339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859338 ?auto_859339 ) ( ON-TABLE ?auto_859323 ) ( ON ?auto_859324 ?auto_859323 ) ( ON ?auto_859325 ?auto_859324 ) ( ON ?auto_859326 ?auto_859325 ) ( ON ?auto_859327 ?auto_859326 ) ( ON ?auto_859328 ?auto_859327 ) ( ON ?auto_859329 ?auto_859328 ) ( ON ?auto_859330 ?auto_859329 ) ( ON ?auto_859331 ?auto_859330 ) ( ON ?auto_859332 ?auto_859331 ) ( ON ?auto_859333 ?auto_859332 ) ( ON ?auto_859334 ?auto_859333 ) ( ON ?auto_859335 ?auto_859334 ) ( ON ?auto_859336 ?auto_859335 ) ( not ( = ?auto_859323 ?auto_859324 ) ) ( not ( = ?auto_859323 ?auto_859325 ) ) ( not ( = ?auto_859323 ?auto_859326 ) ) ( not ( = ?auto_859323 ?auto_859327 ) ) ( not ( = ?auto_859323 ?auto_859328 ) ) ( not ( = ?auto_859323 ?auto_859329 ) ) ( not ( = ?auto_859323 ?auto_859330 ) ) ( not ( = ?auto_859323 ?auto_859331 ) ) ( not ( = ?auto_859323 ?auto_859332 ) ) ( not ( = ?auto_859323 ?auto_859333 ) ) ( not ( = ?auto_859323 ?auto_859334 ) ) ( not ( = ?auto_859323 ?auto_859335 ) ) ( not ( = ?auto_859323 ?auto_859336 ) ) ( not ( = ?auto_859323 ?auto_859337 ) ) ( not ( = ?auto_859323 ?auto_859338 ) ) ( not ( = ?auto_859323 ?auto_859339 ) ) ( not ( = ?auto_859324 ?auto_859325 ) ) ( not ( = ?auto_859324 ?auto_859326 ) ) ( not ( = ?auto_859324 ?auto_859327 ) ) ( not ( = ?auto_859324 ?auto_859328 ) ) ( not ( = ?auto_859324 ?auto_859329 ) ) ( not ( = ?auto_859324 ?auto_859330 ) ) ( not ( = ?auto_859324 ?auto_859331 ) ) ( not ( = ?auto_859324 ?auto_859332 ) ) ( not ( = ?auto_859324 ?auto_859333 ) ) ( not ( = ?auto_859324 ?auto_859334 ) ) ( not ( = ?auto_859324 ?auto_859335 ) ) ( not ( = ?auto_859324 ?auto_859336 ) ) ( not ( = ?auto_859324 ?auto_859337 ) ) ( not ( = ?auto_859324 ?auto_859338 ) ) ( not ( = ?auto_859324 ?auto_859339 ) ) ( not ( = ?auto_859325 ?auto_859326 ) ) ( not ( = ?auto_859325 ?auto_859327 ) ) ( not ( = ?auto_859325 ?auto_859328 ) ) ( not ( = ?auto_859325 ?auto_859329 ) ) ( not ( = ?auto_859325 ?auto_859330 ) ) ( not ( = ?auto_859325 ?auto_859331 ) ) ( not ( = ?auto_859325 ?auto_859332 ) ) ( not ( = ?auto_859325 ?auto_859333 ) ) ( not ( = ?auto_859325 ?auto_859334 ) ) ( not ( = ?auto_859325 ?auto_859335 ) ) ( not ( = ?auto_859325 ?auto_859336 ) ) ( not ( = ?auto_859325 ?auto_859337 ) ) ( not ( = ?auto_859325 ?auto_859338 ) ) ( not ( = ?auto_859325 ?auto_859339 ) ) ( not ( = ?auto_859326 ?auto_859327 ) ) ( not ( = ?auto_859326 ?auto_859328 ) ) ( not ( = ?auto_859326 ?auto_859329 ) ) ( not ( = ?auto_859326 ?auto_859330 ) ) ( not ( = ?auto_859326 ?auto_859331 ) ) ( not ( = ?auto_859326 ?auto_859332 ) ) ( not ( = ?auto_859326 ?auto_859333 ) ) ( not ( = ?auto_859326 ?auto_859334 ) ) ( not ( = ?auto_859326 ?auto_859335 ) ) ( not ( = ?auto_859326 ?auto_859336 ) ) ( not ( = ?auto_859326 ?auto_859337 ) ) ( not ( = ?auto_859326 ?auto_859338 ) ) ( not ( = ?auto_859326 ?auto_859339 ) ) ( not ( = ?auto_859327 ?auto_859328 ) ) ( not ( = ?auto_859327 ?auto_859329 ) ) ( not ( = ?auto_859327 ?auto_859330 ) ) ( not ( = ?auto_859327 ?auto_859331 ) ) ( not ( = ?auto_859327 ?auto_859332 ) ) ( not ( = ?auto_859327 ?auto_859333 ) ) ( not ( = ?auto_859327 ?auto_859334 ) ) ( not ( = ?auto_859327 ?auto_859335 ) ) ( not ( = ?auto_859327 ?auto_859336 ) ) ( not ( = ?auto_859327 ?auto_859337 ) ) ( not ( = ?auto_859327 ?auto_859338 ) ) ( not ( = ?auto_859327 ?auto_859339 ) ) ( not ( = ?auto_859328 ?auto_859329 ) ) ( not ( = ?auto_859328 ?auto_859330 ) ) ( not ( = ?auto_859328 ?auto_859331 ) ) ( not ( = ?auto_859328 ?auto_859332 ) ) ( not ( = ?auto_859328 ?auto_859333 ) ) ( not ( = ?auto_859328 ?auto_859334 ) ) ( not ( = ?auto_859328 ?auto_859335 ) ) ( not ( = ?auto_859328 ?auto_859336 ) ) ( not ( = ?auto_859328 ?auto_859337 ) ) ( not ( = ?auto_859328 ?auto_859338 ) ) ( not ( = ?auto_859328 ?auto_859339 ) ) ( not ( = ?auto_859329 ?auto_859330 ) ) ( not ( = ?auto_859329 ?auto_859331 ) ) ( not ( = ?auto_859329 ?auto_859332 ) ) ( not ( = ?auto_859329 ?auto_859333 ) ) ( not ( = ?auto_859329 ?auto_859334 ) ) ( not ( = ?auto_859329 ?auto_859335 ) ) ( not ( = ?auto_859329 ?auto_859336 ) ) ( not ( = ?auto_859329 ?auto_859337 ) ) ( not ( = ?auto_859329 ?auto_859338 ) ) ( not ( = ?auto_859329 ?auto_859339 ) ) ( not ( = ?auto_859330 ?auto_859331 ) ) ( not ( = ?auto_859330 ?auto_859332 ) ) ( not ( = ?auto_859330 ?auto_859333 ) ) ( not ( = ?auto_859330 ?auto_859334 ) ) ( not ( = ?auto_859330 ?auto_859335 ) ) ( not ( = ?auto_859330 ?auto_859336 ) ) ( not ( = ?auto_859330 ?auto_859337 ) ) ( not ( = ?auto_859330 ?auto_859338 ) ) ( not ( = ?auto_859330 ?auto_859339 ) ) ( not ( = ?auto_859331 ?auto_859332 ) ) ( not ( = ?auto_859331 ?auto_859333 ) ) ( not ( = ?auto_859331 ?auto_859334 ) ) ( not ( = ?auto_859331 ?auto_859335 ) ) ( not ( = ?auto_859331 ?auto_859336 ) ) ( not ( = ?auto_859331 ?auto_859337 ) ) ( not ( = ?auto_859331 ?auto_859338 ) ) ( not ( = ?auto_859331 ?auto_859339 ) ) ( not ( = ?auto_859332 ?auto_859333 ) ) ( not ( = ?auto_859332 ?auto_859334 ) ) ( not ( = ?auto_859332 ?auto_859335 ) ) ( not ( = ?auto_859332 ?auto_859336 ) ) ( not ( = ?auto_859332 ?auto_859337 ) ) ( not ( = ?auto_859332 ?auto_859338 ) ) ( not ( = ?auto_859332 ?auto_859339 ) ) ( not ( = ?auto_859333 ?auto_859334 ) ) ( not ( = ?auto_859333 ?auto_859335 ) ) ( not ( = ?auto_859333 ?auto_859336 ) ) ( not ( = ?auto_859333 ?auto_859337 ) ) ( not ( = ?auto_859333 ?auto_859338 ) ) ( not ( = ?auto_859333 ?auto_859339 ) ) ( not ( = ?auto_859334 ?auto_859335 ) ) ( not ( = ?auto_859334 ?auto_859336 ) ) ( not ( = ?auto_859334 ?auto_859337 ) ) ( not ( = ?auto_859334 ?auto_859338 ) ) ( not ( = ?auto_859334 ?auto_859339 ) ) ( not ( = ?auto_859335 ?auto_859336 ) ) ( not ( = ?auto_859335 ?auto_859337 ) ) ( not ( = ?auto_859335 ?auto_859338 ) ) ( not ( = ?auto_859335 ?auto_859339 ) ) ( not ( = ?auto_859336 ?auto_859337 ) ) ( not ( = ?auto_859336 ?auto_859338 ) ) ( not ( = ?auto_859336 ?auto_859339 ) ) ( not ( = ?auto_859337 ?auto_859338 ) ) ( not ( = ?auto_859337 ?auto_859339 ) ) ( not ( = ?auto_859338 ?auto_859339 ) ) ( CLEAR ?auto_859336 ) ( ON ?auto_859337 ?auto_859338 ) ( CLEAR ?auto_859337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_859323 ?auto_859324 ?auto_859325 ?auto_859326 ?auto_859327 ?auto_859328 ?auto_859329 ?auto_859330 ?auto_859331 ?auto_859332 ?auto_859333 ?auto_859334 ?auto_859335 ?auto_859336 ?auto_859337 )
      ( MAKE-16PILE ?auto_859323 ?auto_859324 ?auto_859325 ?auto_859326 ?auto_859327 ?auto_859328 ?auto_859329 ?auto_859330 ?auto_859331 ?auto_859332 ?auto_859333 ?auto_859334 ?auto_859335 ?auto_859336 ?auto_859337 ?auto_859338 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_859389 - BLOCK
      ?auto_859390 - BLOCK
      ?auto_859391 - BLOCK
      ?auto_859392 - BLOCK
      ?auto_859393 - BLOCK
      ?auto_859394 - BLOCK
      ?auto_859395 - BLOCK
      ?auto_859396 - BLOCK
      ?auto_859397 - BLOCK
      ?auto_859398 - BLOCK
      ?auto_859399 - BLOCK
      ?auto_859400 - BLOCK
      ?auto_859401 - BLOCK
      ?auto_859402 - BLOCK
      ?auto_859403 - BLOCK
      ?auto_859404 - BLOCK
    )
    :vars
    (
      ?auto_859405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859404 ?auto_859405 ) ( ON-TABLE ?auto_859389 ) ( ON ?auto_859390 ?auto_859389 ) ( ON ?auto_859391 ?auto_859390 ) ( ON ?auto_859392 ?auto_859391 ) ( ON ?auto_859393 ?auto_859392 ) ( ON ?auto_859394 ?auto_859393 ) ( ON ?auto_859395 ?auto_859394 ) ( ON ?auto_859396 ?auto_859395 ) ( ON ?auto_859397 ?auto_859396 ) ( ON ?auto_859398 ?auto_859397 ) ( ON ?auto_859399 ?auto_859398 ) ( ON ?auto_859400 ?auto_859399 ) ( ON ?auto_859401 ?auto_859400 ) ( not ( = ?auto_859389 ?auto_859390 ) ) ( not ( = ?auto_859389 ?auto_859391 ) ) ( not ( = ?auto_859389 ?auto_859392 ) ) ( not ( = ?auto_859389 ?auto_859393 ) ) ( not ( = ?auto_859389 ?auto_859394 ) ) ( not ( = ?auto_859389 ?auto_859395 ) ) ( not ( = ?auto_859389 ?auto_859396 ) ) ( not ( = ?auto_859389 ?auto_859397 ) ) ( not ( = ?auto_859389 ?auto_859398 ) ) ( not ( = ?auto_859389 ?auto_859399 ) ) ( not ( = ?auto_859389 ?auto_859400 ) ) ( not ( = ?auto_859389 ?auto_859401 ) ) ( not ( = ?auto_859389 ?auto_859402 ) ) ( not ( = ?auto_859389 ?auto_859403 ) ) ( not ( = ?auto_859389 ?auto_859404 ) ) ( not ( = ?auto_859389 ?auto_859405 ) ) ( not ( = ?auto_859390 ?auto_859391 ) ) ( not ( = ?auto_859390 ?auto_859392 ) ) ( not ( = ?auto_859390 ?auto_859393 ) ) ( not ( = ?auto_859390 ?auto_859394 ) ) ( not ( = ?auto_859390 ?auto_859395 ) ) ( not ( = ?auto_859390 ?auto_859396 ) ) ( not ( = ?auto_859390 ?auto_859397 ) ) ( not ( = ?auto_859390 ?auto_859398 ) ) ( not ( = ?auto_859390 ?auto_859399 ) ) ( not ( = ?auto_859390 ?auto_859400 ) ) ( not ( = ?auto_859390 ?auto_859401 ) ) ( not ( = ?auto_859390 ?auto_859402 ) ) ( not ( = ?auto_859390 ?auto_859403 ) ) ( not ( = ?auto_859390 ?auto_859404 ) ) ( not ( = ?auto_859390 ?auto_859405 ) ) ( not ( = ?auto_859391 ?auto_859392 ) ) ( not ( = ?auto_859391 ?auto_859393 ) ) ( not ( = ?auto_859391 ?auto_859394 ) ) ( not ( = ?auto_859391 ?auto_859395 ) ) ( not ( = ?auto_859391 ?auto_859396 ) ) ( not ( = ?auto_859391 ?auto_859397 ) ) ( not ( = ?auto_859391 ?auto_859398 ) ) ( not ( = ?auto_859391 ?auto_859399 ) ) ( not ( = ?auto_859391 ?auto_859400 ) ) ( not ( = ?auto_859391 ?auto_859401 ) ) ( not ( = ?auto_859391 ?auto_859402 ) ) ( not ( = ?auto_859391 ?auto_859403 ) ) ( not ( = ?auto_859391 ?auto_859404 ) ) ( not ( = ?auto_859391 ?auto_859405 ) ) ( not ( = ?auto_859392 ?auto_859393 ) ) ( not ( = ?auto_859392 ?auto_859394 ) ) ( not ( = ?auto_859392 ?auto_859395 ) ) ( not ( = ?auto_859392 ?auto_859396 ) ) ( not ( = ?auto_859392 ?auto_859397 ) ) ( not ( = ?auto_859392 ?auto_859398 ) ) ( not ( = ?auto_859392 ?auto_859399 ) ) ( not ( = ?auto_859392 ?auto_859400 ) ) ( not ( = ?auto_859392 ?auto_859401 ) ) ( not ( = ?auto_859392 ?auto_859402 ) ) ( not ( = ?auto_859392 ?auto_859403 ) ) ( not ( = ?auto_859392 ?auto_859404 ) ) ( not ( = ?auto_859392 ?auto_859405 ) ) ( not ( = ?auto_859393 ?auto_859394 ) ) ( not ( = ?auto_859393 ?auto_859395 ) ) ( not ( = ?auto_859393 ?auto_859396 ) ) ( not ( = ?auto_859393 ?auto_859397 ) ) ( not ( = ?auto_859393 ?auto_859398 ) ) ( not ( = ?auto_859393 ?auto_859399 ) ) ( not ( = ?auto_859393 ?auto_859400 ) ) ( not ( = ?auto_859393 ?auto_859401 ) ) ( not ( = ?auto_859393 ?auto_859402 ) ) ( not ( = ?auto_859393 ?auto_859403 ) ) ( not ( = ?auto_859393 ?auto_859404 ) ) ( not ( = ?auto_859393 ?auto_859405 ) ) ( not ( = ?auto_859394 ?auto_859395 ) ) ( not ( = ?auto_859394 ?auto_859396 ) ) ( not ( = ?auto_859394 ?auto_859397 ) ) ( not ( = ?auto_859394 ?auto_859398 ) ) ( not ( = ?auto_859394 ?auto_859399 ) ) ( not ( = ?auto_859394 ?auto_859400 ) ) ( not ( = ?auto_859394 ?auto_859401 ) ) ( not ( = ?auto_859394 ?auto_859402 ) ) ( not ( = ?auto_859394 ?auto_859403 ) ) ( not ( = ?auto_859394 ?auto_859404 ) ) ( not ( = ?auto_859394 ?auto_859405 ) ) ( not ( = ?auto_859395 ?auto_859396 ) ) ( not ( = ?auto_859395 ?auto_859397 ) ) ( not ( = ?auto_859395 ?auto_859398 ) ) ( not ( = ?auto_859395 ?auto_859399 ) ) ( not ( = ?auto_859395 ?auto_859400 ) ) ( not ( = ?auto_859395 ?auto_859401 ) ) ( not ( = ?auto_859395 ?auto_859402 ) ) ( not ( = ?auto_859395 ?auto_859403 ) ) ( not ( = ?auto_859395 ?auto_859404 ) ) ( not ( = ?auto_859395 ?auto_859405 ) ) ( not ( = ?auto_859396 ?auto_859397 ) ) ( not ( = ?auto_859396 ?auto_859398 ) ) ( not ( = ?auto_859396 ?auto_859399 ) ) ( not ( = ?auto_859396 ?auto_859400 ) ) ( not ( = ?auto_859396 ?auto_859401 ) ) ( not ( = ?auto_859396 ?auto_859402 ) ) ( not ( = ?auto_859396 ?auto_859403 ) ) ( not ( = ?auto_859396 ?auto_859404 ) ) ( not ( = ?auto_859396 ?auto_859405 ) ) ( not ( = ?auto_859397 ?auto_859398 ) ) ( not ( = ?auto_859397 ?auto_859399 ) ) ( not ( = ?auto_859397 ?auto_859400 ) ) ( not ( = ?auto_859397 ?auto_859401 ) ) ( not ( = ?auto_859397 ?auto_859402 ) ) ( not ( = ?auto_859397 ?auto_859403 ) ) ( not ( = ?auto_859397 ?auto_859404 ) ) ( not ( = ?auto_859397 ?auto_859405 ) ) ( not ( = ?auto_859398 ?auto_859399 ) ) ( not ( = ?auto_859398 ?auto_859400 ) ) ( not ( = ?auto_859398 ?auto_859401 ) ) ( not ( = ?auto_859398 ?auto_859402 ) ) ( not ( = ?auto_859398 ?auto_859403 ) ) ( not ( = ?auto_859398 ?auto_859404 ) ) ( not ( = ?auto_859398 ?auto_859405 ) ) ( not ( = ?auto_859399 ?auto_859400 ) ) ( not ( = ?auto_859399 ?auto_859401 ) ) ( not ( = ?auto_859399 ?auto_859402 ) ) ( not ( = ?auto_859399 ?auto_859403 ) ) ( not ( = ?auto_859399 ?auto_859404 ) ) ( not ( = ?auto_859399 ?auto_859405 ) ) ( not ( = ?auto_859400 ?auto_859401 ) ) ( not ( = ?auto_859400 ?auto_859402 ) ) ( not ( = ?auto_859400 ?auto_859403 ) ) ( not ( = ?auto_859400 ?auto_859404 ) ) ( not ( = ?auto_859400 ?auto_859405 ) ) ( not ( = ?auto_859401 ?auto_859402 ) ) ( not ( = ?auto_859401 ?auto_859403 ) ) ( not ( = ?auto_859401 ?auto_859404 ) ) ( not ( = ?auto_859401 ?auto_859405 ) ) ( not ( = ?auto_859402 ?auto_859403 ) ) ( not ( = ?auto_859402 ?auto_859404 ) ) ( not ( = ?auto_859402 ?auto_859405 ) ) ( not ( = ?auto_859403 ?auto_859404 ) ) ( not ( = ?auto_859403 ?auto_859405 ) ) ( not ( = ?auto_859404 ?auto_859405 ) ) ( ON ?auto_859403 ?auto_859404 ) ( CLEAR ?auto_859401 ) ( ON ?auto_859402 ?auto_859403 ) ( CLEAR ?auto_859402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_859389 ?auto_859390 ?auto_859391 ?auto_859392 ?auto_859393 ?auto_859394 ?auto_859395 ?auto_859396 ?auto_859397 ?auto_859398 ?auto_859399 ?auto_859400 ?auto_859401 ?auto_859402 )
      ( MAKE-16PILE ?auto_859389 ?auto_859390 ?auto_859391 ?auto_859392 ?auto_859393 ?auto_859394 ?auto_859395 ?auto_859396 ?auto_859397 ?auto_859398 ?auto_859399 ?auto_859400 ?auto_859401 ?auto_859402 ?auto_859403 ?auto_859404 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_859455 - BLOCK
      ?auto_859456 - BLOCK
      ?auto_859457 - BLOCK
      ?auto_859458 - BLOCK
      ?auto_859459 - BLOCK
      ?auto_859460 - BLOCK
      ?auto_859461 - BLOCK
      ?auto_859462 - BLOCK
      ?auto_859463 - BLOCK
      ?auto_859464 - BLOCK
      ?auto_859465 - BLOCK
      ?auto_859466 - BLOCK
      ?auto_859467 - BLOCK
      ?auto_859468 - BLOCK
      ?auto_859469 - BLOCK
      ?auto_859470 - BLOCK
    )
    :vars
    (
      ?auto_859471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859470 ?auto_859471 ) ( ON-TABLE ?auto_859455 ) ( ON ?auto_859456 ?auto_859455 ) ( ON ?auto_859457 ?auto_859456 ) ( ON ?auto_859458 ?auto_859457 ) ( ON ?auto_859459 ?auto_859458 ) ( ON ?auto_859460 ?auto_859459 ) ( ON ?auto_859461 ?auto_859460 ) ( ON ?auto_859462 ?auto_859461 ) ( ON ?auto_859463 ?auto_859462 ) ( ON ?auto_859464 ?auto_859463 ) ( ON ?auto_859465 ?auto_859464 ) ( ON ?auto_859466 ?auto_859465 ) ( not ( = ?auto_859455 ?auto_859456 ) ) ( not ( = ?auto_859455 ?auto_859457 ) ) ( not ( = ?auto_859455 ?auto_859458 ) ) ( not ( = ?auto_859455 ?auto_859459 ) ) ( not ( = ?auto_859455 ?auto_859460 ) ) ( not ( = ?auto_859455 ?auto_859461 ) ) ( not ( = ?auto_859455 ?auto_859462 ) ) ( not ( = ?auto_859455 ?auto_859463 ) ) ( not ( = ?auto_859455 ?auto_859464 ) ) ( not ( = ?auto_859455 ?auto_859465 ) ) ( not ( = ?auto_859455 ?auto_859466 ) ) ( not ( = ?auto_859455 ?auto_859467 ) ) ( not ( = ?auto_859455 ?auto_859468 ) ) ( not ( = ?auto_859455 ?auto_859469 ) ) ( not ( = ?auto_859455 ?auto_859470 ) ) ( not ( = ?auto_859455 ?auto_859471 ) ) ( not ( = ?auto_859456 ?auto_859457 ) ) ( not ( = ?auto_859456 ?auto_859458 ) ) ( not ( = ?auto_859456 ?auto_859459 ) ) ( not ( = ?auto_859456 ?auto_859460 ) ) ( not ( = ?auto_859456 ?auto_859461 ) ) ( not ( = ?auto_859456 ?auto_859462 ) ) ( not ( = ?auto_859456 ?auto_859463 ) ) ( not ( = ?auto_859456 ?auto_859464 ) ) ( not ( = ?auto_859456 ?auto_859465 ) ) ( not ( = ?auto_859456 ?auto_859466 ) ) ( not ( = ?auto_859456 ?auto_859467 ) ) ( not ( = ?auto_859456 ?auto_859468 ) ) ( not ( = ?auto_859456 ?auto_859469 ) ) ( not ( = ?auto_859456 ?auto_859470 ) ) ( not ( = ?auto_859456 ?auto_859471 ) ) ( not ( = ?auto_859457 ?auto_859458 ) ) ( not ( = ?auto_859457 ?auto_859459 ) ) ( not ( = ?auto_859457 ?auto_859460 ) ) ( not ( = ?auto_859457 ?auto_859461 ) ) ( not ( = ?auto_859457 ?auto_859462 ) ) ( not ( = ?auto_859457 ?auto_859463 ) ) ( not ( = ?auto_859457 ?auto_859464 ) ) ( not ( = ?auto_859457 ?auto_859465 ) ) ( not ( = ?auto_859457 ?auto_859466 ) ) ( not ( = ?auto_859457 ?auto_859467 ) ) ( not ( = ?auto_859457 ?auto_859468 ) ) ( not ( = ?auto_859457 ?auto_859469 ) ) ( not ( = ?auto_859457 ?auto_859470 ) ) ( not ( = ?auto_859457 ?auto_859471 ) ) ( not ( = ?auto_859458 ?auto_859459 ) ) ( not ( = ?auto_859458 ?auto_859460 ) ) ( not ( = ?auto_859458 ?auto_859461 ) ) ( not ( = ?auto_859458 ?auto_859462 ) ) ( not ( = ?auto_859458 ?auto_859463 ) ) ( not ( = ?auto_859458 ?auto_859464 ) ) ( not ( = ?auto_859458 ?auto_859465 ) ) ( not ( = ?auto_859458 ?auto_859466 ) ) ( not ( = ?auto_859458 ?auto_859467 ) ) ( not ( = ?auto_859458 ?auto_859468 ) ) ( not ( = ?auto_859458 ?auto_859469 ) ) ( not ( = ?auto_859458 ?auto_859470 ) ) ( not ( = ?auto_859458 ?auto_859471 ) ) ( not ( = ?auto_859459 ?auto_859460 ) ) ( not ( = ?auto_859459 ?auto_859461 ) ) ( not ( = ?auto_859459 ?auto_859462 ) ) ( not ( = ?auto_859459 ?auto_859463 ) ) ( not ( = ?auto_859459 ?auto_859464 ) ) ( not ( = ?auto_859459 ?auto_859465 ) ) ( not ( = ?auto_859459 ?auto_859466 ) ) ( not ( = ?auto_859459 ?auto_859467 ) ) ( not ( = ?auto_859459 ?auto_859468 ) ) ( not ( = ?auto_859459 ?auto_859469 ) ) ( not ( = ?auto_859459 ?auto_859470 ) ) ( not ( = ?auto_859459 ?auto_859471 ) ) ( not ( = ?auto_859460 ?auto_859461 ) ) ( not ( = ?auto_859460 ?auto_859462 ) ) ( not ( = ?auto_859460 ?auto_859463 ) ) ( not ( = ?auto_859460 ?auto_859464 ) ) ( not ( = ?auto_859460 ?auto_859465 ) ) ( not ( = ?auto_859460 ?auto_859466 ) ) ( not ( = ?auto_859460 ?auto_859467 ) ) ( not ( = ?auto_859460 ?auto_859468 ) ) ( not ( = ?auto_859460 ?auto_859469 ) ) ( not ( = ?auto_859460 ?auto_859470 ) ) ( not ( = ?auto_859460 ?auto_859471 ) ) ( not ( = ?auto_859461 ?auto_859462 ) ) ( not ( = ?auto_859461 ?auto_859463 ) ) ( not ( = ?auto_859461 ?auto_859464 ) ) ( not ( = ?auto_859461 ?auto_859465 ) ) ( not ( = ?auto_859461 ?auto_859466 ) ) ( not ( = ?auto_859461 ?auto_859467 ) ) ( not ( = ?auto_859461 ?auto_859468 ) ) ( not ( = ?auto_859461 ?auto_859469 ) ) ( not ( = ?auto_859461 ?auto_859470 ) ) ( not ( = ?auto_859461 ?auto_859471 ) ) ( not ( = ?auto_859462 ?auto_859463 ) ) ( not ( = ?auto_859462 ?auto_859464 ) ) ( not ( = ?auto_859462 ?auto_859465 ) ) ( not ( = ?auto_859462 ?auto_859466 ) ) ( not ( = ?auto_859462 ?auto_859467 ) ) ( not ( = ?auto_859462 ?auto_859468 ) ) ( not ( = ?auto_859462 ?auto_859469 ) ) ( not ( = ?auto_859462 ?auto_859470 ) ) ( not ( = ?auto_859462 ?auto_859471 ) ) ( not ( = ?auto_859463 ?auto_859464 ) ) ( not ( = ?auto_859463 ?auto_859465 ) ) ( not ( = ?auto_859463 ?auto_859466 ) ) ( not ( = ?auto_859463 ?auto_859467 ) ) ( not ( = ?auto_859463 ?auto_859468 ) ) ( not ( = ?auto_859463 ?auto_859469 ) ) ( not ( = ?auto_859463 ?auto_859470 ) ) ( not ( = ?auto_859463 ?auto_859471 ) ) ( not ( = ?auto_859464 ?auto_859465 ) ) ( not ( = ?auto_859464 ?auto_859466 ) ) ( not ( = ?auto_859464 ?auto_859467 ) ) ( not ( = ?auto_859464 ?auto_859468 ) ) ( not ( = ?auto_859464 ?auto_859469 ) ) ( not ( = ?auto_859464 ?auto_859470 ) ) ( not ( = ?auto_859464 ?auto_859471 ) ) ( not ( = ?auto_859465 ?auto_859466 ) ) ( not ( = ?auto_859465 ?auto_859467 ) ) ( not ( = ?auto_859465 ?auto_859468 ) ) ( not ( = ?auto_859465 ?auto_859469 ) ) ( not ( = ?auto_859465 ?auto_859470 ) ) ( not ( = ?auto_859465 ?auto_859471 ) ) ( not ( = ?auto_859466 ?auto_859467 ) ) ( not ( = ?auto_859466 ?auto_859468 ) ) ( not ( = ?auto_859466 ?auto_859469 ) ) ( not ( = ?auto_859466 ?auto_859470 ) ) ( not ( = ?auto_859466 ?auto_859471 ) ) ( not ( = ?auto_859467 ?auto_859468 ) ) ( not ( = ?auto_859467 ?auto_859469 ) ) ( not ( = ?auto_859467 ?auto_859470 ) ) ( not ( = ?auto_859467 ?auto_859471 ) ) ( not ( = ?auto_859468 ?auto_859469 ) ) ( not ( = ?auto_859468 ?auto_859470 ) ) ( not ( = ?auto_859468 ?auto_859471 ) ) ( not ( = ?auto_859469 ?auto_859470 ) ) ( not ( = ?auto_859469 ?auto_859471 ) ) ( not ( = ?auto_859470 ?auto_859471 ) ) ( ON ?auto_859469 ?auto_859470 ) ( ON ?auto_859468 ?auto_859469 ) ( CLEAR ?auto_859466 ) ( ON ?auto_859467 ?auto_859468 ) ( CLEAR ?auto_859467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_859455 ?auto_859456 ?auto_859457 ?auto_859458 ?auto_859459 ?auto_859460 ?auto_859461 ?auto_859462 ?auto_859463 ?auto_859464 ?auto_859465 ?auto_859466 ?auto_859467 )
      ( MAKE-16PILE ?auto_859455 ?auto_859456 ?auto_859457 ?auto_859458 ?auto_859459 ?auto_859460 ?auto_859461 ?auto_859462 ?auto_859463 ?auto_859464 ?auto_859465 ?auto_859466 ?auto_859467 ?auto_859468 ?auto_859469 ?auto_859470 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_859521 - BLOCK
      ?auto_859522 - BLOCK
      ?auto_859523 - BLOCK
      ?auto_859524 - BLOCK
      ?auto_859525 - BLOCK
      ?auto_859526 - BLOCK
      ?auto_859527 - BLOCK
      ?auto_859528 - BLOCK
      ?auto_859529 - BLOCK
      ?auto_859530 - BLOCK
      ?auto_859531 - BLOCK
      ?auto_859532 - BLOCK
      ?auto_859533 - BLOCK
      ?auto_859534 - BLOCK
      ?auto_859535 - BLOCK
      ?auto_859536 - BLOCK
    )
    :vars
    (
      ?auto_859537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859536 ?auto_859537 ) ( ON-TABLE ?auto_859521 ) ( ON ?auto_859522 ?auto_859521 ) ( ON ?auto_859523 ?auto_859522 ) ( ON ?auto_859524 ?auto_859523 ) ( ON ?auto_859525 ?auto_859524 ) ( ON ?auto_859526 ?auto_859525 ) ( ON ?auto_859527 ?auto_859526 ) ( ON ?auto_859528 ?auto_859527 ) ( ON ?auto_859529 ?auto_859528 ) ( ON ?auto_859530 ?auto_859529 ) ( ON ?auto_859531 ?auto_859530 ) ( not ( = ?auto_859521 ?auto_859522 ) ) ( not ( = ?auto_859521 ?auto_859523 ) ) ( not ( = ?auto_859521 ?auto_859524 ) ) ( not ( = ?auto_859521 ?auto_859525 ) ) ( not ( = ?auto_859521 ?auto_859526 ) ) ( not ( = ?auto_859521 ?auto_859527 ) ) ( not ( = ?auto_859521 ?auto_859528 ) ) ( not ( = ?auto_859521 ?auto_859529 ) ) ( not ( = ?auto_859521 ?auto_859530 ) ) ( not ( = ?auto_859521 ?auto_859531 ) ) ( not ( = ?auto_859521 ?auto_859532 ) ) ( not ( = ?auto_859521 ?auto_859533 ) ) ( not ( = ?auto_859521 ?auto_859534 ) ) ( not ( = ?auto_859521 ?auto_859535 ) ) ( not ( = ?auto_859521 ?auto_859536 ) ) ( not ( = ?auto_859521 ?auto_859537 ) ) ( not ( = ?auto_859522 ?auto_859523 ) ) ( not ( = ?auto_859522 ?auto_859524 ) ) ( not ( = ?auto_859522 ?auto_859525 ) ) ( not ( = ?auto_859522 ?auto_859526 ) ) ( not ( = ?auto_859522 ?auto_859527 ) ) ( not ( = ?auto_859522 ?auto_859528 ) ) ( not ( = ?auto_859522 ?auto_859529 ) ) ( not ( = ?auto_859522 ?auto_859530 ) ) ( not ( = ?auto_859522 ?auto_859531 ) ) ( not ( = ?auto_859522 ?auto_859532 ) ) ( not ( = ?auto_859522 ?auto_859533 ) ) ( not ( = ?auto_859522 ?auto_859534 ) ) ( not ( = ?auto_859522 ?auto_859535 ) ) ( not ( = ?auto_859522 ?auto_859536 ) ) ( not ( = ?auto_859522 ?auto_859537 ) ) ( not ( = ?auto_859523 ?auto_859524 ) ) ( not ( = ?auto_859523 ?auto_859525 ) ) ( not ( = ?auto_859523 ?auto_859526 ) ) ( not ( = ?auto_859523 ?auto_859527 ) ) ( not ( = ?auto_859523 ?auto_859528 ) ) ( not ( = ?auto_859523 ?auto_859529 ) ) ( not ( = ?auto_859523 ?auto_859530 ) ) ( not ( = ?auto_859523 ?auto_859531 ) ) ( not ( = ?auto_859523 ?auto_859532 ) ) ( not ( = ?auto_859523 ?auto_859533 ) ) ( not ( = ?auto_859523 ?auto_859534 ) ) ( not ( = ?auto_859523 ?auto_859535 ) ) ( not ( = ?auto_859523 ?auto_859536 ) ) ( not ( = ?auto_859523 ?auto_859537 ) ) ( not ( = ?auto_859524 ?auto_859525 ) ) ( not ( = ?auto_859524 ?auto_859526 ) ) ( not ( = ?auto_859524 ?auto_859527 ) ) ( not ( = ?auto_859524 ?auto_859528 ) ) ( not ( = ?auto_859524 ?auto_859529 ) ) ( not ( = ?auto_859524 ?auto_859530 ) ) ( not ( = ?auto_859524 ?auto_859531 ) ) ( not ( = ?auto_859524 ?auto_859532 ) ) ( not ( = ?auto_859524 ?auto_859533 ) ) ( not ( = ?auto_859524 ?auto_859534 ) ) ( not ( = ?auto_859524 ?auto_859535 ) ) ( not ( = ?auto_859524 ?auto_859536 ) ) ( not ( = ?auto_859524 ?auto_859537 ) ) ( not ( = ?auto_859525 ?auto_859526 ) ) ( not ( = ?auto_859525 ?auto_859527 ) ) ( not ( = ?auto_859525 ?auto_859528 ) ) ( not ( = ?auto_859525 ?auto_859529 ) ) ( not ( = ?auto_859525 ?auto_859530 ) ) ( not ( = ?auto_859525 ?auto_859531 ) ) ( not ( = ?auto_859525 ?auto_859532 ) ) ( not ( = ?auto_859525 ?auto_859533 ) ) ( not ( = ?auto_859525 ?auto_859534 ) ) ( not ( = ?auto_859525 ?auto_859535 ) ) ( not ( = ?auto_859525 ?auto_859536 ) ) ( not ( = ?auto_859525 ?auto_859537 ) ) ( not ( = ?auto_859526 ?auto_859527 ) ) ( not ( = ?auto_859526 ?auto_859528 ) ) ( not ( = ?auto_859526 ?auto_859529 ) ) ( not ( = ?auto_859526 ?auto_859530 ) ) ( not ( = ?auto_859526 ?auto_859531 ) ) ( not ( = ?auto_859526 ?auto_859532 ) ) ( not ( = ?auto_859526 ?auto_859533 ) ) ( not ( = ?auto_859526 ?auto_859534 ) ) ( not ( = ?auto_859526 ?auto_859535 ) ) ( not ( = ?auto_859526 ?auto_859536 ) ) ( not ( = ?auto_859526 ?auto_859537 ) ) ( not ( = ?auto_859527 ?auto_859528 ) ) ( not ( = ?auto_859527 ?auto_859529 ) ) ( not ( = ?auto_859527 ?auto_859530 ) ) ( not ( = ?auto_859527 ?auto_859531 ) ) ( not ( = ?auto_859527 ?auto_859532 ) ) ( not ( = ?auto_859527 ?auto_859533 ) ) ( not ( = ?auto_859527 ?auto_859534 ) ) ( not ( = ?auto_859527 ?auto_859535 ) ) ( not ( = ?auto_859527 ?auto_859536 ) ) ( not ( = ?auto_859527 ?auto_859537 ) ) ( not ( = ?auto_859528 ?auto_859529 ) ) ( not ( = ?auto_859528 ?auto_859530 ) ) ( not ( = ?auto_859528 ?auto_859531 ) ) ( not ( = ?auto_859528 ?auto_859532 ) ) ( not ( = ?auto_859528 ?auto_859533 ) ) ( not ( = ?auto_859528 ?auto_859534 ) ) ( not ( = ?auto_859528 ?auto_859535 ) ) ( not ( = ?auto_859528 ?auto_859536 ) ) ( not ( = ?auto_859528 ?auto_859537 ) ) ( not ( = ?auto_859529 ?auto_859530 ) ) ( not ( = ?auto_859529 ?auto_859531 ) ) ( not ( = ?auto_859529 ?auto_859532 ) ) ( not ( = ?auto_859529 ?auto_859533 ) ) ( not ( = ?auto_859529 ?auto_859534 ) ) ( not ( = ?auto_859529 ?auto_859535 ) ) ( not ( = ?auto_859529 ?auto_859536 ) ) ( not ( = ?auto_859529 ?auto_859537 ) ) ( not ( = ?auto_859530 ?auto_859531 ) ) ( not ( = ?auto_859530 ?auto_859532 ) ) ( not ( = ?auto_859530 ?auto_859533 ) ) ( not ( = ?auto_859530 ?auto_859534 ) ) ( not ( = ?auto_859530 ?auto_859535 ) ) ( not ( = ?auto_859530 ?auto_859536 ) ) ( not ( = ?auto_859530 ?auto_859537 ) ) ( not ( = ?auto_859531 ?auto_859532 ) ) ( not ( = ?auto_859531 ?auto_859533 ) ) ( not ( = ?auto_859531 ?auto_859534 ) ) ( not ( = ?auto_859531 ?auto_859535 ) ) ( not ( = ?auto_859531 ?auto_859536 ) ) ( not ( = ?auto_859531 ?auto_859537 ) ) ( not ( = ?auto_859532 ?auto_859533 ) ) ( not ( = ?auto_859532 ?auto_859534 ) ) ( not ( = ?auto_859532 ?auto_859535 ) ) ( not ( = ?auto_859532 ?auto_859536 ) ) ( not ( = ?auto_859532 ?auto_859537 ) ) ( not ( = ?auto_859533 ?auto_859534 ) ) ( not ( = ?auto_859533 ?auto_859535 ) ) ( not ( = ?auto_859533 ?auto_859536 ) ) ( not ( = ?auto_859533 ?auto_859537 ) ) ( not ( = ?auto_859534 ?auto_859535 ) ) ( not ( = ?auto_859534 ?auto_859536 ) ) ( not ( = ?auto_859534 ?auto_859537 ) ) ( not ( = ?auto_859535 ?auto_859536 ) ) ( not ( = ?auto_859535 ?auto_859537 ) ) ( not ( = ?auto_859536 ?auto_859537 ) ) ( ON ?auto_859535 ?auto_859536 ) ( ON ?auto_859534 ?auto_859535 ) ( ON ?auto_859533 ?auto_859534 ) ( CLEAR ?auto_859531 ) ( ON ?auto_859532 ?auto_859533 ) ( CLEAR ?auto_859532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_859521 ?auto_859522 ?auto_859523 ?auto_859524 ?auto_859525 ?auto_859526 ?auto_859527 ?auto_859528 ?auto_859529 ?auto_859530 ?auto_859531 ?auto_859532 )
      ( MAKE-16PILE ?auto_859521 ?auto_859522 ?auto_859523 ?auto_859524 ?auto_859525 ?auto_859526 ?auto_859527 ?auto_859528 ?auto_859529 ?auto_859530 ?auto_859531 ?auto_859532 ?auto_859533 ?auto_859534 ?auto_859535 ?auto_859536 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_859587 - BLOCK
      ?auto_859588 - BLOCK
      ?auto_859589 - BLOCK
      ?auto_859590 - BLOCK
      ?auto_859591 - BLOCK
      ?auto_859592 - BLOCK
      ?auto_859593 - BLOCK
      ?auto_859594 - BLOCK
      ?auto_859595 - BLOCK
      ?auto_859596 - BLOCK
      ?auto_859597 - BLOCK
      ?auto_859598 - BLOCK
      ?auto_859599 - BLOCK
      ?auto_859600 - BLOCK
      ?auto_859601 - BLOCK
      ?auto_859602 - BLOCK
    )
    :vars
    (
      ?auto_859603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859602 ?auto_859603 ) ( ON-TABLE ?auto_859587 ) ( ON ?auto_859588 ?auto_859587 ) ( ON ?auto_859589 ?auto_859588 ) ( ON ?auto_859590 ?auto_859589 ) ( ON ?auto_859591 ?auto_859590 ) ( ON ?auto_859592 ?auto_859591 ) ( ON ?auto_859593 ?auto_859592 ) ( ON ?auto_859594 ?auto_859593 ) ( ON ?auto_859595 ?auto_859594 ) ( ON ?auto_859596 ?auto_859595 ) ( not ( = ?auto_859587 ?auto_859588 ) ) ( not ( = ?auto_859587 ?auto_859589 ) ) ( not ( = ?auto_859587 ?auto_859590 ) ) ( not ( = ?auto_859587 ?auto_859591 ) ) ( not ( = ?auto_859587 ?auto_859592 ) ) ( not ( = ?auto_859587 ?auto_859593 ) ) ( not ( = ?auto_859587 ?auto_859594 ) ) ( not ( = ?auto_859587 ?auto_859595 ) ) ( not ( = ?auto_859587 ?auto_859596 ) ) ( not ( = ?auto_859587 ?auto_859597 ) ) ( not ( = ?auto_859587 ?auto_859598 ) ) ( not ( = ?auto_859587 ?auto_859599 ) ) ( not ( = ?auto_859587 ?auto_859600 ) ) ( not ( = ?auto_859587 ?auto_859601 ) ) ( not ( = ?auto_859587 ?auto_859602 ) ) ( not ( = ?auto_859587 ?auto_859603 ) ) ( not ( = ?auto_859588 ?auto_859589 ) ) ( not ( = ?auto_859588 ?auto_859590 ) ) ( not ( = ?auto_859588 ?auto_859591 ) ) ( not ( = ?auto_859588 ?auto_859592 ) ) ( not ( = ?auto_859588 ?auto_859593 ) ) ( not ( = ?auto_859588 ?auto_859594 ) ) ( not ( = ?auto_859588 ?auto_859595 ) ) ( not ( = ?auto_859588 ?auto_859596 ) ) ( not ( = ?auto_859588 ?auto_859597 ) ) ( not ( = ?auto_859588 ?auto_859598 ) ) ( not ( = ?auto_859588 ?auto_859599 ) ) ( not ( = ?auto_859588 ?auto_859600 ) ) ( not ( = ?auto_859588 ?auto_859601 ) ) ( not ( = ?auto_859588 ?auto_859602 ) ) ( not ( = ?auto_859588 ?auto_859603 ) ) ( not ( = ?auto_859589 ?auto_859590 ) ) ( not ( = ?auto_859589 ?auto_859591 ) ) ( not ( = ?auto_859589 ?auto_859592 ) ) ( not ( = ?auto_859589 ?auto_859593 ) ) ( not ( = ?auto_859589 ?auto_859594 ) ) ( not ( = ?auto_859589 ?auto_859595 ) ) ( not ( = ?auto_859589 ?auto_859596 ) ) ( not ( = ?auto_859589 ?auto_859597 ) ) ( not ( = ?auto_859589 ?auto_859598 ) ) ( not ( = ?auto_859589 ?auto_859599 ) ) ( not ( = ?auto_859589 ?auto_859600 ) ) ( not ( = ?auto_859589 ?auto_859601 ) ) ( not ( = ?auto_859589 ?auto_859602 ) ) ( not ( = ?auto_859589 ?auto_859603 ) ) ( not ( = ?auto_859590 ?auto_859591 ) ) ( not ( = ?auto_859590 ?auto_859592 ) ) ( not ( = ?auto_859590 ?auto_859593 ) ) ( not ( = ?auto_859590 ?auto_859594 ) ) ( not ( = ?auto_859590 ?auto_859595 ) ) ( not ( = ?auto_859590 ?auto_859596 ) ) ( not ( = ?auto_859590 ?auto_859597 ) ) ( not ( = ?auto_859590 ?auto_859598 ) ) ( not ( = ?auto_859590 ?auto_859599 ) ) ( not ( = ?auto_859590 ?auto_859600 ) ) ( not ( = ?auto_859590 ?auto_859601 ) ) ( not ( = ?auto_859590 ?auto_859602 ) ) ( not ( = ?auto_859590 ?auto_859603 ) ) ( not ( = ?auto_859591 ?auto_859592 ) ) ( not ( = ?auto_859591 ?auto_859593 ) ) ( not ( = ?auto_859591 ?auto_859594 ) ) ( not ( = ?auto_859591 ?auto_859595 ) ) ( not ( = ?auto_859591 ?auto_859596 ) ) ( not ( = ?auto_859591 ?auto_859597 ) ) ( not ( = ?auto_859591 ?auto_859598 ) ) ( not ( = ?auto_859591 ?auto_859599 ) ) ( not ( = ?auto_859591 ?auto_859600 ) ) ( not ( = ?auto_859591 ?auto_859601 ) ) ( not ( = ?auto_859591 ?auto_859602 ) ) ( not ( = ?auto_859591 ?auto_859603 ) ) ( not ( = ?auto_859592 ?auto_859593 ) ) ( not ( = ?auto_859592 ?auto_859594 ) ) ( not ( = ?auto_859592 ?auto_859595 ) ) ( not ( = ?auto_859592 ?auto_859596 ) ) ( not ( = ?auto_859592 ?auto_859597 ) ) ( not ( = ?auto_859592 ?auto_859598 ) ) ( not ( = ?auto_859592 ?auto_859599 ) ) ( not ( = ?auto_859592 ?auto_859600 ) ) ( not ( = ?auto_859592 ?auto_859601 ) ) ( not ( = ?auto_859592 ?auto_859602 ) ) ( not ( = ?auto_859592 ?auto_859603 ) ) ( not ( = ?auto_859593 ?auto_859594 ) ) ( not ( = ?auto_859593 ?auto_859595 ) ) ( not ( = ?auto_859593 ?auto_859596 ) ) ( not ( = ?auto_859593 ?auto_859597 ) ) ( not ( = ?auto_859593 ?auto_859598 ) ) ( not ( = ?auto_859593 ?auto_859599 ) ) ( not ( = ?auto_859593 ?auto_859600 ) ) ( not ( = ?auto_859593 ?auto_859601 ) ) ( not ( = ?auto_859593 ?auto_859602 ) ) ( not ( = ?auto_859593 ?auto_859603 ) ) ( not ( = ?auto_859594 ?auto_859595 ) ) ( not ( = ?auto_859594 ?auto_859596 ) ) ( not ( = ?auto_859594 ?auto_859597 ) ) ( not ( = ?auto_859594 ?auto_859598 ) ) ( not ( = ?auto_859594 ?auto_859599 ) ) ( not ( = ?auto_859594 ?auto_859600 ) ) ( not ( = ?auto_859594 ?auto_859601 ) ) ( not ( = ?auto_859594 ?auto_859602 ) ) ( not ( = ?auto_859594 ?auto_859603 ) ) ( not ( = ?auto_859595 ?auto_859596 ) ) ( not ( = ?auto_859595 ?auto_859597 ) ) ( not ( = ?auto_859595 ?auto_859598 ) ) ( not ( = ?auto_859595 ?auto_859599 ) ) ( not ( = ?auto_859595 ?auto_859600 ) ) ( not ( = ?auto_859595 ?auto_859601 ) ) ( not ( = ?auto_859595 ?auto_859602 ) ) ( not ( = ?auto_859595 ?auto_859603 ) ) ( not ( = ?auto_859596 ?auto_859597 ) ) ( not ( = ?auto_859596 ?auto_859598 ) ) ( not ( = ?auto_859596 ?auto_859599 ) ) ( not ( = ?auto_859596 ?auto_859600 ) ) ( not ( = ?auto_859596 ?auto_859601 ) ) ( not ( = ?auto_859596 ?auto_859602 ) ) ( not ( = ?auto_859596 ?auto_859603 ) ) ( not ( = ?auto_859597 ?auto_859598 ) ) ( not ( = ?auto_859597 ?auto_859599 ) ) ( not ( = ?auto_859597 ?auto_859600 ) ) ( not ( = ?auto_859597 ?auto_859601 ) ) ( not ( = ?auto_859597 ?auto_859602 ) ) ( not ( = ?auto_859597 ?auto_859603 ) ) ( not ( = ?auto_859598 ?auto_859599 ) ) ( not ( = ?auto_859598 ?auto_859600 ) ) ( not ( = ?auto_859598 ?auto_859601 ) ) ( not ( = ?auto_859598 ?auto_859602 ) ) ( not ( = ?auto_859598 ?auto_859603 ) ) ( not ( = ?auto_859599 ?auto_859600 ) ) ( not ( = ?auto_859599 ?auto_859601 ) ) ( not ( = ?auto_859599 ?auto_859602 ) ) ( not ( = ?auto_859599 ?auto_859603 ) ) ( not ( = ?auto_859600 ?auto_859601 ) ) ( not ( = ?auto_859600 ?auto_859602 ) ) ( not ( = ?auto_859600 ?auto_859603 ) ) ( not ( = ?auto_859601 ?auto_859602 ) ) ( not ( = ?auto_859601 ?auto_859603 ) ) ( not ( = ?auto_859602 ?auto_859603 ) ) ( ON ?auto_859601 ?auto_859602 ) ( ON ?auto_859600 ?auto_859601 ) ( ON ?auto_859599 ?auto_859600 ) ( ON ?auto_859598 ?auto_859599 ) ( CLEAR ?auto_859596 ) ( ON ?auto_859597 ?auto_859598 ) ( CLEAR ?auto_859597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_859587 ?auto_859588 ?auto_859589 ?auto_859590 ?auto_859591 ?auto_859592 ?auto_859593 ?auto_859594 ?auto_859595 ?auto_859596 ?auto_859597 )
      ( MAKE-16PILE ?auto_859587 ?auto_859588 ?auto_859589 ?auto_859590 ?auto_859591 ?auto_859592 ?auto_859593 ?auto_859594 ?auto_859595 ?auto_859596 ?auto_859597 ?auto_859598 ?auto_859599 ?auto_859600 ?auto_859601 ?auto_859602 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_859653 - BLOCK
      ?auto_859654 - BLOCK
      ?auto_859655 - BLOCK
      ?auto_859656 - BLOCK
      ?auto_859657 - BLOCK
      ?auto_859658 - BLOCK
      ?auto_859659 - BLOCK
      ?auto_859660 - BLOCK
      ?auto_859661 - BLOCK
      ?auto_859662 - BLOCK
      ?auto_859663 - BLOCK
      ?auto_859664 - BLOCK
      ?auto_859665 - BLOCK
      ?auto_859666 - BLOCK
      ?auto_859667 - BLOCK
      ?auto_859668 - BLOCK
    )
    :vars
    (
      ?auto_859669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859668 ?auto_859669 ) ( ON-TABLE ?auto_859653 ) ( ON ?auto_859654 ?auto_859653 ) ( ON ?auto_859655 ?auto_859654 ) ( ON ?auto_859656 ?auto_859655 ) ( ON ?auto_859657 ?auto_859656 ) ( ON ?auto_859658 ?auto_859657 ) ( ON ?auto_859659 ?auto_859658 ) ( ON ?auto_859660 ?auto_859659 ) ( ON ?auto_859661 ?auto_859660 ) ( not ( = ?auto_859653 ?auto_859654 ) ) ( not ( = ?auto_859653 ?auto_859655 ) ) ( not ( = ?auto_859653 ?auto_859656 ) ) ( not ( = ?auto_859653 ?auto_859657 ) ) ( not ( = ?auto_859653 ?auto_859658 ) ) ( not ( = ?auto_859653 ?auto_859659 ) ) ( not ( = ?auto_859653 ?auto_859660 ) ) ( not ( = ?auto_859653 ?auto_859661 ) ) ( not ( = ?auto_859653 ?auto_859662 ) ) ( not ( = ?auto_859653 ?auto_859663 ) ) ( not ( = ?auto_859653 ?auto_859664 ) ) ( not ( = ?auto_859653 ?auto_859665 ) ) ( not ( = ?auto_859653 ?auto_859666 ) ) ( not ( = ?auto_859653 ?auto_859667 ) ) ( not ( = ?auto_859653 ?auto_859668 ) ) ( not ( = ?auto_859653 ?auto_859669 ) ) ( not ( = ?auto_859654 ?auto_859655 ) ) ( not ( = ?auto_859654 ?auto_859656 ) ) ( not ( = ?auto_859654 ?auto_859657 ) ) ( not ( = ?auto_859654 ?auto_859658 ) ) ( not ( = ?auto_859654 ?auto_859659 ) ) ( not ( = ?auto_859654 ?auto_859660 ) ) ( not ( = ?auto_859654 ?auto_859661 ) ) ( not ( = ?auto_859654 ?auto_859662 ) ) ( not ( = ?auto_859654 ?auto_859663 ) ) ( not ( = ?auto_859654 ?auto_859664 ) ) ( not ( = ?auto_859654 ?auto_859665 ) ) ( not ( = ?auto_859654 ?auto_859666 ) ) ( not ( = ?auto_859654 ?auto_859667 ) ) ( not ( = ?auto_859654 ?auto_859668 ) ) ( not ( = ?auto_859654 ?auto_859669 ) ) ( not ( = ?auto_859655 ?auto_859656 ) ) ( not ( = ?auto_859655 ?auto_859657 ) ) ( not ( = ?auto_859655 ?auto_859658 ) ) ( not ( = ?auto_859655 ?auto_859659 ) ) ( not ( = ?auto_859655 ?auto_859660 ) ) ( not ( = ?auto_859655 ?auto_859661 ) ) ( not ( = ?auto_859655 ?auto_859662 ) ) ( not ( = ?auto_859655 ?auto_859663 ) ) ( not ( = ?auto_859655 ?auto_859664 ) ) ( not ( = ?auto_859655 ?auto_859665 ) ) ( not ( = ?auto_859655 ?auto_859666 ) ) ( not ( = ?auto_859655 ?auto_859667 ) ) ( not ( = ?auto_859655 ?auto_859668 ) ) ( not ( = ?auto_859655 ?auto_859669 ) ) ( not ( = ?auto_859656 ?auto_859657 ) ) ( not ( = ?auto_859656 ?auto_859658 ) ) ( not ( = ?auto_859656 ?auto_859659 ) ) ( not ( = ?auto_859656 ?auto_859660 ) ) ( not ( = ?auto_859656 ?auto_859661 ) ) ( not ( = ?auto_859656 ?auto_859662 ) ) ( not ( = ?auto_859656 ?auto_859663 ) ) ( not ( = ?auto_859656 ?auto_859664 ) ) ( not ( = ?auto_859656 ?auto_859665 ) ) ( not ( = ?auto_859656 ?auto_859666 ) ) ( not ( = ?auto_859656 ?auto_859667 ) ) ( not ( = ?auto_859656 ?auto_859668 ) ) ( not ( = ?auto_859656 ?auto_859669 ) ) ( not ( = ?auto_859657 ?auto_859658 ) ) ( not ( = ?auto_859657 ?auto_859659 ) ) ( not ( = ?auto_859657 ?auto_859660 ) ) ( not ( = ?auto_859657 ?auto_859661 ) ) ( not ( = ?auto_859657 ?auto_859662 ) ) ( not ( = ?auto_859657 ?auto_859663 ) ) ( not ( = ?auto_859657 ?auto_859664 ) ) ( not ( = ?auto_859657 ?auto_859665 ) ) ( not ( = ?auto_859657 ?auto_859666 ) ) ( not ( = ?auto_859657 ?auto_859667 ) ) ( not ( = ?auto_859657 ?auto_859668 ) ) ( not ( = ?auto_859657 ?auto_859669 ) ) ( not ( = ?auto_859658 ?auto_859659 ) ) ( not ( = ?auto_859658 ?auto_859660 ) ) ( not ( = ?auto_859658 ?auto_859661 ) ) ( not ( = ?auto_859658 ?auto_859662 ) ) ( not ( = ?auto_859658 ?auto_859663 ) ) ( not ( = ?auto_859658 ?auto_859664 ) ) ( not ( = ?auto_859658 ?auto_859665 ) ) ( not ( = ?auto_859658 ?auto_859666 ) ) ( not ( = ?auto_859658 ?auto_859667 ) ) ( not ( = ?auto_859658 ?auto_859668 ) ) ( not ( = ?auto_859658 ?auto_859669 ) ) ( not ( = ?auto_859659 ?auto_859660 ) ) ( not ( = ?auto_859659 ?auto_859661 ) ) ( not ( = ?auto_859659 ?auto_859662 ) ) ( not ( = ?auto_859659 ?auto_859663 ) ) ( not ( = ?auto_859659 ?auto_859664 ) ) ( not ( = ?auto_859659 ?auto_859665 ) ) ( not ( = ?auto_859659 ?auto_859666 ) ) ( not ( = ?auto_859659 ?auto_859667 ) ) ( not ( = ?auto_859659 ?auto_859668 ) ) ( not ( = ?auto_859659 ?auto_859669 ) ) ( not ( = ?auto_859660 ?auto_859661 ) ) ( not ( = ?auto_859660 ?auto_859662 ) ) ( not ( = ?auto_859660 ?auto_859663 ) ) ( not ( = ?auto_859660 ?auto_859664 ) ) ( not ( = ?auto_859660 ?auto_859665 ) ) ( not ( = ?auto_859660 ?auto_859666 ) ) ( not ( = ?auto_859660 ?auto_859667 ) ) ( not ( = ?auto_859660 ?auto_859668 ) ) ( not ( = ?auto_859660 ?auto_859669 ) ) ( not ( = ?auto_859661 ?auto_859662 ) ) ( not ( = ?auto_859661 ?auto_859663 ) ) ( not ( = ?auto_859661 ?auto_859664 ) ) ( not ( = ?auto_859661 ?auto_859665 ) ) ( not ( = ?auto_859661 ?auto_859666 ) ) ( not ( = ?auto_859661 ?auto_859667 ) ) ( not ( = ?auto_859661 ?auto_859668 ) ) ( not ( = ?auto_859661 ?auto_859669 ) ) ( not ( = ?auto_859662 ?auto_859663 ) ) ( not ( = ?auto_859662 ?auto_859664 ) ) ( not ( = ?auto_859662 ?auto_859665 ) ) ( not ( = ?auto_859662 ?auto_859666 ) ) ( not ( = ?auto_859662 ?auto_859667 ) ) ( not ( = ?auto_859662 ?auto_859668 ) ) ( not ( = ?auto_859662 ?auto_859669 ) ) ( not ( = ?auto_859663 ?auto_859664 ) ) ( not ( = ?auto_859663 ?auto_859665 ) ) ( not ( = ?auto_859663 ?auto_859666 ) ) ( not ( = ?auto_859663 ?auto_859667 ) ) ( not ( = ?auto_859663 ?auto_859668 ) ) ( not ( = ?auto_859663 ?auto_859669 ) ) ( not ( = ?auto_859664 ?auto_859665 ) ) ( not ( = ?auto_859664 ?auto_859666 ) ) ( not ( = ?auto_859664 ?auto_859667 ) ) ( not ( = ?auto_859664 ?auto_859668 ) ) ( not ( = ?auto_859664 ?auto_859669 ) ) ( not ( = ?auto_859665 ?auto_859666 ) ) ( not ( = ?auto_859665 ?auto_859667 ) ) ( not ( = ?auto_859665 ?auto_859668 ) ) ( not ( = ?auto_859665 ?auto_859669 ) ) ( not ( = ?auto_859666 ?auto_859667 ) ) ( not ( = ?auto_859666 ?auto_859668 ) ) ( not ( = ?auto_859666 ?auto_859669 ) ) ( not ( = ?auto_859667 ?auto_859668 ) ) ( not ( = ?auto_859667 ?auto_859669 ) ) ( not ( = ?auto_859668 ?auto_859669 ) ) ( ON ?auto_859667 ?auto_859668 ) ( ON ?auto_859666 ?auto_859667 ) ( ON ?auto_859665 ?auto_859666 ) ( ON ?auto_859664 ?auto_859665 ) ( ON ?auto_859663 ?auto_859664 ) ( CLEAR ?auto_859661 ) ( ON ?auto_859662 ?auto_859663 ) ( CLEAR ?auto_859662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_859653 ?auto_859654 ?auto_859655 ?auto_859656 ?auto_859657 ?auto_859658 ?auto_859659 ?auto_859660 ?auto_859661 ?auto_859662 )
      ( MAKE-16PILE ?auto_859653 ?auto_859654 ?auto_859655 ?auto_859656 ?auto_859657 ?auto_859658 ?auto_859659 ?auto_859660 ?auto_859661 ?auto_859662 ?auto_859663 ?auto_859664 ?auto_859665 ?auto_859666 ?auto_859667 ?auto_859668 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_859719 - BLOCK
      ?auto_859720 - BLOCK
      ?auto_859721 - BLOCK
      ?auto_859722 - BLOCK
      ?auto_859723 - BLOCK
      ?auto_859724 - BLOCK
      ?auto_859725 - BLOCK
      ?auto_859726 - BLOCK
      ?auto_859727 - BLOCK
      ?auto_859728 - BLOCK
      ?auto_859729 - BLOCK
      ?auto_859730 - BLOCK
      ?auto_859731 - BLOCK
      ?auto_859732 - BLOCK
      ?auto_859733 - BLOCK
      ?auto_859734 - BLOCK
    )
    :vars
    (
      ?auto_859735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859734 ?auto_859735 ) ( ON-TABLE ?auto_859719 ) ( ON ?auto_859720 ?auto_859719 ) ( ON ?auto_859721 ?auto_859720 ) ( ON ?auto_859722 ?auto_859721 ) ( ON ?auto_859723 ?auto_859722 ) ( ON ?auto_859724 ?auto_859723 ) ( ON ?auto_859725 ?auto_859724 ) ( ON ?auto_859726 ?auto_859725 ) ( not ( = ?auto_859719 ?auto_859720 ) ) ( not ( = ?auto_859719 ?auto_859721 ) ) ( not ( = ?auto_859719 ?auto_859722 ) ) ( not ( = ?auto_859719 ?auto_859723 ) ) ( not ( = ?auto_859719 ?auto_859724 ) ) ( not ( = ?auto_859719 ?auto_859725 ) ) ( not ( = ?auto_859719 ?auto_859726 ) ) ( not ( = ?auto_859719 ?auto_859727 ) ) ( not ( = ?auto_859719 ?auto_859728 ) ) ( not ( = ?auto_859719 ?auto_859729 ) ) ( not ( = ?auto_859719 ?auto_859730 ) ) ( not ( = ?auto_859719 ?auto_859731 ) ) ( not ( = ?auto_859719 ?auto_859732 ) ) ( not ( = ?auto_859719 ?auto_859733 ) ) ( not ( = ?auto_859719 ?auto_859734 ) ) ( not ( = ?auto_859719 ?auto_859735 ) ) ( not ( = ?auto_859720 ?auto_859721 ) ) ( not ( = ?auto_859720 ?auto_859722 ) ) ( not ( = ?auto_859720 ?auto_859723 ) ) ( not ( = ?auto_859720 ?auto_859724 ) ) ( not ( = ?auto_859720 ?auto_859725 ) ) ( not ( = ?auto_859720 ?auto_859726 ) ) ( not ( = ?auto_859720 ?auto_859727 ) ) ( not ( = ?auto_859720 ?auto_859728 ) ) ( not ( = ?auto_859720 ?auto_859729 ) ) ( not ( = ?auto_859720 ?auto_859730 ) ) ( not ( = ?auto_859720 ?auto_859731 ) ) ( not ( = ?auto_859720 ?auto_859732 ) ) ( not ( = ?auto_859720 ?auto_859733 ) ) ( not ( = ?auto_859720 ?auto_859734 ) ) ( not ( = ?auto_859720 ?auto_859735 ) ) ( not ( = ?auto_859721 ?auto_859722 ) ) ( not ( = ?auto_859721 ?auto_859723 ) ) ( not ( = ?auto_859721 ?auto_859724 ) ) ( not ( = ?auto_859721 ?auto_859725 ) ) ( not ( = ?auto_859721 ?auto_859726 ) ) ( not ( = ?auto_859721 ?auto_859727 ) ) ( not ( = ?auto_859721 ?auto_859728 ) ) ( not ( = ?auto_859721 ?auto_859729 ) ) ( not ( = ?auto_859721 ?auto_859730 ) ) ( not ( = ?auto_859721 ?auto_859731 ) ) ( not ( = ?auto_859721 ?auto_859732 ) ) ( not ( = ?auto_859721 ?auto_859733 ) ) ( not ( = ?auto_859721 ?auto_859734 ) ) ( not ( = ?auto_859721 ?auto_859735 ) ) ( not ( = ?auto_859722 ?auto_859723 ) ) ( not ( = ?auto_859722 ?auto_859724 ) ) ( not ( = ?auto_859722 ?auto_859725 ) ) ( not ( = ?auto_859722 ?auto_859726 ) ) ( not ( = ?auto_859722 ?auto_859727 ) ) ( not ( = ?auto_859722 ?auto_859728 ) ) ( not ( = ?auto_859722 ?auto_859729 ) ) ( not ( = ?auto_859722 ?auto_859730 ) ) ( not ( = ?auto_859722 ?auto_859731 ) ) ( not ( = ?auto_859722 ?auto_859732 ) ) ( not ( = ?auto_859722 ?auto_859733 ) ) ( not ( = ?auto_859722 ?auto_859734 ) ) ( not ( = ?auto_859722 ?auto_859735 ) ) ( not ( = ?auto_859723 ?auto_859724 ) ) ( not ( = ?auto_859723 ?auto_859725 ) ) ( not ( = ?auto_859723 ?auto_859726 ) ) ( not ( = ?auto_859723 ?auto_859727 ) ) ( not ( = ?auto_859723 ?auto_859728 ) ) ( not ( = ?auto_859723 ?auto_859729 ) ) ( not ( = ?auto_859723 ?auto_859730 ) ) ( not ( = ?auto_859723 ?auto_859731 ) ) ( not ( = ?auto_859723 ?auto_859732 ) ) ( not ( = ?auto_859723 ?auto_859733 ) ) ( not ( = ?auto_859723 ?auto_859734 ) ) ( not ( = ?auto_859723 ?auto_859735 ) ) ( not ( = ?auto_859724 ?auto_859725 ) ) ( not ( = ?auto_859724 ?auto_859726 ) ) ( not ( = ?auto_859724 ?auto_859727 ) ) ( not ( = ?auto_859724 ?auto_859728 ) ) ( not ( = ?auto_859724 ?auto_859729 ) ) ( not ( = ?auto_859724 ?auto_859730 ) ) ( not ( = ?auto_859724 ?auto_859731 ) ) ( not ( = ?auto_859724 ?auto_859732 ) ) ( not ( = ?auto_859724 ?auto_859733 ) ) ( not ( = ?auto_859724 ?auto_859734 ) ) ( not ( = ?auto_859724 ?auto_859735 ) ) ( not ( = ?auto_859725 ?auto_859726 ) ) ( not ( = ?auto_859725 ?auto_859727 ) ) ( not ( = ?auto_859725 ?auto_859728 ) ) ( not ( = ?auto_859725 ?auto_859729 ) ) ( not ( = ?auto_859725 ?auto_859730 ) ) ( not ( = ?auto_859725 ?auto_859731 ) ) ( not ( = ?auto_859725 ?auto_859732 ) ) ( not ( = ?auto_859725 ?auto_859733 ) ) ( not ( = ?auto_859725 ?auto_859734 ) ) ( not ( = ?auto_859725 ?auto_859735 ) ) ( not ( = ?auto_859726 ?auto_859727 ) ) ( not ( = ?auto_859726 ?auto_859728 ) ) ( not ( = ?auto_859726 ?auto_859729 ) ) ( not ( = ?auto_859726 ?auto_859730 ) ) ( not ( = ?auto_859726 ?auto_859731 ) ) ( not ( = ?auto_859726 ?auto_859732 ) ) ( not ( = ?auto_859726 ?auto_859733 ) ) ( not ( = ?auto_859726 ?auto_859734 ) ) ( not ( = ?auto_859726 ?auto_859735 ) ) ( not ( = ?auto_859727 ?auto_859728 ) ) ( not ( = ?auto_859727 ?auto_859729 ) ) ( not ( = ?auto_859727 ?auto_859730 ) ) ( not ( = ?auto_859727 ?auto_859731 ) ) ( not ( = ?auto_859727 ?auto_859732 ) ) ( not ( = ?auto_859727 ?auto_859733 ) ) ( not ( = ?auto_859727 ?auto_859734 ) ) ( not ( = ?auto_859727 ?auto_859735 ) ) ( not ( = ?auto_859728 ?auto_859729 ) ) ( not ( = ?auto_859728 ?auto_859730 ) ) ( not ( = ?auto_859728 ?auto_859731 ) ) ( not ( = ?auto_859728 ?auto_859732 ) ) ( not ( = ?auto_859728 ?auto_859733 ) ) ( not ( = ?auto_859728 ?auto_859734 ) ) ( not ( = ?auto_859728 ?auto_859735 ) ) ( not ( = ?auto_859729 ?auto_859730 ) ) ( not ( = ?auto_859729 ?auto_859731 ) ) ( not ( = ?auto_859729 ?auto_859732 ) ) ( not ( = ?auto_859729 ?auto_859733 ) ) ( not ( = ?auto_859729 ?auto_859734 ) ) ( not ( = ?auto_859729 ?auto_859735 ) ) ( not ( = ?auto_859730 ?auto_859731 ) ) ( not ( = ?auto_859730 ?auto_859732 ) ) ( not ( = ?auto_859730 ?auto_859733 ) ) ( not ( = ?auto_859730 ?auto_859734 ) ) ( not ( = ?auto_859730 ?auto_859735 ) ) ( not ( = ?auto_859731 ?auto_859732 ) ) ( not ( = ?auto_859731 ?auto_859733 ) ) ( not ( = ?auto_859731 ?auto_859734 ) ) ( not ( = ?auto_859731 ?auto_859735 ) ) ( not ( = ?auto_859732 ?auto_859733 ) ) ( not ( = ?auto_859732 ?auto_859734 ) ) ( not ( = ?auto_859732 ?auto_859735 ) ) ( not ( = ?auto_859733 ?auto_859734 ) ) ( not ( = ?auto_859733 ?auto_859735 ) ) ( not ( = ?auto_859734 ?auto_859735 ) ) ( ON ?auto_859733 ?auto_859734 ) ( ON ?auto_859732 ?auto_859733 ) ( ON ?auto_859731 ?auto_859732 ) ( ON ?auto_859730 ?auto_859731 ) ( ON ?auto_859729 ?auto_859730 ) ( ON ?auto_859728 ?auto_859729 ) ( CLEAR ?auto_859726 ) ( ON ?auto_859727 ?auto_859728 ) ( CLEAR ?auto_859727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_859719 ?auto_859720 ?auto_859721 ?auto_859722 ?auto_859723 ?auto_859724 ?auto_859725 ?auto_859726 ?auto_859727 )
      ( MAKE-16PILE ?auto_859719 ?auto_859720 ?auto_859721 ?auto_859722 ?auto_859723 ?auto_859724 ?auto_859725 ?auto_859726 ?auto_859727 ?auto_859728 ?auto_859729 ?auto_859730 ?auto_859731 ?auto_859732 ?auto_859733 ?auto_859734 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_859785 - BLOCK
      ?auto_859786 - BLOCK
      ?auto_859787 - BLOCK
      ?auto_859788 - BLOCK
      ?auto_859789 - BLOCK
      ?auto_859790 - BLOCK
      ?auto_859791 - BLOCK
      ?auto_859792 - BLOCK
      ?auto_859793 - BLOCK
      ?auto_859794 - BLOCK
      ?auto_859795 - BLOCK
      ?auto_859796 - BLOCK
      ?auto_859797 - BLOCK
      ?auto_859798 - BLOCK
      ?auto_859799 - BLOCK
      ?auto_859800 - BLOCK
    )
    :vars
    (
      ?auto_859801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859800 ?auto_859801 ) ( ON-TABLE ?auto_859785 ) ( ON ?auto_859786 ?auto_859785 ) ( ON ?auto_859787 ?auto_859786 ) ( ON ?auto_859788 ?auto_859787 ) ( ON ?auto_859789 ?auto_859788 ) ( ON ?auto_859790 ?auto_859789 ) ( ON ?auto_859791 ?auto_859790 ) ( not ( = ?auto_859785 ?auto_859786 ) ) ( not ( = ?auto_859785 ?auto_859787 ) ) ( not ( = ?auto_859785 ?auto_859788 ) ) ( not ( = ?auto_859785 ?auto_859789 ) ) ( not ( = ?auto_859785 ?auto_859790 ) ) ( not ( = ?auto_859785 ?auto_859791 ) ) ( not ( = ?auto_859785 ?auto_859792 ) ) ( not ( = ?auto_859785 ?auto_859793 ) ) ( not ( = ?auto_859785 ?auto_859794 ) ) ( not ( = ?auto_859785 ?auto_859795 ) ) ( not ( = ?auto_859785 ?auto_859796 ) ) ( not ( = ?auto_859785 ?auto_859797 ) ) ( not ( = ?auto_859785 ?auto_859798 ) ) ( not ( = ?auto_859785 ?auto_859799 ) ) ( not ( = ?auto_859785 ?auto_859800 ) ) ( not ( = ?auto_859785 ?auto_859801 ) ) ( not ( = ?auto_859786 ?auto_859787 ) ) ( not ( = ?auto_859786 ?auto_859788 ) ) ( not ( = ?auto_859786 ?auto_859789 ) ) ( not ( = ?auto_859786 ?auto_859790 ) ) ( not ( = ?auto_859786 ?auto_859791 ) ) ( not ( = ?auto_859786 ?auto_859792 ) ) ( not ( = ?auto_859786 ?auto_859793 ) ) ( not ( = ?auto_859786 ?auto_859794 ) ) ( not ( = ?auto_859786 ?auto_859795 ) ) ( not ( = ?auto_859786 ?auto_859796 ) ) ( not ( = ?auto_859786 ?auto_859797 ) ) ( not ( = ?auto_859786 ?auto_859798 ) ) ( not ( = ?auto_859786 ?auto_859799 ) ) ( not ( = ?auto_859786 ?auto_859800 ) ) ( not ( = ?auto_859786 ?auto_859801 ) ) ( not ( = ?auto_859787 ?auto_859788 ) ) ( not ( = ?auto_859787 ?auto_859789 ) ) ( not ( = ?auto_859787 ?auto_859790 ) ) ( not ( = ?auto_859787 ?auto_859791 ) ) ( not ( = ?auto_859787 ?auto_859792 ) ) ( not ( = ?auto_859787 ?auto_859793 ) ) ( not ( = ?auto_859787 ?auto_859794 ) ) ( not ( = ?auto_859787 ?auto_859795 ) ) ( not ( = ?auto_859787 ?auto_859796 ) ) ( not ( = ?auto_859787 ?auto_859797 ) ) ( not ( = ?auto_859787 ?auto_859798 ) ) ( not ( = ?auto_859787 ?auto_859799 ) ) ( not ( = ?auto_859787 ?auto_859800 ) ) ( not ( = ?auto_859787 ?auto_859801 ) ) ( not ( = ?auto_859788 ?auto_859789 ) ) ( not ( = ?auto_859788 ?auto_859790 ) ) ( not ( = ?auto_859788 ?auto_859791 ) ) ( not ( = ?auto_859788 ?auto_859792 ) ) ( not ( = ?auto_859788 ?auto_859793 ) ) ( not ( = ?auto_859788 ?auto_859794 ) ) ( not ( = ?auto_859788 ?auto_859795 ) ) ( not ( = ?auto_859788 ?auto_859796 ) ) ( not ( = ?auto_859788 ?auto_859797 ) ) ( not ( = ?auto_859788 ?auto_859798 ) ) ( not ( = ?auto_859788 ?auto_859799 ) ) ( not ( = ?auto_859788 ?auto_859800 ) ) ( not ( = ?auto_859788 ?auto_859801 ) ) ( not ( = ?auto_859789 ?auto_859790 ) ) ( not ( = ?auto_859789 ?auto_859791 ) ) ( not ( = ?auto_859789 ?auto_859792 ) ) ( not ( = ?auto_859789 ?auto_859793 ) ) ( not ( = ?auto_859789 ?auto_859794 ) ) ( not ( = ?auto_859789 ?auto_859795 ) ) ( not ( = ?auto_859789 ?auto_859796 ) ) ( not ( = ?auto_859789 ?auto_859797 ) ) ( not ( = ?auto_859789 ?auto_859798 ) ) ( not ( = ?auto_859789 ?auto_859799 ) ) ( not ( = ?auto_859789 ?auto_859800 ) ) ( not ( = ?auto_859789 ?auto_859801 ) ) ( not ( = ?auto_859790 ?auto_859791 ) ) ( not ( = ?auto_859790 ?auto_859792 ) ) ( not ( = ?auto_859790 ?auto_859793 ) ) ( not ( = ?auto_859790 ?auto_859794 ) ) ( not ( = ?auto_859790 ?auto_859795 ) ) ( not ( = ?auto_859790 ?auto_859796 ) ) ( not ( = ?auto_859790 ?auto_859797 ) ) ( not ( = ?auto_859790 ?auto_859798 ) ) ( not ( = ?auto_859790 ?auto_859799 ) ) ( not ( = ?auto_859790 ?auto_859800 ) ) ( not ( = ?auto_859790 ?auto_859801 ) ) ( not ( = ?auto_859791 ?auto_859792 ) ) ( not ( = ?auto_859791 ?auto_859793 ) ) ( not ( = ?auto_859791 ?auto_859794 ) ) ( not ( = ?auto_859791 ?auto_859795 ) ) ( not ( = ?auto_859791 ?auto_859796 ) ) ( not ( = ?auto_859791 ?auto_859797 ) ) ( not ( = ?auto_859791 ?auto_859798 ) ) ( not ( = ?auto_859791 ?auto_859799 ) ) ( not ( = ?auto_859791 ?auto_859800 ) ) ( not ( = ?auto_859791 ?auto_859801 ) ) ( not ( = ?auto_859792 ?auto_859793 ) ) ( not ( = ?auto_859792 ?auto_859794 ) ) ( not ( = ?auto_859792 ?auto_859795 ) ) ( not ( = ?auto_859792 ?auto_859796 ) ) ( not ( = ?auto_859792 ?auto_859797 ) ) ( not ( = ?auto_859792 ?auto_859798 ) ) ( not ( = ?auto_859792 ?auto_859799 ) ) ( not ( = ?auto_859792 ?auto_859800 ) ) ( not ( = ?auto_859792 ?auto_859801 ) ) ( not ( = ?auto_859793 ?auto_859794 ) ) ( not ( = ?auto_859793 ?auto_859795 ) ) ( not ( = ?auto_859793 ?auto_859796 ) ) ( not ( = ?auto_859793 ?auto_859797 ) ) ( not ( = ?auto_859793 ?auto_859798 ) ) ( not ( = ?auto_859793 ?auto_859799 ) ) ( not ( = ?auto_859793 ?auto_859800 ) ) ( not ( = ?auto_859793 ?auto_859801 ) ) ( not ( = ?auto_859794 ?auto_859795 ) ) ( not ( = ?auto_859794 ?auto_859796 ) ) ( not ( = ?auto_859794 ?auto_859797 ) ) ( not ( = ?auto_859794 ?auto_859798 ) ) ( not ( = ?auto_859794 ?auto_859799 ) ) ( not ( = ?auto_859794 ?auto_859800 ) ) ( not ( = ?auto_859794 ?auto_859801 ) ) ( not ( = ?auto_859795 ?auto_859796 ) ) ( not ( = ?auto_859795 ?auto_859797 ) ) ( not ( = ?auto_859795 ?auto_859798 ) ) ( not ( = ?auto_859795 ?auto_859799 ) ) ( not ( = ?auto_859795 ?auto_859800 ) ) ( not ( = ?auto_859795 ?auto_859801 ) ) ( not ( = ?auto_859796 ?auto_859797 ) ) ( not ( = ?auto_859796 ?auto_859798 ) ) ( not ( = ?auto_859796 ?auto_859799 ) ) ( not ( = ?auto_859796 ?auto_859800 ) ) ( not ( = ?auto_859796 ?auto_859801 ) ) ( not ( = ?auto_859797 ?auto_859798 ) ) ( not ( = ?auto_859797 ?auto_859799 ) ) ( not ( = ?auto_859797 ?auto_859800 ) ) ( not ( = ?auto_859797 ?auto_859801 ) ) ( not ( = ?auto_859798 ?auto_859799 ) ) ( not ( = ?auto_859798 ?auto_859800 ) ) ( not ( = ?auto_859798 ?auto_859801 ) ) ( not ( = ?auto_859799 ?auto_859800 ) ) ( not ( = ?auto_859799 ?auto_859801 ) ) ( not ( = ?auto_859800 ?auto_859801 ) ) ( ON ?auto_859799 ?auto_859800 ) ( ON ?auto_859798 ?auto_859799 ) ( ON ?auto_859797 ?auto_859798 ) ( ON ?auto_859796 ?auto_859797 ) ( ON ?auto_859795 ?auto_859796 ) ( ON ?auto_859794 ?auto_859795 ) ( ON ?auto_859793 ?auto_859794 ) ( CLEAR ?auto_859791 ) ( ON ?auto_859792 ?auto_859793 ) ( CLEAR ?auto_859792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_859785 ?auto_859786 ?auto_859787 ?auto_859788 ?auto_859789 ?auto_859790 ?auto_859791 ?auto_859792 )
      ( MAKE-16PILE ?auto_859785 ?auto_859786 ?auto_859787 ?auto_859788 ?auto_859789 ?auto_859790 ?auto_859791 ?auto_859792 ?auto_859793 ?auto_859794 ?auto_859795 ?auto_859796 ?auto_859797 ?auto_859798 ?auto_859799 ?auto_859800 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_859851 - BLOCK
      ?auto_859852 - BLOCK
      ?auto_859853 - BLOCK
      ?auto_859854 - BLOCK
      ?auto_859855 - BLOCK
      ?auto_859856 - BLOCK
      ?auto_859857 - BLOCK
      ?auto_859858 - BLOCK
      ?auto_859859 - BLOCK
      ?auto_859860 - BLOCK
      ?auto_859861 - BLOCK
      ?auto_859862 - BLOCK
      ?auto_859863 - BLOCK
      ?auto_859864 - BLOCK
      ?auto_859865 - BLOCK
      ?auto_859866 - BLOCK
    )
    :vars
    (
      ?auto_859867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859866 ?auto_859867 ) ( ON-TABLE ?auto_859851 ) ( ON ?auto_859852 ?auto_859851 ) ( ON ?auto_859853 ?auto_859852 ) ( ON ?auto_859854 ?auto_859853 ) ( ON ?auto_859855 ?auto_859854 ) ( ON ?auto_859856 ?auto_859855 ) ( not ( = ?auto_859851 ?auto_859852 ) ) ( not ( = ?auto_859851 ?auto_859853 ) ) ( not ( = ?auto_859851 ?auto_859854 ) ) ( not ( = ?auto_859851 ?auto_859855 ) ) ( not ( = ?auto_859851 ?auto_859856 ) ) ( not ( = ?auto_859851 ?auto_859857 ) ) ( not ( = ?auto_859851 ?auto_859858 ) ) ( not ( = ?auto_859851 ?auto_859859 ) ) ( not ( = ?auto_859851 ?auto_859860 ) ) ( not ( = ?auto_859851 ?auto_859861 ) ) ( not ( = ?auto_859851 ?auto_859862 ) ) ( not ( = ?auto_859851 ?auto_859863 ) ) ( not ( = ?auto_859851 ?auto_859864 ) ) ( not ( = ?auto_859851 ?auto_859865 ) ) ( not ( = ?auto_859851 ?auto_859866 ) ) ( not ( = ?auto_859851 ?auto_859867 ) ) ( not ( = ?auto_859852 ?auto_859853 ) ) ( not ( = ?auto_859852 ?auto_859854 ) ) ( not ( = ?auto_859852 ?auto_859855 ) ) ( not ( = ?auto_859852 ?auto_859856 ) ) ( not ( = ?auto_859852 ?auto_859857 ) ) ( not ( = ?auto_859852 ?auto_859858 ) ) ( not ( = ?auto_859852 ?auto_859859 ) ) ( not ( = ?auto_859852 ?auto_859860 ) ) ( not ( = ?auto_859852 ?auto_859861 ) ) ( not ( = ?auto_859852 ?auto_859862 ) ) ( not ( = ?auto_859852 ?auto_859863 ) ) ( not ( = ?auto_859852 ?auto_859864 ) ) ( not ( = ?auto_859852 ?auto_859865 ) ) ( not ( = ?auto_859852 ?auto_859866 ) ) ( not ( = ?auto_859852 ?auto_859867 ) ) ( not ( = ?auto_859853 ?auto_859854 ) ) ( not ( = ?auto_859853 ?auto_859855 ) ) ( not ( = ?auto_859853 ?auto_859856 ) ) ( not ( = ?auto_859853 ?auto_859857 ) ) ( not ( = ?auto_859853 ?auto_859858 ) ) ( not ( = ?auto_859853 ?auto_859859 ) ) ( not ( = ?auto_859853 ?auto_859860 ) ) ( not ( = ?auto_859853 ?auto_859861 ) ) ( not ( = ?auto_859853 ?auto_859862 ) ) ( not ( = ?auto_859853 ?auto_859863 ) ) ( not ( = ?auto_859853 ?auto_859864 ) ) ( not ( = ?auto_859853 ?auto_859865 ) ) ( not ( = ?auto_859853 ?auto_859866 ) ) ( not ( = ?auto_859853 ?auto_859867 ) ) ( not ( = ?auto_859854 ?auto_859855 ) ) ( not ( = ?auto_859854 ?auto_859856 ) ) ( not ( = ?auto_859854 ?auto_859857 ) ) ( not ( = ?auto_859854 ?auto_859858 ) ) ( not ( = ?auto_859854 ?auto_859859 ) ) ( not ( = ?auto_859854 ?auto_859860 ) ) ( not ( = ?auto_859854 ?auto_859861 ) ) ( not ( = ?auto_859854 ?auto_859862 ) ) ( not ( = ?auto_859854 ?auto_859863 ) ) ( not ( = ?auto_859854 ?auto_859864 ) ) ( not ( = ?auto_859854 ?auto_859865 ) ) ( not ( = ?auto_859854 ?auto_859866 ) ) ( not ( = ?auto_859854 ?auto_859867 ) ) ( not ( = ?auto_859855 ?auto_859856 ) ) ( not ( = ?auto_859855 ?auto_859857 ) ) ( not ( = ?auto_859855 ?auto_859858 ) ) ( not ( = ?auto_859855 ?auto_859859 ) ) ( not ( = ?auto_859855 ?auto_859860 ) ) ( not ( = ?auto_859855 ?auto_859861 ) ) ( not ( = ?auto_859855 ?auto_859862 ) ) ( not ( = ?auto_859855 ?auto_859863 ) ) ( not ( = ?auto_859855 ?auto_859864 ) ) ( not ( = ?auto_859855 ?auto_859865 ) ) ( not ( = ?auto_859855 ?auto_859866 ) ) ( not ( = ?auto_859855 ?auto_859867 ) ) ( not ( = ?auto_859856 ?auto_859857 ) ) ( not ( = ?auto_859856 ?auto_859858 ) ) ( not ( = ?auto_859856 ?auto_859859 ) ) ( not ( = ?auto_859856 ?auto_859860 ) ) ( not ( = ?auto_859856 ?auto_859861 ) ) ( not ( = ?auto_859856 ?auto_859862 ) ) ( not ( = ?auto_859856 ?auto_859863 ) ) ( not ( = ?auto_859856 ?auto_859864 ) ) ( not ( = ?auto_859856 ?auto_859865 ) ) ( not ( = ?auto_859856 ?auto_859866 ) ) ( not ( = ?auto_859856 ?auto_859867 ) ) ( not ( = ?auto_859857 ?auto_859858 ) ) ( not ( = ?auto_859857 ?auto_859859 ) ) ( not ( = ?auto_859857 ?auto_859860 ) ) ( not ( = ?auto_859857 ?auto_859861 ) ) ( not ( = ?auto_859857 ?auto_859862 ) ) ( not ( = ?auto_859857 ?auto_859863 ) ) ( not ( = ?auto_859857 ?auto_859864 ) ) ( not ( = ?auto_859857 ?auto_859865 ) ) ( not ( = ?auto_859857 ?auto_859866 ) ) ( not ( = ?auto_859857 ?auto_859867 ) ) ( not ( = ?auto_859858 ?auto_859859 ) ) ( not ( = ?auto_859858 ?auto_859860 ) ) ( not ( = ?auto_859858 ?auto_859861 ) ) ( not ( = ?auto_859858 ?auto_859862 ) ) ( not ( = ?auto_859858 ?auto_859863 ) ) ( not ( = ?auto_859858 ?auto_859864 ) ) ( not ( = ?auto_859858 ?auto_859865 ) ) ( not ( = ?auto_859858 ?auto_859866 ) ) ( not ( = ?auto_859858 ?auto_859867 ) ) ( not ( = ?auto_859859 ?auto_859860 ) ) ( not ( = ?auto_859859 ?auto_859861 ) ) ( not ( = ?auto_859859 ?auto_859862 ) ) ( not ( = ?auto_859859 ?auto_859863 ) ) ( not ( = ?auto_859859 ?auto_859864 ) ) ( not ( = ?auto_859859 ?auto_859865 ) ) ( not ( = ?auto_859859 ?auto_859866 ) ) ( not ( = ?auto_859859 ?auto_859867 ) ) ( not ( = ?auto_859860 ?auto_859861 ) ) ( not ( = ?auto_859860 ?auto_859862 ) ) ( not ( = ?auto_859860 ?auto_859863 ) ) ( not ( = ?auto_859860 ?auto_859864 ) ) ( not ( = ?auto_859860 ?auto_859865 ) ) ( not ( = ?auto_859860 ?auto_859866 ) ) ( not ( = ?auto_859860 ?auto_859867 ) ) ( not ( = ?auto_859861 ?auto_859862 ) ) ( not ( = ?auto_859861 ?auto_859863 ) ) ( not ( = ?auto_859861 ?auto_859864 ) ) ( not ( = ?auto_859861 ?auto_859865 ) ) ( not ( = ?auto_859861 ?auto_859866 ) ) ( not ( = ?auto_859861 ?auto_859867 ) ) ( not ( = ?auto_859862 ?auto_859863 ) ) ( not ( = ?auto_859862 ?auto_859864 ) ) ( not ( = ?auto_859862 ?auto_859865 ) ) ( not ( = ?auto_859862 ?auto_859866 ) ) ( not ( = ?auto_859862 ?auto_859867 ) ) ( not ( = ?auto_859863 ?auto_859864 ) ) ( not ( = ?auto_859863 ?auto_859865 ) ) ( not ( = ?auto_859863 ?auto_859866 ) ) ( not ( = ?auto_859863 ?auto_859867 ) ) ( not ( = ?auto_859864 ?auto_859865 ) ) ( not ( = ?auto_859864 ?auto_859866 ) ) ( not ( = ?auto_859864 ?auto_859867 ) ) ( not ( = ?auto_859865 ?auto_859866 ) ) ( not ( = ?auto_859865 ?auto_859867 ) ) ( not ( = ?auto_859866 ?auto_859867 ) ) ( ON ?auto_859865 ?auto_859866 ) ( ON ?auto_859864 ?auto_859865 ) ( ON ?auto_859863 ?auto_859864 ) ( ON ?auto_859862 ?auto_859863 ) ( ON ?auto_859861 ?auto_859862 ) ( ON ?auto_859860 ?auto_859861 ) ( ON ?auto_859859 ?auto_859860 ) ( ON ?auto_859858 ?auto_859859 ) ( CLEAR ?auto_859856 ) ( ON ?auto_859857 ?auto_859858 ) ( CLEAR ?auto_859857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_859851 ?auto_859852 ?auto_859853 ?auto_859854 ?auto_859855 ?auto_859856 ?auto_859857 )
      ( MAKE-16PILE ?auto_859851 ?auto_859852 ?auto_859853 ?auto_859854 ?auto_859855 ?auto_859856 ?auto_859857 ?auto_859858 ?auto_859859 ?auto_859860 ?auto_859861 ?auto_859862 ?auto_859863 ?auto_859864 ?auto_859865 ?auto_859866 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_859917 - BLOCK
      ?auto_859918 - BLOCK
      ?auto_859919 - BLOCK
      ?auto_859920 - BLOCK
      ?auto_859921 - BLOCK
      ?auto_859922 - BLOCK
      ?auto_859923 - BLOCK
      ?auto_859924 - BLOCK
      ?auto_859925 - BLOCK
      ?auto_859926 - BLOCK
      ?auto_859927 - BLOCK
      ?auto_859928 - BLOCK
      ?auto_859929 - BLOCK
      ?auto_859930 - BLOCK
      ?auto_859931 - BLOCK
      ?auto_859932 - BLOCK
    )
    :vars
    (
      ?auto_859933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859932 ?auto_859933 ) ( ON-TABLE ?auto_859917 ) ( ON ?auto_859918 ?auto_859917 ) ( ON ?auto_859919 ?auto_859918 ) ( ON ?auto_859920 ?auto_859919 ) ( ON ?auto_859921 ?auto_859920 ) ( not ( = ?auto_859917 ?auto_859918 ) ) ( not ( = ?auto_859917 ?auto_859919 ) ) ( not ( = ?auto_859917 ?auto_859920 ) ) ( not ( = ?auto_859917 ?auto_859921 ) ) ( not ( = ?auto_859917 ?auto_859922 ) ) ( not ( = ?auto_859917 ?auto_859923 ) ) ( not ( = ?auto_859917 ?auto_859924 ) ) ( not ( = ?auto_859917 ?auto_859925 ) ) ( not ( = ?auto_859917 ?auto_859926 ) ) ( not ( = ?auto_859917 ?auto_859927 ) ) ( not ( = ?auto_859917 ?auto_859928 ) ) ( not ( = ?auto_859917 ?auto_859929 ) ) ( not ( = ?auto_859917 ?auto_859930 ) ) ( not ( = ?auto_859917 ?auto_859931 ) ) ( not ( = ?auto_859917 ?auto_859932 ) ) ( not ( = ?auto_859917 ?auto_859933 ) ) ( not ( = ?auto_859918 ?auto_859919 ) ) ( not ( = ?auto_859918 ?auto_859920 ) ) ( not ( = ?auto_859918 ?auto_859921 ) ) ( not ( = ?auto_859918 ?auto_859922 ) ) ( not ( = ?auto_859918 ?auto_859923 ) ) ( not ( = ?auto_859918 ?auto_859924 ) ) ( not ( = ?auto_859918 ?auto_859925 ) ) ( not ( = ?auto_859918 ?auto_859926 ) ) ( not ( = ?auto_859918 ?auto_859927 ) ) ( not ( = ?auto_859918 ?auto_859928 ) ) ( not ( = ?auto_859918 ?auto_859929 ) ) ( not ( = ?auto_859918 ?auto_859930 ) ) ( not ( = ?auto_859918 ?auto_859931 ) ) ( not ( = ?auto_859918 ?auto_859932 ) ) ( not ( = ?auto_859918 ?auto_859933 ) ) ( not ( = ?auto_859919 ?auto_859920 ) ) ( not ( = ?auto_859919 ?auto_859921 ) ) ( not ( = ?auto_859919 ?auto_859922 ) ) ( not ( = ?auto_859919 ?auto_859923 ) ) ( not ( = ?auto_859919 ?auto_859924 ) ) ( not ( = ?auto_859919 ?auto_859925 ) ) ( not ( = ?auto_859919 ?auto_859926 ) ) ( not ( = ?auto_859919 ?auto_859927 ) ) ( not ( = ?auto_859919 ?auto_859928 ) ) ( not ( = ?auto_859919 ?auto_859929 ) ) ( not ( = ?auto_859919 ?auto_859930 ) ) ( not ( = ?auto_859919 ?auto_859931 ) ) ( not ( = ?auto_859919 ?auto_859932 ) ) ( not ( = ?auto_859919 ?auto_859933 ) ) ( not ( = ?auto_859920 ?auto_859921 ) ) ( not ( = ?auto_859920 ?auto_859922 ) ) ( not ( = ?auto_859920 ?auto_859923 ) ) ( not ( = ?auto_859920 ?auto_859924 ) ) ( not ( = ?auto_859920 ?auto_859925 ) ) ( not ( = ?auto_859920 ?auto_859926 ) ) ( not ( = ?auto_859920 ?auto_859927 ) ) ( not ( = ?auto_859920 ?auto_859928 ) ) ( not ( = ?auto_859920 ?auto_859929 ) ) ( not ( = ?auto_859920 ?auto_859930 ) ) ( not ( = ?auto_859920 ?auto_859931 ) ) ( not ( = ?auto_859920 ?auto_859932 ) ) ( not ( = ?auto_859920 ?auto_859933 ) ) ( not ( = ?auto_859921 ?auto_859922 ) ) ( not ( = ?auto_859921 ?auto_859923 ) ) ( not ( = ?auto_859921 ?auto_859924 ) ) ( not ( = ?auto_859921 ?auto_859925 ) ) ( not ( = ?auto_859921 ?auto_859926 ) ) ( not ( = ?auto_859921 ?auto_859927 ) ) ( not ( = ?auto_859921 ?auto_859928 ) ) ( not ( = ?auto_859921 ?auto_859929 ) ) ( not ( = ?auto_859921 ?auto_859930 ) ) ( not ( = ?auto_859921 ?auto_859931 ) ) ( not ( = ?auto_859921 ?auto_859932 ) ) ( not ( = ?auto_859921 ?auto_859933 ) ) ( not ( = ?auto_859922 ?auto_859923 ) ) ( not ( = ?auto_859922 ?auto_859924 ) ) ( not ( = ?auto_859922 ?auto_859925 ) ) ( not ( = ?auto_859922 ?auto_859926 ) ) ( not ( = ?auto_859922 ?auto_859927 ) ) ( not ( = ?auto_859922 ?auto_859928 ) ) ( not ( = ?auto_859922 ?auto_859929 ) ) ( not ( = ?auto_859922 ?auto_859930 ) ) ( not ( = ?auto_859922 ?auto_859931 ) ) ( not ( = ?auto_859922 ?auto_859932 ) ) ( not ( = ?auto_859922 ?auto_859933 ) ) ( not ( = ?auto_859923 ?auto_859924 ) ) ( not ( = ?auto_859923 ?auto_859925 ) ) ( not ( = ?auto_859923 ?auto_859926 ) ) ( not ( = ?auto_859923 ?auto_859927 ) ) ( not ( = ?auto_859923 ?auto_859928 ) ) ( not ( = ?auto_859923 ?auto_859929 ) ) ( not ( = ?auto_859923 ?auto_859930 ) ) ( not ( = ?auto_859923 ?auto_859931 ) ) ( not ( = ?auto_859923 ?auto_859932 ) ) ( not ( = ?auto_859923 ?auto_859933 ) ) ( not ( = ?auto_859924 ?auto_859925 ) ) ( not ( = ?auto_859924 ?auto_859926 ) ) ( not ( = ?auto_859924 ?auto_859927 ) ) ( not ( = ?auto_859924 ?auto_859928 ) ) ( not ( = ?auto_859924 ?auto_859929 ) ) ( not ( = ?auto_859924 ?auto_859930 ) ) ( not ( = ?auto_859924 ?auto_859931 ) ) ( not ( = ?auto_859924 ?auto_859932 ) ) ( not ( = ?auto_859924 ?auto_859933 ) ) ( not ( = ?auto_859925 ?auto_859926 ) ) ( not ( = ?auto_859925 ?auto_859927 ) ) ( not ( = ?auto_859925 ?auto_859928 ) ) ( not ( = ?auto_859925 ?auto_859929 ) ) ( not ( = ?auto_859925 ?auto_859930 ) ) ( not ( = ?auto_859925 ?auto_859931 ) ) ( not ( = ?auto_859925 ?auto_859932 ) ) ( not ( = ?auto_859925 ?auto_859933 ) ) ( not ( = ?auto_859926 ?auto_859927 ) ) ( not ( = ?auto_859926 ?auto_859928 ) ) ( not ( = ?auto_859926 ?auto_859929 ) ) ( not ( = ?auto_859926 ?auto_859930 ) ) ( not ( = ?auto_859926 ?auto_859931 ) ) ( not ( = ?auto_859926 ?auto_859932 ) ) ( not ( = ?auto_859926 ?auto_859933 ) ) ( not ( = ?auto_859927 ?auto_859928 ) ) ( not ( = ?auto_859927 ?auto_859929 ) ) ( not ( = ?auto_859927 ?auto_859930 ) ) ( not ( = ?auto_859927 ?auto_859931 ) ) ( not ( = ?auto_859927 ?auto_859932 ) ) ( not ( = ?auto_859927 ?auto_859933 ) ) ( not ( = ?auto_859928 ?auto_859929 ) ) ( not ( = ?auto_859928 ?auto_859930 ) ) ( not ( = ?auto_859928 ?auto_859931 ) ) ( not ( = ?auto_859928 ?auto_859932 ) ) ( not ( = ?auto_859928 ?auto_859933 ) ) ( not ( = ?auto_859929 ?auto_859930 ) ) ( not ( = ?auto_859929 ?auto_859931 ) ) ( not ( = ?auto_859929 ?auto_859932 ) ) ( not ( = ?auto_859929 ?auto_859933 ) ) ( not ( = ?auto_859930 ?auto_859931 ) ) ( not ( = ?auto_859930 ?auto_859932 ) ) ( not ( = ?auto_859930 ?auto_859933 ) ) ( not ( = ?auto_859931 ?auto_859932 ) ) ( not ( = ?auto_859931 ?auto_859933 ) ) ( not ( = ?auto_859932 ?auto_859933 ) ) ( ON ?auto_859931 ?auto_859932 ) ( ON ?auto_859930 ?auto_859931 ) ( ON ?auto_859929 ?auto_859930 ) ( ON ?auto_859928 ?auto_859929 ) ( ON ?auto_859927 ?auto_859928 ) ( ON ?auto_859926 ?auto_859927 ) ( ON ?auto_859925 ?auto_859926 ) ( ON ?auto_859924 ?auto_859925 ) ( ON ?auto_859923 ?auto_859924 ) ( CLEAR ?auto_859921 ) ( ON ?auto_859922 ?auto_859923 ) ( CLEAR ?auto_859922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_859917 ?auto_859918 ?auto_859919 ?auto_859920 ?auto_859921 ?auto_859922 )
      ( MAKE-16PILE ?auto_859917 ?auto_859918 ?auto_859919 ?auto_859920 ?auto_859921 ?auto_859922 ?auto_859923 ?auto_859924 ?auto_859925 ?auto_859926 ?auto_859927 ?auto_859928 ?auto_859929 ?auto_859930 ?auto_859931 ?auto_859932 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_859983 - BLOCK
      ?auto_859984 - BLOCK
      ?auto_859985 - BLOCK
      ?auto_859986 - BLOCK
      ?auto_859987 - BLOCK
      ?auto_859988 - BLOCK
      ?auto_859989 - BLOCK
      ?auto_859990 - BLOCK
      ?auto_859991 - BLOCK
      ?auto_859992 - BLOCK
      ?auto_859993 - BLOCK
      ?auto_859994 - BLOCK
      ?auto_859995 - BLOCK
      ?auto_859996 - BLOCK
      ?auto_859997 - BLOCK
      ?auto_859998 - BLOCK
    )
    :vars
    (
      ?auto_859999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_859998 ?auto_859999 ) ( ON-TABLE ?auto_859983 ) ( ON ?auto_859984 ?auto_859983 ) ( ON ?auto_859985 ?auto_859984 ) ( ON ?auto_859986 ?auto_859985 ) ( not ( = ?auto_859983 ?auto_859984 ) ) ( not ( = ?auto_859983 ?auto_859985 ) ) ( not ( = ?auto_859983 ?auto_859986 ) ) ( not ( = ?auto_859983 ?auto_859987 ) ) ( not ( = ?auto_859983 ?auto_859988 ) ) ( not ( = ?auto_859983 ?auto_859989 ) ) ( not ( = ?auto_859983 ?auto_859990 ) ) ( not ( = ?auto_859983 ?auto_859991 ) ) ( not ( = ?auto_859983 ?auto_859992 ) ) ( not ( = ?auto_859983 ?auto_859993 ) ) ( not ( = ?auto_859983 ?auto_859994 ) ) ( not ( = ?auto_859983 ?auto_859995 ) ) ( not ( = ?auto_859983 ?auto_859996 ) ) ( not ( = ?auto_859983 ?auto_859997 ) ) ( not ( = ?auto_859983 ?auto_859998 ) ) ( not ( = ?auto_859983 ?auto_859999 ) ) ( not ( = ?auto_859984 ?auto_859985 ) ) ( not ( = ?auto_859984 ?auto_859986 ) ) ( not ( = ?auto_859984 ?auto_859987 ) ) ( not ( = ?auto_859984 ?auto_859988 ) ) ( not ( = ?auto_859984 ?auto_859989 ) ) ( not ( = ?auto_859984 ?auto_859990 ) ) ( not ( = ?auto_859984 ?auto_859991 ) ) ( not ( = ?auto_859984 ?auto_859992 ) ) ( not ( = ?auto_859984 ?auto_859993 ) ) ( not ( = ?auto_859984 ?auto_859994 ) ) ( not ( = ?auto_859984 ?auto_859995 ) ) ( not ( = ?auto_859984 ?auto_859996 ) ) ( not ( = ?auto_859984 ?auto_859997 ) ) ( not ( = ?auto_859984 ?auto_859998 ) ) ( not ( = ?auto_859984 ?auto_859999 ) ) ( not ( = ?auto_859985 ?auto_859986 ) ) ( not ( = ?auto_859985 ?auto_859987 ) ) ( not ( = ?auto_859985 ?auto_859988 ) ) ( not ( = ?auto_859985 ?auto_859989 ) ) ( not ( = ?auto_859985 ?auto_859990 ) ) ( not ( = ?auto_859985 ?auto_859991 ) ) ( not ( = ?auto_859985 ?auto_859992 ) ) ( not ( = ?auto_859985 ?auto_859993 ) ) ( not ( = ?auto_859985 ?auto_859994 ) ) ( not ( = ?auto_859985 ?auto_859995 ) ) ( not ( = ?auto_859985 ?auto_859996 ) ) ( not ( = ?auto_859985 ?auto_859997 ) ) ( not ( = ?auto_859985 ?auto_859998 ) ) ( not ( = ?auto_859985 ?auto_859999 ) ) ( not ( = ?auto_859986 ?auto_859987 ) ) ( not ( = ?auto_859986 ?auto_859988 ) ) ( not ( = ?auto_859986 ?auto_859989 ) ) ( not ( = ?auto_859986 ?auto_859990 ) ) ( not ( = ?auto_859986 ?auto_859991 ) ) ( not ( = ?auto_859986 ?auto_859992 ) ) ( not ( = ?auto_859986 ?auto_859993 ) ) ( not ( = ?auto_859986 ?auto_859994 ) ) ( not ( = ?auto_859986 ?auto_859995 ) ) ( not ( = ?auto_859986 ?auto_859996 ) ) ( not ( = ?auto_859986 ?auto_859997 ) ) ( not ( = ?auto_859986 ?auto_859998 ) ) ( not ( = ?auto_859986 ?auto_859999 ) ) ( not ( = ?auto_859987 ?auto_859988 ) ) ( not ( = ?auto_859987 ?auto_859989 ) ) ( not ( = ?auto_859987 ?auto_859990 ) ) ( not ( = ?auto_859987 ?auto_859991 ) ) ( not ( = ?auto_859987 ?auto_859992 ) ) ( not ( = ?auto_859987 ?auto_859993 ) ) ( not ( = ?auto_859987 ?auto_859994 ) ) ( not ( = ?auto_859987 ?auto_859995 ) ) ( not ( = ?auto_859987 ?auto_859996 ) ) ( not ( = ?auto_859987 ?auto_859997 ) ) ( not ( = ?auto_859987 ?auto_859998 ) ) ( not ( = ?auto_859987 ?auto_859999 ) ) ( not ( = ?auto_859988 ?auto_859989 ) ) ( not ( = ?auto_859988 ?auto_859990 ) ) ( not ( = ?auto_859988 ?auto_859991 ) ) ( not ( = ?auto_859988 ?auto_859992 ) ) ( not ( = ?auto_859988 ?auto_859993 ) ) ( not ( = ?auto_859988 ?auto_859994 ) ) ( not ( = ?auto_859988 ?auto_859995 ) ) ( not ( = ?auto_859988 ?auto_859996 ) ) ( not ( = ?auto_859988 ?auto_859997 ) ) ( not ( = ?auto_859988 ?auto_859998 ) ) ( not ( = ?auto_859988 ?auto_859999 ) ) ( not ( = ?auto_859989 ?auto_859990 ) ) ( not ( = ?auto_859989 ?auto_859991 ) ) ( not ( = ?auto_859989 ?auto_859992 ) ) ( not ( = ?auto_859989 ?auto_859993 ) ) ( not ( = ?auto_859989 ?auto_859994 ) ) ( not ( = ?auto_859989 ?auto_859995 ) ) ( not ( = ?auto_859989 ?auto_859996 ) ) ( not ( = ?auto_859989 ?auto_859997 ) ) ( not ( = ?auto_859989 ?auto_859998 ) ) ( not ( = ?auto_859989 ?auto_859999 ) ) ( not ( = ?auto_859990 ?auto_859991 ) ) ( not ( = ?auto_859990 ?auto_859992 ) ) ( not ( = ?auto_859990 ?auto_859993 ) ) ( not ( = ?auto_859990 ?auto_859994 ) ) ( not ( = ?auto_859990 ?auto_859995 ) ) ( not ( = ?auto_859990 ?auto_859996 ) ) ( not ( = ?auto_859990 ?auto_859997 ) ) ( not ( = ?auto_859990 ?auto_859998 ) ) ( not ( = ?auto_859990 ?auto_859999 ) ) ( not ( = ?auto_859991 ?auto_859992 ) ) ( not ( = ?auto_859991 ?auto_859993 ) ) ( not ( = ?auto_859991 ?auto_859994 ) ) ( not ( = ?auto_859991 ?auto_859995 ) ) ( not ( = ?auto_859991 ?auto_859996 ) ) ( not ( = ?auto_859991 ?auto_859997 ) ) ( not ( = ?auto_859991 ?auto_859998 ) ) ( not ( = ?auto_859991 ?auto_859999 ) ) ( not ( = ?auto_859992 ?auto_859993 ) ) ( not ( = ?auto_859992 ?auto_859994 ) ) ( not ( = ?auto_859992 ?auto_859995 ) ) ( not ( = ?auto_859992 ?auto_859996 ) ) ( not ( = ?auto_859992 ?auto_859997 ) ) ( not ( = ?auto_859992 ?auto_859998 ) ) ( not ( = ?auto_859992 ?auto_859999 ) ) ( not ( = ?auto_859993 ?auto_859994 ) ) ( not ( = ?auto_859993 ?auto_859995 ) ) ( not ( = ?auto_859993 ?auto_859996 ) ) ( not ( = ?auto_859993 ?auto_859997 ) ) ( not ( = ?auto_859993 ?auto_859998 ) ) ( not ( = ?auto_859993 ?auto_859999 ) ) ( not ( = ?auto_859994 ?auto_859995 ) ) ( not ( = ?auto_859994 ?auto_859996 ) ) ( not ( = ?auto_859994 ?auto_859997 ) ) ( not ( = ?auto_859994 ?auto_859998 ) ) ( not ( = ?auto_859994 ?auto_859999 ) ) ( not ( = ?auto_859995 ?auto_859996 ) ) ( not ( = ?auto_859995 ?auto_859997 ) ) ( not ( = ?auto_859995 ?auto_859998 ) ) ( not ( = ?auto_859995 ?auto_859999 ) ) ( not ( = ?auto_859996 ?auto_859997 ) ) ( not ( = ?auto_859996 ?auto_859998 ) ) ( not ( = ?auto_859996 ?auto_859999 ) ) ( not ( = ?auto_859997 ?auto_859998 ) ) ( not ( = ?auto_859997 ?auto_859999 ) ) ( not ( = ?auto_859998 ?auto_859999 ) ) ( ON ?auto_859997 ?auto_859998 ) ( ON ?auto_859996 ?auto_859997 ) ( ON ?auto_859995 ?auto_859996 ) ( ON ?auto_859994 ?auto_859995 ) ( ON ?auto_859993 ?auto_859994 ) ( ON ?auto_859992 ?auto_859993 ) ( ON ?auto_859991 ?auto_859992 ) ( ON ?auto_859990 ?auto_859991 ) ( ON ?auto_859989 ?auto_859990 ) ( ON ?auto_859988 ?auto_859989 ) ( CLEAR ?auto_859986 ) ( ON ?auto_859987 ?auto_859988 ) ( CLEAR ?auto_859987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_859983 ?auto_859984 ?auto_859985 ?auto_859986 ?auto_859987 )
      ( MAKE-16PILE ?auto_859983 ?auto_859984 ?auto_859985 ?auto_859986 ?auto_859987 ?auto_859988 ?auto_859989 ?auto_859990 ?auto_859991 ?auto_859992 ?auto_859993 ?auto_859994 ?auto_859995 ?auto_859996 ?auto_859997 ?auto_859998 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_860049 - BLOCK
      ?auto_860050 - BLOCK
      ?auto_860051 - BLOCK
      ?auto_860052 - BLOCK
      ?auto_860053 - BLOCK
      ?auto_860054 - BLOCK
      ?auto_860055 - BLOCK
      ?auto_860056 - BLOCK
      ?auto_860057 - BLOCK
      ?auto_860058 - BLOCK
      ?auto_860059 - BLOCK
      ?auto_860060 - BLOCK
      ?auto_860061 - BLOCK
      ?auto_860062 - BLOCK
      ?auto_860063 - BLOCK
      ?auto_860064 - BLOCK
    )
    :vars
    (
      ?auto_860065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_860064 ?auto_860065 ) ( ON-TABLE ?auto_860049 ) ( ON ?auto_860050 ?auto_860049 ) ( ON ?auto_860051 ?auto_860050 ) ( not ( = ?auto_860049 ?auto_860050 ) ) ( not ( = ?auto_860049 ?auto_860051 ) ) ( not ( = ?auto_860049 ?auto_860052 ) ) ( not ( = ?auto_860049 ?auto_860053 ) ) ( not ( = ?auto_860049 ?auto_860054 ) ) ( not ( = ?auto_860049 ?auto_860055 ) ) ( not ( = ?auto_860049 ?auto_860056 ) ) ( not ( = ?auto_860049 ?auto_860057 ) ) ( not ( = ?auto_860049 ?auto_860058 ) ) ( not ( = ?auto_860049 ?auto_860059 ) ) ( not ( = ?auto_860049 ?auto_860060 ) ) ( not ( = ?auto_860049 ?auto_860061 ) ) ( not ( = ?auto_860049 ?auto_860062 ) ) ( not ( = ?auto_860049 ?auto_860063 ) ) ( not ( = ?auto_860049 ?auto_860064 ) ) ( not ( = ?auto_860049 ?auto_860065 ) ) ( not ( = ?auto_860050 ?auto_860051 ) ) ( not ( = ?auto_860050 ?auto_860052 ) ) ( not ( = ?auto_860050 ?auto_860053 ) ) ( not ( = ?auto_860050 ?auto_860054 ) ) ( not ( = ?auto_860050 ?auto_860055 ) ) ( not ( = ?auto_860050 ?auto_860056 ) ) ( not ( = ?auto_860050 ?auto_860057 ) ) ( not ( = ?auto_860050 ?auto_860058 ) ) ( not ( = ?auto_860050 ?auto_860059 ) ) ( not ( = ?auto_860050 ?auto_860060 ) ) ( not ( = ?auto_860050 ?auto_860061 ) ) ( not ( = ?auto_860050 ?auto_860062 ) ) ( not ( = ?auto_860050 ?auto_860063 ) ) ( not ( = ?auto_860050 ?auto_860064 ) ) ( not ( = ?auto_860050 ?auto_860065 ) ) ( not ( = ?auto_860051 ?auto_860052 ) ) ( not ( = ?auto_860051 ?auto_860053 ) ) ( not ( = ?auto_860051 ?auto_860054 ) ) ( not ( = ?auto_860051 ?auto_860055 ) ) ( not ( = ?auto_860051 ?auto_860056 ) ) ( not ( = ?auto_860051 ?auto_860057 ) ) ( not ( = ?auto_860051 ?auto_860058 ) ) ( not ( = ?auto_860051 ?auto_860059 ) ) ( not ( = ?auto_860051 ?auto_860060 ) ) ( not ( = ?auto_860051 ?auto_860061 ) ) ( not ( = ?auto_860051 ?auto_860062 ) ) ( not ( = ?auto_860051 ?auto_860063 ) ) ( not ( = ?auto_860051 ?auto_860064 ) ) ( not ( = ?auto_860051 ?auto_860065 ) ) ( not ( = ?auto_860052 ?auto_860053 ) ) ( not ( = ?auto_860052 ?auto_860054 ) ) ( not ( = ?auto_860052 ?auto_860055 ) ) ( not ( = ?auto_860052 ?auto_860056 ) ) ( not ( = ?auto_860052 ?auto_860057 ) ) ( not ( = ?auto_860052 ?auto_860058 ) ) ( not ( = ?auto_860052 ?auto_860059 ) ) ( not ( = ?auto_860052 ?auto_860060 ) ) ( not ( = ?auto_860052 ?auto_860061 ) ) ( not ( = ?auto_860052 ?auto_860062 ) ) ( not ( = ?auto_860052 ?auto_860063 ) ) ( not ( = ?auto_860052 ?auto_860064 ) ) ( not ( = ?auto_860052 ?auto_860065 ) ) ( not ( = ?auto_860053 ?auto_860054 ) ) ( not ( = ?auto_860053 ?auto_860055 ) ) ( not ( = ?auto_860053 ?auto_860056 ) ) ( not ( = ?auto_860053 ?auto_860057 ) ) ( not ( = ?auto_860053 ?auto_860058 ) ) ( not ( = ?auto_860053 ?auto_860059 ) ) ( not ( = ?auto_860053 ?auto_860060 ) ) ( not ( = ?auto_860053 ?auto_860061 ) ) ( not ( = ?auto_860053 ?auto_860062 ) ) ( not ( = ?auto_860053 ?auto_860063 ) ) ( not ( = ?auto_860053 ?auto_860064 ) ) ( not ( = ?auto_860053 ?auto_860065 ) ) ( not ( = ?auto_860054 ?auto_860055 ) ) ( not ( = ?auto_860054 ?auto_860056 ) ) ( not ( = ?auto_860054 ?auto_860057 ) ) ( not ( = ?auto_860054 ?auto_860058 ) ) ( not ( = ?auto_860054 ?auto_860059 ) ) ( not ( = ?auto_860054 ?auto_860060 ) ) ( not ( = ?auto_860054 ?auto_860061 ) ) ( not ( = ?auto_860054 ?auto_860062 ) ) ( not ( = ?auto_860054 ?auto_860063 ) ) ( not ( = ?auto_860054 ?auto_860064 ) ) ( not ( = ?auto_860054 ?auto_860065 ) ) ( not ( = ?auto_860055 ?auto_860056 ) ) ( not ( = ?auto_860055 ?auto_860057 ) ) ( not ( = ?auto_860055 ?auto_860058 ) ) ( not ( = ?auto_860055 ?auto_860059 ) ) ( not ( = ?auto_860055 ?auto_860060 ) ) ( not ( = ?auto_860055 ?auto_860061 ) ) ( not ( = ?auto_860055 ?auto_860062 ) ) ( not ( = ?auto_860055 ?auto_860063 ) ) ( not ( = ?auto_860055 ?auto_860064 ) ) ( not ( = ?auto_860055 ?auto_860065 ) ) ( not ( = ?auto_860056 ?auto_860057 ) ) ( not ( = ?auto_860056 ?auto_860058 ) ) ( not ( = ?auto_860056 ?auto_860059 ) ) ( not ( = ?auto_860056 ?auto_860060 ) ) ( not ( = ?auto_860056 ?auto_860061 ) ) ( not ( = ?auto_860056 ?auto_860062 ) ) ( not ( = ?auto_860056 ?auto_860063 ) ) ( not ( = ?auto_860056 ?auto_860064 ) ) ( not ( = ?auto_860056 ?auto_860065 ) ) ( not ( = ?auto_860057 ?auto_860058 ) ) ( not ( = ?auto_860057 ?auto_860059 ) ) ( not ( = ?auto_860057 ?auto_860060 ) ) ( not ( = ?auto_860057 ?auto_860061 ) ) ( not ( = ?auto_860057 ?auto_860062 ) ) ( not ( = ?auto_860057 ?auto_860063 ) ) ( not ( = ?auto_860057 ?auto_860064 ) ) ( not ( = ?auto_860057 ?auto_860065 ) ) ( not ( = ?auto_860058 ?auto_860059 ) ) ( not ( = ?auto_860058 ?auto_860060 ) ) ( not ( = ?auto_860058 ?auto_860061 ) ) ( not ( = ?auto_860058 ?auto_860062 ) ) ( not ( = ?auto_860058 ?auto_860063 ) ) ( not ( = ?auto_860058 ?auto_860064 ) ) ( not ( = ?auto_860058 ?auto_860065 ) ) ( not ( = ?auto_860059 ?auto_860060 ) ) ( not ( = ?auto_860059 ?auto_860061 ) ) ( not ( = ?auto_860059 ?auto_860062 ) ) ( not ( = ?auto_860059 ?auto_860063 ) ) ( not ( = ?auto_860059 ?auto_860064 ) ) ( not ( = ?auto_860059 ?auto_860065 ) ) ( not ( = ?auto_860060 ?auto_860061 ) ) ( not ( = ?auto_860060 ?auto_860062 ) ) ( not ( = ?auto_860060 ?auto_860063 ) ) ( not ( = ?auto_860060 ?auto_860064 ) ) ( not ( = ?auto_860060 ?auto_860065 ) ) ( not ( = ?auto_860061 ?auto_860062 ) ) ( not ( = ?auto_860061 ?auto_860063 ) ) ( not ( = ?auto_860061 ?auto_860064 ) ) ( not ( = ?auto_860061 ?auto_860065 ) ) ( not ( = ?auto_860062 ?auto_860063 ) ) ( not ( = ?auto_860062 ?auto_860064 ) ) ( not ( = ?auto_860062 ?auto_860065 ) ) ( not ( = ?auto_860063 ?auto_860064 ) ) ( not ( = ?auto_860063 ?auto_860065 ) ) ( not ( = ?auto_860064 ?auto_860065 ) ) ( ON ?auto_860063 ?auto_860064 ) ( ON ?auto_860062 ?auto_860063 ) ( ON ?auto_860061 ?auto_860062 ) ( ON ?auto_860060 ?auto_860061 ) ( ON ?auto_860059 ?auto_860060 ) ( ON ?auto_860058 ?auto_860059 ) ( ON ?auto_860057 ?auto_860058 ) ( ON ?auto_860056 ?auto_860057 ) ( ON ?auto_860055 ?auto_860056 ) ( ON ?auto_860054 ?auto_860055 ) ( ON ?auto_860053 ?auto_860054 ) ( CLEAR ?auto_860051 ) ( ON ?auto_860052 ?auto_860053 ) ( CLEAR ?auto_860052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_860049 ?auto_860050 ?auto_860051 ?auto_860052 )
      ( MAKE-16PILE ?auto_860049 ?auto_860050 ?auto_860051 ?auto_860052 ?auto_860053 ?auto_860054 ?auto_860055 ?auto_860056 ?auto_860057 ?auto_860058 ?auto_860059 ?auto_860060 ?auto_860061 ?auto_860062 ?auto_860063 ?auto_860064 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_860115 - BLOCK
      ?auto_860116 - BLOCK
      ?auto_860117 - BLOCK
      ?auto_860118 - BLOCK
      ?auto_860119 - BLOCK
      ?auto_860120 - BLOCK
      ?auto_860121 - BLOCK
      ?auto_860122 - BLOCK
      ?auto_860123 - BLOCK
      ?auto_860124 - BLOCK
      ?auto_860125 - BLOCK
      ?auto_860126 - BLOCK
      ?auto_860127 - BLOCK
      ?auto_860128 - BLOCK
      ?auto_860129 - BLOCK
      ?auto_860130 - BLOCK
    )
    :vars
    (
      ?auto_860131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_860130 ?auto_860131 ) ( ON-TABLE ?auto_860115 ) ( ON ?auto_860116 ?auto_860115 ) ( not ( = ?auto_860115 ?auto_860116 ) ) ( not ( = ?auto_860115 ?auto_860117 ) ) ( not ( = ?auto_860115 ?auto_860118 ) ) ( not ( = ?auto_860115 ?auto_860119 ) ) ( not ( = ?auto_860115 ?auto_860120 ) ) ( not ( = ?auto_860115 ?auto_860121 ) ) ( not ( = ?auto_860115 ?auto_860122 ) ) ( not ( = ?auto_860115 ?auto_860123 ) ) ( not ( = ?auto_860115 ?auto_860124 ) ) ( not ( = ?auto_860115 ?auto_860125 ) ) ( not ( = ?auto_860115 ?auto_860126 ) ) ( not ( = ?auto_860115 ?auto_860127 ) ) ( not ( = ?auto_860115 ?auto_860128 ) ) ( not ( = ?auto_860115 ?auto_860129 ) ) ( not ( = ?auto_860115 ?auto_860130 ) ) ( not ( = ?auto_860115 ?auto_860131 ) ) ( not ( = ?auto_860116 ?auto_860117 ) ) ( not ( = ?auto_860116 ?auto_860118 ) ) ( not ( = ?auto_860116 ?auto_860119 ) ) ( not ( = ?auto_860116 ?auto_860120 ) ) ( not ( = ?auto_860116 ?auto_860121 ) ) ( not ( = ?auto_860116 ?auto_860122 ) ) ( not ( = ?auto_860116 ?auto_860123 ) ) ( not ( = ?auto_860116 ?auto_860124 ) ) ( not ( = ?auto_860116 ?auto_860125 ) ) ( not ( = ?auto_860116 ?auto_860126 ) ) ( not ( = ?auto_860116 ?auto_860127 ) ) ( not ( = ?auto_860116 ?auto_860128 ) ) ( not ( = ?auto_860116 ?auto_860129 ) ) ( not ( = ?auto_860116 ?auto_860130 ) ) ( not ( = ?auto_860116 ?auto_860131 ) ) ( not ( = ?auto_860117 ?auto_860118 ) ) ( not ( = ?auto_860117 ?auto_860119 ) ) ( not ( = ?auto_860117 ?auto_860120 ) ) ( not ( = ?auto_860117 ?auto_860121 ) ) ( not ( = ?auto_860117 ?auto_860122 ) ) ( not ( = ?auto_860117 ?auto_860123 ) ) ( not ( = ?auto_860117 ?auto_860124 ) ) ( not ( = ?auto_860117 ?auto_860125 ) ) ( not ( = ?auto_860117 ?auto_860126 ) ) ( not ( = ?auto_860117 ?auto_860127 ) ) ( not ( = ?auto_860117 ?auto_860128 ) ) ( not ( = ?auto_860117 ?auto_860129 ) ) ( not ( = ?auto_860117 ?auto_860130 ) ) ( not ( = ?auto_860117 ?auto_860131 ) ) ( not ( = ?auto_860118 ?auto_860119 ) ) ( not ( = ?auto_860118 ?auto_860120 ) ) ( not ( = ?auto_860118 ?auto_860121 ) ) ( not ( = ?auto_860118 ?auto_860122 ) ) ( not ( = ?auto_860118 ?auto_860123 ) ) ( not ( = ?auto_860118 ?auto_860124 ) ) ( not ( = ?auto_860118 ?auto_860125 ) ) ( not ( = ?auto_860118 ?auto_860126 ) ) ( not ( = ?auto_860118 ?auto_860127 ) ) ( not ( = ?auto_860118 ?auto_860128 ) ) ( not ( = ?auto_860118 ?auto_860129 ) ) ( not ( = ?auto_860118 ?auto_860130 ) ) ( not ( = ?auto_860118 ?auto_860131 ) ) ( not ( = ?auto_860119 ?auto_860120 ) ) ( not ( = ?auto_860119 ?auto_860121 ) ) ( not ( = ?auto_860119 ?auto_860122 ) ) ( not ( = ?auto_860119 ?auto_860123 ) ) ( not ( = ?auto_860119 ?auto_860124 ) ) ( not ( = ?auto_860119 ?auto_860125 ) ) ( not ( = ?auto_860119 ?auto_860126 ) ) ( not ( = ?auto_860119 ?auto_860127 ) ) ( not ( = ?auto_860119 ?auto_860128 ) ) ( not ( = ?auto_860119 ?auto_860129 ) ) ( not ( = ?auto_860119 ?auto_860130 ) ) ( not ( = ?auto_860119 ?auto_860131 ) ) ( not ( = ?auto_860120 ?auto_860121 ) ) ( not ( = ?auto_860120 ?auto_860122 ) ) ( not ( = ?auto_860120 ?auto_860123 ) ) ( not ( = ?auto_860120 ?auto_860124 ) ) ( not ( = ?auto_860120 ?auto_860125 ) ) ( not ( = ?auto_860120 ?auto_860126 ) ) ( not ( = ?auto_860120 ?auto_860127 ) ) ( not ( = ?auto_860120 ?auto_860128 ) ) ( not ( = ?auto_860120 ?auto_860129 ) ) ( not ( = ?auto_860120 ?auto_860130 ) ) ( not ( = ?auto_860120 ?auto_860131 ) ) ( not ( = ?auto_860121 ?auto_860122 ) ) ( not ( = ?auto_860121 ?auto_860123 ) ) ( not ( = ?auto_860121 ?auto_860124 ) ) ( not ( = ?auto_860121 ?auto_860125 ) ) ( not ( = ?auto_860121 ?auto_860126 ) ) ( not ( = ?auto_860121 ?auto_860127 ) ) ( not ( = ?auto_860121 ?auto_860128 ) ) ( not ( = ?auto_860121 ?auto_860129 ) ) ( not ( = ?auto_860121 ?auto_860130 ) ) ( not ( = ?auto_860121 ?auto_860131 ) ) ( not ( = ?auto_860122 ?auto_860123 ) ) ( not ( = ?auto_860122 ?auto_860124 ) ) ( not ( = ?auto_860122 ?auto_860125 ) ) ( not ( = ?auto_860122 ?auto_860126 ) ) ( not ( = ?auto_860122 ?auto_860127 ) ) ( not ( = ?auto_860122 ?auto_860128 ) ) ( not ( = ?auto_860122 ?auto_860129 ) ) ( not ( = ?auto_860122 ?auto_860130 ) ) ( not ( = ?auto_860122 ?auto_860131 ) ) ( not ( = ?auto_860123 ?auto_860124 ) ) ( not ( = ?auto_860123 ?auto_860125 ) ) ( not ( = ?auto_860123 ?auto_860126 ) ) ( not ( = ?auto_860123 ?auto_860127 ) ) ( not ( = ?auto_860123 ?auto_860128 ) ) ( not ( = ?auto_860123 ?auto_860129 ) ) ( not ( = ?auto_860123 ?auto_860130 ) ) ( not ( = ?auto_860123 ?auto_860131 ) ) ( not ( = ?auto_860124 ?auto_860125 ) ) ( not ( = ?auto_860124 ?auto_860126 ) ) ( not ( = ?auto_860124 ?auto_860127 ) ) ( not ( = ?auto_860124 ?auto_860128 ) ) ( not ( = ?auto_860124 ?auto_860129 ) ) ( not ( = ?auto_860124 ?auto_860130 ) ) ( not ( = ?auto_860124 ?auto_860131 ) ) ( not ( = ?auto_860125 ?auto_860126 ) ) ( not ( = ?auto_860125 ?auto_860127 ) ) ( not ( = ?auto_860125 ?auto_860128 ) ) ( not ( = ?auto_860125 ?auto_860129 ) ) ( not ( = ?auto_860125 ?auto_860130 ) ) ( not ( = ?auto_860125 ?auto_860131 ) ) ( not ( = ?auto_860126 ?auto_860127 ) ) ( not ( = ?auto_860126 ?auto_860128 ) ) ( not ( = ?auto_860126 ?auto_860129 ) ) ( not ( = ?auto_860126 ?auto_860130 ) ) ( not ( = ?auto_860126 ?auto_860131 ) ) ( not ( = ?auto_860127 ?auto_860128 ) ) ( not ( = ?auto_860127 ?auto_860129 ) ) ( not ( = ?auto_860127 ?auto_860130 ) ) ( not ( = ?auto_860127 ?auto_860131 ) ) ( not ( = ?auto_860128 ?auto_860129 ) ) ( not ( = ?auto_860128 ?auto_860130 ) ) ( not ( = ?auto_860128 ?auto_860131 ) ) ( not ( = ?auto_860129 ?auto_860130 ) ) ( not ( = ?auto_860129 ?auto_860131 ) ) ( not ( = ?auto_860130 ?auto_860131 ) ) ( ON ?auto_860129 ?auto_860130 ) ( ON ?auto_860128 ?auto_860129 ) ( ON ?auto_860127 ?auto_860128 ) ( ON ?auto_860126 ?auto_860127 ) ( ON ?auto_860125 ?auto_860126 ) ( ON ?auto_860124 ?auto_860125 ) ( ON ?auto_860123 ?auto_860124 ) ( ON ?auto_860122 ?auto_860123 ) ( ON ?auto_860121 ?auto_860122 ) ( ON ?auto_860120 ?auto_860121 ) ( ON ?auto_860119 ?auto_860120 ) ( ON ?auto_860118 ?auto_860119 ) ( CLEAR ?auto_860116 ) ( ON ?auto_860117 ?auto_860118 ) ( CLEAR ?auto_860117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_860115 ?auto_860116 ?auto_860117 )
      ( MAKE-16PILE ?auto_860115 ?auto_860116 ?auto_860117 ?auto_860118 ?auto_860119 ?auto_860120 ?auto_860121 ?auto_860122 ?auto_860123 ?auto_860124 ?auto_860125 ?auto_860126 ?auto_860127 ?auto_860128 ?auto_860129 ?auto_860130 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_860181 - BLOCK
      ?auto_860182 - BLOCK
      ?auto_860183 - BLOCK
      ?auto_860184 - BLOCK
      ?auto_860185 - BLOCK
      ?auto_860186 - BLOCK
      ?auto_860187 - BLOCK
      ?auto_860188 - BLOCK
      ?auto_860189 - BLOCK
      ?auto_860190 - BLOCK
      ?auto_860191 - BLOCK
      ?auto_860192 - BLOCK
      ?auto_860193 - BLOCK
      ?auto_860194 - BLOCK
      ?auto_860195 - BLOCK
      ?auto_860196 - BLOCK
    )
    :vars
    (
      ?auto_860197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_860196 ?auto_860197 ) ( ON-TABLE ?auto_860181 ) ( not ( = ?auto_860181 ?auto_860182 ) ) ( not ( = ?auto_860181 ?auto_860183 ) ) ( not ( = ?auto_860181 ?auto_860184 ) ) ( not ( = ?auto_860181 ?auto_860185 ) ) ( not ( = ?auto_860181 ?auto_860186 ) ) ( not ( = ?auto_860181 ?auto_860187 ) ) ( not ( = ?auto_860181 ?auto_860188 ) ) ( not ( = ?auto_860181 ?auto_860189 ) ) ( not ( = ?auto_860181 ?auto_860190 ) ) ( not ( = ?auto_860181 ?auto_860191 ) ) ( not ( = ?auto_860181 ?auto_860192 ) ) ( not ( = ?auto_860181 ?auto_860193 ) ) ( not ( = ?auto_860181 ?auto_860194 ) ) ( not ( = ?auto_860181 ?auto_860195 ) ) ( not ( = ?auto_860181 ?auto_860196 ) ) ( not ( = ?auto_860181 ?auto_860197 ) ) ( not ( = ?auto_860182 ?auto_860183 ) ) ( not ( = ?auto_860182 ?auto_860184 ) ) ( not ( = ?auto_860182 ?auto_860185 ) ) ( not ( = ?auto_860182 ?auto_860186 ) ) ( not ( = ?auto_860182 ?auto_860187 ) ) ( not ( = ?auto_860182 ?auto_860188 ) ) ( not ( = ?auto_860182 ?auto_860189 ) ) ( not ( = ?auto_860182 ?auto_860190 ) ) ( not ( = ?auto_860182 ?auto_860191 ) ) ( not ( = ?auto_860182 ?auto_860192 ) ) ( not ( = ?auto_860182 ?auto_860193 ) ) ( not ( = ?auto_860182 ?auto_860194 ) ) ( not ( = ?auto_860182 ?auto_860195 ) ) ( not ( = ?auto_860182 ?auto_860196 ) ) ( not ( = ?auto_860182 ?auto_860197 ) ) ( not ( = ?auto_860183 ?auto_860184 ) ) ( not ( = ?auto_860183 ?auto_860185 ) ) ( not ( = ?auto_860183 ?auto_860186 ) ) ( not ( = ?auto_860183 ?auto_860187 ) ) ( not ( = ?auto_860183 ?auto_860188 ) ) ( not ( = ?auto_860183 ?auto_860189 ) ) ( not ( = ?auto_860183 ?auto_860190 ) ) ( not ( = ?auto_860183 ?auto_860191 ) ) ( not ( = ?auto_860183 ?auto_860192 ) ) ( not ( = ?auto_860183 ?auto_860193 ) ) ( not ( = ?auto_860183 ?auto_860194 ) ) ( not ( = ?auto_860183 ?auto_860195 ) ) ( not ( = ?auto_860183 ?auto_860196 ) ) ( not ( = ?auto_860183 ?auto_860197 ) ) ( not ( = ?auto_860184 ?auto_860185 ) ) ( not ( = ?auto_860184 ?auto_860186 ) ) ( not ( = ?auto_860184 ?auto_860187 ) ) ( not ( = ?auto_860184 ?auto_860188 ) ) ( not ( = ?auto_860184 ?auto_860189 ) ) ( not ( = ?auto_860184 ?auto_860190 ) ) ( not ( = ?auto_860184 ?auto_860191 ) ) ( not ( = ?auto_860184 ?auto_860192 ) ) ( not ( = ?auto_860184 ?auto_860193 ) ) ( not ( = ?auto_860184 ?auto_860194 ) ) ( not ( = ?auto_860184 ?auto_860195 ) ) ( not ( = ?auto_860184 ?auto_860196 ) ) ( not ( = ?auto_860184 ?auto_860197 ) ) ( not ( = ?auto_860185 ?auto_860186 ) ) ( not ( = ?auto_860185 ?auto_860187 ) ) ( not ( = ?auto_860185 ?auto_860188 ) ) ( not ( = ?auto_860185 ?auto_860189 ) ) ( not ( = ?auto_860185 ?auto_860190 ) ) ( not ( = ?auto_860185 ?auto_860191 ) ) ( not ( = ?auto_860185 ?auto_860192 ) ) ( not ( = ?auto_860185 ?auto_860193 ) ) ( not ( = ?auto_860185 ?auto_860194 ) ) ( not ( = ?auto_860185 ?auto_860195 ) ) ( not ( = ?auto_860185 ?auto_860196 ) ) ( not ( = ?auto_860185 ?auto_860197 ) ) ( not ( = ?auto_860186 ?auto_860187 ) ) ( not ( = ?auto_860186 ?auto_860188 ) ) ( not ( = ?auto_860186 ?auto_860189 ) ) ( not ( = ?auto_860186 ?auto_860190 ) ) ( not ( = ?auto_860186 ?auto_860191 ) ) ( not ( = ?auto_860186 ?auto_860192 ) ) ( not ( = ?auto_860186 ?auto_860193 ) ) ( not ( = ?auto_860186 ?auto_860194 ) ) ( not ( = ?auto_860186 ?auto_860195 ) ) ( not ( = ?auto_860186 ?auto_860196 ) ) ( not ( = ?auto_860186 ?auto_860197 ) ) ( not ( = ?auto_860187 ?auto_860188 ) ) ( not ( = ?auto_860187 ?auto_860189 ) ) ( not ( = ?auto_860187 ?auto_860190 ) ) ( not ( = ?auto_860187 ?auto_860191 ) ) ( not ( = ?auto_860187 ?auto_860192 ) ) ( not ( = ?auto_860187 ?auto_860193 ) ) ( not ( = ?auto_860187 ?auto_860194 ) ) ( not ( = ?auto_860187 ?auto_860195 ) ) ( not ( = ?auto_860187 ?auto_860196 ) ) ( not ( = ?auto_860187 ?auto_860197 ) ) ( not ( = ?auto_860188 ?auto_860189 ) ) ( not ( = ?auto_860188 ?auto_860190 ) ) ( not ( = ?auto_860188 ?auto_860191 ) ) ( not ( = ?auto_860188 ?auto_860192 ) ) ( not ( = ?auto_860188 ?auto_860193 ) ) ( not ( = ?auto_860188 ?auto_860194 ) ) ( not ( = ?auto_860188 ?auto_860195 ) ) ( not ( = ?auto_860188 ?auto_860196 ) ) ( not ( = ?auto_860188 ?auto_860197 ) ) ( not ( = ?auto_860189 ?auto_860190 ) ) ( not ( = ?auto_860189 ?auto_860191 ) ) ( not ( = ?auto_860189 ?auto_860192 ) ) ( not ( = ?auto_860189 ?auto_860193 ) ) ( not ( = ?auto_860189 ?auto_860194 ) ) ( not ( = ?auto_860189 ?auto_860195 ) ) ( not ( = ?auto_860189 ?auto_860196 ) ) ( not ( = ?auto_860189 ?auto_860197 ) ) ( not ( = ?auto_860190 ?auto_860191 ) ) ( not ( = ?auto_860190 ?auto_860192 ) ) ( not ( = ?auto_860190 ?auto_860193 ) ) ( not ( = ?auto_860190 ?auto_860194 ) ) ( not ( = ?auto_860190 ?auto_860195 ) ) ( not ( = ?auto_860190 ?auto_860196 ) ) ( not ( = ?auto_860190 ?auto_860197 ) ) ( not ( = ?auto_860191 ?auto_860192 ) ) ( not ( = ?auto_860191 ?auto_860193 ) ) ( not ( = ?auto_860191 ?auto_860194 ) ) ( not ( = ?auto_860191 ?auto_860195 ) ) ( not ( = ?auto_860191 ?auto_860196 ) ) ( not ( = ?auto_860191 ?auto_860197 ) ) ( not ( = ?auto_860192 ?auto_860193 ) ) ( not ( = ?auto_860192 ?auto_860194 ) ) ( not ( = ?auto_860192 ?auto_860195 ) ) ( not ( = ?auto_860192 ?auto_860196 ) ) ( not ( = ?auto_860192 ?auto_860197 ) ) ( not ( = ?auto_860193 ?auto_860194 ) ) ( not ( = ?auto_860193 ?auto_860195 ) ) ( not ( = ?auto_860193 ?auto_860196 ) ) ( not ( = ?auto_860193 ?auto_860197 ) ) ( not ( = ?auto_860194 ?auto_860195 ) ) ( not ( = ?auto_860194 ?auto_860196 ) ) ( not ( = ?auto_860194 ?auto_860197 ) ) ( not ( = ?auto_860195 ?auto_860196 ) ) ( not ( = ?auto_860195 ?auto_860197 ) ) ( not ( = ?auto_860196 ?auto_860197 ) ) ( ON ?auto_860195 ?auto_860196 ) ( ON ?auto_860194 ?auto_860195 ) ( ON ?auto_860193 ?auto_860194 ) ( ON ?auto_860192 ?auto_860193 ) ( ON ?auto_860191 ?auto_860192 ) ( ON ?auto_860190 ?auto_860191 ) ( ON ?auto_860189 ?auto_860190 ) ( ON ?auto_860188 ?auto_860189 ) ( ON ?auto_860187 ?auto_860188 ) ( ON ?auto_860186 ?auto_860187 ) ( ON ?auto_860185 ?auto_860186 ) ( ON ?auto_860184 ?auto_860185 ) ( ON ?auto_860183 ?auto_860184 ) ( CLEAR ?auto_860181 ) ( ON ?auto_860182 ?auto_860183 ) ( CLEAR ?auto_860182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_860181 ?auto_860182 )
      ( MAKE-16PILE ?auto_860181 ?auto_860182 ?auto_860183 ?auto_860184 ?auto_860185 ?auto_860186 ?auto_860187 ?auto_860188 ?auto_860189 ?auto_860190 ?auto_860191 ?auto_860192 ?auto_860193 ?auto_860194 ?auto_860195 ?auto_860196 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_860247 - BLOCK
      ?auto_860248 - BLOCK
      ?auto_860249 - BLOCK
      ?auto_860250 - BLOCK
      ?auto_860251 - BLOCK
      ?auto_860252 - BLOCK
      ?auto_860253 - BLOCK
      ?auto_860254 - BLOCK
      ?auto_860255 - BLOCK
      ?auto_860256 - BLOCK
      ?auto_860257 - BLOCK
      ?auto_860258 - BLOCK
      ?auto_860259 - BLOCK
      ?auto_860260 - BLOCK
      ?auto_860261 - BLOCK
      ?auto_860262 - BLOCK
    )
    :vars
    (
      ?auto_860263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_860262 ?auto_860263 ) ( not ( = ?auto_860247 ?auto_860248 ) ) ( not ( = ?auto_860247 ?auto_860249 ) ) ( not ( = ?auto_860247 ?auto_860250 ) ) ( not ( = ?auto_860247 ?auto_860251 ) ) ( not ( = ?auto_860247 ?auto_860252 ) ) ( not ( = ?auto_860247 ?auto_860253 ) ) ( not ( = ?auto_860247 ?auto_860254 ) ) ( not ( = ?auto_860247 ?auto_860255 ) ) ( not ( = ?auto_860247 ?auto_860256 ) ) ( not ( = ?auto_860247 ?auto_860257 ) ) ( not ( = ?auto_860247 ?auto_860258 ) ) ( not ( = ?auto_860247 ?auto_860259 ) ) ( not ( = ?auto_860247 ?auto_860260 ) ) ( not ( = ?auto_860247 ?auto_860261 ) ) ( not ( = ?auto_860247 ?auto_860262 ) ) ( not ( = ?auto_860247 ?auto_860263 ) ) ( not ( = ?auto_860248 ?auto_860249 ) ) ( not ( = ?auto_860248 ?auto_860250 ) ) ( not ( = ?auto_860248 ?auto_860251 ) ) ( not ( = ?auto_860248 ?auto_860252 ) ) ( not ( = ?auto_860248 ?auto_860253 ) ) ( not ( = ?auto_860248 ?auto_860254 ) ) ( not ( = ?auto_860248 ?auto_860255 ) ) ( not ( = ?auto_860248 ?auto_860256 ) ) ( not ( = ?auto_860248 ?auto_860257 ) ) ( not ( = ?auto_860248 ?auto_860258 ) ) ( not ( = ?auto_860248 ?auto_860259 ) ) ( not ( = ?auto_860248 ?auto_860260 ) ) ( not ( = ?auto_860248 ?auto_860261 ) ) ( not ( = ?auto_860248 ?auto_860262 ) ) ( not ( = ?auto_860248 ?auto_860263 ) ) ( not ( = ?auto_860249 ?auto_860250 ) ) ( not ( = ?auto_860249 ?auto_860251 ) ) ( not ( = ?auto_860249 ?auto_860252 ) ) ( not ( = ?auto_860249 ?auto_860253 ) ) ( not ( = ?auto_860249 ?auto_860254 ) ) ( not ( = ?auto_860249 ?auto_860255 ) ) ( not ( = ?auto_860249 ?auto_860256 ) ) ( not ( = ?auto_860249 ?auto_860257 ) ) ( not ( = ?auto_860249 ?auto_860258 ) ) ( not ( = ?auto_860249 ?auto_860259 ) ) ( not ( = ?auto_860249 ?auto_860260 ) ) ( not ( = ?auto_860249 ?auto_860261 ) ) ( not ( = ?auto_860249 ?auto_860262 ) ) ( not ( = ?auto_860249 ?auto_860263 ) ) ( not ( = ?auto_860250 ?auto_860251 ) ) ( not ( = ?auto_860250 ?auto_860252 ) ) ( not ( = ?auto_860250 ?auto_860253 ) ) ( not ( = ?auto_860250 ?auto_860254 ) ) ( not ( = ?auto_860250 ?auto_860255 ) ) ( not ( = ?auto_860250 ?auto_860256 ) ) ( not ( = ?auto_860250 ?auto_860257 ) ) ( not ( = ?auto_860250 ?auto_860258 ) ) ( not ( = ?auto_860250 ?auto_860259 ) ) ( not ( = ?auto_860250 ?auto_860260 ) ) ( not ( = ?auto_860250 ?auto_860261 ) ) ( not ( = ?auto_860250 ?auto_860262 ) ) ( not ( = ?auto_860250 ?auto_860263 ) ) ( not ( = ?auto_860251 ?auto_860252 ) ) ( not ( = ?auto_860251 ?auto_860253 ) ) ( not ( = ?auto_860251 ?auto_860254 ) ) ( not ( = ?auto_860251 ?auto_860255 ) ) ( not ( = ?auto_860251 ?auto_860256 ) ) ( not ( = ?auto_860251 ?auto_860257 ) ) ( not ( = ?auto_860251 ?auto_860258 ) ) ( not ( = ?auto_860251 ?auto_860259 ) ) ( not ( = ?auto_860251 ?auto_860260 ) ) ( not ( = ?auto_860251 ?auto_860261 ) ) ( not ( = ?auto_860251 ?auto_860262 ) ) ( not ( = ?auto_860251 ?auto_860263 ) ) ( not ( = ?auto_860252 ?auto_860253 ) ) ( not ( = ?auto_860252 ?auto_860254 ) ) ( not ( = ?auto_860252 ?auto_860255 ) ) ( not ( = ?auto_860252 ?auto_860256 ) ) ( not ( = ?auto_860252 ?auto_860257 ) ) ( not ( = ?auto_860252 ?auto_860258 ) ) ( not ( = ?auto_860252 ?auto_860259 ) ) ( not ( = ?auto_860252 ?auto_860260 ) ) ( not ( = ?auto_860252 ?auto_860261 ) ) ( not ( = ?auto_860252 ?auto_860262 ) ) ( not ( = ?auto_860252 ?auto_860263 ) ) ( not ( = ?auto_860253 ?auto_860254 ) ) ( not ( = ?auto_860253 ?auto_860255 ) ) ( not ( = ?auto_860253 ?auto_860256 ) ) ( not ( = ?auto_860253 ?auto_860257 ) ) ( not ( = ?auto_860253 ?auto_860258 ) ) ( not ( = ?auto_860253 ?auto_860259 ) ) ( not ( = ?auto_860253 ?auto_860260 ) ) ( not ( = ?auto_860253 ?auto_860261 ) ) ( not ( = ?auto_860253 ?auto_860262 ) ) ( not ( = ?auto_860253 ?auto_860263 ) ) ( not ( = ?auto_860254 ?auto_860255 ) ) ( not ( = ?auto_860254 ?auto_860256 ) ) ( not ( = ?auto_860254 ?auto_860257 ) ) ( not ( = ?auto_860254 ?auto_860258 ) ) ( not ( = ?auto_860254 ?auto_860259 ) ) ( not ( = ?auto_860254 ?auto_860260 ) ) ( not ( = ?auto_860254 ?auto_860261 ) ) ( not ( = ?auto_860254 ?auto_860262 ) ) ( not ( = ?auto_860254 ?auto_860263 ) ) ( not ( = ?auto_860255 ?auto_860256 ) ) ( not ( = ?auto_860255 ?auto_860257 ) ) ( not ( = ?auto_860255 ?auto_860258 ) ) ( not ( = ?auto_860255 ?auto_860259 ) ) ( not ( = ?auto_860255 ?auto_860260 ) ) ( not ( = ?auto_860255 ?auto_860261 ) ) ( not ( = ?auto_860255 ?auto_860262 ) ) ( not ( = ?auto_860255 ?auto_860263 ) ) ( not ( = ?auto_860256 ?auto_860257 ) ) ( not ( = ?auto_860256 ?auto_860258 ) ) ( not ( = ?auto_860256 ?auto_860259 ) ) ( not ( = ?auto_860256 ?auto_860260 ) ) ( not ( = ?auto_860256 ?auto_860261 ) ) ( not ( = ?auto_860256 ?auto_860262 ) ) ( not ( = ?auto_860256 ?auto_860263 ) ) ( not ( = ?auto_860257 ?auto_860258 ) ) ( not ( = ?auto_860257 ?auto_860259 ) ) ( not ( = ?auto_860257 ?auto_860260 ) ) ( not ( = ?auto_860257 ?auto_860261 ) ) ( not ( = ?auto_860257 ?auto_860262 ) ) ( not ( = ?auto_860257 ?auto_860263 ) ) ( not ( = ?auto_860258 ?auto_860259 ) ) ( not ( = ?auto_860258 ?auto_860260 ) ) ( not ( = ?auto_860258 ?auto_860261 ) ) ( not ( = ?auto_860258 ?auto_860262 ) ) ( not ( = ?auto_860258 ?auto_860263 ) ) ( not ( = ?auto_860259 ?auto_860260 ) ) ( not ( = ?auto_860259 ?auto_860261 ) ) ( not ( = ?auto_860259 ?auto_860262 ) ) ( not ( = ?auto_860259 ?auto_860263 ) ) ( not ( = ?auto_860260 ?auto_860261 ) ) ( not ( = ?auto_860260 ?auto_860262 ) ) ( not ( = ?auto_860260 ?auto_860263 ) ) ( not ( = ?auto_860261 ?auto_860262 ) ) ( not ( = ?auto_860261 ?auto_860263 ) ) ( not ( = ?auto_860262 ?auto_860263 ) ) ( ON ?auto_860261 ?auto_860262 ) ( ON ?auto_860260 ?auto_860261 ) ( ON ?auto_860259 ?auto_860260 ) ( ON ?auto_860258 ?auto_860259 ) ( ON ?auto_860257 ?auto_860258 ) ( ON ?auto_860256 ?auto_860257 ) ( ON ?auto_860255 ?auto_860256 ) ( ON ?auto_860254 ?auto_860255 ) ( ON ?auto_860253 ?auto_860254 ) ( ON ?auto_860252 ?auto_860253 ) ( ON ?auto_860251 ?auto_860252 ) ( ON ?auto_860250 ?auto_860251 ) ( ON ?auto_860249 ?auto_860250 ) ( ON ?auto_860248 ?auto_860249 ) ( ON ?auto_860247 ?auto_860248 ) ( CLEAR ?auto_860247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_860247 )
      ( MAKE-16PILE ?auto_860247 ?auto_860248 ?auto_860249 ?auto_860250 ?auto_860251 ?auto_860252 ?auto_860253 ?auto_860254 ?auto_860255 ?auto_860256 ?auto_860257 ?auto_860258 ?auto_860259 ?auto_860260 ?auto_860261 ?auto_860262 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_860314 - BLOCK
      ?auto_860315 - BLOCK
      ?auto_860316 - BLOCK
      ?auto_860317 - BLOCK
      ?auto_860318 - BLOCK
      ?auto_860319 - BLOCK
      ?auto_860320 - BLOCK
      ?auto_860321 - BLOCK
      ?auto_860322 - BLOCK
      ?auto_860323 - BLOCK
      ?auto_860324 - BLOCK
      ?auto_860325 - BLOCK
      ?auto_860326 - BLOCK
      ?auto_860327 - BLOCK
      ?auto_860328 - BLOCK
      ?auto_860329 - BLOCK
      ?auto_860330 - BLOCK
    )
    :vars
    (
      ?auto_860331 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_860329 ) ( ON ?auto_860330 ?auto_860331 ) ( CLEAR ?auto_860330 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_860314 ) ( ON ?auto_860315 ?auto_860314 ) ( ON ?auto_860316 ?auto_860315 ) ( ON ?auto_860317 ?auto_860316 ) ( ON ?auto_860318 ?auto_860317 ) ( ON ?auto_860319 ?auto_860318 ) ( ON ?auto_860320 ?auto_860319 ) ( ON ?auto_860321 ?auto_860320 ) ( ON ?auto_860322 ?auto_860321 ) ( ON ?auto_860323 ?auto_860322 ) ( ON ?auto_860324 ?auto_860323 ) ( ON ?auto_860325 ?auto_860324 ) ( ON ?auto_860326 ?auto_860325 ) ( ON ?auto_860327 ?auto_860326 ) ( ON ?auto_860328 ?auto_860327 ) ( ON ?auto_860329 ?auto_860328 ) ( not ( = ?auto_860314 ?auto_860315 ) ) ( not ( = ?auto_860314 ?auto_860316 ) ) ( not ( = ?auto_860314 ?auto_860317 ) ) ( not ( = ?auto_860314 ?auto_860318 ) ) ( not ( = ?auto_860314 ?auto_860319 ) ) ( not ( = ?auto_860314 ?auto_860320 ) ) ( not ( = ?auto_860314 ?auto_860321 ) ) ( not ( = ?auto_860314 ?auto_860322 ) ) ( not ( = ?auto_860314 ?auto_860323 ) ) ( not ( = ?auto_860314 ?auto_860324 ) ) ( not ( = ?auto_860314 ?auto_860325 ) ) ( not ( = ?auto_860314 ?auto_860326 ) ) ( not ( = ?auto_860314 ?auto_860327 ) ) ( not ( = ?auto_860314 ?auto_860328 ) ) ( not ( = ?auto_860314 ?auto_860329 ) ) ( not ( = ?auto_860314 ?auto_860330 ) ) ( not ( = ?auto_860314 ?auto_860331 ) ) ( not ( = ?auto_860315 ?auto_860316 ) ) ( not ( = ?auto_860315 ?auto_860317 ) ) ( not ( = ?auto_860315 ?auto_860318 ) ) ( not ( = ?auto_860315 ?auto_860319 ) ) ( not ( = ?auto_860315 ?auto_860320 ) ) ( not ( = ?auto_860315 ?auto_860321 ) ) ( not ( = ?auto_860315 ?auto_860322 ) ) ( not ( = ?auto_860315 ?auto_860323 ) ) ( not ( = ?auto_860315 ?auto_860324 ) ) ( not ( = ?auto_860315 ?auto_860325 ) ) ( not ( = ?auto_860315 ?auto_860326 ) ) ( not ( = ?auto_860315 ?auto_860327 ) ) ( not ( = ?auto_860315 ?auto_860328 ) ) ( not ( = ?auto_860315 ?auto_860329 ) ) ( not ( = ?auto_860315 ?auto_860330 ) ) ( not ( = ?auto_860315 ?auto_860331 ) ) ( not ( = ?auto_860316 ?auto_860317 ) ) ( not ( = ?auto_860316 ?auto_860318 ) ) ( not ( = ?auto_860316 ?auto_860319 ) ) ( not ( = ?auto_860316 ?auto_860320 ) ) ( not ( = ?auto_860316 ?auto_860321 ) ) ( not ( = ?auto_860316 ?auto_860322 ) ) ( not ( = ?auto_860316 ?auto_860323 ) ) ( not ( = ?auto_860316 ?auto_860324 ) ) ( not ( = ?auto_860316 ?auto_860325 ) ) ( not ( = ?auto_860316 ?auto_860326 ) ) ( not ( = ?auto_860316 ?auto_860327 ) ) ( not ( = ?auto_860316 ?auto_860328 ) ) ( not ( = ?auto_860316 ?auto_860329 ) ) ( not ( = ?auto_860316 ?auto_860330 ) ) ( not ( = ?auto_860316 ?auto_860331 ) ) ( not ( = ?auto_860317 ?auto_860318 ) ) ( not ( = ?auto_860317 ?auto_860319 ) ) ( not ( = ?auto_860317 ?auto_860320 ) ) ( not ( = ?auto_860317 ?auto_860321 ) ) ( not ( = ?auto_860317 ?auto_860322 ) ) ( not ( = ?auto_860317 ?auto_860323 ) ) ( not ( = ?auto_860317 ?auto_860324 ) ) ( not ( = ?auto_860317 ?auto_860325 ) ) ( not ( = ?auto_860317 ?auto_860326 ) ) ( not ( = ?auto_860317 ?auto_860327 ) ) ( not ( = ?auto_860317 ?auto_860328 ) ) ( not ( = ?auto_860317 ?auto_860329 ) ) ( not ( = ?auto_860317 ?auto_860330 ) ) ( not ( = ?auto_860317 ?auto_860331 ) ) ( not ( = ?auto_860318 ?auto_860319 ) ) ( not ( = ?auto_860318 ?auto_860320 ) ) ( not ( = ?auto_860318 ?auto_860321 ) ) ( not ( = ?auto_860318 ?auto_860322 ) ) ( not ( = ?auto_860318 ?auto_860323 ) ) ( not ( = ?auto_860318 ?auto_860324 ) ) ( not ( = ?auto_860318 ?auto_860325 ) ) ( not ( = ?auto_860318 ?auto_860326 ) ) ( not ( = ?auto_860318 ?auto_860327 ) ) ( not ( = ?auto_860318 ?auto_860328 ) ) ( not ( = ?auto_860318 ?auto_860329 ) ) ( not ( = ?auto_860318 ?auto_860330 ) ) ( not ( = ?auto_860318 ?auto_860331 ) ) ( not ( = ?auto_860319 ?auto_860320 ) ) ( not ( = ?auto_860319 ?auto_860321 ) ) ( not ( = ?auto_860319 ?auto_860322 ) ) ( not ( = ?auto_860319 ?auto_860323 ) ) ( not ( = ?auto_860319 ?auto_860324 ) ) ( not ( = ?auto_860319 ?auto_860325 ) ) ( not ( = ?auto_860319 ?auto_860326 ) ) ( not ( = ?auto_860319 ?auto_860327 ) ) ( not ( = ?auto_860319 ?auto_860328 ) ) ( not ( = ?auto_860319 ?auto_860329 ) ) ( not ( = ?auto_860319 ?auto_860330 ) ) ( not ( = ?auto_860319 ?auto_860331 ) ) ( not ( = ?auto_860320 ?auto_860321 ) ) ( not ( = ?auto_860320 ?auto_860322 ) ) ( not ( = ?auto_860320 ?auto_860323 ) ) ( not ( = ?auto_860320 ?auto_860324 ) ) ( not ( = ?auto_860320 ?auto_860325 ) ) ( not ( = ?auto_860320 ?auto_860326 ) ) ( not ( = ?auto_860320 ?auto_860327 ) ) ( not ( = ?auto_860320 ?auto_860328 ) ) ( not ( = ?auto_860320 ?auto_860329 ) ) ( not ( = ?auto_860320 ?auto_860330 ) ) ( not ( = ?auto_860320 ?auto_860331 ) ) ( not ( = ?auto_860321 ?auto_860322 ) ) ( not ( = ?auto_860321 ?auto_860323 ) ) ( not ( = ?auto_860321 ?auto_860324 ) ) ( not ( = ?auto_860321 ?auto_860325 ) ) ( not ( = ?auto_860321 ?auto_860326 ) ) ( not ( = ?auto_860321 ?auto_860327 ) ) ( not ( = ?auto_860321 ?auto_860328 ) ) ( not ( = ?auto_860321 ?auto_860329 ) ) ( not ( = ?auto_860321 ?auto_860330 ) ) ( not ( = ?auto_860321 ?auto_860331 ) ) ( not ( = ?auto_860322 ?auto_860323 ) ) ( not ( = ?auto_860322 ?auto_860324 ) ) ( not ( = ?auto_860322 ?auto_860325 ) ) ( not ( = ?auto_860322 ?auto_860326 ) ) ( not ( = ?auto_860322 ?auto_860327 ) ) ( not ( = ?auto_860322 ?auto_860328 ) ) ( not ( = ?auto_860322 ?auto_860329 ) ) ( not ( = ?auto_860322 ?auto_860330 ) ) ( not ( = ?auto_860322 ?auto_860331 ) ) ( not ( = ?auto_860323 ?auto_860324 ) ) ( not ( = ?auto_860323 ?auto_860325 ) ) ( not ( = ?auto_860323 ?auto_860326 ) ) ( not ( = ?auto_860323 ?auto_860327 ) ) ( not ( = ?auto_860323 ?auto_860328 ) ) ( not ( = ?auto_860323 ?auto_860329 ) ) ( not ( = ?auto_860323 ?auto_860330 ) ) ( not ( = ?auto_860323 ?auto_860331 ) ) ( not ( = ?auto_860324 ?auto_860325 ) ) ( not ( = ?auto_860324 ?auto_860326 ) ) ( not ( = ?auto_860324 ?auto_860327 ) ) ( not ( = ?auto_860324 ?auto_860328 ) ) ( not ( = ?auto_860324 ?auto_860329 ) ) ( not ( = ?auto_860324 ?auto_860330 ) ) ( not ( = ?auto_860324 ?auto_860331 ) ) ( not ( = ?auto_860325 ?auto_860326 ) ) ( not ( = ?auto_860325 ?auto_860327 ) ) ( not ( = ?auto_860325 ?auto_860328 ) ) ( not ( = ?auto_860325 ?auto_860329 ) ) ( not ( = ?auto_860325 ?auto_860330 ) ) ( not ( = ?auto_860325 ?auto_860331 ) ) ( not ( = ?auto_860326 ?auto_860327 ) ) ( not ( = ?auto_860326 ?auto_860328 ) ) ( not ( = ?auto_860326 ?auto_860329 ) ) ( not ( = ?auto_860326 ?auto_860330 ) ) ( not ( = ?auto_860326 ?auto_860331 ) ) ( not ( = ?auto_860327 ?auto_860328 ) ) ( not ( = ?auto_860327 ?auto_860329 ) ) ( not ( = ?auto_860327 ?auto_860330 ) ) ( not ( = ?auto_860327 ?auto_860331 ) ) ( not ( = ?auto_860328 ?auto_860329 ) ) ( not ( = ?auto_860328 ?auto_860330 ) ) ( not ( = ?auto_860328 ?auto_860331 ) ) ( not ( = ?auto_860329 ?auto_860330 ) ) ( not ( = ?auto_860329 ?auto_860331 ) ) ( not ( = ?auto_860330 ?auto_860331 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_860330 ?auto_860331 )
      ( !STACK ?auto_860330 ?auto_860329 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_860384 - BLOCK
      ?auto_860385 - BLOCK
      ?auto_860386 - BLOCK
      ?auto_860387 - BLOCK
      ?auto_860388 - BLOCK
      ?auto_860389 - BLOCK
      ?auto_860390 - BLOCK
      ?auto_860391 - BLOCK
      ?auto_860392 - BLOCK
      ?auto_860393 - BLOCK
      ?auto_860394 - BLOCK
      ?auto_860395 - BLOCK
      ?auto_860396 - BLOCK
      ?auto_860397 - BLOCK
      ?auto_860398 - BLOCK
      ?auto_860399 - BLOCK
      ?auto_860400 - BLOCK
    )
    :vars
    (
      ?auto_860401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_860400 ?auto_860401 ) ( ON-TABLE ?auto_860384 ) ( ON ?auto_860385 ?auto_860384 ) ( ON ?auto_860386 ?auto_860385 ) ( ON ?auto_860387 ?auto_860386 ) ( ON ?auto_860388 ?auto_860387 ) ( ON ?auto_860389 ?auto_860388 ) ( ON ?auto_860390 ?auto_860389 ) ( ON ?auto_860391 ?auto_860390 ) ( ON ?auto_860392 ?auto_860391 ) ( ON ?auto_860393 ?auto_860392 ) ( ON ?auto_860394 ?auto_860393 ) ( ON ?auto_860395 ?auto_860394 ) ( ON ?auto_860396 ?auto_860395 ) ( ON ?auto_860397 ?auto_860396 ) ( ON ?auto_860398 ?auto_860397 ) ( not ( = ?auto_860384 ?auto_860385 ) ) ( not ( = ?auto_860384 ?auto_860386 ) ) ( not ( = ?auto_860384 ?auto_860387 ) ) ( not ( = ?auto_860384 ?auto_860388 ) ) ( not ( = ?auto_860384 ?auto_860389 ) ) ( not ( = ?auto_860384 ?auto_860390 ) ) ( not ( = ?auto_860384 ?auto_860391 ) ) ( not ( = ?auto_860384 ?auto_860392 ) ) ( not ( = ?auto_860384 ?auto_860393 ) ) ( not ( = ?auto_860384 ?auto_860394 ) ) ( not ( = ?auto_860384 ?auto_860395 ) ) ( not ( = ?auto_860384 ?auto_860396 ) ) ( not ( = ?auto_860384 ?auto_860397 ) ) ( not ( = ?auto_860384 ?auto_860398 ) ) ( not ( = ?auto_860384 ?auto_860399 ) ) ( not ( = ?auto_860384 ?auto_860400 ) ) ( not ( = ?auto_860384 ?auto_860401 ) ) ( not ( = ?auto_860385 ?auto_860386 ) ) ( not ( = ?auto_860385 ?auto_860387 ) ) ( not ( = ?auto_860385 ?auto_860388 ) ) ( not ( = ?auto_860385 ?auto_860389 ) ) ( not ( = ?auto_860385 ?auto_860390 ) ) ( not ( = ?auto_860385 ?auto_860391 ) ) ( not ( = ?auto_860385 ?auto_860392 ) ) ( not ( = ?auto_860385 ?auto_860393 ) ) ( not ( = ?auto_860385 ?auto_860394 ) ) ( not ( = ?auto_860385 ?auto_860395 ) ) ( not ( = ?auto_860385 ?auto_860396 ) ) ( not ( = ?auto_860385 ?auto_860397 ) ) ( not ( = ?auto_860385 ?auto_860398 ) ) ( not ( = ?auto_860385 ?auto_860399 ) ) ( not ( = ?auto_860385 ?auto_860400 ) ) ( not ( = ?auto_860385 ?auto_860401 ) ) ( not ( = ?auto_860386 ?auto_860387 ) ) ( not ( = ?auto_860386 ?auto_860388 ) ) ( not ( = ?auto_860386 ?auto_860389 ) ) ( not ( = ?auto_860386 ?auto_860390 ) ) ( not ( = ?auto_860386 ?auto_860391 ) ) ( not ( = ?auto_860386 ?auto_860392 ) ) ( not ( = ?auto_860386 ?auto_860393 ) ) ( not ( = ?auto_860386 ?auto_860394 ) ) ( not ( = ?auto_860386 ?auto_860395 ) ) ( not ( = ?auto_860386 ?auto_860396 ) ) ( not ( = ?auto_860386 ?auto_860397 ) ) ( not ( = ?auto_860386 ?auto_860398 ) ) ( not ( = ?auto_860386 ?auto_860399 ) ) ( not ( = ?auto_860386 ?auto_860400 ) ) ( not ( = ?auto_860386 ?auto_860401 ) ) ( not ( = ?auto_860387 ?auto_860388 ) ) ( not ( = ?auto_860387 ?auto_860389 ) ) ( not ( = ?auto_860387 ?auto_860390 ) ) ( not ( = ?auto_860387 ?auto_860391 ) ) ( not ( = ?auto_860387 ?auto_860392 ) ) ( not ( = ?auto_860387 ?auto_860393 ) ) ( not ( = ?auto_860387 ?auto_860394 ) ) ( not ( = ?auto_860387 ?auto_860395 ) ) ( not ( = ?auto_860387 ?auto_860396 ) ) ( not ( = ?auto_860387 ?auto_860397 ) ) ( not ( = ?auto_860387 ?auto_860398 ) ) ( not ( = ?auto_860387 ?auto_860399 ) ) ( not ( = ?auto_860387 ?auto_860400 ) ) ( not ( = ?auto_860387 ?auto_860401 ) ) ( not ( = ?auto_860388 ?auto_860389 ) ) ( not ( = ?auto_860388 ?auto_860390 ) ) ( not ( = ?auto_860388 ?auto_860391 ) ) ( not ( = ?auto_860388 ?auto_860392 ) ) ( not ( = ?auto_860388 ?auto_860393 ) ) ( not ( = ?auto_860388 ?auto_860394 ) ) ( not ( = ?auto_860388 ?auto_860395 ) ) ( not ( = ?auto_860388 ?auto_860396 ) ) ( not ( = ?auto_860388 ?auto_860397 ) ) ( not ( = ?auto_860388 ?auto_860398 ) ) ( not ( = ?auto_860388 ?auto_860399 ) ) ( not ( = ?auto_860388 ?auto_860400 ) ) ( not ( = ?auto_860388 ?auto_860401 ) ) ( not ( = ?auto_860389 ?auto_860390 ) ) ( not ( = ?auto_860389 ?auto_860391 ) ) ( not ( = ?auto_860389 ?auto_860392 ) ) ( not ( = ?auto_860389 ?auto_860393 ) ) ( not ( = ?auto_860389 ?auto_860394 ) ) ( not ( = ?auto_860389 ?auto_860395 ) ) ( not ( = ?auto_860389 ?auto_860396 ) ) ( not ( = ?auto_860389 ?auto_860397 ) ) ( not ( = ?auto_860389 ?auto_860398 ) ) ( not ( = ?auto_860389 ?auto_860399 ) ) ( not ( = ?auto_860389 ?auto_860400 ) ) ( not ( = ?auto_860389 ?auto_860401 ) ) ( not ( = ?auto_860390 ?auto_860391 ) ) ( not ( = ?auto_860390 ?auto_860392 ) ) ( not ( = ?auto_860390 ?auto_860393 ) ) ( not ( = ?auto_860390 ?auto_860394 ) ) ( not ( = ?auto_860390 ?auto_860395 ) ) ( not ( = ?auto_860390 ?auto_860396 ) ) ( not ( = ?auto_860390 ?auto_860397 ) ) ( not ( = ?auto_860390 ?auto_860398 ) ) ( not ( = ?auto_860390 ?auto_860399 ) ) ( not ( = ?auto_860390 ?auto_860400 ) ) ( not ( = ?auto_860390 ?auto_860401 ) ) ( not ( = ?auto_860391 ?auto_860392 ) ) ( not ( = ?auto_860391 ?auto_860393 ) ) ( not ( = ?auto_860391 ?auto_860394 ) ) ( not ( = ?auto_860391 ?auto_860395 ) ) ( not ( = ?auto_860391 ?auto_860396 ) ) ( not ( = ?auto_860391 ?auto_860397 ) ) ( not ( = ?auto_860391 ?auto_860398 ) ) ( not ( = ?auto_860391 ?auto_860399 ) ) ( not ( = ?auto_860391 ?auto_860400 ) ) ( not ( = ?auto_860391 ?auto_860401 ) ) ( not ( = ?auto_860392 ?auto_860393 ) ) ( not ( = ?auto_860392 ?auto_860394 ) ) ( not ( = ?auto_860392 ?auto_860395 ) ) ( not ( = ?auto_860392 ?auto_860396 ) ) ( not ( = ?auto_860392 ?auto_860397 ) ) ( not ( = ?auto_860392 ?auto_860398 ) ) ( not ( = ?auto_860392 ?auto_860399 ) ) ( not ( = ?auto_860392 ?auto_860400 ) ) ( not ( = ?auto_860392 ?auto_860401 ) ) ( not ( = ?auto_860393 ?auto_860394 ) ) ( not ( = ?auto_860393 ?auto_860395 ) ) ( not ( = ?auto_860393 ?auto_860396 ) ) ( not ( = ?auto_860393 ?auto_860397 ) ) ( not ( = ?auto_860393 ?auto_860398 ) ) ( not ( = ?auto_860393 ?auto_860399 ) ) ( not ( = ?auto_860393 ?auto_860400 ) ) ( not ( = ?auto_860393 ?auto_860401 ) ) ( not ( = ?auto_860394 ?auto_860395 ) ) ( not ( = ?auto_860394 ?auto_860396 ) ) ( not ( = ?auto_860394 ?auto_860397 ) ) ( not ( = ?auto_860394 ?auto_860398 ) ) ( not ( = ?auto_860394 ?auto_860399 ) ) ( not ( = ?auto_860394 ?auto_860400 ) ) ( not ( = ?auto_860394 ?auto_860401 ) ) ( not ( = ?auto_860395 ?auto_860396 ) ) ( not ( = ?auto_860395 ?auto_860397 ) ) ( not ( = ?auto_860395 ?auto_860398 ) ) ( not ( = ?auto_860395 ?auto_860399 ) ) ( not ( = ?auto_860395 ?auto_860400 ) ) ( not ( = ?auto_860395 ?auto_860401 ) ) ( not ( = ?auto_860396 ?auto_860397 ) ) ( not ( = ?auto_860396 ?auto_860398 ) ) ( not ( = ?auto_860396 ?auto_860399 ) ) ( not ( = ?auto_860396 ?auto_860400 ) ) ( not ( = ?auto_860396 ?auto_860401 ) ) ( not ( = ?auto_860397 ?auto_860398 ) ) ( not ( = ?auto_860397 ?auto_860399 ) ) ( not ( = ?auto_860397 ?auto_860400 ) ) ( not ( = ?auto_860397 ?auto_860401 ) ) ( not ( = ?auto_860398 ?auto_860399 ) ) ( not ( = ?auto_860398 ?auto_860400 ) ) ( not ( = ?auto_860398 ?auto_860401 ) ) ( not ( = ?auto_860399 ?auto_860400 ) ) ( not ( = ?auto_860399 ?auto_860401 ) ) ( not ( = ?auto_860400 ?auto_860401 ) ) ( CLEAR ?auto_860398 ) ( ON ?auto_860399 ?auto_860400 ) ( CLEAR ?auto_860399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_860384 ?auto_860385 ?auto_860386 ?auto_860387 ?auto_860388 ?auto_860389 ?auto_860390 ?auto_860391 ?auto_860392 ?auto_860393 ?auto_860394 ?auto_860395 ?auto_860396 ?auto_860397 ?auto_860398 ?auto_860399 )
      ( MAKE-17PILE ?auto_860384 ?auto_860385 ?auto_860386 ?auto_860387 ?auto_860388 ?auto_860389 ?auto_860390 ?auto_860391 ?auto_860392 ?auto_860393 ?auto_860394 ?auto_860395 ?auto_860396 ?auto_860397 ?auto_860398 ?auto_860399 ?auto_860400 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_860454 - BLOCK
      ?auto_860455 - BLOCK
      ?auto_860456 - BLOCK
      ?auto_860457 - BLOCK
      ?auto_860458 - BLOCK
      ?auto_860459 - BLOCK
      ?auto_860460 - BLOCK
      ?auto_860461 - BLOCK
      ?auto_860462 - BLOCK
      ?auto_860463 - BLOCK
      ?auto_860464 - BLOCK
      ?auto_860465 - BLOCK
      ?auto_860466 - BLOCK
      ?auto_860467 - BLOCK
      ?auto_860468 - BLOCK
      ?auto_860469 - BLOCK
      ?auto_860470 - BLOCK
    )
    :vars
    (
      ?auto_860471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_860470 ?auto_860471 ) ( ON-TABLE ?auto_860454 ) ( ON ?auto_860455 ?auto_860454 ) ( ON ?auto_860456 ?auto_860455 ) ( ON ?auto_860457 ?auto_860456 ) ( ON ?auto_860458 ?auto_860457 ) ( ON ?auto_860459 ?auto_860458 ) ( ON ?auto_860460 ?auto_860459 ) ( ON ?auto_860461 ?auto_860460 ) ( ON ?auto_860462 ?auto_860461 ) ( ON ?auto_860463 ?auto_860462 ) ( ON ?auto_860464 ?auto_860463 ) ( ON ?auto_860465 ?auto_860464 ) ( ON ?auto_860466 ?auto_860465 ) ( ON ?auto_860467 ?auto_860466 ) ( not ( = ?auto_860454 ?auto_860455 ) ) ( not ( = ?auto_860454 ?auto_860456 ) ) ( not ( = ?auto_860454 ?auto_860457 ) ) ( not ( = ?auto_860454 ?auto_860458 ) ) ( not ( = ?auto_860454 ?auto_860459 ) ) ( not ( = ?auto_860454 ?auto_860460 ) ) ( not ( = ?auto_860454 ?auto_860461 ) ) ( not ( = ?auto_860454 ?auto_860462 ) ) ( not ( = ?auto_860454 ?auto_860463 ) ) ( not ( = ?auto_860454 ?auto_860464 ) ) ( not ( = ?auto_860454 ?auto_860465 ) ) ( not ( = ?auto_860454 ?auto_860466 ) ) ( not ( = ?auto_860454 ?auto_860467 ) ) ( not ( = ?auto_860454 ?auto_860468 ) ) ( not ( = ?auto_860454 ?auto_860469 ) ) ( not ( = ?auto_860454 ?auto_860470 ) ) ( not ( = ?auto_860454 ?auto_860471 ) ) ( not ( = ?auto_860455 ?auto_860456 ) ) ( not ( = ?auto_860455 ?auto_860457 ) ) ( not ( = ?auto_860455 ?auto_860458 ) ) ( not ( = ?auto_860455 ?auto_860459 ) ) ( not ( = ?auto_860455 ?auto_860460 ) ) ( not ( = ?auto_860455 ?auto_860461 ) ) ( not ( = ?auto_860455 ?auto_860462 ) ) ( not ( = ?auto_860455 ?auto_860463 ) ) ( not ( = ?auto_860455 ?auto_860464 ) ) ( not ( = ?auto_860455 ?auto_860465 ) ) ( not ( = ?auto_860455 ?auto_860466 ) ) ( not ( = ?auto_860455 ?auto_860467 ) ) ( not ( = ?auto_860455 ?auto_860468 ) ) ( not ( = ?auto_860455 ?auto_860469 ) ) ( not ( = ?auto_860455 ?auto_860470 ) ) ( not ( = ?auto_860455 ?auto_860471 ) ) ( not ( = ?auto_860456 ?auto_860457 ) ) ( not ( = ?auto_860456 ?auto_860458 ) ) ( not ( = ?auto_860456 ?auto_860459 ) ) ( not ( = ?auto_860456 ?auto_860460 ) ) ( not ( = ?auto_860456 ?auto_860461 ) ) ( not ( = ?auto_860456 ?auto_860462 ) ) ( not ( = ?auto_860456 ?auto_860463 ) ) ( not ( = ?auto_860456 ?auto_860464 ) ) ( not ( = ?auto_860456 ?auto_860465 ) ) ( not ( = ?auto_860456 ?auto_860466 ) ) ( not ( = ?auto_860456 ?auto_860467 ) ) ( not ( = ?auto_860456 ?auto_860468 ) ) ( not ( = ?auto_860456 ?auto_860469 ) ) ( not ( = ?auto_860456 ?auto_860470 ) ) ( not ( = ?auto_860456 ?auto_860471 ) ) ( not ( = ?auto_860457 ?auto_860458 ) ) ( not ( = ?auto_860457 ?auto_860459 ) ) ( not ( = ?auto_860457 ?auto_860460 ) ) ( not ( = ?auto_860457 ?auto_860461 ) ) ( not ( = ?auto_860457 ?auto_860462 ) ) ( not ( = ?auto_860457 ?auto_860463 ) ) ( not ( = ?auto_860457 ?auto_860464 ) ) ( not ( = ?auto_860457 ?auto_860465 ) ) ( not ( = ?auto_860457 ?auto_860466 ) ) ( not ( = ?auto_860457 ?auto_860467 ) ) ( not ( = ?auto_860457 ?auto_860468 ) ) ( not ( = ?auto_860457 ?auto_860469 ) ) ( not ( = ?auto_860457 ?auto_860470 ) ) ( not ( = ?auto_860457 ?auto_860471 ) ) ( not ( = ?auto_860458 ?auto_860459 ) ) ( not ( = ?auto_860458 ?auto_860460 ) ) ( not ( = ?auto_860458 ?auto_860461 ) ) ( not ( = ?auto_860458 ?auto_860462 ) ) ( not ( = ?auto_860458 ?auto_860463 ) ) ( not ( = ?auto_860458 ?auto_860464 ) ) ( not ( = ?auto_860458 ?auto_860465 ) ) ( not ( = ?auto_860458 ?auto_860466 ) ) ( not ( = ?auto_860458 ?auto_860467 ) ) ( not ( = ?auto_860458 ?auto_860468 ) ) ( not ( = ?auto_860458 ?auto_860469 ) ) ( not ( = ?auto_860458 ?auto_860470 ) ) ( not ( = ?auto_860458 ?auto_860471 ) ) ( not ( = ?auto_860459 ?auto_860460 ) ) ( not ( = ?auto_860459 ?auto_860461 ) ) ( not ( = ?auto_860459 ?auto_860462 ) ) ( not ( = ?auto_860459 ?auto_860463 ) ) ( not ( = ?auto_860459 ?auto_860464 ) ) ( not ( = ?auto_860459 ?auto_860465 ) ) ( not ( = ?auto_860459 ?auto_860466 ) ) ( not ( = ?auto_860459 ?auto_860467 ) ) ( not ( = ?auto_860459 ?auto_860468 ) ) ( not ( = ?auto_860459 ?auto_860469 ) ) ( not ( = ?auto_860459 ?auto_860470 ) ) ( not ( = ?auto_860459 ?auto_860471 ) ) ( not ( = ?auto_860460 ?auto_860461 ) ) ( not ( = ?auto_860460 ?auto_860462 ) ) ( not ( = ?auto_860460 ?auto_860463 ) ) ( not ( = ?auto_860460 ?auto_860464 ) ) ( not ( = ?auto_860460 ?auto_860465 ) ) ( not ( = ?auto_860460 ?auto_860466 ) ) ( not ( = ?auto_860460 ?auto_860467 ) ) ( not ( = ?auto_860460 ?auto_860468 ) ) ( not ( = ?auto_860460 ?auto_860469 ) ) ( not ( = ?auto_860460 ?auto_860470 ) ) ( not ( = ?auto_860460 ?auto_860471 ) ) ( not ( = ?auto_860461 ?auto_860462 ) ) ( not ( = ?auto_860461 ?auto_860463 ) ) ( not ( = ?auto_860461 ?auto_860464 ) ) ( not ( = ?auto_860461 ?auto_860465 ) ) ( not ( = ?auto_860461 ?auto_860466 ) ) ( not ( = ?auto_860461 ?auto_860467 ) ) ( not ( = ?auto_860461 ?auto_860468 ) ) ( not ( = ?auto_860461 ?auto_860469 ) ) ( not ( = ?auto_860461 ?auto_860470 ) ) ( not ( = ?auto_860461 ?auto_860471 ) ) ( not ( = ?auto_860462 ?auto_860463 ) ) ( not ( = ?auto_860462 ?auto_860464 ) ) ( not ( = ?auto_860462 ?auto_860465 ) ) ( not ( = ?auto_860462 ?auto_860466 ) ) ( not ( = ?auto_860462 ?auto_860467 ) ) ( not ( = ?auto_860462 ?auto_860468 ) ) ( not ( = ?auto_860462 ?auto_860469 ) ) ( not ( = ?auto_860462 ?auto_860470 ) ) ( not ( = ?auto_860462 ?auto_860471 ) ) ( not ( = ?auto_860463 ?auto_860464 ) ) ( not ( = ?auto_860463 ?auto_860465 ) ) ( not ( = ?auto_860463 ?auto_860466 ) ) ( not ( = ?auto_860463 ?auto_860467 ) ) ( not ( = ?auto_860463 ?auto_860468 ) ) ( not ( = ?auto_860463 ?auto_860469 ) ) ( not ( = ?auto_860463 ?auto_860470 ) ) ( not ( = ?auto_860463 ?auto_860471 ) ) ( not ( = ?auto_860464 ?auto_860465 ) ) ( not ( = ?auto_860464 ?auto_860466 ) ) ( not ( = ?auto_860464 ?auto_860467 ) ) ( not ( = ?auto_860464 ?auto_860468 ) ) ( not ( = ?auto_860464 ?auto_860469 ) ) ( not ( = ?auto_860464 ?auto_860470 ) ) ( not ( = ?auto_860464 ?auto_860471 ) ) ( not ( = ?auto_860465 ?auto_860466 ) ) ( not ( = ?auto_860465 ?auto_860467 ) ) ( not ( = ?auto_860465 ?auto_860468 ) ) ( not ( = ?auto_860465 ?auto_860469 ) ) ( not ( = ?auto_860465 ?auto_860470 ) ) ( not ( = ?auto_860465 ?auto_860471 ) ) ( not ( = ?auto_860466 ?auto_860467 ) ) ( not ( = ?auto_860466 ?auto_860468 ) ) ( not ( = ?auto_860466 ?auto_860469 ) ) ( not ( = ?auto_860466 ?auto_860470 ) ) ( not ( = ?auto_860466 ?auto_860471 ) ) ( not ( = ?auto_860467 ?auto_860468 ) ) ( not ( = ?auto_860467 ?auto_860469 ) ) ( not ( = ?auto_860467 ?auto_860470 ) ) ( not ( = ?auto_860467 ?auto_860471 ) ) ( not ( = ?auto_860468 ?auto_860469 ) ) ( not ( = ?auto_860468 ?auto_860470 ) ) ( not ( = ?auto_860468 ?auto_860471 ) ) ( not ( = ?auto_860469 ?auto_860470 ) ) ( not ( = ?auto_860469 ?auto_860471 ) ) ( not ( = ?auto_860470 ?auto_860471 ) ) ( ON ?auto_860469 ?auto_860470 ) ( CLEAR ?auto_860467 ) ( ON ?auto_860468 ?auto_860469 ) ( CLEAR ?auto_860468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_860454 ?auto_860455 ?auto_860456 ?auto_860457 ?auto_860458 ?auto_860459 ?auto_860460 ?auto_860461 ?auto_860462 ?auto_860463 ?auto_860464 ?auto_860465 ?auto_860466 ?auto_860467 ?auto_860468 )
      ( MAKE-17PILE ?auto_860454 ?auto_860455 ?auto_860456 ?auto_860457 ?auto_860458 ?auto_860459 ?auto_860460 ?auto_860461 ?auto_860462 ?auto_860463 ?auto_860464 ?auto_860465 ?auto_860466 ?auto_860467 ?auto_860468 ?auto_860469 ?auto_860470 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_860524 - BLOCK
      ?auto_860525 - BLOCK
      ?auto_860526 - BLOCK
      ?auto_860527 - BLOCK
      ?auto_860528 - BLOCK
      ?auto_860529 - BLOCK
      ?auto_860530 - BLOCK
      ?auto_860531 - BLOCK
      ?auto_860532 - BLOCK
      ?auto_860533 - BLOCK
      ?auto_860534 - BLOCK
      ?auto_860535 - BLOCK
      ?auto_860536 - BLOCK
      ?auto_860537 - BLOCK
      ?auto_860538 - BLOCK
      ?auto_860539 - BLOCK
      ?auto_860540 - BLOCK
    )
    :vars
    (
      ?auto_860541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_860540 ?auto_860541 ) ( ON-TABLE ?auto_860524 ) ( ON ?auto_860525 ?auto_860524 ) ( ON ?auto_860526 ?auto_860525 ) ( ON ?auto_860527 ?auto_860526 ) ( ON ?auto_860528 ?auto_860527 ) ( ON ?auto_860529 ?auto_860528 ) ( ON ?auto_860530 ?auto_860529 ) ( ON ?auto_860531 ?auto_860530 ) ( ON ?auto_860532 ?auto_860531 ) ( ON ?auto_860533 ?auto_860532 ) ( ON ?auto_860534 ?auto_860533 ) ( ON ?auto_860535 ?auto_860534 ) ( ON ?auto_860536 ?auto_860535 ) ( not ( = ?auto_860524 ?auto_860525 ) ) ( not ( = ?auto_860524 ?auto_860526 ) ) ( not ( = ?auto_860524 ?auto_860527 ) ) ( not ( = ?auto_860524 ?auto_860528 ) ) ( not ( = ?auto_860524 ?auto_860529 ) ) ( not ( = ?auto_860524 ?auto_860530 ) ) ( not ( = ?auto_860524 ?auto_860531 ) ) ( not ( = ?auto_860524 ?auto_860532 ) ) ( not ( = ?auto_860524 ?auto_860533 ) ) ( not ( = ?auto_860524 ?auto_860534 ) ) ( not ( = ?auto_860524 ?auto_860535 ) ) ( not ( = ?auto_860524 ?auto_860536 ) ) ( not ( = ?auto_860524 ?auto_860537 ) ) ( not ( = ?auto_860524 ?auto_860538 ) ) ( not ( = ?auto_860524 ?auto_860539 ) ) ( not ( = ?auto_860524 ?auto_860540 ) ) ( not ( = ?auto_860524 ?auto_860541 ) ) ( not ( = ?auto_860525 ?auto_860526 ) ) ( not ( = ?auto_860525 ?auto_860527 ) ) ( not ( = ?auto_860525 ?auto_860528 ) ) ( not ( = ?auto_860525 ?auto_860529 ) ) ( not ( = ?auto_860525 ?auto_860530 ) ) ( not ( = ?auto_860525 ?auto_860531 ) ) ( not ( = ?auto_860525 ?auto_860532 ) ) ( not ( = ?auto_860525 ?auto_860533 ) ) ( not ( = ?auto_860525 ?auto_860534 ) ) ( not ( = ?auto_860525 ?auto_860535 ) ) ( not ( = ?auto_860525 ?auto_860536 ) ) ( not ( = ?auto_860525 ?auto_860537 ) ) ( not ( = ?auto_860525 ?auto_860538 ) ) ( not ( = ?auto_860525 ?auto_860539 ) ) ( not ( = ?auto_860525 ?auto_860540 ) ) ( not ( = ?auto_860525 ?auto_860541 ) ) ( not ( = ?auto_860526 ?auto_860527 ) ) ( not ( = ?auto_860526 ?auto_860528 ) ) ( not ( = ?auto_860526 ?auto_860529 ) ) ( not ( = ?auto_860526 ?auto_860530 ) ) ( not ( = ?auto_860526 ?auto_860531 ) ) ( not ( = ?auto_860526 ?auto_860532 ) ) ( not ( = ?auto_860526 ?auto_860533 ) ) ( not ( = ?auto_860526 ?auto_860534 ) ) ( not ( = ?auto_860526 ?auto_860535 ) ) ( not ( = ?auto_860526 ?auto_860536 ) ) ( not ( = ?auto_860526 ?auto_860537 ) ) ( not ( = ?auto_860526 ?auto_860538 ) ) ( not ( = ?auto_860526 ?auto_860539 ) ) ( not ( = ?auto_860526 ?auto_860540 ) ) ( not ( = ?auto_860526 ?auto_860541 ) ) ( not ( = ?auto_860527 ?auto_860528 ) ) ( not ( = ?auto_860527 ?auto_860529 ) ) ( not ( = ?auto_860527 ?auto_860530 ) ) ( not ( = ?auto_860527 ?auto_860531 ) ) ( not ( = ?auto_860527 ?auto_860532 ) ) ( not ( = ?auto_860527 ?auto_860533 ) ) ( not ( = ?auto_860527 ?auto_860534 ) ) ( not ( = ?auto_860527 ?auto_860535 ) ) ( not ( = ?auto_860527 ?auto_860536 ) ) ( not ( = ?auto_860527 ?auto_860537 ) ) ( not ( = ?auto_860527 ?auto_860538 ) ) ( not ( = ?auto_860527 ?auto_860539 ) ) ( not ( = ?auto_860527 ?auto_860540 ) ) ( not ( = ?auto_860527 ?auto_860541 ) ) ( not ( = ?auto_860528 ?auto_860529 ) ) ( not ( = ?auto_860528 ?auto_860530 ) ) ( not ( = ?auto_860528 ?auto_860531 ) ) ( not ( = ?auto_860528 ?auto_860532 ) ) ( not ( = ?auto_860528 ?auto_860533 ) ) ( not ( = ?auto_860528 ?auto_860534 ) ) ( not ( = ?auto_860528 ?auto_860535 ) ) ( not ( = ?auto_860528 ?auto_860536 ) ) ( not ( = ?auto_860528 ?auto_860537 ) ) ( not ( = ?auto_860528 ?auto_860538 ) ) ( not ( = ?auto_860528 ?auto_860539 ) ) ( not ( = ?auto_860528 ?auto_860540 ) ) ( not ( = ?auto_860528 ?auto_860541 ) ) ( not ( = ?auto_860529 ?auto_860530 ) ) ( not ( = ?auto_860529 ?auto_860531 ) ) ( not ( = ?auto_860529 ?auto_860532 ) ) ( not ( = ?auto_860529 ?auto_860533 ) ) ( not ( = ?auto_860529 ?auto_860534 ) ) ( not ( = ?auto_860529 ?auto_860535 ) ) ( not ( = ?auto_860529 ?auto_860536 ) ) ( not ( = ?auto_860529 ?auto_860537 ) ) ( not ( = ?auto_860529 ?auto_860538 ) ) ( not ( = ?auto_860529 ?auto_860539 ) ) ( not ( = ?auto_860529 ?auto_860540 ) ) ( not ( = ?auto_860529 ?auto_860541 ) ) ( not ( = ?auto_860530 ?auto_860531 ) ) ( not ( = ?auto_860530 ?auto_860532 ) ) ( not ( = ?auto_860530 ?auto_860533 ) ) ( not ( = ?auto_860530 ?auto_860534 ) ) ( not ( = ?auto_860530 ?auto_860535 ) ) ( not ( = ?auto_860530 ?auto_860536 ) ) ( not ( = ?auto_860530 ?auto_860537 ) ) ( not ( = ?auto_860530 ?auto_860538 ) ) ( not ( = ?auto_860530 ?auto_860539 ) ) ( not ( = ?auto_860530 ?auto_860540 ) ) ( not ( = ?auto_860530 ?auto_860541 ) ) ( not ( = ?auto_860531 ?auto_860532 ) ) ( not ( = ?auto_860531 ?auto_860533 ) ) ( not ( = ?auto_860531 ?auto_860534 ) ) ( not ( = ?auto_860531 ?auto_860535 ) ) ( not ( = ?auto_860531 ?auto_860536 ) ) ( not ( = ?auto_860531 ?auto_860537 ) ) ( not ( = ?auto_860531 ?auto_860538 ) ) ( not ( = ?auto_860531 ?auto_860539 ) ) ( not ( = ?auto_860531 ?auto_860540 ) ) ( not ( = ?auto_860531 ?auto_860541 ) ) ( not ( = ?auto_860532 ?auto_860533 ) ) ( not ( = ?auto_860532 ?auto_860534 ) ) ( not ( = ?auto_860532 ?auto_860535 ) ) ( not ( = ?auto_860532 ?auto_860536 ) ) ( not ( = ?auto_860532 ?auto_860537 ) ) ( not ( = ?auto_860532 ?auto_860538 ) ) ( not ( = ?auto_860532 ?auto_860539 ) ) ( not ( = ?auto_860532 ?auto_860540 ) ) ( not ( = ?auto_860532 ?auto_860541 ) ) ( not ( = ?auto_860533 ?auto_860534 ) ) ( not ( = ?auto_860533 ?auto_860535 ) ) ( not ( = ?auto_860533 ?auto_860536 ) ) ( not ( = ?auto_860533 ?auto_860537 ) ) ( not ( = ?auto_860533 ?auto_860538 ) ) ( not ( = ?auto_860533 ?auto_860539 ) ) ( not ( = ?auto_860533 ?auto_860540 ) ) ( not ( = ?auto_860533 ?auto_860541 ) ) ( not ( = ?auto_860534 ?auto_860535 ) ) ( not ( = ?auto_860534 ?auto_860536 ) ) ( not ( = ?auto_860534 ?auto_860537 ) ) ( not ( = ?auto_860534 ?auto_860538 ) ) ( not ( = ?auto_860534 ?auto_860539 ) ) ( not ( = ?auto_860534 ?auto_860540 ) ) ( not ( = ?auto_860534 ?auto_860541 ) ) ( not ( = ?auto_860535 ?auto_860536 ) ) ( not ( = ?auto_860535 ?auto_860537 ) ) ( not ( = ?auto_860535 ?auto_860538 ) ) ( not ( = ?auto_860535 ?auto_860539 ) ) ( not ( = ?auto_860535 ?auto_860540 ) ) ( not ( = ?auto_860535 ?auto_860541 ) ) ( not ( = ?auto_860536 ?auto_860537 ) ) ( not ( = ?auto_860536 ?auto_860538 ) ) ( not ( = ?auto_860536 ?auto_860539 ) ) ( not ( = ?auto_860536 ?auto_860540 ) ) ( not ( = ?auto_860536 ?auto_860541 ) ) ( not ( = ?auto_860537 ?auto_860538 ) ) ( not ( = ?auto_860537 ?auto_860539 ) ) ( not ( = ?auto_860537 ?auto_860540 ) ) ( not ( = ?auto_860537 ?auto_860541 ) ) ( not ( = ?auto_860538 ?auto_860539 ) ) ( not ( = ?auto_860538 ?auto_860540 ) ) ( not ( = ?auto_860538 ?auto_860541 ) ) ( not ( = ?auto_860539 ?auto_860540 ) ) ( not ( = ?auto_860539 ?auto_860541 ) ) ( not ( = ?auto_860540 ?auto_860541 ) ) ( ON ?auto_860539 ?auto_860540 ) ( ON ?auto_860538 ?auto_860539 ) ( CLEAR ?auto_860536 ) ( ON ?auto_860537 ?auto_860538 ) ( CLEAR ?auto_860537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_860524 ?auto_860525 ?auto_860526 ?auto_860527 ?auto_860528 ?auto_860529 ?auto_860530 ?auto_860531 ?auto_860532 ?auto_860533 ?auto_860534 ?auto_860535 ?auto_860536 ?auto_860537 )
      ( MAKE-17PILE ?auto_860524 ?auto_860525 ?auto_860526 ?auto_860527 ?auto_860528 ?auto_860529 ?auto_860530 ?auto_860531 ?auto_860532 ?auto_860533 ?auto_860534 ?auto_860535 ?auto_860536 ?auto_860537 ?auto_860538 ?auto_860539 ?auto_860540 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_860594 - BLOCK
      ?auto_860595 - BLOCK
      ?auto_860596 - BLOCK
      ?auto_860597 - BLOCK
      ?auto_860598 - BLOCK
      ?auto_860599 - BLOCK
      ?auto_860600 - BLOCK
      ?auto_860601 - BLOCK
      ?auto_860602 - BLOCK
      ?auto_860603 - BLOCK
      ?auto_860604 - BLOCK
      ?auto_860605 - BLOCK
      ?auto_860606 - BLOCK
      ?auto_860607 - BLOCK
      ?auto_860608 - BLOCK
      ?auto_860609 - BLOCK
      ?auto_860610 - BLOCK
    )
    :vars
    (
      ?auto_860611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_860610 ?auto_860611 ) ( ON-TABLE ?auto_860594 ) ( ON ?auto_860595 ?auto_860594 ) ( ON ?auto_860596 ?auto_860595 ) ( ON ?auto_860597 ?auto_860596 ) ( ON ?auto_860598 ?auto_860597 ) ( ON ?auto_860599 ?auto_860598 ) ( ON ?auto_860600 ?auto_860599 ) ( ON ?auto_860601 ?auto_860600 ) ( ON ?auto_860602 ?auto_860601 ) ( ON ?auto_860603 ?auto_860602 ) ( ON ?auto_860604 ?auto_860603 ) ( ON ?auto_860605 ?auto_860604 ) ( not ( = ?auto_860594 ?auto_860595 ) ) ( not ( = ?auto_860594 ?auto_860596 ) ) ( not ( = ?auto_860594 ?auto_860597 ) ) ( not ( = ?auto_860594 ?auto_860598 ) ) ( not ( = ?auto_860594 ?auto_860599 ) ) ( not ( = ?auto_860594 ?auto_860600 ) ) ( not ( = ?auto_860594 ?auto_860601 ) ) ( not ( = ?auto_860594 ?auto_860602 ) ) ( not ( = ?auto_860594 ?auto_860603 ) ) ( not ( = ?auto_860594 ?auto_860604 ) ) ( not ( = ?auto_860594 ?auto_860605 ) ) ( not ( = ?auto_860594 ?auto_860606 ) ) ( not ( = ?auto_860594 ?auto_860607 ) ) ( not ( = ?auto_860594 ?auto_860608 ) ) ( not ( = ?auto_860594 ?auto_860609 ) ) ( not ( = ?auto_860594 ?auto_860610 ) ) ( not ( = ?auto_860594 ?auto_860611 ) ) ( not ( = ?auto_860595 ?auto_860596 ) ) ( not ( = ?auto_860595 ?auto_860597 ) ) ( not ( = ?auto_860595 ?auto_860598 ) ) ( not ( = ?auto_860595 ?auto_860599 ) ) ( not ( = ?auto_860595 ?auto_860600 ) ) ( not ( = ?auto_860595 ?auto_860601 ) ) ( not ( = ?auto_860595 ?auto_860602 ) ) ( not ( = ?auto_860595 ?auto_860603 ) ) ( not ( = ?auto_860595 ?auto_860604 ) ) ( not ( = ?auto_860595 ?auto_860605 ) ) ( not ( = ?auto_860595 ?auto_860606 ) ) ( not ( = ?auto_860595 ?auto_860607 ) ) ( not ( = ?auto_860595 ?auto_860608 ) ) ( not ( = ?auto_860595 ?auto_860609 ) ) ( not ( = ?auto_860595 ?auto_860610 ) ) ( not ( = ?auto_860595 ?auto_860611 ) ) ( not ( = ?auto_860596 ?auto_860597 ) ) ( not ( = ?auto_860596 ?auto_860598 ) ) ( not ( = ?auto_860596 ?auto_860599 ) ) ( not ( = ?auto_860596 ?auto_860600 ) ) ( not ( = ?auto_860596 ?auto_860601 ) ) ( not ( = ?auto_860596 ?auto_860602 ) ) ( not ( = ?auto_860596 ?auto_860603 ) ) ( not ( = ?auto_860596 ?auto_860604 ) ) ( not ( = ?auto_860596 ?auto_860605 ) ) ( not ( = ?auto_860596 ?auto_860606 ) ) ( not ( = ?auto_860596 ?auto_860607 ) ) ( not ( = ?auto_860596 ?auto_860608 ) ) ( not ( = ?auto_860596 ?auto_860609 ) ) ( not ( = ?auto_860596 ?auto_860610 ) ) ( not ( = ?auto_860596 ?auto_860611 ) ) ( not ( = ?auto_860597 ?auto_860598 ) ) ( not ( = ?auto_860597 ?auto_860599 ) ) ( not ( = ?auto_860597 ?auto_860600 ) ) ( not ( = ?auto_860597 ?auto_860601 ) ) ( not ( = ?auto_860597 ?auto_860602 ) ) ( not ( = ?auto_860597 ?auto_860603 ) ) ( not ( = ?auto_860597 ?auto_860604 ) ) ( not ( = ?auto_860597 ?auto_860605 ) ) ( not ( = ?auto_860597 ?auto_860606 ) ) ( not ( = ?auto_860597 ?auto_860607 ) ) ( not ( = ?auto_860597 ?auto_860608 ) ) ( not ( = ?auto_860597 ?auto_860609 ) ) ( not ( = ?auto_860597 ?auto_860610 ) ) ( not ( = ?auto_860597 ?auto_860611 ) ) ( not ( = ?auto_860598 ?auto_860599 ) ) ( not ( = ?auto_860598 ?auto_860600 ) ) ( not ( = ?auto_860598 ?auto_860601 ) ) ( not ( = ?auto_860598 ?auto_860602 ) ) ( not ( = ?auto_860598 ?auto_860603 ) ) ( not ( = ?auto_860598 ?auto_860604 ) ) ( not ( = ?auto_860598 ?auto_860605 ) ) ( not ( = ?auto_860598 ?auto_860606 ) ) ( not ( = ?auto_860598 ?auto_860607 ) ) ( not ( = ?auto_860598 ?auto_860608 ) ) ( not ( = ?auto_860598 ?auto_860609 ) ) ( not ( = ?auto_860598 ?auto_860610 ) ) ( not ( = ?auto_860598 ?auto_860611 ) ) ( not ( = ?auto_860599 ?auto_860600 ) ) ( not ( = ?auto_860599 ?auto_860601 ) ) ( not ( = ?auto_860599 ?auto_860602 ) ) ( not ( = ?auto_860599 ?auto_860603 ) ) ( not ( = ?auto_860599 ?auto_860604 ) ) ( not ( = ?auto_860599 ?auto_860605 ) ) ( not ( = ?auto_860599 ?auto_860606 ) ) ( not ( = ?auto_860599 ?auto_860607 ) ) ( not ( = ?auto_860599 ?auto_860608 ) ) ( not ( = ?auto_860599 ?auto_860609 ) ) ( not ( = ?auto_860599 ?auto_860610 ) ) ( not ( = ?auto_860599 ?auto_860611 ) ) ( not ( = ?auto_860600 ?auto_860601 ) ) ( not ( = ?auto_860600 ?auto_860602 ) ) ( not ( = ?auto_860600 ?auto_860603 ) ) ( not ( = ?auto_860600 ?auto_860604 ) ) ( not ( = ?auto_860600 ?auto_860605 ) ) ( not ( = ?auto_860600 ?auto_860606 ) ) ( not ( = ?auto_860600 ?auto_860607 ) ) ( not ( = ?auto_860600 ?auto_860608 ) ) ( not ( = ?auto_860600 ?auto_860609 ) ) ( not ( = ?auto_860600 ?auto_860610 ) ) ( not ( = ?auto_860600 ?auto_860611 ) ) ( not ( = ?auto_860601 ?auto_860602 ) ) ( not ( = ?auto_860601 ?auto_860603 ) ) ( not ( = ?auto_860601 ?auto_860604 ) ) ( not ( = ?auto_860601 ?auto_860605 ) ) ( not ( = ?auto_860601 ?auto_860606 ) ) ( not ( = ?auto_860601 ?auto_860607 ) ) ( not ( = ?auto_860601 ?auto_860608 ) ) ( not ( = ?auto_860601 ?auto_860609 ) ) ( not ( = ?auto_860601 ?auto_860610 ) ) ( not ( = ?auto_860601 ?auto_860611 ) ) ( not ( = ?auto_860602 ?auto_860603 ) ) ( not ( = ?auto_860602 ?auto_860604 ) ) ( not ( = ?auto_860602 ?auto_860605 ) ) ( not ( = ?auto_860602 ?auto_860606 ) ) ( not ( = ?auto_860602 ?auto_860607 ) ) ( not ( = ?auto_860602 ?auto_860608 ) ) ( not ( = ?auto_860602 ?auto_860609 ) ) ( not ( = ?auto_860602 ?auto_860610 ) ) ( not ( = ?auto_860602 ?auto_860611 ) ) ( not ( = ?auto_860603 ?auto_860604 ) ) ( not ( = ?auto_860603 ?auto_860605 ) ) ( not ( = ?auto_860603 ?auto_860606 ) ) ( not ( = ?auto_860603 ?auto_860607 ) ) ( not ( = ?auto_860603 ?auto_860608 ) ) ( not ( = ?auto_860603 ?auto_860609 ) ) ( not ( = ?auto_860603 ?auto_860610 ) ) ( not ( = ?auto_860603 ?auto_860611 ) ) ( not ( = ?auto_860604 ?auto_860605 ) ) ( not ( = ?auto_860604 ?auto_860606 ) ) ( not ( = ?auto_860604 ?auto_860607 ) ) ( not ( = ?auto_860604 ?auto_860608 ) ) ( not ( = ?auto_860604 ?auto_860609 ) ) ( not ( = ?auto_860604 ?auto_860610 ) ) ( not ( = ?auto_860604 ?auto_860611 ) ) ( not ( = ?auto_860605 ?auto_860606 ) ) ( not ( = ?auto_860605 ?auto_860607 ) ) ( not ( = ?auto_860605 ?auto_860608 ) ) ( not ( = ?auto_860605 ?auto_860609 ) ) ( not ( = ?auto_860605 ?auto_860610 ) ) ( not ( = ?auto_860605 ?auto_860611 ) ) ( not ( = ?auto_860606 ?auto_860607 ) ) ( not ( = ?auto_860606 ?auto_860608 ) ) ( not ( = ?auto_860606 ?auto_860609 ) ) ( not ( = ?auto_860606 ?auto_860610 ) ) ( not ( = ?auto_860606 ?auto_860611 ) ) ( not ( = ?auto_860607 ?auto_860608 ) ) ( not ( = ?auto_860607 ?auto_860609 ) ) ( not ( = ?auto_860607 ?auto_860610 ) ) ( not ( = ?auto_860607 ?auto_860611 ) ) ( not ( = ?auto_860608 ?auto_860609 ) ) ( not ( = ?auto_860608 ?auto_860610 ) ) ( not ( = ?auto_860608 ?auto_860611 ) ) ( not ( = ?auto_860609 ?auto_860610 ) ) ( not ( = ?auto_860609 ?auto_860611 ) ) ( not ( = ?auto_860610 ?auto_860611 ) ) ( ON ?auto_860609 ?auto_860610 ) ( ON ?auto_860608 ?auto_860609 ) ( ON ?auto_860607 ?auto_860608 ) ( CLEAR ?auto_860605 ) ( ON ?auto_860606 ?auto_860607 ) ( CLEAR ?auto_860606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_860594 ?auto_860595 ?auto_860596 ?auto_860597 ?auto_860598 ?auto_860599 ?auto_860600 ?auto_860601 ?auto_860602 ?auto_860603 ?auto_860604 ?auto_860605 ?auto_860606 )
      ( MAKE-17PILE ?auto_860594 ?auto_860595 ?auto_860596 ?auto_860597 ?auto_860598 ?auto_860599 ?auto_860600 ?auto_860601 ?auto_860602 ?auto_860603 ?auto_860604 ?auto_860605 ?auto_860606 ?auto_860607 ?auto_860608 ?auto_860609 ?auto_860610 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_860664 - BLOCK
      ?auto_860665 - BLOCK
      ?auto_860666 - BLOCK
      ?auto_860667 - BLOCK
      ?auto_860668 - BLOCK
      ?auto_860669 - BLOCK
      ?auto_860670 - BLOCK
      ?auto_860671 - BLOCK
      ?auto_860672 - BLOCK
      ?auto_860673 - BLOCK
      ?auto_860674 - BLOCK
      ?auto_860675 - BLOCK
      ?auto_860676 - BLOCK
      ?auto_860677 - BLOCK
      ?auto_860678 - BLOCK
      ?auto_860679 - BLOCK
      ?auto_860680 - BLOCK
    )
    :vars
    (
      ?auto_860681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_860680 ?auto_860681 ) ( ON-TABLE ?auto_860664 ) ( ON ?auto_860665 ?auto_860664 ) ( ON ?auto_860666 ?auto_860665 ) ( ON ?auto_860667 ?auto_860666 ) ( ON ?auto_860668 ?auto_860667 ) ( ON ?auto_860669 ?auto_860668 ) ( ON ?auto_860670 ?auto_860669 ) ( ON ?auto_860671 ?auto_860670 ) ( ON ?auto_860672 ?auto_860671 ) ( ON ?auto_860673 ?auto_860672 ) ( ON ?auto_860674 ?auto_860673 ) ( not ( = ?auto_860664 ?auto_860665 ) ) ( not ( = ?auto_860664 ?auto_860666 ) ) ( not ( = ?auto_860664 ?auto_860667 ) ) ( not ( = ?auto_860664 ?auto_860668 ) ) ( not ( = ?auto_860664 ?auto_860669 ) ) ( not ( = ?auto_860664 ?auto_860670 ) ) ( not ( = ?auto_860664 ?auto_860671 ) ) ( not ( = ?auto_860664 ?auto_860672 ) ) ( not ( = ?auto_860664 ?auto_860673 ) ) ( not ( = ?auto_860664 ?auto_860674 ) ) ( not ( = ?auto_860664 ?auto_860675 ) ) ( not ( = ?auto_860664 ?auto_860676 ) ) ( not ( = ?auto_860664 ?auto_860677 ) ) ( not ( = ?auto_860664 ?auto_860678 ) ) ( not ( = ?auto_860664 ?auto_860679 ) ) ( not ( = ?auto_860664 ?auto_860680 ) ) ( not ( = ?auto_860664 ?auto_860681 ) ) ( not ( = ?auto_860665 ?auto_860666 ) ) ( not ( = ?auto_860665 ?auto_860667 ) ) ( not ( = ?auto_860665 ?auto_860668 ) ) ( not ( = ?auto_860665 ?auto_860669 ) ) ( not ( = ?auto_860665 ?auto_860670 ) ) ( not ( = ?auto_860665 ?auto_860671 ) ) ( not ( = ?auto_860665 ?auto_860672 ) ) ( not ( = ?auto_860665 ?auto_860673 ) ) ( not ( = ?auto_860665 ?auto_860674 ) ) ( not ( = ?auto_860665 ?auto_860675 ) ) ( not ( = ?auto_860665 ?auto_860676 ) ) ( not ( = ?auto_860665 ?auto_860677 ) ) ( not ( = ?auto_860665 ?auto_860678 ) ) ( not ( = ?auto_860665 ?auto_860679 ) ) ( not ( = ?auto_860665 ?auto_860680 ) ) ( not ( = ?auto_860665 ?auto_860681 ) ) ( not ( = ?auto_860666 ?auto_860667 ) ) ( not ( = ?auto_860666 ?auto_860668 ) ) ( not ( = ?auto_860666 ?auto_860669 ) ) ( not ( = ?auto_860666 ?auto_860670 ) ) ( not ( = ?auto_860666 ?auto_860671 ) ) ( not ( = ?auto_860666 ?auto_860672 ) ) ( not ( = ?auto_860666 ?auto_860673 ) ) ( not ( = ?auto_860666 ?auto_860674 ) ) ( not ( = ?auto_860666 ?auto_860675 ) ) ( not ( = ?auto_860666 ?auto_860676 ) ) ( not ( = ?auto_860666 ?auto_860677 ) ) ( not ( = ?auto_860666 ?auto_860678 ) ) ( not ( = ?auto_860666 ?auto_860679 ) ) ( not ( = ?auto_860666 ?auto_860680 ) ) ( not ( = ?auto_860666 ?auto_860681 ) ) ( not ( = ?auto_860667 ?auto_860668 ) ) ( not ( = ?auto_860667 ?auto_860669 ) ) ( not ( = ?auto_860667 ?auto_860670 ) ) ( not ( = ?auto_860667 ?auto_860671 ) ) ( not ( = ?auto_860667 ?auto_860672 ) ) ( not ( = ?auto_860667 ?auto_860673 ) ) ( not ( = ?auto_860667 ?auto_860674 ) ) ( not ( = ?auto_860667 ?auto_860675 ) ) ( not ( = ?auto_860667 ?auto_860676 ) ) ( not ( = ?auto_860667 ?auto_860677 ) ) ( not ( = ?auto_860667 ?auto_860678 ) ) ( not ( = ?auto_860667 ?auto_860679 ) ) ( not ( = ?auto_860667 ?auto_860680 ) ) ( not ( = ?auto_860667 ?auto_860681 ) ) ( not ( = ?auto_860668 ?auto_860669 ) ) ( not ( = ?auto_860668 ?auto_860670 ) ) ( not ( = ?auto_860668 ?auto_860671 ) ) ( not ( = ?auto_860668 ?auto_860672 ) ) ( not ( = ?auto_860668 ?auto_860673 ) ) ( not ( = ?auto_860668 ?auto_860674 ) ) ( not ( = ?auto_860668 ?auto_860675 ) ) ( not ( = ?auto_860668 ?auto_860676 ) ) ( not ( = ?auto_860668 ?auto_860677 ) ) ( not ( = ?auto_860668 ?auto_860678 ) ) ( not ( = ?auto_860668 ?auto_860679 ) ) ( not ( = ?auto_860668 ?auto_860680 ) ) ( not ( = ?auto_860668 ?auto_860681 ) ) ( not ( = ?auto_860669 ?auto_860670 ) ) ( not ( = ?auto_860669 ?auto_860671 ) ) ( not ( = ?auto_860669 ?auto_860672 ) ) ( not ( = ?auto_860669 ?auto_860673 ) ) ( not ( = ?auto_860669 ?auto_860674 ) ) ( not ( = ?auto_860669 ?auto_860675 ) ) ( not ( = ?auto_860669 ?auto_860676 ) ) ( not ( = ?auto_860669 ?auto_860677 ) ) ( not ( = ?auto_860669 ?auto_860678 ) ) ( not ( = ?auto_860669 ?auto_860679 ) ) ( not ( = ?auto_860669 ?auto_860680 ) ) ( not ( = ?auto_860669 ?auto_860681 ) ) ( not ( = ?auto_860670 ?auto_860671 ) ) ( not ( = ?auto_860670 ?auto_860672 ) ) ( not ( = ?auto_860670 ?auto_860673 ) ) ( not ( = ?auto_860670 ?auto_860674 ) ) ( not ( = ?auto_860670 ?auto_860675 ) ) ( not ( = ?auto_860670 ?auto_860676 ) ) ( not ( = ?auto_860670 ?auto_860677 ) ) ( not ( = ?auto_860670 ?auto_860678 ) ) ( not ( = ?auto_860670 ?auto_860679 ) ) ( not ( = ?auto_860670 ?auto_860680 ) ) ( not ( = ?auto_860670 ?auto_860681 ) ) ( not ( = ?auto_860671 ?auto_860672 ) ) ( not ( = ?auto_860671 ?auto_860673 ) ) ( not ( = ?auto_860671 ?auto_860674 ) ) ( not ( = ?auto_860671 ?auto_860675 ) ) ( not ( = ?auto_860671 ?auto_860676 ) ) ( not ( = ?auto_860671 ?auto_860677 ) ) ( not ( = ?auto_860671 ?auto_860678 ) ) ( not ( = ?auto_860671 ?auto_860679 ) ) ( not ( = ?auto_860671 ?auto_860680 ) ) ( not ( = ?auto_860671 ?auto_860681 ) ) ( not ( = ?auto_860672 ?auto_860673 ) ) ( not ( = ?auto_860672 ?auto_860674 ) ) ( not ( = ?auto_860672 ?auto_860675 ) ) ( not ( = ?auto_860672 ?auto_860676 ) ) ( not ( = ?auto_860672 ?auto_860677 ) ) ( not ( = ?auto_860672 ?auto_860678 ) ) ( not ( = ?auto_860672 ?auto_860679 ) ) ( not ( = ?auto_860672 ?auto_860680 ) ) ( not ( = ?auto_860672 ?auto_860681 ) ) ( not ( = ?auto_860673 ?auto_860674 ) ) ( not ( = ?auto_860673 ?auto_860675 ) ) ( not ( = ?auto_860673 ?auto_860676 ) ) ( not ( = ?auto_860673 ?auto_860677 ) ) ( not ( = ?auto_860673 ?auto_860678 ) ) ( not ( = ?auto_860673 ?auto_860679 ) ) ( not ( = ?auto_860673 ?auto_860680 ) ) ( not ( = ?auto_860673 ?auto_860681 ) ) ( not ( = ?auto_860674 ?auto_860675 ) ) ( not ( = ?auto_860674 ?auto_860676 ) ) ( not ( = ?auto_860674 ?auto_860677 ) ) ( not ( = ?auto_860674 ?auto_860678 ) ) ( not ( = ?auto_860674 ?auto_860679 ) ) ( not ( = ?auto_860674 ?auto_860680 ) ) ( not ( = ?auto_860674 ?auto_860681 ) ) ( not ( = ?auto_860675 ?auto_860676 ) ) ( not ( = ?auto_860675 ?auto_860677 ) ) ( not ( = ?auto_860675 ?auto_860678 ) ) ( not ( = ?auto_860675 ?auto_860679 ) ) ( not ( = ?auto_860675 ?auto_860680 ) ) ( not ( = ?auto_860675 ?auto_860681 ) ) ( not ( = ?auto_860676 ?auto_860677 ) ) ( not ( = ?auto_860676 ?auto_860678 ) ) ( not ( = ?auto_860676 ?auto_860679 ) ) ( not ( = ?auto_860676 ?auto_860680 ) ) ( not ( = ?auto_860676 ?auto_860681 ) ) ( not ( = ?auto_860677 ?auto_860678 ) ) ( not ( = ?auto_860677 ?auto_860679 ) ) ( not ( = ?auto_860677 ?auto_860680 ) ) ( not ( = ?auto_860677 ?auto_860681 ) ) ( not ( = ?auto_860678 ?auto_860679 ) ) ( not ( = ?auto_860678 ?auto_860680 ) ) ( not ( = ?auto_860678 ?auto_860681 ) ) ( not ( = ?auto_860679 ?auto_860680 ) ) ( not ( = ?auto_860679 ?auto_860681 ) ) ( not ( = ?auto_860680 ?auto_860681 ) ) ( ON ?auto_860679 ?auto_860680 ) ( ON ?auto_860678 ?auto_860679 ) ( ON ?auto_860677 ?auto_860678 ) ( ON ?auto_860676 ?auto_860677 ) ( CLEAR ?auto_860674 ) ( ON ?auto_860675 ?auto_860676 ) ( CLEAR ?auto_860675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_860664 ?auto_860665 ?auto_860666 ?auto_860667 ?auto_860668 ?auto_860669 ?auto_860670 ?auto_860671 ?auto_860672 ?auto_860673 ?auto_860674 ?auto_860675 )
      ( MAKE-17PILE ?auto_860664 ?auto_860665 ?auto_860666 ?auto_860667 ?auto_860668 ?auto_860669 ?auto_860670 ?auto_860671 ?auto_860672 ?auto_860673 ?auto_860674 ?auto_860675 ?auto_860676 ?auto_860677 ?auto_860678 ?auto_860679 ?auto_860680 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_860734 - BLOCK
      ?auto_860735 - BLOCK
      ?auto_860736 - BLOCK
      ?auto_860737 - BLOCK
      ?auto_860738 - BLOCK
      ?auto_860739 - BLOCK
      ?auto_860740 - BLOCK
      ?auto_860741 - BLOCK
      ?auto_860742 - BLOCK
      ?auto_860743 - BLOCK
      ?auto_860744 - BLOCK
      ?auto_860745 - BLOCK
      ?auto_860746 - BLOCK
      ?auto_860747 - BLOCK
      ?auto_860748 - BLOCK
      ?auto_860749 - BLOCK
      ?auto_860750 - BLOCK
    )
    :vars
    (
      ?auto_860751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_860750 ?auto_860751 ) ( ON-TABLE ?auto_860734 ) ( ON ?auto_860735 ?auto_860734 ) ( ON ?auto_860736 ?auto_860735 ) ( ON ?auto_860737 ?auto_860736 ) ( ON ?auto_860738 ?auto_860737 ) ( ON ?auto_860739 ?auto_860738 ) ( ON ?auto_860740 ?auto_860739 ) ( ON ?auto_860741 ?auto_860740 ) ( ON ?auto_860742 ?auto_860741 ) ( ON ?auto_860743 ?auto_860742 ) ( not ( = ?auto_860734 ?auto_860735 ) ) ( not ( = ?auto_860734 ?auto_860736 ) ) ( not ( = ?auto_860734 ?auto_860737 ) ) ( not ( = ?auto_860734 ?auto_860738 ) ) ( not ( = ?auto_860734 ?auto_860739 ) ) ( not ( = ?auto_860734 ?auto_860740 ) ) ( not ( = ?auto_860734 ?auto_860741 ) ) ( not ( = ?auto_860734 ?auto_860742 ) ) ( not ( = ?auto_860734 ?auto_860743 ) ) ( not ( = ?auto_860734 ?auto_860744 ) ) ( not ( = ?auto_860734 ?auto_860745 ) ) ( not ( = ?auto_860734 ?auto_860746 ) ) ( not ( = ?auto_860734 ?auto_860747 ) ) ( not ( = ?auto_860734 ?auto_860748 ) ) ( not ( = ?auto_860734 ?auto_860749 ) ) ( not ( = ?auto_860734 ?auto_860750 ) ) ( not ( = ?auto_860734 ?auto_860751 ) ) ( not ( = ?auto_860735 ?auto_860736 ) ) ( not ( = ?auto_860735 ?auto_860737 ) ) ( not ( = ?auto_860735 ?auto_860738 ) ) ( not ( = ?auto_860735 ?auto_860739 ) ) ( not ( = ?auto_860735 ?auto_860740 ) ) ( not ( = ?auto_860735 ?auto_860741 ) ) ( not ( = ?auto_860735 ?auto_860742 ) ) ( not ( = ?auto_860735 ?auto_860743 ) ) ( not ( = ?auto_860735 ?auto_860744 ) ) ( not ( = ?auto_860735 ?auto_860745 ) ) ( not ( = ?auto_860735 ?auto_860746 ) ) ( not ( = ?auto_860735 ?auto_860747 ) ) ( not ( = ?auto_860735 ?auto_860748 ) ) ( not ( = ?auto_860735 ?auto_860749 ) ) ( not ( = ?auto_860735 ?auto_860750 ) ) ( not ( = ?auto_860735 ?auto_860751 ) ) ( not ( = ?auto_860736 ?auto_860737 ) ) ( not ( = ?auto_860736 ?auto_860738 ) ) ( not ( = ?auto_860736 ?auto_860739 ) ) ( not ( = ?auto_860736 ?auto_860740 ) ) ( not ( = ?auto_860736 ?auto_860741 ) ) ( not ( = ?auto_860736 ?auto_860742 ) ) ( not ( = ?auto_860736 ?auto_860743 ) ) ( not ( = ?auto_860736 ?auto_860744 ) ) ( not ( = ?auto_860736 ?auto_860745 ) ) ( not ( = ?auto_860736 ?auto_860746 ) ) ( not ( = ?auto_860736 ?auto_860747 ) ) ( not ( = ?auto_860736 ?auto_860748 ) ) ( not ( = ?auto_860736 ?auto_860749 ) ) ( not ( = ?auto_860736 ?auto_860750 ) ) ( not ( = ?auto_860736 ?auto_860751 ) ) ( not ( = ?auto_860737 ?auto_860738 ) ) ( not ( = ?auto_860737 ?auto_860739 ) ) ( not ( = ?auto_860737 ?auto_860740 ) ) ( not ( = ?auto_860737 ?auto_860741 ) ) ( not ( = ?auto_860737 ?auto_860742 ) ) ( not ( = ?auto_860737 ?auto_860743 ) ) ( not ( = ?auto_860737 ?auto_860744 ) ) ( not ( = ?auto_860737 ?auto_860745 ) ) ( not ( = ?auto_860737 ?auto_860746 ) ) ( not ( = ?auto_860737 ?auto_860747 ) ) ( not ( = ?auto_860737 ?auto_860748 ) ) ( not ( = ?auto_860737 ?auto_860749 ) ) ( not ( = ?auto_860737 ?auto_860750 ) ) ( not ( = ?auto_860737 ?auto_860751 ) ) ( not ( = ?auto_860738 ?auto_860739 ) ) ( not ( = ?auto_860738 ?auto_860740 ) ) ( not ( = ?auto_860738 ?auto_860741 ) ) ( not ( = ?auto_860738 ?auto_860742 ) ) ( not ( = ?auto_860738 ?auto_860743 ) ) ( not ( = ?auto_860738 ?auto_860744 ) ) ( not ( = ?auto_860738 ?auto_860745 ) ) ( not ( = ?auto_860738 ?auto_860746 ) ) ( not ( = ?auto_860738 ?auto_860747 ) ) ( not ( = ?auto_860738 ?auto_860748 ) ) ( not ( = ?auto_860738 ?auto_860749 ) ) ( not ( = ?auto_860738 ?auto_860750 ) ) ( not ( = ?auto_860738 ?auto_860751 ) ) ( not ( = ?auto_860739 ?auto_860740 ) ) ( not ( = ?auto_860739 ?auto_860741 ) ) ( not ( = ?auto_860739 ?auto_860742 ) ) ( not ( = ?auto_860739 ?auto_860743 ) ) ( not ( = ?auto_860739 ?auto_860744 ) ) ( not ( = ?auto_860739 ?auto_860745 ) ) ( not ( = ?auto_860739 ?auto_860746 ) ) ( not ( = ?auto_860739 ?auto_860747 ) ) ( not ( = ?auto_860739 ?auto_860748 ) ) ( not ( = ?auto_860739 ?auto_860749 ) ) ( not ( = ?auto_860739 ?auto_860750 ) ) ( not ( = ?auto_860739 ?auto_860751 ) ) ( not ( = ?auto_860740 ?auto_860741 ) ) ( not ( = ?auto_860740 ?auto_860742 ) ) ( not ( = ?auto_860740 ?auto_860743 ) ) ( not ( = ?auto_860740 ?auto_860744 ) ) ( not ( = ?auto_860740 ?auto_860745 ) ) ( not ( = ?auto_860740 ?auto_860746 ) ) ( not ( = ?auto_860740 ?auto_860747 ) ) ( not ( = ?auto_860740 ?auto_860748 ) ) ( not ( = ?auto_860740 ?auto_860749 ) ) ( not ( = ?auto_860740 ?auto_860750 ) ) ( not ( = ?auto_860740 ?auto_860751 ) ) ( not ( = ?auto_860741 ?auto_860742 ) ) ( not ( = ?auto_860741 ?auto_860743 ) ) ( not ( = ?auto_860741 ?auto_860744 ) ) ( not ( = ?auto_860741 ?auto_860745 ) ) ( not ( = ?auto_860741 ?auto_860746 ) ) ( not ( = ?auto_860741 ?auto_860747 ) ) ( not ( = ?auto_860741 ?auto_860748 ) ) ( not ( = ?auto_860741 ?auto_860749 ) ) ( not ( = ?auto_860741 ?auto_860750 ) ) ( not ( = ?auto_860741 ?auto_860751 ) ) ( not ( = ?auto_860742 ?auto_860743 ) ) ( not ( = ?auto_860742 ?auto_860744 ) ) ( not ( = ?auto_860742 ?auto_860745 ) ) ( not ( = ?auto_860742 ?auto_860746 ) ) ( not ( = ?auto_860742 ?auto_860747 ) ) ( not ( = ?auto_860742 ?auto_860748 ) ) ( not ( = ?auto_860742 ?auto_860749 ) ) ( not ( = ?auto_860742 ?auto_860750 ) ) ( not ( = ?auto_860742 ?auto_860751 ) ) ( not ( = ?auto_860743 ?auto_860744 ) ) ( not ( = ?auto_860743 ?auto_860745 ) ) ( not ( = ?auto_860743 ?auto_860746 ) ) ( not ( = ?auto_860743 ?auto_860747 ) ) ( not ( = ?auto_860743 ?auto_860748 ) ) ( not ( = ?auto_860743 ?auto_860749 ) ) ( not ( = ?auto_860743 ?auto_860750 ) ) ( not ( = ?auto_860743 ?auto_860751 ) ) ( not ( = ?auto_860744 ?auto_860745 ) ) ( not ( = ?auto_860744 ?auto_860746 ) ) ( not ( = ?auto_860744 ?auto_860747 ) ) ( not ( = ?auto_860744 ?auto_860748 ) ) ( not ( = ?auto_860744 ?auto_860749 ) ) ( not ( = ?auto_860744 ?auto_860750 ) ) ( not ( = ?auto_860744 ?auto_860751 ) ) ( not ( = ?auto_860745 ?auto_860746 ) ) ( not ( = ?auto_860745 ?auto_860747 ) ) ( not ( = ?auto_860745 ?auto_860748 ) ) ( not ( = ?auto_860745 ?auto_860749 ) ) ( not ( = ?auto_860745 ?auto_860750 ) ) ( not ( = ?auto_860745 ?auto_860751 ) ) ( not ( = ?auto_860746 ?auto_860747 ) ) ( not ( = ?auto_860746 ?auto_860748 ) ) ( not ( = ?auto_860746 ?auto_860749 ) ) ( not ( = ?auto_860746 ?auto_860750 ) ) ( not ( = ?auto_860746 ?auto_860751 ) ) ( not ( = ?auto_860747 ?auto_860748 ) ) ( not ( = ?auto_860747 ?auto_860749 ) ) ( not ( = ?auto_860747 ?auto_860750 ) ) ( not ( = ?auto_860747 ?auto_860751 ) ) ( not ( = ?auto_860748 ?auto_860749 ) ) ( not ( = ?auto_860748 ?auto_860750 ) ) ( not ( = ?auto_860748 ?auto_860751 ) ) ( not ( = ?auto_860749 ?auto_860750 ) ) ( not ( = ?auto_860749 ?auto_860751 ) ) ( not ( = ?auto_860750 ?auto_860751 ) ) ( ON ?auto_860749 ?auto_860750 ) ( ON ?auto_860748 ?auto_860749 ) ( ON ?auto_860747 ?auto_860748 ) ( ON ?auto_860746 ?auto_860747 ) ( ON ?auto_860745 ?auto_860746 ) ( CLEAR ?auto_860743 ) ( ON ?auto_860744 ?auto_860745 ) ( CLEAR ?auto_860744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_860734 ?auto_860735 ?auto_860736 ?auto_860737 ?auto_860738 ?auto_860739 ?auto_860740 ?auto_860741 ?auto_860742 ?auto_860743 ?auto_860744 )
      ( MAKE-17PILE ?auto_860734 ?auto_860735 ?auto_860736 ?auto_860737 ?auto_860738 ?auto_860739 ?auto_860740 ?auto_860741 ?auto_860742 ?auto_860743 ?auto_860744 ?auto_860745 ?auto_860746 ?auto_860747 ?auto_860748 ?auto_860749 ?auto_860750 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_860804 - BLOCK
      ?auto_860805 - BLOCK
      ?auto_860806 - BLOCK
      ?auto_860807 - BLOCK
      ?auto_860808 - BLOCK
      ?auto_860809 - BLOCK
      ?auto_860810 - BLOCK
      ?auto_860811 - BLOCK
      ?auto_860812 - BLOCK
      ?auto_860813 - BLOCK
      ?auto_860814 - BLOCK
      ?auto_860815 - BLOCK
      ?auto_860816 - BLOCK
      ?auto_860817 - BLOCK
      ?auto_860818 - BLOCK
      ?auto_860819 - BLOCK
      ?auto_860820 - BLOCK
    )
    :vars
    (
      ?auto_860821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_860820 ?auto_860821 ) ( ON-TABLE ?auto_860804 ) ( ON ?auto_860805 ?auto_860804 ) ( ON ?auto_860806 ?auto_860805 ) ( ON ?auto_860807 ?auto_860806 ) ( ON ?auto_860808 ?auto_860807 ) ( ON ?auto_860809 ?auto_860808 ) ( ON ?auto_860810 ?auto_860809 ) ( ON ?auto_860811 ?auto_860810 ) ( ON ?auto_860812 ?auto_860811 ) ( not ( = ?auto_860804 ?auto_860805 ) ) ( not ( = ?auto_860804 ?auto_860806 ) ) ( not ( = ?auto_860804 ?auto_860807 ) ) ( not ( = ?auto_860804 ?auto_860808 ) ) ( not ( = ?auto_860804 ?auto_860809 ) ) ( not ( = ?auto_860804 ?auto_860810 ) ) ( not ( = ?auto_860804 ?auto_860811 ) ) ( not ( = ?auto_860804 ?auto_860812 ) ) ( not ( = ?auto_860804 ?auto_860813 ) ) ( not ( = ?auto_860804 ?auto_860814 ) ) ( not ( = ?auto_860804 ?auto_860815 ) ) ( not ( = ?auto_860804 ?auto_860816 ) ) ( not ( = ?auto_860804 ?auto_860817 ) ) ( not ( = ?auto_860804 ?auto_860818 ) ) ( not ( = ?auto_860804 ?auto_860819 ) ) ( not ( = ?auto_860804 ?auto_860820 ) ) ( not ( = ?auto_860804 ?auto_860821 ) ) ( not ( = ?auto_860805 ?auto_860806 ) ) ( not ( = ?auto_860805 ?auto_860807 ) ) ( not ( = ?auto_860805 ?auto_860808 ) ) ( not ( = ?auto_860805 ?auto_860809 ) ) ( not ( = ?auto_860805 ?auto_860810 ) ) ( not ( = ?auto_860805 ?auto_860811 ) ) ( not ( = ?auto_860805 ?auto_860812 ) ) ( not ( = ?auto_860805 ?auto_860813 ) ) ( not ( = ?auto_860805 ?auto_860814 ) ) ( not ( = ?auto_860805 ?auto_860815 ) ) ( not ( = ?auto_860805 ?auto_860816 ) ) ( not ( = ?auto_860805 ?auto_860817 ) ) ( not ( = ?auto_860805 ?auto_860818 ) ) ( not ( = ?auto_860805 ?auto_860819 ) ) ( not ( = ?auto_860805 ?auto_860820 ) ) ( not ( = ?auto_860805 ?auto_860821 ) ) ( not ( = ?auto_860806 ?auto_860807 ) ) ( not ( = ?auto_860806 ?auto_860808 ) ) ( not ( = ?auto_860806 ?auto_860809 ) ) ( not ( = ?auto_860806 ?auto_860810 ) ) ( not ( = ?auto_860806 ?auto_860811 ) ) ( not ( = ?auto_860806 ?auto_860812 ) ) ( not ( = ?auto_860806 ?auto_860813 ) ) ( not ( = ?auto_860806 ?auto_860814 ) ) ( not ( = ?auto_860806 ?auto_860815 ) ) ( not ( = ?auto_860806 ?auto_860816 ) ) ( not ( = ?auto_860806 ?auto_860817 ) ) ( not ( = ?auto_860806 ?auto_860818 ) ) ( not ( = ?auto_860806 ?auto_860819 ) ) ( not ( = ?auto_860806 ?auto_860820 ) ) ( not ( = ?auto_860806 ?auto_860821 ) ) ( not ( = ?auto_860807 ?auto_860808 ) ) ( not ( = ?auto_860807 ?auto_860809 ) ) ( not ( = ?auto_860807 ?auto_860810 ) ) ( not ( = ?auto_860807 ?auto_860811 ) ) ( not ( = ?auto_860807 ?auto_860812 ) ) ( not ( = ?auto_860807 ?auto_860813 ) ) ( not ( = ?auto_860807 ?auto_860814 ) ) ( not ( = ?auto_860807 ?auto_860815 ) ) ( not ( = ?auto_860807 ?auto_860816 ) ) ( not ( = ?auto_860807 ?auto_860817 ) ) ( not ( = ?auto_860807 ?auto_860818 ) ) ( not ( = ?auto_860807 ?auto_860819 ) ) ( not ( = ?auto_860807 ?auto_860820 ) ) ( not ( = ?auto_860807 ?auto_860821 ) ) ( not ( = ?auto_860808 ?auto_860809 ) ) ( not ( = ?auto_860808 ?auto_860810 ) ) ( not ( = ?auto_860808 ?auto_860811 ) ) ( not ( = ?auto_860808 ?auto_860812 ) ) ( not ( = ?auto_860808 ?auto_860813 ) ) ( not ( = ?auto_860808 ?auto_860814 ) ) ( not ( = ?auto_860808 ?auto_860815 ) ) ( not ( = ?auto_860808 ?auto_860816 ) ) ( not ( = ?auto_860808 ?auto_860817 ) ) ( not ( = ?auto_860808 ?auto_860818 ) ) ( not ( = ?auto_860808 ?auto_860819 ) ) ( not ( = ?auto_860808 ?auto_860820 ) ) ( not ( = ?auto_860808 ?auto_860821 ) ) ( not ( = ?auto_860809 ?auto_860810 ) ) ( not ( = ?auto_860809 ?auto_860811 ) ) ( not ( = ?auto_860809 ?auto_860812 ) ) ( not ( = ?auto_860809 ?auto_860813 ) ) ( not ( = ?auto_860809 ?auto_860814 ) ) ( not ( = ?auto_860809 ?auto_860815 ) ) ( not ( = ?auto_860809 ?auto_860816 ) ) ( not ( = ?auto_860809 ?auto_860817 ) ) ( not ( = ?auto_860809 ?auto_860818 ) ) ( not ( = ?auto_860809 ?auto_860819 ) ) ( not ( = ?auto_860809 ?auto_860820 ) ) ( not ( = ?auto_860809 ?auto_860821 ) ) ( not ( = ?auto_860810 ?auto_860811 ) ) ( not ( = ?auto_860810 ?auto_860812 ) ) ( not ( = ?auto_860810 ?auto_860813 ) ) ( not ( = ?auto_860810 ?auto_860814 ) ) ( not ( = ?auto_860810 ?auto_860815 ) ) ( not ( = ?auto_860810 ?auto_860816 ) ) ( not ( = ?auto_860810 ?auto_860817 ) ) ( not ( = ?auto_860810 ?auto_860818 ) ) ( not ( = ?auto_860810 ?auto_860819 ) ) ( not ( = ?auto_860810 ?auto_860820 ) ) ( not ( = ?auto_860810 ?auto_860821 ) ) ( not ( = ?auto_860811 ?auto_860812 ) ) ( not ( = ?auto_860811 ?auto_860813 ) ) ( not ( = ?auto_860811 ?auto_860814 ) ) ( not ( = ?auto_860811 ?auto_860815 ) ) ( not ( = ?auto_860811 ?auto_860816 ) ) ( not ( = ?auto_860811 ?auto_860817 ) ) ( not ( = ?auto_860811 ?auto_860818 ) ) ( not ( = ?auto_860811 ?auto_860819 ) ) ( not ( = ?auto_860811 ?auto_860820 ) ) ( not ( = ?auto_860811 ?auto_860821 ) ) ( not ( = ?auto_860812 ?auto_860813 ) ) ( not ( = ?auto_860812 ?auto_860814 ) ) ( not ( = ?auto_860812 ?auto_860815 ) ) ( not ( = ?auto_860812 ?auto_860816 ) ) ( not ( = ?auto_860812 ?auto_860817 ) ) ( not ( = ?auto_860812 ?auto_860818 ) ) ( not ( = ?auto_860812 ?auto_860819 ) ) ( not ( = ?auto_860812 ?auto_860820 ) ) ( not ( = ?auto_860812 ?auto_860821 ) ) ( not ( = ?auto_860813 ?auto_860814 ) ) ( not ( = ?auto_860813 ?auto_860815 ) ) ( not ( = ?auto_860813 ?auto_860816 ) ) ( not ( = ?auto_860813 ?auto_860817 ) ) ( not ( = ?auto_860813 ?auto_860818 ) ) ( not ( = ?auto_860813 ?auto_860819 ) ) ( not ( = ?auto_860813 ?auto_860820 ) ) ( not ( = ?auto_860813 ?auto_860821 ) ) ( not ( = ?auto_860814 ?auto_860815 ) ) ( not ( = ?auto_860814 ?auto_860816 ) ) ( not ( = ?auto_860814 ?auto_860817 ) ) ( not ( = ?auto_860814 ?auto_860818 ) ) ( not ( = ?auto_860814 ?auto_860819 ) ) ( not ( = ?auto_860814 ?auto_860820 ) ) ( not ( = ?auto_860814 ?auto_860821 ) ) ( not ( = ?auto_860815 ?auto_860816 ) ) ( not ( = ?auto_860815 ?auto_860817 ) ) ( not ( = ?auto_860815 ?auto_860818 ) ) ( not ( = ?auto_860815 ?auto_860819 ) ) ( not ( = ?auto_860815 ?auto_860820 ) ) ( not ( = ?auto_860815 ?auto_860821 ) ) ( not ( = ?auto_860816 ?auto_860817 ) ) ( not ( = ?auto_860816 ?auto_860818 ) ) ( not ( = ?auto_860816 ?auto_860819 ) ) ( not ( = ?auto_860816 ?auto_860820 ) ) ( not ( = ?auto_860816 ?auto_860821 ) ) ( not ( = ?auto_860817 ?auto_860818 ) ) ( not ( = ?auto_860817 ?auto_860819 ) ) ( not ( = ?auto_860817 ?auto_860820 ) ) ( not ( = ?auto_860817 ?auto_860821 ) ) ( not ( = ?auto_860818 ?auto_860819 ) ) ( not ( = ?auto_860818 ?auto_860820 ) ) ( not ( = ?auto_860818 ?auto_860821 ) ) ( not ( = ?auto_860819 ?auto_860820 ) ) ( not ( = ?auto_860819 ?auto_860821 ) ) ( not ( = ?auto_860820 ?auto_860821 ) ) ( ON ?auto_860819 ?auto_860820 ) ( ON ?auto_860818 ?auto_860819 ) ( ON ?auto_860817 ?auto_860818 ) ( ON ?auto_860816 ?auto_860817 ) ( ON ?auto_860815 ?auto_860816 ) ( ON ?auto_860814 ?auto_860815 ) ( CLEAR ?auto_860812 ) ( ON ?auto_860813 ?auto_860814 ) ( CLEAR ?auto_860813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_860804 ?auto_860805 ?auto_860806 ?auto_860807 ?auto_860808 ?auto_860809 ?auto_860810 ?auto_860811 ?auto_860812 ?auto_860813 )
      ( MAKE-17PILE ?auto_860804 ?auto_860805 ?auto_860806 ?auto_860807 ?auto_860808 ?auto_860809 ?auto_860810 ?auto_860811 ?auto_860812 ?auto_860813 ?auto_860814 ?auto_860815 ?auto_860816 ?auto_860817 ?auto_860818 ?auto_860819 ?auto_860820 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_860874 - BLOCK
      ?auto_860875 - BLOCK
      ?auto_860876 - BLOCK
      ?auto_860877 - BLOCK
      ?auto_860878 - BLOCK
      ?auto_860879 - BLOCK
      ?auto_860880 - BLOCK
      ?auto_860881 - BLOCK
      ?auto_860882 - BLOCK
      ?auto_860883 - BLOCK
      ?auto_860884 - BLOCK
      ?auto_860885 - BLOCK
      ?auto_860886 - BLOCK
      ?auto_860887 - BLOCK
      ?auto_860888 - BLOCK
      ?auto_860889 - BLOCK
      ?auto_860890 - BLOCK
    )
    :vars
    (
      ?auto_860891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_860890 ?auto_860891 ) ( ON-TABLE ?auto_860874 ) ( ON ?auto_860875 ?auto_860874 ) ( ON ?auto_860876 ?auto_860875 ) ( ON ?auto_860877 ?auto_860876 ) ( ON ?auto_860878 ?auto_860877 ) ( ON ?auto_860879 ?auto_860878 ) ( ON ?auto_860880 ?auto_860879 ) ( ON ?auto_860881 ?auto_860880 ) ( not ( = ?auto_860874 ?auto_860875 ) ) ( not ( = ?auto_860874 ?auto_860876 ) ) ( not ( = ?auto_860874 ?auto_860877 ) ) ( not ( = ?auto_860874 ?auto_860878 ) ) ( not ( = ?auto_860874 ?auto_860879 ) ) ( not ( = ?auto_860874 ?auto_860880 ) ) ( not ( = ?auto_860874 ?auto_860881 ) ) ( not ( = ?auto_860874 ?auto_860882 ) ) ( not ( = ?auto_860874 ?auto_860883 ) ) ( not ( = ?auto_860874 ?auto_860884 ) ) ( not ( = ?auto_860874 ?auto_860885 ) ) ( not ( = ?auto_860874 ?auto_860886 ) ) ( not ( = ?auto_860874 ?auto_860887 ) ) ( not ( = ?auto_860874 ?auto_860888 ) ) ( not ( = ?auto_860874 ?auto_860889 ) ) ( not ( = ?auto_860874 ?auto_860890 ) ) ( not ( = ?auto_860874 ?auto_860891 ) ) ( not ( = ?auto_860875 ?auto_860876 ) ) ( not ( = ?auto_860875 ?auto_860877 ) ) ( not ( = ?auto_860875 ?auto_860878 ) ) ( not ( = ?auto_860875 ?auto_860879 ) ) ( not ( = ?auto_860875 ?auto_860880 ) ) ( not ( = ?auto_860875 ?auto_860881 ) ) ( not ( = ?auto_860875 ?auto_860882 ) ) ( not ( = ?auto_860875 ?auto_860883 ) ) ( not ( = ?auto_860875 ?auto_860884 ) ) ( not ( = ?auto_860875 ?auto_860885 ) ) ( not ( = ?auto_860875 ?auto_860886 ) ) ( not ( = ?auto_860875 ?auto_860887 ) ) ( not ( = ?auto_860875 ?auto_860888 ) ) ( not ( = ?auto_860875 ?auto_860889 ) ) ( not ( = ?auto_860875 ?auto_860890 ) ) ( not ( = ?auto_860875 ?auto_860891 ) ) ( not ( = ?auto_860876 ?auto_860877 ) ) ( not ( = ?auto_860876 ?auto_860878 ) ) ( not ( = ?auto_860876 ?auto_860879 ) ) ( not ( = ?auto_860876 ?auto_860880 ) ) ( not ( = ?auto_860876 ?auto_860881 ) ) ( not ( = ?auto_860876 ?auto_860882 ) ) ( not ( = ?auto_860876 ?auto_860883 ) ) ( not ( = ?auto_860876 ?auto_860884 ) ) ( not ( = ?auto_860876 ?auto_860885 ) ) ( not ( = ?auto_860876 ?auto_860886 ) ) ( not ( = ?auto_860876 ?auto_860887 ) ) ( not ( = ?auto_860876 ?auto_860888 ) ) ( not ( = ?auto_860876 ?auto_860889 ) ) ( not ( = ?auto_860876 ?auto_860890 ) ) ( not ( = ?auto_860876 ?auto_860891 ) ) ( not ( = ?auto_860877 ?auto_860878 ) ) ( not ( = ?auto_860877 ?auto_860879 ) ) ( not ( = ?auto_860877 ?auto_860880 ) ) ( not ( = ?auto_860877 ?auto_860881 ) ) ( not ( = ?auto_860877 ?auto_860882 ) ) ( not ( = ?auto_860877 ?auto_860883 ) ) ( not ( = ?auto_860877 ?auto_860884 ) ) ( not ( = ?auto_860877 ?auto_860885 ) ) ( not ( = ?auto_860877 ?auto_860886 ) ) ( not ( = ?auto_860877 ?auto_860887 ) ) ( not ( = ?auto_860877 ?auto_860888 ) ) ( not ( = ?auto_860877 ?auto_860889 ) ) ( not ( = ?auto_860877 ?auto_860890 ) ) ( not ( = ?auto_860877 ?auto_860891 ) ) ( not ( = ?auto_860878 ?auto_860879 ) ) ( not ( = ?auto_860878 ?auto_860880 ) ) ( not ( = ?auto_860878 ?auto_860881 ) ) ( not ( = ?auto_860878 ?auto_860882 ) ) ( not ( = ?auto_860878 ?auto_860883 ) ) ( not ( = ?auto_860878 ?auto_860884 ) ) ( not ( = ?auto_860878 ?auto_860885 ) ) ( not ( = ?auto_860878 ?auto_860886 ) ) ( not ( = ?auto_860878 ?auto_860887 ) ) ( not ( = ?auto_860878 ?auto_860888 ) ) ( not ( = ?auto_860878 ?auto_860889 ) ) ( not ( = ?auto_860878 ?auto_860890 ) ) ( not ( = ?auto_860878 ?auto_860891 ) ) ( not ( = ?auto_860879 ?auto_860880 ) ) ( not ( = ?auto_860879 ?auto_860881 ) ) ( not ( = ?auto_860879 ?auto_860882 ) ) ( not ( = ?auto_860879 ?auto_860883 ) ) ( not ( = ?auto_860879 ?auto_860884 ) ) ( not ( = ?auto_860879 ?auto_860885 ) ) ( not ( = ?auto_860879 ?auto_860886 ) ) ( not ( = ?auto_860879 ?auto_860887 ) ) ( not ( = ?auto_860879 ?auto_860888 ) ) ( not ( = ?auto_860879 ?auto_860889 ) ) ( not ( = ?auto_860879 ?auto_860890 ) ) ( not ( = ?auto_860879 ?auto_860891 ) ) ( not ( = ?auto_860880 ?auto_860881 ) ) ( not ( = ?auto_860880 ?auto_860882 ) ) ( not ( = ?auto_860880 ?auto_860883 ) ) ( not ( = ?auto_860880 ?auto_860884 ) ) ( not ( = ?auto_860880 ?auto_860885 ) ) ( not ( = ?auto_860880 ?auto_860886 ) ) ( not ( = ?auto_860880 ?auto_860887 ) ) ( not ( = ?auto_860880 ?auto_860888 ) ) ( not ( = ?auto_860880 ?auto_860889 ) ) ( not ( = ?auto_860880 ?auto_860890 ) ) ( not ( = ?auto_860880 ?auto_860891 ) ) ( not ( = ?auto_860881 ?auto_860882 ) ) ( not ( = ?auto_860881 ?auto_860883 ) ) ( not ( = ?auto_860881 ?auto_860884 ) ) ( not ( = ?auto_860881 ?auto_860885 ) ) ( not ( = ?auto_860881 ?auto_860886 ) ) ( not ( = ?auto_860881 ?auto_860887 ) ) ( not ( = ?auto_860881 ?auto_860888 ) ) ( not ( = ?auto_860881 ?auto_860889 ) ) ( not ( = ?auto_860881 ?auto_860890 ) ) ( not ( = ?auto_860881 ?auto_860891 ) ) ( not ( = ?auto_860882 ?auto_860883 ) ) ( not ( = ?auto_860882 ?auto_860884 ) ) ( not ( = ?auto_860882 ?auto_860885 ) ) ( not ( = ?auto_860882 ?auto_860886 ) ) ( not ( = ?auto_860882 ?auto_860887 ) ) ( not ( = ?auto_860882 ?auto_860888 ) ) ( not ( = ?auto_860882 ?auto_860889 ) ) ( not ( = ?auto_860882 ?auto_860890 ) ) ( not ( = ?auto_860882 ?auto_860891 ) ) ( not ( = ?auto_860883 ?auto_860884 ) ) ( not ( = ?auto_860883 ?auto_860885 ) ) ( not ( = ?auto_860883 ?auto_860886 ) ) ( not ( = ?auto_860883 ?auto_860887 ) ) ( not ( = ?auto_860883 ?auto_860888 ) ) ( not ( = ?auto_860883 ?auto_860889 ) ) ( not ( = ?auto_860883 ?auto_860890 ) ) ( not ( = ?auto_860883 ?auto_860891 ) ) ( not ( = ?auto_860884 ?auto_860885 ) ) ( not ( = ?auto_860884 ?auto_860886 ) ) ( not ( = ?auto_860884 ?auto_860887 ) ) ( not ( = ?auto_860884 ?auto_860888 ) ) ( not ( = ?auto_860884 ?auto_860889 ) ) ( not ( = ?auto_860884 ?auto_860890 ) ) ( not ( = ?auto_860884 ?auto_860891 ) ) ( not ( = ?auto_860885 ?auto_860886 ) ) ( not ( = ?auto_860885 ?auto_860887 ) ) ( not ( = ?auto_860885 ?auto_860888 ) ) ( not ( = ?auto_860885 ?auto_860889 ) ) ( not ( = ?auto_860885 ?auto_860890 ) ) ( not ( = ?auto_860885 ?auto_860891 ) ) ( not ( = ?auto_860886 ?auto_860887 ) ) ( not ( = ?auto_860886 ?auto_860888 ) ) ( not ( = ?auto_860886 ?auto_860889 ) ) ( not ( = ?auto_860886 ?auto_860890 ) ) ( not ( = ?auto_860886 ?auto_860891 ) ) ( not ( = ?auto_860887 ?auto_860888 ) ) ( not ( = ?auto_860887 ?auto_860889 ) ) ( not ( = ?auto_860887 ?auto_860890 ) ) ( not ( = ?auto_860887 ?auto_860891 ) ) ( not ( = ?auto_860888 ?auto_860889 ) ) ( not ( = ?auto_860888 ?auto_860890 ) ) ( not ( = ?auto_860888 ?auto_860891 ) ) ( not ( = ?auto_860889 ?auto_860890 ) ) ( not ( = ?auto_860889 ?auto_860891 ) ) ( not ( = ?auto_860890 ?auto_860891 ) ) ( ON ?auto_860889 ?auto_860890 ) ( ON ?auto_860888 ?auto_860889 ) ( ON ?auto_860887 ?auto_860888 ) ( ON ?auto_860886 ?auto_860887 ) ( ON ?auto_860885 ?auto_860886 ) ( ON ?auto_860884 ?auto_860885 ) ( ON ?auto_860883 ?auto_860884 ) ( CLEAR ?auto_860881 ) ( ON ?auto_860882 ?auto_860883 ) ( CLEAR ?auto_860882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_860874 ?auto_860875 ?auto_860876 ?auto_860877 ?auto_860878 ?auto_860879 ?auto_860880 ?auto_860881 ?auto_860882 )
      ( MAKE-17PILE ?auto_860874 ?auto_860875 ?auto_860876 ?auto_860877 ?auto_860878 ?auto_860879 ?auto_860880 ?auto_860881 ?auto_860882 ?auto_860883 ?auto_860884 ?auto_860885 ?auto_860886 ?auto_860887 ?auto_860888 ?auto_860889 ?auto_860890 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_860944 - BLOCK
      ?auto_860945 - BLOCK
      ?auto_860946 - BLOCK
      ?auto_860947 - BLOCK
      ?auto_860948 - BLOCK
      ?auto_860949 - BLOCK
      ?auto_860950 - BLOCK
      ?auto_860951 - BLOCK
      ?auto_860952 - BLOCK
      ?auto_860953 - BLOCK
      ?auto_860954 - BLOCK
      ?auto_860955 - BLOCK
      ?auto_860956 - BLOCK
      ?auto_860957 - BLOCK
      ?auto_860958 - BLOCK
      ?auto_860959 - BLOCK
      ?auto_860960 - BLOCK
    )
    :vars
    (
      ?auto_860961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_860960 ?auto_860961 ) ( ON-TABLE ?auto_860944 ) ( ON ?auto_860945 ?auto_860944 ) ( ON ?auto_860946 ?auto_860945 ) ( ON ?auto_860947 ?auto_860946 ) ( ON ?auto_860948 ?auto_860947 ) ( ON ?auto_860949 ?auto_860948 ) ( ON ?auto_860950 ?auto_860949 ) ( not ( = ?auto_860944 ?auto_860945 ) ) ( not ( = ?auto_860944 ?auto_860946 ) ) ( not ( = ?auto_860944 ?auto_860947 ) ) ( not ( = ?auto_860944 ?auto_860948 ) ) ( not ( = ?auto_860944 ?auto_860949 ) ) ( not ( = ?auto_860944 ?auto_860950 ) ) ( not ( = ?auto_860944 ?auto_860951 ) ) ( not ( = ?auto_860944 ?auto_860952 ) ) ( not ( = ?auto_860944 ?auto_860953 ) ) ( not ( = ?auto_860944 ?auto_860954 ) ) ( not ( = ?auto_860944 ?auto_860955 ) ) ( not ( = ?auto_860944 ?auto_860956 ) ) ( not ( = ?auto_860944 ?auto_860957 ) ) ( not ( = ?auto_860944 ?auto_860958 ) ) ( not ( = ?auto_860944 ?auto_860959 ) ) ( not ( = ?auto_860944 ?auto_860960 ) ) ( not ( = ?auto_860944 ?auto_860961 ) ) ( not ( = ?auto_860945 ?auto_860946 ) ) ( not ( = ?auto_860945 ?auto_860947 ) ) ( not ( = ?auto_860945 ?auto_860948 ) ) ( not ( = ?auto_860945 ?auto_860949 ) ) ( not ( = ?auto_860945 ?auto_860950 ) ) ( not ( = ?auto_860945 ?auto_860951 ) ) ( not ( = ?auto_860945 ?auto_860952 ) ) ( not ( = ?auto_860945 ?auto_860953 ) ) ( not ( = ?auto_860945 ?auto_860954 ) ) ( not ( = ?auto_860945 ?auto_860955 ) ) ( not ( = ?auto_860945 ?auto_860956 ) ) ( not ( = ?auto_860945 ?auto_860957 ) ) ( not ( = ?auto_860945 ?auto_860958 ) ) ( not ( = ?auto_860945 ?auto_860959 ) ) ( not ( = ?auto_860945 ?auto_860960 ) ) ( not ( = ?auto_860945 ?auto_860961 ) ) ( not ( = ?auto_860946 ?auto_860947 ) ) ( not ( = ?auto_860946 ?auto_860948 ) ) ( not ( = ?auto_860946 ?auto_860949 ) ) ( not ( = ?auto_860946 ?auto_860950 ) ) ( not ( = ?auto_860946 ?auto_860951 ) ) ( not ( = ?auto_860946 ?auto_860952 ) ) ( not ( = ?auto_860946 ?auto_860953 ) ) ( not ( = ?auto_860946 ?auto_860954 ) ) ( not ( = ?auto_860946 ?auto_860955 ) ) ( not ( = ?auto_860946 ?auto_860956 ) ) ( not ( = ?auto_860946 ?auto_860957 ) ) ( not ( = ?auto_860946 ?auto_860958 ) ) ( not ( = ?auto_860946 ?auto_860959 ) ) ( not ( = ?auto_860946 ?auto_860960 ) ) ( not ( = ?auto_860946 ?auto_860961 ) ) ( not ( = ?auto_860947 ?auto_860948 ) ) ( not ( = ?auto_860947 ?auto_860949 ) ) ( not ( = ?auto_860947 ?auto_860950 ) ) ( not ( = ?auto_860947 ?auto_860951 ) ) ( not ( = ?auto_860947 ?auto_860952 ) ) ( not ( = ?auto_860947 ?auto_860953 ) ) ( not ( = ?auto_860947 ?auto_860954 ) ) ( not ( = ?auto_860947 ?auto_860955 ) ) ( not ( = ?auto_860947 ?auto_860956 ) ) ( not ( = ?auto_860947 ?auto_860957 ) ) ( not ( = ?auto_860947 ?auto_860958 ) ) ( not ( = ?auto_860947 ?auto_860959 ) ) ( not ( = ?auto_860947 ?auto_860960 ) ) ( not ( = ?auto_860947 ?auto_860961 ) ) ( not ( = ?auto_860948 ?auto_860949 ) ) ( not ( = ?auto_860948 ?auto_860950 ) ) ( not ( = ?auto_860948 ?auto_860951 ) ) ( not ( = ?auto_860948 ?auto_860952 ) ) ( not ( = ?auto_860948 ?auto_860953 ) ) ( not ( = ?auto_860948 ?auto_860954 ) ) ( not ( = ?auto_860948 ?auto_860955 ) ) ( not ( = ?auto_860948 ?auto_860956 ) ) ( not ( = ?auto_860948 ?auto_860957 ) ) ( not ( = ?auto_860948 ?auto_860958 ) ) ( not ( = ?auto_860948 ?auto_860959 ) ) ( not ( = ?auto_860948 ?auto_860960 ) ) ( not ( = ?auto_860948 ?auto_860961 ) ) ( not ( = ?auto_860949 ?auto_860950 ) ) ( not ( = ?auto_860949 ?auto_860951 ) ) ( not ( = ?auto_860949 ?auto_860952 ) ) ( not ( = ?auto_860949 ?auto_860953 ) ) ( not ( = ?auto_860949 ?auto_860954 ) ) ( not ( = ?auto_860949 ?auto_860955 ) ) ( not ( = ?auto_860949 ?auto_860956 ) ) ( not ( = ?auto_860949 ?auto_860957 ) ) ( not ( = ?auto_860949 ?auto_860958 ) ) ( not ( = ?auto_860949 ?auto_860959 ) ) ( not ( = ?auto_860949 ?auto_860960 ) ) ( not ( = ?auto_860949 ?auto_860961 ) ) ( not ( = ?auto_860950 ?auto_860951 ) ) ( not ( = ?auto_860950 ?auto_860952 ) ) ( not ( = ?auto_860950 ?auto_860953 ) ) ( not ( = ?auto_860950 ?auto_860954 ) ) ( not ( = ?auto_860950 ?auto_860955 ) ) ( not ( = ?auto_860950 ?auto_860956 ) ) ( not ( = ?auto_860950 ?auto_860957 ) ) ( not ( = ?auto_860950 ?auto_860958 ) ) ( not ( = ?auto_860950 ?auto_860959 ) ) ( not ( = ?auto_860950 ?auto_860960 ) ) ( not ( = ?auto_860950 ?auto_860961 ) ) ( not ( = ?auto_860951 ?auto_860952 ) ) ( not ( = ?auto_860951 ?auto_860953 ) ) ( not ( = ?auto_860951 ?auto_860954 ) ) ( not ( = ?auto_860951 ?auto_860955 ) ) ( not ( = ?auto_860951 ?auto_860956 ) ) ( not ( = ?auto_860951 ?auto_860957 ) ) ( not ( = ?auto_860951 ?auto_860958 ) ) ( not ( = ?auto_860951 ?auto_860959 ) ) ( not ( = ?auto_860951 ?auto_860960 ) ) ( not ( = ?auto_860951 ?auto_860961 ) ) ( not ( = ?auto_860952 ?auto_860953 ) ) ( not ( = ?auto_860952 ?auto_860954 ) ) ( not ( = ?auto_860952 ?auto_860955 ) ) ( not ( = ?auto_860952 ?auto_860956 ) ) ( not ( = ?auto_860952 ?auto_860957 ) ) ( not ( = ?auto_860952 ?auto_860958 ) ) ( not ( = ?auto_860952 ?auto_860959 ) ) ( not ( = ?auto_860952 ?auto_860960 ) ) ( not ( = ?auto_860952 ?auto_860961 ) ) ( not ( = ?auto_860953 ?auto_860954 ) ) ( not ( = ?auto_860953 ?auto_860955 ) ) ( not ( = ?auto_860953 ?auto_860956 ) ) ( not ( = ?auto_860953 ?auto_860957 ) ) ( not ( = ?auto_860953 ?auto_860958 ) ) ( not ( = ?auto_860953 ?auto_860959 ) ) ( not ( = ?auto_860953 ?auto_860960 ) ) ( not ( = ?auto_860953 ?auto_860961 ) ) ( not ( = ?auto_860954 ?auto_860955 ) ) ( not ( = ?auto_860954 ?auto_860956 ) ) ( not ( = ?auto_860954 ?auto_860957 ) ) ( not ( = ?auto_860954 ?auto_860958 ) ) ( not ( = ?auto_860954 ?auto_860959 ) ) ( not ( = ?auto_860954 ?auto_860960 ) ) ( not ( = ?auto_860954 ?auto_860961 ) ) ( not ( = ?auto_860955 ?auto_860956 ) ) ( not ( = ?auto_860955 ?auto_860957 ) ) ( not ( = ?auto_860955 ?auto_860958 ) ) ( not ( = ?auto_860955 ?auto_860959 ) ) ( not ( = ?auto_860955 ?auto_860960 ) ) ( not ( = ?auto_860955 ?auto_860961 ) ) ( not ( = ?auto_860956 ?auto_860957 ) ) ( not ( = ?auto_860956 ?auto_860958 ) ) ( not ( = ?auto_860956 ?auto_860959 ) ) ( not ( = ?auto_860956 ?auto_860960 ) ) ( not ( = ?auto_860956 ?auto_860961 ) ) ( not ( = ?auto_860957 ?auto_860958 ) ) ( not ( = ?auto_860957 ?auto_860959 ) ) ( not ( = ?auto_860957 ?auto_860960 ) ) ( not ( = ?auto_860957 ?auto_860961 ) ) ( not ( = ?auto_860958 ?auto_860959 ) ) ( not ( = ?auto_860958 ?auto_860960 ) ) ( not ( = ?auto_860958 ?auto_860961 ) ) ( not ( = ?auto_860959 ?auto_860960 ) ) ( not ( = ?auto_860959 ?auto_860961 ) ) ( not ( = ?auto_860960 ?auto_860961 ) ) ( ON ?auto_860959 ?auto_860960 ) ( ON ?auto_860958 ?auto_860959 ) ( ON ?auto_860957 ?auto_860958 ) ( ON ?auto_860956 ?auto_860957 ) ( ON ?auto_860955 ?auto_860956 ) ( ON ?auto_860954 ?auto_860955 ) ( ON ?auto_860953 ?auto_860954 ) ( ON ?auto_860952 ?auto_860953 ) ( CLEAR ?auto_860950 ) ( ON ?auto_860951 ?auto_860952 ) ( CLEAR ?auto_860951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_860944 ?auto_860945 ?auto_860946 ?auto_860947 ?auto_860948 ?auto_860949 ?auto_860950 ?auto_860951 )
      ( MAKE-17PILE ?auto_860944 ?auto_860945 ?auto_860946 ?auto_860947 ?auto_860948 ?auto_860949 ?auto_860950 ?auto_860951 ?auto_860952 ?auto_860953 ?auto_860954 ?auto_860955 ?auto_860956 ?auto_860957 ?auto_860958 ?auto_860959 ?auto_860960 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_861014 - BLOCK
      ?auto_861015 - BLOCK
      ?auto_861016 - BLOCK
      ?auto_861017 - BLOCK
      ?auto_861018 - BLOCK
      ?auto_861019 - BLOCK
      ?auto_861020 - BLOCK
      ?auto_861021 - BLOCK
      ?auto_861022 - BLOCK
      ?auto_861023 - BLOCK
      ?auto_861024 - BLOCK
      ?auto_861025 - BLOCK
      ?auto_861026 - BLOCK
      ?auto_861027 - BLOCK
      ?auto_861028 - BLOCK
      ?auto_861029 - BLOCK
      ?auto_861030 - BLOCK
    )
    :vars
    (
      ?auto_861031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861030 ?auto_861031 ) ( ON-TABLE ?auto_861014 ) ( ON ?auto_861015 ?auto_861014 ) ( ON ?auto_861016 ?auto_861015 ) ( ON ?auto_861017 ?auto_861016 ) ( ON ?auto_861018 ?auto_861017 ) ( ON ?auto_861019 ?auto_861018 ) ( not ( = ?auto_861014 ?auto_861015 ) ) ( not ( = ?auto_861014 ?auto_861016 ) ) ( not ( = ?auto_861014 ?auto_861017 ) ) ( not ( = ?auto_861014 ?auto_861018 ) ) ( not ( = ?auto_861014 ?auto_861019 ) ) ( not ( = ?auto_861014 ?auto_861020 ) ) ( not ( = ?auto_861014 ?auto_861021 ) ) ( not ( = ?auto_861014 ?auto_861022 ) ) ( not ( = ?auto_861014 ?auto_861023 ) ) ( not ( = ?auto_861014 ?auto_861024 ) ) ( not ( = ?auto_861014 ?auto_861025 ) ) ( not ( = ?auto_861014 ?auto_861026 ) ) ( not ( = ?auto_861014 ?auto_861027 ) ) ( not ( = ?auto_861014 ?auto_861028 ) ) ( not ( = ?auto_861014 ?auto_861029 ) ) ( not ( = ?auto_861014 ?auto_861030 ) ) ( not ( = ?auto_861014 ?auto_861031 ) ) ( not ( = ?auto_861015 ?auto_861016 ) ) ( not ( = ?auto_861015 ?auto_861017 ) ) ( not ( = ?auto_861015 ?auto_861018 ) ) ( not ( = ?auto_861015 ?auto_861019 ) ) ( not ( = ?auto_861015 ?auto_861020 ) ) ( not ( = ?auto_861015 ?auto_861021 ) ) ( not ( = ?auto_861015 ?auto_861022 ) ) ( not ( = ?auto_861015 ?auto_861023 ) ) ( not ( = ?auto_861015 ?auto_861024 ) ) ( not ( = ?auto_861015 ?auto_861025 ) ) ( not ( = ?auto_861015 ?auto_861026 ) ) ( not ( = ?auto_861015 ?auto_861027 ) ) ( not ( = ?auto_861015 ?auto_861028 ) ) ( not ( = ?auto_861015 ?auto_861029 ) ) ( not ( = ?auto_861015 ?auto_861030 ) ) ( not ( = ?auto_861015 ?auto_861031 ) ) ( not ( = ?auto_861016 ?auto_861017 ) ) ( not ( = ?auto_861016 ?auto_861018 ) ) ( not ( = ?auto_861016 ?auto_861019 ) ) ( not ( = ?auto_861016 ?auto_861020 ) ) ( not ( = ?auto_861016 ?auto_861021 ) ) ( not ( = ?auto_861016 ?auto_861022 ) ) ( not ( = ?auto_861016 ?auto_861023 ) ) ( not ( = ?auto_861016 ?auto_861024 ) ) ( not ( = ?auto_861016 ?auto_861025 ) ) ( not ( = ?auto_861016 ?auto_861026 ) ) ( not ( = ?auto_861016 ?auto_861027 ) ) ( not ( = ?auto_861016 ?auto_861028 ) ) ( not ( = ?auto_861016 ?auto_861029 ) ) ( not ( = ?auto_861016 ?auto_861030 ) ) ( not ( = ?auto_861016 ?auto_861031 ) ) ( not ( = ?auto_861017 ?auto_861018 ) ) ( not ( = ?auto_861017 ?auto_861019 ) ) ( not ( = ?auto_861017 ?auto_861020 ) ) ( not ( = ?auto_861017 ?auto_861021 ) ) ( not ( = ?auto_861017 ?auto_861022 ) ) ( not ( = ?auto_861017 ?auto_861023 ) ) ( not ( = ?auto_861017 ?auto_861024 ) ) ( not ( = ?auto_861017 ?auto_861025 ) ) ( not ( = ?auto_861017 ?auto_861026 ) ) ( not ( = ?auto_861017 ?auto_861027 ) ) ( not ( = ?auto_861017 ?auto_861028 ) ) ( not ( = ?auto_861017 ?auto_861029 ) ) ( not ( = ?auto_861017 ?auto_861030 ) ) ( not ( = ?auto_861017 ?auto_861031 ) ) ( not ( = ?auto_861018 ?auto_861019 ) ) ( not ( = ?auto_861018 ?auto_861020 ) ) ( not ( = ?auto_861018 ?auto_861021 ) ) ( not ( = ?auto_861018 ?auto_861022 ) ) ( not ( = ?auto_861018 ?auto_861023 ) ) ( not ( = ?auto_861018 ?auto_861024 ) ) ( not ( = ?auto_861018 ?auto_861025 ) ) ( not ( = ?auto_861018 ?auto_861026 ) ) ( not ( = ?auto_861018 ?auto_861027 ) ) ( not ( = ?auto_861018 ?auto_861028 ) ) ( not ( = ?auto_861018 ?auto_861029 ) ) ( not ( = ?auto_861018 ?auto_861030 ) ) ( not ( = ?auto_861018 ?auto_861031 ) ) ( not ( = ?auto_861019 ?auto_861020 ) ) ( not ( = ?auto_861019 ?auto_861021 ) ) ( not ( = ?auto_861019 ?auto_861022 ) ) ( not ( = ?auto_861019 ?auto_861023 ) ) ( not ( = ?auto_861019 ?auto_861024 ) ) ( not ( = ?auto_861019 ?auto_861025 ) ) ( not ( = ?auto_861019 ?auto_861026 ) ) ( not ( = ?auto_861019 ?auto_861027 ) ) ( not ( = ?auto_861019 ?auto_861028 ) ) ( not ( = ?auto_861019 ?auto_861029 ) ) ( not ( = ?auto_861019 ?auto_861030 ) ) ( not ( = ?auto_861019 ?auto_861031 ) ) ( not ( = ?auto_861020 ?auto_861021 ) ) ( not ( = ?auto_861020 ?auto_861022 ) ) ( not ( = ?auto_861020 ?auto_861023 ) ) ( not ( = ?auto_861020 ?auto_861024 ) ) ( not ( = ?auto_861020 ?auto_861025 ) ) ( not ( = ?auto_861020 ?auto_861026 ) ) ( not ( = ?auto_861020 ?auto_861027 ) ) ( not ( = ?auto_861020 ?auto_861028 ) ) ( not ( = ?auto_861020 ?auto_861029 ) ) ( not ( = ?auto_861020 ?auto_861030 ) ) ( not ( = ?auto_861020 ?auto_861031 ) ) ( not ( = ?auto_861021 ?auto_861022 ) ) ( not ( = ?auto_861021 ?auto_861023 ) ) ( not ( = ?auto_861021 ?auto_861024 ) ) ( not ( = ?auto_861021 ?auto_861025 ) ) ( not ( = ?auto_861021 ?auto_861026 ) ) ( not ( = ?auto_861021 ?auto_861027 ) ) ( not ( = ?auto_861021 ?auto_861028 ) ) ( not ( = ?auto_861021 ?auto_861029 ) ) ( not ( = ?auto_861021 ?auto_861030 ) ) ( not ( = ?auto_861021 ?auto_861031 ) ) ( not ( = ?auto_861022 ?auto_861023 ) ) ( not ( = ?auto_861022 ?auto_861024 ) ) ( not ( = ?auto_861022 ?auto_861025 ) ) ( not ( = ?auto_861022 ?auto_861026 ) ) ( not ( = ?auto_861022 ?auto_861027 ) ) ( not ( = ?auto_861022 ?auto_861028 ) ) ( not ( = ?auto_861022 ?auto_861029 ) ) ( not ( = ?auto_861022 ?auto_861030 ) ) ( not ( = ?auto_861022 ?auto_861031 ) ) ( not ( = ?auto_861023 ?auto_861024 ) ) ( not ( = ?auto_861023 ?auto_861025 ) ) ( not ( = ?auto_861023 ?auto_861026 ) ) ( not ( = ?auto_861023 ?auto_861027 ) ) ( not ( = ?auto_861023 ?auto_861028 ) ) ( not ( = ?auto_861023 ?auto_861029 ) ) ( not ( = ?auto_861023 ?auto_861030 ) ) ( not ( = ?auto_861023 ?auto_861031 ) ) ( not ( = ?auto_861024 ?auto_861025 ) ) ( not ( = ?auto_861024 ?auto_861026 ) ) ( not ( = ?auto_861024 ?auto_861027 ) ) ( not ( = ?auto_861024 ?auto_861028 ) ) ( not ( = ?auto_861024 ?auto_861029 ) ) ( not ( = ?auto_861024 ?auto_861030 ) ) ( not ( = ?auto_861024 ?auto_861031 ) ) ( not ( = ?auto_861025 ?auto_861026 ) ) ( not ( = ?auto_861025 ?auto_861027 ) ) ( not ( = ?auto_861025 ?auto_861028 ) ) ( not ( = ?auto_861025 ?auto_861029 ) ) ( not ( = ?auto_861025 ?auto_861030 ) ) ( not ( = ?auto_861025 ?auto_861031 ) ) ( not ( = ?auto_861026 ?auto_861027 ) ) ( not ( = ?auto_861026 ?auto_861028 ) ) ( not ( = ?auto_861026 ?auto_861029 ) ) ( not ( = ?auto_861026 ?auto_861030 ) ) ( not ( = ?auto_861026 ?auto_861031 ) ) ( not ( = ?auto_861027 ?auto_861028 ) ) ( not ( = ?auto_861027 ?auto_861029 ) ) ( not ( = ?auto_861027 ?auto_861030 ) ) ( not ( = ?auto_861027 ?auto_861031 ) ) ( not ( = ?auto_861028 ?auto_861029 ) ) ( not ( = ?auto_861028 ?auto_861030 ) ) ( not ( = ?auto_861028 ?auto_861031 ) ) ( not ( = ?auto_861029 ?auto_861030 ) ) ( not ( = ?auto_861029 ?auto_861031 ) ) ( not ( = ?auto_861030 ?auto_861031 ) ) ( ON ?auto_861029 ?auto_861030 ) ( ON ?auto_861028 ?auto_861029 ) ( ON ?auto_861027 ?auto_861028 ) ( ON ?auto_861026 ?auto_861027 ) ( ON ?auto_861025 ?auto_861026 ) ( ON ?auto_861024 ?auto_861025 ) ( ON ?auto_861023 ?auto_861024 ) ( ON ?auto_861022 ?auto_861023 ) ( ON ?auto_861021 ?auto_861022 ) ( CLEAR ?auto_861019 ) ( ON ?auto_861020 ?auto_861021 ) ( CLEAR ?auto_861020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_861014 ?auto_861015 ?auto_861016 ?auto_861017 ?auto_861018 ?auto_861019 ?auto_861020 )
      ( MAKE-17PILE ?auto_861014 ?auto_861015 ?auto_861016 ?auto_861017 ?auto_861018 ?auto_861019 ?auto_861020 ?auto_861021 ?auto_861022 ?auto_861023 ?auto_861024 ?auto_861025 ?auto_861026 ?auto_861027 ?auto_861028 ?auto_861029 ?auto_861030 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_861084 - BLOCK
      ?auto_861085 - BLOCK
      ?auto_861086 - BLOCK
      ?auto_861087 - BLOCK
      ?auto_861088 - BLOCK
      ?auto_861089 - BLOCK
      ?auto_861090 - BLOCK
      ?auto_861091 - BLOCK
      ?auto_861092 - BLOCK
      ?auto_861093 - BLOCK
      ?auto_861094 - BLOCK
      ?auto_861095 - BLOCK
      ?auto_861096 - BLOCK
      ?auto_861097 - BLOCK
      ?auto_861098 - BLOCK
      ?auto_861099 - BLOCK
      ?auto_861100 - BLOCK
    )
    :vars
    (
      ?auto_861101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861100 ?auto_861101 ) ( ON-TABLE ?auto_861084 ) ( ON ?auto_861085 ?auto_861084 ) ( ON ?auto_861086 ?auto_861085 ) ( ON ?auto_861087 ?auto_861086 ) ( ON ?auto_861088 ?auto_861087 ) ( not ( = ?auto_861084 ?auto_861085 ) ) ( not ( = ?auto_861084 ?auto_861086 ) ) ( not ( = ?auto_861084 ?auto_861087 ) ) ( not ( = ?auto_861084 ?auto_861088 ) ) ( not ( = ?auto_861084 ?auto_861089 ) ) ( not ( = ?auto_861084 ?auto_861090 ) ) ( not ( = ?auto_861084 ?auto_861091 ) ) ( not ( = ?auto_861084 ?auto_861092 ) ) ( not ( = ?auto_861084 ?auto_861093 ) ) ( not ( = ?auto_861084 ?auto_861094 ) ) ( not ( = ?auto_861084 ?auto_861095 ) ) ( not ( = ?auto_861084 ?auto_861096 ) ) ( not ( = ?auto_861084 ?auto_861097 ) ) ( not ( = ?auto_861084 ?auto_861098 ) ) ( not ( = ?auto_861084 ?auto_861099 ) ) ( not ( = ?auto_861084 ?auto_861100 ) ) ( not ( = ?auto_861084 ?auto_861101 ) ) ( not ( = ?auto_861085 ?auto_861086 ) ) ( not ( = ?auto_861085 ?auto_861087 ) ) ( not ( = ?auto_861085 ?auto_861088 ) ) ( not ( = ?auto_861085 ?auto_861089 ) ) ( not ( = ?auto_861085 ?auto_861090 ) ) ( not ( = ?auto_861085 ?auto_861091 ) ) ( not ( = ?auto_861085 ?auto_861092 ) ) ( not ( = ?auto_861085 ?auto_861093 ) ) ( not ( = ?auto_861085 ?auto_861094 ) ) ( not ( = ?auto_861085 ?auto_861095 ) ) ( not ( = ?auto_861085 ?auto_861096 ) ) ( not ( = ?auto_861085 ?auto_861097 ) ) ( not ( = ?auto_861085 ?auto_861098 ) ) ( not ( = ?auto_861085 ?auto_861099 ) ) ( not ( = ?auto_861085 ?auto_861100 ) ) ( not ( = ?auto_861085 ?auto_861101 ) ) ( not ( = ?auto_861086 ?auto_861087 ) ) ( not ( = ?auto_861086 ?auto_861088 ) ) ( not ( = ?auto_861086 ?auto_861089 ) ) ( not ( = ?auto_861086 ?auto_861090 ) ) ( not ( = ?auto_861086 ?auto_861091 ) ) ( not ( = ?auto_861086 ?auto_861092 ) ) ( not ( = ?auto_861086 ?auto_861093 ) ) ( not ( = ?auto_861086 ?auto_861094 ) ) ( not ( = ?auto_861086 ?auto_861095 ) ) ( not ( = ?auto_861086 ?auto_861096 ) ) ( not ( = ?auto_861086 ?auto_861097 ) ) ( not ( = ?auto_861086 ?auto_861098 ) ) ( not ( = ?auto_861086 ?auto_861099 ) ) ( not ( = ?auto_861086 ?auto_861100 ) ) ( not ( = ?auto_861086 ?auto_861101 ) ) ( not ( = ?auto_861087 ?auto_861088 ) ) ( not ( = ?auto_861087 ?auto_861089 ) ) ( not ( = ?auto_861087 ?auto_861090 ) ) ( not ( = ?auto_861087 ?auto_861091 ) ) ( not ( = ?auto_861087 ?auto_861092 ) ) ( not ( = ?auto_861087 ?auto_861093 ) ) ( not ( = ?auto_861087 ?auto_861094 ) ) ( not ( = ?auto_861087 ?auto_861095 ) ) ( not ( = ?auto_861087 ?auto_861096 ) ) ( not ( = ?auto_861087 ?auto_861097 ) ) ( not ( = ?auto_861087 ?auto_861098 ) ) ( not ( = ?auto_861087 ?auto_861099 ) ) ( not ( = ?auto_861087 ?auto_861100 ) ) ( not ( = ?auto_861087 ?auto_861101 ) ) ( not ( = ?auto_861088 ?auto_861089 ) ) ( not ( = ?auto_861088 ?auto_861090 ) ) ( not ( = ?auto_861088 ?auto_861091 ) ) ( not ( = ?auto_861088 ?auto_861092 ) ) ( not ( = ?auto_861088 ?auto_861093 ) ) ( not ( = ?auto_861088 ?auto_861094 ) ) ( not ( = ?auto_861088 ?auto_861095 ) ) ( not ( = ?auto_861088 ?auto_861096 ) ) ( not ( = ?auto_861088 ?auto_861097 ) ) ( not ( = ?auto_861088 ?auto_861098 ) ) ( not ( = ?auto_861088 ?auto_861099 ) ) ( not ( = ?auto_861088 ?auto_861100 ) ) ( not ( = ?auto_861088 ?auto_861101 ) ) ( not ( = ?auto_861089 ?auto_861090 ) ) ( not ( = ?auto_861089 ?auto_861091 ) ) ( not ( = ?auto_861089 ?auto_861092 ) ) ( not ( = ?auto_861089 ?auto_861093 ) ) ( not ( = ?auto_861089 ?auto_861094 ) ) ( not ( = ?auto_861089 ?auto_861095 ) ) ( not ( = ?auto_861089 ?auto_861096 ) ) ( not ( = ?auto_861089 ?auto_861097 ) ) ( not ( = ?auto_861089 ?auto_861098 ) ) ( not ( = ?auto_861089 ?auto_861099 ) ) ( not ( = ?auto_861089 ?auto_861100 ) ) ( not ( = ?auto_861089 ?auto_861101 ) ) ( not ( = ?auto_861090 ?auto_861091 ) ) ( not ( = ?auto_861090 ?auto_861092 ) ) ( not ( = ?auto_861090 ?auto_861093 ) ) ( not ( = ?auto_861090 ?auto_861094 ) ) ( not ( = ?auto_861090 ?auto_861095 ) ) ( not ( = ?auto_861090 ?auto_861096 ) ) ( not ( = ?auto_861090 ?auto_861097 ) ) ( not ( = ?auto_861090 ?auto_861098 ) ) ( not ( = ?auto_861090 ?auto_861099 ) ) ( not ( = ?auto_861090 ?auto_861100 ) ) ( not ( = ?auto_861090 ?auto_861101 ) ) ( not ( = ?auto_861091 ?auto_861092 ) ) ( not ( = ?auto_861091 ?auto_861093 ) ) ( not ( = ?auto_861091 ?auto_861094 ) ) ( not ( = ?auto_861091 ?auto_861095 ) ) ( not ( = ?auto_861091 ?auto_861096 ) ) ( not ( = ?auto_861091 ?auto_861097 ) ) ( not ( = ?auto_861091 ?auto_861098 ) ) ( not ( = ?auto_861091 ?auto_861099 ) ) ( not ( = ?auto_861091 ?auto_861100 ) ) ( not ( = ?auto_861091 ?auto_861101 ) ) ( not ( = ?auto_861092 ?auto_861093 ) ) ( not ( = ?auto_861092 ?auto_861094 ) ) ( not ( = ?auto_861092 ?auto_861095 ) ) ( not ( = ?auto_861092 ?auto_861096 ) ) ( not ( = ?auto_861092 ?auto_861097 ) ) ( not ( = ?auto_861092 ?auto_861098 ) ) ( not ( = ?auto_861092 ?auto_861099 ) ) ( not ( = ?auto_861092 ?auto_861100 ) ) ( not ( = ?auto_861092 ?auto_861101 ) ) ( not ( = ?auto_861093 ?auto_861094 ) ) ( not ( = ?auto_861093 ?auto_861095 ) ) ( not ( = ?auto_861093 ?auto_861096 ) ) ( not ( = ?auto_861093 ?auto_861097 ) ) ( not ( = ?auto_861093 ?auto_861098 ) ) ( not ( = ?auto_861093 ?auto_861099 ) ) ( not ( = ?auto_861093 ?auto_861100 ) ) ( not ( = ?auto_861093 ?auto_861101 ) ) ( not ( = ?auto_861094 ?auto_861095 ) ) ( not ( = ?auto_861094 ?auto_861096 ) ) ( not ( = ?auto_861094 ?auto_861097 ) ) ( not ( = ?auto_861094 ?auto_861098 ) ) ( not ( = ?auto_861094 ?auto_861099 ) ) ( not ( = ?auto_861094 ?auto_861100 ) ) ( not ( = ?auto_861094 ?auto_861101 ) ) ( not ( = ?auto_861095 ?auto_861096 ) ) ( not ( = ?auto_861095 ?auto_861097 ) ) ( not ( = ?auto_861095 ?auto_861098 ) ) ( not ( = ?auto_861095 ?auto_861099 ) ) ( not ( = ?auto_861095 ?auto_861100 ) ) ( not ( = ?auto_861095 ?auto_861101 ) ) ( not ( = ?auto_861096 ?auto_861097 ) ) ( not ( = ?auto_861096 ?auto_861098 ) ) ( not ( = ?auto_861096 ?auto_861099 ) ) ( not ( = ?auto_861096 ?auto_861100 ) ) ( not ( = ?auto_861096 ?auto_861101 ) ) ( not ( = ?auto_861097 ?auto_861098 ) ) ( not ( = ?auto_861097 ?auto_861099 ) ) ( not ( = ?auto_861097 ?auto_861100 ) ) ( not ( = ?auto_861097 ?auto_861101 ) ) ( not ( = ?auto_861098 ?auto_861099 ) ) ( not ( = ?auto_861098 ?auto_861100 ) ) ( not ( = ?auto_861098 ?auto_861101 ) ) ( not ( = ?auto_861099 ?auto_861100 ) ) ( not ( = ?auto_861099 ?auto_861101 ) ) ( not ( = ?auto_861100 ?auto_861101 ) ) ( ON ?auto_861099 ?auto_861100 ) ( ON ?auto_861098 ?auto_861099 ) ( ON ?auto_861097 ?auto_861098 ) ( ON ?auto_861096 ?auto_861097 ) ( ON ?auto_861095 ?auto_861096 ) ( ON ?auto_861094 ?auto_861095 ) ( ON ?auto_861093 ?auto_861094 ) ( ON ?auto_861092 ?auto_861093 ) ( ON ?auto_861091 ?auto_861092 ) ( ON ?auto_861090 ?auto_861091 ) ( CLEAR ?auto_861088 ) ( ON ?auto_861089 ?auto_861090 ) ( CLEAR ?auto_861089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_861084 ?auto_861085 ?auto_861086 ?auto_861087 ?auto_861088 ?auto_861089 )
      ( MAKE-17PILE ?auto_861084 ?auto_861085 ?auto_861086 ?auto_861087 ?auto_861088 ?auto_861089 ?auto_861090 ?auto_861091 ?auto_861092 ?auto_861093 ?auto_861094 ?auto_861095 ?auto_861096 ?auto_861097 ?auto_861098 ?auto_861099 ?auto_861100 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_861154 - BLOCK
      ?auto_861155 - BLOCK
      ?auto_861156 - BLOCK
      ?auto_861157 - BLOCK
      ?auto_861158 - BLOCK
      ?auto_861159 - BLOCK
      ?auto_861160 - BLOCK
      ?auto_861161 - BLOCK
      ?auto_861162 - BLOCK
      ?auto_861163 - BLOCK
      ?auto_861164 - BLOCK
      ?auto_861165 - BLOCK
      ?auto_861166 - BLOCK
      ?auto_861167 - BLOCK
      ?auto_861168 - BLOCK
      ?auto_861169 - BLOCK
      ?auto_861170 - BLOCK
    )
    :vars
    (
      ?auto_861171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861170 ?auto_861171 ) ( ON-TABLE ?auto_861154 ) ( ON ?auto_861155 ?auto_861154 ) ( ON ?auto_861156 ?auto_861155 ) ( ON ?auto_861157 ?auto_861156 ) ( not ( = ?auto_861154 ?auto_861155 ) ) ( not ( = ?auto_861154 ?auto_861156 ) ) ( not ( = ?auto_861154 ?auto_861157 ) ) ( not ( = ?auto_861154 ?auto_861158 ) ) ( not ( = ?auto_861154 ?auto_861159 ) ) ( not ( = ?auto_861154 ?auto_861160 ) ) ( not ( = ?auto_861154 ?auto_861161 ) ) ( not ( = ?auto_861154 ?auto_861162 ) ) ( not ( = ?auto_861154 ?auto_861163 ) ) ( not ( = ?auto_861154 ?auto_861164 ) ) ( not ( = ?auto_861154 ?auto_861165 ) ) ( not ( = ?auto_861154 ?auto_861166 ) ) ( not ( = ?auto_861154 ?auto_861167 ) ) ( not ( = ?auto_861154 ?auto_861168 ) ) ( not ( = ?auto_861154 ?auto_861169 ) ) ( not ( = ?auto_861154 ?auto_861170 ) ) ( not ( = ?auto_861154 ?auto_861171 ) ) ( not ( = ?auto_861155 ?auto_861156 ) ) ( not ( = ?auto_861155 ?auto_861157 ) ) ( not ( = ?auto_861155 ?auto_861158 ) ) ( not ( = ?auto_861155 ?auto_861159 ) ) ( not ( = ?auto_861155 ?auto_861160 ) ) ( not ( = ?auto_861155 ?auto_861161 ) ) ( not ( = ?auto_861155 ?auto_861162 ) ) ( not ( = ?auto_861155 ?auto_861163 ) ) ( not ( = ?auto_861155 ?auto_861164 ) ) ( not ( = ?auto_861155 ?auto_861165 ) ) ( not ( = ?auto_861155 ?auto_861166 ) ) ( not ( = ?auto_861155 ?auto_861167 ) ) ( not ( = ?auto_861155 ?auto_861168 ) ) ( not ( = ?auto_861155 ?auto_861169 ) ) ( not ( = ?auto_861155 ?auto_861170 ) ) ( not ( = ?auto_861155 ?auto_861171 ) ) ( not ( = ?auto_861156 ?auto_861157 ) ) ( not ( = ?auto_861156 ?auto_861158 ) ) ( not ( = ?auto_861156 ?auto_861159 ) ) ( not ( = ?auto_861156 ?auto_861160 ) ) ( not ( = ?auto_861156 ?auto_861161 ) ) ( not ( = ?auto_861156 ?auto_861162 ) ) ( not ( = ?auto_861156 ?auto_861163 ) ) ( not ( = ?auto_861156 ?auto_861164 ) ) ( not ( = ?auto_861156 ?auto_861165 ) ) ( not ( = ?auto_861156 ?auto_861166 ) ) ( not ( = ?auto_861156 ?auto_861167 ) ) ( not ( = ?auto_861156 ?auto_861168 ) ) ( not ( = ?auto_861156 ?auto_861169 ) ) ( not ( = ?auto_861156 ?auto_861170 ) ) ( not ( = ?auto_861156 ?auto_861171 ) ) ( not ( = ?auto_861157 ?auto_861158 ) ) ( not ( = ?auto_861157 ?auto_861159 ) ) ( not ( = ?auto_861157 ?auto_861160 ) ) ( not ( = ?auto_861157 ?auto_861161 ) ) ( not ( = ?auto_861157 ?auto_861162 ) ) ( not ( = ?auto_861157 ?auto_861163 ) ) ( not ( = ?auto_861157 ?auto_861164 ) ) ( not ( = ?auto_861157 ?auto_861165 ) ) ( not ( = ?auto_861157 ?auto_861166 ) ) ( not ( = ?auto_861157 ?auto_861167 ) ) ( not ( = ?auto_861157 ?auto_861168 ) ) ( not ( = ?auto_861157 ?auto_861169 ) ) ( not ( = ?auto_861157 ?auto_861170 ) ) ( not ( = ?auto_861157 ?auto_861171 ) ) ( not ( = ?auto_861158 ?auto_861159 ) ) ( not ( = ?auto_861158 ?auto_861160 ) ) ( not ( = ?auto_861158 ?auto_861161 ) ) ( not ( = ?auto_861158 ?auto_861162 ) ) ( not ( = ?auto_861158 ?auto_861163 ) ) ( not ( = ?auto_861158 ?auto_861164 ) ) ( not ( = ?auto_861158 ?auto_861165 ) ) ( not ( = ?auto_861158 ?auto_861166 ) ) ( not ( = ?auto_861158 ?auto_861167 ) ) ( not ( = ?auto_861158 ?auto_861168 ) ) ( not ( = ?auto_861158 ?auto_861169 ) ) ( not ( = ?auto_861158 ?auto_861170 ) ) ( not ( = ?auto_861158 ?auto_861171 ) ) ( not ( = ?auto_861159 ?auto_861160 ) ) ( not ( = ?auto_861159 ?auto_861161 ) ) ( not ( = ?auto_861159 ?auto_861162 ) ) ( not ( = ?auto_861159 ?auto_861163 ) ) ( not ( = ?auto_861159 ?auto_861164 ) ) ( not ( = ?auto_861159 ?auto_861165 ) ) ( not ( = ?auto_861159 ?auto_861166 ) ) ( not ( = ?auto_861159 ?auto_861167 ) ) ( not ( = ?auto_861159 ?auto_861168 ) ) ( not ( = ?auto_861159 ?auto_861169 ) ) ( not ( = ?auto_861159 ?auto_861170 ) ) ( not ( = ?auto_861159 ?auto_861171 ) ) ( not ( = ?auto_861160 ?auto_861161 ) ) ( not ( = ?auto_861160 ?auto_861162 ) ) ( not ( = ?auto_861160 ?auto_861163 ) ) ( not ( = ?auto_861160 ?auto_861164 ) ) ( not ( = ?auto_861160 ?auto_861165 ) ) ( not ( = ?auto_861160 ?auto_861166 ) ) ( not ( = ?auto_861160 ?auto_861167 ) ) ( not ( = ?auto_861160 ?auto_861168 ) ) ( not ( = ?auto_861160 ?auto_861169 ) ) ( not ( = ?auto_861160 ?auto_861170 ) ) ( not ( = ?auto_861160 ?auto_861171 ) ) ( not ( = ?auto_861161 ?auto_861162 ) ) ( not ( = ?auto_861161 ?auto_861163 ) ) ( not ( = ?auto_861161 ?auto_861164 ) ) ( not ( = ?auto_861161 ?auto_861165 ) ) ( not ( = ?auto_861161 ?auto_861166 ) ) ( not ( = ?auto_861161 ?auto_861167 ) ) ( not ( = ?auto_861161 ?auto_861168 ) ) ( not ( = ?auto_861161 ?auto_861169 ) ) ( not ( = ?auto_861161 ?auto_861170 ) ) ( not ( = ?auto_861161 ?auto_861171 ) ) ( not ( = ?auto_861162 ?auto_861163 ) ) ( not ( = ?auto_861162 ?auto_861164 ) ) ( not ( = ?auto_861162 ?auto_861165 ) ) ( not ( = ?auto_861162 ?auto_861166 ) ) ( not ( = ?auto_861162 ?auto_861167 ) ) ( not ( = ?auto_861162 ?auto_861168 ) ) ( not ( = ?auto_861162 ?auto_861169 ) ) ( not ( = ?auto_861162 ?auto_861170 ) ) ( not ( = ?auto_861162 ?auto_861171 ) ) ( not ( = ?auto_861163 ?auto_861164 ) ) ( not ( = ?auto_861163 ?auto_861165 ) ) ( not ( = ?auto_861163 ?auto_861166 ) ) ( not ( = ?auto_861163 ?auto_861167 ) ) ( not ( = ?auto_861163 ?auto_861168 ) ) ( not ( = ?auto_861163 ?auto_861169 ) ) ( not ( = ?auto_861163 ?auto_861170 ) ) ( not ( = ?auto_861163 ?auto_861171 ) ) ( not ( = ?auto_861164 ?auto_861165 ) ) ( not ( = ?auto_861164 ?auto_861166 ) ) ( not ( = ?auto_861164 ?auto_861167 ) ) ( not ( = ?auto_861164 ?auto_861168 ) ) ( not ( = ?auto_861164 ?auto_861169 ) ) ( not ( = ?auto_861164 ?auto_861170 ) ) ( not ( = ?auto_861164 ?auto_861171 ) ) ( not ( = ?auto_861165 ?auto_861166 ) ) ( not ( = ?auto_861165 ?auto_861167 ) ) ( not ( = ?auto_861165 ?auto_861168 ) ) ( not ( = ?auto_861165 ?auto_861169 ) ) ( not ( = ?auto_861165 ?auto_861170 ) ) ( not ( = ?auto_861165 ?auto_861171 ) ) ( not ( = ?auto_861166 ?auto_861167 ) ) ( not ( = ?auto_861166 ?auto_861168 ) ) ( not ( = ?auto_861166 ?auto_861169 ) ) ( not ( = ?auto_861166 ?auto_861170 ) ) ( not ( = ?auto_861166 ?auto_861171 ) ) ( not ( = ?auto_861167 ?auto_861168 ) ) ( not ( = ?auto_861167 ?auto_861169 ) ) ( not ( = ?auto_861167 ?auto_861170 ) ) ( not ( = ?auto_861167 ?auto_861171 ) ) ( not ( = ?auto_861168 ?auto_861169 ) ) ( not ( = ?auto_861168 ?auto_861170 ) ) ( not ( = ?auto_861168 ?auto_861171 ) ) ( not ( = ?auto_861169 ?auto_861170 ) ) ( not ( = ?auto_861169 ?auto_861171 ) ) ( not ( = ?auto_861170 ?auto_861171 ) ) ( ON ?auto_861169 ?auto_861170 ) ( ON ?auto_861168 ?auto_861169 ) ( ON ?auto_861167 ?auto_861168 ) ( ON ?auto_861166 ?auto_861167 ) ( ON ?auto_861165 ?auto_861166 ) ( ON ?auto_861164 ?auto_861165 ) ( ON ?auto_861163 ?auto_861164 ) ( ON ?auto_861162 ?auto_861163 ) ( ON ?auto_861161 ?auto_861162 ) ( ON ?auto_861160 ?auto_861161 ) ( ON ?auto_861159 ?auto_861160 ) ( CLEAR ?auto_861157 ) ( ON ?auto_861158 ?auto_861159 ) ( CLEAR ?auto_861158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_861154 ?auto_861155 ?auto_861156 ?auto_861157 ?auto_861158 )
      ( MAKE-17PILE ?auto_861154 ?auto_861155 ?auto_861156 ?auto_861157 ?auto_861158 ?auto_861159 ?auto_861160 ?auto_861161 ?auto_861162 ?auto_861163 ?auto_861164 ?auto_861165 ?auto_861166 ?auto_861167 ?auto_861168 ?auto_861169 ?auto_861170 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_861224 - BLOCK
      ?auto_861225 - BLOCK
      ?auto_861226 - BLOCK
      ?auto_861227 - BLOCK
      ?auto_861228 - BLOCK
      ?auto_861229 - BLOCK
      ?auto_861230 - BLOCK
      ?auto_861231 - BLOCK
      ?auto_861232 - BLOCK
      ?auto_861233 - BLOCK
      ?auto_861234 - BLOCK
      ?auto_861235 - BLOCK
      ?auto_861236 - BLOCK
      ?auto_861237 - BLOCK
      ?auto_861238 - BLOCK
      ?auto_861239 - BLOCK
      ?auto_861240 - BLOCK
    )
    :vars
    (
      ?auto_861241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861240 ?auto_861241 ) ( ON-TABLE ?auto_861224 ) ( ON ?auto_861225 ?auto_861224 ) ( ON ?auto_861226 ?auto_861225 ) ( not ( = ?auto_861224 ?auto_861225 ) ) ( not ( = ?auto_861224 ?auto_861226 ) ) ( not ( = ?auto_861224 ?auto_861227 ) ) ( not ( = ?auto_861224 ?auto_861228 ) ) ( not ( = ?auto_861224 ?auto_861229 ) ) ( not ( = ?auto_861224 ?auto_861230 ) ) ( not ( = ?auto_861224 ?auto_861231 ) ) ( not ( = ?auto_861224 ?auto_861232 ) ) ( not ( = ?auto_861224 ?auto_861233 ) ) ( not ( = ?auto_861224 ?auto_861234 ) ) ( not ( = ?auto_861224 ?auto_861235 ) ) ( not ( = ?auto_861224 ?auto_861236 ) ) ( not ( = ?auto_861224 ?auto_861237 ) ) ( not ( = ?auto_861224 ?auto_861238 ) ) ( not ( = ?auto_861224 ?auto_861239 ) ) ( not ( = ?auto_861224 ?auto_861240 ) ) ( not ( = ?auto_861224 ?auto_861241 ) ) ( not ( = ?auto_861225 ?auto_861226 ) ) ( not ( = ?auto_861225 ?auto_861227 ) ) ( not ( = ?auto_861225 ?auto_861228 ) ) ( not ( = ?auto_861225 ?auto_861229 ) ) ( not ( = ?auto_861225 ?auto_861230 ) ) ( not ( = ?auto_861225 ?auto_861231 ) ) ( not ( = ?auto_861225 ?auto_861232 ) ) ( not ( = ?auto_861225 ?auto_861233 ) ) ( not ( = ?auto_861225 ?auto_861234 ) ) ( not ( = ?auto_861225 ?auto_861235 ) ) ( not ( = ?auto_861225 ?auto_861236 ) ) ( not ( = ?auto_861225 ?auto_861237 ) ) ( not ( = ?auto_861225 ?auto_861238 ) ) ( not ( = ?auto_861225 ?auto_861239 ) ) ( not ( = ?auto_861225 ?auto_861240 ) ) ( not ( = ?auto_861225 ?auto_861241 ) ) ( not ( = ?auto_861226 ?auto_861227 ) ) ( not ( = ?auto_861226 ?auto_861228 ) ) ( not ( = ?auto_861226 ?auto_861229 ) ) ( not ( = ?auto_861226 ?auto_861230 ) ) ( not ( = ?auto_861226 ?auto_861231 ) ) ( not ( = ?auto_861226 ?auto_861232 ) ) ( not ( = ?auto_861226 ?auto_861233 ) ) ( not ( = ?auto_861226 ?auto_861234 ) ) ( not ( = ?auto_861226 ?auto_861235 ) ) ( not ( = ?auto_861226 ?auto_861236 ) ) ( not ( = ?auto_861226 ?auto_861237 ) ) ( not ( = ?auto_861226 ?auto_861238 ) ) ( not ( = ?auto_861226 ?auto_861239 ) ) ( not ( = ?auto_861226 ?auto_861240 ) ) ( not ( = ?auto_861226 ?auto_861241 ) ) ( not ( = ?auto_861227 ?auto_861228 ) ) ( not ( = ?auto_861227 ?auto_861229 ) ) ( not ( = ?auto_861227 ?auto_861230 ) ) ( not ( = ?auto_861227 ?auto_861231 ) ) ( not ( = ?auto_861227 ?auto_861232 ) ) ( not ( = ?auto_861227 ?auto_861233 ) ) ( not ( = ?auto_861227 ?auto_861234 ) ) ( not ( = ?auto_861227 ?auto_861235 ) ) ( not ( = ?auto_861227 ?auto_861236 ) ) ( not ( = ?auto_861227 ?auto_861237 ) ) ( not ( = ?auto_861227 ?auto_861238 ) ) ( not ( = ?auto_861227 ?auto_861239 ) ) ( not ( = ?auto_861227 ?auto_861240 ) ) ( not ( = ?auto_861227 ?auto_861241 ) ) ( not ( = ?auto_861228 ?auto_861229 ) ) ( not ( = ?auto_861228 ?auto_861230 ) ) ( not ( = ?auto_861228 ?auto_861231 ) ) ( not ( = ?auto_861228 ?auto_861232 ) ) ( not ( = ?auto_861228 ?auto_861233 ) ) ( not ( = ?auto_861228 ?auto_861234 ) ) ( not ( = ?auto_861228 ?auto_861235 ) ) ( not ( = ?auto_861228 ?auto_861236 ) ) ( not ( = ?auto_861228 ?auto_861237 ) ) ( not ( = ?auto_861228 ?auto_861238 ) ) ( not ( = ?auto_861228 ?auto_861239 ) ) ( not ( = ?auto_861228 ?auto_861240 ) ) ( not ( = ?auto_861228 ?auto_861241 ) ) ( not ( = ?auto_861229 ?auto_861230 ) ) ( not ( = ?auto_861229 ?auto_861231 ) ) ( not ( = ?auto_861229 ?auto_861232 ) ) ( not ( = ?auto_861229 ?auto_861233 ) ) ( not ( = ?auto_861229 ?auto_861234 ) ) ( not ( = ?auto_861229 ?auto_861235 ) ) ( not ( = ?auto_861229 ?auto_861236 ) ) ( not ( = ?auto_861229 ?auto_861237 ) ) ( not ( = ?auto_861229 ?auto_861238 ) ) ( not ( = ?auto_861229 ?auto_861239 ) ) ( not ( = ?auto_861229 ?auto_861240 ) ) ( not ( = ?auto_861229 ?auto_861241 ) ) ( not ( = ?auto_861230 ?auto_861231 ) ) ( not ( = ?auto_861230 ?auto_861232 ) ) ( not ( = ?auto_861230 ?auto_861233 ) ) ( not ( = ?auto_861230 ?auto_861234 ) ) ( not ( = ?auto_861230 ?auto_861235 ) ) ( not ( = ?auto_861230 ?auto_861236 ) ) ( not ( = ?auto_861230 ?auto_861237 ) ) ( not ( = ?auto_861230 ?auto_861238 ) ) ( not ( = ?auto_861230 ?auto_861239 ) ) ( not ( = ?auto_861230 ?auto_861240 ) ) ( not ( = ?auto_861230 ?auto_861241 ) ) ( not ( = ?auto_861231 ?auto_861232 ) ) ( not ( = ?auto_861231 ?auto_861233 ) ) ( not ( = ?auto_861231 ?auto_861234 ) ) ( not ( = ?auto_861231 ?auto_861235 ) ) ( not ( = ?auto_861231 ?auto_861236 ) ) ( not ( = ?auto_861231 ?auto_861237 ) ) ( not ( = ?auto_861231 ?auto_861238 ) ) ( not ( = ?auto_861231 ?auto_861239 ) ) ( not ( = ?auto_861231 ?auto_861240 ) ) ( not ( = ?auto_861231 ?auto_861241 ) ) ( not ( = ?auto_861232 ?auto_861233 ) ) ( not ( = ?auto_861232 ?auto_861234 ) ) ( not ( = ?auto_861232 ?auto_861235 ) ) ( not ( = ?auto_861232 ?auto_861236 ) ) ( not ( = ?auto_861232 ?auto_861237 ) ) ( not ( = ?auto_861232 ?auto_861238 ) ) ( not ( = ?auto_861232 ?auto_861239 ) ) ( not ( = ?auto_861232 ?auto_861240 ) ) ( not ( = ?auto_861232 ?auto_861241 ) ) ( not ( = ?auto_861233 ?auto_861234 ) ) ( not ( = ?auto_861233 ?auto_861235 ) ) ( not ( = ?auto_861233 ?auto_861236 ) ) ( not ( = ?auto_861233 ?auto_861237 ) ) ( not ( = ?auto_861233 ?auto_861238 ) ) ( not ( = ?auto_861233 ?auto_861239 ) ) ( not ( = ?auto_861233 ?auto_861240 ) ) ( not ( = ?auto_861233 ?auto_861241 ) ) ( not ( = ?auto_861234 ?auto_861235 ) ) ( not ( = ?auto_861234 ?auto_861236 ) ) ( not ( = ?auto_861234 ?auto_861237 ) ) ( not ( = ?auto_861234 ?auto_861238 ) ) ( not ( = ?auto_861234 ?auto_861239 ) ) ( not ( = ?auto_861234 ?auto_861240 ) ) ( not ( = ?auto_861234 ?auto_861241 ) ) ( not ( = ?auto_861235 ?auto_861236 ) ) ( not ( = ?auto_861235 ?auto_861237 ) ) ( not ( = ?auto_861235 ?auto_861238 ) ) ( not ( = ?auto_861235 ?auto_861239 ) ) ( not ( = ?auto_861235 ?auto_861240 ) ) ( not ( = ?auto_861235 ?auto_861241 ) ) ( not ( = ?auto_861236 ?auto_861237 ) ) ( not ( = ?auto_861236 ?auto_861238 ) ) ( not ( = ?auto_861236 ?auto_861239 ) ) ( not ( = ?auto_861236 ?auto_861240 ) ) ( not ( = ?auto_861236 ?auto_861241 ) ) ( not ( = ?auto_861237 ?auto_861238 ) ) ( not ( = ?auto_861237 ?auto_861239 ) ) ( not ( = ?auto_861237 ?auto_861240 ) ) ( not ( = ?auto_861237 ?auto_861241 ) ) ( not ( = ?auto_861238 ?auto_861239 ) ) ( not ( = ?auto_861238 ?auto_861240 ) ) ( not ( = ?auto_861238 ?auto_861241 ) ) ( not ( = ?auto_861239 ?auto_861240 ) ) ( not ( = ?auto_861239 ?auto_861241 ) ) ( not ( = ?auto_861240 ?auto_861241 ) ) ( ON ?auto_861239 ?auto_861240 ) ( ON ?auto_861238 ?auto_861239 ) ( ON ?auto_861237 ?auto_861238 ) ( ON ?auto_861236 ?auto_861237 ) ( ON ?auto_861235 ?auto_861236 ) ( ON ?auto_861234 ?auto_861235 ) ( ON ?auto_861233 ?auto_861234 ) ( ON ?auto_861232 ?auto_861233 ) ( ON ?auto_861231 ?auto_861232 ) ( ON ?auto_861230 ?auto_861231 ) ( ON ?auto_861229 ?auto_861230 ) ( ON ?auto_861228 ?auto_861229 ) ( CLEAR ?auto_861226 ) ( ON ?auto_861227 ?auto_861228 ) ( CLEAR ?auto_861227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_861224 ?auto_861225 ?auto_861226 ?auto_861227 )
      ( MAKE-17PILE ?auto_861224 ?auto_861225 ?auto_861226 ?auto_861227 ?auto_861228 ?auto_861229 ?auto_861230 ?auto_861231 ?auto_861232 ?auto_861233 ?auto_861234 ?auto_861235 ?auto_861236 ?auto_861237 ?auto_861238 ?auto_861239 ?auto_861240 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_861294 - BLOCK
      ?auto_861295 - BLOCK
      ?auto_861296 - BLOCK
      ?auto_861297 - BLOCK
      ?auto_861298 - BLOCK
      ?auto_861299 - BLOCK
      ?auto_861300 - BLOCK
      ?auto_861301 - BLOCK
      ?auto_861302 - BLOCK
      ?auto_861303 - BLOCK
      ?auto_861304 - BLOCK
      ?auto_861305 - BLOCK
      ?auto_861306 - BLOCK
      ?auto_861307 - BLOCK
      ?auto_861308 - BLOCK
      ?auto_861309 - BLOCK
      ?auto_861310 - BLOCK
    )
    :vars
    (
      ?auto_861311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861310 ?auto_861311 ) ( ON-TABLE ?auto_861294 ) ( ON ?auto_861295 ?auto_861294 ) ( not ( = ?auto_861294 ?auto_861295 ) ) ( not ( = ?auto_861294 ?auto_861296 ) ) ( not ( = ?auto_861294 ?auto_861297 ) ) ( not ( = ?auto_861294 ?auto_861298 ) ) ( not ( = ?auto_861294 ?auto_861299 ) ) ( not ( = ?auto_861294 ?auto_861300 ) ) ( not ( = ?auto_861294 ?auto_861301 ) ) ( not ( = ?auto_861294 ?auto_861302 ) ) ( not ( = ?auto_861294 ?auto_861303 ) ) ( not ( = ?auto_861294 ?auto_861304 ) ) ( not ( = ?auto_861294 ?auto_861305 ) ) ( not ( = ?auto_861294 ?auto_861306 ) ) ( not ( = ?auto_861294 ?auto_861307 ) ) ( not ( = ?auto_861294 ?auto_861308 ) ) ( not ( = ?auto_861294 ?auto_861309 ) ) ( not ( = ?auto_861294 ?auto_861310 ) ) ( not ( = ?auto_861294 ?auto_861311 ) ) ( not ( = ?auto_861295 ?auto_861296 ) ) ( not ( = ?auto_861295 ?auto_861297 ) ) ( not ( = ?auto_861295 ?auto_861298 ) ) ( not ( = ?auto_861295 ?auto_861299 ) ) ( not ( = ?auto_861295 ?auto_861300 ) ) ( not ( = ?auto_861295 ?auto_861301 ) ) ( not ( = ?auto_861295 ?auto_861302 ) ) ( not ( = ?auto_861295 ?auto_861303 ) ) ( not ( = ?auto_861295 ?auto_861304 ) ) ( not ( = ?auto_861295 ?auto_861305 ) ) ( not ( = ?auto_861295 ?auto_861306 ) ) ( not ( = ?auto_861295 ?auto_861307 ) ) ( not ( = ?auto_861295 ?auto_861308 ) ) ( not ( = ?auto_861295 ?auto_861309 ) ) ( not ( = ?auto_861295 ?auto_861310 ) ) ( not ( = ?auto_861295 ?auto_861311 ) ) ( not ( = ?auto_861296 ?auto_861297 ) ) ( not ( = ?auto_861296 ?auto_861298 ) ) ( not ( = ?auto_861296 ?auto_861299 ) ) ( not ( = ?auto_861296 ?auto_861300 ) ) ( not ( = ?auto_861296 ?auto_861301 ) ) ( not ( = ?auto_861296 ?auto_861302 ) ) ( not ( = ?auto_861296 ?auto_861303 ) ) ( not ( = ?auto_861296 ?auto_861304 ) ) ( not ( = ?auto_861296 ?auto_861305 ) ) ( not ( = ?auto_861296 ?auto_861306 ) ) ( not ( = ?auto_861296 ?auto_861307 ) ) ( not ( = ?auto_861296 ?auto_861308 ) ) ( not ( = ?auto_861296 ?auto_861309 ) ) ( not ( = ?auto_861296 ?auto_861310 ) ) ( not ( = ?auto_861296 ?auto_861311 ) ) ( not ( = ?auto_861297 ?auto_861298 ) ) ( not ( = ?auto_861297 ?auto_861299 ) ) ( not ( = ?auto_861297 ?auto_861300 ) ) ( not ( = ?auto_861297 ?auto_861301 ) ) ( not ( = ?auto_861297 ?auto_861302 ) ) ( not ( = ?auto_861297 ?auto_861303 ) ) ( not ( = ?auto_861297 ?auto_861304 ) ) ( not ( = ?auto_861297 ?auto_861305 ) ) ( not ( = ?auto_861297 ?auto_861306 ) ) ( not ( = ?auto_861297 ?auto_861307 ) ) ( not ( = ?auto_861297 ?auto_861308 ) ) ( not ( = ?auto_861297 ?auto_861309 ) ) ( not ( = ?auto_861297 ?auto_861310 ) ) ( not ( = ?auto_861297 ?auto_861311 ) ) ( not ( = ?auto_861298 ?auto_861299 ) ) ( not ( = ?auto_861298 ?auto_861300 ) ) ( not ( = ?auto_861298 ?auto_861301 ) ) ( not ( = ?auto_861298 ?auto_861302 ) ) ( not ( = ?auto_861298 ?auto_861303 ) ) ( not ( = ?auto_861298 ?auto_861304 ) ) ( not ( = ?auto_861298 ?auto_861305 ) ) ( not ( = ?auto_861298 ?auto_861306 ) ) ( not ( = ?auto_861298 ?auto_861307 ) ) ( not ( = ?auto_861298 ?auto_861308 ) ) ( not ( = ?auto_861298 ?auto_861309 ) ) ( not ( = ?auto_861298 ?auto_861310 ) ) ( not ( = ?auto_861298 ?auto_861311 ) ) ( not ( = ?auto_861299 ?auto_861300 ) ) ( not ( = ?auto_861299 ?auto_861301 ) ) ( not ( = ?auto_861299 ?auto_861302 ) ) ( not ( = ?auto_861299 ?auto_861303 ) ) ( not ( = ?auto_861299 ?auto_861304 ) ) ( not ( = ?auto_861299 ?auto_861305 ) ) ( not ( = ?auto_861299 ?auto_861306 ) ) ( not ( = ?auto_861299 ?auto_861307 ) ) ( not ( = ?auto_861299 ?auto_861308 ) ) ( not ( = ?auto_861299 ?auto_861309 ) ) ( not ( = ?auto_861299 ?auto_861310 ) ) ( not ( = ?auto_861299 ?auto_861311 ) ) ( not ( = ?auto_861300 ?auto_861301 ) ) ( not ( = ?auto_861300 ?auto_861302 ) ) ( not ( = ?auto_861300 ?auto_861303 ) ) ( not ( = ?auto_861300 ?auto_861304 ) ) ( not ( = ?auto_861300 ?auto_861305 ) ) ( not ( = ?auto_861300 ?auto_861306 ) ) ( not ( = ?auto_861300 ?auto_861307 ) ) ( not ( = ?auto_861300 ?auto_861308 ) ) ( not ( = ?auto_861300 ?auto_861309 ) ) ( not ( = ?auto_861300 ?auto_861310 ) ) ( not ( = ?auto_861300 ?auto_861311 ) ) ( not ( = ?auto_861301 ?auto_861302 ) ) ( not ( = ?auto_861301 ?auto_861303 ) ) ( not ( = ?auto_861301 ?auto_861304 ) ) ( not ( = ?auto_861301 ?auto_861305 ) ) ( not ( = ?auto_861301 ?auto_861306 ) ) ( not ( = ?auto_861301 ?auto_861307 ) ) ( not ( = ?auto_861301 ?auto_861308 ) ) ( not ( = ?auto_861301 ?auto_861309 ) ) ( not ( = ?auto_861301 ?auto_861310 ) ) ( not ( = ?auto_861301 ?auto_861311 ) ) ( not ( = ?auto_861302 ?auto_861303 ) ) ( not ( = ?auto_861302 ?auto_861304 ) ) ( not ( = ?auto_861302 ?auto_861305 ) ) ( not ( = ?auto_861302 ?auto_861306 ) ) ( not ( = ?auto_861302 ?auto_861307 ) ) ( not ( = ?auto_861302 ?auto_861308 ) ) ( not ( = ?auto_861302 ?auto_861309 ) ) ( not ( = ?auto_861302 ?auto_861310 ) ) ( not ( = ?auto_861302 ?auto_861311 ) ) ( not ( = ?auto_861303 ?auto_861304 ) ) ( not ( = ?auto_861303 ?auto_861305 ) ) ( not ( = ?auto_861303 ?auto_861306 ) ) ( not ( = ?auto_861303 ?auto_861307 ) ) ( not ( = ?auto_861303 ?auto_861308 ) ) ( not ( = ?auto_861303 ?auto_861309 ) ) ( not ( = ?auto_861303 ?auto_861310 ) ) ( not ( = ?auto_861303 ?auto_861311 ) ) ( not ( = ?auto_861304 ?auto_861305 ) ) ( not ( = ?auto_861304 ?auto_861306 ) ) ( not ( = ?auto_861304 ?auto_861307 ) ) ( not ( = ?auto_861304 ?auto_861308 ) ) ( not ( = ?auto_861304 ?auto_861309 ) ) ( not ( = ?auto_861304 ?auto_861310 ) ) ( not ( = ?auto_861304 ?auto_861311 ) ) ( not ( = ?auto_861305 ?auto_861306 ) ) ( not ( = ?auto_861305 ?auto_861307 ) ) ( not ( = ?auto_861305 ?auto_861308 ) ) ( not ( = ?auto_861305 ?auto_861309 ) ) ( not ( = ?auto_861305 ?auto_861310 ) ) ( not ( = ?auto_861305 ?auto_861311 ) ) ( not ( = ?auto_861306 ?auto_861307 ) ) ( not ( = ?auto_861306 ?auto_861308 ) ) ( not ( = ?auto_861306 ?auto_861309 ) ) ( not ( = ?auto_861306 ?auto_861310 ) ) ( not ( = ?auto_861306 ?auto_861311 ) ) ( not ( = ?auto_861307 ?auto_861308 ) ) ( not ( = ?auto_861307 ?auto_861309 ) ) ( not ( = ?auto_861307 ?auto_861310 ) ) ( not ( = ?auto_861307 ?auto_861311 ) ) ( not ( = ?auto_861308 ?auto_861309 ) ) ( not ( = ?auto_861308 ?auto_861310 ) ) ( not ( = ?auto_861308 ?auto_861311 ) ) ( not ( = ?auto_861309 ?auto_861310 ) ) ( not ( = ?auto_861309 ?auto_861311 ) ) ( not ( = ?auto_861310 ?auto_861311 ) ) ( ON ?auto_861309 ?auto_861310 ) ( ON ?auto_861308 ?auto_861309 ) ( ON ?auto_861307 ?auto_861308 ) ( ON ?auto_861306 ?auto_861307 ) ( ON ?auto_861305 ?auto_861306 ) ( ON ?auto_861304 ?auto_861305 ) ( ON ?auto_861303 ?auto_861304 ) ( ON ?auto_861302 ?auto_861303 ) ( ON ?auto_861301 ?auto_861302 ) ( ON ?auto_861300 ?auto_861301 ) ( ON ?auto_861299 ?auto_861300 ) ( ON ?auto_861298 ?auto_861299 ) ( ON ?auto_861297 ?auto_861298 ) ( CLEAR ?auto_861295 ) ( ON ?auto_861296 ?auto_861297 ) ( CLEAR ?auto_861296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_861294 ?auto_861295 ?auto_861296 )
      ( MAKE-17PILE ?auto_861294 ?auto_861295 ?auto_861296 ?auto_861297 ?auto_861298 ?auto_861299 ?auto_861300 ?auto_861301 ?auto_861302 ?auto_861303 ?auto_861304 ?auto_861305 ?auto_861306 ?auto_861307 ?auto_861308 ?auto_861309 ?auto_861310 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_861364 - BLOCK
      ?auto_861365 - BLOCK
      ?auto_861366 - BLOCK
      ?auto_861367 - BLOCK
      ?auto_861368 - BLOCK
      ?auto_861369 - BLOCK
      ?auto_861370 - BLOCK
      ?auto_861371 - BLOCK
      ?auto_861372 - BLOCK
      ?auto_861373 - BLOCK
      ?auto_861374 - BLOCK
      ?auto_861375 - BLOCK
      ?auto_861376 - BLOCK
      ?auto_861377 - BLOCK
      ?auto_861378 - BLOCK
      ?auto_861379 - BLOCK
      ?auto_861380 - BLOCK
    )
    :vars
    (
      ?auto_861381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861380 ?auto_861381 ) ( ON-TABLE ?auto_861364 ) ( not ( = ?auto_861364 ?auto_861365 ) ) ( not ( = ?auto_861364 ?auto_861366 ) ) ( not ( = ?auto_861364 ?auto_861367 ) ) ( not ( = ?auto_861364 ?auto_861368 ) ) ( not ( = ?auto_861364 ?auto_861369 ) ) ( not ( = ?auto_861364 ?auto_861370 ) ) ( not ( = ?auto_861364 ?auto_861371 ) ) ( not ( = ?auto_861364 ?auto_861372 ) ) ( not ( = ?auto_861364 ?auto_861373 ) ) ( not ( = ?auto_861364 ?auto_861374 ) ) ( not ( = ?auto_861364 ?auto_861375 ) ) ( not ( = ?auto_861364 ?auto_861376 ) ) ( not ( = ?auto_861364 ?auto_861377 ) ) ( not ( = ?auto_861364 ?auto_861378 ) ) ( not ( = ?auto_861364 ?auto_861379 ) ) ( not ( = ?auto_861364 ?auto_861380 ) ) ( not ( = ?auto_861364 ?auto_861381 ) ) ( not ( = ?auto_861365 ?auto_861366 ) ) ( not ( = ?auto_861365 ?auto_861367 ) ) ( not ( = ?auto_861365 ?auto_861368 ) ) ( not ( = ?auto_861365 ?auto_861369 ) ) ( not ( = ?auto_861365 ?auto_861370 ) ) ( not ( = ?auto_861365 ?auto_861371 ) ) ( not ( = ?auto_861365 ?auto_861372 ) ) ( not ( = ?auto_861365 ?auto_861373 ) ) ( not ( = ?auto_861365 ?auto_861374 ) ) ( not ( = ?auto_861365 ?auto_861375 ) ) ( not ( = ?auto_861365 ?auto_861376 ) ) ( not ( = ?auto_861365 ?auto_861377 ) ) ( not ( = ?auto_861365 ?auto_861378 ) ) ( not ( = ?auto_861365 ?auto_861379 ) ) ( not ( = ?auto_861365 ?auto_861380 ) ) ( not ( = ?auto_861365 ?auto_861381 ) ) ( not ( = ?auto_861366 ?auto_861367 ) ) ( not ( = ?auto_861366 ?auto_861368 ) ) ( not ( = ?auto_861366 ?auto_861369 ) ) ( not ( = ?auto_861366 ?auto_861370 ) ) ( not ( = ?auto_861366 ?auto_861371 ) ) ( not ( = ?auto_861366 ?auto_861372 ) ) ( not ( = ?auto_861366 ?auto_861373 ) ) ( not ( = ?auto_861366 ?auto_861374 ) ) ( not ( = ?auto_861366 ?auto_861375 ) ) ( not ( = ?auto_861366 ?auto_861376 ) ) ( not ( = ?auto_861366 ?auto_861377 ) ) ( not ( = ?auto_861366 ?auto_861378 ) ) ( not ( = ?auto_861366 ?auto_861379 ) ) ( not ( = ?auto_861366 ?auto_861380 ) ) ( not ( = ?auto_861366 ?auto_861381 ) ) ( not ( = ?auto_861367 ?auto_861368 ) ) ( not ( = ?auto_861367 ?auto_861369 ) ) ( not ( = ?auto_861367 ?auto_861370 ) ) ( not ( = ?auto_861367 ?auto_861371 ) ) ( not ( = ?auto_861367 ?auto_861372 ) ) ( not ( = ?auto_861367 ?auto_861373 ) ) ( not ( = ?auto_861367 ?auto_861374 ) ) ( not ( = ?auto_861367 ?auto_861375 ) ) ( not ( = ?auto_861367 ?auto_861376 ) ) ( not ( = ?auto_861367 ?auto_861377 ) ) ( not ( = ?auto_861367 ?auto_861378 ) ) ( not ( = ?auto_861367 ?auto_861379 ) ) ( not ( = ?auto_861367 ?auto_861380 ) ) ( not ( = ?auto_861367 ?auto_861381 ) ) ( not ( = ?auto_861368 ?auto_861369 ) ) ( not ( = ?auto_861368 ?auto_861370 ) ) ( not ( = ?auto_861368 ?auto_861371 ) ) ( not ( = ?auto_861368 ?auto_861372 ) ) ( not ( = ?auto_861368 ?auto_861373 ) ) ( not ( = ?auto_861368 ?auto_861374 ) ) ( not ( = ?auto_861368 ?auto_861375 ) ) ( not ( = ?auto_861368 ?auto_861376 ) ) ( not ( = ?auto_861368 ?auto_861377 ) ) ( not ( = ?auto_861368 ?auto_861378 ) ) ( not ( = ?auto_861368 ?auto_861379 ) ) ( not ( = ?auto_861368 ?auto_861380 ) ) ( not ( = ?auto_861368 ?auto_861381 ) ) ( not ( = ?auto_861369 ?auto_861370 ) ) ( not ( = ?auto_861369 ?auto_861371 ) ) ( not ( = ?auto_861369 ?auto_861372 ) ) ( not ( = ?auto_861369 ?auto_861373 ) ) ( not ( = ?auto_861369 ?auto_861374 ) ) ( not ( = ?auto_861369 ?auto_861375 ) ) ( not ( = ?auto_861369 ?auto_861376 ) ) ( not ( = ?auto_861369 ?auto_861377 ) ) ( not ( = ?auto_861369 ?auto_861378 ) ) ( not ( = ?auto_861369 ?auto_861379 ) ) ( not ( = ?auto_861369 ?auto_861380 ) ) ( not ( = ?auto_861369 ?auto_861381 ) ) ( not ( = ?auto_861370 ?auto_861371 ) ) ( not ( = ?auto_861370 ?auto_861372 ) ) ( not ( = ?auto_861370 ?auto_861373 ) ) ( not ( = ?auto_861370 ?auto_861374 ) ) ( not ( = ?auto_861370 ?auto_861375 ) ) ( not ( = ?auto_861370 ?auto_861376 ) ) ( not ( = ?auto_861370 ?auto_861377 ) ) ( not ( = ?auto_861370 ?auto_861378 ) ) ( not ( = ?auto_861370 ?auto_861379 ) ) ( not ( = ?auto_861370 ?auto_861380 ) ) ( not ( = ?auto_861370 ?auto_861381 ) ) ( not ( = ?auto_861371 ?auto_861372 ) ) ( not ( = ?auto_861371 ?auto_861373 ) ) ( not ( = ?auto_861371 ?auto_861374 ) ) ( not ( = ?auto_861371 ?auto_861375 ) ) ( not ( = ?auto_861371 ?auto_861376 ) ) ( not ( = ?auto_861371 ?auto_861377 ) ) ( not ( = ?auto_861371 ?auto_861378 ) ) ( not ( = ?auto_861371 ?auto_861379 ) ) ( not ( = ?auto_861371 ?auto_861380 ) ) ( not ( = ?auto_861371 ?auto_861381 ) ) ( not ( = ?auto_861372 ?auto_861373 ) ) ( not ( = ?auto_861372 ?auto_861374 ) ) ( not ( = ?auto_861372 ?auto_861375 ) ) ( not ( = ?auto_861372 ?auto_861376 ) ) ( not ( = ?auto_861372 ?auto_861377 ) ) ( not ( = ?auto_861372 ?auto_861378 ) ) ( not ( = ?auto_861372 ?auto_861379 ) ) ( not ( = ?auto_861372 ?auto_861380 ) ) ( not ( = ?auto_861372 ?auto_861381 ) ) ( not ( = ?auto_861373 ?auto_861374 ) ) ( not ( = ?auto_861373 ?auto_861375 ) ) ( not ( = ?auto_861373 ?auto_861376 ) ) ( not ( = ?auto_861373 ?auto_861377 ) ) ( not ( = ?auto_861373 ?auto_861378 ) ) ( not ( = ?auto_861373 ?auto_861379 ) ) ( not ( = ?auto_861373 ?auto_861380 ) ) ( not ( = ?auto_861373 ?auto_861381 ) ) ( not ( = ?auto_861374 ?auto_861375 ) ) ( not ( = ?auto_861374 ?auto_861376 ) ) ( not ( = ?auto_861374 ?auto_861377 ) ) ( not ( = ?auto_861374 ?auto_861378 ) ) ( not ( = ?auto_861374 ?auto_861379 ) ) ( not ( = ?auto_861374 ?auto_861380 ) ) ( not ( = ?auto_861374 ?auto_861381 ) ) ( not ( = ?auto_861375 ?auto_861376 ) ) ( not ( = ?auto_861375 ?auto_861377 ) ) ( not ( = ?auto_861375 ?auto_861378 ) ) ( not ( = ?auto_861375 ?auto_861379 ) ) ( not ( = ?auto_861375 ?auto_861380 ) ) ( not ( = ?auto_861375 ?auto_861381 ) ) ( not ( = ?auto_861376 ?auto_861377 ) ) ( not ( = ?auto_861376 ?auto_861378 ) ) ( not ( = ?auto_861376 ?auto_861379 ) ) ( not ( = ?auto_861376 ?auto_861380 ) ) ( not ( = ?auto_861376 ?auto_861381 ) ) ( not ( = ?auto_861377 ?auto_861378 ) ) ( not ( = ?auto_861377 ?auto_861379 ) ) ( not ( = ?auto_861377 ?auto_861380 ) ) ( not ( = ?auto_861377 ?auto_861381 ) ) ( not ( = ?auto_861378 ?auto_861379 ) ) ( not ( = ?auto_861378 ?auto_861380 ) ) ( not ( = ?auto_861378 ?auto_861381 ) ) ( not ( = ?auto_861379 ?auto_861380 ) ) ( not ( = ?auto_861379 ?auto_861381 ) ) ( not ( = ?auto_861380 ?auto_861381 ) ) ( ON ?auto_861379 ?auto_861380 ) ( ON ?auto_861378 ?auto_861379 ) ( ON ?auto_861377 ?auto_861378 ) ( ON ?auto_861376 ?auto_861377 ) ( ON ?auto_861375 ?auto_861376 ) ( ON ?auto_861374 ?auto_861375 ) ( ON ?auto_861373 ?auto_861374 ) ( ON ?auto_861372 ?auto_861373 ) ( ON ?auto_861371 ?auto_861372 ) ( ON ?auto_861370 ?auto_861371 ) ( ON ?auto_861369 ?auto_861370 ) ( ON ?auto_861368 ?auto_861369 ) ( ON ?auto_861367 ?auto_861368 ) ( ON ?auto_861366 ?auto_861367 ) ( CLEAR ?auto_861364 ) ( ON ?auto_861365 ?auto_861366 ) ( CLEAR ?auto_861365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_861364 ?auto_861365 )
      ( MAKE-17PILE ?auto_861364 ?auto_861365 ?auto_861366 ?auto_861367 ?auto_861368 ?auto_861369 ?auto_861370 ?auto_861371 ?auto_861372 ?auto_861373 ?auto_861374 ?auto_861375 ?auto_861376 ?auto_861377 ?auto_861378 ?auto_861379 ?auto_861380 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_861434 - BLOCK
      ?auto_861435 - BLOCK
      ?auto_861436 - BLOCK
      ?auto_861437 - BLOCK
      ?auto_861438 - BLOCK
      ?auto_861439 - BLOCK
      ?auto_861440 - BLOCK
      ?auto_861441 - BLOCK
      ?auto_861442 - BLOCK
      ?auto_861443 - BLOCK
      ?auto_861444 - BLOCK
      ?auto_861445 - BLOCK
      ?auto_861446 - BLOCK
      ?auto_861447 - BLOCK
      ?auto_861448 - BLOCK
      ?auto_861449 - BLOCK
      ?auto_861450 - BLOCK
    )
    :vars
    (
      ?auto_861451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861450 ?auto_861451 ) ( not ( = ?auto_861434 ?auto_861435 ) ) ( not ( = ?auto_861434 ?auto_861436 ) ) ( not ( = ?auto_861434 ?auto_861437 ) ) ( not ( = ?auto_861434 ?auto_861438 ) ) ( not ( = ?auto_861434 ?auto_861439 ) ) ( not ( = ?auto_861434 ?auto_861440 ) ) ( not ( = ?auto_861434 ?auto_861441 ) ) ( not ( = ?auto_861434 ?auto_861442 ) ) ( not ( = ?auto_861434 ?auto_861443 ) ) ( not ( = ?auto_861434 ?auto_861444 ) ) ( not ( = ?auto_861434 ?auto_861445 ) ) ( not ( = ?auto_861434 ?auto_861446 ) ) ( not ( = ?auto_861434 ?auto_861447 ) ) ( not ( = ?auto_861434 ?auto_861448 ) ) ( not ( = ?auto_861434 ?auto_861449 ) ) ( not ( = ?auto_861434 ?auto_861450 ) ) ( not ( = ?auto_861434 ?auto_861451 ) ) ( not ( = ?auto_861435 ?auto_861436 ) ) ( not ( = ?auto_861435 ?auto_861437 ) ) ( not ( = ?auto_861435 ?auto_861438 ) ) ( not ( = ?auto_861435 ?auto_861439 ) ) ( not ( = ?auto_861435 ?auto_861440 ) ) ( not ( = ?auto_861435 ?auto_861441 ) ) ( not ( = ?auto_861435 ?auto_861442 ) ) ( not ( = ?auto_861435 ?auto_861443 ) ) ( not ( = ?auto_861435 ?auto_861444 ) ) ( not ( = ?auto_861435 ?auto_861445 ) ) ( not ( = ?auto_861435 ?auto_861446 ) ) ( not ( = ?auto_861435 ?auto_861447 ) ) ( not ( = ?auto_861435 ?auto_861448 ) ) ( not ( = ?auto_861435 ?auto_861449 ) ) ( not ( = ?auto_861435 ?auto_861450 ) ) ( not ( = ?auto_861435 ?auto_861451 ) ) ( not ( = ?auto_861436 ?auto_861437 ) ) ( not ( = ?auto_861436 ?auto_861438 ) ) ( not ( = ?auto_861436 ?auto_861439 ) ) ( not ( = ?auto_861436 ?auto_861440 ) ) ( not ( = ?auto_861436 ?auto_861441 ) ) ( not ( = ?auto_861436 ?auto_861442 ) ) ( not ( = ?auto_861436 ?auto_861443 ) ) ( not ( = ?auto_861436 ?auto_861444 ) ) ( not ( = ?auto_861436 ?auto_861445 ) ) ( not ( = ?auto_861436 ?auto_861446 ) ) ( not ( = ?auto_861436 ?auto_861447 ) ) ( not ( = ?auto_861436 ?auto_861448 ) ) ( not ( = ?auto_861436 ?auto_861449 ) ) ( not ( = ?auto_861436 ?auto_861450 ) ) ( not ( = ?auto_861436 ?auto_861451 ) ) ( not ( = ?auto_861437 ?auto_861438 ) ) ( not ( = ?auto_861437 ?auto_861439 ) ) ( not ( = ?auto_861437 ?auto_861440 ) ) ( not ( = ?auto_861437 ?auto_861441 ) ) ( not ( = ?auto_861437 ?auto_861442 ) ) ( not ( = ?auto_861437 ?auto_861443 ) ) ( not ( = ?auto_861437 ?auto_861444 ) ) ( not ( = ?auto_861437 ?auto_861445 ) ) ( not ( = ?auto_861437 ?auto_861446 ) ) ( not ( = ?auto_861437 ?auto_861447 ) ) ( not ( = ?auto_861437 ?auto_861448 ) ) ( not ( = ?auto_861437 ?auto_861449 ) ) ( not ( = ?auto_861437 ?auto_861450 ) ) ( not ( = ?auto_861437 ?auto_861451 ) ) ( not ( = ?auto_861438 ?auto_861439 ) ) ( not ( = ?auto_861438 ?auto_861440 ) ) ( not ( = ?auto_861438 ?auto_861441 ) ) ( not ( = ?auto_861438 ?auto_861442 ) ) ( not ( = ?auto_861438 ?auto_861443 ) ) ( not ( = ?auto_861438 ?auto_861444 ) ) ( not ( = ?auto_861438 ?auto_861445 ) ) ( not ( = ?auto_861438 ?auto_861446 ) ) ( not ( = ?auto_861438 ?auto_861447 ) ) ( not ( = ?auto_861438 ?auto_861448 ) ) ( not ( = ?auto_861438 ?auto_861449 ) ) ( not ( = ?auto_861438 ?auto_861450 ) ) ( not ( = ?auto_861438 ?auto_861451 ) ) ( not ( = ?auto_861439 ?auto_861440 ) ) ( not ( = ?auto_861439 ?auto_861441 ) ) ( not ( = ?auto_861439 ?auto_861442 ) ) ( not ( = ?auto_861439 ?auto_861443 ) ) ( not ( = ?auto_861439 ?auto_861444 ) ) ( not ( = ?auto_861439 ?auto_861445 ) ) ( not ( = ?auto_861439 ?auto_861446 ) ) ( not ( = ?auto_861439 ?auto_861447 ) ) ( not ( = ?auto_861439 ?auto_861448 ) ) ( not ( = ?auto_861439 ?auto_861449 ) ) ( not ( = ?auto_861439 ?auto_861450 ) ) ( not ( = ?auto_861439 ?auto_861451 ) ) ( not ( = ?auto_861440 ?auto_861441 ) ) ( not ( = ?auto_861440 ?auto_861442 ) ) ( not ( = ?auto_861440 ?auto_861443 ) ) ( not ( = ?auto_861440 ?auto_861444 ) ) ( not ( = ?auto_861440 ?auto_861445 ) ) ( not ( = ?auto_861440 ?auto_861446 ) ) ( not ( = ?auto_861440 ?auto_861447 ) ) ( not ( = ?auto_861440 ?auto_861448 ) ) ( not ( = ?auto_861440 ?auto_861449 ) ) ( not ( = ?auto_861440 ?auto_861450 ) ) ( not ( = ?auto_861440 ?auto_861451 ) ) ( not ( = ?auto_861441 ?auto_861442 ) ) ( not ( = ?auto_861441 ?auto_861443 ) ) ( not ( = ?auto_861441 ?auto_861444 ) ) ( not ( = ?auto_861441 ?auto_861445 ) ) ( not ( = ?auto_861441 ?auto_861446 ) ) ( not ( = ?auto_861441 ?auto_861447 ) ) ( not ( = ?auto_861441 ?auto_861448 ) ) ( not ( = ?auto_861441 ?auto_861449 ) ) ( not ( = ?auto_861441 ?auto_861450 ) ) ( not ( = ?auto_861441 ?auto_861451 ) ) ( not ( = ?auto_861442 ?auto_861443 ) ) ( not ( = ?auto_861442 ?auto_861444 ) ) ( not ( = ?auto_861442 ?auto_861445 ) ) ( not ( = ?auto_861442 ?auto_861446 ) ) ( not ( = ?auto_861442 ?auto_861447 ) ) ( not ( = ?auto_861442 ?auto_861448 ) ) ( not ( = ?auto_861442 ?auto_861449 ) ) ( not ( = ?auto_861442 ?auto_861450 ) ) ( not ( = ?auto_861442 ?auto_861451 ) ) ( not ( = ?auto_861443 ?auto_861444 ) ) ( not ( = ?auto_861443 ?auto_861445 ) ) ( not ( = ?auto_861443 ?auto_861446 ) ) ( not ( = ?auto_861443 ?auto_861447 ) ) ( not ( = ?auto_861443 ?auto_861448 ) ) ( not ( = ?auto_861443 ?auto_861449 ) ) ( not ( = ?auto_861443 ?auto_861450 ) ) ( not ( = ?auto_861443 ?auto_861451 ) ) ( not ( = ?auto_861444 ?auto_861445 ) ) ( not ( = ?auto_861444 ?auto_861446 ) ) ( not ( = ?auto_861444 ?auto_861447 ) ) ( not ( = ?auto_861444 ?auto_861448 ) ) ( not ( = ?auto_861444 ?auto_861449 ) ) ( not ( = ?auto_861444 ?auto_861450 ) ) ( not ( = ?auto_861444 ?auto_861451 ) ) ( not ( = ?auto_861445 ?auto_861446 ) ) ( not ( = ?auto_861445 ?auto_861447 ) ) ( not ( = ?auto_861445 ?auto_861448 ) ) ( not ( = ?auto_861445 ?auto_861449 ) ) ( not ( = ?auto_861445 ?auto_861450 ) ) ( not ( = ?auto_861445 ?auto_861451 ) ) ( not ( = ?auto_861446 ?auto_861447 ) ) ( not ( = ?auto_861446 ?auto_861448 ) ) ( not ( = ?auto_861446 ?auto_861449 ) ) ( not ( = ?auto_861446 ?auto_861450 ) ) ( not ( = ?auto_861446 ?auto_861451 ) ) ( not ( = ?auto_861447 ?auto_861448 ) ) ( not ( = ?auto_861447 ?auto_861449 ) ) ( not ( = ?auto_861447 ?auto_861450 ) ) ( not ( = ?auto_861447 ?auto_861451 ) ) ( not ( = ?auto_861448 ?auto_861449 ) ) ( not ( = ?auto_861448 ?auto_861450 ) ) ( not ( = ?auto_861448 ?auto_861451 ) ) ( not ( = ?auto_861449 ?auto_861450 ) ) ( not ( = ?auto_861449 ?auto_861451 ) ) ( not ( = ?auto_861450 ?auto_861451 ) ) ( ON ?auto_861449 ?auto_861450 ) ( ON ?auto_861448 ?auto_861449 ) ( ON ?auto_861447 ?auto_861448 ) ( ON ?auto_861446 ?auto_861447 ) ( ON ?auto_861445 ?auto_861446 ) ( ON ?auto_861444 ?auto_861445 ) ( ON ?auto_861443 ?auto_861444 ) ( ON ?auto_861442 ?auto_861443 ) ( ON ?auto_861441 ?auto_861442 ) ( ON ?auto_861440 ?auto_861441 ) ( ON ?auto_861439 ?auto_861440 ) ( ON ?auto_861438 ?auto_861439 ) ( ON ?auto_861437 ?auto_861438 ) ( ON ?auto_861436 ?auto_861437 ) ( ON ?auto_861435 ?auto_861436 ) ( ON ?auto_861434 ?auto_861435 ) ( CLEAR ?auto_861434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_861434 )
      ( MAKE-17PILE ?auto_861434 ?auto_861435 ?auto_861436 ?auto_861437 ?auto_861438 ?auto_861439 ?auto_861440 ?auto_861441 ?auto_861442 ?auto_861443 ?auto_861444 ?auto_861445 ?auto_861446 ?auto_861447 ?auto_861448 ?auto_861449 ?auto_861450 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861505 - BLOCK
      ?auto_861506 - BLOCK
      ?auto_861507 - BLOCK
      ?auto_861508 - BLOCK
      ?auto_861509 - BLOCK
      ?auto_861510 - BLOCK
      ?auto_861511 - BLOCK
      ?auto_861512 - BLOCK
      ?auto_861513 - BLOCK
      ?auto_861514 - BLOCK
      ?auto_861515 - BLOCK
      ?auto_861516 - BLOCK
      ?auto_861517 - BLOCK
      ?auto_861518 - BLOCK
      ?auto_861519 - BLOCK
      ?auto_861520 - BLOCK
      ?auto_861521 - BLOCK
      ?auto_861522 - BLOCK
    )
    :vars
    (
      ?auto_861523 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_861521 ) ( ON ?auto_861522 ?auto_861523 ) ( CLEAR ?auto_861522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_861505 ) ( ON ?auto_861506 ?auto_861505 ) ( ON ?auto_861507 ?auto_861506 ) ( ON ?auto_861508 ?auto_861507 ) ( ON ?auto_861509 ?auto_861508 ) ( ON ?auto_861510 ?auto_861509 ) ( ON ?auto_861511 ?auto_861510 ) ( ON ?auto_861512 ?auto_861511 ) ( ON ?auto_861513 ?auto_861512 ) ( ON ?auto_861514 ?auto_861513 ) ( ON ?auto_861515 ?auto_861514 ) ( ON ?auto_861516 ?auto_861515 ) ( ON ?auto_861517 ?auto_861516 ) ( ON ?auto_861518 ?auto_861517 ) ( ON ?auto_861519 ?auto_861518 ) ( ON ?auto_861520 ?auto_861519 ) ( ON ?auto_861521 ?auto_861520 ) ( not ( = ?auto_861505 ?auto_861506 ) ) ( not ( = ?auto_861505 ?auto_861507 ) ) ( not ( = ?auto_861505 ?auto_861508 ) ) ( not ( = ?auto_861505 ?auto_861509 ) ) ( not ( = ?auto_861505 ?auto_861510 ) ) ( not ( = ?auto_861505 ?auto_861511 ) ) ( not ( = ?auto_861505 ?auto_861512 ) ) ( not ( = ?auto_861505 ?auto_861513 ) ) ( not ( = ?auto_861505 ?auto_861514 ) ) ( not ( = ?auto_861505 ?auto_861515 ) ) ( not ( = ?auto_861505 ?auto_861516 ) ) ( not ( = ?auto_861505 ?auto_861517 ) ) ( not ( = ?auto_861505 ?auto_861518 ) ) ( not ( = ?auto_861505 ?auto_861519 ) ) ( not ( = ?auto_861505 ?auto_861520 ) ) ( not ( = ?auto_861505 ?auto_861521 ) ) ( not ( = ?auto_861505 ?auto_861522 ) ) ( not ( = ?auto_861505 ?auto_861523 ) ) ( not ( = ?auto_861506 ?auto_861507 ) ) ( not ( = ?auto_861506 ?auto_861508 ) ) ( not ( = ?auto_861506 ?auto_861509 ) ) ( not ( = ?auto_861506 ?auto_861510 ) ) ( not ( = ?auto_861506 ?auto_861511 ) ) ( not ( = ?auto_861506 ?auto_861512 ) ) ( not ( = ?auto_861506 ?auto_861513 ) ) ( not ( = ?auto_861506 ?auto_861514 ) ) ( not ( = ?auto_861506 ?auto_861515 ) ) ( not ( = ?auto_861506 ?auto_861516 ) ) ( not ( = ?auto_861506 ?auto_861517 ) ) ( not ( = ?auto_861506 ?auto_861518 ) ) ( not ( = ?auto_861506 ?auto_861519 ) ) ( not ( = ?auto_861506 ?auto_861520 ) ) ( not ( = ?auto_861506 ?auto_861521 ) ) ( not ( = ?auto_861506 ?auto_861522 ) ) ( not ( = ?auto_861506 ?auto_861523 ) ) ( not ( = ?auto_861507 ?auto_861508 ) ) ( not ( = ?auto_861507 ?auto_861509 ) ) ( not ( = ?auto_861507 ?auto_861510 ) ) ( not ( = ?auto_861507 ?auto_861511 ) ) ( not ( = ?auto_861507 ?auto_861512 ) ) ( not ( = ?auto_861507 ?auto_861513 ) ) ( not ( = ?auto_861507 ?auto_861514 ) ) ( not ( = ?auto_861507 ?auto_861515 ) ) ( not ( = ?auto_861507 ?auto_861516 ) ) ( not ( = ?auto_861507 ?auto_861517 ) ) ( not ( = ?auto_861507 ?auto_861518 ) ) ( not ( = ?auto_861507 ?auto_861519 ) ) ( not ( = ?auto_861507 ?auto_861520 ) ) ( not ( = ?auto_861507 ?auto_861521 ) ) ( not ( = ?auto_861507 ?auto_861522 ) ) ( not ( = ?auto_861507 ?auto_861523 ) ) ( not ( = ?auto_861508 ?auto_861509 ) ) ( not ( = ?auto_861508 ?auto_861510 ) ) ( not ( = ?auto_861508 ?auto_861511 ) ) ( not ( = ?auto_861508 ?auto_861512 ) ) ( not ( = ?auto_861508 ?auto_861513 ) ) ( not ( = ?auto_861508 ?auto_861514 ) ) ( not ( = ?auto_861508 ?auto_861515 ) ) ( not ( = ?auto_861508 ?auto_861516 ) ) ( not ( = ?auto_861508 ?auto_861517 ) ) ( not ( = ?auto_861508 ?auto_861518 ) ) ( not ( = ?auto_861508 ?auto_861519 ) ) ( not ( = ?auto_861508 ?auto_861520 ) ) ( not ( = ?auto_861508 ?auto_861521 ) ) ( not ( = ?auto_861508 ?auto_861522 ) ) ( not ( = ?auto_861508 ?auto_861523 ) ) ( not ( = ?auto_861509 ?auto_861510 ) ) ( not ( = ?auto_861509 ?auto_861511 ) ) ( not ( = ?auto_861509 ?auto_861512 ) ) ( not ( = ?auto_861509 ?auto_861513 ) ) ( not ( = ?auto_861509 ?auto_861514 ) ) ( not ( = ?auto_861509 ?auto_861515 ) ) ( not ( = ?auto_861509 ?auto_861516 ) ) ( not ( = ?auto_861509 ?auto_861517 ) ) ( not ( = ?auto_861509 ?auto_861518 ) ) ( not ( = ?auto_861509 ?auto_861519 ) ) ( not ( = ?auto_861509 ?auto_861520 ) ) ( not ( = ?auto_861509 ?auto_861521 ) ) ( not ( = ?auto_861509 ?auto_861522 ) ) ( not ( = ?auto_861509 ?auto_861523 ) ) ( not ( = ?auto_861510 ?auto_861511 ) ) ( not ( = ?auto_861510 ?auto_861512 ) ) ( not ( = ?auto_861510 ?auto_861513 ) ) ( not ( = ?auto_861510 ?auto_861514 ) ) ( not ( = ?auto_861510 ?auto_861515 ) ) ( not ( = ?auto_861510 ?auto_861516 ) ) ( not ( = ?auto_861510 ?auto_861517 ) ) ( not ( = ?auto_861510 ?auto_861518 ) ) ( not ( = ?auto_861510 ?auto_861519 ) ) ( not ( = ?auto_861510 ?auto_861520 ) ) ( not ( = ?auto_861510 ?auto_861521 ) ) ( not ( = ?auto_861510 ?auto_861522 ) ) ( not ( = ?auto_861510 ?auto_861523 ) ) ( not ( = ?auto_861511 ?auto_861512 ) ) ( not ( = ?auto_861511 ?auto_861513 ) ) ( not ( = ?auto_861511 ?auto_861514 ) ) ( not ( = ?auto_861511 ?auto_861515 ) ) ( not ( = ?auto_861511 ?auto_861516 ) ) ( not ( = ?auto_861511 ?auto_861517 ) ) ( not ( = ?auto_861511 ?auto_861518 ) ) ( not ( = ?auto_861511 ?auto_861519 ) ) ( not ( = ?auto_861511 ?auto_861520 ) ) ( not ( = ?auto_861511 ?auto_861521 ) ) ( not ( = ?auto_861511 ?auto_861522 ) ) ( not ( = ?auto_861511 ?auto_861523 ) ) ( not ( = ?auto_861512 ?auto_861513 ) ) ( not ( = ?auto_861512 ?auto_861514 ) ) ( not ( = ?auto_861512 ?auto_861515 ) ) ( not ( = ?auto_861512 ?auto_861516 ) ) ( not ( = ?auto_861512 ?auto_861517 ) ) ( not ( = ?auto_861512 ?auto_861518 ) ) ( not ( = ?auto_861512 ?auto_861519 ) ) ( not ( = ?auto_861512 ?auto_861520 ) ) ( not ( = ?auto_861512 ?auto_861521 ) ) ( not ( = ?auto_861512 ?auto_861522 ) ) ( not ( = ?auto_861512 ?auto_861523 ) ) ( not ( = ?auto_861513 ?auto_861514 ) ) ( not ( = ?auto_861513 ?auto_861515 ) ) ( not ( = ?auto_861513 ?auto_861516 ) ) ( not ( = ?auto_861513 ?auto_861517 ) ) ( not ( = ?auto_861513 ?auto_861518 ) ) ( not ( = ?auto_861513 ?auto_861519 ) ) ( not ( = ?auto_861513 ?auto_861520 ) ) ( not ( = ?auto_861513 ?auto_861521 ) ) ( not ( = ?auto_861513 ?auto_861522 ) ) ( not ( = ?auto_861513 ?auto_861523 ) ) ( not ( = ?auto_861514 ?auto_861515 ) ) ( not ( = ?auto_861514 ?auto_861516 ) ) ( not ( = ?auto_861514 ?auto_861517 ) ) ( not ( = ?auto_861514 ?auto_861518 ) ) ( not ( = ?auto_861514 ?auto_861519 ) ) ( not ( = ?auto_861514 ?auto_861520 ) ) ( not ( = ?auto_861514 ?auto_861521 ) ) ( not ( = ?auto_861514 ?auto_861522 ) ) ( not ( = ?auto_861514 ?auto_861523 ) ) ( not ( = ?auto_861515 ?auto_861516 ) ) ( not ( = ?auto_861515 ?auto_861517 ) ) ( not ( = ?auto_861515 ?auto_861518 ) ) ( not ( = ?auto_861515 ?auto_861519 ) ) ( not ( = ?auto_861515 ?auto_861520 ) ) ( not ( = ?auto_861515 ?auto_861521 ) ) ( not ( = ?auto_861515 ?auto_861522 ) ) ( not ( = ?auto_861515 ?auto_861523 ) ) ( not ( = ?auto_861516 ?auto_861517 ) ) ( not ( = ?auto_861516 ?auto_861518 ) ) ( not ( = ?auto_861516 ?auto_861519 ) ) ( not ( = ?auto_861516 ?auto_861520 ) ) ( not ( = ?auto_861516 ?auto_861521 ) ) ( not ( = ?auto_861516 ?auto_861522 ) ) ( not ( = ?auto_861516 ?auto_861523 ) ) ( not ( = ?auto_861517 ?auto_861518 ) ) ( not ( = ?auto_861517 ?auto_861519 ) ) ( not ( = ?auto_861517 ?auto_861520 ) ) ( not ( = ?auto_861517 ?auto_861521 ) ) ( not ( = ?auto_861517 ?auto_861522 ) ) ( not ( = ?auto_861517 ?auto_861523 ) ) ( not ( = ?auto_861518 ?auto_861519 ) ) ( not ( = ?auto_861518 ?auto_861520 ) ) ( not ( = ?auto_861518 ?auto_861521 ) ) ( not ( = ?auto_861518 ?auto_861522 ) ) ( not ( = ?auto_861518 ?auto_861523 ) ) ( not ( = ?auto_861519 ?auto_861520 ) ) ( not ( = ?auto_861519 ?auto_861521 ) ) ( not ( = ?auto_861519 ?auto_861522 ) ) ( not ( = ?auto_861519 ?auto_861523 ) ) ( not ( = ?auto_861520 ?auto_861521 ) ) ( not ( = ?auto_861520 ?auto_861522 ) ) ( not ( = ?auto_861520 ?auto_861523 ) ) ( not ( = ?auto_861521 ?auto_861522 ) ) ( not ( = ?auto_861521 ?auto_861523 ) ) ( not ( = ?auto_861522 ?auto_861523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_861522 ?auto_861523 )
      ( !STACK ?auto_861522 ?auto_861521 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861542 - BLOCK
      ?auto_861543 - BLOCK
      ?auto_861544 - BLOCK
      ?auto_861545 - BLOCK
      ?auto_861546 - BLOCK
      ?auto_861547 - BLOCK
      ?auto_861548 - BLOCK
      ?auto_861549 - BLOCK
      ?auto_861550 - BLOCK
      ?auto_861551 - BLOCK
      ?auto_861552 - BLOCK
      ?auto_861553 - BLOCK
      ?auto_861554 - BLOCK
      ?auto_861555 - BLOCK
      ?auto_861556 - BLOCK
      ?auto_861557 - BLOCK
      ?auto_861558 - BLOCK
      ?auto_861559 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_861558 ) ( ON-TABLE ?auto_861559 ) ( CLEAR ?auto_861559 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_861542 ) ( ON ?auto_861543 ?auto_861542 ) ( ON ?auto_861544 ?auto_861543 ) ( ON ?auto_861545 ?auto_861544 ) ( ON ?auto_861546 ?auto_861545 ) ( ON ?auto_861547 ?auto_861546 ) ( ON ?auto_861548 ?auto_861547 ) ( ON ?auto_861549 ?auto_861548 ) ( ON ?auto_861550 ?auto_861549 ) ( ON ?auto_861551 ?auto_861550 ) ( ON ?auto_861552 ?auto_861551 ) ( ON ?auto_861553 ?auto_861552 ) ( ON ?auto_861554 ?auto_861553 ) ( ON ?auto_861555 ?auto_861554 ) ( ON ?auto_861556 ?auto_861555 ) ( ON ?auto_861557 ?auto_861556 ) ( ON ?auto_861558 ?auto_861557 ) ( not ( = ?auto_861542 ?auto_861543 ) ) ( not ( = ?auto_861542 ?auto_861544 ) ) ( not ( = ?auto_861542 ?auto_861545 ) ) ( not ( = ?auto_861542 ?auto_861546 ) ) ( not ( = ?auto_861542 ?auto_861547 ) ) ( not ( = ?auto_861542 ?auto_861548 ) ) ( not ( = ?auto_861542 ?auto_861549 ) ) ( not ( = ?auto_861542 ?auto_861550 ) ) ( not ( = ?auto_861542 ?auto_861551 ) ) ( not ( = ?auto_861542 ?auto_861552 ) ) ( not ( = ?auto_861542 ?auto_861553 ) ) ( not ( = ?auto_861542 ?auto_861554 ) ) ( not ( = ?auto_861542 ?auto_861555 ) ) ( not ( = ?auto_861542 ?auto_861556 ) ) ( not ( = ?auto_861542 ?auto_861557 ) ) ( not ( = ?auto_861542 ?auto_861558 ) ) ( not ( = ?auto_861542 ?auto_861559 ) ) ( not ( = ?auto_861543 ?auto_861544 ) ) ( not ( = ?auto_861543 ?auto_861545 ) ) ( not ( = ?auto_861543 ?auto_861546 ) ) ( not ( = ?auto_861543 ?auto_861547 ) ) ( not ( = ?auto_861543 ?auto_861548 ) ) ( not ( = ?auto_861543 ?auto_861549 ) ) ( not ( = ?auto_861543 ?auto_861550 ) ) ( not ( = ?auto_861543 ?auto_861551 ) ) ( not ( = ?auto_861543 ?auto_861552 ) ) ( not ( = ?auto_861543 ?auto_861553 ) ) ( not ( = ?auto_861543 ?auto_861554 ) ) ( not ( = ?auto_861543 ?auto_861555 ) ) ( not ( = ?auto_861543 ?auto_861556 ) ) ( not ( = ?auto_861543 ?auto_861557 ) ) ( not ( = ?auto_861543 ?auto_861558 ) ) ( not ( = ?auto_861543 ?auto_861559 ) ) ( not ( = ?auto_861544 ?auto_861545 ) ) ( not ( = ?auto_861544 ?auto_861546 ) ) ( not ( = ?auto_861544 ?auto_861547 ) ) ( not ( = ?auto_861544 ?auto_861548 ) ) ( not ( = ?auto_861544 ?auto_861549 ) ) ( not ( = ?auto_861544 ?auto_861550 ) ) ( not ( = ?auto_861544 ?auto_861551 ) ) ( not ( = ?auto_861544 ?auto_861552 ) ) ( not ( = ?auto_861544 ?auto_861553 ) ) ( not ( = ?auto_861544 ?auto_861554 ) ) ( not ( = ?auto_861544 ?auto_861555 ) ) ( not ( = ?auto_861544 ?auto_861556 ) ) ( not ( = ?auto_861544 ?auto_861557 ) ) ( not ( = ?auto_861544 ?auto_861558 ) ) ( not ( = ?auto_861544 ?auto_861559 ) ) ( not ( = ?auto_861545 ?auto_861546 ) ) ( not ( = ?auto_861545 ?auto_861547 ) ) ( not ( = ?auto_861545 ?auto_861548 ) ) ( not ( = ?auto_861545 ?auto_861549 ) ) ( not ( = ?auto_861545 ?auto_861550 ) ) ( not ( = ?auto_861545 ?auto_861551 ) ) ( not ( = ?auto_861545 ?auto_861552 ) ) ( not ( = ?auto_861545 ?auto_861553 ) ) ( not ( = ?auto_861545 ?auto_861554 ) ) ( not ( = ?auto_861545 ?auto_861555 ) ) ( not ( = ?auto_861545 ?auto_861556 ) ) ( not ( = ?auto_861545 ?auto_861557 ) ) ( not ( = ?auto_861545 ?auto_861558 ) ) ( not ( = ?auto_861545 ?auto_861559 ) ) ( not ( = ?auto_861546 ?auto_861547 ) ) ( not ( = ?auto_861546 ?auto_861548 ) ) ( not ( = ?auto_861546 ?auto_861549 ) ) ( not ( = ?auto_861546 ?auto_861550 ) ) ( not ( = ?auto_861546 ?auto_861551 ) ) ( not ( = ?auto_861546 ?auto_861552 ) ) ( not ( = ?auto_861546 ?auto_861553 ) ) ( not ( = ?auto_861546 ?auto_861554 ) ) ( not ( = ?auto_861546 ?auto_861555 ) ) ( not ( = ?auto_861546 ?auto_861556 ) ) ( not ( = ?auto_861546 ?auto_861557 ) ) ( not ( = ?auto_861546 ?auto_861558 ) ) ( not ( = ?auto_861546 ?auto_861559 ) ) ( not ( = ?auto_861547 ?auto_861548 ) ) ( not ( = ?auto_861547 ?auto_861549 ) ) ( not ( = ?auto_861547 ?auto_861550 ) ) ( not ( = ?auto_861547 ?auto_861551 ) ) ( not ( = ?auto_861547 ?auto_861552 ) ) ( not ( = ?auto_861547 ?auto_861553 ) ) ( not ( = ?auto_861547 ?auto_861554 ) ) ( not ( = ?auto_861547 ?auto_861555 ) ) ( not ( = ?auto_861547 ?auto_861556 ) ) ( not ( = ?auto_861547 ?auto_861557 ) ) ( not ( = ?auto_861547 ?auto_861558 ) ) ( not ( = ?auto_861547 ?auto_861559 ) ) ( not ( = ?auto_861548 ?auto_861549 ) ) ( not ( = ?auto_861548 ?auto_861550 ) ) ( not ( = ?auto_861548 ?auto_861551 ) ) ( not ( = ?auto_861548 ?auto_861552 ) ) ( not ( = ?auto_861548 ?auto_861553 ) ) ( not ( = ?auto_861548 ?auto_861554 ) ) ( not ( = ?auto_861548 ?auto_861555 ) ) ( not ( = ?auto_861548 ?auto_861556 ) ) ( not ( = ?auto_861548 ?auto_861557 ) ) ( not ( = ?auto_861548 ?auto_861558 ) ) ( not ( = ?auto_861548 ?auto_861559 ) ) ( not ( = ?auto_861549 ?auto_861550 ) ) ( not ( = ?auto_861549 ?auto_861551 ) ) ( not ( = ?auto_861549 ?auto_861552 ) ) ( not ( = ?auto_861549 ?auto_861553 ) ) ( not ( = ?auto_861549 ?auto_861554 ) ) ( not ( = ?auto_861549 ?auto_861555 ) ) ( not ( = ?auto_861549 ?auto_861556 ) ) ( not ( = ?auto_861549 ?auto_861557 ) ) ( not ( = ?auto_861549 ?auto_861558 ) ) ( not ( = ?auto_861549 ?auto_861559 ) ) ( not ( = ?auto_861550 ?auto_861551 ) ) ( not ( = ?auto_861550 ?auto_861552 ) ) ( not ( = ?auto_861550 ?auto_861553 ) ) ( not ( = ?auto_861550 ?auto_861554 ) ) ( not ( = ?auto_861550 ?auto_861555 ) ) ( not ( = ?auto_861550 ?auto_861556 ) ) ( not ( = ?auto_861550 ?auto_861557 ) ) ( not ( = ?auto_861550 ?auto_861558 ) ) ( not ( = ?auto_861550 ?auto_861559 ) ) ( not ( = ?auto_861551 ?auto_861552 ) ) ( not ( = ?auto_861551 ?auto_861553 ) ) ( not ( = ?auto_861551 ?auto_861554 ) ) ( not ( = ?auto_861551 ?auto_861555 ) ) ( not ( = ?auto_861551 ?auto_861556 ) ) ( not ( = ?auto_861551 ?auto_861557 ) ) ( not ( = ?auto_861551 ?auto_861558 ) ) ( not ( = ?auto_861551 ?auto_861559 ) ) ( not ( = ?auto_861552 ?auto_861553 ) ) ( not ( = ?auto_861552 ?auto_861554 ) ) ( not ( = ?auto_861552 ?auto_861555 ) ) ( not ( = ?auto_861552 ?auto_861556 ) ) ( not ( = ?auto_861552 ?auto_861557 ) ) ( not ( = ?auto_861552 ?auto_861558 ) ) ( not ( = ?auto_861552 ?auto_861559 ) ) ( not ( = ?auto_861553 ?auto_861554 ) ) ( not ( = ?auto_861553 ?auto_861555 ) ) ( not ( = ?auto_861553 ?auto_861556 ) ) ( not ( = ?auto_861553 ?auto_861557 ) ) ( not ( = ?auto_861553 ?auto_861558 ) ) ( not ( = ?auto_861553 ?auto_861559 ) ) ( not ( = ?auto_861554 ?auto_861555 ) ) ( not ( = ?auto_861554 ?auto_861556 ) ) ( not ( = ?auto_861554 ?auto_861557 ) ) ( not ( = ?auto_861554 ?auto_861558 ) ) ( not ( = ?auto_861554 ?auto_861559 ) ) ( not ( = ?auto_861555 ?auto_861556 ) ) ( not ( = ?auto_861555 ?auto_861557 ) ) ( not ( = ?auto_861555 ?auto_861558 ) ) ( not ( = ?auto_861555 ?auto_861559 ) ) ( not ( = ?auto_861556 ?auto_861557 ) ) ( not ( = ?auto_861556 ?auto_861558 ) ) ( not ( = ?auto_861556 ?auto_861559 ) ) ( not ( = ?auto_861557 ?auto_861558 ) ) ( not ( = ?auto_861557 ?auto_861559 ) ) ( not ( = ?auto_861558 ?auto_861559 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_861559 )
      ( !STACK ?auto_861559 ?auto_861558 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861578 - BLOCK
      ?auto_861579 - BLOCK
      ?auto_861580 - BLOCK
      ?auto_861581 - BLOCK
      ?auto_861582 - BLOCK
      ?auto_861583 - BLOCK
      ?auto_861584 - BLOCK
      ?auto_861585 - BLOCK
      ?auto_861586 - BLOCK
      ?auto_861587 - BLOCK
      ?auto_861588 - BLOCK
      ?auto_861589 - BLOCK
      ?auto_861590 - BLOCK
      ?auto_861591 - BLOCK
      ?auto_861592 - BLOCK
      ?auto_861593 - BLOCK
      ?auto_861594 - BLOCK
      ?auto_861595 - BLOCK
    )
    :vars
    (
      ?auto_861596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861595 ?auto_861596 ) ( ON-TABLE ?auto_861578 ) ( ON ?auto_861579 ?auto_861578 ) ( ON ?auto_861580 ?auto_861579 ) ( ON ?auto_861581 ?auto_861580 ) ( ON ?auto_861582 ?auto_861581 ) ( ON ?auto_861583 ?auto_861582 ) ( ON ?auto_861584 ?auto_861583 ) ( ON ?auto_861585 ?auto_861584 ) ( ON ?auto_861586 ?auto_861585 ) ( ON ?auto_861587 ?auto_861586 ) ( ON ?auto_861588 ?auto_861587 ) ( ON ?auto_861589 ?auto_861588 ) ( ON ?auto_861590 ?auto_861589 ) ( ON ?auto_861591 ?auto_861590 ) ( ON ?auto_861592 ?auto_861591 ) ( ON ?auto_861593 ?auto_861592 ) ( not ( = ?auto_861578 ?auto_861579 ) ) ( not ( = ?auto_861578 ?auto_861580 ) ) ( not ( = ?auto_861578 ?auto_861581 ) ) ( not ( = ?auto_861578 ?auto_861582 ) ) ( not ( = ?auto_861578 ?auto_861583 ) ) ( not ( = ?auto_861578 ?auto_861584 ) ) ( not ( = ?auto_861578 ?auto_861585 ) ) ( not ( = ?auto_861578 ?auto_861586 ) ) ( not ( = ?auto_861578 ?auto_861587 ) ) ( not ( = ?auto_861578 ?auto_861588 ) ) ( not ( = ?auto_861578 ?auto_861589 ) ) ( not ( = ?auto_861578 ?auto_861590 ) ) ( not ( = ?auto_861578 ?auto_861591 ) ) ( not ( = ?auto_861578 ?auto_861592 ) ) ( not ( = ?auto_861578 ?auto_861593 ) ) ( not ( = ?auto_861578 ?auto_861594 ) ) ( not ( = ?auto_861578 ?auto_861595 ) ) ( not ( = ?auto_861578 ?auto_861596 ) ) ( not ( = ?auto_861579 ?auto_861580 ) ) ( not ( = ?auto_861579 ?auto_861581 ) ) ( not ( = ?auto_861579 ?auto_861582 ) ) ( not ( = ?auto_861579 ?auto_861583 ) ) ( not ( = ?auto_861579 ?auto_861584 ) ) ( not ( = ?auto_861579 ?auto_861585 ) ) ( not ( = ?auto_861579 ?auto_861586 ) ) ( not ( = ?auto_861579 ?auto_861587 ) ) ( not ( = ?auto_861579 ?auto_861588 ) ) ( not ( = ?auto_861579 ?auto_861589 ) ) ( not ( = ?auto_861579 ?auto_861590 ) ) ( not ( = ?auto_861579 ?auto_861591 ) ) ( not ( = ?auto_861579 ?auto_861592 ) ) ( not ( = ?auto_861579 ?auto_861593 ) ) ( not ( = ?auto_861579 ?auto_861594 ) ) ( not ( = ?auto_861579 ?auto_861595 ) ) ( not ( = ?auto_861579 ?auto_861596 ) ) ( not ( = ?auto_861580 ?auto_861581 ) ) ( not ( = ?auto_861580 ?auto_861582 ) ) ( not ( = ?auto_861580 ?auto_861583 ) ) ( not ( = ?auto_861580 ?auto_861584 ) ) ( not ( = ?auto_861580 ?auto_861585 ) ) ( not ( = ?auto_861580 ?auto_861586 ) ) ( not ( = ?auto_861580 ?auto_861587 ) ) ( not ( = ?auto_861580 ?auto_861588 ) ) ( not ( = ?auto_861580 ?auto_861589 ) ) ( not ( = ?auto_861580 ?auto_861590 ) ) ( not ( = ?auto_861580 ?auto_861591 ) ) ( not ( = ?auto_861580 ?auto_861592 ) ) ( not ( = ?auto_861580 ?auto_861593 ) ) ( not ( = ?auto_861580 ?auto_861594 ) ) ( not ( = ?auto_861580 ?auto_861595 ) ) ( not ( = ?auto_861580 ?auto_861596 ) ) ( not ( = ?auto_861581 ?auto_861582 ) ) ( not ( = ?auto_861581 ?auto_861583 ) ) ( not ( = ?auto_861581 ?auto_861584 ) ) ( not ( = ?auto_861581 ?auto_861585 ) ) ( not ( = ?auto_861581 ?auto_861586 ) ) ( not ( = ?auto_861581 ?auto_861587 ) ) ( not ( = ?auto_861581 ?auto_861588 ) ) ( not ( = ?auto_861581 ?auto_861589 ) ) ( not ( = ?auto_861581 ?auto_861590 ) ) ( not ( = ?auto_861581 ?auto_861591 ) ) ( not ( = ?auto_861581 ?auto_861592 ) ) ( not ( = ?auto_861581 ?auto_861593 ) ) ( not ( = ?auto_861581 ?auto_861594 ) ) ( not ( = ?auto_861581 ?auto_861595 ) ) ( not ( = ?auto_861581 ?auto_861596 ) ) ( not ( = ?auto_861582 ?auto_861583 ) ) ( not ( = ?auto_861582 ?auto_861584 ) ) ( not ( = ?auto_861582 ?auto_861585 ) ) ( not ( = ?auto_861582 ?auto_861586 ) ) ( not ( = ?auto_861582 ?auto_861587 ) ) ( not ( = ?auto_861582 ?auto_861588 ) ) ( not ( = ?auto_861582 ?auto_861589 ) ) ( not ( = ?auto_861582 ?auto_861590 ) ) ( not ( = ?auto_861582 ?auto_861591 ) ) ( not ( = ?auto_861582 ?auto_861592 ) ) ( not ( = ?auto_861582 ?auto_861593 ) ) ( not ( = ?auto_861582 ?auto_861594 ) ) ( not ( = ?auto_861582 ?auto_861595 ) ) ( not ( = ?auto_861582 ?auto_861596 ) ) ( not ( = ?auto_861583 ?auto_861584 ) ) ( not ( = ?auto_861583 ?auto_861585 ) ) ( not ( = ?auto_861583 ?auto_861586 ) ) ( not ( = ?auto_861583 ?auto_861587 ) ) ( not ( = ?auto_861583 ?auto_861588 ) ) ( not ( = ?auto_861583 ?auto_861589 ) ) ( not ( = ?auto_861583 ?auto_861590 ) ) ( not ( = ?auto_861583 ?auto_861591 ) ) ( not ( = ?auto_861583 ?auto_861592 ) ) ( not ( = ?auto_861583 ?auto_861593 ) ) ( not ( = ?auto_861583 ?auto_861594 ) ) ( not ( = ?auto_861583 ?auto_861595 ) ) ( not ( = ?auto_861583 ?auto_861596 ) ) ( not ( = ?auto_861584 ?auto_861585 ) ) ( not ( = ?auto_861584 ?auto_861586 ) ) ( not ( = ?auto_861584 ?auto_861587 ) ) ( not ( = ?auto_861584 ?auto_861588 ) ) ( not ( = ?auto_861584 ?auto_861589 ) ) ( not ( = ?auto_861584 ?auto_861590 ) ) ( not ( = ?auto_861584 ?auto_861591 ) ) ( not ( = ?auto_861584 ?auto_861592 ) ) ( not ( = ?auto_861584 ?auto_861593 ) ) ( not ( = ?auto_861584 ?auto_861594 ) ) ( not ( = ?auto_861584 ?auto_861595 ) ) ( not ( = ?auto_861584 ?auto_861596 ) ) ( not ( = ?auto_861585 ?auto_861586 ) ) ( not ( = ?auto_861585 ?auto_861587 ) ) ( not ( = ?auto_861585 ?auto_861588 ) ) ( not ( = ?auto_861585 ?auto_861589 ) ) ( not ( = ?auto_861585 ?auto_861590 ) ) ( not ( = ?auto_861585 ?auto_861591 ) ) ( not ( = ?auto_861585 ?auto_861592 ) ) ( not ( = ?auto_861585 ?auto_861593 ) ) ( not ( = ?auto_861585 ?auto_861594 ) ) ( not ( = ?auto_861585 ?auto_861595 ) ) ( not ( = ?auto_861585 ?auto_861596 ) ) ( not ( = ?auto_861586 ?auto_861587 ) ) ( not ( = ?auto_861586 ?auto_861588 ) ) ( not ( = ?auto_861586 ?auto_861589 ) ) ( not ( = ?auto_861586 ?auto_861590 ) ) ( not ( = ?auto_861586 ?auto_861591 ) ) ( not ( = ?auto_861586 ?auto_861592 ) ) ( not ( = ?auto_861586 ?auto_861593 ) ) ( not ( = ?auto_861586 ?auto_861594 ) ) ( not ( = ?auto_861586 ?auto_861595 ) ) ( not ( = ?auto_861586 ?auto_861596 ) ) ( not ( = ?auto_861587 ?auto_861588 ) ) ( not ( = ?auto_861587 ?auto_861589 ) ) ( not ( = ?auto_861587 ?auto_861590 ) ) ( not ( = ?auto_861587 ?auto_861591 ) ) ( not ( = ?auto_861587 ?auto_861592 ) ) ( not ( = ?auto_861587 ?auto_861593 ) ) ( not ( = ?auto_861587 ?auto_861594 ) ) ( not ( = ?auto_861587 ?auto_861595 ) ) ( not ( = ?auto_861587 ?auto_861596 ) ) ( not ( = ?auto_861588 ?auto_861589 ) ) ( not ( = ?auto_861588 ?auto_861590 ) ) ( not ( = ?auto_861588 ?auto_861591 ) ) ( not ( = ?auto_861588 ?auto_861592 ) ) ( not ( = ?auto_861588 ?auto_861593 ) ) ( not ( = ?auto_861588 ?auto_861594 ) ) ( not ( = ?auto_861588 ?auto_861595 ) ) ( not ( = ?auto_861588 ?auto_861596 ) ) ( not ( = ?auto_861589 ?auto_861590 ) ) ( not ( = ?auto_861589 ?auto_861591 ) ) ( not ( = ?auto_861589 ?auto_861592 ) ) ( not ( = ?auto_861589 ?auto_861593 ) ) ( not ( = ?auto_861589 ?auto_861594 ) ) ( not ( = ?auto_861589 ?auto_861595 ) ) ( not ( = ?auto_861589 ?auto_861596 ) ) ( not ( = ?auto_861590 ?auto_861591 ) ) ( not ( = ?auto_861590 ?auto_861592 ) ) ( not ( = ?auto_861590 ?auto_861593 ) ) ( not ( = ?auto_861590 ?auto_861594 ) ) ( not ( = ?auto_861590 ?auto_861595 ) ) ( not ( = ?auto_861590 ?auto_861596 ) ) ( not ( = ?auto_861591 ?auto_861592 ) ) ( not ( = ?auto_861591 ?auto_861593 ) ) ( not ( = ?auto_861591 ?auto_861594 ) ) ( not ( = ?auto_861591 ?auto_861595 ) ) ( not ( = ?auto_861591 ?auto_861596 ) ) ( not ( = ?auto_861592 ?auto_861593 ) ) ( not ( = ?auto_861592 ?auto_861594 ) ) ( not ( = ?auto_861592 ?auto_861595 ) ) ( not ( = ?auto_861592 ?auto_861596 ) ) ( not ( = ?auto_861593 ?auto_861594 ) ) ( not ( = ?auto_861593 ?auto_861595 ) ) ( not ( = ?auto_861593 ?auto_861596 ) ) ( not ( = ?auto_861594 ?auto_861595 ) ) ( not ( = ?auto_861594 ?auto_861596 ) ) ( not ( = ?auto_861595 ?auto_861596 ) ) ( CLEAR ?auto_861593 ) ( ON ?auto_861594 ?auto_861595 ) ( CLEAR ?auto_861594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_861578 ?auto_861579 ?auto_861580 ?auto_861581 ?auto_861582 ?auto_861583 ?auto_861584 ?auto_861585 ?auto_861586 ?auto_861587 ?auto_861588 ?auto_861589 ?auto_861590 ?auto_861591 ?auto_861592 ?auto_861593 ?auto_861594 )
      ( MAKE-18PILE ?auto_861578 ?auto_861579 ?auto_861580 ?auto_861581 ?auto_861582 ?auto_861583 ?auto_861584 ?auto_861585 ?auto_861586 ?auto_861587 ?auto_861588 ?auto_861589 ?auto_861590 ?auto_861591 ?auto_861592 ?auto_861593 ?auto_861594 ?auto_861595 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861615 - BLOCK
      ?auto_861616 - BLOCK
      ?auto_861617 - BLOCK
      ?auto_861618 - BLOCK
      ?auto_861619 - BLOCK
      ?auto_861620 - BLOCK
      ?auto_861621 - BLOCK
      ?auto_861622 - BLOCK
      ?auto_861623 - BLOCK
      ?auto_861624 - BLOCK
      ?auto_861625 - BLOCK
      ?auto_861626 - BLOCK
      ?auto_861627 - BLOCK
      ?auto_861628 - BLOCK
      ?auto_861629 - BLOCK
      ?auto_861630 - BLOCK
      ?auto_861631 - BLOCK
      ?auto_861632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_861632 ) ( ON-TABLE ?auto_861615 ) ( ON ?auto_861616 ?auto_861615 ) ( ON ?auto_861617 ?auto_861616 ) ( ON ?auto_861618 ?auto_861617 ) ( ON ?auto_861619 ?auto_861618 ) ( ON ?auto_861620 ?auto_861619 ) ( ON ?auto_861621 ?auto_861620 ) ( ON ?auto_861622 ?auto_861621 ) ( ON ?auto_861623 ?auto_861622 ) ( ON ?auto_861624 ?auto_861623 ) ( ON ?auto_861625 ?auto_861624 ) ( ON ?auto_861626 ?auto_861625 ) ( ON ?auto_861627 ?auto_861626 ) ( ON ?auto_861628 ?auto_861627 ) ( ON ?auto_861629 ?auto_861628 ) ( ON ?auto_861630 ?auto_861629 ) ( not ( = ?auto_861615 ?auto_861616 ) ) ( not ( = ?auto_861615 ?auto_861617 ) ) ( not ( = ?auto_861615 ?auto_861618 ) ) ( not ( = ?auto_861615 ?auto_861619 ) ) ( not ( = ?auto_861615 ?auto_861620 ) ) ( not ( = ?auto_861615 ?auto_861621 ) ) ( not ( = ?auto_861615 ?auto_861622 ) ) ( not ( = ?auto_861615 ?auto_861623 ) ) ( not ( = ?auto_861615 ?auto_861624 ) ) ( not ( = ?auto_861615 ?auto_861625 ) ) ( not ( = ?auto_861615 ?auto_861626 ) ) ( not ( = ?auto_861615 ?auto_861627 ) ) ( not ( = ?auto_861615 ?auto_861628 ) ) ( not ( = ?auto_861615 ?auto_861629 ) ) ( not ( = ?auto_861615 ?auto_861630 ) ) ( not ( = ?auto_861615 ?auto_861631 ) ) ( not ( = ?auto_861615 ?auto_861632 ) ) ( not ( = ?auto_861616 ?auto_861617 ) ) ( not ( = ?auto_861616 ?auto_861618 ) ) ( not ( = ?auto_861616 ?auto_861619 ) ) ( not ( = ?auto_861616 ?auto_861620 ) ) ( not ( = ?auto_861616 ?auto_861621 ) ) ( not ( = ?auto_861616 ?auto_861622 ) ) ( not ( = ?auto_861616 ?auto_861623 ) ) ( not ( = ?auto_861616 ?auto_861624 ) ) ( not ( = ?auto_861616 ?auto_861625 ) ) ( not ( = ?auto_861616 ?auto_861626 ) ) ( not ( = ?auto_861616 ?auto_861627 ) ) ( not ( = ?auto_861616 ?auto_861628 ) ) ( not ( = ?auto_861616 ?auto_861629 ) ) ( not ( = ?auto_861616 ?auto_861630 ) ) ( not ( = ?auto_861616 ?auto_861631 ) ) ( not ( = ?auto_861616 ?auto_861632 ) ) ( not ( = ?auto_861617 ?auto_861618 ) ) ( not ( = ?auto_861617 ?auto_861619 ) ) ( not ( = ?auto_861617 ?auto_861620 ) ) ( not ( = ?auto_861617 ?auto_861621 ) ) ( not ( = ?auto_861617 ?auto_861622 ) ) ( not ( = ?auto_861617 ?auto_861623 ) ) ( not ( = ?auto_861617 ?auto_861624 ) ) ( not ( = ?auto_861617 ?auto_861625 ) ) ( not ( = ?auto_861617 ?auto_861626 ) ) ( not ( = ?auto_861617 ?auto_861627 ) ) ( not ( = ?auto_861617 ?auto_861628 ) ) ( not ( = ?auto_861617 ?auto_861629 ) ) ( not ( = ?auto_861617 ?auto_861630 ) ) ( not ( = ?auto_861617 ?auto_861631 ) ) ( not ( = ?auto_861617 ?auto_861632 ) ) ( not ( = ?auto_861618 ?auto_861619 ) ) ( not ( = ?auto_861618 ?auto_861620 ) ) ( not ( = ?auto_861618 ?auto_861621 ) ) ( not ( = ?auto_861618 ?auto_861622 ) ) ( not ( = ?auto_861618 ?auto_861623 ) ) ( not ( = ?auto_861618 ?auto_861624 ) ) ( not ( = ?auto_861618 ?auto_861625 ) ) ( not ( = ?auto_861618 ?auto_861626 ) ) ( not ( = ?auto_861618 ?auto_861627 ) ) ( not ( = ?auto_861618 ?auto_861628 ) ) ( not ( = ?auto_861618 ?auto_861629 ) ) ( not ( = ?auto_861618 ?auto_861630 ) ) ( not ( = ?auto_861618 ?auto_861631 ) ) ( not ( = ?auto_861618 ?auto_861632 ) ) ( not ( = ?auto_861619 ?auto_861620 ) ) ( not ( = ?auto_861619 ?auto_861621 ) ) ( not ( = ?auto_861619 ?auto_861622 ) ) ( not ( = ?auto_861619 ?auto_861623 ) ) ( not ( = ?auto_861619 ?auto_861624 ) ) ( not ( = ?auto_861619 ?auto_861625 ) ) ( not ( = ?auto_861619 ?auto_861626 ) ) ( not ( = ?auto_861619 ?auto_861627 ) ) ( not ( = ?auto_861619 ?auto_861628 ) ) ( not ( = ?auto_861619 ?auto_861629 ) ) ( not ( = ?auto_861619 ?auto_861630 ) ) ( not ( = ?auto_861619 ?auto_861631 ) ) ( not ( = ?auto_861619 ?auto_861632 ) ) ( not ( = ?auto_861620 ?auto_861621 ) ) ( not ( = ?auto_861620 ?auto_861622 ) ) ( not ( = ?auto_861620 ?auto_861623 ) ) ( not ( = ?auto_861620 ?auto_861624 ) ) ( not ( = ?auto_861620 ?auto_861625 ) ) ( not ( = ?auto_861620 ?auto_861626 ) ) ( not ( = ?auto_861620 ?auto_861627 ) ) ( not ( = ?auto_861620 ?auto_861628 ) ) ( not ( = ?auto_861620 ?auto_861629 ) ) ( not ( = ?auto_861620 ?auto_861630 ) ) ( not ( = ?auto_861620 ?auto_861631 ) ) ( not ( = ?auto_861620 ?auto_861632 ) ) ( not ( = ?auto_861621 ?auto_861622 ) ) ( not ( = ?auto_861621 ?auto_861623 ) ) ( not ( = ?auto_861621 ?auto_861624 ) ) ( not ( = ?auto_861621 ?auto_861625 ) ) ( not ( = ?auto_861621 ?auto_861626 ) ) ( not ( = ?auto_861621 ?auto_861627 ) ) ( not ( = ?auto_861621 ?auto_861628 ) ) ( not ( = ?auto_861621 ?auto_861629 ) ) ( not ( = ?auto_861621 ?auto_861630 ) ) ( not ( = ?auto_861621 ?auto_861631 ) ) ( not ( = ?auto_861621 ?auto_861632 ) ) ( not ( = ?auto_861622 ?auto_861623 ) ) ( not ( = ?auto_861622 ?auto_861624 ) ) ( not ( = ?auto_861622 ?auto_861625 ) ) ( not ( = ?auto_861622 ?auto_861626 ) ) ( not ( = ?auto_861622 ?auto_861627 ) ) ( not ( = ?auto_861622 ?auto_861628 ) ) ( not ( = ?auto_861622 ?auto_861629 ) ) ( not ( = ?auto_861622 ?auto_861630 ) ) ( not ( = ?auto_861622 ?auto_861631 ) ) ( not ( = ?auto_861622 ?auto_861632 ) ) ( not ( = ?auto_861623 ?auto_861624 ) ) ( not ( = ?auto_861623 ?auto_861625 ) ) ( not ( = ?auto_861623 ?auto_861626 ) ) ( not ( = ?auto_861623 ?auto_861627 ) ) ( not ( = ?auto_861623 ?auto_861628 ) ) ( not ( = ?auto_861623 ?auto_861629 ) ) ( not ( = ?auto_861623 ?auto_861630 ) ) ( not ( = ?auto_861623 ?auto_861631 ) ) ( not ( = ?auto_861623 ?auto_861632 ) ) ( not ( = ?auto_861624 ?auto_861625 ) ) ( not ( = ?auto_861624 ?auto_861626 ) ) ( not ( = ?auto_861624 ?auto_861627 ) ) ( not ( = ?auto_861624 ?auto_861628 ) ) ( not ( = ?auto_861624 ?auto_861629 ) ) ( not ( = ?auto_861624 ?auto_861630 ) ) ( not ( = ?auto_861624 ?auto_861631 ) ) ( not ( = ?auto_861624 ?auto_861632 ) ) ( not ( = ?auto_861625 ?auto_861626 ) ) ( not ( = ?auto_861625 ?auto_861627 ) ) ( not ( = ?auto_861625 ?auto_861628 ) ) ( not ( = ?auto_861625 ?auto_861629 ) ) ( not ( = ?auto_861625 ?auto_861630 ) ) ( not ( = ?auto_861625 ?auto_861631 ) ) ( not ( = ?auto_861625 ?auto_861632 ) ) ( not ( = ?auto_861626 ?auto_861627 ) ) ( not ( = ?auto_861626 ?auto_861628 ) ) ( not ( = ?auto_861626 ?auto_861629 ) ) ( not ( = ?auto_861626 ?auto_861630 ) ) ( not ( = ?auto_861626 ?auto_861631 ) ) ( not ( = ?auto_861626 ?auto_861632 ) ) ( not ( = ?auto_861627 ?auto_861628 ) ) ( not ( = ?auto_861627 ?auto_861629 ) ) ( not ( = ?auto_861627 ?auto_861630 ) ) ( not ( = ?auto_861627 ?auto_861631 ) ) ( not ( = ?auto_861627 ?auto_861632 ) ) ( not ( = ?auto_861628 ?auto_861629 ) ) ( not ( = ?auto_861628 ?auto_861630 ) ) ( not ( = ?auto_861628 ?auto_861631 ) ) ( not ( = ?auto_861628 ?auto_861632 ) ) ( not ( = ?auto_861629 ?auto_861630 ) ) ( not ( = ?auto_861629 ?auto_861631 ) ) ( not ( = ?auto_861629 ?auto_861632 ) ) ( not ( = ?auto_861630 ?auto_861631 ) ) ( not ( = ?auto_861630 ?auto_861632 ) ) ( not ( = ?auto_861631 ?auto_861632 ) ) ( CLEAR ?auto_861630 ) ( ON ?auto_861631 ?auto_861632 ) ( CLEAR ?auto_861631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_861615 ?auto_861616 ?auto_861617 ?auto_861618 ?auto_861619 ?auto_861620 ?auto_861621 ?auto_861622 ?auto_861623 ?auto_861624 ?auto_861625 ?auto_861626 ?auto_861627 ?auto_861628 ?auto_861629 ?auto_861630 ?auto_861631 )
      ( MAKE-18PILE ?auto_861615 ?auto_861616 ?auto_861617 ?auto_861618 ?auto_861619 ?auto_861620 ?auto_861621 ?auto_861622 ?auto_861623 ?auto_861624 ?auto_861625 ?auto_861626 ?auto_861627 ?auto_861628 ?auto_861629 ?auto_861630 ?auto_861631 ?auto_861632 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861651 - BLOCK
      ?auto_861652 - BLOCK
      ?auto_861653 - BLOCK
      ?auto_861654 - BLOCK
      ?auto_861655 - BLOCK
      ?auto_861656 - BLOCK
      ?auto_861657 - BLOCK
      ?auto_861658 - BLOCK
      ?auto_861659 - BLOCK
      ?auto_861660 - BLOCK
      ?auto_861661 - BLOCK
      ?auto_861662 - BLOCK
      ?auto_861663 - BLOCK
      ?auto_861664 - BLOCK
      ?auto_861665 - BLOCK
      ?auto_861666 - BLOCK
      ?auto_861667 - BLOCK
      ?auto_861668 - BLOCK
    )
    :vars
    (
      ?auto_861669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861668 ?auto_861669 ) ( ON-TABLE ?auto_861651 ) ( ON ?auto_861652 ?auto_861651 ) ( ON ?auto_861653 ?auto_861652 ) ( ON ?auto_861654 ?auto_861653 ) ( ON ?auto_861655 ?auto_861654 ) ( ON ?auto_861656 ?auto_861655 ) ( ON ?auto_861657 ?auto_861656 ) ( ON ?auto_861658 ?auto_861657 ) ( ON ?auto_861659 ?auto_861658 ) ( ON ?auto_861660 ?auto_861659 ) ( ON ?auto_861661 ?auto_861660 ) ( ON ?auto_861662 ?auto_861661 ) ( ON ?auto_861663 ?auto_861662 ) ( ON ?auto_861664 ?auto_861663 ) ( ON ?auto_861665 ?auto_861664 ) ( not ( = ?auto_861651 ?auto_861652 ) ) ( not ( = ?auto_861651 ?auto_861653 ) ) ( not ( = ?auto_861651 ?auto_861654 ) ) ( not ( = ?auto_861651 ?auto_861655 ) ) ( not ( = ?auto_861651 ?auto_861656 ) ) ( not ( = ?auto_861651 ?auto_861657 ) ) ( not ( = ?auto_861651 ?auto_861658 ) ) ( not ( = ?auto_861651 ?auto_861659 ) ) ( not ( = ?auto_861651 ?auto_861660 ) ) ( not ( = ?auto_861651 ?auto_861661 ) ) ( not ( = ?auto_861651 ?auto_861662 ) ) ( not ( = ?auto_861651 ?auto_861663 ) ) ( not ( = ?auto_861651 ?auto_861664 ) ) ( not ( = ?auto_861651 ?auto_861665 ) ) ( not ( = ?auto_861651 ?auto_861666 ) ) ( not ( = ?auto_861651 ?auto_861667 ) ) ( not ( = ?auto_861651 ?auto_861668 ) ) ( not ( = ?auto_861651 ?auto_861669 ) ) ( not ( = ?auto_861652 ?auto_861653 ) ) ( not ( = ?auto_861652 ?auto_861654 ) ) ( not ( = ?auto_861652 ?auto_861655 ) ) ( not ( = ?auto_861652 ?auto_861656 ) ) ( not ( = ?auto_861652 ?auto_861657 ) ) ( not ( = ?auto_861652 ?auto_861658 ) ) ( not ( = ?auto_861652 ?auto_861659 ) ) ( not ( = ?auto_861652 ?auto_861660 ) ) ( not ( = ?auto_861652 ?auto_861661 ) ) ( not ( = ?auto_861652 ?auto_861662 ) ) ( not ( = ?auto_861652 ?auto_861663 ) ) ( not ( = ?auto_861652 ?auto_861664 ) ) ( not ( = ?auto_861652 ?auto_861665 ) ) ( not ( = ?auto_861652 ?auto_861666 ) ) ( not ( = ?auto_861652 ?auto_861667 ) ) ( not ( = ?auto_861652 ?auto_861668 ) ) ( not ( = ?auto_861652 ?auto_861669 ) ) ( not ( = ?auto_861653 ?auto_861654 ) ) ( not ( = ?auto_861653 ?auto_861655 ) ) ( not ( = ?auto_861653 ?auto_861656 ) ) ( not ( = ?auto_861653 ?auto_861657 ) ) ( not ( = ?auto_861653 ?auto_861658 ) ) ( not ( = ?auto_861653 ?auto_861659 ) ) ( not ( = ?auto_861653 ?auto_861660 ) ) ( not ( = ?auto_861653 ?auto_861661 ) ) ( not ( = ?auto_861653 ?auto_861662 ) ) ( not ( = ?auto_861653 ?auto_861663 ) ) ( not ( = ?auto_861653 ?auto_861664 ) ) ( not ( = ?auto_861653 ?auto_861665 ) ) ( not ( = ?auto_861653 ?auto_861666 ) ) ( not ( = ?auto_861653 ?auto_861667 ) ) ( not ( = ?auto_861653 ?auto_861668 ) ) ( not ( = ?auto_861653 ?auto_861669 ) ) ( not ( = ?auto_861654 ?auto_861655 ) ) ( not ( = ?auto_861654 ?auto_861656 ) ) ( not ( = ?auto_861654 ?auto_861657 ) ) ( not ( = ?auto_861654 ?auto_861658 ) ) ( not ( = ?auto_861654 ?auto_861659 ) ) ( not ( = ?auto_861654 ?auto_861660 ) ) ( not ( = ?auto_861654 ?auto_861661 ) ) ( not ( = ?auto_861654 ?auto_861662 ) ) ( not ( = ?auto_861654 ?auto_861663 ) ) ( not ( = ?auto_861654 ?auto_861664 ) ) ( not ( = ?auto_861654 ?auto_861665 ) ) ( not ( = ?auto_861654 ?auto_861666 ) ) ( not ( = ?auto_861654 ?auto_861667 ) ) ( not ( = ?auto_861654 ?auto_861668 ) ) ( not ( = ?auto_861654 ?auto_861669 ) ) ( not ( = ?auto_861655 ?auto_861656 ) ) ( not ( = ?auto_861655 ?auto_861657 ) ) ( not ( = ?auto_861655 ?auto_861658 ) ) ( not ( = ?auto_861655 ?auto_861659 ) ) ( not ( = ?auto_861655 ?auto_861660 ) ) ( not ( = ?auto_861655 ?auto_861661 ) ) ( not ( = ?auto_861655 ?auto_861662 ) ) ( not ( = ?auto_861655 ?auto_861663 ) ) ( not ( = ?auto_861655 ?auto_861664 ) ) ( not ( = ?auto_861655 ?auto_861665 ) ) ( not ( = ?auto_861655 ?auto_861666 ) ) ( not ( = ?auto_861655 ?auto_861667 ) ) ( not ( = ?auto_861655 ?auto_861668 ) ) ( not ( = ?auto_861655 ?auto_861669 ) ) ( not ( = ?auto_861656 ?auto_861657 ) ) ( not ( = ?auto_861656 ?auto_861658 ) ) ( not ( = ?auto_861656 ?auto_861659 ) ) ( not ( = ?auto_861656 ?auto_861660 ) ) ( not ( = ?auto_861656 ?auto_861661 ) ) ( not ( = ?auto_861656 ?auto_861662 ) ) ( not ( = ?auto_861656 ?auto_861663 ) ) ( not ( = ?auto_861656 ?auto_861664 ) ) ( not ( = ?auto_861656 ?auto_861665 ) ) ( not ( = ?auto_861656 ?auto_861666 ) ) ( not ( = ?auto_861656 ?auto_861667 ) ) ( not ( = ?auto_861656 ?auto_861668 ) ) ( not ( = ?auto_861656 ?auto_861669 ) ) ( not ( = ?auto_861657 ?auto_861658 ) ) ( not ( = ?auto_861657 ?auto_861659 ) ) ( not ( = ?auto_861657 ?auto_861660 ) ) ( not ( = ?auto_861657 ?auto_861661 ) ) ( not ( = ?auto_861657 ?auto_861662 ) ) ( not ( = ?auto_861657 ?auto_861663 ) ) ( not ( = ?auto_861657 ?auto_861664 ) ) ( not ( = ?auto_861657 ?auto_861665 ) ) ( not ( = ?auto_861657 ?auto_861666 ) ) ( not ( = ?auto_861657 ?auto_861667 ) ) ( not ( = ?auto_861657 ?auto_861668 ) ) ( not ( = ?auto_861657 ?auto_861669 ) ) ( not ( = ?auto_861658 ?auto_861659 ) ) ( not ( = ?auto_861658 ?auto_861660 ) ) ( not ( = ?auto_861658 ?auto_861661 ) ) ( not ( = ?auto_861658 ?auto_861662 ) ) ( not ( = ?auto_861658 ?auto_861663 ) ) ( not ( = ?auto_861658 ?auto_861664 ) ) ( not ( = ?auto_861658 ?auto_861665 ) ) ( not ( = ?auto_861658 ?auto_861666 ) ) ( not ( = ?auto_861658 ?auto_861667 ) ) ( not ( = ?auto_861658 ?auto_861668 ) ) ( not ( = ?auto_861658 ?auto_861669 ) ) ( not ( = ?auto_861659 ?auto_861660 ) ) ( not ( = ?auto_861659 ?auto_861661 ) ) ( not ( = ?auto_861659 ?auto_861662 ) ) ( not ( = ?auto_861659 ?auto_861663 ) ) ( not ( = ?auto_861659 ?auto_861664 ) ) ( not ( = ?auto_861659 ?auto_861665 ) ) ( not ( = ?auto_861659 ?auto_861666 ) ) ( not ( = ?auto_861659 ?auto_861667 ) ) ( not ( = ?auto_861659 ?auto_861668 ) ) ( not ( = ?auto_861659 ?auto_861669 ) ) ( not ( = ?auto_861660 ?auto_861661 ) ) ( not ( = ?auto_861660 ?auto_861662 ) ) ( not ( = ?auto_861660 ?auto_861663 ) ) ( not ( = ?auto_861660 ?auto_861664 ) ) ( not ( = ?auto_861660 ?auto_861665 ) ) ( not ( = ?auto_861660 ?auto_861666 ) ) ( not ( = ?auto_861660 ?auto_861667 ) ) ( not ( = ?auto_861660 ?auto_861668 ) ) ( not ( = ?auto_861660 ?auto_861669 ) ) ( not ( = ?auto_861661 ?auto_861662 ) ) ( not ( = ?auto_861661 ?auto_861663 ) ) ( not ( = ?auto_861661 ?auto_861664 ) ) ( not ( = ?auto_861661 ?auto_861665 ) ) ( not ( = ?auto_861661 ?auto_861666 ) ) ( not ( = ?auto_861661 ?auto_861667 ) ) ( not ( = ?auto_861661 ?auto_861668 ) ) ( not ( = ?auto_861661 ?auto_861669 ) ) ( not ( = ?auto_861662 ?auto_861663 ) ) ( not ( = ?auto_861662 ?auto_861664 ) ) ( not ( = ?auto_861662 ?auto_861665 ) ) ( not ( = ?auto_861662 ?auto_861666 ) ) ( not ( = ?auto_861662 ?auto_861667 ) ) ( not ( = ?auto_861662 ?auto_861668 ) ) ( not ( = ?auto_861662 ?auto_861669 ) ) ( not ( = ?auto_861663 ?auto_861664 ) ) ( not ( = ?auto_861663 ?auto_861665 ) ) ( not ( = ?auto_861663 ?auto_861666 ) ) ( not ( = ?auto_861663 ?auto_861667 ) ) ( not ( = ?auto_861663 ?auto_861668 ) ) ( not ( = ?auto_861663 ?auto_861669 ) ) ( not ( = ?auto_861664 ?auto_861665 ) ) ( not ( = ?auto_861664 ?auto_861666 ) ) ( not ( = ?auto_861664 ?auto_861667 ) ) ( not ( = ?auto_861664 ?auto_861668 ) ) ( not ( = ?auto_861664 ?auto_861669 ) ) ( not ( = ?auto_861665 ?auto_861666 ) ) ( not ( = ?auto_861665 ?auto_861667 ) ) ( not ( = ?auto_861665 ?auto_861668 ) ) ( not ( = ?auto_861665 ?auto_861669 ) ) ( not ( = ?auto_861666 ?auto_861667 ) ) ( not ( = ?auto_861666 ?auto_861668 ) ) ( not ( = ?auto_861666 ?auto_861669 ) ) ( not ( = ?auto_861667 ?auto_861668 ) ) ( not ( = ?auto_861667 ?auto_861669 ) ) ( not ( = ?auto_861668 ?auto_861669 ) ) ( ON ?auto_861667 ?auto_861668 ) ( CLEAR ?auto_861665 ) ( ON ?auto_861666 ?auto_861667 ) ( CLEAR ?auto_861666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_861651 ?auto_861652 ?auto_861653 ?auto_861654 ?auto_861655 ?auto_861656 ?auto_861657 ?auto_861658 ?auto_861659 ?auto_861660 ?auto_861661 ?auto_861662 ?auto_861663 ?auto_861664 ?auto_861665 ?auto_861666 )
      ( MAKE-18PILE ?auto_861651 ?auto_861652 ?auto_861653 ?auto_861654 ?auto_861655 ?auto_861656 ?auto_861657 ?auto_861658 ?auto_861659 ?auto_861660 ?auto_861661 ?auto_861662 ?auto_861663 ?auto_861664 ?auto_861665 ?auto_861666 ?auto_861667 ?auto_861668 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861688 - BLOCK
      ?auto_861689 - BLOCK
      ?auto_861690 - BLOCK
      ?auto_861691 - BLOCK
      ?auto_861692 - BLOCK
      ?auto_861693 - BLOCK
      ?auto_861694 - BLOCK
      ?auto_861695 - BLOCK
      ?auto_861696 - BLOCK
      ?auto_861697 - BLOCK
      ?auto_861698 - BLOCK
      ?auto_861699 - BLOCK
      ?auto_861700 - BLOCK
      ?auto_861701 - BLOCK
      ?auto_861702 - BLOCK
      ?auto_861703 - BLOCK
      ?auto_861704 - BLOCK
      ?auto_861705 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_861705 ) ( ON-TABLE ?auto_861688 ) ( ON ?auto_861689 ?auto_861688 ) ( ON ?auto_861690 ?auto_861689 ) ( ON ?auto_861691 ?auto_861690 ) ( ON ?auto_861692 ?auto_861691 ) ( ON ?auto_861693 ?auto_861692 ) ( ON ?auto_861694 ?auto_861693 ) ( ON ?auto_861695 ?auto_861694 ) ( ON ?auto_861696 ?auto_861695 ) ( ON ?auto_861697 ?auto_861696 ) ( ON ?auto_861698 ?auto_861697 ) ( ON ?auto_861699 ?auto_861698 ) ( ON ?auto_861700 ?auto_861699 ) ( ON ?auto_861701 ?auto_861700 ) ( ON ?auto_861702 ?auto_861701 ) ( not ( = ?auto_861688 ?auto_861689 ) ) ( not ( = ?auto_861688 ?auto_861690 ) ) ( not ( = ?auto_861688 ?auto_861691 ) ) ( not ( = ?auto_861688 ?auto_861692 ) ) ( not ( = ?auto_861688 ?auto_861693 ) ) ( not ( = ?auto_861688 ?auto_861694 ) ) ( not ( = ?auto_861688 ?auto_861695 ) ) ( not ( = ?auto_861688 ?auto_861696 ) ) ( not ( = ?auto_861688 ?auto_861697 ) ) ( not ( = ?auto_861688 ?auto_861698 ) ) ( not ( = ?auto_861688 ?auto_861699 ) ) ( not ( = ?auto_861688 ?auto_861700 ) ) ( not ( = ?auto_861688 ?auto_861701 ) ) ( not ( = ?auto_861688 ?auto_861702 ) ) ( not ( = ?auto_861688 ?auto_861703 ) ) ( not ( = ?auto_861688 ?auto_861704 ) ) ( not ( = ?auto_861688 ?auto_861705 ) ) ( not ( = ?auto_861689 ?auto_861690 ) ) ( not ( = ?auto_861689 ?auto_861691 ) ) ( not ( = ?auto_861689 ?auto_861692 ) ) ( not ( = ?auto_861689 ?auto_861693 ) ) ( not ( = ?auto_861689 ?auto_861694 ) ) ( not ( = ?auto_861689 ?auto_861695 ) ) ( not ( = ?auto_861689 ?auto_861696 ) ) ( not ( = ?auto_861689 ?auto_861697 ) ) ( not ( = ?auto_861689 ?auto_861698 ) ) ( not ( = ?auto_861689 ?auto_861699 ) ) ( not ( = ?auto_861689 ?auto_861700 ) ) ( not ( = ?auto_861689 ?auto_861701 ) ) ( not ( = ?auto_861689 ?auto_861702 ) ) ( not ( = ?auto_861689 ?auto_861703 ) ) ( not ( = ?auto_861689 ?auto_861704 ) ) ( not ( = ?auto_861689 ?auto_861705 ) ) ( not ( = ?auto_861690 ?auto_861691 ) ) ( not ( = ?auto_861690 ?auto_861692 ) ) ( not ( = ?auto_861690 ?auto_861693 ) ) ( not ( = ?auto_861690 ?auto_861694 ) ) ( not ( = ?auto_861690 ?auto_861695 ) ) ( not ( = ?auto_861690 ?auto_861696 ) ) ( not ( = ?auto_861690 ?auto_861697 ) ) ( not ( = ?auto_861690 ?auto_861698 ) ) ( not ( = ?auto_861690 ?auto_861699 ) ) ( not ( = ?auto_861690 ?auto_861700 ) ) ( not ( = ?auto_861690 ?auto_861701 ) ) ( not ( = ?auto_861690 ?auto_861702 ) ) ( not ( = ?auto_861690 ?auto_861703 ) ) ( not ( = ?auto_861690 ?auto_861704 ) ) ( not ( = ?auto_861690 ?auto_861705 ) ) ( not ( = ?auto_861691 ?auto_861692 ) ) ( not ( = ?auto_861691 ?auto_861693 ) ) ( not ( = ?auto_861691 ?auto_861694 ) ) ( not ( = ?auto_861691 ?auto_861695 ) ) ( not ( = ?auto_861691 ?auto_861696 ) ) ( not ( = ?auto_861691 ?auto_861697 ) ) ( not ( = ?auto_861691 ?auto_861698 ) ) ( not ( = ?auto_861691 ?auto_861699 ) ) ( not ( = ?auto_861691 ?auto_861700 ) ) ( not ( = ?auto_861691 ?auto_861701 ) ) ( not ( = ?auto_861691 ?auto_861702 ) ) ( not ( = ?auto_861691 ?auto_861703 ) ) ( not ( = ?auto_861691 ?auto_861704 ) ) ( not ( = ?auto_861691 ?auto_861705 ) ) ( not ( = ?auto_861692 ?auto_861693 ) ) ( not ( = ?auto_861692 ?auto_861694 ) ) ( not ( = ?auto_861692 ?auto_861695 ) ) ( not ( = ?auto_861692 ?auto_861696 ) ) ( not ( = ?auto_861692 ?auto_861697 ) ) ( not ( = ?auto_861692 ?auto_861698 ) ) ( not ( = ?auto_861692 ?auto_861699 ) ) ( not ( = ?auto_861692 ?auto_861700 ) ) ( not ( = ?auto_861692 ?auto_861701 ) ) ( not ( = ?auto_861692 ?auto_861702 ) ) ( not ( = ?auto_861692 ?auto_861703 ) ) ( not ( = ?auto_861692 ?auto_861704 ) ) ( not ( = ?auto_861692 ?auto_861705 ) ) ( not ( = ?auto_861693 ?auto_861694 ) ) ( not ( = ?auto_861693 ?auto_861695 ) ) ( not ( = ?auto_861693 ?auto_861696 ) ) ( not ( = ?auto_861693 ?auto_861697 ) ) ( not ( = ?auto_861693 ?auto_861698 ) ) ( not ( = ?auto_861693 ?auto_861699 ) ) ( not ( = ?auto_861693 ?auto_861700 ) ) ( not ( = ?auto_861693 ?auto_861701 ) ) ( not ( = ?auto_861693 ?auto_861702 ) ) ( not ( = ?auto_861693 ?auto_861703 ) ) ( not ( = ?auto_861693 ?auto_861704 ) ) ( not ( = ?auto_861693 ?auto_861705 ) ) ( not ( = ?auto_861694 ?auto_861695 ) ) ( not ( = ?auto_861694 ?auto_861696 ) ) ( not ( = ?auto_861694 ?auto_861697 ) ) ( not ( = ?auto_861694 ?auto_861698 ) ) ( not ( = ?auto_861694 ?auto_861699 ) ) ( not ( = ?auto_861694 ?auto_861700 ) ) ( not ( = ?auto_861694 ?auto_861701 ) ) ( not ( = ?auto_861694 ?auto_861702 ) ) ( not ( = ?auto_861694 ?auto_861703 ) ) ( not ( = ?auto_861694 ?auto_861704 ) ) ( not ( = ?auto_861694 ?auto_861705 ) ) ( not ( = ?auto_861695 ?auto_861696 ) ) ( not ( = ?auto_861695 ?auto_861697 ) ) ( not ( = ?auto_861695 ?auto_861698 ) ) ( not ( = ?auto_861695 ?auto_861699 ) ) ( not ( = ?auto_861695 ?auto_861700 ) ) ( not ( = ?auto_861695 ?auto_861701 ) ) ( not ( = ?auto_861695 ?auto_861702 ) ) ( not ( = ?auto_861695 ?auto_861703 ) ) ( not ( = ?auto_861695 ?auto_861704 ) ) ( not ( = ?auto_861695 ?auto_861705 ) ) ( not ( = ?auto_861696 ?auto_861697 ) ) ( not ( = ?auto_861696 ?auto_861698 ) ) ( not ( = ?auto_861696 ?auto_861699 ) ) ( not ( = ?auto_861696 ?auto_861700 ) ) ( not ( = ?auto_861696 ?auto_861701 ) ) ( not ( = ?auto_861696 ?auto_861702 ) ) ( not ( = ?auto_861696 ?auto_861703 ) ) ( not ( = ?auto_861696 ?auto_861704 ) ) ( not ( = ?auto_861696 ?auto_861705 ) ) ( not ( = ?auto_861697 ?auto_861698 ) ) ( not ( = ?auto_861697 ?auto_861699 ) ) ( not ( = ?auto_861697 ?auto_861700 ) ) ( not ( = ?auto_861697 ?auto_861701 ) ) ( not ( = ?auto_861697 ?auto_861702 ) ) ( not ( = ?auto_861697 ?auto_861703 ) ) ( not ( = ?auto_861697 ?auto_861704 ) ) ( not ( = ?auto_861697 ?auto_861705 ) ) ( not ( = ?auto_861698 ?auto_861699 ) ) ( not ( = ?auto_861698 ?auto_861700 ) ) ( not ( = ?auto_861698 ?auto_861701 ) ) ( not ( = ?auto_861698 ?auto_861702 ) ) ( not ( = ?auto_861698 ?auto_861703 ) ) ( not ( = ?auto_861698 ?auto_861704 ) ) ( not ( = ?auto_861698 ?auto_861705 ) ) ( not ( = ?auto_861699 ?auto_861700 ) ) ( not ( = ?auto_861699 ?auto_861701 ) ) ( not ( = ?auto_861699 ?auto_861702 ) ) ( not ( = ?auto_861699 ?auto_861703 ) ) ( not ( = ?auto_861699 ?auto_861704 ) ) ( not ( = ?auto_861699 ?auto_861705 ) ) ( not ( = ?auto_861700 ?auto_861701 ) ) ( not ( = ?auto_861700 ?auto_861702 ) ) ( not ( = ?auto_861700 ?auto_861703 ) ) ( not ( = ?auto_861700 ?auto_861704 ) ) ( not ( = ?auto_861700 ?auto_861705 ) ) ( not ( = ?auto_861701 ?auto_861702 ) ) ( not ( = ?auto_861701 ?auto_861703 ) ) ( not ( = ?auto_861701 ?auto_861704 ) ) ( not ( = ?auto_861701 ?auto_861705 ) ) ( not ( = ?auto_861702 ?auto_861703 ) ) ( not ( = ?auto_861702 ?auto_861704 ) ) ( not ( = ?auto_861702 ?auto_861705 ) ) ( not ( = ?auto_861703 ?auto_861704 ) ) ( not ( = ?auto_861703 ?auto_861705 ) ) ( not ( = ?auto_861704 ?auto_861705 ) ) ( ON ?auto_861704 ?auto_861705 ) ( CLEAR ?auto_861702 ) ( ON ?auto_861703 ?auto_861704 ) ( CLEAR ?auto_861703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_861688 ?auto_861689 ?auto_861690 ?auto_861691 ?auto_861692 ?auto_861693 ?auto_861694 ?auto_861695 ?auto_861696 ?auto_861697 ?auto_861698 ?auto_861699 ?auto_861700 ?auto_861701 ?auto_861702 ?auto_861703 )
      ( MAKE-18PILE ?auto_861688 ?auto_861689 ?auto_861690 ?auto_861691 ?auto_861692 ?auto_861693 ?auto_861694 ?auto_861695 ?auto_861696 ?auto_861697 ?auto_861698 ?auto_861699 ?auto_861700 ?auto_861701 ?auto_861702 ?auto_861703 ?auto_861704 ?auto_861705 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861724 - BLOCK
      ?auto_861725 - BLOCK
      ?auto_861726 - BLOCK
      ?auto_861727 - BLOCK
      ?auto_861728 - BLOCK
      ?auto_861729 - BLOCK
      ?auto_861730 - BLOCK
      ?auto_861731 - BLOCK
      ?auto_861732 - BLOCK
      ?auto_861733 - BLOCK
      ?auto_861734 - BLOCK
      ?auto_861735 - BLOCK
      ?auto_861736 - BLOCK
      ?auto_861737 - BLOCK
      ?auto_861738 - BLOCK
      ?auto_861739 - BLOCK
      ?auto_861740 - BLOCK
      ?auto_861741 - BLOCK
    )
    :vars
    (
      ?auto_861742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861741 ?auto_861742 ) ( ON-TABLE ?auto_861724 ) ( ON ?auto_861725 ?auto_861724 ) ( ON ?auto_861726 ?auto_861725 ) ( ON ?auto_861727 ?auto_861726 ) ( ON ?auto_861728 ?auto_861727 ) ( ON ?auto_861729 ?auto_861728 ) ( ON ?auto_861730 ?auto_861729 ) ( ON ?auto_861731 ?auto_861730 ) ( ON ?auto_861732 ?auto_861731 ) ( ON ?auto_861733 ?auto_861732 ) ( ON ?auto_861734 ?auto_861733 ) ( ON ?auto_861735 ?auto_861734 ) ( ON ?auto_861736 ?auto_861735 ) ( ON ?auto_861737 ?auto_861736 ) ( not ( = ?auto_861724 ?auto_861725 ) ) ( not ( = ?auto_861724 ?auto_861726 ) ) ( not ( = ?auto_861724 ?auto_861727 ) ) ( not ( = ?auto_861724 ?auto_861728 ) ) ( not ( = ?auto_861724 ?auto_861729 ) ) ( not ( = ?auto_861724 ?auto_861730 ) ) ( not ( = ?auto_861724 ?auto_861731 ) ) ( not ( = ?auto_861724 ?auto_861732 ) ) ( not ( = ?auto_861724 ?auto_861733 ) ) ( not ( = ?auto_861724 ?auto_861734 ) ) ( not ( = ?auto_861724 ?auto_861735 ) ) ( not ( = ?auto_861724 ?auto_861736 ) ) ( not ( = ?auto_861724 ?auto_861737 ) ) ( not ( = ?auto_861724 ?auto_861738 ) ) ( not ( = ?auto_861724 ?auto_861739 ) ) ( not ( = ?auto_861724 ?auto_861740 ) ) ( not ( = ?auto_861724 ?auto_861741 ) ) ( not ( = ?auto_861724 ?auto_861742 ) ) ( not ( = ?auto_861725 ?auto_861726 ) ) ( not ( = ?auto_861725 ?auto_861727 ) ) ( not ( = ?auto_861725 ?auto_861728 ) ) ( not ( = ?auto_861725 ?auto_861729 ) ) ( not ( = ?auto_861725 ?auto_861730 ) ) ( not ( = ?auto_861725 ?auto_861731 ) ) ( not ( = ?auto_861725 ?auto_861732 ) ) ( not ( = ?auto_861725 ?auto_861733 ) ) ( not ( = ?auto_861725 ?auto_861734 ) ) ( not ( = ?auto_861725 ?auto_861735 ) ) ( not ( = ?auto_861725 ?auto_861736 ) ) ( not ( = ?auto_861725 ?auto_861737 ) ) ( not ( = ?auto_861725 ?auto_861738 ) ) ( not ( = ?auto_861725 ?auto_861739 ) ) ( not ( = ?auto_861725 ?auto_861740 ) ) ( not ( = ?auto_861725 ?auto_861741 ) ) ( not ( = ?auto_861725 ?auto_861742 ) ) ( not ( = ?auto_861726 ?auto_861727 ) ) ( not ( = ?auto_861726 ?auto_861728 ) ) ( not ( = ?auto_861726 ?auto_861729 ) ) ( not ( = ?auto_861726 ?auto_861730 ) ) ( not ( = ?auto_861726 ?auto_861731 ) ) ( not ( = ?auto_861726 ?auto_861732 ) ) ( not ( = ?auto_861726 ?auto_861733 ) ) ( not ( = ?auto_861726 ?auto_861734 ) ) ( not ( = ?auto_861726 ?auto_861735 ) ) ( not ( = ?auto_861726 ?auto_861736 ) ) ( not ( = ?auto_861726 ?auto_861737 ) ) ( not ( = ?auto_861726 ?auto_861738 ) ) ( not ( = ?auto_861726 ?auto_861739 ) ) ( not ( = ?auto_861726 ?auto_861740 ) ) ( not ( = ?auto_861726 ?auto_861741 ) ) ( not ( = ?auto_861726 ?auto_861742 ) ) ( not ( = ?auto_861727 ?auto_861728 ) ) ( not ( = ?auto_861727 ?auto_861729 ) ) ( not ( = ?auto_861727 ?auto_861730 ) ) ( not ( = ?auto_861727 ?auto_861731 ) ) ( not ( = ?auto_861727 ?auto_861732 ) ) ( not ( = ?auto_861727 ?auto_861733 ) ) ( not ( = ?auto_861727 ?auto_861734 ) ) ( not ( = ?auto_861727 ?auto_861735 ) ) ( not ( = ?auto_861727 ?auto_861736 ) ) ( not ( = ?auto_861727 ?auto_861737 ) ) ( not ( = ?auto_861727 ?auto_861738 ) ) ( not ( = ?auto_861727 ?auto_861739 ) ) ( not ( = ?auto_861727 ?auto_861740 ) ) ( not ( = ?auto_861727 ?auto_861741 ) ) ( not ( = ?auto_861727 ?auto_861742 ) ) ( not ( = ?auto_861728 ?auto_861729 ) ) ( not ( = ?auto_861728 ?auto_861730 ) ) ( not ( = ?auto_861728 ?auto_861731 ) ) ( not ( = ?auto_861728 ?auto_861732 ) ) ( not ( = ?auto_861728 ?auto_861733 ) ) ( not ( = ?auto_861728 ?auto_861734 ) ) ( not ( = ?auto_861728 ?auto_861735 ) ) ( not ( = ?auto_861728 ?auto_861736 ) ) ( not ( = ?auto_861728 ?auto_861737 ) ) ( not ( = ?auto_861728 ?auto_861738 ) ) ( not ( = ?auto_861728 ?auto_861739 ) ) ( not ( = ?auto_861728 ?auto_861740 ) ) ( not ( = ?auto_861728 ?auto_861741 ) ) ( not ( = ?auto_861728 ?auto_861742 ) ) ( not ( = ?auto_861729 ?auto_861730 ) ) ( not ( = ?auto_861729 ?auto_861731 ) ) ( not ( = ?auto_861729 ?auto_861732 ) ) ( not ( = ?auto_861729 ?auto_861733 ) ) ( not ( = ?auto_861729 ?auto_861734 ) ) ( not ( = ?auto_861729 ?auto_861735 ) ) ( not ( = ?auto_861729 ?auto_861736 ) ) ( not ( = ?auto_861729 ?auto_861737 ) ) ( not ( = ?auto_861729 ?auto_861738 ) ) ( not ( = ?auto_861729 ?auto_861739 ) ) ( not ( = ?auto_861729 ?auto_861740 ) ) ( not ( = ?auto_861729 ?auto_861741 ) ) ( not ( = ?auto_861729 ?auto_861742 ) ) ( not ( = ?auto_861730 ?auto_861731 ) ) ( not ( = ?auto_861730 ?auto_861732 ) ) ( not ( = ?auto_861730 ?auto_861733 ) ) ( not ( = ?auto_861730 ?auto_861734 ) ) ( not ( = ?auto_861730 ?auto_861735 ) ) ( not ( = ?auto_861730 ?auto_861736 ) ) ( not ( = ?auto_861730 ?auto_861737 ) ) ( not ( = ?auto_861730 ?auto_861738 ) ) ( not ( = ?auto_861730 ?auto_861739 ) ) ( not ( = ?auto_861730 ?auto_861740 ) ) ( not ( = ?auto_861730 ?auto_861741 ) ) ( not ( = ?auto_861730 ?auto_861742 ) ) ( not ( = ?auto_861731 ?auto_861732 ) ) ( not ( = ?auto_861731 ?auto_861733 ) ) ( not ( = ?auto_861731 ?auto_861734 ) ) ( not ( = ?auto_861731 ?auto_861735 ) ) ( not ( = ?auto_861731 ?auto_861736 ) ) ( not ( = ?auto_861731 ?auto_861737 ) ) ( not ( = ?auto_861731 ?auto_861738 ) ) ( not ( = ?auto_861731 ?auto_861739 ) ) ( not ( = ?auto_861731 ?auto_861740 ) ) ( not ( = ?auto_861731 ?auto_861741 ) ) ( not ( = ?auto_861731 ?auto_861742 ) ) ( not ( = ?auto_861732 ?auto_861733 ) ) ( not ( = ?auto_861732 ?auto_861734 ) ) ( not ( = ?auto_861732 ?auto_861735 ) ) ( not ( = ?auto_861732 ?auto_861736 ) ) ( not ( = ?auto_861732 ?auto_861737 ) ) ( not ( = ?auto_861732 ?auto_861738 ) ) ( not ( = ?auto_861732 ?auto_861739 ) ) ( not ( = ?auto_861732 ?auto_861740 ) ) ( not ( = ?auto_861732 ?auto_861741 ) ) ( not ( = ?auto_861732 ?auto_861742 ) ) ( not ( = ?auto_861733 ?auto_861734 ) ) ( not ( = ?auto_861733 ?auto_861735 ) ) ( not ( = ?auto_861733 ?auto_861736 ) ) ( not ( = ?auto_861733 ?auto_861737 ) ) ( not ( = ?auto_861733 ?auto_861738 ) ) ( not ( = ?auto_861733 ?auto_861739 ) ) ( not ( = ?auto_861733 ?auto_861740 ) ) ( not ( = ?auto_861733 ?auto_861741 ) ) ( not ( = ?auto_861733 ?auto_861742 ) ) ( not ( = ?auto_861734 ?auto_861735 ) ) ( not ( = ?auto_861734 ?auto_861736 ) ) ( not ( = ?auto_861734 ?auto_861737 ) ) ( not ( = ?auto_861734 ?auto_861738 ) ) ( not ( = ?auto_861734 ?auto_861739 ) ) ( not ( = ?auto_861734 ?auto_861740 ) ) ( not ( = ?auto_861734 ?auto_861741 ) ) ( not ( = ?auto_861734 ?auto_861742 ) ) ( not ( = ?auto_861735 ?auto_861736 ) ) ( not ( = ?auto_861735 ?auto_861737 ) ) ( not ( = ?auto_861735 ?auto_861738 ) ) ( not ( = ?auto_861735 ?auto_861739 ) ) ( not ( = ?auto_861735 ?auto_861740 ) ) ( not ( = ?auto_861735 ?auto_861741 ) ) ( not ( = ?auto_861735 ?auto_861742 ) ) ( not ( = ?auto_861736 ?auto_861737 ) ) ( not ( = ?auto_861736 ?auto_861738 ) ) ( not ( = ?auto_861736 ?auto_861739 ) ) ( not ( = ?auto_861736 ?auto_861740 ) ) ( not ( = ?auto_861736 ?auto_861741 ) ) ( not ( = ?auto_861736 ?auto_861742 ) ) ( not ( = ?auto_861737 ?auto_861738 ) ) ( not ( = ?auto_861737 ?auto_861739 ) ) ( not ( = ?auto_861737 ?auto_861740 ) ) ( not ( = ?auto_861737 ?auto_861741 ) ) ( not ( = ?auto_861737 ?auto_861742 ) ) ( not ( = ?auto_861738 ?auto_861739 ) ) ( not ( = ?auto_861738 ?auto_861740 ) ) ( not ( = ?auto_861738 ?auto_861741 ) ) ( not ( = ?auto_861738 ?auto_861742 ) ) ( not ( = ?auto_861739 ?auto_861740 ) ) ( not ( = ?auto_861739 ?auto_861741 ) ) ( not ( = ?auto_861739 ?auto_861742 ) ) ( not ( = ?auto_861740 ?auto_861741 ) ) ( not ( = ?auto_861740 ?auto_861742 ) ) ( not ( = ?auto_861741 ?auto_861742 ) ) ( ON ?auto_861740 ?auto_861741 ) ( ON ?auto_861739 ?auto_861740 ) ( CLEAR ?auto_861737 ) ( ON ?auto_861738 ?auto_861739 ) ( CLEAR ?auto_861738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_861724 ?auto_861725 ?auto_861726 ?auto_861727 ?auto_861728 ?auto_861729 ?auto_861730 ?auto_861731 ?auto_861732 ?auto_861733 ?auto_861734 ?auto_861735 ?auto_861736 ?auto_861737 ?auto_861738 )
      ( MAKE-18PILE ?auto_861724 ?auto_861725 ?auto_861726 ?auto_861727 ?auto_861728 ?auto_861729 ?auto_861730 ?auto_861731 ?auto_861732 ?auto_861733 ?auto_861734 ?auto_861735 ?auto_861736 ?auto_861737 ?auto_861738 ?auto_861739 ?auto_861740 ?auto_861741 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861761 - BLOCK
      ?auto_861762 - BLOCK
      ?auto_861763 - BLOCK
      ?auto_861764 - BLOCK
      ?auto_861765 - BLOCK
      ?auto_861766 - BLOCK
      ?auto_861767 - BLOCK
      ?auto_861768 - BLOCK
      ?auto_861769 - BLOCK
      ?auto_861770 - BLOCK
      ?auto_861771 - BLOCK
      ?auto_861772 - BLOCK
      ?auto_861773 - BLOCK
      ?auto_861774 - BLOCK
      ?auto_861775 - BLOCK
      ?auto_861776 - BLOCK
      ?auto_861777 - BLOCK
      ?auto_861778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_861778 ) ( ON-TABLE ?auto_861761 ) ( ON ?auto_861762 ?auto_861761 ) ( ON ?auto_861763 ?auto_861762 ) ( ON ?auto_861764 ?auto_861763 ) ( ON ?auto_861765 ?auto_861764 ) ( ON ?auto_861766 ?auto_861765 ) ( ON ?auto_861767 ?auto_861766 ) ( ON ?auto_861768 ?auto_861767 ) ( ON ?auto_861769 ?auto_861768 ) ( ON ?auto_861770 ?auto_861769 ) ( ON ?auto_861771 ?auto_861770 ) ( ON ?auto_861772 ?auto_861771 ) ( ON ?auto_861773 ?auto_861772 ) ( ON ?auto_861774 ?auto_861773 ) ( not ( = ?auto_861761 ?auto_861762 ) ) ( not ( = ?auto_861761 ?auto_861763 ) ) ( not ( = ?auto_861761 ?auto_861764 ) ) ( not ( = ?auto_861761 ?auto_861765 ) ) ( not ( = ?auto_861761 ?auto_861766 ) ) ( not ( = ?auto_861761 ?auto_861767 ) ) ( not ( = ?auto_861761 ?auto_861768 ) ) ( not ( = ?auto_861761 ?auto_861769 ) ) ( not ( = ?auto_861761 ?auto_861770 ) ) ( not ( = ?auto_861761 ?auto_861771 ) ) ( not ( = ?auto_861761 ?auto_861772 ) ) ( not ( = ?auto_861761 ?auto_861773 ) ) ( not ( = ?auto_861761 ?auto_861774 ) ) ( not ( = ?auto_861761 ?auto_861775 ) ) ( not ( = ?auto_861761 ?auto_861776 ) ) ( not ( = ?auto_861761 ?auto_861777 ) ) ( not ( = ?auto_861761 ?auto_861778 ) ) ( not ( = ?auto_861762 ?auto_861763 ) ) ( not ( = ?auto_861762 ?auto_861764 ) ) ( not ( = ?auto_861762 ?auto_861765 ) ) ( not ( = ?auto_861762 ?auto_861766 ) ) ( not ( = ?auto_861762 ?auto_861767 ) ) ( not ( = ?auto_861762 ?auto_861768 ) ) ( not ( = ?auto_861762 ?auto_861769 ) ) ( not ( = ?auto_861762 ?auto_861770 ) ) ( not ( = ?auto_861762 ?auto_861771 ) ) ( not ( = ?auto_861762 ?auto_861772 ) ) ( not ( = ?auto_861762 ?auto_861773 ) ) ( not ( = ?auto_861762 ?auto_861774 ) ) ( not ( = ?auto_861762 ?auto_861775 ) ) ( not ( = ?auto_861762 ?auto_861776 ) ) ( not ( = ?auto_861762 ?auto_861777 ) ) ( not ( = ?auto_861762 ?auto_861778 ) ) ( not ( = ?auto_861763 ?auto_861764 ) ) ( not ( = ?auto_861763 ?auto_861765 ) ) ( not ( = ?auto_861763 ?auto_861766 ) ) ( not ( = ?auto_861763 ?auto_861767 ) ) ( not ( = ?auto_861763 ?auto_861768 ) ) ( not ( = ?auto_861763 ?auto_861769 ) ) ( not ( = ?auto_861763 ?auto_861770 ) ) ( not ( = ?auto_861763 ?auto_861771 ) ) ( not ( = ?auto_861763 ?auto_861772 ) ) ( not ( = ?auto_861763 ?auto_861773 ) ) ( not ( = ?auto_861763 ?auto_861774 ) ) ( not ( = ?auto_861763 ?auto_861775 ) ) ( not ( = ?auto_861763 ?auto_861776 ) ) ( not ( = ?auto_861763 ?auto_861777 ) ) ( not ( = ?auto_861763 ?auto_861778 ) ) ( not ( = ?auto_861764 ?auto_861765 ) ) ( not ( = ?auto_861764 ?auto_861766 ) ) ( not ( = ?auto_861764 ?auto_861767 ) ) ( not ( = ?auto_861764 ?auto_861768 ) ) ( not ( = ?auto_861764 ?auto_861769 ) ) ( not ( = ?auto_861764 ?auto_861770 ) ) ( not ( = ?auto_861764 ?auto_861771 ) ) ( not ( = ?auto_861764 ?auto_861772 ) ) ( not ( = ?auto_861764 ?auto_861773 ) ) ( not ( = ?auto_861764 ?auto_861774 ) ) ( not ( = ?auto_861764 ?auto_861775 ) ) ( not ( = ?auto_861764 ?auto_861776 ) ) ( not ( = ?auto_861764 ?auto_861777 ) ) ( not ( = ?auto_861764 ?auto_861778 ) ) ( not ( = ?auto_861765 ?auto_861766 ) ) ( not ( = ?auto_861765 ?auto_861767 ) ) ( not ( = ?auto_861765 ?auto_861768 ) ) ( not ( = ?auto_861765 ?auto_861769 ) ) ( not ( = ?auto_861765 ?auto_861770 ) ) ( not ( = ?auto_861765 ?auto_861771 ) ) ( not ( = ?auto_861765 ?auto_861772 ) ) ( not ( = ?auto_861765 ?auto_861773 ) ) ( not ( = ?auto_861765 ?auto_861774 ) ) ( not ( = ?auto_861765 ?auto_861775 ) ) ( not ( = ?auto_861765 ?auto_861776 ) ) ( not ( = ?auto_861765 ?auto_861777 ) ) ( not ( = ?auto_861765 ?auto_861778 ) ) ( not ( = ?auto_861766 ?auto_861767 ) ) ( not ( = ?auto_861766 ?auto_861768 ) ) ( not ( = ?auto_861766 ?auto_861769 ) ) ( not ( = ?auto_861766 ?auto_861770 ) ) ( not ( = ?auto_861766 ?auto_861771 ) ) ( not ( = ?auto_861766 ?auto_861772 ) ) ( not ( = ?auto_861766 ?auto_861773 ) ) ( not ( = ?auto_861766 ?auto_861774 ) ) ( not ( = ?auto_861766 ?auto_861775 ) ) ( not ( = ?auto_861766 ?auto_861776 ) ) ( not ( = ?auto_861766 ?auto_861777 ) ) ( not ( = ?auto_861766 ?auto_861778 ) ) ( not ( = ?auto_861767 ?auto_861768 ) ) ( not ( = ?auto_861767 ?auto_861769 ) ) ( not ( = ?auto_861767 ?auto_861770 ) ) ( not ( = ?auto_861767 ?auto_861771 ) ) ( not ( = ?auto_861767 ?auto_861772 ) ) ( not ( = ?auto_861767 ?auto_861773 ) ) ( not ( = ?auto_861767 ?auto_861774 ) ) ( not ( = ?auto_861767 ?auto_861775 ) ) ( not ( = ?auto_861767 ?auto_861776 ) ) ( not ( = ?auto_861767 ?auto_861777 ) ) ( not ( = ?auto_861767 ?auto_861778 ) ) ( not ( = ?auto_861768 ?auto_861769 ) ) ( not ( = ?auto_861768 ?auto_861770 ) ) ( not ( = ?auto_861768 ?auto_861771 ) ) ( not ( = ?auto_861768 ?auto_861772 ) ) ( not ( = ?auto_861768 ?auto_861773 ) ) ( not ( = ?auto_861768 ?auto_861774 ) ) ( not ( = ?auto_861768 ?auto_861775 ) ) ( not ( = ?auto_861768 ?auto_861776 ) ) ( not ( = ?auto_861768 ?auto_861777 ) ) ( not ( = ?auto_861768 ?auto_861778 ) ) ( not ( = ?auto_861769 ?auto_861770 ) ) ( not ( = ?auto_861769 ?auto_861771 ) ) ( not ( = ?auto_861769 ?auto_861772 ) ) ( not ( = ?auto_861769 ?auto_861773 ) ) ( not ( = ?auto_861769 ?auto_861774 ) ) ( not ( = ?auto_861769 ?auto_861775 ) ) ( not ( = ?auto_861769 ?auto_861776 ) ) ( not ( = ?auto_861769 ?auto_861777 ) ) ( not ( = ?auto_861769 ?auto_861778 ) ) ( not ( = ?auto_861770 ?auto_861771 ) ) ( not ( = ?auto_861770 ?auto_861772 ) ) ( not ( = ?auto_861770 ?auto_861773 ) ) ( not ( = ?auto_861770 ?auto_861774 ) ) ( not ( = ?auto_861770 ?auto_861775 ) ) ( not ( = ?auto_861770 ?auto_861776 ) ) ( not ( = ?auto_861770 ?auto_861777 ) ) ( not ( = ?auto_861770 ?auto_861778 ) ) ( not ( = ?auto_861771 ?auto_861772 ) ) ( not ( = ?auto_861771 ?auto_861773 ) ) ( not ( = ?auto_861771 ?auto_861774 ) ) ( not ( = ?auto_861771 ?auto_861775 ) ) ( not ( = ?auto_861771 ?auto_861776 ) ) ( not ( = ?auto_861771 ?auto_861777 ) ) ( not ( = ?auto_861771 ?auto_861778 ) ) ( not ( = ?auto_861772 ?auto_861773 ) ) ( not ( = ?auto_861772 ?auto_861774 ) ) ( not ( = ?auto_861772 ?auto_861775 ) ) ( not ( = ?auto_861772 ?auto_861776 ) ) ( not ( = ?auto_861772 ?auto_861777 ) ) ( not ( = ?auto_861772 ?auto_861778 ) ) ( not ( = ?auto_861773 ?auto_861774 ) ) ( not ( = ?auto_861773 ?auto_861775 ) ) ( not ( = ?auto_861773 ?auto_861776 ) ) ( not ( = ?auto_861773 ?auto_861777 ) ) ( not ( = ?auto_861773 ?auto_861778 ) ) ( not ( = ?auto_861774 ?auto_861775 ) ) ( not ( = ?auto_861774 ?auto_861776 ) ) ( not ( = ?auto_861774 ?auto_861777 ) ) ( not ( = ?auto_861774 ?auto_861778 ) ) ( not ( = ?auto_861775 ?auto_861776 ) ) ( not ( = ?auto_861775 ?auto_861777 ) ) ( not ( = ?auto_861775 ?auto_861778 ) ) ( not ( = ?auto_861776 ?auto_861777 ) ) ( not ( = ?auto_861776 ?auto_861778 ) ) ( not ( = ?auto_861777 ?auto_861778 ) ) ( ON ?auto_861777 ?auto_861778 ) ( ON ?auto_861776 ?auto_861777 ) ( CLEAR ?auto_861774 ) ( ON ?auto_861775 ?auto_861776 ) ( CLEAR ?auto_861775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_861761 ?auto_861762 ?auto_861763 ?auto_861764 ?auto_861765 ?auto_861766 ?auto_861767 ?auto_861768 ?auto_861769 ?auto_861770 ?auto_861771 ?auto_861772 ?auto_861773 ?auto_861774 ?auto_861775 )
      ( MAKE-18PILE ?auto_861761 ?auto_861762 ?auto_861763 ?auto_861764 ?auto_861765 ?auto_861766 ?auto_861767 ?auto_861768 ?auto_861769 ?auto_861770 ?auto_861771 ?auto_861772 ?auto_861773 ?auto_861774 ?auto_861775 ?auto_861776 ?auto_861777 ?auto_861778 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861797 - BLOCK
      ?auto_861798 - BLOCK
      ?auto_861799 - BLOCK
      ?auto_861800 - BLOCK
      ?auto_861801 - BLOCK
      ?auto_861802 - BLOCK
      ?auto_861803 - BLOCK
      ?auto_861804 - BLOCK
      ?auto_861805 - BLOCK
      ?auto_861806 - BLOCK
      ?auto_861807 - BLOCK
      ?auto_861808 - BLOCK
      ?auto_861809 - BLOCK
      ?auto_861810 - BLOCK
      ?auto_861811 - BLOCK
      ?auto_861812 - BLOCK
      ?auto_861813 - BLOCK
      ?auto_861814 - BLOCK
    )
    :vars
    (
      ?auto_861815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861814 ?auto_861815 ) ( ON-TABLE ?auto_861797 ) ( ON ?auto_861798 ?auto_861797 ) ( ON ?auto_861799 ?auto_861798 ) ( ON ?auto_861800 ?auto_861799 ) ( ON ?auto_861801 ?auto_861800 ) ( ON ?auto_861802 ?auto_861801 ) ( ON ?auto_861803 ?auto_861802 ) ( ON ?auto_861804 ?auto_861803 ) ( ON ?auto_861805 ?auto_861804 ) ( ON ?auto_861806 ?auto_861805 ) ( ON ?auto_861807 ?auto_861806 ) ( ON ?auto_861808 ?auto_861807 ) ( ON ?auto_861809 ?auto_861808 ) ( not ( = ?auto_861797 ?auto_861798 ) ) ( not ( = ?auto_861797 ?auto_861799 ) ) ( not ( = ?auto_861797 ?auto_861800 ) ) ( not ( = ?auto_861797 ?auto_861801 ) ) ( not ( = ?auto_861797 ?auto_861802 ) ) ( not ( = ?auto_861797 ?auto_861803 ) ) ( not ( = ?auto_861797 ?auto_861804 ) ) ( not ( = ?auto_861797 ?auto_861805 ) ) ( not ( = ?auto_861797 ?auto_861806 ) ) ( not ( = ?auto_861797 ?auto_861807 ) ) ( not ( = ?auto_861797 ?auto_861808 ) ) ( not ( = ?auto_861797 ?auto_861809 ) ) ( not ( = ?auto_861797 ?auto_861810 ) ) ( not ( = ?auto_861797 ?auto_861811 ) ) ( not ( = ?auto_861797 ?auto_861812 ) ) ( not ( = ?auto_861797 ?auto_861813 ) ) ( not ( = ?auto_861797 ?auto_861814 ) ) ( not ( = ?auto_861797 ?auto_861815 ) ) ( not ( = ?auto_861798 ?auto_861799 ) ) ( not ( = ?auto_861798 ?auto_861800 ) ) ( not ( = ?auto_861798 ?auto_861801 ) ) ( not ( = ?auto_861798 ?auto_861802 ) ) ( not ( = ?auto_861798 ?auto_861803 ) ) ( not ( = ?auto_861798 ?auto_861804 ) ) ( not ( = ?auto_861798 ?auto_861805 ) ) ( not ( = ?auto_861798 ?auto_861806 ) ) ( not ( = ?auto_861798 ?auto_861807 ) ) ( not ( = ?auto_861798 ?auto_861808 ) ) ( not ( = ?auto_861798 ?auto_861809 ) ) ( not ( = ?auto_861798 ?auto_861810 ) ) ( not ( = ?auto_861798 ?auto_861811 ) ) ( not ( = ?auto_861798 ?auto_861812 ) ) ( not ( = ?auto_861798 ?auto_861813 ) ) ( not ( = ?auto_861798 ?auto_861814 ) ) ( not ( = ?auto_861798 ?auto_861815 ) ) ( not ( = ?auto_861799 ?auto_861800 ) ) ( not ( = ?auto_861799 ?auto_861801 ) ) ( not ( = ?auto_861799 ?auto_861802 ) ) ( not ( = ?auto_861799 ?auto_861803 ) ) ( not ( = ?auto_861799 ?auto_861804 ) ) ( not ( = ?auto_861799 ?auto_861805 ) ) ( not ( = ?auto_861799 ?auto_861806 ) ) ( not ( = ?auto_861799 ?auto_861807 ) ) ( not ( = ?auto_861799 ?auto_861808 ) ) ( not ( = ?auto_861799 ?auto_861809 ) ) ( not ( = ?auto_861799 ?auto_861810 ) ) ( not ( = ?auto_861799 ?auto_861811 ) ) ( not ( = ?auto_861799 ?auto_861812 ) ) ( not ( = ?auto_861799 ?auto_861813 ) ) ( not ( = ?auto_861799 ?auto_861814 ) ) ( not ( = ?auto_861799 ?auto_861815 ) ) ( not ( = ?auto_861800 ?auto_861801 ) ) ( not ( = ?auto_861800 ?auto_861802 ) ) ( not ( = ?auto_861800 ?auto_861803 ) ) ( not ( = ?auto_861800 ?auto_861804 ) ) ( not ( = ?auto_861800 ?auto_861805 ) ) ( not ( = ?auto_861800 ?auto_861806 ) ) ( not ( = ?auto_861800 ?auto_861807 ) ) ( not ( = ?auto_861800 ?auto_861808 ) ) ( not ( = ?auto_861800 ?auto_861809 ) ) ( not ( = ?auto_861800 ?auto_861810 ) ) ( not ( = ?auto_861800 ?auto_861811 ) ) ( not ( = ?auto_861800 ?auto_861812 ) ) ( not ( = ?auto_861800 ?auto_861813 ) ) ( not ( = ?auto_861800 ?auto_861814 ) ) ( not ( = ?auto_861800 ?auto_861815 ) ) ( not ( = ?auto_861801 ?auto_861802 ) ) ( not ( = ?auto_861801 ?auto_861803 ) ) ( not ( = ?auto_861801 ?auto_861804 ) ) ( not ( = ?auto_861801 ?auto_861805 ) ) ( not ( = ?auto_861801 ?auto_861806 ) ) ( not ( = ?auto_861801 ?auto_861807 ) ) ( not ( = ?auto_861801 ?auto_861808 ) ) ( not ( = ?auto_861801 ?auto_861809 ) ) ( not ( = ?auto_861801 ?auto_861810 ) ) ( not ( = ?auto_861801 ?auto_861811 ) ) ( not ( = ?auto_861801 ?auto_861812 ) ) ( not ( = ?auto_861801 ?auto_861813 ) ) ( not ( = ?auto_861801 ?auto_861814 ) ) ( not ( = ?auto_861801 ?auto_861815 ) ) ( not ( = ?auto_861802 ?auto_861803 ) ) ( not ( = ?auto_861802 ?auto_861804 ) ) ( not ( = ?auto_861802 ?auto_861805 ) ) ( not ( = ?auto_861802 ?auto_861806 ) ) ( not ( = ?auto_861802 ?auto_861807 ) ) ( not ( = ?auto_861802 ?auto_861808 ) ) ( not ( = ?auto_861802 ?auto_861809 ) ) ( not ( = ?auto_861802 ?auto_861810 ) ) ( not ( = ?auto_861802 ?auto_861811 ) ) ( not ( = ?auto_861802 ?auto_861812 ) ) ( not ( = ?auto_861802 ?auto_861813 ) ) ( not ( = ?auto_861802 ?auto_861814 ) ) ( not ( = ?auto_861802 ?auto_861815 ) ) ( not ( = ?auto_861803 ?auto_861804 ) ) ( not ( = ?auto_861803 ?auto_861805 ) ) ( not ( = ?auto_861803 ?auto_861806 ) ) ( not ( = ?auto_861803 ?auto_861807 ) ) ( not ( = ?auto_861803 ?auto_861808 ) ) ( not ( = ?auto_861803 ?auto_861809 ) ) ( not ( = ?auto_861803 ?auto_861810 ) ) ( not ( = ?auto_861803 ?auto_861811 ) ) ( not ( = ?auto_861803 ?auto_861812 ) ) ( not ( = ?auto_861803 ?auto_861813 ) ) ( not ( = ?auto_861803 ?auto_861814 ) ) ( not ( = ?auto_861803 ?auto_861815 ) ) ( not ( = ?auto_861804 ?auto_861805 ) ) ( not ( = ?auto_861804 ?auto_861806 ) ) ( not ( = ?auto_861804 ?auto_861807 ) ) ( not ( = ?auto_861804 ?auto_861808 ) ) ( not ( = ?auto_861804 ?auto_861809 ) ) ( not ( = ?auto_861804 ?auto_861810 ) ) ( not ( = ?auto_861804 ?auto_861811 ) ) ( not ( = ?auto_861804 ?auto_861812 ) ) ( not ( = ?auto_861804 ?auto_861813 ) ) ( not ( = ?auto_861804 ?auto_861814 ) ) ( not ( = ?auto_861804 ?auto_861815 ) ) ( not ( = ?auto_861805 ?auto_861806 ) ) ( not ( = ?auto_861805 ?auto_861807 ) ) ( not ( = ?auto_861805 ?auto_861808 ) ) ( not ( = ?auto_861805 ?auto_861809 ) ) ( not ( = ?auto_861805 ?auto_861810 ) ) ( not ( = ?auto_861805 ?auto_861811 ) ) ( not ( = ?auto_861805 ?auto_861812 ) ) ( not ( = ?auto_861805 ?auto_861813 ) ) ( not ( = ?auto_861805 ?auto_861814 ) ) ( not ( = ?auto_861805 ?auto_861815 ) ) ( not ( = ?auto_861806 ?auto_861807 ) ) ( not ( = ?auto_861806 ?auto_861808 ) ) ( not ( = ?auto_861806 ?auto_861809 ) ) ( not ( = ?auto_861806 ?auto_861810 ) ) ( not ( = ?auto_861806 ?auto_861811 ) ) ( not ( = ?auto_861806 ?auto_861812 ) ) ( not ( = ?auto_861806 ?auto_861813 ) ) ( not ( = ?auto_861806 ?auto_861814 ) ) ( not ( = ?auto_861806 ?auto_861815 ) ) ( not ( = ?auto_861807 ?auto_861808 ) ) ( not ( = ?auto_861807 ?auto_861809 ) ) ( not ( = ?auto_861807 ?auto_861810 ) ) ( not ( = ?auto_861807 ?auto_861811 ) ) ( not ( = ?auto_861807 ?auto_861812 ) ) ( not ( = ?auto_861807 ?auto_861813 ) ) ( not ( = ?auto_861807 ?auto_861814 ) ) ( not ( = ?auto_861807 ?auto_861815 ) ) ( not ( = ?auto_861808 ?auto_861809 ) ) ( not ( = ?auto_861808 ?auto_861810 ) ) ( not ( = ?auto_861808 ?auto_861811 ) ) ( not ( = ?auto_861808 ?auto_861812 ) ) ( not ( = ?auto_861808 ?auto_861813 ) ) ( not ( = ?auto_861808 ?auto_861814 ) ) ( not ( = ?auto_861808 ?auto_861815 ) ) ( not ( = ?auto_861809 ?auto_861810 ) ) ( not ( = ?auto_861809 ?auto_861811 ) ) ( not ( = ?auto_861809 ?auto_861812 ) ) ( not ( = ?auto_861809 ?auto_861813 ) ) ( not ( = ?auto_861809 ?auto_861814 ) ) ( not ( = ?auto_861809 ?auto_861815 ) ) ( not ( = ?auto_861810 ?auto_861811 ) ) ( not ( = ?auto_861810 ?auto_861812 ) ) ( not ( = ?auto_861810 ?auto_861813 ) ) ( not ( = ?auto_861810 ?auto_861814 ) ) ( not ( = ?auto_861810 ?auto_861815 ) ) ( not ( = ?auto_861811 ?auto_861812 ) ) ( not ( = ?auto_861811 ?auto_861813 ) ) ( not ( = ?auto_861811 ?auto_861814 ) ) ( not ( = ?auto_861811 ?auto_861815 ) ) ( not ( = ?auto_861812 ?auto_861813 ) ) ( not ( = ?auto_861812 ?auto_861814 ) ) ( not ( = ?auto_861812 ?auto_861815 ) ) ( not ( = ?auto_861813 ?auto_861814 ) ) ( not ( = ?auto_861813 ?auto_861815 ) ) ( not ( = ?auto_861814 ?auto_861815 ) ) ( ON ?auto_861813 ?auto_861814 ) ( ON ?auto_861812 ?auto_861813 ) ( ON ?auto_861811 ?auto_861812 ) ( CLEAR ?auto_861809 ) ( ON ?auto_861810 ?auto_861811 ) ( CLEAR ?auto_861810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_861797 ?auto_861798 ?auto_861799 ?auto_861800 ?auto_861801 ?auto_861802 ?auto_861803 ?auto_861804 ?auto_861805 ?auto_861806 ?auto_861807 ?auto_861808 ?auto_861809 ?auto_861810 )
      ( MAKE-18PILE ?auto_861797 ?auto_861798 ?auto_861799 ?auto_861800 ?auto_861801 ?auto_861802 ?auto_861803 ?auto_861804 ?auto_861805 ?auto_861806 ?auto_861807 ?auto_861808 ?auto_861809 ?auto_861810 ?auto_861811 ?auto_861812 ?auto_861813 ?auto_861814 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861834 - BLOCK
      ?auto_861835 - BLOCK
      ?auto_861836 - BLOCK
      ?auto_861837 - BLOCK
      ?auto_861838 - BLOCK
      ?auto_861839 - BLOCK
      ?auto_861840 - BLOCK
      ?auto_861841 - BLOCK
      ?auto_861842 - BLOCK
      ?auto_861843 - BLOCK
      ?auto_861844 - BLOCK
      ?auto_861845 - BLOCK
      ?auto_861846 - BLOCK
      ?auto_861847 - BLOCK
      ?auto_861848 - BLOCK
      ?auto_861849 - BLOCK
      ?auto_861850 - BLOCK
      ?auto_861851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_861851 ) ( ON-TABLE ?auto_861834 ) ( ON ?auto_861835 ?auto_861834 ) ( ON ?auto_861836 ?auto_861835 ) ( ON ?auto_861837 ?auto_861836 ) ( ON ?auto_861838 ?auto_861837 ) ( ON ?auto_861839 ?auto_861838 ) ( ON ?auto_861840 ?auto_861839 ) ( ON ?auto_861841 ?auto_861840 ) ( ON ?auto_861842 ?auto_861841 ) ( ON ?auto_861843 ?auto_861842 ) ( ON ?auto_861844 ?auto_861843 ) ( ON ?auto_861845 ?auto_861844 ) ( ON ?auto_861846 ?auto_861845 ) ( not ( = ?auto_861834 ?auto_861835 ) ) ( not ( = ?auto_861834 ?auto_861836 ) ) ( not ( = ?auto_861834 ?auto_861837 ) ) ( not ( = ?auto_861834 ?auto_861838 ) ) ( not ( = ?auto_861834 ?auto_861839 ) ) ( not ( = ?auto_861834 ?auto_861840 ) ) ( not ( = ?auto_861834 ?auto_861841 ) ) ( not ( = ?auto_861834 ?auto_861842 ) ) ( not ( = ?auto_861834 ?auto_861843 ) ) ( not ( = ?auto_861834 ?auto_861844 ) ) ( not ( = ?auto_861834 ?auto_861845 ) ) ( not ( = ?auto_861834 ?auto_861846 ) ) ( not ( = ?auto_861834 ?auto_861847 ) ) ( not ( = ?auto_861834 ?auto_861848 ) ) ( not ( = ?auto_861834 ?auto_861849 ) ) ( not ( = ?auto_861834 ?auto_861850 ) ) ( not ( = ?auto_861834 ?auto_861851 ) ) ( not ( = ?auto_861835 ?auto_861836 ) ) ( not ( = ?auto_861835 ?auto_861837 ) ) ( not ( = ?auto_861835 ?auto_861838 ) ) ( not ( = ?auto_861835 ?auto_861839 ) ) ( not ( = ?auto_861835 ?auto_861840 ) ) ( not ( = ?auto_861835 ?auto_861841 ) ) ( not ( = ?auto_861835 ?auto_861842 ) ) ( not ( = ?auto_861835 ?auto_861843 ) ) ( not ( = ?auto_861835 ?auto_861844 ) ) ( not ( = ?auto_861835 ?auto_861845 ) ) ( not ( = ?auto_861835 ?auto_861846 ) ) ( not ( = ?auto_861835 ?auto_861847 ) ) ( not ( = ?auto_861835 ?auto_861848 ) ) ( not ( = ?auto_861835 ?auto_861849 ) ) ( not ( = ?auto_861835 ?auto_861850 ) ) ( not ( = ?auto_861835 ?auto_861851 ) ) ( not ( = ?auto_861836 ?auto_861837 ) ) ( not ( = ?auto_861836 ?auto_861838 ) ) ( not ( = ?auto_861836 ?auto_861839 ) ) ( not ( = ?auto_861836 ?auto_861840 ) ) ( not ( = ?auto_861836 ?auto_861841 ) ) ( not ( = ?auto_861836 ?auto_861842 ) ) ( not ( = ?auto_861836 ?auto_861843 ) ) ( not ( = ?auto_861836 ?auto_861844 ) ) ( not ( = ?auto_861836 ?auto_861845 ) ) ( not ( = ?auto_861836 ?auto_861846 ) ) ( not ( = ?auto_861836 ?auto_861847 ) ) ( not ( = ?auto_861836 ?auto_861848 ) ) ( not ( = ?auto_861836 ?auto_861849 ) ) ( not ( = ?auto_861836 ?auto_861850 ) ) ( not ( = ?auto_861836 ?auto_861851 ) ) ( not ( = ?auto_861837 ?auto_861838 ) ) ( not ( = ?auto_861837 ?auto_861839 ) ) ( not ( = ?auto_861837 ?auto_861840 ) ) ( not ( = ?auto_861837 ?auto_861841 ) ) ( not ( = ?auto_861837 ?auto_861842 ) ) ( not ( = ?auto_861837 ?auto_861843 ) ) ( not ( = ?auto_861837 ?auto_861844 ) ) ( not ( = ?auto_861837 ?auto_861845 ) ) ( not ( = ?auto_861837 ?auto_861846 ) ) ( not ( = ?auto_861837 ?auto_861847 ) ) ( not ( = ?auto_861837 ?auto_861848 ) ) ( not ( = ?auto_861837 ?auto_861849 ) ) ( not ( = ?auto_861837 ?auto_861850 ) ) ( not ( = ?auto_861837 ?auto_861851 ) ) ( not ( = ?auto_861838 ?auto_861839 ) ) ( not ( = ?auto_861838 ?auto_861840 ) ) ( not ( = ?auto_861838 ?auto_861841 ) ) ( not ( = ?auto_861838 ?auto_861842 ) ) ( not ( = ?auto_861838 ?auto_861843 ) ) ( not ( = ?auto_861838 ?auto_861844 ) ) ( not ( = ?auto_861838 ?auto_861845 ) ) ( not ( = ?auto_861838 ?auto_861846 ) ) ( not ( = ?auto_861838 ?auto_861847 ) ) ( not ( = ?auto_861838 ?auto_861848 ) ) ( not ( = ?auto_861838 ?auto_861849 ) ) ( not ( = ?auto_861838 ?auto_861850 ) ) ( not ( = ?auto_861838 ?auto_861851 ) ) ( not ( = ?auto_861839 ?auto_861840 ) ) ( not ( = ?auto_861839 ?auto_861841 ) ) ( not ( = ?auto_861839 ?auto_861842 ) ) ( not ( = ?auto_861839 ?auto_861843 ) ) ( not ( = ?auto_861839 ?auto_861844 ) ) ( not ( = ?auto_861839 ?auto_861845 ) ) ( not ( = ?auto_861839 ?auto_861846 ) ) ( not ( = ?auto_861839 ?auto_861847 ) ) ( not ( = ?auto_861839 ?auto_861848 ) ) ( not ( = ?auto_861839 ?auto_861849 ) ) ( not ( = ?auto_861839 ?auto_861850 ) ) ( not ( = ?auto_861839 ?auto_861851 ) ) ( not ( = ?auto_861840 ?auto_861841 ) ) ( not ( = ?auto_861840 ?auto_861842 ) ) ( not ( = ?auto_861840 ?auto_861843 ) ) ( not ( = ?auto_861840 ?auto_861844 ) ) ( not ( = ?auto_861840 ?auto_861845 ) ) ( not ( = ?auto_861840 ?auto_861846 ) ) ( not ( = ?auto_861840 ?auto_861847 ) ) ( not ( = ?auto_861840 ?auto_861848 ) ) ( not ( = ?auto_861840 ?auto_861849 ) ) ( not ( = ?auto_861840 ?auto_861850 ) ) ( not ( = ?auto_861840 ?auto_861851 ) ) ( not ( = ?auto_861841 ?auto_861842 ) ) ( not ( = ?auto_861841 ?auto_861843 ) ) ( not ( = ?auto_861841 ?auto_861844 ) ) ( not ( = ?auto_861841 ?auto_861845 ) ) ( not ( = ?auto_861841 ?auto_861846 ) ) ( not ( = ?auto_861841 ?auto_861847 ) ) ( not ( = ?auto_861841 ?auto_861848 ) ) ( not ( = ?auto_861841 ?auto_861849 ) ) ( not ( = ?auto_861841 ?auto_861850 ) ) ( not ( = ?auto_861841 ?auto_861851 ) ) ( not ( = ?auto_861842 ?auto_861843 ) ) ( not ( = ?auto_861842 ?auto_861844 ) ) ( not ( = ?auto_861842 ?auto_861845 ) ) ( not ( = ?auto_861842 ?auto_861846 ) ) ( not ( = ?auto_861842 ?auto_861847 ) ) ( not ( = ?auto_861842 ?auto_861848 ) ) ( not ( = ?auto_861842 ?auto_861849 ) ) ( not ( = ?auto_861842 ?auto_861850 ) ) ( not ( = ?auto_861842 ?auto_861851 ) ) ( not ( = ?auto_861843 ?auto_861844 ) ) ( not ( = ?auto_861843 ?auto_861845 ) ) ( not ( = ?auto_861843 ?auto_861846 ) ) ( not ( = ?auto_861843 ?auto_861847 ) ) ( not ( = ?auto_861843 ?auto_861848 ) ) ( not ( = ?auto_861843 ?auto_861849 ) ) ( not ( = ?auto_861843 ?auto_861850 ) ) ( not ( = ?auto_861843 ?auto_861851 ) ) ( not ( = ?auto_861844 ?auto_861845 ) ) ( not ( = ?auto_861844 ?auto_861846 ) ) ( not ( = ?auto_861844 ?auto_861847 ) ) ( not ( = ?auto_861844 ?auto_861848 ) ) ( not ( = ?auto_861844 ?auto_861849 ) ) ( not ( = ?auto_861844 ?auto_861850 ) ) ( not ( = ?auto_861844 ?auto_861851 ) ) ( not ( = ?auto_861845 ?auto_861846 ) ) ( not ( = ?auto_861845 ?auto_861847 ) ) ( not ( = ?auto_861845 ?auto_861848 ) ) ( not ( = ?auto_861845 ?auto_861849 ) ) ( not ( = ?auto_861845 ?auto_861850 ) ) ( not ( = ?auto_861845 ?auto_861851 ) ) ( not ( = ?auto_861846 ?auto_861847 ) ) ( not ( = ?auto_861846 ?auto_861848 ) ) ( not ( = ?auto_861846 ?auto_861849 ) ) ( not ( = ?auto_861846 ?auto_861850 ) ) ( not ( = ?auto_861846 ?auto_861851 ) ) ( not ( = ?auto_861847 ?auto_861848 ) ) ( not ( = ?auto_861847 ?auto_861849 ) ) ( not ( = ?auto_861847 ?auto_861850 ) ) ( not ( = ?auto_861847 ?auto_861851 ) ) ( not ( = ?auto_861848 ?auto_861849 ) ) ( not ( = ?auto_861848 ?auto_861850 ) ) ( not ( = ?auto_861848 ?auto_861851 ) ) ( not ( = ?auto_861849 ?auto_861850 ) ) ( not ( = ?auto_861849 ?auto_861851 ) ) ( not ( = ?auto_861850 ?auto_861851 ) ) ( ON ?auto_861850 ?auto_861851 ) ( ON ?auto_861849 ?auto_861850 ) ( ON ?auto_861848 ?auto_861849 ) ( CLEAR ?auto_861846 ) ( ON ?auto_861847 ?auto_861848 ) ( CLEAR ?auto_861847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_861834 ?auto_861835 ?auto_861836 ?auto_861837 ?auto_861838 ?auto_861839 ?auto_861840 ?auto_861841 ?auto_861842 ?auto_861843 ?auto_861844 ?auto_861845 ?auto_861846 ?auto_861847 )
      ( MAKE-18PILE ?auto_861834 ?auto_861835 ?auto_861836 ?auto_861837 ?auto_861838 ?auto_861839 ?auto_861840 ?auto_861841 ?auto_861842 ?auto_861843 ?auto_861844 ?auto_861845 ?auto_861846 ?auto_861847 ?auto_861848 ?auto_861849 ?auto_861850 ?auto_861851 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861870 - BLOCK
      ?auto_861871 - BLOCK
      ?auto_861872 - BLOCK
      ?auto_861873 - BLOCK
      ?auto_861874 - BLOCK
      ?auto_861875 - BLOCK
      ?auto_861876 - BLOCK
      ?auto_861877 - BLOCK
      ?auto_861878 - BLOCK
      ?auto_861879 - BLOCK
      ?auto_861880 - BLOCK
      ?auto_861881 - BLOCK
      ?auto_861882 - BLOCK
      ?auto_861883 - BLOCK
      ?auto_861884 - BLOCK
      ?auto_861885 - BLOCK
      ?auto_861886 - BLOCK
      ?auto_861887 - BLOCK
    )
    :vars
    (
      ?auto_861888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861887 ?auto_861888 ) ( ON-TABLE ?auto_861870 ) ( ON ?auto_861871 ?auto_861870 ) ( ON ?auto_861872 ?auto_861871 ) ( ON ?auto_861873 ?auto_861872 ) ( ON ?auto_861874 ?auto_861873 ) ( ON ?auto_861875 ?auto_861874 ) ( ON ?auto_861876 ?auto_861875 ) ( ON ?auto_861877 ?auto_861876 ) ( ON ?auto_861878 ?auto_861877 ) ( ON ?auto_861879 ?auto_861878 ) ( ON ?auto_861880 ?auto_861879 ) ( ON ?auto_861881 ?auto_861880 ) ( not ( = ?auto_861870 ?auto_861871 ) ) ( not ( = ?auto_861870 ?auto_861872 ) ) ( not ( = ?auto_861870 ?auto_861873 ) ) ( not ( = ?auto_861870 ?auto_861874 ) ) ( not ( = ?auto_861870 ?auto_861875 ) ) ( not ( = ?auto_861870 ?auto_861876 ) ) ( not ( = ?auto_861870 ?auto_861877 ) ) ( not ( = ?auto_861870 ?auto_861878 ) ) ( not ( = ?auto_861870 ?auto_861879 ) ) ( not ( = ?auto_861870 ?auto_861880 ) ) ( not ( = ?auto_861870 ?auto_861881 ) ) ( not ( = ?auto_861870 ?auto_861882 ) ) ( not ( = ?auto_861870 ?auto_861883 ) ) ( not ( = ?auto_861870 ?auto_861884 ) ) ( not ( = ?auto_861870 ?auto_861885 ) ) ( not ( = ?auto_861870 ?auto_861886 ) ) ( not ( = ?auto_861870 ?auto_861887 ) ) ( not ( = ?auto_861870 ?auto_861888 ) ) ( not ( = ?auto_861871 ?auto_861872 ) ) ( not ( = ?auto_861871 ?auto_861873 ) ) ( not ( = ?auto_861871 ?auto_861874 ) ) ( not ( = ?auto_861871 ?auto_861875 ) ) ( not ( = ?auto_861871 ?auto_861876 ) ) ( not ( = ?auto_861871 ?auto_861877 ) ) ( not ( = ?auto_861871 ?auto_861878 ) ) ( not ( = ?auto_861871 ?auto_861879 ) ) ( not ( = ?auto_861871 ?auto_861880 ) ) ( not ( = ?auto_861871 ?auto_861881 ) ) ( not ( = ?auto_861871 ?auto_861882 ) ) ( not ( = ?auto_861871 ?auto_861883 ) ) ( not ( = ?auto_861871 ?auto_861884 ) ) ( not ( = ?auto_861871 ?auto_861885 ) ) ( not ( = ?auto_861871 ?auto_861886 ) ) ( not ( = ?auto_861871 ?auto_861887 ) ) ( not ( = ?auto_861871 ?auto_861888 ) ) ( not ( = ?auto_861872 ?auto_861873 ) ) ( not ( = ?auto_861872 ?auto_861874 ) ) ( not ( = ?auto_861872 ?auto_861875 ) ) ( not ( = ?auto_861872 ?auto_861876 ) ) ( not ( = ?auto_861872 ?auto_861877 ) ) ( not ( = ?auto_861872 ?auto_861878 ) ) ( not ( = ?auto_861872 ?auto_861879 ) ) ( not ( = ?auto_861872 ?auto_861880 ) ) ( not ( = ?auto_861872 ?auto_861881 ) ) ( not ( = ?auto_861872 ?auto_861882 ) ) ( not ( = ?auto_861872 ?auto_861883 ) ) ( not ( = ?auto_861872 ?auto_861884 ) ) ( not ( = ?auto_861872 ?auto_861885 ) ) ( not ( = ?auto_861872 ?auto_861886 ) ) ( not ( = ?auto_861872 ?auto_861887 ) ) ( not ( = ?auto_861872 ?auto_861888 ) ) ( not ( = ?auto_861873 ?auto_861874 ) ) ( not ( = ?auto_861873 ?auto_861875 ) ) ( not ( = ?auto_861873 ?auto_861876 ) ) ( not ( = ?auto_861873 ?auto_861877 ) ) ( not ( = ?auto_861873 ?auto_861878 ) ) ( not ( = ?auto_861873 ?auto_861879 ) ) ( not ( = ?auto_861873 ?auto_861880 ) ) ( not ( = ?auto_861873 ?auto_861881 ) ) ( not ( = ?auto_861873 ?auto_861882 ) ) ( not ( = ?auto_861873 ?auto_861883 ) ) ( not ( = ?auto_861873 ?auto_861884 ) ) ( not ( = ?auto_861873 ?auto_861885 ) ) ( not ( = ?auto_861873 ?auto_861886 ) ) ( not ( = ?auto_861873 ?auto_861887 ) ) ( not ( = ?auto_861873 ?auto_861888 ) ) ( not ( = ?auto_861874 ?auto_861875 ) ) ( not ( = ?auto_861874 ?auto_861876 ) ) ( not ( = ?auto_861874 ?auto_861877 ) ) ( not ( = ?auto_861874 ?auto_861878 ) ) ( not ( = ?auto_861874 ?auto_861879 ) ) ( not ( = ?auto_861874 ?auto_861880 ) ) ( not ( = ?auto_861874 ?auto_861881 ) ) ( not ( = ?auto_861874 ?auto_861882 ) ) ( not ( = ?auto_861874 ?auto_861883 ) ) ( not ( = ?auto_861874 ?auto_861884 ) ) ( not ( = ?auto_861874 ?auto_861885 ) ) ( not ( = ?auto_861874 ?auto_861886 ) ) ( not ( = ?auto_861874 ?auto_861887 ) ) ( not ( = ?auto_861874 ?auto_861888 ) ) ( not ( = ?auto_861875 ?auto_861876 ) ) ( not ( = ?auto_861875 ?auto_861877 ) ) ( not ( = ?auto_861875 ?auto_861878 ) ) ( not ( = ?auto_861875 ?auto_861879 ) ) ( not ( = ?auto_861875 ?auto_861880 ) ) ( not ( = ?auto_861875 ?auto_861881 ) ) ( not ( = ?auto_861875 ?auto_861882 ) ) ( not ( = ?auto_861875 ?auto_861883 ) ) ( not ( = ?auto_861875 ?auto_861884 ) ) ( not ( = ?auto_861875 ?auto_861885 ) ) ( not ( = ?auto_861875 ?auto_861886 ) ) ( not ( = ?auto_861875 ?auto_861887 ) ) ( not ( = ?auto_861875 ?auto_861888 ) ) ( not ( = ?auto_861876 ?auto_861877 ) ) ( not ( = ?auto_861876 ?auto_861878 ) ) ( not ( = ?auto_861876 ?auto_861879 ) ) ( not ( = ?auto_861876 ?auto_861880 ) ) ( not ( = ?auto_861876 ?auto_861881 ) ) ( not ( = ?auto_861876 ?auto_861882 ) ) ( not ( = ?auto_861876 ?auto_861883 ) ) ( not ( = ?auto_861876 ?auto_861884 ) ) ( not ( = ?auto_861876 ?auto_861885 ) ) ( not ( = ?auto_861876 ?auto_861886 ) ) ( not ( = ?auto_861876 ?auto_861887 ) ) ( not ( = ?auto_861876 ?auto_861888 ) ) ( not ( = ?auto_861877 ?auto_861878 ) ) ( not ( = ?auto_861877 ?auto_861879 ) ) ( not ( = ?auto_861877 ?auto_861880 ) ) ( not ( = ?auto_861877 ?auto_861881 ) ) ( not ( = ?auto_861877 ?auto_861882 ) ) ( not ( = ?auto_861877 ?auto_861883 ) ) ( not ( = ?auto_861877 ?auto_861884 ) ) ( not ( = ?auto_861877 ?auto_861885 ) ) ( not ( = ?auto_861877 ?auto_861886 ) ) ( not ( = ?auto_861877 ?auto_861887 ) ) ( not ( = ?auto_861877 ?auto_861888 ) ) ( not ( = ?auto_861878 ?auto_861879 ) ) ( not ( = ?auto_861878 ?auto_861880 ) ) ( not ( = ?auto_861878 ?auto_861881 ) ) ( not ( = ?auto_861878 ?auto_861882 ) ) ( not ( = ?auto_861878 ?auto_861883 ) ) ( not ( = ?auto_861878 ?auto_861884 ) ) ( not ( = ?auto_861878 ?auto_861885 ) ) ( not ( = ?auto_861878 ?auto_861886 ) ) ( not ( = ?auto_861878 ?auto_861887 ) ) ( not ( = ?auto_861878 ?auto_861888 ) ) ( not ( = ?auto_861879 ?auto_861880 ) ) ( not ( = ?auto_861879 ?auto_861881 ) ) ( not ( = ?auto_861879 ?auto_861882 ) ) ( not ( = ?auto_861879 ?auto_861883 ) ) ( not ( = ?auto_861879 ?auto_861884 ) ) ( not ( = ?auto_861879 ?auto_861885 ) ) ( not ( = ?auto_861879 ?auto_861886 ) ) ( not ( = ?auto_861879 ?auto_861887 ) ) ( not ( = ?auto_861879 ?auto_861888 ) ) ( not ( = ?auto_861880 ?auto_861881 ) ) ( not ( = ?auto_861880 ?auto_861882 ) ) ( not ( = ?auto_861880 ?auto_861883 ) ) ( not ( = ?auto_861880 ?auto_861884 ) ) ( not ( = ?auto_861880 ?auto_861885 ) ) ( not ( = ?auto_861880 ?auto_861886 ) ) ( not ( = ?auto_861880 ?auto_861887 ) ) ( not ( = ?auto_861880 ?auto_861888 ) ) ( not ( = ?auto_861881 ?auto_861882 ) ) ( not ( = ?auto_861881 ?auto_861883 ) ) ( not ( = ?auto_861881 ?auto_861884 ) ) ( not ( = ?auto_861881 ?auto_861885 ) ) ( not ( = ?auto_861881 ?auto_861886 ) ) ( not ( = ?auto_861881 ?auto_861887 ) ) ( not ( = ?auto_861881 ?auto_861888 ) ) ( not ( = ?auto_861882 ?auto_861883 ) ) ( not ( = ?auto_861882 ?auto_861884 ) ) ( not ( = ?auto_861882 ?auto_861885 ) ) ( not ( = ?auto_861882 ?auto_861886 ) ) ( not ( = ?auto_861882 ?auto_861887 ) ) ( not ( = ?auto_861882 ?auto_861888 ) ) ( not ( = ?auto_861883 ?auto_861884 ) ) ( not ( = ?auto_861883 ?auto_861885 ) ) ( not ( = ?auto_861883 ?auto_861886 ) ) ( not ( = ?auto_861883 ?auto_861887 ) ) ( not ( = ?auto_861883 ?auto_861888 ) ) ( not ( = ?auto_861884 ?auto_861885 ) ) ( not ( = ?auto_861884 ?auto_861886 ) ) ( not ( = ?auto_861884 ?auto_861887 ) ) ( not ( = ?auto_861884 ?auto_861888 ) ) ( not ( = ?auto_861885 ?auto_861886 ) ) ( not ( = ?auto_861885 ?auto_861887 ) ) ( not ( = ?auto_861885 ?auto_861888 ) ) ( not ( = ?auto_861886 ?auto_861887 ) ) ( not ( = ?auto_861886 ?auto_861888 ) ) ( not ( = ?auto_861887 ?auto_861888 ) ) ( ON ?auto_861886 ?auto_861887 ) ( ON ?auto_861885 ?auto_861886 ) ( ON ?auto_861884 ?auto_861885 ) ( ON ?auto_861883 ?auto_861884 ) ( CLEAR ?auto_861881 ) ( ON ?auto_861882 ?auto_861883 ) ( CLEAR ?auto_861882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_861870 ?auto_861871 ?auto_861872 ?auto_861873 ?auto_861874 ?auto_861875 ?auto_861876 ?auto_861877 ?auto_861878 ?auto_861879 ?auto_861880 ?auto_861881 ?auto_861882 )
      ( MAKE-18PILE ?auto_861870 ?auto_861871 ?auto_861872 ?auto_861873 ?auto_861874 ?auto_861875 ?auto_861876 ?auto_861877 ?auto_861878 ?auto_861879 ?auto_861880 ?auto_861881 ?auto_861882 ?auto_861883 ?auto_861884 ?auto_861885 ?auto_861886 ?auto_861887 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861907 - BLOCK
      ?auto_861908 - BLOCK
      ?auto_861909 - BLOCK
      ?auto_861910 - BLOCK
      ?auto_861911 - BLOCK
      ?auto_861912 - BLOCK
      ?auto_861913 - BLOCK
      ?auto_861914 - BLOCK
      ?auto_861915 - BLOCK
      ?auto_861916 - BLOCK
      ?auto_861917 - BLOCK
      ?auto_861918 - BLOCK
      ?auto_861919 - BLOCK
      ?auto_861920 - BLOCK
      ?auto_861921 - BLOCK
      ?auto_861922 - BLOCK
      ?auto_861923 - BLOCK
      ?auto_861924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_861924 ) ( ON-TABLE ?auto_861907 ) ( ON ?auto_861908 ?auto_861907 ) ( ON ?auto_861909 ?auto_861908 ) ( ON ?auto_861910 ?auto_861909 ) ( ON ?auto_861911 ?auto_861910 ) ( ON ?auto_861912 ?auto_861911 ) ( ON ?auto_861913 ?auto_861912 ) ( ON ?auto_861914 ?auto_861913 ) ( ON ?auto_861915 ?auto_861914 ) ( ON ?auto_861916 ?auto_861915 ) ( ON ?auto_861917 ?auto_861916 ) ( ON ?auto_861918 ?auto_861917 ) ( not ( = ?auto_861907 ?auto_861908 ) ) ( not ( = ?auto_861907 ?auto_861909 ) ) ( not ( = ?auto_861907 ?auto_861910 ) ) ( not ( = ?auto_861907 ?auto_861911 ) ) ( not ( = ?auto_861907 ?auto_861912 ) ) ( not ( = ?auto_861907 ?auto_861913 ) ) ( not ( = ?auto_861907 ?auto_861914 ) ) ( not ( = ?auto_861907 ?auto_861915 ) ) ( not ( = ?auto_861907 ?auto_861916 ) ) ( not ( = ?auto_861907 ?auto_861917 ) ) ( not ( = ?auto_861907 ?auto_861918 ) ) ( not ( = ?auto_861907 ?auto_861919 ) ) ( not ( = ?auto_861907 ?auto_861920 ) ) ( not ( = ?auto_861907 ?auto_861921 ) ) ( not ( = ?auto_861907 ?auto_861922 ) ) ( not ( = ?auto_861907 ?auto_861923 ) ) ( not ( = ?auto_861907 ?auto_861924 ) ) ( not ( = ?auto_861908 ?auto_861909 ) ) ( not ( = ?auto_861908 ?auto_861910 ) ) ( not ( = ?auto_861908 ?auto_861911 ) ) ( not ( = ?auto_861908 ?auto_861912 ) ) ( not ( = ?auto_861908 ?auto_861913 ) ) ( not ( = ?auto_861908 ?auto_861914 ) ) ( not ( = ?auto_861908 ?auto_861915 ) ) ( not ( = ?auto_861908 ?auto_861916 ) ) ( not ( = ?auto_861908 ?auto_861917 ) ) ( not ( = ?auto_861908 ?auto_861918 ) ) ( not ( = ?auto_861908 ?auto_861919 ) ) ( not ( = ?auto_861908 ?auto_861920 ) ) ( not ( = ?auto_861908 ?auto_861921 ) ) ( not ( = ?auto_861908 ?auto_861922 ) ) ( not ( = ?auto_861908 ?auto_861923 ) ) ( not ( = ?auto_861908 ?auto_861924 ) ) ( not ( = ?auto_861909 ?auto_861910 ) ) ( not ( = ?auto_861909 ?auto_861911 ) ) ( not ( = ?auto_861909 ?auto_861912 ) ) ( not ( = ?auto_861909 ?auto_861913 ) ) ( not ( = ?auto_861909 ?auto_861914 ) ) ( not ( = ?auto_861909 ?auto_861915 ) ) ( not ( = ?auto_861909 ?auto_861916 ) ) ( not ( = ?auto_861909 ?auto_861917 ) ) ( not ( = ?auto_861909 ?auto_861918 ) ) ( not ( = ?auto_861909 ?auto_861919 ) ) ( not ( = ?auto_861909 ?auto_861920 ) ) ( not ( = ?auto_861909 ?auto_861921 ) ) ( not ( = ?auto_861909 ?auto_861922 ) ) ( not ( = ?auto_861909 ?auto_861923 ) ) ( not ( = ?auto_861909 ?auto_861924 ) ) ( not ( = ?auto_861910 ?auto_861911 ) ) ( not ( = ?auto_861910 ?auto_861912 ) ) ( not ( = ?auto_861910 ?auto_861913 ) ) ( not ( = ?auto_861910 ?auto_861914 ) ) ( not ( = ?auto_861910 ?auto_861915 ) ) ( not ( = ?auto_861910 ?auto_861916 ) ) ( not ( = ?auto_861910 ?auto_861917 ) ) ( not ( = ?auto_861910 ?auto_861918 ) ) ( not ( = ?auto_861910 ?auto_861919 ) ) ( not ( = ?auto_861910 ?auto_861920 ) ) ( not ( = ?auto_861910 ?auto_861921 ) ) ( not ( = ?auto_861910 ?auto_861922 ) ) ( not ( = ?auto_861910 ?auto_861923 ) ) ( not ( = ?auto_861910 ?auto_861924 ) ) ( not ( = ?auto_861911 ?auto_861912 ) ) ( not ( = ?auto_861911 ?auto_861913 ) ) ( not ( = ?auto_861911 ?auto_861914 ) ) ( not ( = ?auto_861911 ?auto_861915 ) ) ( not ( = ?auto_861911 ?auto_861916 ) ) ( not ( = ?auto_861911 ?auto_861917 ) ) ( not ( = ?auto_861911 ?auto_861918 ) ) ( not ( = ?auto_861911 ?auto_861919 ) ) ( not ( = ?auto_861911 ?auto_861920 ) ) ( not ( = ?auto_861911 ?auto_861921 ) ) ( not ( = ?auto_861911 ?auto_861922 ) ) ( not ( = ?auto_861911 ?auto_861923 ) ) ( not ( = ?auto_861911 ?auto_861924 ) ) ( not ( = ?auto_861912 ?auto_861913 ) ) ( not ( = ?auto_861912 ?auto_861914 ) ) ( not ( = ?auto_861912 ?auto_861915 ) ) ( not ( = ?auto_861912 ?auto_861916 ) ) ( not ( = ?auto_861912 ?auto_861917 ) ) ( not ( = ?auto_861912 ?auto_861918 ) ) ( not ( = ?auto_861912 ?auto_861919 ) ) ( not ( = ?auto_861912 ?auto_861920 ) ) ( not ( = ?auto_861912 ?auto_861921 ) ) ( not ( = ?auto_861912 ?auto_861922 ) ) ( not ( = ?auto_861912 ?auto_861923 ) ) ( not ( = ?auto_861912 ?auto_861924 ) ) ( not ( = ?auto_861913 ?auto_861914 ) ) ( not ( = ?auto_861913 ?auto_861915 ) ) ( not ( = ?auto_861913 ?auto_861916 ) ) ( not ( = ?auto_861913 ?auto_861917 ) ) ( not ( = ?auto_861913 ?auto_861918 ) ) ( not ( = ?auto_861913 ?auto_861919 ) ) ( not ( = ?auto_861913 ?auto_861920 ) ) ( not ( = ?auto_861913 ?auto_861921 ) ) ( not ( = ?auto_861913 ?auto_861922 ) ) ( not ( = ?auto_861913 ?auto_861923 ) ) ( not ( = ?auto_861913 ?auto_861924 ) ) ( not ( = ?auto_861914 ?auto_861915 ) ) ( not ( = ?auto_861914 ?auto_861916 ) ) ( not ( = ?auto_861914 ?auto_861917 ) ) ( not ( = ?auto_861914 ?auto_861918 ) ) ( not ( = ?auto_861914 ?auto_861919 ) ) ( not ( = ?auto_861914 ?auto_861920 ) ) ( not ( = ?auto_861914 ?auto_861921 ) ) ( not ( = ?auto_861914 ?auto_861922 ) ) ( not ( = ?auto_861914 ?auto_861923 ) ) ( not ( = ?auto_861914 ?auto_861924 ) ) ( not ( = ?auto_861915 ?auto_861916 ) ) ( not ( = ?auto_861915 ?auto_861917 ) ) ( not ( = ?auto_861915 ?auto_861918 ) ) ( not ( = ?auto_861915 ?auto_861919 ) ) ( not ( = ?auto_861915 ?auto_861920 ) ) ( not ( = ?auto_861915 ?auto_861921 ) ) ( not ( = ?auto_861915 ?auto_861922 ) ) ( not ( = ?auto_861915 ?auto_861923 ) ) ( not ( = ?auto_861915 ?auto_861924 ) ) ( not ( = ?auto_861916 ?auto_861917 ) ) ( not ( = ?auto_861916 ?auto_861918 ) ) ( not ( = ?auto_861916 ?auto_861919 ) ) ( not ( = ?auto_861916 ?auto_861920 ) ) ( not ( = ?auto_861916 ?auto_861921 ) ) ( not ( = ?auto_861916 ?auto_861922 ) ) ( not ( = ?auto_861916 ?auto_861923 ) ) ( not ( = ?auto_861916 ?auto_861924 ) ) ( not ( = ?auto_861917 ?auto_861918 ) ) ( not ( = ?auto_861917 ?auto_861919 ) ) ( not ( = ?auto_861917 ?auto_861920 ) ) ( not ( = ?auto_861917 ?auto_861921 ) ) ( not ( = ?auto_861917 ?auto_861922 ) ) ( not ( = ?auto_861917 ?auto_861923 ) ) ( not ( = ?auto_861917 ?auto_861924 ) ) ( not ( = ?auto_861918 ?auto_861919 ) ) ( not ( = ?auto_861918 ?auto_861920 ) ) ( not ( = ?auto_861918 ?auto_861921 ) ) ( not ( = ?auto_861918 ?auto_861922 ) ) ( not ( = ?auto_861918 ?auto_861923 ) ) ( not ( = ?auto_861918 ?auto_861924 ) ) ( not ( = ?auto_861919 ?auto_861920 ) ) ( not ( = ?auto_861919 ?auto_861921 ) ) ( not ( = ?auto_861919 ?auto_861922 ) ) ( not ( = ?auto_861919 ?auto_861923 ) ) ( not ( = ?auto_861919 ?auto_861924 ) ) ( not ( = ?auto_861920 ?auto_861921 ) ) ( not ( = ?auto_861920 ?auto_861922 ) ) ( not ( = ?auto_861920 ?auto_861923 ) ) ( not ( = ?auto_861920 ?auto_861924 ) ) ( not ( = ?auto_861921 ?auto_861922 ) ) ( not ( = ?auto_861921 ?auto_861923 ) ) ( not ( = ?auto_861921 ?auto_861924 ) ) ( not ( = ?auto_861922 ?auto_861923 ) ) ( not ( = ?auto_861922 ?auto_861924 ) ) ( not ( = ?auto_861923 ?auto_861924 ) ) ( ON ?auto_861923 ?auto_861924 ) ( ON ?auto_861922 ?auto_861923 ) ( ON ?auto_861921 ?auto_861922 ) ( ON ?auto_861920 ?auto_861921 ) ( CLEAR ?auto_861918 ) ( ON ?auto_861919 ?auto_861920 ) ( CLEAR ?auto_861919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_861907 ?auto_861908 ?auto_861909 ?auto_861910 ?auto_861911 ?auto_861912 ?auto_861913 ?auto_861914 ?auto_861915 ?auto_861916 ?auto_861917 ?auto_861918 ?auto_861919 )
      ( MAKE-18PILE ?auto_861907 ?auto_861908 ?auto_861909 ?auto_861910 ?auto_861911 ?auto_861912 ?auto_861913 ?auto_861914 ?auto_861915 ?auto_861916 ?auto_861917 ?auto_861918 ?auto_861919 ?auto_861920 ?auto_861921 ?auto_861922 ?auto_861923 ?auto_861924 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861943 - BLOCK
      ?auto_861944 - BLOCK
      ?auto_861945 - BLOCK
      ?auto_861946 - BLOCK
      ?auto_861947 - BLOCK
      ?auto_861948 - BLOCK
      ?auto_861949 - BLOCK
      ?auto_861950 - BLOCK
      ?auto_861951 - BLOCK
      ?auto_861952 - BLOCK
      ?auto_861953 - BLOCK
      ?auto_861954 - BLOCK
      ?auto_861955 - BLOCK
      ?auto_861956 - BLOCK
      ?auto_861957 - BLOCK
      ?auto_861958 - BLOCK
      ?auto_861959 - BLOCK
      ?auto_861960 - BLOCK
    )
    :vars
    (
      ?auto_861961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_861960 ?auto_861961 ) ( ON-TABLE ?auto_861943 ) ( ON ?auto_861944 ?auto_861943 ) ( ON ?auto_861945 ?auto_861944 ) ( ON ?auto_861946 ?auto_861945 ) ( ON ?auto_861947 ?auto_861946 ) ( ON ?auto_861948 ?auto_861947 ) ( ON ?auto_861949 ?auto_861948 ) ( ON ?auto_861950 ?auto_861949 ) ( ON ?auto_861951 ?auto_861950 ) ( ON ?auto_861952 ?auto_861951 ) ( ON ?auto_861953 ?auto_861952 ) ( not ( = ?auto_861943 ?auto_861944 ) ) ( not ( = ?auto_861943 ?auto_861945 ) ) ( not ( = ?auto_861943 ?auto_861946 ) ) ( not ( = ?auto_861943 ?auto_861947 ) ) ( not ( = ?auto_861943 ?auto_861948 ) ) ( not ( = ?auto_861943 ?auto_861949 ) ) ( not ( = ?auto_861943 ?auto_861950 ) ) ( not ( = ?auto_861943 ?auto_861951 ) ) ( not ( = ?auto_861943 ?auto_861952 ) ) ( not ( = ?auto_861943 ?auto_861953 ) ) ( not ( = ?auto_861943 ?auto_861954 ) ) ( not ( = ?auto_861943 ?auto_861955 ) ) ( not ( = ?auto_861943 ?auto_861956 ) ) ( not ( = ?auto_861943 ?auto_861957 ) ) ( not ( = ?auto_861943 ?auto_861958 ) ) ( not ( = ?auto_861943 ?auto_861959 ) ) ( not ( = ?auto_861943 ?auto_861960 ) ) ( not ( = ?auto_861943 ?auto_861961 ) ) ( not ( = ?auto_861944 ?auto_861945 ) ) ( not ( = ?auto_861944 ?auto_861946 ) ) ( not ( = ?auto_861944 ?auto_861947 ) ) ( not ( = ?auto_861944 ?auto_861948 ) ) ( not ( = ?auto_861944 ?auto_861949 ) ) ( not ( = ?auto_861944 ?auto_861950 ) ) ( not ( = ?auto_861944 ?auto_861951 ) ) ( not ( = ?auto_861944 ?auto_861952 ) ) ( not ( = ?auto_861944 ?auto_861953 ) ) ( not ( = ?auto_861944 ?auto_861954 ) ) ( not ( = ?auto_861944 ?auto_861955 ) ) ( not ( = ?auto_861944 ?auto_861956 ) ) ( not ( = ?auto_861944 ?auto_861957 ) ) ( not ( = ?auto_861944 ?auto_861958 ) ) ( not ( = ?auto_861944 ?auto_861959 ) ) ( not ( = ?auto_861944 ?auto_861960 ) ) ( not ( = ?auto_861944 ?auto_861961 ) ) ( not ( = ?auto_861945 ?auto_861946 ) ) ( not ( = ?auto_861945 ?auto_861947 ) ) ( not ( = ?auto_861945 ?auto_861948 ) ) ( not ( = ?auto_861945 ?auto_861949 ) ) ( not ( = ?auto_861945 ?auto_861950 ) ) ( not ( = ?auto_861945 ?auto_861951 ) ) ( not ( = ?auto_861945 ?auto_861952 ) ) ( not ( = ?auto_861945 ?auto_861953 ) ) ( not ( = ?auto_861945 ?auto_861954 ) ) ( not ( = ?auto_861945 ?auto_861955 ) ) ( not ( = ?auto_861945 ?auto_861956 ) ) ( not ( = ?auto_861945 ?auto_861957 ) ) ( not ( = ?auto_861945 ?auto_861958 ) ) ( not ( = ?auto_861945 ?auto_861959 ) ) ( not ( = ?auto_861945 ?auto_861960 ) ) ( not ( = ?auto_861945 ?auto_861961 ) ) ( not ( = ?auto_861946 ?auto_861947 ) ) ( not ( = ?auto_861946 ?auto_861948 ) ) ( not ( = ?auto_861946 ?auto_861949 ) ) ( not ( = ?auto_861946 ?auto_861950 ) ) ( not ( = ?auto_861946 ?auto_861951 ) ) ( not ( = ?auto_861946 ?auto_861952 ) ) ( not ( = ?auto_861946 ?auto_861953 ) ) ( not ( = ?auto_861946 ?auto_861954 ) ) ( not ( = ?auto_861946 ?auto_861955 ) ) ( not ( = ?auto_861946 ?auto_861956 ) ) ( not ( = ?auto_861946 ?auto_861957 ) ) ( not ( = ?auto_861946 ?auto_861958 ) ) ( not ( = ?auto_861946 ?auto_861959 ) ) ( not ( = ?auto_861946 ?auto_861960 ) ) ( not ( = ?auto_861946 ?auto_861961 ) ) ( not ( = ?auto_861947 ?auto_861948 ) ) ( not ( = ?auto_861947 ?auto_861949 ) ) ( not ( = ?auto_861947 ?auto_861950 ) ) ( not ( = ?auto_861947 ?auto_861951 ) ) ( not ( = ?auto_861947 ?auto_861952 ) ) ( not ( = ?auto_861947 ?auto_861953 ) ) ( not ( = ?auto_861947 ?auto_861954 ) ) ( not ( = ?auto_861947 ?auto_861955 ) ) ( not ( = ?auto_861947 ?auto_861956 ) ) ( not ( = ?auto_861947 ?auto_861957 ) ) ( not ( = ?auto_861947 ?auto_861958 ) ) ( not ( = ?auto_861947 ?auto_861959 ) ) ( not ( = ?auto_861947 ?auto_861960 ) ) ( not ( = ?auto_861947 ?auto_861961 ) ) ( not ( = ?auto_861948 ?auto_861949 ) ) ( not ( = ?auto_861948 ?auto_861950 ) ) ( not ( = ?auto_861948 ?auto_861951 ) ) ( not ( = ?auto_861948 ?auto_861952 ) ) ( not ( = ?auto_861948 ?auto_861953 ) ) ( not ( = ?auto_861948 ?auto_861954 ) ) ( not ( = ?auto_861948 ?auto_861955 ) ) ( not ( = ?auto_861948 ?auto_861956 ) ) ( not ( = ?auto_861948 ?auto_861957 ) ) ( not ( = ?auto_861948 ?auto_861958 ) ) ( not ( = ?auto_861948 ?auto_861959 ) ) ( not ( = ?auto_861948 ?auto_861960 ) ) ( not ( = ?auto_861948 ?auto_861961 ) ) ( not ( = ?auto_861949 ?auto_861950 ) ) ( not ( = ?auto_861949 ?auto_861951 ) ) ( not ( = ?auto_861949 ?auto_861952 ) ) ( not ( = ?auto_861949 ?auto_861953 ) ) ( not ( = ?auto_861949 ?auto_861954 ) ) ( not ( = ?auto_861949 ?auto_861955 ) ) ( not ( = ?auto_861949 ?auto_861956 ) ) ( not ( = ?auto_861949 ?auto_861957 ) ) ( not ( = ?auto_861949 ?auto_861958 ) ) ( not ( = ?auto_861949 ?auto_861959 ) ) ( not ( = ?auto_861949 ?auto_861960 ) ) ( not ( = ?auto_861949 ?auto_861961 ) ) ( not ( = ?auto_861950 ?auto_861951 ) ) ( not ( = ?auto_861950 ?auto_861952 ) ) ( not ( = ?auto_861950 ?auto_861953 ) ) ( not ( = ?auto_861950 ?auto_861954 ) ) ( not ( = ?auto_861950 ?auto_861955 ) ) ( not ( = ?auto_861950 ?auto_861956 ) ) ( not ( = ?auto_861950 ?auto_861957 ) ) ( not ( = ?auto_861950 ?auto_861958 ) ) ( not ( = ?auto_861950 ?auto_861959 ) ) ( not ( = ?auto_861950 ?auto_861960 ) ) ( not ( = ?auto_861950 ?auto_861961 ) ) ( not ( = ?auto_861951 ?auto_861952 ) ) ( not ( = ?auto_861951 ?auto_861953 ) ) ( not ( = ?auto_861951 ?auto_861954 ) ) ( not ( = ?auto_861951 ?auto_861955 ) ) ( not ( = ?auto_861951 ?auto_861956 ) ) ( not ( = ?auto_861951 ?auto_861957 ) ) ( not ( = ?auto_861951 ?auto_861958 ) ) ( not ( = ?auto_861951 ?auto_861959 ) ) ( not ( = ?auto_861951 ?auto_861960 ) ) ( not ( = ?auto_861951 ?auto_861961 ) ) ( not ( = ?auto_861952 ?auto_861953 ) ) ( not ( = ?auto_861952 ?auto_861954 ) ) ( not ( = ?auto_861952 ?auto_861955 ) ) ( not ( = ?auto_861952 ?auto_861956 ) ) ( not ( = ?auto_861952 ?auto_861957 ) ) ( not ( = ?auto_861952 ?auto_861958 ) ) ( not ( = ?auto_861952 ?auto_861959 ) ) ( not ( = ?auto_861952 ?auto_861960 ) ) ( not ( = ?auto_861952 ?auto_861961 ) ) ( not ( = ?auto_861953 ?auto_861954 ) ) ( not ( = ?auto_861953 ?auto_861955 ) ) ( not ( = ?auto_861953 ?auto_861956 ) ) ( not ( = ?auto_861953 ?auto_861957 ) ) ( not ( = ?auto_861953 ?auto_861958 ) ) ( not ( = ?auto_861953 ?auto_861959 ) ) ( not ( = ?auto_861953 ?auto_861960 ) ) ( not ( = ?auto_861953 ?auto_861961 ) ) ( not ( = ?auto_861954 ?auto_861955 ) ) ( not ( = ?auto_861954 ?auto_861956 ) ) ( not ( = ?auto_861954 ?auto_861957 ) ) ( not ( = ?auto_861954 ?auto_861958 ) ) ( not ( = ?auto_861954 ?auto_861959 ) ) ( not ( = ?auto_861954 ?auto_861960 ) ) ( not ( = ?auto_861954 ?auto_861961 ) ) ( not ( = ?auto_861955 ?auto_861956 ) ) ( not ( = ?auto_861955 ?auto_861957 ) ) ( not ( = ?auto_861955 ?auto_861958 ) ) ( not ( = ?auto_861955 ?auto_861959 ) ) ( not ( = ?auto_861955 ?auto_861960 ) ) ( not ( = ?auto_861955 ?auto_861961 ) ) ( not ( = ?auto_861956 ?auto_861957 ) ) ( not ( = ?auto_861956 ?auto_861958 ) ) ( not ( = ?auto_861956 ?auto_861959 ) ) ( not ( = ?auto_861956 ?auto_861960 ) ) ( not ( = ?auto_861956 ?auto_861961 ) ) ( not ( = ?auto_861957 ?auto_861958 ) ) ( not ( = ?auto_861957 ?auto_861959 ) ) ( not ( = ?auto_861957 ?auto_861960 ) ) ( not ( = ?auto_861957 ?auto_861961 ) ) ( not ( = ?auto_861958 ?auto_861959 ) ) ( not ( = ?auto_861958 ?auto_861960 ) ) ( not ( = ?auto_861958 ?auto_861961 ) ) ( not ( = ?auto_861959 ?auto_861960 ) ) ( not ( = ?auto_861959 ?auto_861961 ) ) ( not ( = ?auto_861960 ?auto_861961 ) ) ( ON ?auto_861959 ?auto_861960 ) ( ON ?auto_861958 ?auto_861959 ) ( ON ?auto_861957 ?auto_861958 ) ( ON ?auto_861956 ?auto_861957 ) ( ON ?auto_861955 ?auto_861956 ) ( CLEAR ?auto_861953 ) ( ON ?auto_861954 ?auto_861955 ) ( CLEAR ?auto_861954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_861943 ?auto_861944 ?auto_861945 ?auto_861946 ?auto_861947 ?auto_861948 ?auto_861949 ?auto_861950 ?auto_861951 ?auto_861952 ?auto_861953 ?auto_861954 )
      ( MAKE-18PILE ?auto_861943 ?auto_861944 ?auto_861945 ?auto_861946 ?auto_861947 ?auto_861948 ?auto_861949 ?auto_861950 ?auto_861951 ?auto_861952 ?auto_861953 ?auto_861954 ?auto_861955 ?auto_861956 ?auto_861957 ?auto_861958 ?auto_861959 ?auto_861960 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_861980 - BLOCK
      ?auto_861981 - BLOCK
      ?auto_861982 - BLOCK
      ?auto_861983 - BLOCK
      ?auto_861984 - BLOCK
      ?auto_861985 - BLOCK
      ?auto_861986 - BLOCK
      ?auto_861987 - BLOCK
      ?auto_861988 - BLOCK
      ?auto_861989 - BLOCK
      ?auto_861990 - BLOCK
      ?auto_861991 - BLOCK
      ?auto_861992 - BLOCK
      ?auto_861993 - BLOCK
      ?auto_861994 - BLOCK
      ?auto_861995 - BLOCK
      ?auto_861996 - BLOCK
      ?auto_861997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_861997 ) ( ON-TABLE ?auto_861980 ) ( ON ?auto_861981 ?auto_861980 ) ( ON ?auto_861982 ?auto_861981 ) ( ON ?auto_861983 ?auto_861982 ) ( ON ?auto_861984 ?auto_861983 ) ( ON ?auto_861985 ?auto_861984 ) ( ON ?auto_861986 ?auto_861985 ) ( ON ?auto_861987 ?auto_861986 ) ( ON ?auto_861988 ?auto_861987 ) ( ON ?auto_861989 ?auto_861988 ) ( ON ?auto_861990 ?auto_861989 ) ( not ( = ?auto_861980 ?auto_861981 ) ) ( not ( = ?auto_861980 ?auto_861982 ) ) ( not ( = ?auto_861980 ?auto_861983 ) ) ( not ( = ?auto_861980 ?auto_861984 ) ) ( not ( = ?auto_861980 ?auto_861985 ) ) ( not ( = ?auto_861980 ?auto_861986 ) ) ( not ( = ?auto_861980 ?auto_861987 ) ) ( not ( = ?auto_861980 ?auto_861988 ) ) ( not ( = ?auto_861980 ?auto_861989 ) ) ( not ( = ?auto_861980 ?auto_861990 ) ) ( not ( = ?auto_861980 ?auto_861991 ) ) ( not ( = ?auto_861980 ?auto_861992 ) ) ( not ( = ?auto_861980 ?auto_861993 ) ) ( not ( = ?auto_861980 ?auto_861994 ) ) ( not ( = ?auto_861980 ?auto_861995 ) ) ( not ( = ?auto_861980 ?auto_861996 ) ) ( not ( = ?auto_861980 ?auto_861997 ) ) ( not ( = ?auto_861981 ?auto_861982 ) ) ( not ( = ?auto_861981 ?auto_861983 ) ) ( not ( = ?auto_861981 ?auto_861984 ) ) ( not ( = ?auto_861981 ?auto_861985 ) ) ( not ( = ?auto_861981 ?auto_861986 ) ) ( not ( = ?auto_861981 ?auto_861987 ) ) ( not ( = ?auto_861981 ?auto_861988 ) ) ( not ( = ?auto_861981 ?auto_861989 ) ) ( not ( = ?auto_861981 ?auto_861990 ) ) ( not ( = ?auto_861981 ?auto_861991 ) ) ( not ( = ?auto_861981 ?auto_861992 ) ) ( not ( = ?auto_861981 ?auto_861993 ) ) ( not ( = ?auto_861981 ?auto_861994 ) ) ( not ( = ?auto_861981 ?auto_861995 ) ) ( not ( = ?auto_861981 ?auto_861996 ) ) ( not ( = ?auto_861981 ?auto_861997 ) ) ( not ( = ?auto_861982 ?auto_861983 ) ) ( not ( = ?auto_861982 ?auto_861984 ) ) ( not ( = ?auto_861982 ?auto_861985 ) ) ( not ( = ?auto_861982 ?auto_861986 ) ) ( not ( = ?auto_861982 ?auto_861987 ) ) ( not ( = ?auto_861982 ?auto_861988 ) ) ( not ( = ?auto_861982 ?auto_861989 ) ) ( not ( = ?auto_861982 ?auto_861990 ) ) ( not ( = ?auto_861982 ?auto_861991 ) ) ( not ( = ?auto_861982 ?auto_861992 ) ) ( not ( = ?auto_861982 ?auto_861993 ) ) ( not ( = ?auto_861982 ?auto_861994 ) ) ( not ( = ?auto_861982 ?auto_861995 ) ) ( not ( = ?auto_861982 ?auto_861996 ) ) ( not ( = ?auto_861982 ?auto_861997 ) ) ( not ( = ?auto_861983 ?auto_861984 ) ) ( not ( = ?auto_861983 ?auto_861985 ) ) ( not ( = ?auto_861983 ?auto_861986 ) ) ( not ( = ?auto_861983 ?auto_861987 ) ) ( not ( = ?auto_861983 ?auto_861988 ) ) ( not ( = ?auto_861983 ?auto_861989 ) ) ( not ( = ?auto_861983 ?auto_861990 ) ) ( not ( = ?auto_861983 ?auto_861991 ) ) ( not ( = ?auto_861983 ?auto_861992 ) ) ( not ( = ?auto_861983 ?auto_861993 ) ) ( not ( = ?auto_861983 ?auto_861994 ) ) ( not ( = ?auto_861983 ?auto_861995 ) ) ( not ( = ?auto_861983 ?auto_861996 ) ) ( not ( = ?auto_861983 ?auto_861997 ) ) ( not ( = ?auto_861984 ?auto_861985 ) ) ( not ( = ?auto_861984 ?auto_861986 ) ) ( not ( = ?auto_861984 ?auto_861987 ) ) ( not ( = ?auto_861984 ?auto_861988 ) ) ( not ( = ?auto_861984 ?auto_861989 ) ) ( not ( = ?auto_861984 ?auto_861990 ) ) ( not ( = ?auto_861984 ?auto_861991 ) ) ( not ( = ?auto_861984 ?auto_861992 ) ) ( not ( = ?auto_861984 ?auto_861993 ) ) ( not ( = ?auto_861984 ?auto_861994 ) ) ( not ( = ?auto_861984 ?auto_861995 ) ) ( not ( = ?auto_861984 ?auto_861996 ) ) ( not ( = ?auto_861984 ?auto_861997 ) ) ( not ( = ?auto_861985 ?auto_861986 ) ) ( not ( = ?auto_861985 ?auto_861987 ) ) ( not ( = ?auto_861985 ?auto_861988 ) ) ( not ( = ?auto_861985 ?auto_861989 ) ) ( not ( = ?auto_861985 ?auto_861990 ) ) ( not ( = ?auto_861985 ?auto_861991 ) ) ( not ( = ?auto_861985 ?auto_861992 ) ) ( not ( = ?auto_861985 ?auto_861993 ) ) ( not ( = ?auto_861985 ?auto_861994 ) ) ( not ( = ?auto_861985 ?auto_861995 ) ) ( not ( = ?auto_861985 ?auto_861996 ) ) ( not ( = ?auto_861985 ?auto_861997 ) ) ( not ( = ?auto_861986 ?auto_861987 ) ) ( not ( = ?auto_861986 ?auto_861988 ) ) ( not ( = ?auto_861986 ?auto_861989 ) ) ( not ( = ?auto_861986 ?auto_861990 ) ) ( not ( = ?auto_861986 ?auto_861991 ) ) ( not ( = ?auto_861986 ?auto_861992 ) ) ( not ( = ?auto_861986 ?auto_861993 ) ) ( not ( = ?auto_861986 ?auto_861994 ) ) ( not ( = ?auto_861986 ?auto_861995 ) ) ( not ( = ?auto_861986 ?auto_861996 ) ) ( not ( = ?auto_861986 ?auto_861997 ) ) ( not ( = ?auto_861987 ?auto_861988 ) ) ( not ( = ?auto_861987 ?auto_861989 ) ) ( not ( = ?auto_861987 ?auto_861990 ) ) ( not ( = ?auto_861987 ?auto_861991 ) ) ( not ( = ?auto_861987 ?auto_861992 ) ) ( not ( = ?auto_861987 ?auto_861993 ) ) ( not ( = ?auto_861987 ?auto_861994 ) ) ( not ( = ?auto_861987 ?auto_861995 ) ) ( not ( = ?auto_861987 ?auto_861996 ) ) ( not ( = ?auto_861987 ?auto_861997 ) ) ( not ( = ?auto_861988 ?auto_861989 ) ) ( not ( = ?auto_861988 ?auto_861990 ) ) ( not ( = ?auto_861988 ?auto_861991 ) ) ( not ( = ?auto_861988 ?auto_861992 ) ) ( not ( = ?auto_861988 ?auto_861993 ) ) ( not ( = ?auto_861988 ?auto_861994 ) ) ( not ( = ?auto_861988 ?auto_861995 ) ) ( not ( = ?auto_861988 ?auto_861996 ) ) ( not ( = ?auto_861988 ?auto_861997 ) ) ( not ( = ?auto_861989 ?auto_861990 ) ) ( not ( = ?auto_861989 ?auto_861991 ) ) ( not ( = ?auto_861989 ?auto_861992 ) ) ( not ( = ?auto_861989 ?auto_861993 ) ) ( not ( = ?auto_861989 ?auto_861994 ) ) ( not ( = ?auto_861989 ?auto_861995 ) ) ( not ( = ?auto_861989 ?auto_861996 ) ) ( not ( = ?auto_861989 ?auto_861997 ) ) ( not ( = ?auto_861990 ?auto_861991 ) ) ( not ( = ?auto_861990 ?auto_861992 ) ) ( not ( = ?auto_861990 ?auto_861993 ) ) ( not ( = ?auto_861990 ?auto_861994 ) ) ( not ( = ?auto_861990 ?auto_861995 ) ) ( not ( = ?auto_861990 ?auto_861996 ) ) ( not ( = ?auto_861990 ?auto_861997 ) ) ( not ( = ?auto_861991 ?auto_861992 ) ) ( not ( = ?auto_861991 ?auto_861993 ) ) ( not ( = ?auto_861991 ?auto_861994 ) ) ( not ( = ?auto_861991 ?auto_861995 ) ) ( not ( = ?auto_861991 ?auto_861996 ) ) ( not ( = ?auto_861991 ?auto_861997 ) ) ( not ( = ?auto_861992 ?auto_861993 ) ) ( not ( = ?auto_861992 ?auto_861994 ) ) ( not ( = ?auto_861992 ?auto_861995 ) ) ( not ( = ?auto_861992 ?auto_861996 ) ) ( not ( = ?auto_861992 ?auto_861997 ) ) ( not ( = ?auto_861993 ?auto_861994 ) ) ( not ( = ?auto_861993 ?auto_861995 ) ) ( not ( = ?auto_861993 ?auto_861996 ) ) ( not ( = ?auto_861993 ?auto_861997 ) ) ( not ( = ?auto_861994 ?auto_861995 ) ) ( not ( = ?auto_861994 ?auto_861996 ) ) ( not ( = ?auto_861994 ?auto_861997 ) ) ( not ( = ?auto_861995 ?auto_861996 ) ) ( not ( = ?auto_861995 ?auto_861997 ) ) ( not ( = ?auto_861996 ?auto_861997 ) ) ( ON ?auto_861996 ?auto_861997 ) ( ON ?auto_861995 ?auto_861996 ) ( ON ?auto_861994 ?auto_861995 ) ( ON ?auto_861993 ?auto_861994 ) ( ON ?auto_861992 ?auto_861993 ) ( CLEAR ?auto_861990 ) ( ON ?auto_861991 ?auto_861992 ) ( CLEAR ?auto_861991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_861980 ?auto_861981 ?auto_861982 ?auto_861983 ?auto_861984 ?auto_861985 ?auto_861986 ?auto_861987 ?auto_861988 ?auto_861989 ?auto_861990 ?auto_861991 )
      ( MAKE-18PILE ?auto_861980 ?auto_861981 ?auto_861982 ?auto_861983 ?auto_861984 ?auto_861985 ?auto_861986 ?auto_861987 ?auto_861988 ?auto_861989 ?auto_861990 ?auto_861991 ?auto_861992 ?auto_861993 ?auto_861994 ?auto_861995 ?auto_861996 ?auto_861997 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862016 - BLOCK
      ?auto_862017 - BLOCK
      ?auto_862018 - BLOCK
      ?auto_862019 - BLOCK
      ?auto_862020 - BLOCK
      ?auto_862021 - BLOCK
      ?auto_862022 - BLOCK
      ?auto_862023 - BLOCK
      ?auto_862024 - BLOCK
      ?auto_862025 - BLOCK
      ?auto_862026 - BLOCK
      ?auto_862027 - BLOCK
      ?auto_862028 - BLOCK
      ?auto_862029 - BLOCK
      ?auto_862030 - BLOCK
      ?auto_862031 - BLOCK
      ?auto_862032 - BLOCK
      ?auto_862033 - BLOCK
    )
    :vars
    (
      ?auto_862034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862033 ?auto_862034 ) ( ON-TABLE ?auto_862016 ) ( ON ?auto_862017 ?auto_862016 ) ( ON ?auto_862018 ?auto_862017 ) ( ON ?auto_862019 ?auto_862018 ) ( ON ?auto_862020 ?auto_862019 ) ( ON ?auto_862021 ?auto_862020 ) ( ON ?auto_862022 ?auto_862021 ) ( ON ?auto_862023 ?auto_862022 ) ( ON ?auto_862024 ?auto_862023 ) ( ON ?auto_862025 ?auto_862024 ) ( not ( = ?auto_862016 ?auto_862017 ) ) ( not ( = ?auto_862016 ?auto_862018 ) ) ( not ( = ?auto_862016 ?auto_862019 ) ) ( not ( = ?auto_862016 ?auto_862020 ) ) ( not ( = ?auto_862016 ?auto_862021 ) ) ( not ( = ?auto_862016 ?auto_862022 ) ) ( not ( = ?auto_862016 ?auto_862023 ) ) ( not ( = ?auto_862016 ?auto_862024 ) ) ( not ( = ?auto_862016 ?auto_862025 ) ) ( not ( = ?auto_862016 ?auto_862026 ) ) ( not ( = ?auto_862016 ?auto_862027 ) ) ( not ( = ?auto_862016 ?auto_862028 ) ) ( not ( = ?auto_862016 ?auto_862029 ) ) ( not ( = ?auto_862016 ?auto_862030 ) ) ( not ( = ?auto_862016 ?auto_862031 ) ) ( not ( = ?auto_862016 ?auto_862032 ) ) ( not ( = ?auto_862016 ?auto_862033 ) ) ( not ( = ?auto_862016 ?auto_862034 ) ) ( not ( = ?auto_862017 ?auto_862018 ) ) ( not ( = ?auto_862017 ?auto_862019 ) ) ( not ( = ?auto_862017 ?auto_862020 ) ) ( not ( = ?auto_862017 ?auto_862021 ) ) ( not ( = ?auto_862017 ?auto_862022 ) ) ( not ( = ?auto_862017 ?auto_862023 ) ) ( not ( = ?auto_862017 ?auto_862024 ) ) ( not ( = ?auto_862017 ?auto_862025 ) ) ( not ( = ?auto_862017 ?auto_862026 ) ) ( not ( = ?auto_862017 ?auto_862027 ) ) ( not ( = ?auto_862017 ?auto_862028 ) ) ( not ( = ?auto_862017 ?auto_862029 ) ) ( not ( = ?auto_862017 ?auto_862030 ) ) ( not ( = ?auto_862017 ?auto_862031 ) ) ( not ( = ?auto_862017 ?auto_862032 ) ) ( not ( = ?auto_862017 ?auto_862033 ) ) ( not ( = ?auto_862017 ?auto_862034 ) ) ( not ( = ?auto_862018 ?auto_862019 ) ) ( not ( = ?auto_862018 ?auto_862020 ) ) ( not ( = ?auto_862018 ?auto_862021 ) ) ( not ( = ?auto_862018 ?auto_862022 ) ) ( not ( = ?auto_862018 ?auto_862023 ) ) ( not ( = ?auto_862018 ?auto_862024 ) ) ( not ( = ?auto_862018 ?auto_862025 ) ) ( not ( = ?auto_862018 ?auto_862026 ) ) ( not ( = ?auto_862018 ?auto_862027 ) ) ( not ( = ?auto_862018 ?auto_862028 ) ) ( not ( = ?auto_862018 ?auto_862029 ) ) ( not ( = ?auto_862018 ?auto_862030 ) ) ( not ( = ?auto_862018 ?auto_862031 ) ) ( not ( = ?auto_862018 ?auto_862032 ) ) ( not ( = ?auto_862018 ?auto_862033 ) ) ( not ( = ?auto_862018 ?auto_862034 ) ) ( not ( = ?auto_862019 ?auto_862020 ) ) ( not ( = ?auto_862019 ?auto_862021 ) ) ( not ( = ?auto_862019 ?auto_862022 ) ) ( not ( = ?auto_862019 ?auto_862023 ) ) ( not ( = ?auto_862019 ?auto_862024 ) ) ( not ( = ?auto_862019 ?auto_862025 ) ) ( not ( = ?auto_862019 ?auto_862026 ) ) ( not ( = ?auto_862019 ?auto_862027 ) ) ( not ( = ?auto_862019 ?auto_862028 ) ) ( not ( = ?auto_862019 ?auto_862029 ) ) ( not ( = ?auto_862019 ?auto_862030 ) ) ( not ( = ?auto_862019 ?auto_862031 ) ) ( not ( = ?auto_862019 ?auto_862032 ) ) ( not ( = ?auto_862019 ?auto_862033 ) ) ( not ( = ?auto_862019 ?auto_862034 ) ) ( not ( = ?auto_862020 ?auto_862021 ) ) ( not ( = ?auto_862020 ?auto_862022 ) ) ( not ( = ?auto_862020 ?auto_862023 ) ) ( not ( = ?auto_862020 ?auto_862024 ) ) ( not ( = ?auto_862020 ?auto_862025 ) ) ( not ( = ?auto_862020 ?auto_862026 ) ) ( not ( = ?auto_862020 ?auto_862027 ) ) ( not ( = ?auto_862020 ?auto_862028 ) ) ( not ( = ?auto_862020 ?auto_862029 ) ) ( not ( = ?auto_862020 ?auto_862030 ) ) ( not ( = ?auto_862020 ?auto_862031 ) ) ( not ( = ?auto_862020 ?auto_862032 ) ) ( not ( = ?auto_862020 ?auto_862033 ) ) ( not ( = ?auto_862020 ?auto_862034 ) ) ( not ( = ?auto_862021 ?auto_862022 ) ) ( not ( = ?auto_862021 ?auto_862023 ) ) ( not ( = ?auto_862021 ?auto_862024 ) ) ( not ( = ?auto_862021 ?auto_862025 ) ) ( not ( = ?auto_862021 ?auto_862026 ) ) ( not ( = ?auto_862021 ?auto_862027 ) ) ( not ( = ?auto_862021 ?auto_862028 ) ) ( not ( = ?auto_862021 ?auto_862029 ) ) ( not ( = ?auto_862021 ?auto_862030 ) ) ( not ( = ?auto_862021 ?auto_862031 ) ) ( not ( = ?auto_862021 ?auto_862032 ) ) ( not ( = ?auto_862021 ?auto_862033 ) ) ( not ( = ?auto_862021 ?auto_862034 ) ) ( not ( = ?auto_862022 ?auto_862023 ) ) ( not ( = ?auto_862022 ?auto_862024 ) ) ( not ( = ?auto_862022 ?auto_862025 ) ) ( not ( = ?auto_862022 ?auto_862026 ) ) ( not ( = ?auto_862022 ?auto_862027 ) ) ( not ( = ?auto_862022 ?auto_862028 ) ) ( not ( = ?auto_862022 ?auto_862029 ) ) ( not ( = ?auto_862022 ?auto_862030 ) ) ( not ( = ?auto_862022 ?auto_862031 ) ) ( not ( = ?auto_862022 ?auto_862032 ) ) ( not ( = ?auto_862022 ?auto_862033 ) ) ( not ( = ?auto_862022 ?auto_862034 ) ) ( not ( = ?auto_862023 ?auto_862024 ) ) ( not ( = ?auto_862023 ?auto_862025 ) ) ( not ( = ?auto_862023 ?auto_862026 ) ) ( not ( = ?auto_862023 ?auto_862027 ) ) ( not ( = ?auto_862023 ?auto_862028 ) ) ( not ( = ?auto_862023 ?auto_862029 ) ) ( not ( = ?auto_862023 ?auto_862030 ) ) ( not ( = ?auto_862023 ?auto_862031 ) ) ( not ( = ?auto_862023 ?auto_862032 ) ) ( not ( = ?auto_862023 ?auto_862033 ) ) ( not ( = ?auto_862023 ?auto_862034 ) ) ( not ( = ?auto_862024 ?auto_862025 ) ) ( not ( = ?auto_862024 ?auto_862026 ) ) ( not ( = ?auto_862024 ?auto_862027 ) ) ( not ( = ?auto_862024 ?auto_862028 ) ) ( not ( = ?auto_862024 ?auto_862029 ) ) ( not ( = ?auto_862024 ?auto_862030 ) ) ( not ( = ?auto_862024 ?auto_862031 ) ) ( not ( = ?auto_862024 ?auto_862032 ) ) ( not ( = ?auto_862024 ?auto_862033 ) ) ( not ( = ?auto_862024 ?auto_862034 ) ) ( not ( = ?auto_862025 ?auto_862026 ) ) ( not ( = ?auto_862025 ?auto_862027 ) ) ( not ( = ?auto_862025 ?auto_862028 ) ) ( not ( = ?auto_862025 ?auto_862029 ) ) ( not ( = ?auto_862025 ?auto_862030 ) ) ( not ( = ?auto_862025 ?auto_862031 ) ) ( not ( = ?auto_862025 ?auto_862032 ) ) ( not ( = ?auto_862025 ?auto_862033 ) ) ( not ( = ?auto_862025 ?auto_862034 ) ) ( not ( = ?auto_862026 ?auto_862027 ) ) ( not ( = ?auto_862026 ?auto_862028 ) ) ( not ( = ?auto_862026 ?auto_862029 ) ) ( not ( = ?auto_862026 ?auto_862030 ) ) ( not ( = ?auto_862026 ?auto_862031 ) ) ( not ( = ?auto_862026 ?auto_862032 ) ) ( not ( = ?auto_862026 ?auto_862033 ) ) ( not ( = ?auto_862026 ?auto_862034 ) ) ( not ( = ?auto_862027 ?auto_862028 ) ) ( not ( = ?auto_862027 ?auto_862029 ) ) ( not ( = ?auto_862027 ?auto_862030 ) ) ( not ( = ?auto_862027 ?auto_862031 ) ) ( not ( = ?auto_862027 ?auto_862032 ) ) ( not ( = ?auto_862027 ?auto_862033 ) ) ( not ( = ?auto_862027 ?auto_862034 ) ) ( not ( = ?auto_862028 ?auto_862029 ) ) ( not ( = ?auto_862028 ?auto_862030 ) ) ( not ( = ?auto_862028 ?auto_862031 ) ) ( not ( = ?auto_862028 ?auto_862032 ) ) ( not ( = ?auto_862028 ?auto_862033 ) ) ( not ( = ?auto_862028 ?auto_862034 ) ) ( not ( = ?auto_862029 ?auto_862030 ) ) ( not ( = ?auto_862029 ?auto_862031 ) ) ( not ( = ?auto_862029 ?auto_862032 ) ) ( not ( = ?auto_862029 ?auto_862033 ) ) ( not ( = ?auto_862029 ?auto_862034 ) ) ( not ( = ?auto_862030 ?auto_862031 ) ) ( not ( = ?auto_862030 ?auto_862032 ) ) ( not ( = ?auto_862030 ?auto_862033 ) ) ( not ( = ?auto_862030 ?auto_862034 ) ) ( not ( = ?auto_862031 ?auto_862032 ) ) ( not ( = ?auto_862031 ?auto_862033 ) ) ( not ( = ?auto_862031 ?auto_862034 ) ) ( not ( = ?auto_862032 ?auto_862033 ) ) ( not ( = ?auto_862032 ?auto_862034 ) ) ( not ( = ?auto_862033 ?auto_862034 ) ) ( ON ?auto_862032 ?auto_862033 ) ( ON ?auto_862031 ?auto_862032 ) ( ON ?auto_862030 ?auto_862031 ) ( ON ?auto_862029 ?auto_862030 ) ( ON ?auto_862028 ?auto_862029 ) ( ON ?auto_862027 ?auto_862028 ) ( CLEAR ?auto_862025 ) ( ON ?auto_862026 ?auto_862027 ) ( CLEAR ?auto_862026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_862016 ?auto_862017 ?auto_862018 ?auto_862019 ?auto_862020 ?auto_862021 ?auto_862022 ?auto_862023 ?auto_862024 ?auto_862025 ?auto_862026 )
      ( MAKE-18PILE ?auto_862016 ?auto_862017 ?auto_862018 ?auto_862019 ?auto_862020 ?auto_862021 ?auto_862022 ?auto_862023 ?auto_862024 ?auto_862025 ?auto_862026 ?auto_862027 ?auto_862028 ?auto_862029 ?auto_862030 ?auto_862031 ?auto_862032 ?auto_862033 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862053 - BLOCK
      ?auto_862054 - BLOCK
      ?auto_862055 - BLOCK
      ?auto_862056 - BLOCK
      ?auto_862057 - BLOCK
      ?auto_862058 - BLOCK
      ?auto_862059 - BLOCK
      ?auto_862060 - BLOCK
      ?auto_862061 - BLOCK
      ?auto_862062 - BLOCK
      ?auto_862063 - BLOCK
      ?auto_862064 - BLOCK
      ?auto_862065 - BLOCK
      ?auto_862066 - BLOCK
      ?auto_862067 - BLOCK
      ?auto_862068 - BLOCK
      ?auto_862069 - BLOCK
      ?auto_862070 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_862070 ) ( ON-TABLE ?auto_862053 ) ( ON ?auto_862054 ?auto_862053 ) ( ON ?auto_862055 ?auto_862054 ) ( ON ?auto_862056 ?auto_862055 ) ( ON ?auto_862057 ?auto_862056 ) ( ON ?auto_862058 ?auto_862057 ) ( ON ?auto_862059 ?auto_862058 ) ( ON ?auto_862060 ?auto_862059 ) ( ON ?auto_862061 ?auto_862060 ) ( ON ?auto_862062 ?auto_862061 ) ( not ( = ?auto_862053 ?auto_862054 ) ) ( not ( = ?auto_862053 ?auto_862055 ) ) ( not ( = ?auto_862053 ?auto_862056 ) ) ( not ( = ?auto_862053 ?auto_862057 ) ) ( not ( = ?auto_862053 ?auto_862058 ) ) ( not ( = ?auto_862053 ?auto_862059 ) ) ( not ( = ?auto_862053 ?auto_862060 ) ) ( not ( = ?auto_862053 ?auto_862061 ) ) ( not ( = ?auto_862053 ?auto_862062 ) ) ( not ( = ?auto_862053 ?auto_862063 ) ) ( not ( = ?auto_862053 ?auto_862064 ) ) ( not ( = ?auto_862053 ?auto_862065 ) ) ( not ( = ?auto_862053 ?auto_862066 ) ) ( not ( = ?auto_862053 ?auto_862067 ) ) ( not ( = ?auto_862053 ?auto_862068 ) ) ( not ( = ?auto_862053 ?auto_862069 ) ) ( not ( = ?auto_862053 ?auto_862070 ) ) ( not ( = ?auto_862054 ?auto_862055 ) ) ( not ( = ?auto_862054 ?auto_862056 ) ) ( not ( = ?auto_862054 ?auto_862057 ) ) ( not ( = ?auto_862054 ?auto_862058 ) ) ( not ( = ?auto_862054 ?auto_862059 ) ) ( not ( = ?auto_862054 ?auto_862060 ) ) ( not ( = ?auto_862054 ?auto_862061 ) ) ( not ( = ?auto_862054 ?auto_862062 ) ) ( not ( = ?auto_862054 ?auto_862063 ) ) ( not ( = ?auto_862054 ?auto_862064 ) ) ( not ( = ?auto_862054 ?auto_862065 ) ) ( not ( = ?auto_862054 ?auto_862066 ) ) ( not ( = ?auto_862054 ?auto_862067 ) ) ( not ( = ?auto_862054 ?auto_862068 ) ) ( not ( = ?auto_862054 ?auto_862069 ) ) ( not ( = ?auto_862054 ?auto_862070 ) ) ( not ( = ?auto_862055 ?auto_862056 ) ) ( not ( = ?auto_862055 ?auto_862057 ) ) ( not ( = ?auto_862055 ?auto_862058 ) ) ( not ( = ?auto_862055 ?auto_862059 ) ) ( not ( = ?auto_862055 ?auto_862060 ) ) ( not ( = ?auto_862055 ?auto_862061 ) ) ( not ( = ?auto_862055 ?auto_862062 ) ) ( not ( = ?auto_862055 ?auto_862063 ) ) ( not ( = ?auto_862055 ?auto_862064 ) ) ( not ( = ?auto_862055 ?auto_862065 ) ) ( not ( = ?auto_862055 ?auto_862066 ) ) ( not ( = ?auto_862055 ?auto_862067 ) ) ( not ( = ?auto_862055 ?auto_862068 ) ) ( not ( = ?auto_862055 ?auto_862069 ) ) ( not ( = ?auto_862055 ?auto_862070 ) ) ( not ( = ?auto_862056 ?auto_862057 ) ) ( not ( = ?auto_862056 ?auto_862058 ) ) ( not ( = ?auto_862056 ?auto_862059 ) ) ( not ( = ?auto_862056 ?auto_862060 ) ) ( not ( = ?auto_862056 ?auto_862061 ) ) ( not ( = ?auto_862056 ?auto_862062 ) ) ( not ( = ?auto_862056 ?auto_862063 ) ) ( not ( = ?auto_862056 ?auto_862064 ) ) ( not ( = ?auto_862056 ?auto_862065 ) ) ( not ( = ?auto_862056 ?auto_862066 ) ) ( not ( = ?auto_862056 ?auto_862067 ) ) ( not ( = ?auto_862056 ?auto_862068 ) ) ( not ( = ?auto_862056 ?auto_862069 ) ) ( not ( = ?auto_862056 ?auto_862070 ) ) ( not ( = ?auto_862057 ?auto_862058 ) ) ( not ( = ?auto_862057 ?auto_862059 ) ) ( not ( = ?auto_862057 ?auto_862060 ) ) ( not ( = ?auto_862057 ?auto_862061 ) ) ( not ( = ?auto_862057 ?auto_862062 ) ) ( not ( = ?auto_862057 ?auto_862063 ) ) ( not ( = ?auto_862057 ?auto_862064 ) ) ( not ( = ?auto_862057 ?auto_862065 ) ) ( not ( = ?auto_862057 ?auto_862066 ) ) ( not ( = ?auto_862057 ?auto_862067 ) ) ( not ( = ?auto_862057 ?auto_862068 ) ) ( not ( = ?auto_862057 ?auto_862069 ) ) ( not ( = ?auto_862057 ?auto_862070 ) ) ( not ( = ?auto_862058 ?auto_862059 ) ) ( not ( = ?auto_862058 ?auto_862060 ) ) ( not ( = ?auto_862058 ?auto_862061 ) ) ( not ( = ?auto_862058 ?auto_862062 ) ) ( not ( = ?auto_862058 ?auto_862063 ) ) ( not ( = ?auto_862058 ?auto_862064 ) ) ( not ( = ?auto_862058 ?auto_862065 ) ) ( not ( = ?auto_862058 ?auto_862066 ) ) ( not ( = ?auto_862058 ?auto_862067 ) ) ( not ( = ?auto_862058 ?auto_862068 ) ) ( not ( = ?auto_862058 ?auto_862069 ) ) ( not ( = ?auto_862058 ?auto_862070 ) ) ( not ( = ?auto_862059 ?auto_862060 ) ) ( not ( = ?auto_862059 ?auto_862061 ) ) ( not ( = ?auto_862059 ?auto_862062 ) ) ( not ( = ?auto_862059 ?auto_862063 ) ) ( not ( = ?auto_862059 ?auto_862064 ) ) ( not ( = ?auto_862059 ?auto_862065 ) ) ( not ( = ?auto_862059 ?auto_862066 ) ) ( not ( = ?auto_862059 ?auto_862067 ) ) ( not ( = ?auto_862059 ?auto_862068 ) ) ( not ( = ?auto_862059 ?auto_862069 ) ) ( not ( = ?auto_862059 ?auto_862070 ) ) ( not ( = ?auto_862060 ?auto_862061 ) ) ( not ( = ?auto_862060 ?auto_862062 ) ) ( not ( = ?auto_862060 ?auto_862063 ) ) ( not ( = ?auto_862060 ?auto_862064 ) ) ( not ( = ?auto_862060 ?auto_862065 ) ) ( not ( = ?auto_862060 ?auto_862066 ) ) ( not ( = ?auto_862060 ?auto_862067 ) ) ( not ( = ?auto_862060 ?auto_862068 ) ) ( not ( = ?auto_862060 ?auto_862069 ) ) ( not ( = ?auto_862060 ?auto_862070 ) ) ( not ( = ?auto_862061 ?auto_862062 ) ) ( not ( = ?auto_862061 ?auto_862063 ) ) ( not ( = ?auto_862061 ?auto_862064 ) ) ( not ( = ?auto_862061 ?auto_862065 ) ) ( not ( = ?auto_862061 ?auto_862066 ) ) ( not ( = ?auto_862061 ?auto_862067 ) ) ( not ( = ?auto_862061 ?auto_862068 ) ) ( not ( = ?auto_862061 ?auto_862069 ) ) ( not ( = ?auto_862061 ?auto_862070 ) ) ( not ( = ?auto_862062 ?auto_862063 ) ) ( not ( = ?auto_862062 ?auto_862064 ) ) ( not ( = ?auto_862062 ?auto_862065 ) ) ( not ( = ?auto_862062 ?auto_862066 ) ) ( not ( = ?auto_862062 ?auto_862067 ) ) ( not ( = ?auto_862062 ?auto_862068 ) ) ( not ( = ?auto_862062 ?auto_862069 ) ) ( not ( = ?auto_862062 ?auto_862070 ) ) ( not ( = ?auto_862063 ?auto_862064 ) ) ( not ( = ?auto_862063 ?auto_862065 ) ) ( not ( = ?auto_862063 ?auto_862066 ) ) ( not ( = ?auto_862063 ?auto_862067 ) ) ( not ( = ?auto_862063 ?auto_862068 ) ) ( not ( = ?auto_862063 ?auto_862069 ) ) ( not ( = ?auto_862063 ?auto_862070 ) ) ( not ( = ?auto_862064 ?auto_862065 ) ) ( not ( = ?auto_862064 ?auto_862066 ) ) ( not ( = ?auto_862064 ?auto_862067 ) ) ( not ( = ?auto_862064 ?auto_862068 ) ) ( not ( = ?auto_862064 ?auto_862069 ) ) ( not ( = ?auto_862064 ?auto_862070 ) ) ( not ( = ?auto_862065 ?auto_862066 ) ) ( not ( = ?auto_862065 ?auto_862067 ) ) ( not ( = ?auto_862065 ?auto_862068 ) ) ( not ( = ?auto_862065 ?auto_862069 ) ) ( not ( = ?auto_862065 ?auto_862070 ) ) ( not ( = ?auto_862066 ?auto_862067 ) ) ( not ( = ?auto_862066 ?auto_862068 ) ) ( not ( = ?auto_862066 ?auto_862069 ) ) ( not ( = ?auto_862066 ?auto_862070 ) ) ( not ( = ?auto_862067 ?auto_862068 ) ) ( not ( = ?auto_862067 ?auto_862069 ) ) ( not ( = ?auto_862067 ?auto_862070 ) ) ( not ( = ?auto_862068 ?auto_862069 ) ) ( not ( = ?auto_862068 ?auto_862070 ) ) ( not ( = ?auto_862069 ?auto_862070 ) ) ( ON ?auto_862069 ?auto_862070 ) ( ON ?auto_862068 ?auto_862069 ) ( ON ?auto_862067 ?auto_862068 ) ( ON ?auto_862066 ?auto_862067 ) ( ON ?auto_862065 ?auto_862066 ) ( ON ?auto_862064 ?auto_862065 ) ( CLEAR ?auto_862062 ) ( ON ?auto_862063 ?auto_862064 ) ( CLEAR ?auto_862063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_862053 ?auto_862054 ?auto_862055 ?auto_862056 ?auto_862057 ?auto_862058 ?auto_862059 ?auto_862060 ?auto_862061 ?auto_862062 ?auto_862063 )
      ( MAKE-18PILE ?auto_862053 ?auto_862054 ?auto_862055 ?auto_862056 ?auto_862057 ?auto_862058 ?auto_862059 ?auto_862060 ?auto_862061 ?auto_862062 ?auto_862063 ?auto_862064 ?auto_862065 ?auto_862066 ?auto_862067 ?auto_862068 ?auto_862069 ?auto_862070 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862089 - BLOCK
      ?auto_862090 - BLOCK
      ?auto_862091 - BLOCK
      ?auto_862092 - BLOCK
      ?auto_862093 - BLOCK
      ?auto_862094 - BLOCK
      ?auto_862095 - BLOCK
      ?auto_862096 - BLOCK
      ?auto_862097 - BLOCK
      ?auto_862098 - BLOCK
      ?auto_862099 - BLOCK
      ?auto_862100 - BLOCK
      ?auto_862101 - BLOCK
      ?auto_862102 - BLOCK
      ?auto_862103 - BLOCK
      ?auto_862104 - BLOCK
      ?auto_862105 - BLOCK
      ?auto_862106 - BLOCK
    )
    :vars
    (
      ?auto_862107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862106 ?auto_862107 ) ( ON-TABLE ?auto_862089 ) ( ON ?auto_862090 ?auto_862089 ) ( ON ?auto_862091 ?auto_862090 ) ( ON ?auto_862092 ?auto_862091 ) ( ON ?auto_862093 ?auto_862092 ) ( ON ?auto_862094 ?auto_862093 ) ( ON ?auto_862095 ?auto_862094 ) ( ON ?auto_862096 ?auto_862095 ) ( ON ?auto_862097 ?auto_862096 ) ( not ( = ?auto_862089 ?auto_862090 ) ) ( not ( = ?auto_862089 ?auto_862091 ) ) ( not ( = ?auto_862089 ?auto_862092 ) ) ( not ( = ?auto_862089 ?auto_862093 ) ) ( not ( = ?auto_862089 ?auto_862094 ) ) ( not ( = ?auto_862089 ?auto_862095 ) ) ( not ( = ?auto_862089 ?auto_862096 ) ) ( not ( = ?auto_862089 ?auto_862097 ) ) ( not ( = ?auto_862089 ?auto_862098 ) ) ( not ( = ?auto_862089 ?auto_862099 ) ) ( not ( = ?auto_862089 ?auto_862100 ) ) ( not ( = ?auto_862089 ?auto_862101 ) ) ( not ( = ?auto_862089 ?auto_862102 ) ) ( not ( = ?auto_862089 ?auto_862103 ) ) ( not ( = ?auto_862089 ?auto_862104 ) ) ( not ( = ?auto_862089 ?auto_862105 ) ) ( not ( = ?auto_862089 ?auto_862106 ) ) ( not ( = ?auto_862089 ?auto_862107 ) ) ( not ( = ?auto_862090 ?auto_862091 ) ) ( not ( = ?auto_862090 ?auto_862092 ) ) ( not ( = ?auto_862090 ?auto_862093 ) ) ( not ( = ?auto_862090 ?auto_862094 ) ) ( not ( = ?auto_862090 ?auto_862095 ) ) ( not ( = ?auto_862090 ?auto_862096 ) ) ( not ( = ?auto_862090 ?auto_862097 ) ) ( not ( = ?auto_862090 ?auto_862098 ) ) ( not ( = ?auto_862090 ?auto_862099 ) ) ( not ( = ?auto_862090 ?auto_862100 ) ) ( not ( = ?auto_862090 ?auto_862101 ) ) ( not ( = ?auto_862090 ?auto_862102 ) ) ( not ( = ?auto_862090 ?auto_862103 ) ) ( not ( = ?auto_862090 ?auto_862104 ) ) ( not ( = ?auto_862090 ?auto_862105 ) ) ( not ( = ?auto_862090 ?auto_862106 ) ) ( not ( = ?auto_862090 ?auto_862107 ) ) ( not ( = ?auto_862091 ?auto_862092 ) ) ( not ( = ?auto_862091 ?auto_862093 ) ) ( not ( = ?auto_862091 ?auto_862094 ) ) ( not ( = ?auto_862091 ?auto_862095 ) ) ( not ( = ?auto_862091 ?auto_862096 ) ) ( not ( = ?auto_862091 ?auto_862097 ) ) ( not ( = ?auto_862091 ?auto_862098 ) ) ( not ( = ?auto_862091 ?auto_862099 ) ) ( not ( = ?auto_862091 ?auto_862100 ) ) ( not ( = ?auto_862091 ?auto_862101 ) ) ( not ( = ?auto_862091 ?auto_862102 ) ) ( not ( = ?auto_862091 ?auto_862103 ) ) ( not ( = ?auto_862091 ?auto_862104 ) ) ( not ( = ?auto_862091 ?auto_862105 ) ) ( not ( = ?auto_862091 ?auto_862106 ) ) ( not ( = ?auto_862091 ?auto_862107 ) ) ( not ( = ?auto_862092 ?auto_862093 ) ) ( not ( = ?auto_862092 ?auto_862094 ) ) ( not ( = ?auto_862092 ?auto_862095 ) ) ( not ( = ?auto_862092 ?auto_862096 ) ) ( not ( = ?auto_862092 ?auto_862097 ) ) ( not ( = ?auto_862092 ?auto_862098 ) ) ( not ( = ?auto_862092 ?auto_862099 ) ) ( not ( = ?auto_862092 ?auto_862100 ) ) ( not ( = ?auto_862092 ?auto_862101 ) ) ( not ( = ?auto_862092 ?auto_862102 ) ) ( not ( = ?auto_862092 ?auto_862103 ) ) ( not ( = ?auto_862092 ?auto_862104 ) ) ( not ( = ?auto_862092 ?auto_862105 ) ) ( not ( = ?auto_862092 ?auto_862106 ) ) ( not ( = ?auto_862092 ?auto_862107 ) ) ( not ( = ?auto_862093 ?auto_862094 ) ) ( not ( = ?auto_862093 ?auto_862095 ) ) ( not ( = ?auto_862093 ?auto_862096 ) ) ( not ( = ?auto_862093 ?auto_862097 ) ) ( not ( = ?auto_862093 ?auto_862098 ) ) ( not ( = ?auto_862093 ?auto_862099 ) ) ( not ( = ?auto_862093 ?auto_862100 ) ) ( not ( = ?auto_862093 ?auto_862101 ) ) ( not ( = ?auto_862093 ?auto_862102 ) ) ( not ( = ?auto_862093 ?auto_862103 ) ) ( not ( = ?auto_862093 ?auto_862104 ) ) ( not ( = ?auto_862093 ?auto_862105 ) ) ( not ( = ?auto_862093 ?auto_862106 ) ) ( not ( = ?auto_862093 ?auto_862107 ) ) ( not ( = ?auto_862094 ?auto_862095 ) ) ( not ( = ?auto_862094 ?auto_862096 ) ) ( not ( = ?auto_862094 ?auto_862097 ) ) ( not ( = ?auto_862094 ?auto_862098 ) ) ( not ( = ?auto_862094 ?auto_862099 ) ) ( not ( = ?auto_862094 ?auto_862100 ) ) ( not ( = ?auto_862094 ?auto_862101 ) ) ( not ( = ?auto_862094 ?auto_862102 ) ) ( not ( = ?auto_862094 ?auto_862103 ) ) ( not ( = ?auto_862094 ?auto_862104 ) ) ( not ( = ?auto_862094 ?auto_862105 ) ) ( not ( = ?auto_862094 ?auto_862106 ) ) ( not ( = ?auto_862094 ?auto_862107 ) ) ( not ( = ?auto_862095 ?auto_862096 ) ) ( not ( = ?auto_862095 ?auto_862097 ) ) ( not ( = ?auto_862095 ?auto_862098 ) ) ( not ( = ?auto_862095 ?auto_862099 ) ) ( not ( = ?auto_862095 ?auto_862100 ) ) ( not ( = ?auto_862095 ?auto_862101 ) ) ( not ( = ?auto_862095 ?auto_862102 ) ) ( not ( = ?auto_862095 ?auto_862103 ) ) ( not ( = ?auto_862095 ?auto_862104 ) ) ( not ( = ?auto_862095 ?auto_862105 ) ) ( not ( = ?auto_862095 ?auto_862106 ) ) ( not ( = ?auto_862095 ?auto_862107 ) ) ( not ( = ?auto_862096 ?auto_862097 ) ) ( not ( = ?auto_862096 ?auto_862098 ) ) ( not ( = ?auto_862096 ?auto_862099 ) ) ( not ( = ?auto_862096 ?auto_862100 ) ) ( not ( = ?auto_862096 ?auto_862101 ) ) ( not ( = ?auto_862096 ?auto_862102 ) ) ( not ( = ?auto_862096 ?auto_862103 ) ) ( not ( = ?auto_862096 ?auto_862104 ) ) ( not ( = ?auto_862096 ?auto_862105 ) ) ( not ( = ?auto_862096 ?auto_862106 ) ) ( not ( = ?auto_862096 ?auto_862107 ) ) ( not ( = ?auto_862097 ?auto_862098 ) ) ( not ( = ?auto_862097 ?auto_862099 ) ) ( not ( = ?auto_862097 ?auto_862100 ) ) ( not ( = ?auto_862097 ?auto_862101 ) ) ( not ( = ?auto_862097 ?auto_862102 ) ) ( not ( = ?auto_862097 ?auto_862103 ) ) ( not ( = ?auto_862097 ?auto_862104 ) ) ( not ( = ?auto_862097 ?auto_862105 ) ) ( not ( = ?auto_862097 ?auto_862106 ) ) ( not ( = ?auto_862097 ?auto_862107 ) ) ( not ( = ?auto_862098 ?auto_862099 ) ) ( not ( = ?auto_862098 ?auto_862100 ) ) ( not ( = ?auto_862098 ?auto_862101 ) ) ( not ( = ?auto_862098 ?auto_862102 ) ) ( not ( = ?auto_862098 ?auto_862103 ) ) ( not ( = ?auto_862098 ?auto_862104 ) ) ( not ( = ?auto_862098 ?auto_862105 ) ) ( not ( = ?auto_862098 ?auto_862106 ) ) ( not ( = ?auto_862098 ?auto_862107 ) ) ( not ( = ?auto_862099 ?auto_862100 ) ) ( not ( = ?auto_862099 ?auto_862101 ) ) ( not ( = ?auto_862099 ?auto_862102 ) ) ( not ( = ?auto_862099 ?auto_862103 ) ) ( not ( = ?auto_862099 ?auto_862104 ) ) ( not ( = ?auto_862099 ?auto_862105 ) ) ( not ( = ?auto_862099 ?auto_862106 ) ) ( not ( = ?auto_862099 ?auto_862107 ) ) ( not ( = ?auto_862100 ?auto_862101 ) ) ( not ( = ?auto_862100 ?auto_862102 ) ) ( not ( = ?auto_862100 ?auto_862103 ) ) ( not ( = ?auto_862100 ?auto_862104 ) ) ( not ( = ?auto_862100 ?auto_862105 ) ) ( not ( = ?auto_862100 ?auto_862106 ) ) ( not ( = ?auto_862100 ?auto_862107 ) ) ( not ( = ?auto_862101 ?auto_862102 ) ) ( not ( = ?auto_862101 ?auto_862103 ) ) ( not ( = ?auto_862101 ?auto_862104 ) ) ( not ( = ?auto_862101 ?auto_862105 ) ) ( not ( = ?auto_862101 ?auto_862106 ) ) ( not ( = ?auto_862101 ?auto_862107 ) ) ( not ( = ?auto_862102 ?auto_862103 ) ) ( not ( = ?auto_862102 ?auto_862104 ) ) ( not ( = ?auto_862102 ?auto_862105 ) ) ( not ( = ?auto_862102 ?auto_862106 ) ) ( not ( = ?auto_862102 ?auto_862107 ) ) ( not ( = ?auto_862103 ?auto_862104 ) ) ( not ( = ?auto_862103 ?auto_862105 ) ) ( not ( = ?auto_862103 ?auto_862106 ) ) ( not ( = ?auto_862103 ?auto_862107 ) ) ( not ( = ?auto_862104 ?auto_862105 ) ) ( not ( = ?auto_862104 ?auto_862106 ) ) ( not ( = ?auto_862104 ?auto_862107 ) ) ( not ( = ?auto_862105 ?auto_862106 ) ) ( not ( = ?auto_862105 ?auto_862107 ) ) ( not ( = ?auto_862106 ?auto_862107 ) ) ( ON ?auto_862105 ?auto_862106 ) ( ON ?auto_862104 ?auto_862105 ) ( ON ?auto_862103 ?auto_862104 ) ( ON ?auto_862102 ?auto_862103 ) ( ON ?auto_862101 ?auto_862102 ) ( ON ?auto_862100 ?auto_862101 ) ( ON ?auto_862099 ?auto_862100 ) ( CLEAR ?auto_862097 ) ( ON ?auto_862098 ?auto_862099 ) ( CLEAR ?auto_862098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_862089 ?auto_862090 ?auto_862091 ?auto_862092 ?auto_862093 ?auto_862094 ?auto_862095 ?auto_862096 ?auto_862097 ?auto_862098 )
      ( MAKE-18PILE ?auto_862089 ?auto_862090 ?auto_862091 ?auto_862092 ?auto_862093 ?auto_862094 ?auto_862095 ?auto_862096 ?auto_862097 ?auto_862098 ?auto_862099 ?auto_862100 ?auto_862101 ?auto_862102 ?auto_862103 ?auto_862104 ?auto_862105 ?auto_862106 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862126 - BLOCK
      ?auto_862127 - BLOCK
      ?auto_862128 - BLOCK
      ?auto_862129 - BLOCK
      ?auto_862130 - BLOCK
      ?auto_862131 - BLOCK
      ?auto_862132 - BLOCK
      ?auto_862133 - BLOCK
      ?auto_862134 - BLOCK
      ?auto_862135 - BLOCK
      ?auto_862136 - BLOCK
      ?auto_862137 - BLOCK
      ?auto_862138 - BLOCK
      ?auto_862139 - BLOCK
      ?auto_862140 - BLOCK
      ?auto_862141 - BLOCK
      ?auto_862142 - BLOCK
      ?auto_862143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_862143 ) ( ON-TABLE ?auto_862126 ) ( ON ?auto_862127 ?auto_862126 ) ( ON ?auto_862128 ?auto_862127 ) ( ON ?auto_862129 ?auto_862128 ) ( ON ?auto_862130 ?auto_862129 ) ( ON ?auto_862131 ?auto_862130 ) ( ON ?auto_862132 ?auto_862131 ) ( ON ?auto_862133 ?auto_862132 ) ( ON ?auto_862134 ?auto_862133 ) ( not ( = ?auto_862126 ?auto_862127 ) ) ( not ( = ?auto_862126 ?auto_862128 ) ) ( not ( = ?auto_862126 ?auto_862129 ) ) ( not ( = ?auto_862126 ?auto_862130 ) ) ( not ( = ?auto_862126 ?auto_862131 ) ) ( not ( = ?auto_862126 ?auto_862132 ) ) ( not ( = ?auto_862126 ?auto_862133 ) ) ( not ( = ?auto_862126 ?auto_862134 ) ) ( not ( = ?auto_862126 ?auto_862135 ) ) ( not ( = ?auto_862126 ?auto_862136 ) ) ( not ( = ?auto_862126 ?auto_862137 ) ) ( not ( = ?auto_862126 ?auto_862138 ) ) ( not ( = ?auto_862126 ?auto_862139 ) ) ( not ( = ?auto_862126 ?auto_862140 ) ) ( not ( = ?auto_862126 ?auto_862141 ) ) ( not ( = ?auto_862126 ?auto_862142 ) ) ( not ( = ?auto_862126 ?auto_862143 ) ) ( not ( = ?auto_862127 ?auto_862128 ) ) ( not ( = ?auto_862127 ?auto_862129 ) ) ( not ( = ?auto_862127 ?auto_862130 ) ) ( not ( = ?auto_862127 ?auto_862131 ) ) ( not ( = ?auto_862127 ?auto_862132 ) ) ( not ( = ?auto_862127 ?auto_862133 ) ) ( not ( = ?auto_862127 ?auto_862134 ) ) ( not ( = ?auto_862127 ?auto_862135 ) ) ( not ( = ?auto_862127 ?auto_862136 ) ) ( not ( = ?auto_862127 ?auto_862137 ) ) ( not ( = ?auto_862127 ?auto_862138 ) ) ( not ( = ?auto_862127 ?auto_862139 ) ) ( not ( = ?auto_862127 ?auto_862140 ) ) ( not ( = ?auto_862127 ?auto_862141 ) ) ( not ( = ?auto_862127 ?auto_862142 ) ) ( not ( = ?auto_862127 ?auto_862143 ) ) ( not ( = ?auto_862128 ?auto_862129 ) ) ( not ( = ?auto_862128 ?auto_862130 ) ) ( not ( = ?auto_862128 ?auto_862131 ) ) ( not ( = ?auto_862128 ?auto_862132 ) ) ( not ( = ?auto_862128 ?auto_862133 ) ) ( not ( = ?auto_862128 ?auto_862134 ) ) ( not ( = ?auto_862128 ?auto_862135 ) ) ( not ( = ?auto_862128 ?auto_862136 ) ) ( not ( = ?auto_862128 ?auto_862137 ) ) ( not ( = ?auto_862128 ?auto_862138 ) ) ( not ( = ?auto_862128 ?auto_862139 ) ) ( not ( = ?auto_862128 ?auto_862140 ) ) ( not ( = ?auto_862128 ?auto_862141 ) ) ( not ( = ?auto_862128 ?auto_862142 ) ) ( not ( = ?auto_862128 ?auto_862143 ) ) ( not ( = ?auto_862129 ?auto_862130 ) ) ( not ( = ?auto_862129 ?auto_862131 ) ) ( not ( = ?auto_862129 ?auto_862132 ) ) ( not ( = ?auto_862129 ?auto_862133 ) ) ( not ( = ?auto_862129 ?auto_862134 ) ) ( not ( = ?auto_862129 ?auto_862135 ) ) ( not ( = ?auto_862129 ?auto_862136 ) ) ( not ( = ?auto_862129 ?auto_862137 ) ) ( not ( = ?auto_862129 ?auto_862138 ) ) ( not ( = ?auto_862129 ?auto_862139 ) ) ( not ( = ?auto_862129 ?auto_862140 ) ) ( not ( = ?auto_862129 ?auto_862141 ) ) ( not ( = ?auto_862129 ?auto_862142 ) ) ( not ( = ?auto_862129 ?auto_862143 ) ) ( not ( = ?auto_862130 ?auto_862131 ) ) ( not ( = ?auto_862130 ?auto_862132 ) ) ( not ( = ?auto_862130 ?auto_862133 ) ) ( not ( = ?auto_862130 ?auto_862134 ) ) ( not ( = ?auto_862130 ?auto_862135 ) ) ( not ( = ?auto_862130 ?auto_862136 ) ) ( not ( = ?auto_862130 ?auto_862137 ) ) ( not ( = ?auto_862130 ?auto_862138 ) ) ( not ( = ?auto_862130 ?auto_862139 ) ) ( not ( = ?auto_862130 ?auto_862140 ) ) ( not ( = ?auto_862130 ?auto_862141 ) ) ( not ( = ?auto_862130 ?auto_862142 ) ) ( not ( = ?auto_862130 ?auto_862143 ) ) ( not ( = ?auto_862131 ?auto_862132 ) ) ( not ( = ?auto_862131 ?auto_862133 ) ) ( not ( = ?auto_862131 ?auto_862134 ) ) ( not ( = ?auto_862131 ?auto_862135 ) ) ( not ( = ?auto_862131 ?auto_862136 ) ) ( not ( = ?auto_862131 ?auto_862137 ) ) ( not ( = ?auto_862131 ?auto_862138 ) ) ( not ( = ?auto_862131 ?auto_862139 ) ) ( not ( = ?auto_862131 ?auto_862140 ) ) ( not ( = ?auto_862131 ?auto_862141 ) ) ( not ( = ?auto_862131 ?auto_862142 ) ) ( not ( = ?auto_862131 ?auto_862143 ) ) ( not ( = ?auto_862132 ?auto_862133 ) ) ( not ( = ?auto_862132 ?auto_862134 ) ) ( not ( = ?auto_862132 ?auto_862135 ) ) ( not ( = ?auto_862132 ?auto_862136 ) ) ( not ( = ?auto_862132 ?auto_862137 ) ) ( not ( = ?auto_862132 ?auto_862138 ) ) ( not ( = ?auto_862132 ?auto_862139 ) ) ( not ( = ?auto_862132 ?auto_862140 ) ) ( not ( = ?auto_862132 ?auto_862141 ) ) ( not ( = ?auto_862132 ?auto_862142 ) ) ( not ( = ?auto_862132 ?auto_862143 ) ) ( not ( = ?auto_862133 ?auto_862134 ) ) ( not ( = ?auto_862133 ?auto_862135 ) ) ( not ( = ?auto_862133 ?auto_862136 ) ) ( not ( = ?auto_862133 ?auto_862137 ) ) ( not ( = ?auto_862133 ?auto_862138 ) ) ( not ( = ?auto_862133 ?auto_862139 ) ) ( not ( = ?auto_862133 ?auto_862140 ) ) ( not ( = ?auto_862133 ?auto_862141 ) ) ( not ( = ?auto_862133 ?auto_862142 ) ) ( not ( = ?auto_862133 ?auto_862143 ) ) ( not ( = ?auto_862134 ?auto_862135 ) ) ( not ( = ?auto_862134 ?auto_862136 ) ) ( not ( = ?auto_862134 ?auto_862137 ) ) ( not ( = ?auto_862134 ?auto_862138 ) ) ( not ( = ?auto_862134 ?auto_862139 ) ) ( not ( = ?auto_862134 ?auto_862140 ) ) ( not ( = ?auto_862134 ?auto_862141 ) ) ( not ( = ?auto_862134 ?auto_862142 ) ) ( not ( = ?auto_862134 ?auto_862143 ) ) ( not ( = ?auto_862135 ?auto_862136 ) ) ( not ( = ?auto_862135 ?auto_862137 ) ) ( not ( = ?auto_862135 ?auto_862138 ) ) ( not ( = ?auto_862135 ?auto_862139 ) ) ( not ( = ?auto_862135 ?auto_862140 ) ) ( not ( = ?auto_862135 ?auto_862141 ) ) ( not ( = ?auto_862135 ?auto_862142 ) ) ( not ( = ?auto_862135 ?auto_862143 ) ) ( not ( = ?auto_862136 ?auto_862137 ) ) ( not ( = ?auto_862136 ?auto_862138 ) ) ( not ( = ?auto_862136 ?auto_862139 ) ) ( not ( = ?auto_862136 ?auto_862140 ) ) ( not ( = ?auto_862136 ?auto_862141 ) ) ( not ( = ?auto_862136 ?auto_862142 ) ) ( not ( = ?auto_862136 ?auto_862143 ) ) ( not ( = ?auto_862137 ?auto_862138 ) ) ( not ( = ?auto_862137 ?auto_862139 ) ) ( not ( = ?auto_862137 ?auto_862140 ) ) ( not ( = ?auto_862137 ?auto_862141 ) ) ( not ( = ?auto_862137 ?auto_862142 ) ) ( not ( = ?auto_862137 ?auto_862143 ) ) ( not ( = ?auto_862138 ?auto_862139 ) ) ( not ( = ?auto_862138 ?auto_862140 ) ) ( not ( = ?auto_862138 ?auto_862141 ) ) ( not ( = ?auto_862138 ?auto_862142 ) ) ( not ( = ?auto_862138 ?auto_862143 ) ) ( not ( = ?auto_862139 ?auto_862140 ) ) ( not ( = ?auto_862139 ?auto_862141 ) ) ( not ( = ?auto_862139 ?auto_862142 ) ) ( not ( = ?auto_862139 ?auto_862143 ) ) ( not ( = ?auto_862140 ?auto_862141 ) ) ( not ( = ?auto_862140 ?auto_862142 ) ) ( not ( = ?auto_862140 ?auto_862143 ) ) ( not ( = ?auto_862141 ?auto_862142 ) ) ( not ( = ?auto_862141 ?auto_862143 ) ) ( not ( = ?auto_862142 ?auto_862143 ) ) ( ON ?auto_862142 ?auto_862143 ) ( ON ?auto_862141 ?auto_862142 ) ( ON ?auto_862140 ?auto_862141 ) ( ON ?auto_862139 ?auto_862140 ) ( ON ?auto_862138 ?auto_862139 ) ( ON ?auto_862137 ?auto_862138 ) ( ON ?auto_862136 ?auto_862137 ) ( CLEAR ?auto_862134 ) ( ON ?auto_862135 ?auto_862136 ) ( CLEAR ?auto_862135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_862126 ?auto_862127 ?auto_862128 ?auto_862129 ?auto_862130 ?auto_862131 ?auto_862132 ?auto_862133 ?auto_862134 ?auto_862135 )
      ( MAKE-18PILE ?auto_862126 ?auto_862127 ?auto_862128 ?auto_862129 ?auto_862130 ?auto_862131 ?auto_862132 ?auto_862133 ?auto_862134 ?auto_862135 ?auto_862136 ?auto_862137 ?auto_862138 ?auto_862139 ?auto_862140 ?auto_862141 ?auto_862142 ?auto_862143 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862162 - BLOCK
      ?auto_862163 - BLOCK
      ?auto_862164 - BLOCK
      ?auto_862165 - BLOCK
      ?auto_862166 - BLOCK
      ?auto_862167 - BLOCK
      ?auto_862168 - BLOCK
      ?auto_862169 - BLOCK
      ?auto_862170 - BLOCK
      ?auto_862171 - BLOCK
      ?auto_862172 - BLOCK
      ?auto_862173 - BLOCK
      ?auto_862174 - BLOCK
      ?auto_862175 - BLOCK
      ?auto_862176 - BLOCK
      ?auto_862177 - BLOCK
      ?auto_862178 - BLOCK
      ?auto_862179 - BLOCK
    )
    :vars
    (
      ?auto_862180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862179 ?auto_862180 ) ( ON-TABLE ?auto_862162 ) ( ON ?auto_862163 ?auto_862162 ) ( ON ?auto_862164 ?auto_862163 ) ( ON ?auto_862165 ?auto_862164 ) ( ON ?auto_862166 ?auto_862165 ) ( ON ?auto_862167 ?auto_862166 ) ( ON ?auto_862168 ?auto_862167 ) ( ON ?auto_862169 ?auto_862168 ) ( not ( = ?auto_862162 ?auto_862163 ) ) ( not ( = ?auto_862162 ?auto_862164 ) ) ( not ( = ?auto_862162 ?auto_862165 ) ) ( not ( = ?auto_862162 ?auto_862166 ) ) ( not ( = ?auto_862162 ?auto_862167 ) ) ( not ( = ?auto_862162 ?auto_862168 ) ) ( not ( = ?auto_862162 ?auto_862169 ) ) ( not ( = ?auto_862162 ?auto_862170 ) ) ( not ( = ?auto_862162 ?auto_862171 ) ) ( not ( = ?auto_862162 ?auto_862172 ) ) ( not ( = ?auto_862162 ?auto_862173 ) ) ( not ( = ?auto_862162 ?auto_862174 ) ) ( not ( = ?auto_862162 ?auto_862175 ) ) ( not ( = ?auto_862162 ?auto_862176 ) ) ( not ( = ?auto_862162 ?auto_862177 ) ) ( not ( = ?auto_862162 ?auto_862178 ) ) ( not ( = ?auto_862162 ?auto_862179 ) ) ( not ( = ?auto_862162 ?auto_862180 ) ) ( not ( = ?auto_862163 ?auto_862164 ) ) ( not ( = ?auto_862163 ?auto_862165 ) ) ( not ( = ?auto_862163 ?auto_862166 ) ) ( not ( = ?auto_862163 ?auto_862167 ) ) ( not ( = ?auto_862163 ?auto_862168 ) ) ( not ( = ?auto_862163 ?auto_862169 ) ) ( not ( = ?auto_862163 ?auto_862170 ) ) ( not ( = ?auto_862163 ?auto_862171 ) ) ( not ( = ?auto_862163 ?auto_862172 ) ) ( not ( = ?auto_862163 ?auto_862173 ) ) ( not ( = ?auto_862163 ?auto_862174 ) ) ( not ( = ?auto_862163 ?auto_862175 ) ) ( not ( = ?auto_862163 ?auto_862176 ) ) ( not ( = ?auto_862163 ?auto_862177 ) ) ( not ( = ?auto_862163 ?auto_862178 ) ) ( not ( = ?auto_862163 ?auto_862179 ) ) ( not ( = ?auto_862163 ?auto_862180 ) ) ( not ( = ?auto_862164 ?auto_862165 ) ) ( not ( = ?auto_862164 ?auto_862166 ) ) ( not ( = ?auto_862164 ?auto_862167 ) ) ( not ( = ?auto_862164 ?auto_862168 ) ) ( not ( = ?auto_862164 ?auto_862169 ) ) ( not ( = ?auto_862164 ?auto_862170 ) ) ( not ( = ?auto_862164 ?auto_862171 ) ) ( not ( = ?auto_862164 ?auto_862172 ) ) ( not ( = ?auto_862164 ?auto_862173 ) ) ( not ( = ?auto_862164 ?auto_862174 ) ) ( not ( = ?auto_862164 ?auto_862175 ) ) ( not ( = ?auto_862164 ?auto_862176 ) ) ( not ( = ?auto_862164 ?auto_862177 ) ) ( not ( = ?auto_862164 ?auto_862178 ) ) ( not ( = ?auto_862164 ?auto_862179 ) ) ( not ( = ?auto_862164 ?auto_862180 ) ) ( not ( = ?auto_862165 ?auto_862166 ) ) ( not ( = ?auto_862165 ?auto_862167 ) ) ( not ( = ?auto_862165 ?auto_862168 ) ) ( not ( = ?auto_862165 ?auto_862169 ) ) ( not ( = ?auto_862165 ?auto_862170 ) ) ( not ( = ?auto_862165 ?auto_862171 ) ) ( not ( = ?auto_862165 ?auto_862172 ) ) ( not ( = ?auto_862165 ?auto_862173 ) ) ( not ( = ?auto_862165 ?auto_862174 ) ) ( not ( = ?auto_862165 ?auto_862175 ) ) ( not ( = ?auto_862165 ?auto_862176 ) ) ( not ( = ?auto_862165 ?auto_862177 ) ) ( not ( = ?auto_862165 ?auto_862178 ) ) ( not ( = ?auto_862165 ?auto_862179 ) ) ( not ( = ?auto_862165 ?auto_862180 ) ) ( not ( = ?auto_862166 ?auto_862167 ) ) ( not ( = ?auto_862166 ?auto_862168 ) ) ( not ( = ?auto_862166 ?auto_862169 ) ) ( not ( = ?auto_862166 ?auto_862170 ) ) ( not ( = ?auto_862166 ?auto_862171 ) ) ( not ( = ?auto_862166 ?auto_862172 ) ) ( not ( = ?auto_862166 ?auto_862173 ) ) ( not ( = ?auto_862166 ?auto_862174 ) ) ( not ( = ?auto_862166 ?auto_862175 ) ) ( not ( = ?auto_862166 ?auto_862176 ) ) ( not ( = ?auto_862166 ?auto_862177 ) ) ( not ( = ?auto_862166 ?auto_862178 ) ) ( not ( = ?auto_862166 ?auto_862179 ) ) ( not ( = ?auto_862166 ?auto_862180 ) ) ( not ( = ?auto_862167 ?auto_862168 ) ) ( not ( = ?auto_862167 ?auto_862169 ) ) ( not ( = ?auto_862167 ?auto_862170 ) ) ( not ( = ?auto_862167 ?auto_862171 ) ) ( not ( = ?auto_862167 ?auto_862172 ) ) ( not ( = ?auto_862167 ?auto_862173 ) ) ( not ( = ?auto_862167 ?auto_862174 ) ) ( not ( = ?auto_862167 ?auto_862175 ) ) ( not ( = ?auto_862167 ?auto_862176 ) ) ( not ( = ?auto_862167 ?auto_862177 ) ) ( not ( = ?auto_862167 ?auto_862178 ) ) ( not ( = ?auto_862167 ?auto_862179 ) ) ( not ( = ?auto_862167 ?auto_862180 ) ) ( not ( = ?auto_862168 ?auto_862169 ) ) ( not ( = ?auto_862168 ?auto_862170 ) ) ( not ( = ?auto_862168 ?auto_862171 ) ) ( not ( = ?auto_862168 ?auto_862172 ) ) ( not ( = ?auto_862168 ?auto_862173 ) ) ( not ( = ?auto_862168 ?auto_862174 ) ) ( not ( = ?auto_862168 ?auto_862175 ) ) ( not ( = ?auto_862168 ?auto_862176 ) ) ( not ( = ?auto_862168 ?auto_862177 ) ) ( not ( = ?auto_862168 ?auto_862178 ) ) ( not ( = ?auto_862168 ?auto_862179 ) ) ( not ( = ?auto_862168 ?auto_862180 ) ) ( not ( = ?auto_862169 ?auto_862170 ) ) ( not ( = ?auto_862169 ?auto_862171 ) ) ( not ( = ?auto_862169 ?auto_862172 ) ) ( not ( = ?auto_862169 ?auto_862173 ) ) ( not ( = ?auto_862169 ?auto_862174 ) ) ( not ( = ?auto_862169 ?auto_862175 ) ) ( not ( = ?auto_862169 ?auto_862176 ) ) ( not ( = ?auto_862169 ?auto_862177 ) ) ( not ( = ?auto_862169 ?auto_862178 ) ) ( not ( = ?auto_862169 ?auto_862179 ) ) ( not ( = ?auto_862169 ?auto_862180 ) ) ( not ( = ?auto_862170 ?auto_862171 ) ) ( not ( = ?auto_862170 ?auto_862172 ) ) ( not ( = ?auto_862170 ?auto_862173 ) ) ( not ( = ?auto_862170 ?auto_862174 ) ) ( not ( = ?auto_862170 ?auto_862175 ) ) ( not ( = ?auto_862170 ?auto_862176 ) ) ( not ( = ?auto_862170 ?auto_862177 ) ) ( not ( = ?auto_862170 ?auto_862178 ) ) ( not ( = ?auto_862170 ?auto_862179 ) ) ( not ( = ?auto_862170 ?auto_862180 ) ) ( not ( = ?auto_862171 ?auto_862172 ) ) ( not ( = ?auto_862171 ?auto_862173 ) ) ( not ( = ?auto_862171 ?auto_862174 ) ) ( not ( = ?auto_862171 ?auto_862175 ) ) ( not ( = ?auto_862171 ?auto_862176 ) ) ( not ( = ?auto_862171 ?auto_862177 ) ) ( not ( = ?auto_862171 ?auto_862178 ) ) ( not ( = ?auto_862171 ?auto_862179 ) ) ( not ( = ?auto_862171 ?auto_862180 ) ) ( not ( = ?auto_862172 ?auto_862173 ) ) ( not ( = ?auto_862172 ?auto_862174 ) ) ( not ( = ?auto_862172 ?auto_862175 ) ) ( not ( = ?auto_862172 ?auto_862176 ) ) ( not ( = ?auto_862172 ?auto_862177 ) ) ( not ( = ?auto_862172 ?auto_862178 ) ) ( not ( = ?auto_862172 ?auto_862179 ) ) ( not ( = ?auto_862172 ?auto_862180 ) ) ( not ( = ?auto_862173 ?auto_862174 ) ) ( not ( = ?auto_862173 ?auto_862175 ) ) ( not ( = ?auto_862173 ?auto_862176 ) ) ( not ( = ?auto_862173 ?auto_862177 ) ) ( not ( = ?auto_862173 ?auto_862178 ) ) ( not ( = ?auto_862173 ?auto_862179 ) ) ( not ( = ?auto_862173 ?auto_862180 ) ) ( not ( = ?auto_862174 ?auto_862175 ) ) ( not ( = ?auto_862174 ?auto_862176 ) ) ( not ( = ?auto_862174 ?auto_862177 ) ) ( not ( = ?auto_862174 ?auto_862178 ) ) ( not ( = ?auto_862174 ?auto_862179 ) ) ( not ( = ?auto_862174 ?auto_862180 ) ) ( not ( = ?auto_862175 ?auto_862176 ) ) ( not ( = ?auto_862175 ?auto_862177 ) ) ( not ( = ?auto_862175 ?auto_862178 ) ) ( not ( = ?auto_862175 ?auto_862179 ) ) ( not ( = ?auto_862175 ?auto_862180 ) ) ( not ( = ?auto_862176 ?auto_862177 ) ) ( not ( = ?auto_862176 ?auto_862178 ) ) ( not ( = ?auto_862176 ?auto_862179 ) ) ( not ( = ?auto_862176 ?auto_862180 ) ) ( not ( = ?auto_862177 ?auto_862178 ) ) ( not ( = ?auto_862177 ?auto_862179 ) ) ( not ( = ?auto_862177 ?auto_862180 ) ) ( not ( = ?auto_862178 ?auto_862179 ) ) ( not ( = ?auto_862178 ?auto_862180 ) ) ( not ( = ?auto_862179 ?auto_862180 ) ) ( ON ?auto_862178 ?auto_862179 ) ( ON ?auto_862177 ?auto_862178 ) ( ON ?auto_862176 ?auto_862177 ) ( ON ?auto_862175 ?auto_862176 ) ( ON ?auto_862174 ?auto_862175 ) ( ON ?auto_862173 ?auto_862174 ) ( ON ?auto_862172 ?auto_862173 ) ( ON ?auto_862171 ?auto_862172 ) ( CLEAR ?auto_862169 ) ( ON ?auto_862170 ?auto_862171 ) ( CLEAR ?auto_862170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_862162 ?auto_862163 ?auto_862164 ?auto_862165 ?auto_862166 ?auto_862167 ?auto_862168 ?auto_862169 ?auto_862170 )
      ( MAKE-18PILE ?auto_862162 ?auto_862163 ?auto_862164 ?auto_862165 ?auto_862166 ?auto_862167 ?auto_862168 ?auto_862169 ?auto_862170 ?auto_862171 ?auto_862172 ?auto_862173 ?auto_862174 ?auto_862175 ?auto_862176 ?auto_862177 ?auto_862178 ?auto_862179 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862199 - BLOCK
      ?auto_862200 - BLOCK
      ?auto_862201 - BLOCK
      ?auto_862202 - BLOCK
      ?auto_862203 - BLOCK
      ?auto_862204 - BLOCK
      ?auto_862205 - BLOCK
      ?auto_862206 - BLOCK
      ?auto_862207 - BLOCK
      ?auto_862208 - BLOCK
      ?auto_862209 - BLOCK
      ?auto_862210 - BLOCK
      ?auto_862211 - BLOCK
      ?auto_862212 - BLOCK
      ?auto_862213 - BLOCK
      ?auto_862214 - BLOCK
      ?auto_862215 - BLOCK
      ?auto_862216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_862216 ) ( ON-TABLE ?auto_862199 ) ( ON ?auto_862200 ?auto_862199 ) ( ON ?auto_862201 ?auto_862200 ) ( ON ?auto_862202 ?auto_862201 ) ( ON ?auto_862203 ?auto_862202 ) ( ON ?auto_862204 ?auto_862203 ) ( ON ?auto_862205 ?auto_862204 ) ( ON ?auto_862206 ?auto_862205 ) ( not ( = ?auto_862199 ?auto_862200 ) ) ( not ( = ?auto_862199 ?auto_862201 ) ) ( not ( = ?auto_862199 ?auto_862202 ) ) ( not ( = ?auto_862199 ?auto_862203 ) ) ( not ( = ?auto_862199 ?auto_862204 ) ) ( not ( = ?auto_862199 ?auto_862205 ) ) ( not ( = ?auto_862199 ?auto_862206 ) ) ( not ( = ?auto_862199 ?auto_862207 ) ) ( not ( = ?auto_862199 ?auto_862208 ) ) ( not ( = ?auto_862199 ?auto_862209 ) ) ( not ( = ?auto_862199 ?auto_862210 ) ) ( not ( = ?auto_862199 ?auto_862211 ) ) ( not ( = ?auto_862199 ?auto_862212 ) ) ( not ( = ?auto_862199 ?auto_862213 ) ) ( not ( = ?auto_862199 ?auto_862214 ) ) ( not ( = ?auto_862199 ?auto_862215 ) ) ( not ( = ?auto_862199 ?auto_862216 ) ) ( not ( = ?auto_862200 ?auto_862201 ) ) ( not ( = ?auto_862200 ?auto_862202 ) ) ( not ( = ?auto_862200 ?auto_862203 ) ) ( not ( = ?auto_862200 ?auto_862204 ) ) ( not ( = ?auto_862200 ?auto_862205 ) ) ( not ( = ?auto_862200 ?auto_862206 ) ) ( not ( = ?auto_862200 ?auto_862207 ) ) ( not ( = ?auto_862200 ?auto_862208 ) ) ( not ( = ?auto_862200 ?auto_862209 ) ) ( not ( = ?auto_862200 ?auto_862210 ) ) ( not ( = ?auto_862200 ?auto_862211 ) ) ( not ( = ?auto_862200 ?auto_862212 ) ) ( not ( = ?auto_862200 ?auto_862213 ) ) ( not ( = ?auto_862200 ?auto_862214 ) ) ( not ( = ?auto_862200 ?auto_862215 ) ) ( not ( = ?auto_862200 ?auto_862216 ) ) ( not ( = ?auto_862201 ?auto_862202 ) ) ( not ( = ?auto_862201 ?auto_862203 ) ) ( not ( = ?auto_862201 ?auto_862204 ) ) ( not ( = ?auto_862201 ?auto_862205 ) ) ( not ( = ?auto_862201 ?auto_862206 ) ) ( not ( = ?auto_862201 ?auto_862207 ) ) ( not ( = ?auto_862201 ?auto_862208 ) ) ( not ( = ?auto_862201 ?auto_862209 ) ) ( not ( = ?auto_862201 ?auto_862210 ) ) ( not ( = ?auto_862201 ?auto_862211 ) ) ( not ( = ?auto_862201 ?auto_862212 ) ) ( not ( = ?auto_862201 ?auto_862213 ) ) ( not ( = ?auto_862201 ?auto_862214 ) ) ( not ( = ?auto_862201 ?auto_862215 ) ) ( not ( = ?auto_862201 ?auto_862216 ) ) ( not ( = ?auto_862202 ?auto_862203 ) ) ( not ( = ?auto_862202 ?auto_862204 ) ) ( not ( = ?auto_862202 ?auto_862205 ) ) ( not ( = ?auto_862202 ?auto_862206 ) ) ( not ( = ?auto_862202 ?auto_862207 ) ) ( not ( = ?auto_862202 ?auto_862208 ) ) ( not ( = ?auto_862202 ?auto_862209 ) ) ( not ( = ?auto_862202 ?auto_862210 ) ) ( not ( = ?auto_862202 ?auto_862211 ) ) ( not ( = ?auto_862202 ?auto_862212 ) ) ( not ( = ?auto_862202 ?auto_862213 ) ) ( not ( = ?auto_862202 ?auto_862214 ) ) ( not ( = ?auto_862202 ?auto_862215 ) ) ( not ( = ?auto_862202 ?auto_862216 ) ) ( not ( = ?auto_862203 ?auto_862204 ) ) ( not ( = ?auto_862203 ?auto_862205 ) ) ( not ( = ?auto_862203 ?auto_862206 ) ) ( not ( = ?auto_862203 ?auto_862207 ) ) ( not ( = ?auto_862203 ?auto_862208 ) ) ( not ( = ?auto_862203 ?auto_862209 ) ) ( not ( = ?auto_862203 ?auto_862210 ) ) ( not ( = ?auto_862203 ?auto_862211 ) ) ( not ( = ?auto_862203 ?auto_862212 ) ) ( not ( = ?auto_862203 ?auto_862213 ) ) ( not ( = ?auto_862203 ?auto_862214 ) ) ( not ( = ?auto_862203 ?auto_862215 ) ) ( not ( = ?auto_862203 ?auto_862216 ) ) ( not ( = ?auto_862204 ?auto_862205 ) ) ( not ( = ?auto_862204 ?auto_862206 ) ) ( not ( = ?auto_862204 ?auto_862207 ) ) ( not ( = ?auto_862204 ?auto_862208 ) ) ( not ( = ?auto_862204 ?auto_862209 ) ) ( not ( = ?auto_862204 ?auto_862210 ) ) ( not ( = ?auto_862204 ?auto_862211 ) ) ( not ( = ?auto_862204 ?auto_862212 ) ) ( not ( = ?auto_862204 ?auto_862213 ) ) ( not ( = ?auto_862204 ?auto_862214 ) ) ( not ( = ?auto_862204 ?auto_862215 ) ) ( not ( = ?auto_862204 ?auto_862216 ) ) ( not ( = ?auto_862205 ?auto_862206 ) ) ( not ( = ?auto_862205 ?auto_862207 ) ) ( not ( = ?auto_862205 ?auto_862208 ) ) ( not ( = ?auto_862205 ?auto_862209 ) ) ( not ( = ?auto_862205 ?auto_862210 ) ) ( not ( = ?auto_862205 ?auto_862211 ) ) ( not ( = ?auto_862205 ?auto_862212 ) ) ( not ( = ?auto_862205 ?auto_862213 ) ) ( not ( = ?auto_862205 ?auto_862214 ) ) ( not ( = ?auto_862205 ?auto_862215 ) ) ( not ( = ?auto_862205 ?auto_862216 ) ) ( not ( = ?auto_862206 ?auto_862207 ) ) ( not ( = ?auto_862206 ?auto_862208 ) ) ( not ( = ?auto_862206 ?auto_862209 ) ) ( not ( = ?auto_862206 ?auto_862210 ) ) ( not ( = ?auto_862206 ?auto_862211 ) ) ( not ( = ?auto_862206 ?auto_862212 ) ) ( not ( = ?auto_862206 ?auto_862213 ) ) ( not ( = ?auto_862206 ?auto_862214 ) ) ( not ( = ?auto_862206 ?auto_862215 ) ) ( not ( = ?auto_862206 ?auto_862216 ) ) ( not ( = ?auto_862207 ?auto_862208 ) ) ( not ( = ?auto_862207 ?auto_862209 ) ) ( not ( = ?auto_862207 ?auto_862210 ) ) ( not ( = ?auto_862207 ?auto_862211 ) ) ( not ( = ?auto_862207 ?auto_862212 ) ) ( not ( = ?auto_862207 ?auto_862213 ) ) ( not ( = ?auto_862207 ?auto_862214 ) ) ( not ( = ?auto_862207 ?auto_862215 ) ) ( not ( = ?auto_862207 ?auto_862216 ) ) ( not ( = ?auto_862208 ?auto_862209 ) ) ( not ( = ?auto_862208 ?auto_862210 ) ) ( not ( = ?auto_862208 ?auto_862211 ) ) ( not ( = ?auto_862208 ?auto_862212 ) ) ( not ( = ?auto_862208 ?auto_862213 ) ) ( not ( = ?auto_862208 ?auto_862214 ) ) ( not ( = ?auto_862208 ?auto_862215 ) ) ( not ( = ?auto_862208 ?auto_862216 ) ) ( not ( = ?auto_862209 ?auto_862210 ) ) ( not ( = ?auto_862209 ?auto_862211 ) ) ( not ( = ?auto_862209 ?auto_862212 ) ) ( not ( = ?auto_862209 ?auto_862213 ) ) ( not ( = ?auto_862209 ?auto_862214 ) ) ( not ( = ?auto_862209 ?auto_862215 ) ) ( not ( = ?auto_862209 ?auto_862216 ) ) ( not ( = ?auto_862210 ?auto_862211 ) ) ( not ( = ?auto_862210 ?auto_862212 ) ) ( not ( = ?auto_862210 ?auto_862213 ) ) ( not ( = ?auto_862210 ?auto_862214 ) ) ( not ( = ?auto_862210 ?auto_862215 ) ) ( not ( = ?auto_862210 ?auto_862216 ) ) ( not ( = ?auto_862211 ?auto_862212 ) ) ( not ( = ?auto_862211 ?auto_862213 ) ) ( not ( = ?auto_862211 ?auto_862214 ) ) ( not ( = ?auto_862211 ?auto_862215 ) ) ( not ( = ?auto_862211 ?auto_862216 ) ) ( not ( = ?auto_862212 ?auto_862213 ) ) ( not ( = ?auto_862212 ?auto_862214 ) ) ( not ( = ?auto_862212 ?auto_862215 ) ) ( not ( = ?auto_862212 ?auto_862216 ) ) ( not ( = ?auto_862213 ?auto_862214 ) ) ( not ( = ?auto_862213 ?auto_862215 ) ) ( not ( = ?auto_862213 ?auto_862216 ) ) ( not ( = ?auto_862214 ?auto_862215 ) ) ( not ( = ?auto_862214 ?auto_862216 ) ) ( not ( = ?auto_862215 ?auto_862216 ) ) ( ON ?auto_862215 ?auto_862216 ) ( ON ?auto_862214 ?auto_862215 ) ( ON ?auto_862213 ?auto_862214 ) ( ON ?auto_862212 ?auto_862213 ) ( ON ?auto_862211 ?auto_862212 ) ( ON ?auto_862210 ?auto_862211 ) ( ON ?auto_862209 ?auto_862210 ) ( ON ?auto_862208 ?auto_862209 ) ( CLEAR ?auto_862206 ) ( ON ?auto_862207 ?auto_862208 ) ( CLEAR ?auto_862207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_862199 ?auto_862200 ?auto_862201 ?auto_862202 ?auto_862203 ?auto_862204 ?auto_862205 ?auto_862206 ?auto_862207 )
      ( MAKE-18PILE ?auto_862199 ?auto_862200 ?auto_862201 ?auto_862202 ?auto_862203 ?auto_862204 ?auto_862205 ?auto_862206 ?auto_862207 ?auto_862208 ?auto_862209 ?auto_862210 ?auto_862211 ?auto_862212 ?auto_862213 ?auto_862214 ?auto_862215 ?auto_862216 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862235 - BLOCK
      ?auto_862236 - BLOCK
      ?auto_862237 - BLOCK
      ?auto_862238 - BLOCK
      ?auto_862239 - BLOCK
      ?auto_862240 - BLOCK
      ?auto_862241 - BLOCK
      ?auto_862242 - BLOCK
      ?auto_862243 - BLOCK
      ?auto_862244 - BLOCK
      ?auto_862245 - BLOCK
      ?auto_862246 - BLOCK
      ?auto_862247 - BLOCK
      ?auto_862248 - BLOCK
      ?auto_862249 - BLOCK
      ?auto_862250 - BLOCK
      ?auto_862251 - BLOCK
      ?auto_862252 - BLOCK
    )
    :vars
    (
      ?auto_862253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862252 ?auto_862253 ) ( ON-TABLE ?auto_862235 ) ( ON ?auto_862236 ?auto_862235 ) ( ON ?auto_862237 ?auto_862236 ) ( ON ?auto_862238 ?auto_862237 ) ( ON ?auto_862239 ?auto_862238 ) ( ON ?auto_862240 ?auto_862239 ) ( ON ?auto_862241 ?auto_862240 ) ( not ( = ?auto_862235 ?auto_862236 ) ) ( not ( = ?auto_862235 ?auto_862237 ) ) ( not ( = ?auto_862235 ?auto_862238 ) ) ( not ( = ?auto_862235 ?auto_862239 ) ) ( not ( = ?auto_862235 ?auto_862240 ) ) ( not ( = ?auto_862235 ?auto_862241 ) ) ( not ( = ?auto_862235 ?auto_862242 ) ) ( not ( = ?auto_862235 ?auto_862243 ) ) ( not ( = ?auto_862235 ?auto_862244 ) ) ( not ( = ?auto_862235 ?auto_862245 ) ) ( not ( = ?auto_862235 ?auto_862246 ) ) ( not ( = ?auto_862235 ?auto_862247 ) ) ( not ( = ?auto_862235 ?auto_862248 ) ) ( not ( = ?auto_862235 ?auto_862249 ) ) ( not ( = ?auto_862235 ?auto_862250 ) ) ( not ( = ?auto_862235 ?auto_862251 ) ) ( not ( = ?auto_862235 ?auto_862252 ) ) ( not ( = ?auto_862235 ?auto_862253 ) ) ( not ( = ?auto_862236 ?auto_862237 ) ) ( not ( = ?auto_862236 ?auto_862238 ) ) ( not ( = ?auto_862236 ?auto_862239 ) ) ( not ( = ?auto_862236 ?auto_862240 ) ) ( not ( = ?auto_862236 ?auto_862241 ) ) ( not ( = ?auto_862236 ?auto_862242 ) ) ( not ( = ?auto_862236 ?auto_862243 ) ) ( not ( = ?auto_862236 ?auto_862244 ) ) ( not ( = ?auto_862236 ?auto_862245 ) ) ( not ( = ?auto_862236 ?auto_862246 ) ) ( not ( = ?auto_862236 ?auto_862247 ) ) ( not ( = ?auto_862236 ?auto_862248 ) ) ( not ( = ?auto_862236 ?auto_862249 ) ) ( not ( = ?auto_862236 ?auto_862250 ) ) ( not ( = ?auto_862236 ?auto_862251 ) ) ( not ( = ?auto_862236 ?auto_862252 ) ) ( not ( = ?auto_862236 ?auto_862253 ) ) ( not ( = ?auto_862237 ?auto_862238 ) ) ( not ( = ?auto_862237 ?auto_862239 ) ) ( not ( = ?auto_862237 ?auto_862240 ) ) ( not ( = ?auto_862237 ?auto_862241 ) ) ( not ( = ?auto_862237 ?auto_862242 ) ) ( not ( = ?auto_862237 ?auto_862243 ) ) ( not ( = ?auto_862237 ?auto_862244 ) ) ( not ( = ?auto_862237 ?auto_862245 ) ) ( not ( = ?auto_862237 ?auto_862246 ) ) ( not ( = ?auto_862237 ?auto_862247 ) ) ( not ( = ?auto_862237 ?auto_862248 ) ) ( not ( = ?auto_862237 ?auto_862249 ) ) ( not ( = ?auto_862237 ?auto_862250 ) ) ( not ( = ?auto_862237 ?auto_862251 ) ) ( not ( = ?auto_862237 ?auto_862252 ) ) ( not ( = ?auto_862237 ?auto_862253 ) ) ( not ( = ?auto_862238 ?auto_862239 ) ) ( not ( = ?auto_862238 ?auto_862240 ) ) ( not ( = ?auto_862238 ?auto_862241 ) ) ( not ( = ?auto_862238 ?auto_862242 ) ) ( not ( = ?auto_862238 ?auto_862243 ) ) ( not ( = ?auto_862238 ?auto_862244 ) ) ( not ( = ?auto_862238 ?auto_862245 ) ) ( not ( = ?auto_862238 ?auto_862246 ) ) ( not ( = ?auto_862238 ?auto_862247 ) ) ( not ( = ?auto_862238 ?auto_862248 ) ) ( not ( = ?auto_862238 ?auto_862249 ) ) ( not ( = ?auto_862238 ?auto_862250 ) ) ( not ( = ?auto_862238 ?auto_862251 ) ) ( not ( = ?auto_862238 ?auto_862252 ) ) ( not ( = ?auto_862238 ?auto_862253 ) ) ( not ( = ?auto_862239 ?auto_862240 ) ) ( not ( = ?auto_862239 ?auto_862241 ) ) ( not ( = ?auto_862239 ?auto_862242 ) ) ( not ( = ?auto_862239 ?auto_862243 ) ) ( not ( = ?auto_862239 ?auto_862244 ) ) ( not ( = ?auto_862239 ?auto_862245 ) ) ( not ( = ?auto_862239 ?auto_862246 ) ) ( not ( = ?auto_862239 ?auto_862247 ) ) ( not ( = ?auto_862239 ?auto_862248 ) ) ( not ( = ?auto_862239 ?auto_862249 ) ) ( not ( = ?auto_862239 ?auto_862250 ) ) ( not ( = ?auto_862239 ?auto_862251 ) ) ( not ( = ?auto_862239 ?auto_862252 ) ) ( not ( = ?auto_862239 ?auto_862253 ) ) ( not ( = ?auto_862240 ?auto_862241 ) ) ( not ( = ?auto_862240 ?auto_862242 ) ) ( not ( = ?auto_862240 ?auto_862243 ) ) ( not ( = ?auto_862240 ?auto_862244 ) ) ( not ( = ?auto_862240 ?auto_862245 ) ) ( not ( = ?auto_862240 ?auto_862246 ) ) ( not ( = ?auto_862240 ?auto_862247 ) ) ( not ( = ?auto_862240 ?auto_862248 ) ) ( not ( = ?auto_862240 ?auto_862249 ) ) ( not ( = ?auto_862240 ?auto_862250 ) ) ( not ( = ?auto_862240 ?auto_862251 ) ) ( not ( = ?auto_862240 ?auto_862252 ) ) ( not ( = ?auto_862240 ?auto_862253 ) ) ( not ( = ?auto_862241 ?auto_862242 ) ) ( not ( = ?auto_862241 ?auto_862243 ) ) ( not ( = ?auto_862241 ?auto_862244 ) ) ( not ( = ?auto_862241 ?auto_862245 ) ) ( not ( = ?auto_862241 ?auto_862246 ) ) ( not ( = ?auto_862241 ?auto_862247 ) ) ( not ( = ?auto_862241 ?auto_862248 ) ) ( not ( = ?auto_862241 ?auto_862249 ) ) ( not ( = ?auto_862241 ?auto_862250 ) ) ( not ( = ?auto_862241 ?auto_862251 ) ) ( not ( = ?auto_862241 ?auto_862252 ) ) ( not ( = ?auto_862241 ?auto_862253 ) ) ( not ( = ?auto_862242 ?auto_862243 ) ) ( not ( = ?auto_862242 ?auto_862244 ) ) ( not ( = ?auto_862242 ?auto_862245 ) ) ( not ( = ?auto_862242 ?auto_862246 ) ) ( not ( = ?auto_862242 ?auto_862247 ) ) ( not ( = ?auto_862242 ?auto_862248 ) ) ( not ( = ?auto_862242 ?auto_862249 ) ) ( not ( = ?auto_862242 ?auto_862250 ) ) ( not ( = ?auto_862242 ?auto_862251 ) ) ( not ( = ?auto_862242 ?auto_862252 ) ) ( not ( = ?auto_862242 ?auto_862253 ) ) ( not ( = ?auto_862243 ?auto_862244 ) ) ( not ( = ?auto_862243 ?auto_862245 ) ) ( not ( = ?auto_862243 ?auto_862246 ) ) ( not ( = ?auto_862243 ?auto_862247 ) ) ( not ( = ?auto_862243 ?auto_862248 ) ) ( not ( = ?auto_862243 ?auto_862249 ) ) ( not ( = ?auto_862243 ?auto_862250 ) ) ( not ( = ?auto_862243 ?auto_862251 ) ) ( not ( = ?auto_862243 ?auto_862252 ) ) ( not ( = ?auto_862243 ?auto_862253 ) ) ( not ( = ?auto_862244 ?auto_862245 ) ) ( not ( = ?auto_862244 ?auto_862246 ) ) ( not ( = ?auto_862244 ?auto_862247 ) ) ( not ( = ?auto_862244 ?auto_862248 ) ) ( not ( = ?auto_862244 ?auto_862249 ) ) ( not ( = ?auto_862244 ?auto_862250 ) ) ( not ( = ?auto_862244 ?auto_862251 ) ) ( not ( = ?auto_862244 ?auto_862252 ) ) ( not ( = ?auto_862244 ?auto_862253 ) ) ( not ( = ?auto_862245 ?auto_862246 ) ) ( not ( = ?auto_862245 ?auto_862247 ) ) ( not ( = ?auto_862245 ?auto_862248 ) ) ( not ( = ?auto_862245 ?auto_862249 ) ) ( not ( = ?auto_862245 ?auto_862250 ) ) ( not ( = ?auto_862245 ?auto_862251 ) ) ( not ( = ?auto_862245 ?auto_862252 ) ) ( not ( = ?auto_862245 ?auto_862253 ) ) ( not ( = ?auto_862246 ?auto_862247 ) ) ( not ( = ?auto_862246 ?auto_862248 ) ) ( not ( = ?auto_862246 ?auto_862249 ) ) ( not ( = ?auto_862246 ?auto_862250 ) ) ( not ( = ?auto_862246 ?auto_862251 ) ) ( not ( = ?auto_862246 ?auto_862252 ) ) ( not ( = ?auto_862246 ?auto_862253 ) ) ( not ( = ?auto_862247 ?auto_862248 ) ) ( not ( = ?auto_862247 ?auto_862249 ) ) ( not ( = ?auto_862247 ?auto_862250 ) ) ( not ( = ?auto_862247 ?auto_862251 ) ) ( not ( = ?auto_862247 ?auto_862252 ) ) ( not ( = ?auto_862247 ?auto_862253 ) ) ( not ( = ?auto_862248 ?auto_862249 ) ) ( not ( = ?auto_862248 ?auto_862250 ) ) ( not ( = ?auto_862248 ?auto_862251 ) ) ( not ( = ?auto_862248 ?auto_862252 ) ) ( not ( = ?auto_862248 ?auto_862253 ) ) ( not ( = ?auto_862249 ?auto_862250 ) ) ( not ( = ?auto_862249 ?auto_862251 ) ) ( not ( = ?auto_862249 ?auto_862252 ) ) ( not ( = ?auto_862249 ?auto_862253 ) ) ( not ( = ?auto_862250 ?auto_862251 ) ) ( not ( = ?auto_862250 ?auto_862252 ) ) ( not ( = ?auto_862250 ?auto_862253 ) ) ( not ( = ?auto_862251 ?auto_862252 ) ) ( not ( = ?auto_862251 ?auto_862253 ) ) ( not ( = ?auto_862252 ?auto_862253 ) ) ( ON ?auto_862251 ?auto_862252 ) ( ON ?auto_862250 ?auto_862251 ) ( ON ?auto_862249 ?auto_862250 ) ( ON ?auto_862248 ?auto_862249 ) ( ON ?auto_862247 ?auto_862248 ) ( ON ?auto_862246 ?auto_862247 ) ( ON ?auto_862245 ?auto_862246 ) ( ON ?auto_862244 ?auto_862245 ) ( ON ?auto_862243 ?auto_862244 ) ( CLEAR ?auto_862241 ) ( ON ?auto_862242 ?auto_862243 ) ( CLEAR ?auto_862242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_862235 ?auto_862236 ?auto_862237 ?auto_862238 ?auto_862239 ?auto_862240 ?auto_862241 ?auto_862242 )
      ( MAKE-18PILE ?auto_862235 ?auto_862236 ?auto_862237 ?auto_862238 ?auto_862239 ?auto_862240 ?auto_862241 ?auto_862242 ?auto_862243 ?auto_862244 ?auto_862245 ?auto_862246 ?auto_862247 ?auto_862248 ?auto_862249 ?auto_862250 ?auto_862251 ?auto_862252 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862272 - BLOCK
      ?auto_862273 - BLOCK
      ?auto_862274 - BLOCK
      ?auto_862275 - BLOCK
      ?auto_862276 - BLOCK
      ?auto_862277 - BLOCK
      ?auto_862278 - BLOCK
      ?auto_862279 - BLOCK
      ?auto_862280 - BLOCK
      ?auto_862281 - BLOCK
      ?auto_862282 - BLOCK
      ?auto_862283 - BLOCK
      ?auto_862284 - BLOCK
      ?auto_862285 - BLOCK
      ?auto_862286 - BLOCK
      ?auto_862287 - BLOCK
      ?auto_862288 - BLOCK
      ?auto_862289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_862289 ) ( ON-TABLE ?auto_862272 ) ( ON ?auto_862273 ?auto_862272 ) ( ON ?auto_862274 ?auto_862273 ) ( ON ?auto_862275 ?auto_862274 ) ( ON ?auto_862276 ?auto_862275 ) ( ON ?auto_862277 ?auto_862276 ) ( ON ?auto_862278 ?auto_862277 ) ( not ( = ?auto_862272 ?auto_862273 ) ) ( not ( = ?auto_862272 ?auto_862274 ) ) ( not ( = ?auto_862272 ?auto_862275 ) ) ( not ( = ?auto_862272 ?auto_862276 ) ) ( not ( = ?auto_862272 ?auto_862277 ) ) ( not ( = ?auto_862272 ?auto_862278 ) ) ( not ( = ?auto_862272 ?auto_862279 ) ) ( not ( = ?auto_862272 ?auto_862280 ) ) ( not ( = ?auto_862272 ?auto_862281 ) ) ( not ( = ?auto_862272 ?auto_862282 ) ) ( not ( = ?auto_862272 ?auto_862283 ) ) ( not ( = ?auto_862272 ?auto_862284 ) ) ( not ( = ?auto_862272 ?auto_862285 ) ) ( not ( = ?auto_862272 ?auto_862286 ) ) ( not ( = ?auto_862272 ?auto_862287 ) ) ( not ( = ?auto_862272 ?auto_862288 ) ) ( not ( = ?auto_862272 ?auto_862289 ) ) ( not ( = ?auto_862273 ?auto_862274 ) ) ( not ( = ?auto_862273 ?auto_862275 ) ) ( not ( = ?auto_862273 ?auto_862276 ) ) ( not ( = ?auto_862273 ?auto_862277 ) ) ( not ( = ?auto_862273 ?auto_862278 ) ) ( not ( = ?auto_862273 ?auto_862279 ) ) ( not ( = ?auto_862273 ?auto_862280 ) ) ( not ( = ?auto_862273 ?auto_862281 ) ) ( not ( = ?auto_862273 ?auto_862282 ) ) ( not ( = ?auto_862273 ?auto_862283 ) ) ( not ( = ?auto_862273 ?auto_862284 ) ) ( not ( = ?auto_862273 ?auto_862285 ) ) ( not ( = ?auto_862273 ?auto_862286 ) ) ( not ( = ?auto_862273 ?auto_862287 ) ) ( not ( = ?auto_862273 ?auto_862288 ) ) ( not ( = ?auto_862273 ?auto_862289 ) ) ( not ( = ?auto_862274 ?auto_862275 ) ) ( not ( = ?auto_862274 ?auto_862276 ) ) ( not ( = ?auto_862274 ?auto_862277 ) ) ( not ( = ?auto_862274 ?auto_862278 ) ) ( not ( = ?auto_862274 ?auto_862279 ) ) ( not ( = ?auto_862274 ?auto_862280 ) ) ( not ( = ?auto_862274 ?auto_862281 ) ) ( not ( = ?auto_862274 ?auto_862282 ) ) ( not ( = ?auto_862274 ?auto_862283 ) ) ( not ( = ?auto_862274 ?auto_862284 ) ) ( not ( = ?auto_862274 ?auto_862285 ) ) ( not ( = ?auto_862274 ?auto_862286 ) ) ( not ( = ?auto_862274 ?auto_862287 ) ) ( not ( = ?auto_862274 ?auto_862288 ) ) ( not ( = ?auto_862274 ?auto_862289 ) ) ( not ( = ?auto_862275 ?auto_862276 ) ) ( not ( = ?auto_862275 ?auto_862277 ) ) ( not ( = ?auto_862275 ?auto_862278 ) ) ( not ( = ?auto_862275 ?auto_862279 ) ) ( not ( = ?auto_862275 ?auto_862280 ) ) ( not ( = ?auto_862275 ?auto_862281 ) ) ( not ( = ?auto_862275 ?auto_862282 ) ) ( not ( = ?auto_862275 ?auto_862283 ) ) ( not ( = ?auto_862275 ?auto_862284 ) ) ( not ( = ?auto_862275 ?auto_862285 ) ) ( not ( = ?auto_862275 ?auto_862286 ) ) ( not ( = ?auto_862275 ?auto_862287 ) ) ( not ( = ?auto_862275 ?auto_862288 ) ) ( not ( = ?auto_862275 ?auto_862289 ) ) ( not ( = ?auto_862276 ?auto_862277 ) ) ( not ( = ?auto_862276 ?auto_862278 ) ) ( not ( = ?auto_862276 ?auto_862279 ) ) ( not ( = ?auto_862276 ?auto_862280 ) ) ( not ( = ?auto_862276 ?auto_862281 ) ) ( not ( = ?auto_862276 ?auto_862282 ) ) ( not ( = ?auto_862276 ?auto_862283 ) ) ( not ( = ?auto_862276 ?auto_862284 ) ) ( not ( = ?auto_862276 ?auto_862285 ) ) ( not ( = ?auto_862276 ?auto_862286 ) ) ( not ( = ?auto_862276 ?auto_862287 ) ) ( not ( = ?auto_862276 ?auto_862288 ) ) ( not ( = ?auto_862276 ?auto_862289 ) ) ( not ( = ?auto_862277 ?auto_862278 ) ) ( not ( = ?auto_862277 ?auto_862279 ) ) ( not ( = ?auto_862277 ?auto_862280 ) ) ( not ( = ?auto_862277 ?auto_862281 ) ) ( not ( = ?auto_862277 ?auto_862282 ) ) ( not ( = ?auto_862277 ?auto_862283 ) ) ( not ( = ?auto_862277 ?auto_862284 ) ) ( not ( = ?auto_862277 ?auto_862285 ) ) ( not ( = ?auto_862277 ?auto_862286 ) ) ( not ( = ?auto_862277 ?auto_862287 ) ) ( not ( = ?auto_862277 ?auto_862288 ) ) ( not ( = ?auto_862277 ?auto_862289 ) ) ( not ( = ?auto_862278 ?auto_862279 ) ) ( not ( = ?auto_862278 ?auto_862280 ) ) ( not ( = ?auto_862278 ?auto_862281 ) ) ( not ( = ?auto_862278 ?auto_862282 ) ) ( not ( = ?auto_862278 ?auto_862283 ) ) ( not ( = ?auto_862278 ?auto_862284 ) ) ( not ( = ?auto_862278 ?auto_862285 ) ) ( not ( = ?auto_862278 ?auto_862286 ) ) ( not ( = ?auto_862278 ?auto_862287 ) ) ( not ( = ?auto_862278 ?auto_862288 ) ) ( not ( = ?auto_862278 ?auto_862289 ) ) ( not ( = ?auto_862279 ?auto_862280 ) ) ( not ( = ?auto_862279 ?auto_862281 ) ) ( not ( = ?auto_862279 ?auto_862282 ) ) ( not ( = ?auto_862279 ?auto_862283 ) ) ( not ( = ?auto_862279 ?auto_862284 ) ) ( not ( = ?auto_862279 ?auto_862285 ) ) ( not ( = ?auto_862279 ?auto_862286 ) ) ( not ( = ?auto_862279 ?auto_862287 ) ) ( not ( = ?auto_862279 ?auto_862288 ) ) ( not ( = ?auto_862279 ?auto_862289 ) ) ( not ( = ?auto_862280 ?auto_862281 ) ) ( not ( = ?auto_862280 ?auto_862282 ) ) ( not ( = ?auto_862280 ?auto_862283 ) ) ( not ( = ?auto_862280 ?auto_862284 ) ) ( not ( = ?auto_862280 ?auto_862285 ) ) ( not ( = ?auto_862280 ?auto_862286 ) ) ( not ( = ?auto_862280 ?auto_862287 ) ) ( not ( = ?auto_862280 ?auto_862288 ) ) ( not ( = ?auto_862280 ?auto_862289 ) ) ( not ( = ?auto_862281 ?auto_862282 ) ) ( not ( = ?auto_862281 ?auto_862283 ) ) ( not ( = ?auto_862281 ?auto_862284 ) ) ( not ( = ?auto_862281 ?auto_862285 ) ) ( not ( = ?auto_862281 ?auto_862286 ) ) ( not ( = ?auto_862281 ?auto_862287 ) ) ( not ( = ?auto_862281 ?auto_862288 ) ) ( not ( = ?auto_862281 ?auto_862289 ) ) ( not ( = ?auto_862282 ?auto_862283 ) ) ( not ( = ?auto_862282 ?auto_862284 ) ) ( not ( = ?auto_862282 ?auto_862285 ) ) ( not ( = ?auto_862282 ?auto_862286 ) ) ( not ( = ?auto_862282 ?auto_862287 ) ) ( not ( = ?auto_862282 ?auto_862288 ) ) ( not ( = ?auto_862282 ?auto_862289 ) ) ( not ( = ?auto_862283 ?auto_862284 ) ) ( not ( = ?auto_862283 ?auto_862285 ) ) ( not ( = ?auto_862283 ?auto_862286 ) ) ( not ( = ?auto_862283 ?auto_862287 ) ) ( not ( = ?auto_862283 ?auto_862288 ) ) ( not ( = ?auto_862283 ?auto_862289 ) ) ( not ( = ?auto_862284 ?auto_862285 ) ) ( not ( = ?auto_862284 ?auto_862286 ) ) ( not ( = ?auto_862284 ?auto_862287 ) ) ( not ( = ?auto_862284 ?auto_862288 ) ) ( not ( = ?auto_862284 ?auto_862289 ) ) ( not ( = ?auto_862285 ?auto_862286 ) ) ( not ( = ?auto_862285 ?auto_862287 ) ) ( not ( = ?auto_862285 ?auto_862288 ) ) ( not ( = ?auto_862285 ?auto_862289 ) ) ( not ( = ?auto_862286 ?auto_862287 ) ) ( not ( = ?auto_862286 ?auto_862288 ) ) ( not ( = ?auto_862286 ?auto_862289 ) ) ( not ( = ?auto_862287 ?auto_862288 ) ) ( not ( = ?auto_862287 ?auto_862289 ) ) ( not ( = ?auto_862288 ?auto_862289 ) ) ( ON ?auto_862288 ?auto_862289 ) ( ON ?auto_862287 ?auto_862288 ) ( ON ?auto_862286 ?auto_862287 ) ( ON ?auto_862285 ?auto_862286 ) ( ON ?auto_862284 ?auto_862285 ) ( ON ?auto_862283 ?auto_862284 ) ( ON ?auto_862282 ?auto_862283 ) ( ON ?auto_862281 ?auto_862282 ) ( ON ?auto_862280 ?auto_862281 ) ( CLEAR ?auto_862278 ) ( ON ?auto_862279 ?auto_862280 ) ( CLEAR ?auto_862279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_862272 ?auto_862273 ?auto_862274 ?auto_862275 ?auto_862276 ?auto_862277 ?auto_862278 ?auto_862279 )
      ( MAKE-18PILE ?auto_862272 ?auto_862273 ?auto_862274 ?auto_862275 ?auto_862276 ?auto_862277 ?auto_862278 ?auto_862279 ?auto_862280 ?auto_862281 ?auto_862282 ?auto_862283 ?auto_862284 ?auto_862285 ?auto_862286 ?auto_862287 ?auto_862288 ?auto_862289 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862308 - BLOCK
      ?auto_862309 - BLOCK
      ?auto_862310 - BLOCK
      ?auto_862311 - BLOCK
      ?auto_862312 - BLOCK
      ?auto_862313 - BLOCK
      ?auto_862314 - BLOCK
      ?auto_862315 - BLOCK
      ?auto_862316 - BLOCK
      ?auto_862317 - BLOCK
      ?auto_862318 - BLOCK
      ?auto_862319 - BLOCK
      ?auto_862320 - BLOCK
      ?auto_862321 - BLOCK
      ?auto_862322 - BLOCK
      ?auto_862323 - BLOCK
      ?auto_862324 - BLOCK
      ?auto_862325 - BLOCK
    )
    :vars
    (
      ?auto_862326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862325 ?auto_862326 ) ( ON-TABLE ?auto_862308 ) ( ON ?auto_862309 ?auto_862308 ) ( ON ?auto_862310 ?auto_862309 ) ( ON ?auto_862311 ?auto_862310 ) ( ON ?auto_862312 ?auto_862311 ) ( ON ?auto_862313 ?auto_862312 ) ( not ( = ?auto_862308 ?auto_862309 ) ) ( not ( = ?auto_862308 ?auto_862310 ) ) ( not ( = ?auto_862308 ?auto_862311 ) ) ( not ( = ?auto_862308 ?auto_862312 ) ) ( not ( = ?auto_862308 ?auto_862313 ) ) ( not ( = ?auto_862308 ?auto_862314 ) ) ( not ( = ?auto_862308 ?auto_862315 ) ) ( not ( = ?auto_862308 ?auto_862316 ) ) ( not ( = ?auto_862308 ?auto_862317 ) ) ( not ( = ?auto_862308 ?auto_862318 ) ) ( not ( = ?auto_862308 ?auto_862319 ) ) ( not ( = ?auto_862308 ?auto_862320 ) ) ( not ( = ?auto_862308 ?auto_862321 ) ) ( not ( = ?auto_862308 ?auto_862322 ) ) ( not ( = ?auto_862308 ?auto_862323 ) ) ( not ( = ?auto_862308 ?auto_862324 ) ) ( not ( = ?auto_862308 ?auto_862325 ) ) ( not ( = ?auto_862308 ?auto_862326 ) ) ( not ( = ?auto_862309 ?auto_862310 ) ) ( not ( = ?auto_862309 ?auto_862311 ) ) ( not ( = ?auto_862309 ?auto_862312 ) ) ( not ( = ?auto_862309 ?auto_862313 ) ) ( not ( = ?auto_862309 ?auto_862314 ) ) ( not ( = ?auto_862309 ?auto_862315 ) ) ( not ( = ?auto_862309 ?auto_862316 ) ) ( not ( = ?auto_862309 ?auto_862317 ) ) ( not ( = ?auto_862309 ?auto_862318 ) ) ( not ( = ?auto_862309 ?auto_862319 ) ) ( not ( = ?auto_862309 ?auto_862320 ) ) ( not ( = ?auto_862309 ?auto_862321 ) ) ( not ( = ?auto_862309 ?auto_862322 ) ) ( not ( = ?auto_862309 ?auto_862323 ) ) ( not ( = ?auto_862309 ?auto_862324 ) ) ( not ( = ?auto_862309 ?auto_862325 ) ) ( not ( = ?auto_862309 ?auto_862326 ) ) ( not ( = ?auto_862310 ?auto_862311 ) ) ( not ( = ?auto_862310 ?auto_862312 ) ) ( not ( = ?auto_862310 ?auto_862313 ) ) ( not ( = ?auto_862310 ?auto_862314 ) ) ( not ( = ?auto_862310 ?auto_862315 ) ) ( not ( = ?auto_862310 ?auto_862316 ) ) ( not ( = ?auto_862310 ?auto_862317 ) ) ( not ( = ?auto_862310 ?auto_862318 ) ) ( not ( = ?auto_862310 ?auto_862319 ) ) ( not ( = ?auto_862310 ?auto_862320 ) ) ( not ( = ?auto_862310 ?auto_862321 ) ) ( not ( = ?auto_862310 ?auto_862322 ) ) ( not ( = ?auto_862310 ?auto_862323 ) ) ( not ( = ?auto_862310 ?auto_862324 ) ) ( not ( = ?auto_862310 ?auto_862325 ) ) ( not ( = ?auto_862310 ?auto_862326 ) ) ( not ( = ?auto_862311 ?auto_862312 ) ) ( not ( = ?auto_862311 ?auto_862313 ) ) ( not ( = ?auto_862311 ?auto_862314 ) ) ( not ( = ?auto_862311 ?auto_862315 ) ) ( not ( = ?auto_862311 ?auto_862316 ) ) ( not ( = ?auto_862311 ?auto_862317 ) ) ( not ( = ?auto_862311 ?auto_862318 ) ) ( not ( = ?auto_862311 ?auto_862319 ) ) ( not ( = ?auto_862311 ?auto_862320 ) ) ( not ( = ?auto_862311 ?auto_862321 ) ) ( not ( = ?auto_862311 ?auto_862322 ) ) ( not ( = ?auto_862311 ?auto_862323 ) ) ( not ( = ?auto_862311 ?auto_862324 ) ) ( not ( = ?auto_862311 ?auto_862325 ) ) ( not ( = ?auto_862311 ?auto_862326 ) ) ( not ( = ?auto_862312 ?auto_862313 ) ) ( not ( = ?auto_862312 ?auto_862314 ) ) ( not ( = ?auto_862312 ?auto_862315 ) ) ( not ( = ?auto_862312 ?auto_862316 ) ) ( not ( = ?auto_862312 ?auto_862317 ) ) ( not ( = ?auto_862312 ?auto_862318 ) ) ( not ( = ?auto_862312 ?auto_862319 ) ) ( not ( = ?auto_862312 ?auto_862320 ) ) ( not ( = ?auto_862312 ?auto_862321 ) ) ( not ( = ?auto_862312 ?auto_862322 ) ) ( not ( = ?auto_862312 ?auto_862323 ) ) ( not ( = ?auto_862312 ?auto_862324 ) ) ( not ( = ?auto_862312 ?auto_862325 ) ) ( not ( = ?auto_862312 ?auto_862326 ) ) ( not ( = ?auto_862313 ?auto_862314 ) ) ( not ( = ?auto_862313 ?auto_862315 ) ) ( not ( = ?auto_862313 ?auto_862316 ) ) ( not ( = ?auto_862313 ?auto_862317 ) ) ( not ( = ?auto_862313 ?auto_862318 ) ) ( not ( = ?auto_862313 ?auto_862319 ) ) ( not ( = ?auto_862313 ?auto_862320 ) ) ( not ( = ?auto_862313 ?auto_862321 ) ) ( not ( = ?auto_862313 ?auto_862322 ) ) ( not ( = ?auto_862313 ?auto_862323 ) ) ( not ( = ?auto_862313 ?auto_862324 ) ) ( not ( = ?auto_862313 ?auto_862325 ) ) ( not ( = ?auto_862313 ?auto_862326 ) ) ( not ( = ?auto_862314 ?auto_862315 ) ) ( not ( = ?auto_862314 ?auto_862316 ) ) ( not ( = ?auto_862314 ?auto_862317 ) ) ( not ( = ?auto_862314 ?auto_862318 ) ) ( not ( = ?auto_862314 ?auto_862319 ) ) ( not ( = ?auto_862314 ?auto_862320 ) ) ( not ( = ?auto_862314 ?auto_862321 ) ) ( not ( = ?auto_862314 ?auto_862322 ) ) ( not ( = ?auto_862314 ?auto_862323 ) ) ( not ( = ?auto_862314 ?auto_862324 ) ) ( not ( = ?auto_862314 ?auto_862325 ) ) ( not ( = ?auto_862314 ?auto_862326 ) ) ( not ( = ?auto_862315 ?auto_862316 ) ) ( not ( = ?auto_862315 ?auto_862317 ) ) ( not ( = ?auto_862315 ?auto_862318 ) ) ( not ( = ?auto_862315 ?auto_862319 ) ) ( not ( = ?auto_862315 ?auto_862320 ) ) ( not ( = ?auto_862315 ?auto_862321 ) ) ( not ( = ?auto_862315 ?auto_862322 ) ) ( not ( = ?auto_862315 ?auto_862323 ) ) ( not ( = ?auto_862315 ?auto_862324 ) ) ( not ( = ?auto_862315 ?auto_862325 ) ) ( not ( = ?auto_862315 ?auto_862326 ) ) ( not ( = ?auto_862316 ?auto_862317 ) ) ( not ( = ?auto_862316 ?auto_862318 ) ) ( not ( = ?auto_862316 ?auto_862319 ) ) ( not ( = ?auto_862316 ?auto_862320 ) ) ( not ( = ?auto_862316 ?auto_862321 ) ) ( not ( = ?auto_862316 ?auto_862322 ) ) ( not ( = ?auto_862316 ?auto_862323 ) ) ( not ( = ?auto_862316 ?auto_862324 ) ) ( not ( = ?auto_862316 ?auto_862325 ) ) ( not ( = ?auto_862316 ?auto_862326 ) ) ( not ( = ?auto_862317 ?auto_862318 ) ) ( not ( = ?auto_862317 ?auto_862319 ) ) ( not ( = ?auto_862317 ?auto_862320 ) ) ( not ( = ?auto_862317 ?auto_862321 ) ) ( not ( = ?auto_862317 ?auto_862322 ) ) ( not ( = ?auto_862317 ?auto_862323 ) ) ( not ( = ?auto_862317 ?auto_862324 ) ) ( not ( = ?auto_862317 ?auto_862325 ) ) ( not ( = ?auto_862317 ?auto_862326 ) ) ( not ( = ?auto_862318 ?auto_862319 ) ) ( not ( = ?auto_862318 ?auto_862320 ) ) ( not ( = ?auto_862318 ?auto_862321 ) ) ( not ( = ?auto_862318 ?auto_862322 ) ) ( not ( = ?auto_862318 ?auto_862323 ) ) ( not ( = ?auto_862318 ?auto_862324 ) ) ( not ( = ?auto_862318 ?auto_862325 ) ) ( not ( = ?auto_862318 ?auto_862326 ) ) ( not ( = ?auto_862319 ?auto_862320 ) ) ( not ( = ?auto_862319 ?auto_862321 ) ) ( not ( = ?auto_862319 ?auto_862322 ) ) ( not ( = ?auto_862319 ?auto_862323 ) ) ( not ( = ?auto_862319 ?auto_862324 ) ) ( not ( = ?auto_862319 ?auto_862325 ) ) ( not ( = ?auto_862319 ?auto_862326 ) ) ( not ( = ?auto_862320 ?auto_862321 ) ) ( not ( = ?auto_862320 ?auto_862322 ) ) ( not ( = ?auto_862320 ?auto_862323 ) ) ( not ( = ?auto_862320 ?auto_862324 ) ) ( not ( = ?auto_862320 ?auto_862325 ) ) ( not ( = ?auto_862320 ?auto_862326 ) ) ( not ( = ?auto_862321 ?auto_862322 ) ) ( not ( = ?auto_862321 ?auto_862323 ) ) ( not ( = ?auto_862321 ?auto_862324 ) ) ( not ( = ?auto_862321 ?auto_862325 ) ) ( not ( = ?auto_862321 ?auto_862326 ) ) ( not ( = ?auto_862322 ?auto_862323 ) ) ( not ( = ?auto_862322 ?auto_862324 ) ) ( not ( = ?auto_862322 ?auto_862325 ) ) ( not ( = ?auto_862322 ?auto_862326 ) ) ( not ( = ?auto_862323 ?auto_862324 ) ) ( not ( = ?auto_862323 ?auto_862325 ) ) ( not ( = ?auto_862323 ?auto_862326 ) ) ( not ( = ?auto_862324 ?auto_862325 ) ) ( not ( = ?auto_862324 ?auto_862326 ) ) ( not ( = ?auto_862325 ?auto_862326 ) ) ( ON ?auto_862324 ?auto_862325 ) ( ON ?auto_862323 ?auto_862324 ) ( ON ?auto_862322 ?auto_862323 ) ( ON ?auto_862321 ?auto_862322 ) ( ON ?auto_862320 ?auto_862321 ) ( ON ?auto_862319 ?auto_862320 ) ( ON ?auto_862318 ?auto_862319 ) ( ON ?auto_862317 ?auto_862318 ) ( ON ?auto_862316 ?auto_862317 ) ( ON ?auto_862315 ?auto_862316 ) ( CLEAR ?auto_862313 ) ( ON ?auto_862314 ?auto_862315 ) ( CLEAR ?auto_862314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_862308 ?auto_862309 ?auto_862310 ?auto_862311 ?auto_862312 ?auto_862313 ?auto_862314 )
      ( MAKE-18PILE ?auto_862308 ?auto_862309 ?auto_862310 ?auto_862311 ?auto_862312 ?auto_862313 ?auto_862314 ?auto_862315 ?auto_862316 ?auto_862317 ?auto_862318 ?auto_862319 ?auto_862320 ?auto_862321 ?auto_862322 ?auto_862323 ?auto_862324 ?auto_862325 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862345 - BLOCK
      ?auto_862346 - BLOCK
      ?auto_862347 - BLOCK
      ?auto_862348 - BLOCK
      ?auto_862349 - BLOCK
      ?auto_862350 - BLOCK
      ?auto_862351 - BLOCK
      ?auto_862352 - BLOCK
      ?auto_862353 - BLOCK
      ?auto_862354 - BLOCK
      ?auto_862355 - BLOCK
      ?auto_862356 - BLOCK
      ?auto_862357 - BLOCK
      ?auto_862358 - BLOCK
      ?auto_862359 - BLOCK
      ?auto_862360 - BLOCK
      ?auto_862361 - BLOCK
      ?auto_862362 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_862362 ) ( ON-TABLE ?auto_862345 ) ( ON ?auto_862346 ?auto_862345 ) ( ON ?auto_862347 ?auto_862346 ) ( ON ?auto_862348 ?auto_862347 ) ( ON ?auto_862349 ?auto_862348 ) ( ON ?auto_862350 ?auto_862349 ) ( not ( = ?auto_862345 ?auto_862346 ) ) ( not ( = ?auto_862345 ?auto_862347 ) ) ( not ( = ?auto_862345 ?auto_862348 ) ) ( not ( = ?auto_862345 ?auto_862349 ) ) ( not ( = ?auto_862345 ?auto_862350 ) ) ( not ( = ?auto_862345 ?auto_862351 ) ) ( not ( = ?auto_862345 ?auto_862352 ) ) ( not ( = ?auto_862345 ?auto_862353 ) ) ( not ( = ?auto_862345 ?auto_862354 ) ) ( not ( = ?auto_862345 ?auto_862355 ) ) ( not ( = ?auto_862345 ?auto_862356 ) ) ( not ( = ?auto_862345 ?auto_862357 ) ) ( not ( = ?auto_862345 ?auto_862358 ) ) ( not ( = ?auto_862345 ?auto_862359 ) ) ( not ( = ?auto_862345 ?auto_862360 ) ) ( not ( = ?auto_862345 ?auto_862361 ) ) ( not ( = ?auto_862345 ?auto_862362 ) ) ( not ( = ?auto_862346 ?auto_862347 ) ) ( not ( = ?auto_862346 ?auto_862348 ) ) ( not ( = ?auto_862346 ?auto_862349 ) ) ( not ( = ?auto_862346 ?auto_862350 ) ) ( not ( = ?auto_862346 ?auto_862351 ) ) ( not ( = ?auto_862346 ?auto_862352 ) ) ( not ( = ?auto_862346 ?auto_862353 ) ) ( not ( = ?auto_862346 ?auto_862354 ) ) ( not ( = ?auto_862346 ?auto_862355 ) ) ( not ( = ?auto_862346 ?auto_862356 ) ) ( not ( = ?auto_862346 ?auto_862357 ) ) ( not ( = ?auto_862346 ?auto_862358 ) ) ( not ( = ?auto_862346 ?auto_862359 ) ) ( not ( = ?auto_862346 ?auto_862360 ) ) ( not ( = ?auto_862346 ?auto_862361 ) ) ( not ( = ?auto_862346 ?auto_862362 ) ) ( not ( = ?auto_862347 ?auto_862348 ) ) ( not ( = ?auto_862347 ?auto_862349 ) ) ( not ( = ?auto_862347 ?auto_862350 ) ) ( not ( = ?auto_862347 ?auto_862351 ) ) ( not ( = ?auto_862347 ?auto_862352 ) ) ( not ( = ?auto_862347 ?auto_862353 ) ) ( not ( = ?auto_862347 ?auto_862354 ) ) ( not ( = ?auto_862347 ?auto_862355 ) ) ( not ( = ?auto_862347 ?auto_862356 ) ) ( not ( = ?auto_862347 ?auto_862357 ) ) ( not ( = ?auto_862347 ?auto_862358 ) ) ( not ( = ?auto_862347 ?auto_862359 ) ) ( not ( = ?auto_862347 ?auto_862360 ) ) ( not ( = ?auto_862347 ?auto_862361 ) ) ( not ( = ?auto_862347 ?auto_862362 ) ) ( not ( = ?auto_862348 ?auto_862349 ) ) ( not ( = ?auto_862348 ?auto_862350 ) ) ( not ( = ?auto_862348 ?auto_862351 ) ) ( not ( = ?auto_862348 ?auto_862352 ) ) ( not ( = ?auto_862348 ?auto_862353 ) ) ( not ( = ?auto_862348 ?auto_862354 ) ) ( not ( = ?auto_862348 ?auto_862355 ) ) ( not ( = ?auto_862348 ?auto_862356 ) ) ( not ( = ?auto_862348 ?auto_862357 ) ) ( not ( = ?auto_862348 ?auto_862358 ) ) ( not ( = ?auto_862348 ?auto_862359 ) ) ( not ( = ?auto_862348 ?auto_862360 ) ) ( not ( = ?auto_862348 ?auto_862361 ) ) ( not ( = ?auto_862348 ?auto_862362 ) ) ( not ( = ?auto_862349 ?auto_862350 ) ) ( not ( = ?auto_862349 ?auto_862351 ) ) ( not ( = ?auto_862349 ?auto_862352 ) ) ( not ( = ?auto_862349 ?auto_862353 ) ) ( not ( = ?auto_862349 ?auto_862354 ) ) ( not ( = ?auto_862349 ?auto_862355 ) ) ( not ( = ?auto_862349 ?auto_862356 ) ) ( not ( = ?auto_862349 ?auto_862357 ) ) ( not ( = ?auto_862349 ?auto_862358 ) ) ( not ( = ?auto_862349 ?auto_862359 ) ) ( not ( = ?auto_862349 ?auto_862360 ) ) ( not ( = ?auto_862349 ?auto_862361 ) ) ( not ( = ?auto_862349 ?auto_862362 ) ) ( not ( = ?auto_862350 ?auto_862351 ) ) ( not ( = ?auto_862350 ?auto_862352 ) ) ( not ( = ?auto_862350 ?auto_862353 ) ) ( not ( = ?auto_862350 ?auto_862354 ) ) ( not ( = ?auto_862350 ?auto_862355 ) ) ( not ( = ?auto_862350 ?auto_862356 ) ) ( not ( = ?auto_862350 ?auto_862357 ) ) ( not ( = ?auto_862350 ?auto_862358 ) ) ( not ( = ?auto_862350 ?auto_862359 ) ) ( not ( = ?auto_862350 ?auto_862360 ) ) ( not ( = ?auto_862350 ?auto_862361 ) ) ( not ( = ?auto_862350 ?auto_862362 ) ) ( not ( = ?auto_862351 ?auto_862352 ) ) ( not ( = ?auto_862351 ?auto_862353 ) ) ( not ( = ?auto_862351 ?auto_862354 ) ) ( not ( = ?auto_862351 ?auto_862355 ) ) ( not ( = ?auto_862351 ?auto_862356 ) ) ( not ( = ?auto_862351 ?auto_862357 ) ) ( not ( = ?auto_862351 ?auto_862358 ) ) ( not ( = ?auto_862351 ?auto_862359 ) ) ( not ( = ?auto_862351 ?auto_862360 ) ) ( not ( = ?auto_862351 ?auto_862361 ) ) ( not ( = ?auto_862351 ?auto_862362 ) ) ( not ( = ?auto_862352 ?auto_862353 ) ) ( not ( = ?auto_862352 ?auto_862354 ) ) ( not ( = ?auto_862352 ?auto_862355 ) ) ( not ( = ?auto_862352 ?auto_862356 ) ) ( not ( = ?auto_862352 ?auto_862357 ) ) ( not ( = ?auto_862352 ?auto_862358 ) ) ( not ( = ?auto_862352 ?auto_862359 ) ) ( not ( = ?auto_862352 ?auto_862360 ) ) ( not ( = ?auto_862352 ?auto_862361 ) ) ( not ( = ?auto_862352 ?auto_862362 ) ) ( not ( = ?auto_862353 ?auto_862354 ) ) ( not ( = ?auto_862353 ?auto_862355 ) ) ( not ( = ?auto_862353 ?auto_862356 ) ) ( not ( = ?auto_862353 ?auto_862357 ) ) ( not ( = ?auto_862353 ?auto_862358 ) ) ( not ( = ?auto_862353 ?auto_862359 ) ) ( not ( = ?auto_862353 ?auto_862360 ) ) ( not ( = ?auto_862353 ?auto_862361 ) ) ( not ( = ?auto_862353 ?auto_862362 ) ) ( not ( = ?auto_862354 ?auto_862355 ) ) ( not ( = ?auto_862354 ?auto_862356 ) ) ( not ( = ?auto_862354 ?auto_862357 ) ) ( not ( = ?auto_862354 ?auto_862358 ) ) ( not ( = ?auto_862354 ?auto_862359 ) ) ( not ( = ?auto_862354 ?auto_862360 ) ) ( not ( = ?auto_862354 ?auto_862361 ) ) ( not ( = ?auto_862354 ?auto_862362 ) ) ( not ( = ?auto_862355 ?auto_862356 ) ) ( not ( = ?auto_862355 ?auto_862357 ) ) ( not ( = ?auto_862355 ?auto_862358 ) ) ( not ( = ?auto_862355 ?auto_862359 ) ) ( not ( = ?auto_862355 ?auto_862360 ) ) ( not ( = ?auto_862355 ?auto_862361 ) ) ( not ( = ?auto_862355 ?auto_862362 ) ) ( not ( = ?auto_862356 ?auto_862357 ) ) ( not ( = ?auto_862356 ?auto_862358 ) ) ( not ( = ?auto_862356 ?auto_862359 ) ) ( not ( = ?auto_862356 ?auto_862360 ) ) ( not ( = ?auto_862356 ?auto_862361 ) ) ( not ( = ?auto_862356 ?auto_862362 ) ) ( not ( = ?auto_862357 ?auto_862358 ) ) ( not ( = ?auto_862357 ?auto_862359 ) ) ( not ( = ?auto_862357 ?auto_862360 ) ) ( not ( = ?auto_862357 ?auto_862361 ) ) ( not ( = ?auto_862357 ?auto_862362 ) ) ( not ( = ?auto_862358 ?auto_862359 ) ) ( not ( = ?auto_862358 ?auto_862360 ) ) ( not ( = ?auto_862358 ?auto_862361 ) ) ( not ( = ?auto_862358 ?auto_862362 ) ) ( not ( = ?auto_862359 ?auto_862360 ) ) ( not ( = ?auto_862359 ?auto_862361 ) ) ( not ( = ?auto_862359 ?auto_862362 ) ) ( not ( = ?auto_862360 ?auto_862361 ) ) ( not ( = ?auto_862360 ?auto_862362 ) ) ( not ( = ?auto_862361 ?auto_862362 ) ) ( ON ?auto_862361 ?auto_862362 ) ( ON ?auto_862360 ?auto_862361 ) ( ON ?auto_862359 ?auto_862360 ) ( ON ?auto_862358 ?auto_862359 ) ( ON ?auto_862357 ?auto_862358 ) ( ON ?auto_862356 ?auto_862357 ) ( ON ?auto_862355 ?auto_862356 ) ( ON ?auto_862354 ?auto_862355 ) ( ON ?auto_862353 ?auto_862354 ) ( ON ?auto_862352 ?auto_862353 ) ( CLEAR ?auto_862350 ) ( ON ?auto_862351 ?auto_862352 ) ( CLEAR ?auto_862351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_862345 ?auto_862346 ?auto_862347 ?auto_862348 ?auto_862349 ?auto_862350 ?auto_862351 )
      ( MAKE-18PILE ?auto_862345 ?auto_862346 ?auto_862347 ?auto_862348 ?auto_862349 ?auto_862350 ?auto_862351 ?auto_862352 ?auto_862353 ?auto_862354 ?auto_862355 ?auto_862356 ?auto_862357 ?auto_862358 ?auto_862359 ?auto_862360 ?auto_862361 ?auto_862362 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862381 - BLOCK
      ?auto_862382 - BLOCK
      ?auto_862383 - BLOCK
      ?auto_862384 - BLOCK
      ?auto_862385 - BLOCK
      ?auto_862386 - BLOCK
      ?auto_862387 - BLOCK
      ?auto_862388 - BLOCK
      ?auto_862389 - BLOCK
      ?auto_862390 - BLOCK
      ?auto_862391 - BLOCK
      ?auto_862392 - BLOCK
      ?auto_862393 - BLOCK
      ?auto_862394 - BLOCK
      ?auto_862395 - BLOCK
      ?auto_862396 - BLOCK
      ?auto_862397 - BLOCK
      ?auto_862398 - BLOCK
    )
    :vars
    (
      ?auto_862399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862398 ?auto_862399 ) ( ON-TABLE ?auto_862381 ) ( ON ?auto_862382 ?auto_862381 ) ( ON ?auto_862383 ?auto_862382 ) ( ON ?auto_862384 ?auto_862383 ) ( ON ?auto_862385 ?auto_862384 ) ( not ( = ?auto_862381 ?auto_862382 ) ) ( not ( = ?auto_862381 ?auto_862383 ) ) ( not ( = ?auto_862381 ?auto_862384 ) ) ( not ( = ?auto_862381 ?auto_862385 ) ) ( not ( = ?auto_862381 ?auto_862386 ) ) ( not ( = ?auto_862381 ?auto_862387 ) ) ( not ( = ?auto_862381 ?auto_862388 ) ) ( not ( = ?auto_862381 ?auto_862389 ) ) ( not ( = ?auto_862381 ?auto_862390 ) ) ( not ( = ?auto_862381 ?auto_862391 ) ) ( not ( = ?auto_862381 ?auto_862392 ) ) ( not ( = ?auto_862381 ?auto_862393 ) ) ( not ( = ?auto_862381 ?auto_862394 ) ) ( not ( = ?auto_862381 ?auto_862395 ) ) ( not ( = ?auto_862381 ?auto_862396 ) ) ( not ( = ?auto_862381 ?auto_862397 ) ) ( not ( = ?auto_862381 ?auto_862398 ) ) ( not ( = ?auto_862381 ?auto_862399 ) ) ( not ( = ?auto_862382 ?auto_862383 ) ) ( not ( = ?auto_862382 ?auto_862384 ) ) ( not ( = ?auto_862382 ?auto_862385 ) ) ( not ( = ?auto_862382 ?auto_862386 ) ) ( not ( = ?auto_862382 ?auto_862387 ) ) ( not ( = ?auto_862382 ?auto_862388 ) ) ( not ( = ?auto_862382 ?auto_862389 ) ) ( not ( = ?auto_862382 ?auto_862390 ) ) ( not ( = ?auto_862382 ?auto_862391 ) ) ( not ( = ?auto_862382 ?auto_862392 ) ) ( not ( = ?auto_862382 ?auto_862393 ) ) ( not ( = ?auto_862382 ?auto_862394 ) ) ( not ( = ?auto_862382 ?auto_862395 ) ) ( not ( = ?auto_862382 ?auto_862396 ) ) ( not ( = ?auto_862382 ?auto_862397 ) ) ( not ( = ?auto_862382 ?auto_862398 ) ) ( not ( = ?auto_862382 ?auto_862399 ) ) ( not ( = ?auto_862383 ?auto_862384 ) ) ( not ( = ?auto_862383 ?auto_862385 ) ) ( not ( = ?auto_862383 ?auto_862386 ) ) ( not ( = ?auto_862383 ?auto_862387 ) ) ( not ( = ?auto_862383 ?auto_862388 ) ) ( not ( = ?auto_862383 ?auto_862389 ) ) ( not ( = ?auto_862383 ?auto_862390 ) ) ( not ( = ?auto_862383 ?auto_862391 ) ) ( not ( = ?auto_862383 ?auto_862392 ) ) ( not ( = ?auto_862383 ?auto_862393 ) ) ( not ( = ?auto_862383 ?auto_862394 ) ) ( not ( = ?auto_862383 ?auto_862395 ) ) ( not ( = ?auto_862383 ?auto_862396 ) ) ( not ( = ?auto_862383 ?auto_862397 ) ) ( not ( = ?auto_862383 ?auto_862398 ) ) ( not ( = ?auto_862383 ?auto_862399 ) ) ( not ( = ?auto_862384 ?auto_862385 ) ) ( not ( = ?auto_862384 ?auto_862386 ) ) ( not ( = ?auto_862384 ?auto_862387 ) ) ( not ( = ?auto_862384 ?auto_862388 ) ) ( not ( = ?auto_862384 ?auto_862389 ) ) ( not ( = ?auto_862384 ?auto_862390 ) ) ( not ( = ?auto_862384 ?auto_862391 ) ) ( not ( = ?auto_862384 ?auto_862392 ) ) ( not ( = ?auto_862384 ?auto_862393 ) ) ( not ( = ?auto_862384 ?auto_862394 ) ) ( not ( = ?auto_862384 ?auto_862395 ) ) ( not ( = ?auto_862384 ?auto_862396 ) ) ( not ( = ?auto_862384 ?auto_862397 ) ) ( not ( = ?auto_862384 ?auto_862398 ) ) ( not ( = ?auto_862384 ?auto_862399 ) ) ( not ( = ?auto_862385 ?auto_862386 ) ) ( not ( = ?auto_862385 ?auto_862387 ) ) ( not ( = ?auto_862385 ?auto_862388 ) ) ( not ( = ?auto_862385 ?auto_862389 ) ) ( not ( = ?auto_862385 ?auto_862390 ) ) ( not ( = ?auto_862385 ?auto_862391 ) ) ( not ( = ?auto_862385 ?auto_862392 ) ) ( not ( = ?auto_862385 ?auto_862393 ) ) ( not ( = ?auto_862385 ?auto_862394 ) ) ( not ( = ?auto_862385 ?auto_862395 ) ) ( not ( = ?auto_862385 ?auto_862396 ) ) ( not ( = ?auto_862385 ?auto_862397 ) ) ( not ( = ?auto_862385 ?auto_862398 ) ) ( not ( = ?auto_862385 ?auto_862399 ) ) ( not ( = ?auto_862386 ?auto_862387 ) ) ( not ( = ?auto_862386 ?auto_862388 ) ) ( not ( = ?auto_862386 ?auto_862389 ) ) ( not ( = ?auto_862386 ?auto_862390 ) ) ( not ( = ?auto_862386 ?auto_862391 ) ) ( not ( = ?auto_862386 ?auto_862392 ) ) ( not ( = ?auto_862386 ?auto_862393 ) ) ( not ( = ?auto_862386 ?auto_862394 ) ) ( not ( = ?auto_862386 ?auto_862395 ) ) ( not ( = ?auto_862386 ?auto_862396 ) ) ( not ( = ?auto_862386 ?auto_862397 ) ) ( not ( = ?auto_862386 ?auto_862398 ) ) ( not ( = ?auto_862386 ?auto_862399 ) ) ( not ( = ?auto_862387 ?auto_862388 ) ) ( not ( = ?auto_862387 ?auto_862389 ) ) ( not ( = ?auto_862387 ?auto_862390 ) ) ( not ( = ?auto_862387 ?auto_862391 ) ) ( not ( = ?auto_862387 ?auto_862392 ) ) ( not ( = ?auto_862387 ?auto_862393 ) ) ( not ( = ?auto_862387 ?auto_862394 ) ) ( not ( = ?auto_862387 ?auto_862395 ) ) ( not ( = ?auto_862387 ?auto_862396 ) ) ( not ( = ?auto_862387 ?auto_862397 ) ) ( not ( = ?auto_862387 ?auto_862398 ) ) ( not ( = ?auto_862387 ?auto_862399 ) ) ( not ( = ?auto_862388 ?auto_862389 ) ) ( not ( = ?auto_862388 ?auto_862390 ) ) ( not ( = ?auto_862388 ?auto_862391 ) ) ( not ( = ?auto_862388 ?auto_862392 ) ) ( not ( = ?auto_862388 ?auto_862393 ) ) ( not ( = ?auto_862388 ?auto_862394 ) ) ( not ( = ?auto_862388 ?auto_862395 ) ) ( not ( = ?auto_862388 ?auto_862396 ) ) ( not ( = ?auto_862388 ?auto_862397 ) ) ( not ( = ?auto_862388 ?auto_862398 ) ) ( not ( = ?auto_862388 ?auto_862399 ) ) ( not ( = ?auto_862389 ?auto_862390 ) ) ( not ( = ?auto_862389 ?auto_862391 ) ) ( not ( = ?auto_862389 ?auto_862392 ) ) ( not ( = ?auto_862389 ?auto_862393 ) ) ( not ( = ?auto_862389 ?auto_862394 ) ) ( not ( = ?auto_862389 ?auto_862395 ) ) ( not ( = ?auto_862389 ?auto_862396 ) ) ( not ( = ?auto_862389 ?auto_862397 ) ) ( not ( = ?auto_862389 ?auto_862398 ) ) ( not ( = ?auto_862389 ?auto_862399 ) ) ( not ( = ?auto_862390 ?auto_862391 ) ) ( not ( = ?auto_862390 ?auto_862392 ) ) ( not ( = ?auto_862390 ?auto_862393 ) ) ( not ( = ?auto_862390 ?auto_862394 ) ) ( not ( = ?auto_862390 ?auto_862395 ) ) ( not ( = ?auto_862390 ?auto_862396 ) ) ( not ( = ?auto_862390 ?auto_862397 ) ) ( not ( = ?auto_862390 ?auto_862398 ) ) ( not ( = ?auto_862390 ?auto_862399 ) ) ( not ( = ?auto_862391 ?auto_862392 ) ) ( not ( = ?auto_862391 ?auto_862393 ) ) ( not ( = ?auto_862391 ?auto_862394 ) ) ( not ( = ?auto_862391 ?auto_862395 ) ) ( not ( = ?auto_862391 ?auto_862396 ) ) ( not ( = ?auto_862391 ?auto_862397 ) ) ( not ( = ?auto_862391 ?auto_862398 ) ) ( not ( = ?auto_862391 ?auto_862399 ) ) ( not ( = ?auto_862392 ?auto_862393 ) ) ( not ( = ?auto_862392 ?auto_862394 ) ) ( not ( = ?auto_862392 ?auto_862395 ) ) ( not ( = ?auto_862392 ?auto_862396 ) ) ( not ( = ?auto_862392 ?auto_862397 ) ) ( not ( = ?auto_862392 ?auto_862398 ) ) ( not ( = ?auto_862392 ?auto_862399 ) ) ( not ( = ?auto_862393 ?auto_862394 ) ) ( not ( = ?auto_862393 ?auto_862395 ) ) ( not ( = ?auto_862393 ?auto_862396 ) ) ( not ( = ?auto_862393 ?auto_862397 ) ) ( not ( = ?auto_862393 ?auto_862398 ) ) ( not ( = ?auto_862393 ?auto_862399 ) ) ( not ( = ?auto_862394 ?auto_862395 ) ) ( not ( = ?auto_862394 ?auto_862396 ) ) ( not ( = ?auto_862394 ?auto_862397 ) ) ( not ( = ?auto_862394 ?auto_862398 ) ) ( not ( = ?auto_862394 ?auto_862399 ) ) ( not ( = ?auto_862395 ?auto_862396 ) ) ( not ( = ?auto_862395 ?auto_862397 ) ) ( not ( = ?auto_862395 ?auto_862398 ) ) ( not ( = ?auto_862395 ?auto_862399 ) ) ( not ( = ?auto_862396 ?auto_862397 ) ) ( not ( = ?auto_862396 ?auto_862398 ) ) ( not ( = ?auto_862396 ?auto_862399 ) ) ( not ( = ?auto_862397 ?auto_862398 ) ) ( not ( = ?auto_862397 ?auto_862399 ) ) ( not ( = ?auto_862398 ?auto_862399 ) ) ( ON ?auto_862397 ?auto_862398 ) ( ON ?auto_862396 ?auto_862397 ) ( ON ?auto_862395 ?auto_862396 ) ( ON ?auto_862394 ?auto_862395 ) ( ON ?auto_862393 ?auto_862394 ) ( ON ?auto_862392 ?auto_862393 ) ( ON ?auto_862391 ?auto_862392 ) ( ON ?auto_862390 ?auto_862391 ) ( ON ?auto_862389 ?auto_862390 ) ( ON ?auto_862388 ?auto_862389 ) ( ON ?auto_862387 ?auto_862388 ) ( CLEAR ?auto_862385 ) ( ON ?auto_862386 ?auto_862387 ) ( CLEAR ?auto_862386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_862381 ?auto_862382 ?auto_862383 ?auto_862384 ?auto_862385 ?auto_862386 )
      ( MAKE-18PILE ?auto_862381 ?auto_862382 ?auto_862383 ?auto_862384 ?auto_862385 ?auto_862386 ?auto_862387 ?auto_862388 ?auto_862389 ?auto_862390 ?auto_862391 ?auto_862392 ?auto_862393 ?auto_862394 ?auto_862395 ?auto_862396 ?auto_862397 ?auto_862398 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862418 - BLOCK
      ?auto_862419 - BLOCK
      ?auto_862420 - BLOCK
      ?auto_862421 - BLOCK
      ?auto_862422 - BLOCK
      ?auto_862423 - BLOCK
      ?auto_862424 - BLOCK
      ?auto_862425 - BLOCK
      ?auto_862426 - BLOCK
      ?auto_862427 - BLOCK
      ?auto_862428 - BLOCK
      ?auto_862429 - BLOCK
      ?auto_862430 - BLOCK
      ?auto_862431 - BLOCK
      ?auto_862432 - BLOCK
      ?auto_862433 - BLOCK
      ?auto_862434 - BLOCK
      ?auto_862435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_862435 ) ( ON-TABLE ?auto_862418 ) ( ON ?auto_862419 ?auto_862418 ) ( ON ?auto_862420 ?auto_862419 ) ( ON ?auto_862421 ?auto_862420 ) ( ON ?auto_862422 ?auto_862421 ) ( not ( = ?auto_862418 ?auto_862419 ) ) ( not ( = ?auto_862418 ?auto_862420 ) ) ( not ( = ?auto_862418 ?auto_862421 ) ) ( not ( = ?auto_862418 ?auto_862422 ) ) ( not ( = ?auto_862418 ?auto_862423 ) ) ( not ( = ?auto_862418 ?auto_862424 ) ) ( not ( = ?auto_862418 ?auto_862425 ) ) ( not ( = ?auto_862418 ?auto_862426 ) ) ( not ( = ?auto_862418 ?auto_862427 ) ) ( not ( = ?auto_862418 ?auto_862428 ) ) ( not ( = ?auto_862418 ?auto_862429 ) ) ( not ( = ?auto_862418 ?auto_862430 ) ) ( not ( = ?auto_862418 ?auto_862431 ) ) ( not ( = ?auto_862418 ?auto_862432 ) ) ( not ( = ?auto_862418 ?auto_862433 ) ) ( not ( = ?auto_862418 ?auto_862434 ) ) ( not ( = ?auto_862418 ?auto_862435 ) ) ( not ( = ?auto_862419 ?auto_862420 ) ) ( not ( = ?auto_862419 ?auto_862421 ) ) ( not ( = ?auto_862419 ?auto_862422 ) ) ( not ( = ?auto_862419 ?auto_862423 ) ) ( not ( = ?auto_862419 ?auto_862424 ) ) ( not ( = ?auto_862419 ?auto_862425 ) ) ( not ( = ?auto_862419 ?auto_862426 ) ) ( not ( = ?auto_862419 ?auto_862427 ) ) ( not ( = ?auto_862419 ?auto_862428 ) ) ( not ( = ?auto_862419 ?auto_862429 ) ) ( not ( = ?auto_862419 ?auto_862430 ) ) ( not ( = ?auto_862419 ?auto_862431 ) ) ( not ( = ?auto_862419 ?auto_862432 ) ) ( not ( = ?auto_862419 ?auto_862433 ) ) ( not ( = ?auto_862419 ?auto_862434 ) ) ( not ( = ?auto_862419 ?auto_862435 ) ) ( not ( = ?auto_862420 ?auto_862421 ) ) ( not ( = ?auto_862420 ?auto_862422 ) ) ( not ( = ?auto_862420 ?auto_862423 ) ) ( not ( = ?auto_862420 ?auto_862424 ) ) ( not ( = ?auto_862420 ?auto_862425 ) ) ( not ( = ?auto_862420 ?auto_862426 ) ) ( not ( = ?auto_862420 ?auto_862427 ) ) ( not ( = ?auto_862420 ?auto_862428 ) ) ( not ( = ?auto_862420 ?auto_862429 ) ) ( not ( = ?auto_862420 ?auto_862430 ) ) ( not ( = ?auto_862420 ?auto_862431 ) ) ( not ( = ?auto_862420 ?auto_862432 ) ) ( not ( = ?auto_862420 ?auto_862433 ) ) ( not ( = ?auto_862420 ?auto_862434 ) ) ( not ( = ?auto_862420 ?auto_862435 ) ) ( not ( = ?auto_862421 ?auto_862422 ) ) ( not ( = ?auto_862421 ?auto_862423 ) ) ( not ( = ?auto_862421 ?auto_862424 ) ) ( not ( = ?auto_862421 ?auto_862425 ) ) ( not ( = ?auto_862421 ?auto_862426 ) ) ( not ( = ?auto_862421 ?auto_862427 ) ) ( not ( = ?auto_862421 ?auto_862428 ) ) ( not ( = ?auto_862421 ?auto_862429 ) ) ( not ( = ?auto_862421 ?auto_862430 ) ) ( not ( = ?auto_862421 ?auto_862431 ) ) ( not ( = ?auto_862421 ?auto_862432 ) ) ( not ( = ?auto_862421 ?auto_862433 ) ) ( not ( = ?auto_862421 ?auto_862434 ) ) ( not ( = ?auto_862421 ?auto_862435 ) ) ( not ( = ?auto_862422 ?auto_862423 ) ) ( not ( = ?auto_862422 ?auto_862424 ) ) ( not ( = ?auto_862422 ?auto_862425 ) ) ( not ( = ?auto_862422 ?auto_862426 ) ) ( not ( = ?auto_862422 ?auto_862427 ) ) ( not ( = ?auto_862422 ?auto_862428 ) ) ( not ( = ?auto_862422 ?auto_862429 ) ) ( not ( = ?auto_862422 ?auto_862430 ) ) ( not ( = ?auto_862422 ?auto_862431 ) ) ( not ( = ?auto_862422 ?auto_862432 ) ) ( not ( = ?auto_862422 ?auto_862433 ) ) ( not ( = ?auto_862422 ?auto_862434 ) ) ( not ( = ?auto_862422 ?auto_862435 ) ) ( not ( = ?auto_862423 ?auto_862424 ) ) ( not ( = ?auto_862423 ?auto_862425 ) ) ( not ( = ?auto_862423 ?auto_862426 ) ) ( not ( = ?auto_862423 ?auto_862427 ) ) ( not ( = ?auto_862423 ?auto_862428 ) ) ( not ( = ?auto_862423 ?auto_862429 ) ) ( not ( = ?auto_862423 ?auto_862430 ) ) ( not ( = ?auto_862423 ?auto_862431 ) ) ( not ( = ?auto_862423 ?auto_862432 ) ) ( not ( = ?auto_862423 ?auto_862433 ) ) ( not ( = ?auto_862423 ?auto_862434 ) ) ( not ( = ?auto_862423 ?auto_862435 ) ) ( not ( = ?auto_862424 ?auto_862425 ) ) ( not ( = ?auto_862424 ?auto_862426 ) ) ( not ( = ?auto_862424 ?auto_862427 ) ) ( not ( = ?auto_862424 ?auto_862428 ) ) ( not ( = ?auto_862424 ?auto_862429 ) ) ( not ( = ?auto_862424 ?auto_862430 ) ) ( not ( = ?auto_862424 ?auto_862431 ) ) ( not ( = ?auto_862424 ?auto_862432 ) ) ( not ( = ?auto_862424 ?auto_862433 ) ) ( not ( = ?auto_862424 ?auto_862434 ) ) ( not ( = ?auto_862424 ?auto_862435 ) ) ( not ( = ?auto_862425 ?auto_862426 ) ) ( not ( = ?auto_862425 ?auto_862427 ) ) ( not ( = ?auto_862425 ?auto_862428 ) ) ( not ( = ?auto_862425 ?auto_862429 ) ) ( not ( = ?auto_862425 ?auto_862430 ) ) ( not ( = ?auto_862425 ?auto_862431 ) ) ( not ( = ?auto_862425 ?auto_862432 ) ) ( not ( = ?auto_862425 ?auto_862433 ) ) ( not ( = ?auto_862425 ?auto_862434 ) ) ( not ( = ?auto_862425 ?auto_862435 ) ) ( not ( = ?auto_862426 ?auto_862427 ) ) ( not ( = ?auto_862426 ?auto_862428 ) ) ( not ( = ?auto_862426 ?auto_862429 ) ) ( not ( = ?auto_862426 ?auto_862430 ) ) ( not ( = ?auto_862426 ?auto_862431 ) ) ( not ( = ?auto_862426 ?auto_862432 ) ) ( not ( = ?auto_862426 ?auto_862433 ) ) ( not ( = ?auto_862426 ?auto_862434 ) ) ( not ( = ?auto_862426 ?auto_862435 ) ) ( not ( = ?auto_862427 ?auto_862428 ) ) ( not ( = ?auto_862427 ?auto_862429 ) ) ( not ( = ?auto_862427 ?auto_862430 ) ) ( not ( = ?auto_862427 ?auto_862431 ) ) ( not ( = ?auto_862427 ?auto_862432 ) ) ( not ( = ?auto_862427 ?auto_862433 ) ) ( not ( = ?auto_862427 ?auto_862434 ) ) ( not ( = ?auto_862427 ?auto_862435 ) ) ( not ( = ?auto_862428 ?auto_862429 ) ) ( not ( = ?auto_862428 ?auto_862430 ) ) ( not ( = ?auto_862428 ?auto_862431 ) ) ( not ( = ?auto_862428 ?auto_862432 ) ) ( not ( = ?auto_862428 ?auto_862433 ) ) ( not ( = ?auto_862428 ?auto_862434 ) ) ( not ( = ?auto_862428 ?auto_862435 ) ) ( not ( = ?auto_862429 ?auto_862430 ) ) ( not ( = ?auto_862429 ?auto_862431 ) ) ( not ( = ?auto_862429 ?auto_862432 ) ) ( not ( = ?auto_862429 ?auto_862433 ) ) ( not ( = ?auto_862429 ?auto_862434 ) ) ( not ( = ?auto_862429 ?auto_862435 ) ) ( not ( = ?auto_862430 ?auto_862431 ) ) ( not ( = ?auto_862430 ?auto_862432 ) ) ( not ( = ?auto_862430 ?auto_862433 ) ) ( not ( = ?auto_862430 ?auto_862434 ) ) ( not ( = ?auto_862430 ?auto_862435 ) ) ( not ( = ?auto_862431 ?auto_862432 ) ) ( not ( = ?auto_862431 ?auto_862433 ) ) ( not ( = ?auto_862431 ?auto_862434 ) ) ( not ( = ?auto_862431 ?auto_862435 ) ) ( not ( = ?auto_862432 ?auto_862433 ) ) ( not ( = ?auto_862432 ?auto_862434 ) ) ( not ( = ?auto_862432 ?auto_862435 ) ) ( not ( = ?auto_862433 ?auto_862434 ) ) ( not ( = ?auto_862433 ?auto_862435 ) ) ( not ( = ?auto_862434 ?auto_862435 ) ) ( ON ?auto_862434 ?auto_862435 ) ( ON ?auto_862433 ?auto_862434 ) ( ON ?auto_862432 ?auto_862433 ) ( ON ?auto_862431 ?auto_862432 ) ( ON ?auto_862430 ?auto_862431 ) ( ON ?auto_862429 ?auto_862430 ) ( ON ?auto_862428 ?auto_862429 ) ( ON ?auto_862427 ?auto_862428 ) ( ON ?auto_862426 ?auto_862427 ) ( ON ?auto_862425 ?auto_862426 ) ( ON ?auto_862424 ?auto_862425 ) ( CLEAR ?auto_862422 ) ( ON ?auto_862423 ?auto_862424 ) ( CLEAR ?auto_862423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_862418 ?auto_862419 ?auto_862420 ?auto_862421 ?auto_862422 ?auto_862423 )
      ( MAKE-18PILE ?auto_862418 ?auto_862419 ?auto_862420 ?auto_862421 ?auto_862422 ?auto_862423 ?auto_862424 ?auto_862425 ?auto_862426 ?auto_862427 ?auto_862428 ?auto_862429 ?auto_862430 ?auto_862431 ?auto_862432 ?auto_862433 ?auto_862434 ?auto_862435 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862454 - BLOCK
      ?auto_862455 - BLOCK
      ?auto_862456 - BLOCK
      ?auto_862457 - BLOCK
      ?auto_862458 - BLOCK
      ?auto_862459 - BLOCK
      ?auto_862460 - BLOCK
      ?auto_862461 - BLOCK
      ?auto_862462 - BLOCK
      ?auto_862463 - BLOCK
      ?auto_862464 - BLOCK
      ?auto_862465 - BLOCK
      ?auto_862466 - BLOCK
      ?auto_862467 - BLOCK
      ?auto_862468 - BLOCK
      ?auto_862469 - BLOCK
      ?auto_862470 - BLOCK
      ?auto_862471 - BLOCK
    )
    :vars
    (
      ?auto_862472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862471 ?auto_862472 ) ( ON-TABLE ?auto_862454 ) ( ON ?auto_862455 ?auto_862454 ) ( ON ?auto_862456 ?auto_862455 ) ( ON ?auto_862457 ?auto_862456 ) ( not ( = ?auto_862454 ?auto_862455 ) ) ( not ( = ?auto_862454 ?auto_862456 ) ) ( not ( = ?auto_862454 ?auto_862457 ) ) ( not ( = ?auto_862454 ?auto_862458 ) ) ( not ( = ?auto_862454 ?auto_862459 ) ) ( not ( = ?auto_862454 ?auto_862460 ) ) ( not ( = ?auto_862454 ?auto_862461 ) ) ( not ( = ?auto_862454 ?auto_862462 ) ) ( not ( = ?auto_862454 ?auto_862463 ) ) ( not ( = ?auto_862454 ?auto_862464 ) ) ( not ( = ?auto_862454 ?auto_862465 ) ) ( not ( = ?auto_862454 ?auto_862466 ) ) ( not ( = ?auto_862454 ?auto_862467 ) ) ( not ( = ?auto_862454 ?auto_862468 ) ) ( not ( = ?auto_862454 ?auto_862469 ) ) ( not ( = ?auto_862454 ?auto_862470 ) ) ( not ( = ?auto_862454 ?auto_862471 ) ) ( not ( = ?auto_862454 ?auto_862472 ) ) ( not ( = ?auto_862455 ?auto_862456 ) ) ( not ( = ?auto_862455 ?auto_862457 ) ) ( not ( = ?auto_862455 ?auto_862458 ) ) ( not ( = ?auto_862455 ?auto_862459 ) ) ( not ( = ?auto_862455 ?auto_862460 ) ) ( not ( = ?auto_862455 ?auto_862461 ) ) ( not ( = ?auto_862455 ?auto_862462 ) ) ( not ( = ?auto_862455 ?auto_862463 ) ) ( not ( = ?auto_862455 ?auto_862464 ) ) ( not ( = ?auto_862455 ?auto_862465 ) ) ( not ( = ?auto_862455 ?auto_862466 ) ) ( not ( = ?auto_862455 ?auto_862467 ) ) ( not ( = ?auto_862455 ?auto_862468 ) ) ( not ( = ?auto_862455 ?auto_862469 ) ) ( not ( = ?auto_862455 ?auto_862470 ) ) ( not ( = ?auto_862455 ?auto_862471 ) ) ( not ( = ?auto_862455 ?auto_862472 ) ) ( not ( = ?auto_862456 ?auto_862457 ) ) ( not ( = ?auto_862456 ?auto_862458 ) ) ( not ( = ?auto_862456 ?auto_862459 ) ) ( not ( = ?auto_862456 ?auto_862460 ) ) ( not ( = ?auto_862456 ?auto_862461 ) ) ( not ( = ?auto_862456 ?auto_862462 ) ) ( not ( = ?auto_862456 ?auto_862463 ) ) ( not ( = ?auto_862456 ?auto_862464 ) ) ( not ( = ?auto_862456 ?auto_862465 ) ) ( not ( = ?auto_862456 ?auto_862466 ) ) ( not ( = ?auto_862456 ?auto_862467 ) ) ( not ( = ?auto_862456 ?auto_862468 ) ) ( not ( = ?auto_862456 ?auto_862469 ) ) ( not ( = ?auto_862456 ?auto_862470 ) ) ( not ( = ?auto_862456 ?auto_862471 ) ) ( not ( = ?auto_862456 ?auto_862472 ) ) ( not ( = ?auto_862457 ?auto_862458 ) ) ( not ( = ?auto_862457 ?auto_862459 ) ) ( not ( = ?auto_862457 ?auto_862460 ) ) ( not ( = ?auto_862457 ?auto_862461 ) ) ( not ( = ?auto_862457 ?auto_862462 ) ) ( not ( = ?auto_862457 ?auto_862463 ) ) ( not ( = ?auto_862457 ?auto_862464 ) ) ( not ( = ?auto_862457 ?auto_862465 ) ) ( not ( = ?auto_862457 ?auto_862466 ) ) ( not ( = ?auto_862457 ?auto_862467 ) ) ( not ( = ?auto_862457 ?auto_862468 ) ) ( not ( = ?auto_862457 ?auto_862469 ) ) ( not ( = ?auto_862457 ?auto_862470 ) ) ( not ( = ?auto_862457 ?auto_862471 ) ) ( not ( = ?auto_862457 ?auto_862472 ) ) ( not ( = ?auto_862458 ?auto_862459 ) ) ( not ( = ?auto_862458 ?auto_862460 ) ) ( not ( = ?auto_862458 ?auto_862461 ) ) ( not ( = ?auto_862458 ?auto_862462 ) ) ( not ( = ?auto_862458 ?auto_862463 ) ) ( not ( = ?auto_862458 ?auto_862464 ) ) ( not ( = ?auto_862458 ?auto_862465 ) ) ( not ( = ?auto_862458 ?auto_862466 ) ) ( not ( = ?auto_862458 ?auto_862467 ) ) ( not ( = ?auto_862458 ?auto_862468 ) ) ( not ( = ?auto_862458 ?auto_862469 ) ) ( not ( = ?auto_862458 ?auto_862470 ) ) ( not ( = ?auto_862458 ?auto_862471 ) ) ( not ( = ?auto_862458 ?auto_862472 ) ) ( not ( = ?auto_862459 ?auto_862460 ) ) ( not ( = ?auto_862459 ?auto_862461 ) ) ( not ( = ?auto_862459 ?auto_862462 ) ) ( not ( = ?auto_862459 ?auto_862463 ) ) ( not ( = ?auto_862459 ?auto_862464 ) ) ( not ( = ?auto_862459 ?auto_862465 ) ) ( not ( = ?auto_862459 ?auto_862466 ) ) ( not ( = ?auto_862459 ?auto_862467 ) ) ( not ( = ?auto_862459 ?auto_862468 ) ) ( not ( = ?auto_862459 ?auto_862469 ) ) ( not ( = ?auto_862459 ?auto_862470 ) ) ( not ( = ?auto_862459 ?auto_862471 ) ) ( not ( = ?auto_862459 ?auto_862472 ) ) ( not ( = ?auto_862460 ?auto_862461 ) ) ( not ( = ?auto_862460 ?auto_862462 ) ) ( not ( = ?auto_862460 ?auto_862463 ) ) ( not ( = ?auto_862460 ?auto_862464 ) ) ( not ( = ?auto_862460 ?auto_862465 ) ) ( not ( = ?auto_862460 ?auto_862466 ) ) ( not ( = ?auto_862460 ?auto_862467 ) ) ( not ( = ?auto_862460 ?auto_862468 ) ) ( not ( = ?auto_862460 ?auto_862469 ) ) ( not ( = ?auto_862460 ?auto_862470 ) ) ( not ( = ?auto_862460 ?auto_862471 ) ) ( not ( = ?auto_862460 ?auto_862472 ) ) ( not ( = ?auto_862461 ?auto_862462 ) ) ( not ( = ?auto_862461 ?auto_862463 ) ) ( not ( = ?auto_862461 ?auto_862464 ) ) ( not ( = ?auto_862461 ?auto_862465 ) ) ( not ( = ?auto_862461 ?auto_862466 ) ) ( not ( = ?auto_862461 ?auto_862467 ) ) ( not ( = ?auto_862461 ?auto_862468 ) ) ( not ( = ?auto_862461 ?auto_862469 ) ) ( not ( = ?auto_862461 ?auto_862470 ) ) ( not ( = ?auto_862461 ?auto_862471 ) ) ( not ( = ?auto_862461 ?auto_862472 ) ) ( not ( = ?auto_862462 ?auto_862463 ) ) ( not ( = ?auto_862462 ?auto_862464 ) ) ( not ( = ?auto_862462 ?auto_862465 ) ) ( not ( = ?auto_862462 ?auto_862466 ) ) ( not ( = ?auto_862462 ?auto_862467 ) ) ( not ( = ?auto_862462 ?auto_862468 ) ) ( not ( = ?auto_862462 ?auto_862469 ) ) ( not ( = ?auto_862462 ?auto_862470 ) ) ( not ( = ?auto_862462 ?auto_862471 ) ) ( not ( = ?auto_862462 ?auto_862472 ) ) ( not ( = ?auto_862463 ?auto_862464 ) ) ( not ( = ?auto_862463 ?auto_862465 ) ) ( not ( = ?auto_862463 ?auto_862466 ) ) ( not ( = ?auto_862463 ?auto_862467 ) ) ( not ( = ?auto_862463 ?auto_862468 ) ) ( not ( = ?auto_862463 ?auto_862469 ) ) ( not ( = ?auto_862463 ?auto_862470 ) ) ( not ( = ?auto_862463 ?auto_862471 ) ) ( not ( = ?auto_862463 ?auto_862472 ) ) ( not ( = ?auto_862464 ?auto_862465 ) ) ( not ( = ?auto_862464 ?auto_862466 ) ) ( not ( = ?auto_862464 ?auto_862467 ) ) ( not ( = ?auto_862464 ?auto_862468 ) ) ( not ( = ?auto_862464 ?auto_862469 ) ) ( not ( = ?auto_862464 ?auto_862470 ) ) ( not ( = ?auto_862464 ?auto_862471 ) ) ( not ( = ?auto_862464 ?auto_862472 ) ) ( not ( = ?auto_862465 ?auto_862466 ) ) ( not ( = ?auto_862465 ?auto_862467 ) ) ( not ( = ?auto_862465 ?auto_862468 ) ) ( not ( = ?auto_862465 ?auto_862469 ) ) ( not ( = ?auto_862465 ?auto_862470 ) ) ( not ( = ?auto_862465 ?auto_862471 ) ) ( not ( = ?auto_862465 ?auto_862472 ) ) ( not ( = ?auto_862466 ?auto_862467 ) ) ( not ( = ?auto_862466 ?auto_862468 ) ) ( not ( = ?auto_862466 ?auto_862469 ) ) ( not ( = ?auto_862466 ?auto_862470 ) ) ( not ( = ?auto_862466 ?auto_862471 ) ) ( not ( = ?auto_862466 ?auto_862472 ) ) ( not ( = ?auto_862467 ?auto_862468 ) ) ( not ( = ?auto_862467 ?auto_862469 ) ) ( not ( = ?auto_862467 ?auto_862470 ) ) ( not ( = ?auto_862467 ?auto_862471 ) ) ( not ( = ?auto_862467 ?auto_862472 ) ) ( not ( = ?auto_862468 ?auto_862469 ) ) ( not ( = ?auto_862468 ?auto_862470 ) ) ( not ( = ?auto_862468 ?auto_862471 ) ) ( not ( = ?auto_862468 ?auto_862472 ) ) ( not ( = ?auto_862469 ?auto_862470 ) ) ( not ( = ?auto_862469 ?auto_862471 ) ) ( not ( = ?auto_862469 ?auto_862472 ) ) ( not ( = ?auto_862470 ?auto_862471 ) ) ( not ( = ?auto_862470 ?auto_862472 ) ) ( not ( = ?auto_862471 ?auto_862472 ) ) ( ON ?auto_862470 ?auto_862471 ) ( ON ?auto_862469 ?auto_862470 ) ( ON ?auto_862468 ?auto_862469 ) ( ON ?auto_862467 ?auto_862468 ) ( ON ?auto_862466 ?auto_862467 ) ( ON ?auto_862465 ?auto_862466 ) ( ON ?auto_862464 ?auto_862465 ) ( ON ?auto_862463 ?auto_862464 ) ( ON ?auto_862462 ?auto_862463 ) ( ON ?auto_862461 ?auto_862462 ) ( ON ?auto_862460 ?auto_862461 ) ( ON ?auto_862459 ?auto_862460 ) ( CLEAR ?auto_862457 ) ( ON ?auto_862458 ?auto_862459 ) ( CLEAR ?auto_862458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_862454 ?auto_862455 ?auto_862456 ?auto_862457 ?auto_862458 )
      ( MAKE-18PILE ?auto_862454 ?auto_862455 ?auto_862456 ?auto_862457 ?auto_862458 ?auto_862459 ?auto_862460 ?auto_862461 ?auto_862462 ?auto_862463 ?auto_862464 ?auto_862465 ?auto_862466 ?auto_862467 ?auto_862468 ?auto_862469 ?auto_862470 ?auto_862471 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862491 - BLOCK
      ?auto_862492 - BLOCK
      ?auto_862493 - BLOCK
      ?auto_862494 - BLOCK
      ?auto_862495 - BLOCK
      ?auto_862496 - BLOCK
      ?auto_862497 - BLOCK
      ?auto_862498 - BLOCK
      ?auto_862499 - BLOCK
      ?auto_862500 - BLOCK
      ?auto_862501 - BLOCK
      ?auto_862502 - BLOCK
      ?auto_862503 - BLOCK
      ?auto_862504 - BLOCK
      ?auto_862505 - BLOCK
      ?auto_862506 - BLOCK
      ?auto_862507 - BLOCK
      ?auto_862508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_862508 ) ( ON-TABLE ?auto_862491 ) ( ON ?auto_862492 ?auto_862491 ) ( ON ?auto_862493 ?auto_862492 ) ( ON ?auto_862494 ?auto_862493 ) ( not ( = ?auto_862491 ?auto_862492 ) ) ( not ( = ?auto_862491 ?auto_862493 ) ) ( not ( = ?auto_862491 ?auto_862494 ) ) ( not ( = ?auto_862491 ?auto_862495 ) ) ( not ( = ?auto_862491 ?auto_862496 ) ) ( not ( = ?auto_862491 ?auto_862497 ) ) ( not ( = ?auto_862491 ?auto_862498 ) ) ( not ( = ?auto_862491 ?auto_862499 ) ) ( not ( = ?auto_862491 ?auto_862500 ) ) ( not ( = ?auto_862491 ?auto_862501 ) ) ( not ( = ?auto_862491 ?auto_862502 ) ) ( not ( = ?auto_862491 ?auto_862503 ) ) ( not ( = ?auto_862491 ?auto_862504 ) ) ( not ( = ?auto_862491 ?auto_862505 ) ) ( not ( = ?auto_862491 ?auto_862506 ) ) ( not ( = ?auto_862491 ?auto_862507 ) ) ( not ( = ?auto_862491 ?auto_862508 ) ) ( not ( = ?auto_862492 ?auto_862493 ) ) ( not ( = ?auto_862492 ?auto_862494 ) ) ( not ( = ?auto_862492 ?auto_862495 ) ) ( not ( = ?auto_862492 ?auto_862496 ) ) ( not ( = ?auto_862492 ?auto_862497 ) ) ( not ( = ?auto_862492 ?auto_862498 ) ) ( not ( = ?auto_862492 ?auto_862499 ) ) ( not ( = ?auto_862492 ?auto_862500 ) ) ( not ( = ?auto_862492 ?auto_862501 ) ) ( not ( = ?auto_862492 ?auto_862502 ) ) ( not ( = ?auto_862492 ?auto_862503 ) ) ( not ( = ?auto_862492 ?auto_862504 ) ) ( not ( = ?auto_862492 ?auto_862505 ) ) ( not ( = ?auto_862492 ?auto_862506 ) ) ( not ( = ?auto_862492 ?auto_862507 ) ) ( not ( = ?auto_862492 ?auto_862508 ) ) ( not ( = ?auto_862493 ?auto_862494 ) ) ( not ( = ?auto_862493 ?auto_862495 ) ) ( not ( = ?auto_862493 ?auto_862496 ) ) ( not ( = ?auto_862493 ?auto_862497 ) ) ( not ( = ?auto_862493 ?auto_862498 ) ) ( not ( = ?auto_862493 ?auto_862499 ) ) ( not ( = ?auto_862493 ?auto_862500 ) ) ( not ( = ?auto_862493 ?auto_862501 ) ) ( not ( = ?auto_862493 ?auto_862502 ) ) ( not ( = ?auto_862493 ?auto_862503 ) ) ( not ( = ?auto_862493 ?auto_862504 ) ) ( not ( = ?auto_862493 ?auto_862505 ) ) ( not ( = ?auto_862493 ?auto_862506 ) ) ( not ( = ?auto_862493 ?auto_862507 ) ) ( not ( = ?auto_862493 ?auto_862508 ) ) ( not ( = ?auto_862494 ?auto_862495 ) ) ( not ( = ?auto_862494 ?auto_862496 ) ) ( not ( = ?auto_862494 ?auto_862497 ) ) ( not ( = ?auto_862494 ?auto_862498 ) ) ( not ( = ?auto_862494 ?auto_862499 ) ) ( not ( = ?auto_862494 ?auto_862500 ) ) ( not ( = ?auto_862494 ?auto_862501 ) ) ( not ( = ?auto_862494 ?auto_862502 ) ) ( not ( = ?auto_862494 ?auto_862503 ) ) ( not ( = ?auto_862494 ?auto_862504 ) ) ( not ( = ?auto_862494 ?auto_862505 ) ) ( not ( = ?auto_862494 ?auto_862506 ) ) ( not ( = ?auto_862494 ?auto_862507 ) ) ( not ( = ?auto_862494 ?auto_862508 ) ) ( not ( = ?auto_862495 ?auto_862496 ) ) ( not ( = ?auto_862495 ?auto_862497 ) ) ( not ( = ?auto_862495 ?auto_862498 ) ) ( not ( = ?auto_862495 ?auto_862499 ) ) ( not ( = ?auto_862495 ?auto_862500 ) ) ( not ( = ?auto_862495 ?auto_862501 ) ) ( not ( = ?auto_862495 ?auto_862502 ) ) ( not ( = ?auto_862495 ?auto_862503 ) ) ( not ( = ?auto_862495 ?auto_862504 ) ) ( not ( = ?auto_862495 ?auto_862505 ) ) ( not ( = ?auto_862495 ?auto_862506 ) ) ( not ( = ?auto_862495 ?auto_862507 ) ) ( not ( = ?auto_862495 ?auto_862508 ) ) ( not ( = ?auto_862496 ?auto_862497 ) ) ( not ( = ?auto_862496 ?auto_862498 ) ) ( not ( = ?auto_862496 ?auto_862499 ) ) ( not ( = ?auto_862496 ?auto_862500 ) ) ( not ( = ?auto_862496 ?auto_862501 ) ) ( not ( = ?auto_862496 ?auto_862502 ) ) ( not ( = ?auto_862496 ?auto_862503 ) ) ( not ( = ?auto_862496 ?auto_862504 ) ) ( not ( = ?auto_862496 ?auto_862505 ) ) ( not ( = ?auto_862496 ?auto_862506 ) ) ( not ( = ?auto_862496 ?auto_862507 ) ) ( not ( = ?auto_862496 ?auto_862508 ) ) ( not ( = ?auto_862497 ?auto_862498 ) ) ( not ( = ?auto_862497 ?auto_862499 ) ) ( not ( = ?auto_862497 ?auto_862500 ) ) ( not ( = ?auto_862497 ?auto_862501 ) ) ( not ( = ?auto_862497 ?auto_862502 ) ) ( not ( = ?auto_862497 ?auto_862503 ) ) ( not ( = ?auto_862497 ?auto_862504 ) ) ( not ( = ?auto_862497 ?auto_862505 ) ) ( not ( = ?auto_862497 ?auto_862506 ) ) ( not ( = ?auto_862497 ?auto_862507 ) ) ( not ( = ?auto_862497 ?auto_862508 ) ) ( not ( = ?auto_862498 ?auto_862499 ) ) ( not ( = ?auto_862498 ?auto_862500 ) ) ( not ( = ?auto_862498 ?auto_862501 ) ) ( not ( = ?auto_862498 ?auto_862502 ) ) ( not ( = ?auto_862498 ?auto_862503 ) ) ( not ( = ?auto_862498 ?auto_862504 ) ) ( not ( = ?auto_862498 ?auto_862505 ) ) ( not ( = ?auto_862498 ?auto_862506 ) ) ( not ( = ?auto_862498 ?auto_862507 ) ) ( not ( = ?auto_862498 ?auto_862508 ) ) ( not ( = ?auto_862499 ?auto_862500 ) ) ( not ( = ?auto_862499 ?auto_862501 ) ) ( not ( = ?auto_862499 ?auto_862502 ) ) ( not ( = ?auto_862499 ?auto_862503 ) ) ( not ( = ?auto_862499 ?auto_862504 ) ) ( not ( = ?auto_862499 ?auto_862505 ) ) ( not ( = ?auto_862499 ?auto_862506 ) ) ( not ( = ?auto_862499 ?auto_862507 ) ) ( not ( = ?auto_862499 ?auto_862508 ) ) ( not ( = ?auto_862500 ?auto_862501 ) ) ( not ( = ?auto_862500 ?auto_862502 ) ) ( not ( = ?auto_862500 ?auto_862503 ) ) ( not ( = ?auto_862500 ?auto_862504 ) ) ( not ( = ?auto_862500 ?auto_862505 ) ) ( not ( = ?auto_862500 ?auto_862506 ) ) ( not ( = ?auto_862500 ?auto_862507 ) ) ( not ( = ?auto_862500 ?auto_862508 ) ) ( not ( = ?auto_862501 ?auto_862502 ) ) ( not ( = ?auto_862501 ?auto_862503 ) ) ( not ( = ?auto_862501 ?auto_862504 ) ) ( not ( = ?auto_862501 ?auto_862505 ) ) ( not ( = ?auto_862501 ?auto_862506 ) ) ( not ( = ?auto_862501 ?auto_862507 ) ) ( not ( = ?auto_862501 ?auto_862508 ) ) ( not ( = ?auto_862502 ?auto_862503 ) ) ( not ( = ?auto_862502 ?auto_862504 ) ) ( not ( = ?auto_862502 ?auto_862505 ) ) ( not ( = ?auto_862502 ?auto_862506 ) ) ( not ( = ?auto_862502 ?auto_862507 ) ) ( not ( = ?auto_862502 ?auto_862508 ) ) ( not ( = ?auto_862503 ?auto_862504 ) ) ( not ( = ?auto_862503 ?auto_862505 ) ) ( not ( = ?auto_862503 ?auto_862506 ) ) ( not ( = ?auto_862503 ?auto_862507 ) ) ( not ( = ?auto_862503 ?auto_862508 ) ) ( not ( = ?auto_862504 ?auto_862505 ) ) ( not ( = ?auto_862504 ?auto_862506 ) ) ( not ( = ?auto_862504 ?auto_862507 ) ) ( not ( = ?auto_862504 ?auto_862508 ) ) ( not ( = ?auto_862505 ?auto_862506 ) ) ( not ( = ?auto_862505 ?auto_862507 ) ) ( not ( = ?auto_862505 ?auto_862508 ) ) ( not ( = ?auto_862506 ?auto_862507 ) ) ( not ( = ?auto_862506 ?auto_862508 ) ) ( not ( = ?auto_862507 ?auto_862508 ) ) ( ON ?auto_862507 ?auto_862508 ) ( ON ?auto_862506 ?auto_862507 ) ( ON ?auto_862505 ?auto_862506 ) ( ON ?auto_862504 ?auto_862505 ) ( ON ?auto_862503 ?auto_862504 ) ( ON ?auto_862502 ?auto_862503 ) ( ON ?auto_862501 ?auto_862502 ) ( ON ?auto_862500 ?auto_862501 ) ( ON ?auto_862499 ?auto_862500 ) ( ON ?auto_862498 ?auto_862499 ) ( ON ?auto_862497 ?auto_862498 ) ( ON ?auto_862496 ?auto_862497 ) ( CLEAR ?auto_862494 ) ( ON ?auto_862495 ?auto_862496 ) ( CLEAR ?auto_862495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_862491 ?auto_862492 ?auto_862493 ?auto_862494 ?auto_862495 )
      ( MAKE-18PILE ?auto_862491 ?auto_862492 ?auto_862493 ?auto_862494 ?auto_862495 ?auto_862496 ?auto_862497 ?auto_862498 ?auto_862499 ?auto_862500 ?auto_862501 ?auto_862502 ?auto_862503 ?auto_862504 ?auto_862505 ?auto_862506 ?auto_862507 ?auto_862508 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862527 - BLOCK
      ?auto_862528 - BLOCK
      ?auto_862529 - BLOCK
      ?auto_862530 - BLOCK
      ?auto_862531 - BLOCK
      ?auto_862532 - BLOCK
      ?auto_862533 - BLOCK
      ?auto_862534 - BLOCK
      ?auto_862535 - BLOCK
      ?auto_862536 - BLOCK
      ?auto_862537 - BLOCK
      ?auto_862538 - BLOCK
      ?auto_862539 - BLOCK
      ?auto_862540 - BLOCK
      ?auto_862541 - BLOCK
      ?auto_862542 - BLOCK
      ?auto_862543 - BLOCK
      ?auto_862544 - BLOCK
    )
    :vars
    (
      ?auto_862545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862544 ?auto_862545 ) ( ON-TABLE ?auto_862527 ) ( ON ?auto_862528 ?auto_862527 ) ( ON ?auto_862529 ?auto_862528 ) ( not ( = ?auto_862527 ?auto_862528 ) ) ( not ( = ?auto_862527 ?auto_862529 ) ) ( not ( = ?auto_862527 ?auto_862530 ) ) ( not ( = ?auto_862527 ?auto_862531 ) ) ( not ( = ?auto_862527 ?auto_862532 ) ) ( not ( = ?auto_862527 ?auto_862533 ) ) ( not ( = ?auto_862527 ?auto_862534 ) ) ( not ( = ?auto_862527 ?auto_862535 ) ) ( not ( = ?auto_862527 ?auto_862536 ) ) ( not ( = ?auto_862527 ?auto_862537 ) ) ( not ( = ?auto_862527 ?auto_862538 ) ) ( not ( = ?auto_862527 ?auto_862539 ) ) ( not ( = ?auto_862527 ?auto_862540 ) ) ( not ( = ?auto_862527 ?auto_862541 ) ) ( not ( = ?auto_862527 ?auto_862542 ) ) ( not ( = ?auto_862527 ?auto_862543 ) ) ( not ( = ?auto_862527 ?auto_862544 ) ) ( not ( = ?auto_862527 ?auto_862545 ) ) ( not ( = ?auto_862528 ?auto_862529 ) ) ( not ( = ?auto_862528 ?auto_862530 ) ) ( not ( = ?auto_862528 ?auto_862531 ) ) ( not ( = ?auto_862528 ?auto_862532 ) ) ( not ( = ?auto_862528 ?auto_862533 ) ) ( not ( = ?auto_862528 ?auto_862534 ) ) ( not ( = ?auto_862528 ?auto_862535 ) ) ( not ( = ?auto_862528 ?auto_862536 ) ) ( not ( = ?auto_862528 ?auto_862537 ) ) ( not ( = ?auto_862528 ?auto_862538 ) ) ( not ( = ?auto_862528 ?auto_862539 ) ) ( not ( = ?auto_862528 ?auto_862540 ) ) ( not ( = ?auto_862528 ?auto_862541 ) ) ( not ( = ?auto_862528 ?auto_862542 ) ) ( not ( = ?auto_862528 ?auto_862543 ) ) ( not ( = ?auto_862528 ?auto_862544 ) ) ( not ( = ?auto_862528 ?auto_862545 ) ) ( not ( = ?auto_862529 ?auto_862530 ) ) ( not ( = ?auto_862529 ?auto_862531 ) ) ( not ( = ?auto_862529 ?auto_862532 ) ) ( not ( = ?auto_862529 ?auto_862533 ) ) ( not ( = ?auto_862529 ?auto_862534 ) ) ( not ( = ?auto_862529 ?auto_862535 ) ) ( not ( = ?auto_862529 ?auto_862536 ) ) ( not ( = ?auto_862529 ?auto_862537 ) ) ( not ( = ?auto_862529 ?auto_862538 ) ) ( not ( = ?auto_862529 ?auto_862539 ) ) ( not ( = ?auto_862529 ?auto_862540 ) ) ( not ( = ?auto_862529 ?auto_862541 ) ) ( not ( = ?auto_862529 ?auto_862542 ) ) ( not ( = ?auto_862529 ?auto_862543 ) ) ( not ( = ?auto_862529 ?auto_862544 ) ) ( not ( = ?auto_862529 ?auto_862545 ) ) ( not ( = ?auto_862530 ?auto_862531 ) ) ( not ( = ?auto_862530 ?auto_862532 ) ) ( not ( = ?auto_862530 ?auto_862533 ) ) ( not ( = ?auto_862530 ?auto_862534 ) ) ( not ( = ?auto_862530 ?auto_862535 ) ) ( not ( = ?auto_862530 ?auto_862536 ) ) ( not ( = ?auto_862530 ?auto_862537 ) ) ( not ( = ?auto_862530 ?auto_862538 ) ) ( not ( = ?auto_862530 ?auto_862539 ) ) ( not ( = ?auto_862530 ?auto_862540 ) ) ( not ( = ?auto_862530 ?auto_862541 ) ) ( not ( = ?auto_862530 ?auto_862542 ) ) ( not ( = ?auto_862530 ?auto_862543 ) ) ( not ( = ?auto_862530 ?auto_862544 ) ) ( not ( = ?auto_862530 ?auto_862545 ) ) ( not ( = ?auto_862531 ?auto_862532 ) ) ( not ( = ?auto_862531 ?auto_862533 ) ) ( not ( = ?auto_862531 ?auto_862534 ) ) ( not ( = ?auto_862531 ?auto_862535 ) ) ( not ( = ?auto_862531 ?auto_862536 ) ) ( not ( = ?auto_862531 ?auto_862537 ) ) ( not ( = ?auto_862531 ?auto_862538 ) ) ( not ( = ?auto_862531 ?auto_862539 ) ) ( not ( = ?auto_862531 ?auto_862540 ) ) ( not ( = ?auto_862531 ?auto_862541 ) ) ( not ( = ?auto_862531 ?auto_862542 ) ) ( not ( = ?auto_862531 ?auto_862543 ) ) ( not ( = ?auto_862531 ?auto_862544 ) ) ( not ( = ?auto_862531 ?auto_862545 ) ) ( not ( = ?auto_862532 ?auto_862533 ) ) ( not ( = ?auto_862532 ?auto_862534 ) ) ( not ( = ?auto_862532 ?auto_862535 ) ) ( not ( = ?auto_862532 ?auto_862536 ) ) ( not ( = ?auto_862532 ?auto_862537 ) ) ( not ( = ?auto_862532 ?auto_862538 ) ) ( not ( = ?auto_862532 ?auto_862539 ) ) ( not ( = ?auto_862532 ?auto_862540 ) ) ( not ( = ?auto_862532 ?auto_862541 ) ) ( not ( = ?auto_862532 ?auto_862542 ) ) ( not ( = ?auto_862532 ?auto_862543 ) ) ( not ( = ?auto_862532 ?auto_862544 ) ) ( not ( = ?auto_862532 ?auto_862545 ) ) ( not ( = ?auto_862533 ?auto_862534 ) ) ( not ( = ?auto_862533 ?auto_862535 ) ) ( not ( = ?auto_862533 ?auto_862536 ) ) ( not ( = ?auto_862533 ?auto_862537 ) ) ( not ( = ?auto_862533 ?auto_862538 ) ) ( not ( = ?auto_862533 ?auto_862539 ) ) ( not ( = ?auto_862533 ?auto_862540 ) ) ( not ( = ?auto_862533 ?auto_862541 ) ) ( not ( = ?auto_862533 ?auto_862542 ) ) ( not ( = ?auto_862533 ?auto_862543 ) ) ( not ( = ?auto_862533 ?auto_862544 ) ) ( not ( = ?auto_862533 ?auto_862545 ) ) ( not ( = ?auto_862534 ?auto_862535 ) ) ( not ( = ?auto_862534 ?auto_862536 ) ) ( not ( = ?auto_862534 ?auto_862537 ) ) ( not ( = ?auto_862534 ?auto_862538 ) ) ( not ( = ?auto_862534 ?auto_862539 ) ) ( not ( = ?auto_862534 ?auto_862540 ) ) ( not ( = ?auto_862534 ?auto_862541 ) ) ( not ( = ?auto_862534 ?auto_862542 ) ) ( not ( = ?auto_862534 ?auto_862543 ) ) ( not ( = ?auto_862534 ?auto_862544 ) ) ( not ( = ?auto_862534 ?auto_862545 ) ) ( not ( = ?auto_862535 ?auto_862536 ) ) ( not ( = ?auto_862535 ?auto_862537 ) ) ( not ( = ?auto_862535 ?auto_862538 ) ) ( not ( = ?auto_862535 ?auto_862539 ) ) ( not ( = ?auto_862535 ?auto_862540 ) ) ( not ( = ?auto_862535 ?auto_862541 ) ) ( not ( = ?auto_862535 ?auto_862542 ) ) ( not ( = ?auto_862535 ?auto_862543 ) ) ( not ( = ?auto_862535 ?auto_862544 ) ) ( not ( = ?auto_862535 ?auto_862545 ) ) ( not ( = ?auto_862536 ?auto_862537 ) ) ( not ( = ?auto_862536 ?auto_862538 ) ) ( not ( = ?auto_862536 ?auto_862539 ) ) ( not ( = ?auto_862536 ?auto_862540 ) ) ( not ( = ?auto_862536 ?auto_862541 ) ) ( not ( = ?auto_862536 ?auto_862542 ) ) ( not ( = ?auto_862536 ?auto_862543 ) ) ( not ( = ?auto_862536 ?auto_862544 ) ) ( not ( = ?auto_862536 ?auto_862545 ) ) ( not ( = ?auto_862537 ?auto_862538 ) ) ( not ( = ?auto_862537 ?auto_862539 ) ) ( not ( = ?auto_862537 ?auto_862540 ) ) ( not ( = ?auto_862537 ?auto_862541 ) ) ( not ( = ?auto_862537 ?auto_862542 ) ) ( not ( = ?auto_862537 ?auto_862543 ) ) ( not ( = ?auto_862537 ?auto_862544 ) ) ( not ( = ?auto_862537 ?auto_862545 ) ) ( not ( = ?auto_862538 ?auto_862539 ) ) ( not ( = ?auto_862538 ?auto_862540 ) ) ( not ( = ?auto_862538 ?auto_862541 ) ) ( not ( = ?auto_862538 ?auto_862542 ) ) ( not ( = ?auto_862538 ?auto_862543 ) ) ( not ( = ?auto_862538 ?auto_862544 ) ) ( not ( = ?auto_862538 ?auto_862545 ) ) ( not ( = ?auto_862539 ?auto_862540 ) ) ( not ( = ?auto_862539 ?auto_862541 ) ) ( not ( = ?auto_862539 ?auto_862542 ) ) ( not ( = ?auto_862539 ?auto_862543 ) ) ( not ( = ?auto_862539 ?auto_862544 ) ) ( not ( = ?auto_862539 ?auto_862545 ) ) ( not ( = ?auto_862540 ?auto_862541 ) ) ( not ( = ?auto_862540 ?auto_862542 ) ) ( not ( = ?auto_862540 ?auto_862543 ) ) ( not ( = ?auto_862540 ?auto_862544 ) ) ( not ( = ?auto_862540 ?auto_862545 ) ) ( not ( = ?auto_862541 ?auto_862542 ) ) ( not ( = ?auto_862541 ?auto_862543 ) ) ( not ( = ?auto_862541 ?auto_862544 ) ) ( not ( = ?auto_862541 ?auto_862545 ) ) ( not ( = ?auto_862542 ?auto_862543 ) ) ( not ( = ?auto_862542 ?auto_862544 ) ) ( not ( = ?auto_862542 ?auto_862545 ) ) ( not ( = ?auto_862543 ?auto_862544 ) ) ( not ( = ?auto_862543 ?auto_862545 ) ) ( not ( = ?auto_862544 ?auto_862545 ) ) ( ON ?auto_862543 ?auto_862544 ) ( ON ?auto_862542 ?auto_862543 ) ( ON ?auto_862541 ?auto_862542 ) ( ON ?auto_862540 ?auto_862541 ) ( ON ?auto_862539 ?auto_862540 ) ( ON ?auto_862538 ?auto_862539 ) ( ON ?auto_862537 ?auto_862538 ) ( ON ?auto_862536 ?auto_862537 ) ( ON ?auto_862535 ?auto_862536 ) ( ON ?auto_862534 ?auto_862535 ) ( ON ?auto_862533 ?auto_862534 ) ( ON ?auto_862532 ?auto_862533 ) ( ON ?auto_862531 ?auto_862532 ) ( CLEAR ?auto_862529 ) ( ON ?auto_862530 ?auto_862531 ) ( CLEAR ?auto_862530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_862527 ?auto_862528 ?auto_862529 ?auto_862530 )
      ( MAKE-18PILE ?auto_862527 ?auto_862528 ?auto_862529 ?auto_862530 ?auto_862531 ?auto_862532 ?auto_862533 ?auto_862534 ?auto_862535 ?auto_862536 ?auto_862537 ?auto_862538 ?auto_862539 ?auto_862540 ?auto_862541 ?auto_862542 ?auto_862543 ?auto_862544 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862564 - BLOCK
      ?auto_862565 - BLOCK
      ?auto_862566 - BLOCK
      ?auto_862567 - BLOCK
      ?auto_862568 - BLOCK
      ?auto_862569 - BLOCK
      ?auto_862570 - BLOCK
      ?auto_862571 - BLOCK
      ?auto_862572 - BLOCK
      ?auto_862573 - BLOCK
      ?auto_862574 - BLOCK
      ?auto_862575 - BLOCK
      ?auto_862576 - BLOCK
      ?auto_862577 - BLOCK
      ?auto_862578 - BLOCK
      ?auto_862579 - BLOCK
      ?auto_862580 - BLOCK
      ?auto_862581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_862581 ) ( ON-TABLE ?auto_862564 ) ( ON ?auto_862565 ?auto_862564 ) ( ON ?auto_862566 ?auto_862565 ) ( not ( = ?auto_862564 ?auto_862565 ) ) ( not ( = ?auto_862564 ?auto_862566 ) ) ( not ( = ?auto_862564 ?auto_862567 ) ) ( not ( = ?auto_862564 ?auto_862568 ) ) ( not ( = ?auto_862564 ?auto_862569 ) ) ( not ( = ?auto_862564 ?auto_862570 ) ) ( not ( = ?auto_862564 ?auto_862571 ) ) ( not ( = ?auto_862564 ?auto_862572 ) ) ( not ( = ?auto_862564 ?auto_862573 ) ) ( not ( = ?auto_862564 ?auto_862574 ) ) ( not ( = ?auto_862564 ?auto_862575 ) ) ( not ( = ?auto_862564 ?auto_862576 ) ) ( not ( = ?auto_862564 ?auto_862577 ) ) ( not ( = ?auto_862564 ?auto_862578 ) ) ( not ( = ?auto_862564 ?auto_862579 ) ) ( not ( = ?auto_862564 ?auto_862580 ) ) ( not ( = ?auto_862564 ?auto_862581 ) ) ( not ( = ?auto_862565 ?auto_862566 ) ) ( not ( = ?auto_862565 ?auto_862567 ) ) ( not ( = ?auto_862565 ?auto_862568 ) ) ( not ( = ?auto_862565 ?auto_862569 ) ) ( not ( = ?auto_862565 ?auto_862570 ) ) ( not ( = ?auto_862565 ?auto_862571 ) ) ( not ( = ?auto_862565 ?auto_862572 ) ) ( not ( = ?auto_862565 ?auto_862573 ) ) ( not ( = ?auto_862565 ?auto_862574 ) ) ( not ( = ?auto_862565 ?auto_862575 ) ) ( not ( = ?auto_862565 ?auto_862576 ) ) ( not ( = ?auto_862565 ?auto_862577 ) ) ( not ( = ?auto_862565 ?auto_862578 ) ) ( not ( = ?auto_862565 ?auto_862579 ) ) ( not ( = ?auto_862565 ?auto_862580 ) ) ( not ( = ?auto_862565 ?auto_862581 ) ) ( not ( = ?auto_862566 ?auto_862567 ) ) ( not ( = ?auto_862566 ?auto_862568 ) ) ( not ( = ?auto_862566 ?auto_862569 ) ) ( not ( = ?auto_862566 ?auto_862570 ) ) ( not ( = ?auto_862566 ?auto_862571 ) ) ( not ( = ?auto_862566 ?auto_862572 ) ) ( not ( = ?auto_862566 ?auto_862573 ) ) ( not ( = ?auto_862566 ?auto_862574 ) ) ( not ( = ?auto_862566 ?auto_862575 ) ) ( not ( = ?auto_862566 ?auto_862576 ) ) ( not ( = ?auto_862566 ?auto_862577 ) ) ( not ( = ?auto_862566 ?auto_862578 ) ) ( not ( = ?auto_862566 ?auto_862579 ) ) ( not ( = ?auto_862566 ?auto_862580 ) ) ( not ( = ?auto_862566 ?auto_862581 ) ) ( not ( = ?auto_862567 ?auto_862568 ) ) ( not ( = ?auto_862567 ?auto_862569 ) ) ( not ( = ?auto_862567 ?auto_862570 ) ) ( not ( = ?auto_862567 ?auto_862571 ) ) ( not ( = ?auto_862567 ?auto_862572 ) ) ( not ( = ?auto_862567 ?auto_862573 ) ) ( not ( = ?auto_862567 ?auto_862574 ) ) ( not ( = ?auto_862567 ?auto_862575 ) ) ( not ( = ?auto_862567 ?auto_862576 ) ) ( not ( = ?auto_862567 ?auto_862577 ) ) ( not ( = ?auto_862567 ?auto_862578 ) ) ( not ( = ?auto_862567 ?auto_862579 ) ) ( not ( = ?auto_862567 ?auto_862580 ) ) ( not ( = ?auto_862567 ?auto_862581 ) ) ( not ( = ?auto_862568 ?auto_862569 ) ) ( not ( = ?auto_862568 ?auto_862570 ) ) ( not ( = ?auto_862568 ?auto_862571 ) ) ( not ( = ?auto_862568 ?auto_862572 ) ) ( not ( = ?auto_862568 ?auto_862573 ) ) ( not ( = ?auto_862568 ?auto_862574 ) ) ( not ( = ?auto_862568 ?auto_862575 ) ) ( not ( = ?auto_862568 ?auto_862576 ) ) ( not ( = ?auto_862568 ?auto_862577 ) ) ( not ( = ?auto_862568 ?auto_862578 ) ) ( not ( = ?auto_862568 ?auto_862579 ) ) ( not ( = ?auto_862568 ?auto_862580 ) ) ( not ( = ?auto_862568 ?auto_862581 ) ) ( not ( = ?auto_862569 ?auto_862570 ) ) ( not ( = ?auto_862569 ?auto_862571 ) ) ( not ( = ?auto_862569 ?auto_862572 ) ) ( not ( = ?auto_862569 ?auto_862573 ) ) ( not ( = ?auto_862569 ?auto_862574 ) ) ( not ( = ?auto_862569 ?auto_862575 ) ) ( not ( = ?auto_862569 ?auto_862576 ) ) ( not ( = ?auto_862569 ?auto_862577 ) ) ( not ( = ?auto_862569 ?auto_862578 ) ) ( not ( = ?auto_862569 ?auto_862579 ) ) ( not ( = ?auto_862569 ?auto_862580 ) ) ( not ( = ?auto_862569 ?auto_862581 ) ) ( not ( = ?auto_862570 ?auto_862571 ) ) ( not ( = ?auto_862570 ?auto_862572 ) ) ( not ( = ?auto_862570 ?auto_862573 ) ) ( not ( = ?auto_862570 ?auto_862574 ) ) ( not ( = ?auto_862570 ?auto_862575 ) ) ( not ( = ?auto_862570 ?auto_862576 ) ) ( not ( = ?auto_862570 ?auto_862577 ) ) ( not ( = ?auto_862570 ?auto_862578 ) ) ( not ( = ?auto_862570 ?auto_862579 ) ) ( not ( = ?auto_862570 ?auto_862580 ) ) ( not ( = ?auto_862570 ?auto_862581 ) ) ( not ( = ?auto_862571 ?auto_862572 ) ) ( not ( = ?auto_862571 ?auto_862573 ) ) ( not ( = ?auto_862571 ?auto_862574 ) ) ( not ( = ?auto_862571 ?auto_862575 ) ) ( not ( = ?auto_862571 ?auto_862576 ) ) ( not ( = ?auto_862571 ?auto_862577 ) ) ( not ( = ?auto_862571 ?auto_862578 ) ) ( not ( = ?auto_862571 ?auto_862579 ) ) ( not ( = ?auto_862571 ?auto_862580 ) ) ( not ( = ?auto_862571 ?auto_862581 ) ) ( not ( = ?auto_862572 ?auto_862573 ) ) ( not ( = ?auto_862572 ?auto_862574 ) ) ( not ( = ?auto_862572 ?auto_862575 ) ) ( not ( = ?auto_862572 ?auto_862576 ) ) ( not ( = ?auto_862572 ?auto_862577 ) ) ( not ( = ?auto_862572 ?auto_862578 ) ) ( not ( = ?auto_862572 ?auto_862579 ) ) ( not ( = ?auto_862572 ?auto_862580 ) ) ( not ( = ?auto_862572 ?auto_862581 ) ) ( not ( = ?auto_862573 ?auto_862574 ) ) ( not ( = ?auto_862573 ?auto_862575 ) ) ( not ( = ?auto_862573 ?auto_862576 ) ) ( not ( = ?auto_862573 ?auto_862577 ) ) ( not ( = ?auto_862573 ?auto_862578 ) ) ( not ( = ?auto_862573 ?auto_862579 ) ) ( not ( = ?auto_862573 ?auto_862580 ) ) ( not ( = ?auto_862573 ?auto_862581 ) ) ( not ( = ?auto_862574 ?auto_862575 ) ) ( not ( = ?auto_862574 ?auto_862576 ) ) ( not ( = ?auto_862574 ?auto_862577 ) ) ( not ( = ?auto_862574 ?auto_862578 ) ) ( not ( = ?auto_862574 ?auto_862579 ) ) ( not ( = ?auto_862574 ?auto_862580 ) ) ( not ( = ?auto_862574 ?auto_862581 ) ) ( not ( = ?auto_862575 ?auto_862576 ) ) ( not ( = ?auto_862575 ?auto_862577 ) ) ( not ( = ?auto_862575 ?auto_862578 ) ) ( not ( = ?auto_862575 ?auto_862579 ) ) ( not ( = ?auto_862575 ?auto_862580 ) ) ( not ( = ?auto_862575 ?auto_862581 ) ) ( not ( = ?auto_862576 ?auto_862577 ) ) ( not ( = ?auto_862576 ?auto_862578 ) ) ( not ( = ?auto_862576 ?auto_862579 ) ) ( not ( = ?auto_862576 ?auto_862580 ) ) ( not ( = ?auto_862576 ?auto_862581 ) ) ( not ( = ?auto_862577 ?auto_862578 ) ) ( not ( = ?auto_862577 ?auto_862579 ) ) ( not ( = ?auto_862577 ?auto_862580 ) ) ( not ( = ?auto_862577 ?auto_862581 ) ) ( not ( = ?auto_862578 ?auto_862579 ) ) ( not ( = ?auto_862578 ?auto_862580 ) ) ( not ( = ?auto_862578 ?auto_862581 ) ) ( not ( = ?auto_862579 ?auto_862580 ) ) ( not ( = ?auto_862579 ?auto_862581 ) ) ( not ( = ?auto_862580 ?auto_862581 ) ) ( ON ?auto_862580 ?auto_862581 ) ( ON ?auto_862579 ?auto_862580 ) ( ON ?auto_862578 ?auto_862579 ) ( ON ?auto_862577 ?auto_862578 ) ( ON ?auto_862576 ?auto_862577 ) ( ON ?auto_862575 ?auto_862576 ) ( ON ?auto_862574 ?auto_862575 ) ( ON ?auto_862573 ?auto_862574 ) ( ON ?auto_862572 ?auto_862573 ) ( ON ?auto_862571 ?auto_862572 ) ( ON ?auto_862570 ?auto_862571 ) ( ON ?auto_862569 ?auto_862570 ) ( ON ?auto_862568 ?auto_862569 ) ( CLEAR ?auto_862566 ) ( ON ?auto_862567 ?auto_862568 ) ( CLEAR ?auto_862567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_862564 ?auto_862565 ?auto_862566 ?auto_862567 )
      ( MAKE-18PILE ?auto_862564 ?auto_862565 ?auto_862566 ?auto_862567 ?auto_862568 ?auto_862569 ?auto_862570 ?auto_862571 ?auto_862572 ?auto_862573 ?auto_862574 ?auto_862575 ?auto_862576 ?auto_862577 ?auto_862578 ?auto_862579 ?auto_862580 ?auto_862581 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862600 - BLOCK
      ?auto_862601 - BLOCK
      ?auto_862602 - BLOCK
      ?auto_862603 - BLOCK
      ?auto_862604 - BLOCK
      ?auto_862605 - BLOCK
      ?auto_862606 - BLOCK
      ?auto_862607 - BLOCK
      ?auto_862608 - BLOCK
      ?auto_862609 - BLOCK
      ?auto_862610 - BLOCK
      ?auto_862611 - BLOCK
      ?auto_862612 - BLOCK
      ?auto_862613 - BLOCK
      ?auto_862614 - BLOCK
      ?auto_862615 - BLOCK
      ?auto_862616 - BLOCK
      ?auto_862617 - BLOCK
    )
    :vars
    (
      ?auto_862618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862617 ?auto_862618 ) ( ON-TABLE ?auto_862600 ) ( ON ?auto_862601 ?auto_862600 ) ( not ( = ?auto_862600 ?auto_862601 ) ) ( not ( = ?auto_862600 ?auto_862602 ) ) ( not ( = ?auto_862600 ?auto_862603 ) ) ( not ( = ?auto_862600 ?auto_862604 ) ) ( not ( = ?auto_862600 ?auto_862605 ) ) ( not ( = ?auto_862600 ?auto_862606 ) ) ( not ( = ?auto_862600 ?auto_862607 ) ) ( not ( = ?auto_862600 ?auto_862608 ) ) ( not ( = ?auto_862600 ?auto_862609 ) ) ( not ( = ?auto_862600 ?auto_862610 ) ) ( not ( = ?auto_862600 ?auto_862611 ) ) ( not ( = ?auto_862600 ?auto_862612 ) ) ( not ( = ?auto_862600 ?auto_862613 ) ) ( not ( = ?auto_862600 ?auto_862614 ) ) ( not ( = ?auto_862600 ?auto_862615 ) ) ( not ( = ?auto_862600 ?auto_862616 ) ) ( not ( = ?auto_862600 ?auto_862617 ) ) ( not ( = ?auto_862600 ?auto_862618 ) ) ( not ( = ?auto_862601 ?auto_862602 ) ) ( not ( = ?auto_862601 ?auto_862603 ) ) ( not ( = ?auto_862601 ?auto_862604 ) ) ( not ( = ?auto_862601 ?auto_862605 ) ) ( not ( = ?auto_862601 ?auto_862606 ) ) ( not ( = ?auto_862601 ?auto_862607 ) ) ( not ( = ?auto_862601 ?auto_862608 ) ) ( not ( = ?auto_862601 ?auto_862609 ) ) ( not ( = ?auto_862601 ?auto_862610 ) ) ( not ( = ?auto_862601 ?auto_862611 ) ) ( not ( = ?auto_862601 ?auto_862612 ) ) ( not ( = ?auto_862601 ?auto_862613 ) ) ( not ( = ?auto_862601 ?auto_862614 ) ) ( not ( = ?auto_862601 ?auto_862615 ) ) ( not ( = ?auto_862601 ?auto_862616 ) ) ( not ( = ?auto_862601 ?auto_862617 ) ) ( not ( = ?auto_862601 ?auto_862618 ) ) ( not ( = ?auto_862602 ?auto_862603 ) ) ( not ( = ?auto_862602 ?auto_862604 ) ) ( not ( = ?auto_862602 ?auto_862605 ) ) ( not ( = ?auto_862602 ?auto_862606 ) ) ( not ( = ?auto_862602 ?auto_862607 ) ) ( not ( = ?auto_862602 ?auto_862608 ) ) ( not ( = ?auto_862602 ?auto_862609 ) ) ( not ( = ?auto_862602 ?auto_862610 ) ) ( not ( = ?auto_862602 ?auto_862611 ) ) ( not ( = ?auto_862602 ?auto_862612 ) ) ( not ( = ?auto_862602 ?auto_862613 ) ) ( not ( = ?auto_862602 ?auto_862614 ) ) ( not ( = ?auto_862602 ?auto_862615 ) ) ( not ( = ?auto_862602 ?auto_862616 ) ) ( not ( = ?auto_862602 ?auto_862617 ) ) ( not ( = ?auto_862602 ?auto_862618 ) ) ( not ( = ?auto_862603 ?auto_862604 ) ) ( not ( = ?auto_862603 ?auto_862605 ) ) ( not ( = ?auto_862603 ?auto_862606 ) ) ( not ( = ?auto_862603 ?auto_862607 ) ) ( not ( = ?auto_862603 ?auto_862608 ) ) ( not ( = ?auto_862603 ?auto_862609 ) ) ( not ( = ?auto_862603 ?auto_862610 ) ) ( not ( = ?auto_862603 ?auto_862611 ) ) ( not ( = ?auto_862603 ?auto_862612 ) ) ( not ( = ?auto_862603 ?auto_862613 ) ) ( not ( = ?auto_862603 ?auto_862614 ) ) ( not ( = ?auto_862603 ?auto_862615 ) ) ( not ( = ?auto_862603 ?auto_862616 ) ) ( not ( = ?auto_862603 ?auto_862617 ) ) ( not ( = ?auto_862603 ?auto_862618 ) ) ( not ( = ?auto_862604 ?auto_862605 ) ) ( not ( = ?auto_862604 ?auto_862606 ) ) ( not ( = ?auto_862604 ?auto_862607 ) ) ( not ( = ?auto_862604 ?auto_862608 ) ) ( not ( = ?auto_862604 ?auto_862609 ) ) ( not ( = ?auto_862604 ?auto_862610 ) ) ( not ( = ?auto_862604 ?auto_862611 ) ) ( not ( = ?auto_862604 ?auto_862612 ) ) ( not ( = ?auto_862604 ?auto_862613 ) ) ( not ( = ?auto_862604 ?auto_862614 ) ) ( not ( = ?auto_862604 ?auto_862615 ) ) ( not ( = ?auto_862604 ?auto_862616 ) ) ( not ( = ?auto_862604 ?auto_862617 ) ) ( not ( = ?auto_862604 ?auto_862618 ) ) ( not ( = ?auto_862605 ?auto_862606 ) ) ( not ( = ?auto_862605 ?auto_862607 ) ) ( not ( = ?auto_862605 ?auto_862608 ) ) ( not ( = ?auto_862605 ?auto_862609 ) ) ( not ( = ?auto_862605 ?auto_862610 ) ) ( not ( = ?auto_862605 ?auto_862611 ) ) ( not ( = ?auto_862605 ?auto_862612 ) ) ( not ( = ?auto_862605 ?auto_862613 ) ) ( not ( = ?auto_862605 ?auto_862614 ) ) ( not ( = ?auto_862605 ?auto_862615 ) ) ( not ( = ?auto_862605 ?auto_862616 ) ) ( not ( = ?auto_862605 ?auto_862617 ) ) ( not ( = ?auto_862605 ?auto_862618 ) ) ( not ( = ?auto_862606 ?auto_862607 ) ) ( not ( = ?auto_862606 ?auto_862608 ) ) ( not ( = ?auto_862606 ?auto_862609 ) ) ( not ( = ?auto_862606 ?auto_862610 ) ) ( not ( = ?auto_862606 ?auto_862611 ) ) ( not ( = ?auto_862606 ?auto_862612 ) ) ( not ( = ?auto_862606 ?auto_862613 ) ) ( not ( = ?auto_862606 ?auto_862614 ) ) ( not ( = ?auto_862606 ?auto_862615 ) ) ( not ( = ?auto_862606 ?auto_862616 ) ) ( not ( = ?auto_862606 ?auto_862617 ) ) ( not ( = ?auto_862606 ?auto_862618 ) ) ( not ( = ?auto_862607 ?auto_862608 ) ) ( not ( = ?auto_862607 ?auto_862609 ) ) ( not ( = ?auto_862607 ?auto_862610 ) ) ( not ( = ?auto_862607 ?auto_862611 ) ) ( not ( = ?auto_862607 ?auto_862612 ) ) ( not ( = ?auto_862607 ?auto_862613 ) ) ( not ( = ?auto_862607 ?auto_862614 ) ) ( not ( = ?auto_862607 ?auto_862615 ) ) ( not ( = ?auto_862607 ?auto_862616 ) ) ( not ( = ?auto_862607 ?auto_862617 ) ) ( not ( = ?auto_862607 ?auto_862618 ) ) ( not ( = ?auto_862608 ?auto_862609 ) ) ( not ( = ?auto_862608 ?auto_862610 ) ) ( not ( = ?auto_862608 ?auto_862611 ) ) ( not ( = ?auto_862608 ?auto_862612 ) ) ( not ( = ?auto_862608 ?auto_862613 ) ) ( not ( = ?auto_862608 ?auto_862614 ) ) ( not ( = ?auto_862608 ?auto_862615 ) ) ( not ( = ?auto_862608 ?auto_862616 ) ) ( not ( = ?auto_862608 ?auto_862617 ) ) ( not ( = ?auto_862608 ?auto_862618 ) ) ( not ( = ?auto_862609 ?auto_862610 ) ) ( not ( = ?auto_862609 ?auto_862611 ) ) ( not ( = ?auto_862609 ?auto_862612 ) ) ( not ( = ?auto_862609 ?auto_862613 ) ) ( not ( = ?auto_862609 ?auto_862614 ) ) ( not ( = ?auto_862609 ?auto_862615 ) ) ( not ( = ?auto_862609 ?auto_862616 ) ) ( not ( = ?auto_862609 ?auto_862617 ) ) ( not ( = ?auto_862609 ?auto_862618 ) ) ( not ( = ?auto_862610 ?auto_862611 ) ) ( not ( = ?auto_862610 ?auto_862612 ) ) ( not ( = ?auto_862610 ?auto_862613 ) ) ( not ( = ?auto_862610 ?auto_862614 ) ) ( not ( = ?auto_862610 ?auto_862615 ) ) ( not ( = ?auto_862610 ?auto_862616 ) ) ( not ( = ?auto_862610 ?auto_862617 ) ) ( not ( = ?auto_862610 ?auto_862618 ) ) ( not ( = ?auto_862611 ?auto_862612 ) ) ( not ( = ?auto_862611 ?auto_862613 ) ) ( not ( = ?auto_862611 ?auto_862614 ) ) ( not ( = ?auto_862611 ?auto_862615 ) ) ( not ( = ?auto_862611 ?auto_862616 ) ) ( not ( = ?auto_862611 ?auto_862617 ) ) ( not ( = ?auto_862611 ?auto_862618 ) ) ( not ( = ?auto_862612 ?auto_862613 ) ) ( not ( = ?auto_862612 ?auto_862614 ) ) ( not ( = ?auto_862612 ?auto_862615 ) ) ( not ( = ?auto_862612 ?auto_862616 ) ) ( not ( = ?auto_862612 ?auto_862617 ) ) ( not ( = ?auto_862612 ?auto_862618 ) ) ( not ( = ?auto_862613 ?auto_862614 ) ) ( not ( = ?auto_862613 ?auto_862615 ) ) ( not ( = ?auto_862613 ?auto_862616 ) ) ( not ( = ?auto_862613 ?auto_862617 ) ) ( not ( = ?auto_862613 ?auto_862618 ) ) ( not ( = ?auto_862614 ?auto_862615 ) ) ( not ( = ?auto_862614 ?auto_862616 ) ) ( not ( = ?auto_862614 ?auto_862617 ) ) ( not ( = ?auto_862614 ?auto_862618 ) ) ( not ( = ?auto_862615 ?auto_862616 ) ) ( not ( = ?auto_862615 ?auto_862617 ) ) ( not ( = ?auto_862615 ?auto_862618 ) ) ( not ( = ?auto_862616 ?auto_862617 ) ) ( not ( = ?auto_862616 ?auto_862618 ) ) ( not ( = ?auto_862617 ?auto_862618 ) ) ( ON ?auto_862616 ?auto_862617 ) ( ON ?auto_862615 ?auto_862616 ) ( ON ?auto_862614 ?auto_862615 ) ( ON ?auto_862613 ?auto_862614 ) ( ON ?auto_862612 ?auto_862613 ) ( ON ?auto_862611 ?auto_862612 ) ( ON ?auto_862610 ?auto_862611 ) ( ON ?auto_862609 ?auto_862610 ) ( ON ?auto_862608 ?auto_862609 ) ( ON ?auto_862607 ?auto_862608 ) ( ON ?auto_862606 ?auto_862607 ) ( ON ?auto_862605 ?auto_862606 ) ( ON ?auto_862604 ?auto_862605 ) ( ON ?auto_862603 ?auto_862604 ) ( CLEAR ?auto_862601 ) ( ON ?auto_862602 ?auto_862603 ) ( CLEAR ?auto_862602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_862600 ?auto_862601 ?auto_862602 )
      ( MAKE-18PILE ?auto_862600 ?auto_862601 ?auto_862602 ?auto_862603 ?auto_862604 ?auto_862605 ?auto_862606 ?auto_862607 ?auto_862608 ?auto_862609 ?auto_862610 ?auto_862611 ?auto_862612 ?auto_862613 ?auto_862614 ?auto_862615 ?auto_862616 ?auto_862617 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862637 - BLOCK
      ?auto_862638 - BLOCK
      ?auto_862639 - BLOCK
      ?auto_862640 - BLOCK
      ?auto_862641 - BLOCK
      ?auto_862642 - BLOCK
      ?auto_862643 - BLOCK
      ?auto_862644 - BLOCK
      ?auto_862645 - BLOCK
      ?auto_862646 - BLOCK
      ?auto_862647 - BLOCK
      ?auto_862648 - BLOCK
      ?auto_862649 - BLOCK
      ?auto_862650 - BLOCK
      ?auto_862651 - BLOCK
      ?auto_862652 - BLOCK
      ?auto_862653 - BLOCK
      ?auto_862654 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_862654 ) ( ON-TABLE ?auto_862637 ) ( ON ?auto_862638 ?auto_862637 ) ( not ( = ?auto_862637 ?auto_862638 ) ) ( not ( = ?auto_862637 ?auto_862639 ) ) ( not ( = ?auto_862637 ?auto_862640 ) ) ( not ( = ?auto_862637 ?auto_862641 ) ) ( not ( = ?auto_862637 ?auto_862642 ) ) ( not ( = ?auto_862637 ?auto_862643 ) ) ( not ( = ?auto_862637 ?auto_862644 ) ) ( not ( = ?auto_862637 ?auto_862645 ) ) ( not ( = ?auto_862637 ?auto_862646 ) ) ( not ( = ?auto_862637 ?auto_862647 ) ) ( not ( = ?auto_862637 ?auto_862648 ) ) ( not ( = ?auto_862637 ?auto_862649 ) ) ( not ( = ?auto_862637 ?auto_862650 ) ) ( not ( = ?auto_862637 ?auto_862651 ) ) ( not ( = ?auto_862637 ?auto_862652 ) ) ( not ( = ?auto_862637 ?auto_862653 ) ) ( not ( = ?auto_862637 ?auto_862654 ) ) ( not ( = ?auto_862638 ?auto_862639 ) ) ( not ( = ?auto_862638 ?auto_862640 ) ) ( not ( = ?auto_862638 ?auto_862641 ) ) ( not ( = ?auto_862638 ?auto_862642 ) ) ( not ( = ?auto_862638 ?auto_862643 ) ) ( not ( = ?auto_862638 ?auto_862644 ) ) ( not ( = ?auto_862638 ?auto_862645 ) ) ( not ( = ?auto_862638 ?auto_862646 ) ) ( not ( = ?auto_862638 ?auto_862647 ) ) ( not ( = ?auto_862638 ?auto_862648 ) ) ( not ( = ?auto_862638 ?auto_862649 ) ) ( not ( = ?auto_862638 ?auto_862650 ) ) ( not ( = ?auto_862638 ?auto_862651 ) ) ( not ( = ?auto_862638 ?auto_862652 ) ) ( not ( = ?auto_862638 ?auto_862653 ) ) ( not ( = ?auto_862638 ?auto_862654 ) ) ( not ( = ?auto_862639 ?auto_862640 ) ) ( not ( = ?auto_862639 ?auto_862641 ) ) ( not ( = ?auto_862639 ?auto_862642 ) ) ( not ( = ?auto_862639 ?auto_862643 ) ) ( not ( = ?auto_862639 ?auto_862644 ) ) ( not ( = ?auto_862639 ?auto_862645 ) ) ( not ( = ?auto_862639 ?auto_862646 ) ) ( not ( = ?auto_862639 ?auto_862647 ) ) ( not ( = ?auto_862639 ?auto_862648 ) ) ( not ( = ?auto_862639 ?auto_862649 ) ) ( not ( = ?auto_862639 ?auto_862650 ) ) ( not ( = ?auto_862639 ?auto_862651 ) ) ( not ( = ?auto_862639 ?auto_862652 ) ) ( not ( = ?auto_862639 ?auto_862653 ) ) ( not ( = ?auto_862639 ?auto_862654 ) ) ( not ( = ?auto_862640 ?auto_862641 ) ) ( not ( = ?auto_862640 ?auto_862642 ) ) ( not ( = ?auto_862640 ?auto_862643 ) ) ( not ( = ?auto_862640 ?auto_862644 ) ) ( not ( = ?auto_862640 ?auto_862645 ) ) ( not ( = ?auto_862640 ?auto_862646 ) ) ( not ( = ?auto_862640 ?auto_862647 ) ) ( not ( = ?auto_862640 ?auto_862648 ) ) ( not ( = ?auto_862640 ?auto_862649 ) ) ( not ( = ?auto_862640 ?auto_862650 ) ) ( not ( = ?auto_862640 ?auto_862651 ) ) ( not ( = ?auto_862640 ?auto_862652 ) ) ( not ( = ?auto_862640 ?auto_862653 ) ) ( not ( = ?auto_862640 ?auto_862654 ) ) ( not ( = ?auto_862641 ?auto_862642 ) ) ( not ( = ?auto_862641 ?auto_862643 ) ) ( not ( = ?auto_862641 ?auto_862644 ) ) ( not ( = ?auto_862641 ?auto_862645 ) ) ( not ( = ?auto_862641 ?auto_862646 ) ) ( not ( = ?auto_862641 ?auto_862647 ) ) ( not ( = ?auto_862641 ?auto_862648 ) ) ( not ( = ?auto_862641 ?auto_862649 ) ) ( not ( = ?auto_862641 ?auto_862650 ) ) ( not ( = ?auto_862641 ?auto_862651 ) ) ( not ( = ?auto_862641 ?auto_862652 ) ) ( not ( = ?auto_862641 ?auto_862653 ) ) ( not ( = ?auto_862641 ?auto_862654 ) ) ( not ( = ?auto_862642 ?auto_862643 ) ) ( not ( = ?auto_862642 ?auto_862644 ) ) ( not ( = ?auto_862642 ?auto_862645 ) ) ( not ( = ?auto_862642 ?auto_862646 ) ) ( not ( = ?auto_862642 ?auto_862647 ) ) ( not ( = ?auto_862642 ?auto_862648 ) ) ( not ( = ?auto_862642 ?auto_862649 ) ) ( not ( = ?auto_862642 ?auto_862650 ) ) ( not ( = ?auto_862642 ?auto_862651 ) ) ( not ( = ?auto_862642 ?auto_862652 ) ) ( not ( = ?auto_862642 ?auto_862653 ) ) ( not ( = ?auto_862642 ?auto_862654 ) ) ( not ( = ?auto_862643 ?auto_862644 ) ) ( not ( = ?auto_862643 ?auto_862645 ) ) ( not ( = ?auto_862643 ?auto_862646 ) ) ( not ( = ?auto_862643 ?auto_862647 ) ) ( not ( = ?auto_862643 ?auto_862648 ) ) ( not ( = ?auto_862643 ?auto_862649 ) ) ( not ( = ?auto_862643 ?auto_862650 ) ) ( not ( = ?auto_862643 ?auto_862651 ) ) ( not ( = ?auto_862643 ?auto_862652 ) ) ( not ( = ?auto_862643 ?auto_862653 ) ) ( not ( = ?auto_862643 ?auto_862654 ) ) ( not ( = ?auto_862644 ?auto_862645 ) ) ( not ( = ?auto_862644 ?auto_862646 ) ) ( not ( = ?auto_862644 ?auto_862647 ) ) ( not ( = ?auto_862644 ?auto_862648 ) ) ( not ( = ?auto_862644 ?auto_862649 ) ) ( not ( = ?auto_862644 ?auto_862650 ) ) ( not ( = ?auto_862644 ?auto_862651 ) ) ( not ( = ?auto_862644 ?auto_862652 ) ) ( not ( = ?auto_862644 ?auto_862653 ) ) ( not ( = ?auto_862644 ?auto_862654 ) ) ( not ( = ?auto_862645 ?auto_862646 ) ) ( not ( = ?auto_862645 ?auto_862647 ) ) ( not ( = ?auto_862645 ?auto_862648 ) ) ( not ( = ?auto_862645 ?auto_862649 ) ) ( not ( = ?auto_862645 ?auto_862650 ) ) ( not ( = ?auto_862645 ?auto_862651 ) ) ( not ( = ?auto_862645 ?auto_862652 ) ) ( not ( = ?auto_862645 ?auto_862653 ) ) ( not ( = ?auto_862645 ?auto_862654 ) ) ( not ( = ?auto_862646 ?auto_862647 ) ) ( not ( = ?auto_862646 ?auto_862648 ) ) ( not ( = ?auto_862646 ?auto_862649 ) ) ( not ( = ?auto_862646 ?auto_862650 ) ) ( not ( = ?auto_862646 ?auto_862651 ) ) ( not ( = ?auto_862646 ?auto_862652 ) ) ( not ( = ?auto_862646 ?auto_862653 ) ) ( not ( = ?auto_862646 ?auto_862654 ) ) ( not ( = ?auto_862647 ?auto_862648 ) ) ( not ( = ?auto_862647 ?auto_862649 ) ) ( not ( = ?auto_862647 ?auto_862650 ) ) ( not ( = ?auto_862647 ?auto_862651 ) ) ( not ( = ?auto_862647 ?auto_862652 ) ) ( not ( = ?auto_862647 ?auto_862653 ) ) ( not ( = ?auto_862647 ?auto_862654 ) ) ( not ( = ?auto_862648 ?auto_862649 ) ) ( not ( = ?auto_862648 ?auto_862650 ) ) ( not ( = ?auto_862648 ?auto_862651 ) ) ( not ( = ?auto_862648 ?auto_862652 ) ) ( not ( = ?auto_862648 ?auto_862653 ) ) ( not ( = ?auto_862648 ?auto_862654 ) ) ( not ( = ?auto_862649 ?auto_862650 ) ) ( not ( = ?auto_862649 ?auto_862651 ) ) ( not ( = ?auto_862649 ?auto_862652 ) ) ( not ( = ?auto_862649 ?auto_862653 ) ) ( not ( = ?auto_862649 ?auto_862654 ) ) ( not ( = ?auto_862650 ?auto_862651 ) ) ( not ( = ?auto_862650 ?auto_862652 ) ) ( not ( = ?auto_862650 ?auto_862653 ) ) ( not ( = ?auto_862650 ?auto_862654 ) ) ( not ( = ?auto_862651 ?auto_862652 ) ) ( not ( = ?auto_862651 ?auto_862653 ) ) ( not ( = ?auto_862651 ?auto_862654 ) ) ( not ( = ?auto_862652 ?auto_862653 ) ) ( not ( = ?auto_862652 ?auto_862654 ) ) ( not ( = ?auto_862653 ?auto_862654 ) ) ( ON ?auto_862653 ?auto_862654 ) ( ON ?auto_862652 ?auto_862653 ) ( ON ?auto_862651 ?auto_862652 ) ( ON ?auto_862650 ?auto_862651 ) ( ON ?auto_862649 ?auto_862650 ) ( ON ?auto_862648 ?auto_862649 ) ( ON ?auto_862647 ?auto_862648 ) ( ON ?auto_862646 ?auto_862647 ) ( ON ?auto_862645 ?auto_862646 ) ( ON ?auto_862644 ?auto_862645 ) ( ON ?auto_862643 ?auto_862644 ) ( ON ?auto_862642 ?auto_862643 ) ( ON ?auto_862641 ?auto_862642 ) ( ON ?auto_862640 ?auto_862641 ) ( CLEAR ?auto_862638 ) ( ON ?auto_862639 ?auto_862640 ) ( CLEAR ?auto_862639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_862637 ?auto_862638 ?auto_862639 )
      ( MAKE-18PILE ?auto_862637 ?auto_862638 ?auto_862639 ?auto_862640 ?auto_862641 ?auto_862642 ?auto_862643 ?auto_862644 ?auto_862645 ?auto_862646 ?auto_862647 ?auto_862648 ?auto_862649 ?auto_862650 ?auto_862651 ?auto_862652 ?auto_862653 ?auto_862654 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862673 - BLOCK
      ?auto_862674 - BLOCK
      ?auto_862675 - BLOCK
      ?auto_862676 - BLOCK
      ?auto_862677 - BLOCK
      ?auto_862678 - BLOCK
      ?auto_862679 - BLOCK
      ?auto_862680 - BLOCK
      ?auto_862681 - BLOCK
      ?auto_862682 - BLOCK
      ?auto_862683 - BLOCK
      ?auto_862684 - BLOCK
      ?auto_862685 - BLOCK
      ?auto_862686 - BLOCK
      ?auto_862687 - BLOCK
      ?auto_862688 - BLOCK
      ?auto_862689 - BLOCK
      ?auto_862690 - BLOCK
    )
    :vars
    (
      ?auto_862691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862690 ?auto_862691 ) ( ON-TABLE ?auto_862673 ) ( not ( = ?auto_862673 ?auto_862674 ) ) ( not ( = ?auto_862673 ?auto_862675 ) ) ( not ( = ?auto_862673 ?auto_862676 ) ) ( not ( = ?auto_862673 ?auto_862677 ) ) ( not ( = ?auto_862673 ?auto_862678 ) ) ( not ( = ?auto_862673 ?auto_862679 ) ) ( not ( = ?auto_862673 ?auto_862680 ) ) ( not ( = ?auto_862673 ?auto_862681 ) ) ( not ( = ?auto_862673 ?auto_862682 ) ) ( not ( = ?auto_862673 ?auto_862683 ) ) ( not ( = ?auto_862673 ?auto_862684 ) ) ( not ( = ?auto_862673 ?auto_862685 ) ) ( not ( = ?auto_862673 ?auto_862686 ) ) ( not ( = ?auto_862673 ?auto_862687 ) ) ( not ( = ?auto_862673 ?auto_862688 ) ) ( not ( = ?auto_862673 ?auto_862689 ) ) ( not ( = ?auto_862673 ?auto_862690 ) ) ( not ( = ?auto_862673 ?auto_862691 ) ) ( not ( = ?auto_862674 ?auto_862675 ) ) ( not ( = ?auto_862674 ?auto_862676 ) ) ( not ( = ?auto_862674 ?auto_862677 ) ) ( not ( = ?auto_862674 ?auto_862678 ) ) ( not ( = ?auto_862674 ?auto_862679 ) ) ( not ( = ?auto_862674 ?auto_862680 ) ) ( not ( = ?auto_862674 ?auto_862681 ) ) ( not ( = ?auto_862674 ?auto_862682 ) ) ( not ( = ?auto_862674 ?auto_862683 ) ) ( not ( = ?auto_862674 ?auto_862684 ) ) ( not ( = ?auto_862674 ?auto_862685 ) ) ( not ( = ?auto_862674 ?auto_862686 ) ) ( not ( = ?auto_862674 ?auto_862687 ) ) ( not ( = ?auto_862674 ?auto_862688 ) ) ( not ( = ?auto_862674 ?auto_862689 ) ) ( not ( = ?auto_862674 ?auto_862690 ) ) ( not ( = ?auto_862674 ?auto_862691 ) ) ( not ( = ?auto_862675 ?auto_862676 ) ) ( not ( = ?auto_862675 ?auto_862677 ) ) ( not ( = ?auto_862675 ?auto_862678 ) ) ( not ( = ?auto_862675 ?auto_862679 ) ) ( not ( = ?auto_862675 ?auto_862680 ) ) ( not ( = ?auto_862675 ?auto_862681 ) ) ( not ( = ?auto_862675 ?auto_862682 ) ) ( not ( = ?auto_862675 ?auto_862683 ) ) ( not ( = ?auto_862675 ?auto_862684 ) ) ( not ( = ?auto_862675 ?auto_862685 ) ) ( not ( = ?auto_862675 ?auto_862686 ) ) ( not ( = ?auto_862675 ?auto_862687 ) ) ( not ( = ?auto_862675 ?auto_862688 ) ) ( not ( = ?auto_862675 ?auto_862689 ) ) ( not ( = ?auto_862675 ?auto_862690 ) ) ( not ( = ?auto_862675 ?auto_862691 ) ) ( not ( = ?auto_862676 ?auto_862677 ) ) ( not ( = ?auto_862676 ?auto_862678 ) ) ( not ( = ?auto_862676 ?auto_862679 ) ) ( not ( = ?auto_862676 ?auto_862680 ) ) ( not ( = ?auto_862676 ?auto_862681 ) ) ( not ( = ?auto_862676 ?auto_862682 ) ) ( not ( = ?auto_862676 ?auto_862683 ) ) ( not ( = ?auto_862676 ?auto_862684 ) ) ( not ( = ?auto_862676 ?auto_862685 ) ) ( not ( = ?auto_862676 ?auto_862686 ) ) ( not ( = ?auto_862676 ?auto_862687 ) ) ( not ( = ?auto_862676 ?auto_862688 ) ) ( not ( = ?auto_862676 ?auto_862689 ) ) ( not ( = ?auto_862676 ?auto_862690 ) ) ( not ( = ?auto_862676 ?auto_862691 ) ) ( not ( = ?auto_862677 ?auto_862678 ) ) ( not ( = ?auto_862677 ?auto_862679 ) ) ( not ( = ?auto_862677 ?auto_862680 ) ) ( not ( = ?auto_862677 ?auto_862681 ) ) ( not ( = ?auto_862677 ?auto_862682 ) ) ( not ( = ?auto_862677 ?auto_862683 ) ) ( not ( = ?auto_862677 ?auto_862684 ) ) ( not ( = ?auto_862677 ?auto_862685 ) ) ( not ( = ?auto_862677 ?auto_862686 ) ) ( not ( = ?auto_862677 ?auto_862687 ) ) ( not ( = ?auto_862677 ?auto_862688 ) ) ( not ( = ?auto_862677 ?auto_862689 ) ) ( not ( = ?auto_862677 ?auto_862690 ) ) ( not ( = ?auto_862677 ?auto_862691 ) ) ( not ( = ?auto_862678 ?auto_862679 ) ) ( not ( = ?auto_862678 ?auto_862680 ) ) ( not ( = ?auto_862678 ?auto_862681 ) ) ( not ( = ?auto_862678 ?auto_862682 ) ) ( not ( = ?auto_862678 ?auto_862683 ) ) ( not ( = ?auto_862678 ?auto_862684 ) ) ( not ( = ?auto_862678 ?auto_862685 ) ) ( not ( = ?auto_862678 ?auto_862686 ) ) ( not ( = ?auto_862678 ?auto_862687 ) ) ( not ( = ?auto_862678 ?auto_862688 ) ) ( not ( = ?auto_862678 ?auto_862689 ) ) ( not ( = ?auto_862678 ?auto_862690 ) ) ( not ( = ?auto_862678 ?auto_862691 ) ) ( not ( = ?auto_862679 ?auto_862680 ) ) ( not ( = ?auto_862679 ?auto_862681 ) ) ( not ( = ?auto_862679 ?auto_862682 ) ) ( not ( = ?auto_862679 ?auto_862683 ) ) ( not ( = ?auto_862679 ?auto_862684 ) ) ( not ( = ?auto_862679 ?auto_862685 ) ) ( not ( = ?auto_862679 ?auto_862686 ) ) ( not ( = ?auto_862679 ?auto_862687 ) ) ( not ( = ?auto_862679 ?auto_862688 ) ) ( not ( = ?auto_862679 ?auto_862689 ) ) ( not ( = ?auto_862679 ?auto_862690 ) ) ( not ( = ?auto_862679 ?auto_862691 ) ) ( not ( = ?auto_862680 ?auto_862681 ) ) ( not ( = ?auto_862680 ?auto_862682 ) ) ( not ( = ?auto_862680 ?auto_862683 ) ) ( not ( = ?auto_862680 ?auto_862684 ) ) ( not ( = ?auto_862680 ?auto_862685 ) ) ( not ( = ?auto_862680 ?auto_862686 ) ) ( not ( = ?auto_862680 ?auto_862687 ) ) ( not ( = ?auto_862680 ?auto_862688 ) ) ( not ( = ?auto_862680 ?auto_862689 ) ) ( not ( = ?auto_862680 ?auto_862690 ) ) ( not ( = ?auto_862680 ?auto_862691 ) ) ( not ( = ?auto_862681 ?auto_862682 ) ) ( not ( = ?auto_862681 ?auto_862683 ) ) ( not ( = ?auto_862681 ?auto_862684 ) ) ( not ( = ?auto_862681 ?auto_862685 ) ) ( not ( = ?auto_862681 ?auto_862686 ) ) ( not ( = ?auto_862681 ?auto_862687 ) ) ( not ( = ?auto_862681 ?auto_862688 ) ) ( not ( = ?auto_862681 ?auto_862689 ) ) ( not ( = ?auto_862681 ?auto_862690 ) ) ( not ( = ?auto_862681 ?auto_862691 ) ) ( not ( = ?auto_862682 ?auto_862683 ) ) ( not ( = ?auto_862682 ?auto_862684 ) ) ( not ( = ?auto_862682 ?auto_862685 ) ) ( not ( = ?auto_862682 ?auto_862686 ) ) ( not ( = ?auto_862682 ?auto_862687 ) ) ( not ( = ?auto_862682 ?auto_862688 ) ) ( not ( = ?auto_862682 ?auto_862689 ) ) ( not ( = ?auto_862682 ?auto_862690 ) ) ( not ( = ?auto_862682 ?auto_862691 ) ) ( not ( = ?auto_862683 ?auto_862684 ) ) ( not ( = ?auto_862683 ?auto_862685 ) ) ( not ( = ?auto_862683 ?auto_862686 ) ) ( not ( = ?auto_862683 ?auto_862687 ) ) ( not ( = ?auto_862683 ?auto_862688 ) ) ( not ( = ?auto_862683 ?auto_862689 ) ) ( not ( = ?auto_862683 ?auto_862690 ) ) ( not ( = ?auto_862683 ?auto_862691 ) ) ( not ( = ?auto_862684 ?auto_862685 ) ) ( not ( = ?auto_862684 ?auto_862686 ) ) ( not ( = ?auto_862684 ?auto_862687 ) ) ( not ( = ?auto_862684 ?auto_862688 ) ) ( not ( = ?auto_862684 ?auto_862689 ) ) ( not ( = ?auto_862684 ?auto_862690 ) ) ( not ( = ?auto_862684 ?auto_862691 ) ) ( not ( = ?auto_862685 ?auto_862686 ) ) ( not ( = ?auto_862685 ?auto_862687 ) ) ( not ( = ?auto_862685 ?auto_862688 ) ) ( not ( = ?auto_862685 ?auto_862689 ) ) ( not ( = ?auto_862685 ?auto_862690 ) ) ( not ( = ?auto_862685 ?auto_862691 ) ) ( not ( = ?auto_862686 ?auto_862687 ) ) ( not ( = ?auto_862686 ?auto_862688 ) ) ( not ( = ?auto_862686 ?auto_862689 ) ) ( not ( = ?auto_862686 ?auto_862690 ) ) ( not ( = ?auto_862686 ?auto_862691 ) ) ( not ( = ?auto_862687 ?auto_862688 ) ) ( not ( = ?auto_862687 ?auto_862689 ) ) ( not ( = ?auto_862687 ?auto_862690 ) ) ( not ( = ?auto_862687 ?auto_862691 ) ) ( not ( = ?auto_862688 ?auto_862689 ) ) ( not ( = ?auto_862688 ?auto_862690 ) ) ( not ( = ?auto_862688 ?auto_862691 ) ) ( not ( = ?auto_862689 ?auto_862690 ) ) ( not ( = ?auto_862689 ?auto_862691 ) ) ( not ( = ?auto_862690 ?auto_862691 ) ) ( ON ?auto_862689 ?auto_862690 ) ( ON ?auto_862688 ?auto_862689 ) ( ON ?auto_862687 ?auto_862688 ) ( ON ?auto_862686 ?auto_862687 ) ( ON ?auto_862685 ?auto_862686 ) ( ON ?auto_862684 ?auto_862685 ) ( ON ?auto_862683 ?auto_862684 ) ( ON ?auto_862682 ?auto_862683 ) ( ON ?auto_862681 ?auto_862682 ) ( ON ?auto_862680 ?auto_862681 ) ( ON ?auto_862679 ?auto_862680 ) ( ON ?auto_862678 ?auto_862679 ) ( ON ?auto_862677 ?auto_862678 ) ( ON ?auto_862676 ?auto_862677 ) ( ON ?auto_862675 ?auto_862676 ) ( CLEAR ?auto_862673 ) ( ON ?auto_862674 ?auto_862675 ) ( CLEAR ?auto_862674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_862673 ?auto_862674 )
      ( MAKE-18PILE ?auto_862673 ?auto_862674 ?auto_862675 ?auto_862676 ?auto_862677 ?auto_862678 ?auto_862679 ?auto_862680 ?auto_862681 ?auto_862682 ?auto_862683 ?auto_862684 ?auto_862685 ?auto_862686 ?auto_862687 ?auto_862688 ?auto_862689 ?auto_862690 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862710 - BLOCK
      ?auto_862711 - BLOCK
      ?auto_862712 - BLOCK
      ?auto_862713 - BLOCK
      ?auto_862714 - BLOCK
      ?auto_862715 - BLOCK
      ?auto_862716 - BLOCK
      ?auto_862717 - BLOCK
      ?auto_862718 - BLOCK
      ?auto_862719 - BLOCK
      ?auto_862720 - BLOCK
      ?auto_862721 - BLOCK
      ?auto_862722 - BLOCK
      ?auto_862723 - BLOCK
      ?auto_862724 - BLOCK
      ?auto_862725 - BLOCK
      ?auto_862726 - BLOCK
      ?auto_862727 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_862727 ) ( ON-TABLE ?auto_862710 ) ( not ( = ?auto_862710 ?auto_862711 ) ) ( not ( = ?auto_862710 ?auto_862712 ) ) ( not ( = ?auto_862710 ?auto_862713 ) ) ( not ( = ?auto_862710 ?auto_862714 ) ) ( not ( = ?auto_862710 ?auto_862715 ) ) ( not ( = ?auto_862710 ?auto_862716 ) ) ( not ( = ?auto_862710 ?auto_862717 ) ) ( not ( = ?auto_862710 ?auto_862718 ) ) ( not ( = ?auto_862710 ?auto_862719 ) ) ( not ( = ?auto_862710 ?auto_862720 ) ) ( not ( = ?auto_862710 ?auto_862721 ) ) ( not ( = ?auto_862710 ?auto_862722 ) ) ( not ( = ?auto_862710 ?auto_862723 ) ) ( not ( = ?auto_862710 ?auto_862724 ) ) ( not ( = ?auto_862710 ?auto_862725 ) ) ( not ( = ?auto_862710 ?auto_862726 ) ) ( not ( = ?auto_862710 ?auto_862727 ) ) ( not ( = ?auto_862711 ?auto_862712 ) ) ( not ( = ?auto_862711 ?auto_862713 ) ) ( not ( = ?auto_862711 ?auto_862714 ) ) ( not ( = ?auto_862711 ?auto_862715 ) ) ( not ( = ?auto_862711 ?auto_862716 ) ) ( not ( = ?auto_862711 ?auto_862717 ) ) ( not ( = ?auto_862711 ?auto_862718 ) ) ( not ( = ?auto_862711 ?auto_862719 ) ) ( not ( = ?auto_862711 ?auto_862720 ) ) ( not ( = ?auto_862711 ?auto_862721 ) ) ( not ( = ?auto_862711 ?auto_862722 ) ) ( not ( = ?auto_862711 ?auto_862723 ) ) ( not ( = ?auto_862711 ?auto_862724 ) ) ( not ( = ?auto_862711 ?auto_862725 ) ) ( not ( = ?auto_862711 ?auto_862726 ) ) ( not ( = ?auto_862711 ?auto_862727 ) ) ( not ( = ?auto_862712 ?auto_862713 ) ) ( not ( = ?auto_862712 ?auto_862714 ) ) ( not ( = ?auto_862712 ?auto_862715 ) ) ( not ( = ?auto_862712 ?auto_862716 ) ) ( not ( = ?auto_862712 ?auto_862717 ) ) ( not ( = ?auto_862712 ?auto_862718 ) ) ( not ( = ?auto_862712 ?auto_862719 ) ) ( not ( = ?auto_862712 ?auto_862720 ) ) ( not ( = ?auto_862712 ?auto_862721 ) ) ( not ( = ?auto_862712 ?auto_862722 ) ) ( not ( = ?auto_862712 ?auto_862723 ) ) ( not ( = ?auto_862712 ?auto_862724 ) ) ( not ( = ?auto_862712 ?auto_862725 ) ) ( not ( = ?auto_862712 ?auto_862726 ) ) ( not ( = ?auto_862712 ?auto_862727 ) ) ( not ( = ?auto_862713 ?auto_862714 ) ) ( not ( = ?auto_862713 ?auto_862715 ) ) ( not ( = ?auto_862713 ?auto_862716 ) ) ( not ( = ?auto_862713 ?auto_862717 ) ) ( not ( = ?auto_862713 ?auto_862718 ) ) ( not ( = ?auto_862713 ?auto_862719 ) ) ( not ( = ?auto_862713 ?auto_862720 ) ) ( not ( = ?auto_862713 ?auto_862721 ) ) ( not ( = ?auto_862713 ?auto_862722 ) ) ( not ( = ?auto_862713 ?auto_862723 ) ) ( not ( = ?auto_862713 ?auto_862724 ) ) ( not ( = ?auto_862713 ?auto_862725 ) ) ( not ( = ?auto_862713 ?auto_862726 ) ) ( not ( = ?auto_862713 ?auto_862727 ) ) ( not ( = ?auto_862714 ?auto_862715 ) ) ( not ( = ?auto_862714 ?auto_862716 ) ) ( not ( = ?auto_862714 ?auto_862717 ) ) ( not ( = ?auto_862714 ?auto_862718 ) ) ( not ( = ?auto_862714 ?auto_862719 ) ) ( not ( = ?auto_862714 ?auto_862720 ) ) ( not ( = ?auto_862714 ?auto_862721 ) ) ( not ( = ?auto_862714 ?auto_862722 ) ) ( not ( = ?auto_862714 ?auto_862723 ) ) ( not ( = ?auto_862714 ?auto_862724 ) ) ( not ( = ?auto_862714 ?auto_862725 ) ) ( not ( = ?auto_862714 ?auto_862726 ) ) ( not ( = ?auto_862714 ?auto_862727 ) ) ( not ( = ?auto_862715 ?auto_862716 ) ) ( not ( = ?auto_862715 ?auto_862717 ) ) ( not ( = ?auto_862715 ?auto_862718 ) ) ( not ( = ?auto_862715 ?auto_862719 ) ) ( not ( = ?auto_862715 ?auto_862720 ) ) ( not ( = ?auto_862715 ?auto_862721 ) ) ( not ( = ?auto_862715 ?auto_862722 ) ) ( not ( = ?auto_862715 ?auto_862723 ) ) ( not ( = ?auto_862715 ?auto_862724 ) ) ( not ( = ?auto_862715 ?auto_862725 ) ) ( not ( = ?auto_862715 ?auto_862726 ) ) ( not ( = ?auto_862715 ?auto_862727 ) ) ( not ( = ?auto_862716 ?auto_862717 ) ) ( not ( = ?auto_862716 ?auto_862718 ) ) ( not ( = ?auto_862716 ?auto_862719 ) ) ( not ( = ?auto_862716 ?auto_862720 ) ) ( not ( = ?auto_862716 ?auto_862721 ) ) ( not ( = ?auto_862716 ?auto_862722 ) ) ( not ( = ?auto_862716 ?auto_862723 ) ) ( not ( = ?auto_862716 ?auto_862724 ) ) ( not ( = ?auto_862716 ?auto_862725 ) ) ( not ( = ?auto_862716 ?auto_862726 ) ) ( not ( = ?auto_862716 ?auto_862727 ) ) ( not ( = ?auto_862717 ?auto_862718 ) ) ( not ( = ?auto_862717 ?auto_862719 ) ) ( not ( = ?auto_862717 ?auto_862720 ) ) ( not ( = ?auto_862717 ?auto_862721 ) ) ( not ( = ?auto_862717 ?auto_862722 ) ) ( not ( = ?auto_862717 ?auto_862723 ) ) ( not ( = ?auto_862717 ?auto_862724 ) ) ( not ( = ?auto_862717 ?auto_862725 ) ) ( not ( = ?auto_862717 ?auto_862726 ) ) ( not ( = ?auto_862717 ?auto_862727 ) ) ( not ( = ?auto_862718 ?auto_862719 ) ) ( not ( = ?auto_862718 ?auto_862720 ) ) ( not ( = ?auto_862718 ?auto_862721 ) ) ( not ( = ?auto_862718 ?auto_862722 ) ) ( not ( = ?auto_862718 ?auto_862723 ) ) ( not ( = ?auto_862718 ?auto_862724 ) ) ( not ( = ?auto_862718 ?auto_862725 ) ) ( not ( = ?auto_862718 ?auto_862726 ) ) ( not ( = ?auto_862718 ?auto_862727 ) ) ( not ( = ?auto_862719 ?auto_862720 ) ) ( not ( = ?auto_862719 ?auto_862721 ) ) ( not ( = ?auto_862719 ?auto_862722 ) ) ( not ( = ?auto_862719 ?auto_862723 ) ) ( not ( = ?auto_862719 ?auto_862724 ) ) ( not ( = ?auto_862719 ?auto_862725 ) ) ( not ( = ?auto_862719 ?auto_862726 ) ) ( not ( = ?auto_862719 ?auto_862727 ) ) ( not ( = ?auto_862720 ?auto_862721 ) ) ( not ( = ?auto_862720 ?auto_862722 ) ) ( not ( = ?auto_862720 ?auto_862723 ) ) ( not ( = ?auto_862720 ?auto_862724 ) ) ( not ( = ?auto_862720 ?auto_862725 ) ) ( not ( = ?auto_862720 ?auto_862726 ) ) ( not ( = ?auto_862720 ?auto_862727 ) ) ( not ( = ?auto_862721 ?auto_862722 ) ) ( not ( = ?auto_862721 ?auto_862723 ) ) ( not ( = ?auto_862721 ?auto_862724 ) ) ( not ( = ?auto_862721 ?auto_862725 ) ) ( not ( = ?auto_862721 ?auto_862726 ) ) ( not ( = ?auto_862721 ?auto_862727 ) ) ( not ( = ?auto_862722 ?auto_862723 ) ) ( not ( = ?auto_862722 ?auto_862724 ) ) ( not ( = ?auto_862722 ?auto_862725 ) ) ( not ( = ?auto_862722 ?auto_862726 ) ) ( not ( = ?auto_862722 ?auto_862727 ) ) ( not ( = ?auto_862723 ?auto_862724 ) ) ( not ( = ?auto_862723 ?auto_862725 ) ) ( not ( = ?auto_862723 ?auto_862726 ) ) ( not ( = ?auto_862723 ?auto_862727 ) ) ( not ( = ?auto_862724 ?auto_862725 ) ) ( not ( = ?auto_862724 ?auto_862726 ) ) ( not ( = ?auto_862724 ?auto_862727 ) ) ( not ( = ?auto_862725 ?auto_862726 ) ) ( not ( = ?auto_862725 ?auto_862727 ) ) ( not ( = ?auto_862726 ?auto_862727 ) ) ( ON ?auto_862726 ?auto_862727 ) ( ON ?auto_862725 ?auto_862726 ) ( ON ?auto_862724 ?auto_862725 ) ( ON ?auto_862723 ?auto_862724 ) ( ON ?auto_862722 ?auto_862723 ) ( ON ?auto_862721 ?auto_862722 ) ( ON ?auto_862720 ?auto_862721 ) ( ON ?auto_862719 ?auto_862720 ) ( ON ?auto_862718 ?auto_862719 ) ( ON ?auto_862717 ?auto_862718 ) ( ON ?auto_862716 ?auto_862717 ) ( ON ?auto_862715 ?auto_862716 ) ( ON ?auto_862714 ?auto_862715 ) ( ON ?auto_862713 ?auto_862714 ) ( ON ?auto_862712 ?auto_862713 ) ( CLEAR ?auto_862710 ) ( ON ?auto_862711 ?auto_862712 ) ( CLEAR ?auto_862711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_862710 ?auto_862711 )
      ( MAKE-18PILE ?auto_862710 ?auto_862711 ?auto_862712 ?auto_862713 ?auto_862714 ?auto_862715 ?auto_862716 ?auto_862717 ?auto_862718 ?auto_862719 ?auto_862720 ?auto_862721 ?auto_862722 ?auto_862723 ?auto_862724 ?auto_862725 ?auto_862726 ?auto_862727 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862746 - BLOCK
      ?auto_862747 - BLOCK
      ?auto_862748 - BLOCK
      ?auto_862749 - BLOCK
      ?auto_862750 - BLOCK
      ?auto_862751 - BLOCK
      ?auto_862752 - BLOCK
      ?auto_862753 - BLOCK
      ?auto_862754 - BLOCK
      ?auto_862755 - BLOCK
      ?auto_862756 - BLOCK
      ?auto_862757 - BLOCK
      ?auto_862758 - BLOCK
      ?auto_862759 - BLOCK
      ?auto_862760 - BLOCK
      ?auto_862761 - BLOCK
      ?auto_862762 - BLOCK
      ?auto_862763 - BLOCK
    )
    :vars
    (
      ?auto_862764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_862763 ?auto_862764 ) ( not ( = ?auto_862746 ?auto_862747 ) ) ( not ( = ?auto_862746 ?auto_862748 ) ) ( not ( = ?auto_862746 ?auto_862749 ) ) ( not ( = ?auto_862746 ?auto_862750 ) ) ( not ( = ?auto_862746 ?auto_862751 ) ) ( not ( = ?auto_862746 ?auto_862752 ) ) ( not ( = ?auto_862746 ?auto_862753 ) ) ( not ( = ?auto_862746 ?auto_862754 ) ) ( not ( = ?auto_862746 ?auto_862755 ) ) ( not ( = ?auto_862746 ?auto_862756 ) ) ( not ( = ?auto_862746 ?auto_862757 ) ) ( not ( = ?auto_862746 ?auto_862758 ) ) ( not ( = ?auto_862746 ?auto_862759 ) ) ( not ( = ?auto_862746 ?auto_862760 ) ) ( not ( = ?auto_862746 ?auto_862761 ) ) ( not ( = ?auto_862746 ?auto_862762 ) ) ( not ( = ?auto_862746 ?auto_862763 ) ) ( not ( = ?auto_862746 ?auto_862764 ) ) ( not ( = ?auto_862747 ?auto_862748 ) ) ( not ( = ?auto_862747 ?auto_862749 ) ) ( not ( = ?auto_862747 ?auto_862750 ) ) ( not ( = ?auto_862747 ?auto_862751 ) ) ( not ( = ?auto_862747 ?auto_862752 ) ) ( not ( = ?auto_862747 ?auto_862753 ) ) ( not ( = ?auto_862747 ?auto_862754 ) ) ( not ( = ?auto_862747 ?auto_862755 ) ) ( not ( = ?auto_862747 ?auto_862756 ) ) ( not ( = ?auto_862747 ?auto_862757 ) ) ( not ( = ?auto_862747 ?auto_862758 ) ) ( not ( = ?auto_862747 ?auto_862759 ) ) ( not ( = ?auto_862747 ?auto_862760 ) ) ( not ( = ?auto_862747 ?auto_862761 ) ) ( not ( = ?auto_862747 ?auto_862762 ) ) ( not ( = ?auto_862747 ?auto_862763 ) ) ( not ( = ?auto_862747 ?auto_862764 ) ) ( not ( = ?auto_862748 ?auto_862749 ) ) ( not ( = ?auto_862748 ?auto_862750 ) ) ( not ( = ?auto_862748 ?auto_862751 ) ) ( not ( = ?auto_862748 ?auto_862752 ) ) ( not ( = ?auto_862748 ?auto_862753 ) ) ( not ( = ?auto_862748 ?auto_862754 ) ) ( not ( = ?auto_862748 ?auto_862755 ) ) ( not ( = ?auto_862748 ?auto_862756 ) ) ( not ( = ?auto_862748 ?auto_862757 ) ) ( not ( = ?auto_862748 ?auto_862758 ) ) ( not ( = ?auto_862748 ?auto_862759 ) ) ( not ( = ?auto_862748 ?auto_862760 ) ) ( not ( = ?auto_862748 ?auto_862761 ) ) ( not ( = ?auto_862748 ?auto_862762 ) ) ( not ( = ?auto_862748 ?auto_862763 ) ) ( not ( = ?auto_862748 ?auto_862764 ) ) ( not ( = ?auto_862749 ?auto_862750 ) ) ( not ( = ?auto_862749 ?auto_862751 ) ) ( not ( = ?auto_862749 ?auto_862752 ) ) ( not ( = ?auto_862749 ?auto_862753 ) ) ( not ( = ?auto_862749 ?auto_862754 ) ) ( not ( = ?auto_862749 ?auto_862755 ) ) ( not ( = ?auto_862749 ?auto_862756 ) ) ( not ( = ?auto_862749 ?auto_862757 ) ) ( not ( = ?auto_862749 ?auto_862758 ) ) ( not ( = ?auto_862749 ?auto_862759 ) ) ( not ( = ?auto_862749 ?auto_862760 ) ) ( not ( = ?auto_862749 ?auto_862761 ) ) ( not ( = ?auto_862749 ?auto_862762 ) ) ( not ( = ?auto_862749 ?auto_862763 ) ) ( not ( = ?auto_862749 ?auto_862764 ) ) ( not ( = ?auto_862750 ?auto_862751 ) ) ( not ( = ?auto_862750 ?auto_862752 ) ) ( not ( = ?auto_862750 ?auto_862753 ) ) ( not ( = ?auto_862750 ?auto_862754 ) ) ( not ( = ?auto_862750 ?auto_862755 ) ) ( not ( = ?auto_862750 ?auto_862756 ) ) ( not ( = ?auto_862750 ?auto_862757 ) ) ( not ( = ?auto_862750 ?auto_862758 ) ) ( not ( = ?auto_862750 ?auto_862759 ) ) ( not ( = ?auto_862750 ?auto_862760 ) ) ( not ( = ?auto_862750 ?auto_862761 ) ) ( not ( = ?auto_862750 ?auto_862762 ) ) ( not ( = ?auto_862750 ?auto_862763 ) ) ( not ( = ?auto_862750 ?auto_862764 ) ) ( not ( = ?auto_862751 ?auto_862752 ) ) ( not ( = ?auto_862751 ?auto_862753 ) ) ( not ( = ?auto_862751 ?auto_862754 ) ) ( not ( = ?auto_862751 ?auto_862755 ) ) ( not ( = ?auto_862751 ?auto_862756 ) ) ( not ( = ?auto_862751 ?auto_862757 ) ) ( not ( = ?auto_862751 ?auto_862758 ) ) ( not ( = ?auto_862751 ?auto_862759 ) ) ( not ( = ?auto_862751 ?auto_862760 ) ) ( not ( = ?auto_862751 ?auto_862761 ) ) ( not ( = ?auto_862751 ?auto_862762 ) ) ( not ( = ?auto_862751 ?auto_862763 ) ) ( not ( = ?auto_862751 ?auto_862764 ) ) ( not ( = ?auto_862752 ?auto_862753 ) ) ( not ( = ?auto_862752 ?auto_862754 ) ) ( not ( = ?auto_862752 ?auto_862755 ) ) ( not ( = ?auto_862752 ?auto_862756 ) ) ( not ( = ?auto_862752 ?auto_862757 ) ) ( not ( = ?auto_862752 ?auto_862758 ) ) ( not ( = ?auto_862752 ?auto_862759 ) ) ( not ( = ?auto_862752 ?auto_862760 ) ) ( not ( = ?auto_862752 ?auto_862761 ) ) ( not ( = ?auto_862752 ?auto_862762 ) ) ( not ( = ?auto_862752 ?auto_862763 ) ) ( not ( = ?auto_862752 ?auto_862764 ) ) ( not ( = ?auto_862753 ?auto_862754 ) ) ( not ( = ?auto_862753 ?auto_862755 ) ) ( not ( = ?auto_862753 ?auto_862756 ) ) ( not ( = ?auto_862753 ?auto_862757 ) ) ( not ( = ?auto_862753 ?auto_862758 ) ) ( not ( = ?auto_862753 ?auto_862759 ) ) ( not ( = ?auto_862753 ?auto_862760 ) ) ( not ( = ?auto_862753 ?auto_862761 ) ) ( not ( = ?auto_862753 ?auto_862762 ) ) ( not ( = ?auto_862753 ?auto_862763 ) ) ( not ( = ?auto_862753 ?auto_862764 ) ) ( not ( = ?auto_862754 ?auto_862755 ) ) ( not ( = ?auto_862754 ?auto_862756 ) ) ( not ( = ?auto_862754 ?auto_862757 ) ) ( not ( = ?auto_862754 ?auto_862758 ) ) ( not ( = ?auto_862754 ?auto_862759 ) ) ( not ( = ?auto_862754 ?auto_862760 ) ) ( not ( = ?auto_862754 ?auto_862761 ) ) ( not ( = ?auto_862754 ?auto_862762 ) ) ( not ( = ?auto_862754 ?auto_862763 ) ) ( not ( = ?auto_862754 ?auto_862764 ) ) ( not ( = ?auto_862755 ?auto_862756 ) ) ( not ( = ?auto_862755 ?auto_862757 ) ) ( not ( = ?auto_862755 ?auto_862758 ) ) ( not ( = ?auto_862755 ?auto_862759 ) ) ( not ( = ?auto_862755 ?auto_862760 ) ) ( not ( = ?auto_862755 ?auto_862761 ) ) ( not ( = ?auto_862755 ?auto_862762 ) ) ( not ( = ?auto_862755 ?auto_862763 ) ) ( not ( = ?auto_862755 ?auto_862764 ) ) ( not ( = ?auto_862756 ?auto_862757 ) ) ( not ( = ?auto_862756 ?auto_862758 ) ) ( not ( = ?auto_862756 ?auto_862759 ) ) ( not ( = ?auto_862756 ?auto_862760 ) ) ( not ( = ?auto_862756 ?auto_862761 ) ) ( not ( = ?auto_862756 ?auto_862762 ) ) ( not ( = ?auto_862756 ?auto_862763 ) ) ( not ( = ?auto_862756 ?auto_862764 ) ) ( not ( = ?auto_862757 ?auto_862758 ) ) ( not ( = ?auto_862757 ?auto_862759 ) ) ( not ( = ?auto_862757 ?auto_862760 ) ) ( not ( = ?auto_862757 ?auto_862761 ) ) ( not ( = ?auto_862757 ?auto_862762 ) ) ( not ( = ?auto_862757 ?auto_862763 ) ) ( not ( = ?auto_862757 ?auto_862764 ) ) ( not ( = ?auto_862758 ?auto_862759 ) ) ( not ( = ?auto_862758 ?auto_862760 ) ) ( not ( = ?auto_862758 ?auto_862761 ) ) ( not ( = ?auto_862758 ?auto_862762 ) ) ( not ( = ?auto_862758 ?auto_862763 ) ) ( not ( = ?auto_862758 ?auto_862764 ) ) ( not ( = ?auto_862759 ?auto_862760 ) ) ( not ( = ?auto_862759 ?auto_862761 ) ) ( not ( = ?auto_862759 ?auto_862762 ) ) ( not ( = ?auto_862759 ?auto_862763 ) ) ( not ( = ?auto_862759 ?auto_862764 ) ) ( not ( = ?auto_862760 ?auto_862761 ) ) ( not ( = ?auto_862760 ?auto_862762 ) ) ( not ( = ?auto_862760 ?auto_862763 ) ) ( not ( = ?auto_862760 ?auto_862764 ) ) ( not ( = ?auto_862761 ?auto_862762 ) ) ( not ( = ?auto_862761 ?auto_862763 ) ) ( not ( = ?auto_862761 ?auto_862764 ) ) ( not ( = ?auto_862762 ?auto_862763 ) ) ( not ( = ?auto_862762 ?auto_862764 ) ) ( not ( = ?auto_862763 ?auto_862764 ) ) ( ON ?auto_862762 ?auto_862763 ) ( ON ?auto_862761 ?auto_862762 ) ( ON ?auto_862760 ?auto_862761 ) ( ON ?auto_862759 ?auto_862760 ) ( ON ?auto_862758 ?auto_862759 ) ( ON ?auto_862757 ?auto_862758 ) ( ON ?auto_862756 ?auto_862757 ) ( ON ?auto_862755 ?auto_862756 ) ( ON ?auto_862754 ?auto_862755 ) ( ON ?auto_862753 ?auto_862754 ) ( ON ?auto_862752 ?auto_862753 ) ( ON ?auto_862751 ?auto_862752 ) ( ON ?auto_862750 ?auto_862751 ) ( ON ?auto_862749 ?auto_862750 ) ( ON ?auto_862748 ?auto_862749 ) ( ON ?auto_862747 ?auto_862748 ) ( ON ?auto_862746 ?auto_862747 ) ( CLEAR ?auto_862746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_862746 )
      ( MAKE-18PILE ?auto_862746 ?auto_862747 ?auto_862748 ?auto_862749 ?auto_862750 ?auto_862751 ?auto_862752 ?auto_862753 ?auto_862754 ?auto_862755 ?auto_862756 ?auto_862757 ?auto_862758 ?auto_862759 ?auto_862760 ?auto_862761 ?auto_862762 ?auto_862763 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862783 - BLOCK
      ?auto_862784 - BLOCK
      ?auto_862785 - BLOCK
      ?auto_862786 - BLOCK
      ?auto_862787 - BLOCK
      ?auto_862788 - BLOCK
      ?auto_862789 - BLOCK
      ?auto_862790 - BLOCK
      ?auto_862791 - BLOCK
      ?auto_862792 - BLOCK
      ?auto_862793 - BLOCK
      ?auto_862794 - BLOCK
      ?auto_862795 - BLOCK
      ?auto_862796 - BLOCK
      ?auto_862797 - BLOCK
      ?auto_862798 - BLOCK
      ?auto_862799 - BLOCK
      ?auto_862800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_862800 ) ( not ( = ?auto_862783 ?auto_862784 ) ) ( not ( = ?auto_862783 ?auto_862785 ) ) ( not ( = ?auto_862783 ?auto_862786 ) ) ( not ( = ?auto_862783 ?auto_862787 ) ) ( not ( = ?auto_862783 ?auto_862788 ) ) ( not ( = ?auto_862783 ?auto_862789 ) ) ( not ( = ?auto_862783 ?auto_862790 ) ) ( not ( = ?auto_862783 ?auto_862791 ) ) ( not ( = ?auto_862783 ?auto_862792 ) ) ( not ( = ?auto_862783 ?auto_862793 ) ) ( not ( = ?auto_862783 ?auto_862794 ) ) ( not ( = ?auto_862783 ?auto_862795 ) ) ( not ( = ?auto_862783 ?auto_862796 ) ) ( not ( = ?auto_862783 ?auto_862797 ) ) ( not ( = ?auto_862783 ?auto_862798 ) ) ( not ( = ?auto_862783 ?auto_862799 ) ) ( not ( = ?auto_862783 ?auto_862800 ) ) ( not ( = ?auto_862784 ?auto_862785 ) ) ( not ( = ?auto_862784 ?auto_862786 ) ) ( not ( = ?auto_862784 ?auto_862787 ) ) ( not ( = ?auto_862784 ?auto_862788 ) ) ( not ( = ?auto_862784 ?auto_862789 ) ) ( not ( = ?auto_862784 ?auto_862790 ) ) ( not ( = ?auto_862784 ?auto_862791 ) ) ( not ( = ?auto_862784 ?auto_862792 ) ) ( not ( = ?auto_862784 ?auto_862793 ) ) ( not ( = ?auto_862784 ?auto_862794 ) ) ( not ( = ?auto_862784 ?auto_862795 ) ) ( not ( = ?auto_862784 ?auto_862796 ) ) ( not ( = ?auto_862784 ?auto_862797 ) ) ( not ( = ?auto_862784 ?auto_862798 ) ) ( not ( = ?auto_862784 ?auto_862799 ) ) ( not ( = ?auto_862784 ?auto_862800 ) ) ( not ( = ?auto_862785 ?auto_862786 ) ) ( not ( = ?auto_862785 ?auto_862787 ) ) ( not ( = ?auto_862785 ?auto_862788 ) ) ( not ( = ?auto_862785 ?auto_862789 ) ) ( not ( = ?auto_862785 ?auto_862790 ) ) ( not ( = ?auto_862785 ?auto_862791 ) ) ( not ( = ?auto_862785 ?auto_862792 ) ) ( not ( = ?auto_862785 ?auto_862793 ) ) ( not ( = ?auto_862785 ?auto_862794 ) ) ( not ( = ?auto_862785 ?auto_862795 ) ) ( not ( = ?auto_862785 ?auto_862796 ) ) ( not ( = ?auto_862785 ?auto_862797 ) ) ( not ( = ?auto_862785 ?auto_862798 ) ) ( not ( = ?auto_862785 ?auto_862799 ) ) ( not ( = ?auto_862785 ?auto_862800 ) ) ( not ( = ?auto_862786 ?auto_862787 ) ) ( not ( = ?auto_862786 ?auto_862788 ) ) ( not ( = ?auto_862786 ?auto_862789 ) ) ( not ( = ?auto_862786 ?auto_862790 ) ) ( not ( = ?auto_862786 ?auto_862791 ) ) ( not ( = ?auto_862786 ?auto_862792 ) ) ( not ( = ?auto_862786 ?auto_862793 ) ) ( not ( = ?auto_862786 ?auto_862794 ) ) ( not ( = ?auto_862786 ?auto_862795 ) ) ( not ( = ?auto_862786 ?auto_862796 ) ) ( not ( = ?auto_862786 ?auto_862797 ) ) ( not ( = ?auto_862786 ?auto_862798 ) ) ( not ( = ?auto_862786 ?auto_862799 ) ) ( not ( = ?auto_862786 ?auto_862800 ) ) ( not ( = ?auto_862787 ?auto_862788 ) ) ( not ( = ?auto_862787 ?auto_862789 ) ) ( not ( = ?auto_862787 ?auto_862790 ) ) ( not ( = ?auto_862787 ?auto_862791 ) ) ( not ( = ?auto_862787 ?auto_862792 ) ) ( not ( = ?auto_862787 ?auto_862793 ) ) ( not ( = ?auto_862787 ?auto_862794 ) ) ( not ( = ?auto_862787 ?auto_862795 ) ) ( not ( = ?auto_862787 ?auto_862796 ) ) ( not ( = ?auto_862787 ?auto_862797 ) ) ( not ( = ?auto_862787 ?auto_862798 ) ) ( not ( = ?auto_862787 ?auto_862799 ) ) ( not ( = ?auto_862787 ?auto_862800 ) ) ( not ( = ?auto_862788 ?auto_862789 ) ) ( not ( = ?auto_862788 ?auto_862790 ) ) ( not ( = ?auto_862788 ?auto_862791 ) ) ( not ( = ?auto_862788 ?auto_862792 ) ) ( not ( = ?auto_862788 ?auto_862793 ) ) ( not ( = ?auto_862788 ?auto_862794 ) ) ( not ( = ?auto_862788 ?auto_862795 ) ) ( not ( = ?auto_862788 ?auto_862796 ) ) ( not ( = ?auto_862788 ?auto_862797 ) ) ( not ( = ?auto_862788 ?auto_862798 ) ) ( not ( = ?auto_862788 ?auto_862799 ) ) ( not ( = ?auto_862788 ?auto_862800 ) ) ( not ( = ?auto_862789 ?auto_862790 ) ) ( not ( = ?auto_862789 ?auto_862791 ) ) ( not ( = ?auto_862789 ?auto_862792 ) ) ( not ( = ?auto_862789 ?auto_862793 ) ) ( not ( = ?auto_862789 ?auto_862794 ) ) ( not ( = ?auto_862789 ?auto_862795 ) ) ( not ( = ?auto_862789 ?auto_862796 ) ) ( not ( = ?auto_862789 ?auto_862797 ) ) ( not ( = ?auto_862789 ?auto_862798 ) ) ( not ( = ?auto_862789 ?auto_862799 ) ) ( not ( = ?auto_862789 ?auto_862800 ) ) ( not ( = ?auto_862790 ?auto_862791 ) ) ( not ( = ?auto_862790 ?auto_862792 ) ) ( not ( = ?auto_862790 ?auto_862793 ) ) ( not ( = ?auto_862790 ?auto_862794 ) ) ( not ( = ?auto_862790 ?auto_862795 ) ) ( not ( = ?auto_862790 ?auto_862796 ) ) ( not ( = ?auto_862790 ?auto_862797 ) ) ( not ( = ?auto_862790 ?auto_862798 ) ) ( not ( = ?auto_862790 ?auto_862799 ) ) ( not ( = ?auto_862790 ?auto_862800 ) ) ( not ( = ?auto_862791 ?auto_862792 ) ) ( not ( = ?auto_862791 ?auto_862793 ) ) ( not ( = ?auto_862791 ?auto_862794 ) ) ( not ( = ?auto_862791 ?auto_862795 ) ) ( not ( = ?auto_862791 ?auto_862796 ) ) ( not ( = ?auto_862791 ?auto_862797 ) ) ( not ( = ?auto_862791 ?auto_862798 ) ) ( not ( = ?auto_862791 ?auto_862799 ) ) ( not ( = ?auto_862791 ?auto_862800 ) ) ( not ( = ?auto_862792 ?auto_862793 ) ) ( not ( = ?auto_862792 ?auto_862794 ) ) ( not ( = ?auto_862792 ?auto_862795 ) ) ( not ( = ?auto_862792 ?auto_862796 ) ) ( not ( = ?auto_862792 ?auto_862797 ) ) ( not ( = ?auto_862792 ?auto_862798 ) ) ( not ( = ?auto_862792 ?auto_862799 ) ) ( not ( = ?auto_862792 ?auto_862800 ) ) ( not ( = ?auto_862793 ?auto_862794 ) ) ( not ( = ?auto_862793 ?auto_862795 ) ) ( not ( = ?auto_862793 ?auto_862796 ) ) ( not ( = ?auto_862793 ?auto_862797 ) ) ( not ( = ?auto_862793 ?auto_862798 ) ) ( not ( = ?auto_862793 ?auto_862799 ) ) ( not ( = ?auto_862793 ?auto_862800 ) ) ( not ( = ?auto_862794 ?auto_862795 ) ) ( not ( = ?auto_862794 ?auto_862796 ) ) ( not ( = ?auto_862794 ?auto_862797 ) ) ( not ( = ?auto_862794 ?auto_862798 ) ) ( not ( = ?auto_862794 ?auto_862799 ) ) ( not ( = ?auto_862794 ?auto_862800 ) ) ( not ( = ?auto_862795 ?auto_862796 ) ) ( not ( = ?auto_862795 ?auto_862797 ) ) ( not ( = ?auto_862795 ?auto_862798 ) ) ( not ( = ?auto_862795 ?auto_862799 ) ) ( not ( = ?auto_862795 ?auto_862800 ) ) ( not ( = ?auto_862796 ?auto_862797 ) ) ( not ( = ?auto_862796 ?auto_862798 ) ) ( not ( = ?auto_862796 ?auto_862799 ) ) ( not ( = ?auto_862796 ?auto_862800 ) ) ( not ( = ?auto_862797 ?auto_862798 ) ) ( not ( = ?auto_862797 ?auto_862799 ) ) ( not ( = ?auto_862797 ?auto_862800 ) ) ( not ( = ?auto_862798 ?auto_862799 ) ) ( not ( = ?auto_862798 ?auto_862800 ) ) ( not ( = ?auto_862799 ?auto_862800 ) ) ( ON ?auto_862799 ?auto_862800 ) ( ON ?auto_862798 ?auto_862799 ) ( ON ?auto_862797 ?auto_862798 ) ( ON ?auto_862796 ?auto_862797 ) ( ON ?auto_862795 ?auto_862796 ) ( ON ?auto_862794 ?auto_862795 ) ( ON ?auto_862793 ?auto_862794 ) ( ON ?auto_862792 ?auto_862793 ) ( ON ?auto_862791 ?auto_862792 ) ( ON ?auto_862790 ?auto_862791 ) ( ON ?auto_862789 ?auto_862790 ) ( ON ?auto_862788 ?auto_862789 ) ( ON ?auto_862787 ?auto_862788 ) ( ON ?auto_862786 ?auto_862787 ) ( ON ?auto_862785 ?auto_862786 ) ( ON ?auto_862784 ?auto_862785 ) ( ON ?auto_862783 ?auto_862784 ) ( CLEAR ?auto_862783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_862783 )
      ( MAKE-18PILE ?auto_862783 ?auto_862784 ?auto_862785 ?auto_862786 ?auto_862787 ?auto_862788 ?auto_862789 ?auto_862790 ?auto_862791 ?auto_862792 ?auto_862793 ?auto_862794 ?auto_862795 ?auto_862796 ?auto_862797 ?auto_862798 ?auto_862799 ?auto_862800 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_862819 - BLOCK
      ?auto_862820 - BLOCK
      ?auto_862821 - BLOCK
      ?auto_862822 - BLOCK
      ?auto_862823 - BLOCK
      ?auto_862824 - BLOCK
      ?auto_862825 - BLOCK
      ?auto_862826 - BLOCK
      ?auto_862827 - BLOCK
      ?auto_862828 - BLOCK
      ?auto_862829 - BLOCK
      ?auto_862830 - BLOCK
      ?auto_862831 - BLOCK
      ?auto_862832 - BLOCK
      ?auto_862833 - BLOCK
      ?auto_862834 - BLOCK
      ?auto_862835 - BLOCK
      ?auto_862836 - BLOCK
    )
    :vars
    (
      ?auto_862837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_862819 ?auto_862820 ) ) ( not ( = ?auto_862819 ?auto_862821 ) ) ( not ( = ?auto_862819 ?auto_862822 ) ) ( not ( = ?auto_862819 ?auto_862823 ) ) ( not ( = ?auto_862819 ?auto_862824 ) ) ( not ( = ?auto_862819 ?auto_862825 ) ) ( not ( = ?auto_862819 ?auto_862826 ) ) ( not ( = ?auto_862819 ?auto_862827 ) ) ( not ( = ?auto_862819 ?auto_862828 ) ) ( not ( = ?auto_862819 ?auto_862829 ) ) ( not ( = ?auto_862819 ?auto_862830 ) ) ( not ( = ?auto_862819 ?auto_862831 ) ) ( not ( = ?auto_862819 ?auto_862832 ) ) ( not ( = ?auto_862819 ?auto_862833 ) ) ( not ( = ?auto_862819 ?auto_862834 ) ) ( not ( = ?auto_862819 ?auto_862835 ) ) ( not ( = ?auto_862819 ?auto_862836 ) ) ( not ( = ?auto_862820 ?auto_862821 ) ) ( not ( = ?auto_862820 ?auto_862822 ) ) ( not ( = ?auto_862820 ?auto_862823 ) ) ( not ( = ?auto_862820 ?auto_862824 ) ) ( not ( = ?auto_862820 ?auto_862825 ) ) ( not ( = ?auto_862820 ?auto_862826 ) ) ( not ( = ?auto_862820 ?auto_862827 ) ) ( not ( = ?auto_862820 ?auto_862828 ) ) ( not ( = ?auto_862820 ?auto_862829 ) ) ( not ( = ?auto_862820 ?auto_862830 ) ) ( not ( = ?auto_862820 ?auto_862831 ) ) ( not ( = ?auto_862820 ?auto_862832 ) ) ( not ( = ?auto_862820 ?auto_862833 ) ) ( not ( = ?auto_862820 ?auto_862834 ) ) ( not ( = ?auto_862820 ?auto_862835 ) ) ( not ( = ?auto_862820 ?auto_862836 ) ) ( not ( = ?auto_862821 ?auto_862822 ) ) ( not ( = ?auto_862821 ?auto_862823 ) ) ( not ( = ?auto_862821 ?auto_862824 ) ) ( not ( = ?auto_862821 ?auto_862825 ) ) ( not ( = ?auto_862821 ?auto_862826 ) ) ( not ( = ?auto_862821 ?auto_862827 ) ) ( not ( = ?auto_862821 ?auto_862828 ) ) ( not ( = ?auto_862821 ?auto_862829 ) ) ( not ( = ?auto_862821 ?auto_862830 ) ) ( not ( = ?auto_862821 ?auto_862831 ) ) ( not ( = ?auto_862821 ?auto_862832 ) ) ( not ( = ?auto_862821 ?auto_862833 ) ) ( not ( = ?auto_862821 ?auto_862834 ) ) ( not ( = ?auto_862821 ?auto_862835 ) ) ( not ( = ?auto_862821 ?auto_862836 ) ) ( not ( = ?auto_862822 ?auto_862823 ) ) ( not ( = ?auto_862822 ?auto_862824 ) ) ( not ( = ?auto_862822 ?auto_862825 ) ) ( not ( = ?auto_862822 ?auto_862826 ) ) ( not ( = ?auto_862822 ?auto_862827 ) ) ( not ( = ?auto_862822 ?auto_862828 ) ) ( not ( = ?auto_862822 ?auto_862829 ) ) ( not ( = ?auto_862822 ?auto_862830 ) ) ( not ( = ?auto_862822 ?auto_862831 ) ) ( not ( = ?auto_862822 ?auto_862832 ) ) ( not ( = ?auto_862822 ?auto_862833 ) ) ( not ( = ?auto_862822 ?auto_862834 ) ) ( not ( = ?auto_862822 ?auto_862835 ) ) ( not ( = ?auto_862822 ?auto_862836 ) ) ( not ( = ?auto_862823 ?auto_862824 ) ) ( not ( = ?auto_862823 ?auto_862825 ) ) ( not ( = ?auto_862823 ?auto_862826 ) ) ( not ( = ?auto_862823 ?auto_862827 ) ) ( not ( = ?auto_862823 ?auto_862828 ) ) ( not ( = ?auto_862823 ?auto_862829 ) ) ( not ( = ?auto_862823 ?auto_862830 ) ) ( not ( = ?auto_862823 ?auto_862831 ) ) ( not ( = ?auto_862823 ?auto_862832 ) ) ( not ( = ?auto_862823 ?auto_862833 ) ) ( not ( = ?auto_862823 ?auto_862834 ) ) ( not ( = ?auto_862823 ?auto_862835 ) ) ( not ( = ?auto_862823 ?auto_862836 ) ) ( not ( = ?auto_862824 ?auto_862825 ) ) ( not ( = ?auto_862824 ?auto_862826 ) ) ( not ( = ?auto_862824 ?auto_862827 ) ) ( not ( = ?auto_862824 ?auto_862828 ) ) ( not ( = ?auto_862824 ?auto_862829 ) ) ( not ( = ?auto_862824 ?auto_862830 ) ) ( not ( = ?auto_862824 ?auto_862831 ) ) ( not ( = ?auto_862824 ?auto_862832 ) ) ( not ( = ?auto_862824 ?auto_862833 ) ) ( not ( = ?auto_862824 ?auto_862834 ) ) ( not ( = ?auto_862824 ?auto_862835 ) ) ( not ( = ?auto_862824 ?auto_862836 ) ) ( not ( = ?auto_862825 ?auto_862826 ) ) ( not ( = ?auto_862825 ?auto_862827 ) ) ( not ( = ?auto_862825 ?auto_862828 ) ) ( not ( = ?auto_862825 ?auto_862829 ) ) ( not ( = ?auto_862825 ?auto_862830 ) ) ( not ( = ?auto_862825 ?auto_862831 ) ) ( not ( = ?auto_862825 ?auto_862832 ) ) ( not ( = ?auto_862825 ?auto_862833 ) ) ( not ( = ?auto_862825 ?auto_862834 ) ) ( not ( = ?auto_862825 ?auto_862835 ) ) ( not ( = ?auto_862825 ?auto_862836 ) ) ( not ( = ?auto_862826 ?auto_862827 ) ) ( not ( = ?auto_862826 ?auto_862828 ) ) ( not ( = ?auto_862826 ?auto_862829 ) ) ( not ( = ?auto_862826 ?auto_862830 ) ) ( not ( = ?auto_862826 ?auto_862831 ) ) ( not ( = ?auto_862826 ?auto_862832 ) ) ( not ( = ?auto_862826 ?auto_862833 ) ) ( not ( = ?auto_862826 ?auto_862834 ) ) ( not ( = ?auto_862826 ?auto_862835 ) ) ( not ( = ?auto_862826 ?auto_862836 ) ) ( not ( = ?auto_862827 ?auto_862828 ) ) ( not ( = ?auto_862827 ?auto_862829 ) ) ( not ( = ?auto_862827 ?auto_862830 ) ) ( not ( = ?auto_862827 ?auto_862831 ) ) ( not ( = ?auto_862827 ?auto_862832 ) ) ( not ( = ?auto_862827 ?auto_862833 ) ) ( not ( = ?auto_862827 ?auto_862834 ) ) ( not ( = ?auto_862827 ?auto_862835 ) ) ( not ( = ?auto_862827 ?auto_862836 ) ) ( not ( = ?auto_862828 ?auto_862829 ) ) ( not ( = ?auto_862828 ?auto_862830 ) ) ( not ( = ?auto_862828 ?auto_862831 ) ) ( not ( = ?auto_862828 ?auto_862832 ) ) ( not ( = ?auto_862828 ?auto_862833 ) ) ( not ( = ?auto_862828 ?auto_862834 ) ) ( not ( = ?auto_862828 ?auto_862835 ) ) ( not ( = ?auto_862828 ?auto_862836 ) ) ( not ( = ?auto_862829 ?auto_862830 ) ) ( not ( = ?auto_862829 ?auto_862831 ) ) ( not ( = ?auto_862829 ?auto_862832 ) ) ( not ( = ?auto_862829 ?auto_862833 ) ) ( not ( = ?auto_862829 ?auto_862834 ) ) ( not ( = ?auto_862829 ?auto_862835 ) ) ( not ( = ?auto_862829 ?auto_862836 ) ) ( not ( = ?auto_862830 ?auto_862831 ) ) ( not ( = ?auto_862830 ?auto_862832 ) ) ( not ( = ?auto_862830 ?auto_862833 ) ) ( not ( = ?auto_862830 ?auto_862834 ) ) ( not ( = ?auto_862830 ?auto_862835 ) ) ( not ( = ?auto_862830 ?auto_862836 ) ) ( not ( = ?auto_862831 ?auto_862832 ) ) ( not ( = ?auto_862831 ?auto_862833 ) ) ( not ( = ?auto_862831 ?auto_862834 ) ) ( not ( = ?auto_862831 ?auto_862835 ) ) ( not ( = ?auto_862831 ?auto_862836 ) ) ( not ( = ?auto_862832 ?auto_862833 ) ) ( not ( = ?auto_862832 ?auto_862834 ) ) ( not ( = ?auto_862832 ?auto_862835 ) ) ( not ( = ?auto_862832 ?auto_862836 ) ) ( not ( = ?auto_862833 ?auto_862834 ) ) ( not ( = ?auto_862833 ?auto_862835 ) ) ( not ( = ?auto_862833 ?auto_862836 ) ) ( not ( = ?auto_862834 ?auto_862835 ) ) ( not ( = ?auto_862834 ?auto_862836 ) ) ( not ( = ?auto_862835 ?auto_862836 ) ) ( ON ?auto_862819 ?auto_862837 ) ( not ( = ?auto_862836 ?auto_862837 ) ) ( not ( = ?auto_862835 ?auto_862837 ) ) ( not ( = ?auto_862834 ?auto_862837 ) ) ( not ( = ?auto_862833 ?auto_862837 ) ) ( not ( = ?auto_862832 ?auto_862837 ) ) ( not ( = ?auto_862831 ?auto_862837 ) ) ( not ( = ?auto_862830 ?auto_862837 ) ) ( not ( = ?auto_862829 ?auto_862837 ) ) ( not ( = ?auto_862828 ?auto_862837 ) ) ( not ( = ?auto_862827 ?auto_862837 ) ) ( not ( = ?auto_862826 ?auto_862837 ) ) ( not ( = ?auto_862825 ?auto_862837 ) ) ( not ( = ?auto_862824 ?auto_862837 ) ) ( not ( = ?auto_862823 ?auto_862837 ) ) ( not ( = ?auto_862822 ?auto_862837 ) ) ( not ( = ?auto_862821 ?auto_862837 ) ) ( not ( = ?auto_862820 ?auto_862837 ) ) ( not ( = ?auto_862819 ?auto_862837 ) ) ( ON ?auto_862820 ?auto_862819 ) ( ON ?auto_862821 ?auto_862820 ) ( ON ?auto_862822 ?auto_862821 ) ( ON ?auto_862823 ?auto_862822 ) ( ON ?auto_862824 ?auto_862823 ) ( ON ?auto_862825 ?auto_862824 ) ( ON ?auto_862826 ?auto_862825 ) ( ON ?auto_862827 ?auto_862826 ) ( ON ?auto_862828 ?auto_862827 ) ( ON ?auto_862829 ?auto_862828 ) ( ON ?auto_862830 ?auto_862829 ) ( ON ?auto_862831 ?auto_862830 ) ( ON ?auto_862832 ?auto_862831 ) ( ON ?auto_862833 ?auto_862832 ) ( ON ?auto_862834 ?auto_862833 ) ( ON ?auto_862835 ?auto_862834 ) ( ON ?auto_862836 ?auto_862835 ) ( CLEAR ?auto_862836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_862836 ?auto_862835 ?auto_862834 ?auto_862833 ?auto_862832 ?auto_862831 ?auto_862830 ?auto_862829 ?auto_862828 ?auto_862827 ?auto_862826 ?auto_862825 ?auto_862824 ?auto_862823 ?auto_862822 ?auto_862821 ?auto_862820 ?auto_862819 )
      ( MAKE-18PILE ?auto_862819 ?auto_862820 ?auto_862821 ?auto_862822 ?auto_862823 ?auto_862824 ?auto_862825 ?auto_862826 ?auto_862827 ?auto_862828 ?auto_862829 ?auto_862830 ?auto_862831 ?auto_862832 ?auto_862833 ?auto_862834 ?auto_862835 ?auto_862836 ) )
  )

)
