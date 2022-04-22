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
      ?auto_87163 - BLOCK
      ?auto_87164 - BLOCK
      ?auto_87165 - BLOCK
      ?auto_87166 - BLOCK
      ?auto_87167 - BLOCK
      ?auto_87168 - BLOCK
      ?auto_87169 - BLOCK
    )
    :vars
    (
      ?auto_87170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87170 ?auto_87169 ) ( CLEAR ?auto_87170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87163 ) ( ON ?auto_87164 ?auto_87163 ) ( ON ?auto_87165 ?auto_87164 ) ( ON ?auto_87166 ?auto_87165 ) ( ON ?auto_87167 ?auto_87166 ) ( ON ?auto_87168 ?auto_87167 ) ( ON ?auto_87169 ?auto_87168 ) ( not ( = ?auto_87163 ?auto_87164 ) ) ( not ( = ?auto_87163 ?auto_87165 ) ) ( not ( = ?auto_87163 ?auto_87166 ) ) ( not ( = ?auto_87163 ?auto_87167 ) ) ( not ( = ?auto_87163 ?auto_87168 ) ) ( not ( = ?auto_87163 ?auto_87169 ) ) ( not ( = ?auto_87163 ?auto_87170 ) ) ( not ( = ?auto_87164 ?auto_87165 ) ) ( not ( = ?auto_87164 ?auto_87166 ) ) ( not ( = ?auto_87164 ?auto_87167 ) ) ( not ( = ?auto_87164 ?auto_87168 ) ) ( not ( = ?auto_87164 ?auto_87169 ) ) ( not ( = ?auto_87164 ?auto_87170 ) ) ( not ( = ?auto_87165 ?auto_87166 ) ) ( not ( = ?auto_87165 ?auto_87167 ) ) ( not ( = ?auto_87165 ?auto_87168 ) ) ( not ( = ?auto_87165 ?auto_87169 ) ) ( not ( = ?auto_87165 ?auto_87170 ) ) ( not ( = ?auto_87166 ?auto_87167 ) ) ( not ( = ?auto_87166 ?auto_87168 ) ) ( not ( = ?auto_87166 ?auto_87169 ) ) ( not ( = ?auto_87166 ?auto_87170 ) ) ( not ( = ?auto_87167 ?auto_87168 ) ) ( not ( = ?auto_87167 ?auto_87169 ) ) ( not ( = ?auto_87167 ?auto_87170 ) ) ( not ( = ?auto_87168 ?auto_87169 ) ) ( not ( = ?auto_87168 ?auto_87170 ) ) ( not ( = ?auto_87169 ?auto_87170 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87170 ?auto_87169 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87172 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_87172 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_87172 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87173 - BLOCK
    )
    :vars
    (
      ?auto_87174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87173 ?auto_87174 ) ( CLEAR ?auto_87173 ) ( HAND-EMPTY ) ( not ( = ?auto_87173 ?auto_87174 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87173 ?auto_87174 )
      ( MAKE-1PILE ?auto_87173 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87181 - BLOCK
      ?auto_87182 - BLOCK
      ?auto_87183 - BLOCK
      ?auto_87184 - BLOCK
      ?auto_87185 - BLOCK
      ?auto_87186 - BLOCK
    )
    :vars
    (
      ?auto_87187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87187 ?auto_87186 ) ( CLEAR ?auto_87187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87181 ) ( ON ?auto_87182 ?auto_87181 ) ( ON ?auto_87183 ?auto_87182 ) ( ON ?auto_87184 ?auto_87183 ) ( ON ?auto_87185 ?auto_87184 ) ( ON ?auto_87186 ?auto_87185 ) ( not ( = ?auto_87181 ?auto_87182 ) ) ( not ( = ?auto_87181 ?auto_87183 ) ) ( not ( = ?auto_87181 ?auto_87184 ) ) ( not ( = ?auto_87181 ?auto_87185 ) ) ( not ( = ?auto_87181 ?auto_87186 ) ) ( not ( = ?auto_87181 ?auto_87187 ) ) ( not ( = ?auto_87182 ?auto_87183 ) ) ( not ( = ?auto_87182 ?auto_87184 ) ) ( not ( = ?auto_87182 ?auto_87185 ) ) ( not ( = ?auto_87182 ?auto_87186 ) ) ( not ( = ?auto_87182 ?auto_87187 ) ) ( not ( = ?auto_87183 ?auto_87184 ) ) ( not ( = ?auto_87183 ?auto_87185 ) ) ( not ( = ?auto_87183 ?auto_87186 ) ) ( not ( = ?auto_87183 ?auto_87187 ) ) ( not ( = ?auto_87184 ?auto_87185 ) ) ( not ( = ?auto_87184 ?auto_87186 ) ) ( not ( = ?auto_87184 ?auto_87187 ) ) ( not ( = ?auto_87185 ?auto_87186 ) ) ( not ( = ?auto_87185 ?auto_87187 ) ) ( not ( = ?auto_87186 ?auto_87187 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87187 ?auto_87186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87188 - BLOCK
      ?auto_87189 - BLOCK
      ?auto_87190 - BLOCK
      ?auto_87191 - BLOCK
      ?auto_87192 - BLOCK
      ?auto_87193 - BLOCK
    )
    :vars
    (
      ?auto_87194 - BLOCK
      ?auto_87195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87194 ?auto_87193 ) ( CLEAR ?auto_87194 ) ( ON-TABLE ?auto_87188 ) ( ON ?auto_87189 ?auto_87188 ) ( ON ?auto_87190 ?auto_87189 ) ( ON ?auto_87191 ?auto_87190 ) ( ON ?auto_87192 ?auto_87191 ) ( ON ?auto_87193 ?auto_87192 ) ( not ( = ?auto_87188 ?auto_87189 ) ) ( not ( = ?auto_87188 ?auto_87190 ) ) ( not ( = ?auto_87188 ?auto_87191 ) ) ( not ( = ?auto_87188 ?auto_87192 ) ) ( not ( = ?auto_87188 ?auto_87193 ) ) ( not ( = ?auto_87188 ?auto_87194 ) ) ( not ( = ?auto_87189 ?auto_87190 ) ) ( not ( = ?auto_87189 ?auto_87191 ) ) ( not ( = ?auto_87189 ?auto_87192 ) ) ( not ( = ?auto_87189 ?auto_87193 ) ) ( not ( = ?auto_87189 ?auto_87194 ) ) ( not ( = ?auto_87190 ?auto_87191 ) ) ( not ( = ?auto_87190 ?auto_87192 ) ) ( not ( = ?auto_87190 ?auto_87193 ) ) ( not ( = ?auto_87190 ?auto_87194 ) ) ( not ( = ?auto_87191 ?auto_87192 ) ) ( not ( = ?auto_87191 ?auto_87193 ) ) ( not ( = ?auto_87191 ?auto_87194 ) ) ( not ( = ?auto_87192 ?auto_87193 ) ) ( not ( = ?auto_87192 ?auto_87194 ) ) ( not ( = ?auto_87193 ?auto_87194 ) ) ( HOLDING ?auto_87195 ) ( not ( = ?auto_87188 ?auto_87195 ) ) ( not ( = ?auto_87189 ?auto_87195 ) ) ( not ( = ?auto_87190 ?auto_87195 ) ) ( not ( = ?auto_87191 ?auto_87195 ) ) ( not ( = ?auto_87192 ?auto_87195 ) ) ( not ( = ?auto_87193 ?auto_87195 ) ) ( not ( = ?auto_87194 ?auto_87195 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_87195 )
      ( MAKE-6PILE ?auto_87188 ?auto_87189 ?auto_87190 ?auto_87191 ?auto_87192 ?auto_87193 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87196 - BLOCK
      ?auto_87197 - BLOCK
      ?auto_87198 - BLOCK
      ?auto_87199 - BLOCK
      ?auto_87200 - BLOCK
      ?auto_87201 - BLOCK
    )
    :vars
    (
      ?auto_87202 - BLOCK
      ?auto_87203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87202 ?auto_87201 ) ( ON-TABLE ?auto_87196 ) ( ON ?auto_87197 ?auto_87196 ) ( ON ?auto_87198 ?auto_87197 ) ( ON ?auto_87199 ?auto_87198 ) ( ON ?auto_87200 ?auto_87199 ) ( ON ?auto_87201 ?auto_87200 ) ( not ( = ?auto_87196 ?auto_87197 ) ) ( not ( = ?auto_87196 ?auto_87198 ) ) ( not ( = ?auto_87196 ?auto_87199 ) ) ( not ( = ?auto_87196 ?auto_87200 ) ) ( not ( = ?auto_87196 ?auto_87201 ) ) ( not ( = ?auto_87196 ?auto_87202 ) ) ( not ( = ?auto_87197 ?auto_87198 ) ) ( not ( = ?auto_87197 ?auto_87199 ) ) ( not ( = ?auto_87197 ?auto_87200 ) ) ( not ( = ?auto_87197 ?auto_87201 ) ) ( not ( = ?auto_87197 ?auto_87202 ) ) ( not ( = ?auto_87198 ?auto_87199 ) ) ( not ( = ?auto_87198 ?auto_87200 ) ) ( not ( = ?auto_87198 ?auto_87201 ) ) ( not ( = ?auto_87198 ?auto_87202 ) ) ( not ( = ?auto_87199 ?auto_87200 ) ) ( not ( = ?auto_87199 ?auto_87201 ) ) ( not ( = ?auto_87199 ?auto_87202 ) ) ( not ( = ?auto_87200 ?auto_87201 ) ) ( not ( = ?auto_87200 ?auto_87202 ) ) ( not ( = ?auto_87201 ?auto_87202 ) ) ( not ( = ?auto_87196 ?auto_87203 ) ) ( not ( = ?auto_87197 ?auto_87203 ) ) ( not ( = ?auto_87198 ?auto_87203 ) ) ( not ( = ?auto_87199 ?auto_87203 ) ) ( not ( = ?auto_87200 ?auto_87203 ) ) ( not ( = ?auto_87201 ?auto_87203 ) ) ( not ( = ?auto_87202 ?auto_87203 ) ) ( ON ?auto_87203 ?auto_87202 ) ( CLEAR ?auto_87203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87196 ?auto_87197 ?auto_87198 ?auto_87199 ?auto_87200 ?auto_87201 ?auto_87202 )
      ( MAKE-6PILE ?auto_87196 ?auto_87197 ?auto_87198 ?auto_87199 ?auto_87200 ?auto_87201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87206 - BLOCK
      ?auto_87207 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_87207 ) ( CLEAR ?auto_87206 ) ( ON-TABLE ?auto_87206 ) ( not ( = ?auto_87206 ?auto_87207 ) ) )
    :subtasks
    ( ( !STACK ?auto_87207 ?auto_87206 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87208 - BLOCK
      ?auto_87209 - BLOCK
    )
    :vars
    (
      ?auto_87210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_87208 ) ( ON-TABLE ?auto_87208 ) ( not ( = ?auto_87208 ?auto_87209 ) ) ( ON ?auto_87209 ?auto_87210 ) ( CLEAR ?auto_87209 ) ( HAND-EMPTY ) ( not ( = ?auto_87208 ?auto_87210 ) ) ( not ( = ?auto_87209 ?auto_87210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87209 ?auto_87210 )
      ( MAKE-2PILE ?auto_87208 ?auto_87209 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87211 - BLOCK
      ?auto_87212 - BLOCK
    )
    :vars
    (
      ?auto_87213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87211 ?auto_87212 ) ) ( ON ?auto_87212 ?auto_87213 ) ( CLEAR ?auto_87212 ) ( not ( = ?auto_87211 ?auto_87213 ) ) ( not ( = ?auto_87212 ?auto_87213 ) ) ( HOLDING ?auto_87211 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87211 )
      ( MAKE-2PILE ?auto_87211 ?auto_87212 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87214 - BLOCK
      ?auto_87215 - BLOCK
    )
    :vars
    (
      ?auto_87216 - BLOCK
      ?auto_87221 - BLOCK
      ?auto_87218 - BLOCK
      ?auto_87217 - BLOCK
      ?auto_87219 - BLOCK
      ?auto_87220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87214 ?auto_87215 ) ) ( ON ?auto_87215 ?auto_87216 ) ( not ( = ?auto_87214 ?auto_87216 ) ) ( not ( = ?auto_87215 ?auto_87216 ) ) ( ON ?auto_87214 ?auto_87215 ) ( CLEAR ?auto_87214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87221 ) ( ON ?auto_87218 ?auto_87221 ) ( ON ?auto_87217 ?auto_87218 ) ( ON ?auto_87219 ?auto_87217 ) ( ON ?auto_87220 ?auto_87219 ) ( ON ?auto_87216 ?auto_87220 ) ( not ( = ?auto_87221 ?auto_87218 ) ) ( not ( = ?auto_87221 ?auto_87217 ) ) ( not ( = ?auto_87221 ?auto_87219 ) ) ( not ( = ?auto_87221 ?auto_87220 ) ) ( not ( = ?auto_87221 ?auto_87216 ) ) ( not ( = ?auto_87221 ?auto_87215 ) ) ( not ( = ?auto_87221 ?auto_87214 ) ) ( not ( = ?auto_87218 ?auto_87217 ) ) ( not ( = ?auto_87218 ?auto_87219 ) ) ( not ( = ?auto_87218 ?auto_87220 ) ) ( not ( = ?auto_87218 ?auto_87216 ) ) ( not ( = ?auto_87218 ?auto_87215 ) ) ( not ( = ?auto_87218 ?auto_87214 ) ) ( not ( = ?auto_87217 ?auto_87219 ) ) ( not ( = ?auto_87217 ?auto_87220 ) ) ( not ( = ?auto_87217 ?auto_87216 ) ) ( not ( = ?auto_87217 ?auto_87215 ) ) ( not ( = ?auto_87217 ?auto_87214 ) ) ( not ( = ?auto_87219 ?auto_87220 ) ) ( not ( = ?auto_87219 ?auto_87216 ) ) ( not ( = ?auto_87219 ?auto_87215 ) ) ( not ( = ?auto_87219 ?auto_87214 ) ) ( not ( = ?auto_87220 ?auto_87216 ) ) ( not ( = ?auto_87220 ?auto_87215 ) ) ( not ( = ?auto_87220 ?auto_87214 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87221 ?auto_87218 ?auto_87217 ?auto_87219 ?auto_87220 ?auto_87216 ?auto_87215 )
      ( MAKE-2PILE ?auto_87214 ?auto_87215 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87227 - BLOCK
      ?auto_87228 - BLOCK
      ?auto_87229 - BLOCK
      ?auto_87230 - BLOCK
      ?auto_87231 - BLOCK
    )
    :vars
    (
      ?auto_87232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87232 ?auto_87231 ) ( CLEAR ?auto_87232 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87227 ) ( ON ?auto_87228 ?auto_87227 ) ( ON ?auto_87229 ?auto_87228 ) ( ON ?auto_87230 ?auto_87229 ) ( ON ?auto_87231 ?auto_87230 ) ( not ( = ?auto_87227 ?auto_87228 ) ) ( not ( = ?auto_87227 ?auto_87229 ) ) ( not ( = ?auto_87227 ?auto_87230 ) ) ( not ( = ?auto_87227 ?auto_87231 ) ) ( not ( = ?auto_87227 ?auto_87232 ) ) ( not ( = ?auto_87228 ?auto_87229 ) ) ( not ( = ?auto_87228 ?auto_87230 ) ) ( not ( = ?auto_87228 ?auto_87231 ) ) ( not ( = ?auto_87228 ?auto_87232 ) ) ( not ( = ?auto_87229 ?auto_87230 ) ) ( not ( = ?auto_87229 ?auto_87231 ) ) ( not ( = ?auto_87229 ?auto_87232 ) ) ( not ( = ?auto_87230 ?auto_87231 ) ) ( not ( = ?auto_87230 ?auto_87232 ) ) ( not ( = ?auto_87231 ?auto_87232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87232 ?auto_87231 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87233 - BLOCK
      ?auto_87234 - BLOCK
      ?auto_87235 - BLOCK
      ?auto_87236 - BLOCK
      ?auto_87237 - BLOCK
    )
    :vars
    (
      ?auto_87238 - BLOCK
      ?auto_87239 - BLOCK
      ?auto_87240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87238 ?auto_87237 ) ( CLEAR ?auto_87238 ) ( ON-TABLE ?auto_87233 ) ( ON ?auto_87234 ?auto_87233 ) ( ON ?auto_87235 ?auto_87234 ) ( ON ?auto_87236 ?auto_87235 ) ( ON ?auto_87237 ?auto_87236 ) ( not ( = ?auto_87233 ?auto_87234 ) ) ( not ( = ?auto_87233 ?auto_87235 ) ) ( not ( = ?auto_87233 ?auto_87236 ) ) ( not ( = ?auto_87233 ?auto_87237 ) ) ( not ( = ?auto_87233 ?auto_87238 ) ) ( not ( = ?auto_87234 ?auto_87235 ) ) ( not ( = ?auto_87234 ?auto_87236 ) ) ( not ( = ?auto_87234 ?auto_87237 ) ) ( not ( = ?auto_87234 ?auto_87238 ) ) ( not ( = ?auto_87235 ?auto_87236 ) ) ( not ( = ?auto_87235 ?auto_87237 ) ) ( not ( = ?auto_87235 ?auto_87238 ) ) ( not ( = ?auto_87236 ?auto_87237 ) ) ( not ( = ?auto_87236 ?auto_87238 ) ) ( not ( = ?auto_87237 ?auto_87238 ) ) ( HOLDING ?auto_87239 ) ( CLEAR ?auto_87240 ) ( not ( = ?auto_87233 ?auto_87239 ) ) ( not ( = ?auto_87233 ?auto_87240 ) ) ( not ( = ?auto_87234 ?auto_87239 ) ) ( not ( = ?auto_87234 ?auto_87240 ) ) ( not ( = ?auto_87235 ?auto_87239 ) ) ( not ( = ?auto_87235 ?auto_87240 ) ) ( not ( = ?auto_87236 ?auto_87239 ) ) ( not ( = ?auto_87236 ?auto_87240 ) ) ( not ( = ?auto_87237 ?auto_87239 ) ) ( not ( = ?auto_87237 ?auto_87240 ) ) ( not ( = ?auto_87238 ?auto_87239 ) ) ( not ( = ?auto_87238 ?auto_87240 ) ) ( not ( = ?auto_87239 ?auto_87240 ) ) )
    :subtasks
    ( ( !STACK ?auto_87239 ?auto_87240 )
      ( MAKE-5PILE ?auto_87233 ?auto_87234 ?auto_87235 ?auto_87236 ?auto_87237 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87241 - BLOCK
      ?auto_87242 - BLOCK
      ?auto_87243 - BLOCK
      ?auto_87244 - BLOCK
      ?auto_87245 - BLOCK
    )
    :vars
    (
      ?auto_87246 - BLOCK
      ?auto_87247 - BLOCK
      ?auto_87248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87246 ?auto_87245 ) ( ON-TABLE ?auto_87241 ) ( ON ?auto_87242 ?auto_87241 ) ( ON ?auto_87243 ?auto_87242 ) ( ON ?auto_87244 ?auto_87243 ) ( ON ?auto_87245 ?auto_87244 ) ( not ( = ?auto_87241 ?auto_87242 ) ) ( not ( = ?auto_87241 ?auto_87243 ) ) ( not ( = ?auto_87241 ?auto_87244 ) ) ( not ( = ?auto_87241 ?auto_87245 ) ) ( not ( = ?auto_87241 ?auto_87246 ) ) ( not ( = ?auto_87242 ?auto_87243 ) ) ( not ( = ?auto_87242 ?auto_87244 ) ) ( not ( = ?auto_87242 ?auto_87245 ) ) ( not ( = ?auto_87242 ?auto_87246 ) ) ( not ( = ?auto_87243 ?auto_87244 ) ) ( not ( = ?auto_87243 ?auto_87245 ) ) ( not ( = ?auto_87243 ?auto_87246 ) ) ( not ( = ?auto_87244 ?auto_87245 ) ) ( not ( = ?auto_87244 ?auto_87246 ) ) ( not ( = ?auto_87245 ?auto_87246 ) ) ( CLEAR ?auto_87247 ) ( not ( = ?auto_87241 ?auto_87248 ) ) ( not ( = ?auto_87241 ?auto_87247 ) ) ( not ( = ?auto_87242 ?auto_87248 ) ) ( not ( = ?auto_87242 ?auto_87247 ) ) ( not ( = ?auto_87243 ?auto_87248 ) ) ( not ( = ?auto_87243 ?auto_87247 ) ) ( not ( = ?auto_87244 ?auto_87248 ) ) ( not ( = ?auto_87244 ?auto_87247 ) ) ( not ( = ?auto_87245 ?auto_87248 ) ) ( not ( = ?auto_87245 ?auto_87247 ) ) ( not ( = ?auto_87246 ?auto_87248 ) ) ( not ( = ?auto_87246 ?auto_87247 ) ) ( not ( = ?auto_87248 ?auto_87247 ) ) ( ON ?auto_87248 ?auto_87246 ) ( CLEAR ?auto_87248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87241 ?auto_87242 ?auto_87243 ?auto_87244 ?auto_87245 ?auto_87246 )
      ( MAKE-5PILE ?auto_87241 ?auto_87242 ?auto_87243 ?auto_87244 ?auto_87245 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87249 - BLOCK
      ?auto_87250 - BLOCK
      ?auto_87251 - BLOCK
      ?auto_87252 - BLOCK
      ?auto_87253 - BLOCK
    )
    :vars
    (
      ?auto_87254 - BLOCK
      ?auto_87255 - BLOCK
      ?auto_87256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87254 ?auto_87253 ) ( ON-TABLE ?auto_87249 ) ( ON ?auto_87250 ?auto_87249 ) ( ON ?auto_87251 ?auto_87250 ) ( ON ?auto_87252 ?auto_87251 ) ( ON ?auto_87253 ?auto_87252 ) ( not ( = ?auto_87249 ?auto_87250 ) ) ( not ( = ?auto_87249 ?auto_87251 ) ) ( not ( = ?auto_87249 ?auto_87252 ) ) ( not ( = ?auto_87249 ?auto_87253 ) ) ( not ( = ?auto_87249 ?auto_87254 ) ) ( not ( = ?auto_87250 ?auto_87251 ) ) ( not ( = ?auto_87250 ?auto_87252 ) ) ( not ( = ?auto_87250 ?auto_87253 ) ) ( not ( = ?auto_87250 ?auto_87254 ) ) ( not ( = ?auto_87251 ?auto_87252 ) ) ( not ( = ?auto_87251 ?auto_87253 ) ) ( not ( = ?auto_87251 ?auto_87254 ) ) ( not ( = ?auto_87252 ?auto_87253 ) ) ( not ( = ?auto_87252 ?auto_87254 ) ) ( not ( = ?auto_87253 ?auto_87254 ) ) ( not ( = ?auto_87249 ?auto_87255 ) ) ( not ( = ?auto_87249 ?auto_87256 ) ) ( not ( = ?auto_87250 ?auto_87255 ) ) ( not ( = ?auto_87250 ?auto_87256 ) ) ( not ( = ?auto_87251 ?auto_87255 ) ) ( not ( = ?auto_87251 ?auto_87256 ) ) ( not ( = ?auto_87252 ?auto_87255 ) ) ( not ( = ?auto_87252 ?auto_87256 ) ) ( not ( = ?auto_87253 ?auto_87255 ) ) ( not ( = ?auto_87253 ?auto_87256 ) ) ( not ( = ?auto_87254 ?auto_87255 ) ) ( not ( = ?auto_87254 ?auto_87256 ) ) ( not ( = ?auto_87255 ?auto_87256 ) ) ( ON ?auto_87255 ?auto_87254 ) ( CLEAR ?auto_87255 ) ( HOLDING ?auto_87256 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87256 )
      ( MAKE-5PILE ?auto_87249 ?auto_87250 ?auto_87251 ?auto_87252 ?auto_87253 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87257 - BLOCK
      ?auto_87258 - BLOCK
      ?auto_87259 - BLOCK
      ?auto_87260 - BLOCK
      ?auto_87261 - BLOCK
    )
    :vars
    (
      ?auto_87262 - BLOCK
      ?auto_87263 - BLOCK
      ?auto_87264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87262 ?auto_87261 ) ( ON-TABLE ?auto_87257 ) ( ON ?auto_87258 ?auto_87257 ) ( ON ?auto_87259 ?auto_87258 ) ( ON ?auto_87260 ?auto_87259 ) ( ON ?auto_87261 ?auto_87260 ) ( not ( = ?auto_87257 ?auto_87258 ) ) ( not ( = ?auto_87257 ?auto_87259 ) ) ( not ( = ?auto_87257 ?auto_87260 ) ) ( not ( = ?auto_87257 ?auto_87261 ) ) ( not ( = ?auto_87257 ?auto_87262 ) ) ( not ( = ?auto_87258 ?auto_87259 ) ) ( not ( = ?auto_87258 ?auto_87260 ) ) ( not ( = ?auto_87258 ?auto_87261 ) ) ( not ( = ?auto_87258 ?auto_87262 ) ) ( not ( = ?auto_87259 ?auto_87260 ) ) ( not ( = ?auto_87259 ?auto_87261 ) ) ( not ( = ?auto_87259 ?auto_87262 ) ) ( not ( = ?auto_87260 ?auto_87261 ) ) ( not ( = ?auto_87260 ?auto_87262 ) ) ( not ( = ?auto_87261 ?auto_87262 ) ) ( not ( = ?auto_87257 ?auto_87263 ) ) ( not ( = ?auto_87257 ?auto_87264 ) ) ( not ( = ?auto_87258 ?auto_87263 ) ) ( not ( = ?auto_87258 ?auto_87264 ) ) ( not ( = ?auto_87259 ?auto_87263 ) ) ( not ( = ?auto_87259 ?auto_87264 ) ) ( not ( = ?auto_87260 ?auto_87263 ) ) ( not ( = ?auto_87260 ?auto_87264 ) ) ( not ( = ?auto_87261 ?auto_87263 ) ) ( not ( = ?auto_87261 ?auto_87264 ) ) ( not ( = ?auto_87262 ?auto_87263 ) ) ( not ( = ?auto_87262 ?auto_87264 ) ) ( not ( = ?auto_87263 ?auto_87264 ) ) ( ON ?auto_87263 ?auto_87262 ) ( ON ?auto_87264 ?auto_87263 ) ( CLEAR ?auto_87264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87257 ?auto_87258 ?auto_87259 ?auto_87260 ?auto_87261 ?auto_87262 ?auto_87263 )
      ( MAKE-5PILE ?auto_87257 ?auto_87258 ?auto_87259 ?auto_87260 ?auto_87261 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87268 - BLOCK
      ?auto_87269 - BLOCK
      ?auto_87270 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_87270 ) ( CLEAR ?auto_87269 ) ( ON-TABLE ?auto_87268 ) ( ON ?auto_87269 ?auto_87268 ) ( not ( = ?auto_87268 ?auto_87269 ) ) ( not ( = ?auto_87268 ?auto_87270 ) ) ( not ( = ?auto_87269 ?auto_87270 ) ) )
    :subtasks
    ( ( !STACK ?auto_87270 ?auto_87269 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87271 - BLOCK
      ?auto_87272 - BLOCK
      ?auto_87273 - BLOCK
    )
    :vars
    (
      ?auto_87274 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_87272 ) ( ON-TABLE ?auto_87271 ) ( ON ?auto_87272 ?auto_87271 ) ( not ( = ?auto_87271 ?auto_87272 ) ) ( not ( = ?auto_87271 ?auto_87273 ) ) ( not ( = ?auto_87272 ?auto_87273 ) ) ( ON ?auto_87273 ?auto_87274 ) ( CLEAR ?auto_87273 ) ( HAND-EMPTY ) ( not ( = ?auto_87271 ?auto_87274 ) ) ( not ( = ?auto_87272 ?auto_87274 ) ) ( not ( = ?auto_87273 ?auto_87274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87273 ?auto_87274 )
      ( MAKE-3PILE ?auto_87271 ?auto_87272 ?auto_87273 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87275 - BLOCK
      ?auto_87276 - BLOCK
      ?auto_87277 - BLOCK
    )
    :vars
    (
      ?auto_87278 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87275 ) ( not ( = ?auto_87275 ?auto_87276 ) ) ( not ( = ?auto_87275 ?auto_87277 ) ) ( not ( = ?auto_87276 ?auto_87277 ) ) ( ON ?auto_87277 ?auto_87278 ) ( CLEAR ?auto_87277 ) ( not ( = ?auto_87275 ?auto_87278 ) ) ( not ( = ?auto_87276 ?auto_87278 ) ) ( not ( = ?auto_87277 ?auto_87278 ) ) ( HOLDING ?auto_87276 ) ( CLEAR ?auto_87275 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87275 ?auto_87276 )
      ( MAKE-3PILE ?auto_87275 ?auto_87276 ?auto_87277 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87279 - BLOCK
      ?auto_87280 - BLOCK
      ?auto_87281 - BLOCK
    )
    :vars
    (
      ?auto_87282 - BLOCK
      ?auto_87286 - BLOCK
      ?auto_87285 - BLOCK
      ?auto_87284 - BLOCK
      ?auto_87283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87279 ) ( not ( = ?auto_87279 ?auto_87280 ) ) ( not ( = ?auto_87279 ?auto_87281 ) ) ( not ( = ?auto_87280 ?auto_87281 ) ) ( ON ?auto_87281 ?auto_87282 ) ( not ( = ?auto_87279 ?auto_87282 ) ) ( not ( = ?auto_87280 ?auto_87282 ) ) ( not ( = ?auto_87281 ?auto_87282 ) ) ( CLEAR ?auto_87279 ) ( ON ?auto_87280 ?auto_87281 ) ( CLEAR ?auto_87280 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87286 ) ( ON ?auto_87285 ?auto_87286 ) ( ON ?auto_87284 ?auto_87285 ) ( ON ?auto_87283 ?auto_87284 ) ( ON ?auto_87282 ?auto_87283 ) ( not ( = ?auto_87286 ?auto_87285 ) ) ( not ( = ?auto_87286 ?auto_87284 ) ) ( not ( = ?auto_87286 ?auto_87283 ) ) ( not ( = ?auto_87286 ?auto_87282 ) ) ( not ( = ?auto_87286 ?auto_87281 ) ) ( not ( = ?auto_87286 ?auto_87280 ) ) ( not ( = ?auto_87285 ?auto_87284 ) ) ( not ( = ?auto_87285 ?auto_87283 ) ) ( not ( = ?auto_87285 ?auto_87282 ) ) ( not ( = ?auto_87285 ?auto_87281 ) ) ( not ( = ?auto_87285 ?auto_87280 ) ) ( not ( = ?auto_87284 ?auto_87283 ) ) ( not ( = ?auto_87284 ?auto_87282 ) ) ( not ( = ?auto_87284 ?auto_87281 ) ) ( not ( = ?auto_87284 ?auto_87280 ) ) ( not ( = ?auto_87283 ?auto_87282 ) ) ( not ( = ?auto_87283 ?auto_87281 ) ) ( not ( = ?auto_87283 ?auto_87280 ) ) ( not ( = ?auto_87279 ?auto_87286 ) ) ( not ( = ?auto_87279 ?auto_87285 ) ) ( not ( = ?auto_87279 ?auto_87284 ) ) ( not ( = ?auto_87279 ?auto_87283 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87286 ?auto_87285 ?auto_87284 ?auto_87283 ?auto_87282 ?auto_87281 )
      ( MAKE-3PILE ?auto_87279 ?auto_87280 ?auto_87281 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87287 - BLOCK
      ?auto_87288 - BLOCK
      ?auto_87289 - BLOCK
    )
    :vars
    (
      ?auto_87291 - BLOCK
      ?auto_87294 - BLOCK
      ?auto_87290 - BLOCK
      ?auto_87292 - BLOCK
      ?auto_87293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87287 ?auto_87288 ) ) ( not ( = ?auto_87287 ?auto_87289 ) ) ( not ( = ?auto_87288 ?auto_87289 ) ) ( ON ?auto_87289 ?auto_87291 ) ( not ( = ?auto_87287 ?auto_87291 ) ) ( not ( = ?auto_87288 ?auto_87291 ) ) ( not ( = ?auto_87289 ?auto_87291 ) ) ( ON ?auto_87288 ?auto_87289 ) ( CLEAR ?auto_87288 ) ( ON-TABLE ?auto_87294 ) ( ON ?auto_87290 ?auto_87294 ) ( ON ?auto_87292 ?auto_87290 ) ( ON ?auto_87293 ?auto_87292 ) ( ON ?auto_87291 ?auto_87293 ) ( not ( = ?auto_87294 ?auto_87290 ) ) ( not ( = ?auto_87294 ?auto_87292 ) ) ( not ( = ?auto_87294 ?auto_87293 ) ) ( not ( = ?auto_87294 ?auto_87291 ) ) ( not ( = ?auto_87294 ?auto_87289 ) ) ( not ( = ?auto_87294 ?auto_87288 ) ) ( not ( = ?auto_87290 ?auto_87292 ) ) ( not ( = ?auto_87290 ?auto_87293 ) ) ( not ( = ?auto_87290 ?auto_87291 ) ) ( not ( = ?auto_87290 ?auto_87289 ) ) ( not ( = ?auto_87290 ?auto_87288 ) ) ( not ( = ?auto_87292 ?auto_87293 ) ) ( not ( = ?auto_87292 ?auto_87291 ) ) ( not ( = ?auto_87292 ?auto_87289 ) ) ( not ( = ?auto_87292 ?auto_87288 ) ) ( not ( = ?auto_87293 ?auto_87291 ) ) ( not ( = ?auto_87293 ?auto_87289 ) ) ( not ( = ?auto_87293 ?auto_87288 ) ) ( not ( = ?auto_87287 ?auto_87294 ) ) ( not ( = ?auto_87287 ?auto_87290 ) ) ( not ( = ?auto_87287 ?auto_87292 ) ) ( not ( = ?auto_87287 ?auto_87293 ) ) ( HOLDING ?auto_87287 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87287 )
      ( MAKE-3PILE ?auto_87287 ?auto_87288 ?auto_87289 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87295 - BLOCK
      ?auto_87296 - BLOCK
      ?auto_87297 - BLOCK
    )
    :vars
    (
      ?auto_87298 - BLOCK
      ?auto_87300 - BLOCK
      ?auto_87302 - BLOCK
      ?auto_87301 - BLOCK
      ?auto_87299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87295 ?auto_87296 ) ) ( not ( = ?auto_87295 ?auto_87297 ) ) ( not ( = ?auto_87296 ?auto_87297 ) ) ( ON ?auto_87297 ?auto_87298 ) ( not ( = ?auto_87295 ?auto_87298 ) ) ( not ( = ?auto_87296 ?auto_87298 ) ) ( not ( = ?auto_87297 ?auto_87298 ) ) ( ON ?auto_87296 ?auto_87297 ) ( ON-TABLE ?auto_87300 ) ( ON ?auto_87302 ?auto_87300 ) ( ON ?auto_87301 ?auto_87302 ) ( ON ?auto_87299 ?auto_87301 ) ( ON ?auto_87298 ?auto_87299 ) ( not ( = ?auto_87300 ?auto_87302 ) ) ( not ( = ?auto_87300 ?auto_87301 ) ) ( not ( = ?auto_87300 ?auto_87299 ) ) ( not ( = ?auto_87300 ?auto_87298 ) ) ( not ( = ?auto_87300 ?auto_87297 ) ) ( not ( = ?auto_87300 ?auto_87296 ) ) ( not ( = ?auto_87302 ?auto_87301 ) ) ( not ( = ?auto_87302 ?auto_87299 ) ) ( not ( = ?auto_87302 ?auto_87298 ) ) ( not ( = ?auto_87302 ?auto_87297 ) ) ( not ( = ?auto_87302 ?auto_87296 ) ) ( not ( = ?auto_87301 ?auto_87299 ) ) ( not ( = ?auto_87301 ?auto_87298 ) ) ( not ( = ?auto_87301 ?auto_87297 ) ) ( not ( = ?auto_87301 ?auto_87296 ) ) ( not ( = ?auto_87299 ?auto_87298 ) ) ( not ( = ?auto_87299 ?auto_87297 ) ) ( not ( = ?auto_87299 ?auto_87296 ) ) ( not ( = ?auto_87295 ?auto_87300 ) ) ( not ( = ?auto_87295 ?auto_87302 ) ) ( not ( = ?auto_87295 ?auto_87301 ) ) ( not ( = ?auto_87295 ?auto_87299 ) ) ( ON ?auto_87295 ?auto_87296 ) ( CLEAR ?auto_87295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87300 ?auto_87302 ?auto_87301 ?auto_87299 ?auto_87298 ?auto_87297 ?auto_87296 )
      ( MAKE-3PILE ?auto_87295 ?auto_87296 ?auto_87297 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87307 - BLOCK
      ?auto_87308 - BLOCK
      ?auto_87309 - BLOCK
      ?auto_87310 - BLOCK
    )
    :vars
    (
      ?auto_87311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87311 ?auto_87310 ) ( CLEAR ?auto_87311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87307 ) ( ON ?auto_87308 ?auto_87307 ) ( ON ?auto_87309 ?auto_87308 ) ( ON ?auto_87310 ?auto_87309 ) ( not ( = ?auto_87307 ?auto_87308 ) ) ( not ( = ?auto_87307 ?auto_87309 ) ) ( not ( = ?auto_87307 ?auto_87310 ) ) ( not ( = ?auto_87307 ?auto_87311 ) ) ( not ( = ?auto_87308 ?auto_87309 ) ) ( not ( = ?auto_87308 ?auto_87310 ) ) ( not ( = ?auto_87308 ?auto_87311 ) ) ( not ( = ?auto_87309 ?auto_87310 ) ) ( not ( = ?auto_87309 ?auto_87311 ) ) ( not ( = ?auto_87310 ?auto_87311 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87311 ?auto_87310 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87312 - BLOCK
      ?auto_87313 - BLOCK
      ?auto_87314 - BLOCK
      ?auto_87315 - BLOCK
    )
    :vars
    (
      ?auto_87316 - BLOCK
      ?auto_87317 - BLOCK
      ?auto_87318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87316 ?auto_87315 ) ( CLEAR ?auto_87316 ) ( ON-TABLE ?auto_87312 ) ( ON ?auto_87313 ?auto_87312 ) ( ON ?auto_87314 ?auto_87313 ) ( ON ?auto_87315 ?auto_87314 ) ( not ( = ?auto_87312 ?auto_87313 ) ) ( not ( = ?auto_87312 ?auto_87314 ) ) ( not ( = ?auto_87312 ?auto_87315 ) ) ( not ( = ?auto_87312 ?auto_87316 ) ) ( not ( = ?auto_87313 ?auto_87314 ) ) ( not ( = ?auto_87313 ?auto_87315 ) ) ( not ( = ?auto_87313 ?auto_87316 ) ) ( not ( = ?auto_87314 ?auto_87315 ) ) ( not ( = ?auto_87314 ?auto_87316 ) ) ( not ( = ?auto_87315 ?auto_87316 ) ) ( HOLDING ?auto_87317 ) ( CLEAR ?auto_87318 ) ( not ( = ?auto_87312 ?auto_87317 ) ) ( not ( = ?auto_87312 ?auto_87318 ) ) ( not ( = ?auto_87313 ?auto_87317 ) ) ( not ( = ?auto_87313 ?auto_87318 ) ) ( not ( = ?auto_87314 ?auto_87317 ) ) ( not ( = ?auto_87314 ?auto_87318 ) ) ( not ( = ?auto_87315 ?auto_87317 ) ) ( not ( = ?auto_87315 ?auto_87318 ) ) ( not ( = ?auto_87316 ?auto_87317 ) ) ( not ( = ?auto_87316 ?auto_87318 ) ) ( not ( = ?auto_87317 ?auto_87318 ) ) )
    :subtasks
    ( ( !STACK ?auto_87317 ?auto_87318 )
      ( MAKE-4PILE ?auto_87312 ?auto_87313 ?auto_87314 ?auto_87315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87319 - BLOCK
      ?auto_87320 - BLOCK
      ?auto_87321 - BLOCK
      ?auto_87322 - BLOCK
    )
    :vars
    (
      ?auto_87325 - BLOCK
      ?auto_87324 - BLOCK
      ?auto_87323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87325 ?auto_87322 ) ( ON-TABLE ?auto_87319 ) ( ON ?auto_87320 ?auto_87319 ) ( ON ?auto_87321 ?auto_87320 ) ( ON ?auto_87322 ?auto_87321 ) ( not ( = ?auto_87319 ?auto_87320 ) ) ( not ( = ?auto_87319 ?auto_87321 ) ) ( not ( = ?auto_87319 ?auto_87322 ) ) ( not ( = ?auto_87319 ?auto_87325 ) ) ( not ( = ?auto_87320 ?auto_87321 ) ) ( not ( = ?auto_87320 ?auto_87322 ) ) ( not ( = ?auto_87320 ?auto_87325 ) ) ( not ( = ?auto_87321 ?auto_87322 ) ) ( not ( = ?auto_87321 ?auto_87325 ) ) ( not ( = ?auto_87322 ?auto_87325 ) ) ( CLEAR ?auto_87324 ) ( not ( = ?auto_87319 ?auto_87323 ) ) ( not ( = ?auto_87319 ?auto_87324 ) ) ( not ( = ?auto_87320 ?auto_87323 ) ) ( not ( = ?auto_87320 ?auto_87324 ) ) ( not ( = ?auto_87321 ?auto_87323 ) ) ( not ( = ?auto_87321 ?auto_87324 ) ) ( not ( = ?auto_87322 ?auto_87323 ) ) ( not ( = ?auto_87322 ?auto_87324 ) ) ( not ( = ?auto_87325 ?auto_87323 ) ) ( not ( = ?auto_87325 ?auto_87324 ) ) ( not ( = ?auto_87323 ?auto_87324 ) ) ( ON ?auto_87323 ?auto_87325 ) ( CLEAR ?auto_87323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87319 ?auto_87320 ?auto_87321 ?auto_87322 ?auto_87325 )
      ( MAKE-4PILE ?auto_87319 ?auto_87320 ?auto_87321 ?auto_87322 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87326 - BLOCK
      ?auto_87327 - BLOCK
      ?auto_87328 - BLOCK
      ?auto_87329 - BLOCK
    )
    :vars
    (
      ?auto_87330 - BLOCK
      ?auto_87332 - BLOCK
      ?auto_87331 - BLOCK
      ?auto_87333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87330 ?auto_87329 ) ( ON-TABLE ?auto_87326 ) ( ON ?auto_87327 ?auto_87326 ) ( ON ?auto_87328 ?auto_87327 ) ( ON ?auto_87329 ?auto_87328 ) ( not ( = ?auto_87326 ?auto_87327 ) ) ( not ( = ?auto_87326 ?auto_87328 ) ) ( not ( = ?auto_87326 ?auto_87329 ) ) ( not ( = ?auto_87326 ?auto_87330 ) ) ( not ( = ?auto_87327 ?auto_87328 ) ) ( not ( = ?auto_87327 ?auto_87329 ) ) ( not ( = ?auto_87327 ?auto_87330 ) ) ( not ( = ?auto_87328 ?auto_87329 ) ) ( not ( = ?auto_87328 ?auto_87330 ) ) ( not ( = ?auto_87329 ?auto_87330 ) ) ( not ( = ?auto_87326 ?auto_87332 ) ) ( not ( = ?auto_87326 ?auto_87331 ) ) ( not ( = ?auto_87327 ?auto_87332 ) ) ( not ( = ?auto_87327 ?auto_87331 ) ) ( not ( = ?auto_87328 ?auto_87332 ) ) ( not ( = ?auto_87328 ?auto_87331 ) ) ( not ( = ?auto_87329 ?auto_87332 ) ) ( not ( = ?auto_87329 ?auto_87331 ) ) ( not ( = ?auto_87330 ?auto_87332 ) ) ( not ( = ?auto_87330 ?auto_87331 ) ) ( not ( = ?auto_87332 ?auto_87331 ) ) ( ON ?auto_87332 ?auto_87330 ) ( CLEAR ?auto_87332 ) ( HOLDING ?auto_87331 ) ( CLEAR ?auto_87333 ) ( ON-TABLE ?auto_87333 ) ( not ( = ?auto_87333 ?auto_87331 ) ) ( not ( = ?auto_87326 ?auto_87333 ) ) ( not ( = ?auto_87327 ?auto_87333 ) ) ( not ( = ?auto_87328 ?auto_87333 ) ) ( not ( = ?auto_87329 ?auto_87333 ) ) ( not ( = ?auto_87330 ?auto_87333 ) ) ( not ( = ?auto_87332 ?auto_87333 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87333 ?auto_87331 )
      ( MAKE-4PILE ?auto_87326 ?auto_87327 ?auto_87328 ?auto_87329 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87334 - BLOCK
      ?auto_87335 - BLOCK
      ?auto_87336 - BLOCK
      ?auto_87337 - BLOCK
    )
    :vars
    (
      ?auto_87338 - BLOCK
      ?auto_87341 - BLOCK
      ?auto_87340 - BLOCK
      ?auto_87339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87338 ?auto_87337 ) ( ON-TABLE ?auto_87334 ) ( ON ?auto_87335 ?auto_87334 ) ( ON ?auto_87336 ?auto_87335 ) ( ON ?auto_87337 ?auto_87336 ) ( not ( = ?auto_87334 ?auto_87335 ) ) ( not ( = ?auto_87334 ?auto_87336 ) ) ( not ( = ?auto_87334 ?auto_87337 ) ) ( not ( = ?auto_87334 ?auto_87338 ) ) ( not ( = ?auto_87335 ?auto_87336 ) ) ( not ( = ?auto_87335 ?auto_87337 ) ) ( not ( = ?auto_87335 ?auto_87338 ) ) ( not ( = ?auto_87336 ?auto_87337 ) ) ( not ( = ?auto_87336 ?auto_87338 ) ) ( not ( = ?auto_87337 ?auto_87338 ) ) ( not ( = ?auto_87334 ?auto_87341 ) ) ( not ( = ?auto_87334 ?auto_87340 ) ) ( not ( = ?auto_87335 ?auto_87341 ) ) ( not ( = ?auto_87335 ?auto_87340 ) ) ( not ( = ?auto_87336 ?auto_87341 ) ) ( not ( = ?auto_87336 ?auto_87340 ) ) ( not ( = ?auto_87337 ?auto_87341 ) ) ( not ( = ?auto_87337 ?auto_87340 ) ) ( not ( = ?auto_87338 ?auto_87341 ) ) ( not ( = ?auto_87338 ?auto_87340 ) ) ( not ( = ?auto_87341 ?auto_87340 ) ) ( ON ?auto_87341 ?auto_87338 ) ( CLEAR ?auto_87339 ) ( ON-TABLE ?auto_87339 ) ( not ( = ?auto_87339 ?auto_87340 ) ) ( not ( = ?auto_87334 ?auto_87339 ) ) ( not ( = ?auto_87335 ?auto_87339 ) ) ( not ( = ?auto_87336 ?auto_87339 ) ) ( not ( = ?auto_87337 ?auto_87339 ) ) ( not ( = ?auto_87338 ?auto_87339 ) ) ( not ( = ?auto_87341 ?auto_87339 ) ) ( ON ?auto_87340 ?auto_87341 ) ( CLEAR ?auto_87340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87334 ?auto_87335 ?auto_87336 ?auto_87337 ?auto_87338 ?auto_87341 )
      ( MAKE-4PILE ?auto_87334 ?auto_87335 ?auto_87336 ?auto_87337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87342 - BLOCK
      ?auto_87343 - BLOCK
      ?auto_87344 - BLOCK
      ?auto_87345 - BLOCK
    )
    :vars
    (
      ?auto_87348 - BLOCK
      ?auto_87346 - BLOCK
      ?auto_87349 - BLOCK
      ?auto_87347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87348 ?auto_87345 ) ( ON-TABLE ?auto_87342 ) ( ON ?auto_87343 ?auto_87342 ) ( ON ?auto_87344 ?auto_87343 ) ( ON ?auto_87345 ?auto_87344 ) ( not ( = ?auto_87342 ?auto_87343 ) ) ( not ( = ?auto_87342 ?auto_87344 ) ) ( not ( = ?auto_87342 ?auto_87345 ) ) ( not ( = ?auto_87342 ?auto_87348 ) ) ( not ( = ?auto_87343 ?auto_87344 ) ) ( not ( = ?auto_87343 ?auto_87345 ) ) ( not ( = ?auto_87343 ?auto_87348 ) ) ( not ( = ?auto_87344 ?auto_87345 ) ) ( not ( = ?auto_87344 ?auto_87348 ) ) ( not ( = ?auto_87345 ?auto_87348 ) ) ( not ( = ?auto_87342 ?auto_87346 ) ) ( not ( = ?auto_87342 ?auto_87349 ) ) ( not ( = ?auto_87343 ?auto_87346 ) ) ( not ( = ?auto_87343 ?auto_87349 ) ) ( not ( = ?auto_87344 ?auto_87346 ) ) ( not ( = ?auto_87344 ?auto_87349 ) ) ( not ( = ?auto_87345 ?auto_87346 ) ) ( not ( = ?auto_87345 ?auto_87349 ) ) ( not ( = ?auto_87348 ?auto_87346 ) ) ( not ( = ?auto_87348 ?auto_87349 ) ) ( not ( = ?auto_87346 ?auto_87349 ) ) ( ON ?auto_87346 ?auto_87348 ) ( not ( = ?auto_87347 ?auto_87349 ) ) ( not ( = ?auto_87342 ?auto_87347 ) ) ( not ( = ?auto_87343 ?auto_87347 ) ) ( not ( = ?auto_87344 ?auto_87347 ) ) ( not ( = ?auto_87345 ?auto_87347 ) ) ( not ( = ?auto_87348 ?auto_87347 ) ) ( not ( = ?auto_87346 ?auto_87347 ) ) ( ON ?auto_87349 ?auto_87346 ) ( CLEAR ?auto_87349 ) ( HOLDING ?auto_87347 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87347 )
      ( MAKE-4PILE ?auto_87342 ?auto_87343 ?auto_87344 ?auto_87345 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87350 - BLOCK
      ?auto_87351 - BLOCK
      ?auto_87352 - BLOCK
      ?auto_87353 - BLOCK
    )
    :vars
    (
      ?auto_87357 - BLOCK
      ?auto_87356 - BLOCK
      ?auto_87355 - BLOCK
      ?auto_87354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87357 ?auto_87353 ) ( ON-TABLE ?auto_87350 ) ( ON ?auto_87351 ?auto_87350 ) ( ON ?auto_87352 ?auto_87351 ) ( ON ?auto_87353 ?auto_87352 ) ( not ( = ?auto_87350 ?auto_87351 ) ) ( not ( = ?auto_87350 ?auto_87352 ) ) ( not ( = ?auto_87350 ?auto_87353 ) ) ( not ( = ?auto_87350 ?auto_87357 ) ) ( not ( = ?auto_87351 ?auto_87352 ) ) ( not ( = ?auto_87351 ?auto_87353 ) ) ( not ( = ?auto_87351 ?auto_87357 ) ) ( not ( = ?auto_87352 ?auto_87353 ) ) ( not ( = ?auto_87352 ?auto_87357 ) ) ( not ( = ?auto_87353 ?auto_87357 ) ) ( not ( = ?auto_87350 ?auto_87356 ) ) ( not ( = ?auto_87350 ?auto_87355 ) ) ( not ( = ?auto_87351 ?auto_87356 ) ) ( not ( = ?auto_87351 ?auto_87355 ) ) ( not ( = ?auto_87352 ?auto_87356 ) ) ( not ( = ?auto_87352 ?auto_87355 ) ) ( not ( = ?auto_87353 ?auto_87356 ) ) ( not ( = ?auto_87353 ?auto_87355 ) ) ( not ( = ?auto_87357 ?auto_87356 ) ) ( not ( = ?auto_87357 ?auto_87355 ) ) ( not ( = ?auto_87356 ?auto_87355 ) ) ( ON ?auto_87356 ?auto_87357 ) ( not ( = ?auto_87354 ?auto_87355 ) ) ( not ( = ?auto_87350 ?auto_87354 ) ) ( not ( = ?auto_87351 ?auto_87354 ) ) ( not ( = ?auto_87352 ?auto_87354 ) ) ( not ( = ?auto_87353 ?auto_87354 ) ) ( not ( = ?auto_87357 ?auto_87354 ) ) ( not ( = ?auto_87356 ?auto_87354 ) ) ( ON ?auto_87355 ?auto_87356 ) ( ON ?auto_87354 ?auto_87355 ) ( CLEAR ?auto_87354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87350 ?auto_87351 ?auto_87352 ?auto_87353 ?auto_87357 ?auto_87356 ?auto_87355 )
      ( MAKE-4PILE ?auto_87350 ?auto_87351 ?auto_87352 ?auto_87353 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87362 - BLOCK
      ?auto_87363 - BLOCK
      ?auto_87364 - BLOCK
      ?auto_87365 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_87365 ) ( CLEAR ?auto_87364 ) ( ON-TABLE ?auto_87362 ) ( ON ?auto_87363 ?auto_87362 ) ( ON ?auto_87364 ?auto_87363 ) ( not ( = ?auto_87362 ?auto_87363 ) ) ( not ( = ?auto_87362 ?auto_87364 ) ) ( not ( = ?auto_87362 ?auto_87365 ) ) ( not ( = ?auto_87363 ?auto_87364 ) ) ( not ( = ?auto_87363 ?auto_87365 ) ) ( not ( = ?auto_87364 ?auto_87365 ) ) )
    :subtasks
    ( ( !STACK ?auto_87365 ?auto_87364 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87366 - BLOCK
      ?auto_87367 - BLOCK
      ?auto_87368 - BLOCK
      ?auto_87369 - BLOCK
    )
    :vars
    (
      ?auto_87370 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_87368 ) ( ON-TABLE ?auto_87366 ) ( ON ?auto_87367 ?auto_87366 ) ( ON ?auto_87368 ?auto_87367 ) ( not ( = ?auto_87366 ?auto_87367 ) ) ( not ( = ?auto_87366 ?auto_87368 ) ) ( not ( = ?auto_87366 ?auto_87369 ) ) ( not ( = ?auto_87367 ?auto_87368 ) ) ( not ( = ?auto_87367 ?auto_87369 ) ) ( not ( = ?auto_87368 ?auto_87369 ) ) ( ON ?auto_87369 ?auto_87370 ) ( CLEAR ?auto_87369 ) ( HAND-EMPTY ) ( not ( = ?auto_87366 ?auto_87370 ) ) ( not ( = ?auto_87367 ?auto_87370 ) ) ( not ( = ?auto_87368 ?auto_87370 ) ) ( not ( = ?auto_87369 ?auto_87370 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87369 ?auto_87370 )
      ( MAKE-4PILE ?auto_87366 ?auto_87367 ?auto_87368 ?auto_87369 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87371 - BLOCK
      ?auto_87372 - BLOCK
      ?auto_87373 - BLOCK
      ?auto_87374 - BLOCK
    )
    :vars
    (
      ?auto_87375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87371 ) ( ON ?auto_87372 ?auto_87371 ) ( not ( = ?auto_87371 ?auto_87372 ) ) ( not ( = ?auto_87371 ?auto_87373 ) ) ( not ( = ?auto_87371 ?auto_87374 ) ) ( not ( = ?auto_87372 ?auto_87373 ) ) ( not ( = ?auto_87372 ?auto_87374 ) ) ( not ( = ?auto_87373 ?auto_87374 ) ) ( ON ?auto_87374 ?auto_87375 ) ( CLEAR ?auto_87374 ) ( not ( = ?auto_87371 ?auto_87375 ) ) ( not ( = ?auto_87372 ?auto_87375 ) ) ( not ( = ?auto_87373 ?auto_87375 ) ) ( not ( = ?auto_87374 ?auto_87375 ) ) ( HOLDING ?auto_87373 ) ( CLEAR ?auto_87372 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87371 ?auto_87372 ?auto_87373 )
      ( MAKE-4PILE ?auto_87371 ?auto_87372 ?auto_87373 ?auto_87374 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87376 - BLOCK
      ?auto_87377 - BLOCK
      ?auto_87378 - BLOCK
      ?auto_87379 - BLOCK
    )
    :vars
    (
      ?auto_87380 - BLOCK
      ?auto_87382 - BLOCK
      ?auto_87383 - BLOCK
      ?auto_87381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87376 ) ( ON ?auto_87377 ?auto_87376 ) ( not ( = ?auto_87376 ?auto_87377 ) ) ( not ( = ?auto_87376 ?auto_87378 ) ) ( not ( = ?auto_87376 ?auto_87379 ) ) ( not ( = ?auto_87377 ?auto_87378 ) ) ( not ( = ?auto_87377 ?auto_87379 ) ) ( not ( = ?auto_87378 ?auto_87379 ) ) ( ON ?auto_87379 ?auto_87380 ) ( not ( = ?auto_87376 ?auto_87380 ) ) ( not ( = ?auto_87377 ?auto_87380 ) ) ( not ( = ?auto_87378 ?auto_87380 ) ) ( not ( = ?auto_87379 ?auto_87380 ) ) ( CLEAR ?auto_87377 ) ( ON ?auto_87378 ?auto_87379 ) ( CLEAR ?auto_87378 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87382 ) ( ON ?auto_87383 ?auto_87382 ) ( ON ?auto_87381 ?auto_87383 ) ( ON ?auto_87380 ?auto_87381 ) ( not ( = ?auto_87382 ?auto_87383 ) ) ( not ( = ?auto_87382 ?auto_87381 ) ) ( not ( = ?auto_87382 ?auto_87380 ) ) ( not ( = ?auto_87382 ?auto_87379 ) ) ( not ( = ?auto_87382 ?auto_87378 ) ) ( not ( = ?auto_87383 ?auto_87381 ) ) ( not ( = ?auto_87383 ?auto_87380 ) ) ( not ( = ?auto_87383 ?auto_87379 ) ) ( not ( = ?auto_87383 ?auto_87378 ) ) ( not ( = ?auto_87381 ?auto_87380 ) ) ( not ( = ?auto_87381 ?auto_87379 ) ) ( not ( = ?auto_87381 ?auto_87378 ) ) ( not ( = ?auto_87376 ?auto_87382 ) ) ( not ( = ?auto_87376 ?auto_87383 ) ) ( not ( = ?auto_87376 ?auto_87381 ) ) ( not ( = ?auto_87377 ?auto_87382 ) ) ( not ( = ?auto_87377 ?auto_87383 ) ) ( not ( = ?auto_87377 ?auto_87381 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87382 ?auto_87383 ?auto_87381 ?auto_87380 ?auto_87379 )
      ( MAKE-4PILE ?auto_87376 ?auto_87377 ?auto_87378 ?auto_87379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87384 - BLOCK
      ?auto_87385 - BLOCK
      ?auto_87386 - BLOCK
      ?auto_87387 - BLOCK
    )
    :vars
    (
      ?auto_87391 - BLOCK
      ?auto_87390 - BLOCK
      ?auto_87388 - BLOCK
      ?auto_87389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87384 ) ( not ( = ?auto_87384 ?auto_87385 ) ) ( not ( = ?auto_87384 ?auto_87386 ) ) ( not ( = ?auto_87384 ?auto_87387 ) ) ( not ( = ?auto_87385 ?auto_87386 ) ) ( not ( = ?auto_87385 ?auto_87387 ) ) ( not ( = ?auto_87386 ?auto_87387 ) ) ( ON ?auto_87387 ?auto_87391 ) ( not ( = ?auto_87384 ?auto_87391 ) ) ( not ( = ?auto_87385 ?auto_87391 ) ) ( not ( = ?auto_87386 ?auto_87391 ) ) ( not ( = ?auto_87387 ?auto_87391 ) ) ( ON ?auto_87386 ?auto_87387 ) ( CLEAR ?auto_87386 ) ( ON-TABLE ?auto_87390 ) ( ON ?auto_87388 ?auto_87390 ) ( ON ?auto_87389 ?auto_87388 ) ( ON ?auto_87391 ?auto_87389 ) ( not ( = ?auto_87390 ?auto_87388 ) ) ( not ( = ?auto_87390 ?auto_87389 ) ) ( not ( = ?auto_87390 ?auto_87391 ) ) ( not ( = ?auto_87390 ?auto_87387 ) ) ( not ( = ?auto_87390 ?auto_87386 ) ) ( not ( = ?auto_87388 ?auto_87389 ) ) ( not ( = ?auto_87388 ?auto_87391 ) ) ( not ( = ?auto_87388 ?auto_87387 ) ) ( not ( = ?auto_87388 ?auto_87386 ) ) ( not ( = ?auto_87389 ?auto_87391 ) ) ( not ( = ?auto_87389 ?auto_87387 ) ) ( not ( = ?auto_87389 ?auto_87386 ) ) ( not ( = ?auto_87384 ?auto_87390 ) ) ( not ( = ?auto_87384 ?auto_87388 ) ) ( not ( = ?auto_87384 ?auto_87389 ) ) ( not ( = ?auto_87385 ?auto_87390 ) ) ( not ( = ?auto_87385 ?auto_87388 ) ) ( not ( = ?auto_87385 ?auto_87389 ) ) ( HOLDING ?auto_87385 ) ( CLEAR ?auto_87384 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87384 ?auto_87385 )
      ( MAKE-4PILE ?auto_87384 ?auto_87385 ?auto_87386 ?auto_87387 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87392 - BLOCK
      ?auto_87393 - BLOCK
      ?auto_87394 - BLOCK
      ?auto_87395 - BLOCK
    )
    :vars
    (
      ?auto_87398 - BLOCK
      ?auto_87399 - BLOCK
      ?auto_87396 - BLOCK
      ?auto_87397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87392 ) ( not ( = ?auto_87392 ?auto_87393 ) ) ( not ( = ?auto_87392 ?auto_87394 ) ) ( not ( = ?auto_87392 ?auto_87395 ) ) ( not ( = ?auto_87393 ?auto_87394 ) ) ( not ( = ?auto_87393 ?auto_87395 ) ) ( not ( = ?auto_87394 ?auto_87395 ) ) ( ON ?auto_87395 ?auto_87398 ) ( not ( = ?auto_87392 ?auto_87398 ) ) ( not ( = ?auto_87393 ?auto_87398 ) ) ( not ( = ?auto_87394 ?auto_87398 ) ) ( not ( = ?auto_87395 ?auto_87398 ) ) ( ON ?auto_87394 ?auto_87395 ) ( ON-TABLE ?auto_87399 ) ( ON ?auto_87396 ?auto_87399 ) ( ON ?auto_87397 ?auto_87396 ) ( ON ?auto_87398 ?auto_87397 ) ( not ( = ?auto_87399 ?auto_87396 ) ) ( not ( = ?auto_87399 ?auto_87397 ) ) ( not ( = ?auto_87399 ?auto_87398 ) ) ( not ( = ?auto_87399 ?auto_87395 ) ) ( not ( = ?auto_87399 ?auto_87394 ) ) ( not ( = ?auto_87396 ?auto_87397 ) ) ( not ( = ?auto_87396 ?auto_87398 ) ) ( not ( = ?auto_87396 ?auto_87395 ) ) ( not ( = ?auto_87396 ?auto_87394 ) ) ( not ( = ?auto_87397 ?auto_87398 ) ) ( not ( = ?auto_87397 ?auto_87395 ) ) ( not ( = ?auto_87397 ?auto_87394 ) ) ( not ( = ?auto_87392 ?auto_87399 ) ) ( not ( = ?auto_87392 ?auto_87396 ) ) ( not ( = ?auto_87392 ?auto_87397 ) ) ( not ( = ?auto_87393 ?auto_87399 ) ) ( not ( = ?auto_87393 ?auto_87396 ) ) ( not ( = ?auto_87393 ?auto_87397 ) ) ( CLEAR ?auto_87392 ) ( ON ?auto_87393 ?auto_87394 ) ( CLEAR ?auto_87393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87399 ?auto_87396 ?auto_87397 ?auto_87398 ?auto_87395 ?auto_87394 )
      ( MAKE-4PILE ?auto_87392 ?auto_87393 ?auto_87394 ?auto_87395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87400 - BLOCK
      ?auto_87401 - BLOCK
      ?auto_87402 - BLOCK
      ?auto_87403 - BLOCK
    )
    :vars
    (
      ?auto_87406 - BLOCK
      ?auto_87407 - BLOCK
      ?auto_87405 - BLOCK
      ?auto_87404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87400 ?auto_87401 ) ) ( not ( = ?auto_87400 ?auto_87402 ) ) ( not ( = ?auto_87400 ?auto_87403 ) ) ( not ( = ?auto_87401 ?auto_87402 ) ) ( not ( = ?auto_87401 ?auto_87403 ) ) ( not ( = ?auto_87402 ?auto_87403 ) ) ( ON ?auto_87403 ?auto_87406 ) ( not ( = ?auto_87400 ?auto_87406 ) ) ( not ( = ?auto_87401 ?auto_87406 ) ) ( not ( = ?auto_87402 ?auto_87406 ) ) ( not ( = ?auto_87403 ?auto_87406 ) ) ( ON ?auto_87402 ?auto_87403 ) ( ON-TABLE ?auto_87407 ) ( ON ?auto_87405 ?auto_87407 ) ( ON ?auto_87404 ?auto_87405 ) ( ON ?auto_87406 ?auto_87404 ) ( not ( = ?auto_87407 ?auto_87405 ) ) ( not ( = ?auto_87407 ?auto_87404 ) ) ( not ( = ?auto_87407 ?auto_87406 ) ) ( not ( = ?auto_87407 ?auto_87403 ) ) ( not ( = ?auto_87407 ?auto_87402 ) ) ( not ( = ?auto_87405 ?auto_87404 ) ) ( not ( = ?auto_87405 ?auto_87406 ) ) ( not ( = ?auto_87405 ?auto_87403 ) ) ( not ( = ?auto_87405 ?auto_87402 ) ) ( not ( = ?auto_87404 ?auto_87406 ) ) ( not ( = ?auto_87404 ?auto_87403 ) ) ( not ( = ?auto_87404 ?auto_87402 ) ) ( not ( = ?auto_87400 ?auto_87407 ) ) ( not ( = ?auto_87400 ?auto_87405 ) ) ( not ( = ?auto_87400 ?auto_87404 ) ) ( not ( = ?auto_87401 ?auto_87407 ) ) ( not ( = ?auto_87401 ?auto_87405 ) ) ( not ( = ?auto_87401 ?auto_87404 ) ) ( ON ?auto_87401 ?auto_87402 ) ( CLEAR ?auto_87401 ) ( HOLDING ?auto_87400 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87400 )
      ( MAKE-4PILE ?auto_87400 ?auto_87401 ?auto_87402 ?auto_87403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87408 - BLOCK
      ?auto_87409 - BLOCK
      ?auto_87410 - BLOCK
      ?auto_87411 - BLOCK
    )
    :vars
    (
      ?auto_87414 - BLOCK
      ?auto_87415 - BLOCK
      ?auto_87412 - BLOCK
      ?auto_87413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87408 ?auto_87409 ) ) ( not ( = ?auto_87408 ?auto_87410 ) ) ( not ( = ?auto_87408 ?auto_87411 ) ) ( not ( = ?auto_87409 ?auto_87410 ) ) ( not ( = ?auto_87409 ?auto_87411 ) ) ( not ( = ?auto_87410 ?auto_87411 ) ) ( ON ?auto_87411 ?auto_87414 ) ( not ( = ?auto_87408 ?auto_87414 ) ) ( not ( = ?auto_87409 ?auto_87414 ) ) ( not ( = ?auto_87410 ?auto_87414 ) ) ( not ( = ?auto_87411 ?auto_87414 ) ) ( ON ?auto_87410 ?auto_87411 ) ( ON-TABLE ?auto_87415 ) ( ON ?auto_87412 ?auto_87415 ) ( ON ?auto_87413 ?auto_87412 ) ( ON ?auto_87414 ?auto_87413 ) ( not ( = ?auto_87415 ?auto_87412 ) ) ( not ( = ?auto_87415 ?auto_87413 ) ) ( not ( = ?auto_87415 ?auto_87414 ) ) ( not ( = ?auto_87415 ?auto_87411 ) ) ( not ( = ?auto_87415 ?auto_87410 ) ) ( not ( = ?auto_87412 ?auto_87413 ) ) ( not ( = ?auto_87412 ?auto_87414 ) ) ( not ( = ?auto_87412 ?auto_87411 ) ) ( not ( = ?auto_87412 ?auto_87410 ) ) ( not ( = ?auto_87413 ?auto_87414 ) ) ( not ( = ?auto_87413 ?auto_87411 ) ) ( not ( = ?auto_87413 ?auto_87410 ) ) ( not ( = ?auto_87408 ?auto_87415 ) ) ( not ( = ?auto_87408 ?auto_87412 ) ) ( not ( = ?auto_87408 ?auto_87413 ) ) ( not ( = ?auto_87409 ?auto_87415 ) ) ( not ( = ?auto_87409 ?auto_87412 ) ) ( not ( = ?auto_87409 ?auto_87413 ) ) ( ON ?auto_87409 ?auto_87410 ) ( ON ?auto_87408 ?auto_87409 ) ( CLEAR ?auto_87408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87415 ?auto_87412 ?auto_87413 ?auto_87414 ?auto_87411 ?auto_87410 ?auto_87409 )
      ( MAKE-4PILE ?auto_87408 ?auto_87409 ?auto_87410 ?auto_87411 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87419 - BLOCK
      ?auto_87420 - BLOCK
      ?auto_87421 - BLOCK
    )
    :vars
    (
      ?auto_87422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87422 ?auto_87421 ) ( CLEAR ?auto_87422 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87419 ) ( ON ?auto_87420 ?auto_87419 ) ( ON ?auto_87421 ?auto_87420 ) ( not ( = ?auto_87419 ?auto_87420 ) ) ( not ( = ?auto_87419 ?auto_87421 ) ) ( not ( = ?auto_87419 ?auto_87422 ) ) ( not ( = ?auto_87420 ?auto_87421 ) ) ( not ( = ?auto_87420 ?auto_87422 ) ) ( not ( = ?auto_87421 ?auto_87422 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87422 ?auto_87421 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87423 - BLOCK
      ?auto_87424 - BLOCK
      ?auto_87425 - BLOCK
    )
    :vars
    (
      ?auto_87426 - BLOCK
      ?auto_87427 - BLOCK
      ?auto_87428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87426 ?auto_87425 ) ( CLEAR ?auto_87426 ) ( ON-TABLE ?auto_87423 ) ( ON ?auto_87424 ?auto_87423 ) ( ON ?auto_87425 ?auto_87424 ) ( not ( = ?auto_87423 ?auto_87424 ) ) ( not ( = ?auto_87423 ?auto_87425 ) ) ( not ( = ?auto_87423 ?auto_87426 ) ) ( not ( = ?auto_87424 ?auto_87425 ) ) ( not ( = ?auto_87424 ?auto_87426 ) ) ( not ( = ?auto_87425 ?auto_87426 ) ) ( HOLDING ?auto_87427 ) ( CLEAR ?auto_87428 ) ( not ( = ?auto_87423 ?auto_87427 ) ) ( not ( = ?auto_87423 ?auto_87428 ) ) ( not ( = ?auto_87424 ?auto_87427 ) ) ( not ( = ?auto_87424 ?auto_87428 ) ) ( not ( = ?auto_87425 ?auto_87427 ) ) ( not ( = ?auto_87425 ?auto_87428 ) ) ( not ( = ?auto_87426 ?auto_87427 ) ) ( not ( = ?auto_87426 ?auto_87428 ) ) ( not ( = ?auto_87427 ?auto_87428 ) ) )
    :subtasks
    ( ( !STACK ?auto_87427 ?auto_87428 )
      ( MAKE-3PILE ?auto_87423 ?auto_87424 ?auto_87425 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87429 - BLOCK
      ?auto_87430 - BLOCK
      ?auto_87431 - BLOCK
    )
    :vars
    (
      ?auto_87433 - BLOCK
      ?auto_87434 - BLOCK
      ?auto_87432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87433 ?auto_87431 ) ( ON-TABLE ?auto_87429 ) ( ON ?auto_87430 ?auto_87429 ) ( ON ?auto_87431 ?auto_87430 ) ( not ( = ?auto_87429 ?auto_87430 ) ) ( not ( = ?auto_87429 ?auto_87431 ) ) ( not ( = ?auto_87429 ?auto_87433 ) ) ( not ( = ?auto_87430 ?auto_87431 ) ) ( not ( = ?auto_87430 ?auto_87433 ) ) ( not ( = ?auto_87431 ?auto_87433 ) ) ( CLEAR ?auto_87434 ) ( not ( = ?auto_87429 ?auto_87432 ) ) ( not ( = ?auto_87429 ?auto_87434 ) ) ( not ( = ?auto_87430 ?auto_87432 ) ) ( not ( = ?auto_87430 ?auto_87434 ) ) ( not ( = ?auto_87431 ?auto_87432 ) ) ( not ( = ?auto_87431 ?auto_87434 ) ) ( not ( = ?auto_87433 ?auto_87432 ) ) ( not ( = ?auto_87433 ?auto_87434 ) ) ( not ( = ?auto_87432 ?auto_87434 ) ) ( ON ?auto_87432 ?auto_87433 ) ( CLEAR ?auto_87432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87429 ?auto_87430 ?auto_87431 ?auto_87433 )
      ( MAKE-3PILE ?auto_87429 ?auto_87430 ?auto_87431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87435 - BLOCK
      ?auto_87436 - BLOCK
      ?auto_87437 - BLOCK
    )
    :vars
    (
      ?auto_87438 - BLOCK
      ?auto_87439 - BLOCK
      ?auto_87440 - BLOCK
      ?auto_87442 - BLOCK
      ?auto_87441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87438 ?auto_87437 ) ( ON-TABLE ?auto_87435 ) ( ON ?auto_87436 ?auto_87435 ) ( ON ?auto_87437 ?auto_87436 ) ( not ( = ?auto_87435 ?auto_87436 ) ) ( not ( = ?auto_87435 ?auto_87437 ) ) ( not ( = ?auto_87435 ?auto_87438 ) ) ( not ( = ?auto_87436 ?auto_87437 ) ) ( not ( = ?auto_87436 ?auto_87438 ) ) ( not ( = ?auto_87437 ?auto_87438 ) ) ( not ( = ?auto_87435 ?auto_87439 ) ) ( not ( = ?auto_87435 ?auto_87440 ) ) ( not ( = ?auto_87436 ?auto_87439 ) ) ( not ( = ?auto_87436 ?auto_87440 ) ) ( not ( = ?auto_87437 ?auto_87439 ) ) ( not ( = ?auto_87437 ?auto_87440 ) ) ( not ( = ?auto_87438 ?auto_87439 ) ) ( not ( = ?auto_87438 ?auto_87440 ) ) ( not ( = ?auto_87439 ?auto_87440 ) ) ( ON ?auto_87439 ?auto_87438 ) ( CLEAR ?auto_87439 ) ( HOLDING ?auto_87440 ) ( CLEAR ?auto_87442 ) ( ON-TABLE ?auto_87441 ) ( ON ?auto_87442 ?auto_87441 ) ( not ( = ?auto_87441 ?auto_87442 ) ) ( not ( = ?auto_87441 ?auto_87440 ) ) ( not ( = ?auto_87442 ?auto_87440 ) ) ( not ( = ?auto_87435 ?auto_87442 ) ) ( not ( = ?auto_87435 ?auto_87441 ) ) ( not ( = ?auto_87436 ?auto_87442 ) ) ( not ( = ?auto_87436 ?auto_87441 ) ) ( not ( = ?auto_87437 ?auto_87442 ) ) ( not ( = ?auto_87437 ?auto_87441 ) ) ( not ( = ?auto_87438 ?auto_87442 ) ) ( not ( = ?auto_87438 ?auto_87441 ) ) ( not ( = ?auto_87439 ?auto_87442 ) ) ( not ( = ?auto_87439 ?auto_87441 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87441 ?auto_87442 ?auto_87440 )
      ( MAKE-3PILE ?auto_87435 ?auto_87436 ?auto_87437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87443 - BLOCK
      ?auto_87444 - BLOCK
      ?auto_87445 - BLOCK
    )
    :vars
    (
      ?auto_87450 - BLOCK
      ?auto_87448 - BLOCK
      ?auto_87449 - BLOCK
      ?auto_87447 - BLOCK
      ?auto_87446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87450 ?auto_87445 ) ( ON-TABLE ?auto_87443 ) ( ON ?auto_87444 ?auto_87443 ) ( ON ?auto_87445 ?auto_87444 ) ( not ( = ?auto_87443 ?auto_87444 ) ) ( not ( = ?auto_87443 ?auto_87445 ) ) ( not ( = ?auto_87443 ?auto_87450 ) ) ( not ( = ?auto_87444 ?auto_87445 ) ) ( not ( = ?auto_87444 ?auto_87450 ) ) ( not ( = ?auto_87445 ?auto_87450 ) ) ( not ( = ?auto_87443 ?auto_87448 ) ) ( not ( = ?auto_87443 ?auto_87449 ) ) ( not ( = ?auto_87444 ?auto_87448 ) ) ( not ( = ?auto_87444 ?auto_87449 ) ) ( not ( = ?auto_87445 ?auto_87448 ) ) ( not ( = ?auto_87445 ?auto_87449 ) ) ( not ( = ?auto_87450 ?auto_87448 ) ) ( not ( = ?auto_87450 ?auto_87449 ) ) ( not ( = ?auto_87448 ?auto_87449 ) ) ( ON ?auto_87448 ?auto_87450 ) ( CLEAR ?auto_87447 ) ( ON-TABLE ?auto_87446 ) ( ON ?auto_87447 ?auto_87446 ) ( not ( = ?auto_87446 ?auto_87447 ) ) ( not ( = ?auto_87446 ?auto_87449 ) ) ( not ( = ?auto_87447 ?auto_87449 ) ) ( not ( = ?auto_87443 ?auto_87447 ) ) ( not ( = ?auto_87443 ?auto_87446 ) ) ( not ( = ?auto_87444 ?auto_87447 ) ) ( not ( = ?auto_87444 ?auto_87446 ) ) ( not ( = ?auto_87445 ?auto_87447 ) ) ( not ( = ?auto_87445 ?auto_87446 ) ) ( not ( = ?auto_87450 ?auto_87447 ) ) ( not ( = ?auto_87450 ?auto_87446 ) ) ( not ( = ?auto_87448 ?auto_87447 ) ) ( not ( = ?auto_87448 ?auto_87446 ) ) ( ON ?auto_87449 ?auto_87448 ) ( CLEAR ?auto_87449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87443 ?auto_87444 ?auto_87445 ?auto_87450 ?auto_87448 )
      ( MAKE-3PILE ?auto_87443 ?auto_87444 ?auto_87445 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87451 - BLOCK
      ?auto_87452 - BLOCK
      ?auto_87453 - BLOCK
    )
    :vars
    (
      ?auto_87455 - BLOCK
      ?auto_87456 - BLOCK
      ?auto_87454 - BLOCK
      ?auto_87457 - BLOCK
      ?auto_87458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87455 ?auto_87453 ) ( ON-TABLE ?auto_87451 ) ( ON ?auto_87452 ?auto_87451 ) ( ON ?auto_87453 ?auto_87452 ) ( not ( = ?auto_87451 ?auto_87452 ) ) ( not ( = ?auto_87451 ?auto_87453 ) ) ( not ( = ?auto_87451 ?auto_87455 ) ) ( not ( = ?auto_87452 ?auto_87453 ) ) ( not ( = ?auto_87452 ?auto_87455 ) ) ( not ( = ?auto_87453 ?auto_87455 ) ) ( not ( = ?auto_87451 ?auto_87456 ) ) ( not ( = ?auto_87451 ?auto_87454 ) ) ( not ( = ?auto_87452 ?auto_87456 ) ) ( not ( = ?auto_87452 ?auto_87454 ) ) ( not ( = ?auto_87453 ?auto_87456 ) ) ( not ( = ?auto_87453 ?auto_87454 ) ) ( not ( = ?auto_87455 ?auto_87456 ) ) ( not ( = ?auto_87455 ?auto_87454 ) ) ( not ( = ?auto_87456 ?auto_87454 ) ) ( ON ?auto_87456 ?auto_87455 ) ( ON-TABLE ?auto_87457 ) ( not ( = ?auto_87457 ?auto_87458 ) ) ( not ( = ?auto_87457 ?auto_87454 ) ) ( not ( = ?auto_87458 ?auto_87454 ) ) ( not ( = ?auto_87451 ?auto_87458 ) ) ( not ( = ?auto_87451 ?auto_87457 ) ) ( not ( = ?auto_87452 ?auto_87458 ) ) ( not ( = ?auto_87452 ?auto_87457 ) ) ( not ( = ?auto_87453 ?auto_87458 ) ) ( not ( = ?auto_87453 ?auto_87457 ) ) ( not ( = ?auto_87455 ?auto_87458 ) ) ( not ( = ?auto_87455 ?auto_87457 ) ) ( not ( = ?auto_87456 ?auto_87458 ) ) ( not ( = ?auto_87456 ?auto_87457 ) ) ( ON ?auto_87454 ?auto_87456 ) ( CLEAR ?auto_87454 ) ( HOLDING ?auto_87458 ) ( CLEAR ?auto_87457 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87457 ?auto_87458 )
      ( MAKE-3PILE ?auto_87451 ?auto_87452 ?auto_87453 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87459 - BLOCK
      ?auto_87460 - BLOCK
      ?auto_87461 - BLOCK
    )
    :vars
    (
      ?auto_87464 - BLOCK
      ?auto_87465 - BLOCK
      ?auto_87463 - BLOCK
      ?auto_87466 - BLOCK
      ?auto_87462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87464 ?auto_87461 ) ( ON-TABLE ?auto_87459 ) ( ON ?auto_87460 ?auto_87459 ) ( ON ?auto_87461 ?auto_87460 ) ( not ( = ?auto_87459 ?auto_87460 ) ) ( not ( = ?auto_87459 ?auto_87461 ) ) ( not ( = ?auto_87459 ?auto_87464 ) ) ( not ( = ?auto_87460 ?auto_87461 ) ) ( not ( = ?auto_87460 ?auto_87464 ) ) ( not ( = ?auto_87461 ?auto_87464 ) ) ( not ( = ?auto_87459 ?auto_87465 ) ) ( not ( = ?auto_87459 ?auto_87463 ) ) ( not ( = ?auto_87460 ?auto_87465 ) ) ( not ( = ?auto_87460 ?auto_87463 ) ) ( not ( = ?auto_87461 ?auto_87465 ) ) ( not ( = ?auto_87461 ?auto_87463 ) ) ( not ( = ?auto_87464 ?auto_87465 ) ) ( not ( = ?auto_87464 ?auto_87463 ) ) ( not ( = ?auto_87465 ?auto_87463 ) ) ( ON ?auto_87465 ?auto_87464 ) ( ON-TABLE ?auto_87466 ) ( not ( = ?auto_87466 ?auto_87462 ) ) ( not ( = ?auto_87466 ?auto_87463 ) ) ( not ( = ?auto_87462 ?auto_87463 ) ) ( not ( = ?auto_87459 ?auto_87462 ) ) ( not ( = ?auto_87459 ?auto_87466 ) ) ( not ( = ?auto_87460 ?auto_87462 ) ) ( not ( = ?auto_87460 ?auto_87466 ) ) ( not ( = ?auto_87461 ?auto_87462 ) ) ( not ( = ?auto_87461 ?auto_87466 ) ) ( not ( = ?auto_87464 ?auto_87462 ) ) ( not ( = ?auto_87464 ?auto_87466 ) ) ( not ( = ?auto_87465 ?auto_87462 ) ) ( not ( = ?auto_87465 ?auto_87466 ) ) ( ON ?auto_87463 ?auto_87465 ) ( CLEAR ?auto_87466 ) ( ON ?auto_87462 ?auto_87463 ) ( CLEAR ?auto_87462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87459 ?auto_87460 ?auto_87461 ?auto_87464 ?auto_87465 ?auto_87463 )
      ( MAKE-3PILE ?auto_87459 ?auto_87460 ?auto_87461 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87467 - BLOCK
      ?auto_87468 - BLOCK
      ?auto_87469 - BLOCK
    )
    :vars
    (
      ?auto_87470 - BLOCK
      ?auto_87472 - BLOCK
      ?auto_87471 - BLOCK
      ?auto_87473 - BLOCK
      ?auto_87474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87470 ?auto_87469 ) ( ON-TABLE ?auto_87467 ) ( ON ?auto_87468 ?auto_87467 ) ( ON ?auto_87469 ?auto_87468 ) ( not ( = ?auto_87467 ?auto_87468 ) ) ( not ( = ?auto_87467 ?auto_87469 ) ) ( not ( = ?auto_87467 ?auto_87470 ) ) ( not ( = ?auto_87468 ?auto_87469 ) ) ( not ( = ?auto_87468 ?auto_87470 ) ) ( not ( = ?auto_87469 ?auto_87470 ) ) ( not ( = ?auto_87467 ?auto_87472 ) ) ( not ( = ?auto_87467 ?auto_87471 ) ) ( not ( = ?auto_87468 ?auto_87472 ) ) ( not ( = ?auto_87468 ?auto_87471 ) ) ( not ( = ?auto_87469 ?auto_87472 ) ) ( not ( = ?auto_87469 ?auto_87471 ) ) ( not ( = ?auto_87470 ?auto_87472 ) ) ( not ( = ?auto_87470 ?auto_87471 ) ) ( not ( = ?auto_87472 ?auto_87471 ) ) ( ON ?auto_87472 ?auto_87470 ) ( not ( = ?auto_87473 ?auto_87474 ) ) ( not ( = ?auto_87473 ?auto_87471 ) ) ( not ( = ?auto_87474 ?auto_87471 ) ) ( not ( = ?auto_87467 ?auto_87474 ) ) ( not ( = ?auto_87467 ?auto_87473 ) ) ( not ( = ?auto_87468 ?auto_87474 ) ) ( not ( = ?auto_87468 ?auto_87473 ) ) ( not ( = ?auto_87469 ?auto_87474 ) ) ( not ( = ?auto_87469 ?auto_87473 ) ) ( not ( = ?auto_87470 ?auto_87474 ) ) ( not ( = ?auto_87470 ?auto_87473 ) ) ( not ( = ?auto_87472 ?auto_87474 ) ) ( not ( = ?auto_87472 ?auto_87473 ) ) ( ON ?auto_87471 ?auto_87472 ) ( ON ?auto_87474 ?auto_87471 ) ( CLEAR ?auto_87474 ) ( HOLDING ?auto_87473 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87473 )
      ( MAKE-3PILE ?auto_87467 ?auto_87468 ?auto_87469 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87475 - BLOCK
      ?auto_87476 - BLOCK
      ?auto_87477 - BLOCK
    )
    :vars
    (
      ?auto_87479 - BLOCK
      ?auto_87482 - BLOCK
      ?auto_87481 - BLOCK
      ?auto_87478 - BLOCK
      ?auto_87480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87479 ?auto_87477 ) ( ON-TABLE ?auto_87475 ) ( ON ?auto_87476 ?auto_87475 ) ( ON ?auto_87477 ?auto_87476 ) ( not ( = ?auto_87475 ?auto_87476 ) ) ( not ( = ?auto_87475 ?auto_87477 ) ) ( not ( = ?auto_87475 ?auto_87479 ) ) ( not ( = ?auto_87476 ?auto_87477 ) ) ( not ( = ?auto_87476 ?auto_87479 ) ) ( not ( = ?auto_87477 ?auto_87479 ) ) ( not ( = ?auto_87475 ?auto_87482 ) ) ( not ( = ?auto_87475 ?auto_87481 ) ) ( not ( = ?auto_87476 ?auto_87482 ) ) ( not ( = ?auto_87476 ?auto_87481 ) ) ( not ( = ?auto_87477 ?auto_87482 ) ) ( not ( = ?auto_87477 ?auto_87481 ) ) ( not ( = ?auto_87479 ?auto_87482 ) ) ( not ( = ?auto_87479 ?auto_87481 ) ) ( not ( = ?auto_87482 ?auto_87481 ) ) ( ON ?auto_87482 ?auto_87479 ) ( not ( = ?auto_87478 ?auto_87480 ) ) ( not ( = ?auto_87478 ?auto_87481 ) ) ( not ( = ?auto_87480 ?auto_87481 ) ) ( not ( = ?auto_87475 ?auto_87480 ) ) ( not ( = ?auto_87475 ?auto_87478 ) ) ( not ( = ?auto_87476 ?auto_87480 ) ) ( not ( = ?auto_87476 ?auto_87478 ) ) ( not ( = ?auto_87477 ?auto_87480 ) ) ( not ( = ?auto_87477 ?auto_87478 ) ) ( not ( = ?auto_87479 ?auto_87480 ) ) ( not ( = ?auto_87479 ?auto_87478 ) ) ( not ( = ?auto_87482 ?auto_87480 ) ) ( not ( = ?auto_87482 ?auto_87478 ) ) ( ON ?auto_87481 ?auto_87482 ) ( ON ?auto_87480 ?auto_87481 ) ( ON ?auto_87478 ?auto_87480 ) ( CLEAR ?auto_87478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87475 ?auto_87476 ?auto_87477 ?auto_87479 ?auto_87482 ?auto_87481 ?auto_87480 )
      ( MAKE-3PILE ?auto_87475 ?auto_87476 ?auto_87477 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87488 - BLOCK
      ?auto_87489 - BLOCK
      ?auto_87490 - BLOCK
      ?auto_87491 - BLOCK
      ?auto_87492 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_87492 ) ( CLEAR ?auto_87491 ) ( ON-TABLE ?auto_87488 ) ( ON ?auto_87489 ?auto_87488 ) ( ON ?auto_87490 ?auto_87489 ) ( ON ?auto_87491 ?auto_87490 ) ( not ( = ?auto_87488 ?auto_87489 ) ) ( not ( = ?auto_87488 ?auto_87490 ) ) ( not ( = ?auto_87488 ?auto_87491 ) ) ( not ( = ?auto_87488 ?auto_87492 ) ) ( not ( = ?auto_87489 ?auto_87490 ) ) ( not ( = ?auto_87489 ?auto_87491 ) ) ( not ( = ?auto_87489 ?auto_87492 ) ) ( not ( = ?auto_87490 ?auto_87491 ) ) ( not ( = ?auto_87490 ?auto_87492 ) ) ( not ( = ?auto_87491 ?auto_87492 ) ) )
    :subtasks
    ( ( !STACK ?auto_87492 ?auto_87491 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87493 - BLOCK
      ?auto_87494 - BLOCK
      ?auto_87495 - BLOCK
      ?auto_87496 - BLOCK
      ?auto_87497 - BLOCK
    )
    :vars
    (
      ?auto_87498 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_87496 ) ( ON-TABLE ?auto_87493 ) ( ON ?auto_87494 ?auto_87493 ) ( ON ?auto_87495 ?auto_87494 ) ( ON ?auto_87496 ?auto_87495 ) ( not ( = ?auto_87493 ?auto_87494 ) ) ( not ( = ?auto_87493 ?auto_87495 ) ) ( not ( = ?auto_87493 ?auto_87496 ) ) ( not ( = ?auto_87493 ?auto_87497 ) ) ( not ( = ?auto_87494 ?auto_87495 ) ) ( not ( = ?auto_87494 ?auto_87496 ) ) ( not ( = ?auto_87494 ?auto_87497 ) ) ( not ( = ?auto_87495 ?auto_87496 ) ) ( not ( = ?auto_87495 ?auto_87497 ) ) ( not ( = ?auto_87496 ?auto_87497 ) ) ( ON ?auto_87497 ?auto_87498 ) ( CLEAR ?auto_87497 ) ( HAND-EMPTY ) ( not ( = ?auto_87493 ?auto_87498 ) ) ( not ( = ?auto_87494 ?auto_87498 ) ) ( not ( = ?auto_87495 ?auto_87498 ) ) ( not ( = ?auto_87496 ?auto_87498 ) ) ( not ( = ?auto_87497 ?auto_87498 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87497 ?auto_87498 )
      ( MAKE-5PILE ?auto_87493 ?auto_87494 ?auto_87495 ?auto_87496 ?auto_87497 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87499 - BLOCK
      ?auto_87500 - BLOCK
      ?auto_87501 - BLOCK
      ?auto_87502 - BLOCK
      ?auto_87503 - BLOCK
    )
    :vars
    (
      ?auto_87504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87499 ) ( ON ?auto_87500 ?auto_87499 ) ( ON ?auto_87501 ?auto_87500 ) ( not ( = ?auto_87499 ?auto_87500 ) ) ( not ( = ?auto_87499 ?auto_87501 ) ) ( not ( = ?auto_87499 ?auto_87502 ) ) ( not ( = ?auto_87499 ?auto_87503 ) ) ( not ( = ?auto_87500 ?auto_87501 ) ) ( not ( = ?auto_87500 ?auto_87502 ) ) ( not ( = ?auto_87500 ?auto_87503 ) ) ( not ( = ?auto_87501 ?auto_87502 ) ) ( not ( = ?auto_87501 ?auto_87503 ) ) ( not ( = ?auto_87502 ?auto_87503 ) ) ( ON ?auto_87503 ?auto_87504 ) ( CLEAR ?auto_87503 ) ( not ( = ?auto_87499 ?auto_87504 ) ) ( not ( = ?auto_87500 ?auto_87504 ) ) ( not ( = ?auto_87501 ?auto_87504 ) ) ( not ( = ?auto_87502 ?auto_87504 ) ) ( not ( = ?auto_87503 ?auto_87504 ) ) ( HOLDING ?auto_87502 ) ( CLEAR ?auto_87501 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87499 ?auto_87500 ?auto_87501 ?auto_87502 )
      ( MAKE-5PILE ?auto_87499 ?auto_87500 ?auto_87501 ?auto_87502 ?auto_87503 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87505 - BLOCK
      ?auto_87506 - BLOCK
      ?auto_87507 - BLOCK
      ?auto_87508 - BLOCK
      ?auto_87509 - BLOCK
    )
    :vars
    (
      ?auto_87510 - BLOCK
      ?auto_87511 - BLOCK
      ?auto_87512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87505 ) ( ON ?auto_87506 ?auto_87505 ) ( ON ?auto_87507 ?auto_87506 ) ( not ( = ?auto_87505 ?auto_87506 ) ) ( not ( = ?auto_87505 ?auto_87507 ) ) ( not ( = ?auto_87505 ?auto_87508 ) ) ( not ( = ?auto_87505 ?auto_87509 ) ) ( not ( = ?auto_87506 ?auto_87507 ) ) ( not ( = ?auto_87506 ?auto_87508 ) ) ( not ( = ?auto_87506 ?auto_87509 ) ) ( not ( = ?auto_87507 ?auto_87508 ) ) ( not ( = ?auto_87507 ?auto_87509 ) ) ( not ( = ?auto_87508 ?auto_87509 ) ) ( ON ?auto_87509 ?auto_87510 ) ( not ( = ?auto_87505 ?auto_87510 ) ) ( not ( = ?auto_87506 ?auto_87510 ) ) ( not ( = ?auto_87507 ?auto_87510 ) ) ( not ( = ?auto_87508 ?auto_87510 ) ) ( not ( = ?auto_87509 ?auto_87510 ) ) ( CLEAR ?auto_87507 ) ( ON ?auto_87508 ?auto_87509 ) ( CLEAR ?auto_87508 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87511 ) ( ON ?auto_87512 ?auto_87511 ) ( ON ?auto_87510 ?auto_87512 ) ( not ( = ?auto_87511 ?auto_87512 ) ) ( not ( = ?auto_87511 ?auto_87510 ) ) ( not ( = ?auto_87511 ?auto_87509 ) ) ( not ( = ?auto_87511 ?auto_87508 ) ) ( not ( = ?auto_87512 ?auto_87510 ) ) ( not ( = ?auto_87512 ?auto_87509 ) ) ( not ( = ?auto_87512 ?auto_87508 ) ) ( not ( = ?auto_87505 ?auto_87511 ) ) ( not ( = ?auto_87505 ?auto_87512 ) ) ( not ( = ?auto_87506 ?auto_87511 ) ) ( not ( = ?auto_87506 ?auto_87512 ) ) ( not ( = ?auto_87507 ?auto_87511 ) ) ( not ( = ?auto_87507 ?auto_87512 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87511 ?auto_87512 ?auto_87510 ?auto_87509 )
      ( MAKE-5PILE ?auto_87505 ?auto_87506 ?auto_87507 ?auto_87508 ?auto_87509 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87513 - BLOCK
      ?auto_87514 - BLOCK
      ?auto_87515 - BLOCK
      ?auto_87516 - BLOCK
      ?auto_87517 - BLOCK
    )
    :vars
    (
      ?auto_87519 - BLOCK
      ?auto_87520 - BLOCK
      ?auto_87518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87513 ) ( ON ?auto_87514 ?auto_87513 ) ( not ( = ?auto_87513 ?auto_87514 ) ) ( not ( = ?auto_87513 ?auto_87515 ) ) ( not ( = ?auto_87513 ?auto_87516 ) ) ( not ( = ?auto_87513 ?auto_87517 ) ) ( not ( = ?auto_87514 ?auto_87515 ) ) ( not ( = ?auto_87514 ?auto_87516 ) ) ( not ( = ?auto_87514 ?auto_87517 ) ) ( not ( = ?auto_87515 ?auto_87516 ) ) ( not ( = ?auto_87515 ?auto_87517 ) ) ( not ( = ?auto_87516 ?auto_87517 ) ) ( ON ?auto_87517 ?auto_87519 ) ( not ( = ?auto_87513 ?auto_87519 ) ) ( not ( = ?auto_87514 ?auto_87519 ) ) ( not ( = ?auto_87515 ?auto_87519 ) ) ( not ( = ?auto_87516 ?auto_87519 ) ) ( not ( = ?auto_87517 ?auto_87519 ) ) ( ON ?auto_87516 ?auto_87517 ) ( CLEAR ?auto_87516 ) ( ON-TABLE ?auto_87520 ) ( ON ?auto_87518 ?auto_87520 ) ( ON ?auto_87519 ?auto_87518 ) ( not ( = ?auto_87520 ?auto_87518 ) ) ( not ( = ?auto_87520 ?auto_87519 ) ) ( not ( = ?auto_87520 ?auto_87517 ) ) ( not ( = ?auto_87520 ?auto_87516 ) ) ( not ( = ?auto_87518 ?auto_87519 ) ) ( not ( = ?auto_87518 ?auto_87517 ) ) ( not ( = ?auto_87518 ?auto_87516 ) ) ( not ( = ?auto_87513 ?auto_87520 ) ) ( not ( = ?auto_87513 ?auto_87518 ) ) ( not ( = ?auto_87514 ?auto_87520 ) ) ( not ( = ?auto_87514 ?auto_87518 ) ) ( not ( = ?auto_87515 ?auto_87520 ) ) ( not ( = ?auto_87515 ?auto_87518 ) ) ( HOLDING ?auto_87515 ) ( CLEAR ?auto_87514 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87513 ?auto_87514 ?auto_87515 )
      ( MAKE-5PILE ?auto_87513 ?auto_87514 ?auto_87515 ?auto_87516 ?auto_87517 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87521 - BLOCK
      ?auto_87522 - BLOCK
      ?auto_87523 - BLOCK
      ?auto_87524 - BLOCK
      ?auto_87525 - BLOCK
    )
    :vars
    (
      ?auto_87526 - BLOCK
      ?auto_87528 - BLOCK
      ?auto_87527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87521 ) ( ON ?auto_87522 ?auto_87521 ) ( not ( = ?auto_87521 ?auto_87522 ) ) ( not ( = ?auto_87521 ?auto_87523 ) ) ( not ( = ?auto_87521 ?auto_87524 ) ) ( not ( = ?auto_87521 ?auto_87525 ) ) ( not ( = ?auto_87522 ?auto_87523 ) ) ( not ( = ?auto_87522 ?auto_87524 ) ) ( not ( = ?auto_87522 ?auto_87525 ) ) ( not ( = ?auto_87523 ?auto_87524 ) ) ( not ( = ?auto_87523 ?auto_87525 ) ) ( not ( = ?auto_87524 ?auto_87525 ) ) ( ON ?auto_87525 ?auto_87526 ) ( not ( = ?auto_87521 ?auto_87526 ) ) ( not ( = ?auto_87522 ?auto_87526 ) ) ( not ( = ?auto_87523 ?auto_87526 ) ) ( not ( = ?auto_87524 ?auto_87526 ) ) ( not ( = ?auto_87525 ?auto_87526 ) ) ( ON ?auto_87524 ?auto_87525 ) ( ON-TABLE ?auto_87528 ) ( ON ?auto_87527 ?auto_87528 ) ( ON ?auto_87526 ?auto_87527 ) ( not ( = ?auto_87528 ?auto_87527 ) ) ( not ( = ?auto_87528 ?auto_87526 ) ) ( not ( = ?auto_87528 ?auto_87525 ) ) ( not ( = ?auto_87528 ?auto_87524 ) ) ( not ( = ?auto_87527 ?auto_87526 ) ) ( not ( = ?auto_87527 ?auto_87525 ) ) ( not ( = ?auto_87527 ?auto_87524 ) ) ( not ( = ?auto_87521 ?auto_87528 ) ) ( not ( = ?auto_87521 ?auto_87527 ) ) ( not ( = ?auto_87522 ?auto_87528 ) ) ( not ( = ?auto_87522 ?auto_87527 ) ) ( not ( = ?auto_87523 ?auto_87528 ) ) ( not ( = ?auto_87523 ?auto_87527 ) ) ( CLEAR ?auto_87522 ) ( ON ?auto_87523 ?auto_87524 ) ( CLEAR ?auto_87523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87528 ?auto_87527 ?auto_87526 ?auto_87525 ?auto_87524 )
      ( MAKE-5PILE ?auto_87521 ?auto_87522 ?auto_87523 ?auto_87524 ?auto_87525 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87529 - BLOCK
      ?auto_87530 - BLOCK
      ?auto_87531 - BLOCK
      ?auto_87532 - BLOCK
      ?auto_87533 - BLOCK
    )
    :vars
    (
      ?auto_87535 - BLOCK
      ?auto_87536 - BLOCK
      ?auto_87534 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87529 ) ( not ( = ?auto_87529 ?auto_87530 ) ) ( not ( = ?auto_87529 ?auto_87531 ) ) ( not ( = ?auto_87529 ?auto_87532 ) ) ( not ( = ?auto_87529 ?auto_87533 ) ) ( not ( = ?auto_87530 ?auto_87531 ) ) ( not ( = ?auto_87530 ?auto_87532 ) ) ( not ( = ?auto_87530 ?auto_87533 ) ) ( not ( = ?auto_87531 ?auto_87532 ) ) ( not ( = ?auto_87531 ?auto_87533 ) ) ( not ( = ?auto_87532 ?auto_87533 ) ) ( ON ?auto_87533 ?auto_87535 ) ( not ( = ?auto_87529 ?auto_87535 ) ) ( not ( = ?auto_87530 ?auto_87535 ) ) ( not ( = ?auto_87531 ?auto_87535 ) ) ( not ( = ?auto_87532 ?auto_87535 ) ) ( not ( = ?auto_87533 ?auto_87535 ) ) ( ON ?auto_87532 ?auto_87533 ) ( ON-TABLE ?auto_87536 ) ( ON ?auto_87534 ?auto_87536 ) ( ON ?auto_87535 ?auto_87534 ) ( not ( = ?auto_87536 ?auto_87534 ) ) ( not ( = ?auto_87536 ?auto_87535 ) ) ( not ( = ?auto_87536 ?auto_87533 ) ) ( not ( = ?auto_87536 ?auto_87532 ) ) ( not ( = ?auto_87534 ?auto_87535 ) ) ( not ( = ?auto_87534 ?auto_87533 ) ) ( not ( = ?auto_87534 ?auto_87532 ) ) ( not ( = ?auto_87529 ?auto_87536 ) ) ( not ( = ?auto_87529 ?auto_87534 ) ) ( not ( = ?auto_87530 ?auto_87536 ) ) ( not ( = ?auto_87530 ?auto_87534 ) ) ( not ( = ?auto_87531 ?auto_87536 ) ) ( not ( = ?auto_87531 ?auto_87534 ) ) ( ON ?auto_87531 ?auto_87532 ) ( CLEAR ?auto_87531 ) ( HOLDING ?auto_87530 ) ( CLEAR ?auto_87529 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87529 ?auto_87530 )
      ( MAKE-5PILE ?auto_87529 ?auto_87530 ?auto_87531 ?auto_87532 ?auto_87533 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87537 - BLOCK
      ?auto_87538 - BLOCK
      ?auto_87539 - BLOCK
      ?auto_87540 - BLOCK
      ?auto_87541 - BLOCK
    )
    :vars
    (
      ?auto_87544 - BLOCK
      ?auto_87542 - BLOCK
      ?auto_87543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87537 ) ( not ( = ?auto_87537 ?auto_87538 ) ) ( not ( = ?auto_87537 ?auto_87539 ) ) ( not ( = ?auto_87537 ?auto_87540 ) ) ( not ( = ?auto_87537 ?auto_87541 ) ) ( not ( = ?auto_87538 ?auto_87539 ) ) ( not ( = ?auto_87538 ?auto_87540 ) ) ( not ( = ?auto_87538 ?auto_87541 ) ) ( not ( = ?auto_87539 ?auto_87540 ) ) ( not ( = ?auto_87539 ?auto_87541 ) ) ( not ( = ?auto_87540 ?auto_87541 ) ) ( ON ?auto_87541 ?auto_87544 ) ( not ( = ?auto_87537 ?auto_87544 ) ) ( not ( = ?auto_87538 ?auto_87544 ) ) ( not ( = ?auto_87539 ?auto_87544 ) ) ( not ( = ?auto_87540 ?auto_87544 ) ) ( not ( = ?auto_87541 ?auto_87544 ) ) ( ON ?auto_87540 ?auto_87541 ) ( ON-TABLE ?auto_87542 ) ( ON ?auto_87543 ?auto_87542 ) ( ON ?auto_87544 ?auto_87543 ) ( not ( = ?auto_87542 ?auto_87543 ) ) ( not ( = ?auto_87542 ?auto_87544 ) ) ( not ( = ?auto_87542 ?auto_87541 ) ) ( not ( = ?auto_87542 ?auto_87540 ) ) ( not ( = ?auto_87543 ?auto_87544 ) ) ( not ( = ?auto_87543 ?auto_87541 ) ) ( not ( = ?auto_87543 ?auto_87540 ) ) ( not ( = ?auto_87537 ?auto_87542 ) ) ( not ( = ?auto_87537 ?auto_87543 ) ) ( not ( = ?auto_87538 ?auto_87542 ) ) ( not ( = ?auto_87538 ?auto_87543 ) ) ( not ( = ?auto_87539 ?auto_87542 ) ) ( not ( = ?auto_87539 ?auto_87543 ) ) ( ON ?auto_87539 ?auto_87540 ) ( CLEAR ?auto_87537 ) ( ON ?auto_87538 ?auto_87539 ) ( CLEAR ?auto_87538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87542 ?auto_87543 ?auto_87544 ?auto_87541 ?auto_87540 ?auto_87539 )
      ( MAKE-5PILE ?auto_87537 ?auto_87538 ?auto_87539 ?auto_87540 ?auto_87541 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87545 - BLOCK
      ?auto_87546 - BLOCK
      ?auto_87547 - BLOCK
      ?auto_87548 - BLOCK
      ?auto_87549 - BLOCK
    )
    :vars
    (
      ?auto_87552 - BLOCK
      ?auto_87551 - BLOCK
      ?auto_87550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87545 ?auto_87546 ) ) ( not ( = ?auto_87545 ?auto_87547 ) ) ( not ( = ?auto_87545 ?auto_87548 ) ) ( not ( = ?auto_87545 ?auto_87549 ) ) ( not ( = ?auto_87546 ?auto_87547 ) ) ( not ( = ?auto_87546 ?auto_87548 ) ) ( not ( = ?auto_87546 ?auto_87549 ) ) ( not ( = ?auto_87547 ?auto_87548 ) ) ( not ( = ?auto_87547 ?auto_87549 ) ) ( not ( = ?auto_87548 ?auto_87549 ) ) ( ON ?auto_87549 ?auto_87552 ) ( not ( = ?auto_87545 ?auto_87552 ) ) ( not ( = ?auto_87546 ?auto_87552 ) ) ( not ( = ?auto_87547 ?auto_87552 ) ) ( not ( = ?auto_87548 ?auto_87552 ) ) ( not ( = ?auto_87549 ?auto_87552 ) ) ( ON ?auto_87548 ?auto_87549 ) ( ON-TABLE ?auto_87551 ) ( ON ?auto_87550 ?auto_87551 ) ( ON ?auto_87552 ?auto_87550 ) ( not ( = ?auto_87551 ?auto_87550 ) ) ( not ( = ?auto_87551 ?auto_87552 ) ) ( not ( = ?auto_87551 ?auto_87549 ) ) ( not ( = ?auto_87551 ?auto_87548 ) ) ( not ( = ?auto_87550 ?auto_87552 ) ) ( not ( = ?auto_87550 ?auto_87549 ) ) ( not ( = ?auto_87550 ?auto_87548 ) ) ( not ( = ?auto_87545 ?auto_87551 ) ) ( not ( = ?auto_87545 ?auto_87550 ) ) ( not ( = ?auto_87546 ?auto_87551 ) ) ( not ( = ?auto_87546 ?auto_87550 ) ) ( not ( = ?auto_87547 ?auto_87551 ) ) ( not ( = ?auto_87547 ?auto_87550 ) ) ( ON ?auto_87547 ?auto_87548 ) ( ON ?auto_87546 ?auto_87547 ) ( CLEAR ?auto_87546 ) ( HOLDING ?auto_87545 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87545 )
      ( MAKE-5PILE ?auto_87545 ?auto_87546 ?auto_87547 ?auto_87548 ?auto_87549 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87553 - BLOCK
      ?auto_87554 - BLOCK
      ?auto_87555 - BLOCK
      ?auto_87556 - BLOCK
      ?auto_87557 - BLOCK
    )
    :vars
    (
      ?auto_87560 - BLOCK
      ?auto_87559 - BLOCK
      ?auto_87558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87553 ?auto_87554 ) ) ( not ( = ?auto_87553 ?auto_87555 ) ) ( not ( = ?auto_87553 ?auto_87556 ) ) ( not ( = ?auto_87553 ?auto_87557 ) ) ( not ( = ?auto_87554 ?auto_87555 ) ) ( not ( = ?auto_87554 ?auto_87556 ) ) ( not ( = ?auto_87554 ?auto_87557 ) ) ( not ( = ?auto_87555 ?auto_87556 ) ) ( not ( = ?auto_87555 ?auto_87557 ) ) ( not ( = ?auto_87556 ?auto_87557 ) ) ( ON ?auto_87557 ?auto_87560 ) ( not ( = ?auto_87553 ?auto_87560 ) ) ( not ( = ?auto_87554 ?auto_87560 ) ) ( not ( = ?auto_87555 ?auto_87560 ) ) ( not ( = ?auto_87556 ?auto_87560 ) ) ( not ( = ?auto_87557 ?auto_87560 ) ) ( ON ?auto_87556 ?auto_87557 ) ( ON-TABLE ?auto_87559 ) ( ON ?auto_87558 ?auto_87559 ) ( ON ?auto_87560 ?auto_87558 ) ( not ( = ?auto_87559 ?auto_87558 ) ) ( not ( = ?auto_87559 ?auto_87560 ) ) ( not ( = ?auto_87559 ?auto_87557 ) ) ( not ( = ?auto_87559 ?auto_87556 ) ) ( not ( = ?auto_87558 ?auto_87560 ) ) ( not ( = ?auto_87558 ?auto_87557 ) ) ( not ( = ?auto_87558 ?auto_87556 ) ) ( not ( = ?auto_87553 ?auto_87559 ) ) ( not ( = ?auto_87553 ?auto_87558 ) ) ( not ( = ?auto_87554 ?auto_87559 ) ) ( not ( = ?auto_87554 ?auto_87558 ) ) ( not ( = ?auto_87555 ?auto_87559 ) ) ( not ( = ?auto_87555 ?auto_87558 ) ) ( ON ?auto_87555 ?auto_87556 ) ( ON ?auto_87554 ?auto_87555 ) ( ON ?auto_87553 ?auto_87554 ) ( CLEAR ?auto_87553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87559 ?auto_87558 ?auto_87560 ?auto_87557 ?auto_87556 ?auto_87555 ?auto_87554 )
      ( MAKE-5PILE ?auto_87553 ?auto_87554 ?auto_87555 ?auto_87556 ?auto_87557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87563 - BLOCK
      ?auto_87564 - BLOCK
    )
    :vars
    (
      ?auto_87565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87565 ?auto_87564 ) ( CLEAR ?auto_87565 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87563 ) ( ON ?auto_87564 ?auto_87563 ) ( not ( = ?auto_87563 ?auto_87564 ) ) ( not ( = ?auto_87563 ?auto_87565 ) ) ( not ( = ?auto_87564 ?auto_87565 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87565 ?auto_87564 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87566 - BLOCK
      ?auto_87567 - BLOCK
    )
    :vars
    (
      ?auto_87568 - BLOCK
      ?auto_87569 - BLOCK
      ?auto_87570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87568 ?auto_87567 ) ( CLEAR ?auto_87568 ) ( ON-TABLE ?auto_87566 ) ( ON ?auto_87567 ?auto_87566 ) ( not ( = ?auto_87566 ?auto_87567 ) ) ( not ( = ?auto_87566 ?auto_87568 ) ) ( not ( = ?auto_87567 ?auto_87568 ) ) ( HOLDING ?auto_87569 ) ( CLEAR ?auto_87570 ) ( not ( = ?auto_87566 ?auto_87569 ) ) ( not ( = ?auto_87566 ?auto_87570 ) ) ( not ( = ?auto_87567 ?auto_87569 ) ) ( not ( = ?auto_87567 ?auto_87570 ) ) ( not ( = ?auto_87568 ?auto_87569 ) ) ( not ( = ?auto_87568 ?auto_87570 ) ) ( not ( = ?auto_87569 ?auto_87570 ) ) )
    :subtasks
    ( ( !STACK ?auto_87569 ?auto_87570 )
      ( MAKE-2PILE ?auto_87566 ?auto_87567 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87571 - BLOCK
      ?auto_87572 - BLOCK
    )
    :vars
    (
      ?auto_87575 - BLOCK
      ?auto_87574 - BLOCK
      ?auto_87573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87575 ?auto_87572 ) ( ON-TABLE ?auto_87571 ) ( ON ?auto_87572 ?auto_87571 ) ( not ( = ?auto_87571 ?auto_87572 ) ) ( not ( = ?auto_87571 ?auto_87575 ) ) ( not ( = ?auto_87572 ?auto_87575 ) ) ( CLEAR ?auto_87574 ) ( not ( = ?auto_87571 ?auto_87573 ) ) ( not ( = ?auto_87571 ?auto_87574 ) ) ( not ( = ?auto_87572 ?auto_87573 ) ) ( not ( = ?auto_87572 ?auto_87574 ) ) ( not ( = ?auto_87575 ?auto_87573 ) ) ( not ( = ?auto_87575 ?auto_87574 ) ) ( not ( = ?auto_87573 ?auto_87574 ) ) ( ON ?auto_87573 ?auto_87575 ) ( CLEAR ?auto_87573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87571 ?auto_87572 ?auto_87575 )
      ( MAKE-2PILE ?auto_87571 ?auto_87572 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87576 - BLOCK
      ?auto_87577 - BLOCK
    )
    :vars
    (
      ?auto_87579 - BLOCK
      ?auto_87578 - BLOCK
      ?auto_87580 - BLOCK
      ?auto_87581 - BLOCK
      ?auto_87582 - BLOCK
      ?auto_87583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87579 ?auto_87577 ) ( ON-TABLE ?auto_87576 ) ( ON ?auto_87577 ?auto_87576 ) ( not ( = ?auto_87576 ?auto_87577 ) ) ( not ( = ?auto_87576 ?auto_87579 ) ) ( not ( = ?auto_87577 ?auto_87579 ) ) ( not ( = ?auto_87576 ?auto_87578 ) ) ( not ( = ?auto_87576 ?auto_87580 ) ) ( not ( = ?auto_87577 ?auto_87578 ) ) ( not ( = ?auto_87577 ?auto_87580 ) ) ( not ( = ?auto_87579 ?auto_87578 ) ) ( not ( = ?auto_87579 ?auto_87580 ) ) ( not ( = ?auto_87578 ?auto_87580 ) ) ( ON ?auto_87578 ?auto_87579 ) ( CLEAR ?auto_87578 ) ( HOLDING ?auto_87580 ) ( CLEAR ?auto_87581 ) ( ON-TABLE ?auto_87582 ) ( ON ?auto_87583 ?auto_87582 ) ( ON ?auto_87581 ?auto_87583 ) ( not ( = ?auto_87582 ?auto_87583 ) ) ( not ( = ?auto_87582 ?auto_87581 ) ) ( not ( = ?auto_87582 ?auto_87580 ) ) ( not ( = ?auto_87583 ?auto_87581 ) ) ( not ( = ?auto_87583 ?auto_87580 ) ) ( not ( = ?auto_87581 ?auto_87580 ) ) ( not ( = ?auto_87576 ?auto_87581 ) ) ( not ( = ?auto_87576 ?auto_87582 ) ) ( not ( = ?auto_87576 ?auto_87583 ) ) ( not ( = ?auto_87577 ?auto_87581 ) ) ( not ( = ?auto_87577 ?auto_87582 ) ) ( not ( = ?auto_87577 ?auto_87583 ) ) ( not ( = ?auto_87579 ?auto_87581 ) ) ( not ( = ?auto_87579 ?auto_87582 ) ) ( not ( = ?auto_87579 ?auto_87583 ) ) ( not ( = ?auto_87578 ?auto_87581 ) ) ( not ( = ?auto_87578 ?auto_87582 ) ) ( not ( = ?auto_87578 ?auto_87583 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87582 ?auto_87583 ?auto_87581 ?auto_87580 )
      ( MAKE-2PILE ?auto_87576 ?auto_87577 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87584 - BLOCK
      ?auto_87585 - BLOCK
    )
    :vars
    (
      ?auto_87588 - BLOCK
      ?auto_87587 - BLOCK
      ?auto_87590 - BLOCK
      ?auto_87586 - BLOCK
      ?auto_87589 - BLOCK
      ?auto_87591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87588 ?auto_87585 ) ( ON-TABLE ?auto_87584 ) ( ON ?auto_87585 ?auto_87584 ) ( not ( = ?auto_87584 ?auto_87585 ) ) ( not ( = ?auto_87584 ?auto_87588 ) ) ( not ( = ?auto_87585 ?auto_87588 ) ) ( not ( = ?auto_87584 ?auto_87587 ) ) ( not ( = ?auto_87584 ?auto_87590 ) ) ( not ( = ?auto_87585 ?auto_87587 ) ) ( not ( = ?auto_87585 ?auto_87590 ) ) ( not ( = ?auto_87588 ?auto_87587 ) ) ( not ( = ?auto_87588 ?auto_87590 ) ) ( not ( = ?auto_87587 ?auto_87590 ) ) ( ON ?auto_87587 ?auto_87588 ) ( CLEAR ?auto_87586 ) ( ON-TABLE ?auto_87589 ) ( ON ?auto_87591 ?auto_87589 ) ( ON ?auto_87586 ?auto_87591 ) ( not ( = ?auto_87589 ?auto_87591 ) ) ( not ( = ?auto_87589 ?auto_87586 ) ) ( not ( = ?auto_87589 ?auto_87590 ) ) ( not ( = ?auto_87591 ?auto_87586 ) ) ( not ( = ?auto_87591 ?auto_87590 ) ) ( not ( = ?auto_87586 ?auto_87590 ) ) ( not ( = ?auto_87584 ?auto_87586 ) ) ( not ( = ?auto_87584 ?auto_87589 ) ) ( not ( = ?auto_87584 ?auto_87591 ) ) ( not ( = ?auto_87585 ?auto_87586 ) ) ( not ( = ?auto_87585 ?auto_87589 ) ) ( not ( = ?auto_87585 ?auto_87591 ) ) ( not ( = ?auto_87588 ?auto_87586 ) ) ( not ( = ?auto_87588 ?auto_87589 ) ) ( not ( = ?auto_87588 ?auto_87591 ) ) ( not ( = ?auto_87587 ?auto_87586 ) ) ( not ( = ?auto_87587 ?auto_87589 ) ) ( not ( = ?auto_87587 ?auto_87591 ) ) ( ON ?auto_87590 ?auto_87587 ) ( CLEAR ?auto_87590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87584 ?auto_87585 ?auto_87588 ?auto_87587 )
      ( MAKE-2PILE ?auto_87584 ?auto_87585 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87592 - BLOCK
      ?auto_87593 - BLOCK
    )
    :vars
    (
      ?auto_87598 - BLOCK
      ?auto_87596 - BLOCK
      ?auto_87597 - BLOCK
      ?auto_87599 - BLOCK
      ?auto_87595 - BLOCK
      ?auto_87594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87598 ?auto_87593 ) ( ON-TABLE ?auto_87592 ) ( ON ?auto_87593 ?auto_87592 ) ( not ( = ?auto_87592 ?auto_87593 ) ) ( not ( = ?auto_87592 ?auto_87598 ) ) ( not ( = ?auto_87593 ?auto_87598 ) ) ( not ( = ?auto_87592 ?auto_87596 ) ) ( not ( = ?auto_87592 ?auto_87597 ) ) ( not ( = ?auto_87593 ?auto_87596 ) ) ( not ( = ?auto_87593 ?auto_87597 ) ) ( not ( = ?auto_87598 ?auto_87596 ) ) ( not ( = ?auto_87598 ?auto_87597 ) ) ( not ( = ?auto_87596 ?auto_87597 ) ) ( ON ?auto_87596 ?auto_87598 ) ( ON-TABLE ?auto_87599 ) ( ON ?auto_87595 ?auto_87599 ) ( not ( = ?auto_87599 ?auto_87595 ) ) ( not ( = ?auto_87599 ?auto_87594 ) ) ( not ( = ?auto_87599 ?auto_87597 ) ) ( not ( = ?auto_87595 ?auto_87594 ) ) ( not ( = ?auto_87595 ?auto_87597 ) ) ( not ( = ?auto_87594 ?auto_87597 ) ) ( not ( = ?auto_87592 ?auto_87594 ) ) ( not ( = ?auto_87592 ?auto_87599 ) ) ( not ( = ?auto_87592 ?auto_87595 ) ) ( not ( = ?auto_87593 ?auto_87594 ) ) ( not ( = ?auto_87593 ?auto_87599 ) ) ( not ( = ?auto_87593 ?auto_87595 ) ) ( not ( = ?auto_87598 ?auto_87594 ) ) ( not ( = ?auto_87598 ?auto_87599 ) ) ( not ( = ?auto_87598 ?auto_87595 ) ) ( not ( = ?auto_87596 ?auto_87594 ) ) ( not ( = ?auto_87596 ?auto_87599 ) ) ( not ( = ?auto_87596 ?auto_87595 ) ) ( ON ?auto_87597 ?auto_87596 ) ( CLEAR ?auto_87597 ) ( HOLDING ?auto_87594 ) ( CLEAR ?auto_87595 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87599 ?auto_87595 ?auto_87594 )
      ( MAKE-2PILE ?auto_87592 ?auto_87593 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87600 - BLOCK
      ?auto_87601 - BLOCK
    )
    :vars
    (
      ?auto_87602 - BLOCK
      ?auto_87605 - BLOCK
      ?auto_87606 - BLOCK
      ?auto_87607 - BLOCK
      ?auto_87603 - BLOCK
      ?auto_87604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87602 ?auto_87601 ) ( ON-TABLE ?auto_87600 ) ( ON ?auto_87601 ?auto_87600 ) ( not ( = ?auto_87600 ?auto_87601 ) ) ( not ( = ?auto_87600 ?auto_87602 ) ) ( not ( = ?auto_87601 ?auto_87602 ) ) ( not ( = ?auto_87600 ?auto_87605 ) ) ( not ( = ?auto_87600 ?auto_87606 ) ) ( not ( = ?auto_87601 ?auto_87605 ) ) ( not ( = ?auto_87601 ?auto_87606 ) ) ( not ( = ?auto_87602 ?auto_87605 ) ) ( not ( = ?auto_87602 ?auto_87606 ) ) ( not ( = ?auto_87605 ?auto_87606 ) ) ( ON ?auto_87605 ?auto_87602 ) ( ON-TABLE ?auto_87607 ) ( ON ?auto_87603 ?auto_87607 ) ( not ( = ?auto_87607 ?auto_87603 ) ) ( not ( = ?auto_87607 ?auto_87604 ) ) ( not ( = ?auto_87607 ?auto_87606 ) ) ( not ( = ?auto_87603 ?auto_87604 ) ) ( not ( = ?auto_87603 ?auto_87606 ) ) ( not ( = ?auto_87604 ?auto_87606 ) ) ( not ( = ?auto_87600 ?auto_87604 ) ) ( not ( = ?auto_87600 ?auto_87607 ) ) ( not ( = ?auto_87600 ?auto_87603 ) ) ( not ( = ?auto_87601 ?auto_87604 ) ) ( not ( = ?auto_87601 ?auto_87607 ) ) ( not ( = ?auto_87601 ?auto_87603 ) ) ( not ( = ?auto_87602 ?auto_87604 ) ) ( not ( = ?auto_87602 ?auto_87607 ) ) ( not ( = ?auto_87602 ?auto_87603 ) ) ( not ( = ?auto_87605 ?auto_87604 ) ) ( not ( = ?auto_87605 ?auto_87607 ) ) ( not ( = ?auto_87605 ?auto_87603 ) ) ( ON ?auto_87606 ?auto_87605 ) ( CLEAR ?auto_87603 ) ( ON ?auto_87604 ?auto_87606 ) ( CLEAR ?auto_87604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87600 ?auto_87601 ?auto_87602 ?auto_87605 ?auto_87606 )
      ( MAKE-2PILE ?auto_87600 ?auto_87601 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87608 - BLOCK
      ?auto_87609 - BLOCK
    )
    :vars
    (
      ?auto_87615 - BLOCK
      ?auto_87611 - BLOCK
      ?auto_87614 - BLOCK
      ?auto_87612 - BLOCK
      ?auto_87613 - BLOCK
      ?auto_87610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87615 ?auto_87609 ) ( ON-TABLE ?auto_87608 ) ( ON ?auto_87609 ?auto_87608 ) ( not ( = ?auto_87608 ?auto_87609 ) ) ( not ( = ?auto_87608 ?auto_87615 ) ) ( not ( = ?auto_87609 ?auto_87615 ) ) ( not ( = ?auto_87608 ?auto_87611 ) ) ( not ( = ?auto_87608 ?auto_87614 ) ) ( not ( = ?auto_87609 ?auto_87611 ) ) ( not ( = ?auto_87609 ?auto_87614 ) ) ( not ( = ?auto_87615 ?auto_87611 ) ) ( not ( = ?auto_87615 ?auto_87614 ) ) ( not ( = ?auto_87611 ?auto_87614 ) ) ( ON ?auto_87611 ?auto_87615 ) ( ON-TABLE ?auto_87612 ) ( not ( = ?auto_87612 ?auto_87613 ) ) ( not ( = ?auto_87612 ?auto_87610 ) ) ( not ( = ?auto_87612 ?auto_87614 ) ) ( not ( = ?auto_87613 ?auto_87610 ) ) ( not ( = ?auto_87613 ?auto_87614 ) ) ( not ( = ?auto_87610 ?auto_87614 ) ) ( not ( = ?auto_87608 ?auto_87610 ) ) ( not ( = ?auto_87608 ?auto_87612 ) ) ( not ( = ?auto_87608 ?auto_87613 ) ) ( not ( = ?auto_87609 ?auto_87610 ) ) ( not ( = ?auto_87609 ?auto_87612 ) ) ( not ( = ?auto_87609 ?auto_87613 ) ) ( not ( = ?auto_87615 ?auto_87610 ) ) ( not ( = ?auto_87615 ?auto_87612 ) ) ( not ( = ?auto_87615 ?auto_87613 ) ) ( not ( = ?auto_87611 ?auto_87610 ) ) ( not ( = ?auto_87611 ?auto_87612 ) ) ( not ( = ?auto_87611 ?auto_87613 ) ) ( ON ?auto_87614 ?auto_87611 ) ( ON ?auto_87610 ?auto_87614 ) ( CLEAR ?auto_87610 ) ( HOLDING ?auto_87613 ) ( CLEAR ?auto_87612 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87612 ?auto_87613 )
      ( MAKE-2PILE ?auto_87608 ?auto_87609 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87616 - BLOCK
      ?auto_87617 - BLOCK
    )
    :vars
    (
      ?auto_87620 - BLOCK
      ?auto_87622 - BLOCK
      ?auto_87621 - BLOCK
      ?auto_87619 - BLOCK
      ?auto_87618 - BLOCK
      ?auto_87623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87620 ?auto_87617 ) ( ON-TABLE ?auto_87616 ) ( ON ?auto_87617 ?auto_87616 ) ( not ( = ?auto_87616 ?auto_87617 ) ) ( not ( = ?auto_87616 ?auto_87620 ) ) ( not ( = ?auto_87617 ?auto_87620 ) ) ( not ( = ?auto_87616 ?auto_87622 ) ) ( not ( = ?auto_87616 ?auto_87621 ) ) ( not ( = ?auto_87617 ?auto_87622 ) ) ( not ( = ?auto_87617 ?auto_87621 ) ) ( not ( = ?auto_87620 ?auto_87622 ) ) ( not ( = ?auto_87620 ?auto_87621 ) ) ( not ( = ?auto_87622 ?auto_87621 ) ) ( ON ?auto_87622 ?auto_87620 ) ( ON-TABLE ?auto_87619 ) ( not ( = ?auto_87619 ?auto_87618 ) ) ( not ( = ?auto_87619 ?auto_87623 ) ) ( not ( = ?auto_87619 ?auto_87621 ) ) ( not ( = ?auto_87618 ?auto_87623 ) ) ( not ( = ?auto_87618 ?auto_87621 ) ) ( not ( = ?auto_87623 ?auto_87621 ) ) ( not ( = ?auto_87616 ?auto_87623 ) ) ( not ( = ?auto_87616 ?auto_87619 ) ) ( not ( = ?auto_87616 ?auto_87618 ) ) ( not ( = ?auto_87617 ?auto_87623 ) ) ( not ( = ?auto_87617 ?auto_87619 ) ) ( not ( = ?auto_87617 ?auto_87618 ) ) ( not ( = ?auto_87620 ?auto_87623 ) ) ( not ( = ?auto_87620 ?auto_87619 ) ) ( not ( = ?auto_87620 ?auto_87618 ) ) ( not ( = ?auto_87622 ?auto_87623 ) ) ( not ( = ?auto_87622 ?auto_87619 ) ) ( not ( = ?auto_87622 ?auto_87618 ) ) ( ON ?auto_87621 ?auto_87622 ) ( ON ?auto_87623 ?auto_87621 ) ( CLEAR ?auto_87619 ) ( ON ?auto_87618 ?auto_87623 ) ( CLEAR ?auto_87618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87616 ?auto_87617 ?auto_87620 ?auto_87622 ?auto_87621 ?auto_87623 )
      ( MAKE-2PILE ?auto_87616 ?auto_87617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87624 - BLOCK
      ?auto_87625 - BLOCK
    )
    :vars
    (
      ?auto_87628 - BLOCK
      ?auto_87626 - BLOCK
      ?auto_87627 - BLOCK
      ?auto_87630 - BLOCK
      ?auto_87629 - BLOCK
      ?auto_87631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87628 ?auto_87625 ) ( ON-TABLE ?auto_87624 ) ( ON ?auto_87625 ?auto_87624 ) ( not ( = ?auto_87624 ?auto_87625 ) ) ( not ( = ?auto_87624 ?auto_87628 ) ) ( not ( = ?auto_87625 ?auto_87628 ) ) ( not ( = ?auto_87624 ?auto_87626 ) ) ( not ( = ?auto_87624 ?auto_87627 ) ) ( not ( = ?auto_87625 ?auto_87626 ) ) ( not ( = ?auto_87625 ?auto_87627 ) ) ( not ( = ?auto_87628 ?auto_87626 ) ) ( not ( = ?auto_87628 ?auto_87627 ) ) ( not ( = ?auto_87626 ?auto_87627 ) ) ( ON ?auto_87626 ?auto_87628 ) ( not ( = ?auto_87630 ?auto_87629 ) ) ( not ( = ?auto_87630 ?auto_87631 ) ) ( not ( = ?auto_87630 ?auto_87627 ) ) ( not ( = ?auto_87629 ?auto_87631 ) ) ( not ( = ?auto_87629 ?auto_87627 ) ) ( not ( = ?auto_87631 ?auto_87627 ) ) ( not ( = ?auto_87624 ?auto_87631 ) ) ( not ( = ?auto_87624 ?auto_87630 ) ) ( not ( = ?auto_87624 ?auto_87629 ) ) ( not ( = ?auto_87625 ?auto_87631 ) ) ( not ( = ?auto_87625 ?auto_87630 ) ) ( not ( = ?auto_87625 ?auto_87629 ) ) ( not ( = ?auto_87628 ?auto_87631 ) ) ( not ( = ?auto_87628 ?auto_87630 ) ) ( not ( = ?auto_87628 ?auto_87629 ) ) ( not ( = ?auto_87626 ?auto_87631 ) ) ( not ( = ?auto_87626 ?auto_87630 ) ) ( not ( = ?auto_87626 ?auto_87629 ) ) ( ON ?auto_87627 ?auto_87626 ) ( ON ?auto_87631 ?auto_87627 ) ( ON ?auto_87629 ?auto_87631 ) ( CLEAR ?auto_87629 ) ( HOLDING ?auto_87630 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87630 )
      ( MAKE-2PILE ?auto_87624 ?auto_87625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87632 - BLOCK
      ?auto_87633 - BLOCK
    )
    :vars
    (
      ?auto_87636 - BLOCK
      ?auto_87634 - BLOCK
      ?auto_87638 - BLOCK
      ?auto_87639 - BLOCK
      ?auto_87635 - BLOCK
      ?auto_87637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87636 ?auto_87633 ) ( ON-TABLE ?auto_87632 ) ( ON ?auto_87633 ?auto_87632 ) ( not ( = ?auto_87632 ?auto_87633 ) ) ( not ( = ?auto_87632 ?auto_87636 ) ) ( not ( = ?auto_87633 ?auto_87636 ) ) ( not ( = ?auto_87632 ?auto_87634 ) ) ( not ( = ?auto_87632 ?auto_87638 ) ) ( not ( = ?auto_87633 ?auto_87634 ) ) ( not ( = ?auto_87633 ?auto_87638 ) ) ( not ( = ?auto_87636 ?auto_87634 ) ) ( not ( = ?auto_87636 ?auto_87638 ) ) ( not ( = ?auto_87634 ?auto_87638 ) ) ( ON ?auto_87634 ?auto_87636 ) ( not ( = ?auto_87639 ?auto_87635 ) ) ( not ( = ?auto_87639 ?auto_87637 ) ) ( not ( = ?auto_87639 ?auto_87638 ) ) ( not ( = ?auto_87635 ?auto_87637 ) ) ( not ( = ?auto_87635 ?auto_87638 ) ) ( not ( = ?auto_87637 ?auto_87638 ) ) ( not ( = ?auto_87632 ?auto_87637 ) ) ( not ( = ?auto_87632 ?auto_87639 ) ) ( not ( = ?auto_87632 ?auto_87635 ) ) ( not ( = ?auto_87633 ?auto_87637 ) ) ( not ( = ?auto_87633 ?auto_87639 ) ) ( not ( = ?auto_87633 ?auto_87635 ) ) ( not ( = ?auto_87636 ?auto_87637 ) ) ( not ( = ?auto_87636 ?auto_87639 ) ) ( not ( = ?auto_87636 ?auto_87635 ) ) ( not ( = ?auto_87634 ?auto_87637 ) ) ( not ( = ?auto_87634 ?auto_87639 ) ) ( not ( = ?auto_87634 ?auto_87635 ) ) ( ON ?auto_87638 ?auto_87634 ) ( ON ?auto_87637 ?auto_87638 ) ( ON ?auto_87635 ?auto_87637 ) ( ON ?auto_87639 ?auto_87635 ) ( CLEAR ?auto_87639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87632 ?auto_87633 ?auto_87636 ?auto_87634 ?auto_87638 ?auto_87637 ?auto_87635 )
      ( MAKE-2PILE ?auto_87632 ?auto_87633 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87646 - BLOCK
      ?auto_87647 - BLOCK
      ?auto_87648 - BLOCK
      ?auto_87649 - BLOCK
      ?auto_87650 - BLOCK
      ?auto_87651 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_87651 ) ( CLEAR ?auto_87650 ) ( ON-TABLE ?auto_87646 ) ( ON ?auto_87647 ?auto_87646 ) ( ON ?auto_87648 ?auto_87647 ) ( ON ?auto_87649 ?auto_87648 ) ( ON ?auto_87650 ?auto_87649 ) ( not ( = ?auto_87646 ?auto_87647 ) ) ( not ( = ?auto_87646 ?auto_87648 ) ) ( not ( = ?auto_87646 ?auto_87649 ) ) ( not ( = ?auto_87646 ?auto_87650 ) ) ( not ( = ?auto_87646 ?auto_87651 ) ) ( not ( = ?auto_87647 ?auto_87648 ) ) ( not ( = ?auto_87647 ?auto_87649 ) ) ( not ( = ?auto_87647 ?auto_87650 ) ) ( not ( = ?auto_87647 ?auto_87651 ) ) ( not ( = ?auto_87648 ?auto_87649 ) ) ( not ( = ?auto_87648 ?auto_87650 ) ) ( not ( = ?auto_87648 ?auto_87651 ) ) ( not ( = ?auto_87649 ?auto_87650 ) ) ( not ( = ?auto_87649 ?auto_87651 ) ) ( not ( = ?auto_87650 ?auto_87651 ) ) )
    :subtasks
    ( ( !STACK ?auto_87651 ?auto_87650 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87652 - BLOCK
      ?auto_87653 - BLOCK
      ?auto_87654 - BLOCK
      ?auto_87655 - BLOCK
      ?auto_87656 - BLOCK
      ?auto_87657 - BLOCK
    )
    :vars
    (
      ?auto_87658 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_87656 ) ( ON-TABLE ?auto_87652 ) ( ON ?auto_87653 ?auto_87652 ) ( ON ?auto_87654 ?auto_87653 ) ( ON ?auto_87655 ?auto_87654 ) ( ON ?auto_87656 ?auto_87655 ) ( not ( = ?auto_87652 ?auto_87653 ) ) ( not ( = ?auto_87652 ?auto_87654 ) ) ( not ( = ?auto_87652 ?auto_87655 ) ) ( not ( = ?auto_87652 ?auto_87656 ) ) ( not ( = ?auto_87652 ?auto_87657 ) ) ( not ( = ?auto_87653 ?auto_87654 ) ) ( not ( = ?auto_87653 ?auto_87655 ) ) ( not ( = ?auto_87653 ?auto_87656 ) ) ( not ( = ?auto_87653 ?auto_87657 ) ) ( not ( = ?auto_87654 ?auto_87655 ) ) ( not ( = ?auto_87654 ?auto_87656 ) ) ( not ( = ?auto_87654 ?auto_87657 ) ) ( not ( = ?auto_87655 ?auto_87656 ) ) ( not ( = ?auto_87655 ?auto_87657 ) ) ( not ( = ?auto_87656 ?auto_87657 ) ) ( ON ?auto_87657 ?auto_87658 ) ( CLEAR ?auto_87657 ) ( HAND-EMPTY ) ( not ( = ?auto_87652 ?auto_87658 ) ) ( not ( = ?auto_87653 ?auto_87658 ) ) ( not ( = ?auto_87654 ?auto_87658 ) ) ( not ( = ?auto_87655 ?auto_87658 ) ) ( not ( = ?auto_87656 ?auto_87658 ) ) ( not ( = ?auto_87657 ?auto_87658 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87657 ?auto_87658 )
      ( MAKE-6PILE ?auto_87652 ?auto_87653 ?auto_87654 ?auto_87655 ?auto_87656 ?auto_87657 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87659 - BLOCK
      ?auto_87660 - BLOCK
      ?auto_87661 - BLOCK
      ?auto_87662 - BLOCK
      ?auto_87663 - BLOCK
      ?auto_87664 - BLOCK
    )
    :vars
    (
      ?auto_87665 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87659 ) ( ON ?auto_87660 ?auto_87659 ) ( ON ?auto_87661 ?auto_87660 ) ( ON ?auto_87662 ?auto_87661 ) ( not ( = ?auto_87659 ?auto_87660 ) ) ( not ( = ?auto_87659 ?auto_87661 ) ) ( not ( = ?auto_87659 ?auto_87662 ) ) ( not ( = ?auto_87659 ?auto_87663 ) ) ( not ( = ?auto_87659 ?auto_87664 ) ) ( not ( = ?auto_87660 ?auto_87661 ) ) ( not ( = ?auto_87660 ?auto_87662 ) ) ( not ( = ?auto_87660 ?auto_87663 ) ) ( not ( = ?auto_87660 ?auto_87664 ) ) ( not ( = ?auto_87661 ?auto_87662 ) ) ( not ( = ?auto_87661 ?auto_87663 ) ) ( not ( = ?auto_87661 ?auto_87664 ) ) ( not ( = ?auto_87662 ?auto_87663 ) ) ( not ( = ?auto_87662 ?auto_87664 ) ) ( not ( = ?auto_87663 ?auto_87664 ) ) ( ON ?auto_87664 ?auto_87665 ) ( CLEAR ?auto_87664 ) ( not ( = ?auto_87659 ?auto_87665 ) ) ( not ( = ?auto_87660 ?auto_87665 ) ) ( not ( = ?auto_87661 ?auto_87665 ) ) ( not ( = ?auto_87662 ?auto_87665 ) ) ( not ( = ?auto_87663 ?auto_87665 ) ) ( not ( = ?auto_87664 ?auto_87665 ) ) ( HOLDING ?auto_87663 ) ( CLEAR ?auto_87662 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87659 ?auto_87660 ?auto_87661 ?auto_87662 ?auto_87663 )
      ( MAKE-6PILE ?auto_87659 ?auto_87660 ?auto_87661 ?auto_87662 ?auto_87663 ?auto_87664 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87666 - BLOCK
      ?auto_87667 - BLOCK
      ?auto_87668 - BLOCK
      ?auto_87669 - BLOCK
      ?auto_87670 - BLOCK
      ?auto_87671 - BLOCK
    )
    :vars
    (
      ?auto_87672 - BLOCK
      ?auto_87673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87666 ) ( ON ?auto_87667 ?auto_87666 ) ( ON ?auto_87668 ?auto_87667 ) ( ON ?auto_87669 ?auto_87668 ) ( not ( = ?auto_87666 ?auto_87667 ) ) ( not ( = ?auto_87666 ?auto_87668 ) ) ( not ( = ?auto_87666 ?auto_87669 ) ) ( not ( = ?auto_87666 ?auto_87670 ) ) ( not ( = ?auto_87666 ?auto_87671 ) ) ( not ( = ?auto_87667 ?auto_87668 ) ) ( not ( = ?auto_87667 ?auto_87669 ) ) ( not ( = ?auto_87667 ?auto_87670 ) ) ( not ( = ?auto_87667 ?auto_87671 ) ) ( not ( = ?auto_87668 ?auto_87669 ) ) ( not ( = ?auto_87668 ?auto_87670 ) ) ( not ( = ?auto_87668 ?auto_87671 ) ) ( not ( = ?auto_87669 ?auto_87670 ) ) ( not ( = ?auto_87669 ?auto_87671 ) ) ( not ( = ?auto_87670 ?auto_87671 ) ) ( ON ?auto_87671 ?auto_87672 ) ( not ( = ?auto_87666 ?auto_87672 ) ) ( not ( = ?auto_87667 ?auto_87672 ) ) ( not ( = ?auto_87668 ?auto_87672 ) ) ( not ( = ?auto_87669 ?auto_87672 ) ) ( not ( = ?auto_87670 ?auto_87672 ) ) ( not ( = ?auto_87671 ?auto_87672 ) ) ( CLEAR ?auto_87669 ) ( ON ?auto_87670 ?auto_87671 ) ( CLEAR ?auto_87670 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87673 ) ( ON ?auto_87672 ?auto_87673 ) ( not ( = ?auto_87673 ?auto_87672 ) ) ( not ( = ?auto_87673 ?auto_87671 ) ) ( not ( = ?auto_87673 ?auto_87670 ) ) ( not ( = ?auto_87666 ?auto_87673 ) ) ( not ( = ?auto_87667 ?auto_87673 ) ) ( not ( = ?auto_87668 ?auto_87673 ) ) ( not ( = ?auto_87669 ?auto_87673 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87673 ?auto_87672 ?auto_87671 )
      ( MAKE-6PILE ?auto_87666 ?auto_87667 ?auto_87668 ?auto_87669 ?auto_87670 ?auto_87671 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87674 - BLOCK
      ?auto_87675 - BLOCK
      ?auto_87676 - BLOCK
      ?auto_87677 - BLOCK
      ?auto_87678 - BLOCK
      ?auto_87679 - BLOCK
    )
    :vars
    (
      ?auto_87681 - BLOCK
      ?auto_87680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87674 ) ( ON ?auto_87675 ?auto_87674 ) ( ON ?auto_87676 ?auto_87675 ) ( not ( = ?auto_87674 ?auto_87675 ) ) ( not ( = ?auto_87674 ?auto_87676 ) ) ( not ( = ?auto_87674 ?auto_87677 ) ) ( not ( = ?auto_87674 ?auto_87678 ) ) ( not ( = ?auto_87674 ?auto_87679 ) ) ( not ( = ?auto_87675 ?auto_87676 ) ) ( not ( = ?auto_87675 ?auto_87677 ) ) ( not ( = ?auto_87675 ?auto_87678 ) ) ( not ( = ?auto_87675 ?auto_87679 ) ) ( not ( = ?auto_87676 ?auto_87677 ) ) ( not ( = ?auto_87676 ?auto_87678 ) ) ( not ( = ?auto_87676 ?auto_87679 ) ) ( not ( = ?auto_87677 ?auto_87678 ) ) ( not ( = ?auto_87677 ?auto_87679 ) ) ( not ( = ?auto_87678 ?auto_87679 ) ) ( ON ?auto_87679 ?auto_87681 ) ( not ( = ?auto_87674 ?auto_87681 ) ) ( not ( = ?auto_87675 ?auto_87681 ) ) ( not ( = ?auto_87676 ?auto_87681 ) ) ( not ( = ?auto_87677 ?auto_87681 ) ) ( not ( = ?auto_87678 ?auto_87681 ) ) ( not ( = ?auto_87679 ?auto_87681 ) ) ( ON ?auto_87678 ?auto_87679 ) ( CLEAR ?auto_87678 ) ( ON-TABLE ?auto_87680 ) ( ON ?auto_87681 ?auto_87680 ) ( not ( = ?auto_87680 ?auto_87681 ) ) ( not ( = ?auto_87680 ?auto_87679 ) ) ( not ( = ?auto_87680 ?auto_87678 ) ) ( not ( = ?auto_87674 ?auto_87680 ) ) ( not ( = ?auto_87675 ?auto_87680 ) ) ( not ( = ?auto_87676 ?auto_87680 ) ) ( not ( = ?auto_87677 ?auto_87680 ) ) ( HOLDING ?auto_87677 ) ( CLEAR ?auto_87676 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87674 ?auto_87675 ?auto_87676 ?auto_87677 )
      ( MAKE-6PILE ?auto_87674 ?auto_87675 ?auto_87676 ?auto_87677 ?auto_87678 ?auto_87679 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87682 - BLOCK
      ?auto_87683 - BLOCK
      ?auto_87684 - BLOCK
      ?auto_87685 - BLOCK
      ?auto_87686 - BLOCK
      ?auto_87687 - BLOCK
    )
    :vars
    (
      ?auto_87689 - BLOCK
      ?auto_87688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87682 ) ( ON ?auto_87683 ?auto_87682 ) ( ON ?auto_87684 ?auto_87683 ) ( not ( = ?auto_87682 ?auto_87683 ) ) ( not ( = ?auto_87682 ?auto_87684 ) ) ( not ( = ?auto_87682 ?auto_87685 ) ) ( not ( = ?auto_87682 ?auto_87686 ) ) ( not ( = ?auto_87682 ?auto_87687 ) ) ( not ( = ?auto_87683 ?auto_87684 ) ) ( not ( = ?auto_87683 ?auto_87685 ) ) ( not ( = ?auto_87683 ?auto_87686 ) ) ( not ( = ?auto_87683 ?auto_87687 ) ) ( not ( = ?auto_87684 ?auto_87685 ) ) ( not ( = ?auto_87684 ?auto_87686 ) ) ( not ( = ?auto_87684 ?auto_87687 ) ) ( not ( = ?auto_87685 ?auto_87686 ) ) ( not ( = ?auto_87685 ?auto_87687 ) ) ( not ( = ?auto_87686 ?auto_87687 ) ) ( ON ?auto_87687 ?auto_87689 ) ( not ( = ?auto_87682 ?auto_87689 ) ) ( not ( = ?auto_87683 ?auto_87689 ) ) ( not ( = ?auto_87684 ?auto_87689 ) ) ( not ( = ?auto_87685 ?auto_87689 ) ) ( not ( = ?auto_87686 ?auto_87689 ) ) ( not ( = ?auto_87687 ?auto_87689 ) ) ( ON ?auto_87686 ?auto_87687 ) ( ON-TABLE ?auto_87688 ) ( ON ?auto_87689 ?auto_87688 ) ( not ( = ?auto_87688 ?auto_87689 ) ) ( not ( = ?auto_87688 ?auto_87687 ) ) ( not ( = ?auto_87688 ?auto_87686 ) ) ( not ( = ?auto_87682 ?auto_87688 ) ) ( not ( = ?auto_87683 ?auto_87688 ) ) ( not ( = ?auto_87684 ?auto_87688 ) ) ( not ( = ?auto_87685 ?auto_87688 ) ) ( CLEAR ?auto_87684 ) ( ON ?auto_87685 ?auto_87686 ) ( CLEAR ?auto_87685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87688 ?auto_87689 ?auto_87687 ?auto_87686 )
      ( MAKE-6PILE ?auto_87682 ?auto_87683 ?auto_87684 ?auto_87685 ?auto_87686 ?auto_87687 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87690 - BLOCK
      ?auto_87691 - BLOCK
      ?auto_87692 - BLOCK
      ?auto_87693 - BLOCK
      ?auto_87694 - BLOCK
      ?auto_87695 - BLOCK
    )
    :vars
    (
      ?auto_87696 - BLOCK
      ?auto_87697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87690 ) ( ON ?auto_87691 ?auto_87690 ) ( not ( = ?auto_87690 ?auto_87691 ) ) ( not ( = ?auto_87690 ?auto_87692 ) ) ( not ( = ?auto_87690 ?auto_87693 ) ) ( not ( = ?auto_87690 ?auto_87694 ) ) ( not ( = ?auto_87690 ?auto_87695 ) ) ( not ( = ?auto_87691 ?auto_87692 ) ) ( not ( = ?auto_87691 ?auto_87693 ) ) ( not ( = ?auto_87691 ?auto_87694 ) ) ( not ( = ?auto_87691 ?auto_87695 ) ) ( not ( = ?auto_87692 ?auto_87693 ) ) ( not ( = ?auto_87692 ?auto_87694 ) ) ( not ( = ?auto_87692 ?auto_87695 ) ) ( not ( = ?auto_87693 ?auto_87694 ) ) ( not ( = ?auto_87693 ?auto_87695 ) ) ( not ( = ?auto_87694 ?auto_87695 ) ) ( ON ?auto_87695 ?auto_87696 ) ( not ( = ?auto_87690 ?auto_87696 ) ) ( not ( = ?auto_87691 ?auto_87696 ) ) ( not ( = ?auto_87692 ?auto_87696 ) ) ( not ( = ?auto_87693 ?auto_87696 ) ) ( not ( = ?auto_87694 ?auto_87696 ) ) ( not ( = ?auto_87695 ?auto_87696 ) ) ( ON ?auto_87694 ?auto_87695 ) ( ON-TABLE ?auto_87697 ) ( ON ?auto_87696 ?auto_87697 ) ( not ( = ?auto_87697 ?auto_87696 ) ) ( not ( = ?auto_87697 ?auto_87695 ) ) ( not ( = ?auto_87697 ?auto_87694 ) ) ( not ( = ?auto_87690 ?auto_87697 ) ) ( not ( = ?auto_87691 ?auto_87697 ) ) ( not ( = ?auto_87692 ?auto_87697 ) ) ( not ( = ?auto_87693 ?auto_87697 ) ) ( ON ?auto_87693 ?auto_87694 ) ( CLEAR ?auto_87693 ) ( HOLDING ?auto_87692 ) ( CLEAR ?auto_87691 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87690 ?auto_87691 ?auto_87692 )
      ( MAKE-6PILE ?auto_87690 ?auto_87691 ?auto_87692 ?auto_87693 ?auto_87694 ?auto_87695 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87698 - BLOCK
      ?auto_87699 - BLOCK
      ?auto_87700 - BLOCK
      ?auto_87701 - BLOCK
      ?auto_87702 - BLOCK
      ?auto_87703 - BLOCK
    )
    :vars
    (
      ?auto_87704 - BLOCK
      ?auto_87705 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87698 ) ( ON ?auto_87699 ?auto_87698 ) ( not ( = ?auto_87698 ?auto_87699 ) ) ( not ( = ?auto_87698 ?auto_87700 ) ) ( not ( = ?auto_87698 ?auto_87701 ) ) ( not ( = ?auto_87698 ?auto_87702 ) ) ( not ( = ?auto_87698 ?auto_87703 ) ) ( not ( = ?auto_87699 ?auto_87700 ) ) ( not ( = ?auto_87699 ?auto_87701 ) ) ( not ( = ?auto_87699 ?auto_87702 ) ) ( not ( = ?auto_87699 ?auto_87703 ) ) ( not ( = ?auto_87700 ?auto_87701 ) ) ( not ( = ?auto_87700 ?auto_87702 ) ) ( not ( = ?auto_87700 ?auto_87703 ) ) ( not ( = ?auto_87701 ?auto_87702 ) ) ( not ( = ?auto_87701 ?auto_87703 ) ) ( not ( = ?auto_87702 ?auto_87703 ) ) ( ON ?auto_87703 ?auto_87704 ) ( not ( = ?auto_87698 ?auto_87704 ) ) ( not ( = ?auto_87699 ?auto_87704 ) ) ( not ( = ?auto_87700 ?auto_87704 ) ) ( not ( = ?auto_87701 ?auto_87704 ) ) ( not ( = ?auto_87702 ?auto_87704 ) ) ( not ( = ?auto_87703 ?auto_87704 ) ) ( ON ?auto_87702 ?auto_87703 ) ( ON-TABLE ?auto_87705 ) ( ON ?auto_87704 ?auto_87705 ) ( not ( = ?auto_87705 ?auto_87704 ) ) ( not ( = ?auto_87705 ?auto_87703 ) ) ( not ( = ?auto_87705 ?auto_87702 ) ) ( not ( = ?auto_87698 ?auto_87705 ) ) ( not ( = ?auto_87699 ?auto_87705 ) ) ( not ( = ?auto_87700 ?auto_87705 ) ) ( not ( = ?auto_87701 ?auto_87705 ) ) ( ON ?auto_87701 ?auto_87702 ) ( CLEAR ?auto_87699 ) ( ON ?auto_87700 ?auto_87701 ) ( CLEAR ?auto_87700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87705 ?auto_87704 ?auto_87703 ?auto_87702 ?auto_87701 )
      ( MAKE-6PILE ?auto_87698 ?auto_87699 ?auto_87700 ?auto_87701 ?auto_87702 ?auto_87703 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87706 - BLOCK
      ?auto_87707 - BLOCK
      ?auto_87708 - BLOCK
      ?auto_87709 - BLOCK
      ?auto_87710 - BLOCK
      ?auto_87711 - BLOCK
    )
    :vars
    (
      ?auto_87713 - BLOCK
      ?auto_87712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87706 ) ( not ( = ?auto_87706 ?auto_87707 ) ) ( not ( = ?auto_87706 ?auto_87708 ) ) ( not ( = ?auto_87706 ?auto_87709 ) ) ( not ( = ?auto_87706 ?auto_87710 ) ) ( not ( = ?auto_87706 ?auto_87711 ) ) ( not ( = ?auto_87707 ?auto_87708 ) ) ( not ( = ?auto_87707 ?auto_87709 ) ) ( not ( = ?auto_87707 ?auto_87710 ) ) ( not ( = ?auto_87707 ?auto_87711 ) ) ( not ( = ?auto_87708 ?auto_87709 ) ) ( not ( = ?auto_87708 ?auto_87710 ) ) ( not ( = ?auto_87708 ?auto_87711 ) ) ( not ( = ?auto_87709 ?auto_87710 ) ) ( not ( = ?auto_87709 ?auto_87711 ) ) ( not ( = ?auto_87710 ?auto_87711 ) ) ( ON ?auto_87711 ?auto_87713 ) ( not ( = ?auto_87706 ?auto_87713 ) ) ( not ( = ?auto_87707 ?auto_87713 ) ) ( not ( = ?auto_87708 ?auto_87713 ) ) ( not ( = ?auto_87709 ?auto_87713 ) ) ( not ( = ?auto_87710 ?auto_87713 ) ) ( not ( = ?auto_87711 ?auto_87713 ) ) ( ON ?auto_87710 ?auto_87711 ) ( ON-TABLE ?auto_87712 ) ( ON ?auto_87713 ?auto_87712 ) ( not ( = ?auto_87712 ?auto_87713 ) ) ( not ( = ?auto_87712 ?auto_87711 ) ) ( not ( = ?auto_87712 ?auto_87710 ) ) ( not ( = ?auto_87706 ?auto_87712 ) ) ( not ( = ?auto_87707 ?auto_87712 ) ) ( not ( = ?auto_87708 ?auto_87712 ) ) ( not ( = ?auto_87709 ?auto_87712 ) ) ( ON ?auto_87709 ?auto_87710 ) ( ON ?auto_87708 ?auto_87709 ) ( CLEAR ?auto_87708 ) ( HOLDING ?auto_87707 ) ( CLEAR ?auto_87706 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87706 ?auto_87707 )
      ( MAKE-6PILE ?auto_87706 ?auto_87707 ?auto_87708 ?auto_87709 ?auto_87710 ?auto_87711 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87714 - BLOCK
      ?auto_87715 - BLOCK
      ?auto_87716 - BLOCK
      ?auto_87717 - BLOCK
      ?auto_87718 - BLOCK
      ?auto_87719 - BLOCK
    )
    :vars
    (
      ?auto_87720 - BLOCK
      ?auto_87721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87714 ) ( not ( = ?auto_87714 ?auto_87715 ) ) ( not ( = ?auto_87714 ?auto_87716 ) ) ( not ( = ?auto_87714 ?auto_87717 ) ) ( not ( = ?auto_87714 ?auto_87718 ) ) ( not ( = ?auto_87714 ?auto_87719 ) ) ( not ( = ?auto_87715 ?auto_87716 ) ) ( not ( = ?auto_87715 ?auto_87717 ) ) ( not ( = ?auto_87715 ?auto_87718 ) ) ( not ( = ?auto_87715 ?auto_87719 ) ) ( not ( = ?auto_87716 ?auto_87717 ) ) ( not ( = ?auto_87716 ?auto_87718 ) ) ( not ( = ?auto_87716 ?auto_87719 ) ) ( not ( = ?auto_87717 ?auto_87718 ) ) ( not ( = ?auto_87717 ?auto_87719 ) ) ( not ( = ?auto_87718 ?auto_87719 ) ) ( ON ?auto_87719 ?auto_87720 ) ( not ( = ?auto_87714 ?auto_87720 ) ) ( not ( = ?auto_87715 ?auto_87720 ) ) ( not ( = ?auto_87716 ?auto_87720 ) ) ( not ( = ?auto_87717 ?auto_87720 ) ) ( not ( = ?auto_87718 ?auto_87720 ) ) ( not ( = ?auto_87719 ?auto_87720 ) ) ( ON ?auto_87718 ?auto_87719 ) ( ON-TABLE ?auto_87721 ) ( ON ?auto_87720 ?auto_87721 ) ( not ( = ?auto_87721 ?auto_87720 ) ) ( not ( = ?auto_87721 ?auto_87719 ) ) ( not ( = ?auto_87721 ?auto_87718 ) ) ( not ( = ?auto_87714 ?auto_87721 ) ) ( not ( = ?auto_87715 ?auto_87721 ) ) ( not ( = ?auto_87716 ?auto_87721 ) ) ( not ( = ?auto_87717 ?auto_87721 ) ) ( ON ?auto_87717 ?auto_87718 ) ( ON ?auto_87716 ?auto_87717 ) ( CLEAR ?auto_87714 ) ( ON ?auto_87715 ?auto_87716 ) ( CLEAR ?auto_87715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87721 ?auto_87720 ?auto_87719 ?auto_87718 ?auto_87717 ?auto_87716 )
      ( MAKE-6PILE ?auto_87714 ?auto_87715 ?auto_87716 ?auto_87717 ?auto_87718 ?auto_87719 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87722 - BLOCK
      ?auto_87723 - BLOCK
      ?auto_87724 - BLOCK
      ?auto_87725 - BLOCK
      ?auto_87726 - BLOCK
      ?auto_87727 - BLOCK
    )
    :vars
    (
      ?auto_87729 - BLOCK
      ?auto_87728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87722 ?auto_87723 ) ) ( not ( = ?auto_87722 ?auto_87724 ) ) ( not ( = ?auto_87722 ?auto_87725 ) ) ( not ( = ?auto_87722 ?auto_87726 ) ) ( not ( = ?auto_87722 ?auto_87727 ) ) ( not ( = ?auto_87723 ?auto_87724 ) ) ( not ( = ?auto_87723 ?auto_87725 ) ) ( not ( = ?auto_87723 ?auto_87726 ) ) ( not ( = ?auto_87723 ?auto_87727 ) ) ( not ( = ?auto_87724 ?auto_87725 ) ) ( not ( = ?auto_87724 ?auto_87726 ) ) ( not ( = ?auto_87724 ?auto_87727 ) ) ( not ( = ?auto_87725 ?auto_87726 ) ) ( not ( = ?auto_87725 ?auto_87727 ) ) ( not ( = ?auto_87726 ?auto_87727 ) ) ( ON ?auto_87727 ?auto_87729 ) ( not ( = ?auto_87722 ?auto_87729 ) ) ( not ( = ?auto_87723 ?auto_87729 ) ) ( not ( = ?auto_87724 ?auto_87729 ) ) ( not ( = ?auto_87725 ?auto_87729 ) ) ( not ( = ?auto_87726 ?auto_87729 ) ) ( not ( = ?auto_87727 ?auto_87729 ) ) ( ON ?auto_87726 ?auto_87727 ) ( ON-TABLE ?auto_87728 ) ( ON ?auto_87729 ?auto_87728 ) ( not ( = ?auto_87728 ?auto_87729 ) ) ( not ( = ?auto_87728 ?auto_87727 ) ) ( not ( = ?auto_87728 ?auto_87726 ) ) ( not ( = ?auto_87722 ?auto_87728 ) ) ( not ( = ?auto_87723 ?auto_87728 ) ) ( not ( = ?auto_87724 ?auto_87728 ) ) ( not ( = ?auto_87725 ?auto_87728 ) ) ( ON ?auto_87725 ?auto_87726 ) ( ON ?auto_87724 ?auto_87725 ) ( ON ?auto_87723 ?auto_87724 ) ( CLEAR ?auto_87723 ) ( HOLDING ?auto_87722 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87722 )
      ( MAKE-6PILE ?auto_87722 ?auto_87723 ?auto_87724 ?auto_87725 ?auto_87726 ?auto_87727 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87730 - BLOCK
      ?auto_87731 - BLOCK
      ?auto_87732 - BLOCK
      ?auto_87733 - BLOCK
      ?auto_87734 - BLOCK
      ?auto_87735 - BLOCK
    )
    :vars
    (
      ?auto_87736 - BLOCK
      ?auto_87737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87730 ?auto_87731 ) ) ( not ( = ?auto_87730 ?auto_87732 ) ) ( not ( = ?auto_87730 ?auto_87733 ) ) ( not ( = ?auto_87730 ?auto_87734 ) ) ( not ( = ?auto_87730 ?auto_87735 ) ) ( not ( = ?auto_87731 ?auto_87732 ) ) ( not ( = ?auto_87731 ?auto_87733 ) ) ( not ( = ?auto_87731 ?auto_87734 ) ) ( not ( = ?auto_87731 ?auto_87735 ) ) ( not ( = ?auto_87732 ?auto_87733 ) ) ( not ( = ?auto_87732 ?auto_87734 ) ) ( not ( = ?auto_87732 ?auto_87735 ) ) ( not ( = ?auto_87733 ?auto_87734 ) ) ( not ( = ?auto_87733 ?auto_87735 ) ) ( not ( = ?auto_87734 ?auto_87735 ) ) ( ON ?auto_87735 ?auto_87736 ) ( not ( = ?auto_87730 ?auto_87736 ) ) ( not ( = ?auto_87731 ?auto_87736 ) ) ( not ( = ?auto_87732 ?auto_87736 ) ) ( not ( = ?auto_87733 ?auto_87736 ) ) ( not ( = ?auto_87734 ?auto_87736 ) ) ( not ( = ?auto_87735 ?auto_87736 ) ) ( ON ?auto_87734 ?auto_87735 ) ( ON-TABLE ?auto_87737 ) ( ON ?auto_87736 ?auto_87737 ) ( not ( = ?auto_87737 ?auto_87736 ) ) ( not ( = ?auto_87737 ?auto_87735 ) ) ( not ( = ?auto_87737 ?auto_87734 ) ) ( not ( = ?auto_87730 ?auto_87737 ) ) ( not ( = ?auto_87731 ?auto_87737 ) ) ( not ( = ?auto_87732 ?auto_87737 ) ) ( not ( = ?auto_87733 ?auto_87737 ) ) ( ON ?auto_87733 ?auto_87734 ) ( ON ?auto_87732 ?auto_87733 ) ( ON ?auto_87731 ?auto_87732 ) ( ON ?auto_87730 ?auto_87731 ) ( CLEAR ?auto_87730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87737 ?auto_87736 ?auto_87735 ?auto_87734 ?auto_87733 ?auto_87732 ?auto_87731 )
      ( MAKE-6PILE ?auto_87730 ?auto_87731 ?auto_87732 ?auto_87733 ?auto_87734 ?auto_87735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87739 - BLOCK
    )
    :vars
    (
      ?auto_87740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87740 ?auto_87739 ) ( CLEAR ?auto_87740 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87739 ) ( not ( = ?auto_87739 ?auto_87740 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87740 ?auto_87739 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87741 - BLOCK
    )
    :vars
    (
      ?auto_87742 - BLOCK
      ?auto_87743 - BLOCK
      ?auto_87744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87742 ?auto_87741 ) ( CLEAR ?auto_87742 ) ( ON-TABLE ?auto_87741 ) ( not ( = ?auto_87741 ?auto_87742 ) ) ( HOLDING ?auto_87743 ) ( CLEAR ?auto_87744 ) ( not ( = ?auto_87741 ?auto_87743 ) ) ( not ( = ?auto_87741 ?auto_87744 ) ) ( not ( = ?auto_87742 ?auto_87743 ) ) ( not ( = ?auto_87742 ?auto_87744 ) ) ( not ( = ?auto_87743 ?auto_87744 ) ) )
    :subtasks
    ( ( !STACK ?auto_87743 ?auto_87744 )
      ( MAKE-1PILE ?auto_87741 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87745 - BLOCK
    )
    :vars
    (
      ?auto_87746 - BLOCK
      ?auto_87747 - BLOCK
      ?auto_87748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87746 ?auto_87745 ) ( ON-TABLE ?auto_87745 ) ( not ( = ?auto_87745 ?auto_87746 ) ) ( CLEAR ?auto_87747 ) ( not ( = ?auto_87745 ?auto_87748 ) ) ( not ( = ?auto_87745 ?auto_87747 ) ) ( not ( = ?auto_87746 ?auto_87748 ) ) ( not ( = ?auto_87746 ?auto_87747 ) ) ( not ( = ?auto_87748 ?auto_87747 ) ) ( ON ?auto_87748 ?auto_87746 ) ( CLEAR ?auto_87748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87745 ?auto_87746 )
      ( MAKE-1PILE ?auto_87745 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87749 - BLOCK
    )
    :vars
    (
      ?auto_87750 - BLOCK
      ?auto_87751 - BLOCK
      ?auto_87752 - BLOCK
      ?auto_87753 - BLOCK
      ?auto_87756 - BLOCK
      ?auto_87755 - BLOCK
      ?auto_87754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87750 ?auto_87749 ) ( ON-TABLE ?auto_87749 ) ( not ( = ?auto_87749 ?auto_87750 ) ) ( not ( = ?auto_87749 ?auto_87751 ) ) ( not ( = ?auto_87749 ?auto_87752 ) ) ( not ( = ?auto_87750 ?auto_87751 ) ) ( not ( = ?auto_87750 ?auto_87752 ) ) ( not ( = ?auto_87751 ?auto_87752 ) ) ( ON ?auto_87751 ?auto_87750 ) ( CLEAR ?auto_87751 ) ( HOLDING ?auto_87752 ) ( CLEAR ?auto_87753 ) ( ON-TABLE ?auto_87756 ) ( ON ?auto_87755 ?auto_87756 ) ( ON ?auto_87754 ?auto_87755 ) ( ON ?auto_87753 ?auto_87754 ) ( not ( = ?auto_87756 ?auto_87755 ) ) ( not ( = ?auto_87756 ?auto_87754 ) ) ( not ( = ?auto_87756 ?auto_87753 ) ) ( not ( = ?auto_87756 ?auto_87752 ) ) ( not ( = ?auto_87755 ?auto_87754 ) ) ( not ( = ?auto_87755 ?auto_87753 ) ) ( not ( = ?auto_87755 ?auto_87752 ) ) ( not ( = ?auto_87754 ?auto_87753 ) ) ( not ( = ?auto_87754 ?auto_87752 ) ) ( not ( = ?auto_87753 ?auto_87752 ) ) ( not ( = ?auto_87749 ?auto_87753 ) ) ( not ( = ?auto_87749 ?auto_87756 ) ) ( not ( = ?auto_87749 ?auto_87755 ) ) ( not ( = ?auto_87749 ?auto_87754 ) ) ( not ( = ?auto_87750 ?auto_87753 ) ) ( not ( = ?auto_87750 ?auto_87756 ) ) ( not ( = ?auto_87750 ?auto_87755 ) ) ( not ( = ?auto_87750 ?auto_87754 ) ) ( not ( = ?auto_87751 ?auto_87753 ) ) ( not ( = ?auto_87751 ?auto_87756 ) ) ( not ( = ?auto_87751 ?auto_87755 ) ) ( not ( = ?auto_87751 ?auto_87754 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87756 ?auto_87755 ?auto_87754 ?auto_87753 ?auto_87752 )
      ( MAKE-1PILE ?auto_87749 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87757 - BLOCK
    )
    :vars
    (
      ?auto_87762 - BLOCK
      ?auto_87764 - BLOCK
      ?auto_87758 - BLOCK
      ?auto_87759 - BLOCK
      ?auto_87763 - BLOCK
      ?auto_87761 - BLOCK
      ?auto_87760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87762 ?auto_87757 ) ( ON-TABLE ?auto_87757 ) ( not ( = ?auto_87757 ?auto_87762 ) ) ( not ( = ?auto_87757 ?auto_87764 ) ) ( not ( = ?auto_87757 ?auto_87758 ) ) ( not ( = ?auto_87762 ?auto_87764 ) ) ( not ( = ?auto_87762 ?auto_87758 ) ) ( not ( = ?auto_87764 ?auto_87758 ) ) ( ON ?auto_87764 ?auto_87762 ) ( CLEAR ?auto_87759 ) ( ON-TABLE ?auto_87763 ) ( ON ?auto_87761 ?auto_87763 ) ( ON ?auto_87760 ?auto_87761 ) ( ON ?auto_87759 ?auto_87760 ) ( not ( = ?auto_87763 ?auto_87761 ) ) ( not ( = ?auto_87763 ?auto_87760 ) ) ( not ( = ?auto_87763 ?auto_87759 ) ) ( not ( = ?auto_87763 ?auto_87758 ) ) ( not ( = ?auto_87761 ?auto_87760 ) ) ( not ( = ?auto_87761 ?auto_87759 ) ) ( not ( = ?auto_87761 ?auto_87758 ) ) ( not ( = ?auto_87760 ?auto_87759 ) ) ( not ( = ?auto_87760 ?auto_87758 ) ) ( not ( = ?auto_87759 ?auto_87758 ) ) ( not ( = ?auto_87757 ?auto_87759 ) ) ( not ( = ?auto_87757 ?auto_87763 ) ) ( not ( = ?auto_87757 ?auto_87761 ) ) ( not ( = ?auto_87757 ?auto_87760 ) ) ( not ( = ?auto_87762 ?auto_87759 ) ) ( not ( = ?auto_87762 ?auto_87763 ) ) ( not ( = ?auto_87762 ?auto_87761 ) ) ( not ( = ?auto_87762 ?auto_87760 ) ) ( not ( = ?auto_87764 ?auto_87759 ) ) ( not ( = ?auto_87764 ?auto_87763 ) ) ( not ( = ?auto_87764 ?auto_87761 ) ) ( not ( = ?auto_87764 ?auto_87760 ) ) ( ON ?auto_87758 ?auto_87764 ) ( CLEAR ?auto_87758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87757 ?auto_87762 ?auto_87764 )
      ( MAKE-1PILE ?auto_87757 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87765 - BLOCK
    )
    :vars
    (
      ?auto_87770 - BLOCK
      ?auto_87769 - BLOCK
      ?auto_87766 - BLOCK
      ?auto_87768 - BLOCK
      ?auto_87772 - BLOCK
      ?auto_87767 - BLOCK
      ?auto_87771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87770 ?auto_87765 ) ( ON-TABLE ?auto_87765 ) ( not ( = ?auto_87765 ?auto_87770 ) ) ( not ( = ?auto_87765 ?auto_87769 ) ) ( not ( = ?auto_87765 ?auto_87766 ) ) ( not ( = ?auto_87770 ?auto_87769 ) ) ( not ( = ?auto_87770 ?auto_87766 ) ) ( not ( = ?auto_87769 ?auto_87766 ) ) ( ON ?auto_87769 ?auto_87770 ) ( ON-TABLE ?auto_87768 ) ( ON ?auto_87772 ?auto_87768 ) ( ON ?auto_87767 ?auto_87772 ) ( not ( = ?auto_87768 ?auto_87772 ) ) ( not ( = ?auto_87768 ?auto_87767 ) ) ( not ( = ?auto_87768 ?auto_87771 ) ) ( not ( = ?auto_87768 ?auto_87766 ) ) ( not ( = ?auto_87772 ?auto_87767 ) ) ( not ( = ?auto_87772 ?auto_87771 ) ) ( not ( = ?auto_87772 ?auto_87766 ) ) ( not ( = ?auto_87767 ?auto_87771 ) ) ( not ( = ?auto_87767 ?auto_87766 ) ) ( not ( = ?auto_87771 ?auto_87766 ) ) ( not ( = ?auto_87765 ?auto_87771 ) ) ( not ( = ?auto_87765 ?auto_87768 ) ) ( not ( = ?auto_87765 ?auto_87772 ) ) ( not ( = ?auto_87765 ?auto_87767 ) ) ( not ( = ?auto_87770 ?auto_87771 ) ) ( not ( = ?auto_87770 ?auto_87768 ) ) ( not ( = ?auto_87770 ?auto_87772 ) ) ( not ( = ?auto_87770 ?auto_87767 ) ) ( not ( = ?auto_87769 ?auto_87771 ) ) ( not ( = ?auto_87769 ?auto_87768 ) ) ( not ( = ?auto_87769 ?auto_87772 ) ) ( not ( = ?auto_87769 ?auto_87767 ) ) ( ON ?auto_87766 ?auto_87769 ) ( CLEAR ?auto_87766 ) ( HOLDING ?auto_87771 ) ( CLEAR ?auto_87767 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87768 ?auto_87772 ?auto_87767 ?auto_87771 )
      ( MAKE-1PILE ?auto_87765 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87773 - BLOCK
    )
    :vars
    (
      ?auto_87780 - BLOCK
      ?auto_87775 - BLOCK
      ?auto_87777 - BLOCK
      ?auto_87779 - BLOCK
      ?auto_87776 - BLOCK
      ?auto_87774 - BLOCK
      ?auto_87778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87780 ?auto_87773 ) ( ON-TABLE ?auto_87773 ) ( not ( = ?auto_87773 ?auto_87780 ) ) ( not ( = ?auto_87773 ?auto_87775 ) ) ( not ( = ?auto_87773 ?auto_87777 ) ) ( not ( = ?auto_87780 ?auto_87775 ) ) ( not ( = ?auto_87780 ?auto_87777 ) ) ( not ( = ?auto_87775 ?auto_87777 ) ) ( ON ?auto_87775 ?auto_87780 ) ( ON-TABLE ?auto_87779 ) ( ON ?auto_87776 ?auto_87779 ) ( ON ?auto_87774 ?auto_87776 ) ( not ( = ?auto_87779 ?auto_87776 ) ) ( not ( = ?auto_87779 ?auto_87774 ) ) ( not ( = ?auto_87779 ?auto_87778 ) ) ( not ( = ?auto_87779 ?auto_87777 ) ) ( not ( = ?auto_87776 ?auto_87774 ) ) ( not ( = ?auto_87776 ?auto_87778 ) ) ( not ( = ?auto_87776 ?auto_87777 ) ) ( not ( = ?auto_87774 ?auto_87778 ) ) ( not ( = ?auto_87774 ?auto_87777 ) ) ( not ( = ?auto_87778 ?auto_87777 ) ) ( not ( = ?auto_87773 ?auto_87778 ) ) ( not ( = ?auto_87773 ?auto_87779 ) ) ( not ( = ?auto_87773 ?auto_87776 ) ) ( not ( = ?auto_87773 ?auto_87774 ) ) ( not ( = ?auto_87780 ?auto_87778 ) ) ( not ( = ?auto_87780 ?auto_87779 ) ) ( not ( = ?auto_87780 ?auto_87776 ) ) ( not ( = ?auto_87780 ?auto_87774 ) ) ( not ( = ?auto_87775 ?auto_87778 ) ) ( not ( = ?auto_87775 ?auto_87779 ) ) ( not ( = ?auto_87775 ?auto_87776 ) ) ( not ( = ?auto_87775 ?auto_87774 ) ) ( ON ?auto_87777 ?auto_87775 ) ( CLEAR ?auto_87774 ) ( ON ?auto_87778 ?auto_87777 ) ( CLEAR ?auto_87778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87773 ?auto_87780 ?auto_87775 ?auto_87777 )
      ( MAKE-1PILE ?auto_87773 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87781 - BLOCK
    )
    :vars
    (
      ?auto_87784 - BLOCK
      ?auto_87783 - BLOCK
      ?auto_87785 - BLOCK
      ?auto_87788 - BLOCK
      ?auto_87782 - BLOCK
      ?auto_87786 - BLOCK
      ?auto_87787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87784 ?auto_87781 ) ( ON-TABLE ?auto_87781 ) ( not ( = ?auto_87781 ?auto_87784 ) ) ( not ( = ?auto_87781 ?auto_87783 ) ) ( not ( = ?auto_87781 ?auto_87785 ) ) ( not ( = ?auto_87784 ?auto_87783 ) ) ( not ( = ?auto_87784 ?auto_87785 ) ) ( not ( = ?auto_87783 ?auto_87785 ) ) ( ON ?auto_87783 ?auto_87784 ) ( ON-TABLE ?auto_87788 ) ( ON ?auto_87782 ?auto_87788 ) ( not ( = ?auto_87788 ?auto_87782 ) ) ( not ( = ?auto_87788 ?auto_87786 ) ) ( not ( = ?auto_87788 ?auto_87787 ) ) ( not ( = ?auto_87788 ?auto_87785 ) ) ( not ( = ?auto_87782 ?auto_87786 ) ) ( not ( = ?auto_87782 ?auto_87787 ) ) ( not ( = ?auto_87782 ?auto_87785 ) ) ( not ( = ?auto_87786 ?auto_87787 ) ) ( not ( = ?auto_87786 ?auto_87785 ) ) ( not ( = ?auto_87787 ?auto_87785 ) ) ( not ( = ?auto_87781 ?auto_87787 ) ) ( not ( = ?auto_87781 ?auto_87788 ) ) ( not ( = ?auto_87781 ?auto_87782 ) ) ( not ( = ?auto_87781 ?auto_87786 ) ) ( not ( = ?auto_87784 ?auto_87787 ) ) ( not ( = ?auto_87784 ?auto_87788 ) ) ( not ( = ?auto_87784 ?auto_87782 ) ) ( not ( = ?auto_87784 ?auto_87786 ) ) ( not ( = ?auto_87783 ?auto_87787 ) ) ( not ( = ?auto_87783 ?auto_87788 ) ) ( not ( = ?auto_87783 ?auto_87782 ) ) ( not ( = ?auto_87783 ?auto_87786 ) ) ( ON ?auto_87785 ?auto_87783 ) ( ON ?auto_87787 ?auto_87785 ) ( CLEAR ?auto_87787 ) ( HOLDING ?auto_87786 ) ( CLEAR ?auto_87782 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87788 ?auto_87782 ?auto_87786 )
      ( MAKE-1PILE ?auto_87781 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87789 - BLOCK
    )
    :vars
    (
      ?auto_87796 - BLOCK
      ?auto_87791 - BLOCK
      ?auto_87794 - BLOCK
      ?auto_87790 - BLOCK
      ?auto_87795 - BLOCK
      ?auto_87792 - BLOCK
      ?auto_87793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87796 ?auto_87789 ) ( ON-TABLE ?auto_87789 ) ( not ( = ?auto_87789 ?auto_87796 ) ) ( not ( = ?auto_87789 ?auto_87791 ) ) ( not ( = ?auto_87789 ?auto_87794 ) ) ( not ( = ?auto_87796 ?auto_87791 ) ) ( not ( = ?auto_87796 ?auto_87794 ) ) ( not ( = ?auto_87791 ?auto_87794 ) ) ( ON ?auto_87791 ?auto_87796 ) ( ON-TABLE ?auto_87790 ) ( ON ?auto_87795 ?auto_87790 ) ( not ( = ?auto_87790 ?auto_87795 ) ) ( not ( = ?auto_87790 ?auto_87792 ) ) ( not ( = ?auto_87790 ?auto_87793 ) ) ( not ( = ?auto_87790 ?auto_87794 ) ) ( not ( = ?auto_87795 ?auto_87792 ) ) ( not ( = ?auto_87795 ?auto_87793 ) ) ( not ( = ?auto_87795 ?auto_87794 ) ) ( not ( = ?auto_87792 ?auto_87793 ) ) ( not ( = ?auto_87792 ?auto_87794 ) ) ( not ( = ?auto_87793 ?auto_87794 ) ) ( not ( = ?auto_87789 ?auto_87793 ) ) ( not ( = ?auto_87789 ?auto_87790 ) ) ( not ( = ?auto_87789 ?auto_87795 ) ) ( not ( = ?auto_87789 ?auto_87792 ) ) ( not ( = ?auto_87796 ?auto_87793 ) ) ( not ( = ?auto_87796 ?auto_87790 ) ) ( not ( = ?auto_87796 ?auto_87795 ) ) ( not ( = ?auto_87796 ?auto_87792 ) ) ( not ( = ?auto_87791 ?auto_87793 ) ) ( not ( = ?auto_87791 ?auto_87790 ) ) ( not ( = ?auto_87791 ?auto_87795 ) ) ( not ( = ?auto_87791 ?auto_87792 ) ) ( ON ?auto_87794 ?auto_87791 ) ( ON ?auto_87793 ?auto_87794 ) ( CLEAR ?auto_87795 ) ( ON ?auto_87792 ?auto_87793 ) ( CLEAR ?auto_87792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87789 ?auto_87796 ?auto_87791 ?auto_87794 ?auto_87793 )
      ( MAKE-1PILE ?auto_87789 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87797 - BLOCK
    )
    :vars
    (
      ?auto_87798 - BLOCK
      ?auto_87801 - BLOCK
      ?auto_87802 - BLOCK
      ?auto_87804 - BLOCK
      ?auto_87803 - BLOCK
      ?auto_87799 - BLOCK
      ?auto_87800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87798 ?auto_87797 ) ( ON-TABLE ?auto_87797 ) ( not ( = ?auto_87797 ?auto_87798 ) ) ( not ( = ?auto_87797 ?auto_87801 ) ) ( not ( = ?auto_87797 ?auto_87802 ) ) ( not ( = ?auto_87798 ?auto_87801 ) ) ( not ( = ?auto_87798 ?auto_87802 ) ) ( not ( = ?auto_87801 ?auto_87802 ) ) ( ON ?auto_87801 ?auto_87798 ) ( ON-TABLE ?auto_87804 ) ( not ( = ?auto_87804 ?auto_87803 ) ) ( not ( = ?auto_87804 ?auto_87799 ) ) ( not ( = ?auto_87804 ?auto_87800 ) ) ( not ( = ?auto_87804 ?auto_87802 ) ) ( not ( = ?auto_87803 ?auto_87799 ) ) ( not ( = ?auto_87803 ?auto_87800 ) ) ( not ( = ?auto_87803 ?auto_87802 ) ) ( not ( = ?auto_87799 ?auto_87800 ) ) ( not ( = ?auto_87799 ?auto_87802 ) ) ( not ( = ?auto_87800 ?auto_87802 ) ) ( not ( = ?auto_87797 ?auto_87800 ) ) ( not ( = ?auto_87797 ?auto_87804 ) ) ( not ( = ?auto_87797 ?auto_87803 ) ) ( not ( = ?auto_87797 ?auto_87799 ) ) ( not ( = ?auto_87798 ?auto_87800 ) ) ( not ( = ?auto_87798 ?auto_87804 ) ) ( not ( = ?auto_87798 ?auto_87803 ) ) ( not ( = ?auto_87798 ?auto_87799 ) ) ( not ( = ?auto_87801 ?auto_87800 ) ) ( not ( = ?auto_87801 ?auto_87804 ) ) ( not ( = ?auto_87801 ?auto_87803 ) ) ( not ( = ?auto_87801 ?auto_87799 ) ) ( ON ?auto_87802 ?auto_87801 ) ( ON ?auto_87800 ?auto_87802 ) ( ON ?auto_87799 ?auto_87800 ) ( CLEAR ?auto_87799 ) ( HOLDING ?auto_87803 ) ( CLEAR ?auto_87804 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87804 ?auto_87803 )
      ( MAKE-1PILE ?auto_87797 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87805 - BLOCK
    )
    :vars
    (
      ?auto_87807 - BLOCK
      ?auto_87811 - BLOCK
      ?auto_87808 - BLOCK
      ?auto_87809 - BLOCK
      ?auto_87806 - BLOCK
      ?auto_87812 - BLOCK
      ?auto_87810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87807 ?auto_87805 ) ( ON-TABLE ?auto_87805 ) ( not ( = ?auto_87805 ?auto_87807 ) ) ( not ( = ?auto_87805 ?auto_87811 ) ) ( not ( = ?auto_87805 ?auto_87808 ) ) ( not ( = ?auto_87807 ?auto_87811 ) ) ( not ( = ?auto_87807 ?auto_87808 ) ) ( not ( = ?auto_87811 ?auto_87808 ) ) ( ON ?auto_87811 ?auto_87807 ) ( ON-TABLE ?auto_87809 ) ( not ( = ?auto_87809 ?auto_87806 ) ) ( not ( = ?auto_87809 ?auto_87812 ) ) ( not ( = ?auto_87809 ?auto_87810 ) ) ( not ( = ?auto_87809 ?auto_87808 ) ) ( not ( = ?auto_87806 ?auto_87812 ) ) ( not ( = ?auto_87806 ?auto_87810 ) ) ( not ( = ?auto_87806 ?auto_87808 ) ) ( not ( = ?auto_87812 ?auto_87810 ) ) ( not ( = ?auto_87812 ?auto_87808 ) ) ( not ( = ?auto_87810 ?auto_87808 ) ) ( not ( = ?auto_87805 ?auto_87810 ) ) ( not ( = ?auto_87805 ?auto_87809 ) ) ( not ( = ?auto_87805 ?auto_87806 ) ) ( not ( = ?auto_87805 ?auto_87812 ) ) ( not ( = ?auto_87807 ?auto_87810 ) ) ( not ( = ?auto_87807 ?auto_87809 ) ) ( not ( = ?auto_87807 ?auto_87806 ) ) ( not ( = ?auto_87807 ?auto_87812 ) ) ( not ( = ?auto_87811 ?auto_87810 ) ) ( not ( = ?auto_87811 ?auto_87809 ) ) ( not ( = ?auto_87811 ?auto_87806 ) ) ( not ( = ?auto_87811 ?auto_87812 ) ) ( ON ?auto_87808 ?auto_87811 ) ( ON ?auto_87810 ?auto_87808 ) ( ON ?auto_87812 ?auto_87810 ) ( CLEAR ?auto_87809 ) ( ON ?auto_87806 ?auto_87812 ) ( CLEAR ?auto_87806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87805 ?auto_87807 ?auto_87811 ?auto_87808 ?auto_87810 ?auto_87812 )
      ( MAKE-1PILE ?auto_87805 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87813 - BLOCK
    )
    :vars
    (
      ?auto_87817 - BLOCK
      ?auto_87816 - BLOCK
      ?auto_87814 - BLOCK
      ?auto_87820 - BLOCK
      ?auto_87815 - BLOCK
      ?auto_87819 - BLOCK
      ?auto_87818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87817 ?auto_87813 ) ( ON-TABLE ?auto_87813 ) ( not ( = ?auto_87813 ?auto_87817 ) ) ( not ( = ?auto_87813 ?auto_87816 ) ) ( not ( = ?auto_87813 ?auto_87814 ) ) ( not ( = ?auto_87817 ?auto_87816 ) ) ( not ( = ?auto_87817 ?auto_87814 ) ) ( not ( = ?auto_87816 ?auto_87814 ) ) ( ON ?auto_87816 ?auto_87817 ) ( not ( = ?auto_87820 ?auto_87815 ) ) ( not ( = ?auto_87820 ?auto_87819 ) ) ( not ( = ?auto_87820 ?auto_87818 ) ) ( not ( = ?auto_87820 ?auto_87814 ) ) ( not ( = ?auto_87815 ?auto_87819 ) ) ( not ( = ?auto_87815 ?auto_87818 ) ) ( not ( = ?auto_87815 ?auto_87814 ) ) ( not ( = ?auto_87819 ?auto_87818 ) ) ( not ( = ?auto_87819 ?auto_87814 ) ) ( not ( = ?auto_87818 ?auto_87814 ) ) ( not ( = ?auto_87813 ?auto_87818 ) ) ( not ( = ?auto_87813 ?auto_87820 ) ) ( not ( = ?auto_87813 ?auto_87815 ) ) ( not ( = ?auto_87813 ?auto_87819 ) ) ( not ( = ?auto_87817 ?auto_87818 ) ) ( not ( = ?auto_87817 ?auto_87820 ) ) ( not ( = ?auto_87817 ?auto_87815 ) ) ( not ( = ?auto_87817 ?auto_87819 ) ) ( not ( = ?auto_87816 ?auto_87818 ) ) ( not ( = ?auto_87816 ?auto_87820 ) ) ( not ( = ?auto_87816 ?auto_87815 ) ) ( not ( = ?auto_87816 ?auto_87819 ) ) ( ON ?auto_87814 ?auto_87816 ) ( ON ?auto_87818 ?auto_87814 ) ( ON ?auto_87819 ?auto_87818 ) ( ON ?auto_87815 ?auto_87819 ) ( CLEAR ?auto_87815 ) ( HOLDING ?auto_87820 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87820 )
      ( MAKE-1PILE ?auto_87813 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87821 - BLOCK
    )
    :vars
    (
      ?auto_87824 - BLOCK
      ?auto_87822 - BLOCK
      ?auto_87828 - BLOCK
      ?auto_87823 - BLOCK
      ?auto_87827 - BLOCK
      ?auto_87825 - BLOCK
      ?auto_87826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87824 ?auto_87821 ) ( ON-TABLE ?auto_87821 ) ( not ( = ?auto_87821 ?auto_87824 ) ) ( not ( = ?auto_87821 ?auto_87822 ) ) ( not ( = ?auto_87821 ?auto_87828 ) ) ( not ( = ?auto_87824 ?auto_87822 ) ) ( not ( = ?auto_87824 ?auto_87828 ) ) ( not ( = ?auto_87822 ?auto_87828 ) ) ( ON ?auto_87822 ?auto_87824 ) ( not ( = ?auto_87823 ?auto_87827 ) ) ( not ( = ?auto_87823 ?auto_87825 ) ) ( not ( = ?auto_87823 ?auto_87826 ) ) ( not ( = ?auto_87823 ?auto_87828 ) ) ( not ( = ?auto_87827 ?auto_87825 ) ) ( not ( = ?auto_87827 ?auto_87826 ) ) ( not ( = ?auto_87827 ?auto_87828 ) ) ( not ( = ?auto_87825 ?auto_87826 ) ) ( not ( = ?auto_87825 ?auto_87828 ) ) ( not ( = ?auto_87826 ?auto_87828 ) ) ( not ( = ?auto_87821 ?auto_87826 ) ) ( not ( = ?auto_87821 ?auto_87823 ) ) ( not ( = ?auto_87821 ?auto_87827 ) ) ( not ( = ?auto_87821 ?auto_87825 ) ) ( not ( = ?auto_87824 ?auto_87826 ) ) ( not ( = ?auto_87824 ?auto_87823 ) ) ( not ( = ?auto_87824 ?auto_87827 ) ) ( not ( = ?auto_87824 ?auto_87825 ) ) ( not ( = ?auto_87822 ?auto_87826 ) ) ( not ( = ?auto_87822 ?auto_87823 ) ) ( not ( = ?auto_87822 ?auto_87827 ) ) ( not ( = ?auto_87822 ?auto_87825 ) ) ( ON ?auto_87828 ?auto_87822 ) ( ON ?auto_87826 ?auto_87828 ) ( ON ?auto_87825 ?auto_87826 ) ( ON ?auto_87827 ?auto_87825 ) ( ON ?auto_87823 ?auto_87827 ) ( CLEAR ?auto_87823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87821 ?auto_87824 ?auto_87822 ?auto_87828 ?auto_87826 ?auto_87825 ?auto_87827 )
      ( MAKE-1PILE ?auto_87821 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87836 - BLOCK
      ?auto_87837 - BLOCK
      ?auto_87838 - BLOCK
      ?auto_87839 - BLOCK
      ?auto_87840 - BLOCK
      ?auto_87841 - BLOCK
      ?auto_87842 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_87842 ) ( CLEAR ?auto_87841 ) ( ON-TABLE ?auto_87836 ) ( ON ?auto_87837 ?auto_87836 ) ( ON ?auto_87838 ?auto_87837 ) ( ON ?auto_87839 ?auto_87838 ) ( ON ?auto_87840 ?auto_87839 ) ( ON ?auto_87841 ?auto_87840 ) ( not ( = ?auto_87836 ?auto_87837 ) ) ( not ( = ?auto_87836 ?auto_87838 ) ) ( not ( = ?auto_87836 ?auto_87839 ) ) ( not ( = ?auto_87836 ?auto_87840 ) ) ( not ( = ?auto_87836 ?auto_87841 ) ) ( not ( = ?auto_87836 ?auto_87842 ) ) ( not ( = ?auto_87837 ?auto_87838 ) ) ( not ( = ?auto_87837 ?auto_87839 ) ) ( not ( = ?auto_87837 ?auto_87840 ) ) ( not ( = ?auto_87837 ?auto_87841 ) ) ( not ( = ?auto_87837 ?auto_87842 ) ) ( not ( = ?auto_87838 ?auto_87839 ) ) ( not ( = ?auto_87838 ?auto_87840 ) ) ( not ( = ?auto_87838 ?auto_87841 ) ) ( not ( = ?auto_87838 ?auto_87842 ) ) ( not ( = ?auto_87839 ?auto_87840 ) ) ( not ( = ?auto_87839 ?auto_87841 ) ) ( not ( = ?auto_87839 ?auto_87842 ) ) ( not ( = ?auto_87840 ?auto_87841 ) ) ( not ( = ?auto_87840 ?auto_87842 ) ) ( not ( = ?auto_87841 ?auto_87842 ) ) )
    :subtasks
    ( ( !STACK ?auto_87842 ?auto_87841 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87843 - BLOCK
      ?auto_87844 - BLOCK
      ?auto_87845 - BLOCK
      ?auto_87846 - BLOCK
      ?auto_87847 - BLOCK
      ?auto_87848 - BLOCK
      ?auto_87849 - BLOCK
    )
    :vars
    (
      ?auto_87850 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_87848 ) ( ON-TABLE ?auto_87843 ) ( ON ?auto_87844 ?auto_87843 ) ( ON ?auto_87845 ?auto_87844 ) ( ON ?auto_87846 ?auto_87845 ) ( ON ?auto_87847 ?auto_87846 ) ( ON ?auto_87848 ?auto_87847 ) ( not ( = ?auto_87843 ?auto_87844 ) ) ( not ( = ?auto_87843 ?auto_87845 ) ) ( not ( = ?auto_87843 ?auto_87846 ) ) ( not ( = ?auto_87843 ?auto_87847 ) ) ( not ( = ?auto_87843 ?auto_87848 ) ) ( not ( = ?auto_87843 ?auto_87849 ) ) ( not ( = ?auto_87844 ?auto_87845 ) ) ( not ( = ?auto_87844 ?auto_87846 ) ) ( not ( = ?auto_87844 ?auto_87847 ) ) ( not ( = ?auto_87844 ?auto_87848 ) ) ( not ( = ?auto_87844 ?auto_87849 ) ) ( not ( = ?auto_87845 ?auto_87846 ) ) ( not ( = ?auto_87845 ?auto_87847 ) ) ( not ( = ?auto_87845 ?auto_87848 ) ) ( not ( = ?auto_87845 ?auto_87849 ) ) ( not ( = ?auto_87846 ?auto_87847 ) ) ( not ( = ?auto_87846 ?auto_87848 ) ) ( not ( = ?auto_87846 ?auto_87849 ) ) ( not ( = ?auto_87847 ?auto_87848 ) ) ( not ( = ?auto_87847 ?auto_87849 ) ) ( not ( = ?auto_87848 ?auto_87849 ) ) ( ON ?auto_87849 ?auto_87850 ) ( CLEAR ?auto_87849 ) ( HAND-EMPTY ) ( not ( = ?auto_87843 ?auto_87850 ) ) ( not ( = ?auto_87844 ?auto_87850 ) ) ( not ( = ?auto_87845 ?auto_87850 ) ) ( not ( = ?auto_87846 ?auto_87850 ) ) ( not ( = ?auto_87847 ?auto_87850 ) ) ( not ( = ?auto_87848 ?auto_87850 ) ) ( not ( = ?auto_87849 ?auto_87850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87849 ?auto_87850 )
      ( MAKE-7PILE ?auto_87843 ?auto_87844 ?auto_87845 ?auto_87846 ?auto_87847 ?auto_87848 ?auto_87849 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87851 - BLOCK
      ?auto_87852 - BLOCK
      ?auto_87853 - BLOCK
      ?auto_87854 - BLOCK
      ?auto_87855 - BLOCK
      ?auto_87856 - BLOCK
      ?auto_87857 - BLOCK
    )
    :vars
    (
      ?auto_87858 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87851 ) ( ON ?auto_87852 ?auto_87851 ) ( ON ?auto_87853 ?auto_87852 ) ( ON ?auto_87854 ?auto_87853 ) ( ON ?auto_87855 ?auto_87854 ) ( not ( = ?auto_87851 ?auto_87852 ) ) ( not ( = ?auto_87851 ?auto_87853 ) ) ( not ( = ?auto_87851 ?auto_87854 ) ) ( not ( = ?auto_87851 ?auto_87855 ) ) ( not ( = ?auto_87851 ?auto_87856 ) ) ( not ( = ?auto_87851 ?auto_87857 ) ) ( not ( = ?auto_87852 ?auto_87853 ) ) ( not ( = ?auto_87852 ?auto_87854 ) ) ( not ( = ?auto_87852 ?auto_87855 ) ) ( not ( = ?auto_87852 ?auto_87856 ) ) ( not ( = ?auto_87852 ?auto_87857 ) ) ( not ( = ?auto_87853 ?auto_87854 ) ) ( not ( = ?auto_87853 ?auto_87855 ) ) ( not ( = ?auto_87853 ?auto_87856 ) ) ( not ( = ?auto_87853 ?auto_87857 ) ) ( not ( = ?auto_87854 ?auto_87855 ) ) ( not ( = ?auto_87854 ?auto_87856 ) ) ( not ( = ?auto_87854 ?auto_87857 ) ) ( not ( = ?auto_87855 ?auto_87856 ) ) ( not ( = ?auto_87855 ?auto_87857 ) ) ( not ( = ?auto_87856 ?auto_87857 ) ) ( ON ?auto_87857 ?auto_87858 ) ( CLEAR ?auto_87857 ) ( not ( = ?auto_87851 ?auto_87858 ) ) ( not ( = ?auto_87852 ?auto_87858 ) ) ( not ( = ?auto_87853 ?auto_87858 ) ) ( not ( = ?auto_87854 ?auto_87858 ) ) ( not ( = ?auto_87855 ?auto_87858 ) ) ( not ( = ?auto_87856 ?auto_87858 ) ) ( not ( = ?auto_87857 ?auto_87858 ) ) ( HOLDING ?auto_87856 ) ( CLEAR ?auto_87855 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87851 ?auto_87852 ?auto_87853 ?auto_87854 ?auto_87855 ?auto_87856 )
      ( MAKE-7PILE ?auto_87851 ?auto_87852 ?auto_87853 ?auto_87854 ?auto_87855 ?auto_87856 ?auto_87857 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87859 - BLOCK
      ?auto_87860 - BLOCK
      ?auto_87861 - BLOCK
      ?auto_87862 - BLOCK
      ?auto_87863 - BLOCK
      ?auto_87864 - BLOCK
      ?auto_87865 - BLOCK
    )
    :vars
    (
      ?auto_87866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87859 ) ( ON ?auto_87860 ?auto_87859 ) ( ON ?auto_87861 ?auto_87860 ) ( ON ?auto_87862 ?auto_87861 ) ( ON ?auto_87863 ?auto_87862 ) ( not ( = ?auto_87859 ?auto_87860 ) ) ( not ( = ?auto_87859 ?auto_87861 ) ) ( not ( = ?auto_87859 ?auto_87862 ) ) ( not ( = ?auto_87859 ?auto_87863 ) ) ( not ( = ?auto_87859 ?auto_87864 ) ) ( not ( = ?auto_87859 ?auto_87865 ) ) ( not ( = ?auto_87860 ?auto_87861 ) ) ( not ( = ?auto_87860 ?auto_87862 ) ) ( not ( = ?auto_87860 ?auto_87863 ) ) ( not ( = ?auto_87860 ?auto_87864 ) ) ( not ( = ?auto_87860 ?auto_87865 ) ) ( not ( = ?auto_87861 ?auto_87862 ) ) ( not ( = ?auto_87861 ?auto_87863 ) ) ( not ( = ?auto_87861 ?auto_87864 ) ) ( not ( = ?auto_87861 ?auto_87865 ) ) ( not ( = ?auto_87862 ?auto_87863 ) ) ( not ( = ?auto_87862 ?auto_87864 ) ) ( not ( = ?auto_87862 ?auto_87865 ) ) ( not ( = ?auto_87863 ?auto_87864 ) ) ( not ( = ?auto_87863 ?auto_87865 ) ) ( not ( = ?auto_87864 ?auto_87865 ) ) ( ON ?auto_87865 ?auto_87866 ) ( not ( = ?auto_87859 ?auto_87866 ) ) ( not ( = ?auto_87860 ?auto_87866 ) ) ( not ( = ?auto_87861 ?auto_87866 ) ) ( not ( = ?auto_87862 ?auto_87866 ) ) ( not ( = ?auto_87863 ?auto_87866 ) ) ( not ( = ?auto_87864 ?auto_87866 ) ) ( not ( = ?auto_87865 ?auto_87866 ) ) ( CLEAR ?auto_87863 ) ( ON ?auto_87864 ?auto_87865 ) ( CLEAR ?auto_87864 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87866 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87866 ?auto_87865 )
      ( MAKE-7PILE ?auto_87859 ?auto_87860 ?auto_87861 ?auto_87862 ?auto_87863 ?auto_87864 ?auto_87865 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87867 - BLOCK
      ?auto_87868 - BLOCK
      ?auto_87869 - BLOCK
      ?auto_87870 - BLOCK
      ?auto_87871 - BLOCK
      ?auto_87872 - BLOCK
      ?auto_87873 - BLOCK
    )
    :vars
    (
      ?auto_87874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87867 ) ( ON ?auto_87868 ?auto_87867 ) ( ON ?auto_87869 ?auto_87868 ) ( ON ?auto_87870 ?auto_87869 ) ( not ( = ?auto_87867 ?auto_87868 ) ) ( not ( = ?auto_87867 ?auto_87869 ) ) ( not ( = ?auto_87867 ?auto_87870 ) ) ( not ( = ?auto_87867 ?auto_87871 ) ) ( not ( = ?auto_87867 ?auto_87872 ) ) ( not ( = ?auto_87867 ?auto_87873 ) ) ( not ( = ?auto_87868 ?auto_87869 ) ) ( not ( = ?auto_87868 ?auto_87870 ) ) ( not ( = ?auto_87868 ?auto_87871 ) ) ( not ( = ?auto_87868 ?auto_87872 ) ) ( not ( = ?auto_87868 ?auto_87873 ) ) ( not ( = ?auto_87869 ?auto_87870 ) ) ( not ( = ?auto_87869 ?auto_87871 ) ) ( not ( = ?auto_87869 ?auto_87872 ) ) ( not ( = ?auto_87869 ?auto_87873 ) ) ( not ( = ?auto_87870 ?auto_87871 ) ) ( not ( = ?auto_87870 ?auto_87872 ) ) ( not ( = ?auto_87870 ?auto_87873 ) ) ( not ( = ?auto_87871 ?auto_87872 ) ) ( not ( = ?auto_87871 ?auto_87873 ) ) ( not ( = ?auto_87872 ?auto_87873 ) ) ( ON ?auto_87873 ?auto_87874 ) ( not ( = ?auto_87867 ?auto_87874 ) ) ( not ( = ?auto_87868 ?auto_87874 ) ) ( not ( = ?auto_87869 ?auto_87874 ) ) ( not ( = ?auto_87870 ?auto_87874 ) ) ( not ( = ?auto_87871 ?auto_87874 ) ) ( not ( = ?auto_87872 ?auto_87874 ) ) ( not ( = ?auto_87873 ?auto_87874 ) ) ( ON ?auto_87872 ?auto_87873 ) ( CLEAR ?auto_87872 ) ( ON-TABLE ?auto_87874 ) ( HOLDING ?auto_87871 ) ( CLEAR ?auto_87870 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87867 ?auto_87868 ?auto_87869 ?auto_87870 ?auto_87871 )
      ( MAKE-7PILE ?auto_87867 ?auto_87868 ?auto_87869 ?auto_87870 ?auto_87871 ?auto_87872 ?auto_87873 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87875 - BLOCK
      ?auto_87876 - BLOCK
      ?auto_87877 - BLOCK
      ?auto_87878 - BLOCK
      ?auto_87879 - BLOCK
      ?auto_87880 - BLOCK
      ?auto_87881 - BLOCK
    )
    :vars
    (
      ?auto_87882 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87875 ) ( ON ?auto_87876 ?auto_87875 ) ( ON ?auto_87877 ?auto_87876 ) ( ON ?auto_87878 ?auto_87877 ) ( not ( = ?auto_87875 ?auto_87876 ) ) ( not ( = ?auto_87875 ?auto_87877 ) ) ( not ( = ?auto_87875 ?auto_87878 ) ) ( not ( = ?auto_87875 ?auto_87879 ) ) ( not ( = ?auto_87875 ?auto_87880 ) ) ( not ( = ?auto_87875 ?auto_87881 ) ) ( not ( = ?auto_87876 ?auto_87877 ) ) ( not ( = ?auto_87876 ?auto_87878 ) ) ( not ( = ?auto_87876 ?auto_87879 ) ) ( not ( = ?auto_87876 ?auto_87880 ) ) ( not ( = ?auto_87876 ?auto_87881 ) ) ( not ( = ?auto_87877 ?auto_87878 ) ) ( not ( = ?auto_87877 ?auto_87879 ) ) ( not ( = ?auto_87877 ?auto_87880 ) ) ( not ( = ?auto_87877 ?auto_87881 ) ) ( not ( = ?auto_87878 ?auto_87879 ) ) ( not ( = ?auto_87878 ?auto_87880 ) ) ( not ( = ?auto_87878 ?auto_87881 ) ) ( not ( = ?auto_87879 ?auto_87880 ) ) ( not ( = ?auto_87879 ?auto_87881 ) ) ( not ( = ?auto_87880 ?auto_87881 ) ) ( ON ?auto_87881 ?auto_87882 ) ( not ( = ?auto_87875 ?auto_87882 ) ) ( not ( = ?auto_87876 ?auto_87882 ) ) ( not ( = ?auto_87877 ?auto_87882 ) ) ( not ( = ?auto_87878 ?auto_87882 ) ) ( not ( = ?auto_87879 ?auto_87882 ) ) ( not ( = ?auto_87880 ?auto_87882 ) ) ( not ( = ?auto_87881 ?auto_87882 ) ) ( ON ?auto_87880 ?auto_87881 ) ( ON-TABLE ?auto_87882 ) ( CLEAR ?auto_87878 ) ( ON ?auto_87879 ?auto_87880 ) ( CLEAR ?auto_87879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87882 ?auto_87881 ?auto_87880 )
      ( MAKE-7PILE ?auto_87875 ?auto_87876 ?auto_87877 ?auto_87878 ?auto_87879 ?auto_87880 ?auto_87881 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87883 - BLOCK
      ?auto_87884 - BLOCK
      ?auto_87885 - BLOCK
      ?auto_87886 - BLOCK
      ?auto_87887 - BLOCK
      ?auto_87888 - BLOCK
      ?auto_87889 - BLOCK
    )
    :vars
    (
      ?auto_87890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87883 ) ( ON ?auto_87884 ?auto_87883 ) ( ON ?auto_87885 ?auto_87884 ) ( not ( = ?auto_87883 ?auto_87884 ) ) ( not ( = ?auto_87883 ?auto_87885 ) ) ( not ( = ?auto_87883 ?auto_87886 ) ) ( not ( = ?auto_87883 ?auto_87887 ) ) ( not ( = ?auto_87883 ?auto_87888 ) ) ( not ( = ?auto_87883 ?auto_87889 ) ) ( not ( = ?auto_87884 ?auto_87885 ) ) ( not ( = ?auto_87884 ?auto_87886 ) ) ( not ( = ?auto_87884 ?auto_87887 ) ) ( not ( = ?auto_87884 ?auto_87888 ) ) ( not ( = ?auto_87884 ?auto_87889 ) ) ( not ( = ?auto_87885 ?auto_87886 ) ) ( not ( = ?auto_87885 ?auto_87887 ) ) ( not ( = ?auto_87885 ?auto_87888 ) ) ( not ( = ?auto_87885 ?auto_87889 ) ) ( not ( = ?auto_87886 ?auto_87887 ) ) ( not ( = ?auto_87886 ?auto_87888 ) ) ( not ( = ?auto_87886 ?auto_87889 ) ) ( not ( = ?auto_87887 ?auto_87888 ) ) ( not ( = ?auto_87887 ?auto_87889 ) ) ( not ( = ?auto_87888 ?auto_87889 ) ) ( ON ?auto_87889 ?auto_87890 ) ( not ( = ?auto_87883 ?auto_87890 ) ) ( not ( = ?auto_87884 ?auto_87890 ) ) ( not ( = ?auto_87885 ?auto_87890 ) ) ( not ( = ?auto_87886 ?auto_87890 ) ) ( not ( = ?auto_87887 ?auto_87890 ) ) ( not ( = ?auto_87888 ?auto_87890 ) ) ( not ( = ?auto_87889 ?auto_87890 ) ) ( ON ?auto_87888 ?auto_87889 ) ( ON-TABLE ?auto_87890 ) ( ON ?auto_87887 ?auto_87888 ) ( CLEAR ?auto_87887 ) ( HOLDING ?auto_87886 ) ( CLEAR ?auto_87885 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87883 ?auto_87884 ?auto_87885 ?auto_87886 )
      ( MAKE-7PILE ?auto_87883 ?auto_87884 ?auto_87885 ?auto_87886 ?auto_87887 ?auto_87888 ?auto_87889 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87891 - BLOCK
      ?auto_87892 - BLOCK
      ?auto_87893 - BLOCK
      ?auto_87894 - BLOCK
      ?auto_87895 - BLOCK
      ?auto_87896 - BLOCK
      ?auto_87897 - BLOCK
    )
    :vars
    (
      ?auto_87898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87891 ) ( ON ?auto_87892 ?auto_87891 ) ( ON ?auto_87893 ?auto_87892 ) ( not ( = ?auto_87891 ?auto_87892 ) ) ( not ( = ?auto_87891 ?auto_87893 ) ) ( not ( = ?auto_87891 ?auto_87894 ) ) ( not ( = ?auto_87891 ?auto_87895 ) ) ( not ( = ?auto_87891 ?auto_87896 ) ) ( not ( = ?auto_87891 ?auto_87897 ) ) ( not ( = ?auto_87892 ?auto_87893 ) ) ( not ( = ?auto_87892 ?auto_87894 ) ) ( not ( = ?auto_87892 ?auto_87895 ) ) ( not ( = ?auto_87892 ?auto_87896 ) ) ( not ( = ?auto_87892 ?auto_87897 ) ) ( not ( = ?auto_87893 ?auto_87894 ) ) ( not ( = ?auto_87893 ?auto_87895 ) ) ( not ( = ?auto_87893 ?auto_87896 ) ) ( not ( = ?auto_87893 ?auto_87897 ) ) ( not ( = ?auto_87894 ?auto_87895 ) ) ( not ( = ?auto_87894 ?auto_87896 ) ) ( not ( = ?auto_87894 ?auto_87897 ) ) ( not ( = ?auto_87895 ?auto_87896 ) ) ( not ( = ?auto_87895 ?auto_87897 ) ) ( not ( = ?auto_87896 ?auto_87897 ) ) ( ON ?auto_87897 ?auto_87898 ) ( not ( = ?auto_87891 ?auto_87898 ) ) ( not ( = ?auto_87892 ?auto_87898 ) ) ( not ( = ?auto_87893 ?auto_87898 ) ) ( not ( = ?auto_87894 ?auto_87898 ) ) ( not ( = ?auto_87895 ?auto_87898 ) ) ( not ( = ?auto_87896 ?auto_87898 ) ) ( not ( = ?auto_87897 ?auto_87898 ) ) ( ON ?auto_87896 ?auto_87897 ) ( ON-TABLE ?auto_87898 ) ( ON ?auto_87895 ?auto_87896 ) ( CLEAR ?auto_87893 ) ( ON ?auto_87894 ?auto_87895 ) ( CLEAR ?auto_87894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87898 ?auto_87897 ?auto_87896 ?auto_87895 )
      ( MAKE-7PILE ?auto_87891 ?auto_87892 ?auto_87893 ?auto_87894 ?auto_87895 ?auto_87896 ?auto_87897 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87899 - BLOCK
      ?auto_87900 - BLOCK
      ?auto_87901 - BLOCK
      ?auto_87902 - BLOCK
      ?auto_87903 - BLOCK
      ?auto_87904 - BLOCK
      ?auto_87905 - BLOCK
    )
    :vars
    (
      ?auto_87906 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87899 ) ( ON ?auto_87900 ?auto_87899 ) ( not ( = ?auto_87899 ?auto_87900 ) ) ( not ( = ?auto_87899 ?auto_87901 ) ) ( not ( = ?auto_87899 ?auto_87902 ) ) ( not ( = ?auto_87899 ?auto_87903 ) ) ( not ( = ?auto_87899 ?auto_87904 ) ) ( not ( = ?auto_87899 ?auto_87905 ) ) ( not ( = ?auto_87900 ?auto_87901 ) ) ( not ( = ?auto_87900 ?auto_87902 ) ) ( not ( = ?auto_87900 ?auto_87903 ) ) ( not ( = ?auto_87900 ?auto_87904 ) ) ( not ( = ?auto_87900 ?auto_87905 ) ) ( not ( = ?auto_87901 ?auto_87902 ) ) ( not ( = ?auto_87901 ?auto_87903 ) ) ( not ( = ?auto_87901 ?auto_87904 ) ) ( not ( = ?auto_87901 ?auto_87905 ) ) ( not ( = ?auto_87902 ?auto_87903 ) ) ( not ( = ?auto_87902 ?auto_87904 ) ) ( not ( = ?auto_87902 ?auto_87905 ) ) ( not ( = ?auto_87903 ?auto_87904 ) ) ( not ( = ?auto_87903 ?auto_87905 ) ) ( not ( = ?auto_87904 ?auto_87905 ) ) ( ON ?auto_87905 ?auto_87906 ) ( not ( = ?auto_87899 ?auto_87906 ) ) ( not ( = ?auto_87900 ?auto_87906 ) ) ( not ( = ?auto_87901 ?auto_87906 ) ) ( not ( = ?auto_87902 ?auto_87906 ) ) ( not ( = ?auto_87903 ?auto_87906 ) ) ( not ( = ?auto_87904 ?auto_87906 ) ) ( not ( = ?auto_87905 ?auto_87906 ) ) ( ON ?auto_87904 ?auto_87905 ) ( ON-TABLE ?auto_87906 ) ( ON ?auto_87903 ?auto_87904 ) ( ON ?auto_87902 ?auto_87903 ) ( CLEAR ?auto_87902 ) ( HOLDING ?auto_87901 ) ( CLEAR ?auto_87900 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87899 ?auto_87900 ?auto_87901 )
      ( MAKE-7PILE ?auto_87899 ?auto_87900 ?auto_87901 ?auto_87902 ?auto_87903 ?auto_87904 ?auto_87905 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87907 - BLOCK
      ?auto_87908 - BLOCK
      ?auto_87909 - BLOCK
      ?auto_87910 - BLOCK
      ?auto_87911 - BLOCK
      ?auto_87912 - BLOCK
      ?auto_87913 - BLOCK
    )
    :vars
    (
      ?auto_87914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87907 ) ( ON ?auto_87908 ?auto_87907 ) ( not ( = ?auto_87907 ?auto_87908 ) ) ( not ( = ?auto_87907 ?auto_87909 ) ) ( not ( = ?auto_87907 ?auto_87910 ) ) ( not ( = ?auto_87907 ?auto_87911 ) ) ( not ( = ?auto_87907 ?auto_87912 ) ) ( not ( = ?auto_87907 ?auto_87913 ) ) ( not ( = ?auto_87908 ?auto_87909 ) ) ( not ( = ?auto_87908 ?auto_87910 ) ) ( not ( = ?auto_87908 ?auto_87911 ) ) ( not ( = ?auto_87908 ?auto_87912 ) ) ( not ( = ?auto_87908 ?auto_87913 ) ) ( not ( = ?auto_87909 ?auto_87910 ) ) ( not ( = ?auto_87909 ?auto_87911 ) ) ( not ( = ?auto_87909 ?auto_87912 ) ) ( not ( = ?auto_87909 ?auto_87913 ) ) ( not ( = ?auto_87910 ?auto_87911 ) ) ( not ( = ?auto_87910 ?auto_87912 ) ) ( not ( = ?auto_87910 ?auto_87913 ) ) ( not ( = ?auto_87911 ?auto_87912 ) ) ( not ( = ?auto_87911 ?auto_87913 ) ) ( not ( = ?auto_87912 ?auto_87913 ) ) ( ON ?auto_87913 ?auto_87914 ) ( not ( = ?auto_87907 ?auto_87914 ) ) ( not ( = ?auto_87908 ?auto_87914 ) ) ( not ( = ?auto_87909 ?auto_87914 ) ) ( not ( = ?auto_87910 ?auto_87914 ) ) ( not ( = ?auto_87911 ?auto_87914 ) ) ( not ( = ?auto_87912 ?auto_87914 ) ) ( not ( = ?auto_87913 ?auto_87914 ) ) ( ON ?auto_87912 ?auto_87913 ) ( ON-TABLE ?auto_87914 ) ( ON ?auto_87911 ?auto_87912 ) ( ON ?auto_87910 ?auto_87911 ) ( CLEAR ?auto_87908 ) ( ON ?auto_87909 ?auto_87910 ) ( CLEAR ?auto_87909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87914 ?auto_87913 ?auto_87912 ?auto_87911 ?auto_87910 )
      ( MAKE-7PILE ?auto_87907 ?auto_87908 ?auto_87909 ?auto_87910 ?auto_87911 ?auto_87912 ?auto_87913 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87915 - BLOCK
      ?auto_87916 - BLOCK
      ?auto_87917 - BLOCK
      ?auto_87918 - BLOCK
      ?auto_87919 - BLOCK
      ?auto_87920 - BLOCK
      ?auto_87921 - BLOCK
    )
    :vars
    (
      ?auto_87922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87915 ) ( not ( = ?auto_87915 ?auto_87916 ) ) ( not ( = ?auto_87915 ?auto_87917 ) ) ( not ( = ?auto_87915 ?auto_87918 ) ) ( not ( = ?auto_87915 ?auto_87919 ) ) ( not ( = ?auto_87915 ?auto_87920 ) ) ( not ( = ?auto_87915 ?auto_87921 ) ) ( not ( = ?auto_87916 ?auto_87917 ) ) ( not ( = ?auto_87916 ?auto_87918 ) ) ( not ( = ?auto_87916 ?auto_87919 ) ) ( not ( = ?auto_87916 ?auto_87920 ) ) ( not ( = ?auto_87916 ?auto_87921 ) ) ( not ( = ?auto_87917 ?auto_87918 ) ) ( not ( = ?auto_87917 ?auto_87919 ) ) ( not ( = ?auto_87917 ?auto_87920 ) ) ( not ( = ?auto_87917 ?auto_87921 ) ) ( not ( = ?auto_87918 ?auto_87919 ) ) ( not ( = ?auto_87918 ?auto_87920 ) ) ( not ( = ?auto_87918 ?auto_87921 ) ) ( not ( = ?auto_87919 ?auto_87920 ) ) ( not ( = ?auto_87919 ?auto_87921 ) ) ( not ( = ?auto_87920 ?auto_87921 ) ) ( ON ?auto_87921 ?auto_87922 ) ( not ( = ?auto_87915 ?auto_87922 ) ) ( not ( = ?auto_87916 ?auto_87922 ) ) ( not ( = ?auto_87917 ?auto_87922 ) ) ( not ( = ?auto_87918 ?auto_87922 ) ) ( not ( = ?auto_87919 ?auto_87922 ) ) ( not ( = ?auto_87920 ?auto_87922 ) ) ( not ( = ?auto_87921 ?auto_87922 ) ) ( ON ?auto_87920 ?auto_87921 ) ( ON-TABLE ?auto_87922 ) ( ON ?auto_87919 ?auto_87920 ) ( ON ?auto_87918 ?auto_87919 ) ( ON ?auto_87917 ?auto_87918 ) ( CLEAR ?auto_87917 ) ( HOLDING ?auto_87916 ) ( CLEAR ?auto_87915 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87915 ?auto_87916 )
      ( MAKE-7PILE ?auto_87915 ?auto_87916 ?auto_87917 ?auto_87918 ?auto_87919 ?auto_87920 ?auto_87921 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87923 - BLOCK
      ?auto_87924 - BLOCK
      ?auto_87925 - BLOCK
      ?auto_87926 - BLOCK
      ?auto_87927 - BLOCK
      ?auto_87928 - BLOCK
      ?auto_87929 - BLOCK
    )
    :vars
    (
      ?auto_87930 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87923 ) ( not ( = ?auto_87923 ?auto_87924 ) ) ( not ( = ?auto_87923 ?auto_87925 ) ) ( not ( = ?auto_87923 ?auto_87926 ) ) ( not ( = ?auto_87923 ?auto_87927 ) ) ( not ( = ?auto_87923 ?auto_87928 ) ) ( not ( = ?auto_87923 ?auto_87929 ) ) ( not ( = ?auto_87924 ?auto_87925 ) ) ( not ( = ?auto_87924 ?auto_87926 ) ) ( not ( = ?auto_87924 ?auto_87927 ) ) ( not ( = ?auto_87924 ?auto_87928 ) ) ( not ( = ?auto_87924 ?auto_87929 ) ) ( not ( = ?auto_87925 ?auto_87926 ) ) ( not ( = ?auto_87925 ?auto_87927 ) ) ( not ( = ?auto_87925 ?auto_87928 ) ) ( not ( = ?auto_87925 ?auto_87929 ) ) ( not ( = ?auto_87926 ?auto_87927 ) ) ( not ( = ?auto_87926 ?auto_87928 ) ) ( not ( = ?auto_87926 ?auto_87929 ) ) ( not ( = ?auto_87927 ?auto_87928 ) ) ( not ( = ?auto_87927 ?auto_87929 ) ) ( not ( = ?auto_87928 ?auto_87929 ) ) ( ON ?auto_87929 ?auto_87930 ) ( not ( = ?auto_87923 ?auto_87930 ) ) ( not ( = ?auto_87924 ?auto_87930 ) ) ( not ( = ?auto_87925 ?auto_87930 ) ) ( not ( = ?auto_87926 ?auto_87930 ) ) ( not ( = ?auto_87927 ?auto_87930 ) ) ( not ( = ?auto_87928 ?auto_87930 ) ) ( not ( = ?auto_87929 ?auto_87930 ) ) ( ON ?auto_87928 ?auto_87929 ) ( ON-TABLE ?auto_87930 ) ( ON ?auto_87927 ?auto_87928 ) ( ON ?auto_87926 ?auto_87927 ) ( ON ?auto_87925 ?auto_87926 ) ( CLEAR ?auto_87923 ) ( ON ?auto_87924 ?auto_87925 ) ( CLEAR ?auto_87924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87930 ?auto_87929 ?auto_87928 ?auto_87927 ?auto_87926 ?auto_87925 )
      ( MAKE-7PILE ?auto_87923 ?auto_87924 ?auto_87925 ?auto_87926 ?auto_87927 ?auto_87928 ?auto_87929 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87931 - BLOCK
      ?auto_87932 - BLOCK
      ?auto_87933 - BLOCK
      ?auto_87934 - BLOCK
      ?auto_87935 - BLOCK
      ?auto_87936 - BLOCK
      ?auto_87937 - BLOCK
    )
    :vars
    (
      ?auto_87938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87931 ?auto_87932 ) ) ( not ( = ?auto_87931 ?auto_87933 ) ) ( not ( = ?auto_87931 ?auto_87934 ) ) ( not ( = ?auto_87931 ?auto_87935 ) ) ( not ( = ?auto_87931 ?auto_87936 ) ) ( not ( = ?auto_87931 ?auto_87937 ) ) ( not ( = ?auto_87932 ?auto_87933 ) ) ( not ( = ?auto_87932 ?auto_87934 ) ) ( not ( = ?auto_87932 ?auto_87935 ) ) ( not ( = ?auto_87932 ?auto_87936 ) ) ( not ( = ?auto_87932 ?auto_87937 ) ) ( not ( = ?auto_87933 ?auto_87934 ) ) ( not ( = ?auto_87933 ?auto_87935 ) ) ( not ( = ?auto_87933 ?auto_87936 ) ) ( not ( = ?auto_87933 ?auto_87937 ) ) ( not ( = ?auto_87934 ?auto_87935 ) ) ( not ( = ?auto_87934 ?auto_87936 ) ) ( not ( = ?auto_87934 ?auto_87937 ) ) ( not ( = ?auto_87935 ?auto_87936 ) ) ( not ( = ?auto_87935 ?auto_87937 ) ) ( not ( = ?auto_87936 ?auto_87937 ) ) ( ON ?auto_87937 ?auto_87938 ) ( not ( = ?auto_87931 ?auto_87938 ) ) ( not ( = ?auto_87932 ?auto_87938 ) ) ( not ( = ?auto_87933 ?auto_87938 ) ) ( not ( = ?auto_87934 ?auto_87938 ) ) ( not ( = ?auto_87935 ?auto_87938 ) ) ( not ( = ?auto_87936 ?auto_87938 ) ) ( not ( = ?auto_87937 ?auto_87938 ) ) ( ON ?auto_87936 ?auto_87937 ) ( ON-TABLE ?auto_87938 ) ( ON ?auto_87935 ?auto_87936 ) ( ON ?auto_87934 ?auto_87935 ) ( ON ?auto_87933 ?auto_87934 ) ( ON ?auto_87932 ?auto_87933 ) ( CLEAR ?auto_87932 ) ( HOLDING ?auto_87931 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87931 )
      ( MAKE-7PILE ?auto_87931 ?auto_87932 ?auto_87933 ?auto_87934 ?auto_87935 ?auto_87936 ?auto_87937 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87939 - BLOCK
      ?auto_87940 - BLOCK
      ?auto_87941 - BLOCK
      ?auto_87942 - BLOCK
      ?auto_87943 - BLOCK
      ?auto_87944 - BLOCK
      ?auto_87945 - BLOCK
    )
    :vars
    (
      ?auto_87946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87939 ?auto_87940 ) ) ( not ( = ?auto_87939 ?auto_87941 ) ) ( not ( = ?auto_87939 ?auto_87942 ) ) ( not ( = ?auto_87939 ?auto_87943 ) ) ( not ( = ?auto_87939 ?auto_87944 ) ) ( not ( = ?auto_87939 ?auto_87945 ) ) ( not ( = ?auto_87940 ?auto_87941 ) ) ( not ( = ?auto_87940 ?auto_87942 ) ) ( not ( = ?auto_87940 ?auto_87943 ) ) ( not ( = ?auto_87940 ?auto_87944 ) ) ( not ( = ?auto_87940 ?auto_87945 ) ) ( not ( = ?auto_87941 ?auto_87942 ) ) ( not ( = ?auto_87941 ?auto_87943 ) ) ( not ( = ?auto_87941 ?auto_87944 ) ) ( not ( = ?auto_87941 ?auto_87945 ) ) ( not ( = ?auto_87942 ?auto_87943 ) ) ( not ( = ?auto_87942 ?auto_87944 ) ) ( not ( = ?auto_87942 ?auto_87945 ) ) ( not ( = ?auto_87943 ?auto_87944 ) ) ( not ( = ?auto_87943 ?auto_87945 ) ) ( not ( = ?auto_87944 ?auto_87945 ) ) ( ON ?auto_87945 ?auto_87946 ) ( not ( = ?auto_87939 ?auto_87946 ) ) ( not ( = ?auto_87940 ?auto_87946 ) ) ( not ( = ?auto_87941 ?auto_87946 ) ) ( not ( = ?auto_87942 ?auto_87946 ) ) ( not ( = ?auto_87943 ?auto_87946 ) ) ( not ( = ?auto_87944 ?auto_87946 ) ) ( not ( = ?auto_87945 ?auto_87946 ) ) ( ON ?auto_87944 ?auto_87945 ) ( ON-TABLE ?auto_87946 ) ( ON ?auto_87943 ?auto_87944 ) ( ON ?auto_87942 ?auto_87943 ) ( ON ?auto_87941 ?auto_87942 ) ( ON ?auto_87940 ?auto_87941 ) ( ON ?auto_87939 ?auto_87940 ) ( CLEAR ?auto_87939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87946 ?auto_87945 ?auto_87944 ?auto_87943 ?auto_87942 ?auto_87941 ?auto_87940 )
      ( MAKE-7PILE ?auto_87939 ?auto_87940 ?auto_87941 ?auto_87942 ?auto_87943 ?auto_87944 ?auto_87945 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87953 - BLOCK
      ?auto_87954 - BLOCK
      ?auto_87955 - BLOCK
      ?auto_87956 - BLOCK
      ?auto_87957 - BLOCK
      ?auto_87958 - BLOCK
    )
    :vars
    (
      ?auto_87959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87959 ?auto_87958 ) ( CLEAR ?auto_87959 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87953 ) ( ON ?auto_87954 ?auto_87953 ) ( ON ?auto_87955 ?auto_87954 ) ( ON ?auto_87956 ?auto_87955 ) ( ON ?auto_87957 ?auto_87956 ) ( ON ?auto_87958 ?auto_87957 ) ( not ( = ?auto_87953 ?auto_87954 ) ) ( not ( = ?auto_87953 ?auto_87955 ) ) ( not ( = ?auto_87953 ?auto_87956 ) ) ( not ( = ?auto_87953 ?auto_87957 ) ) ( not ( = ?auto_87953 ?auto_87958 ) ) ( not ( = ?auto_87953 ?auto_87959 ) ) ( not ( = ?auto_87954 ?auto_87955 ) ) ( not ( = ?auto_87954 ?auto_87956 ) ) ( not ( = ?auto_87954 ?auto_87957 ) ) ( not ( = ?auto_87954 ?auto_87958 ) ) ( not ( = ?auto_87954 ?auto_87959 ) ) ( not ( = ?auto_87955 ?auto_87956 ) ) ( not ( = ?auto_87955 ?auto_87957 ) ) ( not ( = ?auto_87955 ?auto_87958 ) ) ( not ( = ?auto_87955 ?auto_87959 ) ) ( not ( = ?auto_87956 ?auto_87957 ) ) ( not ( = ?auto_87956 ?auto_87958 ) ) ( not ( = ?auto_87956 ?auto_87959 ) ) ( not ( = ?auto_87957 ?auto_87958 ) ) ( not ( = ?auto_87957 ?auto_87959 ) ) ( not ( = ?auto_87958 ?auto_87959 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87959 ?auto_87958 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87975 - BLOCK
      ?auto_87976 - BLOCK
      ?auto_87977 - BLOCK
      ?auto_87978 - BLOCK
      ?auto_87979 - BLOCK
      ?auto_87980 - BLOCK
    )
    :vars
    (
      ?auto_87981 - BLOCK
      ?auto_87982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87975 ) ( ON ?auto_87976 ?auto_87975 ) ( ON ?auto_87977 ?auto_87976 ) ( ON ?auto_87978 ?auto_87977 ) ( ON ?auto_87979 ?auto_87978 ) ( not ( = ?auto_87975 ?auto_87976 ) ) ( not ( = ?auto_87975 ?auto_87977 ) ) ( not ( = ?auto_87975 ?auto_87978 ) ) ( not ( = ?auto_87975 ?auto_87979 ) ) ( not ( = ?auto_87975 ?auto_87980 ) ) ( not ( = ?auto_87975 ?auto_87981 ) ) ( not ( = ?auto_87976 ?auto_87977 ) ) ( not ( = ?auto_87976 ?auto_87978 ) ) ( not ( = ?auto_87976 ?auto_87979 ) ) ( not ( = ?auto_87976 ?auto_87980 ) ) ( not ( = ?auto_87976 ?auto_87981 ) ) ( not ( = ?auto_87977 ?auto_87978 ) ) ( not ( = ?auto_87977 ?auto_87979 ) ) ( not ( = ?auto_87977 ?auto_87980 ) ) ( not ( = ?auto_87977 ?auto_87981 ) ) ( not ( = ?auto_87978 ?auto_87979 ) ) ( not ( = ?auto_87978 ?auto_87980 ) ) ( not ( = ?auto_87978 ?auto_87981 ) ) ( not ( = ?auto_87979 ?auto_87980 ) ) ( not ( = ?auto_87979 ?auto_87981 ) ) ( not ( = ?auto_87980 ?auto_87981 ) ) ( ON ?auto_87981 ?auto_87982 ) ( CLEAR ?auto_87981 ) ( not ( = ?auto_87975 ?auto_87982 ) ) ( not ( = ?auto_87976 ?auto_87982 ) ) ( not ( = ?auto_87977 ?auto_87982 ) ) ( not ( = ?auto_87978 ?auto_87982 ) ) ( not ( = ?auto_87979 ?auto_87982 ) ) ( not ( = ?auto_87980 ?auto_87982 ) ) ( not ( = ?auto_87981 ?auto_87982 ) ) ( HOLDING ?auto_87980 ) ( CLEAR ?auto_87979 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87975 ?auto_87976 ?auto_87977 ?auto_87978 ?auto_87979 ?auto_87980 ?auto_87981 )
      ( MAKE-6PILE ?auto_87975 ?auto_87976 ?auto_87977 ?auto_87978 ?auto_87979 ?auto_87980 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87983 - BLOCK
      ?auto_87984 - BLOCK
      ?auto_87985 - BLOCK
      ?auto_87986 - BLOCK
      ?auto_87987 - BLOCK
      ?auto_87988 - BLOCK
    )
    :vars
    (
      ?auto_87989 - BLOCK
      ?auto_87990 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87983 ) ( ON ?auto_87984 ?auto_87983 ) ( ON ?auto_87985 ?auto_87984 ) ( ON ?auto_87986 ?auto_87985 ) ( ON ?auto_87987 ?auto_87986 ) ( not ( = ?auto_87983 ?auto_87984 ) ) ( not ( = ?auto_87983 ?auto_87985 ) ) ( not ( = ?auto_87983 ?auto_87986 ) ) ( not ( = ?auto_87983 ?auto_87987 ) ) ( not ( = ?auto_87983 ?auto_87988 ) ) ( not ( = ?auto_87983 ?auto_87989 ) ) ( not ( = ?auto_87984 ?auto_87985 ) ) ( not ( = ?auto_87984 ?auto_87986 ) ) ( not ( = ?auto_87984 ?auto_87987 ) ) ( not ( = ?auto_87984 ?auto_87988 ) ) ( not ( = ?auto_87984 ?auto_87989 ) ) ( not ( = ?auto_87985 ?auto_87986 ) ) ( not ( = ?auto_87985 ?auto_87987 ) ) ( not ( = ?auto_87985 ?auto_87988 ) ) ( not ( = ?auto_87985 ?auto_87989 ) ) ( not ( = ?auto_87986 ?auto_87987 ) ) ( not ( = ?auto_87986 ?auto_87988 ) ) ( not ( = ?auto_87986 ?auto_87989 ) ) ( not ( = ?auto_87987 ?auto_87988 ) ) ( not ( = ?auto_87987 ?auto_87989 ) ) ( not ( = ?auto_87988 ?auto_87989 ) ) ( ON ?auto_87989 ?auto_87990 ) ( not ( = ?auto_87983 ?auto_87990 ) ) ( not ( = ?auto_87984 ?auto_87990 ) ) ( not ( = ?auto_87985 ?auto_87990 ) ) ( not ( = ?auto_87986 ?auto_87990 ) ) ( not ( = ?auto_87987 ?auto_87990 ) ) ( not ( = ?auto_87988 ?auto_87990 ) ) ( not ( = ?auto_87989 ?auto_87990 ) ) ( CLEAR ?auto_87987 ) ( ON ?auto_87988 ?auto_87989 ) ( CLEAR ?auto_87988 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87990 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87990 ?auto_87989 )
      ( MAKE-6PILE ?auto_87983 ?auto_87984 ?auto_87985 ?auto_87986 ?auto_87987 ?auto_87988 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87991 - BLOCK
      ?auto_87992 - BLOCK
      ?auto_87993 - BLOCK
      ?auto_87994 - BLOCK
      ?auto_87995 - BLOCK
      ?auto_87996 - BLOCK
    )
    :vars
    (
      ?auto_87997 - BLOCK
      ?auto_87998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87991 ) ( ON ?auto_87992 ?auto_87991 ) ( ON ?auto_87993 ?auto_87992 ) ( ON ?auto_87994 ?auto_87993 ) ( not ( = ?auto_87991 ?auto_87992 ) ) ( not ( = ?auto_87991 ?auto_87993 ) ) ( not ( = ?auto_87991 ?auto_87994 ) ) ( not ( = ?auto_87991 ?auto_87995 ) ) ( not ( = ?auto_87991 ?auto_87996 ) ) ( not ( = ?auto_87991 ?auto_87997 ) ) ( not ( = ?auto_87992 ?auto_87993 ) ) ( not ( = ?auto_87992 ?auto_87994 ) ) ( not ( = ?auto_87992 ?auto_87995 ) ) ( not ( = ?auto_87992 ?auto_87996 ) ) ( not ( = ?auto_87992 ?auto_87997 ) ) ( not ( = ?auto_87993 ?auto_87994 ) ) ( not ( = ?auto_87993 ?auto_87995 ) ) ( not ( = ?auto_87993 ?auto_87996 ) ) ( not ( = ?auto_87993 ?auto_87997 ) ) ( not ( = ?auto_87994 ?auto_87995 ) ) ( not ( = ?auto_87994 ?auto_87996 ) ) ( not ( = ?auto_87994 ?auto_87997 ) ) ( not ( = ?auto_87995 ?auto_87996 ) ) ( not ( = ?auto_87995 ?auto_87997 ) ) ( not ( = ?auto_87996 ?auto_87997 ) ) ( ON ?auto_87997 ?auto_87998 ) ( not ( = ?auto_87991 ?auto_87998 ) ) ( not ( = ?auto_87992 ?auto_87998 ) ) ( not ( = ?auto_87993 ?auto_87998 ) ) ( not ( = ?auto_87994 ?auto_87998 ) ) ( not ( = ?auto_87995 ?auto_87998 ) ) ( not ( = ?auto_87996 ?auto_87998 ) ) ( not ( = ?auto_87997 ?auto_87998 ) ) ( ON ?auto_87996 ?auto_87997 ) ( CLEAR ?auto_87996 ) ( ON-TABLE ?auto_87998 ) ( HOLDING ?auto_87995 ) ( CLEAR ?auto_87994 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87991 ?auto_87992 ?auto_87993 ?auto_87994 ?auto_87995 )
      ( MAKE-6PILE ?auto_87991 ?auto_87992 ?auto_87993 ?auto_87994 ?auto_87995 ?auto_87996 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87999 - BLOCK
      ?auto_88000 - BLOCK
      ?auto_88001 - BLOCK
      ?auto_88002 - BLOCK
      ?auto_88003 - BLOCK
      ?auto_88004 - BLOCK
    )
    :vars
    (
      ?auto_88005 - BLOCK
      ?auto_88006 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87999 ) ( ON ?auto_88000 ?auto_87999 ) ( ON ?auto_88001 ?auto_88000 ) ( ON ?auto_88002 ?auto_88001 ) ( not ( = ?auto_87999 ?auto_88000 ) ) ( not ( = ?auto_87999 ?auto_88001 ) ) ( not ( = ?auto_87999 ?auto_88002 ) ) ( not ( = ?auto_87999 ?auto_88003 ) ) ( not ( = ?auto_87999 ?auto_88004 ) ) ( not ( = ?auto_87999 ?auto_88005 ) ) ( not ( = ?auto_88000 ?auto_88001 ) ) ( not ( = ?auto_88000 ?auto_88002 ) ) ( not ( = ?auto_88000 ?auto_88003 ) ) ( not ( = ?auto_88000 ?auto_88004 ) ) ( not ( = ?auto_88000 ?auto_88005 ) ) ( not ( = ?auto_88001 ?auto_88002 ) ) ( not ( = ?auto_88001 ?auto_88003 ) ) ( not ( = ?auto_88001 ?auto_88004 ) ) ( not ( = ?auto_88001 ?auto_88005 ) ) ( not ( = ?auto_88002 ?auto_88003 ) ) ( not ( = ?auto_88002 ?auto_88004 ) ) ( not ( = ?auto_88002 ?auto_88005 ) ) ( not ( = ?auto_88003 ?auto_88004 ) ) ( not ( = ?auto_88003 ?auto_88005 ) ) ( not ( = ?auto_88004 ?auto_88005 ) ) ( ON ?auto_88005 ?auto_88006 ) ( not ( = ?auto_87999 ?auto_88006 ) ) ( not ( = ?auto_88000 ?auto_88006 ) ) ( not ( = ?auto_88001 ?auto_88006 ) ) ( not ( = ?auto_88002 ?auto_88006 ) ) ( not ( = ?auto_88003 ?auto_88006 ) ) ( not ( = ?auto_88004 ?auto_88006 ) ) ( not ( = ?auto_88005 ?auto_88006 ) ) ( ON ?auto_88004 ?auto_88005 ) ( ON-TABLE ?auto_88006 ) ( CLEAR ?auto_88002 ) ( ON ?auto_88003 ?auto_88004 ) ( CLEAR ?auto_88003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88006 ?auto_88005 ?auto_88004 )
      ( MAKE-6PILE ?auto_87999 ?auto_88000 ?auto_88001 ?auto_88002 ?auto_88003 ?auto_88004 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88007 - BLOCK
      ?auto_88008 - BLOCK
      ?auto_88009 - BLOCK
      ?auto_88010 - BLOCK
      ?auto_88011 - BLOCK
      ?auto_88012 - BLOCK
    )
    :vars
    (
      ?auto_88014 - BLOCK
      ?auto_88013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88007 ) ( ON ?auto_88008 ?auto_88007 ) ( ON ?auto_88009 ?auto_88008 ) ( not ( = ?auto_88007 ?auto_88008 ) ) ( not ( = ?auto_88007 ?auto_88009 ) ) ( not ( = ?auto_88007 ?auto_88010 ) ) ( not ( = ?auto_88007 ?auto_88011 ) ) ( not ( = ?auto_88007 ?auto_88012 ) ) ( not ( = ?auto_88007 ?auto_88014 ) ) ( not ( = ?auto_88008 ?auto_88009 ) ) ( not ( = ?auto_88008 ?auto_88010 ) ) ( not ( = ?auto_88008 ?auto_88011 ) ) ( not ( = ?auto_88008 ?auto_88012 ) ) ( not ( = ?auto_88008 ?auto_88014 ) ) ( not ( = ?auto_88009 ?auto_88010 ) ) ( not ( = ?auto_88009 ?auto_88011 ) ) ( not ( = ?auto_88009 ?auto_88012 ) ) ( not ( = ?auto_88009 ?auto_88014 ) ) ( not ( = ?auto_88010 ?auto_88011 ) ) ( not ( = ?auto_88010 ?auto_88012 ) ) ( not ( = ?auto_88010 ?auto_88014 ) ) ( not ( = ?auto_88011 ?auto_88012 ) ) ( not ( = ?auto_88011 ?auto_88014 ) ) ( not ( = ?auto_88012 ?auto_88014 ) ) ( ON ?auto_88014 ?auto_88013 ) ( not ( = ?auto_88007 ?auto_88013 ) ) ( not ( = ?auto_88008 ?auto_88013 ) ) ( not ( = ?auto_88009 ?auto_88013 ) ) ( not ( = ?auto_88010 ?auto_88013 ) ) ( not ( = ?auto_88011 ?auto_88013 ) ) ( not ( = ?auto_88012 ?auto_88013 ) ) ( not ( = ?auto_88014 ?auto_88013 ) ) ( ON ?auto_88012 ?auto_88014 ) ( ON-TABLE ?auto_88013 ) ( ON ?auto_88011 ?auto_88012 ) ( CLEAR ?auto_88011 ) ( HOLDING ?auto_88010 ) ( CLEAR ?auto_88009 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88007 ?auto_88008 ?auto_88009 ?auto_88010 )
      ( MAKE-6PILE ?auto_88007 ?auto_88008 ?auto_88009 ?auto_88010 ?auto_88011 ?auto_88012 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88015 - BLOCK
      ?auto_88016 - BLOCK
      ?auto_88017 - BLOCK
      ?auto_88018 - BLOCK
      ?auto_88019 - BLOCK
      ?auto_88020 - BLOCK
    )
    :vars
    (
      ?auto_88022 - BLOCK
      ?auto_88021 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88015 ) ( ON ?auto_88016 ?auto_88015 ) ( ON ?auto_88017 ?auto_88016 ) ( not ( = ?auto_88015 ?auto_88016 ) ) ( not ( = ?auto_88015 ?auto_88017 ) ) ( not ( = ?auto_88015 ?auto_88018 ) ) ( not ( = ?auto_88015 ?auto_88019 ) ) ( not ( = ?auto_88015 ?auto_88020 ) ) ( not ( = ?auto_88015 ?auto_88022 ) ) ( not ( = ?auto_88016 ?auto_88017 ) ) ( not ( = ?auto_88016 ?auto_88018 ) ) ( not ( = ?auto_88016 ?auto_88019 ) ) ( not ( = ?auto_88016 ?auto_88020 ) ) ( not ( = ?auto_88016 ?auto_88022 ) ) ( not ( = ?auto_88017 ?auto_88018 ) ) ( not ( = ?auto_88017 ?auto_88019 ) ) ( not ( = ?auto_88017 ?auto_88020 ) ) ( not ( = ?auto_88017 ?auto_88022 ) ) ( not ( = ?auto_88018 ?auto_88019 ) ) ( not ( = ?auto_88018 ?auto_88020 ) ) ( not ( = ?auto_88018 ?auto_88022 ) ) ( not ( = ?auto_88019 ?auto_88020 ) ) ( not ( = ?auto_88019 ?auto_88022 ) ) ( not ( = ?auto_88020 ?auto_88022 ) ) ( ON ?auto_88022 ?auto_88021 ) ( not ( = ?auto_88015 ?auto_88021 ) ) ( not ( = ?auto_88016 ?auto_88021 ) ) ( not ( = ?auto_88017 ?auto_88021 ) ) ( not ( = ?auto_88018 ?auto_88021 ) ) ( not ( = ?auto_88019 ?auto_88021 ) ) ( not ( = ?auto_88020 ?auto_88021 ) ) ( not ( = ?auto_88022 ?auto_88021 ) ) ( ON ?auto_88020 ?auto_88022 ) ( ON-TABLE ?auto_88021 ) ( ON ?auto_88019 ?auto_88020 ) ( CLEAR ?auto_88017 ) ( ON ?auto_88018 ?auto_88019 ) ( CLEAR ?auto_88018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88021 ?auto_88022 ?auto_88020 ?auto_88019 )
      ( MAKE-6PILE ?auto_88015 ?auto_88016 ?auto_88017 ?auto_88018 ?auto_88019 ?auto_88020 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88023 - BLOCK
      ?auto_88024 - BLOCK
      ?auto_88025 - BLOCK
      ?auto_88026 - BLOCK
      ?auto_88027 - BLOCK
      ?auto_88028 - BLOCK
    )
    :vars
    (
      ?auto_88029 - BLOCK
      ?auto_88030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88023 ) ( ON ?auto_88024 ?auto_88023 ) ( not ( = ?auto_88023 ?auto_88024 ) ) ( not ( = ?auto_88023 ?auto_88025 ) ) ( not ( = ?auto_88023 ?auto_88026 ) ) ( not ( = ?auto_88023 ?auto_88027 ) ) ( not ( = ?auto_88023 ?auto_88028 ) ) ( not ( = ?auto_88023 ?auto_88029 ) ) ( not ( = ?auto_88024 ?auto_88025 ) ) ( not ( = ?auto_88024 ?auto_88026 ) ) ( not ( = ?auto_88024 ?auto_88027 ) ) ( not ( = ?auto_88024 ?auto_88028 ) ) ( not ( = ?auto_88024 ?auto_88029 ) ) ( not ( = ?auto_88025 ?auto_88026 ) ) ( not ( = ?auto_88025 ?auto_88027 ) ) ( not ( = ?auto_88025 ?auto_88028 ) ) ( not ( = ?auto_88025 ?auto_88029 ) ) ( not ( = ?auto_88026 ?auto_88027 ) ) ( not ( = ?auto_88026 ?auto_88028 ) ) ( not ( = ?auto_88026 ?auto_88029 ) ) ( not ( = ?auto_88027 ?auto_88028 ) ) ( not ( = ?auto_88027 ?auto_88029 ) ) ( not ( = ?auto_88028 ?auto_88029 ) ) ( ON ?auto_88029 ?auto_88030 ) ( not ( = ?auto_88023 ?auto_88030 ) ) ( not ( = ?auto_88024 ?auto_88030 ) ) ( not ( = ?auto_88025 ?auto_88030 ) ) ( not ( = ?auto_88026 ?auto_88030 ) ) ( not ( = ?auto_88027 ?auto_88030 ) ) ( not ( = ?auto_88028 ?auto_88030 ) ) ( not ( = ?auto_88029 ?auto_88030 ) ) ( ON ?auto_88028 ?auto_88029 ) ( ON-TABLE ?auto_88030 ) ( ON ?auto_88027 ?auto_88028 ) ( ON ?auto_88026 ?auto_88027 ) ( CLEAR ?auto_88026 ) ( HOLDING ?auto_88025 ) ( CLEAR ?auto_88024 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88023 ?auto_88024 ?auto_88025 )
      ( MAKE-6PILE ?auto_88023 ?auto_88024 ?auto_88025 ?auto_88026 ?auto_88027 ?auto_88028 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88031 - BLOCK
      ?auto_88032 - BLOCK
      ?auto_88033 - BLOCK
      ?auto_88034 - BLOCK
      ?auto_88035 - BLOCK
      ?auto_88036 - BLOCK
    )
    :vars
    (
      ?auto_88038 - BLOCK
      ?auto_88037 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88031 ) ( ON ?auto_88032 ?auto_88031 ) ( not ( = ?auto_88031 ?auto_88032 ) ) ( not ( = ?auto_88031 ?auto_88033 ) ) ( not ( = ?auto_88031 ?auto_88034 ) ) ( not ( = ?auto_88031 ?auto_88035 ) ) ( not ( = ?auto_88031 ?auto_88036 ) ) ( not ( = ?auto_88031 ?auto_88038 ) ) ( not ( = ?auto_88032 ?auto_88033 ) ) ( not ( = ?auto_88032 ?auto_88034 ) ) ( not ( = ?auto_88032 ?auto_88035 ) ) ( not ( = ?auto_88032 ?auto_88036 ) ) ( not ( = ?auto_88032 ?auto_88038 ) ) ( not ( = ?auto_88033 ?auto_88034 ) ) ( not ( = ?auto_88033 ?auto_88035 ) ) ( not ( = ?auto_88033 ?auto_88036 ) ) ( not ( = ?auto_88033 ?auto_88038 ) ) ( not ( = ?auto_88034 ?auto_88035 ) ) ( not ( = ?auto_88034 ?auto_88036 ) ) ( not ( = ?auto_88034 ?auto_88038 ) ) ( not ( = ?auto_88035 ?auto_88036 ) ) ( not ( = ?auto_88035 ?auto_88038 ) ) ( not ( = ?auto_88036 ?auto_88038 ) ) ( ON ?auto_88038 ?auto_88037 ) ( not ( = ?auto_88031 ?auto_88037 ) ) ( not ( = ?auto_88032 ?auto_88037 ) ) ( not ( = ?auto_88033 ?auto_88037 ) ) ( not ( = ?auto_88034 ?auto_88037 ) ) ( not ( = ?auto_88035 ?auto_88037 ) ) ( not ( = ?auto_88036 ?auto_88037 ) ) ( not ( = ?auto_88038 ?auto_88037 ) ) ( ON ?auto_88036 ?auto_88038 ) ( ON-TABLE ?auto_88037 ) ( ON ?auto_88035 ?auto_88036 ) ( ON ?auto_88034 ?auto_88035 ) ( CLEAR ?auto_88032 ) ( ON ?auto_88033 ?auto_88034 ) ( CLEAR ?auto_88033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88037 ?auto_88038 ?auto_88036 ?auto_88035 ?auto_88034 )
      ( MAKE-6PILE ?auto_88031 ?auto_88032 ?auto_88033 ?auto_88034 ?auto_88035 ?auto_88036 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88039 - BLOCK
      ?auto_88040 - BLOCK
      ?auto_88041 - BLOCK
      ?auto_88042 - BLOCK
      ?auto_88043 - BLOCK
      ?auto_88044 - BLOCK
    )
    :vars
    (
      ?auto_88046 - BLOCK
      ?auto_88045 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88039 ) ( not ( = ?auto_88039 ?auto_88040 ) ) ( not ( = ?auto_88039 ?auto_88041 ) ) ( not ( = ?auto_88039 ?auto_88042 ) ) ( not ( = ?auto_88039 ?auto_88043 ) ) ( not ( = ?auto_88039 ?auto_88044 ) ) ( not ( = ?auto_88039 ?auto_88046 ) ) ( not ( = ?auto_88040 ?auto_88041 ) ) ( not ( = ?auto_88040 ?auto_88042 ) ) ( not ( = ?auto_88040 ?auto_88043 ) ) ( not ( = ?auto_88040 ?auto_88044 ) ) ( not ( = ?auto_88040 ?auto_88046 ) ) ( not ( = ?auto_88041 ?auto_88042 ) ) ( not ( = ?auto_88041 ?auto_88043 ) ) ( not ( = ?auto_88041 ?auto_88044 ) ) ( not ( = ?auto_88041 ?auto_88046 ) ) ( not ( = ?auto_88042 ?auto_88043 ) ) ( not ( = ?auto_88042 ?auto_88044 ) ) ( not ( = ?auto_88042 ?auto_88046 ) ) ( not ( = ?auto_88043 ?auto_88044 ) ) ( not ( = ?auto_88043 ?auto_88046 ) ) ( not ( = ?auto_88044 ?auto_88046 ) ) ( ON ?auto_88046 ?auto_88045 ) ( not ( = ?auto_88039 ?auto_88045 ) ) ( not ( = ?auto_88040 ?auto_88045 ) ) ( not ( = ?auto_88041 ?auto_88045 ) ) ( not ( = ?auto_88042 ?auto_88045 ) ) ( not ( = ?auto_88043 ?auto_88045 ) ) ( not ( = ?auto_88044 ?auto_88045 ) ) ( not ( = ?auto_88046 ?auto_88045 ) ) ( ON ?auto_88044 ?auto_88046 ) ( ON-TABLE ?auto_88045 ) ( ON ?auto_88043 ?auto_88044 ) ( ON ?auto_88042 ?auto_88043 ) ( ON ?auto_88041 ?auto_88042 ) ( CLEAR ?auto_88041 ) ( HOLDING ?auto_88040 ) ( CLEAR ?auto_88039 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88039 ?auto_88040 )
      ( MAKE-6PILE ?auto_88039 ?auto_88040 ?auto_88041 ?auto_88042 ?auto_88043 ?auto_88044 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88047 - BLOCK
      ?auto_88048 - BLOCK
      ?auto_88049 - BLOCK
      ?auto_88050 - BLOCK
      ?auto_88051 - BLOCK
      ?auto_88052 - BLOCK
    )
    :vars
    (
      ?auto_88054 - BLOCK
      ?auto_88053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88047 ) ( not ( = ?auto_88047 ?auto_88048 ) ) ( not ( = ?auto_88047 ?auto_88049 ) ) ( not ( = ?auto_88047 ?auto_88050 ) ) ( not ( = ?auto_88047 ?auto_88051 ) ) ( not ( = ?auto_88047 ?auto_88052 ) ) ( not ( = ?auto_88047 ?auto_88054 ) ) ( not ( = ?auto_88048 ?auto_88049 ) ) ( not ( = ?auto_88048 ?auto_88050 ) ) ( not ( = ?auto_88048 ?auto_88051 ) ) ( not ( = ?auto_88048 ?auto_88052 ) ) ( not ( = ?auto_88048 ?auto_88054 ) ) ( not ( = ?auto_88049 ?auto_88050 ) ) ( not ( = ?auto_88049 ?auto_88051 ) ) ( not ( = ?auto_88049 ?auto_88052 ) ) ( not ( = ?auto_88049 ?auto_88054 ) ) ( not ( = ?auto_88050 ?auto_88051 ) ) ( not ( = ?auto_88050 ?auto_88052 ) ) ( not ( = ?auto_88050 ?auto_88054 ) ) ( not ( = ?auto_88051 ?auto_88052 ) ) ( not ( = ?auto_88051 ?auto_88054 ) ) ( not ( = ?auto_88052 ?auto_88054 ) ) ( ON ?auto_88054 ?auto_88053 ) ( not ( = ?auto_88047 ?auto_88053 ) ) ( not ( = ?auto_88048 ?auto_88053 ) ) ( not ( = ?auto_88049 ?auto_88053 ) ) ( not ( = ?auto_88050 ?auto_88053 ) ) ( not ( = ?auto_88051 ?auto_88053 ) ) ( not ( = ?auto_88052 ?auto_88053 ) ) ( not ( = ?auto_88054 ?auto_88053 ) ) ( ON ?auto_88052 ?auto_88054 ) ( ON-TABLE ?auto_88053 ) ( ON ?auto_88051 ?auto_88052 ) ( ON ?auto_88050 ?auto_88051 ) ( ON ?auto_88049 ?auto_88050 ) ( CLEAR ?auto_88047 ) ( ON ?auto_88048 ?auto_88049 ) ( CLEAR ?auto_88048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88053 ?auto_88054 ?auto_88052 ?auto_88051 ?auto_88050 ?auto_88049 )
      ( MAKE-6PILE ?auto_88047 ?auto_88048 ?auto_88049 ?auto_88050 ?auto_88051 ?auto_88052 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88055 - BLOCK
      ?auto_88056 - BLOCK
      ?auto_88057 - BLOCK
      ?auto_88058 - BLOCK
      ?auto_88059 - BLOCK
      ?auto_88060 - BLOCK
    )
    :vars
    (
      ?auto_88061 - BLOCK
      ?auto_88062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88055 ?auto_88056 ) ) ( not ( = ?auto_88055 ?auto_88057 ) ) ( not ( = ?auto_88055 ?auto_88058 ) ) ( not ( = ?auto_88055 ?auto_88059 ) ) ( not ( = ?auto_88055 ?auto_88060 ) ) ( not ( = ?auto_88055 ?auto_88061 ) ) ( not ( = ?auto_88056 ?auto_88057 ) ) ( not ( = ?auto_88056 ?auto_88058 ) ) ( not ( = ?auto_88056 ?auto_88059 ) ) ( not ( = ?auto_88056 ?auto_88060 ) ) ( not ( = ?auto_88056 ?auto_88061 ) ) ( not ( = ?auto_88057 ?auto_88058 ) ) ( not ( = ?auto_88057 ?auto_88059 ) ) ( not ( = ?auto_88057 ?auto_88060 ) ) ( not ( = ?auto_88057 ?auto_88061 ) ) ( not ( = ?auto_88058 ?auto_88059 ) ) ( not ( = ?auto_88058 ?auto_88060 ) ) ( not ( = ?auto_88058 ?auto_88061 ) ) ( not ( = ?auto_88059 ?auto_88060 ) ) ( not ( = ?auto_88059 ?auto_88061 ) ) ( not ( = ?auto_88060 ?auto_88061 ) ) ( ON ?auto_88061 ?auto_88062 ) ( not ( = ?auto_88055 ?auto_88062 ) ) ( not ( = ?auto_88056 ?auto_88062 ) ) ( not ( = ?auto_88057 ?auto_88062 ) ) ( not ( = ?auto_88058 ?auto_88062 ) ) ( not ( = ?auto_88059 ?auto_88062 ) ) ( not ( = ?auto_88060 ?auto_88062 ) ) ( not ( = ?auto_88061 ?auto_88062 ) ) ( ON ?auto_88060 ?auto_88061 ) ( ON-TABLE ?auto_88062 ) ( ON ?auto_88059 ?auto_88060 ) ( ON ?auto_88058 ?auto_88059 ) ( ON ?auto_88057 ?auto_88058 ) ( ON ?auto_88056 ?auto_88057 ) ( CLEAR ?auto_88056 ) ( HOLDING ?auto_88055 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88055 )
      ( MAKE-6PILE ?auto_88055 ?auto_88056 ?auto_88057 ?auto_88058 ?auto_88059 ?auto_88060 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88063 - BLOCK
      ?auto_88064 - BLOCK
      ?auto_88065 - BLOCK
      ?auto_88066 - BLOCK
      ?auto_88067 - BLOCK
      ?auto_88068 - BLOCK
    )
    :vars
    (
      ?auto_88070 - BLOCK
      ?auto_88069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88063 ?auto_88064 ) ) ( not ( = ?auto_88063 ?auto_88065 ) ) ( not ( = ?auto_88063 ?auto_88066 ) ) ( not ( = ?auto_88063 ?auto_88067 ) ) ( not ( = ?auto_88063 ?auto_88068 ) ) ( not ( = ?auto_88063 ?auto_88070 ) ) ( not ( = ?auto_88064 ?auto_88065 ) ) ( not ( = ?auto_88064 ?auto_88066 ) ) ( not ( = ?auto_88064 ?auto_88067 ) ) ( not ( = ?auto_88064 ?auto_88068 ) ) ( not ( = ?auto_88064 ?auto_88070 ) ) ( not ( = ?auto_88065 ?auto_88066 ) ) ( not ( = ?auto_88065 ?auto_88067 ) ) ( not ( = ?auto_88065 ?auto_88068 ) ) ( not ( = ?auto_88065 ?auto_88070 ) ) ( not ( = ?auto_88066 ?auto_88067 ) ) ( not ( = ?auto_88066 ?auto_88068 ) ) ( not ( = ?auto_88066 ?auto_88070 ) ) ( not ( = ?auto_88067 ?auto_88068 ) ) ( not ( = ?auto_88067 ?auto_88070 ) ) ( not ( = ?auto_88068 ?auto_88070 ) ) ( ON ?auto_88070 ?auto_88069 ) ( not ( = ?auto_88063 ?auto_88069 ) ) ( not ( = ?auto_88064 ?auto_88069 ) ) ( not ( = ?auto_88065 ?auto_88069 ) ) ( not ( = ?auto_88066 ?auto_88069 ) ) ( not ( = ?auto_88067 ?auto_88069 ) ) ( not ( = ?auto_88068 ?auto_88069 ) ) ( not ( = ?auto_88070 ?auto_88069 ) ) ( ON ?auto_88068 ?auto_88070 ) ( ON-TABLE ?auto_88069 ) ( ON ?auto_88067 ?auto_88068 ) ( ON ?auto_88066 ?auto_88067 ) ( ON ?auto_88065 ?auto_88066 ) ( ON ?auto_88064 ?auto_88065 ) ( ON ?auto_88063 ?auto_88064 ) ( CLEAR ?auto_88063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88069 ?auto_88070 ?auto_88068 ?auto_88067 ?auto_88066 ?auto_88065 ?auto_88064 )
      ( MAKE-6PILE ?auto_88063 ?auto_88064 ?auto_88065 ?auto_88066 ?auto_88067 ?auto_88068 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88072 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_88072 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_88072 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88073 - BLOCK
    )
    :vars
    (
      ?auto_88074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88073 ?auto_88074 ) ( CLEAR ?auto_88073 ) ( HAND-EMPTY ) ( not ( = ?auto_88073 ?auto_88074 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88073 ?auto_88074 )
      ( MAKE-1PILE ?auto_88073 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88075 - BLOCK
    )
    :vars
    (
      ?auto_88076 - BLOCK
      ?auto_88079 - BLOCK
      ?auto_88080 - BLOCK
      ?auto_88078 - BLOCK
      ?auto_88077 - BLOCK
      ?auto_88081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88075 ?auto_88076 ) ) ( HOLDING ?auto_88075 ) ( CLEAR ?auto_88076 ) ( ON-TABLE ?auto_88079 ) ( ON ?auto_88080 ?auto_88079 ) ( ON ?auto_88078 ?auto_88080 ) ( ON ?auto_88077 ?auto_88078 ) ( ON ?auto_88081 ?auto_88077 ) ( ON ?auto_88076 ?auto_88081 ) ( not ( = ?auto_88079 ?auto_88080 ) ) ( not ( = ?auto_88079 ?auto_88078 ) ) ( not ( = ?auto_88079 ?auto_88077 ) ) ( not ( = ?auto_88079 ?auto_88081 ) ) ( not ( = ?auto_88079 ?auto_88076 ) ) ( not ( = ?auto_88079 ?auto_88075 ) ) ( not ( = ?auto_88080 ?auto_88078 ) ) ( not ( = ?auto_88080 ?auto_88077 ) ) ( not ( = ?auto_88080 ?auto_88081 ) ) ( not ( = ?auto_88080 ?auto_88076 ) ) ( not ( = ?auto_88080 ?auto_88075 ) ) ( not ( = ?auto_88078 ?auto_88077 ) ) ( not ( = ?auto_88078 ?auto_88081 ) ) ( not ( = ?auto_88078 ?auto_88076 ) ) ( not ( = ?auto_88078 ?auto_88075 ) ) ( not ( = ?auto_88077 ?auto_88081 ) ) ( not ( = ?auto_88077 ?auto_88076 ) ) ( not ( = ?auto_88077 ?auto_88075 ) ) ( not ( = ?auto_88081 ?auto_88076 ) ) ( not ( = ?auto_88081 ?auto_88075 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88079 ?auto_88080 ?auto_88078 ?auto_88077 ?auto_88081 ?auto_88076 ?auto_88075 )
      ( MAKE-1PILE ?auto_88075 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88082 - BLOCK
    )
    :vars
    (
      ?auto_88084 - BLOCK
      ?auto_88085 - BLOCK
      ?auto_88088 - BLOCK
      ?auto_88087 - BLOCK
      ?auto_88086 - BLOCK
      ?auto_88083 - BLOCK
      ?auto_88089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88082 ?auto_88084 ) ) ( CLEAR ?auto_88084 ) ( ON-TABLE ?auto_88085 ) ( ON ?auto_88088 ?auto_88085 ) ( ON ?auto_88087 ?auto_88088 ) ( ON ?auto_88086 ?auto_88087 ) ( ON ?auto_88083 ?auto_88086 ) ( ON ?auto_88084 ?auto_88083 ) ( not ( = ?auto_88085 ?auto_88088 ) ) ( not ( = ?auto_88085 ?auto_88087 ) ) ( not ( = ?auto_88085 ?auto_88086 ) ) ( not ( = ?auto_88085 ?auto_88083 ) ) ( not ( = ?auto_88085 ?auto_88084 ) ) ( not ( = ?auto_88085 ?auto_88082 ) ) ( not ( = ?auto_88088 ?auto_88087 ) ) ( not ( = ?auto_88088 ?auto_88086 ) ) ( not ( = ?auto_88088 ?auto_88083 ) ) ( not ( = ?auto_88088 ?auto_88084 ) ) ( not ( = ?auto_88088 ?auto_88082 ) ) ( not ( = ?auto_88087 ?auto_88086 ) ) ( not ( = ?auto_88087 ?auto_88083 ) ) ( not ( = ?auto_88087 ?auto_88084 ) ) ( not ( = ?auto_88087 ?auto_88082 ) ) ( not ( = ?auto_88086 ?auto_88083 ) ) ( not ( = ?auto_88086 ?auto_88084 ) ) ( not ( = ?auto_88086 ?auto_88082 ) ) ( not ( = ?auto_88083 ?auto_88084 ) ) ( not ( = ?auto_88083 ?auto_88082 ) ) ( ON ?auto_88082 ?auto_88089 ) ( CLEAR ?auto_88082 ) ( HAND-EMPTY ) ( not ( = ?auto_88082 ?auto_88089 ) ) ( not ( = ?auto_88084 ?auto_88089 ) ) ( not ( = ?auto_88085 ?auto_88089 ) ) ( not ( = ?auto_88088 ?auto_88089 ) ) ( not ( = ?auto_88087 ?auto_88089 ) ) ( not ( = ?auto_88086 ?auto_88089 ) ) ( not ( = ?auto_88083 ?auto_88089 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88082 ?auto_88089 )
      ( MAKE-1PILE ?auto_88082 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88090 - BLOCK
    )
    :vars
    (
      ?auto_88093 - BLOCK
      ?auto_88095 - BLOCK
      ?auto_88097 - BLOCK
      ?auto_88092 - BLOCK
      ?auto_88094 - BLOCK
      ?auto_88096 - BLOCK
      ?auto_88091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88090 ?auto_88093 ) ) ( ON-TABLE ?auto_88095 ) ( ON ?auto_88097 ?auto_88095 ) ( ON ?auto_88092 ?auto_88097 ) ( ON ?auto_88094 ?auto_88092 ) ( ON ?auto_88096 ?auto_88094 ) ( not ( = ?auto_88095 ?auto_88097 ) ) ( not ( = ?auto_88095 ?auto_88092 ) ) ( not ( = ?auto_88095 ?auto_88094 ) ) ( not ( = ?auto_88095 ?auto_88096 ) ) ( not ( = ?auto_88095 ?auto_88093 ) ) ( not ( = ?auto_88095 ?auto_88090 ) ) ( not ( = ?auto_88097 ?auto_88092 ) ) ( not ( = ?auto_88097 ?auto_88094 ) ) ( not ( = ?auto_88097 ?auto_88096 ) ) ( not ( = ?auto_88097 ?auto_88093 ) ) ( not ( = ?auto_88097 ?auto_88090 ) ) ( not ( = ?auto_88092 ?auto_88094 ) ) ( not ( = ?auto_88092 ?auto_88096 ) ) ( not ( = ?auto_88092 ?auto_88093 ) ) ( not ( = ?auto_88092 ?auto_88090 ) ) ( not ( = ?auto_88094 ?auto_88096 ) ) ( not ( = ?auto_88094 ?auto_88093 ) ) ( not ( = ?auto_88094 ?auto_88090 ) ) ( not ( = ?auto_88096 ?auto_88093 ) ) ( not ( = ?auto_88096 ?auto_88090 ) ) ( ON ?auto_88090 ?auto_88091 ) ( CLEAR ?auto_88090 ) ( not ( = ?auto_88090 ?auto_88091 ) ) ( not ( = ?auto_88093 ?auto_88091 ) ) ( not ( = ?auto_88095 ?auto_88091 ) ) ( not ( = ?auto_88097 ?auto_88091 ) ) ( not ( = ?auto_88092 ?auto_88091 ) ) ( not ( = ?auto_88094 ?auto_88091 ) ) ( not ( = ?auto_88096 ?auto_88091 ) ) ( HOLDING ?auto_88093 ) ( CLEAR ?auto_88096 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88095 ?auto_88097 ?auto_88092 ?auto_88094 ?auto_88096 ?auto_88093 )
      ( MAKE-1PILE ?auto_88090 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88098 - BLOCK
    )
    :vars
    (
      ?auto_88105 - BLOCK
      ?auto_88103 - BLOCK
      ?auto_88099 - BLOCK
      ?auto_88101 - BLOCK
      ?auto_88104 - BLOCK
      ?auto_88102 - BLOCK
      ?auto_88100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88098 ?auto_88105 ) ) ( ON-TABLE ?auto_88103 ) ( ON ?auto_88099 ?auto_88103 ) ( ON ?auto_88101 ?auto_88099 ) ( ON ?auto_88104 ?auto_88101 ) ( ON ?auto_88102 ?auto_88104 ) ( not ( = ?auto_88103 ?auto_88099 ) ) ( not ( = ?auto_88103 ?auto_88101 ) ) ( not ( = ?auto_88103 ?auto_88104 ) ) ( not ( = ?auto_88103 ?auto_88102 ) ) ( not ( = ?auto_88103 ?auto_88105 ) ) ( not ( = ?auto_88103 ?auto_88098 ) ) ( not ( = ?auto_88099 ?auto_88101 ) ) ( not ( = ?auto_88099 ?auto_88104 ) ) ( not ( = ?auto_88099 ?auto_88102 ) ) ( not ( = ?auto_88099 ?auto_88105 ) ) ( not ( = ?auto_88099 ?auto_88098 ) ) ( not ( = ?auto_88101 ?auto_88104 ) ) ( not ( = ?auto_88101 ?auto_88102 ) ) ( not ( = ?auto_88101 ?auto_88105 ) ) ( not ( = ?auto_88101 ?auto_88098 ) ) ( not ( = ?auto_88104 ?auto_88102 ) ) ( not ( = ?auto_88104 ?auto_88105 ) ) ( not ( = ?auto_88104 ?auto_88098 ) ) ( not ( = ?auto_88102 ?auto_88105 ) ) ( not ( = ?auto_88102 ?auto_88098 ) ) ( ON ?auto_88098 ?auto_88100 ) ( not ( = ?auto_88098 ?auto_88100 ) ) ( not ( = ?auto_88105 ?auto_88100 ) ) ( not ( = ?auto_88103 ?auto_88100 ) ) ( not ( = ?auto_88099 ?auto_88100 ) ) ( not ( = ?auto_88101 ?auto_88100 ) ) ( not ( = ?auto_88104 ?auto_88100 ) ) ( not ( = ?auto_88102 ?auto_88100 ) ) ( CLEAR ?auto_88102 ) ( ON ?auto_88105 ?auto_88098 ) ( CLEAR ?auto_88105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88100 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88100 ?auto_88098 )
      ( MAKE-1PILE ?auto_88098 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88106 - BLOCK
    )
    :vars
    (
      ?auto_88109 - BLOCK
      ?auto_88107 - BLOCK
      ?auto_88113 - BLOCK
      ?auto_88108 - BLOCK
      ?auto_88110 - BLOCK
      ?auto_88112 - BLOCK
      ?auto_88111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88106 ?auto_88109 ) ) ( ON-TABLE ?auto_88107 ) ( ON ?auto_88113 ?auto_88107 ) ( ON ?auto_88108 ?auto_88113 ) ( ON ?auto_88110 ?auto_88108 ) ( not ( = ?auto_88107 ?auto_88113 ) ) ( not ( = ?auto_88107 ?auto_88108 ) ) ( not ( = ?auto_88107 ?auto_88110 ) ) ( not ( = ?auto_88107 ?auto_88112 ) ) ( not ( = ?auto_88107 ?auto_88109 ) ) ( not ( = ?auto_88107 ?auto_88106 ) ) ( not ( = ?auto_88113 ?auto_88108 ) ) ( not ( = ?auto_88113 ?auto_88110 ) ) ( not ( = ?auto_88113 ?auto_88112 ) ) ( not ( = ?auto_88113 ?auto_88109 ) ) ( not ( = ?auto_88113 ?auto_88106 ) ) ( not ( = ?auto_88108 ?auto_88110 ) ) ( not ( = ?auto_88108 ?auto_88112 ) ) ( not ( = ?auto_88108 ?auto_88109 ) ) ( not ( = ?auto_88108 ?auto_88106 ) ) ( not ( = ?auto_88110 ?auto_88112 ) ) ( not ( = ?auto_88110 ?auto_88109 ) ) ( not ( = ?auto_88110 ?auto_88106 ) ) ( not ( = ?auto_88112 ?auto_88109 ) ) ( not ( = ?auto_88112 ?auto_88106 ) ) ( ON ?auto_88106 ?auto_88111 ) ( not ( = ?auto_88106 ?auto_88111 ) ) ( not ( = ?auto_88109 ?auto_88111 ) ) ( not ( = ?auto_88107 ?auto_88111 ) ) ( not ( = ?auto_88113 ?auto_88111 ) ) ( not ( = ?auto_88108 ?auto_88111 ) ) ( not ( = ?auto_88110 ?auto_88111 ) ) ( not ( = ?auto_88112 ?auto_88111 ) ) ( ON ?auto_88109 ?auto_88106 ) ( CLEAR ?auto_88109 ) ( ON-TABLE ?auto_88111 ) ( HOLDING ?auto_88112 ) ( CLEAR ?auto_88110 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88107 ?auto_88113 ?auto_88108 ?auto_88110 ?auto_88112 )
      ( MAKE-1PILE ?auto_88106 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88114 - BLOCK
    )
    :vars
    (
      ?auto_88119 - BLOCK
      ?auto_88120 - BLOCK
      ?auto_88118 - BLOCK
      ?auto_88121 - BLOCK
      ?auto_88115 - BLOCK
      ?auto_88117 - BLOCK
      ?auto_88116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88114 ?auto_88119 ) ) ( ON-TABLE ?auto_88120 ) ( ON ?auto_88118 ?auto_88120 ) ( ON ?auto_88121 ?auto_88118 ) ( ON ?auto_88115 ?auto_88121 ) ( not ( = ?auto_88120 ?auto_88118 ) ) ( not ( = ?auto_88120 ?auto_88121 ) ) ( not ( = ?auto_88120 ?auto_88115 ) ) ( not ( = ?auto_88120 ?auto_88117 ) ) ( not ( = ?auto_88120 ?auto_88119 ) ) ( not ( = ?auto_88120 ?auto_88114 ) ) ( not ( = ?auto_88118 ?auto_88121 ) ) ( not ( = ?auto_88118 ?auto_88115 ) ) ( not ( = ?auto_88118 ?auto_88117 ) ) ( not ( = ?auto_88118 ?auto_88119 ) ) ( not ( = ?auto_88118 ?auto_88114 ) ) ( not ( = ?auto_88121 ?auto_88115 ) ) ( not ( = ?auto_88121 ?auto_88117 ) ) ( not ( = ?auto_88121 ?auto_88119 ) ) ( not ( = ?auto_88121 ?auto_88114 ) ) ( not ( = ?auto_88115 ?auto_88117 ) ) ( not ( = ?auto_88115 ?auto_88119 ) ) ( not ( = ?auto_88115 ?auto_88114 ) ) ( not ( = ?auto_88117 ?auto_88119 ) ) ( not ( = ?auto_88117 ?auto_88114 ) ) ( ON ?auto_88114 ?auto_88116 ) ( not ( = ?auto_88114 ?auto_88116 ) ) ( not ( = ?auto_88119 ?auto_88116 ) ) ( not ( = ?auto_88120 ?auto_88116 ) ) ( not ( = ?auto_88118 ?auto_88116 ) ) ( not ( = ?auto_88121 ?auto_88116 ) ) ( not ( = ?auto_88115 ?auto_88116 ) ) ( not ( = ?auto_88117 ?auto_88116 ) ) ( ON ?auto_88119 ?auto_88114 ) ( ON-TABLE ?auto_88116 ) ( CLEAR ?auto_88115 ) ( ON ?auto_88117 ?auto_88119 ) ( CLEAR ?auto_88117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88116 ?auto_88114 ?auto_88119 )
      ( MAKE-1PILE ?auto_88114 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88122 - BLOCK
    )
    :vars
    (
      ?auto_88124 - BLOCK
      ?auto_88125 - BLOCK
      ?auto_88123 - BLOCK
      ?auto_88126 - BLOCK
      ?auto_88128 - BLOCK
      ?auto_88127 - BLOCK
      ?auto_88129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88122 ?auto_88124 ) ) ( ON-TABLE ?auto_88125 ) ( ON ?auto_88123 ?auto_88125 ) ( ON ?auto_88126 ?auto_88123 ) ( not ( = ?auto_88125 ?auto_88123 ) ) ( not ( = ?auto_88125 ?auto_88126 ) ) ( not ( = ?auto_88125 ?auto_88128 ) ) ( not ( = ?auto_88125 ?auto_88127 ) ) ( not ( = ?auto_88125 ?auto_88124 ) ) ( not ( = ?auto_88125 ?auto_88122 ) ) ( not ( = ?auto_88123 ?auto_88126 ) ) ( not ( = ?auto_88123 ?auto_88128 ) ) ( not ( = ?auto_88123 ?auto_88127 ) ) ( not ( = ?auto_88123 ?auto_88124 ) ) ( not ( = ?auto_88123 ?auto_88122 ) ) ( not ( = ?auto_88126 ?auto_88128 ) ) ( not ( = ?auto_88126 ?auto_88127 ) ) ( not ( = ?auto_88126 ?auto_88124 ) ) ( not ( = ?auto_88126 ?auto_88122 ) ) ( not ( = ?auto_88128 ?auto_88127 ) ) ( not ( = ?auto_88128 ?auto_88124 ) ) ( not ( = ?auto_88128 ?auto_88122 ) ) ( not ( = ?auto_88127 ?auto_88124 ) ) ( not ( = ?auto_88127 ?auto_88122 ) ) ( ON ?auto_88122 ?auto_88129 ) ( not ( = ?auto_88122 ?auto_88129 ) ) ( not ( = ?auto_88124 ?auto_88129 ) ) ( not ( = ?auto_88125 ?auto_88129 ) ) ( not ( = ?auto_88123 ?auto_88129 ) ) ( not ( = ?auto_88126 ?auto_88129 ) ) ( not ( = ?auto_88128 ?auto_88129 ) ) ( not ( = ?auto_88127 ?auto_88129 ) ) ( ON ?auto_88124 ?auto_88122 ) ( ON-TABLE ?auto_88129 ) ( ON ?auto_88127 ?auto_88124 ) ( CLEAR ?auto_88127 ) ( HOLDING ?auto_88128 ) ( CLEAR ?auto_88126 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88125 ?auto_88123 ?auto_88126 ?auto_88128 )
      ( MAKE-1PILE ?auto_88122 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88130 - BLOCK
    )
    :vars
    (
      ?auto_88136 - BLOCK
      ?auto_88137 - BLOCK
      ?auto_88134 - BLOCK
      ?auto_88131 - BLOCK
      ?auto_88132 - BLOCK
      ?auto_88133 - BLOCK
      ?auto_88135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88130 ?auto_88136 ) ) ( ON-TABLE ?auto_88137 ) ( ON ?auto_88134 ?auto_88137 ) ( ON ?auto_88131 ?auto_88134 ) ( not ( = ?auto_88137 ?auto_88134 ) ) ( not ( = ?auto_88137 ?auto_88131 ) ) ( not ( = ?auto_88137 ?auto_88132 ) ) ( not ( = ?auto_88137 ?auto_88133 ) ) ( not ( = ?auto_88137 ?auto_88136 ) ) ( not ( = ?auto_88137 ?auto_88130 ) ) ( not ( = ?auto_88134 ?auto_88131 ) ) ( not ( = ?auto_88134 ?auto_88132 ) ) ( not ( = ?auto_88134 ?auto_88133 ) ) ( not ( = ?auto_88134 ?auto_88136 ) ) ( not ( = ?auto_88134 ?auto_88130 ) ) ( not ( = ?auto_88131 ?auto_88132 ) ) ( not ( = ?auto_88131 ?auto_88133 ) ) ( not ( = ?auto_88131 ?auto_88136 ) ) ( not ( = ?auto_88131 ?auto_88130 ) ) ( not ( = ?auto_88132 ?auto_88133 ) ) ( not ( = ?auto_88132 ?auto_88136 ) ) ( not ( = ?auto_88132 ?auto_88130 ) ) ( not ( = ?auto_88133 ?auto_88136 ) ) ( not ( = ?auto_88133 ?auto_88130 ) ) ( ON ?auto_88130 ?auto_88135 ) ( not ( = ?auto_88130 ?auto_88135 ) ) ( not ( = ?auto_88136 ?auto_88135 ) ) ( not ( = ?auto_88137 ?auto_88135 ) ) ( not ( = ?auto_88134 ?auto_88135 ) ) ( not ( = ?auto_88131 ?auto_88135 ) ) ( not ( = ?auto_88132 ?auto_88135 ) ) ( not ( = ?auto_88133 ?auto_88135 ) ) ( ON ?auto_88136 ?auto_88130 ) ( ON-TABLE ?auto_88135 ) ( ON ?auto_88133 ?auto_88136 ) ( CLEAR ?auto_88131 ) ( ON ?auto_88132 ?auto_88133 ) ( CLEAR ?auto_88132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88135 ?auto_88130 ?auto_88136 ?auto_88133 )
      ( MAKE-1PILE ?auto_88130 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88138 - BLOCK
    )
    :vars
    (
      ?auto_88141 - BLOCK
      ?auto_88140 - BLOCK
      ?auto_88142 - BLOCK
      ?auto_88144 - BLOCK
      ?auto_88139 - BLOCK
      ?auto_88143 - BLOCK
      ?auto_88145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88138 ?auto_88141 ) ) ( ON-TABLE ?auto_88140 ) ( ON ?auto_88142 ?auto_88140 ) ( not ( = ?auto_88140 ?auto_88142 ) ) ( not ( = ?auto_88140 ?auto_88144 ) ) ( not ( = ?auto_88140 ?auto_88139 ) ) ( not ( = ?auto_88140 ?auto_88143 ) ) ( not ( = ?auto_88140 ?auto_88141 ) ) ( not ( = ?auto_88140 ?auto_88138 ) ) ( not ( = ?auto_88142 ?auto_88144 ) ) ( not ( = ?auto_88142 ?auto_88139 ) ) ( not ( = ?auto_88142 ?auto_88143 ) ) ( not ( = ?auto_88142 ?auto_88141 ) ) ( not ( = ?auto_88142 ?auto_88138 ) ) ( not ( = ?auto_88144 ?auto_88139 ) ) ( not ( = ?auto_88144 ?auto_88143 ) ) ( not ( = ?auto_88144 ?auto_88141 ) ) ( not ( = ?auto_88144 ?auto_88138 ) ) ( not ( = ?auto_88139 ?auto_88143 ) ) ( not ( = ?auto_88139 ?auto_88141 ) ) ( not ( = ?auto_88139 ?auto_88138 ) ) ( not ( = ?auto_88143 ?auto_88141 ) ) ( not ( = ?auto_88143 ?auto_88138 ) ) ( ON ?auto_88138 ?auto_88145 ) ( not ( = ?auto_88138 ?auto_88145 ) ) ( not ( = ?auto_88141 ?auto_88145 ) ) ( not ( = ?auto_88140 ?auto_88145 ) ) ( not ( = ?auto_88142 ?auto_88145 ) ) ( not ( = ?auto_88144 ?auto_88145 ) ) ( not ( = ?auto_88139 ?auto_88145 ) ) ( not ( = ?auto_88143 ?auto_88145 ) ) ( ON ?auto_88141 ?auto_88138 ) ( ON-TABLE ?auto_88145 ) ( ON ?auto_88143 ?auto_88141 ) ( ON ?auto_88139 ?auto_88143 ) ( CLEAR ?auto_88139 ) ( HOLDING ?auto_88144 ) ( CLEAR ?auto_88142 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88140 ?auto_88142 ?auto_88144 )
      ( MAKE-1PILE ?auto_88138 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88146 - BLOCK
    )
    :vars
    (
      ?auto_88147 - BLOCK
      ?auto_88149 - BLOCK
      ?auto_88152 - BLOCK
      ?auto_88148 - BLOCK
      ?auto_88150 - BLOCK
      ?auto_88151 - BLOCK
      ?auto_88153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88146 ?auto_88147 ) ) ( ON-TABLE ?auto_88149 ) ( ON ?auto_88152 ?auto_88149 ) ( not ( = ?auto_88149 ?auto_88152 ) ) ( not ( = ?auto_88149 ?auto_88148 ) ) ( not ( = ?auto_88149 ?auto_88150 ) ) ( not ( = ?auto_88149 ?auto_88151 ) ) ( not ( = ?auto_88149 ?auto_88147 ) ) ( not ( = ?auto_88149 ?auto_88146 ) ) ( not ( = ?auto_88152 ?auto_88148 ) ) ( not ( = ?auto_88152 ?auto_88150 ) ) ( not ( = ?auto_88152 ?auto_88151 ) ) ( not ( = ?auto_88152 ?auto_88147 ) ) ( not ( = ?auto_88152 ?auto_88146 ) ) ( not ( = ?auto_88148 ?auto_88150 ) ) ( not ( = ?auto_88148 ?auto_88151 ) ) ( not ( = ?auto_88148 ?auto_88147 ) ) ( not ( = ?auto_88148 ?auto_88146 ) ) ( not ( = ?auto_88150 ?auto_88151 ) ) ( not ( = ?auto_88150 ?auto_88147 ) ) ( not ( = ?auto_88150 ?auto_88146 ) ) ( not ( = ?auto_88151 ?auto_88147 ) ) ( not ( = ?auto_88151 ?auto_88146 ) ) ( ON ?auto_88146 ?auto_88153 ) ( not ( = ?auto_88146 ?auto_88153 ) ) ( not ( = ?auto_88147 ?auto_88153 ) ) ( not ( = ?auto_88149 ?auto_88153 ) ) ( not ( = ?auto_88152 ?auto_88153 ) ) ( not ( = ?auto_88148 ?auto_88153 ) ) ( not ( = ?auto_88150 ?auto_88153 ) ) ( not ( = ?auto_88151 ?auto_88153 ) ) ( ON ?auto_88147 ?auto_88146 ) ( ON-TABLE ?auto_88153 ) ( ON ?auto_88151 ?auto_88147 ) ( ON ?auto_88150 ?auto_88151 ) ( CLEAR ?auto_88152 ) ( ON ?auto_88148 ?auto_88150 ) ( CLEAR ?auto_88148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88153 ?auto_88146 ?auto_88147 ?auto_88151 ?auto_88150 )
      ( MAKE-1PILE ?auto_88146 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88154 - BLOCK
    )
    :vars
    (
      ?auto_88159 - BLOCK
      ?auto_88158 - BLOCK
      ?auto_88161 - BLOCK
      ?auto_88157 - BLOCK
      ?auto_88155 - BLOCK
      ?auto_88160 - BLOCK
      ?auto_88156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88154 ?auto_88159 ) ) ( ON-TABLE ?auto_88158 ) ( not ( = ?auto_88158 ?auto_88161 ) ) ( not ( = ?auto_88158 ?auto_88157 ) ) ( not ( = ?auto_88158 ?auto_88155 ) ) ( not ( = ?auto_88158 ?auto_88160 ) ) ( not ( = ?auto_88158 ?auto_88159 ) ) ( not ( = ?auto_88158 ?auto_88154 ) ) ( not ( = ?auto_88161 ?auto_88157 ) ) ( not ( = ?auto_88161 ?auto_88155 ) ) ( not ( = ?auto_88161 ?auto_88160 ) ) ( not ( = ?auto_88161 ?auto_88159 ) ) ( not ( = ?auto_88161 ?auto_88154 ) ) ( not ( = ?auto_88157 ?auto_88155 ) ) ( not ( = ?auto_88157 ?auto_88160 ) ) ( not ( = ?auto_88157 ?auto_88159 ) ) ( not ( = ?auto_88157 ?auto_88154 ) ) ( not ( = ?auto_88155 ?auto_88160 ) ) ( not ( = ?auto_88155 ?auto_88159 ) ) ( not ( = ?auto_88155 ?auto_88154 ) ) ( not ( = ?auto_88160 ?auto_88159 ) ) ( not ( = ?auto_88160 ?auto_88154 ) ) ( ON ?auto_88154 ?auto_88156 ) ( not ( = ?auto_88154 ?auto_88156 ) ) ( not ( = ?auto_88159 ?auto_88156 ) ) ( not ( = ?auto_88158 ?auto_88156 ) ) ( not ( = ?auto_88161 ?auto_88156 ) ) ( not ( = ?auto_88157 ?auto_88156 ) ) ( not ( = ?auto_88155 ?auto_88156 ) ) ( not ( = ?auto_88160 ?auto_88156 ) ) ( ON ?auto_88159 ?auto_88154 ) ( ON-TABLE ?auto_88156 ) ( ON ?auto_88160 ?auto_88159 ) ( ON ?auto_88155 ?auto_88160 ) ( ON ?auto_88157 ?auto_88155 ) ( CLEAR ?auto_88157 ) ( HOLDING ?auto_88161 ) ( CLEAR ?auto_88158 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88158 ?auto_88161 )
      ( MAKE-1PILE ?auto_88154 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88162 - BLOCK
    )
    :vars
    (
      ?auto_88163 - BLOCK
      ?auto_88167 - BLOCK
      ?auto_88165 - BLOCK
      ?auto_88164 - BLOCK
      ?auto_88168 - BLOCK
      ?auto_88169 - BLOCK
      ?auto_88166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88162 ?auto_88163 ) ) ( ON-TABLE ?auto_88167 ) ( not ( = ?auto_88167 ?auto_88165 ) ) ( not ( = ?auto_88167 ?auto_88164 ) ) ( not ( = ?auto_88167 ?auto_88168 ) ) ( not ( = ?auto_88167 ?auto_88169 ) ) ( not ( = ?auto_88167 ?auto_88163 ) ) ( not ( = ?auto_88167 ?auto_88162 ) ) ( not ( = ?auto_88165 ?auto_88164 ) ) ( not ( = ?auto_88165 ?auto_88168 ) ) ( not ( = ?auto_88165 ?auto_88169 ) ) ( not ( = ?auto_88165 ?auto_88163 ) ) ( not ( = ?auto_88165 ?auto_88162 ) ) ( not ( = ?auto_88164 ?auto_88168 ) ) ( not ( = ?auto_88164 ?auto_88169 ) ) ( not ( = ?auto_88164 ?auto_88163 ) ) ( not ( = ?auto_88164 ?auto_88162 ) ) ( not ( = ?auto_88168 ?auto_88169 ) ) ( not ( = ?auto_88168 ?auto_88163 ) ) ( not ( = ?auto_88168 ?auto_88162 ) ) ( not ( = ?auto_88169 ?auto_88163 ) ) ( not ( = ?auto_88169 ?auto_88162 ) ) ( ON ?auto_88162 ?auto_88166 ) ( not ( = ?auto_88162 ?auto_88166 ) ) ( not ( = ?auto_88163 ?auto_88166 ) ) ( not ( = ?auto_88167 ?auto_88166 ) ) ( not ( = ?auto_88165 ?auto_88166 ) ) ( not ( = ?auto_88164 ?auto_88166 ) ) ( not ( = ?auto_88168 ?auto_88166 ) ) ( not ( = ?auto_88169 ?auto_88166 ) ) ( ON ?auto_88163 ?auto_88162 ) ( ON-TABLE ?auto_88166 ) ( ON ?auto_88169 ?auto_88163 ) ( ON ?auto_88168 ?auto_88169 ) ( ON ?auto_88164 ?auto_88168 ) ( CLEAR ?auto_88167 ) ( ON ?auto_88165 ?auto_88164 ) ( CLEAR ?auto_88165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88166 ?auto_88162 ?auto_88163 ?auto_88169 ?auto_88168 ?auto_88164 )
      ( MAKE-1PILE ?auto_88162 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88170 - BLOCK
    )
    :vars
    (
      ?auto_88174 - BLOCK
      ?auto_88172 - BLOCK
      ?auto_88175 - BLOCK
      ?auto_88177 - BLOCK
      ?auto_88176 - BLOCK
      ?auto_88171 - BLOCK
      ?auto_88173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88170 ?auto_88174 ) ) ( not ( = ?auto_88172 ?auto_88175 ) ) ( not ( = ?auto_88172 ?auto_88177 ) ) ( not ( = ?auto_88172 ?auto_88176 ) ) ( not ( = ?auto_88172 ?auto_88171 ) ) ( not ( = ?auto_88172 ?auto_88174 ) ) ( not ( = ?auto_88172 ?auto_88170 ) ) ( not ( = ?auto_88175 ?auto_88177 ) ) ( not ( = ?auto_88175 ?auto_88176 ) ) ( not ( = ?auto_88175 ?auto_88171 ) ) ( not ( = ?auto_88175 ?auto_88174 ) ) ( not ( = ?auto_88175 ?auto_88170 ) ) ( not ( = ?auto_88177 ?auto_88176 ) ) ( not ( = ?auto_88177 ?auto_88171 ) ) ( not ( = ?auto_88177 ?auto_88174 ) ) ( not ( = ?auto_88177 ?auto_88170 ) ) ( not ( = ?auto_88176 ?auto_88171 ) ) ( not ( = ?auto_88176 ?auto_88174 ) ) ( not ( = ?auto_88176 ?auto_88170 ) ) ( not ( = ?auto_88171 ?auto_88174 ) ) ( not ( = ?auto_88171 ?auto_88170 ) ) ( ON ?auto_88170 ?auto_88173 ) ( not ( = ?auto_88170 ?auto_88173 ) ) ( not ( = ?auto_88174 ?auto_88173 ) ) ( not ( = ?auto_88172 ?auto_88173 ) ) ( not ( = ?auto_88175 ?auto_88173 ) ) ( not ( = ?auto_88177 ?auto_88173 ) ) ( not ( = ?auto_88176 ?auto_88173 ) ) ( not ( = ?auto_88171 ?auto_88173 ) ) ( ON ?auto_88174 ?auto_88170 ) ( ON-TABLE ?auto_88173 ) ( ON ?auto_88171 ?auto_88174 ) ( ON ?auto_88176 ?auto_88171 ) ( ON ?auto_88177 ?auto_88176 ) ( ON ?auto_88175 ?auto_88177 ) ( CLEAR ?auto_88175 ) ( HOLDING ?auto_88172 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88172 )
      ( MAKE-1PILE ?auto_88170 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88178 - BLOCK
    )
    :vars
    (
      ?auto_88179 - BLOCK
      ?auto_88182 - BLOCK
      ?auto_88184 - BLOCK
      ?auto_88181 - BLOCK
      ?auto_88183 - BLOCK
      ?auto_88185 - BLOCK
      ?auto_88180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88178 ?auto_88179 ) ) ( not ( = ?auto_88182 ?auto_88184 ) ) ( not ( = ?auto_88182 ?auto_88181 ) ) ( not ( = ?auto_88182 ?auto_88183 ) ) ( not ( = ?auto_88182 ?auto_88185 ) ) ( not ( = ?auto_88182 ?auto_88179 ) ) ( not ( = ?auto_88182 ?auto_88178 ) ) ( not ( = ?auto_88184 ?auto_88181 ) ) ( not ( = ?auto_88184 ?auto_88183 ) ) ( not ( = ?auto_88184 ?auto_88185 ) ) ( not ( = ?auto_88184 ?auto_88179 ) ) ( not ( = ?auto_88184 ?auto_88178 ) ) ( not ( = ?auto_88181 ?auto_88183 ) ) ( not ( = ?auto_88181 ?auto_88185 ) ) ( not ( = ?auto_88181 ?auto_88179 ) ) ( not ( = ?auto_88181 ?auto_88178 ) ) ( not ( = ?auto_88183 ?auto_88185 ) ) ( not ( = ?auto_88183 ?auto_88179 ) ) ( not ( = ?auto_88183 ?auto_88178 ) ) ( not ( = ?auto_88185 ?auto_88179 ) ) ( not ( = ?auto_88185 ?auto_88178 ) ) ( ON ?auto_88178 ?auto_88180 ) ( not ( = ?auto_88178 ?auto_88180 ) ) ( not ( = ?auto_88179 ?auto_88180 ) ) ( not ( = ?auto_88182 ?auto_88180 ) ) ( not ( = ?auto_88184 ?auto_88180 ) ) ( not ( = ?auto_88181 ?auto_88180 ) ) ( not ( = ?auto_88183 ?auto_88180 ) ) ( not ( = ?auto_88185 ?auto_88180 ) ) ( ON ?auto_88179 ?auto_88178 ) ( ON-TABLE ?auto_88180 ) ( ON ?auto_88185 ?auto_88179 ) ( ON ?auto_88183 ?auto_88185 ) ( ON ?auto_88181 ?auto_88183 ) ( ON ?auto_88184 ?auto_88181 ) ( ON ?auto_88182 ?auto_88184 ) ( CLEAR ?auto_88182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88180 ?auto_88178 ?auto_88179 ?auto_88185 ?auto_88183 ?auto_88181 ?auto_88184 )
      ( MAKE-1PILE ?auto_88178 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88191 - BLOCK
      ?auto_88192 - BLOCK
      ?auto_88193 - BLOCK
      ?auto_88194 - BLOCK
      ?auto_88195 - BLOCK
    )
    :vars
    (
      ?auto_88196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88196 ?auto_88195 ) ( CLEAR ?auto_88196 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88191 ) ( ON ?auto_88192 ?auto_88191 ) ( ON ?auto_88193 ?auto_88192 ) ( ON ?auto_88194 ?auto_88193 ) ( ON ?auto_88195 ?auto_88194 ) ( not ( = ?auto_88191 ?auto_88192 ) ) ( not ( = ?auto_88191 ?auto_88193 ) ) ( not ( = ?auto_88191 ?auto_88194 ) ) ( not ( = ?auto_88191 ?auto_88195 ) ) ( not ( = ?auto_88191 ?auto_88196 ) ) ( not ( = ?auto_88192 ?auto_88193 ) ) ( not ( = ?auto_88192 ?auto_88194 ) ) ( not ( = ?auto_88192 ?auto_88195 ) ) ( not ( = ?auto_88192 ?auto_88196 ) ) ( not ( = ?auto_88193 ?auto_88194 ) ) ( not ( = ?auto_88193 ?auto_88195 ) ) ( not ( = ?auto_88193 ?auto_88196 ) ) ( not ( = ?auto_88194 ?auto_88195 ) ) ( not ( = ?auto_88194 ?auto_88196 ) ) ( not ( = ?auto_88195 ?auto_88196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88196 ?auto_88195 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88197 - BLOCK
      ?auto_88198 - BLOCK
      ?auto_88199 - BLOCK
      ?auto_88200 - BLOCK
      ?auto_88201 - BLOCK
    )
    :vars
    (
      ?auto_88202 - BLOCK
      ?auto_88203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88202 ?auto_88201 ) ( CLEAR ?auto_88202 ) ( ON-TABLE ?auto_88197 ) ( ON ?auto_88198 ?auto_88197 ) ( ON ?auto_88199 ?auto_88198 ) ( ON ?auto_88200 ?auto_88199 ) ( ON ?auto_88201 ?auto_88200 ) ( not ( = ?auto_88197 ?auto_88198 ) ) ( not ( = ?auto_88197 ?auto_88199 ) ) ( not ( = ?auto_88197 ?auto_88200 ) ) ( not ( = ?auto_88197 ?auto_88201 ) ) ( not ( = ?auto_88197 ?auto_88202 ) ) ( not ( = ?auto_88198 ?auto_88199 ) ) ( not ( = ?auto_88198 ?auto_88200 ) ) ( not ( = ?auto_88198 ?auto_88201 ) ) ( not ( = ?auto_88198 ?auto_88202 ) ) ( not ( = ?auto_88199 ?auto_88200 ) ) ( not ( = ?auto_88199 ?auto_88201 ) ) ( not ( = ?auto_88199 ?auto_88202 ) ) ( not ( = ?auto_88200 ?auto_88201 ) ) ( not ( = ?auto_88200 ?auto_88202 ) ) ( not ( = ?auto_88201 ?auto_88202 ) ) ( HOLDING ?auto_88203 ) ( not ( = ?auto_88197 ?auto_88203 ) ) ( not ( = ?auto_88198 ?auto_88203 ) ) ( not ( = ?auto_88199 ?auto_88203 ) ) ( not ( = ?auto_88200 ?auto_88203 ) ) ( not ( = ?auto_88201 ?auto_88203 ) ) ( not ( = ?auto_88202 ?auto_88203 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_88203 )
      ( MAKE-5PILE ?auto_88197 ?auto_88198 ?auto_88199 ?auto_88200 ?auto_88201 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88204 - BLOCK
      ?auto_88205 - BLOCK
      ?auto_88206 - BLOCK
      ?auto_88207 - BLOCK
      ?auto_88208 - BLOCK
    )
    :vars
    (
      ?auto_88209 - BLOCK
      ?auto_88210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88209 ?auto_88208 ) ( ON-TABLE ?auto_88204 ) ( ON ?auto_88205 ?auto_88204 ) ( ON ?auto_88206 ?auto_88205 ) ( ON ?auto_88207 ?auto_88206 ) ( ON ?auto_88208 ?auto_88207 ) ( not ( = ?auto_88204 ?auto_88205 ) ) ( not ( = ?auto_88204 ?auto_88206 ) ) ( not ( = ?auto_88204 ?auto_88207 ) ) ( not ( = ?auto_88204 ?auto_88208 ) ) ( not ( = ?auto_88204 ?auto_88209 ) ) ( not ( = ?auto_88205 ?auto_88206 ) ) ( not ( = ?auto_88205 ?auto_88207 ) ) ( not ( = ?auto_88205 ?auto_88208 ) ) ( not ( = ?auto_88205 ?auto_88209 ) ) ( not ( = ?auto_88206 ?auto_88207 ) ) ( not ( = ?auto_88206 ?auto_88208 ) ) ( not ( = ?auto_88206 ?auto_88209 ) ) ( not ( = ?auto_88207 ?auto_88208 ) ) ( not ( = ?auto_88207 ?auto_88209 ) ) ( not ( = ?auto_88208 ?auto_88209 ) ) ( not ( = ?auto_88204 ?auto_88210 ) ) ( not ( = ?auto_88205 ?auto_88210 ) ) ( not ( = ?auto_88206 ?auto_88210 ) ) ( not ( = ?auto_88207 ?auto_88210 ) ) ( not ( = ?auto_88208 ?auto_88210 ) ) ( not ( = ?auto_88209 ?auto_88210 ) ) ( ON ?auto_88210 ?auto_88209 ) ( CLEAR ?auto_88210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88204 ?auto_88205 ?auto_88206 ?auto_88207 ?auto_88208 ?auto_88209 )
      ( MAKE-5PILE ?auto_88204 ?auto_88205 ?auto_88206 ?auto_88207 ?auto_88208 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88211 - BLOCK
      ?auto_88212 - BLOCK
      ?auto_88213 - BLOCK
      ?auto_88214 - BLOCK
      ?auto_88215 - BLOCK
    )
    :vars
    (
      ?auto_88217 - BLOCK
      ?auto_88216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88217 ?auto_88215 ) ( ON-TABLE ?auto_88211 ) ( ON ?auto_88212 ?auto_88211 ) ( ON ?auto_88213 ?auto_88212 ) ( ON ?auto_88214 ?auto_88213 ) ( ON ?auto_88215 ?auto_88214 ) ( not ( = ?auto_88211 ?auto_88212 ) ) ( not ( = ?auto_88211 ?auto_88213 ) ) ( not ( = ?auto_88211 ?auto_88214 ) ) ( not ( = ?auto_88211 ?auto_88215 ) ) ( not ( = ?auto_88211 ?auto_88217 ) ) ( not ( = ?auto_88212 ?auto_88213 ) ) ( not ( = ?auto_88212 ?auto_88214 ) ) ( not ( = ?auto_88212 ?auto_88215 ) ) ( not ( = ?auto_88212 ?auto_88217 ) ) ( not ( = ?auto_88213 ?auto_88214 ) ) ( not ( = ?auto_88213 ?auto_88215 ) ) ( not ( = ?auto_88213 ?auto_88217 ) ) ( not ( = ?auto_88214 ?auto_88215 ) ) ( not ( = ?auto_88214 ?auto_88217 ) ) ( not ( = ?auto_88215 ?auto_88217 ) ) ( not ( = ?auto_88211 ?auto_88216 ) ) ( not ( = ?auto_88212 ?auto_88216 ) ) ( not ( = ?auto_88213 ?auto_88216 ) ) ( not ( = ?auto_88214 ?auto_88216 ) ) ( not ( = ?auto_88215 ?auto_88216 ) ) ( not ( = ?auto_88217 ?auto_88216 ) ) ( HOLDING ?auto_88216 ) ( CLEAR ?auto_88217 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88211 ?auto_88212 ?auto_88213 ?auto_88214 ?auto_88215 ?auto_88217 ?auto_88216 )
      ( MAKE-5PILE ?auto_88211 ?auto_88212 ?auto_88213 ?auto_88214 ?auto_88215 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88218 - BLOCK
      ?auto_88219 - BLOCK
      ?auto_88220 - BLOCK
      ?auto_88221 - BLOCK
      ?auto_88222 - BLOCK
    )
    :vars
    (
      ?auto_88223 - BLOCK
      ?auto_88224 - BLOCK
      ?auto_88225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88223 ?auto_88222 ) ( ON-TABLE ?auto_88218 ) ( ON ?auto_88219 ?auto_88218 ) ( ON ?auto_88220 ?auto_88219 ) ( ON ?auto_88221 ?auto_88220 ) ( ON ?auto_88222 ?auto_88221 ) ( not ( = ?auto_88218 ?auto_88219 ) ) ( not ( = ?auto_88218 ?auto_88220 ) ) ( not ( = ?auto_88218 ?auto_88221 ) ) ( not ( = ?auto_88218 ?auto_88222 ) ) ( not ( = ?auto_88218 ?auto_88223 ) ) ( not ( = ?auto_88219 ?auto_88220 ) ) ( not ( = ?auto_88219 ?auto_88221 ) ) ( not ( = ?auto_88219 ?auto_88222 ) ) ( not ( = ?auto_88219 ?auto_88223 ) ) ( not ( = ?auto_88220 ?auto_88221 ) ) ( not ( = ?auto_88220 ?auto_88222 ) ) ( not ( = ?auto_88220 ?auto_88223 ) ) ( not ( = ?auto_88221 ?auto_88222 ) ) ( not ( = ?auto_88221 ?auto_88223 ) ) ( not ( = ?auto_88222 ?auto_88223 ) ) ( not ( = ?auto_88218 ?auto_88224 ) ) ( not ( = ?auto_88219 ?auto_88224 ) ) ( not ( = ?auto_88220 ?auto_88224 ) ) ( not ( = ?auto_88221 ?auto_88224 ) ) ( not ( = ?auto_88222 ?auto_88224 ) ) ( not ( = ?auto_88223 ?auto_88224 ) ) ( CLEAR ?auto_88223 ) ( ON ?auto_88224 ?auto_88225 ) ( CLEAR ?auto_88224 ) ( HAND-EMPTY ) ( not ( = ?auto_88218 ?auto_88225 ) ) ( not ( = ?auto_88219 ?auto_88225 ) ) ( not ( = ?auto_88220 ?auto_88225 ) ) ( not ( = ?auto_88221 ?auto_88225 ) ) ( not ( = ?auto_88222 ?auto_88225 ) ) ( not ( = ?auto_88223 ?auto_88225 ) ) ( not ( = ?auto_88224 ?auto_88225 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88224 ?auto_88225 )
      ( MAKE-5PILE ?auto_88218 ?auto_88219 ?auto_88220 ?auto_88221 ?auto_88222 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88242 - BLOCK
      ?auto_88243 - BLOCK
      ?auto_88244 - BLOCK
      ?auto_88245 - BLOCK
      ?auto_88246 - BLOCK
    )
    :vars
    (
      ?auto_88249 - BLOCK
      ?auto_88248 - BLOCK
      ?auto_88247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88242 ) ( ON ?auto_88243 ?auto_88242 ) ( ON ?auto_88244 ?auto_88243 ) ( ON ?auto_88245 ?auto_88244 ) ( not ( = ?auto_88242 ?auto_88243 ) ) ( not ( = ?auto_88242 ?auto_88244 ) ) ( not ( = ?auto_88242 ?auto_88245 ) ) ( not ( = ?auto_88242 ?auto_88246 ) ) ( not ( = ?auto_88242 ?auto_88249 ) ) ( not ( = ?auto_88243 ?auto_88244 ) ) ( not ( = ?auto_88243 ?auto_88245 ) ) ( not ( = ?auto_88243 ?auto_88246 ) ) ( not ( = ?auto_88243 ?auto_88249 ) ) ( not ( = ?auto_88244 ?auto_88245 ) ) ( not ( = ?auto_88244 ?auto_88246 ) ) ( not ( = ?auto_88244 ?auto_88249 ) ) ( not ( = ?auto_88245 ?auto_88246 ) ) ( not ( = ?auto_88245 ?auto_88249 ) ) ( not ( = ?auto_88246 ?auto_88249 ) ) ( not ( = ?auto_88242 ?auto_88248 ) ) ( not ( = ?auto_88243 ?auto_88248 ) ) ( not ( = ?auto_88244 ?auto_88248 ) ) ( not ( = ?auto_88245 ?auto_88248 ) ) ( not ( = ?auto_88246 ?auto_88248 ) ) ( not ( = ?auto_88249 ?auto_88248 ) ) ( ON ?auto_88248 ?auto_88247 ) ( not ( = ?auto_88242 ?auto_88247 ) ) ( not ( = ?auto_88243 ?auto_88247 ) ) ( not ( = ?auto_88244 ?auto_88247 ) ) ( not ( = ?auto_88245 ?auto_88247 ) ) ( not ( = ?auto_88246 ?auto_88247 ) ) ( not ( = ?auto_88249 ?auto_88247 ) ) ( not ( = ?auto_88248 ?auto_88247 ) ) ( ON ?auto_88249 ?auto_88248 ) ( CLEAR ?auto_88249 ) ( HOLDING ?auto_88246 ) ( CLEAR ?auto_88245 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88242 ?auto_88243 ?auto_88244 ?auto_88245 ?auto_88246 ?auto_88249 )
      ( MAKE-5PILE ?auto_88242 ?auto_88243 ?auto_88244 ?auto_88245 ?auto_88246 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88250 - BLOCK
      ?auto_88251 - BLOCK
      ?auto_88252 - BLOCK
      ?auto_88253 - BLOCK
      ?auto_88254 - BLOCK
    )
    :vars
    (
      ?auto_88256 - BLOCK
      ?auto_88255 - BLOCK
      ?auto_88257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88250 ) ( ON ?auto_88251 ?auto_88250 ) ( ON ?auto_88252 ?auto_88251 ) ( ON ?auto_88253 ?auto_88252 ) ( not ( = ?auto_88250 ?auto_88251 ) ) ( not ( = ?auto_88250 ?auto_88252 ) ) ( not ( = ?auto_88250 ?auto_88253 ) ) ( not ( = ?auto_88250 ?auto_88254 ) ) ( not ( = ?auto_88250 ?auto_88256 ) ) ( not ( = ?auto_88251 ?auto_88252 ) ) ( not ( = ?auto_88251 ?auto_88253 ) ) ( not ( = ?auto_88251 ?auto_88254 ) ) ( not ( = ?auto_88251 ?auto_88256 ) ) ( not ( = ?auto_88252 ?auto_88253 ) ) ( not ( = ?auto_88252 ?auto_88254 ) ) ( not ( = ?auto_88252 ?auto_88256 ) ) ( not ( = ?auto_88253 ?auto_88254 ) ) ( not ( = ?auto_88253 ?auto_88256 ) ) ( not ( = ?auto_88254 ?auto_88256 ) ) ( not ( = ?auto_88250 ?auto_88255 ) ) ( not ( = ?auto_88251 ?auto_88255 ) ) ( not ( = ?auto_88252 ?auto_88255 ) ) ( not ( = ?auto_88253 ?auto_88255 ) ) ( not ( = ?auto_88254 ?auto_88255 ) ) ( not ( = ?auto_88256 ?auto_88255 ) ) ( ON ?auto_88255 ?auto_88257 ) ( not ( = ?auto_88250 ?auto_88257 ) ) ( not ( = ?auto_88251 ?auto_88257 ) ) ( not ( = ?auto_88252 ?auto_88257 ) ) ( not ( = ?auto_88253 ?auto_88257 ) ) ( not ( = ?auto_88254 ?auto_88257 ) ) ( not ( = ?auto_88256 ?auto_88257 ) ) ( not ( = ?auto_88255 ?auto_88257 ) ) ( ON ?auto_88256 ?auto_88255 ) ( CLEAR ?auto_88253 ) ( ON ?auto_88254 ?auto_88256 ) ( CLEAR ?auto_88254 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88257 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88257 ?auto_88255 ?auto_88256 )
      ( MAKE-5PILE ?auto_88250 ?auto_88251 ?auto_88252 ?auto_88253 ?auto_88254 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88258 - BLOCK
      ?auto_88259 - BLOCK
      ?auto_88260 - BLOCK
      ?auto_88261 - BLOCK
      ?auto_88262 - BLOCK
    )
    :vars
    (
      ?auto_88265 - BLOCK
      ?auto_88264 - BLOCK
      ?auto_88263 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88258 ) ( ON ?auto_88259 ?auto_88258 ) ( ON ?auto_88260 ?auto_88259 ) ( not ( = ?auto_88258 ?auto_88259 ) ) ( not ( = ?auto_88258 ?auto_88260 ) ) ( not ( = ?auto_88258 ?auto_88261 ) ) ( not ( = ?auto_88258 ?auto_88262 ) ) ( not ( = ?auto_88258 ?auto_88265 ) ) ( not ( = ?auto_88259 ?auto_88260 ) ) ( not ( = ?auto_88259 ?auto_88261 ) ) ( not ( = ?auto_88259 ?auto_88262 ) ) ( not ( = ?auto_88259 ?auto_88265 ) ) ( not ( = ?auto_88260 ?auto_88261 ) ) ( not ( = ?auto_88260 ?auto_88262 ) ) ( not ( = ?auto_88260 ?auto_88265 ) ) ( not ( = ?auto_88261 ?auto_88262 ) ) ( not ( = ?auto_88261 ?auto_88265 ) ) ( not ( = ?auto_88262 ?auto_88265 ) ) ( not ( = ?auto_88258 ?auto_88264 ) ) ( not ( = ?auto_88259 ?auto_88264 ) ) ( not ( = ?auto_88260 ?auto_88264 ) ) ( not ( = ?auto_88261 ?auto_88264 ) ) ( not ( = ?auto_88262 ?auto_88264 ) ) ( not ( = ?auto_88265 ?auto_88264 ) ) ( ON ?auto_88264 ?auto_88263 ) ( not ( = ?auto_88258 ?auto_88263 ) ) ( not ( = ?auto_88259 ?auto_88263 ) ) ( not ( = ?auto_88260 ?auto_88263 ) ) ( not ( = ?auto_88261 ?auto_88263 ) ) ( not ( = ?auto_88262 ?auto_88263 ) ) ( not ( = ?auto_88265 ?auto_88263 ) ) ( not ( = ?auto_88264 ?auto_88263 ) ) ( ON ?auto_88265 ?auto_88264 ) ( ON ?auto_88262 ?auto_88265 ) ( CLEAR ?auto_88262 ) ( ON-TABLE ?auto_88263 ) ( HOLDING ?auto_88261 ) ( CLEAR ?auto_88260 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88258 ?auto_88259 ?auto_88260 ?auto_88261 )
      ( MAKE-5PILE ?auto_88258 ?auto_88259 ?auto_88260 ?auto_88261 ?auto_88262 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88266 - BLOCK
      ?auto_88267 - BLOCK
      ?auto_88268 - BLOCK
      ?auto_88269 - BLOCK
      ?auto_88270 - BLOCK
    )
    :vars
    (
      ?auto_88271 - BLOCK
      ?auto_88272 - BLOCK
      ?auto_88273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88266 ) ( ON ?auto_88267 ?auto_88266 ) ( ON ?auto_88268 ?auto_88267 ) ( not ( = ?auto_88266 ?auto_88267 ) ) ( not ( = ?auto_88266 ?auto_88268 ) ) ( not ( = ?auto_88266 ?auto_88269 ) ) ( not ( = ?auto_88266 ?auto_88270 ) ) ( not ( = ?auto_88266 ?auto_88271 ) ) ( not ( = ?auto_88267 ?auto_88268 ) ) ( not ( = ?auto_88267 ?auto_88269 ) ) ( not ( = ?auto_88267 ?auto_88270 ) ) ( not ( = ?auto_88267 ?auto_88271 ) ) ( not ( = ?auto_88268 ?auto_88269 ) ) ( not ( = ?auto_88268 ?auto_88270 ) ) ( not ( = ?auto_88268 ?auto_88271 ) ) ( not ( = ?auto_88269 ?auto_88270 ) ) ( not ( = ?auto_88269 ?auto_88271 ) ) ( not ( = ?auto_88270 ?auto_88271 ) ) ( not ( = ?auto_88266 ?auto_88272 ) ) ( not ( = ?auto_88267 ?auto_88272 ) ) ( not ( = ?auto_88268 ?auto_88272 ) ) ( not ( = ?auto_88269 ?auto_88272 ) ) ( not ( = ?auto_88270 ?auto_88272 ) ) ( not ( = ?auto_88271 ?auto_88272 ) ) ( ON ?auto_88272 ?auto_88273 ) ( not ( = ?auto_88266 ?auto_88273 ) ) ( not ( = ?auto_88267 ?auto_88273 ) ) ( not ( = ?auto_88268 ?auto_88273 ) ) ( not ( = ?auto_88269 ?auto_88273 ) ) ( not ( = ?auto_88270 ?auto_88273 ) ) ( not ( = ?auto_88271 ?auto_88273 ) ) ( not ( = ?auto_88272 ?auto_88273 ) ) ( ON ?auto_88271 ?auto_88272 ) ( ON ?auto_88270 ?auto_88271 ) ( ON-TABLE ?auto_88273 ) ( CLEAR ?auto_88268 ) ( ON ?auto_88269 ?auto_88270 ) ( CLEAR ?auto_88269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88273 ?auto_88272 ?auto_88271 ?auto_88270 )
      ( MAKE-5PILE ?auto_88266 ?auto_88267 ?auto_88268 ?auto_88269 ?auto_88270 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88274 - BLOCK
      ?auto_88275 - BLOCK
      ?auto_88276 - BLOCK
      ?auto_88277 - BLOCK
      ?auto_88278 - BLOCK
    )
    :vars
    (
      ?auto_88279 - BLOCK
      ?auto_88281 - BLOCK
      ?auto_88280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88274 ) ( ON ?auto_88275 ?auto_88274 ) ( not ( = ?auto_88274 ?auto_88275 ) ) ( not ( = ?auto_88274 ?auto_88276 ) ) ( not ( = ?auto_88274 ?auto_88277 ) ) ( not ( = ?auto_88274 ?auto_88278 ) ) ( not ( = ?auto_88274 ?auto_88279 ) ) ( not ( = ?auto_88275 ?auto_88276 ) ) ( not ( = ?auto_88275 ?auto_88277 ) ) ( not ( = ?auto_88275 ?auto_88278 ) ) ( not ( = ?auto_88275 ?auto_88279 ) ) ( not ( = ?auto_88276 ?auto_88277 ) ) ( not ( = ?auto_88276 ?auto_88278 ) ) ( not ( = ?auto_88276 ?auto_88279 ) ) ( not ( = ?auto_88277 ?auto_88278 ) ) ( not ( = ?auto_88277 ?auto_88279 ) ) ( not ( = ?auto_88278 ?auto_88279 ) ) ( not ( = ?auto_88274 ?auto_88281 ) ) ( not ( = ?auto_88275 ?auto_88281 ) ) ( not ( = ?auto_88276 ?auto_88281 ) ) ( not ( = ?auto_88277 ?auto_88281 ) ) ( not ( = ?auto_88278 ?auto_88281 ) ) ( not ( = ?auto_88279 ?auto_88281 ) ) ( ON ?auto_88281 ?auto_88280 ) ( not ( = ?auto_88274 ?auto_88280 ) ) ( not ( = ?auto_88275 ?auto_88280 ) ) ( not ( = ?auto_88276 ?auto_88280 ) ) ( not ( = ?auto_88277 ?auto_88280 ) ) ( not ( = ?auto_88278 ?auto_88280 ) ) ( not ( = ?auto_88279 ?auto_88280 ) ) ( not ( = ?auto_88281 ?auto_88280 ) ) ( ON ?auto_88279 ?auto_88281 ) ( ON ?auto_88278 ?auto_88279 ) ( ON-TABLE ?auto_88280 ) ( ON ?auto_88277 ?auto_88278 ) ( CLEAR ?auto_88277 ) ( HOLDING ?auto_88276 ) ( CLEAR ?auto_88275 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88274 ?auto_88275 ?auto_88276 )
      ( MAKE-5PILE ?auto_88274 ?auto_88275 ?auto_88276 ?auto_88277 ?auto_88278 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88282 - BLOCK
      ?auto_88283 - BLOCK
      ?auto_88284 - BLOCK
      ?auto_88285 - BLOCK
      ?auto_88286 - BLOCK
    )
    :vars
    (
      ?auto_88287 - BLOCK
      ?auto_88289 - BLOCK
      ?auto_88288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88282 ) ( ON ?auto_88283 ?auto_88282 ) ( not ( = ?auto_88282 ?auto_88283 ) ) ( not ( = ?auto_88282 ?auto_88284 ) ) ( not ( = ?auto_88282 ?auto_88285 ) ) ( not ( = ?auto_88282 ?auto_88286 ) ) ( not ( = ?auto_88282 ?auto_88287 ) ) ( not ( = ?auto_88283 ?auto_88284 ) ) ( not ( = ?auto_88283 ?auto_88285 ) ) ( not ( = ?auto_88283 ?auto_88286 ) ) ( not ( = ?auto_88283 ?auto_88287 ) ) ( not ( = ?auto_88284 ?auto_88285 ) ) ( not ( = ?auto_88284 ?auto_88286 ) ) ( not ( = ?auto_88284 ?auto_88287 ) ) ( not ( = ?auto_88285 ?auto_88286 ) ) ( not ( = ?auto_88285 ?auto_88287 ) ) ( not ( = ?auto_88286 ?auto_88287 ) ) ( not ( = ?auto_88282 ?auto_88289 ) ) ( not ( = ?auto_88283 ?auto_88289 ) ) ( not ( = ?auto_88284 ?auto_88289 ) ) ( not ( = ?auto_88285 ?auto_88289 ) ) ( not ( = ?auto_88286 ?auto_88289 ) ) ( not ( = ?auto_88287 ?auto_88289 ) ) ( ON ?auto_88289 ?auto_88288 ) ( not ( = ?auto_88282 ?auto_88288 ) ) ( not ( = ?auto_88283 ?auto_88288 ) ) ( not ( = ?auto_88284 ?auto_88288 ) ) ( not ( = ?auto_88285 ?auto_88288 ) ) ( not ( = ?auto_88286 ?auto_88288 ) ) ( not ( = ?auto_88287 ?auto_88288 ) ) ( not ( = ?auto_88289 ?auto_88288 ) ) ( ON ?auto_88287 ?auto_88289 ) ( ON ?auto_88286 ?auto_88287 ) ( ON-TABLE ?auto_88288 ) ( ON ?auto_88285 ?auto_88286 ) ( CLEAR ?auto_88283 ) ( ON ?auto_88284 ?auto_88285 ) ( CLEAR ?auto_88284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88288 ?auto_88289 ?auto_88287 ?auto_88286 ?auto_88285 )
      ( MAKE-5PILE ?auto_88282 ?auto_88283 ?auto_88284 ?auto_88285 ?auto_88286 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88290 - BLOCK
      ?auto_88291 - BLOCK
      ?auto_88292 - BLOCK
      ?auto_88293 - BLOCK
      ?auto_88294 - BLOCK
    )
    :vars
    (
      ?auto_88296 - BLOCK
      ?auto_88297 - BLOCK
      ?auto_88295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88290 ) ( not ( = ?auto_88290 ?auto_88291 ) ) ( not ( = ?auto_88290 ?auto_88292 ) ) ( not ( = ?auto_88290 ?auto_88293 ) ) ( not ( = ?auto_88290 ?auto_88294 ) ) ( not ( = ?auto_88290 ?auto_88296 ) ) ( not ( = ?auto_88291 ?auto_88292 ) ) ( not ( = ?auto_88291 ?auto_88293 ) ) ( not ( = ?auto_88291 ?auto_88294 ) ) ( not ( = ?auto_88291 ?auto_88296 ) ) ( not ( = ?auto_88292 ?auto_88293 ) ) ( not ( = ?auto_88292 ?auto_88294 ) ) ( not ( = ?auto_88292 ?auto_88296 ) ) ( not ( = ?auto_88293 ?auto_88294 ) ) ( not ( = ?auto_88293 ?auto_88296 ) ) ( not ( = ?auto_88294 ?auto_88296 ) ) ( not ( = ?auto_88290 ?auto_88297 ) ) ( not ( = ?auto_88291 ?auto_88297 ) ) ( not ( = ?auto_88292 ?auto_88297 ) ) ( not ( = ?auto_88293 ?auto_88297 ) ) ( not ( = ?auto_88294 ?auto_88297 ) ) ( not ( = ?auto_88296 ?auto_88297 ) ) ( ON ?auto_88297 ?auto_88295 ) ( not ( = ?auto_88290 ?auto_88295 ) ) ( not ( = ?auto_88291 ?auto_88295 ) ) ( not ( = ?auto_88292 ?auto_88295 ) ) ( not ( = ?auto_88293 ?auto_88295 ) ) ( not ( = ?auto_88294 ?auto_88295 ) ) ( not ( = ?auto_88296 ?auto_88295 ) ) ( not ( = ?auto_88297 ?auto_88295 ) ) ( ON ?auto_88296 ?auto_88297 ) ( ON ?auto_88294 ?auto_88296 ) ( ON-TABLE ?auto_88295 ) ( ON ?auto_88293 ?auto_88294 ) ( ON ?auto_88292 ?auto_88293 ) ( CLEAR ?auto_88292 ) ( HOLDING ?auto_88291 ) ( CLEAR ?auto_88290 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88290 ?auto_88291 )
      ( MAKE-5PILE ?auto_88290 ?auto_88291 ?auto_88292 ?auto_88293 ?auto_88294 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88298 - BLOCK
      ?auto_88299 - BLOCK
      ?auto_88300 - BLOCK
      ?auto_88301 - BLOCK
      ?auto_88302 - BLOCK
    )
    :vars
    (
      ?auto_88304 - BLOCK
      ?auto_88305 - BLOCK
      ?auto_88303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88298 ) ( not ( = ?auto_88298 ?auto_88299 ) ) ( not ( = ?auto_88298 ?auto_88300 ) ) ( not ( = ?auto_88298 ?auto_88301 ) ) ( not ( = ?auto_88298 ?auto_88302 ) ) ( not ( = ?auto_88298 ?auto_88304 ) ) ( not ( = ?auto_88299 ?auto_88300 ) ) ( not ( = ?auto_88299 ?auto_88301 ) ) ( not ( = ?auto_88299 ?auto_88302 ) ) ( not ( = ?auto_88299 ?auto_88304 ) ) ( not ( = ?auto_88300 ?auto_88301 ) ) ( not ( = ?auto_88300 ?auto_88302 ) ) ( not ( = ?auto_88300 ?auto_88304 ) ) ( not ( = ?auto_88301 ?auto_88302 ) ) ( not ( = ?auto_88301 ?auto_88304 ) ) ( not ( = ?auto_88302 ?auto_88304 ) ) ( not ( = ?auto_88298 ?auto_88305 ) ) ( not ( = ?auto_88299 ?auto_88305 ) ) ( not ( = ?auto_88300 ?auto_88305 ) ) ( not ( = ?auto_88301 ?auto_88305 ) ) ( not ( = ?auto_88302 ?auto_88305 ) ) ( not ( = ?auto_88304 ?auto_88305 ) ) ( ON ?auto_88305 ?auto_88303 ) ( not ( = ?auto_88298 ?auto_88303 ) ) ( not ( = ?auto_88299 ?auto_88303 ) ) ( not ( = ?auto_88300 ?auto_88303 ) ) ( not ( = ?auto_88301 ?auto_88303 ) ) ( not ( = ?auto_88302 ?auto_88303 ) ) ( not ( = ?auto_88304 ?auto_88303 ) ) ( not ( = ?auto_88305 ?auto_88303 ) ) ( ON ?auto_88304 ?auto_88305 ) ( ON ?auto_88302 ?auto_88304 ) ( ON-TABLE ?auto_88303 ) ( ON ?auto_88301 ?auto_88302 ) ( ON ?auto_88300 ?auto_88301 ) ( CLEAR ?auto_88298 ) ( ON ?auto_88299 ?auto_88300 ) ( CLEAR ?auto_88299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88303 ?auto_88305 ?auto_88304 ?auto_88302 ?auto_88301 ?auto_88300 )
      ( MAKE-5PILE ?auto_88298 ?auto_88299 ?auto_88300 ?auto_88301 ?auto_88302 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88306 - BLOCK
      ?auto_88307 - BLOCK
      ?auto_88308 - BLOCK
      ?auto_88309 - BLOCK
      ?auto_88310 - BLOCK
    )
    :vars
    (
      ?auto_88313 - BLOCK
      ?auto_88311 - BLOCK
      ?auto_88312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88306 ?auto_88307 ) ) ( not ( = ?auto_88306 ?auto_88308 ) ) ( not ( = ?auto_88306 ?auto_88309 ) ) ( not ( = ?auto_88306 ?auto_88310 ) ) ( not ( = ?auto_88306 ?auto_88313 ) ) ( not ( = ?auto_88307 ?auto_88308 ) ) ( not ( = ?auto_88307 ?auto_88309 ) ) ( not ( = ?auto_88307 ?auto_88310 ) ) ( not ( = ?auto_88307 ?auto_88313 ) ) ( not ( = ?auto_88308 ?auto_88309 ) ) ( not ( = ?auto_88308 ?auto_88310 ) ) ( not ( = ?auto_88308 ?auto_88313 ) ) ( not ( = ?auto_88309 ?auto_88310 ) ) ( not ( = ?auto_88309 ?auto_88313 ) ) ( not ( = ?auto_88310 ?auto_88313 ) ) ( not ( = ?auto_88306 ?auto_88311 ) ) ( not ( = ?auto_88307 ?auto_88311 ) ) ( not ( = ?auto_88308 ?auto_88311 ) ) ( not ( = ?auto_88309 ?auto_88311 ) ) ( not ( = ?auto_88310 ?auto_88311 ) ) ( not ( = ?auto_88313 ?auto_88311 ) ) ( ON ?auto_88311 ?auto_88312 ) ( not ( = ?auto_88306 ?auto_88312 ) ) ( not ( = ?auto_88307 ?auto_88312 ) ) ( not ( = ?auto_88308 ?auto_88312 ) ) ( not ( = ?auto_88309 ?auto_88312 ) ) ( not ( = ?auto_88310 ?auto_88312 ) ) ( not ( = ?auto_88313 ?auto_88312 ) ) ( not ( = ?auto_88311 ?auto_88312 ) ) ( ON ?auto_88313 ?auto_88311 ) ( ON ?auto_88310 ?auto_88313 ) ( ON-TABLE ?auto_88312 ) ( ON ?auto_88309 ?auto_88310 ) ( ON ?auto_88308 ?auto_88309 ) ( ON ?auto_88307 ?auto_88308 ) ( CLEAR ?auto_88307 ) ( HOLDING ?auto_88306 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88306 )
      ( MAKE-5PILE ?auto_88306 ?auto_88307 ?auto_88308 ?auto_88309 ?auto_88310 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88314 - BLOCK
      ?auto_88315 - BLOCK
      ?auto_88316 - BLOCK
      ?auto_88317 - BLOCK
      ?auto_88318 - BLOCK
    )
    :vars
    (
      ?auto_88321 - BLOCK
      ?auto_88319 - BLOCK
      ?auto_88320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88314 ?auto_88315 ) ) ( not ( = ?auto_88314 ?auto_88316 ) ) ( not ( = ?auto_88314 ?auto_88317 ) ) ( not ( = ?auto_88314 ?auto_88318 ) ) ( not ( = ?auto_88314 ?auto_88321 ) ) ( not ( = ?auto_88315 ?auto_88316 ) ) ( not ( = ?auto_88315 ?auto_88317 ) ) ( not ( = ?auto_88315 ?auto_88318 ) ) ( not ( = ?auto_88315 ?auto_88321 ) ) ( not ( = ?auto_88316 ?auto_88317 ) ) ( not ( = ?auto_88316 ?auto_88318 ) ) ( not ( = ?auto_88316 ?auto_88321 ) ) ( not ( = ?auto_88317 ?auto_88318 ) ) ( not ( = ?auto_88317 ?auto_88321 ) ) ( not ( = ?auto_88318 ?auto_88321 ) ) ( not ( = ?auto_88314 ?auto_88319 ) ) ( not ( = ?auto_88315 ?auto_88319 ) ) ( not ( = ?auto_88316 ?auto_88319 ) ) ( not ( = ?auto_88317 ?auto_88319 ) ) ( not ( = ?auto_88318 ?auto_88319 ) ) ( not ( = ?auto_88321 ?auto_88319 ) ) ( ON ?auto_88319 ?auto_88320 ) ( not ( = ?auto_88314 ?auto_88320 ) ) ( not ( = ?auto_88315 ?auto_88320 ) ) ( not ( = ?auto_88316 ?auto_88320 ) ) ( not ( = ?auto_88317 ?auto_88320 ) ) ( not ( = ?auto_88318 ?auto_88320 ) ) ( not ( = ?auto_88321 ?auto_88320 ) ) ( not ( = ?auto_88319 ?auto_88320 ) ) ( ON ?auto_88321 ?auto_88319 ) ( ON ?auto_88318 ?auto_88321 ) ( ON-TABLE ?auto_88320 ) ( ON ?auto_88317 ?auto_88318 ) ( ON ?auto_88316 ?auto_88317 ) ( ON ?auto_88315 ?auto_88316 ) ( ON ?auto_88314 ?auto_88315 ) ( CLEAR ?auto_88314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88320 ?auto_88319 ?auto_88321 ?auto_88318 ?auto_88317 ?auto_88316 ?auto_88315 )
      ( MAKE-5PILE ?auto_88314 ?auto_88315 ?auto_88316 ?auto_88317 ?auto_88318 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88324 - BLOCK
      ?auto_88325 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_88325 ) ( CLEAR ?auto_88324 ) ( ON-TABLE ?auto_88324 ) ( not ( = ?auto_88324 ?auto_88325 ) ) )
    :subtasks
    ( ( !STACK ?auto_88325 ?auto_88324 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88326 - BLOCK
      ?auto_88327 - BLOCK
    )
    :vars
    (
      ?auto_88328 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_88326 ) ( ON-TABLE ?auto_88326 ) ( not ( = ?auto_88326 ?auto_88327 ) ) ( ON ?auto_88327 ?auto_88328 ) ( CLEAR ?auto_88327 ) ( HAND-EMPTY ) ( not ( = ?auto_88326 ?auto_88328 ) ) ( not ( = ?auto_88327 ?auto_88328 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88327 ?auto_88328 )
      ( MAKE-2PILE ?auto_88326 ?auto_88327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88329 - BLOCK
      ?auto_88330 - BLOCK
    )
    :vars
    (
      ?auto_88331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88329 ?auto_88330 ) ) ( ON ?auto_88330 ?auto_88331 ) ( CLEAR ?auto_88330 ) ( not ( = ?auto_88329 ?auto_88331 ) ) ( not ( = ?auto_88330 ?auto_88331 ) ) ( HOLDING ?auto_88329 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88329 )
      ( MAKE-2PILE ?auto_88329 ?auto_88330 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88332 - BLOCK
      ?auto_88333 - BLOCK
    )
    :vars
    (
      ?auto_88334 - BLOCK
      ?auto_88338 - BLOCK
      ?auto_88335 - BLOCK
      ?auto_88336 - BLOCK
      ?auto_88337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88332 ?auto_88333 ) ) ( ON ?auto_88333 ?auto_88334 ) ( not ( = ?auto_88332 ?auto_88334 ) ) ( not ( = ?auto_88333 ?auto_88334 ) ) ( ON ?auto_88332 ?auto_88333 ) ( CLEAR ?auto_88332 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88338 ) ( ON ?auto_88335 ?auto_88338 ) ( ON ?auto_88336 ?auto_88335 ) ( ON ?auto_88337 ?auto_88336 ) ( ON ?auto_88334 ?auto_88337 ) ( not ( = ?auto_88338 ?auto_88335 ) ) ( not ( = ?auto_88338 ?auto_88336 ) ) ( not ( = ?auto_88338 ?auto_88337 ) ) ( not ( = ?auto_88338 ?auto_88334 ) ) ( not ( = ?auto_88338 ?auto_88333 ) ) ( not ( = ?auto_88338 ?auto_88332 ) ) ( not ( = ?auto_88335 ?auto_88336 ) ) ( not ( = ?auto_88335 ?auto_88337 ) ) ( not ( = ?auto_88335 ?auto_88334 ) ) ( not ( = ?auto_88335 ?auto_88333 ) ) ( not ( = ?auto_88335 ?auto_88332 ) ) ( not ( = ?auto_88336 ?auto_88337 ) ) ( not ( = ?auto_88336 ?auto_88334 ) ) ( not ( = ?auto_88336 ?auto_88333 ) ) ( not ( = ?auto_88336 ?auto_88332 ) ) ( not ( = ?auto_88337 ?auto_88334 ) ) ( not ( = ?auto_88337 ?auto_88333 ) ) ( not ( = ?auto_88337 ?auto_88332 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88338 ?auto_88335 ?auto_88336 ?auto_88337 ?auto_88334 ?auto_88333 )
      ( MAKE-2PILE ?auto_88332 ?auto_88333 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88339 - BLOCK
      ?auto_88340 - BLOCK
    )
    :vars
    (
      ?auto_88345 - BLOCK
      ?auto_88343 - BLOCK
      ?auto_88342 - BLOCK
      ?auto_88341 - BLOCK
      ?auto_88344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88339 ?auto_88340 ) ) ( ON ?auto_88340 ?auto_88345 ) ( not ( = ?auto_88339 ?auto_88345 ) ) ( not ( = ?auto_88340 ?auto_88345 ) ) ( ON-TABLE ?auto_88343 ) ( ON ?auto_88342 ?auto_88343 ) ( ON ?auto_88341 ?auto_88342 ) ( ON ?auto_88344 ?auto_88341 ) ( ON ?auto_88345 ?auto_88344 ) ( not ( = ?auto_88343 ?auto_88342 ) ) ( not ( = ?auto_88343 ?auto_88341 ) ) ( not ( = ?auto_88343 ?auto_88344 ) ) ( not ( = ?auto_88343 ?auto_88345 ) ) ( not ( = ?auto_88343 ?auto_88340 ) ) ( not ( = ?auto_88343 ?auto_88339 ) ) ( not ( = ?auto_88342 ?auto_88341 ) ) ( not ( = ?auto_88342 ?auto_88344 ) ) ( not ( = ?auto_88342 ?auto_88345 ) ) ( not ( = ?auto_88342 ?auto_88340 ) ) ( not ( = ?auto_88342 ?auto_88339 ) ) ( not ( = ?auto_88341 ?auto_88344 ) ) ( not ( = ?auto_88341 ?auto_88345 ) ) ( not ( = ?auto_88341 ?auto_88340 ) ) ( not ( = ?auto_88341 ?auto_88339 ) ) ( not ( = ?auto_88344 ?auto_88345 ) ) ( not ( = ?auto_88344 ?auto_88340 ) ) ( not ( = ?auto_88344 ?auto_88339 ) ) ( HOLDING ?auto_88339 ) ( CLEAR ?auto_88340 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88343 ?auto_88342 ?auto_88341 ?auto_88344 ?auto_88345 ?auto_88340 ?auto_88339 )
      ( MAKE-2PILE ?auto_88339 ?auto_88340 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88346 - BLOCK
      ?auto_88347 - BLOCK
    )
    :vars
    (
      ?auto_88348 - BLOCK
      ?auto_88351 - BLOCK
      ?auto_88349 - BLOCK
      ?auto_88350 - BLOCK
      ?auto_88352 - BLOCK
      ?auto_88353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88346 ?auto_88347 ) ) ( ON ?auto_88347 ?auto_88348 ) ( not ( = ?auto_88346 ?auto_88348 ) ) ( not ( = ?auto_88347 ?auto_88348 ) ) ( ON-TABLE ?auto_88351 ) ( ON ?auto_88349 ?auto_88351 ) ( ON ?auto_88350 ?auto_88349 ) ( ON ?auto_88352 ?auto_88350 ) ( ON ?auto_88348 ?auto_88352 ) ( not ( = ?auto_88351 ?auto_88349 ) ) ( not ( = ?auto_88351 ?auto_88350 ) ) ( not ( = ?auto_88351 ?auto_88352 ) ) ( not ( = ?auto_88351 ?auto_88348 ) ) ( not ( = ?auto_88351 ?auto_88347 ) ) ( not ( = ?auto_88351 ?auto_88346 ) ) ( not ( = ?auto_88349 ?auto_88350 ) ) ( not ( = ?auto_88349 ?auto_88352 ) ) ( not ( = ?auto_88349 ?auto_88348 ) ) ( not ( = ?auto_88349 ?auto_88347 ) ) ( not ( = ?auto_88349 ?auto_88346 ) ) ( not ( = ?auto_88350 ?auto_88352 ) ) ( not ( = ?auto_88350 ?auto_88348 ) ) ( not ( = ?auto_88350 ?auto_88347 ) ) ( not ( = ?auto_88350 ?auto_88346 ) ) ( not ( = ?auto_88352 ?auto_88348 ) ) ( not ( = ?auto_88352 ?auto_88347 ) ) ( not ( = ?auto_88352 ?auto_88346 ) ) ( CLEAR ?auto_88347 ) ( ON ?auto_88346 ?auto_88353 ) ( CLEAR ?auto_88346 ) ( HAND-EMPTY ) ( not ( = ?auto_88346 ?auto_88353 ) ) ( not ( = ?auto_88347 ?auto_88353 ) ) ( not ( = ?auto_88348 ?auto_88353 ) ) ( not ( = ?auto_88351 ?auto_88353 ) ) ( not ( = ?auto_88349 ?auto_88353 ) ) ( not ( = ?auto_88350 ?auto_88353 ) ) ( not ( = ?auto_88352 ?auto_88353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88346 ?auto_88353 )
      ( MAKE-2PILE ?auto_88346 ?auto_88347 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88354 - BLOCK
      ?auto_88355 - BLOCK
    )
    :vars
    (
      ?auto_88357 - BLOCK
      ?auto_88359 - BLOCK
      ?auto_88358 - BLOCK
      ?auto_88360 - BLOCK
      ?auto_88361 - BLOCK
      ?auto_88356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88354 ?auto_88355 ) ) ( not ( = ?auto_88354 ?auto_88357 ) ) ( not ( = ?auto_88355 ?auto_88357 ) ) ( ON-TABLE ?auto_88359 ) ( ON ?auto_88358 ?auto_88359 ) ( ON ?auto_88360 ?auto_88358 ) ( ON ?auto_88361 ?auto_88360 ) ( ON ?auto_88357 ?auto_88361 ) ( not ( = ?auto_88359 ?auto_88358 ) ) ( not ( = ?auto_88359 ?auto_88360 ) ) ( not ( = ?auto_88359 ?auto_88361 ) ) ( not ( = ?auto_88359 ?auto_88357 ) ) ( not ( = ?auto_88359 ?auto_88355 ) ) ( not ( = ?auto_88359 ?auto_88354 ) ) ( not ( = ?auto_88358 ?auto_88360 ) ) ( not ( = ?auto_88358 ?auto_88361 ) ) ( not ( = ?auto_88358 ?auto_88357 ) ) ( not ( = ?auto_88358 ?auto_88355 ) ) ( not ( = ?auto_88358 ?auto_88354 ) ) ( not ( = ?auto_88360 ?auto_88361 ) ) ( not ( = ?auto_88360 ?auto_88357 ) ) ( not ( = ?auto_88360 ?auto_88355 ) ) ( not ( = ?auto_88360 ?auto_88354 ) ) ( not ( = ?auto_88361 ?auto_88357 ) ) ( not ( = ?auto_88361 ?auto_88355 ) ) ( not ( = ?auto_88361 ?auto_88354 ) ) ( ON ?auto_88354 ?auto_88356 ) ( CLEAR ?auto_88354 ) ( not ( = ?auto_88354 ?auto_88356 ) ) ( not ( = ?auto_88355 ?auto_88356 ) ) ( not ( = ?auto_88357 ?auto_88356 ) ) ( not ( = ?auto_88359 ?auto_88356 ) ) ( not ( = ?auto_88358 ?auto_88356 ) ) ( not ( = ?auto_88360 ?auto_88356 ) ) ( not ( = ?auto_88361 ?auto_88356 ) ) ( HOLDING ?auto_88355 ) ( CLEAR ?auto_88357 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88359 ?auto_88358 ?auto_88360 ?auto_88361 ?auto_88357 ?auto_88355 )
      ( MAKE-2PILE ?auto_88354 ?auto_88355 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88362 - BLOCK
      ?auto_88363 - BLOCK
    )
    :vars
    (
      ?auto_88366 - BLOCK
      ?auto_88368 - BLOCK
      ?auto_88365 - BLOCK
      ?auto_88367 - BLOCK
      ?auto_88364 - BLOCK
      ?auto_88369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88362 ?auto_88363 ) ) ( not ( = ?auto_88362 ?auto_88366 ) ) ( not ( = ?auto_88363 ?auto_88366 ) ) ( ON-TABLE ?auto_88368 ) ( ON ?auto_88365 ?auto_88368 ) ( ON ?auto_88367 ?auto_88365 ) ( ON ?auto_88364 ?auto_88367 ) ( ON ?auto_88366 ?auto_88364 ) ( not ( = ?auto_88368 ?auto_88365 ) ) ( not ( = ?auto_88368 ?auto_88367 ) ) ( not ( = ?auto_88368 ?auto_88364 ) ) ( not ( = ?auto_88368 ?auto_88366 ) ) ( not ( = ?auto_88368 ?auto_88363 ) ) ( not ( = ?auto_88368 ?auto_88362 ) ) ( not ( = ?auto_88365 ?auto_88367 ) ) ( not ( = ?auto_88365 ?auto_88364 ) ) ( not ( = ?auto_88365 ?auto_88366 ) ) ( not ( = ?auto_88365 ?auto_88363 ) ) ( not ( = ?auto_88365 ?auto_88362 ) ) ( not ( = ?auto_88367 ?auto_88364 ) ) ( not ( = ?auto_88367 ?auto_88366 ) ) ( not ( = ?auto_88367 ?auto_88363 ) ) ( not ( = ?auto_88367 ?auto_88362 ) ) ( not ( = ?auto_88364 ?auto_88366 ) ) ( not ( = ?auto_88364 ?auto_88363 ) ) ( not ( = ?auto_88364 ?auto_88362 ) ) ( ON ?auto_88362 ?auto_88369 ) ( not ( = ?auto_88362 ?auto_88369 ) ) ( not ( = ?auto_88363 ?auto_88369 ) ) ( not ( = ?auto_88366 ?auto_88369 ) ) ( not ( = ?auto_88368 ?auto_88369 ) ) ( not ( = ?auto_88365 ?auto_88369 ) ) ( not ( = ?auto_88367 ?auto_88369 ) ) ( not ( = ?auto_88364 ?auto_88369 ) ) ( CLEAR ?auto_88366 ) ( ON ?auto_88363 ?auto_88362 ) ( CLEAR ?auto_88363 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88369 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88369 ?auto_88362 )
      ( MAKE-2PILE ?auto_88362 ?auto_88363 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88370 - BLOCK
      ?auto_88371 - BLOCK
    )
    :vars
    (
      ?auto_88372 - BLOCK
      ?auto_88376 - BLOCK
      ?auto_88375 - BLOCK
      ?auto_88377 - BLOCK
      ?auto_88373 - BLOCK
      ?auto_88374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88370 ?auto_88371 ) ) ( not ( = ?auto_88370 ?auto_88372 ) ) ( not ( = ?auto_88371 ?auto_88372 ) ) ( ON-TABLE ?auto_88376 ) ( ON ?auto_88375 ?auto_88376 ) ( ON ?auto_88377 ?auto_88375 ) ( ON ?auto_88373 ?auto_88377 ) ( not ( = ?auto_88376 ?auto_88375 ) ) ( not ( = ?auto_88376 ?auto_88377 ) ) ( not ( = ?auto_88376 ?auto_88373 ) ) ( not ( = ?auto_88376 ?auto_88372 ) ) ( not ( = ?auto_88376 ?auto_88371 ) ) ( not ( = ?auto_88376 ?auto_88370 ) ) ( not ( = ?auto_88375 ?auto_88377 ) ) ( not ( = ?auto_88375 ?auto_88373 ) ) ( not ( = ?auto_88375 ?auto_88372 ) ) ( not ( = ?auto_88375 ?auto_88371 ) ) ( not ( = ?auto_88375 ?auto_88370 ) ) ( not ( = ?auto_88377 ?auto_88373 ) ) ( not ( = ?auto_88377 ?auto_88372 ) ) ( not ( = ?auto_88377 ?auto_88371 ) ) ( not ( = ?auto_88377 ?auto_88370 ) ) ( not ( = ?auto_88373 ?auto_88372 ) ) ( not ( = ?auto_88373 ?auto_88371 ) ) ( not ( = ?auto_88373 ?auto_88370 ) ) ( ON ?auto_88370 ?auto_88374 ) ( not ( = ?auto_88370 ?auto_88374 ) ) ( not ( = ?auto_88371 ?auto_88374 ) ) ( not ( = ?auto_88372 ?auto_88374 ) ) ( not ( = ?auto_88376 ?auto_88374 ) ) ( not ( = ?auto_88375 ?auto_88374 ) ) ( not ( = ?auto_88377 ?auto_88374 ) ) ( not ( = ?auto_88373 ?auto_88374 ) ) ( ON ?auto_88371 ?auto_88370 ) ( CLEAR ?auto_88371 ) ( ON-TABLE ?auto_88374 ) ( HOLDING ?auto_88372 ) ( CLEAR ?auto_88373 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88376 ?auto_88375 ?auto_88377 ?auto_88373 ?auto_88372 )
      ( MAKE-2PILE ?auto_88370 ?auto_88371 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88378 - BLOCK
      ?auto_88379 - BLOCK
    )
    :vars
    (
      ?auto_88384 - BLOCK
      ?auto_88380 - BLOCK
      ?auto_88385 - BLOCK
      ?auto_88383 - BLOCK
      ?auto_88382 - BLOCK
      ?auto_88381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88378 ?auto_88379 ) ) ( not ( = ?auto_88378 ?auto_88384 ) ) ( not ( = ?auto_88379 ?auto_88384 ) ) ( ON-TABLE ?auto_88380 ) ( ON ?auto_88385 ?auto_88380 ) ( ON ?auto_88383 ?auto_88385 ) ( ON ?auto_88382 ?auto_88383 ) ( not ( = ?auto_88380 ?auto_88385 ) ) ( not ( = ?auto_88380 ?auto_88383 ) ) ( not ( = ?auto_88380 ?auto_88382 ) ) ( not ( = ?auto_88380 ?auto_88384 ) ) ( not ( = ?auto_88380 ?auto_88379 ) ) ( not ( = ?auto_88380 ?auto_88378 ) ) ( not ( = ?auto_88385 ?auto_88383 ) ) ( not ( = ?auto_88385 ?auto_88382 ) ) ( not ( = ?auto_88385 ?auto_88384 ) ) ( not ( = ?auto_88385 ?auto_88379 ) ) ( not ( = ?auto_88385 ?auto_88378 ) ) ( not ( = ?auto_88383 ?auto_88382 ) ) ( not ( = ?auto_88383 ?auto_88384 ) ) ( not ( = ?auto_88383 ?auto_88379 ) ) ( not ( = ?auto_88383 ?auto_88378 ) ) ( not ( = ?auto_88382 ?auto_88384 ) ) ( not ( = ?auto_88382 ?auto_88379 ) ) ( not ( = ?auto_88382 ?auto_88378 ) ) ( ON ?auto_88378 ?auto_88381 ) ( not ( = ?auto_88378 ?auto_88381 ) ) ( not ( = ?auto_88379 ?auto_88381 ) ) ( not ( = ?auto_88384 ?auto_88381 ) ) ( not ( = ?auto_88380 ?auto_88381 ) ) ( not ( = ?auto_88385 ?auto_88381 ) ) ( not ( = ?auto_88383 ?auto_88381 ) ) ( not ( = ?auto_88382 ?auto_88381 ) ) ( ON ?auto_88379 ?auto_88378 ) ( ON-TABLE ?auto_88381 ) ( CLEAR ?auto_88382 ) ( ON ?auto_88384 ?auto_88379 ) ( CLEAR ?auto_88384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88381 ?auto_88378 ?auto_88379 )
      ( MAKE-2PILE ?auto_88378 ?auto_88379 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88386 - BLOCK
      ?auto_88387 - BLOCK
    )
    :vars
    (
      ?auto_88392 - BLOCK
      ?auto_88389 - BLOCK
      ?auto_88390 - BLOCK
      ?auto_88393 - BLOCK
      ?auto_88388 - BLOCK
      ?auto_88391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88386 ?auto_88387 ) ) ( not ( = ?auto_88386 ?auto_88392 ) ) ( not ( = ?auto_88387 ?auto_88392 ) ) ( ON-TABLE ?auto_88389 ) ( ON ?auto_88390 ?auto_88389 ) ( ON ?auto_88393 ?auto_88390 ) ( not ( = ?auto_88389 ?auto_88390 ) ) ( not ( = ?auto_88389 ?auto_88393 ) ) ( not ( = ?auto_88389 ?auto_88388 ) ) ( not ( = ?auto_88389 ?auto_88392 ) ) ( not ( = ?auto_88389 ?auto_88387 ) ) ( not ( = ?auto_88389 ?auto_88386 ) ) ( not ( = ?auto_88390 ?auto_88393 ) ) ( not ( = ?auto_88390 ?auto_88388 ) ) ( not ( = ?auto_88390 ?auto_88392 ) ) ( not ( = ?auto_88390 ?auto_88387 ) ) ( not ( = ?auto_88390 ?auto_88386 ) ) ( not ( = ?auto_88393 ?auto_88388 ) ) ( not ( = ?auto_88393 ?auto_88392 ) ) ( not ( = ?auto_88393 ?auto_88387 ) ) ( not ( = ?auto_88393 ?auto_88386 ) ) ( not ( = ?auto_88388 ?auto_88392 ) ) ( not ( = ?auto_88388 ?auto_88387 ) ) ( not ( = ?auto_88388 ?auto_88386 ) ) ( ON ?auto_88386 ?auto_88391 ) ( not ( = ?auto_88386 ?auto_88391 ) ) ( not ( = ?auto_88387 ?auto_88391 ) ) ( not ( = ?auto_88392 ?auto_88391 ) ) ( not ( = ?auto_88389 ?auto_88391 ) ) ( not ( = ?auto_88390 ?auto_88391 ) ) ( not ( = ?auto_88393 ?auto_88391 ) ) ( not ( = ?auto_88388 ?auto_88391 ) ) ( ON ?auto_88387 ?auto_88386 ) ( ON-TABLE ?auto_88391 ) ( ON ?auto_88392 ?auto_88387 ) ( CLEAR ?auto_88392 ) ( HOLDING ?auto_88388 ) ( CLEAR ?auto_88393 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88389 ?auto_88390 ?auto_88393 ?auto_88388 )
      ( MAKE-2PILE ?auto_88386 ?auto_88387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88394 - BLOCK
      ?auto_88395 - BLOCK
    )
    :vars
    (
      ?auto_88400 - BLOCK
      ?auto_88397 - BLOCK
      ?auto_88401 - BLOCK
      ?auto_88399 - BLOCK
      ?auto_88398 - BLOCK
      ?auto_88396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88394 ?auto_88395 ) ) ( not ( = ?auto_88394 ?auto_88400 ) ) ( not ( = ?auto_88395 ?auto_88400 ) ) ( ON-TABLE ?auto_88397 ) ( ON ?auto_88401 ?auto_88397 ) ( ON ?auto_88399 ?auto_88401 ) ( not ( = ?auto_88397 ?auto_88401 ) ) ( not ( = ?auto_88397 ?auto_88399 ) ) ( not ( = ?auto_88397 ?auto_88398 ) ) ( not ( = ?auto_88397 ?auto_88400 ) ) ( not ( = ?auto_88397 ?auto_88395 ) ) ( not ( = ?auto_88397 ?auto_88394 ) ) ( not ( = ?auto_88401 ?auto_88399 ) ) ( not ( = ?auto_88401 ?auto_88398 ) ) ( not ( = ?auto_88401 ?auto_88400 ) ) ( not ( = ?auto_88401 ?auto_88395 ) ) ( not ( = ?auto_88401 ?auto_88394 ) ) ( not ( = ?auto_88399 ?auto_88398 ) ) ( not ( = ?auto_88399 ?auto_88400 ) ) ( not ( = ?auto_88399 ?auto_88395 ) ) ( not ( = ?auto_88399 ?auto_88394 ) ) ( not ( = ?auto_88398 ?auto_88400 ) ) ( not ( = ?auto_88398 ?auto_88395 ) ) ( not ( = ?auto_88398 ?auto_88394 ) ) ( ON ?auto_88394 ?auto_88396 ) ( not ( = ?auto_88394 ?auto_88396 ) ) ( not ( = ?auto_88395 ?auto_88396 ) ) ( not ( = ?auto_88400 ?auto_88396 ) ) ( not ( = ?auto_88397 ?auto_88396 ) ) ( not ( = ?auto_88401 ?auto_88396 ) ) ( not ( = ?auto_88399 ?auto_88396 ) ) ( not ( = ?auto_88398 ?auto_88396 ) ) ( ON ?auto_88395 ?auto_88394 ) ( ON-TABLE ?auto_88396 ) ( ON ?auto_88400 ?auto_88395 ) ( CLEAR ?auto_88399 ) ( ON ?auto_88398 ?auto_88400 ) ( CLEAR ?auto_88398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88396 ?auto_88394 ?auto_88395 ?auto_88400 )
      ( MAKE-2PILE ?auto_88394 ?auto_88395 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88402 - BLOCK
      ?auto_88403 - BLOCK
    )
    :vars
    (
      ?auto_88404 - BLOCK
      ?auto_88406 - BLOCK
      ?auto_88409 - BLOCK
      ?auto_88408 - BLOCK
      ?auto_88405 - BLOCK
      ?auto_88407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88402 ?auto_88403 ) ) ( not ( = ?auto_88402 ?auto_88404 ) ) ( not ( = ?auto_88403 ?auto_88404 ) ) ( ON-TABLE ?auto_88406 ) ( ON ?auto_88409 ?auto_88406 ) ( not ( = ?auto_88406 ?auto_88409 ) ) ( not ( = ?auto_88406 ?auto_88408 ) ) ( not ( = ?auto_88406 ?auto_88405 ) ) ( not ( = ?auto_88406 ?auto_88404 ) ) ( not ( = ?auto_88406 ?auto_88403 ) ) ( not ( = ?auto_88406 ?auto_88402 ) ) ( not ( = ?auto_88409 ?auto_88408 ) ) ( not ( = ?auto_88409 ?auto_88405 ) ) ( not ( = ?auto_88409 ?auto_88404 ) ) ( not ( = ?auto_88409 ?auto_88403 ) ) ( not ( = ?auto_88409 ?auto_88402 ) ) ( not ( = ?auto_88408 ?auto_88405 ) ) ( not ( = ?auto_88408 ?auto_88404 ) ) ( not ( = ?auto_88408 ?auto_88403 ) ) ( not ( = ?auto_88408 ?auto_88402 ) ) ( not ( = ?auto_88405 ?auto_88404 ) ) ( not ( = ?auto_88405 ?auto_88403 ) ) ( not ( = ?auto_88405 ?auto_88402 ) ) ( ON ?auto_88402 ?auto_88407 ) ( not ( = ?auto_88402 ?auto_88407 ) ) ( not ( = ?auto_88403 ?auto_88407 ) ) ( not ( = ?auto_88404 ?auto_88407 ) ) ( not ( = ?auto_88406 ?auto_88407 ) ) ( not ( = ?auto_88409 ?auto_88407 ) ) ( not ( = ?auto_88408 ?auto_88407 ) ) ( not ( = ?auto_88405 ?auto_88407 ) ) ( ON ?auto_88403 ?auto_88402 ) ( ON-TABLE ?auto_88407 ) ( ON ?auto_88404 ?auto_88403 ) ( ON ?auto_88405 ?auto_88404 ) ( CLEAR ?auto_88405 ) ( HOLDING ?auto_88408 ) ( CLEAR ?auto_88409 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88406 ?auto_88409 ?auto_88408 )
      ( MAKE-2PILE ?auto_88402 ?auto_88403 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88410 - BLOCK
      ?auto_88411 - BLOCK
    )
    :vars
    (
      ?auto_88413 - BLOCK
      ?auto_88415 - BLOCK
      ?auto_88412 - BLOCK
      ?auto_88416 - BLOCK
      ?auto_88414 - BLOCK
      ?auto_88417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88410 ?auto_88411 ) ) ( not ( = ?auto_88410 ?auto_88413 ) ) ( not ( = ?auto_88411 ?auto_88413 ) ) ( ON-TABLE ?auto_88415 ) ( ON ?auto_88412 ?auto_88415 ) ( not ( = ?auto_88415 ?auto_88412 ) ) ( not ( = ?auto_88415 ?auto_88416 ) ) ( not ( = ?auto_88415 ?auto_88414 ) ) ( not ( = ?auto_88415 ?auto_88413 ) ) ( not ( = ?auto_88415 ?auto_88411 ) ) ( not ( = ?auto_88415 ?auto_88410 ) ) ( not ( = ?auto_88412 ?auto_88416 ) ) ( not ( = ?auto_88412 ?auto_88414 ) ) ( not ( = ?auto_88412 ?auto_88413 ) ) ( not ( = ?auto_88412 ?auto_88411 ) ) ( not ( = ?auto_88412 ?auto_88410 ) ) ( not ( = ?auto_88416 ?auto_88414 ) ) ( not ( = ?auto_88416 ?auto_88413 ) ) ( not ( = ?auto_88416 ?auto_88411 ) ) ( not ( = ?auto_88416 ?auto_88410 ) ) ( not ( = ?auto_88414 ?auto_88413 ) ) ( not ( = ?auto_88414 ?auto_88411 ) ) ( not ( = ?auto_88414 ?auto_88410 ) ) ( ON ?auto_88410 ?auto_88417 ) ( not ( = ?auto_88410 ?auto_88417 ) ) ( not ( = ?auto_88411 ?auto_88417 ) ) ( not ( = ?auto_88413 ?auto_88417 ) ) ( not ( = ?auto_88415 ?auto_88417 ) ) ( not ( = ?auto_88412 ?auto_88417 ) ) ( not ( = ?auto_88416 ?auto_88417 ) ) ( not ( = ?auto_88414 ?auto_88417 ) ) ( ON ?auto_88411 ?auto_88410 ) ( ON-TABLE ?auto_88417 ) ( ON ?auto_88413 ?auto_88411 ) ( ON ?auto_88414 ?auto_88413 ) ( CLEAR ?auto_88412 ) ( ON ?auto_88416 ?auto_88414 ) ( CLEAR ?auto_88416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88417 ?auto_88410 ?auto_88411 ?auto_88413 ?auto_88414 )
      ( MAKE-2PILE ?auto_88410 ?auto_88411 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88418 - BLOCK
      ?auto_88419 - BLOCK
    )
    :vars
    (
      ?auto_88421 - BLOCK
      ?auto_88423 - BLOCK
      ?auto_88425 - BLOCK
      ?auto_88422 - BLOCK
      ?auto_88420 - BLOCK
      ?auto_88424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88418 ?auto_88419 ) ) ( not ( = ?auto_88418 ?auto_88421 ) ) ( not ( = ?auto_88419 ?auto_88421 ) ) ( ON-TABLE ?auto_88423 ) ( not ( = ?auto_88423 ?auto_88425 ) ) ( not ( = ?auto_88423 ?auto_88422 ) ) ( not ( = ?auto_88423 ?auto_88420 ) ) ( not ( = ?auto_88423 ?auto_88421 ) ) ( not ( = ?auto_88423 ?auto_88419 ) ) ( not ( = ?auto_88423 ?auto_88418 ) ) ( not ( = ?auto_88425 ?auto_88422 ) ) ( not ( = ?auto_88425 ?auto_88420 ) ) ( not ( = ?auto_88425 ?auto_88421 ) ) ( not ( = ?auto_88425 ?auto_88419 ) ) ( not ( = ?auto_88425 ?auto_88418 ) ) ( not ( = ?auto_88422 ?auto_88420 ) ) ( not ( = ?auto_88422 ?auto_88421 ) ) ( not ( = ?auto_88422 ?auto_88419 ) ) ( not ( = ?auto_88422 ?auto_88418 ) ) ( not ( = ?auto_88420 ?auto_88421 ) ) ( not ( = ?auto_88420 ?auto_88419 ) ) ( not ( = ?auto_88420 ?auto_88418 ) ) ( ON ?auto_88418 ?auto_88424 ) ( not ( = ?auto_88418 ?auto_88424 ) ) ( not ( = ?auto_88419 ?auto_88424 ) ) ( not ( = ?auto_88421 ?auto_88424 ) ) ( not ( = ?auto_88423 ?auto_88424 ) ) ( not ( = ?auto_88425 ?auto_88424 ) ) ( not ( = ?auto_88422 ?auto_88424 ) ) ( not ( = ?auto_88420 ?auto_88424 ) ) ( ON ?auto_88419 ?auto_88418 ) ( ON-TABLE ?auto_88424 ) ( ON ?auto_88421 ?auto_88419 ) ( ON ?auto_88420 ?auto_88421 ) ( ON ?auto_88422 ?auto_88420 ) ( CLEAR ?auto_88422 ) ( HOLDING ?auto_88425 ) ( CLEAR ?auto_88423 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88423 ?auto_88425 )
      ( MAKE-2PILE ?auto_88418 ?auto_88419 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88426 - BLOCK
      ?auto_88427 - BLOCK
    )
    :vars
    (
      ?auto_88433 - BLOCK
      ?auto_88428 - BLOCK
      ?auto_88430 - BLOCK
      ?auto_88429 - BLOCK
      ?auto_88432 - BLOCK
      ?auto_88431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88426 ?auto_88427 ) ) ( not ( = ?auto_88426 ?auto_88433 ) ) ( not ( = ?auto_88427 ?auto_88433 ) ) ( ON-TABLE ?auto_88428 ) ( not ( = ?auto_88428 ?auto_88430 ) ) ( not ( = ?auto_88428 ?auto_88429 ) ) ( not ( = ?auto_88428 ?auto_88432 ) ) ( not ( = ?auto_88428 ?auto_88433 ) ) ( not ( = ?auto_88428 ?auto_88427 ) ) ( not ( = ?auto_88428 ?auto_88426 ) ) ( not ( = ?auto_88430 ?auto_88429 ) ) ( not ( = ?auto_88430 ?auto_88432 ) ) ( not ( = ?auto_88430 ?auto_88433 ) ) ( not ( = ?auto_88430 ?auto_88427 ) ) ( not ( = ?auto_88430 ?auto_88426 ) ) ( not ( = ?auto_88429 ?auto_88432 ) ) ( not ( = ?auto_88429 ?auto_88433 ) ) ( not ( = ?auto_88429 ?auto_88427 ) ) ( not ( = ?auto_88429 ?auto_88426 ) ) ( not ( = ?auto_88432 ?auto_88433 ) ) ( not ( = ?auto_88432 ?auto_88427 ) ) ( not ( = ?auto_88432 ?auto_88426 ) ) ( ON ?auto_88426 ?auto_88431 ) ( not ( = ?auto_88426 ?auto_88431 ) ) ( not ( = ?auto_88427 ?auto_88431 ) ) ( not ( = ?auto_88433 ?auto_88431 ) ) ( not ( = ?auto_88428 ?auto_88431 ) ) ( not ( = ?auto_88430 ?auto_88431 ) ) ( not ( = ?auto_88429 ?auto_88431 ) ) ( not ( = ?auto_88432 ?auto_88431 ) ) ( ON ?auto_88427 ?auto_88426 ) ( ON-TABLE ?auto_88431 ) ( ON ?auto_88433 ?auto_88427 ) ( ON ?auto_88432 ?auto_88433 ) ( ON ?auto_88429 ?auto_88432 ) ( CLEAR ?auto_88428 ) ( ON ?auto_88430 ?auto_88429 ) ( CLEAR ?auto_88430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88431 ?auto_88426 ?auto_88427 ?auto_88433 ?auto_88432 ?auto_88429 )
      ( MAKE-2PILE ?auto_88426 ?auto_88427 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88434 - BLOCK
      ?auto_88435 - BLOCK
    )
    :vars
    (
      ?auto_88441 - BLOCK
      ?auto_88440 - BLOCK
      ?auto_88439 - BLOCK
      ?auto_88436 - BLOCK
      ?auto_88438 - BLOCK
      ?auto_88437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88434 ?auto_88435 ) ) ( not ( = ?auto_88434 ?auto_88441 ) ) ( not ( = ?auto_88435 ?auto_88441 ) ) ( not ( = ?auto_88440 ?auto_88439 ) ) ( not ( = ?auto_88440 ?auto_88436 ) ) ( not ( = ?auto_88440 ?auto_88438 ) ) ( not ( = ?auto_88440 ?auto_88441 ) ) ( not ( = ?auto_88440 ?auto_88435 ) ) ( not ( = ?auto_88440 ?auto_88434 ) ) ( not ( = ?auto_88439 ?auto_88436 ) ) ( not ( = ?auto_88439 ?auto_88438 ) ) ( not ( = ?auto_88439 ?auto_88441 ) ) ( not ( = ?auto_88439 ?auto_88435 ) ) ( not ( = ?auto_88439 ?auto_88434 ) ) ( not ( = ?auto_88436 ?auto_88438 ) ) ( not ( = ?auto_88436 ?auto_88441 ) ) ( not ( = ?auto_88436 ?auto_88435 ) ) ( not ( = ?auto_88436 ?auto_88434 ) ) ( not ( = ?auto_88438 ?auto_88441 ) ) ( not ( = ?auto_88438 ?auto_88435 ) ) ( not ( = ?auto_88438 ?auto_88434 ) ) ( ON ?auto_88434 ?auto_88437 ) ( not ( = ?auto_88434 ?auto_88437 ) ) ( not ( = ?auto_88435 ?auto_88437 ) ) ( not ( = ?auto_88441 ?auto_88437 ) ) ( not ( = ?auto_88440 ?auto_88437 ) ) ( not ( = ?auto_88439 ?auto_88437 ) ) ( not ( = ?auto_88436 ?auto_88437 ) ) ( not ( = ?auto_88438 ?auto_88437 ) ) ( ON ?auto_88435 ?auto_88434 ) ( ON-TABLE ?auto_88437 ) ( ON ?auto_88441 ?auto_88435 ) ( ON ?auto_88438 ?auto_88441 ) ( ON ?auto_88436 ?auto_88438 ) ( ON ?auto_88439 ?auto_88436 ) ( CLEAR ?auto_88439 ) ( HOLDING ?auto_88440 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88440 )
      ( MAKE-2PILE ?auto_88434 ?auto_88435 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88442 - BLOCK
      ?auto_88443 - BLOCK
    )
    :vars
    (
      ?auto_88448 - BLOCK
      ?auto_88446 - BLOCK
      ?auto_88449 - BLOCK
      ?auto_88447 - BLOCK
      ?auto_88444 - BLOCK
      ?auto_88445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88442 ?auto_88443 ) ) ( not ( = ?auto_88442 ?auto_88448 ) ) ( not ( = ?auto_88443 ?auto_88448 ) ) ( not ( = ?auto_88446 ?auto_88449 ) ) ( not ( = ?auto_88446 ?auto_88447 ) ) ( not ( = ?auto_88446 ?auto_88444 ) ) ( not ( = ?auto_88446 ?auto_88448 ) ) ( not ( = ?auto_88446 ?auto_88443 ) ) ( not ( = ?auto_88446 ?auto_88442 ) ) ( not ( = ?auto_88449 ?auto_88447 ) ) ( not ( = ?auto_88449 ?auto_88444 ) ) ( not ( = ?auto_88449 ?auto_88448 ) ) ( not ( = ?auto_88449 ?auto_88443 ) ) ( not ( = ?auto_88449 ?auto_88442 ) ) ( not ( = ?auto_88447 ?auto_88444 ) ) ( not ( = ?auto_88447 ?auto_88448 ) ) ( not ( = ?auto_88447 ?auto_88443 ) ) ( not ( = ?auto_88447 ?auto_88442 ) ) ( not ( = ?auto_88444 ?auto_88448 ) ) ( not ( = ?auto_88444 ?auto_88443 ) ) ( not ( = ?auto_88444 ?auto_88442 ) ) ( ON ?auto_88442 ?auto_88445 ) ( not ( = ?auto_88442 ?auto_88445 ) ) ( not ( = ?auto_88443 ?auto_88445 ) ) ( not ( = ?auto_88448 ?auto_88445 ) ) ( not ( = ?auto_88446 ?auto_88445 ) ) ( not ( = ?auto_88449 ?auto_88445 ) ) ( not ( = ?auto_88447 ?auto_88445 ) ) ( not ( = ?auto_88444 ?auto_88445 ) ) ( ON ?auto_88443 ?auto_88442 ) ( ON-TABLE ?auto_88445 ) ( ON ?auto_88448 ?auto_88443 ) ( ON ?auto_88444 ?auto_88448 ) ( ON ?auto_88447 ?auto_88444 ) ( ON ?auto_88449 ?auto_88447 ) ( ON ?auto_88446 ?auto_88449 ) ( CLEAR ?auto_88446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88445 ?auto_88442 ?auto_88443 ?auto_88448 ?auto_88444 ?auto_88447 ?auto_88449 )
      ( MAKE-2PILE ?auto_88442 ?auto_88443 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88454 - BLOCK
      ?auto_88455 - BLOCK
      ?auto_88456 - BLOCK
      ?auto_88457 - BLOCK
    )
    :vars
    (
      ?auto_88458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88458 ?auto_88457 ) ( CLEAR ?auto_88458 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88454 ) ( ON ?auto_88455 ?auto_88454 ) ( ON ?auto_88456 ?auto_88455 ) ( ON ?auto_88457 ?auto_88456 ) ( not ( = ?auto_88454 ?auto_88455 ) ) ( not ( = ?auto_88454 ?auto_88456 ) ) ( not ( = ?auto_88454 ?auto_88457 ) ) ( not ( = ?auto_88454 ?auto_88458 ) ) ( not ( = ?auto_88455 ?auto_88456 ) ) ( not ( = ?auto_88455 ?auto_88457 ) ) ( not ( = ?auto_88455 ?auto_88458 ) ) ( not ( = ?auto_88456 ?auto_88457 ) ) ( not ( = ?auto_88456 ?auto_88458 ) ) ( not ( = ?auto_88457 ?auto_88458 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88458 ?auto_88457 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88459 - BLOCK
      ?auto_88460 - BLOCK
      ?auto_88461 - BLOCK
      ?auto_88462 - BLOCK
    )
    :vars
    (
      ?auto_88463 - BLOCK
      ?auto_88464 - BLOCK
      ?auto_88465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88463 ?auto_88462 ) ( CLEAR ?auto_88463 ) ( ON-TABLE ?auto_88459 ) ( ON ?auto_88460 ?auto_88459 ) ( ON ?auto_88461 ?auto_88460 ) ( ON ?auto_88462 ?auto_88461 ) ( not ( = ?auto_88459 ?auto_88460 ) ) ( not ( = ?auto_88459 ?auto_88461 ) ) ( not ( = ?auto_88459 ?auto_88462 ) ) ( not ( = ?auto_88459 ?auto_88463 ) ) ( not ( = ?auto_88460 ?auto_88461 ) ) ( not ( = ?auto_88460 ?auto_88462 ) ) ( not ( = ?auto_88460 ?auto_88463 ) ) ( not ( = ?auto_88461 ?auto_88462 ) ) ( not ( = ?auto_88461 ?auto_88463 ) ) ( not ( = ?auto_88462 ?auto_88463 ) ) ( HOLDING ?auto_88464 ) ( CLEAR ?auto_88465 ) ( not ( = ?auto_88459 ?auto_88464 ) ) ( not ( = ?auto_88459 ?auto_88465 ) ) ( not ( = ?auto_88460 ?auto_88464 ) ) ( not ( = ?auto_88460 ?auto_88465 ) ) ( not ( = ?auto_88461 ?auto_88464 ) ) ( not ( = ?auto_88461 ?auto_88465 ) ) ( not ( = ?auto_88462 ?auto_88464 ) ) ( not ( = ?auto_88462 ?auto_88465 ) ) ( not ( = ?auto_88463 ?auto_88464 ) ) ( not ( = ?auto_88463 ?auto_88465 ) ) ( not ( = ?auto_88464 ?auto_88465 ) ) )
    :subtasks
    ( ( !STACK ?auto_88464 ?auto_88465 )
      ( MAKE-4PILE ?auto_88459 ?auto_88460 ?auto_88461 ?auto_88462 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88466 - BLOCK
      ?auto_88467 - BLOCK
      ?auto_88468 - BLOCK
      ?auto_88469 - BLOCK
    )
    :vars
    (
      ?auto_88472 - BLOCK
      ?auto_88471 - BLOCK
      ?auto_88470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88472 ?auto_88469 ) ( ON-TABLE ?auto_88466 ) ( ON ?auto_88467 ?auto_88466 ) ( ON ?auto_88468 ?auto_88467 ) ( ON ?auto_88469 ?auto_88468 ) ( not ( = ?auto_88466 ?auto_88467 ) ) ( not ( = ?auto_88466 ?auto_88468 ) ) ( not ( = ?auto_88466 ?auto_88469 ) ) ( not ( = ?auto_88466 ?auto_88472 ) ) ( not ( = ?auto_88467 ?auto_88468 ) ) ( not ( = ?auto_88467 ?auto_88469 ) ) ( not ( = ?auto_88467 ?auto_88472 ) ) ( not ( = ?auto_88468 ?auto_88469 ) ) ( not ( = ?auto_88468 ?auto_88472 ) ) ( not ( = ?auto_88469 ?auto_88472 ) ) ( CLEAR ?auto_88471 ) ( not ( = ?auto_88466 ?auto_88470 ) ) ( not ( = ?auto_88466 ?auto_88471 ) ) ( not ( = ?auto_88467 ?auto_88470 ) ) ( not ( = ?auto_88467 ?auto_88471 ) ) ( not ( = ?auto_88468 ?auto_88470 ) ) ( not ( = ?auto_88468 ?auto_88471 ) ) ( not ( = ?auto_88469 ?auto_88470 ) ) ( not ( = ?auto_88469 ?auto_88471 ) ) ( not ( = ?auto_88472 ?auto_88470 ) ) ( not ( = ?auto_88472 ?auto_88471 ) ) ( not ( = ?auto_88470 ?auto_88471 ) ) ( ON ?auto_88470 ?auto_88472 ) ( CLEAR ?auto_88470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88466 ?auto_88467 ?auto_88468 ?auto_88469 ?auto_88472 )
      ( MAKE-4PILE ?auto_88466 ?auto_88467 ?auto_88468 ?auto_88469 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88473 - BLOCK
      ?auto_88474 - BLOCK
      ?auto_88475 - BLOCK
      ?auto_88476 - BLOCK
    )
    :vars
    (
      ?auto_88477 - BLOCK
      ?auto_88479 - BLOCK
      ?auto_88478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88477 ?auto_88476 ) ( ON-TABLE ?auto_88473 ) ( ON ?auto_88474 ?auto_88473 ) ( ON ?auto_88475 ?auto_88474 ) ( ON ?auto_88476 ?auto_88475 ) ( not ( = ?auto_88473 ?auto_88474 ) ) ( not ( = ?auto_88473 ?auto_88475 ) ) ( not ( = ?auto_88473 ?auto_88476 ) ) ( not ( = ?auto_88473 ?auto_88477 ) ) ( not ( = ?auto_88474 ?auto_88475 ) ) ( not ( = ?auto_88474 ?auto_88476 ) ) ( not ( = ?auto_88474 ?auto_88477 ) ) ( not ( = ?auto_88475 ?auto_88476 ) ) ( not ( = ?auto_88475 ?auto_88477 ) ) ( not ( = ?auto_88476 ?auto_88477 ) ) ( not ( = ?auto_88473 ?auto_88479 ) ) ( not ( = ?auto_88473 ?auto_88478 ) ) ( not ( = ?auto_88474 ?auto_88479 ) ) ( not ( = ?auto_88474 ?auto_88478 ) ) ( not ( = ?auto_88475 ?auto_88479 ) ) ( not ( = ?auto_88475 ?auto_88478 ) ) ( not ( = ?auto_88476 ?auto_88479 ) ) ( not ( = ?auto_88476 ?auto_88478 ) ) ( not ( = ?auto_88477 ?auto_88479 ) ) ( not ( = ?auto_88477 ?auto_88478 ) ) ( not ( = ?auto_88479 ?auto_88478 ) ) ( ON ?auto_88479 ?auto_88477 ) ( CLEAR ?auto_88479 ) ( HOLDING ?auto_88478 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88478 )
      ( MAKE-4PILE ?auto_88473 ?auto_88474 ?auto_88475 ?auto_88476 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88480 - BLOCK
      ?auto_88481 - BLOCK
      ?auto_88482 - BLOCK
      ?auto_88483 - BLOCK
    )
    :vars
    (
      ?auto_88485 - BLOCK
      ?auto_88484 - BLOCK
      ?auto_88486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88485 ?auto_88483 ) ( ON-TABLE ?auto_88480 ) ( ON ?auto_88481 ?auto_88480 ) ( ON ?auto_88482 ?auto_88481 ) ( ON ?auto_88483 ?auto_88482 ) ( not ( = ?auto_88480 ?auto_88481 ) ) ( not ( = ?auto_88480 ?auto_88482 ) ) ( not ( = ?auto_88480 ?auto_88483 ) ) ( not ( = ?auto_88480 ?auto_88485 ) ) ( not ( = ?auto_88481 ?auto_88482 ) ) ( not ( = ?auto_88481 ?auto_88483 ) ) ( not ( = ?auto_88481 ?auto_88485 ) ) ( not ( = ?auto_88482 ?auto_88483 ) ) ( not ( = ?auto_88482 ?auto_88485 ) ) ( not ( = ?auto_88483 ?auto_88485 ) ) ( not ( = ?auto_88480 ?auto_88484 ) ) ( not ( = ?auto_88480 ?auto_88486 ) ) ( not ( = ?auto_88481 ?auto_88484 ) ) ( not ( = ?auto_88481 ?auto_88486 ) ) ( not ( = ?auto_88482 ?auto_88484 ) ) ( not ( = ?auto_88482 ?auto_88486 ) ) ( not ( = ?auto_88483 ?auto_88484 ) ) ( not ( = ?auto_88483 ?auto_88486 ) ) ( not ( = ?auto_88485 ?auto_88484 ) ) ( not ( = ?auto_88485 ?auto_88486 ) ) ( not ( = ?auto_88484 ?auto_88486 ) ) ( ON ?auto_88484 ?auto_88485 ) ( ON ?auto_88486 ?auto_88484 ) ( CLEAR ?auto_88486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88480 ?auto_88481 ?auto_88482 ?auto_88483 ?auto_88485 ?auto_88484 )
      ( MAKE-4PILE ?auto_88480 ?auto_88481 ?auto_88482 ?auto_88483 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88487 - BLOCK
      ?auto_88488 - BLOCK
      ?auto_88489 - BLOCK
      ?auto_88490 - BLOCK
    )
    :vars
    (
      ?auto_88493 - BLOCK
      ?auto_88491 - BLOCK
      ?auto_88492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88493 ?auto_88490 ) ( ON-TABLE ?auto_88487 ) ( ON ?auto_88488 ?auto_88487 ) ( ON ?auto_88489 ?auto_88488 ) ( ON ?auto_88490 ?auto_88489 ) ( not ( = ?auto_88487 ?auto_88488 ) ) ( not ( = ?auto_88487 ?auto_88489 ) ) ( not ( = ?auto_88487 ?auto_88490 ) ) ( not ( = ?auto_88487 ?auto_88493 ) ) ( not ( = ?auto_88488 ?auto_88489 ) ) ( not ( = ?auto_88488 ?auto_88490 ) ) ( not ( = ?auto_88488 ?auto_88493 ) ) ( not ( = ?auto_88489 ?auto_88490 ) ) ( not ( = ?auto_88489 ?auto_88493 ) ) ( not ( = ?auto_88490 ?auto_88493 ) ) ( not ( = ?auto_88487 ?auto_88491 ) ) ( not ( = ?auto_88487 ?auto_88492 ) ) ( not ( = ?auto_88488 ?auto_88491 ) ) ( not ( = ?auto_88488 ?auto_88492 ) ) ( not ( = ?auto_88489 ?auto_88491 ) ) ( not ( = ?auto_88489 ?auto_88492 ) ) ( not ( = ?auto_88490 ?auto_88491 ) ) ( not ( = ?auto_88490 ?auto_88492 ) ) ( not ( = ?auto_88493 ?auto_88491 ) ) ( not ( = ?auto_88493 ?auto_88492 ) ) ( not ( = ?auto_88491 ?auto_88492 ) ) ( ON ?auto_88491 ?auto_88493 ) ( HOLDING ?auto_88492 ) ( CLEAR ?auto_88491 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88487 ?auto_88488 ?auto_88489 ?auto_88490 ?auto_88493 ?auto_88491 ?auto_88492 )
      ( MAKE-4PILE ?auto_88487 ?auto_88488 ?auto_88489 ?auto_88490 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88494 - BLOCK
      ?auto_88495 - BLOCK
      ?auto_88496 - BLOCK
      ?auto_88497 - BLOCK
    )
    :vars
    (
      ?auto_88498 - BLOCK
      ?auto_88499 - BLOCK
      ?auto_88500 - BLOCK
      ?auto_88501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88498 ?auto_88497 ) ( ON-TABLE ?auto_88494 ) ( ON ?auto_88495 ?auto_88494 ) ( ON ?auto_88496 ?auto_88495 ) ( ON ?auto_88497 ?auto_88496 ) ( not ( = ?auto_88494 ?auto_88495 ) ) ( not ( = ?auto_88494 ?auto_88496 ) ) ( not ( = ?auto_88494 ?auto_88497 ) ) ( not ( = ?auto_88494 ?auto_88498 ) ) ( not ( = ?auto_88495 ?auto_88496 ) ) ( not ( = ?auto_88495 ?auto_88497 ) ) ( not ( = ?auto_88495 ?auto_88498 ) ) ( not ( = ?auto_88496 ?auto_88497 ) ) ( not ( = ?auto_88496 ?auto_88498 ) ) ( not ( = ?auto_88497 ?auto_88498 ) ) ( not ( = ?auto_88494 ?auto_88499 ) ) ( not ( = ?auto_88494 ?auto_88500 ) ) ( not ( = ?auto_88495 ?auto_88499 ) ) ( not ( = ?auto_88495 ?auto_88500 ) ) ( not ( = ?auto_88496 ?auto_88499 ) ) ( not ( = ?auto_88496 ?auto_88500 ) ) ( not ( = ?auto_88497 ?auto_88499 ) ) ( not ( = ?auto_88497 ?auto_88500 ) ) ( not ( = ?auto_88498 ?auto_88499 ) ) ( not ( = ?auto_88498 ?auto_88500 ) ) ( not ( = ?auto_88499 ?auto_88500 ) ) ( ON ?auto_88499 ?auto_88498 ) ( CLEAR ?auto_88499 ) ( ON ?auto_88500 ?auto_88501 ) ( CLEAR ?auto_88500 ) ( HAND-EMPTY ) ( not ( = ?auto_88494 ?auto_88501 ) ) ( not ( = ?auto_88495 ?auto_88501 ) ) ( not ( = ?auto_88496 ?auto_88501 ) ) ( not ( = ?auto_88497 ?auto_88501 ) ) ( not ( = ?auto_88498 ?auto_88501 ) ) ( not ( = ?auto_88499 ?auto_88501 ) ) ( not ( = ?auto_88500 ?auto_88501 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88500 ?auto_88501 )
      ( MAKE-4PILE ?auto_88494 ?auto_88495 ?auto_88496 ?auto_88497 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88502 - BLOCK
      ?auto_88503 - BLOCK
      ?auto_88504 - BLOCK
      ?auto_88505 - BLOCK
    )
    :vars
    (
      ?auto_88509 - BLOCK
      ?auto_88508 - BLOCK
      ?auto_88507 - BLOCK
      ?auto_88506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88509 ?auto_88505 ) ( ON-TABLE ?auto_88502 ) ( ON ?auto_88503 ?auto_88502 ) ( ON ?auto_88504 ?auto_88503 ) ( ON ?auto_88505 ?auto_88504 ) ( not ( = ?auto_88502 ?auto_88503 ) ) ( not ( = ?auto_88502 ?auto_88504 ) ) ( not ( = ?auto_88502 ?auto_88505 ) ) ( not ( = ?auto_88502 ?auto_88509 ) ) ( not ( = ?auto_88503 ?auto_88504 ) ) ( not ( = ?auto_88503 ?auto_88505 ) ) ( not ( = ?auto_88503 ?auto_88509 ) ) ( not ( = ?auto_88504 ?auto_88505 ) ) ( not ( = ?auto_88504 ?auto_88509 ) ) ( not ( = ?auto_88505 ?auto_88509 ) ) ( not ( = ?auto_88502 ?auto_88508 ) ) ( not ( = ?auto_88502 ?auto_88507 ) ) ( not ( = ?auto_88503 ?auto_88508 ) ) ( not ( = ?auto_88503 ?auto_88507 ) ) ( not ( = ?auto_88504 ?auto_88508 ) ) ( not ( = ?auto_88504 ?auto_88507 ) ) ( not ( = ?auto_88505 ?auto_88508 ) ) ( not ( = ?auto_88505 ?auto_88507 ) ) ( not ( = ?auto_88509 ?auto_88508 ) ) ( not ( = ?auto_88509 ?auto_88507 ) ) ( not ( = ?auto_88508 ?auto_88507 ) ) ( ON ?auto_88507 ?auto_88506 ) ( CLEAR ?auto_88507 ) ( not ( = ?auto_88502 ?auto_88506 ) ) ( not ( = ?auto_88503 ?auto_88506 ) ) ( not ( = ?auto_88504 ?auto_88506 ) ) ( not ( = ?auto_88505 ?auto_88506 ) ) ( not ( = ?auto_88509 ?auto_88506 ) ) ( not ( = ?auto_88508 ?auto_88506 ) ) ( not ( = ?auto_88507 ?auto_88506 ) ) ( HOLDING ?auto_88508 ) ( CLEAR ?auto_88509 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88502 ?auto_88503 ?auto_88504 ?auto_88505 ?auto_88509 ?auto_88508 )
      ( MAKE-4PILE ?auto_88502 ?auto_88503 ?auto_88504 ?auto_88505 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88510 - BLOCK
      ?auto_88511 - BLOCK
      ?auto_88512 - BLOCK
      ?auto_88513 - BLOCK
    )
    :vars
    (
      ?auto_88516 - BLOCK
      ?auto_88514 - BLOCK
      ?auto_88517 - BLOCK
      ?auto_88515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88516 ?auto_88513 ) ( ON-TABLE ?auto_88510 ) ( ON ?auto_88511 ?auto_88510 ) ( ON ?auto_88512 ?auto_88511 ) ( ON ?auto_88513 ?auto_88512 ) ( not ( = ?auto_88510 ?auto_88511 ) ) ( not ( = ?auto_88510 ?auto_88512 ) ) ( not ( = ?auto_88510 ?auto_88513 ) ) ( not ( = ?auto_88510 ?auto_88516 ) ) ( not ( = ?auto_88511 ?auto_88512 ) ) ( not ( = ?auto_88511 ?auto_88513 ) ) ( not ( = ?auto_88511 ?auto_88516 ) ) ( not ( = ?auto_88512 ?auto_88513 ) ) ( not ( = ?auto_88512 ?auto_88516 ) ) ( not ( = ?auto_88513 ?auto_88516 ) ) ( not ( = ?auto_88510 ?auto_88514 ) ) ( not ( = ?auto_88510 ?auto_88517 ) ) ( not ( = ?auto_88511 ?auto_88514 ) ) ( not ( = ?auto_88511 ?auto_88517 ) ) ( not ( = ?auto_88512 ?auto_88514 ) ) ( not ( = ?auto_88512 ?auto_88517 ) ) ( not ( = ?auto_88513 ?auto_88514 ) ) ( not ( = ?auto_88513 ?auto_88517 ) ) ( not ( = ?auto_88516 ?auto_88514 ) ) ( not ( = ?auto_88516 ?auto_88517 ) ) ( not ( = ?auto_88514 ?auto_88517 ) ) ( ON ?auto_88517 ?auto_88515 ) ( not ( = ?auto_88510 ?auto_88515 ) ) ( not ( = ?auto_88511 ?auto_88515 ) ) ( not ( = ?auto_88512 ?auto_88515 ) ) ( not ( = ?auto_88513 ?auto_88515 ) ) ( not ( = ?auto_88516 ?auto_88515 ) ) ( not ( = ?auto_88514 ?auto_88515 ) ) ( not ( = ?auto_88517 ?auto_88515 ) ) ( CLEAR ?auto_88516 ) ( ON ?auto_88514 ?auto_88517 ) ( CLEAR ?auto_88514 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88515 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88515 ?auto_88517 )
      ( MAKE-4PILE ?auto_88510 ?auto_88511 ?auto_88512 ?auto_88513 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88534 - BLOCK
      ?auto_88535 - BLOCK
      ?auto_88536 - BLOCK
      ?auto_88537 - BLOCK
    )
    :vars
    (
      ?auto_88540 - BLOCK
      ?auto_88541 - BLOCK
      ?auto_88539 - BLOCK
      ?auto_88538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88534 ) ( ON ?auto_88535 ?auto_88534 ) ( ON ?auto_88536 ?auto_88535 ) ( not ( = ?auto_88534 ?auto_88535 ) ) ( not ( = ?auto_88534 ?auto_88536 ) ) ( not ( = ?auto_88534 ?auto_88537 ) ) ( not ( = ?auto_88534 ?auto_88540 ) ) ( not ( = ?auto_88535 ?auto_88536 ) ) ( not ( = ?auto_88535 ?auto_88537 ) ) ( not ( = ?auto_88535 ?auto_88540 ) ) ( not ( = ?auto_88536 ?auto_88537 ) ) ( not ( = ?auto_88536 ?auto_88540 ) ) ( not ( = ?auto_88537 ?auto_88540 ) ) ( not ( = ?auto_88534 ?auto_88541 ) ) ( not ( = ?auto_88534 ?auto_88539 ) ) ( not ( = ?auto_88535 ?auto_88541 ) ) ( not ( = ?auto_88535 ?auto_88539 ) ) ( not ( = ?auto_88536 ?auto_88541 ) ) ( not ( = ?auto_88536 ?auto_88539 ) ) ( not ( = ?auto_88537 ?auto_88541 ) ) ( not ( = ?auto_88537 ?auto_88539 ) ) ( not ( = ?auto_88540 ?auto_88541 ) ) ( not ( = ?auto_88540 ?auto_88539 ) ) ( not ( = ?auto_88541 ?auto_88539 ) ) ( ON ?auto_88539 ?auto_88538 ) ( not ( = ?auto_88534 ?auto_88538 ) ) ( not ( = ?auto_88535 ?auto_88538 ) ) ( not ( = ?auto_88536 ?auto_88538 ) ) ( not ( = ?auto_88537 ?auto_88538 ) ) ( not ( = ?auto_88540 ?auto_88538 ) ) ( not ( = ?auto_88541 ?auto_88538 ) ) ( not ( = ?auto_88539 ?auto_88538 ) ) ( ON ?auto_88541 ?auto_88539 ) ( ON-TABLE ?auto_88538 ) ( ON ?auto_88540 ?auto_88541 ) ( CLEAR ?auto_88540 ) ( HOLDING ?auto_88537 ) ( CLEAR ?auto_88536 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88534 ?auto_88535 ?auto_88536 ?auto_88537 ?auto_88540 )
      ( MAKE-4PILE ?auto_88534 ?auto_88535 ?auto_88536 ?auto_88537 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88542 - BLOCK
      ?auto_88543 - BLOCK
      ?auto_88544 - BLOCK
      ?auto_88545 - BLOCK
    )
    :vars
    (
      ?auto_88547 - BLOCK
      ?auto_88548 - BLOCK
      ?auto_88546 - BLOCK
      ?auto_88549 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88542 ) ( ON ?auto_88543 ?auto_88542 ) ( ON ?auto_88544 ?auto_88543 ) ( not ( = ?auto_88542 ?auto_88543 ) ) ( not ( = ?auto_88542 ?auto_88544 ) ) ( not ( = ?auto_88542 ?auto_88545 ) ) ( not ( = ?auto_88542 ?auto_88547 ) ) ( not ( = ?auto_88543 ?auto_88544 ) ) ( not ( = ?auto_88543 ?auto_88545 ) ) ( not ( = ?auto_88543 ?auto_88547 ) ) ( not ( = ?auto_88544 ?auto_88545 ) ) ( not ( = ?auto_88544 ?auto_88547 ) ) ( not ( = ?auto_88545 ?auto_88547 ) ) ( not ( = ?auto_88542 ?auto_88548 ) ) ( not ( = ?auto_88542 ?auto_88546 ) ) ( not ( = ?auto_88543 ?auto_88548 ) ) ( not ( = ?auto_88543 ?auto_88546 ) ) ( not ( = ?auto_88544 ?auto_88548 ) ) ( not ( = ?auto_88544 ?auto_88546 ) ) ( not ( = ?auto_88545 ?auto_88548 ) ) ( not ( = ?auto_88545 ?auto_88546 ) ) ( not ( = ?auto_88547 ?auto_88548 ) ) ( not ( = ?auto_88547 ?auto_88546 ) ) ( not ( = ?auto_88548 ?auto_88546 ) ) ( ON ?auto_88546 ?auto_88549 ) ( not ( = ?auto_88542 ?auto_88549 ) ) ( not ( = ?auto_88543 ?auto_88549 ) ) ( not ( = ?auto_88544 ?auto_88549 ) ) ( not ( = ?auto_88545 ?auto_88549 ) ) ( not ( = ?auto_88547 ?auto_88549 ) ) ( not ( = ?auto_88548 ?auto_88549 ) ) ( not ( = ?auto_88546 ?auto_88549 ) ) ( ON ?auto_88548 ?auto_88546 ) ( ON-TABLE ?auto_88549 ) ( ON ?auto_88547 ?auto_88548 ) ( CLEAR ?auto_88544 ) ( ON ?auto_88545 ?auto_88547 ) ( CLEAR ?auto_88545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88549 ?auto_88546 ?auto_88548 ?auto_88547 )
      ( MAKE-4PILE ?auto_88542 ?auto_88543 ?auto_88544 ?auto_88545 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88550 - BLOCK
      ?auto_88551 - BLOCK
      ?auto_88552 - BLOCK
      ?auto_88553 - BLOCK
    )
    :vars
    (
      ?auto_88556 - BLOCK
      ?auto_88557 - BLOCK
      ?auto_88554 - BLOCK
      ?auto_88555 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88550 ) ( ON ?auto_88551 ?auto_88550 ) ( not ( = ?auto_88550 ?auto_88551 ) ) ( not ( = ?auto_88550 ?auto_88552 ) ) ( not ( = ?auto_88550 ?auto_88553 ) ) ( not ( = ?auto_88550 ?auto_88556 ) ) ( not ( = ?auto_88551 ?auto_88552 ) ) ( not ( = ?auto_88551 ?auto_88553 ) ) ( not ( = ?auto_88551 ?auto_88556 ) ) ( not ( = ?auto_88552 ?auto_88553 ) ) ( not ( = ?auto_88552 ?auto_88556 ) ) ( not ( = ?auto_88553 ?auto_88556 ) ) ( not ( = ?auto_88550 ?auto_88557 ) ) ( not ( = ?auto_88550 ?auto_88554 ) ) ( not ( = ?auto_88551 ?auto_88557 ) ) ( not ( = ?auto_88551 ?auto_88554 ) ) ( not ( = ?auto_88552 ?auto_88557 ) ) ( not ( = ?auto_88552 ?auto_88554 ) ) ( not ( = ?auto_88553 ?auto_88557 ) ) ( not ( = ?auto_88553 ?auto_88554 ) ) ( not ( = ?auto_88556 ?auto_88557 ) ) ( not ( = ?auto_88556 ?auto_88554 ) ) ( not ( = ?auto_88557 ?auto_88554 ) ) ( ON ?auto_88554 ?auto_88555 ) ( not ( = ?auto_88550 ?auto_88555 ) ) ( not ( = ?auto_88551 ?auto_88555 ) ) ( not ( = ?auto_88552 ?auto_88555 ) ) ( not ( = ?auto_88553 ?auto_88555 ) ) ( not ( = ?auto_88556 ?auto_88555 ) ) ( not ( = ?auto_88557 ?auto_88555 ) ) ( not ( = ?auto_88554 ?auto_88555 ) ) ( ON ?auto_88557 ?auto_88554 ) ( ON-TABLE ?auto_88555 ) ( ON ?auto_88556 ?auto_88557 ) ( ON ?auto_88553 ?auto_88556 ) ( CLEAR ?auto_88553 ) ( HOLDING ?auto_88552 ) ( CLEAR ?auto_88551 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88550 ?auto_88551 ?auto_88552 )
      ( MAKE-4PILE ?auto_88550 ?auto_88551 ?auto_88552 ?auto_88553 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88558 - BLOCK
      ?auto_88559 - BLOCK
      ?auto_88560 - BLOCK
      ?auto_88561 - BLOCK
    )
    :vars
    (
      ?auto_88565 - BLOCK
      ?auto_88562 - BLOCK
      ?auto_88564 - BLOCK
      ?auto_88563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88558 ) ( ON ?auto_88559 ?auto_88558 ) ( not ( = ?auto_88558 ?auto_88559 ) ) ( not ( = ?auto_88558 ?auto_88560 ) ) ( not ( = ?auto_88558 ?auto_88561 ) ) ( not ( = ?auto_88558 ?auto_88565 ) ) ( not ( = ?auto_88559 ?auto_88560 ) ) ( not ( = ?auto_88559 ?auto_88561 ) ) ( not ( = ?auto_88559 ?auto_88565 ) ) ( not ( = ?auto_88560 ?auto_88561 ) ) ( not ( = ?auto_88560 ?auto_88565 ) ) ( not ( = ?auto_88561 ?auto_88565 ) ) ( not ( = ?auto_88558 ?auto_88562 ) ) ( not ( = ?auto_88558 ?auto_88564 ) ) ( not ( = ?auto_88559 ?auto_88562 ) ) ( not ( = ?auto_88559 ?auto_88564 ) ) ( not ( = ?auto_88560 ?auto_88562 ) ) ( not ( = ?auto_88560 ?auto_88564 ) ) ( not ( = ?auto_88561 ?auto_88562 ) ) ( not ( = ?auto_88561 ?auto_88564 ) ) ( not ( = ?auto_88565 ?auto_88562 ) ) ( not ( = ?auto_88565 ?auto_88564 ) ) ( not ( = ?auto_88562 ?auto_88564 ) ) ( ON ?auto_88564 ?auto_88563 ) ( not ( = ?auto_88558 ?auto_88563 ) ) ( not ( = ?auto_88559 ?auto_88563 ) ) ( not ( = ?auto_88560 ?auto_88563 ) ) ( not ( = ?auto_88561 ?auto_88563 ) ) ( not ( = ?auto_88565 ?auto_88563 ) ) ( not ( = ?auto_88562 ?auto_88563 ) ) ( not ( = ?auto_88564 ?auto_88563 ) ) ( ON ?auto_88562 ?auto_88564 ) ( ON-TABLE ?auto_88563 ) ( ON ?auto_88565 ?auto_88562 ) ( ON ?auto_88561 ?auto_88565 ) ( CLEAR ?auto_88559 ) ( ON ?auto_88560 ?auto_88561 ) ( CLEAR ?auto_88560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88563 ?auto_88564 ?auto_88562 ?auto_88565 ?auto_88561 )
      ( MAKE-4PILE ?auto_88558 ?auto_88559 ?auto_88560 ?auto_88561 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88566 - BLOCK
      ?auto_88567 - BLOCK
      ?auto_88568 - BLOCK
      ?auto_88569 - BLOCK
    )
    :vars
    (
      ?auto_88570 - BLOCK
      ?auto_88571 - BLOCK
      ?auto_88573 - BLOCK
      ?auto_88572 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88566 ) ( not ( = ?auto_88566 ?auto_88567 ) ) ( not ( = ?auto_88566 ?auto_88568 ) ) ( not ( = ?auto_88566 ?auto_88569 ) ) ( not ( = ?auto_88566 ?auto_88570 ) ) ( not ( = ?auto_88567 ?auto_88568 ) ) ( not ( = ?auto_88567 ?auto_88569 ) ) ( not ( = ?auto_88567 ?auto_88570 ) ) ( not ( = ?auto_88568 ?auto_88569 ) ) ( not ( = ?auto_88568 ?auto_88570 ) ) ( not ( = ?auto_88569 ?auto_88570 ) ) ( not ( = ?auto_88566 ?auto_88571 ) ) ( not ( = ?auto_88566 ?auto_88573 ) ) ( not ( = ?auto_88567 ?auto_88571 ) ) ( not ( = ?auto_88567 ?auto_88573 ) ) ( not ( = ?auto_88568 ?auto_88571 ) ) ( not ( = ?auto_88568 ?auto_88573 ) ) ( not ( = ?auto_88569 ?auto_88571 ) ) ( not ( = ?auto_88569 ?auto_88573 ) ) ( not ( = ?auto_88570 ?auto_88571 ) ) ( not ( = ?auto_88570 ?auto_88573 ) ) ( not ( = ?auto_88571 ?auto_88573 ) ) ( ON ?auto_88573 ?auto_88572 ) ( not ( = ?auto_88566 ?auto_88572 ) ) ( not ( = ?auto_88567 ?auto_88572 ) ) ( not ( = ?auto_88568 ?auto_88572 ) ) ( not ( = ?auto_88569 ?auto_88572 ) ) ( not ( = ?auto_88570 ?auto_88572 ) ) ( not ( = ?auto_88571 ?auto_88572 ) ) ( not ( = ?auto_88573 ?auto_88572 ) ) ( ON ?auto_88571 ?auto_88573 ) ( ON-TABLE ?auto_88572 ) ( ON ?auto_88570 ?auto_88571 ) ( ON ?auto_88569 ?auto_88570 ) ( ON ?auto_88568 ?auto_88569 ) ( CLEAR ?auto_88568 ) ( HOLDING ?auto_88567 ) ( CLEAR ?auto_88566 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88566 ?auto_88567 )
      ( MAKE-4PILE ?auto_88566 ?auto_88567 ?auto_88568 ?auto_88569 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88574 - BLOCK
      ?auto_88575 - BLOCK
      ?auto_88576 - BLOCK
      ?auto_88577 - BLOCK
    )
    :vars
    (
      ?auto_88578 - BLOCK
      ?auto_88579 - BLOCK
      ?auto_88581 - BLOCK
      ?auto_88580 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88574 ) ( not ( = ?auto_88574 ?auto_88575 ) ) ( not ( = ?auto_88574 ?auto_88576 ) ) ( not ( = ?auto_88574 ?auto_88577 ) ) ( not ( = ?auto_88574 ?auto_88578 ) ) ( not ( = ?auto_88575 ?auto_88576 ) ) ( not ( = ?auto_88575 ?auto_88577 ) ) ( not ( = ?auto_88575 ?auto_88578 ) ) ( not ( = ?auto_88576 ?auto_88577 ) ) ( not ( = ?auto_88576 ?auto_88578 ) ) ( not ( = ?auto_88577 ?auto_88578 ) ) ( not ( = ?auto_88574 ?auto_88579 ) ) ( not ( = ?auto_88574 ?auto_88581 ) ) ( not ( = ?auto_88575 ?auto_88579 ) ) ( not ( = ?auto_88575 ?auto_88581 ) ) ( not ( = ?auto_88576 ?auto_88579 ) ) ( not ( = ?auto_88576 ?auto_88581 ) ) ( not ( = ?auto_88577 ?auto_88579 ) ) ( not ( = ?auto_88577 ?auto_88581 ) ) ( not ( = ?auto_88578 ?auto_88579 ) ) ( not ( = ?auto_88578 ?auto_88581 ) ) ( not ( = ?auto_88579 ?auto_88581 ) ) ( ON ?auto_88581 ?auto_88580 ) ( not ( = ?auto_88574 ?auto_88580 ) ) ( not ( = ?auto_88575 ?auto_88580 ) ) ( not ( = ?auto_88576 ?auto_88580 ) ) ( not ( = ?auto_88577 ?auto_88580 ) ) ( not ( = ?auto_88578 ?auto_88580 ) ) ( not ( = ?auto_88579 ?auto_88580 ) ) ( not ( = ?auto_88581 ?auto_88580 ) ) ( ON ?auto_88579 ?auto_88581 ) ( ON-TABLE ?auto_88580 ) ( ON ?auto_88578 ?auto_88579 ) ( ON ?auto_88577 ?auto_88578 ) ( ON ?auto_88576 ?auto_88577 ) ( CLEAR ?auto_88574 ) ( ON ?auto_88575 ?auto_88576 ) ( CLEAR ?auto_88575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88580 ?auto_88581 ?auto_88579 ?auto_88578 ?auto_88577 ?auto_88576 )
      ( MAKE-4PILE ?auto_88574 ?auto_88575 ?auto_88576 ?auto_88577 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88582 - BLOCK
      ?auto_88583 - BLOCK
      ?auto_88584 - BLOCK
      ?auto_88585 - BLOCK
    )
    :vars
    (
      ?auto_88586 - BLOCK
      ?auto_88589 - BLOCK
      ?auto_88588 - BLOCK
      ?auto_88587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88582 ?auto_88583 ) ) ( not ( = ?auto_88582 ?auto_88584 ) ) ( not ( = ?auto_88582 ?auto_88585 ) ) ( not ( = ?auto_88582 ?auto_88586 ) ) ( not ( = ?auto_88583 ?auto_88584 ) ) ( not ( = ?auto_88583 ?auto_88585 ) ) ( not ( = ?auto_88583 ?auto_88586 ) ) ( not ( = ?auto_88584 ?auto_88585 ) ) ( not ( = ?auto_88584 ?auto_88586 ) ) ( not ( = ?auto_88585 ?auto_88586 ) ) ( not ( = ?auto_88582 ?auto_88589 ) ) ( not ( = ?auto_88582 ?auto_88588 ) ) ( not ( = ?auto_88583 ?auto_88589 ) ) ( not ( = ?auto_88583 ?auto_88588 ) ) ( not ( = ?auto_88584 ?auto_88589 ) ) ( not ( = ?auto_88584 ?auto_88588 ) ) ( not ( = ?auto_88585 ?auto_88589 ) ) ( not ( = ?auto_88585 ?auto_88588 ) ) ( not ( = ?auto_88586 ?auto_88589 ) ) ( not ( = ?auto_88586 ?auto_88588 ) ) ( not ( = ?auto_88589 ?auto_88588 ) ) ( ON ?auto_88588 ?auto_88587 ) ( not ( = ?auto_88582 ?auto_88587 ) ) ( not ( = ?auto_88583 ?auto_88587 ) ) ( not ( = ?auto_88584 ?auto_88587 ) ) ( not ( = ?auto_88585 ?auto_88587 ) ) ( not ( = ?auto_88586 ?auto_88587 ) ) ( not ( = ?auto_88589 ?auto_88587 ) ) ( not ( = ?auto_88588 ?auto_88587 ) ) ( ON ?auto_88589 ?auto_88588 ) ( ON-TABLE ?auto_88587 ) ( ON ?auto_88586 ?auto_88589 ) ( ON ?auto_88585 ?auto_88586 ) ( ON ?auto_88584 ?auto_88585 ) ( ON ?auto_88583 ?auto_88584 ) ( CLEAR ?auto_88583 ) ( HOLDING ?auto_88582 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88582 )
      ( MAKE-4PILE ?auto_88582 ?auto_88583 ?auto_88584 ?auto_88585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88590 - BLOCK
      ?auto_88591 - BLOCK
      ?auto_88592 - BLOCK
      ?auto_88593 - BLOCK
    )
    :vars
    (
      ?auto_88594 - BLOCK
      ?auto_88595 - BLOCK
      ?auto_88596 - BLOCK
      ?auto_88597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88590 ?auto_88591 ) ) ( not ( = ?auto_88590 ?auto_88592 ) ) ( not ( = ?auto_88590 ?auto_88593 ) ) ( not ( = ?auto_88590 ?auto_88594 ) ) ( not ( = ?auto_88591 ?auto_88592 ) ) ( not ( = ?auto_88591 ?auto_88593 ) ) ( not ( = ?auto_88591 ?auto_88594 ) ) ( not ( = ?auto_88592 ?auto_88593 ) ) ( not ( = ?auto_88592 ?auto_88594 ) ) ( not ( = ?auto_88593 ?auto_88594 ) ) ( not ( = ?auto_88590 ?auto_88595 ) ) ( not ( = ?auto_88590 ?auto_88596 ) ) ( not ( = ?auto_88591 ?auto_88595 ) ) ( not ( = ?auto_88591 ?auto_88596 ) ) ( not ( = ?auto_88592 ?auto_88595 ) ) ( not ( = ?auto_88592 ?auto_88596 ) ) ( not ( = ?auto_88593 ?auto_88595 ) ) ( not ( = ?auto_88593 ?auto_88596 ) ) ( not ( = ?auto_88594 ?auto_88595 ) ) ( not ( = ?auto_88594 ?auto_88596 ) ) ( not ( = ?auto_88595 ?auto_88596 ) ) ( ON ?auto_88596 ?auto_88597 ) ( not ( = ?auto_88590 ?auto_88597 ) ) ( not ( = ?auto_88591 ?auto_88597 ) ) ( not ( = ?auto_88592 ?auto_88597 ) ) ( not ( = ?auto_88593 ?auto_88597 ) ) ( not ( = ?auto_88594 ?auto_88597 ) ) ( not ( = ?auto_88595 ?auto_88597 ) ) ( not ( = ?auto_88596 ?auto_88597 ) ) ( ON ?auto_88595 ?auto_88596 ) ( ON-TABLE ?auto_88597 ) ( ON ?auto_88594 ?auto_88595 ) ( ON ?auto_88593 ?auto_88594 ) ( ON ?auto_88592 ?auto_88593 ) ( ON ?auto_88591 ?auto_88592 ) ( ON ?auto_88590 ?auto_88591 ) ( CLEAR ?auto_88590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88597 ?auto_88596 ?auto_88595 ?auto_88594 ?auto_88593 ?auto_88592 ?auto_88591 )
      ( MAKE-4PILE ?auto_88590 ?auto_88591 ?auto_88592 ?auto_88593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88601 - BLOCK
      ?auto_88602 - BLOCK
      ?auto_88603 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_88603 ) ( CLEAR ?auto_88602 ) ( ON-TABLE ?auto_88601 ) ( ON ?auto_88602 ?auto_88601 ) ( not ( = ?auto_88601 ?auto_88602 ) ) ( not ( = ?auto_88601 ?auto_88603 ) ) ( not ( = ?auto_88602 ?auto_88603 ) ) )
    :subtasks
    ( ( !STACK ?auto_88603 ?auto_88602 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88604 - BLOCK
      ?auto_88605 - BLOCK
      ?auto_88606 - BLOCK
    )
    :vars
    (
      ?auto_88607 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_88605 ) ( ON-TABLE ?auto_88604 ) ( ON ?auto_88605 ?auto_88604 ) ( not ( = ?auto_88604 ?auto_88605 ) ) ( not ( = ?auto_88604 ?auto_88606 ) ) ( not ( = ?auto_88605 ?auto_88606 ) ) ( ON ?auto_88606 ?auto_88607 ) ( CLEAR ?auto_88606 ) ( HAND-EMPTY ) ( not ( = ?auto_88604 ?auto_88607 ) ) ( not ( = ?auto_88605 ?auto_88607 ) ) ( not ( = ?auto_88606 ?auto_88607 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88606 ?auto_88607 )
      ( MAKE-3PILE ?auto_88604 ?auto_88605 ?auto_88606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88608 - BLOCK
      ?auto_88609 - BLOCK
      ?auto_88610 - BLOCK
    )
    :vars
    (
      ?auto_88611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88608 ) ( not ( = ?auto_88608 ?auto_88609 ) ) ( not ( = ?auto_88608 ?auto_88610 ) ) ( not ( = ?auto_88609 ?auto_88610 ) ) ( ON ?auto_88610 ?auto_88611 ) ( CLEAR ?auto_88610 ) ( not ( = ?auto_88608 ?auto_88611 ) ) ( not ( = ?auto_88609 ?auto_88611 ) ) ( not ( = ?auto_88610 ?auto_88611 ) ) ( HOLDING ?auto_88609 ) ( CLEAR ?auto_88608 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88608 ?auto_88609 )
      ( MAKE-3PILE ?auto_88608 ?auto_88609 ?auto_88610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88612 - BLOCK
      ?auto_88613 - BLOCK
      ?auto_88614 - BLOCK
    )
    :vars
    (
      ?auto_88615 - BLOCK
      ?auto_88617 - BLOCK
      ?auto_88616 - BLOCK
      ?auto_88618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88612 ) ( not ( = ?auto_88612 ?auto_88613 ) ) ( not ( = ?auto_88612 ?auto_88614 ) ) ( not ( = ?auto_88613 ?auto_88614 ) ) ( ON ?auto_88614 ?auto_88615 ) ( not ( = ?auto_88612 ?auto_88615 ) ) ( not ( = ?auto_88613 ?auto_88615 ) ) ( not ( = ?auto_88614 ?auto_88615 ) ) ( CLEAR ?auto_88612 ) ( ON ?auto_88613 ?auto_88614 ) ( CLEAR ?auto_88613 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88617 ) ( ON ?auto_88616 ?auto_88617 ) ( ON ?auto_88618 ?auto_88616 ) ( ON ?auto_88615 ?auto_88618 ) ( not ( = ?auto_88617 ?auto_88616 ) ) ( not ( = ?auto_88617 ?auto_88618 ) ) ( not ( = ?auto_88617 ?auto_88615 ) ) ( not ( = ?auto_88617 ?auto_88614 ) ) ( not ( = ?auto_88617 ?auto_88613 ) ) ( not ( = ?auto_88616 ?auto_88618 ) ) ( not ( = ?auto_88616 ?auto_88615 ) ) ( not ( = ?auto_88616 ?auto_88614 ) ) ( not ( = ?auto_88616 ?auto_88613 ) ) ( not ( = ?auto_88618 ?auto_88615 ) ) ( not ( = ?auto_88618 ?auto_88614 ) ) ( not ( = ?auto_88618 ?auto_88613 ) ) ( not ( = ?auto_88612 ?auto_88617 ) ) ( not ( = ?auto_88612 ?auto_88616 ) ) ( not ( = ?auto_88612 ?auto_88618 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88617 ?auto_88616 ?auto_88618 ?auto_88615 ?auto_88614 )
      ( MAKE-3PILE ?auto_88612 ?auto_88613 ?auto_88614 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88619 - BLOCK
      ?auto_88620 - BLOCK
      ?auto_88621 - BLOCK
    )
    :vars
    (
      ?auto_88622 - BLOCK
      ?auto_88625 - BLOCK
      ?auto_88624 - BLOCK
      ?auto_88623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88619 ?auto_88620 ) ) ( not ( = ?auto_88619 ?auto_88621 ) ) ( not ( = ?auto_88620 ?auto_88621 ) ) ( ON ?auto_88621 ?auto_88622 ) ( not ( = ?auto_88619 ?auto_88622 ) ) ( not ( = ?auto_88620 ?auto_88622 ) ) ( not ( = ?auto_88621 ?auto_88622 ) ) ( ON ?auto_88620 ?auto_88621 ) ( CLEAR ?auto_88620 ) ( ON-TABLE ?auto_88625 ) ( ON ?auto_88624 ?auto_88625 ) ( ON ?auto_88623 ?auto_88624 ) ( ON ?auto_88622 ?auto_88623 ) ( not ( = ?auto_88625 ?auto_88624 ) ) ( not ( = ?auto_88625 ?auto_88623 ) ) ( not ( = ?auto_88625 ?auto_88622 ) ) ( not ( = ?auto_88625 ?auto_88621 ) ) ( not ( = ?auto_88625 ?auto_88620 ) ) ( not ( = ?auto_88624 ?auto_88623 ) ) ( not ( = ?auto_88624 ?auto_88622 ) ) ( not ( = ?auto_88624 ?auto_88621 ) ) ( not ( = ?auto_88624 ?auto_88620 ) ) ( not ( = ?auto_88623 ?auto_88622 ) ) ( not ( = ?auto_88623 ?auto_88621 ) ) ( not ( = ?auto_88623 ?auto_88620 ) ) ( not ( = ?auto_88619 ?auto_88625 ) ) ( not ( = ?auto_88619 ?auto_88624 ) ) ( not ( = ?auto_88619 ?auto_88623 ) ) ( HOLDING ?auto_88619 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88619 )
      ( MAKE-3PILE ?auto_88619 ?auto_88620 ?auto_88621 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88626 - BLOCK
      ?auto_88627 - BLOCK
      ?auto_88628 - BLOCK
    )
    :vars
    (
      ?auto_88632 - BLOCK
      ?auto_88630 - BLOCK
      ?auto_88629 - BLOCK
      ?auto_88631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88626 ?auto_88627 ) ) ( not ( = ?auto_88626 ?auto_88628 ) ) ( not ( = ?auto_88627 ?auto_88628 ) ) ( ON ?auto_88628 ?auto_88632 ) ( not ( = ?auto_88626 ?auto_88632 ) ) ( not ( = ?auto_88627 ?auto_88632 ) ) ( not ( = ?auto_88628 ?auto_88632 ) ) ( ON ?auto_88627 ?auto_88628 ) ( ON-TABLE ?auto_88630 ) ( ON ?auto_88629 ?auto_88630 ) ( ON ?auto_88631 ?auto_88629 ) ( ON ?auto_88632 ?auto_88631 ) ( not ( = ?auto_88630 ?auto_88629 ) ) ( not ( = ?auto_88630 ?auto_88631 ) ) ( not ( = ?auto_88630 ?auto_88632 ) ) ( not ( = ?auto_88630 ?auto_88628 ) ) ( not ( = ?auto_88630 ?auto_88627 ) ) ( not ( = ?auto_88629 ?auto_88631 ) ) ( not ( = ?auto_88629 ?auto_88632 ) ) ( not ( = ?auto_88629 ?auto_88628 ) ) ( not ( = ?auto_88629 ?auto_88627 ) ) ( not ( = ?auto_88631 ?auto_88632 ) ) ( not ( = ?auto_88631 ?auto_88628 ) ) ( not ( = ?auto_88631 ?auto_88627 ) ) ( not ( = ?auto_88626 ?auto_88630 ) ) ( not ( = ?auto_88626 ?auto_88629 ) ) ( not ( = ?auto_88626 ?auto_88631 ) ) ( ON ?auto_88626 ?auto_88627 ) ( CLEAR ?auto_88626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88630 ?auto_88629 ?auto_88631 ?auto_88632 ?auto_88628 ?auto_88627 )
      ( MAKE-3PILE ?auto_88626 ?auto_88627 ?auto_88628 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88633 - BLOCK
      ?auto_88634 - BLOCK
      ?auto_88635 - BLOCK
    )
    :vars
    (
      ?auto_88638 - BLOCK
      ?auto_88637 - BLOCK
      ?auto_88636 - BLOCK
      ?auto_88639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88633 ?auto_88634 ) ) ( not ( = ?auto_88633 ?auto_88635 ) ) ( not ( = ?auto_88634 ?auto_88635 ) ) ( ON ?auto_88635 ?auto_88638 ) ( not ( = ?auto_88633 ?auto_88638 ) ) ( not ( = ?auto_88634 ?auto_88638 ) ) ( not ( = ?auto_88635 ?auto_88638 ) ) ( ON ?auto_88634 ?auto_88635 ) ( ON-TABLE ?auto_88637 ) ( ON ?auto_88636 ?auto_88637 ) ( ON ?auto_88639 ?auto_88636 ) ( ON ?auto_88638 ?auto_88639 ) ( not ( = ?auto_88637 ?auto_88636 ) ) ( not ( = ?auto_88637 ?auto_88639 ) ) ( not ( = ?auto_88637 ?auto_88638 ) ) ( not ( = ?auto_88637 ?auto_88635 ) ) ( not ( = ?auto_88637 ?auto_88634 ) ) ( not ( = ?auto_88636 ?auto_88639 ) ) ( not ( = ?auto_88636 ?auto_88638 ) ) ( not ( = ?auto_88636 ?auto_88635 ) ) ( not ( = ?auto_88636 ?auto_88634 ) ) ( not ( = ?auto_88639 ?auto_88638 ) ) ( not ( = ?auto_88639 ?auto_88635 ) ) ( not ( = ?auto_88639 ?auto_88634 ) ) ( not ( = ?auto_88633 ?auto_88637 ) ) ( not ( = ?auto_88633 ?auto_88636 ) ) ( not ( = ?auto_88633 ?auto_88639 ) ) ( HOLDING ?auto_88633 ) ( CLEAR ?auto_88634 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88637 ?auto_88636 ?auto_88639 ?auto_88638 ?auto_88635 ?auto_88634 ?auto_88633 )
      ( MAKE-3PILE ?auto_88633 ?auto_88634 ?auto_88635 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88640 - BLOCK
      ?auto_88641 - BLOCK
      ?auto_88642 - BLOCK
    )
    :vars
    (
      ?auto_88643 - BLOCK
      ?auto_88645 - BLOCK
      ?auto_88644 - BLOCK
      ?auto_88646 - BLOCK
      ?auto_88647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88640 ?auto_88641 ) ) ( not ( = ?auto_88640 ?auto_88642 ) ) ( not ( = ?auto_88641 ?auto_88642 ) ) ( ON ?auto_88642 ?auto_88643 ) ( not ( = ?auto_88640 ?auto_88643 ) ) ( not ( = ?auto_88641 ?auto_88643 ) ) ( not ( = ?auto_88642 ?auto_88643 ) ) ( ON ?auto_88641 ?auto_88642 ) ( ON-TABLE ?auto_88645 ) ( ON ?auto_88644 ?auto_88645 ) ( ON ?auto_88646 ?auto_88644 ) ( ON ?auto_88643 ?auto_88646 ) ( not ( = ?auto_88645 ?auto_88644 ) ) ( not ( = ?auto_88645 ?auto_88646 ) ) ( not ( = ?auto_88645 ?auto_88643 ) ) ( not ( = ?auto_88645 ?auto_88642 ) ) ( not ( = ?auto_88645 ?auto_88641 ) ) ( not ( = ?auto_88644 ?auto_88646 ) ) ( not ( = ?auto_88644 ?auto_88643 ) ) ( not ( = ?auto_88644 ?auto_88642 ) ) ( not ( = ?auto_88644 ?auto_88641 ) ) ( not ( = ?auto_88646 ?auto_88643 ) ) ( not ( = ?auto_88646 ?auto_88642 ) ) ( not ( = ?auto_88646 ?auto_88641 ) ) ( not ( = ?auto_88640 ?auto_88645 ) ) ( not ( = ?auto_88640 ?auto_88644 ) ) ( not ( = ?auto_88640 ?auto_88646 ) ) ( CLEAR ?auto_88641 ) ( ON ?auto_88640 ?auto_88647 ) ( CLEAR ?auto_88640 ) ( HAND-EMPTY ) ( not ( = ?auto_88640 ?auto_88647 ) ) ( not ( = ?auto_88641 ?auto_88647 ) ) ( not ( = ?auto_88642 ?auto_88647 ) ) ( not ( = ?auto_88643 ?auto_88647 ) ) ( not ( = ?auto_88645 ?auto_88647 ) ) ( not ( = ?auto_88644 ?auto_88647 ) ) ( not ( = ?auto_88646 ?auto_88647 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88640 ?auto_88647 )
      ( MAKE-3PILE ?auto_88640 ?auto_88641 ?auto_88642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88648 - BLOCK
      ?auto_88649 - BLOCK
      ?auto_88650 - BLOCK
    )
    :vars
    (
      ?auto_88654 - BLOCK
      ?auto_88653 - BLOCK
      ?auto_88652 - BLOCK
      ?auto_88651 - BLOCK
      ?auto_88655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88648 ?auto_88649 ) ) ( not ( = ?auto_88648 ?auto_88650 ) ) ( not ( = ?auto_88649 ?auto_88650 ) ) ( ON ?auto_88650 ?auto_88654 ) ( not ( = ?auto_88648 ?auto_88654 ) ) ( not ( = ?auto_88649 ?auto_88654 ) ) ( not ( = ?auto_88650 ?auto_88654 ) ) ( ON-TABLE ?auto_88653 ) ( ON ?auto_88652 ?auto_88653 ) ( ON ?auto_88651 ?auto_88652 ) ( ON ?auto_88654 ?auto_88651 ) ( not ( = ?auto_88653 ?auto_88652 ) ) ( not ( = ?auto_88653 ?auto_88651 ) ) ( not ( = ?auto_88653 ?auto_88654 ) ) ( not ( = ?auto_88653 ?auto_88650 ) ) ( not ( = ?auto_88653 ?auto_88649 ) ) ( not ( = ?auto_88652 ?auto_88651 ) ) ( not ( = ?auto_88652 ?auto_88654 ) ) ( not ( = ?auto_88652 ?auto_88650 ) ) ( not ( = ?auto_88652 ?auto_88649 ) ) ( not ( = ?auto_88651 ?auto_88654 ) ) ( not ( = ?auto_88651 ?auto_88650 ) ) ( not ( = ?auto_88651 ?auto_88649 ) ) ( not ( = ?auto_88648 ?auto_88653 ) ) ( not ( = ?auto_88648 ?auto_88652 ) ) ( not ( = ?auto_88648 ?auto_88651 ) ) ( ON ?auto_88648 ?auto_88655 ) ( CLEAR ?auto_88648 ) ( not ( = ?auto_88648 ?auto_88655 ) ) ( not ( = ?auto_88649 ?auto_88655 ) ) ( not ( = ?auto_88650 ?auto_88655 ) ) ( not ( = ?auto_88654 ?auto_88655 ) ) ( not ( = ?auto_88653 ?auto_88655 ) ) ( not ( = ?auto_88652 ?auto_88655 ) ) ( not ( = ?auto_88651 ?auto_88655 ) ) ( HOLDING ?auto_88649 ) ( CLEAR ?auto_88650 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88653 ?auto_88652 ?auto_88651 ?auto_88654 ?auto_88650 ?auto_88649 )
      ( MAKE-3PILE ?auto_88648 ?auto_88649 ?auto_88650 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88656 - BLOCK
      ?auto_88657 - BLOCK
      ?auto_88658 - BLOCK
    )
    :vars
    (
      ?auto_88660 - BLOCK
      ?auto_88661 - BLOCK
      ?auto_88662 - BLOCK
      ?auto_88663 - BLOCK
      ?auto_88659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88656 ?auto_88657 ) ) ( not ( = ?auto_88656 ?auto_88658 ) ) ( not ( = ?auto_88657 ?auto_88658 ) ) ( ON ?auto_88658 ?auto_88660 ) ( not ( = ?auto_88656 ?auto_88660 ) ) ( not ( = ?auto_88657 ?auto_88660 ) ) ( not ( = ?auto_88658 ?auto_88660 ) ) ( ON-TABLE ?auto_88661 ) ( ON ?auto_88662 ?auto_88661 ) ( ON ?auto_88663 ?auto_88662 ) ( ON ?auto_88660 ?auto_88663 ) ( not ( = ?auto_88661 ?auto_88662 ) ) ( not ( = ?auto_88661 ?auto_88663 ) ) ( not ( = ?auto_88661 ?auto_88660 ) ) ( not ( = ?auto_88661 ?auto_88658 ) ) ( not ( = ?auto_88661 ?auto_88657 ) ) ( not ( = ?auto_88662 ?auto_88663 ) ) ( not ( = ?auto_88662 ?auto_88660 ) ) ( not ( = ?auto_88662 ?auto_88658 ) ) ( not ( = ?auto_88662 ?auto_88657 ) ) ( not ( = ?auto_88663 ?auto_88660 ) ) ( not ( = ?auto_88663 ?auto_88658 ) ) ( not ( = ?auto_88663 ?auto_88657 ) ) ( not ( = ?auto_88656 ?auto_88661 ) ) ( not ( = ?auto_88656 ?auto_88662 ) ) ( not ( = ?auto_88656 ?auto_88663 ) ) ( ON ?auto_88656 ?auto_88659 ) ( not ( = ?auto_88656 ?auto_88659 ) ) ( not ( = ?auto_88657 ?auto_88659 ) ) ( not ( = ?auto_88658 ?auto_88659 ) ) ( not ( = ?auto_88660 ?auto_88659 ) ) ( not ( = ?auto_88661 ?auto_88659 ) ) ( not ( = ?auto_88662 ?auto_88659 ) ) ( not ( = ?auto_88663 ?auto_88659 ) ) ( CLEAR ?auto_88658 ) ( ON ?auto_88657 ?auto_88656 ) ( CLEAR ?auto_88657 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88659 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88659 ?auto_88656 )
      ( MAKE-3PILE ?auto_88656 ?auto_88657 ?auto_88658 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88664 - BLOCK
      ?auto_88665 - BLOCK
      ?auto_88666 - BLOCK
    )
    :vars
    (
      ?auto_88669 - BLOCK
      ?auto_88670 - BLOCK
      ?auto_88671 - BLOCK
      ?auto_88667 - BLOCK
      ?auto_88668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88664 ?auto_88665 ) ) ( not ( = ?auto_88664 ?auto_88666 ) ) ( not ( = ?auto_88665 ?auto_88666 ) ) ( not ( = ?auto_88664 ?auto_88669 ) ) ( not ( = ?auto_88665 ?auto_88669 ) ) ( not ( = ?auto_88666 ?auto_88669 ) ) ( ON-TABLE ?auto_88670 ) ( ON ?auto_88671 ?auto_88670 ) ( ON ?auto_88667 ?auto_88671 ) ( ON ?auto_88669 ?auto_88667 ) ( not ( = ?auto_88670 ?auto_88671 ) ) ( not ( = ?auto_88670 ?auto_88667 ) ) ( not ( = ?auto_88670 ?auto_88669 ) ) ( not ( = ?auto_88670 ?auto_88666 ) ) ( not ( = ?auto_88670 ?auto_88665 ) ) ( not ( = ?auto_88671 ?auto_88667 ) ) ( not ( = ?auto_88671 ?auto_88669 ) ) ( not ( = ?auto_88671 ?auto_88666 ) ) ( not ( = ?auto_88671 ?auto_88665 ) ) ( not ( = ?auto_88667 ?auto_88669 ) ) ( not ( = ?auto_88667 ?auto_88666 ) ) ( not ( = ?auto_88667 ?auto_88665 ) ) ( not ( = ?auto_88664 ?auto_88670 ) ) ( not ( = ?auto_88664 ?auto_88671 ) ) ( not ( = ?auto_88664 ?auto_88667 ) ) ( ON ?auto_88664 ?auto_88668 ) ( not ( = ?auto_88664 ?auto_88668 ) ) ( not ( = ?auto_88665 ?auto_88668 ) ) ( not ( = ?auto_88666 ?auto_88668 ) ) ( not ( = ?auto_88669 ?auto_88668 ) ) ( not ( = ?auto_88670 ?auto_88668 ) ) ( not ( = ?auto_88671 ?auto_88668 ) ) ( not ( = ?auto_88667 ?auto_88668 ) ) ( ON ?auto_88665 ?auto_88664 ) ( CLEAR ?auto_88665 ) ( ON-TABLE ?auto_88668 ) ( HOLDING ?auto_88666 ) ( CLEAR ?auto_88669 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88670 ?auto_88671 ?auto_88667 ?auto_88669 ?auto_88666 )
      ( MAKE-3PILE ?auto_88664 ?auto_88665 ?auto_88666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88672 - BLOCK
      ?auto_88673 - BLOCK
      ?auto_88674 - BLOCK
    )
    :vars
    (
      ?auto_88678 - BLOCK
      ?auto_88675 - BLOCK
      ?auto_88676 - BLOCK
      ?auto_88679 - BLOCK
      ?auto_88677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88672 ?auto_88673 ) ) ( not ( = ?auto_88672 ?auto_88674 ) ) ( not ( = ?auto_88673 ?auto_88674 ) ) ( not ( = ?auto_88672 ?auto_88678 ) ) ( not ( = ?auto_88673 ?auto_88678 ) ) ( not ( = ?auto_88674 ?auto_88678 ) ) ( ON-TABLE ?auto_88675 ) ( ON ?auto_88676 ?auto_88675 ) ( ON ?auto_88679 ?auto_88676 ) ( ON ?auto_88678 ?auto_88679 ) ( not ( = ?auto_88675 ?auto_88676 ) ) ( not ( = ?auto_88675 ?auto_88679 ) ) ( not ( = ?auto_88675 ?auto_88678 ) ) ( not ( = ?auto_88675 ?auto_88674 ) ) ( not ( = ?auto_88675 ?auto_88673 ) ) ( not ( = ?auto_88676 ?auto_88679 ) ) ( not ( = ?auto_88676 ?auto_88678 ) ) ( not ( = ?auto_88676 ?auto_88674 ) ) ( not ( = ?auto_88676 ?auto_88673 ) ) ( not ( = ?auto_88679 ?auto_88678 ) ) ( not ( = ?auto_88679 ?auto_88674 ) ) ( not ( = ?auto_88679 ?auto_88673 ) ) ( not ( = ?auto_88672 ?auto_88675 ) ) ( not ( = ?auto_88672 ?auto_88676 ) ) ( not ( = ?auto_88672 ?auto_88679 ) ) ( ON ?auto_88672 ?auto_88677 ) ( not ( = ?auto_88672 ?auto_88677 ) ) ( not ( = ?auto_88673 ?auto_88677 ) ) ( not ( = ?auto_88674 ?auto_88677 ) ) ( not ( = ?auto_88678 ?auto_88677 ) ) ( not ( = ?auto_88675 ?auto_88677 ) ) ( not ( = ?auto_88676 ?auto_88677 ) ) ( not ( = ?auto_88679 ?auto_88677 ) ) ( ON ?auto_88673 ?auto_88672 ) ( ON-TABLE ?auto_88677 ) ( CLEAR ?auto_88678 ) ( ON ?auto_88674 ?auto_88673 ) ( CLEAR ?auto_88674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88677 ?auto_88672 ?auto_88673 )
      ( MAKE-3PILE ?auto_88672 ?auto_88673 ?auto_88674 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88680 - BLOCK
      ?auto_88681 - BLOCK
      ?auto_88682 - BLOCK
    )
    :vars
    (
      ?auto_88686 - BLOCK
      ?auto_88684 - BLOCK
      ?auto_88687 - BLOCK
      ?auto_88683 - BLOCK
      ?auto_88685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88680 ?auto_88681 ) ) ( not ( = ?auto_88680 ?auto_88682 ) ) ( not ( = ?auto_88681 ?auto_88682 ) ) ( not ( = ?auto_88680 ?auto_88686 ) ) ( not ( = ?auto_88681 ?auto_88686 ) ) ( not ( = ?auto_88682 ?auto_88686 ) ) ( ON-TABLE ?auto_88684 ) ( ON ?auto_88687 ?auto_88684 ) ( ON ?auto_88683 ?auto_88687 ) ( not ( = ?auto_88684 ?auto_88687 ) ) ( not ( = ?auto_88684 ?auto_88683 ) ) ( not ( = ?auto_88684 ?auto_88686 ) ) ( not ( = ?auto_88684 ?auto_88682 ) ) ( not ( = ?auto_88684 ?auto_88681 ) ) ( not ( = ?auto_88687 ?auto_88683 ) ) ( not ( = ?auto_88687 ?auto_88686 ) ) ( not ( = ?auto_88687 ?auto_88682 ) ) ( not ( = ?auto_88687 ?auto_88681 ) ) ( not ( = ?auto_88683 ?auto_88686 ) ) ( not ( = ?auto_88683 ?auto_88682 ) ) ( not ( = ?auto_88683 ?auto_88681 ) ) ( not ( = ?auto_88680 ?auto_88684 ) ) ( not ( = ?auto_88680 ?auto_88687 ) ) ( not ( = ?auto_88680 ?auto_88683 ) ) ( ON ?auto_88680 ?auto_88685 ) ( not ( = ?auto_88680 ?auto_88685 ) ) ( not ( = ?auto_88681 ?auto_88685 ) ) ( not ( = ?auto_88682 ?auto_88685 ) ) ( not ( = ?auto_88686 ?auto_88685 ) ) ( not ( = ?auto_88684 ?auto_88685 ) ) ( not ( = ?auto_88687 ?auto_88685 ) ) ( not ( = ?auto_88683 ?auto_88685 ) ) ( ON ?auto_88681 ?auto_88680 ) ( ON-TABLE ?auto_88685 ) ( ON ?auto_88682 ?auto_88681 ) ( CLEAR ?auto_88682 ) ( HOLDING ?auto_88686 ) ( CLEAR ?auto_88683 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88684 ?auto_88687 ?auto_88683 ?auto_88686 )
      ( MAKE-3PILE ?auto_88680 ?auto_88681 ?auto_88682 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88688 - BLOCK
      ?auto_88689 - BLOCK
      ?auto_88690 - BLOCK
    )
    :vars
    (
      ?auto_88693 - BLOCK
      ?auto_88692 - BLOCK
      ?auto_88691 - BLOCK
      ?auto_88694 - BLOCK
      ?auto_88695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88688 ?auto_88689 ) ) ( not ( = ?auto_88688 ?auto_88690 ) ) ( not ( = ?auto_88689 ?auto_88690 ) ) ( not ( = ?auto_88688 ?auto_88693 ) ) ( not ( = ?auto_88689 ?auto_88693 ) ) ( not ( = ?auto_88690 ?auto_88693 ) ) ( ON-TABLE ?auto_88692 ) ( ON ?auto_88691 ?auto_88692 ) ( ON ?auto_88694 ?auto_88691 ) ( not ( = ?auto_88692 ?auto_88691 ) ) ( not ( = ?auto_88692 ?auto_88694 ) ) ( not ( = ?auto_88692 ?auto_88693 ) ) ( not ( = ?auto_88692 ?auto_88690 ) ) ( not ( = ?auto_88692 ?auto_88689 ) ) ( not ( = ?auto_88691 ?auto_88694 ) ) ( not ( = ?auto_88691 ?auto_88693 ) ) ( not ( = ?auto_88691 ?auto_88690 ) ) ( not ( = ?auto_88691 ?auto_88689 ) ) ( not ( = ?auto_88694 ?auto_88693 ) ) ( not ( = ?auto_88694 ?auto_88690 ) ) ( not ( = ?auto_88694 ?auto_88689 ) ) ( not ( = ?auto_88688 ?auto_88692 ) ) ( not ( = ?auto_88688 ?auto_88691 ) ) ( not ( = ?auto_88688 ?auto_88694 ) ) ( ON ?auto_88688 ?auto_88695 ) ( not ( = ?auto_88688 ?auto_88695 ) ) ( not ( = ?auto_88689 ?auto_88695 ) ) ( not ( = ?auto_88690 ?auto_88695 ) ) ( not ( = ?auto_88693 ?auto_88695 ) ) ( not ( = ?auto_88692 ?auto_88695 ) ) ( not ( = ?auto_88691 ?auto_88695 ) ) ( not ( = ?auto_88694 ?auto_88695 ) ) ( ON ?auto_88689 ?auto_88688 ) ( ON-TABLE ?auto_88695 ) ( ON ?auto_88690 ?auto_88689 ) ( CLEAR ?auto_88694 ) ( ON ?auto_88693 ?auto_88690 ) ( CLEAR ?auto_88693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88695 ?auto_88688 ?auto_88689 ?auto_88690 )
      ( MAKE-3PILE ?auto_88688 ?auto_88689 ?auto_88690 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88696 - BLOCK
      ?auto_88697 - BLOCK
      ?auto_88698 - BLOCK
    )
    :vars
    (
      ?auto_88701 - BLOCK
      ?auto_88699 - BLOCK
      ?auto_88703 - BLOCK
      ?auto_88700 - BLOCK
      ?auto_88702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88696 ?auto_88697 ) ) ( not ( = ?auto_88696 ?auto_88698 ) ) ( not ( = ?auto_88697 ?auto_88698 ) ) ( not ( = ?auto_88696 ?auto_88701 ) ) ( not ( = ?auto_88697 ?auto_88701 ) ) ( not ( = ?auto_88698 ?auto_88701 ) ) ( ON-TABLE ?auto_88699 ) ( ON ?auto_88703 ?auto_88699 ) ( not ( = ?auto_88699 ?auto_88703 ) ) ( not ( = ?auto_88699 ?auto_88700 ) ) ( not ( = ?auto_88699 ?auto_88701 ) ) ( not ( = ?auto_88699 ?auto_88698 ) ) ( not ( = ?auto_88699 ?auto_88697 ) ) ( not ( = ?auto_88703 ?auto_88700 ) ) ( not ( = ?auto_88703 ?auto_88701 ) ) ( not ( = ?auto_88703 ?auto_88698 ) ) ( not ( = ?auto_88703 ?auto_88697 ) ) ( not ( = ?auto_88700 ?auto_88701 ) ) ( not ( = ?auto_88700 ?auto_88698 ) ) ( not ( = ?auto_88700 ?auto_88697 ) ) ( not ( = ?auto_88696 ?auto_88699 ) ) ( not ( = ?auto_88696 ?auto_88703 ) ) ( not ( = ?auto_88696 ?auto_88700 ) ) ( ON ?auto_88696 ?auto_88702 ) ( not ( = ?auto_88696 ?auto_88702 ) ) ( not ( = ?auto_88697 ?auto_88702 ) ) ( not ( = ?auto_88698 ?auto_88702 ) ) ( not ( = ?auto_88701 ?auto_88702 ) ) ( not ( = ?auto_88699 ?auto_88702 ) ) ( not ( = ?auto_88703 ?auto_88702 ) ) ( not ( = ?auto_88700 ?auto_88702 ) ) ( ON ?auto_88697 ?auto_88696 ) ( ON-TABLE ?auto_88702 ) ( ON ?auto_88698 ?auto_88697 ) ( ON ?auto_88701 ?auto_88698 ) ( CLEAR ?auto_88701 ) ( HOLDING ?auto_88700 ) ( CLEAR ?auto_88703 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88699 ?auto_88703 ?auto_88700 )
      ( MAKE-3PILE ?auto_88696 ?auto_88697 ?auto_88698 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88704 - BLOCK
      ?auto_88705 - BLOCK
      ?auto_88706 - BLOCK
    )
    :vars
    (
      ?auto_88707 - BLOCK
      ?auto_88711 - BLOCK
      ?auto_88708 - BLOCK
      ?auto_88710 - BLOCK
      ?auto_88709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88704 ?auto_88705 ) ) ( not ( = ?auto_88704 ?auto_88706 ) ) ( not ( = ?auto_88705 ?auto_88706 ) ) ( not ( = ?auto_88704 ?auto_88707 ) ) ( not ( = ?auto_88705 ?auto_88707 ) ) ( not ( = ?auto_88706 ?auto_88707 ) ) ( ON-TABLE ?auto_88711 ) ( ON ?auto_88708 ?auto_88711 ) ( not ( = ?auto_88711 ?auto_88708 ) ) ( not ( = ?auto_88711 ?auto_88710 ) ) ( not ( = ?auto_88711 ?auto_88707 ) ) ( not ( = ?auto_88711 ?auto_88706 ) ) ( not ( = ?auto_88711 ?auto_88705 ) ) ( not ( = ?auto_88708 ?auto_88710 ) ) ( not ( = ?auto_88708 ?auto_88707 ) ) ( not ( = ?auto_88708 ?auto_88706 ) ) ( not ( = ?auto_88708 ?auto_88705 ) ) ( not ( = ?auto_88710 ?auto_88707 ) ) ( not ( = ?auto_88710 ?auto_88706 ) ) ( not ( = ?auto_88710 ?auto_88705 ) ) ( not ( = ?auto_88704 ?auto_88711 ) ) ( not ( = ?auto_88704 ?auto_88708 ) ) ( not ( = ?auto_88704 ?auto_88710 ) ) ( ON ?auto_88704 ?auto_88709 ) ( not ( = ?auto_88704 ?auto_88709 ) ) ( not ( = ?auto_88705 ?auto_88709 ) ) ( not ( = ?auto_88706 ?auto_88709 ) ) ( not ( = ?auto_88707 ?auto_88709 ) ) ( not ( = ?auto_88711 ?auto_88709 ) ) ( not ( = ?auto_88708 ?auto_88709 ) ) ( not ( = ?auto_88710 ?auto_88709 ) ) ( ON ?auto_88705 ?auto_88704 ) ( ON-TABLE ?auto_88709 ) ( ON ?auto_88706 ?auto_88705 ) ( ON ?auto_88707 ?auto_88706 ) ( CLEAR ?auto_88708 ) ( ON ?auto_88710 ?auto_88707 ) ( CLEAR ?auto_88710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88709 ?auto_88704 ?auto_88705 ?auto_88706 ?auto_88707 )
      ( MAKE-3PILE ?auto_88704 ?auto_88705 ?auto_88706 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88712 - BLOCK
      ?auto_88713 - BLOCK
      ?auto_88714 - BLOCK
    )
    :vars
    (
      ?auto_88715 - BLOCK
      ?auto_88719 - BLOCK
      ?auto_88717 - BLOCK
      ?auto_88718 - BLOCK
      ?auto_88716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88712 ?auto_88713 ) ) ( not ( = ?auto_88712 ?auto_88714 ) ) ( not ( = ?auto_88713 ?auto_88714 ) ) ( not ( = ?auto_88712 ?auto_88715 ) ) ( not ( = ?auto_88713 ?auto_88715 ) ) ( not ( = ?auto_88714 ?auto_88715 ) ) ( ON-TABLE ?auto_88719 ) ( not ( = ?auto_88719 ?auto_88717 ) ) ( not ( = ?auto_88719 ?auto_88718 ) ) ( not ( = ?auto_88719 ?auto_88715 ) ) ( not ( = ?auto_88719 ?auto_88714 ) ) ( not ( = ?auto_88719 ?auto_88713 ) ) ( not ( = ?auto_88717 ?auto_88718 ) ) ( not ( = ?auto_88717 ?auto_88715 ) ) ( not ( = ?auto_88717 ?auto_88714 ) ) ( not ( = ?auto_88717 ?auto_88713 ) ) ( not ( = ?auto_88718 ?auto_88715 ) ) ( not ( = ?auto_88718 ?auto_88714 ) ) ( not ( = ?auto_88718 ?auto_88713 ) ) ( not ( = ?auto_88712 ?auto_88719 ) ) ( not ( = ?auto_88712 ?auto_88717 ) ) ( not ( = ?auto_88712 ?auto_88718 ) ) ( ON ?auto_88712 ?auto_88716 ) ( not ( = ?auto_88712 ?auto_88716 ) ) ( not ( = ?auto_88713 ?auto_88716 ) ) ( not ( = ?auto_88714 ?auto_88716 ) ) ( not ( = ?auto_88715 ?auto_88716 ) ) ( not ( = ?auto_88719 ?auto_88716 ) ) ( not ( = ?auto_88717 ?auto_88716 ) ) ( not ( = ?auto_88718 ?auto_88716 ) ) ( ON ?auto_88713 ?auto_88712 ) ( ON-TABLE ?auto_88716 ) ( ON ?auto_88714 ?auto_88713 ) ( ON ?auto_88715 ?auto_88714 ) ( ON ?auto_88718 ?auto_88715 ) ( CLEAR ?auto_88718 ) ( HOLDING ?auto_88717 ) ( CLEAR ?auto_88719 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88719 ?auto_88717 )
      ( MAKE-3PILE ?auto_88712 ?auto_88713 ?auto_88714 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88720 - BLOCK
      ?auto_88721 - BLOCK
      ?auto_88722 - BLOCK
    )
    :vars
    (
      ?auto_88727 - BLOCK
      ?auto_88726 - BLOCK
      ?auto_88725 - BLOCK
      ?auto_88723 - BLOCK
      ?auto_88724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88720 ?auto_88721 ) ) ( not ( = ?auto_88720 ?auto_88722 ) ) ( not ( = ?auto_88721 ?auto_88722 ) ) ( not ( = ?auto_88720 ?auto_88727 ) ) ( not ( = ?auto_88721 ?auto_88727 ) ) ( not ( = ?auto_88722 ?auto_88727 ) ) ( ON-TABLE ?auto_88726 ) ( not ( = ?auto_88726 ?auto_88725 ) ) ( not ( = ?auto_88726 ?auto_88723 ) ) ( not ( = ?auto_88726 ?auto_88727 ) ) ( not ( = ?auto_88726 ?auto_88722 ) ) ( not ( = ?auto_88726 ?auto_88721 ) ) ( not ( = ?auto_88725 ?auto_88723 ) ) ( not ( = ?auto_88725 ?auto_88727 ) ) ( not ( = ?auto_88725 ?auto_88722 ) ) ( not ( = ?auto_88725 ?auto_88721 ) ) ( not ( = ?auto_88723 ?auto_88727 ) ) ( not ( = ?auto_88723 ?auto_88722 ) ) ( not ( = ?auto_88723 ?auto_88721 ) ) ( not ( = ?auto_88720 ?auto_88726 ) ) ( not ( = ?auto_88720 ?auto_88725 ) ) ( not ( = ?auto_88720 ?auto_88723 ) ) ( ON ?auto_88720 ?auto_88724 ) ( not ( = ?auto_88720 ?auto_88724 ) ) ( not ( = ?auto_88721 ?auto_88724 ) ) ( not ( = ?auto_88722 ?auto_88724 ) ) ( not ( = ?auto_88727 ?auto_88724 ) ) ( not ( = ?auto_88726 ?auto_88724 ) ) ( not ( = ?auto_88725 ?auto_88724 ) ) ( not ( = ?auto_88723 ?auto_88724 ) ) ( ON ?auto_88721 ?auto_88720 ) ( ON-TABLE ?auto_88724 ) ( ON ?auto_88722 ?auto_88721 ) ( ON ?auto_88727 ?auto_88722 ) ( ON ?auto_88723 ?auto_88727 ) ( CLEAR ?auto_88726 ) ( ON ?auto_88725 ?auto_88723 ) ( CLEAR ?auto_88725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88724 ?auto_88720 ?auto_88721 ?auto_88722 ?auto_88727 ?auto_88723 )
      ( MAKE-3PILE ?auto_88720 ?auto_88721 ?auto_88722 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88728 - BLOCK
      ?auto_88729 - BLOCK
      ?auto_88730 - BLOCK
    )
    :vars
    (
      ?auto_88734 - BLOCK
      ?auto_88733 - BLOCK
      ?auto_88731 - BLOCK
      ?auto_88735 - BLOCK
      ?auto_88732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88728 ?auto_88729 ) ) ( not ( = ?auto_88728 ?auto_88730 ) ) ( not ( = ?auto_88729 ?auto_88730 ) ) ( not ( = ?auto_88728 ?auto_88734 ) ) ( not ( = ?auto_88729 ?auto_88734 ) ) ( not ( = ?auto_88730 ?auto_88734 ) ) ( not ( = ?auto_88733 ?auto_88731 ) ) ( not ( = ?auto_88733 ?auto_88735 ) ) ( not ( = ?auto_88733 ?auto_88734 ) ) ( not ( = ?auto_88733 ?auto_88730 ) ) ( not ( = ?auto_88733 ?auto_88729 ) ) ( not ( = ?auto_88731 ?auto_88735 ) ) ( not ( = ?auto_88731 ?auto_88734 ) ) ( not ( = ?auto_88731 ?auto_88730 ) ) ( not ( = ?auto_88731 ?auto_88729 ) ) ( not ( = ?auto_88735 ?auto_88734 ) ) ( not ( = ?auto_88735 ?auto_88730 ) ) ( not ( = ?auto_88735 ?auto_88729 ) ) ( not ( = ?auto_88728 ?auto_88733 ) ) ( not ( = ?auto_88728 ?auto_88731 ) ) ( not ( = ?auto_88728 ?auto_88735 ) ) ( ON ?auto_88728 ?auto_88732 ) ( not ( = ?auto_88728 ?auto_88732 ) ) ( not ( = ?auto_88729 ?auto_88732 ) ) ( not ( = ?auto_88730 ?auto_88732 ) ) ( not ( = ?auto_88734 ?auto_88732 ) ) ( not ( = ?auto_88733 ?auto_88732 ) ) ( not ( = ?auto_88731 ?auto_88732 ) ) ( not ( = ?auto_88735 ?auto_88732 ) ) ( ON ?auto_88729 ?auto_88728 ) ( ON-TABLE ?auto_88732 ) ( ON ?auto_88730 ?auto_88729 ) ( ON ?auto_88734 ?auto_88730 ) ( ON ?auto_88735 ?auto_88734 ) ( ON ?auto_88731 ?auto_88735 ) ( CLEAR ?auto_88731 ) ( HOLDING ?auto_88733 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88733 )
      ( MAKE-3PILE ?auto_88728 ?auto_88729 ?auto_88730 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88736 - BLOCK
      ?auto_88737 - BLOCK
      ?auto_88738 - BLOCK
    )
    :vars
    (
      ?auto_88740 - BLOCK
      ?auto_88741 - BLOCK
      ?auto_88742 - BLOCK
      ?auto_88739 - BLOCK
      ?auto_88743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88736 ?auto_88737 ) ) ( not ( = ?auto_88736 ?auto_88738 ) ) ( not ( = ?auto_88737 ?auto_88738 ) ) ( not ( = ?auto_88736 ?auto_88740 ) ) ( not ( = ?auto_88737 ?auto_88740 ) ) ( not ( = ?auto_88738 ?auto_88740 ) ) ( not ( = ?auto_88741 ?auto_88742 ) ) ( not ( = ?auto_88741 ?auto_88739 ) ) ( not ( = ?auto_88741 ?auto_88740 ) ) ( not ( = ?auto_88741 ?auto_88738 ) ) ( not ( = ?auto_88741 ?auto_88737 ) ) ( not ( = ?auto_88742 ?auto_88739 ) ) ( not ( = ?auto_88742 ?auto_88740 ) ) ( not ( = ?auto_88742 ?auto_88738 ) ) ( not ( = ?auto_88742 ?auto_88737 ) ) ( not ( = ?auto_88739 ?auto_88740 ) ) ( not ( = ?auto_88739 ?auto_88738 ) ) ( not ( = ?auto_88739 ?auto_88737 ) ) ( not ( = ?auto_88736 ?auto_88741 ) ) ( not ( = ?auto_88736 ?auto_88742 ) ) ( not ( = ?auto_88736 ?auto_88739 ) ) ( ON ?auto_88736 ?auto_88743 ) ( not ( = ?auto_88736 ?auto_88743 ) ) ( not ( = ?auto_88737 ?auto_88743 ) ) ( not ( = ?auto_88738 ?auto_88743 ) ) ( not ( = ?auto_88740 ?auto_88743 ) ) ( not ( = ?auto_88741 ?auto_88743 ) ) ( not ( = ?auto_88742 ?auto_88743 ) ) ( not ( = ?auto_88739 ?auto_88743 ) ) ( ON ?auto_88737 ?auto_88736 ) ( ON-TABLE ?auto_88743 ) ( ON ?auto_88738 ?auto_88737 ) ( ON ?auto_88740 ?auto_88738 ) ( ON ?auto_88739 ?auto_88740 ) ( ON ?auto_88742 ?auto_88739 ) ( ON ?auto_88741 ?auto_88742 ) ( CLEAR ?auto_88741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88743 ?auto_88736 ?auto_88737 ?auto_88738 ?auto_88740 ?auto_88739 ?auto_88742 )
      ( MAKE-3PILE ?auto_88736 ?auto_88737 ?auto_88738 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88747 - BLOCK
      ?auto_88748 - BLOCK
      ?auto_88749 - BLOCK
    )
    :vars
    (
      ?auto_88750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88750 ?auto_88749 ) ( CLEAR ?auto_88750 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88747 ) ( ON ?auto_88748 ?auto_88747 ) ( ON ?auto_88749 ?auto_88748 ) ( not ( = ?auto_88747 ?auto_88748 ) ) ( not ( = ?auto_88747 ?auto_88749 ) ) ( not ( = ?auto_88747 ?auto_88750 ) ) ( not ( = ?auto_88748 ?auto_88749 ) ) ( not ( = ?auto_88748 ?auto_88750 ) ) ( not ( = ?auto_88749 ?auto_88750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88750 ?auto_88749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88751 - BLOCK
      ?auto_88752 - BLOCK
      ?auto_88753 - BLOCK
    )
    :vars
    (
      ?auto_88754 - BLOCK
      ?auto_88755 - BLOCK
      ?auto_88756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88754 ?auto_88753 ) ( CLEAR ?auto_88754 ) ( ON-TABLE ?auto_88751 ) ( ON ?auto_88752 ?auto_88751 ) ( ON ?auto_88753 ?auto_88752 ) ( not ( = ?auto_88751 ?auto_88752 ) ) ( not ( = ?auto_88751 ?auto_88753 ) ) ( not ( = ?auto_88751 ?auto_88754 ) ) ( not ( = ?auto_88752 ?auto_88753 ) ) ( not ( = ?auto_88752 ?auto_88754 ) ) ( not ( = ?auto_88753 ?auto_88754 ) ) ( HOLDING ?auto_88755 ) ( CLEAR ?auto_88756 ) ( not ( = ?auto_88751 ?auto_88755 ) ) ( not ( = ?auto_88751 ?auto_88756 ) ) ( not ( = ?auto_88752 ?auto_88755 ) ) ( not ( = ?auto_88752 ?auto_88756 ) ) ( not ( = ?auto_88753 ?auto_88755 ) ) ( not ( = ?auto_88753 ?auto_88756 ) ) ( not ( = ?auto_88754 ?auto_88755 ) ) ( not ( = ?auto_88754 ?auto_88756 ) ) ( not ( = ?auto_88755 ?auto_88756 ) ) )
    :subtasks
    ( ( !STACK ?auto_88755 ?auto_88756 )
      ( MAKE-3PILE ?auto_88751 ?auto_88752 ?auto_88753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88757 - BLOCK
      ?auto_88758 - BLOCK
      ?auto_88759 - BLOCK
    )
    :vars
    (
      ?auto_88762 - BLOCK
      ?auto_88760 - BLOCK
      ?auto_88761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88762 ?auto_88759 ) ( ON-TABLE ?auto_88757 ) ( ON ?auto_88758 ?auto_88757 ) ( ON ?auto_88759 ?auto_88758 ) ( not ( = ?auto_88757 ?auto_88758 ) ) ( not ( = ?auto_88757 ?auto_88759 ) ) ( not ( = ?auto_88757 ?auto_88762 ) ) ( not ( = ?auto_88758 ?auto_88759 ) ) ( not ( = ?auto_88758 ?auto_88762 ) ) ( not ( = ?auto_88759 ?auto_88762 ) ) ( CLEAR ?auto_88760 ) ( not ( = ?auto_88757 ?auto_88761 ) ) ( not ( = ?auto_88757 ?auto_88760 ) ) ( not ( = ?auto_88758 ?auto_88761 ) ) ( not ( = ?auto_88758 ?auto_88760 ) ) ( not ( = ?auto_88759 ?auto_88761 ) ) ( not ( = ?auto_88759 ?auto_88760 ) ) ( not ( = ?auto_88762 ?auto_88761 ) ) ( not ( = ?auto_88762 ?auto_88760 ) ) ( not ( = ?auto_88761 ?auto_88760 ) ) ( ON ?auto_88761 ?auto_88762 ) ( CLEAR ?auto_88761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88757 ?auto_88758 ?auto_88759 ?auto_88762 )
      ( MAKE-3PILE ?auto_88757 ?auto_88758 ?auto_88759 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88763 - BLOCK
      ?auto_88764 - BLOCK
      ?auto_88765 - BLOCK
    )
    :vars
    (
      ?auto_88766 - BLOCK
      ?auto_88768 - BLOCK
      ?auto_88767 - BLOCK
      ?auto_88769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88766 ?auto_88765 ) ( ON-TABLE ?auto_88763 ) ( ON ?auto_88764 ?auto_88763 ) ( ON ?auto_88765 ?auto_88764 ) ( not ( = ?auto_88763 ?auto_88764 ) ) ( not ( = ?auto_88763 ?auto_88765 ) ) ( not ( = ?auto_88763 ?auto_88766 ) ) ( not ( = ?auto_88764 ?auto_88765 ) ) ( not ( = ?auto_88764 ?auto_88766 ) ) ( not ( = ?auto_88765 ?auto_88766 ) ) ( not ( = ?auto_88763 ?auto_88768 ) ) ( not ( = ?auto_88763 ?auto_88767 ) ) ( not ( = ?auto_88764 ?auto_88768 ) ) ( not ( = ?auto_88764 ?auto_88767 ) ) ( not ( = ?auto_88765 ?auto_88768 ) ) ( not ( = ?auto_88765 ?auto_88767 ) ) ( not ( = ?auto_88766 ?auto_88768 ) ) ( not ( = ?auto_88766 ?auto_88767 ) ) ( not ( = ?auto_88768 ?auto_88767 ) ) ( ON ?auto_88768 ?auto_88766 ) ( CLEAR ?auto_88768 ) ( HOLDING ?auto_88767 ) ( CLEAR ?auto_88769 ) ( ON-TABLE ?auto_88769 ) ( not ( = ?auto_88769 ?auto_88767 ) ) ( not ( = ?auto_88763 ?auto_88769 ) ) ( not ( = ?auto_88764 ?auto_88769 ) ) ( not ( = ?auto_88765 ?auto_88769 ) ) ( not ( = ?auto_88766 ?auto_88769 ) ) ( not ( = ?auto_88768 ?auto_88769 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88769 ?auto_88767 )
      ( MAKE-3PILE ?auto_88763 ?auto_88764 ?auto_88765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88770 - BLOCK
      ?auto_88771 - BLOCK
      ?auto_88772 - BLOCK
    )
    :vars
    (
      ?auto_88774 - BLOCK
      ?auto_88773 - BLOCK
      ?auto_88776 - BLOCK
      ?auto_88775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88774 ?auto_88772 ) ( ON-TABLE ?auto_88770 ) ( ON ?auto_88771 ?auto_88770 ) ( ON ?auto_88772 ?auto_88771 ) ( not ( = ?auto_88770 ?auto_88771 ) ) ( not ( = ?auto_88770 ?auto_88772 ) ) ( not ( = ?auto_88770 ?auto_88774 ) ) ( not ( = ?auto_88771 ?auto_88772 ) ) ( not ( = ?auto_88771 ?auto_88774 ) ) ( not ( = ?auto_88772 ?auto_88774 ) ) ( not ( = ?auto_88770 ?auto_88773 ) ) ( not ( = ?auto_88770 ?auto_88776 ) ) ( not ( = ?auto_88771 ?auto_88773 ) ) ( not ( = ?auto_88771 ?auto_88776 ) ) ( not ( = ?auto_88772 ?auto_88773 ) ) ( not ( = ?auto_88772 ?auto_88776 ) ) ( not ( = ?auto_88774 ?auto_88773 ) ) ( not ( = ?auto_88774 ?auto_88776 ) ) ( not ( = ?auto_88773 ?auto_88776 ) ) ( ON ?auto_88773 ?auto_88774 ) ( CLEAR ?auto_88775 ) ( ON-TABLE ?auto_88775 ) ( not ( = ?auto_88775 ?auto_88776 ) ) ( not ( = ?auto_88770 ?auto_88775 ) ) ( not ( = ?auto_88771 ?auto_88775 ) ) ( not ( = ?auto_88772 ?auto_88775 ) ) ( not ( = ?auto_88774 ?auto_88775 ) ) ( not ( = ?auto_88773 ?auto_88775 ) ) ( ON ?auto_88776 ?auto_88773 ) ( CLEAR ?auto_88776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88770 ?auto_88771 ?auto_88772 ?auto_88774 ?auto_88773 )
      ( MAKE-3PILE ?auto_88770 ?auto_88771 ?auto_88772 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88777 - BLOCK
      ?auto_88778 - BLOCK
      ?auto_88779 - BLOCK
    )
    :vars
    (
      ?auto_88782 - BLOCK
      ?auto_88781 - BLOCK
      ?auto_88783 - BLOCK
      ?auto_88780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88782 ?auto_88779 ) ( ON-TABLE ?auto_88777 ) ( ON ?auto_88778 ?auto_88777 ) ( ON ?auto_88779 ?auto_88778 ) ( not ( = ?auto_88777 ?auto_88778 ) ) ( not ( = ?auto_88777 ?auto_88779 ) ) ( not ( = ?auto_88777 ?auto_88782 ) ) ( not ( = ?auto_88778 ?auto_88779 ) ) ( not ( = ?auto_88778 ?auto_88782 ) ) ( not ( = ?auto_88779 ?auto_88782 ) ) ( not ( = ?auto_88777 ?auto_88781 ) ) ( not ( = ?auto_88777 ?auto_88783 ) ) ( not ( = ?auto_88778 ?auto_88781 ) ) ( not ( = ?auto_88778 ?auto_88783 ) ) ( not ( = ?auto_88779 ?auto_88781 ) ) ( not ( = ?auto_88779 ?auto_88783 ) ) ( not ( = ?auto_88782 ?auto_88781 ) ) ( not ( = ?auto_88782 ?auto_88783 ) ) ( not ( = ?auto_88781 ?auto_88783 ) ) ( ON ?auto_88781 ?auto_88782 ) ( not ( = ?auto_88780 ?auto_88783 ) ) ( not ( = ?auto_88777 ?auto_88780 ) ) ( not ( = ?auto_88778 ?auto_88780 ) ) ( not ( = ?auto_88779 ?auto_88780 ) ) ( not ( = ?auto_88782 ?auto_88780 ) ) ( not ( = ?auto_88781 ?auto_88780 ) ) ( ON ?auto_88783 ?auto_88781 ) ( CLEAR ?auto_88783 ) ( HOLDING ?auto_88780 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88780 )
      ( MAKE-3PILE ?auto_88777 ?auto_88778 ?auto_88779 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88784 - BLOCK
      ?auto_88785 - BLOCK
      ?auto_88786 - BLOCK
    )
    :vars
    (
      ?auto_88789 - BLOCK
      ?auto_88790 - BLOCK
      ?auto_88788 - BLOCK
      ?auto_88787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88789 ?auto_88786 ) ( ON-TABLE ?auto_88784 ) ( ON ?auto_88785 ?auto_88784 ) ( ON ?auto_88786 ?auto_88785 ) ( not ( = ?auto_88784 ?auto_88785 ) ) ( not ( = ?auto_88784 ?auto_88786 ) ) ( not ( = ?auto_88784 ?auto_88789 ) ) ( not ( = ?auto_88785 ?auto_88786 ) ) ( not ( = ?auto_88785 ?auto_88789 ) ) ( not ( = ?auto_88786 ?auto_88789 ) ) ( not ( = ?auto_88784 ?auto_88790 ) ) ( not ( = ?auto_88784 ?auto_88788 ) ) ( not ( = ?auto_88785 ?auto_88790 ) ) ( not ( = ?auto_88785 ?auto_88788 ) ) ( not ( = ?auto_88786 ?auto_88790 ) ) ( not ( = ?auto_88786 ?auto_88788 ) ) ( not ( = ?auto_88789 ?auto_88790 ) ) ( not ( = ?auto_88789 ?auto_88788 ) ) ( not ( = ?auto_88790 ?auto_88788 ) ) ( ON ?auto_88790 ?auto_88789 ) ( not ( = ?auto_88787 ?auto_88788 ) ) ( not ( = ?auto_88784 ?auto_88787 ) ) ( not ( = ?auto_88785 ?auto_88787 ) ) ( not ( = ?auto_88786 ?auto_88787 ) ) ( not ( = ?auto_88789 ?auto_88787 ) ) ( not ( = ?auto_88790 ?auto_88787 ) ) ( ON ?auto_88788 ?auto_88790 ) ( ON ?auto_88787 ?auto_88788 ) ( CLEAR ?auto_88787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88784 ?auto_88785 ?auto_88786 ?auto_88789 ?auto_88790 ?auto_88788 )
      ( MAKE-3PILE ?auto_88784 ?auto_88785 ?auto_88786 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88791 - BLOCK
      ?auto_88792 - BLOCK
      ?auto_88793 - BLOCK
    )
    :vars
    (
      ?auto_88796 - BLOCK
      ?auto_88795 - BLOCK
      ?auto_88794 - BLOCK
      ?auto_88797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88796 ?auto_88793 ) ( ON-TABLE ?auto_88791 ) ( ON ?auto_88792 ?auto_88791 ) ( ON ?auto_88793 ?auto_88792 ) ( not ( = ?auto_88791 ?auto_88792 ) ) ( not ( = ?auto_88791 ?auto_88793 ) ) ( not ( = ?auto_88791 ?auto_88796 ) ) ( not ( = ?auto_88792 ?auto_88793 ) ) ( not ( = ?auto_88792 ?auto_88796 ) ) ( not ( = ?auto_88793 ?auto_88796 ) ) ( not ( = ?auto_88791 ?auto_88795 ) ) ( not ( = ?auto_88791 ?auto_88794 ) ) ( not ( = ?auto_88792 ?auto_88795 ) ) ( not ( = ?auto_88792 ?auto_88794 ) ) ( not ( = ?auto_88793 ?auto_88795 ) ) ( not ( = ?auto_88793 ?auto_88794 ) ) ( not ( = ?auto_88796 ?auto_88795 ) ) ( not ( = ?auto_88796 ?auto_88794 ) ) ( not ( = ?auto_88795 ?auto_88794 ) ) ( ON ?auto_88795 ?auto_88796 ) ( not ( = ?auto_88797 ?auto_88794 ) ) ( not ( = ?auto_88791 ?auto_88797 ) ) ( not ( = ?auto_88792 ?auto_88797 ) ) ( not ( = ?auto_88793 ?auto_88797 ) ) ( not ( = ?auto_88796 ?auto_88797 ) ) ( not ( = ?auto_88795 ?auto_88797 ) ) ( ON ?auto_88794 ?auto_88795 ) ( HOLDING ?auto_88797 ) ( CLEAR ?auto_88794 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88791 ?auto_88792 ?auto_88793 ?auto_88796 ?auto_88795 ?auto_88794 ?auto_88797 )
      ( MAKE-3PILE ?auto_88791 ?auto_88792 ?auto_88793 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88798 - BLOCK
      ?auto_88799 - BLOCK
      ?auto_88800 - BLOCK
    )
    :vars
    (
      ?auto_88802 - BLOCK
      ?auto_88804 - BLOCK
      ?auto_88803 - BLOCK
      ?auto_88801 - BLOCK
      ?auto_88805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88802 ?auto_88800 ) ( ON-TABLE ?auto_88798 ) ( ON ?auto_88799 ?auto_88798 ) ( ON ?auto_88800 ?auto_88799 ) ( not ( = ?auto_88798 ?auto_88799 ) ) ( not ( = ?auto_88798 ?auto_88800 ) ) ( not ( = ?auto_88798 ?auto_88802 ) ) ( not ( = ?auto_88799 ?auto_88800 ) ) ( not ( = ?auto_88799 ?auto_88802 ) ) ( not ( = ?auto_88800 ?auto_88802 ) ) ( not ( = ?auto_88798 ?auto_88804 ) ) ( not ( = ?auto_88798 ?auto_88803 ) ) ( not ( = ?auto_88799 ?auto_88804 ) ) ( not ( = ?auto_88799 ?auto_88803 ) ) ( not ( = ?auto_88800 ?auto_88804 ) ) ( not ( = ?auto_88800 ?auto_88803 ) ) ( not ( = ?auto_88802 ?auto_88804 ) ) ( not ( = ?auto_88802 ?auto_88803 ) ) ( not ( = ?auto_88804 ?auto_88803 ) ) ( ON ?auto_88804 ?auto_88802 ) ( not ( = ?auto_88801 ?auto_88803 ) ) ( not ( = ?auto_88798 ?auto_88801 ) ) ( not ( = ?auto_88799 ?auto_88801 ) ) ( not ( = ?auto_88800 ?auto_88801 ) ) ( not ( = ?auto_88802 ?auto_88801 ) ) ( not ( = ?auto_88804 ?auto_88801 ) ) ( ON ?auto_88803 ?auto_88804 ) ( CLEAR ?auto_88803 ) ( ON ?auto_88801 ?auto_88805 ) ( CLEAR ?auto_88801 ) ( HAND-EMPTY ) ( not ( = ?auto_88798 ?auto_88805 ) ) ( not ( = ?auto_88799 ?auto_88805 ) ) ( not ( = ?auto_88800 ?auto_88805 ) ) ( not ( = ?auto_88802 ?auto_88805 ) ) ( not ( = ?auto_88804 ?auto_88805 ) ) ( not ( = ?auto_88803 ?auto_88805 ) ) ( not ( = ?auto_88801 ?auto_88805 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88801 ?auto_88805 )
      ( MAKE-3PILE ?auto_88798 ?auto_88799 ?auto_88800 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88806 - BLOCK
      ?auto_88807 - BLOCK
      ?auto_88808 - BLOCK
    )
    :vars
    (
      ?auto_88811 - BLOCK
      ?auto_88810 - BLOCK
      ?auto_88812 - BLOCK
      ?auto_88813 - BLOCK
      ?auto_88809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88811 ?auto_88808 ) ( ON-TABLE ?auto_88806 ) ( ON ?auto_88807 ?auto_88806 ) ( ON ?auto_88808 ?auto_88807 ) ( not ( = ?auto_88806 ?auto_88807 ) ) ( not ( = ?auto_88806 ?auto_88808 ) ) ( not ( = ?auto_88806 ?auto_88811 ) ) ( not ( = ?auto_88807 ?auto_88808 ) ) ( not ( = ?auto_88807 ?auto_88811 ) ) ( not ( = ?auto_88808 ?auto_88811 ) ) ( not ( = ?auto_88806 ?auto_88810 ) ) ( not ( = ?auto_88806 ?auto_88812 ) ) ( not ( = ?auto_88807 ?auto_88810 ) ) ( not ( = ?auto_88807 ?auto_88812 ) ) ( not ( = ?auto_88808 ?auto_88810 ) ) ( not ( = ?auto_88808 ?auto_88812 ) ) ( not ( = ?auto_88811 ?auto_88810 ) ) ( not ( = ?auto_88811 ?auto_88812 ) ) ( not ( = ?auto_88810 ?auto_88812 ) ) ( ON ?auto_88810 ?auto_88811 ) ( not ( = ?auto_88813 ?auto_88812 ) ) ( not ( = ?auto_88806 ?auto_88813 ) ) ( not ( = ?auto_88807 ?auto_88813 ) ) ( not ( = ?auto_88808 ?auto_88813 ) ) ( not ( = ?auto_88811 ?auto_88813 ) ) ( not ( = ?auto_88810 ?auto_88813 ) ) ( ON ?auto_88813 ?auto_88809 ) ( CLEAR ?auto_88813 ) ( not ( = ?auto_88806 ?auto_88809 ) ) ( not ( = ?auto_88807 ?auto_88809 ) ) ( not ( = ?auto_88808 ?auto_88809 ) ) ( not ( = ?auto_88811 ?auto_88809 ) ) ( not ( = ?auto_88810 ?auto_88809 ) ) ( not ( = ?auto_88812 ?auto_88809 ) ) ( not ( = ?auto_88813 ?auto_88809 ) ) ( HOLDING ?auto_88812 ) ( CLEAR ?auto_88810 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88806 ?auto_88807 ?auto_88808 ?auto_88811 ?auto_88810 ?auto_88812 )
      ( MAKE-3PILE ?auto_88806 ?auto_88807 ?auto_88808 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88814 - BLOCK
      ?auto_88815 - BLOCK
      ?auto_88816 - BLOCK
    )
    :vars
    (
      ?auto_88821 - BLOCK
      ?auto_88820 - BLOCK
      ?auto_88819 - BLOCK
      ?auto_88817 - BLOCK
      ?auto_88818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88821 ?auto_88816 ) ( ON-TABLE ?auto_88814 ) ( ON ?auto_88815 ?auto_88814 ) ( ON ?auto_88816 ?auto_88815 ) ( not ( = ?auto_88814 ?auto_88815 ) ) ( not ( = ?auto_88814 ?auto_88816 ) ) ( not ( = ?auto_88814 ?auto_88821 ) ) ( not ( = ?auto_88815 ?auto_88816 ) ) ( not ( = ?auto_88815 ?auto_88821 ) ) ( not ( = ?auto_88816 ?auto_88821 ) ) ( not ( = ?auto_88814 ?auto_88820 ) ) ( not ( = ?auto_88814 ?auto_88819 ) ) ( not ( = ?auto_88815 ?auto_88820 ) ) ( not ( = ?auto_88815 ?auto_88819 ) ) ( not ( = ?auto_88816 ?auto_88820 ) ) ( not ( = ?auto_88816 ?auto_88819 ) ) ( not ( = ?auto_88821 ?auto_88820 ) ) ( not ( = ?auto_88821 ?auto_88819 ) ) ( not ( = ?auto_88820 ?auto_88819 ) ) ( ON ?auto_88820 ?auto_88821 ) ( not ( = ?auto_88817 ?auto_88819 ) ) ( not ( = ?auto_88814 ?auto_88817 ) ) ( not ( = ?auto_88815 ?auto_88817 ) ) ( not ( = ?auto_88816 ?auto_88817 ) ) ( not ( = ?auto_88821 ?auto_88817 ) ) ( not ( = ?auto_88820 ?auto_88817 ) ) ( ON ?auto_88817 ?auto_88818 ) ( not ( = ?auto_88814 ?auto_88818 ) ) ( not ( = ?auto_88815 ?auto_88818 ) ) ( not ( = ?auto_88816 ?auto_88818 ) ) ( not ( = ?auto_88821 ?auto_88818 ) ) ( not ( = ?auto_88820 ?auto_88818 ) ) ( not ( = ?auto_88819 ?auto_88818 ) ) ( not ( = ?auto_88817 ?auto_88818 ) ) ( CLEAR ?auto_88820 ) ( ON ?auto_88819 ?auto_88817 ) ( CLEAR ?auto_88819 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88818 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88818 ?auto_88817 )
      ( MAKE-3PILE ?auto_88814 ?auto_88815 ?auto_88816 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88822 - BLOCK
      ?auto_88823 - BLOCK
      ?auto_88824 - BLOCK
    )
    :vars
    (
      ?auto_88826 - BLOCK
      ?auto_88829 - BLOCK
      ?auto_88828 - BLOCK
      ?auto_88827 - BLOCK
      ?auto_88825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88826 ?auto_88824 ) ( ON-TABLE ?auto_88822 ) ( ON ?auto_88823 ?auto_88822 ) ( ON ?auto_88824 ?auto_88823 ) ( not ( = ?auto_88822 ?auto_88823 ) ) ( not ( = ?auto_88822 ?auto_88824 ) ) ( not ( = ?auto_88822 ?auto_88826 ) ) ( not ( = ?auto_88823 ?auto_88824 ) ) ( not ( = ?auto_88823 ?auto_88826 ) ) ( not ( = ?auto_88824 ?auto_88826 ) ) ( not ( = ?auto_88822 ?auto_88829 ) ) ( not ( = ?auto_88822 ?auto_88828 ) ) ( not ( = ?auto_88823 ?auto_88829 ) ) ( not ( = ?auto_88823 ?auto_88828 ) ) ( not ( = ?auto_88824 ?auto_88829 ) ) ( not ( = ?auto_88824 ?auto_88828 ) ) ( not ( = ?auto_88826 ?auto_88829 ) ) ( not ( = ?auto_88826 ?auto_88828 ) ) ( not ( = ?auto_88829 ?auto_88828 ) ) ( not ( = ?auto_88827 ?auto_88828 ) ) ( not ( = ?auto_88822 ?auto_88827 ) ) ( not ( = ?auto_88823 ?auto_88827 ) ) ( not ( = ?auto_88824 ?auto_88827 ) ) ( not ( = ?auto_88826 ?auto_88827 ) ) ( not ( = ?auto_88829 ?auto_88827 ) ) ( ON ?auto_88827 ?auto_88825 ) ( not ( = ?auto_88822 ?auto_88825 ) ) ( not ( = ?auto_88823 ?auto_88825 ) ) ( not ( = ?auto_88824 ?auto_88825 ) ) ( not ( = ?auto_88826 ?auto_88825 ) ) ( not ( = ?auto_88829 ?auto_88825 ) ) ( not ( = ?auto_88828 ?auto_88825 ) ) ( not ( = ?auto_88827 ?auto_88825 ) ) ( ON ?auto_88828 ?auto_88827 ) ( CLEAR ?auto_88828 ) ( ON-TABLE ?auto_88825 ) ( HOLDING ?auto_88829 ) ( CLEAR ?auto_88826 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88822 ?auto_88823 ?auto_88824 ?auto_88826 ?auto_88829 )
      ( MAKE-3PILE ?auto_88822 ?auto_88823 ?auto_88824 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88830 - BLOCK
      ?auto_88831 - BLOCK
      ?auto_88832 - BLOCK
    )
    :vars
    (
      ?auto_88835 - BLOCK
      ?auto_88837 - BLOCK
      ?auto_88836 - BLOCK
      ?auto_88834 - BLOCK
      ?auto_88833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88835 ?auto_88832 ) ( ON-TABLE ?auto_88830 ) ( ON ?auto_88831 ?auto_88830 ) ( ON ?auto_88832 ?auto_88831 ) ( not ( = ?auto_88830 ?auto_88831 ) ) ( not ( = ?auto_88830 ?auto_88832 ) ) ( not ( = ?auto_88830 ?auto_88835 ) ) ( not ( = ?auto_88831 ?auto_88832 ) ) ( not ( = ?auto_88831 ?auto_88835 ) ) ( not ( = ?auto_88832 ?auto_88835 ) ) ( not ( = ?auto_88830 ?auto_88837 ) ) ( not ( = ?auto_88830 ?auto_88836 ) ) ( not ( = ?auto_88831 ?auto_88837 ) ) ( not ( = ?auto_88831 ?auto_88836 ) ) ( not ( = ?auto_88832 ?auto_88837 ) ) ( not ( = ?auto_88832 ?auto_88836 ) ) ( not ( = ?auto_88835 ?auto_88837 ) ) ( not ( = ?auto_88835 ?auto_88836 ) ) ( not ( = ?auto_88837 ?auto_88836 ) ) ( not ( = ?auto_88834 ?auto_88836 ) ) ( not ( = ?auto_88830 ?auto_88834 ) ) ( not ( = ?auto_88831 ?auto_88834 ) ) ( not ( = ?auto_88832 ?auto_88834 ) ) ( not ( = ?auto_88835 ?auto_88834 ) ) ( not ( = ?auto_88837 ?auto_88834 ) ) ( ON ?auto_88834 ?auto_88833 ) ( not ( = ?auto_88830 ?auto_88833 ) ) ( not ( = ?auto_88831 ?auto_88833 ) ) ( not ( = ?auto_88832 ?auto_88833 ) ) ( not ( = ?auto_88835 ?auto_88833 ) ) ( not ( = ?auto_88837 ?auto_88833 ) ) ( not ( = ?auto_88836 ?auto_88833 ) ) ( not ( = ?auto_88834 ?auto_88833 ) ) ( ON ?auto_88836 ?auto_88834 ) ( ON-TABLE ?auto_88833 ) ( CLEAR ?auto_88835 ) ( ON ?auto_88837 ?auto_88836 ) ( CLEAR ?auto_88837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88833 ?auto_88834 ?auto_88836 )
      ( MAKE-3PILE ?auto_88830 ?auto_88831 ?auto_88832 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88854 - BLOCK
      ?auto_88855 - BLOCK
      ?auto_88856 - BLOCK
    )
    :vars
    (
      ?auto_88857 - BLOCK
      ?auto_88860 - BLOCK
      ?auto_88859 - BLOCK
      ?auto_88858 - BLOCK
      ?auto_88861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88854 ) ( ON ?auto_88855 ?auto_88854 ) ( not ( = ?auto_88854 ?auto_88855 ) ) ( not ( = ?auto_88854 ?auto_88856 ) ) ( not ( = ?auto_88854 ?auto_88857 ) ) ( not ( = ?auto_88855 ?auto_88856 ) ) ( not ( = ?auto_88855 ?auto_88857 ) ) ( not ( = ?auto_88856 ?auto_88857 ) ) ( not ( = ?auto_88854 ?auto_88860 ) ) ( not ( = ?auto_88854 ?auto_88859 ) ) ( not ( = ?auto_88855 ?auto_88860 ) ) ( not ( = ?auto_88855 ?auto_88859 ) ) ( not ( = ?auto_88856 ?auto_88860 ) ) ( not ( = ?auto_88856 ?auto_88859 ) ) ( not ( = ?auto_88857 ?auto_88860 ) ) ( not ( = ?auto_88857 ?auto_88859 ) ) ( not ( = ?auto_88860 ?auto_88859 ) ) ( not ( = ?auto_88858 ?auto_88859 ) ) ( not ( = ?auto_88854 ?auto_88858 ) ) ( not ( = ?auto_88855 ?auto_88858 ) ) ( not ( = ?auto_88856 ?auto_88858 ) ) ( not ( = ?auto_88857 ?auto_88858 ) ) ( not ( = ?auto_88860 ?auto_88858 ) ) ( ON ?auto_88858 ?auto_88861 ) ( not ( = ?auto_88854 ?auto_88861 ) ) ( not ( = ?auto_88855 ?auto_88861 ) ) ( not ( = ?auto_88856 ?auto_88861 ) ) ( not ( = ?auto_88857 ?auto_88861 ) ) ( not ( = ?auto_88860 ?auto_88861 ) ) ( not ( = ?auto_88859 ?auto_88861 ) ) ( not ( = ?auto_88858 ?auto_88861 ) ) ( ON ?auto_88859 ?auto_88858 ) ( ON-TABLE ?auto_88861 ) ( ON ?auto_88860 ?auto_88859 ) ( ON ?auto_88857 ?auto_88860 ) ( CLEAR ?auto_88857 ) ( HOLDING ?auto_88856 ) ( CLEAR ?auto_88855 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88854 ?auto_88855 ?auto_88856 ?auto_88857 )
      ( MAKE-3PILE ?auto_88854 ?auto_88855 ?auto_88856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88862 - BLOCK
      ?auto_88863 - BLOCK
      ?auto_88864 - BLOCK
    )
    :vars
    (
      ?auto_88869 - BLOCK
      ?auto_88867 - BLOCK
      ?auto_88866 - BLOCK
      ?auto_88868 - BLOCK
      ?auto_88865 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88862 ) ( ON ?auto_88863 ?auto_88862 ) ( not ( = ?auto_88862 ?auto_88863 ) ) ( not ( = ?auto_88862 ?auto_88864 ) ) ( not ( = ?auto_88862 ?auto_88869 ) ) ( not ( = ?auto_88863 ?auto_88864 ) ) ( not ( = ?auto_88863 ?auto_88869 ) ) ( not ( = ?auto_88864 ?auto_88869 ) ) ( not ( = ?auto_88862 ?auto_88867 ) ) ( not ( = ?auto_88862 ?auto_88866 ) ) ( not ( = ?auto_88863 ?auto_88867 ) ) ( not ( = ?auto_88863 ?auto_88866 ) ) ( not ( = ?auto_88864 ?auto_88867 ) ) ( not ( = ?auto_88864 ?auto_88866 ) ) ( not ( = ?auto_88869 ?auto_88867 ) ) ( not ( = ?auto_88869 ?auto_88866 ) ) ( not ( = ?auto_88867 ?auto_88866 ) ) ( not ( = ?auto_88868 ?auto_88866 ) ) ( not ( = ?auto_88862 ?auto_88868 ) ) ( not ( = ?auto_88863 ?auto_88868 ) ) ( not ( = ?auto_88864 ?auto_88868 ) ) ( not ( = ?auto_88869 ?auto_88868 ) ) ( not ( = ?auto_88867 ?auto_88868 ) ) ( ON ?auto_88868 ?auto_88865 ) ( not ( = ?auto_88862 ?auto_88865 ) ) ( not ( = ?auto_88863 ?auto_88865 ) ) ( not ( = ?auto_88864 ?auto_88865 ) ) ( not ( = ?auto_88869 ?auto_88865 ) ) ( not ( = ?auto_88867 ?auto_88865 ) ) ( not ( = ?auto_88866 ?auto_88865 ) ) ( not ( = ?auto_88868 ?auto_88865 ) ) ( ON ?auto_88866 ?auto_88868 ) ( ON-TABLE ?auto_88865 ) ( ON ?auto_88867 ?auto_88866 ) ( ON ?auto_88869 ?auto_88867 ) ( CLEAR ?auto_88863 ) ( ON ?auto_88864 ?auto_88869 ) ( CLEAR ?auto_88864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88865 ?auto_88868 ?auto_88866 ?auto_88867 ?auto_88869 )
      ( MAKE-3PILE ?auto_88862 ?auto_88863 ?auto_88864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88870 - BLOCK
      ?auto_88871 - BLOCK
      ?auto_88872 - BLOCK
    )
    :vars
    (
      ?auto_88874 - BLOCK
      ?auto_88877 - BLOCK
      ?auto_88873 - BLOCK
      ?auto_88875 - BLOCK
      ?auto_88876 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88870 ) ( not ( = ?auto_88870 ?auto_88871 ) ) ( not ( = ?auto_88870 ?auto_88872 ) ) ( not ( = ?auto_88870 ?auto_88874 ) ) ( not ( = ?auto_88871 ?auto_88872 ) ) ( not ( = ?auto_88871 ?auto_88874 ) ) ( not ( = ?auto_88872 ?auto_88874 ) ) ( not ( = ?auto_88870 ?auto_88877 ) ) ( not ( = ?auto_88870 ?auto_88873 ) ) ( not ( = ?auto_88871 ?auto_88877 ) ) ( not ( = ?auto_88871 ?auto_88873 ) ) ( not ( = ?auto_88872 ?auto_88877 ) ) ( not ( = ?auto_88872 ?auto_88873 ) ) ( not ( = ?auto_88874 ?auto_88877 ) ) ( not ( = ?auto_88874 ?auto_88873 ) ) ( not ( = ?auto_88877 ?auto_88873 ) ) ( not ( = ?auto_88875 ?auto_88873 ) ) ( not ( = ?auto_88870 ?auto_88875 ) ) ( not ( = ?auto_88871 ?auto_88875 ) ) ( not ( = ?auto_88872 ?auto_88875 ) ) ( not ( = ?auto_88874 ?auto_88875 ) ) ( not ( = ?auto_88877 ?auto_88875 ) ) ( ON ?auto_88875 ?auto_88876 ) ( not ( = ?auto_88870 ?auto_88876 ) ) ( not ( = ?auto_88871 ?auto_88876 ) ) ( not ( = ?auto_88872 ?auto_88876 ) ) ( not ( = ?auto_88874 ?auto_88876 ) ) ( not ( = ?auto_88877 ?auto_88876 ) ) ( not ( = ?auto_88873 ?auto_88876 ) ) ( not ( = ?auto_88875 ?auto_88876 ) ) ( ON ?auto_88873 ?auto_88875 ) ( ON-TABLE ?auto_88876 ) ( ON ?auto_88877 ?auto_88873 ) ( ON ?auto_88874 ?auto_88877 ) ( ON ?auto_88872 ?auto_88874 ) ( CLEAR ?auto_88872 ) ( HOLDING ?auto_88871 ) ( CLEAR ?auto_88870 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88870 ?auto_88871 )
      ( MAKE-3PILE ?auto_88870 ?auto_88871 ?auto_88872 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88878 - BLOCK
      ?auto_88879 - BLOCK
      ?auto_88880 - BLOCK
    )
    :vars
    (
      ?auto_88883 - BLOCK
      ?auto_88885 - BLOCK
      ?auto_88884 - BLOCK
      ?auto_88882 - BLOCK
      ?auto_88881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88878 ) ( not ( = ?auto_88878 ?auto_88879 ) ) ( not ( = ?auto_88878 ?auto_88880 ) ) ( not ( = ?auto_88878 ?auto_88883 ) ) ( not ( = ?auto_88879 ?auto_88880 ) ) ( not ( = ?auto_88879 ?auto_88883 ) ) ( not ( = ?auto_88880 ?auto_88883 ) ) ( not ( = ?auto_88878 ?auto_88885 ) ) ( not ( = ?auto_88878 ?auto_88884 ) ) ( not ( = ?auto_88879 ?auto_88885 ) ) ( not ( = ?auto_88879 ?auto_88884 ) ) ( not ( = ?auto_88880 ?auto_88885 ) ) ( not ( = ?auto_88880 ?auto_88884 ) ) ( not ( = ?auto_88883 ?auto_88885 ) ) ( not ( = ?auto_88883 ?auto_88884 ) ) ( not ( = ?auto_88885 ?auto_88884 ) ) ( not ( = ?auto_88882 ?auto_88884 ) ) ( not ( = ?auto_88878 ?auto_88882 ) ) ( not ( = ?auto_88879 ?auto_88882 ) ) ( not ( = ?auto_88880 ?auto_88882 ) ) ( not ( = ?auto_88883 ?auto_88882 ) ) ( not ( = ?auto_88885 ?auto_88882 ) ) ( ON ?auto_88882 ?auto_88881 ) ( not ( = ?auto_88878 ?auto_88881 ) ) ( not ( = ?auto_88879 ?auto_88881 ) ) ( not ( = ?auto_88880 ?auto_88881 ) ) ( not ( = ?auto_88883 ?auto_88881 ) ) ( not ( = ?auto_88885 ?auto_88881 ) ) ( not ( = ?auto_88884 ?auto_88881 ) ) ( not ( = ?auto_88882 ?auto_88881 ) ) ( ON ?auto_88884 ?auto_88882 ) ( ON-TABLE ?auto_88881 ) ( ON ?auto_88885 ?auto_88884 ) ( ON ?auto_88883 ?auto_88885 ) ( ON ?auto_88880 ?auto_88883 ) ( CLEAR ?auto_88878 ) ( ON ?auto_88879 ?auto_88880 ) ( CLEAR ?auto_88879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88881 ?auto_88882 ?auto_88884 ?auto_88885 ?auto_88883 ?auto_88880 )
      ( MAKE-3PILE ?auto_88878 ?auto_88879 ?auto_88880 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88886 - BLOCK
      ?auto_88887 - BLOCK
      ?auto_88888 - BLOCK
    )
    :vars
    (
      ?auto_88890 - BLOCK
      ?auto_88891 - BLOCK
      ?auto_88892 - BLOCK
      ?auto_88889 - BLOCK
      ?auto_88893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88886 ?auto_88887 ) ) ( not ( = ?auto_88886 ?auto_88888 ) ) ( not ( = ?auto_88886 ?auto_88890 ) ) ( not ( = ?auto_88887 ?auto_88888 ) ) ( not ( = ?auto_88887 ?auto_88890 ) ) ( not ( = ?auto_88888 ?auto_88890 ) ) ( not ( = ?auto_88886 ?auto_88891 ) ) ( not ( = ?auto_88886 ?auto_88892 ) ) ( not ( = ?auto_88887 ?auto_88891 ) ) ( not ( = ?auto_88887 ?auto_88892 ) ) ( not ( = ?auto_88888 ?auto_88891 ) ) ( not ( = ?auto_88888 ?auto_88892 ) ) ( not ( = ?auto_88890 ?auto_88891 ) ) ( not ( = ?auto_88890 ?auto_88892 ) ) ( not ( = ?auto_88891 ?auto_88892 ) ) ( not ( = ?auto_88889 ?auto_88892 ) ) ( not ( = ?auto_88886 ?auto_88889 ) ) ( not ( = ?auto_88887 ?auto_88889 ) ) ( not ( = ?auto_88888 ?auto_88889 ) ) ( not ( = ?auto_88890 ?auto_88889 ) ) ( not ( = ?auto_88891 ?auto_88889 ) ) ( ON ?auto_88889 ?auto_88893 ) ( not ( = ?auto_88886 ?auto_88893 ) ) ( not ( = ?auto_88887 ?auto_88893 ) ) ( not ( = ?auto_88888 ?auto_88893 ) ) ( not ( = ?auto_88890 ?auto_88893 ) ) ( not ( = ?auto_88891 ?auto_88893 ) ) ( not ( = ?auto_88892 ?auto_88893 ) ) ( not ( = ?auto_88889 ?auto_88893 ) ) ( ON ?auto_88892 ?auto_88889 ) ( ON-TABLE ?auto_88893 ) ( ON ?auto_88891 ?auto_88892 ) ( ON ?auto_88890 ?auto_88891 ) ( ON ?auto_88888 ?auto_88890 ) ( ON ?auto_88887 ?auto_88888 ) ( CLEAR ?auto_88887 ) ( HOLDING ?auto_88886 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88886 )
      ( MAKE-3PILE ?auto_88886 ?auto_88887 ?auto_88888 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88894 - BLOCK
      ?auto_88895 - BLOCK
      ?auto_88896 - BLOCK
    )
    :vars
    (
      ?auto_88900 - BLOCK
      ?auto_88901 - BLOCK
      ?auto_88898 - BLOCK
      ?auto_88899 - BLOCK
      ?auto_88897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88894 ?auto_88895 ) ) ( not ( = ?auto_88894 ?auto_88896 ) ) ( not ( = ?auto_88894 ?auto_88900 ) ) ( not ( = ?auto_88895 ?auto_88896 ) ) ( not ( = ?auto_88895 ?auto_88900 ) ) ( not ( = ?auto_88896 ?auto_88900 ) ) ( not ( = ?auto_88894 ?auto_88901 ) ) ( not ( = ?auto_88894 ?auto_88898 ) ) ( not ( = ?auto_88895 ?auto_88901 ) ) ( not ( = ?auto_88895 ?auto_88898 ) ) ( not ( = ?auto_88896 ?auto_88901 ) ) ( not ( = ?auto_88896 ?auto_88898 ) ) ( not ( = ?auto_88900 ?auto_88901 ) ) ( not ( = ?auto_88900 ?auto_88898 ) ) ( not ( = ?auto_88901 ?auto_88898 ) ) ( not ( = ?auto_88899 ?auto_88898 ) ) ( not ( = ?auto_88894 ?auto_88899 ) ) ( not ( = ?auto_88895 ?auto_88899 ) ) ( not ( = ?auto_88896 ?auto_88899 ) ) ( not ( = ?auto_88900 ?auto_88899 ) ) ( not ( = ?auto_88901 ?auto_88899 ) ) ( ON ?auto_88899 ?auto_88897 ) ( not ( = ?auto_88894 ?auto_88897 ) ) ( not ( = ?auto_88895 ?auto_88897 ) ) ( not ( = ?auto_88896 ?auto_88897 ) ) ( not ( = ?auto_88900 ?auto_88897 ) ) ( not ( = ?auto_88901 ?auto_88897 ) ) ( not ( = ?auto_88898 ?auto_88897 ) ) ( not ( = ?auto_88899 ?auto_88897 ) ) ( ON ?auto_88898 ?auto_88899 ) ( ON-TABLE ?auto_88897 ) ( ON ?auto_88901 ?auto_88898 ) ( ON ?auto_88900 ?auto_88901 ) ( ON ?auto_88896 ?auto_88900 ) ( ON ?auto_88895 ?auto_88896 ) ( ON ?auto_88894 ?auto_88895 ) ( CLEAR ?auto_88894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88897 ?auto_88899 ?auto_88898 ?auto_88901 ?auto_88900 ?auto_88896 ?auto_88895 )
      ( MAKE-3PILE ?auto_88894 ?auto_88895 ?auto_88896 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88906 - BLOCK
      ?auto_88907 - BLOCK
      ?auto_88908 - BLOCK
      ?auto_88909 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_88909 ) ( CLEAR ?auto_88908 ) ( ON-TABLE ?auto_88906 ) ( ON ?auto_88907 ?auto_88906 ) ( ON ?auto_88908 ?auto_88907 ) ( not ( = ?auto_88906 ?auto_88907 ) ) ( not ( = ?auto_88906 ?auto_88908 ) ) ( not ( = ?auto_88906 ?auto_88909 ) ) ( not ( = ?auto_88907 ?auto_88908 ) ) ( not ( = ?auto_88907 ?auto_88909 ) ) ( not ( = ?auto_88908 ?auto_88909 ) ) )
    :subtasks
    ( ( !STACK ?auto_88909 ?auto_88908 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88910 - BLOCK
      ?auto_88911 - BLOCK
      ?auto_88912 - BLOCK
      ?auto_88913 - BLOCK
    )
    :vars
    (
      ?auto_88914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_88912 ) ( ON-TABLE ?auto_88910 ) ( ON ?auto_88911 ?auto_88910 ) ( ON ?auto_88912 ?auto_88911 ) ( not ( = ?auto_88910 ?auto_88911 ) ) ( not ( = ?auto_88910 ?auto_88912 ) ) ( not ( = ?auto_88910 ?auto_88913 ) ) ( not ( = ?auto_88911 ?auto_88912 ) ) ( not ( = ?auto_88911 ?auto_88913 ) ) ( not ( = ?auto_88912 ?auto_88913 ) ) ( ON ?auto_88913 ?auto_88914 ) ( CLEAR ?auto_88913 ) ( HAND-EMPTY ) ( not ( = ?auto_88910 ?auto_88914 ) ) ( not ( = ?auto_88911 ?auto_88914 ) ) ( not ( = ?auto_88912 ?auto_88914 ) ) ( not ( = ?auto_88913 ?auto_88914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88913 ?auto_88914 )
      ( MAKE-4PILE ?auto_88910 ?auto_88911 ?auto_88912 ?auto_88913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88915 - BLOCK
      ?auto_88916 - BLOCK
      ?auto_88917 - BLOCK
      ?auto_88918 - BLOCK
    )
    :vars
    (
      ?auto_88919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88915 ) ( ON ?auto_88916 ?auto_88915 ) ( not ( = ?auto_88915 ?auto_88916 ) ) ( not ( = ?auto_88915 ?auto_88917 ) ) ( not ( = ?auto_88915 ?auto_88918 ) ) ( not ( = ?auto_88916 ?auto_88917 ) ) ( not ( = ?auto_88916 ?auto_88918 ) ) ( not ( = ?auto_88917 ?auto_88918 ) ) ( ON ?auto_88918 ?auto_88919 ) ( CLEAR ?auto_88918 ) ( not ( = ?auto_88915 ?auto_88919 ) ) ( not ( = ?auto_88916 ?auto_88919 ) ) ( not ( = ?auto_88917 ?auto_88919 ) ) ( not ( = ?auto_88918 ?auto_88919 ) ) ( HOLDING ?auto_88917 ) ( CLEAR ?auto_88916 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88915 ?auto_88916 ?auto_88917 )
      ( MAKE-4PILE ?auto_88915 ?auto_88916 ?auto_88917 ?auto_88918 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88920 - BLOCK
      ?auto_88921 - BLOCK
      ?auto_88922 - BLOCK
      ?auto_88923 - BLOCK
    )
    :vars
    (
      ?auto_88924 - BLOCK
      ?auto_88926 - BLOCK
      ?auto_88925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88920 ) ( ON ?auto_88921 ?auto_88920 ) ( not ( = ?auto_88920 ?auto_88921 ) ) ( not ( = ?auto_88920 ?auto_88922 ) ) ( not ( = ?auto_88920 ?auto_88923 ) ) ( not ( = ?auto_88921 ?auto_88922 ) ) ( not ( = ?auto_88921 ?auto_88923 ) ) ( not ( = ?auto_88922 ?auto_88923 ) ) ( ON ?auto_88923 ?auto_88924 ) ( not ( = ?auto_88920 ?auto_88924 ) ) ( not ( = ?auto_88921 ?auto_88924 ) ) ( not ( = ?auto_88922 ?auto_88924 ) ) ( not ( = ?auto_88923 ?auto_88924 ) ) ( CLEAR ?auto_88921 ) ( ON ?auto_88922 ?auto_88923 ) ( CLEAR ?auto_88922 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88926 ) ( ON ?auto_88925 ?auto_88926 ) ( ON ?auto_88924 ?auto_88925 ) ( not ( = ?auto_88926 ?auto_88925 ) ) ( not ( = ?auto_88926 ?auto_88924 ) ) ( not ( = ?auto_88926 ?auto_88923 ) ) ( not ( = ?auto_88926 ?auto_88922 ) ) ( not ( = ?auto_88925 ?auto_88924 ) ) ( not ( = ?auto_88925 ?auto_88923 ) ) ( not ( = ?auto_88925 ?auto_88922 ) ) ( not ( = ?auto_88920 ?auto_88926 ) ) ( not ( = ?auto_88920 ?auto_88925 ) ) ( not ( = ?auto_88921 ?auto_88926 ) ) ( not ( = ?auto_88921 ?auto_88925 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88926 ?auto_88925 ?auto_88924 ?auto_88923 )
      ( MAKE-4PILE ?auto_88920 ?auto_88921 ?auto_88922 ?auto_88923 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88927 - BLOCK
      ?auto_88928 - BLOCK
      ?auto_88929 - BLOCK
      ?auto_88930 - BLOCK
    )
    :vars
    (
      ?auto_88931 - BLOCK
      ?auto_88932 - BLOCK
      ?auto_88933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88927 ) ( not ( = ?auto_88927 ?auto_88928 ) ) ( not ( = ?auto_88927 ?auto_88929 ) ) ( not ( = ?auto_88927 ?auto_88930 ) ) ( not ( = ?auto_88928 ?auto_88929 ) ) ( not ( = ?auto_88928 ?auto_88930 ) ) ( not ( = ?auto_88929 ?auto_88930 ) ) ( ON ?auto_88930 ?auto_88931 ) ( not ( = ?auto_88927 ?auto_88931 ) ) ( not ( = ?auto_88928 ?auto_88931 ) ) ( not ( = ?auto_88929 ?auto_88931 ) ) ( not ( = ?auto_88930 ?auto_88931 ) ) ( ON ?auto_88929 ?auto_88930 ) ( CLEAR ?auto_88929 ) ( ON-TABLE ?auto_88932 ) ( ON ?auto_88933 ?auto_88932 ) ( ON ?auto_88931 ?auto_88933 ) ( not ( = ?auto_88932 ?auto_88933 ) ) ( not ( = ?auto_88932 ?auto_88931 ) ) ( not ( = ?auto_88932 ?auto_88930 ) ) ( not ( = ?auto_88932 ?auto_88929 ) ) ( not ( = ?auto_88933 ?auto_88931 ) ) ( not ( = ?auto_88933 ?auto_88930 ) ) ( not ( = ?auto_88933 ?auto_88929 ) ) ( not ( = ?auto_88927 ?auto_88932 ) ) ( not ( = ?auto_88927 ?auto_88933 ) ) ( not ( = ?auto_88928 ?auto_88932 ) ) ( not ( = ?auto_88928 ?auto_88933 ) ) ( HOLDING ?auto_88928 ) ( CLEAR ?auto_88927 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88927 ?auto_88928 )
      ( MAKE-4PILE ?auto_88927 ?auto_88928 ?auto_88929 ?auto_88930 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88934 - BLOCK
      ?auto_88935 - BLOCK
      ?auto_88936 - BLOCK
      ?auto_88937 - BLOCK
    )
    :vars
    (
      ?auto_88939 - BLOCK
      ?auto_88940 - BLOCK
      ?auto_88938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88934 ) ( not ( = ?auto_88934 ?auto_88935 ) ) ( not ( = ?auto_88934 ?auto_88936 ) ) ( not ( = ?auto_88934 ?auto_88937 ) ) ( not ( = ?auto_88935 ?auto_88936 ) ) ( not ( = ?auto_88935 ?auto_88937 ) ) ( not ( = ?auto_88936 ?auto_88937 ) ) ( ON ?auto_88937 ?auto_88939 ) ( not ( = ?auto_88934 ?auto_88939 ) ) ( not ( = ?auto_88935 ?auto_88939 ) ) ( not ( = ?auto_88936 ?auto_88939 ) ) ( not ( = ?auto_88937 ?auto_88939 ) ) ( ON ?auto_88936 ?auto_88937 ) ( ON-TABLE ?auto_88940 ) ( ON ?auto_88938 ?auto_88940 ) ( ON ?auto_88939 ?auto_88938 ) ( not ( = ?auto_88940 ?auto_88938 ) ) ( not ( = ?auto_88940 ?auto_88939 ) ) ( not ( = ?auto_88940 ?auto_88937 ) ) ( not ( = ?auto_88940 ?auto_88936 ) ) ( not ( = ?auto_88938 ?auto_88939 ) ) ( not ( = ?auto_88938 ?auto_88937 ) ) ( not ( = ?auto_88938 ?auto_88936 ) ) ( not ( = ?auto_88934 ?auto_88940 ) ) ( not ( = ?auto_88934 ?auto_88938 ) ) ( not ( = ?auto_88935 ?auto_88940 ) ) ( not ( = ?auto_88935 ?auto_88938 ) ) ( CLEAR ?auto_88934 ) ( ON ?auto_88935 ?auto_88936 ) ( CLEAR ?auto_88935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88940 ?auto_88938 ?auto_88939 ?auto_88937 ?auto_88936 )
      ( MAKE-4PILE ?auto_88934 ?auto_88935 ?auto_88936 ?auto_88937 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88941 - BLOCK
      ?auto_88942 - BLOCK
      ?auto_88943 - BLOCK
      ?auto_88944 - BLOCK
    )
    :vars
    (
      ?auto_88945 - BLOCK
      ?auto_88946 - BLOCK
      ?auto_88947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88941 ?auto_88942 ) ) ( not ( = ?auto_88941 ?auto_88943 ) ) ( not ( = ?auto_88941 ?auto_88944 ) ) ( not ( = ?auto_88942 ?auto_88943 ) ) ( not ( = ?auto_88942 ?auto_88944 ) ) ( not ( = ?auto_88943 ?auto_88944 ) ) ( ON ?auto_88944 ?auto_88945 ) ( not ( = ?auto_88941 ?auto_88945 ) ) ( not ( = ?auto_88942 ?auto_88945 ) ) ( not ( = ?auto_88943 ?auto_88945 ) ) ( not ( = ?auto_88944 ?auto_88945 ) ) ( ON ?auto_88943 ?auto_88944 ) ( ON-TABLE ?auto_88946 ) ( ON ?auto_88947 ?auto_88946 ) ( ON ?auto_88945 ?auto_88947 ) ( not ( = ?auto_88946 ?auto_88947 ) ) ( not ( = ?auto_88946 ?auto_88945 ) ) ( not ( = ?auto_88946 ?auto_88944 ) ) ( not ( = ?auto_88946 ?auto_88943 ) ) ( not ( = ?auto_88947 ?auto_88945 ) ) ( not ( = ?auto_88947 ?auto_88944 ) ) ( not ( = ?auto_88947 ?auto_88943 ) ) ( not ( = ?auto_88941 ?auto_88946 ) ) ( not ( = ?auto_88941 ?auto_88947 ) ) ( not ( = ?auto_88942 ?auto_88946 ) ) ( not ( = ?auto_88942 ?auto_88947 ) ) ( ON ?auto_88942 ?auto_88943 ) ( CLEAR ?auto_88942 ) ( HOLDING ?auto_88941 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88941 )
      ( MAKE-4PILE ?auto_88941 ?auto_88942 ?auto_88943 ?auto_88944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88948 - BLOCK
      ?auto_88949 - BLOCK
      ?auto_88950 - BLOCK
      ?auto_88951 - BLOCK
    )
    :vars
    (
      ?auto_88954 - BLOCK
      ?auto_88953 - BLOCK
      ?auto_88952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88948 ?auto_88949 ) ) ( not ( = ?auto_88948 ?auto_88950 ) ) ( not ( = ?auto_88948 ?auto_88951 ) ) ( not ( = ?auto_88949 ?auto_88950 ) ) ( not ( = ?auto_88949 ?auto_88951 ) ) ( not ( = ?auto_88950 ?auto_88951 ) ) ( ON ?auto_88951 ?auto_88954 ) ( not ( = ?auto_88948 ?auto_88954 ) ) ( not ( = ?auto_88949 ?auto_88954 ) ) ( not ( = ?auto_88950 ?auto_88954 ) ) ( not ( = ?auto_88951 ?auto_88954 ) ) ( ON ?auto_88950 ?auto_88951 ) ( ON-TABLE ?auto_88953 ) ( ON ?auto_88952 ?auto_88953 ) ( ON ?auto_88954 ?auto_88952 ) ( not ( = ?auto_88953 ?auto_88952 ) ) ( not ( = ?auto_88953 ?auto_88954 ) ) ( not ( = ?auto_88953 ?auto_88951 ) ) ( not ( = ?auto_88953 ?auto_88950 ) ) ( not ( = ?auto_88952 ?auto_88954 ) ) ( not ( = ?auto_88952 ?auto_88951 ) ) ( not ( = ?auto_88952 ?auto_88950 ) ) ( not ( = ?auto_88948 ?auto_88953 ) ) ( not ( = ?auto_88948 ?auto_88952 ) ) ( not ( = ?auto_88949 ?auto_88953 ) ) ( not ( = ?auto_88949 ?auto_88952 ) ) ( ON ?auto_88949 ?auto_88950 ) ( ON ?auto_88948 ?auto_88949 ) ( CLEAR ?auto_88948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88953 ?auto_88952 ?auto_88954 ?auto_88951 ?auto_88950 ?auto_88949 )
      ( MAKE-4PILE ?auto_88948 ?auto_88949 ?auto_88950 ?auto_88951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88955 - BLOCK
      ?auto_88956 - BLOCK
      ?auto_88957 - BLOCK
      ?auto_88958 - BLOCK
    )
    :vars
    (
      ?auto_88960 - BLOCK
      ?auto_88961 - BLOCK
      ?auto_88959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88955 ?auto_88956 ) ) ( not ( = ?auto_88955 ?auto_88957 ) ) ( not ( = ?auto_88955 ?auto_88958 ) ) ( not ( = ?auto_88956 ?auto_88957 ) ) ( not ( = ?auto_88956 ?auto_88958 ) ) ( not ( = ?auto_88957 ?auto_88958 ) ) ( ON ?auto_88958 ?auto_88960 ) ( not ( = ?auto_88955 ?auto_88960 ) ) ( not ( = ?auto_88956 ?auto_88960 ) ) ( not ( = ?auto_88957 ?auto_88960 ) ) ( not ( = ?auto_88958 ?auto_88960 ) ) ( ON ?auto_88957 ?auto_88958 ) ( ON-TABLE ?auto_88961 ) ( ON ?auto_88959 ?auto_88961 ) ( ON ?auto_88960 ?auto_88959 ) ( not ( = ?auto_88961 ?auto_88959 ) ) ( not ( = ?auto_88961 ?auto_88960 ) ) ( not ( = ?auto_88961 ?auto_88958 ) ) ( not ( = ?auto_88961 ?auto_88957 ) ) ( not ( = ?auto_88959 ?auto_88960 ) ) ( not ( = ?auto_88959 ?auto_88958 ) ) ( not ( = ?auto_88959 ?auto_88957 ) ) ( not ( = ?auto_88955 ?auto_88961 ) ) ( not ( = ?auto_88955 ?auto_88959 ) ) ( not ( = ?auto_88956 ?auto_88961 ) ) ( not ( = ?auto_88956 ?auto_88959 ) ) ( ON ?auto_88956 ?auto_88957 ) ( HOLDING ?auto_88955 ) ( CLEAR ?auto_88956 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88961 ?auto_88959 ?auto_88960 ?auto_88958 ?auto_88957 ?auto_88956 ?auto_88955 )
      ( MAKE-4PILE ?auto_88955 ?auto_88956 ?auto_88957 ?auto_88958 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88962 - BLOCK
      ?auto_88963 - BLOCK
      ?auto_88964 - BLOCK
      ?auto_88965 - BLOCK
    )
    :vars
    (
      ?auto_88966 - BLOCK
      ?auto_88967 - BLOCK
      ?auto_88968 - BLOCK
      ?auto_88969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88962 ?auto_88963 ) ) ( not ( = ?auto_88962 ?auto_88964 ) ) ( not ( = ?auto_88962 ?auto_88965 ) ) ( not ( = ?auto_88963 ?auto_88964 ) ) ( not ( = ?auto_88963 ?auto_88965 ) ) ( not ( = ?auto_88964 ?auto_88965 ) ) ( ON ?auto_88965 ?auto_88966 ) ( not ( = ?auto_88962 ?auto_88966 ) ) ( not ( = ?auto_88963 ?auto_88966 ) ) ( not ( = ?auto_88964 ?auto_88966 ) ) ( not ( = ?auto_88965 ?auto_88966 ) ) ( ON ?auto_88964 ?auto_88965 ) ( ON-TABLE ?auto_88967 ) ( ON ?auto_88968 ?auto_88967 ) ( ON ?auto_88966 ?auto_88968 ) ( not ( = ?auto_88967 ?auto_88968 ) ) ( not ( = ?auto_88967 ?auto_88966 ) ) ( not ( = ?auto_88967 ?auto_88965 ) ) ( not ( = ?auto_88967 ?auto_88964 ) ) ( not ( = ?auto_88968 ?auto_88966 ) ) ( not ( = ?auto_88968 ?auto_88965 ) ) ( not ( = ?auto_88968 ?auto_88964 ) ) ( not ( = ?auto_88962 ?auto_88967 ) ) ( not ( = ?auto_88962 ?auto_88968 ) ) ( not ( = ?auto_88963 ?auto_88967 ) ) ( not ( = ?auto_88963 ?auto_88968 ) ) ( ON ?auto_88963 ?auto_88964 ) ( CLEAR ?auto_88963 ) ( ON ?auto_88962 ?auto_88969 ) ( CLEAR ?auto_88962 ) ( HAND-EMPTY ) ( not ( = ?auto_88962 ?auto_88969 ) ) ( not ( = ?auto_88963 ?auto_88969 ) ) ( not ( = ?auto_88964 ?auto_88969 ) ) ( not ( = ?auto_88965 ?auto_88969 ) ) ( not ( = ?auto_88966 ?auto_88969 ) ) ( not ( = ?auto_88967 ?auto_88969 ) ) ( not ( = ?auto_88968 ?auto_88969 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88962 ?auto_88969 )
      ( MAKE-4PILE ?auto_88962 ?auto_88963 ?auto_88964 ?auto_88965 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88970 - BLOCK
      ?auto_88971 - BLOCK
      ?auto_88972 - BLOCK
      ?auto_88973 - BLOCK
    )
    :vars
    (
      ?auto_88977 - BLOCK
      ?auto_88975 - BLOCK
      ?auto_88976 - BLOCK
      ?auto_88974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88970 ?auto_88971 ) ) ( not ( = ?auto_88970 ?auto_88972 ) ) ( not ( = ?auto_88970 ?auto_88973 ) ) ( not ( = ?auto_88971 ?auto_88972 ) ) ( not ( = ?auto_88971 ?auto_88973 ) ) ( not ( = ?auto_88972 ?auto_88973 ) ) ( ON ?auto_88973 ?auto_88977 ) ( not ( = ?auto_88970 ?auto_88977 ) ) ( not ( = ?auto_88971 ?auto_88977 ) ) ( not ( = ?auto_88972 ?auto_88977 ) ) ( not ( = ?auto_88973 ?auto_88977 ) ) ( ON ?auto_88972 ?auto_88973 ) ( ON-TABLE ?auto_88975 ) ( ON ?auto_88976 ?auto_88975 ) ( ON ?auto_88977 ?auto_88976 ) ( not ( = ?auto_88975 ?auto_88976 ) ) ( not ( = ?auto_88975 ?auto_88977 ) ) ( not ( = ?auto_88975 ?auto_88973 ) ) ( not ( = ?auto_88975 ?auto_88972 ) ) ( not ( = ?auto_88976 ?auto_88977 ) ) ( not ( = ?auto_88976 ?auto_88973 ) ) ( not ( = ?auto_88976 ?auto_88972 ) ) ( not ( = ?auto_88970 ?auto_88975 ) ) ( not ( = ?auto_88970 ?auto_88976 ) ) ( not ( = ?auto_88971 ?auto_88975 ) ) ( not ( = ?auto_88971 ?auto_88976 ) ) ( ON ?auto_88970 ?auto_88974 ) ( CLEAR ?auto_88970 ) ( not ( = ?auto_88970 ?auto_88974 ) ) ( not ( = ?auto_88971 ?auto_88974 ) ) ( not ( = ?auto_88972 ?auto_88974 ) ) ( not ( = ?auto_88973 ?auto_88974 ) ) ( not ( = ?auto_88977 ?auto_88974 ) ) ( not ( = ?auto_88975 ?auto_88974 ) ) ( not ( = ?auto_88976 ?auto_88974 ) ) ( HOLDING ?auto_88971 ) ( CLEAR ?auto_88972 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88975 ?auto_88976 ?auto_88977 ?auto_88973 ?auto_88972 ?auto_88971 )
      ( MAKE-4PILE ?auto_88970 ?auto_88971 ?auto_88972 ?auto_88973 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88978 - BLOCK
      ?auto_88979 - BLOCK
      ?auto_88980 - BLOCK
      ?auto_88981 - BLOCK
    )
    :vars
    (
      ?auto_88983 - BLOCK
      ?auto_88985 - BLOCK
      ?auto_88982 - BLOCK
      ?auto_88984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88978 ?auto_88979 ) ) ( not ( = ?auto_88978 ?auto_88980 ) ) ( not ( = ?auto_88978 ?auto_88981 ) ) ( not ( = ?auto_88979 ?auto_88980 ) ) ( not ( = ?auto_88979 ?auto_88981 ) ) ( not ( = ?auto_88980 ?auto_88981 ) ) ( ON ?auto_88981 ?auto_88983 ) ( not ( = ?auto_88978 ?auto_88983 ) ) ( not ( = ?auto_88979 ?auto_88983 ) ) ( not ( = ?auto_88980 ?auto_88983 ) ) ( not ( = ?auto_88981 ?auto_88983 ) ) ( ON ?auto_88980 ?auto_88981 ) ( ON-TABLE ?auto_88985 ) ( ON ?auto_88982 ?auto_88985 ) ( ON ?auto_88983 ?auto_88982 ) ( not ( = ?auto_88985 ?auto_88982 ) ) ( not ( = ?auto_88985 ?auto_88983 ) ) ( not ( = ?auto_88985 ?auto_88981 ) ) ( not ( = ?auto_88985 ?auto_88980 ) ) ( not ( = ?auto_88982 ?auto_88983 ) ) ( not ( = ?auto_88982 ?auto_88981 ) ) ( not ( = ?auto_88982 ?auto_88980 ) ) ( not ( = ?auto_88978 ?auto_88985 ) ) ( not ( = ?auto_88978 ?auto_88982 ) ) ( not ( = ?auto_88979 ?auto_88985 ) ) ( not ( = ?auto_88979 ?auto_88982 ) ) ( ON ?auto_88978 ?auto_88984 ) ( not ( = ?auto_88978 ?auto_88984 ) ) ( not ( = ?auto_88979 ?auto_88984 ) ) ( not ( = ?auto_88980 ?auto_88984 ) ) ( not ( = ?auto_88981 ?auto_88984 ) ) ( not ( = ?auto_88983 ?auto_88984 ) ) ( not ( = ?auto_88985 ?auto_88984 ) ) ( not ( = ?auto_88982 ?auto_88984 ) ) ( CLEAR ?auto_88980 ) ( ON ?auto_88979 ?auto_88978 ) ( CLEAR ?auto_88979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88984 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88984 ?auto_88978 )
      ( MAKE-4PILE ?auto_88978 ?auto_88979 ?auto_88980 ?auto_88981 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88986 - BLOCK
      ?auto_88987 - BLOCK
      ?auto_88988 - BLOCK
      ?auto_88989 - BLOCK
    )
    :vars
    (
      ?auto_88991 - BLOCK
      ?auto_88993 - BLOCK
      ?auto_88992 - BLOCK
      ?auto_88990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88986 ?auto_88987 ) ) ( not ( = ?auto_88986 ?auto_88988 ) ) ( not ( = ?auto_88986 ?auto_88989 ) ) ( not ( = ?auto_88987 ?auto_88988 ) ) ( not ( = ?auto_88987 ?auto_88989 ) ) ( not ( = ?auto_88988 ?auto_88989 ) ) ( ON ?auto_88989 ?auto_88991 ) ( not ( = ?auto_88986 ?auto_88991 ) ) ( not ( = ?auto_88987 ?auto_88991 ) ) ( not ( = ?auto_88988 ?auto_88991 ) ) ( not ( = ?auto_88989 ?auto_88991 ) ) ( ON-TABLE ?auto_88993 ) ( ON ?auto_88992 ?auto_88993 ) ( ON ?auto_88991 ?auto_88992 ) ( not ( = ?auto_88993 ?auto_88992 ) ) ( not ( = ?auto_88993 ?auto_88991 ) ) ( not ( = ?auto_88993 ?auto_88989 ) ) ( not ( = ?auto_88993 ?auto_88988 ) ) ( not ( = ?auto_88992 ?auto_88991 ) ) ( not ( = ?auto_88992 ?auto_88989 ) ) ( not ( = ?auto_88992 ?auto_88988 ) ) ( not ( = ?auto_88986 ?auto_88993 ) ) ( not ( = ?auto_88986 ?auto_88992 ) ) ( not ( = ?auto_88987 ?auto_88993 ) ) ( not ( = ?auto_88987 ?auto_88992 ) ) ( ON ?auto_88986 ?auto_88990 ) ( not ( = ?auto_88986 ?auto_88990 ) ) ( not ( = ?auto_88987 ?auto_88990 ) ) ( not ( = ?auto_88988 ?auto_88990 ) ) ( not ( = ?auto_88989 ?auto_88990 ) ) ( not ( = ?auto_88991 ?auto_88990 ) ) ( not ( = ?auto_88993 ?auto_88990 ) ) ( not ( = ?auto_88992 ?auto_88990 ) ) ( ON ?auto_88987 ?auto_88986 ) ( CLEAR ?auto_88987 ) ( ON-TABLE ?auto_88990 ) ( HOLDING ?auto_88988 ) ( CLEAR ?auto_88989 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88993 ?auto_88992 ?auto_88991 ?auto_88989 ?auto_88988 )
      ( MAKE-4PILE ?auto_88986 ?auto_88987 ?auto_88988 ?auto_88989 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88994 - BLOCK
      ?auto_88995 - BLOCK
      ?auto_88996 - BLOCK
      ?auto_88997 - BLOCK
    )
    :vars
    (
      ?auto_89000 - BLOCK
      ?auto_88998 - BLOCK
      ?auto_89001 - BLOCK
      ?auto_88999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88994 ?auto_88995 ) ) ( not ( = ?auto_88994 ?auto_88996 ) ) ( not ( = ?auto_88994 ?auto_88997 ) ) ( not ( = ?auto_88995 ?auto_88996 ) ) ( not ( = ?auto_88995 ?auto_88997 ) ) ( not ( = ?auto_88996 ?auto_88997 ) ) ( ON ?auto_88997 ?auto_89000 ) ( not ( = ?auto_88994 ?auto_89000 ) ) ( not ( = ?auto_88995 ?auto_89000 ) ) ( not ( = ?auto_88996 ?auto_89000 ) ) ( not ( = ?auto_88997 ?auto_89000 ) ) ( ON-TABLE ?auto_88998 ) ( ON ?auto_89001 ?auto_88998 ) ( ON ?auto_89000 ?auto_89001 ) ( not ( = ?auto_88998 ?auto_89001 ) ) ( not ( = ?auto_88998 ?auto_89000 ) ) ( not ( = ?auto_88998 ?auto_88997 ) ) ( not ( = ?auto_88998 ?auto_88996 ) ) ( not ( = ?auto_89001 ?auto_89000 ) ) ( not ( = ?auto_89001 ?auto_88997 ) ) ( not ( = ?auto_89001 ?auto_88996 ) ) ( not ( = ?auto_88994 ?auto_88998 ) ) ( not ( = ?auto_88994 ?auto_89001 ) ) ( not ( = ?auto_88995 ?auto_88998 ) ) ( not ( = ?auto_88995 ?auto_89001 ) ) ( ON ?auto_88994 ?auto_88999 ) ( not ( = ?auto_88994 ?auto_88999 ) ) ( not ( = ?auto_88995 ?auto_88999 ) ) ( not ( = ?auto_88996 ?auto_88999 ) ) ( not ( = ?auto_88997 ?auto_88999 ) ) ( not ( = ?auto_89000 ?auto_88999 ) ) ( not ( = ?auto_88998 ?auto_88999 ) ) ( not ( = ?auto_89001 ?auto_88999 ) ) ( ON ?auto_88995 ?auto_88994 ) ( ON-TABLE ?auto_88999 ) ( CLEAR ?auto_88997 ) ( ON ?auto_88996 ?auto_88995 ) ( CLEAR ?auto_88996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88999 ?auto_88994 ?auto_88995 )
      ( MAKE-4PILE ?auto_88994 ?auto_88995 ?auto_88996 ?auto_88997 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89002 - BLOCK
      ?auto_89003 - BLOCK
      ?auto_89004 - BLOCK
      ?auto_89005 - BLOCK
    )
    :vars
    (
      ?auto_89009 - BLOCK
      ?auto_89006 - BLOCK
      ?auto_89008 - BLOCK
      ?auto_89007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89002 ?auto_89003 ) ) ( not ( = ?auto_89002 ?auto_89004 ) ) ( not ( = ?auto_89002 ?auto_89005 ) ) ( not ( = ?auto_89003 ?auto_89004 ) ) ( not ( = ?auto_89003 ?auto_89005 ) ) ( not ( = ?auto_89004 ?auto_89005 ) ) ( not ( = ?auto_89002 ?auto_89009 ) ) ( not ( = ?auto_89003 ?auto_89009 ) ) ( not ( = ?auto_89004 ?auto_89009 ) ) ( not ( = ?auto_89005 ?auto_89009 ) ) ( ON-TABLE ?auto_89006 ) ( ON ?auto_89008 ?auto_89006 ) ( ON ?auto_89009 ?auto_89008 ) ( not ( = ?auto_89006 ?auto_89008 ) ) ( not ( = ?auto_89006 ?auto_89009 ) ) ( not ( = ?auto_89006 ?auto_89005 ) ) ( not ( = ?auto_89006 ?auto_89004 ) ) ( not ( = ?auto_89008 ?auto_89009 ) ) ( not ( = ?auto_89008 ?auto_89005 ) ) ( not ( = ?auto_89008 ?auto_89004 ) ) ( not ( = ?auto_89002 ?auto_89006 ) ) ( not ( = ?auto_89002 ?auto_89008 ) ) ( not ( = ?auto_89003 ?auto_89006 ) ) ( not ( = ?auto_89003 ?auto_89008 ) ) ( ON ?auto_89002 ?auto_89007 ) ( not ( = ?auto_89002 ?auto_89007 ) ) ( not ( = ?auto_89003 ?auto_89007 ) ) ( not ( = ?auto_89004 ?auto_89007 ) ) ( not ( = ?auto_89005 ?auto_89007 ) ) ( not ( = ?auto_89009 ?auto_89007 ) ) ( not ( = ?auto_89006 ?auto_89007 ) ) ( not ( = ?auto_89008 ?auto_89007 ) ) ( ON ?auto_89003 ?auto_89002 ) ( ON-TABLE ?auto_89007 ) ( ON ?auto_89004 ?auto_89003 ) ( CLEAR ?auto_89004 ) ( HOLDING ?auto_89005 ) ( CLEAR ?auto_89009 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89006 ?auto_89008 ?auto_89009 ?auto_89005 )
      ( MAKE-4PILE ?auto_89002 ?auto_89003 ?auto_89004 ?auto_89005 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89010 - BLOCK
      ?auto_89011 - BLOCK
      ?auto_89012 - BLOCK
      ?auto_89013 - BLOCK
    )
    :vars
    (
      ?auto_89014 - BLOCK
      ?auto_89016 - BLOCK
      ?auto_89017 - BLOCK
      ?auto_89015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89010 ?auto_89011 ) ) ( not ( = ?auto_89010 ?auto_89012 ) ) ( not ( = ?auto_89010 ?auto_89013 ) ) ( not ( = ?auto_89011 ?auto_89012 ) ) ( not ( = ?auto_89011 ?auto_89013 ) ) ( not ( = ?auto_89012 ?auto_89013 ) ) ( not ( = ?auto_89010 ?auto_89014 ) ) ( not ( = ?auto_89011 ?auto_89014 ) ) ( not ( = ?auto_89012 ?auto_89014 ) ) ( not ( = ?auto_89013 ?auto_89014 ) ) ( ON-TABLE ?auto_89016 ) ( ON ?auto_89017 ?auto_89016 ) ( ON ?auto_89014 ?auto_89017 ) ( not ( = ?auto_89016 ?auto_89017 ) ) ( not ( = ?auto_89016 ?auto_89014 ) ) ( not ( = ?auto_89016 ?auto_89013 ) ) ( not ( = ?auto_89016 ?auto_89012 ) ) ( not ( = ?auto_89017 ?auto_89014 ) ) ( not ( = ?auto_89017 ?auto_89013 ) ) ( not ( = ?auto_89017 ?auto_89012 ) ) ( not ( = ?auto_89010 ?auto_89016 ) ) ( not ( = ?auto_89010 ?auto_89017 ) ) ( not ( = ?auto_89011 ?auto_89016 ) ) ( not ( = ?auto_89011 ?auto_89017 ) ) ( ON ?auto_89010 ?auto_89015 ) ( not ( = ?auto_89010 ?auto_89015 ) ) ( not ( = ?auto_89011 ?auto_89015 ) ) ( not ( = ?auto_89012 ?auto_89015 ) ) ( not ( = ?auto_89013 ?auto_89015 ) ) ( not ( = ?auto_89014 ?auto_89015 ) ) ( not ( = ?auto_89016 ?auto_89015 ) ) ( not ( = ?auto_89017 ?auto_89015 ) ) ( ON ?auto_89011 ?auto_89010 ) ( ON-TABLE ?auto_89015 ) ( ON ?auto_89012 ?auto_89011 ) ( CLEAR ?auto_89014 ) ( ON ?auto_89013 ?auto_89012 ) ( CLEAR ?auto_89013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89015 ?auto_89010 ?auto_89011 ?auto_89012 )
      ( MAKE-4PILE ?auto_89010 ?auto_89011 ?auto_89012 ?auto_89013 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89018 - BLOCK
      ?auto_89019 - BLOCK
      ?auto_89020 - BLOCK
      ?auto_89021 - BLOCK
    )
    :vars
    (
      ?auto_89024 - BLOCK
      ?auto_89023 - BLOCK
      ?auto_89022 - BLOCK
      ?auto_89025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89018 ?auto_89019 ) ) ( not ( = ?auto_89018 ?auto_89020 ) ) ( not ( = ?auto_89018 ?auto_89021 ) ) ( not ( = ?auto_89019 ?auto_89020 ) ) ( not ( = ?auto_89019 ?auto_89021 ) ) ( not ( = ?auto_89020 ?auto_89021 ) ) ( not ( = ?auto_89018 ?auto_89024 ) ) ( not ( = ?auto_89019 ?auto_89024 ) ) ( not ( = ?auto_89020 ?auto_89024 ) ) ( not ( = ?auto_89021 ?auto_89024 ) ) ( ON-TABLE ?auto_89023 ) ( ON ?auto_89022 ?auto_89023 ) ( not ( = ?auto_89023 ?auto_89022 ) ) ( not ( = ?auto_89023 ?auto_89024 ) ) ( not ( = ?auto_89023 ?auto_89021 ) ) ( not ( = ?auto_89023 ?auto_89020 ) ) ( not ( = ?auto_89022 ?auto_89024 ) ) ( not ( = ?auto_89022 ?auto_89021 ) ) ( not ( = ?auto_89022 ?auto_89020 ) ) ( not ( = ?auto_89018 ?auto_89023 ) ) ( not ( = ?auto_89018 ?auto_89022 ) ) ( not ( = ?auto_89019 ?auto_89023 ) ) ( not ( = ?auto_89019 ?auto_89022 ) ) ( ON ?auto_89018 ?auto_89025 ) ( not ( = ?auto_89018 ?auto_89025 ) ) ( not ( = ?auto_89019 ?auto_89025 ) ) ( not ( = ?auto_89020 ?auto_89025 ) ) ( not ( = ?auto_89021 ?auto_89025 ) ) ( not ( = ?auto_89024 ?auto_89025 ) ) ( not ( = ?auto_89023 ?auto_89025 ) ) ( not ( = ?auto_89022 ?auto_89025 ) ) ( ON ?auto_89019 ?auto_89018 ) ( ON-TABLE ?auto_89025 ) ( ON ?auto_89020 ?auto_89019 ) ( ON ?auto_89021 ?auto_89020 ) ( CLEAR ?auto_89021 ) ( HOLDING ?auto_89024 ) ( CLEAR ?auto_89022 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89023 ?auto_89022 ?auto_89024 )
      ( MAKE-4PILE ?auto_89018 ?auto_89019 ?auto_89020 ?auto_89021 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89026 - BLOCK
      ?auto_89027 - BLOCK
      ?auto_89028 - BLOCK
      ?auto_89029 - BLOCK
    )
    :vars
    (
      ?auto_89033 - BLOCK
      ?auto_89030 - BLOCK
      ?auto_89032 - BLOCK
      ?auto_89031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89026 ?auto_89027 ) ) ( not ( = ?auto_89026 ?auto_89028 ) ) ( not ( = ?auto_89026 ?auto_89029 ) ) ( not ( = ?auto_89027 ?auto_89028 ) ) ( not ( = ?auto_89027 ?auto_89029 ) ) ( not ( = ?auto_89028 ?auto_89029 ) ) ( not ( = ?auto_89026 ?auto_89033 ) ) ( not ( = ?auto_89027 ?auto_89033 ) ) ( not ( = ?auto_89028 ?auto_89033 ) ) ( not ( = ?auto_89029 ?auto_89033 ) ) ( ON-TABLE ?auto_89030 ) ( ON ?auto_89032 ?auto_89030 ) ( not ( = ?auto_89030 ?auto_89032 ) ) ( not ( = ?auto_89030 ?auto_89033 ) ) ( not ( = ?auto_89030 ?auto_89029 ) ) ( not ( = ?auto_89030 ?auto_89028 ) ) ( not ( = ?auto_89032 ?auto_89033 ) ) ( not ( = ?auto_89032 ?auto_89029 ) ) ( not ( = ?auto_89032 ?auto_89028 ) ) ( not ( = ?auto_89026 ?auto_89030 ) ) ( not ( = ?auto_89026 ?auto_89032 ) ) ( not ( = ?auto_89027 ?auto_89030 ) ) ( not ( = ?auto_89027 ?auto_89032 ) ) ( ON ?auto_89026 ?auto_89031 ) ( not ( = ?auto_89026 ?auto_89031 ) ) ( not ( = ?auto_89027 ?auto_89031 ) ) ( not ( = ?auto_89028 ?auto_89031 ) ) ( not ( = ?auto_89029 ?auto_89031 ) ) ( not ( = ?auto_89033 ?auto_89031 ) ) ( not ( = ?auto_89030 ?auto_89031 ) ) ( not ( = ?auto_89032 ?auto_89031 ) ) ( ON ?auto_89027 ?auto_89026 ) ( ON-TABLE ?auto_89031 ) ( ON ?auto_89028 ?auto_89027 ) ( ON ?auto_89029 ?auto_89028 ) ( CLEAR ?auto_89032 ) ( ON ?auto_89033 ?auto_89029 ) ( CLEAR ?auto_89033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89031 ?auto_89026 ?auto_89027 ?auto_89028 ?auto_89029 )
      ( MAKE-4PILE ?auto_89026 ?auto_89027 ?auto_89028 ?auto_89029 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89034 - BLOCK
      ?auto_89035 - BLOCK
      ?auto_89036 - BLOCK
      ?auto_89037 - BLOCK
    )
    :vars
    (
      ?auto_89039 - BLOCK
      ?auto_89038 - BLOCK
      ?auto_89040 - BLOCK
      ?auto_89041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89034 ?auto_89035 ) ) ( not ( = ?auto_89034 ?auto_89036 ) ) ( not ( = ?auto_89034 ?auto_89037 ) ) ( not ( = ?auto_89035 ?auto_89036 ) ) ( not ( = ?auto_89035 ?auto_89037 ) ) ( not ( = ?auto_89036 ?auto_89037 ) ) ( not ( = ?auto_89034 ?auto_89039 ) ) ( not ( = ?auto_89035 ?auto_89039 ) ) ( not ( = ?auto_89036 ?auto_89039 ) ) ( not ( = ?auto_89037 ?auto_89039 ) ) ( ON-TABLE ?auto_89038 ) ( not ( = ?auto_89038 ?auto_89040 ) ) ( not ( = ?auto_89038 ?auto_89039 ) ) ( not ( = ?auto_89038 ?auto_89037 ) ) ( not ( = ?auto_89038 ?auto_89036 ) ) ( not ( = ?auto_89040 ?auto_89039 ) ) ( not ( = ?auto_89040 ?auto_89037 ) ) ( not ( = ?auto_89040 ?auto_89036 ) ) ( not ( = ?auto_89034 ?auto_89038 ) ) ( not ( = ?auto_89034 ?auto_89040 ) ) ( not ( = ?auto_89035 ?auto_89038 ) ) ( not ( = ?auto_89035 ?auto_89040 ) ) ( ON ?auto_89034 ?auto_89041 ) ( not ( = ?auto_89034 ?auto_89041 ) ) ( not ( = ?auto_89035 ?auto_89041 ) ) ( not ( = ?auto_89036 ?auto_89041 ) ) ( not ( = ?auto_89037 ?auto_89041 ) ) ( not ( = ?auto_89039 ?auto_89041 ) ) ( not ( = ?auto_89038 ?auto_89041 ) ) ( not ( = ?auto_89040 ?auto_89041 ) ) ( ON ?auto_89035 ?auto_89034 ) ( ON-TABLE ?auto_89041 ) ( ON ?auto_89036 ?auto_89035 ) ( ON ?auto_89037 ?auto_89036 ) ( ON ?auto_89039 ?auto_89037 ) ( CLEAR ?auto_89039 ) ( HOLDING ?auto_89040 ) ( CLEAR ?auto_89038 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89038 ?auto_89040 )
      ( MAKE-4PILE ?auto_89034 ?auto_89035 ?auto_89036 ?auto_89037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89042 - BLOCK
      ?auto_89043 - BLOCK
      ?auto_89044 - BLOCK
      ?auto_89045 - BLOCK
    )
    :vars
    (
      ?auto_89046 - BLOCK
      ?auto_89049 - BLOCK
      ?auto_89048 - BLOCK
      ?auto_89047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89042 ?auto_89043 ) ) ( not ( = ?auto_89042 ?auto_89044 ) ) ( not ( = ?auto_89042 ?auto_89045 ) ) ( not ( = ?auto_89043 ?auto_89044 ) ) ( not ( = ?auto_89043 ?auto_89045 ) ) ( not ( = ?auto_89044 ?auto_89045 ) ) ( not ( = ?auto_89042 ?auto_89046 ) ) ( not ( = ?auto_89043 ?auto_89046 ) ) ( not ( = ?auto_89044 ?auto_89046 ) ) ( not ( = ?auto_89045 ?auto_89046 ) ) ( ON-TABLE ?auto_89049 ) ( not ( = ?auto_89049 ?auto_89048 ) ) ( not ( = ?auto_89049 ?auto_89046 ) ) ( not ( = ?auto_89049 ?auto_89045 ) ) ( not ( = ?auto_89049 ?auto_89044 ) ) ( not ( = ?auto_89048 ?auto_89046 ) ) ( not ( = ?auto_89048 ?auto_89045 ) ) ( not ( = ?auto_89048 ?auto_89044 ) ) ( not ( = ?auto_89042 ?auto_89049 ) ) ( not ( = ?auto_89042 ?auto_89048 ) ) ( not ( = ?auto_89043 ?auto_89049 ) ) ( not ( = ?auto_89043 ?auto_89048 ) ) ( ON ?auto_89042 ?auto_89047 ) ( not ( = ?auto_89042 ?auto_89047 ) ) ( not ( = ?auto_89043 ?auto_89047 ) ) ( not ( = ?auto_89044 ?auto_89047 ) ) ( not ( = ?auto_89045 ?auto_89047 ) ) ( not ( = ?auto_89046 ?auto_89047 ) ) ( not ( = ?auto_89049 ?auto_89047 ) ) ( not ( = ?auto_89048 ?auto_89047 ) ) ( ON ?auto_89043 ?auto_89042 ) ( ON-TABLE ?auto_89047 ) ( ON ?auto_89044 ?auto_89043 ) ( ON ?auto_89045 ?auto_89044 ) ( ON ?auto_89046 ?auto_89045 ) ( CLEAR ?auto_89049 ) ( ON ?auto_89048 ?auto_89046 ) ( CLEAR ?auto_89048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89047 ?auto_89042 ?auto_89043 ?auto_89044 ?auto_89045 ?auto_89046 )
      ( MAKE-4PILE ?auto_89042 ?auto_89043 ?auto_89044 ?auto_89045 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89050 - BLOCK
      ?auto_89051 - BLOCK
      ?auto_89052 - BLOCK
      ?auto_89053 - BLOCK
    )
    :vars
    (
      ?auto_89055 - BLOCK
      ?auto_89054 - BLOCK
      ?auto_89056 - BLOCK
      ?auto_89057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89050 ?auto_89051 ) ) ( not ( = ?auto_89050 ?auto_89052 ) ) ( not ( = ?auto_89050 ?auto_89053 ) ) ( not ( = ?auto_89051 ?auto_89052 ) ) ( not ( = ?auto_89051 ?auto_89053 ) ) ( not ( = ?auto_89052 ?auto_89053 ) ) ( not ( = ?auto_89050 ?auto_89055 ) ) ( not ( = ?auto_89051 ?auto_89055 ) ) ( not ( = ?auto_89052 ?auto_89055 ) ) ( not ( = ?auto_89053 ?auto_89055 ) ) ( not ( = ?auto_89054 ?auto_89056 ) ) ( not ( = ?auto_89054 ?auto_89055 ) ) ( not ( = ?auto_89054 ?auto_89053 ) ) ( not ( = ?auto_89054 ?auto_89052 ) ) ( not ( = ?auto_89056 ?auto_89055 ) ) ( not ( = ?auto_89056 ?auto_89053 ) ) ( not ( = ?auto_89056 ?auto_89052 ) ) ( not ( = ?auto_89050 ?auto_89054 ) ) ( not ( = ?auto_89050 ?auto_89056 ) ) ( not ( = ?auto_89051 ?auto_89054 ) ) ( not ( = ?auto_89051 ?auto_89056 ) ) ( ON ?auto_89050 ?auto_89057 ) ( not ( = ?auto_89050 ?auto_89057 ) ) ( not ( = ?auto_89051 ?auto_89057 ) ) ( not ( = ?auto_89052 ?auto_89057 ) ) ( not ( = ?auto_89053 ?auto_89057 ) ) ( not ( = ?auto_89055 ?auto_89057 ) ) ( not ( = ?auto_89054 ?auto_89057 ) ) ( not ( = ?auto_89056 ?auto_89057 ) ) ( ON ?auto_89051 ?auto_89050 ) ( ON-TABLE ?auto_89057 ) ( ON ?auto_89052 ?auto_89051 ) ( ON ?auto_89053 ?auto_89052 ) ( ON ?auto_89055 ?auto_89053 ) ( ON ?auto_89056 ?auto_89055 ) ( CLEAR ?auto_89056 ) ( HOLDING ?auto_89054 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89054 )
      ( MAKE-4PILE ?auto_89050 ?auto_89051 ?auto_89052 ?auto_89053 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_89058 - BLOCK
      ?auto_89059 - BLOCK
      ?auto_89060 - BLOCK
      ?auto_89061 - BLOCK
    )
    :vars
    (
      ?auto_89062 - BLOCK
      ?auto_89064 - BLOCK
      ?auto_89063 - BLOCK
      ?auto_89065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89058 ?auto_89059 ) ) ( not ( = ?auto_89058 ?auto_89060 ) ) ( not ( = ?auto_89058 ?auto_89061 ) ) ( not ( = ?auto_89059 ?auto_89060 ) ) ( not ( = ?auto_89059 ?auto_89061 ) ) ( not ( = ?auto_89060 ?auto_89061 ) ) ( not ( = ?auto_89058 ?auto_89062 ) ) ( not ( = ?auto_89059 ?auto_89062 ) ) ( not ( = ?auto_89060 ?auto_89062 ) ) ( not ( = ?auto_89061 ?auto_89062 ) ) ( not ( = ?auto_89064 ?auto_89063 ) ) ( not ( = ?auto_89064 ?auto_89062 ) ) ( not ( = ?auto_89064 ?auto_89061 ) ) ( not ( = ?auto_89064 ?auto_89060 ) ) ( not ( = ?auto_89063 ?auto_89062 ) ) ( not ( = ?auto_89063 ?auto_89061 ) ) ( not ( = ?auto_89063 ?auto_89060 ) ) ( not ( = ?auto_89058 ?auto_89064 ) ) ( not ( = ?auto_89058 ?auto_89063 ) ) ( not ( = ?auto_89059 ?auto_89064 ) ) ( not ( = ?auto_89059 ?auto_89063 ) ) ( ON ?auto_89058 ?auto_89065 ) ( not ( = ?auto_89058 ?auto_89065 ) ) ( not ( = ?auto_89059 ?auto_89065 ) ) ( not ( = ?auto_89060 ?auto_89065 ) ) ( not ( = ?auto_89061 ?auto_89065 ) ) ( not ( = ?auto_89062 ?auto_89065 ) ) ( not ( = ?auto_89064 ?auto_89065 ) ) ( not ( = ?auto_89063 ?auto_89065 ) ) ( ON ?auto_89059 ?auto_89058 ) ( ON-TABLE ?auto_89065 ) ( ON ?auto_89060 ?auto_89059 ) ( ON ?auto_89061 ?auto_89060 ) ( ON ?auto_89062 ?auto_89061 ) ( ON ?auto_89063 ?auto_89062 ) ( ON ?auto_89064 ?auto_89063 ) ( CLEAR ?auto_89064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89065 ?auto_89058 ?auto_89059 ?auto_89060 ?auto_89061 ?auto_89062 ?auto_89063 )
      ( MAKE-4PILE ?auto_89058 ?auto_89059 ?auto_89060 ?auto_89061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89068 - BLOCK
      ?auto_89069 - BLOCK
    )
    :vars
    (
      ?auto_89070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89070 ?auto_89069 ) ( CLEAR ?auto_89070 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89068 ) ( ON ?auto_89069 ?auto_89068 ) ( not ( = ?auto_89068 ?auto_89069 ) ) ( not ( = ?auto_89068 ?auto_89070 ) ) ( not ( = ?auto_89069 ?auto_89070 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89070 ?auto_89069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89071 - BLOCK
      ?auto_89072 - BLOCK
    )
    :vars
    (
      ?auto_89073 - BLOCK
      ?auto_89074 - BLOCK
      ?auto_89075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89073 ?auto_89072 ) ( CLEAR ?auto_89073 ) ( ON-TABLE ?auto_89071 ) ( ON ?auto_89072 ?auto_89071 ) ( not ( = ?auto_89071 ?auto_89072 ) ) ( not ( = ?auto_89071 ?auto_89073 ) ) ( not ( = ?auto_89072 ?auto_89073 ) ) ( HOLDING ?auto_89074 ) ( CLEAR ?auto_89075 ) ( not ( = ?auto_89071 ?auto_89074 ) ) ( not ( = ?auto_89071 ?auto_89075 ) ) ( not ( = ?auto_89072 ?auto_89074 ) ) ( not ( = ?auto_89072 ?auto_89075 ) ) ( not ( = ?auto_89073 ?auto_89074 ) ) ( not ( = ?auto_89073 ?auto_89075 ) ) ( not ( = ?auto_89074 ?auto_89075 ) ) )
    :subtasks
    ( ( !STACK ?auto_89074 ?auto_89075 )
      ( MAKE-2PILE ?auto_89071 ?auto_89072 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89076 - BLOCK
      ?auto_89077 - BLOCK
    )
    :vars
    (
      ?auto_89080 - BLOCK
      ?auto_89078 - BLOCK
      ?auto_89079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89080 ?auto_89077 ) ( ON-TABLE ?auto_89076 ) ( ON ?auto_89077 ?auto_89076 ) ( not ( = ?auto_89076 ?auto_89077 ) ) ( not ( = ?auto_89076 ?auto_89080 ) ) ( not ( = ?auto_89077 ?auto_89080 ) ) ( CLEAR ?auto_89078 ) ( not ( = ?auto_89076 ?auto_89079 ) ) ( not ( = ?auto_89076 ?auto_89078 ) ) ( not ( = ?auto_89077 ?auto_89079 ) ) ( not ( = ?auto_89077 ?auto_89078 ) ) ( not ( = ?auto_89080 ?auto_89079 ) ) ( not ( = ?auto_89080 ?auto_89078 ) ) ( not ( = ?auto_89079 ?auto_89078 ) ) ( ON ?auto_89079 ?auto_89080 ) ( CLEAR ?auto_89079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89076 ?auto_89077 ?auto_89080 )
      ( MAKE-2PILE ?auto_89076 ?auto_89077 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89081 - BLOCK
      ?auto_89082 - BLOCK
    )
    :vars
    (
      ?auto_89085 - BLOCK
      ?auto_89084 - BLOCK
      ?auto_89083 - BLOCK
      ?auto_89087 - BLOCK
      ?auto_89086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89085 ?auto_89082 ) ( ON-TABLE ?auto_89081 ) ( ON ?auto_89082 ?auto_89081 ) ( not ( = ?auto_89081 ?auto_89082 ) ) ( not ( = ?auto_89081 ?auto_89085 ) ) ( not ( = ?auto_89082 ?auto_89085 ) ) ( not ( = ?auto_89081 ?auto_89084 ) ) ( not ( = ?auto_89081 ?auto_89083 ) ) ( not ( = ?auto_89082 ?auto_89084 ) ) ( not ( = ?auto_89082 ?auto_89083 ) ) ( not ( = ?auto_89085 ?auto_89084 ) ) ( not ( = ?auto_89085 ?auto_89083 ) ) ( not ( = ?auto_89084 ?auto_89083 ) ) ( ON ?auto_89084 ?auto_89085 ) ( CLEAR ?auto_89084 ) ( HOLDING ?auto_89083 ) ( CLEAR ?auto_89087 ) ( ON-TABLE ?auto_89086 ) ( ON ?auto_89087 ?auto_89086 ) ( not ( = ?auto_89086 ?auto_89087 ) ) ( not ( = ?auto_89086 ?auto_89083 ) ) ( not ( = ?auto_89087 ?auto_89083 ) ) ( not ( = ?auto_89081 ?auto_89087 ) ) ( not ( = ?auto_89081 ?auto_89086 ) ) ( not ( = ?auto_89082 ?auto_89087 ) ) ( not ( = ?auto_89082 ?auto_89086 ) ) ( not ( = ?auto_89085 ?auto_89087 ) ) ( not ( = ?auto_89085 ?auto_89086 ) ) ( not ( = ?auto_89084 ?auto_89087 ) ) ( not ( = ?auto_89084 ?auto_89086 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89086 ?auto_89087 ?auto_89083 )
      ( MAKE-2PILE ?auto_89081 ?auto_89082 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89088 - BLOCK
      ?auto_89089 - BLOCK
    )
    :vars
    (
      ?auto_89093 - BLOCK
      ?auto_89090 - BLOCK
      ?auto_89091 - BLOCK
      ?auto_89094 - BLOCK
      ?auto_89092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89093 ?auto_89089 ) ( ON-TABLE ?auto_89088 ) ( ON ?auto_89089 ?auto_89088 ) ( not ( = ?auto_89088 ?auto_89089 ) ) ( not ( = ?auto_89088 ?auto_89093 ) ) ( not ( = ?auto_89089 ?auto_89093 ) ) ( not ( = ?auto_89088 ?auto_89090 ) ) ( not ( = ?auto_89088 ?auto_89091 ) ) ( not ( = ?auto_89089 ?auto_89090 ) ) ( not ( = ?auto_89089 ?auto_89091 ) ) ( not ( = ?auto_89093 ?auto_89090 ) ) ( not ( = ?auto_89093 ?auto_89091 ) ) ( not ( = ?auto_89090 ?auto_89091 ) ) ( ON ?auto_89090 ?auto_89093 ) ( CLEAR ?auto_89094 ) ( ON-TABLE ?auto_89092 ) ( ON ?auto_89094 ?auto_89092 ) ( not ( = ?auto_89092 ?auto_89094 ) ) ( not ( = ?auto_89092 ?auto_89091 ) ) ( not ( = ?auto_89094 ?auto_89091 ) ) ( not ( = ?auto_89088 ?auto_89094 ) ) ( not ( = ?auto_89088 ?auto_89092 ) ) ( not ( = ?auto_89089 ?auto_89094 ) ) ( not ( = ?auto_89089 ?auto_89092 ) ) ( not ( = ?auto_89093 ?auto_89094 ) ) ( not ( = ?auto_89093 ?auto_89092 ) ) ( not ( = ?auto_89090 ?auto_89094 ) ) ( not ( = ?auto_89090 ?auto_89092 ) ) ( ON ?auto_89091 ?auto_89090 ) ( CLEAR ?auto_89091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89088 ?auto_89089 ?auto_89093 ?auto_89090 )
      ( MAKE-2PILE ?auto_89088 ?auto_89089 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89095 - BLOCK
      ?auto_89096 - BLOCK
    )
    :vars
    (
      ?auto_89098 - BLOCK
      ?auto_89100 - BLOCK
      ?auto_89097 - BLOCK
      ?auto_89099 - BLOCK
      ?auto_89101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89098 ?auto_89096 ) ( ON-TABLE ?auto_89095 ) ( ON ?auto_89096 ?auto_89095 ) ( not ( = ?auto_89095 ?auto_89096 ) ) ( not ( = ?auto_89095 ?auto_89098 ) ) ( not ( = ?auto_89096 ?auto_89098 ) ) ( not ( = ?auto_89095 ?auto_89100 ) ) ( not ( = ?auto_89095 ?auto_89097 ) ) ( not ( = ?auto_89096 ?auto_89100 ) ) ( not ( = ?auto_89096 ?auto_89097 ) ) ( not ( = ?auto_89098 ?auto_89100 ) ) ( not ( = ?auto_89098 ?auto_89097 ) ) ( not ( = ?auto_89100 ?auto_89097 ) ) ( ON ?auto_89100 ?auto_89098 ) ( ON-TABLE ?auto_89099 ) ( not ( = ?auto_89099 ?auto_89101 ) ) ( not ( = ?auto_89099 ?auto_89097 ) ) ( not ( = ?auto_89101 ?auto_89097 ) ) ( not ( = ?auto_89095 ?auto_89101 ) ) ( not ( = ?auto_89095 ?auto_89099 ) ) ( not ( = ?auto_89096 ?auto_89101 ) ) ( not ( = ?auto_89096 ?auto_89099 ) ) ( not ( = ?auto_89098 ?auto_89101 ) ) ( not ( = ?auto_89098 ?auto_89099 ) ) ( not ( = ?auto_89100 ?auto_89101 ) ) ( not ( = ?auto_89100 ?auto_89099 ) ) ( ON ?auto_89097 ?auto_89100 ) ( CLEAR ?auto_89097 ) ( HOLDING ?auto_89101 ) ( CLEAR ?auto_89099 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89099 ?auto_89101 )
      ( MAKE-2PILE ?auto_89095 ?auto_89096 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89102 - BLOCK
      ?auto_89103 - BLOCK
    )
    :vars
    (
      ?auto_89106 - BLOCK
      ?auto_89104 - BLOCK
      ?auto_89105 - BLOCK
      ?auto_89107 - BLOCK
      ?auto_89108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89106 ?auto_89103 ) ( ON-TABLE ?auto_89102 ) ( ON ?auto_89103 ?auto_89102 ) ( not ( = ?auto_89102 ?auto_89103 ) ) ( not ( = ?auto_89102 ?auto_89106 ) ) ( not ( = ?auto_89103 ?auto_89106 ) ) ( not ( = ?auto_89102 ?auto_89104 ) ) ( not ( = ?auto_89102 ?auto_89105 ) ) ( not ( = ?auto_89103 ?auto_89104 ) ) ( not ( = ?auto_89103 ?auto_89105 ) ) ( not ( = ?auto_89106 ?auto_89104 ) ) ( not ( = ?auto_89106 ?auto_89105 ) ) ( not ( = ?auto_89104 ?auto_89105 ) ) ( ON ?auto_89104 ?auto_89106 ) ( ON-TABLE ?auto_89107 ) ( not ( = ?auto_89107 ?auto_89108 ) ) ( not ( = ?auto_89107 ?auto_89105 ) ) ( not ( = ?auto_89108 ?auto_89105 ) ) ( not ( = ?auto_89102 ?auto_89108 ) ) ( not ( = ?auto_89102 ?auto_89107 ) ) ( not ( = ?auto_89103 ?auto_89108 ) ) ( not ( = ?auto_89103 ?auto_89107 ) ) ( not ( = ?auto_89106 ?auto_89108 ) ) ( not ( = ?auto_89106 ?auto_89107 ) ) ( not ( = ?auto_89104 ?auto_89108 ) ) ( not ( = ?auto_89104 ?auto_89107 ) ) ( ON ?auto_89105 ?auto_89104 ) ( CLEAR ?auto_89107 ) ( ON ?auto_89108 ?auto_89105 ) ( CLEAR ?auto_89108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89102 ?auto_89103 ?auto_89106 ?auto_89104 ?auto_89105 )
      ( MAKE-2PILE ?auto_89102 ?auto_89103 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89109 - BLOCK
      ?auto_89110 - BLOCK
    )
    :vars
    (
      ?auto_89112 - BLOCK
      ?auto_89115 - BLOCK
      ?auto_89111 - BLOCK
      ?auto_89113 - BLOCK
      ?auto_89114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89112 ?auto_89110 ) ( ON-TABLE ?auto_89109 ) ( ON ?auto_89110 ?auto_89109 ) ( not ( = ?auto_89109 ?auto_89110 ) ) ( not ( = ?auto_89109 ?auto_89112 ) ) ( not ( = ?auto_89110 ?auto_89112 ) ) ( not ( = ?auto_89109 ?auto_89115 ) ) ( not ( = ?auto_89109 ?auto_89111 ) ) ( not ( = ?auto_89110 ?auto_89115 ) ) ( not ( = ?auto_89110 ?auto_89111 ) ) ( not ( = ?auto_89112 ?auto_89115 ) ) ( not ( = ?auto_89112 ?auto_89111 ) ) ( not ( = ?auto_89115 ?auto_89111 ) ) ( ON ?auto_89115 ?auto_89112 ) ( not ( = ?auto_89113 ?auto_89114 ) ) ( not ( = ?auto_89113 ?auto_89111 ) ) ( not ( = ?auto_89114 ?auto_89111 ) ) ( not ( = ?auto_89109 ?auto_89114 ) ) ( not ( = ?auto_89109 ?auto_89113 ) ) ( not ( = ?auto_89110 ?auto_89114 ) ) ( not ( = ?auto_89110 ?auto_89113 ) ) ( not ( = ?auto_89112 ?auto_89114 ) ) ( not ( = ?auto_89112 ?auto_89113 ) ) ( not ( = ?auto_89115 ?auto_89114 ) ) ( not ( = ?auto_89115 ?auto_89113 ) ) ( ON ?auto_89111 ?auto_89115 ) ( ON ?auto_89114 ?auto_89111 ) ( CLEAR ?auto_89114 ) ( HOLDING ?auto_89113 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89113 )
      ( MAKE-2PILE ?auto_89109 ?auto_89110 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89116 - BLOCK
      ?auto_89117 - BLOCK
    )
    :vars
    (
      ?auto_89122 - BLOCK
      ?auto_89121 - BLOCK
      ?auto_89118 - BLOCK
      ?auto_89120 - BLOCK
      ?auto_89119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89122 ?auto_89117 ) ( ON-TABLE ?auto_89116 ) ( ON ?auto_89117 ?auto_89116 ) ( not ( = ?auto_89116 ?auto_89117 ) ) ( not ( = ?auto_89116 ?auto_89122 ) ) ( not ( = ?auto_89117 ?auto_89122 ) ) ( not ( = ?auto_89116 ?auto_89121 ) ) ( not ( = ?auto_89116 ?auto_89118 ) ) ( not ( = ?auto_89117 ?auto_89121 ) ) ( not ( = ?auto_89117 ?auto_89118 ) ) ( not ( = ?auto_89122 ?auto_89121 ) ) ( not ( = ?auto_89122 ?auto_89118 ) ) ( not ( = ?auto_89121 ?auto_89118 ) ) ( ON ?auto_89121 ?auto_89122 ) ( not ( = ?auto_89120 ?auto_89119 ) ) ( not ( = ?auto_89120 ?auto_89118 ) ) ( not ( = ?auto_89119 ?auto_89118 ) ) ( not ( = ?auto_89116 ?auto_89119 ) ) ( not ( = ?auto_89116 ?auto_89120 ) ) ( not ( = ?auto_89117 ?auto_89119 ) ) ( not ( = ?auto_89117 ?auto_89120 ) ) ( not ( = ?auto_89122 ?auto_89119 ) ) ( not ( = ?auto_89122 ?auto_89120 ) ) ( not ( = ?auto_89121 ?auto_89119 ) ) ( not ( = ?auto_89121 ?auto_89120 ) ) ( ON ?auto_89118 ?auto_89121 ) ( ON ?auto_89119 ?auto_89118 ) ( ON ?auto_89120 ?auto_89119 ) ( CLEAR ?auto_89120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89116 ?auto_89117 ?auto_89122 ?auto_89121 ?auto_89118 ?auto_89119 )
      ( MAKE-2PILE ?auto_89116 ?auto_89117 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89123 - BLOCK
      ?auto_89124 - BLOCK
    )
    :vars
    (
      ?auto_89128 - BLOCK
      ?auto_89125 - BLOCK
      ?auto_89129 - BLOCK
      ?auto_89127 - BLOCK
      ?auto_89126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89128 ?auto_89124 ) ( ON-TABLE ?auto_89123 ) ( ON ?auto_89124 ?auto_89123 ) ( not ( = ?auto_89123 ?auto_89124 ) ) ( not ( = ?auto_89123 ?auto_89128 ) ) ( not ( = ?auto_89124 ?auto_89128 ) ) ( not ( = ?auto_89123 ?auto_89125 ) ) ( not ( = ?auto_89123 ?auto_89129 ) ) ( not ( = ?auto_89124 ?auto_89125 ) ) ( not ( = ?auto_89124 ?auto_89129 ) ) ( not ( = ?auto_89128 ?auto_89125 ) ) ( not ( = ?auto_89128 ?auto_89129 ) ) ( not ( = ?auto_89125 ?auto_89129 ) ) ( ON ?auto_89125 ?auto_89128 ) ( not ( = ?auto_89127 ?auto_89126 ) ) ( not ( = ?auto_89127 ?auto_89129 ) ) ( not ( = ?auto_89126 ?auto_89129 ) ) ( not ( = ?auto_89123 ?auto_89126 ) ) ( not ( = ?auto_89123 ?auto_89127 ) ) ( not ( = ?auto_89124 ?auto_89126 ) ) ( not ( = ?auto_89124 ?auto_89127 ) ) ( not ( = ?auto_89128 ?auto_89126 ) ) ( not ( = ?auto_89128 ?auto_89127 ) ) ( not ( = ?auto_89125 ?auto_89126 ) ) ( not ( = ?auto_89125 ?auto_89127 ) ) ( ON ?auto_89129 ?auto_89125 ) ( ON ?auto_89126 ?auto_89129 ) ( HOLDING ?auto_89127 ) ( CLEAR ?auto_89126 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89123 ?auto_89124 ?auto_89128 ?auto_89125 ?auto_89129 ?auto_89126 ?auto_89127 )
      ( MAKE-2PILE ?auto_89123 ?auto_89124 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89130 - BLOCK
      ?auto_89131 - BLOCK
    )
    :vars
    (
      ?auto_89136 - BLOCK
      ?auto_89135 - BLOCK
      ?auto_89133 - BLOCK
      ?auto_89134 - BLOCK
      ?auto_89132 - BLOCK
      ?auto_89137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89136 ?auto_89131 ) ( ON-TABLE ?auto_89130 ) ( ON ?auto_89131 ?auto_89130 ) ( not ( = ?auto_89130 ?auto_89131 ) ) ( not ( = ?auto_89130 ?auto_89136 ) ) ( not ( = ?auto_89131 ?auto_89136 ) ) ( not ( = ?auto_89130 ?auto_89135 ) ) ( not ( = ?auto_89130 ?auto_89133 ) ) ( not ( = ?auto_89131 ?auto_89135 ) ) ( not ( = ?auto_89131 ?auto_89133 ) ) ( not ( = ?auto_89136 ?auto_89135 ) ) ( not ( = ?auto_89136 ?auto_89133 ) ) ( not ( = ?auto_89135 ?auto_89133 ) ) ( ON ?auto_89135 ?auto_89136 ) ( not ( = ?auto_89134 ?auto_89132 ) ) ( not ( = ?auto_89134 ?auto_89133 ) ) ( not ( = ?auto_89132 ?auto_89133 ) ) ( not ( = ?auto_89130 ?auto_89132 ) ) ( not ( = ?auto_89130 ?auto_89134 ) ) ( not ( = ?auto_89131 ?auto_89132 ) ) ( not ( = ?auto_89131 ?auto_89134 ) ) ( not ( = ?auto_89136 ?auto_89132 ) ) ( not ( = ?auto_89136 ?auto_89134 ) ) ( not ( = ?auto_89135 ?auto_89132 ) ) ( not ( = ?auto_89135 ?auto_89134 ) ) ( ON ?auto_89133 ?auto_89135 ) ( ON ?auto_89132 ?auto_89133 ) ( CLEAR ?auto_89132 ) ( ON ?auto_89134 ?auto_89137 ) ( CLEAR ?auto_89134 ) ( HAND-EMPTY ) ( not ( = ?auto_89130 ?auto_89137 ) ) ( not ( = ?auto_89131 ?auto_89137 ) ) ( not ( = ?auto_89136 ?auto_89137 ) ) ( not ( = ?auto_89135 ?auto_89137 ) ) ( not ( = ?auto_89133 ?auto_89137 ) ) ( not ( = ?auto_89134 ?auto_89137 ) ) ( not ( = ?auto_89132 ?auto_89137 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89134 ?auto_89137 )
      ( MAKE-2PILE ?auto_89130 ?auto_89131 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89138 - BLOCK
      ?auto_89139 - BLOCK
    )
    :vars
    (
      ?auto_89141 - BLOCK
      ?auto_89143 - BLOCK
      ?auto_89144 - BLOCK
      ?auto_89140 - BLOCK
      ?auto_89142 - BLOCK
      ?auto_89145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89141 ?auto_89139 ) ( ON-TABLE ?auto_89138 ) ( ON ?auto_89139 ?auto_89138 ) ( not ( = ?auto_89138 ?auto_89139 ) ) ( not ( = ?auto_89138 ?auto_89141 ) ) ( not ( = ?auto_89139 ?auto_89141 ) ) ( not ( = ?auto_89138 ?auto_89143 ) ) ( not ( = ?auto_89138 ?auto_89144 ) ) ( not ( = ?auto_89139 ?auto_89143 ) ) ( not ( = ?auto_89139 ?auto_89144 ) ) ( not ( = ?auto_89141 ?auto_89143 ) ) ( not ( = ?auto_89141 ?auto_89144 ) ) ( not ( = ?auto_89143 ?auto_89144 ) ) ( ON ?auto_89143 ?auto_89141 ) ( not ( = ?auto_89140 ?auto_89142 ) ) ( not ( = ?auto_89140 ?auto_89144 ) ) ( not ( = ?auto_89142 ?auto_89144 ) ) ( not ( = ?auto_89138 ?auto_89142 ) ) ( not ( = ?auto_89138 ?auto_89140 ) ) ( not ( = ?auto_89139 ?auto_89142 ) ) ( not ( = ?auto_89139 ?auto_89140 ) ) ( not ( = ?auto_89141 ?auto_89142 ) ) ( not ( = ?auto_89141 ?auto_89140 ) ) ( not ( = ?auto_89143 ?auto_89142 ) ) ( not ( = ?auto_89143 ?auto_89140 ) ) ( ON ?auto_89144 ?auto_89143 ) ( ON ?auto_89140 ?auto_89145 ) ( CLEAR ?auto_89140 ) ( not ( = ?auto_89138 ?auto_89145 ) ) ( not ( = ?auto_89139 ?auto_89145 ) ) ( not ( = ?auto_89141 ?auto_89145 ) ) ( not ( = ?auto_89143 ?auto_89145 ) ) ( not ( = ?auto_89144 ?auto_89145 ) ) ( not ( = ?auto_89140 ?auto_89145 ) ) ( not ( = ?auto_89142 ?auto_89145 ) ) ( HOLDING ?auto_89142 ) ( CLEAR ?auto_89144 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89138 ?auto_89139 ?auto_89141 ?auto_89143 ?auto_89144 ?auto_89142 )
      ( MAKE-2PILE ?auto_89138 ?auto_89139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89146 - BLOCK
      ?auto_89147 - BLOCK
    )
    :vars
    (
      ?auto_89150 - BLOCK
      ?auto_89152 - BLOCK
      ?auto_89149 - BLOCK
      ?auto_89151 - BLOCK
      ?auto_89153 - BLOCK
      ?auto_89148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89150 ?auto_89147 ) ( ON-TABLE ?auto_89146 ) ( ON ?auto_89147 ?auto_89146 ) ( not ( = ?auto_89146 ?auto_89147 ) ) ( not ( = ?auto_89146 ?auto_89150 ) ) ( not ( = ?auto_89147 ?auto_89150 ) ) ( not ( = ?auto_89146 ?auto_89152 ) ) ( not ( = ?auto_89146 ?auto_89149 ) ) ( not ( = ?auto_89147 ?auto_89152 ) ) ( not ( = ?auto_89147 ?auto_89149 ) ) ( not ( = ?auto_89150 ?auto_89152 ) ) ( not ( = ?auto_89150 ?auto_89149 ) ) ( not ( = ?auto_89152 ?auto_89149 ) ) ( ON ?auto_89152 ?auto_89150 ) ( not ( = ?auto_89151 ?auto_89153 ) ) ( not ( = ?auto_89151 ?auto_89149 ) ) ( not ( = ?auto_89153 ?auto_89149 ) ) ( not ( = ?auto_89146 ?auto_89153 ) ) ( not ( = ?auto_89146 ?auto_89151 ) ) ( not ( = ?auto_89147 ?auto_89153 ) ) ( not ( = ?auto_89147 ?auto_89151 ) ) ( not ( = ?auto_89150 ?auto_89153 ) ) ( not ( = ?auto_89150 ?auto_89151 ) ) ( not ( = ?auto_89152 ?auto_89153 ) ) ( not ( = ?auto_89152 ?auto_89151 ) ) ( ON ?auto_89149 ?auto_89152 ) ( ON ?auto_89151 ?auto_89148 ) ( not ( = ?auto_89146 ?auto_89148 ) ) ( not ( = ?auto_89147 ?auto_89148 ) ) ( not ( = ?auto_89150 ?auto_89148 ) ) ( not ( = ?auto_89152 ?auto_89148 ) ) ( not ( = ?auto_89149 ?auto_89148 ) ) ( not ( = ?auto_89151 ?auto_89148 ) ) ( not ( = ?auto_89153 ?auto_89148 ) ) ( CLEAR ?auto_89149 ) ( ON ?auto_89153 ?auto_89151 ) ( CLEAR ?auto_89153 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89148 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89148 ?auto_89151 )
      ( MAKE-2PILE ?auto_89146 ?auto_89147 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89154 - BLOCK
      ?auto_89155 - BLOCK
    )
    :vars
    (
      ?auto_89159 - BLOCK
      ?auto_89161 - BLOCK
      ?auto_89156 - BLOCK
      ?auto_89158 - BLOCK
      ?auto_89157 - BLOCK
      ?auto_89160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89159 ?auto_89155 ) ( ON-TABLE ?auto_89154 ) ( ON ?auto_89155 ?auto_89154 ) ( not ( = ?auto_89154 ?auto_89155 ) ) ( not ( = ?auto_89154 ?auto_89159 ) ) ( not ( = ?auto_89155 ?auto_89159 ) ) ( not ( = ?auto_89154 ?auto_89161 ) ) ( not ( = ?auto_89154 ?auto_89156 ) ) ( not ( = ?auto_89155 ?auto_89161 ) ) ( not ( = ?auto_89155 ?auto_89156 ) ) ( not ( = ?auto_89159 ?auto_89161 ) ) ( not ( = ?auto_89159 ?auto_89156 ) ) ( not ( = ?auto_89161 ?auto_89156 ) ) ( ON ?auto_89161 ?auto_89159 ) ( not ( = ?auto_89158 ?auto_89157 ) ) ( not ( = ?auto_89158 ?auto_89156 ) ) ( not ( = ?auto_89157 ?auto_89156 ) ) ( not ( = ?auto_89154 ?auto_89157 ) ) ( not ( = ?auto_89154 ?auto_89158 ) ) ( not ( = ?auto_89155 ?auto_89157 ) ) ( not ( = ?auto_89155 ?auto_89158 ) ) ( not ( = ?auto_89159 ?auto_89157 ) ) ( not ( = ?auto_89159 ?auto_89158 ) ) ( not ( = ?auto_89161 ?auto_89157 ) ) ( not ( = ?auto_89161 ?auto_89158 ) ) ( ON ?auto_89158 ?auto_89160 ) ( not ( = ?auto_89154 ?auto_89160 ) ) ( not ( = ?auto_89155 ?auto_89160 ) ) ( not ( = ?auto_89159 ?auto_89160 ) ) ( not ( = ?auto_89161 ?auto_89160 ) ) ( not ( = ?auto_89156 ?auto_89160 ) ) ( not ( = ?auto_89158 ?auto_89160 ) ) ( not ( = ?auto_89157 ?auto_89160 ) ) ( ON ?auto_89157 ?auto_89158 ) ( CLEAR ?auto_89157 ) ( ON-TABLE ?auto_89160 ) ( HOLDING ?auto_89156 ) ( CLEAR ?auto_89161 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89154 ?auto_89155 ?auto_89159 ?auto_89161 ?auto_89156 )
      ( MAKE-2PILE ?auto_89154 ?auto_89155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89162 - BLOCK
      ?auto_89163 - BLOCK
    )
    :vars
    (
      ?auto_89167 - BLOCK
      ?auto_89169 - BLOCK
      ?auto_89165 - BLOCK
      ?auto_89166 - BLOCK
      ?auto_89164 - BLOCK
      ?auto_89168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89167 ?auto_89163 ) ( ON-TABLE ?auto_89162 ) ( ON ?auto_89163 ?auto_89162 ) ( not ( = ?auto_89162 ?auto_89163 ) ) ( not ( = ?auto_89162 ?auto_89167 ) ) ( not ( = ?auto_89163 ?auto_89167 ) ) ( not ( = ?auto_89162 ?auto_89169 ) ) ( not ( = ?auto_89162 ?auto_89165 ) ) ( not ( = ?auto_89163 ?auto_89169 ) ) ( not ( = ?auto_89163 ?auto_89165 ) ) ( not ( = ?auto_89167 ?auto_89169 ) ) ( not ( = ?auto_89167 ?auto_89165 ) ) ( not ( = ?auto_89169 ?auto_89165 ) ) ( ON ?auto_89169 ?auto_89167 ) ( not ( = ?auto_89166 ?auto_89164 ) ) ( not ( = ?auto_89166 ?auto_89165 ) ) ( not ( = ?auto_89164 ?auto_89165 ) ) ( not ( = ?auto_89162 ?auto_89164 ) ) ( not ( = ?auto_89162 ?auto_89166 ) ) ( not ( = ?auto_89163 ?auto_89164 ) ) ( not ( = ?auto_89163 ?auto_89166 ) ) ( not ( = ?auto_89167 ?auto_89164 ) ) ( not ( = ?auto_89167 ?auto_89166 ) ) ( not ( = ?auto_89169 ?auto_89164 ) ) ( not ( = ?auto_89169 ?auto_89166 ) ) ( ON ?auto_89166 ?auto_89168 ) ( not ( = ?auto_89162 ?auto_89168 ) ) ( not ( = ?auto_89163 ?auto_89168 ) ) ( not ( = ?auto_89167 ?auto_89168 ) ) ( not ( = ?auto_89169 ?auto_89168 ) ) ( not ( = ?auto_89165 ?auto_89168 ) ) ( not ( = ?auto_89166 ?auto_89168 ) ) ( not ( = ?auto_89164 ?auto_89168 ) ) ( ON ?auto_89164 ?auto_89166 ) ( ON-TABLE ?auto_89168 ) ( CLEAR ?auto_89169 ) ( ON ?auto_89165 ?auto_89164 ) ( CLEAR ?auto_89165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89168 ?auto_89166 ?auto_89164 )
      ( MAKE-2PILE ?auto_89162 ?auto_89163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89170 - BLOCK
      ?auto_89171 - BLOCK
    )
    :vars
    (
      ?auto_89175 - BLOCK
      ?auto_89172 - BLOCK
      ?auto_89177 - BLOCK
      ?auto_89173 - BLOCK
      ?auto_89176 - BLOCK
      ?auto_89174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89175 ?auto_89171 ) ( ON-TABLE ?auto_89170 ) ( ON ?auto_89171 ?auto_89170 ) ( not ( = ?auto_89170 ?auto_89171 ) ) ( not ( = ?auto_89170 ?auto_89175 ) ) ( not ( = ?auto_89171 ?auto_89175 ) ) ( not ( = ?auto_89170 ?auto_89172 ) ) ( not ( = ?auto_89170 ?auto_89177 ) ) ( not ( = ?auto_89171 ?auto_89172 ) ) ( not ( = ?auto_89171 ?auto_89177 ) ) ( not ( = ?auto_89175 ?auto_89172 ) ) ( not ( = ?auto_89175 ?auto_89177 ) ) ( not ( = ?auto_89172 ?auto_89177 ) ) ( not ( = ?auto_89173 ?auto_89176 ) ) ( not ( = ?auto_89173 ?auto_89177 ) ) ( not ( = ?auto_89176 ?auto_89177 ) ) ( not ( = ?auto_89170 ?auto_89176 ) ) ( not ( = ?auto_89170 ?auto_89173 ) ) ( not ( = ?auto_89171 ?auto_89176 ) ) ( not ( = ?auto_89171 ?auto_89173 ) ) ( not ( = ?auto_89175 ?auto_89176 ) ) ( not ( = ?auto_89175 ?auto_89173 ) ) ( not ( = ?auto_89172 ?auto_89176 ) ) ( not ( = ?auto_89172 ?auto_89173 ) ) ( ON ?auto_89173 ?auto_89174 ) ( not ( = ?auto_89170 ?auto_89174 ) ) ( not ( = ?auto_89171 ?auto_89174 ) ) ( not ( = ?auto_89175 ?auto_89174 ) ) ( not ( = ?auto_89172 ?auto_89174 ) ) ( not ( = ?auto_89177 ?auto_89174 ) ) ( not ( = ?auto_89173 ?auto_89174 ) ) ( not ( = ?auto_89176 ?auto_89174 ) ) ( ON ?auto_89176 ?auto_89173 ) ( ON-TABLE ?auto_89174 ) ( ON ?auto_89177 ?auto_89176 ) ( CLEAR ?auto_89177 ) ( HOLDING ?auto_89172 ) ( CLEAR ?auto_89175 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89170 ?auto_89171 ?auto_89175 ?auto_89172 )
      ( MAKE-2PILE ?auto_89170 ?auto_89171 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89178 - BLOCK
      ?auto_89179 - BLOCK
    )
    :vars
    (
      ?auto_89182 - BLOCK
      ?auto_89184 - BLOCK
      ?auto_89181 - BLOCK
      ?auto_89180 - BLOCK
      ?auto_89183 - BLOCK
      ?auto_89185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89182 ?auto_89179 ) ( ON-TABLE ?auto_89178 ) ( ON ?auto_89179 ?auto_89178 ) ( not ( = ?auto_89178 ?auto_89179 ) ) ( not ( = ?auto_89178 ?auto_89182 ) ) ( not ( = ?auto_89179 ?auto_89182 ) ) ( not ( = ?auto_89178 ?auto_89184 ) ) ( not ( = ?auto_89178 ?auto_89181 ) ) ( not ( = ?auto_89179 ?auto_89184 ) ) ( not ( = ?auto_89179 ?auto_89181 ) ) ( not ( = ?auto_89182 ?auto_89184 ) ) ( not ( = ?auto_89182 ?auto_89181 ) ) ( not ( = ?auto_89184 ?auto_89181 ) ) ( not ( = ?auto_89180 ?auto_89183 ) ) ( not ( = ?auto_89180 ?auto_89181 ) ) ( not ( = ?auto_89183 ?auto_89181 ) ) ( not ( = ?auto_89178 ?auto_89183 ) ) ( not ( = ?auto_89178 ?auto_89180 ) ) ( not ( = ?auto_89179 ?auto_89183 ) ) ( not ( = ?auto_89179 ?auto_89180 ) ) ( not ( = ?auto_89182 ?auto_89183 ) ) ( not ( = ?auto_89182 ?auto_89180 ) ) ( not ( = ?auto_89184 ?auto_89183 ) ) ( not ( = ?auto_89184 ?auto_89180 ) ) ( ON ?auto_89180 ?auto_89185 ) ( not ( = ?auto_89178 ?auto_89185 ) ) ( not ( = ?auto_89179 ?auto_89185 ) ) ( not ( = ?auto_89182 ?auto_89185 ) ) ( not ( = ?auto_89184 ?auto_89185 ) ) ( not ( = ?auto_89181 ?auto_89185 ) ) ( not ( = ?auto_89180 ?auto_89185 ) ) ( not ( = ?auto_89183 ?auto_89185 ) ) ( ON ?auto_89183 ?auto_89180 ) ( ON-TABLE ?auto_89185 ) ( ON ?auto_89181 ?auto_89183 ) ( CLEAR ?auto_89182 ) ( ON ?auto_89184 ?auto_89181 ) ( CLEAR ?auto_89184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89185 ?auto_89180 ?auto_89183 ?auto_89181 )
      ( MAKE-2PILE ?auto_89178 ?auto_89179 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89202 - BLOCK
      ?auto_89203 - BLOCK
    )
    :vars
    (
      ?auto_89205 - BLOCK
      ?auto_89206 - BLOCK
      ?auto_89207 - BLOCK
      ?auto_89209 - BLOCK
      ?auto_89204 - BLOCK
      ?auto_89208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89202 ) ( not ( = ?auto_89202 ?auto_89203 ) ) ( not ( = ?auto_89202 ?auto_89205 ) ) ( not ( = ?auto_89203 ?auto_89205 ) ) ( not ( = ?auto_89202 ?auto_89206 ) ) ( not ( = ?auto_89202 ?auto_89207 ) ) ( not ( = ?auto_89203 ?auto_89206 ) ) ( not ( = ?auto_89203 ?auto_89207 ) ) ( not ( = ?auto_89205 ?auto_89206 ) ) ( not ( = ?auto_89205 ?auto_89207 ) ) ( not ( = ?auto_89206 ?auto_89207 ) ) ( not ( = ?auto_89209 ?auto_89204 ) ) ( not ( = ?auto_89209 ?auto_89207 ) ) ( not ( = ?auto_89204 ?auto_89207 ) ) ( not ( = ?auto_89202 ?auto_89204 ) ) ( not ( = ?auto_89202 ?auto_89209 ) ) ( not ( = ?auto_89203 ?auto_89204 ) ) ( not ( = ?auto_89203 ?auto_89209 ) ) ( not ( = ?auto_89205 ?auto_89204 ) ) ( not ( = ?auto_89205 ?auto_89209 ) ) ( not ( = ?auto_89206 ?auto_89204 ) ) ( not ( = ?auto_89206 ?auto_89209 ) ) ( ON ?auto_89209 ?auto_89208 ) ( not ( = ?auto_89202 ?auto_89208 ) ) ( not ( = ?auto_89203 ?auto_89208 ) ) ( not ( = ?auto_89205 ?auto_89208 ) ) ( not ( = ?auto_89206 ?auto_89208 ) ) ( not ( = ?auto_89207 ?auto_89208 ) ) ( not ( = ?auto_89209 ?auto_89208 ) ) ( not ( = ?auto_89204 ?auto_89208 ) ) ( ON ?auto_89204 ?auto_89209 ) ( ON-TABLE ?auto_89208 ) ( ON ?auto_89207 ?auto_89204 ) ( ON ?auto_89206 ?auto_89207 ) ( ON ?auto_89205 ?auto_89206 ) ( CLEAR ?auto_89205 ) ( HOLDING ?auto_89203 ) ( CLEAR ?auto_89202 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89202 ?auto_89203 ?auto_89205 )
      ( MAKE-2PILE ?auto_89202 ?auto_89203 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89210 - BLOCK
      ?auto_89211 - BLOCK
    )
    :vars
    (
      ?auto_89217 - BLOCK
      ?auto_89214 - BLOCK
      ?auto_89212 - BLOCK
      ?auto_89216 - BLOCK
      ?auto_89213 - BLOCK
      ?auto_89215 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89210 ) ( not ( = ?auto_89210 ?auto_89211 ) ) ( not ( = ?auto_89210 ?auto_89217 ) ) ( not ( = ?auto_89211 ?auto_89217 ) ) ( not ( = ?auto_89210 ?auto_89214 ) ) ( not ( = ?auto_89210 ?auto_89212 ) ) ( not ( = ?auto_89211 ?auto_89214 ) ) ( not ( = ?auto_89211 ?auto_89212 ) ) ( not ( = ?auto_89217 ?auto_89214 ) ) ( not ( = ?auto_89217 ?auto_89212 ) ) ( not ( = ?auto_89214 ?auto_89212 ) ) ( not ( = ?auto_89216 ?auto_89213 ) ) ( not ( = ?auto_89216 ?auto_89212 ) ) ( not ( = ?auto_89213 ?auto_89212 ) ) ( not ( = ?auto_89210 ?auto_89213 ) ) ( not ( = ?auto_89210 ?auto_89216 ) ) ( not ( = ?auto_89211 ?auto_89213 ) ) ( not ( = ?auto_89211 ?auto_89216 ) ) ( not ( = ?auto_89217 ?auto_89213 ) ) ( not ( = ?auto_89217 ?auto_89216 ) ) ( not ( = ?auto_89214 ?auto_89213 ) ) ( not ( = ?auto_89214 ?auto_89216 ) ) ( ON ?auto_89216 ?auto_89215 ) ( not ( = ?auto_89210 ?auto_89215 ) ) ( not ( = ?auto_89211 ?auto_89215 ) ) ( not ( = ?auto_89217 ?auto_89215 ) ) ( not ( = ?auto_89214 ?auto_89215 ) ) ( not ( = ?auto_89212 ?auto_89215 ) ) ( not ( = ?auto_89216 ?auto_89215 ) ) ( not ( = ?auto_89213 ?auto_89215 ) ) ( ON ?auto_89213 ?auto_89216 ) ( ON-TABLE ?auto_89215 ) ( ON ?auto_89212 ?auto_89213 ) ( ON ?auto_89214 ?auto_89212 ) ( ON ?auto_89217 ?auto_89214 ) ( CLEAR ?auto_89210 ) ( ON ?auto_89211 ?auto_89217 ) ( CLEAR ?auto_89211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89215 ?auto_89216 ?auto_89213 ?auto_89212 ?auto_89214 ?auto_89217 )
      ( MAKE-2PILE ?auto_89210 ?auto_89211 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89218 - BLOCK
      ?auto_89219 - BLOCK
    )
    :vars
    (
      ?auto_89225 - BLOCK
      ?auto_89222 - BLOCK
      ?auto_89224 - BLOCK
      ?auto_89220 - BLOCK
      ?auto_89223 - BLOCK
      ?auto_89221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89218 ?auto_89219 ) ) ( not ( = ?auto_89218 ?auto_89225 ) ) ( not ( = ?auto_89219 ?auto_89225 ) ) ( not ( = ?auto_89218 ?auto_89222 ) ) ( not ( = ?auto_89218 ?auto_89224 ) ) ( not ( = ?auto_89219 ?auto_89222 ) ) ( not ( = ?auto_89219 ?auto_89224 ) ) ( not ( = ?auto_89225 ?auto_89222 ) ) ( not ( = ?auto_89225 ?auto_89224 ) ) ( not ( = ?auto_89222 ?auto_89224 ) ) ( not ( = ?auto_89220 ?auto_89223 ) ) ( not ( = ?auto_89220 ?auto_89224 ) ) ( not ( = ?auto_89223 ?auto_89224 ) ) ( not ( = ?auto_89218 ?auto_89223 ) ) ( not ( = ?auto_89218 ?auto_89220 ) ) ( not ( = ?auto_89219 ?auto_89223 ) ) ( not ( = ?auto_89219 ?auto_89220 ) ) ( not ( = ?auto_89225 ?auto_89223 ) ) ( not ( = ?auto_89225 ?auto_89220 ) ) ( not ( = ?auto_89222 ?auto_89223 ) ) ( not ( = ?auto_89222 ?auto_89220 ) ) ( ON ?auto_89220 ?auto_89221 ) ( not ( = ?auto_89218 ?auto_89221 ) ) ( not ( = ?auto_89219 ?auto_89221 ) ) ( not ( = ?auto_89225 ?auto_89221 ) ) ( not ( = ?auto_89222 ?auto_89221 ) ) ( not ( = ?auto_89224 ?auto_89221 ) ) ( not ( = ?auto_89220 ?auto_89221 ) ) ( not ( = ?auto_89223 ?auto_89221 ) ) ( ON ?auto_89223 ?auto_89220 ) ( ON-TABLE ?auto_89221 ) ( ON ?auto_89224 ?auto_89223 ) ( ON ?auto_89222 ?auto_89224 ) ( ON ?auto_89225 ?auto_89222 ) ( ON ?auto_89219 ?auto_89225 ) ( CLEAR ?auto_89219 ) ( HOLDING ?auto_89218 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89218 )
      ( MAKE-2PILE ?auto_89218 ?auto_89219 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_89226 - BLOCK
      ?auto_89227 - BLOCK
    )
    :vars
    (
      ?auto_89228 - BLOCK
      ?auto_89230 - BLOCK
      ?auto_89229 - BLOCK
      ?auto_89232 - BLOCK
      ?auto_89233 - BLOCK
      ?auto_89231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89226 ?auto_89227 ) ) ( not ( = ?auto_89226 ?auto_89228 ) ) ( not ( = ?auto_89227 ?auto_89228 ) ) ( not ( = ?auto_89226 ?auto_89230 ) ) ( not ( = ?auto_89226 ?auto_89229 ) ) ( not ( = ?auto_89227 ?auto_89230 ) ) ( not ( = ?auto_89227 ?auto_89229 ) ) ( not ( = ?auto_89228 ?auto_89230 ) ) ( not ( = ?auto_89228 ?auto_89229 ) ) ( not ( = ?auto_89230 ?auto_89229 ) ) ( not ( = ?auto_89232 ?auto_89233 ) ) ( not ( = ?auto_89232 ?auto_89229 ) ) ( not ( = ?auto_89233 ?auto_89229 ) ) ( not ( = ?auto_89226 ?auto_89233 ) ) ( not ( = ?auto_89226 ?auto_89232 ) ) ( not ( = ?auto_89227 ?auto_89233 ) ) ( not ( = ?auto_89227 ?auto_89232 ) ) ( not ( = ?auto_89228 ?auto_89233 ) ) ( not ( = ?auto_89228 ?auto_89232 ) ) ( not ( = ?auto_89230 ?auto_89233 ) ) ( not ( = ?auto_89230 ?auto_89232 ) ) ( ON ?auto_89232 ?auto_89231 ) ( not ( = ?auto_89226 ?auto_89231 ) ) ( not ( = ?auto_89227 ?auto_89231 ) ) ( not ( = ?auto_89228 ?auto_89231 ) ) ( not ( = ?auto_89230 ?auto_89231 ) ) ( not ( = ?auto_89229 ?auto_89231 ) ) ( not ( = ?auto_89232 ?auto_89231 ) ) ( not ( = ?auto_89233 ?auto_89231 ) ) ( ON ?auto_89233 ?auto_89232 ) ( ON-TABLE ?auto_89231 ) ( ON ?auto_89229 ?auto_89233 ) ( ON ?auto_89230 ?auto_89229 ) ( ON ?auto_89228 ?auto_89230 ) ( ON ?auto_89227 ?auto_89228 ) ( ON ?auto_89226 ?auto_89227 ) ( CLEAR ?auto_89226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89231 ?auto_89232 ?auto_89233 ?auto_89229 ?auto_89230 ?auto_89228 ?auto_89227 )
      ( MAKE-2PILE ?auto_89226 ?auto_89227 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89239 - BLOCK
      ?auto_89240 - BLOCK
      ?auto_89241 - BLOCK
      ?auto_89242 - BLOCK
      ?auto_89243 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_89243 ) ( CLEAR ?auto_89242 ) ( ON-TABLE ?auto_89239 ) ( ON ?auto_89240 ?auto_89239 ) ( ON ?auto_89241 ?auto_89240 ) ( ON ?auto_89242 ?auto_89241 ) ( not ( = ?auto_89239 ?auto_89240 ) ) ( not ( = ?auto_89239 ?auto_89241 ) ) ( not ( = ?auto_89239 ?auto_89242 ) ) ( not ( = ?auto_89239 ?auto_89243 ) ) ( not ( = ?auto_89240 ?auto_89241 ) ) ( not ( = ?auto_89240 ?auto_89242 ) ) ( not ( = ?auto_89240 ?auto_89243 ) ) ( not ( = ?auto_89241 ?auto_89242 ) ) ( not ( = ?auto_89241 ?auto_89243 ) ) ( not ( = ?auto_89242 ?auto_89243 ) ) )
    :subtasks
    ( ( !STACK ?auto_89243 ?auto_89242 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89244 - BLOCK
      ?auto_89245 - BLOCK
      ?auto_89246 - BLOCK
      ?auto_89247 - BLOCK
      ?auto_89248 - BLOCK
    )
    :vars
    (
      ?auto_89249 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_89247 ) ( ON-TABLE ?auto_89244 ) ( ON ?auto_89245 ?auto_89244 ) ( ON ?auto_89246 ?auto_89245 ) ( ON ?auto_89247 ?auto_89246 ) ( not ( = ?auto_89244 ?auto_89245 ) ) ( not ( = ?auto_89244 ?auto_89246 ) ) ( not ( = ?auto_89244 ?auto_89247 ) ) ( not ( = ?auto_89244 ?auto_89248 ) ) ( not ( = ?auto_89245 ?auto_89246 ) ) ( not ( = ?auto_89245 ?auto_89247 ) ) ( not ( = ?auto_89245 ?auto_89248 ) ) ( not ( = ?auto_89246 ?auto_89247 ) ) ( not ( = ?auto_89246 ?auto_89248 ) ) ( not ( = ?auto_89247 ?auto_89248 ) ) ( ON ?auto_89248 ?auto_89249 ) ( CLEAR ?auto_89248 ) ( HAND-EMPTY ) ( not ( = ?auto_89244 ?auto_89249 ) ) ( not ( = ?auto_89245 ?auto_89249 ) ) ( not ( = ?auto_89246 ?auto_89249 ) ) ( not ( = ?auto_89247 ?auto_89249 ) ) ( not ( = ?auto_89248 ?auto_89249 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89248 ?auto_89249 )
      ( MAKE-5PILE ?auto_89244 ?auto_89245 ?auto_89246 ?auto_89247 ?auto_89248 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89250 - BLOCK
      ?auto_89251 - BLOCK
      ?auto_89252 - BLOCK
      ?auto_89253 - BLOCK
      ?auto_89254 - BLOCK
    )
    :vars
    (
      ?auto_89255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89250 ) ( ON ?auto_89251 ?auto_89250 ) ( ON ?auto_89252 ?auto_89251 ) ( not ( = ?auto_89250 ?auto_89251 ) ) ( not ( = ?auto_89250 ?auto_89252 ) ) ( not ( = ?auto_89250 ?auto_89253 ) ) ( not ( = ?auto_89250 ?auto_89254 ) ) ( not ( = ?auto_89251 ?auto_89252 ) ) ( not ( = ?auto_89251 ?auto_89253 ) ) ( not ( = ?auto_89251 ?auto_89254 ) ) ( not ( = ?auto_89252 ?auto_89253 ) ) ( not ( = ?auto_89252 ?auto_89254 ) ) ( not ( = ?auto_89253 ?auto_89254 ) ) ( ON ?auto_89254 ?auto_89255 ) ( CLEAR ?auto_89254 ) ( not ( = ?auto_89250 ?auto_89255 ) ) ( not ( = ?auto_89251 ?auto_89255 ) ) ( not ( = ?auto_89252 ?auto_89255 ) ) ( not ( = ?auto_89253 ?auto_89255 ) ) ( not ( = ?auto_89254 ?auto_89255 ) ) ( HOLDING ?auto_89253 ) ( CLEAR ?auto_89252 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89250 ?auto_89251 ?auto_89252 ?auto_89253 )
      ( MAKE-5PILE ?auto_89250 ?auto_89251 ?auto_89252 ?auto_89253 ?auto_89254 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89256 - BLOCK
      ?auto_89257 - BLOCK
      ?auto_89258 - BLOCK
      ?auto_89259 - BLOCK
      ?auto_89260 - BLOCK
    )
    :vars
    (
      ?auto_89261 - BLOCK
      ?auto_89262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89256 ) ( ON ?auto_89257 ?auto_89256 ) ( ON ?auto_89258 ?auto_89257 ) ( not ( = ?auto_89256 ?auto_89257 ) ) ( not ( = ?auto_89256 ?auto_89258 ) ) ( not ( = ?auto_89256 ?auto_89259 ) ) ( not ( = ?auto_89256 ?auto_89260 ) ) ( not ( = ?auto_89257 ?auto_89258 ) ) ( not ( = ?auto_89257 ?auto_89259 ) ) ( not ( = ?auto_89257 ?auto_89260 ) ) ( not ( = ?auto_89258 ?auto_89259 ) ) ( not ( = ?auto_89258 ?auto_89260 ) ) ( not ( = ?auto_89259 ?auto_89260 ) ) ( ON ?auto_89260 ?auto_89261 ) ( not ( = ?auto_89256 ?auto_89261 ) ) ( not ( = ?auto_89257 ?auto_89261 ) ) ( not ( = ?auto_89258 ?auto_89261 ) ) ( not ( = ?auto_89259 ?auto_89261 ) ) ( not ( = ?auto_89260 ?auto_89261 ) ) ( CLEAR ?auto_89258 ) ( ON ?auto_89259 ?auto_89260 ) ( CLEAR ?auto_89259 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89262 ) ( ON ?auto_89261 ?auto_89262 ) ( not ( = ?auto_89262 ?auto_89261 ) ) ( not ( = ?auto_89262 ?auto_89260 ) ) ( not ( = ?auto_89262 ?auto_89259 ) ) ( not ( = ?auto_89256 ?auto_89262 ) ) ( not ( = ?auto_89257 ?auto_89262 ) ) ( not ( = ?auto_89258 ?auto_89262 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89262 ?auto_89261 ?auto_89260 )
      ( MAKE-5PILE ?auto_89256 ?auto_89257 ?auto_89258 ?auto_89259 ?auto_89260 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89263 - BLOCK
      ?auto_89264 - BLOCK
      ?auto_89265 - BLOCK
      ?auto_89266 - BLOCK
      ?auto_89267 - BLOCK
    )
    :vars
    (
      ?auto_89269 - BLOCK
      ?auto_89268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89263 ) ( ON ?auto_89264 ?auto_89263 ) ( not ( = ?auto_89263 ?auto_89264 ) ) ( not ( = ?auto_89263 ?auto_89265 ) ) ( not ( = ?auto_89263 ?auto_89266 ) ) ( not ( = ?auto_89263 ?auto_89267 ) ) ( not ( = ?auto_89264 ?auto_89265 ) ) ( not ( = ?auto_89264 ?auto_89266 ) ) ( not ( = ?auto_89264 ?auto_89267 ) ) ( not ( = ?auto_89265 ?auto_89266 ) ) ( not ( = ?auto_89265 ?auto_89267 ) ) ( not ( = ?auto_89266 ?auto_89267 ) ) ( ON ?auto_89267 ?auto_89269 ) ( not ( = ?auto_89263 ?auto_89269 ) ) ( not ( = ?auto_89264 ?auto_89269 ) ) ( not ( = ?auto_89265 ?auto_89269 ) ) ( not ( = ?auto_89266 ?auto_89269 ) ) ( not ( = ?auto_89267 ?auto_89269 ) ) ( ON ?auto_89266 ?auto_89267 ) ( CLEAR ?auto_89266 ) ( ON-TABLE ?auto_89268 ) ( ON ?auto_89269 ?auto_89268 ) ( not ( = ?auto_89268 ?auto_89269 ) ) ( not ( = ?auto_89268 ?auto_89267 ) ) ( not ( = ?auto_89268 ?auto_89266 ) ) ( not ( = ?auto_89263 ?auto_89268 ) ) ( not ( = ?auto_89264 ?auto_89268 ) ) ( not ( = ?auto_89265 ?auto_89268 ) ) ( HOLDING ?auto_89265 ) ( CLEAR ?auto_89264 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89263 ?auto_89264 ?auto_89265 )
      ( MAKE-5PILE ?auto_89263 ?auto_89264 ?auto_89265 ?auto_89266 ?auto_89267 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89270 - BLOCK
      ?auto_89271 - BLOCK
      ?auto_89272 - BLOCK
      ?auto_89273 - BLOCK
      ?auto_89274 - BLOCK
    )
    :vars
    (
      ?auto_89276 - BLOCK
      ?auto_89275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89270 ) ( ON ?auto_89271 ?auto_89270 ) ( not ( = ?auto_89270 ?auto_89271 ) ) ( not ( = ?auto_89270 ?auto_89272 ) ) ( not ( = ?auto_89270 ?auto_89273 ) ) ( not ( = ?auto_89270 ?auto_89274 ) ) ( not ( = ?auto_89271 ?auto_89272 ) ) ( not ( = ?auto_89271 ?auto_89273 ) ) ( not ( = ?auto_89271 ?auto_89274 ) ) ( not ( = ?auto_89272 ?auto_89273 ) ) ( not ( = ?auto_89272 ?auto_89274 ) ) ( not ( = ?auto_89273 ?auto_89274 ) ) ( ON ?auto_89274 ?auto_89276 ) ( not ( = ?auto_89270 ?auto_89276 ) ) ( not ( = ?auto_89271 ?auto_89276 ) ) ( not ( = ?auto_89272 ?auto_89276 ) ) ( not ( = ?auto_89273 ?auto_89276 ) ) ( not ( = ?auto_89274 ?auto_89276 ) ) ( ON ?auto_89273 ?auto_89274 ) ( ON-TABLE ?auto_89275 ) ( ON ?auto_89276 ?auto_89275 ) ( not ( = ?auto_89275 ?auto_89276 ) ) ( not ( = ?auto_89275 ?auto_89274 ) ) ( not ( = ?auto_89275 ?auto_89273 ) ) ( not ( = ?auto_89270 ?auto_89275 ) ) ( not ( = ?auto_89271 ?auto_89275 ) ) ( not ( = ?auto_89272 ?auto_89275 ) ) ( CLEAR ?auto_89271 ) ( ON ?auto_89272 ?auto_89273 ) ( CLEAR ?auto_89272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89275 ?auto_89276 ?auto_89274 ?auto_89273 )
      ( MAKE-5PILE ?auto_89270 ?auto_89271 ?auto_89272 ?auto_89273 ?auto_89274 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89277 - BLOCK
      ?auto_89278 - BLOCK
      ?auto_89279 - BLOCK
      ?auto_89280 - BLOCK
      ?auto_89281 - BLOCK
    )
    :vars
    (
      ?auto_89282 - BLOCK
      ?auto_89283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89277 ) ( not ( = ?auto_89277 ?auto_89278 ) ) ( not ( = ?auto_89277 ?auto_89279 ) ) ( not ( = ?auto_89277 ?auto_89280 ) ) ( not ( = ?auto_89277 ?auto_89281 ) ) ( not ( = ?auto_89278 ?auto_89279 ) ) ( not ( = ?auto_89278 ?auto_89280 ) ) ( not ( = ?auto_89278 ?auto_89281 ) ) ( not ( = ?auto_89279 ?auto_89280 ) ) ( not ( = ?auto_89279 ?auto_89281 ) ) ( not ( = ?auto_89280 ?auto_89281 ) ) ( ON ?auto_89281 ?auto_89282 ) ( not ( = ?auto_89277 ?auto_89282 ) ) ( not ( = ?auto_89278 ?auto_89282 ) ) ( not ( = ?auto_89279 ?auto_89282 ) ) ( not ( = ?auto_89280 ?auto_89282 ) ) ( not ( = ?auto_89281 ?auto_89282 ) ) ( ON ?auto_89280 ?auto_89281 ) ( ON-TABLE ?auto_89283 ) ( ON ?auto_89282 ?auto_89283 ) ( not ( = ?auto_89283 ?auto_89282 ) ) ( not ( = ?auto_89283 ?auto_89281 ) ) ( not ( = ?auto_89283 ?auto_89280 ) ) ( not ( = ?auto_89277 ?auto_89283 ) ) ( not ( = ?auto_89278 ?auto_89283 ) ) ( not ( = ?auto_89279 ?auto_89283 ) ) ( ON ?auto_89279 ?auto_89280 ) ( CLEAR ?auto_89279 ) ( HOLDING ?auto_89278 ) ( CLEAR ?auto_89277 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89277 ?auto_89278 )
      ( MAKE-5PILE ?auto_89277 ?auto_89278 ?auto_89279 ?auto_89280 ?auto_89281 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89284 - BLOCK
      ?auto_89285 - BLOCK
      ?auto_89286 - BLOCK
      ?auto_89287 - BLOCK
      ?auto_89288 - BLOCK
    )
    :vars
    (
      ?auto_89290 - BLOCK
      ?auto_89289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89284 ) ( not ( = ?auto_89284 ?auto_89285 ) ) ( not ( = ?auto_89284 ?auto_89286 ) ) ( not ( = ?auto_89284 ?auto_89287 ) ) ( not ( = ?auto_89284 ?auto_89288 ) ) ( not ( = ?auto_89285 ?auto_89286 ) ) ( not ( = ?auto_89285 ?auto_89287 ) ) ( not ( = ?auto_89285 ?auto_89288 ) ) ( not ( = ?auto_89286 ?auto_89287 ) ) ( not ( = ?auto_89286 ?auto_89288 ) ) ( not ( = ?auto_89287 ?auto_89288 ) ) ( ON ?auto_89288 ?auto_89290 ) ( not ( = ?auto_89284 ?auto_89290 ) ) ( not ( = ?auto_89285 ?auto_89290 ) ) ( not ( = ?auto_89286 ?auto_89290 ) ) ( not ( = ?auto_89287 ?auto_89290 ) ) ( not ( = ?auto_89288 ?auto_89290 ) ) ( ON ?auto_89287 ?auto_89288 ) ( ON-TABLE ?auto_89289 ) ( ON ?auto_89290 ?auto_89289 ) ( not ( = ?auto_89289 ?auto_89290 ) ) ( not ( = ?auto_89289 ?auto_89288 ) ) ( not ( = ?auto_89289 ?auto_89287 ) ) ( not ( = ?auto_89284 ?auto_89289 ) ) ( not ( = ?auto_89285 ?auto_89289 ) ) ( not ( = ?auto_89286 ?auto_89289 ) ) ( ON ?auto_89286 ?auto_89287 ) ( CLEAR ?auto_89284 ) ( ON ?auto_89285 ?auto_89286 ) ( CLEAR ?auto_89285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89289 ?auto_89290 ?auto_89288 ?auto_89287 ?auto_89286 )
      ( MAKE-5PILE ?auto_89284 ?auto_89285 ?auto_89286 ?auto_89287 ?auto_89288 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89291 - BLOCK
      ?auto_89292 - BLOCK
      ?auto_89293 - BLOCK
      ?auto_89294 - BLOCK
      ?auto_89295 - BLOCK
    )
    :vars
    (
      ?auto_89296 - BLOCK
      ?auto_89297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89291 ?auto_89292 ) ) ( not ( = ?auto_89291 ?auto_89293 ) ) ( not ( = ?auto_89291 ?auto_89294 ) ) ( not ( = ?auto_89291 ?auto_89295 ) ) ( not ( = ?auto_89292 ?auto_89293 ) ) ( not ( = ?auto_89292 ?auto_89294 ) ) ( not ( = ?auto_89292 ?auto_89295 ) ) ( not ( = ?auto_89293 ?auto_89294 ) ) ( not ( = ?auto_89293 ?auto_89295 ) ) ( not ( = ?auto_89294 ?auto_89295 ) ) ( ON ?auto_89295 ?auto_89296 ) ( not ( = ?auto_89291 ?auto_89296 ) ) ( not ( = ?auto_89292 ?auto_89296 ) ) ( not ( = ?auto_89293 ?auto_89296 ) ) ( not ( = ?auto_89294 ?auto_89296 ) ) ( not ( = ?auto_89295 ?auto_89296 ) ) ( ON ?auto_89294 ?auto_89295 ) ( ON-TABLE ?auto_89297 ) ( ON ?auto_89296 ?auto_89297 ) ( not ( = ?auto_89297 ?auto_89296 ) ) ( not ( = ?auto_89297 ?auto_89295 ) ) ( not ( = ?auto_89297 ?auto_89294 ) ) ( not ( = ?auto_89291 ?auto_89297 ) ) ( not ( = ?auto_89292 ?auto_89297 ) ) ( not ( = ?auto_89293 ?auto_89297 ) ) ( ON ?auto_89293 ?auto_89294 ) ( ON ?auto_89292 ?auto_89293 ) ( CLEAR ?auto_89292 ) ( HOLDING ?auto_89291 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89291 )
      ( MAKE-5PILE ?auto_89291 ?auto_89292 ?auto_89293 ?auto_89294 ?auto_89295 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89298 - BLOCK
      ?auto_89299 - BLOCK
      ?auto_89300 - BLOCK
      ?auto_89301 - BLOCK
      ?auto_89302 - BLOCK
    )
    :vars
    (
      ?auto_89304 - BLOCK
      ?auto_89303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89298 ?auto_89299 ) ) ( not ( = ?auto_89298 ?auto_89300 ) ) ( not ( = ?auto_89298 ?auto_89301 ) ) ( not ( = ?auto_89298 ?auto_89302 ) ) ( not ( = ?auto_89299 ?auto_89300 ) ) ( not ( = ?auto_89299 ?auto_89301 ) ) ( not ( = ?auto_89299 ?auto_89302 ) ) ( not ( = ?auto_89300 ?auto_89301 ) ) ( not ( = ?auto_89300 ?auto_89302 ) ) ( not ( = ?auto_89301 ?auto_89302 ) ) ( ON ?auto_89302 ?auto_89304 ) ( not ( = ?auto_89298 ?auto_89304 ) ) ( not ( = ?auto_89299 ?auto_89304 ) ) ( not ( = ?auto_89300 ?auto_89304 ) ) ( not ( = ?auto_89301 ?auto_89304 ) ) ( not ( = ?auto_89302 ?auto_89304 ) ) ( ON ?auto_89301 ?auto_89302 ) ( ON-TABLE ?auto_89303 ) ( ON ?auto_89304 ?auto_89303 ) ( not ( = ?auto_89303 ?auto_89304 ) ) ( not ( = ?auto_89303 ?auto_89302 ) ) ( not ( = ?auto_89303 ?auto_89301 ) ) ( not ( = ?auto_89298 ?auto_89303 ) ) ( not ( = ?auto_89299 ?auto_89303 ) ) ( not ( = ?auto_89300 ?auto_89303 ) ) ( ON ?auto_89300 ?auto_89301 ) ( ON ?auto_89299 ?auto_89300 ) ( ON ?auto_89298 ?auto_89299 ) ( CLEAR ?auto_89298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89303 ?auto_89304 ?auto_89302 ?auto_89301 ?auto_89300 ?auto_89299 )
      ( MAKE-5PILE ?auto_89298 ?auto_89299 ?auto_89300 ?auto_89301 ?auto_89302 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89305 - BLOCK
      ?auto_89306 - BLOCK
      ?auto_89307 - BLOCK
      ?auto_89308 - BLOCK
      ?auto_89309 - BLOCK
    )
    :vars
    (
      ?auto_89311 - BLOCK
      ?auto_89310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89305 ?auto_89306 ) ) ( not ( = ?auto_89305 ?auto_89307 ) ) ( not ( = ?auto_89305 ?auto_89308 ) ) ( not ( = ?auto_89305 ?auto_89309 ) ) ( not ( = ?auto_89306 ?auto_89307 ) ) ( not ( = ?auto_89306 ?auto_89308 ) ) ( not ( = ?auto_89306 ?auto_89309 ) ) ( not ( = ?auto_89307 ?auto_89308 ) ) ( not ( = ?auto_89307 ?auto_89309 ) ) ( not ( = ?auto_89308 ?auto_89309 ) ) ( ON ?auto_89309 ?auto_89311 ) ( not ( = ?auto_89305 ?auto_89311 ) ) ( not ( = ?auto_89306 ?auto_89311 ) ) ( not ( = ?auto_89307 ?auto_89311 ) ) ( not ( = ?auto_89308 ?auto_89311 ) ) ( not ( = ?auto_89309 ?auto_89311 ) ) ( ON ?auto_89308 ?auto_89309 ) ( ON-TABLE ?auto_89310 ) ( ON ?auto_89311 ?auto_89310 ) ( not ( = ?auto_89310 ?auto_89311 ) ) ( not ( = ?auto_89310 ?auto_89309 ) ) ( not ( = ?auto_89310 ?auto_89308 ) ) ( not ( = ?auto_89305 ?auto_89310 ) ) ( not ( = ?auto_89306 ?auto_89310 ) ) ( not ( = ?auto_89307 ?auto_89310 ) ) ( ON ?auto_89307 ?auto_89308 ) ( ON ?auto_89306 ?auto_89307 ) ( HOLDING ?auto_89305 ) ( CLEAR ?auto_89306 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89310 ?auto_89311 ?auto_89309 ?auto_89308 ?auto_89307 ?auto_89306 ?auto_89305 )
      ( MAKE-5PILE ?auto_89305 ?auto_89306 ?auto_89307 ?auto_89308 ?auto_89309 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89312 - BLOCK
      ?auto_89313 - BLOCK
      ?auto_89314 - BLOCK
      ?auto_89315 - BLOCK
      ?auto_89316 - BLOCK
    )
    :vars
    (
      ?auto_89318 - BLOCK
      ?auto_89317 - BLOCK
      ?auto_89319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89312 ?auto_89313 ) ) ( not ( = ?auto_89312 ?auto_89314 ) ) ( not ( = ?auto_89312 ?auto_89315 ) ) ( not ( = ?auto_89312 ?auto_89316 ) ) ( not ( = ?auto_89313 ?auto_89314 ) ) ( not ( = ?auto_89313 ?auto_89315 ) ) ( not ( = ?auto_89313 ?auto_89316 ) ) ( not ( = ?auto_89314 ?auto_89315 ) ) ( not ( = ?auto_89314 ?auto_89316 ) ) ( not ( = ?auto_89315 ?auto_89316 ) ) ( ON ?auto_89316 ?auto_89318 ) ( not ( = ?auto_89312 ?auto_89318 ) ) ( not ( = ?auto_89313 ?auto_89318 ) ) ( not ( = ?auto_89314 ?auto_89318 ) ) ( not ( = ?auto_89315 ?auto_89318 ) ) ( not ( = ?auto_89316 ?auto_89318 ) ) ( ON ?auto_89315 ?auto_89316 ) ( ON-TABLE ?auto_89317 ) ( ON ?auto_89318 ?auto_89317 ) ( not ( = ?auto_89317 ?auto_89318 ) ) ( not ( = ?auto_89317 ?auto_89316 ) ) ( not ( = ?auto_89317 ?auto_89315 ) ) ( not ( = ?auto_89312 ?auto_89317 ) ) ( not ( = ?auto_89313 ?auto_89317 ) ) ( not ( = ?auto_89314 ?auto_89317 ) ) ( ON ?auto_89314 ?auto_89315 ) ( ON ?auto_89313 ?auto_89314 ) ( CLEAR ?auto_89313 ) ( ON ?auto_89312 ?auto_89319 ) ( CLEAR ?auto_89312 ) ( HAND-EMPTY ) ( not ( = ?auto_89312 ?auto_89319 ) ) ( not ( = ?auto_89313 ?auto_89319 ) ) ( not ( = ?auto_89314 ?auto_89319 ) ) ( not ( = ?auto_89315 ?auto_89319 ) ) ( not ( = ?auto_89316 ?auto_89319 ) ) ( not ( = ?auto_89318 ?auto_89319 ) ) ( not ( = ?auto_89317 ?auto_89319 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89312 ?auto_89319 )
      ( MAKE-5PILE ?auto_89312 ?auto_89313 ?auto_89314 ?auto_89315 ?auto_89316 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89320 - BLOCK
      ?auto_89321 - BLOCK
      ?auto_89322 - BLOCK
      ?auto_89323 - BLOCK
      ?auto_89324 - BLOCK
    )
    :vars
    (
      ?auto_89325 - BLOCK
      ?auto_89326 - BLOCK
      ?auto_89327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89320 ?auto_89321 ) ) ( not ( = ?auto_89320 ?auto_89322 ) ) ( not ( = ?auto_89320 ?auto_89323 ) ) ( not ( = ?auto_89320 ?auto_89324 ) ) ( not ( = ?auto_89321 ?auto_89322 ) ) ( not ( = ?auto_89321 ?auto_89323 ) ) ( not ( = ?auto_89321 ?auto_89324 ) ) ( not ( = ?auto_89322 ?auto_89323 ) ) ( not ( = ?auto_89322 ?auto_89324 ) ) ( not ( = ?auto_89323 ?auto_89324 ) ) ( ON ?auto_89324 ?auto_89325 ) ( not ( = ?auto_89320 ?auto_89325 ) ) ( not ( = ?auto_89321 ?auto_89325 ) ) ( not ( = ?auto_89322 ?auto_89325 ) ) ( not ( = ?auto_89323 ?auto_89325 ) ) ( not ( = ?auto_89324 ?auto_89325 ) ) ( ON ?auto_89323 ?auto_89324 ) ( ON-TABLE ?auto_89326 ) ( ON ?auto_89325 ?auto_89326 ) ( not ( = ?auto_89326 ?auto_89325 ) ) ( not ( = ?auto_89326 ?auto_89324 ) ) ( not ( = ?auto_89326 ?auto_89323 ) ) ( not ( = ?auto_89320 ?auto_89326 ) ) ( not ( = ?auto_89321 ?auto_89326 ) ) ( not ( = ?auto_89322 ?auto_89326 ) ) ( ON ?auto_89322 ?auto_89323 ) ( ON ?auto_89320 ?auto_89327 ) ( CLEAR ?auto_89320 ) ( not ( = ?auto_89320 ?auto_89327 ) ) ( not ( = ?auto_89321 ?auto_89327 ) ) ( not ( = ?auto_89322 ?auto_89327 ) ) ( not ( = ?auto_89323 ?auto_89327 ) ) ( not ( = ?auto_89324 ?auto_89327 ) ) ( not ( = ?auto_89325 ?auto_89327 ) ) ( not ( = ?auto_89326 ?auto_89327 ) ) ( HOLDING ?auto_89321 ) ( CLEAR ?auto_89322 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89326 ?auto_89325 ?auto_89324 ?auto_89323 ?auto_89322 ?auto_89321 )
      ( MAKE-5PILE ?auto_89320 ?auto_89321 ?auto_89322 ?auto_89323 ?auto_89324 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89328 - BLOCK
      ?auto_89329 - BLOCK
      ?auto_89330 - BLOCK
      ?auto_89331 - BLOCK
      ?auto_89332 - BLOCK
    )
    :vars
    (
      ?auto_89333 - BLOCK
      ?auto_89334 - BLOCK
      ?auto_89335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89328 ?auto_89329 ) ) ( not ( = ?auto_89328 ?auto_89330 ) ) ( not ( = ?auto_89328 ?auto_89331 ) ) ( not ( = ?auto_89328 ?auto_89332 ) ) ( not ( = ?auto_89329 ?auto_89330 ) ) ( not ( = ?auto_89329 ?auto_89331 ) ) ( not ( = ?auto_89329 ?auto_89332 ) ) ( not ( = ?auto_89330 ?auto_89331 ) ) ( not ( = ?auto_89330 ?auto_89332 ) ) ( not ( = ?auto_89331 ?auto_89332 ) ) ( ON ?auto_89332 ?auto_89333 ) ( not ( = ?auto_89328 ?auto_89333 ) ) ( not ( = ?auto_89329 ?auto_89333 ) ) ( not ( = ?auto_89330 ?auto_89333 ) ) ( not ( = ?auto_89331 ?auto_89333 ) ) ( not ( = ?auto_89332 ?auto_89333 ) ) ( ON ?auto_89331 ?auto_89332 ) ( ON-TABLE ?auto_89334 ) ( ON ?auto_89333 ?auto_89334 ) ( not ( = ?auto_89334 ?auto_89333 ) ) ( not ( = ?auto_89334 ?auto_89332 ) ) ( not ( = ?auto_89334 ?auto_89331 ) ) ( not ( = ?auto_89328 ?auto_89334 ) ) ( not ( = ?auto_89329 ?auto_89334 ) ) ( not ( = ?auto_89330 ?auto_89334 ) ) ( ON ?auto_89330 ?auto_89331 ) ( ON ?auto_89328 ?auto_89335 ) ( not ( = ?auto_89328 ?auto_89335 ) ) ( not ( = ?auto_89329 ?auto_89335 ) ) ( not ( = ?auto_89330 ?auto_89335 ) ) ( not ( = ?auto_89331 ?auto_89335 ) ) ( not ( = ?auto_89332 ?auto_89335 ) ) ( not ( = ?auto_89333 ?auto_89335 ) ) ( not ( = ?auto_89334 ?auto_89335 ) ) ( CLEAR ?auto_89330 ) ( ON ?auto_89329 ?auto_89328 ) ( CLEAR ?auto_89329 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89335 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89335 ?auto_89328 )
      ( MAKE-5PILE ?auto_89328 ?auto_89329 ?auto_89330 ?auto_89331 ?auto_89332 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89336 - BLOCK
      ?auto_89337 - BLOCK
      ?auto_89338 - BLOCK
      ?auto_89339 - BLOCK
      ?auto_89340 - BLOCK
    )
    :vars
    (
      ?auto_89342 - BLOCK
      ?auto_89341 - BLOCK
      ?auto_89343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89336 ?auto_89337 ) ) ( not ( = ?auto_89336 ?auto_89338 ) ) ( not ( = ?auto_89336 ?auto_89339 ) ) ( not ( = ?auto_89336 ?auto_89340 ) ) ( not ( = ?auto_89337 ?auto_89338 ) ) ( not ( = ?auto_89337 ?auto_89339 ) ) ( not ( = ?auto_89337 ?auto_89340 ) ) ( not ( = ?auto_89338 ?auto_89339 ) ) ( not ( = ?auto_89338 ?auto_89340 ) ) ( not ( = ?auto_89339 ?auto_89340 ) ) ( ON ?auto_89340 ?auto_89342 ) ( not ( = ?auto_89336 ?auto_89342 ) ) ( not ( = ?auto_89337 ?auto_89342 ) ) ( not ( = ?auto_89338 ?auto_89342 ) ) ( not ( = ?auto_89339 ?auto_89342 ) ) ( not ( = ?auto_89340 ?auto_89342 ) ) ( ON ?auto_89339 ?auto_89340 ) ( ON-TABLE ?auto_89341 ) ( ON ?auto_89342 ?auto_89341 ) ( not ( = ?auto_89341 ?auto_89342 ) ) ( not ( = ?auto_89341 ?auto_89340 ) ) ( not ( = ?auto_89341 ?auto_89339 ) ) ( not ( = ?auto_89336 ?auto_89341 ) ) ( not ( = ?auto_89337 ?auto_89341 ) ) ( not ( = ?auto_89338 ?auto_89341 ) ) ( ON ?auto_89336 ?auto_89343 ) ( not ( = ?auto_89336 ?auto_89343 ) ) ( not ( = ?auto_89337 ?auto_89343 ) ) ( not ( = ?auto_89338 ?auto_89343 ) ) ( not ( = ?auto_89339 ?auto_89343 ) ) ( not ( = ?auto_89340 ?auto_89343 ) ) ( not ( = ?auto_89342 ?auto_89343 ) ) ( not ( = ?auto_89341 ?auto_89343 ) ) ( ON ?auto_89337 ?auto_89336 ) ( CLEAR ?auto_89337 ) ( ON-TABLE ?auto_89343 ) ( HOLDING ?auto_89338 ) ( CLEAR ?auto_89339 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89341 ?auto_89342 ?auto_89340 ?auto_89339 ?auto_89338 )
      ( MAKE-5PILE ?auto_89336 ?auto_89337 ?auto_89338 ?auto_89339 ?auto_89340 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89344 - BLOCK
      ?auto_89345 - BLOCK
      ?auto_89346 - BLOCK
      ?auto_89347 - BLOCK
      ?auto_89348 - BLOCK
    )
    :vars
    (
      ?auto_89350 - BLOCK
      ?auto_89349 - BLOCK
      ?auto_89351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89344 ?auto_89345 ) ) ( not ( = ?auto_89344 ?auto_89346 ) ) ( not ( = ?auto_89344 ?auto_89347 ) ) ( not ( = ?auto_89344 ?auto_89348 ) ) ( not ( = ?auto_89345 ?auto_89346 ) ) ( not ( = ?auto_89345 ?auto_89347 ) ) ( not ( = ?auto_89345 ?auto_89348 ) ) ( not ( = ?auto_89346 ?auto_89347 ) ) ( not ( = ?auto_89346 ?auto_89348 ) ) ( not ( = ?auto_89347 ?auto_89348 ) ) ( ON ?auto_89348 ?auto_89350 ) ( not ( = ?auto_89344 ?auto_89350 ) ) ( not ( = ?auto_89345 ?auto_89350 ) ) ( not ( = ?auto_89346 ?auto_89350 ) ) ( not ( = ?auto_89347 ?auto_89350 ) ) ( not ( = ?auto_89348 ?auto_89350 ) ) ( ON ?auto_89347 ?auto_89348 ) ( ON-TABLE ?auto_89349 ) ( ON ?auto_89350 ?auto_89349 ) ( not ( = ?auto_89349 ?auto_89350 ) ) ( not ( = ?auto_89349 ?auto_89348 ) ) ( not ( = ?auto_89349 ?auto_89347 ) ) ( not ( = ?auto_89344 ?auto_89349 ) ) ( not ( = ?auto_89345 ?auto_89349 ) ) ( not ( = ?auto_89346 ?auto_89349 ) ) ( ON ?auto_89344 ?auto_89351 ) ( not ( = ?auto_89344 ?auto_89351 ) ) ( not ( = ?auto_89345 ?auto_89351 ) ) ( not ( = ?auto_89346 ?auto_89351 ) ) ( not ( = ?auto_89347 ?auto_89351 ) ) ( not ( = ?auto_89348 ?auto_89351 ) ) ( not ( = ?auto_89350 ?auto_89351 ) ) ( not ( = ?auto_89349 ?auto_89351 ) ) ( ON ?auto_89345 ?auto_89344 ) ( ON-TABLE ?auto_89351 ) ( CLEAR ?auto_89347 ) ( ON ?auto_89346 ?auto_89345 ) ( CLEAR ?auto_89346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89351 ?auto_89344 ?auto_89345 )
      ( MAKE-5PILE ?auto_89344 ?auto_89345 ?auto_89346 ?auto_89347 ?auto_89348 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89352 - BLOCK
      ?auto_89353 - BLOCK
      ?auto_89354 - BLOCK
      ?auto_89355 - BLOCK
      ?auto_89356 - BLOCK
    )
    :vars
    (
      ?auto_89358 - BLOCK
      ?auto_89357 - BLOCK
      ?auto_89359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89352 ?auto_89353 ) ) ( not ( = ?auto_89352 ?auto_89354 ) ) ( not ( = ?auto_89352 ?auto_89355 ) ) ( not ( = ?auto_89352 ?auto_89356 ) ) ( not ( = ?auto_89353 ?auto_89354 ) ) ( not ( = ?auto_89353 ?auto_89355 ) ) ( not ( = ?auto_89353 ?auto_89356 ) ) ( not ( = ?auto_89354 ?auto_89355 ) ) ( not ( = ?auto_89354 ?auto_89356 ) ) ( not ( = ?auto_89355 ?auto_89356 ) ) ( ON ?auto_89356 ?auto_89358 ) ( not ( = ?auto_89352 ?auto_89358 ) ) ( not ( = ?auto_89353 ?auto_89358 ) ) ( not ( = ?auto_89354 ?auto_89358 ) ) ( not ( = ?auto_89355 ?auto_89358 ) ) ( not ( = ?auto_89356 ?auto_89358 ) ) ( ON-TABLE ?auto_89357 ) ( ON ?auto_89358 ?auto_89357 ) ( not ( = ?auto_89357 ?auto_89358 ) ) ( not ( = ?auto_89357 ?auto_89356 ) ) ( not ( = ?auto_89357 ?auto_89355 ) ) ( not ( = ?auto_89352 ?auto_89357 ) ) ( not ( = ?auto_89353 ?auto_89357 ) ) ( not ( = ?auto_89354 ?auto_89357 ) ) ( ON ?auto_89352 ?auto_89359 ) ( not ( = ?auto_89352 ?auto_89359 ) ) ( not ( = ?auto_89353 ?auto_89359 ) ) ( not ( = ?auto_89354 ?auto_89359 ) ) ( not ( = ?auto_89355 ?auto_89359 ) ) ( not ( = ?auto_89356 ?auto_89359 ) ) ( not ( = ?auto_89358 ?auto_89359 ) ) ( not ( = ?auto_89357 ?auto_89359 ) ) ( ON ?auto_89353 ?auto_89352 ) ( ON-TABLE ?auto_89359 ) ( ON ?auto_89354 ?auto_89353 ) ( CLEAR ?auto_89354 ) ( HOLDING ?auto_89355 ) ( CLEAR ?auto_89356 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89357 ?auto_89358 ?auto_89356 ?auto_89355 )
      ( MAKE-5PILE ?auto_89352 ?auto_89353 ?auto_89354 ?auto_89355 ?auto_89356 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89360 - BLOCK
      ?auto_89361 - BLOCK
      ?auto_89362 - BLOCK
      ?auto_89363 - BLOCK
      ?auto_89364 - BLOCK
    )
    :vars
    (
      ?auto_89365 - BLOCK
      ?auto_89366 - BLOCK
      ?auto_89367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89360 ?auto_89361 ) ) ( not ( = ?auto_89360 ?auto_89362 ) ) ( not ( = ?auto_89360 ?auto_89363 ) ) ( not ( = ?auto_89360 ?auto_89364 ) ) ( not ( = ?auto_89361 ?auto_89362 ) ) ( not ( = ?auto_89361 ?auto_89363 ) ) ( not ( = ?auto_89361 ?auto_89364 ) ) ( not ( = ?auto_89362 ?auto_89363 ) ) ( not ( = ?auto_89362 ?auto_89364 ) ) ( not ( = ?auto_89363 ?auto_89364 ) ) ( ON ?auto_89364 ?auto_89365 ) ( not ( = ?auto_89360 ?auto_89365 ) ) ( not ( = ?auto_89361 ?auto_89365 ) ) ( not ( = ?auto_89362 ?auto_89365 ) ) ( not ( = ?auto_89363 ?auto_89365 ) ) ( not ( = ?auto_89364 ?auto_89365 ) ) ( ON-TABLE ?auto_89366 ) ( ON ?auto_89365 ?auto_89366 ) ( not ( = ?auto_89366 ?auto_89365 ) ) ( not ( = ?auto_89366 ?auto_89364 ) ) ( not ( = ?auto_89366 ?auto_89363 ) ) ( not ( = ?auto_89360 ?auto_89366 ) ) ( not ( = ?auto_89361 ?auto_89366 ) ) ( not ( = ?auto_89362 ?auto_89366 ) ) ( ON ?auto_89360 ?auto_89367 ) ( not ( = ?auto_89360 ?auto_89367 ) ) ( not ( = ?auto_89361 ?auto_89367 ) ) ( not ( = ?auto_89362 ?auto_89367 ) ) ( not ( = ?auto_89363 ?auto_89367 ) ) ( not ( = ?auto_89364 ?auto_89367 ) ) ( not ( = ?auto_89365 ?auto_89367 ) ) ( not ( = ?auto_89366 ?auto_89367 ) ) ( ON ?auto_89361 ?auto_89360 ) ( ON-TABLE ?auto_89367 ) ( ON ?auto_89362 ?auto_89361 ) ( CLEAR ?auto_89364 ) ( ON ?auto_89363 ?auto_89362 ) ( CLEAR ?auto_89363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89367 ?auto_89360 ?auto_89361 ?auto_89362 )
      ( MAKE-5PILE ?auto_89360 ?auto_89361 ?auto_89362 ?auto_89363 ?auto_89364 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89368 - BLOCK
      ?auto_89369 - BLOCK
      ?auto_89370 - BLOCK
      ?auto_89371 - BLOCK
      ?auto_89372 - BLOCK
    )
    :vars
    (
      ?auto_89374 - BLOCK
      ?auto_89373 - BLOCK
      ?auto_89375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89368 ?auto_89369 ) ) ( not ( = ?auto_89368 ?auto_89370 ) ) ( not ( = ?auto_89368 ?auto_89371 ) ) ( not ( = ?auto_89368 ?auto_89372 ) ) ( not ( = ?auto_89369 ?auto_89370 ) ) ( not ( = ?auto_89369 ?auto_89371 ) ) ( not ( = ?auto_89369 ?auto_89372 ) ) ( not ( = ?auto_89370 ?auto_89371 ) ) ( not ( = ?auto_89370 ?auto_89372 ) ) ( not ( = ?auto_89371 ?auto_89372 ) ) ( not ( = ?auto_89368 ?auto_89374 ) ) ( not ( = ?auto_89369 ?auto_89374 ) ) ( not ( = ?auto_89370 ?auto_89374 ) ) ( not ( = ?auto_89371 ?auto_89374 ) ) ( not ( = ?auto_89372 ?auto_89374 ) ) ( ON-TABLE ?auto_89373 ) ( ON ?auto_89374 ?auto_89373 ) ( not ( = ?auto_89373 ?auto_89374 ) ) ( not ( = ?auto_89373 ?auto_89372 ) ) ( not ( = ?auto_89373 ?auto_89371 ) ) ( not ( = ?auto_89368 ?auto_89373 ) ) ( not ( = ?auto_89369 ?auto_89373 ) ) ( not ( = ?auto_89370 ?auto_89373 ) ) ( ON ?auto_89368 ?auto_89375 ) ( not ( = ?auto_89368 ?auto_89375 ) ) ( not ( = ?auto_89369 ?auto_89375 ) ) ( not ( = ?auto_89370 ?auto_89375 ) ) ( not ( = ?auto_89371 ?auto_89375 ) ) ( not ( = ?auto_89372 ?auto_89375 ) ) ( not ( = ?auto_89374 ?auto_89375 ) ) ( not ( = ?auto_89373 ?auto_89375 ) ) ( ON ?auto_89369 ?auto_89368 ) ( ON-TABLE ?auto_89375 ) ( ON ?auto_89370 ?auto_89369 ) ( ON ?auto_89371 ?auto_89370 ) ( CLEAR ?auto_89371 ) ( HOLDING ?auto_89372 ) ( CLEAR ?auto_89374 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89373 ?auto_89374 ?auto_89372 )
      ( MAKE-5PILE ?auto_89368 ?auto_89369 ?auto_89370 ?auto_89371 ?auto_89372 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89376 - BLOCK
      ?auto_89377 - BLOCK
      ?auto_89378 - BLOCK
      ?auto_89379 - BLOCK
      ?auto_89380 - BLOCK
    )
    :vars
    (
      ?auto_89381 - BLOCK
      ?auto_89383 - BLOCK
      ?auto_89382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89376 ?auto_89377 ) ) ( not ( = ?auto_89376 ?auto_89378 ) ) ( not ( = ?auto_89376 ?auto_89379 ) ) ( not ( = ?auto_89376 ?auto_89380 ) ) ( not ( = ?auto_89377 ?auto_89378 ) ) ( not ( = ?auto_89377 ?auto_89379 ) ) ( not ( = ?auto_89377 ?auto_89380 ) ) ( not ( = ?auto_89378 ?auto_89379 ) ) ( not ( = ?auto_89378 ?auto_89380 ) ) ( not ( = ?auto_89379 ?auto_89380 ) ) ( not ( = ?auto_89376 ?auto_89381 ) ) ( not ( = ?auto_89377 ?auto_89381 ) ) ( not ( = ?auto_89378 ?auto_89381 ) ) ( not ( = ?auto_89379 ?auto_89381 ) ) ( not ( = ?auto_89380 ?auto_89381 ) ) ( ON-TABLE ?auto_89383 ) ( ON ?auto_89381 ?auto_89383 ) ( not ( = ?auto_89383 ?auto_89381 ) ) ( not ( = ?auto_89383 ?auto_89380 ) ) ( not ( = ?auto_89383 ?auto_89379 ) ) ( not ( = ?auto_89376 ?auto_89383 ) ) ( not ( = ?auto_89377 ?auto_89383 ) ) ( not ( = ?auto_89378 ?auto_89383 ) ) ( ON ?auto_89376 ?auto_89382 ) ( not ( = ?auto_89376 ?auto_89382 ) ) ( not ( = ?auto_89377 ?auto_89382 ) ) ( not ( = ?auto_89378 ?auto_89382 ) ) ( not ( = ?auto_89379 ?auto_89382 ) ) ( not ( = ?auto_89380 ?auto_89382 ) ) ( not ( = ?auto_89381 ?auto_89382 ) ) ( not ( = ?auto_89383 ?auto_89382 ) ) ( ON ?auto_89377 ?auto_89376 ) ( ON-TABLE ?auto_89382 ) ( ON ?auto_89378 ?auto_89377 ) ( ON ?auto_89379 ?auto_89378 ) ( CLEAR ?auto_89381 ) ( ON ?auto_89380 ?auto_89379 ) ( CLEAR ?auto_89380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89382 ?auto_89376 ?auto_89377 ?auto_89378 ?auto_89379 )
      ( MAKE-5PILE ?auto_89376 ?auto_89377 ?auto_89378 ?auto_89379 ?auto_89380 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89384 - BLOCK
      ?auto_89385 - BLOCK
      ?auto_89386 - BLOCK
      ?auto_89387 - BLOCK
      ?auto_89388 - BLOCK
    )
    :vars
    (
      ?auto_89390 - BLOCK
      ?auto_89389 - BLOCK
      ?auto_89391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89384 ?auto_89385 ) ) ( not ( = ?auto_89384 ?auto_89386 ) ) ( not ( = ?auto_89384 ?auto_89387 ) ) ( not ( = ?auto_89384 ?auto_89388 ) ) ( not ( = ?auto_89385 ?auto_89386 ) ) ( not ( = ?auto_89385 ?auto_89387 ) ) ( not ( = ?auto_89385 ?auto_89388 ) ) ( not ( = ?auto_89386 ?auto_89387 ) ) ( not ( = ?auto_89386 ?auto_89388 ) ) ( not ( = ?auto_89387 ?auto_89388 ) ) ( not ( = ?auto_89384 ?auto_89390 ) ) ( not ( = ?auto_89385 ?auto_89390 ) ) ( not ( = ?auto_89386 ?auto_89390 ) ) ( not ( = ?auto_89387 ?auto_89390 ) ) ( not ( = ?auto_89388 ?auto_89390 ) ) ( ON-TABLE ?auto_89389 ) ( not ( = ?auto_89389 ?auto_89390 ) ) ( not ( = ?auto_89389 ?auto_89388 ) ) ( not ( = ?auto_89389 ?auto_89387 ) ) ( not ( = ?auto_89384 ?auto_89389 ) ) ( not ( = ?auto_89385 ?auto_89389 ) ) ( not ( = ?auto_89386 ?auto_89389 ) ) ( ON ?auto_89384 ?auto_89391 ) ( not ( = ?auto_89384 ?auto_89391 ) ) ( not ( = ?auto_89385 ?auto_89391 ) ) ( not ( = ?auto_89386 ?auto_89391 ) ) ( not ( = ?auto_89387 ?auto_89391 ) ) ( not ( = ?auto_89388 ?auto_89391 ) ) ( not ( = ?auto_89390 ?auto_89391 ) ) ( not ( = ?auto_89389 ?auto_89391 ) ) ( ON ?auto_89385 ?auto_89384 ) ( ON-TABLE ?auto_89391 ) ( ON ?auto_89386 ?auto_89385 ) ( ON ?auto_89387 ?auto_89386 ) ( ON ?auto_89388 ?auto_89387 ) ( CLEAR ?auto_89388 ) ( HOLDING ?auto_89390 ) ( CLEAR ?auto_89389 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89389 ?auto_89390 )
      ( MAKE-5PILE ?auto_89384 ?auto_89385 ?auto_89386 ?auto_89387 ?auto_89388 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89392 - BLOCK
      ?auto_89393 - BLOCK
      ?auto_89394 - BLOCK
      ?auto_89395 - BLOCK
      ?auto_89396 - BLOCK
    )
    :vars
    (
      ?auto_89398 - BLOCK
      ?auto_89399 - BLOCK
      ?auto_89397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89392 ?auto_89393 ) ) ( not ( = ?auto_89392 ?auto_89394 ) ) ( not ( = ?auto_89392 ?auto_89395 ) ) ( not ( = ?auto_89392 ?auto_89396 ) ) ( not ( = ?auto_89393 ?auto_89394 ) ) ( not ( = ?auto_89393 ?auto_89395 ) ) ( not ( = ?auto_89393 ?auto_89396 ) ) ( not ( = ?auto_89394 ?auto_89395 ) ) ( not ( = ?auto_89394 ?auto_89396 ) ) ( not ( = ?auto_89395 ?auto_89396 ) ) ( not ( = ?auto_89392 ?auto_89398 ) ) ( not ( = ?auto_89393 ?auto_89398 ) ) ( not ( = ?auto_89394 ?auto_89398 ) ) ( not ( = ?auto_89395 ?auto_89398 ) ) ( not ( = ?auto_89396 ?auto_89398 ) ) ( ON-TABLE ?auto_89399 ) ( not ( = ?auto_89399 ?auto_89398 ) ) ( not ( = ?auto_89399 ?auto_89396 ) ) ( not ( = ?auto_89399 ?auto_89395 ) ) ( not ( = ?auto_89392 ?auto_89399 ) ) ( not ( = ?auto_89393 ?auto_89399 ) ) ( not ( = ?auto_89394 ?auto_89399 ) ) ( ON ?auto_89392 ?auto_89397 ) ( not ( = ?auto_89392 ?auto_89397 ) ) ( not ( = ?auto_89393 ?auto_89397 ) ) ( not ( = ?auto_89394 ?auto_89397 ) ) ( not ( = ?auto_89395 ?auto_89397 ) ) ( not ( = ?auto_89396 ?auto_89397 ) ) ( not ( = ?auto_89398 ?auto_89397 ) ) ( not ( = ?auto_89399 ?auto_89397 ) ) ( ON ?auto_89393 ?auto_89392 ) ( ON-TABLE ?auto_89397 ) ( ON ?auto_89394 ?auto_89393 ) ( ON ?auto_89395 ?auto_89394 ) ( ON ?auto_89396 ?auto_89395 ) ( CLEAR ?auto_89399 ) ( ON ?auto_89398 ?auto_89396 ) ( CLEAR ?auto_89398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89397 ?auto_89392 ?auto_89393 ?auto_89394 ?auto_89395 ?auto_89396 )
      ( MAKE-5PILE ?auto_89392 ?auto_89393 ?auto_89394 ?auto_89395 ?auto_89396 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89400 - BLOCK
      ?auto_89401 - BLOCK
      ?auto_89402 - BLOCK
      ?auto_89403 - BLOCK
      ?auto_89404 - BLOCK
    )
    :vars
    (
      ?auto_89405 - BLOCK
      ?auto_89407 - BLOCK
      ?auto_89406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89400 ?auto_89401 ) ) ( not ( = ?auto_89400 ?auto_89402 ) ) ( not ( = ?auto_89400 ?auto_89403 ) ) ( not ( = ?auto_89400 ?auto_89404 ) ) ( not ( = ?auto_89401 ?auto_89402 ) ) ( not ( = ?auto_89401 ?auto_89403 ) ) ( not ( = ?auto_89401 ?auto_89404 ) ) ( not ( = ?auto_89402 ?auto_89403 ) ) ( not ( = ?auto_89402 ?auto_89404 ) ) ( not ( = ?auto_89403 ?auto_89404 ) ) ( not ( = ?auto_89400 ?auto_89405 ) ) ( not ( = ?auto_89401 ?auto_89405 ) ) ( not ( = ?auto_89402 ?auto_89405 ) ) ( not ( = ?auto_89403 ?auto_89405 ) ) ( not ( = ?auto_89404 ?auto_89405 ) ) ( not ( = ?auto_89407 ?auto_89405 ) ) ( not ( = ?auto_89407 ?auto_89404 ) ) ( not ( = ?auto_89407 ?auto_89403 ) ) ( not ( = ?auto_89400 ?auto_89407 ) ) ( not ( = ?auto_89401 ?auto_89407 ) ) ( not ( = ?auto_89402 ?auto_89407 ) ) ( ON ?auto_89400 ?auto_89406 ) ( not ( = ?auto_89400 ?auto_89406 ) ) ( not ( = ?auto_89401 ?auto_89406 ) ) ( not ( = ?auto_89402 ?auto_89406 ) ) ( not ( = ?auto_89403 ?auto_89406 ) ) ( not ( = ?auto_89404 ?auto_89406 ) ) ( not ( = ?auto_89405 ?auto_89406 ) ) ( not ( = ?auto_89407 ?auto_89406 ) ) ( ON ?auto_89401 ?auto_89400 ) ( ON-TABLE ?auto_89406 ) ( ON ?auto_89402 ?auto_89401 ) ( ON ?auto_89403 ?auto_89402 ) ( ON ?auto_89404 ?auto_89403 ) ( ON ?auto_89405 ?auto_89404 ) ( CLEAR ?auto_89405 ) ( HOLDING ?auto_89407 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89407 )
      ( MAKE-5PILE ?auto_89400 ?auto_89401 ?auto_89402 ?auto_89403 ?auto_89404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_89408 - BLOCK
      ?auto_89409 - BLOCK
      ?auto_89410 - BLOCK
      ?auto_89411 - BLOCK
      ?auto_89412 - BLOCK
    )
    :vars
    (
      ?auto_89414 - BLOCK
      ?auto_89413 - BLOCK
      ?auto_89415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89408 ?auto_89409 ) ) ( not ( = ?auto_89408 ?auto_89410 ) ) ( not ( = ?auto_89408 ?auto_89411 ) ) ( not ( = ?auto_89408 ?auto_89412 ) ) ( not ( = ?auto_89409 ?auto_89410 ) ) ( not ( = ?auto_89409 ?auto_89411 ) ) ( not ( = ?auto_89409 ?auto_89412 ) ) ( not ( = ?auto_89410 ?auto_89411 ) ) ( not ( = ?auto_89410 ?auto_89412 ) ) ( not ( = ?auto_89411 ?auto_89412 ) ) ( not ( = ?auto_89408 ?auto_89414 ) ) ( not ( = ?auto_89409 ?auto_89414 ) ) ( not ( = ?auto_89410 ?auto_89414 ) ) ( not ( = ?auto_89411 ?auto_89414 ) ) ( not ( = ?auto_89412 ?auto_89414 ) ) ( not ( = ?auto_89413 ?auto_89414 ) ) ( not ( = ?auto_89413 ?auto_89412 ) ) ( not ( = ?auto_89413 ?auto_89411 ) ) ( not ( = ?auto_89408 ?auto_89413 ) ) ( not ( = ?auto_89409 ?auto_89413 ) ) ( not ( = ?auto_89410 ?auto_89413 ) ) ( ON ?auto_89408 ?auto_89415 ) ( not ( = ?auto_89408 ?auto_89415 ) ) ( not ( = ?auto_89409 ?auto_89415 ) ) ( not ( = ?auto_89410 ?auto_89415 ) ) ( not ( = ?auto_89411 ?auto_89415 ) ) ( not ( = ?auto_89412 ?auto_89415 ) ) ( not ( = ?auto_89414 ?auto_89415 ) ) ( not ( = ?auto_89413 ?auto_89415 ) ) ( ON ?auto_89409 ?auto_89408 ) ( ON-TABLE ?auto_89415 ) ( ON ?auto_89410 ?auto_89409 ) ( ON ?auto_89411 ?auto_89410 ) ( ON ?auto_89412 ?auto_89411 ) ( ON ?auto_89414 ?auto_89412 ) ( ON ?auto_89413 ?auto_89414 ) ( CLEAR ?auto_89413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89415 ?auto_89408 ?auto_89409 ?auto_89410 ?auto_89411 ?auto_89412 ?auto_89414 )
      ( MAKE-5PILE ?auto_89408 ?auto_89409 ?auto_89410 ?auto_89411 ?auto_89412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89417 - BLOCK
    )
    :vars
    (
      ?auto_89418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89418 ?auto_89417 ) ( CLEAR ?auto_89418 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89417 ) ( not ( = ?auto_89417 ?auto_89418 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89418 ?auto_89417 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89419 - BLOCK
    )
    :vars
    (
      ?auto_89420 - BLOCK
      ?auto_89421 - BLOCK
      ?auto_89422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89420 ?auto_89419 ) ( CLEAR ?auto_89420 ) ( ON-TABLE ?auto_89419 ) ( not ( = ?auto_89419 ?auto_89420 ) ) ( HOLDING ?auto_89421 ) ( CLEAR ?auto_89422 ) ( not ( = ?auto_89419 ?auto_89421 ) ) ( not ( = ?auto_89419 ?auto_89422 ) ) ( not ( = ?auto_89420 ?auto_89421 ) ) ( not ( = ?auto_89420 ?auto_89422 ) ) ( not ( = ?auto_89421 ?auto_89422 ) ) )
    :subtasks
    ( ( !STACK ?auto_89421 ?auto_89422 )
      ( MAKE-1PILE ?auto_89419 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89423 - BLOCK
    )
    :vars
    (
      ?auto_89424 - BLOCK
      ?auto_89425 - BLOCK
      ?auto_89426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89424 ?auto_89423 ) ( ON-TABLE ?auto_89423 ) ( not ( = ?auto_89423 ?auto_89424 ) ) ( CLEAR ?auto_89425 ) ( not ( = ?auto_89423 ?auto_89426 ) ) ( not ( = ?auto_89423 ?auto_89425 ) ) ( not ( = ?auto_89424 ?auto_89426 ) ) ( not ( = ?auto_89424 ?auto_89425 ) ) ( not ( = ?auto_89426 ?auto_89425 ) ) ( ON ?auto_89426 ?auto_89424 ) ( CLEAR ?auto_89426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89423 ?auto_89424 )
      ( MAKE-1PILE ?auto_89423 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89427 - BLOCK
    )
    :vars
    (
      ?auto_89429 - BLOCK
      ?auto_89430 - BLOCK
      ?auto_89428 - BLOCK
      ?auto_89431 - BLOCK
      ?auto_89432 - BLOCK
      ?auto_89433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89429 ?auto_89427 ) ( ON-TABLE ?auto_89427 ) ( not ( = ?auto_89427 ?auto_89429 ) ) ( not ( = ?auto_89427 ?auto_89430 ) ) ( not ( = ?auto_89427 ?auto_89428 ) ) ( not ( = ?auto_89429 ?auto_89430 ) ) ( not ( = ?auto_89429 ?auto_89428 ) ) ( not ( = ?auto_89430 ?auto_89428 ) ) ( ON ?auto_89430 ?auto_89429 ) ( CLEAR ?auto_89430 ) ( HOLDING ?auto_89428 ) ( CLEAR ?auto_89431 ) ( ON-TABLE ?auto_89432 ) ( ON ?auto_89433 ?auto_89432 ) ( ON ?auto_89431 ?auto_89433 ) ( not ( = ?auto_89432 ?auto_89433 ) ) ( not ( = ?auto_89432 ?auto_89431 ) ) ( not ( = ?auto_89432 ?auto_89428 ) ) ( not ( = ?auto_89433 ?auto_89431 ) ) ( not ( = ?auto_89433 ?auto_89428 ) ) ( not ( = ?auto_89431 ?auto_89428 ) ) ( not ( = ?auto_89427 ?auto_89431 ) ) ( not ( = ?auto_89427 ?auto_89432 ) ) ( not ( = ?auto_89427 ?auto_89433 ) ) ( not ( = ?auto_89429 ?auto_89431 ) ) ( not ( = ?auto_89429 ?auto_89432 ) ) ( not ( = ?auto_89429 ?auto_89433 ) ) ( not ( = ?auto_89430 ?auto_89431 ) ) ( not ( = ?auto_89430 ?auto_89432 ) ) ( not ( = ?auto_89430 ?auto_89433 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89432 ?auto_89433 ?auto_89431 ?auto_89428 )
      ( MAKE-1PILE ?auto_89427 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89434 - BLOCK
    )
    :vars
    (
      ?auto_89440 - BLOCK
      ?auto_89439 - BLOCK
      ?auto_89438 - BLOCK
      ?auto_89437 - BLOCK
      ?auto_89436 - BLOCK
      ?auto_89435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89440 ?auto_89434 ) ( ON-TABLE ?auto_89434 ) ( not ( = ?auto_89434 ?auto_89440 ) ) ( not ( = ?auto_89434 ?auto_89439 ) ) ( not ( = ?auto_89434 ?auto_89438 ) ) ( not ( = ?auto_89440 ?auto_89439 ) ) ( not ( = ?auto_89440 ?auto_89438 ) ) ( not ( = ?auto_89439 ?auto_89438 ) ) ( ON ?auto_89439 ?auto_89440 ) ( CLEAR ?auto_89437 ) ( ON-TABLE ?auto_89436 ) ( ON ?auto_89435 ?auto_89436 ) ( ON ?auto_89437 ?auto_89435 ) ( not ( = ?auto_89436 ?auto_89435 ) ) ( not ( = ?auto_89436 ?auto_89437 ) ) ( not ( = ?auto_89436 ?auto_89438 ) ) ( not ( = ?auto_89435 ?auto_89437 ) ) ( not ( = ?auto_89435 ?auto_89438 ) ) ( not ( = ?auto_89437 ?auto_89438 ) ) ( not ( = ?auto_89434 ?auto_89437 ) ) ( not ( = ?auto_89434 ?auto_89436 ) ) ( not ( = ?auto_89434 ?auto_89435 ) ) ( not ( = ?auto_89440 ?auto_89437 ) ) ( not ( = ?auto_89440 ?auto_89436 ) ) ( not ( = ?auto_89440 ?auto_89435 ) ) ( not ( = ?auto_89439 ?auto_89437 ) ) ( not ( = ?auto_89439 ?auto_89436 ) ) ( not ( = ?auto_89439 ?auto_89435 ) ) ( ON ?auto_89438 ?auto_89439 ) ( CLEAR ?auto_89438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89434 ?auto_89440 ?auto_89439 )
      ( MAKE-1PILE ?auto_89434 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89441 - BLOCK
    )
    :vars
    (
      ?auto_89445 - BLOCK
      ?auto_89446 - BLOCK
      ?auto_89443 - BLOCK
      ?auto_89444 - BLOCK
      ?auto_89447 - BLOCK
      ?auto_89442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89445 ?auto_89441 ) ( ON-TABLE ?auto_89441 ) ( not ( = ?auto_89441 ?auto_89445 ) ) ( not ( = ?auto_89441 ?auto_89446 ) ) ( not ( = ?auto_89441 ?auto_89443 ) ) ( not ( = ?auto_89445 ?auto_89446 ) ) ( not ( = ?auto_89445 ?auto_89443 ) ) ( not ( = ?auto_89446 ?auto_89443 ) ) ( ON ?auto_89446 ?auto_89445 ) ( ON-TABLE ?auto_89444 ) ( ON ?auto_89447 ?auto_89444 ) ( not ( = ?auto_89444 ?auto_89447 ) ) ( not ( = ?auto_89444 ?auto_89442 ) ) ( not ( = ?auto_89444 ?auto_89443 ) ) ( not ( = ?auto_89447 ?auto_89442 ) ) ( not ( = ?auto_89447 ?auto_89443 ) ) ( not ( = ?auto_89442 ?auto_89443 ) ) ( not ( = ?auto_89441 ?auto_89442 ) ) ( not ( = ?auto_89441 ?auto_89444 ) ) ( not ( = ?auto_89441 ?auto_89447 ) ) ( not ( = ?auto_89445 ?auto_89442 ) ) ( not ( = ?auto_89445 ?auto_89444 ) ) ( not ( = ?auto_89445 ?auto_89447 ) ) ( not ( = ?auto_89446 ?auto_89442 ) ) ( not ( = ?auto_89446 ?auto_89444 ) ) ( not ( = ?auto_89446 ?auto_89447 ) ) ( ON ?auto_89443 ?auto_89446 ) ( CLEAR ?auto_89443 ) ( HOLDING ?auto_89442 ) ( CLEAR ?auto_89447 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89444 ?auto_89447 ?auto_89442 )
      ( MAKE-1PILE ?auto_89441 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89448 - BLOCK
    )
    :vars
    (
      ?auto_89449 - BLOCK
      ?auto_89451 - BLOCK
      ?auto_89454 - BLOCK
      ?auto_89452 - BLOCK
      ?auto_89450 - BLOCK
      ?auto_89453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89449 ?auto_89448 ) ( ON-TABLE ?auto_89448 ) ( not ( = ?auto_89448 ?auto_89449 ) ) ( not ( = ?auto_89448 ?auto_89451 ) ) ( not ( = ?auto_89448 ?auto_89454 ) ) ( not ( = ?auto_89449 ?auto_89451 ) ) ( not ( = ?auto_89449 ?auto_89454 ) ) ( not ( = ?auto_89451 ?auto_89454 ) ) ( ON ?auto_89451 ?auto_89449 ) ( ON-TABLE ?auto_89452 ) ( ON ?auto_89450 ?auto_89452 ) ( not ( = ?auto_89452 ?auto_89450 ) ) ( not ( = ?auto_89452 ?auto_89453 ) ) ( not ( = ?auto_89452 ?auto_89454 ) ) ( not ( = ?auto_89450 ?auto_89453 ) ) ( not ( = ?auto_89450 ?auto_89454 ) ) ( not ( = ?auto_89453 ?auto_89454 ) ) ( not ( = ?auto_89448 ?auto_89453 ) ) ( not ( = ?auto_89448 ?auto_89452 ) ) ( not ( = ?auto_89448 ?auto_89450 ) ) ( not ( = ?auto_89449 ?auto_89453 ) ) ( not ( = ?auto_89449 ?auto_89452 ) ) ( not ( = ?auto_89449 ?auto_89450 ) ) ( not ( = ?auto_89451 ?auto_89453 ) ) ( not ( = ?auto_89451 ?auto_89452 ) ) ( not ( = ?auto_89451 ?auto_89450 ) ) ( ON ?auto_89454 ?auto_89451 ) ( CLEAR ?auto_89450 ) ( ON ?auto_89453 ?auto_89454 ) ( CLEAR ?auto_89453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89448 ?auto_89449 ?auto_89451 ?auto_89454 )
      ( MAKE-1PILE ?auto_89448 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89455 - BLOCK
    )
    :vars
    (
      ?auto_89461 - BLOCK
      ?auto_89458 - BLOCK
      ?auto_89460 - BLOCK
      ?auto_89457 - BLOCK
      ?auto_89456 - BLOCK
      ?auto_89459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89461 ?auto_89455 ) ( ON-TABLE ?auto_89455 ) ( not ( = ?auto_89455 ?auto_89461 ) ) ( not ( = ?auto_89455 ?auto_89458 ) ) ( not ( = ?auto_89455 ?auto_89460 ) ) ( not ( = ?auto_89461 ?auto_89458 ) ) ( not ( = ?auto_89461 ?auto_89460 ) ) ( not ( = ?auto_89458 ?auto_89460 ) ) ( ON ?auto_89458 ?auto_89461 ) ( ON-TABLE ?auto_89457 ) ( not ( = ?auto_89457 ?auto_89456 ) ) ( not ( = ?auto_89457 ?auto_89459 ) ) ( not ( = ?auto_89457 ?auto_89460 ) ) ( not ( = ?auto_89456 ?auto_89459 ) ) ( not ( = ?auto_89456 ?auto_89460 ) ) ( not ( = ?auto_89459 ?auto_89460 ) ) ( not ( = ?auto_89455 ?auto_89459 ) ) ( not ( = ?auto_89455 ?auto_89457 ) ) ( not ( = ?auto_89455 ?auto_89456 ) ) ( not ( = ?auto_89461 ?auto_89459 ) ) ( not ( = ?auto_89461 ?auto_89457 ) ) ( not ( = ?auto_89461 ?auto_89456 ) ) ( not ( = ?auto_89458 ?auto_89459 ) ) ( not ( = ?auto_89458 ?auto_89457 ) ) ( not ( = ?auto_89458 ?auto_89456 ) ) ( ON ?auto_89460 ?auto_89458 ) ( ON ?auto_89459 ?auto_89460 ) ( CLEAR ?auto_89459 ) ( HOLDING ?auto_89456 ) ( CLEAR ?auto_89457 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89457 ?auto_89456 )
      ( MAKE-1PILE ?auto_89455 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89462 - BLOCK
    )
    :vars
    (
      ?auto_89463 - BLOCK
      ?auto_89464 - BLOCK
      ?auto_89467 - BLOCK
      ?auto_89468 - BLOCK
      ?auto_89466 - BLOCK
      ?auto_89465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89463 ?auto_89462 ) ( ON-TABLE ?auto_89462 ) ( not ( = ?auto_89462 ?auto_89463 ) ) ( not ( = ?auto_89462 ?auto_89464 ) ) ( not ( = ?auto_89462 ?auto_89467 ) ) ( not ( = ?auto_89463 ?auto_89464 ) ) ( not ( = ?auto_89463 ?auto_89467 ) ) ( not ( = ?auto_89464 ?auto_89467 ) ) ( ON ?auto_89464 ?auto_89463 ) ( ON-TABLE ?auto_89468 ) ( not ( = ?auto_89468 ?auto_89466 ) ) ( not ( = ?auto_89468 ?auto_89465 ) ) ( not ( = ?auto_89468 ?auto_89467 ) ) ( not ( = ?auto_89466 ?auto_89465 ) ) ( not ( = ?auto_89466 ?auto_89467 ) ) ( not ( = ?auto_89465 ?auto_89467 ) ) ( not ( = ?auto_89462 ?auto_89465 ) ) ( not ( = ?auto_89462 ?auto_89468 ) ) ( not ( = ?auto_89462 ?auto_89466 ) ) ( not ( = ?auto_89463 ?auto_89465 ) ) ( not ( = ?auto_89463 ?auto_89468 ) ) ( not ( = ?auto_89463 ?auto_89466 ) ) ( not ( = ?auto_89464 ?auto_89465 ) ) ( not ( = ?auto_89464 ?auto_89468 ) ) ( not ( = ?auto_89464 ?auto_89466 ) ) ( ON ?auto_89467 ?auto_89464 ) ( ON ?auto_89465 ?auto_89467 ) ( CLEAR ?auto_89468 ) ( ON ?auto_89466 ?auto_89465 ) ( CLEAR ?auto_89466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89462 ?auto_89463 ?auto_89464 ?auto_89467 ?auto_89465 )
      ( MAKE-1PILE ?auto_89462 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89469 - BLOCK
    )
    :vars
    (
      ?auto_89475 - BLOCK
      ?auto_89473 - BLOCK
      ?auto_89474 - BLOCK
      ?auto_89470 - BLOCK
      ?auto_89472 - BLOCK
      ?auto_89471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89475 ?auto_89469 ) ( ON-TABLE ?auto_89469 ) ( not ( = ?auto_89469 ?auto_89475 ) ) ( not ( = ?auto_89469 ?auto_89473 ) ) ( not ( = ?auto_89469 ?auto_89474 ) ) ( not ( = ?auto_89475 ?auto_89473 ) ) ( not ( = ?auto_89475 ?auto_89474 ) ) ( not ( = ?auto_89473 ?auto_89474 ) ) ( ON ?auto_89473 ?auto_89475 ) ( not ( = ?auto_89470 ?auto_89472 ) ) ( not ( = ?auto_89470 ?auto_89471 ) ) ( not ( = ?auto_89470 ?auto_89474 ) ) ( not ( = ?auto_89472 ?auto_89471 ) ) ( not ( = ?auto_89472 ?auto_89474 ) ) ( not ( = ?auto_89471 ?auto_89474 ) ) ( not ( = ?auto_89469 ?auto_89471 ) ) ( not ( = ?auto_89469 ?auto_89470 ) ) ( not ( = ?auto_89469 ?auto_89472 ) ) ( not ( = ?auto_89475 ?auto_89471 ) ) ( not ( = ?auto_89475 ?auto_89470 ) ) ( not ( = ?auto_89475 ?auto_89472 ) ) ( not ( = ?auto_89473 ?auto_89471 ) ) ( not ( = ?auto_89473 ?auto_89470 ) ) ( not ( = ?auto_89473 ?auto_89472 ) ) ( ON ?auto_89474 ?auto_89473 ) ( ON ?auto_89471 ?auto_89474 ) ( ON ?auto_89472 ?auto_89471 ) ( CLEAR ?auto_89472 ) ( HOLDING ?auto_89470 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89470 )
      ( MAKE-1PILE ?auto_89469 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89476 - BLOCK
    )
    :vars
    (
      ?auto_89477 - BLOCK
      ?auto_89479 - BLOCK
      ?auto_89478 - BLOCK
      ?auto_89480 - BLOCK
      ?auto_89482 - BLOCK
      ?auto_89481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89477 ?auto_89476 ) ( ON-TABLE ?auto_89476 ) ( not ( = ?auto_89476 ?auto_89477 ) ) ( not ( = ?auto_89476 ?auto_89479 ) ) ( not ( = ?auto_89476 ?auto_89478 ) ) ( not ( = ?auto_89477 ?auto_89479 ) ) ( not ( = ?auto_89477 ?auto_89478 ) ) ( not ( = ?auto_89479 ?auto_89478 ) ) ( ON ?auto_89479 ?auto_89477 ) ( not ( = ?auto_89480 ?auto_89482 ) ) ( not ( = ?auto_89480 ?auto_89481 ) ) ( not ( = ?auto_89480 ?auto_89478 ) ) ( not ( = ?auto_89482 ?auto_89481 ) ) ( not ( = ?auto_89482 ?auto_89478 ) ) ( not ( = ?auto_89481 ?auto_89478 ) ) ( not ( = ?auto_89476 ?auto_89481 ) ) ( not ( = ?auto_89476 ?auto_89480 ) ) ( not ( = ?auto_89476 ?auto_89482 ) ) ( not ( = ?auto_89477 ?auto_89481 ) ) ( not ( = ?auto_89477 ?auto_89480 ) ) ( not ( = ?auto_89477 ?auto_89482 ) ) ( not ( = ?auto_89479 ?auto_89481 ) ) ( not ( = ?auto_89479 ?auto_89480 ) ) ( not ( = ?auto_89479 ?auto_89482 ) ) ( ON ?auto_89478 ?auto_89479 ) ( ON ?auto_89481 ?auto_89478 ) ( ON ?auto_89482 ?auto_89481 ) ( ON ?auto_89480 ?auto_89482 ) ( CLEAR ?auto_89480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89476 ?auto_89477 ?auto_89479 ?auto_89478 ?auto_89481 ?auto_89482 )
      ( MAKE-1PILE ?auto_89476 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89483 - BLOCK
    )
    :vars
    (
      ?auto_89488 - BLOCK
      ?auto_89487 - BLOCK
      ?auto_89489 - BLOCK
      ?auto_89485 - BLOCK
      ?auto_89486 - BLOCK
      ?auto_89484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89488 ?auto_89483 ) ( ON-TABLE ?auto_89483 ) ( not ( = ?auto_89483 ?auto_89488 ) ) ( not ( = ?auto_89483 ?auto_89487 ) ) ( not ( = ?auto_89483 ?auto_89489 ) ) ( not ( = ?auto_89488 ?auto_89487 ) ) ( not ( = ?auto_89488 ?auto_89489 ) ) ( not ( = ?auto_89487 ?auto_89489 ) ) ( ON ?auto_89487 ?auto_89488 ) ( not ( = ?auto_89485 ?auto_89486 ) ) ( not ( = ?auto_89485 ?auto_89484 ) ) ( not ( = ?auto_89485 ?auto_89489 ) ) ( not ( = ?auto_89486 ?auto_89484 ) ) ( not ( = ?auto_89486 ?auto_89489 ) ) ( not ( = ?auto_89484 ?auto_89489 ) ) ( not ( = ?auto_89483 ?auto_89484 ) ) ( not ( = ?auto_89483 ?auto_89485 ) ) ( not ( = ?auto_89483 ?auto_89486 ) ) ( not ( = ?auto_89488 ?auto_89484 ) ) ( not ( = ?auto_89488 ?auto_89485 ) ) ( not ( = ?auto_89488 ?auto_89486 ) ) ( not ( = ?auto_89487 ?auto_89484 ) ) ( not ( = ?auto_89487 ?auto_89485 ) ) ( not ( = ?auto_89487 ?auto_89486 ) ) ( ON ?auto_89489 ?auto_89487 ) ( ON ?auto_89484 ?auto_89489 ) ( ON ?auto_89486 ?auto_89484 ) ( HOLDING ?auto_89485 ) ( CLEAR ?auto_89486 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89483 ?auto_89488 ?auto_89487 ?auto_89489 ?auto_89484 ?auto_89486 ?auto_89485 )
      ( MAKE-1PILE ?auto_89483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89490 - BLOCK
    )
    :vars
    (
      ?auto_89496 - BLOCK
      ?auto_89492 - BLOCK
      ?auto_89493 - BLOCK
      ?auto_89495 - BLOCK
      ?auto_89494 - BLOCK
      ?auto_89491 - BLOCK
      ?auto_89497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89496 ?auto_89490 ) ( ON-TABLE ?auto_89490 ) ( not ( = ?auto_89490 ?auto_89496 ) ) ( not ( = ?auto_89490 ?auto_89492 ) ) ( not ( = ?auto_89490 ?auto_89493 ) ) ( not ( = ?auto_89496 ?auto_89492 ) ) ( not ( = ?auto_89496 ?auto_89493 ) ) ( not ( = ?auto_89492 ?auto_89493 ) ) ( ON ?auto_89492 ?auto_89496 ) ( not ( = ?auto_89495 ?auto_89494 ) ) ( not ( = ?auto_89495 ?auto_89491 ) ) ( not ( = ?auto_89495 ?auto_89493 ) ) ( not ( = ?auto_89494 ?auto_89491 ) ) ( not ( = ?auto_89494 ?auto_89493 ) ) ( not ( = ?auto_89491 ?auto_89493 ) ) ( not ( = ?auto_89490 ?auto_89491 ) ) ( not ( = ?auto_89490 ?auto_89495 ) ) ( not ( = ?auto_89490 ?auto_89494 ) ) ( not ( = ?auto_89496 ?auto_89491 ) ) ( not ( = ?auto_89496 ?auto_89495 ) ) ( not ( = ?auto_89496 ?auto_89494 ) ) ( not ( = ?auto_89492 ?auto_89491 ) ) ( not ( = ?auto_89492 ?auto_89495 ) ) ( not ( = ?auto_89492 ?auto_89494 ) ) ( ON ?auto_89493 ?auto_89492 ) ( ON ?auto_89491 ?auto_89493 ) ( ON ?auto_89494 ?auto_89491 ) ( CLEAR ?auto_89494 ) ( ON ?auto_89495 ?auto_89497 ) ( CLEAR ?auto_89495 ) ( HAND-EMPTY ) ( not ( = ?auto_89490 ?auto_89497 ) ) ( not ( = ?auto_89496 ?auto_89497 ) ) ( not ( = ?auto_89492 ?auto_89497 ) ) ( not ( = ?auto_89493 ?auto_89497 ) ) ( not ( = ?auto_89495 ?auto_89497 ) ) ( not ( = ?auto_89494 ?auto_89497 ) ) ( not ( = ?auto_89491 ?auto_89497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89495 ?auto_89497 )
      ( MAKE-1PILE ?auto_89490 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89498 - BLOCK
    )
    :vars
    (
      ?auto_89501 - BLOCK
      ?auto_89503 - BLOCK
      ?auto_89502 - BLOCK
      ?auto_89505 - BLOCK
      ?auto_89500 - BLOCK
      ?auto_89499 - BLOCK
      ?auto_89504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89501 ?auto_89498 ) ( ON-TABLE ?auto_89498 ) ( not ( = ?auto_89498 ?auto_89501 ) ) ( not ( = ?auto_89498 ?auto_89503 ) ) ( not ( = ?auto_89498 ?auto_89502 ) ) ( not ( = ?auto_89501 ?auto_89503 ) ) ( not ( = ?auto_89501 ?auto_89502 ) ) ( not ( = ?auto_89503 ?auto_89502 ) ) ( ON ?auto_89503 ?auto_89501 ) ( not ( = ?auto_89505 ?auto_89500 ) ) ( not ( = ?auto_89505 ?auto_89499 ) ) ( not ( = ?auto_89505 ?auto_89502 ) ) ( not ( = ?auto_89500 ?auto_89499 ) ) ( not ( = ?auto_89500 ?auto_89502 ) ) ( not ( = ?auto_89499 ?auto_89502 ) ) ( not ( = ?auto_89498 ?auto_89499 ) ) ( not ( = ?auto_89498 ?auto_89505 ) ) ( not ( = ?auto_89498 ?auto_89500 ) ) ( not ( = ?auto_89501 ?auto_89499 ) ) ( not ( = ?auto_89501 ?auto_89505 ) ) ( not ( = ?auto_89501 ?auto_89500 ) ) ( not ( = ?auto_89503 ?auto_89499 ) ) ( not ( = ?auto_89503 ?auto_89505 ) ) ( not ( = ?auto_89503 ?auto_89500 ) ) ( ON ?auto_89502 ?auto_89503 ) ( ON ?auto_89499 ?auto_89502 ) ( ON ?auto_89505 ?auto_89504 ) ( CLEAR ?auto_89505 ) ( not ( = ?auto_89498 ?auto_89504 ) ) ( not ( = ?auto_89501 ?auto_89504 ) ) ( not ( = ?auto_89503 ?auto_89504 ) ) ( not ( = ?auto_89502 ?auto_89504 ) ) ( not ( = ?auto_89505 ?auto_89504 ) ) ( not ( = ?auto_89500 ?auto_89504 ) ) ( not ( = ?auto_89499 ?auto_89504 ) ) ( HOLDING ?auto_89500 ) ( CLEAR ?auto_89499 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89498 ?auto_89501 ?auto_89503 ?auto_89502 ?auto_89499 ?auto_89500 )
      ( MAKE-1PILE ?auto_89498 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89506 - BLOCK
    )
    :vars
    (
      ?auto_89509 - BLOCK
      ?auto_89511 - BLOCK
      ?auto_89512 - BLOCK
      ?auto_89513 - BLOCK
      ?auto_89510 - BLOCK
      ?auto_89508 - BLOCK
      ?auto_89507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89509 ?auto_89506 ) ( ON-TABLE ?auto_89506 ) ( not ( = ?auto_89506 ?auto_89509 ) ) ( not ( = ?auto_89506 ?auto_89511 ) ) ( not ( = ?auto_89506 ?auto_89512 ) ) ( not ( = ?auto_89509 ?auto_89511 ) ) ( not ( = ?auto_89509 ?auto_89512 ) ) ( not ( = ?auto_89511 ?auto_89512 ) ) ( ON ?auto_89511 ?auto_89509 ) ( not ( = ?auto_89513 ?auto_89510 ) ) ( not ( = ?auto_89513 ?auto_89508 ) ) ( not ( = ?auto_89513 ?auto_89512 ) ) ( not ( = ?auto_89510 ?auto_89508 ) ) ( not ( = ?auto_89510 ?auto_89512 ) ) ( not ( = ?auto_89508 ?auto_89512 ) ) ( not ( = ?auto_89506 ?auto_89508 ) ) ( not ( = ?auto_89506 ?auto_89513 ) ) ( not ( = ?auto_89506 ?auto_89510 ) ) ( not ( = ?auto_89509 ?auto_89508 ) ) ( not ( = ?auto_89509 ?auto_89513 ) ) ( not ( = ?auto_89509 ?auto_89510 ) ) ( not ( = ?auto_89511 ?auto_89508 ) ) ( not ( = ?auto_89511 ?auto_89513 ) ) ( not ( = ?auto_89511 ?auto_89510 ) ) ( ON ?auto_89512 ?auto_89511 ) ( ON ?auto_89508 ?auto_89512 ) ( ON ?auto_89513 ?auto_89507 ) ( not ( = ?auto_89506 ?auto_89507 ) ) ( not ( = ?auto_89509 ?auto_89507 ) ) ( not ( = ?auto_89511 ?auto_89507 ) ) ( not ( = ?auto_89512 ?auto_89507 ) ) ( not ( = ?auto_89513 ?auto_89507 ) ) ( not ( = ?auto_89510 ?auto_89507 ) ) ( not ( = ?auto_89508 ?auto_89507 ) ) ( CLEAR ?auto_89508 ) ( ON ?auto_89510 ?auto_89513 ) ( CLEAR ?auto_89510 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89507 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89507 ?auto_89513 )
      ( MAKE-1PILE ?auto_89506 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89514 - BLOCK
    )
    :vars
    (
      ?auto_89517 - BLOCK
      ?auto_89515 - BLOCK
      ?auto_89521 - BLOCK
      ?auto_89518 - BLOCK
      ?auto_89516 - BLOCK
      ?auto_89519 - BLOCK
      ?auto_89520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89517 ?auto_89514 ) ( ON-TABLE ?auto_89514 ) ( not ( = ?auto_89514 ?auto_89517 ) ) ( not ( = ?auto_89514 ?auto_89515 ) ) ( not ( = ?auto_89514 ?auto_89521 ) ) ( not ( = ?auto_89517 ?auto_89515 ) ) ( not ( = ?auto_89517 ?auto_89521 ) ) ( not ( = ?auto_89515 ?auto_89521 ) ) ( ON ?auto_89515 ?auto_89517 ) ( not ( = ?auto_89518 ?auto_89516 ) ) ( not ( = ?auto_89518 ?auto_89519 ) ) ( not ( = ?auto_89518 ?auto_89521 ) ) ( not ( = ?auto_89516 ?auto_89519 ) ) ( not ( = ?auto_89516 ?auto_89521 ) ) ( not ( = ?auto_89519 ?auto_89521 ) ) ( not ( = ?auto_89514 ?auto_89519 ) ) ( not ( = ?auto_89514 ?auto_89518 ) ) ( not ( = ?auto_89514 ?auto_89516 ) ) ( not ( = ?auto_89517 ?auto_89519 ) ) ( not ( = ?auto_89517 ?auto_89518 ) ) ( not ( = ?auto_89517 ?auto_89516 ) ) ( not ( = ?auto_89515 ?auto_89519 ) ) ( not ( = ?auto_89515 ?auto_89518 ) ) ( not ( = ?auto_89515 ?auto_89516 ) ) ( ON ?auto_89521 ?auto_89515 ) ( ON ?auto_89518 ?auto_89520 ) ( not ( = ?auto_89514 ?auto_89520 ) ) ( not ( = ?auto_89517 ?auto_89520 ) ) ( not ( = ?auto_89515 ?auto_89520 ) ) ( not ( = ?auto_89521 ?auto_89520 ) ) ( not ( = ?auto_89518 ?auto_89520 ) ) ( not ( = ?auto_89516 ?auto_89520 ) ) ( not ( = ?auto_89519 ?auto_89520 ) ) ( ON ?auto_89516 ?auto_89518 ) ( CLEAR ?auto_89516 ) ( ON-TABLE ?auto_89520 ) ( HOLDING ?auto_89519 ) ( CLEAR ?auto_89521 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89514 ?auto_89517 ?auto_89515 ?auto_89521 ?auto_89519 )
      ( MAKE-1PILE ?auto_89514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89522 - BLOCK
    )
    :vars
    (
      ?auto_89527 - BLOCK
      ?auto_89523 - BLOCK
      ?auto_89528 - BLOCK
      ?auto_89525 - BLOCK
      ?auto_89526 - BLOCK
      ?auto_89529 - BLOCK
      ?auto_89524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89527 ?auto_89522 ) ( ON-TABLE ?auto_89522 ) ( not ( = ?auto_89522 ?auto_89527 ) ) ( not ( = ?auto_89522 ?auto_89523 ) ) ( not ( = ?auto_89522 ?auto_89528 ) ) ( not ( = ?auto_89527 ?auto_89523 ) ) ( not ( = ?auto_89527 ?auto_89528 ) ) ( not ( = ?auto_89523 ?auto_89528 ) ) ( ON ?auto_89523 ?auto_89527 ) ( not ( = ?auto_89525 ?auto_89526 ) ) ( not ( = ?auto_89525 ?auto_89529 ) ) ( not ( = ?auto_89525 ?auto_89528 ) ) ( not ( = ?auto_89526 ?auto_89529 ) ) ( not ( = ?auto_89526 ?auto_89528 ) ) ( not ( = ?auto_89529 ?auto_89528 ) ) ( not ( = ?auto_89522 ?auto_89529 ) ) ( not ( = ?auto_89522 ?auto_89525 ) ) ( not ( = ?auto_89522 ?auto_89526 ) ) ( not ( = ?auto_89527 ?auto_89529 ) ) ( not ( = ?auto_89527 ?auto_89525 ) ) ( not ( = ?auto_89527 ?auto_89526 ) ) ( not ( = ?auto_89523 ?auto_89529 ) ) ( not ( = ?auto_89523 ?auto_89525 ) ) ( not ( = ?auto_89523 ?auto_89526 ) ) ( ON ?auto_89528 ?auto_89523 ) ( ON ?auto_89525 ?auto_89524 ) ( not ( = ?auto_89522 ?auto_89524 ) ) ( not ( = ?auto_89527 ?auto_89524 ) ) ( not ( = ?auto_89523 ?auto_89524 ) ) ( not ( = ?auto_89528 ?auto_89524 ) ) ( not ( = ?auto_89525 ?auto_89524 ) ) ( not ( = ?auto_89526 ?auto_89524 ) ) ( not ( = ?auto_89529 ?auto_89524 ) ) ( ON ?auto_89526 ?auto_89525 ) ( ON-TABLE ?auto_89524 ) ( CLEAR ?auto_89528 ) ( ON ?auto_89529 ?auto_89526 ) ( CLEAR ?auto_89529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89524 ?auto_89525 ?auto_89526 )
      ( MAKE-1PILE ?auto_89522 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89530 - BLOCK
    )
    :vars
    (
      ?auto_89535 - BLOCK
      ?auto_89531 - BLOCK
      ?auto_89532 - BLOCK
      ?auto_89534 - BLOCK
      ?auto_89537 - BLOCK
      ?auto_89536 - BLOCK
      ?auto_89533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89535 ?auto_89530 ) ( ON-TABLE ?auto_89530 ) ( not ( = ?auto_89530 ?auto_89535 ) ) ( not ( = ?auto_89530 ?auto_89531 ) ) ( not ( = ?auto_89530 ?auto_89532 ) ) ( not ( = ?auto_89535 ?auto_89531 ) ) ( not ( = ?auto_89535 ?auto_89532 ) ) ( not ( = ?auto_89531 ?auto_89532 ) ) ( ON ?auto_89531 ?auto_89535 ) ( not ( = ?auto_89534 ?auto_89537 ) ) ( not ( = ?auto_89534 ?auto_89536 ) ) ( not ( = ?auto_89534 ?auto_89532 ) ) ( not ( = ?auto_89537 ?auto_89536 ) ) ( not ( = ?auto_89537 ?auto_89532 ) ) ( not ( = ?auto_89536 ?auto_89532 ) ) ( not ( = ?auto_89530 ?auto_89536 ) ) ( not ( = ?auto_89530 ?auto_89534 ) ) ( not ( = ?auto_89530 ?auto_89537 ) ) ( not ( = ?auto_89535 ?auto_89536 ) ) ( not ( = ?auto_89535 ?auto_89534 ) ) ( not ( = ?auto_89535 ?auto_89537 ) ) ( not ( = ?auto_89531 ?auto_89536 ) ) ( not ( = ?auto_89531 ?auto_89534 ) ) ( not ( = ?auto_89531 ?auto_89537 ) ) ( ON ?auto_89534 ?auto_89533 ) ( not ( = ?auto_89530 ?auto_89533 ) ) ( not ( = ?auto_89535 ?auto_89533 ) ) ( not ( = ?auto_89531 ?auto_89533 ) ) ( not ( = ?auto_89532 ?auto_89533 ) ) ( not ( = ?auto_89534 ?auto_89533 ) ) ( not ( = ?auto_89537 ?auto_89533 ) ) ( not ( = ?auto_89536 ?auto_89533 ) ) ( ON ?auto_89537 ?auto_89534 ) ( ON-TABLE ?auto_89533 ) ( ON ?auto_89536 ?auto_89537 ) ( CLEAR ?auto_89536 ) ( HOLDING ?auto_89532 ) ( CLEAR ?auto_89531 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89530 ?auto_89535 ?auto_89531 ?auto_89532 )
      ( MAKE-1PILE ?auto_89530 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89538 - BLOCK
    )
    :vars
    (
      ?auto_89543 - BLOCK
      ?auto_89540 - BLOCK
      ?auto_89541 - BLOCK
      ?auto_89542 - BLOCK
      ?auto_89545 - BLOCK
      ?auto_89544 - BLOCK
      ?auto_89539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89543 ?auto_89538 ) ( ON-TABLE ?auto_89538 ) ( not ( = ?auto_89538 ?auto_89543 ) ) ( not ( = ?auto_89538 ?auto_89540 ) ) ( not ( = ?auto_89538 ?auto_89541 ) ) ( not ( = ?auto_89543 ?auto_89540 ) ) ( not ( = ?auto_89543 ?auto_89541 ) ) ( not ( = ?auto_89540 ?auto_89541 ) ) ( ON ?auto_89540 ?auto_89543 ) ( not ( = ?auto_89542 ?auto_89545 ) ) ( not ( = ?auto_89542 ?auto_89544 ) ) ( not ( = ?auto_89542 ?auto_89541 ) ) ( not ( = ?auto_89545 ?auto_89544 ) ) ( not ( = ?auto_89545 ?auto_89541 ) ) ( not ( = ?auto_89544 ?auto_89541 ) ) ( not ( = ?auto_89538 ?auto_89544 ) ) ( not ( = ?auto_89538 ?auto_89542 ) ) ( not ( = ?auto_89538 ?auto_89545 ) ) ( not ( = ?auto_89543 ?auto_89544 ) ) ( not ( = ?auto_89543 ?auto_89542 ) ) ( not ( = ?auto_89543 ?auto_89545 ) ) ( not ( = ?auto_89540 ?auto_89544 ) ) ( not ( = ?auto_89540 ?auto_89542 ) ) ( not ( = ?auto_89540 ?auto_89545 ) ) ( ON ?auto_89542 ?auto_89539 ) ( not ( = ?auto_89538 ?auto_89539 ) ) ( not ( = ?auto_89543 ?auto_89539 ) ) ( not ( = ?auto_89540 ?auto_89539 ) ) ( not ( = ?auto_89541 ?auto_89539 ) ) ( not ( = ?auto_89542 ?auto_89539 ) ) ( not ( = ?auto_89545 ?auto_89539 ) ) ( not ( = ?auto_89544 ?auto_89539 ) ) ( ON ?auto_89545 ?auto_89542 ) ( ON-TABLE ?auto_89539 ) ( ON ?auto_89544 ?auto_89545 ) ( CLEAR ?auto_89540 ) ( ON ?auto_89541 ?auto_89544 ) ( CLEAR ?auto_89541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89539 ?auto_89542 ?auto_89545 ?auto_89544 )
      ( MAKE-1PILE ?auto_89538 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89546 - BLOCK
    )
    :vars
    (
      ?auto_89548 - BLOCK
      ?auto_89551 - BLOCK
      ?auto_89547 - BLOCK
      ?auto_89550 - BLOCK
      ?auto_89549 - BLOCK
      ?auto_89552 - BLOCK
      ?auto_89553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89548 ?auto_89546 ) ( ON-TABLE ?auto_89546 ) ( not ( = ?auto_89546 ?auto_89548 ) ) ( not ( = ?auto_89546 ?auto_89551 ) ) ( not ( = ?auto_89546 ?auto_89547 ) ) ( not ( = ?auto_89548 ?auto_89551 ) ) ( not ( = ?auto_89548 ?auto_89547 ) ) ( not ( = ?auto_89551 ?auto_89547 ) ) ( not ( = ?auto_89550 ?auto_89549 ) ) ( not ( = ?auto_89550 ?auto_89552 ) ) ( not ( = ?auto_89550 ?auto_89547 ) ) ( not ( = ?auto_89549 ?auto_89552 ) ) ( not ( = ?auto_89549 ?auto_89547 ) ) ( not ( = ?auto_89552 ?auto_89547 ) ) ( not ( = ?auto_89546 ?auto_89552 ) ) ( not ( = ?auto_89546 ?auto_89550 ) ) ( not ( = ?auto_89546 ?auto_89549 ) ) ( not ( = ?auto_89548 ?auto_89552 ) ) ( not ( = ?auto_89548 ?auto_89550 ) ) ( not ( = ?auto_89548 ?auto_89549 ) ) ( not ( = ?auto_89551 ?auto_89552 ) ) ( not ( = ?auto_89551 ?auto_89550 ) ) ( not ( = ?auto_89551 ?auto_89549 ) ) ( ON ?auto_89550 ?auto_89553 ) ( not ( = ?auto_89546 ?auto_89553 ) ) ( not ( = ?auto_89548 ?auto_89553 ) ) ( not ( = ?auto_89551 ?auto_89553 ) ) ( not ( = ?auto_89547 ?auto_89553 ) ) ( not ( = ?auto_89550 ?auto_89553 ) ) ( not ( = ?auto_89549 ?auto_89553 ) ) ( not ( = ?auto_89552 ?auto_89553 ) ) ( ON ?auto_89549 ?auto_89550 ) ( ON-TABLE ?auto_89553 ) ( ON ?auto_89552 ?auto_89549 ) ( ON ?auto_89547 ?auto_89552 ) ( CLEAR ?auto_89547 ) ( HOLDING ?auto_89551 ) ( CLEAR ?auto_89548 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89546 ?auto_89548 ?auto_89551 )
      ( MAKE-1PILE ?auto_89546 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89554 - BLOCK
    )
    :vars
    (
      ?auto_89555 - BLOCK
      ?auto_89559 - BLOCK
      ?auto_89558 - BLOCK
      ?auto_89557 - BLOCK
      ?auto_89556 - BLOCK
      ?auto_89560 - BLOCK
      ?auto_89561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_89555 ?auto_89554 ) ( ON-TABLE ?auto_89554 ) ( not ( = ?auto_89554 ?auto_89555 ) ) ( not ( = ?auto_89554 ?auto_89559 ) ) ( not ( = ?auto_89554 ?auto_89558 ) ) ( not ( = ?auto_89555 ?auto_89559 ) ) ( not ( = ?auto_89555 ?auto_89558 ) ) ( not ( = ?auto_89559 ?auto_89558 ) ) ( not ( = ?auto_89557 ?auto_89556 ) ) ( not ( = ?auto_89557 ?auto_89560 ) ) ( not ( = ?auto_89557 ?auto_89558 ) ) ( not ( = ?auto_89556 ?auto_89560 ) ) ( not ( = ?auto_89556 ?auto_89558 ) ) ( not ( = ?auto_89560 ?auto_89558 ) ) ( not ( = ?auto_89554 ?auto_89560 ) ) ( not ( = ?auto_89554 ?auto_89557 ) ) ( not ( = ?auto_89554 ?auto_89556 ) ) ( not ( = ?auto_89555 ?auto_89560 ) ) ( not ( = ?auto_89555 ?auto_89557 ) ) ( not ( = ?auto_89555 ?auto_89556 ) ) ( not ( = ?auto_89559 ?auto_89560 ) ) ( not ( = ?auto_89559 ?auto_89557 ) ) ( not ( = ?auto_89559 ?auto_89556 ) ) ( ON ?auto_89557 ?auto_89561 ) ( not ( = ?auto_89554 ?auto_89561 ) ) ( not ( = ?auto_89555 ?auto_89561 ) ) ( not ( = ?auto_89559 ?auto_89561 ) ) ( not ( = ?auto_89558 ?auto_89561 ) ) ( not ( = ?auto_89557 ?auto_89561 ) ) ( not ( = ?auto_89556 ?auto_89561 ) ) ( not ( = ?auto_89560 ?auto_89561 ) ) ( ON ?auto_89556 ?auto_89557 ) ( ON-TABLE ?auto_89561 ) ( ON ?auto_89560 ?auto_89556 ) ( ON ?auto_89558 ?auto_89560 ) ( CLEAR ?auto_89555 ) ( ON ?auto_89559 ?auto_89558 ) ( CLEAR ?auto_89559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89561 ?auto_89557 ?auto_89556 ?auto_89560 ?auto_89558 )
      ( MAKE-1PILE ?auto_89554 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89578 - BLOCK
    )
    :vars
    (
      ?auto_89583 - BLOCK
      ?auto_89585 - BLOCK
      ?auto_89584 - BLOCK
      ?auto_89581 - BLOCK
      ?auto_89580 - BLOCK
      ?auto_89579 - BLOCK
      ?auto_89582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89578 ?auto_89583 ) ) ( not ( = ?auto_89578 ?auto_89585 ) ) ( not ( = ?auto_89578 ?auto_89584 ) ) ( not ( = ?auto_89583 ?auto_89585 ) ) ( not ( = ?auto_89583 ?auto_89584 ) ) ( not ( = ?auto_89585 ?auto_89584 ) ) ( not ( = ?auto_89581 ?auto_89580 ) ) ( not ( = ?auto_89581 ?auto_89579 ) ) ( not ( = ?auto_89581 ?auto_89584 ) ) ( not ( = ?auto_89580 ?auto_89579 ) ) ( not ( = ?auto_89580 ?auto_89584 ) ) ( not ( = ?auto_89579 ?auto_89584 ) ) ( not ( = ?auto_89578 ?auto_89579 ) ) ( not ( = ?auto_89578 ?auto_89581 ) ) ( not ( = ?auto_89578 ?auto_89580 ) ) ( not ( = ?auto_89583 ?auto_89579 ) ) ( not ( = ?auto_89583 ?auto_89581 ) ) ( not ( = ?auto_89583 ?auto_89580 ) ) ( not ( = ?auto_89585 ?auto_89579 ) ) ( not ( = ?auto_89585 ?auto_89581 ) ) ( not ( = ?auto_89585 ?auto_89580 ) ) ( ON ?auto_89581 ?auto_89582 ) ( not ( = ?auto_89578 ?auto_89582 ) ) ( not ( = ?auto_89583 ?auto_89582 ) ) ( not ( = ?auto_89585 ?auto_89582 ) ) ( not ( = ?auto_89584 ?auto_89582 ) ) ( not ( = ?auto_89581 ?auto_89582 ) ) ( not ( = ?auto_89580 ?auto_89582 ) ) ( not ( = ?auto_89579 ?auto_89582 ) ) ( ON ?auto_89580 ?auto_89581 ) ( ON-TABLE ?auto_89582 ) ( ON ?auto_89579 ?auto_89580 ) ( ON ?auto_89584 ?auto_89579 ) ( ON ?auto_89585 ?auto_89584 ) ( ON ?auto_89583 ?auto_89585 ) ( CLEAR ?auto_89583 ) ( HOLDING ?auto_89578 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89578 ?auto_89583 )
      ( MAKE-1PILE ?auto_89578 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_89586 - BLOCK
    )
    :vars
    (
      ?auto_89589 - BLOCK
      ?auto_89591 - BLOCK
      ?auto_89587 - BLOCK
      ?auto_89593 - BLOCK
      ?auto_89588 - BLOCK
      ?auto_89590 - BLOCK
      ?auto_89592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89586 ?auto_89589 ) ) ( not ( = ?auto_89586 ?auto_89591 ) ) ( not ( = ?auto_89586 ?auto_89587 ) ) ( not ( = ?auto_89589 ?auto_89591 ) ) ( not ( = ?auto_89589 ?auto_89587 ) ) ( not ( = ?auto_89591 ?auto_89587 ) ) ( not ( = ?auto_89593 ?auto_89588 ) ) ( not ( = ?auto_89593 ?auto_89590 ) ) ( not ( = ?auto_89593 ?auto_89587 ) ) ( not ( = ?auto_89588 ?auto_89590 ) ) ( not ( = ?auto_89588 ?auto_89587 ) ) ( not ( = ?auto_89590 ?auto_89587 ) ) ( not ( = ?auto_89586 ?auto_89590 ) ) ( not ( = ?auto_89586 ?auto_89593 ) ) ( not ( = ?auto_89586 ?auto_89588 ) ) ( not ( = ?auto_89589 ?auto_89590 ) ) ( not ( = ?auto_89589 ?auto_89593 ) ) ( not ( = ?auto_89589 ?auto_89588 ) ) ( not ( = ?auto_89591 ?auto_89590 ) ) ( not ( = ?auto_89591 ?auto_89593 ) ) ( not ( = ?auto_89591 ?auto_89588 ) ) ( ON ?auto_89593 ?auto_89592 ) ( not ( = ?auto_89586 ?auto_89592 ) ) ( not ( = ?auto_89589 ?auto_89592 ) ) ( not ( = ?auto_89591 ?auto_89592 ) ) ( not ( = ?auto_89587 ?auto_89592 ) ) ( not ( = ?auto_89593 ?auto_89592 ) ) ( not ( = ?auto_89588 ?auto_89592 ) ) ( not ( = ?auto_89590 ?auto_89592 ) ) ( ON ?auto_89588 ?auto_89593 ) ( ON-TABLE ?auto_89592 ) ( ON ?auto_89590 ?auto_89588 ) ( ON ?auto_89587 ?auto_89590 ) ( ON ?auto_89591 ?auto_89587 ) ( ON ?auto_89589 ?auto_89591 ) ( ON ?auto_89586 ?auto_89589 ) ( CLEAR ?auto_89586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89592 ?auto_89593 ?auto_89588 ?auto_89590 ?auto_89587 ?auto_89591 ?auto_89589 )
      ( MAKE-1PILE ?auto_89586 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89600 - BLOCK
      ?auto_89601 - BLOCK
      ?auto_89602 - BLOCK
      ?auto_89603 - BLOCK
      ?auto_89604 - BLOCK
      ?auto_89605 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_89605 ) ( CLEAR ?auto_89604 ) ( ON-TABLE ?auto_89600 ) ( ON ?auto_89601 ?auto_89600 ) ( ON ?auto_89602 ?auto_89601 ) ( ON ?auto_89603 ?auto_89602 ) ( ON ?auto_89604 ?auto_89603 ) ( not ( = ?auto_89600 ?auto_89601 ) ) ( not ( = ?auto_89600 ?auto_89602 ) ) ( not ( = ?auto_89600 ?auto_89603 ) ) ( not ( = ?auto_89600 ?auto_89604 ) ) ( not ( = ?auto_89600 ?auto_89605 ) ) ( not ( = ?auto_89601 ?auto_89602 ) ) ( not ( = ?auto_89601 ?auto_89603 ) ) ( not ( = ?auto_89601 ?auto_89604 ) ) ( not ( = ?auto_89601 ?auto_89605 ) ) ( not ( = ?auto_89602 ?auto_89603 ) ) ( not ( = ?auto_89602 ?auto_89604 ) ) ( not ( = ?auto_89602 ?auto_89605 ) ) ( not ( = ?auto_89603 ?auto_89604 ) ) ( not ( = ?auto_89603 ?auto_89605 ) ) ( not ( = ?auto_89604 ?auto_89605 ) ) )
    :subtasks
    ( ( !STACK ?auto_89605 ?auto_89604 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89606 - BLOCK
      ?auto_89607 - BLOCK
      ?auto_89608 - BLOCK
      ?auto_89609 - BLOCK
      ?auto_89610 - BLOCK
      ?auto_89611 - BLOCK
    )
    :vars
    (
      ?auto_89612 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_89610 ) ( ON-TABLE ?auto_89606 ) ( ON ?auto_89607 ?auto_89606 ) ( ON ?auto_89608 ?auto_89607 ) ( ON ?auto_89609 ?auto_89608 ) ( ON ?auto_89610 ?auto_89609 ) ( not ( = ?auto_89606 ?auto_89607 ) ) ( not ( = ?auto_89606 ?auto_89608 ) ) ( not ( = ?auto_89606 ?auto_89609 ) ) ( not ( = ?auto_89606 ?auto_89610 ) ) ( not ( = ?auto_89606 ?auto_89611 ) ) ( not ( = ?auto_89607 ?auto_89608 ) ) ( not ( = ?auto_89607 ?auto_89609 ) ) ( not ( = ?auto_89607 ?auto_89610 ) ) ( not ( = ?auto_89607 ?auto_89611 ) ) ( not ( = ?auto_89608 ?auto_89609 ) ) ( not ( = ?auto_89608 ?auto_89610 ) ) ( not ( = ?auto_89608 ?auto_89611 ) ) ( not ( = ?auto_89609 ?auto_89610 ) ) ( not ( = ?auto_89609 ?auto_89611 ) ) ( not ( = ?auto_89610 ?auto_89611 ) ) ( ON ?auto_89611 ?auto_89612 ) ( CLEAR ?auto_89611 ) ( HAND-EMPTY ) ( not ( = ?auto_89606 ?auto_89612 ) ) ( not ( = ?auto_89607 ?auto_89612 ) ) ( not ( = ?auto_89608 ?auto_89612 ) ) ( not ( = ?auto_89609 ?auto_89612 ) ) ( not ( = ?auto_89610 ?auto_89612 ) ) ( not ( = ?auto_89611 ?auto_89612 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89611 ?auto_89612 )
      ( MAKE-6PILE ?auto_89606 ?auto_89607 ?auto_89608 ?auto_89609 ?auto_89610 ?auto_89611 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89613 - BLOCK
      ?auto_89614 - BLOCK
      ?auto_89615 - BLOCK
      ?auto_89616 - BLOCK
      ?auto_89617 - BLOCK
      ?auto_89618 - BLOCK
    )
    :vars
    (
      ?auto_89619 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89613 ) ( ON ?auto_89614 ?auto_89613 ) ( ON ?auto_89615 ?auto_89614 ) ( ON ?auto_89616 ?auto_89615 ) ( not ( = ?auto_89613 ?auto_89614 ) ) ( not ( = ?auto_89613 ?auto_89615 ) ) ( not ( = ?auto_89613 ?auto_89616 ) ) ( not ( = ?auto_89613 ?auto_89617 ) ) ( not ( = ?auto_89613 ?auto_89618 ) ) ( not ( = ?auto_89614 ?auto_89615 ) ) ( not ( = ?auto_89614 ?auto_89616 ) ) ( not ( = ?auto_89614 ?auto_89617 ) ) ( not ( = ?auto_89614 ?auto_89618 ) ) ( not ( = ?auto_89615 ?auto_89616 ) ) ( not ( = ?auto_89615 ?auto_89617 ) ) ( not ( = ?auto_89615 ?auto_89618 ) ) ( not ( = ?auto_89616 ?auto_89617 ) ) ( not ( = ?auto_89616 ?auto_89618 ) ) ( not ( = ?auto_89617 ?auto_89618 ) ) ( ON ?auto_89618 ?auto_89619 ) ( CLEAR ?auto_89618 ) ( not ( = ?auto_89613 ?auto_89619 ) ) ( not ( = ?auto_89614 ?auto_89619 ) ) ( not ( = ?auto_89615 ?auto_89619 ) ) ( not ( = ?auto_89616 ?auto_89619 ) ) ( not ( = ?auto_89617 ?auto_89619 ) ) ( not ( = ?auto_89618 ?auto_89619 ) ) ( HOLDING ?auto_89617 ) ( CLEAR ?auto_89616 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89613 ?auto_89614 ?auto_89615 ?auto_89616 ?auto_89617 )
      ( MAKE-6PILE ?auto_89613 ?auto_89614 ?auto_89615 ?auto_89616 ?auto_89617 ?auto_89618 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89620 - BLOCK
      ?auto_89621 - BLOCK
      ?auto_89622 - BLOCK
      ?auto_89623 - BLOCK
      ?auto_89624 - BLOCK
      ?auto_89625 - BLOCK
    )
    :vars
    (
      ?auto_89626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89620 ) ( ON ?auto_89621 ?auto_89620 ) ( ON ?auto_89622 ?auto_89621 ) ( ON ?auto_89623 ?auto_89622 ) ( not ( = ?auto_89620 ?auto_89621 ) ) ( not ( = ?auto_89620 ?auto_89622 ) ) ( not ( = ?auto_89620 ?auto_89623 ) ) ( not ( = ?auto_89620 ?auto_89624 ) ) ( not ( = ?auto_89620 ?auto_89625 ) ) ( not ( = ?auto_89621 ?auto_89622 ) ) ( not ( = ?auto_89621 ?auto_89623 ) ) ( not ( = ?auto_89621 ?auto_89624 ) ) ( not ( = ?auto_89621 ?auto_89625 ) ) ( not ( = ?auto_89622 ?auto_89623 ) ) ( not ( = ?auto_89622 ?auto_89624 ) ) ( not ( = ?auto_89622 ?auto_89625 ) ) ( not ( = ?auto_89623 ?auto_89624 ) ) ( not ( = ?auto_89623 ?auto_89625 ) ) ( not ( = ?auto_89624 ?auto_89625 ) ) ( ON ?auto_89625 ?auto_89626 ) ( not ( = ?auto_89620 ?auto_89626 ) ) ( not ( = ?auto_89621 ?auto_89626 ) ) ( not ( = ?auto_89622 ?auto_89626 ) ) ( not ( = ?auto_89623 ?auto_89626 ) ) ( not ( = ?auto_89624 ?auto_89626 ) ) ( not ( = ?auto_89625 ?auto_89626 ) ) ( CLEAR ?auto_89623 ) ( ON ?auto_89624 ?auto_89625 ) ( CLEAR ?auto_89624 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89626 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89626 ?auto_89625 )
      ( MAKE-6PILE ?auto_89620 ?auto_89621 ?auto_89622 ?auto_89623 ?auto_89624 ?auto_89625 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89627 - BLOCK
      ?auto_89628 - BLOCK
      ?auto_89629 - BLOCK
      ?auto_89630 - BLOCK
      ?auto_89631 - BLOCK
      ?auto_89632 - BLOCK
    )
    :vars
    (
      ?auto_89633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89627 ) ( ON ?auto_89628 ?auto_89627 ) ( ON ?auto_89629 ?auto_89628 ) ( not ( = ?auto_89627 ?auto_89628 ) ) ( not ( = ?auto_89627 ?auto_89629 ) ) ( not ( = ?auto_89627 ?auto_89630 ) ) ( not ( = ?auto_89627 ?auto_89631 ) ) ( not ( = ?auto_89627 ?auto_89632 ) ) ( not ( = ?auto_89628 ?auto_89629 ) ) ( not ( = ?auto_89628 ?auto_89630 ) ) ( not ( = ?auto_89628 ?auto_89631 ) ) ( not ( = ?auto_89628 ?auto_89632 ) ) ( not ( = ?auto_89629 ?auto_89630 ) ) ( not ( = ?auto_89629 ?auto_89631 ) ) ( not ( = ?auto_89629 ?auto_89632 ) ) ( not ( = ?auto_89630 ?auto_89631 ) ) ( not ( = ?auto_89630 ?auto_89632 ) ) ( not ( = ?auto_89631 ?auto_89632 ) ) ( ON ?auto_89632 ?auto_89633 ) ( not ( = ?auto_89627 ?auto_89633 ) ) ( not ( = ?auto_89628 ?auto_89633 ) ) ( not ( = ?auto_89629 ?auto_89633 ) ) ( not ( = ?auto_89630 ?auto_89633 ) ) ( not ( = ?auto_89631 ?auto_89633 ) ) ( not ( = ?auto_89632 ?auto_89633 ) ) ( ON ?auto_89631 ?auto_89632 ) ( CLEAR ?auto_89631 ) ( ON-TABLE ?auto_89633 ) ( HOLDING ?auto_89630 ) ( CLEAR ?auto_89629 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89627 ?auto_89628 ?auto_89629 ?auto_89630 )
      ( MAKE-6PILE ?auto_89627 ?auto_89628 ?auto_89629 ?auto_89630 ?auto_89631 ?auto_89632 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89634 - BLOCK
      ?auto_89635 - BLOCK
      ?auto_89636 - BLOCK
      ?auto_89637 - BLOCK
      ?auto_89638 - BLOCK
      ?auto_89639 - BLOCK
    )
    :vars
    (
      ?auto_89640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89634 ) ( ON ?auto_89635 ?auto_89634 ) ( ON ?auto_89636 ?auto_89635 ) ( not ( = ?auto_89634 ?auto_89635 ) ) ( not ( = ?auto_89634 ?auto_89636 ) ) ( not ( = ?auto_89634 ?auto_89637 ) ) ( not ( = ?auto_89634 ?auto_89638 ) ) ( not ( = ?auto_89634 ?auto_89639 ) ) ( not ( = ?auto_89635 ?auto_89636 ) ) ( not ( = ?auto_89635 ?auto_89637 ) ) ( not ( = ?auto_89635 ?auto_89638 ) ) ( not ( = ?auto_89635 ?auto_89639 ) ) ( not ( = ?auto_89636 ?auto_89637 ) ) ( not ( = ?auto_89636 ?auto_89638 ) ) ( not ( = ?auto_89636 ?auto_89639 ) ) ( not ( = ?auto_89637 ?auto_89638 ) ) ( not ( = ?auto_89637 ?auto_89639 ) ) ( not ( = ?auto_89638 ?auto_89639 ) ) ( ON ?auto_89639 ?auto_89640 ) ( not ( = ?auto_89634 ?auto_89640 ) ) ( not ( = ?auto_89635 ?auto_89640 ) ) ( not ( = ?auto_89636 ?auto_89640 ) ) ( not ( = ?auto_89637 ?auto_89640 ) ) ( not ( = ?auto_89638 ?auto_89640 ) ) ( not ( = ?auto_89639 ?auto_89640 ) ) ( ON ?auto_89638 ?auto_89639 ) ( ON-TABLE ?auto_89640 ) ( CLEAR ?auto_89636 ) ( ON ?auto_89637 ?auto_89638 ) ( CLEAR ?auto_89637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89640 ?auto_89639 ?auto_89638 )
      ( MAKE-6PILE ?auto_89634 ?auto_89635 ?auto_89636 ?auto_89637 ?auto_89638 ?auto_89639 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89641 - BLOCK
      ?auto_89642 - BLOCK
      ?auto_89643 - BLOCK
      ?auto_89644 - BLOCK
      ?auto_89645 - BLOCK
      ?auto_89646 - BLOCK
    )
    :vars
    (
      ?auto_89647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89641 ) ( ON ?auto_89642 ?auto_89641 ) ( not ( = ?auto_89641 ?auto_89642 ) ) ( not ( = ?auto_89641 ?auto_89643 ) ) ( not ( = ?auto_89641 ?auto_89644 ) ) ( not ( = ?auto_89641 ?auto_89645 ) ) ( not ( = ?auto_89641 ?auto_89646 ) ) ( not ( = ?auto_89642 ?auto_89643 ) ) ( not ( = ?auto_89642 ?auto_89644 ) ) ( not ( = ?auto_89642 ?auto_89645 ) ) ( not ( = ?auto_89642 ?auto_89646 ) ) ( not ( = ?auto_89643 ?auto_89644 ) ) ( not ( = ?auto_89643 ?auto_89645 ) ) ( not ( = ?auto_89643 ?auto_89646 ) ) ( not ( = ?auto_89644 ?auto_89645 ) ) ( not ( = ?auto_89644 ?auto_89646 ) ) ( not ( = ?auto_89645 ?auto_89646 ) ) ( ON ?auto_89646 ?auto_89647 ) ( not ( = ?auto_89641 ?auto_89647 ) ) ( not ( = ?auto_89642 ?auto_89647 ) ) ( not ( = ?auto_89643 ?auto_89647 ) ) ( not ( = ?auto_89644 ?auto_89647 ) ) ( not ( = ?auto_89645 ?auto_89647 ) ) ( not ( = ?auto_89646 ?auto_89647 ) ) ( ON ?auto_89645 ?auto_89646 ) ( ON-TABLE ?auto_89647 ) ( ON ?auto_89644 ?auto_89645 ) ( CLEAR ?auto_89644 ) ( HOLDING ?auto_89643 ) ( CLEAR ?auto_89642 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89641 ?auto_89642 ?auto_89643 )
      ( MAKE-6PILE ?auto_89641 ?auto_89642 ?auto_89643 ?auto_89644 ?auto_89645 ?auto_89646 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89648 - BLOCK
      ?auto_89649 - BLOCK
      ?auto_89650 - BLOCK
      ?auto_89651 - BLOCK
      ?auto_89652 - BLOCK
      ?auto_89653 - BLOCK
    )
    :vars
    (
      ?auto_89654 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89648 ) ( ON ?auto_89649 ?auto_89648 ) ( not ( = ?auto_89648 ?auto_89649 ) ) ( not ( = ?auto_89648 ?auto_89650 ) ) ( not ( = ?auto_89648 ?auto_89651 ) ) ( not ( = ?auto_89648 ?auto_89652 ) ) ( not ( = ?auto_89648 ?auto_89653 ) ) ( not ( = ?auto_89649 ?auto_89650 ) ) ( not ( = ?auto_89649 ?auto_89651 ) ) ( not ( = ?auto_89649 ?auto_89652 ) ) ( not ( = ?auto_89649 ?auto_89653 ) ) ( not ( = ?auto_89650 ?auto_89651 ) ) ( not ( = ?auto_89650 ?auto_89652 ) ) ( not ( = ?auto_89650 ?auto_89653 ) ) ( not ( = ?auto_89651 ?auto_89652 ) ) ( not ( = ?auto_89651 ?auto_89653 ) ) ( not ( = ?auto_89652 ?auto_89653 ) ) ( ON ?auto_89653 ?auto_89654 ) ( not ( = ?auto_89648 ?auto_89654 ) ) ( not ( = ?auto_89649 ?auto_89654 ) ) ( not ( = ?auto_89650 ?auto_89654 ) ) ( not ( = ?auto_89651 ?auto_89654 ) ) ( not ( = ?auto_89652 ?auto_89654 ) ) ( not ( = ?auto_89653 ?auto_89654 ) ) ( ON ?auto_89652 ?auto_89653 ) ( ON-TABLE ?auto_89654 ) ( ON ?auto_89651 ?auto_89652 ) ( CLEAR ?auto_89649 ) ( ON ?auto_89650 ?auto_89651 ) ( CLEAR ?auto_89650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89654 ?auto_89653 ?auto_89652 ?auto_89651 )
      ( MAKE-6PILE ?auto_89648 ?auto_89649 ?auto_89650 ?auto_89651 ?auto_89652 ?auto_89653 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89655 - BLOCK
      ?auto_89656 - BLOCK
      ?auto_89657 - BLOCK
      ?auto_89658 - BLOCK
      ?auto_89659 - BLOCK
      ?auto_89660 - BLOCK
    )
    :vars
    (
      ?auto_89661 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89655 ) ( not ( = ?auto_89655 ?auto_89656 ) ) ( not ( = ?auto_89655 ?auto_89657 ) ) ( not ( = ?auto_89655 ?auto_89658 ) ) ( not ( = ?auto_89655 ?auto_89659 ) ) ( not ( = ?auto_89655 ?auto_89660 ) ) ( not ( = ?auto_89656 ?auto_89657 ) ) ( not ( = ?auto_89656 ?auto_89658 ) ) ( not ( = ?auto_89656 ?auto_89659 ) ) ( not ( = ?auto_89656 ?auto_89660 ) ) ( not ( = ?auto_89657 ?auto_89658 ) ) ( not ( = ?auto_89657 ?auto_89659 ) ) ( not ( = ?auto_89657 ?auto_89660 ) ) ( not ( = ?auto_89658 ?auto_89659 ) ) ( not ( = ?auto_89658 ?auto_89660 ) ) ( not ( = ?auto_89659 ?auto_89660 ) ) ( ON ?auto_89660 ?auto_89661 ) ( not ( = ?auto_89655 ?auto_89661 ) ) ( not ( = ?auto_89656 ?auto_89661 ) ) ( not ( = ?auto_89657 ?auto_89661 ) ) ( not ( = ?auto_89658 ?auto_89661 ) ) ( not ( = ?auto_89659 ?auto_89661 ) ) ( not ( = ?auto_89660 ?auto_89661 ) ) ( ON ?auto_89659 ?auto_89660 ) ( ON-TABLE ?auto_89661 ) ( ON ?auto_89658 ?auto_89659 ) ( ON ?auto_89657 ?auto_89658 ) ( CLEAR ?auto_89657 ) ( HOLDING ?auto_89656 ) ( CLEAR ?auto_89655 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89655 ?auto_89656 )
      ( MAKE-6PILE ?auto_89655 ?auto_89656 ?auto_89657 ?auto_89658 ?auto_89659 ?auto_89660 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89662 - BLOCK
      ?auto_89663 - BLOCK
      ?auto_89664 - BLOCK
      ?auto_89665 - BLOCK
      ?auto_89666 - BLOCK
      ?auto_89667 - BLOCK
    )
    :vars
    (
      ?auto_89668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89662 ) ( not ( = ?auto_89662 ?auto_89663 ) ) ( not ( = ?auto_89662 ?auto_89664 ) ) ( not ( = ?auto_89662 ?auto_89665 ) ) ( not ( = ?auto_89662 ?auto_89666 ) ) ( not ( = ?auto_89662 ?auto_89667 ) ) ( not ( = ?auto_89663 ?auto_89664 ) ) ( not ( = ?auto_89663 ?auto_89665 ) ) ( not ( = ?auto_89663 ?auto_89666 ) ) ( not ( = ?auto_89663 ?auto_89667 ) ) ( not ( = ?auto_89664 ?auto_89665 ) ) ( not ( = ?auto_89664 ?auto_89666 ) ) ( not ( = ?auto_89664 ?auto_89667 ) ) ( not ( = ?auto_89665 ?auto_89666 ) ) ( not ( = ?auto_89665 ?auto_89667 ) ) ( not ( = ?auto_89666 ?auto_89667 ) ) ( ON ?auto_89667 ?auto_89668 ) ( not ( = ?auto_89662 ?auto_89668 ) ) ( not ( = ?auto_89663 ?auto_89668 ) ) ( not ( = ?auto_89664 ?auto_89668 ) ) ( not ( = ?auto_89665 ?auto_89668 ) ) ( not ( = ?auto_89666 ?auto_89668 ) ) ( not ( = ?auto_89667 ?auto_89668 ) ) ( ON ?auto_89666 ?auto_89667 ) ( ON-TABLE ?auto_89668 ) ( ON ?auto_89665 ?auto_89666 ) ( ON ?auto_89664 ?auto_89665 ) ( CLEAR ?auto_89662 ) ( ON ?auto_89663 ?auto_89664 ) ( CLEAR ?auto_89663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89668 ?auto_89667 ?auto_89666 ?auto_89665 ?auto_89664 )
      ( MAKE-6PILE ?auto_89662 ?auto_89663 ?auto_89664 ?auto_89665 ?auto_89666 ?auto_89667 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89669 - BLOCK
      ?auto_89670 - BLOCK
      ?auto_89671 - BLOCK
      ?auto_89672 - BLOCK
      ?auto_89673 - BLOCK
      ?auto_89674 - BLOCK
    )
    :vars
    (
      ?auto_89675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89669 ?auto_89670 ) ) ( not ( = ?auto_89669 ?auto_89671 ) ) ( not ( = ?auto_89669 ?auto_89672 ) ) ( not ( = ?auto_89669 ?auto_89673 ) ) ( not ( = ?auto_89669 ?auto_89674 ) ) ( not ( = ?auto_89670 ?auto_89671 ) ) ( not ( = ?auto_89670 ?auto_89672 ) ) ( not ( = ?auto_89670 ?auto_89673 ) ) ( not ( = ?auto_89670 ?auto_89674 ) ) ( not ( = ?auto_89671 ?auto_89672 ) ) ( not ( = ?auto_89671 ?auto_89673 ) ) ( not ( = ?auto_89671 ?auto_89674 ) ) ( not ( = ?auto_89672 ?auto_89673 ) ) ( not ( = ?auto_89672 ?auto_89674 ) ) ( not ( = ?auto_89673 ?auto_89674 ) ) ( ON ?auto_89674 ?auto_89675 ) ( not ( = ?auto_89669 ?auto_89675 ) ) ( not ( = ?auto_89670 ?auto_89675 ) ) ( not ( = ?auto_89671 ?auto_89675 ) ) ( not ( = ?auto_89672 ?auto_89675 ) ) ( not ( = ?auto_89673 ?auto_89675 ) ) ( not ( = ?auto_89674 ?auto_89675 ) ) ( ON ?auto_89673 ?auto_89674 ) ( ON-TABLE ?auto_89675 ) ( ON ?auto_89672 ?auto_89673 ) ( ON ?auto_89671 ?auto_89672 ) ( ON ?auto_89670 ?auto_89671 ) ( CLEAR ?auto_89670 ) ( HOLDING ?auto_89669 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89669 )
      ( MAKE-6PILE ?auto_89669 ?auto_89670 ?auto_89671 ?auto_89672 ?auto_89673 ?auto_89674 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89676 - BLOCK
      ?auto_89677 - BLOCK
      ?auto_89678 - BLOCK
      ?auto_89679 - BLOCK
      ?auto_89680 - BLOCK
      ?auto_89681 - BLOCK
    )
    :vars
    (
      ?auto_89682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89676 ?auto_89677 ) ) ( not ( = ?auto_89676 ?auto_89678 ) ) ( not ( = ?auto_89676 ?auto_89679 ) ) ( not ( = ?auto_89676 ?auto_89680 ) ) ( not ( = ?auto_89676 ?auto_89681 ) ) ( not ( = ?auto_89677 ?auto_89678 ) ) ( not ( = ?auto_89677 ?auto_89679 ) ) ( not ( = ?auto_89677 ?auto_89680 ) ) ( not ( = ?auto_89677 ?auto_89681 ) ) ( not ( = ?auto_89678 ?auto_89679 ) ) ( not ( = ?auto_89678 ?auto_89680 ) ) ( not ( = ?auto_89678 ?auto_89681 ) ) ( not ( = ?auto_89679 ?auto_89680 ) ) ( not ( = ?auto_89679 ?auto_89681 ) ) ( not ( = ?auto_89680 ?auto_89681 ) ) ( ON ?auto_89681 ?auto_89682 ) ( not ( = ?auto_89676 ?auto_89682 ) ) ( not ( = ?auto_89677 ?auto_89682 ) ) ( not ( = ?auto_89678 ?auto_89682 ) ) ( not ( = ?auto_89679 ?auto_89682 ) ) ( not ( = ?auto_89680 ?auto_89682 ) ) ( not ( = ?auto_89681 ?auto_89682 ) ) ( ON ?auto_89680 ?auto_89681 ) ( ON-TABLE ?auto_89682 ) ( ON ?auto_89679 ?auto_89680 ) ( ON ?auto_89678 ?auto_89679 ) ( ON ?auto_89677 ?auto_89678 ) ( ON ?auto_89676 ?auto_89677 ) ( CLEAR ?auto_89676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89682 ?auto_89681 ?auto_89680 ?auto_89679 ?auto_89678 ?auto_89677 )
      ( MAKE-6PILE ?auto_89676 ?auto_89677 ?auto_89678 ?auto_89679 ?auto_89680 ?auto_89681 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89683 - BLOCK
      ?auto_89684 - BLOCK
      ?auto_89685 - BLOCK
      ?auto_89686 - BLOCK
      ?auto_89687 - BLOCK
      ?auto_89688 - BLOCK
    )
    :vars
    (
      ?auto_89689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89683 ?auto_89684 ) ) ( not ( = ?auto_89683 ?auto_89685 ) ) ( not ( = ?auto_89683 ?auto_89686 ) ) ( not ( = ?auto_89683 ?auto_89687 ) ) ( not ( = ?auto_89683 ?auto_89688 ) ) ( not ( = ?auto_89684 ?auto_89685 ) ) ( not ( = ?auto_89684 ?auto_89686 ) ) ( not ( = ?auto_89684 ?auto_89687 ) ) ( not ( = ?auto_89684 ?auto_89688 ) ) ( not ( = ?auto_89685 ?auto_89686 ) ) ( not ( = ?auto_89685 ?auto_89687 ) ) ( not ( = ?auto_89685 ?auto_89688 ) ) ( not ( = ?auto_89686 ?auto_89687 ) ) ( not ( = ?auto_89686 ?auto_89688 ) ) ( not ( = ?auto_89687 ?auto_89688 ) ) ( ON ?auto_89688 ?auto_89689 ) ( not ( = ?auto_89683 ?auto_89689 ) ) ( not ( = ?auto_89684 ?auto_89689 ) ) ( not ( = ?auto_89685 ?auto_89689 ) ) ( not ( = ?auto_89686 ?auto_89689 ) ) ( not ( = ?auto_89687 ?auto_89689 ) ) ( not ( = ?auto_89688 ?auto_89689 ) ) ( ON ?auto_89687 ?auto_89688 ) ( ON-TABLE ?auto_89689 ) ( ON ?auto_89686 ?auto_89687 ) ( ON ?auto_89685 ?auto_89686 ) ( ON ?auto_89684 ?auto_89685 ) ( HOLDING ?auto_89683 ) ( CLEAR ?auto_89684 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89689 ?auto_89688 ?auto_89687 ?auto_89686 ?auto_89685 ?auto_89684 ?auto_89683 )
      ( MAKE-6PILE ?auto_89683 ?auto_89684 ?auto_89685 ?auto_89686 ?auto_89687 ?auto_89688 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89690 - BLOCK
      ?auto_89691 - BLOCK
      ?auto_89692 - BLOCK
      ?auto_89693 - BLOCK
      ?auto_89694 - BLOCK
      ?auto_89695 - BLOCK
    )
    :vars
    (
      ?auto_89696 - BLOCK
      ?auto_89697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89690 ?auto_89691 ) ) ( not ( = ?auto_89690 ?auto_89692 ) ) ( not ( = ?auto_89690 ?auto_89693 ) ) ( not ( = ?auto_89690 ?auto_89694 ) ) ( not ( = ?auto_89690 ?auto_89695 ) ) ( not ( = ?auto_89691 ?auto_89692 ) ) ( not ( = ?auto_89691 ?auto_89693 ) ) ( not ( = ?auto_89691 ?auto_89694 ) ) ( not ( = ?auto_89691 ?auto_89695 ) ) ( not ( = ?auto_89692 ?auto_89693 ) ) ( not ( = ?auto_89692 ?auto_89694 ) ) ( not ( = ?auto_89692 ?auto_89695 ) ) ( not ( = ?auto_89693 ?auto_89694 ) ) ( not ( = ?auto_89693 ?auto_89695 ) ) ( not ( = ?auto_89694 ?auto_89695 ) ) ( ON ?auto_89695 ?auto_89696 ) ( not ( = ?auto_89690 ?auto_89696 ) ) ( not ( = ?auto_89691 ?auto_89696 ) ) ( not ( = ?auto_89692 ?auto_89696 ) ) ( not ( = ?auto_89693 ?auto_89696 ) ) ( not ( = ?auto_89694 ?auto_89696 ) ) ( not ( = ?auto_89695 ?auto_89696 ) ) ( ON ?auto_89694 ?auto_89695 ) ( ON-TABLE ?auto_89696 ) ( ON ?auto_89693 ?auto_89694 ) ( ON ?auto_89692 ?auto_89693 ) ( ON ?auto_89691 ?auto_89692 ) ( CLEAR ?auto_89691 ) ( ON ?auto_89690 ?auto_89697 ) ( CLEAR ?auto_89690 ) ( HAND-EMPTY ) ( not ( = ?auto_89690 ?auto_89697 ) ) ( not ( = ?auto_89691 ?auto_89697 ) ) ( not ( = ?auto_89692 ?auto_89697 ) ) ( not ( = ?auto_89693 ?auto_89697 ) ) ( not ( = ?auto_89694 ?auto_89697 ) ) ( not ( = ?auto_89695 ?auto_89697 ) ) ( not ( = ?auto_89696 ?auto_89697 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89690 ?auto_89697 )
      ( MAKE-6PILE ?auto_89690 ?auto_89691 ?auto_89692 ?auto_89693 ?auto_89694 ?auto_89695 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89698 - BLOCK
      ?auto_89699 - BLOCK
      ?auto_89700 - BLOCK
      ?auto_89701 - BLOCK
      ?auto_89702 - BLOCK
      ?auto_89703 - BLOCK
    )
    :vars
    (
      ?auto_89704 - BLOCK
      ?auto_89705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89698 ?auto_89699 ) ) ( not ( = ?auto_89698 ?auto_89700 ) ) ( not ( = ?auto_89698 ?auto_89701 ) ) ( not ( = ?auto_89698 ?auto_89702 ) ) ( not ( = ?auto_89698 ?auto_89703 ) ) ( not ( = ?auto_89699 ?auto_89700 ) ) ( not ( = ?auto_89699 ?auto_89701 ) ) ( not ( = ?auto_89699 ?auto_89702 ) ) ( not ( = ?auto_89699 ?auto_89703 ) ) ( not ( = ?auto_89700 ?auto_89701 ) ) ( not ( = ?auto_89700 ?auto_89702 ) ) ( not ( = ?auto_89700 ?auto_89703 ) ) ( not ( = ?auto_89701 ?auto_89702 ) ) ( not ( = ?auto_89701 ?auto_89703 ) ) ( not ( = ?auto_89702 ?auto_89703 ) ) ( ON ?auto_89703 ?auto_89704 ) ( not ( = ?auto_89698 ?auto_89704 ) ) ( not ( = ?auto_89699 ?auto_89704 ) ) ( not ( = ?auto_89700 ?auto_89704 ) ) ( not ( = ?auto_89701 ?auto_89704 ) ) ( not ( = ?auto_89702 ?auto_89704 ) ) ( not ( = ?auto_89703 ?auto_89704 ) ) ( ON ?auto_89702 ?auto_89703 ) ( ON-TABLE ?auto_89704 ) ( ON ?auto_89701 ?auto_89702 ) ( ON ?auto_89700 ?auto_89701 ) ( ON ?auto_89698 ?auto_89705 ) ( CLEAR ?auto_89698 ) ( not ( = ?auto_89698 ?auto_89705 ) ) ( not ( = ?auto_89699 ?auto_89705 ) ) ( not ( = ?auto_89700 ?auto_89705 ) ) ( not ( = ?auto_89701 ?auto_89705 ) ) ( not ( = ?auto_89702 ?auto_89705 ) ) ( not ( = ?auto_89703 ?auto_89705 ) ) ( not ( = ?auto_89704 ?auto_89705 ) ) ( HOLDING ?auto_89699 ) ( CLEAR ?auto_89700 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89704 ?auto_89703 ?auto_89702 ?auto_89701 ?auto_89700 ?auto_89699 )
      ( MAKE-6PILE ?auto_89698 ?auto_89699 ?auto_89700 ?auto_89701 ?auto_89702 ?auto_89703 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89706 - BLOCK
      ?auto_89707 - BLOCK
      ?auto_89708 - BLOCK
      ?auto_89709 - BLOCK
      ?auto_89710 - BLOCK
      ?auto_89711 - BLOCK
    )
    :vars
    (
      ?auto_89712 - BLOCK
      ?auto_89713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89706 ?auto_89707 ) ) ( not ( = ?auto_89706 ?auto_89708 ) ) ( not ( = ?auto_89706 ?auto_89709 ) ) ( not ( = ?auto_89706 ?auto_89710 ) ) ( not ( = ?auto_89706 ?auto_89711 ) ) ( not ( = ?auto_89707 ?auto_89708 ) ) ( not ( = ?auto_89707 ?auto_89709 ) ) ( not ( = ?auto_89707 ?auto_89710 ) ) ( not ( = ?auto_89707 ?auto_89711 ) ) ( not ( = ?auto_89708 ?auto_89709 ) ) ( not ( = ?auto_89708 ?auto_89710 ) ) ( not ( = ?auto_89708 ?auto_89711 ) ) ( not ( = ?auto_89709 ?auto_89710 ) ) ( not ( = ?auto_89709 ?auto_89711 ) ) ( not ( = ?auto_89710 ?auto_89711 ) ) ( ON ?auto_89711 ?auto_89712 ) ( not ( = ?auto_89706 ?auto_89712 ) ) ( not ( = ?auto_89707 ?auto_89712 ) ) ( not ( = ?auto_89708 ?auto_89712 ) ) ( not ( = ?auto_89709 ?auto_89712 ) ) ( not ( = ?auto_89710 ?auto_89712 ) ) ( not ( = ?auto_89711 ?auto_89712 ) ) ( ON ?auto_89710 ?auto_89711 ) ( ON-TABLE ?auto_89712 ) ( ON ?auto_89709 ?auto_89710 ) ( ON ?auto_89708 ?auto_89709 ) ( ON ?auto_89706 ?auto_89713 ) ( not ( = ?auto_89706 ?auto_89713 ) ) ( not ( = ?auto_89707 ?auto_89713 ) ) ( not ( = ?auto_89708 ?auto_89713 ) ) ( not ( = ?auto_89709 ?auto_89713 ) ) ( not ( = ?auto_89710 ?auto_89713 ) ) ( not ( = ?auto_89711 ?auto_89713 ) ) ( not ( = ?auto_89712 ?auto_89713 ) ) ( CLEAR ?auto_89708 ) ( ON ?auto_89707 ?auto_89706 ) ( CLEAR ?auto_89707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89713 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89713 ?auto_89706 )
      ( MAKE-6PILE ?auto_89706 ?auto_89707 ?auto_89708 ?auto_89709 ?auto_89710 ?auto_89711 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89714 - BLOCK
      ?auto_89715 - BLOCK
      ?auto_89716 - BLOCK
      ?auto_89717 - BLOCK
      ?auto_89718 - BLOCK
      ?auto_89719 - BLOCK
    )
    :vars
    (
      ?auto_89721 - BLOCK
      ?auto_89720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89714 ?auto_89715 ) ) ( not ( = ?auto_89714 ?auto_89716 ) ) ( not ( = ?auto_89714 ?auto_89717 ) ) ( not ( = ?auto_89714 ?auto_89718 ) ) ( not ( = ?auto_89714 ?auto_89719 ) ) ( not ( = ?auto_89715 ?auto_89716 ) ) ( not ( = ?auto_89715 ?auto_89717 ) ) ( not ( = ?auto_89715 ?auto_89718 ) ) ( not ( = ?auto_89715 ?auto_89719 ) ) ( not ( = ?auto_89716 ?auto_89717 ) ) ( not ( = ?auto_89716 ?auto_89718 ) ) ( not ( = ?auto_89716 ?auto_89719 ) ) ( not ( = ?auto_89717 ?auto_89718 ) ) ( not ( = ?auto_89717 ?auto_89719 ) ) ( not ( = ?auto_89718 ?auto_89719 ) ) ( ON ?auto_89719 ?auto_89721 ) ( not ( = ?auto_89714 ?auto_89721 ) ) ( not ( = ?auto_89715 ?auto_89721 ) ) ( not ( = ?auto_89716 ?auto_89721 ) ) ( not ( = ?auto_89717 ?auto_89721 ) ) ( not ( = ?auto_89718 ?auto_89721 ) ) ( not ( = ?auto_89719 ?auto_89721 ) ) ( ON ?auto_89718 ?auto_89719 ) ( ON-TABLE ?auto_89721 ) ( ON ?auto_89717 ?auto_89718 ) ( ON ?auto_89714 ?auto_89720 ) ( not ( = ?auto_89714 ?auto_89720 ) ) ( not ( = ?auto_89715 ?auto_89720 ) ) ( not ( = ?auto_89716 ?auto_89720 ) ) ( not ( = ?auto_89717 ?auto_89720 ) ) ( not ( = ?auto_89718 ?auto_89720 ) ) ( not ( = ?auto_89719 ?auto_89720 ) ) ( not ( = ?auto_89721 ?auto_89720 ) ) ( ON ?auto_89715 ?auto_89714 ) ( CLEAR ?auto_89715 ) ( ON-TABLE ?auto_89720 ) ( HOLDING ?auto_89716 ) ( CLEAR ?auto_89717 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89721 ?auto_89719 ?auto_89718 ?auto_89717 ?auto_89716 )
      ( MAKE-6PILE ?auto_89714 ?auto_89715 ?auto_89716 ?auto_89717 ?auto_89718 ?auto_89719 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89722 - BLOCK
      ?auto_89723 - BLOCK
      ?auto_89724 - BLOCK
      ?auto_89725 - BLOCK
      ?auto_89726 - BLOCK
      ?auto_89727 - BLOCK
    )
    :vars
    (
      ?auto_89728 - BLOCK
      ?auto_89729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89722 ?auto_89723 ) ) ( not ( = ?auto_89722 ?auto_89724 ) ) ( not ( = ?auto_89722 ?auto_89725 ) ) ( not ( = ?auto_89722 ?auto_89726 ) ) ( not ( = ?auto_89722 ?auto_89727 ) ) ( not ( = ?auto_89723 ?auto_89724 ) ) ( not ( = ?auto_89723 ?auto_89725 ) ) ( not ( = ?auto_89723 ?auto_89726 ) ) ( not ( = ?auto_89723 ?auto_89727 ) ) ( not ( = ?auto_89724 ?auto_89725 ) ) ( not ( = ?auto_89724 ?auto_89726 ) ) ( not ( = ?auto_89724 ?auto_89727 ) ) ( not ( = ?auto_89725 ?auto_89726 ) ) ( not ( = ?auto_89725 ?auto_89727 ) ) ( not ( = ?auto_89726 ?auto_89727 ) ) ( ON ?auto_89727 ?auto_89728 ) ( not ( = ?auto_89722 ?auto_89728 ) ) ( not ( = ?auto_89723 ?auto_89728 ) ) ( not ( = ?auto_89724 ?auto_89728 ) ) ( not ( = ?auto_89725 ?auto_89728 ) ) ( not ( = ?auto_89726 ?auto_89728 ) ) ( not ( = ?auto_89727 ?auto_89728 ) ) ( ON ?auto_89726 ?auto_89727 ) ( ON-TABLE ?auto_89728 ) ( ON ?auto_89725 ?auto_89726 ) ( ON ?auto_89722 ?auto_89729 ) ( not ( = ?auto_89722 ?auto_89729 ) ) ( not ( = ?auto_89723 ?auto_89729 ) ) ( not ( = ?auto_89724 ?auto_89729 ) ) ( not ( = ?auto_89725 ?auto_89729 ) ) ( not ( = ?auto_89726 ?auto_89729 ) ) ( not ( = ?auto_89727 ?auto_89729 ) ) ( not ( = ?auto_89728 ?auto_89729 ) ) ( ON ?auto_89723 ?auto_89722 ) ( ON-TABLE ?auto_89729 ) ( CLEAR ?auto_89725 ) ( ON ?auto_89724 ?auto_89723 ) ( CLEAR ?auto_89724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89729 ?auto_89722 ?auto_89723 )
      ( MAKE-6PILE ?auto_89722 ?auto_89723 ?auto_89724 ?auto_89725 ?auto_89726 ?auto_89727 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89730 - BLOCK
      ?auto_89731 - BLOCK
      ?auto_89732 - BLOCK
      ?auto_89733 - BLOCK
      ?auto_89734 - BLOCK
      ?auto_89735 - BLOCK
    )
    :vars
    (
      ?auto_89736 - BLOCK
      ?auto_89737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89730 ?auto_89731 ) ) ( not ( = ?auto_89730 ?auto_89732 ) ) ( not ( = ?auto_89730 ?auto_89733 ) ) ( not ( = ?auto_89730 ?auto_89734 ) ) ( not ( = ?auto_89730 ?auto_89735 ) ) ( not ( = ?auto_89731 ?auto_89732 ) ) ( not ( = ?auto_89731 ?auto_89733 ) ) ( not ( = ?auto_89731 ?auto_89734 ) ) ( not ( = ?auto_89731 ?auto_89735 ) ) ( not ( = ?auto_89732 ?auto_89733 ) ) ( not ( = ?auto_89732 ?auto_89734 ) ) ( not ( = ?auto_89732 ?auto_89735 ) ) ( not ( = ?auto_89733 ?auto_89734 ) ) ( not ( = ?auto_89733 ?auto_89735 ) ) ( not ( = ?auto_89734 ?auto_89735 ) ) ( ON ?auto_89735 ?auto_89736 ) ( not ( = ?auto_89730 ?auto_89736 ) ) ( not ( = ?auto_89731 ?auto_89736 ) ) ( not ( = ?auto_89732 ?auto_89736 ) ) ( not ( = ?auto_89733 ?auto_89736 ) ) ( not ( = ?auto_89734 ?auto_89736 ) ) ( not ( = ?auto_89735 ?auto_89736 ) ) ( ON ?auto_89734 ?auto_89735 ) ( ON-TABLE ?auto_89736 ) ( ON ?auto_89730 ?auto_89737 ) ( not ( = ?auto_89730 ?auto_89737 ) ) ( not ( = ?auto_89731 ?auto_89737 ) ) ( not ( = ?auto_89732 ?auto_89737 ) ) ( not ( = ?auto_89733 ?auto_89737 ) ) ( not ( = ?auto_89734 ?auto_89737 ) ) ( not ( = ?auto_89735 ?auto_89737 ) ) ( not ( = ?auto_89736 ?auto_89737 ) ) ( ON ?auto_89731 ?auto_89730 ) ( ON-TABLE ?auto_89737 ) ( ON ?auto_89732 ?auto_89731 ) ( CLEAR ?auto_89732 ) ( HOLDING ?auto_89733 ) ( CLEAR ?auto_89734 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89736 ?auto_89735 ?auto_89734 ?auto_89733 )
      ( MAKE-6PILE ?auto_89730 ?auto_89731 ?auto_89732 ?auto_89733 ?auto_89734 ?auto_89735 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89738 - BLOCK
      ?auto_89739 - BLOCK
      ?auto_89740 - BLOCK
      ?auto_89741 - BLOCK
      ?auto_89742 - BLOCK
      ?auto_89743 - BLOCK
    )
    :vars
    (
      ?auto_89744 - BLOCK
      ?auto_89745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89738 ?auto_89739 ) ) ( not ( = ?auto_89738 ?auto_89740 ) ) ( not ( = ?auto_89738 ?auto_89741 ) ) ( not ( = ?auto_89738 ?auto_89742 ) ) ( not ( = ?auto_89738 ?auto_89743 ) ) ( not ( = ?auto_89739 ?auto_89740 ) ) ( not ( = ?auto_89739 ?auto_89741 ) ) ( not ( = ?auto_89739 ?auto_89742 ) ) ( not ( = ?auto_89739 ?auto_89743 ) ) ( not ( = ?auto_89740 ?auto_89741 ) ) ( not ( = ?auto_89740 ?auto_89742 ) ) ( not ( = ?auto_89740 ?auto_89743 ) ) ( not ( = ?auto_89741 ?auto_89742 ) ) ( not ( = ?auto_89741 ?auto_89743 ) ) ( not ( = ?auto_89742 ?auto_89743 ) ) ( ON ?auto_89743 ?auto_89744 ) ( not ( = ?auto_89738 ?auto_89744 ) ) ( not ( = ?auto_89739 ?auto_89744 ) ) ( not ( = ?auto_89740 ?auto_89744 ) ) ( not ( = ?auto_89741 ?auto_89744 ) ) ( not ( = ?auto_89742 ?auto_89744 ) ) ( not ( = ?auto_89743 ?auto_89744 ) ) ( ON ?auto_89742 ?auto_89743 ) ( ON-TABLE ?auto_89744 ) ( ON ?auto_89738 ?auto_89745 ) ( not ( = ?auto_89738 ?auto_89745 ) ) ( not ( = ?auto_89739 ?auto_89745 ) ) ( not ( = ?auto_89740 ?auto_89745 ) ) ( not ( = ?auto_89741 ?auto_89745 ) ) ( not ( = ?auto_89742 ?auto_89745 ) ) ( not ( = ?auto_89743 ?auto_89745 ) ) ( not ( = ?auto_89744 ?auto_89745 ) ) ( ON ?auto_89739 ?auto_89738 ) ( ON-TABLE ?auto_89745 ) ( ON ?auto_89740 ?auto_89739 ) ( CLEAR ?auto_89742 ) ( ON ?auto_89741 ?auto_89740 ) ( CLEAR ?auto_89741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89745 ?auto_89738 ?auto_89739 ?auto_89740 )
      ( MAKE-6PILE ?auto_89738 ?auto_89739 ?auto_89740 ?auto_89741 ?auto_89742 ?auto_89743 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89746 - BLOCK
      ?auto_89747 - BLOCK
      ?auto_89748 - BLOCK
      ?auto_89749 - BLOCK
      ?auto_89750 - BLOCK
      ?auto_89751 - BLOCK
    )
    :vars
    (
      ?auto_89752 - BLOCK
      ?auto_89753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89746 ?auto_89747 ) ) ( not ( = ?auto_89746 ?auto_89748 ) ) ( not ( = ?auto_89746 ?auto_89749 ) ) ( not ( = ?auto_89746 ?auto_89750 ) ) ( not ( = ?auto_89746 ?auto_89751 ) ) ( not ( = ?auto_89747 ?auto_89748 ) ) ( not ( = ?auto_89747 ?auto_89749 ) ) ( not ( = ?auto_89747 ?auto_89750 ) ) ( not ( = ?auto_89747 ?auto_89751 ) ) ( not ( = ?auto_89748 ?auto_89749 ) ) ( not ( = ?auto_89748 ?auto_89750 ) ) ( not ( = ?auto_89748 ?auto_89751 ) ) ( not ( = ?auto_89749 ?auto_89750 ) ) ( not ( = ?auto_89749 ?auto_89751 ) ) ( not ( = ?auto_89750 ?auto_89751 ) ) ( ON ?auto_89751 ?auto_89752 ) ( not ( = ?auto_89746 ?auto_89752 ) ) ( not ( = ?auto_89747 ?auto_89752 ) ) ( not ( = ?auto_89748 ?auto_89752 ) ) ( not ( = ?auto_89749 ?auto_89752 ) ) ( not ( = ?auto_89750 ?auto_89752 ) ) ( not ( = ?auto_89751 ?auto_89752 ) ) ( ON-TABLE ?auto_89752 ) ( ON ?auto_89746 ?auto_89753 ) ( not ( = ?auto_89746 ?auto_89753 ) ) ( not ( = ?auto_89747 ?auto_89753 ) ) ( not ( = ?auto_89748 ?auto_89753 ) ) ( not ( = ?auto_89749 ?auto_89753 ) ) ( not ( = ?auto_89750 ?auto_89753 ) ) ( not ( = ?auto_89751 ?auto_89753 ) ) ( not ( = ?auto_89752 ?auto_89753 ) ) ( ON ?auto_89747 ?auto_89746 ) ( ON-TABLE ?auto_89753 ) ( ON ?auto_89748 ?auto_89747 ) ( ON ?auto_89749 ?auto_89748 ) ( CLEAR ?auto_89749 ) ( HOLDING ?auto_89750 ) ( CLEAR ?auto_89751 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89752 ?auto_89751 ?auto_89750 )
      ( MAKE-6PILE ?auto_89746 ?auto_89747 ?auto_89748 ?auto_89749 ?auto_89750 ?auto_89751 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89754 - BLOCK
      ?auto_89755 - BLOCK
      ?auto_89756 - BLOCK
      ?auto_89757 - BLOCK
      ?auto_89758 - BLOCK
      ?auto_89759 - BLOCK
    )
    :vars
    (
      ?auto_89761 - BLOCK
      ?auto_89760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89754 ?auto_89755 ) ) ( not ( = ?auto_89754 ?auto_89756 ) ) ( not ( = ?auto_89754 ?auto_89757 ) ) ( not ( = ?auto_89754 ?auto_89758 ) ) ( not ( = ?auto_89754 ?auto_89759 ) ) ( not ( = ?auto_89755 ?auto_89756 ) ) ( not ( = ?auto_89755 ?auto_89757 ) ) ( not ( = ?auto_89755 ?auto_89758 ) ) ( not ( = ?auto_89755 ?auto_89759 ) ) ( not ( = ?auto_89756 ?auto_89757 ) ) ( not ( = ?auto_89756 ?auto_89758 ) ) ( not ( = ?auto_89756 ?auto_89759 ) ) ( not ( = ?auto_89757 ?auto_89758 ) ) ( not ( = ?auto_89757 ?auto_89759 ) ) ( not ( = ?auto_89758 ?auto_89759 ) ) ( ON ?auto_89759 ?auto_89761 ) ( not ( = ?auto_89754 ?auto_89761 ) ) ( not ( = ?auto_89755 ?auto_89761 ) ) ( not ( = ?auto_89756 ?auto_89761 ) ) ( not ( = ?auto_89757 ?auto_89761 ) ) ( not ( = ?auto_89758 ?auto_89761 ) ) ( not ( = ?auto_89759 ?auto_89761 ) ) ( ON-TABLE ?auto_89761 ) ( ON ?auto_89754 ?auto_89760 ) ( not ( = ?auto_89754 ?auto_89760 ) ) ( not ( = ?auto_89755 ?auto_89760 ) ) ( not ( = ?auto_89756 ?auto_89760 ) ) ( not ( = ?auto_89757 ?auto_89760 ) ) ( not ( = ?auto_89758 ?auto_89760 ) ) ( not ( = ?auto_89759 ?auto_89760 ) ) ( not ( = ?auto_89761 ?auto_89760 ) ) ( ON ?auto_89755 ?auto_89754 ) ( ON-TABLE ?auto_89760 ) ( ON ?auto_89756 ?auto_89755 ) ( ON ?auto_89757 ?auto_89756 ) ( CLEAR ?auto_89759 ) ( ON ?auto_89758 ?auto_89757 ) ( CLEAR ?auto_89758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89760 ?auto_89754 ?auto_89755 ?auto_89756 ?auto_89757 )
      ( MAKE-6PILE ?auto_89754 ?auto_89755 ?auto_89756 ?auto_89757 ?auto_89758 ?auto_89759 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89762 - BLOCK
      ?auto_89763 - BLOCK
      ?auto_89764 - BLOCK
      ?auto_89765 - BLOCK
      ?auto_89766 - BLOCK
      ?auto_89767 - BLOCK
    )
    :vars
    (
      ?auto_89768 - BLOCK
      ?auto_89769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89762 ?auto_89763 ) ) ( not ( = ?auto_89762 ?auto_89764 ) ) ( not ( = ?auto_89762 ?auto_89765 ) ) ( not ( = ?auto_89762 ?auto_89766 ) ) ( not ( = ?auto_89762 ?auto_89767 ) ) ( not ( = ?auto_89763 ?auto_89764 ) ) ( not ( = ?auto_89763 ?auto_89765 ) ) ( not ( = ?auto_89763 ?auto_89766 ) ) ( not ( = ?auto_89763 ?auto_89767 ) ) ( not ( = ?auto_89764 ?auto_89765 ) ) ( not ( = ?auto_89764 ?auto_89766 ) ) ( not ( = ?auto_89764 ?auto_89767 ) ) ( not ( = ?auto_89765 ?auto_89766 ) ) ( not ( = ?auto_89765 ?auto_89767 ) ) ( not ( = ?auto_89766 ?auto_89767 ) ) ( not ( = ?auto_89762 ?auto_89768 ) ) ( not ( = ?auto_89763 ?auto_89768 ) ) ( not ( = ?auto_89764 ?auto_89768 ) ) ( not ( = ?auto_89765 ?auto_89768 ) ) ( not ( = ?auto_89766 ?auto_89768 ) ) ( not ( = ?auto_89767 ?auto_89768 ) ) ( ON-TABLE ?auto_89768 ) ( ON ?auto_89762 ?auto_89769 ) ( not ( = ?auto_89762 ?auto_89769 ) ) ( not ( = ?auto_89763 ?auto_89769 ) ) ( not ( = ?auto_89764 ?auto_89769 ) ) ( not ( = ?auto_89765 ?auto_89769 ) ) ( not ( = ?auto_89766 ?auto_89769 ) ) ( not ( = ?auto_89767 ?auto_89769 ) ) ( not ( = ?auto_89768 ?auto_89769 ) ) ( ON ?auto_89763 ?auto_89762 ) ( ON-TABLE ?auto_89769 ) ( ON ?auto_89764 ?auto_89763 ) ( ON ?auto_89765 ?auto_89764 ) ( ON ?auto_89766 ?auto_89765 ) ( CLEAR ?auto_89766 ) ( HOLDING ?auto_89767 ) ( CLEAR ?auto_89768 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89768 ?auto_89767 )
      ( MAKE-6PILE ?auto_89762 ?auto_89763 ?auto_89764 ?auto_89765 ?auto_89766 ?auto_89767 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89770 - BLOCK
      ?auto_89771 - BLOCK
      ?auto_89772 - BLOCK
      ?auto_89773 - BLOCK
      ?auto_89774 - BLOCK
      ?auto_89775 - BLOCK
    )
    :vars
    (
      ?auto_89777 - BLOCK
      ?auto_89776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89770 ?auto_89771 ) ) ( not ( = ?auto_89770 ?auto_89772 ) ) ( not ( = ?auto_89770 ?auto_89773 ) ) ( not ( = ?auto_89770 ?auto_89774 ) ) ( not ( = ?auto_89770 ?auto_89775 ) ) ( not ( = ?auto_89771 ?auto_89772 ) ) ( not ( = ?auto_89771 ?auto_89773 ) ) ( not ( = ?auto_89771 ?auto_89774 ) ) ( not ( = ?auto_89771 ?auto_89775 ) ) ( not ( = ?auto_89772 ?auto_89773 ) ) ( not ( = ?auto_89772 ?auto_89774 ) ) ( not ( = ?auto_89772 ?auto_89775 ) ) ( not ( = ?auto_89773 ?auto_89774 ) ) ( not ( = ?auto_89773 ?auto_89775 ) ) ( not ( = ?auto_89774 ?auto_89775 ) ) ( not ( = ?auto_89770 ?auto_89777 ) ) ( not ( = ?auto_89771 ?auto_89777 ) ) ( not ( = ?auto_89772 ?auto_89777 ) ) ( not ( = ?auto_89773 ?auto_89777 ) ) ( not ( = ?auto_89774 ?auto_89777 ) ) ( not ( = ?auto_89775 ?auto_89777 ) ) ( ON-TABLE ?auto_89777 ) ( ON ?auto_89770 ?auto_89776 ) ( not ( = ?auto_89770 ?auto_89776 ) ) ( not ( = ?auto_89771 ?auto_89776 ) ) ( not ( = ?auto_89772 ?auto_89776 ) ) ( not ( = ?auto_89773 ?auto_89776 ) ) ( not ( = ?auto_89774 ?auto_89776 ) ) ( not ( = ?auto_89775 ?auto_89776 ) ) ( not ( = ?auto_89777 ?auto_89776 ) ) ( ON ?auto_89771 ?auto_89770 ) ( ON-TABLE ?auto_89776 ) ( ON ?auto_89772 ?auto_89771 ) ( ON ?auto_89773 ?auto_89772 ) ( ON ?auto_89774 ?auto_89773 ) ( CLEAR ?auto_89777 ) ( ON ?auto_89775 ?auto_89774 ) ( CLEAR ?auto_89775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89776 ?auto_89770 ?auto_89771 ?auto_89772 ?auto_89773 ?auto_89774 )
      ( MAKE-6PILE ?auto_89770 ?auto_89771 ?auto_89772 ?auto_89773 ?auto_89774 ?auto_89775 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89778 - BLOCK
      ?auto_89779 - BLOCK
      ?auto_89780 - BLOCK
      ?auto_89781 - BLOCK
      ?auto_89782 - BLOCK
      ?auto_89783 - BLOCK
    )
    :vars
    (
      ?auto_89785 - BLOCK
      ?auto_89784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89778 ?auto_89779 ) ) ( not ( = ?auto_89778 ?auto_89780 ) ) ( not ( = ?auto_89778 ?auto_89781 ) ) ( not ( = ?auto_89778 ?auto_89782 ) ) ( not ( = ?auto_89778 ?auto_89783 ) ) ( not ( = ?auto_89779 ?auto_89780 ) ) ( not ( = ?auto_89779 ?auto_89781 ) ) ( not ( = ?auto_89779 ?auto_89782 ) ) ( not ( = ?auto_89779 ?auto_89783 ) ) ( not ( = ?auto_89780 ?auto_89781 ) ) ( not ( = ?auto_89780 ?auto_89782 ) ) ( not ( = ?auto_89780 ?auto_89783 ) ) ( not ( = ?auto_89781 ?auto_89782 ) ) ( not ( = ?auto_89781 ?auto_89783 ) ) ( not ( = ?auto_89782 ?auto_89783 ) ) ( not ( = ?auto_89778 ?auto_89785 ) ) ( not ( = ?auto_89779 ?auto_89785 ) ) ( not ( = ?auto_89780 ?auto_89785 ) ) ( not ( = ?auto_89781 ?auto_89785 ) ) ( not ( = ?auto_89782 ?auto_89785 ) ) ( not ( = ?auto_89783 ?auto_89785 ) ) ( ON ?auto_89778 ?auto_89784 ) ( not ( = ?auto_89778 ?auto_89784 ) ) ( not ( = ?auto_89779 ?auto_89784 ) ) ( not ( = ?auto_89780 ?auto_89784 ) ) ( not ( = ?auto_89781 ?auto_89784 ) ) ( not ( = ?auto_89782 ?auto_89784 ) ) ( not ( = ?auto_89783 ?auto_89784 ) ) ( not ( = ?auto_89785 ?auto_89784 ) ) ( ON ?auto_89779 ?auto_89778 ) ( ON-TABLE ?auto_89784 ) ( ON ?auto_89780 ?auto_89779 ) ( ON ?auto_89781 ?auto_89780 ) ( ON ?auto_89782 ?auto_89781 ) ( ON ?auto_89783 ?auto_89782 ) ( CLEAR ?auto_89783 ) ( HOLDING ?auto_89785 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89785 )
      ( MAKE-6PILE ?auto_89778 ?auto_89779 ?auto_89780 ?auto_89781 ?auto_89782 ?auto_89783 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_89786 - BLOCK
      ?auto_89787 - BLOCK
      ?auto_89788 - BLOCK
      ?auto_89789 - BLOCK
      ?auto_89790 - BLOCK
      ?auto_89791 - BLOCK
    )
    :vars
    (
      ?auto_89793 - BLOCK
      ?auto_89792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89786 ?auto_89787 ) ) ( not ( = ?auto_89786 ?auto_89788 ) ) ( not ( = ?auto_89786 ?auto_89789 ) ) ( not ( = ?auto_89786 ?auto_89790 ) ) ( not ( = ?auto_89786 ?auto_89791 ) ) ( not ( = ?auto_89787 ?auto_89788 ) ) ( not ( = ?auto_89787 ?auto_89789 ) ) ( not ( = ?auto_89787 ?auto_89790 ) ) ( not ( = ?auto_89787 ?auto_89791 ) ) ( not ( = ?auto_89788 ?auto_89789 ) ) ( not ( = ?auto_89788 ?auto_89790 ) ) ( not ( = ?auto_89788 ?auto_89791 ) ) ( not ( = ?auto_89789 ?auto_89790 ) ) ( not ( = ?auto_89789 ?auto_89791 ) ) ( not ( = ?auto_89790 ?auto_89791 ) ) ( not ( = ?auto_89786 ?auto_89793 ) ) ( not ( = ?auto_89787 ?auto_89793 ) ) ( not ( = ?auto_89788 ?auto_89793 ) ) ( not ( = ?auto_89789 ?auto_89793 ) ) ( not ( = ?auto_89790 ?auto_89793 ) ) ( not ( = ?auto_89791 ?auto_89793 ) ) ( ON ?auto_89786 ?auto_89792 ) ( not ( = ?auto_89786 ?auto_89792 ) ) ( not ( = ?auto_89787 ?auto_89792 ) ) ( not ( = ?auto_89788 ?auto_89792 ) ) ( not ( = ?auto_89789 ?auto_89792 ) ) ( not ( = ?auto_89790 ?auto_89792 ) ) ( not ( = ?auto_89791 ?auto_89792 ) ) ( not ( = ?auto_89793 ?auto_89792 ) ) ( ON ?auto_89787 ?auto_89786 ) ( ON-TABLE ?auto_89792 ) ( ON ?auto_89788 ?auto_89787 ) ( ON ?auto_89789 ?auto_89788 ) ( ON ?auto_89790 ?auto_89789 ) ( ON ?auto_89791 ?auto_89790 ) ( ON ?auto_89793 ?auto_89791 ) ( CLEAR ?auto_89793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89792 ?auto_89786 ?auto_89787 ?auto_89788 ?auto_89789 ?auto_89790 ?auto_89791 )
      ( MAKE-6PILE ?auto_89786 ?auto_89787 ?auto_89788 ?auto_89789 ?auto_89790 ?auto_89791 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89801 - BLOCK
      ?auto_89802 - BLOCK
      ?auto_89803 - BLOCK
      ?auto_89804 - BLOCK
      ?auto_89805 - BLOCK
      ?auto_89806 - BLOCK
      ?auto_89807 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_89807 ) ( CLEAR ?auto_89806 ) ( ON-TABLE ?auto_89801 ) ( ON ?auto_89802 ?auto_89801 ) ( ON ?auto_89803 ?auto_89802 ) ( ON ?auto_89804 ?auto_89803 ) ( ON ?auto_89805 ?auto_89804 ) ( ON ?auto_89806 ?auto_89805 ) ( not ( = ?auto_89801 ?auto_89802 ) ) ( not ( = ?auto_89801 ?auto_89803 ) ) ( not ( = ?auto_89801 ?auto_89804 ) ) ( not ( = ?auto_89801 ?auto_89805 ) ) ( not ( = ?auto_89801 ?auto_89806 ) ) ( not ( = ?auto_89801 ?auto_89807 ) ) ( not ( = ?auto_89802 ?auto_89803 ) ) ( not ( = ?auto_89802 ?auto_89804 ) ) ( not ( = ?auto_89802 ?auto_89805 ) ) ( not ( = ?auto_89802 ?auto_89806 ) ) ( not ( = ?auto_89802 ?auto_89807 ) ) ( not ( = ?auto_89803 ?auto_89804 ) ) ( not ( = ?auto_89803 ?auto_89805 ) ) ( not ( = ?auto_89803 ?auto_89806 ) ) ( not ( = ?auto_89803 ?auto_89807 ) ) ( not ( = ?auto_89804 ?auto_89805 ) ) ( not ( = ?auto_89804 ?auto_89806 ) ) ( not ( = ?auto_89804 ?auto_89807 ) ) ( not ( = ?auto_89805 ?auto_89806 ) ) ( not ( = ?auto_89805 ?auto_89807 ) ) ( not ( = ?auto_89806 ?auto_89807 ) ) )
    :subtasks
    ( ( !STACK ?auto_89807 ?auto_89806 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89808 - BLOCK
      ?auto_89809 - BLOCK
      ?auto_89810 - BLOCK
      ?auto_89811 - BLOCK
      ?auto_89812 - BLOCK
      ?auto_89813 - BLOCK
      ?auto_89814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_89813 ) ( ON-TABLE ?auto_89808 ) ( ON ?auto_89809 ?auto_89808 ) ( ON ?auto_89810 ?auto_89809 ) ( ON ?auto_89811 ?auto_89810 ) ( ON ?auto_89812 ?auto_89811 ) ( ON ?auto_89813 ?auto_89812 ) ( not ( = ?auto_89808 ?auto_89809 ) ) ( not ( = ?auto_89808 ?auto_89810 ) ) ( not ( = ?auto_89808 ?auto_89811 ) ) ( not ( = ?auto_89808 ?auto_89812 ) ) ( not ( = ?auto_89808 ?auto_89813 ) ) ( not ( = ?auto_89808 ?auto_89814 ) ) ( not ( = ?auto_89809 ?auto_89810 ) ) ( not ( = ?auto_89809 ?auto_89811 ) ) ( not ( = ?auto_89809 ?auto_89812 ) ) ( not ( = ?auto_89809 ?auto_89813 ) ) ( not ( = ?auto_89809 ?auto_89814 ) ) ( not ( = ?auto_89810 ?auto_89811 ) ) ( not ( = ?auto_89810 ?auto_89812 ) ) ( not ( = ?auto_89810 ?auto_89813 ) ) ( not ( = ?auto_89810 ?auto_89814 ) ) ( not ( = ?auto_89811 ?auto_89812 ) ) ( not ( = ?auto_89811 ?auto_89813 ) ) ( not ( = ?auto_89811 ?auto_89814 ) ) ( not ( = ?auto_89812 ?auto_89813 ) ) ( not ( = ?auto_89812 ?auto_89814 ) ) ( not ( = ?auto_89813 ?auto_89814 ) ) ( ON-TABLE ?auto_89814 ) ( CLEAR ?auto_89814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_89814 )
      ( MAKE-7PILE ?auto_89808 ?auto_89809 ?auto_89810 ?auto_89811 ?auto_89812 ?auto_89813 ?auto_89814 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89815 - BLOCK
      ?auto_89816 - BLOCK
      ?auto_89817 - BLOCK
      ?auto_89818 - BLOCK
      ?auto_89819 - BLOCK
      ?auto_89820 - BLOCK
      ?auto_89821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89815 ) ( ON ?auto_89816 ?auto_89815 ) ( ON ?auto_89817 ?auto_89816 ) ( ON ?auto_89818 ?auto_89817 ) ( ON ?auto_89819 ?auto_89818 ) ( not ( = ?auto_89815 ?auto_89816 ) ) ( not ( = ?auto_89815 ?auto_89817 ) ) ( not ( = ?auto_89815 ?auto_89818 ) ) ( not ( = ?auto_89815 ?auto_89819 ) ) ( not ( = ?auto_89815 ?auto_89820 ) ) ( not ( = ?auto_89815 ?auto_89821 ) ) ( not ( = ?auto_89816 ?auto_89817 ) ) ( not ( = ?auto_89816 ?auto_89818 ) ) ( not ( = ?auto_89816 ?auto_89819 ) ) ( not ( = ?auto_89816 ?auto_89820 ) ) ( not ( = ?auto_89816 ?auto_89821 ) ) ( not ( = ?auto_89817 ?auto_89818 ) ) ( not ( = ?auto_89817 ?auto_89819 ) ) ( not ( = ?auto_89817 ?auto_89820 ) ) ( not ( = ?auto_89817 ?auto_89821 ) ) ( not ( = ?auto_89818 ?auto_89819 ) ) ( not ( = ?auto_89818 ?auto_89820 ) ) ( not ( = ?auto_89818 ?auto_89821 ) ) ( not ( = ?auto_89819 ?auto_89820 ) ) ( not ( = ?auto_89819 ?auto_89821 ) ) ( not ( = ?auto_89820 ?auto_89821 ) ) ( ON-TABLE ?auto_89821 ) ( CLEAR ?auto_89821 ) ( HOLDING ?auto_89820 ) ( CLEAR ?auto_89819 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89815 ?auto_89816 ?auto_89817 ?auto_89818 ?auto_89819 ?auto_89820 )
      ( MAKE-7PILE ?auto_89815 ?auto_89816 ?auto_89817 ?auto_89818 ?auto_89819 ?auto_89820 ?auto_89821 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89822 - BLOCK
      ?auto_89823 - BLOCK
      ?auto_89824 - BLOCK
      ?auto_89825 - BLOCK
      ?auto_89826 - BLOCK
      ?auto_89827 - BLOCK
      ?auto_89828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89822 ) ( ON ?auto_89823 ?auto_89822 ) ( ON ?auto_89824 ?auto_89823 ) ( ON ?auto_89825 ?auto_89824 ) ( ON ?auto_89826 ?auto_89825 ) ( not ( = ?auto_89822 ?auto_89823 ) ) ( not ( = ?auto_89822 ?auto_89824 ) ) ( not ( = ?auto_89822 ?auto_89825 ) ) ( not ( = ?auto_89822 ?auto_89826 ) ) ( not ( = ?auto_89822 ?auto_89827 ) ) ( not ( = ?auto_89822 ?auto_89828 ) ) ( not ( = ?auto_89823 ?auto_89824 ) ) ( not ( = ?auto_89823 ?auto_89825 ) ) ( not ( = ?auto_89823 ?auto_89826 ) ) ( not ( = ?auto_89823 ?auto_89827 ) ) ( not ( = ?auto_89823 ?auto_89828 ) ) ( not ( = ?auto_89824 ?auto_89825 ) ) ( not ( = ?auto_89824 ?auto_89826 ) ) ( not ( = ?auto_89824 ?auto_89827 ) ) ( not ( = ?auto_89824 ?auto_89828 ) ) ( not ( = ?auto_89825 ?auto_89826 ) ) ( not ( = ?auto_89825 ?auto_89827 ) ) ( not ( = ?auto_89825 ?auto_89828 ) ) ( not ( = ?auto_89826 ?auto_89827 ) ) ( not ( = ?auto_89826 ?auto_89828 ) ) ( not ( = ?auto_89827 ?auto_89828 ) ) ( ON-TABLE ?auto_89828 ) ( CLEAR ?auto_89826 ) ( ON ?auto_89827 ?auto_89828 ) ( CLEAR ?auto_89827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89828 )
      ( MAKE-7PILE ?auto_89822 ?auto_89823 ?auto_89824 ?auto_89825 ?auto_89826 ?auto_89827 ?auto_89828 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89829 - BLOCK
      ?auto_89830 - BLOCK
      ?auto_89831 - BLOCK
      ?auto_89832 - BLOCK
      ?auto_89833 - BLOCK
      ?auto_89834 - BLOCK
      ?auto_89835 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89829 ) ( ON ?auto_89830 ?auto_89829 ) ( ON ?auto_89831 ?auto_89830 ) ( ON ?auto_89832 ?auto_89831 ) ( not ( = ?auto_89829 ?auto_89830 ) ) ( not ( = ?auto_89829 ?auto_89831 ) ) ( not ( = ?auto_89829 ?auto_89832 ) ) ( not ( = ?auto_89829 ?auto_89833 ) ) ( not ( = ?auto_89829 ?auto_89834 ) ) ( not ( = ?auto_89829 ?auto_89835 ) ) ( not ( = ?auto_89830 ?auto_89831 ) ) ( not ( = ?auto_89830 ?auto_89832 ) ) ( not ( = ?auto_89830 ?auto_89833 ) ) ( not ( = ?auto_89830 ?auto_89834 ) ) ( not ( = ?auto_89830 ?auto_89835 ) ) ( not ( = ?auto_89831 ?auto_89832 ) ) ( not ( = ?auto_89831 ?auto_89833 ) ) ( not ( = ?auto_89831 ?auto_89834 ) ) ( not ( = ?auto_89831 ?auto_89835 ) ) ( not ( = ?auto_89832 ?auto_89833 ) ) ( not ( = ?auto_89832 ?auto_89834 ) ) ( not ( = ?auto_89832 ?auto_89835 ) ) ( not ( = ?auto_89833 ?auto_89834 ) ) ( not ( = ?auto_89833 ?auto_89835 ) ) ( not ( = ?auto_89834 ?auto_89835 ) ) ( ON-TABLE ?auto_89835 ) ( ON ?auto_89834 ?auto_89835 ) ( CLEAR ?auto_89834 ) ( HOLDING ?auto_89833 ) ( CLEAR ?auto_89832 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89829 ?auto_89830 ?auto_89831 ?auto_89832 ?auto_89833 )
      ( MAKE-7PILE ?auto_89829 ?auto_89830 ?auto_89831 ?auto_89832 ?auto_89833 ?auto_89834 ?auto_89835 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89836 - BLOCK
      ?auto_89837 - BLOCK
      ?auto_89838 - BLOCK
      ?auto_89839 - BLOCK
      ?auto_89840 - BLOCK
      ?auto_89841 - BLOCK
      ?auto_89842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89836 ) ( ON ?auto_89837 ?auto_89836 ) ( ON ?auto_89838 ?auto_89837 ) ( ON ?auto_89839 ?auto_89838 ) ( not ( = ?auto_89836 ?auto_89837 ) ) ( not ( = ?auto_89836 ?auto_89838 ) ) ( not ( = ?auto_89836 ?auto_89839 ) ) ( not ( = ?auto_89836 ?auto_89840 ) ) ( not ( = ?auto_89836 ?auto_89841 ) ) ( not ( = ?auto_89836 ?auto_89842 ) ) ( not ( = ?auto_89837 ?auto_89838 ) ) ( not ( = ?auto_89837 ?auto_89839 ) ) ( not ( = ?auto_89837 ?auto_89840 ) ) ( not ( = ?auto_89837 ?auto_89841 ) ) ( not ( = ?auto_89837 ?auto_89842 ) ) ( not ( = ?auto_89838 ?auto_89839 ) ) ( not ( = ?auto_89838 ?auto_89840 ) ) ( not ( = ?auto_89838 ?auto_89841 ) ) ( not ( = ?auto_89838 ?auto_89842 ) ) ( not ( = ?auto_89839 ?auto_89840 ) ) ( not ( = ?auto_89839 ?auto_89841 ) ) ( not ( = ?auto_89839 ?auto_89842 ) ) ( not ( = ?auto_89840 ?auto_89841 ) ) ( not ( = ?auto_89840 ?auto_89842 ) ) ( not ( = ?auto_89841 ?auto_89842 ) ) ( ON-TABLE ?auto_89842 ) ( ON ?auto_89841 ?auto_89842 ) ( CLEAR ?auto_89839 ) ( ON ?auto_89840 ?auto_89841 ) ( CLEAR ?auto_89840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89842 ?auto_89841 )
      ( MAKE-7PILE ?auto_89836 ?auto_89837 ?auto_89838 ?auto_89839 ?auto_89840 ?auto_89841 ?auto_89842 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89843 - BLOCK
      ?auto_89844 - BLOCK
      ?auto_89845 - BLOCK
      ?auto_89846 - BLOCK
      ?auto_89847 - BLOCK
      ?auto_89848 - BLOCK
      ?auto_89849 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89843 ) ( ON ?auto_89844 ?auto_89843 ) ( ON ?auto_89845 ?auto_89844 ) ( not ( = ?auto_89843 ?auto_89844 ) ) ( not ( = ?auto_89843 ?auto_89845 ) ) ( not ( = ?auto_89843 ?auto_89846 ) ) ( not ( = ?auto_89843 ?auto_89847 ) ) ( not ( = ?auto_89843 ?auto_89848 ) ) ( not ( = ?auto_89843 ?auto_89849 ) ) ( not ( = ?auto_89844 ?auto_89845 ) ) ( not ( = ?auto_89844 ?auto_89846 ) ) ( not ( = ?auto_89844 ?auto_89847 ) ) ( not ( = ?auto_89844 ?auto_89848 ) ) ( not ( = ?auto_89844 ?auto_89849 ) ) ( not ( = ?auto_89845 ?auto_89846 ) ) ( not ( = ?auto_89845 ?auto_89847 ) ) ( not ( = ?auto_89845 ?auto_89848 ) ) ( not ( = ?auto_89845 ?auto_89849 ) ) ( not ( = ?auto_89846 ?auto_89847 ) ) ( not ( = ?auto_89846 ?auto_89848 ) ) ( not ( = ?auto_89846 ?auto_89849 ) ) ( not ( = ?auto_89847 ?auto_89848 ) ) ( not ( = ?auto_89847 ?auto_89849 ) ) ( not ( = ?auto_89848 ?auto_89849 ) ) ( ON-TABLE ?auto_89849 ) ( ON ?auto_89848 ?auto_89849 ) ( ON ?auto_89847 ?auto_89848 ) ( CLEAR ?auto_89847 ) ( HOLDING ?auto_89846 ) ( CLEAR ?auto_89845 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89843 ?auto_89844 ?auto_89845 ?auto_89846 )
      ( MAKE-7PILE ?auto_89843 ?auto_89844 ?auto_89845 ?auto_89846 ?auto_89847 ?auto_89848 ?auto_89849 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89850 - BLOCK
      ?auto_89851 - BLOCK
      ?auto_89852 - BLOCK
      ?auto_89853 - BLOCK
      ?auto_89854 - BLOCK
      ?auto_89855 - BLOCK
      ?auto_89856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89850 ) ( ON ?auto_89851 ?auto_89850 ) ( ON ?auto_89852 ?auto_89851 ) ( not ( = ?auto_89850 ?auto_89851 ) ) ( not ( = ?auto_89850 ?auto_89852 ) ) ( not ( = ?auto_89850 ?auto_89853 ) ) ( not ( = ?auto_89850 ?auto_89854 ) ) ( not ( = ?auto_89850 ?auto_89855 ) ) ( not ( = ?auto_89850 ?auto_89856 ) ) ( not ( = ?auto_89851 ?auto_89852 ) ) ( not ( = ?auto_89851 ?auto_89853 ) ) ( not ( = ?auto_89851 ?auto_89854 ) ) ( not ( = ?auto_89851 ?auto_89855 ) ) ( not ( = ?auto_89851 ?auto_89856 ) ) ( not ( = ?auto_89852 ?auto_89853 ) ) ( not ( = ?auto_89852 ?auto_89854 ) ) ( not ( = ?auto_89852 ?auto_89855 ) ) ( not ( = ?auto_89852 ?auto_89856 ) ) ( not ( = ?auto_89853 ?auto_89854 ) ) ( not ( = ?auto_89853 ?auto_89855 ) ) ( not ( = ?auto_89853 ?auto_89856 ) ) ( not ( = ?auto_89854 ?auto_89855 ) ) ( not ( = ?auto_89854 ?auto_89856 ) ) ( not ( = ?auto_89855 ?auto_89856 ) ) ( ON-TABLE ?auto_89856 ) ( ON ?auto_89855 ?auto_89856 ) ( ON ?auto_89854 ?auto_89855 ) ( CLEAR ?auto_89852 ) ( ON ?auto_89853 ?auto_89854 ) ( CLEAR ?auto_89853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89856 ?auto_89855 ?auto_89854 )
      ( MAKE-7PILE ?auto_89850 ?auto_89851 ?auto_89852 ?auto_89853 ?auto_89854 ?auto_89855 ?auto_89856 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89857 - BLOCK
      ?auto_89858 - BLOCK
      ?auto_89859 - BLOCK
      ?auto_89860 - BLOCK
      ?auto_89861 - BLOCK
      ?auto_89862 - BLOCK
      ?auto_89863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89857 ) ( ON ?auto_89858 ?auto_89857 ) ( not ( = ?auto_89857 ?auto_89858 ) ) ( not ( = ?auto_89857 ?auto_89859 ) ) ( not ( = ?auto_89857 ?auto_89860 ) ) ( not ( = ?auto_89857 ?auto_89861 ) ) ( not ( = ?auto_89857 ?auto_89862 ) ) ( not ( = ?auto_89857 ?auto_89863 ) ) ( not ( = ?auto_89858 ?auto_89859 ) ) ( not ( = ?auto_89858 ?auto_89860 ) ) ( not ( = ?auto_89858 ?auto_89861 ) ) ( not ( = ?auto_89858 ?auto_89862 ) ) ( not ( = ?auto_89858 ?auto_89863 ) ) ( not ( = ?auto_89859 ?auto_89860 ) ) ( not ( = ?auto_89859 ?auto_89861 ) ) ( not ( = ?auto_89859 ?auto_89862 ) ) ( not ( = ?auto_89859 ?auto_89863 ) ) ( not ( = ?auto_89860 ?auto_89861 ) ) ( not ( = ?auto_89860 ?auto_89862 ) ) ( not ( = ?auto_89860 ?auto_89863 ) ) ( not ( = ?auto_89861 ?auto_89862 ) ) ( not ( = ?auto_89861 ?auto_89863 ) ) ( not ( = ?auto_89862 ?auto_89863 ) ) ( ON-TABLE ?auto_89863 ) ( ON ?auto_89862 ?auto_89863 ) ( ON ?auto_89861 ?auto_89862 ) ( ON ?auto_89860 ?auto_89861 ) ( CLEAR ?auto_89860 ) ( HOLDING ?auto_89859 ) ( CLEAR ?auto_89858 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89857 ?auto_89858 ?auto_89859 )
      ( MAKE-7PILE ?auto_89857 ?auto_89858 ?auto_89859 ?auto_89860 ?auto_89861 ?auto_89862 ?auto_89863 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89864 - BLOCK
      ?auto_89865 - BLOCK
      ?auto_89866 - BLOCK
      ?auto_89867 - BLOCK
      ?auto_89868 - BLOCK
      ?auto_89869 - BLOCK
      ?auto_89870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89864 ) ( ON ?auto_89865 ?auto_89864 ) ( not ( = ?auto_89864 ?auto_89865 ) ) ( not ( = ?auto_89864 ?auto_89866 ) ) ( not ( = ?auto_89864 ?auto_89867 ) ) ( not ( = ?auto_89864 ?auto_89868 ) ) ( not ( = ?auto_89864 ?auto_89869 ) ) ( not ( = ?auto_89864 ?auto_89870 ) ) ( not ( = ?auto_89865 ?auto_89866 ) ) ( not ( = ?auto_89865 ?auto_89867 ) ) ( not ( = ?auto_89865 ?auto_89868 ) ) ( not ( = ?auto_89865 ?auto_89869 ) ) ( not ( = ?auto_89865 ?auto_89870 ) ) ( not ( = ?auto_89866 ?auto_89867 ) ) ( not ( = ?auto_89866 ?auto_89868 ) ) ( not ( = ?auto_89866 ?auto_89869 ) ) ( not ( = ?auto_89866 ?auto_89870 ) ) ( not ( = ?auto_89867 ?auto_89868 ) ) ( not ( = ?auto_89867 ?auto_89869 ) ) ( not ( = ?auto_89867 ?auto_89870 ) ) ( not ( = ?auto_89868 ?auto_89869 ) ) ( not ( = ?auto_89868 ?auto_89870 ) ) ( not ( = ?auto_89869 ?auto_89870 ) ) ( ON-TABLE ?auto_89870 ) ( ON ?auto_89869 ?auto_89870 ) ( ON ?auto_89868 ?auto_89869 ) ( ON ?auto_89867 ?auto_89868 ) ( CLEAR ?auto_89865 ) ( ON ?auto_89866 ?auto_89867 ) ( CLEAR ?auto_89866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89870 ?auto_89869 ?auto_89868 ?auto_89867 )
      ( MAKE-7PILE ?auto_89864 ?auto_89865 ?auto_89866 ?auto_89867 ?auto_89868 ?auto_89869 ?auto_89870 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89871 - BLOCK
      ?auto_89872 - BLOCK
      ?auto_89873 - BLOCK
      ?auto_89874 - BLOCK
      ?auto_89875 - BLOCK
      ?auto_89876 - BLOCK
      ?auto_89877 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89871 ) ( not ( = ?auto_89871 ?auto_89872 ) ) ( not ( = ?auto_89871 ?auto_89873 ) ) ( not ( = ?auto_89871 ?auto_89874 ) ) ( not ( = ?auto_89871 ?auto_89875 ) ) ( not ( = ?auto_89871 ?auto_89876 ) ) ( not ( = ?auto_89871 ?auto_89877 ) ) ( not ( = ?auto_89872 ?auto_89873 ) ) ( not ( = ?auto_89872 ?auto_89874 ) ) ( not ( = ?auto_89872 ?auto_89875 ) ) ( not ( = ?auto_89872 ?auto_89876 ) ) ( not ( = ?auto_89872 ?auto_89877 ) ) ( not ( = ?auto_89873 ?auto_89874 ) ) ( not ( = ?auto_89873 ?auto_89875 ) ) ( not ( = ?auto_89873 ?auto_89876 ) ) ( not ( = ?auto_89873 ?auto_89877 ) ) ( not ( = ?auto_89874 ?auto_89875 ) ) ( not ( = ?auto_89874 ?auto_89876 ) ) ( not ( = ?auto_89874 ?auto_89877 ) ) ( not ( = ?auto_89875 ?auto_89876 ) ) ( not ( = ?auto_89875 ?auto_89877 ) ) ( not ( = ?auto_89876 ?auto_89877 ) ) ( ON-TABLE ?auto_89877 ) ( ON ?auto_89876 ?auto_89877 ) ( ON ?auto_89875 ?auto_89876 ) ( ON ?auto_89874 ?auto_89875 ) ( ON ?auto_89873 ?auto_89874 ) ( CLEAR ?auto_89873 ) ( HOLDING ?auto_89872 ) ( CLEAR ?auto_89871 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89871 ?auto_89872 )
      ( MAKE-7PILE ?auto_89871 ?auto_89872 ?auto_89873 ?auto_89874 ?auto_89875 ?auto_89876 ?auto_89877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89878 - BLOCK
      ?auto_89879 - BLOCK
      ?auto_89880 - BLOCK
      ?auto_89881 - BLOCK
      ?auto_89882 - BLOCK
      ?auto_89883 - BLOCK
      ?auto_89884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89878 ) ( not ( = ?auto_89878 ?auto_89879 ) ) ( not ( = ?auto_89878 ?auto_89880 ) ) ( not ( = ?auto_89878 ?auto_89881 ) ) ( not ( = ?auto_89878 ?auto_89882 ) ) ( not ( = ?auto_89878 ?auto_89883 ) ) ( not ( = ?auto_89878 ?auto_89884 ) ) ( not ( = ?auto_89879 ?auto_89880 ) ) ( not ( = ?auto_89879 ?auto_89881 ) ) ( not ( = ?auto_89879 ?auto_89882 ) ) ( not ( = ?auto_89879 ?auto_89883 ) ) ( not ( = ?auto_89879 ?auto_89884 ) ) ( not ( = ?auto_89880 ?auto_89881 ) ) ( not ( = ?auto_89880 ?auto_89882 ) ) ( not ( = ?auto_89880 ?auto_89883 ) ) ( not ( = ?auto_89880 ?auto_89884 ) ) ( not ( = ?auto_89881 ?auto_89882 ) ) ( not ( = ?auto_89881 ?auto_89883 ) ) ( not ( = ?auto_89881 ?auto_89884 ) ) ( not ( = ?auto_89882 ?auto_89883 ) ) ( not ( = ?auto_89882 ?auto_89884 ) ) ( not ( = ?auto_89883 ?auto_89884 ) ) ( ON-TABLE ?auto_89884 ) ( ON ?auto_89883 ?auto_89884 ) ( ON ?auto_89882 ?auto_89883 ) ( ON ?auto_89881 ?auto_89882 ) ( ON ?auto_89880 ?auto_89881 ) ( CLEAR ?auto_89878 ) ( ON ?auto_89879 ?auto_89880 ) ( CLEAR ?auto_89879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89884 ?auto_89883 ?auto_89882 ?auto_89881 ?auto_89880 )
      ( MAKE-7PILE ?auto_89878 ?auto_89879 ?auto_89880 ?auto_89881 ?auto_89882 ?auto_89883 ?auto_89884 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89885 - BLOCK
      ?auto_89886 - BLOCK
      ?auto_89887 - BLOCK
      ?auto_89888 - BLOCK
      ?auto_89889 - BLOCK
      ?auto_89890 - BLOCK
      ?auto_89891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89885 ?auto_89886 ) ) ( not ( = ?auto_89885 ?auto_89887 ) ) ( not ( = ?auto_89885 ?auto_89888 ) ) ( not ( = ?auto_89885 ?auto_89889 ) ) ( not ( = ?auto_89885 ?auto_89890 ) ) ( not ( = ?auto_89885 ?auto_89891 ) ) ( not ( = ?auto_89886 ?auto_89887 ) ) ( not ( = ?auto_89886 ?auto_89888 ) ) ( not ( = ?auto_89886 ?auto_89889 ) ) ( not ( = ?auto_89886 ?auto_89890 ) ) ( not ( = ?auto_89886 ?auto_89891 ) ) ( not ( = ?auto_89887 ?auto_89888 ) ) ( not ( = ?auto_89887 ?auto_89889 ) ) ( not ( = ?auto_89887 ?auto_89890 ) ) ( not ( = ?auto_89887 ?auto_89891 ) ) ( not ( = ?auto_89888 ?auto_89889 ) ) ( not ( = ?auto_89888 ?auto_89890 ) ) ( not ( = ?auto_89888 ?auto_89891 ) ) ( not ( = ?auto_89889 ?auto_89890 ) ) ( not ( = ?auto_89889 ?auto_89891 ) ) ( not ( = ?auto_89890 ?auto_89891 ) ) ( ON-TABLE ?auto_89891 ) ( ON ?auto_89890 ?auto_89891 ) ( ON ?auto_89889 ?auto_89890 ) ( ON ?auto_89888 ?auto_89889 ) ( ON ?auto_89887 ?auto_89888 ) ( ON ?auto_89886 ?auto_89887 ) ( CLEAR ?auto_89886 ) ( HOLDING ?auto_89885 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89885 )
      ( MAKE-7PILE ?auto_89885 ?auto_89886 ?auto_89887 ?auto_89888 ?auto_89889 ?auto_89890 ?auto_89891 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89892 - BLOCK
      ?auto_89893 - BLOCK
      ?auto_89894 - BLOCK
      ?auto_89895 - BLOCK
      ?auto_89896 - BLOCK
      ?auto_89897 - BLOCK
      ?auto_89898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89892 ?auto_89893 ) ) ( not ( = ?auto_89892 ?auto_89894 ) ) ( not ( = ?auto_89892 ?auto_89895 ) ) ( not ( = ?auto_89892 ?auto_89896 ) ) ( not ( = ?auto_89892 ?auto_89897 ) ) ( not ( = ?auto_89892 ?auto_89898 ) ) ( not ( = ?auto_89893 ?auto_89894 ) ) ( not ( = ?auto_89893 ?auto_89895 ) ) ( not ( = ?auto_89893 ?auto_89896 ) ) ( not ( = ?auto_89893 ?auto_89897 ) ) ( not ( = ?auto_89893 ?auto_89898 ) ) ( not ( = ?auto_89894 ?auto_89895 ) ) ( not ( = ?auto_89894 ?auto_89896 ) ) ( not ( = ?auto_89894 ?auto_89897 ) ) ( not ( = ?auto_89894 ?auto_89898 ) ) ( not ( = ?auto_89895 ?auto_89896 ) ) ( not ( = ?auto_89895 ?auto_89897 ) ) ( not ( = ?auto_89895 ?auto_89898 ) ) ( not ( = ?auto_89896 ?auto_89897 ) ) ( not ( = ?auto_89896 ?auto_89898 ) ) ( not ( = ?auto_89897 ?auto_89898 ) ) ( ON-TABLE ?auto_89898 ) ( ON ?auto_89897 ?auto_89898 ) ( ON ?auto_89896 ?auto_89897 ) ( ON ?auto_89895 ?auto_89896 ) ( ON ?auto_89894 ?auto_89895 ) ( ON ?auto_89893 ?auto_89894 ) ( ON ?auto_89892 ?auto_89893 ) ( CLEAR ?auto_89892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89898 ?auto_89897 ?auto_89896 ?auto_89895 ?auto_89894 ?auto_89893 )
      ( MAKE-7PILE ?auto_89892 ?auto_89893 ?auto_89894 ?auto_89895 ?auto_89896 ?auto_89897 ?auto_89898 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89899 - BLOCK
      ?auto_89900 - BLOCK
      ?auto_89901 - BLOCK
      ?auto_89902 - BLOCK
      ?auto_89903 - BLOCK
      ?auto_89904 - BLOCK
      ?auto_89905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89899 ?auto_89900 ) ) ( not ( = ?auto_89899 ?auto_89901 ) ) ( not ( = ?auto_89899 ?auto_89902 ) ) ( not ( = ?auto_89899 ?auto_89903 ) ) ( not ( = ?auto_89899 ?auto_89904 ) ) ( not ( = ?auto_89899 ?auto_89905 ) ) ( not ( = ?auto_89900 ?auto_89901 ) ) ( not ( = ?auto_89900 ?auto_89902 ) ) ( not ( = ?auto_89900 ?auto_89903 ) ) ( not ( = ?auto_89900 ?auto_89904 ) ) ( not ( = ?auto_89900 ?auto_89905 ) ) ( not ( = ?auto_89901 ?auto_89902 ) ) ( not ( = ?auto_89901 ?auto_89903 ) ) ( not ( = ?auto_89901 ?auto_89904 ) ) ( not ( = ?auto_89901 ?auto_89905 ) ) ( not ( = ?auto_89902 ?auto_89903 ) ) ( not ( = ?auto_89902 ?auto_89904 ) ) ( not ( = ?auto_89902 ?auto_89905 ) ) ( not ( = ?auto_89903 ?auto_89904 ) ) ( not ( = ?auto_89903 ?auto_89905 ) ) ( not ( = ?auto_89904 ?auto_89905 ) ) ( ON-TABLE ?auto_89905 ) ( ON ?auto_89904 ?auto_89905 ) ( ON ?auto_89903 ?auto_89904 ) ( ON ?auto_89902 ?auto_89903 ) ( ON ?auto_89901 ?auto_89902 ) ( ON ?auto_89900 ?auto_89901 ) ( HOLDING ?auto_89899 ) ( CLEAR ?auto_89900 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89905 ?auto_89904 ?auto_89903 ?auto_89902 ?auto_89901 ?auto_89900 ?auto_89899 )
      ( MAKE-7PILE ?auto_89899 ?auto_89900 ?auto_89901 ?auto_89902 ?auto_89903 ?auto_89904 ?auto_89905 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89906 - BLOCK
      ?auto_89907 - BLOCK
      ?auto_89908 - BLOCK
      ?auto_89909 - BLOCK
      ?auto_89910 - BLOCK
      ?auto_89911 - BLOCK
      ?auto_89912 - BLOCK
    )
    :vars
    (
      ?auto_89913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89906 ?auto_89907 ) ) ( not ( = ?auto_89906 ?auto_89908 ) ) ( not ( = ?auto_89906 ?auto_89909 ) ) ( not ( = ?auto_89906 ?auto_89910 ) ) ( not ( = ?auto_89906 ?auto_89911 ) ) ( not ( = ?auto_89906 ?auto_89912 ) ) ( not ( = ?auto_89907 ?auto_89908 ) ) ( not ( = ?auto_89907 ?auto_89909 ) ) ( not ( = ?auto_89907 ?auto_89910 ) ) ( not ( = ?auto_89907 ?auto_89911 ) ) ( not ( = ?auto_89907 ?auto_89912 ) ) ( not ( = ?auto_89908 ?auto_89909 ) ) ( not ( = ?auto_89908 ?auto_89910 ) ) ( not ( = ?auto_89908 ?auto_89911 ) ) ( not ( = ?auto_89908 ?auto_89912 ) ) ( not ( = ?auto_89909 ?auto_89910 ) ) ( not ( = ?auto_89909 ?auto_89911 ) ) ( not ( = ?auto_89909 ?auto_89912 ) ) ( not ( = ?auto_89910 ?auto_89911 ) ) ( not ( = ?auto_89910 ?auto_89912 ) ) ( not ( = ?auto_89911 ?auto_89912 ) ) ( ON-TABLE ?auto_89912 ) ( ON ?auto_89911 ?auto_89912 ) ( ON ?auto_89910 ?auto_89911 ) ( ON ?auto_89909 ?auto_89910 ) ( ON ?auto_89908 ?auto_89909 ) ( ON ?auto_89907 ?auto_89908 ) ( CLEAR ?auto_89907 ) ( ON ?auto_89906 ?auto_89913 ) ( CLEAR ?auto_89906 ) ( HAND-EMPTY ) ( not ( = ?auto_89906 ?auto_89913 ) ) ( not ( = ?auto_89907 ?auto_89913 ) ) ( not ( = ?auto_89908 ?auto_89913 ) ) ( not ( = ?auto_89909 ?auto_89913 ) ) ( not ( = ?auto_89910 ?auto_89913 ) ) ( not ( = ?auto_89911 ?auto_89913 ) ) ( not ( = ?auto_89912 ?auto_89913 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89906 ?auto_89913 )
      ( MAKE-7PILE ?auto_89906 ?auto_89907 ?auto_89908 ?auto_89909 ?auto_89910 ?auto_89911 ?auto_89912 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89914 - BLOCK
      ?auto_89915 - BLOCK
      ?auto_89916 - BLOCK
      ?auto_89917 - BLOCK
      ?auto_89918 - BLOCK
      ?auto_89919 - BLOCK
      ?auto_89920 - BLOCK
    )
    :vars
    (
      ?auto_89921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89914 ?auto_89915 ) ) ( not ( = ?auto_89914 ?auto_89916 ) ) ( not ( = ?auto_89914 ?auto_89917 ) ) ( not ( = ?auto_89914 ?auto_89918 ) ) ( not ( = ?auto_89914 ?auto_89919 ) ) ( not ( = ?auto_89914 ?auto_89920 ) ) ( not ( = ?auto_89915 ?auto_89916 ) ) ( not ( = ?auto_89915 ?auto_89917 ) ) ( not ( = ?auto_89915 ?auto_89918 ) ) ( not ( = ?auto_89915 ?auto_89919 ) ) ( not ( = ?auto_89915 ?auto_89920 ) ) ( not ( = ?auto_89916 ?auto_89917 ) ) ( not ( = ?auto_89916 ?auto_89918 ) ) ( not ( = ?auto_89916 ?auto_89919 ) ) ( not ( = ?auto_89916 ?auto_89920 ) ) ( not ( = ?auto_89917 ?auto_89918 ) ) ( not ( = ?auto_89917 ?auto_89919 ) ) ( not ( = ?auto_89917 ?auto_89920 ) ) ( not ( = ?auto_89918 ?auto_89919 ) ) ( not ( = ?auto_89918 ?auto_89920 ) ) ( not ( = ?auto_89919 ?auto_89920 ) ) ( ON-TABLE ?auto_89920 ) ( ON ?auto_89919 ?auto_89920 ) ( ON ?auto_89918 ?auto_89919 ) ( ON ?auto_89917 ?auto_89918 ) ( ON ?auto_89916 ?auto_89917 ) ( ON ?auto_89914 ?auto_89921 ) ( CLEAR ?auto_89914 ) ( not ( = ?auto_89914 ?auto_89921 ) ) ( not ( = ?auto_89915 ?auto_89921 ) ) ( not ( = ?auto_89916 ?auto_89921 ) ) ( not ( = ?auto_89917 ?auto_89921 ) ) ( not ( = ?auto_89918 ?auto_89921 ) ) ( not ( = ?auto_89919 ?auto_89921 ) ) ( not ( = ?auto_89920 ?auto_89921 ) ) ( HOLDING ?auto_89915 ) ( CLEAR ?auto_89916 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89920 ?auto_89919 ?auto_89918 ?auto_89917 ?auto_89916 ?auto_89915 )
      ( MAKE-7PILE ?auto_89914 ?auto_89915 ?auto_89916 ?auto_89917 ?auto_89918 ?auto_89919 ?auto_89920 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89922 - BLOCK
      ?auto_89923 - BLOCK
      ?auto_89924 - BLOCK
      ?auto_89925 - BLOCK
      ?auto_89926 - BLOCK
      ?auto_89927 - BLOCK
      ?auto_89928 - BLOCK
    )
    :vars
    (
      ?auto_89929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89922 ?auto_89923 ) ) ( not ( = ?auto_89922 ?auto_89924 ) ) ( not ( = ?auto_89922 ?auto_89925 ) ) ( not ( = ?auto_89922 ?auto_89926 ) ) ( not ( = ?auto_89922 ?auto_89927 ) ) ( not ( = ?auto_89922 ?auto_89928 ) ) ( not ( = ?auto_89923 ?auto_89924 ) ) ( not ( = ?auto_89923 ?auto_89925 ) ) ( not ( = ?auto_89923 ?auto_89926 ) ) ( not ( = ?auto_89923 ?auto_89927 ) ) ( not ( = ?auto_89923 ?auto_89928 ) ) ( not ( = ?auto_89924 ?auto_89925 ) ) ( not ( = ?auto_89924 ?auto_89926 ) ) ( not ( = ?auto_89924 ?auto_89927 ) ) ( not ( = ?auto_89924 ?auto_89928 ) ) ( not ( = ?auto_89925 ?auto_89926 ) ) ( not ( = ?auto_89925 ?auto_89927 ) ) ( not ( = ?auto_89925 ?auto_89928 ) ) ( not ( = ?auto_89926 ?auto_89927 ) ) ( not ( = ?auto_89926 ?auto_89928 ) ) ( not ( = ?auto_89927 ?auto_89928 ) ) ( ON-TABLE ?auto_89928 ) ( ON ?auto_89927 ?auto_89928 ) ( ON ?auto_89926 ?auto_89927 ) ( ON ?auto_89925 ?auto_89926 ) ( ON ?auto_89924 ?auto_89925 ) ( ON ?auto_89922 ?auto_89929 ) ( not ( = ?auto_89922 ?auto_89929 ) ) ( not ( = ?auto_89923 ?auto_89929 ) ) ( not ( = ?auto_89924 ?auto_89929 ) ) ( not ( = ?auto_89925 ?auto_89929 ) ) ( not ( = ?auto_89926 ?auto_89929 ) ) ( not ( = ?auto_89927 ?auto_89929 ) ) ( not ( = ?auto_89928 ?auto_89929 ) ) ( CLEAR ?auto_89924 ) ( ON ?auto_89923 ?auto_89922 ) ( CLEAR ?auto_89923 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89929 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89929 ?auto_89922 )
      ( MAKE-7PILE ?auto_89922 ?auto_89923 ?auto_89924 ?auto_89925 ?auto_89926 ?auto_89927 ?auto_89928 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89930 - BLOCK
      ?auto_89931 - BLOCK
      ?auto_89932 - BLOCK
      ?auto_89933 - BLOCK
      ?auto_89934 - BLOCK
      ?auto_89935 - BLOCK
      ?auto_89936 - BLOCK
    )
    :vars
    (
      ?auto_89937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89930 ?auto_89931 ) ) ( not ( = ?auto_89930 ?auto_89932 ) ) ( not ( = ?auto_89930 ?auto_89933 ) ) ( not ( = ?auto_89930 ?auto_89934 ) ) ( not ( = ?auto_89930 ?auto_89935 ) ) ( not ( = ?auto_89930 ?auto_89936 ) ) ( not ( = ?auto_89931 ?auto_89932 ) ) ( not ( = ?auto_89931 ?auto_89933 ) ) ( not ( = ?auto_89931 ?auto_89934 ) ) ( not ( = ?auto_89931 ?auto_89935 ) ) ( not ( = ?auto_89931 ?auto_89936 ) ) ( not ( = ?auto_89932 ?auto_89933 ) ) ( not ( = ?auto_89932 ?auto_89934 ) ) ( not ( = ?auto_89932 ?auto_89935 ) ) ( not ( = ?auto_89932 ?auto_89936 ) ) ( not ( = ?auto_89933 ?auto_89934 ) ) ( not ( = ?auto_89933 ?auto_89935 ) ) ( not ( = ?auto_89933 ?auto_89936 ) ) ( not ( = ?auto_89934 ?auto_89935 ) ) ( not ( = ?auto_89934 ?auto_89936 ) ) ( not ( = ?auto_89935 ?auto_89936 ) ) ( ON-TABLE ?auto_89936 ) ( ON ?auto_89935 ?auto_89936 ) ( ON ?auto_89934 ?auto_89935 ) ( ON ?auto_89933 ?auto_89934 ) ( ON ?auto_89930 ?auto_89937 ) ( not ( = ?auto_89930 ?auto_89937 ) ) ( not ( = ?auto_89931 ?auto_89937 ) ) ( not ( = ?auto_89932 ?auto_89937 ) ) ( not ( = ?auto_89933 ?auto_89937 ) ) ( not ( = ?auto_89934 ?auto_89937 ) ) ( not ( = ?auto_89935 ?auto_89937 ) ) ( not ( = ?auto_89936 ?auto_89937 ) ) ( ON ?auto_89931 ?auto_89930 ) ( CLEAR ?auto_89931 ) ( ON-TABLE ?auto_89937 ) ( HOLDING ?auto_89932 ) ( CLEAR ?auto_89933 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89936 ?auto_89935 ?auto_89934 ?auto_89933 ?auto_89932 )
      ( MAKE-7PILE ?auto_89930 ?auto_89931 ?auto_89932 ?auto_89933 ?auto_89934 ?auto_89935 ?auto_89936 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89938 - BLOCK
      ?auto_89939 - BLOCK
      ?auto_89940 - BLOCK
      ?auto_89941 - BLOCK
      ?auto_89942 - BLOCK
      ?auto_89943 - BLOCK
      ?auto_89944 - BLOCK
    )
    :vars
    (
      ?auto_89945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89938 ?auto_89939 ) ) ( not ( = ?auto_89938 ?auto_89940 ) ) ( not ( = ?auto_89938 ?auto_89941 ) ) ( not ( = ?auto_89938 ?auto_89942 ) ) ( not ( = ?auto_89938 ?auto_89943 ) ) ( not ( = ?auto_89938 ?auto_89944 ) ) ( not ( = ?auto_89939 ?auto_89940 ) ) ( not ( = ?auto_89939 ?auto_89941 ) ) ( not ( = ?auto_89939 ?auto_89942 ) ) ( not ( = ?auto_89939 ?auto_89943 ) ) ( not ( = ?auto_89939 ?auto_89944 ) ) ( not ( = ?auto_89940 ?auto_89941 ) ) ( not ( = ?auto_89940 ?auto_89942 ) ) ( not ( = ?auto_89940 ?auto_89943 ) ) ( not ( = ?auto_89940 ?auto_89944 ) ) ( not ( = ?auto_89941 ?auto_89942 ) ) ( not ( = ?auto_89941 ?auto_89943 ) ) ( not ( = ?auto_89941 ?auto_89944 ) ) ( not ( = ?auto_89942 ?auto_89943 ) ) ( not ( = ?auto_89942 ?auto_89944 ) ) ( not ( = ?auto_89943 ?auto_89944 ) ) ( ON-TABLE ?auto_89944 ) ( ON ?auto_89943 ?auto_89944 ) ( ON ?auto_89942 ?auto_89943 ) ( ON ?auto_89941 ?auto_89942 ) ( ON ?auto_89938 ?auto_89945 ) ( not ( = ?auto_89938 ?auto_89945 ) ) ( not ( = ?auto_89939 ?auto_89945 ) ) ( not ( = ?auto_89940 ?auto_89945 ) ) ( not ( = ?auto_89941 ?auto_89945 ) ) ( not ( = ?auto_89942 ?auto_89945 ) ) ( not ( = ?auto_89943 ?auto_89945 ) ) ( not ( = ?auto_89944 ?auto_89945 ) ) ( ON ?auto_89939 ?auto_89938 ) ( ON-TABLE ?auto_89945 ) ( CLEAR ?auto_89941 ) ( ON ?auto_89940 ?auto_89939 ) ( CLEAR ?auto_89940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89945 ?auto_89938 ?auto_89939 )
      ( MAKE-7PILE ?auto_89938 ?auto_89939 ?auto_89940 ?auto_89941 ?auto_89942 ?auto_89943 ?auto_89944 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89946 - BLOCK
      ?auto_89947 - BLOCK
      ?auto_89948 - BLOCK
      ?auto_89949 - BLOCK
      ?auto_89950 - BLOCK
      ?auto_89951 - BLOCK
      ?auto_89952 - BLOCK
    )
    :vars
    (
      ?auto_89953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89946 ?auto_89947 ) ) ( not ( = ?auto_89946 ?auto_89948 ) ) ( not ( = ?auto_89946 ?auto_89949 ) ) ( not ( = ?auto_89946 ?auto_89950 ) ) ( not ( = ?auto_89946 ?auto_89951 ) ) ( not ( = ?auto_89946 ?auto_89952 ) ) ( not ( = ?auto_89947 ?auto_89948 ) ) ( not ( = ?auto_89947 ?auto_89949 ) ) ( not ( = ?auto_89947 ?auto_89950 ) ) ( not ( = ?auto_89947 ?auto_89951 ) ) ( not ( = ?auto_89947 ?auto_89952 ) ) ( not ( = ?auto_89948 ?auto_89949 ) ) ( not ( = ?auto_89948 ?auto_89950 ) ) ( not ( = ?auto_89948 ?auto_89951 ) ) ( not ( = ?auto_89948 ?auto_89952 ) ) ( not ( = ?auto_89949 ?auto_89950 ) ) ( not ( = ?auto_89949 ?auto_89951 ) ) ( not ( = ?auto_89949 ?auto_89952 ) ) ( not ( = ?auto_89950 ?auto_89951 ) ) ( not ( = ?auto_89950 ?auto_89952 ) ) ( not ( = ?auto_89951 ?auto_89952 ) ) ( ON-TABLE ?auto_89952 ) ( ON ?auto_89951 ?auto_89952 ) ( ON ?auto_89950 ?auto_89951 ) ( ON ?auto_89946 ?auto_89953 ) ( not ( = ?auto_89946 ?auto_89953 ) ) ( not ( = ?auto_89947 ?auto_89953 ) ) ( not ( = ?auto_89948 ?auto_89953 ) ) ( not ( = ?auto_89949 ?auto_89953 ) ) ( not ( = ?auto_89950 ?auto_89953 ) ) ( not ( = ?auto_89951 ?auto_89953 ) ) ( not ( = ?auto_89952 ?auto_89953 ) ) ( ON ?auto_89947 ?auto_89946 ) ( ON-TABLE ?auto_89953 ) ( ON ?auto_89948 ?auto_89947 ) ( CLEAR ?auto_89948 ) ( HOLDING ?auto_89949 ) ( CLEAR ?auto_89950 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89952 ?auto_89951 ?auto_89950 ?auto_89949 )
      ( MAKE-7PILE ?auto_89946 ?auto_89947 ?auto_89948 ?auto_89949 ?auto_89950 ?auto_89951 ?auto_89952 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89954 - BLOCK
      ?auto_89955 - BLOCK
      ?auto_89956 - BLOCK
      ?auto_89957 - BLOCK
      ?auto_89958 - BLOCK
      ?auto_89959 - BLOCK
      ?auto_89960 - BLOCK
    )
    :vars
    (
      ?auto_89961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89954 ?auto_89955 ) ) ( not ( = ?auto_89954 ?auto_89956 ) ) ( not ( = ?auto_89954 ?auto_89957 ) ) ( not ( = ?auto_89954 ?auto_89958 ) ) ( not ( = ?auto_89954 ?auto_89959 ) ) ( not ( = ?auto_89954 ?auto_89960 ) ) ( not ( = ?auto_89955 ?auto_89956 ) ) ( not ( = ?auto_89955 ?auto_89957 ) ) ( not ( = ?auto_89955 ?auto_89958 ) ) ( not ( = ?auto_89955 ?auto_89959 ) ) ( not ( = ?auto_89955 ?auto_89960 ) ) ( not ( = ?auto_89956 ?auto_89957 ) ) ( not ( = ?auto_89956 ?auto_89958 ) ) ( not ( = ?auto_89956 ?auto_89959 ) ) ( not ( = ?auto_89956 ?auto_89960 ) ) ( not ( = ?auto_89957 ?auto_89958 ) ) ( not ( = ?auto_89957 ?auto_89959 ) ) ( not ( = ?auto_89957 ?auto_89960 ) ) ( not ( = ?auto_89958 ?auto_89959 ) ) ( not ( = ?auto_89958 ?auto_89960 ) ) ( not ( = ?auto_89959 ?auto_89960 ) ) ( ON-TABLE ?auto_89960 ) ( ON ?auto_89959 ?auto_89960 ) ( ON ?auto_89958 ?auto_89959 ) ( ON ?auto_89954 ?auto_89961 ) ( not ( = ?auto_89954 ?auto_89961 ) ) ( not ( = ?auto_89955 ?auto_89961 ) ) ( not ( = ?auto_89956 ?auto_89961 ) ) ( not ( = ?auto_89957 ?auto_89961 ) ) ( not ( = ?auto_89958 ?auto_89961 ) ) ( not ( = ?auto_89959 ?auto_89961 ) ) ( not ( = ?auto_89960 ?auto_89961 ) ) ( ON ?auto_89955 ?auto_89954 ) ( ON-TABLE ?auto_89961 ) ( ON ?auto_89956 ?auto_89955 ) ( CLEAR ?auto_89958 ) ( ON ?auto_89957 ?auto_89956 ) ( CLEAR ?auto_89957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89961 ?auto_89954 ?auto_89955 ?auto_89956 )
      ( MAKE-7PILE ?auto_89954 ?auto_89955 ?auto_89956 ?auto_89957 ?auto_89958 ?auto_89959 ?auto_89960 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89962 - BLOCK
      ?auto_89963 - BLOCK
      ?auto_89964 - BLOCK
      ?auto_89965 - BLOCK
      ?auto_89966 - BLOCK
      ?auto_89967 - BLOCK
      ?auto_89968 - BLOCK
    )
    :vars
    (
      ?auto_89969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89962 ?auto_89963 ) ) ( not ( = ?auto_89962 ?auto_89964 ) ) ( not ( = ?auto_89962 ?auto_89965 ) ) ( not ( = ?auto_89962 ?auto_89966 ) ) ( not ( = ?auto_89962 ?auto_89967 ) ) ( not ( = ?auto_89962 ?auto_89968 ) ) ( not ( = ?auto_89963 ?auto_89964 ) ) ( not ( = ?auto_89963 ?auto_89965 ) ) ( not ( = ?auto_89963 ?auto_89966 ) ) ( not ( = ?auto_89963 ?auto_89967 ) ) ( not ( = ?auto_89963 ?auto_89968 ) ) ( not ( = ?auto_89964 ?auto_89965 ) ) ( not ( = ?auto_89964 ?auto_89966 ) ) ( not ( = ?auto_89964 ?auto_89967 ) ) ( not ( = ?auto_89964 ?auto_89968 ) ) ( not ( = ?auto_89965 ?auto_89966 ) ) ( not ( = ?auto_89965 ?auto_89967 ) ) ( not ( = ?auto_89965 ?auto_89968 ) ) ( not ( = ?auto_89966 ?auto_89967 ) ) ( not ( = ?auto_89966 ?auto_89968 ) ) ( not ( = ?auto_89967 ?auto_89968 ) ) ( ON-TABLE ?auto_89968 ) ( ON ?auto_89967 ?auto_89968 ) ( ON ?auto_89962 ?auto_89969 ) ( not ( = ?auto_89962 ?auto_89969 ) ) ( not ( = ?auto_89963 ?auto_89969 ) ) ( not ( = ?auto_89964 ?auto_89969 ) ) ( not ( = ?auto_89965 ?auto_89969 ) ) ( not ( = ?auto_89966 ?auto_89969 ) ) ( not ( = ?auto_89967 ?auto_89969 ) ) ( not ( = ?auto_89968 ?auto_89969 ) ) ( ON ?auto_89963 ?auto_89962 ) ( ON-TABLE ?auto_89969 ) ( ON ?auto_89964 ?auto_89963 ) ( ON ?auto_89965 ?auto_89964 ) ( CLEAR ?auto_89965 ) ( HOLDING ?auto_89966 ) ( CLEAR ?auto_89967 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89968 ?auto_89967 ?auto_89966 )
      ( MAKE-7PILE ?auto_89962 ?auto_89963 ?auto_89964 ?auto_89965 ?auto_89966 ?auto_89967 ?auto_89968 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89970 - BLOCK
      ?auto_89971 - BLOCK
      ?auto_89972 - BLOCK
      ?auto_89973 - BLOCK
      ?auto_89974 - BLOCK
      ?auto_89975 - BLOCK
      ?auto_89976 - BLOCK
    )
    :vars
    (
      ?auto_89977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89970 ?auto_89971 ) ) ( not ( = ?auto_89970 ?auto_89972 ) ) ( not ( = ?auto_89970 ?auto_89973 ) ) ( not ( = ?auto_89970 ?auto_89974 ) ) ( not ( = ?auto_89970 ?auto_89975 ) ) ( not ( = ?auto_89970 ?auto_89976 ) ) ( not ( = ?auto_89971 ?auto_89972 ) ) ( not ( = ?auto_89971 ?auto_89973 ) ) ( not ( = ?auto_89971 ?auto_89974 ) ) ( not ( = ?auto_89971 ?auto_89975 ) ) ( not ( = ?auto_89971 ?auto_89976 ) ) ( not ( = ?auto_89972 ?auto_89973 ) ) ( not ( = ?auto_89972 ?auto_89974 ) ) ( not ( = ?auto_89972 ?auto_89975 ) ) ( not ( = ?auto_89972 ?auto_89976 ) ) ( not ( = ?auto_89973 ?auto_89974 ) ) ( not ( = ?auto_89973 ?auto_89975 ) ) ( not ( = ?auto_89973 ?auto_89976 ) ) ( not ( = ?auto_89974 ?auto_89975 ) ) ( not ( = ?auto_89974 ?auto_89976 ) ) ( not ( = ?auto_89975 ?auto_89976 ) ) ( ON-TABLE ?auto_89976 ) ( ON ?auto_89975 ?auto_89976 ) ( ON ?auto_89970 ?auto_89977 ) ( not ( = ?auto_89970 ?auto_89977 ) ) ( not ( = ?auto_89971 ?auto_89977 ) ) ( not ( = ?auto_89972 ?auto_89977 ) ) ( not ( = ?auto_89973 ?auto_89977 ) ) ( not ( = ?auto_89974 ?auto_89977 ) ) ( not ( = ?auto_89975 ?auto_89977 ) ) ( not ( = ?auto_89976 ?auto_89977 ) ) ( ON ?auto_89971 ?auto_89970 ) ( ON-TABLE ?auto_89977 ) ( ON ?auto_89972 ?auto_89971 ) ( ON ?auto_89973 ?auto_89972 ) ( CLEAR ?auto_89975 ) ( ON ?auto_89974 ?auto_89973 ) ( CLEAR ?auto_89974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89977 ?auto_89970 ?auto_89971 ?auto_89972 ?auto_89973 )
      ( MAKE-7PILE ?auto_89970 ?auto_89971 ?auto_89972 ?auto_89973 ?auto_89974 ?auto_89975 ?auto_89976 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89978 - BLOCK
      ?auto_89979 - BLOCK
      ?auto_89980 - BLOCK
      ?auto_89981 - BLOCK
      ?auto_89982 - BLOCK
      ?auto_89983 - BLOCK
      ?auto_89984 - BLOCK
    )
    :vars
    (
      ?auto_89985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89978 ?auto_89979 ) ) ( not ( = ?auto_89978 ?auto_89980 ) ) ( not ( = ?auto_89978 ?auto_89981 ) ) ( not ( = ?auto_89978 ?auto_89982 ) ) ( not ( = ?auto_89978 ?auto_89983 ) ) ( not ( = ?auto_89978 ?auto_89984 ) ) ( not ( = ?auto_89979 ?auto_89980 ) ) ( not ( = ?auto_89979 ?auto_89981 ) ) ( not ( = ?auto_89979 ?auto_89982 ) ) ( not ( = ?auto_89979 ?auto_89983 ) ) ( not ( = ?auto_89979 ?auto_89984 ) ) ( not ( = ?auto_89980 ?auto_89981 ) ) ( not ( = ?auto_89980 ?auto_89982 ) ) ( not ( = ?auto_89980 ?auto_89983 ) ) ( not ( = ?auto_89980 ?auto_89984 ) ) ( not ( = ?auto_89981 ?auto_89982 ) ) ( not ( = ?auto_89981 ?auto_89983 ) ) ( not ( = ?auto_89981 ?auto_89984 ) ) ( not ( = ?auto_89982 ?auto_89983 ) ) ( not ( = ?auto_89982 ?auto_89984 ) ) ( not ( = ?auto_89983 ?auto_89984 ) ) ( ON-TABLE ?auto_89984 ) ( ON ?auto_89978 ?auto_89985 ) ( not ( = ?auto_89978 ?auto_89985 ) ) ( not ( = ?auto_89979 ?auto_89985 ) ) ( not ( = ?auto_89980 ?auto_89985 ) ) ( not ( = ?auto_89981 ?auto_89985 ) ) ( not ( = ?auto_89982 ?auto_89985 ) ) ( not ( = ?auto_89983 ?auto_89985 ) ) ( not ( = ?auto_89984 ?auto_89985 ) ) ( ON ?auto_89979 ?auto_89978 ) ( ON-TABLE ?auto_89985 ) ( ON ?auto_89980 ?auto_89979 ) ( ON ?auto_89981 ?auto_89980 ) ( ON ?auto_89982 ?auto_89981 ) ( CLEAR ?auto_89982 ) ( HOLDING ?auto_89983 ) ( CLEAR ?auto_89984 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89984 ?auto_89983 )
      ( MAKE-7PILE ?auto_89978 ?auto_89979 ?auto_89980 ?auto_89981 ?auto_89982 ?auto_89983 ?auto_89984 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89986 - BLOCK
      ?auto_89987 - BLOCK
      ?auto_89988 - BLOCK
      ?auto_89989 - BLOCK
      ?auto_89990 - BLOCK
      ?auto_89991 - BLOCK
      ?auto_89992 - BLOCK
    )
    :vars
    (
      ?auto_89993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89986 ?auto_89987 ) ) ( not ( = ?auto_89986 ?auto_89988 ) ) ( not ( = ?auto_89986 ?auto_89989 ) ) ( not ( = ?auto_89986 ?auto_89990 ) ) ( not ( = ?auto_89986 ?auto_89991 ) ) ( not ( = ?auto_89986 ?auto_89992 ) ) ( not ( = ?auto_89987 ?auto_89988 ) ) ( not ( = ?auto_89987 ?auto_89989 ) ) ( not ( = ?auto_89987 ?auto_89990 ) ) ( not ( = ?auto_89987 ?auto_89991 ) ) ( not ( = ?auto_89987 ?auto_89992 ) ) ( not ( = ?auto_89988 ?auto_89989 ) ) ( not ( = ?auto_89988 ?auto_89990 ) ) ( not ( = ?auto_89988 ?auto_89991 ) ) ( not ( = ?auto_89988 ?auto_89992 ) ) ( not ( = ?auto_89989 ?auto_89990 ) ) ( not ( = ?auto_89989 ?auto_89991 ) ) ( not ( = ?auto_89989 ?auto_89992 ) ) ( not ( = ?auto_89990 ?auto_89991 ) ) ( not ( = ?auto_89990 ?auto_89992 ) ) ( not ( = ?auto_89991 ?auto_89992 ) ) ( ON-TABLE ?auto_89992 ) ( ON ?auto_89986 ?auto_89993 ) ( not ( = ?auto_89986 ?auto_89993 ) ) ( not ( = ?auto_89987 ?auto_89993 ) ) ( not ( = ?auto_89988 ?auto_89993 ) ) ( not ( = ?auto_89989 ?auto_89993 ) ) ( not ( = ?auto_89990 ?auto_89993 ) ) ( not ( = ?auto_89991 ?auto_89993 ) ) ( not ( = ?auto_89992 ?auto_89993 ) ) ( ON ?auto_89987 ?auto_89986 ) ( ON-TABLE ?auto_89993 ) ( ON ?auto_89988 ?auto_89987 ) ( ON ?auto_89989 ?auto_89988 ) ( ON ?auto_89990 ?auto_89989 ) ( CLEAR ?auto_89992 ) ( ON ?auto_89991 ?auto_89990 ) ( CLEAR ?auto_89991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89993 ?auto_89986 ?auto_89987 ?auto_89988 ?auto_89989 ?auto_89990 )
      ( MAKE-7PILE ?auto_89986 ?auto_89987 ?auto_89988 ?auto_89989 ?auto_89990 ?auto_89991 ?auto_89992 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89994 - BLOCK
      ?auto_89995 - BLOCK
      ?auto_89996 - BLOCK
      ?auto_89997 - BLOCK
      ?auto_89998 - BLOCK
      ?auto_89999 - BLOCK
      ?auto_90000 - BLOCK
    )
    :vars
    (
      ?auto_90001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89994 ?auto_89995 ) ) ( not ( = ?auto_89994 ?auto_89996 ) ) ( not ( = ?auto_89994 ?auto_89997 ) ) ( not ( = ?auto_89994 ?auto_89998 ) ) ( not ( = ?auto_89994 ?auto_89999 ) ) ( not ( = ?auto_89994 ?auto_90000 ) ) ( not ( = ?auto_89995 ?auto_89996 ) ) ( not ( = ?auto_89995 ?auto_89997 ) ) ( not ( = ?auto_89995 ?auto_89998 ) ) ( not ( = ?auto_89995 ?auto_89999 ) ) ( not ( = ?auto_89995 ?auto_90000 ) ) ( not ( = ?auto_89996 ?auto_89997 ) ) ( not ( = ?auto_89996 ?auto_89998 ) ) ( not ( = ?auto_89996 ?auto_89999 ) ) ( not ( = ?auto_89996 ?auto_90000 ) ) ( not ( = ?auto_89997 ?auto_89998 ) ) ( not ( = ?auto_89997 ?auto_89999 ) ) ( not ( = ?auto_89997 ?auto_90000 ) ) ( not ( = ?auto_89998 ?auto_89999 ) ) ( not ( = ?auto_89998 ?auto_90000 ) ) ( not ( = ?auto_89999 ?auto_90000 ) ) ( ON ?auto_89994 ?auto_90001 ) ( not ( = ?auto_89994 ?auto_90001 ) ) ( not ( = ?auto_89995 ?auto_90001 ) ) ( not ( = ?auto_89996 ?auto_90001 ) ) ( not ( = ?auto_89997 ?auto_90001 ) ) ( not ( = ?auto_89998 ?auto_90001 ) ) ( not ( = ?auto_89999 ?auto_90001 ) ) ( not ( = ?auto_90000 ?auto_90001 ) ) ( ON ?auto_89995 ?auto_89994 ) ( ON-TABLE ?auto_90001 ) ( ON ?auto_89996 ?auto_89995 ) ( ON ?auto_89997 ?auto_89996 ) ( ON ?auto_89998 ?auto_89997 ) ( ON ?auto_89999 ?auto_89998 ) ( CLEAR ?auto_89999 ) ( HOLDING ?auto_90000 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90000 )
      ( MAKE-7PILE ?auto_89994 ?auto_89995 ?auto_89996 ?auto_89997 ?auto_89998 ?auto_89999 ?auto_90000 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90002 - BLOCK
      ?auto_90003 - BLOCK
      ?auto_90004 - BLOCK
      ?auto_90005 - BLOCK
      ?auto_90006 - BLOCK
      ?auto_90007 - BLOCK
      ?auto_90008 - BLOCK
    )
    :vars
    (
      ?auto_90009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90002 ?auto_90003 ) ) ( not ( = ?auto_90002 ?auto_90004 ) ) ( not ( = ?auto_90002 ?auto_90005 ) ) ( not ( = ?auto_90002 ?auto_90006 ) ) ( not ( = ?auto_90002 ?auto_90007 ) ) ( not ( = ?auto_90002 ?auto_90008 ) ) ( not ( = ?auto_90003 ?auto_90004 ) ) ( not ( = ?auto_90003 ?auto_90005 ) ) ( not ( = ?auto_90003 ?auto_90006 ) ) ( not ( = ?auto_90003 ?auto_90007 ) ) ( not ( = ?auto_90003 ?auto_90008 ) ) ( not ( = ?auto_90004 ?auto_90005 ) ) ( not ( = ?auto_90004 ?auto_90006 ) ) ( not ( = ?auto_90004 ?auto_90007 ) ) ( not ( = ?auto_90004 ?auto_90008 ) ) ( not ( = ?auto_90005 ?auto_90006 ) ) ( not ( = ?auto_90005 ?auto_90007 ) ) ( not ( = ?auto_90005 ?auto_90008 ) ) ( not ( = ?auto_90006 ?auto_90007 ) ) ( not ( = ?auto_90006 ?auto_90008 ) ) ( not ( = ?auto_90007 ?auto_90008 ) ) ( ON ?auto_90002 ?auto_90009 ) ( not ( = ?auto_90002 ?auto_90009 ) ) ( not ( = ?auto_90003 ?auto_90009 ) ) ( not ( = ?auto_90004 ?auto_90009 ) ) ( not ( = ?auto_90005 ?auto_90009 ) ) ( not ( = ?auto_90006 ?auto_90009 ) ) ( not ( = ?auto_90007 ?auto_90009 ) ) ( not ( = ?auto_90008 ?auto_90009 ) ) ( ON ?auto_90003 ?auto_90002 ) ( ON-TABLE ?auto_90009 ) ( ON ?auto_90004 ?auto_90003 ) ( ON ?auto_90005 ?auto_90004 ) ( ON ?auto_90006 ?auto_90005 ) ( ON ?auto_90007 ?auto_90006 ) ( ON ?auto_90008 ?auto_90007 ) ( CLEAR ?auto_90008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90009 ?auto_90002 ?auto_90003 ?auto_90004 ?auto_90005 ?auto_90006 ?auto_90007 )
      ( MAKE-7PILE ?auto_90002 ?auto_90003 ?auto_90004 ?auto_90005 ?auto_90006 ?auto_90007 ?auto_90008 ) )
  )

)

