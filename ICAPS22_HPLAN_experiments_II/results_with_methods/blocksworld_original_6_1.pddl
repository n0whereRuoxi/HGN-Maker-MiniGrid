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
      ?auto_41185 - BLOCK
      ?auto_41186 - BLOCK
      ?auto_41187 - BLOCK
      ?auto_41188 - BLOCK
      ?auto_41189 - BLOCK
      ?auto_41190 - BLOCK
    )
    :vars
    (
      ?auto_41191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41191 ?auto_41190 ) ( CLEAR ?auto_41191 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41185 ) ( ON ?auto_41186 ?auto_41185 ) ( ON ?auto_41187 ?auto_41186 ) ( ON ?auto_41188 ?auto_41187 ) ( ON ?auto_41189 ?auto_41188 ) ( ON ?auto_41190 ?auto_41189 ) ( not ( = ?auto_41185 ?auto_41186 ) ) ( not ( = ?auto_41185 ?auto_41187 ) ) ( not ( = ?auto_41185 ?auto_41188 ) ) ( not ( = ?auto_41185 ?auto_41189 ) ) ( not ( = ?auto_41185 ?auto_41190 ) ) ( not ( = ?auto_41185 ?auto_41191 ) ) ( not ( = ?auto_41186 ?auto_41187 ) ) ( not ( = ?auto_41186 ?auto_41188 ) ) ( not ( = ?auto_41186 ?auto_41189 ) ) ( not ( = ?auto_41186 ?auto_41190 ) ) ( not ( = ?auto_41186 ?auto_41191 ) ) ( not ( = ?auto_41187 ?auto_41188 ) ) ( not ( = ?auto_41187 ?auto_41189 ) ) ( not ( = ?auto_41187 ?auto_41190 ) ) ( not ( = ?auto_41187 ?auto_41191 ) ) ( not ( = ?auto_41188 ?auto_41189 ) ) ( not ( = ?auto_41188 ?auto_41190 ) ) ( not ( = ?auto_41188 ?auto_41191 ) ) ( not ( = ?auto_41189 ?auto_41190 ) ) ( not ( = ?auto_41189 ?auto_41191 ) ) ( not ( = ?auto_41190 ?auto_41191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41191 ?auto_41190 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41193 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_41193 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_41193 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41194 - BLOCK
    )
    :vars
    (
      ?auto_41195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41194 ?auto_41195 ) ( CLEAR ?auto_41194 ) ( HAND-EMPTY ) ( not ( = ?auto_41194 ?auto_41195 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41194 ?auto_41195 )
      ( MAKE-1PILE ?auto_41194 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41201 - BLOCK
      ?auto_41202 - BLOCK
      ?auto_41203 - BLOCK
      ?auto_41204 - BLOCK
      ?auto_41205 - BLOCK
    )
    :vars
    (
      ?auto_41206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41206 ?auto_41205 ) ( CLEAR ?auto_41206 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41201 ) ( ON ?auto_41202 ?auto_41201 ) ( ON ?auto_41203 ?auto_41202 ) ( ON ?auto_41204 ?auto_41203 ) ( ON ?auto_41205 ?auto_41204 ) ( not ( = ?auto_41201 ?auto_41202 ) ) ( not ( = ?auto_41201 ?auto_41203 ) ) ( not ( = ?auto_41201 ?auto_41204 ) ) ( not ( = ?auto_41201 ?auto_41205 ) ) ( not ( = ?auto_41201 ?auto_41206 ) ) ( not ( = ?auto_41202 ?auto_41203 ) ) ( not ( = ?auto_41202 ?auto_41204 ) ) ( not ( = ?auto_41202 ?auto_41205 ) ) ( not ( = ?auto_41202 ?auto_41206 ) ) ( not ( = ?auto_41203 ?auto_41204 ) ) ( not ( = ?auto_41203 ?auto_41205 ) ) ( not ( = ?auto_41203 ?auto_41206 ) ) ( not ( = ?auto_41204 ?auto_41205 ) ) ( not ( = ?auto_41204 ?auto_41206 ) ) ( not ( = ?auto_41205 ?auto_41206 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41206 ?auto_41205 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41207 - BLOCK
      ?auto_41208 - BLOCK
      ?auto_41209 - BLOCK
      ?auto_41210 - BLOCK
      ?auto_41211 - BLOCK
    )
    :vars
    (
      ?auto_41212 - BLOCK
      ?auto_41213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41212 ?auto_41211 ) ( CLEAR ?auto_41212 ) ( ON-TABLE ?auto_41207 ) ( ON ?auto_41208 ?auto_41207 ) ( ON ?auto_41209 ?auto_41208 ) ( ON ?auto_41210 ?auto_41209 ) ( ON ?auto_41211 ?auto_41210 ) ( not ( = ?auto_41207 ?auto_41208 ) ) ( not ( = ?auto_41207 ?auto_41209 ) ) ( not ( = ?auto_41207 ?auto_41210 ) ) ( not ( = ?auto_41207 ?auto_41211 ) ) ( not ( = ?auto_41207 ?auto_41212 ) ) ( not ( = ?auto_41208 ?auto_41209 ) ) ( not ( = ?auto_41208 ?auto_41210 ) ) ( not ( = ?auto_41208 ?auto_41211 ) ) ( not ( = ?auto_41208 ?auto_41212 ) ) ( not ( = ?auto_41209 ?auto_41210 ) ) ( not ( = ?auto_41209 ?auto_41211 ) ) ( not ( = ?auto_41209 ?auto_41212 ) ) ( not ( = ?auto_41210 ?auto_41211 ) ) ( not ( = ?auto_41210 ?auto_41212 ) ) ( not ( = ?auto_41211 ?auto_41212 ) ) ( HOLDING ?auto_41213 ) ( not ( = ?auto_41207 ?auto_41213 ) ) ( not ( = ?auto_41208 ?auto_41213 ) ) ( not ( = ?auto_41209 ?auto_41213 ) ) ( not ( = ?auto_41210 ?auto_41213 ) ) ( not ( = ?auto_41211 ?auto_41213 ) ) ( not ( = ?auto_41212 ?auto_41213 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_41213 )
      ( MAKE-5PILE ?auto_41207 ?auto_41208 ?auto_41209 ?auto_41210 ?auto_41211 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41214 - BLOCK
      ?auto_41215 - BLOCK
      ?auto_41216 - BLOCK
      ?auto_41217 - BLOCK
      ?auto_41218 - BLOCK
    )
    :vars
    (
      ?auto_41219 - BLOCK
      ?auto_41220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41219 ?auto_41218 ) ( ON-TABLE ?auto_41214 ) ( ON ?auto_41215 ?auto_41214 ) ( ON ?auto_41216 ?auto_41215 ) ( ON ?auto_41217 ?auto_41216 ) ( ON ?auto_41218 ?auto_41217 ) ( not ( = ?auto_41214 ?auto_41215 ) ) ( not ( = ?auto_41214 ?auto_41216 ) ) ( not ( = ?auto_41214 ?auto_41217 ) ) ( not ( = ?auto_41214 ?auto_41218 ) ) ( not ( = ?auto_41214 ?auto_41219 ) ) ( not ( = ?auto_41215 ?auto_41216 ) ) ( not ( = ?auto_41215 ?auto_41217 ) ) ( not ( = ?auto_41215 ?auto_41218 ) ) ( not ( = ?auto_41215 ?auto_41219 ) ) ( not ( = ?auto_41216 ?auto_41217 ) ) ( not ( = ?auto_41216 ?auto_41218 ) ) ( not ( = ?auto_41216 ?auto_41219 ) ) ( not ( = ?auto_41217 ?auto_41218 ) ) ( not ( = ?auto_41217 ?auto_41219 ) ) ( not ( = ?auto_41218 ?auto_41219 ) ) ( not ( = ?auto_41214 ?auto_41220 ) ) ( not ( = ?auto_41215 ?auto_41220 ) ) ( not ( = ?auto_41216 ?auto_41220 ) ) ( not ( = ?auto_41217 ?auto_41220 ) ) ( not ( = ?auto_41218 ?auto_41220 ) ) ( not ( = ?auto_41219 ?auto_41220 ) ) ( ON ?auto_41220 ?auto_41219 ) ( CLEAR ?auto_41220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41214 ?auto_41215 ?auto_41216 ?auto_41217 ?auto_41218 ?auto_41219 )
      ( MAKE-5PILE ?auto_41214 ?auto_41215 ?auto_41216 ?auto_41217 ?auto_41218 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41223 - BLOCK
      ?auto_41224 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_41224 ) ( CLEAR ?auto_41223 ) ( ON-TABLE ?auto_41223 ) ( not ( = ?auto_41223 ?auto_41224 ) ) )
    :subtasks
    ( ( !STACK ?auto_41224 ?auto_41223 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41225 - BLOCK
      ?auto_41226 - BLOCK
    )
    :vars
    (
      ?auto_41227 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41225 ) ( ON-TABLE ?auto_41225 ) ( not ( = ?auto_41225 ?auto_41226 ) ) ( ON ?auto_41226 ?auto_41227 ) ( CLEAR ?auto_41226 ) ( HAND-EMPTY ) ( not ( = ?auto_41225 ?auto_41227 ) ) ( not ( = ?auto_41226 ?auto_41227 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41226 ?auto_41227 )
      ( MAKE-2PILE ?auto_41225 ?auto_41226 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41228 - BLOCK
      ?auto_41229 - BLOCK
    )
    :vars
    (
      ?auto_41230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41228 ?auto_41229 ) ) ( ON ?auto_41229 ?auto_41230 ) ( CLEAR ?auto_41229 ) ( not ( = ?auto_41228 ?auto_41230 ) ) ( not ( = ?auto_41229 ?auto_41230 ) ) ( HOLDING ?auto_41228 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41228 )
      ( MAKE-2PILE ?auto_41228 ?auto_41229 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41231 - BLOCK
      ?auto_41232 - BLOCK
    )
    :vars
    (
      ?auto_41233 - BLOCK
      ?auto_41236 - BLOCK
      ?auto_41235 - BLOCK
      ?auto_41234 - BLOCK
      ?auto_41237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41231 ?auto_41232 ) ) ( ON ?auto_41232 ?auto_41233 ) ( not ( = ?auto_41231 ?auto_41233 ) ) ( not ( = ?auto_41232 ?auto_41233 ) ) ( ON ?auto_41231 ?auto_41232 ) ( CLEAR ?auto_41231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41236 ) ( ON ?auto_41235 ?auto_41236 ) ( ON ?auto_41234 ?auto_41235 ) ( ON ?auto_41237 ?auto_41234 ) ( ON ?auto_41233 ?auto_41237 ) ( not ( = ?auto_41236 ?auto_41235 ) ) ( not ( = ?auto_41236 ?auto_41234 ) ) ( not ( = ?auto_41236 ?auto_41237 ) ) ( not ( = ?auto_41236 ?auto_41233 ) ) ( not ( = ?auto_41236 ?auto_41232 ) ) ( not ( = ?auto_41236 ?auto_41231 ) ) ( not ( = ?auto_41235 ?auto_41234 ) ) ( not ( = ?auto_41235 ?auto_41237 ) ) ( not ( = ?auto_41235 ?auto_41233 ) ) ( not ( = ?auto_41235 ?auto_41232 ) ) ( not ( = ?auto_41235 ?auto_41231 ) ) ( not ( = ?auto_41234 ?auto_41237 ) ) ( not ( = ?auto_41234 ?auto_41233 ) ) ( not ( = ?auto_41234 ?auto_41232 ) ) ( not ( = ?auto_41234 ?auto_41231 ) ) ( not ( = ?auto_41237 ?auto_41233 ) ) ( not ( = ?auto_41237 ?auto_41232 ) ) ( not ( = ?auto_41237 ?auto_41231 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41236 ?auto_41235 ?auto_41234 ?auto_41237 ?auto_41233 ?auto_41232 )
      ( MAKE-2PILE ?auto_41231 ?auto_41232 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41242 - BLOCK
      ?auto_41243 - BLOCK
      ?auto_41244 - BLOCK
      ?auto_41245 - BLOCK
    )
    :vars
    (
      ?auto_41246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41246 ?auto_41245 ) ( CLEAR ?auto_41246 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41242 ) ( ON ?auto_41243 ?auto_41242 ) ( ON ?auto_41244 ?auto_41243 ) ( ON ?auto_41245 ?auto_41244 ) ( not ( = ?auto_41242 ?auto_41243 ) ) ( not ( = ?auto_41242 ?auto_41244 ) ) ( not ( = ?auto_41242 ?auto_41245 ) ) ( not ( = ?auto_41242 ?auto_41246 ) ) ( not ( = ?auto_41243 ?auto_41244 ) ) ( not ( = ?auto_41243 ?auto_41245 ) ) ( not ( = ?auto_41243 ?auto_41246 ) ) ( not ( = ?auto_41244 ?auto_41245 ) ) ( not ( = ?auto_41244 ?auto_41246 ) ) ( not ( = ?auto_41245 ?auto_41246 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41246 ?auto_41245 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41247 - BLOCK
      ?auto_41248 - BLOCK
      ?auto_41249 - BLOCK
      ?auto_41250 - BLOCK
    )
    :vars
    (
      ?auto_41251 - BLOCK
      ?auto_41252 - BLOCK
      ?auto_41253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41251 ?auto_41250 ) ( CLEAR ?auto_41251 ) ( ON-TABLE ?auto_41247 ) ( ON ?auto_41248 ?auto_41247 ) ( ON ?auto_41249 ?auto_41248 ) ( ON ?auto_41250 ?auto_41249 ) ( not ( = ?auto_41247 ?auto_41248 ) ) ( not ( = ?auto_41247 ?auto_41249 ) ) ( not ( = ?auto_41247 ?auto_41250 ) ) ( not ( = ?auto_41247 ?auto_41251 ) ) ( not ( = ?auto_41248 ?auto_41249 ) ) ( not ( = ?auto_41248 ?auto_41250 ) ) ( not ( = ?auto_41248 ?auto_41251 ) ) ( not ( = ?auto_41249 ?auto_41250 ) ) ( not ( = ?auto_41249 ?auto_41251 ) ) ( not ( = ?auto_41250 ?auto_41251 ) ) ( HOLDING ?auto_41252 ) ( CLEAR ?auto_41253 ) ( not ( = ?auto_41247 ?auto_41252 ) ) ( not ( = ?auto_41247 ?auto_41253 ) ) ( not ( = ?auto_41248 ?auto_41252 ) ) ( not ( = ?auto_41248 ?auto_41253 ) ) ( not ( = ?auto_41249 ?auto_41252 ) ) ( not ( = ?auto_41249 ?auto_41253 ) ) ( not ( = ?auto_41250 ?auto_41252 ) ) ( not ( = ?auto_41250 ?auto_41253 ) ) ( not ( = ?auto_41251 ?auto_41252 ) ) ( not ( = ?auto_41251 ?auto_41253 ) ) ( not ( = ?auto_41252 ?auto_41253 ) ) )
    :subtasks
    ( ( !STACK ?auto_41252 ?auto_41253 )
      ( MAKE-4PILE ?auto_41247 ?auto_41248 ?auto_41249 ?auto_41250 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41254 - BLOCK
      ?auto_41255 - BLOCK
      ?auto_41256 - BLOCK
      ?auto_41257 - BLOCK
    )
    :vars
    (
      ?auto_41260 - BLOCK
      ?auto_41259 - BLOCK
      ?auto_41258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41260 ?auto_41257 ) ( ON-TABLE ?auto_41254 ) ( ON ?auto_41255 ?auto_41254 ) ( ON ?auto_41256 ?auto_41255 ) ( ON ?auto_41257 ?auto_41256 ) ( not ( = ?auto_41254 ?auto_41255 ) ) ( not ( = ?auto_41254 ?auto_41256 ) ) ( not ( = ?auto_41254 ?auto_41257 ) ) ( not ( = ?auto_41254 ?auto_41260 ) ) ( not ( = ?auto_41255 ?auto_41256 ) ) ( not ( = ?auto_41255 ?auto_41257 ) ) ( not ( = ?auto_41255 ?auto_41260 ) ) ( not ( = ?auto_41256 ?auto_41257 ) ) ( not ( = ?auto_41256 ?auto_41260 ) ) ( not ( = ?auto_41257 ?auto_41260 ) ) ( CLEAR ?auto_41259 ) ( not ( = ?auto_41254 ?auto_41258 ) ) ( not ( = ?auto_41254 ?auto_41259 ) ) ( not ( = ?auto_41255 ?auto_41258 ) ) ( not ( = ?auto_41255 ?auto_41259 ) ) ( not ( = ?auto_41256 ?auto_41258 ) ) ( not ( = ?auto_41256 ?auto_41259 ) ) ( not ( = ?auto_41257 ?auto_41258 ) ) ( not ( = ?auto_41257 ?auto_41259 ) ) ( not ( = ?auto_41260 ?auto_41258 ) ) ( not ( = ?auto_41260 ?auto_41259 ) ) ( not ( = ?auto_41258 ?auto_41259 ) ) ( ON ?auto_41258 ?auto_41260 ) ( CLEAR ?auto_41258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41254 ?auto_41255 ?auto_41256 ?auto_41257 ?auto_41260 )
      ( MAKE-4PILE ?auto_41254 ?auto_41255 ?auto_41256 ?auto_41257 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41261 - BLOCK
      ?auto_41262 - BLOCK
      ?auto_41263 - BLOCK
      ?auto_41264 - BLOCK
    )
    :vars
    (
      ?auto_41267 - BLOCK
      ?auto_41266 - BLOCK
      ?auto_41265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41267 ?auto_41264 ) ( ON-TABLE ?auto_41261 ) ( ON ?auto_41262 ?auto_41261 ) ( ON ?auto_41263 ?auto_41262 ) ( ON ?auto_41264 ?auto_41263 ) ( not ( = ?auto_41261 ?auto_41262 ) ) ( not ( = ?auto_41261 ?auto_41263 ) ) ( not ( = ?auto_41261 ?auto_41264 ) ) ( not ( = ?auto_41261 ?auto_41267 ) ) ( not ( = ?auto_41262 ?auto_41263 ) ) ( not ( = ?auto_41262 ?auto_41264 ) ) ( not ( = ?auto_41262 ?auto_41267 ) ) ( not ( = ?auto_41263 ?auto_41264 ) ) ( not ( = ?auto_41263 ?auto_41267 ) ) ( not ( = ?auto_41264 ?auto_41267 ) ) ( not ( = ?auto_41261 ?auto_41266 ) ) ( not ( = ?auto_41261 ?auto_41265 ) ) ( not ( = ?auto_41262 ?auto_41266 ) ) ( not ( = ?auto_41262 ?auto_41265 ) ) ( not ( = ?auto_41263 ?auto_41266 ) ) ( not ( = ?auto_41263 ?auto_41265 ) ) ( not ( = ?auto_41264 ?auto_41266 ) ) ( not ( = ?auto_41264 ?auto_41265 ) ) ( not ( = ?auto_41267 ?auto_41266 ) ) ( not ( = ?auto_41267 ?auto_41265 ) ) ( not ( = ?auto_41266 ?auto_41265 ) ) ( ON ?auto_41266 ?auto_41267 ) ( CLEAR ?auto_41266 ) ( HOLDING ?auto_41265 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41265 )
      ( MAKE-4PILE ?auto_41261 ?auto_41262 ?auto_41263 ?auto_41264 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41268 - BLOCK
      ?auto_41269 - BLOCK
      ?auto_41270 - BLOCK
      ?auto_41271 - BLOCK
    )
    :vars
    (
      ?auto_41274 - BLOCK
      ?auto_41272 - BLOCK
      ?auto_41273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41274 ?auto_41271 ) ( ON-TABLE ?auto_41268 ) ( ON ?auto_41269 ?auto_41268 ) ( ON ?auto_41270 ?auto_41269 ) ( ON ?auto_41271 ?auto_41270 ) ( not ( = ?auto_41268 ?auto_41269 ) ) ( not ( = ?auto_41268 ?auto_41270 ) ) ( not ( = ?auto_41268 ?auto_41271 ) ) ( not ( = ?auto_41268 ?auto_41274 ) ) ( not ( = ?auto_41269 ?auto_41270 ) ) ( not ( = ?auto_41269 ?auto_41271 ) ) ( not ( = ?auto_41269 ?auto_41274 ) ) ( not ( = ?auto_41270 ?auto_41271 ) ) ( not ( = ?auto_41270 ?auto_41274 ) ) ( not ( = ?auto_41271 ?auto_41274 ) ) ( not ( = ?auto_41268 ?auto_41272 ) ) ( not ( = ?auto_41268 ?auto_41273 ) ) ( not ( = ?auto_41269 ?auto_41272 ) ) ( not ( = ?auto_41269 ?auto_41273 ) ) ( not ( = ?auto_41270 ?auto_41272 ) ) ( not ( = ?auto_41270 ?auto_41273 ) ) ( not ( = ?auto_41271 ?auto_41272 ) ) ( not ( = ?auto_41271 ?auto_41273 ) ) ( not ( = ?auto_41274 ?auto_41272 ) ) ( not ( = ?auto_41274 ?auto_41273 ) ) ( not ( = ?auto_41272 ?auto_41273 ) ) ( ON ?auto_41272 ?auto_41274 ) ( ON ?auto_41273 ?auto_41272 ) ( CLEAR ?auto_41273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41268 ?auto_41269 ?auto_41270 ?auto_41271 ?auto_41274 ?auto_41272 )
      ( MAKE-4PILE ?auto_41268 ?auto_41269 ?auto_41270 ?auto_41271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41278 - BLOCK
      ?auto_41279 - BLOCK
      ?auto_41280 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_41280 ) ( CLEAR ?auto_41279 ) ( ON-TABLE ?auto_41278 ) ( ON ?auto_41279 ?auto_41278 ) ( not ( = ?auto_41278 ?auto_41279 ) ) ( not ( = ?auto_41278 ?auto_41280 ) ) ( not ( = ?auto_41279 ?auto_41280 ) ) )
    :subtasks
    ( ( !STACK ?auto_41280 ?auto_41279 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41281 - BLOCK
      ?auto_41282 - BLOCK
      ?auto_41283 - BLOCK
    )
    :vars
    (
      ?auto_41284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41282 ) ( ON-TABLE ?auto_41281 ) ( ON ?auto_41282 ?auto_41281 ) ( not ( = ?auto_41281 ?auto_41282 ) ) ( not ( = ?auto_41281 ?auto_41283 ) ) ( not ( = ?auto_41282 ?auto_41283 ) ) ( ON ?auto_41283 ?auto_41284 ) ( CLEAR ?auto_41283 ) ( HAND-EMPTY ) ( not ( = ?auto_41281 ?auto_41284 ) ) ( not ( = ?auto_41282 ?auto_41284 ) ) ( not ( = ?auto_41283 ?auto_41284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41283 ?auto_41284 )
      ( MAKE-3PILE ?auto_41281 ?auto_41282 ?auto_41283 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41285 - BLOCK
      ?auto_41286 - BLOCK
      ?auto_41287 - BLOCK
    )
    :vars
    (
      ?auto_41288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41285 ) ( not ( = ?auto_41285 ?auto_41286 ) ) ( not ( = ?auto_41285 ?auto_41287 ) ) ( not ( = ?auto_41286 ?auto_41287 ) ) ( ON ?auto_41287 ?auto_41288 ) ( CLEAR ?auto_41287 ) ( not ( = ?auto_41285 ?auto_41288 ) ) ( not ( = ?auto_41286 ?auto_41288 ) ) ( not ( = ?auto_41287 ?auto_41288 ) ) ( HOLDING ?auto_41286 ) ( CLEAR ?auto_41285 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41285 ?auto_41286 )
      ( MAKE-3PILE ?auto_41285 ?auto_41286 ?auto_41287 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41289 - BLOCK
      ?auto_41290 - BLOCK
      ?auto_41291 - BLOCK
    )
    :vars
    (
      ?auto_41292 - BLOCK
      ?auto_41293 - BLOCK
      ?auto_41295 - BLOCK
      ?auto_41294 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41289 ) ( not ( = ?auto_41289 ?auto_41290 ) ) ( not ( = ?auto_41289 ?auto_41291 ) ) ( not ( = ?auto_41290 ?auto_41291 ) ) ( ON ?auto_41291 ?auto_41292 ) ( not ( = ?auto_41289 ?auto_41292 ) ) ( not ( = ?auto_41290 ?auto_41292 ) ) ( not ( = ?auto_41291 ?auto_41292 ) ) ( CLEAR ?auto_41289 ) ( ON ?auto_41290 ?auto_41291 ) ( CLEAR ?auto_41290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41293 ) ( ON ?auto_41295 ?auto_41293 ) ( ON ?auto_41294 ?auto_41295 ) ( ON ?auto_41292 ?auto_41294 ) ( not ( = ?auto_41293 ?auto_41295 ) ) ( not ( = ?auto_41293 ?auto_41294 ) ) ( not ( = ?auto_41293 ?auto_41292 ) ) ( not ( = ?auto_41293 ?auto_41291 ) ) ( not ( = ?auto_41293 ?auto_41290 ) ) ( not ( = ?auto_41295 ?auto_41294 ) ) ( not ( = ?auto_41295 ?auto_41292 ) ) ( not ( = ?auto_41295 ?auto_41291 ) ) ( not ( = ?auto_41295 ?auto_41290 ) ) ( not ( = ?auto_41294 ?auto_41292 ) ) ( not ( = ?auto_41294 ?auto_41291 ) ) ( not ( = ?auto_41294 ?auto_41290 ) ) ( not ( = ?auto_41289 ?auto_41293 ) ) ( not ( = ?auto_41289 ?auto_41295 ) ) ( not ( = ?auto_41289 ?auto_41294 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41293 ?auto_41295 ?auto_41294 ?auto_41292 ?auto_41291 )
      ( MAKE-3PILE ?auto_41289 ?auto_41290 ?auto_41291 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41296 - BLOCK
      ?auto_41297 - BLOCK
      ?auto_41298 - BLOCK
    )
    :vars
    (
      ?auto_41302 - BLOCK
      ?auto_41301 - BLOCK
      ?auto_41300 - BLOCK
      ?auto_41299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41296 ?auto_41297 ) ) ( not ( = ?auto_41296 ?auto_41298 ) ) ( not ( = ?auto_41297 ?auto_41298 ) ) ( ON ?auto_41298 ?auto_41302 ) ( not ( = ?auto_41296 ?auto_41302 ) ) ( not ( = ?auto_41297 ?auto_41302 ) ) ( not ( = ?auto_41298 ?auto_41302 ) ) ( ON ?auto_41297 ?auto_41298 ) ( CLEAR ?auto_41297 ) ( ON-TABLE ?auto_41301 ) ( ON ?auto_41300 ?auto_41301 ) ( ON ?auto_41299 ?auto_41300 ) ( ON ?auto_41302 ?auto_41299 ) ( not ( = ?auto_41301 ?auto_41300 ) ) ( not ( = ?auto_41301 ?auto_41299 ) ) ( not ( = ?auto_41301 ?auto_41302 ) ) ( not ( = ?auto_41301 ?auto_41298 ) ) ( not ( = ?auto_41301 ?auto_41297 ) ) ( not ( = ?auto_41300 ?auto_41299 ) ) ( not ( = ?auto_41300 ?auto_41302 ) ) ( not ( = ?auto_41300 ?auto_41298 ) ) ( not ( = ?auto_41300 ?auto_41297 ) ) ( not ( = ?auto_41299 ?auto_41302 ) ) ( not ( = ?auto_41299 ?auto_41298 ) ) ( not ( = ?auto_41299 ?auto_41297 ) ) ( not ( = ?auto_41296 ?auto_41301 ) ) ( not ( = ?auto_41296 ?auto_41300 ) ) ( not ( = ?auto_41296 ?auto_41299 ) ) ( HOLDING ?auto_41296 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41296 )
      ( MAKE-3PILE ?auto_41296 ?auto_41297 ?auto_41298 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41303 - BLOCK
      ?auto_41304 - BLOCK
      ?auto_41305 - BLOCK
    )
    :vars
    (
      ?auto_41309 - BLOCK
      ?auto_41307 - BLOCK
      ?auto_41306 - BLOCK
      ?auto_41308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41303 ?auto_41304 ) ) ( not ( = ?auto_41303 ?auto_41305 ) ) ( not ( = ?auto_41304 ?auto_41305 ) ) ( ON ?auto_41305 ?auto_41309 ) ( not ( = ?auto_41303 ?auto_41309 ) ) ( not ( = ?auto_41304 ?auto_41309 ) ) ( not ( = ?auto_41305 ?auto_41309 ) ) ( ON ?auto_41304 ?auto_41305 ) ( ON-TABLE ?auto_41307 ) ( ON ?auto_41306 ?auto_41307 ) ( ON ?auto_41308 ?auto_41306 ) ( ON ?auto_41309 ?auto_41308 ) ( not ( = ?auto_41307 ?auto_41306 ) ) ( not ( = ?auto_41307 ?auto_41308 ) ) ( not ( = ?auto_41307 ?auto_41309 ) ) ( not ( = ?auto_41307 ?auto_41305 ) ) ( not ( = ?auto_41307 ?auto_41304 ) ) ( not ( = ?auto_41306 ?auto_41308 ) ) ( not ( = ?auto_41306 ?auto_41309 ) ) ( not ( = ?auto_41306 ?auto_41305 ) ) ( not ( = ?auto_41306 ?auto_41304 ) ) ( not ( = ?auto_41308 ?auto_41309 ) ) ( not ( = ?auto_41308 ?auto_41305 ) ) ( not ( = ?auto_41308 ?auto_41304 ) ) ( not ( = ?auto_41303 ?auto_41307 ) ) ( not ( = ?auto_41303 ?auto_41306 ) ) ( not ( = ?auto_41303 ?auto_41308 ) ) ( ON ?auto_41303 ?auto_41304 ) ( CLEAR ?auto_41303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41307 ?auto_41306 ?auto_41308 ?auto_41309 ?auto_41305 ?auto_41304 )
      ( MAKE-3PILE ?auto_41303 ?auto_41304 ?auto_41305 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41313 - BLOCK
      ?auto_41314 - BLOCK
      ?auto_41315 - BLOCK
    )
    :vars
    (
      ?auto_41316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41316 ?auto_41315 ) ( CLEAR ?auto_41316 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41313 ) ( ON ?auto_41314 ?auto_41313 ) ( ON ?auto_41315 ?auto_41314 ) ( not ( = ?auto_41313 ?auto_41314 ) ) ( not ( = ?auto_41313 ?auto_41315 ) ) ( not ( = ?auto_41313 ?auto_41316 ) ) ( not ( = ?auto_41314 ?auto_41315 ) ) ( not ( = ?auto_41314 ?auto_41316 ) ) ( not ( = ?auto_41315 ?auto_41316 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41316 ?auto_41315 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41317 - BLOCK
      ?auto_41318 - BLOCK
      ?auto_41319 - BLOCK
    )
    :vars
    (
      ?auto_41320 - BLOCK
      ?auto_41321 - BLOCK
      ?auto_41322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41320 ?auto_41319 ) ( CLEAR ?auto_41320 ) ( ON-TABLE ?auto_41317 ) ( ON ?auto_41318 ?auto_41317 ) ( ON ?auto_41319 ?auto_41318 ) ( not ( = ?auto_41317 ?auto_41318 ) ) ( not ( = ?auto_41317 ?auto_41319 ) ) ( not ( = ?auto_41317 ?auto_41320 ) ) ( not ( = ?auto_41318 ?auto_41319 ) ) ( not ( = ?auto_41318 ?auto_41320 ) ) ( not ( = ?auto_41319 ?auto_41320 ) ) ( HOLDING ?auto_41321 ) ( CLEAR ?auto_41322 ) ( not ( = ?auto_41317 ?auto_41321 ) ) ( not ( = ?auto_41317 ?auto_41322 ) ) ( not ( = ?auto_41318 ?auto_41321 ) ) ( not ( = ?auto_41318 ?auto_41322 ) ) ( not ( = ?auto_41319 ?auto_41321 ) ) ( not ( = ?auto_41319 ?auto_41322 ) ) ( not ( = ?auto_41320 ?auto_41321 ) ) ( not ( = ?auto_41320 ?auto_41322 ) ) ( not ( = ?auto_41321 ?auto_41322 ) ) )
    :subtasks
    ( ( !STACK ?auto_41321 ?auto_41322 )
      ( MAKE-3PILE ?auto_41317 ?auto_41318 ?auto_41319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41323 - BLOCK
      ?auto_41324 - BLOCK
      ?auto_41325 - BLOCK
    )
    :vars
    (
      ?auto_41326 - BLOCK
      ?auto_41327 - BLOCK
      ?auto_41328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41326 ?auto_41325 ) ( ON-TABLE ?auto_41323 ) ( ON ?auto_41324 ?auto_41323 ) ( ON ?auto_41325 ?auto_41324 ) ( not ( = ?auto_41323 ?auto_41324 ) ) ( not ( = ?auto_41323 ?auto_41325 ) ) ( not ( = ?auto_41323 ?auto_41326 ) ) ( not ( = ?auto_41324 ?auto_41325 ) ) ( not ( = ?auto_41324 ?auto_41326 ) ) ( not ( = ?auto_41325 ?auto_41326 ) ) ( CLEAR ?auto_41327 ) ( not ( = ?auto_41323 ?auto_41328 ) ) ( not ( = ?auto_41323 ?auto_41327 ) ) ( not ( = ?auto_41324 ?auto_41328 ) ) ( not ( = ?auto_41324 ?auto_41327 ) ) ( not ( = ?auto_41325 ?auto_41328 ) ) ( not ( = ?auto_41325 ?auto_41327 ) ) ( not ( = ?auto_41326 ?auto_41328 ) ) ( not ( = ?auto_41326 ?auto_41327 ) ) ( not ( = ?auto_41328 ?auto_41327 ) ) ( ON ?auto_41328 ?auto_41326 ) ( CLEAR ?auto_41328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41323 ?auto_41324 ?auto_41325 ?auto_41326 )
      ( MAKE-3PILE ?auto_41323 ?auto_41324 ?auto_41325 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41329 - BLOCK
      ?auto_41330 - BLOCK
      ?auto_41331 - BLOCK
    )
    :vars
    (
      ?auto_41334 - BLOCK
      ?auto_41333 - BLOCK
      ?auto_41332 - BLOCK
      ?auto_41335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41334 ?auto_41331 ) ( ON-TABLE ?auto_41329 ) ( ON ?auto_41330 ?auto_41329 ) ( ON ?auto_41331 ?auto_41330 ) ( not ( = ?auto_41329 ?auto_41330 ) ) ( not ( = ?auto_41329 ?auto_41331 ) ) ( not ( = ?auto_41329 ?auto_41334 ) ) ( not ( = ?auto_41330 ?auto_41331 ) ) ( not ( = ?auto_41330 ?auto_41334 ) ) ( not ( = ?auto_41331 ?auto_41334 ) ) ( not ( = ?auto_41329 ?auto_41333 ) ) ( not ( = ?auto_41329 ?auto_41332 ) ) ( not ( = ?auto_41330 ?auto_41333 ) ) ( not ( = ?auto_41330 ?auto_41332 ) ) ( not ( = ?auto_41331 ?auto_41333 ) ) ( not ( = ?auto_41331 ?auto_41332 ) ) ( not ( = ?auto_41334 ?auto_41333 ) ) ( not ( = ?auto_41334 ?auto_41332 ) ) ( not ( = ?auto_41333 ?auto_41332 ) ) ( ON ?auto_41333 ?auto_41334 ) ( CLEAR ?auto_41333 ) ( HOLDING ?auto_41332 ) ( CLEAR ?auto_41335 ) ( ON-TABLE ?auto_41335 ) ( not ( = ?auto_41335 ?auto_41332 ) ) ( not ( = ?auto_41329 ?auto_41335 ) ) ( not ( = ?auto_41330 ?auto_41335 ) ) ( not ( = ?auto_41331 ?auto_41335 ) ) ( not ( = ?auto_41334 ?auto_41335 ) ) ( not ( = ?auto_41333 ?auto_41335 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41335 ?auto_41332 )
      ( MAKE-3PILE ?auto_41329 ?auto_41330 ?auto_41331 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41336 - BLOCK
      ?auto_41337 - BLOCK
      ?auto_41338 - BLOCK
    )
    :vars
    (
      ?auto_41342 - BLOCK
      ?auto_41339 - BLOCK
      ?auto_41340 - BLOCK
      ?auto_41341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41342 ?auto_41338 ) ( ON-TABLE ?auto_41336 ) ( ON ?auto_41337 ?auto_41336 ) ( ON ?auto_41338 ?auto_41337 ) ( not ( = ?auto_41336 ?auto_41337 ) ) ( not ( = ?auto_41336 ?auto_41338 ) ) ( not ( = ?auto_41336 ?auto_41342 ) ) ( not ( = ?auto_41337 ?auto_41338 ) ) ( not ( = ?auto_41337 ?auto_41342 ) ) ( not ( = ?auto_41338 ?auto_41342 ) ) ( not ( = ?auto_41336 ?auto_41339 ) ) ( not ( = ?auto_41336 ?auto_41340 ) ) ( not ( = ?auto_41337 ?auto_41339 ) ) ( not ( = ?auto_41337 ?auto_41340 ) ) ( not ( = ?auto_41338 ?auto_41339 ) ) ( not ( = ?auto_41338 ?auto_41340 ) ) ( not ( = ?auto_41342 ?auto_41339 ) ) ( not ( = ?auto_41342 ?auto_41340 ) ) ( not ( = ?auto_41339 ?auto_41340 ) ) ( ON ?auto_41339 ?auto_41342 ) ( CLEAR ?auto_41341 ) ( ON-TABLE ?auto_41341 ) ( not ( = ?auto_41341 ?auto_41340 ) ) ( not ( = ?auto_41336 ?auto_41341 ) ) ( not ( = ?auto_41337 ?auto_41341 ) ) ( not ( = ?auto_41338 ?auto_41341 ) ) ( not ( = ?auto_41342 ?auto_41341 ) ) ( not ( = ?auto_41339 ?auto_41341 ) ) ( ON ?auto_41340 ?auto_41339 ) ( CLEAR ?auto_41340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41336 ?auto_41337 ?auto_41338 ?auto_41342 ?auto_41339 )
      ( MAKE-3PILE ?auto_41336 ?auto_41337 ?auto_41338 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41343 - BLOCK
      ?auto_41344 - BLOCK
      ?auto_41345 - BLOCK
    )
    :vars
    (
      ?auto_41349 - BLOCK
      ?auto_41347 - BLOCK
      ?auto_41348 - BLOCK
      ?auto_41346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41349 ?auto_41345 ) ( ON-TABLE ?auto_41343 ) ( ON ?auto_41344 ?auto_41343 ) ( ON ?auto_41345 ?auto_41344 ) ( not ( = ?auto_41343 ?auto_41344 ) ) ( not ( = ?auto_41343 ?auto_41345 ) ) ( not ( = ?auto_41343 ?auto_41349 ) ) ( not ( = ?auto_41344 ?auto_41345 ) ) ( not ( = ?auto_41344 ?auto_41349 ) ) ( not ( = ?auto_41345 ?auto_41349 ) ) ( not ( = ?auto_41343 ?auto_41347 ) ) ( not ( = ?auto_41343 ?auto_41348 ) ) ( not ( = ?auto_41344 ?auto_41347 ) ) ( not ( = ?auto_41344 ?auto_41348 ) ) ( not ( = ?auto_41345 ?auto_41347 ) ) ( not ( = ?auto_41345 ?auto_41348 ) ) ( not ( = ?auto_41349 ?auto_41347 ) ) ( not ( = ?auto_41349 ?auto_41348 ) ) ( not ( = ?auto_41347 ?auto_41348 ) ) ( ON ?auto_41347 ?auto_41349 ) ( not ( = ?auto_41346 ?auto_41348 ) ) ( not ( = ?auto_41343 ?auto_41346 ) ) ( not ( = ?auto_41344 ?auto_41346 ) ) ( not ( = ?auto_41345 ?auto_41346 ) ) ( not ( = ?auto_41349 ?auto_41346 ) ) ( not ( = ?auto_41347 ?auto_41346 ) ) ( ON ?auto_41348 ?auto_41347 ) ( CLEAR ?auto_41348 ) ( HOLDING ?auto_41346 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41346 )
      ( MAKE-3PILE ?auto_41343 ?auto_41344 ?auto_41345 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41350 - BLOCK
      ?auto_41351 - BLOCK
      ?auto_41352 - BLOCK
    )
    :vars
    (
      ?auto_41353 - BLOCK
      ?auto_41355 - BLOCK
      ?auto_41354 - BLOCK
      ?auto_41356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41353 ?auto_41352 ) ( ON-TABLE ?auto_41350 ) ( ON ?auto_41351 ?auto_41350 ) ( ON ?auto_41352 ?auto_41351 ) ( not ( = ?auto_41350 ?auto_41351 ) ) ( not ( = ?auto_41350 ?auto_41352 ) ) ( not ( = ?auto_41350 ?auto_41353 ) ) ( not ( = ?auto_41351 ?auto_41352 ) ) ( not ( = ?auto_41351 ?auto_41353 ) ) ( not ( = ?auto_41352 ?auto_41353 ) ) ( not ( = ?auto_41350 ?auto_41355 ) ) ( not ( = ?auto_41350 ?auto_41354 ) ) ( not ( = ?auto_41351 ?auto_41355 ) ) ( not ( = ?auto_41351 ?auto_41354 ) ) ( not ( = ?auto_41352 ?auto_41355 ) ) ( not ( = ?auto_41352 ?auto_41354 ) ) ( not ( = ?auto_41353 ?auto_41355 ) ) ( not ( = ?auto_41353 ?auto_41354 ) ) ( not ( = ?auto_41355 ?auto_41354 ) ) ( ON ?auto_41355 ?auto_41353 ) ( not ( = ?auto_41356 ?auto_41354 ) ) ( not ( = ?auto_41350 ?auto_41356 ) ) ( not ( = ?auto_41351 ?auto_41356 ) ) ( not ( = ?auto_41352 ?auto_41356 ) ) ( not ( = ?auto_41353 ?auto_41356 ) ) ( not ( = ?auto_41355 ?auto_41356 ) ) ( ON ?auto_41354 ?auto_41355 ) ( ON ?auto_41356 ?auto_41354 ) ( CLEAR ?auto_41356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41350 ?auto_41351 ?auto_41352 ?auto_41353 ?auto_41355 ?auto_41354 )
      ( MAKE-3PILE ?auto_41350 ?auto_41351 ?auto_41352 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41361 - BLOCK
      ?auto_41362 - BLOCK
      ?auto_41363 - BLOCK
      ?auto_41364 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_41364 ) ( CLEAR ?auto_41363 ) ( ON-TABLE ?auto_41361 ) ( ON ?auto_41362 ?auto_41361 ) ( ON ?auto_41363 ?auto_41362 ) ( not ( = ?auto_41361 ?auto_41362 ) ) ( not ( = ?auto_41361 ?auto_41363 ) ) ( not ( = ?auto_41361 ?auto_41364 ) ) ( not ( = ?auto_41362 ?auto_41363 ) ) ( not ( = ?auto_41362 ?auto_41364 ) ) ( not ( = ?auto_41363 ?auto_41364 ) ) )
    :subtasks
    ( ( !STACK ?auto_41364 ?auto_41363 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41365 - BLOCK
      ?auto_41366 - BLOCK
      ?auto_41367 - BLOCK
      ?auto_41368 - BLOCK
    )
    :vars
    (
      ?auto_41369 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41367 ) ( ON-TABLE ?auto_41365 ) ( ON ?auto_41366 ?auto_41365 ) ( ON ?auto_41367 ?auto_41366 ) ( not ( = ?auto_41365 ?auto_41366 ) ) ( not ( = ?auto_41365 ?auto_41367 ) ) ( not ( = ?auto_41365 ?auto_41368 ) ) ( not ( = ?auto_41366 ?auto_41367 ) ) ( not ( = ?auto_41366 ?auto_41368 ) ) ( not ( = ?auto_41367 ?auto_41368 ) ) ( ON ?auto_41368 ?auto_41369 ) ( CLEAR ?auto_41368 ) ( HAND-EMPTY ) ( not ( = ?auto_41365 ?auto_41369 ) ) ( not ( = ?auto_41366 ?auto_41369 ) ) ( not ( = ?auto_41367 ?auto_41369 ) ) ( not ( = ?auto_41368 ?auto_41369 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41368 ?auto_41369 )
      ( MAKE-4PILE ?auto_41365 ?auto_41366 ?auto_41367 ?auto_41368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41370 - BLOCK
      ?auto_41371 - BLOCK
      ?auto_41372 - BLOCK
      ?auto_41373 - BLOCK
    )
    :vars
    (
      ?auto_41374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41370 ) ( ON ?auto_41371 ?auto_41370 ) ( not ( = ?auto_41370 ?auto_41371 ) ) ( not ( = ?auto_41370 ?auto_41372 ) ) ( not ( = ?auto_41370 ?auto_41373 ) ) ( not ( = ?auto_41371 ?auto_41372 ) ) ( not ( = ?auto_41371 ?auto_41373 ) ) ( not ( = ?auto_41372 ?auto_41373 ) ) ( ON ?auto_41373 ?auto_41374 ) ( CLEAR ?auto_41373 ) ( not ( = ?auto_41370 ?auto_41374 ) ) ( not ( = ?auto_41371 ?auto_41374 ) ) ( not ( = ?auto_41372 ?auto_41374 ) ) ( not ( = ?auto_41373 ?auto_41374 ) ) ( HOLDING ?auto_41372 ) ( CLEAR ?auto_41371 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41370 ?auto_41371 ?auto_41372 )
      ( MAKE-4PILE ?auto_41370 ?auto_41371 ?auto_41372 ?auto_41373 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41375 - BLOCK
      ?auto_41376 - BLOCK
      ?auto_41377 - BLOCK
      ?auto_41378 - BLOCK
    )
    :vars
    (
      ?auto_41379 - BLOCK
      ?auto_41380 - BLOCK
      ?auto_41381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41375 ) ( ON ?auto_41376 ?auto_41375 ) ( not ( = ?auto_41375 ?auto_41376 ) ) ( not ( = ?auto_41375 ?auto_41377 ) ) ( not ( = ?auto_41375 ?auto_41378 ) ) ( not ( = ?auto_41376 ?auto_41377 ) ) ( not ( = ?auto_41376 ?auto_41378 ) ) ( not ( = ?auto_41377 ?auto_41378 ) ) ( ON ?auto_41378 ?auto_41379 ) ( not ( = ?auto_41375 ?auto_41379 ) ) ( not ( = ?auto_41376 ?auto_41379 ) ) ( not ( = ?auto_41377 ?auto_41379 ) ) ( not ( = ?auto_41378 ?auto_41379 ) ) ( CLEAR ?auto_41376 ) ( ON ?auto_41377 ?auto_41378 ) ( CLEAR ?auto_41377 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41380 ) ( ON ?auto_41381 ?auto_41380 ) ( ON ?auto_41379 ?auto_41381 ) ( not ( = ?auto_41380 ?auto_41381 ) ) ( not ( = ?auto_41380 ?auto_41379 ) ) ( not ( = ?auto_41380 ?auto_41378 ) ) ( not ( = ?auto_41380 ?auto_41377 ) ) ( not ( = ?auto_41381 ?auto_41379 ) ) ( not ( = ?auto_41381 ?auto_41378 ) ) ( not ( = ?auto_41381 ?auto_41377 ) ) ( not ( = ?auto_41375 ?auto_41380 ) ) ( not ( = ?auto_41375 ?auto_41381 ) ) ( not ( = ?auto_41376 ?auto_41380 ) ) ( not ( = ?auto_41376 ?auto_41381 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41380 ?auto_41381 ?auto_41379 ?auto_41378 )
      ( MAKE-4PILE ?auto_41375 ?auto_41376 ?auto_41377 ?auto_41378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41382 - BLOCK
      ?auto_41383 - BLOCK
      ?auto_41384 - BLOCK
      ?auto_41385 - BLOCK
    )
    :vars
    (
      ?auto_41386 - BLOCK
      ?auto_41388 - BLOCK
      ?auto_41387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41382 ) ( not ( = ?auto_41382 ?auto_41383 ) ) ( not ( = ?auto_41382 ?auto_41384 ) ) ( not ( = ?auto_41382 ?auto_41385 ) ) ( not ( = ?auto_41383 ?auto_41384 ) ) ( not ( = ?auto_41383 ?auto_41385 ) ) ( not ( = ?auto_41384 ?auto_41385 ) ) ( ON ?auto_41385 ?auto_41386 ) ( not ( = ?auto_41382 ?auto_41386 ) ) ( not ( = ?auto_41383 ?auto_41386 ) ) ( not ( = ?auto_41384 ?auto_41386 ) ) ( not ( = ?auto_41385 ?auto_41386 ) ) ( ON ?auto_41384 ?auto_41385 ) ( CLEAR ?auto_41384 ) ( ON-TABLE ?auto_41388 ) ( ON ?auto_41387 ?auto_41388 ) ( ON ?auto_41386 ?auto_41387 ) ( not ( = ?auto_41388 ?auto_41387 ) ) ( not ( = ?auto_41388 ?auto_41386 ) ) ( not ( = ?auto_41388 ?auto_41385 ) ) ( not ( = ?auto_41388 ?auto_41384 ) ) ( not ( = ?auto_41387 ?auto_41386 ) ) ( not ( = ?auto_41387 ?auto_41385 ) ) ( not ( = ?auto_41387 ?auto_41384 ) ) ( not ( = ?auto_41382 ?auto_41388 ) ) ( not ( = ?auto_41382 ?auto_41387 ) ) ( not ( = ?auto_41383 ?auto_41388 ) ) ( not ( = ?auto_41383 ?auto_41387 ) ) ( HOLDING ?auto_41383 ) ( CLEAR ?auto_41382 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41382 ?auto_41383 )
      ( MAKE-4PILE ?auto_41382 ?auto_41383 ?auto_41384 ?auto_41385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41389 - BLOCK
      ?auto_41390 - BLOCK
      ?auto_41391 - BLOCK
      ?auto_41392 - BLOCK
    )
    :vars
    (
      ?auto_41393 - BLOCK
      ?auto_41394 - BLOCK
      ?auto_41395 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41389 ) ( not ( = ?auto_41389 ?auto_41390 ) ) ( not ( = ?auto_41389 ?auto_41391 ) ) ( not ( = ?auto_41389 ?auto_41392 ) ) ( not ( = ?auto_41390 ?auto_41391 ) ) ( not ( = ?auto_41390 ?auto_41392 ) ) ( not ( = ?auto_41391 ?auto_41392 ) ) ( ON ?auto_41392 ?auto_41393 ) ( not ( = ?auto_41389 ?auto_41393 ) ) ( not ( = ?auto_41390 ?auto_41393 ) ) ( not ( = ?auto_41391 ?auto_41393 ) ) ( not ( = ?auto_41392 ?auto_41393 ) ) ( ON ?auto_41391 ?auto_41392 ) ( ON-TABLE ?auto_41394 ) ( ON ?auto_41395 ?auto_41394 ) ( ON ?auto_41393 ?auto_41395 ) ( not ( = ?auto_41394 ?auto_41395 ) ) ( not ( = ?auto_41394 ?auto_41393 ) ) ( not ( = ?auto_41394 ?auto_41392 ) ) ( not ( = ?auto_41394 ?auto_41391 ) ) ( not ( = ?auto_41395 ?auto_41393 ) ) ( not ( = ?auto_41395 ?auto_41392 ) ) ( not ( = ?auto_41395 ?auto_41391 ) ) ( not ( = ?auto_41389 ?auto_41394 ) ) ( not ( = ?auto_41389 ?auto_41395 ) ) ( not ( = ?auto_41390 ?auto_41394 ) ) ( not ( = ?auto_41390 ?auto_41395 ) ) ( CLEAR ?auto_41389 ) ( ON ?auto_41390 ?auto_41391 ) ( CLEAR ?auto_41390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41394 ?auto_41395 ?auto_41393 ?auto_41392 ?auto_41391 )
      ( MAKE-4PILE ?auto_41389 ?auto_41390 ?auto_41391 ?auto_41392 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41396 - BLOCK
      ?auto_41397 - BLOCK
      ?auto_41398 - BLOCK
      ?auto_41399 - BLOCK
    )
    :vars
    (
      ?auto_41400 - BLOCK
      ?auto_41402 - BLOCK
      ?auto_41401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41396 ?auto_41397 ) ) ( not ( = ?auto_41396 ?auto_41398 ) ) ( not ( = ?auto_41396 ?auto_41399 ) ) ( not ( = ?auto_41397 ?auto_41398 ) ) ( not ( = ?auto_41397 ?auto_41399 ) ) ( not ( = ?auto_41398 ?auto_41399 ) ) ( ON ?auto_41399 ?auto_41400 ) ( not ( = ?auto_41396 ?auto_41400 ) ) ( not ( = ?auto_41397 ?auto_41400 ) ) ( not ( = ?auto_41398 ?auto_41400 ) ) ( not ( = ?auto_41399 ?auto_41400 ) ) ( ON ?auto_41398 ?auto_41399 ) ( ON-TABLE ?auto_41402 ) ( ON ?auto_41401 ?auto_41402 ) ( ON ?auto_41400 ?auto_41401 ) ( not ( = ?auto_41402 ?auto_41401 ) ) ( not ( = ?auto_41402 ?auto_41400 ) ) ( not ( = ?auto_41402 ?auto_41399 ) ) ( not ( = ?auto_41402 ?auto_41398 ) ) ( not ( = ?auto_41401 ?auto_41400 ) ) ( not ( = ?auto_41401 ?auto_41399 ) ) ( not ( = ?auto_41401 ?auto_41398 ) ) ( not ( = ?auto_41396 ?auto_41402 ) ) ( not ( = ?auto_41396 ?auto_41401 ) ) ( not ( = ?auto_41397 ?auto_41402 ) ) ( not ( = ?auto_41397 ?auto_41401 ) ) ( ON ?auto_41397 ?auto_41398 ) ( CLEAR ?auto_41397 ) ( HOLDING ?auto_41396 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41396 )
      ( MAKE-4PILE ?auto_41396 ?auto_41397 ?auto_41398 ?auto_41399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41403 - BLOCK
      ?auto_41404 - BLOCK
      ?auto_41405 - BLOCK
      ?auto_41406 - BLOCK
    )
    :vars
    (
      ?auto_41409 - BLOCK
      ?auto_41408 - BLOCK
      ?auto_41407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41403 ?auto_41404 ) ) ( not ( = ?auto_41403 ?auto_41405 ) ) ( not ( = ?auto_41403 ?auto_41406 ) ) ( not ( = ?auto_41404 ?auto_41405 ) ) ( not ( = ?auto_41404 ?auto_41406 ) ) ( not ( = ?auto_41405 ?auto_41406 ) ) ( ON ?auto_41406 ?auto_41409 ) ( not ( = ?auto_41403 ?auto_41409 ) ) ( not ( = ?auto_41404 ?auto_41409 ) ) ( not ( = ?auto_41405 ?auto_41409 ) ) ( not ( = ?auto_41406 ?auto_41409 ) ) ( ON ?auto_41405 ?auto_41406 ) ( ON-TABLE ?auto_41408 ) ( ON ?auto_41407 ?auto_41408 ) ( ON ?auto_41409 ?auto_41407 ) ( not ( = ?auto_41408 ?auto_41407 ) ) ( not ( = ?auto_41408 ?auto_41409 ) ) ( not ( = ?auto_41408 ?auto_41406 ) ) ( not ( = ?auto_41408 ?auto_41405 ) ) ( not ( = ?auto_41407 ?auto_41409 ) ) ( not ( = ?auto_41407 ?auto_41406 ) ) ( not ( = ?auto_41407 ?auto_41405 ) ) ( not ( = ?auto_41403 ?auto_41408 ) ) ( not ( = ?auto_41403 ?auto_41407 ) ) ( not ( = ?auto_41404 ?auto_41408 ) ) ( not ( = ?auto_41404 ?auto_41407 ) ) ( ON ?auto_41404 ?auto_41405 ) ( ON ?auto_41403 ?auto_41404 ) ( CLEAR ?auto_41403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41408 ?auto_41407 ?auto_41409 ?auto_41406 ?auto_41405 ?auto_41404 )
      ( MAKE-4PILE ?auto_41403 ?auto_41404 ?auto_41405 ?auto_41406 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41412 - BLOCK
      ?auto_41413 - BLOCK
    )
    :vars
    (
      ?auto_41414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41414 ?auto_41413 ) ( CLEAR ?auto_41414 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41412 ) ( ON ?auto_41413 ?auto_41412 ) ( not ( = ?auto_41412 ?auto_41413 ) ) ( not ( = ?auto_41412 ?auto_41414 ) ) ( not ( = ?auto_41413 ?auto_41414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41414 ?auto_41413 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41415 - BLOCK
      ?auto_41416 - BLOCK
    )
    :vars
    (
      ?auto_41417 - BLOCK
      ?auto_41418 - BLOCK
      ?auto_41419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41417 ?auto_41416 ) ( CLEAR ?auto_41417 ) ( ON-TABLE ?auto_41415 ) ( ON ?auto_41416 ?auto_41415 ) ( not ( = ?auto_41415 ?auto_41416 ) ) ( not ( = ?auto_41415 ?auto_41417 ) ) ( not ( = ?auto_41416 ?auto_41417 ) ) ( HOLDING ?auto_41418 ) ( CLEAR ?auto_41419 ) ( not ( = ?auto_41415 ?auto_41418 ) ) ( not ( = ?auto_41415 ?auto_41419 ) ) ( not ( = ?auto_41416 ?auto_41418 ) ) ( not ( = ?auto_41416 ?auto_41419 ) ) ( not ( = ?auto_41417 ?auto_41418 ) ) ( not ( = ?auto_41417 ?auto_41419 ) ) ( not ( = ?auto_41418 ?auto_41419 ) ) )
    :subtasks
    ( ( !STACK ?auto_41418 ?auto_41419 )
      ( MAKE-2PILE ?auto_41415 ?auto_41416 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41420 - BLOCK
      ?auto_41421 - BLOCK
    )
    :vars
    (
      ?auto_41422 - BLOCK
      ?auto_41424 - BLOCK
      ?auto_41423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41422 ?auto_41421 ) ( ON-TABLE ?auto_41420 ) ( ON ?auto_41421 ?auto_41420 ) ( not ( = ?auto_41420 ?auto_41421 ) ) ( not ( = ?auto_41420 ?auto_41422 ) ) ( not ( = ?auto_41421 ?auto_41422 ) ) ( CLEAR ?auto_41424 ) ( not ( = ?auto_41420 ?auto_41423 ) ) ( not ( = ?auto_41420 ?auto_41424 ) ) ( not ( = ?auto_41421 ?auto_41423 ) ) ( not ( = ?auto_41421 ?auto_41424 ) ) ( not ( = ?auto_41422 ?auto_41423 ) ) ( not ( = ?auto_41422 ?auto_41424 ) ) ( not ( = ?auto_41423 ?auto_41424 ) ) ( ON ?auto_41423 ?auto_41422 ) ( CLEAR ?auto_41423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41420 ?auto_41421 ?auto_41422 )
      ( MAKE-2PILE ?auto_41420 ?auto_41421 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41425 - BLOCK
      ?auto_41426 - BLOCK
    )
    :vars
    (
      ?auto_41428 - BLOCK
      ?auto_41427 - BLOCK
      ?auto_41429 - BLOCK
      ?auto_41431 - BLOCK
      ?auto_41430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41428 ?auto_41426 ) ( ON-TABLE ?auto_41425 ) ( ON ?auto_41426 ?auto_41425 ) ( not ( = ?auto_41425 ?auto_41426 ) ) ( not ( = ?auto_41425 ?auto_41428 ) ) ( not ( = ?auto_41426 ?auto_41428 ) ) ( not ( = ?auto_41425 ?auto_41427 ) ) ( not ( = ?auto_41425 ?auto_41429 ) ) ( not ( = ?auto_41426 ?auto_41427 ) ) ( not ( = ?auto_41426 ?auto_41429 ) ) ( not ( = ?auto_41428 ?auto_41427 ) ) ( not ( = ?auto_41428 ?auto_41429 ) ) ( not ( = ?auto_41427 ?auto_41429 ) ) ( ON ?auto_41427 ?auto_41428 ) ( CLEAR ?auto_41427 ) ( HOLDING ?auto_41429 ) ( CLEAR ?auto_41431 ) ( ON-TABLE ?auto_41430 ) ( ON ?auto_41431 ?auto_41430 ) ( not ( = ?auto_41430 ?auto_41431 ) ) ( not ( = ?auto_41430 ?auto_41429 ) ) ( not ( = ?auto_41431 ?auto_41429 ) ) ( not ( = ?auto_41425 ?auto_41431 ) ) ( not ( = ?auto_41425 ?auto_41430 ) ) ( not ( = ?auto_41426 ?auto_41431 ) ) ( not ( = ?auto_41426 ?auto_41430 ) ) ( not ( = ?auto_41428 ?auto_41431 ) ) ( not ( = ?auto_41428 ?auto_41430 ) ) ( not ( = ?auto_41427 ?auto_41431 ) ) ( not ( = ?auto_41427 ?auto_41430 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41430 ?auto_41431 ?auto_41429 )
      ( MAKE-2PILE ?auto_41425 ?auto_41426 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41432 - BLOCK
      ?auto_41433 - BLOCK
    )
    :vars
    (
      ?auto_41438 - BLOCK
      ?auto_41436 - BLOCK
      ?auto_41437 - BLOCK
      ?auto_41435 - BLOCK
      ?auto_41434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41438 ?auto_41433 ) ( ON-TABLE ?auto_41432 ) ( ON ?auto_41433 ?auto_41432 ) ( not ( = ?auto_41432 ?auto_41433 ) ) ( not ( = ?auto_41432 ?auto_41438 ) ) ( not ( = ?auto_41433 ?auto_41438 ) ) ( not ( = ?auto_41432 ?auto_41436 ) ) ( not ( = ?auto_41432 ?auto_41437 ) ) ( not ( = ?auto_41433 ?auto_41436 ) ) ( not ( = ?auto_41433 ?auto_41437 ) ) ( not ( = ?auto_41438 ?auto_41436 ) ) ( not ( = ?auto_41438 ?auto_41437 ) ) ( not ( = ?auto_41436 ?auto_41437 ) ) ( ON ?auto_41436 ?auto_41438 ) ( CLEAR ?auto_41435 ) ( ON-TABLE ?auto_41434 ) ( ON ?auto_41435 ?auto_41434 ) ( not ( = ?auto_41434 ?auto_41435 ) ) ( not ( = ?auto_41434 ?auto_41437 ) ) ( not ( = ?auto_41435 ?auto_41437 ) ) ( not ( = ?auto_41432 ?auto_41435 ) ) ( not ( = ?auto_41432 ?auto_41434 ) ) ( not ( = ?auto_41433 ?auto_41435 ) ) ( not ( = ?auto_41433 ?auto_41434 ) ) ( not ( = ?auto_41438 ?auto_41435 ) ) ( not ( = ?auto_41438 ?auto_41434 ) ) ( not ( = ?auto_41436 ?auto_41435 ) ) ( not ( = ?auto_41436 ?auto_41434 ) ) ( ON ?auto_41437 ?auto_41436 ) ( CLEAR ?auto_41437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41432 ?auto_41433 ?auto_41438 ?auto_41436 )
      ( MAKE-2PILE ?auto_41432 ?auto_41433 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41439 - BLOCK
      ?auto_41440 - BLOCK
    )
    :vars
    (
      ?auto_41441 - BLOCK
      ?auto_41444 - BLOCK
      ?auto_41443 - BLOCK
      ?auto_41442 - BLOCK
      ?auto_41445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41441 ?auto_41440 ) ( ON-TABLE ?auto_41439 ) ( ON ?auto_41440 ?auto_41439 ) ( not ( = ?auto_41439 ?auto_41440 ) ) ( not ( = ?auto_41439 ?auto_41441 ) ) ( not ( = ?auto_41440 ?auto_41441 ) ) ( not ( = ?auto_41439 ?auto_41444 ) ) ( not ( = ?auto_41439 ?auto_41443 ) ) ( not ( = ?auto_41440 ?auto_41444 ) ) ( not ( = ?auto_41440 ?auto_41443 ) ) ( not ( = ?auto_41441 ?auto_41444 ) ) ( not ( = ?auto_41441 ?auto_41443 ) ) ( not ( = ?auto_41444 ?auto_41443 ) ) ( ON ?auto_41444 ?auto_41441 ) ( ON-TABLE ?auto_41442 ) ( not ( = ?auto_41442 ?auto_41445 ) ) ( not ( = ?auto_41442 ?auto_41443 ) ) ( not ( = ?auto_41445 ?auto_41443 ) ) ( not ( = ?auto_41439 ?auto_41445 ) ) ( not ( = ?auto_41439 ?auto_41442 ) ) ( not ( = ?auto_41440 ?auto_41445 ) ) ( not ( = ?auto_41440 ?auto_41442 ) ) ( not ( = ?auto_41441 ?auto_41445 ) ) ( not ( = ?auto_41441 ?auto_41442 ) ) ( not ( = ?auto_41444 ?auto_41445 ) ) ( not ( = ?auto_41444 ?auto_41442 ) ) ( ON ?auto_41443 ?auto_41444 ) ( CLEAR ?auto_41443 ) ( HOLDING ?auto_41445 ) ( CLEAR ?auto_41442 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41442 ?auto_41445 )
      ( MAKE-2PILE ?auto_41439 ?auto_41440 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41446 - BLOCK
      ?auto_41447 - BLOCK
    )
    :vars
    (
      ?auto_41449 - BLOCK
      ?auto_41452 - BLOCK
      ?auto_41448 - BLOCK
      ?auto_41451 - BLOCK
      ?auto_41450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41449 ?auto_41447 ) ( ON-TABLE ?auto_41446 ) ( ON ?auto_41447 ?auto_41446 ) ( not ( = ?auto_41446 ?auto_41447 ) ) ( not ( = ?auto_41446 ?auto_41449 ) ) ( not ( = ?auto_41447 ?auto_41449 ) ) ( not ( = ?auto_41446 ?auto_41452 ) ) ( not ( = ?auto_41446 ?auto_41448 ) ) ( not ( = ?auto_41447 ?auto_41452 ) ) ( not ( = ?auto_41447 ?auto_41448 ) ) ( not ( = ?auto_41449 ?auto_41452 ) ) ( not ( = ?auto_41449 ?auto_41448 ) ) ( not ( = ?auto_41452 ?auto_41448 ) ) ( ON ?auto_41452 ?auto_41449 ) ( ON-TABLE ?auto_41451 ) ( not ( = ?auto_41451 ?auto_41450 ) ) ( not ( = ?auto_41451 ?auto_41448 ) ) ( not ( = ?auto_41450 ?auto_41448 ) ) ( not ( = ?auto_41446 ?auto_41450 ) ) ( not ( = ?auto_41446 ?auto_41451 ) ) ( not ( = ?auto_41447 ?auto_41450 ) ) ( not ( = ?auto_41447 ?auto_41451 ) ) ( not ( = ?auto_41449 ?auto_41450 ) ) ( not ( = ?auto_41449 ?auto_41451 ) ) ( not ( = ?auto_41452 ?auto_41450 ) ) ( not ( = ?auto_41452 ?auto_41451 ) ) ( ON ?auto_41448 ?auto_41452 ) ( CLEAR ?auto_41451 ) ( ON ?auto_41450 ?auto_41448 ) ( CLEAR ?auto_41450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41446 ?auto_41447 ?auto_41449 ?auto_41452 ?auto_41448 )
      ( MAKE-2PILE ?auto_41446 ?auto_41447 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41453 - BLOCK
      ?auto_41454 - BLOCK
    )
    :vars
    (
      ?auto_41457 - BLOCK
      ?auto_41455 - BLOCK
      ?auto_41459 - BLOCK
      ?auto_41456 - BLOCK
      ?auto_41458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41457 ?auto_41454 ) ( ON-TABLE ?auto_41453 ) ( ON ?auto_41454 ?auto_41453 ) ( not ( = ?auto_41453 ?auto_41454 ) ) ( not ( = ?auto_41453 ?auto_41457 ) ) ( not ( = ?auto_41454 ?auto_41457 ) ) ( not ( = ?auto_41453 ?auto_41455 ) ) ( not ( = ?auto_41453 ?auto_41459 ) ) ( not ( = ?auto_41454 ?auto_41455 ) ) ( not ( = ?auto_41454 ?auto_41459 ) ) ( not ( = ?auto_41457 ?auto_41455 ) ) ( not ( = ?auto_41457 ?auto_41459 ) ) ( not ( = ?auto_41455 ?auto_41459 ) ) ( ON ?auto_41455 ?auto_41457 ) ( not ( = ?auto_41456 ?auto_41458 ) ) ( not ( = ?auto_41456 ?auto_41459 ) ) ( not ( = ?auto_41458 ?auto_41459 ) ) ( not ( = ?auto_41453 ?auto_41458 ) ) ( not ( = ?auto_41453 ?auto_41456 ) ) ( not ( = ?auto_41454 ?auto_41458 ) ) ( not ( = ?auto_41454 ?auto_41456 ) ) ( not ( = ?auto_41457 ?auto_41458 ) ) ( not ( = ?auto_41457 ?auto_41456 ) ) ( not ( = ?auto_41455 ?auto_41458 ) ) ( not ( = ?auto_41455 ?auto_41456 ) ) ( ON ?auto_41459 ?auto_41455 ) ( ON ?auto_41458 ?auto_41459 ) ( CLEAR ?auto_41458 ) ( HOLDING ?auto_41456 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41456 )
      ( MAKE-2PILE ?auto_41453 ?auto_41454 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41460 - BLOCK
      ?auto_41461 - BLOCK
    )
    :vars
    (
      ?auto_41464 - BLOCK
      ?auto_41466 - BLOCK
      ?auto_41462 - BLOCK
      ?auto_41463 - BLOCK
      ?auto_41465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41464 ?auto_41461 ) ( ON-TABLE ?auto_41460 ) ( ON ?auto_41461 ?auto_41460 ) ( not ( = ?auto_41460 ?auto_41461 ) ) ( not ( = ?auto_41460 ?auto_41464 ) ) ( not ( = ?auto_41461 ?auto_41464 ) ) ( not ( = ?auto_41460 ?auto_41466 ) ) ( not ( = ?auto_41460 ?auto_41462 ) ) ( not ( = ?auto_41461 ?auto_41466 ) ) ( not ( = ?auto_41461 ?auto_41462 ) ) ( not ( = ?auto_41464 ?auto_41466 ) ) ( not ( = ?auto_41464 ?auto_41462 ) ) ( not ( = ?auto_41466 ?auto_41462 ) ) ( ON ?auto_41466 ?auto_41464 ) ( not ( = ?auto_41463 ?auto_41465 ) ) ( not ( = ?auto_41463 ?auto_41462 ) ) ( not ( = ?auto_41465 ?auto_41462 ) ) ( not ( = ?auto_41460 ?auto_41465 ) ) ( not ( = ?auto_41460 ?auto_41463 ) ) ( not ( = ?auto_41461 ?auto_41465 ) ) ( not ( = ?auto_41461 ?auto_41463 ) ) ( not ( = ?auto_41464 ?auto_41465 ) ) ( not ( = ?auto_41464 ?auto_41463 ) ) ( not ( = ?auto_41466 ?auto_41465 ) ) ( not ( = ?auto_41466 ?auto_41463 ) ) ( ON ?auto_41462 ?auto_41466 ) ( ON ?auto_41465 ?auto_41462 ) ( ON ?auto_41463 ?auto_41465 ) ( CLEAR ?auto_41463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41460 ?auto_41461 ?auto_41464 ?auto_41466 ?auto_41462 ?auto_41465 )
      ( MAKE-2PILE ?auto_41460 ?auto_41461 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41472 - BLOCK
      ?auto_41473 - BLOCK
      ?auto_41474 - BLOCK
      ?auto_41475 - BLOCK
      ?auto_41476 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_41476 ) ( CLEAR ?auto_41475 ) ( ON-TABLE ?auto_41472 ) ( ON ?auto_41473 ?auto_41472 ) ( ON ?auto_41474 ?auto_41473 ) ( ON ?auto_41475 ?auto_41474 ) ( not ( = ?auto_41472 ?auto_41473 ) ) ( not ( = ?auto_41472 ?auto_41474 ) ) ( not ( = ?auto_41472 ?auto_41475 ) ) ( not ( = ?auto_41472 ?auto_41476 ) ) ( not ( = ?auto_41473 ?auto_41474 ) ) ( not ( = ?auto_41473 ?auto_41475 ) ) ( not ( = ?auto_41473 ?auto_41476 ) ) ( not ( = ?auto_41474 ?auto_41475 ) ) ( not ( = ?auto_41474 ?auto_41476 ) ) ( not ( = ?auto_41475 ?auto_41476 ) ) )
    :subtasks
    ( ( !STACK ?auto_41476 ?auto_41475 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41477 - BLOCK
      ?auto_41478 - BLOCK
      ?auto_41479 - BLOCK
      ?auto_41480 - BLOCK
      ?auto_41481 - BLOCK
    )
    :vars
    (
      ?auto_41482 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41480 ) ( ON-TABLE ?auto_41477 ) ( ON ?auto_41478 ?auto_41477 ) ( ON ?auto_41479 ?auto_41478 ) ( ON ?auto_41480 ?auto_41479 ) ( not ( = ?auto_41477 ?auto_41478 ) ) ( not ( = ?auto_41477 ?auto_41479 ) ) ( not ( = ?auto_41477 ?auto_41480 ) ) ( not ( = ?auto_41477 ?auto_41481 ) ) ( not ( = ?auto_41478 ?auto_41479 ) ) ( not ( = ?auto_41478 ?auto_41480 ) ) ( not ( = ?auto_41478 ?auto_41481 ) ) ( not ( = ?auto_41479 ?auto_41480 ) ) ( not ( = ?auto_41479 ?auto_41481 ) ) ( not ( = ?auto_41480 ?auto_41481 ) ) ( ON ?auto_41481 ?auto_41482 ) ( CLEAR ?auto_41481 ) ( HAND-EMPTY ) ( not ( = ?auto_41477 ?auto_41482 ) ) ( not ( = ?auto_41478 ?auto_41482 ) ) ( not ( = ?auto_41479 ?auto_41482 ) ) ( not ( = ?auto_41480 ?auto_41482 ) ) ( not ( = ?auto_41481 ?auto_41482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41481 ?auto_41482 )
      ( MAKE-5PILE ?auto_41477 ?auto_41478 ?auto_41479 ?auto_41480 ?auto_41481 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41483 - BLOCK
      ?auto_41484 - BLOCK
      ?auto_41485 - BLOCK
      ?auto_41486 - BLOCK
      ?auto_41487 - BLOCK
    )
    :vars
    (
      ?auto_41488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41483 ) ( ON ?auto_41484 ?auto_41483 ) ( ON ?auto_41485 ?auto_41484 ) ( not ( = ?auto_41483 ?auto_41484 ) ) ( not ( = ?auto_41483 ?auto_41485 ) ) ( not ( = ?auto_41483 ?auto_41486 ) ) ( not ( = ?auto_41483 ?auto_41487 ) ) ( not ( = ?auto_41484 ?auto_41485 ) ) ( not ( = ?auto_41484 ?auto_41486 ) ) ( not ( = ?auto_41484 ?auto_41487 ) ) ( not ( = ?auto_41485 ?auto_41486 ) ) ( not ( = ?auto_41485 ?auto_41487 ) ) ( not ( = ?auto_41486 ?auto_41487 ) ) ( ON ?auto_41487 ?auto_41488 ) ( CLEAR ?auto_41487 ) ( not ( = ?auto_41483 ?auto_41488 ) ) ( not ( = ?auto_41484 ?auto_41488 ) ) ( not ( = ?auto_41485 ?auto_41488 ) ) ( not ( = ?auto_41486 ?auto_41488 ) ) ( not ( = ?auto_41487 ?auto_41488 ) ) ( HOLDING ?auto_41486 ) ( CLEAR ?auto_41485 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41483 ?auto_41484 ?auto_41485 ?auto_41486 )
      ( MAKE-5PILE ?auto_41483 ?auto_41484 ?auto_41485 ?auto_41486 ?auto_41487 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41489 - BLOCK
      ?auto_41490 - BLOCK
      ?auto_41491 - BLOCK
      ?auto_41492 - BLOCK
      ?auto_41493 - BLOCK
    )
    :vars
    (
      ?auto_41494 - BLOCK
      ?auto_41495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41489 ) ( ON ?auto_41490 ?auto_41489 ) ( ON ?auto_41491 ?auto_41490 ) ( not ( = ?auto_41489 ?auto_41490 ) ) ( not ( = ?auto_41489 ?auto_41491 ) ) ( not ( = ?auto_41489 ?auto_41492 ) ) ( not ( = ?auto_41489 ?auto_41493 ) ) ( not ( = ?auto_41490 ?auto_41491 ) ) ( not ( = ?auto_41490 ?auto_41492 ) ) ( not ( = ?auto_41490 ?auto_41493 ) ) ( not ( = ?auto_41491 ?auto_41492 ) ) ( not ( = ?auto_41491 ?auto_41493 ) ) ( not ( = ?auto_41492 ?auto_41493 ) ) ( ON ?auto_41493 ?auto_41494 ) ( not ( = ?auto_41489 ?auto_41494 ) ) ( not ( = ?auto_41490 ?auto_41494 ) ) ( not ( = ?auto_41491 ?auto_41494 ) ) ( not ( = ?auto_41492 ?auto_41494 ) ) ( not ( = ?auto_41493 ?auto_41494 ) ) ( CLEAR ?auto_41491 ) ( ON ?auto_41492 ?auto_41493 ) ( CLEAR ?auto_41492 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41495 ) ( ON ?auto_41494 ?auto_41495 ) ( not ( = ?auto_41495 ?auto_41494 ) ) ( not ( = ?auto_41495 ?auto_41493 ) ) ( not ( = ?auto_41495 ?auto_41492 ) ) ( not ( = ?auto_41489 ?auto_41495 ) ) ( not ( = ?auto_41490 ?auto_41495 ) ) ( not ( = ?auto_41491 ?auto_41495 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41495 ?auto_41494 ?auto_41493 )
      ( MAKE-5PILE ?auto_41489 ?auto_41490 ?auto_41491 ?auto_41492 ?auto_41493 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41496 - BLOCK
      ?auto_41497 - BLOCK
      ?auto_41498 - BLOCK
      ?auto_41499 - BLOCK
      ?auto_41500 - BLOCK
    )
    :vars
    (
      ?auto_41502 - BLOCK
      ?auto_41501 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41496 ) ( ON ?auto_41497 ?auto_41496 ) ( not ( = ?auto_41496 ?auto_41497 ) ) ( not ( = ?auto_41496 ?auto_41498 ) ) ( not ( = ?auto_41496 ?auto_41499 ) ) ( not ( = ?auto_41496 ?auto_41500 ) ) ( not ( = ?auto_41497 ?auto_41498 ) ) ( not ( = ?auto_41497 ?auto_41499 ) ) ( not ( = ?auto_41497 ?auto_41500 ) ) ( not ( = ?auto_41498 ?auto_41499 ) ) ( not ( = ?auto_41498 ?auto_41500 ) ) ( not ( = ?auto_41499 ?auto_41500 ) ) ( ON ?auto_41500 ?auto_41502 ) ( not ( = ?auto_41496 ?auto_41502 ) ) ( not ( = ?auto_41497 ?auto_41502 ) ) ( not ( = ?auto_41498 ?auto_41502 ) ) ( not ( = ?auto_41499 ?auto_41502 ) ) ( not ( = ?auto_41500 ?auto_41502 ) ) ( ON ?auto_41499 ?auto_41500 ) ( CLEAR ?auto_41499 ) ( ON-TABLE ?auto_41501 ) ( ON ?auto_41502 ?auto_41501 ) ( not ( = ?auto_41501 ?auto_41502 ) ) ( not ( = ?auto_41501 ?auto_41500 ) ) ( not ( = ?auto_41501 ?auto_41499 ) ) ( not ( = ?auto_41496 ?auto_41501 ) ) ( not ( = ?auto_41497 ?auto_41501 ) ) ( not ( = ?auto_41498 ?auto_41501 ) ) ( HOLDING ?auto_41498 ) ( CLEAR ?auto_41497 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41496 ?auto_41497 ?auto_41498 )
      ( MAKE-5PILE ?auto_41496 ?auto_41497 ?auto_41498 ?auto_41499 ?auto_41500 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41503 - BLOCK
      ?auto_41504 - BLOCK
      ?auto_41505 - BLOCK
      ?auto_41506 - BLOCK
      ?auto_41507 - BLOCK
    )
    :vars
    (
      ?auto_41509 - BLOCK
      ?auto_41508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41503 ) ( ON ?auto_41504 ?auto_41503 ) ( not ( = ?auto_41503 ?auto_41504 ) ) ( not ( = ?auto_41503 ?auto_41505 ) ) ( not ( = ?auto_41503 ?auto_41506 ) ) ( not ( = ?auto_41503 ?auto_41507 ) ) ( not ( = ?auto_41504 ?auto_41505 ) ) ( not ( = ?auto_41504 ?auto_41506 ) ) ( not ( = ?auto_41504 ?auto_41507 ) ) ( not ( = ?auto_41505 ?auto_41506 ) ) ( not ( = ?auto_41505 ?auto_41507 ) ) ( not ( = ?auto_41506 ?auto_41507 ) ) ( ON ?auto_41507 ?auto_41509 ) ( not ( = ?auto_41503 ?auto_41509 ) ) ( not ( = ?auto_41504 ?auto_41509 ) ) ( not ( = ?auto_41505 ?auto_41509 ) ) ( not ( = ?auto_41506 ?auto_41509 ) ) ( not ( = ?auto_41507 ?auto_41509 ) ) ( ON ?auto_41506 ?auto_41507 ) ( ON-TABLE ?auto_41508 ) ( ON ?auto_41509 ?auto_41508 ) ( not ( = ?auto_41508 ?auto_41509 ) ) ( not ( = ?auto_41508 ?auto_41507 ) ) ( not ( = ?auto_41508 ?auto_41506 ) ) ( not ( = ?auto_41503 ?auto_41508 ) ) ( not ( = ?auto_41504 ?auto_41508 ) ) ( not ( = ?auto_41505 ?auto_41508 ) ) ( CLEAR ?auto_41504 ) ( ON ?auto_41505 ?auto_41506 ) ( CLEAR ?auto_41505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41508 ?auto_41509 ?auto_41507 ?auto_41506 )
      ( MAKE-5PILE ?auto_41503 ?auto_41504 ?auto_41505 ?auto_41506 ?auto_41507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41510 - BLOCK
      ?auto_41511 - BLOCK
      ?auto_41512 - BLOCK
      ?auto_41513 - BLOCK
      ?auto_41514 - BLOCK
    )
    :vars
    (
      ?auto_41515 - BLOCK
      ?auto_41516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41510 ) ( not ( = ?auto_41510 ?auto_41511 ) ) ( not ( = ?auto_41510 ?auto_41512 ) ) ( not ( = ?auto_41510 ?auto_41513 ) ) ( not ( = ?auto_41510 ?auto_41514 ) ) ( not ( = ?auto_41511 ?auto_41512 ) ) ( not ( = ?auto_41511 ?auto_41513 ) ) ( not ( = ?auto_41511 ?auto_41514 ) ) ( not ( = ?auto_41512 ?auto_41513 ) ) ( not ( = ?auto_41512 ?auto_41514 ) ) ( not ( = ?auto_41513 ?auto_41514 ) ) ( ON ?auto_41514 ?auto_41515 ) ( not ( = ?auto_41510 ?auto_41515 ) ) ( not ( = ?auto_41511 ?auto_41515 ) ) ( not ( = ?auto_41512 ?auto_41515 ) ) ( not ( = ?auto_41513 ?auto_41515 ) ) ( not ( = ?auto_41514 ?auto_41515 ) ) ( ON ?auto_41513 ?auto_41514 ) ( ON-TABLE ?auto_41516 ) ( ON ?auto_41515 ?auto_41516 ) ( not ( = ?auto_41516 ?auto_41515 ) ) ( not ( = ?auto_41516 ?auto_41514 ) ) ( not ( = ?auto_41516 ?auto_41513 ) ) ( not ( = ?auto_41510 ?auto_41516 ) ) ( not ( = ?auto_41511 ?auto_41516 ) ) ( not ( = ?auto_41512 ?auto_41516 ) ) ( ON ?auto_41512 ?auto_41513 ) ( CLEAR ?auto_41512 ) ( HOLDING ?auto_41511 ) ( CLEAR ?auto_41510 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41510 ?auto_41511 )
      ( MAKE-5PILE ?auto_41510 ?auto_41511 ?auto_41512 ?auto_41513 ?auto_41514 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41517 - BLOCK
      ?auto_41518 - BLOCK
      ?auto_41519 - BLOCK
      ?auto_41520 - BLOCK
      ?auto_41521 - BLOCK
    )
    :vars
    (
      ?auto_41522 - BLOCK
      ?auto_41523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41517 ) ( not ( = ?auto_41517 ?auto_41518 ) ) ( not ( = ?auto_41517 ?auto_41519 ) ) ( not ( = ?auto_41517 ?auto_41520 ) ) ( not ( = ?auto_41517 ?auto_41521 ) ) ( not ( = ?auto_41518 ?auto_41519 ) ) ( not ( = ?auto_41518 ?auto_41520 ) ) ( not ( = ?auto_41518 ?auto_41521 ) ) ( not ( = ?auto_41519 ?auto_41520 ) ) ( not ( = ?auto_41519 ?auto_41521 ) ) ( not ( = ?auto_41520 ?auto_41521 ) ) ( ON ?auto_41521 ?auto_41522 ) ( not ( = ?auto_41517 ?auto_41522 ) ) ( not ( = ?auto_41518 ?auto_41522 ) ) ( not ( = ?auto_41519 ?auto_41522 ) ) ( not ( = ?auto_41520 ?auto_41522 ) ) ( not ( = ?auto_41521 ?auto_41522 ) ) ( ON ?auto_41520 ?auto_41521 ) ( ON-TABLE ?auto_41523 ) ( ON ?auto_41522 ?auto_41523 ) ( not ( = ?auto_41523 ?auto_41522 ) ) ( not ( = ?auto_41523 ?auto_41521 ) ) ( not ( = ?auto_41523 ?auto_41520 ) ) ( not ( = ?auto_41517 ?auto_41523 ) ) ( not ( = ?auto_41518 ?auto_41523 ) ) ( not ( = ?auto_41519 ?auto_41523 ) ) ( ON ?auto_41519 ?auto_41520 ) ( CLEAR ?auto_41517 ) ( ON ?auto_41518 ?auto_41519 ) ( CLEAR ?auto_41518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41523 ?auto_41522 ?auto_41521 ?auto_41520 ?auto_41519 )
      ( MAKE-5PILE ?auto_41517 ?auto_41518 ?auto_41519 ?auto_41520 ?auto_41521 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41524 - BLOCK
      ?auto_41525 - BLOCK
      ?auto_41526 - BLOCK
      ?auto_41527 - BLOCK
      ?auto_41528 - BLOCK
    )
    :vars
    (
      ?auto_41530 - BLOCK
      ?auto_41529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41524 ?auto_41525 ) ) ( not ( = ?auto_41524 ?auto_41526 ) ) ( not ( = ?auto_41524 ?auto_41527 ) ) ( not ( = ?auto_41524 ?auto_41528 ) ) ( not ( = ?auto_41525 ?auto_41526 ) ) ( not ( = ?auto_41525 ?auto_41527 ) ) ( not ( = ?auto_41525 ?auto_41528 ) ) ( not ( = ?auto_41526 ?auto_41527 ) ) ( not ( = ?auto_41526 ?auto_41528 ) ) ( not ( = ?auto_41527 ?auto_41528 ) ) ( ON ?auto_41528 ?auto_41530 ) ( not ( = ?auto_41524 ?auto_41530 ) ) ( not ( = ?auto_41525 ?auto_41530 ) ) ( not ( = ?auto_41526 ?auto_41530 ) ) ( not ( = ?auto_41527 ?auto_41530 ) ) ( not ( = ?auto_41528 ?auto_41530 ) ) ( ON ?auto_41527 ?auto_41528 ) ( ON-TABLE ?auto_41529 ) ( ON ?auto_41530 ?auto_41529 ) ( not ( = ?auto_41529 ?auto_41530 ) ) ( not ( = ?auto_41529 ?auto_41528 ) ) ( not ( = ?auto_41529 ?auto_41527 ) ) ( not ( = ?auto_41524 ?auto_41529 ) ) ( not ( = ?auto_41525 ?auto_41529 ) ) ( not ( = ?auto_41526 ?auto_41529 ) ) ( ON ?auto_41526 ?auto_41527 ) ( ON ?auto_41525 ?auto_41526 ) ( CLEAR ?auto_41525 ) ( HOLDING ?auto_41524 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41524 )
      ( MAKE-5PILE ?auto_41524 ?auto_41525 ?auto_41526 ?auto_41527 ?auto_41528 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41531 - BLOCK
      ?auto_41532 - BLOCK
      ?auto_41533 - BLOCK
      ?auto_41534 - BLOCK
      ?auto_41535 - BLOCK
    )
    :vars
    (
      ?auto_41536 - BLOCK
      ?auto_41537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41531 ?auto_41532 ) ) ( not ( = ?auto_41531 ?auto_41533 ) ) ( not ( = ?auto_41531 ?auto_41534 ) ) ( not ( = ?auto_41531 ?auto_41535 ) ) ( not ( = ?auto_41532 ?auto_41533 ) ) ( not ( = ?auto_41532 ?auto_41534 ) ) ( not ( = ?auto_41532 ?auto_41535 ) ) ( not ( = ?auto_41533 ?auto_41534 ) ) ( not ( = ?auto_41533 ?auto_41535 ) ) ( not ( = ?auto_41534 ?auto_41535 ) ) ( ON ?auto_41535 ?auto_41536 ) ( not ( = ?auto_41531 ?auto_41536 ) ) ( not ( = ?auto_41532 ?auto_41536 ) ) ( not ( = ?auto_41533 ?auto_41536 ) ) ( not ( = ?auto_41534 ?auto_41536 ) ) ( not ( = ?auto_41535 ?auto_41536 ) ) ( ON ?auto_41534 ?auto_41535 ) ( ON-TABLE ?auto_41537 ) ( ON ?auto_41536 ?auto_41537 ) ( not ( = ?auto_41537 ?auto_41536 ) ) ( not ( = ?auto_41537 ?auto_41535 ) ) ( not ( = ?auto_41537 ?auto_41534 ) ) ( not ( = ?auto_41531 ?auto_41537 ) ) ( not ( = ?auto_41532 ?auto_41537 ) ) ( not ( = ?auto_41533 ?auto_41537 ) ) ( ON ?auto_41533 ?auto_41534 ) ( ON ?auto_41532 ?auto_41533 ) ( ON ?auto_41531 ?auto_41532 ) ( CLEAR ?auto_41531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41537 ?auto_41536 ?auto_41535 ?auto_41534 ?auto_41533 ?auto_41532 )
      ( MAKE-5PILE ?auto_41531 ?auto_41532 ?auto_41533 ?auto_41534 ?auto_41535 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41539 - BLOCK
    )
    :vars
    (
      ?auto_41540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41540 ?auto_41539 ) ( CLEAR ?auto_41540 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41539 ) ( not ( = ?auto_41539 ?auto_41540 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41540 ?auto_41539 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41541 - BLOCK
    )
    :vars
    (
      ?auto_41542 - BLOCK
      ?auto_41543 - BLOCK
      ?auto_41544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41542 ?auto_41541 ) ( CLEAR ?auto_41542 ) ( ON-TABLE ?auto_41541 ) ( not ( = ?auto_41541 ?auto_41542 ) ) ( HOLDING ?auto_41543 ) ( CLEAR ?auto_41544 ) ( not ( = ?auto_41541 ?auto_41543 ) ) ( not ( = ?auto_41541 ?auto_41544 ) ) ( not ( = ?auto_41542 ?auto_41543 ) ) ( not ( = ?auto_41542 ?auto_41544 ) ) ( not ( = ?auto_41543 ?auto_41544 ) ) )
    :subtasks
    ( ( !STACK ?auto_41543 ?auto_41544 )
      ( MAKE-1PILE ?auto_41541 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41545 - BLOCK
    )
    :vars
    (
      ?auto_41546 - BLOCK
      ?auto_41548 - BLOCK
      ?auto_41547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41546 ?auto_41545 ) ( ON-TABLE ?auto_41545 ) ( not ( = ?auto_41545 ?auto_41546 ) ) ( CLEAR ?auto_41548 ) ( not ( = ?auto_41545 ?auto_41547 ) ) ( not ( = ?auto_41545 ?auto_41548 ) ) ( not ( = ?auto_41546 ?auto_41547 ) ) ( not ( = ?auto_41546 ?auto_41548 ) ) ( not ( = ?auto_41547 ?auto_41548 ) ) ( ON ?auto_41547 ?auto_41546 ) ( CLEAR ?auto_41547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41545 ?auto_41546 )
      ( MAKE-1PILE ?auto_41545 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41549 - BLOCK
    )
    :vars
    (
      ?auto_41550 - BLOCK
      ?auto_41552 - BLOCK
      ?auto_41551 - BLOCK
      ?auto_41554 - BLOCK
      ?auto_41553 - BLOCK
      ?auto_41555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41550 ?auto_41549 ) ( ON-TABLE ?auto_41549 ) ( not ( = ?auto_41549 ?auto_41550 ) ) ( not ( = ?auto_41549 ?auto_41552 ) ) ( not ( = ?auto_41549 ?auto_41551 ) ) ( not ( = ?auto_41550 ?auto_41552 ) ) ( not ( = ?auto_41550 ?auto_41551 ) ) ( not ( = ?auto_41552 ?auto_41551 ) ) ( ON ?auto_41552 ?auto_41550 ) ( CLEAR ?auto_41552 ) ( HOLDING ?auto_41551 ) ( CLEAR ?auto_41554 ) ( ON-TABLE ?auto_41553 ) ( ON ?auto_41555 ?auto_41553 ) ( ON ?auto_41554 ?auto_41555 ) ( not ( = ?auto_41553 ?auto_41555 ) ) ( not ( = ?auto_41553 ?auto_41554 ) ) ( not ( = ?auto_41553 ?auto_41551 ) ) ( not ( = ?auto_41555 ?auto_41554 ) ) ( not ( = ?auto_41555 ?auto_41551 ) ) ( not ( = ?auto_41554 ?auto_41551 ) ) ( not ( = ?auto_41549 ?auto_41554 ) ) ( not ( = ?auto_41549 ?auto_41553 ) ) ( not ( = ?auto_41549 ?auto_41555 ) ) ( not ( = ?auto_41550 ?auto_41554 ) ) ( not ( = ?auto_41550 ?auto_41553 ) ) ( not ( = ?auto_41550 ?auto_41555 ) ) ( not ( = ?auto_41552 ?auto_41554 ) ) ( not ( = ?auto_41552 ?auto_41553 ) ) ( not ( = ?auto_41552 ?auto_41555 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41553 ?auto_41555 ?auto_41554 ?auto_41551 )
      ( MAKE-1PILE ?auto_41549 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41556 - BLOCK
    )
    :vars
    (
      ?auto_41561 - BLOCK
      ?auto_41559 - BLOCK
      ?auto_41557 - BLOCK
      ?auto_41558 - BLOCK
      ?auto_41560 - BLOCK
      ?auto_41562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41561 ?auto_41556 ) ( ON-TABLE ?auto_41556 ) ( not ( = ?auto_41556 ?auto_41561 ) ) ( not ( = ?auto_41556 ?auto_41559 ) ) ( not ( = ?auto_41556 ?auto_41557 ) ) ( not ( = ?auto_41561 ?auto_41559 ) ) ( not ( = ?auto_41561 ?auto_41557 ) ) ( not ( = ?auto_41559 ?auto_41557 ) ) ( ON ?auto_41559 ?auto_41561 ) ( CLEAR ?auto_41558 ) ( ON-TABLE ?auto_41560 ) ( ON ?auto_41562 ?auto_41560 ) ( ON ?auto_41558 ?auto_41562 ) ( not ( = ?auto_41560 ?auto_41562 ) ) ( not ( = ?auto_41560 ?auto_41558 ) ) ( not ( = ?auto_41560 ?auto_41557 ) ) ( not ( = ?auto_41562 ?auto_41558 ) ) ( not ( = ?auto_41562 ?auto_41557 ) ) ( not ( = ?auto_41558 ?auto_41557 ) ) ( not ( = ?auto_41556 ?auto_41558 ) ) ( not ( = ?auto_41556 ?auto_41560 ) ) ( not ( = ?auto_41556 ?auto_41562 ) ) ( not ( = ?auto_41561 ?auto_41558 ) ) ( not ( = ?auto_41561 ?auto_41560 ) ) ( not ( = ?auto_41561 ?auto_41562 ) ) ( not ( = ?auto_41559 ?auto_41558 ) ) ( not ( = ?auto_41559 ?auto_41560 ) ) ( not ( = ?auto_41559 ?auto_41562 ) ) ( ON ?auto_41557 ?auto_41559 ) ( CLEAR ?auto_41557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41556 ?auto_41561 ?auto_41559 )
      ( MAKE-1PILE ?auto_41556 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41563 - BLOCK
    )
    :vars
    (
      ?auto_41564 - BLOCK
      ?auto_41565 - BLOCK
      ?auto_41567 - BLOCK
      ?auto_41569 - BLOCK
      ?auto_41568 - BLOCK
      ?auto_41566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41564 ?auto_41563 ) ( ON-TABLE ?auto_41563 ) ( not ( = ?auto_41563 ?auto_41564 ) ) ( not ( = ?auto_41563 ?auto_41565 ) ) ( not ( = ?auto_41563 ?auto_41567 ) ) ( not ( = ?auto_41564 ?auto_41565 ) ) ( not ( = ?auto_41564 ?auto_41567 ) ) ( not ( = ?auto_41565 ?auto_41567 ) ) ( ON ?auto_41565 ?auto_41564 ) ( ON-TABLE ?auto_41569 ) ( ON ?auto_41568 ?auto_41569 ) ( not ( = ?auto_41569 ?auto_41568 ) ) ( not ( = ?auto_41569 ?auto_41566 ) ) ( not ( = ?auto_41569 ?auto_41567 ) ) ( not ( = ?auto_41568 ?auto_41566 ) ) ( not ( = ?auto_41568 ?auto_41567 ) ) ( not ( = ?auto_41566 ?auto_41567 ) ) ( not ( = ?auto_41563 ?auto_41566 ) ) ( not ( = ?auto_41563 ?auto_41569 ) ) ( not ( = ?auto_41563 ?auto_41568 ) ) ( not ( = ?auto_41564 ?auto_41566 ) ) ( not ( = ?auto_41564 ?auto_41569 ) ) ( not ( = ?auto_41564 ?auto_41568 ) ) ( not ( = ?auto_41565 ?auto_41566 ) ) ( not ( = ?auto_41565 ?auto_41569 ) ) ( not ( = ?auto_41565 ?auto_41568 ) ) ( ON ?auto_41567 ?auto_41565 ) ( CLEAR ?auto_41567 ) ( HOLDING ?auto_41566 ) ( CLEAR ?auto_41568 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41569 ?auto_41568 ?auto_41566 )
      ( MAKE-1PILE ?auto_41563 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41570 - BLOCK
    )
    :vars
    (
      ?auto_41572 - BLOCK
      ?auto_41573 - BLOCK
      ?auto_41576 - BLOCK
      ?auto_41575 - BLOCK
      ?auto_41574 - BLOCK
      ?auto_41571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41572 ?auto_41570 ) ( ON-TABLE ?auto_41570 ) ( not ( = ?auto_41570 ?auto_41572 ) ) ( not ( = ?auto_41570 ?auto_41573 ) ) ( not ( = ?auto_41570 ?auto_41576 ) ) ( not ( = ?auto_41572 ?auto_41573 ) ) ( not ( = ?auto_41572 ?auto_41576 ) ) ( not ( = ?auto_41573 ?auto_41576 ) ) ( ON ?auto_41573 ?auto_41572 ) ( ON-TABLE ?auto_41575 ) ( ON ?auto_41574 ?auto_41575 ) ( not ( = ?auto_41575 ?auto_41574 ) ) ( not ( = ?auto_41575 ?auto_41571 ) ) ( not ( = ?auto_41575 ?auto_41576 ) ) ( not ( = ?auto_41574 ?auto_41571 ) ) ( not ( = ?auto_41574 ?auto_41576 ) ) ( not ( = ?auto_41571 ?auto_41576 ) ) ( not ( = ?auto_41570 ?auto_41571 ) ) ( not ( = ?auto_41570 ?auto_41575 ) ) ( not ( = ?auto_41570 ?auto_41574 ) ) ( not ( = ?auto_41572 ?auto_41571 ) ) ( not ( = ?auto_41572 ?auto_41575 ) ) ( not ( = ?auto_41572 ?auto_41574 ) ) ( not ( = ?auto_41573 ?auto_41571 ) ) ( not ( = ?auto_41573 ?auto_41575 ) ) ( not ( = ?auto_41573 ?auto_41574 ) ) ( ON ?auto_41576 ?auto_41573 ) ( CLEAR ?auto_41574 ) ( ON ?auto_41571 ?auto_41576 ) ( CLEAR ?auto_41571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41570 ?auto_41572 ?auto_41573 ?auto_41576 )
      ( MAKE-1PILE ?auto_41570 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41577 - BLOCK
    )
    :vars
    (
      ?auto_41583 - BLOCK
      ?auto_41582 - BLOCK
      ?auto_41580 - BLOCK
      ?auto_41579 - BLOCK
      ?auto_41581 - BLOCK
      ?auto_41578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41583 ?auto_41577 ) ( ON-TABLE ?auto_41577 ) ( not ( = ?auto_41577 ?auto_41583 ) ) ( not ( = ?auto_41577 ?auto_41582 ) ) ( not ( = ?auto_41577 ?auto_41580 ) ) ( not ( = ?auto_41583 ?auto_41582 ) ) ( not ( = ?auto_41583 ?auto_41580 ) ) ( not ( = ?auto_41582 ?auto_41580 ) ) ( ON ?auto_41582 ?auto_41583 ) ( ON-TABLE ?auto_41579 ) ( not ( = ?auto_41579 ?auto_41581 ) ) ( not ( = ?auto_41579 ?auto_41578 ) ) ( not ( = ?auto_41579 ?auto_41580 ) ) ( not ( = ?auto_41581 ?auto_41578 ) ) ( not ( = ?auto_41581 ?auto_41580 ) ) ( not ( = ?auto_41578 ?auto_41580 ) ) ( not ( = ?auto_41577 ?auto_41578 ) ) ( not ( = ?auto_41577 ?auto_41579 ) ) ( not ( = ?auto_41577 ?auto_41581 ) ) ( not ( = ?auto_41583 ?auto_41578 ) ) ( not ( = ?auto_41583 ?auto_41579 ) ) ( not ( = ?auto_41583 ?auto_41581 ) ) ( not ( = ?auto_41582 ?auto_41578 ) ) ( not ( = ?auto_41582 ?auto_41579 ) ) ( not ( = ?auto_41582 ?auto_41581 ) ) ( ON ?auto_41580 ?auto_41582 ) ( ON ?auto_41578 ?auto_41580 ) ( CLEAR ?auto_41578 ) ( HOLDING ?auto_41581 ) ( CLEAR ?auto_41579 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41579 ?auto_41581 )
      ( MAKE-1PILE ?auto_41577 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41584 - BLOCK
    )
    :vars
    (
      ?auto_41587 - BLOCK
      ?auto_41586 - BLOCK
      ?auto_41590 - BLOCK
      ?auto_41585 - BLOCK
      ?auto_41588 - BLOCK
      ?auto_41589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41587 ?auto_41584 ) ( ON-TABLE ?auto_41584 ) ( not ( = ?auto_41584 ?auto_41587 ) ) ( not ( = ?auto_41584 ?auto_41586 ) ) ( not ( = ?auto_41584 ?auto_41590 ) ) ( not ( = ?auto_41587 ?auto_41586 ) ) ( not ( = ?auto_41587 ?auto_41590 ) ) ( not ( = ?auto_41586 ?auto_41590 ) ) ( ON ?auto_41586 ?auto_41587 ) ( ON-TABLE ?auto_41585 ) ( not ( = ?auto_41585 ?auto_41588 ) ) ( not ( = ?auto_41585 ?auto_41589 ) ) ( not ( = ?auto_41585 ?auto_41590 ) ) ( not ( = ?auto_41588 ?auto_41589 ) ) ( not ( = ?auto_41588 ?auto_41590 ) ) ( not ( = ?auto_41589 ?auto_41590 ) ) ( not ( = ?auto_41584 ?auto_41589 ) ) ( not ( = ?auto_41584 ?auto_41585 ) ) ( not ( = ?auto_41584 ?auto_41588 ) ) ( not ( = ?auto_41587 ?auto_41589 ) ) ( not ( = ?auto_41587 ?auto_41585 ) ) ( not ( = ?auto_41587 ?auto_41588 ) ) ( not ( = ?auto_41586 ?auto_41589 ) ) ( not ( = ?auto_41586 ?auto_41585 ) ) ( not ( = ?auto_41586 ?auto_41588 ) ) ( ON ?auto_41590 ?auto_41586 ) ( ON ?auto_41589 ?auto_41590 ) ( CLEAR ?auto_41585 ) ( ON ?auto_41588 ?auto_41589 ) ( CLEAR ?auto_41588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41584 ?auto_41587 ?auto_41586 ?auto_41590 ?auto_41589 )
      ( MAKE-1PILE ?auto_41584 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41591 - BLOCK
    )
    :vars
    (
      ?auto_41592 - BLOCK
      ?auto_41596 - BLOCK
      ?auto_41597 - BLOCK
      ?auto_41593 - BLOCK
      ?auto_41595 - BLOCK
      ?auto_41594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41592 ?auto_41591 ) ( ON-TABLE ?auto_41591 ) ( not ( = ?auto_41591 ?auto_41592 ) ) ( not ( = ?auto_41591 ?auto_41596 ) ) ( not ( = ?auto_41591 ?auto_41597 ) ) ( not ( = ?auto_41592 ?auto_41596 ) ) ( not ( = ?auto_41592 ?auto_41597 ) ) ( not ( = ?auto_41596 ?auto_41597 ) ) ( ON ?auto_41596 ?auto_41592 ) ( not ( = ?auto_41593 ?auto_41595 ) ) ( not ( = ?auto_41593 ?auto_41594 ) ) ( not ( = ?auto_41593 ?auto_41597 ) ) ( not ( = ?auto_41595 ?auto_41594 ) ) ( not ( = ?auto_41595 ?auto_41597 ) ) ( not ( = ?auto_41594 ?auto_41597 ) ) ( not ( = ?auto_41591 ?auto_41594 ) ) ( not ( = ?auto_41591 ?auto_41593 ) ) ( not ( = ?auto_41591 ?auto_41595 ) ) ( not ( = ?auto_41592 ?auto_41594 ) ) ( not ( = ?auto_41592 ?auto_41593 ) ) ( not ( = ?auto_41592 ?auto_41595 ) ) ( not ( = ?auto_41596 ?auto_41594 ) ) ( not ( = ?auto_41596 ?auto_41593 ) ) ( not ( = ?auto_41596 ?auto_41595 ) ) ( ON ?auto_41597 ?auto_41596 ) ( ON ?auto_41594 ?auto_41597 ) ( ON ?auto_41595 ?auto_41594 ) ( CLEAR ?auto_41595 ) ( HOLDING ?auto_41593 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41593 )
      ( MAKE-1PILE ?auto_41591 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41598 - BLOCK
    )
    :vars
    (
      ?auto_41601 - BLOCK
      ?auto_41599 - BLOCK
      ?auto_41600 - BLOCK
      ?auto_41603 - BLOCK
      ?auto_41604 - BLOCK
      ?auto_41602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41601 ?auto_41598 ) ( ON-TABLE ?auto_41598 ) ( not ( = ?auto_41598 ?auto_41601 ) ) ( not ( = ?auto_41598 ?auto_41599 ) ) ( not ( = ?auto_41598 ?auto_41600 ) ) ( not ( = ?auto_41601 ?auto_41599 ) ) ( not ( = ?auto_41601 ?auto_41600 ) ) ( not ( = ?auto_41599 ?auto_41600 ) ) ( ON ?auto_41599 ?auto_41601 ) ( not ( = ?auto_41603 ?auto_41604 ) ) ( not ( = ?auto_41603 ?auto_41602 ) ) ( not ( = ?auto_41603 ?auto_41600 ) ) ( not ( = ?auto_41604 ?auto_41602 ) ) ( not ( = ?auto_41604 ?auto_41600 ) ) ( not ( = ?auto_41602 ?auto_41600 ) ) ( not ( = ?auto_41598 ?auto_41602 ) ) ( not ( = ?auto_41598 ?auto_41603 ) ) ( not ( = ?auto_41598 ?auto_41604 ) ) ( not ( = ?auto_41601 ?auto_41602 ) ) ( not ( = ?auto_41601 ?auto_41603 ) ) ( not ( = ?auto_41601 ?auto_41604 ) ) ( not ( = ?auto_41599 ?auto_41602 ) ) ( not ( = ?auto_41599 ?auto_41603 ) ) ( not ( = ?auto_41599 ?auto_41604 ) ) ( ON ?auto_41600 ?auto_41599 ) ( ON ?auto_41602 ?auto_41600 ) ( ON ?auto_41604 ?auto_41602 ) ( ON ?auto_41603 ?auto_41604 ) ( CLEAR ?auto_41603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41598 ?auto_41601 ?auto_41599 ?auto_41600 ?auto_41602 ?auto_41604 )
      ( MAKE-1PILE ?auto_41598 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41611 - BLOCK
      ?auto_41612 - BLOCK
      ?auto_41613 - BLOCK
      ?auto_41614 - BLOCK
      ?auto_41615 - BLOCK
      ?auto_41616 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_41616 ) ( CLEAR ?auto_41615 ) ( ON-TABLE ?auto_41611 ) ( ON ?auto_41612 ?auto_41611 ) ( ON ?auto_41613 ?auto_41612 ) ( ON ?auto_41614 ?auto_41613 ) ( ON ?auto_41615 ?auto_41614 ) ( not ( = ?auto_41611 ?auto_41612 ) ) ( not ( = ?auto_41611 ?auto_41613 ) ) ( not ( = ?auto_41611 ?auto_41614 ) ) ( not ( = ?auto_41611 ?auto_41615 ) ) ( not ( = ?auto_41611 ?auto_41616 ) ) ( not ( = ?auto_41612 ?auto_41613 ) ) ( not ( = ?auto_41612 ?auto_41614 ) ) ( not ( = ?auto_41612 ?auto_41615 ) ) ( not ( = ?auto_41612 ?auto_41616 ) ) ( not ( = ?auto_41613 ?auto_41614 ) ) ( not ( = ?auto_41613 ?auto_41615 ) ) ( not ( = ?auto_41613 ?auto_41616 ) ) ( not ( = ?auto_41614 ?auto_41615 ) ) ( not ( = ?auto_41614 ?auto_41616 ) ) ( not ( = ?auto_41615 ?auto_41616 ) ) )
    :subtasks
    ( ( !STACK ?auto_41616 ?auto_41615 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41617 - BLOCK
      ?auto_41618 - BLOCK
      ?auto_41619 - BLOCK
      ?auto_41620 - BLOCK
      ?auto_41621 - BLOCK
      ?auto_41622 - BLOCK
    )
    :vars
    (
      ?auto_41623 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41621 ) ( ON-TABLE ?auto_41617 ) ( ON ?auto_41618 ?auto_41617 ) ( ON ?auto_41619 ?auto_41618 ) ( ON ?auto_41620 ?auto_41619 ) ( ON ?auto_41621 ?auto_41620 ) ( not ( = ?auto_41617 ?auto_41618 ) ) ( not ( = ?auto_41617 ?auto_41619 ) ) ( not ( = ?auto_41617 ?auto_41620 ) ) ( not ( = ?auto_41617 ?auto_41621 ) ) ( not ( = ?auto_41617 ?auto_41622 ) ) ( not ( = ?auto_41618 ?auto_41619 ) ) ( not ( = ?auto_41618 ?auto_41620 ) ) ( not ( = ?auto_41618 ?auto_41621 ) ) ( not ( = ?auto_41618 ?auto_41622 ) ) ( not ( = ?auto_41619 ?auto_41620 ) ) ( not ( = ?auto_41619 ?auto_41621 ) ) ( not ( = ?auto_41619 ?auto_41622 ) ) ( not ( = ?auto_41620 ?auto_41621 ) ) ( not ( = ?auto_41620 ?auto_41622 ) ) ( not ( = ?auto_41621 ?auto_41622 ) ) ( ON ?auto_41622 ?auto_41623 ) ( CLEAR ?auto_41622 ) ( HAND-EMPTY ) ( not ( = ?auto_41617 ?auto_41623 ) ) ( not ( = ?auto_41618 ?auto_41623 ) ) ( not ( = ?auto_41619 ?auto_41623 ) ) ( not ( = ?auto_41620 ?auto_41623 ) ) ( not ( = ?auto_41621 ?auto_41623 ) ) ( not ( = ?auto_41622 ?auto_41623 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41622 ?auto_41623 )
      ( MAKE-6PILE ?auto_41617 ?auto_41618 ?auto_41619 ?auto_41620 ?auto_41621 ?auto_41622 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41624 - BLOCK
      ?auto_41625 - BLOCK
      ?auto_41626 - BLOCK
      ?auto_41627 - BLOCK
      ?auto_41628 - BLOCK
      ?auto_41629 - BLOCK
    )
    :vars
    (
      ?auto_41630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41624 ) ( ON ?auto_41625 ?auto_41624 ) ( ON ?auto_41626 ?auto_41625 ) ( ON ?auto_41627 ?auto_41626 ) ( not ( = ?auto_41624 ?auto_41625 ) ) ( not ( = ?auto_41624 ?auto_41626 ) ) ( not ( = ?auto_41624 ?auto_41627 ) ) ( not ( = ?auto_41624 ?auto_41628 ) ) ( not ( = ?auto_41624 ?auto_41629 ) ) ( not ( = ?auto_41625 ?auto_41626 ) ) ( not ( = ?auto_41625 ?auto_41627 ) ) ( not ( = ?auto_41625 ?auto_41628 ) ) ( not ( = ?auto_41625 ?auto_41629 ) ) ( not ( = ?auto_41626 ?auto_41627 ) ) ( not ( = ?auto_41626 ?auto_41628 ) ) ( not ( = ?auto_41626 ?auto_41629 ) ) ( not ( = ?auto_41627 ?auto_41628 ) ) ( not ( = ?auto_41627 ?auto_41629 ) ) ( not ( = ?auto_41628 ?auto_41629 ) ) ( ON ?auto_41629 ?auto_41630 ) ( CLEAR ?auto_41629 ) ( not ( = ?auto_41624 ?auto_41630 ) ) ( not ( = ?auto_41625 ?auto_41630 ) ) ( not ( = ?auto_41626 ?auto_41630 ) ) ( not ( = ?auto_41627 ?auto_41630 ) ) ( not ( = ?auto_41628 ?auto_41630 ) ) ( not ( = ?auto_41629 ?auto_41630 ) ) ( HOLDING ?auto_41628 ) ( CLEAR ?auto_41627 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41624 ?auto_41625 ?auto_41626 ?auto_41627 ?auto_41628 )
      ( MAKE-6PILE ?auto_41624 ?auto_41625 ?auto_41626 ?auto_41627 ?auto_41628 ?auto_41629 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41631 - BLOCK
      ?auto_41632 - BLOCK
      ?auto_41633 - BLOCK
      ?auto_41634 - BLOCK
      ?auto_41635 - BLOCK
      ?auto_41636 - BLOCK
    )
    :vars
    (
      ?auto_41637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41631 ) ( ON ?auto_41632 ?auto_41631 ) ( ON ?auto_41633 ?auto_41632 ) ( ON ?auto_41634 ?auto_41633 ) ( not ( = ?auto_41631 ?auto_41632 ) ) ( not ( = ?auto_41631 ?auto_41633 ) ) ( not ( = ?auto_41631 ?auto_41634 ) ) ( not ( = ?auto_41631 ?auto_41635 ) ) ( not ( = ?auto_41631 ?auto_41636 ) ) ( not ( = ?auto_41632 ?auto_41633 ) ) ( not ( = ?auto_41632 ?auto_41634 ) ) ( not ( = ?auto_41632 ?auto_41635 ) ) ( not ( = ?auto_41632 ?auto_41636 ) ) ( not ( = ?auto_41633 ?auto_41634 ) ) ( not ( = ?auto_41633 ?auto_41635 ) ) ( not ( = ?auto_41633 ?auto_41636 ) ) ( not ( = ?auto_41634 ?auto_41635 ) ) ( not ( = ?auto_41634 ?auto_41636 ) ) ( not ( = ?auto_41635 ?auto_41636 ) ) ( ON ?auto_41636 ?auto_41637 ) ( not ( = ?auto_41631 ?auto_41637 ) ) ( not ( = ?auto_41632 ?auto_41637 ) ) ( not ( = ?auto_41633 ?auto_41637 ) ) ( not ( = ?auto_41634 ?auto_41637 ) ) ( not ( = ?auto_41635 ?auto_41637 ) ) ( not ( = ?auto_41636 ?auto_41637 ) ) ( CLEAR ?auto_41634 ) ( ON ?auto_41635 ?auto_41636 ) ( CLEAR ?auto_41635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41637 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41637 ?auto_41636 )
      ( MAKE-6PILE ?auto_41631 ?auto_41632 ?auto_41633 ?auto_41634 ?auto_41635 ?auto_41636 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41638 - BLOCK
      ?auto_41639 - BLOCK
      ?auto_41640 - BLOCK
      ?auto_41641 - BLOCK
      ?auto_41642 - BLOCK
      ?auto_41643 - BLOCK
    )
    :vars
    (
      ?auto_41644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41638 ) ( ON ?auto_41639 ?auto_41638 ) ( ON ?auto_41640 ?auto_41639 ) ( not ( = ?auto_41638 ?auto_41639 ) ) ( not ( = ?auto_41638 ?auto_41640 ) ) ( not ( = ?auto_41638 ?auto_41641 ) ) ( not ( = ?auto_41638 ?auto_41642 ) ) ( not ( = ?auto_41638 ?auto_41643 ) ) ( not ( = ?auto_41639 ?auto_41640 ) ) ( not ( = ?auto_41639 ?auto_41641 ) ) ( not ( = ?auto_41639 ?auto_41642 ) ) ( not ( = ?auto_41639 ?auto_41643 ) ) ( not ( = ?auto_41640 ?auto_41641 ) ) ( not ( = ?auto_41640 ?auto_41642 ) ) ( not ( = ?auto_41640 ?auto_41643 ) ) ( not ( = ?auto_41641 ?auto_41642 ) ) ( not ( = ?auto_41641 ?auto_41643 ) ) ( not ( = ?auto_41642 ?auto_41643 ) ) ( ON ?auto_41643 ?auto_41644 ) ( not ( = ?auto_41638 ?auto_41644 ) ) ( not ( = ?auto_41639 ?auto_41644 ) ) ( not ( = ?auto_41640 ?auto_41644 ) ) ( not ( = ?auto_41641 ?auto_41644 ) ) ( not ( = ?auto_41642 ?auto_41644 ) ) ( not ( = ?auto_41643 ?auto_41644 ) ) ( ON ?auto_41642 ?auto_41643 ) ( CLEAR ?auto_41642 ) ( ON-TABLE ?auto_41644 ) ( HOLDING ?auto_41641 ) ( CLEAR ?auto_41640 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41638 ?auto_41639 ?auto_41640 ?auto_41641 )
      ( MAKE-6PILE ?auto_41638 ?auto_41639 ?auto_41640 ?auto_41641 ?auto_41642 ?auto_41643 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41645 - BLOCK
      ?auto_41646 - BLOCK
      ?auto_41647 - BLOCK
      ?auto_41648 - BLOCK
      ?auto_41649 - BLOCK
      ?auto_41650 - BLOCK
    )
    :vars
    (
      ?auto_41651 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41645 ) ( ON ?auto_41646 ?auto_41645 ) ( ON ?auto_41647 ?auto_41646 ) ( not ( = ?auto_41645 ?auto_41646 ) ) ( not ( = ?auto_41645 ?auto_41647 ) ) ( not ( = ?auto_41645 ?auto_41648 ) ) ( not ( = ?auto_41645 ?auto_41649 ) ) ( not ( = ?auto_41645 ?auto_41650 ) ) ( not ( = ?auto_41646 ?auto_41647 ) ) ( not ( = ?auto_41646 ?auto_41648 ) ) ( not ( = ?auto_41646 ?auto_41649 ) ) ( not ( = ?auto_41646 ?auto_41650 ) ) ( not ( = ?auto_41647 ?auto_41648 ) ) ( not ( = ?auto_41647 ?auto_41649 ) ) ( not ( = ?auto_41647 ?auto_41650 ) ) ( not ( = ?auto_41648 ?auto_41649 ) ) ( not ( = ?auto_41648 ?auto_41650 ) ) ( not ( = ?auto_41649 ?auto_41650 ) ) ( ON ?auto_41650 ?auto_41651 ) ( not ( = ?auto_41645 ?auto_41651 ) ) ( not ( = ?auto_41646 ?auto_41651 ) ) ( not ( = ?auto_41647 ?auto_41651 ) ) ( not ( = ?auto_41648 ?auto_41651 ) ) ( not ( = ?auto_41649 ?auto_41651 ) ) ( not ( = ?auto_41650 ?auto_41651 ) ) ( ON ?auto_41649 ?auto_41650 ) ( ON-TABLE ?auto_41651 ) ( CLEAR ?auto_41647 ) ( ON ?auto_41648 ?auto_41649 ) ( CLEAR ?auto_41648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41651 ?auto_41650 ?auto_41649 )
      ( MAKE-6PILE ?auto_41645 ?auto_41646 ?auto_41647 ?auto_41648 ?auto_41649 ?auto_41650 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41652 - BLOCK
      ?auto_41653 - BLOCK
      ?auto_41654 - BLOCK
      ?auto_41655 - BLOCK
      ?auto_41656 - BLOCK
      ?auto_41657 - BLOCK
    )
    :vars
    (
      ?auto_41658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41652 ) ( ON ?auto_41653 ?auto_41652 ) ( not ( = ?auto_41652 ?auto_41653 ) ) ( not ( = ?auto_41652 ?auto_41654 ) ) ( not ( = ?auto_41652 ?auto_41655 ) ) ( not ( = ?auto_41652 ?auto_41656 ) ) ( not ( = ?auto_41652 ?auto_41657 ) ) ( not ( = ?auto_41653 ?auto_41654 ) ) ( not ( = ?auto_41653 ?auto_41655 ) ) ( not ( = ?auto_41653 ?auto_41656 ) ) ( not ( = ?auto_41653 ?auto_41657 ) ) ( not ( = ?auto_41654 ?auto_41655 ) ) ( not ( = ?auto_41654 ?auto_41656 ) ) ( not ( = ?auto_41654 ?auto_41657 ) ) ( not ( = ?auto_41655 ?auto_41656 ) ) ( not ( = ?auto_41655 ?auto_41657 ) ) ( not ( = ?auto_41656 ?auto_41657 ) ) ( ON ?auto_41657 ?auto_41658 ) ( not ( = ?auto_41652 ?auto_41658 ) ) ( not ( = ?auto_41653 ?auto_41658 ) ) ( not ( = ?auto_41654 ?auto_41658 ) ) ( not ( = ?auto_41655 ?auto_41658 ) ) ( not ( = ?auto_41656 ?auto_41658 ) ) ( not ( = ?auto_41657 ?auto_41658 ) ) ( ON ?auto_41656 ?auto_41657 ) ( ON-TABLE ?auto_41658 ) ( ON ?auto_41655 ?auto_41656 ) ( CLEAR ?auto_41655 ) ( HOLDING ?auto_41654 ) ( CLEAR ?auto_41653 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41652 ?auto_41653 ?auto_41654 )
      ( MAKE-6PILE ?auto_41652 ?auto_41653 ?auto_41654 ?auto_41655 ?auto_41656 ?auto_41657 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41659 - BLOCK
      ?auto_41660 - BLOCK
      ?auto_41661 - BLOCK
      ?auto_41662 - BLOCK
      ?auto_41663 - BLOCK
      ?auto_41664 - BLOCK
    )
    :vars
    (
      ?auto_41665 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41659 ) ( ON ?auto_41660 ?auto_41659 ) ( not ( = ?auto_41659 ?auto_41660 ) ) ( not ( = ?auto_41659 ?auto_41661 ) ) ( not ( = ?auto_41659 ?auto_41662 ) ) ( not ( = ?auto_41659 ?auto_41663 ) ) ( not ( = ?auto_41659 ?auto_41664 ) ) ( not ( = ?auto_41660 ?auto_41661 ) ) ( not ( = ?auto_41660 ?auto_41662 ) ) ( not ( = ?auto_41660 ?auto_41663 ) ) ( not ( = ?auto_41660 ?auto_41664 ) ) ( not ( = ?auto_41661 ?auto_41662 ) ) ( not ( = ?auto_41661 ?auto_41663 ) ) ( not ( = ?auto_41661 ?auto_41664 ) ) ( not ( = ?auto_41662 ?auto_41663 ) ) ( not ( = ?auto_41662 ?auto_41664 ) ) ( not ( = ?auto_41663 ?auto_41664 ) ) ( ON ?auto_41664 ?auto_41665 ) ( not ( = ?auto_41659 ?auto_41665 ) ) ( not ( = ?auto_41660 ?auto_41665 ) ) ( not ( = ?auto_41661 ?auto_41665 ) ) ( not ( = ?auto_41662 ?auto_41665 ) ) ( not ( = ?auto_41663 ?auto_41665 ) ) ( not ( = ?auto_41664 ?auto_41665 ) ) ( ON ?auto_41663 ?auto_41664 ) ( ON-TABLE ?auto_41665 ) ( ON ?auto_41662 ?auto_41663 ) ( CLEAR ?auto_41660 ) ( ON ?auto_41661 ?auto_41662 ) ( CLEAR ?auto_41661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41665 ?auto_41664 ?auto_41663 ?auto_41662 )
      ( MAKE-6PILE ?auto_41659 ?auto_41660 ?auto_41661 ?auto_41662 ?auto_41663 ?auto_41664 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41666 - BLOCK
      ?auto_41667 - BLOCK
      ?auto_41668 - BLOCK
      ?auto_41669 - BLOCK
      ?auto_41670 - BLOCK
      ?auto_41671 - BLOCK
    )
    :vars
    (
      ?auto_41672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41666 ) ( not ( = ?auto_41666 ?auto_41667 ) ) ( not ( = ?auto_41666 ?auto_41668 ) ) ( not ( = ?auto_41666 ?auto_41669 ) ) ( not ( = ?auto_41666 ?auto_41670 ) ) ( not ( = ?auto_41666 ?auto_41671 ) ) ( not ( = ?auto_41667 ?auto_41668 ) ) ( not ( = ?auto_41667 ?auto_41669 ) ) ( not ( = ?auto_41667 ?auto_41670 ) ) ( not ( = ?auto_41667 ?auto_41671 ) ) ( not ( = ?auto_41668 ?auto_41669 ) ) ( not ( = ?auto_41668 ?auto_41670 ) ) ( not ( = ?auto_41668 ?auto_41671 ) ) ( not ( = ?auto_41669 ?auto_41670 ) ) ( not ( = ?auto_41669 ?auto_41671 ) ) ( not ( = ?auto_41670 ?auto_41671 ) ) ( ON ?auto_41671 ?auto_41672 ) ( not ( = ?auto_41666 ?auto_41672 ) ) ( not ( = ?auto_41667 ?auto_41672 ) ) ( not ( = ?auto_41668 ?auto_41672 ) ) ( not ( = ?auto_41669 ?auto_41672 ) ) ( not ( = ?auto_41670 ?auto_41672 ) ) ( not ( = ?auto_41671 ?auto_41672 ) ) ( ON ?auto_41670 ?auto_41671 ) ( ON-TABLE ?auto_41672 ) ( ON ?auto_41669 ?auto_41670 ) ( ON ?auto_41668 ?auto_41669 ) ( CLEAR ?auto_41668 ) ( HOLDING ?auto_41667 ) ( CLEAR ?auto_41666 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41666 ?auto_41667 )
      ( MAKE-6PILE ?auto_41666 ?auto_41667 ?auto_41668 ?auto_41669 ?auto_41670 ?auto_41671 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41673 - BLOCK
      ?auto_41674 - BLOCK
      ?auto_41675 - BLOCK
      ?auto_41676 - BLOCK
      ?auto_41677 - BLOCK
      ?auto_41678 - BLOCK
    )
    :vars
    (
      ?auto_41679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41673 ) ( not ( = ?auto_41673 ?auto_41674 ) ) ( not ( = ?auto_41673 ?auto_41675 ) ) ( not ( = ?auto_41673 ?auto_41676 ) ) ( not ( = ?auto_41673 ?auto_41677 ) ) ( not ( = ?auto_41673 ?auto_41678 ) ) ( not ( = ?auto_41674 ?auto_41675 ) ) ( not ( = ?auto_41674 ?auto_41676 ) ) ( not ( = ?auto_41674 ?auto_41677 ) ) ( not ( = ?auto_41674 ?auto_41678 ) ) ( not ( = ?auto_41675 ?auto_41676 ) ) ( not ( = ?auto_41675 ?auto_41677 ) ) ( not ( = ?auto_41675 ?auto_41678 ) ) ( not ( = ?auto_41676 ?auto_41677 ) ) ( not ( = ?auto_41676 ?auto_41678 ) ) ( not ( = ?auto_41677 ?auto_41678 ) ) ( ON ?auto_41678 ?auto_41679 ) ( not ( = ?auto_41673 ?auto_41679 ) ) ( not ( = ?auto_41674 ?auto_41679 ) ) ( not ( = ?auto_41675 ?auto_41679 ) ) ( not ( = ?auto_41676 ?auto_41679 ) ) ( not ( = ?auto_41677 ?auto_41679 ) ) ( not ( = ?auto_41678 ?auto_41679 ) ) ( ON ?auto_41677 ?auto_41678 ) ( ON-TABLE ?auto_41679 ) ( ON ?auto_41676 ?auto_41677 ) ( ON ?auto_41675 ?auto_41676 ) ( CLEAR ?auto_41673 ) ( ON ?auto_41674 ?auto_41675 ) ( CLEAR ?auto_41674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41679 ?auto_41678 ?auto_41677 ?auto_41676 ?auto_41675 )
      ( MAKE-6PILE ?auto_41673 ?auto_41674 ?auto_41675 ?auto_41676 ?auto_41677 ?auto_41678 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41680 - BLOCK
      ?auto_41681 - BLOCK
      ?auto_41682 - BLOCK
      ?auto_41683 - BLOCK
      ?auto_41684 - BLOCK
      ?auto_41685 - BLOCK
    )
    :vars
    (
      ?auto_41686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41680 ?auto_41681 ) ) ( not ( = ?auto_41680 ?auto_41682 ) ) ( not ( = ?auto_41680 ?auto_41683 ) ) ( not ( = ?auto_41680 ?auto_41684 ) ) ( not ( = ?auto_41680 ?auto_41685 ) ) ( not ( = ?auto_41681 ?auto_41682 ) ) ( not ( = ?auto_41681 ?auto_41683 ) ) ( not ( = ?auto_41681 ?auto_41684 ) ) ( not ( = ?auto_41681 ?auto_41685 ) ) ( not ( = ?auto_41682 ?auto_41683 ) ) ( not ( = ?auto_41682 ?auto_41684 ) ) ( not ( = ?auto_41682 ?auto_41685 ) ) ( not ( = ?auto_41683 ?auto_41684 ) ) ( not ( = ?auto_41683 ?auto_41685 ) ) ( not ( = ?auto_41684 ?auto_41685 ) ) ( ON ?auto_41685 ?auto_41686 ) ( not ( = ?auto_41680 ?auto_41686 ) ) ( not ( = ?auto_41681 ?auto_41686 ) ) ( not ( = ?auto_41682 ?auto_41686 ) ) ( not ( = ?auto_41683 ?auto_41686 ) ) ( not ( = ?auto_41684 ?auto_41686 ) ) ( not ( = ?auto_41685 ?auto_41686 ) ) ( ON ?auto_41684 ?auto_41685 ) ( ON-TABLE ?auto_41686 ) ( ON ?auto_41683 ?auto_41684 ) ( ON ?auto_41682 ?auto_41683 ) ( ON ?auto_41681 ?auto_41682 ) ( CLEAR ?auto_41681 ) ( HOLDING ?auto_41680 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41680 )
      ( MAKE-6PILE ?auto_41680 ?auto_41681 ?auto_41682 ?auto_41683 ?auto_41684 ?auto_41685 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41687 - BLOCK
      ?auto_41688 - BLOCK
      ?auto_41689 - BLOCK
      ?auto_41690 - BLOCK
      ?auto_41691 - BLOCK
      ?auto_41692 - BLOCK
    )
    :vars
    (
      ?auto_41693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41687 ?auto_41688 ) ) ( not ( = ?auto_41687 ?auto_41689 ) ) ( not ( = ?auto_41687 ?auto_41690 ) ) ( not ( = ?auto_41687 ?auto_41691 ) ) ( not ( = ?auto_41687 ?auto_41692 ) ) ( not ( = ?auto_41688 ?auto_41689 ) ) ( not ( = ?auto_41688 ?auto_41690 ) ) ( not ( = ?auto_41688 ?auto_41691 ) ) ( not ( = ?auto_41688 ?auto_41692 ) ) ( not ( = ?auto_41689 ?auto_41690 ) ) ( not ( = ?auto_41689 ?auto_41691 ) ) ( not ( = ?auto_41689 ?auto_41692 ) ) ( not ( = ?auto_41690 ?auto_41691 ) ) ( not ( = ?auto_41690 ?auto_41692 ) ) ( not ( = ?auto_41691 ?auto_41692 ) ) ( ON ?auto_41692 ?auto_41693 ) ( not ( = ?auto_41687 ?auto_41693 ) ) ( not ( = ?auto_41688 ?auto_41693 ) ) ( not ( = ?auto_41689 ?auto_41693 ) ) ( not ( = ?auto_41690 ?auto_41693 ) ) ( not ( = ?auto_41691 ?auto_41693 ) ) ( not ( = ?auto_41692 ?auto_41693 ) ) ( ON ?auto_41691 ?auto_41692 ) ( ON-TABLE ?auto_41693 ) ( ON ?auto_41690 ?auto_41691 ) ( ON ?auto_41689 ?auto_41690 ) ( ON ?auto_41688 ?auto_41689 ) ( ON ?auto_41687 ?auto_41688 ) ( CLEAR ?auto_41687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41693 ?auto_41692 ?auto_41691 ?auto_41690 ?auto_41689 ?auto_41688 )
      ( MAKE-6PILE ?auto_41687 ?auto_41688 ?auto_41689 ?auto_41690 ?auto_41691 ?auto_41692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41699 - BLOCK
      ?auto_41700 - BLOCK
      ?auto_41701 - BLOCK
      ?auto_41702 - BLOCK
      ?auto_41703 - BLOCK
    )
    :vars
    (
      ?auto_41704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41704 ?auto_41703 ) ( CLEAR ?auto_41704 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41699 ) ( ON ?auto_41700 ?auto_41699 ) ( ON ?auto_41701 ?auto_41700 ) ( ON ?auto_41702 ?auto_41701 ) ( ON ?auto_41703 ?auto_41702 ) ( not ( = ?auto_41699 ?auto_41700 ) ) ( not ( = ?auto_41699 ?auto_41701 ) ) ( not ( = ?auto_41699 ?auto_41702 ) ) ( not ( = ?auto_41699 ?auto_41703 ) ) ( not ( = ?auto_41699 ?auto_41704 ) ) ( not ( = ?auto_41700 ?auto_41701 ) ) ( not ( = ?auto_41700 ?auto_41702 ) ) ( not ( = ?auto_41700 ?auto_41703 ) ) ( not ( = ?auto_41700 ?auto_41704 ) ) ( not ( = ?auto_41701 ?auto_41702 ) ) ( not ( = ?auto_41701 ?auto_41703 ) ) ( not ( = ?auto_41701 ?auto_41704 ) ) ( not ( = ?auto_41702 ?auto_41703 ) ) ( not ( = ?auto_41702 ?auto_41704 ) ) ( not ( = ?auto_41703 ?auto_41704 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41704 ?auto_41703 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41718 - BLOCK
      ?auto_41719 - BLOCK
      ?auto_41720 - BLOCK
      ?auto_41721 - BLOCK
      ?auto_41722 - BLOCK
    )
    :vars
    (
      ?auto_41723 - BLOCK
      ?auto_41724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41718 ) ( ON ?auto_41719 ?auto_41718 ) ( ON ?auto_41720 ?auto_41719 ) ( ON ?auto_41721 ?auto_41720 ) ( not ( = ?auto_41718 ?auto_41719 ) ) ( not ( = ?auto_41718 ?auto_41720 ) ) ( not ( = ?auto_41718 ?auto_41721 ) ) ( not ( = ?auto_41718 ?auto_41722 ) ) ( not ( = ?auto_41718 ?auto_41723 ) ) ( not ( = ?auto_41719 ?auto_41720 ) ) ( not ( = ?auto_41719 ?auto_41721 ) ) ( not ( = ?auto_41719 ?auto_41722 ) ) ( not ( = ?auto_41719 ?auto_41723 ) ) ( not ( = ?auto_41720 ?auto_41721 ) ) ( not ( = ?auto_41720 ?auto_41722 ) ) ( not ( = ?auto_41720 ?auto_41723 ) ) ( not ( = ?auto_41721 ?auto_41722 ) ) ( not ( = ?auto_41721 ?auto_41723 ) ) ( not ( = ?auto_41722 ?auto_41723 ) ) ( ON ?auto_41723 ?auto_41724 ) ( CLEAR ?auto_41723 ) ( not ( = ?auto_41718 ?auto_41724 ) ) ( not ( = ?auto_41719 ?auto_41724 ) ) ( not ( = ?auto_41720 ?auto_41724 ) ) ( not ( = ?auto_41721 ?auto_41724 ) ) ( not ( = ?auto_41722 ?auto_41724 ) ) ( not ( = ?auto_41723 ?auto_41724 ) ) ( HOLDING ?auto_41722 ) ( CLEAR ?auto_41721 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41718 ?auto_41719 ?auto_41720 ?auto_41721 ?auto_41722 ?auto_41723 )
      ( MAKE-5PILE ?auto_41718 ?auto_41719 ?auto_41720 ?auto_41721 ?auto_41722 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41725 - BLOCK
      ?auto_41726 - BLOCK
      ?auto_41727 - BLOCK
      ?auto_41728 - BLOCK
      ?auto_41729 - BLOCK
    )
    :vars
    (
      ?auto_41730 - BLOCK
      ?auto_41731 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41725 ) ( ON ?auto_41726 ?auto_41725 ) ( ON ?auto_41727 ?auto_41726 ) ( ON ?auto_41728 ?auto_41727 ) ( not ( = ?auto_41725 ?auto_41726 ) ) ( not ( = ?auto_41725 ?auto_41727 ) ) ( not ( = ?auto_41725 ?auto_41728 ) ) ( not ( = ?auto_41725 ?auto_41729 ) ) ( not ( = ?auto_41725 ?auto_41730 ) ) ( not ( = ?auto_41726 ?auto_41727 ) ) ( not ( = ?auto_41726 ?auto_41728 ) ) ( not ( = ?auto_41726 ?auto_41729 ) ) ( not ( = ?auto_41726 ?auto_41730 ) ) ( not ( = ?auto_41727 ?auto_41728 ) ) ( not ( = ?auto_41727 ?auto_41729 ) ) ( not ( = ?auto_41727 ?auto_41730 ) ) ( not ( = ?auto_41728 ?auto_41729 ) ) ( not ( = ?auto_41728 ?auto_41730 ) ) ( not ( = ?auto_41729 ?auto_41730 ) ) ( ON ?auto_41730 ?auto_41731 ) ( not ( = ?auto_41725 ?auto_41731 ) ) ( not ( = ?auto_41726 ?auto_41731 ) ) ( not ( = ?auto_41727 ?auto_41731 ) ) ( not ( = ?auto_41728 ?auto_41731 ) ) ( not ( = ?auto_41729 ?auto_41731 ) ) ( not ( = ?auto_41730 ?auto_41731 ) ) ( CLEAR ?auto_41728 ) ( ON ?auto_41729 ?auto_41730 ) ( CLEAR ?auto_41729 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41731 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41731 ?auto_41730 )
      ( MAKE-5PILE ?auto_41725 ?auto_41726 ?auto_41727 ?auto_41728 ?auto_41729 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41732 - BLOCK
      ?auto_41733 - BLOCK
      ?auto_41734 - BLOCK
      ?auto_41735 - BLOCK
      ?auto_41736 - BLOCK
    )
    :vars
    (
      ?auto_41738 - BLOCK
      ?auto_41737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41732 ) ( ON ?auto_41733 ?auto_41732 ) ( ON ?auto_41734 ?auto_41733 ) ( not ( = ?auto_41732 ?auto_41733 ) ) ( not ( = ?auto_41732 ?auto_41734 ) ) ( not ( = ?auto_41732 ?auto_41735 ) ) ( not ( = ?auto_41732 ?auto_41736 ) ) ( not ( = ?auto_41732 ?auto_41738 ) ) ( not ( = ?auto_41733 ?auto_41734 ) ) ( not ( = ?auto_41733 ?auto_41735 ) ) ( not ( = ?auto_41733 ?auto_41736 ) ) ( not ( = ?auto_41733 ?auto_41738 ) ) ( not ( = ?auto_41734 ?auto_41735 ) ) ( not ( = ?auto_41734 ?auto_41736 ) ) ( not ( = ?auto_41734 ?auto_41738 ) ) ( not ( = ?auto_41735 ?auto_41736 ) ) ( not ( = ?auto_41735 ?auto_41738 ) ) ( not ( = ?auto_41736 ?auto_41738 ) ) ( ON ?auto_41738 ?auto_41737 ) ( not ( = ?auto_41732 ?auto_41737 ) ) ( not ( = ?auto_41733 ?auto_41737 ) ) ( not ( = ?auto_41734 ?auto_41737 ) ) ( not ( = ?auto_41735 ?auto_41737 ) ) ( not ( = ?auto_41736 ?auto_41737 ) ) ( not ( = ?auto_41738 ?auto_41737 ) ) ( ON ?auto_41736 ?auto_41738 ) ( CLEAR ?auto_41736 ) ( ON-TABLE ?auto_41737 ) ( HOLDING ?auto_41735 ) ( CLEAR ?auto_41734 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41732 ?auto_41733 ?auto_41734 ?auto_41735 )
      ( MAKE-5PILE ?auto_41732 ?auto_41733 ?auto_41734 ?auto_41735 ?auto_41736 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41739 - BLOCK
      ?auto_41740 - BLOCK
      ?auto_41741 - BLOCK
      ?auto_41742 - BLOCK
      ?auto_41743 - BLOCK
    )
    :vars
    (
      ?auto_41745 - BLOCK
      ?auto_41744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41739 ) ( ON ?auto_41740 ?auto_41739 ) ( ON ?auto_41741 ?auto_41740 ) ( not ( = ?auto_41739 ?auto_41740 ) ) ( not ( = ?auto_41739 ?auto_41741 ) ) ( not ( = ?auto_41739 ?auto_41742 ) ) ( not ( = ?auto_41739 ?auto_41743 ) ) ( not ( = ?auto_41739 ?auto_41745 ) ) ( not ( = ?auto_41740 ?auto_41741 ) ) ( not ( = ?auto_41740 ?auto_41742 ) ) ( not ( = ?auto_41740 ?auto_41743 ) ) ( not ( = ?auto_41740 ?auto_41745 ) ) ( not ( = ?auto_41741 ?auto_41742 ) ) ( not ( = ?auto_41741 ?auto_41743 ) ) ( not ( = ?auto_41741 ?auto_41745 ) ) ( not ( = ?auto_41742 ?auto_41743 ) ) ( not ( = ?auto_41742 ?auto_41745 ) ) ( not ( = ?auto_41743 ?auto_41745 ) ) ( ON ?auto_41745 ?auto_41744 ) ( not ( = ?auto_41739 ?auto_41744 ) ) ( not ( = ?auto_41740 ?auto_41744 ) ) ( not ( = ?auto_41741 ?auto_41744 ) ) ( not ( = ?auto_41742 ?auto_41744 ) ) ( not ( = ?auto_41743 ?auto_41744 ) ) ( not ( = ?auto_41745 ?auto_41744 ) ) ( ON ?auto_41743 ?auto_41745 ) ( ON-TABLE ?auto_41744 ) ( CLEAR ?auto_41741 ) ( ON ?auto_41742 ?auto_41743 ) ( CLEAR ?auto_41742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41744 ?auto_41745 ?auto_41743 )
      ( MAKE-5PILE ?auto_41739 ?auto_41740 ?auto_41741 ?auto_41742 ?auto_41743 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41746 - BLOCK
      ?auto_41747 - BLOCK
      ?auto_41748 - BLOCK
      ?auto_41749 - BLOCK
      ?auto_41750 - BLOCK
    )
    :vars
    (
      ?auto_41751 - BLOCK
      ?auto_41752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41746 ) ( ON ?auto_41747 ?auto_41746 ) ( not ( = ?auto_41746 ?auto_41747 ) ) ( not ( = ?auto_41746 ?auto_41748 ) ) ( not ( = ?auto_41746 ?auto_41749 ) ) ( not ( = ?auto_41746 ?auto_41750 ) ) ( not ( = ?auto_41746 ?auto_41751 ) ) ( not ( = ?auto_41747 ?auto_41748 ) ) ( not ( = ?auto_41747 ?auto_41749 ) ) ( not ( = ?auto_41747 ?auto_41750 ) ) ( not ( = ?auto_41747 ?auto_41751 ) ) ( not ( = ?auto_41748 ?auto_41749 ) ) ( not ( = ?auto_41748 ?auto_41750 ) ) ( not ( = ?auto_41748 ?auto_41751 ) ) ( not ( = ?auto_41749 ?auto_41750 ) ) ( not ( = ?auto_41749 ?auto_41751 ) ) ( not ( = ?auto_41750 ?auto_41751 ) ) ( ON ?auto_41751 ?auto_41752 ) ( not ( = ?auto_41746 ?auto_41752 ) ) ( not ( = ?auto_41747 ?auto_41752 ) ) ( not ( = ?auto_41748 ?auto_41752 ) ) ( not ( = ?auto_41749 ?auto_41752 ) ) ( not ( = ?auto_41750 ?auto_41752 ) ) ( not ( = ?auto_41751 ?auto_41752 ) ) ( ON ?auto_41750 ?auto_41751 ) ( ON-TABLE ?auto_41752 ) ( ON ?auto_41749 ?auto_41750 ) ( CLEAR ?auto_41749 ) ( HOLDING ?auto_41748 ) ( CLEAR ?auto_41747 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41746 ?auto_41747 ?auto_41748 )
      ( MAKE-5PILE ?auto_41746 ?auto_41747 ?auto_41748 ?auto_41749 ?auto_41750 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41753 - BLOCK
      ?auto_41754 - BLOCK
      ?auto_41755 - BLOCK
      ?auto_41756 - BLOCK
      ?auto_41757 - BLOCK
    )
    :vars
    (
      ?auto_41758 - BLOCK
      ?auto_41759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41753 ) ( ON ?auto_41754 ?auto_41753 ) ( not ( = ?auto_41753 ?auto_41754 ) ) ( not ( = ?auto_41753 ?auto_41755 ) ) ( not ( = ?auto_41753 ?auto_41756 ) ) ( not ( = ?auto_41753 ?auto_41757 ) ) ( not ( = ?auto_41753 ?auto_41758 ) ) ( not ( = ?auto_41754 ?auto_41755 ) ) ( not ( = ?auto_41754 ?auto_41756 ) ) ( not ( = ?auto_41754 ?auto_41757 ) ) ( not ( = ?auto_41754 ?auto_41758 ) ) ( not ( = ?auto_41755 ?auto_41756 ) ) ( not ( = ?auto_41755 ?auto_41757 ) ) ( not ( = ?auto_41755 ?auto_41758 ) ) ( not ( = ?auto_41756 ?auto_41757 ) ) ( not ( = ?auto_41756 ?auto_41758 ) ) ( not ( = ?auto_41757 ?auto_41758 ) ) ( ON ?auto_41758 ?auto_41759 ) ( not ( = ?auto_41753 ?auto_41759 ) ) ( not ( = ?auto_41754 ?auto_41759 ) ) ( not ( = ?auto_41755 ?auto_41759 ) ) ( not ( = ?auto_41756 ?auto_41759 ) ) ( not ( = ?auto_41757 ?auto_41759 ) ) ( not ( = ?auto_41758 ?auto_41759 ) ) ( ON ?auto_41757 ?auto_41758 ) ( ON-TABLE ?auto_41759 ) ( ON ?auto_41756 ?auto_41757 ) ( CLEAR ?auto_41754 ) ( ON ?auto_41755 ?auto_41756 ) ( CLEAR ?auto_41755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41759 ?auto_41758 ?auto_41757 ?auto_41756 )
      ( MAKE-5PILE ?auto_41753 ?auto_41754 ?auto_41755 ?auto_41756 ?auto_41757 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41760 - BLOCK
      ?auto_41761 - BLOCK
      ?auto_41762 - BLOCK
      ?auto_41763 - BLOCK
      ?auto_41764 - BLOCK
    )
    :vars
    (
      ?auto_41765 - BLOCK
      ?auto_41766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41760 ) ( not ( = ?auto_41760 ?auto_41761 ) ) ( not ( = ?auto_41760 ?auto_41762 ) ) ( not ( = ?auto_41760 ?auto_41763 ) ) ( not ( = ?auto_41760 ?auto_41764 ) ) ( not ( = ?auto_41760 ?auto_41765 ) ) ( not ( = ?auto_41761 ?auto_41762 ) ) ( not ( = ?auto_41761 ?auto_41763 ) ) ( not ( = ?auto_41761 ?auto_41764 ) ) ( not ( = ?auto_41761 ?auto_41765 ) ) ( not ( = ?auto_41762 ?auto_41763 ) ) ( not ( = ?auto_41762 ?auto_41764 ) ) ( not ( = ?auto_41762 ?auto_41765 ) ) ( not ( = ?auto_41763 ?auto_41764 ) ) ( not ( = ?auto_41763 ?auto_41765 ) ) ( not ( = ?auto_41764 ?auto_41765 ) ) ( ON ?auto_41765 ?auto_41766 ) ( not ( = ?auto_41760 ?auto_41766 ) ) ( not ( = ?auto_41761 ?auto_41766 ) ) ( not ( = ?auto_41762 ?auto_41766 ) ) ( not ( = ?auto_41763 ?auto_41766 ) ) ( not ( = ?auto_41764 ?auto_41766 ) ) ( not ( = ?auto_41765 ?auto_41766 ) ) ( ON ?auto_41764 ?auto_41765 ) ( ON-TABLE ?auto_41766 ) ( ON ?auto_41763 ?auto_41764 ) ( ON ?auto_41762 ?auto_41763 ) ( CLEAR ?auto_41762 ) ( HOLDING ?auto_41761 ) ( CLEAR ?auto_41760 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41760 ?auto_41761 )
      ( MAKE-5PILE ?auto_41760 ?auto_41761 ?auto_41762 ?auto_41763 ?auto_41764 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41767 - BLOCK
      ?auto_41768 - BLOCK
      ?auto_41769 - BLOCK
      ?auto_41770 - BLOCK
      ?auto_41771 - BLOCK
    )
    :vars
    (
      ?auto_41772 - BLOCK
      ?auto_41773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41767 ) ( not ( = ?auto_41767 ?auto_41768 ) ) ( not ( = ?auto_41767 ?auto_41769 ) ) ( not ( = ?auto_41767 ?auto_41770 ) ) ( not ( = ?auto_41767 ?auto_41771 ) ) ( not ( = ?auto_41767 ?auto_41772 ) ) ( not ( = ?auto_41768 ?auto_41769 ) ) ( not ( = ?auto_41768 ?auto_41770 ) ) ( not ( = ?auto_41768 ?auto_41771 ) ) ( not ( = ?auto_41768 ?auto_41772 ) ) ( not ( = ?auto_41769 ?auto_41770 ) ) ( not ( = ?auto_41769 ?auto_41771 ) ) ( not ( = ?auto_41769 ?auto_41772 ) ) ( not ( = ?auto_41770 ?auto_41771 ) ) ( not ( = ?auto_41770 ?auto_41772 ) ) ( not ( = ?auto_41771 ?auto_41772 ) ) ( ON ?auto_41772 ?auto_41773 ) ( not ( = ?auto_41767 ?auto_41773 ) ) ( not ( = ?auto_41768 ?auto_41773 ) ) ( not ( = ?auto_41769 ?auto_41773 ) ) ( not ( = ?auto_41770 ?auto_41773 ) ) ( not ( = ?auto_41771 ?auto_41773 ) ) ( not ( = ?auto_41772 ?auto_41773 ) ) ( ON ?auto_41771 ?auto_41772 ) ( ON-TABLE ?auto_41773 ) ( ON ?auto_41770 ?auto_41771 ) ( ON ?auto_41769 ?auto_41770 ) ( CLEAR ?auto_41767 ) ( ON ?auto_41768 ?auto_41769 ) ( CLEAR ?auto_41768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41773 ?auto_41772 ?auto_41771 ?auto_41770 ?auto_41769 )
      ( MAKE-5PILE ?auto_41767 ?auto_41768 ?auto_41769 ?auto_41770 ?auto_41771 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41774 - BLOCK
      ?auto_41775 - BLOCK
      ?auto_41776 - BLOCK
      ?auto_41777 - BLOCK
      ?auto_41778 - BLOCK
    )
    :vars
    (
      ?auto_41779 - BLOCK
      ?auto_41780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41774 ?auto_41775 ) ) ( not ( = ?auto_41774 ?auto_41776 ) ) ( not ( = ?auto_41774 ?auto_41777 ) ) ( not ( = ?auto_41774 ?auto_41778 ) ) ( not ( = ?auto_41774 ?auto_41779 ) ) ( not ( = ?auto_41775 ?auto_41776 ) ) ( not ( = ?auto_41775 ?auto_41777 ) ) ( not ( = ?auto_41775 ?auto_41778 ) ) ( not ( = ?auto_41775 ?auto_41779 ) ) ( not ( = ?auto_41776 ?auto_41777 ) ) ( not ( = ?auto_41776 ?auto_41778 ) ) ( not ( = ?auto_41776 ?auto_41779 ) ) ( not ( = ?auto_41777 ?auto_41778 ) ) ( not ( = ?auto_41777 ?auto_41779 ) ) ( not ( = ?auto_41778 ?auto_41779 ) ) ( ON ?auto_41779 ?auto_41780 ) ( not ( = ?auto_41774 ?auto_41780 ) ) ( not ( = ?auto_41775 ?auto_41780 ) ) ( not ( = ?auto_41776 ?auto_41780 ) ) ( not ( = ?auto_41777 ?auto_41780 ) ) ( not ( = ?auto_41778 ?auto_41780 ) ) ( not ( = ?auto_41779 ?auto_41780 ) ) ( ON ?auto_41778 ?auto_41779 ) ( ON-TABLE ?auto_41780 ) ( ON ?auto_41777 ?auto_41778 ) ( ON ?auto_41776 ?auto_41777 ) ( ON ?auto_41775 ?auto_41776 ) ( CLEAR ?auto_41775 ) ( HOLDING ?auto_41774 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41774 )
      ( MAKE-5PILE ?auto_41774 ?auto_41775 ?auto_41776 ?auto_41777 ?auto_41778 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41781 - BLOCK
      ?auto_41782 - BLOCK
      ?auto_41783 - BLOCK
      ?auto_41784 - BLOCK
      ?auto_41785 - BLOCK
    )
    :vars
    (
      ?auto_41787 - BLOCK
      ?auto_41786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41781 ?auto_41782 ) ) ( not ( = ?auto_41781 ?auto_41783 ) ) ( not ( = ?auto_41781 ?auto_41784 ) ) ( not ( = ?auto_41781 ?auto_41785 ) ) ( not ( = ?auto_41781 ?auto_41787 ) ) ( not ( = ?auto_41782 ?auto_41783 ) ) ( not ( = ?auto_41782 ?auto_41784 ) ) ( not ( = ?auto_41782 ?auto_41785 ) ) ( not ( = ?auto_41782 ?auto_41787 ) ) ( not ( = ?auto_41783 ?auto_41784 ) ) ( not ( = ?auto_41783 ?auto_41785 ) ) ( not ( = ?auto_41783 ?auto_41787 ) ) ( not ( = ?auto_41784 ?auto_41785 ) ) ( not ( = ?auto_41784 ?auto_41787 ) ) ( not ( = ?auto_41785 ?auto_41787 ) ) ( ON ?auto_41787 ?auto_41786 ) ( not ( = ?auto_41781 ?auto_41786 ) ) ( not ( = ?auto_41782 ?auto_41786 ) ) ( not ( = ?auto_41783 ?auto_41786 ) ) ( not ( = ?auto_41784 ?auto_41786 ) ) ( not ( = ?auto_41785 ?auto_41786 ) ) ( not ( = ?auto_41787 ?auto_41786 ) ) ( ON ?auto_41785 ?auto_41787 ) ( ON-TABLE ?auto_41786 ) ( ON ?auto_41784 ?auto_41785 ) ( ON ?auto_41783 ?auto_41784 ) ( ON ?auto_41782 ?auto_41783 ) ( ON ?auto_41781 ?auto_41782 ) ( CLEAR ?auto_41781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41786 ?auto_41787 ?auto_41785 ?auto_41784 ?auto_41783 ?auto_41782 )
      ( MAKE-5PILE ?auto_41781 ?auto_41782 ?auto_41783 ?auto_41784 ?auto_41785 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41789 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_41789 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_41789 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41790 - BLOCK
    )
    :vars
    (
      ?auto_41791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41790 ?auto_41791 ) ( CLEAR ?auto_41790 ) ( HAND-EMPTY ) ( not ( = ?auto_41790 ?auto_41791 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41790 ?auto_41791 )
      ( MAKE-1PILE ?auto_41790 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41792 - BLOCK
    )
    :vars
    (
      ?auto_41793 - BLOCK
      ?auto_41797 - BLOCK
      ?auto_41794 - BLOCK
      ?auto_41796 - BLOCK
      ?auto_41795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41792 ?auto_41793 ) ) ( HOLDING ?auto_41792 ) ( CLEAR ?auto_41793 ) ( ON-TABLE ?auto_41797 ) ( ON ?auto_41794 ?auto_41797 ) ( ON ?auto_41796 ?auto_41794 ) ( ON ?auto_41795 ?auto_41796 ) ( ON ?auto_41793 ?auto_41795 ) ( not ( = ?auto_41797 ?auto_41794 ) ) ( not ( = ?auto_41797 ?auto_41796 ) ) ( not ( = ?auto_41797 ?auto_41795 ) ) ( not ( = ?auto_41797 ?auto_41793 ) ) ( not ( = ?auto_41797 ?auto_41792 ) ) ( not ( = ?auto_41794 ?auto_41796 ) ) ( not ( = ?auto_41794 ?auto_41795 ) ) ( not ( = ?auto_41794 ?auto_41793 ) ) ( not ( = ?auto_41794 ?auto_41792 ) ) ( not ( = ?auto_41796 ?auto_41795 ) ) ( not ( = ?auto_41796 ?auto_41793 ) ) ( not ( = ?auto_41796 ?auto_41792 ) ) ( not ( = ?auto_41795 ?auto_41793 ) ) ( not ( = ?auto_41795 ?auto_41792 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41797 ?auto_41794 ?auto_41796 ?auto_41795 ?auto_41793 ?auto_41792 )
      ( MAKE-1PILE ?auto_41792 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41798 - BLOCK
    )
    :vars
    (
      ?auto_41799 - BLOCK
      ?auto_41800 - BLOCK
      ?auto_41803 - BLOCK
      ?auto_41801 - BLOCK
      ?auto_41802 - BLOCK
      ?auto_41804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41798 ?auto_41799 ) ) ( CLEAR ?auto_41799 ) ( ON-TABLE ?auto_41800 ) ( ON ?auto_41803 ?auto_41800 ) ( ON ?auto_41801 ?auto_41803 ) ( ON ?auto_41802 ?auto_41801 ) ( ON ?auto_41799 ?auto_41802 ) ( not ( = ?auto_41800 ?auto_41803 ) ) ( not ( = ?auto_41800 ?auto_41801 ) ) ( not ( = ?auto_41800 ?auto_41802 ) ) ( not ( = ?auto_41800 ?auto_41799 ) ) ( not ( = ?auto_41800 ?auto_41798 ) ) ( not ( = ?auto_41803 ?auto_41801 ) ) ( not ( = ?auto_41803 ?auto_41802 ) ) ( not ( = ?auto_41803 ?auto_41799 ) ) ( not ( = ?auto_41803 ?auto_41798 ) ) ( not ( = ?auto_41801 ?auto_41802 ) ) ( not ( = ?auto_41801 ?auto_41799 ) ) ( not ( = ?auto_41801 ?auto_41798 ) ) ( not ( = ?auto_41802 ?auto_41799 ) ) ( not ( = ?auto_41802 ?auto_41798 ) ) ( ON ?auto_41798 ?auto_41804 ) ( CLEAR ?auto_41798 ) ( HAND-EMPTY ) ( not ( = ?auto_41798 ?auto_41804 ) ) ( not ( = ?auto_41799 ?auto_41804 ) ) ( not ( = ?auto_41800 ?auto_41804 ) ) ( not ( = ?auto_41803 ?auto_41804 ) ) ( not ( = ?auto_41801 ?auto_41804 ) ) ( not ( = ?auto_41802 ?auto_41804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41798 ?auto_41804 )
      ( MAKE-1PILE ?auto_41798 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41805 - BLOCK
    )
    :vars
    (
      ?auto_41810 - BLOCK
      ?auto_41809 - BLOCK
      ?auto_41811 - BLOCK
      ?auto_41807 - BLOCK
      ?auto_41808 - BLOCK
      ?auto_41806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41805 ?auto_41810 ) ) ( ON-TABLE ?auto_41809 ) ( ON ?auto_41811 ?auto_41809 ) ( ON ?auto_41807 ?auto_41811 ) ( ON ?auto_41808 ?auto_41807 ) ( not ( = ?auto_41809 ?auto_41811 ) ) ( not ( = ?auto_41809 ?auto_41807 ) ) ( not ( = ?auto_41809 ?auto_41808 ) ) ( not ( = ?auto_41809 ?auto_41810 ) ) ( not ( = ?auto_41809 ?auto_41805 ) ) ( not ( = ?auto_41811 ?auto_41807 ) ) ( not ( = ?auto_41811 ?auto_41808 ) ) ( not ( = ?auto_41811 ?auto_41810 ) ) ( not ( = ?auto_41811 ?auto_41805 ) ) ( not ( = ?auto_41807 ?auto_41808 ) ) ( not ( = ?auto_41807 ?auto_41810 ) ) ( not ( = ?auto_41807 ?auto_41805 ) ) ( not ( = ?auto_41808 ?auto_41810 ) ) ( not ( = ?auto_41808 ?auto_41805 ) ) ( ON ?auto_41805 ?auto_41806 ) ( CLEAR ?auto_41805 ) ( not ( = ?auto_41805 ?auto_41806 ) ) ( not ( = ?auto_41810 ?auto_41806 ) ) ( not ( = ?auto_41809 ?auto_41806 ) ) ( not ( = ?auto_41811 ?auto_41806 ) ) ( not ( = ?auto_41807 ?auto_41806 ) ) ( not ( = ?auto_41808 ?auto_41806 ) ) ( HOLDING ?auto_41810 ) ( CLEAR ?auto_41808 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41809 ?auto_41811 ?auto_41807 ?auto_41808 ?auto_41810 )
      ( MAKE-1PILE ?auto_41805 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41812 - BLOCK
    )
    :vars
    (
      ?auto_41818 - BLOCK
      ?auto_41817 - BLOCK
      ?auto_41813 - BLOCK
      ?auto_41814 - BLOCK
      ?auto_41815 - BLOCK
      ?auto_41816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41812 ?auto_41818 ) ) ( ON-TABLE ?auto_41817 ) ( ON ?auto_41813 ?auto_41817 ) ( ON ?auto_41814 ?auto_41813 ) ( ON ?auto_41815 ?auto_41814 ) ( not ( = ?auto_41817 ?auto_41813 ) ) ( not ( = ?auto_41817 ?auto_41814 ) ) ( not ( = ?auto_41817 ?auto_41815 ) ) ( not ( = ?auto_41817 ?auto_41818 ) ) ( not ( = ?auto_41817 ?auto_41812 ) ) ( not ( = ?auto_41813 ?auto_41814 ) ) ( not ( = ?auto_41813 ?auto_41815 ) ) ( not ( = ?auto_41813 ?auto_41818 ) ) ( not ( = ?auto_41813 ?auto_41812 ) ) ( not ( = ?auto_41814 ?auto_41815 ) ) ( not ( = ?auto_41814 ?auto_41818 ) ) ( not ( = ?auto_41814 ?auto_41812 ) ) ( not ( = ?auto_41815 ?auto_41818 ) ) ( not ( = ?auto_41815 ?auto_41812 ) ) ( ON ?auto_41812 ?auto_41816 ) ( not ( = ?auto_41812 ?auto_41816 ) ) ( not ( = ?auto_41818 ?auto_41816 ) ) ( not ( = ?auto_41817 ?auto_41816 ) ) ( not ( = ?auto_41813 ?auto_41816 ) ) ( not ( = ?auto_41814 ?auto_41816 ) ) ( not ( = ?auto_41815 ?auto_41816 ) ) ( CLEAR ?auto_41815 ) ( ON ?auto_41818 ?auto_41812 ) ( CLEAR ?auto_41818 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41816 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41816 ?auto_41812 )
      ( MAKE-1PILE ?auto_41812 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41819 - BLOCK
    )
    :vars
    (
      ?auto_41821 - BLOCK
      ?auto_41824 - BLOCK
      ?auto_41823 - BLOCK
      ?auto_41820 - BLOCK
      ?auto_41825 - BLOCK
      ?auto_41822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41819 ?auto_41821 ) ) ( ON-TABLE ?auto_41824 ) ( ON ?auto_41823 ?auto_41824 ) ( ON ?auto_41820 ?auto_41823 ) ( not ( = ?auto_41824 ?auto_41823 ) ) ( not ( = ?auto_41824 ?auto_41820 ) ) ( not ( = ?auto_41824 ?auto_41825 ) ) ( not ( = ?auto_41824 ?auto_41821 ) ) ( not ( = ?auto_41824 ?auto_41819 ) ) ( not ( = ?auto_41823 ?auto_41820 ) ) ( not ( = ?auto_41823 ?auto_41825 ) ) ( not ( = ?auto_41823 ?auto_41821 ) ) ( not ( = ?auto_41823 ?auto_41819 ) ) ( not ( = ?auto_41820 ?auto_41825 ) ) ( not ( = ?auto_41820 ?auto_41821 ) ) ( not ( = ?auto_41820 ?auto_41819 ) ) ( not ( = ?auto_41825 ?auto_41821 ) ) ( not ( = ?auto_41825 ?auto_41819 ) ) ( ON ?auto_41819 ?auto_41822 ) ( not ( = ?auto_41819 ?auto_41822 ) ) ( not ( = ?auto_41821 ?auto_41822 ) ) ( not ( = ?auto_41824 ?auto_41822 ) ) ( not ( = ?auto_41823 ?auto_41822 ) ) ( not ( = ?auto_41820 ?auto_41822 ) ) ( not ( = ?auto_41825 ?auto_41822 ) ) ( ON ?auto_41821 ?auto_41819 ) ( CLEAR ?auto_41821 ) ( ON-TABLE ?auto_41822 ) ( HOLDING ?auto_41825 ) ( CLEAR ?auto_41820 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41824 ?auto_41823 ?auto_41820 ?auto_41825 )
      ( MAKE-1PILE ?auto_41819 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41826 - BLOCK
    )
    :vars
    (
      ?auto_41831 - BLOCK
      ?auto_41832 - BLOCK
      ?auto_41829 - BLOCK
      ?auto_41830 - BLOCK
      ?auto_41828 - BLOCK
      ?auto_41827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41826 ?auto_41831 ) ) ( ON-TABLE ?auto_41832 ) ( ON ?auto_41829 ?auto_41832 ) ( ON ?auto_41830 ?auto_41829 ) ( not ( = ?auto_41832 ?auto_41829 ) ) ( not ( = ?auto_41832 ?auto_41830 ) ) ( not ( = ?auto_41832 ?auto_41828 ) ) ( not ( = ?auto_41832 ?auto_41831 ) ) ( not ( = ?auto_41832 ?auto_41826 ) ) ( not ( = ?auto_41829 ?auto_41830 ) ) ( not ( = ?auto_41829 ?auto_41828 ) ) ( not ( = ?auto_41829 ?auto_41831 ) ) ( not ( = ?auto_41829 ?auto_41826 ) ) ( not ( = ?auto_41830 ?auto_41828 ) ) ( not ( = ?auto_41830 ?auto_41831 ) ) ( not ( = ?auto_41830 ?auto_41826 ) ) ( not ( = ?auto_41828 ?auto_41831 ) ) ( not ( = ?auto_41828 ?auto_41826 ) ) ( ON ?auto_41826 ?auto_41827 ) ( not ( = ?auto_41826 ?auto_41827 ) ) ( not ( = ?auto_41831 ?auto_41827 ) ) ( not ( = ?auto_41832 ?auto_41827 ) ) ( not ( = ?auto_41829 ?auto_41827 ) ) ( not ( = ?auto_41830 ?auto_41827 ) ) ( not ( = ?auto_41828 ?auto_41827 ) ) ( ON ?auto_41831 ?auto_41826 ) ( ON-TABLE ?auto_41827 ) ( CLEAR ?auto_41830 ) ( ON ?auto_41828 ?auto_41831 ) ( CLEAR ?auto_41828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41827 ?auto_41826 ?auto_41831 )
      ( MAKE-1PILE ?auto_41826 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41833 - BLOCK
    )
    :vars
    (
      ?auto_41837 - BLOCK
      ?auto_41838 - BLOCK
      ?auto_41836 - BLOCK
      ?auto_41834 - BLOCK
      ?auto_41835 - BLOCK
      ?auto_41839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41833 ?auto_41837 ) ) ( ON-TABLE ?auto_41838 ) ( ON ?auto_41836 ?auto_41838 ) ( not ( = ?auto_41838 ?auto_41836 ) ) ( not ( = ?auto_41838 ?auto_41834 ) ) ( not ( = ?auto_41838 ?auto_41835 ) ) ( not ( = ?auto_41838 ?auto_41837 ) ) ( not ( = ?auto_41838 ?auto_41833 ) ) ( not ( = ?auto_41836 ?auto_41834 ) ) ( not ( = ?auto_41836 ?auto_41835 ) ) ( not ( = ?auto_41836 ?auto_41837 ) ) ( not ( = ?auto_41836 ?auto_41833 ) ) ( not ( = ?auto_41834 ?auto_41835 ) ) ( not ( = ?auto_41834 ?auto_41837 ) ) ( not ( = ?auto_41834 ?auto_41833 ) ) ( not ( = ?auto_41835 ?auto_41837 ) ) ( not ( = ?auto_41835 ?auto_41833 ) ) ( ON ?auto_41833 ?auto_41839 ) ( not ( = ?auto_41833 ?auto_41839 ) ) ( not ( = ?auto_41837 ?auto_41839 ) ) ( not ( = ?auto_41838 ?auto_41839 ) ) ( not ( = ?auto_41836 ?auto_41839 ) ) ( not ( = ?auto_41834 ?auto_41839 ) ) ( not ( = ?auto_41835 ?auto_41839 ) ) ( ON ?auto_41837 ?auto_41833 ) ( ON-TABLE ?auto_41839 ) ( ON ?auto_41835 ?auto_41837 ) ( CLEAR ?auto_41835 ) ( HOLDING ?auto_41834 ) ( CLEAR ?auto_41836 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41838 ?auto_41836 ?auto_41834 )
      ( MAKE-1PILE ?auto_41833 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41840 - BLOCK
    )
    :vars
    (
      ?auto_41846 - BLOCK
      ?auto_41841 - BLOCK
      ?auto_41844 - BLOCK
      ?auto_41845 - BLOCK
      ?auto_41842 - BLOCK
      ?auto_41843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41840 ?auto_41846 ) ) ( ON-TABLE ?auto_41841 ) ( ON ?auto_41844 ?auto_41841 ) ( not ( = ?auto_41841 ?auto_41844 ) ) ( not ( = ?auto_41841 ?auto_41845 ) ) ( not ( = ?auto_41841 ?auto_41842 ) ) ( not ( = ?auto_41841 ?auto_41846 ) ) ( not ( = ?auto_41841 ?auto_41840 ) ) ( not ( = ?auto_41844 ?auto_41845 ) ) ( not ( = ?auto_41844 ?auto_41842 ) ) ( not ( = ?auto_41844 ?auto_41846 ) ) ( not ( = ?auto_41844 ?auto_41840 ) ) ( not ( = ?auto_41845 ?auto_41842 ) ) ( not ( = ?auto_41845 ?auto_41846 ) ) ( not ( = ?auto_41845 ?auto_41840 ) ) ( not ( = ?auto_41842 ?auto_41846 ) ) ( not ( = ?auto_41842 ?auto_41840 ) ) ( ON ?auto_41840 ?auto_41843 ) ( not ( = ?auto_41840 ?auto_41843 ) ) ( not ( = ?auto_41846 ?auto_41843 ) ) ( not ( = ?auto_41841 ?auto_41843 ) ) ( not ( = ?auto_41844 ?auto_41843 ) ) ( not ( = ?auto_41845 ?auto_41843 ) ) ( not ( = ?auto_41842 ?auto_41843 ) ) ( ON ?auto_41846 ?auto_41840 ) ( ON-TABLE ?auto_41843 ) ( ON ?auto_41842 ?auto_41846 ) ( CLEAR ?auto_41844 ) ( ON ?auto_41845 ?auto_41842 ) ( CLEAR ?auto_41845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41843 ?auto_41840 ?auto_41846 ?auto_41842 )
      ( MAKE-1PILE ?auto_41840 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41847 - BLOCK
    )
    :vars
    (
      ?auto_41849 - BLOCK
      ?auto_41848 - BLOCK
      ?auto_41852 - BLOCK
      ?auto_41850 - BLOCK
      ?auto_41851 - BLOCK
      ?auto_41853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41847 ?auto_41849 ) ) ( ON-TABLE ?auto_41848 ) ( not ( = ?auto_41848 ?auto_41852 ) ) ( not ( = ?auto_41848 ?auto_41850 ) ) ( not ( = ?auto_41848 ?auto_41851 ) ) ( not ( = ?auto_41848 ?auto_41849 ) ) ( not ( = ?auto_41848 ?auto_41847 ) ) ( not ( = ?auto_41852 ?auto_41850 ) ) ( not ( = ?auto_41852 ?auto_41851 ) ) ( not ( = ?auto_41852 ?auto_41849 ) ) ( not ( = ?auto_41852 ?auto_41847 ) ) ( not ( = ?auto_41850 ?auto_41851 ) ) ( not ( = ?auto_41850 ?auto_41849 ) ) ( not ( = ?auto_41850 ?auto_41847 ) ) ( not ( = ?auto_41851 ?auto_41849 ) ) ( not ( = ?auto_41851 ?auto_41847 ) ) ( ON ?auto_41847 ?auto_41853 ) ( not ( = ?auto_41847 ?auto_41853 ) ) ( not ( = ?auto_41849 ?auto_41853 ) ) ( not ( = ?auto_41848 ?auto_41853 ) ) ( not ( = ?auto_41852 ?auto_41853 ) ) ( not ( = ?auto_41850 ?auto_41853 ) ) ( not ( = ?auto_41851 ?auto_41853 ) ) ( ON ?auto_41849 ?auto_41847 ) ( ON-TABLE ?auto_41853 ) ( ON ?auto_41851 ?auto_41849 ) ( ON ?auto_41850 ?auto_41851 ) ( CLEAR ?auto_41850 ) ( HOLDING ?auto_41852 ) ( CLEAR ?auto_41848 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41848 ?auto_41852 )
      ( MAKE-1PILE ?auto_41847 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41854 - BLOCK
    )
    :vars
    (
      ?auto_41857 - BLOCK
      ?auto_41860 - BLOCK
      ?auto_41856 - BLOCK
      ?auto_41855 - BLOCK
      ?auto_41859 - BLOCK
      ?auto_41858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41854 ?auto_41857 ) ) ( ON-TABLE ?auto_41860 ) ( not ( = ?auto_41860 ?auto_41856 ) ) ( not ( = ?auto_41860 ?auto_41855 ) ) ( not ( = ?auto_41860 ?auto_41859 ) ) ( not ( = ?auto_41860 ?auto_41857 ) ) ( not ( = ?auto_41860 ?auto_41854 ) ) ( not ( = ?auto_41856 ?auto_41855 ) ) ( not ( = ?auto_41856 ?auto_41859 ) ) ( not ( = ?auto_41856 ?auto_41857 ) ) ( not ( = ?auto_41856 ?auto_41854 ) ) ( not ( = ?auto_41855 ?auto_41859 ) ) ( not ( = ?auto_41855 ?auto_41857 ) ) ( not ( = ?auto_41855 ?auto_41854 ) ) ( not ( = ?auto_41859 ?auto_41857 ) ) ( not ( = ?auto_41859 ?auto_41854 ) ) ( ON ?auto_41854 ?auto_41858 ) ( not ( = ?auto_41854 ?auto_41858 ) ) ( not ( = ?auto_41857 ?auto_41858 ) ) ( not ( = ?auto_41860 ?auto_41858 ) ) ( not ( = ?auto_41856 ?auto_41858 ) ) ( not ( = ?auto_41855 ?auto_41858 ) ) ( not ( = ?auto_41859 ?auto_41858 ) ) ( ON ?auto_41857 ?auto_41854 ) ( ON-TABLE ?auto_41858 ) ( ON ?auto_41859 ?auto_41857 ) ( ON ?auto_41855 ?auto_41859 ) ( CLEAR ?auto_41860 ) ( ON ?auto_41856 ?auto_41855 ) ( CLEAR ?auto_41856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41858 ?auto_41854 ?auto_41857 ?auto_41859 ?auto_41855 )
      ( MAKE-1PILE ?auto_41854 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41861 - BLOCK
    )
    :vars
    (
      ?auto_41866 - BLOCK
      ?auto_41867 - BLOCK
      ?auto_41865 - BLOCK
      ?auto_41863 - BLOCK
      ?auto_41862 - BLOCK
      ?auto_41864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41861 ?auto_41866 ) ) ( not ( = ?auto_41867 ?auto_41865 ) ) ( not ( = ?auto_41867 ?auto_41863 ) ) ( not ( = ?auto_41867 ?auto_41862 ) ) ( not ( = ?auto_41867 ?auto_41866 ) ) ( not ( = ?auto_41867 ?auto_41861 ) ) ( not ( = ?auto_41865 ?auto_41863 ) ) ( not ( = ?auto_41865 ?auto_41862 ) ) ( not ( = ?auto_41865 ?auto_41866 ) ) ( not ( = ?auto_41865 ?auto_41861 ) ) ( not ( = ?auto_41863 ?auto_41862 ) ) ( not ( = ?auto_41863 ?auto_41866 ) ) ( not ( = ?auto_41863 ?auto_41861 ) ) ( not ( = ?auto_41862 ?auto_41866 ) ) ( not ( = ?auto_41862 ?auto_41861 ) ) ( ON ?auto_41861 ?auto_41864 ) ( not ( = ?auto_41861 ?auto_41864 ) ) ( not ( = ?auto_41866 ?auto_41864 ) ) ( not ( = ?auto_41867 ?auto_41864 ) ) ( not ( = ?auto_41865 ?auto_41864 ) ) ( not ( = ?auto_41863 ?auto_41864 ) ) ( not ( = ?auto_41862 ?auto_41864 ) ) ( ON ?auto_41866 ?auto_41861 ) ( ON-TABLE ?auto_41864 ) ( ON ?auto_41862 ?auto_41866 ) ( ON ?auto_41863 ?auto_41862 ) ( ON ?auto_41865 ?auto_41863 ) ( CLEAR ?auto_41865 ) ( HOLDING ?auto_41867 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41867 )
      ( MAKE-1PILE ?auto_41861 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41868 - BLOCK
    )
    :vars
    (
      ?auto_41871 - BLOCK
      ?auto_41872 - BLOCK
      ?auto_41873 - BLOCK
      ?auto_41869 - BLOCK
      ?auto_41870 - BLOCK
      ?auto_41874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41868 ?auto_41871 ) ) ( not ( = ?auto_41872 ?auto_41873 ) ) ( not ( = ?auto_41872 ?auto_41869 ) ) ( not ( = ?auto_41872 ?auto_41870 ) ) ( not ( = ?auto_41872 ?auto_41871 ) ) ( not ( = ?auto_41872 ?auto_41868 ) ) ( not ( = ?auto_41873 ?auto_41869 ) ) ( not ( = ?auto_41873 ?auto_41870 ) ) ( not ( = ?auto_41873 ?auto_41871 ) ) ( not ( = ?auto_41873 ?auto_41868 ) ) ( not ( = ?auto_41869 ?auto_41870 ) ) ( not ( = ?auto_41869 ?auto_41871 ) ) ( not ( = ?auto_41869 ?auto_41868 ) ) ( not ( = ?auto_41870 ?auto_41871 ) ) ( not ( = ?auto_41870 ?auto_41868 ) ) ( ON ?auto_41868 ?auto_41874 ) ( not ( = ?auto_41868 ?auto_41874 ) ) ( not ( = ?auto_41871 ?auto_41874 ) ) ( not ( = ?auto_41872 ?auto_41874 ) ) ( not ( = ?auto_41873 ?auto_41874 ) ) ( not ( = ?auto_41869 ?auto_41874 ) ) ( not ( = ?auto_41870 ?auto_41874 ) ) ( ON ?auto_41871 ?auto_41868 ) ( ON-TABLE ?auto_41874 ) ( ON ?auto_41870 ?auto_41871 ) ( ON ?auto_41869 ?auto_41870 ) ( ON ?auto_41873 ?auto_41869 ) ( ON ?auto_41872 ?auto_41873 ) ( CLEAR ?auto_41872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41874 ?auto_41868 ?auto_41871 ?auto_41870 ?auto_41869 ?auto_41873 )
      ( MAKE-1PILE ?auto_41868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41879 - BLOCK
      ?auto_41880 - BLOCK
      ?auto_41881 - BLOCK
      ?auto_41882 - BLOCK
    )
    :vars
    (
      ?auto_41883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41883 ?auto_41882 ) ( CLEAR ?auto_41883 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41879 ) ( ON ?auto_41880 ?auto_41879 ) ( ON ?auto_41881 ?auto_41880 ) ( ON ?auto_41882 ?auto_41881 ) ( not ( = ?auto_41879 ?auto_41880 ) ) ( not ( = ?auto_41879 ?auto_41881 ) ) ( not ( = ?auto_41879 ?auto_41882 ) ) ( not ( = ?auto_41879 ?auto_41883 ) ) ( not ( = ?auto_41880 ?auto_41881 ) ) ( not ( = ?auto_41880 ?auto_41882 ) ) ( not ( = ?auto_41880 ?auto_41883 ) ) ( not ( = ?auto_41881 ?auto_41882 ) ) ( not ( = ?auto_41881 ?auto_41883 ) ) ( not ( = ?auto_41882 ?auto_41883 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41883 ?auto_41882 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41884 - BLOCK
      ?auto_41885 - BLOCK
      ?auto_41886 - BLOCK
      ?auto_41887 - BLOCK
    )
    :vars
    (
      ?auto_41888 - BLOCK
      ?auto_41889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41888 ?auto_41887 ) ( CLEAR ?auto_41888 ) ( ON-TABLE ?auto_41884 ) ( ON ?auto_41885 ?auto_41884 ) ( ON ?auto_41886 ?auto_41885 ) ( ON ?auto_41887 ?auto_41886 ) ( not ( = ?auto_41884 ?auto_41885 ) ) ( not ( = ?auto_41884 ?auto_41886 ) ) ( not ( = ?auto_41884 ?auto_41887 ) ) ( not ( = ?auto_41884 ?auto_41888 ) ) ( not ( = ?auto_41885 ?auto_41886 ) ) ( not ( = ?auto_41885 ?auto_41887 ) ) ( not ( = ?auto_41885 ?auto_41888 ) ) ( not ( = ?auto_41886 ?auto_41887 ) ) ( not ( = ?auto_41886 ?auto_41888 ) ) ( not ( = ?auto_41887 ?auto_41888 ) ) ( HOLDING ?auto_41889 ) ( not ( = ?auto_41884 ?auto_41889 ) ) ( not ( = ?auto_41885 ?auto_41889 ) ) ( not ( = ?auto_41886 ?auto_41889 ) ) ( not ( = ?auto_41887 ?auto_41889 ) ) ( not ( = ?auto_41888 ?auto_41889 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_41889 )
      ( MAKE-4PILE ?auto_41884 ?auto_41885 ?auto_41886 ?auto_41887 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41890 - BLOCK
      ?auto_41891 - BLOCK
      ?auto_41892 - BLOCK
      ?auto_41893 - BLOCK
    )
    :vars
    (
      ?auto_41895 - BLOCK
      ?auto_41894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41895 ?auto_41893 ) ( ON-TABLE ?auto_41890 ) ( ON ?auto_41891 ?auto_41890 ) ( ON ?auto_41892 ?auto_41891 ) ( ON ?auto_41893 ?auto_41892 ) ( not ( = ?auto_41890 ?auto_41891 ) ) ( not ( = ?auto_41890 ?auto_41892 ) ) ( not ( = ?auto_41890 ?auto_41893 ) ) ( not ( = ?auto_41890 ?auto_41895 ) ) ( not ( = ?auto_41891 ?auto_41892 ) ) ( not ( = ?auto_41891 ?auto_41893 ) ) ( not ( = ?auto_41891 ?auto_41895 ) ) ( not ( = ?auto_41892 ?auto_41893 ) ) ( not ( = ?auto_41892 ?auto_41895 ) ) ( not ( = ?auto_41893 ?auto_41895 ) ) ( not ( = ?auto_41890 ?auto_41894 ) ) ( not ( = ?auto_41891 ?auto_41894 ) ) ( not ( = ?auto_41892 ?auto_41894 ) ) ( not ( = ?auto_41893 ?auto_41894 ) ) ( not ( = ?auto_41895 ?auto_41894 ) ) ( ON ?auto_41894 ?auto_41895 ) ( CLEAR ?auto_41894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41890 ?auto_41891 ?auto_41892 ?auto_41893 ?auto_41895 )
      ( MAKE-4PILE ?auto_41890 ?auto_41891 ?auto_41892 ?auto_41893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41896 - BLOCK
      ?auto_41897 - BLOCK
      ?auto_41898 - BLOCK
      ?auto_41899 - BLOCK
    )
    :vars
    (
      ?auto_41900 - BLOCK
      ?auto_41901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41900 ?auto_41899 ) ( ON-TABLE ?auto_41896 ) ( ON ?auto_41897 ?auto_41896 ) ( ON ?auto_41898 ?auto_41897 ) ( ON ?auto_41899 ?auto_41898 ) ( not ( = ?auto_41896 ?auto_41897 ) ) ( not ( = ?auto_41896 ?auto_41898 ) ) ( not ( = ?auto_41896 ?auto_41899 ) ) ( not ( = ?auto_41896 ?auto_41900 ) ) ( not ( = ?auto_41897 ?auto_41898 ) ) ( not ( = ?auto_41897 ?auto_41899 ) ) ( not ( = ?auto_41897 ?auto_41900 ) ) ( not ( = ?auto_41898 ?auto_41899 ) ) ( not ( = ?auto_41898 ?auto_41900 ) ) ( not ( = ?auto_41899 ?auto_41900 ) ) ( not ( = ?auto_41896 ?auto_41901 ) ) ( not ( = ?auto_41897 ?auto_41901 ) ) ( not ( = ?auto_41898 ?auto_41901 ) ) ( not ( = ?auto_41899 ?auto_41901 ) ) ( not ( = ?auto_41900 ?auto_41901 ) ) ( HOLDING ?auto_41901 ) ( CLEAR ?auto_41900 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41896 ?auto_41897 ?auto_41898 ?auto_41899 ?auto_41900 ?auto_41901 )
      ( MAKE-4PILE ?auto_41896 ?auto_41897 ?auto_41898 ?auto_41899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41902 - BLOCK
      ?auto_41903 - BLOCK
      ?auto_41904 - BLOCK
      ?auto_41905 - BLOCK
    )
    :vars
    (
      ?auto_41907 - BLOCK
      ?auto_41906 - BLOCK
      ?auto_41908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41907 ?auto_41905 ) ( ON-TABLE ?auto_41902 ) ( ON ?auto_41903 ?auto_41902 ) ( ON ?auto_41904 ?auto_41903 ) ( ON ?auto_41905 ?auto_41904 ) ( not ( = ?auto_41902 ?auto_41903 ) ) ( not ( = ?auto_41902 ?auto_41904 ) ) ( not ( = ?auto_41902 ?auto_41905 ) ) ( not ( = ?auto_41902 ?auto_41907 ) ) ( not ( = ?auto_41903 ?auto_41904 ) ) ( not ( = ?auto_41903 ?auto_41905 ) ) ( not ( = ?auto_41903 ?auto_41907 ) ) ( not ( = ?auto_41904 ?auto_41905 ) ) ( not ( = ?auto_41904 ?auto_41907 ) ) ( not ( = ?auto_41905 ?auto_41907 ) ) ( not ( = ?auto_41902 ?auto_41906 ) ) ( not ( = ?auto_41903 ?auto_41906 ) ) ( not ( = ?auto_41904 ?auto_41906 ) ) ( not ( = ?auto_41905 ?auto_41906 ) ) ( not ( = ?auto_41907 ?auto_41906 ) ) ( CLEAR ?auto_41907 ) ( ON ?auto_41906 ?auto_41908 ) ( CLEAR ?auto_41906 ) ( HAND-EMPTY ) ( not ( = ?auto_41902 ?auto_41908 ) ) ( not ( = ?auto_41903 ?auto_41908 ) ) ( not ( = ?auto_41904 ?auto_41908 ) ) ( not ( = ?auto_41905 ?auto_41908 ) ) ( not ( = ?auto_41907 ?auto_41908 ) ) ( not ( = ?auto_41906 ?auto_41908 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41906 ?auto_41908 )
      ( MAKE-4PILE ?auto_41902 ?auto_41903 ?auto_41904 ?auto_41905 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41923 - BLOCK
      ?auto_41924 - BLOCK
      ?auto_41925 - BLOCK
      ?auto_41926 - BLOCK
    )
    :vars
    (
      ?auto_41927 - BLOCK
      ?auto_41928 - BLOCK
      ?auto_41929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41923 ) ( ON ?auto_41924 ?auto_41923 ) ( ON ?auto_41925 ?auto_41924 ) ( not ( = ?auto_41923 ?auto_41924 ) ) ( not ( = ?auto_41923 ?auto_41925 ) ) ( not ( = ?auto_41923 ?auto_41926 ) ) ( not ( = ?auto_41923 ?auto_41927 ) ) ( not ( = ?auto_41924 ?auto_41925 ) ) ( not ( = ?auto_41924 ?auto_41926 ) ) ( not ( = ?auto_41924 ?auto_41927 ) ) ( not ( = ?auto_41925 ?auto_41926 ) ) ( not ( = ?auto_41925 ?auto_41927 ) ) ( not ( = ?auto_41926 ?auto_41927 ) ) ( not ( = ?auto_41923 ?auto_41928 ) ) ( not ( = ?auto_41924 ?auto_41928 ) ) ( not ( = ?auto_41925 ?auto_41928 ) ) ( not ( = ?auto_41926 ?auto_41928 ) ) ( not ( = ?auto_41927 ?auto_41928 ) ) ( ON ?auto_41928 ?auto_41929 ) ( not ( = ?auto_41923 ?auto_41929 ) ) ( not ( = ?auto_41924 ?auto_41929 ) ) ( not ( = ?auto_41925 ?auto_41929 ) ) ( not ( = ?auto_41926 ?auto_41929 ) ) ( not ( = ?auto_41927 ?auto_41929 ) ) ( not ( = ?auto_41928 ?auto_41929 ) ) ( ON ?auto_41927 ?auto_41928 ) ( CLEAR ?auto_41927 ) ( HOLDING ?auto_41926 ) ( CLEAR ?auto_41925 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41923 ?auto_41924 ?auto_41925 ?auto_41926 ?auto_41927 )
      ( MAKE-4PILE ?auto_41923 ?auto_41924 ?auto_41925 ?auto_41926 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41930 - BLOCK
      ?auto_41931 - BLOCK
      ?auto_41932 - BLOCK
      ?auto_41933 - BLOCK
    )
    :vars
    (
      ?auto_41935 - BLOCK
      ?auto_41936 - BLOCK
      ?auto_41934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41930 ) ( ON ?auto_41931 ?auto_41930 ) ( ON ?auto_41932 ?auto_41931 ) ( not ( = ?auto_41930 ?auto_41931 ) ) ( not ( = ?auto_41930 ?auto_41932 ) ) ( not ( = ?auto_41930 ?auto_41933 ) ) ( not ( = ?auto_41930 ?auto_41935 ) ) ( not ( = ?auto_41931 ?auto_41932 ) ) ( not ( = ?auto_41931 ?auto_41933 ) ) ( not ( = ?auto_41931 ?auto_41935 ) ) ( not ( = ?auto_41932 ?auto_41933 ) ) ( not ( = ?auto_41932 ?auto_41935 ) ) ( not ( = ?auto_41933 ?auto_41935 ) ) ( not ( = ?auto_41930 ?auto_41936 ) ) ( not ( = ?auto_41931 ?auto_41936 ) ) ( not ( = ?auto_41932 ?auto_41936 ) ) ( not ( = ?auto_41933 ?auto_41936 ) ) ( not ( = ?auto_41935 ?auto_41936 ) ) ( ON ?auto_41936 ?auto_41934 ) ( not ( = ?auto_41930 ?auto_41934 ) ) ( not ( = ?auto_41931 ?auto_41934 ) ) ( not ( = ?auto_41932 ?auto_41934 ) ) ( not ( = ?auto_41933 ?auto_41934 ) ) ( not ( = ?auto_41935 ?auto_41934 ) ) ( not ( = ?auto_41936 ?auto_41934 ) ) ( ON ?auto_41935 ?auto_41936 ) ( CLEAR ?auto_41932 ) ( ON ?auto_41933 ?auto_41935 ) ( CLEAR ?auto_41933 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41934 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41934 ?auto_41936 ?auto_41935 )
      ( MAKE-4PILE ?auto_41930 ?auto_41931 ?auto_41932 ?auto_41933 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41937 - BLOCK
      ?auto_41938 - BLOCK
      ?auto_41939 - BLOCK
      ?auto_41940 - BLOCK
    )
    :vars
    (
      ?auto_41941 - BLOCK
      ?auto_41942 - BLOCK
      ?auto_41943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41937 ) ( ON ?auto_41938 ?auto_41937 ) ( not ( = ?auto_41937 ?auto_41938 ) ) ( not ( = ?auto_41937 ?auto_41939 ) ) ( not ( = ?auto_41937 ?auto_41940 ) ) ( not ( = ?auto_41937 ?auto_41941 ) ) ( not ( = ?auto_41938 ?auto_41939 ) ) ( not ( = ?auto_41938 ?auto_41940 ) ) ( not ( = ?auto_41938 ?auto_41941 ) ) ( not ( = ?auto_41939 ?auto_41940 ) ) ( not ( = ?auto_41939 ?auto_41941 ) ) ( not ( = ?auto_41940 ?auto_41941 ) ) ( not ( = ?auto_41937 ?auto_41942 ) ) ( not ( = ?auto_41938 ?auto_41942 ) ) ( not ( = ?auto_41939 ?auto_41942 ) ) ( not ( = ?auto_41940 ?auto_41942 ) ) ( not ( = ?auto_41941 ?auto_41942 ) ) ( ON ?auto_41942 ?auto_41943 ) ( not ( = ?auto_41937 ?auto_41943 ) ) ( not ( = ?auto_41938 ?auto_41943 ) ) ( not ( = ?auto_41939 ?auto_41943 ) ) ( not ( = ?auto_41940 ?auto_41943 ) ) ( not ( = ?auto_41941 ?auto_41943 ) ) ( not ( = ?auto_41942 ?auto_41943 ) ) ( ON ?auto_41941 ?auto_41942 ) ( ON ?auto_41940 ?auto_41941 ) ( CLEAR ?auto_41940 ) ( ON-TABLE ?auto_41943 ) ( HOLDING ?auto_41939 ) ( CLEAR ?auto_41938 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41937 ?auto_41938 ?auto_41939 )
      ( MAKE-4PILE ?auto_41937 ?auto_41938 ?auto_41939 ?auto_41940 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41944 - BLOCK
      ?auto_41945 - BLOCK
      ?auto_41946 - BLOCK
      ?auto_41947 - BLOCK
    )
    :vars
    (
      ?auto_41948 - BLOCK
      ?auto_41950 - BLOCK
      ?auto_41949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41944 ) ( ON ?auto_41945 ?auto_41944 ) ( not ( = ?auto_41944 ?auto_41945 ) ) ( not ( = ?auto_41944 ?auto_41946 ) ) ( not ( = ?auto_41944 ?auto_41947 ) ) ( not ( = ?auto_41944 ?auto_41948 ) ) ( not ( = ?auto_41945 ?auto_41946 ) ) ( not ( = ?auto_41945 ?auto_41947 ) ) ( not ( = ?auto_41945 ?auto_41948 ) ) ( not ( = ?auto_41946 ?auto_41947 ) ) ( not ( = ?auto_41946 ?auto_41948 ) ) ( not ( = ?auto_41947 ?auto_41948 ) ) ( not ( = ?auto_41944 ?auto_41950 ) ) ( not ( = ?auto_41945 ?auto_41950 ) ) ( not ( = ?auto_41946 ?auto_41950 ) ) ( not ( = ?auto_41947 ?auto_41950 ) ) ( not ( = ?auto_41948 ?auto_41950 ) ) ( ON ?auto_41950 ?auto_41949 ) ( not ( = ?auto_41944 ?auto_41949 ) ) ( not ( = ?auto_41945 ?auto_41949 ) ) ( not ( = ?auto_41946 ?auto_41949 ) ) ( not ( = ?auto_41947 ?auto_41949 ) ) ( not ( = ?auto_41948 ?auto_41949 ) ) ( not ( = ?auto_41950 ?auto_41949 ) ) ( ON ?auto_41948 ?auto_41950 ) ( ON ?auto_41947 ?auto_41948 ) ( ON-TABLE ?auto_41949 ) ( CLEAR ?auto_41945 ) ( ON ?auto_41946 ?auto_41947 ) ( CLEAR ?auto_41946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41949 ?auto_41950 ?auto_41948 ?auto_41947 )
      ( MAKE-4PILE ?auto_41944 ?auto_41945 ?auto_41946 ?auto_41947 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41951 - BLOCK
      ?auto_41952 - BLOCK
      ?auto_41953 - BLOCK
      ?auto_41954 - BLOCK
    )
    :vars
    (
      ?auto_41956 - BLOCK
      ?auto_41957 - BLOCK
      ?auto_41955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41951 ) ( not ( = ?auto_41951 ?auto_41952 ) ) ( not ( = ?auto_41951 ?auto_41953 ) ) ( not ( = ?auto_41951 ?auto_41954 ) ) ( not ( = ?auto_41951 ?auto_41956 ) ) ( not ( = ?auto_41952 ?auto_41953 ) ) ( not ( = ?auto_41952 ?auto_41954 ) ) ( not ( = ?auto_41952 ?auto_41956 ) ) ( not ( = ?auto_41953 ?auto_41954 ) ) ( not ( = ?auto_41953 ?auto_41956 ) ) ( not ( = ?auto_41954 ?auto_41956 ) ) ( not ( = ?auto_41951 ?auto_41957 ) ) ( not ( = ?auto_41952 ?auto_41957 ) ) ( not ( = ?auto_41953 ?auto_41957 ) ) ( not ( = ?auto_41954 ?auto_41957 ) ) ( not ( = ?auto_41956 ?auto_41957 ) ) ( ON ?auto_41957 ?auto_41955 ) ( not ( = ?auto_41951 ?auto_41955 ) ) ( not ( = ?auto_41952 ?auto_41955 ) ) ( not ( = ?auto_41953 ?auto_41955 ) ) ( not ( = ?auto_41954 ?auto_41955 ) ) ( not ( = ?auto_41956 ?auto_41955 ) ) ( not ( = ?auto_41957 ?auto_41955 ) ) ( ON ?auto_41956 ?auto_41957 ) ( ON ?auto_41954 ?auto_41956 ) ( ON-TABLE ?auto_41955 ) ( ON ?auto_41953 ?auto_41954 ) ( CLEAR ?auto_41953 ) ( HOLDING ?auto_41952 ) ( CLEAR ?auto_41951 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41951 ?auto_41952 )
      ( MAKE-4PILE ?auto_41951 ?auto_41952 ?auto_41953 ?auto_41954 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41958 - BLOCK
      ?auto_41959 - BLOCK
      ?auto_41960 - BLOCK
      ?auto_41961 - BLOCK
    )
    :vars
    (
      ?auto_41962 - BLOCK
      ?auto_41964 - BLOCK
      ?auto_41963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41958 ) ( not ( = ?auto_41958 ?auto_41959 ) ) ( not ( = ?auto_41958 ?auto_41960 ) ) ( not ( = ?auto_41958 ?auto_41961 ) ) ( not ( = ?auto_41958 ?auto_41962 ) ) ( not ( = ?auto_41959 ?auto_41960 ) ) ( not ( = ?auto_41959 ?auto_41961 ) ) ( not ( = ?auto_41959 ?auto_41962 ) ) ( not ( = ?auto_41960 ?auto_41961 ) ) ( not ( = ?auto_41960 ?auto_41962 ) ) ( not ( = ?auto_41961 ?auto_41962 ) ) ( not ( = ?auto_41958 ?auto_41964 ) ) ( not ( = ?auto_41959 ?auto_41964 ) ) ( not ( = ?auto_41960 ?auto_41964 ) ) ( not ( = ?auto_41961 ?auto_41964 ) ) ( not ( = ?auto_41962 ?auto_41964 ) ) ( ON ?auto_41964 ?auto_41963 ) ( not ( = ?auto_41958 ?auto_41963 ) ) ( not ( = ?auto_41959 ?auto_41963 ) ) ( not ( = ?auto_41960 ?auto_41963 ) ) ( not ( = ?auto_41961 ?auto_41963 ) ) ( not ( = ?auto_41962 ?auto_41963 ) ) ( not ( = ?auto_41964 ?auto_41963 ) ) ( ON ?auto_41962 ?auto_41964 ) ( ON ?auto_41961 ?auto_41962 ) ( ON-TABLE ?auto_41963 ) ( ON ?auto_41960 ?auto_41961 ) ( CLEAR ?auto_41958 ) ( ON ?auto_41959 ?auto_41960 ) ( CLEAR ?auto_41959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41963 ?auto_41964 ?auto_41962 ?auto_41961 ?auto_41960 )
      ( MAKE-4PILE ?auto_41958 ?auto_41959 ?auto_41960 ?auto_41961 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41965 - BLOCK
      ?auto_41966 - BLOCK
      ?auto_41967 - BLOCK
      ?auto_41968 - BLOCK
    )
    :vars
    (
      ?auto_41969 - BLOCK
      ?auto_41971 - BLOCK
      ?auto_41970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41965 ?auto_41966 ) ) ( not ( = ?auto_41965 ?auto_41967 ) ) ( not ( = ?auto_41965 ?auto_41968 ) ) ( not ( = ?auto_41965 ?auto_41969 ) ) ( not ( = ?auto_41966 ?auto_41967 ) ) ( not ( = ?auto_41966 ?auto_41968 ) ) ( not ( = ?auto_41966 ?auto_41969 ) ) ( not ( = ?auto_41967 ?auto_41968 ) ) ( not ( = ?auto_41967 ?auto_41969 ) ) ( not ( = ?auto_41968 ?auto_41969 ) ) ( not ( = ?auto_41965 ?auto_41971 ) ) ( not ( = ?auto_41966 ?auto_41971 ) ) ( not ( = ?auto_41967 ?auto_41971 ) ) ( not ( = ?auto_41968 ?auto_41971 ) ) ( not ( = ?auto_41969 ?auto_41971 ) ) ( ON ?auto_41971 ?auto_41970 ) ( not ( = ?auto_41965 ?auto_41970 ) ) ( not ( = ?auto_41966 ?auto_41970 ) ) ( not ( = ?auto_41967 ?auto_41970 ) ) ( not ( = ?auto_41968 ?auto_41970 ) ) ( not ( = ?auto_41969 ?auto_41970 ) ) ( not ( = ?auto_41971 ?auto_41970 ) ) ( ON ?auto_41969 ?auto_41971 ) ( ON ?auto_41968 ?auto_41969 ) ( ON-TABLE ?auto_41970 ) ( ON ?auto_41967 ?auto_41968 ) ( ON ?auto_41966 ?auto_41967 ) ( CLEAR ?auto_41966 ) ( HOLDING ?auto_41965 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41965 )
      ( MAKE-4PILE ?auto_41965 ?auto_41966 ?auto_41967 ?auto_41968 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41972 - BLOCK
      ?auto_41973 - BLOCK
      ?auto_41974 - BLOCK
      ?auto_41975 - BLOCK
    )
    :vars
    (
      ?auto_41977 - BLOCK
      ?auto_41976 - BLOCK
      ?auto_41978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41972 ?auto_41973 ) ) ( not ( = ?auto_41972 ?auto_41974 ) ) ( not ( = ?auto_41972 ?auto_41975 ) ) ( not ( = ?auto_41972 ?auto_41977 ) ) ( not ( = ?auto_41973 ?auto_41974 ) ) ( not ( = ?auto_41973 ?auto_41975 ) ) ( not ( = ?auto_41973 ?auto_41977 ) ) ( not ( = ?auto_41974 ?auto_41975 ) ) ( not ( = ?auto_41974 ?auto_41977 ) ) ( not ( = ?auto_41975 ?auto_41977 ) ) ( not ( = ?auto_41972 ?auto_41976 ) ) ( not ( = ?auto_41973 ?auto_41976 ) ) ( not ( = ?auto_41974 ?auto_41976 ) ) ( not ( = ?auto_41975 ?auto_41976 ) ) ( not ( = ?auto_41977 ?auto_41976 ) ) ( ON ?auto_41976 ?auto_41978 ) ( not ( = ?auto_41972 ?auto_41978 ) ) ( not ( = ?auto_41973 ?auto_41978 ) ) ( not ( = ?auto_41974 ?auto_41978 ) ) ( not ( = ?auto_41975 ?auto_41978 ) ) ( not ( = ?auto_41977 ?auto_41978 ) ) ( not ( = ?auto_41976 ?auto_41978 ) ) ( ON ?auto_41977 ?auto_41976 ) ( ON ?auto_41975 ?auto_41977 ) ( ON-TABLE ?auto_41978 ) ( ON ?auto_41974 ?auto_41975 ) ( ON ?auto_41973 ?auto_41974 ) ( ON ?auto_41972 ?auto_41973 ) ( CLEAR ?auto_41972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41978 ?auto_41976 ?auto_41977 ?auto_41975 ?auto_41974 ?auto_41973 )
      ( MAKE-4PILE ?auto_41972 ?auto_41973 ?auto_41974 ?auto_41975 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41981 - BLOCK
      ?auto_41982 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_41982 ) ( CLEAR ?auto_41981 ) ( ON-TABLE ?auto_41981 ) ( not ( = ?auto_41981 ?auto_41982 ) ) )
    :subtasks
    ( ( !STACK ?auto_41982 ?auto_41981 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41983 - BLOCK
      ?auto_41984 - BLOCK
    )
    :vars
    (
      ?auto_41985 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41983 ) ( ON-TABLE ?auto_41983 ) ( not ( = ?auto_41983 ?auto_41984 ) ) ( ON ?auto_41984 ?auto_41985 ) ( CLEAR ?auto_41984 ) ( HAND-EMPTY ) ( not ( = ?auto_41983 ?auto_41985 ) ) ( not ( = ?auto_41984 ?auto_41985 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41984 ?auto_41985 )
      ( MAKE-2PILE ?auto_41983 ?auto_41984 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41986 - BLOCK
      ?auto_41987 - BLOCK
    )
    :vars
    (
      ?auto_41988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41986 ?auto_41987 ) ) ( ON ?auto_41987 ?auto_41988 ) ( CLEAR ?auto_41987 ) ( not ( = ?auto_41986 ?auto_41988 ) ) ( not ( = ?auto_41987 ?auto_41988 ) ) ( HOLDING ?auto_41986 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41986 )
      ( MAKE-2PILE ?auto_41986 ?auto_41987 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41989 - BLOCK
      ?auto_41990 - BLOCK
    )
    :vars
    (
      ?auto_41991 - BLOCK
      ?auto_41994 - BLOCK
      ?auto_41992 - BLOCK
      ?auto_41993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41989 ?auto_41990 ) ) ( ON ?auto_41990 ?auto_41991 ) ( not ( = ?auto_41989 ?auto_41991 ) ) ( not ( = ?auto_41990 ?auto_41991 ) ) ( ON ?auto_41989 ?auto_41990 ) ( CLEAR ?auto_41989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41994 ) ( ON ?auto_41992 ?auto_41994 ) ( ON ?auto_41993 ?auto_41992 ) ( ON ?auto_41991 ?auto_41993 ) ( not ( = ?auto_41994 ?auto_41992 ) ) ( not ( = ?auto_41994 ?auto_41993 ) ) ( not ( = ?auto_41994 ?auto_41991 ) ) ( not ( = ?auto_41994 ?auto_41990 ) ) ( not ( = ?auto_41994 ?auto_41989 ) ) ( not ( = ?auto_41992 ?auto_41993 ) ) ( not ( = ?auto_41992 ?auto_41991 ) ) ( not ( = ?auto_41992 ?auto_41990 ) ) ( not ( = ?auto_41992 ?auto_41989 ) ) ( not ( = ?auto_41993 ?auto_41991 ) ) ( not ( = ?auto_41993 ?auto_41990 ) ) ( not ( = ?auto_41993 ?auto_41989 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41994 ?auto_41992 ?auto_41993 ?auto_41991 ?auto_41990 )
      ( MAKE-2PILE ?auto_41989 ?auto_41990 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41995 - BLOCK
      ?auto_41996 - BLOCK
    )
    :vars
    (
      ?auto_41998 - BLOCK
      ?auto_41997 - BLOCK
      ?auto_41999 - BLOCK
      ?auto_42000 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41995 ?auto_41996 ) ) ( ON ?auto_41996 ?auto_41998 ) ( not ( = ?auto_41995 ?auto_41998 ) ) ( not ( = ?auto_41996 ?auto_41998 ) ) ( ON-TABLE ?auto_41997 ) ( ON ?auto_41999 ?auto_41997 ) ( ON ?auto_42000 ?auto_41999 ) ( ON ?auto_41998 ?auto_42000 ) ( not ( = ?auto_41997 ?auto_41999 ) ) ( not ( = ?auto_41997 ?auto_42000 ) ) ( not ( = ?auto_41997 ?auto_41998 ) ) ( not ( = ?auto_41997 ?auto_41996 ) ) ( not ( = ?auto_41997 ?auto_41995 ) ) ( not ( = ?auto_41999 ?auto_42000 ) ) ( not ( = ?auto_41999 ?auto_41998 ) ) ( not ( = ?auto_41999 ?auto_41996 ) ) ( not ( = ?auto_41999 ?auto_41995 ) ) ( not ( = ?auto_42000 ?auto_41998 ) ) ( not ( = ?auto_42000 ?auto_41996 ) ) ( not ( = ?auto_42000 ?auto_41995 ) ) ( HOLDING ?auto_41995 ) ( CLEAR ?auto_41996 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41997 ?auto_41999 ?auto_42000 ?auto_41998 ?auto_41996 ?auto_41995 )
      ( MAKE-2PILE ?auto_41995 ?auto_41996 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42001 - BLOCK
      ?auto_42002 - BLOCK
    )
    :vars
    (
      ?auto_42006 - BLOCK
      ?auto_42003 - BLOCK
      ?auto_42005 - BLOCK
      ?auto_42004 - BLOCK
      ?auto_42007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42001 ?auto_42002 ) ) ( ON ?auto_42002 ?auto_42006 ) ( not ( = ?auto_42001 ?auto_42006 ) ) ( not ( = ?auto_42002 ?auto_42006 ) ) ( ON-TABLE ?auto_42003 ) ( ON ?auto_42005 ?auto_42003 ) ( ON ?auto_42004 ?auto_42005 ) ( ON ?auto_42006 ?auto_42004 ) ( not ( = ?auto_42003 ?auto_42005 ) ) ( not ( = ?auto_42003 ?auto_42004 ) ) ( not ( = ?auto_42003 ?auto_42006 ) ) ( not ( = ?auto_42003 ?auto_42002 ) ) ( not ( = ?auto_42003 ?auto_42001 ) ) ( not ( = ?auto_42005 ?auto_42004 ) ) ( not ( = ?auto_42005 ?auto_42006 ) ) ( not ( = ?auto_42005 ?auto_42002 ) ) ( not ( = ?auto_42005 ?auto_42001 ) ) ( not ( = ?auto_42004 ?auto_42006 ) ) ( not ( = ?auto_42004 ?auto_42002 ) ) ( not ( = ?auto_42004 ?auto_42001 ) ) ( CLEAR ?auto_42002 ) ( ON ?auto_42001 ?auto_42007 ) ( CLEAR ?auto_42001 ) ( HAND-EMPTY ) ( not ( = ?auto_42001 ?auto_42007 ) ) ( not ( = ?auto_42002 ?auto_42007 ) ) ( not ( = ?auto_42006 ?auto_42007 ) ) ( not ( = ?auto_42003 ?auto_42007 ) ) ( not ( = ?auto_42005 ?auto_42007 ) ) ( not ( = ?auto_42004 ?auto_42007 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42001 ?auto_42007 )
      ( MAKE-2PILE ?auto_42001 ?auto_42002 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42008 - BLOCK
      ?auto_42009 - BLOCK
    )
    :vars
    (
      ?auto_42011 - BLOCK
      ?auto_42012 - BLOCK
      ?auto_42010 - BLOCK
      ?auto_42013 - BLOCK
      ?auto_42014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42008 ?auto_42009 ) ) ( not ( = ?auto_42008 ?auto_42011 ) ) ( not ( = ?auto_42009 ?auto_42011 ) ) ( ON-TABLE ?auto_42012 ) ( ON ?auto_42010 ?auto_42012 ) ( ON ?auto_42013 ?auto_42010 ) ( ON ?auto_42011 ?auto_42013 ) ( not ( = ?auto_42012 ?auto_42010 ) ) ( not ( = ?auto_42012 ?auto_42013 ) ) ( not ( = ?auto_42012 ?auto_42011 ) ) ( not ( = ?auto_42012 ?auto_42009 ) ) ( not ( = ?auto_42012 ?auto_42008 ) ) ( not ( = ?auto_42010 ?auto_42013 ) ) ( not ( = ?auto_42010 ?auto_42011 ) ) ( not ( = ?auto_42010 ?auto_42009 ) ) ( not ( = ?auto_42010 ?auto_42008 ) ) ( not ( = ?auto_42013 ?auto_42011 ) ) ( not ( = ?auto_42013 ?auto_42009 ) ) ( not ( = ?auto_42013 ?auto_42008 ) ) ( ON ?auto_42008 ?auto_42014 ) ( CLEAR ?auto_42008 ) ( not ( = ?auto_42008 ?auto_42014 ) ) ( not ( = ?auto_42009 ?auto_42014 ) ) ( not ( = ?auto_42011 ?auto_42014 ) ) ( not ( = ?auto_42012 ?auto_42014 ) ) ( not ( = ?auto_42010 ?auto_42014 ) ) ( not ( = ?auto_42013 ?auto_42014 ) ) ( HOLDING ?auto_42009 ) ( CLEAR ?auto_42011 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42012 ?auto_42010 ?auto_42013 ?auto_42011 ?auto_42009 )
      ( MAKE-2PILE ?auto_42008 ?auto_42009 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42015 - BLOCK
      ?auto_42016 - BLOCK
    )
    :vars
    (
      ?auto_42020 - BLOCK
      ?auto_42018 - BLOCK
      ?auto_42017 - BLOCK
      ?auto_42019 - BLOCK
      ?auto_42021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42015 ?auto_42016 ) ) ( not ( = ?auto_42015 ?auto_42020 ) ) ( not ( = ?auto_42016 ?auto_42020 ) ) ( ON-TABLE ?auto_42018 ) ( ON ?auto_42017 ?auto_42018 ) ( ON ?auto_42019 ?auto_42017 ) ( ON ?auto_42020 ?auto_42019 ) ( not ( = ?auto_42018 ?auto_42017 ) ) ( not ( = ?auto_42018 ?auto_42019 ) ) ( not ( = ?auto_42018 ?auto_42020 ) ) ( not ( = ?auto_42018 ?auto_42016 ) ) ( not ( = ?auto_42018 ?auto_42015 ) ) ( not ( = ?auto_42017 ?auto_42019 ) ) ( not ( = ?auto_42017 ?auto_42020 ) ) ( not ( = ?auto_42017 ?auto_42016 ) ) ( not ( = ?auto_42017 ?auto_42015 ) ) ( not ( = ?auto_42019 ?auto_42020 ) ) ( not ( = ?auto_42019 ?auto_42016 ) ) ( not ( = ?auto_42019 ?auto_42015 ) ) ( ON ?auto_42015 ?auto_42021 ) ( not ( = ?auto_42015 ?auto_42021 ) ) ( not ( = ?auto_42016 ?auto_42021 ) ) ( not ( = ?auto_42020 ?auto_42021 ) ) ( not ( = ?auto_42018 ?auto_42021 ) ) ( not ( = ?auto_42017 ?auto_42021 ) ) ( not ( = ?auto_42019 ?auto_42021 ) ) ( CLEAR ?auto_42020 ) ( ON ?auto_42016 ?auto_42015 ) ( CLEAR ?auto_42016 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42021 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42021 ?auto_42015 )
      ( MAKE-2PILE ?auto_42015 ?auto_42016 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42022 - BLOCK
      ?auto_42023 - BLOCK
    )
    :vars
    (
      ?auto_42028 - BLOCK
      ?auto_42025 - BLOCK
      ?auto_42024 - BLOCK
      ?auto_42027 - BLOCK
      ?auto_42026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42022 ?auto_42023 ) ) ( not ( = ?auto_42022 ?auto_42028 ) ) ( not ( = ?auto_42023 ?auto_42028 ) ) ( ON-TABLE ?auto_42025 ) ( ON ?auto_42024 ?auto_42025 ) ( ON ?auto_42027 ?auto_42024 ) ( not ( = ?auto_42025 ?auto_42024 ) ) ( not ( = ?auto_42025 ?auto_42027 ) ) ( not ( = ?auto_42025 ?auto_42028 ) ) ( not ( = ?auto_42025 ?auto_42023 ) ) ( not ( = ?auto_42025 ?auto_42022 ) ) ( not ( = ?auto_42024 ?auto_42027 ) ) ( not ( = ?auto_42024 ?auto_42028 ) ) ( not ( = ?auto_42024 ?auto_42023 ) ) ( not ( = ?auto_42024 ?auto_42022 ) ) ( not ( = ?auto_42027 ?auto_42028 ) ) ( not ( = ?auto_42027 ?auto_42023 ) ) ( not ( = ?auto_42027 ?auto_42022 ) ) ( ON ?auto_42022 ?auto_42026 ) ( not ( = ?auto_42022 ?auto_42026 ) ) ( not ( = ?auto_42023 ?auto_42026 ) ) ( not ( = ?auto_42028 ?auto_42026 ) ) ( not ( = ?auto_42025 ?auto_42026 ) ) ( not ( = ?auto_42024 ?auto_42026 ) ) ( not ( = ?auto_42027 ?auto_42026 ) ) ( ON ?auto_42023 ?auto_42022 ) ( CLEAR ?auto_42023 ) ( ON-TABLE ?auto_42026 ) ( HOLDING ?auto_42028 ) ( CLEAR ?auto_42027 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42025 ?auto_42024 ?auto_42027 ?auto_42028 )
      ( MAKE-2PILE ?auto_42022 ?auto_42023 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42029 - BLOCK
      ?auto_42030 - BLOCK
    )
    :vars
    (
      ?auto_42034 - BLOCK
      ?auto_42031 - BLOCK
      ?auto_42035 - BLOCK
      ?auto_42033 - BLOCK
      ?auto_42032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42029 ?auto_42030 ) ) ( not ( = ?auto_42029 ?auto_42034 ) ) ( not ( = ?auto_42030 ?auto_42034 ) ) ( ON-TABLE ?auto_42031 ) ( ON ?auto_42035 ?auto_42031 ) ( ON ?auto_42033 ?auto_42035 ) ( not ( = ?auto_42031 ?auto_42035 ) ) ( not ( = ?auto_42031 ?auto_42033 ) ) ( not ( = ?auto_42031 ?auto_42034 ) ) ( not ( = ?auto_42031 ?auto_42030 ) ) ( not ( = ?auto_42031 ?auto_42029 ) ) ( not ( = ?auto_42035 ?auto_42033 ) ) ( not ( = ?auto_42035 ?auto_42034 ) ) ( not ( = ?auto_42035 ?auto_42030 ) ) ( not ( = ?auto_42035 ?auto_42029 ) ) ( not ( = ?auto_42033 ?auto_42034 ) ) ( not ( = ?auto_42033 ?auto_42030 ) ) ( not ( = ?auto_42033 ?auto_42029 ) ) ( ON ?auto_42029 ?auto_42032 ) ( not ( = ?auto_42029 ?auto_42032 ) ) ( not ( = ?auto_42030 ?auto_42032 ) ) ( not ( = ?auto_42034 ?auto_42032 ) ) ( not ( = ?auto_42031 ?auto_42032 ) ) ( not ( = ?auto_42035 ?auto_42032 ) ) ( not ( = ?auto_42033 ?auto_42032 ) ) ( ON ?auto_42030 ?auto_42029 ) ( ON-TABLE ?auto_42032 ) ( CLEAR ?auto_42033 ) ( ON ?auto_42034 ?auto_42030 ) ( CLEAR ?auto_42034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42032 ?auto_42029 ?auto_42030 )
      ( MAKE-2PILE ?auto_42029 ?auto_42030 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42036 - BLOCK
      ?auto_42037 - BLOCK
    )
    :vars
    (
      ?auto_42041 - BLOCK
      ?auto_42038 - BLOCK
      ?auto_42039 - BLOCK
      ?auto_42040 - BLOCK
      ?auto_42042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42036 ?auto_42037 ) ) ( not ( = ?auto_42036 ?auto_42041 ) ) ( not ( = ?auto_42037 ?auto_42041 ) ) ( ON-TABLE ?auto_42038 ) ( ON ?auto_42039 ?auto_42038 ) ( not ( = ?auto_42038 ?auto_42039 ) ) ( not ( = ?auto_42038 ?auto_42040 ) ) ( not ( = ?auto_42038 ?auto_42041 ) ) ( not ( = ?auto_42038 ?auto_42037 ) ) ( not ( = ?auto_42038 ?auto_42036 ) ) ( not ( = ?auto_42039 ?auto_42040 ) ) ( not ( = ?auto_42039 ?auto_42041 ) ) ( not ( = ?auto_42039 ?auto_42037 ) ) ( not ( = ?auto_42039 ?auto_42036 ) ) ( not ( = ?auto_42040 ?auto_42041 ) ) ( not ( = ?auto_42040 ?auto_42037 ) ) ( not ( = ?auto_42040 ?auto_42036 ) ) ( ON ?auto_42036 ?auto_42042 ) ( not ( = ?auto_42036 ?auto_42042 ) ) ( not ( = ?auto_42037 ?auto_42042 ) ) ( not ( = ?auto_42041 ?auto_42042 ) ) ( not ( = ?auto_42038 ?auto_42042 ) ) ( not ( = ?auto_42039 ?auto_42042 ) ) ( not ( = ?auto_42040 ?auto_42042 ) ) ( ON ?auto_42037 ?auto_42036 ) ( ON-TABLE ?auto_42042 ) ( ON ?auto_42041 ?auto_42037 ) ( CLEAR ?auto_42041 ) ( HOLDING ?auto_42040 ) ( CLEAR ?auto_42039 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42038 ?auto_42039 ?auto_42040 )
      ( MAKE-2PILE ?auto_42036 ?auto_42037 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42043 - BLOCK
      ?auto_42044 - BLOCK
    )
    :vars
    (
      ?auto_42046 - BLOCK
      ?auto_42048 - BLOCK
      ?auto_42049 - BLOCK
      ?auto_42047 - BLOCK
      ?auto_42045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42043 ?auto_42044 ) ) ( not ( = ?auto_42043 ?auto_42046 ) ) ( not ( = ?auto_42044 ?auto_42046 ) ) ( ON-TABLE ?auto_42048 ) ( ON ?auto_42049 ?auto_42048 ) ( not ( = ?auto_42048 ?auto_42049 ) ) ( not ( = ?auto_42048 ?auto_42047 ) ) ( not ( = ?auto_42048 ?auto_42046 ) ) ( not ( = ?auto_42048 ?auto_42044 ) ) ( not ( = ?auto_42048 ?auto_42043 ) ) ( not ( = ?auto_42049 ?auto_42047 ) ) ( not ( = ?auto_42049 ?auto_42046 ) ) ( not ( = ?auto_42049 ?auto_42044 ) ) ( not ( = ?auto_42049 ?auto_42043 ) ) ( not ( = ?auto_42047 ?auto_42046 ) ) ( not ( = ?auto_42047 ?auto_42044 ) ) ( not ( = ?auto_42047 ?auto_42043 ) ) ( ON ?auto_42043 ?auto_42045 ) ( not ( = ?auto_42043 ?auto_42045 ) ) ( not ( = ?auto_42044 ?auto_42045 ) ) ( not ( = ?auto_42046 ?auto_42045 ) ) ( not ( = ?auto_42048 ?auto_42045 ) ) ( not ( = ?auto_42049 ?auto_42045 ) ) ( not ( = ?auto_42047 ?auto_42045 ) ) ( ON ?auto_42044 ?auto_42043 ) ( ON-TABLE ?auto_42045 ) ( ON ?auto_42046 ?auto_42044 ) ( CLEAR ?auto_42049 ) ( ON ?auto_42047 ?auto_42046 ) ( CLEAR ?auto_42047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42045 ?auto_42043 ?auto_42044 ?auto_42046 )
      ( MAKE-2PILE ?auto_42043 ?auto_42044 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42050 - BLOCK
      ?auto_42051 - BLOCK
    )
    :vars
    (
      ?auto_42052 - BLOCK
      ?auto_42054 - BLOCK
      ?auto_42056 - BLOCK
      ?auto_42055 - BLOCK
      ?auto_42053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42050 ?auto_42051 ) ) ( not ( = ?auto_42050 ?auto_42052 ) ) ( not ( = ?auto_42051 ?auto_42052 ) ) ( ON-TABLE ?auto_42054 ) ( not ( = ?auto_42054 ?auto_42056 ) ) ( not ( = ?auto_42054 ?auto_42055 ) ) ( not ( = ?auto_42054 ?auto_42052 ) ) ( not ( = ?auto_42054 ?auto_42051 ) ) ( not ( = ?auto_42054 ?auto_42050 ) ) ( not ( = ?auto_42056 ?auto_42055 ) ) ( not ( = ?auto_42056 ?auto_42052 ) ) ( not ( = ?auto_42056 ?auto_42051 ) ) ( not ( = ?auto_42056 ?auto_42050 ) ) ( not ( = ?auto_42055 ?auto_42052 ) ) ( not ( = ?auto_42055 ?auto_42051 ) ) ( not ( = ?auto_42055 ?auto_42050 ) ) ( ON ?auto_42050 ?auto_42053 ) ( not ( = ?auto_42050 ?auto_42053 ) ) ( not ( = ?auto_42051 ?auto_42053 ) ) ( not ( = ?auto_42052 ?auto_42053 ) ) ( not ( = ?auto_42054 ?auto_42053 ) ) ( not ( = ?auto_42056 ?auto_42053 ) ) ( not ( = ?auto_42055 ?auto_42053 ) ) ( ON ?auto_42051 ?auto_42050 ) ( ON-TABLE ?auto_42053 ) ( ON ?auto_42052 ?auto_42051 ) ( ON ?auto_42055 ?auto_42052 ) ( CLEAR ?auto_42055 ) ( HOLDING ?auto_42056 ) ( CLEAR ?auto_42054 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42054 ?auto_42056 )
      ( MAKE-2PILE ?auto_42050 ?auto_42051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42057 - BLOCK
      ?auto_42058 - BLOCK
    )
    :vars
    (
      ?auto_42060 - BLOCK
      ?auto_42062 - BLOCK
      ?auto_42059 - BLOCK
      ?auto_42063 - BLOCK
      ?auto_42061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42057 ?auto_42058 ) ) ( not ( = ?auto_42057 ?auto_42060 ) ) ( not ( = ?auto_42058 ?auto_42060 ) ) ( ON-TABLE ?auto_42062 ) ( not ( = ?auto_42062 ?auto_42059 ) ) ( not ( = ?auto_42062 ?auto_42063 ) ) ( not ( = ?auto_42062 ?auto_42060 ) ) ( not ( = ?auto_42062 ?auto_42058 ) ) ( not ( = ?auto_42062 ?auto_42057 ) ) ( not ( = ?auto_42059 ?auto_42063 ) ) ( not ( = ?auto_42059 ?auto_42060 ) ) ( not ( = ?auto_42059 ?auto_42058 ) ) ( not ( = ?auto_42059 ?auto_42057 ) ) ( not ( = ?auto_42063 ?auto_42060 ) ) ( not ( = ?auto_42063 ?auto_42058 ) ) ( not ( = ?auto_42063 ?auto_42057 ) ) ( ON ?auto_42057 ?auto_42061 ) ( not ( = ?auto_42057 ?auto_42061 ) ) ( not ( = ?auto_42058 ?auto_42061 ) ) ( not ( = ?auto_42060 ?auto_42061 ) ) ( not ( = ?auto_42062 ?auto_42061 ) ) ( not ( = ?auto_42059 ?auto_42061 ) ) ( not ( = ?auto_42063 ?auto_42061 ) ) ( ON ?auto_42058 ?auto_42057 ) ( ON-TABLE ?auto_42061 ) ( ON ?auto_42060 ?auto_42058 ) ( ON ?auto_42063 ?auto_42060 ) ( CLEAR ?auto_42062 ) ( ON ?auto_42059 ?auto_42063 ) ( CLEAR ?auto_42059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42061 ?auto_42057 ?auto_42058 ?auto_42060 ?auto_42063 )
      ( MAKE-2PILE ?auto_42057 ?auto_42058 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42064 - BLOCK
      ?auto_42065 - BLOCK
    )
    :vars
    (
      ?auto_42067 - BLOCK
      ?auto_42068 - BLOCK
      ?auto_42066 - BLOCK
      ?auto_42069 - BLOCK
      ?auto_42070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42064 ?auto_42065 ) ) ( not ( = ?auto_42064 ?auto_42067 ) ) ( not ( = ?auto_42065 ?auto_42067 ) ) ( not ( = ?auto_42068 ?auto_42066 ) ) ( not ( = ?auto_42068 ?auto_42069 ) ) ( not ( = ?auto_42068 ?auto_42067 ) ) ( not ( = ?auto_42068 ?auto_42065 ) ) ( not ( = ?auto_42068 ?auto_42064 ) ) ( not ( = ?auto_42066 ?auto_42069 ) ) ( not ( = ?auto_42066 ?auto_42067 ) ) ( not ( = ?auto_42066 ?auto_42065 ) ) ( not ( = ?auto_42066 ?auto_42064 ) ) ( not ( = ?auto_42069 ?auto_42067 ) ) ( not ( = ?auto_42069 ?auto_42065 ) ) ( not ( = ?auto_42069 ?auto_42064 ) ) ( ON ?auto_42064 ?auto_42070 ) ( not ( = ?auto_42064 ?auto_42070 ) ) ( not ( = ?auto_42065 ?auto_42070 ) ) ( not ( = ?auto_42067 ?auto_42070 ) ) ( not ( = ?auto_42068 ?auto_42070 ) ) ( not ( = ?auto_42066 ?auto_42070 ) ) ( not ( = ?auto_42069 ?auto_42070 ) ) ( ON ?auto_42065 ?auto_42064 ) ( ON-TABLE ?auto_42070 ) ( ON ?auto_42067 ?auto_42065 ) ( ON ?auto_42069 ?auto_42067 ) ( ON ?auto_42066 ?auto_42069 ) ( CLEAR ?auto_42066 ) ( HOLDING ?auto_42068 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42068 )
      ( MAKE-2PILE ?auto_42064 ?auto_42065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42071 - BLOCK
      ?auto_42072 - BLOCK
    )
    :vars
    (
      ?auto_42076 - BLOCK
      ?auto_42075 - BLOCK
      ?auto_42073 - BLOCK
      ?auto_42077 - BLOCK
      ?auto_42074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42071 ?auto_42072 ) ) ( not ( = ?auto_42071 ?auto_42076 ) ) ( not ( = ?auto_42072 ?auto_42076 ) ) ( not ( = ?auto_42075 ?auto_42073 ) ) ( not ( = ?auto_42075 ?auto_42077 ) ) ( not ( = ?auto_42075 ?auto_42076 ) ) ( not ( = ?auto_42075 ?auto_42072 ) ) ( not ( = ?auto_42075 ?auto_42071 ) ) ( not ( = ?auto_42073 ?auto_42077 ) ) ( not ( = ?auto_42073 ?auto_42076 ) ) ( not ( = ?auto_42073 ?auto_42072 ) ) ( not ( = ?auto_42073 ?auto_42071 ) ) ( not ( = ?auto_42077 ?auto_42076 ) ) ( not ( = ?auto_42077 ?auto_42072 ) ) ( not ( = ?auto_42077 ?auto_42071 ) ) ( ON ?auto_42071 ?auto_42074 ) ( not ( = ?auto_42071 ?auto_42074 ) ) ( not ( = ?auto_42072 ?auto_42074 ) ) ( not ( = ?auto_42076 ?auto_42074 ) ) ( not ( = ?auto_42075 ?auto_42074 ) ) ( not ( = ?auto_42073 ?auto_42074 ) ) ( not ( = ?auto_42077 ?auto_42074 ) ) ( ON ?auto_42072 ?auto_42071 ) ( ON-TABLE ?auto_42074 ) ( ON ?auto_42076 ?auto_42072 ) ( ON ?auto_42077 ?auto_42076 ) ( ON ?auto_42073 ?auto_42077 ) ( ON ?auto_42075 ?auto_42073 ) ( CLEAR ?auto_42075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42074 ?auto_42071 ?auto_42072 ?auto_42076 ?auto_42077 ?auto_42073 )
      ( MAKE-2PILE ?auto_42071 ?auto_42072 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42081 - BLOCK
      ?auto_42082 - BLOCK
      ?auto_42083 - BLOCK
    )
    :vars
    (
      ?auto_42084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42084 ?auto_42083 ) ( CLEAR ?auto_42084 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42081 ) ( ON ?auto_42082 ?auto_42081 ) ( ON ?auto_42083 ?auto_42082 ) ( not ( = ?auto_42081 ?auto_42082 ) ) ( not ( = ?auto_42081 ?auto_42083 ) ) ( not ( = ?auto_42081 ?auto_42084 ) ) ( not ( = ?auto_42082 ?auto_42083 ) ) ( not ( = ?auto_42082 ?auto_42084 ) ) ( not ( = ?auto_42083 ?auto_42084 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42084 ?auto_42083 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42085 - BLOCK
      ?auto_42086 - BLOCK
      ?auto_42087 - BLOCK
    )
    :vars
    (
      ?auto_42088 - BLOCK
      ?auto_42089 - BLOCK
      ?auto_42090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42088 ?auto_42087 ) ( CLEAR ?auto_42088 ) ( ON-TABLE ?auto_42085 ) ( ON ?auto_42086 ?auto_42085 ) ( ON ?auto_42087 ?auto_42086 ) ( not ( = ?auto_42085 ?auto_42086 ) ) ( not ( = ?auto_42085 ?auto_42087 ) ) ( not ( = ?auto_42085 ?auto_42088 ) ) ( not ( = ?auto_42086 ?auto_42087 ) ) ( not ( = ?auto_42086 ?auto_42088 ) ) ( not ( = ?auto_42087 ?auto_42088 ) ) ( HOLDING ?auto_42089 ) ( CLEAR ?auto_42090 ) ( not ( = ?auto_42085 ?auto_42089 ) ) ( not ( = ?auto_42085 ?auto_42090 ) ) ( not ( = ?auto_42086 ?auto_42089 ) ) ( not ( = ?auto_42086 ?auto_42090 ) ) ( not ( = ?auto_42087 ?auto_42089 ) ) ( not ( = ?auto_42087 ?auto_42090 ) ) ( not ( = ?auto_42088 ?auto_42089 ) ) ( not ( = ?auto_42088 ?auto_42090 ) ) ( not ( = ?auto_42089 ?auto_42090 ) ) )
    :subtasks
    ( ( !STACK ?auto_42089 ?auto_42090 )
      ( MAKE-3PILE ?auto_42085 ?auto_42086 ?auto_42087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42091 - BLOCK
      ?auto_42092 - BLOCK
      ?auto_42093 - BLOCK
    )
    :vars
    (
      ?auto_42096 - BLOCK
      ?auto_42094 - BLOCK
      ?auto_42095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42096 ?auto_42093 ) ( ON-TABLE ?auto_42091 ) ( ON ?auto_42092 ?auto_42091 ) ( ON ?auto_42093 ?auto_42092 ) ( not ( = ?auto_42091 ?auto_42092 ) ) ( not ( = ?auto_42091 ?auto_42093 ) ) ( not ( = ?auto_42091 ?auto_42096 ) ) ( not ( = ?auto_42092 ?auto_42093 ) ) ( not ( = ?auto_42092 ?auto_42096 ) ) ( not ( = ?auto_42093 ?auto_42096 ) ) ( CLEAR ?auto_42094 ) ( not ( = ?auto_42091 ?auto_42095 ) ) ( not ( = ?auto_42091 ?auto_42094 ) ) ( not ( = ?auto_42092 ?auto_42095 ) ) ( not ( = ?auto_42092 ?auto_42094 ) ) ( not ( = ?auto_42093 ?auto_42095 ) ) ( not ( = ?auto_42093 ?auto_42094 ) ) ( not ( = ?auto_42096 ?auto_42095 ) ) ( not ( = ?auto_42096 ?auto_42094 ) ) ( not ( = ?auto_42095 ?auto_42094 ) ) ( ON ?auto_42095 ?auto_42096 ) ( CLEAR ?auto_42095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42091 ?auto_42092 ?auto_42093 ?auto_42096 )
      ( MAKE-3PILE ?auto_42091 ?auto_42092 ?auto_42093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42097 - BLOCK
      ?auto_42098 - BLOCK
      ?auto_42099 - BLOCK
    )
    :vars
    (
      ?auto_42100 - BLOCK
      ?auto_42102 - BLOCK
      ?auto_42101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42100 ?auto_42099 ) ( ON-TABLE ?auto_42097 ) ( ON ?auto_42098 ?auto_42097 ) ( ON ?auto_42099 ?auto_42098 ) ( not ( = ?auto_42097 ?auto_42098 ) ) ( not ( = ?auto_42097 ?auto_42099 ) ) ( not ( = ?auto_42097 ?auto_42100 ) ) ( not ( = ?auto_42098 ?auto_42099 ) ) ( not ( = ?auto_42098 ?auto_42100 ) ) ( not ( = ?auto_42099 ?auto_42100 ) ) ( not ( = ?auto_42097 ?auto_42102 ) ) ( not ( = ?auto_42097 ?auto_42101 ) ) ( not ( = ?auto_42098 ?auto_42102 ) ) ( not ( = ?auto_42098 ?auto_42101 ) ) ( not ( = ?auto_42099 ?auto_42102 ) ) ( not ( = ?auto_42099 ?auto_42101 ) ) ( not ( = ?auto_42100 ?auto_42102 ) ) ( not ( = ?auto_42100 ?auto_42101 ) ) ( not ( = ?auto_42102 ?auto_42101 ) ) ( ON ?auto_42102 ?auto_42100 ) ( CLEAR ?auto_42102 ) ( HOLDING ?auto_42101 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42101 )
      ( MAKE-3PILE ?auto_42097 ?auto_42098 ?auto_42099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42103 - BLOCK
      ?auto_42104 - BLOCK
      ?auto_42105 - BLOCK
    )
    :vars
    (
      ?auto_42108 - BLOCK
      ?auto_42107 - BLOCK
      ?auto_42106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42108 ?auto_42105 ) ( ON-TABLE ?auto_42103 ) ( ON ?auto_42104 ?auto_42103 ) ( ON ?auto_42105 ?auto_42104 ) ( not ( = ?auto_42103 ?auto_42104 ) ) ( not ( = ?auto_42103 ?auto_42105 ) ) ( not ( = ?auto_42103 ?auto_42108 ) ) ( not ( = ?auto_42104 ?auto_42105 ) ) ( not ( = ?auto_42104 ?auto_42108 ) ) ( not ( = ?auto_42105 ?auto_42108 ) ) ( not ( = ?auto_42103 ?auto_42107 ) ) ( not ( = ?auto_42103 ?auto_42106 ) ) ( not ( = ?auto_42104 ?auto_42107 ) ) ( not ( = ?auto_42104 ?auto_42106 ) ) ( not ( = ?auto_42105 ?auto_42107 ) ) ( not ( = ?auto_42105 ?auto_42106 ) ) ( not ( = ?auto_42108 ?auto_42107 ) ) ( not ( = ?auto_42108 ?auto_42106 ) ) ( not ( = ?auto_42107 ?auto_42106 ) ) ( ON ?auto_42107 ?auto_42108 ) ( ON ?auto_42106 ?auto_42107 ) ( CLEAR ?auto_42106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42103 ?auto_42104 ?auto_42105 ?auto_42108 ?auto_42107 )
      ( MAKE-3PILE ?auto_42103 ?auto_42104 ?auto_42105 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42109 - BLOCK
      ?auto_42110 - BLOCK
      ?auto_42111 - BLOCK
    )
    :vars
    (
      ?auto_42113 - BLOCK
      ?auto_42112 - BLOCK
      ?auto_42114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42113 ?auto_42111 ) ( ON-TABLE ?auto_42109 ) ( ON ?auto_42110 ?auto_42109 ) ( ON ?auto_42111 ?auto_42110 ) ( not ( = ?auto_42109 ?auto_42110 ) ) ( not ( = ?auto_42109 ?auto_42111 ) ) ( not ( = ?auto_42109 ?auto_42113 ) ) ( not ( = ?auto_42110 ?auto_42111 ) ) ( not ( = ?auto_42110 ?auto_42113 ) ) ( not ( = ?auto_42111 ?auto_42113 ) ) ( not ( = ?auto_42109 ?auto_42112 ) ) ( not ( = ?auto_42109 ?auto_42114 ) ) ( not ( = ?auto_42110 ?auto_42112 ) ) ( not ( = ?auto_42110 ?auto_42114 ) ) ( not ( = ?auto_42111 ?auto_42112 ) ) ( not ( = ?auto_42111 ?auto_42114 ) ) ( not ( = ?auto_42113 ?auto_42112 ) ) ( not ( = ?auto_42113 ?auto_42114 ) ) ( not ( = ?auto_42112 ?auto_42114 ) ) ( ON ?auto_42112 ?auto_42113 ) ( HOLDING ?auto_42114 ) ( CLEAR ?auto_42112 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42109 ?auto_42110 ?auto_42111 ?auto_42113 ?auto_42112 ?auto_42114 )
      ( MAKE-3PILE ?auto_42109 ?auto_42110 ?auto_42111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42115 - BLOCK
      ?auto_42116 - BLOCK
      ?auto_42117 - BLOCK
    )
    :vars
    (
      ?auto_42119 - BLOCK
      ?auto_42120 - BLOCK
      ?auto_42118 - BLOCK
      ?auto_42121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42119 ?auto_42117 ) ( ON-TABLE ?auto_42115 ) ( ON ?auto_42116 ?auto_42115 ) ( ON ?auto_42117 ?auto_42116 ) ( not ( = ?auto_42115 ?auto_42116 ) ) ( not ( = ?auto_42115 ?auto_42117 ) ) ( not ( = ?auto_42115 ?auto_42119 ) ) ( not ( = ?auto_42116 ?auto_42117 ) ) ( not ( = ?auto_42116 ?auto_42119 ) ) ( not ( = ?auto_42117 ?auto_42119 ) ) ( not ( = ?auto_42115 ?auto_42120 ) ) ( not ( = ?auto_42115 ?auto_42118 ) ) ( not ( = ?auto_42116 ?auto_42120 ) ) ( not ( = ?auto_42116 ?auto_42118 ) ) ( not ( = ?auto_42117 ?auto_42120 ) ) ( not ( = ?auto_42117 ?auto_42118 ) ) ( not ( = ?auto_42119 ?auto_42120 ) ) ( not ( = ?auto_42119 ?auto_42118 ) ) ( not ( = ?auto_42120 ?auto_42118 ) ) ( ON ?auto_42120 ?auto_42119 ) ( CLEAR ?auto_42120 ) ( ON ?auto_42118 ?auto_42121 ) ( CLEAR ?auto_42118 ) ( HAND-EMPTY ) ( not ( = ?auto_42115 ?auto_42121 ) ) ( not ( = ?auto_42116 ?auto_42121 ) ) ( not ( = ?auto_42117 ?auto_42121 ) ) ( not ( = ?auto_42119 ?auto_42121 ) ) ( not ( = ?auto_42120 ?auto_42121 ) ) ( not ( = ?auto_42118 ?auto_42121 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42118 ?auto_42121 )
      ( MAKE-3PILE ?auto_42115 ?auto_42116 ?auto_42117 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42122 - BLOCK
      ?auto_42123 - BLOCK
      ?auto_42124 - BLOCK
    )
    :vars
    (
      ?auto_42128 - BLOCK
      ?auto_42125 - BLOCK
      ?auto_42126 - BLOCK
      ?auto_42127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42128 ?auto_42124 ) ( ON-TABLE ?auto_42122 ) ( ON ?auto_42123 ?auto_42122 ) ( ON ?auto_42124 ?auto_42123 ) ( not ( = ?auto_42122 ?auto_42123 ) ) ( not ( = ?auto_42122 ?auto_42124 ) ) ( not ( = ?auto_42122 ?auto_42128 ) ) ( not ( = ?auto_42123 ?auto_42124 ) ) ( not ( = ?auto_42123 ?auto_42128 ) ) ( not ( = ?auto_42124 ?auto_42128 ) ) ( not ( = ?auto_42122 ?auto_42125 ) ) ( not ( = ?auto_42122 ?auto_42126 ) ) ( not ( = ?auto_42123 ?auto_42125 ) ) ( not ( = ?auto_42123 ?auto_42126 ) ) ( not ( = ?auto_42124 ?auto_42125 ) ) ( not ( = ?auto_42124 ?auto_42126 ) ) ( not ( = ?auto_42128 ?auto_42125 ) ) ( not ( = ?auto_42128 ?auto_42126 ) ) ( not ( = ?auto_42125 ?auto_42126 ) ) ( ON ?auto_42126 ?auto_42127 ) ( CLEAR ?auto_42126 ) ( not ( = ?auto_42122 ?auto_42127 ) ) ( not ( = ?auto_42123 ?auto_42127 ) ) ( not ( = ?auto_42124 ?auto_42127 ) ) ( not ( = ?auto_42128 ?auto_42127 ) ) ( not ( = ?auto_42125 ?auto_42127 ) ) ( not ( = ?auto_42126 ?auto_42127 ) ) ( HOLDING ?auto_42125 ) ( CLEAR ?auto_42128 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42122 ?auto_42123 ?auto_42124 ?auto_42128 ?auto_42125 )
      ( MAKE-3PILE ?auto_42122 ?auto_42123 ?auto_42124 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42129 - BLOCK
      ?auto_42130 - BLOCK
      ?auto_42131 - BLOCK
    )
    :vars
    (
      ?auto_42132 - BLOCK
      ?auto_42135 - BLOCK
      ?auto_42134 - BLOCK
      ?auto_42133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42132 ?auto_42131 ) ( ON-TABLE ?auto_42129 ) ( ON ?auto_42130 ?auto_42129 ) ( ON ?auto_42131 ?auto_42130 ) ( not ( = ?auto_42129 ?auto_42130 ) ) ( not ( = ?auto_42129 ?auto_42131 ) ) ( not ( = ?auto_42129 ?auto_42132 ) ) ( not ( = ?auto_42130 ?auto_42131 ) ) ( not ( = ?auto_42130 ?auto_42132 ) ) ( not ( = ?auto_42131 ?auto_42132 ) ) ( not ( = ?auto_42129 ?auto_42135 ) ) ( not ( = ?auto_42129 ?auto_42134 ) ) ( not ( = ?auto_42130 ?auto_42135 ) ) ( not ( = ?auto_42130 ?auto_42134 ) ) ( not ( = ?auto_42131 ?auto_42135 ) ) ( not ( = ?auto_42131 ?auto_42134 ) ) ( not ( = ?auto_42132 ?auto_42135 ) ) ( not ( = ?auto_42132 ?auto_42134 ) ) ( not ( = ?auto_42135 ?auto_42134 ) ) ( ON ?auto_42134 ?auto_42133 ) ( not ( = ?auto_42129 ?auto_42133 ) ) ( not ( = ?auto_42130 ?auto_42133 ) ) ( not ( = ?auto_42131 ?auto_42133 ) ) ( not ( = ?auto_42132 ?auto_42133 ) ) ( not ( = ?auto_42135 ?auto_42133 ) ) ( not ( = ?auto_42134 ?auto_42133 ) ) ( CLEAR ?auto_42132 ) ( ON ?auto_42135 ?auto_42134 ) ( CLEAR ?auto_42135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42133 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42133 ?auto_42134 )
      ( MAKE-3PILE ?auto_42129 ?auto_42130 ?auto_42131 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42150 - BLOCK
      ?auto_42151 - BLOCK
      ?auto_42152 - BLOCK
    )
    :vars
    (
      ?auto_42154 - BLOCK
      ?auto_42156 - BLOCK
      ?auto_42155 - BLOCK
      ?auto_42153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42150 ) ( ON ?auto_42151 ?auto_42150 ) ( not ( = ?auto_42150 ?auto_42151 ) ) ( not ( = ?auto_42150 ?auto_42152 ) ) ( not ( = ?auto_42150 ?auto_42154 ) ) ( not ( = ?auto_42151 ?auto_42152 ) ) ( not ( = ?auto_42151 ?auto_42154 ) ) ( not ( = ?auto_42152 ?auto_42154 ) ) ( not ( = ?auto_42150 ?auto_42156 ) ) ( not ( = ?auto_42150 ?auto_42155 ) ) ( not ( = ?auto_42151 ?auto_42156 ) ) ( not ( = ?auto_42151 ?auto_42155 ) ) ( not ( = ?auto_42152 ?auto_42156 ) ) ( not ( = ?auto_42152 ?auto_42155 ) ) ( not ( = ?auto_42154 ?auto_42156 ) ) ( not ( = ?auto_42154 ?auto_42155 ) ) ( not ( = ?auto_42156 ?auto_42155 ) ) ( ON ?auto_42155 ?auto_42153 ) ( not ( = ?auto_42150 ?auto_42153 ) ) ( not ( = ?auto_42151 ?auto_42153 ) ) ( not ( = ?auto_42152 ?auto_42153 ) ) ( not ( = ?auto_42154 ?auto_42153 ) ) ( not ( = ?auto_42156 ?auto_42153 ) ) ( not ( = ?auto_42155 ?auto_42153 ) ) ( ON ?auto_42156 ?auto_42155 ) ( ON-TABLE ?auto_42153 ) ( ON ?auto_42154 ?auto_42156 ) ( CLEAR ?auto_42154 ) ( HOLDING ?auto_42152 ) ( CLEAR ?auto_42151 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42150 ?auto_42151 ?auto_42152 ?auto_42154 )
      ( MAKE-3PILE ?auto_42150 ?auto_42151 ?auto_42152 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42157 - BLOCK
      ?auto_42158 - BLOCK
      ?auto_42159 - BLOCK
    )
    :vars
    (
      ?auto_42162 - BLOCK
      ?auto_42160 - BLOCK
      ?auto_42161 - BLOCK
      ?auto_42163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42157 ) ( ON ?auto_42158 ?auto_42157 ) ( not ( = ?auto_42157 ?auto_42158 ) ) ( not ( = ?auto_42157 ?auto_42159 ) ) ( not ( = ?auto_42157 ?auto_42162 ) ) ( not ( = ?auto_42158 ?auto_42159 ) ) ( not ( = ?auto_42158 ?auto_42162 ) ) ( not ( = ?auto_42159 ?auto_42162 ) ) ( not ( = ?auto_42157 ?auto_42160 ) ) ( not ( = ?auto_42157 ?auto_42161 ) ) ( not ( = ?auto_42158 ?auto_42160 ) ) ( not ( = ?auto_42158 ?auto_42161 ) ) ( not ( = ?auto_42159 ?auto_42160 ) ) ( not ( = ?auto_42159 ?auto_42161 ) ) ( not ( = ?auto_42162 ?auto_42160 ) ) ( not ( = ?auto_42162 ?auto_42161 ) ) ( not ( = ?auto_42160 ?auto_42161 ) ) ( ON ?auto_42161 ?auto_42163 ) ( not ( = ?auto_42157 ?auto_42163 ) ) ( not ( = ?auto_42158 ?auto_42163 ) ) ( not ( = ?auto_42159 ?auto_42163 ) ) ( not ( = ?auto_42162 ?auto_42163 ) ) ( not ( = ?auto_42160 ?auto_42163 ) ) ( not ( = ?auto_42161 ?auto_42163 ) ) ( ON ?auto_42160 ?auto_42161 ) ( ON-TABLE ?auto_42163 ) ( ON ?auto_42162 ?auto_42160 ) ( CLEAR ?auto_42158 ) ( ON ?auto_42159 ?auto_42162 ) ( CLEAR ?auto_42159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42163 ?auto_42161 ?auto_42160 ?auto_42162 )
      ( MAKE-3PILE ?auto_42157 ?auto_42158 ?auto_42159 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42164 - BLOCK
      ?auto_42165 - BLOCK
      ?auto_42166 - BLOCK
    )
    :vars
    (
      ?auto_42169 - BLOCK
      ?auto_42167 - BLOCK
      ?auto_42168 - BLOCK
      ?auto_42170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42164 ) ( not ( = ?auto_42164 ?auto_42165 ) ) ( not ( = ?auto_42164 ?auto_42166 ) ) ( not ( = ?auto_42164 ?auto_42169 ) ) ( not ( = ?auto_42165 ?auto_42166 ) ) ( not ( = ?auto_42165 ?auto_42169 ) ) ( not ( = ?auto_42166 ?auto_42169 ) ) ( not ( = ?auto_42164 ?auto_42167 ) ) ( not ( = ?auto_42164 ?auto_42168 ) ) ( not ( = ?auto_42165 ?auto_42167 ) ) ( not ( = ?auto_42165 ?auto_42168 ) ) ( not ( = ?auto_42166 ?auto_42167 ) ) ( not ( = ?auto_42166 ?auto_42168 ) ) ( not ( = ?auto_42169 ?auto_42167 ) ) ( not ( = ?auto_42169 ?auto_42168 ) ) ( not ( = ?auto_42167 ?auto_42168 ) ) ( ON ?auto_42168 ?auto_42170 ) ( not ( = ?auto_42164 ?auto_42170 ) ) ( not ( = ?auto_42165 ?auto_42170 ) ) ( not ( = ?auto_42166 ?auto_42170 ) ) ( not ( = ?auto_42169 ?auto_42170 ) ) ( not ( = ?auto_42167 ?auto_42170 ) ) ( not ( = ?auto_42168 ?auto_42170 ) ) ( ON ?auto_42167 ?auto_42168 ) ( ON-TABLE ?auto_42170 ) ( ON ?auto_42169 ?auto_42167 ) ( ON ?auto_42166 ?auto_42169 ) ( CLEAR ?auto_42166 ) ( HOLDING ?auto_42165 ) ( CLEAR ?auto_42164 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42164 ?auto_42165 )
      ( MAKE-3PILE ?auto_42164 ?auto_42165 ?auto_42166 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42171 - BLOCK
      ?auto_42172 - BLOCK
      ?auto_42173 - BLOCK
    )
    :vars
    (
      ?auto_42175 - BLOCK
      ?auto_42174 - BLOCK
      ?auto_42176 - BLOCK
      ?auto_42177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42171 ) ( not ( = ?auto_42171 ?auto_42172 ) ) ( not ( = ?auto_42171 ?auto_42173 ) ) ( not ( = ?auto_42171 ?auto_42175 ) ) ( not ( = ?auto_42172 ?auto_42173 ) ) ( not ( = ?auto_42172 ?auto_42175 ) ) ( not ( = ?auto_42173 ?auto_42175 ) ) ( not ( = ?auto_42171 ?auto_42174 ) ) ( not ( = ?auto_42171 ?auto_42176 ) ) ( not ( = ?auto_42172 ?auto_42174 ) ) ( not ( = ?auto_42172 ?auto_42176 ) ) ( not ( = ?auto_42173 ?auto_42174 ) ) ( not ( = ?auto_42173 ?auto_42176 ) ) ( not ( = ?auto_42175 ?auto_42174 ) ) ( not ( = ?auto_42175 ?auto_42176 ) ) ( not ( = ?auto_42174 ?auto_42176 ) ) ( ON ?auto_42176 ?auto_42177 ) ( not ( = ?auto_42171 ?auto_42177 ) ) ( not ( = ?auto_42172 ?auto_42177 ) ) ( not ( = ?auto_42173 ?auto_42177 ) ) ( not ( = ?auto_42175 ?auto_42177 ) ) ( not ( = ?auto_42174 ?auto_42177 ) ) ( not ( = ?auto_42176 ?auto_42177 ) ) ( ON ?auto_42174 ?auto_42176 ) ( ON-TABLE ?auto_42177 ) ( ON ?auto_42175 ?auto_42174 ) ( ON ?auto_42173 ?auto_42175 ) ( CLEAR ?auto_42171 ) ( ON ?auto_42172 ?auto_42173 ) ( CLEAR ?auto_42172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42177 ?auto_42176 ?auto_42174 ?auto_42175 ?auto_42173 )
      ( MAKE-3PILE ?auto_42171 ?auto_42172 ?auto_42173 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42178 - BLOCK
      ?auto_42179 - BLOCK
      ?auto_42180 - BLOCK
    )
    :vars
    (
      ?auto_42182 - BLOCK
      ?auto_42183 - BLOCK
      ?auto_42181 - BLOCK
      ?auto_42184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42178 ?auto_42179 ) ) ( not ( = ?auto_42178 ?auto_42180 ) ) ( not ( = ?auto_42178 ?auto_42182 ) ) ( not ( = ?auto_42179 ?auto_42180 ) ) ( not ( = ?auto_42179 ?auto_42182 ) ) ( not ( = ?auto_42180 ?auto_42182 ) ) ( not ( = ?auto_42178 ?auto_42183 ) ) ( not ( = ?auto_42178 ?auto_42181 ) ) ( not ( = ?auto_42179 ?auto_42183 ) ) ( not ( = ?auto_42179 ?auto_42181 ) ) ( not ( = ?auto_42180 ?auto_42183 ) ) ( not ( = ?auto_42180 ?auto_42181 ) ) ( not ( = ?auto_42182 ?auto_42183 ) ) ( not ( = ?auto_42182 ?auto_42181 ) ) ( not ( = ?auto_42183 ?auto_42181 ) ) ( ON ?auto_42181 ?auto_42184 ) ( not ( = ?auto_42178 ?auto_42184 ) ) ( not ( = ?auto_42179 ?auto_42184 ) ) ( not ( = ?auto_42180 ?auto_42184 ) ) ( not ( = ?auto_42182 ?auto_42184 ) ) ( not ( = ?auto_42183 ?auto_42184 ) ) ( not ( = ?auto_42181 ?auto_42184 ) ) ( ON ?auto_42183 ?auto_42181 ) ( ON-TABLE ?auto_42184 ) ( ON ?auto_42182 ?auto_42183 ) ( ON ?auto_42180 ?auto_42182 ) ( ON ?auto_42179 ?auto_42180 ) ( CLEAR ?auto_42179 ) ( HOLDING ?auto_42178 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42178 )
      ( MAKE-3PILE ?auto_42178 ?auto_42179 ?auto_42180 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42185 - BLOCK
      ?auto_42186 - BLOCK
      ?auto_42187 - BLOCK
    )
    :vars
    (
      ?auto_42190 - BLOCK
      ?auto_42191 - BLOCK
      ?auto_42188 - BLOCK
      ?auto_42189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42185 ?auto_42186 ) ) ( not ( = ?auto_42185 ?auto_42187 ) ) ( not ( = ?auto_42185 ?auto_42190 ) ) ( not ( = ?auto_42186 ?auto_42187 ) ) ( not ( = ?auto_42186 ?auto_42190 ) ) ( not ( = ?auto_42187 ?auto_42190 ) ) ( not ( = ?auto_42185 ?auto_42191 ) ) ( not ( = ?auto_42185 ?auto_42188 ) ) ( not ( = ?auto_42186 ?auto_42191 ) ) ( not ( = ?auto_42186 ?auto_42188 ) ) ( not ( = ?auto_42187 ?auto_42191 ) ) ( not ( = ?auto_42187 ?auto_42188 ) ) ( not ( = ?auto_42190 ?auto_42191 ) ) ( not ( = ?auto_42190 ?auto_42188 ) ) ( not ( = ?auto_42191 ?auto_42188 ) ) ( ON ?auto_42188 ?auto_42189 ) ( not ( = ?auto_42185 ?auto_42189 ) ) ( not ( = ?auto_42186 ?auto_42189 ) ) ( not ( = ?auto_42187 ?auto_42189 ) ) ( not ( = ?auto_42190 ?auto_42189 ) ) ( not ( = ?auto_42191 ?auto_42189 ) ) ( not ( = ?auto_42188 ?auto_42189 ) ) ( ON ?auto_42191 ?auto_42188 ) ( ON-TABLE ?auto_42189 ) ( ON ?auto_42190 ?auto_42191 ) ( ON ?auto_42187 ?auto_42190 ) ( ON ?auto_42186 ?auto_42187 ) ( ON ?auto_42185 ?auto_42186 ) ( CLEAR ?auto_42185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42189 ?auto_42188 ?auto_42191 ?auto_42190 ?auto_42187 ?auto_42186 )
      ( MAKE-3PILE ?auto_42185 ?auto_42186 ?auto_42187 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42195 - BLOCK
      ?auto_42196 - BLOCK
      ?auto_42197 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_42197 ) ( CLEAR ?auto_42196 ) ( ON-TABLE ?auto_42195 ) ( ON ?auto_42196 ?auto_42195 ) ( not ( = ?auto_42195 ?auto_42196 ) ) ( not ( = ?auto_42195 ?auto_42197 ) ) ( not ( = ?auto_42196 ?auto_42197 ) ) )
    :subtasks
    ( ( !STACK ?auto_42197 ?auto_42196 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42198 - BLOCK
      ?auto_42199 - BLOCK
      ?auto_42200 - BLOCK
    )
    :vars
    (
      ?auto_42201 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42199 ) ( ON-TABLE ?auto_42198 ) ( ON ?auto_42199 ?auto_42198 ) ( not ( = ?auto_42198 ?auto_42199 ) ) ( not ( = ?auto_42198 ?auto_42200 ) ) ( not ( = ?auto_42199 ?auto_42200 ) ) ( ON ?auto_42200 ?auto_42201 ) ( CLEAR ?auto_42200 ) ( HAND-EMPTY ) ( not ( = ?auto_42198 ?auto_42201 ) ) ( not ( = ?auto_42199 ?auto_42201 ) ) ( not ( = ?auto_42200 ?auto_42201 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42200 ?auto_42201 )
      ( MAKE-3PILE ?auto_42198 ?auto_42199 ?auto_42200 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42202 - BLOCK
      ?auto_42203 - BLOCK
      ?auto_42204 - BLOCK
    )
    :vars
    (
      ?auto_42205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42202 ) ( not ( = ?auto_42202 ?auto_42203 ) ) ( not ( = ?auto_42202 ?auto_42204 ) ) ( not ( = ?auto_42203 ?auto_42204 ) ) ( ON ?auto_42204 ?auto_42205 ) ( CLEAR ?auto_42204 ) ( not ( = ?auto_42202 ?auto_42205 ) ) ( not ( = ?auto_42203 ?auto_42205 ) ) ( not ( = ?auto_42204 ?auto_42205 ) ) ( HOLDING ?auto_42203 ) ( CLEAR ?auto_42202 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42202 ?auto_42203 )
      ( MAKE-3PILE ?auto_42202 ?auto_42203 ?auto_42204 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42206 - BLOCK
      ?auto_42207 - BLOCK
      ?auto_42208 - BLOCK
    )
    :vars
    (
      ?auto_42209 - BLOCK
      ?auto_42210 - BLOCK
      ?auto_42211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42206 ) ( not ( = ?auto_42206 ?auto_42207 ) ) ( not ( = ?auto_42206 ?auto_42208 ) ) ( not ( = ?auto_42207 ?auto_42208 ) ) ( ON ?auto_42208 ?auto_42209 ) ( not ( = ?auto_42206 ?auto_42209 ) ) ( not ( = ?auto_42207 ?auto_42209 ) ) ( not ( = ?auto_42208 ?auto_42209 ) ) ( CLEAR ?auto_42206 ) ( ON ?auto_42207 ?auto_42208 ) ( CLEAR ?auto_42207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42210 ) ( ON ?auto_42211 ?auto_42210 ) ( ON ?auto_42209 ?auto_42211 ) ( not ( = ?auto_42210 ?auto_42211 ) ) ( not ( = ?auto_42210 ?auto_42209 ) ) ( not ( = ?auto_42210 ?auto_42208 ) ) ( not ( = ?auto_42210 ?auto_42207 ) ) ( not ( = ?auto_42211 ?auto_42209 ) ) ( not ( = ?auto_42211 ?auto_42208 ) ) ( not ( = ?auto_42211 ?auto_42207 ) ) ( not ( = ?auto_42206 ?auto_42210 ) ) ( not ( = ?auto_42206 ?auto_42211 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42210 ?auto_42211 ?auto_42209 ?auto_42208 )
      ( MAKE-3PILE ?auto_42206 ?auto_42207 ?auto_42208 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42212 - BLOCK
      ?auto_42213 - BLOCK
      ?auto_42214 - BLOCK
    )
    :vars
    (
      ?auto_42217 - BLOCK
      ?auto_42215 - BLOCK
      ?auto_42216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42212 ?auto_42213 ) ) ( not ( = ?auto_42212 ?auto_42214 ) ) ( not ( = ?auto_42213 ?auto_42214 ) ) ( ON ?auto_42214 ?auto_42217 ) ( not ( = ?auto_42212 ?auto_42217 ) ) ( not ( = ?auto_42213 ?auto_42217 ) ) ( not ( = ?auto_42214 ?auto_42217 ) ) ( ON ?auto_42213 ?auto_42214 ) ( CLEAR ?auto_42213 ) ( ON-TABLE ?auto_42215 ) ( ON ?auto_42216 ?auto_42215 ) ( ON ?auto_42217 ?auto_42216 ) ( not ( = ?auto_42215 ?auto_42216 ) ) ( not ( = ?auto_42215 ?auto_42217 ) ) ( not ( = ?auto_42215 ?auto_42214 ) ) ( not ( = ?auto_42215 ?auto_42213 ) ) ( not ( = ?auto_42216 ?auto_42217 ) ) ( not ( = ?auto_42216 ?auto_42214 ) ) ( not ( = ?auto_42216 ?auto_42213 ) ) ( not ( = ?auto_42212 ?auto_42215 ) ) ( not ( = ?auto_42212 ?auto_42216 ) ) ( HOLDING ?auto_42212 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42212 )
      ( MAKE-3PILE ?auto_42212 ?auto_42213 ?auto_42214 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42218 - BLOCK
      ?auto_42219 - BLOCK
      ?auto_42220 - BLOCK
    )
    :vars
    (
      ?auto_42221 - BLOCK
      ?auto_42223 - BLOCK
      ?auto_42222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42218 ?auto_42219 ) ) ( not ( = ?auto_42218 ?auto_42220 ) ) ( not ( = ?auto_42219 ?auto_42220 ) ) ( ON ?auto_42220 ?auto_42221 ) ( not ( = ?auto_42218 ?auto_42221 ) ) ( not ( = ?auto_42219 ?auto_42221 ) ) ( not ( = ?auto_42220 ?auto_42221 ) ) ( ON ?auto_42219 ?auto_42220 ) ( ON-TABLE ?auto_42223 ) ( ON ?auto_42222 ?auto_42223 ) ( ON ?auto_42221 ?auto_42222 ) ( not ( = ?auto_42223 ?auto_42222 ) ) ( not ( = ?auto_42223 ?auto_42221 ) ) ( not ( = ?auto_42223 ?auto_42220 ) ) ( not ( = ?auto_42223 ?auto_42219 ) ) ( not ( = ?auto_42222 ?auto_42221 ) ) ( not ( = ?auto_42222 ?auto_42220 ) ) ( not ( = ?auto_42222 ?auto_42219 ) ) ( not ( = ?auto_42218 ?auto_42223 ) ) ( not ( = ?auto_42218 ?auto_42222 ) ) ( ON ?auto_42218 ?auto_42219 ) ( CLEAR ?auto_42218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42223 ?auto_42222 ?auto_42221 ?auto_42220 ?auto_42219 )
      ( MAKE-3PILE ?auto_42218 ?auto_42219 ?auto_42220 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42224 - BLOCK
      ?auto_42225 - BLOCK
      ?auto_42226 - BLOCK
    )
    :vars
    (
      ?auto_42227 - BLOCK
      ?auto_42228 - BLOCK
      ?auto_42229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42224 ?auto_42225 ) ) ( not ( = ?auto_42224 ?auto_42226 ) ) ( not ( = ?auto_42225 ?auto_42226 ) ) ( ON ?auto_42226 ?auto_42227 ) ( not ( = ?auto_42224 ?auto_42227 ) ) ( not ( = ?auto_42225 ?auto_42227 ) ) ( not ( = ?auto_42226 ?auto_42227 ) ) ( ON ?auto_42225 ?auto_42226 ) ( ON-TABLE ?auto_42228 ) ( ON ?auto_42229 ?auto_42228 ) ( ON ?auto_42227 ?auto_42229 ) ( not ( = ?auto_42228 ?auto_42229 ) ) ( not ( = ?auto_42228 ?auto_42227 ) ) ( not ( = ?auto_42228 ?auto_42226 ) ) ( not ( = ?auto_42228 ?auto_42225 ) ) ( not ( = ?auto_42229 ?auto_42227 ) ) ( not ( = ?auto_42229 ?auto_42226 ) ) ( not ( = ?auto_42229 ?auto_42225 ) ) ( not ( = ?auto_42224 ?auto_42228 ) ) ( not ( = ?auto_42224 ?auto_42229 ) ) ( HOLDING ?auto_42224 ) ( CLEAR ?auto_42225 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42228 ?auto_42229 ?auto_42227 ?auto_42226 ?auto_42225 ?auto_42224 )
      ( MAKE-3PILE ?auto_42224 ?auto_42225 ?auto_42226 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42230 - BLOCK
      ?auto_42231 - BLOCK
      ?auto_42232 - BLOCK
    )
    :vars
    (
      ?auto_42233 - BLOCK
      ?auto_42235 - BLOCK
      ?auto_42234 - BLOCK
      ?auto_42236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42230 ?auto_42231 ) ) ( not ( = ?auto_42230 ?auto_42232 ) ) ( not ( = ?auto_42231 ?auto_42232 ) ) ( ON ?auto_42232 ?auto_42233 ) ( not ( = ?auto_42230 ?auto_42233 ) ) ( not ( = ?auto_42231 ?auto_42233 ) ) ( not ( = ?auto_42232 ?auto_42233 ) ) ( ON ?auto_42231 ?auto_42232 ) ( ON-TABLE ?auto_42235 ) ( ON ?auto_42234 ?auto_42235 ) ( ON ?auto_42233 ?auto_42234 ) ( not ( = ?auto_42235 ?auto_42234 ) ) ( not ( = ?auto_42235 ?auto_42233 ) ) ( not ( = ?auto_42235 ?auto_42232 ) ) ( not ( = ?auto_42235 ?auto_42231 ) ) ( not ( = ?auto_42234 ?auto_42233 ) ) ( not ( = ?auto_42234 ?auto_42232 ) ) ( not ( = ?auto_42234 ?auto_42231 ) ) ( not ( = ?auto_42230 ?auto_42235 ) ) ( not ( = ?auto_42230 ?auto_42234 ) ) ( CLEAR ?auto_42231 ) ( ON ?auto_42230 ?auto_42236 ) ( CLEAR ?auto_42230 ) ( HAND-EMPTY ) ( not ( = ?auto_42230 ?auto_42236 ) ) ( not ( = ?auto_42231 ?auto_42236 ) ) ( not ( = ?auto_42232 ?auto_42236 ) ) ( not ( = ?auto_42233 ?auto_42236 ) ) ( not ( = ?auto_42235 ?auto_42236 ) ) ( not ( = ?auto_42234 ?auto_42236 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42230 ?auto_42236 )
      ( MAKE-3PILE ?auto_42230 ?auto_42231 ?auto_42232 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42237 - BLOCK
      ?auto_42238 - BLOCK
      ?auto_42239 - BLOCK
    )
    :vars
    (
      ?auto_42241 - BLOCK
      ?auto_42243 - BLOCK
      ?auto_42242 - BLOCK
      ?auto_42240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42237 ?auto_42238 ) ) ( not ( = ?auto_42237 ?auto_42239 ) ) ( not ( = ?auto_42238 ?auto_42239 ) ) ( ON ?auto_42239 ?auto_42241 ) ( not ( = ?auto_42237 ?auto_42241 ) ) ( not ( = ?auto_42238 ?auto_42241 ) ) ( not ( = ?auto_42239 ?auto_42241 ) ) ( ON-TABLE ?auto_42243 ) ( ON ?auto_42242 ?auto_42243 ) ( ON ?auto_42241 ?auto_42242 ) ( not ( = ?auto_42243 ?auto_42242 ) ) ( not ( = ?auto_42243 ?auto_42241 ) ) ( not ( = ?auto_42243 ?auto_42239 ) ) ( not ( = ?auto_42243 ?auto_42238 ) ) ( not ( = ?auto_42242 ?auto_42241 ) ) ( not ( = ?auto_42242 ?auto_42239 ) ) ( not ( = ?auto_42242 ?auto_42238 ) ) ( not ( = ?auto_42237 ?auto_42243 ) ) ( not ( = ?auto_42237 ?auto_42242 ) ) ( ON ?auto_42237 ?auto_42240 ) ( CLEAR ?auto_42237 ) ( not ( = ?auto_42237 ?auto_42240 ) ) ( not ( = ?auto_42238 ?auto_42240 ) ) ( not ( = ?auto_42239 ?auto_42240 ) ) ( not ( = ?auto_42241 ?auto_42240 ) ) ( not ( = ?auto_42243 ?auto_42240 ) ) ( not ( = ?auto_42242 ?auto_42240 ) ) ( HOLDING ?auto_42238 ) ( CLEAR ?auto_42239 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42243 ?auto_42242 ?auto_42241 ?auto_42239 ?auto_42238 )
      ( MAKE-3PILE ?auto_42237 ?auto_42238 ?auto_42239 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42244 - BLOCK
      ?auto_42245 - BLOCK
      ?auto_42246 - BLOCK
    )
    :vars
    (
      ?auto_42247 - BLOCK
      ?auto_42250 - BLOCK
      ?auto_42248 - BLOCK
      ?auto_42249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42244 ?auto_42245 ) ) ( not ( = ?auto_42244 ?auto_42246 ) ) ( not ( = ?auto_42245 ?auto_42246 ) ) ( ON ?auto_42246 ?auto_42247 ) ( not ( = ?auto_42244 ?auto_42247 ) ) ( not ( = ?auto_42245 ?auto_42247 ) ) ( not ( = ?auto_42246 ?auto_42247 ) ) ( ON-TABLE ?auto_42250 ) ( ON ?auto_42248 ?auto_42250 ) ( ON ?auto_42247 ?auto_42248 ) ( not ( = ?auto_42250 ?auto_42248 ) ) ( not ( = ?auto_42250 ?auto_42247 ) ) ( not ( = ?auto_42250 ?auto_42246 ) ) ( not ( = ?auto_42250 ?auto_42245 ) ) ( not ( = ?auto_42248 ?auto_42247 ) ) ( not ( = ?auto_42248 ?auto_42246 ) ) ( not ( = ?auto_42248 ?auto_42245 ) ) ( not ( = ?auto_42244 ?auto_42250 ) ) ( not ( = ?auto_42244 ?auto_42248 ) ) ( ON ?auto_42244 ?auto_42249 ) ( not ( = ?auto_42244 ?auto_42249 ) ) ( not ( = ?auto_42245 ?auto_42249 ) ) ( not ( = ?auto_42246 ?auto_42249 ) ) ( not ( = ?auto_42247 ?auto_42249 ) ) ( not ( = ?auto_42250 ?auto_42249 ) ) ( not ( = ?auto_42248 ?auto_42249 ) ) ( CLEAR ?auto_42246 ) ( ON ?auto_42245 ?auto_42244 ) ( CLEAR ?auto_42245 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42249 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42249 ?auto_42244 )
      ( MAKE-3PILE ?auto_42244 ?auto_42245 ?auto_42246 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42251 - BLOCK
      ?auto_42252 - BLOCK
      ?auto_42253 - BLOCK
    )
    :vars
    (
      ?auto_42254 - BLOCK
      ?auto_42257 - BLOCK
      ?auto_42256 - BLOCK
      ?auto_42255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42251 ?auto_42252 ) ) ( not ( = ?auto_42251 ?auto_42253 ) ) ( not ( = ?auto_42252 ?auto_42253 ) ) ( not ( = ?auto_42251 ?auto_42254 ) ) ( not ( = ?auto_42252 ?auto_42254 ) ) ( not ( = ?auto_42253 ?auto_42254 ) ) ( ON-TABLE ?auto_42257 ) ( ON ?auto_42256 ?auto_42257 ) ( ON ?auto_42254 ?auto_42256 ) ( not ( = ?auto_42257 ?auto_42256 ) ) ( not ( = ?auto_42257 ?auto_42254 ) ) ( not ( = ?auto_42257 ?auto_42253 ) ) ( not ( = ?auto_42257 ?auto_42252 ) ) ( not ( = ?auto_42256 ?auto_42254 ) ) ( not ( = ?auto_42256 ?auto_42253 ) ) ( not ( = ?auto_42256 ?auto_42252 ) ) ( not ( = ?auto_42251 ?auto_42257 ) ) ( not ( = ?auto_42251 ?auto_42256 ) ) ( ON ?auto_42251 ?auto_42255 ) ( not ( = ?auto_42251 ?auto_42255 ) ) ( not ( = ?auto_42252 ?auto_42255 ) ) ( not ( = ?auto_42253 ?auto_42255 ) ) ( not ( = ?auto_42254 ?auto_42255 ) ) ( not ( = ?auto_42257 ?auto_42255 ) ) ( not ( = ?auto_42256 ?auto_42255 ) ) ( ON ?auto_42252 ?auto_42251 ) ( CLEAR ?auto_42252 ) ( ON-TABLE ?auto_42255 ) ( HOLDING ?auto_42253 ) ( CLEAR ?auto_42254 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42257 ?auto_42256 ?auto_42254 ?auto_42253 )
      ( MAKE-3PILE ?auto_42251 ?auto_42252 ?auto_42253 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42258 - BLOCK
      ?auto_42259 - BLOCK
      ?auto_42260 - BLOCK
    )
    :vars
    (
      ?auto_42264 - BLOCK
      ?auto_42261 - BLOCK
      ?auto_42263 - BLOCK
      ?auto_42262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42258 ?auto_42259 ) ) ( not ( = ?auto_42258 ?auto_42260 ) ) ( not ( = ?auto_42259 ?auto_42260 ) ) ( not ( = ?auto_42258 ?auto_42264 ) ) ( not ( = ?auto_42259 ?auto_42264 ) ) ( not ( = ?auto_42260 ?auto_42264 ) ) ( ON-TABLE ?auto_42261 ) ( ON ?auto_42263 ?auto_42261 ) ( ON ?auto_42264 ?auto_42263 ) ( not ( = ?auto_42261 ?auto_42263 ) ) ( not ( = ?auto_42261 ?auto_42264 ) ) ( not ( = ?auto_42261 ?auto_42260 ) ) ( not ( = ?auto_42261 ?auto_42259 ) ) ( not ( = ?auto_42263 ?auto_42264 ) ) ( not ( = ?auto_42263 ?auto_42260 ) ) ( not ( = ?auto_42263 ?auto_42259 ) ) ( not ( = ?auto_42258 ?auto_42261 ) ) ( not ( = ?auto_42258 ?auto_42263 ) ) ( ON ?auto_42258 ?auto_42262 ) ( not ( = ?auto_42258 ?auto_42262 ) ) ( not ( = ?auto_42259 ?auto_42262 ) ) ( not ( = ?auto_42260 ?auto_42262 ) ) ( not ( = ?auto_42264 ?auto_42262 ) ) ( not ( = ?auto_42261 ?auto_42262 ) ) ( not ( = ?auto_42263 ?auto_42262 ) ) ( ON ?auto_42259 ?auto_42258 ) ( ON-TABLE ?auto_42262 ) ( CLEAR ?auto_42264 ) ( ON ?auto_42260 ?auto_42259 ) ( CLEAR ?auto_42260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42262 ?auto_42258 ?auto_42259 )
      ( MAKE-3PILE ?auto_42258 ?auto_42259 ?auto_42260 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42265 - BLOCK
      ?auto_42266 - BLOCK
      ?auto_42267 - BLOCK
    )
    :vars
    (
      ?auto_42269 - BLOCK
      ?auto_42268 - BLOCK
      ?auto_42271 - BLOCK
      ?auto_42270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42265 ?auto_42266 ) ) ( not ( = ?auto_42265 ?auto_42267 ) ) ( not ( = ?auto_42266 ?auto_42267 ) ) ( not ( = ?auto_42265 ?auto_42269 ) ) ( not ( = ?auto_42266 ?auto_42269 ) ) ( not ( = ?auto_42267 ?auto_42269 ) ) ( ON-TABLE ?auto_42268 ) ( ON ?auto_42271 ?auto_42268 ) ( not ( = ?auto_42268 ?auto_42271 ) ) ( not ( = ?auto_42268 ?auto_42269 ) ) ( not ( = ?auto_42268 ?auto_42267 ) ) ( not ( = ?auto_42268 ?auto_42266 ) ) ( not ( = ?auto_42271 ?auto_42269 ) ) ( not ( = ?auto_42271 ?auto_42267 ) ) ( not ( = ?auto_42271 ?auto_42266 ) ) ( not ( = ?auto_42265 ?auto_42268 ) ) ( not ( = ?auto_42265 ?auto_42271 ) ) ( ON ?auto_42265 ?auto_42270 ) ( not ( = ?auto_42265 ?auto_42270 ) ) ( not ( = ?auto_42266 ?auto_42270 ) ) ( not ( = ?auto_42267 ?auto_42270 ) ) ( not ( = ?auto_42269 ?auto_42270 ) ) ( not ( = ?auto_42268 ?auto_42270 ) ) ( not ( = ?auto_42271 ?auto_42270 ) ) ( ON ?auto_42266 ?auto_42265 ) ( ON-TABLE ?auto_42270 ) ( ON ?auto_42267 ?auto_42266 ) ( CLEAR ?auto_42267 ) ( HOLDING ?auto_42269 ) ( CLEAR ?auto_42271 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42268 ?auto_42271 ?auto_42269 )
      ( MAKE-3PILE ?auto_42265 ?auto_42266 ?auto_42267 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42272 - BLOCK
      ?auto_42273 - BLOCK
      ?auto_42274 - BLOCK
    )
    :vars
    (
      ?auto_42277 - BLOCK
      ?auto_42278 - BLOCK
      ?auto_42276 - BLOCK
      ?auto_42275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42272 ?auto_42273 ) ) ( not ( = ?auto_42272 ?auto_42274 ) ) ( not ( = ?auto_42273 ?auto_42274 ) ) ( not ( = ?auto_42272 ?auto_42277 ) ) ( not ( = ?auto_42273 ?auto_42277 ) ) ( not ( = ?auto_42274 ?auto_42277 ) ) ( ON-TABLE ?auto_42278 ) ( ON ?auto_42276 ?auto_42278 ) ( not ( = ?auto_42278 ?auto_42276 ) ) ( not ( = ?auto_42278 ?auto_42277 ) ) ( not ( = ?auto_42278 ?auto_42274 ) ) ( not ( = ?auto_42278 ?auto_42273 ) ) ( not ( = ?auto_42276 ?auto_42277 ) ) ( not ( = ?auto_42276 ?auto_42274 ) ) ( not ( = ?auto_42276 ?auto_42273 ) ) ( not ( = ?auto_42272 ?auto_42278 ) ) ( not ( = ?auto_42272 ?auto_42276 ) ) ( ON ?auto_42272 ?auto_42275 ) ( not ( = ?auto_42272 ?auto_42275 ) ) ( not ( = ?auto_42273 ?auto_42275 ) ) ( not ( = ?auto_42274 ?auto_42275 ) ) ( not ( = ?auto_42277 ?auto_42275 ) ) ( not ( = ?auto_42278 ?auto_42275 ) ) ( not ( = ?auto_42276 ?auto_42275 ) ) ( ON ?auto_42273 ?auto_42272 ) ( ON-TABLE ?auto_42275 ) ( ON ?auto_42274 ?auto_42273 ) ( CLEAR ?auto_42276 ) ( ON ?auto_42277 ?auto_42274 ) ( CLEAR ?auto_42277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42275 ?auto_42272 ?auto_42273 ?auto_42274 )
      ( MAKE-3PILE ?auto_42272 ?auto_42273 ?auto_42274 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42279 - BLOCK
      ?auto_42280 - BLOCK
      ?auto_42281 - BLOCK
    )
    :vars
    (
      ?auto_42284 - BLOCK
      ?auto_42282 - BLOCK
      ?auto_42285 - BLOCK
      ?auto_42283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42279 ?auto_42280 ) ) ( not ( = ?auto_42279 ?auto_42281 ) ) ( not ( = ?auto_42280 ?auto_42281 ) ) ( not ( = ?auto_42279 ?auto_42284 ) ) ( not ( = ?auto_42280 ?auto_42284 ) ) ( not ( = ?auto_42281 ?auto_42284 ) ) ( ON-TABLE ?auto_42282 ) ( not ( = ?auto_42282 ?auto_42285 ) ) ( not ( = ?auto_42282 ?auto_42284 ) ) ( not ( = ?auto_42282 ?auto_42281 ) ) ( not ( = ?auto_42282 ?auto_42280 ) ) ( not ( = ?auto_42285 ?auto_42284 ) ) ( not ( = ?auto_42285 ?auto_42281 ) ) ( not ( = ?auto_42285 ?auto_42280 ) ) ( not ( = ?auto_42279 ?auto_42282 ) ) ( not ( = ?auto_42279 ?auto_42285 ) ) ( ON ?auto_42279 ?auto_42283 ) ( not ( = ?auto_42279 ?auto_42283 ) ) ( not ( = ?auto_42280 ?auto_42283 ) ) ( not ( = ?auto_42281 ?auto_42283 ) ) ( not ( = ?auto_42284 ?auto_42283 ) ) ( not ( = ?auto_42282 ?auto_42283 ) ) ( not ( = ?auto_42285 ?auto_42283 ) ) ( ON ?auto_42280 ?auto_42279 ) ( ON-TABLE ?auto_42283 ) ( ON ?auto_42281 ?auto_42280 ) ( ON ?auto_42284 ?auto_42281 ) ( CLEAR ?auto_42284 ) ( HOLDING ?auto_42285 ) ( CLEAR ?auto_42282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42282 ?auto_42285 )
      ( MAKE-3PILE ?auto_42279 ?auto_42280 ?auto_42281 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42286 - BLOCK
      ?auto_42287 - BLOCK
      ?auto_42288 - BLOCK
    )
    :vars
    (
      ?auto_42292 - BLOCK
      ?auto_42291 - BLOCK
      ?auto_42290 - BLOCK
      ?auto_42289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42286 ?auto_42287 ) ) ( not ( = ?auto_42286 ?auto_42288 ) ) ( not ( = ?auto_42287 ?auto_42288 ) ) ( not ( = ?auto_42286 ?auto_42292 ) ) ( not ( = ?auto_42287 ?auto_42292 ) ) ( not ( = ?auto_42288 ?auto_42292 ) ) ( ON-TABLE ?auto_42291 ) ( not ( = ?auto_42291 ?auto_42290 ) ) ( not ( = ?auto_42291 ?auto_42292 ) ) ( not ( = ?auto_42291 ?auto_42288 ) ) ( not ( = ?auto_42291 ?auto_42287 ) ) ( not ( = ?auto_42290 ?auto_42292 ) ) ( not ( = ?auto_42290 ?auto_42288 ) ) ( not ( = ?auto_42290 ?auto_42287 ) ) ( not ( = ?auto_42286 ?auto_42291 ) ) ( not ( = ?auto_42286 ?auto_42290 ) ) ( ON ?auto_42286 ?auto_42289 ) ( not ( = ?auto_42286 ?auto_42289 ) ) ( not ( = ?auto_42287 ?auto_42289 ) ) ( not ( = ?auto_42288 ?auto_42289 ) ) ( not ( = ?auto_42292 ?auto_42289 ) ) ( not ( = ?auto_42291 ?auto_42289 ) ) ( not ( = ?auto_42290 ?auto_42289 ) ) ( ON ?auto_42287 ?auto_42286 ) ( ON-TABLE ?auto_42289 ) ( ON ?auto_42288 ?auto_42287 ) ( ON ?auto_42292 ?auto_42288 ) ( CLEAR ?auto_42291 ) ( ON ?auto_42290 ?auto_42292 ) ( CLEAR ?auto_42290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42289 ?auto_42286 ?auto_42287 ?auto_42288 ?auto_42292 )
      ( MAKE-3PILE ?auto_42286 ?auto_42287 ?auto_42288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42293 - BLOCK
      ?auto_42294 - BLOCK
      ?auto_42295 - BLOCK
    )
    :vars
    (
      ?auto_42298 - BLOCK
      ?auto_42297 - BLOCK
      ?auto_42299 - BLOCK
      ?auto_42296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42293 ?auto_42294 ) ) ( not ( = ?auto_42293 ?auto_42295 ) ) ( not ( = ?auto_42294 ?auto_42295 ) ) ( not ( = ?auto_42293 ?auto_42298 ) ) ( not ( = ?auto_42294 ?auto_42298 ) ) ( not ( = ?auto_42295 ?auto_42298 ) ) ( not ( = ?auto_42297 ?auto_42299 ) ) ( not ( = ?auto_42297 ?auto_42298 ) ) ( not ( = ?auto_42297 ?auto_42295 ) ) ( not ( = ?auto_42297 ?auto_42294 ) ) ( not ( = ?auto_42299 ?auto_42298 ) ) ( not ( = ?auto_42299 ?auto_42295 ) ) ( not ( = ?auto_42299 ?auto_42294 ) ) ( not ( = ?auto_42293 ?auto_42297 ) ) ( not ( = ?auto_42293 ?auto_42299 ) ) ( ON ?auto_42293 ?auto_42296 ) ( not ( = ?auto_42293 ?auto_42296 ) ) ( not ( = ?auto_42294 ?auto_42296 ) ) ( not ( = ?auto_42295 ?auto_42296 ) ) ( not ( = ?auto_42298 ?auto_42296 ) ) ( not ( = ?auto_42297 ?auto_42296 ) ) ( not ( = ?auto_42299 ?auto_42296 ) ) ( ON ?auto_42294 ?auto_42293 ) ( ON-TABLE ?auto_42296 ) ( ON ?auto_42295 ?auto_42294 ) ( ON ?auto_42298 ?auto_42295 ) ( ON ?auto_42299 ?auto_42298 ) ( CLEAR ?auto_42299 ) ( HOLDING ?auto_42297 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42297 )
      ( MAKE-3PILE ?auto_42293 ?auto_42294 ?auto_42295 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42300 - BLOCK
      ?auto_42301 - BLOCK
      ?auto_42302 - BLOCK
    )
    :vars
    (
      ?auto_42306 - BLOCK
      ?auto_42305 - BLOCK
      ?auto_42303 - BLOCK
      ?auto_42304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42300 ?auto_42301 ) ) ( not ( = ?auto_42300 ?auto_42302 ) ) ( not ( = ?auto_42301 ?auto_42302 ) ) ( not ( = ?auto_42300 ?auto_42306 ) ) ( not ( = ?auto_42301 ?auto_42306 ) ) ( not ( = ?auto_42302 ?auto_42306 ) ) ( not ( = ?auto_42305 ?auto_42303 ) ) ( not ( = ?auto_42305 ?auto_42306 ) ) ( not ( = ?auto_42305 ?auto_42302 ) ) ( not ( = ?auto_42305 ?auto_42301 ) ) ( not ( = ?auto_42303 ?auto_42306 ) ) ( not ( = ?auto_42303 ?auto_42302 ) ) ( not ( = ?auto_42303 ?auto_42301 ) ) ( not ( = ?auto_42300 ?auto_42305 ) ) ( not ( = ?auto_42300 ?auto_42303 ) ) ( ON ?auto_42300 ?auto_42304 ) ( not ( = ?auto_42300 ?auto_42304 ) ) ( not ( = ?auto_42301 ?auto_42304 ) ) ( not ( = ?auto_42302 ?auto_42304 ) ) ( not ( = ?auto_42306 ?auto_42304 ) ) ( not ( = ?auto_42305 ?auto_42304 ) ) ( not ( = ?auto_42303 ?auto_42304 ) ) ( ON ?auto_42301 ?auto_42300 ) ( ON-TABLE ?auto_42304 ) ( ON ?auto_42302 ?auto_42301 ) ( ON ?auto_42306 ?auto_42302 ) ( ON ?auto_42303 ?auto_42306 ) ( ON ?auto_42305 ?auto_42303 ) ( CLEAR ?auto_42305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42304 ?auto_42300 ?auto_42301 ?auto_42302 ?auto_42306 ?auto_42303 )
      ( MAKE-3PILE ?auto_42300 ?auto_42301 ?auto_42302 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42309 - BLOCK
      ?auto_42310 - BLOCK
    )
    :vars
    (
      ?auto_42311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42311 ?auto_42310 ) ( CLEAR ?auto_42311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42309 ) ( ON ?auto_42310 ?auto_42309 ) ( not ( = ?auto_42309 ?auto_42310 ) ) ( not ( = ?auto_42309 ?auto_42311 ) ) ( not ( = ?auto_42310 ?auto_42311 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42311 ?auto_42310 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42312 - BLOCK
      ?auto_42313 - BLOCK
    )
    :vars
    (
      ?auto_42314 - BLOCK
      ?auto_42315 - BLOCK
      ?auto_42316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42314 ?auto_42313 ) ( CLEAR ?auto_42314 ) ( ON-TABLE ?auto_42312 ) ( ON ?auto_42313 ?auto_42312 ) ( not ( = ?auto_42312 ?auto_42313 ) ) ( not ( = ?auto_42312 ?auto_42314 ) ) ( not ( = ?auto_42313 ?auto_42314 ) ) ( HOLDING ?auto_42315 ) ( CLEAR ?auto_42316 ) ( not ( = ?auto_42312 ?auto_42315 ) ) ( not ( = ?auto_42312 ?auto_42316 ) ) ( not ( = ?auto_42313 ?auto_42315 ) ) ( not ( = ?auto_42313 ?auto_42316 ) ) ( not ( = ?auto_42314 ?auto_42315 ) ) ( not ( = ?auto_42314 ?auto_42316 ) ) ( not ( = ?auto_42315 ?auto_42316 ) ) )
    :subtasks
    ( ( !STACK ?auto_42315 ?auto_42316 )
      ( MAKE-2PILE ?auto_42312 ?auto_42313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42317 - BLOCK
      ?auto_42318 - BLOCK
    )
    :vars
    (
      ?auto_42321 - BLOCK
      ?auto_42319 - BLOCK
      ?auto_42320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42321 ?auto_42318 ) ( ON-TABLE ?auto_42317 ) ( ON ?auto_42318 ?auto_42317 ) ( not ( = ?auto_42317 ?auto_42318 ) ) ( not ( = ?auto_42317 ?auto_42321 ) ) ( not ( = ?auto_42318 ?auto_42321 ) ) ( CLEAR ?auto_42319 ) ( not ( = ?auto_42317 ?auto_42320 ) ) ( not ( = ?auto_42317 ?auto_42319 ) ) ( not ( = ?auto_42318 ?auto_42320 ) ) ( not ( = ?auto_42318 ?auto_42319 ) ) ( not ( = ?auto_42321 ?auto_42320 ) ) ( not ( = ?auto_42321 ?auto_42319 ) ) ( not ( = ?auto_42320 ?auto_42319 ) ) ( ON ?auto_42320 ?auto_42321 ) ( CLEAR ?auto_42320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42317 ?auto_42318 ?auto_42321 )
      ( MAKE-2PILE ?auto_42317 ?auto_42318 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42322 - BLOCK
      ?auto_42323 - BLOCK
    )
    :vars
    (
      ?auto_42324 - BLOCK
      ?auto_42325 - BLOCK
      ?auto_42326 - BLOCK
      ?auto_42327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42324 ?auto_42323 ) ( ON-TABLE ?auto_42322 ) ( ON ?auto_42323 ?auto_42322 ) ( not ( = ?auto_42322 ?auto_42323 ) ) ( not ( = ?auto_42322 ?auto_42324 ) ) ( not ( = ?auto_42323 ?auto_42324 ) ) ( not ( = ?auto_42322 ?auto_42325 ) ) ( not ( = ?auto_42322 ?auto_42326 ) ) ( not ( = ?auto_42323 ?auto_42325 ) ) ( not ( = ?auto_42323 ?auto_42326 ) ) ( not ( = ?auto_42324 ?auto_42325 ) ) ( not ( = ?auto_42324 ?auto_42326 ) ) ( not ( = ?auto_42325 ?auto_42326 ) ) ( ON ?auto_42325 ?auto_42324 ) ( CLEAR ?auto_42325 ) ( HOLDING ?auto_42326 ) ( CLEAR ?auto_42327 ) ( ON-TABLE ?auto_42327 ) ( not ( = ?auto_42327 ?auto_42326 ) ) ( not ( = ?auto_42322 ?auto_42327 ) ) ( not ( = ?auto_42323 ?auto_42327 ) ) ( not ( = ?auto_42324 ?auto_42327 ) ) ( not ( = ?auto_42325 ?auto_42327 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42327 ?auto_42326 )
      ( MAKE-2PILE ?auto_42322 ?auto_42323 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42328 - BLOCK
      ?auto_42329 - BLOCK
    )
    :vars
    (
      ?auto_42330 - BLOCK
      ?auto_42333 - BLOCK
      ?auto_42332 - BLOCK
      ?auto_42331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42330 ?auto_42329 ) ( ON-TABLE ?auto_42328 ) ( ON ?auto_42329 ?auto_42328 ) ( not ( = ?auto_42328 ?auto_42329 ) ) ( not ( = ?auto_42328 ?auto_42330 ) ) ( not ( = ?auto_42329 ?auto_42330 ) ) ( not ( = ?auto_42328 ?auto_42333 ) ) ( not ( = ?auto_42328 ?auto_42332 ) ) ( not ( = ?auto_42329 ?auto_42333 ) ) ( not ( = ?auto_42329 ?auto_42332 ) ) ( not ( = ?auto_42330 ?auto_42333 ) ) ( not ( = ?auto_42330 ?auto_42332 ) ) ( not ( = ?auto_42333 ?auto_42332 ) ) ( ON ?auto_42333 ?auto_42330 ) ( CLEAR ?auto_42331 ) ( ON-TABLE ?auto_42331 ) ( not ( = ?auto_42331 ?auto_42332 ) ) ( not ( = ?auto_42328 ?auto_42331 ) ) ( not ( = ?auto_42329 ?auto_42331 ) ) ( not ( = ?auto_42330 ?auto_42331 ) ) ( not ( = ?auto_42333 ?auto_42331 ) ) ( ON ?auto_42332 ?auto_42333 ) ( CLEAR ?auto_42332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42328 ?auto_42329 ?auto_42330 ?auto_42333 )
      ( MAKE-2PILE ?auto_42328 ?auto_42329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42334 - BLOCK
      ?auto_42335 - BLOCK
    )
    :vars
    (
      ?auto_42339 - BLOCK
      ?auto_42338 - BLOCK
      ?auto_42337 - BLOCK
      ?auto_42336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42339 ?auto_42335 ) ( ON-TABLE ?auto_42334 ) ( ON ?auto_42335 ?auto_42334 ) ( not ( = ?auto_42334 ?auto_42335 ) ) ( not ( = ?auto_42334 ?auto_42339 ) ) ( not ( = ?auto_42335 ?auto_42339 ) ) ( not ( = ?auto_42334 ?auto_42338 ) ) ( not ( = ?auto_42334 ?auto_42337 ) ) ( not ( = ?auto_42335 ?auto_42338 ) ) ( not ( = ?auto_42335 ?auto_42337 ) ) ( not ( = ?auto_42339 ?auto_42338 ) ) ( not ( = ?auto_42339 ?auto_42337 ) ) ( not ( = ?auto_42338 ?auto_42337 ) ) ( ON ?auto_42338 ?auto_42339 ) ( not ( = ?auto_42336 ?auto_42337 ) ) ( not ( = ?auto_42334 ?auto_42336 ) ) ( not ( = ?auto_42335 ?auto_42336 ) ) ( not ( = ?auto_42339 ?auto_42336 ) ) ( not ( = ?auto_42338 ?auto_42336 ) ) ( ON ?auto_42337 ?auto_42338 ) ( CLEAR ?auto_42337 ) ( HOLDING ?auto_42336 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42336 )
      ( MAKE-2PILE ?auto_42334 ?auto_42335 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42340 - BLOCK
      ?auto_42341 - BLOCK
    )
    :vars
    (
      ?auto_42342 - BLOCK
      ?auto_42344 - BLOCK
      ?auto_42343 - BLOCK
      ?auto_42345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42342 ?auto_42341 ) ( ON-TABLE ?auto_42340 ) ( ON ?auto_42341 ?auto_42340 ) ( not ( = ?auto_42340 ?auto_42341 ) ) ( not ( = ?auto_42340 ?auto_42342 ) ) ( not ( = ?auto_42341 ?auto_42342 ) ) ( not ( = ?auto_42340 ?auto_42344 ) ) ( not ( = ?auto_42340 ?auto_42343 ) ) ( not ( = ?auto_42341 ?auto_42344 ) ) ( not ( = ?auto_42341 ?auto_42343 ) ) ( not ( = ?auto_42342 ?auto_42344 ) ) ( not ( = ?auto_42342 ?auto_42343 ) ) ( not ( = ?auto_42344 ?auto_42343 ) ) ( ON ?auto_42344 ?auto_42342 ) ( not ( = ?auto_42345 ?auto_42343 ) ) ( not ( = ?auto_42340 ?auto_42345 ) ) ( not ( = ?auto_42341 ?auto_42345 ) ) ( not ( = ?auto_42342 ?auto_42345 ) ) ( not ( = ?auto_42344 ?auto_42345 ) ) ( ON ?auto_42343 ?auto_42344 ) ( ON ?auto_42345 ?auto_42343 ) ( CLEAR ?auto_42345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42340 ?auto_42341 ?auto_42342 ?auto_42344 ?auto_42343 )
      ( MAKE-2PILE ?auto_42340 ?auto_42341 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42346 - BLOCK
      ?auto_42347 - BLOCK
    )
    :vars
    (
      ?auto_42349 - BLOCK
      ?auto_42350 - BLOCK
      ?auto_42351 - BLOCK
      ?auto_42348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42349 ?auto_42347 ) ( ON-TABLE ?auto_42346 ) ( ON ?auto_42347 ?auto_42346 ) ( not ( = ?auto_42346 ?auto_42347 ) ) ( not ( = ?auto_42346 ?auto_42349 ) ) ( not ( = ?auto_42347 ?auto_42349 ) ) ( not ( = ?auto_42346 ?auto_42350 ) ) ( not ( = ?auto_42346 ?auto_42351 ) ) ( not ( = ?auto_42347 ?auto_42350 ) ) ( not ( = ?auto_42347 ?auto_42351 ) ) ( not ( = ?auto_42349 ?auto_42350 ) ) ( not ( = ?auto_42349 ?auto_42351 ) ) ( not ( = ?auto_42350 ?auto_42351 ) ) ( ON ?auto_42350 ?auto_42349 ) ( not ( = ?auto_42348 ?auto_42351 ) ) ( not ( = ?auto_42346 ?auto_42348 ) ) ( not ( = ?auto_42347 ?auto_42348 ) ) ( not ( = ?auto_42349 ?auto_42348 ) ) ( not ( = ?auto_42350 ?auto_42348 ) ) ( ON ?auto_42351 ?auto_42350 ) ( HOLDING ?auto_42348 ) ( CLEAR ?auto_42351 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42346 ?auto_42347 ?auto_42349 ?auto_42350 ?auto_42351 ?auto_42348 )
      ( MAKE-2PILE ?auto_42346 ?auto_42347 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42352 - BLOCK
      ?auto_42353 - BLOCK
    )
    :vars
    (
      ?auto_42355 - BLOCK
      ?auto_42357 - BLOCK
      ?auto_42354 - BLOCK
      ?auto_42356 - BLOCK
      ?auto_42358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42355 ?auto_42353 ) ( ON-TABLE ?auto_42352 ) ( ON ?auto_42353 ?auto_42352 ) ( not ( = ?auto_42352 ?auto_42353 ) ) ( not ( = ?auto_42352 ?auto_42355 ) ) ( not ( = ?auto_42353 ?auto_42355 ) ) ( not ( = ?auto_42352 ?auto_42357 ) ) ( not ( = ?auto_42352 ?auto_42354 ) ) ( not ( = ?auto_42353 ?auto_42357 ) ) ( not ( = ?auto_42353 ?auto_42354 ) ) ( not ( = ?auto_42355 ?auto_42357 ) ) ( not ( = ?auto_42355 ?auto_42354 ) ) ( not ( = ?auto_42357 ?auto_42354 ) ) ( ON ?auto_42357 ?auto_42355 ) ( not ( = ?auto_42356 ?auto_42354 ) ) ( not ( = ?auto_42352 ?auto_42356 ) ) ( not ( = ?auto_42353 ?auto_42356 ) ) ( not ( = ?auto_42355 ?auto_42356 ) ) ( not ( = ?auto_42357 ?auto_42356 ) ) ( ON ?auto_42354 ?auto_42357 ) ( CLEAR ?auto_42354 ) ( ON ?auto_42356 ?auto_42358 ) ( CLEAR ?auto_42356 ) ( HAND-EMPTY ) ( not ( = ?auto_42352 ?auto_42358 ) ) ( not ( = ?auto_42353 ?auto_42358 ) ) ( not ( = ?auto_42355 ?auto_42358 ) ) ( not ( = ?auto_42357 ?auto_42358 ) ) ( not ( = ?auto_42354 ?auto_42358 ) ) ( not ( = ?auto_42356 ?auto_42358 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42356 ?auto_42358 )
      ( MAKE-2PILE ?auto_42352 ?auto_42353 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42359 - BLOCK
      ?auto_42360 - BLOCK
    )
    :vars
    (
      ?auto_42361 - BLOCK
      ?auto_42364 - BLOCK
      ?auto_42363 - BLOCK
      ?auto_42365 - BLOCK
      ?auto_42362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42361 ?auto_42360 ) ( ON-TABLE ?auto_42359 ) ( ON ?auto_42360 ?auto_42359 ) ( not ( = ?auto_42359 ?auto_42360 ) ) ( not ( = ?auto_42359 ?auto_42361 ) ) ( not ( = ?auto_42360 ?auto_42361 ) ) ( not ( = ?auto_42359 ?auto_42364 ) ) ( not ( = ?auto_42359 ?auto_42363 ) ) ( not ( = ?auto_42360 ?auto_42364 ) ) ( not ( = ?auto_42360 ?auto_42363 ) ) ( not ( = ?auto_42361 ?auto_42364 ) ) ( not ( = ?auto_42361 ?auto_42363 ) ) ( not ( = ?auto_42364 ?auto_42363 ) ) ( ON ?auto_42364 ?auto_42361 ) ( not ( = ?auto_42365 ?auto_42363 ) ) ( not ( = ?auto_42359 ?auto_42365 ) ) ( not ( = ?auto_42360 ?auto_42365 ) ) ( not ( = ?auto_42361 ?auto_42365 ) ) ( not ( = ?auto_42364 ?auto_42365 ) ) ( ON ?auto_42365 ?auto_42362 ) ( CLEAR ?auto_42365 ) ( not ( = ?auto_42359 ?auto_42362 ) ) ( not ( = ?auto_42360 ?auto_42362 ) ) ( not ( = ?auto_42361 ?auto_42362 ) ) ( not ( = ?auto_42364 ?auto_42362 ) ) ( not ( = ?auto_42363 ?auto_42362 ) ) ( not ( = ?auto_42365 ?auto_42362 ) ) ( HOLDING ?auto_42363 ) ( CLEAR ?auto_42364 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42359 ?auto_42360 ?auto_42361 ?auto_42364 ?auto_42363 )
      ( MAKE-2PILE ?auto_42359 ?auto_42360 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42366 - BLOCK
      ?auto_42367 - BLOCK
    )
    :vars
    (
      ?auto_42370 - BLOCK
      ?auto_42371 - BLOCK
      ?auto_42368 - BLOCK
      ?auto_42372 - BLOCK
      ?auto_42369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42370 ?auto_42367 ) ( ON-TABLE ?auto_42366 ) ( ON ?auto_42367 ?auto_42366 ) ( not ( = ?auto_42366 ?auto_42367 ) ) ( not ( = ?auto_42366 ?auto_42370 ) ) ( not ( = ?auto_42367 ?auto_42370 ) ) ( not ( = ?auto_42366 ?auto_42371 ) ) ( not ( = ?auto_42366 ?auto_42368 ) ) ( not ( = ?auto_42367 ?auto_42371 ) ) ( not ( = ?auto_42367 ?auto_42368 ) ) ( not ( = ?auto_42370 ?auto_42371 ) ) ( not ( = ?auto_42370 ?auto_42368 ) ) ( not ( = ?auto_42371 ?auto_42368 ) ) ( ON ?auto_42371 ?auto_42370 ) ( not ( = ?auto_42372 ?auto_42368 ) ) ( not ( = ?auto_42366 ?auto_42372 ) ) ( not ( = ?auto_42367 ?auto_42372 ) ) ( not ( = ?auto_42370 ?auto_42372 ) ) ( not ( = ?auto_42371 ?auto_42372 ) ) ( ON ?auto_42372 ?auto_42369 ) ( not ( = ?auto_42366 ?auto_42369 ) ) ( not ( = ?auto_42367 ?auto_42369 ) ) ( not ( = ?auto_42370 ?auto_42369 ) ) ( not ( = ?auto_42371 ?auto_42369 ) ) ( not ( = ?auto_42368 ?auto_42369 ) ) ( not ( = ?auto_42372 ?auto_42369 ) ) ( CLEAR ?auto_42371 ) ( ON ?auto_42368 ?auto_42372 ) ( CLEAR ?auto_42368 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42369 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42369 ?auto_42372 )
      ( MAKE-2PILE ?auto_42366 ?auto_42367 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42373 - BLOCK
      ?auto_42374 - BLOCK
    )
    :vars
    (
      ?auto_42376 - BLOCK
      ?auto_42378 - BLOCK
      ?auto_42379 - BLOCK
      ?auto_42377 - BLOCK
      ?auto_42375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42376 ?auto_42374 ) ( ON-TABLE ?auto_42373 ) ( ON ?auto_42374 ?auto_42373 ) ( not ( = ?auto_42373 ?auto_42374 ) ) ( not ( = ?auto_42373 ?auto_42376 ) ) ( not ( = ?auto_42374 ?auto_42376 ) ) ( not ( = ?auto_42373 ?auto_42378 ) ) ( not ( = ?auto_42373 ?auto_42379 ) ) ( not ( = ?auto_42374 ?auto_42378 ) ) ( not ( = ?auto_42374 ?auto_42379 ) ) ( not ( = ?auto_42376 ?auto_42378 ) ) ( not ( = ?auto_42376 ?auto_42379 ) ) ( not ( = ?auto_42378 ?auto_42379 ) ) ( not ( = ?auto_42377 ?auto_42379 ) ) ( not ( = ?auto_42373 ?auto_42377 ) ) ( not ( = ?auto_42374 ?auto_42377 ) ) ( not ( = ?auto_42376 ?auto_42377 ) ) ( not ( = ?auto_42378 ?auto_42377 ) ) ( ON ?auto_42377 ?auto_42375 ) ( not ( = ?auto_42373 ?auto_42375 ) ) ( not ( = ?auto_42374 ?auto_42375 ) ) ( not ( = ?auto_42376 ?auto_42375 ) ) ( not ( = ?auto_42378 ?auto_42375 ) ) ( not ( = ?auto_42379 ?auto_42375 ) ) ( not ( = ?auto_42377 ?auto_42375 ) ) ( ON ?auto_42379 ?auto_42377 ) ( CLEAR ?auto_42379 ) ( ON-TABLE ?auto_42375 ) ( HOLDING ?auto_42378 ) ( CLEAR ?auto_42376 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42373 ?auto_42374 ?auto_42376 ?auto_42378 )
      ( MAKE-2PILE ?auto_42373 ?auto_42374 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42380 - BLOCK
      ?auto_42381 - BLOCK
    )
    :vars
    (
      ?auto_42384 - BLOCK
      ?auto_42382 - BLOCK
      ?auto_42385 - BLOCK
      ?auto_42383 - BLOCK
      ?auto_42386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42384 ?auto_42381 ) ( ON-TABLE ?auto_42380 ) ( ON ?auto_42381 ?auto_42380 ) ( not ( = ?auto_42380 ?auto_42381 ) ) ( not ( = ?auto_42380 ?auto_42384 ) ) ( not ( = ?auto_42381 ?auto_42384 ) ) ( not ( = ?auto_42380 ?auto_42382 ) ) ( not ( = ?auto_42380 ?auto_42385 ) ) ( not ( = ?auto_42381 ?auto_42382 ) ) ( not ( = ?auto_42381 ?auto_42385 ) ) ( not ( = ?auto_42384 ?auto_42382 ) ) ( not ( = ?auto_42384 ?auto_42385 ) ) ( not ( = ?auto_42382 ?auto_42385 ) ) ( not ( = ?auto_42383 ?auto_42385 ) ) ( not ( = ?auto_42380 ?auto_42383 ) ) ( not ( = ?auto_42381 ?auto_42383 ) ) ( not ( = ?auto_42384 ?auto_42383 ) ) ( not ( = ?auto_42382 ?auto_42383 ) ) ( ON ?auto_42383 ?auto_42386 ) ( not ( = ?auto_42380 ?auto_42386 ) ) ( not ( = ?auto_42381 ?auto_42386 ) ) ( not ( = ?auto_42384 ?auto_42386 ) ) ( not ( = ?auto_42382 ?auto_42386 ) ) ( not ( = ?auto_42385 ?auto_42386 ) ) ( not ( = ?auto_42383 ?auto_42386 ) ) ( ON ?auto_42385 ?auto_42383 ) ( ON-TABLE ?auto_42386 ) ( CLEAR ?auto_42384 ) ( ON ?auto_42382 ?auto_42385 ) ( CLEAR ?auto_42382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42386 ?auto_42383 ?auto_42385 )
      ( MAKE-2PILE ?auto_42380 ?auto_42381 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42401 - BLOCK
      ?auto_42402 - BLOCK
    )
    :vars
    (
      ?auto_42403 - BLOCK
      ?auto_42404 - BLOCK
      ?auto_42406 - BLOCK
      ?auto_42405 - BLOCK
      ?auto_42407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42401 ) ( not ( = ?auto_42401 ?auto_42402 ) ) ( not ( = ?auto_42401 ?auto_42403 ) ) ( not ( = ?auto_42402 ?auto_42403 ) ) ( not ( = ?auto_42401 ?auto_42404 ) ) ( not ( = ?auto_42401 ?auto_42406 ) ) ( not ( = ?auto_42402 ?auto_42404 ) ) ( not ( = ?auto_42402 ?auto_42406 ) ) ( not ( = ?auto_42403 ?auto_42404 ) ) ( not ( = ?auto_42403 ?auto_42406 ) ) ( not ( = ?auto_42404 ?auto_42406 ) ) ( not ( = ?auto_42405 ?auto_42406 ) ) ( not ( = ?auto_42401 ?auto_42405 ) ) ( not ( = ?auto_42402 ?auto_42405 ) ) ( not ( = ?auto_42403 ?auto_42405 ) ) ( not ( = ?auto_42404 ?auto_42405 ) ) ( ON ?auto_42405 ?auto_42407 ) ( not ( = ?auto_42401 ?auto_42407 ) ) ( not ( = ?auto_42402 ?auto_42407 ) ) ( not ( = ?auto_42403 ?auto_42407 ) ) ( not ( = ?auto_42404 ?auto_42407 ) ) ( not ( = ?auto_42406 ?auto_42407 ) ) ( not ( = ?auto_42405 ?auto_42407 ) ) ( ON ?auto_42406 ?auto_42405 ) ( ON-TABLE ?auto_42407 ) ( ON ?auto_42404 ?auto_42406 ) ( ON ?auto_42403 ?auto_42404 ) ( CLEAR ?auto_42403 ) ( HOLDING ?auto_42402 ) ( CLEAR ?auto_42401 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42401 ?auto_42402 ?auto_42403 )
      ( MAKE-2PILE ?auto_42401 ?auto_42402 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42408 - BLOCK
      ?auto_42409 - BLOCK
    )
    :vars
    (
      ?auto_42413 - BLOCK
      ?auto_42412 - BLOCK
      ?auto_42414 - BLOCK
      ?auto_42411 - BLOCK
      ?auto_42410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42408 ) ( not ( = ?auto_42408 ?auto_42409 ) ) ( not ( = ?auto_42408 ?auto_42413 ) ) ( not ( = ?auto_42409 ?auto_42413 ) ) ( not ( = ?auto_42408 ?auto_42412 ) ) ( not ( = ?auto_42408 ?auto_42414 ) ) ( not ( = ?auto_42409 ?auto_42412 ) ) ( not ( = ?auto_42409 ?auto_42414 ) ) ( not ( = ?auto_42413 ?auto_42412 ) ) ( not ( = ?auto_42413 ?auto_42414 ) ) ( not ( = ?auto_42412 ?auto_42414 ) ) ( not ( = ?auto_42411 ?auto_42414 ) ) ( not ( = ?auto_42408 ?auto_42411 ) ) ( not ( = ?auto_42409 ?auto_42411 ) ) ( not ( = ?auto_42413 ?auto_42411 ) ) ( not ( = ?auto_42412 ?auto_42411 ) ) ( ON ?auto_42411 ?auto_42410 ) ( not ( = ?auto_42408 ?auto_42410 ) ) ( not ( = ?auto_42409 ?auto_42410 ) ) ( not ( = ?auto_42413 ?auto_42410 ) ) ( not ( = ?auto_42412 ?auto_42410 ) ) ( not ( = ?auto_42414 ?auto_42410 ) ) ( not ( = ?auto_42411 ?auto_42410 ) ) ( ON ?auto_42414 ?auto_42411 ) ( ON-TABLE ?auto_42410 ) ( ON ?auto_42412 ?auto_42414 ) ( ON ?auto_42413 ?auto_42412 ) ( CLEAR ?auto_42408 ) ( ON ?auto_42409 ?auto_42413 ) ( CLEAR ?auto_42409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42410 ?auto_42411 ?auto_42414 ?auto_42412 ?auto_42413 )
      ( MAKE-2PILE ?auto_42408 ?auto_42409 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42415 - BLOCK
      ?auto_42416 - BLOCK
    )
    :vars
    (
      ?auto_42419 - BLOCK
      ?auto_42421 - BLOCK
      ?auto_42420 - BLOCK
      ?auto_42418 - BLOCK
      ?auto_42417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42415 ?auto_42416 ) ) ( not ( = ?auto_42415 ?auto_42419 ) ) ( not ( = ?auto_42416 ?auto_42419 ) ) ( not ( = ?auto_42415 ?auto_42421 ) ) ( not ( = ?auto_42415 ?auto_42420 ) ) ( not ( = ?auto_42416 ?auto_42421 ) ) ( not ( = ?auto_42416 ?auto_42420 ) ) ( not ( = ?auto_42419 ?auto_42421 ) ) ( not ( = ?auto_42419 ?auto_42420 ) ) ( not ( = ?auto_42421 ?auto_42420 ) ) ( not ( = ?auto_42418 ?auto_42420 ) ) ( not ( = ?auto_42415 ?auto_42418 ) ) ( not ( = ?auto_42416 ?auto_42418 ) ) ( not ( = ?auto_42419 ?auto_42418 ) ) ( not ( = ?auto_42421 ?auto_42418 ) ) ( ON ?auto_42418 ?auto_42417 ) ( not ( = ?auto_42415 ?auto_42417 ) ) ( not ( = ?auto_42416 ?auto_42417 ) ) ( not ( = ?auto_42419 ?auto_42417 ) ) ( not ( = ?auto_42421 ?auto_42417 ) ) ( not ( = ?auto_42420 ?auto_42417 ) ) ( not ( = ?auto_42418 ?auto_42417 ) ) ( ON ?auto_42420 ?auto_42418 ) ( ON-TABLE ?auto_42417 ) ( ON ?auto_42421 ?auto_42420 ) ( ON ?auto_42419 ?auto_42421 ) ( ON ?auto_42416 ?auto_42419 ) ( CLEAR ?auto_42416 ) ( HOLDING ?auto_42415 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42415 )
      ( MAKE-2PILE ?auto_42415 ?auto_42416 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42422 - BLOCK
      ?auto_42423 - BLOCK
    )
    :vars
    (
      ?auto_42425 - BLOCK
      ?auto_42424 - BLOCK
      ?auto_42426 - BLOCK
      ?auto_42427 - BLOCK
      ?auto_42428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42422 ?auto_42423 ) ) ( not ( = ?auto_42422 ?auto_42425 ) ) ( not ( = ?auto_42423 ?auto_42425 ) ) ( not ( = ?auto_42422 ?auto_42424 ) ) ( not ( = ?auto_42422 ?auto_42426 ) ) ( not ( = ?auto_42423 ?auto_42424 ) ) ( not ( = ?auto_42423 ?auto_42426 ) ) ( not ( = ?auto_42425 ?auto_42424 ) ) ( not ( = ?auto_42425 ?auto_42426 ) ) ( not ( = ?auto_42424 ?auto_42426 ) ) ( not ( = ?auto_42427 ?auto_42426 ) ) ( not ( = ?auto_42422 ?auto_42427 ) ) ( not ( = ?auto_42423 ?auto_42427 ) ) ( not ( = ?auto_42425 ?auto_42427 ) ) ( not ( = ?auto_42424 ?auto_42427 ) ) ( ON ?auto_42427 ?auto_42428 ) ( not ( = ?auto_42422 ?auto_42428 ) ) ( not ( = ?auto_42423 ?auto_42428 ) ) ( not ( = ?auto_42425 ?auto_42428 ) ) ( not ( = ?auto_42424 ?auto_42428 ) ) ( not ( = ?auto_42426 ?auto_42428 ) ) ( not ( = ?auto_42427 ?auto_42428 ) ) ( ON ?auto_42426 ?auto_42427 ) ( ON-TABLE ?auto_42428 ) ( ON ?auto_42424 ?auto_42426 ) ( ON ?auto_42425 ?auto_42424 ) ( ON ?auto_42423 ?auto_42425 ) ( ON ?auto_42422 ?auto_42423 ) ( CLEAR ?auto_42422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42428 ?auto_42427 ?auto_42426 ?auto_42424 ?auto_42425 ?auto_42423 )
      ( MAKE-2PILE ?auto_42422 ?auto_42423 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42433 - BLOCK
      ?auto_42434 - BLOCK
      ?auto_42435 - BLOCK
      ?auto_42436 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_42436 ) ( CLEAR ?auto_42435 ) ( ON-TABLE ?auto_42433 ) ( ON ?auto_42434 ?auto_42433 ) ( ON ?auto_42435 ?auto_42434 ) ( not ( = ?auto_42433 ?auto_42434 ) ) ( not ( = ?auto_42433 ?auto_42435 ) ) ( not ( = ?auto_42433 ?auto_42436 ) ) ( not ( = ?auto_42434 ?auto_42435 ) ) ( not ( = ?auto_42434 ?auto_42436 ) ) ( not ( = ?auto_42435 ?auto_42436 ) ) )
    :subtasks
    ( ( !STACK ?auto_42436 ?auto_42435 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42437 - BLOCK
      ?auto_42438 - BLOCK
      ?auto_42439 - BLOCK
      ?auto_42440 - BLOCK
    )
    :vars
    (
      ?auto_42441 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42439 ) ( ON-TABLE ?auto_42437 ) ( ON ?auto_42438 ?auto_42437 ) ( ON ?auto_42439 ?auto_42438 ) ( not ( = ?auto_42437 ?auto_42438 ) ) ( not ( = ?auto_42437 ?auto_42439 ) ) ( not ( = ?auto_42437 ?auto_42440 ) ) ( not ( = ?auto_42438 ?auto_42439 ) ) ( not ( = ?auto_42438 ?auto_42440 ) ) ( not ( = ?auto_42439 ?auto_42440 ) ) ( ON ?auto_42440 ?auto_42441 ) ( CLEAR ?auto_42440 ) ( HAND-EMPTY ) ( not ( = ?auto_42437 ?auto_42441 ) ) ( not ( = ?auto_42438 ?auto_42441 ) ) ( not ( = ?auto_42439 ?auto_42441 ) ) ( not ( = ?auto_42440 ?auto_42441 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42440 ?auto_42441 )
      ( MAKE-4PILE ?auto_42437 ?auto_42438 ?auto_42439 ?auto_42440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42442 - BLOCK
      ?auto_42443 - BLOCK
      ?auto_42444 - BLOCK
      ?auto_42445 - BLOCK
    )
    :vars
    (
      ?auto_42446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42442 ) ( ON ?auto_42443 ?auto_42442 ) ( not ( = ?auto_42442 ?auto_42443 ) ) ( not ( = ?auto_42442 ?auto_42444 ) ) ( not ( = ?auto_42442 ?auto_42445 ) ) ( not ( = ?auto_42443 ?auto_42444 ) ) ( not ( = ?auto_42443 ?auto_42445 ) ) ( not ( = ?auto_42444 ?auto_42445 ) ) ( ON ?auto_42445 ?auto_42446 ) ( CLEAR ?auto_42445 ) ( not ( = ?auto_42442 ?auto_42446 ) ) ( not ( = ?auto_42443 ?auto_42446 ) ) ( not ( = ?auto_42444 ?auto_42446 ) ) ( not ( = ?auto_42445 ?auto_42446 ) ) ( HOLDING ?auto_42444 ) ( CLEAR ?auto_42443 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42442 ?auto_42443 ?auto_42444 )
      ( MAKE-4PILE ?auto_42442 ?auto_42443 ?auto_42444 ?auto_42445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42447 - BLOCK
      ?auto_42448 - BLOCK
      ?auto_42449 - BLOCK
      ?auto_42450 - BLOCK
    )
    :vars
    (
      ?auto_42451 - BLOCK
      ?auto_42452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42447 ) ( ON ?auto_42448 ?auto_42447 ) ( not ( = ?auto_42447 ?auto_42448 ) ) ( not ( = ?auto_42447 ?auto_42449 ) ) ( not ( = ?auto_42447 ?auto_42450 ) ) ( not ( = ?auto_42448 ?auto_42449 ) ) ( not ( = ?auto_42448 ?auto_42450 ) ) ( not ( = ?auto_42449 ?auto_42450 ) ) ( ON ?auto_42450 ?auto_42451 ) ( not ( = ?auto_42447 ?auto_42451 ) ) ( not ( = ?auto_42448 ?auto_42451 ) ) ( not ( = ?auto_42449 ?auto_42451 ) ) ( not ( = ?auto_42450 ?auto_42451 ) ) ( CLEAR ?auto_42448 ) ( ON ?auto_42449 ?auto_42450 ) ( CLEAR ?auto_42449 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42452 ) ( ON ?auto_42451 ?auto_42452 ) ( not ( = ?auto_42452 ?auto_42451 ) ) ( not ( = ?auto_42452 ?auto_42450 ) ) ( not ( = ?auto_42452 ?auto_42449 ) ) ( not ( = ?auto_42447 ?auto_42452 ) ) ( not ( = ?auto_42448 ?auto_42452 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42452 ?auto_42451 ?auto_42450 )
      ( MAKE-4PILE ?auto_42447 ?auto_42448 ?auto_42449 ?auto_42450 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42453 - BLOCK
      ?auto_42454 - BLOCK
      ?auto_42455 - BLOCK
      ?auto_42456 - BLOCK
    )
    :vars
    (
      ?auto_42457 - BLOCK
      ?auto_42458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42453 ) ( not ( = ?auto_42453 ?auto_42454 ) ) ( not ( = ?auto_42453 ?auto_42455 ) ) ( not ( = ?auto_42453 ?auto_42456 ) ) ( not ( = ?auto_42454 ?auto_42455 ) ) ( not ( = ?auto_42454 ?auto_42456 ) ) ( not ( = ?auto_42455 ?auto_42456 ) ) ( ON ?auto_42456 ?auto_42457 ) ( not ( = ?auto_42453 ?auto_42457 ) ) ( not ( = ?auto_42454 ?auto_42457 ) ) ( not ( = ?auto_42455 ?auto_42457 ) ) ( not ( = ?auto_42456 ?auto_42457 ) ) ( ON ?auto_42455 ?auto_42456 ) ( CLEAR ?auto_42455 ) ( ON-TABLE ?auto_42458 ) ( ON ?auto_42457 ?auto_42458 ) ( not ( = ?auto_42458 ?auto_42457 ) ) ( not ( = ?auto_42458 ?auto_42456 ) ) ( not ( = ?auto_42458 ?auto_42455 ) ) ( not ( = ?auto_42453 ?auto_42458 ) ) ( not ( = ?auto_42454 ?auto_42458 ) ) ( HOLDING ?auto_42454 ) ( CLEAR ?auto_42453 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42453 ?auto_42454 )
      ( MAKE-4PILE ?auto_42453 ?auto_42454 ?auto_42455 ?auto_42456 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42459 - BLOCK
      ?auto_42460 - BLOCK
      ?auto_42461 - BLOCK
      ?auto_42462 - BLOCK
    )
    :vars
    (
      ?auto_42463 - BLOCK
      ?auto_42464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42459 ) ( not ( = ?auto_42459 ?auto_42460 ) ) ( not ( = ?auto_42459 ?auto_42461 ) ) ( not ( = ?auto_42459 ?auto_42462 ) ) ( not ( = ?auto_42460 ?auto_42461 ) ) ( not ( = ?auto_42460 ?auto_42462 ) ) ( not ( = ?auto_42461 ?auto_42462 ) ) ( ON ?auto_42462 ?auto_42463 ) ( not ( = ?auto_42459 ?auto_42463 ) ) ( not ( = ?auto_42460 ?auto_42463 ) ) ( not ( = ?auto_42461 ?auto_42463 ) ) ( not ( = ?auto_42462 ?auto_42463 ) ) ( ON ?auto_42461 ?auto_42462 ) ( ON-TABLE ?auto_42464 ) ( ON ?auto_42463 ?auto_42464 ) ( not ( = ?auto_42464 ?auto_42463 ) ) ( not ( = ?auto_42464 ?auto_42462 ) ) ( not ( = ?auto_42464 ?auto_42461 ) ) ( not ( = ?auto_42459 ?auto_42464 ) ) ( not ( = ?auto_42460 ?auto_42464 ) ) ( CLEAR ?auto_42459 ) ( ON ?auto_42460 ?auto_42461 ) ( CLEAR ?auto_42460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42464 ?auto_42463 ?auto_42462 ?auto_42461 )
      ( MAKE-4PILE ?auto_42459 ?auto_42460 ?auto_42461 ?auto_42462 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42465 - BLOCK
      ?auto_42466 - BLOCK
      ?auto_42467 - BLOCK
      ?auto_42468 - BLOCK
    )
    :vars
    (
      ?auto_42469 - BLOCK
      ?auto_42470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42465 ?auto_42466 ) ) ( not ( = ?auto_42465 ?auto_42467 ) ) ( not ( = ?auto_42465 ?auto_42468 ) ) ( not ( = ?auto_42466 ?auto_42467 ) ) ( not ( = ?auto_42466 ?auto_42468 ) ) ( not ( = ?auto_42467 ?auto_42468 ) ) ( ON ?auto_42468 ?auto_42469 ) ( not ( = ?auto_42465 ?auto_42469 ) ) ( not ( = ?auto_42466 ?auto_42469 ) ) ( not ( = ?auto_42467 ?auto_42469 ) ) ( not ( = ?auto_42468 ?auto_42469 ) ) ( ON ?auto_42467 ?auto_42468 ) ( ON-TABLE ?auto_42470 ) ( ON ?auto_42469 ?auto_42470 ) ( not ( = ?auto_42470 ?auto_42469 ) ) ( not ( = ?auto_42470 ?auto_42468 ) ) ( not ( = ?auto_42470 ?auto_42467 ) ) ( not ( = ?auto_42465 ?auto_42470 ) ) ( not ( = ?auto_42466 ?auto_42470 ) ) ( ON ?auto_42466 ?auto_42467 ) ( CLEAR ?auto_42466 ) ( HOLDING ?auto_42465 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42465 )
      ( MAKE-4PILE ?auto_42465 ?auto_42466 ?auto_42467 ?auto_42468 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42471 - BLOCK
      ?auto_42472 - BLOCK
      ?auto_42473 - BLOCK
      ?auto_42474 - BLOCK
    )
    :vars
    (
      ?auto_42475 - BLOCK
      ?auto_42476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42471 ?auto_42472 ) ) ( not ( = ?auto_42471 ?auto_42473 ) ) ( not ( = ?auto_42471 ?auto_42474 ) ) ( not ( = ?auto_42472 ?auto_42473 ) ) ( not ( = ?auto_42472 ?auto_42474 ) ) ( not ( = ?auto_42473 ?auto_42474 ) ) ( ON ?auto_42474 ?auto_42475 ) ( not ( = ?auto_42471 ?auto_42475 ) ) ( not ( = ?auto_42472 ?auto_42475 ) ) ( not ( = ?auto_42473 ?auto_42475 ) ) ( not ( = ?auto_42474 ?auto_42475 ) ) ( ON ?auto_42473 ?auto_42474 ) ( ON-TABLE ?auto_42476 ) ( ON ?auto_42475 ?auto_42476 ) ( not ( = ?auto_42476 ?auto_42475 ) ) ( not ( = ?auto_42476 ?auto_42474 ) ) ( not ( = ?auto_42476 ?auto_42473 ) ) ( not ( = ?auto_42471 ?auto_42476 ) ) ( not ( = ?auto_42472 ?auto_42476 ) ) ( ON ?auto_42472 ?auto_42473 ) ( ON ?auto_42471 ?auto_42472 ) ( CLEAR ?auto_42471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42476 ?auto_42475 ?auto_42474 ?auto_42473 ?auto_42472 )
      ( MAKE-4PILE ?auto_42471 ?auto_42472 ?auto_42473 ?auto_42474 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42477 - BLOCK
      ?auto_42478 - BLOCK
      ?auto_42479 - BLOCK
      ?auto_42480 - BLOCK
    )
    :vars
    (
      ?auto_42482 - BLOCK
      ?auto_42481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42477 ?auto_42478 ) ) ( not ( = ?auto_42477 ?auto_42479 ) ) ( not ( = ?auto_42477 ?auto_42480 ) ) ( not ( = ?auto_42478 ?auto_42479 ) ) ( not ( = ?auto_42478 ?auto_42480 ) ) ( not ( = ?auto_42479 ?auto_42480 ) ) ( ON ?auto_42480 ?auto_42482 ) ( not ( = ?auto_42477 ?auto_42482 ) ) ( not ( = ?auto_42478 ?auto_42482 ) ) ( not ( = ?auto_42479 ?auto_42482 ) ) ( not ( = ?auto_42480 ?auto_42482 ) ) ( ON ?auto_42479 ?auto_42480 ) ( ON-TABLE ?auto_42481 ) ( ON ?auto_42482 ?auto_42481 ) ( not ( = ?auto_42481 ?auto_42482 ) ) ( not ( = ?auto_42481 ?auto_42480 ) ) ( not ( = ?auto_42481 ?auto_42479 ) ) ( not ( = ?auto_42477 ?auto_42481 ) ) ( not ( = ?auto_42478 ?auto_42481 ) ) ( ON ?auto_42478 ?auto_42479 ) ( HOLDING ?auto_42477 ) ( CLEAR ?auto_42478 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42481 ?auto_42482 ?auto_42480 ?auto_42479 ?auto_42478 ?auto_42477 )
      ( MAKE-4PILE ?auto_42477 ?auto_42478 ?auto_42479 ?auto_42480 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42483 - BLOCK
      ?auto_42484 - BLOCK
      ?auto_42485 - BLOCK
      ?auto_42486 - BLOCK
    )
    :vars
    (
      ?auto_42488 - BLOCK
      ?auto_42487 - BLOCK
      ?auto_42489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42483 ?auto_42484 ) ) ( not ( = ?auto_42483 ?auto_42485 ) ) ( not ( = ?auto_42483 ?auto_42486 ) ) ( not ( = ?auto_42484 ?auto_42485 ) ) ( not ( = ?auto_42484 ?auto_42486 ) ) ( not ( = ?auto_42485 ?auto_42486 ) ) ( ON ?auto_42486 ?auto_42488 ) ( not ( = ?auto_42483 ?auto_42488 ) ) ( not ( = ?auto_42484 ?auto_42488 ) ) ( not ( = ?auto_42485 ?auto_42488 ) ) ( not ( = ?auto_42486 ?auto_42488 ) ) ( ON ?auto_42485 ?auto_42486 ) ( ON-TABLE ?auto_42487 ) ( ON ?auto_42488 ?auto_42487 ) ( not ( = ?auto_42487 ?auto_42488 ) ) ( not ( = ?auto_42487 ?auto_42486 ) ) ( not ( = ?auto_42487 ?auto_42485 ) ) ( not ( = ?auto_42483 ?auto_42487 ) ) ( not ( = ?auto_42484 ?auto_42487 ) ) ( ON ?auto_42484 ?auto_42485 ) ( CLEAR ?auto_42484 ) ( ON ?auto_42483 ?auto_42489 ) ( CLEAR ?auto_42483 ) ( HAND-EMPTY ) ( not ( = ?auto_42483 ?auto_42489 ) ) ( not ( = ?auto_42484 ?auto_42489 ) ) ( not ( = ?auto_42485 ?auto_42489 ) ) ( not ( = ?auto_42486 ?auto_42489 ) ) ( not ( = ?auto_42488 ?auto_42489 ) ) ( not ( = ?auto_42487 ?auto_42489 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42483 ?auto_42489 )
      ( MAKE-4PILE ?auto_42483 ?auto_42484 ?auto_42485 ?auto_42486 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42490 - BLOCK
      ?auto_42491 - BLOCK
      ?auto_42492 - BLOCK
      ?auto_42493 - BLOCK
    )
    :vars
    (
      ?auto_42495 - BLOCK
      ?auto_42496 - BLOCK
      ?auto_42494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42490 ?auto_42491 ) ) ( not ( = ?auto_42490 ?auto_42492 ) ) ( not ( = ?auto_42490 ?auto_42493 ) ) ( not ( = ?auto_42491 ?auto_42492 ) ) ( not ( = ?auto_42491 ?auto_42493 ) ) ( not ( = ?auto_42492 ?auto_42493 ) ) ( ON ?auto_42493 ?auto_42495 ) ( not ( = ?auto_42490 ?auto_42495 ) ) ( not ( = ?auto_42491 ?auto_42495 ) ) ( not ( = ?auto_42492 ?auto_42495 ) ) ( not ( = ?auto_42493 ?auto_42495 ) ) ( ON ?auto_42492 ?auto_42493 ) ( ON-TABLE ?auto_42496 ) ( ON ?auto_42495 ?auto_42496 ) ( not ( = ?auto_42496 ?auto_42495 ) ) ( not ( = ?auto_42496 ?auto_42493 ) ) ( not ( = ?auto_42496 ?auto_42492 ) ) ( not ( = ?auto_42490 ?auto_42496 ) ) ( not ( = ?auto_42491 ?auto_42496 ) ) ( ON ?auto_42490 ?auto_42494 ) ( CLEAR ?auto_42490 ) ( not ( = ?auto_42490 ?auto_42494 ) ) ( not ( = ?auto_42491 ?auto_42494 ) ) ( not ( = ?auto_42492 ?auto_42494 ) ) ( not ( = ?auto_42493 ?auto_42494 ) ) ( not ( = ?auto_42495 ?auto_42494 ) ) ( not ( = ?auto_42496 ?auto_42494 ) ) ( HOLDING ?auto_42491 ) ( CLEAR ?auto_42492 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42496 ?auto_42495 ?auto_42493 ?auto_42492 ?auto_42491 )
      ( MAKE-4PILE ?auto_42490 ?auto_42491 ?auto_42492 ?auto_42493 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42497 - BLOCK
      ?auto_42498 - BLOCK
      ?auto_42499 - BLOCK
      ?auto_42500 - BLOCK
    )
    :vars
    (
      ?auto_42501 - BLOCK
      ?auto_42502 - BLOCK
      ?auto_42503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42497 ?auto_42498 ) ) ( not ( = ?auto_42497 ?auto_42499 ) ) ( not ( = ?auto_42497 ?auto_42500 ) ) ( not ( = ?auto_42498 ?auto_42499 ) ) ( not ( = ?auto_42498 ?auto_42500 ) ) ( not ( = ?auto_42499 ?auto_42500 ) ) ( ON ?auto_42500 ?auto_42501 ) ( not ( = ?auto_42497 ?auto_42501 ) ) ( not ( = ?auto_42498 ?auto_42501 ) ) ( not ( = ?auto_42499 ?auto_42501 ) ) ( not ( = ?auto_42500 ?auto_42501 ) ) ( ON ?auto_42499 ?auto_42500 ) ( ON-TABLE ?auto_42502 ) ( ON ?auto_42501 ?auto_42502 ) ( not ( = ?auto_42502 ?auto_42501 ) ) ( not ( = ?auto_42502 ?auto_42500 ) ) ( not ( = ?auto_42502 ?auto_42499 ) ) ( not ( = ?auto_42497 ?auto_42502 ) ) ( not ( = ?auto_42498 ?auto_42502 ) ) ( ON ?auto_42497 ?auto_42503 ) ( not ( = ?auto_42497 ?auto_42503 ) ) ( not ( = ?auto_42498 ?auto_42503 ) ) ( not ( = ?auto_42499 ?auto_42503 ) ) ( not ( = ?auto_42500 ?auto_42503 ) ) ( not ( = ?auto_42501 ?auto_42503 ) ) ( not ( = ?auto_42502 ?auto_42503 ) ) ( CLEAR ?auto_42499 ) ( ON ?auto_42498 ?auto_42497 ) ( CLEAR ?auto_42498 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42503 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42503 ?auto_42497 )
      ( MAKE-4PILE ?auto_42497 ?auto_42498 ?auto_42499 ?auto_42500 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42504 - BLOCK
      ?auto_42505 - BLOCK
      ?auto_42506 - BLOCK
      ?auto_42507 - BLOCK
    )
    :vars
    (
      ?auto_42510 - BLOCK
      ?auto_42508 - BLOCK
      ?auto_42509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42504 ?auto_42505 ) ) ( not ( = ?auto_42504 ?auto_42506 ) ) ( not ( = ?auto_42504 ?auto_42507 ) ) ( not ( = ?auto_42505 ?auto_42506 ) ) ( not ( = ?auto_42505 ?auto_42507 ) ) ( not ( = ?auto_42506 ?auto_42507 ) ) ( ON ?auto_42507 ?auto_42510 ) ( not ( = ?auto_42504 ?auto_42510 ) ) ( not ( = ?auto_42505 ?auto_42510 ) ) ( not ( = ?auto_42506 ?auto_42510 ) ) ( not ( = ?auto_42507 ?auto_42510 ) ) ( ON-TABLE ?auto_42508 ) ( ON ?auto_42510 ?auto_42508 ) ( not ( = ?auto_42508 ?auto_42510 ) ) ( not ( = ?auto_42508 ?auto_42507 ) ) ( not ( = ?auto_42508 ?auto_42506 ) ) ( not ( = ?auto_42504 ?auto_42508 ) ) ( not ( = ?auto_42505 ?auto_42508 ) ) ( ON ?auto_42504 ?auto_42509 ) ( not ( = ?auto_42504 ?auto_42509 ) ) ( not ( = ?auto_42505 ?auto_42509 ) ) ( not ( = ?auto_42506 ?auto_42509 ) ) ( not ( = ?auto_42507 ?auto_42509 ) ) ( not ( = ?auto_42510 ?auto_42509 ) ) ( not ( = ?auto_42508 ?auto_42509 ) ) ( ON ?auto_42505 ?auto_42504 ) ( CLEAR ?auto_42505 ) ( ON-TABLE ?auto_42509 ) ( HOLDING ?auto_42506 ) ( CLEAR ?auto_42507 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42508 ?auto_42510 ?auto_42507 ?auto_42506 )
      ( MAKE-4PILE ?auto_42504 ?auto_42505 ?auto_42506 ?auto_42507 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42511 - BLOCK
      ?auto_42512 - BLOCK
      ?auto_42513 - BLOCK
      ?auto_42514 - BLOCK
    )
    :vars
    (
      ?auto_42515 - BLOCK
      ?auto_42517 - BLOCK
      ?auto_42516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42511 ?auto_42512 ) ) ( not ( = ?auto_42511 ?auto_42513 ) ) ( not ( = ?auto_42511 ?auto_42514 ) ) ( not ( = ?auto_42512 ?auto_42513 ) ) ( not ( = ?auto_42512 ?auto_42514 ) ) ( not ( = ?auto_42513 ?auto_42514 ) ) ( ON ?auto_42514 ?auto_42515 ) ( not ( = ?auto_42511 ?auto_42515 ) ) ( not ( = ?auto_42512 ?auto_42515 ) ) ( not ( = ?auto_42513 ?auto_42515 ) ) ( not ( = ?auto_42514 ?auto_42515 ) ) ( ON-TABLE ?auto_42517 ) ( ON ?auto_42515 ?auto_42517 ) ( not ( = ?auto_42517 ?auto_42515 ) ) ( not ( = ?auto_42517 ?auto_42514 ) ) ( not ( = ?auto_42517 ?auto_42513 ) ) ( not ( = ?auto_42511 ?auto_42517 ) ) ( not ( = ?auto_42512 ?auto_42517 ) ) ( ON ?auto_42511 ?auto_42516 ) ( not ( = ?auto_42511 ?auto_42516 ) ) ( not ( = ?auto_42512 ?auto_42516 ) ) ( not ( = ?auto_42513 ?auto_42516 ) ) ( not ( = ?auto_42514 ?auto_42516 ) ) ( not ( = ?auto_42515 ?auto_42516 ) ) ( not ( = ?auto_42517 ?auto_42516 ) ) ( ON ?auto_42512 ?auto_42511 ) ( ON-TABLE ?auto_42516 ) ( CLEAR ?auto_42514 ) ( ON ?auto_42513 ?auto_42512 ) ( CLEAR ?auto_42513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42516 ?auto_42511 ?auto_42512 )
      ( MAKE-4PILE ?auto_42511 ?auto_42512 ?auto_42513 ?auto_42514 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42518 - BLOCK
      ?auto_42519 - BLOCK
      ?auto_42520 - BLOCK
      ?auto_42521 - BLOCK
    )
    :vars
    (
      ?auto_42524 - BLOCK
      ?auto_42522 - BLOCK
      ?auto_42523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42518 ?auto_42519 ) ) ( not ( = ?auto_42518 ?auto_42520 ) ) ( not ( = ?auto_42518 ?auto_42521 ) ) ( not ( = ?auto_42519 ?auto_42520 ) ) ( not ( = ?auto_42519 ?auto_42521 ) ) ( not ( = ?auto_42520 ?auto_42521 ) ) ( not ( = ?auto_42518 ?auto_42524 ) ) ( not ( = ?auto_42519 ?auto_42524 ) ) ( not ( = ?auto_42520 ?auto_42524 ) ) ( not ( = ?auto_42521 ?auto_42524 ) ) ( ON-TABLE ?auto_42522 ) ( ON ?auto_42524 ?auto_42522 ) ( not ( = ?auto_42522 ?auto_42524 ) ) ( not ( = ?auto_42522 ?auto_42521 ) ) ( not ( = ?auto_42522 ?auto_42520 ) ) ( not ( = ?auto_42518 ?auto_42522 ) ) ( not ( = ?auto_42519 ?auto_42522 ) ) ( ON ?auto_42518 ?auto_42523 ) ( not ( = ?auto_42518 ?auto_42523 ) ) ( not ( = ?auto_42519 ?auto_42523 ) ) ( not ( = ?auto_42520 ?auto_42523 ) ) ( not ( = ?auto_42521 ?auto_42523 ) ) ( not ( = ?auto_42524 ?auto_42523 ) ) ( not ( = ?auto_42522 ?auto_42523 ) ) ( ON ?auto_42519 ?auto_42518 ) ( ON-TABLE ?auto_42523 ) ( ON ?auto_42520 ?auto_42519 ) ( CLEAR ?auto_42520 ) ( HOLDING ?auto_42521 ) ( CLEAR ?auto_42524 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42522 ?auto_42524 ?auto_42521 )
      ( MAKE-4PILE ?auto_42518 ?auto_42519 ?auto_42520 ?auto_42521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42525 - BLOCK
      ?auto_42526 - BLOCK
      ?auto_42527 - BLOCK
      ?auto_42528 - BLOCK
    )
    :vars
    (
      ?auto_42531 - BLOCK
      ?auto_42530 - BLOCK
      ?auto_42529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42525 ?auto_42526 ) ) ( not ( = ?auto_42525 ?auto_42527 ) ) ( not ( = ?auto_42525 ?auto_42528 ) ) ( not ( = ?auto_42526 ?auto_42527 ) ) ( not ( = ?auto_42526 ?auto_42528 ) ) ( not ( = ?auto_42527 ?auto_42528 ) ) ( not ( = ?auto_42525 ?auto_42531 ) ) ( not ( = ?auto_42526 ?auto_42531 ) ) ( not ( = ?auto_42527 ?auto_42531 ) ) ( not ( = ?auto_42528 ?auto_42531 ) ) ( ON-TABLE ?auto_42530 ) ( ON ?auto_42531 ?auto_42530 ) ( not ( = ?auto_42530 ?auto_42531 ) ) ( not ( = ?auto_42530 ?auto_42528 ) ) ( not ( = ?auto_42530 ?auto_42527 ) ) ( not ( = ?auto_42525 ?auto_42530 ) ) ( not ( = ?auto_42526 ?auto_42530 ) ) ( ON ?auto_42525 ?auto_42529 ) ( not ( = ?auto_42525 ?auto_42529 ) ) ( not ( = ?auto_42526 ?auto_42529 ) ) ( not ( = ?auto_42527 ?auto_42529 ) ) ( not ( = ?auto_42528 ?auto_42529 ) ) ( not ( = ?auto_42531 ?auto_42529 ) ) ( not ( = ?auto_42530 ?auto_42529 ) ) ( ON ?auto_42526 ?auto_42525 ) ( ON-TABLE ?auto_42529 ) ( ON ?auto_42527 ?auto_42526 ) ( CLEAR ?auto_42531 ) ( ON ?auto_42528 ?auto_42527 ) ( CLEAR ?auto_42528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42529 ?auto_42525 ?auto_42526 ?auto_42527 )
      ( MAKE-4PILE ?auto_42525 ?auto_42526 ?auto_42527 ?auto_42528 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42532 - BLOCK
      ?auto_42533 - BLOCK
      ?auto_42534 - BLOCK
      ?auto_42535 - BLOCK
    )
    :vars
    (
      ?auto_42538 - BLOCK
      ?auto_42536 - BLOCK
      ?auto_42537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42532 ?auto_42533 ) ) ( not ( = ?auto_42532 ?auto_42534 ) ) ( not ( = ?auto_42532 ?auto_42535 ) ) ( not ( = ?auto_42533 ?auto_42534 ) ) ( not ( = ?auto_42533 ?auto_42535 ) ) ( not ( = ?auto_42534 ?auto_42535 ) ) ( not ( = ?auto_42532 ?auto_42538 ) ) ( not ( = ?auto_42533 ?auto_42538 ) ) ( not ( = ?auto_42534 ?auto_42538 ) ) ( not ( = ?auto_42535 ?auto_42538 ) ) ( ON-TABLE ?auto_42536 ) ( not ( = ?auto_42536 ?auto_42538 ) ) ( not ( = ?auto_42536 ?auto_42535 ) ) ( not ( = ?auto_42536 ?auto_42534 ) ) ( not ( = ?auto_42532 ?auto_42536 ) ) ( not ( = ?auto_42533 ?auto_42536 ) ) ( ON ?auto_42532 ?auto_42537 ) ( not ( = ?auto_42532 ?auto_42537 ) ) ( not ( = ?auto_42533 ?auto_42537 ) ) ( not ( = ?auto_42534 ?auto_42537 ) ) ( not ( = ?auto_42535 ?auto_42537 ) ) ( not ( = ?auto_42538 ?auto_42537 ) ) ( not ( = ?auto_42536 ?auto_42537 ) ) ( ON ?auto_42533 ?auto_42532 ) ( ON-TABLE ?auto_42537 ) ( ON ?auto_42534 ?auto_42533 ) ( ON ?auto_42535 ?auto_42534 ) ( CLEAR ?auto_42535 ) ( HOLDING ?auto_42538 ) ( CLEAR ?auto_42536 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42536 ?auto_42538 )
      ( MAKE-4PILE ?auto_42532 ?auto_42533 ?auto_42534 ?auto_42535 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42539 - BLOCK
      ?auto_42540 - BLOCK
      ?auto_42541 - BLOCK
      ?auto_42542 - BLOCK
    )
    :vars
    (
      ?auto_42545 - BLOCK
      ?auto_42543 - BLOCK
      ?auto_42544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42539 ?auto_42540 ) ) ( not ( = ?auto_42539 ?auto_42541 ) ) ( not ( = ?auto_42539 ?auto_42542 ) ) ( not ( = ?auto_42540 ?auto_42541 ) ) ( not ( = ?auto_42540 ?auto_42542 ) ) ( not ( = ?auto_42541 ?auto_42542 ) ) ( not ( = ?auto_42539 ?auto_42545 ) ) ( not ( = ?auto_42540 ?auto_42545 ) ) ( not ( = ?auto_42541 ?auto_42545 ) ) ( not ( = ?auto_42542 ?auto_42545 ) ) ( ON-TABLE ?auto_42543 ) ( not ( = ?auto_42543 ?auto_42545 ) ) ( not ( = ?auto_42543 ?auto_42542 ) ) ( not ( = ?auto_42543 ?auto_42541 ) ) ( not ( = ?auto_42539 ?auto_42543 ) ) ( not ( = ?auto_42540 ?auto_42543 ) ) ( ON ?auto_42539 ?auto_42544 ) ( not ( = ?auto_42539 ?auto_42544 ) ) ( not ( = ?auto_42540 ?auto_42544 ) ) ( not ( = ?auto_42541 ?auto_42544 ) ) ( not ( = ?auto_42542 ?auto_42544 ) ) ( not ( = ?auto_42545 ?auto_42544 ) ) ( not ( = ?auto_42543 ?auto_42544 ) ) ( ON ?auto_42540 ?auto_42539 ) ( ON-TABLE ?auto_42544 ) ( ON ?auto_42541 ?auto_42540 ) ( ON ?auto_42542 ?auto_42541 ) ( CLEAR ?auto_42543 ) ( ON ?auto_42545 ?auto_42542 ) ( CLEAR ?auto_42545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42544 ?auto_42539 ?auto_42540 ?auto_42541 ?auto_42542 )
      ( MAKE-4PILE ?auto_42539 ?auto_42540 ?auto_42541 ?auto_42542 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42546 - BLOCK
      ?auto_42547 - BLOCK
      ?auto_42548 - BLOCK
      ?auto_42549 - BLOCK
    )
    :vars
    (
      ?auto_42550 - BLOCK
      ?auto_42552 - BLOCK
      ?auto_42551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42546 ?auto_42547 ) ) ( not ( = ?auto_42546 ?auto_42548 ) ) ( not ( = ?auto_42546 ?auto_42549 ) ) ( not ( = ?auto_42547 ?auto_42548 ) ) ( not ( = ?auto_42547 ?auto_42549 ) ) ( not ( = ?auto_42548 ?auto_42549 ) ) ( not ( = ?auto_42546 ?auto_42550 ) ) ( not ( = ?auto_42547 ?auto_42550 ) ) ( not ( = ?auto_42548 ?auto_42550 ) ) ( not ( = ?auto_42549 ?auto_42550 ) ) ( not ( = ?auto_42552 ?auto_42550 ) ) ( not ( = ?auto_42552 ?auto_42549 ) ) ( not ( = ?auto_42552 ?auto_42548 ) ) ( not ( = ?auto_42546 ?auto_42552 ) ) ( not ( = ?auto_42547 ?auto_42552 ) ) ( ON ?auto_42546 ?auto_42551 ) ( not ( = ?auto_42546 ?auto_42551 ) ) ( not ( = ?auto_42547 ?auto_42551 ) ) ( not ( = ?auto_42548 ?auto_42551 ) ) ( not ( = ?auto_42549 ?auto_42551 ) ) ( not ( = ?auto_42550 ?auto_42551 ) ) ( not ( = ?auto_42552 ?auto_42551 ) ) ( ON ?auto_42547 ?auto_42546 ) ( ON-TABLE ?auto_42551 ) ( ON ?auto_42548 ?auto_42547 ) ( ON ?auto_42549 ?auto_42548 ) ( ON ?auto_42550 ?auto_42549 ) ( CLEAR ?auto_42550 ) ( HOLDING ?auto_42552 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42552 )
      ( MAKE-4PILE ?auto_42546 ?auto_42547 ?auto_42548 ?auto_42549 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42553 - BLOCK
      ?auto_42554 - BLOCK
      ?auto_42555 - BLOCK
      ?auto_42556 - BLOCK
    )
    :vars
    (
      ?auto_42557 - BLOCK
      ?auto_42559 - BLOCK
      ?auto_42558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42553 ?auto_42554 ) ) ( not ( = ?auto_42553 ?auto_42555 ) ) ( not ( = ?auto_42553 ?auto_42556 ) ) ( not ( = ?auto_42554 ?auto_42555 ) ) ( not ( = ?auto_42554 ?auto_42556 ) ) ( not ( = ?auto_42555 ?auto_42556 ) ) ( not ( = ?auto_42553 ?auto_42557 ) ) ( not ( = ?auto_42554 ?auto_42557 ) ) ( not ( = ?auto_42555 ?auto_42557 ) ) ( not ( = ?auto_42556 ?auto_42557 ) ) ( not ( = ?auto_42559 ?auto_42557 ) ) ( not ( = ?auto_42559 ?auto_42556 ) ) ( not ( = ?auto_42559 ?auto_42555 ) ) ( not ( = ?auto_42553 ?auto_42559 ) ) ( not ( = ?auto_42554 ?auto_42559 ) ) ( ON ?auto_42553 ?auto_42558 ) ( not ( = ?auto_42553 ?auto_42558 ) ) ( not ( = ?auto_42554 ?auto_42558 ) ) ( not ( = ?auto_42555 ?auto_42558 ) ) ( not ( = ?auto_42556 ?auto_42558 ) ) ( not ( = ?auto_42557 ?auto_42558 ) ) ( not ( = ?auto_42559 ?auto_42558 ) ) ( ON ?auto_42554 ?auto_42553 ) ( ON-TABLE ?auto_42558 ) ( ON ?auto_42555 ?auto_42554 ) ( ON ?auto_42556 ?auto_42555 ) ( ON ?auto_42557 ?auto_42556 ) ( ON ?auto_42559 ?auto_42557 ) ( CLEAR ?auto_42559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42558 ?auto_42553 ?auto_42554 ?auto_42555 ?auto_42556 ?auto_42557 )
      ( MAKE-4PILE ?auto_42553 ?auto_42554 ?auto_42555 ?auto_42556 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42561 - BLOCK
    )
    :vars
    (
      ?auto_42562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42562 ?auto_42561 ) ( CLEAR ?auto_42562 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42561 ) ( not ( = ?auto_42561 ?auto_42562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42562 ?auto_42561 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42563 - BLOCK
    )
    :vars
    (
      ?auto_42564 - BLOCK
      ?auto_42565 - BLOCK
      ?auto_42566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42564 ?auto_42563 ) ( CLEAR ?auto_42564 ) ( ON-TABLE ?auto_42563 ) ( not ( = ?auto_42563 ?auto_42564 ) ) ( HOLDING ?auto_42565 ) ( CLEAR ?auto_42566 ) ( not ( = ?auto_42563 ?auto_42565 ) ) ( not ( = ?auto_42563 ?auto_42566 ) ) ( not ( = ?auto_42564 ?auto_42565 ) ) ( not ( = ?auto_42564 ?auto_42566 ) ) ( not ( = ?auto_42565 ?auto_42566 ) ) )
    :subtasks
    ( ( !STACK ?auto_42565 ?auto_42566 )
      ( MAKE-1PILE ?auto_42563 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42567 - BLOCK
    )
    :vars
    (
      ?auto_42570 - BLOCK
      ?auto_42568 - BLOCK
      ?auto_42569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42570 ?auto_42567 ) ( ON-TABLE ?auto_42567 ) ( not ( = ?auto_42567 ?auto_42570 ) ) ( CLEAR ?auto_42568 ) ( not ( = ?auto_42567 ?auto_42569 ) ) ( not ( = ?auto_42567 ?auto_42568 ) ) ( not ( = ?auto_42570 ?auto_42569 ) ) ( not ( = ?auto_42570 ?auto_42568 ) ) ( not ( = ?auto_42569 ?auto_42568 ) ) ( ON ?auto_42569 ?auto_42570 ) ( CLEAR ?auto_42569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42567 ?auto_42570 )
      ( MAKE-1PILE ?auto_42567 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42571 - BLOCK
    )
    :vars
    (
      ?auto_42573 - BLOCK
      ?auto_42574 - BLOCK
      ?auto_42572 - BLOCK
      ?auto_42576 - BLOCK
      ?auto_42575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42573 ?auto_42571 ) ( ON-TABLE ?auto_42571 ) ( not ( = ?auto_42571 ?auto_42573 ) ) ( not ( = ?auto_42571 ?auto_42574 ) ) ( not ( = ?auto_42571 ?auto_42572 ) ) ( not ( = ?auto_42573 ?auto_42574 ) ) ( not ( = ?auto_42573 ?auto_42572 ) ) ( not ( = ?auto_42574 ?auto_42572 ) ) ( ON ?auto_42574 ?auto_42573 ) ( CLEAR ?auto_42574 ) ( HOLDING ?auto_42572 ) ( CLEAR ?auto_42576 ) ( ON-TABLE ?auto_42575 ) ( ON ?auto_42576 ?auto_42575 ) ( not ( = ?auto_42575 ?auto_42576 ) ) ( not ( = ?auto_42575 ?auto_42572 ) ) ( not ( = ?auto_42576 ?auto_42572 ) ) ( not ( = ?auto_42571 ?auto_42576 ) ) ( not ( = ?auto_42571 ?auto_42575 ) ) ( not ( = ?auto_42573 ?auto_42576 ) ) ( not ( = ?auto_42573 ?auto_42575 ) ) ( not ( = ?auto_42574 ?auto_42576 ) ) ( not ( = ?auto_42574 ?auto_42575 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42575 ?auto_42576 ?auto_42572 )
      ( MAKE-1PILE ?auto_42571 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42577 - BLOCK
    )
    :vars
    (
      ?auto_42578 - BLOCK
      ?auto_42579 - BLOCK
      ?auto_42580 - BLOCK
      ?auto_42582 - BLOCK
      ?auto_42581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42578 ?auto_42577 ) ( ON-TABLE ?auto_42577 ) ( not ( = ?auto_42577 ?auto_42578 ) ) ( not ( = ?auto_42577 ?auto_42579 ) ) ( not ( = ?auto_42577 ?auto_42580 ) ) ( not ( = ?auto_42578 ?auto_42579 ) ) ( not ( = ?auto_42578 ?auto_42580 ) ) ( not ( = ?auto_42579 ?auto_42580 ) ) ( ON ?auto_42579 ?auto_42578 ) ( CLEAR ?auto_42582 ) ( ON-TABLE ?auto_42581 ) ( ON ?auto_42582 ?auto_42581 ) ( not ( = ?auto_42581 ?auto_42582 ) ) ( not ( = ?auto_42581 ?auto_42580 ) ) ( not ( = ?auto_42582 ?auto_42580 ) ) ( not ( = ?auto_42577 ?auto_42582 ) ) ( not ( = ?auto_42577 ?auto_42581 ) ) ( not ( = ?auto_42578 ?auto_42582 ) ) ( not ( = ?auto_42578 ?auto_42581 ) ) ( not ( = ?auto_42579 ?auto_42582 ) ) ( not ( = ?auto_42579 ?auto_42581 ) ) ( ON ?auto_42580 ?auto_42579 ) ( CLEAR ?auto_42580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42577 ?auto_42578 ?auto_42579 )
      ( MAKE-1PILE ?auto_42577 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42583 - BLOCK
    )
    :vars
    (
      ?auto_42588 - BLOCK
      ?auto_42586 - BLOCK
      ?auto_42587 - BLOCK
      ?auto_42585 - BLOCK
      ?auto_42584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42588 ?auto_42583 ) ( ON-TABLE ?auto_42583 ) ( not ( = ?auto_42583 ?auto_42588 ) ) ( not ( = ?auto_42583 ?auto_42586 ) ) ( not ( = ?auto_42583 ?auto_42587 ) ) ( not ( = ?auto_42588 ?auto_42586 ) ) ( not ( = ?auto_42588 ?auto_42587 ) ) ( not ( = ?auto_42586 ?auto_42587 ) ) ( ON ?auto_42586 ?auto_42588 ) ( ON-TABLE ?auto_42585 ) ( not ( = ?auto_42585 ?auto_42584 ) ) ( not ( = ?auto_42585 ?auto_42587 ) ) ( not ( = ?auto_42584 ?auto_42587 ) ) ( not ( = ?auto_42583 ?auto_42584 ) ) ( not ( = ?auto_42583 ?auto_42585 ) ) ( not ( = ?auto_42588 ?auto_42584 ) ) ( not ( = ?auto_42588 ?auto_42585 ) ) ( not ( = ?auto_42586 ?auto_42584 ) ) ( not ( = ?auto_42586 ?auto_42585 ) ) ( ON ?auto_42587 ?auto_42586 ) ( CLEAR ?auto_42587 ) ( HOLDING ?auto_42584 ) ( CLEAR ?auto_42585 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42585 ?auto_42584 )
      ( MAKE-1PILE ?auto_42583 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42589 - BLOCK
    )
    :vars
    (
      ?auto_42594 - BLOCK
      ?auto_42592 - BLOCK
      ?auto_42593 - BLOCK
      ?auto_42591 - BLOCK
      ?auto_42590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42594 ?auto_42589 ) ( ON-TABLE ?auto_42589 ) ( not ( = ?auto_42589 ?auto_42594 ) ) ( not ( = ?auto_42589 ?auto_42592 ) ) ( not ( = ?auto_42589 ?auto_42593 ) ) ( not ( = ?auto_42594 ?auto_42592 ) ) ( not ( = ?auto_42594 ?auto_42593 ) ) ( not ( = ?auto_42592 ?auto_42593 ) ) ( ON ?auto_42592 ?auto_42594 ) ( ON-TABLE ?auto_42591 ) ( not ( = ?auto_42591 ?auto_42590 ) ) ( not ( = ?auto_42591 ?auto_42593 ) ) ( not ( = ?auto_42590 ?auto_42593 ) ) ( not ( = ?auto_42589 ?auto_42590 ) ) ( not ( = ?auto_42589 ?auto_42591 ) ) ( not ( = ?auto_42594 ?auto_42590 ) ) ( not ( = ?auto_42594 ?auto_42591 ) ) ( not ( = ?auto_42592 ?auto_42590 ) ) ( not ( = ?auto_42592 ?auto_42591 ) ) ( ON ?auto_42593 ?auto_42592 ) ( CLEAR ?auto_42591 ) ( ON ?auto_42590 ?auto_42593 ) ( CLEAR ?auto_42590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42589 ?auto_42594 ?auto_42592 ?auto_42593 )
      ( MAKE-1PILE ?auto_42589 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42595 - BLOCK
    )
    :vars
    (
      ?auto_42600 - BLOCK
      ?auto_42596 - BLOCK
      ?auto_42597 - BLOCK
      ?auto_42599 - BLOCK
      ?auto_42598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42600 ?auto_42595 ) ( ON-TABLE ?auto_42595 ) ( not ( = ?auto_42595 ?auto_42600 ) ) ( not ( = ?auto_42595 ?auto_42596 ) ) ( not ( = ?auto_42595 ?auto_42597 ) ) ( not ( = ?auto_42600 ?auto_42596 ) ) ( not ( = ?auto_42600 ?auto_42597 ) ) ( not ( = ?auto_42596 ?auto_42597 ) ) ( ON ?auto_42596 ?auto_42600 ) ( not ( = ?auto_42599 ?auto_42598 ) ) ( not ( = ?auto_42599 ?auto_42597 ) ) ( not ( = ?auto_42598 ?auto_42597 ) ) ( not ( = ?auto_42595 ?auto_42598 ) ) ( not ( = ?auto_42595 ?auto_42599 ) ) ( not ( = ?auto_42600 ?auto_42598 ) ) ( not ( = ?auto_42600 ?auto_42599 ) ) ( not ( = ?auto_42596 ?auto_42598 ) ) ( not ( = ?auto_42596 ?auto_42599 ) ) ( ON ?auto_42597 ?auto_42596 ) ( ON ?auto_42598 ?auto_42597 ) ( CLEAR ?auto_42598 ) ( HOLDING ?auto_42599 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42599 )
      ( MAKE-1PILE ?auto_42595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42601 - BLOCK
    )
    :vars
    (
      ?auto_42606 - BLOCK
      ?auto_42602 - BLOCK
      ?auto_42604 - BLOCK
      ?auto_42605 - BLOCK
      ?auto_42603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42606 ?auto_42601 ) ( ON-TABLE ?auto_42601 ) ( not ( = ?auto_42601 ?auto_42606 ) ) ( not ( = ?auto_42601 ?auto_42602 ) ) ( not ( = ?auto_42601 ?auto_42604 ) ) ( not ( = ?auto_42606 ?auto_42602 ) ) ( not ( = ?auto_42606 ?auto_42604 ) ) ( not ( = ?auto_42602 ?auto_42604 ) ) ( ON ?auto_42602 ?auto_42606 ) ( not ( = ?auto_42605 ?auto_42603 ) ) ( not ( = ?auto_42605 ?auto_42604 ) ) ( not ( = ?auto_42603 ?auto_42604 ) ) ( not ( = ?auto_42601 ?auto_42603 ) ) ( not ( = ?auto_42601 ?auto_42605 ) ) ( not ( = ?auto_42606 ?auto_42603 ) ) ( not ( = ?auto_42606 ?auto_42605 ) ) ( not ( = ?auto_42602 ?auto_42603 ) ) ( not ( = ?auto_42602 ?auto_42605 ) ) ( ON ?auto_42604 ?auto_42602 ) ( ON ?auto_42603 ?auto_42604 ) ( ON ?auto_42605 ?auto_42603 ) ( CLEAR ?auto_42605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42601 ?auto_42606 ?auto_42602 ?auto_42604 ?auto_42603 )
      ( MAKE-1PILE ?auto_42601 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42607 - BLOCK
    )
    :vars
    (
      ?auto_42609 - BLOCK
      ?auto_42612 - BLOCK
      ?auto_42611 - BLOCK
      ?auto_42608 - BLOCK
      ?auto_42610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42609 ?auto_42607 ) ( ON-TABLE ?auto_42607 ) ( not ( = ?auto_42607 ?auto_42609 ) ) ( not ( = ?auto_42607 ?auto_42612 ) ) ( not ( = ?auto_42607 ?auto_42611 ) ) ( not ( = ?auto_42609 ?auto_42612 ) ) ( not ( = ?auto_42609 ?auto_42611 ) ) ( not ( = ?auto_42612 ?auto_42611 ) ) ( ON ?auto_42612 ?auto_42609 ) ( not ( = ?auto_42608 ?auto_42610 ) ) ( not ( = ?auto_42608 ?auto_42611 ) ) ( not ( = ?auto_42610 ?auto_42611 ) ) ( not ( = ?auto_42607 ?auto_42610 ) ) ( not ( = ?auto_42607 ?auto_42608 ) ) ( not ( = ?auto_42609 ?auto_42610 ) ) ( not ( = ?auto_42609 ?auto_42608 ) ) ( not ( = ?auto_42612 ?auto_42610 ) ) ( not ( = ?auto_42612 ?auto_42608 ) ) ( ON ?auto_42611 ?auto_42612 ) ( ON ?auto_42610 ?auto_42611 ) ( HOLDING ?auto_42608 ) ( CLEAR ?auto_42610 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42607 ?auto_42609 ?auto_42612 ?auto_42611 ?auto_42610 ?auto_42608 )
      ( MAKE-1PILE ?auto_42607 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42613 - BLOCK
    )
    :vars
    (
      ?auto_42617 - BLOCK
      ?auto_42616 - BLOCK
      ?auto_42615 - BLOCK
      ?auto_42618 - BLOCK
      ?auto_42614 - BLOCK
      ?auto_42619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42617 ?auto_42613 ) ( ON-TABLE ?auto_42613 ) ( not ( = ?auto_42613 ?auto_42617 ) ) ( not ( = ?auto_42613 ?auto_42616 ) ) ( not ( = ?auto_42613 ?auto_42615 ) ) ( not ( = ?auto_42617 ?auto_42616 ) ) ( not ( = ?auto_42617 ?auto_42615 ) ) ( not ( = ?auto_42616 ?auto_42615 ) ) ( ON ?auto_42616 ?auto_42617 ) ( not ( = ?auto_42618 ?auto_42614 ) ) ( not ( = ?auto_42618 ?auto_42615 ) ) ( not ( = ?auto_42614 ?auto_42615 ) ) ( not ( = ?auto_42613 ?auto_42614 ) ) ( not ( = ?auto_42613 ?auto_42618 ) ) ( not ( = ?auto_42617 ?auto_42614 ) ) ( not ( = ?auto_42617 ?auto_42618 ) ) ( not ( = ?auto_42616 ?auto_42614 ) ) ( not ( = ?auto_42616 ?auto_42618 ) ) ( ON ?auto_42615 ?auto_42616 ) ( ON ?auto_42614 ?auto_42615 ) ( CLEAR ?auto_42614 ) ( ON ?auto_42618 ?auto_42619 ) ( CLEAR ?auto_42618 ) ( HAND-EMPTY ) ( not ( = ?auto_42613 ?auto_42619 ) ) ( not ( = ?auto_42617 ?auto_42619 ) ) ( not ( = ?auto_42616 ?auto_42619 ) ) ( not ( = ?auto_42615 ?auto_42619 ) ) ( not ( = ?auto_42618 ?auto_42619 ) ) ( not ( = ?auto_42614 ?auto_42619 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42618 ?auto_42619 )
      ( MAKE-1PILE ?auto_42613 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42620 - BLOCK
    )
    :vars
    (
      ?auto_42622 - BLOCK
      ?auto_42624 - BLOCK
      ?auto_42625 - BLOCK
      ?auto_42623 - BLOCK
      ?auto_42621 - BLOCK
      ?auto_42626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42622 ?auto_42620 ) ( ON-TABLE ?auto_42620 ) ( not ( = ?auto_42620 ?auto_42622 ) ) ( not ( = ?auto_42620 ?auto_42624 ) ) ( not ( = ?auto_42620 ?auto_42625 ) ) ( not ( = ?auto_42622 ?auto_42624 ) ) ( not ( = ?auto_42622 ?auto_42625 ) ) ( not ( = ?auto_42624 ?auto_42625 ) ) ( ON ?auto_42624 ?auto_42622 ) ( not ( = ?auto_42623 ?auto_42621 ) ) ( not ( = ?auto_42623 ?auto_42625 ) ) ( not ( = ?auto_42621 ?auto_42625 ) ) ( not ( = ?auto_42620 ?auto_42621 ) ) ( not ( = ?auto_42620 ?auto_42623 ) ) ( not ( = ?auto_42622 ?auto_42621 ) ) ( not ( = ?auto_42622 ?auto_42623 ) ) ( not ( = ?auto_42624 ?auto_42621 ) ) ( not ( = ?auto_42624 ?auto_42623 ) ) ( ON ?auto_42625 ?auto_42624 ) ( ON ?auto_42623 ?auto_42626 ) ( CLEAR ?auto_42623 ) ( not ( = ?auto_42620 ?auto_42626 ) ) ( not ( = ?auto_42622 ?auto_42626 ) ) ( not ( = ?auto_42624 ?auto_42626 ) ) ( not ( = ?auto_42625 ?auto_42626 ) ) ( not ( = ?auto_42623 ?auto_42626 ) ) ( not ( = ?auto_42621 ?auto_42626 ) ) ( HOLDING ?auto_42621 ) ( CLEAR ?auto_42625 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42620 ?auto_42622 ?auto_42624 ?auto_42625 ?auto_42621 )
      ( MAKE-1PILE ?auto_42620 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42627 - BLOCK
    )
    :vars
    (
      ?auto_42630 - BLOCK
      ?auto_42631 - BLOCK
      ?auto_42632 - BLOCK
      ?auto_42629 - BLOCK
      ?auto_42633 - BLOCK
      ?auto_42628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42630 ?auto_42627 ) ( ON-TABLE ?auto_42627 ) ( not ( = ?auto_42627 ?auto_42630 ) ) ( not ( = ?auto_42627 ?auto_42631 ) ) ( not ( = ?auto_42627 ?auto_42632 ) ) ( not ( = ?auto_42630 ?auto_42631 ) ) ( not ( = ?auto_42630 ?auto_42632 ) ) ( not ( = ?auto_42631 ?auto_42632 ) ) ( ON ?auto_42631 ?auto_42630 ) ( not ( = ?auto_42629 ?auto_42633 ) ) ( not ( = ?auto_42629 ?auto_42632 ) ) ( not ( = ?auto_42633 ?auto_42632 ) ) ( not ( = ?auto_42627 ?auto_42633 ) ) ( not ( = ?auto_42627 ?auto_42629 ) ) ( not ( = ?auto_42630 ?auto_42633 ) ) ( not ( = ?auto_42630 ?auto_42629 ) ) ( not ( = ?auto_42631 ?auto_42633 ) ) ( not ( = ?auto_42631 ?auto_42629 ) ) ( ON ?auto_42632 ?auto_42631 ) ( ON ?auto_42629 ?auto_42628 ) ( not ( = ?auto_42627 ?auto_42628 ) ) ( not ( = ?auto_42630 ?auto_42628 ) ) ( not ( = ?auto_42631 ?auto_42628 ) ) ( not ( = ?auto_42632 ?auto_42628 ) ) ( not ( = ?auto_42629 ?auto_42628 ) ) ( not ( = ?auto_42633 ?auto_42628 ) ) ( CLEAR ?auto_42632 ) ( ON ?auto_42633 ?auto_42629 ) ( CLEAR ?auto_42633 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42628 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42628 ?auto_42629 )
      ( MAKE-1PILE ?auto_42627 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42634 - BLOCK
    )
    :vars
    (
      ?auto_42640 - BLOCK
      ?auto_42636 - BLOCK
      ?auto_42639 - BLOCK
      ?auto_42635 - BLOCK
      ?auto_42637 - BLOCK
      ?auto_42638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42640 ?auto_42634 ) ( ON-TABLE ?auto_42634 ) ( not ( = ?auto_42634 ?auto_42640 ) ) ( not ( = ?auto_42634 ?auto_42636 ) ) ( not ( = ?auto_42634 ?auto_42639 ) ) ( not ( = ?auto_42640 ?auto_42636 ) ) ( not ( = ?auto_42640 ?auto_42639 ) ) ( not ( = ?auto_42636 ?auto_42639 ) ) ( ON ?auto_42636 ?auto_42640 ) ( not ( = ?auto_42635 ?auto_42637 ) ) ( not ( = ?auto_42635 ?auto_42639 ) ) ( not ( = ?auto_42637 ?auto_42639 ) ) ( not ( = ?auto_42634 ?auto_42637 ) ) ( not ( = ?auto_42634 ?auto_42635 ) ) ( not ( = ?auto_42640 ?auto_42637 ) ) ( not ( = ?auto_42640 ?auto_42635 ) ) ( not ( = ?auto_42636 ?auto_42637 ) ) ( not ( = ?auto_42636 ?auto_42635 ) ) ( ON ?auto_42635 ?auto_42638 ) ( not ( = ?auto_42634 ?auto_42638 ) ) ( not ( = ?auto_42640 ?auto_42638 ) ) ( not ( = ?auto_42636 ?auto_42638 ) ) ( not ( = ?auto_42639 ?auto_42638 ) ) ( not ( = ?auto_42635 ?auto_42638 ) ) ( not ( = ?auto_42637 ?auto_42638 ) ) ( ON ?auto_42637 ?auto_42635 ) ( CLEAR ?auto_42637 ) ( ON-TABLE ?auto_42638 ) ( HOLDING ?auto_42639 ) ( CLEAR ?auto_42636 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42634 ?auto_42640 ?auto_42636 ?auto_42639 )
      ( MAKE-1PILE ?auto_42634 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42641 - BLOCK
    )
    :vars
    (
      ?auto_42643 - BLOCK
      ?auto_42645 - BLOCK
      ?auto_42642 - BLOCK
      ?auto_42647 - BLOCK
      ?auto_42646 - BLOCK
      ?auto_42644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42643 ?auto_42641 ) ( ON-TABLE ?auto_42641 ) ( not ( = ?auto_42641 ?auto_42643 ) ) ( not ( = ?auto_42641 ?auto_42645 ) ) ( not ( = ?auto_42641 ?auto_42642 ) ) ( not ( = ?auto_42643 ?auto_42645 ) ) ( not ( = ?auto_42643 ?auto_42642 ) ) ( not ( = ?auto_42645 ?auto_42642 ) ) ( ON ?auto_42645 ?auto_42643 ) ( not ( = ?auto_42647 ?auto_42646 ) ) ( not ( = ?auto_42647 ?auto_42642 ) ) ( not ( = ?auto_42646 ?auto_42642 ) ) ( not ( = ?auto_42641 ?auto_42646 ) ) ( not ( = ?auto_42641 ?auto_42647 ) ) ( not ( = ?auto_42643 ?auto_42646 ) ) ( not ( = ?auto_42643 ?auto_42647 ) ) ( not ( = ?auto_42645 ?auto_42646 ) ) ( not ( = ?auto_42645 ?auto_42647 ) ) ( ON ?auto_42647 ?auto_42644 ) ( not ( = ?auto_42641 ?auto_42644 ) ) ( not ( = ?auto_42643 ?auto_42644 ) ) ( not ( = ?auto_42645 ?auto_42644 ) ) ( not ( = ?auto_42642 ?auto_42644 ) ) ( not ( = ?auto_42647 ?auto_42644 ) ) ( not ( = ?auto_42646 ?auto_42644 ) ) ( ON ?auto_42646 ?auto_42647 ) ( ON-TABLE ?auto_42644 ) ( CLEAR ?auto_42645 ) ( ON ?auto_42642 ?auto_42646 ) ( CLEAR ?auto_42642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42644 ?auto_42647 ?auto_42646 )
      ( MAKE-1PILE ?auto_42641 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42648 - BLOCK
    )
    :vars
    (
      ?auto_42654 - BLOCK
      ?auto_42649 - BLOCK
      ?auto_42650 - BLOCK
      ?auto_42652 - BLOCK
      ?auto_42653 - BLOCK
      ?auto_42651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42654 ?auto_42648 ) ( ON-TABLE ?auto_42648 ) ( not ( = ?auto_42648 ?auto_42654 ) ) ( not ( = ?auto_42648 ?auto_42649 ) ) ( not ( = ?auto_42648 ?auto_42650 ) ) ( not ( = ?auto_42654 ?auto_42649 ) ) ( not ( = ?auto_42654 ?auto_42650 ) ) ( not ( = ?auto_42649 ?auto_42650 ) ) ( not ( = ?auto_42652 ?auto_42653 ) ) ( not ( = ?auto_42652 ?auto_42650 ) ) ( not ( = ?auto_42653 ?auto_42650 ) ) ( not ( = ?auto_42648 ?auto_42653 ) ) ( not ( = ?auto_42648 ?auto_42652 ) ) ( not ( = ?auto_42654 ?auto_42653 ) ) ( not ( = ?auto_42654 ?auto_42652 ) ) ( not ( = ?auto_42649 ?auto_42653 ) ) ( not ( = ?auto_42649 ?auto_42652 ) ) ( ON ?auto_42652 ?auto_42651 ) ( not ( = ?auto_42648 ?auto_42651 ) ) ( not ( = ?auto_42654 ?auto_42651 ) ) ( not ( = ?auto_42649 ?auto_42651 ) ) ( not ( = ?auto_42650 ?auto_42651 ) ) ( not ( = ?auto_42652 ?auto_42651 ) ) ( not ( = ?auto_42653 ?auto_42651 ) ) ( ON ?auto_42653 ?auto_42652 ) ( ON-TABLE ?auto_42651 ) ( ON ?auto_42650 ?auto_42653 ) ( CLEAR ?auto_42650 ) ( HOLDING ?auto_42649 ) ( CLEAR ?auto_42654 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42648 ?auto_42654 ?auto_42649 )
      ( MAKE-1PILE ?auto_42648 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42655 - BLOCK
    )
    :vars
    (
      ?auto_42659 - BLOCK
      ?auto_42657 - BLOCK
      ?auto_42658 - BLOCK
      ?auto_42661 - BLOCK
      ?auto_42656 - BLOCK
      ?auto_42660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42659 ?auto_42655 ) ( ON-TABLE ?auto_42655 ) ( not ( = ?auto_42655 ?auto_42659 ) ) ( not ( = ?auto_42655 ?auto_42657 ) ) ( not ( = ?auto_42655 ?auto_42658 ) ) ( not ( = ?auto_42659 ?auto_42657 ) ) ( not ( = ?auto_42659 ?auto_42658 ) ) ( not ( = ?auto_42657 ?auto_42658 ) ) ( not ( = ?auto_42661 ?auto_42656 ) ) ( not ( = ?auto_42661 ?auto_42658 ) ) ( not ( = ?auto_42656 ?auto_42658 ) ) ( not ( = ?auto_42655 ?auto_42656 ) ) ( not ( = ?auto_42655 ?auto_42661 ) ) ( not ( = ?auto_42659 ?auto_42656 ) ) ( not ( = ?auto_42659 ?auto_42661 ) ) ( not ( = ?auto_42657 ?auto_42656 ) ) ( not ( = ?auto_42657 ?auto_42661 ) ) ( ON ?auto_42661 ?auto_42660 ) ( not ( = ?auto_42655 ?auto_42660 ) ) ( not ( = ?auto_42659 ?auto_42660 ) ) ( not ( = ?auto_42657 ?auto_42660 ) ) ( not ( = ?auto_42658 ?auto_42660 ) ) ( not ( = ?auto_42661 ?auto_42660 ) ) ( not ( = ?auto_42656 ?auto_42660 ) ) ( ON ?auto_42656 ?auto_42661 ) ( ON-TABLE ?auto_42660 ) ( ON ?auto_42658 ?auto_42656 ) ( CLEAR ?auto_42659 ) ( ON ?auto_42657 ?auto_42658 ) ( CLEAR ?auto_42657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42660 ?auto_42661 ?auto_42656 ?auto_42658 )
      ( MAKE-1PILE ?auto_42655 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42676 - BLOCK
    )
    :vars
    (
      ?auto_42677 - BLOCK
      ?auto_42682 - BLOCK
      ?auto_42679 - BLOCK
      ?auto_42680 - BLOCK
      ?auto_42678 - BLOCK
      ?auto_42681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42676 ?auto_42677 ) ) ( not ( = ?auto_42676 ?auto_42682 ) ) ( not ( = ?auto_42676 ?auto_42679 ) ) ( not ( = ?auto_42677 ?auto_42682 ) ) ( not ( = ?auto_42677 ?auto_42679 ) ) ( not ( = ?auto_42682 ?auto_42679 ) ) ( not ( = ?auto_42680 ?auto_42678 ) ) ( not ( = ?auto_42680 ?auto_42679 ) ) ( not ( = ?auto_42678 ?auto_42679 ) ) ( not ( = ?auto_42676 ?auto_42678 ) ) ( not ( = ?auto_42676 ?auto_42680 ) ) ( not ( = ?auto_42677 ?auto_42678 ) ) ( not ( = ?auto_42677 ?auto_42680 ) ) ( not ( = ?auto_42682 ?auto_42678 ) ) ( not ( = ?auto_42682 ?auto_42680 ) ) ( ON ?auto_42680 ?auto_42681 ) ( not ( = ?auto_42676 ?auto_42681 ) ) ( not ( = ?auto_42677 ?auto_42681 ) ) ( not ( = ?auto_42682 ?auto_42681 ) ) ( not ( = ?auto_42679 ?auto_42681 ) ) ( not ( = ?auto_42680 ?auto_42681 ) ) ( not ( = ?auto_42678 ?auto_42681 ) ) ( ON ?auto_42678 ?auto_42680 ) ( ON-TABLE ?auto_42681 ) ( ON ?auto_42679 ?auto_42678 ) ( ON ?auto_42682 ?auto_42679 ) ( ON ?auto_42677 ?auto_42682 ) ( CLEAR ?auto_42677 ) ( HOLDING ?auto_42676 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42676 ?auto_42677 )
      ( MAKE-1PILE ?auto_42676 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42683 - BLOCK
    )
    :vars
    (
      ?auto_42689 - BLOCK
      ?auto_42684 - BLOCK
      ?auto_42685 - BLOCK
      ?auto_42686 - BLOCK
      ?auto_42687 - BLOCK
      ?auto_42688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42683 ?auto_42689 ) ) ( not ( = ?auto_42683 ?auto_42684 ) ) ( not ( = ?auto_42683 ?auto_42685 ) ) ( not ( = ?auto_42689 ?auto_42684 ) ) ( not ( = ?auto_42689 ?auto_42685 ) ) ( not ( = ?auto_42684 ?auto_42685 ) ) ( not ( = ?auto_42686 ?auto_42687 ) ) ( not ( = ?auto_42686 ?auto_42685 ) ) ( not ( = ?auto_42687 ?auto_42685 ) ) ( not ( = ?auto_42683 ?auto_42687 ) ) ( not ( = ?auto_42683 ?auto_42686 ) ) ( not ( = ?auto_42689 ?auto_42687 ) ) ( not ( = ?auto_42689 ?auto_42686 ) ) ( not ( = ?auto_42684 ?auto_42687 ) ) ( not ( = ?auto_42684 ?auto_42686 ) ) ( ON ?auto_42686 ?auto_42688 ) ( not ( = ?auto_42683 ?auto_42688 ) ) ( not ( = ?auto_42689 ?auto_42688 ) ) ( not ( = ?auto_42684 ?auto_42688 ) ) ( not ( = ?auto_42685 ?auto_42688 ) ) ( not ( = ?auto_42686 ?auto_42688 ) ) ( not ( = ?auto_42687 ?auto_42688 ) ) ( ON ?auto_42687 ?auto_42686 ) ( ON-TABLE ?auto_42688 ) ( ON ?auto_42685 ?auto_42687 ) ( ON ?auto_42684 ?auto_42685 ) ( ON ?auto_42689 ?auto_42684 ) ( ON ?auto_42683 ?auto_42689 ) ( CLEAR ?auto_42683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42688 ?auto_42686 ?auto_42687 ?auto_42685 ?auto_42684 ?auto_42689 )
      ( MAKE-1PILE ?auto_42683 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42695 - BLOCK
      ?auto_42696 - BLOCK
      ?auto_42697 - BLOCK
      ?auto_42698 - BLOCK
      ?auto_42699 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_42699 ) ( CLEAR ?auto_42698 ) ( ON-TABLE ?auto_42695 ) ( ON ?auto_42696 ?auto_42695 ) ( ON ?auto_42697 ?auto_42696 ) ( ON ?auto_42698 ?auto_42697 ) ( not ( = ?auto_42695 ?auto_42696 ) ) ( not ( = ?auto_42695 ?auto_42697 ) ) ( not ( = ?auto_42695 ?auto_42698 ) ) ( not ( = ?auto_42695 ?auto_42699 ) ) ( not ( = ?auto_42696 ?auto_42697 ) ) ( not ( = ?auto_42696 ?auto_42698 ) ) ( not ( = ?auto_42696 ?auto_42699 ) ) ( not ( = ?auto_42697 ?auto_42698 ) ) ( not ( = ?auto_42697 ?auto_42699 ) ) ( not ( = ?auto_42698 ?auto_42699 ) ) )
    :subtasks
    ( ( !STACK ?auto_42699 ?auto_42698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42700 - BLOCK
      ?auto_42701 - BLOCK
      ?auto_42702 - BLOCK
      ?auto_42703 - BLOCK
      ?auto_42704 - BLOCK
    )
    :vars
    (
      ?auto_42705 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42703 ) ( ON-TABLE ?auto_42700 ) ( ON ?auto_42701 ?auto_42700 ) ( ON ?auto_42702 ?auto_42701 ) ( ON ?auto_42703 ?auto_42702 ) ( not ( = ?auto_42700 ?auto_42701 ) ) ( not ( = ?auto_42700 ?auto_42702 ) ) ( not ( = ?auto_42700 ?auto_42703 ) ) ( not ( = ?auto_42700 ?auto_42704 ) ) ( not ( = ?auto_42701 ?auto_42702 ) ) ( not ( = ?auto_42701 ?auto_42703 ) ) ( not ( = ?auto_42701 ?auto_42704 ) ) ( not ( = ?auto_42702 ?auto_42703 ) ) ( not ( = ?auto_42702 ?auto_42704 ) ) ( not ( = ?auto_42703 ?auto_42704 ) ) ( ON ?auto_42704 ?auto_42705 ) ( CLEAR ?auto_42704 ) ( HAND-EMPTY ) ( not ( = ?auto_42700 ?auto_42705 ) ) ( not ( = ?auto_42701 ?auto_42705 ) ) ( not ( = ?auto_42702 ?auto_42705 ) ) ( not ( = ?auto_42703 ?auto_42705 ) ) ( not ( = ?auto_42704 ?auto_42705 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42704 ?auto_42705 )
      ( MAKE-5PILE ?auto_42700 ?auto_42701 ?auto_42702 ?auto_42703 ?auto_42704 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42706 - BLOCK
      ?auto_42707 - BLOCK
      ?auto_42708 - BLOCK
      ?auto_42709 - BLOCK
      ?auto_42710 - BLOCK
    )
    :vars
    (
      ?auto_42711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42706 ) ( ON ?auto_42707 ?auto_42706 ) ( ON ?auto_42708 ?auto_42707 ) ( not ( = ?auto_42706 ?auto_42707 ) ) ( not ( = ?auto_42706 ?auto_42708 ) ) ( not ( = ?auto_42706 ?auto_42709 ) ) ( not ( = ?auto_42706 ?auto_42710 ) ) ( not ( = ?auto_42707 ?auto_42708 ) ) ( not ( = ?auto_42707 ?auto_42709 ) ) ( not ( = ?auto_42707 ?auto_42710 ) ) ( not ( = ?auto_42708 ?auto_42709 ) ) ( not ( = ?auto_42708 ?auto_42710 ) ) ( not ( = ?auto_42709 ?auto_42710 ) ) ( ON ?auto_42710 ?auto_42711 ) ( CLEAR ?auto_42710 ) ( not ( = ?auto_42706 ?auto_42711 ) ) ( not ( = ?auto_42707 ?auto_42711 ) ) ( not ( = ?auto_42708 ?auto_42711 ) ) ( not ( = ?auto_42709 ?auto_42711 ) ) ( not ( = ?auto_42710 ?auto_42711 ) ) ( HOLDING ?auto_42709 ) ( CLEAR ?auto_42708 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42706 ?auto_42707 ?auto_42708 ?auto_42709 )
      ( MAKE-5PILE ?auto_42706 ?auto_42707 ?auto_42708 ?auto_42709 ?auto_42710 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42712 - BLOCK
      ?auto_42713 - BLOCK
      ?auto_42714 - BLOCK
      ?auto_42715 - BLOCK
      ?auto_42716 - BLOCK
    )
    :vars
    (
      ?auto_42717 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42712 ) ( ON ?auto_42713 ?auto_42712 ) ( ON ?auto_42714 ?auto_42713 ) ( not ( = ?auto_42712 ?auto_42713 ) ) ( not ( = ?auto_42712 ?auto_42714 ) ) ( not ( = ?auto_42712 ?auto_42715 ) ) ( not ( = ?auto_42712 ?auto_42716 ) ) ( not ( = ?auto_42713 ?auto_42714 ) ) ( not ( = ?auto_42713 ?auto_42715 ) ) ( not ( = ?auto_42713 ?auto_42716 ) ) ( not ( = ?auto_42714 ?auto_42715 ) ) ( not ( = ?auto_42714 ?auto_42716 ) ) ( not ( = ?auto_42715 ?auto_42716 ) ) ( ON ?auto_42716 ?auto_42717 ) ( not ( = ?auto_42712 ?auto_42717 ) ) ( not ( = ?auto_42713 ?auto_42717 ) ) ( not ( = ?auto_42714 ?auto_42717 ) ) ( not ( = ?auto_42715 ?auto_42717 ) ) ( not ( = ?auto_42716 ?auto_42717 ) ) ( CLEAR ?auto_42714 ) ( ON ?auto_42715 ?auto_42716 ) ( CLEAR ?auto_42715 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42717 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42717 ?auto_42716 )
      ( MAKE-5PILE ?auto_42712 ?auto_42713 ?auto_42714 ?auto_42715 ?auto_42716 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42718 - BLOCK
      ?auto_42719 - BLOCK
      ?auto_42720 - BLOCK
      ?auto_42721 - BLOCK
      ?auto_42722 - BLOCK
    )
    :vars
    (
      ?auto_42723 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42718 ) ( ON ?auto_42719 ?auto_42718 ) ( not ( = ?auto_42718 ?auto_42719 ) ) ( not ( = ?auto_42718 ?auto_42720 ) ) ( not ( = ?auto_42718 ?auto_42721 ) ) ( not ( = ?auto_42718 ?auto_42722 ) ) ( not ( = ?auto_42719 ?auto_42720 ) ) ( not ( = ?auto_42719 ?auto_42721 ) ) ( not ( = ?auto_42719 ?auto_42722 ) ) ( not ( = ?auto_42720 ?auto_42721 ) ) ( not ( = ?auto_42720 ?auto_42722 ) ) ( not ( = ?auto_42721 ?auto_42722 ) ) ( ON ?auto_42722 ?auto_42723 ) ( not ( = ?auto_42718 ?auto_42723 ) ) ( not ( = ?auto_42719 ?auto_42723 ) ) ( not ( = ?auto_42720 ?auto_42723 ) ) ( not ( = ?auto_42721 ?auto_42723 ) ) ( not ( = ?auto_42722 ?auto_42723 ) ) ( ON ?auto_42721 ?auto_42722 ) ( CLEAR ?auto_42721 ) ( ON-TABLE ?auto_42723 ) ( HOLDING ?auto_42720 ) ( CLEAR ?auto_42719 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42718 ?auto_42719 ?auto_42720 )
      ( MAKE-5PILE ?auto_42718 ?auto_42719 ?auto_42720 ?auto_42721 ?auto_42722 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42724 - BLOCK
      ?auto_42725 - BLOCK
      ?auto_42726 - BLOCK
      ?auto_42727 - BLOCK
      ?auto_42728 - BLOCK
    )
    :vars
    (
      ?auto_42729 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42724 ) ( ON ?auto_42725 ?auto_42724 ) ( not ( = ?auto_42724 ?auto_42725 ) ) ( not ( = ?auto_42724 ?auto_42726 ) ) ( not ( = ?auto_42724 ?auto_42727 ) ) ( not ( = ?auto_42724 ?auto_42728 ) ) ( not ( = ?auto_42725 ?auto_42726 ) ) ( not ( = ?auto_42725 ?auto_42727 ) ) ( not ( = ?auto_42725 ?auto_42728 ) ) ( not ( = ?auto_42726 ?auto_42727 ) ) ( not ( = ?auto_42726 ?auto_42728 ) ) ( not ( = ?auto_42727 ?auto_42728 ) ) ( ON ?auto_42728 ?auto_42729 ) ( not ( = ?auto_42724 ?auto_42729 ) ) ( not ( = ?auto_42725 ?auto_42729 ) ) ( not ( = ?auto_42726 ?auto_42729 ) ) ( not ( = ?auto_42727 ?auto_42729 ) ) ( not ( = ?auto_42728 ?auto_42729 ) ) ( ON ?auto_42727 ?auto_42728 ) ( ON-TABLE ?auto_42729 ) ( CLEAR ?auto_42725 ) ( ON ?auto_42726 ?auto_42727 ) ( CLEAR ?auto_42726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42729 ?auto_42728 ?auto_42727 )
      ( MAKE-5PILE ?auto_42724 ?auto_42725 ?auto_42726 ?auto_42727 ?auto_42728 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42730 - BLOCK
      ?auto_42731 - BLOCK
      ?auto_42732 - BLOCK
      ?auto_42733 - BLOCK
      ?auto_42734 - BLOCK
    )
    :vars
    (
      ?auto_42735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42730 ) ( not ( = ?auto_42730 ?auto_42731 ) ) ( not ( = ?auto_42730 ?auto_42732 ) ) ( not ( = ?auto_42730 ?auto_42733 ) ) ( not ( = ?auto_42730 ?auto_42734 ) ) ( not ( = ?auto_42731 ?auto_42732 ) ) ( not ( = ?auto_42731 ?auto_42733 ) ) ( not ( = ?auto_42731 ?auto_42734 ) ) ( not ( = ?auto_42732 ?auto_42733 ) ) ( not ( = ?auto_42732 ?auto_42734 ) ) ( not ( = ?auto_42733 ?auto_42734 ) ) ( ON ?auto_42734 ?auto_42735 ) ( not ( = ?auto_42730 ?auto_42735 ) ) ( not ( = ?auto_42731 ?auto_42735 ) ) ( not ( = ?auto_42732 ?auto_42735 ) ) ( not ( = ?auto_42733 ?auto_42735 ) ) ( not ( = ?auto_42734 ?auto_42735 ) ) ( ON ?auto_42733 ?auto_42734 ) ( ON-TABLE ?auto_42735 ) ( ON ?auto_42732 ?auto_42733 ) ( CLEAR ?auto_42732 ) ( HOLDING ?auto_42731 ) ( CLEAR ?auto_42730 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42730 ?auto_42731 )
      ( MAKE-5PILE ?auto_42730 ?auto_42731 ?auto_42732 ?auto_42733 ?auto_42734 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42736 - BLOCK
      ?auto_42737 - BLOCK
      ?auto_42738 - BLOCK
      ?auto_42739 - BLOCK
      ?auto_42740 - BLOCK
    )
    :vars
    (
      ?auto_42741 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42736 ) ( not ( = ?auto_42736 ?auto_42737 ) ) ( not ( = ?auto_42736 ?auto_42738 ) ) ( not ( = ?auto_42736 ?auto_42739 ) ) ( not ( = ?auto_42736 ?auto_42740 ) ) ( not ( = ?auto_42737 ?auto_42738 ) ) ( not ( = ?auto_42737 ?auto_42739 ) ) ( not ( = ?auto_42737 ?auto_42740 ) ) ( not ( = ?auto_42738 ?auto_42739 ) ) ( not ( = ?auto_42738 ?auto_42740 ) ) ( not ( = ?auto_42739 ?auto_42740 ) ) ( ON ?auto_42740 ?auto_42741 ) ( not ( = ?auto_42736 ?auto_42741 ) ) ( not ( = ?auto_42737 ?auto_42741 ) ) ( not ( = ?auto_42738 ?auto_42741 ) ) ( not ( = ?auto_42739 ?auto_42741 ) ) ( not ( = ?auto_42740 ?auto_42741 ) ) ( ON ?auto_42739 ?auto_42740 ) ( ON-TABLE ?auto_42741 ) ( ON ?auto_42738 ?auto_42739 ) ( CLEAR ?auto_42736 ) ( ON ?auto_42737 ?auto_42738 ) ( CLEAR ?auto_42737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42741 ?auto_42740 ?auto_42739 ?auto_42738 )
      ( MAKE-5PILE ?auto_42736 ?auto_42737 ?auto_42738 ?auto_42739 ?auto_42740 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42742 - BLOCK
      ?auto_42743 - BLOCK
      ?auto_42744 - BLOCK
      ?auto_42745 - BLOCK
      ?auto_42746 - BLOCK
    )
    :vars
    (
      ?auto_42747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42742 ?auto_42743 ) ) ( not ( = ?auto_42742 ?auto_42744 ) ) ( not ( = ?auto_42742 ?auto_42745 ) ) ( not ( = ?auto_42742 ?auto_42746 ) ) ( not ( = ?auto_42743 ?auto_42744 ) ) ( not ( = ?auto_42743 ?auto_42745 ) ) ( not ( = ?auto_42743 ?auto_42746 ) ) ( not ( = ?auto_42744 ?auto_42745 ) ) ( not ( = ?auto_42744 ?auto_42746 ) ) ( not ( = ?auto_42745 ?auto_42746 ) ) ( ON ?auto_42746 ?auto_42747 ) ( not ( = ?auto_42742 ?auto_42747 ) ) ( not ( = ?auto_42743 ?auto_42747 ) ) ( not ( = ?auto_42744 ?auto_42747 ) ) ( not ( = ?auto_42745 ?auto_42747 ) ) ( not ( = ?auto_42746 ?auto_42747 ) ) ( ON ?auto_42745 ?auto_42746 ) ( ON-TABLE ?auto_42747 ) ( ON ?auto_42744 ?auto_42745 ) ( ON ?auto_42743 ?auto_42744 ) ( CLEAR ?auto_42743 ) ( HOLDING ?auto_42742 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42742 )
      ( MAKE-5PILE ?auto_42742 ?auto_42743 ?auto_42744 ?auto_42745 ?auto_42746 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42748 - BLOCK
      ?auto_42749 - BLOCK
      ?auto_42750 - BLOCK
      ?auto_42751 - BLOCK
      ?auto_42752 - BLOCK
    )
    :vars
    (
      ?auto_42753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42748 ?auto_42749 ) ) ( not ( = ?auto_42748 ?auto_42750 ) ) ( not ( = ?auto_42748 ?auto_42751 ) ) ( not ( = ?auto_42748 ?auto_42752 ) ) ( not ( = ?auto_42749 ?auto_42750 ) ) ( not ( = ?auto_42749 ?auto_42751 ) ) ( not ( = ?auto_42749 ?auto_42752 ) ) ( not ( = ?auto_42750 ?auto_42751 ) ) ( not ( = ?auto_42750 ?auto_42752 ) ) ( not ( = ?auto_42751 ?auto_42752 ) ) ( ON ?auto_42752 ?auto_42753 ) ( not ( = ?auto_42748 ?auto_42753 ) ) ( not ( = ?auto_42749 ?auto_42753 ) ) ( not ( = ?auto_42750 ?auto_42753 ) ) ( not ( = ?auto_42751 ?auto_42753 ) ) ( not ( = ?auto_42752 ?auto_42753 ) ) ( ON ?auto_42751 ?auto_42752 ) ( ON-TABLE ?auto_42753 ) ( ON ?auto_42750 ?auto_42751 ) ( ON ?auto_42749 ?auto_42750 ) ( ON ?auto_42748 ?auto_42749 ) ( CLEAR ?auto_42748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42753 ?auto_42752 ?auto_42751 ?auto_42750 ?auto_42749 )
      ( MAKE-5PILE ?auto_42748 ?auto_42749 ?auto_42750 ?auto_42751 ?auto_42752 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42754 - BLOCK
      ?auto_42755 - BLOCK
      ?auto_42756 - BLOCK
      ?auto_42757 - BLOCK
      ?auto_42758 - BLOCK
    )
    :vars
    (
      ?auto_42759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42754 ?auto_42755 ) ) ( not ( = ?auto_42754 ?auto_42756 ) ) ( not ( = ?auto_42754 ?auto_42757 ) ) ( not ( = ?auto_42754 ?auto_42758 ) ) ( not ( = ?auto_42755 ?auto_42756 ) ) ( not ( = ?auto_42755 ?auto_42757 ) ) ( not ( = ?auto_42755 ?auto_42758 ) ) ( not ( = ?auto_42756 ?auto_42757 ) ) ( not ( = ?auto_42756 ?auto_42758 ) ) ( not ( = ?auto_42757 ?auto_42758 ) ) ( ON ?auto_42758 ?auto_42759 ) ( not ( = ?auto_42754 ?auto_42759 ) ) ( not ( = ?auto_42755 ?auto_42759 ) ) ( not ( = ?auto_42756 ?auto_42759 ) ) ( not ( = ?auto_42757 ?auto_42759 ) ) ( not ( = ?auto_42758 ?auto_42759 ) ) ( ON ?auto_42757 ?auto_42758 ) ( ON-TABLE ?auto_42759 ) ( ON ?auto_42756 ?auto_42757 ) ( ON ?auto_42755 ?auto_42756 ) ( HOLDING ?auto_42754 ) ( CLEAR ?auto_42755 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42759 ?auto_42758 ?auto_42757 ?auto_42756 ?auto_42755 ?auto_42754 )
      ( MAKE-5PILE ?auto_42754 ?auto_42755 ?auto_42756 ?auto_42757 ?auto_42758 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42760 - BLOCK
      ?auto_42761 - BLOCK
      ?auto_42762 - BLOCK
      ?auto_42763 - BLOCK
      ?auto_42764 - BLOCK
    )
    :vars
    (
      ?auto_42765 - BLOCK
      ?auto_42766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42760 ?auto_42761 ) ) ( not ( = ?auto_42760 ?auto_42762 ) ) ( not ( = ?auto_42760 ?auto_42763 ) ) ( not ( = ?auto_42760 ?auto_42764 ) ) ( not ( = ?auto_42761 ?auto_42762 ) ) ( not ( = ?auto_42761 ?auto_42763 ) ) ( not ( = ?auto_42761 ?auto_42764 ) ) ( not ( = ?auto_42762 ?auto_42763 ) ) ( not ( = ?auto_42762 ?auto_42764 ) ) ( not ( = ?auto_42763 ?auto_42764 ) ) ( ON ?auto_42764 ?auto_42765 ) ( not ( = ?auto_42760 ?auto_42765 ) ) ( not ( = ?auto_42761 ?auto_42765 ) ) ( not ( = ?auto_42762 ?auto_42765 ) ) ( not ( = ?auto_42763 ?auto_42765 ) ) ( not ( = ?auto_42764 ?auto_42765 ) ) ( ON ?auto_42763 ?auto_42764 ) ( ON-TABLE ?auto_42765 ) ( ON ?auto_42762 ?auto_42763 ) ( ON ?auto_42761 ?auto_42762 ) ( CLEAR ?auto_42761 ) ( ON ?auto_42760 ?auto_42766 ) ( CLEAR ?auto_42760 ) ( HAND-EMPTY ) ( not ( = ?auto_42760 ?auto_42766 ) ) ( not ( = ?auto_42761 ?auto_42766 ) ) ( not ( = ?auto_42762 ?auto_42766 ) ) ( not ( = ?auto_42763 ?auto_42766 ) ) ( not ( = ?auto_42764 ?auto_42766 ) ) ( not ( = ?auto_42765 ?auto_42766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42760 ?auto_42766 )
      ( MAKE-5PILE ?auto_42760 ?auto_42761 ?auto_42762 ?auto_42763 ?auto_42764 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42767 - BLOCK
      ?auto_42768 - BLOCK
      ?auto_42769 - BLOCK
      ?auto_42770 - BLOCK
      ?auto_42771 - BLOCK
    )
    :vars
    (
      ?auto_42773 - BLOCK
      ?auto_42772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42767 ?auto_42768 ) ) ( not ( = ?auto_42767 ?auto_42769 ) ) ( not ( = ?auto_42767 ?auto_42770 ) ) ( not ( = ?auto_42767 ?auto_42771 ) ) ( not ( = ?auto_42768 ?auto_42769 ) ) ( not ( = ?auto_42768 ?auto_42770 ) ) ( not ( = ?auto_42768 ?auto_42771 ) ) ( not ( = ?auto_42769 ?auto_42770 ) ) ( not ( = ?auto_42769 ?auto_42771 ) ) ( not ( = ?auto_42770 ?auto_42771 ) ) ( ON ?auto_42771 ?auto_42773 ) ( not ( = ?auto_42767 ?auto_42773 ) ) ( not ( = ?auto_42768 ?auto_42773 ) ) ( not ( = ?auto_42769 ?auto_42773 ) ) ( not ( = ?auto_42770 ?auto_42773 ) ) ( not ( = ?auto_42771 ?auto_42773 ) ) ( ON ?auto_42770 ?auto_42771 ) ( ON-TABLE ?auto_42773 ) ( ON ?auto_42769 ?auto_42770 ) ( ON ?auto_42767 ?auto_42772 ) ( CLEAR ?auto_42767 ) ( not ( = ?auto_42767 ?auto_42772 ) ) ( not ( = ?auto_42768 ?auto_42772 ) ) ( not ( = ?auto_42769 ?auto_42772 ) ) ( not ( = ?auto_42770 ?auto_42772 ) ) ( not ( = ?auto_42771 ?auto_42772 ) ) ( not ( = ?auto_42773 ?auto_42772 ) ) ( HOLDING ?auto_42768 ) ( CLEAR ?auto_42769 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42773 ?auto_42771 ?auto_42770 ?auto_42769 ?auto_42768 )
      ( MAKE-5PILE ?auto_42767 ?auto_42768 ?auto_42769 ?auto_42770 ?auto_42771 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42774 - BLOCK
      ?auto_42775 - BLOCK
      ?auto_42776 - BLOCK
      ?auto_42777 - BLOCK
      ?auto_42778 - BLOCK
    )
    :vars
    (
      ?auto_42780 - BLOCK
      ?auto_42779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42774 ?auto_42775 ) ) ( not ( = ?auto_42774 ?auto_42776 ) ) ( not ( = ?auto_42774 ?auto_42777 ) ) ( not ( = ?auto_42774 ?auto_42778 ) ) ( not ( = ?auto_42775 ?auto_42776 ) ) ( not ( = ?auto_42775 ?auto_42777 ) ) ( not ( = ?auto_42775 ?auto_42778 ) ) ( not ( = ?auto_42776 ?auto_42777 ) ) ( not ( = ?auto_42776 ?auto_42778 ) ) ( not ( = ?auto_42777 ?auto_42778 ) ) ( ON ?auto_42778 ?auto_42780 ) ( not ( = ?auto_42774 ?auto_42780 ) ) ( not ( = ?auto_42775 ?auto_42780 ) ) ( not ( = ?auto_42776 ?auto_42780 ) ) ( not ( = ?auto_42777 ?auto_42780 ) ) ( not ( = ?auto_42778 ?auto_42780 ) ) ( ON ?auto_42777 ?auto_42778 ) ( ON-TABLE ?auto_42780 ) ( ON ?auto_42776 ?auto_42777 ) ( ON ?auto_42774 ?auto_42779 ) ( not ( = ?auto_42774 ?auto_42779 ) ) ( not ( = ?auto_42775 ?auto_42779 ) ) ( not ( = ?auto_42776 ?auto_42779 ) ) ( not ( = ?auto_42777 ?auto_42779 ) ) ( not ( = ?auto_42778 ?auto_42779 ) ) ( not ( = ?auto_42780 ?auto_42779 ) ) ( CLEAR ?auto_42776 ) ( ON ?auto_42775 ?auto_42774 ) ( CLEAR ?auto_42775 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42779 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42779 ?auto_42774 )
      ( MAKE-5PILE ?auto_42774 ?auto_42775 ?auto_42776 ?auto_42777 ?auto_42778 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42781 - BLOCK
      ?auto_42782 - BLOCK
      ?auto_42783 - BLOCK
      ?auto_42784 - BLOCK
      ?auto_42785 - BLOCK
    )
    :vars
    (
      ?auto_42787 - BLOCK
      ?auto_42786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42781 ?auto_42782 ) ) ( not ( = ?auto_42781 ?auto_42783 ) ) ( not ( = ?auto_42781 ?auto_42784 ) ) ( not ( = ?auto_42781 ?auto_42785 ) ) ( not ( = ?auto_42782 ?auto_42783 ) ) ( not ( = ?auto_42782 ?auto_42784 ) ) ( not ( = ?auto_42782 ?auto_42785 ) ) ( not ( = ?auto_42783 ?auto_42784 ) ) ( not ( = ?auto_42783 ?auto_42785 ) ) ( not ( = ?auto_42784 ?auto_42785 ) ) ( ON ?auto_42785 ?auto_42787 ) ( not ( = ?auto_42781 ?auto_42787 ) ) ( not ( = ?auto_42782 ?auto_42787 ) ) ( not ( = ?auto_42783 ?auto_42787 ) ) ( not ( = ?auto_42784 ?auto_42787 ) ) ( not ( = ?auto_42785 ?auto_42787 ) ) ( ON ?auto_42784 ?auto_42785 ) ( ON-TABLE ?auto_42787 ) ( ON ?auto_42781 ?auto_42786 ) ( not ( = ?auto_42781 ?auto_42786 ) ) ( not ( = ?auto_42782 ?auto_42786 ) ) ( not ( = ?auto_42783 ?auto_42786 ) ) ( not ( = ?auto_42784 ?auto_42786 ) ) ( not ( = ?auto_42785 ?auto_42786 ) ) ( not ( = ?auto_42787 ?auto_42786 ) ) ( ON ?auto_42782 ?auto_42781 ) ( CLEAR ?auto_42782 ) ( ON-TABLE ?auto_42786 ) ( HOLDING ?auto_42783 ) ( CLEAR ?auto_42784 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42787 ?auto_42785 ?auto_42784 ?auto_42783 )
      ( MAKE-5PILE ?auto_42781 ?auto_42782 ?auto_42783 ?auto_42784 ?auto_42785 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42788 - BLOCK
      ?auto_42789 - BLOCK
      ?auto_42790 - BLOCK
      ?auto_42791 - BLOCK
      ?auto_42792 - BLOCK
    )
    :vars
    (
      ?auto_42793 - BLOCK
      ?auto_42794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42788 ?auto_42789 ) ) ( not ( = ?auto_42788 ?auto_42790 ) ) ( not ( = ?auto_42788 ?auto_42791 ) ) ( not ( = ?auto_42788 ?auto_42792 ) ) ( not ( = ?auto_42789 ?auto_42790 ) ) ( not ( = ?auto_42789 ?auto_42791 ) ) ( not ( = ?auto_42789 ?auto_42792 ) ) ( not ( = ?auto_42790 ?auto_42791 ) ) ( not ( = ?auto_42790 ?auto_42792 ) ) ( not ( = ?auto_42791 ?auto_42792 ) ) ( ON ?auto_42792 ?auto_42793 ) ( not ( = ?auto_42788 ?auto_42793 ) ) ( not ( = ?auto_42789 ?auto_42793 ) ) ( not ( = ?auto_42790 ?auto_42793 ) ) ( not ( = ?auto_42791 ?auto_42793 ) ) ( not ( = ?auto_42792 ?auto_42793 ) ) ( ON ?auto_42791 ?auto_42792 ) ( ON-TABLE ?auto_42793 ) ( ON ?auto_42788 ?auto_42794 ) ( not ( = ?auto_42788 ?auto_42794 ) ) ( not ( = ?auto_42789 ?auto_42794 ) ) ( not ( = ?auto_42790 ?auto_42794 ) ) ( not ( = ?auto_42791 ?auto_42794 ) ) ( not ( = ?auto_42792 ?auto_42794 ) ) ( not ( = ?auto_42793 ?auto_42794 ) ) ( ON ?auto_42789 ?auto_42788 ) ( ON-TABLE ?auto_42794 ) ( CLEAR ?auto_42791 ) ( ON ?auto_42790 ?auto_42789 ) ( CLEAR ?auto_42790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42794 ?auto_42788 ?auto_42789 )
      ( MAKE-5PILE ?auto_42788 ?auto_42789 ?auto_42790 ?auto_42791 ?auto_42792 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42795 - BLOCK
      ?auto_42796 - BLOCK
      ?auto_42797 - BLOCK
      ?auto_42798 - BLOCK
      ?auto_42799 - BLOCK
    )
    :vars
    (
      ?auto_42800 - BLOCK
      ?auto_42801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42795 ?auto_42796 ) ) ( not ( = ?auto_42795 ?auto_42797 ) ) ( not ( = ?auto_42795 ?auto_42798 ) ) ( not ( = ?auto_42795 ?auto_42799 ) ) ( not ( = ?auto_42796 ?auto_42797 ) ) ( not ( = ?auto_42796 ?auto_42798 ) ) ( not ( = ?auto_42796 ?auto_42799 ) ) ( not ( = ?auto_42797 ?auto_42798 ) ) ( not ( = ?auto_42797 ?auto_42799 ) ) ( not ( = ?auto_42798 ?auto_42799 ) ) ( ON ?auto_42799 ?auto_42800 ) ( not ( = ?auto_42795 ?auto_42800 ) ) ( not ( = ?auto_42796 ?auto_42800 ) ) ( not ( = ?auto_42797 ?auto_42800 ) ) ( not ( = ?auto_42798 ?auto_42800 ) ) ( not ( = ?auto_42799 ?auto_42800 ) ) ( ON-TABLE ?auto_42800 ) ( ON ?auto_42795 ?auto_42801 ) ( not ( = ?auto_42795 ?auto_42801 ) ) ( not ( = ?auto_42796 ?auto_42801 ) ) ( not ( = ?auto_42797 ?auto_42801 ) ) ( not ( = ?auto_42798 ?auto_42801 ) ) ( not ( = ?auto_42799 ?auto_42801 ) ) ( not ( = ?auto_42800 ?auto_42801 ) ) ( ON ?auto_42796 ?auto_42795 ) ( ON-TABLE ?auto_42801 ) ( ON ?auto_42797 ?auto_42796 ) ( CLEAR ?auto_42797 ) ( HOLDING ?auto_42798 ) ( CLEAR ?auto_42799 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42800 ?auto_42799 ?auto_42798 )
      ( MAKE-5PILE ?auto_42795 ?auto_42796 ?auto_42797 ?auto_42798 ?auto_42799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42802 - BLOCK
      ?auto_42803 - BLOCK
      ?auto_42804 - BLOCK
      ?auto_42805 - BLOCK
      ?auto_42806 - BLOCK
    )
    :vars
    (
      ?auto_42807 - BLOCK
      ?auto_42808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42802 ?auto_42803 ) ) ( not ( = ?auto_42802 ?auto_42804 ) ) ( not ( = ?auto_42802 ?auto_42805 ) ) ( not ( = ?auto_42802 ?auto_42806 ) ) ( not ( = ?auto_42803 ?auto_42804 ) ) ( not ( = ?auto_42803 ?auto_42805 ) ) ( not ( = ?auto_42803 ?auto_42806 ) ) ( not ( = ?auto_42804 ?auto_42805 ) ) ( not ( = ?auto_42804 ?auto_42806 ) ) ( not ( = ?auto_42805 ?auto_42806 ) ) ( ON ?auto_42806 ?auto_42807 ) ( not ( = ?auto_42802 ?auto_42807 ) ) ( not ( = ?auto_42803 ?auto_42807 ) ) ( not ( = ?auto_42804 ?auto_42807 ) ) ( not ( = ?auto_42805 ?auto_42807 ) ) ( not ( = ?auto_42806 ?auto_42807 ) ) ( ON-TABLE ?auto_42807 ) ( ON ?auto_42802 ?auto_42808 ) ( not ( = ?auto_42802 ?auto_42808 ) ) ( not ( = ?auto_42803 ?auto_42808 ) ) ( not ( = ?auto_42804 ?auto_42808 ) ) ( not ( = ?auto_42805 ?auto_42808 ) ) ( not ( = ?auto_42806 ?auto_42808 ) ) ( not ( = ?auto_42807 ?auto_42808 ) ) ( ON ?auto_42803 ?auto_42802 ) ( ON-TABLE ?auto_42808 ) ( ON ?auto_42804 ?auto_42803 ) ( CLEAR ?auto_42806 ) ( ON ?auto_42805 ?auto_42804 ) ( CLEAR ?auto_42805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42808 ?auto_42802 ?auto_42803 ?auto_42804 )
      ( MAKE-5PILE ?auto_42802 ?auto_42803 ?auto_42804 ?auto_42805 ?auto_42806 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42809 - BLOCK
      ?auto_42810 - BLOCK
      ?auto_42811 - BLOCK
      ?auto_42812 - BLOCK
      ?auto_42813 - BLOCK
    )
    :vars
    (
      ?auto_42814 - BLOCK
      ?auto_42815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42809 ?auto_42810 ) ) ( not ( = ?auto_42809 ?auto_42811 ) ) ( not ( = ?auto_42809 ?auto_42812 ) ) ( not ( = ?auto_42809 ?auto_42813 ) ) ( not ( = ?auto_42810 ?auto_42811 ) ) ( not ( = ?auto_42810 ?auto_42812 ) ) ( not ( = ?auto_42810 ?auto_42813 ) ) ( not ( = ?auto_42811 ?auto_42812 ) ) ( not ( = ?auto_42811 ?auto_42813 ) ) ( not ( = ?auto_42812 ?auto_42813 ) ) ( not ( = ?auto_42809 ?auto_42814 ) ) ( not ( = ?auto_42810 ?auto_42814 ) ) ( not ( = ?auto_42811 ?auto_42814 ) ) ( not ( = ?auto_42812 ?auto_42814 ) ) ( not ( = ?auto_42813 ?auto_42814 ) ) ( ON-TABLE ?auto_42814 ) ( ON ?auto_42809 ?auto_42815 ) ( not ( = ?auto_42809 ?auto_42815 ) ) ( not ( = ?auto_42810 ?auto_42815 ) ) ( not ( = ?auto_42811 ?auto_42815 ) ) ( not ( = ?auto_42812 ?auto_42815 ) ) ( not ( = ?auto_42813 ?auto_42815 ) ) ( not ( = ?auto_42814 ?auto_42815 ) ) ( ON ?auto_42810 ?auto_42809 ) ( ON-TABLE ?auto_42815 ) ( ON ?auto_42811 ?auto_42810 ) ( ON ?auto_42812 ?auto_42811 ) ( CLEAR ?auto_42812 ) ( HOLDING ?auto_42813 ) ( CLEAR ?auto_42814 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42814 ?auto_42813 )
      ( MAKE-5PILE ?auto_42809 ?auto_42810 ?auto_42811 ?auto_42812 ?auto_42813 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42816 - BLOCK
      ?auto_42817 - BLOCK
      ?auto_42818 - BLOCK
      ?auto_42819 - BLOCK
      ?auto_42820 - BLOCK
    )
    :vars
    (
      ?auto_42822 - BLOCK
      ?auto_42821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42816 ?auto_42817 ) ) ( not ( = ?auto_42816 ?auto_42818 ) ) ( not ( = ?auto_42816 ?auto_42819 ) ) ( not ( = ?auto_42816 ?auto_42820 ) ) ( not ( = ?auto_42817 ?auto_42818 ) ) ( not ( = ?auto_42817 ?auto_42819 ) ) ( not ( = ?auto_42817 ?auto_42820 ) ) ( not ( = ?auto_42818 ?auto_42819 ) ) ( not ( = ?auto_42818 ?auto_42820 ) ) ( not ( = ?auto_42819 ?auto_42820 ) ) ( not ( = ?auto_42816 ?auto_42822 ) ) ( not ( = ?auto_42817 ?auto_42822 ) ) ( not ( = ?auto_42818 ?auto_42822 ) ) ( not ( = ?auto_42819 ?auto_42822 ) ) ( not ( = ?auto_42820 ?auto_42822 ) ) ( ON-TABLE ?auto_42822 ) ( ON ?auto_42816 ?auto_42821 ) ( not ( = ?auto_42816 ?auto_42821 ) ) ( not ( = ?auto_42817 ?auto_42821 ) ) ( not ( = ?auto_42818 ?auto_42821 ) ) ( not ( = ?auto_42819 ?auto_42821 ) ) ( not ( = ?auto_42820 ?auto_42821 ) ) ( not ( = ?auto_42822 ?auto_42821 ) ) ( ON ?auto_42817 ?auto_42816 ) ( ON-TABLE ?auto_42821 ) ( ON ?auto_42818 ?auto_42817 ) ( ON ?auto_42819 ?auto_42818 ) ( CLEAR ?auto_42822 ) ( ON ?auto_42820 ?auto_42819 ) ( CLEAR ?auto_42820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42821 ?auto_42816 ?auto_42817 ?auto_42818 ?auto_42819 )
      ( MAKE-5PILE ?auto_42816 ?auto_42817 ?auto_42818 ?auto_42819 ?auto_42820 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42823 - BLOCK
      ?auto_42824 - BLOCK
      ?auto_42825 - BLOCK
      ?auto_42826 - BLOCK
      ?auto_42827 - BLOCK
    )
    :vars
    (
      ?auto_42829 - BLOCK
      ?auto_42828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42823 ?auto_42824 ) ) ( not ( = ?auto_42823 ?auto_42825 ) ) ( not ( = ?auto_42823 ?auto_42826 ) ) ( not ( = ?auto_42823 ?auto_42827 ) ) ( not ( = ?auto_42824 ?auto_42825 ) ) ( not ( = ?auto_42824 ?auto_42826 ) ) ( not ( = ?auto_42824 ?auto_42827 ) ) ( not ( = ?auto_42825 ?auto_42826 ) ) ( not ( = ?auto_42825 ?auto_42827 ) ) ( not ( = ?auto_42826 ?auto_42827 ) ) ( not ( = ?auto_42823 ?auto_42829 ) ) ( not ( = ?auto_42824 ?auto_42829 ) ) ( not ( = ?auto_42825 ?auto_42829 ) ) ( not ( = ?auto_42826 ?auto_42829 ) ) ( not ( = ?auto_42827 ?auto_42829 ) ) ( ON ?auto_42823 ?auto_42828 ) ( not ( = ?auto_42823 ?auto_42828 ) ) ( not ( = ?auto_42824 ?auto_42828 ) ) ( not ( = ?auto_42825 ?auto_42828 ) ) ( not ( = ?auto_42826 ?auto_42828 ) ) ( not ( = ?auto_42827 ?auto_42828 ) ) ( not ( = ?auto_42829 ?auto_42828 ) ) ( ON ?auto_42824 ?auto_42823 ) ( ON-TABLE ?auto_42828 ) ( ON ?auto_42825 ?auto_42824 ) ( ON ?auto_42826 ?auto_42825 ) ( ON ?auto_42827 ?auto_42826 ) ( CLEAR ?auto_42827 ) ( HOLDING ?auto_42829 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42829 )
      ( MAKE-5PILE ?auto_42823 ?auto_42824 ?auto_42825 ?auto_42826 ?auto_42827 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42830 - BLOCK
      ?auto_42831 - BLOCK
      ?auto_42832 - BLOCK
      ?auto_42833 - BLOCK
      ?auto_42834 - BLOCK
    )
    :vars
    (
      ?auto_42836 - BLOCK
      ?auto_42835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42830 ?auto_42831 ) ) ( not ( = ?auto_42830 ?auto_42832 ) ) ( not ( = ?auto_42830 ?auto_42833 ) ) ( not ( = ?auto_42830 ?auto_42834 ) ) ( not ( = ?auto_42831 ?auto_42832 ) ) ( not ( = ?auto_42831 ?auto_42833 ) ) ( not ( = ?auto_42831 ?auto_42834 ) ) ( not ( = ?auto_42832 ?auto_42833 ) ) ( not ( = ?auto_42832 ?auto_42834 ) ) ( not ( = ?auto_42833 ?auto_42834 ) ) ( not ( = ?auto_42830 ?auto_42836 ) ) ( not ( = ?auto_42831 ?auto_42836 ) ) ( not ( = ?auto_42832 ?auto_42836 ) ) ( not ( = ?auto_42833 ?auto_42836 ) ) ( not ( = ?auto_42834 ?auto_42836 ) ) ( ON ?auto_42830 ?auto_42835 ) ( not ( = ?auto_42830 ?auto_42835 ) ) ( not ( = ?auto_42831 ?auto_42835 ) ) ( not ( = ?auto_42832 ?auto_42835 ) ) ( not ( = ?auto_42833 ?auto_42835 ) ) ( not ( = ?auto_42834 ?auto_42835 ) ) ( not ( = ?auto_42836 ?auto_42835 ) ) ( ON ?auto_42831 ?auto_42830 ) ( ON-TABLE ?auto_42835 ) ( ON ?auto_42832 ?auto_42831 ) ( ON ?auto_42833 ?auto_42832 ) ( ON ?auto_42834 ?auto_42833 ) ( ON ?auto_42836 ?auto_42834 ) ( CLEAR ?auto_42836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42835 ?auto_42830 ?auto_42831 ?auto_42832 ?auto_42833 ?auto_42834 )
      ( MAKE-5PILE ?auto_42830 ?auto_42831 ?auto_42832 ?auto_42833 ?auto_42834 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42843 - BLOCK
      ?auto_42844 - BLOCK
      ?auto_42845 - BLOCK
      ?auto_42846 - BLOCK
      ?auto_42847 - BLOCK
      ?auto_42848 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_42848 ) ( CLEAR ?auto_42847 ) ( ON-TABLE ?auto_42843 ) ( ON ?auto_42844 ?auto_42843 ) ( ON ?auto_42845 ?auto_42844 ) ( ON ?auto_42846 ?auto_42845 ) ( ON ?auto_42847 ?auto_42846 ) ( not ( = ?auto_42843 ?auto_42844 ) ) ( not ( = ?auto_42843 ?auto_42845 ) ) ( not ( = ?auto_42843 ?auto_42846 ) ) ( not ( = ?auto_42843 ?auto_42847 ) ) ( not ( = ?auto_42843 ?auto_42848 ) ) ( not ( = ?auto_42844 ?auto_42845 ) ) ( not ( = ?auto_42844 ?auto_42846 ) ) ( not ( = ?auto_42844 ?auto_42847 ) ) ( not ( = ?auto_42844 ?auto_42848 ) ) ( not ( = ?auto_42845 ?auto_42846 ) ) ( not ( = ?auto_42845 ?auto_42847 ) ) ( not ( = ?auto_42845 ?auto_42848 ) ) ( not ( = ?auto_42846 ?auto_42847 ) ) ( not ( = ?auto_42846 ?auto_42848 ) ) ( not ( = ?auto_42847 ?auto_42848 ) ) )
    :subtasks
    ( ( !STACK ?auto_42848 ?auto_42847 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42849 - BLOCK
      ?auto_42850 - BLOCK
      ?auto_42851 - BLOCK
      ?auto_42852 - BLOCK
      ?auto_42853 - BLOCK
      ?auto_42854 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42853 ) ( ON-TABLE ?auto_42849 ) ( ON ?auto_42850 ?auto_42849 ) ( ON ?auto_42851 ?auto_42850 ) ( ON ?auto_42852 ?auto_42851 ) ( ON ?auto_42853 ?auto_42852 ) ( not ( = ?auto_42849 ?auto_42850 ) ) ( not ( = ?auto_42849 ?auto_42851 ) ) ( not ( = ?auto_42849 ?auto_42852 ) ) ( not ( = ?auto_42849 ?auto_42853 ) ) ( not ( = ?auto_42849 ?auto_42854 ) ) ( not ( = ?auto_42850 ?auto_42851 ) ) ( not ( = ?auto_42850 ?auto_42852 ) ) ( not ( = ?auto_42850 ?auto_42853 ) ) ( not ( = ?auto_42850 ?auto_42854 ) ) ( not ( = ?auto_42851 ?auto_42852 ) ) ( not ( = ?auto_42851 ?auto_42853 ) ) ( not ( = ?auto_42851 ?auto_42854 ) ) ( not ( = ?auto_42852 ?auto_42853 ) ) ( not ( = ?auto_42852 ?auto_42854 ) ) ( not ( = ?auto_42853 ?auto_42854 ) ) ( ON-TABLE ?auto_42854 ) ( CLEAR ?auto_42854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_42854 )
      ( MAKE-6PILE ?auto_42849 ?auto_42850 ?auto_42851 ?auto_42852 ?auto_42853 ?auto_42854 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42855 - BLOCK
      ?auto_42856 - BLOCK
      ?auto_42857 - BLOCK
      ?auto_42858 - BLOCK
      ?auto_42859 - BLOCK
      ?auto_42860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42855 ) ( ON ?auto_42856 ?auto_42855 ) ( ON ?auto_42857 ?auto_42856 ) ( ON ?auto_42858 ?auto_42857 ) ( not ( = ?auto_42855 ?auto_42856 ) ) ( not ( = ?auto_42855 ?auto_42857 ) ) ( not ( = ?auto_42855 ?auto_42858 ) ) ( not ( = ?auto_42855 ?auto_42859 ) ) ( not ( = ?auto_42855 ?auto_42860 ) ) ( not ( = ?auto_42856 ?auto_42857 ) ) ( not ( = ?auto_42856 ?auto_42858 ) ) ( not ( = ?auto_42856 ?auto_42859 ) ) ( not ( = ?auto_42856 ?auto_42860 ) ) ( not ( = ?auto_42857 ?auto_42858 ) ) ( not ( = ?auto_42857 ?auto_42859 ) ) ( not ( = ?auto_42857 ?auto_42860 ) ) ( not ( = ?auto_42858 ?auto_42859 ) ) ( not ( = ?auto_42858 ?auto_42860 ) ) ( not ( = ?auto_42859 ?auto_42860 ) ) ( ON-TABLE ?auto_42860 ) ( CLEAR ?auto_42860 ) ( HOLDING ?auto_42859 ) ( CLEAR ?auto_42858 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42855 ?auto_42856 ?auto_42857 ?auto_42858 ?auto_42859 )
      ( MAKE-6PILE ?auto_42855 ?auto_42856 ?auto_42857 ?auto_42858 ?auto_42859 ?auto_42860 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42861 - BLOCK
      ?auto_42862 - BLOCK
      ?auto_42863 - BLOCK
      ?auto_42864 - BLOCK
      ?auto_42865 - BLOCK
      ?auto_42866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42861 ) ( ON ?auto_42862 ?auto_42861 ) ( ON ?auto_42863 ?auto_42862 ) ( ON ?auto_42864 ?auto_42863 ) ( not ( = ?auto_42861 ?auto_42862 ) ) ( not ( = ?auto_42861 ?auto_42863 ) ) ( not ( = ?auto_42861 ?auto_42864 ) ) ( not ( = ?auto_42861 ?auto_42865 ) ) ( not ( = ?auto_42861 ?auto_42866 ) ) ( not ( = ?auto_42862 ?auto_42863 ) ) ( not ( = ?auto_42862 ?auto_42864 ) ) ( not ( = ?auto_42862 ?auto_42865 ) ) ( not ( = ?auto_42862 ?auto_42866 ) ) ( not ( = ?auto_42863 ?auto_42864 ) ) ( not ( = ?auto_42863 ?auto_42865 ) ) ( not ( = ?auto_42863 ?auto_42866 ) ) ( not ( = ?auto_42864 ?auto_42865 ) ) ( not ( = ?auto_42864 ?auto_42866 ) ) ( not ( = ?auto_42865 ?auto_42866 ) ) ( ON-TABLE ?auto_42866 ) ( CLEAR ?auto_42864 ) ( ON ?auto_42865 ?auto_42866 ) ( CLEAR ?auto_42865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42866 )
      ( MAKE-6PILE ?auto_42861 ?auto_42862 ?auto_42863 ?auto_42864 ?auto_42865 ?auto_42866 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42867 - BLOCK
      ?auto_42868 - BLOCK
      ?auto_42869 - BLOCK
      ?auto_42870 - BLOCK
      ?auto_42871 - BLOCK
      ?auto_42872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42867 ) ( ON ?auto_42868 ?auto_42867 ) ( ON ?auto_42869 ?auto_42868 ) ( not ( = ?auto_42867 ?auto_42868 ) ) ( not ( = ?auto_42867 ?auto_42869 ) ) ( not ( = ?auto_42867 ?auto_42870 ) ) ( not ( = ?auto_42867 ?auto_42871 ) ) ( not ( = ?auto_42867 ?auto_42872 ) ) ( not ( = ?auto_42868 ?auto_42869 ) ) ( not ( = ?auto_42868 ?auto_42870 ) ) ( not ( = ?auto_42868 ?auto_42871 ) ) ( not ( = ?auto_42868 ?auto_42872 ) ) ( not ( = ?auto_42869 ?auto_42870 ) ) ( not ( = ?auto_42869 ?auto_42871 ) ) ( not ( = ?auto_42869 ?auto_42872 ) ) ( not ( = ?auto_42870 ?auto_42871 ) ) ( not ( = ?auto_42870 ?auto_42872 ) ) ( not ( = ?auto_42871 ?auto_42872 ) ) ( ON-TABLE ?auto_42872 ) ( ON ?auto_42871 ?auto_42872 ) ( CLEAR ?auto_42871 ) ( HOLDING ?auto_42870 ) ( CLEAR ?auto_42869 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42867 ?auto_42868 ?auto_42869 ?auto_42870 )
      ( MAKE-6PILE ?auto_42867 ?auto_42868 ?auto_42869 ?auto_42870 ?auto_42871 ?auto_42872 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42873 - BLOCK
      ?auto_42874 - BLOCK
      ?auto_42875 - BLOCK
      ?auto_42876 - BLOCK
      ?auto_42877 - BLOCK
      ?auto_42878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42873 ) ( ON ?auto_42874 ?auto_42873 ) ( ON ?auto_42875 ?auto_42874 ) ( not ( = ?auto_42873 ?auto_42874 ) ) ( not ( = ?auto_42873 ?auto_42875 ) ) ( not ( = ?auto_42873 ?auto_42876 ) ) ( not ( = ?auto_42873 ?auto_42877 ) ) ( not ( = ?auto_42873 ?auto_42878 ) ) ( not ( = ?auto_42874 ?auto_42875 ) ) ( not ( = ?auto_42874 ?auto_42876 ) ) ( not ( = ?auto_42874 ?auto_42877 ) ) ( not ( = ?auto_42874 ?auto_42878 ) ) ( not ( = ?auto_42875 ?auto_42876 ) ) ( not ( = ?auto_42875 ?auto_42877 ) ) ( not ( = ?auto_42875 ?auto_42878 ) ) ( not ( = ?auto_42876 ?auto_42877 ) ) ( not ( = ?auto_42876 ?auto_42878 ) ) ( not ( = ?auto_42877 ?auto_42878 ) ) ( ON-TABLE ?auto_42878 ) ( ON ?auto_42877 ?auto_42878 ) ( CLEAR ?auto_42875 ) ( ON ?auto_42876 ?auto_42877 ) ( CLEAR ?auto_42876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42878 ?auto_42877 )
      ( MAKE-6PILE ?auto_42873 ?auto_42874 ?auto_42875 ?auto_42876 ?auto_42877 ?auto_42878 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42879 - BLOCK
      ?auto_42880 - BLOCK
      ?auto_42881 - BLOCK
      ?auto_42882 - BLOCK
      ?auto_42883 - BLOCK
      ?auto_42884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42879 ) ( ON ?auto_42880 ?auto_42879 ) ( not ( = ?auto_42879 ?auto_42880 ) ) ( not ( = ?auto_42879 ?auto_42881 ) ) ( not ( = ?auto_42879 ?auto_42882 ) ) ( not ( = ?auto_42879 ?auto_42883 ) ) ( not ( = ?auto_42879 ?auto_42884 ) ) ( not ( = ?auto_42880 ?auto_42881 ) ) ( not ( = ?auto_42880 ?auto_42882 ) ) ( not ( = ?auto_42880 ?auto_42883 ) ) ( not ( = ?auto_42880 ?auto_42884 ) ) ( not ( = ?auto_42881 ?auto_42882 ) ) ( not ( = ?auto_42881 ?auto_42883 ) ) ( not ( = ?auto_42881 ?auto_42884 ) ) ( not ( = ?auto_42882 ?auto_42883 ) ) ( not ( = ?auto_42882 ?auto_42884 ) ) ( not ( = ?auto_42883 ?auto_42884 ) ) ( ON-TABLE ?auto_42884 ) ( ON ?auto_42883 ?auto_42884 ) ( ON ?auto_42882 ?auto_42883 ) ( CLEAR ?auto_42882 ) ( HOLDING ?auto_42881 ) ( CLEAR ?auto_42880 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42879 ?auto_42880 ?auto_42881 )
      ( MAKE-6PILE ?auto_42879 ?auto_42880 ?auto_42881 ?auto_42882 ?auto_42883 ?auto_42884 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42885 - BLOCK
      ?auto_42886 - BLOCK
      ?auto_42887 - BLOCK
      ?auto_42888 - BLOCK
      ?auto_42889 - BLOCK
      ?auto_42890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42885 ) ( ON ?auto_42886 ?auto_42885 ) ( not ( = ?auto_42885 ?auto_42886 ) ) ( not ( = ?auto_42885 ?auto_42887 ) ) ( not ( = ?auto_42885 ?auto_42888 ) ) ( not ( = ?auto_42885 ?auto_42889 ) ) ( not ( = ?auto_42885 ?auto_42890 ) ) ( not ( = ?auto_42886 ?auto_42887 ) ) ( not ( = ?auto_42886 ?auto_42888 ) ) ( not ( = ?auto_42886 ?auto_42889 ) ) ( not ( = ?auto_42886 ?auto_42890 ) ) ( not ( = ?auto_42887 ?auto_42888 ) ) ( not ( = ?auto_42887 ?auto_42889 ) ) ( not ( = ?auto_42887 ?auto_42890 ) ) ( not ( = ?auto_42888 ?auto_42889 ) ) ( not ( = ?auto_42888 ?auto_42890 ) ) ( not ( = ?auto_42889 ?auto_42890 ) ) ( ON-TABLE ?auto_42890 ) ( ON ?auto_42889 ?auto_42890 ) ( ON ?auto_42888 ?auto_42889 ) ( CLEAR ?auto_42886 ) ( ON ?auto_42887 ?auto_42888 ) ( CLEAR ?auto_42887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42890 ?auto_42889 ?auto_42888 )
      ( MAKE-6PILE ?auto_42885 ?auto_42886 ?auto_42887 ?auto_42888 ?auto_42889 ?auto_42890 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42891 - BLOCK
      ?auto_42892 - BLOCK
      ?auto_42893 - BLOCK
      ?auto_42894 - BLOCK
      ?auto_42895 - BLOCK
      ?auto_42896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42891 ) ( not ( = ?auto_42891 ?auto_42892 ) ) ( not ( = ?auto_42891 ?auto_42893 ) ) ( not ( = ?auto_42891 ?auto_42894 ) ) ( not ( = ?auto_42891 ?auto_42895 ) ) ( not ( = ?auto_42891 ?auto_42896 ) ) ( not ( = ?auto_42892 ?auto_42893 ) ) ( not ( = ?auto_42892 ?auto_42894 ) ) ( not ( = ?auto_42892 ?auto_42895 ) ) ( not ( = ?auto_42892 ?auto_42896 ) ) ( not ( = ?auto_42893 ?auto_42894 ) ) ( not ( = ?auto_42893 ?auto_42895 ) ) ( not ( = ?auto_42893 ?auto_42896 ) ) ( not ( = ?auto_42894 ?auto_42895 ) ) ( not ( = ?auto_42894 ?auto_42896 ) ) ( not ( = ?auto_42895 ?auto_42896 ) ) ( ON-TABLE ?auto_42896 ) ( ON ?auto_42895 ?auto_42896 ) ( ON ?auto_42894 ?auto_42895 ) ( ON ?auto_42893 ?auto_42894 ) ( CLEAR ?auto_42893 ) ( HOLDING ?auto_42892 ) ( CLEAR ?auto_42891 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42891 ?auto_42892 )
      ( MAKE-6PILE ?auto_42891 ?auto_42892 ?auto_42893 ?auto_42894 ?auto_42895 ?auto_42896 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42897 - BLOCK
      ?auto_42898 - BLOCK
      ?auto_42899 - BLOCK
      ?auto_42900 - BLOCK
      ?auto_42901 - BLOCK
      ?auto_42902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42897 ) ( not ( = ?auto_42897 ?auto_42898 ) ) ( not ( = ?auto_42897 ?auto_42899 ) ) ( not ( = ?auto_42897 ?auto_42900 ) ) ( not ( = ?auto_42897 ?auto_42901 ) ) ( not ( = ?auto_42897 ?auto_42902 ) ) ( not ( = ?auto_42898 ?auto_42899 ) ) ( not ( = ?auto_42898 ?auto_42900 ) ) ( not ( = ?auto_42898 ?auto_42901 ) ) ( not ( = ?auto_42898 ?auto_42902 ) ) ( not ( = ?auto_42899 ?auto_42900 ) ) ( not ( = ?auto_42899 ?auto_42901 ) ) ( not ( = ?auto_42899 ?auto_42902 ) ) ( not ( = ?auto_42900 ?auto_42901 ) ) ( not ( = ?auto_42900 ?auto_42902 ) ) ( not ( = ?auto_42901 ?auto_42902 ) ) ( ON-TABLE ?auto_42902 ) ( ON ?auto_42901 ?auto_42902 ) ( ON ?auto_42900 ?auto_42901 ) ( ON ?auto_42899 ?auto_42900 ) ( CLEAR ?auto_42897 ) ( ON ?auto_42898 ?auto_42899 ) ( CLEAR ?auto_42898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42902 ?auto_42901 ?auto_42900 ?auto_42899 )
      ( MAKE-6PILE ?auto_42897 ?auto_42898 ?auto_42899 ?auto_42900 ?auto_42901 ?auto_42902 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42903 - BLOCK
      ?auto_42904 - BLOCK
      ?auto_42905 - BLOCK
      ?auto_42906 - BLOCK
      ?auto_42907 - BLOCK
      ?auto_42908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42903 ?auto_42904 ) ) ( not ( = ?auto_42903 ?auto_42905 ) ) ( not ( = ?auto_42903 ?auto_42906 ) ) ( not ( = ?auto_42903 ?auto_42907 ) ) ( not ( = ?auto_42903 ?auto_42908 ) ) ( not ( = ?auto_42904 ?auto_42905 ) ) ( not ( = ?auto_42904 ?auto_42906 ) ) ( not ( = ?auto_42904 ?auto_42907 ) ) ( not ( = ?auto_42904 ?auto_42908 ) ) ( not ( = ?auto_42905 ?auto_42906 ) ) ( not ( = ?auto_42905 ?auto_42907 ) ) ( not ( = ?auto_42905 ?auto_42908 ) ) ( not ( = ?auto_42906 ?auto_42907 ) ) ( not ( = ?auto_42906 ?auto_42908 ) ) ( not ( = ?auto_42907 ?auto_42908 ) ) ( ON-TABLE ?auto_42908 ) ( ON ?auto_42907 ?auto_42908 ) ( ON ?auto_42906 ?auto_42907 ) ( ON ?auto_42905 ?auto_42906 ) ( ON ?auto_42904 ?auto_42905 ) ( CLEAR ?auto_42904 ) ( HOLDING ?auto_42903 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42903 )
      ( MAKE-6PILE ?auto_42903 ?auto_42904 ?auto_42905 ?auto_42906 ?auto_42907 ?auto_42908 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42909 - BLOCK
      ?auto_42910 - BLOCK
      ?auto_42911 - BLOCK
      ?auto_42912 - BLOCK
      ?auto_42913 - BLOCK
      ?auto_42914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42909 ?auto_42910 ) ) ( not ( = ?auto_42909 ?auto_42911 ) ) ( not ( = ?auto_42909 ?auto_42912 ) ) ( not ( = ?auto_42909 ?auto_42913 ) ) ( not ( = ?auto_42909 ?auto_42914 ) ) ( not ( = ?auto_42910 ?auto_42911 ) ) ( not ( = ?auto_42910 ?auto_42912 ) ) ( not ( = ?auto_42910 ?auto_42913 ) ) ( not ( = ?auto_42910 ?auto_42914 ) ) ( not ( = ?auto_42911 ?auto_42912 ) ) ( not ( = ?auto_42911 ?auto_42913 ) ) ( not ( = ?auto_42911 ?auto_42914 ) ) ( not ( = ?auto_42912 ?auto_42913 ) ) ( not ( = ?auto_42912 ?auto_42914 ) ) ( not ( = ?auto_42913 ?auto_42914 ) ) ( ON-TABLE ?auto_42914 ) ( ON ?auto_42913 ?auto_42914 ) ( ON ?auto_42912 ?auto_42913 ) ( ON ?auto_42911 ?auto_42912 ) ( ON ?auto_42910 ?auto_42911 ) ( ON ?auto_42909 ?auto_42910 ) ( CLEAR ?auto_42909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42914 ?auto_42913 ?auto_42912 ?auto_42911 ?auto_42910 )
      ( MAKE-6PILE ?auto_42909 ?auto_42910 ?auto_42911 ?auto_42912 ?auto_42913 ?auto_42914 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42915 - BLOCK
      ?auto_42916 - BLOCK
      ?auto_42917 - BLOCK
      ?auto_42918 - BLOCK
      ?auto_42919 - BLOCK
      ?auto_42920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42915 ?auto_42916 ) ) ( not ( = ?auto_42915 ?auto_42917 ) ) ( not ( = ?auto_42915 ?auto_42918 ) ) ( not ( = ?auto_42915 ?auto_42919 ) ) ( not ( = ?auto_42915 ?auto_42920 ) ) ( not ( = ?auto_42916 ?auto_42917 ) ) ( not ( = ?auto_42916 ?auto_42918 ) ) ( not ( = ?auto_42916 ?auto_42919 ) ) ( not ( = ?auto_42916 ?auto_42920 ) ) ( not ( = ?auto_42917 ?auto_42918 ) ) ( not ( = ?auto_42917 ?auto_42919 ) ) ( not ( = ?auto_42917 ?auto_42920 ) ) ( not ( = ?auto_42918 ?auto_42919 ) ) ( not ( = ?auto_42918 ?auto_42920 ) ) ( not ( = ?auto_42919 ?auto_42920 ) ) ( ON-TABLE ?auto_42920 ) ( ON ?auto_42919 ?auto_42920 ) ( ON ?auto_42918 ?auto_42919 ) ( ON ?auto_42917 ?auto_42918 ) ( ON ?auto_42916 ?auto_42917 ) ( HOLDING ?auto_42915 ) ( CLEAR ?auto_42916 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42920 ?auto_42919 ?auto_42918 ?auto_42917 ?auto_42916 ?auto_42915 )
      ( MAKE-6PILE ?auto_42915 ?auto_42916 ?auto_42917 ?auto_42918 ?auto_42919 ?auto_42920 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42921 - BLOCK
      ?auto_42922 - BLOCK
      ?auto_42923 - BLOCK
      ?auto_42924 - BLOCK
      ?auto_42925 - BLOCK
      ?auto_42926 - BLOCK
    )
    :vars
    (
      ?auto_42927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42921 ?auto_42922 ) ) ( not ( = ?auto_42921 ?auto_42923 ) ) ( not ( = ?auto_42921 ?auto_42924 ) ) ( not ( = ?auto_42921 ?auto_42925 ) ) ( not ( = ?auto_42921 ?auto_42926 ) ) ( not ( = ?auto_42922 ?auto_42923 ) ) ( not ( = ?auto_42922 ?auto_42924 ) ) ( not ( = ?auto_42922 ?auto_42925 ) ) ( not ( = ?auto_42922 ?auto_42926 ) ) ( not ( = ?auto_42923 ?auto_42924 ) ) ( not ( = ?auto_42923 ?auto_42925 ) ) ( not ( = ?auto_42923 ?auto_42926 ) ) ( not ( = ?auto_42924 ?auto_42925 ) ) ( not ( = ?auto_42924 ?auto_42926 ) ) ( not ( = ?auto_42925 ?auto_42926 ) ) ( ON-TABLE ?auto_42926 ) ( ON ?auto_42925 ?auto_42926 ) ( ON ?auto_42924 ?auto_42925 ) ( ON ?auto_42923 ?auto_42924 ) ( ON ?auto_42922 ?auto_42923 ) ( CLEAR ?auto_42922 ) ( ON ?auto_42921 ?auto_42927 ) ( CLEAR ?auto_42921 ) ( HAND-EMPTY ) ( not ( = ?auto_42921 ?auto_42927 ) ) ( not ( = ?auto_42922 ?auto_42927 ) ) ( not ( = ?auto_42923 ?auto_42927 ) ) ( not ( = ?auto_42924 ?auto_42927 ) ) ( not ( = ?auto_42925 ?auto_42927 ) ) ( not ( = ?auto_42926 ?auto_42927 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42921 ?auto_42927 )
      ( MAKE-6PILE ?auto_42921 ?auto_42922 ?auto_42923 ?auto_42924 ?auto_42925 ?auto_42926 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42928 - BLOCK
      ?auto_42929 - BLOCK
      ?auto_42930 - BLOCK
      ?auto_42931 - BLOCK
      ?auto_42932 - BLOCK
      ?auto_42933 - BLOCK
    )
    :vars
    (
      ?auto_42934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42928 ?auto_42929 ) ) ( not ( = ?auto_42928 ?auto_42930 ) ) ( not ( = ?auto_42928 ?auto_42931 ) ) ( not ( = ?auto_42928 ?auto_42932 ) ) ( not ( = ?auto_42928 ?auto_42933 ) ) ( not ( = ?auto_42929 ?auto_42930 ) ) ( not ( = ?auto_42929 ?auto_42931 ) ) ( not ( = ?auto_42929 ?auto_42932 ) ) ( not ( = ?auto_42929 ?auto_42933 ) ) ( not ( = ?auto_42930 ?auto_42931 ) ) ( not ( = ?auto_42930 ?auto_42932 ) ) ( not ( = ?auto_42930 ?auto_42933 ) ) ( not ( = ?auto_42931 ?auto_42932 ) ) ( not ( = ?auto_42931 ?auto_42933 ) ) ( not ( = ?auto_42932 ?auto_42933 ) ) ( ON-TABLE ?auto_42933 ) ( ON ?auto_42932 ?auto_42933 ) ( ON ?auto_42931 ?auto_42932 ) ( ON ?auto_42930 ?auto_42931 ) ( ON ?auto_42928 ?auto_42934 ) ( CLEAR ?auto_42928 ) ( not ( = ?auto_42928 ?auto_42934 ) ) ( not ( = ?auto_42929 ?auto_42934 ) ) ( not ( = ?auto_42930 ?auto_42934 ) ) ( not ( = ?auto_42931 ?auto_42934 ) ) ( not ( = ?auto_42932 ?auto_42934 ) ) ( not ( = ?auto_42933 ?auto_42934 ) ) ( HOLDING ?auto_42929 ) ( CLEAR ?auto_42930 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42933 ?auto_42932 ?auto_42931 ?auto_42930 ?auto_42929 )
      ( MAKE-6PILE ?auto_42928 ?auto_42929 ?auto_42930 ?auto_42931 ?auto_42932 ?auto_42933 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42935 - BLOCK
      ?auto_42936 - BLOCK
      ?auto_42937 - BLOCK
      ?auto_42938 - BLOCK
      ?auto_42939 - BLOCK
      ?auto_42940 - BLOCK
    )
    :vars
    (
      ?auto_42941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42935 ?auto_42936 ) ) ( not ( = ?auto_42935 ?auto_42937 ) ) ( not ( = ?auto_42935 ?auto_42938 ) ) ( not ( = ?auto_42935 ?auto_42939 ) ) ( not ( = ?auto_42935 ?auto_42940 ) ) ( not ( = ?auto_42936 ?auto_42937 ) ) ( not ( = ?auto_42936 ?auto_42938 ) ) ( not ( = ?auto_42936 ?auto_42939 ) ) ( not ( = ?auto_42936 ?auto_42940 ) ) ( not ( = ?auto_42937 ?auto_42938 ) ) ( not ( = ?auto_42937 ?auto_42939 ) ) ( not ( = ?auto_42937 ?auto_42940 ) ) ( not ( = ?auto_42938 ?auto_42939 ) ) ( not ( = ?auto_42938 ?auto_42940 ) ) ( not ( = ?auto_42939 ?auto_42940 ) ) ( ON-TABLE ?auto_42940 ) ( ON ?auto_42939 ?auto_42940 ) ( ON ?auto_42938 ?auto_42939 ) ( ON ?auto_42937 ?auto_42938 ) ( ON ?auto_42935 ?auto_42941 ) ( not ( = ?auto_42935 ?auto_42941 ) ) ( not ( = ?auto_42936 ?auto_42941 ) ) ( not ( = ?auto_42937 ?auto_42941 ) ) ( not ( = ?auto_42938 ?auto_42941 ) ) ( not ( = ?auto_42939 ?auto_42941 ) ) ( not ( = ?auto_42940 ?auto_42941 ) ) ( CLEAR ?auto_42937 ) ( ON ?auto_42936 ?auto_42935 ) ( CLEAR ?auto_42936 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42941 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42941 ?auto_42935 )
      ( MAKE-6PILE ?auto_42935 ?auto_42936 ?auto_42937 ?auto_42938 ?auto_42939 ?auto_42940 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42942 - BLOCK
      ?auto_42943 - BLOCK
      ?auto_42944 - BLOCK
      ?auto_42945 - BLOCK
      ?auto_42946 - BLOCK
      ?auto_42947 - BLOCK
    )
    :vars
    (
      ?auto_42948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42942 ?auto_42943 ) ) ( not ( = ?auto_42942 ?auto_42944 ) ) ( not ( = ?auto_42942 ?auto_42945 ) ) ( not ( = ?auto_42942 ?auto_42946 ) ) ( not ( = ?auto_42942 ?auto_42947 ) ) ( not ( = ?auto_42943 ?auto_42944 ) ) ( not ( = ?auto_42943 ?auto_42945 ) ) ( not ( = ?auto_42943 ?auto_42946 ) ) ( not ( = ?auto_42943 ?auto_42947 ) ) ( not ( = ?auto_42944 ?auto_42945 ) ) ( not ( = ?auto_42944 ?auto_42946 ) ) ( not ( = ?auto_42944 ?auto_42947 ) ) ( not ( = ?auto_42945 ?auto_42946 ) ) ( not ( = ?auto_42945 ?auto_42947 ) ) ( not ( = ?auto_42946 ?auto_42947 ) ) ( ON-TABLE ?auto_42947 ) ( ON ?auto_42946 ?auto_42947 ) ( ON ?auto_42945 ?auto_42946 ) ( ON ?auto_42942 ?auto_42948 ) ( not ( = ?auto_42942 ?auto_42948 ) ) ( not ( = ?auto_42943 ?auto_42948 ) ) ( not ( = ?auto_42944 ?auto_42948 ) ) ( not ( = ?auto_42945 ?auto_42948 ) ) ( not ( = ?auto_42946 ?auto_42948 ) ) ( not ( = ?auto_42947 ?auto_42948 ) ) ( ON ?auto_42943 ?auto_42942 ) ( CLEAR ?auto_42943 ) ( ON-TABLE ?auto_42948 ) ( HOLDING ?auto_42944 ) ( CLEAR ?auto_42945 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42947 ?auto_42946 ?auto_42945 ?auto_42944 )
      ( MAKE-6PILE ?auto_42942 ?auto_42943 ?auto_42944 ?auto_42945 ?auto_42946 ?auto_42947 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42949 - BLOCK
      ?auto_42950 - BLOCK
      ?auto_42951 - BLOCK
      ?auto_42952 - BLOCK
      ?auto_42953 - BLOCK
      ?auto_42954 - BLOCK
    )
    :vars
    (
      ?auto_42955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42949 ?auto_42950 ) ) ( not ( = ?auto_42949 ?auto_42951 ) ) ( not ( = ?auto_42949 ?auto_42952 ) ) ( not ( = ?auto_42949 ?auto_42953 ) ) ( not ( = ?auto_42949 ?auto_42954 ) ) ( not ( = ?auto_42950 ?auto_42951 ) ) ( not ( = ?auto_42950 ?auto_42952 ) ) ( not ( = ?auto_42950 ?auto_42953 ) ) ( not ( = ?auto_42950 ?auto_42954 ) ) ( not ( = ?auto_42951 ?auto_42952 ) ) ( not ( = ?auto_42951 ?auto_42953 ) ) ( not ( = ?auto_42951 ?auto_42954 ) ) ( not ( = ?auto_42952 ?auto_42953 ) ) ( not ( = ?auto_42952 ?auto_42954 ) ) ( not ( = ?auto_42953 ?auto_42954 ) ) ( ON-TABLE ?auto_42954 ) ( ON ?auto_42953 ?auto_42954 ) ( ON ?auto_42952 ?auto_42953 ) ( ON ?auto_42949 ?auto_42955 ) ( not ( = ?auto_42949 ?auto_42955 ) ) ( not ( = ?auto_42950 ?auto_42955 ) ) ( not ( = ?auto_42951 ?auto_42955 ) ) ( not ( = ?auto_42952 ?auto_42955 ) ) ( not ( = ?auto_42953 ?auto_42955 ) ) ( not ( = ?auto_42954 ?auto_42955 ) ) ( ON ?auto_42950 ?auto_42949 ) ( ON-TABLE ?auto_42955 ) ( CLEAR ?auto_42952 ) ( ON ?auto_42951 ?auto_42950 ) ( CLEAR ?auto_42951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42955 ?auto_42949 ?auto_42950 )
      ( MAKE-6PILE ?auto_42949 ?auto_42950 ?auto_42951 ?auto_42952 ?auto_42953 ?auto_42954 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42956 - BLOCK
      ?auto_42957 - BLOCK
      ?auto_42958 - BLOCK
      ?auto_42959 - BLOCK
      ?auto_42960 - BLOCK
      ?auto_42961 - BLOCK
    )
    :vars
    (
      ?auto_42962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42956 ?auto_42957 ) ) ( not ( = ?auto_42956 ?auto_42958 ) ) ( not ( = ?auto_42956 ?auto_42959 ) ) ( not ( = ?auto_42956 ?auto_42960 ) ) ( not ( = ?auto_42956 ?auto_42961 ) ) ( not ( = ?auto_42957 ?auto_42958 ) ) ( not ( = ?auto_42957 ?auto_42959 ) ) ( not ( = ?auto_42957 ?auto_42960 ) ) ( not ( = ?auto_42957 ?auto_42961 ) ) ( not ( = ?auto_42958 ?auto_42959 ) ) ( not ( = ?auto_42958 ?auto_42960 ) ) ( not ( = ?auto_42958 ?auto_42961 ) ) ( not ( = ?auto_42959 ?auto_42960 ) ) ( not ( = ?auto_42959 ?auto_42961 ) ) ( not ( = ?auto_42960 ?auto_42961 ) ) ( ON-TABLE ?auto_42961 ) ( ON ?auto_42960 ?auto_42961 ) ( ON ?auto_42956 ?auto_42962 ) ( not ( = ?auto_42956 ?auto_42962 ) ) ( not ( = ?auto_42957 ?auto_42962 ) ) ( not ( = ?auto_42958 ?auto_42962 ) ) ( not ( = ?auto_42959 ?auto_42962 ) ) ( not ( = ?auto_42960 ?auto_42962 ) ) ( not ( = ?auto_42961 ?auto_42962 ) ) ( ON ?auto_42957 ?auto_42956 ) ( ON-TABLE ?auto_42962 ) ( ON ?auto_42958 ?auto_42957 ) ( CLEAR ?auto_42958 ) ( HOLDING ?auto_42959 ) ( CLEAR ?auto_42960 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42961 ?auto_42960 ?auto_42959 )
      ( MAKE-6PILE ?auto_42956 ?auto_42957 ?auto_42958 ?auto_42959 ?auto_42960 ?auto_42961 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42963 - BLOCK
      ?auto_42964 - BLOCK
      ?auto_42965 - BLOCK
      ?auto_42966 - BLOCK
      ?auto_42967 - BLOCK
      ?auto_42968 - BLOCK
    )
    :vars
    (
      ?auto_42969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42963 ?auto_42964 ) ) ( not ( = ?auto_42963 ?auto_42965 ) ) ( not ( = ?auto_42963 ?auto_42966 ) ) ( not ( = ?auto_42963 ?auto_42967 ) ) ( not ( = ?auto_42963 ?auto_42968 ) ) ( not ( = ?auto_42964 ?auto_42965 ) ) ( not ( = ?auto_42964 ?auto_42966 ) ) ( not ( = ?auto_42964 ?auto_42967 ) ) ( not ( = ?auto_42964 ?auto_42968 ) ) ( not ( = ?auto_42965 ?auto_42966 ) ) ( not ( = ?auto_42965 ?auto_42967 ) ) ( not ( = ?auto_42965 ?auto_42968 ) ) ( not ( = ?auto_42966 ?auto_42967 ) ) ( not ( = ?auto_42966 ?auto_42968 ) ) ( not ( = ?auto_42967 ?auto_42968 ) ) ( ON-TABLE ?auto_42968 ) ( ON ?auto_42967 ?auto_42968 ) ( ON ?auto_42963 ?auto_42969 ) ( not ( = ?auto_42963 ?auto_42969 ) ) ( not ( = ?auto_42964 ?auto_42969 ) ) ( not ( = ?auto_42965 ?auto_42969 ) ) ( not ( = ?auto_42966 ?auto_42969 ) ) ( not ( = ?auto_42967 ?auto_42969 ) ) ( not ( = ?auto_42968 ?auto_42969 ) ) ( ON ?auto_42964 ?auto_42963 ) ( ON-TABLE ?auto_42969 ) ( ON ?auto_42965 ?auto_42964 ) ( CLEAR ?auto_42967 ) ( ON ?auto_42966 ?auto_42965 ) ( CLEAR ?auto_42966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42969 ?auto_42963 ?auto_42964 ?auto_42965 )
      ( MAKE-6PILE ?auto_42963 ?auto_42964 ?auto_42965 ?auto_42966 ?auto_42967 ?auto_42968 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42970 - BLOCK
      ?auto_42971 - BLOCK
      ?auto_42972 - BLOCK
      ?auto_42973 - BLOCK
      ?auto_42974 - BLOCK
      ?auto_42975 - BLOCK
    )
    :vars
    (
      ?auto_42976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42970 ?auto_42971 ) ) ( not ( = ?auto_42970 ?auto_42972 ) ) ( not ( = ?auto_42970 ?auto_42973 ) ) ( not ( = ?auto_42970 ?auto_42974 ) ) ( not ( = ?auto_42970 ?auto_42975 ) ) ( not ( = ?auto_42971 ?auto_42972 ) ) ( not ( = ?auto_42971 ?auto_42973 ) ) ( not ( = ?auto_42971 ?auto_42974 ) ) ( not ( = ?auto_42971 ?auto_42975 ) ) ( not ( = ?auto_42972 ?auto_42973 ) ) ( not ( = ?auto_42972 ?auto_42974 ) ) ( not ( = ?auto_42972 ?auto_42975 ) ) ( not ( = ?auto_42973 ?auto_42974 ) ) ( not ( = ?auto_42973 ?auto_42975 ) ) ( not ( = ?auto_42974 ?auto_42975 ) ) ( ON-TABLE ?auto_42975 ) ( ON ?auto_42970 ?auto_42976 ) ( not ( = ?auto_42970 ?auto_42976 ) ) ( not ( = ?auto_42971 ?auto_42976 ) ) ( not ( = ?auto_42972 ?auto_42976 ) ) ( not ( = ?auto_42973 ?auto_42976 ) ) ( not ( = ?auto_42974 ?auto_42976 ) ) ( not ( = ?auto_42975 ?auto_42976 ) ) ( ON ?auto_42971 ?auto_42970 ) ( ON-TABLE ?auto_42976 ) ( ON ?auto_42972 ?auto_42971 ) ( ON ?auto_42973 ?auto_42972 ) ( CLEAR ?auto_42973 ) ( HOLDING ?auto_42974 ) ( CLEAR ?auto_42975 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42975 ?auto_42974 )
      ( MAKE-6PILE ?auto_42970 ?auto_42971 ?auto_42972 ?auto_42973 ?auto_42974 ?auto_42975 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42977 - BLOCK
      ?auto_42978 - BLOCK
      ?auto_42979 - BLOCK
      ?auto_42980 - BLOCK
      ?auto_42981 - BLOCK
      ?auto_42982 - BLOCK
    )
    :vars
    (
      ?auto_42983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42977 ?auto_42978 ) ) ( not ( = ?auto_42977 ?auto_42979 ) ) ( not ( = ?auto_42977 ?auto_42980 ) ) ( not ( = ?auto_42977 ?auto_42981 ) ) ( not ( = ?auto_42977 ?auto_42982 ) ) ( not ( = ?auto_42978 ?auto_42979 ) ) ( not ( = ?auto_42978 ?auto_42980 ) ) ( not ( = ?auto_42978 ?auto_42981 ) ) ( not ( = ?auto_42978 ?auto_42982 ) ) ( not ( = ?auto_42979 ?auto_42980 ) ) ( not ( = ?auto_42979 ?auto_42981 ) ) ( not ( = ?auto_42979 ?auto_42982 ) ) ( not ( = ?auto_42980 ?auto_42981 ) ) ( not ( = ?auto_42980 ?auto_42982 ) ) ( not ( = ?auto_42981 ?auto_42982 ) ) ( ON-TABLE ?auto_42982 ) ( ON ?auto_42977 ?auto_42983 ) ( not ( = ?auto_42977 ?auto_42983 ) ) ( not ( = ?auto_42978 ?auto_42983 ) ) ( not ( = ?auto_42979 ?auto_42983 ) ) ( not ( = ?auto_42980 ?auto_42983 ) ) ( not ( = ?auto_42981 ?auto_42983 ) ) ( not ( = ?auto_42982 ?auto_42983 ) ) ( ON ?auto_42978 ?auto_42977 ) ( ON-TABLE ?auto_42983 ) ( ON ?auto_42979 ?auto_42978 ) ( ON ?auto_42980 ?auto_42979 ) ( CLEAR ?auto_42982 ) ( ON ?auto_42981 ?auto_42980 ) ( CLEAR ?auto_42981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42983 ?auto_42977 ?auto_42978 ?auto_42979 ?auto_42980 )
      ( MAKE-6PILE ?auto_42977 ?auto_42978 ?auto_42979 ?auto_42980 ?auto_42981 ?auto_42982 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42984 - BLOCK
      ?auto_42985 - BLOCK
      ?auto_42986 - BLOCK
      ?auto_42987 - BLOCK
      ?auto_42988 - BLOCK
      ?auto_42989 - BLOCK
    )
    :vars
    (
      ?auto_42990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42984 ?auto_42985 ) ) ( not ( = ?auto_42984 ?auto_42986 ) ) ( not ( = ?auto_42984 ?auto_42987 ) ) ( not ( = ?auto_42984 ?auto_42988 ) ) ( not ( = ?auto_42984 ?auto_42989 ) ) ( not ( = ?auto_42985 ?auto_42986 ) ) ( not ( = ?auto_42985 ?auto_42987 ) ) ( not ( = ?auto_42985 ?auto_42988 ) ) ( not ( = ?auto_42985 ?auto_42989 ) ) ( not ( = ?auto_42986 ?auto_42987 ) ) ( not ( = ?auto_42986 ?auto_42988 ) ) ( not ( = ?auto_42986 ?auto_42989 ) ) ( not ( = ?auto_42987 ?auto_42988 ) ) ( not ( = ?auto_42987 ?auto_42989 ) ) ( not ( = ?auto_42988 ?auto_42989 ) ) ( ON ?auto_42984 ?auto_42990 ) ( not ( = ?auto_42984 ?auto_42990 ) ) ( not ( = ?auto_42985 ?auto_42990 ) ) ( not ( = ?auto_42986 ?auto_42990 ) ) ( not ( = ?auto_42987 ?auto_42990 ) ) ( not ( = ?auto_42988 ?auto_42990 ) ) ( not ( = ?auto_42989 ?auto_42990 ) ) ( ON ?auto_42985 ?auto_42984 ) ( ON-TABLE ?auto_42990 ) ( ON ?auto_42986 ?auto_42985 ) ( ON ?auto_42987 ?auto_42986 ) ( ON ?auto_42988 ?auto_42987 ) ( CLEAR ?auto_42988 ) ( HOLDING ?auto_42989 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42989 )
      ( MAKE-6PILE ?auto_42984 ?auto_42985 ?auto_42986 ?auto_42987 ?auto_42988 ?auto_42989 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42991 - BLOCK
      ?auto_42992 - BLOCK
      ?auto_42993 - BLOCK
      ?auto_42994 - BLOCK
      ?auto_42995 - BLOCK
      ?auto_42996 - BLOCK
    )
    :vars
    (
      ?auto_42997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42991 ?auto_42992 ) ) ( not ( = ?auto_42991 ?auto_42993 ) ) ( not ( = ?auto_42991 ?auto_42994 ) ) ( not ( = ?auto_42991 ?auto_42995 ) ) ( not ( = ?auto_42991 ?auto_42996 ) ) ( not ( = ?auto_42992 ?auto_42993 ) ) ( not ( = ?auto_42992 ?auto_42994 ) ) ( not ( = ?auto_42992 ?auto_42995 ) ) ( not ( = ?auto_42992 ?auto_42996 ) ) ( not ( = ?auto_42993 ?auto_42994 ) ) ( not ( = ?auto_42993 ?auto_42995 ) ) ( not ( = ?auto_42993 ?auto_42996 ) ) ( not ( = ?auto_42994 ?auto_42995 ) ) ( not ( = ?auto_42994 ?auto_42996 ) ) ( not ( = ?auto_42995 ?auto_42996 ) ) ( ON ?auto_42991 ?auto_42997 ) ( not ( = ?auto_42991 ?auto_42997 ) ) ( not ( = ?auto_42992 ?auto_42997 ) ) ( not ( = ?auto_42993 ?auto_42997 ) ) ( not ( = ?auto_42994 ?auto_42997 ) ) ( not ( = ?auto_42995 ?auto_42997 ) ) ( not ( = ?auto_42996 ?auto_42997 ) ) ( ON ?auto_42992 ?auto_42991 ) ( ON-TABLE ?auto_42997 ) ( ON ?auto_42993 ?auto_42992 ) ( ON ?auto_42994 ?auto_42993 ) ( ON ?auto_42995 ?auto_42994 ) ( ON ?auto_42996 ?auto_42995 ) ( CLEAR ?auto_42996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42997 ?auto_42991 ?auto_42992 ?auto_42993 ?auto_42994 ?auto_42995 )
      ( MAKE-6PILE ?auto_42991 ?auto_42992 ?auto_42993 ?auto_42994 ?auto_42995 ?auto_42996 ) )
  )

)

