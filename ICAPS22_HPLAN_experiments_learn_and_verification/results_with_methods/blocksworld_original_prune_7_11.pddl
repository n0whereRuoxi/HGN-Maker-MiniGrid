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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94189 - BLOCK
      ?auto_94190 - BLOCK
      ?auto_94191 - BLOCK
      ?auto_94192 - BLOCK
      ?auto_94193 - BLOCK
      ?auto_94194 - BLOCK
      ?auto_94195 - BLOCK
    )
    :vars
    (
      ?auto_94196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94196 ?auto_94195 ) ( CLEAR ?auto_94196 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94189 ) ( ON ?auto_94190 ?auto_94189 ) ( ON ?auto_94191 ?auto_94190 ) ( ON ?auto_94192 ?auto_94191 ) ( ON ?auto_94193 ?auto_94192 ) ( ON ?auto_94194 ?auto_94193 ) ( ON ?auto_94195 ?auto_94194 ) ( not ( = ?auto_94189 ?auto_94190 ) ) ( not ( = ?auto_94189 ?auto_94191 ) ) ( not ( = ?auto_94189 ?auto_94192 ) ) ( not ( = ?auto_94189 ?auto_94193 ) ) ( not ( = ?auto_94189 ?auto_94194 ) ) ( not ( = ?auto_94189 ?auto_94195 ) ) ( not ( = ?auto_94189 ?auto_94196 ) ) ( not ( = ?auto_94190 ?auto_94191 ) ) ( not ( = ?auto_94190 ?auto_94192 ) ) ( not ( = ?auto_94190 ?auto_94193 ) ) ( not ( = ?auto_94190 ?auto_94194 ) ) ( not ( = ?auto_94190 ?auto_94195 ) ) ( not ( = ?auto_94190 ?auto_94196 ) ) ( not ( = ?auto_94191 ?auto_94192 ) ) ( not ( = ?auto_94191 ?auto_94193 ) ) ( not ( = ?auto_94191 ?auto_94194 ) ) ( not ( = ?auto_94191 ?auto_94195 ) ) ( not ( = ?auto_94191 ?auto_94196 ) ) ( not ( = ?auto_94192 ?auto_94193 ) ) ( not ( = ?auto_94192 ?auto_94194 ) ) ( not ( = ?auto_94192 ?auto_94195 ) ) ( not ( = ?auto_94192 ?auto_94196 ) ) ( not ( = ?auto_94193 ?auto_94194 ) ) ( not ( = ?auto_94193 ?auto_94195 ) ) ( not ( = ?auto_94193 ?auto_94196 ) ) ( not ( = ?auto_94194 ?auto_94195 ) ) ( not ( = ?auto_94194 ?auto_94196 ) ) ( not ( = ?auto_94195 ?auto_94196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94196 ?auto_94195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94198 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_94198 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_94198 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94199 - BLOCK
    )
    :vars
    (
      ?auto_94200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94199 ?auto_94200 ) ( CLEAR ?auto_94199 ) ( HAND-EMPTY ) ( not ( = ?auto_94199 ?auto_94200 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94199 ?auto_94200 )
      ( MAKE-1PILE ?auto_94199 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94207 - BLOCK
      ?auto_94208 - BLOCK
      ?auto_94209 - BLOCK
      ?auto_94210 - BLOCK
      ?auto_94211 - BLOCK
      ?auto_94212 - BLOCK
    )
    :vars
    (
      ?auto_94213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94213 ?auto_94212 ) ( CLEAR ?auto_94213 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94207 ) ( ON ?auto_94208 ?auto_94207 ) ( ON ?auto_94209 ?auto_94208 ) ( ON ?auto_94210 ?auto_94209 ) ( ON ?auto_94211 ?auto_94210 ) ( ON ?auto_94212 ?auto_94211 ) ( not ( = ?auto_94207 ?auto_94208 ) ) ( not ( = ?auto_94207 ?auto_94209 ) ) ( not ( = ?auto_94207 ?auto_94210 ) ) ( not ( = ?auto_94207 ?auto_94211 ) ) ( not ( = ?auto_94207 ?auto_94212 ) ) ( not ( = ?auto_94207 ?auto_94213 ) ) ( not ( = ?auto_94208 ?auto_94209 ) ) ( not ( = ?auto_94208 ?auto_94210 ) ) ( not ( = ?auto_94208 ?auto_94211 ) ) ( not ( = ?auto_94208 ?auto_94212 ) ) ( not ( = ?auto_94208 ?auto_94213 ) ) ( not ( = ?auto_94209 ?auto_94210 ) ) ( not ( = ?auto_94209 ?auto_94211 ) ) ( not ( = ?auto_94209 ?auto_94212 ) ) ( not ( = ?auto_94209 ?auto_94213 ) ) ( not ( = ?auto_94210 ?auto_94211 ) ) ( not ( = ?auto_94210 ?auto_94212 ) ) ( not ( = ?auto_94210 ?auto_94213 ) ) ( not ( = ?auto_94211 ?auto_94212 ) ) ( not ( = ?auto_94211 ?auto_94213 ) ) ( not ( = ?auto_94212 ?auto_94213 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94213 ?auto_94212 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94214 - BLOCK
      ?auto_94215 - BLOCK
      ?auto_94216 - BLOCK
      ?auto_94217 - BLOCK
      ?auto_94218 - BLOCK
      ?auto_94219 - BLOCK
    )
    :vars
    (
      ?auto_94220 - BLOCK
      ?auto_94221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94220 ?auto_94219 ) ( CLEAR ?auto_94220 ) ( ON-TABLE ?auto_94214 ) ( ON ?auto_94215 ?auto_94214 ) ( ON ?auto_94216 ?auto_94215 ) ( ON ?auto_94217 ?auto_94216 ) ( ON ?auto_94218 ?auto_94217 ) ( ON ?auto_94219 ?auto_94218 ) ( not ( = ?auto_94214 ?auto_94215 ) ) ( not ( = ?auto_94214 ?auto_94216 ) ) ( not ( = ?auto_94214 ?auto_94217 ) ) ( not ( = ?auto_94214 ?auto_94218 ) ) ( not ( = ?auto_94214 ?auto_94219 ) ) ( not ( = ?auto_94214 ?auto_94220 ) ) ( not ( = ?auto_94215 ?auto_94216 ) ) ( not ( = ?auto_94215 ?auto_94217 ) ) ( not ( = ?auto_94215 ?auto_94218 ) ) ( not ( = ?auto_94215 ?auto_94219 ) ) ( not ( = ?auto_94215 ?auto_94220 ) ) ( not ( = ?auto_94216 ?auto_94217 ) ) ( not ( = ?auto_94216 ?auto_94218 ) ) ( not ( = ?auto_94216 ?auto_94219 ) ) ( not ( = ?auto_94216 ?auto_94220 ) ) ( not ( = ?auto_94217 ?auto_94218 ) ) ( not ( = ?auto_94217 ?auto_94219 ) ) ( not ( = ?auto_94217 ?auto_94220 ) ) ( not ( = ?auto_94218 ?auto_94219 ) ) ( not ( = ?auto_94218 ?auto_94220 ) ) ( not ( = ?auto_94219 ?auto_94220 ) ) ( HOLDING ?auto_94221 ) ( not ( = ?auto_94214 ?auto_94221 ) ) ( not ( = ?auto_94215 ?auto_94221 ) ) ( not ( = ?auto_94216 ?auto_94221 ) ) ( not ( = ?auto_94217 ?auto_94221 ) ) ( not ( = ?auto_94218 ?auto_94221 ) ) ( not ( = ?auto_94219 ?auto_94221 ) ) ( not ( = ?auto_94220 ?auto_94221 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_94221 )
      ( MAKE-6PILE ?auto_94214 ?auto_94215 ?auto_94216 ?auto_94217 ?auto_94218 ?auto_94219 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94222 - BLOCK
      ?auto_94223 - BLOCK
      ?auto_94224 - BLOCK
      ?auto_94225 - BLOCK
      ?auto_94226 - BLOCK
      ?auto_94227 - BLOCK
    )
    :vars
    (
      ?auto_94229 - BLOCK
      ?auto_94228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94229 ?auto_94227 ) ( ON-TABLE ?auto_94222 ) ( ON ?auto_94223 ?auto_94222 ) ( ON ?auto_94224 ?auto_94223 ) ( ON ?auto_94225 ?auto_94224 ) ( ON ?auto_94226 ?auto_94225 ) ( ON ?auto_94227 ?auto_94226 ) ( not ( = ?auto_94222 ?auto_94223 ) ) ( not ( = ?auto_94222 ?auto_94224 ) ) ( not ( = ?auto_94222 ?auto_94225 ) ) ( not ( = ?auto_94222 ?auto_94226 ) ) ( not ( = ?auto_94222 ?auto_94227 ) ) ( not ( = ?auto_94222 ?auto_94229 ) ) ( not ( = ?auto_94223 ?auto_94224 ) ) ( not ( = ?auto_94223 ?auto_94225 ) ) ( not ( = ?auto_94223 ?auto_94226 ) ) ( not ( = ?auto_94223 ?auto_94227 ) ) ( not ( = ?auto_94223 ?auto_94229 ) ) ( not ( = ?auto_94224 ?auto_94225 ) ) ( not ( = ?auto_94224 ?auto_94226 ) ) ( not ( = ?auto_94224 ?auto_94227 ) ) ( not ( = ?auto_94224 ?auto_94229 ) ) ( not ( = ?auto_94225 ?auto_94226 ) ) ( not ( = ?auto_94225 ?auto_94227 ) ) ( not ( = ?auto_94225 ?auto_94229 ) ) ( not ( = ?auto_94226 ?auto_94227 ) ) ( not ( = ?auto_94226 ?auto_94229 ) ) ( not ( = ?auto_94227 ?auto_94229 ) ) ( not ( = ?auto_94222 ?auto_94228 ) ) ( not ( = ?auto_94223 ?auto_94228 ) ) ( not ( = ?auto_94224 ?auto_94228 ) ) ( not ( = ?auto_94225 ?auto_94228 ) ) ( not ( = ?auto_94226 ?auto_94228 ) ) ( not ( = ?auto_94227 ?auto_94228 ) ) ( not ( = ?auto_94229 ?auto_94228 ) ) ( ON ?auto_94228 ?auto_94229 ) ( CLEAR ?auto_94228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94222 ?auto_94223 ?auto_94224 ?auto_94225 ?auto_94226 ?auto_94227 ?auto_94229 )
      ( MAKE-6PILE ?auto_94222 ?auto_94223 ?auto_94224 ?auto_94225 ?auto_94226 ?auto_94227 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94232 - BLOCK
      ?auto_94233 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_94233 ) ( CLEAR ?auto_94232 ) ( ON-TABLE ?auto_94232 ) ( not ( = ?auto_94232 ?auto_94233 ) ) )
    :subtasks
    ( ( !STACK ?auto_94233 ?auto_94232 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94234 - BLOCK
      ?auto_94235 - BLOCK
    )
    :vars
    (
      ?auto_94236 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94234 ) ( ON-TABLE ?auto_94234 ) ( not ( = ?auto_94234 ?auto_94235 ) ) ( ON ?auto_94235 ?auto_94236 ) ( CLEAR ?auto_94235 ) ( HAND-EMPTY ) ( not ( = ?auto_94234 ?auto_94236 ) ) ( not ( = ?auto_94235 ?auto_94236 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94235 ?auto_94236 )
      ( MAKE-2PILE ?auto_94234 ?auto_94235 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94237 - BLOCK
      ?auto_94238 - BLOCK
    )
    :vars
    (
      ?auto_94239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94237 ?auto_94238 ) ) ( ON ?auto_94238 ?auto_94239 ) ( CLEAR ?auto_94238 ) ( not ( = ?auto_94237 ?auto_94239 ) ) ( not ( = ?auto_94238 ?auto_94239 ) ) ( HOLDING ?auto_94237 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94237 )
      ( MAKE-2PILE ?auto_94237 ?auto_94238 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94240 - BLOCK
      ?auto_94241 - BLOCK
    )
    :vars
    (
      ?auto_94242 - BLOCK
      ?auto_94246 - BLOCK
      ?auto_94245 - BLOCK
      ?auto_94244 - BLOCK
      ?auto_94243 - BLOCK
      ?auto_94247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94240 ?auto_94241 ) ) ( ON ?auto_94241 ?auto_94242 ) ( not ( = ?auto_94240 ?auto_94242 ) ) ( not ( = ?auto_94241 ?auto_94242 ) ) ( ON ?auto_94240 ?auto_94241 ) ( CLEAR ?auto_94240 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94246 ) ( ON ?auto_94245 ?auto_94246 ) ( ON ?auto_94244 ?auto_94245 ) ( ON ?auto_94243 ?auto_94244 ) ( ON ?auto_94247 ?auto_94243 ) ( ON ?auto_94242 ?auto_94247 ) ( not ( = ?auto_94246 ?auto_94245 ) ) ( not ( = ?auto_94246 ?auto_94244 ) ) ( not ( = ?auto_94246 ?auto_94243 ) ) ( not ( = ?auto_94246 ?auto_94247 ) ) ( not ( = ?auto_94246 ?auto_94242 ) ) ( not ( = ?auto_94246 ?auto_94241 ) ) ( not ( = ?auto_94246 ?auto_94240 ) ) ( not ( = ?auto_94245 ?auto_94244 ) ) ( not ( = ?auto_94245 ?auto_94243 ) ) ( not ( = ?auto_94245 ?auto_94247 ) ) ( not ( = ?auto_94245 ?auto_94242 ) ) ( not ( = ?auto_94245 ?auto_94241 ) ) ( not ( = ?auto_94245 ?auto_94240 ) ) ( not ( = ?auto_94244 ?auto_94243 ) ) ( not ( = ?auto_94244 ?auto_94247 ) ) ( not ( = ?auto_94244 ?auto_94242 ) ) ( not ( = ?auto_94244 ?auto_94241 ) ) ( not ( = ?auto_94244 ?auto_94240 ) ) ( not ( = ?auto_94243 ?auto_94247 ) ) ( not ( = ?auto_94243 ?auto_94242 ) ) ( not ( = ?auto_94243 ?auto_94241 ) ) ( not ( = ?auto_94243 ?auto_94240 ) ) ( not ( = ?auto_94247 ?auto_94242 ) ) ( not ( = ?auto_94247 ?auto_94241 ) ) ( not ( = ?auto_94247 ?auto_94240 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94246 ?auto_94245 ?auto_94244 ?auto_94243 ?auto_94247 ?auto_94242 ?auto_94241 )
      ( MAKE-2PILE ?auto_94240 ?auto_94241 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94253 - BLOCK
      ?auto_94254 - BLOCK
      ?auto_94255 - BLOCK
      ?auto_94256 - BLOCK
      ?auto_94257 - BLOCK
    )
    :vars
    (
      ?auto_94258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94258 ?auto_94257 ) ( CLEAR ?auto_94258 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94253 ) ( ON ?auto_94254 ?auto_94253 ) ( ON ?auto_94255 ?auto_94254 ) ( ON ?auto_94256 ?auto_94255 ) ( ON ?auto_94257 ?auto_94256 ) ( not ( = ?auto_94253 ?auto_94254 ) ) ( not ( = ?auto_94253 ?auto_94255 ) ) ( not ( = ?auto_94253 ?auto_94256 ) ) ( not ( = ?auto_94253 ?auto_94257 ) ) ( not ( = ?auto_94253 ?auto_94258 ) ) ( not ( = ?auto_94254 ?auto_94255 ) ) ( not ( = ?auto_94254 ?auto_94256 ) ) ( not ( = ?auto_94254 ?auto_94257 ) ) ( not ( = ?auto_94254 ?auto_94258 ) ) ( not ( = ?auto_94255 ?auto_94256 ) ) ( not ( = ?auto_94255 ?auto_94257 ) ) ( not ( = ?auto_94255 ?auto_94258 ) ) ( not ( = ?auto_94256 ?auto_94257 ) ) ( not ( = ?auto_94256 ?auto_94258 ) ) ( not ( = ?auto_94257 ?auto_94258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94258 ?auto_94257 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94259 - BLOCK
      ?auto_94260 - BLOCK
      ?auto_94261 - BLOCK
      ?auto_94262 - BLOCK
      ?auto_94263 - BLOCK
    )
    :vars
    (
      ?auto_94264 - BLOCK
      ?auto_94265 - BLOCK
      ?auto_94266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94264 ?auto_94263 ) ( CLEAR ?auto_94264 ) ( ON-TABLE ?auto_94259 ) ( ON ?auto_94260 ?auto_94259 ) ( ON ?auto_94261 ?auto_94260 ) ( ON ?auto_94262 ?auto_94261 ) ( ON ?auto_94263 ?auto_94262 ) ( not ( = ?auto_94259 ?auto_94260 ) ) ( not ( = ?auto_94259 ?auto_94261 ) ) ( not ( = ?auto_94259 ?auto_94262 ) ) ( not ( = ?auto_94259 ?auto_94263 ) ) ( not ( = ?auto_94259 ?auto_94264 ) ) ( not ( = ?auto_94260 ?auto_94261 ) ) ( not ( = ?auto_94260 ?auto_94262 ) ) ( not ( = ?auto_94260 ?auto_94263 ) ) ( not ( = ?auto_94260 ?auto_94264 ) ) ( not ( = ?auto_94261 ?auto_94262 ) ) ( not ( = ?auto_94261 ?auto_94263 ) ) ( not ( = ?auto_94261 ?auto_94264 ) ) ( not ( = ?auto_94262 ?auto_94263 ) ) ( not ( = ?auto_94262 ?auto_94264 ) ) ( not ( = ?auto_94263 ?auto_94264 ) ) ( HOLDING ?auto_94265 ) ( CLEAR ?auto_94266 ) ( not ( = ?auto_94259 ?auto_94265 ) ) ( not ( = ?auto_94259 ?auto_94266 ) ) ( not ( = ?auto_94260 ?auto_94265 ) ) ( not ( = ?auto_94260 ?auto_94266 ) ) ( not ( = ?auto_94261 ?auto_94265 ) ) ( not ( = ?auto_94261 ?auto_94266 ) ) ( not ( = ?auto_94262 ?auto_94265 ) ) ( not ( = ?auto_94262 ?auto_94266 ) ) ( not ( = ?auto_94263 ?auto_94265 ) ) ( not ( = ?auto_94263 ?auto_94266 ) ) ( not ( = ?auto_94264 ?auto_94265 ) ) ( not ( = ?auto_94264 ?auto_94266 ) ) ( not ( = ?auto_94265 ?auto_94266 ) ) )
    :subtasks
    ( ( !STACK ?auto_94265 ?auto_94266 )
      ( MAKE-5PILE ?auto_94259 ?auto_94260 ?auto_94261 ?auto_94262 ?auto_94263 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95185 - BLOCK
      ?auto_95186 - BLOCK
      ?auto_95187 - BLOCK
      ?auto_95188 - BLOCK
      ?auto_95189 - BLOCK
    )
    :vars
    (
      ?auto_95190 - BLOCK
      ?auto_95191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95190 ?auto_95189 ) ( ON-TABLE ?auto_95185 ) ( ON ?auto_95186 ?auto_95185 ) ( ON ?auto_95187 ?auto_95186 ) ( ON ?auto_95188 ?auto_95187 ) ( ON ?auto_95189 ?auto_95188 ) ( not ( = ?auto_95185 ?auto_95186 ) ) ( not ( = ?auto_95185 ?auto_95187 ) ) ( not ( = ?auto_95185 ?auto_95188 ) ) ( not ( = ?auto_95185 ?auto_95189 ) ) ( not ( = ?auto_95185 ?auto_95190 ) ) ( not ( = ?auto_95186 ?auto_95187 ) ) ( not ( = ?auto_95186 ?auto_95188 ) ) ( not ( = ?auto_95186 ?auto_95189 ) ) ( not ( = ?auto_95186 ?auto_95190 ) ) ( not ( = ?auto_95187 ?auto_95188 ) ) ( not ( = ?auto_95187 ?auto_95189 ) ) ( not ( = ?auto_95187 ?auto_95190 ) ) ( not ( = ?auto_95188 ?auto_95189 ) ) ( not ( = ?auto_95188 ?auto_95190 ) ) ( not ( = ?auto_95189 ?auto_95190 ) ) ( not ( = ?auto_95185 ?auto_95191 ) ) ( not ( = ?auto_95186 ?auto_95191 ) ) ( not ( = ?auto_95187 ?auto_95191 ) ) ( not ( = ?auto_95188 ?auto_95191 ) ) ( not ( = ?auto_95189 ?auto_95191 ) ) ( not ( = ?auto_95190 ?auto_95191 ) ) ( ON ?auto_95191 ?auto_95190 ) ( CLEAR ?auto_95191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95185 ?auto_95186 ?auto_95187 ?auto_95188 ?auto_95189 ?auto_95190 )
      ( MAKE-5PILE ?auto_95185 ?auto_95186 ?auto_95187 ?auto_95188 ?auto_95189 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94275 - BLOCK
      ?auto_94276 - BLOCK
      ?auto_94277 - BLOCK
      ?auto_94278 - BLOCK
      ?auto_94279 - BLOCK
    )
    :vars
    (
      ?auto_94282 - BLOCK
      ?auto_94281 - BLOCK
      ?auto_94280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94282 ?auto_94279 ) ( ON-TABLE ?auto_94275 ) ( ON ?auto_94276 ?auto_94275 ) ( ON ?auto_94277 ?auto_94276 ) ( ON ?auto_94278 ?auto_94277 ) ( ON ?auto_94279 ?auto_94278 ) ( not ( = ?auto_94275 ?auto_94276 ) ) ( not ( = ?auto_94275 ?auto_94277 ) ) ( not ( = ?auto_94275 ?auto_94278 ) ) ( not ( = ?auto_94275 ?auto_94279 ) ) ( not ( = ?auto_94275 ?auto_94282 ) ) ( not ( = ?auto_94276 ?auto_94277 ) ) ( not ( = ?auto_94276 ?auto_94278 ) ) ( not ( = ?auto_94276 ?auto_94279 ) ) ( not ( = ?auto_94276 ?auto_94282 ) ) ( not ( = ?auto_94277 ?auto_94278 ) ) ( not ( = ?auto_94277 ?auto_94279 ) ) ( not ( = ?auto_94277 ?auto_94282 ) ) ( not ( = ?auto_94278 ?auto_94279 ) ) ( not ( = ?auto_94278 ?auto_94282 ) ) ( not ( = ?auto_94279 ?auto_94282 ) ) ( not ( = ?auto_94275 ?auto_94281 ) ) ( not ( = ?auto_94275 ?auto_94280 ) ) ( not ( = ?auto_94276 ?auto_94281 ) ) ( not ( = ?auto_94276 ?auto_94280 ) ) ( not ( = ?auto_94277 ?auto_94281 ) ) ( not ( = ?auto_94277 ?auto_94280 ) ) ( not ( = ?auto_94278 ?auto_94281 ) ) ( not ( = ?auto_94278 ?auto_94280 ) ) ( not ( = ?auto_94279 ?auto_94281 ) ) ( not ( = ?auto_94279 ?auto_94280 ) ) ( not ( = ?auto_94282 ?auto_94281 ) ) ( not ( = ?auto_94282 ?auto_94280 ) ) ( not ( = ?auto_94281 ?auto_94280 ) ) ( ON ?auto_94281 ?auto_94282 ) ( CLEAR ?auto_94281 ) ( HOLDING ?auto_94280 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94280 )
      ( MAKE-5PILE ?auto_94275 ?auto_94276 ?auto_94277 ?auto_94278 ?auto_94279 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94283 - BLOCK
      ?auto_94284 - BLOCK
      ?auto_94285 - BLOCK
      ?auto_94286 - BLOCK
      ?auto_94287 - BLOCK
    )
    :vars
    (
      ?auto_94289 - BLOCK
      ?auto_94290 - BLOCK
      ?auto_94288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94289 ?auto_94287 ) ( ON-TABLE ?auto_94283 ) ( ON ?auto_94284 ?auto_94283 ) ( ON ?auto_94285 ?auto_94284 ) ( ON ?auto_94286 ?auto_94285 ) ( ON ?auto_94287 ?auto_94286 ) ( not ( = ?auto_94283 ?auto_94284 ) ) ( not ( = ?auto_94283 ?auto_94285 ) ) ( not ( = ?auto_94283 ?auto_94286 ) ) ( not ( = ?auto_94283 ?auto_94287 ) ) ( not ( = ?auto_94283 ?auto_94289 ) ) ( not ( = ?auto_94284 ?auto_94285 ) ) ( not ( = ?auto_94284 ?auto_94286 ) ) ( not ( = ?auto_94284 ?auto_94287 ) ) ( not ( = ?auto_94284 ?auto_94289 ) ) ( not ( = ?auto_94285 ?auto_94286 ) ) ( not ( = ?auto_94285 ?auto_94287 ) ) ( not ( = ?auto_94285 ?auto_94289 ) ) ( not ( = ?auto_94286 ?auto_94287 ) ) ( not ( = ?auto_94286 ?auto_94289 ) ) ( not ( = ?auto_94287 ?auto_94289 ) ) ( not ( = ?auto_94283 ?auto_94290 ) ) ( not ( = ?auto_94283 ?auto_94288 ) ) ( not ( = ?auto_94284 ?auto_94290 ) ) ( not ( = ?auto_94284 ?auto_94288 ) ) ( not ( = ?auto_94285 ?auto_94290 ) ) ( not ( = ?auto_94285 ?auto_94288 ) ) ( not ( = ?auto_94286 ?auto_94290 ) ) ( not ( = ?auto_94286 ?auto_94288 ) ) ( not ( = ?auto_94287 ?auto_94290 ) ) ( not ( = ?auto_94287 ?auto_94288 ) ) ( not ( = ?auto_94289 ?auto_94290 ) ) ( not ( = ?auto_94289 ?auto_94288 ) ) ( not ( = ?auto_94290 ?auto_94288 ) ) ( ON ?auto_94290 ?auto_94289 ) ( ON ?auto_94288 ?auto_94290 ) ( CLEAR ?auto_94288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94283 ?auto_94284 ?auto_94285 ?auto_94286 ?auto_94287 ?auto_94289 ?auto_94290 )
      ( MAKE-5PILE ?auto_94283 ?auto_94284 ?auto_94285 ?auto_94286 ?auto_94287 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94294 - BLOCK
      ?auto_94295 - BLOCK
      ?auto_94296 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_94296 ) ( CLEAR ?auto_94295 ) ( ON-TABLE ?auto_94294 ) ( ON ?auto_94295 ?auto_94294 ) ( not ( = ?auto_94294 ?auto_94295 ) ) ( not ( = ?auto_94294 ?auto_94296 ) ) ( not ( = ?auto_94295 ?auto_94296 ) ) )
    :subtasks
    ( ( !STACK ?auto_94296 ?auto_94295 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94297 - BLOCK
      ?auto_94298 - BLOCK
      ?auto_94299 - BLOCK
    )
    :vars
    (
      ?auto_94300 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94298 ) ( ON-TABLE ?auto_94297 ) ( ON ?auto_94298 ?auto_94297 ) ( not ( = ?auto_94297 ?auto_94298 ) ) ( not ( = ?auto_94297 ?auto_94299 ) ) ( not ( = ?auto_94298 ?auto_94299 ) ) ( ON ?auto_94299 ?auto_94300 ) ( CLEAR ?auto_94299 ) ( HAND-EMPTY ) ( not ( = ?auto_94297 ?auto_94300 ) ) ( not ( = ?auto_94298 ?auto_94300 ) ) ( not ( = ?auto_94299 ?auto_94300 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94299 ?auto_94300 )
      ( MAKE-3PILE ?auto_94297 ?auto_94298 ?auto_94299 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94301 - BLOCK
      ?auto_94302 - BLOCK
      ?auto_94303 - BLOCK
    )
    :vars
    (
      ?auto_94304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94301 ) ( not ( = ?auto_94301 ?auto_94302 ) ) ( not ( = ?auto_94301 ?auto_94303 ) ) ( not ( = ?auto_94302 ?auto_94303 ) ) ( ON ?auto_94303 ?auto_94304 ) ( CLEAR ?auto_94303 ) ( not ( = ?auto_94301 ?auto_94304 ) ) ( not ( = ?auto_94302 ?auto_94304 ) ) ( not ( = ?auto_94303 ?auto_94304 ) ) ( HOLDING ?auto_94302 ) ( CLEAR ?auto_94301 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94301 ?auto_94302 )
      ( MAKE-3PILE ?auto_94301 ?auto_94302 ?auto_94303 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94305 - BLOCK
      ?auto_94306 - BLOCK
      ?auto_94307 - BLOCK
    )
    :vars
    (
      ?auto_94308 - BLOCK
      ?auto_94312 - BLOCK
      ?auto_94310 - BLOCK
      ?auto_94309 - BLOCK
      ?auto_94311 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94305 ) ( not ( = ?auto_94305 ?auto_94306 ) ) ( not ( = ?auto_94305 ?auto_94307 ) ) ( not ( = ?auto_94306 ?auto_94307 ) ) ( ON ?auto_94307 ?auto_94308 ) ( not ( = ?auto_94305 ?auto_94308 ) ) ( not ( = ?auto_94306 ?auto_94308 ) ) ( not ( = ?auto_94307 ?auto_94308 ) ) ( CLEAR ?auto_94305 ) ( ON ?auto_94306 ?auto_94307 ) ( CLEAR ?auto_94306 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94312 ) ( ON ?auto_94310 ?auto_94312 ) ( ON ?auto_94309 ?auto_94310 ) ( ON ?auto_94311 ?auto_94309 ) ( ON ?auto_94308 ?auto_94311 ) ( not ( = ?auto_94312 ?auto_94310 ) ) ( not ( = ?auto_94312 ?auto_94309 ) ) ( not ( = ?auto_94312 ?auto_94311 ) ) ( not ( = ?auto_94312 ?auto_94308 ) ) ( not ( = ?auto_94312 ?auto_94307 ) ) ( not ( = ?auto_94312 ?auto_94306 ) ) ( not ( = ?auto_94310 ?auto_94309 ) ) ( not ( = ?auto_94310 ?auto_94311 ) ) ( not ( = ?auto_94310 ?auto_94308 ) ) ( not ( = ?auto_94310 ?auto_94307 ) ) ( not ( = ?auto_94310 ?auto_94306 ) ) ( not ( = ?auto_94309 ?auto_94311 ) ) ( not ( = ?auto_94309 ?auto_94308 ) ) ( not ( = ?auto_94309 ?auto_94307 ) ) ( not ( = ?auto_94309 ?auto_94306 ) ) ( not ( = ?auto_94311 ?auto_94308 ) ) ( not ( = ?auto_94311 ?auto_94307 ) ) ( not ( = ?auto_94311 ?auto_94306 ) ) ( not ( = ?auto_94305 ?auto_94312 ) ) ( not ( = ?auto_94305 ?auto_94310 ) ) ( not ( = ?auto_94305 ?auto_94309 ) ) ( not ( = ?auto_94305 ?auto_94311 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94312 ?auto_94310 ?auto_94309 ?auto_94311 ?auto_94308 ?auto_94307 )
      ( MAKE-3PILE ?auto_94305 ?auto_94306 ?auto_94307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94313 - BLOCK
      ?auto_94314 - BLOCK
      ?auto_94315 - BLOCK
    )
    :vars
    (
      ?auto_94316 - BLOCK
      ?auto_94317 - BLOCK
      ?auto_94318 - BLOCK
      ?auto_94319 - BLOCK
      ?auto_94320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94313 ?auto_94314 ) ) ( not ( = ?auto_94313 ?auto_94315 ) ) ( not ( = ?auto_94314 ?auto_94315 ) ) ( ON ?auto_94315 ?auto_94316 ) ( not ( = ?auto_94313 ?auto_94316 ) ) ( not ( = ?auto_94314 ?auto_94316 ) ) ( not ( = ?auto_94315 ?auto_94316 ) ) ( ON ?auto_94314 ?auto_94315 ) ( CLEAR ?auto_94314 ) ( ON-TABLE ?auto_94317 ) ( ON ?auto_94318 ?auto_94317 ) ( ON ?auto_94319 ?auto_94318 ) ( ON ?auto_94320 ?auto_94319 ) ( ON ?auto_94316 ?auto_94320 ) ( not ( = ?auto_94317 ?auto_94318 ) ) ( not ( = ?auto_94317 ?auto_94319 ) ) ( not ( = ?auto_94317 ?auto_94320 ) ) ( not ( = ?auto_94317 ?auto_94316 ) ) ( not ( = ?auto_94317 ?auto_94315 ) ) ( not ( = ?auto_94317 ?auto_94314 ) ) ( not ( = ?auto_94318 ?auto_94319 ) ) ( not ( = ?auto_94318 ?auto_94320 ) ) ( not ( = ?auto_94318 ?auto_94316 ) ) ( not ( = ?auto_94318 ?auto_94315 ) ) ( not ( = ?auto_94318 ?auto_94314 ) ) ( not ( = ?auto_94319 ?auto_94320 ) ) ( not ( = ?auto_94319 ?auto_94316 ) ) ( not ( = ?auto_94319 ?auto_94315 ) ) ( not ( = ?auto_94319 ?auto_94314 ) ) ( not ( = ?auto_94320 ?auto_94316 ) ) ( not ( = ?auto_94320 ?auto_94315 ) ) ( not ( = ?auto_94320 ?auto_94314 ) ) ( not ( = ?auto_94313 ?auto_94317 ) ) ( not ( = ?auto_94313 ?auto_94318 ) ) ( not ( = ?auto_94313 ?auto_94319 ) ) ( not ( = ?auto_94313 ?auto_94320 ) ) ( HOLDING ?auto_94313 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94313 )
      ( MAKE-3PILE ?auto_94313 ?auto_94314 ?auto_94315 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94321 - BLOCK
      ?auto_94322 - BLOCK
      ?auto_94323 - BLOCK
    )
    :vars
    (
      ?auto_94327 - BLOCK
      ?auto_94328 - BLOCK
      ?auto_94325 - BLOCK
      ?auto_94324 - BLOCK
      ?auto_94326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94321 ?auto_94322 ) ) ( not ( = ?auto_94321 ?auto_94323 ) ) ( not ( = ?auto_94322 ?auto_94323 ) ) ( ON ?auto_94323 ?auto_94327 ) ( not ( = ?auto_94321 ?auto_94327 ) ) ( not ( = ?auto_94322 ?auto_94327 ) ) ( not ( = ?auto_94323 ?auto_94327 ) ) ( ON ?auto_94322 ?auto_94323 ) ( ON-TABLE ?auto_94328 ) ( ON ?auto_94325 ?auto_94328 ) ( ON ?auto_94324 ?auto_94325 ) ( ON ?auto_94326 ?auto_94324 ) ( ON ?auto_94327 ?auto_94326 ) ( not ( = ?auto_94328 ?auto_94325 ) ) ( not ( = ?auto_94328 ?auto_94324 ) ) ( not ( = ?auto_94328 ?auto_94326 ) ) ( not ( = ?auto_94328 ?auto_94327 ) ) ( not ( = ?auto_94328 ?auto_94323 ) ) ( not ( = ?auto_94328 ?auto_94322 ) ) ( not ( = ?auto_94325 ?auto_94324 ) ) ( not ( = ?auto_94325 ?auto_94326 ) ) ( not ( = ?auto_94325 ?auto_94327 ) ) ( not ( = ?auto_94325 ?auto_94323 ) ) ( not ( = ?auto_94325 ?auto_94322 ) ) ( not ( = ?auto_94324 ?auto_94326 ) ) ( not ( = ?auto_94324 ?auto_94327 ) ) ( not ( = ?auto_94324 ?auto_94323 ) ) ( not ( = ?auto_94324 ?auto_94322 ) ) ( not ( = ?auto_94326 ?auto_94327 ) ) ( not ( = ?auto_94326 ?auto_94323 ) ) ( not ( = ?auto_94326 ?auto_94322 ) ) ( not ( = ?auto_94321 ?auto_94328 ) ) ( not ( = ?auto_94321 ?auto_94325 ) ) ( not ( = ?auto_94321 ?auto_94324 ) ) ( not ( = ?auto_94321 ?auto_94326 ) ) ( ON ?auto_94321 ?auto_94322 ) ( CLEAR ?auto_94321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94328 ?auto_94325 ?auto_94324 ?auto_94326 ?auto_94327 ?auto_94323 ?auto_94322 )
      ( MAKE-3PILE ?auto_94321 ?auto_94322 ?auto_94323 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94333 - BLOCK
      ?auto_94334 - BLOCK
      ?auto_94335 - BLOCK
      ?auto_94336 - BLOCK
    )
    :vars
    (
      ?auto_94337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94337 ?auto_94336 ) ( CLEAR ?auto_94337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94333 ) ( ON ?auto_94334 ?auto_94333 ) ( ON ?auto_94335 ?auto_94334 ) ( ON ?auto_94336 ?auto_94335 ) ( not ( = ?auto_94333 ?auto_94334 ) ) ( not ( = ?auto_94333 ?auto_94335 ) ) ( not ( = ?auto_94333 ?auto_94336 ) ) ( not ( = ?auto_94333 ?auto_94337 ) ) ( not ( = ?auto_94334 ?auto_94335 ) ) ( not ( = ?auto_94334 ?auto_94336 ) ) ( not ( = ?auto_94334 ?auto_94337 ) ) ( not ( = ?auto_94335 ?auto_94336 ) ) ( not ( = ?auto_94335 ?auto_94337 ) ) ( not ( = ?auto_94336 ?auto_94337 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94337 ?auto_94336 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94338 - BLOCK
      ?auto_94339 - BLOCK
      ?auto_94340 - BLOCK
      ?auto_94341 - BLOCK
    )
    :vars
    (
      ?auto_94342 - BLOCK
      ?auto_94343 - BLOCK
      ?auto_94344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94342 ?auto_94341 ) ( CLEAR ?auto_94342 ) ( ON-TABLE ?auto_94338 ) ( ON ?auto_94339 ?auto_94338 ) ( ON ?auto_94340 ?auto_94339 ) ( ON ?auto_94341 ?auto_94340 ) ( not ( = ?auto_94338 ?auto_94339 ) ) ( not ( = ?auto_94338 ?auto_94340 ) ) ( not ( = ?auto_94338 ?auto_94341 ) ) ( not ( = ?auto_94338 ?auto_94342 ) ) ( not ( = ?auto_94339 ?auto_94340 ) ) ( not ( = ?auto_94339 ?auto_94341 ) ) ( not ( = ?auto_94339 ?auto_94342 ) ) ( not ( = ?auto_94340 ?auto_94341 ) ) ( not ( = ?auto_94340 ?auto_94342 ) ) ( not ( = ?auto_94341 ?auto_94342 ) ) ( HOLDING ?auto_94343 ) ( CLEAR ?auto_94344 ) ( not ( = ?auto_94338 ?auto_94343 ) ) ( not ( = ?auto_94338 ?auto_94344 ) ) ( not ( = ?auto_94339 ?auto_94343 ) ) ( not ( = ?auto_94339 ?auto_94344 ) ) ( not ( = ?auto_94340 ?auto_94343 ) ) ( not ( = ?auto_94340 ?auto_94344 ) ) ( not ( = ?auto_94341 ?auto_94343 ) ) ( not ( = ?auto_94341 ?auto_94344 ) ) ( not ( = ?auto_94342 ?auto_94343 ) ) ( not ( = ?auto_94342 ?auto_94344 ) ) ( not ( = ?auto_94343 ?auto_94344 ) ) )
    :subtasks
    ( ( !STACK ?auto_94343 ?auto_94344 )
      ( MAKE-4PILE ?auto_94338 ?auto_94339 ?auto_94340 ?auto_94341 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94345 - BLOCK
      ?auto_94346 - BLOCK
      ?auto_94347 - BLOCK
      ?auto_94348 - BLOCK
    )
    :vars
    (
      ?auto_94351 - BLOCK
      ?auto_94350 - BLOCK
      ?auto_94349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94351 ?auto_94348 ) ( ON-TABLE ?auto_94345 ) ( ON ?auto_94346 ?auto_94345 ) ( ON ?auto_94347 ?auto_94346 ) ( ON ?auto_94348 ?auto_94347 ) ( not ( = ?auto_94345 ?auto_94346 ) ) ( not ( = ?auto_94345 ?auto_94347 ) ) ( not ( = ?auto_94345 ?auto_94348 ) ) ( not ( = ?auto_94345 ?auto_94351 ) ) ( not ( = ?auto_94346 ?auto_94347 ) ) ( not ( = ?auto_94346 ?auto_94348 ) ) ( not ( = ?auto_94346 ?auto_94351 ) ) ( not ( = ?auto_94347 ?auto_94348 ) ) ( not ( = ?auto_94347 ?auto_94351 ) ) ( not ( = ?auto_94348 ?auto_94351 ) ) ( CLEAR ?auto_94350 ) ( not ( = ?auto_94345 ?auto_94349 ) ) ( not ( = ?auto_94345 ?auto_94350 ) ) ( not ( = ?auto_94346 ?auto_94349 ) ) ( not ( = ?auto_94346 ?auto_94350 ) ) ( not ( = ?auto_94347 ?auto_94349 ) ) ( not ( = ?auto_94347 ?auto_94350 ) ) ( not ( = ?auto_94348 ?auto_94349 ) ) ( not ( = ?auto_94348 ?auto_94350 ) ) ( not ( = ?auto_94351 ?auto_94349 ) ) ( not ( = ?auto_94351 ?auto_94350 ) ) ( not ( = ?auto_94349 ?auto_94350 ) ) ( ON ?auto_94349 ?auto_94351 ) ( CLEAR ?auto_94349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94345 ?auto_94346 ?auto_94347 ?auto_94348 ?auto_94351 )
      ( MAKE-4PILE ?auto_94345 ?auto_94346 ?auto_94347 ?auto_94348 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94352 - BLOCK
      ?auto_94353 - BLOCK
      ?auto_94354 - BLOCK
      ?auto_94355 - BLOCK
    )
    :vars
    (
      ?auto_94356 - BLOCK
      ?auto_94358 - BLOCK
      ?auto_94357 - BLOCK
      ?auto_94359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94356 ?auto_94355 ) ( ON-TABLE ?auto_94352 ) ( ON ?auto_94353 ?auto_94352 ) ( ON ?auto_94354 ?auto_94353 ) ( ON ?auto_94355 ?auto_94354 ) ( not ( = ?auto_94352 ?auto_94353 ) ) ( not ( = ?auto_94352 ?auto_94354 ) ) ( not ( = ?auto_94352 ?auto_94355 ) ) ( not ( = ?auto_94352 ?auto_94356 ) ) ( not ( = ?auto_94353 ?auto_94354 ) ) ( not ( = ?auto_94353 ?auto_94355 ) ) ( not ( = ?auto_94353 ?auto_94356 ) ) ( not ( = ?auto_94354 ?auto_94355 ) ) ( not ( = ?auto_94354 ?auto_94356 ) ) ( not ( = ?auto_94355 ?auto_94356 ) ) ( not ( = ?auto_94352 ?auto_94358 ) ) ( not ( = ?auto_94352 ?auto_94357 ) ) ( not ( = ?auto_94353 ?auto_94358 ) ) ( not ( = ?auto_94353 ?auto_94357 ) ) ( not ( = ?auto_94354 ?auto_94358 ) ) ( not ( = ?auto_94354 ?auto_94357 ) ) ( not ( = ?auto_94355 ?auto_94358 ) ) ( not ( = ?auto_94355 ?auto_94357 ) ) ( not ( = ?auto_94356 ?auto_94358 ) ) ( not ( = ?auto_94356 ?auto_94357 ) ) ( not ( = ?auto_94358 ?auto_94357 ) ) ( ON ?auto_94358 ?auto_94356 ) ( CLEAR ?auto_94358 ) ( HOLDING ?auto_94357 ) ( CLEAR ?auto_94359 ) ( ON-TABLE ?auto_94359 ) ( not ( = ?auto_94359 ?auto_94357 ) ) ( not ( = ?auto_94352 ?auto_94359 ) ) ( not ( = ?auto_94353 ?auto_94359 ) ) ( not ( = ?auto_94354 ?auto_94359 ) ) ( not ( = ?auto_94355 ?auto_94359 ) ) ( not ( = ?auto_94356 ?auto_94359 ) ) ( not ( = ?auto_94358 ?auto_94359 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94359 ?auto_94357 )
      ( MAKE-4PILE ?auto_94352 ?auto_94353 ?auto_94354 ?auto_94355 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95414 - BLOCK
      ?auto_95415 - BLOCK
      ?auto_95416 - BLOCK
      ?auto_95417 - BLOCK
    )
    :vars
    (
      ?auto_95420 - BLOCK
      ?auto_95419 - BLOCK
      ?auto_95418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95420 ?auto_95417 ) ( ON-TABLE ?auto_95414 ) ( ON ?auto_95415 ?auto_95414 ) ( ON ?auto_95416 ?auto_95415 ) ( ON ?auto_95417 ?auto_95416 ) ( not ( = ?auto_95414 ?auto_95415 ) ) ( not ( = ?auto_95414 ?auto_95416 ) ) ( not ( = ?auto_95414 ?auto_95417 ) ) ( not ( = ?auto_95414 ?auto_95420 ) ) ( not ( = ?auto_95415 ?auto_95416 ) ) ( not ( = ?auto_95415 ?auto_95417 ) ) ( not ( = ?auto_95415 ?auto_95420 ) ) ( not ( = ?auto_95416 ?auto_95417 ) ) ( not ( = ?auto_95416 ?auto_95420 ) ) ( not ( = ?auto_95417 ?auto_95420 ) ) ( not ( = ?auto_95414 ?auto_95419 ) ) ( not ( = ?auto_95414 ?auto_95418 ) ) ( not ( = ?auto_95415 ?auto_95419 ) ) ( not ( = ?auto_95415 ?auto_95418 ) ) ( not ( = ?auto_95416 ?auto_95419 ) ) ( not ( = ?auto_95416 ?auto_95418 ) ) ( not ( = ?auto_95417 ?auto_95419 ) ) ( not ( = ?auto_95417 ?auto_95418 ) ) ( not ( = ?auto_95420 ?auto_95419 ) ) ( not ( = ?auto_95420 ?auto_95418 ) ) ( not ( = ?auto_95419 ?auto_95418 ) ) ( ON ?auto_95419 ?auto_95420 ) ( ON ?auto_95418 ?auto_95419 ) ( CLEAR ?auto_95418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95414 ?auto_95415 ?auto_95416 ?auto_95417 ?auto_95420 ?auto_95419 )
      ( MAKE-4PILE ?auto_95414 ?auto_95415 ?auto_95416 ?auto_95417 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94368 - BLOCK
      ?auto_94369 - BLOCK
      ?auto_94370 - BLOCK
      ?auto_94371 - BLOCK
    )
    :vars
    (
      ?auto_94374 - BLOCK
      ?auto_94372 - BLOCK
      ?auto_94375 - BLOCK
      ?auto_94373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94374 ?auto_94371 ) ( ON-TABLE ?auto_94368 ) ( ON ?auto_94369 ?auto_94368 ) ( ON ?auto_94370 ?auto_94369 ) ( ON ?auto_94371 ?auto_94370 ) ( not ( = ?auto_94368 ?auto_94369 ) ) ( not ( = ?auto_94368 ?auto_94370 ) ) ( not ( = ?auto_94368 ?auto_94371 ) ) ( not ( = ?auto_94368 ?auto_94374 ) ) ( not ( = ?auto_94369 ?auto_94370 ) ) ( not ( = ?auto_94369 ?auto_94371 ) ) ( not ( = ?auto_94369 ?auto_94374 ) ) ( not ( = ?auto_94370 ?auto_94371 ) ) ( not ( = ?auto_94370 ?auto_94374 ) ) ( not ( = ?auto_94371 ?auto_94374 ) ) ( not ( = ?auto_94368 ?auto_94372 ) ) ( not ( = ?auto_94368 ?auto_94375 ) ) ( not ( = ?auto_94369 ?auto_94372 ) ) ( not ( = ?auto_94369 ?auto_94375 ) ) ( not ( = ?auto_94370 ?auto_94372 ) ) ( not ( = ?auto_94370 ?auto_94375 ) ) ( not ( = ?auto_94371 ?auto_94372 ) ) ( not ( = ?auto_94371 ?auto_94375 ) ) ( not ( = ?auto_94374 ?auto_94372 ) ) ( not ( = ?auto_94374 ?auto_94375 ) ) ( not ( = ?auto_94372 ?auto_94375 ) ) ( ON ?auto_94372 ?auto_94374 ) ( not ( = ?auto_94373 ?auto_94375 ) ) ( not ( = ?auto_94368 ?auto_94373 ) ) ( not ( = ?auto_94369 ?auto_94373 ) ) ( not ( = ?auto_94370 ?auto_94373 ) ) ( not ( = ?auto_94371 ?auto_94373 ) ) ( not ( = ?auto_94374 ?auto_94373 ) ) ( not ( = ?auto_94372 ?auto_94373 ) ) ( ON ?auto_94375 ?auto_94372 ) ( CLEAR ?auto_94375 ) ( HOLDING ?auto_94373 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94373 )
      ( MAKE-4PILE ?auto_94368 ?auto_94369 ?auto_94370 ?auto_94371 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94376 - BLOCK
      ?auto_94377 - BLOCK
      ?auto_94378 - BLOCK
      ?auto_94379 - BLOCK
    )
    :vars
    (
      ?auto_94383 - BLOCK
      ?auto_94381 - BLOCK
      ?auto_94380 - BLOCK
      ?auto_94382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94383 ?auto_94379 ) ( ON-TABLE ?auto_94376 ) ( ON ?auto_94377 ?auto_94376 ) ( ON ?auto_94378 ?auto_94377 ) ( ON ?auto_94379 ?auto_94378 ) ( not ( = ?auto_94376 ?auto_94377 ) ) ( not ( = ?auto_94376 ?auto_94378 ) ) ( not ( = ?auto_94376 ?auto_94379 ) ) ( not ( = ?auto_94376 ?auto_94383 ) ) ( not ( = ?auto_94377 ?auto_94378 ) ) ( not ( = ?auto_94377 ?auto_94379 ) ) ( not ( = ?auto_94377 ?auto_94383 ) ) ( not ( = ?auto_94378 ?auto_94379 ) ) ( not ( = ?auto_94378 ?auto_94383 ) ) ( not ( = ?auto_94379 ?auto_94383 ) ) ( not ( = ?auto_94376 ?auto_94381 ) ) ( not ( = ?auto_94376 ?auto_94380 ) ) ( not ( = ?auto_94377 ?auto_94381 ) ) ( not ( = ?auto_94377 ?auto_94380 ) ) ( not ( = ?auto_94378 ?auto_94381 ) ) ( not ( = ?auto_94378 ?auto_94380 ) ) ( not ( = ?auto_94379 ?auto_94381 ) ) ( not ( = ?auto_94379 ?auto_94380 ) ) ( not ( = ?auto_94383 ?auto_94381 ) ) ( not ( = ?auto_94383 ?auto_94380 ) ) ( not ( = ?auto_94381 ?auto_94380 ) ) ( ON ?auto_94381 ?auto_94383 ) ( not ( = ?auto_94382 ?auto_94380 ) ) ( not ( = ?auto_94376 ?auto_94382 ) ) ( not ( = ?auto_94377 ?auto_94382 ) ) ( not ( = ?auto_94378 ?auto_94382 ) ) ( not ( = ?auto_94379 ?auto_94382 ) ) ( not ( = ?auto_94383 ?auto_94382 ) ) ( not ( = ?auto_94381 ?auto_94382 ) ) ( ON ?auto_94380 ?auto_94381 ) ( ON ?auto_94382 ?auto_94380 ) ( CLEAR ?auto_94382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94376 ?auto_94377 ?auto_94378 ?auto_94379 ?auto_94383 ?auto_94381 ?auto_94380 )
      ( MAKE-4PILE ?auto_94376 ?auto_94377 ?auto_94378 ?auto_94379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94388 - BLOCK
      ?auto_94389 - BLOCK
      ?auto_94390 - BLOCK
      ?auto_94391 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_94391 ) ( CLEAR ?auto_94390 ) ( ON-TABLE ?auto_94388 ) ( ON ?auto_94389 ?auto_94388 ) ( ON ?auto_94390 ?auto_94389 ) ( not ( = ?auto_94388 ?auto_94389 ) ) ( not ( = ?auto_94388 ?auto_94390 ) ) ( not ( = ?auto_94388 ?auto_94391 ) ) ( not ( = ?auto_94389 ?auto_94390 ) ) ( not ( = ?auto_94389 ?auto_94391 ) ) ( not ( = ?auto_94390 ?auto_94391 ) ) )
    :subtasks
    ( ( !STACK ?auto_94391 ?auto_94390 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94392 - BLOCK
      ?auto_94393 - BLOCK
      ?auto_94394 - BLOCK
      ?auto_94395 - BLOCK
    )
    :vars
    (
      ?auto_94396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94394 ) ( ON-TABLE ?auto_94392 ) ( ON ?auto_94393 ?auto_94392 ) ( ON ?auto_94394 ?auto_94393 ) ( not ( = ?auto_94392 ?auto_94393 ) ) ( not ( = ?auto_94392 ?auto_94394 ) ) ( not ( = ?auto_94392 ?auto_94395 ) ) ( not ( = ?auto_94393 ?auto_94394 ) ) ( not ( = ?auto_94393 ?auto_94395 ) ) ( not ( = ?auto_94394 ?auto_94395 ) ) ( ON ?auto_94395 ?auto_94396 ) ( CLEAR ?auto_94395 ) ( HAND-EMPTY ) ( not ( = ?auto_94392 ?auto_94396 ) ) ( not ( = ?auto_94393 ?auto_94396 ) ) ( not ( = ?auto_94394 ?auto_94396 ) ) ( not ( = ?auto_94395 ?auto_94396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94395 ?auto_94396 )
      ( MAKE-4PILE ?auto_94392 ?auto_94393 ?auto_94394 ?auto_94395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94397 - BLOCK
      ?auto_94398 - BLOCK
      ?auto_94399 - BLOCK
      ?auto_94400 - BLOCK
    )
    :vars
    (
      ?auto_94401 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94397 ) ( ON ?auto_94398 ?auto_94397 ) ( not ( = ?auto_94397 ?auto_94398 ) ) ( not ( = ?auto_94397 ?auto_94399 ) ) ( not ( = ?auto_94397 ?auto_94400 ) ) ( not ( = ?auto_94398 ?auto_94399 ) ) ( not ( = ?auto_94398 ?auto_94400 ) ) ( not ( = ?auto_94399 ?auto_94400 ) ) ( ON ?auto_94400 ?auto_94401 ) ( CLEAR ?auto_94400 ) ( not ( = ?auto_94397 ?auto_94401 ) ) ( not ( = ?auto_94398 ?auto_94401 ) ) ( not ( = ?auto_94399 ?auto_94401 ) ) ( not ( = ?auto_94400 ?auto_94401 ) ) ( HOLDING ?auto_94399 ) ( CLEAR ?auto_94398 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94397 ?auto_94398 ?auto_94399 )
      ( MAKE-4PILE ?auto_94397 ?auto_94398 ?auto_94399 ?auto_94400 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94402 - BLOCK
      ?auto_94403 - BLOCK
      ?auto_94404 - BLOCK
      ?auto_94405 - BLOCK
    )
    :vars
    (
      ?auto_94406 - BLOCK
      ?auto_94409 - BLOCK
      ?auto_94408 - BLOCK
      ?auto_94407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94402 ) ( ON ?auto_94403 ?auto_94402 ) ( not ( = ?auto_94402 ?auto_94403 ) ) ( not ( = ?auto_94402 ?auto_94404 ) ) ( not ( = ?auto_94402 ?auto_94405 ) ) ( not ( = ?auto_94403 ?auto_94404 ) ) ( not ( = ?auto_94403 ?auto_94405 ) ) ( not ( = ?auto_94404 ?auto_94405 ) ) ( ON ?auto_94405 ?auto_94406 ) ( not ( = ?auto_94402 ?auto_94406 ) ) ( not ( = ?auto_94403 ?auto_94406 ) ) ( not ( = ?auto_94404 ?auto_94406 ) ) ( not ( = ?auto_94405 ?auto_94406 ) ) ( CLEAR ?auto_94403 ) ( ON ?auto_94404 ?auto_94405 ) ( CLEAR ?auto_94404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94409 ) ( ON ?auto_94408 ?auto_94409 ) ( ON ?auto_94407 ?auto_94408 ) ( ON ?auto_94406 ?auto_94407 ) ( not ( = ?auto_94409 ?auto_94408 ) ) ( not ( = ?auto_94409 ?auto_94407 ) ) ( not ( = ?auto_94409 ?auto_94406 ) ) ( not ( = ?auto_94409 ?auto_94405 ) ) ( not ( = ?auto_94409 ?auto_94404 ) ) ( not ( = ?auto_94408 ?auto_94407 ) ) ( not ( = ?auto_94408 ?auto_94406 ) ) ( not ( = ?auto_94408 ?auto_94405 ) ) ( not ( = ?auto_94408 ?auto_94404 ) ) ( not ( = ?auto_94407 ?auto_94406 ) ) ( not ( = ?auto_94407 ?auto_94405 ) ) ( not ( = ?auto_94407 ?auto_94404 ) ) ( not ( = ?auto_94402 ?auto_94409 ) ) ( not ( = ?auto_94402 ?auto_94408 ) ) ( not ( = ?auto_94402 ?auto_94407 ) ) ( not ( = ?auto_94403 ?auto_94409 ) ) ( not ( = ?auto_94403 ?auto_94408 ) ) ( not ( = ?auto_94403 ?auto_94407 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94409 ?auto_94408 ?auto_94407 ?auto_94406 ?auto_94405 )
      ( MAKE-4PILE ?auto_94402 ?auto_94403 ?auto_94404 ?auto_94405 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94410 - BLOCK
      ?auto_94411 - BLOCK
      ?auto_94412 - BLOCK
      ?auto_94413 - BLOCK
    )
    :vars
    (
      ?auto_94417 - BLOCK
      ?auto_94414 - BLOCK
      ?auto_94415 - BLOCK
      ?auto_94416 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94410 ) ( not ( = ?auto_94410 ?auto_94411 ) ) ( not ( = ?auto_94410 ?auto_94412 ) ) ( not ( = ?auto_94410 ?auto_94413 ) ) ( not ( = ?auto_94411 ?auto_94412 ) ) ( not ( = ?auto_94411 ?auto_94413 ) ) ( not ( = ?auto_94412 ?auto_94413 ) ) ( ON ?auto_94413 ?auto_94417 ) ( not ( = ?auto_94410 ?auto_94417 ) ) ( not ( = ?auto_94411 ?auto_94417 ) ) ( not ( = ?auto_94412 ?auto_94417 ) ) ( not ( = ?auto_94413 ?auto_94417 ) ) ( ON ?auto_94412 ?auto_94413 ) ( CLEAR ?auto_94412 ) ( ON-TABLE ?auto_94414 ) ( ON ?auto_94415 ?auto_94414 ) ( ON ?auto_94416 ?auto_94415 ) ( ON ?auto_94417 ?auto_94416 ) ( not ( = ?auto_94414 ?auto_94415 ) ) ( not ( = ?auto_94414 ?auto_94416 ) ) ( not ( = ?auto_94414 ?auto_94417 ) ) ( not ( = ?auto_94414 ?auto_94413 ) ) ( not ( = ?auto_94414 ?auto_94412 ) ) ( not ( = ?auto_94415 ?auto_94416 ) ) ( not ( = ?auto_94415 ?auto_94417 ) ) ( not ( = ?auto_94415 ?auto_94413 ) ) ( not ( = ?auto_94415 ?auto_94412 ) ) ( not ( = ?auto_94416 ?auto_94417 ) ) ( not ( = ?auto_94416 ?auto_94413 ) ) ( not ( = ?auto_94416 ?auto_94412 ) ) ( not ( = ?auto_94410 ?auto_94414 ) ) ( not ( = ?auto_94410 ?auto_94415 ) ) ( not ( = ?auto_94410 ?auto_94416 ) ) ( not ( = ?auto_94411 ?auto_94414 ) ) ( not ( = ?auto_94411 ?auto_94415 ) ) ( not ( = ?auto_94411 ?auto_94416 ) ) ( HOLDING ?auto_94411 ) ( CLEAR ?auto_94410 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94410 ?auto_94411 )
      ( MAKE-4PILE ?auto_94410 ?auto_94411 ?auto_94412 ?auto_94413 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94418 - BLOCK
      ?auto_94419 - BLOCK
      ?auto_94420 - BLOCK
      ?auto_94421 - BLOCK
    )
    :vars
    (
      ?auto_94423 - BLOCK
      ?auto_94422 - BLOCK
      ?auto_94424 - BLOCK
      ?auto_94425 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94418 ) ( not ( = ?auto_94418 ?auto_94419 ) ) ( not ( = ?auto_94418 ?auto_94420 ) ) ( not ( = ?auto_94418 ?auto_94421 ) ) ( not ( = ?auto_94419 ?auto_94420 ) ) ( not ( = ?auto_94419 ?auto_94421 ) ) ( not ( = ?auto_94420 ?auto_94421 ) ) ( ON ?auto_94421 ?auto_94423 ) ( not ( = ?auto_94418 ?auto_94423 ) ) ( not ( = ?auto_94419 ?auto_94423 ) ) ( not ( = ?auto_94420 ?auto_94423 ) ) ( not ( = ?auto_94421 ?auto_94423 ) ) ( ON ?auto_94420 ?auto_94421 ) ( ON-TABLE ?auto_94422 ) ( ON ?auto_94424 ?auto_94422 ) ( ON ?auto_94425 ?auto_94424 ) ( ON ?auto_94423 ?auto_94425 ) ( not ( = ?auto_94422 ?auto_94424 ) ) ( not ( = ?auto_94422 ?auto_94425 ) ) ( not ( = ?auto_94422 ?auto_94423 ) ) ( not ( = ?auto_94422 ?auto_94421 ) ) ( not ( = ?auto_94422 ?auto_94420 ) ) ( not ( = ?auto_94424 ?auto_94425 ) ) ( not ( = ?auto_94424 ?auto_94423 ) ) ( not ( = ?auto_94424 ?auto_94421 ) ) ( not ( = ?auto_94424 ?auto_94420 ) ) ( not ( = ?auto_94425 ?auto_94423 ) ) ( not ( = ?auto_94425 ?auto_94421 ) ) ( not ( = ?auto_94425 ?auto_94420 ) ) ( not ( = ?auto_94418 ?auto_94422 ) ) ( not ( = ?auto_94418 ?auto_94424 ) ) ( not ( = ?auto_94418 ?auto_94425 ) ) ( not ( = ?auto_94419 ?auto_94422 ) ) ( not ( = ?auto_94419 ?auto_94424 ) ) ( not ( = ?auto_94419 ?auto_94425 ) ) ( CLEAR ?auto_94418 ) ( ON ?auto_94419 ?auto_94420 ) ( CLEAR ?auto_94419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94422 ?auto_94424 ?auto_94425 ?auto_94423 ?auto_94421 ?auto_94420 )
      ( MAKE-4PILE ?auto_94418 ?auto_94419 ?auto_94420 ?auto_94421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94426 - BLOCK
      ?auto_94427 - BLOCK
      ?auto_94428 - BLOCK
      ?auto_94429 - BLOCK
    )
    :vars
    (
      ?auto_94433 - BLOCK
      ?auto_94432 - BLOCK
      ?auto_94431 - BLOCK
      ?auto_94430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94426 ?auto_94427 ) ) ( not ( = ?auto_94426 ?auto_94428 ) ) ( not ( = ?auto_94426 ?auto_94429 ) ) ( not ( = ?auto_94427 ?auto_94428 ) ) ( not ( = ?auto_94427 ?auto_94429 ) ) ( not ( = ?auto_94428 ?auto_94429 ) ) ( ON ?auto_94429 ?auto_94433 ) ( not ( = ?auto_94426 ?auto_94433 ) ) ( not ( = ?auto_94427 ?auto_94433 ) ) ( not ( = ?auto_94428 ?auto_94433 ) ) ( not ( = ?auto_94429 ?auto_94433 ) ) ( ON ?auto_94428 ?auto_94429 ) ( ON-TABLE ?auto_94432 ) ( ON ?auto_94431 ?auto_94432 ) ( ON ?auto_94430 ?auto_94431 ) ( ON ?auto_94433 ?auto_94430 ) ( not ( = ?auto_94432 ?auto_94431 ) ) ( not ( = ?auto_94432 ?auto_94430 ) ) ( not ( = ?auto_94432 ?auto_94433 ) ) ( not ( = ?auto_94432 ?auto_94429 ) ) ( not ( = ?auto_94432 ?auto_94428 ) ) ( not ( = ?auto_94431 ?auto_94430 ) ) ( not ( = ?auto_94431 ?auto_94433 ) ) ( not ( = ?auto_94431 ?auto_94429 ) ) ( not ( = ?auto_94431 ?auto_94428 ) ) ( not ( = ?auto_94430 ?auto_94433 ) ) ( not ( = ?auto_94430 ?auto_94429 ) ) ( not ( = ?auto_94430 ?auto_94428 ) ) ( not ( = ?auto_94426 ?auto_94432 ) ) ( not ( = ?auto_94426 ?auto_94431 ) ) ( not ( = ?auto_94426 ?auto_94430 ) ) ( not ( = ?auto_94427 ?auto_94432 ) ) ( not ( = ?auto_94427 ?auto_94431 ) ) ( not ( = ?auto_94427 ?auto_94430 ) ) ( ON ?auto_94427 ?auto_94428 ) ( CLEAR ?auto_94427 ) ( HOLDING ?auto_94426 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94426 )
      ( MAKE-4PILE ?auto_94426 ?auto_94427 ?auto_94428 ?auto_94429 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_94434 - BLOCK
      ?auto_94435 - BLOCK
      ?auto_94436 - BLOCK
      ?auto_94437 - BLOCK
    )
    :vars
    (
      ?auto_94441 - BLOCK
      ?auto_94440 - BLOCK
      ?auto_94439 - BLOCK
      ?auto_94438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94434 ?auto_94435 ) ) ( not ( = ?auto_94434 ?auto_94436 ) ) ( not ( = ?auto_94434 ?auto_94437 ) ) ( not ( = ?auto_94435 ?auto_94436 ) ) ( not ( = ?auto_94435 ?auto_94437 ) ) ( not ( = ?auto_94436 ?auto_94437 ) ) ( ON ?auto_94437 ?auto_94441 ) ( not ( = ?auto_94434 ?auto_94441 ) ) ( not ( = ?auto_94435 ?auto_94441 ) ) ( not ( = ?auto_94436 ?auto_94441 ) ) ( not ( = ?auto_94437 ?auto_94441 ) ) ( ON ?auto_94436 ?auto_94437 ) ( ON-TABLE ?auto_94440 ) ( ON ?auto_94439 ?auto_94440 ) ( ON ?auto_94438 ?auto_94439 ) ( ON ?auto_94441 ?auto_94438 ) ( not ( = ?auto_94440 ?auto_94439 ) ) ( not ( = ?auto_94440 ?auto_94438 ) ) ( not ( = ?auto_94440 ?auto_94441 ) ) ( not ( = ?auto_94440 ?auto_94437 ) ) ( not ( = ?auto_94440 ?auto_94436 ) ) ( not ( = ?auto_94439 ?auto_94438 ) ) ( not ( = ?auto_94439 ?auto_94441 ) ) ( not ( = ?auto_94439 ?auto_94437 ) ) ( not ( = ?auto_94439 ?auto_94436 ) ) ( not ( = ?auto_94438 ?auto_94441 ) ) ( not ( = ?auto_94438 ?auto_94437 ) ) ( not ( = ?auto_94438 ?auto_94436 ) ) ( not ( = ?auto_94434 ?auto_94440 ) ) ( not ( = ?auto_94434 ?auto_94439 ) ) ( not ( = ?auto_94434 ?auto_94438 ) ) ( not ( = ?auto_94435 ?auto_94440 ) ) ( not ( = ?auto_94435 ?auto_94439 ) ) ( not ( = ?auto_94435 ?auto_94438 ) ) ( ON ?auto_94435 ?auto_94436 ) ( ON ?auto_94434 ?auto_94435 ) ( CLEAR ?auto_94434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94440 ?auto_94439 ?auto_94438 ?auto_94441 ?auto_94437 ?auto_94436 ?auto_94435 )
      ( MAKE-4PILE ?auto_94434 ?auto_94435 ?auto_94436 ?auto_94437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94445 - BLOCK
      ?auto_94446 - BLOCK
      ?auto_94447 - BLOCK
    )
    :vars
    (
      ?auto_94448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94448 ?auto_94447 ) ( CLEAR ?auto_94448 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94445 ) ( ON ?auto_94446 ?auto_94445 ) ( ON ?auto_94447 ?auto_94446 ) ( not ( = ?auto_94445 ?auto_94446 ) ) ( not ( = ?auto_94445 ?auto_94447 ) ) ( not ( = ?auto_94445 ?auto_94448 ) ) ( not ( = ?auto_94446 ?auto_94447 ) ) ( not ( = ?auto_94446 ?auto_94448 ) ) ( not ( = ?auto_94447 ?auto_94448 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94448 ?auto_94447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94449 - BLOCK
      ?auto_94450 - BLOCK
      ?auto_94451 - BLOCK
    )
    :vars
    (
      ?auto_94452 - BLOCK
      ?auto_94453 - BLOCK
      ?auto_94454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94452 ?auto_94451 ) ( CLEAR ?auto_94452 ) ( ON-TABLE ?auto_94449 ) ( ON ?auto_94450 ?auto_94449 ) ( ON ?auto_94451 ?auto_94450 ) ( not ( = ?auto_94449 ?auto_94450 ) ) ( not ( = ?auto_94449 ?auto_94451 ) ) ( not ( = ?auto_94449 ?auto_94452 ) ) ( not ( = ?auto_94450 ?auto_94451 ) ) ( not ( = ?auto_94450 ?auto_94452 ) ) ( not ( = ?auto_94451 ?auto_94452 ) ) ( HOLDING ?auto_94453 ) ( CLEAR ?auto_94454 ) ( not ( = ?auto_94449 ?auto_94453 ) ) ( not ( = ?auto_94449 ?auto_94454 ) ) ( not ( = ?auto_94450 ?auto_94453 ) ) ( not ( = ?auto_94450 ?auto_94454 ) ) ( not ( = ?auto_94451 ?auto_94453 ) ) ( not ( = ?auto_94451 ?auto_94454 ) ) ( not ( = ?auto_94452 ?auto_94453 ) ) ( not ( = ?auto_94452 ?auto_94454 ) ) ( not ( = ?auto_94453 ?auto_94454 ) ) )
    :subtasks
    ( ( !STACK ?auto_94453 ?auto_94454 )
      ( MAKE-3PILE ?auto_94449 ?auto_94450 ?auto_94451 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94455 - BLOCK
      ?auto_94456 - BLOCK
      ?auto_94457 - BLOCK
    )
    :vars
    (
      ?auto_94458 - BLOCK
      ?auto_94460 - BLOCK
      ?auto_94459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94458 ?auto_94457 ) ( ON-TABLE ?auto_94455 ) ( ON ?auto_94456 ?auto_94455 ) ( ON ?auto_94457 ?auto_94456 ) ( not ( = ?auto_94455 ?auto_94456 ) ) ( not ( = ?auto_94455 ?auto_94457 ) ) ( not ( = ?auto_94455 ?auto_94458 ) ) ( not ( = ?auto_94456 ?auto_94457 ) ) ( not ( = ?auto_94456 ?auto_94458 ) ) ( not ( = ?auto_94457 ?auto_94458 ) ) ( CLEAR ?auto_94460 ) ( not ( = ?auto_94455 ?auto_94459 ) ) ( not ( = ?auto_94455 ?auto_94460 ) ) ( not ( = ?auto_94456 ?auto_94459 ) ) ( not ( = ?auto_94456 ?auto_94460 ) ) ( not ( = ?auto_94457 ?auto_94459 ) ) ( not ( = ?auto_94457 ?auto_94460 ) ) ( not ( = ?auto_94458 ?auto_94459 ) ) ( not ( = ?auto_94458 ?auto_94460 ) ) ( not ( = ?auto_94459 ?auto_94460 ) ) ( ON ?auto_94459 ?auto_94458 ) ( CLEAR ?auto_94459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94455 ?auto_94456 ?auto_94457 ?auto_94458 )
      ( MAKE-3PILE ?auto_94455 ?auto_94456 ?auto_94457 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94461 - BLOCK
      ?auto_94462 - BLOCK
      ?auto_94463 - BLOCK
    )
    :vars
    (
      ?auto_94465 - BLOCK
      ?auto_94464 - BLOCK
      ?auto_94466 - BLOCK
      ?auto_94468 - BLOCK
      ?auto_94467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94465 ?auto_94463 ) ( ON-TABLE ?auto_94461 ) ( ON ?auto_94462 ?auto_94461 ) ( ON ?auto_94463 ?auto_94462 ) ( not ( = ?auto_94461 ?auto_94462 ) ) ( not ( = ?auto_94461 ?auto_94463 ) ) ( not ( = ?auto_94461 ?auto_94465 ) ) ( not ( = ?auto_94462 ?auto_94463 ) ) ( not ( = ?auto_94462 ?auto_94465 ) ) ( not ( = ?auto_94463 ?auto_94465 ) ) ( not ( = ?auto_94461 ?auto_94464 ) ) ( not ( = ?auto_94461 ?auto_94466 ) ) ( not ( = ?auto_94462 ?auto_94464 ) ) ( not ( = ?auto_94462 ?auto_94466 ) ) ( not ( = ?auto_94463 ?auto_94464 ) ) ( not ( = ?auto_94463 ?auto_94466 ) ) ( not ( = ?auto_94465 ?auto_94464 ) ) ( not ( = ?auto_94465 ?auto_94466 ) ) ( not ( = ?auto_94464 ?auto_94466 ) ) ( ON ?auto_94464 ?auto_94465 ) ( CLEAR ?auto_94464 ) ( HOLDING ?auto_94466 ) ( CLEAR ?auto_94468 ) ( ON-TABLE ?auto_94467 ) ( ON ?auto_94468 ?auto_94467 ) ( not ( = ?auto_94467 ?auto_94468 ) ) ( not ( = ?auto_94467 ?auto_94466 ) ) ( not ( = ?auto_94468 ?auto_94466 ) ) ( not ( = ?auto_94461 ?auto_94468 ) ) ( not ( = ?auto_94461 ?auto_94467 ) ) ( not ( = ?auto_94462 ?auto_94468 ) ) ( not ( = ?auto_94462 ?auto_94467 ) ) ( not ( = ?auto_94463 ?auto_94468 ) ) ( not ( = ?auto_94463 ?auto_94467 ) ) ( not ( = ?auto_94465 ?auto_94468 ) ) ( not ( = ?auto_94465 ?auto_94467 ) ) ( not ( = ?auto_94464 ?auto_94468 ) ) ( not ( = ?auto_94464 ?auto_94467 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94467 ?auto_94468 ?auto_94466 )
      ( MAKE-3PILE ?auto_94461 ?auto_94462 ?auto_94463 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94469 - BLOCK
      ?auto_94470 - BLOCK
      ?auto_94471 - BLOCK
    )
    :vars
    (
      ?auto_94476 - BLOCK
      ?auto_94475 - BLOCK
      ?auto_94474 - BLOCK
      ?auto_94472 - BLOCK
      ?auto_94473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94476 ?auto_94471 ) ( ON-TABLE ?auto_94469 ) ( ON ?auto_94470 ?auto_94469 ) ( ON ?auto_94471 ?auto_94470 ) ( not ( = ?auto_94469 ?auto_94470 ) ) ( not ( = ?auto_94469 ?auto_94471 ) ) ( not ( = ?auto_94469 ?auto_94476 ) ) ( not ( = ?auto_94470 ?auto_94471 ) ) ( not ( = ?auto_94470 ?auto_94476 ) ) ( not ( = ?auto_94471 ?auto_94476 ) ) ( not ( = ?auto_94469 ?auto_94475 ) ) ( not ( = ?auto_94469 ?auto_94474 ) ) ( not ( = ?auto_94470 ?auto_94475 ) ) ( not ( = ?auto_94470 ?auto_94474 ) ) ( not ( = ?auto_94471 ?auto_94475 ) ) ( not ( = ?auto_94471 ?auto_94474 ) ) ( not ( = ?auto_94476 ?auto_94475 ) ) ( not ( = ?auto_94476 ?auto_94474 ) ) ( not ( = ?auto_94475 ?auto_94474 ) ) ( ON ?auto_94475 ?auto_94476 ) ( CLEAR ?auto_94472 ) ( ON-TABLE ?auto_94473 ) ( ON ?auto_94472 ?auto_94473 ) ( not ( = ?auto_94473 ?auto_94472 ) ) ( not ( = ?auto_94473 ?auto_94474 ) ) ( not ( = ?auto_94472 ?auto_94474 ) ) ( not ( = ?auto_94469 ?auto_94472 ) ) ( not ( = ?auto_94469 ?auto_94473 ) ) ( not ( = ?auto_94470 ?auto_94472 ) ) ( not ( = ?auto_94470 ?auto_94473 ) ) ( not ( = ?auto_94471 ?auto_94472 ) ) ( not ( = ?auto_94471 ?auto_94473 ) ) ( not ( = ?auto_94476 ?auto_94472 ) ) ( not ( = ?auto_94476 ?auto_94473 ) ) ( not ( = ?auto_94475 ?auto_94472 ) ) ( not ( = ?auto_94475 ?auto_94473 ) ) ( ON ?auto_94474 ?auto_94475 ) ( CLEAR ?auto_94474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94469 ?auto_94470 ?auto_94471 ?auto_94476 ?auto_94475 )
      ( MAKE-3PILE ?auto_94469 ?auto_94470 ?auto_94471 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94477 - BLOCK
      ?auto_94478 - BLOCK
      ?auto_94479 - BLOCK
    )
    :vars
    (
      ?auto_94483 - BLOCK
      ?auto_94481 - BLOCK
      ?auto_94482 - BLOCK
      ?auto_94484 - BLOCK
      ?auto_94480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94483 ?auto_94479 ) ( ON-TABLE ?auto_94477 ) ( ON ?auto_94478 ?auto_94477 ) ( ON ?auto_94479 ?auto_94478 ) ( not ( = ?auto_94477 ?auto_94478 ) ) ( not ( = ?auto_94477 ?auto_94479 ) ) ( not ( = ?auto_94477 ?auto_94483 ) ) ( not ( = ?auto_94478 ?auto_94479 ) ) ( not ( = ?auto_94478 ?auto_94483 ) ) ( not ( = ?auto_94479 ?auto_94483 ) ) ( not ( = ?auto_94477 ?auto_94481 ) ) ( not ( = ?auto_94477 ?auto_94482 ) ) ( not ( = ?auto_94478 ?auto_94481 ) ) ( not ( = ?auto_94478 ?auto_94482 ) ) ( not ( = ?auto_94479 ?auto_94481 ) ) ( not ( = ?auto_94479 ?auto_94482 ) ) ( not ( = ?auto_94483 ?auto_94481 ) ) ( not ( = ?auto_94483 ?auto_94482 ) ) ( not ( = ?auto_94481 ?auto_94482 ) ) ( ON ?auto_94481 ?auto_94483 ) ( ON-TABLE ?auto_94484 ) ( not ( = ?auto_94484 ?auto_94480 ) ) ( not ( = ?auto_94484 ?auto_94482 ) ) ( not ( = ?auto_94480 ?auto_94482 ) ) ( not ( = ?auto_94477 ?auto_94480 ) ) ( not ( = ?auto_94477 ?auto_94484 ) ) ( not ( = ?auto_94478 ?auto_94480 ) ) ( not ( = ?auto_94478 ?auto_94484 ) ) ( not ( = ?auto_94479 ?auto_94480 ) ) ( not ( = ?auto_94479 ?auto_94484 ) ) ( not ( = ?auto_94483 ?auto_94480 ) ) ( not ( = ?auto_94483 ?auto_94484 ) ) ( not ( = ?auto_94481 ?auto_94480 ) ) ( not ( = ?auto_94481 ?auto_94484 ) ) ( ON ?auto_94482 ?auto_94481 ) ( CLEAR ?auto_94482 ) ( HOLDING ?auto_94480 ) ( CLEAR ?auto_94484 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94484 ?auto_94480 )
      ( MAKE-3PILE ?auto_94477 ?auto_94478 ?auto_94479 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95662 - BLOCK
      ?auto_95663 - BLOCK
      ?auto_95664 - BLOCK
    )
    :vars
    (
      ?auto_95668 - BLOCK
      ?auto_95666 - BLOCK
      ?auto_95665 - BLOCK
      ?auto_95667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95668 ?auto_95664 ) ( ON-TABLE ?auto_95662 ) ( ON ?auto_95663 ?auto_95662 ) ( ON ?auto_95664 ?auto_95663 ) ( not ( = ?auto_95662 ?auto_95663 ) ) ( not ( = ?auto_95662 ?auto_95664 ) ) ( not ( = ?auto_95662 ?auto_95668 ) ) ( not ( = ?auto_95663 ?auto_95664 ) ) ( not ( = ?auto_95663 ?auto_95668 ) ) ( not ( = ?auto_95664 ?auto_95668 ) ) ( not ( = ?auto_95662 ?auto_95666 ) ) ( not ( = ?auto_95662 ?auto_95665 ) ) ( not ( = ?auto_95663 ?auto_95666 ) ) ( not ( = ?auto_95663 ?auto_95665 ) ) ( not ( = ?auto_95664 ?auto_95666 ) ) ( not ( = ?auto_95664 ?auto_95665 ) ) ( not ( = ?auto_95668 ?auto_95666 ) ) ( not ( = ?auto_95668 ?auto_95665 ) ) ( not ( = ?auto_95666 ?auto_95665 ) ) ( ON ?auto_95666 ?auto_95668 ) ( not ( = ?auto_95667 ?auto_95665 ) ) ( not ( = ?auto_95662 ?auto_95667 ) ) ( not ( = ?auto_95663 ?auto_95667 ) ) ( not ( = ?auto_95664 ?auto_95667 ) ) ( not ( = ?auto_95668 ?auto_95667 ) ) ( not ( = ?auto_95666 ?auto_95667 ) ) ( ON ?auto_95665 ?auto_95666 ) ( ON ?auto_95667 ?auto_95665 ) ( CLEAR ?auto_95667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95662 ?auto_95663 ?auto_95664 ?auto_95668 ?auto_95666 ?auto_95665 )
      ( MAKE-3PILE ?auto_95662 ?auto_95663 ?auto_95664 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94493 - BLOCK
      ?auto_94494 - BLOCK
      ?auto_94495 - BLOCK
    )
    :vars
    (
      ?auto_94498 - BLOCK
      ?auto_94496 - BLOCK
      ?auto_94499 - BLOCK
      ?auto_94500 - BLOCK
      ?auto_94497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94498 ?auto_94495 ) ( ON-TABLE ?auto_94493 ) ( ON ?auto_94494 ?auto_94493 ) ( ON ?auto_94495 ?auto_94494 ) ( not ( = ?auto_94493 ?auto_94494 ) ) ( not ( = ?auto_94493 ?auto_94495 ) ) ( not ( = ?auto_94493 ?auto_94498 ) ) ( not ( = ?auto_94494 ?auto_94495 ) ) ( not ( = ?auto_94494 ?auto_94498 ) ) ( not ( = ?auto_94495 ?auto_94498 ) ) ( not ( = ?auto_94493 ?auto_94496 ) ) ( not ( = ?auto_94493 ?auto_94499 ) ) ( not ( = ?auto_94494 ?auto_94496 ) ) ( not ( = ?auto_94494 ?auto_94499 ) ) ( not ( = ?auto_94495 ?auto_94496 ) ) ( not ( = ?auto_94495 ?auto_94499 ) ) ( not ( = ?auto_94498 ?auto_94496 ) ) ( not ( = ?auto_94498 ?auto_94499 ) ) ( not ( = ?auto_94496 ?auto_94499 ) ) ( ON ?auto_94496 ?auto_94498 ) ( not ( = ?auto_94500 ?auto_94497 ) ) ( not ( = ?auto_94500 ?auto_94499 ) ) ( not ( = ?auto_94497 ?auto_94499 ) ) ( not ( = ?auto_94493 ?auto_94497 ) ) ( not ( = ?auto_94493 ?auto_94500 ) ) ( not ( = ?auto_94494 ?auto_94497 ) ) ( not ( = ?auto_94494 ?auto_94500 ) ) ( not ( = ?auto_94495 ?auto_94497 ) ) ( not ( = ?auto_94495 ?auto_94500 ) ) ( not ( = ?auto_94498 ?auto_94497 ) ) ( not ( = ?auto_94498 ?auto_94500 ) ) ( not ( = ?auto_94496 ?auto_94497 ) ) ( not ( = ?auto_94496 ?auto_94500 ) ) ( ON ?auto_94499 ?auto_94496 ) ( ON ?auto_94497 ?auto_94499 ) ( CLEAR ?auto_94497 ) ( HOLDING ?auto_94500 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94500 )
      ( MAKE-3PILE ?auto_94493 ?auto_94494 ?auto_94495 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_94501 - BLOCK
      ?auto_94502 - BLOCK
      ?auto_94503 - BLOCK
    )
    :vars
    (
      ?auto_94505 - BLOCK
      ?auto_94507 - BLOCK
      ?auto_94506 - BLOCK
      ?auto_94504 - BLOCK
      ?auto_94508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94505 ?auto_94503 ) ( ON-TABLE ?auto_94501 ) ( ON ?auto_94502 ?auto_94501 ) ( ON ?auto_94503 ?auto_94502 ) ( not ( = ?auto_94501 ?auto_94502 ) ) ( not ( = ?auto_94501 ?auto_94503 ) ) ( not ( = ?auto_94501 ?auto_94505 ) ) ( not ( = ?auto_94502 ?auto_94503 ) ) ( not ( = ?auto_94502 ?auto_94505 ) ) ( not ( = ?auto_94503 ?auto_94505 ) ) ( not ( = ?auto_94501 ?auto_94507 ) ) ( not ( = ?auto_94501 ?auto_94506 ) ) ( not ( = ?auto_94502 ?auto_94507 ) ) ( not ( = ?auto_94502 ?auto_94506 ) ) ( not ( = ?auto_94503 ?auto_94507 ) ) ( not ( = ?auto_94503 ?auto_94506 ) ) ( not ( = ?auto_94505 ?auto_94507 ) ) ( not ( = ?auto_94505 ?auto_94506 ) ) ( not ( = ?auto_94507 ?auto_94506 ) ) ( ON ?auto_94507 ?auto_94505 ) ( not ( = ?auto_94504 ?auto_94508 ) ) ( not ( = ?auto_94504 ?auto_94506 ) ) ( not ( = ?auto_94508 ?auto_94506 ) ) ( not ( = ?auto_94501 ?auto_94508 ) ) ( not ( = ?auto_94501 ?auto_94504 ) ) ( not ( = ?auto_94502 ?auto_94508 ) ) ( not ( = ?auto_94502 ?auto_94504 ) ) ( not ( = ?auto_94503 ?auto_94508 ) ) ( not ( = ?auto_94503 ?auto_94504 ) ) ( not ( = ?auto_94505 ?auto_94508 ) ) ( not ( = ?auto_94505 ?auto_94504 ) ) ( not ( = ?auto_94507 ?auto_94508 ) ) ( not ( = ?auto_94507 ?auto_94504 ) ) ( ON ?auto_94506 ?auto_94507 ) ( ON ?auto_94508 ?auto_94506 ) ( ON ?auto_94504 ?auto_94508 ) ( CLEAR ?auto_94504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94501 ?auto_94502 ?auto_94503 ?auto_94505 ?auto_94507 ?auto_94506 ?auto_94508 )
      ( MAKE-3PILE ?auto_94501 ?auto_94502 ?auto_94503 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94514 - BLOCK
      ?auto_94515 - BLOCK
      ?auto_94516 - BLOCK
      ?auto_94517 - BLOCK
      ?auto_94518 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_94518 ) ( CLEAR ?auto_94517 ) ( ON-TABLE ?auto_94514 ) ( ON ?auto_94515 ?auto_94514 ) ( ON ?auto_94516 ?auto_94515 ) ( ON ?auto_94517 ?auto_94516 ) ( not ( = ?auto_94514 ?auto_94515 ) ) ( not ( = ?auto_94514 ?auto_94516 ) ) ( not ( = ?auto_94514 ?auto_94517 ) ) ( not ( = ?auto_94514 ?auto_94518 ) ) ( not ( = ?auto_94515 ?auto_94516 ) ) ( not ( = ?auto_94515 ?auto_94517 ) ) ( not ( = ?auto_94515 ?auto_94518 ) ) ( not ( = ?auto_94516 ?auto_94517 ) ) ( not ( = ?auto_94516 ?auto_94518 ) ) ( not ( = ?auto_94517 ?auto_94518 ) ) )
    :subtasks
    ( ( !STACK ?auto_94518 ?auto_94517 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94519 - BLOCK
      ?auto_94520 - BLOCK
      ?auto_94521 - BLOCK
      ?auto_94522 - BLOCK
      ?auto_94523 - BLOCK
    )
    :vars
    (
      ?auto_94524 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94522 ) ( ON-TABLE ?auto_94519 ) ( ON ?auto_94520 ?auto_94519 ) ( ON ?auto_94521 ?auto_94520 ) ( ON ?auto_94522 ?auto_94521 ) ( not ( = ?auto_94519 ?auto_94520 ) ) ( not ( = ?auto_94519 ?auto_94521 ) ) ( not ( = ?auto_94519 ?auto_94522 ) ) ( not ( = ?auto_94519 ?auto_94523 ) ) ( not ( = ?auto_94520 ?auto_94521 ) ) ( not ( = ?auto_94520 ?auto_94522 ) ) ( not ( = ?auto_94520 ?auto_94523 ) ) ( not ( = ?auto_94521 ?auto_94522 ) ) ( not ( = ?auto_94521 ?auto_94523 ) ) ( not ( = ?auto_94522 ?auto_94523 ) ) ( ON ?auto_94523 ?auto_94524 ) ( CLEAR ?auto_94523 ) ( HAND-EMPTY ) ( not ( = ?auto_94519 ?auto_94524 ) ) ( not ( = ?auto_94520 ?auto_94524 ) ) ( not ( = ?auto_94521 ?auto_94524 ) ) ( not ( = ?auto_94522 ?auto_94524 ) ) ( not ( = ?auto_94523 ?auto_94524 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94523 ?auto_94524 )
      ( MAKE-5PILE ?auto_94519 ?auto_94520 ?auto_94521 ?auto_94522 ?auto_94523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94525 - BLOCK
      ?auto_94526 - BLOCK
      ?auto_94527 - BLOCK
      ?auto_94528 - BLOCK
      ?auto_94529 - BLOCK
    )
    :vars
    (
      ?auto_94530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94525 ) ( ON ?auto_94526 ?auto_94525 ) ( ON ?auto_94527 ?auto_94526 ) ( not ( = ?auto_94525 ?auto_94526 ) ) ( not ( = ?auto_94525 ?auto_94527 ) ) ( not ( = ?auto_94525 ?auto_94528 ) ) ( not ( = ?auto_94525 ?auto_94529 ) ) ( not ( = ?auto_94526 ?auto_94527 ) ) ( not ( = ?auto_94526 ?auto_94528 ) ) ( not ( = ?auto_94526 ?auto_94529 ) ) ( not ( = ?auto_94527 ?auto_94528 ) ) ( not ( = ?auto_94527 ?auto_94529 ) ) ( not ( = ?auto_94528 ?auto_94529 ) ) ( ON ?auto_94529 ?auto_94530 ) ( CLEAR ?auto_94529 ) ( not ( = ?auto_94525 ?auto_94530 ) ) ( not ( = ?auto_94526 ?auto_94530 ) ) ( not ( = ?auto_94527 ?auto_94530 ) ) ( not ( = ?auto_94528 ?auto_94530 ) ) ( not ( = ?auto_94529 ?auto_94530 ) ) ( HOLDING ?auto_94528 ) ( CLEAR ?auto_94527 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94525 ?auto_94526 ?auto_94527 ?auto_94528 )
      ( MAKE-5PILE ?auto_94525 ?auto_94526 ?auto_94527 ?auto_94528 ?auto_94529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94531 - BLOCK
      ?auto_94532 - BLOCK
      ?auto_94533 - BLOCK
      ?auto_94534 - BLOCK
      ?auto_94535 - BLOCK
    )
    :vars
    (
      ?auto_94536 - BLOCK
      ?auto_94537 - BLOCK
      ?auto_94538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94531 ) ( ON ?auto_94532 ?auto_94531 ) ( ON ?auto_94533 ?auto_94532 ) ( not ( = ?auto_94531 ?auto_94532 ) ) ( not ( = ?auto_94531 ?auto_94533 ) ) ( not ( = ?auto_94531 ?auto_94534 ) ) ( not ( = ?auto_94531 ?auto_94535 ) ) ( not ( = ?auto_94532 ?auto_94533 ) ) ( not ( = ?auto_94532 ?auto_94534 ) ) ( not ( = ?auto_94532 ?auto_94535 ) ) ( not ( = ?auto_94533 ?auto_94534 ) ) ( not ( = ?auto_94533 ?auto_94535 ) ) ( not ( = ?auto_94534 ?auto_94535 ) ) ( ON ?auto_94535 ?auto_94536 ) ( not ( = ?auto_94531 ?auto_94536 ) ) ( not ( = ?auto_94532 ?auto_94536 ) ) ( not ( = ?auto_94533 ?auto_94536 ) ) ( not ( = ?auto_94534 ?auto_94536 ) ) ( not ( = ?auto_94535 ?auto_94536 ) ) ( CLEAR ?auto_94533 ) ( ON ?auto_94534 ?auto_94535 ) ( CLEAR ?auto_94534 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94537 ) ( ON ?auto_94538 ?auto_94537 ) ( ON ?auto_94536 ?auto_94538 ) ( not ( = ?auto_94537 ?auto_94538 ) ) ( not ( = ?auto_94537 ?auto_94536 ) ) ( not ( = ?auto_94537 ?auto_94535 ) ) ( not ( = ?auto_94537 ?auto_94534 ) ) ( not ( = ?auto_94538 ?auto_94536 ) ) ( not ( = ?auto_94538 ?auto_94535 ) ) ( not ( = ?auto_94538 ?auto_94534 ) ) ( not ( = ?auto_94531 ?auto_94537 ) ) ( not ( = ?auto_94531 ?auto_94538 ) ) ( not ( = ?auto_94532 ?auto_94537 ) ) ( not ( = ?auto_94532 ?auto_94538 ) ) ( not ( = ?auto_94533 ?auto_94537 ) ) ( not ( = ?auto_94533 ?auto_94538 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94537 ?auto_94538 ?auto_94536 ?auto_94535 )
      ( MAKE-5PILE ?auto_94531 ?auto_94532 ?auto_94533 ?auto_94534 ?auto_94535 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94539 - BLOCK
      ?auto_94540 - BLOCK
      ?auto_94541 - BLOCK
      ?auto_94542 - BLOCK
      ?auto_94543 - BLOCK
    )
    :vars
    (
      ?auto_94546 - BLOCK
      ?auto_94544 - BLOCK
      ?auto_94545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94539 ) ( ON ?auto_94540 ?auto_94539 ) ( not ( = ?auto_94539 ?auto_94540 ) ) ( not ( = ?auto_94539 ?auto_94541 ) ) ( not ( = ?auto_94539 ?auto_94542 ) ) ( not ( = ?auto_94539 ?auto_94543 ) ) ( not ( = ?auto_94540 ?auto_94541 ) ) ( not ( = ?auto_94540 ?auto_94542 ) ) ( not ( = ?auto_94540 ?auto_94543 ) ) ( not ( = ?auto_94541 ?auto_94542 ) ) ( not ( = ?auto_94541 ?auto_94543 ) ) ( not ( = ?auto_94542 ?auto_94543 ) ) ( ON ?auto_94543 ?auto_94546 ) ( not ( = ?auto_94539 ?auto_94546 ) ) ( not ( = ?auto_94540 ?auto_94546 ) ) ( not ( = ?auto_94541 ?auto_94546 ) ) ( not ( = ?auto_94542 ?auto_94546 ) ) ( not ( = ?auto_94543 ?auto_94546 ) ) ( ON ?auto_94542 ?auto_94543 ) ( CLEAR ?auto_94542 ) ( ON-TABLE ?auto_94544 ) ( ON ?auto_94545 ?auto_94544 ) ( ON ?auto_94546 ?auto_94545 ) ( not ( = ?auto_94544 ?auto_94545 ) ) ( not ( = ?auto_94544 ?auto_94546 ) ) ( not ( = ?auto_94544 ?auto_94543 ) ) ( not ( = ?auto_94544 ?auto_94542 ) ) ( not ( = ?auto_94545 ?auto_94546 ) ) ( not ( = ?auto_94545 ?auto_94543 ) ) ( not ( = ?auto_94545 ?auto_94542 ) ) ( not ( = ?auto_94539 ?auto_94544 ) ) ( not ( = ?auto_94539 ?auto_94545 ) ) ( not ( = ?auto_94540 ?auto_94544 ) ) ( not ( = ?auto_94540 ?auto_94545 ) ) ( not ( = ?auto_94541 ?auto_94544 ) ) ( not ( = ?auto_94541 ?auto_94545 ) ) ( HOLDING ?auto_94541 ) ( CLEAR ?auto_94540 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94539 ?auto_94540 ?auto_94541 )
      ( MAKE-5PILE ?auto_94539 ?auto_94540 ?auto_94541 ?auto_94542 ?auto_94543 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94547 - BLOCK
      ?auto_94548 - BLOCK
      ?auto_94549 - BLOCK
      ?auto_94550 - BLOCK
      ?auto_94551 - BLOCK
    )
    :vars
    (
      ?auto_94553 - BLOCK
      ?auto_94552 - BLOCK
      ?auto_94554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94547 ) ( ON ?auto_94548 ?auto_94547 ) ( not ( = ?auto_94547 ?auto_94548 ) ) ( not ( = ?auto_94547 ?auto_94549 ) ) ( not ( = ?auto_94547 ?auto_94550 ) ) ( not ( = ?auto_94547 ?auto_94551 ) ) ( not ( = ?auto_94548 ?auto_94549 ) ) ( not ( = ?auto_94548 ?auto_94550 ) ) ( not ( = ?auto_94548 ?auto_94551 ) ) ( not ( = ?auto_94549 ?auto_94550 ) ) ( not ( = ?auto_94549 ?auto_94551 ) ) ( not ( = ?auto_94550 ?auto_94551 ) ) ( ON ?auto_94551 ?auto_94553 ) ( not ( = ?auto_94547 ?auto_94553 ) ) ( not ( = ?auto_94548 ?auto_94553 ) ) ( not ( = ?auto_94549 ?auto_94553 ) ) ( not ( = ?auto_94550 ?auto_94553 ) ) ( not ( = ?auto_94551 ?auto_94553 ) ) ( ON ?auto_94550 ?auto_94551 ) ( ON-TABLE ?auto_94552 ) ( ON ?auto_94554 ?auto_94552 ) ( ON ?auto_94553 ?auto_94554 ) ( not ( = ?auto_94552 ?auto_94554 ) ) ( not ( = ?auto_94552 ?auto_94553 ) ) ( not ( = ?auto_94552 ?auto_94551 ) ) ( not ( = ?auto_94552 ?auto_94550 ) ) ( not ( = ?auto_94554 ?auto_94553 ) ) ( not ( = ?auto_94554 ?auto_94551 ) ) ( not ( = ?auto_94554 ?auto_94550 ) ) ( not ( = ?auto_94547 ?auto_94552 ) ) ( not ( = ?auto_94547 ?auto_94554 ) ) ( not ( = ?auto_94548 ?auto_94552 ) ) ( not ( = ?auto_94548 ?auto_94554 ) ) ( not ( = ?auto_94549 ?auto_94552 ) ) ( not ( = ?auto_94549 ?auto_94554 ) ) ( CLEAR ?auto_94548 ) ( ON ?auto_94549 ?auto_94550 ) ( CLEAR ?auto_94549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94552 ?auto_94554 ?auto_94553 ?auto_94551 ?auto_94550 )
      ( MAKE-5PILE ?auto_94547 ?auto_94548 ?auto_94549 ?auto_94550 ?auto_94551 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94555 - BLOCK
      ?auto_94556 - BLOCK
      ?auto_94557 - BLOCK
      ?auto_94558 - BLOCK
      ?auto_94559 - BLOCK
    )
    :vars
    (
      ?auto_94561 - BLOCK
      ?auto_94562 - BLOCK
      ?auto_94560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94555 ) ( not ( = ?auto_94555 ?auto_94556 ) ) ( not ( = ?auto_94555 ?auto_94557 ) ) ( not ( = ?auto_94555 ?auto_94558 ) ) ( not ( = ?auto_94555 ?auto_94559 ) ) ( not ( = ?auto_94556 ?auto_94557 ) ) ( not ( = ?auto_94556 ?auto_94558 ) ) ( not ( = ?auto_94556 ?auto_94559 ) ) ( not ( = ?auto_94557 ?auto_94558 ) ) ( not ( = ?auto_94557 ?auto_94559 ) ) ( not ( = ?auto_94558 ?auto_94559 ) ) ( ON ?auto_94559 ?auto_94561 ) ( not ( = ?auto_94555 ?auto_94561 ) ) ( not ( = ?auto_94556 ?auto_94561 ) ) ( not ( = ?auto_94557 ?auto_94561 ) ) ( not ( = ?auto_94558 ?auto_94561 ) ) ( not ( = ?auto_94559 ?auto_94561 ) ) ( ON ?auto_94558 ?auto_94559 ) ( ON-TABLE ?auto_94562 ) ( ON ?auto_94560 ?auto_94562 ) ( ON ?auto_94561 ?auto_94560 ) ( not ( = ?auto_94562 ?auto_94560 ) ) ( not ( = ?auto_94562 ?auto_94561 ) ) ( not ( = ?auto_94562 ?auto_94559 ) ) ( not ( = ?auto_94562 ?auto_94558 ) ) ( not ( = ?auto_94560 ?auto_94561 ) ) ( not ( = ?auto_94560 ?auto_94559 ) ) ( not ( = ?auto_94560 ?auto_94558 ) ) ( not ( = ?auto_94555 ?auto_94562 ) ) ( not ( = ?auto_94555 ?auto_94560 ) ) ( not ( = ?auto_94556 ?auto_94562 ) ) ( not ( = ?auto_94556 ?auto_94560 ) ) ( not ( = ?auto_94557 ?auto_94562 ) ) ( not ( = ?auto_94557 ?auto_94560 ) ) ( ON ?auto_94557 ?auto_94558 ) ( CLEAR ?auto_94557 ) ( HOLDING ?auto_94556 ) ( CLEAR ?auto_94555 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94555 ?auto_94556 )
      ( MAKE-5PILE ?auto_94555 ?auto_94556 ?auto_94557 ?auto_94558 ?auto_94559 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94563 - BLOCK
      ?auto_94564 - BLOCK
      ?auto_94565 - BLOCK
      ?auto_94566 - BLOCK
      ?auto_94567 - BLOCK
    )
    :vars
    (
      ?auto_94570 - BLOCK
      ?auto_94569 - BLOCK
      ?auto_94568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94563 ) ( not ( = ?auto_94563 ?auto_94564 ) ) ( not ( = ?auto_94563 ?auto_94565 ) ) ( not ( = ?auto_94563 ?auto_94566 ) ) ( not ( = ?auto_94563 ?auto_94567 ) ) ( not ( = ?auto_94564 ?auto_94565 ) ) ( not ( = ?auto_94564 ?auto_94566 ) ) ( not ( = ?auto_94564 ?auto_94567 ) ) ( not ( = ?auto_94565 ?auto_94566 ) ) ( not ( = ?auto_94565 ?auto_94567 ) ) ( not ( = ?auto_94566 ?auto_94567 ) ) ( ON ?auto_94567 ?auto_94570 ) ( not ( = ?auto_94563 ?auto_94570 ) ) ( not ( = ?auto_94564 ?auto_94570 ) ) ( not ( = ?auto_94565 ?auto_94570 ) ) ( not ( = ?auto_94566 ?auto_94570 ) ) ( not ( = ?auto_94567 ?auto_94570 ) ) ( ON ?auto_94566 ?auto_94567 ) ( ON-TABLE ?auto_94569 ) ( ON ?auto_94568 ?auto_94569 ) ( ON ?auto_94570 ?auto_94568 ) ( not ( = ?auto_94569 ?auto_94568 ) ) ( not ( = ?auto_94569 ?auto_94570 ) ) ( not ( = ?auto_94569 ?auto_94567 ) ) ( not ( = ?auto_94569 ?auto_94566 ) ) ( not ( = ?auto_94568 ?auto_94570 ) ) ( not ( = ?auto_94568 ?auto_94567 ) ) ( not ( = ?auto_94568 ?auto_94566 ) ) ( not ( = ?auto_94563 ?auto_94569 ) ) ( not ( = ?auto_94563 ?auto_94568 ) ) ( not ( = ?auto_94564 ?auto_94569 ) ) ( not ( = ?auto_94564 ?auto_94568 ) ) ( not ( = ?auto_94565 ?auto_94569 ) ) ( not ( = ?auto_94565 ?auto_94568 ) ) ( ON ?auto_94565 ?auto_94566 ) ( CLEAR ?auto_94563 ) ( ON ?auto_94564 ?auto_94565 ) ( CLEAR ?auto_94564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94569 ?auto_94568 ?auto_94570 ?auto_94567 ?auto_94566 ?auto_94565 )
      ( MAKE-5PILE ?auto_94563 ?auto_94564 ?auto_94565 ?auto_94566 ?auto_94567 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94571 - BLOCK
      ?auto_94572 - BLOCK
      ?auto_94573 - BLOCK
      ?auto_94574 - BLOCK
      ?auto_94575 - BLOCK
    )
    :vars
    (
      ?auto_94578 - BLOCK
      ?auto_94576 - BLOCK
      ?auto_94577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94571 ?auto_94572 ) ) ( not ( = ?auto_94571 ?auto_94573 ) ) ( not ( = ?auto_94571 ?auto_94574 ) ) ( not ( = ?auto_94571 ?auto_94575 ) ) ( not ( = ?auto_94572 ?auto_94573 ) ) ( not ( = ?auto_94572 ?auto_94574 ) ) ( not ( = ?auto_94572 ?auto_94575 ) ) ( not ( = ?auto_94573 ?auto_94574 ) ) ( not ( = ?auto_94573 ?auto_94575 ) ) ( not ( = ?auto_94574 ?auto_94575 ) ) ( ON ?auto_94575 ?auto_94578 ) ( not ( = ?auto_94571 ?auto_94578 ) ) ( not ( = ?auto_94572 ?auto_94578 ) ) ( not ( = ?auto_94573 ?auto_94578 ) ) ( not ( = ?auto_94574 ?auto_94578 ) ) ( not ( = ?auto_94575 ?auto_94578 ) ) ( ON ?auto_94574 ?auto_94575 ) ( ON-TABLE ?auto_94576 ) ( ON ?auto_94577 ?auto_94576 ) ( ON ?auto_94578 ?auto_94577 ) ( not ( = ?auto_94576 ?auto_94577 ) ) ( not ( = ?auto_94576 ?auto_94578 ) ) ( not ( = ?auto_94576 ?auto_94575 ) ) ( not ( = ?auto_94576 ?auto_94574 ) ) ( not ( = ?auto_94577 ?auto_94578 ) ) ( not ( = ?auto_94577 ?auto_94575 ) ) ( not ( = ?auto_94577 ?auto_94574 ) ) ( not ( = ?auto_94571 ?auto_94576 ) ) ( not ( = ?auto_94571 ?auto_94577 ) ) ( not ( = ?auto_94572 ?auto_94576 ) ) ( not ( = ?auto_94572 ?auto_94577 ) ) ( not ( = ?auto_94573 ?auto_94576 ) ) ( not ( = ?auto_94573 ?auto_94577 ) ) ( ON ?auto_94573 ?auto_94574 ) ( ON ?auto_94572 ?auto_94573 ) ( CLEAR ?auto_94572 ) ( HOLDING ?auto_94571 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94571 )
      ( MAKE-5PILE ?auto_94571 ?auto_94572 ?auto_94573 ?auto_94574 ?auto_94575 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_94579 - BLOCK
      ?auto_94580 - BLOCK
      ?auto_94581 - BLOCK
      ?auto_94582 - BLOCK
      ?auto_94583 - BLOCK
    )
    :vars
    (
      ?auto_94585 - BLOCK
      ?auto_94586 - BLOCK
      ?auto_94584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94579 ?auto_94580 ) ) ( not ( = ?auto_94579 ?auto_94581 ) ) ( not ( = ?auto_94579 ?auto_94582 ) ) ( not ( = ?auto_94579 ?auto_94583 ) ) ( not ( = ?auto_94580 ?auto_94581 ) ) ( not ( = ?auto_94580 ?auto_94582 ) ) ( not ( = ?auto_94580 ?auto_94583 ) ) ( not ( = ?auto_94581 ?auto_94582 ) ) ( not ( = ?auto_94581 ?auto_94583 ) ) ( not ( = ?auto_94582 ?auto_94583 ) ) ( ON ?auto_94583 ?auto_94585 ) ( not ( = ?auto_94579 ?auto_94585 ) ) ( not ( = ?auto_94580 ?auto_94585 ) ) ( not ( = ?auto_94581 ?auto_94585 ) ) ( not ( = ?auto_94582 ?auto_94585 ) ) ( not ( = ?auto_94583 ?auto_94585 ) ) ( ON ?auto_94582 ?auto_94583 ) ( ON-TABLE ?auto_94586 ) ( ON ?auto_94584 ?auto_94586 ) ( ON ?auto_94585 ?auto_94584 ) ( not ( = ?auto_94586 ?auto_94584 ) ) ( not ( = ?auto_94586 ?auto_94585 ) ) ( not ( = ?auto_94586 ?auto_94583 ) ) ( not ( = ?auto_94586 ?auto_94582 ) ) ( not ( = ?auto_94584 ?auto_94585 ) ) ( not ( = ?auto_94584 ?auto_94583 ) ) ( not ( = ?auto_94584 ?auto_94582 ) ) ( not ( = ?auto_94579 ?auto_94586 ) ) ( not ( = ?auto_94579 ?auto_94584 ) ) ( not ( = ?auto_94580 ?auto_94586 ) ) ( not ( = ?auto_94580 ?auto_94584 ) ) ( not ( = ?auto_94581 ?auto_94586 ) ) ( not ( = ?auto_94581 ?auto_94584 ) ) ( ON ?auto_94581 ?auto_94582 ) ( ON ?auto_94580 ?auto_94581 ) ( ON ?auto_94579 ?auto_94580 ) ( CLEAR ?auto_94579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94586 ?auto_94584 ?auto_94585 ?auto_94583 ?auto_94582 ?auto_94581 ?auto_94580 )
      ( MAKE-5PILE ?auto_94579 ?auto_94580 ?auto_94581 ?auto_94582 ?auto_94583 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94589 - BLOCK
      ?auto_94590 - BLOCK
    )
    :vars
    (
      ?auto_94591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94591 ?auto_94590 ) ( CLEAR ?auto_94591 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94589 ) ( ON ?auto_94590 ?auto_94589 ) ( not ( = ?auto_94589 ?auto_94590 ) ) ( not ( = ?auto_94589 ?auto_94591 ) ) ( not ( = ?auto_94590 ?auto_94591 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94591 ?auto_94590 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94592 - BLOCK
      ?auto_94593 - BLOCK
    )
    :vars
    (
      ?auto_94594 - BLOCK
      ?auto_94595 - BLOCK
      ?auto_94596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94594 ?auto_94593 ) ( CLEAR ?auto_94594 ) ( ON-TABLE ?auto_94592 ) ( ON ?auto_94593 ?auto_94592 ) ( not ( = ?auto_94592 ?auto_94593 ) ) ( not ( = ?auto_94592 ?auto_94594 ) ) ( not ( = ?auto_94593 ?auto_94594 ) ) ( HOLDING ?auto_94595 ) ( CLEAR ?auto_94596 ) ( not ( = ?auto_94592 ?auto_94595 ) ) ( not ( = ?auto_94592 ?auto_94596 ) ) ( not ( = ?auto_94593 ?auto_94595 ) ) ( not ( = ?auto_94593 ?auto_94596 ) ) ( not ( = ?auto_94594 ?auto_94595 ) ) ( not ( = ?auto_94594 ?auto_94596 ) ) ( not ( = ?auto_94595 ?auto_94596 ) ) )
    :subtasks
    ( ( !STACK ?auto_94595 ?auto_94596 )
      ( MAKE-2PILE ?auto_94592 ?auto_94593 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94597 - BLOCK
      ?auto_94598 - BLOCK
    )
    :vars
    (
      ?auto_94599 - BLOCK
      ?auto_94601 - BLOCK
      ?auto_94600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94599 ?auto_94598 ) ( ON-TABLE ?auto_94597 ) ( ON ?auto_94598 ?auto_94597 ) ( not ( = ?auto_94597 ?auto_94598 ) ) ( not ( = ?auto_94597 ?auto_94599 ) ) ( not ( = ?auto_94598 ?auto_94599 ) ) ( CLEAR ?auto_94601 ) ( not ( = ?auto_94597 ?auto_94600 ) ) ( not ( = ?auto_94597 ?auto_94601 ) ) ( not ( = ?auto_94598 ?auto_94600 ) ) ( not ( = ?auto_94598 ?auto_94601 ) ) ( not ( = ?auto_94599 ?auto_94600 ) ) ( not ( = ?auto_94599 ?auto_94601 ) ) ( not ( = ?auto_94600 ?auto_94601 ) ) ( ON ?auto_94600 ?auto_94599 ) ( CLEAR ?auto_94600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94597 ?auto_94598 ?auto_94599 )
      ( MAKE-2PILE ?auto_94597 ?auto_94598 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94602 - BLOCK
      ?auto_94603 - BLOCK
    )
    :vars
    (
      ?auto_94606 - BLOCK
      ?auto_94605 - BLOCK
      ?auto_94604 - BLOCK
      ?auto_94607 - BLOCK
      ?auto_94609 - BLOCK
      ?auto_94608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94606 ?auto_94603 ) ( ON-TABLE ?auto_94602 ) ( ON ?auto_94603 ?auto_94602 ) ( not ( = ?auto_94602 ?auto_94603 ) ) ( not ( = ?auto_94602 ?auto_94606 ) ) ( not ( = ?auto_94603 ?auto_94606 ) ) ( not ( = ?auto_94602 ?auto_94605 ) ) ( not ( = ?auto_94602 ?auto_94604 ) ) ( not ( = ?auto_94603 ?auto_94605 ) ) ( not ( = ?auto_94603 ?auto_94604 ) ) ( not ( = ?auto_94606 ?auto_94605 ) ) ( not ( = ?auto_94606 ?auto_94604 ) ) ( not ( = ?auto_94605 ?auto_94604 ) ) ( ON ?auto_94605 ?auto_94606 ) ( CLEAR ?auto_94605 ) ( HOLDING ?auto_94604 ) ( CLEAR ?auto_94607 ) ( ON-TABLE ?auto_94609 ) ( ON ?auto_94608 ?auto_94609 ) ( ON ?auto_94607 ?auto_94608 ) ( not ( = ?auto_94609 ?auto_94608 ) ) ( not ( = ?auto_94609 ?auto_94607 ) ) ( not ( = ?auto_94609 ?auto_94604 ) ) ( not ( = ?auto_94608 ?auto_94607 ) ) ( not ( = ?auto_94608 ?auto_94604 ) ) ( not ( = ?auto_94607 ?auto_94604 ) ) ( not ( = ?auto_94602 ?auto_94607 ) ) ( not ( = ?auto_94602 ?auto_94609 ) ) ( not ( = ?auto_94602 ?auto_94608 ) ) ( not ( = ?auto_94603 ?auto_94607 ) ) ( not ( = ?auto_94603 ?auto_94609 ) ) ( not ( = ?auto_94603 ?auto_94608 ) ) ( not ( = ?auto_94606 ?auto_94607 ) ) ( not ( = ?auto_94606 ?auto_94609 ) ) ( not ( = ?auto_94606 ?auto_94608 ) ) ( not ( = ?auto_94605 ?auto_94607 ) ) ( not ( = ?auto_94605 ?auto_94609 ) ) ( not ( = ?auto_94605 ?auto_94608 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94609 ?auto_94608 ?auto_94607 ?auto_94604 )
      ( MAKE-2PILE ?auto_94602 ?auto_94603 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94610 - BLOCK
      ?auto_94611 - BLOCK
    )
    :vars
    (
      ?auto_94613 - BLOCK
      ?auto_94615 - BLOCK
      ?auto_94617 - BLOCK
      ?auto_94612 - BLOCK
      ?auto_94614 - BLOCK
      ?auto_94616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94613 ?auto_94611 ) ( ON-TABLE ?auto_94610 ) ( ON ?auto_94611 ?auto_94610 ) ( not ( = ?auto_94610 ?auto_94611 ) ) ( not ( = ?auto_94610 ?auto_94613 ) ) ( not ( = ?auto_94611 ?auto_94613 ) ) ( not ( = ?auto_94610 ?auto_94615 ) ) ( not ( = ?auto_94610 ?auto_94617 ) ) ( not ( = ?auto_94611 ?auto_94615 ) ) ( not ( = ?auto_94611 ?auto_94617 ) ) ( not ( = ?auto_94613 ?auto_94615 ) ) ( not ( = ?auto_94613 ?auto_94617 ) ) ( not ( = ?auto_94615 ?auto_94617 ) ) ( ON ?auto_94615 ?auto_94613 ) ( CLEAR ?auto_94612 ) ( ON-TABLE ?auto_94614 ) ( ON ?auto_94616 ?auto_94614 ) ( ON ?auto_94612 ?auto_94616 ) ( not ( = ?auto_94614 ?auto_94616 ) ) ( not ( = ?auto_94614 ?auto_94612 ) ) ( not ( = ?auto_94614 ?auto_94617 ) ) ( not ( = ?auto_94616 ?auto_94612 ) ) ( not ( = ?auto_94616 ?auto_94617 ) ) ( not ( = ?auto_94612 ?auto_94617 ) ) ( not ( = ?auto_94610 ?auto_94612 ) ) ( not ( = ?auto_94610 ?auto_94614 ) ) ( not ( = ?auto_94610 ?auto_94616 ) ) ( not ( = ?auto_94611 ?auto_94612 ) ) ( not ( = ?auto_94611 ?auto_94614 ) ) ( not ( = ?auto_94611 ?auto_94616 ) ) ( not ( = ?auto_94613 ?auto_94612 ) ) ( not ( = ?auto_94613 ?auto_94614 ) ) ( not ( = ?auto_94613 ?auto_94616 ) ) ( not ( = ?auto_94615 ?auto_94612 ) ) ( not ( = ?auto_94615 ?auto_94614 ) ) ( not ( = ?auto_94615 ?auto_94616 ) ) ( ON ?auto_94617 ?auto_94615 ) ( CLEAR ?auto_94617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94610 ?auto_94611 ?auto_94613 ?auto_94615 )
      ( MAKE-2PILE ?auto_94610 ?auto_94611 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94618 - BLOCK
      ?auto_94619 - BLOCK
    )
    :vars
    (
      ?auto_94623 - BLOCK
      ?auto_94620 - BLOCK
      ?auto_94625 - BLOCK
      ?auto_94624 - BLOCK
      ?auto_94621 - BLOCK
      ?auto_94622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94623 ?auto_94619 ) ( ON-TABLE ?auto_94618 ) ( ON ?auto_94619 ?auto_94618 ) ( not ( = ?auto_94618 ?auto_94619 ) ) ( not ( = ?auto_94618 ?auto_94623 ) ) ( not ( = ?auto_94619 ?auto_94623 ) ) ( not ( = ?auto_94618 ?auto_94620 ) ) ( not ( = ?auto_94618 ?auto_94625 ) ) ( not ( = ?auto_94619 ?auto_94620 ) ) ( not ( = ?auto_94619 ?auto_94625 ) ) ( not ( = ?auto_94623 ?auto_94620 ) ) ( not ( = ?auto_94623 ?auto_94625 ) ) ( not ( = ?auto_94620 ?auto_94625 ) ) ( ON ?auto_94620 ?auto_94623 ) ( ON-TABLE ?auto_94624 ) ( ON ?auto_94621 ?auto_94624 ) ( not ( = ?auto_94624 ?auto_94621 ) ) ( not ( = ?auto_94624 ?auto_94622 ) ) ( not ( = ?auto_94624 ?auto_94625 ) ) ( not ( = ?auto_94621 ?auto_94622 ) ) ( not ( = ?auto_94621 ?auto_94625 ) ) ( not ( = ?auto_94622 ?auto_94625 ) ) ( not ( = ?auto_94618 ?auto_94622 ) ) ( not ( = ?auto_94618 ?auto_94624 ) ) ( not ( = ?auto_94618 ?auto_94621 ) ) ( not ( = ?auto_94619 ?auto_94622 ) ) ( not ( = ?auto_94619 ?auto_94624 ) ) ( not ( = ?auto_94619 ?auto_94621 ) ) ( not ( = ?auto_94623 ?auto_94622 ) ) ( not ( = ?auto_94623 ?auto_94624 ) ) ( not ( = ?auto_94623 ?auto_94621 ) ) ( not ( = ?auto_94620 ?auto_94622 ) ) ( not ( = ?auto_94620 ?auto_94624 ) ) ( not ( = ?auto_94620 ?auto_94621 ) ) ( ON ?auto_94625 ?auto_94620 ) ( CLEAR ?auto_94625 ) ( HOLDING ?auto_94622 ) ( CLEAR ?auto_94621 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94624 ?auto_94621 ?auto_94622 )
      ( MAKE-2PILE ?auto_94618 ?auto_94619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94626 - BLOCK
      ?auto_94627 - BLOCK
    )
    :vars
    (
      ?auto_94633 - BLOCK
      ?auto_94630 - BLOCK
      ?auto_94629 - BLOCK
      ?auto_94628 - BLOCK
      ?auto_94632 - BLOCK
      ?auto_94631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94633 ?auto_94627 ) ( ON-TABLE ?auto_94626 ) ( ON ?auto_94627 ?auto_94626 ) ( not ( = ?auto_94626 ?auto_94627 ) ) ( not ( = ?auto_94626 ?auto_94633 ) ) ( not ( = ?auto_94627 ?auto_94633 ) ) ( not ( = ?auto_94626 ?auto_94630 ) ) ( not ( = ?auto_94626 ?auto_94629 ) ) ( not ( = ?auto_94627 ?auto_94630 ) ) ( not ( = ?auto_94627 ?auto_94629 ) ) ( not ( = ?auto_94633 ?auto_94630 ) ) ( not ( = ?auto_94633 ?auto_94629 ) ) ( not ( = ?auto_94630 ?auto_94629 ) ) ( ON ?auto_94630 ?auto_94633 ) ( ON-TABLE ?auto_94628 ) ( ON ?auto_94632 ?auto_94628 ) ( not ( = ?auto_94628 ?auto_94632 ) ) ( not ( = ?auto_94628 ?auto_94631 ) ) ( not ( = ?auto_94628 ?auto_94629 ) ) ( not ( = ?auto_94632 ?auto_94631 ) ) ( not ( = ?auto_94632 ?auto_94629 ) ) ( not ( = ?auto_94631 ?auto_94629 ) ) ( not ( = ?auto_94626 ?auto_94631 ) ) ( not ( = ?auto_94626 ?auto_94628 ) ) ( not ( = ?auto_94626 ?auto_94632 ) ) ( not ( = ?auto_94627 ?auto_94631 ) ) ( not ( = ?auto_94627 ?auto_94628 ) ) ( not ( = ?auto_94627 ?auto_94632 ) ) ( not ( = ?auto_94633 ?auto_94631 ) ) ( not ( = ?auto_94633 ?auto_94628 ) ) ( not ( = ?auto_94633 ?auto_94632 ) ) ( not ( = ?auto_94630 ?auto_94631 ) ) ( not ( = ?auto_94630 ?auto_94628 ) ) ( not ( = ?auto_94630 ?auto_94632 ) ) ( ON ?auto_94629 ?auto_94630 ) ( CLEAR ?auto_94632 ) ( ON ?auto_94631 ?auto_94629 ) ( CLEAR ?auto_94631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94626 ?auto_94627 ?auto_94633 ?auto_94630 ?auto_94629 )
      ( MAKE-2PILE ?auto_94626 ?auto_94627 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94634 - BLOCK
      ?auto_94635 - BLOCK
    )
    :vars
    (
      ?auto_94640 - BLOCK
      ?auto_94636 - BLOCK
      ?auto_94641 - BLOCK
      ?auto_94637 - BLOCK
      ?auto_94638 - BLOCK
      ?auto_94639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94640 ?auto_94635 ) ( ON-TABLE ?auto_94634 ) ( ON ?auto_94635 ?auto_94634 ) ( not ( = ?auto_94634 ?auto_94635 ) ) ( not ( = ?auto_94634 ?auto_94640 ) ) ( not ( = ?auto_94635 ?auto_94640 ) ) ( not ( = ?auto_94634 ?auto_94636 ) ) ( not ( = ?auto_94634 ?auto_94641 ) ) ( not ( = ?auto_94635 ?auto_94636 ) ) ( not ( = ?auto_94635 ?auto_94641 ) ) ( not ( = ?auto_94640 ?auto_94636 ) ) ( not ( = ?auto_94640 ?auto_94641 ) ) ( not ( = ?auto_94636 ?auto_94641 ) ) ( ON ?auto_94636 ?auto_94640 ) ( ON-TABLE ?auto_94637 ) ( not ( = ?auto_94637 ?auto_94638 ) ) ( not ( = ?auto_94637 ?auto_94639 ) ) ( not ( = ?auto_94637 ?auto_94641 ) ) ( not ( = ?auto_94638 ?auto_94639 ) ) ( not ( = ?auto_94638 ?auto_94641 ) ) ( not ( = ?auto_94639 ?auto_94641 ) ) ( not ( = ?auto_94634 ?auto_94639 ) ) ( not ( = ?auto_94634 ?auto_94637 ) ) ( not ( = ?auto_94634 ?auto_94638 ) ) ( not ( = ?auto_94635 ?auto_94639 ) ) ( not ( = ?auto_94635 ?auto_94637 ) ) ( not ( = ?auto_94635 ?auto_94638 ) ) ( not ( = ?auto_94640 ?auto_94639 ) ) ( not ( = ?auto_94640 ?auto_94637 ) ) ( not ( = ?auto_94640 ?auto_94638 ) ) ( not ( = ?auto_94636 ?auto_94639 ) ) ( not ( = ?auto_94636 ?auto_94637 ) ) ( not ( = ?auto_94636 ?auto_94638 ) ) ( ON ?auto_94641 ?auto_94636 ) ( ON ?auto_94639 ?auto_94641 ) ( CLEAR ?auto_94639 ) ( HOLDING ?auto_94638 ) ( CLEAR ?auto_94637 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94637 ?auto_94638 )
      ( MAKE-2PILE ?auto_94634 ?auto_94635 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95935 - BLOCK
      ?auto_95936 - BLOCK
    )
    :vars
    (
      ?auto_95938 - BLOCK
      ?auto_95937 - BLOCK
      ?auto_95939 - BLOCK
      ?auto_95941 - BLOCK
      ?auto_95940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95938 ?auto_95936 ) ( ON-TABLE ?auto_95935 ) ( ON ?auto_95936 ?auto_95935 ) ( not ( = ?auto_95935 ?auto_95936 ) ) ( not ( = ?auto_95935 ?auto_95938 ) ) ( not ( = ?auto_95936 ?auto_95938 ) ) ( not ( = ?auto_95935 ?auto_95937 ) ) ( not ( = ?auto_95935 ?auto_95939 ) ) ( not ( = ?auto_95936 ?auto_95937 ) ) ( not ( = ?auto_95936 ?auto_95939 ) ) ( not ( = ?auto_95938 ?auto_95937 ) ) ( not ( = ?auto_95938 ?auto_95939 ) ) ( not ( = ?auto_95937 ?auto_95939 ) ) ( ON ?auto_95937 ?auto_95938 ) ( not ( = ?auto_95941 ?auto_95940 ) ) ( not ( = ?auto_95941 ?auto_95939 ) ) ( not ( = ?auto_95940 ?auto_95939 ) ) ( not ( = ?auto_95935 ?auto_95940 ) ) ( not ( = ?auto_95935 ?auto_95941 ) ) ( not ( = ?auto_95936 ?auto_95940 ) ) ( not ( = ?auto_95936 ?auto_95941 ) ) ( not ( = ?auto_95938 ?auto_95940 ) ) ( not ( = ?auto_95938 ?auto_95941 ) ) ( not ( = ?auto_95937 ?auto_95940 ) ) ( not ( = ?auto_95937 ?auto_95941 ) ) ( ON ?auto_95939 ?auto_95937 ) ( ON ?auto_95940 ?auto_95939 ) ( ON ?auto_95941 ?auto_95940 ) ( CLEAR ?auto_95941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95935 ?auto_95936 ?auto_95938 ?auto_95937 ?auto_95939 ?auto_95940 )
      ( MAKE-2PILE ?auto_95935 ?auto_95936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94650 - BLOCK
      ?auto_94651 - BLOCK
    )
    :vars
    (
      ?auto_94657 - BLOCK
      ?auto_94655 - BLOCK
      ?auto_94652 - BLOCK
      ?auto_94656 - BLOCK
      ?auto_94654 - BLOCK
      ?auto_94653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94657 ?auto_94651 ) ( ON-TABLE ?auto_94650 ) ( ON ?auto_94651 ?auto_94650 ) ( not ( = ?auto_94650 ?auto_94651 ) ) ( not ( = ?auto_94650 ?auto_94657 ) ) ( not ( = ?auto_94651 ?auto_94657 ) ) ( not ( = ?auto_94650 ?auto_94655 ) ) ( not ( = ?auto_94650 ?auto_94652 ) ) ( not ( = ?auto_94651 ?auto_94655 ) ) ( not ( = ?auto_94651 ?auto_94652 ) ) ( not ( = ?auto_94657 ?auto_94655 ) ) ( not ( = ?auto_94657 ?auto_94652 ) ) ( not ( = ?auto_94655 ?auto_94652 ) ) ( ON ?auto_94655 ?auto_94657 ) ( not ( = ?auto_94656 ?auto_94654 ) ) ( not ( = ?auto_94656 ?auto_94653 ) ) ( not ( = ?auto_94656 ?auto_94652 ) ) ( not ( = ?auto_94654 ?auto_94653 ) ) ( not ( = ?auto_94654 ?auto_94652 ) ) ( not ( = ?auto_94653 ?auto_94652 ) ) ( not ( = ?auto_94650 ?auto_94653 ) ) ( not ( = ?auto_94650 ?auto_94656 ) ) ( not ( = ?auto_94650 ?auto_94654 ) ) ( not ( = ?auto_94651 ?auto_94653 ) ) ( not ( = ?auto_94651 ?auto_94656 ) ) ( not ( = ?auto_94651 ?auto_94654 ) ) ( not ( = ?auto_94657 ?auto_94653 ) ) ( not ( = ?auto_94657 ?auto_94656 ) ) ( not ( = ?auto_94657 ?auto_94654 ) ) ( not ( = ?auto_94655 ?auto_94653 ) ) ( not ( = ?auto_94655 ?auto_94656 ) ) ( not ( = ?auto_94655 ?auto_94654 ) ) ( ON ?auto_94652 ?auto_94655 ) ( ON ?auto_94653 ?auto_94652 ) ( ON ?auto_94654 ?auto_94653 ) ( CLEAR ?auto_94654 ) ( HOLDING ?auto_94656 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94656 )
      ( MAKE-2PILE ?auto_94650 ?auto_94651 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_94658 - BLOCK
      ?auto_94659 - BLOCK
    )
    :vars
    (
      ?auto_94662 - BLOCK
      ?auto_94665 - BLOCK
      ?auto_94664 - BLOCK
      ?auto_94663 - BLOCK
      ?auto_94661 - BLOCK
      ?auto_94660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94662 ?auto_94659 ) ( ON-TABLE ?auto_94658 ) ( ON ?auto_94659 ?auto_94658 ) ( not ( = ?auto_94658 ?auto_94659 ) ) ( not ( = ?auto_94658 ?auto_94662 ) ) ( not ( = ?auto_94659 ?auto_94662 ) ) ( not ( = ?auto_94658 ?auto_94665 ) ) ( not ( = ?auto_94658 ?auto_94664 ) ) ( not ( = ?auto_94659 ?auto_94665 ) ) ( not ( = ?auto_94659 ?auto_94664 ) ) ( not ( = ?auto_94662 ?auto_94665 ) ) ( not ( = ?auto_94662 ?auto_94664 ) ) ( not ( = ?auto_94665 ?auto_94664 ) ) ( ON ?auto_94665 ?auto_94662 ) ( not ( = ?auto_94663 ?auto_94661 ) ) ( not ( = ?auto_94663 ?auto_94660 ) ) ( not ( = ?auto_94663 ?auto_94664 ) ) ( not ( = ?auto_94661 ?auto_94660 ) ) ( not ( = ?auto_94661 ?auto_94664 ) ) ( not ( = ?auto_94660 ?auto_94664 ) ) ( not ( = ?auto_94658 ?auto_94660 ) ) ( not ( = ?auto_94658 ?auto_94663 ) ) ( not ( = ?auto_94658 ?auto_94661 ) ) ( not ( = ?auto_94659 ?auto_94660 ) ) ( not ( = ?auto_94659 ?auto_94663 ) ) ( not ( = ?auto_94659 ?auto_94661 ) ) ( not ( = ?auto_94662 ?auto_94660 ) ) ( not ( = ?auto_94662 ?auto_94663 ) ) ( not ( = ?auto_94662 ?auto_94661 ) ) ( not ( = ?auto_94665 ?auto_94660 ) ) ( not ( = ?auto_94665 ?auto_94663 ) ) ( not ( = ?auto_94665 ?auto_94661 ) ) ( ON ?auto_94664 ?auto_94665 ) ( ON ?auto_94660 ?auto_94664 ) ( ON ?auto_94661 ?auto_94660 ) ( ON ?auto_94663 ?auto_94661 ) ( CLEAR ?auto_94663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94658 ?auto_94659 ?auto_94662 ?auto_94665 ?auto_94664 ?auto_94660 ?auto_94661 )
      ( MAKE-2PILE ?auto_94658 ?auto_94659 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94672 - BLOCK
      ?auto_94673 - BLOCK
      ?auto_94674 - BLOCK
      ?auto_94675 - BLOCK
      ?auto_94676 - BLOCK
      ?auto_94677 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_94677 ) ( CLEAR ?auto_94676 ) ( ON-TABLE ?auto_94672 ) ( ON ?auto_94673 ?auto_94672 ) ( ON ?auto_94674 ?auto_94673 ) ( ON ?auto_94675 ?auto_94674 ) ( ON ?auto_94676 ?auto_94675 ) ( not ( = ?auto_94672 ?auto_94673 ) ) ( not ( = ?auto_94672 ?auto_94674 ) ) ( not ( = ?auto_94672 ?auto_94675 ) ) ( not ( = ?auto_94672 ?auto_94676 ) ) ( not ( = ?auto_94672 ?auto_94677 ) ) ( not ( = ?auto_94673 ?auto_94674 ) ) ( not ( = ?auto_94673 ?auto_94675 ) ) ( not ( = ?auto_94673 ?auto_94676 ) ) ( not ( = ?auto_94673 ?auto_94677 ) ) ( not ( = ?auto_94674 ?auto_94675 ) ) ( not ( = ?auto_94674 ?auto_94676 ) ) ( not ( = ?auto_94674 ?auto_94677 ) ) ( not ( = ?auto_94675 ?auto_94676 ) ) ( not ( = ?auto_94675 ?auto_94677 ) ) ( not ( = ?auto_94676 ?auto_94677 ) ) )
    :subtasks
    ( ( !STACK ?auto_94677 ?auto_94676 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94678 - BLOCK
      ?auto_94679 - BLOCK
      ?auto_94680 - BLOCK
      ?auto_94681 - BLOCK
      ?auto_94682 - BLOCK
      ?auto_94683 - BLOCK
    )
    :vars
    (
      ?auto_94684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94682 ) ( ON-TABLE ?auto_94678 ) ( ON ?auto_94679 ?auto_94678 ) ( ON ?auto_94680 ?auto_94679 ) ( ON ?auto_94681 ?auto_94680 ) ( ON ?auto_94682 ?auto_94681 ) ( not ( = ?auto_94678 ?auto_94679 ) ) ( not ( = ?auto_94678 ?auto_94680 ) ) ( not ( = ?auto_94678 ?auto_94681 ) ) ( not ( = ?auto_94678 ?auto_94682 ) ) ( not ( = ?auto_94678 ?auto_94683 ) ) ( not ( = ?auto_94679 ?auto_94680 ) ) ( not ( = ?auto_94679 ?auto_94681 ) ) ( not ( = ?auto_94679 ?auto_94682 ) ) ( not ( = ?auto_94679 ?auto_94683 ) ) ( not ( = ?auto_94680 ?auto_94681 ) ) ( not ( = ?auto_94680 ?auto_94682 ) ) ( not ( = ?auto_94680 ?auto_94683 ) ) ( not ( = ?auto_94681 ?auto_94682 ) ) ( not ( = ?auto_94681 ?auto_94683 ) ) ( not ( = ?auto_94682 ?auto_94683 ) ) ( ON ?auto_94683 ?auto_94684 ) ( CLEAR ?auto_94683 ) ( HAND-EMPTY ) ( not ( = ?auto_94678 ?auto_94684 ) ) ( not ( = ?auto_94679 ?auto_94684 ) ) ( not ( = ?auto_94680 ?auto_94684 ) ) ( not ( = ?auto_94681 ?auto_94684 ) ) ( not ( = ?auto_94682 ?auto_94684 ) ) ( not ( = ?auto_94683 ?auto_94684 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94683 ?auto_94684 )
      ( MAKE-6PILE ?auto_94678 ?auto_94679 ?auto_94680 ?auto_94681 ?auto_94682 ?auto_94683 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94685 - BLOCK
      ?auto_94686 - BLOCK
      ?auto_94687 - BLOCK
      ?auto_94688 - BLOCK
      ?auto_94689 - BLOCK
      ?auto_94690 - BLOCK
    )
    :vars
    (
      ?auto_94691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94685 ) ( ON ?auto_94686 ?auto_94685 ) ( ON ?auto_94687 ?auto_94686 ) ( ON ?auto_94688 ?auto_94687 ) ( not ( = ?auto_94685 ?auto_94686 ) ) ( not ( = ?auto_94685 ?auto_94687 ) ) ( not ( = ?auto_94685 ?auto_94688 ) ) ( not ( = ?auto_94685 ?auto_94689 ) ) ( not ( = ?auto_94685 ?auto_94690 ) ) ( not ( = ?auto_94686 ?auto_94687 ) ) ( not ( = ?auto_94686 ?auto_94688 ) ) ( not ( = ?auto_94686 ?auto_94689 ) ) ( not ( = ?auto_94686 ?auto_94690 ) ) ( not ( = ?auto_94687 ?auto_94688 ) ) ( not ( = ?auto_94687 ?auto_94689 ) ) ( not ( = ?auto_94687 ?auto_94690 ) ) ( not ( = ?auto_94688 ?auto_94689 ) ) ( not ( = ?auto_94688 ?auto_94690 ) ) ( not ( = ?auto_94689 ?auto_94690 ) ) ( ON ?auto_94690 ?auto_94691 ) ( CLEAR ?auto_94690 ) ( not ( = ?auto_94685 ?auto_94691 ) ) ( not ( = ?auto_94686 ?auto_94691 ) ) ( not ( = ?auto_94687 ?auto_94691 ) ) ( not ( = ?auto_94688 ?auto_94691 ) ) ( not ( = ?auto_94689 ?auto_94691 ) ) ( not ( = ?auto_94690 ?auto_94691 ) ) ( HOLDING ?auto_94689 ) ( CLEAR ?auto_94688 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94685 ?auto_94686 ?auto_94687 ?auto_94688 ?auto_94689 )
      ( MAKE-6PILE ?auto_94685 ?auto_94686 ?auto_94687 ?auto_94688 ?auto_94689 ?auto_94690 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94692 - BLOCK
      ?auto_94693 - BLOCK
      ?auto_94694 - BLOCK
      ?auto_94695 - BLOCK
      ?auto_94696 - BLOCK
      ?auto_94697 - BLOCK
    )
    :vars
    (
      ?auto_94698 - BLOCK
      ?auto_94699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94692 ) ( ON ?auto_94693 ?auto_94692 ) ( ON ?auto_94694 ?auto_94693 ) ( ON ?auto_94695 ?auto_94694 ) ( not ( = ?auto_94692 ?auto_94693 ) ) ( not ( = ?auto_94692 ?auto_94694 ) ) ( not ( = ?auto_94692 ?auto_94695 ) ) ( not ( = ?auto_94692 ?auto_94696 ) ) ( not ( = ?auto_94692 ?auto_94697 ) ) ( not ( = ?auto_94693 ?auto_94694 ) ) ( not ( = ?auto_94693 ?auto_94695 ) ) ( not ( = ?auto_94693 ?auto_94696 ) ) ( not ( = ?auto_94693 ?auto_94697 ) ) ( not ( = ?auto_94694 ?auto_94695 ) ) ( not ( = ?auto_94694 ?auto_94696 ) ) ( not ( = ?auto_94694 ?auto_94697 ) ) ( not ( = ?auto_94695 ?auto_94696 ) ) ( not ( = ?auto_94695 ?auto_94697 ) ) ( not ( = ?auto_94696 ?auto_94697 ) ) ( ON ?auto_94697 ?auto_94698 ) ( not ( = ?auto_94692 ?auto_94698 ) ) ( not ( = ?auto_94693 ?auto_94698 ) ) ( not ( = ?auto_94694 ?auto_94698 ) ) ( not ( = ?auto_94695 ?auto_94698 ) ) ( not ( = ?auto_94696 ?auto_94698 ) ) ( not ( = ?auto_94697 ?auto_94698 ) ) ( CLEAR ?auto_94695 ) ( ON ?auto_94696 ?auto_94697 ) ( CLEAR ?auto_94696 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94699 ) ( ON ?auto_94698 ?auto_94699 ) ( not ( = ?auto_94699 ?auto_94698 ) ) ( not ( = ?auto_94699 ?auto_94697 ) ) ( not ( = ?auto_94699 ?auto_94696 ) ) ( not ( = ?auto_94692 ?auto_94699 ) ) ( not ( = ?auto_94693 ?auto_94699 ) ) ( not ( = ?auto_94694 ?auto_94699 ) ) ( not ( = ?auto_94695 ?auto_94699 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94699 ?auto_94698 ?auto_94697 )
      ( MAKE-6PILE ?auto_94692 ?auto_94693 ?auto_94694 ?auto_94695 ?auto_94696 ?auto_94697 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94700 - BLOCK
      ?auto_94701 - BLOCK
      ?auto_94702 - BLOCK
      ?auto_94703 - BLOCK
      ?auto_94704 - BLOCK
      ?auto_94705 - BLOCK
    )
    :vars
    (
      ?auto_94707 - BLOCK
      ?auto_94706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94700 ) ( ON ?auto_94701 ?auto_94700 ) ( ON ?auto_94702 ?auto_94701 ) ( not ( = ?auto_94700 ?auto_94701 ) ) ( not ( = ?auto_94700 ?auto_94702 ) ) ( not ( = ?auto_94700 ?auto_94703 ) ) ( not ( = ?auto_94700 ?auto_94704 ) ) ( not ( = ?auto_94700 ?auto_94705 ) ) ( not ( = ?auto_94701 ?auto_94702 ) ) ( not ( = ?auto_94701 ?auto_94703 ) ) ( not ( = ?auto_94701 ?auto_94704 ) ) ( not ( = ?auto_94701 ?auto_94705 ) ) ( not ( = ?auto_94702 ?auto_94703 ) ) ( not ( = ?auto_94702 ?auto_94704 ) ) ( not ( = ?auto_94702 ?auto_94705 ) ) ( not ( = ?auto_94703 ?auto_94704 ) ) ( not ( = ?auto_94703 ?auto_94705 ) ) ( not ( = ?auto_94704 ?auto_94705 ) ) ( ON ?auto_94705 ?auto_94707 ) ( not ( = ?auto_94700 ?auto_94707 ) ) ( not ( = ?auto_94701 ?auto_94707 ) ) ( not ( = ?auto_94702 ?auto_94707 ) ) ( not ( = ?auto_94703 ?auto_94707 ) ) ( not ( = ?auto_94704 ?auto_94707 ) ) ( not ( = ?auto_94705 ?auto_94707 ) ) ( ON ?auto_94704 ?auto_94705 ) ( CLEAR ?auto_94704 ) ( ON-TABLE ?auto_94706 ) ( ON ?auto_94707 ?auto_94706 ) ( not ( = ?auto_94706 ?auto_94707 ) ) ( not ( = ?auto_94706 ?auto_94705 ) ) ( not ( = ?auto_94706 ?auto_94704 ) ) ( not ( = ?auto_94700 ?auto_94706 ) ) ( not ( = ?auto_94701 ?auto_94706 ) ) ( not ( = ?auto_94702 ?auto_94706 ) ) ( not ( = ?auto_94703 ?auto_94706 ) ) ( HOLDING ?auto_94703 ) ( CLEAR ?auto_94702 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94700 ?auto_94701 ?auto_94702 ?auto_94703 )
      ( MAKE-6PILE ?auto_94700 ?auto_94701 ?auto_94702 ?auto_94703 ?auto_94704 ?auto_94705 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94708 - BLOCK
      ?auto_94709 - BLOCK
      ?auto_94710 - BLOCK
      ?auto_94711 - BLOCK
      ?auto_94712 - BLOCK
      ?auto_94713 - BLOCK
    )
    :vars
    (
      ?auto_94715 - BLOCK
      ?auto_94714 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94708 ) ( ON ?auto_94709 ?auto_94708 ) ( ON ?auto_94710 ?auto_94709 ) ( not ( = ?auto_94708 ?auto_94709 ) ) ( not ( = ?auto_94708 ?auto_94710 ) ) ( not ( = ?auto_94708 ?auto_94711 ) ) ( not ( = ?auto_94708 ?auto_94712 ) ) ( not ( = ?auto_94708 ?auto_94713 ) ) ( not ( = ?auto_94709 ?auto_94710 ) ) ( not ( = ?auto_94709 ?auto_94711 ) ) ( not ( = ?auto_94709 ?auto_94712 ) ) ( not ( = ?auto_94709 ?auto_94713 ) ) ( not ( = ?auto_94710 ?auto_94711 ) ) ( not ( = ?auto_94710 ?auto_94712 ) ) ( not ( = ?auto_94710 ?auto_94713 ) ) ( not ( = ?auto_94711 ?auto_94712 ) ) ( not ( = ?auto_94711 ?auto_94713 ) ) ( not ( = ?auto_94712 ?auto_94713 ) ) ( ON ?auto_94713 ?auto_94715 ) ( not ( = ?auto_94708 ?auto_94715 ) ) ( not ( = ?auto_94709 ?auto_94715 ) ) ( not ( = ?auto_94710 ?auto_94715 ) ) ( not ( = ?auto_94711 ?auto_94715 ) ) ( not ( = ?auto_94712 ?auto_94715 ) ) ( not ( = ?auto_94713 ?auto_94715 ) ) ( ON ?auto_94712 ?auto_94713 ) ( ON-TABLE ?auto_94714 ) ( ON ?auto_94715 ?auto_94714 ) ( not ( = ?auto_94714 ?auto_94715 ) ) ( not ( = ?auto_94714 ?auto_94713 ) ) ( not ( = ?auto_94714 ?auto_94712 ) ) ( not ( = ?auto_94708 ?auto_94714 ) ) ( not ( = ?auto_94709 ?auto_94714 ) ) ( not ( = ?auto_94710 ?auto_94714 ) ) ( not ( = ?auto_94711 ?auto_94714 ) ) ( CLEAR ?auto_94710 ) ( ON ?auto_94711 ?auto_94712 ) ( CLEAR ?auto_94711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94714 ?auto_94715 ?auto_94713 ?auto_94712 )
      ( MAKE-6PILE ?auto_94708 ?auto_94709 ?auto_94710 ?auto_94711 ?auto_94712 ?auto_94713 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94716 - BLOCK
      ?auto_94717 - BLOCK
      ?auto_94718 - BLOCK
      ?auto_94719 - BLOCK
      ?auto_94720 - BLOCK
      ?auto_94721 - BLOCK
    )
    :vars
    (
      ?auto_94723 - BLOCK
      ?auto_94722 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94716 ) ( ON ?auto_94717 ?auto_94716 ) ( not ( = ?auto_94716 ?auto_94717 ) ) ( not ( = ?auto_94716 ?auto_94718 ) ) ( not ( = ?auto_94716 ?auto_94719 ) ) ( not ( = ?auto_94716 ?auto_94720 ) ) ( not ( = ?auto_94716 ?auto_94721 ) ) ( not ( = ?auto_94717 ?auto_94718 ) ) ( not ( = ?auto_94717 ?auto_94719 ) ) ( not ( = ?auto_94717 ?auto_94720 ) ) ( not ( = ?auto_94717 ?auto_94721 ) ) ( not ( = ?auto_94718 ?auto_94719 ) ) ( not ( = ?auto_94718 ?auto_94720 ) ) ( not ( = ?auto_94718 ?auto_94721 ) ) ( not ( = ?auto_94719 ?auto_94720 ) ) ( not ( = ?auto_94719 ?auto_94721 ) ) ( not ( = ?auto_94720 ?auto_94721 ) ) ( ON ?auto_94721 ?auto_94723 ) ( not ( = ?auto_94716 ?auto_94723 ) ) ( not ( = ?auto_94717 ?auto_94723 ) ) ( not ( = ?auto_94718 ?auto_94723 ) ) ( not ( = ?auto_94719 ?auto_94723 ) ) ( not ( = ?auto_94720 ?auto_94723 ) ) ( not ( = ?auto_94721 ?auto_94723 ) ) ( ON ?auto_94720 ?auto_94721 ) ( ON-TABLE ?auto_94722 ) ( ON ?auto_94723 ?auto_94722 ) ( not ( = ?auto_94722 ?auto_94723 ) ) ( not ( = ?auto_94722 ?auto_94721 ) ) ( not ( = ?auto_94722 ?auto_94720 ) ) ( not ( = ?auto_94716 ?auto_94722 ) ) ( not ( = ?auto_94717 ?auto_94722 ) ) ( not ( = ?auto_94718 ?auto_94722 ) ) ( not ( = ?auto_94719 ?auto_94722 ) ) ( ON ?auto_94719 ?auto_94720 ) ( CLEAR ?auto_94719 ) ( HOLDING ?auto_94718 ) ( CLEAR ?auto_94717 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94716 ?auto_94717 ?auto_94718 )
      ( MAKE-6PILE ?auto_94716 ?auto_94717 ?auto_94718 ?auto_94719 ?auto_94720 ?auto_94721 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94724 - BLOCK
      ?auto_94725 - BLOCK
      ?auto_94726 - BLOCK
      ?auto_94727 - BLOCK
      ?auto_94728 - BLOCK
      ?auto_94729 - BLOCK
    )
    :vars
    (
      ?auto_94730 - BLOCK
      ?auto_94731 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94724 ) ( ON ?auto_94725 ?auto_94724 ) ( not ( = ?auto_94724 ?auto_94725 ) ) ( not ( = ?auto_94724 ?auto_94726 ) ) ( not ( = ?auto_94724 ?auto_94727 ) ) ( not ( = ?auto_94724 ?auto_94728 ) ) ( not ( = ?auto_94724 ?auto_94729 ) ) ( not ( = ?auto_94725 ?auto_94726 ) ) ( not ( = ?auto_94725 ?auto_94727 ) ) ( not ( = ?auto_94725 ?auto_94728 ) ) ( not ( = ?auto_94725 ?auto_94729 ) ) ( not ( = ?auto_94726 ?auto_94727 ) ) ( not ( = ?auto_94726 ?auto_94728 ) ) ( not ( = ?auto_94726 ?auto_94729 ) ) ( not ( = ?auto_94727 ?auto_94728 ) ) ( not ( = ?auto_94727 ?auto_94729 ) ) ( not ( = ?auto_94728 ?auto_94729 ) ) ( ON ?auto_94729 ?auto_94730 ) ( not ( = ?auto_94724 ?auto_94730 ) ) ( not ( = ?auto_94725 ?auto_94730 ) ) ( not ( = ?auto_94726 ?auto_94730 ) ) ( not ( = ?auto_94727 ?auto_94730 ) ) ( not ( = ?auto_94728 ?auto_94730 ) ) ( not ( = ?auto_94729 ?auto_94730 ) ) ( ON ?auto_94728 ?auto_94729 ) ( ON-TABLE ?auto_94731 ) ( ON ?auto_94730 ?auto_94731 ) ( not ( = ?auto_94731 ?auto_94730 ) ) ( not ( = ?auto_94731 ?auto_94729 ) ) ( not ( = ?auto_94731 ?auto_94728 ) ) ( not ( = ?auto_94724 ?auto_94731 ) ) ( not ( = ?auto_94725 ?auto_94731 ) ) ( not ( = ?auto_94726 ?auto_94731 ) ) ( not ( = ?auto_94727 ?auto_94731 ) ) ( ON ?auto_94727 ?auto_94728 ) ( CLEAR ?auto_94725 ) ( ON ?auto_94726 ?auto_94727 ) ( CLEAR ?auto_94726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94731 ?auto_94730 ?auto_94729 ?auto_94728 ?auto_94727 )
      ( MAKE-6PILE ?auto_94724 ?auto_94725 ?auto_94726 ?auto_94727 ?auto_94728 ?auto_94729 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94732 - BLOCK
      ?auto_94733 - BLOCK
      ?auto_94734 - BLOCK
      ?auto_94735 - BLOCK
      ?auto_94736 - BLOCK
      ?auto_94737 - BLOCK
    )
    :vars
    (
      ?auto_94738 - BLOCK
      ?auto_94739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94732 ) ( not ( = ?auto_94732 ?auto_94733 ) ) ( not ( = ?auto_94732 ?auto_94734 ) ) ( not ( = ?auto_94732 ?auto_94735 ) ) ( not ( = ?auto_94732 ?auto_94736 ) ) ( not ( = ?auto_94732 ?auto_94737 ) ) ( not ( = ?auto_94733 ?auto_94734 ) ) ( not ( = ?auto_94733 ?auto_94735 ) ) ( not ( = ?auto_94733 ?auto_94736 ) ) ( not ( = ?auto_94733 ?auto_94737 ) ) ( not ( = ?auto_94734 ?auto_94735 ) ) ( not ( = ?auto_94734 ?auto_94736 ) ) ( not ( = ?auto_94734 ?auto_94737 ) ) ( not ( = ?auto_94735 ?auto_94736 ) ) ( not ( = ?auto_94735 ?auto_94737 ) ) ( not ( = ?auto_94736 ?auto_94737 ) ) ( ON ?auto_94737 ?auto_94738 ) ( not ( = ?auto_94732 ?auto_94738 ) ) ( not ( = ?auto_94733 ?auto_94738 ) ) ( not ( = ?auto_94734 ?auto_94738 ) ) ( not ( = ?auto_94735 ?auto_94738 ) ) ( not ( = ?auto_94736 ?auto_94738 ) ) ( not ( = ?auto_94737 ?auto_94738 ) ) ( ON ?auto_94736 ?auto_94737 ) ( ON-TABLE ?auto_94739 ) ( ON ?auto_94738 ?auto_94739 ) ( not ( = ?auto_94739 ?auto_94738 ) ) ( not ( = ?auto_94739 ?auto_94737 ) ) ( not ( = ?auto_94739 ?auto_94736 ) ) ( not ( = ?auto_94732 ?auto_94739 ) ) ( not ( = ?auto_94733 ?auto_94739 ) ) ( not ( = ?auto_94734 ?auto_94739 ) ) ( not ( = ?auto_94735 ?auto_94739 ) ) ( ON ?auto_94735 ?auto_94736 ) ( ON ?auto_94734 ?auto_94735 ) ( CLEAR ?auto_94734 ) ( HOLDING ?auto_94733 ) ( CLEAR ?auto_94732 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94732 ?auto_94733 )
      ( MAKE-6PILE ?auto_94732 ?auto_94733 ?auto_94734 ?auto_94735 ?auto_94736 ?auto_94737 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94740 - BLOCK
      ?auto_94741 - BLOCK
      ?auto_94742 - BLOCK
      ?auto_94743 - BLOCK
      ?auto_94744 - BLOCK
      ?auto_94745 - BLOCK
    )
    :vars
    (
      ?auto_94747 - BLOCK
      ?auto_94746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94740 ) ( not ( = ?auto_94740 ?auto_94741 ) ) ( not ( = ?auto_94740 ?auto_94742 ) ) ( not ( = ?auto_94740 ?auto_94743 ) ) ( not ( = ?auto_94740 ?auto_94744 ) ) ( not ( = ?auto_94740 ?auto_94745 ) ) ( not ( = ?auto_94741 ?auto_94742 ) ) ( not ( = ?auto_94741 ?auto_94743 ) ) ( not ( = ?auto_94741 ?auto_94744 ) ) ( not ( = ?auto_94741 ?auto_94745 ) ) ( not ( = ?auto_94742 ?auto_94743 ) ) ( not ( = ?auto_94742 ?auto_94744 ) ) ( not ( = ?auto_94742 ?auto_94745 ) ) ( not ( = ?auto_94743 ?auto_94744 ) ) ( not ( = ?auto_94743 ?auto_94745 ) ) ( not ( = ?auto_94744 ?auto_94745 ) ) ( ON ?auto_94745 ?auto_94747 ) ( not ( = ?auto_94740 ?auto_94747 ) ) ( not ( = ?auto_94741 ?auto_94747 ) ) ( not ( = ?auto_94742 ?auto_94747 ) ) ( not ( = ?auto_94743 ?auto_94747 ) ) ( not ( = ?auto_94744 ?auto_94747 ) ) ( not ( = ?auto_94745 ?auto_94747 ) ) ( ON ?auto_94744 ?auto_94745 ) ( ON-TABLE ?auto_94746 ) ( ON ?auto_94747 ?auto_94746 ) ( not ( = ?auto_94746 ?auto_94747 ) ) ( not ( = ?auto_94746 ?auto_94745 ) ) ( not ( = ?auto_94746 ?auto_94744 ) ) ( not ( = ?auto_94740 ?auto_94746 ) ) ( not ( = ?auto_94741 ?auto_94746 ) ) ( not ( = ?auto_94742 ?auto_94746 ) ) ( not ( = ?auto_94743 ?auto_94746 ) ) ( ON ?auto_94743 ?auto_94744 ) ( ON ?auto_94742 ?auto_94743 ) ( CLEAR ?auto_94740 ) ( ON ?auto_94741 ?auto_94742 ) ( CLEAR ?auto_94741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94746 ?auto_94747 ?auto_94745 ?auto_94744 ?auto_94743 ?auto_94742 )
      ( MAKE-6PILE ?auto_94740 ?auto_94741 ?auto_94742 ?auto_94743 ?auto_94744 ?auto_94745 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94748 - BLOCK
      ?auto_94749 - BLOCK
      ?auto_94750 - BLOCK
      ?auto_94751 - BLOCK
      ?auto_94752 - BLOCK
      ?auto_94753 - BLOCK
    )
    :vars
    (
      ?auto_94754 - BLOCK
      ?auto_94755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94748 ?auto_94749 ) ) ( not ( = ?auto_94748 ?auto_94750 ) ) ( not ( = ?auto_94748 ?auto_94751 ) ) ( not ( = ?auto_94748 ?auto_94752 ) ) ( not ( = ?auto_94748 ?auto_94753 ) ) ( not ( = ?auto_94749 ?auto_94750 ) ) ( not ( = ?auto_94749 ?auto_94751 ) ) ( not ( = ?auto_94749 ?auto_94752 ) ) ( not ( = ?auto_94749 ?auto_94753 ) ) ( not ( = ?auto_94750 ?auto_94751 ) ) ( not ( = ?auto_94750 ?auto_94752 ) ) ( not ( = ?auto_94750 ?auto_94753 ) ) ( not ( = ?auto_94751 ?auto_94752 ) ) ( not ( = ?auto_94751 ?auto_94753 ) ) ( not ( = ?auto_94752 ?auto_94753 ) ) ( ON ?auto_94753 ?auto_94754 ) ( not ( = ?auto_94748 ?auto_94754 ) ) ( not ( = ?auto_94749 ?auto_94754 ) ) ( not ( = ?auto_94750 ?auto_94754 ) ) ( not ( = ?auto_94751 ?auto_94754 ) ) ( not ( = ?auto_94752 ?auto_94754 ) ) ( not ( = ?auto_94753 ?auto_94754 ) ) ( ON ?auto_94752 ?auto_94753 ) ( ON-TABLE ?auto_94755 ) ( ON ?auto_94754 ?auto_94755 ) ( not ( = ?auto_94755 ?auto_94754 ) ) ( not ( = ?auto_94755 ?auto_94753 ) ) ( not ( = ?auto_94755 ?auto_94752 ) ) ( not ( = ?auto_94748 ?auto_94755 ) ) ( not ( = ?auto_94749 ?auto_94755 ) ) ( not ( = ?auto_94750 ?auto_94755 ) ) ( not ( = ?auto_94751 ?auto_94755 ) ) ( ON ?auto_94751 ?auto_94752 ) ( ON ?auto_94750 ?auto_94751 ) ( ON ?auto_94749 ?auto_94750 ) ( CLEAR ?auto_94749 ) ( HOLDING ?auto_94748 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94748 )
      ( MAKE-6PILE ?auto_94748 ?auto_94749 ?auto_94750 ?auto_94751 ?auto_94752 ?auto_94753 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_94756 - BLOCK
      ?auto_94757 - BLOCK
      ?auto_94758 - BLOCK
      ?auto_94759 - BLOCK
      ?auto_94760 - BLOCK
      ?auto_94761 - BLOCK
    )
    :vars
    (
      ?auto_94762 - BLOCK
      ?auto_94763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94756 ?auto_94757 ) ) ( not ( = ?auto_94756 ?auto_94758 ) ) ( not ( = ?auto_94756 ?auto_94759 ) ) ( not ( = ?auto_94756 ?auto_94760 ) ) ( not ( = ?auto_94756 ?auto_94761 ) ) ( not ( = ?auto_94757 ?auto_94758 ) ) ( not ( = ?auto_94757 ?auto_94759 ) ) ( not ( = ?auto_94757 ?auto_94760 ) ) ( not ( = ?auto_94757 ?auto_94761 ) ) ( not ( = ?auto_94758 ?auto_94759 ) ) ( not ( = ?auto_94758 ?auto_94760 ) ) ( not ( = ?auto_94758 ?auto_94761 ) ) ( not ( = ?auto_94759 ?auto_94760 ) ) ( not ( = ?auto_94759 ?auto_94761 ) ) ( not ( = ?auto_94760 ?auto_94761 ) ) ( ON ?auto_94761 ?auto_94762 ) ( not ( = ?auto_94756 ?auto_94762 ) ) ( not ( = ?auto_94757 ?auto_94762 ) ) ( not ( = ?auto_94758 ?auto_94762 ) ) ( not ( = ?auto_94759 ?auto_94762 ) ) ( not ( = ?auto_94760 ?auto_94762 ) ) ( not ( = ?auto_94761 ?auto_94762 ) ) ( ON ?auto_94760 ?auto_94761 ) ( ON-TABLE ?auto_94763 ) ( ON ?auto_94762 ?auto_94763 ) ( not ( = ?auto_94763 ?auto_94762 ) ) ( not ( = ?auto_94763 ?auto_94761 ) ) ( not ( = ?auto_94763 ?auto_94760 ) ) ( not ( = ?auto_94756 ?auto_94763 ) ) ( not ( = ?auto_94757 ?auto_94763 ) ) ( not ( = ?auto_94758 ?auto_94763 ) ) ( not ( = ?auto_94759 ?auto_94763 ) ) ( ON ?auto_94759 ?auto_94760 ) ( ON ?auto_94758 ?auto_94759 ) ( ON ?auto_94757 ?auto_94758 ) ( ON ?auto_94756 ?auto_94757 ) ( CLEAR ?auto_94756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94763 ?auto_94762 ?auto_94761 ?auto_94760 ?auto_94759 ?auto_94758 ?auto_94757 )
      ( MAKE-6PILE ?auto_94756 ?auto_94757 ?auto_94758 ?auto_94759 ?auto_94760 ?auto_94761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94765 - BLOCK
    )
    :vars
    (
      ?auto_94766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94766 ?auto_94765 ) ( CLEAR ?auto_94766 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94765 ) ( not ( = ?auto_94765 ?auto_94766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94766 ?auto_94765 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94767 - BLOCK
    )
    :vars
    (
      ?auto_94768 - BLOCK
      ?auto_94769 - BLOCK
      ?auto_94770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94768 ?auto_94767 ) ( CLEAR ?auto_94768 ) ( ON-TABLE ?auto_94767 ) ( not ( = ?auto_94767 ?auto_94768 ) ) ( HOLDING ?auto_94769 ) ( CLEAR ?auto_94770 ) ( not ( = ?auto_94767 ?auto_94769 ) ) ( not ( = ?auto_94767 ?auto_94770 ) ) ( not ( = ?auto_94768 ?auto_94769 ) ) ( not ( = ?auto_94768 ?auto_94770 ) ) ( not ( = ?auto_94769 ?auto_94770 ) ) )
    :subtasks
    ( ( !STACK ?auto_94769 ?auto_94770 )
      ( MAKE-1PILE ?auto_94767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94771 - BLOCK
    )
    :vars
    (
      ?auto_94772 - BLOCK
      ?auto_94773 - BLOCK
      ?auto_94774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94772 ?auto_94771 ) ( ON-TABLE ?auto_94771 ) ( not ( = ?auto_94771 ?auto_94772 ) ) ( CLEAR ?auto_94773 ) ( not ( = ?auto_94771 ?auto_94774 ) ) ( not ( = ?auto_94771 ?auto_94773 ) ) ( not ( = ?auto_94772 ?auto_94774 ) ) ( not ( = ?auto_94772 ?auto_94773 ) ) ( not ( = ?auto_94774 ?auto_94773 ) ) ( ON ?auto_94774 ?auto_94772 ) ( CLEAR ?auto_94774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94771 ?auto_94772 )
      ( MAKE-1PILE ?auto_94771 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94775 - BLOCK
    )
    :vars
    (
      ?auto_94776 - BLOCK
      ?auto_94777 - BLOCK
      ?auto_94778 - BLOCK
      ?auto_94780 - BLOCK
      ?auto_94781 - BLOCK
      ?auto_94782 - BLOCK
      ?auto_94779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94776 ?auto_94775 ) ( ON-TABLE ?auto_94775 ) ( not ( = ?auto_94775 ?auto_94776 ) ) ( not ( = ?auto_94775 ?auto_94777 ) ) ( not ( = ?auto_94775 ?auto_94778 ) ) ( not ( = ?auto_94776 ?auto_94777 ) ) ( not ( = ?auto_94776 ?auto_94778 ) ) ( not ( = ?auto_94777 ?auto_94778 ) ) ( ON ?auto_94777 ?auto_94776 ) ( CLEAR ?auto_94777 ) ( HOLDING ?auto_94778 ) ( CLEAR ?auto_94780 ) ( ON-TABLE ?auto_94781 ) ( ON ?auto_94782 ?auto_94781 ) ( ON ?auto_94779 ?auto_94782 ) ( ON ?auto_94780 ?auto_94779 ) ( not ( = ?auto_94781 ?auto_94782 ) ) ( not ( = ?auto_94781 ?auto_94779 ) ) ( not ( = ?auto_94781 ?auto_94780 ) ) ( not ( = ?auto_94781 ?auto_94778 ) ) ( not ( = ?auto_94782 ?auto_94779 ) ) ( not ( = ?auto_94782 ?auto_94780 ) ) ( not ( = ?auto_94782 ?auto_94778 ) ) ( not ( = ?auto_94779 ?auto_94780 ) ) ( not ( = ?auto_94779 ?auto_94778 ) ) ( not ( = ?auto_94780 ?auto_94778 ) ) ( not ( = ?auto_94775 ?auto_94780 ) ) ( not ( = ?auto_94775 ?auto_94781 ) ) ( not ( = ?auto_94775 ?auto_94782 ) ) ( not ( = ?auto_94775 ?auto_94779 ) ) ( not ( = ?auto_94776 ?auto_94780 ) ) ( not ( = ?auto_94776 ?auto_94781 ) ) ( not ( = ?auto_94776 ?auto_94782 ) ) ( not ( = ?auto_94776 ?auto_94779 ) ) ( not ( = ?auto_94777 ?auto_94780 ) ) ( not ( = ?auto_94777 ?auto_94781 ) ) ( not ( = ?auto_94777 ?auto_94782 ) ) ( not ( = ?auto_94777 ?auto_94779 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94781 ?auto_94782 ?auto_94779 ?auto_94780 ?auto_94778 )
      ( MAKE-1PILE ?auto_94775 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94783 - BLOCK
    )
    :vars
    (
      ?auto_94785 - BLOCK
      ?auto_94790 - BLOCK
      ?auto_94789 - BLOCK
      ?auto_94786 - BLOCK
      ?auto_94787 - BLOCK
      ?auto_94784 - BLOCK
      ?auto_94788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94785 ?auto_94783 ) ( ON-TABLE ?auto_94783 ) ( not ( = ?auto_94783 ?auto_94785 ) ) ( not ( = ?auto_94783 ?auto_94790 ) ) ( not ( = ?auto_94783 ?auto_94789 ) ) ( not ( = ?auto_94785 ?auto_94790 ) ) ( not ( = ?auto_94785 ?auto_94789 ) ) ( not ( = ?auto_94790 ?auto_94789 ) ) ( ON ?auto_94790 ?auto_94785 ) ( CLEAR ?auto_94786 ) ( ON-TABLE ?auto_94787 ) ( ON ?auto_94784 ?auto_94787 ) ( ON ?auto_94788 ?auto_94784 ) ( ON ?auto_94786 ?auto_94788 ) ( not ( = ?auto_94787 ?auto_94784 ) ) ( not ( = ?auto_94787 ?auto_94788 ) ) ( not ( = ?auto_94787 ?auto_94786 ) ) ( not ( = ?auto_94787 ?auto_94789 ) ) ( not ( = ?auto_94784 ?auto_94788 ) ) ( not ( = ?auto_94784 ?auto_94786 ) ) ( not ( = ?auto_94784 ?auto_94789 ) ) ( not ( = ?auto_94788 ?auto_94786 ) ) ( not ( = ?auto_94788 ?auto_94789 ) ) ( not ( = ?auto_94786 ?auto_94789 ) ) ( not ( = ?auto_94783 ?auto_94786 ) ) ( not ( = ?auto_94783 ?auto_94787 ) ) ( not ( = ?auto_94783 ?auto_94784 ) ) ( not ( = ?auto_94783 ?auto_94788 ) ) ( not ( = ?auto_94785 ?auto_94786 ) ) ( not ( = ?auto_94785 ?auto_94787 ) ) ( not ( = ?auto_94785 ?auto_94784 ) ) ( not ( = ?auto_94785 ?auto_94788 ) ) ( not ( = ?auto_94790 ?auto_94786 ) ) ( not ( = ?auto_94790 ?auto_94787 ) ) ( not ( = ?auto_94790 ?auto_94784 ) ) ( not ( = ?auto_94790 ?auto_94788 ) ) ( ON ?auto_94789 ?auto_94790 ) ( CLEAR ?auto_94789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94783 ?auto_94785 ?auto_94790 )
      ( MAKE-1PILE ?auto_94783 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94791 - BLOCK
    )
    :vars
    (
      ?auto_94797 - BLOCK
      ?auto_94795 - BLOCK
      ?auto_94796 - BLOCK
      ?auto_94794 - BLOCK
      ?auto_94798 - BLOCK
      ?auto_94793 - BLOCK
      ?auto_94792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94797 ?auto_94791 ) ( ON-TABLE ?auto_94791 ) ( not ( = ?auto_94791 ?auto_94797 ) ) ( not ( = ?auto_94791 ?auto_94795 ) ) ( not ( = ?auto_94791 ?auto_94796 ) ) ( not ( = ?auto_94797 ?auto_94795 ) ) ( not ( = ?auto_94797 ?auto_94796 ) ) ( not ( = ?auto_94795 ?auto_94796 ) ) ( ON ?auto_94795 ?auto_94797 ) ( ON-TABLE ?auto_94794 ) ( ON ?auto_94798 ?auto_94794 ) ( ON ?auto_94793 ?auto_94798 ) ( not ( = ?auto_94794 ?auto_94798 ) ) ( not ( = ?auto_94794 ?auto_94793 ) ) ( not ( = ?auto_94794 ?auto_94792 ) ) ( not ( = ?auto_94794 ?auto_94796 ) ) ( not ( = ?auto_94798 ?auto_94793 ) ) ( not ( = ?auto_94798 ?auto_94792 ) ) ( not ( = ?auto_94798 ?auto_94796 ) ) ( not ( = ?auto_94793 ?auto_94792 ) ) ( not ( = ?auto_94793 ?auto_94796 ) ) ( not ( = ?auto_94792 ?auto_94796 ) ) ( not ( = ?auto_94791 ?auto_94792 ) ) ( not ( = ?auto_94791 ?auto_94794 ) ) ( not ( = ?auto_94791 ?auto_94798 ) ) ( not ( = ?auto_94791 ?auto_94793 ) ) ( not ( = ?auto_94797 ?auto_94792 ) ) ( not ( = ?auto_94797 ?auto_94794 ) ) ( not ( = ?auto_94797 ?auto_94798 ) ) ( not ( = ?auto_94797 ?auto_94793 ) ) ( not ( = ?auto_94795 ?auto_94792 ) ) ( not ( = ?auto_94795 ?auto_94794 ) ) ( not ( = ?auto_94795 ?auto_94798 ) ) ( not ( = ?auto_94795 ?auto_94793 ) ) ( ON ?auto_94796 ?auto_94795 ) ( CLEAR ?auto_94796 ) ( HOLDING ?auto_94792 ) ( CLEAR ?auto_94793 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94794 ?auto_94798 ?auto_94793 ?auto_94792 )
      ( MAKE-1PILE ?auto_94791 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94799 - BLOCK
    )
    :vars
    (
      ?auto_94802 - BLOCK
      ?auto_94800 - BLOCK
      ?auto_94806 - BLOCK
      ?auto_94803 - BLOCK
      ?auto_94801 - BLOCK
      ?auto_94804 - BLOCK
      ?auto_94805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94802 ?auto_94799 ) ( ON-TABLE ?auto_94799 ) ( not ( = ?auto_94799 ?auto_94802 ) ) ( not ( = ?auto_94799 ?auto_94800 ) ) ( not ( = ?auto_94799 ?auto_94806 ) ) ( not ( = ?auto_94802 ?auto_94800 ) ) ( not ( = ?auto_94802 ?auto_94806 ) ) ( not ( = ?auto_94800 ?auto_94806 ) ) ( ON ?auto_94800 ?auto_94802 ) ( ON-TABLE ?auto_94803 ) ( ON ?auto_94801 ?auto_94803 ) ( ON ?auto_94804 ?auto_94801 ) ( not ( = ?auto_94803 ?auto_94801 ) ) ( not ( = ?auto_94803 ?auto_94804 ) ) ( not ( = ?auto_94803 ?auto_94805 ) ) ( not ( = ?auto_94803 ?auto_94806 ) ) ( not ( = ?auto_94801 ?auto_94804 ) ) ( not ( = ?auto_94801 ?auto_94805 ) ) ( not ( = ?auto_94801 ?auto_94806 ) ) ( not ( = ?auto_94804 ?auto_94805 ) ) ( not ( = ?auto_94804 ?auto_94806 ) ) ( not ( = ?auto_94805 ?auto_94806 ) ) ( not ( = ?auto_94799 ?auto_94805 ) ) ( not ( = ?auto_94799 ?auto_94803 ) ) ( not ( = ?auto_94799 ?auto_94801 ) ) ( not ( = ?auto_94799 ?auto_94804 ) ) ( not ( = ?auto_94802 ?auto_94805 ) ) ( not ( = ?auto_94802 ?auto_94803 ) ) ( not ( = ?auto_94802 ?auto_94801 ) ) ( not ( = ?auto_94802 ?auto_94804 ) ) ( not ( = ?auto_94800 ?auto_94805 ) ) ( not ( = ?auto_94800 ?auto_94803 ) ) ( not ( = ?auto_94800 ?auto_94801 ) ) ( not ( = ?auto_94800 ?auto_94804 ) ) ( ON ?auto_94806 ?auto_94800 ) ( CLEAR ?auto_94804 ) ( ON ?auto_94805 ?auto_94806 ) ( CLEAR ?auto_94805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94799 ?auto_94802 ?auto_94800 ?auto_94806 )
      ( MAKE-1PILE ?auto_94799 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94807 - BLOCK
    )
    :vars
    (
      ?auto_94811 - BLOCK
      ?auto_94809 - BLOCK
      ?auto_94814 - BLOCK
      ?auto_94813 - BLOCK
      ?auto_94812 - BLOCK
      ?auto_94808 - BLOCK
      ?auto_94810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94811 ?auto_94807 ) ( ON-TABLE ?auto_94807 ) ( not ( = ?auto_94807 ?auto_94811 ) ) ( not ( = ?auto_94807 ?auto_94809 ) ) ( not ( = ?auto_94807 ?auto_94814 ) ) ( not ( = ?auto_94811 ?auto_94809 ) ) ( not ( = ?auto_94811 ?auto_94814 ) ) ( not ( = ?auto_94809 ?auto_94814 ) ) ( ON ?auto_94809 ?auto_94811 ) ( ON-TABLE ?auto_94813 ) ( ON ?auto_94812 ?auto_94813 ) ( not ( = ?auto_94813 ?auto_94812 ) ) ( not ( = ?auto_94813 ?auto_94808 ) ) ( not ( = ?auto_94813 ?auto_94810 ) ) ( not ( = ?auto_94813 ?auto_94814 ) ) ( not ( = ?auto_94812 ?auto_94808 ) ) ( not ( = ?auto_94812 ?auto_94810 ) ) ( not ( = ?auto_94812 ?auto_94814 ) ) ( not ( = ?auto_94808 ?auto_94810 ) ) ( not ( = ?auto_94808 ?auto_94814 ) ) ( not ( = ?auto_94810 ?auto_94814 ) ) ( not ( = ?auto_94807 ?auto_94810 ) ) ( not ( = ?auto_94807 ?auto_94813 ) ) ( not ( = ?auto_94807 ?auto_94812 ) ) ( not ( = ?auto_94807 ?auto_94808 ) ) ( not ( = ?auto_94811 ?auto_94810 ) ) ( not ( = ?auto_94811 ?auto_94813 ) ) ( not ( = ?auto_94811 ?auto_94812 ) ) ( not ( = ?auto_94811 ?auto_94808 ) ) ( not ( = ?auto_94809 ?auto_94810 ) ) ( not ( = ?auto_94809 ?auto_94813 ) ) ( not ( = ?auto_94809 ?auto_94812 ) ) ( not ( = ?auto_94809 ?auto_94808 ) ) ( ON ?auto_94814 ?auto_94809 ) ( ON ?auto_94810 ?auto_94814 ) ( CLEAR ?auto_94810 ) ( HOLDING ?auto_94808 ) ( CLEAR ?auto_94812 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94813 ?auto_94812 ?auto_94808 )
      ( MAKE-1PILE ?auto_94807 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94815 - BLOCK
    )
    :vars
    (
      ?auto_94821 - BLOCK
      ?auto_94820 - BLOCK
      ?auto_94816 - BLOCK
      ?auto_94819 - BLOCK
      ?auto_94822 - BLOCK
      ?auto_94817 - BLOCK
      ?auto_94818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94821 ?auto_94815 ) ( ON-TABLE ?auto_94815 ) ( not ( = ?auto_94815 ?auto_94821 ) ) ( not ( = ?auto_94815 ?auto_94820 ) ) ( not ( = ?auto_94815 ?auto_94816 ) ) ( not ( = ?auto_94821 ?auto_94820 ) ) ( not ( = ?auto_94821 ?auto_94816 ) ) ( not ( = ?auto_94820 ?auto_94816 ) ) ( ON ?auto_94820 ?auto_94821 ) ( ON-TABLE ?auto_94819 ) ( ON ?auto_94822 ?auto_94819 ) ( not ( = ?auto_94819 ?auto_94822 ) ) ( not ( = ?auto_94819 ?auto_94817 ) ) ( not ( = ?auto_94819 ?auto_94818 ) ) ( not ( = ?auto_94819 ?auto_94816 ) ) ( not ( = ?auto_94822 ?auto_94817 ) ) ( not ( = ?auto_94822 ?auto_94818 ) ) ( not ( = ?auto_94822 ?auto_94816 ) ) ( not ( = ?auto_94817 ?auto_94818 ) ) ( not ( = ?auto_94817 ?auto_94816 ) ) ( not ( = ?auto_94818 ?auto_94816 ) ) ( not ( = ?auto_94815 ?auto_94818 ) ) ( not ( = ?auto_94815 ?auto_94819 ) ) ( not ( = ?auto_94815 ?auto_94822 ) ) ( not ( = ?auto_94815 ?auto_94817 ) ) ( not ( = ?auto_94821 ?auto_94818 ) ) ( not ( = ?auto_94821 ?auto_94819 ) ) ( not ( = ?auto_94821 ?auto_94822 ) ) ( not ( = ?auto_94821 ?auto_94817 ) ) ( not ( = ?auto_94820 ?auto_94818 ) ) ( not ( = ?auto_94820 ?auto_94819 ) ) ( not ( = ?auto_94820 ?auto_94822 ) ) ( not ( = ?auto_94820 ?auto_94817 ) ) ( ON ?auto_94816 ?auto_94820 ) ( ON ?auto_94818 ?auto_94816 ) ( CLEAR ?auto_94822 ) ( ON ?auto_94817 ?auto_94818 ) ( CLEAR ?auto_94817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94815 ?auto_94821 ?auto_94820 ?auto_94816 ?auto_94818 )
      ( MAKE-1PILE ?auto_94815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94823 - BLOCK
    )
    :vars
    (
      ?auto_94828 - BLOCK
      ?auto_94829 - BLOCK
      ?auto_94830 - BLOCK
      ?auto_94824 - BLOCK
      ?auto_94825 - BLOCK
      ?auto_94826 - BLOCK
      ?auto_94827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94828 ?auto_94823 ) ( ON-TABLE ?auto_94823 ) ( not ( = ?auto_94823 ?auto_94828 ) ) ( not ( = ?auto_94823 ?auto_94829 ) ) ( not ( = ?auto_94823 ?auto_94830 ) ) ( not ( = ?auto_94828 ?auto_94829 ) ) ( not ( = ?auto_94828 ?auto_94830 ) ) ( not ( = ?auto_94829 ?auto_94830 ) ) ( ON ?auto_94829 ?auto_94828 ) ( ON-TABLE ?auto_94824 ) ( not ( = ?auto_94824 ?auto_94825 ) ) ( not ( = ?auto_94824 ?auto_94826 ) ) ( not ( = ?auto_94824 ?auto_94827 ) ) ( not ( = ?auto_94824 ?auto_94830 ) ) ( not ( = ?auto_94825 ?auto_94826 ) ) ( not ( = ?auto_94825 ?auto_94827 ) ) ( not ( = ?auto_94825 ?auto_94830 ) ) ( not ( = ?auto_94826 ?auto_94827 ) ) ( not ( = ?auto_94826 ?auto_94830 ) ) ( not ( = ?auto_94827 ?auto_94830 ) ) ( not ( = ?auto_94823 ?auto_94827 ) ) ( not ( = ?auto_94823 ?auto_94824 ) ) ( not ( = ?auto_94823 ?auto_94825 ) ) ( not ( = ?auto_94823 ?auto_94826 ) ) ( not ( = ?auto_94828 ?auto_94827 ) ) ( not ( = ?auto_94828 ?auto_94824 ) ) ( not ( = ?auto_94828 ?auto_94825 ) ) ( not ( = ?auto_94828 ?auto_94826 ) ) ( not ( = ?auto_94829 ?auto_94827 ) ) ( not ( = ?auto_94829 ?auto_94824 ) ) ( not ( = ?auto_94829 ?auto_94825 ) ) ( not ( = ?auto_94829 ?auto_94826 ) ) ( ON ?auto_94830 ?auto_94829 ) ( ON ?auto_94827 ?auto_94830 ) ( ON ?auto_94826 ?auto_94827 ) ( CLEAR ?auto_94826 ) ( HOLDING ?auto_94825 ) ( CLEAR ?auto_94824 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94824 ?auto_94825 )
      ( MAKE-1PILE ?auto_94823 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96237 - BLOCK
    )
    :vars
    (
      ?auto_96239 - BLOCK
      ?auto_96243 - BLOCK
      ?auto_96240 - BLOCK
      ?auto_96238 - BLOCK
      ?auto_96241 - BLOCK
      ?auto_96242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96239 ?auto_96237 ) ( ON-TABLE ?auto_96237 ) ( not ( = ?auto_96237 ?auto_96239 ) ) ( not ( = ?auto_96237 ?auto_96243 ) ) ( not ( = ?auto_96237 ?auto_96240 ) ) ( not ( = ?auto_96239 ?auto_96243 ) ) ( not ( = ?auto_96239 ?auto_96240 ) ) ( not ( = ?auto_96243 ?auto_96240 ) ) ( ON ?auto_96243 ?auto_96239 ) ( not ( = ?auto_96238 ?auto_96241 ) ) ( not ( = ?auto_96238 ?auto_96242 ) ) ( not ( = ?auto_96238 ?auto_96240 ) ) ( not ( = ?auto_96241 ?auto_96242 ) ) ( not ( = ?auto_96241 ?auto_96240 ) ) ( not ( = ?auto_96242 ?auto_96240 ) ) ( not ( = ?auto_96237 ?auto_96242 ) ) ( not ( = ?auto_96237 ?auto_96238 ) ) ( not ( = ?auto_96237 ?auto_96241 ) ) ( not ( = ?auto_96239 ?auto_96242 ) ) ( not ( = ?auto_96239 ?auto_96238 ) ) ( not ( = ?auto_96239 ?auto_96241 ) ) ( not ( = ?auto_96243 ?auto_96242 ) ) ( not ( = ?auto_96243 ?auto_96238 ) ) ( not ( = ?auto_96243 ?auto_96241 ) ) ( ON ?auto_96240 ?auto_96243 ) ( ON ?auto_96242 ?auto_96240 ) ( ON ?auto_96241 ?auto_96242 ) ( ON ?auto_96238 ?auto_96241 ) ( CLEAR ?auto_96238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96237 ?auto_96239 ?auto_96243 ?auto_96240 ?auto_96242 ?auto_96241 )
      ( MAKE-1PILE ?auto_96237 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94839 - BLOCK
    )
    :vars
    (
      ?auto_94845 - BLOCK
      ?auto_94846 - BLOCK
      ?auto_94842 - BLOCK
      ?auto_94841 - BLOCK
      ?auto_94840 - BLOCK
      ?auto_94843 - BLOCK
      ?auto_94844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94845 ?auto_94839 ) ( ON-TABLE ?auto_94839 ) ( not ( = ?auto_94839 ?auto_94845 ) ) ( not ( = ?auto_94839 ?auto_94846 ) ) ( not ( = ?auto_94839 ?auto_94842 ) ) ( not ( = ?auto_94845 ?auto_94846 ) ) ( not ( = ?auto_94845 ?auto_94842 ) ) ( not ( = ?auto_94846 ?auto_94842 ) ) ( ON ?auto_94846 ?auto_94845 ) ( not ( = ?auto_94841 ?auto_94840 ) ) ( not ( = ?auto_94841 ?auto_94843 ) ) ( not ( = ?auto_94841 ?auto_94844 ) ) ( not ( = ?auto_94841 ?auto_94842 ) ) ( not ( = ?auto_94840 ?auto_94843 ) ) ( not ( = ?auto_94840 ?auto_94844 ) ) ( not ( = ?auto_94840 ?auto_94842 ) ) ( not ( = ?auto_94843 ?auto_94844 ) ) ( not ( = ?auto_94843 ?auto_94842 ) ) ( not ( = ?auto_94844 ?auto_94842 ) ) ( not ( = ?auto_94839 ?auto_94844 ) ) ( not ( = ?auto_94839 ?auto_94841 ) ) ( not ( = ?auto_94839 ?auto_94840 ) ) ( not ( = ?auto_94839 ?auto_94843 ) ) ( not ( = ?auto_94845 ?auto_94844 ) ) ( not ( = ?auto_94845 ?auto_94841 ) ) ( not ( = ?auto_94845 ?auto_94840 ) ) ( not ( = ?auto_94845 ?auto_94843 ) ) ( not ( = ?auto_94846 ?auto_94844 ) ) ( not ( = ?auto_94846 ?auto_94841 ) ) ( not ( = ?auto_94846 ?auto_94840 ) ) ( not ( = ?auto_94846 ?auto_94843 ) ) ( ON ?auto_94842 ?auto_94846 ) ( ON ?auto_94844 ?auto_94842 ) ( ON ?auto_94843 ?auto_94844 ) ( ON ?auto_94840 ?auto_94843 ) ( CLEAR ?auto_94840 ) ( HOLDING ?auto_94841 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94841 )
      ( MAKE-1PILE ?auto_94839 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_94847 - BLOCK
    )
    :vars
    (
      ?auto_94854 - BLOCK
      ?auto_94852 - BLOCK
      ?auto_94850 - BLOCK
      ?auto_94851 - BLOCK
      ?auto_94853 - BLOCK
      ?auto_94848 - BLOCK
      ?auto_94849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94854 ?auto_94847 ) ( ON-TABLE ?auto_94847 ) ( not ( = ?auto_94847 ?auto_94854 ) ) ( not ( = ?auto_94847 ?auto_94852 ) ) ( not ( = ?auto_94847 ?auto_94850 ) ) ( not ( = ?auto_94854 ?auto_94852 ) ) ( not ( = ?auto_94854 ?auto_94850 ) ) ( not ( = ?auto_94852 ?auto_94850 ) ) ( ON ?auto_94852 ?auto_94854 ) ( not ( = ?auto_94851 ?auto_94853 ) ) ( not ( = ?auto_94851 ?auto_94848 ) ) ( not ( = ?auto_94851 ?auto_94849 ) ) ( not ( = ?auto_94851 ?auto_94850 ) ) ( not ( = ?auto_94853 ?auto_94848 ) ) ( not ( = ?auto_94853 ?auto_94849 ) ) ( not ( = ?auto_94853 ?auto_94850 ) ) ( not ( = ?auto_94848 ?auto_94849 ) ) ( not ( = ?auto_94848 ?auto_94850 ) ) ( not ( = ?auto_94849 ?auto_94850 ) ) ( not ( = ?auto_94847 ?auto_94849 ) ) ( not ( = ?auto_94847 ?auto_94851 ) ) ( not ( = ?auto_94847 ?auto_94853 ) ) ( not ( = ?auto_94847 ?auto_94848 ) ) ( not ( = ?auto_94854 ?auto_94849 ) ) ( not ( = ?auto_94854 ?auto_94851 ) ) ( not ( = ?auto_94854 ?auto_94853 ) ) ( not ( = ?auto_94854 ?auto_94848 ) ) ( not ( = ?auto_94852 ?auto_94849 ) ) ( not ( = ?auto_94852 ?auto_94851 ) ) ( not ( = ?auto_94852 ?auto_94853 ) ) ( not ( = ?auto_94852 ?auto_94848 ) ) ( ON ?auto_94850 ?auto_94852 ) ( ON ?auto_94849 ?auto_94850 ) ( ON ?auto_94848 ?auto_94849 ) ( ON ?auto_94853 ?auto_94848 ) ( ON ?auto_94851 ?auto_94853 ) ( CLEAR ?auto_94851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94847 ?auto_94854 ?auto_94852 ?auto_94850 ?auto_94849 ?auto_94848 ?auto_94853 )
      ( MAKE-1PILE ?auto_94847 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94862 - BLOCK
      ?auto_94863 - BLOCK
      ?auto_94864 - BLOCK
      ?auto_94865 - BLOCK
      ?auto_94866 - BLOCK
      ?auto_94867 - BLOCK
      ?auto_94868 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_94868 ) ( CLEAR ?auto_94867 ) ( ON-TABLE ?auto_94862 ) ( ON ?auto_94863 ?auto_94862 ) ( ON ?auto_94864 ?auto_94863 ) ( ON ?auto_94865 ?auto_94864 ) ( ON ?auto_94866 ?auto_94865 ) ( ON ?auto_94867 ?auto_94866 ) ( not ( = ?auto_94862 ?auto_94863 ) ) ( not ( = ?auto_94862 ?auto_94864 ) ) ( not ( = ?auto_94862 ?auto_94865 ) ) ( not ( = ?auto_94862 ?auto_94866 ) ) ( not ( = ?auto_94862 ?auto_94867 ) ) ( not ( = ?auto_94862 ?auto_94868 ) ) ( not ( = ?auto_94863 ?auto_94864 ) ) ( not ( = ?auto_94863 ?auto_94865 ) ) ( not ( = ?auto_94863 ?auto_94866 ) ) ( not ( = ?auto_94863 ?auto_94867 ) ) ( not ( = ?auto_94863 ?auto_94868 ) ) ( not ( = ?auto_94864 ?auto_94865 ) ) ( not ( = ?auto_94864 ?auto_94866 ) ) ( not ( = ?auto_94864 ?auto_94867 ) ) ( not ( = ?auto_94864 ?auto_94868 ) ) ( not ( = ?auto_94865 ?auto_94866 ) ) ( not ( = ?auto_94865 ?auto_94867 ) ) ( not ( = ?auto_94865 ?auto_94868 ) ) ( not ( = ?auto_94866 ?auto_94867 ) ) ( not ( = ?auto_94866 ?auto_94868 ) ) ( not ( = ?auto_94867 ?auto_94868 ) ) )
    :subtasks
    ( ( !STACK ?auto_94868 ?auto_94867 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94869 - BLOCK
      ?auto_94870 - BLOCK
      ?auto_94871 - BLOCK
      ?auto_94872 - BLOCK
      ?auto_94873 - BLOCK
      ?auto_94874 - BLOCK
      ?auto_94875 - BLOCK
    )
    :vars
    (
      ?auto_94876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94874 ) ( ON-TABLE ?auto_94869 ) ( ON ?auto_94870 ?auto_94869 ) ( ON ?auto_94871 ?auto_94870 ) ( ON ?auto_94872 ?auto_94871 ) ( ON ?auto_94873 ?auto_94872 ) ( ON ?auto_94874 ?auto_94873 ) ( not ( = ?auto_94869 ?auto_94870 ) ) ( not ( = ?auto_94869 ?auto_94871 ) ) ( not ( = ?auto_94869 ?auto_94872 ) ) ( not ( = ?auto_94869 ?auto_94873 ) ) ( not ( = ?auto_94869 ?auto_94874 ) ) ( not ( = ?auto_94869 ?auto_94875 ) ) ( not ( = ?auto_94870 ?auto_94871 ) ) ( not ( = ?auto_94870 ?auto_94872 ) ) ( not ( = ?auto_94870 ?auto_94873 ) ) ( not ( = ?auto_94870 ?auto_94874 ) ) ( not ( = ?auto_94870 ?auto_94875 ) ) ( not ( = ?auto_94871 ?auto_94872 ) ) ( not ( = ?auto_94871 ?auto_94873 ) ) ( not ( = ?auto_94871 ?auto_94874 ) ) ( not ( = ?auto_94871 ?auto_94875 ) ) ( not ( = ?auto_94872 ?auto_94873 ) ) ( not ( = ?auto_94872 ?auto_94874 ) ) ( not ( = ?auto_94872 ?auto_94875 ) ) ( not ( = ?auto_94873 ?auto_94874 ) ) ( not ( = ?auto_94873 ?auto_94875 ) ) ( not ( = ?auto_94874 ?auto_94875 ) ) ( ON ?auto_94875 ?auto_94876 ) ( CLEAR ?auto_94875 ) ( HAND-EMPTY ) ( not ( = ?auto_94869 ?auto_94876 ) ) ( not ( = ?auto_94870 ?auto_94876 ) ) ( not ( = ?auto_94871 ?auto_94876 ) ) ( not ( = ?auto_94872 ?auto_94876 ) ) ( not ( = ?auto_94873 ?auto_94876 ) ) ( not ( = ?auto_94874 ?auto_94876 ) ) ( not ( = ?auto_94875 ?auto_94876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94875 ?auto_94876 )
      ( MAKE-7PILE ?auto_94869 ?auto_94870 ?auto_94871 ?auto_94872 ?auto_94873 ?auto_94874 ?auto_94875 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94877 - BLOCK
      ?auto_94878 - BLOCK
      ?auto_94879 - BLOCK
      ?auto_94880 - BLOCK
      ?auto_94881 - BLOCK
      ?auto_94882 - BLOCK
      ?auto_94883 - BLOCK
    )
    :vars
    (
      ?auto_94884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94877 ) ( ON ?auto_94878 ?auto_94877 ) ( ON ?auto_94879 ?auto_94878 ) ( ON ?auto_94880 ?auto_94879 ) ( ON ?auto_94881 ?auto_94880 ) ( not ( = ?auto_94877 ?auto_94878 ) ) ( not ( = ?auto_94877 ?auto_94879 ) ) ( not ( = ?auto_94877 ?auto_94880 ) ) ( not ( = ?auto_94877 ?auto_94881 ) ) ( not ( = ?auto_94877 ?auto_94882 ) ) ( not ( = ?auto_94877 ?auto_94883 ) ) ( not ( = ?auto_94878 ?auto_94879 ) ) ( not ( = ?auto_94878 ?auto_94880 ) ) ( not ( = ?auto_94878 ?auto_94881 ) ) ( not ( = ?auto_94878 ?auto_94882 ) ) ( not ( = ?auto_94878 ?auto_94883 ) ) ( not ( = ?auto_94879 ?auto_94880 ) ) ( not ( = ?auto_94879 ?auto_94881 ) ) ( not ( = ?auto_94879 ?auto_94882 ) ) ( not ( = ?auto_94879 ?auto_94883 ) ) ( not ( = ?auto_94880 ?auto_94881 ) ) ( not ( = ?auto_94880 ?auto_94882 ) ) ( not ( = ?auto_94880 ?auto_94883 ) ) ( not ( = ?auto_94881 ?auto_94882 ) ) ( not ( = ?auto_94881 ?auto_94883 ) ) ( not ( = ?auto_94882 ?auto_94883 ) ) ( ON ?auto_94883 ?auto_94884 ) ( CLEAR ?auto_94883 ) ( not ( = ?auto_94877 ?auto_94884 ) ) ( not ( = ?auto_94878 ?auto_94884 ) ) ( not ( = ?auto_94879 ?auto_94884 ) ) ( not ( = ?auto_94880 ?auto_94884 ) ) ( not ( = ?auto_94881 ?auto_94884 ) ) ( not ( = ?auto_94882 ?auto_94884 ) ) ( not ( = ?auto_94883 ?auto_94884 ) ) ( HOLDING ?auto_94882 ) ( CLEAR ?auto_94881 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94877 ?auto_94878 ?auto_94879 ?auto_94880 ?auto_94881 ?auto_94882 )
      ( MAKE-7PILE ?auto_94877 ?auto_94878 ?auto_94879 ?auto_94880 ?auto_94881 ?auto_94882 ?auto_94883 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94885 - BLOCK
      ?auto_94886 - BLOCK
      ?auto_94887 - BLOCK
      ?auto_94888 - BLOCK
      ?auto_94889 - BLOCK
      ?auto_94890 - BLOCK
      ?auto_94891 - BLOCK
    )
    :vars
    (
      ?auto_94892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94885 ) ( ON ?auto_94886 ?auto_94885 ) ( ON ?auto_94887 ?auto_94886 ) ( ON ?auto_94888 ?auto_94887 ) ( ON ?auto_94889 ?auto_94888 ) ( not ( = ?auto_94885 ?auto_94886 ) ) ( not ( = ?auto_94885 ?auto_94887 ) ) ( not ( = ?auto_94885 ?auto_94888 ) ) ( not ( = ?auto_94885 ?auto_94889 ) ) ( not ( = ?auto_94885 ?auto_94890 ) ) ( not ( = ?auto_94885 ?auto_94891 ) ) ( not ( = ?auto_94886 ?auto_94887 ) ) ( not ( = ?auto_94886 ?auto_94888 ) ) ( not ( = ?auto_94886 ?auto_94889 ) ) ( not ( = ?auto_94886 ?auto_94890 ) ) ( not ( = ?auto_94886 ?auto_94891 ) ) ( not ( = ?auto_94887 ?auto_94888 ) ) ( not ( = ?auto_94887 ?auto_94889 ) ) ( not ( = ?auto_94887 ?auto_94890 ) ) ( not ( = ?auto_94887 ?auto_94891 ) ) ( not ( = ?auto_94888 ?auto_94889 ) ) ( not ( = ?auto_94888 ?auto_94890 ) ) ( not ( = ?auto_94888 ?auto_94891 ) ) ( not ( = ?auto_94889 ?auto_94890 ) ) ( not ( = ?auto_94889 ?auto_94891 ) ) ( not ( = ?auto_94890 ?auto_94891 ) ) ( ON ?auto_94891 ?auto_94892 ) ( not ( = ?auto_94885 ?auto_94892 ) ) ( not ( = ?auto_94886 ?auto_94892 ) ) ( not ( = ?auto_94887 ?auto_94892 ) ) ( not ( = ?auto_94888 ?auto_94892 ) ) ( not ( = ?auto_94889 ?auto_94892 ) ) ( not ( = ?auto_94890 ?auto_94892 ) ) ( not ( = ?auto_94891 ?auto_94892 ) ) ( CLEAR ?auto_94889 ) ( ON ?auto_94890 ?auto_94891 ) ( CLEAR ?auto_94890 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94892 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94892 ?auto_94891 )
      ( MAKE-7PILE ?auto_94885 ?auto_94886 ?auto_94887 ?auto_94888 ?auto_94889 ?auto_94890 ?auto_94891 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94893 - BLOCK
      ?auto_94894 - BLOCK
      ?auto_94895 - BLOCK
      ?auto_94896 - BLOCK
      ?auto_94897 - BLOCK
      ?auto_94898 - BLOCK
      ?auto_94899 - BLOCK
    )
    :vars
    (
      ?auto_94900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94893 ) ( ON ?auto_94894 ?auto_94893 ) ( ON ?auto_94895 ?auto_94894 ) ( ON ?auto_94896 ?auto_94895 ) ( not ( = ?auto_94893 ?auto_94894 ) ) ( not ( = ?auto_94893 ?auto_94895 ) ) ( not ( = ?auto_94893 ?auto_94896 ) ) ( not ( = ?auto_94893 ?auto_94897 ) ) ( not ( = ?auto_94893 ?auto_94898 ) ) ( not ( = ?auto_94893 ?auto_94899 ) ) ( not ( = ?auto_94894 ?auto_94895 ) ) ( not ( = ?auto_94894 ?auto_94896 ) ) ( not ( = ?auto_94894 ?auto_94897 ) ) ( not ( = ?auto_94894 ?auto_94898 ) ) ( not ( = ?auto_94894 ?auto_94899 ) ) ( not ( = ?auto_94895 ?auto_94896 ) ) ( not ( = ?auto_94895 ?auto_94897 ) ) ( not ( = ?auto_94895 ?auto_94898 ) ) ( not ( = ?auto_94895 ?auto_94899 ) ) ( not ( = ?auto_94896 ?auto_94897 ) ) ( not ( = ?auto_94896 ?auto_94898 ) ) ( not ( = ?auto_94896 ?auto_94899 ) ) ( not ( = ?auto_94897 ?auto_94898 ) ) ( not ( = ?auto_94897 ?auto_94899 ) ) ( not ( = ?auto_94898 ?auto_94899 ) ) ( ON ?auto_94899 ?auto_94900 ) ( not ( = ?auto_94893 ?auto_94900 ) ) ( not ( = ?auto_94894 ?auto_94900 ) ) ( not ( = ?auto_94895 ?auto_94900 ) ) ( not ( = ?auto_94896 ?auto_94900 ) ) ( not ( = ?auto_94897 ?auto_94900 ) ) ( not ( = ?auto_94898 ?auto_94900 ) ) ( not ( = ?auto_94899 ?auto_94900 ) ) ( ON ?auto_94898 ?auto_94899 ) ( CLEAR ?auto_94898 ) ( ON-TABLE ?auto_94900 ) ( HOLDING ?auto_94897 ) ( CLEAR ?auto_94896 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94893 ?auto_94894 ?auto_94895 ?auto_94896 ?auto_94897 )
      ( MAKE-7PILE ?auto_94893 ?auto_94894 ?auto_94895 ?auto_94896 ?auto_94897 ?auto_94898 ?auto_94899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94901 - BLOCK
      ?auto_94902 - BLOCK
      ?auto_94903 - BLOCK
      ?auto_94904 - BLOCK
      ?auto_94905 - BLOCK
      ?auto_94906 - BLOCK
      ?auto_94907 - BLOCK
    )
    :vars
    (
      ?auto_94908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94901 ) ( ON ?auto_94902 ?auto_94901 ) ( ON ?auto_94903 ?auto_94902 ) ( ON ?auto_94904 ?auto_94903 ) ( not ( = ?auto_94901 ?auto_94902 ) ) ( not ( = ?auto_94901 ?auto_94903 ) ) ( not ( = ?auto_94901 ?auto_94904 ) ) ( not ( = ?auto_94901 ?auto_94905 ) ) ( not ( = ?auto_94901 ?auto_94906 ) ) ( not ( = ?auto_94901 ?auto_94907 ) ) ( not ( = ?auto_94902 ?auto_94903 ) ) ( not ( = ?auto_94902 ?auto_94904 ) ) ( not ( = ?auto_94902 ?auto_94905 ) ) ( not ( = ?auto_94902 ?auto_94906 ) ) ( not ( = ?auto_94902 ?auto_94907 ) ) ( not ( = ?auto_94903 ?auto_94904 ) ) ( not ( = ?auto_94903 ?auto_94905 ) ) ( not ( = ?auto_94903 ?auto_94906 ) ) ( not ( = ?auto_94903 ?auto_94907 ) ) ( not ( = ?auto_94904 ?auto_94905 ) ) ( not ( = ?auto_94904 ?auto_94906 ) ) ( not ( = ?auto_94904 ?auto_94907 ) ) ( not ( = ?auto_94905 ?auto_94906 ) ) ( not ( = ?auto_94905 ?auto_94907 ) ) ( not ( = ?auto_94906 ?auto_94907 ) ) ( ON ?auto_94907 ?auto_94908 ) ( not ( = ?auto_94901 ?auto_94908 ) ) ( not ( = ?auto_94902 ?auto_94908 ) ) ( not ( = ?auto_94903 ?auto_94908 ) ) ( not ( = ?auto_94904 ?auto_94908 ) ) ( not ( = ?auto_94905 ?auto_94908 ) ) ( not ( = ?auto_94906 ?auto_94908 ) ) ( not ( = ?auto_94907 ?auto_94908 ) ) ( ON ?auto_94906 ?auto_94907 ) ( ON-TABLE ?auto_94908 ) ( CLEAR ?auto_94904 ) ( ON ?auto_94905 ?auto_94906 ) ( CLEAR ?auto_94905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94908 ?auto_94907 ?auto_94906 )
      ( MAKE-7PILE ?auto_94901 ?auto_94902 ?auto_94903 ?auto_94904 ?auto_94905 ?auto_94906 ?auto_94907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94909 - BLOCK
      ?auto_94910 - BLOCK
      ?auto_94911 - BLOCK
      ?auto_94912 - BLOCK
      ?auto_94913 - BLOCK
      ?auto_94914 - BLOCK
      ?auto_94915 - BLOCK
    )
    :vars
    (
      ?auto_94916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94909 ) ( ON ?auto_94910 ?auto_94909 ) ( ON ?auto_94911 ?auto_94910 ) ( not ( = ?auto_94909 ?auto_94910 ) ) ( not ( = ?auto_94909 ?auto_94911 ) ) ( not ( = ?auto_94909 ?auto_94912 ) ) ( not ( = ?auto_94909 ?auto_94913 ) ) ( not ( = ?auto_94909 ?auto_94914 ) ) ( not ( = ?auto_94909 ?auto_94915 ) ) ( not ( = ?auto_94910 ?auto_94911 ) ) ( not ( = ?auto_94910 ?auto_94912 ) ) ( not ( = ?auto_94910 ?auto_94913 ) ) ( not ( = ?auto_94910 ?auto_94914 ) ) ( not ( = ?auto_94910 ?auto_94915 ) ) ( not ( = ?auto_94911 ?auto_94912 ) ) ( not ( = ?auto_94911 ?auto_94913 ) ) ( not ( = ?auto_94911 ?auto_94914 ) ) ( not ( = ?auto_94911 ?auto_94915 ) ) ( not ( = ?auto_94912 ?auto_94913 ) ) ( not ( = ?auto_94912 ?auto_94914 ) ) ( not ( = ?auto_94912 ?auto_94915 ) ) ( not ( = ?auto_94913 ?auto_94914 ) ) ( not ( = ?auto_94913 ?auto_94915 ) ) ( not ( = ?auto_94914 ?auto_94915 ) ) ( ON ?auto_94915 ?auto_94916 ) ( not ( = ?auto_94909 ?auto_94916 ) ) ( not ( = ?auto_94910 ?auto_94916 ) ) ( not ( = ?auto_94911 ?auto_94916 ) ) ( not ( = ?auto_94912 ?auto_94916 ) ) ( not ( = ?auto_94913 ?auto_94916 ) ) ( not ( = ?auto_94914 ?auto_94916 ) ) ( not ( = ?auto_94915 ?auto_94916 ) ) ( ON ?auto_94914 ?auto_94915 ) ( ON-TABLE ?auto_94916 ) ( ON ?auto_94913 ?auto_94914 ) ( CLEAR ?auto_94913 ) ( HOLDING ?auto_94912 ) ( CLEAR ?auto_94911 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94909 ?auto_94910 ?auto_94911 ?auto_94912 )
      ( MAKE-7PILE ?auto_94909 ?auto_94910 ?auto_94911 ?auto_94912 ?auto_94913 ?auto_94914 ?auto_94915 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94917 - BLOCK
      ?auto_94918 - BLOCK
      ?auto_94919 - BLOCK
      ?auto_94920 - BLOCK
      ?auto_94921 - BLOCK
      ?auto_94922 - BLOCK
      ?auto_94923 - BLOCK
    )
    :vars
    (
      ?auto_94924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94917 ) ( ON ?auto_94918 ?auto_94917 ) ( ON ?auto_94919 ?auto_94918 ) ( not ( = ?auto_94917 ?auto_94918 ) ) ( not ( = ?auto_94917 ?auto_94919 ) ) ( not ( = ?auto_94917 ?auto_94920 ) ) ( not ( = ?auto_94917 ?auto_94921 ) ) ( not ( = ?auto_94917 ?auto_94922 ) ) ( not ( = ?auto_94917 ?auto_94923 ) ) ( not ( = ?auto_94918 ?auto_94919 ) ) ( not ( = ?auto_94918 ?auto_94920 ) ) ( not ( = ?auto_94918 ?auto_94921 ) ) ( not ( = ?auto_94918 ?auto_94922 ) ) ( not ( = ?auto_94918 ?auto_94923 ) ) ( not ( = ?auto_94919 ?auto_94920 ) ) ( not ( = ?auto_94919 ?auto_94921 ) ) ( not ( = ?auto_94919 ?auto_94922 ) ) ( not ( = ?auto_94919 ?auto_94923 ) ) ( not ( = ?auto_94920 ?auto_94921 ) ) ( not ( = ?auto_94920 ?auto_94922 ) ) ( not ( = ?auto_94920 ?auto_94923 ) ) ( not ( = ?auto_94921 ?auto_94922 ) ) ( not ( = ?auto_94921 ?auto_94923 ) ) ( not ( = ?auto_94922 ?auto_94923 ) ) ( ON ?auto_94923 ?auto_94924 ) ( not ( = ?auto_94917 ?auto_94924 ) ) ( not ( = ?auto_94918 ?auto_94924 ) ) ( not ( = ?auto_94919 ?auto_94924 ) ) ( not ( = ?auto_94920 ?auto_94924 ) ) ( not ( = ?auto_94921 ?auto_94924 ) ) ( not ( = ?auto_94922 ?auto_94924 ) ) ( not ( = ?auto_94923 ?auto_94924 ) ) ( ON ?auto_94922 ?auto_94923 ) ( ON-TABLE ?auto_94924 ) ( ON ?auto_94921 ?auto_94922 ) ( CLEAR ?auto_94919 ) ( ON ?auto_94920 ?auto_94921 ) ( CLEAR ?auto_94920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94924 ?auto_94923 ?auto_94922 ?auto_94921 )
      ( MAKE-7PILE ?auto_94917 ?auto_94918 ?auto_94919 ?auto_94920 ?auto_94921 ?auto_94922 ?auto_94923 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94925 - BLOCK
      ?auto_94926 - BLOCK
      ?auto_94927 - BLOCK
      ?auto_94928 - BLOCK
      ?auto_94929 - BLOCK
      ?auto_94930 - BLOCK
      ?auto_94931 - BLOCK
    )
    :vars
    (
      ?auto_94932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94925 ) ( ON ?auto_94926 ?auto_94925 ) ( not ( = ?auto_94925 ?auto_94926 ) ) ( not ( = ?auto_94925 ?auto_94927 ) ) ( not ( = ?auto_94925 ?auto_94928 ) ) ( not ( = ?auto_94925 ?auto_94929 ) ) ( not ( = ?auto_94925 ?auto_94930 ) ) ( not ( = ?auto_94925 ?auto_94931 ) ) ( not ( = ?auto_94926 ?auto_94927 ) ) ( not ( = ?auto_94926 ?auto_94928 ) ) ( not ( = ?auto_94926 ?auto_94929 ) ) ( not ( = ?auto_94926 ?auto_94930 ) ) ( not ( = ?auto_94926 ?auto_94931 ) ) ( not ( = ?auto_94927 ?auto_94928 ) ) ( not ( = ?auto_94927 ?auto_94929 ) ) ( not ( = ?auto_94927 ?auto_94930 ) ) ( not ( = ?auto_94927 ?auto_94931 ) ) ( not ( = ?auto_94928 ?auto_94929 ) ) ( not ( = ?auto_94928 ?auto_94930 ) ) ( not ( = ?auto_94928 ?auto_94931 ) ) ( not ( = ?auto_94929 ?auto_94930 ) ) ( not ( = ?auto_94929 ?auto_94931 ) ) ( not ( = ?auto_94930 ?auto_94931 ) ) ( ON ?auto_94931 ?auto_94932 ) ( not ( = ?auto_94925 ?auto_94932 ) ) ( not ( = ?auto_94926 ?auto_94932 ) ) ( not ( = ?auto_94927 ?auto_94932 ) ) ( not ( = ?auto_94928 ?auto_94932 ) ) ( not ( = ?auto_94929 ?auto_94932 ) ) ( not ( = ?auto_94930 ?auto_94932 ) ) ( not ( = ?auto_94931 ?auto_94932 ) ) ( ON ?auto_94930 ?auto_94931 ) ( ON-TABLE ?auto_94932 ) ( ON ?auto_94929 ?auto_94930 ) ( ON ?auto_94928 ?auto_94929 ) ( CLEAR ?auto_94928 ) ( HOLDING ?auto_94927 ) ( CLEAR ?auto_94926 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94925 ?auto_94926 ?auto_94927 )
      ( MAKE-7PILE ?auto_94925 ?auto_94926 ?auto_94927 ?auto_94928 ?auto_94929 ?auto_94930 ?auto_94931 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94933 - BLOCK
      ?auto_94934 - BLOCK
      ?auto_94935 - BLOCK
      ?auto_94936 - BLOCK
      ?auto_94937 - BLOCK
      ?auto_94938 - BLOCK
      ?auto_94939 - BLOCK
    )
    :vars
    (
      ?auto_94940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94933 ) ( ON ?auto_94934 ?auto_94933 ) ( not ( = ?auto_94933 ?auto_94934 ) ) ( not ( = ?auto_94933 ?auto_94935 ) ) ( not ( = ?auto_94933 ?auto_94936 ) ) ( not ( = ?auto_94933 ?auto_94937 ) ) ( not ( = ?auto_94933 ?auto_94938 ) ) ( not ( = ?auto_94933 ?auto_94939 ) ) ( not ( = ?auto_94934 ?auto_94935 ) ) ( not ( = ?auto_94934 ?auto_94936 ) ) ( not ( = ?auto_94934 ?auto_94937 ) ) ( not ( = ?auto_94934 ?auto_94938 ) ) ( not ( = ?auto_94934 ?auto_94939 ) ) ( not ( = ?auto_94935 ?auto_94936 ) ) ( not ( = ?auto_94935 ?auto_94937 ) ) ( not ( = ?auto_94935 ?auto_94938 ) ) ( not ( = ?auto_94935 ?auto_94939 ) ) ( not ( = ?auto_94936 ?auto_94937 ) ) ( not ( = ?auto_94936 ?auto_94938 ) ) ( not ( = ?auto_94936 ?auto_94939 ) ) ( not ( = ?auto_94937 ?auto_94938 ) ) ( not ( = ?auto_94937 ?auto_94939 ) ) ( not ( = ?auto_94938 ?auto_94939 ) ) ( ON ?auto_94939 ?auto_94940 ) ( not ( = ?auto_94933 ?auto_94940 ) ) ( not ( = ?auto_94934 ?auto_94940 ) ) ( not ( = ?auto_94935 ?auto_94940 ) ) ( not ( = ?auto_94936 ?auto_94940 ) ) ( not ( = ?auto_94937 ?auto_94940 ) ) ( not ( = ?auto_94938 ?auto_94940 ) ) ( not ( = ?auto_94939 ?auto_94940 ) ) ( ON ?auto_94938 ?auto_94939 ) ( ON-TABLE ?auto_94940 ) ( ON ?auto_94937 ?auto_94938 ) ( ON ?auto_94936 ?auto_94937 ) ( CLEAR ?auto_94934 ) ( ON ?auto_94935 ?auto_94936 ) ( CLEAR ?auto_94935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94940 ?auto_94939 ?auto_94938 ?auto_94937 ?auto_94936 )
      ( MAKE-7PILE ?auto_94933 ?auto_94934 ?auto_94935 ?auto_94936 ?auto_94937 ?auto_94938 ?auto_94939 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94941 - BLOCK
      ?auto_94942 - BLOCK
      ?auto_94943 - BLOCK
      ?auto_94944 - BLOCK
      ?auto_94945 - BLOCK
      ?auto_94946 - BLOCK
      ?auto_94947 - BLOCK
    )
    :vars
    (
      ?auto_94948 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94941 ) ( not ( = ?auto_94941 ?auto_94942 ) ) ( not ( = ?auto_94941 ?auto_94943 ) ) ( not ( = ?auto_94941 ?auto_94944 ) ) ( not ( = ?auto_94941 ?auto_94945 ) ) ( not ( = ?auto_94941 ?auto_94946 ) ) ( not ( = ?auto_94941 ?auto_94947 ) ) ( not ( = ?auto_94942 ?auto_94943 ) ) ( not ( = ?auto_94942 ?auto_94944 ) ) ( not ( = ?auto_94942 ?auto_94945 ) ) ( not ( = ?auto_94942 ?auto_94946 ) ) ( not ( = ?auto_94942 ?auto_94947 ) ) ( not ( = ?auto_94943 ?auto_94944 ) ) ( not ( = ?auto_94943 ?auto_94945 ) ) ( not ( = ?auto_94943 ?auto_94946 ) ) ( not ( = ?auto_94943 ?auto_94947 ) ) ( not ( = ?auto_94944 ?auto_94945 ) ) ( not ( = ?auto_94944 ?auto_94946 ) ) ( not ( = ?auto_94944 ?auto_94947 ) ) ( not ( = ?auto_94945 ?auto_94946 ) ) ( not ( = ?auto_94945 ?auto_94947 ) ) ( not ( = ?auto_94946 ?auto_94947 ) ) ( ON ?auto_94947 ?auto_94948 ) ( not ( = ?auto_94941 ?auto_94948 ) ) ( not ( = ?auto_94942 ?auto_94948 ) ) ( not ( = ?auto_94943 ?auto_94948 ) ) ( not ( = ?auto_94944 ?auto_94948 ) ) ( not ( = ?auto_94945 ?auto_94948 ) ) ( not ( = ?auto_94946 ?auto_94948 ) ) ( not ( = ?auto_94947 ?auto_94948 ) ) ( ON ?auto_94946 ?auto_94947 ) ( ON-TABLE ?auto_94948 ) ( ON ?auto_94945 ?auto_94946 ) ( ON ?auto_94944 ?auto_94945 ) ( ON ?auto_94943 ?auto_94944 ) ( CLEAR ?auto_94943 ) ( HOLDING ?auto_94942 ) ( CLEAR ?auto_94941 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94941 ?auto_94942 )
      ( MAKE-7PILE ?auto_94941 ?auto_94942 ?auto_94943 ?auto_94944 ?auto_94945 ?auto_94946 ?auto_94947 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94949 - BLOCK
      ?auto_94950 - BLOCK
      ?auto_94951 - BLOCK
      ?auto_94952 - BLOCK
      ?auto_94953 - BLOCK
      ?auto_94954 - BLOCK
      ?auto_94955 - BLOCK
    )
    :vars
    (
      ?auto_94956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94949 ) ( not ( = ?auto_94949 ?auto_94950 ) ) ( not ( = ?auto_94949 ?auto_94951 ) ) ( not ( = ?auto_94949 ?auto_94952 ) ) ( not ( = ?auto_94949 ?auto_94953 ) ) ( not ( = ?auto_94949 ?auto_94954 ) ) ( not ( = ?auto_94949 ?auto_94955 ) ) ( not ( = ?auto_94950 ?auto_94951 ) ) ( not ( = ?auto_94950 ?auto_94952 ) ) ( not ( = ?auto_94950 ?auto_94953 ) ) ( not ( = ?auto_94950 ?auto_94954 ) ) ( not ( = ?auto_94950 ?auto_94955 ) ) ( not ( = ?auto_94951 ?auto_94952 ) ) ( not ( = ?auto_94951 ?auto_94953 ) ) ( not ( = ?auto_94951 ?auto_94954 ) ) ( not ( = ?auto_94951 ?auto_94955 ) ) ( not ( = ?auto_94952 ?auto_94953 ) ) ( not ( = ?auto_94952 ?auto_94954 ) ) ( not ( = ?auto_94952 ?auto_94955 ) ) ( not ( = ?auto_94953 ?auto_94954 ) ) ( not ( = ?auto_94953 ?auto_94955 ) ) ( not ( = ?auto_94954 ?auto_94955 ) ) ( ON ?auto_94955 ?auto_94956 ) ( not ( = ?auto_94949 ?auto_94956 ) ) ( not ( = ?auto_94950 ?auto_94956 ) ) ( not ( = ?auto_94951 ?auto_94956 ) ) ( not ( = ?auto_94952 ?auto_94956 ) ) ( not ( = ?auto_94953 ?auto_94956 ) ) ( not ( = ?auto_94954 ?auto_94956 ) ) ( not ( = ?auto_94955 ?auto_94956 ) ) ( ON ?auto_94954 ?auto_94955 ) ( ON-TABLE ?auto_94956 ) ( ON ?auto_94953 ?auto_94954 ) ( ON ?auto_94952 ?auto_94953 ) ( ON ?auto_94951 ?auto_94952 ) ( CLEAR ?auto_94949 ) ( ON ?auto_94950 ?auto_94951 ) ( CLEAR ?auto_94950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94956 ?auto_94955 ?auto_94954 ?auto_94953 ?auto_94952 ?auto_94951 )
      ( MAKE-7PILE ?auto_94949 ?auto_94950 ?auto_94951 ?auto_94952 ?auto_94953 ?auto_94954 ?auto_94955 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94957 - BLOCK
      ?auto_94958 - BLOCK
      ?auto_94959 - BLOCK
      ?auto_94960 - BLOCK
      ?auto_94961 - BLOCK
      ?auto_94962 - BLOCK
      ?auto_94963 - BLOCK
    )
    :vars
    (
      ?auto_94964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94957 ?auto_94958 ) ) ( not ( = ?auto_94957 ?auto_94959 ) ) ( not ( = ?auto_94957 ?auto_94960 ) ) ( not ( = ?auto_94957 ?auto_94961 ) ) ( not ( = ?auto_94957 ?auto_94962 ) ) ( not ( = ?auto_94957 ?auto_94963 ) ) ( not ( = ?auto_94958 ?auto_94959 ) ) ( not ( = ?auto_94958 ?auto_94960 ) ) ( not ( = ?auto_94958 ?auto_94961 ) ) ( not ( = ?auto_94958 ?auto_94962 ) ) ( not ( = ?auto_94958 ?auto_94963 ) ) ( not ( = ?auto_94959 ?auto_94960 ) ) ( not ( = ?auto_94959 ?auto_94961 ) ) ( not ( = ?auto_94959 ?auto_94962 ) ) ( not ( = ?auto_94959 ?auto_94963 ) ) ( not ( = ?auto_94960 ?auto_94961 ) ) ( not ( = ?auto_94960 ?auto_94962 ) ) ( not ( = ?auto_94960 ?auto_94963 ) ) ( not ( = ?auto_94961 ?auto_94962 ) ) ( not ( = ?auto_94961 ?auto_94963 ) ) ( not ( = ?auto_94962 ?auto_94963 ) ) ( ON ?auto_94963 ?auto_94964 ) ( not ( = ?auto_94957 ?auto_94964 ) ) ( not ( = ?auto_94958 ?auto_94964 ) ) ( not ( = ?auto_94959 ?auto_94964 ) ) ( not ( = ?auto_94960 ?auto_94964 ) ) ( not ( = ?auto_94961 ?auto_94964 ) ) ( not ( = ?auto_94962 ?auto_94964 ) ) ( not ( = ?auto_94963 ?auto_94964 ) ) ( ON ?auto_94962 ?auto_94963 ) ( ON-TABLE ?auto_94964 ) ( ON ?auto_94961 ?auto_94962 ) ( ON ?auto_94960 ?auto_94961 ) ( ON ?auto_94959 ?auto_94960 ) ( ON ?auto_94958 ?auto_94959 ) ( CLEAR ?auto_94958 ) ( HOLDING ?auto_94957 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94957 )
      ( MAKE-7PILE ?auto_94957 ?auto_94958 ?auto_94959 ?auto_94960 ?auto_94961 ?auto_94962 ?auto_94963 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94965 - BLOCK
      ?auto_94966 - BLOCK
      ?auto_94967 - BLOCK
      ?auto_94968 - BLOCK
      ?auto_94969 - BLOCK
      ?auto_94970 - BLOCK
      ?auto_94971 - BLOCK
    )
    :vars
    (
      ?auto_94972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94965 ?auto_94966 ) ) ( not ( = ?auto_94965 ?auto_94967 ) ) ( not ( = ?auto_94965 ?auto_94968 ) ) ( not ( = ?auto_94965 ?auto_94969 ) ) ( not ( = ?auto_94965 ?auto_94970 ) ) ( not ( = ?auto_94965 ?auto_94971 ) ) ( not ( = ?auto_94966 ?auto_94967 ) ) ( not ( = ?auto_94966 ?auto_94968 ) ) ( not ( = ?auto_94966 ?auto_94969 ) ) ( not ( = ?auto_94966 ?auto_94970 ) ) ( not ( = ?auto_94966 ?auto_94971 ) ) ( not ( = ?auto_94967 ?auto_94968 ) ) ( not ( = ?auto_94967 ?auto_94969 ) ) ( not ( = ?auto_94967 ?auto_94970 ) ) ( not ( = ?auto_94967 ?auto_94971 ) ) ( not ( = ?auto_94968 ?auto_94969 ) ) ( not ( = ?auto_94968 ?auto_94970 ) ) ( not ( = ?auto_94968 ?auto_94971 ) ) ( not ( = ?auto_94969 ?auto_94970 ) ) ( not ( = ?auto_94969 ?auto_94971 ) ) ( not ( = ?auto_94970 ?auto_94971 ) ) ( ON ?auto_94971 ?auto_94972 ) ( not ( = ?auto_94965 ?auto_94972 ) ) ( not ( = ?auto_94966 ?auto_94972 ) ) ( not ( = ?auto_94967 ?auto_94972 ) ) ( not ( = ?auto_94968 ?auto_94972 ) ) ( not ( = ?auto_94969 ?auto_94972 ) ) ( not ( = ?auto_94970 ?auto_94972 ) ) ( not ( = ?auto_94971 ?auto_94972 ) ) ( ON ?auto_94970 ?auto_94971 ) ( ON-TABLE ?auto_94972 ) ( ON ?auto_94969 ?auto_94970 ) ( ON ?auto_94968 ?auto_94969 ) ( ON ?auto_94967 ?auto_94968 ) ( ON ?auto_94966 ?auto_94967 ) ( ON ?auto_94965 ?auto_94966 ) ( CLEAR ?auto_94965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94972 ?auto_94971 ?auto_94970 ?auto_94969 ?auto_94968 ?auto_94967 ?auto_94966 )
      ( MAKE-7PILE ?auto_94965 ?auto_94966 ?auto_94967 ?auto_94968 ?auto_94969 ?auto_94970 ?auto_94971 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95079 - BLOCK
    )
    :vars
    (
      ?auto_95080 - BLOCK
      ?auto_95081 - BLOCK
      ?auto_95082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95079 ?auto_95080 ) ( CLEAR ?auto_95079 ) ( not ( = ?auto_95079 ?auto_95080 ) ) ( HOLDING ?auto_95081 ) ( CLEAR ?auto_95082 ) ( not ( = ?auto_95079 ?auto_95081 ) ) ( not ( = ?auto_95079 ?auto_95082 ) ) ( not ( = ?auto_95080 ?auto_95081 ) ) ( not ( = ?auto_95080 ?auto_95082 ) ) ( not ( = ?auto_95081 ?auto_95082 ) ) )
    :subtasks
    ( ( !STACK ?auto_95081 ?auto_95082 )
      ( MAKE-1PILE ?auto_95079 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95083 - BLOCK
    )
    :vars
    (
      ?auto_95084 - BLOCK
      ?auto_95086 - BLOCK
      ?auto_95085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95083 ?auto_95084 ) ( not ( = ?auto_95083 ?auto_95084 ) ) ( CLEAR ?auto_95086 ) ( not ( = ?auto_95083 ?auto_95085 ) ) ( not ( = ?auto_95083 ?auto_95086 ) ) ( not ( = ?auto_95084 ?auto_95085 ) ) ( not ( = ?auto_95084 ?auto_95086 ) ) ( not ( = ?auto_95085 ?auto_95086 ) ) ( ON ?auto_95085 ?auto_95083 ) ( CLEAR ?auto_95085 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95084 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95084 ?auto_95083 )
      ( MAKE-1PILE ?auto_95083 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95087 - BLOCK
    )
    :vars
    (
      ?auto_95088 - BLOCK
      ?auto_95089 - BLOCK
      ?auto_95090 - BLOCK
      ?auto_95092 - BLOCK
      ?auto_95093 - BLOCK
      ?auto_95094 - BLOCK
      ?auto_95091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95087 ?auto_95088 ) ( not ( = ?auto_95087 ?auto_95088 ) ) ( not ( = ?auto_95087 ?auto_95089 ) ) ( not ( = ?auto_95087 ?auto_95090 ) ) ( not ( = ?auto_95088 ?auto_95089 ) ) ( not ( = ?auto_95088 ?auto_95090 ) ) ( not ( = ?auto_95089 ?auto_95090 ) ) ( ON ?auto_95089 ?auto_95087 ) ( CLEAR ?auto_95089 ) ( ON-TABLE ?auto_95088 ) ( HOLDING ?auto_95090 ) ( CLEAR ?auto_95092 ) ( ON-TABLE ?auto_95093 ) ( ON ?auto_95094 ?auto_95093 ) ( ON ?auto_95091 ?auto_95094 ) ( ON ?auto_95092 ?auto_95091 ) ( not ( = ?auto_95093 ?auto_95094 ) ) ( not ( = ?auto_95093 ?auto_95091 ) ) ( not ( = ?auto_95093 ?auto_95092 ) ) ( not ( = ?auto_95093 ?auto_95090 ) ) ( not ( = ?auto_95094 ?auto_95091 ) ) ( not ( = ?auto_95094 ?auto_95092 ) ) ( not ( = ?auto_95094 ?auto_95090 ) ) ( not ( = ?auto_95091 ?auto_95092 ) ) ( not ( = ?auto_95091 ?auto_95090 ) ) ( not ( = ?auto_95092 ?auto_95090 ) ) ( not ( = ?auto_95087 ?auto_95092 ) ) ( not ( = ?auto_95087 ?auto_95093 ) ) ( not ( = ?auto_95087 ?auto_95094 ) ) ( not ( = ?auto_95087 ?auto_95091 ) ) ( not ( = ?auto_95088 ?auto_95092 ) ) ( not ( = ?auto_95088 ?auto_95093 ) ) ( not ( = ?auto_95088 ?auto_95094 ) ) ( not ( = ?auto_95088 ?auto_95091 ) ) ( not ( = ?auto_95089 ?auto_95092 ) ) ( not ( = ?auto_95089 ?auto_95093 ) ) ( not ( = ?auto_95089 ?auto_95094 ) ) ( not ( = ?auto_95089 ?auto_95091 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95093 ?auto_95094 ?auto_95091 ?auto_95092 ?auto_95090 )
      ( MAKE-1PILE ?auto_95087 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95095 - BLOCK
    )
    :vars
    (
      ?auto_95098 - BLOCK
      ?auto_95100 - BLOCK
      ?auto_95096 - BLOCK
      ?auto_95102 - BLOCK
      ?auto_95101 - BLOCK
      ?auto_95097 - BLOCK
      ?auto_95099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95095 ?auto_95098 ) ( not ( = ?auto_95095 ?auto_95098 ) ) ( not ( = ?auto_95095 ?auto_95100 ) ) ( not ( = ?auto_95095 ?auto_95096 ) ) ( not ( = ?auto_95098 ?auto_95100 ) ) ( not ( = ?auto_95098 ?auto_95096 ) ) ( not ( = ?auto_95100 ?auto_95096 ) ) ( ON ?auto_95100 ?auto_95095 ) ( ON-TABLE ?auto_95098 ) ( CLEAR ?auto_95102 ) ( ON-TABLE ?auto_95101 ) ( ON ?auto_95097 ?auto_95101 ) ( ON ?auto_95099 ?auto_95097 ) ( ON ?auto_95102 ?auto_95099 ) ( not ( = ?auto_95101 ?auto_95097 ) ) ( not ( = ?auto_95101 ?auto_95099 ) ) ( not ( = ?auto_95101 ?auto_95102 ) ) ( not ( = ?auto_95101 ?auto_95096 ) ) ( not ( = ?auto_95097 ?auto_95099 ) ) ( not ( = ?auto_95097 ?auto_95102 ) ) ( not ( = ?auto_95097 ?auto_95096 ) ) ( not ( = ?auto_95099 ?auto_95102 ) ) ( not ( = ?auto_95099 ?auto_95096 ) ) ( not ( = ?auto_95102 ?auto_95096 ) ) ( not ( = ?auto_95095 ?auto_95102 ) ) ( not ( = ?auto_95095 ?auto_95101 ) ) ( not ( = ?auto_95095 ?auto_95097 ) ) ( not ( = ?auto_95095 ?auto_95099 ) ) ( not ( = ?auto_95098 ?auto_95102 ) ) ( not ( = ?auto_95098 ?auto_95101 ) ) ( not ( = ?auto_95098 ?auto_95097 ) ) ( not ( = ?auto_95098 ?auto_95099 ) ) ( not ( = ?auto_95100 ?auto_95102 ) ) ( not ( = ?auto_95100 ?auto_95101 ) ) ( not ( = ?auto_95100 ?auto_95097 ) ) ( not ( = ?auto_95100 ?auto_95099 ) ) ( ON ?auto_95096 ?auto_95100 ) ( CLEAR ?auto_95096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95098 ?auto_95095 ?auto_95100 )
      ( MAKE-1PILE ?auto_95095 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95103 - BLOCK
    )
    :vars
    (
      ?auto_95105 - BLOCK
      ?auto_95108 - BLOCK
      ?auto_95107 - BLOCK
      ?auto_95110 - BLOCK
      ?auto_95106 - BLOCK
      ?auto_95109 - BLOCK
      ?auto_95104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95103 ?auto_95105 ) ( not ( = ?auto_95103 ?auto_95105 ) ) ( not ( = ?auto_95103 ?auto_95108 ) ) ( not ( = ?auto_95103 ?auto_95107 ) ) ( not ( = ?auto_95105 ?auto_95108 ) ) ( not ( = ?auto_95105 ?auto_95107 ) ) ( not ( = ?auto_95108 ?auto_95107 ) ) ( ON ?auto_95108 ?auto_95103 ) ( ON-TABLE ?auto_95105 ) ( ON-TABLE ?auto_95110 ) ( ON ?auto_95106 ?auto_95110 ) ( ON ?auto_95109 ?auto_95106 ) ( not ( = ?auto_95110 ?auto_95106 ) ) ( not ( = ?auto_95110 ?auto_95109 ) ) ( not ( = ?auto_95110 ?auto_95104 ) ) ( not ( = ?auto_95110 ?auto_95107 ) ) ( not ( = ?auto_95106 ?auto_95109 ) ) ( not ( = ?auto_95106 ?auto_95104 ) ) ( not ( = ?auto_95106 ?auto_95107 ) ) ( not ( = ?auto_95109 ?auto_95104 ) ) ( not ( = ?auto_95109 ?auto_95107 ) ) ( not ( = ?auto_95104 ?auto_95107 ) ) ( not ( = ?auto_95103 ?auto_95104 ) ) ( not ( = ?auto_95103 ?auto_95110 ) ) ( not ( = ?auto_95103 ?auto_95106 ) ) ( not ( = ?auto_95103 ?auto_95109 ) ) ( not ( = ?auto_95105 ?auto_95104 ) ) ( not ( = ?auto_95105 ?auto_95110 ) ) ( not ( = ?auto_95105 ?auto_95106 ) ) ( not ( = ?auto_95105 ?auto_95109 ) ) ( not ( = ?auto_95108 ?auto_95104 ) ) ( not ( = ?auto_95108 ?auto_95110 ) ) ( not ( = ?auto_95108 ?auto_95106 ) ) ( not ( = ?auto_95108 ?auto_95109 ) ) ( ON ?auto_95107 ?auto_95108 ) ( CLEAR ?auto_95107 ) ( HOLDING ?auto_95104 ) ( CLEAR ?auto_95109 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95110 ?auto_95106 ?auto_95109 ?auto_95104 )
      ( MAKE-1PILE ?auto_95103 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95111 - BLOCK
    )
    :vars
    (
      ?auto_95116 - BLOCK
      ?auto_95112 - BLOCK
      ?auto_95114 - BLOCK
      ?auto_95115 - BLOCK
      ?auto_95113 - BLOCK
      ?auto_95117 - BLOCK
      ?auto_95118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95111 ?auto_95116 ) ( not ( = ?auto_95111 ?auto_95116 ) ) ( not ( = ?auto_95111 ?auto_95112 ) ) ( not ( = ?auto_95111 ?auto_95114 ) ) ( not ( = ?auto_95116 ?auto_95112 ) ) ( not ( = ?auto_95116 ?auto_95114 ) ) ( not ( = ?auto_95112 ?auto_95114 ) ) ( ON ?auto_95112 ?auto_95111 ) ( ON-TABLE ?auto_95116 ) ( ON-TABLE ?auto_95115 ) ( ON ?auto_95113 ?auto_95115 ) ( ON ?auto_95117 ?auto_95113 ) ( not ( = ?auto_95115 ?auto_95113 ) ) ( not ( = ?auto_95115 ?auto_95117 ) ) ( not ( = ?auto_95115 ?auto_95118 ) ) ( not ( = ?auto_95115 ?auto_95114 ) ) ( not ( = ?auto_95113 ?auto_95117 ) ) ( not ( = ?auto_95113 ?auto_95118 ) ) ( not ( = ?auto_95113 ?auto_95114 ) ) ( not ( = ?auto_95117 ?auto_95118 ) ) ( not ( = ?auto_95117 ?auto_95114 ) ) ( not ( = ?auto_95118 ?auto_95114 ) ) ( not ( = ?auto_95111 ?auto_95118 ) ) ( not ( = ?auto_95111 ?auto_95115 ) ) ( not ( = ?auto_95111 ?auto_95113 ) ) ( not ( = ?auto_95111 ?auto_95117 ) ) ( not ( = ?auto_95116 ?auto_95118 ) ) ( not ( = ?auto_95116 ?auto_95115 ) ) ( not ( = ?auto_95116 ?auto_95113 ) ) ( not ( = ?auto_95116 ?auto_95117 ) ) ( not ( = ?auto_95112 ?auto_95118 ) ) ( not ( = ?auto_95112 ?auto_95115 ) ) ( not ( = ?auto_95112 ?auto_95113 ) ) ( not ( = ?auto_95112 ?auto_95117 ) ) ( ON ?auto_95114 ?auto_95112 ) ( CLEAR ?auto_95117 ) ( ON ?auto_95118 ?auto_95114 ) ( CLEAR ?auto_95118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95116 ?auto_95111 ?auto_95112 ?auto_95114 )
      ( MAKE-1PILE ?auto_95111 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95119 - BLOCK
    )
    :vars
    (
      ?auto_95125 - BLOCK
      ?auto_95124 - BLOCK
      ?auto_95120 - BLOCK
      ?auto_95122 - BLOCK
      ?auto_95121 - BLOCK
      ?auto_95126 - BLOCK
      ?auto_95123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95119 ?auto_95125 ) ( not ( = ?auto_95119 ?auto_95125 ) ) ( not ( = ?auto_95119 ?auto_95124 ) ) ( not ( = ?auto_95119 ?auto_95120 ) ) ( not ( = ?auto_95125 ?auto_95124 ) ) ( not ( = ?auto_95125 ?auto_95120 ) ) ( not ( = ?auto_95124 ?auto_95120 ) ) ( ON ?auto_95124 ?auto_95119 ) ( ON-TABLE ?auto_95125 ) ( ON-TABLE ?auto_95122 ) ( ON ?auto_95121 ?auto_95122 ) ( not ( = ?auto_95122 ?auto_95121 ) ) ( not ( = ?auto_95122 ?auto_95126 ) ) ( not ( = ?auto_95122 ?auto_95123 ) ) ( not ( = ?auto_95122 ?auto_95120 ) ) ( not ( = ?auto_95121 ?auto_95126 ) ) ( not ( = ?auto_95121 ?auto_95123 ) ) ( not ( = ?auto_95121 ?auto_95120 ) ) ( not ( = ?auto_95126 ?auto_95123 ) ) ( not ( = ?auto_95126 ?auto_95120 ) ) ( not ( = ?auto_95123 ?auto_95120 ) ) ( not ( = ?auto_95119 ?auto_95123 ) ) ( not ( = ?auto_95119 ?auto_95122 ) ) ( not ( = ?auto_95119 ?auto_95121 ) ) ( not ( = ?auto_95119 ?auto_95126 ) ) ( not ( = ?auto_95125 ?auto_95123 ) ) ( not ( = ?auto_95125 ?auto_95122 ) ) ( not ( = ?auto_95125 ?auto_95121 ) ) ( not ( = ?auto_95125 ?auto_95126 ) ) ( not ( = ?auto_95124 ?auto_95123 ) ) ( not ( = ?auto_95124 ?auto_95122 ) ) ( not ( = ?auto_95124 ?auto_95121 ) ) ( not ( = ?auto_95124 ?auto_95126 ) ) ( ON ?auto_95120 ?auto_95124 ) ( ON ?auto_95123 ?auto_95120 ) ( CLEAR ?auto_95123 ) ( HOLDING ?auto_95126 ) ( CLEAR ?auto_95121 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95122 ?auto_95121 ?auto_95126 )
      ( MAKE-1PILE ?auto_95119 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95127 - BLOCK
    )
    :vars
    (
      ?auto_95130 - BLOCK
      ?auto_95132 - BLOCK
      ?auto_95129 - BLOCK
      ?auto_95134 - BLOCK
      ?auto_95128 - BLOCK
      ?auto_95131 - BLOCK
      ?auto_95133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95127 ?auto_95130 ) ( not ( = ?auto_95127 ?auto_95130 ) ) ( not ( = ?auto_95127 ?auto_95132 ) ) ( not ( = ?auto_95127 ?auto_95129 ) ) ( not ( = ?auto_95130 ?auto_95132 ) ) ( not ( = ?auto_95130 ?auto_95129 ) ) ( not ( = ?auto_95132 ?auto_95129 ) ) ( ON ?auto_95132 ?auto_95127 ) ( ON-TABLE ?auto_95130 ) ( ON-TABLE ?auto_95134 ) ( ON ?auto_95128 ?auto_95134 ) ( not ( = ?auto_95134 ?auto_95128 ) ) ( not ( = ?auto_95134 ?auto_95131 ) ) ( not ( = ?auto_95134 ?auto_95133 ) ) ( not ( = ?auto_95134 ?auto_95129 ) ) ( not ( = ?auto_95128 ?auto_95131 ) ) ( not ( = ?auto_95128 ?auto_95133 ) ) ( not ( = ?auto_95128 ?auto_95129 ) ) ( not ( = ?auto_95131 ?auto_95133 ) ) ( not ( = ?auto_95131 ?auto_95129 ) ) ( not ( = ?auto_95133 ?auto_95129 ) ) ( not ( = ?auto_95127 ?auto_95133 ) ) ( not ( = ?auto_95127 ?auto_95134 ) ) ( not ( = ?auto_95127 ?auto_95128 ) ) ( not ( = ?auto_95127 ?auto_95131 ) ) ( not ( = ?auto_95130 ?auto_95133 ) ) ( not ( = ?auto_95130 ?auto_95134 ) ) ( not ( = ?auto_95130 ?auto_95128 ) ) ( not ( = ?auto_95130 ?auto_95131 ) ) ( not ( = ?auto_95132 ?auto_95133 ) ) ( not ( = ?auto_95132 ?auto_95134 ) ) ( not ( = ?auto_95132 ?auto_95128 ) ) ( not ( = ?auto_95132 ?auto_95131 ) ) ( ON ?auto_95129 ?auto_95132 ) ( ON ?auto_95133 ?auto_95129 ) ( CLEAR ?auto_95128 ) ( ON ?auto_95131 ?auto_95133 ) ( CLEAR ?auto_95131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95130 ?auto_95127 ?auto_95132 ?auto_95129 ?auto_95133 )
      ( MAKE-1PILE ?auto_95127 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95135 - BLOCK
    )
    :vars
    (
      ?auto_95142 - BLOCK
      ?auto_95138 - BLOCK
      ?auto_95141 - BLOCK
      ?auto_95137 - BLOCK
      ?auto_95139 - BLOCK
      ?auto_95136 - BLOCK
      ?auto_95140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95135 ?auto_95142 ) ( not ( = ?auto_95135 ?auto_95142 ) ) ( not ( = ?auto_95135 ?auto_95138 ) ) ( not ( = ?auto_95135 ?auto_95141 ) ) ( not ( = ?auto_95142 ?auto_95138 ) ) ( not ( = ?auto_95142 ?auto_95141 ) ) ( not ( = ?auto_95138 ?auto_95141 ) ) ( ON ?auto_95138 ?auto_95135 ) ( ON-TABLE ?auto_95142 ) ( ON-TABLE ?auto_95137 ) ( not ( = ?auto_95137 ?auto_95139 ) ) ( not ( = ?auto_95137 ?auto_95136 ) ) ( not ( = ?auto_95137 ?auto_95140 ) ) ( not ( = ?auto_95137 ?auto_95141 ) ) ( not ( = ?auto_95139 ?auto_95136 ) ) ( not ( = ?auto_95139 ?auto_95140 ) ) ( not ( = ?auto_95139 ?auto_95141 ) ) ( not ( = ?auto_95136 ?auto_95140 ) ) ( not ( = ?auto_95136 ?auto_95141 ) ) ( not ( = ?auto_95140 ?auto_95141 ) ) ( not ( = ?auto_95135 ?auto_95140 ) ) ( not ( = ?auto_95135 ?auto_95137 ) ) ( not ( = ?auto_95135 ?auto_95139 ) ) ( not ( = ?auto_95135 ?auto_95136 ) ) ( not ( = ?auto_95142 ?auto_95140 ) ) ( not ( = ?auto_95142 ?auto_95137 ) ) ( not ( = ?auto_95142 ?auto_95139 ) ) ( not ( = ?auto_95142 ?auto_95136 ) ) ( not ( = ?auto_95138 ?auto_95140 ) ) ( not ( = ?auto_95138 ?auto_95137 ) ) ( not ( = ?auto_95138 ?auto_95139 ) ) ( not ( = ?auto_95138 ?auto_95136 ) ) ( ON ?auto_95141 ?auto_95138 ) ( ON ?auto_95140 ?auto_95141 ) ( ON ?auto_95136 ?auto_95140 ) ( CLEAR ?auto_95136 ) ( HOLDING ?auto_95139 ) ( CLEAR ?auto_95137 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95137 ?auto_95139 )
      ( MAKE-1PILE ?auto_95135 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95143 - BLOCK
    )
    :vars
    (
      ?auto_95145 - BLOCK
      ?auto_95149 - BLOCK
      ?auto_95150 - BLOCK
      ?auto_95146 - BLOCK
      ?auto_95144 - BLOCK
      ?auto_95147 - BLOCK
      ?auto_95148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95143 ?auto_95145 ) ( not ( = ?auto_95143 ?auto_95145 ) ) ( not ( = ?auto_95143 ?auto_95149 ) ) ( not ( = ?auto_95143 ?auto_95150 ) ) ( not ( = ?auto_95145 ?auto_95149 ) ) ( not ( = ?auto_95145 ?auto_95150 ) ) ( not ( = ?auto_95149 ?auto_95150 ) ) ( ON ?auto_95149 ?auto_95143 ) ( ON-TABLE ?auto_95145 ) ( ON-TABLE ?auto_95146 ) ( not ( = ?auto_95146 ?auto_95144 ) ) ( not ( = ?auto_95146 ?auto_95147 ) ) ( not ( = ?auto_95146 ?auto_95148 ) ) ( not ( = ?auto_95146 ?auto_95150 ) ) ( not ( = ?auto_95144 ?auto_95147 ) ) ( not ( = ?auto_95144 ?auto_95148 ) ) ( not ( = ?auto_95144 ?auto_95150 ) ) ( not ( = ?auto_95147 ?auto_95148 ) ) ( not ( = ?auto_95147 ?auto_95150 ) ) ( not ( = ?auto_95148 ?auto_95150 ) ) ( not ( = ?auto_95143 ?auto_95148 ) ) ( not ( = ?auto_95143 ?auto_95146 ) ) ( not ( = ?auto_95143 ?auto_95144 ) ) ( not ( = ?auto_95143 ?auto_95147 ) ) ( not ( = ?auto_95145 ?auto_95148 ) ) ( not ( = ?auto_95145 ?auto_95146 ) ) ( not ( = ?auto_95145 ?auto_95144 ) ) ( not ( = ?auto_95145 ?auto_95147 ) ) ( not ( = ?auto_95149 ?auto_95148 ) ) ( not ( = ?auto_95149 ?auto_95146 ) ) ( not ( = ?auto_95149 ?auto_95144 ) ) ( not ( = ?auto_95149 ?auto_95147 ) ) ( ON ?auto_95150 ?auto_95149 ) ( ON ?auto_95148 ?auto_95150 ) ( ON ?auto_95147 ?auto_95148 ) ( CLEAR ?auto_95146 ) ( ON ?auto_95144 ?auto_95147 ) ( CLEAR ?auto_95144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95145 ?auto_95143 ?auto_95149 ?auto_95150 ?auto_95148 ?auto_95147 )
      ( MAKE-1PILE ?auto_95143 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95151 - BLOCK
    )
    :vars
    (
      ?auto_95155 - BLOCK
      ?auto_95156 - BLOCK
      ?auto_95153 - BLOCK
      ?auto_95154 - BLOCK
      ?auto_95157 - BLOCK
      ?auto_95158 - BLOCK
      ?auto_95152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95151 ?auto_95155 ) ( not ( = ?auto_95151 ?auto_95155 ) ) ( not ( = ?auto_95151 ?auto_95156 ) ) ( not ( = ?auto_95151 ?auto_95153 ) ) ( not ( = ?auto_95155 ?auto_95156 ) ) ( not ( = ?auto_95155 ?auto_95153 ) ) ( not ( = ?auto_95156 ?auto_95153 ) ) ( ON ?auto_95156 ?auto_95151 ) ( ON-TABLE ?auto_95155 ) ( not ( = ?auto_95154 ?auto_95157 ) ) ( not ( = ?auto_95154 ?auto_95158 ) ) ( not ( = ?auto_95154 ?auto_95152 ) ) ( not ( = ?auto_95154 ?auto_95153 ) ) ( not ( = ?auto_95157 ?auto_95158 ) ) ( not ( = ?auto_95157 ?auto_95152 ) ) ( not ( = ?auto_95157 ?auto_95153 ) ) ( not ( = ?auto_95158 ?auto_95152 ) ) ( not ( = ?auto_95158 ?auto_95153 ) ) ( not ( = ?auto_95152 ?auto_95153 ) ) ( not ( = ?auto_95151 ?auto_95152 ) ) ( not ( = ?auto_95151 ?auto_95154 ) ) ( not ( = ?auto_95151 ?auto_95157 ) ) ( not ( = ?auto_95151 ?auto_95158 ) ) ( not ( = ?auto_95155 ?auto_95152 ) ) ( not ( = ?auto_95155 ?auto_95154 ) ) ( not ( = ?auto_95155 ?auto_95157 ) ) ( not ( = ?auto_95155 ?auto_95158 ) ) ( not ( = ?auto_95156 ?auto_95152 ) ) ( not ( = ?auto_95156 ?auto_95154 ) ) ( not ( = ?auto_95156 ?auto_95157 ) ) ( not ( = ?auto_95156 ?auto_95158 ) ) ( ON ?auto_95153 ?auto_95156 ) ( ON ?auto_95152 ?auto_95153 ) ( ON ?auto_95158 ?auto_95152 ) ( ON ?auto_95157 ?auto_95158 ) ( CLEAR ?auto_95157 ) ( HOLDING ?auto_95154 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95154 )
      ( MAKE-1PILE ?auto_95151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95159 - BLOCK
    )
    :vars
    (
      ?auto_95161 - BLOCK
      ?auto_95164 - BLOCK
      ?auto_95166 - BLOCK
      ?auto_95165 - BLOCK
      ?auto_95163 - BLOCK
      ?auto_95160 - BLOCK
      ?auto_95162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95159 ?auto_95161 ) ( not ( = ?auto_95159 ?auto_95161 ) ) ( not ( = ?auto_95159 ?auto_95164 ) ) ( not ( = ?auto_95159 ?auto_95166 ) ) ( not ( = ?auto_95161 ?auto_95164 ) ) ( not ( = ?auto_95161 ?auto_95166 ) ) ( not ( = ?auto_95164 ?auto_95166 ) ) ( ON ?auto_95164 ?auto_95159 ) ( ON-TABLE ?auto_95161 ) ( not ( = ?auto_95165 ?auto_95163 ) ) ( not ( = ?auto_95165 ?auto_95160 ) ) ( not ( = ?auto_95165 ?auto_95162 ) ) ( not ( = ?auto_95165 ?auto_95166 ) ) ( not ( = ?auto_95163 ?auto_95160 ) ) ( not ( = ?auto_95163 ?auto_95162 ) ) ( not ( = ?auto_95163 ?auto_95166 ) ) ( not ( = ?auto_95160 ?auto_95162 ) ) ( not ( = ?auto_95160 ?auto_95166 ) ) ( not ( = ?auto_95162 ?auto_95166 ) ) ( not ( = ?auto_95159 ?auto_95162 ) ) ( not ( = ?auto_95159 ?auto_95165 ) ) ( not ( = ?auto_95159 ?auto_95163 ) ) ( not ( = ?auto_95159 ?auto_95160 ) ) ( not ( = ?auto_95161 ?auto_95162 ) ) ( not ( = ?auto_95161 ?auto_95165 ) ) ( not ( = ?auto_95161 ?auto_95163 ) ) ( not ( = ?auto_95161 ?auto_95160 ) ) ( not ( = ?auto_95164 ?auto_95162 ) ) ( not ( = ?auto_95164 ?auto_95165 ) ) ( not ( = ?auto_95164 ?auto_95163 ) ) ( not ( = ?auto_95164 ?auto_95160 ) ) ( ON ?auto_95166 ?auto_95164 ) ( ON ?auto_95162 ?auto_95166 ) ( ON ?auto_95160 ?auto_95162 ) ( ON ?auto_95163 ?auto_95160 ) ( ON ?auto_95165 ?auto_95163 ) ( CLEAR ?auto_95165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95161 ?auto_95159 ?auto_95164 ?auto_95166 ?auto_95162 ?auto_95160 ?auto_95163 )
      ( MAKE-1PILE ?auto_95159 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95178 - BLOCK
      ?auto_95179 - BLOCK
      ?auto_95180 - BLOCK
      ?auto_95181 - BLOCK
      ?auto_95182 - BLOCK
    )
    :vars
    (
      ?auto_95183 - BLOCK
      ?auto_95184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95183 ?auto_95182 ) ( CLEAR ?auto_95183 ) ( ON-TABLE ?auto_95178 ) ( ON ?auto_95179 ?auto_95178 ) ( ON ?auto_95180 ?auto_95179 ) ( ON ?auto_95181 ?auto_95180 ) ( ON ?auto_95182 ?auto_95181 ) ( not ( = ?auto_95178 ?auto_95179 ) ) ( not ( = ?auto_95178 ?auto_95180 ) ) ( not ( = ?auto_95178 ?auto_95181 ) ) ( not ( = ?auto_95178 ?auto_95182 ) ) ( not ( = ?auto_95178 ?auto_95183 ) ) ( not ( = ?auto_95179 ?auto_95180 ) ) ( not ( = ?auto_95179 ?auto_95181 ) ) ( not ( = ?auto_95179 ?auto_95182 ) ) ( not ( = ?auto_95179 ?auto_95183 ) ) ( not ( = ?auto_95180 ?auto_95181 ) ) ( not ( = ?auto_95180 ?auto_95182 ) ) ( not ( = ?auto_95180 ?auto_95183 ) ) ( not ( = ?auto_95181 ?auto_95182 ) ) ( not ( = ?auto_95181 ?auto_95183 ) ) ( not ( = ?auto_95182 ?auto_95183 ) ) ( HOLDING ?auto_95184 ) ( not ( = ?auto_95178 ?auto_95184 ) ) ( not ( = ?auto_95179 ?auto_95184 ) ) ( not ( = ?auto_95180 ?auto_95184 ) ) ( not ( = ?auto_95181 ?auto_95184 ) ) ( not ( = ?auto_95182 ?auto_95184 ) ) ( not ( = ?auto_95183 ?auto_95184 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_95184 )
      ( MAKE-5PILE ?auto_95178 ?auto_95179 ?auto_95180 ?auto_95181 ?auto_95182 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95275 - BLOCK
      ?auto_95276 - BLOCK
    )
    :vars
    (
      ?auto_95277 - BLOCK
      ?auto_95281 - BLOCK
      ?auto_95278 - BLOCK
      ?auto_95280 - BLOCK
      ?auto_95279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95275 ?auto_95276 ) ) ( ON ?auto_95276 ?auto_95277 ) ( not ( = ?auto_95275 ?auto_95277 ) ) ( not ( = ?auto_95276 ?auto_95277 ) ) ( ON ?auto_95275 ?auto_95276 ) ( CLEAR ?auto_95275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95281 ) ( ON ?auto_95278 ?auto_95281 ) ( ON ?auto_95280 ?auto_95278 ) ( ON ?auto_95279 ?auto_95280 ) ( ON ?auto_95277 ?auto_95279 ) ( not ( = ?auto_95281 ?auto_95278 ) ) ( not ( = ?auto_95281 ?auto_95280 ) ) ( not ( = ?auto_95281 ?auto_95279 ) ) ( not ( = ?auto_95281 ?auto_95277 ) ) ( not ( = ?auto_95281 ?auto_95276 ) ) ( not ( = ?auto_95281 ?auto_95275 ) ) ( not ( = ?auto_95278 ?auto_95280 ) ) ( not ( = ?auto_95278 ?auto_95279 ) ) ( not ( = ?auto_95278 ?auto_95277 ) ) ( not ( = ?auto_95278 ?auto_95276 ) ) ( not ( = ?auto_95278 ?auto_95275 ) ) ( not ( = ?auto_95280 ?auto_95279 ) ) ( not ( = ?auto_95280 ?auto_95277 ) ) ( not ( = ?auto_95280 ?auto_95276 ) ) ( not ( = ?auto_95280 ?auto_95275 ) ) ( not ( = ?auto_95279 ?auto_95277 ) ) ( not ( = ?auto_95279 ?auto_95276 ) ) ( not ( = ?auto_95279 ?auto_95275 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95281 ?auto_95278 ?auto_95280 ?auto_95279 ?auto_95277 ?auto_95276 )
      ( MAKE-2PILE ?auto_95275 ?auto_95276 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95284 - BLOCK
      ?auto_95285 - BLOCK
    )
    :vars
    (
      ?auto_95286 - BLOCK
      ?auto_95287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95284 ?auto_95285 ) ) ( ON ?auto_95285 ?auto_95286 ) ( CLEAR ?auto_95285 ) ( not ( = ?auto_95284 ?auto_95286 ) ) ( not ( = ?auto_95285 ?auto_95286 ) ) ( ON ?auto_95284 ?auto_95287 ) ( CLEAR ?auto_95284 ) ( HAND-EMPTY ) ( not ( = ?auto_95284 ?auto_95287 ) ) ( not ( = ?auto_95285 ?auto_95287 ) ) ( not ( = ?auto_95286 ?auto_95287 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95284 ?auto_95287 )
      ( MAKE-2PILE ?auto_95284 ?auto_95285 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95288 - BLOCK
      ?auto_95289 - BLOCK
    )
    :vars
    (
      ?auto_95290 - BLOCK
      ?auto_95291 - BLOCK
      ?auto_95294 - BLOCK
      ?auto_95295 - BLOCK
      ?auto_95293 - BLOCK
      ?auto_95292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95288 ?auto_95289 ) ) ( not ( = ?auto_95288 ?auto_95290 ) ) ( not ( = ?auto_95289 ?auto_95290 ) ) ( ON ?auto_95288 ?auto_95291 ) ( CLEAR ?auto_95288 ) ( not ( = ?auto_95288 ?auto_95291 ) ) ( not ( = ?auto_95289 ?auto_95291 ) ) ( not ( = ?auto_95290 ?auto_95291 ) ) ( HOLDING ?auto_95289 ) ( CLEAR ?auto_95290 ) ( ON-TABLE ?auto_95294 ) ( ON ?auto_95295 ?auto_95294 ) ( ON ?auto_95293 ?auto_95295 ) ( ON ?auto_95292 ?auto_95293 ) ( ON ?auto_95290 ?auto_95292 ) ( not ( = ?auto_95294 ?auto_95295 ) ) ( not ( = ?auto_95294 ?auto_95293 ) ) ( not ( = ?auto_95294 ?auto_95292 ) ) ( not ( = ?auto_95294 ?auto_95290 ) ) ( not ( = ?auto_95294 ?auto_95289 ) ) ( not ( = ?auto_95295 ?auto_95293 ) ) ( not ( = ?auto_95295 ?auto_95292 ) ) ( not ( = ?auto_95295 ?auto_95290 ) ) ( not ( = ?auto_95295 ?auto_95289 ) ) ( not ( = ?auto_95293 ?auto_95292 ) ) ( not ( = ?auto_95293 ?auto_95290 ) ) ( not ( = ?auto_95293 ?auto_95289 ) ) ( not ( = ?auto_95292 ?auto_95290 ) ) ( not ( = ?auto_95292 ?auto_95289 ) ) ( not ( = ?auto_95288 ?auto_95294 ) ) ( not ( = ?auto_95288 ?auto_95295 ) ) ( not ( = ?auto_95288 ?auto_95293 ) ) ( not ( = ?auto_95288 ?auto_95292 ) ) ( not ( = ?auto_95291 ?auto_95294 ) ) ( not ( = ?auto_95291 ?auto_95295 ) ) ( not ( = ?auto_95291 ?auto_95293 ) ) ( not ( = ?auto_95291 ?auto_95292 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95294 ?auto_95295 ?auto_95293 ?auto_95292 ?auto_95290 ?auto_95289 )
      ( MAKE-2PILE ?auto_95288 ?auto_95289 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95296 - BLOCK
      ?auto_95297 - BLOCK
    )
    :vars
    (
      ?auto_95303 - BLOCK
      ?auto_95300 - BLOCK
      ?auto_95301 - BLOCK
      ?auto_95299 - BLOCK
      ?auto_95302 - BLOCK
      ?auto_95298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95296 ?auto_95297 ) ) ( not ( = ?auto_95296 ?auto_95303 ) ) ( not ( = ?auto_95297 ?auto_95303 ) ) ( ON ?auto_95296 ?auto_95300 ) ( not ( = ?auto_95296 ?auto_95300 ) ) ( not ( = ?auto_95297 ?auto_95300 ) ) ( not ( = ?auto_95303 ?auto_95300 ) ) ( CLEAR ?auto_95303 ) ( ON-TABLE ?auto_95301 ) ( ON ?auto_95299 ?auto_95301 ) ( ON ?auto_95302 ?auto_95299 ) ( ON ?auto_95298 ?auto_95302 ) ( ON ?auto_95303 ?auto_95298 ) ( not ( = ?auto_95301 ?auto_95299 ) ) ( not ( = ?auto_95301 ?auto_95302 ) ) ( not ( = ?auto_95301 ?auto_95298 ) ) ( not ( = ?auto_95301 ?auto_95303 ) ) ( not ( = ?auto_95301 ?auto_95297 ) ) ( not ( = ?auto_95299 ?auto_95302 ) ) ( not ( = ?auto_95299 ?auto_95298 ) ) ( not ( = ?auto_95299 ?auto_95303 ) ) ( not ( = ?auto_95299 ?auto_95297 ) ) ( not ( = ?auto_95302 ?auto_95298 ) ) ( not ( = ?auto_95302 ?auto_95303 ) ) ( not ( = ?auto_95302 ?auto_95297 ) ) ( not ( = ?auto_95298 ?auto_95303 ) ) ( not ( = ?auto_95298 ?auto_95297 ) ) ( not ( = ?auto_95296 ?auto_95301 ) ) ( not ( = ?auto_95296 ?auto_95299 ) ) ( not ( = ?auto_95296 ?auto_95302 ) ) ( not ( = ?auto_95296 ?auto_95298 ) ) ( not ( = ?auto_95300 ?auto_95301 ) ) ( not ( = ?auto_95300 ?auto_95299 ) ) ( not ( = ?auto_95300 ?auto_95302 ) ) ( not ( = ?auto_95300 ?auto_95298 ) ) ( ON ?auto_95297 ?auto_95296 ) ( CLEAR ?auto_95297 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95300 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95300 ?auto_95296 )
      ( MAKE-2PILE ?auto_95296 ?auto_95297 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95304 - BLOCK
      ?auto_95305 - BLOCK
    )
    :vars
    (
      ?auto_95306 - BLOCK
      ?auto_95309 - BLOCK
      ?auto_95307 - BLOCK
      ?auto_95311 - BLOCK
      ?auto_95310 - BLOCK
      ?auto_95308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95304 ?auto_95305 ) ) ( not ( = ?auto_95304 ?auto_95306 ) ) ( not ( = ?auto_95305 ?auto_95306 ) ) ( ON ?auto_95304 ?auto_95309 ) ( not ( = ?auto_95304 ?auto_95309 ) ) ( not ( = ?auto_95305 ?auto_95309 ) ) ( not ( = ?auto_95306 ?auto_95309 ) ) ( ON-TABLE ?auto_95307 ) ( ON ?auto_95311 ?auto_95307 ) ( ON ?auto_95310 ?auto_95311 ) ( ON ?auto_95308 ?auto_95310 ) ( not ( = ?auto_95307 ?auto_95311 ) ) ( not ( = ?auto_95307 ?auto_95310 ) ) ( not ( = ?auto_95307 ?auto_95308 ) ) ( not ( = ?auto_95307 ?auto_95306 ) ) ( not ( = ?auto_95307 ?auto_95305 ) ) ( not ( = ?auto_95311 ?auto_95310 ) ) ( not ( = ?auto_95311 ?auto_95308 ) ) ( not ( = ?auto_95311 ?auto_95306 ) ) ( not ( = ?auto_95311 ?auto_95305 ) ) ( not ( = ?auto_95310 ?auto_95308 ) ) ( not ( = ?auto_95310 ?auto_95306 ) ) ( not ( = ?auto_95310 ?auto_95305 ) ) ( not ( = ?auto_95308 ?auto_95306 ) ) ( not ( = ?auto_95308 ?auto_95305 ) ) ( not ( = ?auto_95304 ?auto_95307 ) ) ( not ( = ?auto_95304 ?auto_95311 ) ) ( not ( = ?auto_95304 ?auto_95310 ) ) ( not ( = ?auto_95304 ?auto_95308 ) ) ( not ( = ?auto_95309 ?auto_95307 ) ) ( not ( = ?auto_95309 ?auto_95311 ) ) ( not ( = ?auto_95309 ?auto_95310 ) ) ( not ( = ?auto_95309 ?auto_95308 ) ) ( ON ?auto_95305 ?auto_95304 ) ( CLEAR ?auto_95305 ) ( ON-TABLE ?auto_95309 ) ( HOLDING ?auto_95306 ) ( CLEAR ?auto_95308 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95307 ?auto_95311 ?auto_95310 ?auto_95308 ?auto_95306 )
      ( MAKE-2PILE ?auto_95304 ?auto_95305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95312 - BLOCK
      ?auto_95313 - BLOCK
    )
    :vars
    (
      ?auto_95318 - BLOCK
      ?auto_95314 - BLOCK
      ?auto_95315 - BLOCK
      ?auto_95319 - BLOCK
      ?auto_95316 - BLOCK
      ?auto_95317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95312 ?auto_95313 ) ) ( not ( = ?auto_95312 ?auto_95318 ) ) ( not ( = ?auto_95313 ?auto_95318 ) ) ( ON ?auto_95312 ?auto_95314 ) ( not ( = ?auto_95312 ?auto_95314 ) ) ( not ( = ?auto_95313 ?auto_95314 ) ) ( not ( = ?auto_95318 ?auto_95314 ) ) ( ON-TABLE ?auto_95315 ) ( ON ?auto_95319 ?auto_95315 ) ( ON ?auto_95316 ?auto_95319 ) ( ON ?auto_95317 ?auto_95316 ) ( not ( = ?auto_95315 ?auto_95319 ) ) ( not ( = ?auto_95315 ?auto_95316 ) ) ( not ( = ?auto_95315 ?auto_95317 ) ) ( not ( = ?auto_95315 ?auto_95318 ) ) ( not ( = ?auto_95315 ?auto_95313 ) ) ( not ( = ?auto_95319 ?auto_95316 ) ) ( not ( = ?auto_95319 ?auto_95317 ) ) ( not ( = ?auto_95319 ?auto_95318 ) ) ( not ( = ?auto_95319 ?auto_95313 ) ) ( not ( = ?auto_95316 ?auto_95317 ) ) ( not ( = ?auto_95316 ?auto_95318 ) ) ( not ( = ?auto_95316 ?auto_95313 ) ) ( not ( = ?auto_95317 ?auto_95318 ) ) ( not ( = ?auto_95317 ?auto_95313 ) ) ( not ( = ?auto_95312 ?auto_95315 ) ) ( not ( = ?auto_95312 ?auto_95319 ) ) ( not ( = ?auto_95312 ?auto_95316 ) ) ( not ( = ?auto_95312 ?auto_95317 ) ) ( not ( = ?auto_95314 ?auto_95315 ) ) ( not ( = ?auto_95314 ?auto_95319 ) ) ( not ( = ?auto_95314 ?auto_95316 ) ) ( not ( = ?auto_95314 ?auto_95317 ) ) ( ON ?auto_95313 ?auto_95312 ) ( ON-TABLE ?auto_95314 ) ( CLEAR ?auto_95317 ) ( ON ?auto_95318 ?auto_95313 ) ( CLEAR ?auto_95318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95314 ?auto_95312 ?auto_95313 )
      ( MAKE-2PILE ?auto_95312 ?auto_95313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95320 - BLOCK
      ?auto_95321 - BLOCK
    )
    :vars
    (
      ?auto_95327 - BLOCK
      ?auto_95323 - BLOCK
      ?auto_95322 - BLOCK
      ?auto_95325 - BLOCK
      ?auto_95326 - BLOCK
      ?auto_95324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95320 ?auto_95321 ) ) ( not ( = ?auto_95320 ?auto_95327 ) ) ( not ( = ?auto_95321 ?auto_95327 ) ) ( ON ?auto_95320 ?auto_95323 ) ( not ( = ?auto_95320 ?auto_95323 ) ) ( not ( = ?auto_95321 ?auto_95323 ) ) ( not ( = ?auto_95327 ?auto_95323 ) ) ( ON-TABLE ?auto_95322 ) ( ON ?auto_95325 ?auto_95322 ) ( ON ?auto_95326 ?auto_95325 ) ( not ( = ?auto_95322 ?auto_95325 ) ) ( not ( = ?auto_95322 ?auto_95326 ) ) ( not ( = ?auto_95322 ?auto_95324 ) ) ( not ( = ?auto_95322 ?auto_95327 ) ) ( not ( = ?auto_95322 ?auto_95321 ) ) ( not ( = ?auto_95325 ?auto_95326 ) ) ( not ( = ?auto_95325 ?auto_95324 ) ) ( not ( = ?auto_95325 ?auto_95327 ) ) ( not ( = ?auto_95325 ?auto_95321 ) ) ( not ( = ?auto_95326 ?auto_95324 ) ) ( not ( = ?auto_95326 ?auto_95327 ) ) ( not ( = ?auto_95326 ?auto_95321 ) ) ( not ( = ?auto_95324 ?auto_95327 ) ) ( not ( = ?auto_95324 ?auto_95321 ) ) ( not ( = ?auto_95320 ?auto_95322 ) ) ( not ( = ?auto_95320 ?auto_95325 ) ) ( not ( = ?auto_95320 ?auto_95326 ) ) ( not ( = ?auto_95320 ?auto_95324 ) ) ( not ( = ?auto_95323 ?auto_95322 ) ) ( not ( = ?auto_95323 ?auto_95325 ) ) ( not ( = ?auto_95323 ?auto_95326 ) ) ( not ( = ?auto_95323 ?auto_95324 ) ) ( ON ?auto_95321 ?auto_95320 ) ( ON-TABLE ?auto_95323 ) ( ON ?auto_95327 ?auto_95321 ) ( CLEAR ?auto_95327 ) ( HOLDING ?auto_95324 ) ( CLEAR ?auto_95326 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95322 ?auto_95325 ?auto_95326 ?auto_95324 )
      ( MAKE-2PILE ?auto_95320 ?auto_95321 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95328 - BLOCK
      ?auto_95329 - BLOCK
    )
    :vars
    (
      ?auto_95332 - BLOCK
      ?auto_95334 - BLOCK
      ?auto_95330 - BLOCK
      ?auto_95335 - BLOCK
      ?auto_95331 - BLOCK
      ?auto_95333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95328 ?auto_95329 ) ) ( not ( = ?auto_95328 ?auto_95332 ) ) ( not ( = ?auto_95329 ?auto_95332 ) ) ( ON ?auto_95328 ?auto_95334 ) ( not ( = ?auto_95328 ?auto_95334 ) ) ( not ( = ?auto_95329 ?auto_95334 ) ) ( not ( = ?auto_95332 ?auto_95334 ) ) ( ON-TABLE ?auto_95330 ) ( ON ?auto_95335 ?auto_95330 ) ( ON ?auto_95331 ?auto_95335 ) ( not ( = ?auto_95330 ?auto_95335 ) ) ( not ( = ?auto_95330 ?auto_95331 ) ) ( not ( = ?auto_95330 ?auto_95333 ) ) ( not ( = ?auto_95330 ?auto_95332 ) ) ( not ( = ?auto_95330 ?auto_95329 ) ) ( not ( = ?auto_95335 ?auto_95331 ) ) ( not ( = ?auto_95335 ?auto_95333 ) ) ( not ( = ?auto_95335 ?auto_95332 ) ) ( not ( = ?auto_95335 ?auto_95329 ) ) ( not ( = ?auto_95331 ?auto_95333 ) ) ( not ( = ?auto_95331 ?auto_95332 ) ) ( not ( = ?auto_95331 ?auto_95329 ) ) ( not ( = ?auto_95333 ?auto_95332 ) ) ( not ( = ?auto_95333 ?auto_95329 ) ) ( not ( = ?auto_95328 ?auto_95330 ) ) ( not ( = ?auto_95328 ?auto_95335 ) ) ( not ( = ?auto_95328 ?auto_95331 ) ) ( not ( = ?auto_95328 ?auto_95333 ) ) ( not ( = ?auto_95334 ?auto_95330 ) ) ( not ( = ?auto_95334 ?auto_95335 ) ) ( not ( = ?auto_95334 ?auto_95331 ) ) ( not ( = ?auto_95334 ?auto_95333 ) ) ( ON ?auto_95329 ?auto_95328 ) ( ON-TABLE ?auto_95334 ) ( ON ?auto_95332 ?auto_95329 ) ( CLEAR ?auto_95331 ) ( ON ?auto_95333 ?auto_95332 ) ( CLEAR ?auto_95333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95334 ?auto_95328 ?auto_95329 ?auto_95332 )
      ( MAKE-2PILE ?auto_95328 ?auto_95329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95336 - BLOCK
      ?auto_95337 - BLOCK
    )
    :vars
    (
      ?auto_95338 - BLOCK
      ?auto_95343 - BLOCK
      ?auto_95340 - BLOCK
      ?auto_95342 - BLOCK
      ?auto_95339 - BLOCK
      ?auto_95341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95336 ?auto_95337 ) ) ( not ( = ?auto_95336 ?auto_95338 ) ) ( not ( = ?auto_95337 ?auto_95338 ) ) ( ON ?auto_95336 ?auto_95343 ) ( not ( = ?auto_95336 ?auto_95343 ) ) ( not ( = ?auto_95337 ?auto_95343 ) ) ( not ( = ?auto_95338 ?auto_95343 ) ) ( ON-TABLE ?auto_95340 ) ( ON ?auto_95342 ?auto_95340 ) ( not ( = ?auto_95340 ?auto_95342 ) ) ( not ( = ?auto_95340 ?auto_95339 ) ) ( not ( = ?auto_95340 ?auto_95341 ) ) ( not ( = ?auto_95340 ?auto_95338 ) ) ( not ( = ?auto_95340 ?auto_95337 ) ) ( not ( = ?auto_95342 ?auto_95339 ) ) ( not ( = ?auto_95342 ?auto_95341 ) ) ( not ( = ?auto_95342 ?auto_95338 ) ) ( not ( = ?auto_95342 ?auto_95337 ) ) ( not ( = ?auto_95339 ?auto_95341 ) ) ( not ( = ?auto_95339 ?auto_95338 ) ) ( not ( = ?auto_95339 ?auto_95337 ) ) ( not ( = ?auto_95341 ?auto_95338 ) ) ( not ( = ?auto_95341 ?auto_95337 ) ) ( not ( = ?auto_95336 ?auto_95340 ) ) ( not ( = ?auto_95336 ?auto_95342 ) ) ( not ( = ?auto_95336 ?auto_95339 ) ) ( not ( = ?auto_95336 ?auto_95341 ) ) ( not ( = ?auto_95343 ?auto_95340 ) ) ( not ( = ?auto_95343 ?auto_95342 ) ) ( not ( = ?auto_95343 ?auto_95339 ) ) ( not ( = ?auto_95343 ?auto_95341 ) ) ( ON ?auto_95337 ?auto_95336 ) ( ON-TABLE ?auto_95343 ) ( ON ?auto_95338 ?auto_95337 ) ( ON ?auto_95341 ?auto_95338 ) ( CLEAR ?auto_95341 ) ( HOLDING ?auto_95339 ) ( CLEAR ?auto_95342 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95340 ?auto_95342 ?auto_95339 )
      ( MAKE-2PILE ?auto_95336 ?auto_95337 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95344 - BLOCK
      ?auto_95345 - BLOCK
    )
    :vars
    (
      ?auto_95350 - BLOCK
      ?auto_95348 - BLOCK
      ?auto_95351 - BLOCK
      ?auto_95349 - BLOCK
      ?auto_95347 - BLOCK
      ?auto_95346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95344 ?auto_95345 ) ) ( not ( = ?auto_95344 ?auto_95350 ) ) ( not ( = ?auto_95345 ?auto_95350 ) ) ( ON ?auto_95344 ?auto_95348 ) ( not ( = ?auto_95344 ?auto_95348 ) ) ( not ( = ?auto_95345 ?auto_95348 ) ) ( not ( = ?auto_95350 ?auto_95348 ) ) ( ON-TABLE ?auto_95351 ) ( ON ?auto_95349 ?auto_95351 ) ( not ( = ?auto_95351 ?auto_95349 ) ) ( not ( = ?auto_95351 ?auto_95347 ) ) ( not ( = ?auto_95351 ?auto_95346 ) ) ( not ( = ?auto_95351 ?auto_95350 ) ) ( not ( = ?auto_95351 ?auto_95345 ) ) ( not ( = ?auto_95349 ?auto_95347 ) ) ( not ( = ?auto_95349 ?auto_95346 ) ) ( not ( = ?auto_95349 ?auto_95350 ) ) ( not ( = ?auto_95349 ?auto_95345 ) ) ( not ( = ?auto_95347 ?auto_95346 ) ) ( not ( = ?auto_95347 ?auto_95350 ) ) ( not ( = ?auto_95347 ?auto_95345 ) ) ( not ( = ?auto_95346 ?auto_95350 ) ) ( not ( = ?auto_95346 ?auto_95345 ) ) ( not ( = ?auto_95344 ?auto_95351 ) ) ( not ( = ?auto_95344 ?auto_95349 ) ) ( not ( = ?auto_95344 ?auto_95347 ) ) ( not ( = ?auto_95344 ?auto_95346 ) ) ( not ( = ?auto_95348 ?auto_95351 ) ) ( not ( = ?auto_95348 ?auto_95349 ) ) ( not ( = ?auto_95348 ?auto_95347 ) ) ( not ( = ?auto_95348 ?auto_95346 ) ) ( ON ?auto_95345 ?auto_95344 ) ( ON-TABLE ?auto_95348 ) ( ON ?auto_95350 ?auto_95345 ) ( ON ?auto_95346 ?auto_95350 ) ( CLEAR ?auto_95349 ) ( ON ?auto_95347 ?auto_95346 ) ( CLEAR ?auto_95347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95348 ?auto_95344 ?auto_95345 ?auto_95350 ?auto_95346 )
      ( MAKE-2PILE ?auto_95344 ?auto_95345 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95352 - BLOCK
      ?auto_95353 - BLOCK
    )
    :vars
    (
      ?auto_95359 - BLOCK
      ?auto_95354 - BLOCK
      ?auto_95358 - BLOCK
      ?auto_95357 - BLOCK
      ?auto_95356 - BLOCK
      ?auto_95355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95352 ?auto_95353 ) ) ( not ( = ?auto_95352 ?auto_95359 ) ) ( not ( = ?auto_95353 ?auto_95359 ) ) ( ON ?auto_95352 ?auto_95354 ) ( not ( = ?auto_95352 ?auto_95354 ) ) ( not ( = ?auto_95353 ?auto_95354 ) ) ( not ( = ?auto_95359 ?auto_95354 ) ) ( ON-TABLE ?auto_95358 ) ( not ( = ?auto_95358 ?auto_95357 ) ) ( not ( = ?auto_95358 ?auto_95356 ) ) ( not ( = ?auto_95358 ?auto_95355 ) ) ( not ( = ?auto_95358 ?auto_95359 ) ) ( not ( = ?auto_95358 ?auto_95353 ) ) ( not ( = ?auto_95357 ?auto_95356 ) ) ( not ( = ?auto_95357 ?auto_95355 ) ) ( not ( = ?auto_95357 ?auto_95359 ) ) ( not ( = ?auto_95357 ?auto_95353 ) ) ( not ( = ?auto_95356 ?auto_95355 ) ) ( not ( = ?auto_95356 ?auto_95359 ) ) ( not ( = ?auto_95356 ?auto_95353 ) ) ( not ( = ?auto_95355 ?auto_95359 ) ) ( not ( = ?auto_95355 ?auto_95353 ) ) ( not ( = ?auto_95352 ?auto_95358 ) ) ( not ( = ?auto_95352 ?auto_95357 ) ) ( not ( = ?auto_95352 ?auto_95356 ) ) ( not ( = ?auto_95352 ?auto_95355 ) ) ( not ( = ?auto_95354 ?auto_95358 ) ) ( not ( = ?auto_95354 ?auto_95357 ) ) ( not ( = ?auto_95354 ?auto_95356 ) ) ( not ( = ?auto_95354 ?auto_95355 ) ) ( ON ?auto_95353 ?auto_95352 ) ( ON-TABLE ?auto_95354 ) ( ON ?auto_95359 ?auto_95353 ) ( ON ?auto_95355 ?auto_95359 ) ( ON ?auto_95356 ?auto_95355 ) ( CLEAR ?auto_95356 ) ( HOLDING ?auto_95357 ) ( CLEAR ?auto_95358 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95358 ?auto_95357 )
      ( MAKE-2PILE ?auto_95352 ?auto_95353 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95360 - BLOCK
      ?auto_95361 - BLOCK
    )
    :vars
    (
      ?auto_95367 - BLOCK
      ?auto_95363 - BLOCK
      ?auto_95362 - BLOCK
      ?auto_95365 - BLOCK
      ?auto_95366 - BLOCK
      ?auto_95364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95360 ?auto_95361 ) ) ( not ( = ?auto_95360 ?auto_95367 ) ) ( not ( = ?auto_95361 ?auto_95367 ) ) ( ON ?auto_95360 ?auto_95363 ) ( not ( = ?auto_95360 ?auto_95363 ) ) ( not ( = ?auto_95361 ?auto_95363 ) ) ( not ( = ?auto_95367 ?auto_95363 ) ) ( ON-TABLE ?auto_95362 ) ( not ( = ?auto_95362 ?auto_95365 ) ) ( not ( = ?auto_95362 ?auto_95366 ) ) ( not ( = ?auto_95362 ?auto_95364 ) ) ( not ( = ?auto_95362 ?auto_95367 ) ) ( not ( = ?auto_95362 ?auto_95361 ) ) ( not ( = ?auto_95365 ?auto_95366 ) ) ( not ( = ?auto_95365 ?auto_95364 ) ) ( not ( = ?auto_95365 ?auto_95367 ) ) ( not ( = ?auto_95365 ?auto_95361 ) ) ( not ( = ?auto_95366 ?auto_95364 ) ) ( not ( = ?auto_95366 ?auto_95367 ) ) ( not ( = ?auto_95366 ?auto_95361 ) ) ( not ( = ?auto_95364 ?auto_95367 ) ) ( not ( = ?auto_95364 ?auto_95361 ) ) ( not ( = ?auto_95360 ?auto_95362 ) ) ( not ( = ?auto_95360 ?auto_95365 ) ) ( not ( = ?auto_95360 ?auto_95366 ) ) ( not ( = ?auto_95360 ?auto_95364 ) ) ( not ( = ?auto_95363 ?auto_95362 ) ) ( not ( = ?auto_95363 ?auto_95365 ) ) ( not ( = ?auto_95363 ?auto_95366 ) ) ( not ( = ?auto_95363 ?auto_95364 ) ) ( ON ?auto_95361 ?auto_95360 ) ( ON-TABLE ?auto_95363 ) ( ON ?auto_95367 ?auto_95361 ) ( ON ?auto_95364 ?auto_95367 ) ( ON ?auto_95366 ?auto_95364 ) ( CLEAR ?auto_95362 ) ( ON ?auto_95365 ?auto_95366 ) ( CLEAR ?auto_95365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95363 ?auto_95360 ?auto_95361 ?auto_95367 ?auto_95364 ?auto_95366 )
      ( MAKE-2PILE ?auto_95360 ?auto_95361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95368 - BLOCK
      ?auto_95369 - BLOCK
    )
    :vars
    (
      ?auto_95372 - BLOCK
      ?auto_95371 - BLOCK
      ?auto_95373 - BLOCK
      ?auto_95374 - BLOCK
      ?auto_95370 - BLOCK
      ?auto_95375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95368 ?auto_95369 ) ) ( not ( = ?auto_95368 ?auto_95372 ) ) ( not ( = ?auto_95369 ?auto_95372 ) ) ( ON ?auto_95368 ?auto_95371 ) ( not ( = ?auto_95368 ?auto_95371 ) ) ( not ( = ?auto_95369 ?auto_95371 ) ) ( not ( = ?auto_95372 ?auto_95371 ) ) ( not ( = ?auto_95373 ?auto_95374 ) ) ( not ( = ?auto_95373 ?auto_95370 ) ) ( not ( = ?auto_95373 ?auto_95375 ) ) ( not ( = ?auto_95373 ?auto_95372 ) ) ( not ( = ?auto_95373 ?auto_95369 ) ) ( not ( = ?auto_95374 ?auto_95370 ) ) ( not ( = ?auto_95374 ?auto_95375 ) ) ( not ( = ?auto_95374 ?auto_95372 ) ) ( not ( = ?auto_95374 ?auto_95369 ) ) ( not ( = ?auto_95370 ?auto_95375 ) ) ( not ( = ?auto_95370 ?auto_95372 ) ) ( not ( = ?auto_95370 ?auto_95369 ) ) ( not ( = ?auto_95375 ?auto_95372 ) ) ( not ( = ?auto_95375 ?auto_95369 ) ) ( not ( = ?auto_95368 ?auto_95373 ) ) ( not ( = ?auto_95368 ?auto_95374 ) ) ( not ( = ?auto_95368 ?auto_95370 ) ) ( not ( = ?auto_95368 ?auto_95375 ) ) ( not ( = ?auto_95371 ?auto_95373 ) ) ( not ( = ?auto_95371 ?auto_95374 ) ) ( not ( = ?auto_95371 ?auto_95370 ) ) ( not ( = ?auto_95371 ?auto_95375 ) ) ( ON ?auto_95369 ?auto_95368 ) ( ON-TABLE ?auto_95371 ) ( ON ?auto_95372 ?auto_95369 ) ( ON ?auto_95375 ?auto_95372 ) ( ON ?auto_95370 ?auto_95375 ) ( ON ?auto_95374 ?auto_95370 ) ( CLEAR ?auto_95374 ) ( HOLDING ?auto_95373 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95373 )
      ( MAKE-2PILE ?auto_95368 ?auto_95369 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95376 - BLOCK
      ?auto_95377 - BLOCK
    )
    :vars
    (
      ?auto_95379 - BLOCK
      ?auto_95382 - BLOCK
      ?auto_95381 - BLOCK
      ?auto_95378 - BLOCK
      ?auto_95383 - BLOCK
      ?auto_95380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95376 ?auto_95377 ) ) ( not ( = ?auto_95376 ?auto_95379 ) ) ( not ( = ?auto_95377 ?auto_95379 ) ) ( ON ?auto_95376 ?auto_95382 ) ( not ( = ?auto_95376 ?auto_95382 ) ) ( not ( = ?auto_95377 ?auto_95382 ) ) ( not ( = ?auto_95379 ?auto_95382 ) ) ( not ( = ?auto_95381 ?auto_95378 ) ) ( not ( = ?auto_95381 ?auto_95383 ) ) ( not ( = ?auto_95381 ?auto_95380 ) ) ( not ( = ?auto_95381 ?auto_95379 ) ) ( not ( = ?auto_95381 ?auto_95377 ) ) ( not ( = ?auto_95378 ?auto_95383 ) ) ( not ( = ?auto_95378 ?auto_95380 ) ) ( not ( = ?auto_95378 ?auto_95379 ) ) ( not ( = ?auto_95378 ?auto_95377 ) ) ( not ( = ?auto_95383 ?auto_95380 ) ) ( not ( = ?auto_95383 ?auto_95379 ) ) ( not ( = ?auto_95383 ?auto_95377 ) ) ( not ( = ?auto_95380 ?auto_95379 ) ) ( not ( = ?auto_95380 ?auto_95377 ) ) ( not ( = ?auto_95376 ?auto_95381 ) ) ( not ( = ?auto_95376 ?auto_95378 ) ) ( not ( = ?auto_95376 ?auto_95383 ) ) ( not ( = ?auto_95376 ?auto_95380 ) ) ( not ( = ?auto_95382 ?auto_95381 ) ) ( not ( = ?auto_95382 ?auto_95378 ) ) ( not ( = ?auto_95382 ?auto_95383 ) ) ( not ( = ?auto_95382 ?auto_95380 ) ) ( ON ?auto_95377 ?auto_95376 ) ( ON-TABLE ?auto_95382 ) ( ON ?auto_95379 ?auto_95377 ) ( ON ?auto_95380 ?auto_95379 ) ( ON ?auto_95383 ?auto_95380 ) ( ON ?auto_95378 ?auto_95383 ) ( ON ?auto_95381 ?auto_95378 ) ( CLEAR ?auto_95381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95382 ?auto_95376 ?auto_95377 ?auto_95379 ?auto_95380 ?auto_95383 ?auto_95378 )
      ( MAKE-2PILE ?auto_95376 ?auto_95377 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95407 - BLOCK
      ?auto_95408 - BLOCK
      ?auto_95409 - BLOCK
      ?auto_95410 - BLOCK
    )
    :vars
    (
      ?auto_95411 - BLOCK
      ?auto_95412 - BLOCK
      ?auto_95413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95411 ?auto_95410 ) ( ON-TABLE ?auto_95407 ) ( ON ?auto_95408 ?auto_95407 ) ( ON ?auto_95409 ?auto_95408 ) ( ON ?auto_95410 ?auto_95409 ) ( not ( = ?auto_95407 ?auto_95408 ) ) ( not ( = ?auto_95407 ?auto_95409 ) ) ( not ( = ?auto_95407 ?auto_95410 ) ) ( not ( = ?auto_95407 ?auto_95411 ) ) ( not ( = ?auto_95408 ?auto_95409 ) ) ( not ( = ?auto_95408 ?auto_95410 ) ) ( not ( = ?auto_95408 ?auto_95411 ) ) ( not ( = ?auto_95409 ?auto_95410 ) ) ( not ( = ?auto_95409 ?auto_95411 ) ) ( not ( = ?auto_95410 ?auto_95411 ) ) ( not ( = ?auto_95407 ?auto_95412 ) ) ( not ( = ?auto_95407 ?auto_95413 ) ) ( not ( = ?auto_95408 ?auto_95412 ) ) ( not ( = ?auto_95408 ?auto_95413 ) ) ( not ( = ?auto_95409 ?auto_95412 ) ) ( not ( = ?auto_95409 ?auto_95413 ) ) ( not ( = ?auto_95410 ?auto_95412 ) ) ( not ( = ?auto_95410 ?auto_95413 ) ) ( not ( = ?auto_95411 ?auto_95412 ) ) ( not ( = ?auto_95411 ?auto_95413 ) ) ( not ( = ?auto_95412 ?auto_95413 ) ) ( ON ?auto_95412 ?auto_95411 ) ( CLEAR ?auto_95412 ) ( HOLDING ?auto_95413 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95413 )
      ( MAKE-4PILE ?auto_95407 ?auto_95408 ?auto_95409 ?auto_95410 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95494 - BLOCK
      ?auto_95495 - BLOCK
      ?auto_95496 - BLOCK
    )
    :vars
    (
      ?auto_95497 - BLOCK
      ?auto_95498 - BLOCK
      ?auto_95500 - BLOCK
      ?auto_95499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95494 ) ( not ( = ?auto_95494 ?auto_95495 ) ) ( not ( = ?auto_95494 ?auto_95496 ) ) ( not ( = ?auto_95495 ?auto_95496 ) ) ( ON ?auto_95496 ?auto_95497 ) ( not ( = ?auto_95494 ?auto_95497 ) ) ( not ( = ?auto_95495 ?auto_95497 ) ) ( not ( = ?auto_95496 ?auto_95497 ) ) ( CLEAR ?auto_95494 ) ( ON ?auto_95495 ?auto_95496 ) ( CLEAR ?auto_95495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95498 ) ( ON ?auto_95500 ?auto_95498 ) ( ON ?auto_95499 ?auto_95500 ) ( ON ?auto_95497 ?auto_95499 ) ( not ( = ?auto_95498 ?auto_95500 ) ) ( not ( = ?auto_95498 ?auto_95499 ) ) ( not ( = ?auto_95498 ?auto_95497 ) ) ( not ( = ?auto_95498 ?auto_95496 ) ) ( not ( = ?auto_95498 ?auto_95495 ) ) ( not ( = ?auto_95500 ?auto_95499 ) ) ( not ( = ?auto_95500 ?auto_95497 ) ) ( not ( = ?auto_95500 ?auto_95496 ) ) ( not ( = ?auto_95500 ?auto_95495 ) ) ( not ( = ?auto_95499 ?auto_95497 ) ) ( not ( = ?auto_95499 ?auto_95496 ) ) ( not ( = ?auto_95499 ?auto_95495 ) ) ( not ( = ?auto_95494 ?auto_95498 ) ) ( not ( = ?auto_95494 ?auto_95500 ) ) ( not ( = ?auto_95494 ?auto_95499 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95498 ?auto_95500 ?auto_95499 ?auto_95497 ?auto_95496 )
      ( MAKE-3PILE ?auto_95494 ?auto_95495 ?auto_95496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95501 - BLOCK
      ?auto_95502 - BLOCK
      ?auto_95503 - BLOCK
    )
    :vars
    (
      ?auto_95507 - BLOCK
      ?auto_95504 - BLOCK
      ?auto_95506 - BLOCK
      ?auto_95505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95501 ?auto_95502 ) ) ( not ( = ?auto_95501 ?auto_95503 ) ) ( not ( = ?auto_95502 ?auto_95503 ) ) ( ON ?auto_95503 ?auto_95507 ) ( not ( = ?auto_95501 ?auto_95507 ) ) ( not ( = ?auto_95502 ?auto_95507 ) ) ( not ( = ?auto_95503 ?auto_95507 ) ) ( ON ?auto_95502 ?auto_95503 ) ( CLEAR ?auto_95502 ) ( ON-TABLE ?auto_95504 ) ( ON ?auto_95506 ?auto_95504 ) ( ON ?auto_95505 ?auto_95506 ) ( ON ?auto_95507 ?auto_95505 ) ( not ( = ?auto_95504 ?auto_95506 ) ) ( not ( = ?auto_95504 ?auto_95505 ) ) ( not ( = ?auto_95504 ?auto_95507 ) ) ( not ( = ?auto_95504 ?auto_95503 ) ) ( not ( = ?auto_95504 ?auto_95502 ) ) ( not ( = ?auto_95506 ?auto_95505 ) ) ( not ( = ?auto_95506 ?auto_95507 ) ) ( not ( = ?auto_95506 ?auto_95503 ) ) ( not ( = ?auto_95506 ?auto_95502 ) ) ( not ( = ?auto_95505 ?auto_95507 ) ) ( not ( = ?auto_95505 ?auto_95503 ) ) ( not ( = ?auto_95505 ?auto_95502 ) ) ( not ( = ?auto_95501 ?auto_95504 ) ) ( not ( = ?auto_95501 ?auto_95506 ) ) ( not ( = ?auto_95501 ?auto_95505 ) ) ( HOLDING ?auto_95501 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95501 )
      ( MAKE-3PILE ?auto_95501 ?auto_95502 ?auto_95503 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95508 - BLOCK
      ?auto_95509 - BLOCK
      ?auto_95510 - BLOCK
    )
    :vars
    (
      ?auto_95511 - BLOCK
      ?auto_95512 - BLOCK
      ?auto_95513 - BLOCK
      ?auto_95514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95508 ?auto_95509 ) ) ( not ( = ?auto_95508 ?auto_95510 ) ) ( not ( = ?auto_95509 ?auto_95510 ) ) ( ON ?auto_95510 ?auto_95511 ) ( not ( = ?auto_95508 ?auto_95511 ) ) ( not ( = ?auto_95509 ?auto_95511 ) ) ( not ( = ?auto_95510 ?auto_95511 ) ) ( ON ?auto_95509 ?auto_95510 ) ( ON-TABLE ?auto_95512 ) ( ON ?auto_95513 ?auto_95512 ) ( ON ?auto_95514 ?auto_95513 ) ( ON ?auto_95511 ?auto_95514 ) ( not ( = ?auto_95512 ?auto_95513 ) ) ( not ( = ?auto_95512 ?auto_95514 ) ) ( not ( = ?auto_95512 ?auto_95511 ) ) ( not ( = ?auto_95512 ?auto_95510 ) ) ( not ( = ?auto_95512 ?auto_95509 ) ) ( not ( = ?auto_95513 ?auto_95514 ) ) ( not ( = ?auto_95513 ?auto_95511 ) ) ( not ( = ?auto_95513 ?auto_95510 ) ) ( not ( = ?auto_95513 ?auto_95509 ) ) ( not ( = ?auto_95514 ?auto_95511 ) ) ( not ( = ?auto_95514 ?auto_95510 ) ) ( not ( = ?auto_95514 ?auto_95509 ) ) ( not ( = ?auto_95508 ?auto_95512 ) ) ( not ( = ?auto_95508 ?auto_95513 ) ) ( not ( = ?auto_95508 ?auto_95514 ) ) ( ON ?auto_95508 ?auto_95509 ) ( CLEAR ?auto_95508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95512 ?auto_95513 ?auto_95514 ?auto_95511 ?auto_95510 ?auto_95509 )
      ( MAKE-3PILE ?auto_95508 ?auto_95509 ?auto_95510 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95518 - BLOCK
      ?auto_95519 - BLOCK
      ?auto_95520 - BLOCK
    )
    :vars
    (
      ?auto_95523 - BLOCK
      ?auto_95521 - BLOCK
      ?auto_95522 - BLOCK
      ?auto_95524 - BLOCK
      ?auto_95525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95518 ?auto_95519 ) ) ( not ( = ?auto_95518 ?auto_95520 ) ) ( not ( = ?auto_95519 ?auto_95520 ) ) ( ON ?auto_95520 ?auto_95523 ) ( not ( = ?auto_95518 ?auto_95523 ) ) ( not ( = ?auto_95519 ?auto_95523 ) ) ( not ( = ?auto_95520 ?auto_95523 ) ) ( ON ?auto_95519 ?auto_95520 ) ( CLEAR ?auto_95519 ) ( ON-TABLE ?auto_95521 ) ( ON ?auto_95522 ?auto_95521 ) ( ON ?auto_95524 ?auto_95522 ) ( ON ?auto_95523 ?auto_95524 ) ( not ( = ?auto_95521 ?auto_95522 ) ) ( not ( = ?auto_95521 ?auto_95524 ) ) ( not ( = ?auto_95521 ?auto_95523 ) ) ( not ( = ?auto_95521 ?auto_95520 ) ) ( not ( = ?auto_95521 ?auto_95519 ) ) ( not ( = ?auto_95522 ?auto_95524 ) ) ( not ( = ?auto_95522 ?auto_95523 ) ) ( not ( = ?auto_95522 ?auto_95520 ) ) ( not ( = ?auto_95522 ?auto_95519 ) ) ( not ( = ?auto_95524 ?auto_95523 ) ) ( not ( = ?auto_95524 ?auto_95520 ) ) ( not ( = ?auto_95524 ?auto_95519 ) ) ( not ( = ?auto_95518 ?auto_95521 ) ) ( not ( = ?auto_95518 ?auto_95522 ) ) ( not ( = ?auto_95518 ?auto_95524 ) ) ( ON ?auto_95518 ?auto_95525 ) ( CLEAR ?auto_95518 ) ( HAND-EMPTY ) ( not ( = ?auto_95518 ?auto_95525 ) ) ( not ( = ?auto_95519 ?auto_95525 ) ) ( not ( = ?auto_95520 ?auto_95525 ) ) ( not ( = ?auto_95523 ?auto_95525 ) ) ( not ( = ?auto_95521 ?auto_95525 ) ) ( not ( = ?auto_95522 ?auto_95525 ) ) ( not ( = ?auto_95524 ?auto_95525 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95518 ?auto_95525 )
      ( MAKE-3PILE ?auto_95518 ?auto_95519 ?auto_95520 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95526 - BLOCK
      ?auto_95527 - BLOCK
      ?auto_95528 - BLOCK
    )
    :vars
    (
      ?auto_95531 - BLOCK
      ?auto_95532 - BLOCK
      ?auto_95533 - BLOCK
      ?auto_95529 - BLOCK
      ?auto_95530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95526 ?auto_95527 ) ) ( not ( = ?auto_95526 ?auto_95528 ) ) ( not ( = ?auto_95527 ?auto_95528 ) ) ( ON ?auto_95528 ?auto_95531 ) ( not ( = ?auto_95526 ?auto_95531 ) ) ( not ( = ?auto_95527 ?auto_95531 ) ) ( not ( = ?auto_95528 ?auto_95531 ) ) ( ON-TABLE ?auto_95532 ) ( ON ?auto_95533 ?auto_95532 ) ( ON ?auto_95529 ?auto_95533 ) ( ON ?auto_95531 ?auto_95529 ) ( not ( = ?auto_95532 ?auto_95533 ) ) ( not ( = ?auto_95532 ?auto_95529 ) ) ( not ( = ?auto_95532 ?auto_95531 ) ) ( not ( = ?auto_95532 ?auto_95528 ) ) ( not ( = ?auto_95532 ?auto_95527 ) ) ( not ( = ?auto_95533 ?auto_95529 ) ) ( not ( = ?auto_95533 ?auto_95531 ) ) ( not ( = ?auto_95533 ?auto_95528 ) ) ( not ( = ?auto_95533 ?auto_95527 ) ) ( not ( = ?auto_95529 ?auto_95531 ) ) ( not ( = ?auto_95529 ?auto_95528 ) ) ( not ( = ?auto_95529 ?auto_95527 ) ) ( not ( = ?auto_95526 ?auto_95532 ) ) ( not ( = ?auto_95526 ?auto_95533 ) ) ( not ( = ?auto_95526 ?auto_95529 ) ) ( ON ?auto_95526 ?auto_95530 ) ( CLEAR ?auto_95526 ) ( not ( = ?auto_95526 ?auto_95530 ) ) ( not ( = ?auto_95527 ?auto_95530 ) ) ( not ( = ?auto_95528 ?auto_95530 ) ) ( not ( = ?auto_95531 ?auto_95530 ) ) ( not ( = ?auto_95532 ?auto_95530 ) ) ( not ( = ?auto_95533 ?auto_95530 ) ) ( not ( = ?auto_95529 ?auto_95530 ) ) ( HOLDING ?auto_95527 ) ( CLEAR ?auto_95528 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95532 ?auto_95533 ?auto_95529 ?auto_95531 ?auto_95528 ?auto_95527 )
      ( MAKE-3PILE ?auto_95526 ?auto_95527 ?auto_95528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95534 - BLOCK
      ?auto_95535 - BLOCK
      ?auto_95536 - BLOCK
    )
    :vars
    (
      ?auto_95538 - BLOCK
      ?auto_95539 - BLOCK
      ?auto_95537 - BLOCK
      ?auto_95541 - BLOCK
      ?auto_95540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95534 ?auto_95535 ) ) ( not ( = ?auto_95534 ?auto_95536 ) ) ( not ( = ?auto_95535 ?auto_95536 ) ) ( ON ?auto_95536 ?auto_95538 ) ( not ( = ?auto_95534 ?auto_95538 ) ) ( not ( = ?auto_95535 ?auto_95538 ) ) ( not ( = ?auto_95536 ?auto_95538 ) ) ( ON-TABLE ?auto_95539 ) ( ON ?auto_95537 ?auto_95539 ) ( ON ?auto_95541 ?auto_95537 ) ( ON ?auto_95538 ?auto_95541 ) ( not ( = ?auto_95539 ?auto_95537 ) ) ( not ( = ?auto_95539 ?auto_95541 ) ) ( not ( = ?auto_95539 ?auto_95538 ) ) ( not ( = ?auto_95539 ?auto_95536 ) ) ( not ( = ?auto_95539 ?auto_95535 ) ) ( not ( = ?auto_95537 ?auto_95541 ) ) ( not ( = ?auto_95537 ?auto_95538 ) ) ( not ( = ?auto_95537 ?auto_95536 ) ) ( not ( = ?auto_95537 ?auto_95535 ) ) ( not ( = ?auto_95541 ?auto_95538 ) ) ( not ( = ?auto_95541 ?auto_95536 ) ) ( not ( = ?auto_95541 ?auto_95535 ) ) ( not ( = ?auto_95534 ?auto_95539 ) ) ( not ( = ?auto_95534 ?auto_95537 ) ) ( not ( = ?auto_95534 ?auto_95541 ) ) ( ON ?auto_95534 ?auto_95540 ) ( not ( = ?auto_95534 ?auto_95540 ) ) ( not ( = ?auto_95535 ?auto_95540 ) ) ( not ( = ?auto_95536 ?auto_95540 ) ) ( not ( = ?auto_95538 ?auto_95540 ) ) ( not ( = ?auto_95539 ?auto_95540 ) ) ( not ( = ?auto_95537 ?auto_95540 ) ) ( not ( = ?auto_95541 ?auto_95540 ) ) ( CLEAR ?auto_95536 ) ( ON ?auto_95535 ?auto_95534 ) ( CLEAR ?auto_95535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95540 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95540 ?auto_95534 )
      ( MAKE-3PILE ?auto_95534 ?auto_95535 ?auto_95536 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95542 - BLOCK
      ?auto_95543 - BLOCK
      ?auto_95544 - BLOCK
    )
    :vars
    (
      ?auto_95547 - BLOCK
      ?auto_95545 - BLOCK
      ?auto_95546 - BLOCK
      ?auto_95549 - BLOCK
      ?auto_95548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95542 ?auto_95543 ) ) ( not ( = ?auto_95542 ?auto_95544 ) ) ( not ( = ?auto_95543 ?auto_95544 ) ) ( not ( = ?auto_95542 ?auto_95547 ) ) ( not ( = ?auto_95543 ?auto_95547 ) ) ( not ( = ?auto_95544 ?auto_95547 ) ) ( ON-TABLE ?auto_95545 ) ( ON ?auto_95546 ?auto_95545 ) ( ON ?auto_95549 ?auto_95546 ) ( ON ?auto_95547 ?auto_95549 ) ( not ( = ?auto_95545 ?auto_95546 ) ) ( not ( = ?auto_95545 ?auto_95549 ) ) ( not ( = ?auto_95545 ?auto_95547 ) ) ( not ( = ?auto_95545 ?auto_95544 ) ) ( not ( = ?auto_95545 ?auto_95543 ) ) ( not ( = ?auto_95546 ?auto_95549 ) ) ( not ( = ?auto_95546 ?auto_95547 ) ) ( not ( = ?auto_95546 ?auto_95544 ) ) ( not ( = ?auto_95546 ?auto_95543 ) ) ( not ( = ?auto_95549 ?auto_95547 ) ) ( not ( = ?auto_95549 ?auto_95544 ) ) ( not ( = ?auto_95549 ?auto_95543 ) ) ( not ( = ?auto_95542 ?auto_95545 ) ) ( not ( = ?auto_95542 ?auto_95546 ) ) ( not ( = ?auto_95542 ?auto_95549 ) ) ( ON ?auto_95542 ?auto_95548 ) ( not ( = ?auto_95542 ?auto_95548 ) ) ( not ( = ?auto_95543 ?auto_95548 ) ) ( not ( = ?auto_95544 ?auto_95548 ) ) ( not ( = ?auto_95547 ?auto_95548 ) ) ( not ( = ?auto_95545 ?auto_95548 ) ) ( not ( = ?auto_95546 ?auto_95548 ) ) ( not ( = ?auto_95549 ?auto_95548 ) ) ( ON ?auto_95543 ?auto_95542 ) ( CLEAR ?auto_95543 ) ( ON-TABLE ?auto_95548 ) ( HOLDING ?auto_95544 ) ( CLEAR ?auto_95547 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95545 ?auto_95546 ?auto_95549 ?auto_95547 ?auto_95544 )
      ( MAKE-3PILE ?auto_95542 ?auto_95543 ?auto_95544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95550 - BLOCK
      ?auto_95551 - BLOCK
      ?auto_95552 - BLOCK
    )
    :vars
    (
      ?auto_95553 - BLOCK
      ?auto_95557 - BLOCK
      ?auto_95554 - BLOCK
      ?auto_95555 - BLOCK
      ?auto_95556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95550 ?auto_95551 ) ) ( not ( = ?auto_95550 ?auto_95552 ) ) ( not ( = ?auto_95551 ?auto_95552 ) ) ( not ( = ?auto_95550 ?auto_95553 ) ) ( not ( = ?auto_95551 ?auto_95553 ) ) ( not ( = ?auto_95552 ?auto_95553 ) ) ( ON-TABLE ?auto_95557 ) ( ON ?auto_95554 ?auto_95557 ) ( ON ?auto_95555 ?auto_95554 ) ( ON ?auto_95553 ?auto_95555 ) ( not ( = ?auto_95557 ?auto_95554 ) ) ( not ( = ?auto_95557 ?auto_95555 ) ) ( not ( = ?auto_95557 ?auto_95553 ) ) ( not ( = ?auto_95557 ?auto_95552 ) ) ( not ( = ?auto_95557 ?auto_95551 ) ) ( not ( = ?auto_95554 ?auto_95555 ) ) ( not ( = ?auto_95554 ?auto_95553 ) ) ( not ( = ?auto_95554 ?auto_95552 ) ) ( not ( = ?auto_95554 ?auto_95551 ) ) ( not ( = ?auto_95555 ?auto_95553 ) ) ( not ( = ?auto_95555 ?auto_95552 ) ) ( not ( = ?auto_95555 ?auto_95551 ) ) ( not ( = ?auto_95550 ?auto_95557 ) ) ( not ( = ?auto_95550 ?auto_95554 ) ) ( not ( = ?auto_95550 ?auto_95555 ) ) ( ON ?auto_95550 ?auto_95556 ) ( not ( = ?auto_95550 ?auto_95556 ) ) ( not ( = ?auto_95551 ?auto_95556 ) ) ( not ( = ?auto_95552 ?auto_95556 ) ) ( not ( = ?auto_95553 ?auto_95556 ) ) ( not ( = ?auto_95557 ?auto_95556 ) ) ( not ( = ?auto_95554 ?auto_95556 ) ) ( not ( = ?auto_95555 ?auto_95556 ) ) ( ON ?auto_95551 ?auto_95550 ) ( ON-TABLE ?auto_95556 ) ( CLEAR ?auto_95553 ) ( ON ?auto_95552 ?auto_95551 ) ( CLEAR ?auto_95552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95556 ?auto_95550 ?auto_95551 )
      ( MAKE-3PILE ?auto_95550 ?auto_95551 ?auto_95552 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95558 - BLOCK
      ?auto_95559 - BLOCK
      ?auto_95560 - BLOCK
    )
    :vars
    (
      ?auto_95562 - BLOCK
      ?auto_95563 - BLOCK
      ?auto_95561 - BLOCK
      ?auto_95565 - BLOCK
      ?auto_95564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95558 ?auto_95559 ) ) ( not ( = ?auto_95558 ?auto_95560 ) ) ( not ( = ?auto_95559 ?auto_95560 ) ) ( not ( = ?auto_95558 ?auto_95562 ) ) ( not ( = ?auto_95559 ?auto_95562 ) ) ( not ( = ?auto_95560 ?auto_95562 ) ) ( ON-TABLE ?auto_95563 ) ( ON ?auto_95561 ?auto_95563 ) ( ON ?auto_95565 ?auto_95561 ) ( not ( = ?auto_95563 ?auto_95561 ) ) ( not ( = ?auto_95563 ?auto_95565 ) ) ( not ( = ?auto_95563 ?auto_95562 ) ) ( not ( = ?auto_95563 ?auto_95560 ) ) ( not ( = ?auto_95563 ?auto_95559 ) ) ( not ( = ?auto_95561 ?auto_95565 ) ) ( not ( = ?auto_95561 ?auto_95562 ) ) ( not ( = ?auto_95561 ?auto_95560 ) ) ( not ( = ?auto_95561 ?auto_95559 ) ) ( not ( = ?auto_95565 ?auto_95562 ) ) ( not ( = ?auto_95565 ?auto_95560 ) ) ( not ( = ?auto_95565 ?auto_95559 ) ) ( not ( = ?auto_95558 ?auto_95563 ) ) ( not ( = ?auto_95558 ?auto_95561 ) ) ( not ( = ?auto_95558 ?auto_95565 ) ) ( ON ?auto_95558 ?auto_95564 ) ( not ( = ?auto_95558 ?auto_95564 ) ) ( not ( = ?auto_95559 ?auto_95564 ) ) ( not ( = ?auto_95560 ?auto_95564 ) ) ( not ( = ?auto_95562 ?auto_95564 ) ) ( not ( = ?auto_95563 ?auto_95564 ) ) ( not ( = ?auto_95561 ?auto_95564 ) ) ( not ( = ?auto_95565 ?auto_95564 ) ) ( ON ?auto_95559 ?auto_95558 ) ( ON-TABLE ?auto_95564 ) ( ON ?auto_95560 ?auto_95559 ) ( CLEAR ?auto_95560 ) ( HOLDING ?auto_95562 ) ( CLEAR ?auto_95565 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95563 ?auto_95561 ?auto_95565 ?auto_95562 )
      ( MAKE-3PILE ?auto_95558 ?auto_95559 ?auto_95560 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95566 - BLOCK
      ?auto_95567 - BLOCK
      ?auto_95568 - BLOCK
    )
    :vars
    (
      ?auto_95570 - BLOCK
      ?auto_95571 - BLOCK
      ?auto_95572 - BLOCK
      ?auto_95573 - BLOCK
      ?auto_95569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95566 ?auto_95567 ) ) ( not ( = ?auto_95566 ?auto_95568 ) ) ( not ( = ?auto_95567 ?auto_95568 ) ) ( not ( = ?auto_95566 ?auto_95570 ) ) ( not ( = ?auto_95567 ?auto_95570 ) ) ( not ( = ?auto_95568 ?auto_95570 ) ) ( ON-TABLE ?auto_95571 ) ( ON ?auto_95572 ?auto_95571 ) ( ON ?auto_95573 ?auto_95572 ) ( not ( = ?auto_95571 ?auto_95572 ) ) ( not ( = ?auto_95571 ?auto_95573 ) ) ( not ( = ?auto_95571 ?auto_95570 ) ) ( not ( = ?auto_95571 ?auto_95568 ) ) ( not ( = ?auto_95571 ?auto_95567 ) ) ( not ( = ?auto_95572 ?auto_95573 ) ) ( not ( = ?auto_95572 ?auto_95570 ) ) ( not ( = ?auto_95572 ?auto_95568 ) ) ( not ( = ?auto_95572 ?auto_95567 ) ) ( not ( = ?auto_95573 ?auto_95570 ) ) ( not ( = ?auto_95573 ?auto_95568 ) ) ( not ( = ?auto_95573 ?auto_95567 ) ) ( not ( = ?auto_95566 ?auto_95571 ) ) ( not ( = ?auto_95566 ?auto_95572 ) ) ( not ( = ?auto_95566 ?auto_95573 ) ) ( ON ?auto_95566 ?auto_95569 ) ( not ( = ?auto_95566 ?auto_95569 ) ) ( not ( = ?auto_95567 ?auto_95569 ) ) ( not ( = ?auto_95568 ?auto_95569 ) ) ( not ( = ?auto_95570 ?auto_95569 ) ) ( not ( = ?auto_95571 ?auto_95569 ) ) ( not ( = ?auto_95572 ?auto_95569 ) ) ( not ( = ?auto_95573 ?auto_95569 ) ) ( ON ?auto_95567 ?auto_95566 ) ( ON-TABLE ?auto_95569 ) ( ON ?auto_95568 ?auto_95567 ) ( CLEAR ?auto_95573 ) ( ON ?auto_95570 ?auto_95568 ) ( CLEAR ?auto_95570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95569 ?auto_95566 ?auto_95567 ?auto_95568 )
      ( MAKE-3PILE ?auto_95566 ?auto_95567 ?auto_95568 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95574 - BLOCK
      ?auto_95575 - BLOCK
      ?auto_95576 - BLOCK
    )
    :vars
    (
      ?auto_95579 - BLOCK
      ?auto_95578 - BLOCK
      ?auto_95580 - BLOCK
      ?auto_95577 - BLOCK
      ?auto_95581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95574 ?auto_95575 ) ) ( not ( = ?auto_95574 ?auto_95576 ) ) ( not ( = ?auto_95575 ?auto_95576 ) ) ( not ( = ?auto_95574 ?auto_95579 ) ) ( not ( = ?auto_95575 ?auto_95579 ) ) ( not ( = ?auto_95576 ?auto_95579 ) ) ( ON-TABLE ?auto_95578 ) ( ON ?auto_95580 ?auto_95578 ) ( not ( = ?auto_95578 ?auto_95580 ) ) ( not ( = ?auto_95578 ?auto_95577 ) ) ( not ( = ?auto_95578 ?auto_95579 ) ) ( not ( = ?auto_95578 ?auto_95576 ) ) ( not ( = ?auto_95578 ?auto_95575 ) ) ( not ( = ?auto_95580 ?auto_95577 ) ) ( not ( = ?auto_95580 ?auto_95579 ) ) ( not ( = ?auto_95580 ?auto_95576 ) ) ( not ( = ?auto_95580 ?auto_95575 ) ) ( not ( = ?auto_95577 ?auto_95579 ) ) ( not ( = ?auto_95577 ?auto_95576 ) ) ( not ( = ?auto_95577 ?auto_95575 ) ) ( not ( = ?auto_95574 ?auto_95578 ) ) ( not ( = ?auto_95574 ?auto_95580 ) ) ( not ( = ?auto_95574 ?auto_95577 ) ) ( ON ?auto_95574 ?auto_95581 ) ( not ( = ?auto_95574 ?auto_95581 ) ) ( not ( = ?auto_95575 ?auto_95581 ) ) ( not ( = ?auto_95576 ?auto_95581 ) ) ( not ( = ?auto_95579 ?auto_95581 ) ) ( not ( = ?auto_95578 ?auto_95581 ) ) ( not ( = ?auto_95580 ?auto_95581 ) ) ( not ( = ?auto_95577 ?auto_95581 ) ) ( ON ?auto_95575 ?auto_95574 ) ( ON-TABLE ?auto_95581 ) ( ON ?auto_95576 ?auto_95575 ) ( ON ?auto_95579 ?auto_95576 ) ( CLEAR ?auto_95579 ) ( HOLDING ?auto_95577 ) ( CLEAR ?auto_95580 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95578 ?auto_95580 ?auto_95577 )
      ( MAKE-3PILE ?auto_95574 ?auto_95575 ?auto_95576 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95582 - BLOCK
      ?auto_95583 - BLOCK
      ?auto_95584 - BLOCK
    )
    :vars
    (
      ?auto_95586 - BLOCK
      ?auto_95587 - BLOCK
      ?auto_95589 - BLOCK
      ?auto_95588 - BLOCK
      ?auto_95585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95582 ?auto_95583 ) ) ( not ( = ?auto_95582 ?auto_95584 ) ) ( not ( = ?auto_95583 ?auto_95584 ) ) ( not ( = ?auto_95582 ?auto_95586 ) ) ( not ( = ?auto_95583 ?auto_95586 ) ) ( not ( = ?auto_95584 ?auto_95586 ) ) ( ON-TABLE ?auto_95587 ) ( ON ?auto_95589 ?auto_95587 ) ( not ( = ?auto_95587 ?auto_95589 ) ) ( not ( = ?auto_95587 ?auto_95588 ) ) ( not ( = ?auto_95587 ?auto_95586 ) ) ( not ( = ?auto_95587 ?auto_95584 ) ) ( not ( = ?auto_95587 ?auto_95583 ) ) ( not ( = ?auto_95589 ?auto_95588 ) ) ( not ( = ?auto_95589 ?auto_95586 ) ) ( not ( = ?auto_95589 ?auto_95584 ) ) ( not ( = ?auto_95589 ?auto_95583 ) ) ( not ( = ?auto_95588 ?auto_95586 ) ) ( not ( = ?auto_95588 ?auto_95584 ) ) ( not ( = ?auto_95588 ?auto_95583 ) ) ( not ( = ?auto_95582 ?auto_95587 ) ) ( not ( = ?auto_95582 ?auto_95589 ) ) ( not ( = ?auto_95582 ?auto_95588 ) ) ( ON ?auto_95582 ?auto_95585 ) ( not ( = ?auto_95582 ?auto_95585 ) ) ( not ( = ?auto_95583 ?auto_95585 ) ) ( not ( = ?auto_95584 ?auto_95585 ) ) ( not ( = ?auto_95586 ?auto_95585 ) ) ( not ( = ?auto_95587 ?auto_95585 ) ) ( not ( = ?auto_95589 ?auto_95585 ) ) ( not ( = ?auto_95588 ?auto_95585 ) ) ( ON ?auto_95583 ?auto_95582 ) ( ON-TABLE ?auto_95585 ) ( ON ?auto_95584 ?auto_95583 ) ( ON ?auto_95586 ?auto_95584 ) ( CLEAR ?auto_95589 ) ( ON ?auto_95588 ?auto_95586 ) ( CLEAR ?auto_95588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95585 ?auto_95582 ?auto_95583 ?auto_95584 ?auto_95586 )
      ( MAKE-3PILE ?auto_95582 ?auto_95583 ?auto_95584 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95590 - BLOCK
      ?auto_95591 - BLOCK
      ?auto_95592 - BLOCK
    )
    :vars
    (
      ?auto_95595 - BLOCK
      ?auto_95597 - BLOCK
      ?auto_95596 - BLOCK
      ?auto_95594 - BLOCK
      ?auto_95593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95590 ?auto_95591 ) ) ( not ( = ?auto_95590 ?auto_95592 ) ) ( not ( = ?auto_95591 ?auto_95592 ) ) ( not ( = ?auto_95590 ?auto_95595 ) ) ( not ( = ?auto_95591 ?auto_95595 ) ) ( not ( = ?auto_95592 ?auto_95595 ) ) ( ON-TABLE ?auto_95597 ) ( not ( = ?auto_95597 ?auto_95596 ) ) ( not ( = ?auto_95597 ?auto_95594 ) ) ( not ( = ?auto_95597 ?auto_95595 ) ) ( not ( = ?auto_95597 ?auto_95592 ) ) ( not ( = ?auto_95597 ?auto_95591 ) ) ( not ( = ?auto_95596 ?auto_95594 ) ) ( not ( = ?auto_95596 ?auto_95595 ) ) ( not ( = ?auto_95596 ?auto_95592 ) ) ( not ( = ?auto_95596 ?auto_95591 ) ) ( not ( = ?auto_95594 ?auto_95595 ) ) ( not ( = ?auto_95594 ?auto_95592 ) ) ( not ( = ?auto_95594 ?auto_95591 ) ) ( not ( = ?auto_95590 ?auto_95597 ) ) ( not ( = ?auto_95590 ?auto_95596 ) ) ( not ( = ?auto_95590 ?auto_95594 ) ) ( ON ?auto_95590 ?auto_95593 ) ( not ( = ?auto_95590 ?auto_95593 ) ) ( not ( = ?auto_95591 ?auto_95593 ) ) ( not ( = ?auto_95592 ?auto_95593 ) ) ( not ( = ?auto_95595 ?auto_95593 ) ) ( not ( = ?auto_95597 ?auto_95593 ) ) ( not ( = ?auto_95596 ?auto_95593 ) ) ( not ( = ?auto_95594 ?auto_95593 ) ) ( ON ?auto_95591 ?auto_95590 ) ( ON-TABLE ?auto_95593 ) ( ON ?auto_95592 ?auto_95591 ) ( ON ?auto_95595 ?auto_95592 ) ( ON ?auto_95594 ?auto_95595 ) ( CLEAR ?auto_95594 ) ( HOLDING ?auto_95596 ) ( CLEAR ?auto_95597 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95597 ?auto_95596 )
      ( MAKE-3PILE ?auto_95590 ?auto_95591 ?auto_95592 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95598 - BLOCK
      ?auto_95599 - BLOCK
      ?auto_95600 - BLOCK
    )
    :vars
    (
      ?auto_95602 - BLOCK
      ?auto_95603 - BLOCK
      ?auto_95605 - BLOCK
      ?auto_95604 - BLOCK
      ?auto_95601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95598 ?auto_95599 ) ) ( not ( = ?auto_95598 ?auto_95600 ) ) ( not ( = ?auto_95599 ?auto_95600 ) ) ( not ( = ?auto_95598 ?auto_95602 ) ) ( not ( = ?auto_95599 ?auto_95602 ) ) ( not ( = ?auto_95600 ?auto_95602 ) ) ( ON-TABLE ?auto_95603 ) ( not ( = ?auto_95603 ?auto_95605 ) ) ( not ( = ?auto_95603 ?auto_95604 ) ) ( not ( = ?auto_95603 ?auto_95602 ) ) ( not ( = ?auto_95603 ?auto_95600 ) ) ( not ( = ?auto_95603 ?auto_95599 ) ) ( not ( = ?auto_95605 ?auto_95604 ) ) ( not ( = ?auto_95605 ?auto_95602 ) ) ( not ( = ?auto_95605 ?auto_95600 ) ) ( not ( = ?auto_95605 ?auto_95599 ) ) ( not ( = ?auto_95604 ?auto_95602 ) ) ( not ( = ?auto_95604 ?auto_95600 ) ) ( not ( = ?auto_95604 ?auto_95599 ) ) ( not ( = ?auto_95598 ?auto_95603 ) ) ( not ( = ?auto_95598 ?auto_95605 ) ) ( not ( = ?auto_95598 ?auto_95604 ) ) ( ON ?auto_95598 ?auto_95601 ) ( not ( = ?auto_95598 ?auto_95601 ) ) ( not ( = ?auto_95599 ?auto_95601 ) ) ( not ( = ?auto_95600 ?auto_95601 ) ) ( not ( = ?auto_95602 ?auto_95601 ) ) ( not ( = ?auto_95603 ?auto_95601 ) ) ( not ( = ?auto_95605 ?auto_95601 ) ) ( not ( = ?auto_95604 ?auto_95601 ) ) ( ON ?auto_95599 ?auto_95598 ) ( ON-TABLE ?auto_95601 ) ( ON ?auto_95600 ?auto_95599 ) ( ON ?auto_95602 ?auto_95600 ) ( ON ?auto_95604 ?auto_95602 ) ( CLEAR ?auto_95603 ) ( ON ?auto_95605 ?auto_95604 ) ( CLEAR ?auto_95605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95601 ?auto_95598 ?auto_95599 ?auto_95600 ?auto_95602 ?auto_95604 )
      ( MAKE-3PILE ?auto_95598 ?auto_95599 ?auto_95600 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95606 - BLOCK
      ?auto_95607 - BLOCK
      ?auto_95608 - BLOCK
    )
    :vars
    (
      ?auto_95610 - BLOCK
      ?auto_95613 - BLOCK
      ?auto_95609 - BLOCK
      ?auto_95612 - BLOCK
      ?auto_95611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95606 ?auto_95607 ) ) ( not ( = ?auto_95606 ?auto_95608 ) ) ( not ( = ?auto_95607 ?auto_95608 ) ) ( not ( = ?auto_95606 ?auto_95610 ) ) ( not ( = ?auto_95607 ?auto_95610 ) ) ( not ( = ?auto_95608 ?auto_95610 ) ) ( not ( = ?auto_95613 ?auto_95609 ) ) ( not ( = ?auto_95613 ?auto_95612 ) ) ( not ( = ?auto_95613 ?auto_95610 ) ) ( not ( = ?auto_95613 ?auto_95608 ) ) ( not ( = ?auto_95613 ?auto_95607 ) ) ( not ( = ?auto_95609 ?auto_95612 ) ) ( not ( = ?auto_95609 ?auto_95610 ) ) ( not ( = ?auto_95609 ?auto_95608 ) ) ( not ( = ?auto_95609 ?auto_95607 ) ) ( not ( = ?auto_95612 ?auto_95610 ) ) ( not ( = ?auto_95612 ?auto_95608 ) ) ( not ( = ?auto_95612 ?auto_95607 ) ) ( not ( = ?auto_95606 ?auto_95613 ) ) ( not ( = ?auto_95606 ?auto_95609 ) ) ( not ( = ?auto_95606 ?auto_95612 ) ) ( ON ?auto_95606 ?auto_95611 ) ( not ( = ?auto_95606 ?auto_95611 ) ) ( not ( = ?auto_95607 ?auto_95611 ) ) ( not ( = ?auto_95608 ?auto_95611 ) ) ( not ( = ?auto_95610 ?auto_95611 ) ) ( not ( = ?auto_95613 ?auto_95611 ) ) ( not ( = ?auto_95609 ?auto_95611 ) ) ( not ( = ?auto_95612 ?auto_95611 ) ) ( ON ?auto_95607 ?auto_95606 ) ( ON-TABLE ?auto_95611 ) ( ON ?auto_95608 ?auto_95607 ) ( ON ?auto_95610 ?auto_95608 ) ( ON ?auto_95612 ?auto_95610 ) ( ON ?auto_95609 ?auto_95612 ) ( CLEAR ?auto_95609 ) ( HOLDING ?auto_95613 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95613 )
      ( MAKE-3PILE ?auto_95606 ?auto_95607 ?auto_95608 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95614 - BLOCK
      ?auto_95615 - BLOCK
      ?auto_95616 - BLOCK
    )
    :vars
    (
      ?auto_95617 - BLOCK
      ?auto_95620 - BLOCK
      ?auto_95618 - BLOCK
      ?auto_95619 - BLOCK
      ?auto_95621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95614 ?auto_95615 ) ) ( not ( = ?auto_95614 ?auto_95616 ) ) ( not ( = ?auto_95615 ?auto_95616 ) ) ( not ( = ?auto_95614 ?auto_95617 ) ) ( not ( = ?auto_95615 ?auto_95617 ) ) ( not ( = ?auto_95616 ?auto_95617 ) ) ( not ( = ?auto_95620 ?auto_95618 ) ) ( not ( = ?auto_95620 ?auto_95619 ) ) ( not ( = ?auto_95620 ?auto_95617 ) ) ( not ( = ?auto_95620 ?auto_95616 ) ) ( not ( = ?auto_95620 ?auto_95615 ) ) ( not ( = ?auto_95618 ?auto_95619 ) ) ( not ( = ?auto_95618 ?auto_95617 ) ) ( not ( = ?auto_95618 ?auto_95616 ) ) ( not ( = ?auto_95618 ?auto_95615 ) ) ( not ( = ?auto_95619 ?auto_95617 ) ) ( not ( = ?auto_95619 ?auto_95616 ) ) ( not ( = ?auto_95619 ?auto_95615 ) ) ( not ( = ?auto_95614 ?auto_95620 ) ) ( not ( = ?auto_95614 ?auto_95618 ) ) ( not ( = ?auto_95614 ?auto_95619 ) ) ( ON ?auto_95614 ?auto_95621 ) ( not ( = ?auto_95614 ?auto_95621 ) ) ( not ( = ?auto_95615 ?auto_95621 ) ) ( not ( = ?auto_95616 ?auto_95621 ) ) ( not ( = ?auto_95617 ?auto_95621 ) ) ( not ( = ?auto_95620 ?auto_95621 ) ) ( not ( = ?auto_95618 ?auto_95621 ) ) ( not ( = ?auto_95619 ?auto_95621 ) ) ( ON ?auto_95615 ?auto_95614 ) ( ON-TABLE ?auto_95621 ) ( ON ?auto_95616 ?auto_95615 ) ( ON ?auto_95617 ?auto_95616 ) ( ON ?auto_95619 ?auto_95617 ) ( ON ?auto_95618 ?auto_95619 ) ( ON ?auto_95620 ?auto_95618 ) ( CLEAR ?auto_95620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95621 ?auto_95614 ?auto_95615 ?auto_95616 ?auto_95617 ?auto_95619 ?auto_95618 )
      ( MAKE-3PILE ?auto_95614 ?auto_95615 ?auto_95616 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95641 - BLOCK
      ?auto_95642 - BLOCK
      ?auto_95643 - BLOCK
    )
    :vars
    (
      ?auto_95646 - BLOCK
      ?auto_95644 - BLOCK
      ?auto_95645 - BLOCK
      ?auto_95647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95646 ?auto_95643 ) ( ON-TABLE ?auto_95641 ) ( ON ?auto_95642 ?auto_95641 ) ( ON ?auto_95643 ?auto_95642 ) ( not ( = ?auto_95641 ?auto_95642 ) ) ( not ( = ?auto_95641 ?auto_95643 ) ) ( not ( = ?auto_95641 ?auto_95646 ) ) ( not ( = ?auto_95642 ?auto_95643 ) ) ( not ( = ?auto_95642 ?auto_95646 ) ) ( not ( = ?auto_95643 ?auto_95646 ) ) ( not ( = ?auto_95641 ?auto_95644 ) ) ( not ( = ?auto_95641 ?auto_95645 ) ) ( not ( = ?auto_95642 ?auto_95644 ) ) ( not ( = ?auto_95642 ?auto_95645 ) ) ( not ( = ?auto_95643 ?auto_95644 ) ) ( not ( = ?auto_95643 ?auto_95645 ) ) ( not ( = ?auto_95646 ?auto_95644 ) ) ( not ( = ?auto_95646 ?auto_95645 ) ) ( not ( = ?auto_95644 ?auto_95645 ) ) ( ON ?auto_95644 ?auto_95646 ) ( CLEAR ?auto_95644 ) ( HOLDING ?auto_95645 ) ( CLEAR ?auto_95647 ) ( ON-TABLE ?auto_95647 ) ( not ( = ?auto_95647 ?auto_95645 ) ) ( not ( = ?auto_95641 ?auto_95647 ) ) ( not ( = ?auto_95642 ?auto_95647 ) ) ( not ( = ?auto_95643 ?auto_95647 ) ) ( not ( = ?auto_95646 ?auto_95647 ) ) ( not ( = ?auto_95644 ?auto_95647 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95647 ?auto_95645 )
      ( MAKE-3PILE ?auto_95641 ?auto_95642 ?auto_95643 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95648 - BLOCK
      ?auto_95649 - BLOCK
      ?auto_95650 - BLOCK
    )
    :vars
    (
      ?auto_95651 - BLOCK
      ?auto_95653 - BLOCK
      ?auto_95652 - BLOCK
      ?auto_95654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95651 ?auto_95650 ) ( ON-TABLE ?auto_95648 ) ( ON ?auto_95649 ?auto_95648 ) ( ON ?auto_95650 ?auto_95649 ) ( not ( = ?auto_95648 ?auto_95649 ) ) ( not ( = ?auto_95648 ?auto_95650 ) ) ( not ( = ?auto_95648 ?auto_95651 ) ) ( not ( = ?auto_95649 ?auto_95650 ) ) ( not ( = ?auto_95649 ?auto_95651 ) ) ( not ( = ?auto_95650 ?auto_95651 ) ) ( not ( = ?auto_95648 ?auto_95653 ) ) ( not ( = ?auto_95648 ?auto_95652 ) ) ( not ( = ?auto_95649 ?auto_95653 ) ) ( not ( = ?auto_95649 ?auto_95652 ) ) ( not ( = ?auto_95650 ?auto_95653 ) ) ( not ( = ?auto_95650 ?auto_95652 ) ) ( not ( = ?auto_95651 ?auto_95653 ) ) ( not ( = ?auto_95651 ?auto_95652 ) ) ( not ( = ?auto_95653 ?auto_95652 ) ) ( ON ?auto_95653 ?auto_95651 ) ( CLEAR ?auto_95654 ) ( ON-TABLE ?auto_95654 ) ( not ( = ?auto_95654 ?auto_95652 ) ) ( not ( = ?auto_95648 ?auto_95654 ) ) ( not ( = ?auto_95649 ?auto_95654 ) ) ( not ( = ?auto_95650 ?auto_95654 ) ) ( not ( = ?auto_95651 ?auto_95654 ) ) ( not ( = ?auto_95653 ?auto_95654 ) ) ( ON ?auto_95652 ?auto_95653 ) ( CLEAR ?auto_95652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95648 ?auto_95649 ?auto_95650 ?auto_95651 ?auto_95653 )
      ( MAKE-3PILE ?auto_95648 ?auto_95649 ?auto_95650 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95655 - BLOCK
      ?auto_95656 - BLOCK
      ?auto_95657 - BLOCK
    )
    :vars
    (
      ?auto_95660 - BLOCK
      ?auto_95659 - BLOCK
      ?auto_95658 - BLOCK
      ?auto_95661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95660 ?auto_95657 ) ( ON-TABLE ?auto_95655 ) ( ON ?auto_95656 ?auto_95655 ) ( ON ?auto_95657 ?auto_95656 ) ( not ( = ?auto_95655 ?auto_95656 ) ) ( not ( = ?auto_95655 ?auto_95657 ) ) ( not ( = ?auto_95655 ?auto_95660 ) ) ( not ( = ?auto_95656 ?auto_95657 ) ) ( not ( = ?auto_95656 ?auto_95660 ) ) ( not ( = ?auto_95657 ?auto_95660 ) ) ( not ( = ?auto_95655 ?auto_95659 ) ) ( not ( = ?auto_95655 ?auto_95658 ) ) ( not ( = ?auto_95656 ?auto_95659 ) ) ( not ( = ?auto_95656 ?auto_95658 ) ) ( not ( = ?auto_95657 ?auto_95659 ) ) ( not ( = ?auto_95657 ?auto_95658 ) ) ( not ( = ?auto_95660 ?auto_95659 ) ) ( not ( = ?auto_95660 ?auto_95658 ) ) ( not ( = ?auto_95659 ?auto_95658 ) ) ( ON ?auto_95659 ?auto_95660 ) ( not ( = ?auto_95661 ?auto_95658 ) ) ( not ( = ?auto_95655 ?auto_95661 ) ) ( not ( = ?auto_95656 ?auto_95661 ) ) ( not ( = ?auto_95657 ?auto_95661 ) ) ( not ( = ?auto_95660 ?auto_95661 ) ) ( not ( = ?auto_95659 ?auto_95661 ) ) ( ON ?auto_95658 ?auto_95659 ) ( CLEAR ?auto_95658 ) ( HOLDING ?auto_95661 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95661 )
      ( MAKE-3PILE ?auto_95655 ?auto_95656 ?auto_95657 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95672 - BLOCK
      ?auto_95673 - BLOCK
      ?auto_95674 - BLOCK
    )
    :vars
    (
      ?auto_95677 - BLOCK
      ?auto_95675 - BLOCK
      ?auto_95676 - BLOCK
      ?auto_95678 - BLOCK
      ?auto_95679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95677 ?auto_95674 ) ( ON-TABLE ?auto_95672 ) ( ON ?auto_95673 ?auto_95672 ) ( ON ?auto_95674 ?auto_95673 ) ( not ( = ?auto_95672 ?auto_95673 ) ) ( not ( = ?auto_95672 ?auto_95674 ) ) ( not ( = ?auto_95672 ?auto_95677 ) ) ( not ( = ?auto_95673 ?auto_95674 ) ) ( not ( = ?auto_95673 ?auto_95677 ) ) ( not ( = ?auto_95674 ?auto_95677 ) ) ( not ( = ?auto_95672 ?auto_95675 ) ) ( not ( = ?auto_95672 ?auto_95676 ) ) ( not ( = ?auto_95673 ?auto_95675 ) ) ( not ( = ?auto_95673 ?auto_95676 ) ) ( not ( = ?auto_95674 ?auto_95675 ) ) ( not ( = ?auto_95674 ?auto_95676 ) ) ( not ( = ?auto_95677 ?auto_95675 ) ) ( not ( = ?auto_95677 ?auto_95676 ) ) ( not ( = ?auto_95675 ?auto_95676 ) ) ( ON ?auto_95675 ?auto_95677 ) ( not ( = ?auto_95678 ?auto_95676 ) ) ( not ( = ?auto_95672 ?auto_95678 ) ) ( not ( = ?auto_95673 ?auto_95678 ) ) ( not ( = ?auto_95674 ?auto_95678 ) ) ( not ( = ?auto_95677 ?auto_95678 ) ) ( not ( = ?auto_95675 ?auto_95678 ) ) ( ON ?auto_95676 ?auto_95675 ) ( CLEAR ?auto_95676 ) ( ON ?auto_95678 ?auto_95679 ) ( CLEAR ?auto_95678 ) ( HAND-EMPTY ) ( not ( = ?auto_95672 ?auto_95679 ) ) ( not ( = ?auto_95673 ?auto_95679 ) ) ( not ( = ?auto_95674 ?auto_95679 ) ) ( not ( = ?auto_95677 ?auto_95679 ) ) ( not ( = ?auto_95675 ?auto_95679 ) ) ( not ( = ?auto_95676 ?auto_95679 ) ) ( not ( = ?auto_95678 ?auto_95679 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95678 ?auto_95679 )
      ( MAKE-3PILE ?auto_95672 ?auto_95673 ?auto_95674 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95680 - BLOCK
      ?auto_95681 - BLOCK
      ?auto_95682 - BLOCK
    )
    :vars
    (
      ?auto_95683 - BLOCK
      ?auto_95685 - BLOCK
      ?auto_95684 - BLOCK
      ?auto_95686 - BLOCK
      ?auto_95687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95683 ?auto_95682 ) ( ON-TABLE ?auto_95680 ) ( ON ?auto_95681 ?auto_95680 ) ( ON ?auto_95682 ?auto_95681 ) ( not ( = ?auto_95680 ?auto_95681 ) ) ( not ( = ?auto_95680 ?auto_95682 ) ) ( not ( = ?auto_95680 ?auto_95683 ) ) ( not ( = ?auto_95681 ?auto_95682 ) ) ( not ( = ?auto_95681 ?auto_95683 ) ) ( not ( = ?auto_95682 ?auto_95683 ) ) ( not ( = ?auto_95680 ?auto_95685 ) ) ( not ( = ?auto_95680 ?auto_95684 ) ) ( not ( = ?auto_95681 ?auto_95685 ) ) ( not ( = ?auto_95681 ?auto_95684 ) ) ( not ( = ?auto_95682 ?auto_95685 ) ) ( not ( = ?auto_95682 ?auto_95684 ) ) ( not ( = ?auto_95683 ?auto_95685 ) ) ( not ( = ?auto_95683 ?auto_95684 ) ) ( not ( = ?auto_95685 ?auto_95684 ) ) ( ON ?auto_95685 ?auto_95683 ) ( not ( = ?auto_95686 ?auto_95684 ) ) ( not ( = ?auto_95680 ?auto_95686 ) ) ( not ( = ?auto_95681 ?auto_95686 ) ) ( not ( = ?auto_95682 ?auto_95686 ) ) ( not ( = ?auto_95683 ?auto_95686 ) ) ( not ( = ?auto_95685 ?auto_95686 ) ) ( ON ?auto_95686 ?auto_95687 ) ( CLEAR ?auto_95686 ) ( not ( = ?auto_95680 ?auto_95687 ) ) ( not ( = ?auto_95681 ?auto_95687 ) ) ( not ( = ?auto_95682 ?auto_95687 ) ) ( not ( = ?auto_95683 ?auto_95687 ) ) ( not ( = ?auto_95685 ?auto_95687 ) ) ( not ( = ?auto_95684 ?auto_95687 ) ) ( not ( = ?auto_95686 ?auto_95687 ) ) ( HOLDING ?auto_95684 ) ( CLEAR ?auto_95685 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95680 ?auto_95681 ?auto_95682 ?auto_95683 ?auto_95685 ?auto_95684 )
      ( MAKE-3PILE ?auto_95680 ?auto_95681 ?auto_95682 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95742 - BLOCK
      ?auto_95743 - BLOCK
      ?auto_95744 - BLOCK
      ?auto_95745 - BLOCK
    )
    :vars
    (
      ?auto_95746 - BLOCK
      ?auto_95747 - BLOCK
      ?auto_95748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95742 ) ( ON ?auto_95743 ?auto_95742 ) ( not ( = ?auto_95742 ?auto_95743 ) ) ( not ( = ?auto_95742 ?auto_95744 ) ) ( not ( = ?auto_95742 ?auto_95745 ) ) ( not ( = ?auto_95743 ?auto_95744 ) ) ( not ( = ?auto_95743 ?auto_95745 ) ) ( not ( = ?auto_95744 ?auto_95745 ) ) ( ON ?auto_95745 ?auto_95746 ) ( not ( = ?auto_95742 ?auto_95746 ) ) ( not ( = ?auto_95743 ?auto_95746 ) ) ( not ( = ?auto_95744 ?auto_95746 ) ) ( not ( = ?auto_95745 ?auto_95746 ) ) ( CLEAR ?auto_95743 ) ( ON ?auto_95744 ?auto_95745 ) ( CLEAR ?auto_95744 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95747 ) ( ON ?auto_95748 ?auto_95747 ) ( ON ?auto_95746 ?auto_95748 ) ( not ( = ?auto_95747 ?auto_95748 ) ) ( not ( = ?auto_95747 ?auto_95746 ) ) ( not ( = ?auto_95747 ?auto_95745 ) ) ( not ( = ?auto_95747 ?auto_95744 ) ) ( not ( = ?auto_95748 ?auto_95746 ) ) ( not ( = ?auto_95748 ?auto_95745 ) ) ( not ( = ?auto_95748 ?auto_95744 ) ) ( not ( = ?auto_95742 ?auto_95747 ) ) ( not ( = ?auto_95742 ?auto_95748 ) ) ( not ( = ?auto_95743 ?auto_95747 ) ) ( not ( = ?auto_95743 ?auto_95748 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95747 ?auto_95748 ?auto_95746 ?auto_95745 )
      ( MAKE-4PILE ?auto_95742 ?auto_95743 ?auto_95744 ?auto_95745 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95749 - BLOCK
      ?auto_95750 - BLOCK
      ?auto_95751 - BLOCK
      ?auto_95752 - BLOCK
    )
    :vars
    (
      ?auto_95753 - BLOCK
      ?auto_95755 - BLOCK
      ?auto_95754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95749 ) ( not ( = ?auto_95749 ?auto_95750 ) ) ( not ( = ?auto_95749 ?auto_95751 ) ) ( not ( = ?auto_95749 ?auto_95752 ) ) ( not ( = ?auto_95750 ?auto_95751 ) ) ( not ( = ?auto_95750 ?auto_95752 ) ) ( not ( = ?auto_95751 ?auto_95752 ) ) ( ON ?auto_95752 ?auto_95753 ) ( not ( = ?auto_95749 ?auto_95753 ) ) ( not ( = ?auto_95750 ?auto_95753 ) ) ( not ( = ?auto_95751 ?auto_95753 ) ) ( not ( = ?auto_95752 ?auto_95753 ) ) ( ON ?auto_95751 ?auto_95752 ) ( CLEAR ?auto_95751 ) ( ON-TABLE ?auto_95755 ) ( ON ?auto_95754 ?auto_95755 ) ( ON ?auto_95753 ?auto_95754 ) ( not ( = ?auto_95755 ?auto_95754 ) ) ( not ( = ?auto_95755 ?auto_95753 ) ) ( not ( = ?auto_95755 ?auto_95752 ) ) ( not ( = ?auto_95755 ?auto_95751 ) ) ( not ( = ?auto_95754 ?auto_95753 ) ) ( not ( = ?auto_95754 ?auto_95752 ) ) ( not ( = ?auto_95754 ?auto_95751 ) ) ( not ( = ?auto_95749 ?auto_95755 ) ) ( not ( = ?auto_95749 ?auto_95754 ) ) ( not ( = ?auto_95750 ?auto_95755 ) ) ( not ( = ?auto_95750 ?auto_95754 ) ) ( HOLDING ?auto_95750 ) ( CLEAR ?auto_95749 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95749 ?auto_95750 )
      ( MAKE-4PILE ?auto_95749 ?auto_95750 ?auto_95751 ?auto_95752 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95756 - BLOCK
      ?auto_95757 - BLOCK
      ?auto_95758 - BLOCK
      ?auto_95759 - BLOCK
    )
    :vars
    (
      ?auto_95760 - BLOCK
      ?auto_95761 - BLOCK
      ?auto_95762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95756 ) ( not ( = ?auto_95756 ?auto_95757 ) ) ( not ( = ?auto_95756 ?auto_95758 ) ) ( not ( = ?auto_95756 ?auto_95759 ) ) ( not ( = ?auto_95757 ?auto_95758 ) ) ( not ( = ?auto_95757 ?auto_95759 ) ) ( not ( = ?auto_95758 ?auto_95759 ) ) ( ON ?auto_95759 ?auto_95760 ) ( not ( = ?auto_95756 ?auto_95760 ) ) ( not ( = ?auto_95757 ?auto_95760 ) ) ( not ( = ?auto_95758 ?auto_95760 ) ) ( not ( = ?auto_95759 ?auto_95760 ) ) ( ON ?auto_95758 ?auto_95759 ) ( ON-TABLE ?auto_95761 ) ( ON ?auto_95762 ?auto_95761 ) ( ON ?auto_95760 ?auto_95762 ) ( not ( = ?auto_95761 ?auto_95762 ) ) ( not ( = ?auto_95761 ?auto_95760 ) ) ( not ( = ?auto_95761 ?auto_95759 ) ) ( not ( = ?auto_95761 ?auto_95758 ) ) ( not ( = ?auto_95762 ?auto_95760 ) ) ( not ( = ?auto_95762 ?auto_95759 ) ) ( not ( = ?auto_95762 ?auto_95758 ) ) ( not ( = ?auto_95756 ?auto_95761 ) ) ( not ( = ?auto_95756 ?auto_95762 ) ) ( not ( = ?auto_95757 ?auto_95761 ) ) ( not ( = ?auto_95757 ?auto_95762 ) ) ( CLEAR ?auto_95756 ) ( ON ?auto_95757 ?auto_95758 ) ( CLEAR ?auto_95757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95761 ?auto_95762 ?auto_95760 ?auto_95759 ?auto_95758 )
      ( MAKE-4PILE ?auto_95756 ?auto_95757 ?auto_95758 ?auto_95759 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95763 - BLOCK
      ?auto_95764 - BLOCK
      ?auto_95765 - BLOCK
      ?auto_95766 - BLOCK
    )
    :vars
    (
      ?auto_95768 - BLOCK
      ?auto_95769 - BLOCK
      ?auto_95767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95763 ?auto_95764 ) ) ( not ( = ?auto_95763 ?auto_95765 ) ) ( not ( = ?auto_95763 ?auto_95766 ) ) ( not ( = ?auto_95764 ?auto_95765 ) ) ( not ( = ?auto_95764 ?auto_95766 ) ) ( not ( = ?auto_95765 ?auto_95766 ) ) ( ON ?auto_95766 ?auto_95768 ) ( not ( = ?auto_95763 ?auto_95768 ) ) ( not ( = ?auto_95764 ?auto_95768 ) ) ( not ( = ?auto_95765 ?auto_95768 ) ) ( not ( = ?auto_95766 ?auto_95768 ) ) ( ON ?auto_95765 ?auto_95766 ) ( ON-TABLE ?auto_95769 ) ( ON ?auto_95767 ?auto_95769 ) ( ON ?auto_95768 ?auto_95767 ) ( not ( = ?auto_95769 ?auto_95767 ) ) ( not ( = ?auto_95769 ?auto_95768 ) ) ( not ( = ?auto_95769 ?auto_95766 ) ) ( not ( = ?auto_95769 ?auto_95765 ) ) ( not ( = ?auto_95767 ?auto_95768 ) ) ( not ( = ?auto_95767 ?auto_95766 ) ) ( not ( = ?auto_95767 ?auto_95765 ) ) ( not ( = ?auto_95763 ?auto_95769 ) ) ( not ( = ?auto_95763 ?auto_95767 ) ) ( not ( = ?auto_95764 ?auto_95769 ) ) ( not ( = ?auto_95764 ?auto_95767 ) ) ( ON ?auto_95764 ?auto_95765 ) ( CLEAR ?auto_95764 ) ( HOLDING ?auto_95763 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95763 )
      ( MAKE-4PILE ?auto_95763 ?auto_95764 ?auto_95765 ?auto_95766 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95770 - BLOCK
      ?auto_95771 - BLOCK
      ?auto_95772 - BLOCK
      ?auto_95773 - BLOCK
    )
    :vars
    (
      ?auto_95776 - BLOCK
      ?auto_95774 - BLOCK
      ?auto_95775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95770 ?auto_95771 ) ) ( not ( = ?auto_95770 ?auto_95772 ) ) ( not ( = ?auto_95770 ?auto_95773 ) ) ( not ( = ?auto_95771 ?auto_95772 ) ) ( not ( = ?auto_95771 ?auto_95773 ) ) ( not ( = ?auto_95772 ?auto_95773 ) ) ( ON ?auto_95773 ?auto_95776 ) ( not ( = ?auto_95770 ?auto_95776 ) ) ( not ( = ?auto_95771 ?auto_95776 ) ) ( not ( = ?auto_95772 ?auto_95776 ) ) ( not ( = ?auto_95773 ?auto_95776 ) ) ( ON ?auto_95772 ?auto_95773 ) ( ON-TABLE ?auto_95774 ) ( ON ?auto_95775 ?auto_95774 ) ( ON ?auto_95776 ?auto_95775 ) ( not ( = ?auto_95774 ?auto_95775 ) ) ( not ( = ?auto_95774 ?auto_95776 ) ) ( not ( = ?auto_95774 ?auto_95773 ) ) ( not ( = ?auto_95774 ?auto_95772 ) ) ( not ( = ?auto_95775 ?auto_95776 ) ) ( not ( = ?auto_95775 ?auto_95773 ) ) ( not ( = ?auto_95775 ?auto_95772 ) ) ( not ( = ?auto_95770 ?auto_95774 ) ) ( not ( = ?auto_95770 ?auto_95775 ) ) ( not ( = ?auto_95771 ?auto_95774 ) ) ( not ( = ?auto_95771 ?auto_95775 ) ) ( ON ?auto_95771 ?auto_95772 ) ( ON ?auto_95770 ?auto_95771 ) ( CLEAR ?auto_95770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95774 ?auto_95775 ?auto_95776 ?auto_95773 ?auto_95772 ?auto_95771 )
      ( MAKE-4PILE ?auto_95770 ?auto_95771 ?auto_95772 ?auto_95773 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95781 - BLOCK
      ?auto_95782 - BLOCK
      ?auto_95783 - BLOCK
      ?auto_95784 - BLOCK
    )
    :vars
    (
      ?auto_95787 - BLOCK
      ?auto_95785 - BLOCK
      ?auto_95786 - BLOCK
      ?auto_95788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95781 ?auto_95782 ) ) ( not ( = ?auto_95781 ?auto_95783 ) ) ( not ( = ?auto_95781 ?auto_95784 ) ) ( not ( = ?auto_95782 ?auto_95783 ) ) ( not ( = ?auto_95782 ?auto_95784 ) ) ( not ( = ?auto_95783 ?auto_95784 ) ) ( ON ?auto_95784 ?auto_95787 ) ( not ( = ?auto_95781 ?auto_95787 ) ) ( not ( = ?auto_95782 ?auto_95787 ) ) ( not ( = ?auto_95783 ?auto_95787 ) ) ( not ( = ?auto_95784 ?auto_95787 ) ) ( ON ?auto_95783 ?auto_95784 ) ( ON-TABLE ?auto_95785 ) ( ON ?auto_95786 ?auto_95785 ) ( ON ?auto_95787 ?auto_95786 ) ( not ( = ?auto_95785 ?auto_95786 ) ) ( not ( = ?auto_95785 ?auto_95787 ) ) ( not ( = ?auto_95785 ?auto_95784 ) ) ( not ( = ?auto_95785 ?auto_95783 ) ) ( not ( = ?auto_95786 ?auto_95787 ) ) ( not ( = ?auto_95786 ?auto_95784 ) ) ( not ( = ?auto_95786 ?auto_95783 ) ) ( not ( = ?auto_95781 ?auto_95785 ) ) ( not ( = ?auto_95781 ?auto_95786 ) ) ( not ( = ?auto_95782 ?auto_95785 ) ) ( not ( = ?auto_95782 ?auto_95786 ) ) ( ON ?auto_95782 ?auto_95783 ) ( CLEAR ?auto_95782 ) ( ON ?auto_95781 ?auto_95788 ) ( CLEAR ?auto_95781 ) ( HAND-EMPTY ) ( not ( = ?auto_95781 ?auto_95788 ) ) ( not ( = ?auto_95782 ?auto_95788 ) ) ( not ( = ?auto_95783 ?auto_95788 ) ) ( not ( = ?auto_95784 ?auto_95788 ) ) ( not ( = ?auto_95787 ?auto_95788 ) ) ( not ( = ?auto_95785 ?auto_95788 ) ) ( not ( = ?auto_95786 ?auto_95788 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95781 ?auto_95788 )
      ( MAKE-4PILE ?auto_95781 ?auto_95782 ?auto_95783 ?auto_95784 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95789 - BLOCK
      ?auto_95790 - BLOCK
      ?auto_95791 - BLOCK
      ?auto_95792 - BLOCK
    )
    :vars
    (
      ?auto_95796 - BLOCK
      ?auto_95795 - BLOCK
      ?auto_95794 - BLOCK
      ?auto_95793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95789 ?auto_95790 ) ) ( not ( = ?auto_95789 ?auto_95791 ) ) ( not ( = ?auto_95789 ?auto_95792 ) ) ( not ( = ?auto_95790 ?auto_95791 ) ) ( not ( = ?auto_95790 ?auto_95792 ) ) ( not ( = ?auto_95791 ?auto_95792 ) ) ( ON ?auto_95792 ?auto_95796 ) ( not ( = ?auto_95789 ?auto_95796 ) ) ( not ( = ?auto_95790 ?auto_95796 ) ) ( not ( = ?auto_95791 ?auto_95796 ) ) ( not ( = ?auto_95792 ?auto_95796 ) ) ( ON ?auto_95791 ?auto_95792 ) ( ON-TABLE ?auto_95795 ) ( ON ?auto_95794 ?auto_95795 ) ( ON ?auto_95796 ?auto_95794 ) ( not ( = ?auto_95795 ?auto_95794 ) ) ( not ( = ?auto_95795 ?auto_95796 ) ) ( not ( = ?auto_95795 ?auto_95792 ) ) ( not ( = ?auto_95795 ?auto_95791 ) ) ( not ( = ?auto_95794 ?auto_95796 ) ) ( not ( = ?auto_95794 ?auto_95792 ) ) ( not ( = ?auto_95794 ?auto_95791 ) ) ( not ( = ?auto_95789 ?auto_95795 ) ) ( not ( = ?auto_95789 ?auto_95794 ) ) ( not ( = ?auto_95790 ?auto_95795 ) ) ( not ( = ?auto_95790 ?auto_95794 ) ) ( ON ?auto_95789 ?auto_95793 ) ( CLEAR ?auto_95789 ) ( not ( = ?auto_95789 ?auto_95793 ) ) ( not ( = ?auto_95790 ?auto_95793 ) ) ( not ( = ?auto_95791 ?auto_95793 ) ) ( not ( = ?auto_95792 ?auto_95793 ) ) ( not ( = ?auto_95796 ?auto_95793 ) ) ( not ( = ?auto_95795 ?auto_95793 ) ) ( not ( = ?auto_95794 ?auto_95793 ) ) ( HOLDING ?auto_95790 ) ( CLEAR ?auto_95791 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95795 ?auto_95794 ?auto_95796 ?auto_95792 ?auto_95791 ?auto_95790 )
      ( MAKE-4PILE ?auto_95789 ?auto_95790 ?auto_95791 ?auto_95792 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95797 - BLOCK
      ?auto_95798 - BLOCK
      ?auto_95799 - BLOCK
      ?auto_95800 - BLOCK
    )
    :vars
    (
      ?auto_95803 - BLOCK
      ?auto_95804 - BLOCK
      ?auto_95801 - BLOCK
      ?auto_95802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95797 ?auto_95798 ) ) ( not ( = ?auto_95797 ?auto_95799 ) ) ( not ( = ?auto_95797 ?auto_95800 ) ) ( not ( = ?auto_95798 ?auto_95799 ) ) ( not ( = ?auto_95798 ?auto_95800 ) ) ( not ( = ?auto_95799 ?auto_95800 ) ) ( ON ?auto_95800 ?auto_95803 ) ( not ( = ?auto_95797 ?auto_95803 ) ) ( not ( = ?auto_95798 ?auto_95803 ) ) ( not ( = ?auto_95799 ?auto_95803 ) ) ( not ( = ?auto_95800 ?auto_95803 ) ) ( ON ?auto_95799 ?auto_95800 ) ( ON-TABLE ?auto_95804 ) ( ON ?auto_95801 ?auto_95804 ) ( ON ?auto_95803 ?auto_95801 ) ( not ( = ?auto_95804 ?auto_95801 ) ) ( not ( = ?auto_95804 ?auto_95803 ) ) ( not ( = ?auto_95804 ?auto_95800 ) ) ( not ( = ?auto_95804 ?auto_95799 ) ) ( not ( = ?auto_95801 ?auto_95803 ) ) ( not ( = ?auto_95801 ?auto_95800 ) ) ( not ( = ?auto_95801 ?auto_95799 ) ) ( not ( = ?auto_95797 ?auto_95804 ) ) ( not ( = ?auto_95797 ?auto_95801 ) ) ( not ( = ?auto_95798 ?auto_95804 ) ) ( not ( = ?auto_95798 ?auto_95801 ) ) ( ON ?auto_95797 ?auto_95802 ) ( not ( = ?auto_95797 ?auto_95802 ) ) ( not ( = ?auto_95798 ?auto_95802 ) ) ( not ( = ?auto_95799 ?auto_95802 ) ) ( not ( = ?auto_95800 ?auto_95802 ) ) ( not ( = ?auto_95803 ?auto_95802 ) ) ( not ( = ?auto_95804 ?auto_95802 ) ) ( not ( = ?auto_95801 ?auto_95802 ) ) ( CLEAR ?auto_95799 ) ( ON ?auto_95798 ?auto_95797 ) ( CLEAR ?auto_95798 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95802 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95802 ?auto_95797 )
      ( MAKE-4PILE ?auto_95797 ?auto_95798 ?auto_95799 ?auto_95800 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95805 - BLOCK
      ?auto_95806 - BLOCK
      ?auto_95807 - BLOCK
      ?auto_95808 - BLOCK
    )
    :vars
    (
      ?auto_95810 - BLOCK
      ?auto_95811 - BLOCK
      ?auto_95809 - BLOCK
      ?auto_95812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95805 ?auto_95806 ) ) ( not ( = ?auto_95805 ?auto_95807 ) ) ( not ( = ?auto_95805 ?auto_95808 ) ) ( not ( = ?auto_95806 ?auto_95807 ) ) ( not ( = ?auto_95806 ?auto_95808 ) ) ( not ( = ?auto_95807 ?auto_95808 ) ) ( ON ?auto_95808 ?auto_95810 ) ( not ( = ?auto_95805 ?auto_95810 ) ) ( not ( = ?auto_95806 ?auto_95810 ) ) ( not ( = ?auto_95807 ?auto_95810 ) ) ( not ( = ?auto_95808 ?auto_95810 ) ) ( ON-TABLE ?auto_95811 ) ( ON ?auto_95809 ?auto_95811 ) ( ON ?auto_95810 ?auto_95809 ) ( not ( = ?auto_95811 ?auto_95809 ) ) ( not ( = ?auto_95811 ?auto_95810 ) ) ( not ( = ?auto_95811 ?auto_95808 ) ) ( not ( = ?auto_95811 ?auto_95807 ) ) ( not ( = ?auto_95809 ?auto_95810 ) ) ( not ( = ?auto_95809 ?auto_95808 ) ) ( not ( = ?auto_95809 ?auto_95807 ) ) ( not ( = ?auto_95805 ?auto_95811 ) ) ( not ( = ?auto_95805 ?auto_95809 ) ) ( not ( = ?auto_95806 ?auto_95811 ) ) ( not ( = ?auto_95806 ?auto_95809 ) ) ( ON ?auto_95805 ?auto_95812 ) ( not ( = ?auto_95805 ?auto_95812 ) ) ( not ( = ?auto_95806 ?auto_95812 ) ) ( not ( = ?auto_95807 ?auto_95812 ) ) ( not ( = ?auto_95808 ?auto_95812 ) ) ( not ( = ?auto_95810 ?auto_95812 ) ) ( not ( = ?auto_95811 ?auto_95812 ) ) ( not ( = ?auto_95809 ?auto_95812 ) ) ( ON ?auto_95806 ?auto_95805 ) ( CLEAR ?auto_95806 ) ( ON-TABLE ?auto_95812 ) ( HOLDING ?auto_95807 ) ( CLEAR ?auto_95808 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95811 ?auto_95809 ?auto_95810 ?auto_95808 ?auto_95807 )
      ( MAKE-4PILE ?auto_95805 ?auto_95806 ?auto_95807 ?auto_95808 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95813 - BLOCK
      ?auto_95814 - BLOCK
      ?auto_95815 - BLOCK
      ?auto_95816 - BLOCK
    )
    :vars
    (
      ?auto_95820 - BLOCK
      ?auto_95819 - BLOCK
      ?auto_95818 - BLOCK
      ?auto_95817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95813 ?auto_95814 ) ) ( not ( = ?auto_95813 ?auto_95815 ) ) ( not ( = ?auto_95813 ?auto_95816 ) ) ( not ( = ?auto_95814 ?auto_95815 ) ) ( not ( = ?auto_95814 ?auto_95816 ) ) ( not ( = ?auto_95815 ?auto_95816 ) ) ( ON ?auto_95816 ?auto_95820 ) ( not ( = ?auto_95813 ?auto_95820 ) ) ( not ( = ?auto_95814 ?auto_95820 ) ) ( not ( = ?auto_95815 ?auto_95820 ) ) ( not ( = ?auto_95816 ?auto_95820 ) ) ( ON-TABLE ?auto_95819 ) ( ON ?auto_95818 ?auto_95819 ) ( ON ?auto_95820 ?auto_95818 ) ( not ( = ?auto_95819 ?auto_95818 ) ) ( not ( = ?auto_95819 ?auto_95820 ) ) ( not ( = ?auto_95819 ?auto_95816 ) ) ( not ( = ?auto_95819 ?auto_95815 ) ) ( not ( = ?auto_95818 ?auto_95820 ) ) ( not ( = ?auto_95818 ?auto_95816 ) ) ( not ( = ?auto_95818 ?auto_95815 ) ) ( not ( = ?auto_95813 ?auto_95819 ) ) ( not ( = ?auto_95813 ?auto_95818 ) ) ( not ( = ?auto_95814 ?auto_95819 ) ) ( not ( = ?auto_95814 ?auto_95818 ) ) ( ON ?auto_95813 ?auto_95817 ) ( not ( = ?auto_95813 ?auto_95817 ) ) ( not ( = ?auto_95814 ?auto_95817 ) ) ( not ( = ?auto_95815 ?auto_95817 ) ) ( not ( = ?auto_95816 ?auto_95817 ) ) ( not ( = ?auto_95820 ?auto_95817 ) ) ( not ( = ?auto_95819 ?auto_95817 ) ) ( not ( = ?auto_95818 ?auto_95817 ) ) ( ON ?auto_95814 ?auto_95813 ) ( ON-TABLE ?auto_95817 ) ( CLEAR ?auto_95816 ) ( ON ?auto_95815 ?auto_95814 ) ( CLEAR ?auto_95815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95817 ?auto_95813 ?auto_95814 )
      ( MAKE-4PILE ?auto_95813 ?auto_95814 ?auto_95815 ?auto_95816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95821 - BLOCK
      ?auto_95822 - BLOCK
      ?auto_95823 - BLOCK
      ?auto_95824 - BLOCK
    )
    :vars
    (
      ?auto_95826 - BLOCK
      ?auto_95827 - BLOCK
      ?auto_95825 - BLOCK
      ?auto_95828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95821 ?auto_95822 ) ) ( not ( = ?auto_95821 ?auto_95823 ) ) ( not ( = ?auto_95821 ?auto_95824 ) ) ( not ( = ?auto_95822 ?auto_95823 ) ) ( not ( = ?auto_95822 ?auto_95824 ) ) ( not ( = ?auto_95823 ?auto_95824 ) ) ( not ( = ?auto_95821 ?auto_95826 ) ) ( not ( = ?auto_95822 ?auto_95826 ) ) ( not ( = ?auto_95823 ?auto_95826 ) ) ( not ( = ?auto_95824 ?auto_95826 ) ) ( ON-TABLE ?auto_95827 ) ( ON ?auto_95825 ?auto_95827 ) ( ON ?auto_95826 ?auto_95825 ) ( not ( = ?auto_95827 ?auto_95825 ) ) ( not ( = ?auto_95827 ?auto_95826 ) ) ( not ( = ?auto_95827 ?auto_95824 ) ) ( not ( = ?auto_95827 ?auto_95823 ) ) ( not ( = ?auto_95825 ?auto_95826 ) ) ( not ( = ?auto_95825 ?auto_95824 ) ) ( not ( = ?auto_95825 ?auto_95823 ) ) ( not ( = ?auto_95821 ?auto_95827 ) ) ( not ( = ?auto_95821 ?auto_95825 ) ) ( not ( = ?auto_95822 ?auto_95827 ) ) ( not ( = ?auto_95822 ?auto_95825 ) ) ( ON ?auto_95821 ?auto_95828 ) ( not ( = ?auto_95821 ?auto_95828 ) ) ( not ( = ?auto_95822 ?auto_95828 ) ) ( not ( = ?auto_95823 ?auto_95828 ) ) ( not ( = ?auto_95824 ?auto_95828 ) ) ( not ( = ?auto_95826 ?auto_95828 ) ) ( not ( = ?auto_95827 ?auto_95828 ) ) ( not ( = ?auto_95825 ?auto_95828 ) ) ( ON ?auto_95822 ?auto_95821 ) ( ON-TABLE ?auto_95828 ) ( ON ?auto_95823 ?auto_95822 ) ( CLEAR ?auto_95823 ) ( HOLDING ?auto_95824 ) ( CLEAR ?auto_95826 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95827 ?auto_95825 ?auto_95826 ?auto_95824 )
      ( MAKE-4PILE ?auto_95821 ?auto_95822 ?auto_95823 ?auto_95824 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95829 - BLOCK
      ?auto_95830 - BLOCK
      ?auto_95831 - BLOCK
      ?auto_95832 - BLOCK
    )
    :vars
    (
      ?auto_95833 - BLOCK
      ?auto_95836 - BLOCK
      ?auto_95835 - BLOCK
      ?auto_95834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95829 ?auto_95830 ) ) ( not ( = ?auto_95829 ?auto_95831 ) ) ( not ( = ?auto_95829 ?auto_95832 ) ) ( not ( = ?auto_95830 ?auto_95831 ) ) ( not ( = ?auto_95830 ?auto_95832 ) ) ( not ( = ?auto_95831 ?auto_95832 ) ) ( not ( = ?auto_95829 ?auto_95833 ) ) ( not ( = ?auto_95830 ?auto_95833 ) ) ( not ( = ?auto_95831 ?auto_95833 ) ) ( not ( = ?auto_95832 ?auto_95833 ) ) ( ON-TABLE ?auto_95836 ) ( ON ?auto_95835 ?auto_95836 ) ( ON ?auto_95833 ?auto_95835 ) ( not ( = ?auto_95836 ?auto_95835 ) ) ( not ( = ?auto_95836 ?auto_95833 ) ) ( not ( = ?auto_95836 ?auto_95832 ) ) ( not ( = ?auto_95836 ?auto_95831 ) ) ( not ( = ?auto_95835 ?auto_95833 ) ) ( not ( = ?auto_95835 ?auto_95832 ) ) ( not ( = ?auto_95835 ?auto_95831 ) ) ( not ( = ?auto_95829 ?auto_95836 ) ) ( not ( = ?auto_95829 ?auto_95835 ) ) ( not ( = ?auto_95830 ?auto_95836 ) ) ( not ( = ?auto_95830 ?auto_95835 ) ) ( ON ?auto_95829 ?auto_95834 ) ( not ( = ?auto_95829 ?auto_95834 ) ) ( not ( = ?auto_95830 ?auto_95834 ) ) ( not ( = ?auto_95831 ?auto_95834 ) ) ( not ( = ?auto_95832 ?auto_95834 ) ) ( not ( = ?auto_95833 ?auto_95834 ) ) ( not ( = ?auto_95836 ?auto_95834 ) ) ( not ( = ?auto_95835 ?auto_95834 ) ) ( ON ?auto_95830 ?auto_95829 ) ( ON-TABLE ?auto_95834 ) ( ON ?auto_95831 ?auto_95830 ) ( CLEAR ?auto_95833 ) ( ON ?auto_95832 ?auto_95831 ) ( CLEAR ?auto_95832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95834 ?auto_95829 ?auto_95830 ?auto_95831 )
      ( MAKE-4PILE ?auto_95829 ?auto_95830 ?auto_95831 ?auto_95832 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95837 - BLOCK
      ?auto_95838 - BLOCK
      ?auto_95839 - BLOCK
      ?auto_95840 - BLOCK
    )
    :vars
    (
      ?auto_95842 - BLOCK
      ?auto_95843 - BLOCK
      ?auto_95841 - BLOCK
      ?auto_95844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95837 ?auto_95838 ) ) ( not ( = ?auto_95837 ?auto_95839 ) ) ( not ( = ?auto_95837 ?auto_95840 ) ) ( not ( = ?auto_95838 ?auto_95839 ) ) ( not ( = ?auto_95838 ?auto_95840 ) ) ( not ( = ?auto_95839 ?auto_95840 ) ) ( not ( = ?auto_95837 ?auto_95842 ) ) ( not ( = ?auto_95838 ?auto_95842 ) ) ( not ( = ?auto_95839 ?auto_95842 ) ) ( not ( = ?auto_95840 ?auto_95842 ) ) ( ON-TABLE ?auto_95843 ) ( ON ?auto_95841 ?auto_95843 ) ( not ( = ?auto_95843 ?auto_95841 ) ) ( not ( = ?auto_95843 ?auto_95842 ) ) ( not ( = ?auto_95843 ?auto_95840 ) ) ( not ( = ?auto_95843 ?auto_95839 ) ) ( not ( = ?auto_95841 ?auto_95842 ) ) ( not ( = ?auto_95841 ?auto_95840 ) ) ( not ( = ?auto_95841 ?auto_95839 ) ) ( not ( = ?auto_95837 ?auto_95843 ) ) ( not ( = ?auto_95837 ?auto_95841 ) ) ( not ( = ?auto_95838 ?auto_95843 ) ) ( not ( = ?auto_95838 ?auto_95841 ) ) ( ON ?auto_95837 ?auto_95844 ) ( not ( = ?auto_95837 ?auto_95844 ) ) ( not ( = ?auto_95838 ?auto_95844 ) ) ( not ( = ?auto_95839 ?auto_95844 ) ) ( not ( = ?auto_95840 ?auto_95844 ) ) ( not ( = ?auto_95842 ?auto_95844 ) ) ( not ( = ?auto_95843 ?auto_95844 ) ) ( not ( = ?auto_95841 ?auto_95844 ) ) ( ON ?auto_95838 ?auto_95837 ) ( ON-TABLE ?auto_95844 ) ( ON ?auto_95839 ?auto_95838 ) ( ON ?auto_95840 ?auto_95839 ) ( CLEAR ?auto_95840 ) ( HOLDING ?auto_95842 ) ( CLEAR ?auto_95841 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95843 ?auto_95841 ?auto_95842 )
      ( MAKE-4PILE ?auto_95837 ?auto_95838 ?auto_95839 ?auto_95840 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95845 - BLOCK
      ?auto_95846 - BLOCK
      ?auto_95847 - BLOCK
      ?auto_95848 - BLOCK
    )
    :vars
    (
      ?auto_95849 - BLOCK
      ?auto_95851 - BLOCK
      ?auto_95852 - BLOCK
      ?auto_95850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95845 ?auto_95846 ) ) ( not ( = ?auto_95845 ?auto_95847 ) ) ( not ( = ?auto_95845 ?auto_95848 ) ) ( not ( = ?auto_95846 ?auto_95847 ) ) ( not ( = ?auto_95846 ?auto_95848 ) ) ( not ( = ?auto_95847 ?auto_95848 ) ) ( not ( = ?auto_95845 ?auto_95849 ) ) ( not ( = ?auto_95846 ?auto_95849 ) ) ( not ( = ?auto_95847 ?auto_95849 ) ) ( not ( = ?auto_95848 ?auto_95849 ) ) ( ON-TABLE ?auto_95851 ) ( ON ?auto_95852 ?auto_95851 ) ( not ( = ?auto_95851 ?auto_95852 ) ) ( not ( = ?auto_95851 ?auto_95849 ) ) ( not ( = ?auto_95851 ?auto_95848 ) ) ( not ( = ?auto_95851 ?auto_95847 ) ) ( not ( = ?auto_95852 ?auto_95849 ) ) ( not ( = ?auto_95852 ?auto_95848 ) ) ( not ( = ?auto_95852 ?auto_95847 ) ) ( not ( = ?auto_95845 ?auto_95851 ) ) ( not ( = ?auto_95845 ?auto_95852 ) ) ( not ( = ?auto_95846 ?auto_95851 ) ) ( not ( = ?auto_95846 ?auto_95852 ) ) ( ON ?auto_95845 ?auto_95850 ) ( not ( = ?auto_95845 ?auto_95850 ) ) ( not ( = ?auto_95846 ?auto_95850 ) ) ( not ( = ?auto_95847 ?auto_95850 ) ) ( not ( = ?auto_95848 ?auto_95850 ) ) ( not ( = ?auto_95849 ?auto_95850 ) ) ( not ( = ?auto_95851 ?auto_95850 ) ) ( not ( = ?auto_95852 ?auto_95850 ) ) ( ON ?auto_95846 ?auto_95845 ) ( ON-TABLE ?auto_95850 ) ( ON ?auto_95847 ?auto_95846 ) ( ON ?auto_95848 ?auto_95847 ) ( CLEAR ?auto_95852 ) ( ON ?auto_95849 ?auto_95848 ) ( CLEAR ?auto_95849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95850 ?auto_95845 ?auto_95846 ?auto_95847 ?auto_95848 )
      ( MAKE-4PILE ?auto_95845 ?auto_95846 ?auto_95847 ?auto_95848 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95853 - BLOCK
      ?auto_95854 - BLOCK
      ?auto_95855 - BLOCK
      ?auto_95856 - BLOCK
    )
    :vars
    (
      ?auto_95858 - BLOCK
      ?auto_95857 - BLOCK
      ?auto_95860 - BLOCK
      ?auto_95859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95853 ?auto_95854 ) ) ( not ( = ?auto_95853 ?auto_95855 ) ) ( not ( = ?auto_95853 ?auto_95856 ) ) ( not ( = ?auto_95854 ?auto_95855 ) ) ( not ( = ?auto_95854 ?auto_95856 ) ) ( not ( = ?auto_95855 ?auto_95856 ) ) ( not ( = ?auto_95853 ?auto_95858 ) ) ( not ( = ?auto_95854 ?auto_95858 ) ) ( not ( = ?auto_95855 ?auto_95858 ) ) ( not ( = ?auto_95856 ?auto_95858 ) ) ( ON-TABLE ?auto_95857 ) ( not ( = ?auto_95857 ?auto_95860 ) ) ( not ( = ?auto_95857 ?auto_95858 ) ) ( not ( = ?auto_95857 ?auto_95856 ) ) ( not ( = ?auto_95857 ?auto_95855 ) ) ( not ( = ?auto_95860 ?auto_95858 ) ) ( not ( = ?auto_95860 ?auto_95856 ) ) ( not ( = ?auto_95860 ?auto_95855 ) ) ( not ( = ?auto_95853 ?auto_95857 ) ) ( not ( = ?auto_95853 ?auto_95860 ) ) ( not ( = ?auto_95854 ?auto_95857 ) ) ( not ( = ?auto_95854 ?auto_95860 ) ) ( ON ?auto_95853 ?auto_95859 ) ( not ( = ?auto_95853 ?auto_95859 ) ) ( not ( = ?auto_95854 ?auto_95859 ) ) ( not ( = ?auto_95855 ?auto_95859 ) ) ( not ( = ?auto_95856 ?auto_95859 ) ) ( not ( = ?auto_95858 ?auto_95859 ) ) ( not ( = ?auto_95857 ?auto_95859 ) ) ( not ( = ?auto_95860 ?auto_95859 ) ) ( ON ?auto_95854 ?auto_95853 ) ( ON-TABLE ?auto_95859 ) ( ON ?auto_95855 ?auto_95854 ) ( ON ?auto_95856 ?auto_95855 ) ( ON ?auto_95858 ?auto_95856 ) ( CLEAR ?auto_95858 ) ( HOLDING ?auto_95860 ) ( CLEAR ?auto_95857 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95857 ?auto_95860 )
      ( MAKE-4PILE ?auto_95853 ?auto_95854 ?auto_95855 ?auto_95856 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95861 - BLOCK
      ?auto_95862 - BLOCK
      ?auto_95863 - BLOCK
      ?auto_95864 - BLOCK
    )
    :vars
    (
      ?auto_95867 - BLOCK
      ?auto_95865 - BLOCK
      ?auto_95866 - BLOCK
      ?auto_95868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95861 ?auto_95862 ) ) ( not ( = ?auto_95861 ?auto_95863 ) ) ( not ( = ?auto_95861 ?auto_95864 ) ) ( not ( = ?auto_95862 ?auto_95863 ) ) ( not ( = ?auto_95862 ?auto_95864 ) ) ( not ( = ?auto_95863 ?auto_95864 ) ) ( not ( = ?auto_95861 ?auto_95867 ) ) ( not ( = ?auto_95862 ?auto_95867 ) ) ( not ( = ?auto_95863 ?auto_95867 ) ) ( not ( = ?auto_95864 ?auto_95867 ) ) ( ON-TABLE ?auto_95865 ) ( not ( = ?auto_95865 ?auto_95866 ) ) ( not ( = ?auto_95865 ?auto_95867 ) ) ( not ( = ?auto_95865 ?auto_95864 ) ) ( not ( = ?auto_95865 ?auto_95863 ) ) ( not ( = ?auto_95866 ?auto_95867 ) ) ( not ( = ?auto_95866 ?auto_95864 ) ) ( not ( = ?auto_95866 ?auto_95863 ) ) ( not ( = ?auto_95861 ?auto_95865 ) ) ( not ( = ?auto_95861 ?auto_95866 ) ) ( not ( = ?auto_95862 ?auto_95865 ) ) ( not ( = ?auto_95862 ?auto_95866 ) ) ( ON ?auto_95861 ?auto_95868 ) ( not ( = ?auto_95861 ?auto_95868 ) ) ( not ( = ?auto_95862 ?auto_95868 ) ) ( not ( = ?auto_95863 ?auto_95868 ) ) ( not ( = ?auto_95864 ?auto_95868 ) ) ( not ( = ?auto_95867 ?auto_95868 ) ) ( not ( = ?auto_95865 ?auto_95868 ) ) ( not ( = ?auto_95866 ?auto_95868 ) ) ( ON ?auto_95862 ?auto_95861 ) ( ON-TABLE ?auto_95868 ) ( ON ?auto_95863 ?auto_95862 ) ( ON ?auto_95864 ?auto_95863 ) ( ON ?auto_95867 ?auto_95864 ) ( CLEAR ?auto_95865 ) ( ON ?auto_95866 ?auto_95867 ) ( CLEAR ?auto_95866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95868 ?auto_95861 ?auto_95862 ?auto_95863 ?auto_95864 ?auto_95867 )
      ( MAKE-4PILE ?auto_95861 ?auto_95862 ?auto_95863 ?auto_95864 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95869 - BLOCK
      ?auto_95870 - BLOCK
      ?auto_95871 - BLOCK
      ?auto_95872 - BLOCK
    )
    :vars
    (
      ?auto_95873 - BLOCK
      ?auto_95875 - BLOCK
      ?auto_95876 - BLOCK
      ?auto_95874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95869 ?auto_95870 ) ) ( not ( = ?auto_95869 ?auto_95871 ) ) ( not ( = ?auto_95869 ?auto_95872 ) ) ( not ( = ?auto_95870 ?auto_95871 ) ) ( not ( = ?auto_95870 ?auto_95872 ) ) ( not ( = ?auto_95871 ?auto_95872 ) ) ( not ( = ?auto_95869 ?auto_95873 ) ) ( not ( = ?auto_95870 ?auto_95873 ) ) ( not ( = ?auto_95871 ?auto_95873 ) ) ( not ( = ?auto_95872 ?auto_95873 ) ) ( not ( = ?auto_95875 ?auto_95876 ) ) ( not ( = ?auto_95875 ?auto_95873 ) ) ( not ( = ?auto_95875 ?auto_95872 ) ) ( not ( = ?auto_95875 ?auto_95871 ) ) ( not ( = ?auto_95876 ?auto_95873 ) ) ( not ( = ?auto_95876 ?auto_95872 ) ) ( not ( = ?auto_95876 ?auto_95871 ) ) ( not ( = ?auto_95869 ?auto_95875 ) ) ( not ( = ?auto_95869 ?auto_95876 ) ) ( not ( = ?auto_95870 ?auto_95875 ) ) ( not ( = ?auto_95870 ?auto_95876 ) ) ( ON ?auto_95869 ?auto_95874 ) ( not ( = ?auto_95869 ?auto_95874 ) ) ( not ( = ?auto_95870 ?auto_95874 ) ) ( not ( = ?auto_95871 ?auto_95874 ) ) ( not ( = ?auto_95872 ?auto_95874 ) ) ( not ( = ?auto_95873 ?auto_95874 ) ) ( not ( = ?auto_95875 ?auto_95874 ) ) ( not ( = ?auto_95876 ?auto_95874 ) ) ( ON ?auto_95870 ?auto_95869 ) ( ON-TABLE ?auto_95874 ) ( ON ?auto_95871 ?auto_95870 ) ( ON ?auto_95872 ?auto_95871 ) ( ON ?auto_95873 ?auto_95872 ) ( ON ?auto_95876 ?auto_95873 ) ( CLEAR ?auto_95876 ) ( HOLDING ?auto_95875 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95875 )
      ( MAKE-4PILE ?auto_95869 ?auto_95870 ?auto_95871 ?auto_95872 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95877 - BLOCK
      ?auto_95878 - BLOCK
      ?auto_95879 - BLOCK
      ?auto_95880 - BLOCK
    )
    :vars
    (
      ?auto_95884 - BLOCK
      ?auto_95883 - BLOCK
      ?auto_95881 - BLOCK
      ?auto_95882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95877 ?auto_95878 ) ) ( not ( = ?auto_95877 ?auto_95879 ) ) ( not ( = ?auto_95877 ?auto_95880 ) ) ( not ( = ?auto_95878 ?auto_95879 ) ) ( not ( = ?auto_95878 ?auto_95880 ) ) ( not ( = ?auto_95879 ?auto_95880 ) ) ( not ( = ?auto_95877 ?auto_95884 ) ) ( not ( = ?auto_95878 ?auto_95884 ) ) ( not ( = ?auto_95879 ?auto_95884 ) ) ( not ( = ?auto_95880 ?auto_95884 ) ) ( not ( = ?auto_95883 ?auto_95881 ) ) ( not ( = ?auto_95883 ?auto_95884 ) ) ( not ( = ?auto_95883 ?auto_95880 ) ) ( not ( = ?auto_95883 ?auto_95879 ) ) ( not ( = ?auto_95881 ?auto_95884 ) ) ( not ( = ?auto_95881 ?auto_95880 ) ) ( not ( = ?auto_95881 ?auto_95879 ) ) ( not ( = ?auto_95877 ?auto_95883 ) ) ( not ( = ?auto_95877 ?auto_95881 ) ) ( not ( = ?auto_95878 ?auto_95883 ) ) ( not ( = ?auto_95878 ?auto_95881 ) ) ( ON ?auto_95877 ?auto_95882 ) ( not ( = ?auto_95877 ?auto_95882 ) ) ( not ( = ?auto_95878 ?auto_95882 ) ) ( not ( = ?auto_95879 ?auto_95882 ) ) ( not ( = ?auto_95880 ?auto_95882 ) ) ( not ( = ?auto_95884 ?auto_95882 ) ) ( not ( = ?auto_95883 ?auto_95882 ) ) ( not ( = ?auto_95881 ?auto_95882 ) ) ( ON ?auto_95878 ?auto_95877 ) ( ON-TABLE ?auto_95882 ) ( ON ?auto_95879 ?auto_95878 ) ( ON ?auto_95880 ?auto_95879 ) ( ON ?auto_95884 ?auto_95880 ) ( ON ?auto_95881 ?auto_95884 ) ( ON ?auto_95883 ?auto_95881 ) ( CLEAR ?auto_95883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95882 ?auto_95877 ?auto_95878 ?auto_95879 ?auto_95880 ?auto_95884 ?auto_95881 )
      ( MAKE-4PILE ?auto_95877 ?auto_95878 ?auto_95879 ?auto_95880 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95900 - BLOCK
      ?auto_95901 - BLOCK
    )
    :vars
    (
      ?auto_95903 - BLOCK
      ?auto_95904 - BLOCK
      ?auto_95902 - BLOCK
      ?auto_95905 - BLOCK
      ?auto_95906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95903 ?auto_95901 ) ( ON-TABLE ?auto_95900 ) ( ON ?auto_95901 ?auto_95900 ) ( not ( = ?auto_95900 ?auto_95901 ) ) ( not ( = ?auto_95900 ?auto_95903 ) ) ( not ( = ?auto_95901 ?auto_95903 ) ) ( not ( = ?auto_95900 ?auto_95904 ) ) ( not ( = ?auto_95900 ?auto_95902 ) ) ( not ( = ?auto_95901 ?auto_95904 ) ) ( not ( = ?auto_95901 ?auto_95902 ) ) ( not ( = ?auto_95903 ?auto_95904 ) ) ( not ( = ?auto_95903 ?auto_95902 ) ) ( not ( = ?auto_95904 ?auto_95902 ) ) ( ON ?auto_95904 ?auto_95903 ) ( CLEAR ?auto_95904 ) ( HOLDING ?auto_95902 ) ( CLEAR ?auto_95905 ) ( ON-TABLE ?auto_95906 ) ( ON ?auto_95905 ?auto_95906 ) ( not ( = ?auto_95906 ?auto_95905 ) ) ( not ( = ?auto_95906 ?auto_95902 ) ) ( not ( = ?auto_95905 ?auto_95902 ) ) ( not ( = ?auto_95900 ?auto_95905 ) ) ( not ( = ?auto_95900 ?auto_95906 ) ) ( not ( = ?auto_95901 ?auto_95905 ) ) ( not ( = ?auto_95901 ?auto_95906 ) ) ( not ( = ?auto_95903 ?auto_95905 ) ) ( not ( = ?auto_95903 ?auto_95906 ) ) ( not ( = ?auto_95904 ?auto_95905 ) ) ( not ( = ?auto_95904 ?auto_95906 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95906 ?auto_95905 ?auto_95902 )
      ( MAKE-2PILE ?auto_95900 ?auto_95901 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95907 - BLOCK
      ?auto_95908 - BLOCK
    )
    :vars
    (
      ?auto_95910 - BLOCK
      ?auto_95912 - BLOCK
      ?auto_95909 - BLOCK
      ?auto_95913 - BLOCK
      ?auto_95911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95910 ?auto_95908 ) ( ON-TABLE ?auto_95907 ) ( ON ?auto_95908 ?auto_95907 ) ( not ( = ?auto_95907 ?auto_95908 ) ) ( not ( = ?auto_95907 ?auto_95910 ) ) ( not ( = ?auto_95908 ?auto_95910 ) ) ( not ( = ?auto_95907 ?auto_95912 ) ) ( not ( = ?auto_95907 ?auto_95909 ) ) ( not ( = ?auto_95908 ?auto_95912 ) ) ( not ( = ?auto_95908 ?auto_95909 ) ) ( not ( = ?auto_95910 ?auto_95912 ) ) ( not ( = ?auto_95910 ?auto_95909 ) ) ( not ( = ?auto_95912 ?auto_95909 ) ) ( ON ?auto_95912 ?auto_95910 ) ( CLEAR ?auto_95913 ) ( ON-TABLE ?auto_95911 ) ( ON ?auto_95913 ?auto_95911 ) ( not ( = ?auto_95911 ?auto_95913 ) ) ( not ( = ?auto_95911 ?auto_95909 ) ) ( not ( = ?auto_95913 ?auto_95909 ) ) ( not ( = ?auto_95907 ?auto_95913 ) ) ( not ( = ?auto_95907 ?auto_95911 ) ) ( not ( = ?auto_95908 ?auto_95913 ) ) ( not ( = ?auto_95908 ?auto_95911 ) ) ( not ( = ?auto_95910 ?auto_95913 ) ) ( not ( = ?auto_95910 ?auto_95911 ) ) ( not ( = ?auto_95912 ?auto_95913 ) ) ( not ( = ?auto_95912 ?auto_95911 ) ) ( ON ?auto_95909 ?auto_95912 ) ( CLEAR ?auto_95909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95907 ?auto_95908 ?auto_95910 ?auto_95912 )
      ( MAKE-2PILE ?auto_95907 ?auto_95908 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95914 - BLOCK
      ?auto_95915 - BLOCK
    )
    :vars
    (
      ?auto_95918 - BLOCK
      ?auto_95919 - BLOCK
      ?auto_95917 - BLOCK
      ?auto_95920 - BLOCK
      ?auto_95916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95918 ?auto_95915 ) ( ON-TABLE ?auto_95914 ) ( ON ?auto_95915 ?auto_95914 ) ( not ( = ?auto_95914 ?auto_95915 ) ) ( not ( = ?auto_95914 ?auto_95918 ) ) ( not ( = ?auto_95915 ?auto_95918 ) ) ( not ( = ?auto_95914 ?auto_95919 ) ) ( not ( = ?auto_95914 ?auto_95917 ) ) ( not ( = ?auto_95915 ?auto_95919 ) ) ( not ( = ?auto_95915 ?auto_95917 ) ) ( not ( = ?auto_95918 ?auto_95919 ) ) ( not ( = ?auto_95918 ?auto_95917 ) ) ( not ( = ?auto_95919 ?auto_95917 ) ) ( ON ?auto_95919 ?auto_95918 ) ( ON-TABLE ?auto_95920 ) ( not ( = ?auto_95920 ?auto_95916 ) ) ( not ( = ?auto_95920 ?auto_95917 ) ) ( not ( = ?auto_95916 ?auto_95917 ) ) ( not ( = ?auto_95914 ?auto_95916 ) ) ( not ( = ?auto_95914 ?auto_95920 ) ) ( not ( = ?auto_95915 ?auto_95916 ) ) ( not ( = ?auto_95915 ?auto_95920 ) ) ( not ( = ?auto_95918 ?auto_95916 ) ) ( not ( = ?auto_95918 ?auto_95920 ) ) ( not ( = ?auto_95919 ?auto_95916 ) ) ( not ( = ?auto_95919 ?auto_95920 ) ) ( ON ?auto_95917 ?auto_95919 ) ( CLEAR ?auto_95917 ) ( HOLDING ?auto_95916 ) ( CLEAR ?auto_95920 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95920 ?auto_95916 )
      ( MAKE-2PILE ?auto_95914 ?auto_95915 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95921 - BLOCK
      ?auto_95922 - BLOCK
    )
    :vars
    (
      ?auto_95927 - BLOCK
      ?auto_95923 - BLOCK
      ?auto_95926 - BLOCK
      ?auto_95924 - BLOCK
      ?auto_95925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95927 ?auto_95922 ) ( ON-TABLE ?auto_95921 ) ( ON ?auto_95922 ?auto_95921 ) ( not ( = ?auto_95921 ?auto_95922 ) ) ( not ( = ?auto_95921 ?auto_95927 ) ) ( not ( = ?auto_95922 ?auto_95927 ) ) ( not ( = ?auto_95921 ?auto_95923 ) ) ( not ( = ?auto_95921 ?auto_95926 ) ) ( not ( = ?auto_95922 ?auto_95923 ) ) ( not ( = ?auto_95922 ?auto_95926 ) ) ( not ( = ?auto_95927 ?auto_95923 ) ) ( not ( = ?auto_95927 ?auto_95926 ) ) ( not ( = ?auto_95923 ?auto_95926 ) ) ( ON ?auto_95923 ?auto_95927 ) ( ON-TABLE ?auto_95924 ) ( not ( = ?auto_95924 ?auto_95925 ) ) ( not ( = ?auto_95924 ?auto_95926 ) ) ( not ( = ?auto_95925 ?auto_95926 ) ) ( not ( = ?auto_95921 ?auto_95925 ) ) ( not ( = ?auto_95921 ?auto_95924 ) ) ( not ( = ?auto_95922 ?auto_95925 ) ) ( not ( = ?auto_95922 ?auto_95924 ) ) ( not ( = ?auto_95927 ?auto_95925 ) ) ( not ( = ?auto_95927 ?auto_95924 ) ) ( not ( = ?auto_95923 ?auto_95925 ) ) ( not ( = ?auto_95923 ?auto_95924 ) ) ( ON ?auto_95926 ?auto_95923 ) ( CLEAR ?auto_95924 ) ( ON ?auto_95925 ?auto_95926 ) ( CLEAR ?auto_95925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95921 ?auto_95922 ?auto_95927 ?auto_95923 ?auto_95926 )
      ( MAKE-2PILE ?auto_95921 ?auto_95922 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95928 - BLOCK
      ?auto_95929 - BLOCK
    )
    :vars
    (
      ?auto_95934 - BLOCK
      ?auto_95930 - BLOCK
      ?auto_95932 - BLOCK
      ?auto_95931 - BLOCK
      ?auto_95933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95934 ?auto_95929 ) ( ON-TABLE ?auto_95928 ) ( ON ?auto_95929 ?auto_95928 ) ( not ( = ?auto_95928 ?auto_95929 ) ) ( not ( = ?auto_95928 ?auto_95934 ) ) ( not ( = ?auto_95929 ?auto_95934 ) ) ( not ( = ?auto_95928 ?auto_95930 ) ) ( not ( = ?auto_95928 ?auto_95932 ) ) ( not ( = ?auto_95929 ?auto_95930 ) ) ( not ( = ?auto_95929 ?auto_95932 ) ) ( not ( = ?auto_95934 ?auto_95930 ) ) ( not ( = ?auto_95934 ?auto_95932 ) ) ( not ( = ?auto_95930 ?auto_95932 ) ) ( ON ?auto_95930 ?auto_95934 ) ( not ( = ?auto_95931 ?auto_95933 ) ) ( not ( = ?auto_95931 ?auto_95932 ) ) ( not ( = ?auto_95933 ?auto_95932 ) ) ( not ( = ?auto_95928 ?auto_95933 ) ) ( not ( = ?auto_95928 ?auto_95931 ) ) ( not ( = ?auto_95929 ?auto_95933 ) ) ( not ( = ?auto_95929 ?auto_95931 ) ) ( not ( = ?auto_95934 ?auto_95933 ) ) ( not ( = ?auto_95934 ?auto_95931 ) ) ( not ( = ?auto_95930 ?auto_95933 ) ) ( not ( = ?auto_95930 ?auto_95931 ) ) ( ON ?auto_95932 ?auto_95930 ) ( ON ?auto_95933 ?auto_95932 ) ( CLEAR ?auto_95933 ) ( HOLDING ?auto_95931 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95931 )
      ( MAKE-2PILE ?auto_95928 ?auto_95929 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95944 - BLOCK
      ?auto_95945 - BLOCK
    )
    :vars
    (
      ?auto_95950 - BLOCK
      ?auto_95947 - BLOCK
      ?auto_95948 - BLOCK
      ?auto_95946 - BLOCK
      ?auto_95949 - BLOCK
      ?auto_95951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95950 ?auto_95945 ) ( ON-TABLE ?auto_95944 ) ( ON ?auto_95945 ?auto_95944 ) ( not ( = ?auto_95944 ?auto_95945 ) ) ( not ( = ?auto_95944 ?auto_95950 ) ) ( not ( = ?auto_95945 ?auto_95950 ) ) ( not ( = ?auto_95944 ?auto_95947 ) ) ( not ( = ?auto_95944 ?auto_95948 ) ) ( not ( = ?auto_95945 ?auto_95947 ) ) ( not ( = ?auto_95945 ?auto_95948 ) ) ( not ( = ?auto_95950 ?auto_95947 ) ) ( not ( = ?auto_95950 ?auto_95948 ) ) ( not ( = ?auto_95947 ?auto_95948 ) ) ( ON ?auto_95947 ?auto_95950 ) ( not ( = ?auto_95946 ?auto_95949 ) ) ( not ( = ?auto_95946 ?auto_95948 ) ) ( not ( = ?auto_95949 ?auto_95948 ) ) ( not ( = ?auto_95944 ?auto_95949 ) ) ( not ( = ?auto_95944 ?auto_95946 ) ) ( not ( = ?auto_95945 ?auto_95949 ) ) ( not ( = ?auto_95945 ?auto_95946 ) ) ( not ( = ?auto_95950 ?auto_95949 ) ) ( not ( = ?auto_95950 ?auto_95946 ) ) ( not ( = ?auto_95947 ?auto_95949 ) ) ( not ( = ?auto_95947 ?auto_95946 ) ) ( ON ?auto_95948 ?auto_95947 ) ( ON ?auto_95949 ?auto_95948 ) ( CLEAR ?auto_95949 ) ( ON ?auto_95946 ?auto_95951 ) ( CLEAR ?auto_95946 ) ( HAND-EMPTY ) ( not ( = ?auto_95944 ?auto_95951 ) ) ( not ( = ?auto_95945 ?auto_95951 ) ) ( not ( = ?auto_95950 ?auto_95951 ) ) ( not ( = ?auto_95947 ?auto_95951 ) ) ( not ( = ?auto_95948 ?auto_95951 ) ) ( not ( = ?auto_95946 ?auto_95951 ) ) ( not ( = ?auto_95949 ?auto_95951 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95946 ?auto_95951 )
      ( MAKE-2PILE ?auto_95944 ?auto_95945 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95952 - BLOCK
      ?auto_95953 - BLOCK
    )
    :vars
    (
      ?auto_95954 - BLOCK
      ?auto_95956 - BLOCK
      ?auto_95955 - BLOCK
      ?auto_95957 - BLOCK
      ?auto_95959 - BLOCK
      ?auto_95958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95954 ?auto_95953 ) ( ON-TABLE ?auto_95952 ) ( ON ?auto_95953 ?auto_95952 ) ( not ( = ?auto_95952 ?auto_95953 ) ) ( not ( = ?auto_95952 ?auto_95954 ) ) ( not ( = ?auto_95953 ?auto_95954 ) ) ( not ( = ?auto_95952 ?auto_95956 ) ) ( not ( = ?auto_95952 ?auto_95955 ) ) ( not ( = ?auto_95953 ?auto_95956 ) ) ( not ( = ?auto_95953 ?auto_95955 ) ) ( not ( = ?auto_95954 ?auto_95956 ) ) ( not ( = ?auto_95954 ?auto_95955 ) ) ( not ( = ?auto_95956 ?auto_95955 ) ) ( ON ?auto_95956 ?auto_95954 ) ( not ( = ?auto_95957 ?auto_95959 ) ) ( not ( = ?auto_95957 ?auto_95955 ) ) ( not ( = ?auto_95959 ?auto_95955 ) ) ( not ( = ?auto_95952 ?auto_95959 ) ) ( not ( = ?auto_95952 ?auto_95957 ) ) ( not ( = ?auto_95953 ?auto_95959 ) ) ( not ( = ?auto_95953 ?auto_95957 ) ) ( not ( = ?auto_95954 ?auto_95959 ) ) ( not ( = ?auto_95954 ?auto_95957 ) ) ( not ( = ?auto_95956 ?auto_95959 ) ) ( not ( = ?auto_95956 ?auto_95957 ) ) ( ON ?auto_95955 ?auto_95956 ) ( ON ?auto_95957 ?auto_95958 ) ( CLEAR ?auto_95957 ) ( not ( = ?auto_95952 ?auto_95958 ) ) ( not ( = ?auto_95953 ?auto_95958 ) ) ( not ( = ?auto_95954 ?auto_95958 ) ) ( not ( = ?auto_95956 ?auto_95958 ) ) ( not ( = ?auto_95955 ?auto_95958 ) ) ( not ( = ?auto_95957 ?auto_95958 ) ) ( not ( = ?auto_95959 ?auto_95958 ) ) ( HOLDING ?auto_95959 ) ( CLEAR ?auto_95955 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95952 ?auto_95953 ?auto_95954 ?auto_95956 ?auto_95955 ?auto_95959 )
      ( MAKE-2PILE ?auto_95952 ?auto_95953 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95960 - BLOCK
      ?auto_95961 - BLOCK
    )
    :vars
    (
      ?auto_95965 - BLOCK
      ?auto_95962 - BLOCK
      ?auto_95964 - BLOCK
      ?auto_95967 - BLOCK
      ?auto_95966 - BLOCK
      ?auto_95963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95965 ?auto_95961 ) ( ON-TABLE ?auto_95960 ) ( ON ?auto_95961 ?auto_95960 ) ( not ( = ?auto_95960 ?auto_95961 ) ) ( not ( = ?auto_95960 ?auto_95965 ) ) ( not ( = ?auto_95961 ?auto_95965 ) ) ( not ( = ?auto_95960 ?auto_95962 ) ) ( not ( = ?auto_95960 ?auto_95964 ) ) ( not ( = ?auto_95961 ?auto_95962 ) ) ( not ( = ?auto_95961 ?auto_95964 ) ) ( not ( = ?auto_95965 ?auto_95962 ) ) ( not ( = ?auto_95965 ?auto_95964 ) ) ( not ( = ?auto_95962 ?auto_95964 ) ) ( ON ?auto_95962 ?auto_95965 ) ( not ( = ?auto_95967 ?auto_95966 ) ) ( not ( = ?auto_95967 ?auto_95964 ) ) ( not ( = ?auto_95966 ?auto_95964 ) ) ( not ( = ?auto_95960 ?auto_95966 ) ) ( not ( = ?auto_95960 ?auto_95967 ) ) ( not ( = ?auto_95961 ?auto_95966 ) ) ( not ( = ?auto_95961 ?auto_95967 ) ) ( not ( = ?auto_95965 ?auto_95966 ) ) ( not ( = ?auto_95965 ?auto_95967 ) ) ( not ( = ?auto_95962 ?auto_95966 ) ) ( not ( = ?auto_95962 ?auto_95967 ) ) ( ON ?auto_95964 ?auto_95962 ) ( ON ?auto_95967 ?auto_95963 ) ( not ( = ?auto_95960 ?auto_95963 ) ) ( not ( = ?auto_95961 ?auto_95963 ) ) ( not ( = ?auto_95965 ?auto_95963 ) ) ( not ( = ?auto_95962 ?auto_95963 ) ) ( not ( = ?auto_95964 ?auto_95963 ) ) ( not ( = ?auto_95967 ?auto_95963 ) ) ( not ( = ?auto_95966 ?auto_95963 ) ) ( CLEAR ?auto_95964 ) ( ON ?auto_95966 ?auto_95967 ) ( CLEAR ?auto_95966 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95963 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95963 ?auto_95967 )
      ( MAKE-2PILE ?auto_95960 ?auto_95961 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95968 - BLOCK
      ?auto_95969 - BLOCK
    )
    :vars
    (
      ?auto_95974 - BLOCK
      ?auto_95970 - BLOCK
      ?auto_95972 - BLOCK
      ?auto_95975 - BLOCK
      ?auto_95973 - BLOCK
      ?auto_95971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95974 ?auto_95969 ) ( ON-TABLE ?auto_95968 ) ( ON ?auto_95969 ?auto_95968 ) ( not ( = ?auto_95968 ?auto_95969 ) ) ( not ( = ?auto_95968 ?auto_95974 ) ) ( not ( = ?auto_95969 ?auto_95974 ) ) ( not ( = ?auto_95968 ?auto_95970 ) ) ( not ( = ?auto_95968 ?auto_95972 ) ) ( not ( = ?auto_95969 ?auto_95970 ) ) ( not ( = ?auto_95969 ?auto_95972 ) ) ( not ( = ?auto_95974 ?auto_95970 ) ) ( not ( = ?auto_95974 ?auto_95972 ) ) ( not ( = ?auto_95970 ?auto_95972 ) ) ( ON ?auto_95970 ?auto_95974 ) ( not ( = ?auto_95975 ?auto_95973 ) ) ( not ( = ?auto_95975 ?auto_95972 ) ) ( not ( = ?auto_95973 ?auto_95972 ) ) ( not ( = ?auto_95968 ?auto_95973 ) ) ( not ( = ?auto_95968 ?auto_95975 ) ) ( not ( = ?auto_95969 ?auto_95973 ) ) ( not ( = ?auto_95969 ?auto_95975 ) ) ( not ( = ?auto_95974 ?auto_95973 ) ) ( not ( = ?auto_95974 ?auto_95975 ) ) ( not ( = ?auto_95970 ?auto_95973 ) ) ( not ( = ?auto_95970 ?auto_95975 ) ) ( ON ?auto_95975 ?auto_95971 ) ( not ( = ?auto_95968 ?auto_95971 ) ) ( not ( = ?auto_95969 ?auto_95971 ) ) ( not ( = ?auto_95974 ?auto_95971 ) ) ( not ( = ?auto_95970 ?auto_95971 ) ) ( not ( = ?auto_95972 ?auto_95971 ) ) ( not ( = ?auto_95975 ?auto_95971 ) ) ( not ( = ?auto_95973 ?auto_95971 ) ) ( ON ?auto_95973 ?auto_95975 ) ( CLEAR ?auto_95973 ) ( ON-TABLE ?auto_95971 ) ( HOLDING ?auto_95972 ) ( CLEAR ?auto_95970 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95968 ?auto_95969 ?auto_95974 ?auto_95970 ?auto_95972 )
      ( MAKE-2PILE ?auto_95968 ?auto_95969 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96019 - BLOCK
      ?auto_96020 - BLOCK
      ?auto_96021 - BLOCK
      ?auto_96022 - BLOCK
      ?auto_96023 - BLOCK
    )
    :vars
    (
      ?auto_96024 - BLOCK
      ?auto_96025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96019 ) ( ON ?auto_96020 ?auto_96019 ) ( ON ?auto_96021 ?auto_96020 ) ( not ( = ?auto_96019 ?auto_96020 ) ) ( not ( = ?auto_96019 ?auto_96021 ) ) ( not ( = ?auto_96019 ?auto_96022 ) ) ( not ( = ?auto_96019 ?auto_96023 ) ) ( not ( = ?auto_96020 ?auto_96021 ) ) ( not ( = ?auto_96020 ?auto_96022 ) ) ( not ( = ?auto_96020 ?auto_96023 ) ) ( not ( = ?auto_96021 ?auto_96022 ) ) ( not ( = ?auto_96021 ?auto_96023 ) ) ( not ( = ?auto_96022 ?auto_96023 ) ) ( ON ?auto_96023 ?auto_96024 ) ( not ( = ?auto_96019 ?auto_96024 ) ) ( not ( = ?auto_96020 ?auto_96024 ) ) ( not ( = ?auto_96021 ?auto_96024 ) ) ( not ( = ?auto_96022 ?auto_96024 ) ) ( not ( = ?auto_96023 ?auto_96024 ) ) ( CLEAR ?auto_96021 ) ( ON ?auto_96022 ?auto_96023 ) ( CLEAR ?auto_96022 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96025 ) ( ON ?auto_96024 ?auto_96025 ) ( not ( = ?auto_96025 ?auto_96024 ) ) ( not ( = ?auto_96025 ?auto_96023 ) ) ( not ( = ?auto_96025 ?auto_96022 ) ) ( not ( = ?auto_96019 ?auto_96025 ) ) ( not ( = ?auto_96020 ?auto_96025 ) ) ( not ( = ?auto_96021 ?auto_96025 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96025 ?auto_96024 ?auto_96023 )
      ( MAKE-5PILE ?auto_96019 ?auto_96020 ?auto_96021 ?auto_96022 ?auto_96023 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96026 - BLOCK
      ?auto_96027 - BLOCK
      ?auto_96028 - BLOCK
      ?auto_96029 - BLOCK
      ?auto_96030 - BLOCK
    )
    :vars
    (
      ?auto_96032 - BLOCK
      ?auto_96031 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96026 ) ( ON ?auto_96027 ?auto_96026 ) ( not ( = ?auto_96026 ?auto_96027 ) ) ( not ( = ?auto_96026 ?auto_96028 ) ) ( not ( = ?auto_96026 ?auto_96029 ) ) ( not ( = ?auto_96026 ?auto_96030 ) ) ( not ( = ?auto_96027 ?auto_96028 ) ) ( not ( = ?auto_96027 ?auto_96029 ) ) ( not ( = ?auto_96027 ?auto_96030 ) ) ( not ( = ?auto_96028 ?auto_96029 ) ) ( not ( = ?auto_96028 ?auto_96030 ) ) ( not ( = ?auto_96029 ?auto_96030 ) ) ( ON ?auto_96030 ?auto_96032 ) ( not ( = ?auto_96026 ?auto_96032 ) ) ( not ( = ?auto_96027 ?auto_96032 ) ) ( not ( = ?auto_96028 ?auto_96032 ) ) ( not ( = ?auto_96029 ?auto_96032 ) ) ( not ( = ?auto_96030 ?auto_96032 ) ) ( ON ?auto_96029 ?auto_96030 ) ( CLEAR ?auto_96029 ) ( ON-TABLE ?auto_96031 ) ( ON ?auto_96032 ?auto_96031 ) ( not ( = ?auto_96031 ?auto_96032 ) ) ( not ( = ?auto_96031 ?auto_96030 ) ) ( not ( = ?auto_96031 ?auto_96029 ) ) ( not ( = ?auto_96026 ?auto_96031 ) ) ( not ( = ?auto_96027 ?auto_96031 ) ) ( not ( = ?auto_96028 ?auto_96031 ) ) ( HOLDING ?auto_96028 ) ( CLEAR ?auto_96027 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96026 ?auto_96027 ?auto_96028 )
      ( MAKE-5PILE ?auto_96026 ?auto_96027 ?auto_96028 ?auto_96029 ?auto_96030 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96033 - BLOCK
      ?auto_96034 - BLOCK
      ?auto_96035 - BLOCK
      ?auto_96036 - BLOCK
      ?auto_96037 - BLOCK
    )
    :vars
    (
      ?auto_96038 - BLOCK
      ?auto_96039 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96033 ) ( ON ?auto_96034 ?auto_96033 ) ( not ( = ?auto_96033 ?auto_96034 ) ) ( not ( = ?auto_96033 ?auto_96035 ) ) ( not ( = ?auto_96033 ?auto_96036 ) ) ( not ( = ?auto_96033 ?auto_96037 ) ) ( not ( = ?auto_96034 ?auto_96035 ) ) ( not ( = ?auto_96034 ?auto_96036 ) ) ( not ( = ?auto_96034 ?auto_96037 ) ) ( not ( = ?auto_96035 ?auto_96036 ) ) ( not ( = ?auto_96035 ?auto_96037 ) ) ( not ( = ?auto_96036 ?auto_96037 ) ) ( ON ?auto_96037 ?auto_96038 ) ( not ( = ?auto_96033 ?auto_96038 ) ) ( not ( = ?auto_96034 ?auto_96038 ) ) ( not ( = ?auto_96035 ?auto_96038 ) ) ( not ( = ?auto_96036 ?auto_96038 ) ) ( not ( = ?auto_96037 ?auto_96038 ) ) ( ON ?auto_96036 ?auto_96037 ) ( ON-TABLE ?auto_96039 ) ( ON ?auto_96038 ?auto_96039 ) ( not ( = ?auto_96039 ?auto_96038 ) ) ( not ( = ?auto_96039 ?auto_96037 ) ) ( not ( = ?auto_96039 ?auto_96036 ) ) ( not ( = ?auto_96033 ?auto_96039 ) ) ( not ( = ?auto_96034 ?auto_96039 ) ) ( not ( = ?auto_96035 ?auto_96039 ) ) ( CLEAR ?auto_96034 ) ( ON ?auto_96035 ?auto_96036 ) ( CLEAR ?auto_96035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96039 ?auto_96038 ?auto_96037 ?auto_96036 )
      ( MAKE-5PILE ?auto_96033 ?auto_96034 ?auto_96035 ?auto_96036 ?auto_96037 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96040 - BLOCK
      ?auto_96041 - BLOCK
      ?auto_96042 - BLOCK
      ?auto_96043 - BLOCK
      ?auto_96044 - BLOCK
    )
    :vars
    (
      ?auto_96045 - BLOCK
      ?auto_96046 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96040 ) ( not ( = ?auto_96040 ?auto_96041 ) ) ( not ( = ?auto_96040 ?auto_96042 ) ) ( not ( = ?auto_96040 ?auto_96043 ) ) ( not ( = ?auto_96040 ?auto_96044 ) ) ( not ( = ?auto_96041 ?auto_96042 ) ) ( not ( = ?auto_96041 ?auto_96043 ) ) ( not ( = ?auto_96041 ?auto_96044 ) ) ( not ( = ?auto_96042 ?auto_96043 ) ) ( not ( = ?auto_96042 ?auto_96044 ) ) ( not ( = ?auto_96043 ?auto_96044 ) ) ( ON ?auto_96044 ?auto_96045 ) ( not ( = ?auto_96040 ?auto_96045 ) ) ( not ( = ?auto_96041 ?auto_96045 ) ) ( not ( = ?auto_96042 ?auto_96045 ) ) ( not ( = ?auto_96043 ?auto_96045 ) ) ( not ( = ?auto_96044 ?auto_96045 ) ) ( ON ?auto_96043 ?auto_96044 ) ( ON-TABLE ?auto_96046 ) ( ON ?auto_96045 ?auto_96046 ) ( not ( = ?auto_96046 ?auto_96045 ) ) ( not ( = ?auto_96046 ?auto_96044 ) ) ( not ( = ?auto_96046 ?auto_96043 ) ) ( not ( = ?auto_96040 ?auto_96046 ) ) ( not ( = ?auto_96041 ?auto_96046 ) ) ( not ( = ?auto_96042 ?auto_96046 ) ) ( ON ?auto_96042 ?auto_96043 ) ( CLEAR ?auto_96042 ) ( HOLDING ?auto_96041 ) ( CLEAR ?auto_96040 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96040 ?auto_96041 )
      ( MAKE-5PILE ?auto_96040 ?auto_96041 ?auto_96042 ?auto_96043 ?auto_96044 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96047 - BLOCK
      ?auto_96048 - BLOCK
      ?auto_96049 - BLOCK
      ?auto_96050 - BLOCK
      ?auto_96051 - BLOCK
    )
    :vars
    (
      ?auto_96052 - BLOCK
      ?auto_96053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96047 ) ( not ( = ?auto_96047 ?auto_96048 ) ) ( not ( = ?auto_96047 ?auto_96049 ) ) ( not ( = ?auto_96047 ?auto_96050 ) ) ( not ( = ?auto_96047 ?auto_96051 ) ) ( not ( = ?auto_96048 ?auto_96049 ) ) ( not ( = ?auto_96048 ?auto_96050 ) ) ( not ( = ?auto_96048 ?auto_96051 ) ) ( not ( = ?auto_96049 ?auto_96050 ) ) ( not ( = ?auto_96049 ?auto_96051 ) ) ( not ( = ?auto_96050 ?auto_96051 ) ) ( ON ?auto_96051 ?auto_96052 ) ( not ( = ?auto_96047 ?auto_96052 ) ) ( not ( = ?auto_96048 ?auto_96052 ) ) ( not ( = ?auto_96049 ?auto_96052 ) ) ( not ( = ?auto_96050 ?auto_96052 ) ) ( not ( = ?auto_96051 ?auto_96052 ) ) ( ON ?auto_96050 ?auto_96051 ) ( ON-TABLE ?auto_96053 ) ( ON ?auto_96052 ?auto_96053 ) ( not ( = ?auto_96053 ?auto_96052 ) ) ( not ( = ?auto_96053 ?auto_96051 ) ) ( not ( = ?auto_96053 ?auto_96050 ) ) ( not ( = ?auto_96047 ?auto_96053 ) ) ( not ( = ?auto_96048 ?auto_96053 ) ) ( not ( = ?auto_96049 ?auto_96053 ) ) ( ON ?auto_96049 ?auto_96050 ) ( CLEAR ?auto_96047 ) ( ON ?auto_96048 ?auto_96049 ) ( CLEAR ?auto_96048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96053 ?auto_96052 ?auto_96051 ?auto_96050 ?auto_96049 )
      ( MAKE-5PILE ?auto_96047 ?auto_96048 ?auto_96049 ?auto_96050 ?auto_96051 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96054 - BLOCK
      ?auto_96055 - BLOCK
      ?auto_96056 - BLOCK
      ?auto_96057 - BLOCK
      ?auto_96058 - BLOCK
    )
    :vars
    (
      ?auto_96060 - BLOCK
      ?auto_96059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96054 ?auto_96055 ) ) ( not ( = ?auto_96054 ?auto_96056 ) ) ( not ( = ?auto_96054 ?auto_96057 ) ) ( not ( = ?auto_96054 ?auto_96058 ) ) ( not ( = ?auto_96055 ?auto_96056 ) ) ( not ( = ?auto_96055 ?auto_96057 ) ) ( not ( = ?auto_96055 ?auto_96058 ) ) ( not ( = ?auto_96056 ?auto_96057 ) ) ( not ( = ?auto_96056 ?auto_96058 ) ) ( not ( = ?auto_96057 ?auto_96058 ) ) ( ON ?auto_96058 ?auto_96060 ) ( not ( = ?auto_96054 ?auto_96060 ) ) ( not ( = ?auto_96055 ?auto_96060 ) ) ( not ( = ?auto_96056 ?auto_96060 ) ) ( not ( = ?auto_96057 ?auto_96060 ) ) ( not ( = ?auto_96058 ?auto_96060 ) ) ( ON ?auto_96057 ?auto_96058 ) ( ON-TABLE ?auto_96059 ) ( ON ?auto_96060 ?auto_96059 ) ( not ( = ?auto_96059 ?auto_96060 ) ) ( not ( = ?auto_96059 ?auto_96058 ) ) ( not ( = ?auto_96059 ?auto_96057 ) ) ( not ( = ?auto_96054 ?auto_96059 ) ) ( not ( = ?auto_96055 ?auto_96059 ) ) ( not ( = ?auto_96056 ?auto_96059 ) ) ( ON ?auto_96056 ?auto_96057 ) ( ON ?auto_96055 ?auto_96056 ) ( CLEAR ?auto_96055 ) ( HOLDING ?auto_96054 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96054 )
      ( MAKE-5PILE ?auto_96054 ?auto_96055 ?auto_96056 ?auto_96057 ?auto_96058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96061 - BLOCK
      ?auto_96062 - BLOCK
      ?auto_96063 - BLOCK
      ?auto_96064 - BLOCK
      ?auto_96065 - BLOCK
    )
    :vars
    (
      ?auto_96066 - BLOCK
      ?auto_96067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96061 ?auto_96062 ) ) ( not ( = ?auto_96061 ?auto_96063 ) ) ( not ( = ?auto_96061 ?auto_96064 ) ) ( not ( = ?auto_96061 ?auto_96065 ) ) ( not ( = ?auto_96062 ?auto_96063 ) ) ( not ( = ?auto_96062 ?auto_96064 ) ) ( not ( = ?auto_96062 ?auto_96065 ) ) ( not ( = ?auto_96063 ?auto_96064 ) ) ( not ( = ?auto_96063 ?auto_96065 ) ) ( not ( = ?auto_96064 ?auto_96065 ) ) ( ON ?auto_96065 ?auto_96066 ) ( not ( = ?auto_96061 ?auto_96066 ) ) ( not ( = ?auto_96062 ?auto_96066 ) ) ( not ( = ?auto_96063 ?auto_96066 ) ) ( not ( = ?auto_96064 ?auto_96066 ) ) ( not ( = ?auto_96065 ?auto_96066 ) ) ( ON ?auto_96064 ?auto_96065 ) ( ON-TABLE ?auto_96067 ) ( ON ?auto_96066 ?auto_96067 ) ( not ( = ?auto_96067 ?auto_96066 ) ) ( not ( = ?auto_96067 ?auto_96065 ) ) ( not ( = ?auto_96067 ?auto_96064 ) ) ( not ( = ?auto_96061 ?auto_96067 ) ) ( not ( = ?auto_96062 ?auto_96067 ) ) ( not ( = ?auto_96063 ?auto_96067 ) ) ( ON ?auto_96063 ?auto_96064 ) ( ON ?auto_96062 ?auto_96063 ) ( ON ?auto_96061 ?auto_96062 ) ( CLEAR ?auto_96061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96067 ?auto_96066 ?auto_96065 ?auto_96064 ?auto_96063 ?auto_96062 )
      ( MAKE-5PILE ?auto_96061 ?auto_96062 ?auto_96063 ?auto_96064 ?auto_96065 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96073 - BLOCK
      ?auto_96074 - BLOCK
      ?auto_96075 - BLOCK
      ?auto_96076 - BLOCK
      ?auto_96077 - BLOCK
    )
    :vars
    (
      ?auto_96078 - BLOCK
      ?auto_96079 - BLOCK
      ?auto_96080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96073 ?auto_96074 ) ) ( not ( = ?auto_96073 ?auto_96075 ) ) ( not ( = ?auto_96073 ?auto_96076 ) ) ( not ( = ?auto_96073 ?auto_96077 ) ) ( not ( = ?auto_96074 ?auto_96075 ) ) ( not ( = ?auto_96074 ?auto_96076 ) ) ( not ( = ?auto_96074 ?auto_96077 ) ) ( not ( = ?auto_96075 ?auto_96076 ) ) ( not ( = ?auto_96075 ?auto_96077 ) ) ( not ( = ?auto_96076 ?auto_96077 ) ) ( ON ?auto_96077 ?auto_96078 ) ( not ( = ?auto_96073 ?auto_96078 ) ) ( not ( = ?auto_96074 ?auto_96078 ) ) ( not ( = ?auto_96075 ?auto_96078 ) ) ( not ( = ?auto_96076 ?auto_96078 ) ) ( not ( = ?auto_96077 ?auto_96078 ) ) ( ON ?auto_96076 ?auto_96077 ) ( ON-TABLE ?auto_96079 ) ( ON ?auto_96078 ?auto_96079 ) ( not ( = ?auto_96079 ?auto_96078 ) ) ( not ( = ?auto_96079 ?auto_96077 ) ) ( not ( = ?auto_96079 ?auto_96076 ) ) ( not ( = ?auto_96073 ?auto_96079 ) ) ( not ( = ?auto_96074 ?auto_96079 ) ) ( not ( = ?auto_96075 ?auto_96079 ) ) ( ON ?auto_96075 ?auto_96076 ) ( ON ?auto_96074 ?auto_96075 ) ( CLEAR ?auto_96074 ) ( ON ?auto_96073 ?auto_96080 ) ( CLEAR ?auto_96073 ) ( HAND-EMPTY ) ( not ( = ?auto_96073 ?auto_96080 ) ) ( not ( = ?auto_96074 ?auto_96080 ) ) ( not ( = ?auto_96075 ?auto_96080 ) ) ( not ( = ?auto_96076 ?auto_96080 ) ) ( not ( = ?auto_96077 ?auto_96080 ) ) ( not ( = ?auto_96078 ?auto_96080 ) ) ( not ( = ?auto_96079 ?auto_96080 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96073 ?auto_96080 )
      ( MAKE-5PILE ?auto_96073 ?auto_96074 ?auto_96075 ?auto_96076 ?auto_96077 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96081 - BLOCK
      ?auto_96082 - BLOCK
      ?auto_96083 - BLOCK
      ?auto_96084 - BLOCK
      ?auto_96085 - BLOCK
    )
    :vars
    (
      ?auto_96088 - BLOCK
      ?auto_96087 - BLOCK
      ?auto_96086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96081 ?auto_96082 ) ) ( not ( = ?auto_96081 ?auto_96083 ) ) ( not ( = ?auto_96081 ?auto_96084 ) ) ( not ( = ?auto_96081 ?auto_96085 ) ) ( not ( = ?auto_96082 ?auto_96083 ) ) ( not ( = ?auto_96082 ?auto_96084 ) ) ( not ( = ?auto_96082 ?auto_96085 ) ) ( not ( = ?auto_96083 ?auto_96084 ) ) ( not ( = ?auto_96083 ?auto_96085 ) ) ( not ( = ?auto_96084 ?auto_96085 ) ) ( ON ?auto_96085 ?auto_96088 ) ( not ( = ?auto_96081 ?auto_96088 ) ) ( not ( = ?auto_96082 ?auto_96088 ) ) ( not ( = ?auto_96083 ?auto_96088 ) ) ( not ( = ?auto_96084 ?auto_96088 ) ) ( not ( = ?auto_96085 ?auto_96088 ) ) ( ON ?auto_96084 ?auto_96085 ) ( ON-TABLE ?auto_96087 ) ( ON ?auto_96088 ?auto_96087 ) ( not ( = ?auto_96087 ?auto_96088 ) ) ( not ( = ?auto_96087 ?auto_96085 ) ) ( not ( = ?auto_96087 ?auto_96084 ) ) ( not ( = ?auto_96081 ?auto_96087 ) ) ( not ( = ?auto_96082 ?auto_96087 ) ) ( not ( = ?auto_96083 ?auto_96087 ) ) ( ON ?auto_96083 ?auto_96084 ) ( ON ?auto_96081 ?auto_96086 ) ( CLEAR ?auto_96081 ) ( not ( = ?auto_96081 ?auto_96086 ) ) ( not ( = ?auto_96082 ?auto_96086 ) ) ( not ( = ?auto_96083 ?auto_96086 ) ) ( not ( = ?auto_96084 ?auto_96086 ) ) ( not ( = ?auto_96085 ?auto_96086 ) ) ( not ( = ?auto_96088 ?auto_96086 ) ) ( not ( = ?auto_96087 ?auto_96086 ) ) ( HOLDING ?auto_96082 ) ( CLEAR ?auto_96083 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96087 ?auto_96088 ?auto_96085 ?auto_96084 ?auto_96083 ?auto_96082 )
      ( MAKE-5PILE ?auto_96081 ?auto_96082 ?auto_96083 ?auto_96084 ?auto_96085 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96089 - BLOCK
      ?auto_96090 - BLOCK
      ?auto_96091 - BLOCK
      ?auto_96092 - BLOCK
      ?auto_96093 - BLOCK
    )
    :vars
    (
      ?auto_96096 - BLOCK
      ?auto_96094 - BLOCK
      ?auto_96095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96089 ?auto_96090 ) ) ( not ( = ?auto_96089 ?auto_96091 ) ) ( not ( = ?auto_96089 ?auto_96092 ) ) ( not ( = ?auto_96089 ?auto_96093 ) ) ( not ( = ?auto_96090 ?auto_96091 ) ) ( not ( = ?auto_96090 ?auto_96092 ) ) ( not ( = ?auto_96090 ?auto_96093 ) ) ( not ( = ?auto_96091 ?auto_96092 ) ) ( not ( = ?auto_96091 ?auto_96093 ) ) ( not ( = ?auto_96092 ?auto_96093 ) ) ( ON ?auto_96093 ?auto_96096 ) ( not ( = ?auto_96089 ?auto_96096 ) ) ( not ( = ?auto_96090 ?auto_96096 ) ) ( not ( = ?auto_96091 ?auto_96096 ) ) ( not ( = ?auto_96092 ?auto_96096 ) ) ( not ( = ?auto_96093 ?auto_96096 ) ) ( ON ?auto_96092 ?auto_96093 ) ( ON-TABLE ?auto_96094 ) ( ON ?auto_96096 ?auto_96094 ) ( not ( = ?auto_96094 ?auto_96096 ) ) ( not ( = ?auto_96094 ?auto_96093 ) ) ( not ( = ?auto_96094 ?auto_96092 ) ) ( not ( = ?auto_96089 ?auto_96094 ) ) ( not ( = ?auto_96090 ?auto_96094 ) ) ( not ( = ?auto_96091 ?auto_96094 ) ) ( ON ?auto_96091 ?auto_96092 ) ( ON ?auto_96089 ?auto_96095 ) ( not ( = ?auto_96089 ?auto_96095 ) ) ( not ( = ?auto_96090 ?auto_96095 ) ) ( not ( = ?auto_96091 ?auto_96095 ) ) ( not ( = ?auto_96092 ?auto_96095 ) ) ( not ( = ?auto_96093 ?auto_96095 ) ) ( not ( = ?auto_96096 ?auto_96095 ) ) ( not ( = ?auto_96094 ?auto_96095 ) ) ( CLEAR ?auto_96091 ) ( ON ?auto_96090 ?auto_96089 ) ( CLEAR ?auto_96090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96095 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96095 ?auto_96089 )
      ( MAKE-5PILE ?auto_96089 ?auto_96090 ?auto_96091 ?auto_96092 ?auto_96093 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96097 - BLOCK
      ?auto_96098 - BLOCK
      ?auto_96099 - BLOCK
      ?auto_96100 - BLOCK
      ?auto_96101 - BLOCK
    )
    :vars
    (
      ?auto_96102 - BLOCK
      ?auto_96103 - BLOCK
      ?auto_96104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96097 ?auto_96098 ) ) ( not ( = ?auto_96097 ?auto_96099 ) ) ( not ( = ?auto_96097 ?auto_96100 ) ) ( not ( = ?auto_96097 ?auto_96101 ) ) ( not ( = ?auto_96098 ?auto_96099 ) ) ( not ( = ?auto_96098 ?auto_96100 ) ) ( not ( = ?auto_96098 ?auto_96101 ) ) ( not ( = ?auto_96099 ?auto_96100 ) ) ( not ( = ?auto_96099 ?auto_96101 ) ) ( not ( = ?auto_96100 ?auto_96101 ) ) ( ON ?auto_96101 ?auto_96102 ) ( not ( = ?auto_96097 ?auto_96102 ) ) ( not ( = ?auto_96098 ?auto_96102 ) ) ( not ( = ?auto_96099 ?auto_96102 ) ) ( not ( = ?auto_96100 ?auto_96102 ) ) ( not ( = ?auto_96101 ?auto_96102 ) ) ( ON ?auto_96100 ?auto_96101 ) ( ON-TABLE ?auto_96103 ) ( ON ?auto_96102 ?auto_96103 ) ( not ( = ?auto_96103 ?auto_96102 ) ) ( not ( = ?auto_96103 ?auto_96101 ) ) ( not ( = ?auto_96103 ?auto_96100 ) ) ( not ( = ?auto_96097 ?auto_96103 ) ) ( not ( = ?auto_96098 ?auto_96103 ) ) ( not ( = ?auto_96099 ?auto_96103 ) ) ( ON ?auto_96097 ?auto_96104 ) ( not ( = ?auto_96097 ?auto_96104 ) ) ( not ( = ?auto_96098 ?auto_96104 ) ) ( not ( = ?auto_96099 ?auto_96104 ) ) ( not ( = ?auto_96100 ?auto_96104 ) ) ( not ( = ?auto_96101 ?auto_96104 ) ) ( not ( = ?auto_96102 ?auto_96104 ) ) ( not ( = ?auto_96103 ?auto_96104 ) ) ( ON ?auto_96098 ?auto_96097 ) ( CLEAR ?auto_96098 ) ( ON-TABLE ?auto_96104 ) ( HOLDING ?auto_96099 ) ( CLEAR ?auto_96100 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96103 ?auto_96102 ?auto_96101 ?auto_96100 ?auto_96099 )
      ( MAKE-5PILE ?auto_96097 ?auto_96098 ?auto_96099 ?auto_96100 ?auto_96101 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96105 - BLOCK
      ?auto_96106 - BLOCK
      ?auto_96107 - BLOCK
      ?auto_96108 - BLOCK
      ?auto_96109 - BLOCK
    )
    :vars
    (
      ?auto_96110 - BLOCK
      ?auto_96112 - BLOCK
      ?auto_96111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96105 ?auto_96106 ) ) ( not ( = ?auto_96105 ?auto_96107 ) ) ( not ( = ?auto_96105 ?auto_96108 ) ) ( not ( = ?auto_96105 ?auto_96109 ) ) ( not ( = ?auto_96106 ?auto_96107 ) ) ( not ( = ?auto_96106 ?auto_96108 ) ) ( not ( = ?auto_96106 ?auto_96109 ) ) ( not ( = ?auto_96107 ?auto_96108 ) ) ( not ( = ?auto_96107 ?auto_96109 ) ) ( not ( = ?auto_96108 ?auto_96109 ) ) ( ON ?auto_96109 ?auto_96110 ) ( not ( = ?auto_96105 ?auto_96110 ) ) ( not ( = ?auto_96106 ?auto_96110 ) ) ( not ( = ?auto_96107 ?auto_96110 ) ) ( not ( = ?auto_96108 ?auto_96110 ) ) ( not ( = ?auto_96109 ?auto_96110 ) ) ( ON ?auto_96108 ?auto_96109 ) ( ON-TABLE ?auto_96112 ) ( ON ?auto_96110 ?auto_96112 ) ( not ( = ?auto_96112 ?auto_96110 ) ) ( not ( = ?auto_96112 ?auto_96109 ) ) ( not ( = ?auto_96112 ?auto_96108 ) ) ( not ( = ?auto_96105 ?auto_96112 ) ) ( not ( = ?auto_96106 ?auto_96112 ) ) ( not ( = ?auto_96107 ?auto_96112 ) ) ( ON ?auto_96105 ?auto_96111 ) ( not ( = ?auto_96105 ?auto_96111 ) ) ( not ( = ?auto_96106 ?auto_96111 ) ) ( not ( = ?auto_96107 ?auto_96111 ) ) ( not ( = ?auto_96108 ?auto_96111 ) ) ( not ( = ?auto_96109 ?auto_96111 ) ) ( not ( = ?auto_96110 ?auto_96111 ) ) ( not ( = ?auto_96112 ?auto_96111 ) ) ( ON ?auto_96106 ?auto_96105 ) ( ON-TABLE ?auto_96111 ) ( CLEAR ?auto_96108 ) ( ON ?auto_96107 ?auto_96106 ) ( CLEAR ?auto_96107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96111 ?auto_96105 ?auto_96106 )
      ( MAKE-5PILE ?auto_96105 ?auto_96106 ?auto_96107 ?auto_96108 ?auto_96109 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96113 - BLOCK
      ?auto_96114 - BLOCK
      ?auto_96115 - BLOCK
      ?auto_96116 - BLOCK
      ?auto_96117 - BLOCK
    )
    :vars
    (
      ?auto_96119 - BLOCK
      ?auto_96118 - BLOCK
      ?auto_96120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96113 ?auto_96114 ) ) ( not ( = ?auto_96113 ?auto_96115 ) ) ( not ( = ?auto_96113 ?auto_96116 ) ) ( not ( = ?auto_96113 ?auto_96117 ) ) ( not ( = ?auto_96114 ?auto_96115 ) ) ( not ( = ?auto_96114 ?auto_96116 ) ) ( not ( = ?auto_96114 ?auto_96117 ) ) ( not ( = ?auto_96115 ?auto_96116 ) ) ( not ( = ?auto_96115 ?auto_96117 ) ) ( not ( = ?auto_96116 ?auto_96117 ) ) ( ON ?auto_96117 ?auto_96119 ) ( not ( = ?auto_96113 ?auto_96119 ) ) ( not ( = ?auto_96114 ?auto_96119 ) ) ( not ( = ?auto_96115 ?auto_96119 ) ) ( not ( = ?auto_96116 ?auto_96119 ) ) ( not ( = ?auto_96117 ?auto_96119 ) ) ( ON-TABLE ?auto_96118 ) ( ON ?auto_96119 ?auto_96118 ) ( not ( = ?auto_96118 ?auto_96119 ) ) ( not ( = ?auto_96118 ?auto_96117 ) ) ( not ( = ?auto_96118 ?auto_96116 ) ) ( not ( = ?auto_96113 ?auto_96118 ) ) ( not ( = ?auto_96114 ?auto_96118 ) ) ( not ( = ?auto_96115 ?auto_96118 ) ) ( ON ?auto_96113 ?auto_96120 ) ( not ( = ?auto_96113 ?auto_96120 ) ) ( not ( = ?auto_96114 ?auto_96120 ) ) ( not ( = ?auto_96115 ?auto_96120 ) ) ( not ( = ?auto_96116 ?auto_96120 ) ) ( not ( = ?auto_96117 ?auto_96120 ) ) ( not ( = ?auto_96119 ?auto_96120 ) ) ( not ( = ?auto_96118 ?auto_96120 ) ) ( ON ?auto_96114 ?auto_96113 ) ( ON-TABLE ?auto_96120 ) ( ON ?auto_96115 ?auto_96114 ) ( CLEAR ?auto_96115 ) ( HOLDING ?auto_96116 ) ( CLEAR ?auto_96117 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96118 ?auto_96119 ?auto_96117 ?auto_96116 )
      ( MAKE-5PILE ?auto_96113 ?auto_96114 ?auto_96115 ?auto_96116 ?auto_96117 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96121 - BLOCK
      ?auto_96122 - BLOCK
      ?auto_96123 - BLOCK
      ?auto_96124 - BLOCK
      ?auto_96125 - BLOCK
    )
    :vars
    (
      ?auto_96128 - BLOCK
      ?auto_96127 - BLOCK
      ?auto_96126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96121 ?auto_96122 ) ) ( not ( = ?auto_96121 ?auto_96123 ) ) ( not ( = ?auto_96121 ?auto_96124 ) ) ( not ( = ?auto_96121 ?auto_96125 ) ) ( not ( = ?auto_96122 ?auto_96123 ) ) ( not ( = ?auto_96122 ?auto_96124 ) ) ( not ( = ?auto_96122 ?auto_96125 ) ) ( not ( = ?auto_96123 ?auto_96124 ) ) ( not ( = ?auto_96123 ?auto_96125 ) ) ( not ( = ?auto_96124 ?auto_96125 ) ) ( ON ?auto_96125 ?auto_96128 ) ( not ( = ?auto_96121 ?auto_96128 ) ) ( not ( = ?auto_96122 ?auto_96128 ) ) ( not ( = ?auto_96123 ?auto_96128 ) ) ( not ( = ?auto_96124 ?auto_96128 ) ) ( not ( = ?auto_96125 ?auto_96128 ) ) ( ON-TABLE ?auto_96127 ) ( ON ?auto_96128 ?auto_96127 ) ( not ( = ?auto_96127 ?auto_96128 ) ) ( not ( = ?auto_96127 ?auto_96125 ) ) ( not ( = ?auto_96127 ?auto_96124 ) ) ( not ( = ?auto_96121 ?auto_96127 ) ) ( not ( = ?auto_96122 ?auto_96127 ) ) ( not ( = ?auto_96123 ?auto_96127 ) ) ( ON ?auto_96121 ?auto_96126 ) ( not ( = ?auto_96121 ?auto_96126 ) ) ( not ( = ?auto_96122 ?auto_96126 ) ) ( not ( = ?auto_96123 ?auto_96126 ) ) ( not ( = ?auto_96124 ?auto_96126 ) ) ( not ( = ?auto_96125 ?auto_96126 ) ) ( not ( = ?auto_96128 ?auto_96126 ) ) ( not ( = ?auto_96127 ?auto_96126 ) ) ( ON ?auto_96122 ?auto_96121 ) ( ON-TABLE ?auto_96126 ) ( ON ?auto_96123 ?auto_96122 ) ( CLEAR ?auto_96125 ) ( ON ?auto_96124 ?auto_96123 ) ( CLEAR ?auto_96124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96126 ?auto_96121 ?auto_96122 ?auto_96123 )
      ( MAKE-5PILE ?auto_96121 ?auto_96122 ?auto_96123 ?auto_96124 ?auto_96125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96129 - BLOCK
      ?auto_96130 - BLOCK
      ?auto_96131 - BLOCK
      ?auto_96132 - BLOCK
      ?auto_96133 - BLOCK
    )
    :vars
    (
      ?auto_96136 - BLOCK
      ?auto_96135 - BLOCK
      ?auto_96134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96129 ?auto_96130 ) ) ( not ( = ?auto_96129 ?auto_96131 ) ) ( not ( = ?auto_96129 ?auto_96132 ) ) ( not ( = ?auto_96129 ?auto_96133 ) ) ( not ( = ?auto_96130 ?auto_96131 ) ) ( not ( = ?auto_96130 ?auto_96132 ) ) ( not ( = ?auto_96130 ?auto_96133 ) ) ( not ( = ?auto_96131 ?auto_96132 ) ) ( not ( = ?auto_96131 ?auto_96133 ) ) ( not ( = ?auto_96132 ?auto_96133 ) ) ( not ( = ?auto_96129 ?auto_96136 ) ) ( not ( = ?auto_96130 ?auto_96136 ) ) ( not ( = ?auto_96131 ?auto_96136 ) ) ( not ( = ?auto_96132 ?auto_96136 ) ) ( not ( = ?auto_96133 ?auto_96136 ) ) ( ON-TABLE ?auto_96135 ) ( ON ?auto_96136 ?auto_96135 ) ( not ( = ?auto_96135 ?auto_96136 ) ) ( not ( = ?auto_96135 ?auto_96133 ) ) ( not ( = ?auto_96135 ?auto_96132 ) ) ( not ( = ?auto_96129 ?auto_96135 ) ) ( not ( = ?auto_96130 ?auto_96135 ) ) ( not ( = ?auto_96131 ?auto_96135 ) ) ( ON ?auto_96129 ?auto_96134 ) ( not ( = ?auto_96129 ?auto_96134 ) ) ( not ( = ?auto_96130 ?auto_96134 ) ) ( not ( = ?auto_96131 ?auto_96134 ) ) ( not ( = ?auto_96132 ?auto_96134 ) ) ( not ( = ?auto_96133 ?auto_96134 ) ) ( not ( = ?auto_96136 ?auto_96134 ) ) ( not ( = ?auto_96135 ?auto_96134 ) ) ( ON ?auto_96130 ?auto_96129 ) ( ON-TABLE ?auto_96134 ) ( ON ?auto_96131 ?auto_96130 ) ( ON ?auto_96132 ?auto_96131 ) ( CLEAR ?auto_96132 ) ( HOLDING ?auto_96133 ) ( CLEAR ?auto_96136 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96135 ?auto_96136 ?auto_96133 )
      ( MAKE-5PILE ?auto_96129 ?auto_96130 ?auto_96131 ?auto_96132 ?auto_96133 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96137 - BLOCK
      ?auto_96138 - BLOCK
      ?auto_96139 - BLOCK
      ?auto_96140 - BLOCK
      ?auto_96141 - BLOCK
    )
    :vars
    (
      ?auto_96144 - BLOCK
      ?auto_96142 - BLOCK
      ?auto_96143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96137 ?auto_96138 ) ) ( not ( = ?auto_96137 ?auto_96139 ) ) ( not ( = ?auto_96137 ?auto_96140 ) ) ( not ( = ?auto_96137 ?auto_96141 ) ) ( not ( = ?auto_96138 ?auto_96139 ) ) ( not ( = ?auto_96138 ?auto_96140 ) ) ( not ( = ?auto_96138 ?auto_96141 ) ) ( not ( = ?auto_96139 ?auto_96140 ) ) ( not ( = ?auto_96139 ?auto_96141 ) ) ( not ( = ?auto_96140 ?auto_96141 ) ) ( not ( = ?auto_96137 ?auto_96144 ) ) ( not ( = ?auto_96138 ?auto_96144 ) ) ( not ( = ?auto_96139 ?auto_96144 ) ) ( not ( = ?auto_96140 ?auto_96144 ) ) ( not ( = ?auto_96141 ?auto_96144 ) ) ( ON-TABLE ?auto_96142 ) ( ON ?auto_96144 ?auto_96142 ) ( not ( = ?auto_96142 ?auto_96144 ) ) ( not ( = ?auto_96142 ?auto_96141 ) ) ( not ( = ?auto_96142 ?auto_96140 ) ) ( not ( = ?auto_96137 ?auto_96142 ) ) ( not ( = ?auto_96138 ?auto_96142 ) ) ( not ( = ?auto_96139 ?auto_96142 ) ) ( ON ?auto_96137 ?auto_96143 ) ( not ( = ?auto_96137 ?auto_96143 ) ) ( not ( = ?auto_96138 ?auto_96143 ) ) ( not ( = ?auto_96139 ?auto_96143 ) ) ( not ( = ?auto_96140 ?auto_96143 ) ) ( not ( = ?auto_96141 ?auto_96143 ) ) ( not ( = ?auto_96144 ?auto_96143 ) ) ( not ( = ?auto_96142 ?auto_96143 ) ) ( ON ?auto_96138 ?auto_96137 ) ( ON-TABLE ?auto_96143 ) ( ON ?auto_96139 ?auto_96138 ) ( ON ?auto_96140 ?auto_96139 ) ( CLEAR ?auto_96144 ) ( ON ?auto_96141 ?auto_96140 ) ( CLEAR ?auto_96141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96143 ?auto_96137 ?auto_96138 ?auto_96139 ?auto_96140 )
      ( MAKE-5PILE ?auto_96137 ?auto_96138 ?auto_96139 ?auto_96140 ?auto_96141 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96145 - BLOCK
      ?auto_96146 - BLOCK
      ?auto_96147 - BLOCK
      ?auto_96148 - BLOCK
      ?auto_96149 - BLOCK
    )
    :vars
    (
      ?auto_96151 - BLOCK
      ?auto_96150 - BLOCK
      ?auto_96152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96145 ?auto_96146 ) ) ( not ( = ?auto_96145 ?auto_96147 ) ) ( not ( = ?auto_96145 ?auto_96148 ) ) ( not ( = ?auto_96145 ?auto_96149 ) ) ( not ( = ?auto_96146 ?auto_96147 ) ) ( not ( = ?auto_96146 ?auto_96148 ) ) ( not ( = ?auto_96146 ?auto_96149 ) ) ( not ( = ?auto_96147 ?auto_96148 ) ) ( not ( = ?auto_96147 ?auto_96149 ) ) ( not ( = ?auto_96148 ?auto_96149 ) ) ( not ( = ?auto_96145 ?auto_96151 ) ) ( not ( = ?auto_96146 ?auto_96151 ) ) ( not ( = ?auto_96147 ?auto_96151 ) ) ( not ( = ?auto_96148 ?auto_96151 ) ) ( not ( = ?auto_96149 ?auto_96151 ) ) ( ON-TABLE ?auto_96150 ) ( not ( = ?auto_96150 ?auto_96151 ) ) ( not ( = ?auto_96150 ?auto_96149 ) ) ( not ( = ?auto_96150 ?auto_96148 ) ) ( not ( = ?auto_96145 ?auto_96150 ) ) ( not ( = ?auto_96146 ?auto_96150 ) ) ( not ( = ?auto_96147 ?auto_96150 ) ) ( ON ?auto_96145 ?auto_96152 ) ( not ( = ?auto_96145 ?auto_96152 ) ) ( not ( = ?auto_96146 ?auto_96152 ) ) ( not ( = ?auto_96147 ?auto_96152 ) ) ( not ( = ?auto_96148 ?auto_96152 ) ) ( not ( = ?auto_96149 ?auto_96152 ) ) ( not ( = ?auto_96151 ?auto_96152 ) ) ( not ( = ?auto_96150 ?auto_96152 ) ) ( ON ?auto_96146 ?auto_96145 ) ( ON-TABLE ?auto_96152 ) ( ON ?auto_96147 ?auto_96146 ) ( ON ?auto_96148 ?auto_96147 ) ( ON ?auto_96149 ?auto_96148 ) ( CLEAR ?auto_96149 ) ( HOLDING ?auto_96151 ) ( CLEAR ?auto_96150 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96150 ?auto_96151 )
      ( MAKE-5PILE ?auto_96145 ?auto_96146 ?auto_96147 ?auto_96148 ?auto_96149 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96153 - BLOCK
      ?auto_96154 - BLOCK
      ?auto_96155 - BLOCK
      ?auto_96156 - BLOCK
      ?auto_96157 - BLOCK
    )
    :vars
    (
      ?auto_96160 - BLOCK
      ?auto_96158 - BLOCK
      ?auto_96159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96153 ?auto_96154 ) ) ( not ( = ?auto_96153 ?auto_96155 ) ) ( not ( = ?auto_96153 ?auto_96156 ) ) ( not ( = ?auto_96153 ?auto_96157 ) ) ( not ( = ?auto_96154 ?auto_96155 ) ) ( not ( = ?auto_96154 ?auto_96156 ) ) ( not ( = ?auto_96154 ?auto_96157 ) ) ( not ( = ?auto_96155 ?auto_96156 ) ) ( not ( = ?auto_96155 ?auto_96157 ) ) ( not ( = ?auto_96156 ?auto_96157 ) ) ( not ( = ?auto_96153 ?auto_96160 ) ) ( not ( = ?auto_96154 ?auto_96160 ) ) ( not ( = ?auto_96155 ?auto_96160 ) ) ( not ( = ?auto_96156 ?auto_96160 ) ) ( not ( = ?auto_96157 ?auto_96160 ) ) ( ON-TABLE ?auto_96158 ) ( not ( = ?auto_96158 ?auto_96160 ) ) ( not ( = ?auto_96158 ?auto_96157 ) ) ( not ( = ?auto_96158 ?auto_96156 ) ) ( not ( = ?auto_96153 ?auto_96158 ) ) ( not ( = ?auto_96154 ?auto_96158 ) ) ( not ( = ?auto_96155 ?auto_96158 ) ) ( ON ?auto_96153 ?auto_96159 ) ( not ( = ?auto_96153 ?auto_96159 ) ) ( not ( = ?auto_96154 ?auto_96159 ) ) ( not ( = ?auto_96155 ?auto_96159 ) ) ( not ( = ?auto_96156 ?auto_96159 ) ) ( not ( = ?auto_96157 ?auto_96159 ) ) ( not ( = ?auto_96160 ?auto_96159 ) ) ( not ( = ?auto_96158 ?auto_96159 ) ) ( ON ?auto_96154 ?auto_96153 ) ( ON-TABLE ?auto_96159 ) ( ON ?auto_96155 ?auto_96154 ) ( ON ?auto_96156 ?auto_96155 ) ( ON ?auto_96157 ?auto_96156 ) ( CLEAR ?auto_96158 ) ( ON ?auto_96160 ?auto_96157 ) ( CLEAR ?auto_96160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96159 ?auto_96153 ?auto_96154 ?auto_96155 ?auto_96156 ?auto_96157 )
      ( MAKE-5PILE ?auto_96153 ?auto_96154 ?auto_96155 ?auto_96156 ?auto_96157 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96161 - BLOCK
      ?auto_96162 - BLOCK
      ?auto_96163 - BLOCK
      ?auto_96164 - BLOCK
      ?auto_96165 - BLOCK
    )
    :vars
    (
      ?auto_96167 - BLOCK
      ?auto_96168 - BLOCK
      ?auto_96166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96161 ?auto_96162 ) ) ( not ( = ?auto_96161 ?auto_96163 ) ) ( not ( = ?auto_96161 ?auto_96164 ) ) ( not ( = ?auto_96161 ?auto_96165 ) ) ( not ( = ?auto_96162 ?auto_96163 ) ) ( not ( = ?auto_96162 ?auto_96164 ) ) ( not ( = ?auto_96162 ?auto_96165 ) ) ( not ( = ?auto_96163 ?auto_96164 ) ) ( not ( = ?auto_96163 ?auto_96165 ) ) ( not ( = ?auto_96164 ?auto_96165 ) ) ( not ( = ?auto_96161 ?auto_96167 ) ) ( not ( = ?auto_96162 ?auto_96167 ) ) ( not ( = ?auto_96163 ?auto_96167 ) ) ( not ( = ?auto_96164 ?auto_96167 ) ) ( not ( = ?auto_96165 ?auto_96167 ) ) ( not ( = ?auto_96168 ?auto_96167 ) ) ( not ( = ?auto_96168 ?auto_96165 ) ) ( not ( = ?auto_96168 ?auto_96164 ) ) ( not ( = ?auto_96161 ?auto_96168 ) ) ( not ( = ?auto_96162 ?auto_96168 ) ) ( not ( = ?auto_96163 ?auto_96168 ) ) ( ON ?auto_96161 ?auto_96166 ) ( not ( = ?auto_96161 ?auto_96166 ) ) ( not ( = ?auto_96162 ?auto_96166 ) ) ( not ( = ?auto_96163 ?auto_96166 ) ) ( not ( = ?auto_96164 ?auto_96166 ) ) ( not ( = ?auto_96165 ?auto_96166 ) ) ( not ( = ?auto_96167 ?auto_96166 ) ) ( not ( = ?auto_96168 ?auto_96166 ) ) ( ON ?auto_96162 ?auto_96161 ) ( ON-TABLE ?auto_96166 ) ( ON ?auto_96163 ?auto_96162 ) ( ON ?auto_96164 ?auto_96163 ) ( ON ?auto_96165 ?auto_96164 ) ( ON ?auto_96167 ?auto_96165 ) ( CLEAR ?auto_96167 ) ( HOLDING ?auto_96168 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96168 )
      ( MAKE-5PILE ?auto_96161 ?auto_96162 ?auto_96163 ?auto_96164 ?auto_96165 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96169 - BLOCK
      ?auto_96170 - BLOCK
      ?auto_96171 - BLOCK
      ?auto_96172 - BLOCK
      ?auto_96173 - BLOCK
    )
    :vars
    (
      ?auto_96175 - BLOCK
      ?auto_96176 - BLOCK
      ?auto_96174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96169 ?auto_96170 ) ) ( not ( = ?auto_96169 ?auto_96171 ) ) ( not ( = ?auto_96169 ?auto_96172 ) ) ( not ( = ?auto_96169 ?auto_96173 ) ) ( not ( = ?auto_96170 ?auto_96171 ) ) ( not ( = ?auto_96170 ?auto_96172 ) ) ( not ( = ?auto_96170 ?auto_96173 ) ) ( not ( = ?auto_96171 ?auto_96172 ) ) ( not ( = ?auto_96171 ?auto_96173 ) ) ( not ( = ?auto_96172 ?auto_96173 ) ) ( not ( = ?auto_96169 ?auto_96175 ) ) ( not ( = ?auto_96170 ?auto_96175 ) ) ( not ( = ?auto_96171 ?auto_96175 ) ) ( not ( = ?auto_96172 ?auto_96175 ) ) ( not ( = ?auto_96173 ?auto_96175 ) ) ( not ( = ?auto_96176 ?auto_96175 ) ) ( not ( = ?auto_96176 ?auto_96173 ) ) ( not ( = ?auto_96176 ?auto_96172 ) ) ( not ( = ?auto_96169 ?auto_96176 ) ) ( not ( = ?auto_96170 ?auto_96176 ) ) ( not ( = ?auto_96171 ?auto_96176 ) ) ( ON ?auto_96169 ?auto_96174 ) ( not ( = ?auto_96169 ?auto_96174 ) ) ( not ( = ?auto_96170 ?auto_96174 ) ) ( not ( = ?auto_96171 ?auto_96174 ) ) ( not ( = ?auto_96172 ?auto_96174 ) ) ( not ( = ?auto_96173 ?auto_96174 ) ) ( not ( = ?auto_96175 ?auto_96174 ) ) ( not ( = ?auto_96176 ?auto_96174 ) ) ( ON ?auto_96170 ?auto_96169 ) ( ON-TABLE ?auto_96174 ) ( ON ?auto_96171 ?auto_96170 ) ( ON ?auto_96172 ?auto_96171 ) ( ON ?auto_96173 ?auto_96172 ) ( ON ?auto_96175 ?auto_96173 ) ( ON ?auto_96176 ?auto_96175 ) ( CLEAR ?auto_96176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96174 ?auto_96169 ?auto_96170 ?auto_96171 ?auto_96172 ?auto_96173 ?auto_96175 )
      ( MAKE-5PILE ?auto_96169 ?auto_96170 ?auto_96171 ?auto_96172 ?auto_96173 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96188 - BLOCK
    )
    :vars
    (
      ?auto_96190 - BLOCK
      ?auto_96191 - BLOCK
      ?auto_96189 - BLOCK
      ?auto_96192 - BLOCK
      ?auto_96193 - BLOCK
      ?auto_96194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96190 ?auto_96188 ) ( ON-TABLE ?auto_96188 ) ( not ( = ?auto_96188 ?auto_96190 ) ) ( not ( = ?auto_96188 ?auto_96191 ) ) ( not ( = ?auto_96188 ?auto_96189 ) ) ( not ( = ?auto_96190 ?auto_96191 ) ) ( not ( = ?auto_96190 ?auto_96189 ) ) ( not ( = ?auto_96191 ?auto_96189 ) ) ( ON ?auto_96191 ?auto_96190 ) ( CLEAR ?auto_96191 ) ( HOLDING ?auto_96189 ) ( CLEAR ?auto_96192 ) ( ON-TABLE ?auto_96193 ) ( ON ?auto_96194 ?auto_96193 ) ( ON ?auto_96192 ?auto_96194 ) ( not ( = ?auto_96193 ?auto_96194 ) ) ( not ( = ?auto_96193 ?auto_96192 ) ) ( not ( = ?auto_96193 ?auto_96189 ) ) ( not ( = ?auto_96194 ?auto_96192 ) ) ( not ( = ?auto_96194 ?auto_96189 ) ) ( not ( = ?auto_96192 ?auto_96189 ) ) ( not ( = ?auto_96188 ?auto_96192 ) ) ( not ( = ?auto_96188 ?auto_96193 ) ) ( not ( = ?auto_96188 ?auto_96194 ) ) ( not ( = ?auto_96190 ?auto_96192 ) ) ( not ( = ?auto_96190 ?auto_96193 ) ) ( not ( = ?auto_96190 ?auto_96194 ) ) ( not ( = ?auto_96191 ?auto_96192 ) ) ( not ( = ?auto_96191 ?auto_96193 ) ) ( not ( = ?auto_96191 ?auto_96194 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96193 ?auto_96194 ?auto_96192 ?auto_96189 )
      ( MAKE-1PILE ?auto_96188 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96195 - BLOCK
    )
    :vars
    (
      ?auto_96200 - BLOCK
      ?auto_96201 - BLOCK
      ?auto_96199 - BLOCK
      ?auto_96198 - BLOCK
      ?auto_96196 - BLOCK
      ?auto_96197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96200 ?auto_96195 ) ( ON-TABLE ?auto_96195 ) ( not ( = ?auto_96195 ?auto_96200 ) ) ( not ( = ?auto_96195 ?auto_96201 ) ) ( not ( = ?auto_96195 ?auto_96199 ) ) ( not ( = ?auto_96200 ?auto_96201 ) ) ( not ( = ?auto_96200 ?auto_96199 ) ) ( not ( = ?auto_96201 ?auto_96199 ) ) ( ON ?auto_96201 ?auto_96200 ) ( CLEAR ?auto_96198 ) ( ON-TABLE ?auto_96196 ) ( ON ?auto_96197 ?auto_96196 ) ( ON ?auto_96198 ?auto_96197 ) ( not ( = ?auto_96196 ?auto_96197 ) ) ( not ( = ?auto_96196 ?auto_96198 ) ) ( not ( = ?auto_96196 ?auto_96199 ) ) ( not ( = ?auto_96197 ?auto_96198 ) ) ( not ( = ?auto_96197 ?auto_96199 ) ) ( not ( = ?auto_96198 ?auto_96199 ) ) ( not ( = ?auto_96195 ?auto_96198 ) ) ( not ( = ?auto_96195 ?auto_96196 ) ) ( not ( = ?auto_96195 ?auto_96197 ) ) ( not ( = ?auto_96200 ?auto_96198 ) ) ( not ( = ?auto_96200 ?auto_96196 ) ) ( not ( = ?auto_96200 ?auto_96197 ) ) ( not ( = ?auto_96201 ?auto_96198 ) ) ( not ( = ?auto_96201 ?auto_96196 ) ) ( not ( = ?auto_96201 ?auto_96197 ) ) ( ON ?auto_96199 ?auto_96201 ) ( CLEAR ?auto_96199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96195 ?auto_96200 ?auto_96201 )
      ( MAKE-1PILE ?auto_96195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96202 - BLOCK
    )
    :vars
    (
      ?auto_96207 - BLOCK
      ?auto_96206 - BLOCK
      ?auto_96208 - BLOCK
      ?auto_96205 - BLOCK
      ?auto_96203 - BLOCK
      ?auto_96204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96207 ?auto_96202 ) ( ON-TABLE ?auto_96202 ) ( not ( = ?auto_96202 ?auto_96207 ) ) ( not ( = ?auto_96202 ?auto_96206 ) ) ( not ( = ?auto_96202 ?auto_96208 ) ) ( not ( = ?auto_96207 ?auto_96206 ) ) ( not ( = ?auto_96207 ?auto_96208 ) ) ( not ( = ?auto_96206 ?auto_96208 ) ) ( ON ?auto_96206 ?auto_96207 ) ( ON-TABLE ?auto_96205 ) ( ON ?auto_96203 ?auto_96205 ) ( not ( = ?auto_96205 ?auto_96203 ) ) ( not ( = ?auto_96205 ?auto_96204 ) ) ( not ( = ?auto_96205 ?auto_96208 ) ) ( not ( = ?auto_96203 ?auto_96204 ) ) ( not ( = ?auto_96203 ?auto_96208 ) ) ( not ( = ?auto_96204 ?auto_96208 ) ) ( not ( = ?auto_96202 ?auto_96204 ) ) ( not ( = ?auto_96202 ?auto_96205 ) ) ( not ( = ?auto_96202 ?auto_96203 ) ) ( not ( = ?auto_96207 ?auto_96204 ) ) ( not ( = ?auto_96207 ?auto_96205 ) ) ( not ( = ?auto_96207 ?auto_96203 ) ) ( not ( = ?auto_96206 ?auto_96204 ) ) ( not ( = ?auto_96206 ?auto_96205 ) ) ( not ( = ?auto_96206 ?auto_96203 ) ) ( ON ?auto_96208 ?auto_96206 ) ( CLEAR ?auto_96208 ) ( HOLDING ?auto_96204 ) ( CLEAR ?auto_96203 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96205 ?auto_96203 ?auto_96204 )
      ( MAKE-1PILE ?auto_96202 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96209 - BLOCK
    )
    :vars
    (
      ?auto_96210 - BLOCK
      ?auto_96213 - BLOCK
      ?auto_96212 - BLOCK
      ?auto_96214 - BLOCK
      ?auto_96211 - BLOCK
      ?auto_96215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96210 ?auto_96209 ) ( ON-TABLE ?auto_96209 ) ( not ( = ?auto_96209 ?auto_96210 ) ) ( not ( = ?auto_96209 ?auto_96213 ) ) ( not ( = ?auto_96209 ?auto_96212 ) ) ( not ( = ?auto_96210 ?auto_96213 ) ) ( not ( = ?auto_96210 ?auto_96212 ) ) ( not ( = ?auto_96213 ?auto_96212 ) ) ( ON ?auto_96213 ?auto_96210 ) ( ON-TABLE ?auto_96214 ) ( ON ?auto_96211 ?auto_96214 ) ( not ( = ?auto_96214 ?auto_96211 ) ) ( not ( = ?auto_96214 ?auto_96215 ) ) ( not ( = ?auto_96214 ?auto_96212 ) ) ( not ( = ?auto_96211 ?auto_96215 ) ) ( not ( = ?auto_96211 ?auto_96212 ) ) ( not ( = ?auto_96215 ?auto_96212 ) ) ( not ( = ?auto_96209 ?auto_96215 ) ) ( not ( = ?auto_96209 ?auto_96214 ) ) ( not ( = ?auto_96209 ?auto_96211 ) ) ( not ( = ?auto_96210 ?auto_96215 ) ) ( not ( = ?auto_96210 ?auto_96214 ) ) ( not ( = ?auto_96210 ?auto_96211 ) ) ( not ( = ?auto_96213 ?auto_96215 ) ) ( not ( = ?auto_96213 ?auto_96214 ) ) ( not ( = ?auto_96213 ?auto_96211 ) ) ( ON ?auto_96212 ?auto_96213 ) ( CLEAR ?auto_96211 ) ( ON ?auto_96215 ?auto_96212 ) ( CLEAR ?auto_96215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96209 ?auto_96210 ?auto_96213 ?auto_96212 )
      ( MAKE-1PILE ?auto_96209 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96216 - BLOCK
    )
    :vars
    (
      ?auto_96219 - BLOCK
      ?auto_96218 - BLOCK
      ?auto_96217 - BLOCK
      ?auto_96220 - BLOCK
      ?auto_96221 - BLOCK
      ?auto_96222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96219 ?auto_96216 ) ( ON-TABLE ?auto_96216 ) ( not ( = ?auto_96216 ?auto_96219 ) ) ( not ( = ?auto_96216 ?auto_96218 ) ) ( not ( = ?auto_96216 ?auto_96217 ) ) ( not ( = ?auto_96219 ?auto_96218 ) ) ( not ( = ?auto_96219 ?auto_96217 ) ) ( not ( = ?auto_96218 ?auto_96217 ) ) ( ON ?auto_96218 ?auto_96219 ) ( ON-TABLE ?auto_96220 ) ( not ( = ?auto_96220 ?auto_96221 ) ) ( not ( = ?auto_96220 ?auto_96222 ) ) ( not ( = ?auto_96220 ?auto_96217 ) ) ( not ( = ?auto_96221 ?auto_96222 ) ) ( not ( = ?auto_96221 ?auto_96217 ) ) ( not ( = ?auto_96222 ?auto_96217 ) ) ( not ( = ?auto_96216 ?auto_96222 ) ) ( not ( = ?auto_96216 ?auto_96220 ) ) ( not ( = ?auto_96216 ?auto_96221 ) ) ( not ( = ?auto_96219 ?auto_96222 ) ) ( not ( = ?auto_96219 ?auto_96220 ) ) ( not ( = ?auto_96219 ?auto_96221 ) ) ( not ( = ?auto_96218 ?auto_96222 ) ) ( not ( = ?auto_96218 ?auto_96220 ) ) ( not ( = ?auto_96218 ?auto_96221 ) ) ( ON ?auto_96217 ?auto_96218 ) ( ON ?auto_96222 ?auto_96217 ) ( CLEAR ?auto_96222 ) ( HOLDING ?auto_96221 ) ( CLEAR ?auto_96220 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96220 ?auto_96221 )
      ( MAKE-1PILE ?auto_96216 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96223 - BLOCK
    )
    :vars
    (
      ?auto_96226 - BLOCK
      ?auto_96229 - BLOCK
      ?auto_96227 - BLOCK
      ?auto_96225 - BLOCK
      ?auto_96224 - BLOCK
      ?auto_96228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96226 ?auto_96223 ) ( ON-TABLE ?auto_96223 ) ( not ( = ?auto_96223 ?auto_96226 ) ) ( not ( = ?auto_96223 ?auto_96229 ) ) ( not ( = ?auto_96223 ?auto_96227 ) ) ( not ( = ?auto_96226 ?auto_96229 ) ) ( not ( = ?auto_96226 ?auto_96227 ) ) ( not ( = ?auto_96229 ?auto_96227 ) ) ( ON ?auto_96229 ?auto_96226 ) ( ON-TABLE ?auto_96225 ) ( not ( = ?auto_96225 ?auto_96224 ) ) ( not ( = ?auto_96225 ?auto_96228 ) ) ( not ( = ?auto_96225 ?auto_96227 ) ) ( not ( = ?auto_96224 ?auto_96228 ) ) ( not ( = ?auto_96224 ?auto_96227 ) ) ( not ( = ?auto_96228 ?auto_96227 ) ) ( not ( = ?auto_96223 ?auto_96228 ) ) ( not ( = ?auto_96223 ?auto_96225 ) ) ( not ( = ?auto_96223 ?auto_96224 ) ) ( not ( = ?auto_96226 ?auto_96228 ) ) ( not ( = ?auto_96226 ?auto_96225 ) ) ( not ( = ?auto_96226 ?auto_96224 ) ) ( not ( = ?auto_96229 ?auto_96228 ) ) ( not ( = ?auto_96229 ?auto_96225 ) ) ( not ( = ?auto_96229 ?auto_96224 ) ) ( ON ?auto_96227 ?auto_96229 ) ( ON ?auto_96228 ?auto_96227 ) ( CLEAR ?auto_96225 ) ( ON ?auto_96224 ?auto_96228 ) ( CLEAR ?auto_96224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96223 ?auto_96226 ?auto_96229 ?auto_96227 ?auto_96228 )
      ( MAKE-1PILE ?auto_96223 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96230 - BLOCK
    )
    :vars
    (
      ?auto_96236 - BLOCK
      ?auto_96233 - BLOCK
      ?auto_96234 - BLOCK
      ?auto_96232 - BLOCK
      ?auto_96231 - BLOCK
      ?auto_96235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96236 ?auto_96230 ) ( ON-TABLE ?auto_96230 ) ( not ( = ?auto_96230 ?auto_96236 ) ) ( not ( = ?auto_96230 ?auto_96233 ) ) ( not ( = ?auto_96230 ?auto_96234 ) ) ( not ( = ?auto_96236 ?auto_96233 ) ) ( not ( = ?auto_96236 ?auto_96234 ) ) ( not ( = ?auto_96233 ?auto_96234 ) ) ( ON ?auto_96233 ?auto_96236 ) ( not ( = ?auto_96232 ?auto_96231 ) ) ( not ( = ?auto_96232 ?auto_96235 ) ) ( not ( = ?auto_96232 ?auto_96234 ) ) ( not ( = ?auto_96231 ?auto_96235 ) ) ( not ( = ?auto_96231 ?auto_96234 ) ) ( not ( = ?auto_96235 ?auto_96234 ) ) ( not ( = ?auto_96230 ?auto_96235 ) ) ( not ( = ?auto_96230 ?auto_96232 ) ) ( not ( = ?auto_96230 ?auto_96231 ) ) ( not ( = ?auto_96236 ?auto_96235 ) ) ( not ( = ?auto_96236 ?auto_96232 ) ) ( not ( = ?auto_96236 ?auto_96231 ) ) ( not ( = ?auto_96233 ?auto_96235 ) ) ( not ( = ?auto_96233 ?auto_96232 ) ) ( not ( = ?auto_96233 ?auto_96231 ) ) ( ON ?auto_96234 ?auto_96233 ) ( ON ?auto_96235 ?auto_96234 ) ( ON ?auto_96231 ?auto_96235 ) ( CLEAR ?auto_96231 ) ( HOLDING ?auto_96232 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96232 )
      ( MAKE-1PILE ?auto_96230 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96245 - BLOCK
    )
    :vars
    (
      ?auto_96248 - BLOCK
      ?auto_96250 - BLOCK
      ?auto_96246 - BLOCK
      ?auto_96247 - BLOCK
      ?auto_96249 - BLOCK
      ?auto_96251 - BLOCK
      ?auto_96252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96248 ?auto_96245 ) ( ON-TABLE ?auto_96245 ) ( not ( = ?auto_96245 ?auto_96248 ) ) ( not ( = ?auto_96245 ?auto_96250 ) ) ( not ( = ?auto_96245 ?auto_96246 ) ) ( not ( = ?auto_96248 ?auto_96250 ) ) ( not ( = ?auto_96248 ?auto_96246 ) ) ( not ( = ?auto_96250 ?auto_96246 ) ) ( ON ?auto_96250 ?auto_96248 ) ( not ( = ?auto_96247 ?auto_96249 ) ) ( not ( = ?auto_96247 ?auto_96251 ) ) ( not ( = ?auto_96247 ?auto_96246 ) ) ( not ( = ?auto_96249 ?auto_96251 ) ) ( not ( = ?auto_96249 ?auto_96246 ) ) ( not ( = ?auto_96251 ?auto_96246 ) ) ( not ( = ?auto_96245 ?auto_96251 ) ) ( not ( = ?auto_96245 ?auto_96247 ) ) ( not ( = ?auto_96245 ?auto_96249 ) ) ( not ( = ?auto_96248 ?auto_96251 ) ) ( not ( = ?auto_96248 ?auto_96247 ) ) ( not ( = ?auto_96248 ?auto_96249 ) ) ( not ( = ?auto_96250 ?auto_96251 ) ) ( not ( = ?auto_96250 ?auto_96247 ) ) ( not ( = ?auto_96250 ?auto_96249 ) ) ( ON ?auto_96246 ?auto_96250 ) ( ON ?auto_96251 ?auto_96246 ) ( ON ?auto_96249 ?auto_96251 ) ( CLEAR ?auto_96249 ) ( ON ?auto_96247 ?auto_96252 ) ( CLEAR ?auto_96247 ) ( HAND-EMPTY ) ( not ( = ?auto_96245 ?auto_96252 ) ) ( not ( = ?auto_96248 ?auto_96252 ) ) ( not ( = ?auto_96250 ?auto_96252 ) ) ( not ( = ?auto_96246 ?auto_96252 ) ) ( not ( = ?auto_96247 ?auto_96252 ) ) ( not ( = ?auto_96249 ?auto_96252 ) ) ( not ( = ?auto_96251 ?auto_96252 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96247 ?auto_96252 )
      ( MAKE-1PILE ?auto_96245 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96253 - BLOCK
    )
    :vars
    (
      ?auto_96260 - BLOCK
      ?auto_96256 - BLOCK
      ?auto_96255 - BLOCK
      ?auto_96254 - BLOCK
      ?auto_96257 - BLOCK
      ?auto_96258 - BLOCK
      ?auto_96259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96260 ?auto_96253 ) ( ON-TABLE ?auto_96253 ) ( not ( = ?auto_96253 ?auto_96260 ) ) ( not ( = ?auto_96253 ?auto_96256 ) ) ( not ( = ?auto_96253 ?auto_96255 ) ) ( not ( = ?auto_96260 ?auto_96256 ) ) ( not ( = ?auto_96260 ?auto_96255 ) ) ( not ( = ?auto_96256 ?auto_96255 ) ) ( ON ?auto_96256 ?auto_96260 ) ( not ( = ?auto_96254 ?auto_96257 ) ) ( not ( = ?auto_96254 ?auto_96258 ) ) ( not ( = ?auto_96254 ?auto_96255 ) ) ( not ( = ?auto_96257 ?auto_96258 ) ) ( not ( = ?auto_96257 ?auto_96255 ) ) ( not ( = ?auto_96258 ?auto_96255 ) ) ( not ( = ?auto_96253 ?auto_96258 ) ) ( not ( = ?auto_96253 ?auto_96254 ) ) ( not ( = ?auto_96253 ?auto_96257 ) ) ( not ( = ?auto_96260 ?auto_96258 ) ) ( not ( = ?auto_96260 ?auto_96254 ) ) ( not ( = ?auto_96260 ?auto_96257 ) ) ( not ( = ?auto_96256 ?auto_96258 ) ) ( not ( = ?auto_96256 ?auto_96254 ) ) ( not ( = ?auto_96256 ?auto_96257 ) ) ( ON ?auto_96255 ?auto_96256 ) ( ON ?auto_96258 ?auto_96255 ) ( ON ?auto_96254 ?auto_96259 ) ( CLEAR ?auto_96254 ) ( not ( = ?auto_96253 ?auto_96259 ) ) ( not ( = ?auto_96260 ?auto_96259 ) ) ( not ( = ?auto_96256 ?auto_96259 ) ) ( not ( = ?auto_96255 ?auto_96259 ) ) ( not ( = ?auto_96254 ?auto_96259 ) ) ( not ( = ?auto_96257 ?auto_96259 ) ) ( not ( = ?auto_96258 ?auto_96259 ) ) ( HOLDING ?auto_96257 ) ( CLEAR ?auto_96258 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96253 ?auto_96260 ?auto_96256 ?auto_96255 ?auto_96258 ?auto_96257 )
      ( MAKE-1PILE ?auto_96253 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96261 - BLOCK
    )
    :vars
    (
      ?auto_96268 - BLOCK
      ?auto_96265 - BLOCK
      ?auto_96264 - BLOCK
      ?auto_96263 - BLOCK
      ?auto_96267 - BLOCK
      ?auto_96266 - BLOCK
      ?auto_96262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96268 ?auto_96261 ) ( ON-TABLE ?auto_96261 ) ( not ( = ?auto_96261 ?auto_96268 ) ) ( not ( = ?auto_96261 ?auto_96265 ) ) ( not ( = ?auto_96261 ?auto_96264 ) ) ( not ( = ?auto_96268 ?auto_96265 ) ) ( not ( = ?auto_96268 ?auto_96264 ) ) ( not ( = ?auto_96265 ?auto_96264 ) ) ( ON ?auto_96265 ?auto_96268 ) ( not ( = ?auto_96263 ?auto_96267 ) ) ( not ( = ?auto_96263 ?auto_96266 ) ) ( not ( = ?auto_96263 ?auto_96264 ) ) ( not ( = ?auto_96267 ?auto_96266 ) ) ( not ( = ?auto_96267 ?auto_96264 ) ) ( not ( = ?auto_96266 ?auto_96264 ) ) ( not ( = ?auto_96261 ?auto_96266 ) ) ( not ( = ?auto_96261 ?auto_96263 ) ) ( not ( = ?auto_96261 ?auto_96267 ) ) ( not ( = ?auto_96268 ?auto_96266 ) ) ( not ( = ?auto_96268 ?auto_96263 ) ) ( not ( = ?auto_96268 ?auto_96267 ) ) ( not ( = ?auto_96265 ?auto_96266 ) ) ( not ( = ?auto_96265 ?auto_96263 ) ) ( not ( = ?auto_96265 ?auto_96267 ) ) ( ON ?auto_96264 ?auto_96265 ) ( ON ?auto_96266 ?auto_96264 ) ( ON ?auto_96263 ?auto_96262 ) ( not ( = ?auto_96261 ?auto_96262 ) ) ( not ( = ?auto_96268 ?auto_96262 ) ) ( not ( = ?auto_96265 ?auto_96262 ) ) ( not ( = ?auto_96264 ?auto_96262 ) ) ( not ( = ?auto_96263 ?auto_96262 ) ) ( not ( = ?auto_96267 ?auto_96262 ) ) ( not ( = ?auto_96266 ?auto_96262 ) ) ( CLEAR ?auto_96266 ) ( ON ?auto_96267 ?auto_96263 ) ( CLEAR ?auto_96267 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96262 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96262 ?auto_96263 )
      ( MAKE-1PILE ?auto_96261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96269 - BLOCK
    )
    :vars
    (
      ?auto_96273 - BLOCK
      ?auto_96272 - BLOCK
      ?auto_96270 - BLOCK
      ?auto_96271 - BLOCK
      ?auto_96274 - BLOCK
      ?auto_96276 - BLOCK
      ?auto_96275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96273 ?auto_96269 ) ( ON-TABLE ?auto_96269 ) ( not ( = ?auto_96269 ?auto_96273 ) ) ( not ( = ?auto_96269 ?auto_96272 ) ) ( not ( = ?auto_96269 ?auto_96270 ) ) ( not ( = ?auto_96273 ?auto_96272 ) ) ( not ( = ?auto_96273 ?auto_96270 ) ) ( not ( = ?auto_96272 ?auto_96270 ) ) ( ON ?auto_96272 ?auto_96273 ) ( not ( = ?auto_96271 ?auto_96274 ) ) ( not ( = ?auto_96271 ?auto_96276 ) ) ( not ( = ?auto_96271 ?auto_96270 ) ) ( not ( = ?auto_96274 ?auto_96276 ) ) ( not ( = ?auto_96274 ?auto_96270 ) ) ( not ( = ?auto_96276 ?auto_96270 ) ) ( not ( = ?auto_96269 ?auto_96276 ) ) ( not ( = ?auto_96269 ?auto_96271 ) ) ( not ( = ?auto_96269 ?auto_96274 ) ) ( not ( = ?auto_96273 ?auto_96276 ) ) ( not ( = ?auto_96273 ?auto_96271 ) ) ( not ( = ?auto_96273 ?auto_96274 ) ) ( not ( = ?auto_96272 ?auto_96276 ) ) ( not ( = ?auto_96272 ?auto_96271 ) ) ( not ( = ?auto_96272 ?auto_96274 ) ) ( ON ?auto_96270 ?auto_96272 ) ( ON ?auto_96271 ?auto_96275 ) ( not ( = ?auto_96269 ?auto_96275 ) ) ( not ( = ?auto_96273 ?auto_96275 ) ) ( not ( = ?auto_96272 ?auto_96275 ) ) ( not ( = ?auto_96270 ?auto_96275 ) ) ( not ( = ?auto_96271 ?auto_96275 ) ) ( not ( = ?auto_96274 ?auto_96275 ) ) ( not ( = ?auto_96276 ?auto_96275 ) ) ( ON ?auto_96274 ?auto_96271 ) ( CLEAR ?auto_96274 ) ( ON-TABLE ?auto_96275 ) ( HOLDING ?auto_96276 ) ( CLEAR ?auto_96270 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96269 ?auto_96273 ?auto_96272 ?auto_96270 ?auto_96276 )
      ( MAKE-1PILE ?auto_96269 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96315 - BLOCK
      ?auto_96316 - BLOCK
      ?auto_96317 - BLOCK
      ?auto_96318 - BLOCK
      ?auto_96319 - BLOCK
      ?auto_96320 - BLOCK
    )
    :vars
    (
      ?auto_96321 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96315 ) ( ON ?auto_96316 ?auto_96315 ) ( ON ?auto_96317 ?auto_96316 ) ( ON ?auto_96318 ?auto_96317 ) ( not ( = ?auto_96315 ?auto_96316 ) ) ( not ( = ?auto_96315 ?auto_96317 ) ) ( not ( = ?auto_96315 ?auto_96318 ) ) ( not ( = ?auto_96315 ?auto_96319 ) ) ( not ( = ?auto_96315 ?auto_96320 ) ) ( not ( = ?auto_96316 ?auto_96317 ) ) ( not ( = ?auto_96316 ?auto_96318 ) ) ( not ( = ?auto_96316 ?auto_96319 ) ) ( not ( = ?auto_96316 ?auto_96320 ) ) ( not ( = ?auto_96317 ?auto_96318 ) ) ( not ( = ?auto_96317 ?auto_96319 ) ) ( not ( = ?auto_96317 ?auto_96320 ) ) ( not ( = ?auto_96318 ?auto_96319 ) ) ( not ( = ?auto_96318 ?auto_96320 ) ) ( not ( = ?auto_96319 ?auto_96320 ) ) ( ON ?auto_96320 ?auto_96321 ) ( not ( = ?auto_96315 ?auto_96321 ) ) ( not ( = ?auto_96316 ?auto_96321 ) ) ( not ( = ?auto_96317 ?auto_96321 ) ) ( not ( = ?auto_96318 ?auto_96321 ) ) ( not ( = ?auto_96319 ?auto_96321 ) ) ( not ( = ?auto_96320 ?auto_96321 ) ) ( CLEAR ?auto_96318 ) ( ON ?auto_96319 ?auto_96320 ) ( CLEAR ?auto_96319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96321 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96321 ?auto_96320 )
      ( MAKE-6PILE ?auto_96315 ?auto_96316 ?auto_96317 ?auto_96318 ?auto_96319 ?auto_96320 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96322 - BLOCK
      ?auto_96323 - BLOCK
      ?auto_96324 - BLOCK
      ?auto_96325 - BLOCK
      ?auto_96326 - BLOCK
      ?auto_96327 - BLOCK
    )
    :vars
    (
      ?auto_96328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96322 ) ( ON ?auto_96323 ?auto_96322 ) ( ON ?auto_96324 ?auto_96323 ) ( not ( = ?auto_96322 ?auto_96323 ) ) ( not ( = ?auto_96322 ?auto_96324 ) ) ( not ( = ?auto_96322 ?auto_96325 ) ) ( not ( = ?auto_96322 ?auto_96326 ) ) ( not ( = ?auto_96322 ?auto_96327 ) ) ( not ( = ?auto_96323 ?auto_96324 ) ) ( not ( = ?auto_96323 ?auto_96325 ) ) ( not ( = ?auto_96323 ?auto_96326 ) ) ( not ( = ?auto_96323 ?auto_96327 ) ) ( not ( = ?auto_96324 ?auto_96325 ) ) ( not ( = ?auto_96324 ?auto_96326 ) ) ( not ( = ?auto_96324 ?auto_96327 ) ) ( not ( = ?auto_96325 ?auto_96326 ) ) ( not ( = ?auto_96325 ?auto_96327 ) ) ( not ( = ?auto_96326 ?auto_96327 ) ) ( ON ?auto_96327 ?auto_96328 ) ( not ( = ?auto_96322 ?auto_96328 ) ) ( not ( = ?auto_96323 ?auto_96328 ) ) ( not ( = ?auto_96324 ?auto_96328 ) ) ( not ( = ?auto_96325 ?auto_96328 ) ) ( not ( = ?auto_96326 ?auto_96328 ) ) ( not ( = ?auto_96327 ?auto_96328 ) ) ( ON ?auto_96326 ?auto_96327 ) ( CLEAR ?auto_96326 ) ( ON-TABLE ?auto_96328 ) ( HOLDING ?auto_96325 ) ( CLEAR ?auto_96324 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96322 ?auto_96323 ?auto_96324 ?auto_96325 )
      ( MAKE-6PILE ?auto_96322 ?auto_96323 ?auto_96324 ?auto_96325 ?auto_96326 ?auto_96327 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96329 - BLOCK
      ?auto_96330 - BLOCK
      ?auto_96331 - BLOCK
      ?auto_96332 - BLOCK
      ?auto_96333 - BLOCK
      ?auto_96334 - BLOCK
    )
    :vars
    (
      ?auto_96335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96329 ) ( ON ?auto_96330 ?auto_96329 ) ( ON ?auto_96331 ?auto_96330 ) ( not ( = ?auto_96329 ?auto_96330 ) ) ( not ( = ?auto_96329 ?auto_96331 ) ) ( not ( = ?auto_96329 ?auto_96332 ) ) ( not ( = ?auto_96329 ?auto_96333 ) ) ( not ( = ?auto_96329 ?auto_96334 ) ) ( not ( = ?auto_96330 ?auto_96331 ) ) ( not ( = ?auto_96330 ?auto_96332 ) ) ( not ( = ?auto_96330 ?auto_96333 ) ) ( not ( = ?auto_96330 ?auto_96334 ) ) ( not ( = ?auto_96331 ?auto_96332 ) ) ( not ( = ?auto_96331 ?auto_96333 ) ) ( not ( = ?auto_96331 ?auto_96334 ) ) ( not ( = ?auto_96332 ?auto_96333 ) ) ( not ( = ?auto_96332 ?auto_96334 ) ) ( not ( = ?auto_96333 ?auto_96334 ) ) ( ON ?auto_96334 ?auto_96335 ) ( not ( = ?auto_96329 ?auto_96335 ) ) ( not ( = ?auto_96330 ?auto_96335 ) ) ( not ( = ?auto_96331 ?auto_96335 ) ) ( not ( = ?auto_96332 ?auto_96335 ) ) ( not ( = ?auto_96333 ?auto_96335 ) ) ( not ( = ?auto_96334 ?auto_96335 ) ) ( ON ?auto_96333 ?auto_96334 ) ( ON-TABLE ?auto_96335 ) ( CLEAR ?auto_96331 ) ( ON ?auto_96332 ?auto_96333 ) ( CLEAR ?auto_96332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96335 ?auto_96334 ?auto_96333 )
      ( MAKE-6PILE ?auto_96329 ?auto_96330 ?auto_96331 ?auto_96332 ?auto_96333 ?auto_96334 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96336 - BLOCK
      ?auto_96337 - BLOCK
      ?auto_96338 - BLOCK
      ?auto_96339 - BLOCK
      ?auto_96340 - BLOCK
      ?auto_96341 - BLOCK
    )
    :vars
    (
      ?auto_96342 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96336 ) ( ON ?auto_96337 ?auto_96336 ) ( not ( = ?auto_96336 ?auto_96337 ) ) ( not ( = ?auto_96336 ?auto_96338 ) ) ( not ( = ?auto_96336 ?auto_96339 ) ) ( not ( = ?auto_96336 ?auto_96340 ) ) ( not ( = ?auto_96336 ?auto_96341 ) ) ( not ( = ?auto_96337 ?auto_96338 ) ) ( not ( = ?auto_96337 ?auto_96339 ) ) ( not ( = ?auto_96337 ?auto_96340 ) ) ( not ( = ?auto_96337 ?auto_96341 ) ) ( not ( = ?auto_96338 ?auto_96339 ) ) ( not ( = ?auto_96338 ?auto_96340 ) ) ( not ( = ?auto_96338 ?auto_96341 ) ) ( not ( = ?auto_96339 ?auto_96340 ) ) ( not ( = ?auto_96339 ?auto_96341 ) ) ( not ( = ?auto_96340 ?auto_96341 ) ) ( ON ?auto_96341 ?auto_96342 ) ( not ( = ?auto_96336 ?auto_96342 ) ) ( not ( = ?auto_96337 ?auto_96342 ) ) ( not ( = ?auto_96338 ?auto_96342 ) ) ( not ( = ?auto_96339 ?auto_96342 ) ) ( not ( = ?auto_96340 ?auto_96342 ) ) ( not ( = ?auto_96341 ?auto_96342 ) ) ( ON ?auto_96340 ?auto_96341 ) ( ON-TABLE ?auto_96342 ) ( ON ?auto_96339 ?auto_96340 ) ( CLEAR ?auto_96339 ) ( HOLDING ?auto_96338 ) ( CLEAR ?auto_96337 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96336 ?auto_96337 ?auto_96338 )
      ( MAKE-6PILE ?auto_96336 ?auto_96337 ?auto_96338 ?auto_96339 ?auto_96340 ?auto_96341 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96343 - BLOCK
      ?auto_96344 - BLOCK
      ?auto_96345 - BLOCK
      ?auto_96346 - BLOCK
      ?auto_96347 - BLOCK
      ?auto_96348 - BLOCK
    )
    :vars
    (
      ?auto_96349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96343 ) ( ON ?auto_96344 ?auto_96343 ) ( not ( = ?auto_96343 ?auto_96344 ) ) ( not ( = ?auto_96343 ?auto_96345 ) ) ( not ( = ?auto_96343 ?auto_96346 ) ) ( not ( = ?auto_96343 ?auto_96347 ) ) ( not ( = ?auto_96343 ?auto_96348 ) ) ( not ( = ?auto_96344 ?auto_96345 ) ) ( not ( = ?auto_96344 ?auto_96346 ) ) ( not ( = ?auto_96344 ?auto_96347 ) ) ( not ( = ?auto_96344 ?auto_96348 ) ) ( not ( = ?auto_96345 ?auto_96346 ) ) ( not ( = ?auto_96345 ?auto_96347 ) ) ( not ( = ?auto_96345 ?auto_96348 ) ) ( not ( = ?auto_96346 ?auto_96347 ) ) ( not ( = ?auto_96346 ?auto_96348 ) ) ( not ( = ?auto_96347 ?auto_96348 ) ) ( ON ?auto_96348 ?auto_96349 ) ( not ( = ?auto_96343 ?auto_96349 ) ) ( not ( = ?auto_96344 ?auto_96349 ) ) ( not ( = ?auto_96345 ?auto_96349 ) ) ( not ( = ?auto_96346 ?auto_96349 ) ) ( not ( = ?auto_96347 ?auto_96349 ) ) ( not ( = ?auto_96348 ?auto_96349 ) ) ( ON ?auto_96347 ?auto_96348 ) ( ON-TABLE ?auto_96349 ) ( ON ?auto_96346 ?auto_96347 ) ( CLEAR ?auto_96344 ) ( ON ?auto_96345 ?auto_96346 ) ( CLEAR ?auto_96345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96349 ?auto_96348 ?auto_96347 ?auto_96346 )
      ( MAKE-6PILE ?auto_96343 ?auto_96344 ?auto_96345 ?auto_96346 ?auto_96347 ?auto_96348 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96350 - BLOCK
      ?auto_96351 - BLOCK
      ?auto_96352 - BLOCK
      ?auto_96353 - BLOCK
      ?auto_96354 - BLOCK
      ?auto_96355 - BLOCK
    )
    :vars
    (
      ?auto_96356 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96350 ) ( not ( = ?auto_96350 ?auto_96351 ) ) ( not ( = ?auto_96350 ?auto_96352 ) ) ( not ( = ?auto_96350 ?auto_96353 ) ) ( not ( = ?auto_96350 ?auto_96354 ) ) ( not ( = ?auto_96350 ?auto_96355 ) ) ( not ( = ?auto_96351 ?auto_96352 ) ) ( not ( = ?auto_96351 ?auto_96353 ) ) ( not ( = ?auto_96351 ?auto_96354 ) ) ( not ( = ?auto_96351 ?auto_96355 ) ) ( not ( = ?auto_96352 ?auto_96353 ) ) ( not ( = ?auto_96352 ?auto_96354 ) ) ( not ( = ?auto_96352 ?auto_96355 ) ) ( not ( = ?auto_96353 ?auto_96354 ) ) ( not ( = ?auto_96353 ?auto_96355 ) ) ( not ( = ?auto_96354 ?auto_96355 ) ) ( ON ?auto_96355 ?auto_96356 ) ( not ( = ?auto_96350 ?auto_96356 ) ) ( not ( = ?auto_96351 ?auto_96356 ) ) ( not ( = ?auto_96352 ?auto_96356 ) ) ( not ( = ?auto_96353 ?auto_96356 ) ) ( not ( = ?auto_96354 ?auto_96356 ) ) ( not ( = ?auto_96355 ?auto_96356 ) ) ( ON ?auto_96354 ?auto_96355 ) ( ON-TABLE ?auto_96356 ) ( ON ?auto_96353 ?auto_96354 ) ( ON ?auto_96352 ?auto_96353 ) ( CLEAR ?auto_96352 ) ( HOLDING ?auto_96351 ) ( CLEAR ?auto_96350 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96350 ?auto_96351 )
      ( MAKE-6PILE ?auto_96350 ?auto_96351 ?auto_96352 ?auto_96353 ?auto_96354 ?auto_96355 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96357 - BLOCK
      ?auto_96358 - BLOCK
      ?auto_96359 - BLOCK
      ?auto_96360 - BLOCK
      ?auto_96361 - BLOCK
      ?auto_96362 - BLOCK
    )
    :vars
    (
      ?auto_96363 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96357 ) ( not ( = ?auto_96357 ?auto_96358 ) ) ( not ( = ?auto_96357 ?auto_96359 ) ) ( not ( = ?auto_96357 ?auto_96360 ) ) ( not ( = ?auto_96357 ?auto_96361 ) ) ( not ( = ?auto_96357 ?auto_96362 ) ) ( not ( = ?auto_96358 ?auto_96359 ) ) ( not ( = ?auto_96358 ?auto_96360 ) ) ( not ( = ?auto_96358 ?auto_96361 ) ) ( not ( = ?auto_96358 ?auto_96362 ) ) ( not ( = ?auto_96359 ?auto_96360 ) ) ( not ( = ?auto_96359 ?auto_96361 ) ) ( not ( = ?auto_96359 ?auto_96362 ) ) ( not ( = ?auto_96360 ?auto_96361 ) ) ( not ( = ?auto_96360 ?auto_96362 ) ) ( not ( = ?auto_96361 ?auto_96362 ) ) ( ON ?auto_96362 ?auto_96363 ) ( not ( = ?auto_96357 ?auto_96363 ) ) ( not ( = ?auto_96358 ?auto_96363 ) ) ( not ( = ?auto_96359 ?auto_96363 ) ) ( not ( = ?auto_96360 ?auto_96363 ) ) ( not ( = ?auto_96361 ?auto_96363 ) ) ( not ( = ?auto_96362 ?auto_96363 ) ) ( ON ?auto_96361 ?auto_96362 ) ( ON-TABLE ?auto_96363 ) ( ON ?auto_96360 ?auto_96361 ) ( ON ?auto_96359 ?auto_96360 ) ( CLEAR ?auto_96357 ) ( ON ?auto_96358 ?auto_96359 ) ( CLEAR ?auto_96358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96363 ?auto_96362 ?auto_96361 ?auto_96360 ?auto_96359 )
      ( MAKE-6PILE ?auto_96357 ?auto_96358 ?auto_96359 ?auto_96360 ?auto_96361 ?auto_96362 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96364 - BLOCK
      ?auto_96365 - BLOCK
      ?auto_96366 - BLOCK
      ?auto_96367 - BLOCK
      ?auto_96368 - BLOCK
      ?auto_96369 - BLOCK
    )
    :vars
    (
      ?auto_96370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96364 ?auto_96365 ) ) ( not ( = ?auto_96364 ?auto_96366 ) ) ( not ( = ?auto_96364 ?auto_96367 ) ) ( not ( = ?auto_96364 ?auto_96368 ) ) ( not ( = ?auto_96364 ?auto_96369 ) ) ( not ( = ?auto_96365 ?auto_96366 ) ) ( not ( = ?auto_96365 ?auto_96367 ) ) ( not ( = ?auto_96365 ?auto_96368 ) ) ( not ( = ?auto_96365 ?auto_96369 ) ) ( not ( = ?auto_96366 ?auto_96367 ) ) ( not ( = ?auto_96366 ?auto_96368 ) ) ( not ( = ?auto_96366 ?auto_96369 ) ) ( not ( = ?auto_96367 ?auto_96368 ) ) ( not ( = ?auto_96367 ?auto_96369 ) ) ( not ( = ?auto_96368 ?auto_96369 ) ) ( ON ?auto_96369 ?auto_96370 ) ( not ( = ?auto_96364 ?auto_96370 ) ) ( not ( = ?auto_96365 ?auto_96370 ) ) ( not ( = ?auto_96366 ?auto_96370 ) ) ( not ( = ?auto_96367 ?auto_96370 ) ) ( not ( = ?auto_96368 ?auto_96370 ) ) ( not ( = ?auto_96369 ?auto_96370 ) ) ( ON ?auto_96368 ?auto_96369 ) ( ON-TABLE ?auto_96370 ) ( ON ?auto_96367 ?auto_96368 ) ( ON ?auto_96366 ?auto_96367 ) ( ON ?auto_96365 ?auto_96366 ) ( CLEAR ?auto_96365 ) ( HOLDING ?auto_96364 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96364 )
      ( MAKE-6PILE ?auto_96364 ?auto_96365 ?auto_96366 ?auto_96367 ?auto_96368 ?auto_96369 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96371 - BLOCK
      ?auto_96372 - BLOCK
      ?auto_96373 - BLOCK
      ?auto_96374 - BLOCK
      ?auto_96375 - BLOCK
      ?auto_96376 - BLOCK
    )
    :vars
    (
      ?auto_96377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96371 ?auto_96372 ) ) ( not ( = ?auto_96371 ?auto_96373 ) ) ( not ( = ?auto_96371 ?auto_96374 ) ) ( not ( = ?auto_96371 ?auto_96375 ) ) ( not ( = ?auto_96371 ?auto_96376 ) ) ( not ( = ?auto_96372 ?auto_96373 ) ) ( not ( = ?auto_96372 ?auto_96374 ) ) ( not ( = ?auto_96372 ?auto_96375 ) ) ( not ( = ?auto_96372 ?auto_96376 ) ) ( not ( = ?auto_96373 ?auto_96374 ) ) ( not ( = ?auto_96373 ?auto_96375 ) ) ( not ( = ?auto_96373 ?auto_96376 ) ) ( not ( = ?auto_96374 ?auto_96375 ) ) ( not ( = ?auto_96374 ?auto_96376 ) ) ( not ( = ?auto_96375 ?auto_96376 ) ) ( ON ?auto_96376 ?auto_96377 ) ( not ( = ?auto_96371 ?auto_96377 ) ) ( not ( = ?auto_96372 ?auto_96377 ) ) ( not ( = ?auto_96373 ?auto_96377 ) ) ( not ( = ?auto_96374 ?auto_96377 ) ) ( not ( = ?auto_96375 ?auto_96377 ) ) ( not ( = ?auto_96376 ?auto_96377 ) ) ( ON ?auto_96375 ?auto_96376 ) ( ON-TABLE ?auto_96377 ) ( ON ?auto_96374 ?auto_96375 ) ( ON ?auto_96373 ?auto_96374 ) ( ON ?auto_96372 ?auto_96373 ) ( ON ?auto_96371 ?auto_96372 ) ( CLEAR ?auto_96371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96377 ?auto_96376 ?auto_96375 ?auto_96374 ?auto_96373 ?auto_96372 )
      ( MAKE-6PILE ?auto_96371 ?auto_96372 ?auto_96373 ?auto_96374 ?auto_96375 ?auto_96376 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96384 - BLOCK
      ?auto_96385 - BLOCK
      ?auto_96386 - BLOCK
      ?auto_96387 - BLOCK
      ?auto_96388 - BLOCK
      ?auto_96389 - BLOCK
    )
    :vars
    (
      ?auto_96390 - BLOCK
      ?auto_96391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96384 ?auto_96385 ) ) ( not ( = ?auto_96384 ?auto_96386 ) ) ( not ( = ?auto_96384 ?auto_96387 ) ) ( not ( = ?auto_96384 ?auto_96388 ) ) ( not ( = ?auto_96384 ?auto_96389 ) ) ( not ( = ?auto_96385 ?auto_96386 ) ) ( not ( = ?auto_96385 ?auto_96387 ) ) ( not ( = ?auto_96385 ?auto_96388 ) ) ( not ( = ?auto_96385 ?auto_96389 ) ) ( not ( = ?auto_96386 ?auto_96387 ) ) ( not ( = ?auto_96386 ?auto_96388 ) ) ( not ( = ?auto_96386 ?auto_96389 ) ) ( not ( = ?auto_96387 ?auto_96388 ) ) ( not ( = ?auto_96387 ?auto_96389 ) ) ( not ( = ?auto_96388 ?auto_96389 ) ) ( ON ?auto_96389 ?auto_96390 ) ( not ( = ?auto_96384 ?auto_96390 ) ) ( not ( = ?auto_96385 ?auto_96390 ) ) ( not ( = ?auto_96386 ?auto_96390 ) ) ( not ( = ?auto_96387 ?auto_96390 ) ) ( not ( = ?auto_96388 ?auto_96390 ) ) ( not ( = ?auto_96389 ?auto_96390 ) ) ( ON ?auto_96388 ?auto_96389 ) ( ON-TABLE ?auto_96390 ) ( ON ?auto_96387 ?auto_96388 ) ( ON ?auto_96386 ?auto_96387 ) ( ON ?auto_96385 ?auto_96386 ) ( CLEAR ?auto_96385 ) ( ON ?auto_96384 ?auto_96391 ) ( CLEAR ?auto_96384 ) ( HAND-EMPTY ) ( not ( = ?auto_96384 ?auto_96391 ) ) ( not ( = ?auto_96385 ?auto_96391 ) ) ( not ( = ?auto_96386 ?auto_96391 ) ) ( not ( = ?auto_96387 ?auto_96391 ) ) ( not ( = ?auto_96388 ?auto_96391 ) ) ( not ( = ?auto_96389 ?auto_96391 ) ) ( not ( = ?auto_96390 ?auto_96391 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96384 ?auto_96391 )
      ( MAKE-6PILE ?auto_96384 ?auto_96385 ?auto_96386 ?auto_96387 ?auto_96388 ?auto_96389 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96392 - BLOCK
      ?auto_96393 - BLOCK
      ?auto_96394 - BLOCK
      ?auto_96395 - BLOCK
      ?auto_96396 - BLOCK
      ?auto_96397 - BLOCK
    )
    :vars
    (
      ?auto_96399 - BLOCK
      ?auto_96398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96392 ?auto_96393 ) ) ( not ( = ?auto_96392 ?auto_96394 ) ) ( not ( = ?auto_96392 ?auto_96395 ) ) ( not ( = ?auto_96392 ?auto_96396 ) ) ( not ( = ?auto_96392 ?auto_96397 ) ) ( not ( = ?auto_96393 ?auto_96394 ) ) ( not ( = ?auto_96393 ?auto_96395 ) ) ( not ( = ?auto_96393 ?auto_96396 ) ) ( not ( = ?auto_96393 ?auto_96397 ) ) ( not ( = ?auto_96394 ?auto_96395 ) ) ( not ( = ?auto_96394 ?auto_96396 ) ) ( not ( = ?auto_96394 ?auto_96397 ) ) ( not ( = ?auto_96395 ?auto_96396 ) ) ( not ( = ?auto_96395 ?auto_96397 ) ) ( not ( = ?auto_96396 ?auto_96397 ) ) ( ON ?auto_96397 ?auto_96399 ) ( not ( = ?auto_96392 ?auto_96399 ) ) ( not ( = ?auto_96393 ?auto_96399 ) ) ( not ( = ?auto_96394 ?auto_96399 ) ) ( not ( = ?auto_96395 ?auto_96399 ) ) ( not ( = ?auto_96396 ?auto_96399 ) ) ( not ( = ?auto_96397 ?auto_96399 ) ) ( ON ?auto_96396 ?auto_96397 ) ( ON-TABLE ?auto_96399 ) ( ON ?auto_96395 ?auto_96396 ) ( ON ?auto_96394 ?auto_96395 ) ( ON ?auto_96392 ?auto_96398 ) ( CLEAR ?auto_96392 ) ( not ( = ?auto_96392 ?auto_96398 ) ) ( not ( = ?auto_96393 ?auto_96398 ) ) ( not ( = ?auto_96394 ?auto_96398 ) ) ( not ( = ?auto_96395 ?auto_96398 ) ) ( not ( = ?auto_96396 ?auto_96398 ) ) ( not ( = ?auto_96397 ?auto_96398 ) ) ( not ( = ?auto_96399 ?auto_96398 ) ) ( HOLDING ?auto_96393 ) ( CLEAR ?auto_96394 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96399 ?auto_96397 ?auto_96396 ?auto_96395 ?auto_96394 ?auto_96393 )
      ( MAKE-6PILE ?auto_96392 ?auto_96393 ?auto_96394 ?auto_96395 ?auto_96396 ?auto_96397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96400 - BLOCK
      ?auto_96401 - BLOCK
      ?auto_96402 - BLOCK
      ?auto_96403 - BLOCK
      ?auto_96404 - BLOCK
      ?auto_96405 - BLOCK
    )
    :vars
    (
      ?auto_96407 - BLOCK
      ?auto_96406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96400 ?auto_96401 ) ) ( not ( = ?auto_96400 ?auto_96402 ) ) ( not ( = ?auto_96400 ?auto_96403 ) ) ( not ( = ?auto_96400 ?auto_96404 ) ) ( not ( = ?auto_96400 ?auto_96405 ) ) ( not ( = ?auto_96401 ?auto_96402 ) ) ( not ( = ?auto_96401 ?auto_96403 ) ) ( not ( = ?auto_96401 ?auto_96404 ) ) ( not ( = ?auto_96401 ?auto_96405 ) ) ( not ( = ?auto_96402 ?auto_96403 ) ) ( not ( = ?auto_96402 ?auto_96404 ) ) ( not ( = ?auto_96402 ?auto_96405 ) ) ( not ( = ?auto_96403 ?auto_96404 ) ) ( not ( = ?auto_96403 ?auto_96405 ) ) ( not ( = ?auto_96404 ?auto_96405 ) ) ( ON ?auto_96405 ?auto_96407 ) ( not ( = ?auto_96400 ?auto_96407 ) ) ( not ( = ?auto_96401 ?auto_96407 ) ) ( not ( = ?auto_96402 ?auto_96407 ) ) ( not ( = ?auto_96403 ?auto_96407 ) ) ( not ( = ?auto_96404 ?auto_96407 ) ) ( not ( = ?auto_96405 ?auto_96407 ) ) ( ON ?auto_96404 ?auto_96405 ) ( ON-TABLE ?auto_96407 ) ( ON ?auto_96403 ?auto_96404 ) ( ON ?auto_96402 ?auto_96403 ) ( ON ?auto_96400 ?auto_96406 ) ( not ( = ?auto_96400 ?auto_96406 ) ) ( not ( = ?auto_96401 ?auto_96406 ) ) ( not ( = ?auto_96402 ?auto_96406 ) ) ( not ( = ?auto_96403 ?auto_96406 ) ) ( not ( = ?auto_96404 ?auto_96406 ) ) ( not ( = ?auto_96405 ?auto_96406 ) ) ( not ( = ?auto_96407 ?auto_96406 ) ) ( CLEAR ?auto_96402 ) ( ON ?auto_96401 ?auto_96400 ) ( CLEAR ?auto_96401 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96406 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96406 ?auto_96400 )
      ( MAKE-6PILE ?auto_96400 ?auto_96401 ?auto_96402 ?auto_96403 ?auto_96404 ?auto_96405 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96408 - BLOCK
      ?auto_96409 - BLOCK
      ?auto_96410 - BLOCK
      ?auto_96411 - BLOCK
      ?auto_96412 - BLOCK
      ?auto_96413 - BLOCK
    )
    :vars
    (
      ?auto_96414 - BLOCK
      ?auto_96415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96408 ?auto_96409 ) ) ( not ( = ?auto_96408 ?auto_96410 ) ) ( not ( = ?auto_96408 ?auto_96411 ) ) ( not ( = ?auto_96408 ?auto_96412 ) ) ( not ( = ?auto_96408 ?auto_96413 ) ) ( not ( = ?auto_96409 ?auto_96410 ) ) ( not ( = ?auto_96409 ?auto_96411 ) ) ( not ( = ?auto_96409 ?auto_96412 ) ) ( not ( = ?auto_96409 ?auto_96413 ) ) ( not ( = ?auto_96410 ?auto_96411 ) ) ( not ( = ?auto_96410 ?auto_96412 ) ) ( not ( = ?auto_96410 ?auto_96413 ) ) ( not ( = ?auto_96411 ?auto_96412 ) ) ( not ( = ?auto_96411 ?auto_96413 ) ) ( not ( = ?auto_96412 ?auto_96413 ) ) ( ON ?auto_96413 ?auto_96414 ) ( not ( = ?auto_96408 ?auto_96414 ) ) ( not ( = ?auto_96409 ?auto_96414 ) ) ( not ( = ?auto_96410 ?auto_96414 ) ) ( not ( = ?auto_96411 ?auto_96414 ) ) ( not ( = ?auto_96412 ?auto_96414 ) ) ( not ( = ?auto_96413 ?auto_96414 ) ) ( ON ?auto_96412 ?auto_96413 ) ( ON-TABLE ?auto_96414 ) ( ON ?auto_96411 ?auto_96412 ) ( ON ?auto_96408 ?auto_96415 ) ( not ( = ?auto_96408 ?auto_96415 ) ) ( not ( = ?auto_96409 ?auto_96415 ) ) ( not ( = ?auto_96410 ?auto_96415 ) ) ( not ( = ?auto_96411 ?auto_96415 ) ) ( not ( = ?auto_96412 ?auto_96415 ) ) ( not ( = ?auto_96413 ?auto_96415 ) ) ( not ( = ?auto_96414 ?auto_96415 ) ) ( ON ?auto_96409 ?auto_96408 ) ( CLEAR ?auto_96409 ) ( ON-TABLE ?auto_96415 ) ( HOLDING ?auto_96410 ) ( CLEAR ?auto_96411 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96414 ?auto_96413 ?auto_96412 ?auto_96411 ?auto_96410 )
      ( MAKE-6PILE ?auto_96408 ?auto_96409 ?auto_96410 ?auto_96411 ?auto_96412 ?auto_96413 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96416 - BLOCK
      ?auto_96417 - BLOCK
      ?auto_96418 - BLOCK
      ?auto_96419 - BLOCK
      ?auto_96420 - BLOCK
      ?auto_96421 - BLOCK
    )
    :vars
    (
      ?auto_96423 - BLOCK
      ?auto_96422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96416 ?auto_96417 ) ) ( not ( = ?auto_96416 ?auto_96418 ) ) ( not ( = ?auto_96416 ?auto_96419 ) ) ( not ( = ?auto_96416 ?auto_96420 ) ) ( not ( = ?auto_96416 ?auto_96421 ) ) ( not ( = ?auto_96417 ?auto_96418 ) ) ( not ( = ?auto_96417 ?auto_96419 ) ) ( not ( = ?auto_96417 ?auto_96420 ) ) ( not ( = ?auto_96417 ?auto_96421 ) ) ( not ( = ?auto_96418 ?auto_96419 ) ) ( not ( = ?auto_96418 ?auto_96420 ) ) ( not ( = ?auto_96418 ?auto_96421 ) ) ( not ( = ?auto_96419 ?auto_96420 ) ) ( not ( = ?auto_96419 ?auto_96421 ) ) ( not ( = ?auto_96420 ?auto_96421 ) ) ( ON ?auto_96421 ?auto_96423 ) ( not ( = ?auto_96416 ?auto_96423 ) ) ( not ( = ?auto_96417 ?auto_96423 ) ) ( not ( = ?auto_96418 ?auto_96423 ) ) ( not ( = ?auto_96419 ?auto_96423 ) ) ( not ( = ?auto_96420 ?auto_96423 ) ) ( not ( = ?auto_96421 ?auto_96423 ) ) ( ON ?auto_96420 ?auto_96421 ) ( ON-TABLE ?auto_96423 ) ( ON ?auto_96419 ?auto_96420 ) ( ON ?auto_96416 ?auto_96422 ) ( not ( = ?auto_96416 ?auto_96422 ) ) ( not ( = ?auto_96417 ?auto_96422 ) ) ( not ( = ?auto_96418 ?auto_96422 ) ) ( not ( = ?auto_96419 ?auto_96422 ) ) ( not ( = ?auto_96420 ?auto_96422 ) ) ( not ( = ?auto_96421 ?auto_96422 ) ) ( not ( = ?auto_96423 ?auto_96422 ) ) ( ON ?auto_96417 ?auto_96416 ) ( ON-TABLE ?auto_96422 ) ( CLEAR ?auto_96419 ) ( ON ?auto_96418 ?auto_96417 ) ( CLEAR ?auto_96418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96422 ?auto_96416 ?auto_96417 )
      ( MAKE-6PILE ?auto_96416 ?auto_96417 ?auto_96418 ?auto_96419 ?auto_96420 ?auto_96421 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96424 - BLOCK
      ?auto_96425 - BLOCK
      ?auto_96426 - BLOCK
      ?auto_96427 - BLOCK
      ?auto_96428 - BLOCK
      ?auto_96429 - BLOCK
    )
    :vars
    (
      ?auto_96431 - BLOCK
      ?auto_96430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96424 ?auto_96425 ) ) ( not ( = ?auto_96424 ?auto_96426 ) ) ( not ( = ?auto_96424 ?auto_96427 ) ) ( not ( = ?auto_96424 ?auto_96428 ) ) ( not ( = ?auto_96424 ?auto_96429 ) ) ( not ( = ?auto_96425 ?auto_96426 ) ) ( not ( = ?auto_96425 ?auto_96427 ) ) ( not ( = ?auto_96425 ?auto_96428 ) ) ( not ( = ?auto_96425 ?auto_96429 ) ) ( not ( = ?auto_96426 ?auto_96427 ) ) ( not ( = ?auto_96426 ?auto_96428 ) ) ( not ( = ?auto_96426 ?auto_96429 ) ) ( not ( = ?auto_96427 ?auto_96428 ) ) ( not ( = ?auto_96427 ?auto_96429 ) ) ( not ( = ?auto_96428 ?auto_96429 ) ) ( ON ?auto_96429 ?auto_96431 ) ( not ( = ?auto_96424 ?auto_96431 ) ) ( not ( = ?auto_96425 ?auto_96431 ) ) ( not ( = ?auto_96426 ?auto_96431 ) ) ( not ( = ?auto_96427 ?auto_96431 ) ) ( not ( = ?auto_96428 ?auto_96431 ) ) ( not ( = ?auto_96429 ?auto_96431 ) ) ( ON ?auto_96428 ?auto_96429 ) ( ON-TABLE ?auto_96431 ) ( ON ?auto_96424 ?auto_96430 ) ( not ( = ?auto_96424 ?auto_96430 ) ) ( not ( = ?auto_96425 ?auto_96430 ) ) ( not ( = ?auto_96426 ?auto_96430 ) ) ( not ( = ?auto_96427 ?auto_96430 ) ) ( not ( = ?auto_96428 ?auto_96430 ) ) ( not ( = ?auto_96429 ?auto_96430 ) ) ( not ( = ?auto_96431 ?auto_96430 ) ) ( ON ?auto_96425 ?auto_96424 ) ( ON-TABLE ?auto_96430 ) ( ON ?auto_96426 ?auto_96425 ) ( CLEAR ?auto_96426 ) ( HOLDING ?auto_96427 ) ( CLEAR ?auto_96428 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96431 ?auto_96429 ?auto_96428 ?auto_96427 )
      ( MAKE-6PILE ?auto_96424 ?auto_96425 ?auto_96426 ?auto_96427 ?auto_96428 ?auto_96429 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96432 - BLOCK
      ?auto_96433 - BLOCK
      ?auto_96434 - BLOCK
      ?auto_96435 - BLOCK
      ?auto_96436 - BLOCK
      ?auto_96437 - BLOCK
    )
    :vars
    (
      ?auto_96439 - BLOCK
      ?auto_96438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96432 ?auto_96433 ) ) ( not ( = ?auto_96432 ?auto_96434 ) ) ( not ( = ?auto_96432 ?auto_96435 ) ) ( not ( = ?auto_96432 ?auto_96436 ) ) ( not ( = ?auto_96432 ?auto_96437 ) ) ( not ( = ?auto_96433 ?auto_96434 ) ) ( not ( = ?auto_96433 ?auto_96435 ) ) ( not ( = ?auto_96433 ?auto_96436 ) ) ( not ( = ?auto_96433 ?auto_96437 ) ) ( not ( = ?auto_96434 ?auto_96435 ) ) ( not ( = ?auto_96434 ?auto_96436 ) ) ( not ( = ?auto_96434 ?auto_96437 ) ) ( not ( = ?auto_96435 ?auto_96436 ) ) ( not ( = ?auto_96435 ?auto_96437 ) ) ( not ( = ?auto_96436 ?auto_96437 ) ) ( ON ?auto_96437 ?auto_96439 ) ( not ( = ?auto_96432 ?auto_96439 ) ) ( not ( = ?auto_96433 ?auto_96439 ) ) ( not ( = ?auto_96434 ?auto_96439 ) ) ( not ( = ?auto_96435 ?auto_96439 ) ) ( not ( = ?auto_96436 ?auto_96439 ) ) ( not ( = ?auto_96437 ?auto_96439 ) ) ( ON ?auto_96436 ?auto_96437 ) ( ON-TABLE ?auto_96439 ) ( ON ?auto_96432 ?auto_96438 ) ( not ( = ?auto_96432 ?auto_96438 ) ) ( not ( = ?auto_96433 ?auto_96438 ) ) ( not ( = ?auto_96434 ?auto_96438 ) ) ( not ( = ?auto_96435 ?auto_96438 ) ) ( not ( = ?auto_96436 ?auto_96438 ) ) ( not ( = ?auto_96437 ?auto_96438 ) ) ( not ( = ?auto_96439 ?auto_96438 ) ) ( ON ?auto_96433 ?auto_96432 ) ( ON-TABLE ?auto_96438 ) ( ON ?auto_96434 ?auto_96433 ) ( CLEAR ?auto_96436 ) ( ON ?auto_96435 ?auto_96434 ) ( CLEAR ?auto_96435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96438 ?auto_96432 ?auto_96433 ?auto_96434 )
      ( MAKE-6PILE ?auto_96432 ?auto_96433 ?auto_96434 ?auto_96435 ?auto_96436 ?auto_96437 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96440 - BLOCK
      ?auto_96441 - BLOCK
      ?auto_96442 - BLOCK
      ?auto_96443 - BLOCK
      ?auto_96444 - BLOCK
      ?auto_96445 - BLOCK
    )
    :vars
    (
      ?auto_96447 - BLOCK
      ?auto_96446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96440 ?auto_96441 ) ) ( not ( = ?auto_96440 ?auto_96442 ) ) ( not ( = ?auto_96440 ?auto_96443 ) ) ( not ( = ?auto_96440 ?auto_96444 ) ) ( not ( = ?auto_96440 ?auto_96445 ) ) ( not ( = ?auto_96441 ?auto_96442 ) ) ( not ( = ?auto_96441 ?auto_96443 ) ) ( not ( = ?auto_96441 ?auto_96444 ) ) ( not ( = ?auto_96441 ?auto_96445 ) ) ( not ( = ?auto_96442 ?auto_96443 ) ) ( not ( = ?auto_96442 ?auto_96444 ) ) ( not ( = ?auto_96442 ?auto_96445 ) ) ( not ( = ?auto_96443 ?auto_96444 ) ) ( not ( = ?auto_96443 ?auto_96445 ) ) ( not ( = ?auto_96444 ?auto_96445 ) ) ( ON ?auto_96445 ?auto_96447 ) ( not ( = ?auto_96440 ?auto_96447 ) ) ( not ( = ?auto_96441 ?auto_96447 ) ) ( not ( = ?auto_96442 ?auto_96447 ) ) ( not ( = ?auto_96443 ?auto_96447 ) ) ( not ( = ?auto_96444 ?auto_96447 ) ) ( not ( = ?auto_96445 ?auto_96447 ) ) ( ON-TABLE ?auto_96447 ) ( ON ?auto_96440 ?auto_96446 ) ( not ( = ?auto_96440 ?auto_96446 ) ) ( not ( = ?auto_96441 ?auto_96446 ) ) ( not ( = ?auto_96442 ?auto_96446 ) ) ( not ( = ?auto_96443 ?auto_96446 ) ) ( not ( = ?auto_96444 ?auto_96446 ) ) ( not ( = ?auto_96445 ?auto_96446 ) ) ( not ( = ?auto_96447 ?auto_96446 ) ) ( ON ?auto_96441 ?auto_96440 ) ( ON-TABLE ?auto_96446 ) ( ON ?auto_96442 ?auto_96441 ) ( ON ?auto_96443 ?auto_96442 ) ( CLEAR ?auto_96443 ) ( HOLDING ?auto_96444 ) ( CLEAR ?auto_96445 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96447 ?auto_96445 ?auto_96444 )
      ( MAKE-6PILE ?auto_96440 ?auto_96441 ?auto_96442 ?auto_96443 ?auto_96444 ?auto_96445 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96448 - BLOCK
      ?auto_96449 - BLOCK
      ?auto_96450 - BLOCK
      ?auto_96451 - BLOCK
      ?auto_96452 - BLOCK
      ?auto_96453 - BLOCK
    )
    :vars
    (
      ?auto_96454 - BLOCK
      ?auto_96455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96448 ?auto_96449 ) ) ( not ( = ?auto_96448 ?auto_96450 ) ) ( not ( = ?auto_96448 ?auto_96451 ) ) ( not ( = ?auto_96448 ?auto_96452 ) ) ( not ( = ?auto_96448 ?auto_96453 ) ) ( not ( = ?auto_96449 ?auto_96450 ) ) ( not ( = ?auto_96449 ?auto_96451 ) ) ( not ( = ?auto_96449 ?auto_96452 ) ) ( not ( = ?auto_96449 ?auto_96453 ) ) ( not ( = ?auto_96450 ?auto_96451 ) ) ( not ( = ?auto_96450 ?auto_96452 ) ) ( not ( = ?auto_96450 ?auto_96453 ) ) ( not ( = ?auto_96451 ?auto_96452 ) ) ( not ( = ?auto_96451 ?auto_96453 ) ) ( not ( = ?auto_96452 ?auto_96453 ) ) ( ON ?auto_96453 ?auto_96454 ) ( not ( = ?auto_96448 ?auto_96454 ) ) ( not ( = ?auto_96449 ?auto_96454 ) ) ( not ( = ?auto_96450 ?auto_96454 ) ) ( not ( = ?auto_96451 ?auto_96454 ) ) ( not ( = ?auto_96452 ?auto_96454 ) ) ( not ( = ?auto_96453 ?auto_96454 ) ) ( ON-TABLE ?auto_96454 ) ( ON ?auto_96448 ?auto_96455 ) ( not ( = ?auto_96448 ?auto_96455 ) ) ( not ( = ?auto_96449 ?auto_96455 ) ) ( not ( = ?auto_96450 ?auto_96455 ) ) ( not ( = ?auto_96451 ?auto_96455 ) ) ( not ( = ?auto_96452 ?auto_96455 ) ) ( not ( = ?auto_96453 ?auto_96455 ) ) ( not ( = ?auto_96454 ?auto_96455 ) ) ( ON ?auto_96449 ?auto_96448 ) ( ON-TABLE ?auto_96455 ) ( ON ?auto_96450 ?auto_96449 ) ( ON ?auto_96451 ?auto_96450 ) ( CLEAR ?auto_96453 ) ( ON ?auto_96452 ?auto_96451 ) ( CLEAR ?auto_96452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96455 ?auto_96448 ?auto_96449 ?auto_96450 ?auto_96451 )
      ( MAKE-6PILE ?auto_96448 ?auto_96449 ?auto_96450 ?auto_96451 ?auto_96452 ?auto_96453 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96456 - BLOCK
      ?auto_96457 - BLOCK
      ?auto_96458 - BLOCK
      ?auto_96459 - BLOCK
      ?auto_96460 - BLOCK
      ?auto_96461 - BLOCK
    )
    :vars
    (
      ?auto_96462 - BLOCK
      ?auto_96463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96456 ?auto_96457 ) ) ( not ( = ?auto_96456 ?auto_96458 ) ) ( not ( = ?auto_96456 ?auto_96459 ) ) ( not ( = ?auto_96456 ?auto_96460 ) ) ( not ( = ?auto_96456 ?auto_96461 ) ) ( not ( = ?auto_96457 ?auto_96458 ) ) ( not ( = ?auto_96457 ?auto_96459 ) ) ( not ( = ?auto_96457 ?auto_96460 ) ) ( not ( = ?auto_96457 ?auto_96461 ) ) ( not ( = ?auto_96458 ?auto_96459 ) ) ( not ( = ?auto_96458 ?auto_96460 ) ) ( not ( = ?auto_96458 ?auto_96461 ) ) ( not ( = ?auto_96459 ?auto_96460 ) ) ( not ( = ?auto_96459 ?auto_96461 ) ) ( not ( = ?auto_96460 ?auto_96461 ) ) ( not ( = ?auto_96456 ?auto_96462 ) ) ( not ( = ?auto_96457 ?auto_96462 ) ) ( not ( = ?auto_96458 ?auto_96462 ) ) ( not ( = ?auto_96459 ?auto_96462 ) ) ( not ( = ?auto_96460 ?auto_96462 ) ) ( not ( = ?auto_96461 ?auto_96462 ) ) ( ON-TABLE ?auto_96462 ) ( ON ?auto_96456 ?auto_96463 ) ( not ( = ?auto_96456 ?auto_96463 ) ) ( not ( = ?auto_96457 ?auto_96463 ) ) ( not ( = ?auto_96458 ?auto_96463 ) ) ( not ( = ?auto_96459 ?auto_96463 ) ) ( not ( = ?auto_96460 ?auto_96463 ) ) ( not ( = ?auto_96461 ?auto_96463 ) ) ( not ( = ?auto_96462 ?auto_96463 ) ) ( ON ?auto_96457 ?auto_96456 ) ( ON-TABLE ?auto_96463 ) ( ON ?auto_96458 ?auto_96457 ) ( ON ?auto_96459 ?auto_96458 ) ( ON ?auto_96460 ?auto_96459 ) ( CLEAR ?auto_96460 ) ( HOLDING ?auto_96461 ) ( CLEAR ?auto_96462 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96462 ?auto_96461 )
      ( MAKE-6PILE ?auto_96456 ?auto_96457 ?auto_96458 ?auto_96459 ?auto_96460 ?auto_96461 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96464 - BLOCK
      ?auto_96465 - BLOCK
      ?auto_96466 - BLOCK
      ?auto_96467 - BLOCK
      ?auto_96468 - BLOCK
      ?auto_96469 - BLOCK
    )
    :vars
    (
      ?auto_96471 - BLOCK
      ?auto_96470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96464 ?auto_96465 ) ) ( not ( = ?auto_96464 ?auto_96466 ) ) ( not ( = ?auto_96464 ?auto_96467 ) ) ( not ( = ?auto_96464 ?auto_96468 ) ) ( not ( = ?auto_96464 ?auto_96469 ) ) ( not ( = ?auto_96465 ?auto_96466 ) ) ( not ( = ?auto_96465 ?auto_96467 ) ) ( not ( = ?auto_96465 ?auto_96468 ) ) ( not ( = ?auto_96465 ?auto_96469 ) ) ( not ( = ?auto_96466 ?auto_96467 ) ) ( not ( = ?auto_96466 ?auto_96468 ) ) ( not ( = ?auto_96466 ?auto_96469 ) ) ( not ( = ?auto_96467 ?auto_96468 ) ) ( not ( = ?auto_96467 ?auto_96469 ) ) ( not ( = ?auto_96468 ?auto_96469 ) ) ( not ( = ?auto_96464 ?auto_96471 ) ) ( not ( = ?auto_96465 ?auto_96471 ) ) ( not ( = ?auto_96466 ?auto_96471 ) ) ( not ( = ?auto_96467 ?auto_96471 ) ) ( not ( = ?auto_96468 ?auto_96471 ) ) ( not ( = ?auto_96469 ?auto_96471 ) ) ( ON-TABLE ?auto_96471 ) ( ON ?auto_96464 ?auto_96470 ) ( not ( = ?auto_96464 ?auto_96470 ) ) ( not ( = ?auto_96465 ?auto_96470 ) ) ( not ( = ?auto_96466 ?auto_96470 ) ) ( not ( = ?auto_96467 ?auto_96470 ) ) ( not ( = ?auto_96468 ?auto_96470 ) ) ( not ( = ?auto_96469 ?auto_96470 ) ) ( not ( = ?auto_96471 ?auto_96470 ) ) ( ON ?auto_96465 ?auto_96464 ) ( ON-TABLE ?auto_96470 ) ( ON ?auto_96466 ?auto_96465 ) ( ON ?auto_96467 ?auto_96466 ) ( ON ?auto_96468 ?auto_96467 ) ( CLEAR ?auto_96471 ) ( ON ?auto_96469 ?auto_96468 ) ( CLEAR ?auto_96469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96470 ?auto_96464 ?auto_96465 ?auto_96466 ?auto_96467 ?auto_96468 )
      ( MAKE-6PILE ?auto_96464 ?auto_96465 ?auto_96466 ?auto_96467 ?auto_96468 ?auto_96469 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96472 - BLOCK
      ?auto_96473 - BLOCK
      ?auto_96474 - BLOCK
      ?auto_96475 - BLOCK
      ?auto_96476 - BLOCK
      ?auto_96477 - BLOCK
    )
    :vars
    (
      ?auto_96478 - BLOCK
      ?auto_96479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96472 ?auto_96473 ) ) ( not ( = ?auto_96472 ?auto_96474 ) ) ( not ( = ?auto_96472 ?auto_96475 ) ) ( not ( = ?auto_96472 ?auto_96476 ) ) ( not ( = ?auto_96472 ?auto_96477 ) ) ( not ( = ?auto_96473 ?auto_96474 ) ) ( not ( = ?auto_96473 ?auto_96475 ) ) ( not ( = ?auto_96473 ?auto_96476 ) ) ( not ( = ?auto_96473 ?auto_96477 ) ) ( not ( = ?auto_96474 ?auto_96475 ) ) ( not ( = ?auto_96474 ?auto_96476 ) ) ( not ( = ?auto_96474 ?auto_96477 ) ) ( not ( = ?auto_96475 ?auto_96476 ) ) ( not ( = ?auto_96475 ?auto_96477 ) ) ( not ( = ?auto_96476 ?auto_96477 ) ) ( not ( = ?auto_96472 ?auto_96478 ) ) ( not ( = ?auto_96473 ?auto_96478 ) ) ( not ( = ?auto_96474 ?auto_96478 ) ) ( not ( = ?auto_96475 ?auto_96478 ) ) ( not ( = ?auto_96476 ?auto_96478 ) ) ( not ( = ?auto_96477 ?auto_96478 ) ) ( ON ?auto_96472 ?auto_96479 ) ( not ( = ?auto_96472 ?auto_96479 ) ) ( not ( = ?auto_96473 ?auto_96479 ) ) ( not ( = ?auto_96474 ?auto_96479 ) ) ( not ( = ?auto_96475 ?auto_96479 ) ) ( not ( = ?auto_96476 ?auto_96479 ) ) ( not ( = ?auto_96477 ?auto_96479 ) ) ( not ( = ?auto_96478 ?auto_96479 ) ) ( ON ?auto_96473 ?auto_96472 ) ( ON-TABLE ?auto_96479 ) ( ON ?auto_96474 ?auto_96473 ) ( ON ?auto_96475 ?auto_96474 ) ( ON ?auto_96476 ?auto_96475 ) ( ON ?auto_96477 ?auto_96476 ) ( CLEAR ?auto_96477 ) ( HOLDING ?auto_96478 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96478 )
      ( MAKE-6PILE ?auto_96472 ?auto_96473 ?auto_96474 ?auto_96475 ?auto_96476 ?auto_96477 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96480 - BLOCK
      ?auto_96481 - BLOCK
      ?auto_96482 - BLOCK
      ?auto_96483 - BLOCK
      ?auto_96484 - BLOCK
      ?auto_96485 - BLOCK
    )
    :vars
    (
      ?auto_96487 - BLOCK
      ?auto_96486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96480 ?auto_96481 ) ) ( not ( = ?auto_96480 ?auto_96482 ) ) ( not ( = ?auto_96480 ?auto_96483 ) ) ( not ( = ?auto_96480 ?auto_96484 ) ) ( not ( = ?auto_96480 ?auto_96485 ) ) ( not ( = ?auto_96481 ?auto_96482 ) ) ( not ( = ?auto_96481 ?auto_96483 ) ) ( not ( = ?auto_96481 ?auto_96484 ) ) ( not ( = ?auto_96481 ?auto_96485 ) ) ( not ( = ?auto_96482 ?auto_96483 ) ) ( not ( = ?auto_96482 ?auto_96484 ) ) ( not ( = ?auto_96482 ?auto_96485 ) ) ( not ( = ?auto_96483 ?auto_96484 ) ) ( not ( = ?auto_96483 ?auto_96485 ) ) ( not ( = ?auto_96484 ?auto_96485 ) ) ( not ( = ?auto_96480 ?auto_96487 ) ) ( not ( = ?auto_96481 ?auto_96487 ) ) ( not ( = ?auto_96482 ?auto_96487 ) ) ( not ( = ?auto_96483 ?auto_96487 ) ) ( not ( = ?auto_96484 ?auto_96487 ) ) ( not ( = ?auto_96485 ?auto_96487 ) ) ( ON ?auto_96480 ?auto_96486 ) ( not ( = ?auto_96480 ?auto_96486 ) ) ( not ( = ?auto_96481 ?auto_96486 ) ) ( not ( = ?auto_96482 ?auto_96486 ) ) ( not ( = ?auto_96483 ?auto_96486 ) ) ( not ( = ?auto_96484 ?auto_96486 ) ) ( not ( = ?auto_96485 ?auto_96486 ) ) ( not ( = ?auto_96487 ?auto_96486 ) ) ( ON ?auto_96481 ?auto_96480 ) ( ON-TABLE ?auto_96486 ) ( ON ?auto_96482 ?auto_96481 ) ( ON ?auto_96483 ?auto_96482 ) ( ON ?auto_96484 ?auto_96483 ) ( ON ?auto_96485 ?auto_96484 ) ( ON ?auto_96487 ?auto_96485 ) ( CLEAR ?auto_96487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96486 ?auto_96480 ?auto_96481 ?auto_96482 ?auto_96483 ?auto_96484 ?auto_96485 )
      ( MAKE-6PILE ?auto_96480 ?auto_96481 ?auto_96482 ?auto_96483 ?auto_96484 ?auto_96485 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96502 - BLOCK
      ?auto_96503 - BLOCK
      ?auto_96504 - BLOCK
      ?auto_96505 - BLOCK
      ?auto_96506 - BLOCK
      ?auto_96507 - BLOCK
      ?auto_96508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96507 ) ( ON-TABLE ?auto_96502 ) ( ON ?auto_96503 ?auto_96502 ) ( ON ?auto_96504 ?auto_96503 ) ( ON ?auto_96505 ?auto_96504 ) ( ON ?auto_96506 ?auto_96505 ) ( ON ?auto_96507 ?auto_96506 ) ( not ( = ?auto_96502 ?auto_96503 ) ) ( not ( = ?auto_96502 ?auto_96504 ) ) ( not ( = ?auto_96502 ?auto_96505 ) ) ( not ( = ?auto_96502 ?auto_96506 ) ) ( not ( = ?auto_96502 ?auto_96507 ) ) ( not ( = ?auto_96502 ?auto_96508 ) ) ( not ( = ?auto_96503 ?auto_96504 ) ) ( not ( = ?auto_96503 ?auto_96505 ) ) ( not ( = ?auto_96503 ?auto_96506 ) ) ( not ( = ?auto_96503 ?auto_96507 ) ) ( not ( = ?auto_96503 ?auto_96508 ) ) ( not ( = ?auto_96504 ?auto_96505 ) ) ( not ( = ?auto_96504 ?auto_96506 ) ) ( not ( = ?auto_96504 ?auto_96507 ) ) ( not ( = ?auto_96504 ?auto_96508 ) ) ( not ( = ?auto_96505 ?auto_96506 ) ) ( not ( = ?auto_96505 ?auto_96507 ) ) ( not ( = ?auto_96505 ?auto_96508 ) ) ( not ( = ?auto_96506 ?auto_96507 ) ) ( not ( = ?auto_96506 ?auto_96508 ) ) ( not ( = ?auto_96507 ?auto_96508 ) ) ( ON-TABLE ?auto_96508 ) ( CLEAR ?auto_96508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_96508 )
      ( MAKE-7PILE ?auto_96502 ?auto_96503 ?auto_96504 ?auto_96505 ?auto_96506 ?auto_96507 ?auto_96508 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96509 - BLOCK
      ?auto_96510 - BLOCK
      ?auto_96511 - BLOCK
      ?auto_96512 - BLOCK
      ?auto_96513 - BLOCK
      ?auto_96514 - BLOCK
      ?auto_96515 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96509 ) ( ON ?auto_96510 ?auto_96509 ) ( ON ?auto_96511 ?auto_96510 ) ( ON ?auto_96512 ?auto_96511 ) ( ON ?auto_96513 ?auto_96512 ) ( not ( = ?auto_96509 ?auto_96510 ) ) ( not ( = ?auto_96509 ?auto_96511 ) ) ( not ( = ?auto_96509 ?auto_96512 ) ) ( not ( = ?auto_96509 ?auto_96513 ) ) ( not ( = ?auto_96509 ?auto_96514 ) ) ( not ( = ?auto_96509 ?auto_96515 ) ) ( not ( = ?auto_96510 ?auto_96511 ) ) ( not ( = ?auto_96510 ?auto_96512 ) ) ( not ( = ?auto_96510 ?auto_96513 ) ) ( not ( = ?auto_96510 ?auto_96514 ) ) ( not ( = ?auto_96510 ?auto_96515 ) ) ( not ( = ?auto_96511 ?auto_96512 ) ) ( not ( = ?auto_96511 ?auto_96513 ) ) ( not ( = ?auto_96511 ?auto_96514 ) ) ( not ( = ?auto_96511 ?auto_96515 ) ) ( not ( = ?auto_96512 ?auto_96513 ) ) ( not ( = ?auto_96512 ?auto_96514 ) ) ( not ( = ?auto_96512 ?auto_96515 ) ) ( not ( = ?auto_96513 ?auto_96514 ) ) ( not ( = ?auto_96513 ?auto_96515 ) ) ( not ( = ?auto_96514 ?auto_96515 ) ) ( ON-TABLE ?auto_96515 ) ( CLEAR ?auto_96515 ) ( HOLDING ?auto_96514 ) ( CLEAR ?auto_96513 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96509 ?auto_96510 ?auto_96511 ?auto_96512 ?auto_96513 ?auto_96514 )
      ( MAKE-7PILE ?auto_96509 ?auto_96510 ?auto_96511 ?auto_96512 ?auto_96513 ?auto_96514 ?auto_96515 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96516 - BLOCK
      ?auto_96517 - BLOCK
      ?auto_96518 - BLOCK
      ?auto_96519 - BLOCK
      ?auto_96520 - BLOCK
      ?auto_96521 - BLOCK
      ?auto_96522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96516 ) ( ON ?auto_96517 ?auto_96516 ) ( ON ?auto_96518 ?auto_96517 ) ( ON ?auto_96519 ?auto_96518 ) ( ON ?auto_96520 ?auto_96519 ) ( not ( = ?auto_96516 ?auto_96517 ) ) ( not ( = ?auto_96516 ?auto_96518 ) ) ( not ( = ?auto_96516 ?auto_96519 ) ) ( not ( = ?auto_96516 ?auto_96520 ) ) ( not ( = ?auto_96516 ?auto_96521 ) ) ( not ( = ?auto_96516 ?auto_96522 ) ) ( not ( = ?auto_96517 ?auto_96518 ) ) ( not ( = ?auto_96517 ?auto_96519 ) ) ( not ( = ?auto_96517 ?auto_96520 ) ) ( not ( = ?auto_96517 ?auto_96521 ) ) ( not ( = ?auto_96517 ?auto_96522 ) ) ( not ( = ?auto_96518 ?auto_96519 ) ) ( not ( = ?auto_96518 ?auto_96520 ) ) ( not ( = ?auto_96518 ?auto_96521 ) ) ( not ( = ?auto_96518 ?auto_96522 ) ) ( not ( = ?auto_96519 ?auto_96520 ) ) ( not ( = ?auto_96519 ?auto_96521 ) ) ( not ( = ?auto_96519 ?auto_96522 ) ) ( not ( = ?auto_96520 ?auto_96521 ) ) ( not ( = ?auto_96520 ?auto_96522 ) ) ( not ( = ?auto_96521 ?auto_96522 ) ) ( ON-TABLE ?auto_96522 ) ( CLEAR ?auto_96520 ) ( ON ?auto_96521 ?auto_96522 ) ( CLEAR ?auto_96521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96522 )
      ( MAKE-7PILE ?auto_96516 ?auto_96517 ?auto_96518 ?auto_96519 ?auto_96520 ?auto_96521 ?auto_96522 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96523 - BLOCK
      ?auto_96524 - BLOCK
      ?auto_96525 - BLOCK
      ?auto_96526 - BLOCK
      ?auto_96527 - BLOCK
      ?auto_96528 - BLOCK
      ?auto_96529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96523 ) ( ON ?auto_96524 ?auto_96523 ) ( ON ?auto_96525 ?auto_96524 ) ( ON ?auto_96526 ?auto_96525 ) ( not ( = ?auto_96523 ?auto_96524 ) ) ( not ( = ?auto_96523 ?auto_96525 ) ) ( not ( = ?auto_96523 ?auto_96526 ) ) ( not ( = ?auto_96523 ?auto_96527 ) ) ( not ( = ?auto_96523 ?auto_96528 ) ) ( not ( = ?auto_96523 ?auto_96529 ) ) ( not ( = ?auto_96524 ?auto_96525 ) ) ( not ( = ?auto_96524 ?auto_96526 ) ) ( not ( = ?auto_96524 ?auto_96527 ) ) ( not ( = ?auto_96524 ?auto_96528 ) ) ( not ( = ?auto_96524 ?auto_96529 ) ) ( not ( = ?auto_96525 ?auto_96526 ) ) ( not ( = ?auto_96525 ?auto_96527 ) ) ( not ( = ?auto_96525 ?auto_96528 ) ) ( not ( = ?auto_96525 ?auto_96529 ) ) ( not ( = ?auto_96526 ?auto_96527 ) ) ( not ( = ?auto_96526 ?auto_96528 ) ) ( not ( = ?auto_96526 ?auto_96529 ) ) ( not ( = ?auto_96527 ?auto_96528 ) ) ( not ( = ?auto_96527 ?auto_96529 ) ) ( not ( = ?auto_96528 ?auto_96529 ) ) ( ON-TABLE ?auto_96529 ) ( ON ?auto_96528 ?auto_96529 ) ( CLEAR ?auto_96528 ) ( HOLDING ?auto_96527 ) ( CLEAR ?auto_96526 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96523 ?auto_96524 ?auto_96525 ?auto_96526 ?auto_96527 )
      ( MAKE-7PILE ?auto_96523 ?auto_96524 ?auto_96525 ?auto_96526 ?auto_96527 ?auto_96528 ?auto_96529 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96530 - BLOCK
      ?auto_96531 - BLOCK
      ?auto_96532 - BLOCK
      ?auto_96533 - BLOCK
      ?auto_96534 - BLOCK
      ?auto_96535 - BLOCK
      ?auto_96536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96530 ) ( ON ?auto_96531 ?auto_96530 ) ( ON ?auto_96532 ?auto_96531 ) ( ON ?auto_96533 ?auto_96532 ) ( not ( = ?auto_96530 ?auto_96531 ) ) ( not ( = ?auto_96530 ?auto_96532 ) ) ( not ( = ?auto_96530 ?auto_96533 ) ) ( not ( = ?auto_96530 ?auto_96534 ) ) ( not ( = ?auto_96530 ?auto_96535 ) ) ( not ( = ?auto_96530 ?auto_96536 ) ) ( not ( = ?auto_96531 ?auto_96532 ) ) ( not ( = ?auto_96531 ?auto_96533 ) ) ( not ( = ?auto_96531 ?auto_96534 ) ) ( not ( = ?auto_96531 ?auto_96535 ) ) ( not ( = ?auto_96531 ?auto_96536 ) ) ( not ( = ?auto_96532 ?auto_96533 ) ) ( not ( = ?auto_96532 ?auto_96534 ) ) ( not ( = ?auto_96532 ?auto_96535 ) ) ( not ( = ?auto_96532 ?auto_96536 ) ) ( not ( = ?auto_96533 ?auto_96534 ) ) ( not ( = ?auto_96533 ?auto_96535 ) ) ( not ( = ?auto_96533 ?auto_96536 ) ) ( not ( = ?auto_96534 ?auto_96535 ) ) ( not ( = ?auto_96534 ?auto_96536 ) ) ( not ( = ?auto_96535 ?auto_96536 ) ) ( ON-TABLE ?auto_96536 ) ( ON ?auto_96535 ?auto_96536 ) ( CLEAR ?auto_96533 ) ( ON ?auto_96534 ?auto_96535 ) ( CLEAR ?auto_96534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96536 ?auto_96535 )
      ( MAKE-7PILE ?auto_96530 ?auto_96531 ?auto_96532 ?auto_96533 ?auto_96534 ?auto_96535 ?auto_96536 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96537 - BLOCK
      ?auto_96538 - BLOCK
      ?auto_96539 - BLOCK
      ?auto_96540 - BLOCK
      ?auto_96541 - BLOCK
      ?auto_96542 - BLOCK
      ?auto_96543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96537 ) ( ON ?auto_96538 ?auto_96537 ) ( ON ?auto_96539 ?auto_96538 ) ( not ( = ?auto_96537 ?auto_96538 ) ) ( not ( = ?auto_96537 ?auto_96539 ) ) ( not ( = ?auto_96537 ?auto_96540 ) ) ( not ( = ?auto_96537 ?auto_96541 ) ) ( not ( = ?auto_96537 ?auto_96542 ) ) ( not ( = ?auto_96537 ?auto_96543 ) ) ( not ( = ?auto_96538 ?auto_96539 ) ) ( not ( = ?auto_96538 ?auto_96540 ) ) ( not ( = ?auto_96538 ?auto_96541 ) ) ( not ( = ?auto_96538 ?auto_96542 ) ) ( not ( = ?auto_96538 ?auto_96543 ) ) ( not ( = ?auto_96539 ?auto_96540 ) ) ( not ( = ?auto_96539 ?auto_96541 ) ) ( not ( = ?auto_96539 ?auto_96542 ) ) ( not ( = ?auto_96539 ?auto_96543 ) ) ( not ( = ?auto_96540 ?auto_96541 ) ) ( not ( = ?auto_96540 ?auto_96542 ) ) ( not ( = ?auto_96540 ?auto_96543 ) ) ( not ( = ?auto_96541 ?auto_96542 ) ) ( not ( = ?auto_96541 ?auto_96543 ) ) ( not ( = ?auto_96542 ?auto_96543 ) ) ( ON-TABLE ?auto_96543 ) ( ON ?auto_96542 ?auto_96543 ) ( ON ?auto_96541 ?auto_96542 ) ( CLEAR ?auto_96541 ) ( HOLDING ?auto_96540 ) ( CLEAR ?auto_96539 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96537 ?auto_96538 ?auto_96539 ?auto_96540 )
      ( MAKE-7PILE ?auto_96537 ?auto_96538 ?auto_96539 ?auto_96540 ?auto_96541 ?auto_96542 ?auto_96543 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96544 - BLOCK
      ?auto_96545 - BLOCK
      ?auto_96546 - BLOCK
      ?auto_96547 - BLOCK
      ?auto_96548 - BLOCK
      ?auto_96549 - BLOCK
      ?auto_96550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96544 ) ( ON ?auto_96545 ?auto_96544 ) ( ON ?auto_96546 ?auto_96545 ) ( not ( = ?auto_96544 ?auto_96545 ) ) ( not ( = ?auto_96544 ?auto_96546 ) ) ( not ( = ?auto_96544 ?auto_96547 ) ) ( not ( = ?auto_96544 ?auto_96548 ) ) ( not ( = ?auto_96544 ?auto_96549 ) ) ( not ( = ?auto_96544 ?auto_96550 ) ) ( not ( = ?auto_96545 ?auto_96546 ) ) ( not ( = ?auto_96545 ?auto_96547 ) ) ( not ( = ?auto_96545 ?auto_96548 ) ) ( not ( = ?auto_96545 ?auto_96549 ) ) ( not ( = ?auto_96545 ?auto_96550 ) ) ( not ( = ?auto_96546 ?auto_96547 ) ) ( not ( = ?auto_96546 ?auto_96548 ) ) ( not ( = ?auto_96546 ?auto_96549 ) ) ( not ( = ?auto_96546 ?auto_96550 ) ) ( not ( = ?auto_96547 ?auto_96548 ) ) ( not ( = ?auto_96547 ?auto_96549 ) ) ( not ( = ?auto_96547 ?auto_96550 ) ) ( not ( = ?auto_96548 ?auto_96549 ) ) ( not ( = ?auto_96548 ?auto_96550 ) ) ( not ( = ?auto_96549 ?auto_96550 ) ) ( ON-TABLE ?auto_96550 ) ( ON ?auto_96549 ?auto_96550 ) ( ON ?auto_96548 ?auto_96549 ) ( CLEAR ?auto_96546 ) ( ON ?auto_96547 ?auto_96548 ) ( CLEAR ?auto_96547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96550 ?auto_96549 ?auto_96548 )
      ( MAKE-7PILE ?auto_96544 ?auto_96545 ?auto_96546 ?auto_96547 ?auto_96548 ?auto_96549 ?auto_96550 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96551 - BLOCK
      ?auto_96552 - BLOCK
      ?auto_96553 - BLOCK
      ?auto_96554 - BLOCK
      ?auto_96555 - BLOCK
      ?auto_96556 - BLOCK
      ?auto_96557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96551 ) ( ON ?auto_96552 ?auto_96551 ) ( not ( = ?auto_96551 ?auto_96552 ) ) ( not ( = ?auto_96551 ?auto_96553 ) ) ( not ( = ?auto_96551 ?auto_96554 ) ) ( not ( = ?auto_96551 ?auto_96555 ) ) ( not ( = ?auto_96551 ?auto_96556 ) ) ( not ( = ?auto_96551 ?auto_96557 ) ) ( not ( = ?auto_96552 ?auto_96553 ) ) ( not ( = ?auto_96552 ?auto_96554 ) ) ( not ( = ?auto_96552 ?auto_96555 ) ) ( not ( = ?auto_96552 ?auto_96556 ) ) ( not ( = ?auto_96552 ?auto_96557 ) ) ( not ( = ?auto_96553 ?auto_96554 ) ) ( not ( = ?auto_96553 ?auto_96555 ) ) ( not ( = ?auto_96553 ?auto_96556 ) ) ( not ( = ?auto_96553 ?auto_96557 ) ) ( not ( = ?auto_96554 ?auto_96555 ) ) ( not ( = ?auto_96554 ?auto_96556 ) ) ( not ( = ?auto_96554 ?auto_96557 ) ) ( not ( = ?auto_96555 ?auto_96556 ) ) ( not ( = ?auto_96555 ?auto_96557 ) ) ( not ( = ?auto_96556 ?auto_96557 ) ) ( ON-TABLE ?auto_96557 ) ( ON ?auto_96556 ?auto_96557 ) ( ON ?auto_96555 ?auto_96556 ) ( ON ?auto_96554 ?auto_96555 ) ( CLEAR ?auto_96554 ) ( HOLDING ?auto_96553 ) ( CLEAR ?auto_96552 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96551 ?auto_96552 ?auto_96553 )
      ( MAKE-7PILE ?auto_96551 ?auto_96552 ?auto_96553 ?auto_96554 ?auto_96555 ?auto_96556 ?auto_96557 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96558 - BLOCK
      ?auto_96559 - BLOCK
      ?auto_96560 - BLOCK
      ?auto_96561 - BLOCK
      ?auto_96562 - BLOCK
      ?auto_96563 - BLOCK
      ?auto_96564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96558 ) ( ON ?auto_96559 ?auto_96558 ) ( not ( = ?auto_96558 ?auto_96559 ) ) ( not ( = ?auto_96558 ?auto_96560 ) ) ( not ( = ?auto_96558 ?auto_96561 ) ) ( not ( = ?auto_96558 ?auto_96562 ) ) ( not ( = ?auto_96558 ?auto_96563 ) ) ( not ( = ?auto_96558 ?auto_96564 ) ) ( not ( = ?auto_96559 ?auto_96560 ) ) ( not ( = ?auto_96559 ?auto_96561 ) ) ( not ( = ?auto_96559 ?auto_96562 ) ) ( not ( = ?auto_96559 ?auto_96563 ) ) ( not ( = ?auto_96559 ?auto_96564 ) ) ( not ( = ?auto_96560 ?auto_96561 ) ) ( not ( = ?auto_96560 ?auto_96562 ) ) ( not ( = ?auto_96560 ?auto_96563 ) ) ( not ( = ?auto_96560 ?auto_96564 ) ) ( not ( = ?auto_96561 ?auto_96562 ) ) ( not ( = ?auto_96561 ?auto_96563 ) ) ( not ( = ?auto_96561 ?auto_96564 ) ) ( not ( = ?auto_96562 ?auto_96563 ) ) ( not ( = ?auto_96562 ?auto_96564 ) ) ( not ( = ?auto_96563 ?auto_96564 ) ) ( ON-TABLE ?auto_96564 ) ( ON ?auto_96563 ?auto_96564 ) ( ON ?auto_96562 ?auto_96563 ) ( ON ?auto_96561 ?auto_96562 ) ( CLEAR ?auto_96559 ) ( ON ?auto_96560 ?auto_96561 ) ( CLEAR ?auto_96560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96564 ?auto_96563 ?auto_96562 ?auto_96561 )
      ( MAKE-7PILE ?auto_96558 ?auto_96559 ?auto_96560 ?auto_96561 ?auto_96562 ?auto_96563 ?auto_96564 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96565 - BLOCK
      ?auto_96566 - BLOCK
      ?auto_96567 - BLOCK
      ?auto_96568 - BLOCK
      ?auto_96569 - BLOCK
      ?auto_96570 - BLOCK
      ?auto_96571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96565 ) ( not ( = ?auto_96565 ?auto_96566 ) ) ( not ( = ?auto_96565 ?auto_96567 ) ) ( not ( = ?auto_96565 ?auto_96568 ) ) ( not ( = ?auto_96565 ?auto_96569 ) ) ( not ( = ?auto_96565 ?auto_96570 ) ) ( not ( = ?auto_96565 ?auto_96571 ) ) ( not ( = ?auto_96566 ?auto_96567 ) ) ( not ( = ?auto_96566 ?auto_96568 ) ) ( not ( = ?auto_96566 ?auto_96569 ) ) ( not ( = ?auto_96566 ?auto_96570 ) ) ( not ( = ?auto_96566 ?auto_96571 ) ) ( not ( = ?auto_96567 ?auto_96568 ) ) ( not ( = ?auto_96567 ?auto_96569 ) ) ( not ( = ?auto_96567 ?auto_96570 ) ) ( not ( = ?auto_96567 ?auto_96571 ) ) ( not ( = ?auto_96568 ?auto_96569 ) ) ( not ( = ?auto_96568 ?auto_96570 ) ) ( not ( = ?auto_96568 ?auto_96571 ) ) ( not ( = ?auto_96569 ?auto_96570 ) ) ( not ( = ?auto_96569 ?auto_96571 ) ) ( not ( = ?auto_96570 ?auto_96571 ) ) ( ON-TABLE ?auto_96571 ) ( ON ?auto_96570 ?auto_96571 ) ( ON ?auto_96569 ?auto_96570 ) ( ON ?auto_96568 ?auto_96569 ) ( ON ?auto_96567 ?auto_96568 ) ( CLEAR ?auto_96567 ) ( HOLDING ?auto_96566 ) ( CLEAR ?auto_96565 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96565 ?auto_96566 )
      ( MAKE-7PILE ?auto_96565 ?auto_96566 ?auto_96567 ?auto_96568 ?auto_96569 ?auto_96570 ?auto_96571 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96572 - BLOCK
      ?auto_96573 - BLOCK
      ?auto_96574 - BLOCK
      ?auto_96575 - BLOCK
      ?auto_96576 - BLOCK
      ?auto_96577 - BLOCK
      ?auto_96578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96572 ) ( not ( = ?auto_96572 ?auto_96573 ) ) ( not ( = ?auto_96572 ?auto_96574 ) ) ( not ( = ?auto_96572 ?auto_96575 ) ) ( not ( = ?auto_96572 ?auto_96576 ) ) ( not ( = ?auto_96572 ?auto_96577 ) ) ( not ( = ?auto_96572 ?auto_96578 ) ) ( not ( = ?auto_96573 ?auto_96574 ) ) ( not ( = ?auto_96573 ?auto_96575 ) ) ( not ( = ?auto_96573 ?auto_96576 ) ) ( not ( = ?auto_96573 ?auto_96577 ) ) ( not ( = ?auto_96573 ?auto_96578 ) ) ( not ( = ?auto_96574 ?auto_96575 ) ) ( not ( = ?auto_96574 ?auto_96576 ) ) ( not ( = ?auto_96574 ?auto_96577 ) ) ( not ( = ?auto_96574 ?auto_96578 ) ) ( not ( = ?auto_96575 ?auto_96576 ) ) ( not ( = ?auto_96575 ?auto_96577 ) ) ( not ( = ?auto_96575 ?auto_96578 ) ) ( not ( = ?auto_96576 ?auto_96577 ) ) ( not ( = ?auto_96576 ?auto_96578 ) ) ( not ( = ?auto_96577 ?auto_96578 ) ) ( ON-TABLE ?auto_96578 ) ( ON ?auto_96577 ?auto_96578 ) ( ON ?auto_96576 ?auto_96577 ) ( ON ?auto_96575 ?auto_96576 ) ( ON ?auto_96574 ?auto_96575 ) ( CLEAR ?auto_96572 ) ( ON ?auto_96573 ?auto_96574 ) ( CLEAR ?auto_96573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96578 ?auto_96577 ?auto_96576 ?auto_96575 ?auto_96574 )
      ( MAKE-7PILE ?auto_96572 ?auto_96573 ?auto_96574 ?auto_96575 ?auto_96576 ?auto_96577 ?auto_96578 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96579 - BLOCK
      ?auto_96580 - BLOCK
      ?auto_96581 - BLOCK
      ?auto_96582 - BLOCK
      ?auto_96583 - BLOCK
      ?auto_96584 - BLOCK
      ?auto_96585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96579 ?auto_96580 ) ) ( not ( = ?auto_96579 ?auto_96581 ) ) ( not ( = ?auto_96579 ?auto_96582 ) ) ( not ( = ?auto_96579 ?auto_96583 ) ) ( not ( = ?auto_96579 ?auto_96584 ) ) ( not ( = ?auto_96579 ?auto_96585 ) ) ( not ( = ?auto_96580 ?auto_96581 ) ) ( not ( = ?auto_96580 ?auto_96582 ) ) ( not ( = ?auto_96580 ?auto_96583 ) ) ( not ( = ?auto_96580 ?auto_96584 ) ) ( not ( = ?auto_96580 ?auto_96585 ) ) ( not ( = ?auto_96581 ?auto_96582 ) ) ( not ( = ?auto_96581 ?auto_96583 ) ) ( not ( = ?auto_96581 ?auto_96584 ) ) ( not ( = ?auto_96581 ?auto_96585 ) ) ( not ( = ?auto_96582 ?auto_96583 ) ) ( not ( = ?auto_96582 ?auto_96584 ) ) ( not ( = ?auto_96582 ?auto_96585 ) ) ( not ( = ?auto_96583 ?auto_96584 ) ) ( not ( = ?auto_96583 ?auto_96585 ) ) ( not ( = ?auto_96584 ?auto_96585 ) ) ( ON-TABLE ?auto_96585 ) ( ON ?auto_96584 ?auto_96585 ) ( ON ?auto_96583 ?auto_96584 ) ( ON ?auto_96582 ?auto_96583 ) ( ON ?auto_96581 ?auto_96582 ) ( ON ?auto_96580 ?auto_96581 ) ( CLEAR ?auto_96580 ) ( HOLDING ?auto_96579 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96579 )
      ( MAKE-7PILE ?auto_96579 ?auto_96580 ?auto_96581 ?auto_96582 ?auto_96583 ?auto_96584 ?auto_96585 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96586 - BLOCK
      ?auto_96587 - BLOCK
      ?auto_96588 - BLOCK
      ?auto_96589 - BLOCK
      ?auto_96590 - BLOCK
      ?auto_96591 - BLOCK
      ?auto_96592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96586 ?auto_96587 ) ) ( not ( = ?auto_96586 ?auto_96588 ) ) ( not ( = ?auto_96586 ?auto_96589 ) ) ( not ( = ?auto_96586 ?auto_96590 ) ) ( not ( = ?auto_96586 ?auto_96591 ) ) ( not ( = ?auto_96586 ?auto_96592 ) ) ( not ( = ?auto_96587 ?auto_96588 ) ) ( not ( = ?auto_96587 ?auto_96589 ) ) ( not ( = ?auto_96587 ?auto_96590 ) ) ( not ( = ?auto_96587 ?auto_96591 ) ) ( not ( = ?auto_96587 ?auto_96592 ) ) ( not ( = ?auto_96588 ?auto_96589 ) ) ( not ( = ?auto_96588 ?auto_96590 ) ) ( not ( = ?auto_96588 ?auto_96591 ) ) ( not ( = ?auto_96588 ?auto_96592 ) ) ( not ( = ?auto_96589 ?auto_96590 ) ) ( not ( = ?auto_96589 ?auto_96591 ) ) ( not ( = ?auto_96589 ?auto_96592 ) ) ( not ( = ?auto_96590 ?auto_96591 ) ) ( not ( = ?auto_96590 ?auto_96592 ) ) ( not ( = ?auto_96591 ?auto_96592 ) ) ( ON-TABLE ?auto_96592 ) ( ON ?auto_96591 ?auto_96592 ) ( ON ?auto_96590 ?auto_96591 ) ( ON ?auto_96589 ?auto_96590 ) ( ON ?auto_96588 ?auto_96589 ) ( ON ?auto_96587 ?auto_96588 ) ( ON ?auto_96586 ?auto_96587 ) ( CLEAR ?auto_96586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96592 ?auto_96591 ?auto_96590 ?auto_96589 ?auto_96588 ?auto_96587 )
      ( MAKE-7PILE ?auto_96586 ?auto_96587 ?auto_96588 ?auto_96589 ?auto_96590 ?auto_96591 ?auto_96592 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96600 - BLOCK
      ?auto_96601 - BLOCK
      ?auto_96602 - BLOCK
      ?auto_96603 - BLOCK
      ?auto_96604 - BLOCK
      ?auto_96605 - BLOCK
      ?auto_96606 - BLOCK
    )
    :vars
    (
      ?auto_96607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96600 ?auto_96601 ) ) ( not ( = ?auto_96600 ?auto_96602 ) ) ( not ( = ?auto_96600 ?auto_96603 ) ) ( not ( = ?auto_96600 ?auto_96604 ) ) ( not ( = ?auto_96600 ?auto_96605 ) ) ( not ( = ?auto_96600 ?auto_96606 ) ) ( not ( = ?auto_96601 ?auto_96602 ) ) ( not ( = ?auto_96601 ?auto_96603 ) ) ( not ( = ?auto_96601 ?auto_96604 ) ) ( not ( = ?auto_96601 ?auto_96605 ) ) ( not ( = ?auto_96601 ?auto_96606 ) ) ( not ( = ?auto_96602 ?auto_96603 ) ) ( not ( = ?auto_96602 ?auto_96604 ) ) ( not ( = ?auto_96602 ?auto_96605 ) ) ( not ( = ?auto_96602 ?auto_96606 ) ) ( not ( = ?auto_96603 ?auto_96604 ) ) ( not ( = ?auto_96603 ?auto_96605 ) ) ( not ( = ?auto_96603 ?auto_96606 ) ) ( not ( = ?auto_96604 ?auto_96605 ) ) ( not ( = ?auto_96604 ?auto_96606 ) ) ( not ( = ?auto_96605 ?auto_96606 ) ) ( ON-TABLE ?auto_96606 ) ( ON ?auto_96605 ?auto_96606 ) ( ON ?auto_96604 ?auto_96605 ) ( ON ?auto_96603 ?auto_96604 ) ( ON ?auto_96602 ?auto_96603 ) ( ON ?auto_96601 ?auto_96602 ) ( CLEAR ?auto_96601 ) ( ON ?auto_96600 ?auto_96607 ) ( CLEAR ?auto_96600 ) ( HAND-EMPTY ) ( not ( = ?auto_96600 ?auto_96607 ) ) ( not ( = ?auto_96601 ?auto_96607 ) ) ( not ( = ?auto_96602 ?auto_96607 ) ) ( not ( = ?auto_96603 ?auto_96607 ) ) ( not ( = ?auto_96604 ?auto_96607 ) ) ( not ( = ?auto_96605 ?auto_96607 ) ) ( not ( = ?auto_96606 ?auto_96607 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96600 ?auto_96607 )
      ( MAKE-7PILE ?auto_96600 ?auto_96601 ?auto_96602 ?auto_96603 ?auto_96604 ?auto_96605 ?auto_96606 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96608 - BLOCK
      ?auto_96609 - BLOCK
      ?auto_96610 - BLOCK
      ?auto_96611 - BLOCK
      ?auto_96612 - BLOCK
      ?auto_96613 - BLOCK
      ?auto_96614 - BLOCK
    )
    :vars
    (
      ?auto_96615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96608 ?auto_96609 ) ) ( not ( = ?auto_96608 ?auto_96610 ) ) ( not ( = ?auto_96608 ?auto_96611 ) ) ( not ( = ?auto_96608 ?auto_96612 ) ) ( not ( = ?auto_96608 ?auto_96613 ) ) ( not ( = ?auto_96608 ?auto_96614 ) ) ( not ( = ?auto_96609 ?auto_96610 ) ) ( not ( = ?auto_96609 ?auto_96611 ) ) ( not ( = ?auto_96609 ?auto_96612 ) ) ( not ( = ?auto_96609 ?auto_96613 ) ) ( not ( = ?auto_96609 ?auto_96614 ) ) ( not ( = ?auto_96610 ?auto_96611 ) ) ( not ( = ?auto_96610 ?auto_96612 ) ) ( not ( = ?auto_96610 ?auto_96613 ) ) ( not ( = ?auto_96610 ?auto_96614 ) ) ( not ( = ?auto_96611 ?auto_96612 ) ) ( not ( = ?auto_96611 ?auto_96613 ) ) ( not ( = ?auto_96611 ?auto_96614 ) ) ( not ( = ?auto_96612 ?auto_96613 ) ) ( not ( = ?auto_96612 ?auto_96614 ) ) ( not ( = ?auto_96613 ?auto_96614 ) ) ( ON-TABLE ?auto_96614 ) ( ON ?auto_96613 ?auto_96614 ) ( ON ?auto_96612 ?auto_96613 ) ( ON ?auto_96611 ?auto_96612 ) ( ON ?auto_96610 ?auto_96611 ) ( ON ?auto_96608 ?auto_96615 ) ( CLEAR ?auto_96608 ) ( not ( = ?auto_96608 ?auto_96615 ) ) ( not ( = ?auto_96609 ?auto_96615 ) ) ( not ( = ?auto_96610 ?auto_96615 ) ) ( not ( = ?auto_96611 ?auto_96615 ) ) ( not ( = ?auto_96612 ?auto_96615 ) ) ( not ( = ?auto_96613 ?auto_96615 ) ) ( not ( = ?auto_96614 ?auto_96615 ) ) ( HOLDING ?auto_96609 ) ( CLEAR ?auto_96610 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96614 ?auto_96613 ?auto_96612 ?auto_96611 ?auto_96610 ?auto_96609 )
      ( MAKE-7PILE ?auto_96608 ?auto_96609 ?auto_96610 ?auto_96611 ?auto_96612 ?auto_96613 ?auto_96614 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96616 - BLOCK
      ?auto_96617 - BLOCK
      ?auto_96618 - BLOCK
      ?auto_96619 - BLOCK
      ?auto_96620 - BLOCK
      ?auto_96621 - BLOCK
      ?auto_96622 - BLOCK
    )
    :vars
    (
      ?auto_96623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96616 ?auto_96617 ) ) ( not ( = ?auto_96616 ?auto_96618 ) ) ( not ( = ?auto_96616 ?auto_96619 ) ) ( not ( = ?auto_96616 ?auto_96620 ) ) ( not ( = ?auto_96616 ?auto_96621 ) ) ( not ( = ?auto_96616 ?auto_96622 ) ) ( not ( = ?auto_96617 ?auto_96618 ) ) ( not ( = ?auto_96617 ?auto_96619 ) ) ( not ( = ?auto_96617 ?auto_96620 ) ) ( not ( = ?auto_96617 ?auto_96621 ) ) ( not ( = ?auto_96617 ?auto_96622 ) ) ( not ( = ?auto_96618 ?auto_96619 ) ) ( not ( = ?auto_96618 ?auto_96620 ) ) ( not ( = ?auto_96618 ?auto_96621 ) ) ( not ( = ?auto_96618 ?auto_96622 ) ) ( not ( = ?auto_96619 ?auto_96620 ) ) ( not ( = ?auto_96619 ?auto_96621 ) ) ( not ( = ?auto_96619 ?auto_96622 ) ) ( not ( = ?auto_96620 ?auto_96621 ) ) ( not ( = ?auto_96620 ?auto_96622 ) ) ( not ( = ?auto_96621 ?auto_96622 ) ) ( ON-TABLE ?auto_96622 ) ( ON ?auto_96621 ?auto_96622 ) ( ON ?auto_96620 ?auto_96621 ) ( ON ?auto_96619 ?auto_96620 ) ( ON ?auto_96618 ?auto_96619 ) ( ON ?auto_96616 ?auto_96623 ) ( not ( = ?auto_96616 ?auto_96623 ) ) ( not ( = ?auto_96617 ?auto_96623 ) ) ( not ( = ?auto_96618 ?auto_96623 ) ) ( not ( = ?auto_96619 ?auto_96623 ) ) ( not ( = ?auto_96620 ?auto_96623 ) ) ( not ( = ?auto_96621 ?auto_96623 ) ) ( not ( = ?auto_96622 ?auto_96623 ) ) ( CLEAR ?auto_96618 ) ( ON ?auto_96617 ?auto_96616 ) ( CLEAR ?auto_96617 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96623 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96623 ?auto_96616 )
      ( MAKE-7PILE ?auto_96616 ?auto_96617 ?auto_96618 ?auto_96619 ?auto_96620 ?auto_96621 ?auto_96622 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96624 - BLOCK
      ?auto_96625 - BLOCK
      ?auto_96626 - BLOCK
      ?auto_96627 - BLOCK
      ?auto_96628 - BLOCK
      ?auto_96629 - BLOCK
      ?auto_96630 - BLOCK
    )
    :vars
    (
      ?auto_96631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96624 ?auto_96625 ) ) ( not ( = ?auto_96624 ?auto_96626 ) ) ( not ( = ?auto_96624 ?auto_96627 ) ) ( not ( = ?auto_96624 ?auto_96628 ) ) ( not ( = ?auto_96624 ?auto_96629 ) ) ( not ( = ?auto_96624 ?auto_96630 ) ) ( not ( = ?auto_96625 ?auto_96626 ) ) ( not ( = ?auto_96625 ?auto_96627 ) ) ( not ( = ?auto_96625 ?auto_96628 ) ) ( not ( = ?auto_96625 ?auto_96629 ) ) ( not ( = ?auto_96625 ?auto_96630 ) ) ( not ( = ?auto_96626 ?auto_96627 ) ) ( not ( = ?auto_96626 ?auto_96628 ) ) ( not ( = ?auto_96626 ?auto_96629 ) ) ( not ( = ?auto_96626 ?auto_96630 ) ) ( not ( = ?auto_96627 ?auto_96628 ) ) ( not ( = ?auto_96627 ?auto_96629 ) ) ( not ( = ?auto_96627 ?auto_96630 ) ) ( not ( = ?auto_96628 ?auto_96629 ) ) ( not ( = ?auto_96628 ?auto_96630 ) ) ( not ( = ?auto_96629 ?auto_96630 ) ) ( ON-TABLE ?auto_96630 ) ( ON ?auto_96629 ?auto_96630 ) ( ON ?auto_96628 ?auto_96629 ) ( ON ?auto_96627 ?auto_96628 ) ( ON ?auto_96624 ?auto_96631 ) ( not ( = ?auto_96624 ?auto_96631 ) ) ( not ( = ?auto_96625 ?auto_96631 ) ) ( not ( = ?auto_96626 ?auto_96631 ) ) ( not ( = ?auto_96627 ?auto_96631 ) ) ( not ( = ?auto_96628 ?auto_96631 ) ) ( not ( = ?auto_96629 ?auto_96631 ) ) ( not ( = ?auto_96630 ?auto_96631 ) ) ( ON ?auto_96625 ?auto_96624 ) ( CLEAR ?auto_96625 ) ( ON-TABLE ?auto_96631 ) ( HOLDING ?auto_96626 ) ( CLEAR ?auto_96627 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96630 ?auto_96629 ?auto_96628 ?auto_96627 ?auto_96626 )
      ( MAKE-7PILE ?auto_96624 ?auto_96625 ?auto_96626 ?auto_96627 ?auto_96628 ?auto_96629 ?auto_96630 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96632 - BLOCK
      ?auto_96633 - BLOCK
      ?auto_96634 - BLOCK
      ?auto_96635 - BLOCK
      ?auto_96636 - BLOCK
      ?auto_96637 - BLOCK
      ?auto_96638 - BLOCK
    )
    :vars
    (
      ?auto_96639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96632 ?auto_96633 ) ) ( not ( = ?auto_96632 ?auto_96634 ) ) ( not ( = ?auto_96632 ?auto_96635 ) ) ( not ( = ?auto_96632 ?auto_96636 ) ) ( not ( = ?auto_96632 ?auto_96637 ) ) ( not ( = ?auto_96632 ?auto_96638 ) ) ( not ( = ?auto_96633 ?auto_96634 ) ) ( not ( = ?auto_96633 ?auto_96635 ) ) ( not ( = ?auto_96633 ?auto_96636 ) ) ( not ( = ?auto_96633 ?auto_96637 ) ) ( not ( = ?auto_96633 ?auto_96638 ) ) ( not ( = ?auto_96634 ?auto_96635 ) ) ( not ( = ?auto_96634 ?auto_96636 ) ) ( not ( = ?auto_96634 ?auto_96637 ) ) ( not ( = ?auto_96634 ?auto_96638 ) ) ( not ( = ?auto_96635 ?auto_96636 ) ) ( not ( = ?auto_96635 ?auto_96637 ) ) ( not ( = ?auto_96635 ?auto_96638 ) ) ( not ( = ?auto_96636 ?auto_96637 ) ) ( not ( = ?auto_96636 ?auto_96638 ) ) ( not ( = ?auto_96637 ?auto_96638 ) ) ( ON-TABLE ?auto_96638 ) ( ON ?auto_96637 ?auto_96638 ) ( ON ?auto_96636 ?auto_96637 ) ( ON ?auto_96635 ?auto_96636 ) ( ON ?auto_96632 ?auto_96639 ) ( not ( = ?auto_96632 ?auto_96639 ) ) ( not ( = ?auto_96633 ?auto_96639 ) ) ( not ( = ?auto_96634 ?auto_96639 ) ) ( not ( = ?auto_96635 ?auto_96639 ) ) ( not ( = ?auto_96636 ?auto_96639 ) ) ( not ( = ?auto_96637 ?auto_96639 ) ) ( not ( = ?auto_96638 ?auto_96639 ) ) ( ON ?auto_96633 ?auto_96632 ) ( ON-TABLE ?auto_96639 ) ( CLEAR ?auto_96635 ) ( ON ?auto_96634 ?auto_96633 ) ( CLEAR ?auto_96634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96639 ?auto_96632 ?auto_96633 )
      ( MAKE-7PILE ?auto_96632 ?auto_96633 ?auto_96634 ?auto_96635 ?auto_96636 ?auto_96637 ?auto_96638 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96640 - BLOCK
      ?auto_96641 - BLOCK
      ?auto_96642 - BLOCK
      ?auto_96643 - BLOCK
      ?auto_96644 - BLOCK
      ?auto_96645 - BLOCK
      ?auto_96646 - BLOCK
    )
    :vars
    (
      ?auto_96647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96640 ?auto_96641 ) ) ( not ( = ?auto_96640 ?auto_96642 ) ) ( not ( = ?auto_96640 ?auto_96643 ) ) ( not ( = ?auto_96640 ?auto_96644 ) ) ( not ( = ?auto_96640 ?auto_96645 ) ) ( not ( = ?auto_96640 ?auto_96646 ) ) ( not ( = ?auto_96641 ?auto_96642 ) ) ( not ( = ?auto_96641 ?auto_96643 ) ) ( not ( = ?auto_96641 ?auto_96644 ) ) ( not ( = ?auto_96641 ?auto_96645 ) ) ( not ( = ?auto_96641 ?auto_96646 ) ) ( not ( = ?auto_96642 ?auto_96643 ) ) ( not ( = ?auto_96642 ?auto_96644 ) ) ( not ( = ?auto_96642 ?auto_96645 ) ) ( not ( = ?auto_96642 ?auto_96646 ) ) ( not ( = ?auto_96643 ?auto_96644 ) ) ( not ( = ?auto_96643 ?auto_96645 ) ) ( not ( = ?auto_96643 ?auto_96646 ) ) ( not ( = ?auto_96644 ?auto_96645 ) ) ( not ( = ?auto_96644 ?auto_96646 ) ) ( not ( = ?auto_96645 ?auto_96646 ) ) ( ON-TABLE ?auto_96646 ) ( ON ?auto_96645 ?auto_96646 ) ( ON ?auto_96644 ?auto_96645 ) ( ON ?auto_96640 ?auto_96647 ) ( not ( = ?auto_96640 ?auto_96647 ) ) ( not ( = ?auto_96641 ?auto_96647 ) ) ( not ( = ?auto_96642 ?auto_96647 ) ) ( not ( = ?auto_96643 ?auto_96647 ) ) ( not ( = ?auto_96644 ?auto_96647 ) ) ( not ( = ?auto_96645 ?auto_96647 ) ) ( not ( = ?auto_96646 ?auto_96647 ) ) ( ON ?auto_96641 ?auto_96640 ) ( ON-TABLE ?auto_96647 ) ( ON ?auto_96642 ?auto_96641 ) ( CLEAR ?auto_96642 ) ( HOLDING ?auto_96643 ) ( CLEAR ?auto_96644 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96646 ?auto_96645 ?auto_96644 ?auto_96643 )
      ( MAKE-7PILE ?auto_96640 ?auto_96641 ?auto_96642 ?auto_96643 ?auto_96644 ?auto_96645 ?auto_96646 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96648 - BLOCK
      ?auto_96649 - BLOCK
      ?auto_96650 - BLOCK
      ?auto_96651 - BLOCK
      ?auto_96652 - BLOCK
      ?auto_96653 - BLOCK
      ?auto_96654 - BLOCK
    )
    :vars
    (
      ?auto_96655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96648 ?auto_96649 ) ) ( not ( = ?auto_96648 ?auto_96650 ) ) ( not ( = ?auto_96648 ?auto_96651 ) ) ( not ( = ?auto_96648 ?auto_96652 ) ) ( not ( = ?auto_96648 ?auto_96653 ) ) ( not ( = ?auto_96648 ?auto_96654 ) ) ( not ( = ?auto_96649 ?auto_96650 ) ) ( not ( = ?auto_96649 ?auto_96651 ) ) ( not ( = ?auto_96649 ?auto_96652 ) ) ( not ( = ?auto_96649 ?auto_96653 ) ) ( not ( = ?auto_96649 ?auto_96654 ) ) ( not ( = ?auto_96650 ?auto_96651 ) ) ( not ( = ?auto_96650 ?auto_96652 ) ) ( not ( = ?auto_96650 ?auto_96653 ) ) ( not ( = ?auto_96650 ?auto_96654 ) ) ( not ( = ?auto_96651 ?auto_96652 ) ) ( not ( = ?auto_96651 ?auto_96653 ) ) ( not ( = ?auto_96651 ?auto_96654 ) ) ( not ( = ?auto_96652 ?auto_96653 ) ) ( not ( = ?auto_96652 ?auto_96654 ) ) ( not ( = ?auto_96653 ?auto_96654 ) ) ( ON-TABLE ?auto_96654 ) ( ON ?auto_96653 ?auto_96654 ) ( ON ?auto_96652 ?auto_96653 ) ( ON ?auto_96648 ?auto_96655 ) ( not ( = ?auto_96648 ?auto_96655 ) ) ( not ( = ?auto_96649 ?auto_96655 ) ) ( not ( = ?auto_96650 ?auto_96655 ) ) ( not ( = ?auto_96651 ?auto_96655 ) ) ( not ( = ?auto_96652 ?auto_96655 ) ) ( not ( = ?auto_96653 ?auto_96655 ) ) ( not ( = ?auto_96654 ?auto_96655 ) ) ( ON ?auto_96649 ?auto_96648 ) ( ON-TABLE ?auto_96655 ) ( ON ?auto_96650 ?auto_96649 ) ( CLEAR ?auto_96652 ) ( ON ?auto_96651 ?auto_96650 ) ( CLEAR ?auto_96651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96655 ?auto_96648 ?auto_96649 ?auto_96650 )
      ( MAKE-7PILE ?auto_96648 ?auto_96649 ?auto_96650 ?auto_96651 ?auto_96652 ?auto_96653 ?auto_96654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96656 - BLOCK
      ?auto_96657 - BLOCK
      ?auto_96658 - BLOCK
      ?auto_96659 - BLOCK
      ?auto_96660 - BLOCK
      ?auto_96661 - BLOCK
      ?auto_96662 - BLOCK
    )
    :vars
    (
      ?auto_96663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96656 ?auto_96657 ) ) ( not ( = ?auto_96656 ?auto_96658 ) ) ( not ( = ?auto_96656 ?auto_96659 ) ) ( not ( = ?auto_96656 ?auto_96660 ) ) ( not ( = ?auto_96656 ?auto_96661 ) ) ( not ( = ?auto_96656 ?auto_96662 ) ) ( not ( = ?auto_96657 ?auto_96658 ) ) ( not ( = ?auto_96657 ?auto_96659 ) ) ( not ( = ?auto_96657 ?auto_96660 ) ) ( not ( = ?auto_96657 ?auto_96661 ) ) ( not ( = ?auto_96657 ?auto_96662 ) ) ( not ( = ?auto_96658 ?auto_96659 ) ) ( not ( = ?auto_96658 ?auto_96660 ) ) ( not ( = ?auto_96658 ?auto_96661 ) ) ( not ( = ?auto_96658 ?auto_96662 ) ) ( not ( = ?auto_96659 ?auto_96660 ) ) ( not ( = ?auto_96659 ?auto_96661 ) ) ( not ( = ?auto_96659 ?auto_96662 ) ) ( not ( = ?auto_96660 ?auto_96661 ) ) ( not ( = ?auto_96660 ?auto_96662 ) ) ( not ( = ?auto_96661 ?auto_96662 ) ) ( ON-TABLE ?auto_96662 ) ( ON ?auto_96661 ?auto_96662 ) ( ON ?auto_96656 ?auto_96663 ) ( not ( = ?auto_96656 ?auto_96663 ) ) ( not ( = ?auto_96657 ?auto_96663 ) ) ( not ( = ?auto_96658 ?auto_96663 ) ) ( not ( = ?auto_96659 ?auto_96663 ) ) ( not ( = ?auto_96660 ?auto_96663 ) ) ( not ( = ?auto_96661 ?auto_96663 ) ) ( not ( = ?auto_96662 ?auto_96663 ) ) ( ON ?auto_96657 ?auto_96656 ) ( ON-TABLE ?auto_96663 ) ( ON ?auto_96658 ?auto_96657 ) ( ON ?auto_96659 ?auto_96658 ) ( CLEAR ?auto_96659 ) ( HOLDING ?auto_96660 ) ( CLEAR ?auto_96661 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96662 ?auto_96661 ?auto_96660 )
      ( MAKE-7PILE ?auto_96656 ?auto_96657 ?auto_96658 ?auto_96659 ?auto_96660 ?auto_96661 ?auto_96662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96664 - BLOCK
      ?auto_96665 - BLOCK
      ?auto_96666 - BLOCK
      ?auto_96667 - BLOCK
      ?auto_96668 - BLOCK
      ?auto_96669 - BLOCK
      ?auto_96670 - BLOCK
    )
    :vars
    (
      ?auto_96671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96664 ?auto_96665 ) ) ( not ( = ?auto_96664 ?auto_96666 ) ) ( not ( = ?auto_96664 ?auto_96667 ) ) ( not ( = ?auto_96664 ?auto_96668 ) ) ( not ( = ?auto_96664 ?auto_96669 ) ) ( not ( = ?auto_96664 ?auto_96670 ) ) ( not ( = ?auto_96665 ?auto_96666 ) ) ( not ( = ?auto_96665 ?auto_96667 ) ) ( not ( = ?auto_96665 ?auto_96668 ) ) ( not ( = ?auto_96665 ?auto_96669 ) ) ( not ( = ?auto_96665 ?auto_96670 ) ) ( not ( = ?auto_96666 ?auto_96667 ) ) ( not ( = ?auto_96666 ?auto_96668 ) ) ( not ( = ?auto_96666 ?auto_96669 ) ) ( not ( = ?auto_96666 ?auto_96670 ) ) ( not ( = ?auto_96667 ?auto_96668 ) ) ( not ( = ?auto_96667 ?auto_96669 ) ) ( not ( = ?auto_96667 ?auto_96670 ) ) ( not ( = ?auto_96668 ?auto_96669 ) ) ( not ( = ?auto_96668 ?auto_96670 ) ) ( not ( = ?auto_96669 ?auto_96670 ) ) ( ON-TABLE ?auto_96670 ) ( ON ?auto_96669 ?auto_96670 ) ( ON ?auto_96664 ?auto_96671 ) ( not ( = ?auto_96664 ?auto_96671 ) ) ( not ( = ?auto_96665 ?auto_96671 ) ) ( not ( = ?auto_96666 ?auto_96671 ) ) ( not ( = ?auto_96667 ?auto_96671 ) ) ( not ( = ?auto_96668 ?auto_96671 ) ) ( not ( = ?auto_96669 ?auto_96671 ) ) ( not ( = ?auto_96670 ?auto_96671 ) ) ( ON ?auto_96665 ?auto_96664 ) ( ON-TABLE ?auto_96671 ) ( ON ?auto_96666 ?auto_96665 ) ( ON ?auto_96667 ?auto_96666 ) ( CLEAR ?auto_96669 ) ( ON ?auto_96668 ?auto_96667 ) ( CLEAR ?auto_96668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96671 ?auto_96664 ?auto_96665 ?auto_96666 ?auto_96667 )
      ( MAKE-7PILE ?auto_96664 ?auto_96665 ?auto_96666 ?auto_96667 ?auto_96668 ?auto_96669 ?auto_96670 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96672 - BLOCK
      ?auto_96673 - BLOCK
      ?auto_96674 - BLOCK
      ?auto_96675 - BLOCK
      ?auto_96676 - BLOCK
      ?auto_96677 - BLOCK
      ?auto_96678 - BLOCK
    )
    :vars
    (
      ?auto_96679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96672 ?auto_96673 ) ) ( not ( = ?auto_96672 ?auto_96674 ) ) ( not ( = ?auto_96672 ?auto_96675 ) ) ( not ( = ?auto_96672 ?auto_96676 ) ) ( not ( = ?auto_96672 ?auto_96677 ) ) ( not ( = ?auto_96672 ?auto_96678 ) ) ( not ( = ?auto_96673 ?auto_96674 ) ) ( not ( = ?auto_96673 ?auto_96675 ) ) ( not ( = ?auto_96673 ?auto_96676 ) ) ( not ( = ?auto_96673 ?auto_96677 ) ) ( not ( = ?auto_96673 ?auto_96678 ) ) ( not ( = ?auto_96674 ?auto_96675 ) ) ( not ( = ?auto_96674 ?auto_96676 ) ) ( not ( = ?auto_96674 ?auto_96677 ) ) ( not ( = ?auto_96674 ?auto_96678 ) ) ( not ( = ?auto_96675 ?auto_96676 ) ) ( not ( = ?auto_96675 ?auto_96677 ) ) ( not ( = ?auto_96675 ?auto_96678 ) ) ( not ( = ?auto_96676 ?auto_96677 ) ) ( not ( = ?auto_96676 ?auto_96678 ) ) ( not ( = ?auto_96677 ?auto_96678 ) ) ( ON-TABLE ?auto_96678 ) ( ON ?auto_96672 ?auto_96679 ) ( not ( = ?auto_96672 ?auto_96679 ) ) ( not ( = ?auto_96673 ?auto_96679 ) ) ( not ( = ?auto_96674 ?auto_96679 ) ) ( not ( = ?auto_96675 ?auto_96679 ) ) ( not ( = ?auto_96676 ?auto_96679 ) ) ( not ( = ?auto_96677 ?auto_96679 ) ) ( not ( = ?auto_96678 ?auto_96679 ) ) ( ON ?auto_96673 ?auto_96672 ) ( ON-TABLE ?auto_96679 ) ( ON ?auto_96674 ?auto_96673 ) ( ON ?auto_96675 ?auto_96674 ) ( ON ?auto_96676 ?auto_96675 ) ( CLEAR ?auto_96676 ) ( HOLDING ?auto_96677 ) ( CLEAR ?auto_96678 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96678 ?auto_96677 )
      ( MAKE-7PILE ?auto_96672 ?auto_96673 ?auto_96674 ?auto_96675 ?auto_96676 ?auto_96677 ?auto_96678 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96680 - BLOCK
      ?auto_96681 - BLOCK
      ?auto_96682 - BLOCK
      ?auto_96683 - BLOCK
      ?auto_96684 - BLOCK
      ?auto_96685 - BLOCK
      ?auto_96686 - BLOCK
    )
    :vars
    (
      ?auto_96687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96680 ?auto_96681 ) ) ( not ( = ?auto_96680 ?auto_96682 ) ) ( not ( = ?auto_96680 ?auto_96683 ) ) ( not ( = ?auto_96680 ?auto_96684 ) ) ( not ( = ?auto_96680 ?auto_96685 ) ) ( not ( = ?auto_96680 ?auto_96686 ) ) ( not ( = ?auto_96681 ?auto_96682 ) ) ( not ( = ?auto_96681 ?auto_96683 ) ) ( not ( = ?auto_96681 ?auto_96684 ) ) ( not ( = ?auto_96681 ?auto_96685 ) ) ( not ( = ?auto_96681 ?auto_96686 ) ) ( not ( = ?auto_96682 ?auto_96683 ) ) ( not ( = ?auto_96682 ?auto_96684 ) ) ( not ( = ?auto_96682 ?auto_96685 ) ) ( not ( = ?auto_96682 ?auto_96686 ) ) ( not ( = ?auto_96683 ?auto_96684 ) ) ( not ( = ?auto_96683 ?auto_96685 ) ) ( not ( = ?auto_96683 ?auto_96686 ) ) ( not ( = ?auto_96684 ?auto_96685 ) ) ( not ( = ?auto_96684 ?auto_96686 ) ) ( not ( = ?auto_96685 ?auto_96686 ) ) ( ON-TABLE ?auto_96686 ) ( ON ?auto_96680 ?auto_96687 ) ( not ( = ?auto_96680 ?auto_96687 ) ) ( not ( = ?auto_96681 ?auto_96687 ) ) ( not ( = ?auto_96682 ?auto_96687 ) ) ( not ( = ?auto_96683 ?auto_96687 ) ) ( not ( = ?auto_96684 ?auto_96687 ) ) ( not ( = ?auto_96685 ?auto_96687 ) ) ( not ( = ?auto_96686 ?auto_96687 ) ) ( ON ?auto_96681 ?auto_96680 ) ( ON-TABLE ?auto_96687 ) ( ON ?auto_96682 ?auto_96681 ) ( ON ?auto_96683 ?auto_96682 ) ( ON ?auto_96684 ?auto_96683 ) ( CLEAR ?auto_96686 ) ( ON ?auto_96685 ?auto_96684 ) ( CLEAR ?auto_96685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96687 ?auto_96680 ?auto_96681 ?auto_96682 ?auto_96683 ?auto_96684 )
      ( MAKE-7PILE ?auto_96680 ?auto_96681 ?auto_96682 ?auto_96683 ?auto_96684 ?auto_96685 ?auto_96686 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96688 - BLOCK
      ?auto_96689 - BLOCK
      ?auto_96690 - BLOCK
      ?auto_96691 - BLOCK
      ?auto_96692 - BLOCK
      ?auto_96693 - BLOCK
      ?auto_96694 - BLOCK
    )
    :vars
    (
      ?auto_96695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96688 ?auto_96689 ) ) ( not ( = ?auto_96688 ?auto_96690 ) ) ( not ( = ?auto_96688 ?auto_96691 ) ) ( not ( = ?auto_96688 ?auto_96692 ) ) ( not ( = ?auto_96688 ?auto_96693 ) ) ( not ( = ?auto_96688 ?auto_96694 ) ) ( not ( = ?auto_96689 ?auto_96690 ) ) ( not ( = ?auto_96689 ?auto_96691 ) ) ( not ( = ?auto_96689 ?auto_96692 ) ) ( not ( = ?auto_96689 ?auto_96693 ) ) ( not ( = ?auto_96689 ?auto_96694 ) ) ( not ( = ?auto_96690 ?auto_96691 ) ) ( not ( = ?auto_96690 ?auto_96692 ) ) ( not ( = ?auto_96690 ?auto_96693 ) ) ( not ( = ?auto_96690 ?auto_96694 ) ) ( not ( = ?auto_96691 ?auto_96692 ) ) ( not ( = ?auto_96691 ?auto_96693 ) ) ( not ( = ?auto_96691 ?auto_96694 ) ) ( not ( = ?auto_96692 ?auto_96693 ) ) ( not ( = ?auto_96692 ?auto_96694 ) ) ( not ( = ?auto_96693 ?auto_96694 ) ) ( ON ?auto_96688 ?auto_96695 ) ( not ( = ?auto_96688 ?auto_96695 ) ) ( not ( = ?auto_96689 ?auto_96695 ) ) ( not ( = ?auto_96690 ?auto_96695 ) ) ( not ( = ?auto_96691 ?auto_96695 ) ) ( not ( = ?auto_96692 ?auto_96695 ) ) ( not ( = ?auto_96693 ?auto_96695 ) ) ( not ( = ?auto_96694 ?auto_96695 ) ) ( ON ?auto_96689 ?auto_96688 ) ( ON-TABLE ?auto_96695 ) ( ON ?auto_96690 ?auto_96689 ) ( ON ?auto_96691 ?auto_96690 ) ( ON ?auto_96692 ?auto_96691 ) ( ON ?auto_96693 ?auto_96692 ) ( CLEAR ?auto_96693 ) ( HOLDING ?auto_96694 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96694 )
      ( MAKE-7PILE ?auto_96688 ?auto_96689 ?auto_96690 ?auto_96691 ?auto_96692 ?auto_96693 ?auto_96694 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96696 - BLOCK
      ?auto_96697 - BLOCK
      ?auto_96698 - BLOCK
      ?auto_96699 - BLOCK
      ?auto_96700 - BLOCK
      ?auto_96701 - BLOCK
      ?auto_96702 - BLOCK
    )
    :vars
    (
      ?auto_96703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96696 ?auto_96697 ) ) ( not ( = ?auto_96696 ?auto_96698 ) ) ( not ( = ?auto_96696 ?auto_96699 ) ) ( not ( = ?auto_96696 ?auto_96700 ) ) ( not ( = ?auto_96696 ?auto_96701 ) ) ( not ( = ?auto_96696 ?auto_96702 ) ) ( not ( = ?auto_96697 ?auto_96698 ) ) ( not ( = ?auto_96697 ?auto_96699 ) ) ( not ( = ?auto_96697 ?auto_96700 ) ) ( not ( = ?auto_96697 ?auto_96701 ) ) ( not ( = ?auto_96697 ?auto_96702 ) ) ( not ( = ?auto_96698 ?auto_96699 ) ) ( not ( = ?auto_96698 ?auto_96700 ) ) ( not ( = ?auto_96698 ?auto_96701 ) ) ( not ( = ?auto_96698 ?auto_96702 ) ) ( not ( = ?auto_96699 ?auto_96700 ) ) ( not ( = ?auto_96699 ?auto_96701 ) ) ( not ( = ?auto_96699 ?auto_96702 ) ) ( not ( = ?auto_96700 ?auto_96701 ) ) ( not ( = ?auto_96700 ?auto_96702 ) ) ( not ( = ?auto_96701 ?auto_96702 ) ) ( ON ?auto_96696 ?auto_96703 ) ( not ( = ?auto_96696 ?auto_96703 ) ) ( not ( = ?auto_96697 ?auto_96703 ) ) ( not ( = ?auto_96698 ?auto_96703 ) ) ( not ( = ?auto_96699 ?auto_96703 ) ) ( not ( = ?auto_96700 ?auto_96703 ) ) ( not ( = ?auto_96701 ?auto_96703 ) ) ( not ( = ?auto_96702 ?auto_96703 ) ) ( ON ?auto_96697 ?auto_96696 ) ( ON-TABLE ?auto_96703 ) ( ON ?auto_96698 ?auto_96697 ) ( ON ?auto_96699 ?auto_96698 ) ( ON ?auto_96700 ?auto_96699 ) ( ON ?auto_96701 ?auto_96700 ) ( ON ?auto_96702 ?auto_96701 ) ( CLEAR ?auto_96702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96703 ?auto_96696 ?auto_96697 ?auto_96698 ?auto_96699 ?auto_96700 ?auto_96701 )
      ( MAKE-7PILE ?auto_96696 ?auto_96697 ?auto_96698 ?auto_96699 ?auto_96700 ?auto_96701 ?auto_96702 ) )
  )

)

