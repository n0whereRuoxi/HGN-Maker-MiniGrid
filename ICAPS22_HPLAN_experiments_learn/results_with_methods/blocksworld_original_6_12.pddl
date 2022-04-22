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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61194 - BLOCK
      ?auto_61195 - BLOCK
      ?auto_61196 - BLOCK
      ?auto_61197 - BLOCK
      ?auto_61198 - BLOCK
      ?auto_61199 - BLOCK
    )
    :vars
    (
      ?auto_61200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61200 ?auto_61199 ) ( CLEAR ?auto_61200 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61194 ) ( ON ?auto_61195 ?auto_61194 ) ( ON ?auto_61196 ?auto_61195 ) ( ON ?auto_61197 ?auto_61196 ) ( ON ?auto_61198 ?auto_61197 ) ( ON ?auto_61199 ?auto_61198 ) ( not ( = ?auto_61194 ?auto_61195 ) ) ( not ( = ?auto_61194 ?auto_61196 ) ) ( not ( = ?auto_61194 ?auto_61197 ) ) ( not ( = ?auto_61194 ?auto_61198 ) ) ( not ( = ?auto_61194 ?auto_61199 ) ) ( not ( = ?auto_61194 ?auto_61200 ) ) ( not ( = ?auto_61195 ?auto_61196 ) ) ( not ( = ?auto_61195 ?auto_61197 ) ) ( not ( = ?auto_61195 ?auto_61198 ) ) ( not ( = ?auto_61195 ?auto_61199 ) ) ( not ( = ?auto_61195 ?auto_61200 ) ) ( not ( = ?auto_61196 ?auto_61197 ) ) ( not ( = ?auto_61196 ?auto_61198 ) ) ( not ( = ?auto_61196 ?auto_61199 ) ) ( not ( = ?auto_61196 ?auto_61200 ) ) ( not ( = ?auto_61197 ?auto_61198 ) ) ( not ( = ?auto_61197 ?auto_61199 ) ) ( not ( = ?auto_61197 ?auto_61200 ) ) ( not ( = ?auto_61198 ?auto_61199 ) ) ( not ( = ?auto_61198 ?auto_61200 ) ) ( not ( = ?auto_61199 ?auto_61200 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61200 ?auto_61199 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61202 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61202 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_61202 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61203 - BLOCK
    )
    :vars
    (
      ?auto_61204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61203 ?auto_61204 ) ( CLEAR ?auto_61203 ) ( HAND-EMPTY ) ( not ( = ?auto_61203 ?auto_61204 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61203 ?auto_61204 )
      ( MAKE-1PILE ?auto_61203 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61210 - BLOCK
      ?auto_61211 - BLOCK
      ?auto_61212 - BLOCK
      ?auto_61213 - BLOCK
      ?auto_61214 - BLOCK
    )
    :vars
    (
      ?auto_61215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61215 ?auto_61214 ) ( CLEAR ?auto_61215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61210 ) ( ON ?auto_61211 ?auto_61210 ) ( ON ?auto_61212 ?auto_61211 ) ( ON ?auto_61213 ?auto_61212 ) ( ON ?auto_61214 ?auto_61213 ) ( not ( = ?auto_61210 ?auto_61211 ) ) ( not ( = ?auto_61210 ?auto_61212 ) ) ( not ( = ?auto_61210 ?auto_61213 ) ) ( not ( = ?auto_61210 ?auto_61214 ) ) ( not ( = ?auto_61210 ?auto_61215 ) ) ( not ( = ?auto_61211 ?auto_61212 ) ) ( not ( = ?auto_61211 ?auto_61213 ) ) ( not ( = ?auto_61211 ?auto_61214 ) ) ( not ( = ?auto_61211 ?auto_61215 ) ) ( not ( = ?auto_61212 ?auto_61213 ) ) ( not ( = ?auto_61212 ?auto_61214 ) ) ( not ( = ?auto_61212 ?auto_61215 ) ) ( not ( = ?auto_61213 ?auto_61214 ) ) ( not ( = ?auto_61213 ?auto_61215 ) ) ( not ( = ?auto_61214 ?auto_61215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61215 ?auto_61214 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61216 - BLOCK
      ?auto_61217 - BLOCK
      ?auto_61218 - BLOCK
      ?auto_61219 - BLOCK
      ?auto_61220 - BLOCK
    )
    :vars
    (
      ?auto_61221 - BLOCK
      ?auto_61222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61221 ?auto_61220 ) ( CLEAR ?auto_61221 ) ( ON-TABLE ?auto_61216 ) ( ON ?auto_61217 ?auto_61216 ) ( ON ?auto_61218 ?auto_61217 ) ( ON ?auto_61219 ?auto_61218 ) ( ON ?auto_61220 ?auto_61219 ) ( not ( = ?auto_61216 ?auto_61217 ) ) ( not ( = ?auto_61216 ?auto_61218 ) ) ( not ( = ?auto_61216 ?auto_61219 ) ) ( not ( = ?auto_61216 ?auto_61220 ) ) ( not ( = ?auto_61216 ?auto_61221 ) ) ( not ( = ?auto_61217 ?auto_61218 ) ) ( not ( = ?auto_61217 ?auto_61219 ) ) ( not ( = ?auto_61217 ?auto_61220 ) ) ( not ( = ?auto_61217 ?auto_61221 ) ) ( not ( = ?auto_61218 ?auto_61219 ) ) ( not ( = ?auto_61218 ?auto_61220 ) ) ( not ( = ?auto_61218 ?auto_61221 ) ) ( not ( = ?auto_61219 ?auto_61220 ) ) ( not ( = ?auto_61219 ?auto_61221 ) ) ( not ( = ?auto_61220 ?auto_61221 ) ) ( HOLDING ?auto_61222 ) ( not ( = ?auto_61216 ?auto_61222 ) ) ( not ( = ?auto_61217 ?auto_61222 ) ) ( not ( = ?auto_61218 ?auto_61222 ) ) ( not ( = ?auto_61219 ?auto_61222 ) ) ( not ( = ?auto_61220 ?auto_61222 ) ) ( not ( = ?auto_61221 ?auto_61222 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_61222 )
      ( MAKE-5PILE ?auto_61216 ?auto_61217 ?auto_61218 ?auto_61219 ?auto_61220 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61223 - BLOCK
      ?auto_61224 - BLOCK
      ?auto_61225 - BLOCK
      ?auto_61226 - BLOCK
      ?auto_61227 - BLOCK
    )
    :vars
    (
      ?auto_61229 - BLOCK
      ?auto_61228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61229 ?auto_61227 ) ( ON-TABLE ?auto_61223 ) ( ON ?auto_61224 ?auto_61223 ) ( ON ?auto_61225 ?auto_61224 ) ( ON ?auto_61226 ?auto_61225 ) ( ON ?auto_61227 ?auto_61226 ) ( not ( = ?auto_61223 ?auto_61224 ) ) ( not ( = ?auto_61223 ?auto_61225 ) ) ( not ( = ?auto_61223 ?auto_61226 ) ) ( not ( = ?auto_61223 ?auto_61227 ) ) ( not ( = ?auto_61223 ?auto_61229 ) ) ( not ( = ?auto_61224 ?auto_61225 ) ) ( not ( = ?auto_61224 ?auto_61226 ) ) ( not ( = ?auto_61224 ?auto_61227 ) ) ( not ( = ?auto_61224 ?auto_61229 ) ) ( not ( = ?auto_61225 ?auto_61226 ) ) ( not ( = ?auto_61225 ?auto_61227 ) ) ( not ( = ?auto_61225 ?auto_61229 ) ) ( not ( = ?auto_61226 ?auto_61227 ) ) ( not ( = ?auto_61226 ?auto_61229 ) ) ( not ( = ?auto_61227 ?auto_61229 ) ) ( not ( = ?auto_61223 ?auto_61228 ) ) ( not ( = ?auto_61224 ?auto_61228 ) ) ( not ( = ?auto_61225 ?auto_61228 ) ) ( not ( = ?auto_61226 ?auto_61228 ) ) ( not ( = ?auto_61227 ?auto_61228 ) ) ( not ( = ?auto_61229 ?auto_61228 ) ) ( ON ?auto_61228 ?auto_61229 ) ( CLEAR ?auto_61228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61223 ?auto_61224 ?auto_61225 ?auto_61226 ?auto_61227 ?auto_61229 )
      ( MAKE-5PILE ?auto_61223 ?auto_61224 ?auto_61225 ?auto_61226 ?auto_61227 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61232 - BLOCK
      ?auto_61233 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61233 ) ( CLEAR ?auto_61232 ) ( ON-TABLE ?auto_61232 ) ( not ( = ?auto_61232 ?auto_61233 ) ) )
    :subtasks
    ( ( !STACK ?auto_61233 ?auto_61232 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61234 - BLOCK
      ?auto_61235 - BLOCK
    )
    :vars
    (
      ?auto_61236 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61234 ) ( ON-TABLE ?auto_61234 ) ( not ( = ?auto_61234 ?auto_61235 ) ) ( ON ?auto_61235 ?auto_61236 ) ( CLEAR ?auto_61235 ) ( HAND-EMPTY ) ( not ( = ?auto_61234 ?auto_61236 ) ) ( not ( = ?auto_61235 ?auto_61236 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61235 ?auto_61236 )
      ( MAKE-2PILE ?auto_61234 ?auto_61235 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61237 - BLOCK
      ?auto_61238 - BLOCK
    )
    :vars
    (
      ?auto_61239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61237 ?auto_61238 ) ) ( ON ?auto_61238 ?auto_61239 ) ( CLEAR ?auto_61238 ) ( not ( = ?auto_61237 ?auto_61239 ) ) ( not ( = ?auto_61238 ?auto_61239 ) ) ( HOLDING ?auto_61237 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61237 )
      ( MAKE-2PILE ?auto_61237 ?auto_61238 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61240 - BLOCK
      ?auto_61241 - BLOCK
    )
    :vars
    (
      ?auto_61242 - BLOCK
      ?auto_61245 - BLOCK
      ?auto_61244 - BLOCK
      ?auto_61243 - BLOCK
      ?auto_61246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61240 ?auto_61241 ) ) ( ON ?auto_61241 ?auto_61242 ) ( not ( = ?auto_61240 ?auto_61242 ) ) ( not ( = ?auto_61241 ?auto_61242 ) ) ( ON ?auto_61240 ?auto_61241 ) ( CLEAR ?auto_61240 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61245 ) ( ON ?auto_61244 ?auto_61245 ) ( ON ?auto_61243 ?auto_61244 ) ( ON ?auto_61246 ?auto_61243 ) ( ON ?auto_61242 ?auto_61246 ) ( not ( = ?auto_61245 ?auto_61244 ) ) ( not ( = ?auto_61245 ?auto_61243 ) ) ( not ( = ?auto_61245 ?auto_61246 ) ) ( not ( = ?auto_61245 ?auto_61242 ) ) ( not ( = ?auto_61245 ?auto_61241 ) ) ( not ( = ?auto_61245 ?auto_61240 ) ) ( not ( = ?auto_61244 ?auto_61243 ) ) ( not ( = ?auto_61244 ?auto_61246 ) ) ( not ( = ?auto_61244 ?auto_61242 ) ) ( not ( = ?auto_61244 ?auto_61241 ) ) ( not ( = ?auto_61244 ?auto_61240 ) ) ( not ( = ?auto_61243 ?auto_61246 ) ) ( not ( = ?auto_61243 ?auto_61242 ) ) ( not ( = ?auto_61243 ?auto_61241 ) ) ( not ( = ?auto_61243 ?auto_61240 ) ) ( not ( = ?auto_61246 ?auto_61242 ) ) ( not ( = ?auto_61246 ?auto_61241 ) ) ( not ( = ?auto_61246 ?auto_61240 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61245 ?auto_61244 ?auto_61243 ?auto_61246 ?auto_61242 ?auto_61241 )
      ( MAKE-2PILE ?auto_61240 ?auto_61241 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61251 - BLOCK
      ?auto_61252 - BLOCK
      ?auto_61253 - BLOCK
      ?auto_61254 - BLOCK
    )
    :vars
    (
      ?auto_61255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61255 ?auto_61254 ) ( CLEAR ?auto_61255 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61251 ) ( ON ?auto_61252 ?auto_61251 ) ( ON ?auto_61253 ?auto_61252 ) ( ON ?auto_61254 ?auto_61253 ) ( not ( = ?auto_61251 ?auto_61252 ) ) ( not ( = ?auto_61251 ?auto_61253 ) ) ( not ( = ?auto_61251 ?auto_61254 ) ) ( not ( = ?auto_61251 ?auto_61255 ) ) ( not ( = ?auto_61252 ?auto_61253 ) ) ( not ( = ?auto_61252 ?auto_61254 ) ) ( not ( = ?auto_61252 ?auto_61255 ) ) ( not ( = ?auto_61253 ?auto_61254 ) ) ( not ( = ?auto_61253 ?auto_61255 ) ) ( not ( = ?auto_61254 ?auto_61255 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61255 ?auto_61254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61256 - BLOCK
      ?auto_61257 - BLOCK
      ?auto_61258 - BLOCK
      ?auto_61259 - BLOCK
    )
    :vars
    (
      ?auto_61260 - BLOCK
      ?auto_61261 - BLOCK
      ?auto_61262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61260 ?auto_61259 ) ( CLEAR ?auto_61260 ) ( ON-TABLE ?auto_61256 ) ( ON ?auto_61257 ?auto_61256 ) ( ON ?auto_61258 ?auto_61257 ) ( ON ?auto_61259 ?auto_61258 ) ( not ( = ?auto_61256 ?auto_61257 ) ) ( not ( = ?auto_61256 ?auto_61258 ) ) ( not ( = ?auto_61256 ?auto_61259 ) ) ( not ( = ?auto_61256 ?auto_61260 ) ) ( not ( = ?auto_61257 ?auto_61258 ) ) ( not ( = ?auto_61257 ?auto_61259 ) ) ( not ( = ?auto_61257 ?auto_61260 ) ) ( not ( = ?auto_61258 ?auto_61259 ) ) ( not ( = ?auto_61258 ?auto_61260 ) ) ( not ( = ?auto_61259 ?auto_61260 ) ) ( HOLDING ?auto_61261 ) ( CLEAR ?auto_61262 ) ( not ( = ?auto_61256 ?auto_61261 ) ) ( not ( = ?auto_61256 ?auto_61262 ) ) ( not ( = ?auto_61257 ?auto_61261 ) ) ( not ( = ?auto_61257 ?auto_61262 ) ) ( not ( = ?auto_61258 ?auto_61261 ) ) ( not ( = ?auto_61258 ?auto_61262 ) ) ( not ( = ?auto_61259 ?auto_61261 ) ) ( not ( = ?auto_61259 ?auto_61262 ) ) ( not ( = ?auto_61260 ?auto_61261 ) ) ( not ( = ?auto_61260 ?auto_61262 ) ) ( not ( = ?auto_61261 ?auto_61262 ) ) )
    :subtasks
    ( ( !STACK ?auto_61261 ?auto_61262 )
      ( MAKE-4PILE ?auto_61256 ?auto_61257 ?auto_61258 ?auto_61259 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61263 - BLOCK
      ?auto_61264 - BLOCK
      ?auto_61265 - BLOCK
      ?auto_61266 - BLOCK
    )
    :vars
    (
      ?auto_61268 - BLOCK
      ?auto_61269 - BLOCK
      ?auto_61267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61268 ?auto_61266 ) ( ON-TABLE ?auto_61263 ) ( ON ?auto_61264 ?auto_61263 ) ( ON ?auto_61265 ?auto_61264 ) ( ON ?auto_61266 ?auto_61265 ) ( not ( = ?auto_61263 ?auto_61264 ) ) ( not ( = ?auto_61263 ?auto_61265 ) ) ( not ( = ?auto_61263 ?auto_61266 ) ) ( not ( = ?auto_61263 ?auto_61268 ) ) ( not ( = ?auto_61264 ?auto_61265 ) ) ( not ( = ?auto_61264 ?auto_61266 ) ) ( not ( = ?auto_61264 ?auto_61268 ) ) ( not ( = ?auto_61265 ?auto_61266 ) ) ( not ( = ?auto_61265 ?auto_61268 ) ) ( not ( = ?auto_61266 ?auto_61268 ) ) ( CLEAR ?auto_61269 ) ( not ( = ?auto_61263 ?auto_61267 ) ) ( not ( = ?auto_61263 ?auto_61269 ) ) ( not ( = ?auto_61264 ?auto_61267 ) ) ( not ( = ?auto_61264 ?auto_61269 ) ) ( not ( = ?auto_61265 ?auto_61267 ) ) ( not ( = ?auto_61265 ?auto_61269 ) ) ( not ( = ?auto_61266 ?auto_61267 ) ) ( not ( = ?auto_61266 ?auto_61269 ) ) ( not ( = ?auto_61268 ?auto_61267 ) ) ( not ( = ?auto_61268 ?auto_61269 ) ) ( not ( = ?auto_61267 ?auto_61269 ) ) ( ON ?auto_61267 ?auto_61268 ) ( CLEAR ?auto_61267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61263 ?auto_61264 ?auto_61265 ?auto_61266 ?auto_61268 )
      ( MAKE-4PILE ?auto_61263 ?auto_61264 ?auto_61265 ?auto_61266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61270 - BLOCK
      ?auto_61271 - BLOCK
      ?auto_61272 - BLOCK
      ?auto_61273 - BLOCK
    )
    :vars
    (
      ?auto_61276 - BLOCK
      ?auto_61275 - BLOCK
      ?auto_61274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61276 ?auto_61273 ) ( ON-TABLE ?auto_61270 ) ( ON ?auto_61271 ?auto_61270 ) ( ON ?auto_61272 ?auto_61271 ) ( ON ?auto_61273 ?auto_61272 ) ( not ( = ?auto_61270 ?auto_61271 ) ) ( not ( = ?auto_61270 ?auto_61272 ) ) ( not ( = ?auto_61270 ?auto_61273 ) ) ( not ( = ?auto_61270 ?auto_61276 ) ) ( not ( = ?auto_61271 ?auto_61272 ) ) ( not ( = ?auto_61271 ?auto_61273 ) ) ( not ( = ?auto_61271 ?auto_61276 ) ) ( not ( = ?auto_61272 ?auto_61273 ) ) ( not ( = ?auto_61272 ?auto_61276 ) ) ( not ( = ?auto_61273 ?auto_61276 ) ) ( not ( = ?auto_61270 ?auto_61275 ) ) ( not ( = ?auto_61270 ?auto_61274 ) ) ( not ( = ?auto_61271 ?auto_61275 ) ) ( not ( = ?auto_61271 ?auto_61274 ) ) ( not ( = ?auto_61272 ?auto_61275 ) ) ( not ( = ?auto_61272 ?auto_61274 ) ) ( not ( = ?auto_61273 ?auto_61275 ) ) ( not ( = ?auto_61273 ?auto_61274 ) ) ( not ( = ?auto_61276 ?auto_61275 ) ) ( not ( = ?auto_61276 ?auto_61274 ) ) ( not ( = ?auto_61275 ?auto_61274 ) ) ( ON ?auto_61275 ?auto_61276 ) ( CLEAR ?auto_61275 ) ( HOLDING ?auto_61274 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61274 )
      ( MAKE-4PILE ?auto_61270 ?auto_61271 ?auto_61272 ?auto_61273 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61277 - BLOCK
      ?auto_61278 - BLOCK
      ?auto_61279 - BLOCK
      ?auto_61280 - BLOCK
    )
    :vars
    (
      ?auto_61281 - BLOCK
      ?auto_61283 - BLOCK
      ?auto_61282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61281 ?auto_61280 ) ( ON-TABLE ?auto_61277 ) ( ON ?auto_61278 ?auto_61277 ) ( ON ?auto_61279 ?auto_61278 ) ( ON ?auto_61280 ?auto_61279 ) ( not ( = ?auto_61277 ?auto_61278 ) ) ( not ( = ?auto_61277 ?auto_61279 ) ) ( not ( = ?auto_61277 ?auto_61280 ) ) ( not ( = ?auto_61277 ?auto_61281 ) ) ( not ( = ?auto_61278 ?auto_61279 ) ) ( not ( = ?auto_61278 ?auto_61280 ) ) ( not ( = ?auto_61278 ?auto_61281 ) ) ( not ( = ?auto_61279 ?auto_61280 ) ) ( not ( = ?auto_61279 ?auto_61281 ) ) ( not ( = ?auto_61280 ?auto_61281 ) ) ( not ( = ?auto_61277 ?auto_61283 ) ) ( not ( = ?auto_61277 ?auto_61282 ) ) ( not ( = ?auto_61278 ?auto_61283 ) ) ( not ( = ?auto_61278 ?auto_61282 ) ) ( not ( = ?auto_61279 ?auto_61283 ) ) ( not ( = ?auto_61279 ?auto_61282 ) ) ( not ( = ?auto_61280 ?auto_61283 ) ) ( not ( = ?auto_61280 ?auto_61282 ) ) ( not ( = ?auto_61281 ?auto_61283 ) ) ( not ( = ?auto_61281 ?auto_61282 ) ) ( not ( = ?auto_61283 ?auto_61282 ) ) ( ON ?auto_61283 ?auto_61281 ) ( ON ?auto_61282 ?auto_61283 ) ( CLEAR ?auto_61282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61277 ?auto_61278 ?auto_61279 ?auto_61280 ?auto_61281 ?auto_61283 )
      ( MAKE-4PILE ?auto_61277 ?auto_61278 ?auto_61279 ?auto_61280 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61287 - BLOCK
      ?auto_61288 - BLOCK
      ?auto_61289 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61289 ) ( CLEAR ?auto_61288 ) ( ON-TABLE ?auto_61287 ) ( ON ?auto_61288 ?auto_61287 ) ( not ( = ?auto_61287 ?auto_61288 ) ) ( not ( = ?auto_61287 ?auto_61289 ) ) ( not ( = ?auto_61288 ?auto_61289 ) ) )
    :subtasks
    ( ( !STACK ?auto_61289 ?auto_61288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61290 - BLOCK
      ?auto_61291 - BLOCK
      ?auto_61292 - BLOCK
    )
    :vars
    (
      ?auto_61293 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61291 ) ( ON-TABLE ?auto_61290 ) ( ON ?auto_61291 ?auto_61290 ) ( not ( = ?auto_61290 ?auto_61291 ) ) ( not ( = ?auto_61290 ?auto_61292 ) ) ( not ( = ?auto_61291 ?auto_61292 ) ) ( ON ?auto_61292 ?auto_61293 ) ( CLEAR ?auto_61292 ) ( HAND-EMPTY ) ( not ( = ?auto_61290 ?auto_61293 ) ) ( not ( = ?auto_61291 ?auto_61293 ) ) ( not ( = ?auto_61292 ?auto_61293 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61292 ?auto_61293 )
      ( MAKE-3PILE ?auto_61290 ?auto_61291 ?auto_61292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61294 - BLOCK
      ?auto_61295 - BLOCK
      ?auto_61296 - BLOCK
    )
    :vars
    (
      ?auto_61297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61294 ) ( not ( = ?auto_61294 ?auto_61295 ) ) ( not ( = ?auto_61294 ?auto_61296 ) ) ( not ( = ?auto_61295 ?auto_61296 ) ) ( ON ?auto_61296 ?auto_61297 ) ( CLEAR ?auto_61296 ) ( not ( = ?auto_61294 ?auto_61297 ) ) ( not ( = ?auto_61295 ?auto_61297 ) ) ( not ( = ?auto_61296 ?auto_61297 ) ) ( HOLDING ?auto_61295 ) ( CLEAR ?auto_61294 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61294 ?auto_61295 )
      ( MAKE-3PILE ?auto_61294 ?auto_61295 ?auto_61296 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61298 - BLOCK
      ?auto_61299 - BLOCK
      ?auto_61300 - BLOCK
    )
    :vars
    (
      ?auto_61301 - BLOCK
      ?auto_61304 - BLOCK
      ?auto_61303 - BLOCK
      ?auto_61302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61298 ) ( not ( = ?auto_61298 ?auto_61299 ) ) ( not ( = ?auto_61298 ?auto_61300 ) ) ( not ( = ?auto_61299 ?auto_61300 ) ) ( ON ?auto_61300 ?auto_61301 ) ( not ( = ?auto_61298 ?auto_61301 ) ) ( not ( = ?auto_61299 ?auto_61301 ) ) ( not ( = ?auto_61300 ?auto_61301 ) ) ( CLEAR ?auto_61298 ) ( ON ?auto_61299 ?auto_61300 ) ( CLEAR ?auto_61299 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61304 ) ( ON ?auto_61303 ?auto_61304 ) ( ON ?auto_61302 ?auto_61303 ) ( ON ?auto_61301 ?auto_61302 ) ( not ( = ?auto_61304 ?auto_61303 ) ) ( not ( = ?auto_61304 ?auto_61302 ) ) ( not ( = ?auto_61304 ?auto_61301 ) ) ( not ( = ?auto_61304 ?auto_61300 ) ) ( not ( = ?auto_61304 ?auto_61299 ) ) ( not ( = ?auto_61303 ?auto_61302 ) ) ( not ( = ?auto_61303 ?auto_61301 ) ) ( not ( = ?auto_61303 ?auto_61300 ) ) ( not ( = ?auto_61303 ?auto_61299 ) ) ( not ( = ?auto_61302 ?auto_61301 ) ) ( not ( = ?auto_61302 ?auto_61300 ) ) ( not ( = ?auto_61302 ?auto_61299 ) ) ( not ( = ?auto_61298 ?auto_61304 ) ) ( not ( = ?auto_61298 ?auto_61303 ) ) ( not ( = ?auto_61298 ?auto_61302 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61304 ?auto_61303 ?auto_61302 ?auto_61301 ?auto_61300 )
      ( MAKE-3PILE ?auto_61298 ?auto_61299 ?auto_61300 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61305 - BLOCK
      ?auto_61306 - BLOCK
      ?auto_61307 - BLOCK
    )
    :vars
    (
      ?auto_61309 - BLOCK
      ?auto_61311 - BLOCK
      ?auto_61310 - BLOCK
      ?auto_61308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61305 ?auto_61306 ) ) ( not ( = ?auto_61305 ?auto_61307 ) ) ( not ( = ?auto_61306 ?auto_61307 ) ) ( ON ?auto_61307 ?auto_61309 ) ( not ( = ?auto_61305 ?auto_61309 ) ) ( not ( = ?auto_61306 ?auto_61309 ) ) ( not ( = ?auto_61307 ?auto_61309 ) ) ( ON ?auto_61306 ?auto_61307 ) ( CLEAR ?auto_61306 ) ( ON-TABLE ?auto_61311 ) ( ON ?auto_61310 ?auto_61311 ) ( ON ?auto_61308 ?auto_61310 ) ( ON ?auto_61309 ?auto_61308 ) ( not ( = ?auto_61311 ?auto_61310 ) ) ( not ( = ?auto_61311 ?auto_61308 ) ) ( not ( = ?auto_61311 ?auto_61309 ) ) ( not ( = ?auto_61311 ?auto_61307 ) ) ( not ( = ?auto_61311 ?auto_61306 ) ) ( not ( = ?auto_61310 ?auto_61308 ) ) ( not ( = ?auto_61310 ?auto_61309 ) ) ( not ( = ?auto_61310 ?auto_61307 ) ) ( not ( = ?auto_61310 ?auto_61306 ) ) ( not ( = ?auto_61308 ?auto_61309 ) ) ( not ( = ?auto_61308 ?auto_61307 ) ) ( not ( = ?auto_61308 ?auto_61306 ) ) ( not ( = ?auto_61305 ?auto_61311 ) ) ( not ( = ?auto_61305 ?auto_61310 ) ) ( not ( = ?auto_61305 ?auto_61308 ) ) ( HOLDING ?auto_61305 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61305 )
      ( MAKE-3PILE ?auto_61305 ?auto_61306 ?auto_61307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61312 - BLOCK
      ?auto_61313 - BLOCK
      ?auto_61314 - BLOCK
    )
    :vars
    (
      ?auto_61318 - BLOCK
      ?auto_61317 - BLOCK
      ?auto_61315 - BLOCK
      ?auto_61316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61312 ?auto_61313 ) ) ( not ( = ?auto_61312 ?auto_61314 ) ) ( not ( = ?auto_61313 ?auto_61314 ) ) ( ON ?auto_61314 ?auto_61318 ) ( not ( = ?auto_61312 ?auto_61318 ) ) ( not ( = ?auto_61313 ?auto_61318 ) ) ( not ( = ?auto_61314 ?auto_61318 ) ) ( ON ?auto_61313 ?auto_61314 ) ( ON-TABLE ?auto_61317 ) ( ON ?auto_61315 ?auto_61317 ) ( ON ?auto_61316 ?auto_61315 ) ( ON ?auto_61318 ?auto_61316 ) ( not ( = ?auto_61317 ?auto_61315 ) ) ( not ( = ?auto_61317 ?auto_61316 ) ) ( not ( = ?auto_61317 ?auto_61318 ) ) ( not ( = ?auto_61317 ?auto_61314 ) ) ( not ( = ?auto_61317 ?auto_61313 ) ) ( not ( = ?auto_61315 ?auto_61316 ) ) ( not ( = ?auto_61315 ?auto_61318 ) ) ( not ( = ?auto_61315 ?auto_61314 ) ) ( not ( = ?auto_61315 ?auto_61313 ) ) ( not ( = ?auto_61316 ?auto_61318 ) ) ( not ( = ?auto_61316 ?auto_61314 ) ) ( not ( = ?auto_61316 ?auto_61313 ) ) ( not ( = ?auto_61312 ?auto_61317 ) ) ( not ( = ?auto_61312 ?auto_61315 ) ) ( not ( = ?auto_61312 ?auto_61316 ) ) ( ON ?auto_61312 ?auto_61313 ) ( CLEAR ?auto_61312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61317 ?auto_61315 ?auto_61316 ?auto_61318 ?auto_61314 ?auto_61313 )
      ( MAKE-3PILE ?auto_61312 ?auto_61313 ?auto_61314 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61322 - BLOCK
      ?auto_61323 - BLOCK
      ?auto_61324 - BLOCK
    )
    :vars
    (
      ?auto_61325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61325 ?auto_61324 ) ( CLEAR ?auto_61325 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61322 ) ( ON ?auto_61323 ?auto_61322 ) ( ON ?auto_61324 ?auto_61323 ) ( not ( = ?auto_61322 ?auto_61323 ) ) ( not ( = ?auto_61322 ?auto_61324 ) ) ( not ( = ?auto_61322 ?auto_61325 ) ) ( not ( = ?auto_61323 ?auto_61324 ) ) ( not ( = ?auto_61323 ?auto_61325 ) ) ( not ( = ?auto_61324 ?auto_61325 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61325 ?auto_61324 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61326 - BLOCK
      ?auto_61327 - BLOCK
      ?auto_61328 - BLOCK
    )
    :vars
    (
      ?auto_61329 - BLOCK
      ?auto_61330 - BLOCK
      ?auto_61331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61329 ?auto_61328 ) ( CLEAR ?auto_61329 ) ( ON-TABLE ?auto_61326 ) ( ON ?auto_61327 ?auto_61326 ) ( ON ?auto_61328 ?auto_61327 ) ( not ( = ?auto_61326 ?auto_61327 ) ) ( not ( = ?auto_61326 ?auto_61328 ) ) ( not ( = ?auto_61326 ?auto_61329 ) ) ( not ( = ?auto_61327 ?auto_61328 ) ) ( not ( = ?auto_61327 ?auto_61329 ) ) ( not ( = ?auto_61328 ?auto_61329 ) ) ( HOLDING ?auto_61330 ) ( CLEAR ?auto_61331 ) ( not ( = ?auto_61326 ?auto_61330 ) ) ( not ( = ?auto_61326 ?auto_61331 ) ) ( not ( = ?auto_61327 ?auto_61330 ) ) ( not ( = ?auto_61327 ?auto_61331 ) ) ( not ( = ?auto_61328 ?auto_61330 ) ) ( not ( = ?auto_61328 ?auto_61331 ) ) ( not ( = ?auto_61329 ?auto_61330 ) ) ( not ( = ?auto_61329 ?auto_61331 ) ) ( not ( = ?auto_61330 ?auto_61331 ) ) )
    :subtasks
    ( ( !STACK ?auto_61330 ?auto_61331 )
      ( MAKE-3PILE ?auto_61326 ?auto_61327 ?auto_61328 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61332 - BLOCK
      ?auto_61333 - BLOCK
      ?auto_61334 - BLOCK
    )
    :vars
    (
      ?auto_61335 - BLOCK
      ?auto_61337 - BLOCK
      ?auto_61336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61335 ?auto_61334 ) ( ON-TABLE ?auto_61332 ) ( ON ?auto_61333 ?auto_61332 ) ( ON ?auto_61334 ?auto_61333 ) ( not ( = ?auto_61332 ?auto_61333 ) ) ( not ( = ?auto_61332 ?auto_61334 ) ) ( not ( = ?auto_61332 ?auto_61335 ) ) ( not ( = ?auto_61333 ?auto_61334 ) ) ( not ( = ?auto_61333 ?auto_61335 ) ) ( not ( = ?auto_61334 ?auto_61335 ) ) ( CLEAR ?auto_61337 ) ( not ( = ?auto_61332 ?auto_61336 ) ) ( not ( = ?auto_61332 ?auto_61337 ) ) ( not ( = ?auto_61333 ?auto_61336 ) ) ( not ( = ?auto_61333 ?auto_61337 ) ) ( not ( = ?auto_61334 ?auto_61336 ) ) ( not ( = ?auto_61334 ?auto_61337 ) ) ( not ( = ?auto_61335 ?auto_61336 ) ) ( not ( = ?auto_61335 ?auto_61337 ) ) ( not ( = ?auto_61336 ?auto_61337 ) ) ( ON ?auto_61336 ?auto_61335 ) ( CLEAR ?auto_61336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61332 ?auto_61333 ?auto_61334 ?auto_61335 )
      ( MAKE-3PILE ?auto_61332 ?auto_61333 ?auto_61334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61338 - BLOCK
      ?auto_61339 - BLOCK
      ?auto_61340 - BLOCK
    )
    :vars
    (
      ?auto_61341 - BLOCK
      ?auto_61343 - BLOCK
      ?auto_61342 - BLOCK
      ?auto_61344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61341 ?auto_61340 ) ( ON-TABLE ?auto_61338 ) ( ON ?auto_61339 ?auto_61338 ) ( ON ?auto_61340 ?auto_61339 ) ( not ( = ?auto_61338 ?auto_61339 ) ) ( not ( = ?auto_61338 ?auto_61340 ) ) ( not ( = ?auto_61338 ?auto_61341 ) ) ( not ( = ?auto_61339 ?auto_61340 ) ) ( not ( = ?auto_61339 ?auto_61341 ) ) ( not ( = ?auto_61340 ?auto_61341 ) ) ( not ( = ?auto_61338 ?auto_61343 ) ) ( not ( = ?auto_61338 ?auto_61342 ) ) ( not ( = ?auto_61339 ?auto_61343 ) ) ( not ( = ?auto_61339 ?auto_61342 ) ) ( not ( = ?auto_61340 ?auto_61343 ) ) ( not ( = ?auto_61340 ?auto_61342 ) ) ( not ( = ?auto_61341 ?auto_61343 ) ) ( not ( = ?auto_61341 ?auto_61342 ) ) ( not ( = ?auto_61343 ?auto_61342 ) ) ( ON ?auto_61343 ?auto_61341 ) ( CLEAR ?auto_61343 ) ( HOLDING ?auto_61342 ) ( CLEAR ?auto_61344 ) ( ON-TABLE ?auto_61344 ) ( not ( = ?auto_61344 ?auto_61342 ) ) ( not ( = ?auto_61338 ?auto_61344 ) ) ( not ( = ?auto_61339 ?auto_61344 ) ) ( not ( = ?auto_61340 ?auto_61344 ) ) ( not ( = ?auto_61341 ?auto_61344 ) ) ( not ( = ?auto_61343 ?auto_61344 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61344 ?auto_61342 )
      ( MAKE-3PILE ?auto_61338 ?auto_61339 ?auto_61340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61345 - BLOCK
      ?auto_61346 - BLOCK
      ?auto_61347 - BLOCK
    )
    :vars
    (
      ?auto_61348 - BLOCK
      ?auto_61349 - BLOCK
      ?auto_61351 - BLOCK
      ?auto_61350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61348 ?auto_61347 ) ( ON-TABLE ?auto_61345 ) ( ON ?auto_61346 ?auto_61345 ) ( ON ?auto_61347 ?auto_61346 ) ( not ( = ?auto_61345 ?auto_61346 ) ) ( not ( = ?auto_61345 ?auto_61347 ) ) ( not ( = ?auto_61345 ?auto_61348 ) ) ( not ( = ?auto_61346 ?auto_61347 ) ) ( not ( = ?auto_61346 ?auto_61348 ) ) ( not ( = ?auto_61347 ?auto_61348 ) ) ( not ( = ?auto_61345 ?auto_61349 ) ) ( not ( = ?auto_61345 ?auto_61351 ) ) ( not ( = ?auto_61346 ?auto_61349 ) ) ( not ( = ?auto_61346 ?auto_61351 ) ) ( not ( = ?auto_61347 ?auto_61349 ) ) ( not ( = ?auto_61347 ?auto_61351 ) ) ( not ( = ?auto_61348 ?auto_61349 ) ) ( not ( = ?auto_61348 ?auto_61351 ) ) ( not ( = ?auto_61349 ?auto_61351 ) ) ( ON ?auto_61349 ?auto_61348 ) ( CLEAR ?auto_61350 ) ( ON-TABLE ?auto_61350 ) ( not ( = ?auto_61350 ?auto_61351 ) ) ( not ( = ?auto_61345 ?auto_61350 ) ) ( not ( = ?auto_61346 ?auto_61350 ) ) ( not ( = ?auto_61347 ?auto_61350 ) ) ( not ( = ?auto_61348 ?auto_61350 ) ) ( not ( = ?auto_61349 ?auto_61350 ) ) ( ON ?auto_61351 ?auto_61349 ) ( CLEAR ?auto_61351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61345 ?auto_61346 ?auto_61347 ?auto_61348 ?auto_61349 )
      ( MAKE-3PILE ?auto_61345 ?auto_61346 ?auto_61347 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61352 - BLOCK
      ?auto_61353 - BLOCK
      ?auto_61354 - BLOCK
    )
    :vars
    (
      ?auto_61357 - BLOCK
      ?auto_61355 - BLOCK
      ?auto_61356 - BLOCK
      ?auto_61358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61357 ?auto_61354 ) ( ON-TABLE ?auto_61352 ) ( ON ?auto_61353 ?auto_61352 ) ( ON ?auto_61354 ?auto_61353 ) ( not ( = ?auto_61352 ?auto_61353 ) ) ( not ( = ?auto_61352 ?auto_61354 ) ) ( not ( = ?auto_61352 ?auto_61357 ) ) ( not ( = ?auto_61353 ?auto_61354 ) ) ( not ( = ?auto_61353 ?auto_61357 ) ) ( not ( = ?auto_61354 ?auto_61357 ) ) ( not ( = ?auto_61352 ?auto_61355 ) ) ( not ( = ?auto_61352 ?auto_61356 ) ) ( not ( = ?auto_61353 ?auto_61355 ) ) ( not ( = ?auto_61353 ?auto_61356 ) ) ( not ( = ?auto_61354 ?auto_61355 ) ) ( not ( = ?auto_61354 ?auto_61356 ) ) ( not ( = ?auto_61357 ?auto_61355 ) ) ( not ( = ?auto_61357 ?auto_61356 ) ) ( not ( = ?auto_61355 ?auto_61356 ) ) ( ON ?auto_61355 ?auto_61357 ) ( not ( = ?auto_61358 ?auto_61356 ) ) ( not ( = ?auto_61352 ?auto_61358 ) ) ( not ( = ?auto_61353 ?auto_61358 ) ) ( not ( = ?auto_61354 ?auto_61358 ) ) ( not ( = ?auto_61357 ?auto_61358 ) ) ( not ( = ?auto_61355 ?auto_61358 ) ) ( ON ?auto_61356 ?auto_61355 ) ( CLEAR ?auto_61356 ) ( HOLDING ?auto_61358 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61358 )
      ( MAKE-3PILE ?auto_61352 ?auto_61353 ?auto_61354 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61359 - BLOCK
      ?auto_61360 - BLOCK
      ?auto_61361 - BLOCK
    )
    :vars
    (
      ?auto_61363 - BLOCK
      ?auto_61362 - BLOCK
      ?auto_61364 - BLOCK
      ?auto_61365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61363 ?auto_61361 ) ( ON-TABLE ?auto_61359 ) ( ON ?auto_61360 ?auto_61359 ) ( ON ?auto_61361 ?auto_61360 ) ( not ( = ?auto_61359 ?auto_61360 ) ) ( not ( = ?auto_61359 ?auto_61361 ) ) ( not ( = ?auto_61359 ?auto_61363 ) ) ( not ( = ?auto_61360 ?auto_61361 ) ) ( not ( = ?auto_61360 ?auto_61363 ) ) ( not ( = ?auto_61361 ?auto_61363 ) ) ( not ( = ?auto_61359 ?auto_61362 ) ) ( not ( = ?auto_61359 ?auto_61364 ) ) ( not ( = ?auto_61360 ?auto_61362 ) ) ( not ( = ?auto_61360 ?auto_61364 ) ) ( not ( = ?auto_61361 ?auto_61362 ) ) ( not ( = ?auto_61361 ?auto_61364 ) ) ( not ( = ?auto_61363 ?auto_61362 ) ) ( not ( = ?auto_61363 ?auto_61364 ) ) ( not ( = ?auto_61362 ?auto_61364 ) ) ( ON ?auto_61362 ?auto_61363 ) ( not ( = ?auto_61365 ?auto_61364 ) ) ( not ( = ?auto_61359 ?auto_61365 ) ) ( not ( = ?auto_61360 ?auto_61365 ) ) ( not ( = ?auto_61361 ?auto_61365 ) ) ( not ( = ?auto_61363 ?auto_61365 ) ) ( not ( = ?auto_61362 ?auto_61365 ) ) ( ON ?auto_61364 ?auto_61362 ) ( ON ?auto_61365 ?auto_61364 ) ( CLEAR ?auto_61365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61359 ?auto_61360 ?auto_61361 ?auto_61363 ?auto_61362 ?auto_61364 )
      ( MAKE-3PILE ?auto_61359 ?auto_61360 ?auto_61361 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61370 - BLOCK
      ?auto_61371 - BLOCK
      ?auto_61372 - BLOCK
      ?auto_61373 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61373 ) ( CLEAR ?auto_61372 ) ( ON-TABLE ?auto_61370 ) ( ON ?auto_61371 ?auto_61370 ) ( ON ?auto_61372 ?auto_61371 ) ( not ( = ?auto_61370 ?auto_61371 ) ) ( not ( = ?auto_61370 ?auto_61372 ) ) ( not ( = ?auto_61370 ?auto_61373 ) ) ( not ( = ?auto_61371 ?auto_61372 ) ) ( not ( = ?auto_61371 ?auto_61373 ) ) ( not ( = ?auto_61372 ?auto_61373 ) ) )
    :subtasks
    ( ( !STACK ?auto_61373 ?auto_61372 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61374 - BLOCK
      ?auto_61375 - BLOCK
      ?auto_61376 - BLOCK
      ?auto_61377 - BLOCK
    )
    :vars
    (
      ?auto_61378 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61376 ) ( ON-TABLE ?auto_61374 ) ( ON ?auto_61375 ?auto_61374 ) ( ON ?auto_61376 ?auto_61375 ) ( not ( = ?auto_61374 ?auto_61375 ) ) ( not ( = ?auto_61374 ?auto_61376 ) ) ( not ( = ?auto_61374 ?auto_61377 ) ) ( not ( = ?auto_61375 ?auto_61376 ) ) ( not ( = ?auto_61375 ?auto_61377 ) ) ( not ( = ?auto_61376 ?auto_61377 ) ) ( ON ?auto_61377 ?auto_61378 ) ( CLEAR ?auto_61377 ) ( HAND-EMPTY ) ( not ( = ?auto_61374 ?auto_61378 ) ) ( not ( = ?auto_61375 ?auto_61378 ) ) ( not ( = ?auto_61376 ?auto_61378 ) ) ( not ( = ?auto_61377 ?auto_61378 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61377 ?auto_61378 )
      ( MAKE-4PILE ?auto_61374 ?auto_61375 ?auto_61376 ?auto_61377 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61379 - BLOCK
      ?auto_61380 - BLOCK
      ?auto_61381 - BLOCK
      ?auto_61382 - BLOCK
    )
    :vars
    (
      ?auto_61383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61379 ) ( ON ?auto_61380 ?auto_61379 ) ( not ( = ?auto_61379 ?auto_61380 ) ) ( not ( = ?auto_61379 ?auto_61381 ) ) ( not ( = ?auto_61379 ?auto_61382 ) ) ( not ( = ?auto_61380 ?auto_61381 ) ) ( not ( = ?auto_61380 ?auto_61382 ) ) ( not ( = ?auto_61381 ?auto_61382 ) ) ( ON ?auto_61382 ?auto_61383 ) ( CLEAR ?auto_61382 ) ( not ( = ?auto_61379 ?auto_61383 ) ) ( not ( = ?auto_61380 ?auto_61383 ) ) ( not ( = ?auto_61381 ?auto_61383 ) ) ( not ( = ?auto_61382 ?auto_61383 ) ) ( HOLDING ?auto_61381 ) ( CLEAR ?auto_61380 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61379 ?auto_61380 ?auto_61381 )
      ( MAKE-4PILE ?auto_61379 ?auto_61380 ?auto_61381 ?auto_61382 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61384 - BLOCK
      ?auto_61385 - BLOCK
      ?auto_61386 - BLOCK
      ?auto_61387 - BLOCK
    )
    :vars
    (
      ?auto_61388 - BLOCK
      ?auto_61389 - BLOCK
      ?auto_61390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61384 ) ( ON ?auto_61385 ?auto_61384 ) ( not ( = ?auto_61384 ?auto_61385 ) ) ( not ( = ?auto_61384 ?auto_61386 ) ) ( not ( = ?auto_61384 ?auto_61387 ) ) ( not ( = ?auto_61385 ?auto_61386 ) ) ( not ( = ?auto_61385 ?auto_61387 ) ) ( not ( = ?auto_61386 ?auto_61387 ) ) ( ON ?auto_61387 ?auto_61388 ) ( not ( = ?auto_61384 ?auto_61388 ) ) ( not ( = ?auto_61385 ?auto_61388 ) ) ( not ( = ?auto_61386 ?auto_61388 ) ) ( not ( = ?auto_61387 ?auto_61388 ) ) ( CLEAR ?auto_61385 ) ( ON ?auto_61386 ?auto_61387 ) ( CLEAR ?auto_61386 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61389 ) ( ON ?auto_61390 ?auto_61389 ) ( ON ?auto_61388 ?auto_61390 ) ( not ( = ?auto_61389 ?auto_61390 ) ) ( not ( = ?auto_61389 ?auto_61388 ) ) ( not ( = ?auto_61389 ?auto_61387 ) ) ( not ( = ?auto_61389 ?auto_61386 ) ) ( not ( = ?auto_61390 ?auto_61388 ) ) ( not ( = ?auto_61390 ?auto_61387 ) ) ( not ( = ?auto_61390 ?auto_61386 ) ) ( not ( = ?auto_61384 ?auto_61389 ) ) ( not ( = ?auto_61384 ?auto_61390 ) ) ( not ( = ?auto_61385 ?auto_61389 ) ) ( not ( = ?auto_61385 ?auto_61390 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61389 ?auto_61390 ?auto_61388 ?auto_61387 )
      ( MAKE-4PILE ?auto_61384 ?auto_61385 ?auto_61386 ?auto_61387 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61391 - BLOCK
      ?auto_61392 - BLOCK
      ?auto_61393 - BLOCK
      ?auto_61394 - BLOCK
    )
    :vars
    (
      ?auto_61397 - BLOCK
      ?auto_61395 - BLOCK
      ?auto_61396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61391 ) ( not ( = ?auto_61391 ?auto_61392 ) ) ( not ( = ?auto_61391 ?auto_61393 ) ) ( not ( = ?auto_61391 ?auto_61394 ) ) ( not ( = ?auto_61392 ?auto_61393 ) ) ( not ( = ?auto_61392 ?auto_61394 ) ) ( not ( = ?auto_61393 ?auto_61394 ) ) ( ON ?auto_61394 ?auto_61397 ) ( not ( = ?auto_61391 ?auto_61397 ) ) ( not ( = ?auto_61392 ?auto_61397 ) ) ( not ( = ?auto_61393 ?auto_61397 ) ) ( not ( = ?auto_61394 ?auto_61397 ) ) ( ON ?auto_61393 ?auto_61394 ) ( CLEAR ?auto_61393 ) ( ON-TABLE ?auto_61395 ) ( ON ?auto_61396 ?auto_61395 ) ( ON ?auto_61397 ?auto_61396 ) ( not ( = ?auto_61395 ?auto_61396 ) ) ( not ( = ?auto_61395 ?auto_61397 ) ) ( not ( = ?auto_61395 ?auto_61394 ) ) ( not ( = ?auto_61395 ?auto_61393 ) ) ( not ( = ?auto_61396 ?auto_61397 ) ) ( not ( = ?auto_61396 ?auto_61394 ) ) ( not ( = ?auto_61396 ?auto_61393 ) ) ( not ( = ?auto_61391 ?auto_61395 ) ) ( not ( = ?auto_61391 ?auto_61396 ) ) ( not ( = ?auto_61392 ?auto_61395 ) ) ( not ( = ?auto_61392 ?auto_61396 ) ) ( HOLDING ?auto_61392 ) ( CLEAR ?auto_61391 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61391 ?auto_61392 )
      ( MAKE-4PILE ?auto_61391 ?auto_61392 ?auto_61393 ?auto_61394 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61398 - BLOCK
      ?auto_61399 - BLOCK
      ?auto_61400 - BLOCK
      ?auto_61401 - BLOCK
    )
    :vars
    (
      ?auto_61404 - BLOCK
      ?auto_61402 - BLOCK
      ?auto_61403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61398 ) ( not ( = ?auto_61398 ?auto_61399 ) ) ( not ( = ?auto_61398 ?auto_61400 ) ) ( not ( = ?auto_61398 ?auto_61401 ) ) ( not ( = ?auto_61399 ?auto_61400 ) ) ( not ( = ?auto_61399 ?auto_61401 ) ) ( not ( = ?auto_61400 ?auto_61401 ) ) ( ON ?auto_61401 ?auto_61404 ) ( not ( = ?auto_61398 ?auto_61404 ) ) ( not ( = ?auto_61399 ?auto_61404 ) ) ( not ( = ?auto_61400 ?auto_61404 ) ) ( not ( = ?auto_61401 ?auto_61404 ) ) ( ON ?auto_61400 ?auto_61401 ) ( ON-TABLE ?auto_61402 ) ( ON ?auto_61403 ?auto_61402 ) ( ON ?auto_61404 ?auto_61403 ) ( not ( = ?auto_61402 ?auto_61403 ) ) ( not ( = ?auto_61402 ?auto_61404 ) ) ( not ( = ?auto_61402 ?auto_61401 ) ) ( not ( = ?auto_61402 ?auto_61400 ) ) ( not ( = ?auto_61403 ?auto_61404 ) ) ( not ( = ?auto_61403 ?auto_61401 ) ) ( not ( = ?auto_61403 ?auto_61400 ) ) ( not ( = ?auto_61398 ?auto_61402 ) ) ( not ( = ?auto_61398 ?auto_61403 ) ) ( not ( = ?auto_61399 ?auto_61402 ) ) ( not ( = ?auto_61399 ?auto_61403 ) ) ( CLEAR ?auto_61398 ) ( ON ?auto_61399 ?auto_61400 ) ( CLEAR ?auto_61399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61402 ?auto_61403 ?auto_61404 ?auto_61401 ?auto_61400 )
      ( MAKE-4PILE ?auto_61398 ?auto_61399 ?auto_61400 ?auto_61401 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61405 - BLOCK
      ?auto_61406 - BLOCK
      ?auto_61407 - BLOCK
      ?auto_61408 - BLOCK
    )
    :vars
    (
      ?auto_61411 - BLOCK
      ?auto_61410 - BLOCK
      ?auto_61409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61405 ?auto_61406 ) ) ( not ( = ?auto_61405 ?auto_61407 ) ) ( not ( = ?auto_61405 ?auto_61408 ) ) ( not ( = ?auto_61406 ?auto_61407 ) ) ( not ( = ?auto_61406 ?auto_61408 ) ) ( not ( = ?auto_61407 ?auto_61408 ) ) ( ON ?auto_61408 ?auto_61411 ) ( not ( = ?auto_61405 ?auto_61411 ) ) ( not ( = ?auto_61406 ?auto_61411 ) ) ( not ( = ?auto_61407 ?auto_61411 ) ) ( not ( = ?auto_61408 ?auto_61411 ) ) ( ON ?auto_61407 ?auto_61408 ) ( ON-TABLE ?auto_61410 ) ( ON ?auto_61409 ?auto_61410 ) ( ON ?auto_61411 ?auto_61409 ) ( not ( = ?auto_61410 ?auto_61409 ) ) ( not ( = ?auto_61410 ?auto_61411 ) ) ( not ( = ?auto_61410 ?auto_61408 ) ) ( not ( = ?auto_61410 ?auto_61407 ) ) ( not ( = ?auto_61409 ?auto_61411 ) ) ( not ( = ?auto_61409 ?auto_61408 ) ) ( not ( = ?auto_61409 ?auto_61407 ) ) ( not ( = ?auto_61405 ?auto_61410 ) ) ( not ( = ?auto_61405 ?auto_61409 ) ) ( not ( = ?auto_61406 ?auto_61410 ) ) ( not ( = ?auto_61406 ?auto_61409 ) ) ( ON ?auto_61406 ?auto_61407 ) ( CLEAR ?auto_61406 ) ( HOLDING ?auto_61405 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61405 )
      ( MAKE-4PILE ?auto_61405 ?auto_61406 ?auto_61407 ?auto_61408 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61412 - BLOCK
      ?auto_61413 - BLOCK
      ?auto_61414 - BLOCK
      ?auto_61415 - BLOCK
    )
    :vars
    (
      ?auto_61416 - BLOCK
      ?auto_61417 - BLOCK
      ?auto_61418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61412 ?auto_61413 ) ) ( not ( = ?auto_61412 ?auto_61414 ) ) ( not ( = ?auto_61412 ?auto_61415 ) ) ( not ( = ?auto_61413 ?auto_61414 ) ) ( not ( = ?auto_61413 ?auto_61415 ) ) ( not ( = ?auto_61414 ?auto_61415 ) ) ( ON ?auto_61415 ?auto_61416 ) ( not ( = ?auto_61412 ?auto_61416 ) ) ( not ( = ?auto_61413 ?auto_61416 ) ) ( not ( = ?auto_61414 ?auto_61416 ) ) ( not ( = ?auto_61415 ?auto_61416 ) ) ( ON ?auto_61414 ?auto_61415 ) ( ON-TABLE ?auto_61417 ) ( ON ?auto_61418 ?auto_61417 ) ( ON ?auto_61416 ?auto_61418 ) ( not ( = ?auto_61417 ?auto_61418 ) ) ( not ( = ?auto_61417 ?auto_61416 ) ) ( not ( = ?auto_61417 ?auto_61415 ) ) ( not ( = ?auto_61417 ?auto_61414 ) ) ( not ( = ?auto_61418 ?auto_61416 ) ) ( not ( = ?auto_61418 ?auto_61415 ) ) ( not ( = ?auto_61418 ?auto_61414 ) ) ( not ( = ?auto_61412 ?auto_61417 ) ) ( not ( = ?auto_61412 ?auto_61418 ) ) ( not ( = ?auto_61413 ?auto_61417 ) ) ( not ( = ?auto_61413 ?auto_61418 ) ) ( ON ?auto_61413 ?auto_61414 ) ( ON ?auto_61412 ?auto_61413 ) ( CLEAR ?auto_61412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61417 ?auto_61418 ?auto_61416 ?auto_61415 ?auto_61414 ?auto_61413 )
      ( MAKE-4PILE ?auto_61412 ?auto_61413 ?auto_61414 ?auto_61415 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61421 - BLOCK
      ?auto_61422 - BLOCK
    )
    :vars
    (
      ?auto_61423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61423 ?auto_61422 ) ( CLEAR ?auto_61423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61421 ) ( ON ?auto_61422 ?auto_61421 ) ( not ( = ?auto_61421 ?auto_61422 ) ) ( not ( = ?auto_61421 ?auto_61423 ) ) ( not ( = ?auto_61422 ?auto_61423 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61423 ?auto_61422 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61424 - BLOCK
      ?auto_61425 - BLOCK
    )
    :vars
    (
      ?auto_61426 - BLOCK
      ?auto_61427 - BLOCK
      ?auto_61428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61426 ?auto_61425 ) ( CLEAR ?auto_61426 ) ( ON-TABLE ?auto_61424 ) ( ON ?auto_61425 ?auto_61424 ) ( not ( = ?auto_61424 ?auto_61425 ) ) ( not ( = ?auto_61424 ?auto_61426 ) ) ( not ( = ?auto_61425 ?auto_61426 ) ) ( HOLDING ?auto_61427 ) ( CLEAR ?auto_61428 ) ( not ( = ?auto_61424 ?auto_61427 ) ) ( not ( = ?auto_61424 ?auto_61428 ) ) ( not ( = ?auto_61425 ?auto_61427 ) ) ( not ( = ?auto_61425 ?auto_61428 ) ) ( not ( = ?auto_61426 ?auto_61427 ) ) ( not ( = ?auto_61426 ?auto_61428 ) ) ( not ( = ?auto_61427 ?auto_61428 ) ) )
    :subtasks
    ( ( !STACK ?auto_61427 ?auto_61428 )
      ( MAKE-2PILE ?auto_61424 ?auto_61425 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61429 - BLOCK
      ?auto_61430 - BLOCK
    )
    :vars
    (
      ?auto_61431 - BLOCK
      ?auto_61432 - BLOCK
      ?auto_61433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61431 ?auto_61430 ) ( ON-TABLE ?auto_61429 ) ( ON ?auto_61430 ?auto_61429 ) ( not ( = ?auto_61429 ?auto_61430 ) ) ( not ( = ?auto_61429 ?auto_61431 ) ) ( not ( = ?auto_61430 ?auto_61431 ) ) ( CLEAR ?auto_61432 ) ( not ( = ?auto_61429 ?auto_61433 ) ) ( not ( = ?auto_61429 ?auto_61432 ) ) ( not ( = ?auto_61430 ?auto_61433 ) ) ( not ( = ?auto_61430 ?auto_61432 ) ) ( not ( = ?auto_61431 ?auto_61433 ) ) ( not ( = ?auto_61431 ?auto_61432 ) ) ( not ( = ?auto_61433 ?auto_61432 ) ) ( ON ?auto_61433 ?auto_61431 ) ( CLEAR ?auto_61433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61429 ?auto_61430 ?auto_61431 )
      ( MAKE-2PILE ?auto_61429 ?auto_61430 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61434 - BLOCK
      ?auto_61435 - BLOCK
    )
    :vars
    (
      ?auto_61436 - BLOCK
      ?auto_61438 - BLOCK
      ?auto_61437 - BLOCK
      ?auto_61440 - BLOCK
      ?auto_61439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61436 ?auto_61435 ) ( ON-TABLE ?auto_61434 ) ( ON ?auto_61435 ?auto_61434 ) ( not ( = ?auto_61434 ?auto_61435 ) ) ( not ( = ?auto_61434 ?auto_61436 ) ) ( not ( = ?auto_61435 ?auto_61436 ) ) ( not ( = ?auto_61434 ?auto_61438 ) ) ( not ( = ?auto_61434 ?auto_61437 ) ) ( not ( = ?auto_61435 ?auto_61438 ) ) ( not ( = ?auto_61435 ?auto_61437 ) ) ( not ( = ?auto_61436 ?auto_61438 ) ) ( not ( = ?auto_61436 ?auto_61437 ) ) ( not ( = ?auto_61438 ?auto_61437 ) ) ( ON ?auto_61438 ?auto_61436 ) ( CLEAR ?auto_61438 ) ( HOLDING ?auto_61437 ) ( CLEAR ?auto_61440 ) ( ON-TABLE ?auto_61439 ) ( ON ?auto_61440 ?auto_61439 ) ( not ( = ?auto_61439 ?auto_61440 ) ) ( not ( = ?auto_61439 ?auto_61437 ) ) ( not ( = ?auto_61440 ?auto_61437 ) ) ( not ( = ?auto_61434 ?auto_61440 ) ) ( not ( = ?auto_61434 ?auto_61439 ) ) ( not ( = ?auto_61435 ?auto_61440 ) ) ( not ( = ?auto_61435 ?auto_61439 ) ) ( not ( = ?auto_61436 ?auto_61440 ) ) ( not ( = ?auto_61436 ?auto_61439 ) ) ( not ( = ?auto_61438 ?auto_61440 ) ) ( not ( = ?auto_61438 ?auto_61439 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61439 ?auto_61440 ?auto_61437 )
      ( MAKE-2PILE ?auto_61434 ?auto_61435 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61441 - BLOCK
      ?auto_61442 - BLOCK
    )
    :vars
    (
      ?auto_61443 - BLOCK
      ?auto_61447 - BLOCK
      ?auto_61444 - BLOCK
      ?auto_61446 - BLOCK
      ?auto_61445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61443 ?auto_61442 ) ( ON-TABLE ?auto_61441 ) ( ON ?auto_61442 ?auto_61441 ) ( not ( = ?auto_61441 ?auto_61442 ) ) ( not ( = ?auto_61441 ?auto_61443 ) ) ( not ( = ?auto_61442 ?auto_61443 ) ) ( not ( = ?auto_61441 ?auto_61447 ) ) ( not ( = ?auto_61441 ?auto_61444 ) ) ( not ( = ?auto_61442 ?auto_61447 ) ) ( not ( = ?auto_61442 ?auto_61444 ) ) ( not ( = ?auto_61443 ?auto_61447 ) ) ( not ( = ?auto_61443 ?auto_61444 ) ) ( not ( = ?auto_61447 ?auto_61444 ) ) ( ON ?auto_61447 ?auto_61443 ) ( CLEAR ?auto_61446 ) ( ON-TABLE ?auto_61445 ) ( ON ?auto_61446 ?auto_61445 ) ( not ( = ?auto_61445 ?auto_61446 ) ) ( not ( = ?auto_61445 ?auto_61444 ) ) ( not ( = ?auto_61446 ?auto_61444 ) ) ( not ( = ?auto_61441 ?auto_61446 ) ) ( not ( = ?auto_61441 ?auto_61445 ) ) ( not ( = ?auto_61442 ?auto_61446 ) ) ( not ( = ?auto_61442 ?auto_61445 ) ) ( not ( = ?auto_61443 ?auto_61446 ) ) ( not ( = ?auto_61443 ?auto_61445 ) ) ( not ( = ?auto_61447 ?auto_61446 ) ) ( not ( = ?auto_61447 ?auto_61445 ) ) ( ON ?auto_61444 ?auto_61447 ) ( CLEAR ?auto_61444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61441 ?auto_61442 ?auto_61443 ?auto_61447 )
      ( MAKE-2PILE ?auto_61441 ?auto_61442 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61448 - BLOCK
      ?auto_61449 - BLOCK
    )
    :vars
    (
      ?auto_61453 - BLOCK
      ?auto_61451 - BLOCK
      ?auto_61450 - BLOCK
      ?auto_61454 - BLOCK
      ?auto_61452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61453 ?auto_61449 ) ( ON-TABLE ?auto_61448 ) ( ON ?auto_61449 ?auto_61448 ) ( not ( = ?auto_61448 ?auto_61449 ) ) ( not ( = ?auto_61448 ?auto_61453 ) ) ( not ( = ?auto_61449 ?auto_61453 ) ) ( not ( = ?auto_61448 ?auto_61451 ) ) ( not ( = ?auto_61448 ?auto_61450 ) ) ( not ( = ?auto_61449 ?auto_61451 ) ) ( not ( = ?auto_61449 ?auto_61450 ) ) ( not ( = ?auto_61453 ?auto_61451 ) ) ( not ( = ?auto_61453 ?auto_61450 ) ) ( not ( = ?auto_61451 ?auto_61450 ) ) ( ON ?auto_61451 ?auto_61453 ) ( ON-TABLE ?auto_61454 ) ( not ( = ?auto_61454 ?auto_61452 ) ) ( not ( = ?auto_61454 ?auto_61450 ) ) ( not ( = ?auto_61452 ?auto_61450 ) ) ( not ( = ?auto_61448 ?auto_61452 ) ) ( not ( = ?auto_61448 ?auto_61454 ) ) ( not ( = ?auto_61449 ?auto_61452 ) ) ( not ( = ?auto_61449 ?auto_61454 ) ) ( not ( = ?auto_61453 ?auto_61452 ) ) ( not ( = ?auto_61453 ?auto_61454 ) ) ( not ( = ?auto_61451 ?auto_61452 ) ) ( not ( = ?auto_61451 ?auto_61454 ) ) ( ON ?auto_61450 ?auto_61451 ) ( CLEAR ?auto_61450 ) ( HOLDING ?auto_61452 ) ( CLEAR ?auto_61454 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61454 ?auto_61452 )
      ( MAKE-2PILE ?auto_61448 ?auto_61449 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61455 - BLOCK
      ?auto_61456 - BLOCK
    )
    :vars
    (
      ?auto_61461 - BLOCK
      ?auto_61459 - BLOCK
      ?auto_61458 - BLOCK
      ?auto_61457 - BLOCK
      ?auto_61460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61461 ?auto_61456 ) ( ON-TABLE ?auto_61455 ) ( ON ?auto_61456 ?auto_61455 ) ( not ( = ?auto_61455 ?auto_61456 ) ) ( not ( = ?auto_61455 ?auto_61461 ) ) ( not ( = ?auto_61456 ?auto_61461 ) ) ( not ( = ?auto_61455 ?auto_61459 ) ) ( not ( = ?auto_61455 ?auto_61458 ) ) ( not ( = ?auto_61456 ?auto_61459 ) ) ( not ( = ?auto_61456 ?auto_61458 ) ) ( not ( = ?auto_61461 ?auto_61459 ) ) ( not ( = ?auto_61461 ?auto_61458 ) ) ( not ( = ?auto_61459 ?auto_61458 ) ) ( ON ?auto_61459 ?auto_61461 ) ( ON-TABLE ?auto_61457 ) ( not ( = ?auto_61457 ?auto_61460 ) ) ( not ( = ?auto_61457 ?auto_61458 ) ) ( not ( = ?auto_61460 ?auto_61458 ) ) ( not ( = ?auto_61455 ?auto_61460 ) ) ( not ( = ?auto_61455 ?auto_61457 ) ) ( not ( = ?auto_61456 ?auto_61460 ) ) ( not ( = ?auto_61456 ?auto_61457 ) ) ( not ( = ?auto_61461 ?auto_61460 ) ) ( not ( = ?auto_61461 ?auto_61457 ) ) ( not ( = ?auto_61459 ?auto_61460 ) ) ( not ( = ?auto_61459 ?auto_61457 ) ) ( ON ?auto_61458 ?auto_61459 ) ( CLEAR ?auto_61457 ) ( ON ?auto_61460 ?auto_61458 ) ( CLEAR ?auto_61460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61455 ?auto_61456 ?auto_61461 ?auto_61459 ?auto_61458 )
      ( MAKE-2PILE ?auto_61455 ?auto_61456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61462 - BLOCK
      ?auto_61463 - BLOCK
    )
    :vars
    (
      ?auto_61468 - BLOCK
      ?auto_61464 - BLOCK
      ?auto_61467 - BLOCK
      ?auto_61465 - BLOCK
      ?auto_61466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61468 ?auto_61463 ) ( ON-TABLE ?auto_61462 ) ( ON ?auto_61463 ?auto_61462 ) ( not ( = ?auto_61462 ?auto_61463 ) ) ( not ( = ?auto_61462 ?auto_61468 ) ) ( not ( = ?auto_61463 ?auto_61468 ) ) ( not ( = ?auto_61462 ?auto_61464 ) ) ( not ( = ?auto_61462 ?auto_61467 ) ) ( not ( = ?auto_61463 ?auto_61464 ) ) ( not ( = ?auto_61463 ?auto_61467 ) ) ( not ( = ?auto_61468 ?auto_61464 ) ) ( not ( = ?auto_61468 ?auto_61467 ) ) ( not ( = ?auto_61464 ?auto_61467 ) ) ( ON ?auto_61464 ?auto_61468 ) ( not ( = ?auto_61465 ?auto_61466 ) ) ( not ( = ?auto_61465 ?auto_61467 ) ) ( not ( = ?auto_61466 ?auto_61467 ) ) ( not ( = ?auto_61462 ?auto_61466 ) ) ( not ( = ?auto_61462 ?auto_61465 ) ) ( not ( = ?auto_61463 ?auto_61466 ) ) ( not ( = ?auto_61463 ?auto_61465 ) ) ( not ( = ?auto_61468 ?auto_61466 ) ) ( not ( = ?auto_61468 ?auto_61465 ) ) ( not ( = ?auto_61464 ?auto_61466 ) ) ( not ( = ?auto_61464 ?auto_61465 ) ) ( ON ?auto_61467 ?auto_61464 ) ( ON ?auto_61466 ?auto_61467 ) ( CLEAR ?auto_61466 ) ( HOLDING ?auto_61465 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61465 )
      ( MAKE-2PILE ?auto_61462 ?auto_61463 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61469 - BLOCK
      ?auto_61470 - BLOCK
    )
    :vars
    (
      ?auto_61473 - BLOCK
      ?auto_61474 - BLOCK
      ?auto_61475 - BLOCK
      ?auto_61471 - BLOCK
      ?auto_61472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61473 ?auto_61470 ) ( ON-TABLE ?auto_61469 ) ( ON ?auto_61470 ?auto_61469 ) ( not ( = ?auto_61469 ?auto_61470 ) ) ( not ( = ?auto_61469 ?auto_61473 ) ) ( not ( = ?auto_61470 ?auto_61473 ) ) ( not ( = ?auto_61469 ?auto_61474 ) ) ( not ( = ?auto_61469 ?auto_61475 ) ) ( not ( = ?auto_61470 ?auto_61474 ) ) ( not ( = ?auto_61470 ?auto_61475 ) ) ( not ( = ?auto_61473 ?auto_61474 ) ) ( not ( = ?auto_61473 ?auto_61475 ) ) ( not ( = ?auto_61474 ?auto_61475 ) ) ( ON ?auto_61474 ?auto_61473 ) ( not ( = ?auto_61471 ?auto_61472 ) ) ( not ( = ?auto_61471 ?auto_61475 ) ) ( not ( = ?auto_61472 ?auto_61475 ) ) ( not ( = ?auto_61469 ?auto_61472 ) ) ( not ( = ?auto_61469 ?auto_61471 ) ) ( not ( = ?auto_61470 ?auto_61472 ) ) ( not ( = ?auto_61470 ?auto_61471 ) ) ( not ( = ?auto_61473 ?auto_61472 ) ) ( not ( = ?auto_61473 ?auto_61471 ) ) ( not ( = ?auto_61474 ?auto_61472 ) ) ( not ( = ?auto_61474 ?auto_61471 ) ) ( ON ?auto_61475 ?auto_61474 ) ( ON ?auto_61472 ?auto_61475 ) ( ON ?auto_61471 ?auto_61472 ) ( CLEAR ?auto_61471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61469 ?auto_61470 ?auto_61473 ?auto_61474 ?auto_61475 ?auto_61472 )
      ( MAKE-2PILE ?auto_61469 ?auto_61470 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61481 - BLOCK
      ?auto_61482 - BLOCK
      ?auto_61483 - BLOCK
      ?auto_61484 - BLOCK
      ?auto_61485 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61485 ) ( CLEAR ?auto_61484 ) ( ON-TABLE ?auto_61481 ) ( ON ?auto_61482 ?auto_61481 ) ( ON ?auto_61483 ?auto_61482 ) ( ON ?auto_61484 ?auto_61483 ) ( not ( = ?auto_61481 ?auto_61482 ) ) ( not ( = ?auto_61481 ?auto_61483 ) ) ( not ( = ?auto_61481 ?auto_61484 ) ) ( not ( = ?auto_61481 ?auto_61485 ) ) ( not ( = ?auto_61482 ?auto_61483 ) ) ( not ( = ?auto_61482 ?auto_61484 ) ) ( not ( = ?auto_61482 ?auto_61485 ) ) ( not ( = ?auto_61483 ?auto_61484 ) ) ( not ( = ?auto_61483 ?auto_61485 ) ) ( not ( = ?auto_61484 ?auto_61485 ) ) )
    :subtasks
    ( ( !STACK ?auto_61485 ?auto_61484 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61486 - BLOCK
      ?auto_61487 - BLOCK
      ?auto_61488 - BLOCK
      ?auto_61489 - BLOCK
      ?auto_61490 - BLOCK
    )
    :vars
    (
      ?auto_61491 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61489 ) ( ON-TABLE ?auto_61486 ) ( ON ?auto_61487 ?auto_61486 ) ( ON ?auto_61488 ?auto_61487 ) ( ON ?auto_61489 ?auto_61488 ) ( not ( = ?auto_61486 ?auto_61487 ) ) ( not ( = ?auto_61486 ?auto_61488 ) ) ( not ( = ?auto_61486 ?auto_61489 ) ) ( not ( = ?auto_61486 ?auto_61490 ) ) ( not ( = ?auto_61487 ?auto_61488 ) ) ( not ( = ?auto_61487 ?auto_61489 ) ) ( not ( = ?auto_61487 ?auto_61490 ) ) ( not ( = ?auto_61488 ?auto_61489 ) ) ( not ( = ?auto_61488 ?auto_61490 ) ) ( not ( = ?auto_61489 ?auto_61490 ) ) ( ON ?auto_61490 ?auto_61491 ) ( CLEAR ?auto_61490 ) ( HAND-EMPTY ) ( not ( = ?auto_61486 ?auto_61491 ) ) ( not ( = ?auto_61487 ?auto_61491 ) ) ( not ( = ?auto_61488 ?auto_61491 ) ) ( not ( = ?auto_61489 ?auto_61491 ) ) ( not ( = ?auto_61490 ?auto_61491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61490 ?auto_61491 )
      ( MAKE-5PILE ?auto_61486 ?auto_61487 ?auto_61488 ?auto_61489 ?auto_61490 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61492 - BLOCK
      ?auto_61493 - BLOCK
      ?auto_61494 - BLOCK
      ?auto_61495 - BLOCK
      ?auto_61496 - BLOCK
    )
    :vars
    (
      ?auto_61497 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61492 ) ( ON ?auto_61493 ?auto_61492 ) ( ON ?auto_61494 ?auto_61493 ) ( not ( = ?auto_61492 ?auto_61493 ) ) ( not ( = ?auto_61492 ?auto_61494 ) ) ( not ( = ?auto_61492 ?auto_61495 ) ) ( not ( = ?auto_61492 ?auto_61496 ) ) ( not ( = ?auto_61493 ?auto_61494 ) ) ( not ( = ?auto_61493 ?auto_61495 ) ) ( not ( = ?auto_61493 ?auto_61496 ) ) ( not ( = ?auto_61494 ?auto_61495 ) ) ( not ( = ?auto_61494 ?auto_61496 ) ) ( not ( = ?auto_61495 ?auto_61496 ) ) ( ON ?auto_61496 ?auto_61497 ) ( CLEAR ?auto_61496 ) ( not ( = ?auto_61492 ?auto_61497 ) ) ( not ( = ?auto_61493 ?auto_61497 ) ) ( not ( = ?auto_61494 ?auto_61497 ) ) ( not ( = ?auto_61495 ?auto_61497 ) ) ( not ( = ?auto_61496 ?auto_61497 ) ) ( HOLDING ?auto_61495 ) ( CLEAR ?auto_61494 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61492 ?auto_61493 ?auto_61494 ?auto_61495 )
      ( MAKE-5PILE ?auto_61492 ?auto_61493 ?auto_61494 ?auto_61495 ?auto_61496 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61498 - BLOCK
      ?auto_61499 - BLOCK
      ?auto_61500 - BLOCK
      ?auto_61501 - BLOCK
      ?auto_61502 - BLOCK
    )
    :vars
    (
      ?auto_61503 - BLOCK
      ?auto_61504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61498 ) ( ON ?auto_61499 ?auto_61498 ) ( ON ?auto_61500 ?auto_61499 ) ( not ( = ?auto_61498 ?auto_61499 ) ) ( not ( = ?auto_61498 ?auto_61500 ) ) ( not ( = ?auto_61498 ?auto_61501 ) ) ( not ( = ?auto_61498 ?auto_61502 ) ) ( not ( = ?auto_61499 ?auto_61500 ) ) ( not ( = ?auto_61499 ?auto_61501 ) ) ( not ( = ?auto_61499 ?auto_61502 ) ) ( not ( = ?auto_61500 ?auto_61501 ) ) ( not ( = ?auto_61500 ?auto_61502 ) ) ( not ( = ?auto_61501 ?auto_61502 ) ) ( ON ?auto_61502 ?auto_61503 ) ( not ( = ?auto_61498 ?auto_61503 ) ) ( not ( = ?auto_61499 ?auto_61503 ) ) ( not ( = ?auto_61500 ?auto_61503 ) ) ( not ( = ?auto_61501 ?auto_61503 ) ) ( not ( = ?auto_61502 ?auto_61503 ) ) ( CLEAR ?auto_61500 ) ( ON ?auto_61501 ?auto_61502 ) ( CLEAR ?auto_61501 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61504 ) ( ON ?auto_61503 ?auto_61504 ) ( not ( = ?auto_61504 ?auto_61503 ) ) ( not ( = ?auto_61504 ?auto_61502 ) ) ( not ( = ?auto_61504 ?auto_61501 ) ) ( not ( = ?auto_61498 ?auto_61504 ) ) ( not ( = ?auto_61499 ?auto_61504 ) ) ( not ( = ?auto_61500 ?auto_61504 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61504 ?auto_61503 ?auto_61502 )
      ( MAKE-5PILE ?auto_61498 ?auto_61499 ?auto_61500 ?auto_61501 ?auto_61502 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61505 - BLOCK
      ?auto_61506 - BLOCK
      ?auto_61507 - BLOCK
      ?auto_61508 - BLOCK
      ?auto_61509 - BLOCK
    )
    :vars
    (
      ?auto_61510 - BLOCK
      ?auto_61511 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61505 ) ( ON ?auto_61506 ?auto_61505 ) ( not ( = ?auto_61505 ?auto_61506 ) ) ( not ( = ?auto_61505 ?auto_61507 ) ) ( not ( = ?auto_61505 ?auto_61508 ) ) ( not ( = ?auto_61505 ?auto_61509 ) ) ( not ( = ?auto_61506 ?auto_61507 ) ) ( not ( = ?auto_61506 ?auto_61508 ) ) ( not ( = ?auto_61506 ?auto_61509 ) ) ( not ( = ?auto_61507 ?auto_61508 ) ) ( not ( = ?auto_61507 ?auto_61509 ) ) ( not ( = ?auto_61508 ?auto_61509 ) ) ( ON ?auto_61509 ?auto_61510 ) ( not ( = ?auto_61505 ?auto_61510 ) ) ( not ( = ?auto_61506 ?auto_61510 ) ) ( not ( = ?auto_61507 ?auto_61510 ) ) ( not ( = ?auto_61508 ?auto_61510 ) ) ( not ( = ?auto_61509 ?auto_61510 ) ) ( ON ?auto_61508 ?auto_61509 ) ( CLEAR ?auto_61508 ) ( ON-TABLE ?auto_61511 ) ( ON ?auto_61510 ?auto_61511 ) ( not ( = ?auto_61511 ?auto_61510 ) ) ( not ( = ?auto_61511 ?auto_61509 ) ) ( not ( = ?auto_61511 ?auto_61508 ) ) ( not ( = ?auto_61505 ?auto_61511 ) ) ( not ( = ?auto_61506 ?auto_61511 ) ) ( not ( = ?auto_61507 ?auto_61511 ) ) ( HOLDING ?auto_61507 ) ( CLEAR ?auto_61506 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61505 ?auto_61506 ?auto_61507 )
      ( MAKE-5PILE ?auto_61505 ?auto_61506 ?auto_61507 ?auto_61508 ?auto_61509 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61512 - BLOCK
      ?auto_61513 - BLOCK
      ?auto_61514 - BLOCK
      ?auto_61515 - BLOCK
      ?auto_61516 - BLOCK
    )
    :vars
    (
      ?auto_61517 - BLOCK
      ?auto_61518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61512 ) ( ON ?auto_61513 ?auto_61512 ) ( not ( = ?auto_61512 ?auto_61513 ) ) ( not ( = ?auto_61512 ?auto_61514 ) ) ( not ( = ?auto_61512 ?auto_61515 ) ) ( not ( = ?auto_61512 ?auto_61516 ) ) ( not ( = ?auto_61513 ?auto_61514 ) ) ( not ( = ?auto_61513 ?auto_61515 ) ) ( not ( = ?auto_61513 ?auto_61516 ) ) ( not ( = ?auto_61514 ?auto_61515 ) ) ( not ( = ?auto_61514 ?auto_61516 ) ) ( not ( = ?auto_61515 ?auto_61516 ) ) ( ON ?auto_61516 ?auto_61517 ) ( not ( = ?auto_61512 ?auto_61517 ) ) ( not ( = ?auto_61513 ?auto_61517 ) ) ( not ( = ?auto_61514 ?auto_61517 ) ) ( not ( = ?auto_61515 ?auto_61517 ) ) ( not ( = ?auto_61516 ?auto_61517 ) ) ( ON ?auto_61515 ?auto_61516 ) ( ON-TABLE ?auto_61518 ) ( ON ?auto_61517 ?auto_61518 ) ( not ( = ?auto_61518 ?auto_61517 ) ) ( not ( = ?auto_61518 ?auto_61516 ) ) ( not ( = ?auto_61518 ?auto_61515 ) ) ( not ( = ?auto_61512 ?auto_61518 ) ) ( not ( = ?auto_61513 ?auto_61518 ) ) ( not ( = ?auto_61514 ?auto_61518 ) ) ( CLEAR ?auto_61513 ) ( ON ?auto_61514 ?auto_61515 ) ( CLEAR ?auto_61514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61518 ?auto_61517 ?auto_61516 ?auto_61515 )
      ( MAKE-5PILE ?auto_61512 ?auto_61513 ?auto_61514 ?auto_61515 ?auto_61516 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61519 - BLOCK
      ?auto_61520 - BLOCK
      ?auto_61521 - BLOCK
      ?auto_61522 - BLOCK
      ?auto_61523 - BLOCK
    )
    :vars
    (
      ?auto_61525 - BLOCK
      ?auto_61524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61519 ) ( not ( = ?auto_61519 ?auto_61520 ) ) ( not ( = ?auto_61519 ?auto_61521 ) ) ( not ( = ?auto_61519 ?auto_61522 ) ) ( not ( = ?auto_61519 ?auto_61523 ) ) ( not ( = ?auto_61520 ?auto_61521 ) ) ( not ( = ?auto_61520 ?auto_61522 ) ) ( not ( = ?auto_61520 ?auto_61523 ) ) ( not ( = ?auto_61521 ?auto_61522 ) ) ( not ( = ?auto_61521 ?auto_61523 ) ) ( not ( = ?auto_61522 ?auto_61523 ) ) ( ON ?auto_61523 ?auto_61525 ) ( not ( = ?auto_61519 ?auto_61525 ) ) ( not ( = ?auto_61520 ?auto_61525 ) ) ( not ( = ?auto_61521 ?auto_61525 ) ) ( not ( = ?auto_61522 ?auto_61525 ) ) ( not ( = ?auto_61523 ?auto_61525 ) ) ( ON ?auto_61522 ?auto_61523 ) ( ON-TABLE ?auto_61524 ) ( ON ?auto_61525 ?auto_61524 ) ( not ( = ?auto_61524 ?auto_61525 ) ) ( not ( = ?auto_61524 ?auto_61523 ) ) ( not ( = ?auto_61524 ?auto_61522 ) ) ( not ( = ?auto_61519 ?auto_61524 ) ) ( not ( = ?auto_61520 ?auto_61524 ) ) ( not ( = ?auto_61521 ?auto_61524 ) ) ( ON ?auto_61521 ?auto_61522 ) ( CLEAR ?auto_61521 ) ( HOLDING ?auto_61520 ) ( CLEAR ?auto_61519 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61519 ?auto_61520 )
      ( MAKE-5PILE ?auto_61519 ?auto_61520 ?auto_61521 ?auto_61522 ?auto_61523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61526 - BLOCK
      ?auto_61527 - BLOCK
      ?auto_61528 - BLOCK
      ?auto_61529 - BLOCK
      ?auto_61530 - BLOCK
    )
    :vars
    (
      ?auto_61532 - BLOCK
      ?auto_61531 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61526 ) ( not ( = ?auto_61526 ?auto_61527 ) ) ( not ( = ?auto_61526 ?auto_61528 ) ) ( not ( = ?auto_61526 ?auto_61529 ) ) ( not ( = ?auto_61526 ?auto_61530 ) ) ( not ( = ?auto_61527 ?auto_61528 ) ) ( not ( = ?auto_61527 ?auto_61529 ) ) ( not ( = ?auto_61527 ?auto_61530 ) ) ( not ( = ?auto_61528 ?auto_61529 ) ) ( not ( = ?auto_61528 ?auto_61530 ) ) ( not ( = ?auto_61529 ?auto_61530 ) ) ( ON ?auto_61530 ?auto_61532 ) ( not ( = ?auto_61526 ?auto_61532 ) ) ( not ( = ?auto_61527 ?auto_61532 ) ) ( not ( = ?auto_61528 ?auto_61532 ) ) ( not ( = ?auto_61529 ?auto_61532 ) ) ( not ( = ?auto_61530 ?auto_61532 ) ) ( ON ?auto_61529 ?auto_61530 ) ( ON-TABLE ?auto_61531 ) ( ON ?auto_61532 ?auto_61531 ) ( not ( = ?auto_61531 ?auto_61532 ) ) ( not ( = ?auto_61531 ?auto_61530 ) ) ( not ( = ?auto_61531 ?auto_61529 ) ) ( not ( = ?auto_61526 ?auto_61531 ) ) ( not ( = ?auto_61527 ?auto_61531 ) ) ( not ( = ?auto_61528 ?auto_61531 ) ) ( ON ?auto_61528 ?auto_61529 ) ( CLEAR ?auto_61526 ) ( ON ?auto_61527 ?auto_61528 ) ( CLEAR ?auto_61527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61531 ?auto_61532 ?auto_61530 ?auto_61529 ?auto_61528 )
      ( MAKE-5PILE ?auto_61526 ?auto_61527 ?auto_61528 ?auto_61529 ?auto_61530 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61533 - BLOCK
      ?auto_61534 - BLOCK
      ?auto_61535 - BLOCK
      ?auto_61536 - BLOCK
      ?auto_61537 - BLOCK
    )
    :vars
    (
      ?auto_61538 - BLOCK
      ?auto_61539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61533 ?auto_61534 ) ) ( not ( = ?auto_61533 ?auto_61535 ) ) ( not ( = ?auto_61533 ?auto_61536 ) ) ( not ( = ?auto_61533 ?auto_61537 ) ) ( not ( = ?auto_61534 ?auto_61535 ) ) ( not ( = ?auto_61534 ?auto_61536 ) ) ( not ( = ?auto_61534 ?auto_61537 ) ) ( not ( = ?auto_61535 ?auto_61536 ) ) ( not ( = ?auto_61535 ?auto_61537 ) ) ( not ( = ?auto_61536 ?auto_61537 ) ) ( ON ?auto_61537 ?auto_61538 ) ( not ( = ?auto_61533 ?auto_61538 ) ) ( not ( = ?auto_61534 ?auto_61538 ) ) ( not ( = ?auto_61535 ?auto_61538 ) ) ( not ( = ?auto_61536 ?auto_61538 ) ) ( not ( = ?auto_61537 ?auto_61538 ) ) ( ON ?auto_61536 ?auto_61537 ) ( ON-TABLE ?auto_61539 ) ( ON ?auto_61538 ?auto_61539 ) ( not ( = ?auto_61539 ?auto_61538 ) ) ( not ( = ?auto_61539 ?auto_61537 ) ) ( not ( = ?auto_61539 ?auto_61536 ) ) ( not ( = ?auto_61533 ?auto_61539 ) ) ( not ( = ?auto_61534 ?auto_61539 ) ) ( not ( = ?auto_61535 ?auto_61539 ) ) ( ON ?auto_61535 ?auto_61536 ) ( ON ?auto_61534 ?auto_61535 ) ( CLEAR ?auto_61534 ) ( HOLDING ?auto_61533 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61533 )
      ( MAKE-5PILE ?auto_61533 ?auto_61534 ?auto_61535 ?auto_61536 ?auto_61537 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61540 - BLOCK
      ?auto_61541 - BLOCK
      ?auto_61542 - BLOCK
      ?auto_61543 - BLOCK
      ?auto_61544 - BLOCK
    )
    :vars
    (
      ?auto_61546 - BLOCK
      ?auto_61545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61540 ?auto_61541 ) ) ( not ( = ?auto_61540 ?auto_61542 ) ) ( not ( = ?auto_61540 ?auto_61543 ) ) ( not ( = ?auto_61540 ?auto_61544 ) ) ( not ( = ?auto_61541 ?auto_61542 ) ) ( not ( = ?auto_61541 ?auto_61543 ) ) ( not ( = ?auto_61541 ?auto_61544 ) ) ( not ( = ?auto_61542 ?auto_61543 ) ) ( not ( = ?auto_61542 ?auto_61544 ) ) ( not ( = ?auto_61543 ?auto_61544 ) ) ( ON ?auto_61544 ?auto_61546 ) ( not ( = ?auto_61540 ?auto_61546 ) ) ( not ( = ?auto_61541 ?auto_61546 ) ) ( not ( = ?auto_61542 ?auto_61546 ) ) ( not ( = ?auto_61543 ?auto_61546 ) ) ( not ( = ?auto_61544 ?auto_61546 ) ) ( ON ?auto_61543 ?auto_61544 ) ( ON-TABLE ?auto_61545 ) ( ON ?auto_61546 ?auto_61545 ) ( not ( = ?auto_61545 ?auto_61546 ) ) ( not ( = ?auto_61545 ?auto_61544 ) ) ( not ( = ?auto_61545 ?auto_61543 ) ) ( not ( = ?auto_61540 ?auto_61545 ) ) ( not ( = ?auto_61541 ?auto_61545 ) ) ( not ( = ?auto_61542 ?auto_61545 ) ) ( ON ?auto_61542 ?auto_61543 ) ( ON ?auto_61541 ?auto_61542 ) ( ON ?auto_61540 ?auto_61541 ) ( CLEAR ?auto_61540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61545 ?auto_61546 ?auto_61544 ?auto_61543 ?auto_61542 ?auto_61541 )
      ( MAKE-5PILE ?auto_61540 ?auto_61541 ?auto_61542 ?auto_61543 ?auto_61544 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61548 - BLOCK
    )
    :vars
    (
      ?auto_61549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61549 ?auto_61548 ) ( CLEAR ?auto_61549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61548 ) ( not ( = ?auto_61548 ?auto_61549 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61549 ?auto_61548 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61550 - BLOCK
    )
    :vars
    (
      ?auto_61551 - BLOCK
      ?auto_61552 - BLOCK
      ?auto_61553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61551 ?auto_61550 ) ( CLEAR ?auto_61551 ) ( ON-TABLE ?auto_61550 ) ( not ( = ?auto_61550 ?auto_61551 ) ) ( HOLDING ?auto_61552 ) ( CLEAR ?auto_61553 ) ( not ( = ?auto_61550 ?auto_61552 ) ) ( not ( = ?auto_61550 ?auto_61553 ) ) ( not ( = ?auto_61551 ?auto_61552 ) ) ( not ( = ?auto_61551 ?auto_61553 ) ) ( not ( = ?auto_61552 ?auto_61553 ) ) )
    :subtasks
    ( ( !STACK ?auto_61552 ?auto_61553 )
      ( MAKE-1PILE ?auto_61550 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61554 - BLOCK
    )
    :vars
    (
      ?auto_61555 - BLOCK
      ?auto_61557 - BLOCK
      ?auto_61556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61555 ?auto_61554 ) ( ON-TABLE ?auto_61554 ) ( not ( = ?auto_61554 ?auto_61555 ) ) ( CLEAR ?auto_61557 ) ( not ( = ?auto_61554 ?auto_61556 ) ) ( not ( = ?auto_61554 ?auto_61557 ) ) ( not ( = ?auto_61555 ?auto_61556 ) ) ( not ( = ?auto_61555 ?auto_61557 ) ) ( not ( = ?auto_61556 ?auto_61557 ) ) ( ON ?auto_61556 ?auto_61555 ) ( CLEAR ?auto_61556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61554 ?auto_61555 )
      ( MAKE-1PILE ?auto_61554 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61558 - BLOCK
    )
    :vars
    (
      ?auto_61559 - BLOCK
      ?auto_61560 - BLOCK
      ?auto_61561 - BLOCK
      ?auto_61562 - BLOCK
      ?auto_61564 - BLOCK
      ?auto_61563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61559 ?auto_61558 ) ( ON-TABLE ?auto_61558 ) ( not ( = ?auto_61558 ?auto_61559 ) ) ( not ( = ?auto_61558 ?auto_61560 ) ) ( not ( = ?auto_61558 ?auto_61561 ) ) ( not ( = ?auto_61559 ?auto_61560 ) ) ( not ( = ?auto_61559 ?auto_61561 ) ) ( not ( = ?auto_61560 ?auto_61561 ) ) ( ON ?auto_61560 ?auto_61559 ) ( CLEAR ?auto_61560 ) ( HOLDING ?auto_61561 ) ( CLEAR ?auto_61562 ) ( ON-TABLE ?auto_61564 ) ( ON ?auto_61563 ?auto_61564 ) ( ON ?auto_61562 ?auto_61563 ) ( not ( = ?auto_61564 ?auto_61563 ) ) ( not ( = ?auto_61564 ?auto_61562 ) ) ( not ( = ?auto_61564 ?auto_61561 ) ) ( not ( = ?auto_61563 ?auto_61562 ) ) ( not ( = ?auto_61563 ?auto_61561 ) ) ( not ( = ?auto_61562 ?auto_61561 ) ) ( not ( = ?auto_61558 ?auto_61562 ) ) ( not ( = ?auto_61558 ?auto_61564 ) ) ( not ( = ?auto_61558 ?auto_61563 ) ) ( not ( = ?auto_61559 ?auto_61562 ) ) ( not ( = ?auto_61559 ?auto_61564 ) ) ( not ( = ?auto_61559 ?auto_61563 ) ) ( not ( = ?auto_61560 ?auto_61562 ) ) ( not ( = ?auto_61560 ?auto_61564 ) ) ( not ( = ?auto_61560 ?auto_61563 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61564 ?auto_61563 ?auto_61562 ?auto_61561 )
      ( MAKE-1PILE ?auto_61558 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61565 - BLOCK
    )
    :vars
    (
      ?auto_61570 - BLOCK
      ?auto_61567 - BLOCK
      ?auto_61566 - BLOCK
      ?auto_61568 - BLOCK
      ?auto_61569 - BLOCK
      ?auto_61571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61570 ?auto_61565 ) ( ON-TABLE ?auto_61565 ) ( not ( = ?auto_61565 ?auto_61570 ) ) ( not ( = ?auto_61565 ?auto_61567 ) ) ( not ( = ?auto_61565 ?auto_61566 ) ) ( not ( = ?auto_61570 ?auto_61567 ) ) ( not ( = ?auto_61570 ?auto_61566 ) ) ( not ( = ?auto_61567 ?auto_61566 ) ) ( ON ?auto_61567 ?auto_61570 ) ( CLEAR ?auto_61568 ) ( ON-TABLE ?auto_61569 ) ( ON ?auto_61571 ?auto_61569 ) ( ON ?auto_61568 ?auto_61571 ) ( not ( = ?auto_61569 ?auto_61571 ) ) ( not ( = ?auto_61569 ?auto_61568 ) ) ( not ( = ?auto_61569 ?auto_61566 ) ) ( not ( = ?auto_61571 ?auto_61568 ) ) ( not ( = ?auto_61571 ?auto_61566 ) ) ( not ( = ?auto_61568 ?auto_61566 ) ) ( not ( = ?auto_61565 ?auto_61568 ) ) ( not ( = ?auto_61565 ?auto_61569 ) ) ( not ( = ?auto_61565 ?auto_61571 ) ) ( not ( = ?auto_61570 ?auto_61568 ) ) ( not ( = ?auto_61570 ?auto_61569 ) ) ( not ( = ?auto_61570 ?auto_61571 ) ) ( not ( = ?auto_61567 ?auto_61568 ) ) ( not ( = ?auto_61567 ?auto_61569 ) ) ( not ( = ?auto_61567 ?auto_61571 ) ) ( ON ?auto_61566 ?auto_61567 ) ( CLEAR ?auto_61566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61565 ?auto_61570 ?auto_61567 )
      ( MAKE-1PILE ?auto_61565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61572 - BLOCK
    )
    :vars
    (
      ?auto_61578 - BLOCK
      ?auto_61577 - BLOCK
      ?auto_61573 - BLOCK
      ?auto_61575 - BLOCK
      ?auto_61574 - BLOCK
      ?auto_61576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61578 ?auto_61572 ) ( ON-TABLE ?auto_61572 ) ( not ( = ?auto_61572 ?auto_61578 ) ) ( not ( = ?auto_61572 ?auto_61577 ) ) ( not ( = ?auto_61572 ?auto_61573 ) ) ( not ( = ?auto_61578 ?auto_61577 ) ) ( not ( = ?auto_61578 ?auto_61573 ) ) ( not ( = ?auto_61577 ?auto_61573 ) ) ( ON ?auto_61577 ?auto_61578 ) ( ON-TABLE ?auto_61575 ) ( ON ?auto_61574 ?auto_61575 ) ( not ( = ?auto_61575 ?auto_61574 ) ) ( not ( = ?auto_61575 ?auto_61576 ) ) ( not ( = ?auto_61575 ?auto_61573 ) ) ( not ( = ?auto_61574 ?auto_61576 ) ) ( not ( = ?auto_61574 ?auto_61573 ) ) ( not ( = ?auto_61576 ?auto_61573 ) ) ( not ( = ?auto_61572 ?auto_61576 ) ) ( not ( = ?auto_61572 ?auto_61575 ) ) ( not ( = ?auto_61572 ?auto_61574 ) ) ( not ( = ?auto_61578 ?auto_61576 ) ) ( not ( = ?auto_61578 ?auto_61575 ) ) ( not ( = ?auto_61578 ?auto_61574 ) ) ( not ( = ?auto_61577 ?auto_61576 ) ) ( not ( = ?auto_61577 ?auto_61575 ) ) ( not ( = ?auto_61577 ?auto_61574 ) ) ( ON ?auto_61573 ?auto_61577 ) ( CLEAR ?auto_61573 ) ( HOLDING ?auto_61576 ) ( CLEAR ?auto_61574 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61575 ?auto_61574 ?auto_61576 )
      ( MAKE-1PILE ?auto_61572 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61579 - BLOCK
    )
    :vars
    (
      ?auto_61580 - BLOCK
      ?auto_61581 - BLOCK
      ?auto_61582 - BLOCK
      ?auto_61585 - BLOCK
      ?auto_61584 - BLOCK
      ?auto_61583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61580 ?auto_61579 ) ( ON-TABLE ?auto_61579 ) ( not ( = ?auto_61579 ?auto_61580 ) ) ( not ( = ?auto_61579 ?auto_61581 ) ) ( not ( = ?auto_61579 ?auto_61582 ) ) ( not ( = ?auto_61580 ?auto_61581 ) ) ( not ( = ?auto_61580 ?auto_61582 ) ) ( not ( = ?auto_61581 ?auto_61582 ) ) ( ON ?auto_61581 ?auto_61580 ) ( ON-TABLE ?auto_61585 ) ( ON ?auto_61584 ?auto_61585 ) ( not ( = ?auto_61585 ?auto_61584 ) ) ( not ( = ?auto_61585 ?auto_61583 ) ) ( not ( = ?auto_61585 ?auto_61582 ) ) ( not ( = ?auto_61584 ?auto_61583 ) ) ( not ( = ?auto_61584 ?auto_61582 ) ) ( not ( = ?auto_61583 ?auto_61582 ) ) ( not ( = ?auto_61579 ?auto_61583 ) ) ( not ( = ?auto_61579 ?auto_61585 ) ) ( not ( = ?auto_61579 ?auto_61584 ) ) ( not ( = ?auto_61580 ?auto_61583 ) ) ( not ( = ?auto_61580 ?auto_61585 ) ) ( not ( = ?auto_61580 ?auto_61584 ) ) ( not ( = ?auto_61581 ?auto_61583 ) ) ( not ( = ?auto_61581 ?auto_61585 ) ) ( not ( = ?auto_61581 ?auto_61584 ) ) ( ON ?auto_61582 ?auto_61581 ) ( CLEAR ?auto_61584 ) ( ON ?auto_61583 ?auto_61582 ) ( CLEAR ?auto_61583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61579 ?auto_61580 ?auto_61581 ?auto_61582 )
      ( MAKE-1PILE ?auto_61579 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61586 - BLOCK
    )
    :vars
    (
      ?auto_61591 - BLOCK
      ?auto_61588 - BLOCK
      ?auto_61590 - BLOCK
      ?auto_61587 - BLOCK
      ?auto_61592 - BLOCK
      ?auto_61589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61591 ?auto_61586 ) ( ON-TABLE ?auto_61586 ) ( not ( = ?auto_61586 ?auto_61591 ) ) ( not ( = ?auto_61586 ?auto_61588 ) ) ( not ( = ?auto_61586 ?auto_61590 ) ) ( not ( = ?auto_61591 ?auto_61588 ) ) ( not ( = ?auto_61591 ?auto_61590 ) ) ( not ( = ?auto_61588 ?auto_61590 ) ) ( ON ?auto_61588 ?auto_61591 ) ( ON-TABLE ?auto_61587 ) ( not ( = ?auto_61587 ?auto_61592 ) ) ( not ( = ?auto_61587 ?auto_61589 ) ) ( not ( = ?auto_61587 ?auto_61590 ) ) ( not ( = ?auto_61592 ?auto_61589 ) ) ( not ( = ?auto_61592 ?auto_61590 ) ) ( not ( = ?auto_61589 ?auto_61590 ) ) ( not ( = ?auto_61586 ?auto_61589 ) ) ( not ( = ?auto_61586 ?auto_61587 ) ) ( not ( = ?auto_61586 ?auto_61592 ) ) ( not ( = ?auto_61591 ?auto_61589 ) ) ( not ( = ?auto_61591 ?auto_61587 ) ) ( not ( = ?auto_61591 ?auto_61592 ) ) ( not ( = ?auto_61588 ?auto_61589 ) ) ( not ( = ?auto_61588 ?auto_61587 ) ) ( not ( = ?auto_61588 ?auto_61592 ) ) ( ON ?auto_61590 ?auto_61588 ) ( ON ?auto_61589 ?auto_61590 ) ( CLEAR ?auto_61589 ) ( HOLDING ?auto_61592 ) ( CLEAR ?auto_61587 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61587 ?auto_61592 )
      ( MAKE-1PILE ?auto_61586 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61593 - BLOCK
    )
    :vars
    (
      ?auto_61594 - BLOCK
      ?auto_61595 - BLOCK
      ?auto_61596 - BLOCK
      ?auto_61599 - BLOCK
      ?auto_61598 - BLOCK
      ?auto_61597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61594 ?auto_61593 ) ( ON-TABLE ?auto_61593 ) ( not ( = ?auto_61593 ?auto_61594 ) ) ( not ( = ?auto_61593 ?auto_61595 ) ) ( not ( = ?auto_61593 ?auto_61596 ) ) ( not ( = ?auto_61594 ?auto_61595 ) ) ( not ( = ?auto_61594 ?auto_61596 ) ) ( not ( = ?auto_61595 ?auto_61596 ) ) ( ON ?auto_61595 ?auto_61594 ) ( ON-TABLE ?auto_61599 ) ( not ( = ?auto_61599 ?auto_61598 ) ) ( not ( = ?auto_61599 ?auto_61597 ) ) ( not ( = ?auto_61599 ?auto_61596 ) ) ( not ( = ?auto_61598 ?auto_61597 ) ) ( not ( = ?auto_61598 ?auto_61596 ) ) ( not ( = ?auto_61597 ?auto_61596 ) ) ( not ( = ?auto_61593 ?auto_61597 ) ) ( not ( = ?auto_61593 ?auto_61599 ) ) ( not ( = ?auto_61593 ?auto_61598 ) ) ( not ( = ?auto_61594 ?auto_61597 ) ) ( not ( = ?auto_61594 ?auto_61599 ) ) ( not ( = ?auto_61594 ?auto_61598 ) ) ( not ( = ?auto_61595 ?auto_61597 ) ) ( not ( = ?auto_61595 ?auto_61599 ) ) ( not ( = ?auto_61595 ?auto_61598 ) ) ( ON ?auto_61596 ?auto_61595 ) ( ON ?auto_61597 ?auto_61596 ) ( CLEAR ?auto_61599 ) ( ON ?auto_61598 ?auto_61597 ) ( CLEAR ?auto_61598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61593 ?auto_61594 ?auto_61595 ?auto_61596 ?auto_61597 )
      ( MAKE-1PILE ?auto_61593 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61600 - BLOCK
    )
    :vars
    (
      ?auto_61605 - BLOCK
      ?auto_61601 - BLOCK
      ?auto_61606 - BLOCK
      ?auto_61602 - BLOCK
      ?auto_61604 - BLOCK
      ?auto_61603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61605 ?auto_61600 ) ( ON-TABLE ?auto_61600 ) ( not ( = ?auto_61600 ?auto_61605 ) ) ( not ( = ?auto_61600 ?auto_61601 ) ) ( not ( = ?auto_61600 ?auto_61606 ) ) ( not ( = ?auto_61605 ?auto_61601 ) ) ( not ( = ?auto_61605 ?auto_61606 ) ) ( not ( = ?auto_61601 ?auto_61606 ) ) ( ON ?auto_61601 ?auto_61605 ) ( not ( = ?auto_61602 ?auto_61604 ) ) ( not ( = ?auto_61602 ?auto_61603 ) ) ( not ( = ?auto_61602 ?auto_61606 ) ) ( not ( = ?auto_61604 ?auto_61603 ) ) ( not ( = ?auto_61604 ?auto_61606 ) ) ( not ( = ?auto_61603 ?auto_61606 ) ) ( not ( = ?auto_61600 ?auto_61603 ) ) ( not ( = ?auto_61600 ?auto_61602 ) ) ( not ( = ?auto_61600 ?auto_61604 ) ) ( not ( = ?auto_61605 ?auto_61603 ) ) ( not ( = ?auto_61605 ?auto_61602 ) ) ( not ( = ?auto_61605 ?auto_61604 ) ) ( not ( = ?auto_61601 ?auto_61603 ) ) ( not ( = ?auto_61601 ?auto_61602 ) ) ( not ( = ?auto_61601 ?auto_61604 ) ) ( ON ?auto_61606 ?auto_61601 ) ( ON ?auto_61603 ?auto_61606 ) ( ON ?auto_61604 ?auto_61603 ) ( CLEAR ?auto_61604 ) ( HOLDING ?auto_61602 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61602 )
      ( MAKE-1PILE ?auto_61600 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61607 - BLOCK
    )
    :vars
    (
      ?auto_61610 - BLOCK
      ?auto_61613 - BLOCK
      ?auto_61612 - BLOCK
      ?auto_61608 - BLOCK
      ?auto_61611 - BLOCK
      ?auto_61609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61610 ?auto_61607 ) ( ON-TABLE ?auto_61607 ) ( not ( = ?auto_61607 ?auto_61610 ) ) ( not ( = ?auto_61607 ?auto_61613 ) ) ( not ( = ?auto_61607 ?auto_61612 ) ) ( not ( = ?auto_61610 ?auto_61613 ) ) ( not ( = ?auto_61610 ?auto_61612 ) ) ( not ( = ?auto_61613 ?auto_61612 ) ) ( ON ?auto_61613 ?auto_61610 ) ( not ( = ?auto_61608 ?auto_61611 ) ) ( not ( = ?auto_61608 ?auto_61609 ) ) ( not ( = ?auto_61608 ?auto_61612 ) ) ( not ( = ?auto_61611 ?auto_61609 ) ) ( not ( = ?auto_61611 ?auto_61612 ) ) ( not ( = ?auto_61609 ?auto_61612 ) ) ( not ( = ?auto_61607 ?auto_61609 ) ) ( not ( = ?auto_61607 ?auto_61608 ) ) ( not ( = ?auto_61607 ?auto_61611 ) ) ( not ( = ?auto_61610 ?auto_61609 ) ) ( not ( = ?auto_61610 ?auto_61608 ) ) ( not ( = ?auto_61610 ?auto_61611 ) ) ( not ( = ?auto_61613 ?auto_61609 ) ) ( not ( = ?auto_61613 ?auto_61608 ) ) ( not ( = ?auto_61613 ?auto_61611 ) ) ( ON ?auto_61612 ?auto_61613 ) ( ON ?auto_61609 ?auto_61612 ) ( ON ?auto_61611 ?auto_61609 ) ( ON ?auto_61608 ?auto_61611 ) ( CLEAR ?auto_61608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61607 ?auto_61610 ?auto_61613 ?auto_61612 ?auto_61609 ?auto_61611 )
      ( MAKE-1PILE ?auto_61607 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61620 - BLOCK
      ?auto_61621 - BLOCK
      ?auto_61622 - BLOCK
      ?auto_61623 - BLOCK
      ?auto_61624 - BLOCK
      ?auto_61625 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61625 ) ( CLEAR ?auto_61624 ) ( ON-TABLE ?auto_61620 ) ( ON ?auto_61621 ?auto_61620 ) ( ON ?auto_61622 ?auto_61621 ) ( ON ?auto_61623 ?auto_61622 ) ( ON ?auto_61624 ?auto_61623 ) ( not ( = ?auto_61620 ?auto_61621 ) ) ( not ( = ?auto_61620 ?auto_61622 ) ) ( not ( = ?auto_61620 ?auto_61623 ) ) ( not ( = ?auto_61620 ?auto_61624 ) ) ( not ( = ?auto_61620 ?auto_61625 ) ) ( not ( = ?auto_61621 ?auto_61622 ) ) ( not ( = ?auto_61621 ?auto_61623 ) ) ( not ( = ?auto_61621 ?auto_61624 ) ) ( not ( = ?auto_61621 ?auto_61625 ) ) ( not ( = ?auto_61622 ?auto_61623 ) ) ( not ( = ?auto_61622 ?auto_61624 ) ) ( not ( = ?auto_61622 ?auto_61625 ) ) ( not ( = ?auto_61623 ?auto_61624 ) ) ( not ( = ?auto_61623 ?auto_61625 ) ) ( not ( = ?auto_61624 ?auto_61625 ) ) )
    :subtasks
    ( ( !STACK ?auto_61625 ?auto_61624 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61626 - BLOCK
      ?auto_61627 - BLOCK
      ?auto_61628 - BLOCK
      ?auto_61629 - BLOCK
      ?auto_61630 - BLOCK
      ?auto_61631 - BLOCK
    )
    :vars
    (
      ?auto_61632 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61630 ) ( ON-TABLE ?auto_61626 ) ( ON ?auto_61627 ?auto_61626 ) ( ON ?auto_61628 ?auto_61627 ) ( ON ?auto_61629 ?auto_61628 ) ( ON ?auto_61630 ?auto_61629 ) ( not ( = ?auto_61626 ?auto_61627 ) ) ( not ( = ?auto_61626 ?auto_61628 ) ) ( not ( = ?auto_61626 ?auto_61629 ) ) ( not ( = ?auto_61626 ?auto_61630 ) ) ( not ( = ?auto_61626 ?auto_61631 ) ) ( not ( = ?auto_61627 ?auto_61628 ) ) ( not ( = ?auto_61627 ?auto_61629 ) ) ( not ( = ?auto_61627 ?auto_61630 ) ) ( not ( = ?auto_61627 ?auto_61631 ) ) ( not ( = ?auto_61628 ?auto_61629 ) ) ( not ( = ?auto_61628 ?auto_61630 ) ) ( not ( = ?auto_61628 ?auto_61631 ) ) ( not ( = ?auto_61629 ?auto_61630 ) ) ( not ( = ?auto_61629 ?auto_61631 ) ) ( not ( = ?auto_61630 ?auto_61631 ) ) ( ON ?auto_61631 ?auto_61632 ) ( CLEAR ?auto_61631 ) ( HAND-EMPTY ) ( not ( = ?auto_61626 ?auto_61632 ) ) ( not ( = ?auto_61627 ?auto_61632 ) ) ( not ( = ?auto_61628 ?auto_61632 ) ) ( not ( = ?auto_61629 ?auto_61632 ) ) ( not ( = ?auto_61630 ?auto_61632 ) ) ( not ( = ?auto_61631 ?auto_61632 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61631 ?auto_61632 )
      ( MAKE-6PILE ?auto_61626 ?auto_61627 ?auto_61628 ?auto_61629 ?auto_61630 ?auto_61631 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61633 - BLOCK
      ?auto_61634 - BLOCK
      ?auto_61635 - BLOCK
      ?auto_61636 - BLOCK
      ?auto_61637 - BLOCK
      ?auto_61638 - BLOCK
    )
    :vars
    (
      ?auto_61639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61633 ) ( ON ?auto_61634 ?auto_61633 ) ( ON ?auto_61635 ?auto_61634 ) ( ON ?auto_61636 ?auto_61635 ) ( not ( = ?auto_61633 ?auto_61634 ) ) ( not ( = ?auto_61633 ?auto_61635 ) ) ( not ( = ?auto_61633 ?auto_61636 ) ) ( not ( = ?auto_61633 ?auto_61637 ) ) ( not ( = ?auto_61633 ?auto_61638 ) ) ( not ( = ?auto_61634 ?auto_61635 ) ) ( not ( = ?auto_61634 ?auto_61636 ) ) ( not ( = ?auto_61634 ?auto_61637 ) ) ( not ( = ?auto_61634 ?auto_61638 ) ) ( not ( = ?auto_61635 ?auto_61636 ) ) ( not ( = ?auto_61635 ?auto_61637 ) ) ( not ( = ?auto_61635 ?auto_61638 ) ) ( not ( = ?auto_61636 ?auto_61637 ) ) ( not ( = ?auto_61636 ?auto_61638 ) ) ( not ( = ?auto_61637 ?auto_61638 ) ) ( ON ?auto_61638 ?auto_61639 ) ( CLEAR ?auto_61638 ) ( not ( = ?auto_61633 ?auto_61639 ) ) ( not ( = ?auto_61634 ?auto_61639 ) ) ( not ( = ?auto_61635 ?auto_61639 ) ) ( not ( = ?auto_61636 ?auto_61639 ) ) ( not ( = ?auto_61637 ?auto_61639 ) ) ( not ( = ?auto_61638 ?auto_61639 ) ) ( HOLDING ?auto_61637 ) ( CLEAR ?auto_61636 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61633 ?auto_61634 ?auto_61635 ?auto_61636 ?auto_61637 )
      ( MAKE-6PILE ?auto_61633 ?auto_61634 ?auto_61635 ?auto_61636 ?auto_61637 ?auto_61638 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61640 - BLOCK
      ?auto_61641 - BLOCK
      ?auto_61642 - BLOCK
      ?auto_61643 - BLOCK
      ?auto_61644 - BLOCK
      ?auto_61645 - BLOCK
    )
    :vars
    (
      ?auto_61646 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61640 ) ( ON ?auto_61641 ?auto_61640 ) ( ON ?auto_61642 ?auto_61641 ) ( ON ?auto_61643 ?auto_61642 ) ( not ( = ?auto_61640 ?auto_61641 ) ) ( not ( = ?auto_61640 ?auto_61642 ) ) ( not ( = ?auto_61640 ?auto_61643 ) ) ( not ( = ?auto_61640 ?auto_61644 ) ) ( not ( = ?auto_61640 ?auto_61645 ) ) ( not ( = ?auto_61641 ?auto_61642 ) ) ( not ( = ?auto_61641 ?auto_61643 ) ) ( not ( = ?auto_61641 ?auto_61644 ) ) ( not ( = ?auto_61641 ?auto_61645 ) ) ( not ( = ?auto_61642 ?auto_61643 ) ) ( not ( = ?auto_61642 ?auto_61644 ) ) ( not ( = ?auto_61642 ?auto_61645 ) ) ( not ( = ?auto_61643 ?auto_61644 ) ) ( not ( = ?auto_61643 ?auto_61645 ) ) ( not ( = ?auto_61644 ?auto_61645 ) ) ( ON ?auto_61645 ?auto_61646 ) ( not ( = ?auto_61640 ?auto_61646 ) ) ( not ( = ?auto_61641 ?auto_61646 ) ) ( not ( = ?auto_61642 ?auto_61646 ) ) ( not ( = ?auto_61643 ?auto_61646 ) ) ( not ( = ?auto_61644 ?auto_61646 ) ) ( not ( = ?auto_61645 ?auto_61646 ) ) ( CLEAR ?auto_61643 ) ( ON ?auto_61644 ?auto_61645 ) ( CLEAR ?auto_61644 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61646 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61646 ?auto_61645 )
      ( MAKE-6PILE ?auto_61640 ?auto_61641 ?auto_61642 ?auto_61643 ?auto_61644 ?auto_61645 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61647 - BLOCK
      ?auto_61648 - BLOCK
      ?auto_61649 - BLOCK
      ?auto_61650 - BLOCK
      ?auto_61651 - BLOCK
      ?auto_61652 - BLOCK
    )
    :vars
    (
      ?auto_61653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61647 ) ( ON ?auto_61648 ?auto_61647 ) ( ON ?auto_61649 ?auto_61648 ) ( not ( = ?auto_61647 ?auto_61648 ) ) ( not ( = ?auto_61647 ?auto_61649 ) ) ( not ( = ?auto_61647 ?auto_61650 ) ) ( not ( = ?auto_61647 ?auto_61651 ) ) ( not ( = ?auto_61647 ?auto_61652 ) ) ( not ( = ?auto_61648 ?auto_61649 ) ) ( not ( = ?auto_61648 ?auto_61650 ) ) ( not ( = ?auto_61648 ?auto_61651 ) ) ( not ( = ?auto_61648 ?auto_61652 ) ) ( not ( = ?auto_61649 ?auto_61650 ) ) ( not ( = ?auto_61649 ?auto_61651 ) ) ( not ( = ?auto_61649 ?auto_61652 ) ) ( not ( = ?auto_61650 ?auto_61651 ) ) ( not ( = ?auto_61650 ?auto_61652 ) ) ( not ( = ?auto_61651 ?auto_61652 ) ) ( ON ?auto_61652 ?auto_61653 ) ( not ( = ?auto_61647 ?auto_61653 ) ) ( not ( = ?auto_61648 ?auto_61653 ) ) ( not ( = ?auto_61649 ?auto_61653 ) ) ( not ( = ?auto_61650 ?auto_61653 ) ) ( not ( = ?auto_61651 ?auto_61653 ) ) ( not ( = ?auto_61652 ?auto_61653 ) ) ( ON ?auto_61651 ?auto_61652 ) ( CLEAR ?auto_61651 ) ( ON-TABLE ?auto_61653 ) ( HOLDING ?auto_61650 ) ( CLEAR ?auto_61649 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61647 ?auto_61648 ?auto_61649 ?auto_61650 )
      ( MAKE-6PILE ?auto_61647 ?auto_61648 ?auto_61649 ?auto_61650 ?auto_61651 ?auto_61652 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61654 - BLOCK
      ?auto_61655 - BLOCK
      ?auto_61656 - BLOCK
      ?auto_61657 - BLOCK
      ?auto_61658 - BLOCK
      ?auto_61659 - BLOCK
    )
    :vars
    (
      ?auto_61660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61654 ) ( ON ?auto_61655 ?auto_61654 ) ( ON ?auto_61656 ?auto_61655 ) ( not ( = ?auto_61654 ?auto_61655 ) ) ( not ( = ?auto_61654 ?auto_61656 ) ) ( not ( = ?auto_61654 ?auto_61657 ) ) ( not ( = ?auto_61654 ?auto_61658 ) ) ( not ( = ?auto_61654 ?auto_61659 ) ) ( not ( = ?auto_61655 ?auto_61656 ) ) ( not ( = ?auto_61655 ?auto_61657 ) ) ( not ( = ?auto_61655 ?auto_61658 ) ) ( not ( = ?auto_61655 ?auto_61659 ) ) ( not ( = ?auto_61656 ?auto_61657 ) ) ( not ( = ?auto_61656 ?auto_61658 ) ) ( not ( = ?auto_61656 ?auto_61659 ) ) ( not ( = ?auto_61657 ?auto_61658 ) ) ( not ( = ?auto_61657 ?auto_61659 ) ) ( not ( = ?auto_61658 ?auto_61659 ) ) ( ON ?auto_61659 ?auto_61660 ) ( not ( = ?auto_61654 ?auto_61660 ) ) ( not ( = ?auto_61655 ?auto_61660 ) ) ( not ( = ?auto_61656 ?auto_61660 ) ) ( not ( = ?auto_61657 ?auto_61660 ) ) ( not ( = ?auto_61658 ?auto_61660 ) ) ( not ( = ?auto_61659 ?auto_61660 ) ) ( ON ?auto_61658 ?auto_61659 ) ( ON-TABLE ?auto_61660 ) ( CLEAR ?auto_61656 ) ( ON ?auto_61657 ?auto_61658 ) ( CLEAR ?auto_61657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61660 ?auto_61659 ?auto_61658 )
      ( MAKE-6PILE ?auto_61654 ?auto_61655 ?auto_61656 ?auto_61657 ?auto_61658 ?auto_61659 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61661 - BLOCK
      ?auto_61662 - BLOCK
      ?auto_61663 - BLOCK
      ?auto_61664 - BLOCK
      ?auto_61665 - BLOCK
      ?auto_61666 - BLOCK
    )
    :vars
    (
      ?auto_61667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61661 ) ( ON ?auto_61662 ?auto_61661 ) ( not ( = ?auto_61661 ?auto_61662 ) ) ( not ( = ?auto_61661 ?auto_61663 ) ) ( not ( = ?auto_61661 ?auto_61664 ) ) ( not ( = ?auto_61661 ?auto_61665 ) ) ( not ( = ?auto_61661 ?auto_61666 ) ) ( not ( = ?auto_61662 ?auto_61663 ) ) ( not ( = ?auto_61662 ?auto_61664 ) ) ( not ( = ?auto_61662 ?auto_61665 ) ) ( not ( = ?auto_61662 ?auto_61666 ) ) ( not ( = ?auto_61663 ?auto_61664 ) ) ( not ( = ?auto_61663 ?auto_61665 ) ) ( not ( = ?auto_61663 ?auto_61666 ) ) ( not ( = ?auto_61664 ?auto_61665 ) ) ( not ( = ?auto_61664 ?auto_61666 ) ) ( not ( = ?auto_61665 ?auto_61666 ) ) ( ON ?auto_61666 ?auto_61667 ) ( not ( = ?auto_61661 ?auto_61667 ) ) ( not ( = ?auto_61662 ?auto_61667 ) ) ( not ( = ?auto_61663 ?auto_61667 ) ) ( not ( = ?auto_61664 ?auto_61667 ) ) ( not ( = ?auto_61665 ?auto_61667 ) ) ( not ( = ?auto_61666 ?auto_61667 ) ) ( ON ?auto_61665 ?auto_61666 ) ( ON-TABLE ?auto_61667 ) ( ON ?auto_61664 ?auto_61665 ) ( CLEAR ?auto_61664 ) ( HOLDING ?auto_61663 ) ( CLEAR ?auto_61662 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61661 ?auto_61662 ?auto_61663 )
      ( MAKE-6PILE ?auto_61661 ?auto_61662 ?auto_61663 ?auto_61664 ?auto_61665 ?auto_61666 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61668 - BLOCK
      ?auto_61669 - BLOCK
      ?auto_61670 - BLOCK
      ?auto_61671 - BLOCK
      ?auto_61672 - BLOCK
      ?auto_61673 - BLOCK
    )
    :vars
    (
      ?auto_61674 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61668 ) ( ON ?auto_61669 ?auto_61668 ) ( not ( = ?auto_61668 ?auto_61669 ) ) ( not ( = ?auto_61668 ?auto_61670 ) ) ( not ( = ?auto_61668 ?auto_61671 ) ) ( not ( = ?auto_61668 ?auto_61672 ) ) ( not ( = ?auto_61668 ?auto_61673 ) ) ( not ( = ?auto_61669 ?auto_61670 ) ) ( not ( = ?auto_61669 ?auto_61671 ) ) ( not ( = ?auto_61669 ?auto_61672 ) ) ( not ( = ?auto_61669 ?auto_61673 ) ) ( not ( = ?auto_61670 ?auto_61671 ) ) ( not ( = ?auto_61670 ?auto_61672 ) ) ( not ( = ?auto_61670 ?auto_61673 ) ) ( not ( = ?auto_61671 ?auto_61672 ) ) ( not ( = ?auto_61671 ?auto_61673 ) ) ( not ( = ?auto_61672 ?auto_61673 ) ) ( ON ?auto_61673 ?auto_61674 ) ( not ( = ?auto_61668 ?auto_61674 ) ) ( not ( = ?auto_61669 ?auto_61674 ) ) ( not ( = ?auto_61670 ?auto_61674 ) ) ( not ( = ?auto_61671 ?auto_61674 ) ) ( not ( = ?auto_61672 ?auto_61674 ) ) ( not ( = ?auto_61673 ?auto_61674 ) ) ( ON ?auto_61672 ?auto_61673 ) ( ON-TABLE ?auto_61674 ) ( ON ?auto_61671 ?auto_61672 ) ( CLEAR ?auto_61669 ) ( ON ?auto_61670 ?auto_61671 ) ( CLEAR ?auto_61670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61674 ?auto_61673 ?auto_61672 ?auto_61671 )
      ( MAKE-6PILE ?auto_61668 ?auto_61669 ?auto_61670 ?auto_61671 ?auto_61672 ?auto_61673 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61675 - BLOCK
      ?auto_61676 - BLOCK
      ?auto_61677 - BLOCK
      ?auto_61678 - BLOCK
      ?auto_61679 - BLOCK
      ?auto_61680 - BLOCK
    )
    :vars
    (
      ?auto_61681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61675 ) ( not ( = ?auto_61675 ?auto_61676 ) ) ( not ( = ?auto_61675 ?auto_61677 ) ) ( not ( = ?auto_61675 ?auto_61678 ) ) ( not ( = ?auto_61675 ?auto_61679 ) ) ( not ( = ?auto_61675 ?auto_61680 ) ) ( not ( = ?auto_61676 ?auto_61677 ) ) ( not ( = ?auto_61676 ?auto_61678 ) ) ( not ( = ?auto_61676 ?auto_61679 ) ) ( not ( = ?auto_61676 ?auto_61680 ) ) ( not ( = ?auto_61677 ?auto_61678 ) ) ( not ( = ?auto_61677 ?auto_61679 ) ) ( not ( = ?auto_61677 ?auto_61680 ) ) ( not ( = ?auto_61678 ?auto_61679 ) ) ( not ( = ?auto_61678 ?auto_61680 ) ) ( not ( = ?auto_61679 ?auto_61680 ) ) ( ON ?auto_61680 ?auto_61681 ) ( not ( = ?auto_61675 ?auto_61681 ) ) ( not ( = ?auto_61676 ?auto_61681 ) ) ( not ( = ?auto_61677 ?auto_61681 ) ) ( not ( = ?auto_61678 ?auto_61681 ) ) ( not ( = ?auto_61679 ?auto_61681 ) ) ( not ( = ?auto_61680 ?auto_61681 ) ) ( ON ?auto_61679 ?auto_61680 ) ( ON-TABLE ?auto_61681 ) ( ON ?auto_61678 ?auto_61679 ) ( ON ?auto_61677 ?auto_61678 ) ( CLEAR ?auto_61677 ) ( HOLDING ?auto_61676 ) ( CLEAR ?auto_61675 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61675 ?auto_61676 )
      ( MAKE-6PILE ?auto_61675 ?auto_61676 ?auto_61677 ?auto_61678 ?auto_61679 ?auto_61680 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61682 - BLOCK
      ?auto_61683 - BLOCK
      ?auto_61684 - BLOCK
      ?auto_61685 - BLOCK
      ?auto_61686 - BLOCK
      ?auto_61687 - BLOCK
    )
    :vars
    (
      ?auto_61688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61682 ) ( not ( = ?auto_61682 ?auto_61683 ) ) ( not ( = ?auto_61682 ?auto_61684 ) ) ( not ( = ?auto_61682 ?auto_61685 ) ) ( not ( = ?auto_61682 ?auto_61686 ) ) ( not ( = ?auto_61682 ?auto_61687 ) ) ( not ( = ?auto_61683 ?auto_61684 ) ) ( not ( = ?auto_61683 ?auto_61685 ) ) ( not ( = ?auto_61683 ?auto_61686 ) ) ( not ( = ?auto_61683 ?auto_61687 ) ) ( not ( = ?auto_61684 ?auto_61685 ) ) ( not ( = ?auto_61684 ?auto_61686 ) ) ( not ( = ?auto_61684 ?auto_61687 ) ) ( not ( = ?auto_61685 ?auto_61686 ) ) ( not ( = ?auto_61685 ?auto_61687 ) ) ( not ( = ?auto_61686 ?auto_61687 ) ) ( ON ?auto_61687 ?auto_61688 ) ( not ( = ?auto_61682 ?auto_61688 ) ) ( not ( = ?auto_61683 ?auto_61688 ) ) ( not ( = ?auto_61684 ?auto_61688 ) ) ( not ( = ?auto_61685 ?auto_61688 ) ) ( not ( = ?auto_61686 ?auto_61688 ) ) ( not ( = ?auto_61687 ?auto_61688 ) ) ( ON ?auto_61686 ?auto_61687 ) ( ON-TABLE ?auto_61688 ) ( ON ?auto_61685 ?auto_61686 ) ( ON ?auto_61684 ?auto_61685 ) ( CLEAR ?auto_61682 ) ( ON ?auto_61683 ?auto_61684 ) ( CLEAR ?auto_61683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61688 ?auto_61687 ?auto_61686 ?auto_61685 ?auto_61684 )
      ( MAKE-6PILE ?auto_61682 ?auto_61683 ?auto_61684 ?auto_61685 ?auto_61686 ?auto_61687 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61689 - BLOCK
      ?auto_61690 - BLOCK
      ?auto_61691 - BLOCK
      ?auto_61692 - BLOCK
      ?auto_61693 - BLOCK
      ?auto_61694 - BLOCK
    )
    :vars
    (
      ?auto_61695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61689 ?auto_61690 ) ) ( not ( = ?auto_61689 ?auto_61691 ) ) ( not ( = ?auto_61689 ?auto_61692 ) ) ( not ( = ?auto_61689 ?auto_61693 ) ) ( not ( = ?auto_61689 ?auto_61694 ) ) ( not ( = ?auto_61690 ?auto_61691 ) ) ( not ( = ?auto_61690 ?auto_61692 ) ) ( not ( = ?auto_61690 ?auto_61693 ) ) ( not ( = ?auto_61690 ?auto_61694 ) ) ( not ( = ?auto_61691 ?auto_61692 ) ) ( not ( = ?auto_61691 ?auto_61693 ) ) ( not ( = ?auto_61691 ?auto_61694 ) ) ( not ( = ?auto_61692 ?auto_61693 ) ) ( not ( = ?auto_61692 ?auto_61694 ) ) ( not ( = ?auto_61693 ?auto_61694 ) ) ( ON ?auto_61694 ?auto_61695 ) ( not ( = ?auto_61689 ?auto_61695 ) ) ( not ( = ?auto_61690 ?auto_61695 ) ) ( not ( = ?auto_61691 ?auto_61695 ) ) ( not ( = ?auto_61692 ?auto_61695 ) ) ( not ( = ?auto_61693 ?auto_61695 ) ) ( not ( = ?auto_61694 ?auto_61695 ) ) ( ON ?auto_61693 ?auto_61694 ) ( ON-TABLE ?auto_61695 ) ( ON ?auto_61692 ?auto_61693 ) ( ON ?auto_61691 ?auto_61692 ) ( ON ?auto_61690 ?auto_61691 ) ( CLEAR ?auto_61690 ) ( HOLDING ?auto_61689 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61689 )
      ( MAKE-6PILE ?auto_61689 ?auto_61690 ?auto_61691 ?auto_61692 ?auto_61693 ?auto_61694 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61696 - BLOCK
      ?auto_61697 - BLOCK
      ?auto_61698 - BLOCK
      ?auto_61699 - BLOCK
      ?auto_61700 - BLOCK
      ?auto_61701 - BLOCK
    )
    :vars
    (
      ?auto_61702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61696 ?auto_61697 ) ) ( not ( = ?auto_61696 ?auto_61698 ) ) ( not ( = ?auto_61696 ?auto_61699 ) ) ( not ( = ?auto_61696 ?auto_61700 ) ) ( not ( = ?auto_61696 ?auto_61701 ) ) ( not ( = ?auto_61697 ?auto_61698 ) ) ( not ( = ?auto_61697 ?auto_61699 ) ) ( not ( = ?auto_61697 ?auto_61700 ) ) ( not ( = ?auto_61697 ?auto_61701 ) ) ( not ( = ?auto_61698 ?auto_61699 ) ) ( not ( = ?auto_61698 ?auto_61700 ) ) ( not ( = ?auto_61698 ?auto_61701 ) ) ( not ( = ?auto_61699 ?auto_61700 ) ) ( not ( = ?auto_61699 ?auto_61701 ) ) ( not ( = ?auto_61700 ?auto_61701 ) ) ( ON ?auto_61701 ?auto_61702 ) ( not ( = ?auto_61696 ?auto_61702 ) ) ( not ( = ?auto_61697 ?auto_61702 ) ) ( not ( = ?auto_61698 ?auto_61702 ) ) ( not ( = ?auto_61699 ?auto_61702 ) ) ( not ( = ?auto_61700 ?auto_61702 ) ) ( not ( = ?auto_61701 ?auto_61702 ) ) ( ON ?auto_61700 ?auto_61701 ) ( ON-TABLE ?auto_61702 ) ( ON ?auto_61699 ?auto_61700 ) ( ON ?auto_61698 ?auto_61699 ) ( ON ?auto_61697 ?auto_61698 ) ( ON ?auto_61696 ?auto_61697 ) ( CLEAR ?auto_61696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61702 ?auto_61701 ?auto_61700 ?auto_61699 ?auto_61698 ?auto_61697 )
      ( MAKE-6PILE ?auto_61696 ?auto_61697 ?auto_61698 ?auto_61699 ?auto_61700 ?auto_61701 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61708 - BLOCK
      ?auto_61709 - BLOCK
      ?auto_61710 - BLOCK
      ?auto_61711 - BLOCK
      ?auto_61712 - BLOCK
    )
    :vars
    (
      ?auto_61713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61713 ?auto_61712 ) ( CLEAR ?auto_61713 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61708 ) ( ON ?auto_61709 ?auto_61708 ) ( ON ?auto_61710 ?auto_61709 ) ( ON ?auto_61711 ?auto_61710 ) ( ON ?auto_61712 ?auto_61711 ) ( not ( = ?auto_61708 ?auto_61709 ) ) ( not ( = ?auto_61708 ?auto_61710 ) ) ( not ( = ?auto_61708 ?auto_61711 ) ) ( not ( = ?auto_61708 ?auto_61712 ) ) ( not ( = ?auto_61708 ?auto_61713 ) ) ( not ( = ?auto_61709 ?auto_61710 ) ) ( not ( = ?auto_61709 ?auto_61711 ) ) ( not ( = ?auto_61709 ?auto_61712 ) ) ( not ( = ?auto_61709 ?auto_61713 ) ) ( not ( = ?auto_61710 ?auto_61711 ) ) ( not ( = ?auto_61710 ?auto_61712 ) ) ( not ( = ?auto_61710 ?auto_61713 ) ) ( not ( = ?auto_61711 ?auto_61712 ) ) ( not ( = ?auto_61711 ?auto_61713 ) ) ( not ( = ?auto_61712 ?auto_61713 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61713 ?auto_61712 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61727 - BLOCK
      ?auto_61728 - BLOCK
      ?auto_61729 - BLOCK
      ?auto_61730 - BLOCK
      ?auto_61731 - BLOCK
    )
    :vars
    (
      ?auto_61732 - BLOCK
      ?auto_61733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61727 ) ( ON ?auto_61728 ?auto_61727 ) ( ON ?auto_61729 ?auto_61728 ) ( ON ?auto_61730 ?auto_61729 ) ( not ( = ?auto_61727 ?auto_61728 ) ) ( not ( = ?auto_61727 ?auto_61729 ) ) ( not ( = ?auto_61727 ?auto_61730 ) ) ( not ( = ?auto_61727 ?auto_61731 ) ) ( not ( = ?auto_61727 ?auto_61732 ) ) ( not ( = ?auto_61728 ?auto_61729 ) ) ( not ( = ?auto_61728 ?auto_61730 ) ) ( not ( = ?auto_61728 ?auto_61731 ) ) ( not ( = ?auto_61728 ?auto_61732 ) ) ( not ( = ?auto_61729 ?auto_61730 ) ) ( not ( = ?auto_61729 ?auto_61731 ) ) ( not ( = ?auto_61729 ?auto_61732 ) ) ( not ( = ?auto_61730 ?auto_61731 ) ) ( not ( = ?auto_61730 ?auto_61732 ) ) ( not ( = ?auto_61731 ?auto_61732 ) ) ( ON ?auto_61732 ?auto_61733 ) ( CLEAR ?auto_61732 ) ( not ( = ?auto_61727 ?auto_61733 ) ) ( not ( = ?auto_61728 ?auto_61733 ) ) ( not ( = ?auto_61729 ?auto_61733 ) ) ( not ( = ?auto_61730 ?auto_61733 ) ) ( not ( = ?auto_61731 ?auto_61733 ) ) ( not ( = ?auto_61732 ?auto_61733 ) ) ( HOLDING ?auto_61731 ) ( CLEAR ?auto_61730 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61727 ?auto_61728 ?auto_61729 ?auto_61730 ?auto_61731 ?auto_61732 )
      ( MAKE-5PILE ?auto_61727 ?auto_61728 ?auto_61729 ?auto_61730 ?auto_61731 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61734 - BLOCK
      ?auto_61735 - BLOCK
      ?auto_61736 - BLOCK
      ?auto_61737 - BLOCK
      ?auto_61738 - BLOCK
    )
    :vars
    (
      ?auto_61740 - BLOCK
      ?auto_61739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61734 ) ( ON ?auto_61735 ?auto_61734 ) ( ON ?auto_61736 ?auto_61735 ) ( ON ?auto_61737 ?auto_61736 ) ( not ( = ?auto_61734 ?auto_61735 ) ) ( not ( = ?auto_61734 ?auto_61736 ) ) ( not ( = ?auto_61734 ?auto_61737 ) ) ( not ( = ?auto_61734 ?auto_61738 ) ) ( not ( = ?auto_61734 ?auto_61740 ) ) ( not ( = ?auto_61735 ?auto_61736 ) ) ( not ( = ?auto_61735 ?auto_61737 ) ) ( not ( = ?auto_61735 ?auto_61738 ) ) ( not ( = ?auto_61735 ?auto_61740 ) ) ( not ( = ?auto_61736 ?auto_61737 ) ) ( not ( = ?auto_61736 ?auto_61738 ) ) ( not ( = ?auto_61736 ?auto_61740 ) ) ( not ( = ?auto_61737 ?auto_61738 ) ) ( not ( = ?auto_61737 ?auto_61740 ) ) ( not ( = ?auto_61738 ?auto_61740 ) ) ( ON ?auto_61740 ?auto_61739 ) ( not ( = ?auto_61734 ?auto_61739 ) ) ( not ( = ?auto_61735 ?auto_61739 ) ) ( not ( = ?auto_61736 ?auto_61739 ) ) ( not ( = ?auto_61737 ?auto_61739 ) ) ( not ( = ?auto_61738 ?auto_61739 ) ) ( not ( = ?auto_61740 ?auto_61739 ) ) ( CLEAR ?auto_61737 ) ( ON ?auto_61738 ?auto_61740 ) ( CLEAR ?auto_61738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61739 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61739 ?auto_61740 )
      ( MAKE-5PILE ?auto_61734 ?auto_61735 ?auto_61736 ?auto_61737 ?auto_61738 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61741 - BLOCK
      ?auto_61742 - BLOCK
      ?auto_61743 - BLOCK
      ?auto_61744 - BLOCK
      ?auto_61745 - BLOCK
    )
    :vars
    (
      ?auto_61747 - BLOCK
      ?auto_61746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61741 ) ( ON ?auto_61742 ?auto_61741 ) ( ON ?auto_61743 ?auto_61742 ) ( not ( = ?auto_61741 ?auto_61742 ) ) ( not ( = ?auto_61741 ?auto_61743 ) ) ( not ( = ?auto_61741 ?auto_61744 ) ) ( not ( = ?auto_61741 ?auto_61745 ) ) ( not ( = ?auto_61741 ?auto_61747 ) ) ( not ( = ?auto_61742 ?auto_61743 ) ) ( not ( = ?auto_61742 ?auto_61744 ) ) ( not ( = ?auto_61742 ?auto_61745 ) ) ( not ( = ?auto_61742 ?auto_61747 ) ) ( not ( = ?auto_61743 ?auto_61744 ) ) ( not ( = ?auto_61743 ?auto_61745 ) ) ( not ( = ?auto_61743 ?auto_61747 ) ) ( not ( = ?auto_61744 ?auto_61745 ) ) ( not ( = ?auto_61744 ?auto_61747 ) ) ( not ( = ?auto_61745 ?auto_61747 ) ) ( ON ?auto_61747 ?auto_61746 ) ( not ( = ?auto_61741 ?auto_61746 ) ) ( not ( = ?auto_61742 ?auto_61746 ) ) ( not ( = ?auto_61743 ?auto_61746 ) ) ( not ( = ?auto_61744 ?auto_61746 ) ) ( not ( = ?auto_61745 ?auto_61746 ) ) ( not ( = ?auto_61747 ?auto_61746 ) ) ( ON ?auto_61745 ?auto_61747 ) ( CLEAR ?auto_61745 ) ( ON-TABLE ?auto_61746 ) ( HOLDING ?auto_61744 ) ( CLEAR ?auto_61743 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61741 ?auto_61742 ?auto_61743 ?auto_61744 )
      ( MAKE-5PILE ?auto_61741 ?auto_61742 ?auto_61743 ?auto_61744 ?auto_61745 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61748 - BLOCK
      ?auto_61749 - BLOCK
      ?auto_61750 - BLOCK
      ?auto_61751 - BLOCK
      ?auto_61752 - BLOCK
    )
    :vars
    (
      ?auto_61754 - BLOCK
      ?auto_61753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61748 ) ( ON ?auto_61749 ?auto_61748 ) ( ON ?auto_61750 ?auto_61749 ) ( not ( = ?auto_61748 ?auto_61749 ) ) ( not ( = ?auto_61748 ?auto_61750 ) ) ( not ( = ?auto_61748 ?auto_61751 ) ) ( not ( = ?auto_61748 ?auto_61752 ) ) ( not ( = ?auto_61748 ?auto_61754 ) ) ( not ( = ?auto_61749 ?auto_61750 ) ) ( not ( = ?auto_61749 ?auto_61751 ) ) ( not ( = ?auto_61749 ?auto_61752 ) ) ( not ( = ?auto_61749 ?auto_61754 ) ) ( not ( = ?auto_61750 ?auto_61751 ) ) ( not ( = ?auto_61750 ?auto_61752 ) ) ( not ( = ?auto_61750 ?auto_61754 ) ) ( not ( = ?auto_61751 ?auto_61752 ) ) ( not ( = ?auto_61751 ?auto_61754 ) ) ( not ( = ?auto_61752 ?auto_61754 ) ) ( ON ?auto_61754 ?auto_61753 ) ( not ( = ?auto_61748 ?auto_61753 ) ) ( not ( = ?auto_61749 ?auto_61753 ) ) ( not ( = ?auto_61750 ?auto_61753 ) ) ( not ( = ?auto_61751 ?auto_61753 ) ) ( not ( = ?auto_61752 ?auto_61753 ) ) ( not ( = ?auto_61754 ?auto_61753 ) ) ( ON ?auto_61752 ?auto_61754 ) ( ON-TABLE ?auto_61753 ) ( CLEAR ?auto_61750 ) ( ON ?auto_61751 ?auto_61752 ) ( CLEAR ?auto_61751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61753 ?auto_61754 ?auto_61752 )
      ( MAKE-5PILE ?auto_61748 ?auto_61749 ?auto_61750 ?auto_61751 ?auto_61752 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61755 - BLOCK
      ?auto_61756 - BLOCK
      ?auto_61757 - BLOCK
      ?auto_61758 - BLOCK
      ?auto_61759 - BLOCK
    )
    :vars
    (
      ?auto_61761 - BLOCK
      ?auto_61760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61755 ) ( ON ?auto_61756 ?auto_61755 ) ( not ( = ?auto_61755 ?auto_61756 ) ) ( not ( = ?auto_61755 ?auto_61757 ) ) ( not ( = ?auto_61755 ?auto_61758 ) ) ( not ( = ?auto_61755 ?auto_61759 ) ) ( not ( = ?auto_61755 ?auto_61761 ) ) ( not ( = ?auto_61756 ?auto_61757 ) ) ( not ( = ?auto_61756 ?auto_61758 ) ) ( not ( = ?auto_61756 ?auto_61759 ) ) ( not ( = ?auto_61756 ?auto_61761 ) ) ( not ( = ?auto_61757 ?auto_61758 ) ) ( not ( = ?auto_61757 ?auto_61759 ) ) ( not ( = ?auto_61757 ?auto_61761 ) ) ( not ( = ?auto_61758 ?auto_61759 ) ) ( not ( = ?auto_61758 ?auto_61761 ) ) ( not ( = ?auto_61759 ?auto_61761 ) ) ( ON ?auto_61761 ?auto_61760 ) ( not ( = ?auto_61755 ?auto_61760 ) ) ( not ( = ?auto_61756 ?auto_61760 ) ) ( not ( = ?auto_61757 ?auto_61760 ) ) ( not ( = ?auto_61758 ?auto_61760 ) ) ( not ( = ?auto_61759 ?auto_61760 ) ) ( not ( = ?auto_61761 ?auto_61760 ) ) ( ON ?auto_61759 ?auto_61761 ) ( ON-TABLE ?auto_61760 ) ( ON ?auto_61758 ?auto_61759 ) ( CLEAR ?auto_61758 ) ( HOLDING ?auto_61757 ) ( CLEAR ?auto_61756 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61755 ?auto_61756 ?auto_61757 )
      ( MAKE-5PILE ?auto_61755 ?auto_61756 ?auto_61757 ?auto_61758 ?auto_61759 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61762 - BLOCK
      ?auto_61763 - BLOCK
      ?auto_61764 - BLOCK
      ?auto_61765 - BLOCK
      ?auto_61766 - BLOCK
    )
    :vars
    (
      ?auto_61768 - BLOCK
      ?auto_61767 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61762 ) ( ON ?auto_61763 ?auto_61762 ) ( not ( = ?auto_61762 ?auto_61763 ) ) ( not ( = ?auto_61762 ?auto_61764 ) ) ( not ( = ?auto_61762 ?auto_61765 ) ) ( not ( = ?auto_61762 ?auto_61766 ) ) ( not ( = ?auto_61762 ?auto_61768 ) ) ( not ( = ?auto_61763 ?auto_61764 ) ) ( not ( = ?auto_61763 ?auto_61765 ) ) ( not ( = ?auto_61763 ?auto_61766 ) ) ( not ( = ?auto_61763 ?auto_61768 ) ) ( not ( = ?auto_61764 ?auto_61765 ) ) ( not ( = ?auto_61764 ?auto_61766 ) ) ( not ( = ?auto_61764 ?auto_61768 ) ) ( not ( = ?auto_61765 ?auto_61766 ) ) ( not ( = ?auto_61765 ?auto_61768 ) ) ( not ( = ?auto_61766 ?auto_61768 ) ) ( ON ?auto_61768 ?auto_61767 ) ( not ( = ?auto_61762 ?auto_61767 ) ) ( not ( = ?auto_61763 ?auto_61767 ) ) ( not ( = ?auto_61764 ?auto_61767 ) ) ( not ( = ?auto_61765 ?auto_61767 ) ) ( not ( = ?auto_61766 ?auto_61767 ) ) ( not ( = ?auto_61768 ?auto_61767 ) ) ( ON ?auto_61766 ?auto_61768 ) ( ON-TABLE ?auto_61767 ) ( ON ?auto_61765 ?auto_61766 ) ( CLEAR ?auto_61763 ) ( ON ?auto_61764 ?auto_61765 ) ( CLEAR ?auto_61764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61767 ?auto_61768 ?auto_61766 ?auto_61765 )
      ( MAKE-5PILE ?auto_61762 ?auto_61763 ?auto_61764 ?auto_61765 ?auto_61766 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61769 - BLOCK
      ?auto_61770 - BLOCK
      ?auto_61771 - BLOCK
      ?auto_61772 - BLOCK
      ?auto_61773 - BLOCK
    )
    :vars
    (
      ?auto_61775 - BLOCK
      ?auto_61774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61769 ) ( not ( = ?auto_61769 ?auto_61770 ) ) ( not ( = ?auto_61769 ?auto_61771 ) ) ( not ( = ?auto_61769 ?auto_61772 ) ) ( not ( = ?auto_61769 ?auto_61773 ) ) ( not ( = ?auto_61769 ?auto_61775 ) ) ( not ( = ?auto_61770 ?auto_61771 ) ) ( not ( = ?auto_61770 ?auto_61772 ) ) ( not ( = ?auto_61770 ?auto_61773 ) ) ( not ( = ?auto_61770 ?auto_61775 ) ) ( not ( = ?auto_61771 ?auto_61772 ) ) ( not ( = ?auto_61771 ?auto_61773 ) ) ( not ( = ?auto_61771 ?auto_61775 ) ) ( not ( = ?auto_61772 ?auto_61773 ) ) ( not ( = ?auto_61772 ?auto_61775 ) ) ( not ( = ?auto_61773 ?auto_61775 ) ) ( ON ?auto_61775 ?auto_61774 ) ( not ( = ?auto_61769 ?auto_61774 ) ) ( not ( = ?auto_61770 ?auto_61774 ) ) ( not ( = ?auto_61771 ?auto_61774 ) ) ( not ( = ?auto_61772 ?auto_61774 ) ) ( not ( = ?auto_61773 ?auto_61774 ) ) ( not ( = ?auto_61775 ?auto_61774 ) ) ( ON ?auto_61773 ?auto_61775 ) ( ON-TABLE ?auto_61774 ) ( ON ?auto_61772 ?auto_61773 ) ( ON ?auto_61771 ?auto_61772 ) ( CLEAR ?auto_61771 ) ( HOLDING ?auto_61770 ) ( CLEAR ?auto_61769 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61769 ?auto_61770 )
      ( MAKE-5PILE ?auto_61769 ?auto_61770 ?auto_61771 ?auto_61772 ?auto_61773 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61776 - BLOCK
      ?auto_61777 - BLOCK
      ?auto_61778 - BLOCK
      ?auto_61779 - BLOCK
      ?auto_61780 - BLOCK
    )
    :vars
    (
      ?auto_61782 - BLOCK
      ?auto_61781 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61776 ) ( not ( = ?auto_61776 ?auto_61777 ) ) ( not ( = ?auto_61776 ?auto_61778 ) ) ( not ( = ?auto_61776 ?auto_61779 ) ) ( not ( = ?auto_61776 ?auto_61780 ) ) ( not ( = ?auto_61776 ?auto_61782 ) ) ( not ( = ?auto_61777 ?auto_61778 ) ) ( not ( = ?auto_61777 ?auto_61779 ) ) ( not ( = ?auto_61777 ?auto_61780 ) ) ( not ( = ?auto_61777 ?auto_61782 ) ) ( not ( = ?auto_61778 ?auto_61779 ) ) ( not ( = ?auto_61778 ?auto_61780 ) ) ( not ( = ?auto_61778 ?auto_61782 ) ) ( not ( = ?auto_61779 ?auto_61780 ) ) ( not ( = ?auto_61779 ?auto_61782 ) ) ( not ( = ?auto_61780 ?auto_61782 ) ) ( ON ?auto_61782 ?auto_61781 ) ( not ( = ?auto_61776 ?auto_61781 ) ) ( not ( = ?auto_61777 ?auto_61781 ) ) ( not ( = ?auto_61778 ?auto_61781 ) ) ( not ( = ?auto_61779 ?auto_61781 ) ) ( not ( = ?auto_61780 ?auto_61781 ) ) ( not ( = ?auto_61782 ?auto_61781 ) ) ( ON ?auto_61780 ?auto_61782 ) ( ON-TABLE ?auto_61781 ) ( ON ?auto_61779 ?auto_61780 ) ( ON ?auto_61778 ?auto_61779 ) ( CLEAR ?auto_61776 ) ( ON ?auto_61777 ?auto_61778 ) ( CLEAR ?auto_61777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61781 ?auto_61782 ?auto_61780 ?auto_61779 ?auto_61778 )
      ( MAKE-5PILE ?auto_61776 ?auto_61777 ?auto_61778 ?auto_61779 ?auto_61780 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61783 - BLOCK
      ?auto_61784 - BLOCK
      ?auto_61785 - BLOCK
      ?auto_61786 - BLOCK
      ?auto_61787 - BLOCK
    )
    :vars
    (
      ?auto_61788 - BLOCK
      ?auto_61789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61783 ?auto_61784 ) ) ( not ( = ?auto_61783 ?auto_61785 ) ) ( not ( = ?auto_61783 ?auto_61786 ) ) ( not ( = ?auto_61783 ?auto_61787 ) ) ( not ( = ?auto_61783 ?auto_61788 ) ) ( not ( = ?auto_61784 ?auto_61785 ) ) ( not ( = ?auto_61784 ?auto_61786 ) ) ( not ( = ?auto_61784 ?auto_61787 ) ) ( not ( = ?auto_61784 ?auto_61788 ) ) ( not ( = ?auto_61785 ?auto_61786 ) ) ( not ( = ?auto_61785 ?auto_61787 ) ) ( not ( = ?auto_61785 ?auto_61788 ) ) ( not ( = ?auto_61786 ?auto_61787 ) ) ( not ( = ?auto_61786 ?auto_61788 ) ) ( not ( = ?auto_61787 ?auto_61788 ) ) ( ON ?auto_61788 ?auto_61789 ) ( not ( = ?auto_61783 ?auto_61789 ) ) ( not ( = ?auto_61784 ?auto_61789 ) ) ( not ( = ?auto_61785 ?auto_61789 ) ) ( not ( = ?auto_61786 ?auto_61789 ) ) ( not ( = ?auto_61787 ?auto_61789 ) ) ( not ( = ?auto_61788 ?auto_61789 ) ) ( ON ?auto_61787 ?auto_61788 ) ( ON-TABLE ?auto_61789 ) ( ON ?auto_61786 ?auto_61787 ) ( ON ?auto_61785 ?auto_61786 ) ( ON ?auto_61784 ?auto_61785 ) ( CLEAR ?auto_61784 ) ( HOLDING ?auto_61783 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61783 )
      ( MAKE-5PILE ?auto_61783 ?auto_61784 ?auto_61785 ?auto_61786 ?auto_61787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61790 - BLOCK
      ?auto_61791 - BLOCK
      ?auto_61792 - BLOCK
      ?auto_61793 - BLOCK
      ?auto_61794 - BLOCK
    )
    :vars
    (
      ?auto_61796 - BLOCK
      ?auto_61795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61790 ?auto_61791 ) ) ( not ( = ?auto_61790 ?auto_61792 ) ) ( not ( = ?auto_61790 ?auto_61793 ) ) ( not ( = ?auto_61790 ?auto_61794 ) ) ( not ( = ?auto_61790 ?auto_61796 ) ) ( not ( = ?auto_61791 ?auto_61792 ) ) ( not ( = ?auto_61791 ?auto_61793 ) ) ( not ( = ?auto_61791 ?auto_61794 ) ) ( not ( = ?auto_61791 ?auto_61796 ) ) ( not ( = ?auto_61792 ?auto_61793 ) ) ( not ( = ?auto_61792 ?auto_61794 ) ) ( not ( = ?auto_61792 ?auto_61796 ) ) ( not ( = ?auto_61793 ?auto_61794 ) ) ( not ( = ?auto_61793 ?auto_61796 ) ) ( not ( = ?auto_61794 ?auto_61796 ) ) ( ON ?auto_61796 ?auto_61795 ) ( not ( = ?auto_61790 ?auto_61795 ) ) ( not ( = ?auto_61791 ?auto_61795 ) ) ( not ( = ?auto_61792 ?auto_61795 ) ) ( not ( = ?auto_61793 ?auto_61795 ) ) ( not ( = ?auto_61794 ?auto_61795 ) ) ( not ( = ?auto_61796 ?auto_61795 ) ) ( ON ?auto_61794 ?auto_61796 ) ( ON-TABLE ?auto_61795 ) ( ON ?auto_61793 ?auto_61794 ) ( ON ?auto_61792 ?auto_61793 ) ( ON ?auto_61791 ?auto_61792 ) ( ON ?auto_61790 ?auto_61791 ) ( CLEAR ?auto_61790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61795 ?auto_61796 ?auto_61794 ?auto_61793 ?auto_61792 ?auto_61791 )
      ( MAKE-5PILE ?auto_61790 ?auto_61791 ?auto_61792 ?auto_61793 ?auto_61794 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61798 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61798 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_61798 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61799 - BLOCK
    )
    :vars
    (
      ?auto_61800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61799 ?auto_61800 ) ( CLEAR ?auto_61799 ) ( HAND-EMPTY ) ( not ( = ?auto_61799 ?auto_61800 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61799 ?auto_61800 )
      ( MAKE-1PILE ?auto_61799 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61801 - BLOCK
    )
    :vars
    (
      ?auto_61802 - BLOCK
      ?auto_61803 - BLOCK
      ?auto_61805 - BLOCK
      ?auto_61804 - BLOCK
      ?auto_61806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61801 ?auto_61802 ) ) ( HOLDING ?auto_61801 ) ( CLEAR ?auto_61802 ) ( ON-TABLE ?auto_61803 ) ( ON ?auto_61805 ?auto_61803 ) ( ON ?auto_61804 ?auto_61805 ) ( ON ?auto_61806 ?auto_61804 ) ( ON ?auto_61802 ?auto_61806 ) ( not ( = ?auto_61803 ?auto_61805 ) ) ( not ( = ?auto_61803 ?auto_61804 ) ) ( not ( = ?auto_61803 ?auto_61806 ) ) ( not ( = ?auto_61803 ?auto_61802 ) ) ( not ( = ?auto_61803 ?auto_61801 ) ) ( not ( = ?auto_61805 ?auto_61804 ) ) ( not ( = ?auto_61805 ?auto_61806 ) ) ( not ( = ?auto_61805 ?auto_61802 ) ) ( not ( = ?auto_61805 ?auto_61801 ) ) ( not ( = ?auto_61804 ?auto_61806 ) ) ( not ( = ?auto_61804 ?auto_61802 ) ) ( not ( = ?auto_61804 ?auto_61801 ) ) ( not ( = ?auto_61806 ?auto_61802 ) ) ( not ( = ?auto_61806 ?auto_61801 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61803 ?auto_61805 ?auto_61804 ?auto_61806 ?auto_61802 ?auto_61801 )
      ( MAKE-1PILE ?auto_61801 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61807 - BLOCK
    )
    :vars
    (
      ?auto_61811 - BLOCK
      ?auto_61812 - BLOCK
      ?auto_61810 - BLOCK
      ?auto_61808 - BLOCK
      ?auto_61809 - BLOCK
      ?auto_61813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61807 ?auto_61811 ) ) ( CLEAR ?auto_61811 ) ( ON-TABLE ?auto_61812 ) ( ON ?auto_61810 ?auto_61812 ) ( ON ?auto_61808 ?auto_61810 ) ( ON ?auto_61809 ?auto_61808 ) ( ON ?auto_61811 ?auto_61809 ) ( not ( = ?auto_61812 ?auto_61810 ) ) ( not ( = ?auto_61812 ?auto_61808 ) ) ( not ( = ?auto_61812 ?auto_61809 ) ) ( not ( = ?auto_61812 ?auto_61811 ) ) ( not ( = ?auto_61812 ?auto_61807 ) ) ( not ( = ?auto_61810 ?auto_61808 ) ) ( not ( = ?auto_61810 ?auto_61809 ) ) ( not ( = ?auto_61810 ?auto_61811 ) ) ( not ( = ?auto_61810 ?auto_61807 ) ) ( not ( = ?auto_61808 ?auto_61809 ) ) ( not ( = ?auto_61808 ?auto_61811 ) ) ( not ( = ?auto_61808 ?auto_61807 ) ) ( not ( = ?auto_61809 ?auto_61811 ) ) ( not ( = ?auto_61809 ?auto_61807 ) ) ( ON ?auto_61807 ?auto_61813 ) ( CLEAR ?auto_61807 ) ( HAND-EMPTY ) ( not ( = ?auto_61807 ?auto_61813 ) ) ( not ( = ?auto_61811 ?auto_61813 ) ) ( not ( = ?auto_61812 ?auto_61813 ) ) ( not ( = ?auto_61810 ?auto_61813 ) ) ( not ( = ?auto_61808 ?auto_61813 ) ) ( not ( = ?auto_61809 ?auto_61813 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61807 ?auto_61813 )
      ( MAKE-1PILE ?auto_61807 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61814 - BLOCK
    )
    :vars
    (
      ?auto_61816 - BLOCK
      ?auto_61820 - BLOCK
      ?auto_61819 - BLOCK
      ?auto_61817 - BLOCK
      ?auto_61818 - BLOCK
      ?auto_61815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61814 ?auto_61816 ) ) ( ON-TABLE ?auto_61820 ) ( ON ?auto_61819 ?auto_61820 ) ( ON ?auto_61817 ?auto_61819 ) ( ON ?auto_61818 ?auto_61817 ) ( not ( = ?auto_61820 ?auto_61819 ) ) ( not ( = ?auto_61820 ?auto_61817 ) ) ( not ( = ?auto_61820 ?auto_61818 ) ) ( not ( = ?auto_61820 ?auto_61816 ) ) ( not ( = ?auto_61820 ?auto_61814 ) ) ( not ( = ?auto_61819 ?auto_61817 ) ) ( not ( = ?auto_61819 ?auto_61818 ) ) ( not ( = ?auto_61819 ?auto_61816 ) ) ( not ( = ?auto_61819 ?auto_61814 ) ) ( not ( = ?auto_61817 ?auto_61818 ) ) ( not ( = ?auto_61817 ?auto_61816 ) ) ( not ( = ?auto_61817 ?auto_61814 ) ) ( not ( = ?auto_61818 ?auto_61816 ) ) ( not ( = ?auto_61818 ?auto_61814 ) ) ( ON ?auto_61814 ?auto_61815 ) ( CLEAR ?auto_61814 ) ( not ( = ?auto_61814 ?auto_61815 ) ) ( not ( = ?auto_61816 ?auto_61815 ) ) ( not ( = ?auto_61820 ?auto_61815 ) ) ( not ( = ?auto_61819 ?auto_61815 ) ) ( not ( = ?auto_61817 ?auto_61815 ) ) ( not ( = ?auto_61818 ?auto_61815 ) ) ( HOLDING ?auto_61816 ) ( CLEAR ?auto_61818 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61820 ?auto_61819 ?auto_61817 ?auto_61818 ?auto_61816 )
      ( MAKE-1PILE ?auto_61814 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61821 - BLOCK
    )
    :vars
    (
      ?auto_61823 - BLOCK
      ?auto_61826 - BLOCK
      ?auto_61824 - BLOCK
      ?auto_61822 - BLOCK
      ?auto_61827 - BLOCK
      ?auto_61825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61821 ?auto_61823 ) ) ( ON-TABLE ?auto_61826 ) ( ON ?auto_61824 ?auto_61826 ) ( ON ?auto_61822 ?auto_61824 ) ( ON ?auto_61827 ?auto_61822 ) ( not ( = ?auto_61826 ?auto_61824 ) ) ( not ( = ?auto_61826 ?auto_61822 ) ) ( not ( = ?auto_61826 ?auto_61827 ) ) ( not ( = ?auto_61826 ?auto_61823 ) ) ( not ( = ?auto_61826 ?auto_61821 ) ) ( not ( = ?auto_61824 ?auto_61822 ) ) ( not ( = ?auto_61824 ?auto_61827 ) ) ( not ( = ?auto_61824 ?auto_61823 ) ) ( not ( = ?auto_61824 ?auto_61821 ) ) ( not ( = ?auto_61822 ?auto_61827 ) ) ( not ( = ?auto_61822 ?auto_61823 ) ) ( not ( = ?auto_61822 ?auto_61821 ) ) ( not ( = ?auto_61827 ?auto_61823 ) ) ( not ( = ?auto_61827 ?auto_61821 ) ) ( ON ?auto_61821 ?auto_61825 ) ( not ( = ?auto_61821 ?auto_61825 ) ) ( not ( = ?auto_61823 ?auto_61825 ) ) ( not ( = ?auto_61826 ?auto_61825 ) ) ( not ( = ?auto_61824 ?auto_61825 ) ) ( not ( = ?auto_61822 ?auto_61825 ) ) ( not ( = ?auto_61827 ?auto_61825 ) ) ( CLEAR ?auto_61827 ) ( ON ?auto_61823 ?auto_61821 ) ( CLEAR ?auto_61823 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61825 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61825 ?auto_61821 )
      ( MAKE-1PILE ?auto_61821 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61828 - BLOCK
    )
    :vars
    (
      ?auto_61832 - BLOCK
      ?auto_61831 - BLOCK
      ?auto_61829 - BLOCK
      ?auto_61833 - BLOCK
      ?auto_61830 - BLOCK
      ?auto_61834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61828 ?auto_61832 ) ) ( ON-TABLE ?auto_61831 ) ( ON ?auto_61829 ?auto_61831 ) ( ON ?auto_61833 ?auto_61829 ) ( not ( = ?auto_61831 ?auto_61829 ) ) ( not ( = ?auto_61831 ?auto_61833 ) ) ( not ( = ?auto_61831 ?auto_61830 ) ) ( not ( = ?auto_61831 ?auto_61832 ) ) ( not ( = ?auto_61831 ?auto_61828 ) ) ( not ( = ?auto_61829 ?auto_61833 ) ) ( not ( = ?auto_61829 ?auto_61830 ) ) ( not ( = ?auto_61829 ?auto_61832 ) ) ( not ( = ?auto_61829 ?auto_61828 ) ) ( not ( = ?auto_61833 ?auto_61830 ) ) ( not ( = ?auto_61833 ?auto_61832 ) ) ( not ( = ?auto_61833 ?auto_61828 ) ) ( not ( = ?auto_61830 ?auto_61832 ) ) ( not ( = ?auto_61830 ?auto_61828 ) ) ( ON ?auto_61828 ?auto_61834 ) ( not ( = ?auto_61828 ?auto_61834 ) ) ( not ( = ?auto_61832 ?auto_61834 ) ) ( not ( = ?auto_61831 ?auto_61834 ) ) ( not ( = ?auto_61829 ?auto_61834 ) ) ( not ( = ?auto_61833 ?auto_61834 ) ) ( not ( = ?auto_61830 ?auto_61834 ) ) ( ON ?auto_61832 ?auto_61828 ) ( CLEAR ?auto_61832 ) ( ON-TABLE ?auto_61834 ) ( HOLDING ?auto_61830 ) ( CLEAR ?auto_61833 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61831 ?auto_61829 ?auto_61833 ?auto_61830 )
      ( MAKE-1PILE ?auto_61828 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61835 - BLOCK
    )
    :vars
    (
      ?auto_61840 - BLOCK
      ?auto_61841 - BLOCK
      ?auto_61839 - BLOCK
      ?auto_61837 - BLOCK
      ?auto_61838 - BLOCK
      ?auto_61836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61835 ?auto_61840 ) ) ( ON-TABLE ?auto_61841 ) ( ON ?auto_61839 ?auto_61841 ) ( ON ?auto_61837 ?auto_61839 ) ( not ( = ?auto_61841 ?auto_61839 ) ) ( not ( = ?auto_61841 ?auto_61837 ) ) ( not ( = ?auto_61841 ?auto_61838 ) ) ( not ( = ?auto_61841 ?auto_61840 ) ) ( not ( = ?auto_61841 ?auto_61835 ) ) ( not ( = ?auto_61839 ?auto_61837 ) ) ( not ( = ?auto_61839 ?auto_61838 ) ) ( not ( = ?auto_61839 ?auto_61840 ) ) ( not ( = ?auto_61839 ?auto_61835 ) ) ( not ( = ?auto_61837 ?auto_61838 ) ) ( not ( = ?auto_61837 ?auto_61840 ) ) ( not ( = ?auto_61837 ?auto_61835 ) ) ( not ( = ?auto_61838 ?auto_61840 ) ) ( not ( = ?auto_61838 ?auto_61835 ) ) ( ON ?auto_61835 ?auto_61836 ) ( not ( = ?auto_61835 ?auto_61836 ) ) ( not ( = ?auto_61840 ?auto_61836 ) ) ( not ( = ?auto_61841 ?auto_61836 ) ) ( not ( = ?auto_61839 ?auto_61836 ) ) ( not ( = ?auto_61837 ?auto_61836 ) ) ( not ( = ?auto_61838 ?auto_61836 ) ) ( ON ?auto_61840 ?auto_61835 ) ( ON-TABLE ?auto_61836 ) ( CLEAR ?auto_61837 ) ( ON ?auto_61838 ?auto_61840 ) ( CLEAR ?auto_61838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61836 ?auto_61835 ?auto_61840 )
      ( MAKE-1PILE ?auto_61835 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61842 - BLOCK
    )
    :vars
    (
      ?auto_61844 - BLOCK
      ?auto_61848 - BLOCK
      ?auto_61845 - BLOCK
      ?auto_61847 - BLOCK
      ?auto_61843 - BLOCK
      ?auto_61846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61842 ?auto_61844 ) ) ( ON-TABLE ?auto_61848 ) ( ON ?auto_61845 ?auto_61848 ) ( not ( = ?auto_61848 ?auto_61845 ) ) ( not ( = ?auto_61848 ?auto_61847 ) ) ( not ( = ?auto_61848 ?auto_61843 ) ) ( not ( = ?auto_61848 ?auto_61844 ) ) ( not ( = ?auto_61848 ?auto_61842 ) ) ( not ( = ?auto_61845 ?auto_61847 ) ) ( not ( = ?auto_61845 ?auto_61843 ) ) ( not ( = ?auto_61845 ?auto_61844 ) ) ( not ( = ?auto_61845 ?auto_61842 ) ) ( not ( = ?auto_61847 ?auto_61843 ) ) ( not ( = ?auto_61847 ?auto_61844 ) ) ( not ( = ?auto_61847 ?auto_61842 ) ) ( not ( = ?auto_61843 ?auto_61844 ) ) ( not ( = ?auto_61843 ?auto_61842 ) ) ( ON ?auto_61842 ?auto_61846 ) ( not ( = ?auto_61842 ?auto_61846 ) ) ( not ( = ?auto_61844 ?auto_61846 ) ) ( not ( = ?auto_61848 ?auto_61846 ) ) ( not ( = ?auto_61845 ?auto_61846 ) ) ( not ( = ?auto_61847 ?auto_61846 ) ) ( not ( = ?auto_61843 ?auto_61846 ) ) ( ON ?auto_61844 ?auto_61842 ) ( ON-TABLE ?auto_61846 ) ( ON ?auto_61843 ?auto_61844 ) ( CLEAR ?auto_61843 ) ( HOLDING ?auto_61847 ) ( CLEAR ?auto_61845 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61848 ?auto_61845 ?auto_61847 )
      ( MAKE-1PILE ?auto_61842 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61849 - BLOCK
    )
    :vars
    (
      ?auto_61853 - BLOCK
      ?auto_61854 - BLOCK
      ?auto_61851 - BLOCK
      ?auto_61852 - BLOCK
      ?auto_61850 - BLOCK
      ?auto_61855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61849 ?auto_61853 ) ) ( ON-TABLE ?auto_61854 ) ( ON ?auto_61851 ?auto_61854 ) ( not ( = ?auto_61854 ?auto_61851 ) ) ( not ( = ?auto_61854 ?auto_61852 ) ) ( not ( = ?auto_61854 ?auto_61850 ) ) ( not ( = ?auto_61854 ?auto_61853 ) ) ( not ( = ?auto_61854 ?auto_61849 ) ) ( not ( = ?auto_61851 ?auto_61852 ) ) ( not ( = ?auto_61851 ?auto_61850 ) ) ( not ( = ?auto_61851 ?auto_61853 ) ) ( not ( = ?auto_61851 ?auto_61849 ) ) ( not ( = ?auto_61852 ?auto_61850 ) ) ( not ( = ?auto_61852 ?auto_61853 ) ) ( not ( = ?auto_61852 ?auto_61849 ) ) ( not ( = ?auto_61850 ?auto_61853 ) ) ( not ( = ?auto_61850 ?auto_61849 ) ) ( ON ?auto_61849 ?auto_61855 ) ( not ( = ?auto_61849 ?auto_61855 ) ) ( not ( = ?auto_61853 ?auto_61855 ) ) ( not ( = ?auto_61854 ?auto_61855 ) ) ( not ( = ?auto_61851 ?auto_61855 ) ) ( not ( = ?auto_61852 ?auto_61855 ) ) ( not ( = ?auto_61850 ?auto_61855 ) ) ( ON ?auto_61853 ?auto_61849 ) ( ON-TABLE ?auto_61855 ) ( ON ?auto_61850 ?auto_61853 ) ( CLEAR ?auto_61851 ) ( ON ?auto_61852 ?auto_61850 ) ( CLEAR ?auto_61852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61855 ?auto_61849 ?auto_61853 ?auto_61850 )
      ( MAKE-1PILE ?auto_61849 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61856 - BLOCK
    )
    :vars
    (
      ?auto_61859 - BLOCK
      ?auto_61861 - BLOCK
      ?auto_61862 - BLOCK
      ?auto_61857 - BLOCK
      ?auto_61860 - BLOCK
      ?auto_61858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61856 ?auto_61859 ) ) ( ON-TABLE ?auto_61861 ) ( not ( = ?auto_61861 ?auto_61862 ) ) ( not ( = ?auto_61861 ?auto_61857 ) ) ( not ( = ?auto_61861 ?auto_61860 ) ) ( not ( = ?auto_61861 ?auto_61859 ) ) ( not ( = ?auto_61861 ?auto_61856 ) ) ( not ( = ?auto_61862 ?auto_61857 ) ) ( not ( = ?auto_61862 ?auto_61860 ) ) ( not ( = ?auto_61862 ?auto_61859 ) ) ( not ( = ?auto_61862 ?auto_61856 ) ) ( not ( = ?auto_61857 ?auto_61860 ) ) ( not ( = ?auto_61857 ?auto_61859 ) ) ( not ( = ?auto_61857 ?auto_61856 ) ) ( not ( = ?auto_61860 ?auto_61859 ) ) ( not ( = ?auto_61860 ?auto_61856 ) ) ( ON ?auto_61856 ?auto_61858 ) ( not ( = ?auto_61856 ?auto_61858 ) ) ( not ( = ?auto_61859 ?auto_61858 ) ) ( not ( = ?auto_61861 ?auto_61858 ) ) ( not ( = ?auto_61862 ?auto_61858 ) ) ( not ( = ?auto_61857 ?auto_61858 ) ) ( not ( = ?auto_61860 ?auto_61858 ) ) ( ON ?auto_61859 ?auto_61856 ) ( ON-TABLE ?auto_61858 ) ( ON ?auto_61860 ?auto_61859 ) ( ON ?auto_61857 ?auto_61860 ) ( CLEAR ?auto_61857 ) ( HOLDING ?auto_61862 ) ( CLEAR ?auto_61861 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61861 ?auto_61862 )
      ( MAKE-1PILE ?auto_61856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61863 - BLOCK
    )
    :vars
    (
      ?auto_61866 - BLOCK
      ?auto_61867 - BLOCK
      ?auto_61869 - BLOCK
      ?auto_61864 - BLOCK
      ?auto_61868 - BLOCK
      ?auto_61865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61863 ?auto_61866 ) ) ( ON-TABLE ?auto_61867 ) ( not ( = ?auto_61867 ?auto_61869 ) ) ( not ( = ?auto_61867 ?auto_61864 ) ) ( not ( = ?auto_61867 ?auto_61868 ) ) ( not ( = ?auto_61867 ?auto_61866 ) ) ( not ( = ?auto_61867 ?auto_61863 ) ) ( not ( = ?auto_61869 ?auto_61864 ) ) ( not ( = ?auto_61869 ?auto_61868 ) ) ( not ( = ?auto_61869 ?auto_61866 ) ) ( not ( = ?auto_61869 ?auto_61863 ) ) ( not ( = ?auto_61864 ?auto_61868 ) ) ( not ( = ?auto_61864 ?auto_61866 ) ) ( not ( = ?auto_61864 ?auto_61863 ) ) ( not ( = ?auto_61868 ?auto_61866 ) ) ( not ( = ?auto_61868 ?auto_61863 ) ) ( ON ?auto_61863 ?auto_61865 ) ( not ( = ?auto_61863 ?auto_61865 ) ) ( not ( = ?auto_61866 ?auto_61865 ) ) ( not ( = ?auto_61867 ?auto_61865 ) ) ( not ( = ?auto_61869 ?auto_61865 ) ) ( not ( = ?auto_61864 ?auto_61865 ) ) ( not ( = ?auto_61868 ?auto_61865 ) ) ( ON ?auto_61866 ?auto_61863 ) ( ON-TABLE ?auto_61865 ) ( ON ?auto_61868 ?auto_61866 ) ( ON ?auto_61864 ?auto_61868 ) ( CLEAR ?auto_61867 ) ( ON ?auto_61869 ?auto_61864 ) ( CLEAR ?auto_61869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61865 ?auto_61863 ?auto_61866 ?auto_61868 ?auto_61864 )
      ( MAKE-1PILE ?auto_61863 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61870 - BLOCK
    )
    :vars
    (
      ?auto_61875 - BLOCK
      ?auto_61871 - BLOCK
      ?auto_61872 - BLOCK
      ?auto_61874 - BLOCK
      ?auto_61876 - BLOCK
      ?auto_61873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61870 ?auto_61875 ) ) ( not ( = ?auto_61871 ?auto_61872 ) ) ( not ( = ?auto_61871 ?auto_61874 ) ) ( not ( = ?auto_61871 ?auto_61876 ) ) ( not ( = ?auto_61871 ?auto_61875 ) ) ( not ( = ?auto_61871 ?auto_61870 ) ) ( not ( = ?auto_61872 ?auto_61874 ) ) ( not ( = ?auto_61872 ?auto_61876 ) ) ( not ( = ?auto_61872 ?auto_61875 ) ) ( not ( = ?auto_61872 ?auto_61870 ) ) ( not ( = ?auto_61874 ?auto_61876 ) ) ( not ( = ?auto_61874 ?auto_61875 ) ) ( not ( = ?auto_61874 ?auto_61870 ) ) ( not ( = ?auto_61876 ?auto_61875 ) ) ( not ( = ?auto_61876 ?auto_61870 ) ) ( ON ?auto_61870 ?auto_61873 ) ( not ( = ?auto_61870 ?auto_61873 ) ) ( not ( = ?auto_61875 ?auto_61873 ) ) ( not ( = ?auto_61871 ?auto_61873 ) ) ( not ( = ?auto_61872 ?auto_61873 ) ) ( not ( = ?auto_61874 ?auto_61873 ) ) ( not ( = ?auto_61876 ?auto_61873 ) ) ( ON ?auto_61875 ?auto_61870 ) ( ON-TABLE ?auto_61873 ) ( ON ?auto_61876 ?auto_61875 ) ( ON ?auto_61874 ?auto_61876 ) ( ON ?auto_61872 ?auto_61874 ) ( CLEAR ?auto_61872 ) ( HOLDING ?auto_61871 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61871 )
      ( MAKE-1PILE ?auto_61870 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61877 - BLOCK
    )
    :vars
    (
      ?auto_61881 - BLOCK
      ?auto_61882 - BLOCK
      ?auto_61878 - BLOCK
      ?auto_61883 - BLOCK
      ?auto_61879 - BLOCK
      ?auto_61880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61877 ?auto_61881 ) ) ( not ( = ?auto_61882 ?auto_61878 ) ) ( not ( = ?auto_61882 ?auto_61883 ) ) ( not ( = ?auto_61882 ?auto_61879 ) ) ( not ( = ?auto_61882 ?auto_61881 ) ) ( not ( = ?auto_61882 ?auto_61877 ) ) ( not ( = ?auto_61878 ?auto_61883 ) ) ( not ( = ?auto_61878 ?auto_61879 ) ) ( not ( = ?auto_61878 ?auto_61881 ) ) ( not ( = ?auto_61878 ?auto_61877 ) ) ( not ( = ?auto_61883 ?auto_61879 ) ) ( not ( = ?auto_61883 ?auto_61881 ) ) ( not ( = ?auto_61883 ?auto_61877 ) ) ( not ( = ?auto_61879 ?auto_61881 ) ) ( not ( = ?auto_61879 ?auto_61877 ) ) ( ON ?auto_61877 ?auto_61880 ) ( not ( = ?auto_61877 ?auto_61880 ) ) ( not ( = ?auto_61881 ?auto_61880 ) ) ( not ( = ?auto_61882 ?auto_61880 ) ) ( not ( = ?auto_61878 ?auto_61880 ) ) ( not ( = ?auto_61883 ?auto_61880 ) ) ( not ( = ?auto_61879 ?auto_61880 ) ) ( ON ?auto_61881 ?auto_61877 ) ( ON-TABLE ?auto_61880 ) ( ON ?auto_61879 ?auto_61881 ) ( ON ?auto_61883 ?auto_61879 ) ( ON ?auto_61878 ?auto_61883 ) ( ON ?auto_61882 ?auto_61878 ) ( CLEAR ?auto_61882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61880 ?auto_61877 ?auto_61881 ?auto_61879 ?auto_61883 ?auto_61878 )
      ( MAKE-1PILE ?auto_61877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61888 - BLOCK
      ?auto_61889 - BLOCK
      ?auto_61890 - BLOCK
      ?auto_61891 - BLOCK
    )
    :vars
    (
      ?auto_61892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61892 ?auto_61891 ) ( CLEAR ?auto_61892 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61888 ) ( ON ?auto_61889 ?auto_61888 ) ( ON ?auto_61890 ?auto_61889 ) ( ON ?auto_61891 ?auto_61890 ) ( not ( = ?auto_61888 ?auto_61889 ) ) ( not ( = ?auto_61888 ?auto_61890 ) ) ( not ( = ?auto_61888 ?auto_61891 ) ) ( not ( = ?auto_61888 ?auto_61892 ) ) ( not ( = ?auto_61889 ?auto_61890 ) ) ( not ( = ?auto_61889 ?auto_61891 ) ) ( not ( = ?auto_61889 ?auto_61892 ) ) ( not ( = ?auto_61890 ?auto_61891 ) ) ( not ( = ?auto_61890 ?auto_61892 ) ) ( not ( = ?auto_61891 ?auto_61892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61892 ?auto_61891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61893 - BLOCK
      ?auto_61894 - BLOCK
      ?auto_61895 - BLOCK
      ?auto_61896 - BLOCK
    )
    :vars
    (
      ?auto_61897 - BLOCK
      ?auto_61898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61897 ?auto_61896 ) ( CLEAR ?auto_61897 ) ( ON-TABLE ?auto_61893 ) ( ON ?auto_61894 ?auto_61893 ) ( ON ?auto_61895 ?auto_61894 ) ( ON ?auto_61896 ?auto_61895 ) ( not ( = ?auto_61893 ?auto_61894 ) ) ( not ( = ?auto_61893 ?auto_61895 ) ) ( not ( = ?auto_61893 ?auto_61896 ) ) ( not ( = ?auto_61893 ?auto_61897 ) ) ( not ( = ?auto_61894 ?auto_61895 ) ) ( not ( = ?auto_61894 ?auto_61896 ) ) ( not ( = ?auto_61894 ?auto_61897 ) ) ( not ( = ?auto_61895 ?auto_61896 ) ) ( not ( = ?auto_61895 ?auto_61897 ) ) ( not ( = ?auto_61896 ?auto_61897 ) ) ( HOLDING ?auto_61898 ) ( not ( = ?auto_61893 ?auto_61898 ) ) ( not ( = ?auto_61894 ?auto_61898 ) ) ( not ( = ?auto_61895 ?auto_61898 ) ) ( not ( = ?auto_61896 ?auto_61898 ) ) ( not ( = ?auto_61897 ?auto_61898 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_61898 )
      ( MAKE-4PILE ?auto_61893 ?auto_61894 ?auto_61895 ?auto_61896 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61899 - BLOCK
      ?auto_61900 - BLOCK
      ?auto_61901 - BLOCK
      ?auto_61902 - BLOCK
    )
    :vars
    (
      ?auto_61903 - BLOCK
      ?auto_61904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61903 ?auto_61902 ) ( ON-TABLE ?auto_61899 ) ( ON ?auto_61900 ?auto_61899 ) ( ON ?auto_61901 ?auto_61900 ) ( ON ?auto_61902 ?auto_61901 ) ( not ( = ?auto_61899 ?auto_61900 ) ) ( not ( = ?auto_61899 ?auto_61901 ) ) ( not ( = ?auto_61899 ?auto_61902 ) ) ( not ( = ?auto_61899 ?auto_61903 ) ) ( not ( = ?auto_61900 ?auto_61901 ) ) ( not ( = ?auto_61900 ?auto_61902 ) ) ( not ( = ?auto_61900 ?auto_61903 ) ) ( not ( = ?auto_61901 ?auto_61902 ) ) ( not ( = ?auto_61901 ?auto_61903 ) ) ( not ( = ?auto_61902 ?auto_61903 ) ) ( not ( = ?auto_61899 ?auto_61904 ) ) ( not ( = ?auto_61900 ?auto_61904 ) ) ( not ( = ?auto_61901 ?auto_61904 ) ) ( not ( = ?auto_61902 ?auto_61904 ) ) ( not ( = ?auto_61903 ?auto_61904 ) ) ( ON ?auto_61904 ?auto_61903 ) ( CLEAR ?auto_61904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61899 ?auto_61900 ?auto_61901 ?auto_61902 ?auto_61903 )
      ( MAKE-4PILE ?auto_61899 ?auto_61900 ?auto_61901 ?auto_61902 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61905 - BLOCK
      ?auto_61906 - BLOCK
      ?auto_61907 - BLOCK
      ?auto_61908 - BLOCK
    )
    :vars
    (
      ?auto_61910 - BLOCK
      ?auto_61909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61910 ?auto_61908 ) ( ON-TABLE ?auto_61905 ) ( ON ?auto_61906 ?auto_61905 ) ( ON ?auto_61907 ?auto_61906 ) ( ON ?auto_61908 ?auto_61907 ) ( not ( = ?auto_61905 ?auto_61906 ) ) ( not ( = ?auto_61905 ?auto_61907 ) ) ( not ( = ?auto_61905 ?auto_61908 ) ) ( not ( = ?auto_61905 ?auto_61910 ) ) ( not ( = ?auto_61906 ?auto_61907 ) ) ( not ( = ?auto_61906 ?auto_61908 ) ) ( not ( = ?auto_61906 ?auto_61910 ) ) ( not ( = ?auto_61907 ?auto_61908 ) ) ( not ( = ?auto_61907 ?auto_61910 ) ) ( not ( = ?auto_61908 ?auto_61910 ) ) ( not ( = ?auto_61905 ?auto_61909 ) ) ( not ( = ?auto_61906 ?auto_61909 ) ) ( not ( = ?auto_61907 ?auto_61909 ) ) ( not ( = ?auto_61908 ?auto_61909 ) ) ( not ( = ?auto_61910 ?auto_61909 ) ) ( HOLDING ?auto_61909 ) ( CLEAR ?auto_61910 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61905 ?auto_61906 ?auto_61907 ?auto_61908 ?auto_61910 ?auto_61909 )
      ( MAKE-4PILE ?auto_61905 ?auto_61906 ?auto_61907 ?auto_61908 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61911 - BLOCK
      ?auto_61912 - BLOCK
      ?auto_61913 - BLOCK
      ?auto_61914 - BLOCK
    )
    :vars
    (
      ?auto_61916 - BLOCK
      ?auto_61915 - BLOCK
      ?auto_61917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61916 ?auto_61914 ) ( ON-TABLE ?auto_61911 ) ( ON ?auto_61912 ?auto_61911 ) ( ON ?auto_61913 ?auto_61912 ) ( ON ?auto_61914 ?auto_61913 ) ( not ( = ?auto_61911 ?auto_61912 ) ) ( not ( = ?auto_61911 ?auto_61913 ) ) ( not ( = ?auto_61911 ?auto_61914 ) ) ( not ( = ?auto_61911 ?auto_61916 ) ) ( not ( = ?auto_61912 ?auto_61913 ) ) ( not ( = ?auto_61912 ?auto_61914 ) ) ( not ( = ?auto_61912 ?auto_61916 ) ) ( not ( = ?auto_61913 ?auto_61914 ) ) ( not ( = ?auto_61913 ?auto_61916 ) ) ( not ( = ?auto_61914 ?auto_61916 ) ) ( not ( = ?auto_61911 ?auto_61915 ) ) ( not ( = ?auto_61912 ?auto_61915 ) ) ( not ( = ?auto_61913 ?auto_61915 ) ) ( not ( = ?auto_61914 ?auto_61915 ) ) ( not ( = ?auto_61916 ?auto_61915 ) ) ( CLEAR ?auto_61916 ) ( ON ?auto_61915 ?auto_61917 ) ( CLEAR ?auto_61915 ) ( HAND-EMPTY ) ( not ( = ?auto_61911 ?auto_61917 ) ) ( not ( = ?auto_61912 ?auto_61917 ) ) ( not ( = ?auto_61913 ?auto_61917 ) ) ( not ( = ?auto_61914 ?auto_61917 ) ) ( not ( = ?auto_61916 ?auto_61917 ) ) ( not ( = ?auto_61915 ?auto_61917 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61915 ?auto_61917 )
      ( MAKE-4PILE ?auto_61911 ?auto_61912 ?auto_61913 ?auto_61914 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61932 - BLOCK
      ?auto_61933 - BLOCK
      ?auto_61934 - BLOCK
      ?auto_61935 - BLOCK
    )
    :vars
    (
      ?auto_61937 - BLOCK
      ?auto_61938 - BLOCK
      ?auto_61936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61932 ) ( ON ?auto_61933 ?auto_61932 ) ( ON ?auto_61934 ?auto_61933 ) ( not ( = ?auto_61932 ?auto_61933 ) ) ( not ( = ?auto_61932 ?auto_61934 ) ) ( not ( = ?auto_61932 ?auto_61935 ) ) ( not ( = ?auto_61932 ?auto_61937 ) ) ( not ( = ?auto_61933 ?auto_61934 ) ) ( not ( = ?auto_61933 ?auto_61935 ) ) ( not ( = ?auto_61933 ?auto_61937 ) ) ( not ( = ?auto_61934 ?auto_61935 ) ) ( not ( = ?auto_61934 ?auto_61937 ) ) ( not ( = ?auto_61935 ?auto_61937 ) ) ( not ( = ?auto_61932 ?auto_61938 ) ) ( not ( = ?auto_61933 ?auto_61938 ) ) ( not ( = ?auto_61934 ?auto_61938 ) ) ( not ( = ?auto_61935 ?auto_61938 ) ) ( not ( = ?auto_61937 ?auto_61938 ) ) ( ON ?auto_61938 ?auto_61936 ) ( not ( = ?auto_61932 ?auto_61936 ) ) ( not ( = ?auto_61933 ?auto_61936 ) ) ( not ( = ?auto_61934 ?auto_61936 ) ) ( not ( = ?auto_61935 ?auto_61936 ) ) ( not ( = ?auto_61937 ?auto_61936 ) ) ( not ( = ?auto_61938 ?auto_61936 ) ) ( ON ?auto_61937 ?auto_61938 ) ( CLEAR ?auto_61937 ) ( HOLDING ?auto_61935 ) ( CLEAR ?auto_61934 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61932 ?auto_61933 ?auto_61934 ?auto_61935 ?auto_61937 )
      ( MAKE-4PILE ?auto_61932 ?auto_61933 ?auto_61934 ?auto_61935 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61939 - BLOCK
      ?auto_61940 - BLOCK
      ?auto_61941 - BLOCK
      ?auto_61942 - BLOCK
    )
    :vars
    (
      ?auto_61944 - BLOCK
      ?auto_61943 - BLOCK
      ?auto_61945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61939 ) ( ON ?auto_61940 ?auto_61939 ) ( ON ?auto_61941 ?auto_61940 ) ( not ( = ?auto_61939 ?auto_61940 ) ) ( not ( = ?auto_61939 ?auto_61941 ) ) ( not ( = ?auto_61939 ?auto_61942 ) ) ( not ( = ?auto_61939 ?auto_61944 ) ) ( not ( = ?auto_61940 ?auto_61941 ) ) ( not ( = ?auto_61940 ?auto_61942 ) ) ( not ( = ?auto_61940 ?auto_61944 ) ) ( not ( = ?auto_61941 ?auto_61942 ) ) ( not ( = ?auto_61941 ?auto_61944 ) ) ( not ( = ?auto_61942 ?auto_61944 ) ) ( not ( = ?auto_61939 ?auto_61943 ) ) ( not ( = ?auto_61940 ?auto_61943 ) ) ( not ( = ?auto_61941 ?auto_61943 ) ) ( not ( = ?auto_61942 ?auto_61943 ) ) ( not ( = ?auto_61944 ?auto_61943 ) ) ( ON ?auto_61943 ?auto_61945 ) ( not ( = ?auto_61939 ?auto_61945 ) ) ( not ( = ?auto_61940 ?auto_61945 ) ) ( not ( = ?auto_61941 ?auto_61945 ) ) ( not ( = ?auto_61942 ?auto_61945 ) ) ( not ( = ?auto_61944 ?auto_61945 ) ) ( not ( = ?auto_61943 ?auto_61945 ) ) ( ON ?auto_61944 ?auto_61943 ) ( CLEAR ?auto_61941 ) ( ON ?auto_61942 ?auto_61944 ) ( CLEAR ?auto_61942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61945 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61945 ?auto_61943 ?auto_61944 )
      ( MAKE-4PILE ?auto_61939 ?auto_61940 ?auto_61941 ?auto_61942 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61946 - BLOCK
      ?auto_61947 - BLOCK
      ?auto_61948 - BLOCK
      ?auto_61949 - BLOCK
    )
    :vars
    (
      ?auto_61952 - BLOCK
      ?auto_61951 - BLOCK
      ?auto_61950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61946 ) ( ON ?auto_61947 ?auto_61946 ) ( not ( = ?auto_61946 ?auto_61947 ) ) ( not ( = ?auto_61946 ?auto_61948 ) ) ( not ( = ?auto_61946 ?auto_61949 ) ) ( not ( = ?auto_61946 ?auto_61952 ) ) ( not ( = ?auto_61947 ?auto_61948 ) ) ( not ( = ?auto_61947 ?auto_61949 ) ) ( not ( = ?auto_61947 ?auto_61952 ) ) ( not ( = ?auto_61948 ?auto_61949 ) ) ( not ( = ?auto_61948 ?auto_61952 ) ) ( not ( = ?auto_61949 ?auto_61952 ) ) ( not ( = ?auto_61946 ?auto_61951 ) ) ( not ( = ?auto_61947 ?auto_61951 ) ) ( not ( = ?auto_61948 ?auto_61951 ) ) ( not ( = ?auto_61949 ?auto_61951 ) ) ( not ( = ?auto_61952 ?auto_61951 ) ) ( ON ?auto_61951 ?auto_61950 ) ( not ( = ?auto_61946 ?auto_61950 ) ) ( not ( = ?auto_61947 ?auto_61950 ) ) ( not ( = ?auto_61948 ?auto_61950 ) ) ( not ( = ?auto_61949 ?auto_61950 ) ) ( not ( = ?auto_61952 ?auto_61950 ) ) ( not ( = ?auto_61951 ?auto_61950 ) ) ( ON ?auto_61952 ?auto_61951 ) ( ON ?auto_61949 ?auto_61952 ) ( CLEAR ?auto_61949 ) ( ON-TABLE ?auto_61950 ) ( HOLDING ?auto_61948 ) ( CLEAR ?auto_61947 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61946 ?auto_61947 ?auto_61948 )
      ( MAKE-4PILE ?auto_61946 ?auto_61947 ?auto_61948 ?auto_61949 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61953 - BLOCK
      ?auto_61954 - BLOCK
      ?auto_61955 - BLOCK
      ?auto_61956 - BLOCK
    )
    :vars
    (
      ?auto_61959 - BLOCK
      ?auto_61958 - BLOCK
      ?auto_61957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61953 ) ( ON ?auto_61954 ?auto_61953 ) ( not ( = ?auto_61953 ?auto_61954 ) ) ( not ( = ?auto_61953 ?auto_61955 ) ) ( not ( = ?auto_61953 ?auto_61956 ) ) ( not ( = ?auto_61953 ?auto_61959 ) ) ( not ( = ?auto_61954 ?auto_61955 ) ) ( not ( = ?auto_61954 ?auto_61956 ) ) ( not ( = ?auto_61954 ?auto_61959 ) ) ( not ( = ?auto_61955 ?auto_61956 ) ) ( not ( = ?auto_61955 ?auto_61959 ) ) ( not ( = ?auto_61956 ?auto_61959 ) ) ( not ( = ?auto_61953 ?auto_61958 ) ) ( not ( = ?auto_61954 ?auto_61958 ) ) ( not ( = ?auto_61955 ?auto_61958 ) ) ( not ( = ?auto_61956 ?auto_61958 ) ) ( not ( = ?auto_61959 ?auto_61958 ) ) ( ON ?auto_61958 ?auto_61957 ) ( not ( = ?auto_61953 ?auto_61957 ) ) ( not ( = ?auto_61954 ?auto_61957 ) ) ( not ( = ?auto_61955 ?auto_61957 ) ) ( not ( = ?auto_61956 ?auto_61957 ) ) ( not ( = ?auto_61959 ?auto_61957 ) ) ( not ( = ?auto_61958 ?auto_61957 ) ) ( ON ?auto_61959 ?auto_61958 ) ( ON ?auto_61956 ?auto_61959 ) ( ON-TABLE ?auto_61957 ) ( CLEAR ?auto_61954 ) ( ON ?auto_61955 ?auto_61956 ) ( CLEAR ?auto_61955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61957 ?auto_61958 ?auto_61959 ?auto_61956 )
      ( MAKE-4PILE ?auto_61953 ?auto_61954 ?auto_61955 ?auto_61956 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61960 - BLOCK
      ?auto_61961 - BLOCK
      ?auto_61962 - BLOCK
      ?auto_61963 - BLOCK
    )
    :vars
    (
      ?auto_61965 - BLOCK
      ?auto_61966 - BLOCK
      ?auto_61964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61960 ) ( not ( = ?auto_61960 ?auto_61961 ) ) ( not ( = ?auto_61960 ?auto_61962 ) ) ( not ( = ?auto_61960 ?auto_61963 ) ) ( not ( = ?auto_61960 ?auto_61965 ) ) ( not ( = ?auto_61961 ?auto_61962 ) ) ( not ( = ?auto_61961 ?auto_61963 ) ) ( not ( = ?auto_61961 ?auto_61965 ) ) ( not ( = ?auto_61962 ?auto_61963 ) ) ( not ( = ?auto_61962 ?auto_61965 ) ) ( not ( = ?auto_61963 ?auto_61965 ) ) ( not ( = ?auto_61960 ?auto_61966 ) ) ( not ( = ?auto_61961 ?auto_61966 ) ) ( not ( = ?auto_61962 ?auto_61966 ) ) ( not ( = ?auto_61963 ?auto_61966 ) ) ( not ( = ?auto_61965 ?auto_61966 ) ) ( ON ?auto_61966 ?auto_61964 ) ( not ( = ?auto_61960 ?auto_61964 ) ) ( not ( = ?auto_61961 ?auto_61964 ) ) ( not ( = ?auto_61962 ?auto_61964 ) ) ( not ( = ?auto_61963 ?auto_61964 ) ) ( not ( = ?auto_61965 ?auto_61964 ) ) ( not ( = ?auto_61966 ?auto_61964 ) ) ( ON ?auto_61965 ?auto_61966 ) ( ON ?auto_61963 ?auto_61965 ) ( ON-TABLE ?auto_61964 ) ( ON ?auto_61962 ?auto_61963 ) ( CLEAR ?auto_61962 ) ( HOLDING ?auto_61961 ) ( CLEAR ?auto_61960 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61960 ?auto_61961 )
      ( MAKE-4PILE ?auto_61960 ?auto_61961 ?auto_61962 ?auto_61963 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61967 - BLOCK
      ?auto_61968 - BLOCK
      ?auto_61969 - BLOCK
      ?auto_61970 - BLOCK
    )
    :vars
    (
      ?auto_61971 - BLOCK
      ?auto_61973 - BLOCK
      ?auto_61972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61967 ) ( not ( = ?auto_61967 ?auto_61968 ) ) ( not ( = ?auto_61967 ?auto_61969 ) ) ( not ( = ?auto_61967 ?auto_61970 ) ) ( not ( = ?auto_61967 ?auto_61971 ) ) ( not ( = ?auto_61968 ?auto_61969 ) ) ( not ( = ?auto_61968 ?auto_61970 ) ) ( not ( = ?auto_61968 ?auto_61971 ) ) ( not ( = ?auto_61969 ?auto_61970 ) ) ( not ( = ?auto_61969 ?auto_61971 ) ) ( not ( = ?auto_61970 ?auto_61971 ) ) ( not ( = ?auto_61967 ?auto_61973 ) ) ( not ( = ?auto_61968 ?auto_61973 ) ) ( not ( = ?auto_61969 ?auto_61973 ) ) ( not ( = ?auto_61970 ?auto_61973 ) ) ( not ( = ?auto_61971 ?auto_61973 ) ) ( ON ?auto_61973 ?auto_61972 ) ( not ( = ?auto_61967 ?auto_61972 ) ) ( not ( = ?auto_61968 ?auto_61972 ) ) ( not ( = ?auto_61969 ?auto_61972 ) ) ( not ( = ?auto_61970 ?auto_61972 ) ) ( not ( = ?auto_61971 ?auto_61972 ) ) ( not ( = ?auto_61973 ?auto_61972 ) ) ( ON ?auto_61971 ?auto_61973 ) ( ON ?auto_61970 ?auto_61971 ) ( ON-TABLE ?auto_61972 ) ( ON ?auto_61969 ?auto_61970 ) ( CLEAR ?auto_61967 ) ( ON ?auto_61968 ?auto_61969 ) ( CLEAR ?auto_61968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61972 ?auto_61973 ?auto_61971 ?auto_61970 ?auto_61969 )
      ( MAKE-4PILE ?auto_61967 ?auto_61968 ?auto_61969 ?auto_61970 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61974 - BLOCK
      ?auto_61975 - BLOCK
      ?auto_61976 - BLOCK
      ?auto_61977 - BLOCK
    )
    :vars
    (
      ?auto_61979 - BLOCK
      ?auto_61978 - BLOCK
      ?auto_61980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61974 ?auto_61975 ) ) ( not ( = ?auto_61974 ?auto_61976 ) ) ( not ( = ?auto_61974 ?auto_61977 ) ) ( not ( = ?auto_61974 ?auto_61979 ) ) ( not ( = ?auto_61975 ?auto_61976 ) ) ( not ( = ?auto_61975 ?auto_61977 ) ) ( not ( = ?auto_61975 ?auto_61979 ) ) ( not ( = ?auto_61976 ?auto_61977 ) ) ( not ( = ?auto_61976 ?auto_61979 ) ) ( not ( = ?auto_61977 ?auto_61979 ) ) ( not ( = ?auto_61974 ?auto_61978 ) ) ( not ( = ?auto_61975 ?auto_61978 ) ) ( not ( = ?auto_61976 ?auto_61978 ) ) ( not ( = ?auto_61977 ?auto_61978 ) ) ( not ( = ?auto_61979 ?auto_61978 ) ) ( ON ?auto_61978 ?auto_61980 ) ( not ( = ?auto_61974 ?auto_61980 ) ) ( not ( = ?auto_61975 ?auto_61980 ) ) ( not ( = ?auto_61976 ?auto_61980 ) ) ( not ( = ?auto_61977 ?auto_61980 ) ) ( not ( = ?auto_61979 ?auto_61980 ) ) ( not ( = ?auto_61978 ?auto_61980 ) ) ( ON ?auto_61979 ?auto_61978 ) ( ON ?auto_61977 ?auto_61979 ) ( ON-TABLE ?auto_61980 ) ( ON ?auto_61976 ?auto_61977 ) ( ON ?auto_61975 ?auto_61976 ) ( CLEAR ?auto_61975 ) ( HOLDING ?auto_61974 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61974 )
      ( MAKE-4PILE ?auto_61974 ?auto_61975 ?auto_61976 ?auto_61977 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61981 - BLOCK
      ?auto_61982 - BLOCK
      ?auto_61983 - BLOCK
      ?auto_61984 - BLOCK
    )
    :vars
    (
      ?auto_61987 - BLOCK
      ?auto_61985 - BLOCK
      ?auto_61986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61981 ?auto_61982 ) ) ( not ( = ?auto_61981 ?auto_61983 ) ) ( not ( = ?auto_61981 ?auto_61984 ) ) ( not ( = ?auto_61981 ?auto_61987 ) ) ( not ( = ?auto_61982 ?auto_61983 ) ) ( not ( = ?auto_61982 ?auto_61984 ) ) ( not ( = ?auto_61982 ?auto_61987 ) ) ( not ( = ?auto_61983 ?auto_61984 ) ) ( not ( = ?auto_61983 ?auto_61987 ) ) ( not ( = ?auto_61984 ?auto_61987 ) ) ( not ( = ?auto_61981 ?auto_61985 ) ) ( not ( = ?auto_61982 ?auto_61985 ) ) ( not ( = ?auto_61983 ?auto_61985 ) ) ( not ( = ?auto_61984 ?auto_61985 ) ) ( not ( = ?auto_61987 ?auto_61985 ) ) ( ON ?auto_61985 ?auto_61986 ) ( not ( = ?auto_61981 ?auto_61986 ) ) ( not ( = ?auto_61982 ?auto_61986 ) ) ( not ( = ?auto_61983 ?auto_61986 ) ) ( not ( = ?auto_61984 ?auto_61986 ) ) ( not ( = ?auto_61987 ?auto_61986 ) ) ( not ( = ?auto_61985 ?auto_61986 ) ) ( ON ?auto_61987 ?auto_61985 ) ( ON ?auto_61984 ?auto_61987 ) ( ON-TABLE ?auto_61986 ) ( ON ?auto_61983 ?auto_61984 ) ( ON ?auto_61982 ?auto_61983 ) ( ON ?auto_61981 ?auto_61982 ) ( CLEAR ?auto_61981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61986 ?auto_61985 ?auto_61987 ?auto_61984 ?auto_61983 ?auto_61982 )
      ( MAKE-4PILE ?auto_61981 ?auto_61982 ?auto_61983 ?auto_61984 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61990 - BLOCK
      ?auto_61991 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_61991 ) ( CLEAR ?auto_61990 ) ( ON-TABLE ?auto_61990 ) ( not ( = ?auto_61990 ?auto_61991 ) ) )
    :subtasks
    ( ( !STACK ?auto_61991 ?auto_61990 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61992 - BLOCK
      ?auto_61993 - BLOCK
    )
    :vars
    (
      ?auto_61994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61992 ) ( ON-TABLE ?auto_61992 ) ( not ( = ?auto_61992 ?auto_61993 ) ) ( ON ?auto_61993 ?auto_61994 ) ( CLEAR ?auto_61993 ) ( HAND-EMPTY ) ( not ( = ?auto_61992 ?auto_61994 ) ) ( not ( = ?auto_61993 ?auto_61994 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61993 ?auto_61994 )
      ( MAKE-2PILE ?auto_61992 ?auto_61993 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61995 - BLOCK
      ?auto_61996 - BLOCK
    )
    :vars
    (
      ?auto_61997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61995 ?auto_61996 ) ) ( ON ?auto_61996 ?auto_61997 ) ( CLEAR ?auto_61996 ) ( not ( = ?auto_61995 ?auto_61997 ) ) ( not ( = ?auto_61996 ?auto_61997 ) ) ( HOLDING ?auto_61995 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61995 )
      ( MAKE-2PILE ?auto_61995 ?auto_61996 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61998 - BLOCK
      ?auto_61999 - BLOCK
    )
    :vars
    (
      ?auto_62000 - BLOCK
      ?auto_62001 - BLOCK
      ?auto_62003 - BLOCK
      ?auto_62002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61998 ?auto_61999 ) ) ( ON ?auto_61999 ?auto_62000 ) ( not ( = ?auto_61998 ?auto_62000 ) ) ( not ( = ?auto_61999 ?auto_62000 ) ) ( ON ?auto_61998 ?auto_61999 ) ( CLEAR ?auto_61998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62001 ) ( ON ?auto_62003 ?auto_62001 ) ( ON ?auto_62002 ?auto_62003 ) ( ON ?auto_62000 ?auto_62002 ) ( not ( = ?auto_62001 ?auto_62003 ) ) ( not ( = ?auto_62001 ?auto_62002 ) ) ( not ( = ?auto_62001 ?auto_62000 ) ) ( not ( = ?auto_62001 ?auto_61999 ) ) ( not ( = ?auto_62001 ?auto_61998 ) ) ( not ( = ?auto_62003 ?auto_62002 ) ) ( not ( = ?auto_62003 ?auto_62000 ) ) ( not ( = ?auto_62003 ?auto_61999 ) ) ( not ( = ?auto_62003 ?auto_61998 ) ) ( not ( = ?auto_62002 ?auto_62000 ) ) ( not ( = ?auto_62002 ?auto_61999 ) ) ( not ( = ?auto_62002 ?auto_61998 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62001 ?auto_62003 ?auto_62002 ?auto_62000 ?auto_61999 )
      ( MAKE-2PILE ?auto_61998 ?auto_61999 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62004 - BLOCK
      ?auto_62005 - BLOCK
    )
    :vars
    (
      ?auto_62007 - BLOCK
      ?auto_62009 - BLOCK
      ?auto_62008 - BLOCK
      ?auto_62006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62004 ?auto_62005 ) ) ( ON ?auto_62005 ?auto_62007 ) ( not ( = ?auto_62004 ?auto_62007 ) ) ( not ( = ?auto_62005 ?auto_62007 ) ) ( ON-TABLE ?auto_62009 ) ( ON ?auto_62008 ?auto_62009 ) ( ON ?auto_62006 ?auto_62008 ) ( ON ?auto_62007 ?auto_62006 ) ( not ( = ?auto_62009 ?auto_62008 ) ) ( not ( = ?auto_62009 ?auto_62006 ) ) ( not ( = ?auto_62009 ?auto_62007 ) ) ( not ( = ?auto_62009 ?auto_62005 ) ) ( not ( = ?auto_62009 ?auto_62004 ) ) ( not ( = ?auto_62008 ?auto_62006 ) ) ( not ( = ?auto_62008 ?auto_62007 ) ) ( not ( = ?auto_62008 ?auto_62005 ) ) ( not ( = ?auto_62008 ?auto_62004 ) ) ( not ( = ?auto_62006 ?auto_62007 ) ) ( not ( = ?auto_62006 ?auto_62005 ) ) ( not ( = ?auto_62006 ?auto_62004 ) ) ( HOLDING ?auto_62004 ) ( CLEAR ?auto_62005 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62009 ?auto_62008 ?auto_62006 ?auto_62007 ?auto_62005 ?auto_62004 )
      ( MAKE-2PILE ?auto_62004 ?auto_62005 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62010 - BLOCK
      ?auto_62011 - BLOCK
    )
    :vars
    (
      ?auto_62012 - BLOCK
      ?auto_62015 - BLOCK
      ?auto_62013 - BLOCK
      ?auto_62014 - BLOCK
      ?auto_62016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62010 ?auto_62011 ) ) ( ON ?auto_62011 ?auto_62012 ) ( not ( = ?auto_62010 ?auto_62012 ) ) ( not ( = ?auto_62011 ?auto_62012 ) ) ( ON-TABLE ?auto_62015 ) ( ON ?auto_62013 ?auto_62015 ) ( ON ?auto_62014 ?auto_62013 ) ( ON ?auto_62012 ?auto_62014 ) ( not ( = ?auto_62015 ?auto_62013 ) ) ( not ( = ?auto_62015 ?auto_62014 ) ) ( not ( = ?auto_62015 ?auto_62012 ) ) ( not ( = ?auto_62015 ?auto_62011 ) ) ( not ( = ?auto_62015 ?auto_62010 ) ) ( not ( = ?auto_62013 ?auto_62014 ) ) ( not ( = ?auto_62013 ?auto_62012 ) ) ( not ( = ?auto_62013 ?auto_62011 ) ) ( not ( = ?auto_62013 ?auto_62010 ) ) ( not ( = ?auto_62014 ?auto_62012 ) ) ( not ( = ?auto_62014 ?auto_62011 ) ) ( not ( = ?auto_62014 ?auto_62010 ) ) ( CLEAR ?auto_62011 ) ( ON ?auto_62010 ?auto_62016 ) ( CLEAR ?auto_62010 ) ( HAND-EMPTY ) ( not ( = ?auto_62010 ?auto_62016 ) ) ( not ( = ?auto_62011 ?auto_62016 ) ) ( not ( = ?auto_62012 ?auto_62016 ) ) ( not ( = ?auto_62015 ?auto_62016 ) ) ( not ( = ?auto_62013 ?auto_62016 ) ) ( not ( = ?auto_62014 ?auto_62016 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62010 ?auto_62016 )
      ( MAKE-2PILE ?auto_62010 ?auto_62011 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62017 - BLOCK
      ?auto_62018 - BLOCK
    )
    :vars
    (
      ?auto_62023 - BLOCK
      ?auto_62019 - BLOCK
      ?auto_62021 - BLOCK
      ?auto_62022 - BLOCK
      ?auto_62020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62017 ?auto_62018 ) ) ( not ( = ?auto_62017 ?auto_62023 ) ) ( not ( = ?auto_62018 ?auto_62023 ) ) ( ON-TABLE ?auto_62019 ) ( ON ?auto_62021 ?auto_62019 ) ( ON ?auto_62022 ?auto_62021 ) ( ON ?auto_62023 ?auto_62022 ) ( not ( = ?auto_62019 ?auto_62021 ) ) ( not ( = ?auto_62019 ?auto_62022 ) ) ( not ( = ?auto_62019 ?auto_62023 ) ) ( not ( = ?auto_62019 ?auto_62018 ) ) ( not ( = ?auto_62019 ?auto_62017 ) ) ( not ( = ?auto_62021 ?auto_62022 ) ) ( not ( = ?auto_62021 ?auto_62023 ) ) ( not ( = ?auto_62021 ?auto_62018 ) ) ( not ( = ?auto_62021 ?auto_62017 ) ) ( not ( = ?auto_62022 ?auto_62023 ) ) ( not ( = ?auto_62022 ?auto_62018 ) ) ( not ( = ?auto_62022 ?auto_62017 ) ) ( ON ?auto_62017 ?auto_62020 ) ( CLEAR ?auto_62017 ) ( not ( = ?auto_62017 ?auto_62020 ) ) ( not ( = ?auto_62018 ?auto_62020 ) ) ( not ( = ?auto_62023 ?auto_62020 ) ) ( not ( = ?auto_62019 ?auto_62020 ) ) ( not ( = ?auto_62021 ?auto_62020 ) ) ( not ( = ?auto_62022 ?auto_62020 ) ) ( HOLDING ?auto_62018 ) ( CLEAR ?auto_62023 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62019 ?auto_62021 ?auto_62022 ?auto_62023 ?auto_62018 )
      ( MAKE-2PILE ?auto_62017 ?auto_62018 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62024 - BLOCK
      ?auto_62025 - BLOCK
    )
    :vars
    (
      ?auto_62027 - BLOCK
      ?auto_62030 - BLOCK
      ?auto_62029 - BLOCK
      ?auto_62028 - BLOCK
      ?auto_62026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62024 ?auto_62025 ) ) ( not ( = ?auto_62024 ?auto_62027 ) ) ( not ( = ?auto_62025 ?auto_62027 ) ) ( ON-TABLE ?auto_62030 ) ( ON ?auto_62029 ?auto_62030 ) ( ON ?auto_62028 ?auto_62029 ) ( ON ?auto_62027 ?auto_62028 ) ( not ( = ?auto_62030 ?auto_62029 ) ) ( not ( = ?auto_62030 ?auto_62028 ) ) ( not ( = ?auto_62030 ?auto_62027 ) ) ( not ( = ?auto_62030 ?auto_62025 ) ) ( not ( = ?auto_62030 ?auto_62024 ) ) ( not ( = ?auto_62029 ?auto_62028 ) ) ( not ( = ?auto_62029 ?auto_62027 ) ) ( not ( = ?auto_62029 ?auto_62025 ) ) ( not ( = ?auto_62029 ?auto_62024 ) ) ( not ( = ?auto_62028 ?auto_62027 ) ) ( not ( = ?auto_62028 ?auto_62025 ) ) ( not ( = ?auto_62028 ?auto_62024 ) ) ( ON ?auto_62024 ?auto_62026 ) ( not ( = ?auto_62024 ?auto_62026 ) ) ( not ( = ?auto_62025 ?auto_62026 ) ) ( not ( = ?auto_62027 ?auto_62026 ) ) ( not ( = ?auto_62030 ?auto_62026 ) ) ( not ( = ?auto_62029 ?auto_62026 ) ) ( not ( = ?auto_62028 ?auto_62026 ) ) ( CLEAR ?auto_62027 ) ( ON ?auto_62025 ?auto_62024 ) ( CLEAR ?auto_62025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62026 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62026 ?auto_62024 )
      ( MAKE-2PILE ?auto_62024 ?auto_62025 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62031 - BLOCK
      ?auto_62032 - BLOCK
    )
    :vars
    (
      ?auto_62037 - BLOCK
      ?auto_62036 - BLOCK
      ?auto_62034 - BLOCK
      ?auto_62035 - BLOCK
      ?auto_62033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62031 ?auto_62032 ) ) ( not ( = ?auto_62031 ?auto_62037 ) ) ( not ( = ?auto_62032 ?auto_62037 ) ) ( ON-TABLE ?auto_62036 ) ( ON ?auto_62034 ?auto_62036 ) ( ON ?auto_62035 ?auto_62034 ) ( not ( = ?auto_62036 ?auto_62034 ) ) ( not ( = ?auto_62036 ?auto_62035 ) ) ( not ( = ?auto_62036 ?auto_62037 ) ) ( not ( = ?auto_62036 ?auto_62032 ) ) ( not ( = ?auto_62036 ?auto_62031 ) ) ( not ( = ?auto_62034 ?auto_62035 ) ) ( not ( = ?auto_62034 ?auto_62037 ) ) ( not ( = ?auto_62034 ?auto_62032 ) ) ( not ( = ?auto_62034 ?auto_62031 ) ) ( not ( = ?auto_62035 ?auto_62037 ) ) ( not ( = ?auto_62035 ?auto_62032 ) ) ( not ( = ?auto_62035 ?auto_62031 ) ) ( ON ?auto_62031 ?auto_62033 ) ( not ( = ?auto_62031 ?auto_62033 ) ) ( not ( = ?auto_62032 ?auto_62033 ) ) ( not ( = ?auto_62037 ?auto_62033 ) ) ( not ( = ?auto_62036 ?auto_62033 ) ) ( not ( = ?auto_62034 ?auto_62033 ) ) ( not ( = ?auto_62035 ?auto_62033 ) ) ( ON ?auto_62032 ?auto_62031 ) ( CLEAR ?auto_62032 ) ( ON-TABLE ?auto_62033 ) ( HOLDING ?auto_62037 ) ( CLEAR ?auto_62035 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62036 ?auto_62034 ?auto_62035 ?auto_62037 )
      ( MAKE-2PILE ?auto_62031 ?auto_62032 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62038 - BLOCK
      ?auto_62039 - BLOCK
    )
    :vars
    (
      ?auto_62041 - BLOCK
      ?auto_62044 - BLOCK
      ?auto_62043 - BLOCK
      ?auto_62042 - BLOCK
      ?auto_62040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62038 ?auto_62039 ) ) ( not ( = ?auto_62038 ?auto_62041 ) ) ( not ( = ?auto_62039 ?auto_62041 ) ) ( ON-TABLE ?auto_62044 ) ( ON ?auto_62043 ?auto_62044 ) ( ON ?auto_62042 ?auto_62043 ) ( not ( = ?auto_62044 ?auto_62043 ) ) ( not ( = ?auto_62044 ?auto_62042 ) ) ( not ( = ?auto_62044 ?auto_62041 ) ) ( not ( = ?auto_62044 ?auto_62039 ) ) ( not ( = ?auto_62044 ?auto_62038 ) ) ( not ( = ?auto_62043 ?auto_62042 ) ) ( not ( = ?auto_62043 ?auto_62041 ) ) ( not ( = ?auto_62043 ?auto_62039 ) ) ( not ( = ?auto_62043 ?auto_62038 ) ) ( not ( = ?auto_62042 ?auto_62041 ) ) ( not ( = ?auto_62042 ?auto_62039 ) ) ( not ( = ?auto_62042 ?auto_62038 ) ) ( ON ?auto_62038 ?auto_62040 ) ( not ( = ?auto_62038 ?auto_62040 ) ) ( not ( = ?auto_62039 ?auto_62040 ) ) ( not ( = ?auto_62041 ?auto_62040 ) ) ( not ( = ?auto_62044 ?auto_62040 ) ) ( not ( = ?auto_62043 ?auto_62040 ) ) ( not ( = ?auto_62042 ?auto_62040 ) ) ( ON ?auto_62039 ?auto_62038 ) ( ON-TABLE ?auto_62040 ) ( CLEAR ?auto_62042 ) ( ON ?auto_62041 ?auto_62039 ) ( CLEAR ?auto_62041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62040 ?auto_62038 ?auto_62039 )
      ( MAKE-2PILE ?auto_62038 ?auto_62039 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62045 - BLOCK
      ?auto_62046 - BLOCK
    )
    :vars
    (
      ?auto_62049 - BLOCK
      ?auto_62047 - BLOCK
      ?auto_62050 - BLOCK
      ?auto_62048 - BLOCK
      ?auto_62051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62045 ?auto_62046 ) ) ( not ( = ?auto_62045 ?auto_62049 ) ) ( not ( = ?auto_62046 ?auto_62049 ) ) ( ON-TABLE ?auto_62047 ) ( ON ?auto_62050 ?auto_62047 ) ( not ( = ?auto_62047 ?auto_62050 ) ) ( not ( = ?auto_62047 ?auto_62048 ) ) ( not ( = ?auto_62047 ?auto_62049 ) ) ( not ( = ?auto_62047 ?auto_62046 ) ) ( not ( = ?auto_62047 ?auto_62045 ) ) ( not ( = ?auto_62050 ?auto_62048 ) ) ( not ( = ?auto_62050 ?auto_62049 ) ) ( not ( = ?auto_62050 ?auto_62046 ) ) ( not ( = ?auto_62050 ?auto_62045 ) ) ( not ( = ?auto_62048 ?auto_62049 ) ) ( not ( = ?auto_62048 ?auto_62046 ) ) ( not ( = ?auto_62048 ?auto_62045 ) ) ( ON ?auto_62045 ?auto_62051 ) ( not ( = ?auto_62045 ?auto_62051 ) ) ( not ( = ?auto_62046 ?auto_62051 ) ) ( not ( = ?auto_62049 ?auto_62051 ) ) ( not ( = ?auto_62047 ?auto_62051 ) ) ( not ( = ?auto_62050 ?auto_62051 ) ) ( not ( = ?auto_62048 ?auto_62051 ) ) ( ON ?auto_62046 ?auto_62045 ) ( ON-TABLE ?auto_62051 ) ( ON ?auto_62049 ?auto_62046 ) ( CLEAR ?auto_62049 ) ( HOLDING ?auto_62048 ) ( CLEAR ?auto_62050 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62047 ?auto_62050 ?auto_62048 )
      ( MAKE-2PILE ?auto_62045 ?auto_62046 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62052 - BLOCK
      ?auto_62053 - BLOCK
    )
    :vars
    (
      ?auto_62056 - BLOCK
      ?auto_62055 - BLOCK
      ?auto_62054 - BLOCK
      ?auto_62058 - BLOCK
      ?auto_62057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62052 ?auto_62053 ) ) ( not ( = ?auto_62052 ?auto_62056 ) ) ( not ( = ?auto_62053 ?auto_62056 ) ) ( ON-TABLE ?auto_62055 ) ( ON ?auto_62054 ?auto_62055 ) ( not ( = ?auto_62055 ?auto_62054 ) ) ( not ( = ?auto_62055 ?auto_62058 ) ) ( not ( = ?auto_62055 ?auto_62056 ) ) ( not ( = ?auto_62055 ?auto_62053 ) ) ( not ( = ?auto_62055 ?auto_62052 ) ) ( not ( = ?auto_62054 ?auto_62058 ) ) ( not ( = ?auto_62054 ?auto_62056 ) ) ( not ( = ?auto_62054 ?auto_62053 ) ) ( not ( = ?auto_62054 ?auto_62052 ) ) ( not ( = ?auto_62058 ?auto_62056 ) ) ( not ( = ?auto_62058 ?auto_62053 ) ) ( not ( = ?auto_62058 ?auto_62052 ) ) ( ON ?auto_62052 ?auto_62057 ) ( not ( = ?auto_62052 ?auto_62057 ) ) ( not ( = ?auto_62053 ?auto_62057 ) ) ( not ( = ?auto_62056 ?auto_62057 ) ) ( not ( = ?auto_62055 ?auto_62057 ) ) ( not ( = ?auto_62054 ?auto_62057 ) ) ( not ( = ?auto_62058 ?auto_62057 ) ) ( ON ?auto_62053 ?auto_62052 ) ( ON-TABLE ?auto_62057 ) ( ON ?auto_62056 ?auto_62053 ) ( CLEAR ?auto_62054 ) ( ON ?auto_62058 ?auto_62056 ) ( CLEAR ?auto_62058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62057 ?auto_62052 ?auto_62053 ?auto_62056 )
      ( MAKE-2PILE ?auto_62052 ?auto_62053 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62059 - BLOCK
      ?auto_62060 - BLOCK
    )
    :vars
    (
      ?auto_62064 - BLOCK
      ?auto_62065 - BLOCK
      ?auto_62063 - BLOCK
      ?auto_62061 - BLOCK
      ?auto_62062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62059 ?auto_62060 ) ) ( not ( = ?auto_62059 ?auto_62064 ) ) ( not ( = ?auto_62060 ?auto_62064 ) ) ( ON-TABLE ?auto_62065 ) ( not ( = ?auto_62065 ?auto_62063 ) ) ( not ( = ?auto_62065 ?auto_62061 ) ) ( not ( = ?auto_62065 ?auto_62064 ) ) ( not ( = ?auto_62065 ?auto_62060 ) ) ( not ( = ?auto_62065 ?auto_62059 ) ) ( not ( = ?auto_62063 ?auto_62061 ) ) ( not ( = ?auto_62063 ?auto_62064 ) ) ( not ( = ?auto_62063 ?auto_62060 ) ) ( not ( = ?auto_62063 ?auto_62059 ) ) ( not ( = ?auto_62061 ?auto_62064 ) ) ( not ( = ?auto_62061 ?auto_62060 ) ) ( not ( = ?auto_62061 ?auto_62059 ) ) ( ON ?auto_62059 ?auto_62062 ) ( not ( = ?auto_62059 ?auto_62062 ) ) ( not ( = ?auto_62060 ?auto_62062 ) ) ( not ( = ?auto_62064 ?auto_62062 ) ) ( not ( = ?auto_62065 ?auto_62062 ) ) ( not ( = ?auto_62063 ?auto_62062 ) ) ( not ( = ?auto_62061 ?auto_62062 ) ) ( ON ?auto_62060 ?auto_62059 ) ( ON-TABLE ?auto_62062 ) ( ON ?auto_62064 ?auto_62060 ) ( ON ?auto_62061 ?auto_62064 ) ( CLEAR ?auto_62061 ) ( HOLDING ?auto_62063 ) ( CLEAR ?auto_62065 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62065 ?auto_62063 )
      ( MAKE-2PILE ?auto_62059 ?auto_62060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62066 - BLOCK
      ?auto_62067 - BLOCK
    )
    :vars
    (
      ?auto_62068 - BLOCK
      ?auto_62069 - BLOCK
      ?auto_62070 - BLOCK
      ?auto_62072 - BLOCK
      ?auto_62071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62066 ?auto_62067 ) ) ( not ( = ?auto_62066 ?auto_62068 ) ) ( not ( = ?auto_62067 ?auto_62068 ) ) ( ON-TABLE ?auto_62069 ) ( not ( = ?auto_62069 ?auto_62070 ) ) ( not ( = ?auto_62069 ?auto_62072 ) ) ( not ( = ?auto_62069 ?auto_62068 ) ) ( not ( = ?auto_62069 ?auto_62067 ) ) ( not ( = ?auto_62069 ?auto_62066 ) ) ( not ( = ?auto_62070 ?auto_62072 ) ) ( not ( = ?auto_62070 ?auto_62068 ) ) ( not ( = ?auto_62070 ?auto_62067 ) ) ( not ( = ?auto_62070 ?auto_62066 ) ) ( not ( = ?auto_62072 ?auto_62068 ) ) ( not ( = ?auto_62072 ?auto_62067 ) ) ( not ( = ?auto_62072 ?auto_62066 ) ) ( ON ?auto_62066 ?auto_62071 ) ( not ( = ?auto_62066 ?auto_62071 ) ) ( not ( = ?auto_62067 ?auto_62071 ) ) ( not ( = ?auto_62068 ?auto_62071 ) ) ( not ( = ?auto_62069 ?auto_62071 ) ) ( not ( = ?auto_62070 ?auto_62071 ) ) ( not ( = ?auto_62072 ?auto_62071 ) ) ( ON ?auto_62067 ?auto_62066 ) ( ON-TABLE ?auto_62071 ) ( ON ?auto_62068 ?auto_62067 ) ( ON ?auto_62072 ?auto_62068 ) ( CLEAR ?auto_62069 ) ( ON ?auto_62070 ?auto_62072 ) ( CLEAR ?auto_62070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62071 ?auto_62066 ?auto_62067 ?auto_62068 ?auto_62072 )
      ( MAKE-2PILE ?auto_62066 ?auto_62067 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62073 - BLOCK
      ?auto_62074 - BLOCK
    )
    :vars
    (
      ?auto_62075 - BLOCK
      ?auto_62078 - BLOCK
      ?auto_62079 - BLOCK
      ?auto_62076 - BLOCK
      ?auto_62077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62073 ?auto_62074 ) ) ( not ( = ?auto_62073 ?auto_62075 ) ) ( not ( = ?auto_62074 ?auto_62075 ) ) ( not ( = ?auto_62078 ?auto_62079 ) ) ( not ( = ?auto_62078 ?auto_62076 ) ) ( not ( = ?auto_62078 ?auto_62075 ) ) ( not ( = ?auto_62078 ?auto_62074 ) ) ( not ( = ?auto_62078 ?auto_62073 ) ) ( not ( = ?auto_62079 ?auto_62076 ) ) ( not ( = ?auto_62079 ?auto_62075 ) ) ( not ( = ?auto_62079 ?auto_62074 ) ) ( not ( = ?auto_62079 ?auto_62073 ) ) ( not ( = ?auto_62076 ?auto_62075 ) ) ( not ( = ?auto_62076 ?auto_62074 ) ) ( not ( = ?auto_62076 ?auto_62073 ) ) ( ON ?auto_62073 ?auto_62077 ) ( not ( = ?auto_62073 ?auto_62077 ) ) ( not ( = ?auto_62074 ?auto_62077 ) ) ( not ( = ?auto_62075 ?auto_62077 ) ) ( not ( = ?auto_62078 ?auto_62077 ) ) ( not ( = ?auto_62079 ?auto_62077 ) ) ( not ( = ?auto_62076 ?auto_62077 ) ) ( ON ?auto_62074 ?auto_62073 ) ( ON-TABLE ?auto_62077 ) ( ON ?auto_62075 ?auto_62074 ) ( ON ?auto_62076 ?auto_62075 ) ( ON ?auto_62079 ?auto_62076 ) ( CLEAR ?auto_62079 ) ( HOLDING ?auto_62078 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62078 )
      ( MAKE-2PILE ?auto_62073 ?auto_62074 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62080 - BLOCK
      ?auto_62081 - BLOCK
    )
    :vars
    (
      ?auto_62084 - BLOCK
      ?auto_62085 - BLOCK
      ?auto_62086 - BLOCK
      ?auto_62082 - BLOCK
      ?auto_62083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62080 ?auto_62081 ) ) ( not ( = ?auto_62080 ?auto_62084 ) ) ( not ( = ?auto_62081 ?auto_62084 ) ) ( not ( = ?auto_62085 ?auto_62086 ) ) ( not ( = ?auto_62085 ?auto_62082 ) ) ( not ( = ?auto_62085 ?auto_62084 ) ) ( not ( = ?auto_62085 ?auto_62081 ) ) ( not ( = ?auto_62085 ?auto_62080 ) ) ( not ( = ?auto_62086 ?auto_62082 ) ) ( not ( = ?auto_62086 ?auto_62084 ) ) ( not ( = ?auto_62086 ?auto_62081 ) ) ( not ( = ?auto_62086 ?auto_62080 ) ) ( not ( = ?auto_62082 ?auto_62084 ) ) ( not ( = ?auto_62082 ?auto_62081 ) ) ( not ( = ?auto_62082 ?auto_62080 ) ) ( ON ?auto_62080 ?auto_62083 ) ( not ( = ?auto_62080 ?auto_62083 ) ) ( not ( = ?auto_62081 ?auto_62083 ) ) ( not ( = ?auto_62084 ?auto_62083 ) ) ( not ( = ?auto_62085 ?auto_62083 ) ) ( not ( = ?auto_62086 ?auto_62083 ) ) ( not ( = ?auto_62082 ?auto_62083 ) ) ( ON ?auto_62081 ?auto_62080 ) ( ON-TABLE ?auto_62083 ) ( ON ?auto_62084 ?auto_62081 ) ( ON ?auto_62082 ?auto_62084 ) ( ON ?auto_62086 ?auto_62082 ) ( ON ?auto_62085 ?auto_62086 ) ( CLEAR ?auto_62085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62083 ?auto_62080 ?auto_62081 ?auto_62084 ?auto_62082 ?auto_62086 )
      ( MAKE-2PILE ?auto_62080 ?auto_62081 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62090 - BLOCK
      ?auto_62091 - BLOCK
      ?auto_62092 - BLOCK
    )
    :vars
    (
      ?auto_62093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62093 ?auto_62092 ) ( CLEAR ?auto_62093 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62090 ) ( ON ?auto_62091 ?auto_62090 ) ( ON ?auto_62092 ?auto_62091 ) ( not ( = ?auto_62090 ?auto_62091 ) ) ( not ( = ?auto_62090 ?auto_62092 ) ) ( not ( = ?auto_62090 ?auto_62093 ) ) ( not ( = ?auto_62091 ?auto_62092 ) ) ( not ( = ?auto_62091 ?auto_62093 ) ) ( not ( = ?auto_62092 ?auto_62093 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62093 ?auto_62092 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62094 - BLOCK
      ?auto_62095 - BLOCK
      ?auto_62096 - BLOCK
    )
    :vars
    (
      ?auto_62097 - BLOCK
      ?auto_62098 - BLOCK
      ?auto_62099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62097 ?auto_62096 ) ( CLEAR ?auto_62097 ) ( ON-TABLE ?auto_62094 ) ( ON ?auto_62095 ?auto_62094 ) ( ON ?auto_62096 ?auto_62095 ) ( not ( = ?auto_62094 ?auto_62095 ) ) ( not ( = ?auto_62094 ?auto_62096 ) ) ( not ( = ?auto_62094 ?auto_62097 ) ) ( not ( = ?auto_62095 ?auto_62096 ) ) ( not ( = ?auto_62095 ?auto_62097 ) ) ( not ( = ?auto_62096 ?auto_62097 ) ) ( HOLDING ?auto_62098 ) ( CLEAR ?auto_62099 ) ( not ( = ?auto_62094 ?auto_62098 ) ) ( not ( = ?auto_62094 ?auto_62099 ) ) ( not ( = ?auto_62095 ?auto_62098 ) ) ( not ( = ?auto_62095 ?auto_62099 ) ) ( not ( = ?auto_62096 ?auto_62098 ) ) ( not ( = ?auto_62096 ?auto_62099 ) ) ( not ( = ?auto_62097 ?auto_62098 ) ) ( not ( = ?auto_62097 ?auto_62099 ) ) ( not ( = ?auto_62098 ?auto_62099 ) ) )
    :subtasks
    ( ( !STACK ?auto_62098 ?auto_62099 )
      ( MAKE-3PILE ?auto_62094 ?auto_62095 ?auto_62096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62100 - BLOCK
      ?auto_62101 - BLOCK
      ?auto_62102 - BLOCK
    )
    :vars
    (
      ?auto_62104 - BLOCK
      ?auto_62103 - BLOCK
      ?auto_62105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62104 ?auto_62102 ) ( ON-TABLE ?auto_62100 ) ( ON ?auto_62101 ?auto_62100 ) ( ON ?auto_62102 ?auto_62101 ) ( not ( = ?auto_62100 ?auto_62101 ) ) ( not ( = ?auto_62100 ?auto_62102 ) ) ( not ( = ?auto_62100 ?auto_62104 ) ) ( not ( = ?auto_62101 ?auto_62102 ) ) ( not ( = ?auto_62101 ?auto_62104 ) ) ( not ( = ?auto_62102 ?auto_62104 ) ) ( CLEAR ?auto_62103 ) ( not ( = ?auto_62100 ?auto_62105 ) ) ( not ( = ?auto_62100 ?auto_62103 ) ) ( not ( = ?auto_62101 ?auto_62105 ) ) ( not ( = ?auto_62101 ?auto_62103 ) ) ( not ( = ?auto_62102 ?auto_62105 ) ) ( not ( = ?auto_62102 ?auto_62103 ) ) ( not ( = ?auto_62104 ?auto_62105 ) ) ( not ( = ?auto_62104 ?auto_62103 ) ) ( not ( = ?auto_62105 ?auto_62103 ) ) ( ON ?auto_62105 ?auto_62104 ) ( CLEAR ?auto_62105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62100 ?auto_62101 ?auto_62102 ?auto_62104 )
      ( MAKE-3PILE ?auto_62100 ?auto_62101 ?auto_62102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62106 - BLOCK
      ?auto_62107 - BLOCK
      ?auto_62108 - BLOCK
    )
    :vars
    (
      ?auto_62111 - BLOCK
      ?auto_62109 - BLOCK
      ?auto_62110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62111 ?auto_62108 ) ( ON-TABLE ?auto_62106 ) ( ON ?auto_62107 ?auto_62106 ) ( ON ?auto_62108 ?auto_62107 ) ( not ( = ?auto_62106 ?auto_62107 ) ) ( not ( = ?auto_62106 ?auto_62108 ) ) ( not ( = ?auto_62106 ?auto_62111 ) ) ( not ( = ?auto_62107 ?auto_62108 ) ) ( not ( = ?auto_62107 ?auto_62111 ) ) ( not ( = ?auto_62108 ?auto_62111 ) ) ( not ( = ?auto_62106 ?auto_62109 ) ) ( not ( = ?auto_62106 ?auto_62110 ) ) ( not ( = ?auto_62107 ?auto_62109 ) ) ( not ( = ?auto_62107 ?auto_62110 ) ) ( not ( = ?auto_62108 ?auto_62109 ) ) ( not ( = ?auto_62108 ?auto_62110 ) ) ( not ( = ?auto_62111 ?auto_62109 ) ) ( not ( = ?auto_62111 ?auto_62110 ) ) ( not ( = ?auto_62109 ?auto_62110 ) ) ( ON ?auto_62109 ?auto_62111 ) ( CLEAR ?auto_62109 ) ( HOLDING ?auto_62110 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62110 )
      ( MAKE-3PILE ?auto_62106 ?auto_62107 ?auto_62108 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62112 - BLOCK
      ?auto_62113 - BLOCK
      ?auto_62114 - BLOCK
    )
    :vars
    (
      ?auto_62115 - BLOCK
      ?auto_62117 - BLOCK
      ?auto_62116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62115 ?auto_62114 ) ( ON-TABLE ?auto_62112 ) ( ON ?auto_62113 ?auto_62112 ) ( ON ?auto_62114 ?auto_62113 ) ( not ( = ?auto_62112 ?auto_62113 ) ) ( not ( = ?auto_62112 ?auto_62114 ) ) ( not ( = ?auto_62112 ?auto_62115 ) ) ( not ( = ?auto_62113 ?auto_62114 ) ) ( not ( = ?auto_62113 ?auto_62115 ) ) ( not ( = ?auto_62114 ?auto_62115 ) ) ( not ( = ?auto_62112 ?auto_62117 ) ) ( not ( = ?auto_62112 ?auto_62116 ) ) ( not ( = ?auto_62113 ?auto_62117 ) ) ( not ( = ?auto_62113 ?auto_62116 ) ) ( not ( = ?auto_62114 ?auto_62117 ) ) ( not ( = ?auto_62114 ?auto_62116 ) ) ( not ( = ?auto_62115 ?auto_62117 ) ) ( not ( = ?auto_62115 ?auto_62116 ) ) ( not ( = ?auto_62117 ?auto_62116 ) ) ( ON ?auto_62117 ?auto_62115 ) ( ON ?auto_62116 ?auto_62117 ) ( CLEAR ?auto_62116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62112 ?auto_62113 ?auto_62114 ?auto_62115 ?auto_62117 )
      ( MAKE-3PILE ?auto_62112 ?auto_62113 ?auto_62114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62118 - BLOCK
      ?auto_62119 - BLOCK
      ?auto_62120 - BLOCK
    )
    :vars
    (
      ?auto_62121 - BLOCK
      ?auto_62123 - BLOCK
      ?auto_62122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62121 ?auto_62120 ) ( ON-TABLE ?auto_62118 ) ( ON ?auto_62119 ?auto_62118 ) ( ON ?auto_62120 ?auto_62119 ) ( not ( = ?auto_62118 ?auto_62119 ) ) ( not ( = ?auto_62118 ?auto_62120 ) ) ( not ( = ?auto_62118 ?auto_62121 ) ) ( not ( = ?auto_62119 ?auto_62120 ) ) ( not ( = ?auto_62119 ?auto_62121 ) ) ( not ( = ?auto_62120 ?auto_62121 ) ) ( not ( = ?auto_62118 ?auto_62123 ) ) ( not ( = ?auto_62118 ?auto_62122 ) ) ( not ( = ?auto_62119 ?auto_62123 ) ) ( not ( = ?auto_62119 ?auto_62122 ) ) ( not ( = ?auto_62120 ?auto_62123 ) ) ( not ( = ?auto_62120 ?auto_62122 ) ) ( not ( = ?auto_62121 ?auto_62123 ) ) ( not ( = ?auto_62121 ?auto_62122 ) ) ( not ( = ?auto_62123 ?auto_62122 ) ) ( ON ?auto_62123 ?auto_62121 ) ( HOLDING ?auto_62122 ) ( CLEAR ?auto_62123 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62118 ?auto_62119 ?auto_62120 ?auto_62121 ?auto_62123 ?auto_62122 )
      ( MAKE-3PILE ?auto_62118 ?auto_62119 ?auto_62120 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62124 - BLOCK
      ?auto_62125 - BLOCK
      ?auto_62126 - BLOCK
    )
    :vars
    (
      ?auto_62129 - BLOCK
      ?auto_62127 - BLOCK
      ?auto_62128 - BLOCK
      ?auto_62130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62129 ?auto_62126 ) ( ON-TABLE ?auto_62124 ) ( ON ?auto_62125 ?auto_62124 ) ( ON ?auto_62126 ?auto_62125 ) ( not ( = ?auto_62124 ?auto_62125 ) ) ( not ( = ?auto_62124 ?auto_62126 ) ) ( not ( = ?auto_62124 ?auto_62129 ) ) ( not ( = ?auto_62125 ?auto_62126 ) ) ( not ( = ?auto_62125 ?auto_62129 ) ) ( not ( = ?auto_62126 ?auto_62129 ) ) ( not ( = ?auto_62124 ?auto_62127 ) ) ( not ( = ?auto_62124 ?auto_62128 ) ) ( not ( = ?auto_62125 ?auto_62127 ) ) ( not ( = ?auto_62125 ?auto_62128 ) ) ( not ( = ?auto_62126 ?auto_62127 ) ) ( not ( = ?auto_62126 ?auto_62128 ) ) ( not ( = ?auto_62129 ?auto_62127 ) ) ( not ( = ?auto_62129 ?auto_62128 ) ) ( not ( = ?auto_62127 ?auto_62128 ) ) ( ON ?auto_62127 ?auto_62129 ) ( CLEAR ?auto_62127 ) ( ON ?auto_62128 ?auto_62130 ) ( CLEAR ?auto_62128 ) ( HAND-EMPTY ) ( not ( = ?auto_62124 ?auto_62130 ) ) ( not ( = ?auto_62125 ?auto_62130 ) ) ( not ( = ?auto_62126 ?auto_62130 ) ) ( not ( = ?auto_62129 ?auto_62130 ) ) ( not ( = ?auto_62127 ?auto_62130 ) ) ( not ( = ?auto_62128 ?auto_62130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62128 ?auto_62130 )
      ( MAKE-3PILE ?auto_62124 ?auto_62125 ?auto_62126 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62131 - BLOCK
      ?auto_62132 - BLOCK
      ?auto_62133 - BLOCK
    )
    :vars
    (
      ?auto_62137 - BLOCK
      ?auto_62136 - BLOCK
      ?auto_62134 - BLOCK
      ?auto_62135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62137 ?auto_62133 ) ( ON-TABLE ?auto_62131 ) ( ON ?auto_62132 ?auto_62131 ) ( ON ?auto_62133 ?auto_62132 ) ( not ( = ?auto_62131 ?auto_62132 ) ) ( not ( = ?auto_62131 ?auto_62133 ) ) ( not ( = ?auto_62131 ?auto_62137 ) ) ( not ( = ?auto_62132 ?auto_62133 ) ) ( not ( = ?auto_62132 ?auto_62137 ) ) ( not ( = ?auto_62133 ?auto_62137 ) ) ( not ( = ?auto_62131 ?auto_62136 ) ) ( not ( = ?auto_62131 ?auto_62134 ) ) ( not ( = ?auto_62132 ?auto_62136 ) ) ( not ( = ?auto_62132 ?auto_62134 ) ) ( not ( = ?auto_62133 ?auto_62136 ) ) ( not ( = ?auto_62133 ?auto_62134 ) ) ( not ( = ?auto_62137 ?auto_62136 ) ) ( not ( = ?auto_62137 ?auto_62134 ) ) ( not ( = ?auto_62136 ?auto_62134 ) ) ( ON ?auto_62134 ?auto_62135 ) ( CLEAR ?auto_62134 ) ( not ( = ?auto_62131 ?auto_62135 ) ) ( not ( = ?auto_62132 ?auto_62135 ) ) ( not ( = ?auto_62133 ?auto_62135 ) ) ( not ( = ?auto_62137 ?auto_62135 ) ) ( not ( = ?auto_62136 ?auto_62135 ) ) ( not ( = ?auto_62134 ?auto_62135 ) ) ( HOLDING ?auto_62136 ) ( CLEAR ?auto_62137 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62131 ?auto_62132 ?auto_62133 ?auto_62137 ?auto_62136 )
      ( MAKE-3PILE ?auto_62131 ?auto_62132 ?auto_62133 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62138 - BLOCK
      ?auto_62139 - BLOCK
      ?auto_62140 - BLOCK
    )
    :vars
    (
      ?auto_62142 - BLOCK
      ?auto_62144 - BLOCK
      ?auto_62143 - BLOCK
      ?auto_62141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62142 ?auto_62140 ) ( ON-TABLE ?auto_62138 ) ( ON ?auto_62139 ?auto_62138 ) ( ON ?auto_62140 ?auto_62139 ) ( not ( = ?auto_62138 ?auto_62139 ) ) ( not ( = ?auto_62138 ?auto_62140 ) ) ( not ( = ?auto_62138 ?auto_62142 ) ) ( not ( = ?auto_62139 ?auto_62140 ) ) ( not ( = ?auto_62139 ?auto_62142 ) ) ( not ( = ?auto_62140 ?auto_62142 ) ) ( not ( = ?auto_62138 ?auto_62144 ) ) ( not ( = ?auto_62138 ?auto_62143 ) ) ( not ( = ?auto_62139 ?auto_62144 ) ) ( not ( = ?auto_62139 ?auto_62143 ) ) ( not ( = ?auto_62140 ?auto_62144 ) ) ( not ( = ?auto_62140 ?auto_62143 ) ) ( not ( = ?auto_62142 ?auto_62144 ) ) ( not ( = ?auto_62142 ?auto_62143 ) ) ( not ( = ?auto_62144 ?auto_62143 ) ) ( ON ?auto_62143 ?auto_62141 ) ( not ( = ?auto_62138 ?auto_62141 ) ) ( not ( = ?auto_62139 ?auto_62141 ) ) ( not ( = ?auto_62140 ?auto_62141 ) ) ( not ( = ?auto_62142 ?auto_62141 ) ) ( not ( = ?auto_62144 ?auto_62141 ) ) ( not ( = ?auto_62143 ?auto_62141 ) ) ( CLEAR ?auto_62142 ) ( ON ?auto_62144 ?auto_62143 ) ( CLEAR ?auto_62144 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62141 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62141 ?auto_62143 )
      ( MAKE-3PILE ?auto_62138 ?auto_62139 ?auto_62140 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62159 - BLOCK
      ?auto_62160 - BLOCK
      ?auto_62161 - BLOCK
    )
    :vars
    (
      ?auto_62162 - BLOCK
      ?auto_62164 - BLOCK
      ?auto_62163 - BLOCK
      ?auto_62165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62159 ) ( ON ?auto_62160 ?auto_62159 ) ( not ( = ?auto_62159 ?auto_62160 ) ) ( not ( = ?auto_62159 ?auto_62161 ) ) ( not ( = ?auto_62159 ?auto_62162 ) ) ( not ( = ?auto_62160 ?auto_62161 ) ) ( not ( = ?auto_62160 ?auto_62162 ) ) ( not ( = ?auto_62161 ?auto_62162 ) ) ( not ( = ?auto_62159 ?auto_62164 ) ) ( not ( = ?auto_62159 ?auto_62163 ) ) ( not ( = ?auto_62160 ?auto_62164 ) ) ( not ( = ?auto_62160 ?auto_62163 ) ) ( not ( = ?auto_62161 ?auto_62164 ) ) ( not ( = ?auto_62161 ?auto_62163 ) ) ( not ( = ?auto_62162 ?auto_62164 ) ) ( not ( = ?auto_62162 ?auto_62163 ) ) ( not ( = ?auto_62164 ?auto_62163 ) ) ( ON ?auto_62163 ?auto_62165 ) ( not ( = ?auto_62159 ?auto_62165 ) ) ( not ( = ?auto_62160 ?auto_62165 ) ) ( not ( = ?auto_62161 ?auto_62165 ) ) ( not ( = ?auto_62162 ?auto_62165 ) ) ( not ( = ?auto_62164 ?auto_62165 ) ) ( not ( = ?auto_62163 ?auto_62165 ) ) ( ON ?auto_62164 ?auto_62163 ) ( ON-TABLE ?auto_62165 ) ( ON ?auto_62162 ?auto_62164 ) ( CLEAR ?auto_62162 ) ( HOLDING ?auto_62161 ) ( CLEAR ?auto_62160 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62159 ?auto_62160 ?auto_62161 ?auto_62162 )
      ( MAKE-3PILE ?auto_62159 ?auto_62160 ?auto_62161 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62166 - BLOCK
      ?auto_62167 - BLOCK
      ?auto_62168 - BLOCK
    )
    :vars
    (
      ?auto_62172 - BLOCK
      ?auto_62171 - BLOCK
      ?auto_62169 - BLOCK
      ?auto_62170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62166 ) ( ON ?auto_62167 ?auto_62166 ) ( not ( = ?auto_62166 ?auto_62167 ) ) ( not ( = ?auto_62166 ?auto_62168 ) ) ( not ( = ?auto_62166 ?auto_62172 ) ) ( not ( = ?auto_62167 ?auto_62168 ) ) ( not ( = ?auto_62167 ?auto_62172 ) ) ( not ( = ?auto_62168 ?auto_62172 ) ) ( not ( = ?auto_62166 ?auto_62171 ) ) ( not ( = ?auto_62166 ?auto_62169 ) ) ( not ( = ?auto_62167 ?auto_62171 ) ) ( not ( = ?auto_62167 ?auto_62169 ) ) ( not ( = ?auto_62168 ?auto_62171 ) ) ( not ( = ?auto_62168 ?auto_62169 ) ) ( not ( = ?auto_62172 ?auto_62171 ) ) ( not ( = ?auto_62172 ?auto_62169 ) ) ( not ( = ?auto_62171 ?auto_62169 ) ) ( ON ?auto_62169 ?auto_62170 ) ( not ( = ?auto_62166 ?auto_62170 ) ) ( not ( = ?auto_62167 ?auto_62170 ) ) ( not ( = ?auto_62168 ?auto_62170 ) ) ( not ( = ?auto_62172 ?auto_62170 ) ) ( not ( = ?auto_62171 ?auto_62170 ) ) ( not ( = ?auto_62169 ?auto_62170 ) ) ( ON ?auto_62171 ?auto_62169 ) ( ON-TABLE ?auto_62170 ) ( ON ?auto_62172 ?auto_62171 ) ( CLEAR ?auto_62167 ) ( ON ?auto_62168 ?auto_62172 ) ( CLEAR ?auto_62168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62170 ?auto_62169 ?auto_62171 ?auto_62172 )
      ( MAKE-3PILE ?auto_62166 ?auto_62167 ?auto_62168 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62173 - BLOCK
      ?auto_62174 - BLOCK
      ?auto_62175 - BLOCK
    )
    :vars
    (
      ?auto_62177 - BLOCK
      ?auto_62176 - BLOCK
      ?auto_62178 - BLOCK
      ?auto_62179 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62173 ) ( not ( = ?auto_62173 ?auto_62174 ) ) ( not ( = ?auto_62173 ?auto_62175 ) ) ( not ( = ?auto_62173 ?auto_62177 ) ) ( not ( = ?auto_62174 ?auto_62175 ) ) ( not ( = ?auto_62174 ?auto_62177 ) ) ( not ( = ?auto_62175 ?auto_62177 ) ) ( not ( = ?auto_62173 ?auto_62176 ) ) ( not ( = ?auto_62173 ?auto_62178 ) ) ( not ( = ?auto_62174 ?auto_62176 ) ) ( not ( = ?auto_62174 ?auto_62178 ) ) ( not ( = ?auto_62175 ?auto_62176 ) ) ( not ( = ?auto_62175 ?auto_62178 ) ) ( not ( = ?auto_62177 ?auto_62176 ) ) ( not ( = ?auto_62177 ?auto_62178 ) ) ( not ( = ?auto_62176 ?auto_62178 ) ) ( ON ?auto_62178 ?auto_62179 ) ( not ( = ?auto_62173 ?auto_62179 ) ) ( not ( = ?auto_62174 ?auto_62179 ) ) ( not ( = ?auto_62175 ?auto_62179 ) ) ( not ( = ?auto_62177 ?auto_62179 ) ) ( not ( = ?auto_62176 ?auto_62179 ) ) ( not ( = ?auto_62178 ?auto_62179 ) ) ( ON ?auto_62176 ?auto_62178 ) ( ON-TABLE ?auto_62179 ) ( ON ?auto_62177 ?auto_62176 ) ( ON ?auto_62175 ?auto_62177 ) ( CLEAR ?auto_62175 ) ( HOLDING ?auto_62174 ) ( CLEAR ?auto_62173 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62173 ?auto_62174 )
      ( MAKE-3PILE ?auto_62173 ?auto_62174 ?auto_62175 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62180 - BLOCK
      ?auto_62181 - BLOCK
      ?auto_62182 - BLOCK
    )
    :vars
    (
      ?auto_62185 - BLOCK
      ?auto_62183 - BLOCK
      ?auto_62186 - BLOCK
      ?auto_62184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62180 ) ( not ( = ?auto_62180 ?auto_62181 ) ) ( not ( = ?auto_62180 ?auto_62182 ) ) ( not ( = ?auto_62180 ?auto_62185 ) ) ( not ( = ?auto_62181 ?auto_62182 ) ) ( not ( = ?auto_62181 ?auto_62185 ) ) ( not ( = ?auto_62182 ?auto_62185 ) ) ( not ( = ?auto_62180 ?auto_62183 ) ) ( not ( = ?auto_62180 ?auto_62186 ) ) ( not ( = ?auto_62181 ?auto_62183 ) ) ( not ( = ?auto_62181 ?auto_62186 ) ) ( not ( = ?auto_62182 ?auto_62183 ) ) ( not ( = ?auto_62182 ?auto_62186 ) ) ( not ( = ?auto_62185 ?auto_62183 ) ) ( not ( = ?auto_62185 ?auto_62186 ) ) ( not ( = ?auto_62183 ?auto_62186 ) ) ( ON ?auto_62186 ?auto_62184 ) ( not ( = ?auto_62180 ?auto_62184 ) ) ( not ( = ?auto_62181 ?auto_62184 ) ) ( not ( = ?auto_62182 ?auto_62184 ) ) ( not ( = ?auto_62185 ?auto_62184 ) ) ( not ( = ?auto_62183 ?auto_62184 ) ) ( not ( = ?auto_62186 ?auto_62184 ) ) ( ON ?auto_62183 ?auto_62186 ) ( ON-TABLE ?auto_62184 ) ( ON ?auto_62185 ?auto_62183 ) ( ON ?auto_62182 ?auto_62185 ) ( CLEAR ?auto_62180 ) ( ON ?auto_62181 ?auto_62182 ) ( CLEAR ?auto_62181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62184 ?auto_62186 ?auto_62183 ?auto_62185 ?auto_62182 )
      ( MAKE-3PILE ?auto_62180 ?auto_62181 ?auto_62182 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62187 - BLOCK
      ?auto_62188 - BLOCK
      ?auto_62189 - BLOCK
    )
    :vars
    (
      ?auto_62192 - BLOCK
      ?auto_62190 - BLOCK
      ?auto_62191 - BLOCK
      ?auto_62193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62187 ?auto_62188 ) ) ( not ( = ?auto_62187 ?auto_62189 ) ) ( not ( = ?auto_62187 ?auto_62192 ) ) ( not ( = ?auto_62188 ?auto_62189 ) ) ( not ( = ?auto_62188 ?auto_62192 ) ) ( not ( = ?auto_62189 ?auto_62192 ) ) ( not ( = ?auto_62187 ?auto_62190 ) ) ( not ( = ?auto_62187 ?auto_62191 ) ) ( not ( = ?auto_62188 ?auto_62190 ) ) ( not ( = ?auto_62188 ?auto_62191 ) ) ( not ( = ?auto_62189 ?auto_62190 ) ) ( not ( = ?auto_62189 ?auto_62191 ) ) ( not ( = ?auto_62192 ?auto_62190 ) ) ( not ( = ?auto_62192 ?auto_62191 ) ) ( not ( = ?auto_62190 ?auto_62191 ) ) ( ON ?auto_62191 ?auto_62193 ) ( not ( = ?auto_62187 ?auto_62193 ) ) ( not ( = ?auto_62188 ?auto_62193 ) ) ( not ( = ?auto_62189 ?auto_62193 ) ) ( not ( = ?auto_62192 ?auto_62193 ) ) ( not ( = ?auto_62190 ?auto_62193 ) ) ( not ( = ?auto_62191 ?auto_62193 ) ) ( ON ?auto_62190 ?auto_62191 ) ( ON-TABLE ?auto_62193 ) ( ON ?auto_62192 ?auto_62190 ) ( ON ?auto_62189 ?auto_62192 ) ( ON ?auto_62188 ?auto_62189 ) ( CLEAR ?auto_62188 ) ( HOLDING ?auto_62187 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62187 )
      ( MAKE-3PILE ?auto_62187 ?auto_62188 ?auto_62189 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62194 - BLOCK
      ?auto_62195 - BLOCK
      ?auto_62196 - BLOCK
    )
    :vars
    (
      ?auto_62198 - BLOCK
      ?auto_62200 - BLOCK
      ?auto_62199 - BLOCK
      ?auto_62197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62194 ?auto_62195 ) ) ( not ( = ?auto_62194 ?auto_62196 ) ) ( not ( = ?auto_62194 ?auto_62198 ) ) ( not ( = ?auto_62195 ?auto_62196 ) ) ( not ( = ?auto_62195 ?auto_62198 ) ) ( not ( = ?auto_62196 ?auto_62198 ) ) ( not ( = ?auto_62194 ?auto_62200 ) ) ( not ( = ?auto_62194 ?auto_62199 ) ) ( not ( = ?auto_62195 ?auto_62200 ) ) ( not ( = ?auto_62195 ?auto_62199 ) ) ( not ( = ?auto_62196 ?auto_62200 ) ) ( not ( = ?auto_62196 ?auto_62199 ) ) ( not ( = ?auto_62198 ?auto_62200 ) ) ( not ( = ?auto_62198 ?auto_62199 ) ) ( not ( = ?auto_62200 ?auto_62199 ) ) ( ON ?auto_62199 ?auto_62197 ) ( not ( = ?auto_62194 ?auto_62197 ) ) ( not ( = ?auto_62195 ?auto_62197 ) ) ( not ( = ?auto_62196 ?auto_62197 ) ) ( not ( = ?auto_62198 ?auto_62197 ) ) ( not ( = ?auto_62200 ?auto_62197 ) ) ( not ( = ?auto_62199 ?auto_62197 ) ) ( ON ?auto_62200 ?auto_62199 ) ( ON-TABLE ?auto_62197 ) ( ON ?auto_62198 ?auto_62200 ) ( ON ?auto_62196 ?auto_62198 ) ( ON ?auto_62195 ?auto_62196 ) ( ON ?auto_62194 ?auto_62195 ) ( CLEAR ?auto_62194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62197 ?auto_62199 ?auto_62200 ?auto_62198 ?auto_62196 ?auto_62195 )
      ( MAKE-3PILE ?auto_62194 ?auto_62195 ?auto_62196 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62204 - BLOCK
      ?auto_62205 - BLOCK
      ?auto_62206 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_62206 ) ( CLEAR ?auto_62205 ) ( ON-TABLE ?auto_62204 ) ( ON ?auto_62205 ?auto_62204 ) ( not ( = ?auto_62204 ?auto_62205 ) ) ( not ( = ?auto_62204 ?auto_62206 ) ) ( not ( = ?auto_62205 ?auto_62206 ) ) )
    :subtasks
    ( ( !STACK ?auto_62206 ?auto_62205 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62207 - BLOCK
      ?auto_62208 - BLOCK
      ?auto_62209 - BLOCK
    )
    :vars
    (
      ?auto_62210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62208 ) ( ON-TABLE ?auto_62207 ) ( ON ?auto_62208 ?auto_62207 ) ( not ( = ?auto_62207 ?auto_62208 ) ) ( not ( = ?auto_62207 ?auto_62209 ) ) ( not ( = ?auto_62208 ?auto_62209 ) ) ( ON ?auto_62209 ?auto_62210 ) ( CLEAR ?auto_62209 ) ( HAND-EMPTY ) ( not ( = ?auto_62207 ?auto_62210 ) ) ( not ( = ?auto_62208 ?auto_62210 ) ) ( not ( = ?auto_62209 ?auto_62210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62209 ?auto_62210 )
      ( MAKE-3PILE ?auto_62207 ?auto_62208 ?auto_62209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62211 - BLOCK
      ?auto_62212 - BLOCK
      ?auto_62213 - BLOCK
    )
    :vars
    (
      ?auto_62214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62211 ) ( not ( = ?auto_62211 ?auto_62212 ) ) ( not ( = ?auto_62211 ?auto_62213 ) ) ( not ( = ?auto_62212 ?auto_62213 ) ) ( ON ?auto_62213 ?auto_62214 ) ( CLEAR ?auto_62213 ) ( not ( = ?auto_62211 ?auto_62214 ) ) ( not ( = ?auto_62212 ?auto_62214 ) ) ( not ( = ?auto_62213 ?auto_62214 ) ) ( HOLDING ?auto_62212 ) ( CLEAR ?auto_62211 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62211 ?auto_62212 )
      ( MAKE-3PILE ?auto_62211 ?auto_62212 ?auto_62213 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62215 - BLOCK
      ?auto_62216 - BLOCK
      ?auto_62217 - BLOCK
    )
    :vars
    (
      ?auto_62218 - BLOCK
      ?auto_62219 - BLOCK
      ?auto_62220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62215 ) ( not ( = ?auto_62215 ?auto_62216 ) ) ( not ( = ?auto_62215 ?auto_62217 ) ) ( not ( = ?auto_62216 ?auto_62217 ) ) ( ON ?auto_62217 ?auto_62218 ) ( not ( = ?auto_62215 ?auto_62218 ) ) ( not ( = ?auto_62216 ?auto_62218 ) ) ( not ( = ?auto_62217 ?auto_62218 ) ) ( CLEAR ?auto_62215 ) ( ON ?auto_62216 ?auto_62217 ) ( CLEAR ?auto_62216 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62219 ) ( ON ?auto_62220 ?auto_62219 ) ( ON ?auto_62218 ?auto_62220 ) ( not ( = ?auto_62219 ?auto_62220 ) ) ( not ( = ?auto_62219 ?auto_62218 ) ) ( not ( = ?auto_62219 ?auto_62217 ) ) ( not ( = ?auto_62219 ?auto_62216 ) ) ( not ( = ?auto_62220 ?auto_62218 ) ) ( not ( = ?auto_62220 ?auto_62217 ) ) ( not ( = ?auto_62220 ?auto_62216 ) ) ( not ( = ?auto_62215 ?auto_62219 ) ) ( not ( = ?auto_62215 ?auto_62220 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62219 ?auto_62220 ?auto_62218 ?auto_62217 )
      ( MAKE-3PILE ?auto_62215 ?auto_62216 ?auto_62217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62221 - BLOCK
      ?auto_62222 - BLOCK
      ?auto_62223 - BLOCK
    )
    :vars
    (
      ?auto_62226 - BLOCK
      ?auto_62224 - BLOCK
      ?auto_62225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62221 ?auto_62222 ) ) ( not ( = ?auto_62221 ?auto_62223 ) ) ( not ( = ?auto_62222 ?auto_62223 ) ) ( ON ?auto_62223 ?auto_62226 ) ( not ( = ?auto_62221 ?auto_62226 ) ) ( not ( = ?auto_62222 ?auto_62226 ) ) ( not ( = ?auto_62223 ?auto_62226 ) ) ( ON ?auto_62222 ?auto_62223 ) ( CLEAR ?auto_62222 ) ( ON-TABLE ?auto_62224 ) ( ON ?auto_62225 ?auto_62224 ) ( ON ?auto_62226 ?auto_62225 ) ( not ( = ?auto_62224 ?auto_62225 ) ) ( not ( = ?auto_62224 ?auto_62226 ) ) ( not ( = ?auto_62224 ?auto_62223 ) ) ( not ( = ?auto_62224 ?auto_62222 ) ) ( not ( = ?auto_62225 ?auto_62226 ) ) ( not ( = ?auto_62225 ?auto_62223 ) ) ( not ( = ?auto_62225 ?auto_62222 ) ) ( not ( = ?auto_62221 ?auto_62224 ) ) ( not ( = ?auto_62221 ?auto_62225 ) ) ( HOLDING ?auto_62221 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62221 )
      ( MAKE-3PILE ?auto_62221 ?auto_62222 ?auto_62223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62227 - BLOCK
      ?auto_62228 - BLOCK
      ?auto_62229 - BLOCK
    )
    :vars
    (
      ?auto_62230 - BLOCK
      ?auto_62231 - BLOCK
      ?auto_62232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62227 ?auto_62228 ) ) ( not ( = ?auto_62227 ?auto_62229 ) ) ( not ( = ?auto_62228 ?auto_62229 ) ) ( ON ?auto_62229 ?auto_62230 ) ( not ( = ?auto_62227 ?auto_62230 ) ) ( not ( = ?auto_62228 ?auto_62230 ) ) ( not ( = ?auto_62229 ?auto_62230 ) ) ( ON ?auto_62228 ?auto_62229 ) ( ON-TABLE ?auto_62231 ) ( ON ?auto_62232 ?auto_62231 ) ( ON ?auto_62230 ?auto_62232 ) ( not ( = ?auto_62231 ?auto_62232 ) ) ( not ( = ?auto_62231 ?auto_62230 ) ) ( not ( = ?auto_62231 ?auto_62229 ) ) ( not ( = ?auto_62231 ?auto_62228 ) ) ( not ( = ?auto_62232 ?auto_62230 ) ) ( not ( = ?auto_62232 ?auto_62229 ) ) ( not ( = ?auto_62232 ?auto_62228 ) ) ( not ( = ?auto_62227 ?auto_62231 ) ) ( not ( = ?auto_62227 ?auto_62232 ) ) ( ON ?auto_62227 ?auto_62228 ) ( CLEAR ?auto_62227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62231 ?auto_62232 ?auto_62230 ?auto_62229 ?auto_62228 )
      ( MAKE-3PILE ?auto_62227 ?auto_62228 ?auto_62229 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62233 - BLOCK
      ?auto_62234 - BLOCK
      ?auto_62235 - BLOCK
    )
    :vars
    (
      ?auto_62237 - BLOCK
      ?auto_62238 - BLOCK
      ?auto_62236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62233 ?auto_62234 ) ) ( not ( = ?auto_62233 ?auto_62235 ) ) ( not ( = ?auto_62234 ?auto_62235 ) ) ( ON ?auto_62235 ?auto_62237 ) ( not ( = ?auto_62233 ?auto_62237 ) ) ( not ( = ?auto_62234 ?auto_62237 ) ) ( not ( = ?auto_62235 ?auto_62237 ) ) ( ON ?auto_62234 ?auto_62235 ) ( ON-TABLE ?auto_62238 ) ( ON ?auto_62236 ?auto_62238 ) ( ON ?auto_62237 ?auto_62236 ) ( not ( = ?auto_62238 ?auto_62236 ) ) ( not ( = ?auto_62238 ?auto_62237 ) ) ( not ( = ?auto_62238 ?auto_62235 ) ) ( not ( = ?auto_62238 ?auto_62234 ) ) ( not ( = ?auto_62236 ?auto_62237 ) ) ( not ( = ?auto_62236 ?auto_62235 ) ) ( not ( = ?auto_62236 ?auto_62234 ) ) ( not ( = ?auto_62233 ?auto_62238 ) ) ( not ( = ?auto_62233 ?auto_62236 ) ) ( HOLDING ?auto_62233 ) ( CLEAR ?auto_62234 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62238 ?auto_62236 ?auto_62237 ?auto_62235 ?auto_62234 ?auto_62233 )
      ( MAKE-3PILE ?auto_62233 ?auto_62234 ?auto_62235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62239 - BLOCK
      ?auto_62240 - BLOCK
      ?auto_62241 - BLOCK
    )
    :vars
    (
      ?auto_62244 - BLOCK
      ?auto_62243 - BLOCK
      ?auto_62242 - BLOCK
      ?auto_62245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62239 ?auto_62240 ) ) ( not ( = ?auto_62239 ?auto_62241 ) ) ( not ( = ?auto_62240 ?auto_62241 ) ) ( ON ?auto_62241 ?auto_62244 ) ( not ( = ?auto_62239 ?auto_62244 ) ) ( not ( = ?auto_62240 ?auto_62244 ) ) ( not ( = ?auto_62241 ?auto_62244 ) ) ( ON ?auto_62240 ?auto_62241 ) ( ON-TABLE ?auto_62243 ) ( ON ?auto_62242 ?auto_62243 ) ( ON ?auto_62244 ?auto_62242 ) ( not ( = ?auto_62243 ?auto_62242 ) ) ( not ( = ?auto_62243 ?auto_62244 ) ) ( not ( = ?auto_62243 ?auto_62241 ) ) ( not ( = ?auto_62243 ?auto_62240 ) ) ( not ( = ?auto_62242 ?auto_62244 ) ) ( not ( = ?auto_62242 ?auto_62241 ) ) ( not ( = ?auto_62242 ?auto_62240 ) ) ( not ( = ?auto_62239 ?auto_62243 ) ) ( not ( = ?auto_62239 ?auto_62242 ) ) ( CLEAR ?auto_62240 ) ( ON ?auto_62239 ?auto_62245 ) ( CLEAR ?auto_62239 ) ( HAND-EMPTY ) ( not ( = ?auto_62239 ?auto_62245 ) ) ( not ( = ?auto_62240 ?auto_62245 ) ) ( not ( = ?auto_62241 ?auto_62245 ) ) ( not ( = ?auto_62244 ?auto_62245 ) ) ( not ( = ?auto_62243 ?auto_62245 ) ) ( not ( = ?auto_62242 ?auto_62245 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62239 ?auto_62245 )
      ( MAKE-3PILE ?auto_62239 ?auto_62240 ?auto_62241 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62246 - BLOCK
      ?auto_62247 - BLOCK
      ?auto_62248 - BLOCK
    )
    :vars
    (
      ?auto_62251 - BLOCK
      ?auto_62249 - BLOCK
      ?auto_62250 - BLOCK
      ?auto_62252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62246 ?auto_62247 ) ) ( not ( = ?auto_62246 ?auto_62248 ) ) ( not ( = ?auto_62247 ?auto_62248 ) ) ( ON ?auto_62248 ?auto_62251 ) ( not ( = ?auto_62246 ?auto_62251 ) ) ( not ( = ?auto_62247 ?auto_62251 ) ) ( not ( = ?auto_62248 ?auto_62251 ) ) ( ON-TABLE ?auto_62249 ) ( ON ?auto_62250 ?auto_62249 ) ( ON ?auto_62251 ?auto_62250 ) ( not ( = ?auto_62249 ?auto_62250 ) ) ( not ( = ?auto_62249 ?auto_62251 ) ) ( not ( = ?auto_62249 ?auto_62248 ) ) ( not ( = ?auto_62249 ?auto_62247 ) ) ( not ( = ?auto_62250 ?auto_62251 ) ) ( not ( = ?auto_62250 ?auto_62248 ) ) ( not ( = ?auto_62250 ?auto_62247 ) ) ( not ( = ?auto_62246 ?auto_62249 ) ) ( not ( = ?auto_62246 ?auto_62250 ) ) ( ON ?auto_62246 ?auto_62252 ) ( CLEAR ?auto_62246 ) ( not ( = ?auto_62246 ?auto_62252 ) ) ( not ( = ?auto_62247 ?auto_62252 ) ) ( not ( = ?auto_62248 ?auto_62252 ) ) ( not ( = ?auto_62251 ?auto_62252 ) ) ( not ( = ?auto_62249 ?auto_62252 ) ) ( not ( = ?auto_62250 ?auto_62252 ) ) ( HOLDING ?auto_62247 ) ( CLEAR ?auto_62248 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62249 ?auto_62250 ?auto_62251 ?auto_62248 ?auto_62247 )
      ( MAKE-3PILE ?auto_62246 ?auto_62247 ?auto_62248 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62253 - BLOCK
      ?auto_62254 - BLOCK
      ?auto_62255 - BLOCK
    )
    :vars
    (
      ?auto_62257 - BLOCK
      ?auto_62256 - BLOCK
      ?auto_62259 - BLOCK
      ?auto_62258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62253 ?auto_62254 ) ) ( not ( = ?auto_62253 ?auto_62255 ) ) ( not ( = ?auto_62254 ?auto_62255 ) ) ( ON ?auto_62255 ?auto_62257 ) ( not ( = ?auto_62253 ?auto_62257 ) ) ( not ( = ?auto_62254 ?auto_62257 ) ) ( not ( = ?auto_62255 ?auto_62257 ) ) ( ON-TABLE ?auto_62256 ) ( ON ?auto_62259 ?auto_62256 ) ( ON ?auto_62257 ?auto_62259 ) ( not ( = ?auto_62256 ?auto_62259 ) ) ( not ( = ?auto_62256 ?auto_62257 ) ) ( not ( = ?auto_62256 ?auto_62255 ) ) ( not ( = ?auto_62256 ?auto_62254 ) ) ( not ( = ?auto_62259 ?auto_62257 ) ) ( not ( = ?auto_62259 ?auto_62255 ) ) ( not ( = ?auto_62259 ?auto_62254 ) ) ( not ( = ?auto_62253 ?auto_62256 ) ) ( not ( = ?auto_62253 ?auto_62259 ) ) ( ON ?auto_62253 ?auto_62258 ) ( not ( = ?auto_62253 ?auto_62258 ) ) ( not ( = ?auto_62254 ?auto_62258 ) ) ( not ( = ?auto_62255 ?auto_62258 ) ) ( not ( = ?auto_62257 ?auto_62258 ) ) ( not ( = ?auto_62256 ?auto_62258 ) ) ( not ( = ?auto_62259 ?auto_62258 ) ) ( CLEAR ?auto_62255 ) ( ON ?auto_62254 ?auto_62253 ) ( CLEAR ?auto_62254 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62258 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62258 ?auto_62253 )
      ( MAKE-3PILE ?auto_62253 ?auto_62254 ?auto_62255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62260 - BLOCK
      ?auto_62261 - BLOCK
      ?auto_62262 - BLOCK
    )
    :vars
    (
      ?auto_62265 - BLOCK
      ?auto_62263 - BLOCK
      ?auto_62266 - BLOCK
      ?auto_62264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62260 ?auto_62261 ) ) ( not ( = ?auto_62260 ?auto_62262 ) ) ( not ( = ?auto_62261 ?auto_62262 ) ) ( not ( = ?auto_62260 ?auto_62265 ) ) ( not ( = ?auto_62261 ?auto_62265 ) ) ( not ( = ?auto_62262 ?auto_62265 ) ) ( ON-TABLE ?auto_62263 ) ( ON ?auto_62266 ?auto_62263 ) ( ON ?auto_62265 ?auto_62266 ) ( not ( = ?auto_62263 ?auto_62266 ) ) ( not ( = ?auto_62263 ?auto_62265 ) ) ( not ( = ?auto_62263 ?auto_62262 ) ) ( not ( = ?auto_62263 ?auto_62261 ) ) ( not ( = ?auto_62266 ?auto_62265 ) ) ( not ( = ?auto_62266 ?auto_62262 ) ) ( not ( = ?auto_62266 ?auto_62261 ) ) ( not ( = ?auto_62260 ?auto_62263 ) ) ( not ( = ?auto_62260 ?auto_62266 ) ) ( ON ?auto_62260 ?auto_62264 ) ( not ( = ?auto_62260 ?auto_62264 ) ) ( not ( = ?auto_62261 ?auto_62264 ) ) ( not ( = ?auto_62262 ?auto_62264 ) ) ( not ( = ?auto_62265 ?auto_62264 ) ) ( not ( = ?auto_62263 ?auto_62264 ) ) ( not ( = ?auto_62266 ?auto_62264 ) ) ( ON ?auto_62261 ?auto_62260 ) ( CLEAR ?auto_62261 ) ( ON-TABLE ?auto_62264 ) ( HOLDING ?auto_62262 ) ( CLEAR ?auto_62265 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62263 ?auto_62266 ?auto_62265 ?auto_62262 )
      ( MAKE-3PILE ?auto_62260 ?auto_62261 ?auto_62262 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62267 - BLOCK
      ?auto_62268 - BLOCK
      ?auto_62269 - BLOCK
    )
    :vars
    (
      ?auto_62270 - BLOCK
      ?auto_62272 - BLOCK
      ?auto_62271 - BLOCK
      ?auto_62273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62267 ?auto_62268 ) ) ( not ( = ?auto_62267 ?auto_62269 ) ) ( not ( = ?auto_62268 ?auto_62269 ) ) ( not ( = ?auto_62267 ?auto_62270 ) ) ( not ( = ?auto_62268 ?auto_62270 ) ) ( not ( = ?auto_62269 ?auto_62270 ) ) ( ON-TABLE ?auto_62272 ) ( ON ?auto_62271 ?auto_62272 ) ( ON ?auto_62270 ?auto_62271 ) ( not ( = ?auto_62272 ?auto_62271 ) ) ( not ( = ?auto_62272 ?auto_62270 ) ) ( not ( = ?auto_62272 ?auto_62269 ) ) ( not ( = ?auto_62272 ?auto_62268 ) ) ( not ( = ?auto_62271 ?auto_62270 ) ) ( not ( = ?auto_62271 ?auto_62269 ) ) ( not ( = ?auto_62271 ?auto_62268 ) ) ( not ( = ?auto_62267 ?auto_62272 ) ) ( not ( = ?auto_62267 ?auto_62271 ) ) ( ON ?auto_62267 ?auto_62273 ) ( not ( = ?auto_62267 ?auto_62273 ) ) ( not ( = ?auto_62268 ?auto_62273 ) ) ( not ( = ?auto_62269 ?auto_62273 ) ) ( not ( = ?auto_62270 ?auto_62273 ) ) ( not ( = ?auto_62272 ?auto_62273 ) ) ( not ( = ?auto_62271 ?auto_62273 ) ) ( ON ?auto_62268 ?auto_62267 ) ( ON-TABLE ?auto_62273 ) ( CLEAR ?auto_62270 ) ( ON ?auto_62269 ?auto_62268 ) ( CLEAR ?auto_62269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62273 ?auto_62267 ?auto_62268 )
      ( MAKE-3PILE ?auto_62267 ?auto_62268 ?auto_62269 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62274 - BLOCK
      ?auto_62275 - BLOCK
      ?auto_62276 - BLOCK
    )
    :vars
    (
      ?auto_62277 - BLOCK
      ?auto_62280 - BLOCK
      ?auto_62279 - BLOCK
      ?auto_62278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62274 ?auto_62275 ) ) ( not ( = ?auto_62274 ?auto_62276 ) ) ( not ( = ?auto_62275 ?auto_62276 ) ) ( not ( = ?auto_62274 ?auto_62277 ) ) ( not ( = ?auto_62275 ?auto_62277 ) ) ( not ( = ?auto_62276 ?auto_62277 ) ) ( ON-TABLE ?auto_62280 ) ( ON ?auto_62279 ?auto_62280 ) ( not ( = ?auto_62280 ?auto_62279 ) ) ( not ( = ?auto_62280 ?auto_62277 ) ) ( not ( = ?auto_62280 ?auto_62276 ) ) ( not ( = ?auto_62280 ?auto_62275 ) ) ( not ( = ?auto_62279 ?auto_62277 ) ) ( not ( = ?auto_62279 ?auto_62276 ) ) ( not ( = ?auto_62279 ?auto_62275 ) ) ( not ( = ?auto_62274 ?auto_62280 ) ) ( not ( = ?auto_62274 ?auto_62279 ) ) ( ON ?auto_62274 ?auto_62278 ) ( not ( = ?auto_62274 ?auto_62278 ) ) ( not ( = ?auto_62275 ?auto_62278 ) ) ( not ( = ?auto_62276 ?auto_62278 ) ) ( not ( = ?auto_62277 ?auto_62278 ) ) ( not ( = ?auto_62280 ?auto_62278 ) ) ( not ( = ?auto_62279 ?auto_62278 ) ) ( ON ?auto_62275 ?auto_62274 ) ( ON-TABLE ?auto_62278 ) ( ON ?auto_62276 ?auto_62275 ) ( CLEAR ?auto_62276 ) ( HOLDING ?auto_62277 ) ( CLEAR ?auto_62279 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62280 ?auto_62279 ?auto_62277 )
      ( MAKE-3PILE ?auto_62274 ?auto_62275 ?auto_62276 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62281 - BLOCK
      ?auto_62282 - BLOCK
      ?auto_62283 - BLOCK
    )
    :vars
    (
      ?auto_62285 - BLOCK
      ?auto_62284 - BLOCK
      ?auto_62287 - BLOCK
      ?auto_62286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62281 ?auto_62282 ) ) ( not ( = ?auto_62281 ?auto_62283 ) ) ( not ( = ?auto_62282 ?auto_62283 ) ) ( not ( = ?auto_62281 ?auto_62285 ) ) ( not ( = ?auto_62282 ?auto_62285 ) ) ( not ( = ?auto_62283 ?auto_62285 ) ) ( ON-TABLE ?auto_62284 ) ( ON ?auto_62287 ?auto_62284 ) ( not ( = ?auto_62284 ?auto_62287 ) ) ( not ( = ?auto_62284 ?auto_62285 ) ) ( not ( = ?auto_62284 ?auto_62283 ) ) ( not ( = ?auto_62284 ?auto_62282 ) ) ( not ( = ?auto_62287 ?auto_62285 ) ) ( not ( = ?auto_62287 ?auto_62283 ) ) ( not ( = ?auto_62287 ?auto_62282 ) ) ( not ( = ?auto_62281 ?auto_62284 ) ) ( not ( = ?auto_62281 ?auto_62287 ) ) ( ON ?auto_62281 ?auto_62286 ) ( not ( = ?auto_62281 ?auto_62286 ) ) ( not ( = ?auto_62282 ?auto_62286 ) ) ( not ( = ?auto_62283 ?auto_62286 ) ) ( not ( = ?auto_62285 ?auto_62286 ) ) ( not ( = ?auto_62284 ?auto_62286 ) ) ( not ( = ?auto_62287 ?auto_62286 ) ) ( ON ?auto_62282 ?auto_62281 ) ( ON-TABLE ?auto_62286 ) ( ON ?auto_62283 ?auto_62282 ) ( CLEAR ?auto_62287 ) ( ON ?auto_62285 ?auto_62283 ) ( CLEAR ?auto_62285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62286 ?auto_62281 ?auto_62282 ?auto_62283 )
      ( MAKE-3PILE ?auto_62281 ?auto_62282 ?auto_62283 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62288 - BLOCK
      ?auto_62289 - BLOCK
      ?auto_62290 - BLOCK
    )
    :vars
    (
      ?auto_62291 - BLOCK
      ?auto_62293 - BLOCK
      ?auto_62292 - BLOCK
      ?auto_62294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62288 ?auto_62289 ) ) ( not ( = ?auto_62288 ?auto_62290 ) ) ( not ( = ?auto_62289 ?auto_62290 ) ) ( not ( = ?auto_62288 ?auto_62291 ) ) ( not ( = ?auto_62289 ?auto_62291 ) ) ( not ( = ?auto_62290 ?auto_62291 ) ) ( ON-TABLE ?auto_62293 ) ( not ( = ?auto_62293 ?auto_62292 ) ) ( not ( = ?auto_62293 ?auto_62291 ) ) ( not ( = ?auto_62293 ?auto_62290 ) ) ( not ( = ?auto_62293 ?auto_62289 ) ) ( not ( = ?auto_62292 ?auto_62291 ) ) ( not ( = ?auto_62292 ?auto_62290 ) ) ( not ( = ?auto_62292 ?auto_62289 ) ) ( not ( = ?auto_62288 ?auto_62293 ) ) ( not ( = ?auto_62288 ?auto_62292 ) ) ( ON ?auto_62288 ?auto_62294 ) ( not ( = ?auto_62288 ?auto_62294 ) ) ( not ( = ?auto_62289 ?auto_62294 ) ) ( not ( = ?auto_62290 ?auto_62294 ) ) ( not ( = ?auto_62291 ?auto_62294 ) ) ( not ( = ?auto_62293 ?auto_62294 ) ) ( not ( = ?auto_62292 ?auto_62294 ) ) ( ON ?auto_62289 ?auto_62288 ) ( ON-TABLE ?auto_62294 ) ( ON ?auto_62290 ?auto_62289 ) ( ON ?auto_62291 ?auto_62290 ) ( CLEAR ?auto_62291 ) ( HOLDING ?auto_62292 ) ( CLEAR ?auto_62293 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62293 ?auto_62292 )
      ( MAKE-3PILE ?auto_62288 ?auto_62289 ?auto_62290 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62295 - BLOCK
      ?auto_62296 - BLOCK
      ?auto_62297 - BLOCK
    )
    :vars
    (
      ?auto_62300 - BLOCK
      ?auto_62298 - BLOCK
      ?auto_62301 - BLOCK
      ?auto_62299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62295 ?auto_62296 ) ) ( not ( = ?auto_62295 ?auto_62297 ) ) ( not ( = ?auto_62296 ?auto_62297 ) ) ( not ( = ?auto_62295 ?auto_62300 ) ) ( not ( = ?auto_62296 ?auto_62300 ) ) ( not ( = ?auto_62297 ?auto_62300 ) ) ( ON-TABLE ?auto_62298 ) ( not ( = ?auto_62298 ?auto_62301 ) ) ( not ( = ?auto_62298 ?auto_62300 ) ) ( not ( = ?auto_62298 ?auto_62297 ) ) ( not ( = ?auto_62298 ?auto_62296 ) ) ( not ( = ?auto_62301 ?auto_62300 ) ) ( not ( = ?auto_62301 ?auto_62297 ) ) ( not ( = ?auto_62301 ?auto_62296 ) ) ( not ( = ?auto_62295 ?auto_62298 ) ) ( not ( = ?auto_62295 ?auto_62301 ) ) ( ON ?auto_62295 ?auto_62299 ) ( not ( = ?auto_62295 ?auto_62299 ) ) ( not ( = ?auto_62296 ?auto_62299 ) ) ( not ( = ?auto_62297 ?auto_62299 ) ) ( not ( = ?auto_62300 ?auto_62299 ) ) ( not ( = ?auto_62298 ?auto_62299 ) ) ( not ( = ?auto_62301 ?auto_62299 ) ) ( ON ?auto_62296 ?auto_62295 ) ( ON-TABLE ?auto_62299 ) ( ON ?auto_62297 ?auto_62296 ) ( ON ?auto_62300 ?auto_62297 ) ( CLEAR ?auto_62298 ) ( ON ?auto_62301 ?auto_62300 ) ( CLEAR ?auto_62301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62299 ?auto_62295 ?auto_62296 ?auto_62297 ?auto_62300 )
      ( MAKE-3PILE ?auto_62295 ?auto_62296 ?auto_62297 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62302 - BLOCK
      ?auto_62303 - BLOCK
      ?auto_62304 - BLOCK
    )
    :vars
    (
      ?auto_62307 - BLOCK
      ?auto_62306 - BLOCK
      ?auto_62308 - BLOCK
      ?auto_62305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62302 ?auto_62303 ) ) ( not ( = ?auto_62302 ?auto_62304 ) ) ( not ( = ?auto_62303 ?auto_62304 ) ) ( not ( = ?auto_62302 ?auto_62307 ) ) ( not ( = ?auto_62303 ?auto_62307 ) ) ( not ( = ?auto_62304 ?auto_62307 ) ) ( not ( = ?auto_62306 ?auto_62308 ) ) ( not ( = ?auto_62306 ?auto_62307 ) ) ( not ( = ?auto_62306 ?auto_62304 ) ) ( not ( = ?auto_62306 ?auto_62303 ) ) ( not ( = ?auto_62308 ?auto_62307 ) ) ( not ( = ?auto_62308 ?auto_62304 ) ) ( not ( = ?auto_62308 ?auto_62303 ) ) ( not ( = ?auto_62302 ?auto_62306 ) ) ( not ( = ?auto_62302 ?auto_62308 ) ) ( ON ?auto_62302 ?auto_62305 ) ( not ( = ?auto_62302 ?auto_62305 ) ) ( not ( = ?auto_62303 ?auto_62305 ) ) ( not ( = ?auto_62304 ?auto_62305 ) ) ( not ( = ?auto_62307 ?auto_62305 ) ) ( not ( = ?auto_62306 ?auto_62305 ) ) ( not ( = ?auto_62308 ?auto_62305 ) ) ( ON ?auto_62303 ?auto_62302 ) ( ON-TABLE ?auto_62305 ) ( ON ?auto_62304 ?auto_62303 ) ( ON ?auto_62307 ?auto_62304 ) ( ON ?auto_62308 ?auto_62307 ) ( CLEAR ?auto_62308 ) ( HOLDING ?auto_62306 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62306 )
      ( MAKE-3PILE ?auto_62302 ?auto_62303 ?auto_62304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_62309 - BLOCK
      ?auto_62310 - BLOCK
      ?auto_62311 - BLOCK
    )
    :vars
    (
      ?auto_62315 - BLOCK
      ?auto_62312 - BLOCK
      ?auto_62313 - BLOCK
      ?auto_62314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62309 ?auto_62310 ) ) ( not ( = ?auto_62309 ?auto_62311 ) ) ( not ( = ?auto_62310 ?auto_62311 ) ) ( not ( = ?auto_62309 ?auto_62315 ) ) ( not ( = ?auto_62310 ?auto_62315 ) ) ( not ( = ?auto_62311 ?auto_62315 ) ) ( not ( = ?auto_62312 ?auto_62313 ) ) ( not ( = ?auto_62312 ?auto_62315 ) ) ( not ( = ?auto_62312 ?auto_62311 ) ) ( not ( = ?auto_62312 ?auto_62310 ) ) ( not ( = ?auto_62313 ?auto_62315 ) ) ( not ( = ?auto_62313 ?auto_62311 ) ) ( not ( = ?auto_62313 ?auto_62310 ) ) ( not ( = ?auto_62309 ?auto_62312 ) ) ( not ( = ?auto_62309 ?auto_62313 ) ) ( ON ?auto_62309 ?auto_62314 ) ( not ( = ?auto_62309 ?auto_62314 ) ) ( not ( = ?auto_62310 ?auto_62314 ) ) ( not ( = ?auto_62311 ?auto_62314 ) ) ( not ( = ?auto_62315 ?auto_62314 ) ) ( not ( = ?auto_62312 ?auto_62314 ) ) ( not ( = ?auto_62313 ?auto_62314 ) ) ( ON ?auto_62310 ?auto_62309 ) ( ON-TABLE ?auto_62314 ) ( ON ?auto_62311 ?auto_62310 ) ( ON ?auto_62315 ?auto_62311 ) ( ON ?auto_62313 ?auto_62315 ) ( ON ?auto_62312 ?auto_62313 ) ( CLEAR ?auto_62312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62314 ?auto_62309 ?auto_62310 ?auto_62311 ?auto_62315 ?auto_62313 )
      ( MAKE-3PILE ?auto_62309 ?auto_62310 ?auto_62311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62318 - BLOCK
      ?auto_62319 - BLOCK
    )
    :vars
    (
      ?auto_62320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62320 ?auto_62319 ) ( CLEAR ?auto_62320 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62318 ) ( ON ?auto_62319 ?auto_62318 ) ( not ( = ?auto_62318 ?auto_62319 ) ) ( not ( = ?auto_62318 ?auto_62320 ) ) ( not ( = ?auto_62319 ?auto_62320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62320 ?auto_62319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62321 - BLOCK
      ?auto_62322 - BLOCK
    )
    :vars
    (
      ?auto_62323 - BLOCK
      ?auto_62324 - BLOCK
      ?auto_62325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62323 ?auto_62322 ) ( CLEAR ?auto_62323 ) ( ON-TABLE ?auto_62321 ) ( ON ?auto_62322 ?auto_62321 ) ( not ( = ?auto_62321 ?auto_62322 ) ) ( not ( = ?auto_62321 ?auto_62323 ) ) ( not ( = ?auto_62322 ?auto_62323 ) ) ( HOLDING ?auto_62324 ) ( CLEAR ?auto_62325 ) ( not ( = ?auto_62321 ?auto_62324 ) ) ( not ( = ?auto_62321 ?auto_62325 ) ) ( not ( = ?auto_62322 ?auto_62324 ) ) ( not ( = ?auto_62322 ?auto_62325 ) ) ( not ( = ?auto_62323 ?auto_62324 ) ) ( not ( = ?auto_62323 ?auto_62325 ) ) ( not ( = ?auto_62324 ?auto_62325 ) ) )
    :subtasks
    ( ( !STACK ?auto_62324 ?auto_62325 )
      ( MAKE-2PILE ?auto_62321 ?auto_62322 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62326 - BLOCK
      ?auto_62327 - BLOCK
    )
    :vars
    (
      ?auto_62328 - BLOCK
      ?auto_62330 - BLOCK
      ?auto_62329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62328 ?auto_62327 ) ( ON-TABLE ?auto_62326 ) ( ON ?auto_62327 ?auto_62326 ) ( not ( = ?auto_62326 ?auto_62327 ) ) ( not ( = ?auto_62326 ?auto_62328 ) ) ( not ( = ?auto_62327 ?auto_62328 ) ) ( CLEAR ?auto_62330 ) ( not ( = ?auto_62326 ?auto_62329 ) ) ( not ( = ?auto_62326 ?auto_62330 ) ) ( not ( = ?auto_62327 ?auto_62329 ) ) ( not ( = ?auto_62327 ?auto_62330 ) ) ( not ( = ?auto_62328 ?auto_62329 ) ) ( not ( = ?auto_62328 ?auto_62330 ) ) ( not ( = ?auto_62329 ?auto_62330 ) ) ( ON ?auto_62329 ?auto_62328 ) ( CLEAR ?auto_62329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62326 ?auto_62327 ?auto_62328 )
      ( MAKE-2PILE ?auto_62326 ?auto_62327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62331 - BLOCK
      ?auto_62332 - BLOCK
    )
    :vars
    (
      ?auto_62335 - BLOCK
      ?auto_62333 - BLOCK
      ?auto_62334 - BLOCK
      ?auto_62336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62335 ?auto_62332 ) ( ON-TABLE ?auto_62331 ) ( ON ?auto_62332 ?auto_62331 ) ( not ( = ?auto_62331 ?auto_62332 ) ) ( not ( = ?auto_62331 ?auto_62335 ) ) ( not ( = ?auto_62332 ?auto_62335 ) ) ( not ( = ?auto_62331 ?auto_62333 ) ) ( not ( = ?auto_62331 ?auto_62334 ) ) ( not ( = ?auto_62332 ?auto_62333 ) ) ( not ( = ?auto_62332 ?auto_62334 ) ) ( not ( = ?auto_62335 ?auto_62333 ) ) ( not ( = ?auto_62335 ?auto_62334 ) ) ( not ( = ?auto_62333 ?auto_62334 ) ) ( ON ?auto_62333 ?auto_62335 ) ( CLEAR ?auto_62333 ) ( HOLDING ?auto_62334 ) ( CLEAR ?auto_62336 ) ( ON-TABLE ?auto_62336 ) ( not ( = ?auto_62336 ?auto_62334 ) ) ( not ( = ?auto_62331 ?auto_62336 ) ) ( not ( = ?auto_62332 ?auto_62336 ) ) ( not ( = ?auto_62335 ?auto_62336 ) ) ( not ( = ?auto_62333 ?auto_62336 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62336 ?auto_62334 )
      ( MAKE-2PILE ?auto_62331 ?auto_62332 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62337 - BLOCK
      ?auto_62338 - BLOCK
    )
    :vars
    (
      ?auto_62339 - BLOCK
      ?auto_62340 - BLOCK
      ?auto_62341 - BLOCK
      ?auto_62342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62339 ?auto_62338 ) ( ON-TABLE ?auto_62337 ) ( ON ?auto_62338 ?auto_62337 ) ( not ( = ?auto_62337 ?auto_62338 ) ) ( not ( = ?auto_62337 ?auto_62339 ) ) ( not ( = ?auto_62338 ?auto_62339 ) ) ( not ( = ?auto_62337 ?auto_62340 ) ) ( not ( = ?auto_62337 ?auto_62341 ) ) ( not ( = ?auto_62338 ?auto_62340 ) ) ( not ( = ?auto_62338 ?auto_62341 ) ) ( not ( = ?auto_62339 ?auto_62340 ) ) ( not ( = ?auto_62339 ?auto_62341 ) ) ( not ( = ?auto_62340 ?auto_62341 ) ) ( ON ?auto_62340 ?auto_62339 ) ( CLEAR ?auto_62342 ) ( ON-TABLE ?auto_62342 ) ( not ( = ?auto_62342 ?auto_62341 ) ) ( not ( = ?auto_62337 ?auto_62342 ) ) ( not ( = ?auto_62338 ?auto_62342 ) ) ( not ( = ?auto_62339 ?auto_62342 ) ) ( not ( = ?auto_62340 ?auto_62342 ) ) ( ON ?auto_62341 ?auto_62340 ) ( CLEAR ?auto_62341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62337 ?auto_62338 ?auto_62339 ?auto_62340 )
      ( MAKE-2PILE ?auto_62337 ?auto_62338 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62343 - BLOCK
      ?auto_62344 - BLOCK
    )
    :vars
    (
      ?auto_62348 - BLOCK
      ?auto_62346 - BLOCK
      ?auto_62347 - BLOCK
      ?auto_62345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62348 ?auto_62344 ) ( ON-TABLE ?auto_62343 ) ( ON ?auto_62344 ?auto_62343 ) ( not ( = ?auto_62343 ?auto_62344 ) ) ( not ( = ?auto_62343 ?auto_62348 ) ) ( not ( = ?auto_62344 ?auto_62348 ) ) ( not ( = ?auto_62343 ?auto_62346 ) ) ( not ( = ?auto_62343 ?auto_62347 ) ) ( not ( = ?auto_62344 ?auto_62346 ) ) ( not ( = ?auto_62344 ?auto_62347 ) ) ( not ( = ?auto_62348 ?auto_62346 ) ) ( not ( = ?auto_62348 ?auto_62347 ) ) ( not ( = ?auto_62346 ?auto_62347 ) ) ( ON ?auto_62346 ?auto_62348 ) ( not ( = ?auto_62345 ?auto_62347 ) ) ( not ( = ?auto_62343 ?auto_62345 ) ) ( not ( = ?auto_62344 ?auto_62345 ) ) ( not ( = ?auto_62348 ?auto_62345 ) ) ( not ( = ?auto_62346 ?auto_62345 ) ) ( ON ?auto_62347 ?auto_62346 ) ( CLEAR ?auto_62347 ) ( HOLDING ?auto_62345 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62345 )
      ( MAKE-2PILE ?auto_62343 ?auto_62344 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62349 - BLOCK
      ?auto_62350 - BLOCK
    )
    :vars
    (
      ?auto_62352 - BLOCK
      ?auto_62353 - BLOCK
      ?auto_62351 - BLOCK
      ?auto_62354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62352 ?auto_62350 ) ( ON-TABLE ?auto_62349 ) ( ON ?auto_62350 ?auto_62349 ) ( not ( = ?auto_62349 ?auto_62350 ) ) ( not ( = ?auto_62349 ?auto_62352 ) ) ( not ( = ?auto_62350 ?auto_62352 ) ) ( not ( = ?auto_62349 ?auto_62353 ) ) ( not ( = ?auto_62349 ?auto_62351 ) ) ( not ( = ?auto_62350 ?auto_62353 ) ) ( not ( = ?auto_62350 ?auto_62351 ) ) ( not ( = ?auto_62352 ?auto_62353 ) ) ( not ( = ?auto_62352 ?auto_62351 ) ) ( not ( = ?auto_62353 ?auto_62351 ) ) ( ON ?auto_62353 ?auto_62352 ) ( not ( = ?auto_62354 ?auto_62351 ) ) ( not ( = ?auto_62349 ?auto_62354 ) ) ( not ( = ?auto_62350 ?auto_62354 ) ) ( not ( = ?auto_62352 ?auto_62354 ) ) ( not ( = ?auto_62353 ?auto_62354 ) ) ( ON ?auto_62351 ?auto_62353 ) ( ON ?auto_62354 ?auto_62351 ) ( CLEAR ?auto_62354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62349 ?auto_62350 ?auto_62352 ?auto_62353 ?auto_62351 )
      ( MAKE-2PILE ?auto_62349 ?auto_62350 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62355 - BLOCK
      ?auto_62356 - BLOCK
    )
    :vars
    (
      ?auto_62357 - BLOCK
      ?auto_62360 - BLOCK
      ?auto_62358 - BLOCK
      ?auto_62359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62357 ?auto_62356 ) ( ON-TABLE ?auto_62355 ) ( ON ?auto_62356 ?auto_62355 ) ( not ( = ?auto_62355 ?auto_62356 ) ) ( not ( = ?auto_62355 ?auto_62357 ) ) ( not ( = ?auto_62356 ?auto_62357 ) ) ( not ( = ?auto_62355 ?auto_62360 ) ) ( not ( = ?auto_62355 ?auto_62358 ) ) ( not ( = ?auto_62356 ?auto_62360 ) ) ( not ( = ?auto_62356 ?auto_62358 ) ) ( not ( = ?auto_62357 ?auto_62360 ) ) ( not ( = ?auto_62357 ?auto_62358 ) ) ( not ( = ?auto_62360 ?auto_62358 ) ) ( ON ?auto_62360 ?auto_62357 ) ( not ( = ?auto_62359 ?auto_62358 ) ) ( not ( = ?auto_62355 ?auto_62359 ) ) ( not ( = ?auto_62356 ?auto_62359 ) ) ( not ( = ?auto_62357 ?auto_62359 ) ) ( not ( = ?auto_62360 ?auto_62359 ) ) ( ON ?auto_62358 ?auto_62360 ) ( HOLDING ?auto_62359 ) ( CLEAR ?auto_62358 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62355 ?auto_62356 ?auto_62357 ?auto_62360 ?auto_62358 ?auto_62359 )
      ( MAKE-2PILE ?auto_62355 ?auto_62356 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62361 - BLOCK
      ?auto_62362 - BLOCK
    )
    :vars
    (
      ?auto_62364 - BLOCK
      ?auto_62363 - BLOCK
      ?auto_62366 - BLOCK
      ?auto_62365 - BLOCK
      ?auto_62367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62364 ?auto_62362 ) ( ON-TABLE ?auto_62361 ) ( ON ?auto_62362 ?auto_62361 ) ( not ( = ?auto_62361 ?auto_62362 ) ) ( not ( = ?auto_62361 ?auto_62364 ) ) ( not ( = ?auto_62362 ?auto_62364 ) ) ( not ( = ?auto_62361 ?auto_62363 ) ) ( not ( = ?auto_62361 ?auto_62366 ) ) ( not ( = ?auto_62362 ?auto_62363 ) ) ( not ( = ?auto_62362 ?auto_62366 ) ) ( not ( = ?auto_62364 ?auto_62363 ) ) ( not ( = ?auto_62364 ?auto_62366 ) ) ( not ( = ?auto_62363 ?auto_62366 ) ) ( ON ?auto_62363 ?auto_62364 ) ( not ( = ?auto_62365 ?auto_62366 ) ) ( not ( = ?auto_62361 ?auto_62365 ) ) ( not ( = ?auto_62362 ?auto_62365 ) ) ( not ( = ?auto_62364 ?auto_62365 ) ) ( not ( = ?auto_62363 ?auto_62365 ) ) ( ON ?auto_62366 ?auto_62363 ) ( CLEAR ?auto_62366 ) ( ON ?auto_62365 ?auto_62367 ) ( CLEAR ?auto_62365 ) ( HAND-EMPTY ) ( not ( = ?auto_62361 ?auto_62367 ) ) ( not ( = ?auto_62362 ?auto_62367 ) ) ( not ( = ?auto_62364 ?auto_62367 ) ) ( not ( = ?auto_62363 ?auto_62367 ) ) ( not ( = ?auto_62366 ?auto_62367 ) ) ( not ( = ?auto_62365 ?auto_62367 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62365 ?auto_62367 )
      ( MAKE-2PILE ?auto_62361 ?auto_62362 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62368 - BLOCK
      ?auto_62369 - BLOCK
    )
    :vars
    (
      ?auto_62370 - BLOCK
      ?auto_62371 - BLOCK
      ?auto_62373 - BLOCK
      ?auto_62374 - BLOCK
      ?auto_62372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62370 ?auto_62369 ) ( ON-TABLE ?auto_62368 ) ( ON ?auto_62369 ?auto_62368 ) ( not ( = ?auto_62368 ?auto_62369 ) ) ( not ( = ?auto_62368 ?auto_62370 ) ) ( not ( = ?auto_62369 ?auto_62370 ) ) ( not ( = ?auto_62368 ?auto_62371 ) ) ( not ( = ?auto_62368 ?auto_62373 ) ) ( not ( = ?auto_62369 ?auto_62371 ) ) ( not ( = ?auto_62369 ?auto_62373 ) ) ( not ( = ?auto_62370 ?auto_62371 ) ) ( not ( = ?auto_62370 ?auto_62373 ) ) ( not ( = ?auto_62371 ?auto_62373 ) ) ( ON ?auto_62371 ?auto_62370 ) ( not ( = ?auto_62374 ?auto_62373 ) ) ( not ( = ?auto_62368 ?auto_62374 ) ) ( not ( = ?auto_62369 ?auto_62374 ) ) ( not ( = ?auto_62370 ?auto_62374 ) ) ( not ( = ?auto_62371 ?auto_62374 ) ) ( ON ?auto_62374 ?auto_62372 ) ( CLEAR ?auto_62374 ) ( not ( = ?auto_62368 ?auto_62372 ) ) ( not ( = ?auto_62369 ?auto_62372 ) ) ( not ( = ?auto_62370 ?auto_62372 ) ) ( not ( = ?auto_62371 ?auto_62372 ) ) ( not ( = ?auto_62373 ?auto_62372 ) ) ( not ( = ?auto_62374 ?auto_62372 ) ) ( HOLDING ?auto_62373 ) ( CLEAR ?auto_62371 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62368 ?auto_62369 ?auto_62370 ?auto_62371 ?auto_62373 )
      ( MAKE-2PILE ?auto_62368 ?auto_62369 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62375 - BLOCK
      ?auto_62376 - BLOCK
    )
    :vars
    (
      ?auto_62377 - BLOCK
      ?auto_62379 - BLOCK
      ?auto_62380 - BLOCK
      ?auto_62381 - BLOCK
      ?auto_62378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62377 ?auto_62376 ) ( ON-TABLE ?auto_62375 ) ( ON ?auto_62376 ?auto_62375 ) ( not ( = ?auto_62375 ?auto_62376 ) ) ( not ( = ?auto_62375 ?auto_62377 ) ) ( not ( = ?auto_62376 ?auto_62377 ) ) ( not ( = ?auto_62375 ?auto_62379 ) ) ( not ( = ?auto_62375 ?auto_62380 ) ) ( not ( = ?auto_62376 ?auto_62379 ) ) ( not ( = ?auto_62376 ?auto_62380 ) ) ( not ( = ?auto_62377 ?auto_62379 ) ) ( not ( = ?auto_62377 ?auto_62380 ) ) ( not ( = ?auto_62379 ?auto_62380 ) ) ( ON ?auto_62379 ?auto_62377 ) ( not ( = ?auto_62381 ?auto_62380 ) ) ( not ( = ?auto_62375 ?auto_62381 ) ) ( not ( = ?auto_62376 ?auto_62381 ) ) ( not ( = ?auto_62377 ?auto_62381 ) ) ( not ( = ?auto_62379 ?auto_62381 ) ) ( ON ?auto_62381 ?auto_62378 ) ( not ( = ?auto_62375 ?auto_62378 ) ) ( not ( = ?auto_62376 ?auto_62378 ) ) ( not ( = ?auto_62377 ?auto_62378 ) ) ( not ( = ?auto_62379 ?auto_62378 ) ) ( not ( = ?auto_62380 ?auto_62378 ) ) ( not ( = ?auto_62381 ?auto_62378 ) ) ( CLEAR ?auto_62379 ) ( ON ?auto_62380 ?auto_62381 ) ( CLEAR ?auto_62380 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62378 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62378 ?auto_62381 )
      ( MAKE-2PILE ?auto_62375 ?auto_62376 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62382 - BLOCK
      ?auto_62383 - BLOCK
    )
    :vars
    (
      ?auto_62384 - BLOCK
      ?auto_62387 - BLOCK
      ?auto_62386 - BLOCK
      ?auto_62388 - BLOCK
      ?auto_62385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62384 ?auto_62383 ) ( ON-TABLE ?auto_62382 ) ( ON ?auto_62383 ?auto_62382 ) ( not ( = ?auto_62382 ?auto_62383 ) ) ( not ( = ?auto_62382 ?auto_62384 ) ) ( not ( = ?auto_62383 ?auto_62384 ) ) ( not ( = ?auto_62382 ?auto_62387 ) ) ( not ( = ?auto_62382 ?auto_62386 ) ) ( not ( = ?auto_62383 ?auto_62387 ) ) ( not ( = ?auto_62383 ?auto_62386 ) ) ( not ( = ?auto_62384 ?auto_62387 ) ) ( not ( = ?auto_62384 ?auto_62386 ) ) ( not ( = ?auto_62387 ?auto_62386 ) ) ( not ( = ?auto_62388 ?auto_62386 ) ) ( not ( = ?auto_62382 ?auto_62388 ) ) ( not ( = ?auto_62383 ?auto_62388 ) ) ( not ( = ?auto_62384 ?auto_62388 ) ) ( not ( = ?auto_62387 ?auto_62388 ) ) ( ON ?auto_62388 ?auto_62385 ) ( not ( = ?auto_62382 ?auto_62385 ) ) ( not ( = ?auto_62383 ?auto_62385 ) ) ( not ( = ?auto_62384 ?auto_62385 ) ) ( not ( = ?auto_62387 ?auto_62385 ) ) ( not ( = ?auto_62386 ?auto_62385 ) ) ( not ( = ?auto_62388 ?auto_62385 ) ) ( ON ?auto_62386 ?auto_62388 ) ( CLEAR ?auto_62386 ) ( ON-TABLE ?auto_62385 ) ( HOLDING ?auto_62387 ) ( CLEAR ?auto_62384 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62382 ?auto_62383 ?auto_62384 ?auto_62387 )
      ( MAKE-2PILE ?auto_62382 ?auto_62383 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62389 - BLOCK
      ?auto_62390 - BLOCK
    )
    :vars
    (
      ?auto_62393 - BLOCK
      ?auto_62395 - BLOCK
      ?auto_62394 - BLOCK
      ?auto_62391 - BLOCK
      ?auto_62392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62393 ?auto_62390 ) ( ON-TABLE ?auto_62389 ) ( ON ?auto_62390 ?auto_62389 ) ( not ( = ?auto_62389 ?auto_62390 ) ) ( not ( = ?auto_62389 ?auto_62393 ) ) ( not ( = ?auto_62390 ?auto_62393 ) ) ( not ( = ?auto_62389 ?auto_62395 ) ) ( not ( = ?auto_62389 ?auto_62394 ) ) ( not ( = ?auto_62390 ?auto_62395 ) ) ( not ( = ?auto_62390 ?auto_62394 ) ) ( not ( = ?auto_62393 ?auto_62395 ) ) ( not ( = ?auto_62393 ?auto_62394 ) ) ( not ( = ?auto_62395 ?auto_62394 ) ) ( not ( = ?auto_62391 ?auto_62394 ) ) ( not ( = ?auto_62389 ?auto_62391 ) ) ( not ( = ?auto_62390 ?auto_62391 ) ) ( not ( = ?auto_62393 ?auto_62391 ) ) ( not ( = ?auto_62395 ?auto_62391 ) ) ( ON ?auto_62391 ?auto_62392 ) ( not ( = ?auto_62389 ?auto_62392 ) ) ( not ( = ?auto_62390 ?auto_62392 ) ) ( not ( = ?auto_62393 ?auto_62392 ) ) ( not ( = ?auto_62395 ?auto_62392 ) ) ( not ( = ?auto_62394 ?auto_62392 ) ) ( not ( = ?auto_62391 ?auto_62392 ) ) ( ON ?auto_62394 ?auto_62391 ) ( ON-TABLE ?auto_62392 ) ( CLEAR ?auto_62393 ) ( ON ?auto_62395 ?auto_62394 ) ( CLEAR ?auto_62395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62392 ?auto_62391 ?auto_62394 )
      ( MAKE-2PILE ?auto_62389 ?auto_62390 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62410 - BLOCK
      ?auto_62411 - BLOCK
    )
    :vars
    (
      ?auto_62414 - BLOCK
      ?auto_62416 - BLOCK
      ?auto_62415 - BLOCK
      ?auto_62412 - BLOCK
      ?auto_62413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62410 ) ( not ( = ?auto_62410 ?auto_62411 ) ) ( not ( = ?auto_62410 ?auto_62414 ) ) ( not ( = ?auto_62411 ?auto_62414 ) ) ( not ( = ?auto_62410 ?auto_62416 ) ) ( not ( = ?auto_62410 ?auto_62415 ) ) ( not ( = ?auto_62411 ?auto_62416 ) ) ( not ( = ?auto_62411 ?auto_62415 ) ) ( not ( = ?auto_62414 ?auto_62416 ) ) ( not ( = ?auto_62414 ?auto_62415 ) ) ( not ( = ?auto_62416 ?auto_62415 ) ) ( not ( = ?auto_62412 ?auto_62415 ) ) ( not ( = ?auto_62410 ?auto_62412 ) ) ( not ( = ?auto_62411 ?auto_62412 ) ) ( not ( = ?auto_62414 ?auto_62412 ) ) ( not ( = ?auto_62416 ?auto_62412 ) ) ( ON ?auto_62412 ?auto_62413 ) ( not ( = ?auto_62410 ?auto_62413 ) ) ( not ( = ?auto_62411 ?auto_62413 ) ) ( not ( = ?auto_62414 ?auto_62413 ) ) ( not ( = ?auto_62416 ?auto_62413 ) ) ( not ( = ?auto_62415 ?auto_62413 ) ) ( not ( = ?auto_62412 ?auto_62413 ) ) ( ON ?auto_62415 ?auto_62412 ) ( ON-TABLE ?auto_62413 ) ( ON ?auto_62416 ?auto_62415 ) ( ON ?auto_62414 ?auto_62416 ) ( CLEAR ?auto_62414 ) ( HOLDING ?auto_62411 ) ( CLEAR ?auto_62410 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62410 ?auto_62411 ?auto_62414 )
      ( MAKE-2PILE ?auto_62410 ?auto_62411 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62417 - BLOCK
      ?auto_62418 - BLOCK
    )
    :vars
    (
      ?auto_62423 - BLOCK
      ?auto_62422 - BLOCK
      ?auto_62421 - BLOCK
      ?auto_62419 - BLOCK
      ?auto_62420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62417 ) ( not ( = ?auto_62417 ?auto_62418 ) ) ( not ( = ?auto_62417 ?auto_62423 ) ) ( not ( = ?auto_62418 ?auto_62423 ) ) ( not ( = ?auto_62417 ?auto_62422 ) ) ( not ( = ?auto_62417 ?auto_62421 ) ) ( not ( = ?auto_62418 ?auto_62422 ) ) ( not ( = ?auto_62418 ?auto_62421 ) ) ( not ( = ?auto_62423 ?auto_62422 ) ) ( not ( = ?auto_62423 ?auto_62421 ) ) ( not ( = ?auto_62422 ?auto_62421 ) ) ( not ( = ?auto_62419 ?auto_62421 ) ) ( not ( = ?auto_62417 ?auto_62419 ) ) ( not ( = ?auto_62418 ?auto_62419 ) ) ( not ( = ?auto_62423 ?auto_62419 ) ) ( not ( = ?auto_62422 ?auto_62419 ) ) ( ON ?auto_62419 ?auto_62420 ) ( not ( = ?auto_62417 ?auto_62420 ) ) ( not ( = ?auto_62418 ?auto_62420 ) ) ( not ( = ?auto_62423 ?auto_62420 ) ) ( not ( = ?auto_62422 ?auto_62420 ) ) ( not ( = ?auto_62421 ?auto_62420 ) ) ( not ( = ?auto_62419 ?auto_62420 ) ) ( ON ?auto_62421 ?auto_62419 ) ( ON-TABLE ?auto_62420 ) ( ON ?auto_62422 ?auto_62421 ) ( ON ?auto_62423 ?auto_62422 ) ( CLEAR ?auto_62417 ) ( ON ?auto_62418 ?auto_62423 ) ( CLEAR ?auto_62418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62420 ?auto_62419 ?auto_62421 ?auto_62422 ?auto_62423 )
      ( MAKE-2PILE ?auto_62417 ?auto_62418 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62424 - BLOCK
      ?auto_62425 - BLOCK
    )
    :vars
    (
      ?auto_62429 - BLOCK
      ?auto_62427 - BLOCK
      ?auto_62428 - BLOCK
      ?auto_62430 - BLOCK
      ?auto_62426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62424 ?auto_62425 ) ) ( not ( = ?auto_62424 ?auto_62429 ) ) ( not ( = ?auto_62425 ?auto_62429 ) ) ( not ( = ?auto_62424 ?auto_62427 ) ) ( not ( = ?auto_62424 ?auto_62428 ) ) ( not ( = ?auto_62425 ?auto_62427 ) ) ( not ( = ?auto_62425 ?auto_62428 ) ) ( not ( = ?auto_62429 ?auto_62427 ) ) ( not ( = ?auto_62429 ?auto_62428 ) ) ( not ( = ?auto_62427 ?auto_62428 ) ) ( not ( = ?auto_62430 ?auto_62428 ) ) ( not ( = ?auto_62424 ?auto_62430 ) ) ( not ( = ?auto_62425 ?auto_62430 ) ) ( not ( = ?auto_62429 ?auto_62430 ) ) ( not ( = ?auto_62427 ?auto_62430 ) ) ( ON ?auto_62430 ?auto_62426 ) ( not ( = ?auto_62424 ?auto_62426 ) ) ( not ( = ?auto_62425 ?auto_62426 ) ) ( not ( = ?auto_62429 ?auto_62426 ) ) ( not ( = ?auto_62427 ?auto_62426 ) ) ( not ( = ?auto_62428 ?auto_62426 ) ) ( not ( = ?auto_62430 ?auto_62426 ) ) ( ON ?auto_62428 ?auto_62430 ) ( ON-TABLE ?auto_62426 ) ( ON ?auto_62427 ?auto_62428 ) ( ON ?auto_62429 ?auto_62427 ) ( ON ?auto_62425 ?auto_62429 ) ( CLEAR ?auto_62425 ) ( HOLDING ?auto_62424 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62424 )
      ( MAKE-2PILE ?auto_62424 ?auto_62425 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62431 - BLOCK
      ?auto_62432 - BLOCK
    )
    :vars
    (
      ?auto_62436 - BLOCK
      ?auto_62435 - BLOCK
      ?auto_62434 - BLOCK
      ?auto_62437 - BLOCK
      ?auto_62433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62431 ?auto_62432 ) ) ( not ( = ?auto_62431 ?auto_62436 ) ) ( not ( = ?auto_62432 ?auto_62436 ) ) ( not ( = ?auto_62431 ?auto_62435 ) ) ( not ( = ?auto_62431 ?auto_62434 ) ) ( not ( = ?auto_62432 ?auto_62435 ) ) ( not ( = ?auto_62432 ?auto_62434 ) ) ( not ( = ?auto_62436 ?auto_62435 ) ) ( not ( = ?auto_62436 ?auto_62434 ) ) ( not ( = ?auto_62435 ?auto_62434 ) ) ( not ( = ?auto_62437 ?auto_62434 ) ) ( not ( = ?auto_62431 ?auto_62437 ) ) ( not ( = ?auto_62432 ?auto_62437 ) ) ( not ( = ?auto_62436 ?auto_62437 ) ) ( not ( = ?auto_62435 ?auto_62437 ) ) ( ON ?auto_62437 ?auto_62433 ) ( not ( = ?auto_62431 ?auto_62433 ) ) ( not ( = ?auto_62432 ?auto_62433 ) ) ( not ( = ?auto_62436 ?auto_62433 ) ) ( not ( = ?auto_62435 ?auto_62433 ) ) ( not ( = ?auto_62434 ?auto_62433 ) ) ( not ( = ?auto_62437 ?auto_62433 ) ) ( ON ?auto_62434 ?auto_62437 ) ( ON-TABLE ?auto_62433 ) ( ON ?auto_62435 ?auto_62434 ) ( ON ?auto_62436 ?auto_62435 ) ( ON ?auto_62432 ?auto_62436 ) ( ON ?auto_62431 ?auto_62432 ) ( CLEAR ?auto_62431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62433 ?auto_62437 ?auto_62434 ?auto_62435 ?auto_62436 ?auto_62432 )
      ( MAKE-2PILE ?auto_62431 ?auto_62432 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62442 - BLOCK
      ?auto_62443 - BLOCK
      ?auto_62444 - BLOCK
      ?auto_62445 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_62445 ) ( CLEAR ?auto_62444 ) ( ON-TABLE ?auto_62442 ) ( ON ?auto_62443 ?auto_62442 ) ( ON ?auto_62444 ?auto_62443 ) ( not ( = ?auto_62442 ?auto_62443 ) ) ( not ( = ?auto_62442 ?auto_62444 ) ) ( not ( = ?auto_62442 ?auto_62445 ) ) ( not ( = ?auto_62443 ?auto_62444 ) ) ( not ( = ?auto_62443 ?auto_62445 ) ) ( not ( = ?auto_62444 ?auto_62445 ) ) )
    :subtasks
    ( ( !STACK ?auto_62445 ?auto_62444 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62446 - BLOCK
      ?auto_62447 - BLOCK
      ?auto_62448 - BLOCK
      ?auto_62449 - BLOCK
    )
    :vars
    (
      ?auto_62450 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62448 ) ( ON-TABLE ?auto_62446 ) ( ON ?auto_62447 ?auto_62446 ) ( ON ?auto_62448 ?auto_62447 ) ( not ( = ?auto_62446 ?auto_62447 ) ) ( not ( = ?auto_62446 ?auto_62448 ) ) ( not ( = ?auto_62446 ?auto_62449 ) ) ( not ( = ?auto_62447 ?auto_62448 ) ) ( not ( = ?auto_62447 ?auto_62449 ) ) ( not ( = ?auto_62448 ?auto_62449 ) ) ( ON ?auto_62449 ?auto_62450 ) ( CLEAR ?auto_62449 ) ( HAND-EMPTY ) ( not ( = ?auto_62446 ?auto_62450 ) ) ( not ( = ?auto_62447 ?auto_62450 ) ) ( not ( = ?auto_62448 ?auto_62450 ) ) ( not ( = ?auto_62449 ?auto_62450 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62449 ?auto_62450 )
      ( MAKE-4PILE ?auto_62446 ?auto_62447 ?auto_62448 ?auto_62449 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62451 - BLOCK
      ?auto_62452 - BLOCK
      ?auto_62453 - BLOCK
      ?auto_62454 - BLOCK
    )
    :vars
    (
      ?auto_62455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62451 ) ( ON ?auto_62452 ?auto_62451 ) ( not ( = ?auto_62451 ?auto_62452 ) ) ( not ( = ?auto_62451 ?auto_62453 ) ) ( not ( = ?auto_62451 ?auto_62454 ) ) ( not ( = ?auto_62452 ?auto_62453 ) ) ( not ( = ?auto_62452 ?auto_62454 ) ) ( not ( = ?auto_62453 ?auto_62454 ) ) ( ON ?auto_62454 ?auto_62455 ) ( CLEAR ?auto_62454 ) ( not ( = ?auto_62451 ?auto_62455 ) ) ( not ( = ?auto_62452 ?auto_62455 ) ) ( not ( = ?auto_62453 ?auto_62455 ) ) ( not ( = ?auto_62454 ?auto_62455 ) ) ( HOLDING ?auto_62453 ) ( CLEAR ?auto_62452 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62451 ?auto_62452 ?auto_62453 )
      ( MAKE-4PILE ?auto_62451 ?auto_62452 ?auto_62453 ?auto_62454 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62456 - BLOCK
      ?auto_62457 - BLOCK
      ?auto_62458 - BLOCK
      ?auto_62459 - BLOCK
    )
    :vars
    (
      ?auto_62460 - BLOCK
      ?auto_62461 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62456 ) ( ON ?auto_62457 ?auto_62456 ) ( not ( = ?auto_62456 ?auto_62457 ) ) ( not ( = ?auto_62456 ?auto_62458 ) ) ( not ( = ?auto_62456 ?auto_62459 ) ) ( not ( = ?auto_62457 ?auto_62458 ) ) ( not ( = ?auto_62457 ?auto_62459 ) ) ( not ( = ?auto_62458 ?auto_62459 ) ) ( ON ?auto_62459 ?auto_62460 ) ( not ( = ?auto_62456 ?auto_62460 ) ) ( not ( = ?auto_62457 ?auto_62460 ) ) ( not ( = ?auto_62458 ?auto_62460 ) ) ( not ( = ?auto_62459 ?auto_62460 ) ) ( CLEAR ?auto_62457 ) ( ON ?auto_62458 ?auto_62459 ) ( CLEAR ?auto_62458 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62461 ) ( ON ?auto_62460 ?auto_62461 ) ( not ( = ?auto_62461 ?auto_62460 ) ) ( not ( = ?auto_62461 ?auto_62459 ) ) ( not ( = ?auto_62461 ?auto_62458 ) ) ( not ( = ?auto_62456 ?auto_62461 ) ) ( not ( = ?auto_62457 ?auto_62461 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62461 ?auto_62460 ?auto_62459 )
      ( MAKE-4PILE ?auto_62456 ?auto_62457 ?auto_62458 ?auto_62459 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62462 - BLOCK
      ?auto_62463 - BLOCK
      ?auto_62464 - BLOCK
      ?auto_62465 - BLOCK
    )
    :vars
    (
      ?auto_62466 - BLOCK
      ?auto_62467 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62462 ) ( not ( = ?auto_62462 ?auto_62463 ) ) ( not ( = ?auto_62462 ?auto_62464 ) ) ( not ( = ?auto_62462 ?auto_62465 ) ) ( not ( = ?auto_62463 ?auto_62464 ) ) ( not ( = ?auto_62463 ?auto_62465 ) ) ( not ( = ?auto_62464 ?auto_62465 ) ) ( ON ?auto_62465 ?auto_62466 ) ( not ( = ?auto_62462 ?auto_62466 ) ) ( not ( = ?auto_62463 ?auto_62466 ) ) ( not ( = ?auto_62464 ?auto_62466 ) ) ( not ( = ?auto_62465 ?auto_62466 ) ) ( ON ?auto_62464 ?auto_62465 ) ( CLEAR ?auto_62464 ) ( ON-TABLE ?auto_62467 ) ( ON ?auto_62466 ?auto_62467 ) ( not ( = ?auto_62467 ?auto_62466 ) ) ( not ( = ?auto_62467 ?auto_62465 ) ) ( not ( = ?auto_62467 ?auto_62464 ) ) ( not ( = ?auto_62462 ?auto_62467 ) ) ( not ( = ?auto_62463 ?auto_62467 ) ) ( HOLDING ?auto_62463 ) ( CLEAR ?auto_62462 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62462 ?auto_62463 )
      ( MAKE-4PILE ?auto_62462 ?auto_62463 ?auto_62464 ?auto_62465 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62468 - BLOCK
      ?auto_62469 - BLOCK
      ?auto_62470 - BLOCK
      ?auto_62471 - BLOCK
    )
    :vars
    (
      ?auto_62472 - BLOCK
      ?auto_62473 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62468 ) ( not ( = ?auto_62468 ?auto_62469 ) ) ( not ( = ?auto_62468 ?auto_62470 ) ) ( not ( = ?auto_62468 ?auto_62471 ) ) ( not ( = ?auto_62469 ?auto_62470 ) ) ( not ( = ?auto_62469 ?auto_62471 ) ) ( not ( = ?auto_62470 ?auto_62471 ) ) ( ON ?auto_62471 ?auto_62472 ) ( not ( = ?auto_62468 ?auto_62472 ) ) ( not ( = ?auto_62469 ?auto_62472 ) ) ( not ( = ?auto_62470 ?auto_62472 ) ) ( not ( = ?auto_62471 ?auto_62472 ) ) ( ON ?auto_62470 ?auto_62471 ) ( ON-TABLE ?auto_62473 ) ( ON ?auto_62472 ?auto_62473 ) ( not ( = ?auto_62473 ?auto_62472 ) ) ( not ( = ?auto_62473 ?auto_62471 ) ) ( not ( = ?auto_62473 ?auto_62470 ) ) ( not ( = ?auto_62468 ?auto_62473 ) ) ( not ( = ?auto_62469 ?auto_62473 ) ) ( CLEAR ?auto_62468 ) ( ON ?auto_62469 ?auto_62470 ) ( CLEAR ?auto_62469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62473 ?auto_62472 ?auto_62471 ?auto_62470 )
      ( MAKE-4PILE ?auto_62468 ?auto_62469 ?auto_62470 ?auto_62471 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62474 - BLOCK
      ?auto_62475 - BLOCK
      ?auto_62476 - BLOCK
      ?auto_62477 - BLOCK
    )
    :vars
    (
      ?auto_62478 - BLOCK
      ?auto_62479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62474 ?auto_62475 ) ) ( not ( = ?auto_62474 ?auto_62476 ) ) ( not ( = ?auto_62474 ?auto_62477 ) ) ( not ( = ?auto_62475 ?auto_62476 ) ) ( not ( = ?auto_62475 ?auto_62477 ) ) ( not ( = ?auto_62476 ?auto_62477 ) ) ( ON ?auto_62477 ?auto_62478 ) ( not ( = ?auto_62474 ?auto_62478 ) ) ( not ( = ?auto_62475 ?auto_62478 ) ) ( not ( = ?auto_62476 ?auto_62478 ) ) ( not ( = ?auto_62477 ?auto_62478 ) ) ( ON ?auto_62476 ?auto_62477 ) ( ON-TABLE ?auto_62479 ) ( ON ?auto_62478 ?auto_62479 ) ( not ( = ?auto_62479 ?auto_62478 ) ) ( not ( = ?auto_62479 ?auto_62477 ) ) ( not ( = ?auto_62479 ?auto_62476 ) ) ( not ( = ?auto_62474 ?auto_62479 ) ) ( not ( = ?auto_62475 ?auto_62479 ) ) ( ON ?auto_62475 ?auto_62476 ) ( CLEAR ?auto_62475 ) ( HOLDING ?auto_62474 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62474 )
      ( MAKE-4PILE ?auto_62474 ?auto_62475 ?auto_62476 ?auto_62477 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62480 - BLOCK
      ?auto_62481 - BLOCK
      ?auto_62482 - BLOCK
      ?auto_62483 - BLOCK
    )
    :vars
    (
      ?auto_62485 - BLOCK
      ?auto_62484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62480 ?auto_62481 ) ) ( not ( = ?auto_62480 ?auto_62482 ) ) ( not ( = ?auto_62480 ?auto_62483 ) ) ( not ( = ?auto_62481 ?auto_62482 ) ) ( not ( = ?auto_62481 ?auto_62483 ) ) ( not ( = ?auto_62482 ?auto_62483 ) ) ( ON ?auto_62483 ?auto_62485 ) ( not ( = ?auto_62480 ?auto_62485 ) ) ( not ( = ?auto_62481 ?auto_62485 ) ) ( not ( = ?auto_62482 ?auto_62485 ) ) ( not ( = ?auto_62483 ?auto_62485 ) ) ( ON ?auto_62482 ?auto_62483 ) ( ON-TABLE ?auto_62484 ) ( ON ?auto_62485 ?auto_62484 ) ( not ( = ?auto_62484 ?auto_62485 ) ) ( not ( = ?auto_62484 ?auto_62483 ) ) ( not ( = ?auto_62484 ?auto_62482 ) ) ( not ( = ?auto_62480 ?auto_62484 ) ) ( not ( = ?auto_62481 ?auto_62484 ) ) ( ON ?auto_62481 ?auto_62482 ) ( ON ?auto_62480 ?auto_62481 ) ( CLEAR ?auto_62480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62484 ?auto_62485 ?auto_62483 ?auto_62482 ?auto_62481 )
      ( MAKE-4PILE ?auto_62480 ?auto_62481 ?auto_62482 ?auto_62483 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62486 - BLOCK
      ?auto_62487 - BLOCK
      ?auto_62488 - BLOCK
      ?auto_62489 - BLOCK
    )
    :vars
    (
      ?auto_62490 - BLOCK
      ?auto_62491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62486 ?auto_62487 ) ) ( not ( = ?auto_62486 ?auto_62488 ) ) ( not ( = ?auto_62486 ?auto_62489 ) ) ( not ( = ?auto_62487 ?auto_62488 ) ) ( not ( = ?auto_62487 ?auto_62489 ) ) ( not ( = ?auto_62488 ?auto_62489 ) ) ( ON ?auto_62489 ?auto_62490 ) ( not ( = ?auto_62486 ?auto_62490 ) ) ( not ( = ?auto_62487 ?auto_62490 ) ) ( not ( = ?auto_62488 ?auto_62490 ) ) ( not ( = ?auto_62489 ?auto_62490 ) ) ( ON ?auto_62488 ?auto_62489 ) ( ON-TABLE ?auto_62491 ) ( ON ?auto_62490 ?auto_62491 ) ( not ( = ?auto_62491 ?auto_62490 ) ) ( not ( = ?auto_62491 ?auto_62489 ) ) ( not ( = ?auto_62491 ?auto_62488 ) ) ( not ( = ?auto_62486 ?auto_62491 ) ) ( not ( = ?auto_62487 ?auto_62491 ) ) ( ON ?auto_62487 ?auto_62488 ) ( HOLDING ?auto_62486 ) ( CLEAR ?auto_62487 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62491 ?auto_62490 ?auto_62489 ?auto_62488 ?auto_62487 ?auto_62486 )
      ( MAKE-4PILE ?auto_62486 ?auto_62487 ?auto_62488 ?auto_62489 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62492 - BLOCK
      ?auto_62493 - BLOCK
      ?auto_62494 - BLOCK
      ?auto_62495 - BLOCK
    )
    :vars
    (
      ?auto_62497 - BLOCK
      ?auto_62496 - BLOCK
      ?auto_62498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62492 ?auto_62493 ) ) ( not ( = ?auto_62492 ?auto_62494 ) ) ( not ( = ?auto_62492 ?auto_62495 ) ) ( not ( = ?auto_62493 ?auto_62494 ) ) ( not ( = ?auto_62493 ?auto_62495 ) ) ( not ( = ?auto_62494 ?auto_62495 ) ) ( ON ?auto_62495 ?auto_62497 ) ( not ( = ?auto_62492 ?auto_62497 ) ) ( not ( = ?auto_62493 ?auto_62497 ) ) ( not ( = ?auto_62494 ?auto_62497 ) ) ( not ( = ?auto_62495 ?auto_62497 ) ) ( ON ?auto_62494 ?auto_62495 ) ( ON-TABLE ?auto_62496 ) ( ON ?auto_62497 ?auto_62496 ) ( not ( = ?auto_62496 ?auto_62497 ) ) ( not ( = ?auto_62496 ?auto_62495 ) ) ( not ( = ?auto_62496 ?auto_62494 ) ) ( not ( = ?auto_62492 ?auto_62496 ) ) ( not ( = ?auto_62493 ?auto_62496 ) ) ( ON ?auto_62493 ?auto_62494 ) ( CLEAR ?auto_62493 ) ( ON ?auto_62492 ?auto_62498 ) ( CLEAR ?auto_62492 ) ( HAND-EMPTY ) ( not ( = ?auto_62492 ?auto_62498 ) ) ( not ( = ?auto_62493 ?auto_62498 ) ) ( not ( = ?auto_62494 ?auto_62498 ) ) ( not ( = ?auto_62495 ?auto_62498 ) ) ( not ( = ?auto_62497 ?auto_62498 ) ) ( not ( = ?auto_62496 ?auto_62498 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62492 ?auto_62498 )
      ( MAKE-4PILE ?auto_62492 ?auto_62493 ?auto_62494 ?auto_62495 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62499 - BLOCK
      ?auto_62500 - BLOCK
      ?auto_62501 - BLOCK
      ?auto_62502 - BLOCK
    )
    :vars
    (
      ?auto_62504 - BLOCK
      ?auto_62505 - BLOCK
      ?auto_62503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62499 ?auto_62500 ) ) ( not ( = ?auto_62499 ?auto_62501 ) ) ( not ( = ?auto_62499 ?auto_62502 ) ) ( not ( = ?auto_62500 ?auto_62501 ) ) ( not ( = ?auto_62500 ?auto_62502 ) ) ( not ( = ?auto_62501 ?auto_62502 ) ) ( ON ?auto_62502 ?auto_62504 ) ( not ( = ?auto_62499 ?auto_62504 ) ) ( not ( = ?auto_62500 ?auto_62504 ) ) ( not ( = ?auto_62501 ?auto_62504 ) ) ( not ( = ?auto_62502 ?auto_62504 ) ) ( ON ?auto_62501 ?auto_62502 ) ( ON-TABLE ?auto_62505 ) ( ON ?auto_62504 ?auto_62505 ) ( not ( = ?auto_62505 ?auto_62504 ) ) ( not ( = ?auto_62505 ?auto_62502 ) ) ( not ( = ?auto_62505 ?auto_62501 ) ) ( not ( = ?auto_62499 ?auto_62505 ) ) ( not ( = ?auto_62500 ?auto_62505 ) ) ( ON ?auto_62499 ?auto_62503 ) ( CLEAR ?auto_62499 ) ( not ( = ?auto_62499 ?auto_62503 ) ) ( not ( = ?auto_62500 ?auto_62503 ) ) ( not ( = ?auto_62501 ?auto_62503 ) ) ( not ( = ?auto_62502 ?auto_62503 ) ) ( not ( = ?auto_62504 ?auto_62503 ) ) ( not ( = ?auto_62505 ?auto_62503 ) ) ( HOLDING ?auto_62500 ) ( CLEAR ?auto_62501 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62505 ?auto_62504 ?auto_62502 ?auto_62501 ?auto_62500 )
      ( MAKE-4PILE ?auto_62499 ?auto_62500 ?auto_62501 ?auto_62502 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62506 - BLOCK
      ?auto_62507 - BLOCK
      ?auto_62508 - BLOCK
      ?auto_62509 - BLOCK
    )
    :vars
    (
      ?auto_62512 - BLOCK
      ?auto_62511 - BLOCK
      ?auto_62510 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62506 ?auto_62507 ) ) ( not ( = ?auto_62506 ?auto_62508 ) ) ( not ( = ?auto_62506 ?auto_62509 ) ) ( not ( = ?auto_62507 ?auto_62508 ) ) ( not ( = ?auto_62507 ?auto_62509 ) ) ( not ( = ?auto_62508 ?auto_62509 ) ) ( ON ?auto_62509 ?auto_62512 ) ( not ( = ?auto_62506 ?auto_62512 ) ) ( not ( = ?auto_62507 ?auto_62512 ) ) ( not ( = ?auto_62508 ?auto_62512 ) ) ( not ( = ?auto_62509 ?auto_62512 ) ) ( ON ?auto_62508 ?auto_62509 ) ( ON-TABLE ?auto_62511 ) ( ON ?auto_62512 ?auto_62511 ) ( not ( = ?auto_62511 ?auto_62512 ) ) ( not ( = ?auto_62511 ?auto_62509 ) ) ( not ( = ?auto_62511 ?auto_62508 ) ) ( not ( = ?auto_62506 ?auto_62511 ) ) ( not ( = ?auto_62507 ?auto_62511 ) ) ( ON ?auto_62506 ?auto_62510 ) ( not ( = ?auto_62506 ?auto_62510 ) ) ( not ( = ?auto_62507 ?auto_62510 ) ) ( not ( = ?auto_62508 ?auto_62510 ) ) ( not ( = ?auto_62509 ?auto_62510 ) ) ( not ( = ?auto_62512 ?auto_62510 ) ) ( not ( = ?auto_62511 ?auto_62510 ) ) ( CLEAR ?auto_62508 ) ( ON ?auto_62507 ?auto_62506 ) ( CLEAR ?auto_62507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62510 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62510 ?auto_62506 )
      ( MAKE-4PILE ?auto_62506 ?auto_62507 ?auto_62508 ?auto_62509 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62513 - BLOCK
      ?auto_62514 - BLOCK
      ?auto_62515 - BLOCK
      ?auto_62516 - BLOCK
    )
    :vars
    (
      ?auto_62518 - BLOCK
      ?auto_62517 - BLOCK
      ?auto_62519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62513 ?auto_62514 ) ) ( not ( = ?auto_62513 ?auto_62515 ) ) ( not ( = ?auto_62513 ?auto_62516 ) ) ( not ( = ?auto_62514 ?auto_62515 ) ) ( not ( = ?auto_62514 ?auto_62516 ) ) ( not ( = ?auto_62515 ?auto_62516 ) ) ( ON ?auto_62516 ?auto_62518 ) ( not ( = ?auto_62513 ?auto_62518 ) ) ( not ( = ?auto_62514 ?auto_62518 ) ) ( not ( = ?auto_62515 ?auto_62518 ) ) ( not ( = ?auto_62516 ?auto_62518 ) ) ( ON-TABLE ?auto_62517 ) ( ON ?auto_62518 ?auto_62517 ) ( not ( = ?auto_62517 ?auto_62518 ) ) ( not ( = ?auto_62517 ?auto_62516 ) ) ( not ( = ?auto_62517 ?auto_62515 ) ) ( not ( = ?auto_62513 ?auto_62517 ) ) ( not ( = ?auto_62514 ?auto_62517 ) ) ( ON ?auto_62513 ?auto_62519 ) ( not ( = ?auto_62513 ?auto_62519 ) ) ( not ( = ?auto_62514 ?auto_62519 ) ) ( not ( = ?auto_62515 ?auto_62519 ) ) ( not ( = ?auto_62516 ?auto_62519 ) ) ( not ( = ?auto_62518 ?auto_62519 ) ) ( not ( = ?auto_62517 ?auto_62519 ) ) ( ON ?auto_62514 ?auto_62513 ) ( CLEAR ?auto_62514 ) ( ON-TABLE ?auto_62519 ) ( HOLDING ?auto_62515 ) ( CLEAR ?auto_62516 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62517 ?auto_62518 ?auto_62516 ?auto_62515 )
      ( MAKE-4PILE ?auto_62513 ?auto_62514 ?auto_62515 ?auto_62516 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62520 - BLOCK
      ?auto_62521 - BLOCK
      ?auto_62522 - BLOCK
      ?auto_62523 - BLOCK
    )
    :vars
    (
      ?auto_62524 - BLOCK
      ?auto_62525 - BLOCK
      ?auto_62526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62520 ?auto_62521 ) ) ( not ( = ?auto_62520 ?auto_62522 ) ) ( not ( = ?auto_62520 ?auto_62523 ) ) ( not ( = ?auto_62521 ?auto_62522 ) ) ( not ( = ?auto_62521 ?auto_62523 ) ) ( not ( = ?auto_62522 ?auto_62523 ) ) ( ON ?auto_62523 ?auto_62524 ) ( not ( = ?auto_62520 ?auto_62524 ) ) ( not ( = ?auto_62521 ?auto_62524 ) ) ( not ( = ?auto_62522 ?auto_62524 ) ) ( not ( = ?auto_62523 ?auto_62524 ) ) ( ON-TABLE ?auto_62525 ) ( ON ?auto_62524 ?auto_62525 ) ( not ( = ?auto_62525 ?auto_62524 ) ) ( not ( = ?auto_62525 ?auto_62523 ) ) ( not ( = ?auto_62525 ?auto_62522 ) ) ( not ( = ?auto_62520 ?auto_62525 ) ) ( not ( = ?auto_62521 ?auto_62525 ) ) ( ON ?auto_62520 ?auto_62526 ) ( not ( = ?auto_62520 ?auto_62526 ) ) ( not ( = ?auto_62521 ?auto_62526 ) ) ( not ( = ?auto_62522 ?auto_62526 ) ) ( not ( = ?auto_62523 ?auto_62526 ) ) ( not ( = ?auto_62524 ?auto_62526 ) ) ( not ( = ?auto_62525 ?auto_62526 ) ) ( ON ?auto_62521 ?auto_62520 ) ( ON-TABLE ?auto_62526 ) ( CLEAR ?auto_62523 ) ( ON ?auto_62522 ?auto_62521 ) ( CLEAR ?auto_62522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62526 ?auto_62520 ?auto_62521 )
      ( MAKE-4PILE ?auto_62520 ?auto_62521 ?auto_62522 ?auto_62523 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62527 - BLOCK
      ?auto_62528 - BLOCK
      ?auto_62529 - BLOCK
      ?auto_62530 - BLOCK
    )
    :vars
    (
      ?auto_62531 - BLOCK
      ?auto_62533 - BLOCK
      ?auto_62532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62527 ?auto_62528 ) ) ( not ( = ?auto_62527 ?auto_62529 ) ) ( not ( = ?auto_62527 ?auto_62530 ) ) ( not ( = ?auto_62528 ?auto_62529 ) ) ( not ( = ?auto_62528 ?auto_62530 ) ) ( not ( = ?auto_62529 ?auto_62530 ) ) ( not ( = ?auto_62527 ?auto_62531 ) ) ( not ( = ?auto_62528 ?auto_62531 ) ) ( not ( = ?auto_62529 ?auto_62531 ) ) ( not ( = ?auto_62530 ?auto_62531 ) ) ( ON-TABLE ?auto_62533 ) ( ON ?auto_62531 ?auto_62533 ) ( not ( = ?auto_62533 ?auto_62531 ) ) ( not ( = ?auto_62533 ?auto_62530 ) ) ( not ( = ?auto_62533 ?auto_62529 ) ) ( not ( = ?auto_62527 ?auto_62533 ) ) ( not ( = ?auto_62528 ?auto_62533 ) ) ( ON ?auto_62527 ?auto_62532 ) ( not ( = ?auto_62527 ?auto_62532 ) ) ( not ( = ?auto_62528 ?auto_62532 ) ) ( not ( = ?auto_62529 ?auto_62532 ) ) ( not ( = ?auto_62530 ?auto_62532 ) ) ( not ( = ?auto_62531 ?auto_62532 ) ) ( not ( = ?auto_62533 ?auto_62532 ) ) ( ON ?auto_62528 ?auto_62527 ) ( ON-TABLE ?auto_62532 ) ( ON ?auto_62529 ?auto_62528 ) ( CLEAR ?auto_62529 ) ( HOLDING ?auto_62530 ) ( CLEAR ?auto_62531 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62533 ?auto_62531 ?auto_62530 )
      ( MAKE-4PILE ?auto_62527 ?auto_62528 ?auto_62529 ?auto_62530 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62534 - BLOCK
      ?auto_62535 - BLOCK
      ?auto_62536 - BLOCK
      ?auto_62537 - BLOCK
    )
    :vars
    (
      ?auto_62540 - BLOCK
      ?auto_62539 - BLOCK
      ?auto_62538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62534 ?auto_62535 ) ) ( not ( = ?auto_62534 ?auto_62536 ) ) ( not ( = ?auto_62534 ?auto_62537 ) ) ( not ( = ?auto_62535 ?auto_62536 ) ) ( not ( = ?auto_62535 ?auto_62537 ) ) ( not ( = ?auto_62536 ?auto_62537 ) ) ( not ( = ?auto_62534 ?auto_62540 ) ) ( not ( = ?auto_62535 ?auto_62540 ) ) ( not ( = ?auto_62536 ?auto_62540 ) ) ( not ( = ?auto_62537 ?auto_62540 ) ) ( ON-TABLE ?auto_62539 ) ( ON ?auto_62540 ?auto_62539 ) ( not ( = ?auto_62539 ?auto_62540 ) ) ( not ( = ?auto_62539 ?auto_62537 ) ) ( not ( = ?auto_62539 ?auto_62536 ) ) ( not ( = ?auto_62534 ?auto_62539 ) ) ( not ( = ?auto_62535 ?auto_62539 ) ) ( ON ?auto_62534 ?auto_62538 ) ( not ( = ?auto_62534 ?auto_62538 ) ) ( not ( = ?auto_62535 ?auto_62538 ) ) ( not ( = ?auto_62536 ?auto_62538 ) ) ( not ( = ?auto_62537 ?auto_62538 ) ) ( not ( = ?auto_62540 ?auto_62538 ) ) ( not ( = ?auto_62539 ?auto_62538 ) ) ( ON ?auto_62535 ?auto_62534 ) ( ON-TABLE ?auto_62538 ) ( ON ?auto_62536 ?auto_62535 ) ( CLEAR ?auto_62540 ) ( ON ?auto_62537 ?auto_62536 ) ( CLEAR ?auto_62537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62538 ?auto_62534 ?auto_62535 ?auto_62536 )
      ( MAKE-4PILE ?auto_62534 ?auto_62535 ?auto_62536 ?auto_62537 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62541 - BLOCK
      ?auto_62542 - BLOCK
      ?auto_62543 - BLOCK
      ?auto_62544 - BLOCK
    )
    :vars
    (
      ?auto_62546 - BLOCK
      ?auto_62547 - BLOCK
      ?auto_62545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62541 ?auto_62542 ) ) ( not ( = ?auto_62541 ?auto_62543 ) ) ( not ( = ?auto_62541 ?auto_62544 ) ) ( not ( = ?auto_62542 ?auto_62543 ) ) ( not ( = ?auto_62542 ?auto_62544 ) ) ( not ( = ?auto_62543 ?auto_62544 ) ) ( not ( = ?auto_62541 ?auto_62546 ) ) ( not ( = ?auto_62542 ?auto_62546 ) ) ( not ( = ?auto_62543 ?auto_62546 ) ) ( not ( = ?auto_62544 ?auto_62546 ) ) ( ON-TABLE ?auto_62547 ) ( not ( = ?auto_62547 ?auto_62546 ) ) ( not ( = ?auto_62547 ?auto_62544 ) ) ( not ( = ?auto_62547 ?auto_62543 ) ) ( not ( = ?auto_62541 ?auto_62547 ) ) ( not ( = ?auto_62542 ?auto_62547 ) ) ( ON ?auto_62541 ?auto_62545 ) ( not ( = ?auto_62541 ?auto_62545 ) ) ( not ( = ?auto_62542 ?auto_62545 ) ) ( not ( = ?auto_62543 ?auto_62545 ) ) ( not ( = ?auto_62544 ?auto_62545 ) ) ( not ( = ?auto_62546 ?auto_62545 ) ) ( not ( = ?auto_62547 ?auto_62545 ) ) ( ON ?auto_62542 ?auto_62541 ) ( ON-TABLE ?auto_62545 ) ( ON ?auto_62543 ?auto_62542 ) ( ON ?auto_62544 ?auto_62543 ) ( CLEAR ?auto_62544 ) ( HOLDING ?auto_62546 ) ( CLEAR ?auto_62547 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62547 ?auto_62546 )
      ( MAKE-4PILE ?auto_62541 ?auto_62542 ?auto_62543 ?auto_62544 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62548 - BLOCK
      ?auto_62549 - BLOCK
      ?auto_62550 - BLOCK
      ?auto_62551 - BLOCK
    )
    :vars
    (
      ?auto_62554 - BLOCK
      ?auto_62552 - BLOCK
      ?auto_62553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62548 ?auto_62549 ) ) ( not ( = ?auto_62548 ?auto_62550 ) ) ( not ( = ?auto_62548 ?auto_62551 ) ) ( not ( = ?auto_62549 ?auto_62550 ) ) ( not ( = ?auto_62549 ?auto_62551 ) ) ( not ( = ?auto_62550 ?auto_62551 ) ) ( not ( = ?auto_62548 ?auto_62554 ) ) ( not ( = ?auto_62549 ?auto_62554 ) ) ( not ( = ?auto_62550 ?auto_62554 ) ) ( not ( = ?auto_62551 ?auto_62554 ) ) ( ON-TABLE ?auto_62552 ) ( not ( = ?auto_62552 ?auto_62554 ) ) ( not ( = ?auto_62552 ?auto_62551 ) ) ( not ( = ?auto_62552 ?auto_62550 ) ) ( not ( = ?auto_62548 ?auto_62552 ) ) ( not ( = ?auto_62549 ?auto_62552 ) ) ( ON ?auto_62548 ?auto_62553 ) ( not ( = ?auto_62548 ?auto_62553 ) ) ( not ( = ?auto_62549 ?auto_62553 ) ) ( not ( = ?auto_62550 ?auto_62553 ) ) ( not ( = ?auto_62551 ?auto_62553 ) ) ( not ( = ?auto_62554 ?auto_62553 ) ) ( not ( = ?auto_62552 ?auto_62553 ) ) ( ON ?auto_62549 ?auto_62548 ) ( ON-TABLE ?auto_62553 ) ( ON ?auto_62550 ?auto_62549 ) ( ON ?auto_62551 ?auto_62550 ) ( CLEAR ?auto_62552 ) ( ON ?auto_62554 ?auto_62551 ) ( CLEAR ?auto_62554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62553 ?auto_62548 ?auto_62549 ?auto_62550 ?auto_62551 )
      ( MAKE-4PILE ?auto_62548 ?auto_62549 ?auto_62550 ?auto_62551 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62555 - BLOCK
      ?auto_62556 - BLOCK
      ?auto_62557 - BLOCK
      ?auto_62558 - BLOCK
    )
    :vars
    (
      ?auto_62559 - BLOCK
      ?auto_62561 - BLOCK
      ?auto_62560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62555 ?auto_62556 ) ) ( not ( = ?auto_62555 ?auto_62557 ) ) ( not ( = ?auto_62555 ?auto_62558 ) ) ( not ( = ?auto_62556 ?auto_62557 ) ) ( not ( = ?auto_62556 ?auto_62558 ) ) ( not ( = ?auto_62557 ?auto_62558 ) ) ( not ( = ?auto_62555 ?auto_62559 ) ) ( not ( = ?auto_62556 ?auto_62559 ) ) ( not ( = ?auto_62557 ?auto_62559 ) ) ( not ( = ?auto_62558 ?auto_62559 ) ) ( not ( = ?auto_62561 ?auto_62559 ) ) ( not ( = ?auto_62561 ?auto_62558 ) ) ( not ( = ?auto_62561 ?auto_62557 ) ) ( not ( = ?auto_62555 ?auto_62561 ) ) ( not ( = ?auto_62556 ?auto_62561 ) ) ( ON ?auto_62555 ?auto_62560 ) ( not ( = ?auto_62555 ?auto_62560 ) ) ( not ( = ?auto_62556 ?auto_62560 ) ) ( not ( = ?auto_62557 ?auto_62560 ) ) ( not ( = ?auto_62558 ?auto_62560 ) ) ( not ( = ?auto_62559 ?auto_62560 ) ) ( not ( = ?auto_62561 ?auto_62560 ) ) ( ON ?auto_62556 ?auto_62555 ) ( ON-TABLE ?auto_62560 ) ( ON ?auto_62557 ?auto_62556 ) ( ON ?auto_62558 ?auto_62557 ) ( ON ?auto_62559 ?auto_62558 ) ( CLEAR ?auto_62559 ) ( HOLDING ?auto_62561 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62561 )
      ( MAKE-4PILE ?auto_62555 ?auto_62556 ?auto_62557 ?auto_62558 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_62562 - BLOCK
      ?auto_62563 - BLOCK
      ?auto_62564 - BLOCK
      ?auto_62565 - BLOCK
    )
    :vars
    (
      ?auto_62566 - BLOCK
      ?auto_62568 - BLOCK
      ?auto_62567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62562 ?auto_62563 ) ) ( not ( = ?auto_62562 ?auto_62564 ) ) ( not ( = ?auto_62562 ?auto_62565 ) ) ( not ( = ?auto_62563 ?auto_62564 ) ) ( not ( = ?auto_62563 ?auto_62565 ) ) ( not ( = ?auto_62564 ?auto_62565 ) ) ( not ( = ?auto_62562 ?auto_62566 ) ) ( not ( = ?auto_62563 ?auto_62566 ) ) ( not ( = ?auto_62564 ?auto_62566 ) ) ( not ( = ?auto_62565 ?auto_62566 ) ) ( not ( = ?auto_62568 ?auto_62566 ) ) ( not ( = ?auto_62568 ?auto_62565 ) ) ( not ( = ?auto_62568 ?auto_62564 ) ) ( not ( = ?auto_62562 ?auto_62568 ) ) ( not ( = ?auto_62563 ?auto_62568 ) ) ( ON ?auto_62562 ?auto_62567 ) ( not ( = ?auto_62562 ?auto_62567 ) ) ( not ( = ?auto_62563 ?auto_62567 ) ) ( not ( = ?auto_62564 ?auto_62567 ) ) ( not ( = ?auto_62565 ?auto_62567 ) ) ( not ( = ?auto_62566 ?auto_62567 ) ) ( not ( = ?auto_62568 ?auto_62567 ) ) ( ON ?auto_62563 ?auto_62562 ) ( ON-TABLE ?auto_62567 ) ( ON ?auto_62564 ?auto_62563 ) ( ON ?auto_62565 ?auto_62564 ) ( ON ?auto_62566 ?auto_62565 ) ( ON ?auto_62568 ?auto_62566 ) ( CLEAR ?auto_62568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62567 ?auto_62562 ?auto_62563 ?auto_62564 ?auto_62565 ?auto_62566 )
      ( MAKE-4PILE ?auto_62562 ?auto_62563 ?auto_62564 ?auto_62565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62570 - BLOCK
    )
    :vars
    (
      ?auto_62571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62571 ?auto_62570 ) ( CLEAR ?auto_62571 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62570 ) ( not ( = ?auto_62570 ?auto_62571 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62571 ?auto_62570 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62572 - BLOCK
    )
    :vars
    (
      ?auto_62573 - BLOCK
      ?auto_62574 - BLOCK
      ?auto_62575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62573 ?auto_62572 ) ( CLEAR ?auto_62573 ) ( ON-TABLE ?auto_62572 ) ( not ( = ?auto_62572 ?auto_62573 ) ) ( HOLDING ?auto_62574 ) ( CLEAR ?auto_62575 ) ( not ( = ?auto_62572 ?auto_62574 ) ) ( not ( = ?auto_62572 ?auto_62575 ) ) ( not ( = ?auto_62573 ?auto_62574 ) ) ( not ( = ?auto_62573 ?auto_62575 ) ) ( not ( = ?auto_62574 ?auto_62575 ) ) )
    :subtasks
    ( ( !STACK ?auto_62574 ?auto_62575 )
      ( MAKE-1PILE ?auto_62572 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62576 - BLOCK
    )
    :vars
    (
      ?auto_62577 - BLOCK
      ?auto_62579 - BLOCK
      ?auto_62578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62577 ?auto_62576 ) ( ON-TABLE ?auto_62576 ) ( not ( = ?auto_62576 ?auto_62577 ) ) ( CLEAR ?auto_62579 ) ( not ( = ?auto_62576 ?auto_62578 ) ) ( not ( = ?auto_62576 ?auto_62579 ) ) ( not ( = ?auto_62577 ?auto_62578 ) ) ( not ( = ?auto_62577 ?auto_62579 ) ) ( not ( = ?auto_62578 ?auto_62579 ) ) ( ON ?auto_62578 ?auto_62577 ) ( CLEAR ?auto_62578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62576 ?auto_62577 )
      ( MAKE-1PILE ?auto_62576 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62580 - BLOCK
    )
    :vars
    (
      ?auto_62582 - BLOCK
      ?auto_62583 - BLOCK
      ?auto_62581 - BLOCK
      ?auto_62584 - BLOCK
      ?auto_62585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62582 ?auto_62580 ) ( ON-TABLE ?auto_62580 ) ( not ( = ?auto_62580 ?auto_62582 ) ) ( not ( = ?auto_62580 ?auto_62583 ) ) ( not ( = ?auto_62580 ?auto_62581 ) ) ( not ( = ?auto_62582 ?auto_62583 ) ) ( not ( = ?auto_62582 ?auto_62581 ) ) ( not ( = ?auto_62583 ?auto_62581 ) ) ( ON ?auto_62583 ?auto_62582 ) ( CLEAR ?auto_62583 ) ( HOLDING ?auto_62581 ) ( CLEAR ?auto_62584 ) ( ON-TABLE ?auto_62585 ) ( ON ?auto_62584 ?auto_62585 ) ( not ( = ?auto_62585 ?auto_62584 ) ) ( not ( = ?auto_62585 ?auto_62581 ) ) ( not ( = ?auto_62584 ?auto_62581 ) ) ( not ( = ?auto_62580 ?auto_62584 ) ) ( not ( = ?auto_62580 ?auto_62585 ) ) ( not ( = ?auto_62582 ?auto_62584 ) ) ( not ( = ?auto_62582 ?auto_62585 ) ) ( not ( = ?auto_62583 ?auto_62584 ) ) ( not ( = ?auto_62583 ?auto_62585 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62585 ?auto_62584 ?auto_62581 )
      ( MAKE-1PILE ?auto_62580 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62586 - BLOCK
    )
    :vars
    (
      ?auto_62590 - BLOCK
      ?auto_62591 - BLOCK
      ?auto_62588 - BLOCK
      ?auto_62587 - BLOCK
      ?auto_62589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62590 ?auto_62586 ) ( ON-TABLE ?auto_62586 ) ( not ( = ?auto_62586 ?auto_62590 ) ) ( not ( = ?auto_62586 ?auto_62591 ) ) ( not ( = ?auto_62586 ?auto_62588 ) ) ( not ( = ?auto_62590 ?auto_62591 ) ) ( not ( = ?auto_62590 ?auto_62588 ) ) ( not ( = ?auto_62591 ?auto_62588 ) ) ( ON ?auto_62591 ?auto_62590 ) ( CLEAR ?auto_62587 ) ( ON-TABLE ?auto_62589 ) ( ON ?auto_62587 ?auto_62589 ) ( not ( = ?auto_62589 ?auto_62587 ) ) ( not ( = ?auto_62589 ?auto_62588 ) ) ( not ( = ?auto_62587 ?auto_62588 ) ) ( not ( = ?auto_62586 ?auto_62587 ) ) ( not ( = ?auto_62586 ?auto_62589 ) ) ( not ( = ?auto_62590 ?auto_62587 ) ) ( not ( = ?auto_62590 ?auto_62589 ) ) ( not ( = ?auto_62591 ?auto_62587 ) ) ( not ( = ?auto_62591 ?auto_62589 ) ) ( ON ?auto_62588 ?auto_62591 ) ( CLEAR ?auto_62588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62586 ?auto_62590 ?auto_62591 )
      ( MAKE-1PILE ?auto_62586 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62592 - BLOCK
    )
    :vars
    (
      ?auto_62595 - BLOCK
      ?auto_62596 - BLOCK
      ?auto_62593 - BLOCK
      ?auto_62594 - BLOCK
      ?auto_62597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62595 ?auto_62592 ) ( ON-TABLE ?auto_62592 ) ( not ( = ?auto_62592 ?auto_62595 ) ) ( not ( = ?auto_62592 ?auto_62596 ) ) ( not ( = ?auto_62592 ?auto_62593 ) ) ( not ( = ?auto_62595 ?auto_62596 ) ) ( not ( = ?auto_62595 ?auto_62593 ) ) ( not ( = ?auto_62596 ?auto_62593 ) ) ( ON ?auto_62596 ?auto_62595 ) ( ON-TABLE ?auto_62594 ) ( not ( = ?auto_62594 ?auto_62597 ) ) ( not ( = ?auto_62594 ?auto_62593 ) ) ( not ( = ?auto_62597 ?auto_62593 ) ) ( not ( = ?auto_62592 ?auto_62597 ) ) ( not ( = ?auto_62592 ?auto_62594 ) ) ( not ( = ?auto_62595 ?auto_62597 ) ) ( not ( = ?auto_62595 ?auto_62594 ) ) ( not ( = ?auto_62596 ?auto_62597 ) ) ( not ( = ?auto_62596 ?auto_62594 ) ) ( ON ?auto_62593 ?auto_62596 ) ( CLEAR ?auto_62593 ) ( HOLDING ?auto_62597 ) ( CLEAR ?auto_62594 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62594 ?auto_62597 )
      ( MAKE-1PILE ?auto_62592 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62598 - BLOCK
    )
    :vars
    (
      ?auto_62599 - BLOCK
      ?auto_62600 - BLOCK
      ?auto_62603 - BLOCK
      ?auto_62602 - BLOCK
      ?auto_62601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62599 ?auto_62598 ) ( ON-TABLE ?auto_62598 ) ( not ( = ?auto_62598 ?auto_62599 ) ) ( not ( = ?auto_62598 ?auto_62600 ) ) ( not ( = ?auto_62598 ?auto_62603 ) ) ( not ( = ?auto_62599 ?auto_62600 ) ) ( not ( = ?auto_62599 ?auto_62603 ) ) ( not ( = ?auto_62600 ?auto_62603 ) ) ( ON ?auto_62600 ?auto_62599 ) ( ON-TABLE ?auto_62602 ) ( not ( = ?auto_62602 ?auto_62601 ) ) ( not ( = ?auto_62602 ?auto_62603 ) ) ( not ( = ?auto_62601 ?auto_62603 ) ) ( not ( = ?auto_62598 ?auto_62601 ) ) ( not ( = ?auto_62598 ?auto_62602 ) ) ( not ( = ?auto_62599 ?auto_62601 ) ) ( not ( = ?auto_62599 ?auto_62602 ) ) ( not ( = ?auto_62600 ?auto_62601 ) ) ( not ( = ?auto_62600 ?auto_62602 ) ) ( ON ?auto_62603 ?auto_62600 ) ( CLEAR ?auto_62602 ) ( ON ?auto_62601 ?auto_62603 ) ( CLEAR ?auto_62601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62598 ?auto_62599 ?auto_62600 ?auto_62603 )
      ( MAKE-1PILE ?auto_62598 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62604 - BLOCK
    )
    :vars
    (
      ?auto_62605 - BLOCK
      ?auto_62606 - BLOCK
      ?auto_62607 - BLOCK
      ?auto_62608 - BLOCK
      ?auto_62609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62605 ?auto_62604 ) ( ON-TABLE ?auto_62604 ) ( not ( = ?auto_62604 ?auto_62605 ) ) ( not ( = ?auto_62604 ?auto_62606 ) ) ( not ( = ?auto_62604 ?auto_62607 ) ) ( not ( = ?auto_62605 ?auto_62606 ) ) ( not ( = ?auto_62605 ?auto_62607 ) ) ( not ( = ?auto_62606 ?auto_62607 ) ) ( ON ?auto_62606 ?auto_62605 ) ( not ( = ?auto_62608 ?auto_62609 ) ) ( not ( = ?auto_62608 ?auto_62607 ) ) ( not ( = ?auto_62609 ?auto_62607 ) ) ( not ( = ?auto_62604 ?auto_62609 ) ) ( not ( = ?auto_62604 ?auto_62608 ) ) ( not ( = ?auto_62605 ?auto_62609 ) ) ( not ( = ?auto_62605 ?auto_62608 ) ) ( not ( = ?auto_62606 ?auto_62609 ) ) ( not ( = ?auto_62606 ?auto_62608 ) ) ( ON ?auto_62607 ?auto_62606 ) ( ON ?auto_62609 ?auto_62607 ) ( CLEAR ?auto_62609 ) ( HOLDING ?auto_62608 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62608 )
      ( MAKE-1PILE ?auto_62604 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62610 - BLOCK
    )
    :vars
    (
      ?auto_62613 - BLOCK
      ?auto_62612 - BLOCK
      ?auto_62611 - BLOCK
      ?auto_62615 - BLOCK
      ?auto_62614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62613 ?auto_62610 ) ( ON-TABLE ?auto_62610 ) ( not ( = ?auto_62610 ?auto_62613 ) ) ( not ( = ?auto_62610 ?auto_62612 ) ) ( not ( = ?auto_62610 ?auto_62611 ) ) ( not ( = ?auto_62613 ?auto_62612 ) ) ( not ( = ?auto_62613 ?auto_62611 ) ) ( not ( = ?auto_62612 ?auto_62611 ) ) ( ON ?auto_62612 ?auto_62613 ) ( not ( = ?auto_62615 ?auto_62614 ) ) ( not ( = ?auto_62615 ?auto_62611 ) ) ( not ( = ?auto_62614 ?auto_62611 ) ) ( not ( = ?auto_62610 ?auto_62614 ) ) ( not ( = ?auto_62610 ?auto_62615 ) ) ( not ( = ?auto_62613 ?auto_62614 ) ) ( not ( = ?auto_62613 ?auto_62615 ) ) ( not ( = ?auto_62612 ?auto_62614 ) ) ( not ( = ?auto_62612 ?auto_62615 ) ) ( ON ?auto_62611 ?auto_62612 ) ( ON ?auto_62614 ?auto_62611 ) ( ON ?auto_62615 ?auto_62614 ) ( CLEAR ?auto_62615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62610 ?auto_62613 ?auto_62612 ?auto_62611 ?auto_62614 )
      ( MAKE-1PILE ?auto_62610 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62616 - BLOCK
    )
    :vars
    (
      ?auto_62617 - BLOCK
      ?auto_62619 - BLOCK
      ?auto_62621 - BLOCK
      ?auto_62620 - BLOCK
      ?auto_62618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62617 ?auto_62616 ) ( ON-TABLE ?auto_62616 ) ( not ( = ?auto_62616 ?auto_62617 ) ) ( not ( = ?auto_62616 ?auto_62619 ) ) ( not ( = ?auto_62616 ?auto_62621 ) ) ( not ( = ?auto_62617 ?auto_62619 ) ) ( not ( = ?auto_62617 ?auto_62621 ) ) ( not ( = ?auto_62619 ?auto_62621 ) ) ( ON ?auto_62619 ?auto_62617 ) ( not ( = ?auto_62620 ?auto_62618 ) ) ( not ( = ?auto_62620 ?auto_62621 ) ) ( not ( = ?auto_62618 ?auto_62621 ) ) ( not ( = ?auto_62616 ?auto_62618 ) ) ( not ( = ?auto_62616 ?auto_62620 ) ) ( not ( = ?auto_62617 ?auto_62618 ) ) ( not ( = ?auto_62617 ?auto_62620 ) ) ( not ( = ?auto_62619 ?auto_62618 ) ) ( not ( = ?auto_62619 ?auto_62620 ) ) ( ON ?auto_62621 ?auto_62619 ) ( ON ?auto_62618 ?auto_62621 ) ( HOLDING ?auto_62620 ) ( CLEAR ?auto_62618 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62616 ?auto_62617 ?auto_62619 ?auto_62621 ?auto_62618 ?auto_62620 )
      ( MAKE-1PILE ?auto_62616 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62622 - BLOCK
    )
    :vars
    (
      ?auto_62623 - BLOCK
      ?auto_62624 - BLOCK
      ?auto_62627 - BLOCK
      ?auto_62626 - BLOCK
      ?auto_62625 - BLOCK
      ?auto_62628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62623 ?auto_62622 ) ( ON-TABLE ?auto_62622 ) ( not ( = ?auto_62622 ?auto_62623 ) ) ( not ( = ?auto_62622 ?auto_62624 ) ) ( not ( = ?auto_62622 ?auto_62627 ) ) ( not ( = ?auto_62623 ?auto_62624 ) ) ( not ( = ?auto_62623 ?auto_62627 ) ) ( not ( = ?auto_62624 ?auto_62627 ) ) ( ON ?auto_62624 ?auto_62623 ) ( not ( = ?auto_62626 ?auto_62625 ) ) ( not ( = ?auto_62626 ?auto_62627 ) ) ( not ( = ?auto_62625 ?auto_62627 ) ) ( not ( = ?auto_62622 ?auto_62625 ) ) ( not ( = ?auto_62622 ?auto_62626 ) ) ( not ( = ?auto_62623 ?auto_62625 ) ) ( not ( = ?auto_62623 ?auto_62626 ) ) ( not ( = ?auto_62624 ?auto_62625 ) ) ( not ( = ?auto_62624 ?auto_62626 ) ) ( ON ?auto_62627 ?auto_62624 ) ( ON ?auto_62625 ?auto_62627 ) ( CLEAR ?auto_62625 ) ( ON ?auto_62626 ?auto_62628 ) ( CLEAR ?auto_62626 ) ( HAND-EMPTY ) ( not ( = ?auto_62622 ?auto_62628 ) ) ( not ( = ?auto_62623 ?auto_62628 ) ) ( not ( = ?auto_62624 ?auto_62628 ) ) ( not ( = ?auto_62627 ?auto_62628 ) ) ( not ( = ?auto_62626 ?auto_62628 ) ) ( not ( = ?auto_62625 ?auto_62628 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62626 ?auto_62628 )
      ( MAKE-1PILE ?auto_62622 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62629 - BLOCK
    )
    :vars
    (
      ?auto_62633 - BLOCK
      ?auto_62635 - BLOCK
      ?auto_62631 - BLOCK
      ?auto_62630 - BLOCK
      ?auto_62634 - BLOCK
      ?auto_62632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62633 ?auto_62629 ) ( ON-TABLE ?auto_62629 ) ( not ( = ?auto_62629 ?auto_62633 ) ) ( not ( = ?auto_62629 ?auto_62635 ) ) ( not ( = ?auto_62629 ?auto_62631 ) ) ( not ( = ?auto_62633 ?auto_62635 ) ) ( not ( = ?auto_62633 ?auto_62631 ) ) ( not ( = ?auto_62635 ?auto_62631 ) ) ( ON ?auto_62635 ?auto_62633 ) ( not ( = ?auto_62630 ?auto_62634 ) ) ( not ( = ?auto_62630 ?auto_62631 ) ) ( not ( = ?auto_62634 ?auto_62631 ) ) ( not ( = ?auto_62629 ?auto_62634 ) ) ( not ( = ?auto_62629 ?auto_62630 ) ) ( not ( = ?auto_62633 ?auto_62634 ) ) ( not ( = ?auto_62633 ?auto_62630 ) ) ( not ( = ?auto_62635 ?auto_62634 ) ) ( not ( = ?auto_62635 ?auto_62630 ) ) ( ON ?auto_62631 ?auto_62635 ) ( ON ?auto_62630 ?auto_62632 ) ( CLEAR ?auto_62630 ) ( not ( = ?auto_62629 ?auto_62632 ) ) ( not ( = ?auto_62633 ?auto_62632 ) ) ( not ( = ?auto_62635 ?auto_62632 ) ) ( not ( = ?auto_62631 ?auto_62632 ) ) ( not ( = ?auto_62630 ?auto_62632 ) ) ( not ( = ?auto_62634 ?auto_62632 ) ) ( HOLDING ?auto_62634 ) ( CLEAR ?auto_62631 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62629 ?auto_62633 ?auto_62635 ?auto_62631 ?auto_62634 )
      ( MAKE-1PILE ?auto_62629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62636 - BLOCK
    )
    :vars
    (
      ?auto_62642 - BLOCK
      ?auto_62640 - BLOCK
      ?auto_62639 - BLOCK
      ?auto_62638 - BLOCK
      ?auto_62637 - BLOCK
      ?auto_62641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62642 ?auto_62636 ) ( ON-TABLE ?auto_62636 ) ( not ( = ?auto_62636 ?auto_62642 ) ) ( not ( = ?auto_62636 ?auto_62640 ) ) ( not ( = ?auto_62636 ?auto_62639 ) ) ( not ( = ?auto_62642 ?auto_62640 ) ) ( not ( = ?auto_62642 ?auto_62639 ) ) ( not ( = ?auto_62640 ?auto_62639 ) ) ( ON ?auto_62640 ?auto_62642 ) ( not ( = ?auto_62638 ?auto_62637 ) ) ( not ( = ?auto_62638 ?auto_62639 ) ) ( not ( = ?auto_62637 ?auto_62639 ) ) ( not ( = ?auto_62636 ?auto_62637 ) ) ( not ( = ?auto_62636 ?auto_62638 ) ) ( not ( = ?auto_62642 ?auto_62637 ) ) ( not ( = ?auto_62642 ?auto_62638 ) ) ( not ( = ?auto_62640 ?auto_62637 ) ) ( not ( = ?auto_62640 ?auto_62638 ) ) ( ON ?auto_62639 ?auto_62640 ) ( ON ?auto_62638 ?auto_62641 ) ( not ( = ?auto_62636 ?auto_62641 ) ) ( not ( = ?auto_62642 ?auto_62641 ) ) ( not ( = ?auto_62640 ?auto_62641 ) ) ( not ( = ?auto_62639 ?auto_62641 ) ) ( not ( = ?auto_62638 ?auto_62641 ) ) ( not ( = ?auto_62637 ?auto_62641 ) ) ( CLEAR ?auto_62639 ) ( ON ?auto_62637 ?auto_62638 ) ( CLEAR ?auto_62637 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62641 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62641 ?auto_62638 )
      ( MAKE-1PILE ?auto_62636 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62643 - BLOCK
    )
    :vars
    (
      ?auto_62645 - BLOCK
      ?auto_62644 - BLOCK
      ?auto_62648 - BLOCK
      ?auto_62649 - BLOCK
      ?auto_62646 - BLOCK
      ?auto_62647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62645 ?auto_62643 ) ( ON-TABLE ?auto_62643 ) ( not ( = ?auto_62643 ?auto_62645 ) ) ( not ( = ?auto_62643 ?auto_62644 ) ) ( not ( = ?auto_62643 ?auto_62648 ) ) ( not ( = ?auto_62645 ?auto_62644 ) ) ( not ( = ?auto_62645 ?auto_62648 ) ) ( not ( = ?auto_62644 ?auto_62648 ) ) ( ON ?auto_62644 ?auto_62645 ) ( not ( = ?auto_62649 ?auto_62646 ) ) ( not ( = ?auto_62649 ?auto_62648 ) ) ( not ( = ?auto_62646 ?auto_62648 ) ) ( not ( = ?auto_62643 ?auto_62646 ) ) ( not ( = ?auto_62643 ?auto_62649 ) ) ( not ( = ?auto_62645 ?auto_62646 ) ) ( not ( = ?auto_62645 ?auto_62649 ) ) ( not ( = ?auto_62644 ?auto_62646 ) ) ( not ( = ?auto_62644 ?auto_62649 ) ) ( ON ?auto_62649 ?auto_62647 ) ( not ( = ?auto_62643 ?auto_62647 ) ) ( not ( = ?auto_62645 ?auto_62647 ) ) ( not ( = ?auto_62644 ?auto_62647 ) ) ( not ( = ?auto_62648 ?auto_62647 ) ) ( not ( = ?auto_62649 ?auto_62647 ) ) ( not ( = ?auto_62646 ?auto_62647 ) ) ( ON ?auto_62646 ?auto_62649 ) ( CLEAR ?auto_62646 ) ( ON-TABLE ?auto_62647 ) ( HOLDING ?auto_62648 ) ( CLEAR ?auto_62644 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62643 ?auto_62645 ?auto_62644 ?auto_62648 )
      ( MAKE-1PILE ?auto_62643 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62650 - BLOCK
    )
    :vars
    (
      ?auto_62651 - BLOCK
      ?auto_62654 - BLOCK
      ?auto_62655 - BLOCK
      ?auto_62656 - BLOCK
      ?auto_62652 - BLOCK
      ?auto_62653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62651 ?auto_62650 ) ( ON-TABLE ?auto_62650 ) ( not ( = ?auto_62650 ?auto_62651 ) ) ( not ( = ?auto_62650 ?auto_62654 ) ) ( not ( = ?auto_62650 ?auto_62655 ) ) ( not ( = ?auto_62651 ?auto_62654 ) ) ( not ( = ?auto_62651 ?auto_62655 ) ) ( not ( = ?auto_62654 ?auto_62655 ) ) ( ON ?auto_62654 ?auto_62651 ) ( not ( = ?auto_62656 ?auto_62652 ) ) ( not ( = ?auto_62656 ?auto_62655 ) ) ( not ( = ?auto_62652 ?auto_62655 ) ) ( not ( = ?auto_62650 ?auto_62652 ) ) ( not ( = ?auto_62650 ?auto_62656 ) ) ( not ( = ?auto_62651 ?auto_62652 ) ) ( not ( = ?auto_62651 ?auto_62656 ) ) ( not ( = ?auto_62654 ?auto_62652 ) ) ( not ( = ?auto_62654 ?auto_62656 ) ) ( ON ?auto_62656 ?auto_62653 ) ( not ( = ?auto_62650 ?auto_62653 ) ) ( not ( = ?auto_62651 ?auto_62653 ) ) ( not ( = ?auto_62654 ?auto_62653 ) ) ( not ( = ?auto_62655 ?auto_62653 ) ) ( not ( = ?auto_62656 ?auto_62653 ) ) ( not ( = ?auto_62652 ?auto_62653 ) ) ( ON ?auto_62652 ?auto_62656 ) ( ON-TABLE ?auto_62653 ) ( CLEAR ?auto_62654 ) ( ON ?auto_62655 ?auto_62652 ) ( CLEAR ?auto_62655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62653 ?auto_62656 ?auto_62652 )
      ( MAKE-1PILE ?auto_62650 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62657 - BLOCK
    )
    :vars
    (
      ?auto_62661 - BLOCK
      ?auto_62659 - BLOCK
      ?auto_62663 - BLOCK
      ?auto_62660 - BLOCK
      ?auto_62658 - BLOCK
      ?auto_62662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62661 ?auto_62657 ) ( ON-TABLE ?auto_62657 ) ( not ( = ?auto_62657 ?auto_62661 ) ) ( not ( = ?auto_62657 ?auto_62659 ) ) ( not ( = ?auto_62657 ?auto_62663 ) ) ( not ( = ?auto_62661 ?auto_62659 ) ) ( not ( = ?auto_62661 ?auto_62663 ) ) ( not ( = ?auto_62659 ?auto_62663 ) ) ( not ( = ?auto_62660 ?auto_62658 ) ) ( not ( = ?auto_62660 ?auto_62663 ) ) ( not ( = ?auto_62658 ?auto_62663 ) ) ( not ( = ?auto_62657 ?auto_62658 ) ) ( not ( = ?auto_62657 ?auto_62660 ) ) ( not ( = ?auto_62661 ?auto_62658 ) ) ( not ( = ?auto_62661 ?auto_62660 ) ) ( not ( = ?auto_62659 ?auto_62658 ) ) ( not ( = ?auto_62659 ?auto_62660 ) ) ( ON ?auto_62660 ?auto_62662 ) ( not ( = ?auto_62657 ?auto_62662 ) ) ( not ( = ?auto_62661 ?auto_62662 ) ) ( not ( = ?auto_62659 ?auto_62662 ) ) ( not ( = ?auto_62663 ?auto_62662 ) ) ( not ( = ?auto_62660 ?auto_62662 ) ) ( not ( = ?auto_62658 ?auto_62662 ) ) ( ON ?auto_62658 ?auto_62660 ) ( ON-TABLE ?auto_62662 ) ( ON ?auto_62663 ?auto_62658 ) ( CLEAR ?auto_62663 ) ( HOLDING ?auto_62659 ) ( CLEAR ?auto_62661 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62657 ?auto_62661 ?auto_62659 )
      ( MAKE-1PILE ?auto_62657 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62664 - BLOCK
    )
    :vars
    (
      ?auto_62668 - BLOCK
      ?auto_62667 - BLOCK
      ?auto_62665 - BLOCK
      ?auto_62666 - BLOCK
      ?auto_62670 - BLOCK
      ?auto_62669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_62668 ?auto_62664 ) ( ON-TABLE ?auto_62664 ) ( not ( = ?auto_62664 ?auto_62668 ) ) ( not ( = ?auto_62664 ?auto_62667 ) ) ( not ( = ?auto_62664 ?auto_62665 ) ) ( not ( = ?auto_62668 ?auto_62667 ) ) ( not ( = ?auto_62668 ?auto_62665 ) ) ( not ( = ?auto_62667 ?auto_62665 ) ) ( not ( = ?auto_62666 ?auto_62670 ) ) ( not ( = ?auto_62666 ?auto_62665 ) ) ( not ( = ?auto_62670 ?auto_62665 ) ) ( not ( = ?auto_62664 ?auto_62670 ) ) ( not ( = ?auto_62664 ?auto_62666 ) ) ( not ( = ?auto_62668 ?auto_62670 ) ) ( not ( = ?auto_62668 ?auto_62666 ) ) ( not ( = ?auto_62667 ?auto_62670 ) ) ( not ( = ?auto_62667 ?auto_62666 ) ) ( ON ?auto_62666 ?auto_62669 ) ( not ( = ?auto_62664 ?auto_62669 ) ) ( not ( = ?auto_62668 ?auto_62669 ) ) ( not ( = ?auto_62667 ?auto_62669 ) ) ( not ( = ?auto_62665 ?auto_62669 ) ) ( not ( = ?auto_62666 ?auto_62669 ) ) ( not ( = ?auto_62670 ?auto_62669 ) ) ( ON ?auto_62670 ?auto_62666 ) ( ON-TABLE ?auto_62669 ) ( ON ?auto_62665 ?auto_62670 ) ( CLEAR ?auto_62668 ) ( ON ?auto_62667 ?auto_62665 ) ( CLEAR ?auto_62667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62669 ?auto_62666 ?auto_62670 ?auto_62665 )
      ( MAKE-1PILE ?auto_62664 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62685 - BLOCK
    )
    :vars
    (
      ?auto_62687 - BLOCK
      ?auto_62689 - BLOCK
      ?auto_62690 - BLOCK
      ?auto_62688 - BLOCK
      ?auto_62691 - BLOCK
      ?auto_62686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62685 ?auto_62687 ) ) ( not ( = ?auto_62685 ?auto_62689 ) ) ( not ( = ?auto_62685 ?auto_62690 ) ) ( not ( = ?auto_62687 ?auto_62689 ) ) ( not ( = ?auto_62687 ?auto_62690 ) ) ( not ( = ?auto_62689 ?auto_62690 ) ) ( not ( = ?auto_62688 ?auto_62691 ) ) ( not ( = ?auto_62688 ?auto_62690 ) ) ( not ( = ?auto_62691 ?auto_62690 ) ) ( not ( = ?auto_62685 ?auto_62691 ) ) ( not ( = ?auto_62685 ?auto_62688 ) ) ( not ( = ?auto_62687 ?auto_62691 ) ) ( not ( = ?auto_62687 ?auto_62688 ) ) ( not ( = ?auto_62689 ?auto_62691 ) ) ( not ( = ?auto_62689 ?auto_62688 ) ) ( ON ?auto_62688 ?auto_62686 ) ( not ( = ?auto_62685 ?auto_62686 ) ) ( not ( = ?auto_62687 ?auto_62686 ) ) ( not ( = ?auto_62689 ?auto_62686 ) ) ( not ( = ?auto_62690 ?auto_62686 ) ) ( not ( = ?auto_62688 ?auto_62686 ) ) ( not ( = ?auto_62691 ?auto_62686 ) ) ( ON ?auto_62691 ?auto_62688 ) ( ON-TABLE ?auto_62686 ) ( ON ?auto_62690 ?auto_62691 ) ( ON ?auto_62689 ?auto_62690 ) ( ON ?auto_62687 ?auto_62689 ) ( CLEAR ?auto_62687 ) ( HOLDING ?auto_62685 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62685 ?auto_62687 )
      ( MAKE-1PILE ?auto_62685 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_62692 - BLOCK
    )
    :vars
    (
      ?auto_62694 - BLOCK
      ?auto_62693 - BLOCK
      ?auto_62696 - BLOCK
      ?auto_62698 - BLOCK
      ?auto_62697 - BLOCK
      ?auto_62695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62692 ?auto_62694 ) ) ( not ( = ?auto_62692 ?auto_62693 ) ) ( not ( = ?auto_62692 ?auto_62696 ) ) ( not ( = ?auto_62694 ?auto_62693 ) ) ( not ( = ?auto_62694 ?auto_62696 ) ) ( not ( = ?auto_62693 ?auto_62696 ) ) ( not ( = ?auto_62698 ?auto_62697 ) ) ( not ( = ?auto_62698 ?auto_62696 ) ) ( not ( = ?auto_62697 ?auto_62696 ) ) ( not ( = ?auto_62692 ?auto_62697 ) ) ( not ( = ?auto_62692 ?auto_62698 ) ) ( not ( = ?auto_62694 ?auto_62697 ) ) ( not ( = ?auto_62694 ?auto_62698 ) ) ( not ( = ?auto_62693 ?auto_62697 ) ) ( not ( = ?auto_62693 ?auto_62698 ) ) ( ON ?auto_62698 ?auto_62695 ) ( not ( = ?auto_62692 ?auto_62695 ) ) ( not ( = ?auto_62694 ?auto_62695 ) ) ( not ( = ?auto_62693 ?auto_62695 ) ) ( not ( = ?auto_62696 ?auto_62695 ) ) ( not ( = ?auto_62698 ?auto_62695 ) ) ( not ( = ?auto_62697 ?auto_62695 ) ) ( ON ?auto_62697 ?auto_62698 ) ( ON-TABLE ?auto_62695 ) ( ON ?auto_62696 ?auto_62697 ) ( ON ?auto_62693 ?auto_62696 ) ( ON ?auto_62694 ?auto_62693 ) ( ON ?auto_62692 ?auto_62694 ) ( CLEAR ?auto_62692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62695 ?auto_62698 ?auto_62697 ?auto_62696 ?auto_62693 ?auto_62694 )
      ( MAKE-1PILE ?auto_62692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62704 - BLOCK
      ?auto_62705 - BLOCK
      ?auto_62706 - BLOCK
      ?auto_62707 - BLOCK
      ?auto_62708 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_62708 ) ( CLEAR ?auto_62707 ) ( ON-TABLE ?auto_62704 ) ( ON ?auto_62705 ?auto_62704 ) ( ON ?auto_62706 ?auto_62705 ) ( ON ?auto_62707 ?auto_62706 ) ( not ( = ?auto_62704 ?auto_62705 ) ) ( not ( = ?auto_62704 ?auto_62706 ) ) ( not ( = ?auto_62704 ?auto_62707 ) ) ( not ( = ?auto_62704 ?auto_62708 ) ) ( not ( = ?auto_62705 ?auto_62706 ) ) ( not ( = ?auto_62705 ?auto_62707 ) ) ( not ( = ?auto_62705 ?auto_62708 ) ) ( not ( = ?auto_62706 ?auto_62707 ) ) ( not ( = ?auto_62706 ?auto_62708 ) ) ( not ( = ?auto_62707 ?auto_62708 ) ) )
    :subtasks
    ( ( !STACK ?auto_62708 ?auto_62707 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62709 - BLOCK
      ?auto_62710 - BLOCK
      ?auto_62711 - BLOCK
      ?auto_62712 - BLOCK
      ?auto_62713 - BLOCK
    )
    :vars
    (
      ?auto_62714 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62712 ) ( ON-TABLE ?auto_62709 ) ( ON ?auto_62710 ?auto_62709 ) ( ON ?auto_62711 ?auto_62710 ) ( ON ?auto_62712 ?auto_62711 ) ( not ( = ?auto_62709 ?auto_62710 ) ) ( not ( = ?auto_62709 ?auto_62711 ) ) ( not ( = ?auto_62709 ?auto_62712 ) ) ( not ( = ?auto_62709 ?auto_62713 ) ) ( not ( = ?auto_62710 ?auto_62711 ) ) ( not ( = ?auto_62710 ?auto_62712 ) ) ( not ( = ?auto_62710 ?auto_62713 ) ) ( not ( = ?auto_62711 ?auto_62712 ) ) ( not ( = ?auto_62711 ?auto_62713 ) ) ( not ( = ?auto_62712 ?auto_62713 ) ) ( ON ?auto_62713 ?auto_62714 ) ( CLEAR ?auto_62713 ) ( HAND-EMPTY ) ( not ( = ?auto_62709 ?auto_62714 ) ) ( not ( = ?auto_62710 ?auto_62714 ) ) ( not ( = ?auto_62711 ?auto_62714 ) ) ( not ( = ?auto_62712 ?auto_62714 ) ) ( not ( = ?auto_62713 ?auto_62714 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62713 ?auto_62714 )
      ( MAKE-5PILE ?auto_62709 ?auto_62710 ?auto_62711 ?auto_62712 ?auto_62713 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62715 - BLOCK
      ?auto_62716 - BLOCK
      ?auto_62717 - BLOCK
      ?auto_62718 - BLOCK
      ?auto_62719 - BLOCK
    )
    :vars
    (
      ?auto_62720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62715 ) ( ON ?auto_62716 ?auto_62715 ) ( ON ?auto_62717 ?auto_62716 ) ( not ( = ?auto_62715 ?auto_62716 ) ) ( not ( = ?auto_62715 ?auto_62717 ) ) ( not ( = ?auto_62715 ?auto_62718 ) ) ( not ( = ?auto_62715 ?auto_62719 ) ) ( not ( = ?auto_62716 ?auto_62717 ) ) ( not ( = ?auto_62716 ?auto_62718 ) ) ( not ( = ?auto_62716 ?auto_62719 ) ) ( not ( = ?auto_62717 ?auto_62718 ) ) ( not ( = ?auto_62717 ?auto_62719 ) ) ( not ( = ?auto_62718 ?auto_62719 ) ) ( ON ?auto_62719 ?auto_62720 ) ( CLEAR ?auto_62719 ) ( not ( = ?auto_62715 ?auto_62720 ) ) ( not ( = ?auto_62716 ?auto_62720 ) ) ( not ( = ?auto_62717 ?auto_62720 ) ) ( not ( = ?auto_62718 ?auto_62720 ) ) ( not ( = ?auto_62719 ?auto_62720 ) ) ( HOLDING ?auto_62718 ) ( CLEAR ?auto_62717 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62715 ?auto_62716 ?auto_62717 ?auto_62718 )
      ( MAKE-5PILE ?auto_62715 ?auto_62716 ?auto_62717 ?auto_62718 ?auto_62719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62721 - BLOCK
      ?auto_62722 - BLOCK
      ?auto_62723 - BLOCK
      ?auto_62724 - BLOCK
      ?auto_62725 - BLOCK
    )
    :vars
    (
      ?auto_62726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62721 ) ( ON ?auto_62722 ?auto_62721 ) ( ON ?auto_62723 ?auto_62722 ) ( not ( = ?auto_62721 ?auto_62722 ) ) ( not ( = ?auto_62721 ?auto_62723 ) ) ( not ( = ?auto_62721 ?auto_62724 ) ) ( not ( = ?auto_62721 ?auto_62725 ) ) ( not ( = ?auto_62722 ?auto_62723 ) ) ( not ( = ?auto_62722 ?auto_62724 ) ) ( not ( = ?auto_62722 ?auto_62725 ) ) ( not ( = ?auto_62723 ?auto_62724 ) ) ( not ( = ?auto_62723 ?auto_62725 ) ) ( not ( = ?auto_62724 ?auto_62725 ) ) ( ON ?auto_62725 ?auto_62726 ) ( not ( = ?auto_62721 ?auto_62726 ) ) ( not ( = ?auto_62722 ?auto_62726 ) ) ( not ( = ?auto_62723 ?auto_62726 ) ) ( not ( = ?auto_62724 ?auto_62726 ) ) ( not ( = ?auto_62725 ?auto_62726 ) ) ( CLEAR ?auto_62723 ) ( ON ?auto_62724 ?auto_62725 ) ( CLEAR ?auto_62724 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62726 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62726 ?auto_62725 )
      ( MAKE-5PILE ?auto_62721 ?auto_62722 ?auto_62723 ?auto_62724 ?auto_62725 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62727 - BLOCK
      ?auto_62728 - BLOCK
      ?auto_62729 - BLOCK
      ?auto_62730 - BLOCK
      ?auto_62731 - BLOCK
    )
    :vars
    (
      ?auto_62732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62727 ) ( ON ?auto_62728 ?auto_62727 ) ( not ( = ?auto_62727 ?auto_62728 ) ) ( not ( = ?auto_62727 ?auto_62729 ) ) ( not ( = ?auto_62727 ?auto_62730 ) ) ( not ( = ?auto_62727 ?auto_62731 ) ) ( not ( = ?auto_62728 ?auto_62729 ) ) ( not ( = ?auto_62728 ?auto_62730 ) ) ( not ( = ?auto_62728 ?auto_62731 ) ) ( not ( = ?auto_62729 ?auto_62730 ) ) ( not ( = ?auto_62729 ?auto_62731 ) ) ( not ( = ?auto_62730 ?auto_62731 ) ) ( ON ?auto_62731 ?auto_62732 ) ( not ( = ?auto_62727 ?auto_62732 ) ) ( not ( = ?auto_62728 ?auto_62732 ) ) ( not ( = ?auto_62729 ?auto_62732 ) ) ( not ( = ?auto_62730 ?auto_62732 ) ) ( not ( = ?auto_62731 ?auto_62732 ) ) ( ON ?auto_62730 ?auto_62731 ) ( CLEAR ?auto_62730 ) ( ON-TABLE ?auto_62732 ) ( HOLDING ?auto_62729 ) ( CLEAR ?auto_62728 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62727 ?auto_62728 ?auto_62729 )
      ( MAKE-5PILE ?auto_62727 ?auto_62728 ?auto_62729 ?auto_62730 ?auto_62731 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62733 - BLOCK
      ?auto_62734 - BLOCK
      ?auto_62735 - BLOCK
      ?auto_62736 - BLOCK
      ?auto_62737 - BLOCK
    )
    :vars
    (
      ?auto_62738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62733 ) ( ON ?auto_62734 ?auto_62733 ) ( not ( = ?auto_62733 ?auto_62734 ) ) ( not ( = ?auto_62733 ?auto_62735 ) ) ( not ( = ?auto_62733 ?auto_62736 ) ) ( not ( = ?auto_62733 ?auto_62737 ) ) ( not ( = ?auto_62734 ?auto_62735 ) ) ( not ( = ?auto_62734 ?auto_62736 ) ) ( not ( = ?auto_62734 ?auto_62737 ) ) ( not ( = ?auto_62735 ?auto_62736 ) ) ( not ( = ?auto_62735 ?auto_62737 ) ) ( not ( = ?auto_62736 ?auto_62737 ) ) ( ON ?auto_62737 ?auto_62738 ) ( not ( = ?auto_62733 ?auto_62738 ) ) ( not ( = ?auto_62734 ?auto_62738 ) ) ( not ( = ?auto_62735 ?auto_62738 ) ) ( not ( = ?auto_62736 ?auto_62738 ) ) ( not ( = ?auto_62737 ?auto_62738 ) ) ( ON ?auto_62736 ?auto_62737 ) ( ON-TABLE ?auto_62738 ) ( CLEAR ?auto_62734 ) ( ON ?auto_62735 ?auto_62736 ) ( CLEAR ?auto_62735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62738 ?auto_62737 ?auto_62736 )
      ( MAKE-5PILE ?auto_62733 ?auto_62734 ?auto_62735 ?auto_62736 ?auto_62737 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62739 - BLOCK
      ?auto_62740 - BLOCK
      ?auto_62741 - BLOCK
      ?auto_62742 - BLOCK
      ?auto_62743 - BLOCK
    )
    :vars
    (
      ?auto_62744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62739 ) ( not ( = ?auto_62739 ?auto_62740 ) ) ( not ( = ?auto_62739 ?auto_62741 ) ) ( not ( = ?auto_62739 ?auto_62742 ) ) ( not ( = ?auto_62739 ?auto_62743 ) ) ( not ( = ?auto_62740 ?auto_62741 ) ) ( not ( = ?auto_62740 ?auto_62742 ) ) ( not ( = ?auto_62740 ?auto_62743 ) ) ( not ( = ?auto_62741 ?auto_62742 ) ) ( not ( = ?auto_62741 ?auto_62743 ) ) ( not ( = ?auto_62742 ?auto_62743 ) ) ( ON ?auto_62743 ?auto_62744 ) ( not ( = ?auto_62739 ?auto_62744 ) ) ( not ( = ?auto_62740 ?auto_62744 ) ) ( not ( = ?auto_62741 ?auto_62744 ) ) ( not ( = ?auto_62742 ?auto_62744 ) ) ( not ( = ?auto_62743 ?auto_62744 ) ) ( ON ?auto_62742 ?auto_62743 ) ( ON-TABLE ?auto_62744 ) ( ON ?auto_62741 ?auto_62742 ) ( CLEAR ?auto_62741 ) ( HOLDING ?auto_62740 ) ( CLEAR ?auto_62739 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62739 ?auto_62740 )
      ( MAKE-5PILE ?auto_62739 ?auto_62740 ?auto_62741 ?auto_62742 ?auto_62743 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62745 - BLOCK
      ?auto_62746 - BLOCK
      ?auto_62747 - BLOCK
      ?auto_62748 - BLOCK
      ?auto_62749 - BLOCK
    )
    :vars
    (
      ?auto_62750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62745 ) ( not ( = ?auto_62745 ?auto_62746 ) ) ( not ( = ?auto_62745 ?auto_62747 ) ) ( not ( = ?auto_62745 ?auto_62748 ) ) ( not ( = ?auto_62745 ?auto_62749 ) ) ( not ( = ?auto_62746 ?auto_62747 ) ) ( not ( = ?auto_62746 ?auto_62748 ) ) ( not ( = ?auto_62746 ?auto_62749 ) ) ( not ( = ?auto_62747 ?auto_62748 ) ) ( not ( = ?auto_62747 ?auto_62749 ) ) ( not ( = ?auto_62748 ?auto_62749 ) ) ( ON ?auto_62749 ?auto_62750 ) ( not ( = ?auto_62745 ?auto_62750 ) ) ( not ( = ?auto_62746 ?auto_62750 ) ) ( not ( = ?auto_62747 ?auto_62750 ) ) ( not ( = ?auto_62748 ?auto_62750 ) ) ( not ( = ?auto_62749 ?auto_62750 ) ) ( ON ?auto_62748 ?auto_62749 ) ( ON-TABLE ?auto_62750 ) ( ON ?auto_62747 ?auto_62748 ) ( CLEAR ?auto_62745 ) ( ON ?auto_62746 ?auto_62747 ) ( CLEAR ?auto_62746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62750 ?auto_62749 ?auto_62748 ?auto_62747 )
      ( MAKE-5PILE ?auto_62745 ?auto_62746 ?auto_62747 ?auto_62748 ?auto_62749 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62751 - BLOCK
      ?auto_62752 - BLOCK
      ?auto_62753 - BLOCK
      ?auto_62754 - BLOCK
      ?auto_62755 - BLOCK
    )
    :vars
    (
      ?auto_62756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62751 ?auto_62752 ) ) ( not ( = ?auto_62751 ?auto_62753 ) ) ( not ( = ?auto_62751 ?auto_62754 ) ) ( not ( = ?auto_62751 ?auto_62755 ) ) ( not ( = ?auto_62752 ?auto_62753 ) ) ( not ( = ?auto_62752 ?auto_62754 ) ) ( not ( = ?auto_62752 ?auto_62755 ) ) ( not ( = ?auto_62753 ?auto_62754 ) ) ( not ( = ?auto_62753 ?auto_62755 ) ) ( not ( = ?auto_62754 ?auto_62755 ) ) ( ON ?auto_62755 ?auto_62756 ) ( not ( = ?auto_62751 ?auto_62756 ) ) ( not ( = ?auto_62752 ?auto_62756 ) ) ( not ( = ?auto_62753 ?auto_62756 ) ) ( not ( = ?auto_62754 ?auto_62756 ) ) ( not ( = ?auto_62755 ?auto_62756 ) ) ( ON ?auto_62754 ?auto_62755 ) ( ON-TABLE ?auto_62756 ) ( ON ?auto_62753 ?auto_62754 ) ( ON ?auto_62752 ?auto_62753 ) ( CLEAR ?auto_62752 ) ( HOLDING ?auto_62751 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62751 )
      ( MAKE-5PILE ?auto_62751 ?auto_62752 ?auto_62753 ?auto_62754 ?auto_62755 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62757 - BLOCK
      ?auto_62758 - BLOCK
      ?auto_62759 - BLOCK
      ?auto_62760 - BLOCK
      ?auto_62761 - BLOCK
    )
    :vars
    (
      ?auto_62762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62757 ?auto_62758 ) ) ( not ( = ?auto_62757 ?auto_62759 ) ) ( not ( = ?auto_62757 ?auto_62760 ) ) ( not ( = ?auto_62757 ?auto_62761 ) ) ( not ( = ?auto_62758 ?auto_62759 ) ) ( not ( = ?auto_62758 ?auto_62760 ) ) ( not ( = ?auto_62758 ?auto_62761 ) ) ( not ( = ?auto_62759 ?auto_62760 ) ) ( not ( = ?auto_62759 ?auto_62761 ) ) ( not ( = ?auto_62760 ?auto_62761 ) ) ( ON ?auto_62761 ?auto_62762 ) ( not ( = ?auto_62757 ?auto_62762 ) ) ( not ( = ?auto_62758 ?auto_62762 ) ) ( not ( = ?auto_62759 ?auto_62762 ) ) ( not ( = ?auto_62760 ?auto_62762 ) ) ( not ( = ?auto_62761 ?auto_62762 ) ) ( ON ?auto_62760 ?auto_62761 ) ( ON-TABLE ?auto_62762 ) ( ON ?auto_62759 ?auto_62760 ) ( ON ?auto_62758 ?auto_62759 ) ( ON ?auto_62757 ?auto_62758 ) ( CLEAR ?auto_62757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62762 ?auto_62761 ?auto_62760 ?auto_62759 ?auto_62758 )
      ( MAKE-5PILE ?auto_62757 ?auto_62758 ?auto_62759 ?auto_62760 ?auto_62761 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62763 - BLOCK
      ?auto_62764 - BLOCK
      ?auto_62765 - BLOCK
      ?auto_62766 - BLOCK
      ?auto_62767 - BLOCK
    )
    :vars
    (
      ?auto_62768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62763 ?auto_62764 ) ) ( not ( = ?auto_62763 ?auto_62765 ) ) ( not ( = ?auto_62763 ?auto_62766 ) ) ( not ( = ?auto_62763 ?auto_62767 ) ) ( not ( = ?auto_62764 ?auto_62765 ) ) ( not ( = ?auto_62764 ?auto_62766 ) ) ( not ( = ?auto_62764 ?auto_62767 ) ) ( not ( = ?auto_62765 ?auto_62766 ) ) ( not ( = ?auto_62765 ?auto_62767 ) ) ( not ( = ?auto_62766 ?auto_62767 ) ) ( ON ?auto_62767 ?auto_62768 ) ( not ( = ?auto_62763 ?auto_62768 ) ) ( not ( = ?auto_62764 ?auto_62768 ) ) ( not ( = ?auto_62765 ?auto_62768 ) ) ( not ( = ?auto_62766 ?auto_62768 ) ) ( not ( = ?auto_62767 ?auto_62768 ) ) ( ON ?auto_62766 ?auto_62767 ) ( ON-TABLE ?auto_62768 ) ( ON ?auto_62765 ?auto_62766 ) ( ON ?auto_62764 ?auto_62765 ) ( HOLDING ?auto_62763 ) ( CLEAR ?auto_62764 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62768 ?auto_62767 ?auto_62766 ?auto_62765 ?auto_62764 ?auto_62763 )
      ( MAKE-5PILE ?auto_62763 ?auto_62764 ?auto_62765 ?auto_62766 ?auto_62767 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62769 - BLOCK
      ?auto_62770 - BLOCK
      ?auto_62771 - BLOCK
      ?auto_62772 - BLOCK
      ?auto_62773 - BLOCK
    )
    :vars
    (
      ?auto_62774 - BLOCK
      ?auto_62775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62769 ?auto_62770 ) ) ( not ( = ?auto_62769 ?auto_62771 ) ) ( not ( = ?auto_62769 ?auto_62772 ) ) ( not ( = ?auto_62769 ?auto_62773 ) ) ( not ( = ?auto_62770 ?auto_62771 ) ) ( not ( = ?auto_62770 ?auto_62772 ) ) ( not ( = ?auto_62770 ?auto_62773 ) ) ( not ( = ?auto_62771 ?auto_62772 ) ) ( not ( = ?auto_62771 ?auto_62773 ) ) ( not ( = ?auto_62772 ?auto_62773 ) ) ( ON ?auto_62773 ?auto_62774 ) ( not ( = ?auto_62769 ?auto_62774 ) ) ( not ( = ?auto_62770 ?auto_62774 ) ) ( not ( = ?auto_62771 ?auto_62774 ) ) ( not ( = ?auto_62772 ?auto_62774 ) ) ( not ( = ?auto_62773 ?auto_62774 ) ) ( ON ?auto_62772 ?auto_62773 ) ( ON-TABLE ?auto_62774 ) ( ON ?auto_62771 ?auto_62772 ) ( ON ?auto_62770 ?auto_62771 ) ( CLEAR ?auto_62770 ) ( ON ?auto_62769 ?auto_62775 ) ( CLEAR ?auto_62769 ) ( HAND-EMPTY ) ( not ( = ?auto_62769 ?auto_62775 ) ) ( not ( = ?auto_62770 ?auto_62775 ) ) ( not ( = ?auto_62771 ?auto_62775 ) ) ( not ( = ?auto_62772 ?auto_62775 ) ) ( not ( = ?auto_62773 ?auto_62775 ) ) ( not ( = ?auto_62774 ?auto_62775 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62769 ?auto_62775 )
      ( MAKE-5PILE ?auto_62769 ?auto_62770 ?auto_62771 ?auto_62772 ?auto_62773 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62776 - BLOCK
      ?auto_62777 - BLOCK
      ?auto_62778 - BLOCK
      ?auto_62779 - BLOCK
      ?auto_62780 - BLOCK
    )
    :vars
    (
      ?auto_62782 - BLOCK
      ?auto_62781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62776 ?auto_62777 ) ) ( not ( = ?auto_62776 ?auto_62778 ) ) ( not ( = ?auto_62776 ?auto_62779 ) ) ( not ( = ?auto_62776 ?auto_62780 ) ) ( not ( = ?auto_62777 ?auto_62778 ) ) ( not ( = ?auto_62777 ?auto_62779 ) ) ( not ( = ?auto_62777 ?auto_62780 ) ) ( not ( = ?auto_62778 ?auto_62779 ) ) ( not ( = ?auto_62778 ?auto_62780 ) ) ( not ( = ?auto_62779 ?auto_62780 ) ) ( ON ?auto_62780 ?auto_62782 ) ( not ( = ?auto_62776 ?auto_62782 ) ) ( not ( = ?auto_62777 ?auto_62782 ) ) ( not ( = ?auto_62778 ?auto_62782 ) ) ( not ( = ?auto_62779 ?auto_62782 ) ) ( not ( = ?auto_62780 ?auto_62782 ) ) ( ON ?auto_62779 ?auto_62780 ) ( ON-TABLE ?auto_62782 ) ( ON ?auto_62778 ?auto_62779 ) ( ON ?auto_62776 ?auto_62781 ) ( CLEAR ?auto_62776 ) ( not ( = ?auto_62776 ?auto_62781 ) ) ( not ( = ?auto_62777 ?auto_62781 ) ) ( not ( = ?auto_62778 ?auto_62781 ) ) ( not ( = ?auto_62779 ?auto_62781 ) ) ( not ( = ?auto_62780 ?auto_62781 ) ) ( not ( = ?auto_62782 ?auto_62781 ) ) ( HOLDING ?auto_62777 ) ( CLEAR ?auto_62778 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62782 ?auto_62780 ?auto_62779 ?auto_62778 ?auto_62777 )
      ( MAKE-5PILE ?auto_62776 ?auto_62777 ?auto_62778 ?auto_62779 ?auto_62780 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62783 - BLOCK
      ?auto_62784 - BLOCK
      ?auto_62785 - BLOCK
      ?auto_62786 - BLOCK
      ?auto_62787 - BLOCK
    )
    :vars
    (
      ?auto_62789 - BLOCK
      ?auto_62788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62783 ?auto_62784 ) ) ( not ( = ?auto_62783 ?auto_62785 ) ) ( not ( = ?auto_62783 ?auto_62786 ) ) ( not ( = ?auto_62783 ?auto_62787 ) ) ( not ( = ?auto_62784 ?auto_62785 ) ) ( not ( = ?auto_62784 ?auto_62786 ) ) ( not ( = ?auto_62784 ?auto_62787 ) ) ( not ( = ?auto_62785 ?auto_62786 ) ) ( not ( = ?auto_62785 ?auto_62787 ) ) ( not ( = ?auto_62786 ?auto_62787 ) ) ( ON ?auto_62787 ?auto_62789 ) ( not ( = ?auto_62783 ?auto_62789 ) ) ( not ( = ?auto_62784 ?auto_62789 ) ) ( not ( = ?auto_62785 ?auto_62789 ) ) ( not ( = ?auto_62786 ?auto_62789 ) ) ( not ( = ?auto_62787 ?auto_62789 ) ) ( ON ?auto_62786 ?auto_62787 ) ( ON-TABLE ?auto_62789 ) ( ON ?auto_62785 ?auto_62786 ) ( ON ?auto_62783 ?auto_62788 ) ( not ( = ?auto_62783 ?auto_62788 ) ) ( not ( = ?auto_62784 ?auto_62788 ) ) ( not ( = ?auto_62785 ?auto_62788 ) ) ( not ( = ?auto_62786 ?auto_62788 ) ) ( not ( = ?auto_62787 ?auto_62788 ) ) ( not ( = ?auto_62789 ?auto_62788 ) ) ( CLEAR ?auto_62785 ) ( ON ?auto_62784 ?auto_62783 ) ( CLEAR ?auto_62784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62788 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62788 ?auto_62783 )
      ( MAKE-5PILE ?auto_62783 ?auto_62784 ?auto_62785 ?auto_62786 ?auto_62787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62790 - BLOCK
      ?auto_62791 - BLOCK
      ?auto_62792 - BLOCK
      ?auto_62793 - BLOCK
      ?auto_62794 - BLOCK
    )
    :vars
    (
      ?auto_62796 - BLOCK
      ?auto_62795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62790 ?auto_62791 ) ) ( not ( = ?auto_62790 ?auto_62792 ) ) ( not ( = ?auto_62790 ?auto_62793 ) ) ( not ( = ?auto_62790 ?auto_62794 ) ) ( not ( = ?auto_62791 ?auto_62792 ) ) ( not ( = ?auto_62791 ?auto_62793 ) ) ( not ( = ?auto_62791 ?auto_62794 ) ) ( not ( = ?auto_62792 ?auto_62793 ) ) ( not ( = ?auto_62792 ?auto_62794 ) ) ( not ( = ?auto_62793 ?auto_62794 ) ) ( ON ?auto_62794 ?auto_62796 ) ( not ( = ?auto_62790 ?auto_62796 ) ) ( not ( = ?auto_62791 ?auto_62796 ) ) ( not ( = ?auto_62792 ?auto_62796 ) ) ( not ( = ?auto_62793 ?auto_62796 ) ) ( not ( = ?auto_62794 ?auto_62796 ) ) ( ON ?auto_62793 ?auto_62794 ) ( ON-TABLE ?auto_62796 ) ( ON ?auto_62790 ?auto_62795 ) ( not ( = ?auto_62790 ?auto_62795 ) ) ( not ( = ?auto_62791 ?auto_62795 ) ) ( not ( = ?auto_62792 ?auto_62795 ) ) ( not ( = ?auto_62793 ?auto_62795 ) ) ( not ( = ?auto_62794 ?auto_62795 ) ) ( not ( = ?auto_62796 ?auto_62795 ) ) ( ON ?auto_62791 ?auto_62790 ) ( CLEAR ?auto_62791 ) ( ON-TABLE ?auto_62795 ) ( HOLDING ?auto_62792 ) ( CLEAR ?auto_62793 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62796 ?auto_62794 ?auto_62793 ?auto_62792 )
      ( MAKE-5PILE ?auto_62790 ?auto_62791 ?auto_62792 ?auto_62793 ?auto_62794 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62797 - BLOCK
      ?auto_62798 - BLOCK
      ?auto_62799 - BLOCK
      ?auto_62800 - BLOCK
      ?auto_62801 - BLOCK
    )
    :vars
    (
      ?auto_62803 - BLOCK
      ?auto_62802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62797 ?auto_62798 ) ) ( not ( = ?auto_62797 ?auto_62799 ) ) ( not ( = ?auto_62797 ?auto_62800 ) ) ( not ( = ?auto_62797 ?auto_62801 ) ) ( not ( = ?auto_62798 ?auto_62799 ) ) ( not ( = ?auto_62798 ?auto_62800 ) ) ( not ( = ?auto_62798 ?auto_62801 ) ) ( not ( = ?auto_62799 ?auto_62800 ) ) ( not ( = ?auto_62799 ?auto_62801 ) ) ( not ( = ?auto_62800 ?auto_62801 ) ) ( ON ?auto_62801 ?auto_62803 ) ( not ( = ?auto_62797 ?auto_62803 ) ) ( not ( = ?auto_62798 ?auto_62803 ) ) ( not ( = ?auto_62799 ?auto_62803 ) ) ( not ( = ?auto_62800 ?auto_62803 ) ) ( not ( = ?auto_62801 ?auto_62803 ) ) ( ON ?auto_62800 ?auto_62801 ) ( ON-TABLE ?auto_62803 ) ( ON ?auto_62797 ?auto_62802 ) ( not ( = ?auto_62797 ?auto_62802 ) ) ( not ( = ?auto_62798 ?auto_62802 ) ) ( not ( = ?auto_62799 ?auto_62802 ) ) ( not ( = ?auto_62800 ?auto_62802 ) ) ( not ( = ?auto_62801 ?auto_62802 ) ) ( not ( = ?auto_62803 ?auto_62802 ) ) ( ON ?auto_62798 ?auto_62797 ) ( ON-TABLE ?auto_62802 ) ( CLEAR ?auto_62800 ) ( ON ?auto_62799 ?auto_62798 ) ( CLEAR ?auto_62799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62802 ?auto_62797 ?auto_62798 )
      ( MAKE-5PILE ?auto_62797 ?auto_62798 ?auto_62799 ?auto_62800 ?auto_62801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62804 - BLOCK
      ?auto_62805 - BLOCK
      ?auto_62806 - BLOCK
      ?auto_62807 - BLOCK
      ?auto_62808 - BLOCK
    )
    :vars
    (
      ?auto_62810 - BLOCK
      ?auto_62809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62804 ?auto_62805 ) ) ( not ( = ?auto_62804 ?auto_62806 ) ) ( not ( = ?auto_62804 ?auto_62807 ) ) ( not ( = ?auto_62804 ?auto_62808 ) ) ( not ( = ?auto_62805 ?auto_62806 ) ) ( not ( = ?auto_62805 ?auto_62807 ) ) ( not ( = ?auto_62805 ?auto_62808 ) ) ( not ( = ?auto_62806 ?auto_62807 ) ) ( not ( = ?auto_62806 ?auto_62808 ) ) ( not ( = ?auto_62807 ?auto_62808 ) ) ( ON ?auto_62808 ?auto_62810 ) ( not ( = ?auto_62804 ?auto_62810 ) ) ( not ( = ?auto_62805 ?auto_62810 ) ) ( not ( = ?auto_62806 ?auto_62810 ) ) ( not ( = ?auto_62807 ?auto_62810 ) ) ( not ( = ?auto_62808 ?auto_62810 ) ) ( ON-TABLE ?auto_62810 ) ( ON ?auto_62804 ?auto_62809 ) ( not ( = ?auto_62804 ?auto_62809 ) ) ( not ( = ?auto_62805 ?auto_62809 ) ) ( not ( = ?auto_62806 ?auto_62809 ) ) ( not ( = ?auto_62807 ?auto_62809 ) ) ( not ( = ?auto_62808 ?auto_62809 ) ) ( not ( = ?auto_62810 ?auto_62809 ) ) ( ON ?auto_62805 ?auto_62804 ) ( ON-TABLE ?auto_62809 ) ( ON ?auto_62806 ?auto_62805 ) ( CLEAR ?auto_62806 ) ( HOLDING ?auto_62807 ) ( CLEAR ?auto_62808 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62810 ?auto_62808 ?auto_62807 )
      ( MAKE-5PILE ?auto_62804 ?auto_62805 ?auto_62806 ?auto_62807 ?auto_62808 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62811 - BLOCK
      ?auto_62812 - BLOCK
      ?auto_62813 - BLOCK
      ?auto_62814 - BLOCK
      ?auto_62815 - BLOCK
    )
    :vars
    (
      ?auto_62817 - BLOCK
      ?auto_62816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62811 ?auto_62812 ) ) ( not ( = ?auto_62811 ?auto_62813 ) ) ( not ( = ?auto_62811 ?auto_62814 ) ) ( not ( = ?auto_62811 ?auto_62815 ) ) ( not ( = ?auto_62812 ?auto_62813 ) ) ( not ( = ?auto_62812 ?auto_62814 ) ) ( not ( = ?auto_62812 ?auto_62815 ) ) ( not ( = ?auto_62813 ?auto_62814 ) ) ( not ( = ?auto_62813 ?auto_62815 ) ) ( not ( = ?auto_62814 ?auto_62815 ) ) ( ON ?auto_62815 ?auto_62817 ) ( not ( = ?auto_62811 ?auto_62817 ) ) ( not ( = ?auto_62812 ?auto_62817 ) ) ( not ( = ?auto_62813 ?auto_62817 ) ) ( not ( = ?auto_62814 ?auto_62817 ) ) ( not ( = ?auto_62815 ?auto_62817 ) ) ( ON-TABLE ?auto_62817 ) ( ON ?auto_62811 ?auto_62816 ) ( not ( = ?auto_62811 ?auto_62816 ) ) ( not ( = ?auto_62812 ?auto_62816 ) ) ( not ( = ?auto_62813 ?auto_62816 ) ) ( not ( = ?auto_62814 ?auto_62816 ) ) ( not ( = ?auto_62815 ?auto_62816 ) ) ( not ( = ?auto_62817 ?auto_62816 ) ) ( ON ?auto_62812 ?auto_62811 ) ( ON-TABLE ?auto_62816 ) ( ON ?auto_62813 ?auto_62812 ) ( CLEAR ?auto_62815 ) ( ON ?auto_62814 ?auto_62813 ) ( CLEAR ?auto_62814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62816 ?auto_62811 ?auto_62812 ?auto_62813 )
      ( MAKE-5PILE ?auto_62811 ?auto_62812 ?auto_62813 ?auto_62814 ?auto_62815 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62818 - BLOCK
      ?auto_62819 - BLOCK
      ?auto_62820 - BLOCK
      ?auto_62821 - BLOCK
      ?auto_62822 - BLOCK
    )
    :vars
    (
      ?auto_62823 - BLOCK
      ?auto_62824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62818 ?auto_62819 ) ) ( not ( = ?auto_62818 ?auto_62820 ) ) ( not ( = ?auto_62818 ?auto_62821 ) ) ( not ( = ?auto_62818 ?auto_62822 ) ) ( not ( = ?auto_62819 ?auto_62820 ) ) ( not ( = ?auto_62819 ?auto_62821 ) ) ( not ( = ?auto_62819 ?auto_62822 ) ) ( not ( = ?auto_62820 ?auto_62821 ) ) ( not ( = ?auto_62820 ?auto_62822 ) ) ( not ( = ?auto_62821 ?auto_62822 ) ) ( not ( = ?auto_62818 ?auto_62823 ) ) ( not ( = ?auto_62819 ?auto_62823 ) ) ( not ( = ?auto_62820 ?auto_62823 ) ) ( not ( = ?auto_62821 ?auto_62823 ) ) ( not ( = ?auto_62822 ?auto_62823 ) ) ( ON-TABLE ?auto_62823 ) ( ON ?auto_62818 ?auto_62824 ) ( not ( = ?auto_62818 ?auto_62824 ) ) ( not ( = ?auto_62819 ?auto_62824 ) ) ( not ( = ?auto_62820 ?auto_62824 ) ) ( not ( = ?auto_62821 ?auto_62824 ) ) ( not ( = ?auto_62822 ?auto_62824 ) ) ( not ( = ?auto_62823 ?auto_62824 ) ) ( ON ?auto_62819 ?auto_62818 ) ( ON-TABLE ?auto_62824 ) ( ON ?auto_62820 ?auto_62819 ) ( ON ?auto_62821 ?auto_62820 ) ( CLEAR ?auto_62821 ) ( HOLDING ?auto_62822 ) ( CLEAR ?auto_62823 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62823 ?auto_62822 )
      ( MAKE-5PILE ?auto_62818 ?auto_62819 ?auto_62820 ?auto_62821 ?auto_62822 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62825 - BLOCK
      ?auto_62826 - BLOCK
      ?auto_62827 - BLOCK
      ?auto_62828 - BLOCK
      ?auto_62829 - BLOCK
    )
    :vars
    (
      ?auto_62830 - BLOCK
      ?auto_62831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62825 ?auto_62826 ) ) ( not ( = ?auto_62825 ?auto_62827 ) ) ( not ( = ?auto_62825 ?auto_62828 ) ) ( not ( = ?auto_62825 ?auto_62829 ) ) ( not ( = ?auto_62826 ?auto_62827 ) ) ( not ( = ?auto_62826 ?auto_62828 ) ) ( not ( = ?auto_62826 ?auto_62829 ) ) ( not ( = ?auto_62827 ?auto_62828 ) ) ( not ( = ?auto_62827 ?auto_62829 ) ) ( not ( = ?auto_62828 ?auto_62829 ) ) ( not ( = ?auto_62825 ?auto_62830 ) ) ( not ( = ?auto_62826 ?auto_62830 ) ) ( not ( = ?auto_62827 ?auto_62830 ) ) ( not ( = ?auto_62828 ?auto_62830 ) ) ( not ( = ?auto_62829 ?auto_62830 ) ) ( ON-TABLE ?auto_62830 ) ( ON ?auto_62825 ?auto_62831 ) ( not ( = ?auto_62825 ?auto_62831 ) ) ( not ( = ?auto_62826 ?auto_62831 ) ) ( not ( = ?auto_62827 ?auto_62831 ) ) ( not ( = ?auto_62828 ?auto_62831 ) ) ( not ( = ?auto_62829 ?auto_62831 ) ) ( not ( = ?auto_62830 ?auto_62831 ) ) ( ON ?auto_62826 ?auto_62825 ) ( ON-TABLE ?auto_62831 ) ( ON ?auto_62827 ?auto_62826 ) ( ON ?auto_62828 ?auto_62827 ) ( CLEAR ?auto_62830 ) ( ON ?auto_62829 ?auto_62828 ) ( CLEAR ?auto_62829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62831 ?auto_62825 ?auto_62826 ?auto_62827 ?auto_62828 )
      ( MAKE-5PILE ?auto_62825 ?auto_62826 ?auto_62827 ?auto_62828 ?auto_62829 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62832 - BLOCK
      ?auto_62833 - BLOCK
      ?auto_62834 - BLOCK
      ?auto_62835 - BLOCK
      ?auto_62836 - BLOCK
    )
    :vars
    (
      ?auto_62837 - BLOCK
      ?auto_62838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62832 ?auto_62833 ) ) ( not ( = ?auto_62832 ?auto_62834 ) ) ( not ( = ?auto_62832 ?auto_62835 ) ) ( not ( = ?auto_62832 ?auto_62836 ) ) ( not ( = ?auto_62833 ?auto_62834 ) ) ( not ( = ?auto_62833 ?auto_62835 ) ) ( not ( = ?auto_62833 ?auto_62836 ) ) ( not ( = ?auto_62834 ?auto_62835 ) ) ( not ( = ?auto_62834 ?auto_62836 ) ) ( not ( = ?auto_62835 ?auto_62836 ) ) ( not ( = ?auto_62832 ?auto_62837 ) ) ( not ( = ?auto_62833 ?auto_62837 ) ) ( not ( = ?auto_62834 ?auto_62837 ) ) ( not ( = ?auto_62835 ?auto_62837 ) ) ( not ( = ?auto_62836 ?auto_62837 ) ) ( ON ?auto_62832 ?auto_62838 ) ( not ( = ?auto_62832 ?auto_62838 ) ) ( not ( = ?auto_62833 ?auto_62838 ) ) ( not ( = ?auto_62834 ?auto_62838 ) ) ( not ( = ?auto_62835 ?auto_62838 ) ) ( not ( = ?auto_62836 ?auto_62838 ) ) ( not ( = ?auto_62837 ?auto_62838 ) ) ( ON ?auto_62833 ?auto_62832 ) ( ON-TABLE ?auto_62838 ) ( ON ?auto_62834 ?auto_62833 ) ( ON ?auto_62835 ?auto_62834 ) ( ON ?auto_62836 ?auto_62835 ) ( CLEAR ?auto_62836 ) ( HOLDING ?auto_62837 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62837 )
      ( MAKE-5PILE ?auto_62832 ?auto_62833 ?auto_62834 ?auto_62835 ?auto_62836 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_62839 - BLOCK
      ?auto_62840 - BLOCK
      ?auto_62841 - BLOCK
      ?auto_62842 - BLOCK
      ?auto_62843 - BLOCK
    )
    :vars
    (
      ?auto_62844 - BLOCK
      ?auto_62845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62839 ?auto_62840 ) ) ( not ( = ?auto_62839 ?auto_62841 ) ) ( not ( = ?auto_62839 ?auto_62842 ) ) ( not ( = ?auto_62839 ?auto_62843 ) ) ( not ( = ?auto_62840 ?auto_62841 ) ) ( not ( = ?auto_62840 ?auto_62842 ) ) ( not ( = ?auto_62840 ?auto_62843 ) ) ( not ( = ?auto_62841 ?auto_62842 ) ) ( not ( = ?auto_62841 ?auto_62843 ) ) ( not ( = ?auto_62842 ?auto_62843 ) ) ( not ( = ?auto_62839 ?auto_62844 ) ) ( not ( = ?auto_62840 ?auto_62844 ) ) ( not ( = ?auto_62841 ?auto_62844 ) ) ( not ( = ?auto_62842 ?auto_62844 ) ) ( not ( = ?auto_62843 ?auto_62844 ) ) ( ON ?auto_62839 ?auto_62845 ) ( not ( = ?auto_62839 ?auto_62845 ) ) ( not ( = ?auto_62840 ?auto_62845 ) ) ( not ( = ?auto_62841 ?auto_62845 ) ) ( not ( = ?auto_62842 ?auto_62845 ) ) ( not ( = ?auto_62843 ?auto_62845 ) ) ( not ( = ?auto_62844 ?auto_62845 ) ) ( ON ?auto_62840 ?auto_62839 ) ( ON-TABLE ?auto_62845 ) ( ON ?auto_62841 ?auto_62840 ) ( ON ?auto_62842 ?auto_62841 ) ( ON ?auto_62843 ?auto_62842 ) ( ON ?auto_62844 ?auto_62843 ) ( CLEAR ?auto_62844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62845 ?auto_62839 ?auto_62840 ?auto_62841 ?auto_62842 ?auto_62843 )
      ( MAKE-5PILE ?auto_62839 ?auto_62840 ?auto_62841 ?auto_62842 ?auto_62843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62852 - BLOCK
      ?auto_62853 - BLOCK
      ?auto_62854 - BLOCK
      ?auto_62855 - BLOCK
      ?auto_62856 - BLOCK
      ?auto_62857 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_62857 ) ( CLEAR ?auto_62856 ) ( ON-TABLE ?auto_62852 ) ( ON ?auto_62853 ?auto_62852 ) ( ON ?auto_62854 ?auto_62853 ) ( ON ?auto_62855 ?auto_62854 ) ( ON ?auto_62856 ?auto_62855 ) ( not ( = ?auto_62852 ?auto_62853 ) ) ( not ( = ?auto_62852 ?auto_62854 ) ) ( not ( = ?auto_62852 ?auto_62855 ) ) ( not ( = ?auto_62852 ?auto_62856 ) ) ( not ( = ?auto_62852 ?auto_62857 ) ) ( not ( = ?auto_62853 ?auto_62854 ) ) ( not ( = ?auto_62853 ?auto_62855 ) ) ( not ( = ?auto_62853 ?auto_62856 ) ) ( not ( = ?auto_62853 ?auto_62857 ) ) ( not ( = ?auto_62854 ?auto_62855 ) ) ( not ( = ?auto_62854 ?auto_62856 ) ) ( not ( = ?auto_62854 ?auto_62857 ) ) ( not ( = ?auto_62855 ?auto_62856 ) ) ( not ( = ?auto_62855 ?auto_62857 ) ) ( not ( = ?auto_62856 ?auto_62857 ) ) )
    :subtasks
    ( ( !STACK ?auto_62857 ?auto_62856 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62858 - BLOCK
      ?auto_62859 - BLOCK
      ?auto_62860 - BLOCK
      ?auto_62861 - BLOCK
      ?auto_62862 - BLOCK
      ?auto_62863 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_62862 ) ( ON-TABLE ?auto_62858 ) ( ON ?auto_62859 ?auto_62858 ) ( ON ?auto_62860 ?auto_62859 ) ( ON ?auto_62861 ?auto_62860 ) ( ON ?auto_62862 ?auto_62861 ) ( not ( = ?auto_62858 ?auto_62859 ) ) ( not ( = ?auto_62858 ?auto_62860 ) ) ( not ( = ?auto_62858 ?auto_62861 ) ) ( not ( = ?auto_62858 ?auto_62862 ) ) ( not ( = ?auto_62858 ?auto_62863 ) ) ( not ( = ?auto_62859 ?auto_62860 ) ) ( not ( = ?auto_62859 ?auto_62861 ) ) ( not ( = ?auto_62859 ?auto_62862 ) ) ( not ( = ?auto_62859 ?auto_62863 ) ) ( not ( = ?auto_62860 ?auto_62861 ) ) ( not ( = ?auto_62860 ?auto_62862 ) ) ( not ( = ?auto_62860 ?auto_62863 ) ) ( not ( = ?auto_62861 ?auto_62862 ) ) ( not ( = ?auto_62861 ?auto_62863 ) ) ( not ( = ?auto_62862 ?auto_62863 ) ) ( ON-TABLE ?auto_62863 ) ( CLEAR ?auto_62863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_62863 )
      ( MAKE-6PILE ?auto_62858 ?auto_62859 ?auto_62860 ?auto_62861 ?auto_62862 ?auto_62863 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62864 - BLOCK
      ?auto_62865 - BLOCK
      ?auto_62866 - BLOCK
      ?auto_62867 - BLOCK
      ?auto_62868 - BLOCK
      ?auto_62869 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62864 ) ( ON ?auto_62865 ?auto_62864 ) ( ON ?auto_62866 ?auto_62865 ) ( ON ?auto_62867 ?auto_62866 ) ( not ( = ?auto_62864 ?auto_62865 ) ) ( not ( = ?auto_62864 ?auto_62866 ) ) ( not ( = ?auto_62864 ?auto_62867 ) ) ( not ( = ?auto_62864 ?auto_62868 ) ) ( not ( = ?auto_62864 ?auto_62869 ) ) ( not ( = ?auto_62865 ?auto_62866 ) ) ( not ( = ?auto_62865 ?auto_62867 ) ) ( not ( = ?auto_62865 ?auto_62868 ) ) ( not ( = ?auto_62865 ?auto_62869 ) ) ( not ( = ?auto_62866 ?auto_62867 ) ) ( not ( = ?auto_62866 ?auto_62868 ) ) ( not ( = ?auto_62866 ?auto_62869 ) ) ( not ( = ?auto_62867 ?auto_62868 ) ) ( not ( = ?auto_62867 ?auto_62869 ) ) ( not ( = ?auto_62868 ?auto_62869 ) ) ( ON-TABLE ?auto_62869 ) ( CLEAR ?auto_62869 ) ( HOLDING ?auto_62868 ) ( CLEAR ?auto_62867 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62864 ?auto_62865 ?auto_62866 ?auto_62867 ?auto_62868 )
      ( MAKE-6PILE ?auto_62864 ?auto_62865 ?auto_62866 ?auto_62867 ?auto_62868 ?auto_62869 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62870 - BLOCK
      ?auto_62871 - BLOCK
      ?auto_62872 - BLOCK
      ?auto_62873 - BLOCK
      ?auto_62874 - BLOCK
      ?auto_62875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62870 ) ( ON ?auto_62871 ?auto_62870 ) ( ON ?auto_62872 ?auto_62871 ) ( ON ?auto_62873 ?auto_62872 ) ( not ( = ?auto_62870 ?auto_62871 ) ) ( not ( = ?auto_62870 ?auto_62872 ) ) ( not ( = ?auto_62870 ?auto_62873 ) ) ( not ( = ?auto_62870 ?auto_62874 ) ) ( not ( = ?auto_62870 ?auto_62875 ) ) ( not ( = ?auto_62871 ?auto_62872 ) ) ( not ( = ?auto_62871 ?auto_62873 ) ) ( not ( = ?auto_62871 ?auto_62874 ) ) ( not ( = ?auto_62871 ?auto_62875 ) ) ( not ( = ?auto_62872 ?auto_62873 ) ) ( not ( = ?auto_62872 ?auto_62874 ) ) ( not ( = ?auto_62872 ?auto_62875 ) ) ( not ( = ?auto_62873 ?auto_62874 ) ) ( not ( = ?auto_62873 ?auto_62875 ) ) ( not ( = ?auto_62874 ?auto_62875 ) ) ( ON-TABLE ?auto_62875 ) ( CLEAR ?auto_62873 ) ( ON ?auto_62874 ?auto_62875 ) ( CLEAR ?auto_62874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62875 )
      ( MAKE-6PILE ?auto_62870 ?auto_62871 ?auto_62872 ?auto_62873 ?auto_62874 ?auto_62875 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62876 - BLOCK
      ?auto_62877 - BLOCK
      ?auto_62878 - BLOCK
      ?auto_62879 - BLOCK
      ?auto_62880 - BLOCK
      ?auto_62881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62876 ) ( ON ?auto_62877 ?auto_62876 ) ( ON ?auto_62878 ?auto_62877 ) ( not ( = ?auto_62876 ?auto_62877 ) ) ( not ( = ?auto_62876 ?auto_62878 ) ) ( not ( = ?auto_62876 ?auto_62879 ) ) ( not ( = ?auto_62876 ?auto_62880 ) ) ( not ( = ?auto_62876 ?auto_62881 ) ) ( not ( = ?auto_62877 ?auto_62878 ) ) ( not ( = ?auto_62877 ?auto_62879 ) ) ( not ( = ?auto_62877 ?auto_62880 ) ) ( not ( = ?auto_62877 ?auto_62881 ) ) ( not ( = ?auto_62878 ?auto_62879 ) ) ( not ( = ?auto_62878 ?auto_62880 ) ) ( not ( = ?auto_62878 ?auto_62881 ) ) ( not ( = ?auto_62879 ?auto_62880 ) ) ( not ( = ?auto_62879 ?auto_62881 ) ) ( not ( = ?auto_62880 ?auto_62881 ) ) ( ON-TABLE ?auto_62881 ) ( ON ?auto_62880 ?auto_62881 ) ( CLEAR ?auto_62880 ) ( HOLDING ?auto_62879 ) ( CLEAR ?auto_62878 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62876 ?auto_62877 ?auto_62878 ?auto_62879 )
      ( MAKE-6PILE ?auto_62876 ?auto_62877 ?auto_62878 ?auto_62879 ?auto_62880 ?auto_62881 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62882 - BLOCK
      ?auto_62883 - BLOCK
      ?auto_62884 - BLOCK
      ?auto_62885 - BLOCK
      ?auto_62886 - BLOCK
      ?auto_62887 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62882 ) ( ON ?auto_62883 ?auto_62882 ) ( ON ?auto_62884 ?auto_62883 ) ( not ( = ?auto_62882 ?auto_62883 ) ) ( not ( = ?auto_62882 ?auto_62884 ) ) ( not ( = ?auto_62882 ?auto_62885 ) ) ( not ( = ?auto_62882 ?auto_62886 ) ) ( not ( = ?auto_62882 ?auto_62887 ) ) ( not ( = ?auto_62883 ?auto_62884 ) ) ( not ( = ?auto_62883 ?auto_62885 ) ) ( not ( = ?auto_62883 ?auto_62886 ) ) ( not ( = ?auto_62883 ?auto_62887 ) ) ( not ( = ?auto_62884 ?auto_62885 ) ) ( not ( = ?auto_62884 ?auto_62886 ) ) ( not ( = ?auto_62884 ?auto_62887 ) ) ( not ( = ?auto_62885 ?auto_62886 ) ) ( not ( = ?auto_62885 ?auto_62887 ) ) ( not ( = ?auto_62886 ?auto_62887 ) ) ( ON-TABLE ?auto_62887 ) ( ON ?auto_62886 ?auto_62887 ) ( CLEAR ?auto_62884 ) ( ON ?auto_62885 ?auto_62886 ) ( CLEAR ?auto_62885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62887 ?auto_62886 )
      ( MAKE-6PILE ?auto_62882 ?auto_62883 ?auto_62884 ?auto_62885 ?auto_62886 ?auto_62887 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62888 - BLOCK
      ?auto_62889 - BLOCK
      ?auto_62890 - BLOCK
      ?auto_62891 - BLOCK
      ?auto_62892 - BLOCK
      ?auto_62893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62888 ) ( ON ?auto_62889 ?auto_62888 ) ( not ( = ?auto_62888 ?auto_62889 ) ) ( not ( = ?auto_62888 ?auto_62890 ) ) ( not ( = ?auto_62888 ?auto_62891 ) ) ( not ( = ?auto_62888 ?auto_62892 ) ) ( not ( = ?auto_62888 ?auto_62893 ) ) ( not ( = ?auto_62889 ?auto_62890 ) ) ( not ( = ?auto_62889 ?auto_62891 ) ) ( not ( = ?auto_62889 ?auto_62892 ) ) ( not ( = ?auto_62889 ?auto_62893 ) ) ( not ( = ?auto_62890 ?auto_62891 ) ) ( not ( = ?auto_62890 ?auto_62892 ) ) ( not ( = ?auto_62890 ?auto_62893 ) ) ( not ( = ?auto_62891 ?auto_62892 ) ) ( not ( = ?auto_62891 ?auto_62893 ) ) ( not ( = ?auto_62892 ?auto_62893 ) ) ( ON-TABLE ?auto_62893 ) ( ON ?auto_62892 ?auto_62893 ) ( ON ?auto_62891 ?auto_62892 ) ( CLEAR ?auto_62891 ) ( HOLDING ?auto_62890 ) ( CLEAR ?auto_62889 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62888 ?auto_62889 ?auto_62890 )
      ( MAKE-6PILE ?auto_62888 ?auto_62889 ?auto_62890 ?auto_62891 ?auto_62892 ?auto_62893 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62894 - BLOCK
      ?auto_62895 - BLOCK
      ?auto_62896 - BLOCK
      ?auto_62897 - BLOCK
      ?auto_62898 - BLOCK
      ?auto_62899 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62894 ) ( ON ?auto_62895 ?auto_62894 ) ( not ( = ?auto_62894 ?auto_62895 ) ) ( not ( = ?auto_62894 ?auto_62896 ) ) ( not ( = ?auto_62894 ?auto_62897 ) ) ( not ( = ?auto_62894 ?auto_62898 ) ) ( not ( = ?auto_62894 ?auto_62899 ) ) ( not ( = ?auto_62895 ?auto_62896 ) ) ( not ( = ?auto_62895 ?auto_62897 ) ) ( not ( = ?auto_62895 ?auto_62898 ) ) ( not ( = ?auto_62895 ?auto_62899 ) ) ( not ( = ?auto_62896 ?auto_62897 ) ) ( not ( = ?auto_62896 ?auto_62898 ) ) ( not ( = ?auto_62896 ?auto_62899 ) ) ( not ( = ?auto_62897 ?auto_62898 ) ) ( not ( = ?auto_62897 ?auto_62899 ) ) ( not ( = ?auto_62898 ?auto_62899 ) ) ( ON-TABLE ?auto_62899 ) ( ON ?auto_62898 ?auto_62899 ) ( ON ?auto_62897 ?auto_62898 ) ( CLEAR ?auto_62895 ) ( ON ?auto_62896 ?auto_62897 ) ( CLEAR ?auto_62896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62899 ?auto_62898 ?auto_62897 )
      ( MAKE-6PILE ?auto_62894 ?auto_62895 ?auto_62896 ?auto_62897 ?auto_62898 ?auto_62899 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62900 - BLOCK
      ?auto_62901 - BLOCK
      ?auto_62902 - BLOCK
      ?auto_62903 - BLOCK
      ?auto_62904 - BLOCK
      ?auto_62905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62900 ) ( not ( = ?auto_62900 ?auto_62901 ) ) ( not ( = ?auto_62900 ?auto_62902 ) ) ( not ( = ?auto_62900 ?auto_62903 ) ) ( not ( = ?auto_62900 ?auto_62904 ) ) ( not ( = ?auto_62900 ?auto_62905 ) ) ( not ( = ?auto_62901 ?auto_62902 ) ) ( not ( = ?auto_62901 ?auto_62903 ) ) ( not ( = ?auto_62901 ?auto_62904 ) ) ( not ( = ?auto_62901 ?auto_62905 ) ) ( not ( = ?auto_62902 ?auto_62903 ) ) ( not ( = ?auto_62902 ?auto_62904 ) ) ( not ( = ?auto_62902 ?auto_62905 ) ) ( not ( = ?auto_62903 ?auto_62904 ) ) ( not ( = ?auto_62903 ?auto_62905 ) ) ( not ( = ?auto_62904 ?auto_62905 ) ) ( ON-TABLE ?auto_62905 ) ( ON ?auto_62904 ?auto_62905 ) ( ON ?auto_62903 ?auto_62904 ) ( ON ?auto_62902 ?auto_62903 ) ( CLEAR ?auto_62902 ) ( HOLDING ?auto_62901 ) ( CLEAR ?auto_62900 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62900 ?auto_62901 )
      ( MAKE-6PILE ?auto_62900 ?auto_62901 ?auto_62902 ?auto_62903 ?auto_62904 ?auto_62905 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62906 - BLOCK
      ?auto_62907 - BLOCK
      ?auto_62908 - BLOCK
      ?auto_62909 - BLOCK
      ?auto_62910 - BLOCK
      ?auto_62911 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_62906 ) ( not ( = ?auto_62906 ?auto_62907 ) ) ( not ( = ?auto_62906 ?auto_62908 ) ) ( not ( = ?auto_62906 ?auto_62909 ) ) ( not ( = ?auto_62906 ?auto_62910 ) ) ( not ( = ?auto_62906 ?auto_62911 ) ) ( not ( = ?auto_62907 ?auto_62908 ) ) ( not ( = ?auto_62907 ?auto_62909 ) ) ( not ( = ?auto_62907 ?auto_62910 ) ) ( not ( = ?auto_62907 ?auto_62911 ) ) ( not ( = ?auto_62908 ?auto_62909 ) ) ( not ( = ?auto_62908 ?auto_62910 ) ) ( not ( = ?auto_62908 ?auto_62911 ) ) ( not ( = ?auto_62909 ?auto_62910 ) ) ( not ( = ?auto_62909 ?auto_62911 ) ) ( not ( = ?auto_62910 ?auto_62911 ) ) ( ON-TABLE ?auto_62911 ) ( ON ?auto_62910 ?auto_62911 ) ( ON ?auto_62909 ?auto_62910 ) ( ON ?auto_62908 ?auto_62909 ) ( CLEAR ?auto_62906 ) ( ON ?auto_62907 ?auto_62908 ) ( CLEAR ?auto_62907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62911 ?auto_62910 ?auto_62909 ?auto_62908 )
      ( MAKE-6PILE ?auto_62906 ?auto_62907 ?auto_62908 ?auto_62909 ?auto_62910 ?auto_62911 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62912 - BLOCK
      ?auto_62913 - BLOCK
      ?auto_62914 - BLOCK
      ?auto_62915 - BLOCK
      ?auto_62916 - BLOCK
      ?auto_62917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62912 ?auto_62913 ) ) ( not ( = ?auto_62912 ?auto_62914 ) ) ( not ( = ?auto_62912 ?auto_62915 ) ) ( not ( = ?auto_62912 ?auto_62916 ) ) ( not ( = ?auto_62912 ?auto_62917 ) ) ( not ( = ?auto_62913 ?auto_62914 ) ) ( not ( = ?auto_62913 ?auto_62915 ) ) ( not ( = ?auto_62913 ?auto_62916 ) ) ( not ( = ?auto_62913 ?auto_62917 ) ) ( not ( = ?auto_62914 ?auto_62915 ) ) ( not ( = ?auto_62914 ?auto_62916 ) ) ( not ( = ?auto_62914 ?auto_62917 ) ) ( not ( = ?auto_62915 ?auto_62916 ) ) ( not ( = ?auto_62915 ?auto_62917 ) ) ( not ( = ?auto_62916 ?auto_62917 ) ) ( ON-TABLE ?auto_62917 ) ( ON ?auto_62916 ?auto_62917 ) ( ON ?auto_62915 ?auto_62916 ) ( ON ?auto_62914 ?auto_62915 ) ( ON ?auto_62913 ?auto_62914 ) ( CLEAR ?auto_62913 ) ( HOLDING ?auto_62912 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62912 )
      ( MAKE-6PILE ?auto_62912 ?auto_62913 ?auto_62914 ?auto_62915 ?auto_62916 ?auto_62917 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62918 - BLOCK
      ?auto_62919 - BLOCK
      ?auto_62920 - BLOCK
      ?auto_62921 - BLOCK
      ?auto_62922 - BLOCK
      ?auto_62923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62918 ?auto_62919 ) ) ( not ( = ?auto_62918 ?auto_62920 ) ) ( not ( = ?auto_62918 ?auto_62921 ) ) ( not ( = ?auto_62918 ?auto_62922 ) ) ( not ( = ?auto_62918 ?auto_62923 ) ) ( not ( = ?auto_62919 ?auto_62920 ) ) ( not ( = ?auto_62919 ?auto_62921 ) ) ( not ( = ?auto_62919 ?auto_62922 ) ) ( not ( = ?auto_62919 ?auto_62923 ) ) ( not ( = ?auto_62920 ?auto_62921 ) ) ( not ( = ?auto_62920 ?auto_62922 ) ) ( not ( = ?auto_62920 ?auto_62923 ) ) ( not ( = ?auto_62921 ?auto_62922 ) ) ( not ( = ?auto_62921 ?auto_62923 ) ) ( not ( = ?auto_62922 ?auto_62923 ) ) ( ON-TABLE ?auto_62923 ) ( ON ?auto_62922 ?auto_62923 ) ( ON ?auto_62921 ?auto_62922 ) ( ON ?auto_62920 ?auto_62921 ) ( ON ?auto_62919 ?auto_62920 ) ( ON ?auto_62918 ?auto_62919 ) ( CLEAR ?auto_62918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62923 ?auto_62922 ?auto_62921 ?auto_62920 ?auto_62919 )
      ( MAKE-6PILE ?auto_62918 ?auto_62919 ?auto_62920 ?auto_62921 ?auto_62922 ?auto_62923 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62924 - BLOCK
      ?auto_62925 - BLOCK
      ?auto_62926 - BLOCK
      ?auto_62927 - BLOCK
      ?auto_62928 - BLOCK
      ?auto_62929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62924 ?auto_62925 ) ) ( not ( = ?auto_62924 ?auto_62926 ) ) ( not ( = ?auto_62924 ?auto_62927 ) ) ( not ( = ?auto_62924 ?auto_62928 ) ) ( not ( = ?auto_62924 ?auto_62929 ) ) ( not ( = ?auto_62925 ?auto_62926 ) ) ( not ( = ?auto_62925 ?auto_62927 ) ) ( not ( = ?auto_62925 ?auto_62928 ) ) ( not ( = ?auto_62925 ?auto_62929 ) ) ( not ( = ?auto_62926 ?auto_62927 ) ) ( not ( = ?auto_62926 ?auto_62928 ) ) ( not ( = ?auto_62926 ?auto_62929 ) ) ( not ( = ?auto_62927 ?auto_62928 ) ) ( not ( = ?auto_62927 ?auto_62929 ) ) ( not ( = ?auto_62928 ?auto_62929 ) ) ( ON-TABLE ?auto_62929 ) ( ON ?auto_62928 ?auto_62929 ) ( ON ?auto_62927 ?auto_62928 ) ( ON ?auto_62926 ?auto_62927 ) ( ON ?auto_62925 ?auto_62926 ) ( HOLDING ?auto_62924 ) ( CLEAR ?auto_62925 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_62929 ?auto_62928 ?auto_62927 ?auto_62926 ?auto_62925 ?auto_62924 )
      ( MAKE-6PILE ?auto_62924 ?auto_62925 ?auto_62926 ?auto_62927 ?auto_62928 ?auto_62929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62930 - BLOCK
      ?auto_62931 - BLOCK
      ?auto_62932 - BLOCK
      ?auto_62933 - BLOCK
      ?auto_62934 - BLOCK
      ?auto_62935 - BLOCK
    )
    :vars
    (
      ?auto_62936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62930 ?auto_62931 ) ) ( not ( = ?auto_62930 ?auto_62932 ) ) ( not ( = ?auto_62930 ?auto_62933 ) ) ( not ( = ?auto_62930 ?auto_62934 ) ) ( not ( = ?auto_62930 ?auto_62935 ) ) ( not ( = ?auto_62931 ?auto_62932 ) ) ( not ( = ?auto_62931 ?auto_62933 ) ) ( not ( = ?auto_62931 ?auto_62934 ) ) ( not ( = ?auto_62931 ?auto_62935 ) ) ( not ( = ?auto_62932 ?auto_62933 ) ) ( not ( = ?auto_62932 ?auto_62934 ) ) ( not ( = ?auto_62932 ?auto_62935 ) ) ( not ( = ?auto_62933 ?auto_62934 ) ) ( not ( = ?auto_62933 ?auto_62935 ) ) ( not ( = ?auto_62934 ?auto_62935 ) ) ( ON-TABLE ?auto_62935 ) ( ON ?auto_62934 ?auto_62935 ) ( ON ?auto_62933 ?auto_62934 ) ( ON ?auto_62932 ?auto_62933 ) ( ON ?auto_62931 ?auto_62932 ) ( CLEAR ?auto_62931 ) ( ON ?auto_62930 ?auto_62936 ) ( CLEAR ?auto_62930 ) ( HAND-EMPTY ) ( not ( = ?auto_62930 ?auto_62936 ) ) ( not ( = ?auto_62931 ?auto_62936 ) ) ( not ( = ?auto_62932 ?auto_62936 ) ) ( not ( = ?auto_62933 ?auto_62936 ) ) ( not ( = ?auto_62934 ?auto_62936 ) ) ( not ( = ?auto_62935 ?auto_62936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_62930 ?auto_62936 )
      ( MAKE-6PILE ?auto_62930 ?auto_62931 ?auto_62932 ?auto_62933 ?auto_62934 ?auto_62935 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62937 - BLOCK
      ?auto_62938 - BLOCK
      ?auto_62939 - BLOCK
      ?auto_62940 - BLOCK
      ?auto_62941 - BLOCK
      ?auto_62942 - BLOCK
    )
    :vars
    (
      ?auto_62943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62937 ?auto_62938 ) ) ( not ( = ?auto_62937 ?auto_62939 ) ) ( not ( = ?auto_62937 ?auto_62940 ) ) ( not ( = ?auto_62937 ?auto_62941 ) ) ( not ( = ?auto_62937 ?auto_62942 ) ) ( not ( = ?auto_62938 ?auto_62939 ) ) ( not ( = ?auto_62938 ?auto_62940 ) ) ( not ( = ?auto_62938 ?auto_62941 ) ) ( not ( = ?auto_62938 ?auto_62942 ) ) ( not ( = ?auto_62939 ?auto_62940 ) ) ( not ( = ?auto_62939 ?auto_62941 ) ) ( not ( = ?auto_62939 ?auto_62942 ) ) ( not ( = ?auto_62940 ?auto_62941 ) ) ( not ( = ?auto_62940 ?auto_62942 ) ) ( not ( = ?auto_62941 ?auto_62942 ) ) ( ON-TABLE ?auto_62942 ) ( ON ?auto_62941 ?auto_62942 ) ( ON ?auto_62940 ?auto_62941 ) ( ON ?auto_62939 ?auto_62940 ) ( ON ?auto_62937 ?auto_62943 ) ( CLEAR ?auto_62937 ) ( not ( = ?auto_62937 ?auto_62943 ) ) ( not ( = ?auto_62938 ?auto_62943 ) ) ( not ( = ?auto_62939 ?auto_62943 ) ) ( not ( = ?auto_62940 ?auto_62943 ) ) ( not ( = ?auto_62941 ?auto_62943 ) ) ( not ( = ?auto_62942 ?auto_62943 ) ) ( HOLDING ?auto_62938 ) ( CLEAR ?auto_62939 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62942 ?auto_62941 ?auto_62940 ?auto_62939 ?auto_62938 )
      ( MAKE-6PILE ?auto_62937 ?auto_62938 ?auto_62939 ?auto_62940 ?auto_62941 ?auto_62942 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62944 - BLOCK
      ?auto_62945 - BLOCK
      ?auto_62946 - BLOCK
      ?auto_62947 - BLOCK
      ?auto_62948 - BLOCK
      ?auto_62949 - BLOCK
    )
    :vars
    (
      ?auto_62950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62944 ?auto_62945 ) ) ( not ( = ?auto_62944 ?auto_62946 ) ) ( not ( = ?auto_62944 ?auto_62947 ) ) ( not ( = ?auto_62944 ?auto_62948 ) ) ( not ( = ?auto_62944 ?auto_62949 ) ) ( not ( = ?auto_62945 ?auto_62946 ) ) ( not ( = ?auto_62945 ?auto_62947 ) ) ( not ( = ?auto_62945 ?auto_62948 ) ) ( not ( = ?auto_62945 ?auto_62949 ) ) ( not ( = ?auto_62946 ?auto_62947 ) ) ( not ( = ?auto_62946 ?auto_62948 ) ) ( not ( = ?auto_62946 ?auto_62949 ) ) ( not ( = ?auto_62947 ?auto_62948 ) ) ( not ( = ?auto_62947 ?auto_62949 ) ) ( not ( = ?auto_62948 ?auto_62949 ) ) ( ON-TABLE ?auto_62949 ) ( ON ?auto_62948 ?auto_62949 ) ( ON ?auto_62947 ?auto_62948 ) ( ON ?auto_62946 ?auto_62947 ) ( ON ?auto_62944 ?auto_62950 ) ( not ( = ?auto_62944 ?auto_62950 ) ) ( not ( = ?auto_62945 ?auto_62950 ) ) ( not ( = ?auto_62946 ?auto_62950 ) ) ( not ( = ?auto_62947 ?auto_62950 ) ) ( not ( = ?auto_62948 ?auto_62950 ) ) ( not ( = ?auto_62949 ?auto_62950 ) ) ( CLEAR ?auto_62946 ) ( ON ?auto_62945 ?auto_62944 ) ( CLEAR ?auto_62945 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_62950 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62950 ?auto_62944 )
      ( MAKE-6PILE ?auto_62944 ?auto_62945 ?auto_62946 ?auto_62947 ?auto_62948 ?auto_62949 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62951 - BLOCK
      ?auto_62952 - BLOCK
      ?auto_62953 - BLOCK
      ?auto_62954 - BLOCK
      ?auto_62955 - BLOCK
      ?auto_62956 - BLOCK
    )
    :vars
    (
      ?auto_62957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62951 ?auto_62952 ) ) ( not ( = ?auto_62951 ?auto_62953 ) ) ( not ( = ?auto_62951 ?auto_62954 ) ) ( not ( = ?auto_62951 ?auto_62955 ) ) ( not ( = ?auto_62951 ?auto_62956 ) ) ( not ( = ?auto_62952 ?auto_62953 ) ) ( not ( = ?auto_62952 ?auto_62954 ) ) ( not ( = ?auto_62952 ?auto_62955 ) ) ( not ( = ?auto_62952 ?auto_62956 ) ) ( not ( = ?auto_62953 ?auto_62954 ) ) ( not ( = ?auto_62953 ?auto_62955 ) ) ( not ( = ?auto_62953 ?auto_62956 ) ) ( not ( = ?auto_62954 ?auto_62955 ) ) ( not ( = ?auto_62954 ?auto_62956 ) ) ( not ( = ?auto_62955 ?auto_62956 ) ) ( ON-TABLE ?auto_62956 ) ( ON ?auto_62955 ?auto_62956 ) ( ON ?auto_62954 ?auto_62955 ) ( ON ?auto_62951 ?auto_62957 ) ( not ( = ?auto_62951 ?auto_62957 ) ) ( not ( = ?auto_62952 ?auto_62957 ) ) ( not ( = ?auto_62953 ?auto_62957 ) ) ( not ( = ?auto_62954 ?auto_62957 ) ) ( not ( = ?auto_62955 ?auto_62957 ) ) ( not ( = ?auto_62956 ?auto_62957 ) ) ( ON ?auto_62952 ?auto_62951 ) ( CLEAR ?auto_62952 ) ( ON-TABLE ?auto_62957 ) ( HOLDING ?auto_62953 ) ( CLEAR ?auto_62954 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62956 ?auto_62955 ?auto_62954 ?auto_62953 )
      ( MAKE-6PILE ?auto_62951 ?auto_62952 ?auto_62953 ?auto_62954 ?auto_62955 ?auto_62956 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62958 - BLOCK
      ?auto_62959 - BLOCK
      ?auto_62960 - BLOCK
      ?auto_62961 - BLOCK
      ?auto_62962 - BLOCK
      ?auto_62963 - BLOCK
    )
    :vars
    (
      ?auto_62964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62958 ?auto_62959 ) ) ( not ( = ?auto_62958 ?auto_62960 ) ) ( not ( = ?auto_62958 ?auto_62961 ) ) ( not ( = ?auto_62958 ?auto_62962 ) ) ( not ( = ?auto_62958 ?auto_62963 ) ) ( not ( = ?auto_62959 ?auto_62960 ) ) ( not ( = ?auto_62959 ?auto_62961 ) ) ( not ( = ?auto_62959 ?auto_62962 ) ) ( not ( = ?auto_62959 ?auto_62963 ) ) ( not ( = ?auto_62960 ?auto_62961 ) ) ( not ( = ?auto_62960 ?auto_62962 ) ) ( not ( = ?auto_62960 ?auto_62963 ) ) ( not ( = ?auto_62961 ?auto_62962 ) ) ( not ( = ?auto_62961 ?auto_62963 ) ) ( not ( = ?auto_62962 ?auto_62963 ) ) ( ON-TABLE ?auto_62963 ) ( ON ?auto_62962 ?auto_62963 ) ( ON ?auto_62961 ?auto_62962 ) ( ON ?auto_62958 ?auto_62964 ) ( not ( = ?auto_62958 ?auto_62964 ) ) ( not ( = ?auto_62959 ?auto_62964 ) ) ( not ( = ?auto_62960 ?auto_62964 ) ) ( not ( = ?auto_62961 ?auto_62964 ) ) ( not ( = ?auto_62962 ?auto_62964 ) ) ( not ( = ?auto_62963 ?auto_62964 ) ) ( ON ?auto_62959 ?auto_62958 ) ( ON-TABLE ?auto_62964 ) ( CLEAR ?auto_62961 ) ( ON ?auto_62960 ?auto_62959 ) ( CLEAR ?auto_62960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62964 ?auto_62958 ?auto_62959 )
      ( MAKE-6PILE ?auto_62958 ?auto_62959 ?auto_62960 ?auto_62961 ?auto_62962 ?auto_62963 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62965 - BLOCK
      ?auto_62966 - BLOCK
      ?auto_62967 - BLOCK
      ?auto_62968 - BLOCK
      ?auto_62969 - BLOCK
      ?auto_62970 - BLOCK
    )
    :vars
    (
      ?auto_62971 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62965 ?auto_62966 ) ) ( not ( = ?auto_62965 ?auto_62967 ) ) ( not ( = ?auto_62965 ?auto_62968 ) ) ( not ( = ?auto_62965 ?auto_62969 ) ) ( not ( = ?auto_62965 ?auto_62970 ) ) ( not ( = ?auto_62966 ?auto_62967 ) ) ( not ( = ?auto_62966 ?auto_62968 ) ) ( not ( = ?auto_62966 ?auto_62969 ) ) ( not ( = ?auto_62966 ?auto_62970 ) ) ( not ( = ?auto_62967 ?auto_62968 ) ) ( not ( = ?auto_62967 ?auto_62969 ) ) ( not ( = ?auto_62967 ?auto_62970 ) ) ( not ( = ?auto_62968 ?auto_62969 ) ) ( not ( = ?auto_62968 ?auto_62970 ) ) ( not ( = ?auto_62969 ?auto_62970 ) ) ( ON-TABLE ?auto_62970 ) ( ON ?auto_62969 ?auto_62970 ) ( ON ?auto_62965 ?auto_62971 ) ( not ( = ?auto_62965 ?auto_62971 ) ) ( not ( = ?auto_62966 ?auto_62971 ) ) ( not ( = ?auto_62967 ?auto_62971 ) ) ( not ( = ?auto_62968 ?auto_62971 ) ) ( not ( = ?auto_62969 ?auto_62971 ) ) ( not ( = ?auto_62970 ?auto_62971 ) ) ( ON ?auto_62966 ?auto_62965 ) ( ON-TABLE ?auto_62971 ) ( ON ?auto_62967 ?auto_62966 ) ( CLEAR ?auto_62967 ) ( HOLDING ?auto_62968 ) ( CLEAR ?auto_62969 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_62970 ?auto_62969 ?auto_62968 )
      ( MAKE-6PILE ?auto_62965 ?auto_62966 ?auto_62967 ?auto_62968 ?auto_62969 ?auto_62970 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62972 - BLOCK
      ?auto_62973 - BLOCK
      ?auto_62974 - BLOCK
      ?auto_62975 - BLOCK
      ?auto_62976 - BLOCK
      ?auto_62977 - BLOCK
    )
    :vars
    (
      ?auto_62978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62972 ?auto_62973 ) ) ( not ( = ?auto_62972 ?auto_62974 ) ) ( not ( = ?auto_62972 ?auto_62975 ) ) ( not ( = ?auto_62972 ?auto_62976 ) ) ( not ( = ?auto_62972 ?auto_62977 ) ) ( not ( = ?auto_62973 ?auto_62974 ) ) ( not ( = ?auto_62973 ?auto_62975 ) ) ( not ( = ?auto_62973 ?auto_62976 ) ) ( not ( = ?auto_62973 ?auto_62977 ) ) ( not ( = ?auto_62974 ?auto_62975 ) ) ( not ( = ?auto_62974 ?auto_62976 ) ) ( not ( = ?auto_62974 ?auto_62977 ) ) ( not ( = ?auto_62975 ?auto_62976 ) ) ( not ( = ?auto_62975 ?auto_62977 ) ) ( not ( = ?auto_62976 ?auto_62977 ) ) ( ON-TABLE ?auto_62977 ) ( ON ?auto_62976 ?auto_62977 ) ( ON ?auto_62972 ?auto_62978 ) ( not ( = ?auto_62972 ?auto_62978 ) ) ( not ( = ?auto_62973 ?auto_62978 ) ) ( not ( = ?auto_62974 ?auto_62978 ) ) ( not ( = ?auto_62975 ?auto_62978 ) ) ( not ( = ?auto_62976 ?auto_62978 ) ) ( not ( = ?auto_62977 ?auto_62978 ) ) ( ON ?auto_62973 ?auto_62972 ) ( ON-TABLE ?auto_62978 ) ( ON ?auto_62974 ?auto_62973 ) ( CLEAR ?auto_62976 ) ( ON ?auto_62975 ?auto_62974 ) ( CLEAR ?auto_62975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_62978 ?auto_62972 ?auto_62973 ?auto_62974 )
      ( MAKE-6PILE ?auto_62972 ?auto_62973 ?auto_62974 ?auto_62975 ?auto_62976 ?auto_62977 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62979 - BLOCK
      ?auto_62980 - BLOCK
      ?auto_62981 - BLOCK
      ?auto_62982 - BLOCK
      ?auto_62983 - BLOCK
      ?auto_62984 - BLOCK
    )
    :vars
    (
      ?auto_62985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62979 ?auto_62980 ) ) ( not ( = ?auto_62979 ?auto_62981 ) ) ( not ( = ?auto_62979 ?auto_62982 ) ) ( not ( = ?auto_62979 ?auto_62983 ) ) ( not ( = ?auto_62979 ?auto_62984 ) ) ( not ( = ?auto_62980 ?auto_62981 ) ) ( not ( = ?auto_62980 ?auto_62982 ) ) ( not ( = ?auto_62980 ?auto_62983 ) ) ( not ( = ?auto_62980 ?auto_62984 ) ) ( not ( = ?auto_62981 ?auto_62982 ) ) ( not ( = ?auto_62981 ?auto_62983 ) ) ( not ( = ?auto_62981 ?auto_62984 ) ) ( not ( = ?auto_62982 ?auto_62983 ) ) ( not ( = ?auto_62982 ?auto_62984 ) ) ( not ( = ?auto_62983 ?auto_62984 ) ) ( ON-TABLE ?auto_62984 ) ( ON ?auto_62979 ?auto_62985 ) ( not ( = ?auto_62979 ?auto_62985 ) ) ( not ( = ?auto_62980 ?auto_62985 ) ) ( not ( = ?auto_62981 ?auto_62985 ) ) ( not ( = ?auto_62982 ?auto_62985 ) ) ( not ( = ?auto_62983 ?auto_62985 ) ) ( not ( = ?auto_62984 ?auto_62985 ) ) ( ON ?auto_62980 ?auto_62979 ) ( ON-TABLE ?auto_62985 ) ( ON ?auto_62981 ?auto_62980 ) ( ON ?auto_62982 ?auto_62981 ) ( CLEAR ?auto_62982 ) ( HOLDING ?auto_62983 ) ( CLEAR ?auto_62984 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_62984 ?auto_62983 )
      ( MAKE-6PILE ?auto_62979 ?auto_62980 ?auto_62981 ?auto_62982 ?auto_62983 ?auto_62984 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62986 - BLOCK
      ?auto_62987 - BLOCK
      ?auto_62988 - BLOCK
      ?auto_62989 - BLOCK
      ?auto_62990 - BLOCK
      ?auto_62991 - BLOCK
    )
    :vars
    (
      ?auto_62992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62986 ?auto_62987 ) ) ( not ( = ?auto_62986 ?auto_62988 ) ) ( not ( = ?auto_62986 ?auto_62989 ) ) ( not ( = ?auto_62986 ?auto_62990 ) ) ( not ( = ?auto_62986 ?auto_62991 ) ) ( not ( = ?auto_62987 ?auto_62988 ) ) ( not ( = ?auto_62987 ?auto_62989 ) ) ( not ( = ?auto_62987 ?auto_62990 ) ) ( not ( = ?auto_62987 ?auto_62991 ) ) ( not ( = ?auto_62988 ?auto_62989 ) ) ( not ( = ?auto_62988 ?auto_62990 ) ) ( not ( = ?auto_62988 ?auto_62991 ) ) ( not ( = ?auto_62989 ?auto_62990 ) ) ( not ( = ?auto_62989 ?auto_62991 ) ) ( not ( = ?auto_62990 ?auto_62991 ) ) ( ON-TABLE ?auto_62991 ) ( ON ?auto_62986 ?auto_62992 ) ( not ( = ?auto_62986 ?auto_62992 ) ) ( not ( = ?auto_62987 ?auto_62992 ) ) ( not ( = ?auto_62988 ?auto_62992 ) ) ( not ( = ?auto_62989 ?auto_62992 ) ) ( not ( = ?auto_62990 ?auto_62992 ) ) ( not ( = ?auto_62991 ?auto_62992 ) ) ( ON ?auto_62987 ?auto_62986 ) ( ON-TABLE ?auto_62992 ) ( ON ?auto_62988 ?auto_62987 ) ( ON ?auto_62989 ?auto_62988 ) ( CLEAR ?auto_62991 ) ( ON ?auto_62990 ?auto_62989 ) ( CLEAR ?auto_62990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_62992 ?auto_62986 ?auto_62987 ?auto_62988 ?auto_62989 )
      ( MAKE-6PILE ?auto_62986 ?auto_62987 ?auto_62988 ?auto_62989 ?auto_62990 ?auto_62991 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_62993 - BLOCK
      ?auto_62994 - BLOCK
      ?auto_62995 - BLOCK
      ?auto_62996 - BLOCK
      ?auto_62997 - BLOCK
      ?auto_62998 - BLOCK
    )
    :vars
    (
      ?auto_62999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_62993 ?auto_62994 ) ) ( not ( = ?auto_62993 ?auto_62995 ) ) ( not ( = ?auto_62993 ?auto_62996 ) ) ( not ( = ?auto_62993 ?auto_62997 ) ) ( not ( = ?auto_62993 ?auto_62998 ) ) ( not ( = ?auto_62994 ?auto_62995 ) ) ( not ( = ?auto_62994 ?auto_62996 ) ) ( not ( = ?auto_62994 ?auto_62997 ) ) ( not ( = ?auto_62994 ?auto_62998 ) ) ( not ( = ?auto_62995 ?auto_62996 ) ) ( not ( = ?auto_62995 ?auto_62997 ) ) ( not ( = ?auto_62995 ?auto_62998 ) ) ( not ( = ?auto_62996 ?auto_62997 ) ) ( not ( = ?auto_62996 ?auto_62998 ) ) ( not ( = ?auto_62997 ?auto_62998 ) ) ( ON ?auto_62993 ?auto_62999 ) ( not ( = ?auto_62993 ?auto_62999 ) ) ( not ( = ?auto_62994 ?auto_62999 ) ) ( not ( = ?auto_62995 ?auto_62999 ) ) ( not ( = ?auto_62996 ?auto_62999 ) ) ( not ( = ?auto_62997 ?auto_62999 ) ) ( not ( = ?auto_62998 ?auto_62999 ) ) ( ON ?auto_62994 ?auto_62993 ) ( ON-TABLE ?auto_62999 ) ( ON ?auto_62995 ?auto_62994 ) ( ON ?auto_62996 ?auto_62995 ) ( ON ?auto_62997 ?auto_62996 ) ( CLEAR ?auto_62997 ) ( HOLDING ?auto_62998 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62998 )
      ( MAKE-6PILE ?auto_62993 ?auto_62994 ?auto_62995 ?auto_62996 ?auto_62997 ?auto_62998 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63000 - BLOCK
      ?auto_63001 - BLOCK
      ?auto_63002 - BLOCK
      ?auto_63003 - BLOCK
      ?auto_63004 - BLOCK
      ?auto_63005 - BLOCK
    )
    :vars
    (
      ?auto_63006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63000 ?auto_63001 ) ) ( not ( = ?auto_63000 ?auto_63002 ) ) ( not ( = ?auto_63000 ?auto_63003 ) ) ( not ( = ?auto_63000 ?auto_63004 ) ) ( not ( = ?auto_63000 ?auto_63005 ) ) ( not ( = ?auto_63001 ?auto_63002 ) ) ( not ( = ?auto_63001 ?auto_63003 ) ) ( not ( = ?auto_63001 ?auto_63004 ) ) ( not ( = ?auto_63001 ?auto_63005 ) ) ( not ( = ?auto_63002 ?auto_63003 ) ) ( not ( = ?auto_63002 ?auto_63004 ) ) ( not ( = ?auto_63002 ?auto_63005 ) ) ( not ( = ?auto_63003 ?auto_63004 ) ) ( not ( = ?auto_63003 ?auto_63005 ) ) ( not ( = ?auto_63004 ?auto_63005 ) ) ( ON ?auto_63000 ?auto_63006 ) ( not ( = ?auto_63000 ?auto_63006 ) ) ( not ( = ?auto_63001 ?auto_63006 ) ) ( not ( = ?auto_63002 ?auto_63006 ) ) ( not ( = ?auto_63003 ?auto_63006 ) ) ( not ( = ?auto_63004 ?auto_63006 ) ) ( not ( = ?auto_63005 ?auto_63006 ) ) ( ON ?auto_63001 ?auto_63000 ) ( ON-TABLE ?auto_63006 ) ( ON ?auto_63002 ?auto_63001 ) ( ON ?auto_63003 ?auto_63002 ) ( ON ?auto_63004 ?auto_63003 ) ( ON ?auto_63005 ?auto_63004 ) ( CLEAR ?auto_63005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63006 ?auto_63000 ?auto_63001 ?auto_63002 ?auto_63003 ?auto_63004 )
      ( MAKE-6PILE ?auto_63000 ?auto_63001 ?auto_63002 ?auto_63003 ?auto_63004 ?auto_63005 ) )
  )

)

