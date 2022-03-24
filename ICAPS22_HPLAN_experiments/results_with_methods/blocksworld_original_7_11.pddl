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
      ?auto_107141 - BLOCK
      ?auto_107142 - BLOCK
      ?auto_107143 - BLOCK
      ?auto_107144 - BLOCK
      ?auto_107145 - BLOCK
      ?auto_107146 - BLOCK
      ?auto_107147 - BLOCK
    )
    :vars
    (
      ?auto_107148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107148 ?auto_107147 ) ( CLEAR ?auto_107148 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107141 ) ( ON ?auto_107142 ?auto_107141 ) ( ON ?auto_107143 ?auto_107142 ) ( ON ?auto_107144 ?auto_107143 ) ( ON ?auto_107145 ?auto_107144 ) ( ON ?auto_107146 ?auto_107145 ) ( ON ?auto_107147 ?auto_107146 ) ( not ( = ?auto_107141 ?auto_107142 ) ) ( not ( = ?auto_107141 ?auto_107143 ) ) ( not ( = ?auto_107141 ?auto_107144 ) ) ( not ( = ?auto_107141 ?auto_107145 ) ) ( not ( = ?auto_107141 ?auto_107146 ) ) ( not ( = ?auto_107141 ?auto_107147 ) ) ( not ( = ?auto_107141 ?auto_107148 ) ) ( not ( = ?auto_107142 ?auto_107143 ) ) ( not ( = ?auto_107142 ?auto_107144 ) ) ( not ( = ?auto_107142 ?auto_107145 ) ) ( not ( = ?auto_107142 ?auto_107146 ) ) ( not ( = ?auto_107142 ?auto_107147 ) ) ( not ( = ?auto_107142 ?auto_107148 ) ) ( not ( = ?auto_107143 ?auto_107144 ) ) ( not ( = ?auto_107143 ?auto_107145 ) ) ( not ( = ?auto_107143 ?auto_107146 ) ) ( not ( = ?auto_107143 ?auto_107147 ) ) ( not ( = ?auto_107143 ?auto_107148 ) ) ( not ( = ?auto_107144 ?auto_107145 ) ) ( not ( = ?auto_107144 ?auto_107146 ) ) ( not ( = ?auto_107144 ?auto_107147 ) ) ( not ( = ?auto_107144 ?auto_107148 ) ) ( not ( = ?auto_107145 ?auto_107146 ) ) ( not ( = ?auto_107145 ?auto_107147 ) ) ( not ( = ?auto_107145 ?auto_107148 ) ) ( not ( = ?auto_107146 ?auto_107147 ) ) ( not ( = ?auto_107146 ?auto_107148 ) ) ( not ( = ?auto_107147 ?auto_107148 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107148 ?auto_107147 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107150 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_107150 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_107150 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107151 - BLOCK
    )
    :vars
    (
      ?auto_107152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107151 ?auto_107152 ) ( CLEAR ?auto_107151 ) ( HAND-EMPTY ) ( not ( = ?auto_107151 ?auto_107152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107151 ?auto_107152 )
      ( MAKE-1PILE ?auto_107151 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107159 - BLOCK
      ?auto_107160 - BLOCK
      ?auto_107161 - BLOCK
      ?auto_107162 - BLOCK
      ?auto_107163 - BLOCK
      ?auto_107164 - BLOCK
    )
    :vars
    (
      ?auto_107165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107165 ?auto_107164 ) ( CLEAR ?auto_107165 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107159 ) ( ON ?auto_107160 ?auto_107159 ) ( ON ?auto_107161 ?auto_107160 ) ( ON ?auto_107162 ?auto_107161 ) ( ON ?auto_107163 ?auto_107162 ) ( ON ?auto_107164 ?auto_107163 ) ( not ( = ?auto_107159 ?auto_107160 ) ) ( not ( = ?auto_107159 ?auto_107161 ) ) ( not ( = ?auto_107159 ?auto_107162 ) ) ( not ( = ?auto_107159 ?auto_107163 ) ) ( not ( = ?auto_107159 ?auto_107164 ) ) ( not ( = ?auto_107159 ?auto_107165 ) ) ( not ( = ?auto_107160 ?auto_107161 ) ) ( not ( = ?auto_107160 ?auto_107162 ) ) ( not ( = ?auto_107160 ?auto_107163 ) ) ( not ( = ?auto_107160 ?auto_107164 ) ) ( not ( = ?auto_107160 ?auto_107165 ) ) ( not ( = ?auto_107161 ?auto_107162 ) ) ( not ( = ?auto_107161 ?auto_107163 ) ) ( not ( = ?auto_107161 ?auto_107164 ) ) ( not ( = ?auto_107161 ?auto_107165 ) ) ( not ( = ?auto_107162 ?auto_107163 ) ) ( not ( = ?auto_107162 ?auto_107164 ) ) ( not ( = ?auto_107162 ?auto_107165 ) ) ( not ( = ?auto_107163 ?auto_107164 ) ) ( not ( = ?auto_107163 ?auto_107165 ) ) ( not ( = ?auto_107164 ?auto_107165 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107165 ?auto_107164 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107166 - BLOCK
      ?auto_107167 - BLOCK
      ?auto_107168 - BLOCK
      ?auto_107169 - BLOCK
      ?auto_107170 - BLOCK
      ?auto_107171 - BLOCK
    )
    :vars
    (
      ?auto_107172 - BLOCK
      ?auto_107173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107172 ?auto_107171 ) ( CLEAR ?auto_107172 ) ( ON-TABLE ?auto_107166 ) ( ON ?auto_107167 ?auto_107166 ) ( ON ?auto_107168 ?auto_107167 ) ( ON ?auto_107169 ?auto_107168 ) ( ON ?auto_107170 ?auto_107169 ) ( ON ?auto_107171 ?auto_107170 ) ( not ( = ?auto_107166 ?auto_107167 ) ) ( not ( = ?auto_107166 ?auto_107168 ) ) ( not ( = ?auto_107166 ?auto_107169 ) ) ( not ( = ?auto_107166 ?auto_107170 ) ) ( not ( = ?auto_107166 ?auto_107171 ) ) ( not ( = ?auto_107166 ?auto_107172 ) ) ( not ( = ?auto_107167 ?auto_107168 ) ) ( not ( = ?auto_107167 ?auto_107169 ) ) ( not ( = ?auto_107167 ?auto_107170 ) ) ( not ( = ?auto_107167 ?auto_107171 ) ) ( not ( = ?auto_107167 ?auto_107172 ) ) ( not ( = ?auto_107168 ?auto_107169 ) ) ( not ( = ?auto_107168 ?auto_107170 ) ) ( not ( = ?auto_107168 ?auto_107171 ) ) ( not ( = ?auto_107168 ?auto_107172 ) ) ( not ( = ?auto_107169 ?auto_107170 ) ) ( not ( = ?auto_107169 ?auto_107171 ) ) ( not ( = ?auto_107169 ?auto_107172 ) ) ( not ( = ?auto_107170 ?auto_107171 ) ) ( not ( = ?auto_107170 ?auto_107172 ) ) ( not ( = ?auto_107171 ?auto_107172 ) ) ( HOLDING ?auto_107173 ) ( not ( = ?auto_107166 ?auto_107173 ) ) ( not ( = ?auto_107167 ?auto_107173 ) ) ( not ( = ?auto_107168 ?auto_107173 ) ) ( not ( = ?auto_107169 ?auto_107173 ) ) ( not ( = ?auto_107170 ?auto_107173 ) ) ( not ( = ?auto_107171 ?auto_107173 ) ) ( not ( = ?auto_107172 ?auto_107173 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_107173 )
      ( MAKE-6PILE ?auto_107166 ?auto_107167 ?auto_107168 ?auto_107169 ?auto_107170 ?auto_107171 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107174 - BLOCK
      ?auto_107175 - BLOCK
      ?auto_107176 - BLOCK
      ?auto_107177 - BLOCK
      ?auto_107178 - BLOCK
      ?auto_107179 - BLOCK
    )
    :vars
    (
      ?auto_107180 - BLOCK
      ?auto_107181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107180 ?auto_107179 ) ( ON-TABLE ?auto_107174 ) ( ON ?auto_107175 ?auto_107174 ) ( ON ?auto_107176 ?auto_107175 ) ( ON ?auto_107177 ?auto_107176 ) ( ON ?auto_107178 ?auto_107177 ) ( ON ?auto_107179 ?auto_107178 ) ( not ( = ?auto_107174 ?auto_107175 ) ) ( not ( = ?auto_107174 ?auto_107176 ) ) ( not ( = ?auto_107174 ?auto_107177 ) ) ( not ( = ?auto_107174 ?auto_107178 ) ) ( not ( = ?auto_107174 ?auto_107179 ) ) ( not ( = ?auto_107174 ?auto_107180 ) ) ( not ( = ?auto_107175 ?auto_107176 ) ) ( not ( = ?auto_107175 ?auto_107177 ) ) ( not ( = ?auto_107175 ?auto_107178 ) ) ( not ( = ?auto_107175 ?auto_107179 ) ) ( not ( = ?auto_107175 ?auto_107180 ) ) ( not ( = ?auto_107176 ?auto_107177 ) ) ( not ( = ?auto_107176 ?auto_107178 ) ) ( not ( = ?auto_107176 ?auto_107179 ) ) ( not ( = ?auto_107176 ?auto_107180 ) ) ( not ( = ?auto_107177 ?auto_107178 ) ) ( not ( = ?auto_107177 ?auto_107179 ) ) ( not ( = ?auto_107177 ?auto_107180 ) ) ( not ( = ?auto_107178 ?auto_107179 ) ) ( not ( = ?auto_107178 ?auto_107180 ) ) ( not ( = ?auto_107179 ?auto_107180 ) ) ( not ( = ?auto_107174 ?auto_107181 ) ) ( not ( = ?auto_107175 ?auto_107181 ) ) ( not ( = ?auto_107176 ?auto_107181 ) ) ( not ( = ?auto_107177 ?auto_107181 ) ) ( not ( = ?auto_107178 ?auto_107181 ) ) ( not ( = ?auto_107179 ?auto_107181 ) ) ( not ( = ?auto_107180 ?auto_107181 ) ) ( ON ?auto_107181 ?auto_107180 ) ( CLEAR ?auto_107181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107174 ?auto_107175 ?auto_107176 ?auto_107177 ?auto_107178 ?auto_107179 ?auto_107180 )
      ( MAKE-6PILE ?auto_107174 ?auto_107175 ?auto_107176 ?auto_107177 ?auto_107178 ?auto_107179 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107184 - BLOCK
      ?auto_107185 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_107185 ) ( CLEAR ?auto_107184 ) ( ON-TABLE ?auto_107184 ) ( not ( = ?auto_107184 ?auto_107185 ) ) )
    :subtasks
    ( ( !STACK ?auto_107185 ?auto_107184 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107186 - BLOCK
      ?auto_107187 - BLOCK
    )
    :vars
    (
      ?auto_107188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107186 ) ( ON-TABLE ?auto_107186 ) ( not ( = ?auto_107186 ?auto_107187 ) ) ( ON ?auto_107187 ?auto_107188 ) ( CLEAR ?auto_107187 ) ( HAND-EMPTY ) ( not ( = ?auto_107186 ?auto_107188 ) ) ( not ( = ?auto_107187 ?auto_107188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107187 ?auto_107188 )
      ( MAKE-2PILE ?auto_107186 ?auto_107187 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107189 - BLOCK
      ?auto_107190 - BLOCK
    )
    :vars
    (
      ?auto_107191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107189 ?auto_107190 ) ) ( ON ?auto_107190 ?auto_107191 ) ( CLEAR ?auto_107190 ) ( not ( = ?auto_107189 ?auto_107191 ) ) ( not ( = ?auto_107190 ?auto_107191 ) ) ( HOLDING ?auto_107189 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107189 )
      ( MAKE-2PILE ?auto_107189 ?auto_107190 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107192 - BLOCK
      ?auto_107193 - BLOCK
    )
    :vars
    (
      ?auto_107194 - BLOCK
      ?auto_107199 - BLOCK
      ?auto_107195 - BLOCK
      ?auto_107196 - BLOCK
      ?auto_107198 - BLOCK
      ?auto_107197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107192 ?auto_107193 ) ) ( ON ?auto_107193 ?auto_107194 ) ( not ( = ?auto_107192 ?auto_107194 ) ) ( not ( = ?auto_107193 ?auto_107194 ) ) ( ON ?auto_107192 ?auto_107193 ) ( CLEAR ?auto_107192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107199 ) ( ON ?auto_107195 ?auto_107199 ) ( ON ?auto_107196 ?auto_107195 ) ( ON ?auto_107198 ?auto_107196 ) ( ON ?auto_107197 ?auto_107198 ) ( ON ?auto_107194 ?auto_107197 ) ( not ( = ?auto_107199 ?auto_107195 ) ) ( not ( = ?auto_107199 ?auto_107196 ) ) ( not ( = ?auto_107199 ?auto_107198 ) ) ( not ( = ?auto_107199 ?auto_107197 ) ) ( not ( = ?auto_107199 ?auto_107194 ) ) ( not ( = ?auto_107199 ?auto_107193 ) ) ( not ( = ?auto_107199 ?auto_107192 ) ) ( not ( = ?auto_107195 ?auto_107196 ) ) ( not ( = ?auto_107195 ?auto_107198 ) ) ( not ( = ?auto_107195 ?auto_107197 ) ) ( not ( = ?auto_107195 ?auto_107194 ) ) ( not ( = ?auto_107195 ?auto_107193 ) ) ( not ( = ?auto_107195 ?auto_107192 ) ) ( not ( = ?auto_107196 ?auto_107198 ) ) ( not ( = ?auto_107196 ?auto_107197 ) ) ( not ( = ?auto_107196 ?auto_107194 ) ) ( not ( = ?auto_107196 ?auto_107193 ) ) ( not ( = ?auto_107196 ?auto_107192 ) ) ( not ( = ?auto_107198 ?auto_107197 ) ) ( not ( = ?auto_107198 ?auto_107194 ) ) ( not ( = ?auto_107198 ?auto_107193 ) ) ( not ( = ?auto_107198 ?auto_107192 ) ) ( not ( = ?auto_107197 ?auto_107194 ) ) ( not ( = ?auto_107197 ?auto_107193 ) ) ( not ( = ?auto_107197 ?auto_107192 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107199 ?auto_107195 ?auto_107196 ?auto_107198 ?auto_107197 ?auto_107194 ?auto_107193 )
      ( MAKE-2PILE ?auto_107192 ?auto_107193 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107205 - BLOCK
      ?auto_107206 - BLOCK
      ?auto_107207 - BLOCK
      ?auto_107208 - BLOCK
      ?auto_107209 - BLOCK
    )
    :vars
    (
      ?auto_107210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107210 ?auto_107209 ) ( CLEAR ?auto_107210 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107205 ) ( ON ?auto_107206 ?auto_107205 ) ( ON ?auto_107207 ?auto_107206 ) ( ON ?auto_107208 ?auto_107207 ) ( ON ?auto_107209 ?auto_107208 ) ( not ( = ?auto_107205 ?auto_107206 ) ) ( not ( = ?auto_107205 ?auto_107207 ) ) ( not ( = ?auto_107205 ?auto_107208 ) ) ( not ( = ?auto_107205 ?auto_107209 ) ) ( not ( = ?auto_107205 ?auto_107210 ) ) ( not ( = ?auto_107206 ?auto_107207 ) ) ( not ( = ?auto_107206 ?auto_107208 ) ) ( not ( = ?auto_107206 ?auto_107209 ) ) ( not ( = ?auto_107206 ?auto_107210 ) ) ( not ( = ?auto_107207 ?auto_107208 ) ) ( not ( = ?auto_107207 ?auto_107209 ) ) ( not ( = ?auto_107207 ?auto_107210 ) ) ( not ( = ?auto_107208 ?auto_107209 ) ) ( not ( = ?auto_107208 ?auto_107210 ) ) ( not ( = ?auto_107209 ?auto_107210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107210 ?auto_107209 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107211 - BLOCK
      ?auto_107212 - BLOCK
      ?auto_107213 - BLOCK
      ?auto_107214 - BLOCK
      ?auto_107215 - BLOCK
    )
    :vars
    (
      ?auto_107216 - BLOCK
      ?auto_107217 - BLOCK
      ?auto_107218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107216 ?auto_107215 ) ( CLEAR ?auto_107216 ) ( ON-TABLE ?auto_107211 ) ( ON ?auto_107212 ?auto_107211 ) ( ON ?auto_107213 ?auto_107212 ) ( ON ?auto_107214 ?auto_107213 ) ( ON ?auto_107215 ?auto_107214 ) ( not ( = ?auto_107211 ?auto_107212 ) ) ( not ( = ?auto_107211 ?auto_107213 ) ) ( not ( = ?auto_107211 ?auto_107214 ) ) ( not ( = ?auto_107211 ?auto_107215 ) ) ( not ( = ?auto_107211 ?auto_107216 ) ) ( not ( = ?auto_107212 ?auto_107213 ) ) ( not ( = ?auto_107212 ?auto_107214 ) ) ( not ( = ?auto_107212 ?auto_107215 ) ) ( not ( = ?auto_107212 ?auto_107216 ) ) ( not ( = ?auto_107213 ?auto_107214 ) ) ( not ( = ?auto_107213 ?auto_107215 ) ) ( not ( = ?auto_107213 ?auto_107216 ) ) ( not ( = ?auto_107214 ?auto_107215 ) ) ( not ( = ?auto_107214 ?auto_107216 ) ) ( not ( = ?auto_107215 ?auto_107216 ) ) ( HOLDING ?auto_107217 ) ( CLEAR ?auto_107218 ) ( not ( = ?auto_107211 ?auto_107217 ) ) ( not ( = ?auto_107211 ?auto_107218 ) ) ( not ( = ?auto_107212 ?auto_107217 ) ) ( not ( = ?auto_107212 ?auto_107218 ) ) ( not ( = ?auto_107213 ?auto_107217 ) ) ( not ( = ?auto_107213 ?auto_107218 ) ) ( not ( = ?auto_107214 ?auto_107217 ) ) ( not ( = ?auto_107214 ?auto_107218 ) ) ( not ( = ?auto_107215 ?auto_107217 ) ) ( not ( = ?auto_107215 ?auto_107218 ) ) ( not ( = ?auto_107216 ?auto_107217 ) ) ( not ( = ?auto_107216 ?auto_107218 ) ) ( not ( = ?auto_107217 ?auto_107218 ) ) )
    :subtasks
    ( ( !STACK ?auto_107217 ?auto_107218 )
      ( MAKE-5PILE ?auto_107211 ?auto_107212 ?auto_107213 ?auto_107214 ?auto_107215 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107219 - BLOCK
      ?auto_107220 - BLOCK
      ?auto_107221 - BLOCK
      ?auto_107222 - BLOCK
      ?auto_107223 - BLOCK
    )
    :vars
    (
      ?auto_107224 - BLOCK
      ?auto_107225 - BLOCK
      ?auto_107226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107224 ?auto_107223 ) ( ON-TABLE ?auto_107219 ) ( ON ?auto_107220 ?auto_107219 ) ( ON ?auto_107221 ?auto_107220 ) ( ON ?auto_107222 ?auto_107221 ) ( ON ?auto_107223 ?auto_107222 ) ( not ( = ?auto_107219 ?auto_107220 ) ) ( not ( = ?auto_107219 ?auto_107221 ) ) ( not ( = ?auto_107219 ?auto_107222 ) ) ( not ( = ?auto_107219 ?auto_107223 ) ) ( not ( = ?auto_107219 ?auto_107224 ) ) ( not ( = ?auto_107220 ?auto_107221 ) ) ( not ( = ?auto_107220 ?auto_107222 ) ) ( not ( = ?auto_107220 ?auto_107223 ) ) ( not ( = ?auto_107220 ?auto_107224 ) ) ( not ( = ?auto_107221 ?auto_107222 ) ) ( not ( = ?auto_107221 ?auto_107223 ) ) ( not ( = ?auto_107221 ?auto_107224 ) ) ( not ( = ?auto_107222 ?auto_107223 ) ) ( not ( = ?auto_107222 ?auto_107224 ) ) ( not ( = ?auto_107223 ?auto_107224 ) ) ( CLEAR ?auto_107225 ) ( not ( = ?auto_107219 ?auto_107226 ) ) ( not ( = ?auto_107219 ?auto_107225 ) ) ( not ( = ?auto_107220 ?auto_107226 ) ) ( not ( = ?auto_107220 ?auto_107225 ) ) ( not ( = ?auto_107221 ?auto_107226 ) ) ( not ( = ?auto_107221 ?auto_107225 ) ) ( not ( = ?auto_107222 ?auto_107226 ) ) ( not ( = ?auto_107222 ?auto_107225 ) ) ( not ( = ?auto_107223 ?auto_107226 ) ) ( not ( = ?auto_107223 ?auto_107225 ) ) ( not ( = ?auto_107224 ?auto_107226 ) ) ( not ( = ?auto_107224 ?auto_107225 ) ) ( not ( = ?auto_107226 ?auto_107225 ) ) ( ON ?auto_107226 ?auto_107224 ) ( CLEAR ?auto_107226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107219 ?auto_107220 ?auto_107221 ?auto_107222 ?auto_107223 ?auto_107224 )
      ( MAKE-5PILE ?auto_107219 ?auto_107220 ?auto_107221 ?auto_107222 ?auto_107223 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107227 - BLOCK
      ?auto_107228 - BLOCK
      ?auto_107229 - BLOCK
      ?auto_107230 - BLOCK
      ?auto_107231 - BLOCK
    )
    :vars
    (
      ?auto_107234 - BLOCK
      ?auto_107233 - BLOCK
      ?auto_107232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107234 ?auto_107231 ) ( ON-TABLE ?auto_107227 ) ( ON ?auto_107228 ?auto_107227 ) ( ON ?auto_107229 ?auto_107228 ) ( ON ?auto_107230 ?auto_107229 ) ( ON ?auto_107231 ?auto_107230 ) ( not ( = ?auto_107227 ?auto_107228 ) ) ( not ( = ?auto_107227 ?auto_107229 ) ) ( not ( = ?auto_107227 ?auto_107230 ) ) ( not ( = ?auto_107227 ?auto_107231 ) ) ( not ( = ?auto_107227 ?auto_107234 ) ) ( not ( = ?auto_107228 ?auto_107229 ) ) ( not ( = ?auto_107228 ?auto_107230 ) ) ( not ( = ?auto_107228 ?auto_107231 ) ) ( not ( = ?auto_107228 ?auto_107234 ) ) ( not ( = ?auto_107229 ?auto_107230 ) ) ( not ( = ?auto_107229 ?auto_107231 ) ) ( not ( = ?auto_107229 ?auto_107234 ) ) ( not ( = ?auto_107230 ?auto_107231 ) ) ( not ( = ?auto_107230 ?auto_107234 ) ) ( not ( = ?auto_107231 ?auto_107234 ) ) ( not ( = ?auto_107227 ?auto_107233 ) ) ( not ( = ?auto_107227 ?auto_107232 ) ) ( not ( = ?auto_107228 ?auto_107233 ) ) ( not ( = ?auto_107228 ?auto_107232 ) ) ( not ( = ?auto_107229 ?auto_107233 ) ) ( not ( = ?auto_107229 ?auto_107232 ) ) ( not ( = ?auto_107230 ?auto_107233 ) ) ( not ( = ?auto_107230 ?auto_107232 ) ) ( not ( = ?auto_107231 ?auto_107233 ) ) ( not ( = ?auto_107231 ?auto_107232 ) ) ( not ( = ?auto_107234 ?auto_107233 ) ) ( not ( = ?auto_107234 ?auto_107232 ) ) ( not ( = ?auto_107233 ?auto_107232 ) ) ( ON ?auto_107233 ?auto_107234 ) ( CLEAR ?auto_107233 ) ( HOLDING ?auto_107232 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107232 )
      ( MAKE-5PILE ?auto_107227 ?auto_107228 ?auto_107229 ?auto_107230 ?auto_107231 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107235 - BLOCK
      ?auto_107236 - BLOCK
      ?auto_107237 - BLOCK
      ?auto_107238 - BLOCK
      ?auto_107239 - BLOCK
    )
    :vars
    (
      ?auto_107242 - BLOCK
      ?auto_107241 - BLOCK
      ?auto_107240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107242 ?auto_107239 ) ( ON-TABLE ?auto_107235 ) ( ON ?auto_107236 ?auto_107235 ) ( ON ?auto_107237 ?auto_107236 ) ( ON ?auto_107238 ?auto_107237 ) ( ON ?auto_107239 ?auto_107238 ) ( not ( = ?auto_107235 ?auto_107236 ) ) ( not ( = ?auto_107235 ?auto_107237 ) ) ( not ( = ?auto_107235 ?auto_107238 ) ) ( not ( = ?auto_107235 ?auto_107239 ) ) ( not ( = ?auto_107235 ?auto_107242 ) ) ( not ( = ?auto_107236 ?auto_107237 ) ) ( not ( = ?auto_107236 ?auto_107238 ) ) ( not ( = ?auto_107236 ?auto_107239 ) ) ( not ( = ?auto_107236 ?auto_107242 ) ) ( not ( = ?auto_107237 ?auto_107238 ) ) ( not ( = ?auto_107237 ?auto_107239 ) ) ( not ( = ?auto_107237 ?auto_107242 ) ) ( not ( = ?auto_107238 ?auto_107239 ) ) ( not ( = ?auto_107238 ?auto_107242 ) ) ( not ( = ?auto_107239 ?auto_107242 ) ) ( not ( = ?auto_107235 ?auto_107241 ) ) ( not ( = ?auto_107235 ?auto_107240 ) ) ( not ( = ?auto_107236 ?auto_107241 ) ) ( not ( = ?auto_107236 ?auto_107240 ) ) ( not ( = ?auto_107237 ?auto_107241 ) ) ( not ( = ?auto_107237 ?auto_107240 ) ) ( not ( = ?auto_107238 ?auto_107241 ) ) ( not ( = ?auto_107238 ?auto_107240 ) ) ( not ( = ?auto_107239 ?auto_107241 ) ) ( not ( = ?auto_107239 ?auto_107240 ) ) ( not ( = ?auto_107242 ?auto_107241 ) ) ( not ( = ?auto_107242 ?auto_107240 ) ) ( not ( = ?auto_107241 ?auto_107240 ) ) ( ON ?auto_107241 ?auto_107242 ) ( ON ?auto_107240 ?auto_107241 ) ( CLEAR ?auto_107240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107235 ?auto_107236 ?auto_107237 ?auto_107238 ?auto_107239 ?auto_107242 ?auto_107241 )
      ( MAKE-5PILE ?auto_107235 ?auto_107236 ?auto_107237 ?auto_107238 ?auto_107239 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107246 - BLOCK
      ?auto_107247 - BLOCK
      ?auto_107248 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_107248 ) ( CLEAR ?auto_107247 ) ( ON-TABLE ?auto_107246 ) ( ON ?auto_107247 ?auto_107246 ) ( not ( = ?auto_107246 ?auto_107247 ) ) ( not ( = ?auto_107246 ?auto_107248 ) ) ( not ( = ?auto_107247 ?auto_107248 ) ) )
    :subtasks
    ( ( !STACK ?auto_107248 ?auto_107247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107249 - BLOCK
      ?auto_107250 - BLOCK
      ?auto_107251 - BLOCK
    )
    :vars
    (
      ?auto_107252 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107250 ) ( ON-TABLE ?auto_107249 ) ( ON ?auto_107250 ?auto_107249 ) ( not ( = ?auto_107249 ?auto_107250 ) ) ( not ( = ?auto_107249 ?auto_107251 ) ) ( not ( = ?auto_107250 ?auto_107251 ) ) ( ON ?auto_107251 ?auto_107252 ) ( CLEAR ?auto_107251 ) ( HAND-EMPTY ) ( not ( = ?auto_107249 ?auto_107252 ) ) ( not ( = ?auto_107250 ?auto_107252 ) ) ( not ( = ?auto_107251 ?auto_107252 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107251 ?auto_107252 )
      ( MAKE-3PILE ?auto_107249 ?auto_107250 ?auto_107251 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107253 - BLOCK
      ?auto_107254 - BLOCK
      ?auto_107255 - BLOCK
    )
    :vars
    (
      ?auto_107256 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107253 ) ( not ( = ?auto_107253 ?auto_107254 ) ) ( not ( = ?auto_107253 ?auto_107255 ) ) ( not ( = ?auto_107254 ?auto_107255 ) ) ( ON ?auto_107255 ?auto_107256 ) ( CLEAR ?auto_107255 ) ( not ( = ?auto_107253 ?auto_107256 ) ) ( not ( = ?auto_107254 ?auto_107256 ) ) ( not ( = ?auto_107255 ?auto_107256 ) ) ( HOLDING ?auto_107254 ) ( CLEAR ?auto_107253 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107253 ?auto_107254 )
      ( MAKE-3PILE ?auto_107253 ?auto_107254 ?auto_107255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107257 - BLOCK
      ?auto_107258 - BLOCK
      ?auto_107259 - BLOCK
    )
    :vars
    (
      ?auto_107260 - BLOCK
      ?auto_107263 - BLOCK
      ?auto_107262 - BLOCK
      ?auto_107264 - BLOCK
      ?auto_107261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107257 ) ( not ( = ?auto_107257 ?auto_107258 ) ) ( not ( = ?auto_107257 ?auto_107259 ) ) ( not ( = ?auto_107258 ?auto_107259 ) ) ( ON ?auto_107259 ?auto_107260 ) ( not ( = ?auto_107257 ?auto_107260 ) ) ( not ( = ?auto_107258 ?auto_107260 ) ) ( not ( = ?auto_107259 ?auto_107260 ) ) ( CLEAR ?auto_107257 ) ( ON ?auto_107258 ?auto_107259 ) ( CLEAR ?auto_107258 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107263 ) ( ON ?auto_107262 ?auto_107263 ) ( ON ?auto_107264 ?auto_107262 ) ( ON ?auto_107261 ?auto_107264 ) ( ON ?auto_107260 ?auto_107261 ) ( not ( = ?auto_107263 ?auto_107262 ) ) ( not ( = ?auto_107263 ?auto_107264 ) ) ( not ( = ?auto_107263 ?auto_107261 ) ) ( not ( = ?auto_107263 ?auto_107260 ) ) ( not ( = ?auto_107263 ?auto_107259 ) ) ( not ( = ?auto_107263 ?auto_107258 ) ) ( not ( = ?auto_107262 ?auto_107264 ) ) ( not ( = ?auto_107262 ?auto_107261 ) ) ( not ( = ?auto_107262 ?auto_107260 ) ) ( not ( = ?auto_107262 ?auto_107259 ) ) ( not ( = ?auto_107262 ?auto_107258 ) ) ( not ( = ?auto_107264 ?auto_107261 ) ) ( not ( = ?auto_107264 ?auto_107260 ) ) ( not ( = ?auto_107264 ?auto_107259 ) ) ( not ( = ?auto_107264 ?auto_107258 ) ) ( not ( = ?auto_107261 ?auto_107260 ) ) ( not ( = ?auto_107261 ?auto_107259 ) ) ( not ( = ?auto_107261 ?auto_107258 ) ) ( not ( = ?auto_107257 ?auto_107263 ) ) ( not ( = ?auto_107257 ?auto_107262 ) ) ( not ( = ?auto_107257 ?auto_107264 ) ) ( not ( = ?auto_107257 ?auto_107261 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107263 ?auto_107262 ?auto_107264 ?auto_107261 ?auto_107260 ?auto_107259 )
      ( MAKE-3PILE ?auto_107257 ?auto_107258 ?auto_107259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107265 - BLOCK
      ?auto_107266 - BLOCK
      ?auto_107267 - BLOCK
    )
    :vars
    (
      ?auto_107272 - BLOCK
      ?auto_107270 - BLOCK
      ?auto_107269 - BLOCK
      ?auto_107268 - BLOCK
      ?auto_107271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107265 ?auto_107266 ) ) ( not ( = ?auto_107265 ?auto_107267 ) ) ( not ( = ?auto_107266 ?auto_107267 ) ) ( ON ?auto_107267 ?auto_107272 ) ( not ( = ?auto_107265 ?auto_107272 ) ) ( not ( = ?auto_107266 ?auto_107272 ) ) ( not ( = ?auto_107267 ?auto_107272 ) ) ( ON ?auto_107266 ?auto_107267 ) ( CLEAR ?auto_107266 ) ( ON-TABLE ?auto_107270 ) ( ON ?auto_107269 ?auto_107270 ) ( ON ?auto_107268 ?auto_107269 ) ( ON ?auto_107271 ?auto_107268 ) ( ON ?auto_107272 ?auto_107271 ) ( not ( = ?auto_107270 ?auto_107269 ) ) ( not ( = ?auto_107270 ?auto_107268 ) ) ( not ( = ?auto_107270 ?auto_107271 ) ) ( not ( = ?auto_107270 ?auto_107272 ) ) ( not ( = ?auto_107270 ?auto_107267 ) ) ( not ( = ?auto_107270 ?auto_107266 ) ) ( not ( = ?auto_107269 ?auto_107268 ) ) ( not ( = ?auto_107269 ?auto_107271 ) ) ( not ( = ?auto_107269 ?auto_107272 ) ) ( not ( = ?auto_107269 ?auto_107267 ) ) ( not ( = ?auto_107269 ?auto_107266 ) ) ( not ( = ?auto_107268 ?auto_107271 ) ) ( not ( = ?auto_107268 ?auto_107272 ) ) ( not ( = ?auto_107268 ?auto_107267 ) ) ( not ( = ?auto_107268 ?auto_107266 ) ) ( not ( = ?auto_107271 ?auto_107272 ) ) ( not ( = ?auto_107271 ?auto_107267 ) ) ( not ( = ?auto_107271 ?auto_107266 ) ) ( not ( = ?auto_107265 ?auto_107270 ) ) ( not ( = ?auto_107265 ?auto_107269 ) ) ( not ( = ?auto_107265 ?auto_107268 ) ) ( not ( = ?auto_107265 ?auto_107271 ) ) ( HOLDING ?auto_107265 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107265 )
      ( MAKE-3PILE ?auto_107265 ?auto_107266 ?auto_107267 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107273 - BLOCK
      ?auto_107274 - BLOCK
      ?auto_107275 - BLOCK
    )
    :vars
    (
      ?auto_107277 - BLOCK
      ?auto_107278 - BLOCK
      ?auto_107280 - BLOCK
      ?auto_107276 - BLOCK
      ?auto_107279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107273 ?auto_107274 ) ) ( not ( = ?auto_107273 ?auto_107275 ) ) ( not ( = ?auto_107274 ?auto_107275 ) ) ( ON ?auto_107275 ?auto_107277 ) ( not ( = ?auto_107273 ?auto_107277 ) ) ( not ( = ?auto_107274 ?auto_107277 ) ) ( not ( = ?auto_107275 ?auto_107277 ) ) ( ON ?auto_107274 ?auto_107275 ) ( ON-TABLE ?auto_107278 ) ( ON ?auto_107280 ?auto_107278 ) ( ON ?auto_107276 ?auto_107280 ) ( ON ?auto_107279 ?auto_107276 ) ( ON ?auto_107277 ?auto_107279 ) ( not ( = ?auto_107278 ?auto_107280 ) ) ( not ( = ?auto_107278 ?auto_107276 ) ) ( not ( = ?auto_107278 ?auto_107279 ) ) ( not ( = ?auto_107278 ?auto_107277 ) ) ( not ( = ?auto_107278 ?auto_107275 ) ) ( not ( = ?auto_107278 ?auto_107274 ) ) ( not ( = ?auto_107280 ?auto_107276 ) ) ( not ( = ?auto_107280 ?auto_107279 ) ) ( not ( = ?auto_107280 ?auto_107277 ) ) ( not ( = ?auto_107280 ?auto_107275 ) ) ( not ( = ?auto_107280 ?auto_107274 ) ) ( not ( = ?auto_107276 ?auto_107279 ) ) ( not ( = ?auto_107276 ?auto_107277 ) ) ( not ( = ?auto_107276 ?auto_107275 ) ) ( not ( = ?auto_107276 ?auto_107274 ) ) ( not ( = ?auto_107279 ?auto_107277 ) ) ( not ( = ?auto_107279 ?auto_107275 ) ) ( not ( = ?auto_107279 ?auto_107274 ) ) ( not ( = ?auto_107273 ?auto_107278 ) ) ( not ( = ?auto_107273 ?auto_107280 ) ) ( not ( = ?auto_107273 ?auto_107276 ) ) ( not ( = ?auto_107273 ?auto_107279 ) ) ( ON ?auto_107273 ?auto_107274 ) ( CLEAR ?auto_107273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107278 ?auto_107280 ?auto_107276 ?auto_107279 ?auto_107277 ?auto_107275 ?auto_107274 )
      ( MAKE-3PILE ?auto_107273 ?auto_107274 ?auto_107275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107285 - BLOCK
      ?auto_107286 - BLOCK
      ?auto_107287 - BLOCK
      ?auto_107288 - BLOCK
    )
    :vars
    (
      ?auto_107289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107289 ?auto_107288 ) ( CLEAR ?auto_107289 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107285 ) ( ON ?auto_107286 ?auto_107285 ) ( ON ?auto_107287 ?auto_107286 ) ( ON ?auto_107288 ?auto_107287 ) ( not ( = ?auto_107285 ?auto_107286 ) ) ( not ( = ?auto_107285 ?auto_107287 ) ) ( not ( = ?auto_107285 ?auto_107288 ) ) ( not ( = ?auto_107285 ?auto_107289 ) ) ( not ( = ?auto_107286 ?auto_107287 ) ) ( not ( = ?auto_107286 ?auto_107288 ) ) ( not ( = ?auto_107286 ?auto_107289 ) ) ( not ( = ?auto_107287 ?auto_107288 ) ) ( not ( = ?auto_107287 ?auto_107289 ) ) ( not ( = ?auto_107288 ?auto_107289 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107289 ?auto_107288 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107290 - BLOCK
      ?auto_107291 - BLOCK
      ?auto_107292 - BLOCK
      ?auto_107293 - BLOCK
    )
    :vars
    (
      ?auto_107294 - BLOCK
      ?auto_107295 - BLOCK
      ?auto_107296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107294 ?auto_107293 ) ( CLEAR ?auto_107294 ) ( ON-TABLE ?auto_107290 ) ( ON ?auto_107291 ?auto_107290 ) ( ON ?auto_107292 ?auto_107291 ) ( ON ?auto_107293 ?auto_107292 ) ( not ( = ?auto_107290 ?auto_107291 ) ) ( not ( = ?auto_107290 ?auto_107292 ) ) ( not ( = ?auto_107290 ?auto_107293 ) ) ( not ( = ?auto_107290 ?auto_107294 ) ) ( not ( = ?auto_107291 ?auto_107292 ) ) ( not ( = ?auto_107291 ?auto_107293 ) ) ( not ( = ?auto_107291 ?auto_107294 ) ) ( not ( = ?auto_107292 ?auto_107293 ) ) ( not ( = ?auto_107292 ?auto_107294 ) ) ( not ( = ?auto_107293 ?auto_107294 ) ) ( HOLDING ?auto_107295 ) ( CLEAR ?auto_107296 ) ( not ( = ?auto_107290 ?auto_107295 ) ) ( not ( = ?auto_107290 ?auto_107296 ) ) ( not ( = ?auto_107291 ?auto_107295 ) ) ( not ( = ?auto_107291 ?auto_107296 ) ) ( not ( = ?auto_107292 ?auto_107295 ) ) ( not ( = ?auto_107292 ?auto_107296 ) ) ( not ( = ?auto_107293 ?auto_107295 ) ) ( not ( = ?auto_107293 ?auto_107296 ) ) ( not ( = ?auto_107294 ?auto_107295 ) ) ( not ( = ?auto_107294 ?auto_107296 ) ) ( not ( = ?auto_107295 ?auto_107296 ) ) )
    :subtasks
    ( ( !STACK ?auto_107295 ?auto_107296 )
      ( MAKE-4PILE ?auto_107290 ?auto_107291 ?auto_107292 ?auto_107293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107297 - BLOCK
      ?auto_107298 - BLOCK
      ?auto_107299 - BLOCK
      ?auto_107300 - BLOCK
    )
    :vars
    (
      ?auto_107301 - BLOCK
      ?auto_107303 - BLOCK
      ?auto_107302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107301 ?auto_107300 ) ( ON-TABLE ?auto_107297 ) ( ON ?auto_107298 ?auto_107297 ) ( ON ?auto_107299 ?auto_107298 ) ( ON ?auto_107300 ?auto_107299 ) ( not ( = ?auto_107297 ?auto_107298 ) ) ( not ( = ?auto_107297 ?auto_107299 ) ) ( not ( = ?auto_107297 ?auto_107300 ) ) ( not ( = ?auto_107297 ?auto_107301 ) ) ( not ( = ?auto_107298 ?auto_107299 ) ) ( not ( = ?auto_107298 ?auto_107300 ) ) ( not ( = ?auto_107298 ?auto_107301 ) ) ( not ( = ?auto_107299 ?auto_107300 ) ) ( not ( = ?auto_107299 ?auto_107301 ) ) ( not ( = ?auto_107300 ?auto_107301 ) ) ( CLEAR ?auto_107303 ) ( not ( = ?auto_107297 ?auto_107302 ) ) ( not ( = ?auto_107297 ?auto_107303 ) ) ( not ( = ?auto_107298 ?auto_107302 ) ) ( not ( = ?auto_107298 ?auto_107303 ) ) ( not ( = ?auto_107299 ?auto_107302 ) ) ( not ( = ?auto_107299 ?auto_107303 ) ) ( not ( = ?auto_107300 ?auto_107302 ) ) ( not ( = ?auto_107300 ?auto_107303 ) ) ( not ( = ?auto_107301 ?auto_107302 ) ) ( not ( = ?auto_107301 ?auto_107303 ) ) ( not ( = ?auto_107302 ?auto_107303 ) ) ( ON ?auto_107302 ?auto_107301 ) ( CLEAR ?auto_107302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107297 ?auto_107298 ?auto_107299 ?auto_107300 ?auto_107301 )
      ( MAKE-4PILE ?auto_107297 ?auto_107298 ?auto_107299 ?auto_107300 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107304 - BLOCK
      ?auto_107305 - BLOCK
      ?auto_107306 - BLOCK
      ?auto_107307 - BLOCK
    )
    :vars
    (
      ?auto_107308 - BLOCK
      ?auto_107310 - BLOCK
      ?auto_107309 - BLOCK
      ?auto_107311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107308 ?auto_107307 ) ( ON-TABLE ?auto_107304 ) ( ON ?auto_107305 ?auto_107304 ) ( ON ?auto_107306 ?auto_107305 ) ( ON ?auto_107307 ?auto_107306 ) ( not ( = ?auto_107304 ?auto_107305 ) ) ( not ( = ?auto_107304 ?auto_107306 ) ) ( not ( = ?auto_107304 ?auto_107307 ) ) ( not ( = ?auto_107304 ?auto_107308 ) ) ( not ( = ?auto_107305 ?auto_107306 ) ) ( not ( = ?auto_107305 ?auto_107307 ) ) ( not ( = ?auto_107305 ?auto_107308 ) ) ( not ( = ?auto_107306 ?auto_107307 ) ) ( not ( = ?auto_107306 ?auto_107308 ) ) ( not ( = ?auto_107307 ?auto_107308 ) ) ( not ( = ?auto_107304 ?auto_107310 ) ) ( not ( = ?auto_107304 ?auto_107309 ) ) ( not ( = ?auto_107305 ?auto_107310 ) ) ( not ( = ?auto_107305 ?auto_107309 ) ) ( not ( = ?auto_107306 ?auto_107310 ) ) ( not ( = ?auto_107306 ?auto_107309 ) ) ( not ( = ?auto_107307 ?auto_107310 ) ) ( not ( = ?auto_107307 ?auto_107309 ) ) ( not ( = ?auto_107308 ?auto_107310 ) ) ( not ( = ?auto_107308 ?auto_107309 ) ) ( not ( = ?auto_107310 ?auto_107309 ) ) ( ON ?auto_107310 ?auto_107308 ) ( CLEAR ?auto_107310 ) ( HOLDING ?auto_107309 ) ( CLEAR ?auto_107311 ) ( ON-TABLE ?auto_107311 ) ( not ( = ?auto_107311 ?auto_107309 ) ) ( not ( = ?auto_107304 ?auto_107311 ) ) ( not ( = ?auto_107305 ?auto_107311 ) ) ( not ( = ?auto_107306 ?auto_107311 ) ) ( not ( = ?auto_107307 ?auto_107311 ) ) ( not ( = ?auto_107308 ?auto_107311 ) ) ( not ( = ?auto_107310 ?auto_107311 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107311 ?auto_107309 )
      ( MAKE-4PILE ?auto_107304 ?auto_107305 ?auto_107306 ?auto_107307 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107312 - BLOCK
      ?auto_107313 - BLOCK
      ?auto_107314 - BLOCK
      ?auto_107315 - BLOCK
    )
    :vars
    (
      ?auto_107316 - BLOCK
      ?auto_107318 - BLOCK
      ?auto_107317 - BLOCK
      ?auto_107319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107316 ?auto_107315 ) ( ON-TABLE ?auto_107312 ) ( ON ?auto_107313 ?auto_107312 ) ( ON ?auto_107314 ?auto_107313 ) ( ON ?auto_107315 ?auto_107314 ) ( not ( = ?auto_107312 ?auto_107313 ) ) ( not ( = ?auto_107312 ?auto_107314 ) ) ( not ( = ?auto_107312 ?auto_107315 ) ) ( not ( = ?auto_107312 ?auto_107316 ) ) ( not ( = ?auto_107313 ?auto_107314 ) ) ( not ( = ?auto_107313 ?auto_107315 ) ) ( not ( = ?auto_107313 ?auto_107316 ) ) ( not ( = ?auto_107314 ?auto_107315 ) ) ( not ( = ?auto_107314 ?auto_107316 ) ) ( not ( = ?auto_107315 ?auto_107316 ) ) ( not ( = ?auto_107312 ?auto_107318 ) ) ( not ( = ?auto_107312 ?auto_107317 ) ) ( not ( = ?auto_107313 ?auto_107318 ) ) ( not ( = ?auto_107313 ?auto_107317 ) ) ( not ( = ?auto_107314 ?auto_107318 ) ) ( not ( = ?auto_107314 ?auto_107317 ) ) ( not ( = ?auto_107315 ?auto_107318 ) ) ( not ( = ?auto_107315 ?auto_107317 ) ) ( not ( = ?auto_107316 ?auto_107318 ) ) ( not ( = ?auto_107316 ?auto_107317 ) ) ( not ( = ?auto_107318 ?auto_107317 ) ) ( ON ?auto_107318 ?auto_107316 ) ( CLEAR ?auto_107319 ) ( ON-TABLE ?auto_107319 ) ( not ( = ?auto_107319 ?auto_107317 ) ) ( not ( = ?auto_107312 ?auto_107319 ) ) ( not ( = ?auto_107313 ?auto_107319 ) ) ( not ( = ?auto_107314 ?auto_107319 ) ) ( not ( = ?auto_107315 ?auto_107319 ) ) ( not ( = ?auto_107316 ?auto_107319 ) ) ( not ( = ?auto_107318 ?auto_107319 ) ) ( ON ?auto_107317 ?auto_107318 ) ( CLEAR ?auto_107317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107312 ?auto_107313 ?auto_107314 ?auto_107315 ?auto_107316 ?auto_107318 )
      ( MAKE-4PILE ?auto_107312 ?auto_107313 ?auto_107314 ?auto_107315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107320 - BLOCK
      ?auto_107321 - BLOCK
      ?auto_107322 - BLOCK
      ?auto_107323 - BLOCK
    )
    :vars
    (
      ?auto_107324 - BLOCK
      ?auto_107325 - BLOCK
      ?auto_107326 - BLOCK
      ?auto_107327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107324 ?auto_107323 ) ( ON-TABLE ?auto_107320 ) ( ON ?auto_107321 ?auto_107320 ) ( ON ?auto_107322 ?auto_107321 ) ( ON ?auto_107323 ?auto_107322 ) ( not ( = ?auto_107320 ?auto_107321 ) ) ( not ( = ?auto_107320 ?auto_107322 ) ) ( not ( = ?auto_107320 ?auto_107323 ) ) ( not ( = ?auto_107320 ?auto_107324 ) ) ( not ( = ?auto_107321 ?auto_107322 ) ) ( not ( = ?auto_107321 ?auto_107323 ) ) ( not ( = ?auto_107321 ?auto_107324 ) ) ( not ( = ?auto_107322 ?auto_107323 ) ) ( not ( = ?auto_107322 ?auto_107324 ) ) ( not ( = ?auto_107323 ?auto_107324 ) ) ( not ( = ?auto_107320 ?auto_107325 ) ) ( not ( = ?auto_107320 ?auto_107326 ) ) ( not ( = ?auto_107321 ?auto_107325 ) ) ( not ( = ?auto_107321 ?auto_107326 ) ) ( not ( = ?auto_107322 ?auto_107325 ) ) ( not ( = ?auto_107322 ?auto_107326 ) ) ( not ( = ?auto_107323 ?auto_107325 ) ) ( not ( = ?auto_107323 ?auto_107326 ) ) ( not ( = ?auto_107324 ?auto_107325 ) ) ( not ( = ?auto_107324 ?auto_107326 ) ) ( not ( = ?auto_107325 ?auto_107326 ) ) ( ON ?auto_107325 ?auto_107324 ) ( not ( = ?auto_107327 ?auto_107326 ) ) ( not ( = ?auto_107320 ?auto_107327 ) ) ( not ( = ?auto_107321 ?auto_107327 ) ) ( not ( = ?auto_107322 ?auto_107327 ) ) ( not ( = ?auto_107323 ?auto_107327 ) ) ( not ( = ?auto_107324 ?auto_107327 ) ) ( not ( = ?auto_107325 ?auto_107327 ) ) ( ON ?auto_107326 ?auto_107325 ) ( CLEAR ?auto_107326 ) ( HOLDING ?auto_107327 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107327 )
      ( MAKE-4PILE ?auto_107320 ?auto_107321 ?auto_107322 ?auto_107323 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107328 - BLOCK
      ?auto_107329 - BLOCK
      ?auto_107330 - BLOCK
      ?auto_107331 - BLOCK
    )
    :vars
    (
      ?auto_107335 - BLOCK
      ?auto_107333 - BLOCK
      ?auto_107334 - BLOCK
      ?auto_107332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107335 ?auto_107331 ) ( ON-TABLE ?auto_107328 ) ( ON ?auto_107329 ?auto_107328 ) ( ON ?auto_107330 ?auto_107329 ) ( ON ?auto_107331 ?auto_107330 ) ( not ( = ?auto_107328 ?auto_107329 ) ) ( not ( = ?auto_107328 ?auto_107330 ) ) ( not ( = ?auto_107328 ?auto_107331 ) ) ( not ( = ?auto_107328 ?auto_107335 ) ) ( not ( = ?auto_107329 ?auto_107330 ) ) ( not ( = ?auto_107329 ?auto_107331 ) ) ( not ( = ?auto_107329 ?auto_107335 ) ) ( not ( = ?auto_107330 ?auto_107331 ) ) ( not ( = ?auto_107330 ?auto_107335 ) ) ( not ( = ?auto_107331 ?auto_107335 ) ) ( not ( = ?auto_107328 ?auto_107333 ) ) ( not ( = ?auto_107328 ?auto_107334 ) ) ( not ( = ?auto_107329 ?auto_107333 ) ) ( not ( = ?auto_107329 ?auto_107334 ) ) ( not ( = ?auto_107330 ?auto_107333 ) ) ( not ( = ?auto_107330 ?auto_107334 ) ) ( not ( = ?auto_107331 ?auto_107333 ) ) ( not ( = ?auto_107331 ?auto_107334 ) ) ( not ( = ?auto_107335 ?auto_107333 ) ) ( not ( = ?auto_107335 ?auto_107334 ) ) ( not ( = ?auto_107333 ?auto_107334 ) ) ( ON ?auto_107333 ?auto_107335 ) ( not ( = ?auto_107332 ?auto_107334 ) ) ( not ( = ?auto_107328 ?auto_107332 ) ) ( not ( = ?auto_107329 ?auto_107332 ) ) ( not ( = ?auto_107330 ?auto_107332 ) ) ( not ( = ?auto_107331 ?auto_107332 ) ) ( not ( = ?auto_107335 ?auto_107332 ) ) ( not ( = ?auto_107333 ?auto_107332 ) ) ( ON ?auto_107334 ?auto_107333 ) ( ON ?auto_107332 ?auto_107334 ) ( CLEAR ?auto_107332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107328 ?auto_107329 ?auto_107330 ?auto_107331 ?auto_107335 ?auto_107333 ?auto_107334 )
      ( MAKE-4PILE ?auto_107328 ?auto_107329 ?auto_107330 ?auto_107331 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107340 - BLOCK
      ?auto_107341 - BLOCK
      ?auto_107342 - BLOCK
      ?auto_107343 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_107343 ) ( CLEAR ?auto_107342 ) ( ON-TABLE ?auto_107340 ) ( ON ?auto_107341 ?auto_107340 ) ( ON ?auto_107342 ?auto_107341 ) ( not ( = ?auto_107340 ?auto_107341 ) ) ( not ( = ?auto_107340 ?auto_107342 ) ) ( not ( = ?auto_107340 ?auto_107343 ) ) ( not ( = ?auto_107341 ?auto_107342 ) ) ( not ( = ?auto_107341 ?auto_107343 ) ) ( not ( = ?auto_107342 ?auto_107343 ) ) )
    :subtasks
    ( ( !STACK ?auto_107343 ?auto_107342 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107344 - BLOCK
      ?auto_107345 - BLOCK
      ?auto_107346 - BLOCK
      ?auto_107347 - BLOCK
    )
    :vars
    (
      ?auto_107348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107346 ) ( ON-TABLE ?auto_107344 ) ( ON ?auto_107345 ?auto_107344 ) ( ON ?auto_107346 ?auto_107345 ) ( not ( = ?auto_107344 ?auto_107345 ) ) ( not ( = ?auto_107344 ?auto_107346 ) ) ( not ( = ?auto_107344 ?auto_107347 ) ) ( not ( = ?auto_107345 ?auto_107346 ) ) ( not ( = ?auto_107345 ?auto_107347 ) ) ( not ( = ?auto_107346 ?auto_107347 ) ) ( ON ?auto_107347 ?auto_107348 ) ( CLEAR ?auto_107347 ) ( HAND-EMPTY ) ( not ( = ?auto_107344 ?auto_107348 ) ) ( not ( = ?auto_107345 ?auto_107348 ) ) ( not ( = ?auto_107346 ?auto_107348 ) ) ( not ( = ?auto_107347 ?auto_107348 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107347 ?auto_107348 )
      ( MAKE-4PILE ?auto_107344 ?auto_107345 ?auto_107346 ?auto_107347 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107349 - BLOCK
      ?auto_107350 - BLOCK
      ?auto_107351 - BLOCK
      ?auto_107352 - BLOCK
    )
    :vars
    (
      ?auto_107353 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107349 ) ( ON ?auto_107350 ?auto_107349 ) ( not ( = ?auto_107349 ?auto_107350 ) ) ( not ( = ?auto_107349 ?auto_107351 ) ) ( not ( = ?auto_107349 ?auto_107352 ) ) ( not ( = ?auto_107350 ?auto_107351 ) ) ( not ( = ?auto_107350 ?auto_107352 ) ) ( not ( = ?auto_107351 ?auto_107352 ) ) ( ON ?auto_107352 ?auto_107353 ) ( CLEAR ?auto_107352 ) ( not ( = ?auto_107349 ?auto_107353 ) ) ( not ( = ?auto_107350 ?auto_107353 ) ) ( not ( = ?auto_107351 ?auto_107353 ) ) ( not ( = ?auto_107352 ?auto_107353 ) ) ( HOLDING ?auto_107351 ) ( CLEAR ?auto_107350 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107349 ?auto_107350 ?auto_107351 )
      ( MAKE-4PILE ?auto_107349 ?auto_107350 ?auto_107351 ?auto_107352 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107354 - BLOCK
      ?auto_107355 - BLOCK
      ?auto_107356 - BLOCK
      ?auto_107357 - BLOCK
    )
    :vars
    (
      ?auto_107358 - BLOCK
      ?auto_107360 - BLOCK
      ?auto_107361 - BLOCK
      ?auto_107359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107354 ) ( ON ?auto_107355 ?auto_107354 ) ( not ( = ?auto_107354 ?auto_107355 ) ) ( not ( = ?auto_107354 ?auto_107356 ) ) ( not ( = ?auto_107354 ?auto_107357 ) ) ( not ( = ?auto_107355 ?auto_107356 ) ) ( not ( = ?auto_107355 ?auto_107357 ) ) ( not ( = ?auto_107356 ?auto_107357 ) ) ( ON ?auto_107357 ?auto_107358 ) ( not ( = ?auto_107354 ?auto_107358 ) ) ( not ( = ?auto_107355 ?auto_107358 ) ) ( not ( = ?auto_107356 ?auto_107358 ) ) ( not ( = ?auto_107357 ?auto_107358 ) ) ( CLEAR ?auto_107355 ) ( ON ?auto_107356 ?auto_107357 ) ( CLEAR ?auto_107356 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107360 ) ( ON ?auto_107361 ?auto_107360 ) ( ON ?auto_107359 ?auto_107361 ) ( ON ?auto_107358 ?auto_107359 ) ( not ( = ?auto_107360 ?auto_107361 ) ) ( not ( = ?auto_107360 ?auto_107359 ) ) ( not ( = ?auto_107360 ?auto_107358 ) ) ( not ( = ?auto_107360 ?auto_107357 ) ) ( not ( = ?auto_107360 ?auto_107356 ) ) ( not ( = ?auto_107361 ?auto_107359 ) ) ( not ( = ?auto_107361 ?auto_107358 ) ) ( not ( = ?auto_107361 ?auto_107357 ) ) ( not ( = ?auto_107361 ?auto_107356 ) ) ( not ( = ?auto_107359 ?auto_107358 ) ) ( not ( = ?auto_107359 ?auto_107357 ) ) ( not ( = ?auto_107359 ?auto_107356 ) ) ( not ( = ?auto_107354 ?auto_107360 ) ) ( not ( = ?auto_107354 ?auto_107361 ) ) ( not ( = ?auto_107354 ?auto_107359 ) ) ( not ( = ?auto_107355 ?auto_107360 ) ) ( not ( = ?auto_107355 ?auto_107361 ) ) ( not ( = ?auto_107355 ?auto_107359 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107360 ?auto_107361 ?auto_107359 ?auto_107358 ?auto_107357 )
      ( MAKE-4PILE ?auto_107354 ?auto_107355 ?auto_107356 ?auto_107357 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107362 - BLOCK
      ?auto_107363 - BLOCK
      ?auto_107364 - BLOCK
      ?auto_107365 - BLOCK
    )
    :vars
    (
      ?auto_107367 - BLOCK
      ?auto_107366 - BLOCK
      ?auto_107369 - BLOCK
      ?auto_107368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107362 ) ( not ( = ?auto_107362 ?auto_107363 ) ) ( not ( = ?auto_107362 ?auto_107364 ) ) ( not ( = ?auto_107362 ?auto_107365 ) ) ( not ( = ?auto_107363 ?auto_107364 ) ) ( not ( = ?auto_107363 ?auto_107365 ) ) ( not ( = ?auto_107364 ?auto_107365 ) ) ( ON ?auto_107365 ?auto_107367 ) ( not ( = ?auto_107362 ?auto_107367 ) ) ( not ( = ?auto_107363 ?auto_107367 ) ) ( not ( = ?auto_107364 ?auto_107367 ) ) ( not ( = ?auto_107365 ?auto_107367 ) ) ( ON ?auto_107364 ?auto_107365 ) ( CLEAR ?auto_107364 ) ( ON-TABLE ?auto_107366 ) ( ON ?auto_107369 ?auto_107366 ) ( ON ?auto_107368 ?auto_107369 ) ( ON ?auto_107367 ?auto_107368 ) ( not ( = ?auto_107366 ?auto_107369 ) ) ( not ( = ?auto_107366 ?auto_107368 ) ) ( not ( = ?auto_107366 ?auto_107367 ) ) ( not ( = ?auto_107366 ?auto_107365 ) ) ( not ( = ?auto_107366 ?auto_107364 ) ) ( not ( = ?auto_107369 ?auto_107368 ) ) ( not ( = ?auto_107369 ?auto_107367 ) ) ( not ( = ?auto_107369 ?auto_107365 ) ) ( not ( = ?auto_107369 ?auto_107364 ) ) ( not ( = ?auto_107368 ?auto_107367 ) ) ( not ( = ?auto_107368 ?auto_107365 ) ) ( not ( = ?auto_107368 ?auto_107364 ) ) ( not ( = ?auto_107362 ?auto_107366 ) ) ( not ( = ?auto_107362 ?auto_107369 ) ) ( not ( = ?auto_107362 ?auto_107368 ) ) ( not ( = ?auto_107363 ?auto_107366 ) ) ( not ( = ?auto_107363 ?auto_107369 ) ) ( not ( = ?auto_107363 ?auto_107368 ) ) ( HOLDING ?auto_107363 ) ( CLEAR ?auto_107362 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107362 ?auto_107363 )
      ( MAKE-4PILE ?auto_107362 ?auto_107363 ?auto_107364 ?auto_107365 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107370 - BLOCK
      ?auto_107371 - BLOCK
      ?auto_107372 - BLOCK
      ?auto_107373 - BLOCK
    )
    :vars
    (
      ?auto_107375 - BLOCK
      ?auto_107374 - BLOCK
      ?auto_107377 - BLOCK
      ?auto_107376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107370 ) ( not ( = ?auto_107370 ?auto_107371 ) ) ( not ( = ?auto_107370 ?auto_107372 ) ) ( not ( = ?auto_107370 ?auto_107373 ) ) ( not ( = ?auto_107371 ?auto_107372 ) ) ( not ( = ?auto_107371 ?auto_107373 ) ) ( not ( = ?auto_107372 ?auto_107373 ) ) ( ON ?auto_107373 ?auto_107375 ) ( not ( = ?auto_107370 ?auto_107375 ) ) ( not ( = ?auto_107371 ?auto_107375 ) ) ( not ( = ?auto_107372 ?auto_107375 ) ) ( not ( = ?auto_107373 ?auto_107375 ) ) ( ON ?auto_107372 ?auto_107373 ) ( ON-TABLE ?auto_107374 ) ( ON ?auto_107377 ?auto_107374 ) ( ON ?auto_107376 ?auto_107377 ) ( ON ?auto_107375 ?auto_107376 ) ( not ( = ?auto_107374 ?auto_107377 ) ) ( not ( = ?auto_107374 ?auto_107376 ) ) ( not ( = ?auto_107374 ?auto_107375 ) ) ( not ( = ?auto_107374 ?auto_107373 ) ) ( not ( = ?auto_107374 ?auto_107372 ) ) ( not ( = ?auto_107377 ?auto_107376 ) ) ( not ( = ?auto_107377 ?auto_107375 ) ) ( not ( = ?auto_107377 ?auto_107373 ) ) ( not ( = ?auto_107377 ?auto_107372 ) ) ( not ( = ?auto_107376 ?auto_107375 ) ) ( not ( = ?auto_107376 ?auto_107373 ) ) ( not ( = ?auto_107376 ?auto_107372 ) ) ( not ( = ?auto_107370 ?auto_107374 ) ) ( not ( = ?auto_107370 ?auto_107377 ) ) ( not ( = ?auto_107370 ?auto_107376 ) ) ( not ( = ?auto_107371 ?auto_107374 ) ) ( not ( = ?auto_107371 ?auto_107377 ) ) ( not ( = ?auto_107371 ?auto_107376 ) ) ( CLEAR ?auto_107370 ) ( ON ?auto_107371 ?auto_107372 ) ( CLEAR ?auto_107371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107374 ?auto_107377 ?auto_107376 ?auto_107375 ?auto_107373 ?auto_107372 )
      ( MAKE-4PILE ?auto_107370 ?auto_107371 ?auto_107372 ?auto_107373 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107378 - BLOCK
      ?auto_107379 - BLOCK
      ?auto_107380 - BLOCK
      ?auto_107381 - BLOCK
    )
    :vars
    (
      ?auto_107385 - BLOCK
      ?auto_107384 - BLOCK
      ?auto_107383 - BLOCK
      ?auto_107382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107378 ?auto_107379 ) ) ( not ( = ?auto_107378 ?auto_107380 ) ) ( not ( = ?auto_107378 ?auto_107381 ) ) ( not ( = ?auto_107379 ?auto_107380 ) ) ( not ( = ?auto_107379 ?auto_107381 ) ) ( not ( = ?auto_107380 ?auto_107381 ) ) ( ON ?auto_107381 ?auto_107385 ) ( not ( = ?auto_107378 ?auto_107385 ) ) ( not ( = ?auto_107379 ?auto_107385 ) ) ( not ( = ?auto_107380 ?auto_107385 ) ) ( not ( = ?auto_107381 ?auto_107385 ) ) ( ON ?auto_107380 ?auto_107381 ) ( ON-TABLE ?auto_107384 ) ( ON ?auto_107383 ?auto_107384 ) ( ON ?auto_107382 ?auto_107383 ) ( ON ?auto_107385 ?auto_107382 ) ( not ( = ?auto_107384 ?auto_107383 ) ) ( not ( = ?auto_107384 ?auto_107382 ) ) ( not ( = ?auto_107384 ?auto_107385 ) ) ( not ( = ?auto_107384 ?auto_107381 ) ) ( not ( = ?auto_107384 ?auto_107380 ) ) ( not ( = ?auto_107383 ?auto_107382 ) ) ( not ( = ?auto_107383 ?auto_107385 ) ) ( not ( = ?auto_107383 ?auto_107381 ) ) ( not ( = ?auto_107383 ?auto_107380 ) ) ( not ( = ?auto_107382 ?auto_107385 ) ) ( not ( = ?auto_107382 ?auto_107381 ) ) ( not ( = ?auto_107382 ?auto_107380 ) ) ( not ( = ?auto_107378 ?auto_107384 ) ) ( not ( = ?auto_107378 ?auto_107383 ) ) ( not ( = ?auto_107378 ?auto_107382 ) ) ( not ( = ?auto_107379 ?auto_107384 ) ) ( not ( = ?auto_107379 ?auto_107383 ) ) ( not ( = ?auto_107379 ?auto_107382 ) ) ( ON ?auto_107379 ?auto_107380 ) ( CLEAR ?auto_107379 ) ( HOLDING ?auto_107378 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107378 )
      ( MAKE-4PILE ?auto_107378 ?auto_107379 ?auto_107380 ?auto_107381 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_107386 - BLOCK
      ?auto_107387 - BLOCK
      ?auto_107388 - BLOCK
      ?auto_107389 - BLOCK
    )
    :vars
    (
      ?auto_107391 - BLOCK
      ?auto_107392 - BLOCK
      ?auto_107393 - BLOCK
      ?auto_107390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107386 ?auto_107387 ) ) ( not ( = ?auto_107386 ?auto_107388 ) ) ( not ( = ?auto_107386 ?auto_107389 ) ) ( not ( = ?auto_107387 ?auto_107388 ) ) ( not ( = ?auto_107387 ?auto_107389 ) ) ( not ( = ?auto_107388 ?auto_107389 ) ) ( ON ?auto_107389 ?auto_107391 ) ( not ( = ?auto_107386 ?auto_107391 ) ) ( not ( = ?auto_107387 ?auto_107391 ) ) ( not ( = ?auto_107388 ?auto_107391 ) ) ( not ( = ?auto_107389 ?auto_107391 ) ) ( ON ?auto_107388 ?auto_107389 ) ( ON-TABLE ?auto_107392 ) ( ON ?auto_107393 ?auto_107392 ) ( ON ?auto_107390 ?auto_107393 ) ( ON ?auto_107391 ?auto_107390 ) ( not ( = ?auto_107392 ?auto_107393 ) ) ( not ( = ?auto_107392 ?auto_107390 ) ) ( not ( = ?auto_107392 ?auto_107391 ) ) ( not ( = ?auto_107392 ?auto_107389 ) ) ( not ( = ?auto_107392 ?auto_107388 ) ) ( not ( = ?auto_107393 ?auto_107390 ) ) ( not ( = ?auto_107393 ?auto_107391 ) ) ( not ( = ?auto_107393 ?auto_107389 ) ) ( not ( = ?auto_107393 ?auto_107388 ) ) ( not ( = ?auto_107390 ?auto_107391 ) ) ( not ( = ?auto_107390 ?auto_107389 ) ) ( not ( = ?auto_107390 ?auto_107388 ) ) ( not ( = ?auto_107386 ?auto_107392 ) ) ( not ( = ?auto_107386 ?auto_107393 ) ) ( not ( = ?auto_107386 ?auto_107390 ) ) ( not ( = ?auto_107387 ?auto_107392 ) ) ( not ( = ?auto_107387 ?auto_107393 ) ) ( not ( = ?auto_107387 ?auto_107390 ) ) ( ON ?auto_107387 ?auto_107388 ) ( ON ?auto_107386 ?auto_107387 ) ( CLEAR ?auto_107386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107392 ?auto_107393 ?auto_107390 ?auto_107391 ?auto_107389 ?auto_107388 ?auto_107387 )
      ( MAKE-4PILE ?auto_107386 ?auto_107387 ?auto_107388 ?auto_107389 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107397 - BLOCK
      ?auto_107398 - BLOCK
      ?auto_107399 - BLOCK
    )
    :vars
    (
      ?auto_107400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107400 ?auto_107399 ) ( CLEAR ?auto_107400 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107397 ) ( ON ?auto_107398 ?auto_107397 ) ( ON ?auto_107399 ?auto_107398 ) ( not ( = ?auto_107397 ?auto_107398 ) ) ( not ( = ?auto_107397 ?auto_107399 ) ) ( not ( = ?auto_107397 ?auto_107400 ) ) ( not ( = ?auto_107398 ?auto_107399 ) ) ( not ( = ?auto_107398 ?auto_107400 ) ) ( not ( = ?auto_107399 ?auto_107400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107400 ?auto_107399 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107401 - BLOCK
      ?auto_107402 - BLOCK
      ?auto_107403 - BLOCK
    )
    :vars
    (
      ?auto_107404 - BLOCK
      ?auto_107405 - BLOCK
      ?auto_107406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107404 ?auto_107403 ) ( CLEAR ?auto_107404 ) ( ON-TABLE ?auto_107401 ) ( ON ?auto_107402 ?auto_107401 ) ( ON ?auto_107403 ?auto_107402 ) ( not ( = ?auto_107401 ?auto_107402 ) ) ( not ( = ?auto_107401 ?auto_107403 ) ) ( not ( = ?auto_107401 ?auto_107404 ) ) ( not ( = ?auto_107402 ?auto_107403 ) ) ( not ( = ?auto_107402 ?auto_107404 ) ) ( not ( = ?auto_107403 ?auto_107404 ) ) ( HOLDING ?auto_107405 ) ( CLEAR ?auto_107406 ) ( not ( = ?auto_107401 ?auto_107405 ) ) ( not ( = ?auto_107401 ?auto_107406 ) ) ( not ( = ?auto_107402 ?auto_107405 ) ) ( not ( = ?auto_107402 ?auto_107406 ) ) ( not ( = ?auto_107403 ?auto_107405 ) ) ( not ( = ?auto_107403 ?auto_107406 ) ) ( not ( = ?auto_107404 ?auto_107405 ) ) ( not ( = ?auto_107404 ?auto_107406 ) ) ( not ( = ?auto_107405 ?auto_107406 ) ) )
    :subtasks
    ( ( !STACK ?auto_107405 ?auto_107406 )
      ( MAKE-3PILE ?auto_107401 ?auto_107402 ?auto_107403 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107407 - BLOCK
      ?auto_107408 - BLOCK
      ?auto_107409 - BLOCK
    )
    :vars
    (
      ?auto_107410 - BLOCK
      ?auto_107411 - BLOCK
      ?auto_107412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107410 ?auto_107409 ) ( ON-TABLE ?auto_107407 ) ( ON ?auto_107408 ?auto_107407 ) ( ON ?auto_107409 ?auto_107408 ) ( not ( = ?auto_107407 ?auto_107408 ) ) ( not ( = ?auto_107407 ?auto_107409 ) ) ( not ( = ?auto_107407 ?auto_107410 ) ) ( not ( = ?auto_107408 ?auto_107409 ) ) ( not ( = ?auto_107408 ?auto_107410 ) ) ( not ( = ?auto_107409 ?auto_107410 ) ) ( CLEAR ?auto_107411 ) ( not ( = ?auto_107407 ?auto_107412 ) ) ( not ( = ?auto_107407 ?auto_107411 ) ) ( not ( = ?auto_107408 ?auto_107412 ) ) ( not ( = ?auto_107408 ?auto_107411 ) ) ( not ( = ?auto_107409 ?auto_107412 ) ) ( not ( = ?auto_107409 ?auto_107411 ) ) ( not ( = ?auto_107410 ?auto_107412 ) ) ( not ( = ?auto_107410 ?auto_107411 ) ) ( not ( = ?auto_107412 ?auto_107411 ) ) ( ON ?auto_107412 ?auto_107410 ) ( CLEAR ?auto_107412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107407 ?auto_107408 ?auto_107409 ?auto_107410 )
      ( MAKE-3PILE ?auto_107407 ?auto_107408 ?auto_107409 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107413 - BLOCK
      ?auto_107414 - BLOCK
      ?auto_107415 - BLOCK
    )
    :vars
    (
      ?auto_107416 - BLOCK
      ?auto_107417 - BLOCK
      ?auto_107418 - BLOCK
      ?auto_107420 - BLOCK
      ?auto_107419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107416 ?auto_107415 ) ( ON-TABLE ?auto_107413 ) ( ON ?auto_107414 ?auto_107413 ) ( ON ?auto_107415 ?auto_107414 ) ( not ( = ?auto_107413 ?auto_107414 ) ) ( not ( = ?auto_107413 ?auto_107415 ) ) ( not ( = ?auto_107413 ?auto_107416 ) ) ( not ( = ?auto_107414 ?auto_107415 ) ) ( not ( = ?auto_107414 ?auto_107416 ) ) ( not ( = ?auto_107415 ?auto_107416 ) ) ( not ( = ?auto_107413 ?auto_107417 ) ) ( not ( = ?auto_107413 ?auto_107418 ) ) ( not ( = ?auto_107414 ?auto_107417 ) ) ( not ( = ?auto_107414 ?auto_107418 ) ) ( not ( = ?auto_107415 ?auto_107417 ) ) ( not ( = ?auto_107415 ?auto_107418 ) ) ( not ( = ?auto_107416 ?auto_107417 ) ) ( not ( = ?auto_107416 ?auto_107418 ) ) ( not ( = ?auto_107417 ?auto_107418 ) ) ( ON ?auto_107417 ?auto_107416 ) ( CLEAR ?auto_107417 ) ( HOLDING ?auto_107418 ) ( CLEAR ?auto_107420 ) ( ON-TABLE ?auto_107419 ) ( ON ?auto_107420 ?auto_107419 ) ( not ( = ?auto_107419 ?auto_107420 ) ) ( not ( = ?auto_107419 ?auto_107418 ) ) ( not ( = ?auto_107420 ?auto_107418 ) ) ( not ( = ?auto_107413 ?auto_107420 ) ) ( not ( = ?auto_107413 ?auto_107419 ) ) ( not ( = ?auto_107414 ?auto_107420 ) ) ( not ( = ?auto_107414 ?auto_107419 ) ) ( not ( = ?auto_107415 ?auto_107420 ) ) ( not ( = ?auto_107415 ?auto_107419 ) ) ( not ( = ?auto_107416 ?auto_107420 ) ) ( not ( = ?auto_107416 ?auto_107419 ) ) ( not ( = ?auto_107417 ?auto_107420 ) ) ( not ( = ?auto_107417 ?auto_107419 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107419 ?auto_107420 ?auto_107418 )
      ( MAKE-3PILE ?auto_107413 ?auto_107414 ?auto_107415 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107421 - BLOCK
      ?auto_107422 - BLOCK
      ?auto_107423 - BLOCK
    )
    :vars
    (
      ?auto_107426 - BLOCK
      ?auto_107424 - BLOCK
      ?auto_107425 - BLOCK
      ?auto_107428 - BLOCK
      ?auto_107427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107426 ?auto_107423 ) ( ON-TABLE ?auto_107421 ) ( ON ?auto_107422 ?auto_107421 ) ( ON ?auto_107423 ?auto_107422 ) ( not ( = ?auto_107421 ?auto_107422 ) ) ( not ( = ?auto_107421 ?auto_107423 ) ) ( not ( = ?auto_107421 ?auto_107426 ) ) ( not ( = ?auto_107422 ?auto_107423 ) ) ( not ( = ?auto_107422 ?auto_107426 ) ) ( not ( = ?auto_107423 ?auto_107426 ) ) ( not ( = ?auto_107421 ?auto_107424 ) ) ( not ( = ?auto_107421 ?auto_107425 ) ) ( not ( = ?auto_107422 ?auto_107424 ) ) ( not ( = ?auto_107422 ?auto_107425 ) ) ( not ( = ?auto_107423 ?auto_107424 ) ) ( not ( = ?auto_107423 ?auto_107425 ) ) ( not ( = ?auto_107426 ?auto_107424 ) ) ( not ( = ?auto_107426 ?auto_107425 ) ) ( not ( = ?auto_107424 ?auto_107425 ) ) ( ON ?auto_107424 ?auto_107426 ) ( CLEAR ?auto_107428 ) ( ON-TABLE ?auto_107427 ) ( ON ?auto_107428 ?auto_107427 ) ( not ( = ?auto_107427 ?auto_107428 ) ) ( not ( = ?auto_107427 ?auto_107425 ) ) ( not ( = ?auto_107428 ?auto_107425 ) ) ( not ( = ?auto_107421 ?auto_107428 ) ) ( not ( = ?auto_107421 ?auto_107427 ) ) ( not ( = ?auto_107422 ?auto_107428 ) ) ( not ( = ?auto_107422 ?auto_107427 ) ) ( not ( = ?auto_107423 ?auto_107428 ) ) ( not ( = ?auto_107423 ?auto_107427 ) ) ( not ( = ?auto_107426 ?auto_107428 ) ) ( not ( = ?auto_107426 ?auto_107427 ) ) ( not ( = ?auto_107424 ?auto_107428 ) ) ( not ( = ?auto_107424 ?auto_107427 ) ) ( ON ?auto_107425 ?auto_107424 ) ( CLEAR ?auto_107425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107421 ?auto_107422 ?auto_107423 ?auto_107426 ?auto_107424 )
      ( MAKE-3PILE ?auto_107421 ?auto_107422 ?auto_107423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107429 - BLOCK
      ?auto_107430 - BLOCK
      ?auto_107431 - BLOCK
    )
    :vars
    (
      ?auto_107436 - BLOCK
      ?auto_107435 - BLOCK
      ?auto_107432 - BLOCK
      ?auto_107433 - BLOCK
      ?auto_107434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107436 ?auto_107431 ) ( ON-TABLE ?auto_107429 ) ( ON ?auto_107430 ?auto_107429 ) ( ON ?auto_107431 ?auto_107430 ) ( not ( = ?auto_107429 ?auto_107430 ) ) ( not ( = ?auto_107429 ?auto_107431 ) ) ( not ( = ?auto_107429 ?auto_107436 ) ) ( not ( = ?auto_107430 ?auto_107431 ) ) ( not ( = ?auto_107430 ?auto_107436 ) ) ( not ( = ?auto_107431 ?auto_107436 ) ) ( not ( = ?auto_107429 ?auto_107435 ) ) ( not ( = ?auto_107429 ?auto_107432 ) ) ( not ( = ?auto_107430 ?auto_107435 ) ) ( not ( = ?auto_107430 ?auto_107432 ) ) ( not ( = ?auto_107431 ?auto_107435 ) ) ( not ( = ?auto_107431 ?auto_107432 ) ) ( not ( = ?auto_107436 ?auto_107435 ) ) ( not ( = ?auto_107436 ?auto_107432 ) ) ( not ( = ?auto_107435 ?auto_107432 ) ) ( ON ?auto_107435 ?auto_107436 ) ( ON-TABLE ?auto_107433 ) ( not ( = ?auto_107433 ?auto_107434 ) ) ( not ( = ?auto_107433 ?auto_107432 ) ) ( not ( = ?auto_107434 ?auto_107432 ) ) ( not ( = ?auto_107429 ?auto_107434 ) ) ( not ( = ?auto_107429 ?auto_107433 ) ) ( not ( = ?auto_107430 ?auto_107434 ) ) ( not ( = ?auto_107430 ?auto_107433 ) ) ( not ( = ?auto_107431 ?auto_107434 ) ) ( not ( = ?auto_107431 ?auto_107433 ) ) ( not ( = ?auto_107436 ?auto_107434 ) ) ( not ( = ?auto_107436 ?auto_107433 ) ) ( not ( = ?auto_107435 ?auto_107434 ) ) ( not ( = ?auto_107435 ?auto_107433 ) ) ( ON ?auto_107432 ?auto_107435 ) ( CLEAR ?auto_107432 ) ( HOLDING ?auto_107434 ) ( CLEAR ?auto_107433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107433 ?auto_107434 )
      ( MAKE-3PILE ?auto_107429 ?auto_107430 ?auto_107431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107437 - BLOCK
      ?auto_107438 - BLOCK
      ?auto_107439 - BLOCK
    )
    :vars
    (
      ?auto_107443 - BLOCK
      ?auto_107440 - BLOCK
      ?auto_107442 - BLOCK
      ?auto_107441 - BLOCK
      ?auto_107444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107443 ?auto_107439 ) ( ON-TABLE ?auto_107437 ) ( ON ?auto_107438 ?auto_107437 ) ( ON ?auto_107439 ?auto_107438 ) ( not ( = ?auto_107437 ?auto_107438 ) ) ( not ( = ?auto_107437 ?auto_107439 ) ) ( not ( = ?auto_107437 ?auto_107443 ) ) ( not ( = ?auto_107438 ?auto_107439 ) ) ( not ( = ?auto_107438 ?auto_107443 ) ) ( not ( = ?auto_107439 ?auto_107443 ) ) ( not ( = ?auto_107437 ?auto_107440 ) ) ( not ( = ?auto_107437 ?auto_107442 ) ) ( not ( = ?auto_107438 ?auto_107440 ) ) ( not ( = ?auto_107438 ?auto_107442 ) ) ( not ( = ?auto_107439 ?auto_107440 ) ) ( not ( = ?auto_107439 ?auto_107442 ) ) ( not ( = ?auto_107443 ?auto_107440 ) ) ( not ( = ?auto_107443 ?auto_107442 ) ) ( not ( = ?auto_107440 ?auto_107442 ) ) ( ON ?auto_107440 ?auto_107443 ) ( ON-TABLE ?auto_107441 ) ( not ( = ?auto_107441 ?auto_107444 ) ) ( not ( = ?auto_107441 ?auto_107442 ) ) ( not ( = ?auto_107444 ?auto_107442 ) ) ( not ( = ?auto_107437 ?auto_107444 ) ) ( not ( = ?auto_107437 ?auto_107441 ) ) ( not ( = ?auto_107438 ?auto_107444 ) ) ( not ( = ?auto_107438 ?auto_107441 ) ) ( not ( = ?auto_107439 ?auto_107444 ) ) ( not ( = ?auto_107439 ?auto_107441 ) ) ( not ( = ?auto_107443 ?auto_107444 ) ) ( not ( = ?auto_107443 ?auto_107441 ) ) ( not ( = ?auto_107440 ?auto_107444 ) ) ( not ( = ?auto_107440 ?auto_107441 ) ) ( ON ?auto_107442 ?auto_107440 ) ( CLEAR ?auto_107441 ) ( ON ?auto_107444 ?auto_107442 ) ( CLEAR ?auto_107444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107437 ?auto_107438 ?auto_107439 ?auto_107443 ?auto_107440 ?auto_107442 )
      ( MAKE-3PILE ?auto_107437 ?auto_107438 ?auto_107439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107445 - BLOCK
      ?auto_107446 - BLOCK
      ?auto_107447 - BLOCK
    )
    :vars
    (
      ?auto_107448 - BLOCK
      ?auto_107452 - BLOCK
      ?auto_107449 - BLOCK
      ?auto_107451 - BLOCK
      ?auto_107450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107448 ?auto_107447 ) ( ON-TABLE ?auto_107445 ) ( ON ?auto_107446 ?auto_107445 ) ( ON ?auto_107447 ?auto_107446 ) ( not ( = ?auto_107445 ?auto_107446 ) ) ( not ( = ?auto_107445 ?auto_107447 ) ) ( not ( = ?auto_107445 ?auto_107448 ) ) ( not ( = ?auto_107446 ?auto_107447 ) ) ( not ( = ?auto_107446 ?auto_107448 ) ) ( not ( = ?auto_107447 ?auto_107448 ) ) ( not ( = ?auto_107445 ?auto_107452 ) ) ( not ( = ?auto_107445 ?auto_107449 ) ) ( not ( = ?auto_107446 ?auto_107452 ) ) ( not ( = ?auto_107446 ?auto_107449 ) ) ( not ( = ?auto_107447 ?auto_107452 ) ) ( not ( = ?auto_107447 ?auto_107449 ) ) ( not ( = ?auto_107448 ?auto_107452 ) ) ( not ( = ?auto_107448 ?auto_107449 ) ) ( not ( = ?auto_107452 ?auto_107449 ) ) ( ON ?auto_107452 ?auto_107448 ) ( not ( = ?auto_107451 ?auto_107450 ) ) ( not ( = ?auto_107451 ?auto_107449 ) ) ( not ( = ?auto_107450 ?auto_107449 ) ) ( not ( = ?auto_107445 ?auto_107450 ) ) ( not ( = ?auto_107445 ?auto_107451 ) ) ( not ( = ?auto_107446 ?auto_107450 ) ) ( not ( = ?auto_107446 ?auto_107451 ) ) ( not ( = ?auto_107447 ?auto_107450 ) ) ( not ( = ?auto_107447 ?auto_107451 ) ) ( not ( = ?auto_107448 ?auto_107450 ) ) ( not ( = ?auto_107448 ?auto_107451 ) ) ( not ( = ?auto_107452 ?auto_107450 ) ) ( not ( = ?auto_107452 ?auto_107451 ) ) ( ON ?auto_107449 ?auto_107452 ) ( ON ?auto_107450 ?auto_107449 ) ( CLEAR ?auto_107450 ) ( HOLDING ?auto_107451 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107451 )
      ( MAKE-3PILE ?auto_107445 ?auto_107446 ?auto_107447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_107453 - BLOCK
      ?auto_107454 - BLOCK
      ?auto_107455 - BLOCK
    )
    :vars
    (
      ?auto_107458 - BLOCK
      ?auto_107457 - BLOCK
      ?auto_107459 - BLOCK
      ?auto_107460 - BLOCK
      ?auto_107456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107458 ?auto_107455 ) ( ON-TABLE ?auto_107453 ) ( ON ?auto_107454 ?auto_107453 ) ( ON ?auto_107455 ?auto_107454 ) ( not ( = ?auto_107453 ?auto_107454 ) ) ( not ( = ?auto_107453 ?auto_107455 ) ) ( not ( = ?auto_107453 ?auto_107458 ) ) ( not ( = ?auto_107454 ?auto_107455 ) ) ( not ( = ?auto_107454 ?auto_107458 ) ) ( not ( = ?auto_107455 ?auto_107458 ) ) ( not ( = ?auto_107453 ?auto_107457 ) ) ( not ( = ?auto_107453 ?auto_107459 ) ) ( not ( = ?auto_107454 ?auto_107457 ) ) ( not ( = ?auto_107454 ?auto_107459 ) ) ( not ( = ?auto_107455 ?auto_107457 ) ) ( not ( = ?auto_107455 ?auto_107459 ) ) ( not ( = ?auto_107458 ?auto_107457 ) ) ( not ( = ?auto_107458 ?auto_107459 ) ) ( not ( = ?auto_107457 ?auto_107459 ) ) ( ON ?auto_107457 ?auto_107458 ) ( not ( = ?auto_107460 ?auto_107456 ) ) ( not ( = ?auto_107460 ?auto_107459 ) ) ( not ( = ?auto_107456 ?auto_107459 ) ) ( not ( = ?auto_107453 ?auto_107456 ) ) ( not ( = ?auto_107453 ?auto_107460 ) ) ( not ( = ?auto_107454 ?auto_107456 ) ) ( not ( = ?auto_107454 ?auto_107460 ) ) ( not ( = ?auto_107455 ?auto_107456 ) ) ( not ( = ?auto_107455 ?auto_107460 ) ) ( not ( = ?auto_107458 ?auto_107456 ) ) ( not ( = ?auto_107458 ?auto_107460 ) ) ( not ( = ?auto_107457 ?auto_107456 ) ) ( not ( = ?auto_107457 ?auto_107460 ) ) ( ON ?auto_107459 ?auto_107457 ) ( ON ?auto_107456 ?auto_107459 ) ( ON ?auto_107460 ?auto_107456 ) ( CLEAR ?auto_107460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107453 ?auto_107454 ?auto_107455 ?auto_107458 ?auto_107457 ?auto_107459 ?auto_107456 )
      ( MAKE-3PILE ?auto_107453 ?auto_107454 ?auto_107455 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107466 - BLOCK
      ?auto_107467 - BLOCK
      ?auto_107468 - BLOCK
      ?auto_107469 - BLOCK
      ?auto_107470 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_107470 ) ( CLEAR ?auto_107469 ) ( ON-TABLE ?auto_107466 ) ( ON ?auto_107467 ?auto_107466 ) ( ON ?auto_107468 ?auto_107467 ) ( ON ?auto_107469 ?auto_107468 ) ( not ( = ?auto_107466 ?auto_107467 ) ) ( not ( = ?auto_107466 ?auto_107468 ) ) ( not ( = ?auto_107466 ?auto_107469 ) ) ( not ( = ?auto_107466 ?auto_107470 ) ) ( not ( = ?auto_107467 ?auto_107468 ) ) ( not ( = ?auto_107467 ?auto_107469 ) ) ( not ( = ?auto_107467 ?auto_107470 ) ) ( not ( = ?auto_107468 ?auto_107469 ) ) ( not ( = ?auto_107468 ?auto_107470 ) ) ( not ( = ?auto_107469 ?auto_107470 ) ) )
    :subtasks
    ( ( !STACK ?auto_107470 ?auto_107469 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107471 - BLOCK
      ?auto_107472 - BLOCK
      ?auto_107473 - BLOCK
      ?auto_107474 - BLOCK
      ?auto_107475 - BLOCK
    )
    :vars
    (
      ?auto_107476 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107474 ) ( ON-TABLE ?auto_107471 ) ( ON ?auto_107472 ?auto_107471 ) ( ON ?auto_107473 ?auto_107472 ) ( ON ?auto_107474 ?auto_107473 ) ( not ( = ?auto_107471 ?auto_107472 ) ) ( not ( = ?auto_107471 ?auto_107473 ) ) ( not ( = ?auto_107471 ?auto_107474 ) ) ( not ( = ?auto_107471 ?auto_107475 ) ) ( not ( = ?auto_107472 ?auto_107473 ) ) ( not ( = ?auto_107472 ?auto_107474 ) ) ( not ( = ?auto_107472 ?auto_107475 ) ) ( not ( = ?auto_107473 ?auto_107474 ) ) ( not ( = ?auto_107473 ?auto_107475 ) ) ( not ( = ?auto_107474 ?auto_107475 ) ) ( ON ?auto_107475 ?auto_107476 ) ( CLEAR ?auto_107475 ) ( HAND-EMPTY ) ( not ( = ?auto_107471 ?auto_107476 ) ) ( not ( = ?auto_107472 ?auto_107476 ) ) ( not ( = ?auto_107473 ?auto_107476 ) ) ( not ( = ?auto_107474 ?auto_107476 ) ) ( not ( = ?auto_107475 ?auto_107476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107475 ?auto_107476 )
      ( MAKE-5PILE ?auto_107471 ?auto_107472 ?auto_107473 ?auto_107474 ?auto_107475 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107477 - BLOCK
      ?auto_107478 - BLOCK
      ?auto_107479 - BLOCK
      ?auto_107480 - BLOCK
      ?auto_107481 - BLOCK
    )
    :vars
    (
      ?auto_107482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107477 ) ( ON ?auto_107478 ?auto_107477 ) ( ON ?auto_107479 ?auto_107478 ) ( not ( = ?auto_107477 ?auto_107478 ) ) ( not ( = ?auto_107477 ?auto_107479 ) ) ( not ( = ?auto_107477 ?auto_107480 ) ) ( not ( = ?auto_107477 ?auto_107481 ) ) ( not ( = ?auto_107478 ?auto_107479 ) ) ( not ( = ?auto_107478 ?auto_107480 ) ) ( not ( = ?auto_107478 ?auto_107481 ) ) ( not ( = ?auto_107479 ?auto_107480 ) ) ( not ( = ?auto_107479 ?auto_107481 ) ) ( not ( = ?auto_107480 ?auto_107481 ) ) ( ON ?auto_107481 ?auto_107482 ) ( CLEAR ?auto_107481 ) ( not ( = ?auto_107477 ?auto_107482 ) ) ( not ( = ?auto_107478 ?auto_107482 ) ) ( not ( = ?auto_107479 ?auto_107482 ) ) ( not ( = ?auto_107480 ?auto_107482 ) ) ( not ( = ?auto_107481 ?auto_107482 ) ) ( HOLDING ?auto_107480 ) ( CLEAR ?auto_107479 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107477 ?auto_107478 ?auto_107479 ?auto_107480 )
      ( MAKE-5PILE ?auto_107477 ?auto_107478 ?auto_107479 ?auto_107480 ?auto_107481 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107483 - BLOCK
      ?auto_107484 - BLOCK
      ?auto_107485 - BLOCK
      ?auto_107486 - BLOCK
      ?auto_107487 - BLOCK
    )
    :vars
    (
      ?auto_107488 - BLOCK
      ?auto_107490 - BLOCK
      ?auto_107489 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107483 ) ( ON ?auto_107484 ?auto_107483 ) ( ON ?auto_107485 ?auto_107484 ) ( not ( = ?auto_107483 ?auto_107484 ) ) ( not ( = ?auto_107483 ?auto_107485 ) ) ( not ( = ?auto_107483 ?auto_107486 ) ) ( not ( = ?auto_107483 ?auto_107487 ) ) ( not ( = ?auto_107484 ?auto_107485 ) ) ( not ( = ?auto_107484 ?auto_107486 ) ) ( not ( = ?auto_107484 ?auto_107487 ) ) ( not ( = ?auto_107485 ?auto_107486 ) ) ( not ( = ?auto_107485 ?auto_107487 ) ) ( not ( = ?auto_107486 ?auto_107487 ) ) ( ON ?auto_107487 ?auto_107488 ) ( not ( = ?auto_107483 ?auto_107488 ) ) ( not ( = ?auto_107484 ?auto_107488 ) ) ( not ( = ?auto_107485 ?auto_107488 ) ) ( not ( = ?auto_107486 ?auto_107488 ) ) ( not ( = ?auto_107487 ?auto_107488 ) ) ( CLEAR ?auto_107485 ) ( ON ?auto_107486 ?auto_107487 ) ( CLEAR ?auto_107486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107490 ) ( ON ?auto_107489 ?auto_107490 ) ( ON ?auto_107488 ?auto_107489 ) ( not ( = ?auto_107490 ?auto_107489 ) ) ( not ( = ?auto_107490 ?auto_107488 ) ) ( not ( = ?auto_107490 ?auto_107487 ) ) ( not ( = ?auto_107490 ?auto_107486 ) ) ( not ( = ?auto_107489 ?auto_107488 ) ) ( not ( = ?auto_107489 ?auto_107487 ) ) ( not ( = ?auto_107489 ?auto_107486 ) ) ( not ( = ?auto_107483 ?auto_107490 ) ) ( not ( = ?auto_107483 ?auto_107489 ) ) ( not ( = ?auto_107484 ?auto_107490 ) ) ( not ( = ?auto_107484 ?auto_107489 ) ) ( not ( = ?auto_107485 ?auto_107490 ) ) ( not ( = ?auto_107485 ?auto_107489 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107490 ?auto_107489 ?auto_107488 ?auto_107487 )
      ( MAKE-5PILE ?auto_107483 ?auto_107484 ?auto_107485 ?auto_107486 ?auto_107487 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107491 - BLOCK
      ?auto_107492 - BLOCK
      ?auto_107493 - BLOCK
      ?auto_107494 - BLOCK
      ?auto_107495 - BLOCK
    )
    :vars
    (
      ?auto_107498 - BLOCK
      ?auto_107496 - BLOCK
      ?auto_107497 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107491 ) ( ON ?auto_107492 ?auto_107491 ) ( not ( = ?auto_107491 ?auto_107492 ) ) ( not ( = ?auto_107491 ?auto_107493 ) ) ( not ( = ?auto_107491 ?auto_107494 ) ) ( not ( = ?auto_107491 ?auto_107495 ) ) ( not ( = ?auto_107492 ?auto_107493 ) ) ( not ( = ?auto_107492 ?auto_107494 ) ) ( not ( = ?auto_107492 ?auto_107495 ) ) ( not ( = ?auto_107493 ?auto_107494 ) ) ( not ( = ?auto_107493 ?auto_107495 ) ) ( not ( = ?auto_107494 ?auto_107495 ) ) ( ON ?auto_107495 ?auto_107498 ) ( not ( = ?auto_107491 ?auto_107498 ) ) ( not ( = ?auto_107492 ?auto_107498 ) ) ( not ( = ?auto_107493 ?auto_107498 ) ) ( not ( = ?auto_107494 ?auto_107498 ) ) ( not ( = ?auto_107495 ?auto_107498 ) ) ( ON ?auto_107494 ?auto_107495 ) ( CLEAR ?auto_107494 ) ( ON-TABLE ?auto_107496 ) ( ON ?auto_107497 ?auto_107496 ) ( ON ?auto_107498 ?auto_107497 ) ( not ( = ?auto_107496 ?auto_107497 ) ) ( not ( = ?auto_107496 ?auto_107498 ) ) ( not ( = ?auto_107496 ?auto_107495 ) ) ( not ( = ?auto_107496 ?auto_107494 ) ) ( not ( = ?auto_107497 ?auto_107498 ) ) ( not ( = ?auto_107497 ?auto_107495 ) ) ( not ( = ?auto_107497 ?auto_107494 ) ) ( not ( = ?auto_107491 ?auto_107496 ) ) ( not ( = ?auto_107491 ?auto_107497 ) ) ( not ( = ?auto_107492 ?auto_107496 ) ) ( not ( = ?auto_107492 ?auto_107497 ) ) ( not ( = ?auto_107493 ?auto_107496 ) ) ( not ( = ?auto_107493 ?auto_107497 ) ) ( HOLDING ?auto_107493 ) ( CLEAR ?auto_107492 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107491 ?auto_107492 ?auto_107493 )
      ( MAKE-5PILE ?auto_107491 ?auto_107492 ?auto_107493 ?auto_107494 ?auto_107495 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107499 - BLOCK
      ?auto_107500 - BLOCK
      ?auto_107501 - BLOCK
      ?auto_107502 - BLOCK
      ?auto_107503 - BLOCK
    )
    :vars
    (
      ?auto_107506 - BLOCK
      ?auto_107505 - BLOCK
      ?auto_107504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107499 ) ( ON ?auto_107500 ?auto_107499 ) ( not ( = ?auto_107499 ?auto_107500 ) ) ( not ( = ?auto_107499 ?auto_107501 ) ) ( not ( = ?auto_107499 ?auto_107502 ) ) ( not ( = ?auto_107499 ?auto_107503 ) ) ( not ( = ?auto_107500 ?auto_107501 ) ) ( not ( = ?auto_107500 ?auto_107502 ) ) ( not ( = ?auto_107500 ?auto_107503 ) ) ( not ( = ?auto_107501 ?auto_107502 ) ) ( not ( = ?auto_107501 ?auto_107503 ) ) ( not ( = ?auto_107502 ?auto_107503 ) ) ( ON ?auto_107503 ?auto_107506 ) ( not ( = ?auto_107499 ?auto_107506 ) ) ( not ( = ?auto_107500 ?auto_107506 ) ) ( not ( = ?auto_107501 ?auto_107506 ) ) ( not ( = ?auto_107502 ?auto_107506 ) ) ( not ( = ?auto_107503 ?auto_107506 ) ) ( ON ?auto_107502 ?auto_107503 ) ( ON-TABLE ?auto_107505 ) ( ON ?auto_107504 ?auto_107505 ) ( ON ?auto_107506 ?auto_107504 ) ( not ( = ?auto_107505 ?auto_107504 ) ) ( not ( = ?auto_107505 ?auto_107506 ) ) ( not ( = ?auto_107505 ?auto_107503 ) ) ( not ( = ?auto_107505 ?auto_107502 ) ) ( not ( = ?auto_107504 ?auto_107506 ) ) ( not ( = ?auto_107504 ?auto_107503 ) ) ( not ( = ?auto_107504 ?auto_107502 ) ) ( not ( = ?auto_107499 ?auto_107505 ) ) ( not ( = ?auto_107499 ?auto_107504 ) ) ( not ( = ?auto_107500 ?auto_107505 ) ) ( not ( = ?auto_107500 ?auto_107504 ) ) ( not ( = ?auto_107501 ?auto_107505 ) ) ( not ( = ?auto_107501 ?auto_107504 ) ) ( CLEAR ?auto_107500 ) ( ON ?auto_107501 ?auto_107502 ) ( CLEAR ?auto_107501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107505 ?auto_107504 ?auto_107506 ?auto_107503 ?auto_107502 )
      ( MAKE-5PILE ?auto_107499 ?auto_107500 ?auto_107501 ?auto_107502 ?auto_107503 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107507 - BLOCK
      ?auto_107508 - BLOCK
      ?auto_107509 - BLOCK
      ?auto_107510 - BLOCK
      ?auto_107511 - BLOCK
    )
    :vars
    (
      ?auto_107514 - BLOCK
      ?auto_107513 - BLOCK
      ?auto_107512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107507 ) ( not ( = ?auto_107507 ?auto_107508 ) ) ( not ( = ?auto_107507 ?auto_107509 ) ) ( not ( = ?auto_107507 ?auto_107510 ) ) ( not ( = ?auto_107507 ?auto_107511 ) ) ( not ( = ?auto_107508 ?auto_107509 ) ) ( not ( = ?auto_107508 ?auto_107510 ) ) ( not ( = ?auto_107508 ?auto_107511 ) ) ( not ( = ?auto_107509 ?auto_107510 ) ) ( not ( = ?auto_107509 ?auto_107511 ) ) ( not ( = ?auto_107510 ?auto_107511 ) ) ( ON ?auto_107511 ?auto_107514 ) ( not ( = ?auto_107507 ?auto_107514 ) ) ( not ( = ?auto_107508 ?auto_107514 ) ) ( not ( = ?auto_107509 ?auto_107514 ) ) ( not ( = ?auto_107510 ?auto_107514 ) ) ( not ( = ?auto_107511 ?auto_107514 ) ) ( ON ?auto_107510 ?auto_107511 ) ( ON-TABLE ?auto_107513 ) ( ON ?auto_107512 ?auto_107513 ) ( ON ?auto_107514 ?auto_107512 ) ( not ( = ?auto_107513 ?auto_107512 ) ) ( not ( = ?auto_107513 ?auto_107514 ) ) ( not ( = ?auto_107513 ?auto_107511 ) ) ( not ( = ?auto_107513 ?auto_107510 ) ) ( not ( = ?auto_107512 ?auto_107514 ) ) ( not ( = ?auto_107512 ?auto_107511 ) ) ( not ( = ?auto_107512 ?auto_107510 ) ) ( not ( = ?auto_107507 ?auto_107513 ) ) ( not ( = ?auto_107507 ?auto_107512 ) ) ( not ( = ?auto_107508 ?auto_107513 ) ) ( not ( = ?auto_107508 ?auto_107512 ) ) ( not ( = ?auto_107509 ?auto_107513 ) ) ( not ( = ?auto_107509 ?auto_107512 ) ) ( ON ?auto_107509 ?auto_107510 ) ( CLEAR ?auto_107509 ) ( HOLDING ?auto_107508 ) ( CLEAR ?auto_107507 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107507 ?auto_107508 )
      ( MAKE-5PILE ?auto_107507 ?auto_107508 ?auto_107509 ?auto_107510 ?auto_107511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107515 - BLOCK
      ?auto_107516 - BLOCK
      ?auto_107517 - BLOCK
      ?auto_107518 - BLOCK
      ?auto_107519 - BLOCK
    )
    :vars
    (
      ?auto_107522 - BLOCK
      ?auto_107521 - BLOCK
      ?auto_107520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107515 ) ( not ( = ?auto_107515 ?auto_107516 ) ) ( not ( = ?auto_107515 ?auto_107517 ) ) ( not ( = ?auto_107515 ?auto_107518 ) ) ( not ( = ?auto_107515 ?auto_107519 ) ) ( not ( = ?auto_107516 ?auto_107517 ) ) ( not ( = ?auto_107516 ?auto_107518 ) ) ( not ( = ?auto_107516 ?auto_107519 ) ) ( not ( = ?auto_107517 ?auto_107518 ) ) ( not ( = ?auto_107517 ?auto_107519 ) ) ( not ( = ?auto_107518 ?auto_107519 ) ) ( ON ?auto_107519 ?auto_107522 ) ( not ( = ?auto_107515 ?auto_107522 ) ) ( not ( = ?auto_107516 ?auto_107522 ) ) ( not ( = ?auto_107517 ?auto_107522 ) ) ( not ( = ?auto_107518 ?auto_107522 ) ) ( not ( = ?auto_107519 ?auto_107522 ) ) ( ON ?auto_107518 ?auto_107519 ) ( ON-TABLE ?auto_107521 ) ( ON ?auto_107520 ?auto_107521 ) ( ON ?auto_107522 ?auto_107520 ) ( not ( = ?auto_107521 ?auto_107520 ) ) ( not ( = ?auto_107521 ?auto_107522 ) ) ( not ( = ?auto_107521 ?auto_107519 ) ) ( not ( = ?auto_107521 ?auto_107518 ) ) ( not ( = ?auto_107520 ?auto_107522 ) ) ( not ( = ?auto_107520 ?auto_107519 ) ) ( not ( = ?auto_107520 ?auto_107518 ) ) ( not ( = ?auto_107515 ?auto_107521 ) ) ( not ( = ?auto_107515 ?auto_107520 ) ) ( not ( = ?auto_107516 ?auto_107521 ) ) ( not ( = ?auto_107516 ?auto_107520 ) ) ( not ( = ?auto_107517 ?auto_107521 ) ) ( not ( = ?auto_107517 ?auto_107520 ) ) ( ON ?auto_107517 ?auto_107518 ) ( CLEAR ?auto_107515 ) ( ON ?auto_107516 ?auto_107517 ) ( CLEAR ?auto_107516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107521 ?auto_107520 ?auto_107522 ?auto_107519 ?auto_107518 ?auto_107517 )
      ( MAKE-5PILE ?auto_107515 ?auto_107516 ?auto_107517 ?auto_107518 ?auto_107519 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107523 - BLOCK
      ?auto_107524 - BLOCK
      ?auto_107525 - BLOCK
      ?auto_107526 - BLOCK
      ?auto_107527 - BLOCK
    )
    :vars
    (
      ?auto_107530 - BLOCK
      ?auto_107528 - BLOCK
      ?auto_107529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107523 ?auto_107524 ) ) ( not ( = ?auto_107523 ?auto_107525 ) ) ( not ( = ?auto_107523 ?auto_107526 ) ) ( not ( = ?auto_107523 ?auto_107527 ) ) ( not ( = ?auto_107524 ?auto_107525 ) ) ( not ( = ?auto_107524 ?auto_107526 ) ) ( not ( = ?auto_107524 ?auto_107527 ) ) ( not ( = ?auto_107525 ?auto_107526 ) ) ( not ( = ?auto_107525 ?auto_107527 ) ) ( not ( = ?auto_107526 ?auto_107527 ) ) ( ON ?auto_107527 ?auto_107530 ) ( not ( = ?auto_107523 ?auto_107530 ) ) ( not ( = ?auto_107524 ?auto_107530 ) ) ( not ( = ?auto_107525 ?auto_107530 ) ) ( not ( = ?auto_107526 ?auto_107530 ) ) ( not ( = ?auto_107527 ?auto_107530 ) ) ( ON ?auto_107526 ?auto_107527 ) ( ON-TABLE ?auto_107528 ) ( ON ?auto_107529 ?auto_107528 ) ( ON ?auto_107530 ?auto_107529 ) ( not ( = ?auto_107528 ?auto_107529 ) ) ( not ( = ?auto_107528 ?auto_107530 ) ) ( not ( = ?auto_107528 ?auto_107527 ) ) ( not ( = ?auto_107528 ?auto_107526 ) ) ( not ( = ?auto_107529 ?auto_107530 ) ) ( not ( = ?auto_107529 ?auto_107527 ) ) ( not ( = ?auto_107529 ?auto_107526 ) ) ( not ( = ?auto_107523 ?auto_107528 ) ) ( not ( = ?auto_107523 ?auto_107529 ) ) ( not ( = ?auto_107524 ?auto_107528 ) ) ( not ( = ?auto_107524 ?auto_107529 ) ) ( not ( = ?auto_107525 ?auto_107528 ) ) ( not ( = ?auto_107525 ?auto_107529 ) ) ( ON ?auto_107525 ?auto_107526 ) ( ON ?auto_107524 ?auto_107525 ) ( CLEAR ?auto_107524 ) ( HOLDING ?auto_107523 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107523 )
      ( MAKE-5PILE ?auto_107523 ?auto_107524 ?auto_107525 ?auto_107526 ?auto_107527 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_107531 - BLOCK
      ?auto_107532 - BLOCK
      ?auto_107533 - BLOCK
      ?auto_107534 - BLOCK
      ?auto_107535 - BLOCK
    )
    :vars
    (
      ?auto_107537 - BLOCK
      ?auto_107538 - BLOCK
      ?auto_107536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107531 ?auto_107532 ) ) ( not ( = ?auto_107531 ?auto_107533 ) ) ( not ( = ?auto_107531 ?auto_107534 ) ) ( not ( = ?auto_107531 ?auto_107535 ) ) ( not ( = ?auto_107532 ?auto_107533 ) ) ( not ( = ?auto_107532 ?auto_107534 ) ) ( not ( = ?auto_107532 ?auto_107535 ) ) ( not ( = ?auto_107533 ?auto_107534 ) ) ( not ( = ?auto_107533 ?auto_107535 ) ) ( not ( = ?auto_107534 ?auto_107535 ) ) ( ON ?auto_107535 ?auto_107537 ) ( not ( = ?auto_107531 ?auto_107537 ) ) ( not ( = ?auto_107532 ?auto_107537 ) ) ( not ( = ?auto_107533 ?auto_107537 ) ) ( not ( = ?auto_107534 ?auto_107537 ) ) ( not ( = ?auto_107535 ?auto_107537 ) ) ( ON ?auto_107534 ?auto_107535 ) ( ON-TABLE ?auto_107538 ) ( ON ?auto_107536 ?auto_107538 ) ( ON ?auto_107537 ?auto_107536 ) ( not ( = ?auto_107538 ?auto_107536 ) ) ( not ( = ?auto_107538 ?auto_107537 ) ) ( not ( = ?auto_107538 ?auto_107535 ) ) ( not ( = ?auto_107538 ?auto_107534 ) ) ( not ( = ?auto_107536 ?auto_107537 ) ) ( not ( = ?auto_107536 ?auto_107535 ) ) ( not ( = ?auto_107536 ?auto_107534 ) ) ( not ( = ?auto_107531 ?auto_107538 ) ) ( not ( = ?auto_107531 ?auto_107536 ) ) ( not ( = ?auto_107532 ?auto_107538 ) ) ( not ( = ?auto_107532 ?auto_107536 ) ) ( not ( = ?auto_107533 ?auto_107538 ) ) ( not ( = ?auto_107533 ?auto_107536 ) ) ( ON ?auto_107533 ?auto_107534 ) ( ON ?auto_107532 ?auto_107533 ) ( ON ?auto_107531 ?auto_107532 ) ( CLEAR ?auto_107531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107538 ?auto_107536 ?auto_107537 ?auto_107535 ?auto_107534 ?auto_107533 ?auto_107532 )
      ( MAKE-5PILE ?auto_107531 ?auto_107532 ?auto_107533 ?auto_107534 ?auto_107535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107541 - BLOCK
      ?auto_107542 - BLOCK
    )
    :vars
    (
      ?auto_107543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107543 ?auto_107542 ) ( CLEAR ?auto_107543 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107541 ) ( ON ?auto_107542 ?auto_107541 ) ( not ( = ?auto_107541 ?auto_107542 ) ) ( not ( = ?auto_107541 ?auto_107543 ) ) ( not ( = ?auto_107542 ?auto_107543 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107543 ?auto_107542 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107544 - BLOCK
      ?auto_107545 - BLOCK
    )
    :vars
    (
      ?auto_107546 - BLOCK
      ?auto_107547 - BLOCK
      ?auto_107548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107546 ?auto_107545 ) ( CLEAR ?auto_107546 ) ( ON-TABLE ?auto_107544 ) ( ON ?auto_107545 ?auto_107544 ) ( not ( = ?auto_107544 ?auto_107545 ) ) ( not ( = ?auto_107544 ?auto_107546 ) ) ( not ( = ?auto_107545 ?auto_107546 ) ) ( HOLDING ?auto_107547 ) ( CLEAR ?auto_107548 ) ( not ( = ?auto_107544 ?auto_107547 ) ) ( not ( = ?auto_107544 ?auto_107548 ) ) ( not ( = ?auto_107545 ?auto_107547 ) ) ( not ( = ?auto_107545 ?auto_107548 ) ) ( not ( = ?auto_107546 ?auto_107547 ) ) ( not ( = ?auto_107546 ?auto_107548 ) ) ( not ( = ?auto_107547 ?auto_107548 ) ) )
    :subtasks
    ( ( !STACK ?auto_107547 ?auto_107548 )
      ( MAKE-2PILE ?auto_107544 ?auto_107545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107549 - BLOCK
      ?auto_107550 - BLOCK
    )
    :vars
    (
      ?auto_107553 - BLOCK
      ?auto_107551 - BLOCK
      ?auto_107552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107553 ?auto_107550 ) ( ON-TABLE ?auto_107549 ) ( ON ?auto_107550 ?auto_107549 ) ( not ( = ?auto_107549 ?auto_107550 ) ) ( not ( = ?auto_107549 ?auto_107553 ) ) ( not ( = ?auto_107550 ?auto_107553 ) ) ( CLEAR ?auto_107551 ) ( not ( = ?auto_107549 ?auto_107552 ) ) ( not ( = ?auto_107549 ?auto_107551 ) ) ( not ( = ?auto_107550 ?auto_107552 ) ) ( not ( = ?auto_107550 ?auto_107551 ) ) ( not ( = ?auto_107553 ?auto_107552 ) ) ( not ( = ?auto_107553 ?auto_107551 ) ) ( not ( = ?auto_107552 ?auto_107551 ) ) ( ON ?auto_107552 ?auto_107553 ) ( CLEAR ?auto_107552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107549 ?auto_107550 ?auto_107553 )
      ( MAKE-2PILE ?auto_107549 ?auto_107550 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107554 - BLOCK
      ?auto_107555 - BLOCK
    )
    :vars
    (
      ?auto_107558 - BLOCK
      ?auto_107556 - BLOCK
      ?auto_107557 - BLOCK
      ?auto_107560 - BLOCK
      ?auto_107561 - BLOCK
      ?auto_107559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107558 ?auto_107555 ) ( ON-TABLE ?auto_107554 ) ( ON ?auto_107555 ?auto_107554 ) ( not ( = ?auto_107554 ?auto_107555 ) ) ( not ( = ?auto_107554 ?auto_107558 ) ) ( not ( = ?auto_107555 ?auto_107558 ) ) ( not ( = ?auto_107554 ?auto_107556 ) ) ( not ( = ?auto_107554 ?auto_107557 ) ) ( not ( = ?auto_107555 ?auto_107556 ) ) ( not ( = ?auto_107555 ?auto_107557 ) ) ( not ( = ?auto_107558 ?auto_107556 ) ) ( not ( = ?auto_107558 ?auto_107557 ) ) ( not ( = ?auto_107556 ?auto_107557 ) ) ( ON ?auto_107556 ?auto_107558 ) ( CLEAR ?auto_107556 ) ( HOLDING ?auto_107557 ) ( CLEAR ?auto_107560 ) ( ON-TABLE ?auto_107561 ) ( ON ?auto_107559 ?auto_107561 ) ( ON ?auto_107560 ?auto_107559 ) ( not ( = ?auto_107561 ?auto_107559 ) ) ( not ( = ?auto_107561 ?auto_107560 ) ) ( not ( = ?auto_107561 ?auto_107557 ) ) ( not ( = ?auto_107559 ?auto_107560 ) ) ( not ( = ?auto_107559 ?auto_107557 ) ) ( not ( = ?auto_107560 ?auto_107557 ) ) ( not ( = ?auto_107554 ?auto_107560 ) ) ( not ( = ?auto_107554 ?auto_107561 ) ) ( not ( = ?auto_107554 ?auto_107559 ) ) ( not ( = ?auto_107555 ?auto_107560 ) ) ( not ( = ?auto_107555 ?auto_107561 ) ) ( not ( = ?auto_107555 ?auto_107559 ) ) ( not ( = ?auto_107558 ?auto_107560 ) ) ( not ( = ?auto_107558 ?auto_107561 ) ) ( not ( = ?auto_107558 ?auto_107559 ) ) ( not ( = ?auto_107556 ?auto_107560 ) ) ( not ( = ?auto_107556 ?auto_107561 ) ) ( not ( = ?auto_107556 ?auto_107559 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107561 ?auto_107559 ?auto_107560 ?auto_107557 )
      ( MAKE-2PILE ?auto_107554 ?auto_107555 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107562 - BLOCK
      ?auto_107563 - BLOCK
    )
    :vars
    (
      ?auto_107569 - BLOCK
      ?auto_107565 - BLOCK
      ?auto_107566 - BLOCK
      ?auto_107567 - BLOCK
      ?auto_107568 - BLOCK
      ?auto_107564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107569 ?auto_107563 ) ( ON-TABLE ?auto_107562 ) ( ON ?auto_107563 ?auto_107562 ) ( not ( = ?auto_107562 ?auto_107563 ) ) ( not ( = ?auto_107562 ?auto_107569 ) ) ( not ( = ?auto_107563 ?auto_107569 ) ) ( not ( = ?auto_107562 ?auto_107565 ) ) ( not ( = ?auto_107562 ?auto_107566 ) ) ( not ( = ?auto_107563 ?auto_107565 ) ) ( not ( = ?auto_107563 ?auto_107566 ) ) ( not ( = ?auto_107569 ?auto_107565 ) ) ( not ( = ?auto_107569 ?auto_107566 ) ) ( not ( = ?auto_107565 ?auto_107566 ) ) ( ON ?auto_107565 ?auto_107569 ) ( CLEAR ?auto_107567 ) ( ON-TABLE ?auto_107568 ) ( ON ?auto_107564 ?auto_107568 ) ( ON ?auto_107567 ?auto_107564 ) ( not ( = ?auto_107568 ?auto_107564 ) ) ( not ( = ?auto_107568 ?auto_107567 ) ) ( not ( = ?auto_107568 ?auto_107566 ) ) ( not ( = ?auto_107564 ?auto_107567 ) ) ( not ( = ?auto_107564 ?auto_107566 ) ) ( not ( = ?auto_107567 ?auto_107566 ) ) ( not ( = ?auto_107562 ?auto_107567 ) ) ( not ( = ?auto_107562 ?auto_107568 ) ) ( not ( = ?auto_107562 ?auto_107564 ) ) ( not ( = ?auto_107563 ?auto_107567 ) ) ( not ( = ?auto_107563 ?auto_107568 ) ) ( not ( = ?auto_107563 ?auto_107564 ) ) ( not ( = ?auto_107569 ?auto_107567 ) ) ( not ( = ?auto_107569 ?auto_107568 ) ) ( not ( = ?auto_107569 ?auto_107564 ) ) ( not ( = ?auto_107565 ?auto_107567 ) ) ( not ( = ?auto_107565 ?auto_107568 ) ) ( not ( = ?auto_107565 ?auto_107564 ) ) ( ON ?auto_107566 ?auto_107565 ) ( CLEAR ?auto_107566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107562 ?auto_107563 ?auto_107569 ?auto_107565 )
      ( MAKE-2PILE ?auto_107562 ?auto_107563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107570 - BLOCK
      ?auto_107571 - BLOCK
    )
    :vars
    (
      ?auto_107574 - BLOCK
      ?auto_107577 - BLOCK
      ?auto_107575 - BLOCK
      ?auto_107572 - BLOCK
      ?auto_107573 - BLOCK
      ?auto_107576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107574 ?auto_107571 ) ( ON-TABLE ?auto_107570 ) ( ON ?auto_107571 ?auto_107570 ) ( not ( = ?auto_107570 ?auto_107571 ) ) ( not ( = ?auto_107570 ?auto_107574 ) ) ( not ( = ?auto_107571 ?auto_107574 ) ) ( not ( = ?auto_107570 ?auto_107577 ) ) ( not ( = ?auto_107570 ?auto_107575 ) ) ( not ( = ?auto_107571 ?auto_107577 ) ) ( not ( = ?auto_107571 ?auto_107575 ) ) ( not ( = ?auto_107574 ?auto_107577 ) ) ( not ( = ?auto_107574 ?auto_107575 ) ) ( not ( = ?auto_107577 ?auto_107575 ) ) ( ON ?auto_107577 ?auto_107574 ) ( ON-TABLE ?auto_107572 ) ( ON ?auto_107573 ?auto_107572 ) ( not ( = ?auto_107572 ?auto_107573 ) ) ( not ( = ?auto_107572 ?auto_107576 ) ) ( not ( = ?auto_107572 ?auto_107575 ) ) ( not ( = ?auto_107573 ?auto_107576 ) ) ( not ( = ?auto_107573 ?auto_107575 ) ) ( not ( = ?auto_107576 ?auto_107575 ) ) ( not ( = ?auto_107570 ?auto_107576 ) ) ( not ( = ?auto_107570 ?auto_107572 ) ) ( not ( = ?auto_107570 ?auto_107573 ) ) ( not ( = ?auto_107571 ?auto_107576 ) ) ( not ( = ?auto_107571 ?auto_107572 ) ) ( not ( = ?auto_107571 ?auto_107573 ) ) ( not ( = ?auto_107574 ?auto_107576 ) ) ( not ( = ?auto_107574 ?auto_107572 ) ) ( not ( = ?auto_107574 ?auto_107573 ) ) ( not ( = ?auto_107577 ?auto_107576 ) ) ( not ( = ?auto_107577 ?auto_107572 ) ) ( not ( = ?auto_107577 ?auto_107573 ) ) ( ON ?auto_107575 ?auto_107577 ) ( CLEAR ?auto_107575 ) ( HOLDING ?auto_107576 ) ( CLEAR ?auto_107573 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107572 ?auto_107573 ?auto_107576 )
      ( MAKE-2PILE ?auto_107570 ?auto_107571 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107578 - BLOCK
      ?auto_107579 - BLOCK
    )
    :vars
    (
      ?auto_107583 - BLOCK
      ?auto_107581 - BLOCK
      ?auto_107582 - BLOCK
      ?auto_107580 - BLOCK
      ?auto_107585 - BLOCK
      ?auto_107584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107583 ?auto_107579 ) ( ON-TABLE ?auto_107578 ) ( ON ?auto_107579 ?auto_107578 ) ( not ( = ?auto_107578 ?auto_107579 ) ) ( not ( = ?auto_107578 ?auto_107583 ) ) ( not ( = ?auto_107579 ?auto_107583 ) ) ( not ( = ?auto_107578 ?auto_107581 ) ) ( not ( = ?auto_107578 ?auto_107582 ) ) ( not ( = ?auto_107579 ?auto_107581 ) ) ( not ( = ?auto_107579 ?auto_107582 ) ) ( not ( = ?auto_107583 ?auto_107581 ) ) ( not ( = ?auto_107583 ?auto_107582 ) ) ( not ( = ?auto_107581 ?auto_107582 ) ) ( ON ?auto_107581 ?auto_107583 ) ( ON-TABLE ?auto_107580 ) ( ON ?auto_107585 ?auto_107580 ) ( not ( = ?auto_107580 ?auto_107585 ) ) ( not ( = ?auto_107580 ?auto_107584 ) ) ( not ( = ?auto_107580 ?auto_107582 ) ) ( not ( = ?auto_107585 ?auto_107584 ) ) ( not ( = ?auto_107585 ?auto_107582 ) ) ( not ( = ?auto_107584 ?auto_107582 ) ) ( not ( = ?auto_107578 ?auto_107584 ) ) ( not ( = ?auto_107578 ?auto_107580 ) ) ( not ( = ?auto_107578 ?auto_107585 ) ) ( not ( = ?auto_107579 ?auto_107584 ) ) ( not ( = ?auto_107579 ?auto_107580 ) ) ( not ( = ?auto_107579 ?auto_107585 ) ) ( not ( = ?auto_107583 ?auto_107584 ) ) ( not ( = ?auto_107583 ?auto_107580 ) ) ( not ( = ?auto_107583 ?auto_107585 ) ) ( not ( = ?auto_107581 ?auto_107584 ) ) ( not ( = ?auto_107581 ?auto_107580 ) ) ( not ( = ?auto_107581 ?auto_107585 ) ) ( ON ?auto_107582 ?auto_107581 ) ( CLEAR ?auto_107585 ) ( ON ?auto_107584 ?auto_107582 ) ( CLEAR ?auto_107584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107578 ?auto_107579 ?auto_107583 ?auto_107581 ?auto_107582 )
      ( MAKE-2PILE ?auto_107578 ?auto_107579 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107586 - BLOCK
      ?auto_107587 - BLOCK
    )
    :vars
    (
      ?auto_107591 - BLOCK
      ?auto_107590 - BLOCK
      ?auto_107588 - BLOCK
      ?auto_107592 - BLOCK
      ?auto_107589 - BLOCK
      ?auto_107593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107591 ?auto_107587 ) ( ON-TABLE ?auto_107586 ) ( ON ?auto_107587 ?auto_107586 ) ( not ( = ?auto_107586 ?auto_107587 ) ) ( not ( = ?auto_107586 ?auto_107591 ) ) ( not ( = ?auto_107587 ?auto_107591 ) ) ( not ( = ?auto_107586 ?auto_107590 ) ) ( not ( = ?auto_107586 ?auto_107588 ) ) ( not ( = ?auto_107587 ?auto_107590 ) ) ( not ( = ?auto_107587 ?auto_107588 ) ) ( not ( = ?auto_107591 ?auto_107590 ) ) ( not ( = ?auto_107591 ?auto_107588 ) ) ( not ( = ?auto_107590 ?auto_107588 ) ) ( ON ?auto_107590 ?auto_107591 ) ( ON-TABLE ?auto_107592 ) ( not ( = ?auto_107592 ?auto_107589 ) ) ( not ( = ?auto_107592 ?auto_107593 ) ) ( not ( = ?auto_107592 ?auto_107588 ) ) ( not ( = ?auto_107589 ?auto_107593 ) ) ( not ( = ?auto_107589 ?auto_107588 ) ) ( not ( = ?auto_107593 ?auto_107588 ) ) ( not ( = ?auto_107586 ?auto_107593 ) ) ( not ( = ?auto_107586 ?auto_107592 ) ) ( not ( = ?auto_107586 ?auto_107589 ) ) ( not ( = ?auto_107587 ?auto_107593 ) ) ( not ( = ?auto_107587 ?auto_107592 ) ) ( not ( = ?auto_107587 ?auto_107589 ) ) ( not ( = ?auto_107591 ?auto_107593 ) ) ( not ( = ?auto_107591 ?auto_107592 ) ) ( not ( = ?auto_107591 ?auto_107589 ) ) ( not ( = ?auto_107590 ?auto_107593 ) ) ( not ( = ?auto_107590 ?auto_107592 ) ) ( not ( = ?auto_107590 ?auto_107589 ) ) ( ON ?auto_107588 ?auto_107590 ) ( ON ?auto_107593 ?auto_107588 ) ( CLEAR ?auto_107593 ) ( HOLDING ?auto_107589 ) ( CLEAR ?auto_107592 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107592 ?auto_107589 )
      ( MAKE-2PILE ?auto_107586 ?auto_107587 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107594 - BLOCK
      ?auto_107595 - BLOCK
    )
    :vars
    (
      ?auto_107601 - BLOCK
      ?auto_107600 - BLOCK
      ?auto_107597 - BLOCK
      ?auto_107598 - BLOCK
      ?auto_107596 - BLOCK
      ?auto_107599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107601 ?auto_107595 ) ( ON-TABLE ?auto_107594 ) ( ON ?auto_107595 ?auto_107594 ) ( not ( = ?auto_107594 ?auto_107595 ) ) ( not ( = ?auto_107594 ?auto_107601 ) ) ( not ( = ?auto_107595 ?auto_107601 ) ) ( not ( = ?auto_107594 ?auto_107600 ) ) ( not ( = ?auto_107594 ?auto_107597 ) ) ( not ( = ?auto_107595 ?auto_107600 ) ) ( not ( = ?auto_107595 ?auto_107597 ) ) ( not ( = ?auto_107601 ?auto_107600 ) ) ( not ( = ?auto_107601 ?auto_107597 ) ) ( not ( = ?auto_107600 ?auto_107597 ) ) ( ON ?auto_107600 ?auto_107601 ) ( ON-TABLE ?auto_107598 ) ( not ( = ?auto_107598 ?auto_107596 ) ) ( not ( = ?auto_107598 ?auto_107599 ) ) ( not ( = ?auto_107598 ?auto_107597 ) ) ( not ( = ?auto_107596 ?auto_107599 ) ) ( not ( = ?auto_107596 ?auto_107597 ) ) ( not ( = ?auto_107599 ?auto_107597 ) ) ( not ( = ?auto_107594 ?auto_107599 ) ) ( not ( = ?auto_107594 ?auto_107598 ) ) ( not ( = ?auto_107594 ?auto_107596 ) ) ( not ( = ?auto_107595 ?auto_107599 ) ) ( not ( = ?auto_107595 ?auto_107598 ) ) ( not ( = ?auto_107595 ?auto_107596 ) ) ( not ( = ?auto_107601 ?auto_107599 ) ) ( not ( = ?auto_107601 ?auto_107598 ) ) ( not ( = ?auto_107601 ?auto_107596 ) ) ( not ( = ?auto_107600 ?auto_107599 ) ) ( not ( = ?auto_107600 ?auto_107598 ) ) ( not ( = ?auto_107600 ?auto_107596 ) ) ( ON ?auto_107597 ?auto_107600 ) ( ON ?auto_107599 ?auto_107597 ) ( CLEAR ?auto_107598 ) ( ON ?auto_107596 ?auto_107599 ) ( CLEAR ?auto_107596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107594 ?auto_107595 ?auto_107601 ?auto_107600 ?auto_107597 ?auto_107599 )
      ( MAKE-2PILE ?auto_107594 ?auto_107595 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107602 - BLOCK
      ?auto_107603 - BLOCK
    )
    :vars
    (
      ?auto_107609 - BLOCK
      ?auto_107608 - BLOCK
      ?auto_107604 - BLOCK
      ?auto_107606 - BLOCK
      ?auto_107605 - BLOCK
      ?auto_107607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107609 ?auto_107603 ) ( ON-TABLE ?auto_107602 ) ( ON ?auto_107603 ?auto_107602 ) ( not ( = ?auto_107602 ?auto_107603 ) ) ( not ( = ?auto_107602 ?auto_107609 ) ) ( not ( = ?auto_107603 ?auto_107609 ) ) ( not ( = ?auto_107602 ?auto_107608 ) ) ( not ( = ?auto_107602 ?auto_107604 ) ) ( not ( = ?auto_107603 ?auto_107608 ) ) ( not ( = ?auto_107603 ?auto_107604 ) ) ( not ( = ?auto_107609 ?auto_107608 ) ) ( not ( = ?auto_107609 ?auto_107604 ) ) ( not ( = ?auto_107608 ?auto_107604 ) ) ( ON ?auto_107608 ?auto_107609 ) ( not ( = ?auto_107606 ?auto_107605 ) ) ( not ( = ?auto_107606 ?auto_107607 ) ) ( not ( = ?auto_107606 ?auto_107604 ) ) ( not ( = ?auto_107605 ?auto_107607 ) ) ( not ( = ?auto_107605 ?auto_107604 ) ) ( not ( = ?auto_107607 ?auto_107604 ) ) ( not ( = ?auto_107602 ?auto_107607 ) ) ( not ( = ?auto_107602 ?auto_107606 ) ) ( not ( = ?auto_107602 ?auto_107605 ) ) ( not ( = ?auto_107603 ?auto_107607 ) ) ( not ( = ?auto_107603 ?auto_107606 ) ) ( not ( = ?auto_107603 ?auto_107605 ) ) ( not ( = ?auto_107609 ?auto_107607 ) ) ( not ( = ?auto_107609 ?auto_107606 ) ) ( not ( = ?auto_107609 ?auto_107605 ) ) ( not ( = ?auto_107608 ?auto_107607 ) ) ( not ( = ?auto_107608 ?auto_107606 ) ) ( not ( = ?auto_107608 ?auto_107605 ) ) ( ON ?auto_107604 ?auto_107608 ) ( ON ?auto_107607 ?auto_107604 ) ( ON ?auto_107605 ?auto_107607 ) ( CLEAR ?auto_107605 ) ( HOLDING ?auto_107606 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107606 )
      ( MAKE-2PILE ?auto_107602 ?auto_107603 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_107610 - BLOCK
      ?auto_107611 - BLOCK
    )
    :vars
    (
      ?auto_107612 - BLOCK
      ?auto_107616 - BLOCK
      ?auto_107613 - BLOCK
      ?auto_107614 - BLOCK
      ?auto_107615 - BLOCK
      ?auto_107617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107612 ?auto_107611 ) ( ON-TABLE ?auto_107610 ) ( ON ?auto_107611 ?auto_107610 ) ( not ( = ?auto_107610 ?auto_107611 ) ) ( not ( = ?auto_107610 ?auto_107612 ) ) ( not ( = ?auto_107611 ?auto_107612 ) ) ( not ( = ?auto_107610 ?auto_107616 ) ) ( not ( = ?auto_107610 ?auto_107613 ) ) ( not ( = ?auto_107611 ?auto_107616 ) ) ( not ( = ?auto_107611 ?auto_107613 ) ) ( not ( = ?auto_107612 ?auto_107616 ) ) ( not ( = ?auto_107612 ?auto_107613 ) ) ( not ( = ?auto_107616 ?auto_107613 ) ) ( ON ?auto_107616 ?auto_107612 ) ( not ( = ?auto_107614 ?auto_107615 ) ) ( not ( = ?auto_107614 ?auto_107617 ) ) ( not ( = ?auto_107614 ?auto_107613 ) ) ( not ( = ?auto_107615 ?auto_107617 ) ) ( not ( = ?auto_107615 ?auto_107613 ) ) ( not ( = ?auto_107617 ?auto_107613 ) ) ( not ( = ?auto_107610 ?auto_107617 ) ) ( not ( = ?auto_107610 ?auto_107614 ) ) ( not ( = ?auto_107610 ?auto_107615 ) ) ( not ( = ?auto_107611 ?auto_107617 ) ) ( not ( = ?auto_107611 ?auto_107614 ) ) ( not ( = ?auto_107611 ?auto_107615 ) ) ( not ( = ?auto_107612 ?auto_107617 ) ) ( not ( = ?auto_107612 ?auto_107614 ) ) ( not ( = ?auto_107612 ?auto_107615 ) ) ( not ( = ?auto_107616 ?auto_107617 ) ) ( not ( = ?auto_107616 ?auto_107614 ) ) ( not ( = ?auto_107616 ?auto_107615 ) ) ( ON ?auto_107613 ?auto_107616 ) ( ON ?auto_107617 ?auto_107613 ) ( ON ?auto_107615 ?auto_107617 ) ( ON ?auto_107614 ?auto_107615 ) ( CLEAR ?auto_107614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107610 ?auto_107611 ?auto_107612 ?auto_107616 ?auto_107613 ?auto_107617 ?auto_107615 )
      ( MAKE-2PILE ?auto_107610 ?auto_107611 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107624 - BLOCK
      ?auto_107625 - BLOCK
      ?auto_107626 - BLOCK
      ?auto_107627 - BLOCK
      ?auto_107628 - BLOCK
      ?auto_107629 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_107629 ) ( CLEAR ?auto_107628 ) ( ON-TABLE ?auto_107624 ) ( ON ?auto_107625 ?auto_107624 ) ( ON ?auto_107626 ?auto_107625 ) ( ON ?auto_107627 ?auto_107626 ) ( ON ?auto_107628 ?auto_107627 ) ( not ( = ?auto_107624 ?auto_107625 ) ) ( not ( = ?auto_107624 ?auto_107626 ) ) ( not ( = ?auto_107624 ?auto_107627 ) ) ( not ( = ?auto_107624 ?auto_107628 ) ) ( not ( = ?auto_107624 ?auto_107629 ) ) ( not ( = ?auto_107625 ?auto_107626 ) ) ( not ( = ?auto_107625 ?auto_107627 ) ) ( not ( = ?auto_107625 ?auto_107628 ) ) ( not ( = ?auto_107625 ?auto_107629 ) ) ( not ( = ?auto_107626 ?auto_107627 ) ) ( not ( = ?auto_107626 ?auto_107628 ) ) ( not ( = ?auto_107626 ?auto_107629 ) ) ( not ( = ?auto_107627 ?auto_107628 ) ) ( not ( = ?auto_107627 ?auto_107629 ) ) ( not ( = ?auto_107628 ?auto_107629 ) ) )
    :subtasks
    ( ( !STACK ?auto_107629 ?auto_107628 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107630 - BLOCK
      ?auto_107631 - BLOCK
      ?auto_107632 - BLOCK
      ?auto_107633 - BLOCK
      ?auto_107634 - BLOCK
      ?auto_107635 - BLOCK
    )
    :vars
    (
      ?auto_107636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107634 ) ( ON-TABLE ?auto_107630 ) ( ON ?auto_107631 ?auto_107630 ) ( ON ?auto_107632 ?auto_107631 ) ( ON ?auto_107633 ?auto_107632 ) ( ON ?auto_107634 ?auto_107633 ) ( not ( = ?auto_107630 ?auto_107631 ) ) ( not ( = ?auto_107630 ?auto_107632 ) ) ( not ( = ?auto_107630 ?auto_107633 ) ) ( not ( = ?auto_107630 ?auto_107634 ) ) ( not ( = ?auto_107630 ?auto_107635 ) ) ( not ( = ?auto_107631 ?auto_107632 ) ) ( not ( = ?auto_107631 ?auto_107633 ) ) ( not ( = ?auto_107631 ?auto_107634 ) ) ( not ( = ?auto_107631 ?auto_107635 ) ) ( not ( = ?auto_107632 ?auto_107633 ) ) ( not ( = ?auto_107632 ?auto_107634 ) ) ( not ( = ?auto_107632 ?auto_107635 ) ) ( not ( = ?auto_107633 ?auto_107634 ) ) ( not ( = ?auto_107633 ?auto_107635 ) ) ( not ( = ?auto_107634 ?auto_107635 ) ) ( ON ?auto_107635 ?auto_107636 ) ( CLEAR ?auto_107635 ) ( HAND-EMPTY ) ( not ( = ?auto_107630 ?auto_107636 ) ) ( not ( = ?auto_107631 ?auto_107636 ) ) ( not ( = ?auto_107632 ?auto_107636 ) ) ( not ( = ?auto_107633 ?auto_107636 ) ) ( not ( = ?auto_107634 ?auto_107636 ) ) ( not ( = ?auto_107635 ?auto_107636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107635 ?auto_107636 )
      ( MAKE-6PILE ?auto_107630 ?auto_107631 ?auto_107632 ?auto_107633 ?auto_107634 ?auto_107635 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107637 - BLOCK
      ?auto_107638 - BLOCK
      ?auto_107639 - BLOCK
      ?auto_107640 - BLOCK
      ?auto_107641 - BLOCK
      ?auto_107642 - BLOCK
    )
    :vars
    (
      ?auto_107643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107637 ) ( ON ?auto_107638 ?auto_107637 ) ( ON ?auto_107639 ?auto_107638 ) ( ON ?auto_107640 ?auto_107639 ) ( not ( = ?auto_107637 ?auto_107638 ) ) ( not ( = ?auto_107637 ?auto_107639 ) ) ( not ( = ?auto_107637 ?auto_107640 ) ) ( not ( = ?auto_107637 ?auto_107641 ) ) ( not ( = ?auto_107637 ?auto_107642 ) ) ( not ( = ?auto_107638 ?auto_107639 ) ) ( not ( = ?auto_107638 ?auto_107640 ) ) ( not ( = ?auto_107638 ?auto_107641 ) ) ( not ( = ?auto_107638 ?auto_107642 ) ) ( not ( = ?auto_107639 ?auto_107640 ) ) ( not ( = ?auto_107639 ?auto_107641 ) ) ( not ( = ?auto_107639 ?auto_107642 ) ) ( not ( = ?auto_107640 ?auto_107641 ) ) ( not ( = ?auto_107640 ?auto_107642 ) ) ( not ( = ?auto_107641 ?auto_107642 ) ) ( ON ?auto_107642 ?auto_107643 ) ( CLEAR ?auto_107642 ) ( not ( = ?auto_107637 ?auto_107643 ) ) ( not ( = ?auto_107638 ?auto_107643 ) ) ( not ( = ?auto_107639 ?auto_107643 ) ) ( not ( = ?auto_107640 ?auto_107643 ) ) ( not ( = ?auto_107641 ?auto_107643 ) ) ( not ( = ?auto_107642 ?auto_107643 ) ) ( HOLDING ?auto_107641 ) ( CLEAR ?auto_107640 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107637 ?auto_107638 ?auto_107639 ?auto_107640 ?auto_107641 )
      ( MAKE-6PILE ?auto_107637 ?auto_107638 ?auto_107639 ?auto_107640 ?auto_107641 ?auto_107642 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107644 - BLOCK
      ?auto_107645 - BLOCK
      ?auto_107646 - BLOCK
      ?auto_107647 - BLOCK
      ?auto_107648 - BLOCK
      ?auto_107649 - BLOCK
    )
    :vars
    (
      ?auto_107650 - BLOCK
      ?auto_107651 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107644 ) ( ON ?auto_107645 ?auto_107644 ) ( ON ?auto_107646 ?auto_107645 ) ( ON ?auto_107647 ?auto_107646 ) ( not ( = ?auto_107644 ?auto_107645 ) ) ( not ( = ?auto_107644 ?auto_107646 ) ) ( not ( = ?auto_107644 ?auto_107647 ) ) ( not ( = ?auto_107644 ?auto_107648 ) ) ( not ( = ?auto_107644 ?auto_107649 ) ) ( not ( = ?auto_107645 ?auto_107646 ) ) ( not ( = ?auto_107645 ?auto_107647 ) ) ( not ( = ?auto_107645 ?auto_107648 ) ) ( not ( = ?auto_107645 ?auto_107649 ) ) ( not ( = ?auto_107646 ?auto_107647 ) ) ( not ( = ?auto_107646 ?auto_107648 ) ) ( not ( = ?auto_107646 ?auto_107649 ) ) ( not ( = ?auto_107647 ?auto_107648 ) ) ( not ( = ?auto_107647 ?auto_107649 ) ) ( not ( = ?auto_107648 ?auto_107649 ) ) ( ON ?auto_107649 ?auto_107650 ) ( not ( = ?auto_107644 ?auto_107650 ) ) ( not ( = ?auto_107645 ?auto_107650 ) ) ( not ( = ?auto_107646 ?auto_107650 ) ) ( not ( = ?auto_107647 ?auto_107650 ) ) ( not ( = ?auto_107648 ?auto_107650 ) ) ( not ( = ?auto_107649 ?auto_107650 ) ) ( CLEAR ?auto_107647 ) ( ON ?auto_107648 ?auto_107649 ) ( CLEAR ?auto_107648 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107651 ) ( ON ?auto_107650 ?auto_107651 ) ( not ( = ?auto_107651 ?auto_107650 ) ) ( not ( = ?auto_107651 ?auto_107649 ) ) ( not ( = ?auto_107651 ?auto_107648 ) ) ( not ( = ?auto_107644 ?auto_107651 ) ) ( not ( = ?auto_107645 ?auto_107651 ) ) ( not ( = ?auto_107646 ?auto_107651 ) ) ( not ( = ?auto_107647 ?auto_107651 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107651 ?auto_107650 ?auto_107649 )
      ( MAKE-6PILE ?auto_107644 ?auto_107645 ?auto_107646 ?auto_107647 ?auto_107648 ?auto_107649 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107652 - BLOCK
      ?auto_107653 - BLOCK
      ?auto_107654 - BLOCK
      ?auto_107655 - BLOCK
      ?auto_107656 - BLOCK
      ?auto_107657 - BLOCK
    )
    :vars
    (
      ?auto_107658 - BLOCK
      ?auto_107659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107652 ) ( ON ?auto_107653 ?auto_107652 ) ( ON ?auto_107654 ?auto_107653 ) ( not ( = ?auto_107652 ?auto_107653 ) ) ( not ( = ?auto_107652 ?auto_107654 ) ) ( not ( = ?auto_107652 ?auto_107655 ) ) ( not ( = ?auto_107652 ?auto_107656 ) ) ( not ( = ?auto_107652 ?auto_107657 ) ) ( not ( = ?auto_107653 ?auto_107654 ) ) ( not ( = ?auto_107653 ?auto_107655 ) ) ( not ( = ?auto_107653 ?auto_107656 ) ) ( not ( = ?auto_107653 ?auto_107657 ) ) ( not ( = ?auto_107654 ?auto_107655 ) ) ( not ( = ?auto_107654 ?auto_107656 ) ) ( not ( = ?auto_107654 ?auto_107657 ) ) ( not ( = ?auto_107655 ?auto_107656 ) ) ( not ( = ?auto_107655 ?auto_107657 ) ) ( not ( = ?auto_107656 ?auto_107657 ) ) ( ON ?auto_107657 ?auto_107658 ) ( not ( = ?auto_107652 ?auto_107658 ) ) ( not ( = ?auto_107653 ?auto_107658 ) ) ( not ( = ?auto_107654 ?auto_107658 ) ) ( not ( = ?auto_107655 ?auto_107658 ) ) ( not ( = ?auto_107656 ?auto_107658 ) ) ( not ( = ?auto_107657 ?auto_107658 ) ) ( ON ?auto_107656 ?auto_107657 ) ( CLEAR ?auto_107656 ) ( ON-TABLE ?auto_107659 ) ( ON ?auto_107658 ?auto_107659 ) ( not ( = ?auto_107659 ?auto_107658 ) ) ( not ( = ?auto_107659 ?auto_107657 ) ) ( not ( = ?auto_107659 ?auto_107656 ) ) ( not ( = ?auto_107652 ?auto_107659 ) ) ( not ( = ?auto_107653 ?auto_107659 ) ) ( not ( = ?auto_107654 ?auto_107659 ) ) ( not ( = ?auto_107655 ?auto_107659 ) ) ( HOLDING ?auto_107655 ) ( CLEAR ?auto_107654 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107652 ?auto_107653 ?auto_107654 ?auto_107655 )
      ( MAKE-6PILE ?auto_107652 ?auto_107653 ?auto_107654 ?auto_107655 ?auto_107656 ?auto_107657 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107660 - BLOCK
      ?auto_107661 - BLOCK
      ?auto_107662 - BLOCK
      ?auto_107663 - BLOCK
      ?auto_107664 - BLOCK
      ?auto_107665 - BLOCK
    )
    :vars
    (
      ?auto_107666 - BLOCK
      ?auto_107667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107660 ) ( ON ?auto_107661 ?auto_107660 ) ( ON ?auto_107662 ?auto_107661 ) ( not ( = ?auto_107660 ?auto_107661 ) ) ( not ( = ?auto_107660 ?auto_107662 ) ) ( not ( = ?auto_107660 ?auto_107663 ) ) ( not ( = ?auto_107660 ?auto_107664 ) ) ( not ( = ?auto_107660 ?auto_107665 ) ) ( not ( = ?auto_107661 ?auto_107662 ) ) ( not ( = ?auto_107661 ?auto_107663 ) ) ( not ( = ?auto_107661 ?auto_107664 ) ) ( not ( = ?auto_107661 ?auto_107665 ) ) ( not ( = ?auto_107662 ?auto_107663 ) ) ( not ( = ?auto_107662 ?auto_107664 ) ) ( not ( = ?auto_107662 ?auto_107665 ) ) ( not ( = ?auto_107663 ?auto_107664 ) ) ( not ( = ?auto_107663 ?auto_107665 ) ) ( not ( = ?auto_107664 ?auto_107665 ) ) ( ON ?auto_107665 ?auto_107666 ) ( not ( = ?auto_107660 ?auto_107666 ) ) ( not ( = ?auto_107661 ?auto_107666 ) ) ( not ( = ?auto_107662 ?auto_107666 ) ) ( not ( = ?auto_107663 ?auto_107666 ) ) ( not ( = ?auto_107664 ?auto_107666 ) ) ( not ( = ?auto_107665 ?auto_107666 ) ) ( ON ?auto_107664 ?auto_107665 ) ( ON-TABLE ?auto_107667 ) ( ON ?auto_107666 ?auto_107667 ) ( not ( = ?auto_107667 ?auto_107666 ) ) ( not ( = ?auto_107667 ?auto_107665 ) ) ( not ( = ?auto_107667 ?auto_107664 ) ) ( not ( = ?auto_107660 ?auto_107667 ) ) ( not ( = ?auto_107661 ?auto_107667 ) ) ( not ( = ?auto_107662 ?auto_107667 ) ) ( not ( = ?auto_107663 ?auto_107667 ) ) ( CLEAR ?auto_107662 ) ( ON ?auto_107663 ?auto_107664 ) ( CLEAR ?auto_107663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107667 ?auto_107666 ?auto_107665 ?auto_107664 )
      ( MAKE-6PILE ?auto_107660 ?auto_107661 ?auto_107662 ?auto_107663 ?auto_107664 ?auto_107665 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107668 - BLOCK
      ?auto_107669 - BLOCK
      ?auto_107670 - BLOCK
      ?auto_107671 - BLOCK
      ?auto_107672 - BLOCK
      ?auto_107673 - BLOCK
    )
    :vars
    (
      ?auto_107674 - BLOCK
      ?auto_107675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107668 ) ( ON ?auto_107669 ?auto_107668 ) ( not ( = ?auto_107668 ?auto_107669 ) ) ( not ( = ?auto_107668 ?auto_107670 ) ) ( not ( = ?auto_107668 ?auto_107671 ) ) ( not ( = ?auto_107668 ?auto_107672 ) ) ( not ( = ?auto_107668 ?auto_107673 ) ) ( not ( = ?auto_107669 ?auto_107670 ) ) ( not ( = ?auto_107669 ?auto_107671 ) ) ( not ( = ?auto_107669 ?auto_107672 ) ) ( not ( = ?auto_107669 ?auto_107673 ) ) ( not ( = ?auto_107670 ?auto_107671 ) ) ( not ( = ?auto_107670 ?auto_107672 ) ) ( not ( = ?auto_107670 ?auto_107673 ) ) ( not ( = ?auto_107671 ?auto_107672 ) ) ( not ( = ?auto_107671 ?auto_107673 ) ) ( not ( = ?auto_107672 ?auto_107673 ) ) ( ON ?auto_107673 ?auto_107674 ) ( not ( = ?auto_107668 ?auto_107674 ) ) ( not ( = ?auto_107669 ?auto_107674 ) ) ( not ( = ?auto_107670 ?auto_107674 ) ) ( not ( = ?auto_107671 ?auto_107674 ) ) ( not ( = ?auto_107672 ?auto_107674 ) ) ( not ( = ?auto_107673 ?auto_107674 ) ) ( ON ?auto_107672 ?auto_107673 ) ( ON-TABLE ?auto_107675 ) ( ON ?auto_107674 ?auto_107675 ) ( not ( = ?auto_107675 ?auto_107674 ) ) ( not ( = ?auto_107675 ?auto_107673 ) ) ( not ( = ?auto_107675 ?auto_107672 ) ) ( not ( = ?auto_107668 ?auto_107675 ) ) ( not ( = ?auto_107669 ?auto_107675 ) ) ( not ( = ?auto_107670 ?auto_107675 ) ) ( not ( = ?auto_107671 ?auto_107675 ) ) ( ON ?auto_107671 ?auto_107672 ) ( CLEAR ?auto_107671 ) ( HOLDING ?auto_107670 ) ( CLEAR ?auto_107669 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107668 ?auto_107669 ?auto_107670 )
      ( MAKE-6PILE ?auto_107668 ?auto_107669 ?auto_107670 ?auto_107671 ?auto_107672 ?auto_107673 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107676 - BLOCK
      ?auto_107677 - BLOCK
      ?auto_107678 - BLOCK
      ?auto_107679 - BLOCK
      ?auto_107680 - BLOCK
      ?auto_107681 - BLOCK
    )
    :vars
    (
      ?auto_107682 - BLOCK
      ?auto_107683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107676 ) ( ON ?auto_107677 ?auto_107676 ) ( not ( = ?auto_107676 ?auto_107677 ) ) ( not ( = ?auto_107676 ?auto_107678 ) ) ( not ( = ?auto_107676 ?auto_107679 ) ) ( not ( = ?auto_107676 ?auto_107680 ) ) ( not ( = ?auto_107676 ?auto_107681 ) ) ( not ( = ?auto_107677 ?auto_107678 ) ) ( not ( = ?auto_107677 ?auto_107679 ) ) ( not ( = ?auto_107677 ?auto_107680 ) ) ( not ( = ?auto_107677 ?auto_107681 ) ) ( not ( = ?auto_107678 ?auto_107679 ) ) ( not ( = ?auto_107678 ?auto_107680 ) ) ( not ( = ?auto_107678 ?auto_107681 ) ) ( not ( = ?auto_107679 ?auto_107680 ) ) ( not ( = ?auto_107679 ?auto_107681 ) ) ( not ( = ?auto_107680 ?auto_107681 ) ) ( ON ?auto_107681 ?auto_107682 ) ( not ( = ?auto_107676 ?auto_107682 ) ) ( not ( = ?auto_107677 ?auto_107682 ) ) ( not ( = ?auto_107678 ?auto_107682 ) ) ( not ( = ?auto_107679 ?auto_107682 ) ) ( not ( = ?auto_107680 ?auto_107682 ) ) ( not ( = ?auto_107681 ?auto_107682 ) ) ( ON ?auto_107680 ?auto_107681 ) ( ON-TABLE ?auto_107683 ) ( ON ?auto_107682 ?auto_107683 ) ( not ( = ?auto_107683 ?auto_107682 ) ) ( not ( = ?auto_107683 ?auto_107681 ) ) ( not ( = ?auto_107683 ?auto_107680 ) ) ( not ( = ?auto_107676 ?auto_107683 ) ) ( not ( = ?auto_107677 ?auto_107683 ) ) ( not ( = ?auto_107678 ?auto_107683 ) ) ( not ( = ?auto_107679 ?auto_107683 ) ) ( ON ?auto_107679 ?auto_107680 ) ( CLEAR ?auto_107677 ) ( ON ?auto_107678 ?auto_107679 ) ( CLEAR ?auto_107678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107683 ?auto_107682 ?auto_107681 ?auto_107680 ?auto_107679 )
      ( MAKE-6PILE ?auto_107676 ?auto_107677 ?auto_107678 ?auto_107679 ?auto_107680 ?auto_107681 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107684 - BLOCK
      ?auto_107685 - BLOCK
      ?auto_107686 - BLOCK
      ?auto_107687 - BLOCK
      ?auto_107688 - BLOCK
      ?auto_107689 - BLOCK
    )
    :vars
    (
      ?auto_107690 - BLOCK
      ?auto_107691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107684 ) ( not ( = ?auto_107684 ?auto_107685 ) ) ( not ( = ?auto_107684 ?auto_107686 ) ) ( not ( = ?auto_107684 ?auto_107687 ) ) ( not ( = ?auto_107684 ?auto_107688 ) ) ( not ( = ?auto_107684 ?auto_107689 ) ) ( not ( = ?auto_107685 ?auto_107686 ) ) ( not ( = ?auto_107685 ?auto_107687 ) ) ( not ( = ?auto_107685 ?auto_107688 ) ) ( not ( = ?auto_107685 ?auto_107689 ) ) ( not ( = ?auto_107686 ?auto_107687 ) ) ( not ( = ?auto_107686 ?auto_107688 ) ) ( not ( = ?auto_107686 ?auto_107689 ) ) ( not ( = ?auto_107687 ?auto_107688 ) ) ( not ( = ?auto_107687 ?auto_107689 ) ) ( not ( = ?auto_107688 ?auto_107689 ) ) ( ON ?auto_107689 ?auto_107690 ) ( not ( = ?auto_107684 ?auto_107690 ) ) ( not ( = ?auto_107685 ?auto_107690 ) ) ( not ( = ?auto_107686 ?auto_107690 ) ) ( not ( = ?auto_107687 ?auto_107690 ) ) ( not ( = ?auto_107688 ?auto_107690 ) ) ( not ( = ?auto_107689 ?auto_107690 ) ) ( ON ?auto_107688 ?auto_107689 ) ( ON-TABLE ?auto_107691 ) ( ON ?auto_107690 ?auto_107691 ) ( not ( = ?auto_107691 ?auto_107690 ) ) ( not ( = ?auto_107691 ?auto_107689 ) ) ( not ( = ?auto_107691 ?auto_107688 ) ) ( not ( = ?auto_107684 ?auto_107691 ) ) ( not ( = ?auto_107685 ?auto_107691 ) ) ( not ( = ?auto_107686 ?auto_107691 ) ) ( not ( = ?auto_107687 ?auto_107691 ) ) ( ON ?auto_107687 ?auto_107688 ) ( ON ?auto_107686 ?auto_107687 ) ( CLEAR ?auto_107686 ) ( HOLDING ?auto_107685 ) ( CLEAR ?auto_107684 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107684 ?auto_107685 )
      ( MAKE-6PILE ?auto_107684 ?auto_107685 ?auto_107686 ?auto_107687 ?auto_107688 ?auto_107689 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107692 - BLOCK
      ?auto_107693 - BLOCK
      ?auto_107694 - BLOCK
      ?auto_107695 - BLOCK
      ?auto_107696 - BLOCK
      ?auto_107697 - BLOCK
    )
    :vars
    (
      ?auto_107698 - BLOCK
      ?auto_107699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107692 ) ( not ( = ?auto_107692 ?auto_107693 ) ) ( not ( = ?auto_107692 ?auto_107694 ) ) ( not ( = ?auto_107692 ?auto_107695 ) ) ( not ( = ?auto_107692 ?auto_107696 ) ) ( not ( = ?auto_107692 ?auto_107697 ) ) ( not ( = ?auto_107693 ?auto_107694 ) ) ( not ( = ?auto_107693 ?auto_107695 ) ) ( not ( = ?auto_107693 ?auto_107696 ) ) ( not ( = ?auto_107693 ?auto_107697 ) ) ( not ( = ?auto_107694 ?auto_107695 ) ) ( not ( = ?auto_107694 ?auto_107696 ) ) ( not ( = ?auto_107694 ?auto_107697 ) ) ( not ( = ?auto_107695 ?auto_107696 ) ) ( not ( = ?auto_107695 ?auto_107697 ) ) ( not ( = ?auto_107696 ?auto_107697 ) ) ( ON ?auto_107697 ?auto_107698 ) ( not ( = ?auto_107692 ?auto_107698 ) ) ( not ( = ?auto_107693 ?auto_107698 ) ) ( not ( = ?auto_107694 ?auto_107698 ) ) ( not ( = ?auto_107695 ?auto_107698 ) ) ( not ( = ?auto_107696 ?auto_107698 ) ) ( not ( = ?auto_107697 ?auto_107698 ) ) ( ON ?auto_107696 ?auto_107697 ) ( ON-TABLE ?auto_107699 ) ( ON ?auto_107698 ?auto_107699 ) ( not ( = ?auto_107699 ?auto_107698 ) ) ( not ( = ?auto_107699 ?auto_107697 ) ) ( not ( = ?auto_107699 ?auto_107696 ) ) ( not ( = ?auto_107692 ?auto_107699 ) ) ( not ( = ?auto_107693 ?auto_107699 ) ) ( not ( = ?auto_107694 ?auto_107699 ) ) ( not ( = ?auto_107695 ?auto_107699 ) ) ( ON ?auto_107695 ?auto_107696 ) ( ON ?auto_107694 ?auto_107695 ) ( CLEAR ?auto_107692 ) ( ON ?auto_107693 ?auto_107694 ) ( CLEAR ?auto_107693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107699 ?auto_107698 ?auto_107697 ?auto_107696 ?auto_107695 ?auto_107694 )
      ( MAKE-6PILE ?auto_107692 ?auto_107693 ?auto_107694 ?auto_107695 ?auto_107696 ?auto_107697 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107700 - BLOCK
      ?auto_107701 - BLOCK
      ?auto_107702 - BLOCK
      ?auto_107703 - BLOCK
      ?auto_107704 - BLOCK
      ?auto_107705 - BLOCK
    )
    :vars
    (
      ?auto_107706 - BLOCK
      ?auto_107707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107700 ?auto_107701 ) ) ( not ( = ?auto_107700 ?auto_107702 ) ) ( not ( = ?auto_107700 ?auto_107703 ) ) ( not ( = ?auto_107700 ?auto_107704 ) ) ( not ( = ?auto_107700 ?auto_107705 ) ) ( not ( = ?auto_107701 ?auto_107702 ) ) ( not ( = ?auto_107701 ?auto_107703 ) ) ( not ( = ?auto_107701 ?auto_107704 ) ) ( not ( = ?auto_107701 ?auto_107705 ) ) ( not ( = ?auto_107702 ?auto_107703 ) ) ( not ( = ?auto_107702 ?auto_107704 ) ) ( not ( = ?auto_107702 ?auto_107705 ) ) ( not ( = ?auto_107703 ?auto_107704 ) ) ( not ( = ?auto_107703 ?auto_107705 ) ) ( not ( = ?auto_107704 ?auto_107705 ) ) ( ON ?auto_107705 ?auto_107706 ) ( not ( = ?auto_107700 ?auto_107706 ) ) ( not ( = ?auto_107701 ?auto_107706 ) ) ( not ( = ?auto_107702 ?auto_107706 ) ) ( not ( = ?auto_107703 ?auto_107706 ) ) ( not ( = ?auto_107704 ?auto_107706 ) ) ( not ( = ?auto_107705 ?auto_107706 ) ) ( ON ?auto_107704 ?auto_107705 ) ( ON-TABLE ?auto_107707 ) ( ON ?auto_107706 ?auto_107707 ) ( not ( = ?auto_107707 ?auto_107706 ) ) ( not ( = ?auto_107707 ?auto_107705 ) ) ( not ( = ?auto_107707 ?auto_107704 ) ) ( not ( = ?auto_107700 ?auto_107707 ) ) ( not ( = ?auto_107701 ?auto_107707 ) ) ( not ( = ?auto_107702 ?auto_107707 ) ) ( not ( = ?auto_107703 ?auto_107707 ) ) ( ON ?auto_107703 ?auto_107704 ) ( ON ?auto_107702 ?auto_107703 ) ( ON ?auto_107701 ?auto_107702 ) ( CLEAR ?auto_107701 ) ( HOLDING ?auto_107700 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107700 )
      ( MAKE-6PILE ?auto_107700 ?auto_107701 ?auto_107702 ?auto_107703 ?auto_107704 ?auto_107705 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107708 - BLOCK
      ?auto_107709 - BLOCK
      ?auto_107710 - BLOCK
      ?auto_107711 - BLOCK
      ?auto_107712 - BLOCK
      ?auto_107713 - BLOCK
    )
    :vars
    (
      ?auto_107714 - BLOCK
      ?auto_107715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107708 ?auto_107709 ) ) ( not ( = ?auto_107708 ?auto_107710 ) ) ( not ( = ?auto_107708 ?auto_107711 ) ) ( not ( = ?auto_107708 ?auto_107712 ) ) ( not ( = ?auto_107708 ?auto_107713 ) ) ( not ( = ?auto_107709 ?auto_107710 ) ) ( not ( = ?auto_107709 ?auto_107711 ) ) ( not ( = ?auto_107709 ?auto_107712 ) ) ( not ( = ?auto_107709 ?auto_107713 ) ) ( not ( = ?auto_107710 ?auto_107711 ) ) ( not ( = ?auto_107710 ?auto_107712 ) ) ( not ( = ?auto_107710 ?auto_107713 ) ) ( not ( = ?auto_107711 ?auto_107712 ) ) ( not ( = ?auto_107711 ?auto_107713 ) ) ( not ( = ?auto_107712 ?auto_107713 ) ) ( ON ?auto_107713 ?auto_107714 ) ( not ( = ?auto_107708 ?auto_107714 ) ) ( not ( = ?auto_107709 ?auto_107714 ) ) ( not ( = ?auto_107710 ?auto_107714 ) ) ( not ( = ?auto_107711 ?auto_107714 ) ) ( not ( = ?auto_107712 ?auto_107714 ) ) ( not ( = ?auto_107713 ?auto_107714 ) ) ( ON ?auto_107712 ?auto_107713 ) ( ON-TABLE ?auto_107715 ) ( ON ?auto_107714 ?auto_107715 ) ( not ( = ?auto_107715 ?auto_107714 ) ) ( not ( = ?auto_107715 ?auto_107713 ) ) ( not ( = ?auto_107715 ?auto_107712 ) ) ( not ( = ?auto_107708 ?auto_107715 ) ) ( not ( = ?auto_107709 ?auto_107715 ) ) ( not ( = ?auto_107710 ?auto_107715 ) ) ( not ( = ?auto_107711 ?auto_107715 ) ) ( ON ?auto_107711 ?auto_107712 ) ( ON ?auto_107710 ?auto_107711 ) ( ON ?auto_107709 ?auto_107710 ) ( ON ?auto_107708 ?auto_107709 ) ( CLEAR ?auto_107708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107715 ?auto_107714 ?auto_107713 ?auto_107712 ?auto_107711 ?auto_107710 ?auto_107709 )
      ( MAKE-6PILE ?auto_107708 ?auto_107709 ?auto_107710 ?auto_107711 ?auto_107712 ?auto_107713 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107717 - BLOCK
    )
    :vars
    (
      ?auto_107718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107718 ?auto_107717 ) ( CLEAR ?auto_107718 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107717 ) ( not ( = ?auto_107717 ?auto_107718 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107718 ?auto_107717 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107719 - BLOCK
    )
    :vars
    (
      ?auto_107720 - BLOCK
      ?auto_107721 - BLOCK
      ?auto_107722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107720 ?auto_107719 ) ( CLEAR ?auto_107720 ) ( ON-TABLE ?auto_107719 ) ( not ( = ?auto_107719 ?auto_107720 ) ) ( HOLDING ?auto_107721 ) ( CLEAR ?auto_107722 ) ( not ( = ?auto_107719 ?auto_107721 ) ) ( not ( = ?auto_107719 ?auto_107722 ) ) ( not ( = ?auto_107720 ?auto_107721 ) ) ( not ( = ?auto_107720 ?auto_107722 ) ) ( not ( = ?auto_107721 ?auto_107722 ) ) )
    :subtasks
    ( ( !STACK ?auto_107721 ?auto_107722 )
      ( MAKE-1PILE ?auto_107719 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107723 - BLOCK
    )
    :vars
    (
      ?auto_107725 - BLOCK
      ?auto_107724 - BLOCK
      ?auto_107726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107725 ?auto_107723 ) ( ON-TABLE ?auto_107723 ) ( not ( = ?auto_107723 ?auto_107725 ) ) ( CLEAR ?auto_107724 ) ( not ( = ?auto_107723 ?auto_107726 ) ) ( not ( = ?auto_107723 ?auto_107724 ) ) ( not ( = ?auto_107725 ?auto_107726 ) ) ( not ( = ?auto_107725 ?auto_107724 ) ) ( not ( = ?auto_107726 ?auto_107724 ) ) ( ON ?auto_107726 ?auto_107725 ) ( CLEAR ?auto_107726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107723 ?auto_107725 )
      ( MAKE-1PILE ?auto_107723 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107727 - BLOCK
    )
    :vars
    (
      ?auto_107730 - BLOCK
      ?auto_107729 - BLOCK
      ?auto_107728 - BLOCK
      ?auto_107732 - BLOCK
      ?auto_107734 - BLOCK
      ?auto_107731 - BLOCK
      ?auto_107733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107730 ?auto_107727 ) ( ON-TABLE ?auto_107727 ) ( not ( = ?auto_107727 ?auto_107730 ) ) ( not ( = ?auto_107727 ?auto_107729 ) ) ( not ( = ?auto_107727 ?auto_107728 ) ) ( not ( = ?auto_107730 ?auto_107729 ) ) ( not ( = ?auto_107730 ?auto_107728 ) ) ( not ( = ?auto_107729 ?auto_107728 ) ) ( ON ?auto_107729 ?auto_107730 ) ( CLEAR ?auto_107729 ) ( HOLDING ?auto_107728 ) ( CLEAR ?auto_107732 ) ( ON-TABLE ?auto_107734 ) ( ON ?auto_107731 ?auto_107734 ) ( ON ?auto_107733 ?auto_107731 ) ( ON ?auto_107732 ?auto_107733 ) ( not ( = ?auto_107734 ?auto_107731 ) ) ( not ( = ?auto_107734 ?auto_107733 ) ) ( not ( = ?auto_107734 ?auto_107732 ) ) ( not ( = ?auto_107734 ?auto_107728 ) ) ( not ( = ?auto_107731 ?auto_107733 ) ) ( not ( = ?auto_107731 ?auto_107732 ) ) ( not ( = ?auto_107731 ?auto_107728 ) ) ( not ( = ?auto_107733 ?auto_107732 ) ) ( not ( = ?auto_107733 ?auto_107728 ) ) ( not ( = ?auto_107732 ?auto_107728 ) ) ( not ( = ?auto_107727 ?auto_107732 ) ) ( not ( = ?auto_107727 ?auto_107734 ) ) ( not ( = ?auto_107727 ?auto_107731 ) ) ( not ( = ?auto_107727 ?auto_107733 ) ) ( not ( = ?auto_107730 ?auto_107732 ) ) ( not ( = ?auto_107730 ?auto_107734 ) ) ( not ( = ?auto_107730 ?auto_107731 ) ) ( not ( = ?auto_107730 ?auto_107733 ) ) ( not ( = ?auto_107729 ?auto_107732 ) ) ( not ( = ?auto_107729 ?auto_107734 ) ) ( not ( = ?auto_107729 ?auto_107731 ) ) ( not ( = ?auto_107729 ?auto_107733 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107734 ?auto_107731 ?auto_107733 ?auto_107732 ?auto_107728 )
      ( MAKE-1PILE ?auto_107727 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107735 - BLOCK
    )
    :vars
    (
      ?auto_107737 - BLOCK
      ?auto_107740 - BLOCK
      ?auto_107736 - BLOCK
      ?auto_107739 - BLOCK
      ?auto_107741 - BLOCK
      ?auto_107738 - BLOCK
      ?auto_107742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107737 ?auto_107735 ) ( ON-TABLE ?auto_107735 ) ( not ( = ?auto_107735 ?auto_107737 ) ) ( not ( = ?auto_107735 ?auto_107740 ) ) ( not ( = ?auto_107735 ?auto_107736 ) ) ( not ( = ?auto_107737 ?auto_107740 ) ) ( not ( = ?auto_107737 ?auto_107736 ) ) ( not ( = ?auto_107740 ?auto_107736 ) ) ( ON ?auto_107740 ?auto_107737 ) ( CLEAR ?auto_107739 ) ( ON-TABLE ?auto_107741 ) ( ON ?auto_107738 ?auto_107741 ) ( ON ?auto_107742 ?auto_107738 ) ( ON ?auto_107739 ?auto_107742 ) ( not ( = ?auto_107741 ?auto_107738 ) ) ( not ( = ?auto_107741 ?auto_107742 ) ) ( not ( = ?auto_107741 ?auto_107739 ) ) ( not ( = ?auto_107741 ?auto_107736 ) ) ( not ( = ?auto_107738 ?auto_107742 ) ) ( not ( = ?auto_107738 ?auto_107739 ) ) ( not ( = ?auto_107738 ?auto_107736 ) ) ( not ( = ?auto_107742 ?auto_107739 ) ) ( not ( = ?auto_107742 ?auto_107736 ) ) ( not ( = ?auto_107739 ?auto_107736 ) ) ( not ( = ?auto_107735 ?auto_107739 ) ) ( not ( = ?auto_107735 ?auto_107741 ) ) ( not ( = ?auto_107735 ?auto_107738 ) ) ( not ( = ?auto_107735 ?auto_107742 ) ) ( not ( = ?auto_107737 ?auto_107739 ) ) ( not ( = ?auto_107737 ?auto_107741 ) ) ( not ( = ?auto_107737 ?auto_107738 ) ) ( not ( = ?auto_107737 ?auto_107742 ) ) ( not ( = ?auto_107740 ?auto_107739 ) ) ( not ( = ?auto_107740 ?auto_107741 ) ) ( not ( = ?auto_107740 ?auto_107738 ) ) ( not ( = ?auto_107740 ?auto_107742 ) ) ( ON ?auto_107736 ?auto_107740 ) ( CLEAR ?auto_107736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107735 ?auto_107737 ?auto_107740 )
      ( MAKE-1PILE ?auto_107735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107743 - BLOCK
    )
    :vars
    (
      ?auto_107747 - BLOCK
      ?auto_107749 - BLOCK
      ?auto_107744 - BLOCK
      ?auto_107745 - BLOCK
      ?auto_107746 - BLOCK
      ?auto_107748 - BLOCK
      ?auto_107750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107747 ?auto_107743 ) ( ON-TABLE ?auto_107743 ) ( not ( = ?auto_107743 ?auto_107747 ) ) ( not ( = ?auto_107743 ?auto_107749 ) ) ( not ( = ?auto_107743 ?auto_107744 ) ) ( not ( = ?auto_107747 ?auto_107749 ) ) ( not ( = ?auto_107747 ?auto_107744 ) ) ( not ( = ?auto_107749 ?auto_107744 ) ) ( ON ?auto_107749 ?auto_107747 ) ( ON-TABLE ?auto_107745 ) ( ON ?auto_107746 ?auto_107745 ) ( ON ?auto_107748 ?auto_107746 ) ( not ( = ?auto_107745 ?auto_107746 ) ) ( not ( = ?auto_107745 ?auto_107748 ) ) ( not ( = ?auto_107745 ?auto_107750 ) ) ( not ( = ?auto_107745 ?auto_107744 ) ) ( not ( = ?auto_107746 ?auto_107748 ) ) ( not ( = ?auto_107746 ?auto_107750 ) ) ( not ( = ?auto_107746 ?auto_107744 ) ) ( not ( = ?auto_107748 ?auto_107750 ) ) ( not ( = ?auto_107748 ?auto_107744 ) ) ( not ( = ?auto_107750 ?auto_107744 ) ) ( not ( = ?auto_107743 ?auto_107750 ) ) ( not ( = ?auto_107743 ?auto_107745 ) ) ( not ( = ?auto_107743 ?auto_107746 ) ) ( not ( = ?auto_107743 ?auto_107748 ) ) ( not ( = ?auto_107747 ?auto_107750 ) ) ( not ( = ?auto_107747 ?auto_107745 ) ) ( not ( = ?auto_107747 ?auto_107746 ) ) ( not ( = ?auto_107747 ?auto_107748 ) ) ( not ( = ?auto_107749 ?auto_107750 ) ) ( not ( = ?auto_107749 ?auto_107745 ) ) ( not ( = ?auto_107749 ?auto_107746 ) ) ( not ( = ?auto_107749 ?auto_107748 ) ) ( ON ?auto_107744 ?auto_107749 ) ( CLEAR ?auto_107744 ) ( HOLDING ?auto_107750 ) ( CLEAR ?auto_107748 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107745 ?auto_107746 ?auto_107748 ?auto_107750 )
      ( MAKE-1PILE ?auto_107743 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107751 - BLOCK
    )
    :vars
    (
      ?auto_107756 - BLOCK
      ?auto_107754 - BLOCK
      ?auto_107757 - BLOCK
      ?auto_107758 - BLOCK
      ?auto_107752 - BLOCK
      ?auto_107755 - BLOCK
      ?auto_107753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107756 ?auto_107751 ) ( ON-TABLE ?auto_107751 ) ( not ( = ?auto_107751 ?auto_107756 ) ) ( not ( = ?auto_107751 ?auto_107754 ) ) ( not ( = ?auto_107751 ?auto_107757 ) ) ( not ( = ?auto_107756 ?auto_107754 ) ) ( not ( = ?auto_107756 ?auto_107757 ) ) ( not ( = ?auto_107754 ?auto_107757 ) ) ( ON ?auto_107754 ?auto_107756 ) ( ON-TABLE ?auto_107758 ) ( ON ?auto_107752 ?auto_107758 ) ( ON ?auto_107755 ?auto_107752 ) ( not ( = ?auto_107758 ?auto_107752 ) ) ( not ( = ?auto_107758 ?auto_107755 ) ) ( not ( = ?auto_107758 ?auto_107753 ) ) ( not ( = ?auto_107758 ?auto_107757 ) ) ( not ( = ?auto_107752 ?auto_107755 ) ) ( not ( = ?auto_107752 ?auto_107753 ) ) ( not ( = ?auto_107752 ?auto_107757 ) ) ( not ( = ?auto_107755 ?auto_107753 ) ) ( not ( = ?auto_107755 ?auto_107757 ) ) ( not ( = ?auto_107753 ?auto_107757 ) ) ( not ( = ?auto_107751 ?auto_107753 ) ) ( not ( = ?auto_107751 ?auto_107758 ) ) ( not ( = ?auto_107751 ?auto_107752 ) ) ( not ( = ?auto_107751 ?auto_107755 ) ) ( not ( = ?auto_107756 ?auto_107753 ) ) ( not ( = ?auto_107756 ?auto_107758 ) ) ( not ( = ?auto_107756 ?auto_107752 ) ) ( not ( = ?auto_107756 ?auto_107755 ) ) ( not ( = ?auto_107754 ?auto_107753 ) ) ( not ( = ?auto_107754 ?auto_107758 ) ) ( not ( = ?auto_107754 ?auto_107752 ) ) ( not ( = ?auto_107754 ?auto_107755 ) ) ( ON ?auto_107757 ?auto_107754 ) ( CLEAR ?auto_107755 ) ( ON ?auto_107753 ?auto_107757 ) ( CLEAR ?auto_107753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107751 ?auto_107756 ?auto_107754 ?auto_107757 )
      ( MAKE-1PILE ?auto_107751 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107759 - BLOCK
    )
    :vars
    (
      ?auto_107765 - BLOCK
      ?auto_107760 - BLOCK
      ?auto_107761 - BLOCK
      ?auto_107762 - BLOCK
      ?auto_107763 - BLOCK
      ?auto_107766 - BLOCK
      ?auto_107764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107765 ?auto_107759 ) ( ON-TABLE ?auto_107759 ) ( not ( = ?auto_107759 ?auto_107765 ) ) ( not ( = ?auto_107759 ?auto_107760 ) ) ( not ( = ?auto_107759 ?auto_107761 ) ) ( not ( = ?auto_107765 ?auto_107760 ) ) ( not ( = ?auto_107765 ?auto_107761 ) ) ( not ( = ?auto_107760 ?auto_107761 ) ) ( ON ?auto_107760 ?auto_107765 ) ( ON-TABLE ?auto_107762 ) ( ON ?auto_107763 ?auto_107762 ) ( not ( = ?auto_107762 ?auto_107763 ) ) ( not ( = ?auto_107762 ?auto_107766 ) ) ( not ( = ?auto_107762 ?auto_107764 ) ) ( not ( = ?auto_107762 ?auto_107761 ) ) ( not ( = ?auto_107763 ?auto_107766 ) ) ( not ( = ?auto_107763 ?auto_107764 ) ) ( not ( = ?auto_107763 ?auto_107761 ) ) ( not ( = ?auto_107766 ?auto_107764 ) ) ( not ( = ?auto_107766 ?auto_107761 ) ) ( not ( = ?auto_107764 ?auto_107761 ) ) ( not ( = ?auto_107759 ?auto_107764 ) ) ( not ( = ?auto_107759 ?auto_107762 ) ) ( not ( = ?auto_107759 ?auto_107763 ) ) ( not ( = ?auto_107759 ?auto_107766 ) ) ( not ( = ?auto_107765 ?auto_107764 ) ) ( not ( = ?auto_107765 ?auto_107762 ) ) ( not ( = ?auto_107765 ?auto_107763 ) ) ( not ( = ?auto_107765 ?auto_107766 ) ) ( not ( = ?auto_107760 ?auto_107764 ) ) ( not ( = ?auto_107760 ?auto_107762 ) ) ( not ( = ?auto_107760 ?auto_107763 ) ) ( not ( = ?auto_107760 ?auto_107766 ) ) ( ON ?auto_107761 ?auto_107760 ) ( ON ?auto_107764 ?auto_107761 ) ( CLEAR ?auto_107764 ) ( HOLDING ?auto_107766 ) ( CLEAR ?auto_107763 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107762 ?auto_107763 ?auto_107766 )
      ( MAKE-1PILE ?auto_107759 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107767 - BLOCK
    )
    :vars
    (
      ?auto_107772 - BLOCK
      ?auto_107774 - BLOCK
      ?auto_107769 - BLOCK
      ?auto_107770 - BLOCK
      ?auto_107771 - BLOCK
      ?auto_107773 - BLOCK
      ?auto_107768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107772 ?auto_107767 ) ( ON-TABLE ?auto_107767 ) ( not ( = ?auto_107767 ?auto_107772 ) ) ( not ( = ?auto_107767 ?auto_107774 ) ) ( not ( = ?auto_107767 ?auto_107769 ) ) ( not ( = ?auto_107772 ?auto_107774 ) ) ( not ( = ?auto_107772 ?auto_107769 ) ) ( not ( = ?auto_107774 ?auto_107769 ) ) ( ON ?auto_107774 ?auto_107772 ) ( ON-TABLE ?auto_107770 ) ( ON ?auto_107771 ?auto_107770 ) ( not ( = ?auto_107770 ?auto_107771 ) ) ( not ( = ?auto_107770 ?auto_107773 ) ) ( not ( = ?auto_107770 ?auto_107768 ) ) ( not ( = ?auto_107770 ?auto_107769 ) ) ( not ( = ?auto_107771 ?auto_107773 ) ) ( not ( = ?auto_107771 ?auto_107768 ) ) ( not ( = ?auto_107771 ?auto_107769 ) ) ( not ( = ?auto_107773 ?auto_107768 ) ) ( not ( = ?auto_107773 ?auto_107769 ) ) ( not ( = ?auto_107768 ?auto_107769 ) ) ( not ( = ?auto_107767 ?auto_107768 ) ) ( not ( = ?auto_107767 ?auto_107770 ) ) ( not ( = ?auto_107767 ?auto_107771 ) ) ( not ( = ?auto_107767 ?auto_107773 ) ) ( not ( = ?auto_107772 ?auto_107768 ) ) ( not ( = ?auto_107772 ?auto_107770 ) ) ( not ( = ?auto_107772 ?auto_107771 ) ) ( not ( = ?auto_107772 ?auto_107773 ) ) ( not ( = ?auto_107774 ?auto_107768 ) ) ( not ( = ?auto_107774 ?auto_107770 ) ) ( not ( = ?auto_107774 ?auto_107771 ) ) ( not ( = ?auto_107774 ?auto_107773 ) ) ( ON ?auto_107769 ?auto_107774 ) ( ON ?auto_107768 ?auto_107769 ) ( CLEAR ?auto_107771 ) ( ON ?auto_107773 ?auto_107768 ) ( CLEAR ?auto_107773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107767 ?auto_107772 ?auto_107774 ?auto_107769 ?auto_107768 )
      ( MAKE-1PILE ?auto_107767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107775 - BLOCK
    )
    :vars
    (
      ?auto_107781 - BLOCK
      ?auto_107780 - BLOCK
      ?auto_107777 - BLOCK
      ?auto_107778 - BLOCK
      ?auto_107782 - BLOCK
      ?auto_107776 - BLOCK
      ?auto_107779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107781 ?auto_107775 ) ( ON-TABLE ?auto_107775 ) ( not ( = ?auto_107775 ?auto_107781 ) ) ( not ( = ?auto_107775 ?auto_107780 ) ) ( not ( = ?auto_107775 ?auto_107777 ) ) ( not ( = ?auto_107781 ?auto_107780 ) ) ( not ( = ?auto_107781 ?auto_107777 ) ) ( not ( = ?auto_107780 ?auto_107777 ) ) ( ON ?auto_107780 ?auto_107781 ) ( ON-TABLE ?auto_107778 ) ( not ( = ?auto_107778 ?auto_107782 ) ) ( not ( = ?auto_107778 ?auto_107776 ) ) ( not ( = ?auto_107778 ?auto_107779 ) ) ( not ( = ?auto_107778 ?auto_107777 ) ) ( not ( = ?auto_107782 ?auto_107776 ) ) ( not ( = ?auto_107782 ?auto_107779 ) ) ( not ( = ?auto_107782 ?auto_107777 ) ) ( not ( = ?auto_107776 ?auto_107779 ) ) ( not ( = ?auto_107776 ?auto_107777 ) ) ( not ( = ?auto_107779 ?auto_107777 ) ) ( not ( = ?auto_107775 ?auto_107779 ) ) ( not ( = ?auto_107775 ?auto_107778 ) ) ( not ( = ?auto_107775 ?auto_107782 ) ) ( not ( = ?auto_107775 ?auto_107776 ) ) ( not ( = ?auto_107781 ?auto_107779 ) ) ( not ( = ?auto_107781 ?auto_107778 ) ) ( not ( = ?auto_107781 ?auto_107782 ) ) ( not ( = ?auto_107781 ?auto_107776 ) ) ( not ( = ?auto_107780 ?auto_107779 ) ) ( not ( = ?auto_107780 ?auto_107778 ) ) ( not ( = ?auto_107780 ?auto_107782 ) ) ( not ( = ?auto_107780 ?auto_107776 ) ) ( ON ?auto_107777 ?auto_107780 ) ( ON ?auto_107779 ?auto_107777 ) ( ON ?auto_107776 ?auto_107779 ) ( CLEAR ?auto_107776 ) ( HOLDING ?auto_107782 ) ( CLEAR ?auto_107778 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107778 ?auto_107782 )
      ( MAKE-1PILE ?auto_107775 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107783 - BLOCK
    )
    :vars
    (
      ?auto_107785 - BLOCK
      ?auto_107790 - BLOCK
      ?auto_107789 - BLOCK
      ?auto_107784 - BLOCK
      ?auto_107786 - BLOCK
      ?auto_107788 - BLOCK
      ?auto_107787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107785 ?auto_107783 ) ( ON-TABLE ?auto_107783 ) ( not ( = ?auto_107783 ?auto_107785 ) ) ( not ( = ?auto_107783 ?auto_107790 ) ) ( not ( = ?auto_107783 ?auto_107789 ) ) ( not ( = ?auto_107785 ?auto_107790 ) ) ( not ( = ?auto_107785 ?auto_107789 ) ) ( not ( = ?auto_107790 ?auto_107789 ) ) ( ON ?auto_107790 ?auto_107785 ) ( ON-TABLE ?auto_107784 ) ( not ( = ?auto_107784 ?auto_107786 ) ) ( not ( = ?auto_107784 ?auto_107788 ) ) ( not ( = ?auto_107784 ?auto_107787 ) ) ( not ( = ?auto_107784 ?auto_107789 ) ) ( not ( = ?auto_107786 ?auto_107788 ) ) ( not ( = ?auto_107786 ?auto_107787 ) ) ( not ( = ?auto_107786 ?auto_107789 ) ) ( not ( = ?auto_107788 ?auto_107787 ) ) ( not ( = ?auto_107788 ?auto_107789 ) ) ( not ( = ?auto_107787 ?auto_107789 ) ) ( not ( = ?auto_107783 ?auto_107787 ) ) ( not ( = ?auto_107783 ?auto_107784 ) ) ( not ( = ?auto_107783 ?auto_107786 ) ) ( not ( = ?auto_107783 ?auto_107788 ) ) ( not ( = ?auto_107785 ?auto_107787 ) ) ( not ( = ?auto_107785 ?auto_107784 ) ) ( not ( = ?auto_107785 ?auto_107786 ) ) ( not ( = ?auto_107785 ?auto_107788 ) ) ( not ( = ?auto_107790 ?auto_107787 ) ) ( not ( = ?auto_107790 ?auto_107784 ) ) ( not ( = ?auto_107790 ?auto_107786 ) ) ( not ( = ?auto_107790 ?auto_107788 ) ) ( ON ?auto_107789 ?auto_107790 ) ( ON ?auto_107787 ?auto_107789 ) ( ON ?auto_107788 ?auto_107787 ) ( CLEAR ?auto_107784 ) ( ON ?auto_107786 ?auto_107788 ) ( CLEAR ?auto_107786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107783 ?auto_107785 ?auto_107790 ?auto_107789 ?auto_107787 ?auto_107788 )
      ( MAKE-1PILE ?auto_107783 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107791 - BLOCK
    )
    :vars
    (
      ?auto_107798 - BLOCK
      ?auto_107797 - BLOCK
      ?auto_107792 - BLOCK
      ?auto_107795 - BLOCK
      ?auto_107793 - BLOCK
      ?auto_107796 - BLOCK
      ?auto_107794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107798 ?auto_107791 ) ( ON-TABLE ?auto_107791 ) ( not ( = ?auto_107791 ?auto_107798 ) ) ( not ( = ?auto_107791 ?auto_107797 ) ) ( not ( = ?auto_107791 ?auto_107792 ) ) ( not ( = ?auto_107798 ?auto_107797 ) ) ( not ( = ?auto_107798 ?auto_107792 ) ) ( not ( = ?auto_107797 ?auto_107792 ) ) ( ON ?auto_107797 ?auto_107798 ) ( not ( = ?auto_107795 ?auto_107793 ) ) ( not ( = ?auto_107795 ?auto_107796 ) ) ( not ( = ?auto_107795 ?auto_107794 ) ) ( not ( = ?auto_107795 ?auto_107792 ) ) ( not ( = ?auto_107793 ?auto_107796 ) ) ( not ( = ?auto_107793 ?auto_107794 ) ) ( not ( = ?auto_107793 ?auto_107792 ) ) ( not ( = ?auto_107796 ?auto_107794 ) ) ( not ( = ?auto_107796 ?auto_107792 ) ) ( not ( = ?auto_107794 ?auto_107792 ) ) ( not ( = ?auto_107791 ?auto_107794 ) ) ( not ( = ?auto_107791 ?auto_107795 ) ) ( not ( = ?auto_107791 ?auto_107793 ) ) ( not ( = ?auto_107791 ?auto_107796 ) ) ( not ( = ?auto_107798 ?auto_107794 ) ) ( not ( = ?auto_107798 ?auto_107795 ) ) ( not ( = ?auto_107798 ?auto_107793 ) ) ( not ( = ?auto_107798 ?auto_107796 ) ) ( not ( = ?auto_107797 ?auto_107794 ) ) ( not ( = ?auto_107797 ?auto_107795 ) ) ( not ( = ?auto_107797 ?auto_107793 ) ) ( not ( = ?auto_107797 ?auto_107796 ) ) ( ON ?auto_107792 ?auto_107797 ) ( ON ?auto_107794 ?auto_107792 ) ( ON ?auto_107796 ?auto_107794 ) ( ON ?auto_107793 ?auto_107796 ) ( CLEAR ?auto_107793 ) ( HOLDING ?auto_107795 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107795 )
      ( MAKE-1PILE ?auto_107791 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_107799 - BLOCK
    )
    :vars
    (
      ?auto_107805 - BLOCK
      ?auto_107800 - BLOCK
      ?auto_107806 - BLOCK
      ?auto_107804 - BLOCK
      ?auto_107802 - BLOCK
      ?auto_107801 - BLOCK
      ?auto_107803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107805 ?auto_107799 ) ( ON-TABLE ?auto_107799 ) ( not ( = ?auto_107799 ?auto_107805 ) ) ( not ( = ?auto_107799 ?auto_107800 ) ) ( not ( = ?auto_107799 ?auto_107806 ) ) ( not ( = ?auto_107805 ?auto_107800 ) ) ( not ( = ?auto_107805 ?auto_107806 ) ) ( not ( = ?auto_107800 ?auto_107806 ) ) ( ON ?auto_107800 ?auto_107805 ) ( not ( = ?auto_107804 ?auto_107802 ) ) ( not ( = ?auto_107804 ?auto_107801 ) ) ( not ( = ?auto_107804 ?auto_107803 ) ) ( not ( = ?auto_107804 ?auto_107806 ) ) ( not ( = ?auto_107802 ?auto_107801 ) ) ( not ( = ?auto_107802 ?auto_107803 ) ) ( not ( = ?auto_107802 ?auto_107806 ) ) ( not ( = ?auto_107801 ?auto_107803 ) ) ( not ( = ?auto_107801 ?auto_107806 ) ) ( not ( = ?auto_107803 ?auto_107806 ) ) ( not ( = ?auto_107799 ?auto_107803 ) ) ( not ( = ?auto_107799 ?auto_107804 ) ) ( not ( = ?auto_107799 ?auto_107802 ) ) ( not ( = ?auto_107799 ?auto_107801 ) ) ( not ( = ?auto_107805 ?auto_107803 ) ) ( not ( = ?auto_107805 ?auto_107804 ) ) ( not ( = ?auto_107805 ?auto_107802 ) ) ( not ( = ?auto_107805 ?auto_107801 ) ) ( not ( = ?auto_107800 ?auto_107803 ) ) ( not ( = ?auto_107800 ?auto_107804 ) ) ( not ( = ?auto_107800 ?auto_107802 ) ) ( not ( = ?auto_107800 ?auto_107801 ) ) ( ON ?auto_107806 ?auto_107800 ) ( ON ?auto_107803 ?auto_107806 ) ( ON ?auto_107801 ?auto_107803 ) ( ON ?auto_107802 ?auto_107801 ) ( ON ?auto_107804 ?auto_107802 ) ( CLEAR ?auto_107804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107799 ?auto_107805 ?auto_107800 ?auto_107806 ?auto_107803 ?auto_107801 ?auto_107802 )
      ( MAKE-1PILE ?auto_107799 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107814 - BLOCK
      ?auto_107815 - BLOCK
      ?auto_107816 - BLOCK
      ?auto_107817 - BLOCK
      ?auto_107818 - BLOCK
      ?auto_107819 - BLOCK
      ?auto_107820 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_107820 ) ( CLEAR ?auto_107819 ) ( ON-TABLE ?auto_107814 ) ( ON ?auto_107815 ?auto_107814 ) ( ON ?auto_107816 ?auto_107815 ) ( ON ?auto_107817 ?auto_107816 ) ( ON ?auto_107818 ?auto_107817 ) ( ON ?auto_107819 ?auto_107818 ) ( not ( = ?auto_107814 ?auto_107815 ) ) ( not ( = ?auto_107814 ?auto_107816 ) ) ( not ( = ?auto_107814 ?auto_107817 ) ) ( not ( = ?auto_107814 ?auto_107818 ) ) ( not ( = ?auto_107814 ?auto_107819 ) ) ( not ( = ?auto_107814 ?auto_107820 ) ) ( not ( = ?auto_107815 ?auto_107816 ) ) ( not ( = ?auto_107815 ?auto_107817 ) ) ( not ( = ?auto_107815 ?auto_107818 ) ) ( not ( = ?auto_107815 ?auto_107819 ) ) ( not ( = ?auto_107815 ?auto_107820 ) ) ( not ( = ?auto_107816 ?auto_107817 ) ) ( not ( = ?auto_107816 ?auto_107818 ) ) ( not ( = ?auto_107816 ?auto_107819 ) ) ( not ( = ?auto_107816 ?auto_107820 ) ) ( not ( = ?auto_107817 ?auto_107818 ) ) ( not ( = ?auto_107817 ?auto_107819 ) ) ( not ( = ?auto_107817 ?auto_107820 ) ) ( not ( = ?auto_107818 ?auto_107819 ) ) ( not ( = ?auto_107818 ?auto_107820 ) ) ( not ( = ?auto_107819 ?auto_107820 ) ) )
    :subtasks
    ( ( !STACK ?auto_107820 ?auto_107819 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107821 - BLOCK
      ?auto_107822 - BLOCK
      ?auto_107823 - BLOCK
      ?auto_107824 - BLOCK
      ?auto_107825 - BLOCK
      ?auto_107826 - BLOCK
      ?auto_107827 - BLOCK
    )
    :vars
    (
      ?auto_107828 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107826 ) ( ON-TABLE ?auto_107821 ) ( ON ?auto_107822 ?auto_107821 ) ( ON ?auto_107823 ?auto_107822 ) ( ON ?auto_107824 ?auto_107823 ) ( ON ?auto_107825 ?auto_107824 ) ( ON ?auto_107826 ?auto_107825 ) ( not ( = ?auto_107821 ?auto_107822 ) ) ( not ( = ?auto_107821 ?auto_107823 ) ) ( not ( = ?auto_107821 ?auto_107824 ) ) ( not ( = ?auto_107821 ?auto_107825 ) ) ( not ( = ?auto_107821 ?auto_107826 ) ) ( not ( = ?auto_107821 ?auto_107827 ) ) ( not ( = ?auto_107822 ?auto_107823 ) ) ( not ( = ?auto_107822 ?auto_107824 ) ) ( not ( = ?auto_107822 ?auto_107825 ) ) ( not ( = ?auto_107822 ?auto_107826 ) ) ( not ( = ?auto_107822 ?auto_107827 ) ) ( not ( = ?auto_107823 ?auto_107824 ) ) ( not ( = ?auto_107823 ?auto_107825 ) ) ( not ( = ?auto_107823 ?auto_107826 ) ) ( not ( = ?auto_107823 ?auto_107827 ) ) ( not ( = ?auto_107824 ?auto_107825 ) ) ( not ( = ?auto_107824 ?auto_107826 ) ) ( not ( = ?auto_107824 ?auto_107827 ) ) ( not ( = ?auto_107825 ?auto_107826 ) ) ( not ( = ?auto_107825 ?auto_107827 ) ) ( not ( = ?auto_107826 ?auto_107827 ) ) ( ON ?auto_107827 ?auto_107828 ) ( CLEAR ?auto_107827 ) ( HAND-EMPTY ) ( not ( = ?auto_107821 ?auto_107828 ) ) ( not ( = ?auto_107822 ?auto_107828 ) ) ( not ( = ?auto_107823 ?auto_107828 ) ) ( not ( = ?auto_107824 ?auto_107828 ) ) ( not ( = ?auto_107825 ?auto_107828 ) ) ( not ( = ?auto_107826 ?auto_107828 ) ) ( not ( = ?auto_107827 ?auto_107828 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107827 ?auto_107828 )
      ( MAKE-7PILE ?auto_107821 ?auto_107822 ?auto_107823 ?auto_107824 ?auto_107825 ?auto_107826 ?auto_107827 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107829 - BLOCK
      ?auto_107830 - BLOCK
      ?auto_107831 - BLOCK
      ?auto_107832 - BLOCK
      ?auto_107833 - BLOCK
      ?auto_107834 - BLOCK
      ?auto_107835 - BLOCK
    )
    :vars
    (
      ?auto_107836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107829 ) ( ON ?auto_107830 ?auto_107829 ) ( ON ?auto_107831 ?auto_107830 ) ( ON ?auto_107832 ?auto_107831 ) ( ON ?auto_107833 ?auto_107832 ) ( not ( = ?auto_107829 ?auto_107830 ) ) ( not ( = ?auto_107829 ?auto_107831 ) ) ( not ( = ?auto_107829 ?auto_107832 ) ) ( not ( = ?auto_107829 ?auto_107833 ) ) ( not ( = ?auto_107829 ?auto_107834 ) ) ( not ( = ?auto_107829 ?auto_107835 ) ) ( not ( = ?auto_107830 ?auto_107831 ) ) ( not ( = ?auto_107830 ?auto_107832 ) ) ( not ( = ?auto_107830 ?auto_107833 ) ) ( not ( = ?auto_107830 ?auto_107834 ) ) ( not ( = ?auto_107830 ?auto_107835 ) ) ( not ( = ?auto_107831 ?auto_107832 ) ) ( not ( = ?auto_107831 ?auto_107833 ) ) ( not ( = ?auto_107831 ?auto_107834 ) ) ( not ( = ?auto_107831 ?auto_107835 ) ) ( not ( = ?auto_107832 ?auto_107833 ) ) ( not ( = ?auto_107832 ?auto_107834 ) ) ( not ( = ?auto_107832 ?auto_107835 ) ) ( not ( = ?auto_107833 ?auto_107834 ) ) ( not ( = ?auto_107833 ?auto_107835 ) ) ( not ( = ?auto_107834 ?auto_107835 ) ) ( ON ?auto_107835 ?auto_107836 ) ( CLEAR ?auto_107835 ) ( not ( = ?auto_107829 ?auto_107836 ) ) ( not ( = ?auto_107830 ?auto_107836 ) ) ( not ( = ?auto_107831 ?auto_107836 ) ) ( not ( = ?auto_107832 ?auto_107836 ) ) ( not ( = ?auto_107833 ?auto_107836 ) ) ( not ( = ?auto_107834 ?auto_107836 ) ) ( not ( = ?auto_107835 ?auto_107836 ) ) ( HOLDING ?auto_107834 ) ( CLEAR ?auto_107833 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107829 ?auto_107830 ?auto_107831 ?auto_107832 ?auto_107833 ?auto_107834 )
      ( MAKE-7PILE ?auto_107829 ?auto_107830 ?auto_107831 ?auto_107832 ?auto_107833 ?auto_107834 ?auto_107835 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107837 - BLOCK
      ?auto_107838 - BLOCK
      ?auto_107839 - BLOCK
      ?auto_107840 - BLOCK
      ?auto_107841 - BLOCK
      ?auto_107842 - BLOCK
      ?auto_107843 - BLOCK
    )
    :vars
    (
      ?auto_107844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107837 ) ( ON ?auto_107838 ?auto_107837 ) ( ON ?auto_107839 ?auto_107838 ) ( ON ?auto_107840 ?auto_107839 ) ( ON ?auto_107841 ?auto_107840 ) ( not ( = ?auto_107837 ?auto_107838 ) ) ( not ( = ?auto_107837 ?auto_107839 ) ) ( not ( = ?auto_107837 ?auto_107840 ) ) ( not ( = ?auto_107837 ?auto_107841 ) ) ( not ( = ?auto_107837 ?auto_107842 ) ) ( not ( = ?auto_107837 ?auto_107843 ) ) ( not ( = ?auto_107838 ?auto_107839 ) ) ( not ( = ?auto_107838 ?auto_107840 ) ) ( not ( = ?auto_107838 ?auto_107841 ) ) ( not ( = ?auto_107838 ?auto_107842 ) ) ( not ( = ?auto_107838 ?auto_107843 ) ) ( not ( = ?auto_107839 ?auto_107840 ) ) ( not ( = ?auto_107839 ?auto_107841 ) ) ( not ( = ?auto_107839 ?auto_107842 ) ) ( not ( = ?auto_107839 ?auto_107843 ) ) ( not ( = ?auto_107840 ?auto_107841 ) ) ( not ( = ?auto_107840 ?auto_107842 ) ) ( not ( = ?auto_107840 ?auto_107843 ) ) ( not ( = ?auto_107841 ?auto_107842 ) ) ( not ( = ?auto_107841 ?auto_107843 ) ) ( not ( = ?auto_107842 ?auto_107843 ) ) ( ON ?auto_107843 ?auto_107844 ) ( not ( = ?auto_107837 ?auto_107844 ) ) ( not ( = ?auto_107838 ?auto_107844 ) ) ( not ( = ?auto_107839 ?auto_107844 ) ) ( not ( = ?auto_107840 ?auto_107844 ) ) ( not ( = ?auto_107841 ?auto_107844 ) ) ( not ( = ?auto_107842 ?auto_107844 ) ) ( not ( = ?auto_107843 ?auto_107844 ) ) ( CLEAR ?auto_107841 ) ( ON ?auto_107842 ?auto_107843 ) ( CLEAR ?auto_107842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107844 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107844 ?auto_107843 )
      ( MAKE-7PILE ?auto_107837 ?auto_107838 ?auto_107839 ?auto_107840 ?auto_107841 ?auto_107842 ?auto_107843 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107845 - BLOCK
      ?auto_107846 - BLOCK
      ?auto_107847 - BLOCK
      ?auto_107848 - BLOCK
      ?auto_107849 - BLOCK
      ?auto_107850 - BLOCK
      ?auto_107851 - BLOCK
    )
    :vars
    (
      ?auto_107852 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107845 ) ( ON ?auto_107846 ?auto_107845 ) ( ON ?auto_107847 ?auto_107846 ) ( ON ?auto_107848 ?auto_107847 ) ( not ( = ?auto_107845 ?auto_107846 ) ) ( not ( = ?auto_107845 ?auto_107847 ) ) ( not ( = ?auto_107845 ?auto_107848 ) ) ( not ( = ?auto_107845 ?auto_107849 ) ) ( not ( = ?auto_107845 ?auto_107850 ) ) ( not ( = ?auto_107845 ?auto_107851 ) ) ( not ( = ?auto_107846 ?auto_107847 ) ) ( not ( = ?auto_107846 ?auto_107848 ) ) ( not ( = ?auto_107846 ?auto_107849 ) ) ( not ( = ?auto_107846 ?auto_107850 ) ) ( not ( = ?auto_107846 ?auto_107851 ) ) ( not ( = ?auto_107847 ?auto_107848 ) ) ( not ( = ?auto_107847 ?auto_107849 ) ) ( not ( = ?auto_107847 ?auto_107850 ) ) ( not ( = ?auto_107847 ?auto_107851 ) ) ( not ( = ?auto_107848 ?auto_107849 ) ) ( not ( = ?auto_107848 ?auto_107850 ) ) ( not ( = ?auto_107848 ?auto_107851 ) ) ( not ( = ?auto_107849 ?auto_107850 ) ) ( not ( = ?auto_107849 ?auto_107851 ) ) ( not ( = ?auto_107850 ?auto_107851 ) ) ( ON ?auto_107851 ?auto_107852 ) ( not ( = ?auto_107845 ?auto_107852 ) ) ( not ( = ?auto_107846 ?auto_107852 ) ) ( not ( = ?auto_107847 ?auto_107852 ) ) ( not ( = ?auto_107848 ?auto_107852 ) ) ( not ( = ?auto_107849 ?auto_107852 ) ) ( not ( = ?auto_107850 ?auto_107852 ) ) ( not ( = ?auto_107851 ?auto_107852 ) ) ( ON ?auto_107850 ?auto_107851 ) ( CLEAR ?auto_107850 ) ( ON-TABLE ?auto_107852 ) ( HOLDING ?auto_107849 ) ( CLEAR ?auto_107848 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107845 ?auto_107846 ?auto_107847 ?auto_107848 ?auto_107849 )
      ( MAKE-7PILE ?auto_107845 ?auto_107846 ?auto_107847 ?auto_107848 ?auto_107849 ?auto_107850 ?auto_107851 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107853 - BLOCK
      ?auto_107854 - BLOCK
      ?auto_107855 - BLOCK
      ?auto_107856 - BLOCK
      ?auto_107857 - BLOCK
      ?auto_107858 - BLOCK
      ?auto_107859 - BLOCK
    )
    :vars
    (
      ?auto_107860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107853 ) ( ON ?auto_107854 ?auto_107853 ) ( ON ?auto_107855 ?auto_107854 ) ( ON ?auto_107856 ?auto_107855 ) ( not ( = ?auto_107853 ?auto_107854 ) ) ( not ( = ?auto_107853 ?auto_107855 ) ) ( not ( = ?auto_107853 ?auto_107856 ) ) ( not ( = ?auto_107853 ?auto_107857 ) ) ( not ( = ?auto_107853 ?auto_107858 ) ) ( not ( = ?auto_107853 ?auto_107859 ) ) ( not ( = ?auto_107854 ?auto_107855 ) ) ( not ( = ?auto_107854 ?auto_107856 ) ) ( not ( = ?auto_107854 ?auto_107857 ) ) ( not ( = ?auto_107854 ?auto_107858 ) ) ( not ( = ?auto_107854 ?auto_107859 ) ) ( not ( = ?auto_107855 ?auto_107856 ) ) ( not ( = ?auto_107855 ?auto_107857 ) ) ( not ( = ?auto_107855 ?auto_107858 ) ) ( not ( = ?auto_107855 ?auto_107859 ) ) ( not ( = ?auto_107856 ?auto_107857 ) ) ( not ( = ?auto_107856 ?auto_107858 ) ) ( not ( = ?auto_107856 ?auto_107859 ) ) ( not ( = ?auto_107857 ?auto_107858 ) ) ( not ( = ?auto_107857 ?auto_107859 ) ) ( not ( = ?auto_107858 ?auto_107859 ) ) ( ON ?auto_107859 ?auto_107860 ) ( not ( = ?auto_107853 ?auto_107860 ) ) ( not ( = ?auto_107854 ?auto_107860 ) ) ( not ( = ?auto_107855 ?auto_107860 ) ) ( not ( = ?auto_107856 ?auto_107860 ) ) ( not ( = ?auto_107857 ?auto_107860 ) ) ( not ( = ?auto_107858 ?auto_107860 ) ) ( not ( = ?auto_107859 ?auto_107860 ) ) ( ON ?auto_107858 ?auto_107859 ) ( ON-TABLE ?auto_107860 ) ( CLEAR ?auto_107856 ) ( ON ?auto_107857 ?auto_107858 ) ( CLEAR ?auto_107857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107860 ?auto_107859 ?auto_107858 )
      ( MAKE-7PILE ?auto_107853 ?auto_107854 ?auto_107855 ?auto_107856 ?auto_107857 ?auto_107858 ?auto_107859 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107861 - BLOCK
      ?auto_107862 - BLOCK
      ?auto_107863 - BLOCK
      ?auto_107864 - BLOCK
      ?auto_107865 - BLOCK
      ?auto_107866 - BLOCK
      ?auto_107867 - BLOCK
    )
    :vars
    (
      ?auto_107868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107861 ) ( ON ?auto_107862 ?auto_107861 ) ( ON ?auto_107863 ?auto_107862 ) ( not ( = ?auto_107861 ?auto_107862 ) ) ( not ( = ?auto_107861 ?auto_107863 ) ) ( not ( = ?auto_107861 ?auto_107864 ) ) ( not ( = ?auto_107861 ?auto_107865 ) ) ( not ( = ?auto_107861 ?auto_107866 ) ) ( not ( = ?auto_107861 ?auto_107867 ) ) ( not ( = ?auto_107862 ?auto_107863 ) ) ( not ( = ?auto_107862 ?auto_107864 ) ) ( not ( = ?auto_107862 ?auto_107865 ) ) ( not ( = ?auto_107862 ?auto_107866 ) ) ( not ( = ?auto_107862 ?auto_107867 ) ) ( not ( = ?auto_107863 ?auto_107864 ) ) ( not ( = ?auto_107863 ?auto_107865 ) ) ( not ( = ?auto_107863 ?auto_107866 ) ) ( not ( = ?auto_107863 ?auto_107867 ) ) ( not ( = ?auto_107864 ?auto_107865 ) ) ( not ( = ?auto_107864 ?auto_107866 ) ) ( not ( = ?auto_107864 ?auto_107867 ) ) ( not ( = ?auto_107865 ?auto_107866 ) ) ( not ( = ?auto_107865 ?auto_107867 ) ) ( not ( = ?auto_107866 ?auto_107867 ) ) ( ON ?auto_107867 ?auto_107868 ) ( not ( = ?auto_107861 ?auto_107868 ) ) ( not ( = ?auto_107862 ?auto_107868 ) ) ( not ( = ?auto_107863 ?auto_107868 ) ) ( not ( = ?auto_107864 ?auto_107868 ) ) ( not ( = ?auto_107865 ?auto_107868 ) ) ( not ( = ?auto_107866 ?auto_107868 ) ) ( not ( = ?auto_107867 ?auto_107868 ) ) ( ON ?auto_107866 ?auto_107867 ) ( ON-TABLE ?auto_107868 ) ( ON ?auto_107865 ?auto_107866 ) ( CLEAR ?auto_107865 ) ( HOLDING ?auto_107864 ) ( CLEAR ?auto_107863 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107861 ?auto_107862 ?auto_107863 ?auto_107864 )
      ( MAKE-7PILE ?auto_107861 ?auto_107862 ?auto_107863 ?auto_107864 ?auto_107865 ?auto_107866 ?auto_107867 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107869 - BLOCK
      ?auto_107870 - BLOCK
      ?auto_107871 - BLOCK
      ?auto_107872 - BLOCK
      ?auto_107873 - BLOCK
      ?auto_107874 - BLOCK
      ?auto_107875 - BLOCK
    )
    :vars
    (
      ?auto_107876 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107869 ) ( ON ?auto_107870 ?auto_107869 ) ( ON ?auto_107871 ?auto_107870 ) ( not ( = ?auto_107869 ?auto_107870 ) ) ( not ( = ?auto_107869 ?auto_107871 ) ) ( not ( = ?auto_107869 ?auto_107872 ) ) ( not ( = ?auto_107869 ?auto_107873 ) ) ( not ( = ?auto_107869 ?auto_107874 ) ) ( not ( = ?auto_107869 ?auto_107875 ) ) ( not ( = ?auto_107870 ?auto_107871 ) ) ( not ( = ?auto_107870 ?auto_107872 ) ) ( not ( = ?auto_107870 ?auto_107873 ) ) ( not ( = ?auto_107870 ?auto_107874 ) ) ( not ( = ?auto_107870 ?auto_107875 ) ) ( not ( = ?auto_107871 ?auto_107872 ) ) ( not ( = ?auto_107871 ?auto_107873 ) ) ( not ( = ?auto_107871 ?auto_107874 ) ) ( not ( = ?auto_107871 ?auto_107875 ) ) ( not ( = ?auto_107872 ?auto_107873 ) ) ( not ( = ?auto_107872 ?auto_107874 ) ) ( not ( = ?auto_107872 ?auto_107875 ) ) ( not ( = ?auto_107873 ?auto_107874 ) ) ( not ( = ?auto_107873 ?auto_107875 ) ) ( not ( = ?auto_107874 ?auto_107875 ) ) ( ON ?auto_107875 ?auto_107876 ) ( not ( = ?auto_107869 ?auto_107876 ) ) ( not ( = ?auto_107870 ?auto_107876 ) ) ( not ( = ?auto_107871 ?auto_107876 ) ) ( not ( = ?auto_107872 ?auto_107876 ) ) ( not ( = ?auto_107873 ?auto_107876 ) ) ( not ( = ?auto_107874 ?auto_107876 ) ) ( not ( = ?auto_107875 ?auto_107876 ) ) ( ON ?auto_107874 ?auto_107875 ) ( ON-TABLE ?auto_107876 ) ( ON ?auto_107873 ?auto_107874 ) ( CLEAR ?auto_107871 ) ( ON ?auto_107872 ?auto_107873 ) ( CLEAR ?auto_107872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107876 ?auto_107875 ?auto_107874 ?auto_107873 )
      ( MAKE-7PILE ?auto_107869 ?auto_107870 ?auto_107871 ?auto_107872 ?auto_107873 ?auto_107874 ?auto_107875 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107877 - BLOCK
      ?auto_107878 - BLOCK
      ?auto_107879 - BLOCK
      ?auto_107880 - BLOCK
      ?auto_107881 - BLOCK
      ?auto_107882 - BLOCK
      ?auto_107883 - BLOCK
    )
    :vars
    (
      ?auto_107884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107877 ) ( ON ?auto_107878 ?auto_107877 ) ( not ( = ?auto_107877 ?auto_107878 ) ) ( not ( = ?auto_107877 ?auto_107879 ) ) ( not ( = ?auto_107877 ?auto_107880 ) ) ( not ( = ?auto_107877 ?auto_107881 ) ) ( not ( = ?auto_107877 ?auto_107882 ) ) ( not ( = ?auto_107877 ?auto_107883 ) ) ( not ( = ?auto_107878 ?auto_107879 ) ) ( not ( = ?auto_107878 ?auto_107880 ) ) ( not ( = ?auto_107878 ?auto_107881 ) ) ( not ( = ?auto_107878 ?auto_107882 ) ) ( not ( = ?auto_107878 ?auto_107883 ) ) ( not ( = ?auto_107879 ?auto_107880 ) ) ( not ( = ?auto_107879 ?auto_107881 ) ) ( not ( = ?auto_107879 ?auto_107882 ) ) ( not ( = ?auto_107879 ?auto_107883 ) ) ( not ( = ?auto_107880 ?auto_107881 ) ) ( not ( = ?auto_107880 ?auto_107882 ) ) ( not ( = ?auto_107880 ?auto_107883 ) ) ( not ( = ?auto_107881 ?auto_107882 ) ) ( not ( = ?auto_107881 ?auto_107883 ) ) ( not ( = ?auto_107882 ?auto_107883 ) ) ( ON ?auto_107883 ?auto_107884 ) ( not ( = ?auto_107877 ?auto_107884 ) ) ( not ( = ?auto_107878 ?auto_107884 ) ) ( not ( = ?auto_107879 ?auto_107884 ) ) ( not ( = ?auto_107880 ?auto_107884 ) ) ( not ( = ?auto_107881 ?auto_107884 ) ) ( not ( = ?auto_107882 ?auto_107884 ) ) ( not ( = ?auto_107883 ?auto_107884 ) ) ( ON ?auto_107882 ?auto_107883 ) ( ON-TABLE ?auto_107884 ) ( ON ?auto_107881 ?auto_107882 ) ( ON ?auto_107880 ?auto_107881 ) ( CLEAR ?auto_107880 ) ( HOLDING ?auto_107879 ) ( CLEAR ?auto_107878 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107877 ?auto_107878 ?auto_107879 )
      ( MAKE-7PILE ?auto_107877 ?auto_107878 ?auto_107879 ?auto_107880 ?auto_107881 ?auto_107882 ?auto_107883 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107885 - BLOCK
      ?auto_107886 - BLOCK
      ?auto_107887 - BLOCK
      ?auto_107888 - BLOCK
      ?auto_107889 - BLOCK
      ?auto_107890 - BLOCK
      ?auto_107891 - BLOCK
    )
    :vars
    (
      ?auto_107892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107885 ) ( ON ?auto_107886 ?auto_107885 ) ( not ( = ?auto_107885 ?auto_107886 ) ) ( not ( = ?auto_107885 ?auto_107887 ) ) ( not ( = ?auto_107885 ?auto_107888 ) ) ( not ( = ?auto_107885 ?auto_107889 ) ) ( not ( = ?auto_107885 ?auto_107890 ) ) ( not ( = ?auto_107885 ?auto_107891 ) ) ( not ( = ?auto_107886 ?auto_107887 ) ) ( not ( = ?auto_107886 ?auto_107888 ) ) ( not ( = ?auto_107886 ?auto_107889 ) ) ( not ( = ?auto_107886 ?auto_107890 ) ) ( not ( = ?auto_107886 ?auto_107891 ) ) ( not ( = ?auto_107887 ?auto_107888 ) ) ( not ( = ?auto_107887 ?auto_107889 ) ) ( not ( = ?auto_107887 ?auto_107890 ) ) ( not ( = ?auto_107887 ?auto_107891 ) ) ( not ( = ?auto_107888 ?auto_107889 ) ) ( not ( = ?auto_107888 ?auto_107890 ) ) ( not ( = ?auto_107888 ?auto_107891 ) ) ( not ( = ?auto_107889 ?auto_107890 ) ) ( not ( = ?auto_107889 ?auto_107891 ) ) ( not ( = ?auto_107890 ?auto_107891 ) ) ( ON ?auto_107891 ?auto_107892 ) ( not ( = ?auto_107885 ?auto_107892 ) ) ( not ( = ?auto_107886 ?auto_107892 ) ) ( not ( = ?auto_107887 ?auto_107892 ) ) ( not ( = ?auto_107888 ?auto_107892 ) ) ( not ( = ?auto_107889 ?auto_107892 ) ) ( not ( = ?auto_107890 ?auto_107892 ) ) ( not ( = ?auto_107891 ?auto_107892 ) ) ( ON ?auto_107890 ?auto_107891 ) ( ON-TABLE ?auto_107892 ) ( ON ?auto_107889 ?auto_107890 ) ( ON ?auto_107888 ?auto_107889 ) ( CLEAR ?auto_107886 ) ( ON ?auto_107887 ?auto_107888 ) ( CLEAR ?auto_107887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107892 ?auto_107891 ?auto_107890 ?auto_107889 ?auto_107888 )
      ( MAKE-7PILE ?auto_107885 ?auto_107886 ?auto_107887 ?auto_107888 ?auto_107889 ?auto_107890 ?auto_107891 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107893 - BLOCK
      ?auto_107894 - BLOCK
      ?auto_107895 - BLOCK
      ?auto_107896 - BLOCK
      ?auto_107897 - BLOCK
      ?auto_107898 - BLOCK
      ?auto_107899 - BLOCK
    )
    :vars
    (
      ?auto_107900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107893 ) ( not ( = ?auto_107893 ?auto_107894 ) ) ( not ( = ?auto_107893 ?auto_107895 ) ) ( not ( = ?auto_107893 ?auto_107896 ) ) ( not ( = ?auto_107893 ?auto_107897 ) ) ( not ( = ?auto_107893 ?auto_107898 ) ) ( not ( = ?auto_107893 ?auto_107899 ) ) ( not ( = ?auto_107894 ?auto_107895 ) ) ( not ( = ?auto_107894 ?auto_107896 ) ) ( not ( = ?auto_107894 ?auto_107897 ) ) ( not ( = ?auto_107894 ?auto_107898 ) ) ( not ( = ?auto_107894 ?auto_107899 ) ) ( not ( = ?auto_107895 ?auto_107896 ) ) ( not ( = ?auto_107895 ?auto_107897 ) ) ( not ( = ?auto_107895 ?auto_107898 ) ) ( not ( = ?auto_107895 ?auto_107899 ) ) ( not ( = ?auto_107896 ?auto_107897 ) ) ( not ( = ?auto_107896 ?auto_107898 ) ) ( not ( = ?auto_107896 ?auto_107899 ) ) ( not ( = ?auto_107897 ?auto_107898 ) ) ( not ( = ?auto_107897 ?auto_107899 ) ) ( not ( = ?auto_107898 ?auto_107899 ) ) ( ON ?auto_107899 ?auto_107900 ) ( not ( = ?auto_107893 ?auto_107900 ) ) ( not ( = ?auto_107894 ?auto_107900 ) ) ( not ( = ?auto_107895 ?auto_107900 ) ) ( not ( = ?auto_107896 ?auto_107900 ) ) ( not ( = ?auto_107897 ?auto_107900 ) ) ( not ( = ?auto_107898 ?auto_107900 ) ) ( not ( = ?auto_107899 ?auto_107900 ) ) ( ON ?auto_107898 ?auto_107899 ) ( ON-TABLE ?auto_107900 ) ( ON ?auto_107897 ?auto_107898 ) ( ON ?auto_107896 ?auto_107897 ) ( ON ?auto_107895 ?auto_107896 ) ( CLEAR ?auto_107895 ) ( HOLDING ?auto_107894 ) ( CLEAR ?auto_107893 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107893 ?auto_107894 )
      ( MAKE-7PILE ?auto_107893 ?auto_107894 ?auto_107895 ?auto_107896 ?auto_107897 ?auto_107898 ?auto_107899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107901 - BLOCK
      ?auto_107902 - BLOCK
      ?auto_107903 - BLOCK
      ?auto_107904 - BLOCK
      ?auto_107905 - BLOCK
      ?auto_107906 - BLOCK
      ?auto_107907 - BLOCK
    )
    :vars
    (
      ?auto_107908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107901 ) ( not ( = ?auto_107901 ?auto_107902 ) ) ( not ( = ?auto_107901 ?auto_107903 ) ) ( not ( = ?auto_107901 ?auto_107904 ) ) ( not ( = ?auto_107901 ?auto_107905 ) ) ( not ( = ?auto_107901 ?auto_107906 ) ) ( not ( = ?auto_107901 ?auto_107907 ) ) ( not ( = ?auto_107902 ?auto_107903 ) ) ( not ( = ?auto_107902 ?auto_107904 ) ) ( not ( = ?auto_107902 ?auto_107905 ) ) ( not ( = ?auto_107902 ?auto_107906 ) ) ( not ( = ?auto_107902 ?auto_107907 ) ) ( not ( = ?auto_107903 ?auto_107904 ) ) ( not ( = ?auto_107903 ?auto_107905 ) ) ( not ( = ?auto_107903 ?auto_107906 ) ) ( not ( = ?auto_107903 ?auto_107907 ) ) ( not ( = ?auto_107904 ?auto_107905 ) ) ( not ( = ?auto_107904 ?auto_107906 ) ) ( not ( = ?auto_107904 ?auto_107907 ) ) ( not ( = ?auto_107905 ?auto_107906 ) ) ( not ( = ?auto_107905 ?auto_107907 ) ) ( not ( = ?auto_107906 ?auto_107907 ) ) ( ON ?auto_107907 ?auto_107908 ) ( not ( = ?auto_107901 ?auto_107908 ) ) ( not ( = ?auto_107902 ?auto_107908 ) ) ( not ( = ?auto_107903 ?auto_107908 ) ) ( not ( = ?auto_107904 ?auto_107908 ) ) ( not ( = ?auto_107905 ?auto_107908 ) ) ( not ( = ?auto_107906 ?auto_107908 ) ) ( not ( = ?auto_107907 ?auto_107908 ) ) ( ON ?auto_107906 ?auto_107907 ) ( ON-TABLE ?auto_107908 ) ( ON ?auto_107905 ?auto_107906 ) ( ON ?auto_107904 ?auto_107905 ) ( ON ?auto_107903 ?auto_107904 ) ( CLEAR ?auto_107901 ) ( ON ?auto_107902 ?auto_107903 ) ( CLEAR ?auto_107902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107908 ?auto_107907 ?auto_107906 ?auto_107905 ?auto_107904 ?auto_107903 )
      ( MAKE-7PILE ?auto_107901 ?auto_107902 ?auto_107903 ?auto_107904 ?auto_107905 ?auto_107906 ?auto_107907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107909 - BLOCK
      ?auto_107910 - BLOCK
      ?auto_107911 - BLOCK
      ?auto_107912 - BLOCK
      ?auto_107913 - BLOCK
      ?auto_107914 - BLOCK
      ?auto_107915 - BLOCK
    )
    :vars
    (
      ?auto_107916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107909 ?auto_107910 ) ) ( not ( = ?auto_107909 ?auto_107911 ) ) ( not ( = ?auto_107909 ?auto_107912 ) ) ( not ( = ?auto_107909 ?auto_107913 ) ) ( not ( = ?auto_107909 ?auto_107914 ) ) ( not ( = ?auto_107909 ?auto_107915 ) ) ( not ( = ?auto_107910 ?auto_107911 ) ) ( not ( = ?auto_107910 ?auto_107912 ) ) ( not ( = ?auto_107910 ?auto_107913 ) ) ( not ( = ?auto_107910 ?auto_107914 ) ) ( not ( = ?auto_107910 ?auto_107915 ) ) ( not ( = ?auto_107911 ?auto_107912 ) ) ( not ( = ?auto_107911 ?auto_107913 ) ) ( not ( = ?auto_107911 ?auto_107914 ) ) ( not ( = ?auto_107911 ?auto_107915 ) ) ( not ( = ?auto_107912 ?auto_107913 ) ) ( not ( = ?auto_107912 ?auto_107914 ) ) ( not ( = ?auto_107912 ?auto_107915 ) ) ( not ( = ?auto_107913 ?auto_107914 ) ) ( not ( = ?auto_107913 ?auto_107915 ) ) ( not ( = ?auto_107914 ?auto_107915 ) ) ( ON ?auto_107915 ?auto_107916 ) ( not ( = ?auto_107909 ?auto_107916 ) ) ( not ( = ?auto_107910 ?auto_107916 ) ) ( not ( = ?auto_107911 ?auto_107916 ) ) ( not ( = ?auto_107912 ?auto_107916 ) ) ( not ( = ?auto_107913 ?auto_107916 ) ) ( not ( = ?auto_107914 ?auto_107916 ) ) ( not ( = ?auto_107915 ?auto_107916 ) ) ( ON ?auto_107914 ?auto_107915 ) ( ON-TABLE ?auto_107916 ) ( ON ?auto_107913 ?auto_107914 ) ( ON ?auto_107912 ?auto_107913 ) ( ON ?auto_107911 ?auto_107912 ) ( ON ?auto_107910 ?auto_107911 ) ( CLEAR ?auto_107910 ) ( HOLDING ?auto_107909 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107909 )
      ( MAKE-7PILE ?auto_107909 ?auto_107910 ?auto_107911 ?auto_107912 ?auto_107913 ?auto_107914 ?auto_107915 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107917 - BLOCK
      ?auto_107918 - BLOCK
      ?auto_107919 - BLOCK
      ?auto_107920 - BLOCK
      ?auto_107921 - BLOCK
      ?auto_107922 - BLOCK
      ?auto_107923 - BLOCK
    )
    :vars
    (
      ?auto_107924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107917 ?auto_107918 ) ) ( not ( = ?auto_107917 ?auto_107919 ) ) ( not ( = ?auto_107917 ?auto_107920 ) ) ( not ( = ?auto_107917 ?auto_107921 ) ) ( not ( = ?auto_107917 ?auto_107922 ) ) ( not ( = ?auto_107917 ?auto_107923 ) ) ( not ( = ?auto_107918 ?auto_107919 ) ) ( not ( = ?auto_107918 ?auto_107920 ) ) ( not ( = ?auto_107918 ?auto_107921 ) ) ( not ( = ?auto_107918 ?auto_107922 ) ) ( not ( = ?auto_107918 ?auto_107923 ) ) ( not ( = ?auto_107919 ?auto_107920 ) ) ( not ( = ?auto_107919 ?auto_107921 ) ) ( not ( = ?auto_107919 ?auto_107922 ) ) ( not ( = ?auto_107919 ?auto_107923 ) ) ( not ( = ?auto_107920 ?auto_107921 ) ) ( not ( = ?auto_107920 ?auto_107922 ) ) ( not ( = ?auto_107920 ?auto_107923 ) ) ( not ( = ?auto_107921 ?auto_107922 ) ) ( not ( = ?auto_107921 ?auto_107923 ) ) ( not ( = ?auto_107922 ?auto_107923 ) ) ( ON ?auto_107923 ?auto_107924 ) ( not ( = ?auto_107917 ?auto_107924 ) ) ( not ( = ?auto_107918 ?auto_107924 ) ) ( not ( = ?auto_107919 ?auto_107924 ) ) ( not ( = ?auto_107920 ?auto_107924 ) ) ( not ( = ?auto_107921 ?auto_107924 ) ) ( not ( = ?auto_107922 ?auto_107924 ) ) ( not ( = ?auto_107923 ?auto_107924 ) ) ( ON ?auto_107922 ?auto_107923 ) ( ON-TABLE ?auto_107924 ) ( ON ?auto_107921 ?auto_107922 ) ( ON ?auto_107920 ?auto_107921 ) ( ON ?auto_107919 ?auto_107920 ) ( ON ?auto_107918 ?auto_107919 ) ( ON ?auto_107917 ?auto_107918 ) ( CLEAR ?auto_107917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107924 ?auto_107923 ?auto_107922 ?auto_107921 ?auto_107920 ?auto_107919 ?auto_107918 )
      ( MAKE-7PILE ?auto_107917 ?auto_107918 ?auto_107919 ?auto_107920 ?auto_107921 ?auto_107922 ?auto_107923 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107931 - BLOCK
      ?auto_107932 - BLOCK
      ?auto_107933 - BLOCK
      ?auto_107934 - BLOCK
      ?auto_107935 - BLOCK
      ?auto_107936 - BLOCK
    )
    :vars
    (
      ?auto_107937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107937 ?auto_107936 ) ( CLEAR ?auto_107937 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107931 ) ( ON ?auto_107932 ?auto_107931 ) ( ON ?auto_107933 ?auto_107932 ) ( ON ?auto_107934 ?auto_107933 ) ( ON ?auto_107935 ?auto_107934 ) ( ON ?auto_107936 ?auto_107935 ) ( not ( = ?auto_107931 ?auto_107932 ) ) ( not ( = ?auto_107931 ?auto_107933 ) ) ( not ( = ?auto_107931 ?auto_107934 ) ) ( not ( = ?auto_107931 ?auto_107935 ) ) ( not ( = ?auto_107931 ?auto_107936 ) ) ( not ( = ?auto_107931 ?auto_107937 ) ) ( not ( = ?auto_107932 ?auto_107933 ) ) ( not ( = ?auto_107932 ?auto_107934 ) ) ( not ( = ?auto_107932 ?auto_107935 ) ) ( not ( = ?auto_107932 ?auto_107936 ) ) ( not ( = ?auto_107932 ?auto_107937 ) ) ( not ( = ?auto_107933 ?auto_107934 ) ) ( not ( = ?auto_107933 ?auto_107935 ) ) ( not ( = ?auto_107933 ?auto_107936 ) ) ( not ( = ?auto_107933 ?auto_107937 ) ) ( not ( = ?auto_107934 ?auto_107935 ) ) ( not ( = ?auto_107934 ?auto_107936 ) ) ( not ( = ?auto_107934 ?auto_107937 ) ) ( not ( = ?auto_107935 ?auto_107936 ) ) ( not ( = ?auto_107935 ?auto_107937 ) ) ( not ( = ?auto_107936 ?auto_107937 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107937 ?auto_107936 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107953 - BLOCK
      ?auto_107954 - BLOCK
      ?auto_107955 - BLOCK
      ?auto_107956 - BLOCK
      ?auto_107957 - BLOCK
      ?auto_107958 - BLOCK
    )
    :vars
    (
      ?auto_107959 - BLOCK
      ?auto_107960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107953 ) ( ON ?auto_107954 ?auto_107953 ) ( ON ?auto_107955 ?auto_107954 ) ( ON ?auto_107956 ?auto_107955 ) ( ON ?auto_107957 ?auto_107956 ) ( not ( = ?auto_107953 ?auto_107954 ) ) ( not ( = ?auto_107953 ?auto_107955 ) ) ( not ( = ?auto_107953 ?auto_107956 ) ) ( not ( = ?auto_107953 ?auto_107957 ) ) ( not ( = ?auto_107953 ?auto_107958 ) ) ( not ( = ?auto_107953 ?auto_107959 ) ) ( not ( = ?auto_107954 ?auto_107955 ) ) ( not ( = ?auto_107954 ?auto_107956 ) ) ( not ( = ?auto_107954 ?auto_107957 ) ) ( not ( = ?auto_107954 ?auto_107958 ) ) ( not ( = ?auto_107954 ?auto_107959 ) ) ( not ( = ?auto_107955 ?auto_107956 ) ) ( not ( = ?auto_107955 ?auto_107957 ) ) ( not ( = ?auto_107955 ?auto_107958 ) ) ( not ( = ?auto_107955 ?auto_107959 ) ) ( not ( = ?auto_107956 ?auto_107957 ) ) ( not ( = ?auto_107956 ?auto_107958 ) ) ( not ( = ?auto_107956 ?auto_107959 ) ) ( not ( = ?auto_107957 ?auto_107958 ) ) ( not ( = ?auto_107957 ?auto_107959 ) ) ( not ( = ?auto_107958 ?auto_107959 ) ) ( ON ?auto_107959 ?auto_107960 ) ( CLEAR ?auto_107959 ) ( not ( = ?auto_107953 ?auto_107960 ) ) ( not ( = ?auto_107954 ?auto_107960 ) ) ( not ( = ?auto_107955 ?auto_107960 ) ) ( not ( = ?auto_107956 ?auto_107960 ) ) ( not ( = ?auto_107957 ?auto_107960 ) ) ( not ( = ?auto_107958 ?auto_107960 ) ) ( not ( = ?auto_107959 ?auto_107960 ) ) ( HOLDING ?auto_107958 ) ( CLEAR ?auto_107957 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107953 ?auto_107954 ?auto_107955 ?auto_107956 ?auto_107957 ?auto_107958 ?auto_107959 )
      ( MAKE-6PILE ?auto_107953 ?auto_107954 ?auto_107955 ?auto_107956 ?auto_107957 ?auto_107958 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107961 - BLOCK
      ?auto_107962 - BLOCK
      ?auto_107963 - BLOCK
      ?auto_107964 - BLOCK
      ?auto_107965 - BLOCK
      ?auto_107966 - BLOCK
    )
    :vars
    (
      ?auto_107968 - BLOCK
      ?auto_107967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107961 ) ( ON ?auto_107962 ?auto_107961 ) ( ON ?auto_107963 ?auto_107962 ) ( ON ?auto_107964 ?auto_107963 ) ( ON ?auto_107965 ?auto_107964 ) ( not ( = ?auto_107961 ?auto_107962 ) ) ( not ( = ?auto_107961 ?auto_107963 ) ) ( not ( = ?auto_107961 ?auto_107964 ) ) ( not ( = ?auto_107961 ?auto_107965 ) ) ( not ( = ?auto_107961 ?auto_107966 ) ) ( not ( = ?auto_107961 ?auto_107968 ) ) ( not ( = ?auto_107962 ?auto_107963 ) ) ( not ( = ?auto_107962 ?auto_107964 ) ) ( not ( = ?auto_107962 ?auto_107965 ) ) ( not ( = ?auto_107962 ?auto_107966 ) ) ( not ( = ?auto_107962 ?auto_107968 ) ) ( not ( = ?auto_107963 ?auto_107964 ) ) ( not ( = ?auto_107963 ?auto_107965 ) ) ( not ( = ?auto_107963 ?auto_107966 ) ) ( not ( = ?auto_107963 ?auto_107968 ) ) ( not ( = ?auto_107964 ?auto_107965 ) ) ( not ( = ?auto_107964 ?auto_107966 ) ) ( not ( = ?auto_107964 ?auto_107968 ) ) ( not ( = ?auto_107965 ?auto_107966 ) ) ( not ( = ?auto_107965 ?auto_107968 ) ) ( not ( = ?auto_107966 ?auto_107968 ) ) ( ON ?auto_107968 ?auto_107967 ) ( not ( = ?auto_107961 ?auto_107967 ) ) ( not ( = ?auto_107962 ?auto_107967 ) ) ( not ( = ?auto_107963 ?auto_107967 ) ) ( not ( = ?auto_107964 ?auto_107967 ) ) ( not ( = ?auto_107965 ?auto_107967 ) ) ( not ( = ?auto_107966 ?auto_107967 ) ) ( not ( = ?auto_107968 ?auto_107967 ) ) ( CLEAR ?auto_107965 ) ( ON ?auto_107966 ?auto_107968 ) ( CLEAR ?auto_107966 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107967 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107967 ?auto_107968 )
      ( MAKE-6PILE ?auto_107961 ?auto_107962 ?auto_107963 ?auto_107964 ?auto_107965 ?auto_107966 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107969 - BLOCK
      ?auto_107970 - BLOCK
      ?auto_107971 - BLOCK
      ?auto_107972 - BLOCK
      ?auto_107973 - BLOCK
      ?auto_107974 - BLOCK
    )
    :vars
    (
      ?auto_107976 - BLOCK
      ?auto_107975 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107969 ) ( ON ?auto_107970 ?auto_107969 ) ( ON ?auto_107971 ?auto_107970 ) ( ON ?auto_107972 ?auto_107971 ) ( not ( = ?auto_107969 ?auto_107970 ) ) ( not ( = ?auto_107969 ?auto_107971 ) ) ( not ( = ?auto_107969 ?auto_107972 ) ) ( not ( = ?auto_107969 ?auto_107973 ) ) ( not ( = ?auto_107969 ?auto_107974 ) ) ( not ( = ?auto_107969 ?auto_107976 ) ) ( not ( = ?auto_107970 ?auto_107971 ) ) ( not ( = ?auto_107970 ?auto_107972 ) ) ( not ( = ?auto_107970 ?auto_107973 ) ) ( not ( = ?auto_107970 ?auto_107974 ) ) ( not ( = ?auto_107970 ?auto_107976 ) ) ( not ( = ?auto_107971 ?auto_107972 ) ) ( not ( = ?auto_107971 ?auto_107973 ) ) ( not ( = ?auto_107971 ?auto_107974 ) ) ( not ( = ?auto_107971 ?auto_107976 ) ) ( not ( = ?auto_107972 ?auto_107973 ) ) ( not ( = ?auto_107972 ?auto_107974 ) ) ( not ( = ?auto_107972 ?auto_107976 ) ) ( not ( = ?auto_107973 ?auto_107974 ) ) ( not ( = ?auto_107973 ?auto_107976 ) ) ( not ( = ?auto_107974 ?auto_107976 ) ) ( ON ?auto_107976 ?auto_107975 ) ( not ( = ?auto_107969 ?auto_107975 ) ) ( not ( = ?auto_107970 ?auto_107975 ) ) ( not ( = ?auto_107971 ?auto_107975 ) ) ( not ( = ?auto_107972 ?auto_107975 ) ) ( not ( = ?auto_107973 ?auto_107975 ) ) ( not ( = ?auto_107974 ?auto_107975 ) ) ( not ( = ?auto_107976 ?auto_107975 ) ) ( ON ?auto_107974 ?auto_107976 ) ( CLEAR ?auto_107974 ) ( ON-TABLE ?auto_107975 ) ( HOLDING ?auto_107973 ) ( CLEAR ?auto_107972 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107969 ?auto_107970 ?auto_107971 ?auto_107972 ?auto_107973 )
      ( MAKE-6PILE ?auto_107969 ?auto_107970 ?auto_107971 ?auto_107972 ?auto_107973 ?auto_107974 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107977 - BLOCK
      ?auto_107978 - BLOCK
      ?auto_107979 - BLOCK
      ?auto_107980 - BLOCK
      ?auto_107981 - BLOCK
      ?auto_107982 - BLOCK
    )
    :vars
    (
      ?auto_107984 - BLOCK
      ?auto_107983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107977 ) ( ON ?auto_107978 ?auto_107977 ) ( ON ?auto_107979 ?auto_107978 ) ( ON ?auto_107980 ?auto_107979 ) ( not ( = ?auto_107977 ?auto_107978 ) ) ( not ( = ?auto_107977 ?auto_107979 ) ) ( not ( = ?auto_107977 ?auto_107980 ) ) ( not ( = ?auto_107977 ?auto_107981 ) ) ( not ( = ?auto_107977 ?auto_107982 ) ) ( not ( = ?auto_107977 ?auto_107984 ) ) ( not ( = ?auto_107978 ?auto_107979 ) ) ( not ( = ?auto_107978 ?auto_107980 ) ) ( not ( = ?auto_107978 ?auto_107981 ) ) ( not ( = ?auto_107978 ?auto_107982 ) ) ( not ( = ?auto_107978 ?auto_107984 ) ) ( not ( = ?auto_107979 ?auto_107980 ) ) ( not ( = ?auto_107979 ?auto_107981 ) ) ( not ( = ?auto_107979 ?auto_107982 ) ) ( not ( = ?auto_107979 ?auto_107984 ) ) ( not ( = ?auto_107980 ?auto_107981 ) ) ( not ( = ?auto_107980 ?auto_107982 ) ) ( not ( = ?auto_107980 ?auto_107984 ) ) ( not ( = ?auto_107981 ?auto_107982 ) ) ( not ( = ?auto_107981 ?auto_107984 ) ) ( not ( = ?auto_107982 ?auto_107984 ) ) ( ON ?auto_107984 ?auto_107983 ) ( not ( = ?auto_107977 ?auto_107983 ) ) ( not ( = ?auto_107978 ?auto_107983 ) ) ( not ( = ?auto_107979 ?auto_107983 ) ) ( not ( = ?auto_107980 ?auto_107983 ) ) ( not ( = ?auto_107981 ?auto_107983 ) ) ( not ( = ?auto_107982 ?auto_107983 ) ) ( not ( = ?auto_107984 ?auto_107983 ) ) ( ON ?auto_107982 ?auto_107984 ) ( ON-TABLE ?auto_107983 ) ( CLEAR ?auto_107980 ) ( ON ?auto_107981 ?auto_107982 ) ( CLEAR ?auto_107981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107983 ?auto_107984 ?auto_107982 )
      ( MAKE-6PILE ?auto_107977 ?auto_107978 ?auto_107979 ?auto_107980 ?auto_107981 ?auto_107982 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107985 - BLOCK
      ?auto_107986 - BLOCK
      ?auto_107987 - BLOCK
      ?auto_107988 - BLOCK
      ?auto_107989 - BLOCK
      ?auto_107990 - BLOCK
    )
    :vars
    (
      ?auto_107992 - BLOCK
      ?auto_107991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107985 ) ( ON ?auto_107986 ?auto_107985 ) ( ON ?auto_107987 ?auto_107986 ) ( not ( = ?auto_107985 ?auto_107986 ) ) ( not ( = ?auto_107985 ?auto_107987 ) ) ( not ( = ?auto_107985 ?auto_107988 ) ) ( not ( = ?auto_107985 ?auto_107989 ) ) ( not ( = ?auto_107985 ?auto_107990 ) ) ( not ( = ?auto_107985 ?auto_107992 ) ) ( not ( = ?auto_107986 ?auto_107987 ) ) ( not ( = ?auto_107986 ?auto_107988 ) ) ( not ( = ?auto_107986 ?auto_107989 ) ) ( not ( = ?auto_107986 ?auto_107990 ) ) ( not ( = ?auto_107986 ?auto_107992 ) ) ( not ( = ?auto_107987 ?auto_107988 ) ) ( not ( = ?auto_107987 ?auto_107989 ) ) ( not ( = ?auto_107987 ?auto_107990 ) ) ( not ( = ?auto_107987 ?auto_107992 ) ) ( not ( = ?auto_107988 ?auto_107989 ) ) ( not ( = ?auto_107988 ?auto_107990 ) ) ( not ( = ?auto_107988 ?auto_107992 ) ) ( not ( = ?auto_107989 ?auto_107990 ) ) ( not ( = ?auto_107989 ?auto_107992 ) ) ( not ( = ?auto_107990 ?auto_107992 ) ) ( ON ?auto_107992 ?auto_107991 ) ( not ( = ?auto_107985 ?auto_107991 ) ) ( not ( = ?auto_107986 ?auto_107991 ) ) ( not ( = ?auto_107987 ?auto_107991 ) ) ( not ( = ?auto_107988 ?auto_107991 ) ) ( not ( = ?auto_107989 ?auto_107991 ) ) ( not ( = ?auto_107990 ?auto_107991 ) ) ( not ( = ?auto_107992 ?auto_107991 ) ) ( ON ?auto_107990 ?auto_107992 ) ( ON-TABLE ?auto_107991 ) ( ON ?auto_107989 ?auto_107990 ) ( CLEAR ?auto_107989 ) ( HOLDING ?auto_107988 ) ( CLEAR ?auto_107987 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107985 ?auto_107986 ?auto_107987 ?auto_107988 )
      ( MAKE-6PILE ?auto_107985 ?auto_107986 ?auto_107987 ?auto_107988 ?auto_107989 ?auto_107990 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107993 - BLOCK
      ?auto_107994 - BLOCK
      ?auto_107995 - BLOCK
      ?auto_107996 - BLOCK
      ?auto_107997 - BLOCK
      ?auto_107998 - BLOCK
    )
    :vars
    (
      ?auto_108000 - BLOCK
      ?auto_107999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107993 ) ( ON ?auto_107994 ?auto_107993 ) ( ON ?auto_107995 ?auto_107994 ) ( not ( = ?auto_107993 ?auto_107994 ) ) ( not ( = ?auto_107993 ?auto_107995 ) ) ( not ( = ?auto_107993 ?auto_107996 ) ) ( not ( = ?auto_107993 ?auto_107997 ) ) ( not ( = ?auto_107993 ?auto_107998 ) ) ( not ( = ?auto_107993 ?auto_108000 ) ) ( not ( = ?auto_107994 ?auto_107995 ) ) ( not ( = ?auto_107994 ?auto_107996 ) ) ( not ( = ?auto_107994 ?auto_107997 ) ) ( not ( = ?auto_107994 ?auto_107998 ) ) ( not ( = ?auto_107994 ?auto_108000 ) ) ( not ( = ?auto_107995 ?auto_107996 ) ) ( not ( = ?auto_107995 ?auto_107997 ) ) ( not ( = ?auto_107995 ?auto_107998 ) ) ( not ( = ?auto_107995 ?auto_108000 ) ) ( not ( = ?auto_107996 ?auto_107997 ) ) ( not ( = ?auto_107996 ?auto_107998 ) ) ( not ( = ?auto_107996 ?auto_108000 ) ) ( not ( = ?auto_107997 ?auto_107998 ) ) ( not ( = ?auto_107997 ?auto_108000 ) ) ( not ( = ?auto_107998 ?auto_108000 ) ) ( ON ?auto_108000 ?auto_107999 ) ( not ( = ?auto_107993 ?auto_107999 ) ) ( not ( = ?auto_107994 ?auto_107999 ) ) ( not ( = ?auto_107995 ?auto_107999 ) ) ( not ( = ?auto_107996 ?auto_107999 ) ) ( not ( = ?auto_107997 ?auto_107999 ) ) ( not ( = ?auto_107998 ?auto_107999 ) ) ( not ( = ?auto_108000 ?auto_107999 ) ) ( ON ?auto_107998 ?auto_108000 ) ( ON-TABLE ?auto_107999 ) ( ON ?auto_107997 ?auto_107998 ) ( CLEAR ?auto_107995 ) ( ON ?auto_107996 ?auto_107997 ) ( CLEAR ?auto_107996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107999 ?auto_108000 ?auto_107998 ?auto_107997 )
      ( MAKE-6PILE ?auto_107993 ?auto_107994 ?auto_107995 ?auto_107996 ?auto_107997 ?auto_107998 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108001 - BLOCK
      ?auto_108002 - BLOCK
      ?auto_108003 - BLOCK
      ?auto_108004 - BLOCK
      ?auto_108005 - BLOCK
      ?auto_108006 - BLOCK
    )
    :vars
    (
      ?auto_108007 - BLOCK
      ?auto_108008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108001 ) ( ON ?auto_108002 ?auto_108001 ) ( not ( = ?auto_108001 ?auto_108002 ) ) ( not ( = ?auto_108001 ?auto_108003 ) ) ( not ( = ?auto_108001 ?auto_108004 ) ) ( not ( = ?auto_108001 ?auto_108005 ) ) ( not ( = ?auto_108001 ?auto_108006 ) ) ( not ( = ?auto_108001 ?auto_108007 ) ) ( not ( = ?auto_108002 ?auto_108003 ) ) ( not ( = ?auto_108002 ?auto_108004 ) ) ( not ( = ?auto_108002 ?auto_108005 ) ) ( not ( = ?auto_108002 ?auto_108006 ) ) ( not ( = ?auto_108002 ?auto_108007 ) ) ( not ( = ?auto_108003 ?auto_108004 ) ) ( not ( = ?auto_108003 ?auto_108005 ) ) ( not ( = ?auto_108003 ?auto_108006 ) ) ( not ( = ?auto_108003 ?auto_108007 ) ) ( not ( = ?auto_108004 ?auto_108005 ) ) ( not ( = ?auto_108004 ?auto_108006 ) ) ( not ( = ?auto_108004 ?auto_108007 ) ) ( not ( = ?auto_108005 ?auto_108006 ) ) ( not ( = ?auto_108005 ?auto_108007 ) ) ( not ( = ?auto_108006 ?auto_108007 ) ) ( ON ?auto_108007 ?auto_108008 ) ( not ( = ?auto_108001 ?auto_108008 ) ) ( not ( = ?auto_108002 ?auto_108008 ) ) ( not ( = ?auto_108003 ?auto_108008 ) ) ( not ( = ?auto_108004 ?auto_108008 ) ) ( not ( = ?auto_108005 ?auto_108008 ) ) ( not ( = ?auto_108006 ?auto_108008 ) ) ( not ( = ?auto_108007 ?auto_108008 ) ) ( ON ?auto_108006 ?auto_108007 ) ( ON-TABLE ?auto_108008 ) ( ON ?auto_108005 ?auto_108006 ) ( ON ?auto_108004 ?auto_108005 ) ( CLEAR ?auto_108004 ) ( HOLDING ?auto_108003 ) ( CLEAR ?auto_108002 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108001 ?auto_108002 ?auto_108003 )
      ( MAKE-6PILE ?auto_108001 ?auto_108002 ?auto_108003 ?auto_108004 ?auto_108005 ?auto_108006 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108009 - BLOCK
      ?auto_108010 - BLOCK
      ?auto_108011 - BLOCK
      ?auto_108012 - BLOCK
      ?auto_108013 - BLOCK
      ?auto_108014 - BLOCK
    )
    :vars
    (
      ?auto_108015 - BLOCK
      ?auto_108016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108009 ) ( ON ?auto_108010 ?auto_108009 ) ( not ( = ?auto_108009 ?auto_108010 ) ) ( not ( = ?auto_108009 ?auto_108011 ) ) ( not ( = ?auto_108009 ?auto_108012 ) ) ( not ( = ?auto_108009 ?auto_108013 ) ) ( not ( = ?auto_108009 ?auto_108014 ) ) ( not ( = ?auto_108009 ?auto_108015 ) ) ( not ( = ?auto_108010 ?auto_108011 ) ) ( not ( = ?auto_108010 ?auto_108012 ) ) ( not ( = ?auto_108010 ?auto_108013 ) ) ( not ( = ?auto_108010 ?auto_108014 ) ) ( not ( = ?auto_108010 ?auto_108015 ) ) ( not ( = ?auto_108011 ?auto_108012 ) ) ( not ( = ?auto_108011 ?auto_108013 ) ) ( not ( = ?auto_108011 ?auto_108014 ) ) ( not ( = ?auto_108011 ?auto_108015 ) ) ( not ( = ?auto_108012 ?auto_108013 ) ) ( not ( = ?auto_108012 ?auto_108014 ) ) ( not ( = ?auto_108012 ?auto_108015 ) ) ( not ( = ?auto_108013 ?auto_108014 ) ) ( not ( = ?auto_108013 ?auto_108015 ) ) ( not ( = ?auto_108014 ?auto_108015 ) ) ( ON ?auto_108015 ?auto_108016 ) ( not ( = ?auto_108009 ?auto_108016 ) ) ( not ( = ?auto_108010 ?auto_108016 ) ) ( not ( = ?auto_108011 ?auto_108016 ) ) ( not ( = ?auto_108012 ?auto_108016 ) ) ( not ( = ?auto_108013 ?auto_108016 ) ) ( not ( = ?auto_108014 ?auto_108016 ) ) ( not ( = ?auto_108015 ?auto_108016 ) ) ( ON ?auto_108014 ?auto_108015 ) ( ON-TABLE ?auto_108016 ) ( ON ?auto_108013 ?auto_108014 ) ( ON ?auto_108012 ?auto_108013 ) ( CLEAR ?auto_108010 ) ( ON ?auto_108011 ?auto_108012 ) ( CLEAR ?auto_108011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108016 ?auto_108015 ?auto_108014 ?auto_108013 ?auto_108012 )
      ( MAKE-6PILE ?auto_108009 ?auto_108010 ?auto_108011 ?auto_108012 ?auto_108013 ?auto_108014 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108017 - BLOCK
      ?auto_108018 - BLOCK
      ?auto_108019 - BLOCK
      ?auto_108020 - BLOCK
      ?auto_108021 - BLOCK
      ?auto_108022 - BLOCK
    )
    :vars
    (
      ?auto_108023 - BLOCK
      ?auto_108024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108017 ) ( not ( = ?auto_108017 ?auto_108018 ) ) ( not ( = ?auto_108017 ?auto_108019 ) ) ( not ( = ?auto_108017 ?auto_108020 ) ) ( not ( = ?auto_108017 ?auto_108021 ) ) ( not ( = ?auto_108017 ?auto_108022 ) ) ( not ( = ?auto_108017 ?auto_108023 ) ) ( not ( = ?auto_108018 ?auto_108019 ) ) ( not ( = ?auto_108018 ?auto_108020 ) ) ( not ( = ?auto_108018 ?auto_108021 ) ) ( not ( = ?auto_108018 ?auto_108022 ) ) ( not ( = ?auto_108018 ?auto_108023 ) ) ( not ( = ?auto_108019 ?auto_108020 ) ) ( not ( = ?auto_108019 ?auto_108021 ) ) ( not ( = ?auto_108019 ?auto_108022 ) ) ( not ( = ?auto_108019 ?auto_108023 ) ) ( not ( = ?auto_108020 ?auto_108021 ) ) ( not ( = ?auto_108020 ?auto_108022 ) ) ( not ( = ?auto_108020 ?auto_108023 ) ) ( not ( = ?auto_108021 ?auto_108022 ) ) ( not ( = ?auto_108021 ?auto_108023 ) ) ( not ( = ?auto_108022 ?auto_108023 ) ) ( ON ?auto_108023 ?auto_108024 ) ( not ( = ?auto_108017 ?auto_108024 ) ) ( not ( = ?auto_108018 ?auto_108024 ) ) ( not ( = ?auto_108019 ?auto_108024 ) ) ( not ( = ?auto_108020 ?auto_108024 ) ) ( not ( = ?auto_108021 ?auto_108024 ) ) ( not ( = ?auto_108022 ?auto_108024 ) ) ( not ( = ?auto_108023 ?auto_108024 ) ) ( ON ?auto_108022 ?auto_108023 ) ( ON-TABLE ?auto_108024 ) ( ON ?auto_108021 ?auto_108022 ) ( ON ?auto_108020 ?auto_108021 ) ( ON ?auto_108019 ?auto_108020 ) ( CLEAR ?auto_108019 ) ( HOLDING ?auto_108018 ) ( CLEAR ?auto_108017 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108017 ?auto_108018 )
      ( MAKE-6PILE ?auto_108017 ?auto_108018 ?auto_108019 ?auto_108020 ?auto_108021 ?auto_108022 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108025 - BLOCK
      ?auto_108026 - BLOCK
      ?auto_108027 - BLOCK
      ?auto_108028 - BLOCK
      ?auto_108029 - BLOCK
      ?auto_108030 - BLOCK
    )
    :vars
    (
      ?auto_108031 - BLOCK
      ?auto_108032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108025 ) ( not ( = ?auto_108025 ?auto_108026 ) ) ( not ( = ?auto_108025 ?auto_108027 ) ) ( not ( = ?auto_108025 ?auto_108028 ) ) ( not ( = ?auto_108025 ?auto_108029 ) ) ( not ( = ?auto_108025 ?auto_108030 ) ) ( not ( = ?auto_108025 ?auto_108031 ) ) ( not ( = ?auto_108026 ?auto_108027 ) ) ( not ( = ?auto_108026 ?auto_108028 ) ) ( not ( = ?auto_108026 ?auto_108029 ) ) ( not ( = ?auto_108026 ?auto_108030 ) ) ( not ( = ?auto_108026 ?auto_108031 ) ) ( not ( = ?auto_108027 ?auto_108028 ) ) ( not ( = ?auto_108027 ?auto_108029 ) ) ( not ( = ?auto_108027 ?auto_108030 ) ) ( not ( = ?auto_108027 ?auto_108031 ) ) ( not ( = ?auto_108028 ?auto_108029 ) ) ( not ( = ?auto_108028 ?auto_108030 ) ) ( not ( = ?auto_108028 ?auto_108031 ) ) ( not ( = ?auto_108029 ?auto_108030 ) ) ( not ( = ?auto_108029 ?auto_108031 ) ) ( not ( = ?auto_108030 ?auto_108031 ) ) ( ON ?auto_108031 ?auto_108032 ) ( not ( = ?auto_108025 ?auto_108032 ) ) ( not ( = ?auto_108026 ?auto_108032 ) ) ( not ( = ?auto_108027 ?auto_108032 ) ) ( not ( = ?auto_108028 ?auto_108032 ) ) ( not ( = ?auto_108029 ?auto_108032 ) ) ( not ( = ?auto_108030 ?auto_108032 ) ) ( not ( = ?auto_108031 ?auto_108032 ) ) ( ON ?auto_108030 ?auto_108031 ) ( ON-TABLE ?auto_108032 ) ( ON ?auto_108029 ?auto_108030 ) ( ON ?auto_108028 ?auto_108029 ) ( ON ?auto_108027 ?auto_108028 ) ( CLEAR ?auto_108025 ) ( ON ?auto_108026 ?auto_108027 ) ( CLEAR ?auto_108026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108032 ?auto_108031 ?auto_108030 ?auto_108029 ?auto_108028 ?auto_108027 )
      ( MAKE-6PILE ?auto_108025 ?auto_108026 ?auto_108027 ?auto_108028 ?auto_108029 ?auto_108030 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108033 - BLOCK
      ?auto_108034 - BLOCK
      ?auto_108035 - BLOCK
      ?auto_108036 - BLOCK
      ?auto_108037 - BLOCK
      ?auto_108038 - BLOCK
    )
    :vars
    (
      ?auto_108040 - BLOCK
      ?auto_108039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108033 ?auto_108034 ) ) ( not ( = ?auto_108033 ?auto_108035 ) ) ( not ( = ?auto_108033 ?auto_108036 ) ) ( not ( = ?auto_108033 ?auto_108037 ) ) ( not ( = ?auto_108033 ?auto_108038 ) ) ( not ( = ?auto_108033 ?auto_108040 ) ) ( not ( = ?auto_108034 ?auto_108035 ) ) ( not ( = ?auto_108034 ?auto_108036 ) ) ( not ( = ?auto_108034 ?auto_108037 ) ) ( not ( = ?auto_108034 ?auto_108038 ) ) ( not ( = ?auto_108034 ?auto_108040 ) ) ( not ( = ?auto_108035 ?auto_108036 ) ) ( not ( = ?auto_108035 ?auto_108037 ) ) ( not ( = ?auto_108035 ?auto_108038 ) ) ( not ( = ?auto_108035 ?auto_108040 ) ) ( not ( = ?auto_108036 ?auto_108037 ) ) ( not ( = ?auto_108036 ?auto_108038 ) ) ( not ( = ?auto_108036 ?auto_108040 ) ) ( not ( = ?auto_108037 ?auto_108038 ) ) ( not ( = ?auto_108037 ?auto_108040 ) ) ( not ( = ?auto_108038 ?auto_108040 ) ) ( ON ?auto_108040 ?auto_108039 ) ( not ( = ?auto_108033 ?auto_108039 ) ) ( not ( = ?auto_108034 ?auto_108039 ) ) ( not ( = ?auto_108035 ?auto_108039 ) ) ( not ( = ?auto_108036 ?auto_108039 ) ) ( not ( = ?auto_108037 ?auto_108039 ) ) ( not ( = ?auto_108038 ?auto_108039 ) ) ( not ( = ?auto_108040 ?auto_108039 ) ) ( ON ?auto_108038 ?auto_108040 ) ( ON-TABLE ?auto_108039 ) ( ON ?auto_108037 ?auto_108038 ) ( ON ?auto_108036 ?auto_108037 ) ( ON ?auto_108035 ?auto_108036 ) ( ON ?auto_108034 ?auto_108035 ) ( CLEAR ?auto_108034 ) ( HOLDING ?auto_108033 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108033 )
      ( MAKE-6PILE ?auto_108033 ?auto_108034 ?auto_108035 ?auto_108036 ?auto_108037 ?auto_108038 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_108041 - BLOCK
      ?auto_108042 - BLOCK
      ?auto_108043 - BLOCK
      ?auto_108044 - BLOCK
      ?auto_108045 - BLOCK
      ?auto_108046 - BLOCK
    )
    :vars
    (
      ?auto_108048 - BLOCK
      ?auto_108047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108041 ?auto_108042 ) ) ( not ( = ?auto_108041 ?auto_108043 ) ) ( not ( = ?auto_108041 ?auto_108044 ) ) ( not ( = ?auto_108041 ?auto_108045 ) ) ( not ( = ?auto_108041 ?auto_108046 ) ) ( not ( = ?auto_108041 ?auto_108048 ) ) ( not ( = ?auto_108042 ?auto_108043 ) ) ( not ( = ?auto_108042 ?auto_108044 ) ) ( not ( = ?auto_108042 ?auto_108045 ) ) ( not ( = ?auto_108042 ?auto_108046 ) ) ( not ( = ?auto_108042 ?auto_108048 ) ) ( not ( = ?auto_108043 ?auto_108044 ) ) ( not ( = ?auto_108043 ?auto_108045 ) ) ( not ( = ?auto_108043 ?auto_108046 ) ) ( not ( = ?auto_108043 ?auto_108048 ) ) ( not ( = ?auto_108044 ?auto_108045 ) ) ( not ( = ?auto_108044 ?auto_108046 ) ) ( not ( = ?auto_108044 ?auto_108048 ) ) ( not ( = ?auto_108045 ?auto_108046 ) ) ( not ( = ?auto_108045 ?auto_108048 ) ) ( not ( = ?auto_108046 ?auto_108048 ) ) ( ON ?auto_108048 ?auto_108047 ) ( not ( = ?auto_108041 ?auto_108047 ) ) ( not ( = ?auto_108042 ?auto_108047 ) ) ( not ( = ?auto_108043 ?auto_108047 ) ) ( not ( = ?auto_108044 ?auto_108047 ) ) ( not ( = ?auto_108045 ?auto_108047 ) ) ( not ( = ?auto_108046 ?auto_108047 ) ) ( not ( = ?auto_108048 ?auto_108047 ) ) ( ON ?auto_108046 ?auto_108048 ) ( ON-TABLE ?auto_108047 ) ( ON ?auto_108045 ?auto_108046 ) ( ON ?auto_108044 ?auto_108045 ) ( ON ?auto_108043 ?auto_108044 ) ( ON ?auto_108042 ?auto_108043 ) ( ON ?auto_108041 ?auto_108042 ) ( CLEAR ?auto_108041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108047 ?auto_108048 ?auto_108046 ?auto_108045 ?auto_108044 ?auto_108043 ?auto_108042 )
      ( MAKE-6PILE ?auto_108041 ?auto_108042 ?auto_108043 ?auto_108044 ?auto_108045 ?auto_108046 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108050 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_108050 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_108050 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108051 - BLOCK
    )
    :vars
    (
      ?auto_108052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108051 ?auto_108052 ) ( CLEAR ?auto_108051 ) ( HAND-EMPTY ) ( not ( = ?auto_108051 ?auto_108052 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108051 ?auto_108052 )
      ( MAKE-1PILE ?auto_108051 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108053 - BLOCK
    )
    :vars
    (
      ?auto_108054 - BLOCK
      ?auto_108059 - BLOCK
      ?auto_108058 - BLOCK
      ?auto_108056 - BLOCK
      ?auto_108057 - BLOCK
      ?auto_108055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108053 ?auto_108054 ) ) ( HOLDING ?auto_108053 ) ( CLEAR ?auto_108054 ) ( ON-TABLE ?auto_108059 ) ( ON ?auto_108058 ?auto_108059 ) ( ON ?auto_108056 ?auto_108058 ) ( ON ?auto_108057 ?auto_108056 ) ( ON ?auto_108055 ?auto_108057 ) ( ON ?auto_108054 ?auto_108055 ) ( not ( = ?auto_108059 ?auto_108058 ) ) ( not ( = ?auto_108059 ?auto_108056 ) ) ( not ( = ?auto_108059 ?auto_108057 ) ) ( not ( = ?auto_108059 ?auto_108055 ) ) ( not ( = ?auto_108059 ?auto_108054 ) ) ( not ( = ?auto_108059 ?auto_108053 ) ) ( not ( = ?auto_108058 ?auto_108056 ) ) ( not ( = ?auto_108058 ?auto_108057 ) ) ( not ( = ?auto_108058 ?auto_108055 ) ) ( not ( = ?auto_108058 ?auto_108054 ) ) ( not ( = ?auto_108058 ?auto_108053 ) ) ( not ( = ?auto_108056 ?auto_108057 ) ) ( not ( = ?auto_108056 ?auto_108055 ) ) ( not ( = ?auto_108056 ?auto_108054 ) ) ( not ( = ?auto_108056 ?auto_108053 ) ) ( not ( = ?auto_108057 ?auto_108055 ) ) ( not ( = ?auto_108057 ?auto_108054 ) ) ( not ( = ?auto_108057 ?auto_108053 ) ) ( not ( = ?auto_108055 ?auto_108054 ) ) ( not ( = ?auto_108055 ?auto_108053 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108059 ?auto_108058 ?auto_108056 ?auto_108057 ?auto_108055 ?auto_108054 ?auto_108053 )
      ( MAKE-1PILE ?auto_108053 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108060 - BLOCK
    )
    :vars
    (
      ?auto_108065 - BLOCK
      ?auto_108063 - BLOCK
      ?auto_108062 - BLOCK
      ?auto_108064 - BLOCK
      ?auto_108066 - BLOCK
      ?auto_108061 - BLOCK
      ?auto_108067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108060 ?auto_108065 ) ) ( CLEAR ?auto_108065 ) ( ON-TABLE ?auto_108063 ) ( ON ?auto_108062 ?auto_108063 ) ( ON ?auto_108064 ?auto_108062 ) ( ON ?auto_108066 ?auto_108064 ) ( ON ?auto_108061 ?auto_108066 ) ( ON ?auto_108065 ?auto_108061 ) ( not ( = ?auto_108063 ?auto_108062 ) ) ( not ( = ?auto_108063 ?auto_108064 ) ) ( not ( = ?auto_108063 ?auto_108066 ) ) ( not ( = ?auto_108063 ?auto_108061 ) ) ( not ( = ?auto_108063 ?auto_108065 ) ) ( not ( = ?auto_108063 ?auto_108060 ) ) ( not ( = ?auto_108062 ?auto_108064 ) ) ( not ( = ?auto_108062 ?auto_108066 ) ) ( not ( = ?auto_108062 ?auto_108061 ) ) ( not ( = ?auto_108062 ?auto_108065 ) ) ( not ( = ?auto_108062 ?auto_108060 ) ) ( not ( = ?auto_108064 ?auto_108066 ) ) ( not ( = ?auto_108064 ?auto_108061 ) ) ( not ( = ?auto_108064 ?auto_108065 ) ) ( not ( = ?auto_108064 ?auto_108060 ) ) ( not ( = ?auto_108066 ?auto_108061 ) ) ( not ( = ?auto_108066 ?auto_108065 ) ) ( not ( = ?auto_108066 ?auto_108060 ) ) ( not ( = ?auto_108061 ?auto_108065 ) ) ( not ( = ?auto_108061 ?auto_108060 ) ) ( ON ?auto_108060 ?auto_108067 ) ( CLEAR ?auto_108060 ) ( HAND-EMPTY ) ( not ( = ?auto_108060 ?auto_108067 ) ) ( not ( = ?auto_108065 ?auto_108067 ) ) ( not ( = ?auto_108063 ?auto_108067 ) ) ( not ( = ?auto_108062 ?auto_108067 ) ) ( not ( = ?auto_108064 ?auto_108067 ) ) ( not ( = ?auto_108066 ?auto_108067 ) ) ( not ( = ?auto_108061 ?auto_108067 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108060 ?auto_108067 )
      ( MAKE-1PILE ?auto_108060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108068 - BLOCK
    )
    :vars
    (
      ?auto_108070 - BLOCK
      ?auto_108073 - BLOCK
      ?auto_108072 - BLOCK
      ?auto_108075 - BLOCK
      ?auto_108071 - BLOCK
      ?auto_108074 - BLOCK
      ?auto_108069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108068 ?auto_108070 ) ) ( ON-TABLE ?auto_108073 ) ( ON ?auto_108072 ?auto_108073 ) ( ON ?auto_108075 ?auto_108072 ) ( ON ?auto_108071 ?auto_108075 ) ( ON ?auto_108074 ?auto_108071 ) ( not ( = ?auto_108073 ?auto_108072 ) ) ( not ( = ?auto_108073 ?auto_108075 ) ) ( not ( = ?auto_108073 ?auto_108071 ) ) ( not ( = ?auto_108073 ?auto_108074 ) ) ( not ( = ?auto_108073 ?auto_108070 ) ) ( not ( = ?auto_108073 ?auto_108068 ) ) ( not ( = ?auto_108072 ?auto_108075 ) ) ( not ( = ?auto_108072 ?auto_108071 ) ) ( not ( = ?auto_108072 ?auto_108074 ) ) ( not ( = ?auto_108072 ?auto_108070 ) ) ( not ( = ?auto_108072 ?auto_108068 ) ) ( not ( = ?auto_108075 ?auto_108071 ) ) ( not ( = ?auto_108075 ?auto_108074 ) ) ( not ( = ?auto_108075 ?auto_108070 ) ) ( not ( = ?auto_108075 ?auto_108068 ) ) ( not ( = ?auto_108071 ?auto_108074 ) ) ( not ( = ?auto_108071 ?auto_108070 ) ) ( not ( = ?auto_108071 ?auto_108068 ) ) ( not ( = ?auto_108074 ?auto_108070 ) ) ( not ( = ?auto_108074 ?auto_108068 ) ) ( ON ?auto_108068 ?auto_108069 ) ( CLEAR ?auto_108068 ) ( not ( = ?auto_108068 ?auto_108069 ) ) ( not ( = ?auto_108070 ?auto_108069 ) ) ( not ( = ?auto_108073 ?auto_108069 ) ) ( not ( = ?auto_108072 ?auto_108069 ) ) ( not ( = ?auto_108075 ?auto_108069 ) ) ( not ( = ?auto_108071 ?auto_108069 ) ) ( not ( = ?auto_108074 ?auto_108069 ) ) ( HOLDING ?auto_108070 ) ( CLEAR ?auto_108074 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108073 ?auto_108072 ?auto_108075 ?auto_108071 ?auto_108074 ?auto_108070 )
      ( MAKE-1PILE ?auto_108068 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108076 - BLOCK
    )
    :vars
    (
      ?auto_108077 - BLOCK
      ?auto_108078 - BLOCK
      ?auto_108083 - BLOCK
      ?auto_108082 - BLOCK
      ?auto_108080 - BLOCK
      ?auto_108081 - BLOCK
      ?auto_108079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108076 ?auto_108077 ) ) ( ON-TABLE ?auto_108078 ) ( ON ?auto_108083 ?auto_108078 ) ( ON ?auto_108082 ?auto_108083 ) ( ON ?auto_108080 ?auto_108082 ) ( ON ?auto_108081 ?auto_108080 ) ( not ( = ?auto_108078 ?auto_108083 ) ) ( not ( = ?auto_108078 ?auto_108082 ) ) ( not ( = ?auto_108078 ?auto_108080 ) ) ( not ( = ?auto_108078 ?auto_108081 ) ) ( not ( = ?auto_108078 ?auto_108077 ) ) ( not ( = ?auto_108078 ?auto_108076 ) ) ( not ( = ?auto_108083 ?auto_108082 ) ) ( not ( = ?auto_108083 ?auto_108080 ) ) ( not ( = ?auto_108083 ?auto_108081 ) ) ( not ( = ?auto_108083 ?auto_108077 ) ) ( not ( = ?auto_108083 ?auto_108076 ) ) ( not ( = ?auto_108082 ?auto_108080 ) ) ( not ( = ?auto_108082 ?auto_108081 ) ) ( not ( = ?auto_108082 ?auto_108077 ) ) ( not ( = ?auto_108082 ?auto_108076 ) ) ( not ( = ?auto_108080 ?auto_108081 ) ) ( not ( = ?auto_108080 ?auto_108077 ) ) ( not ( = ?auto_108080 ?auto_108076 ) ) ( not ( = ?auto_108081 ?auto_108077 ) ) ( not ( = ?auto_108081 ?auto_108076 ) ) ( ON ?auto_108076 ?auto_108079 ) ( not ( = ?auto_108076 ?auto_108079 ) ) ( not ( = ?auto_108077 ?auto_108079 ) ) ( not ( = ?auto_108078 ?auto_108079 ) ) ( not ( = ?auto_108083 ?auto_108079 ) ) ( not ( = ?auto_108082 ?auto_108079 ) ) ( not ( = ?auto_108080 ?auto_108079 ) ) ( not ( = ?auto_108081 ?auto_108079 ) ) ( CLEAR ?auto_108081 ) ( ON ?auto_108077 ?auto_108076 ) ( CLEAR ?auto_108077 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108079 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108079 ?auto_108076 )
      ( MAKE-1PILE ?auto_108076 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108084 - BLOCK
    )
    :vars
    (
      ?auto_108089 - BLOCK
      ?auto_108090 - BLOCK
      ?auto_108087 - BLOCK
      ?auto_108088 - BLOCK
      ?auto_108086 - BLOCK
      ?auto_108091 - BLOCK
      ?auto_108085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108084 ?auto_108089 ) ) ( ON-TABLE ?auto_108090 ) ( ON ?auto_108087 ?auto_108090 ) ( ON ?auto_108088 ?auto_108087 ) ( ON ?auto_108086 ?auto_108088 ) ( not ( = ?auto_108090 ?auto_108087 ) ) ( not ( = ?auto_108090 ?auto_108088 ) ) ( not ( = ?auto_108090 ?auto_108086 ) ) ( not ( = ?auto_108090 ?auto_108091 ) ) ( not ( = ?auto_108090 ?auto_108089 ) ) ( not ( = ?auto_108090 ?auto_108084 ) ) ( not ( = ?auto_108087 ?auto_108088 ) ) ( not ( = ?auto_108087 ?auto_108086 ) ) ( not ( = ?auto_108087 ?auto_108091 ) ) ( not ( = ?auto_108087 ?auto_108089 ) ) ( not ( = ?auto_108087 ?auto_108084 ) ) ( not ( = ?auto_108088 ?auto_108086 ) ) ( not ( = ?auto_108088 ?auto_108091 ) ) ( not ( = ?auto_108088 ?auto_108089 ) ) ( not ( = ?auto_108088 ?auto_108084 ) ) ( not ( = ?auto_108086 ?auto_108091 ) ) ( not ( = ?auto_108086 ?auto_108089 ) ) ( not ( = ?auto_108086 ?auto_108084 ) ) ( not ( = ?auto_108091 ?auto_108089 ) ) ( not ( = ?auto_108091 ?auto_108084 ) ) ( ON ?auto_108084 ?auto_108085 ) ( not ( = ?auto_108084 ?auto_108085 ) ) ( not ( = ?auto_108089 ?auto_108085 ) ) ( not ( = ?auto_108090 ?auto_108085 ) ) ( not ( = ?auto_108087 ?auto_108085 ) ) ( not ( = ?auto_108088 ?auto_108085 ) ) ( not ( = ?auto_108086 ?auto_108085 ) ) ( not ( = ?auto_108091 ?auto_108085 ) ) ( ON ?auto_108089 ?auto_108084 ) ( CLEAR ?auto_108089 ) ( ON-TABLE ?auto_108085 ) ( HOLDING ?auto_108091 ) ( CLEAR ?auto_108086 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108090 ?auto_108087 ?auto_108088 ?auto_108086 ?auto_108091 )
      ( MAKE-1PILE ?auto_108084 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108092 - BLOCK
    )
    :vars
    (
      ?auto_108093 - BLOCK
      ?auto_108099 - BLOCK
      ?auto_108096 - BLOCK
      ?auto_108097 - BLOCK
      ?auto_108095 - BLOCK
      ?auto_108098 - BLOCK
      ?auto_108094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108092 ?auto_108093 ) ) ( ON-TABLE ?auto_108099 ) ( ON ?auto_108096 ?auto_108099 ) ( ON ?auto_108097 ?auto_108096 ) ( ON ?auto_108095 ?auto_108097 ) ( not ( = ?auto_108099 ?auto_108096 ) ) ( not ( = ?auto_108099 ?auto_108097 ) ) ( not ( = ?auto_108099 ?auto_108095 ) ) ( not ( = ?auto_108099 ?auto_108098 ) ) ( not ( = ?auto_108099 ?auto_108093 ) ) ( not ( = ?auto_108099 ?auto_108092 ) ) ( not ( = ?auto_108096 ?auto_108097 ) ) ( not ( = ?auto_108096 ?auto_108095 ) ) ( not ( = ?auto_108096 ?auto_108098 ) ) ( not ( = ?auto_108096 ?auto_108093 ) ) ( not ( = ?auto_108096 ?auto_108092 ) ) ( not ( = ?auto_108097 ?auto_108095 ) ) ( not ( = ?auto_108097 ?auto_108098 ) ) ( not ( = ?auto_108097 ?auto_108093 ) ) ( not ( = ?auto_108097 ?auto_108092 ) ) ( not ( = ?auto_108095 ?auto_108098 ) ) ( not ( = ?auto_108095 ?auto_108093 ) ) ( not ( = ?auto_108095 ?auto_108092 ) ) ( not ( = ?auto_108098 ?auto_108093 ) ) ( not ( = ?auto_108098 ?auto_108092 ) ) ( ON ?auto_108092 ?auto_108094 ) ( not ( = ?auto_108092 ?auto_108094 ) ) ( not ( = ?auto_108093 ?auto_108094 ) ) ( not ( = ?auto_108099 ?auto_108094 ) ) ( not ( = ?auto_108096 ?auto_108094 ) ) ( not ( = ?auto_108097 ?auto_108094 ) ) ( not ( = ?auto_108095 ?auto_108094 ) ) ( not ( = ?auto_108098 ?auto_108094 ) ) ( ON ?auto_108093 ?auto_108092 ) ( ON-TABLE ?auto_108094 ) ( CLEAR ?auto_108095 ) ( ON ?auto_108098 ?auto_108093 ) ( CLEAR ?auto_108098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108094 ?auto_108092 ?auto_108093 )
      ( MAKE-1PILE ?auto_108092 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108100 - BLOCK
    )
    :vars
    (
      ?auto_108106 - BLOCK
      ?auto_108107 - BLOCK
      ?auto_108101 - BLOCK
      ?auto_108102 - BLOCK
      ?auto_108104 - BLOCK
      ?auto_108103 - BLOCK
      ?auto_108105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108100 ?auto_108106 ) ) ( ON-TABLE ?auto_108107 ) ( ON ?auto_108101 ?auto_108107 ) ( ON ?auto_108102 ?auto_108101 ) ( not ( = ?auto_108107 ?auto_108101 ) ) ( not ( = ?auto_108107 ?auto_108102 ) ) ( not ( = ?auto_108107 ?auto_108104 ) ) ( not ( = ?auto_108107 ?auto_108103 ) ) ( not ( = ?auto_108107 ?auto_108106 ) ) ( not ( = ?auto_108107 ?auto_108100 ) ) ( not ( = ?auto_108101 ?auto_108102 ) ) ( not ( = ?auto_108101 ?auto_108104 ) ) ( not ( = ?auto_108101 ?auto_108103 ) ) ( not ( = ?auto_108101 ?auto_108106 ) ) ( not ( = ?auto_108101 ?auto_108100 ) ) ( not ( = ?auto_108102 ?auto_108104 ) ) ( not ( = ?auto_108102 ?auto_108103 ) ) ( not ( = ?auto_108102 ?auto_108106 ) ) ( not ( = ?auto_108102 ?auto_108100 ) ) ( not ( = ?auto_108104 ?auto_108103 ) ) ( not ( = ?auto_108104 ?auto_108106 ) ) ( not ( = ?auto_108104 ?auto_108100 ) ) ( not ( = ?auto_108103 ?auto_108106 ) ) ( not ( = ?auto_108103 ?auto_108100 ) ) ( ON ?auto_108100 ?auto_108105 ) ( not ( = ?auto_108100 ?auto_108105 ) ) ( not ( = ?auto_108106 ?auto_108105 ) ) ( not ( = ?auto_108107 ?auto_108105 ) ) ( not ( = ?auto_108101 ?auto_108105 ) ) ( not ( = ?auto_108102 ?auto_108105 ) ) ( not ( = ?auto_108104 ?auto_108105 ) ) ( not ( = ?auto_108103 ?auto_108105 ) ) ( ON ?auto_108106 ?auto_108100 ) ( ON-TABLE ?auto_108105 ) ( ON ?auto_108103 ?auto_108106 ) ( CLEAR ?auto_108103 ) ( HOLDING ?auto_108104 ) ( CLEAR ?auto_108102 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108107 ?auto_108101 ?auto_108102 ?auto_108104 )
      ( MAKE-1PILE ?auto_108100 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108108 - BLOCK
    )
    :vars
    (
      ?auto_108110 - BLOCK
      ?auto_108115 - BLOCK
      ?auto_108113 - BLOCK
      ?auto_108109 - BLOCK
      ?auto_108112 - BLOCK
      ?auto_108114 - BLOCK
      ?auto_108111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108108 ?auto_108110 ) ) ( ON-TABLE ?auto_108115 ) ( ON ?auto_108113 ?auto_108115 ) ( ON ?auto_108109 ?auto_108113 ) ( not ( = ?auto_108115 ?auto_108113 ) ) ( not ( = ?auto_108115 ?auto_108109 ) ) ( not ( = ?auto_108115 ?auto_108112 ) ) ( not ( = ?auto_108115 ?auto_108114 ) ) ( not ( = ?auto_108115 ?auto_108110 ) ) ( not ( = ?auto_108115 ?auto_108108 ) ) ( not ( = ?auto_108113 ?auto_108109 ) ) ( not ( = ?auto_108113 ?auto_108112 ) ) ( not ( = ?auto_108113 ?auto_108114 ) ) ( not ( = ?auto_108113 ?auto_108110 ) ) ( not ( = ?auto_108113 ?auto_108108 ) ) ( not ( = ?auto_108109 ?auto_108112 ) ) ( not ( = ?auto_108109 ?auto_108114 ) ) ( not ( = ?auto_108109 ?auto_108110 ) ) ( not ( = ?auto_108109 ?auto_108108 ) ) ( not ( = ?auto_108112 ?auto_108114 ) ) ( not ( = ?auto_108112 ?auto_108110 ) ) ( not ( = ?auto_108112 ?auto_108108 ) ) ( not ( = ?auto_108114 ?auto_108110 ) ) ( not ( = ?auto_108114 ?auto_108108 ) ) ( ON ?auto_108108 ?auto_108111 ) ( not ( = ?auto_108108 ?auto_108111 ) ) ( not ( = ?auto_108110 ?auto_108111 ) ) ( not ( = ?auto_108115 ?auto_108111 ) ) ( not ( = ?auto_108113 ?auto_108111 ) ) ( not ( = ?auto_108109 ?auto_108111 ) ) ( not ( = ?auto_108112 ?auto_108111 ) ) ( not ( = ?auto_108114 ?auto_108111 ) ) ( ON ?auto_108110 ?auto_108108 ) ( ON-TABLE ?auto_108111 ) ( ON ?auto_108114 ?auto_108110 ) ( CLEAR ?auto_108109 ) ( ON ?auto_108112 ?auto_108114 ) ( CLEAR ?auto_108112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108111 ?auto_108108 ?auto_108110 ?auto_108114 )
      ( MAKE-1PILE ?auto_108108 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108116 - BLOCK
    )
    :vars
    (
      ?auto_108118 - BLOCK
      ?auto_108122 - BLOCK
      ?auto_108120 - BLOCK
      ?auto_108119 - BLOCK
      ?auto_108123 - BLOCK
      ?auto_108117 - BLOCK
      ?auto_108121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108116 ?auto_108118 ) ) ( ON-TABLE ?auto_108122 ) ( ON ?auto_108120 ?auto_108122 ) ( not ( = ?auto_108122 ?auto_108120 ) ) ( not ( = ?auto_108122 ?auto_108119 ) ) ( not ( = ?auto_108122 ?auto_108123 ) ) ( not ( = ?auto_108122 ?auto_108117 ) ) ( not ( = ?auto_108122 ?auto_108118 ) ) ( not ( = ?auto_108122 ?auto_108116 ) ) ( not ( = ?auto_108120 ?auto_108119 ) ) ( not ( = ?auto_108120 ?auto_108123 ) ) ( not ( = ?auto_108120 ?auto_108117 ) ) ( not ( = ?auto_108120 ?auto_108118 ) ) ( not ( = ?auto_108120 ?auto_108116 ) ) ( not ( = ?auto_108119 ?auto_108123 ) ) ( not ( = ?auto_108119 ?auto_108117 ) ) ( not ( = ?auto_108119 ?auto_108118 ) ) ( not ( = ?auto_108119 ?auto_108116 ) ) ( not ( = ?auto_108123 ?auto_108117 ) ) ( not ( = ?auto_108123 ?auto_108118 ) ) ( not ( = ?auto_108123 ?auto_108116 ) ) ( not ( = ?auto_108117 ?auto_108118 ) ) ( not ( = ?auto_108117 ?auto_108116 ) ) ( ON ?auto_108116 ?auto_108121 ) ( not ( = ?auto_108116 ?auto_108121 ) ) ( not ( = ?auto_108118 ?auto_108121 ) ) ( not ( = ?auto_108122 ?auto_108121 ) ) ( not ( = ?auto_108120 ?auto_108121 ) ) ( not ( = ?auto_108119 ?auto_108121 ) ) ( not ( = ?auto_108123 ?auto_108121 ) ) ( not ( = ?auto_108117 ?auto_108121 ) ) ( ON ?auto_108118 ?auto_108116 ) ( ON-TABLE ?auto_108121 ) ( ON ?auto_108117 ?auto_108118 ) ( ON ?auto_108123 ?auto_108117 ) ( CLEAR ?auto_108123 ) ( HOLDING ?auto_108119 ) ( CLEAR ?auto_108120 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108122 ?auto_108120 ?auto_108119 )
      ( MAKE-1PILE ?auto_108116 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108124 - BLOCK
    )
    :vars
    (
      ?auto_108129 - BLOCK
      ?auto_108131 - BLOCK
      ?auto_108125 - BLOCK
      ?auto_108130 - BLOCK
      ?auto_108127 - BLOCK
      ?auto_108128 - BLOCK
      ?auto_108126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108124 ?auto_108129 ) ) ( ON-TABLE ?auto_108131 ) ( ON ?auto_108125 ?auto_108131 ) ( not ( = ?auto_108131 ?auto_108125 ) ) ( not ( = ?auto_108131 ?auto_108130 ) ) ( not ( = ?auto_108131 ?auto_108127 ) ) ( not ( = ?auto_108131 ?auto_108128 ) ) ( not ( = ?auto_108131 ?auto_108129 ) ) ( not ( = ?auto_108131 ?auto_108124 ) ) ( not ( = ?auto_108125 ?auto_108130 ) ) ( not ( = ?auto_108125 ?auto_108127 ) ) ( not ( = ?auto_108125 ?auto_108128 ) ) ( not ( = ?auto_108125 ?auto_108129 ) ) ( not ( = ?auto_108125 ?auto_108124 ) ) ( not ( = ?auto_108130 ?auto_108127 ) ) ( not ( = ?auto_108130 ?auto_108128 ) ) ( not ( = ?auto_108130 ?auto_108129 ) ) ( not ( = ?auto_108130 ?auto_108124 ) ) ( not ( = ?auto_108127 ?auto_108128 ) ) ( not ( = ?auto_108127 ?auto_108129 ) ) ( not ( = ?auto_108127 ?auto_108124 ) ) ( not ( = ?auto_108128 ?auto_108129 ) ) ( not ( = ?auto_108128 ?auto_108124 ) ) ( ON ?auto_108124 ?auto_108126 ) ( not ( = ?auto_108124 ?auto_108126 ) ) ( not ( = ?auto_108129 ?auto_108126 ) ) ( not ( = ?auto_108131 ?auto_108126 ) ) ( not ( = ?auto_108125 ?auto_108126 ) ) ( not ( = ?auto_108130 ?auto_108126 ) ) ( not ( = ?auto_108127 ?auto_108126 ) ) ( not ( = ?auto_108128 ?auto_108126 ) ) ( ON ?auto_108129 ?auto_108124 ) ( ON-TABLE ?auto_108126 ) ( ON ?auto_108128 ?auto_108129 ) ( ON ?auto_108127 ?auto_108128 ) ( CLEAR ?auto_108125 ) ( ON ?auto_108130 ?auto_108127 ) ( CLEAR ?auto_108130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108126 ?auto_108124 ?auto_108129 ?auto_108128 ?auto_108127 )
      ( MAKE-1PILE ?auto_108124 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108132 - BLOCK
    )
    :vars
    (
      ?auto_108139 - BLOCK
      ?auto_108137 - BLOCK
      ?auto_108133 - BLOCK
      ?auto_108138 - BLOCK
      ?auto_108135 - BLOCK
      ?auto_108134 - BLOCK
      ?auto_108136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108132 ?auto_108139 ) ) ( ON-TABLE ?auto_108137 ) ( not ( = ?auto_108137 ?auto_108133 ) ) ( not ( = ?auto_108137 ?auto_108138 ) ) ( not ( = ?auto_108137 ?auto_108135 ) ) ( not ( = ?auto_108137 ?auto_108134 ) ) ( not ( = ?auto_108137 ?auto_108139 ) ) ( not ( = ?auto_108137 ?auto_108132 ) ) ( not ( = ?auto_108133 ?auto_108138 ) ) ( not ( = ?auto_108133 ?auto_108135 ) ) ( not ( = ?auto_108133 ?auto_108134 ) ) ( not ( = ?auto_108133 ?auto_108139 ) ) ( not ( = ?auto_108133 ?auto_108132 ) ) ( not ( = ?auto_108138 ?auto_108135 ) ) ( not ( = ?auto_108138 ?auto_108134 ) ) ( not ( = ?auto_108138 ?auto_108139 ) ) ( not ( = ?auto_108138 ?auto_108132 ) ) ( not ( = ?auto_108135 ?auto_108134 ) ) ( not ( = ?auto_108135 ?auto_108139 ) ) ( not ( = ?auto_108135 ?auto_108132 ) ) ( not ( = ?auto_108134 ?auto_108139 ) ) ( not ( = ?auto_108134 ?auto_108132 ) ) ( ON ?auto_108132 ?auto_108136 ) ( not ( = ?auto_108132 ?auto_108136 ) ) ( not ( = ?auto_108139 ?auto_108136 ) ) ( not ( = ?auto_108137 ?auto_108136 ) ) ( not ( = ?auto_108133 ?auto_108136 ) ) ( not ( = ?auto_108138 ?auto_108136 ) ) ( not ( = ?auto_108135 ?auto_108136 ) ) ( not ( = ?auto_108134 ?auto_108136 ) ) ( ON ?auto_108139 ?auto_108132 ) ( ON-TABLE ?auto_108136 ) ( ON ?auto_108134 ?auto_108139 ) ( ON ?auto_108135 ?auto_108134 ) ( ON ?auto_108138 ?auto_108135 ) ( CLEAR ?auto_108138 ) ( HOLDING ?auto_108133 ) ( CLEAR ?auto_108137 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108137 ?auto_108133 )
      ( MAKE-1PILE ?auto_108132 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108140 - BLOCK
    )
    :vars
    (
      ?auto_108145 - BLOCK
      ?auto_108147 - BLOCK
      ?auto_108144 - BLOCK
      ?auto_108141 - BLOCK
      ?auto_108142 - BLOCK
      ?auto_108143 - BLOCK
      ?auto_108146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108140 ?auto_108145 ) ) ( ON-TABLE ?auto_108147 ) ( not ( = ?auto_108147 ?auto_108144 ) ) ( not ( = ?auto_108147 ?auto_108141 ) ) ( not ( = ?auto_108147 ?auto_108142 ) ) ( not ( = ?auto_108147 ?auto_108143 ) ) ( not ( = ?auto_108147 ?auto_108145 ) ) ( not ( = ?auto_108147 ?auto_108140 ) ) ( not ( = ?auto_108144 ?auto_108141 ) ) ( not ( = ?auto_108144 ?auto_108142 ) ) ( not ( = ?auto_108144 ?auto_108143 ) ) ( not ( = ?auto_108144 ?auto_108145 ) ) ( not ( = ?auto_108144 ?auto_108140 ) ) ( not ( = ?auto_108141 ?auto_108142 ) ) ( not ( = ?auto_108141 ?auto_108143 ) ) ( not ( = ?auto_108141 ?auto_108145 ) ) ( not ( = ?auto_108141 ?auto_108140 ) ) ( not ( = ?auto_108142 ?auto_108143 ) ) ( not ( = ?auto_108142 ?auto_108145 ) ) ( not ( = ?auto_108142 ?auto_108140 ) ) ( not ( = ?auto_108143 ?auto_108145 ) ) ( not ( = ?auto_108143 ?auto_108140 ) ) ( ON ?auto_108140 ?auto_108146 ) ( not ( = ?auto_108140 ?auto_108146 ) ) ( not ( = ?auto_108145 ?auto_108146 ) ) ( not ( = ?auto_108147 ?auto_108146 ) ) ( not ( = ?auto_108144 ?auto_108146 ) ) ( not ( = ?auto_108141 ?auto_108146 ) ) ( not ( = ?auto_108142 ?auto_108146 ) ) ( not ( = ?auto_108143 ?auto_108146 ) ) ( ON ?auto_108145 ?auto_108140 ) ( ON-TABLE ?auto_108146 ) ( ON ?auto_108143 ?auto_108145 ) ( ON ?auto_108142 ?auto_108143 ) ( ON ?auto_108141 ?auto_108142 ) ( CLEAR ?auto_108147 ) ( ON ?auto_108144 ?auto_108141 ) ( CLEAR ?auto_108144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108146 ?auto_108140 ?auto_108145 ?auto_108143 ?auto_108142 ?auto_108141 )
      ( MAKE-1PILE ?auto_108140 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108148 - BLOCK
    )
    :vars
    (
      ?auto_108155 - BLOCK
      ?auto_108152 - BLOCK
      ?auto_108151 - BLOCK
      ?auto_108149 - BLOCK
      ?auto_108153 - BLOCK
      ?auto_108150 - BLOCK
      ?auto_108154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108148 ?auto_108155 ) ) ( not ( = ?auto_108152 ?auto_108151 ) ) ( not ( = ?auto_108152 ?auto_108149 ) ) ( not ( = ?auto_108152 ?auto_108153 ) ) ( not ( = ?auto_108152 ?auto_108150 ) ) ( not ( = ?auto_108152 ?auto_108155 ) ) ( not ( = ?auto_108152 ?auto_108148 ) ) ( not ( = ?auto_108151 ?auto_108149 ) ) ( not ( = ?auto_108151 ?auto_108153 ) ) ( not ( = ?auto_108151 ?auto_108150 ) ) ( not ( = ?auto_108151 ?auto_108155 ) ) ( not ( = ?auto_108151 ?auto_108148 ) ) ( not ( = ?auto_108149 ?auto_108153 ) ) ( not ( = ?auto_108149 ?auto_108150 ) ) ( not ( = ?auto_108149 ?auto_108155 ) ) ( not ( = ?auto_108149 ?auto_108148 ) ) ( not ( = ?auto_108153 ?auto_108150 ) ) ( not ( = ?auto_108153 ?auto_108155 ) ) ( not ( = ?auto_108153 ?auto_108148 ) ) ( not ( = ?auto_108150 ?auto_108155 ) ) ( not ( = ?auto_108150 ?auto_108148 ) ) ( ON ?auto_108148 ?auto_108154 ) ( not ( = ?auto_108148 ?auto_108154 ) ) ( not ( = ?auto_108155 ?auto_108154 ) ) ( not ( = ?auto_108152 ?auto_108154 ) ) ( not ( = ?auto_108151 ?auto_108154 ) ) ( not ( = ?auto_108149 ?auto_108154 ) ) ( not ( = ?auto_108153 ?auto_108154 ) ) ( not ( = ?auto_108150 ?auto_108154 ) ) ( ON ?auto_108155 ?auto_108148 ) ( ON-TABLE ?auto_108154 ) ( ON ?auto_108150 ?auto_108155 ) ( ON ?auto_108153 ?auto_108150 ) ( ON ?auto_108149 ?auto_108153 ) ( ON ?auto_108151 ?auto_108149 ) ( CLEAR ?auto_108151 ) ( HOLDING ?auto_108152 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108152 )
      ( MAKE-1PILE ?auto_108148 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_108156 - BLOCK
    )
    :vars
    (
      ?auto_108160 - BLOCK
      ?auto_108158 - BLOCK
      ?auto_108157 - BLOCK
      ?auto_108162 - BLOCK
      ?auto_108163 - BLOCK
      ?auto_108159 - BLOCK
      ?auto_108161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108156 ?auto_108160 ) ) ( not ( = ?auto_108158 ?auto_108157 ) ) ( not ( = ?auto_108158 ?auto_108162 ) ) ( not ( = ?auto_108158 ?auto_108163 ) ) ( not ( = ?auto_108158 ?auto_108159 ) ) ( not ( = ?auto_108158 ?auto_108160 ) ) ( not ( = ?auto_108158 ?auto_108156 ) ) ( not ( = ?auto_108157 ?auto_108162 ) ) ( not ( = ?auto_108157 ?auto_108163 ) ) ( not ( = ?auto_108157 ?auto_108159 ) ) ( not ( = ?auto_108157 ?auto_108160 ) ) ( not ( = ?auto_108157 ?auto_108156 ) ) ( not ( = ?auto_108162 ?auto_108163 ) ) ( not ( = ?auto_108162 ?auto_108159 ) ) ( not ( = ?auto_108162 ?auto_108160 ) ) ( not ( = ?auto_108162 ?auto_108156 ) ) ( not ( = ?auto_108163 ?auto_108159 ) ) ( not ( = ?auto_108163 ?auto_108160 ) ) ( not ( = ?auto_108163 ?auto_108156 ) ) ( not ( = ?auto_108159 ?auto_108160 ) ) ( not ( = ?auto_108159 ?auto_108156 ) ) ( ON ?auto_108156 ?auto_108161 ) ( not ( = ?auto_108156 ?auto_108161 ) ) ( not ( = ?auto_108160 ?auto_108161 ) ) ( not ( = ?auto_108158 ?auto_108161 ) ) ( not ( = ?auto_108157 ?auto_108161 ) ) ( not ( = ?auto_108162 ?auto_108161 ) ) ( not ( = ?auto_108163 ?auto_108161 ) ) ( not ( = ?auto_108159 ?auto_108161 ) ) ( ON ?auto_108160 ?auto_108156 ) ( ON-TABLE ?auto_108161 ) ( ON ?auto_108159 ?auto_108160 ) ( ON ?auto_108163 ?auto_108159 ) ( ON ?auto_108162 ?auto_108163 ) ( ON ?auto_108157 ?auto_108162 ) ( ON ?auto_108158 ?auto_108157 ) ( CLEAR ?auto_108158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108161 ?auto_108156 ?auto_108160 ?auto_108159 ?auto_108163 ?auto_108162 ?auto_108157 )
      ( MAKE-1PILE ?auto_108156 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108169 - BLOCK
      ?auto_108170 - BLOCK
      ?auto_108171 - BLOCK
      ?auto_108172 - BLOCK
      ?auto_108173 - BLOCK
    )
    :vars
    (
      ?auto_108174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108174 ?auto_108173 ) ( CLEAR ?auto_108174 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108169 ) ( ON ?auto_108170 ?auto_108169 ) ( ON ?auto_108171 ?auto_108170 ) ( ON ?auto_108172 ?auto_108171 ) ( ON ?auto_108173 ?auto_108172 ) ( not ( = ?auto_108169 ?auto_108170 ) ) ( not ( = ?auto_108169 ?auto_108171 ) ) ( not ( = ?auto_108169 ?auto_108172 ) ) ( not ( = ?auto_108169 ?auto_108173 ) ) ( not ( = ?auto_108169 ?auto_108174 ) ) ( not ( = ?auto_108170 ?auto_108171 ) ) ( not ( = ?auto_108170 ?auto_108172 ) ) ( not ( = ?auto_108170 ?auto_108173 ) ) ( not ( = ?auto_108170 ?auto_108174 ) ) ( not ( = ?auto_108171 ?auto_108172 ) ) ( not ( = ?auto_108171 ?auto_108173 ) ) ( not ( = ?auto_108171 ?auto_108174 ) ) ( not ( = ?auto_108172 ?auto_108173 ) ) ( not ( = ?auto_108172 ?auto_108174 ) ) ( not ( = ?auto_108173 ?auto_108174 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108174 ?auto_108173 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108175 - BLOCK
      ?auto_108176 - BLOCK
      ?auto_108177 - BLOCK
      ?auto_108178 - BLOCK
      ?auto_108179 - BLOCK
    )
    :vars
    (
      ?auto_108180 - BLOCK
      ?auto_108181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108180 ?auto_108179 ) ( CLEAR ?auto_108180 ) ( ON-TABLE ?auto_108175 ) ( ON ?auto_108176 ?auto_108175 ) ( ON ?auto_108177 ?auto_108176 ) ( ON ?auto_108178 ?auto_108177 ) ( ON ?auto_108179 ?auto_108178 ) ( not ( = ?auto_108175 ?auto_108176 ) ) ( not ( = ?auto_108175 ?auto_108177 ) ) ( not ( = ?auto_108175 ?auto_108178 ) ) ( not ( = ?auto_108175 ?auto_108179 ) ) ( not ( = ?auto_108175 ?auto_108180 ) ) ( not ( = ?auto_108176 ?auto_108177 ) ) ( not ( = ?auto_108176 ?auto_108178 ) ) ( not ( = ?auto_108176 ?auto_108179 ) ) ( not ( = ?auto_108176 ?auto_108180 ) ) ( not ( = ?auto_108177 ?auto_108178 ) ) ( not ( = ?auto_108177 ?auto_108179 ) ) ( not ( = ?auto_108177 ?auto_108180 ) ) ( not ( = ?auto_108178 ?auto_108179 ) ) ( not ( = ?auto_108178 ?auto_108180 ) ) ( not ( = ?auto_108179 ?auto_108180 ) ) ( HOLDING ?auto_108181 ) ( not ( = ?auto_108175 ?auto_108181 ) ) ( not ( = ?auto_108176 ?auto_108181 ) ) ( not ( = ?auto_108177 ?auto_108181 ) ) ( not ( = ?auto_108178 ?auto_108181 ) ) ( not ( = ?auto_108179 ?auto_108181 ) ) ( not ( = ?auto_108180 ?auto_108181 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_108181 )
      ( MAKE-5PILE ?auto_108175 ?auto_108176 ?auto_108177 ?auto_108178 ?auto_108179 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108182 - BLOCK
      ?auto_108183 - BLOCK
      ?auto_108184 - BLOCK
      ?auto_108185 - BLOCK
      ?auto_108186 - BLOCK
    )
    :vars
    (
      ?auto_108188 - BLOCK
      ?auto_108187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108188 ?auto_108186 ) ( ON-TABLE ?auto_108182 ) ( ON ?auto_108183 ?auto_108182 ) ( ON ?auto_108184 ?auto_108183 ) ( ON ?auto_108185 ?auto_108184 ) ( ON ?auto_108186 ?auto_108185 ) ( not ( = ?auto_108182 ?auto_108183 ) ) ( not ( = ?auto_108182 ?auto_108184 ) ) ( not ( = ?auto_108182 ?auto_108185 ) ) ( not ( = ?auto_108182 ?auto_108186 ) ) ( not ( = ?auto_108182 ?auto_108188 ) ) ( not ( = ?auto_108183 ?auto_108184 ) ) ( not ( = ?auto_108183 ?auto_108185 ) ) ( not ( = ?auto_108183 ?auto_108186 ) ) ( not ( = ?auto_108183 ?auto_108188 ) ) ( not ( = ?auto_108184 ?auto_108185 ) ) ( not ( = ?auto_108184 ?auto_108186 ) ) ( not ( = ?auto_108184 ?auto_108188 ) ) ( not ( = ?auto_108185 ?auto_108186 ) ) ( not ( = ?auto_108185 ?auto_108188 ) ) ( not ( = ?auto_108186 ?auto_108188 ) ) ( not ( = ?auto_108182 ?auto_108187 ) ) ( not ( = ?auto_108183 ?auto_108187 ) ) ( not ( = ?auto_108184 ?auto_108187 ) ) ( not ( = ?auto_108185 ?auto_108187 ) ) ( not ( = ?auto_108186 ?auto_108187 ) ) ( not ( = ?auto_108188 ?auto_108187 ) ) ( ON ?auto_108187 ?auto_108188 ) ( CLEAR ?auto_108187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108182 ?auto_108183 ?auto_108184 ?auto_108185 ?auto_108186 ?auto_108188 )
      ( MAKE-5PILE ?auto_108182 ?auto_108183 ?auto_108184 ?auto_108185 ?auto_108186 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108189 - BLOCK
      ?auto_108190 - BLOCK
      ?auto_108191 - BLOCK
      ?auto_108192 - BLOCK
      ?auto_108193 - BLOCK
    )
    :vars
    (
      ?auto_108194 - BLOCK
      ?auto_108195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108194 ?auto_108193 ) ( ON-TABLE ?auto_108189 ) ( ON ?auto_108190 ?auto_108189 ) ( ON ?auto_108191 ?auto_108190 ) ( ON ?auto_108192 ?auto_108191 ) ( ON ?auto_108193 ?auto_108192 ) ( not ( = ?auto_108189 ?auto_108190 ) ) ( not ( = ?auto_108189 ?auto_108191 ) ) ( not ( = ?auto_108189 ?auto_108192 ) ) ( not ( = ?auto_108189 ?auto_108193 ) ) ( not ( = ?auto_108189 ?auto_108194 ) ) ( not ( = ?auto_108190 ?auto_108191 ) ) ( not ( = ?auto_108190 ?auto_108192 ) ) ( not ( = ?auto_108190 ?auto_108193 ) ) ( not ( = ?auto_108190 ?auto_108194 ) ) ( not ( = ?auto_108191 ?auto_108192 ) ) ( not ( = ?auto_108191 ?auto_108193 ) ) ( not ( = ?auto_108191 ?auto_108194 ) ) ( not ( = ?auto_108192 ?auto_108193 ) ) ( not ( = ?auto_108192 ?auto_108194 ) ) ( not ( = ?auto_108193 ?auto_108194 ) ) ( not ( = ?auto_108189 ?auto_108195 ) ) ( not ( = ?auto_108190 ?auto_108195 ) ) ( not ( = ?auto_108191 ?auto_108195 ) ) ( not ( = ?auto_108192 ?auto_108195 ) ) ( not ( = ?auto_108193 ?auto_108195 ) ) ( not ( = ?auto_108194 ?auto_108195 ) ) ( HOLDING ?auto_108195 ) ( CLEAR ?auto_108194 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108189 ?auto_108190 ?auto_108191 ?auto_108192 ?auto_108193 ?auto_108194 ?auto_108195 )
      ( MAKE-5PILE ?auto_108189 ?auto_108190 ?auto_108191 ?auto_108192 ?auto_108193 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108196 - BLOCK
      ?auto_108197 - BLOCK
      ?auto_108198 - BLOCK
      ?auto_108199 - BLOCK
      ?auto_108200 - BLOCK
    )
    :vars
    (
      ?auto_108201 - BLOCK
      ?auto_108202 - BLOCK
      ?auto_108203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108201 ?auto_108200 ) ( ON-TABLE ?auto_108196 ) ( ON ?auto_108197 ?auto_108196 ) ( ON ?auto_108198 ?auto_108197 ) ( ON ?auto_108199 ?auto_108198 ) ( ON ?auto_108200 ?auto_108199 ) ( not ( = ?auto_108196 ?auto_108197 ) ) ( not ( = ?auto_108196 ?auto_108198 ) ) ( not ( = ?auto_108196 ?auto_108199 ) ) ( not ( = ?auto_108196 ?auto_108200 ) ) ( not ( = ?auto_108196 ?auto_108201 ) ) ( not ( = ?auto_108197 ?auto_108198 ) ) ( not ( = ?auto_108197 ?auto_108199 ) ) ( not ( = ?auto_108197 ?auto_108200 ) ) ( not ( = ?auto_108197 ?auto_108201 ) ) ( not ( = ?auto_108198 ?auto_108199 ) ) ( not ( = ?auto_108198 ?auto_108200 ) ) ( not ( = ?auto_108198 ?auto_108201 ) ) ( not ( = ?auto_108199 ?auto_108200 ) ) ( not ( = ?auto_108199 ?auto_108201 ) ) ( not ( = ?auto_108200 ?auto_108201 ) ) ( not ( = ?auto_108196 ?auto_108202 ) ) ( not ( = ?auto_108197 ?auto_108202 ) ) ( not ( = ?auto_108198 ?auto_108202 ) ) ( not ( = ?auto_108199 ?auto_108202 ) ) ( not ( = ?auto_108200 ?auto_108202 ) ) ( not ( = ?auto_108201 ?auto_108202 ) ) ( CLEAR ?auto_108201 ) ( ON ?auto_108202 ?auto_108203 ) ( CLEAR ?auto_108202 ) ( HAND-EMPTY ) ( not ( = ?auto_108196 ?auto_108203 ) ) ( not ( = ?auto_108197 ?auto_108203 ) ) ( not ( = ?auto_108198 ?auto_108203 ) ) ( not ( = ?auto_108199 ?auto_108203 ) ) ( not ( = ?auto_108200 ?auto_108203 ) ) ( not ( = ?auto_108201 ?auto_108203 ) ) ( not ( = ?auto_108202 ?auto_108203 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108202 ?auto_108203 )
      ( MAKE-5PILE ?auto_108196 ?auto_108197 ?auto_108198 ?auto_108199 ?auto_108200 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108220 - BLOCK
      ?auto_108221 - BLOCK
      ?auto_108222 - BLOCK
      ?auto_108223 - BLOCK
      ?auto_108224 - BLOCK
    )
    :vars
    (
      ?auto_108227 - BLOCK
      ?auto_108226 - BLOCK
      ?auto_108225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108220 ) ( ON ?auto_108221 ?auto_108220 ) ( ON ?auto_108222 ?auto_108221 ) ( ON ?auto_108223 ?auto_108222 ) ( not ( = ?auto_108220 ?auto_108221 ) ) ( not ( = ?auto_108220 ?auto_108222 ) ) ( not ( = ?auto_108220 ?auto_108223 ) ) ( not ( = ?auto_108220 ?auto_108224 ) ) ( not ( = ?auto_108220 ?auto_108227 ) ) ( not ( = ?auto_108221 ?auto_108222 ) ) ( not ( = ?auto_108221 ?auto_108223 ) ) ( not ( = ?auto_108221 ?auto_108224 ) ) ( not ( = ?auto_108221 ?auto_108227 ) ) ( not ( = ?auto_108222 ?auto_108223 ) ) ( not ( = ?auto_108222 ?auto_108224 ) ) ( not ( = ?auto_108222 ?auto_108227 ) ) ( not ( = ?auto_108223 ?auto_108224 ) ) ( not ( = ?auto_108223 ?auto_108227 ) ) ( not ( = ?auto_108224 ?auto_108227 ) ) ( not ( = ?auto_108220 ?auto_108226 ) ) ( not ( = ?auto_108221 ?auto_108226 ) ) ( not ( = ?auto_108222 ?auto_108226 ) ) ( not ( = ?auto_108223 ?auto_108226 ) ) ( not ( = ?auto_108224 ?auto_108226 ) ) ( not ( = ?auto_108227 ?auto_108226 ) ) ( ON ?auto_108226 ?auto_108225 ) ( not ( = ?auto_108220 ?auto_108225 ) ) ( not ( = ?auto_108221 ?auto_108225 ) ) ( not ( = ?auto_108222 ?auto_108225 ) ) ( not ( = ?auto_108223 ?auto_108225 ) ) ( not ( = ?auto_108224 ?auto_108225 ) ) ( not ( = ?auto_108227 ?auto_108225 ) ) ( not ( = ?auto_108226 ?auto_108225 ) ) ( ON ?auto_108227 ?auto_108226 ) ( CLEAR ?auto_108227 ) ( HOLDING ?auto_108224 ) ( CLEAR ?auto_108223 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108220 ?auto_108221 ?auto_108222 ?auto_108223 ?auto_108224 ?auto_108227 )
      ( MAKE-5PILE ?auto_108220 ?auto_108221 ?auto_108222 ?auto_108223 ?auto_108224 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108228 - BLOCK
      ?auto_108229 - BLOCK
      ?auto_108230 - BLOCK
      ?auto_108231 - BLOCK
      ?auto_108232 - BLOCK
    )
    :vars
    (
      ?auto_108235 - BLOCK
      ?auto_108234 - BLOCK
      ?auto_108233 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108228 ) ( ON ?auto_108229 ?auto_108228 ) ( ON ?auto_108230 ?auto_108229 ) ( ON ?auto_108231 ?auto_108230 ) ( not ( = ?auto_108228 ?auto_108229 ) ) ( not ( = ?auto_108228 ?auto_108230 ) ) ( not ( = ?auto_108228 ?auto_108231 ) ) ( not ( = ?auto_108228 ?auto_108232 ) ) ( not ( = ?auto_108228 ?auto_108235 ) ) ( not ( = ?auto_108229 ?auto_108230 ) ) ( not ( = ?auto_108229 ?auto_108231 ) ) ( not ( = ?auto_108229 ?auto_108232 ) ) ( not ( = ?auto_108229 ?auto_108235 ) ) ( not ( = ?auto_108230 ?auto_108231 ) ) ( not ( = ?auto_108230 ?auto_108232 ) ) ( not ( = ?auto_108230 ?auto_108235 ) ) ( not ( = ?auto_108231 ?auto_108232 ) ) ( not ( = ?auto_108231 ?auto_108235 ) ) ( not ( = ?auto_108232 ?auto_108235 ) ) ( not ( = ?auto_108228 ?auto_108234 ) ) ( not ( = ?auto_108229 ?auto_108234 ) ) ( not ( = ?auto_108230 ?auto_108234 ) ) ( not ( = ?auto_108231 ?auto_108234 ) ) ( not ( = ?auto_108232 ?auto_108234 ) ) ( not ( = ?auto_108235 ?auto_108234 ) ) ( ON ?auto_108234 ?auto_108233 ) ( not ( = ?auto_108228 ?auto_108233 ) ) ( not ( = ?auto_108229 ?auto_108233 ) ) ( not ( = ?auto_108230 ?auto_108233 ) ) ( not ( = ?auto_108231 ?auto_108233 ) ) ( not ( = ?auto_108232 ?auto_108233 ) ) ( not ( = ?auto_108235 ?auto_108233 ) ) ( not ( = ?auto_108234 ?auto_108233 ) ) ( ON ?auto_108235 ?auto_108234 ) ( CLEAR ?auto_108231 ) ( ON ?auto_108232 ?auto_108235 ) ( CLEAR ?auto_108232 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108233 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108233 ?auto_108234 ?auto_108235 )
      ( MAKE-5PILE ?auto_108228 ?auto_108229 ?auto_108230 ?auto_108231 ?auto_108232 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108236 - BLOCK
      ?auto_108237 - BLOCK
      ?auto_108238 - BLOCK
      ?auto_108239 - BLOCK
      ?auto_108240 - BLOCK
    )
    :vars
    (
      ?auto_108241 - BLOCK
      ?auto_108242 - BLOCK
      ?auto_108243 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108236 ) ( ON ?auto_108237 ?auto_108236 ) ( ON ?auto_108238 ?auto_108237 ) ( not ( = ?auto_108236 ?auto_108237 ) ) ( not ( = ?auto_108236 ?auto_108238 ) ) ( not ( = ?auto_108236 ?auto_108239 ) ) ( not ( = ?auto_108236 ?auto_108240 ) ) ( not ( = ?auto_108236 ?auto_108241 ) ) ( not ( = ?auto_108237 ?auto_108238 ) ) ( not ( = ?auto_108237 ?auto_108239 ) ) ( not ( = ?auto_108237 ?auto_108240 ) ) ( not ( = ?auto_108237 ?auto_108241 ) ) ( not ( = ?auto_108238 ?auto_108239 ) ) ( not ( = ?auto_108238 ?auto_108240 ) ) ( not ( = ?auto_108238 ?auto_108241 ) ) ( not ( = ?auto_108239 ?auto_108240 ) ) ( not ( = ?auto_108239 ?auto_108241 ) ) ( not ( = ?auto_108240 ?auto_108241 ) ) ( not ( = ?auto_108236 ?auto_108242 ) ) ( not ( = ?auto_108237 ?auto_108242 ) ) ( not ( = ?auto_108238 ?auto_108242 ) ) ( not ( = ?auto_108239 ?auto_108242 ) ) ( not ( = ?auto_108240 ?auto_108242 ) ) ( not ( = ?auto_108241 ?auto_108242 ) ) ( ON ?auto_108242 ?auto_108243 ) ( not ( = ?auto_108236 ?auto_108243 ) ) ( not ( = ?auto_108237 ?auto_108243 ) ) ( not ( = ?auto_108238 ?auto_108243 ) ) ( not ( = ?auto_108239 ?auto_108243 ) ) ( not ( = ?auto_108240 ?auto_108243 ) ) ( not ( = ?auto_108241 ?auto_108243 ) ) ( not ( = ?auto_108242 ?auto_108243 ) ) ( ON ?auto_108241 ?auto_108242 ) ( ON ?auto_108240 ?auto_108241 ) ( CLEAR ?auto_108240 ) ( ON-TABLE ?auto_108243 ) ( HOLDING ?auto_108239 ) ( CLEAR ?auto_108238 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108236 ?auto_108237 ?auto_108238 ?auto_108239 )
      ( MAKE-5PILE ?auto_108236 ?auto_108237 ?auto_108238 ?auto_108239 ?auto_108240 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108244 - BLOCK
      ?auto_108245 - BLOCK
      ?auto_108246 - BLOCK
      ?auto_108247 - BLOCK
      ?auto_108248 - BLOCK
    )
    :vars
    (
      ?auto_108251 - BLOCK
      ?auto_108249 - BLOCK
      ?auto_108250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108244 ) ( ON ?auto_108245 ?auto_108244 ) ( ON ?auto_108246 ?auto_108245 ) ( not ( = ?auto_108244 ?auto_108245 ) ) ( not ( = ?auto_108244 ?auto_108246 ) ) ( not ( = ?auto_108244 ?auto_108247 ) ) ( not ( = ?auto_108244 ?auto_108248 ) ) ( not ( = ?auto_108244 ?auto_108251 ) ) ( not ( = ?auto_108245 ?auto_108246 ) ) ( not ( = ?auto_108245 ?auto_108247 ) ) ( not ( = ?auto_108245 ?auto_108248 ) ) ( not ( = ?auto_108245 ?auto_108251 ) ) ( not ( = ?auto_108246 ?auto_108247 ) ) ( not ( = ?auto_108246 ?auto_108248 ) ) ( not ( = ?auto_108246 ?auto_108251 ) ) ( not ( = ?auto_108247 ?auto_108248 ) ) ( not ( = ?auto_108247 ?auto_108251 ) ) ( not ( = ?auto_108248 ?auto_108251 ) ) ( not ( = ?auto_108244 ?auto_108249 ) ) ( not ( = ?auto_108245 ?auto_108249 ) ) ( not ( = ?auto_108246 ?auto_108249 ) ) ( not ( = ?auto_108247 ?auto_108249 ) ) ( not ( = ?auto_108248 ?auto_108249 ) ) ( not ( = ?auto_108251 ?auto_108249 ) ) ( ON ?auto_108249 ?auto_108250 ) ( not ( = ?auto_108244 ?auto_108250 ) ) ( not ( = ?auto_108245 ?auto_108250 ) ) ( not ( = ?auto_108246 ?auto_108250 ) ) ( not ( = ?auto_108247 ?auto_108250 ) ) ( not ( = ?auto_108248 ?auto_108250 ) ) ( not ( = ?auto_108251 ?auto_108250 ) ) ( not ( = ?auto_108249 ?auto_108250 ) ) ( ON ?auto_108251 ?auto_108249 ) ( ON ?auto_108248 ?auto_108251 ) ( ON-TABLE ?auto_108250 ) ( CLEAR ?auto_108246 ) ( ON ?auto_108247 ?auto_108248 ) ( CLEAR ?auto_108247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108250 ?auto_108249 ?auto_108251 ?auto_108248 )
      ( MAKE-5PILE ?auto_108244 ?auto_108245 ?auto_108246 ?auto_108247 ?auto_108248 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108252 - BLOCK
      ?auto_108253 - BLOCK
      ?auto_108254 - BLOCK
      ?auto_108255 - BLOCK
      ?auto_108256 - BLOCK
    )
    :vars
    (
      ?auto_108257 - BLOCK
      ?auto_108258 - BLOCK
      ?auto_108259 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108252 ) ( ON ?auto_108253 ?auto_108252 ) ( not ( = ?auto_108252 ?auto_108253 ) ) ( not ( = ?auto_108252 ?auto_108254 ) ) ( not ( = ?auto_108252 ?auto_108255 ) ) ( not ( = ?auto_108252 ?auto_108256 ) ) ( not ( = ?auto_108252 ?auto_108257 ) ) ( not ( = ?auto_108253 ?auto_108254 ) ) ( not ( = ?auto_108253 ?auto_108255 ) ) ( not ( = ?auto_108253 ?auto_108256 ) ) ( not ( = ?auto_108253 ?auto_108257 ) ) ( not ( = ?auto_108254 ?auto_108255 ) ) ( not ( = ?auto_108254 ?auto_108256 ) ) ( not ( = ?auto_108254 ?auto_108257 ) ) ( not ( = ?auto_108255 ?auto_108256 ) ) ( not ( = ?auto_108255 ?auto_108257 ) ) ( not ( = ?auto_108256 ?auto_108257 ) ) ( not ( = ?auto_108252 ?auto_108258 ) ) ( not ( = ?auto_108253 ?auto_108258 ) ) ( not ( = ?auto_108254 ?auto_108258 ) ) ( not ( = ?auto_108255 ?auto_108258 ) ) ( not ( = ?auto_108256 ?auto_108258 ) ) ( not ( = ?auto_108257 ?auto_108258 ) ) ( ON ?auto_108258 ?auto_108259 ) ( not ( = ?auto_108252 ?auto_108259 ) ) ( not ( = ?auto_108253 ?auto_108259 ) ) ( not ( = ?auto_108254 ?auto_108259 ) ) ( not ( = ?auto_108255 ?auto_108259 ) ) ( not ( = ?auto_108256 ?auto_108259 ) ) ( not ( = ?auto_108257 ?auto_108259 ) ) ( not ( = ?auto_108258 ?auto_108259 ) ) ( ON ?auto_108257 ?auto_108258 ) ( ON ?auto_108256 ?auto_108257 ) ( ON-TABLE ?auto_108259 ) ( ON ?auto_108255 ?auto_108256 ) ( CLEAR ?auto_108255 ) ( HOLDING ?auto_108254 ) ( CLEAR ?auto_108253 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108252 ?auto_108253 ?auto_108254 )
      ( MAKE-5PILE ?auto_108252 ?auto_108253 ?auto_108254 ?auto_108255 ?auto_108256 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108260 - BLOCK
      ?auto_108261 - BLOCK
      ?auto_108262 - BLOCK
      ?auto_108263 - BLOCK
      ?auto_108264 - BLOCK
    )
    :vars
    (
      ?auto_108266 - BLOCK
      ?auto_108265 - BLOCK
      ?auto_108267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108260 ) ( ON ?auto_108261 ?auto_108260 ) ( not ( = ?auto_108260 ?auto_108261 ) ) ( not ( = ?auto_108260 ?auto_108262 ) ) ( not ( = ?auto_108260 ?auto_108263 ) ) ( not ( = ?auto_108260 ?auto_108264 ) ) ( not ( = ?auto_108260 ?auto_108266 ) ) ( not ( = ?auto_108261 ?auto_108262 ) ) ( not ( = ?auto_108261 ?auto_108263 ) ) ( not ( = ?auto_108261 ?auto_108264 ) ) ( not ( = ?auto_108261 ?auto_108266 ) ) ( not ( = ?auto_108262 ?auto_108263 ) ) ( not ( = ?auto_108262 ?auto_108264 ) ) ( not ( = ?auto_108262 ?auto_108266 ) ) ( not ( = ?auto_108263 ?auto_108264 ) ) ( not ( = ?auto_108263 ?auto_108266 ) ) ( not ( = ?auto_108264 ?auto_108266 ) ) ( not ( = ?auto_108260 ?auto_108265 ) ) ( not ( = ?auto_108261 ?auto_108265 ) ) ( not ( = ?auto_108262 ?auto_108265 ) ) ( not ( = ?auto_108263 ?auto_108265 ) ) ( not ( = ?auto_108264 ?auto_108265 ) ) ( not ( = ?auto_108266 ?auto_108265 ) ) ( ON ?auto_108265 ?auto_108267 ) ( not ( = ?auto_108260 ?auto_108267 ) ) ( not ( = ?auto_108261 ?auto_108267 ) ) ( not ( = ?auto_108262 ?auto_108267 ) ) ( not ( = ?auto_108263 ?auto_108267 ) ) ( not ( = ?auto_108264 ?auto_108267 ) ) ( not ( = ?auto_108266 ?auto_108267 ) ) ( not ( = ?auto_108265 ?auto_108267 ) ) ( ON ?auto_108266 ?auto_108265 ) ( ON ?auto_108264 ?auto_108266 ) ( ON-TABLE ?auto_108267 ) ( ON ?auto_108263 ?auto_108264 ) ( CLEAR ?auto_108261 ) ( ON ?auto_108262 ?auto_108263 ) ( CLEAR ?auto_108262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108267 ?auto_108265 ?auto_108266 ?auto_108264 ?auto_108263 )
      ( MAKE-5PILE ?auto_108260 ?auto_108261 ?auto_108262 ?auto_108263 ?auto_108264 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108268 - BLOCK
      ?auto_108269 - BLOCK
      ?auto_108270 - BLOCK
      ?auto_108271 - BLOCK
      ?auto_108272 - BLOCK
    )
    :vars
    (
      ?auto_108274 - BLOCK
      ?auto_108273 - BLOCK
      ?auto_108275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108268 ) ( not ( = ?auto_108268 ?auto_108269 ) ) ( not ( = ?auto_108268 ?auto_108270 ) ) ( not ( = ?auto_108268 ?auto_108271 ) ) ( not ( = ?auto_108268 ?auto_108272 ) ) ( not ( = ?auto_108268 ?auto_108274 ) ) ( not ( = ?auto_108269 ?auto_108270 ) ) ( not ( = ?auto_108269 ?auto_108271 ) ) ( not ( = ?auto_108269 ?auto_108272 ) ) ( not ( = ?auto_108269 ?auto_108274 ) ) ( not ( = ?auto_108270 ?auto_108271 ) ) ( not ( = ?auto_108270 ?auto_108272 ) ) ( not ( = ?auto_108270 ?auto_108274 ) ) ( not ( = ?auto_108271 ?auto_108272 ) ) ( not ( = ?auto_108271 ?auto_108274 ) ) ( not ( = ?auto_108272 ?auto_108274 ) ) ( not ( = ?auto_108268 ?auto_108273 ) ) ( not ( = ?auto_108269 ?auto_108273 ) ) ( not ( = ?auto_108270 ?auto_108273 ) ) ( not ( = ?auto_108271 ?auto_108273 ) ) ( not ( = ?auto_108272 ?auto_108273 ) ) ( not ( = ?auto_108274 ?auto_108273 ) ) ( ON ?auto_108273 ?auto_108275 ) ( not ( = ?auto_108268 ?auto_108275 ) ) ( not ( = ?auto_108269 ?auto_108275 ) ) ( not ( = ?auto_108270 ?auto_108275 ) ) ( not ( = ?auto_108271 ?auto_108275 ) ) ( not ( = ?auto_108272 ?auto_108275 ) ) ( not ( = ?auto_108274 ?auto_108275 ) ) ( not ( = ?auto_108273 ?auto_108275 ) ) ( ON ?auto_108274 ?auto_108273 ) ( ON ?auto_108272 ?auto_108274 ) ( ON-TABLE ?auto_108275 ) ( ON ?auto_108271 ?auto_108272 ) ( ON ?auto_108270 ?auto_108271 ) ( CLEAR ?auto_108270 ) ( HOLDING ?auto_108269 ) ( CLEAR ?auto_108268 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108268 ?auto_108269 )
      ( MAKE-5PILE ?auto_108268 ?auto_108269 ?auto_108270 ?auto_108271 ?auto_108272 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108276 - BLOCK
      ?auto_108277 - BLOCK
      ?auto_108278 - BLOCK
      ?auto_108279 - BLOCK
      ?auto_108280 - BLOCK
    )
    :vars
    (
      ?auto_108281 - BLOCK
      ?auto_108282 - BLOCK
      ?auto_108283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108276 ) ( not ( = ?auto_108276 ?auto_108277 ) ) ( not ( = ?auto_108276 ?auto_108278 ) ) ( not ( = ?auto_108276 ?auto_108279 ) ) ( not ( = ?auto_108276 ?auto_108280 ) ) ( not ( = ?auto_108276 ?auto_108281 ) ) ( not ( = ?auto_108277 ?auto_108278 ) ) ( not ( = ?auto_108277 ?auto_108279 ) ) ( not ( = ?auto_108277 ?auto_108280 ) ) ( not ( = ?auto_108277 ?auto_108281 ) ) ( not ( = ?auto_108278 ?auto_108279 ) ) ( not ( = ?auto_108278 ?auto_108280 ) ) ( not ( = ?auto_108278 ?auto_108281 ) ) ( not ( = ?auto_108279 ?auto_108280 ) ) ( not ( = ?auto_108279 ?auto_108281 ) ) ( not ( = ?auto_108280 ?auto_108281 ) ) ( not ( = ?auto_108276 ?auto_108282 ) ) ( not ( = ?auto_108277 ?auto_108282 ) ) ( not ( = ?auto_108278 ?auto_108282 ) ) ( not ( = ?auto_108279 ?auto_108282 ) ) ( not ( = ?auto_108280 ?auto_108282 ) ) ( not ( = ?auto_108281 ?auto_108282 ) ) ( ON ?auto_108282 ?auto_108283 ) ( not ( = ?auto_108276 ?auto_108283 ) ) ( not ( = ?auto_108277 ?auto_108283 ) ) ( not ( = ?auto_108278 ?auto_108283 ) ) ( not ( = ?auto_108279 ?auto_108283 ) ) ( not ( = ?auto_108280 ?auto_108283 ) ) ( not ( = ?auto_108281 ?auto_108283 ) ) ( not ( = ?auto_108282 ?auto_108283 ) ) ( ON ?auto_108281 ?auto_108282 ) ( ON ?auto_108280 ?auto_108281 ) ( ON-TABLE ?auto_108283 ) ( ON ?auto_108279 ?auto_108280 ) ( ON ?auto_108278 ?auto_108279 ) ( CLEAR ?auto_108276 ) ( ON ?auto_108277 ?auto_108278 ) ( CLEAR ?auto_108277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108283 ?auto_108282 ?auto_108281 ?auto_108280 ?auto_108279 ?auto_108278 )
      ( MAKE-5PILE ?auto_108276 ?auto_108277 ?auto_108278 ?auto_108279 ?auto_108280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108284 - BLOCK
      ?auto_108285 - BLOCK
      ?auto_108286 - BLOCK
      ?auto_108287 - BLOCK
      ?auto_108288 - BLOCK
    )
    :vars
    (
      ?auto_108289 - BLOCK
      ?auto_108291 - BLOCK
      ?auto_108290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108284 ?auto_108285 ) ) ( not ( = ?auto_108284 ?auto_108286 ) ) ( not ( = ?auto_108284 ?auto_108287 ) ) ( not ( = ?auto_108284 ?auto_108288 ) ) ( not ( = ?auto_108284 ?auto_108289 ) ) ( not ( = ?auto_108285 ?auto_108286 ) ) ( not ( = ?auto_108285 ?auto_108287 ) ) ( not ( = ?auto_108285 ?auto_108288 ) ) ( not ( = ?auto_108285 ?auto_108289 ) ) ( not ( = ?auto_108286 ?auto_108287 ) ) ( not ( = ?auto_108286 ?auto_108288 ) ) ( not ( = ?auto_108286 ?auto_108289 ) ) ( not ( = ?auto_108287 ?auto_108288 ) ) ( not ( = ?auto_108287 ?auto_108289 ) ) ( not ( = ?auto_108288 ?auto_108289 ) ) ( not ( = ?auto_108284 ?auto_108291 ) ) ( not ( = ?auto_108285 ?auto_108291 ) ) ( not ( = ?auto_108286 ?auto_108291 ) ) ( not ( = ?auto_108287 ?auto_108291 ) ) ( not ( = ?auto_108288 ?auto_108291 ) ) ( not ( = ?auto_108289 ?auto_108291 ) ) ( ON ?auto_108291 ?auto_108290 ) ( not ( = ?auto_108284 ?auto_108290 ) ) ( not ( = ?auto_108285 ?auto_108290 ) ) ( not ( = ?auto_108286 ?auto_108290 ) ) ( not ( = ?auto_108287 ?auto_108290 ) ) ( not ( = ?auto_108288 ?auto_108290 ) ) ( not ( = ?auto_108289 ?auto_108290 ) ) ( not ( = ?auto_108291 ?auto_108290 ) ) ( ON ?auto_108289 ?auto_108291 ) ( ON ?auto_108288 ?auto_108289 ) ( ON-TABLE ?auto_108290 ) ( ON ?auto_108287 ?auto_108288 ) ( ON ?auto_108286 ?auto_108287 ) ( ON ?auto_108285 ?auto_108286 ) ( CLEAR ?auto_108285 ) ( HOLDING ?auto_108284 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108284 )
      ( MAKE-5PILE ?auto_108284 ?auto_108285 ?auto_108286 ?auto_108287 ?auto_108288 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_108292 - BLOCK
      ?auto_108293 - BLOCK
      ?auto_108294 - BLOCK
      ?auto_108295 - BLOCK
      ?auto_108296 - BLOCK
    )
    :vars
    (
      ?auto_108299 - BLOCK
      ?auto_108297 - BLOCK
      ?auto_108298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108292 ?auto_108293 ) ) ( not ( = ?auto_108292 ?auto_108294 ) ) ( not ( = ?auto_108292 ?auto_108295 ) ) ( not ( = ?auto_108292 ?auto_108296 ) ) ( not ( = ?auto_108292 ?auto_108299 ) ) ( not ( = ?auto_108293 ?auto_108294 ) ) ( not ( = ?auto_108293 ?auto_108295 ) ) ( not ( = ?auto_108293 ?auto_108296 ) ) ( not ( = ?auto_108293 ?auto_108299 ) ) ( not ( = ?auto_108294 ?auto_108295 ) ) ( not ( = ?auto_108294 ?auto_108296 ) ) ( not ( = ?auto_108294 ?auto_108299 ) ) ( not ( = ?auto_108295 ?auto_108296 ) ) ( not ( = ?auto_108295 ?auto_108299 ) ) ( not ( = ?auto_108296 ?auto_108299 ) ) ( not ( = ?auto_108292 ?auto_108297 ) ) ( not ( = ?auto_108293 ?auto_108297 ) ) ( not ( = ?auto_108294 ?auto_108297 ) ) ( not ( = ?auto_108295 ?auto_108297 ) ) ( not ( = ?auto_108296 ?auto_108297 ) ) ( not ( = ?auto_108299 ?auto_108297 ) ) ( ON ?auto_108297 ?auto_108298 ) ( not ( = ?auto_108292 ?auto_108298 ) ) ( not ( = ?auto_108293 ?auto_108298 ) ) ( not ( = ?auto_108294 ?auto_108298 ) ) ( not ( = ?auto_108295 ?auto_108298 ) ) ( not ( = ?auto_108296 ?auto_108298 ) ) ( not ( = ?auto_108299 ?auto_108298 ) ) ( not ( = ?auto_108297 ?auto_108298 ) ) ( ON ?auto_108299 ?auto_108297 ) ( ON ?auto_108296 ?auto_108299 ) ( ON-TABLE ?auto_108298 ) ( ON ?auto_108295 ?auto_108296 ) ( ON ?auto_108294 ?auto_108295 ) ( ON ?auto_108293 ?auto_108294 ) ( ON ?auto_108292 ?auto_108293 ) ( CLEAR ?auto_108292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108298 ?auto_108297 ?auto_108299 ?auto_108296 ?auto_108295 ?auto_108294 ?auto_108293 )
      ( MAKE-5PILE ?auto_108292 ?auto_108293 ?auto_108294 ?auto_108295 ?auto_108296 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108302 - BLOCK
      ?auto_108303 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_108303 ) ( CLEAR ?auto_108302 ) ( ON-TABLE ?auto_108302 ) ( not ( = ?auto_108302 ?auto_108303 ) ) )
    :subtasks
    ( ( !STACK ?auto_108303 ?auto_108302 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108304 - BLOCK
      ?auto_108305 - BLOCK
    )
    :vars
    (
      ?auto_108306 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_108304 ) ( ON-TABLE ?auto_108304 ) ( not ( = ?auto_108304 ?auto_108305 ) ) ( ON ?auto_108305 ?auto_108306 ) ( CLEAR ?auto_108305 ) ( HAND-EMPTY ) ( not ( = ?auto_108304 ?auto_108306 ) ) ( not ( = ?auto_108305 ?auto_108306 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108305 ?auto_108306 )
      ( MAKE-2PILE ?auto_108304 ?auto_108305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108307 - BLOCK
      ?auto_108308 - BLOCK
    )
    :vars
    (
      ?auto_108309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108307 ?auto_108308 ) ) ( ON ?auto_108308 ?auto_108309 ) ( CLEAR ?auto_108308 ) ( not ( = ?auto_108307 ?auto_108309 ) ) ( not ( = ?auto_108308 ?auto_108309 ) ) ( HOLDING ?auto_108307 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108307 )
      ( MAKE-2PILE ?auto_108307 ?auto_108308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108310 - BLOCK
      ?auto_108311 - BLOCK
    )
    :vars
    (
      ?auto_108312 - BLOCK
      ?auto_108315 - BLOCK
      ?auto_108314 - BLOCK
      ?auto_108316 - BLOCK
      ?auto_108313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108310 ?auto_108311 ) ) ( ON ?auto_108311 ?auto_108312 ) ( not ( = ?auto_108310 ?auto_108312 ) ) ( not ( = ?auto_108311 ?auto_108312 ) ) ( ON ?auto_108310 ?auto_108311 ) ( CLEAR ?auto_108310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108315 ) ( ON ?auto_108314 ?auto_108315 ) ( ON ?auto_108316 ?auto_108314 ) ( ON ?auto_108313 ?auto_108316 ) ( ON ?auto_108312 ?auto_108313 ) ( not ( = ?auto_108315 ?auto_108314 ) ) ( not ( = ?auto_108315 ?auto_108316 ) ) ( not ( = ?auto_108315 ?auto_108313 ) ) ( not ( = ?auto_108315 ?auto_108312 ) ) ( not ( = ?auto_108315 ?auto_108311 ) ) ( not ( = ?auto_108315 ?auto_108310 ) ) ( not ( = ?auto_108314 ?auto_108316 ) ) ( not ( = ?auto_108314 ?auto_108313 ) ) ( not ( = ?auto_108314 ?auto_108312 ) ) ( not ( = ?auto_108314 ?auto_108311 ) ) ( not ( = ?auto_108314 ?auto_108310 ) ) ( not ( = ?auto_108316 ?auto_108313 ) ) ( not ( = ?auto_108316 ?auto_108312 ) ) ( not ( = ?auto_108316 ?auto_108311 ) ) ( not ( = ?auto_108316 ?auto_108310 ) ) ( not ( = ?auto_108313 ?auto_108312 ) ) ( not ( = ?auto_108313 ?auto_108311 ) ) ( not ( = ?auto_108313 ?auto_108310 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108315 ?auto_108314 ?auto_108316 ?auto_108313 ?auto_108312 ?auto_108311 )
      ( MAKE-2PILE ?auto_108310 ?auto_108311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108317 - BLOCK
      ?auto_108318 - BLOCK
    )
    :vars
    (
      ?auto_108321 - BLOCK
      ?auto_108323 - BLOCK
      ?auto_108319 - BLOCK
      ?auto_108322 - BLOCK
      ?auto_108320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108317 ?auto_108318 ) ) ( ON ?auto_108318 ?auto_108321 ) ( not ( = ?auto_108317 ?auto_108321 ) ) ( not ( = ?auto_108318 ?auto_108321 ) ) ( ON-TABLE ?auto_108323 ) ( ON ?auto_108319 ?auto_108323 ) ( ON ?auto_108322 ?auto_108319 ) ( ON ?auto_108320 ?auto_108322 ) ( ON ?auto_108321 ?auto_108320 ) ( not ( = ?auto_108323 ?auto_108319 ) ) ( not ( = ?auto_108323 ?auto_108322 ) ) ( not ( = ?auto_108323 ?auto_108320 ) ) ( not ( = ?auto_108323 ?auto_108321 ) ) ( not ( = ?auto_108323 ?auto_108318 ) ) ( not ( = ?auto_108323 ?auto_108317 ) ) ( not ( = ?auto_108319 ?auto_108322 ) ) ( not ( = ?auto_108319 ?auto_108320 ) ) ( not ( = ?auto_108319 ?auto_108321 ) ) ( not ( = ?auto_108319 ?auto_108318 ) ) ( not ( = ?auto_108319 ?auto_108317 ) ) ( not ( = ?auto_108322 ?auto_108320 ) ) ( not ( = ?auto_108322 ?auto_108321 ) ) ( not ( = ?auto_108322 ?auto_108318 ) ) ( not ( = ?auto_108322 ?auto_108317 ) ) ( not ( = ?auto_108320 ?auto_108321 ) ) ( not ( = ?auto_108320 ?auto_108318 ) ) ( not ( = ?auto_108320 ?auto_108317 ) ) ( HOLDING ?auto_108317 ) ( CLEAR ?auto_108318 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108323 ?auto_108319 ?auto_108322 ?auto_108320 ?auto_108321 ?auto_108318 ?auto_108317 )
      ( MAKE-2PILE ?auto_108317 ?auto_108318 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108324 - BLOCK
      ?auto_108325 - BLOCK
    )
    :vars
    (
      ?auto_108326 - BLOCK
      ?auto_108328 - BLOCK
      ?auto_108329 - BLOCK
      ?auto_108330 - BLOCK
      ?auto_108327 - BLOCK
      ?auto_108331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108324 ?auto_108325 ) ) ( ON ?auto_108325 ?auto_108326 ) ( not ( = ?auto_108324 ?auto_108326 ) ) ( not ( = ?auto_108325 ?auto_108326 ) ) ( ON-TABLE ?auto_108328 ) ( ON ?auto_108329 ?auto_108328 ) ( ON ?auto_108330 ?auto_108329 ) ( ON ?auto_108327 ?auto_108330 ) ( ON ?auto_108326 ?auto_108327 ) ( not ( = ?auto_108328 ?auto_108329 ) ) ( not ( = ?auto_108328 ?auto_108330 ) ) ( not ( = ?auto_108328 ?auto_108327 ) ) ( not ( = ?auto_108328 ?auto_108326 ) ) ( not ( = ?auto_108328 ?auto_108325 ) ) ( not ( = ?auto_108328 ?auto_108324 ) ) ( not ( = ?auto_108329 ?auto_108330 ) ) ( not ( = ?auto_108329 ?auto_108327 ) ) ( not ( = ?auto_108329 ?auto_108326 ) ) ( not ( = ?auto_108329 ?auto_108325 ) ) ( not ( = ?auto_108329 ?auto_108324 ) ) ( not ( = ?auto_108330 ?auto_108327 ) ) ( not ( = ?auto_108330 ?auto_108326 ) ) ( not ( = ?auto_108330 ?auto_108325 ) ) ( not ( = ?auto_108330 ?auto_108324 ) ) ( not ( = ?auto_108327 ?auto_108326 ) ) ( not ( = ?auto_108327 ?auto_108325 ) ) ( not ( = ?auto_108327 ?auto_108324 ) ) ( CLEAR ?auto_108325 ) ( ON ?auto_108324 ?auto_108331 ) ( CLEAR ?auto_108324 ) ( HAND-EMPTY ) ( not ( = ?auto_108324 ?auto_108331 ) ) ( not ( = ?auto_108325 ?auto_108331 ) ) ( not ( = ?auto_108326 ?auto_108331 ) ) ( not ( = ?auto_108328 ?auto_108331 ) ) ( not ( = ?auto_108329 ?auto_108331 ) ) ( not ( = ?auto_108330 ?auto_108331 ) ) ( not ( = ?auto_108327 ?auto_108331 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108324 ?auto_108331 )
      ( MAKE-2PILE ?auto_108324 ?auto_108325 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108332 - BLOCK
      ?auto_108333 - BLOCK
    )
    :vars
    (
      ?auto_108336 - BLOCK
      ?auto_108338 - BLOCK
      ?auto_108335 - BLOCK
      ?auto_108339 - BLOCK
      ?auto_108337 - BLOCK
      ?auto_108334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108332 ?auto_108333 ) ) ( not ( = ?auto_108332 ?auto_108336 ) ) ( not ( = ?auto_108333 ?auto_108336 ) ) ( ON-TABLE ?auto_108338 ) ( ON ?auto_108335 ?auto_108338 ) ( ON ?auto_108339 ?auto_108335 ) ( ON ?auto_108337 ?auto_108339 ) ( ON ?auto_108336 ?auto_108337 ) ( not ( = ?auto_108338 ?auto_108335 ) ) ( not ( = ?auto_108338 ?auto_108339 ) ) ( not ( = ?auto_108338 ?auto_108337 ) ) ( not ( = ?auto_108338 ?auto_108336 ) ) ( not ( = ?auto_108338 ?auto_108333 ) ) ( not ( = ?auto_108338 ?auto_108332 ) ) ( not ( = ?auto_108335 ?auto_108339 ) ) ( not ( = ?auto_108335 ?auto_108337 ) ) ( not ( = ?auto_108335 ?auto_108336 ) ) ( not ( = ?auto_108335 ?auto_108333 ) ) ( not ( = ?auto_108335 ?auto_108332 ) ) ( not ( = ?auto_108339 ?auto_108337 ) ) ( not ( = ?auto_108339 ?auto_108336 ) ) ( not ( = ?auto_108339 ?auto_108333 ) ) ( not ( = ?auto_108339 ?auto_108332 ) ) ( not ( = ?auto_108337 ?auto_108336 ) ) ( not ( = ?auto_108337 ?auto_108333 ) ) ( not ( = ?auto_108337 ?auto_108332 ) ) ( ON ?auto_108332 ?auto_108334 ) ( CLEAR ?auto_108332 ) ( not ( = ?auto_108332 ?auto_108334 ) ) ( not ( = ?auto_108333 ?auto_108334 ) ) ( not ( = ?auto_108336 ?auto_108334 ) ) ( not ( = ?auto_108338 ?auto_108334 ) ) ( not ( = ?auto_108335 ?auto_108334 ) ) ( not ( = ?auto_108339 ?auto_108334 ) ) ( not ( = ?auto_108337 ?auto_108334 ) ) ( HOLDING ?auto_108333 ) ( CLEAR ?auto_108336 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108338 ?auto_108335 ?auto_108339 ?auto_108337 ?auto_108336 ?auto_108333 )
      ( MAKE-2PILE ?auto_108332 ?auto_108333 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108340 - BLOCK
      ?auto_108341 - BLOCK
    )
    :vars
    (
      ?auto_108347 - BLOCK
      ?auto_108346 - BLOCK
      ?auto_108342 - BLOCK
      ?auto_108345 - BLOCK
      ?auto_108344 - BLOCK
      ?auto_108343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108340 ?auto_108341 ) ) ( not ( = ?auto_108340 ?auto_108347 ) ) ( not ( = ?auto_108341 ?auto_108347 ) ) ( ON-TABLE ?auto_108346 ) ( ON ?auto_108342 ?auto_108346 ) ( ON ?auto_108345 ?auto_108342 ) ( ON ?auto_108344 ?auto_108345 ) ( ON ?auto_108347 ?auto_108344 ) ( not ( = ?auto_108346 ?auto_108342 ) ) ( not ( = ?auto_108346 ?auto_108345 ) ) ( not ( = ?auto_108346 ?auto_108344 ) ) ( not ( = ?auto_108346 ?auto_108347 ) ) ( not ( = ?auto_108346 ?auto_108341 ) ) ( not ( = ?auto_108346 ?auto_108340 ) ) ( not ( = ?auto_108342 ?auto_108345 ) ) ( not ( = ?auto_108342 ?auto_108344 ) ) ( not ( = ?auto_108342 ?auto_108347 ) ) ( not ( = ?auto_108342 ?auto_108341 ) ) ( not ( = ?auto_108342 ?auto_108340 ) ) ( not ( = ?auto_108345 ?auto_108344 ) ) ( not ( = ?auto_108345 ?auto_108347 ) ) ( not ( = ?auto_108345 ?auto_108341 ) ) ( not ( = ?auto_108345 ?auto_108340 ) ) ( not ( = ?auto_108344 ?auto_108347 ) ) ( not ( = ?auto_108344 ?auto_108341 ) ) ( not ( = ?auto_108344 ?auto_108340 ) ) ( ON ?auto_108340 ?auto_108343 ) ( not ( = ?auto_108340 ?auto_108343 ) ) ( not ( = ?auto_108341 ?auto_108343 ) ) ( not ( = ?auto_108347 ?auto_108343 ) ) ( not ( = ?auto_108346 ?auto_108343 ) ) ( not ( = ?auto_108342 ?auto_108343 ) ) ( not ( = ?auto_108345 ?auto_108343 ) ) ( not ( = ?auto_108344 ?auto_108343 ) ) ( CLEAR ?auto_108347 ) ( ON ?auto_108341 ?auto_108340 ) ( CLEAR ?auto_108341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108343 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108343 ?auto_108340 )
      ( MAKE-2PILE ?auto_108340 ?auto_108341 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108348 - BLOCK
      ?auto_108349 - BLOCK
    )
    :vars
    (
      ?auto_108350 - BLOCK
      ?auto_108352 - BLOCK
      ?auto_108351 - BLOCK
      ?auto_108354 - BLOCK
      ?auto_108355 - BLOCK
      ?auto_108353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108348 ?auto_108349 ) ) ( not ( = ?auto_108348 ?auto_108350 ) ) ( not ( = ?auto_108349 ?auto_108350 ) ) ( ON-TABLE ?auto_108352 ) ( ON ?auto_108351 ?auto_108352 ) ( ON ?auto_108354 ?auto_108351 ) ( ON ?auto_108355 ?auto_108354 ) ( not ( = ?auto_108352 ?auto_108351 ) ) ( not ( = ?auto_108352 ?auto_108354 ) ) ( not ( = ?auto_108352 ?auto_108355 ) ) ( not ( = ?auto_108352 ?auto_108350 ) ) ( not ( = ?auto_108352 ?auto_108349 ) ) ( not ( = ?auto_108352 ?auto_108348 ) ) ( not ( = ?auto_108351 ?auto_108354 ) ) ( not ( = ?auto_108351 ?auto_108355 ) ) ( not ( = ?auto_108351 ?auto_108350 ) ) ( not ( = ?auto_108351 ?auto_108349 ) ) ( not ( = ?auto_108351 ?auto_108348 ) ) ( not ( = ?auto_108354 ?auto_108355 ) ) ( not ( = ?auto_108354 ?auto_108350 ) ) ( not ( = ?auto_108354 ?auto_108349 ) ) ( not ( = ?auto_108354 ?auto_108348 ) ) ( not ( = ?auto_108355 ?auto_108350 ) ) ( not ( = ?auto_108355 ?auto_108349 ) ) ( not ( = ?auto_108355 ?auto_108348 ) ) ( ON ?auto_108348 ?auto_108353 ) ( not ( = ?auto_108348 ?auto_108353 ) ) ( not ( = ?auto_108349 ?auto_108353 ) ) ( not ( = ?auto_108350 ?auto_108353 ) ) ( not ( = ?auto_108352 ?auto_108353 ) ) ( not ( = ?auto_108351 ?auto_108353 ) ) ( not ( = ?auto_108354 ?auto_108353 ) ) ( not ( = ?auto_108355 ?auto_108353 ) ) ( ON ?auto_108349 ?auto_108348 ) ( CLEAR ?auto_108349 ) ( ON-TABLE ?auto_108353 ) ( HOLDING ?auto_108350 ) ( CLEAR ?auto_108355 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108352 ?auto_108351 ?auto_108354 ?auto_108355 ?auto_108350 )
      ( MAKE-2PILE ?auto_108348 ?auto_108349 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108356 - BLOCK
      ?auto_108357 - BLOCK
    )
    :vars
    (
      ?auto_108358 - BLOCK
      ?auto_108361 - BLOCK
      ?auto_108360 - BLOCK
      ?auto_108363 - BLOCK
      ?auto_108362 - BLOCK
      ?auto_108359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108356 ?auto_108357 ) ) ( not ( = ?auto_108356 ?auto_108358 ) ) ( not ( = ?auto_108357 ?auto_108358 ) ) ( ON-TABLE ?auto_108361 ) ( ON ?auto_108360 ?auto_108361 ) ( ON ?auto_108363 ?auto_108360 ) ( ON ?auto_108362 ?auto_108363 ) ( not ( = ?auto_108361 ?auto_108360 ) ) ( not ( = ?auto_108361 ?auto_108363 ) ) ( not ( = ?auto_108361 ?auto_108362 ) ) ( not ( = ?auto_108361 ?auto_108358 ) ) ( not ( = ?auto_108361 ?auto_108357 ) ) ( not ( = ?auto_108361 ?auto_108356 ) ) ( not ( = ?auto_108360 ?auto_108363 ) ) ( not ( = ?auto_108360 ?auto_108362 ) ) ( not ( = ?auto_108360 ?auto_108358 ) ) ( not ( = ?auto_108360 ?auto_108357 ) ) ( not ( = ?auto_108360 ?auto_108356 ) ) ( not ( = ?auto_108363 ?auto_108362 ) ) ( not ( = ?auto_108363 ?auto_108358 ) ) ( not ( = ?auto_108363 ?auto_108357 ) ) ( not ( = ?auto_108363 ?auto_108356 ) ) ( not ( = ?auto_108362 ?auto_108358 ) ) ( not ( = ?auto_108362 ?auto_108357 ) ) ( not ( = ?auto_108362 ?auto_108356 ) ) ( ON ?auto_108356 ?auto_108359 ) ( not ( = ?auto_108356 ?auto_108359 ) ) ( not ( = ?auto_108357 ?auto_108359 ) ) ( not ( = ?auto_108358 ?auto_108359 ) ) ( not ( = ?auto_108361 ?auto_108359 ) ) ( not ( = ?auto_108360 ?auto_108359 ) ) ( not ( = ?auto_108363 ?auto_108359 ) ) ( not ( = ?auto_108362 ?auto_108359 ) ) ( ON ?auto_108357 ?auto_108356 ) ( ON-TABLE ?auto_108359 ) ( CLEAR ?auto_108362 ) ( ON ?auto_108358 ?auto_108357 ) ( CLEAR ?auto_108358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108359 ?auto_108356 ?auto_108357 )
      ( MAKE-2PILE ?auto_108356 ?auto_108357 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108364 - BLOCK
      ?auto_108365 - BLOCK
    )
    :vars
    (
      ?auto_108368 - BLOCK
      ?auto_108370 - BLOCK
      ?auto_108366 - BLOCK
      ?auto_108371 - BLOCK
      ?auto_108369 - BLOCK
      ?auto_108367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108364 ?auto_108365 ) ) ( not ( = ?auto_108364 ?auto_108368 ) ) ( not ( = ?auto_108365 ?auto_108368 ) ) ( ON-TABLE ?auto_108370 ) ( ON ?auto_108366 ?auto_108370 ) ( ON ?auto_108371 ?auto_108366 ) ( not ( = ?auto_108370 ?auto_108366 ) ) ( not ( = ?auto_108370 ?auto_108371 ) ) ( not ( = ?auto_108370 ?auto_108369 ) ) ( not ( = ?auto_108370 ?auto_108368 ) ) ( not ( = ?auto_108370 ?auto_108365 ) ) ( not ( = ?auto_108370 ?auto_108364 ) ) ( not ( = ?auto_108366 ?auto_108371 ) ) ( not ( = ?auto_108366 ?auto_108369 ) ) ( not ( = ?auto_108366 ?auto_108368 ) ) ( not ( = ?auto_108366 ?auto_108365 ) ) ( not ( = ?auto_108366 ?auto_108364 ) ) ( not ( = ?auto_108371 ?auto_108369 ) ) ( not ( = ?auto_108371 ?auto_108368 ) ) ( not ( = ?auto_108371 ?auto_108365 ) ) ( not ( = ?auto_108371 ?auto_108364 ) ) ( not ( = ?auto_108369 ?auto_108368 ) ) ( not ( = ?auto_108369 ?auto_108365 ) ) ( not ( = ?auto_108369 ?auto_108364 ) ) ( ON ?auto_108364 ?auto_108367 ) ( not ( = ?auto_108364 ?auto_108367 ) ) ( not ( = ?auto_108365 ?auto_108367 ) ) ( not ( = ?auto_108368 ?auto_108367 ) ) ( not ( = ?auto_108370 ?auto_108367 ) ) ( not ( = ?auto_108366 ?auto_108367 ) ) ( not ( = ?auto_108371 ?auto_108367 ) ) ( not ( = ?auto_108369 ?auto_108367 ) ) ( ON ?auto_108365 ?auto_108364 ) ( ON-TABLE ?auto_108367 ) ( ON ?auto_108368 ?auto_108365 ) ( CLEAR ?auto_108368 ) ( HOLDING ?auto_108369 ) ( CLEAR ?auto_108371 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108370 ?auto_108366 ?auto_108371 ?auto_108369 )
      ( MAKE-2PILE ?auto_108364 ?auto_108365 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108372 - BLOCK
      ?auto_108373 - BLOCK
    )
    :vars
    (
      ?auto_108374 - BLOCK
      ?auto_108375 - BLOCK
      ?auto_108378 - BLOCK
      ?auto_108377 - BLOCK
      ?auto_108379 - BLOCK
      ?auto_108376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108372 ?auto_108373 ) ) ( not ( = ?auto_108372 ?auto_108374 ) ) ( not ( = ?auto_108373 ?auto_108374 ) ) ( ON-TABLE ?auto_108375 ) ( ON ?auto_108378 ?auto_108375 ) ( ON ?auto_108377 ?auto_108378 ) ( not ( = ?auto_108375 ?auto_108378 ) ) ( not ( = ?auto_108375 ?auto_108377 ) ) ( not ( = ?auto_108375 ?auto_108379 ) ) ( not ( = ?auto_108375 ?auto_108374 ) ) ( not ( = ?auto_108375 ?auto_108373 ) ) ( not ( = ?auto_108375 ?auto_108372 ) ) ( not ( = ?auto_108378 ?auto_108377 ) ) ( not ( = ?auto_108378 ?auto_108379 ) ) ( not ( = ?auto_108378 ?auto_108374 ) ) ( not ( = ?auto_108378 ?auto_108373 ) ) ( not ( = ?auto_108378 ?auto_108372 ) ) ( not ( = ?auto_108377 ?auto_108379 ) ) ( not ( = ?auto_108377 ?auto_108374 ) ) ( not ( = ?auto_108377 ?auto_108373 ) ) ( not ( = ?auto_108377 ?auto_108372 ) ) ( not ( = ?auto_108379 ?auto_108374 ) ) ( not ( = ?auto_108379 ?auto_108373 ) ) ( not ( = ?auto_108379 ?auto_108372 ) ) ( ON ?auto_108372 ?auto_108376 ) ( not ( = ?auto_108372 ?auto_108376 ) ) ( not ( = ?auto_108373 ?auto_108376 ) ) ( not ( = ?auto_108374 ?auto_108376 ) ) ( not ( = ?auto_108375 ?auto_108376 ) ) ( not ( = ?auto_108378 ?auto_108376 ) ) ( not ( = ?auto_108377 ?auto_108376 ) ) ( not ( = ?auto_108379 ?auto_108376 ) ) ( ON ?auto_108373 ?auto_108372 ) ( ON-TABLE ?auto_108376 ) ( ON ?auto_108374 ?auto_108373 ) ( CLEAR ?auto_108377 ) ( ON ?auto_108379 ?auto_108374 ) ( CLEAR ?auto_108379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108376 ?auto_108372 ?auto_108373 ?auto_108374 )
      ( MAKE-2PILE ?auto_108372 ?auto_108373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108380 - BLOCK
      ?auto_108381 - BLOCK
    )
    :vars
    (
      ?auto_108382 - BLOCK
      ?auto_108386 - BLOCK
      ?auto_108384 - BLOCK
      ?auto_108387 - BLOCK
      ?auto_108385 - BLOCK
      ?auto_108383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108380 ?auto_108381 ) ) ( not ( = ?auto_108380 ?auto_108382 ) ) ( not ( = ?auto_108381 ?auto_108382 ) ) ( ON-TABLE ?auto_108386 ) ( ON ?auto_108384 ?auto_108386 ) ( not ( = ?auto_108386 ?auto_108384 ) ) ( not ( = ?auto_108386 ?auto_108387 ) ) ( not ( = ?auto_108386 ?auto_108385 ) ) ( not ( = ?auto_108386 ?auto_108382 ) ) ( not ( = ?auto_108386 ?auto_108381 ) ) ( not ( = ?auto_108386 ?auto_108380 ) ) ( not ( = ?auto_108384 ?auto_108387 ) ) ( not ( = ?auto_108384 ?auto_108385 ) ) ( not ( = ?auto_108384 ?auto_108382 ) ) ( not ( = ?auto_108384 ?auto_108381 ) ) ( not ( = ?auto_108384 ?auto_108380 ) ) ( not ( = ?auto_108387 ?auto_108385 ) ) ( not ( = ?auto_108387 ?auto_108382 ) ) ( not ( = ?auto_108387 ?auto_108381 ) ) ( not ( = ?auto_108387 ?auto_108380 ) ) ( not ( = ?auto_108385 ?auto_108382 ) ) ( not ( = ?auto_108385 ?auto_108381 ) ) ( not ( = ?auto_108385 ?auto_108380 ) ) ( ON ?auto_108380 ?auto_108383 ) ( not ( = ?auto_108380 ?auto_108383 ) ) ( not ( = ?auto_108381 ?auto_108383 ) ) ( not ( = ?auto_108382 ?auto_108383 ) ) ( not ( = ?auto_108386 ?auto_108383 ) ) ( not ( = ?auto_108384 ?auto_108383 ) ) ( not ( = ?auto_108387 ?auto_108383 ) ) ( not ( = ?auto_108385 ?auto_108383 ) ) ( ON ?auto_108381 ?auto_108380 ) ( ON-TABLE ?auto_108383 ) ( ON ?auto_108382 ?auto_108381 ) ( ON ?auto_108385 ?auto_108382 ) ( CLEAR ?auto_108385 ) ( HOLDING ?auto_108387 ) ( CLEAR ?auto_108384 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108386 ?auto_108384 ?auto_108387 )
      ( MAKE-2PILE ?auto_108380 ?auto_108381 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108388 - BLOCK
      ?auto_108389 - BLOCK
    )
    :vars
    (
      ?auto_108392 - BLOCK
      ?auto_108391 - BLOCK
      ?auto_108394 - BLOCK
      ?auto_108390 - BLOCK
      ?auto_108395 - BLOCK
      ?auto_108393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108388 ?auto_108389 ) ) ( not ( = ?auto_108388 ?auto_108392 ) ) ( not ( = ?auto_108389 ?auto_108392 ) ) ( ON-TABLE ?auto_108391 ) ( ON ?auto_108394 ?auto_108391 ) ( not ( = ?auto_108391 ?auto_108394 ) ) ( not ( = ?auto_108391 ?auto_108390 ) ) ( not ( = ?auto_108391 ?auto_108395 ) ) ( not ( = ?auto_108391 ?auto_108392 ) ) ( not ( = ?auto_108391 ?auto_108389 ) ) ( not ( = ?auto_108391 ?auto_108388 ) ) ( not ( = ?auto_108394 ?auto_108390 ) ) ( not ( = ?auto_108394 ?auto_108395 ) ) ( not ( = ?auto_108394 ?auto_108392 ) ) ( not ( = ?auto_108394 ?auto_108389 ) ) ( not ( = ?auto_108394 ?auto_108388 ) ) ( not ( = ?auto_108390 ?auto_108395 ) ) ( not ( = ?auto_108390 ?auto_108392 ) ) ( not ( = ?auto_108390 ?auto_108389 ) ) ( not ( = ?auto_108390 ?auto_108388 ) ) ( not ( = ?auto_108395 ?auto_108392 ) ) ( not ( = ?auto_108395 ?auto_108389 ) ) ( not ( = ?auto_108395 ?auto_108388 ) ) ( ON ?auto_108388 ?auto_108393 ) ( not ( = ?auto_108388 ?auto_108393 ) ) ( not ( = ?auto_108389 ?auto_108393 ) ) ( not ( = ?auto_108392 ?auto_108393 ) ) ( not ( = ?auto_108391 ?auto_108393 ) ) ( not ( = ?auto_108394 ?auto_108393 ) ) ( not ( = ?auto_108390 ?auto_108393 ) ) ( not ( = ?auto_108395 ?auto_108393 ) ) ( ON ?auto_108389 ?auto_108388 ) ( ON-TABLE ?auto_108393 ) ( ON ?auto_108392 ?auto_108389 ) ( ON ?auto_108395 ?auto_108392 ) ( CLEAR ?auto_108394 ) ( ON ?auto_108390 ?auto_108395 ) ( CLEAR ?auto_108390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108393 ?auto_108388 ?auto_108389 ?auto_108392 ?auto_108395 )
      ( MAKE-2PILE ?auto_108388 ?auto_108389 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108396 - BLOCK
      ?auto_108397 - BLOCK
    )
    :vars
    (
      ?auto_108400 - BLOCK
      ?auto_108399 - BLOCK
      ?auto_108398 - BLOCK
      ?auto_108402 - BLOCK
      ?auto_108401 - BLOCK
      ?auto_108403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108396 ?auto_108397 ) ) ( not ( = ?auto_108396 ?auto_108400 ) ) ( not ( = ?auto_108397 ?auto_108400 ) ) ( ON-TABLE ?auto_108399 ) ( not ( = ?auto_108399 ?auto_108398 ) ) ( not ( = ?auto_108399 ?auto_108402 ) ) ( not ( = ?auto_108399 ?auto_108401 ) ) ( not ( = ?auto_108399 ?auto_108400 ) ) ( not ( = ?auto_108399 ?auto_108397 ) ) ( not ( = ?auto_108399 ?auto_108396 ) ) ( not ( = ?auto_108398 ?auto_108402 ) ) ( not ( = ?auto_108398 ?auto_108401 ) ) ( not ( = ?auto_108398 ?auto_108400 ) ) ( not ( = ?auto_108398 ?auto_108397 ) ) ( not ( = ?auto_108398 ?auto_108396 ) ) ( not ( = ?auto_108402 ?auto_108401 ) ) ( not ( = ?auto_108402 ?auto_108400 ) ) ( not ( = ?auto_108402 ?auto_108397 ) ) ( not ( = ?auto_108402 ?auto_108396 ) ) ( not ( = ?auto_108401 ?auto_108400 ) ) ( not ( = ?auto_108401 ?auto_108397 ) ) ( not ( = ?auto_108401 ?auto_108396 ) ) ( ON ?auto_108396 ?auto_108403 ) ( not ( = ?auto_108396 ?auto_108403 ) ) ( not ( = ?auto_108397 ?auto_108403 ) ) ( not ( = ?auto_108400 ?auto_108403 ) ) ( not ( = ?auto_108399 ?auto_108403 ) ) ( not ( = ?auto_108398 ?auto_108403 ) ) ( not ( = ?auto_108402 ?auto_108403 ) ) ( not ( = ?auto_108401 ?auto_108403 ) ) ( ON ?auto_108397 ?auto_108396 ) ( ON-TABLE ?auto_108403 ) ( ON ?auto_108400 ?auto_108397 ) ( ON ?auto_108401 ?auto_108400 ) ( ON ?auto_108402 ?auto_108401 ) ( CLEAR ?auto_108402 ) ( HOLDING ?auto_108398 ) ( CLEAR ?auto_108399 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108399 ?auto_108398 )
      ( MAKE-2PILE ?auto_108396 ?auto_108397 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108404 - BLOCK
      ?auto_108405 - BLOCK
    )
    :vars
    (
      ?auto_108411 - BLOCK
      ?auto_108407 - BLOCK
      ?auto_108409 - BLOCK
      ?auto_108408 - BLOCK
      ?auto_108406 - BLOCK
      ?auto_108410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108404 ?auto_108405 ) ) ( not ( = ?auto_108404 ?auto_108411 ) ) ( not ( = ?auto_108405 ?auto_108411 ) ) ( ON-TABLE ?auto_108407 ) ( not ( = ?auto_108407 ?auto_108409 ) ) ( not ( = ?auto_108407 ?auto_108408 ) ) ( not ( = ?auto_108407 ?auto_108406 ) ) ( not ( = ?auto_108407 ?auto_108411 ) ) ( not ( = ?auto_108407 ?auto_108405 ) ) ( not ( = ?auto_108407 ?auto_108404 ) ) ( not ( = ?auto_108409 ?auto_108408 ) ) ( not ( = ?auto_108409 ?auto_108406 ) ) ( not ( = ?auto_108409 ?auto_108411 ) ) ( not ( = ?auto_108409 ?auto_108405 ) ) ( not ( = ?auto_108409 ?auto_108404 ) ) ( not ( = ?auto_108408 ?auto_108406 ) ) ( not ( = ?auto_108408 ?auto_108411 ) ) ( not ( = ?auto_108408 ?auto_108405 ) ) ( not ( = ?auto_108408 ?auto_108404 ) ) ( not ( = ?auto_108406 ?auto_108411 ) ) ( not ( = ?auto_108406 ?auto_108405 ) ) ( not ( = ?auto_108406 ?auto_108404 ) ) ( ON ?auto_108404 ?auto_108410 ) ( not ( = ?auto_108404 ?auto_108410 ) ) ( not ( = ?auto_108405 ?auto_108410 ) ) ( not ( = ?auto_108411 ?auto_108410 ) ) ( not ( = ?auto_108407 ?auto_108410 ) ) ( not ( = ?auto_108409 ?auto_108410 ) ) ( not ( = ?auto_108408 ?auto_108410 ) ) ( not ( = ?auto_108406 ?auto_108410 ) ) ( ON ?auto_108405 ?auto_108404 ) ( ON-TABLE ?auto_108410 ) ( ON ?auto_108411 ?auto_108405 ) ( ON ?auto_108406 ?auto_108411 ) ( ON ?auto_108408 ?auto_108406 ) ( CLEAR ?auto_108407 ) ( ON ?auto_108409 ?auto_108408 ) ( CLEAR ?auto_108409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108410 ?auto_108404 ?auto_108405 ?auto_108411 ?auto_108406 ?auto_108408 )
      ( MAKE-2PILE ?auto_108404 ?auto_108405 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108412 - BLOCK
      ?auto_108413 - BLOCK
    )
    :vars
    (
      ?auto_108419 - BLOCK
      ?auto_108414 - BLOCK
      ?auto_108415 - BLOCK
      ?auto_108416 - BLOCK
      ?auto_108418 - BLOCK
      ?auto_108417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108412 ?auto_108413 ) ) ( not ( = ?auto_108412 ?auto_108419 ) ) ( not ( = ?auto_108413 ?auto_108419 ) ) ( not ( = ?auto_108414 ?auto_108415 ) ) ( not ( = ?auto_108414 ?auto_108416 ) ) ( not ( = ?auto_108414 ?auto_108418 ) ) ( not ( = ?auto_108414 ?auto_108419 ) ) ( not ( = ?auto_108414 ?auto_108413 ) ) ( not ( = ?auto_108414 ?auto_108412 ) ) ( not ( = ?auto_108415 ?auto_108416 ) ) ( not ( = ?auto_108415 ?auto_108418 ) ) ( not ( = ?auto_108415 ?auto_108419 ) ) ( not ( = ?auto_108415 ?auto_108413 ) ) ( not ( = ?auto_108415 ?auto_108412 ) ) ( not ( = ?auto_108416 ?auto_108418 ) ) ( not ( = ?auto_108416 ?auto_108419 ) ) ( not ( = ?auto_108416 ?auto_108413 ) ) ( not ( = ?auto_108416 ?auto_108412 ) ) ( not ( = ?auto_108418 ?auto_108419 ) ) ( not ( = ?auto_108418 ?auto_108413 ) ) ( not ( = ?auto_108418 ?auto_108412 ) ) ( ON ?auto_108412 ?auto_108417 ) ( not ( = ?auto_108412 ?auto_108417 ) ) ( not ( = ?auto_108413 ?auto_108417 ) ) ( not ( = ?auto_108419 ?auto_108417 ) ) ( not ( = ?auto_108414 ?auto_108417 ) ) ( not ( = ?auto_108415 ?auto_108417 ) ) ( not ( = ?auto_108416 ?auto_108417 ) ) ( not ( = ?auto_108418 ?auto_108417 ) ) ( ON ?auto_108413 ?auto_108412 ) ( ON-TABLE ?auto_108417 ) ( ON ?auto_108419 ?auto_108413 ) ( ON ?auto_108418 ?auto_108419 ) ( ON ?auto_108416 ?auto_108418 ) ( ON ?auto_108415 ?auto_108416 ) ( CLEAR ?auto_108415 ) ( HOLDING ?auto_108414 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108414 )
      ( MAKE-2PILE ?auto_108412 ?auto_108413 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_108420 - BLOCK
      ?auto_108421 - BLOCK
    )
    :vars
    (
      ?auto_108425 - BLOCK
      ?auto_108427 - BLOCK
      ?auto_108422 - BLOCK
      ?auto_108424 - BLOCK
      ?auto_108423 - BLOCK
      ?auto_108426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108420 ?auto_108421 ) ) ( not ( = ?auto_108420 ?auto_108425 ) ) ( not ( = ?auto_108421 ?auto_108425 ) ) ( not ( = ?auto_108427 ?auto_108422 ) ) ( not ( = ?auto_108427 ?auto_108424 ) ) ( not ( = ?auto_108427 ?auto_108423 ) ) ( not ( = ?auto_108427 ?auto_108425 ) ) ( not ( = ?auto_108427 ?auto_108421 ) ) ( not ( = ?auto_108427 ?auto_108420 ) ) ( not ( = ?auto_108422 ?auto_108424 ) ) ( not ( = ?auto_108422 ?auto_108423 ) ) ( not ( = ?auto_108422 ?auto_108425 ) ) ( not ( = ?auto_108422 ?auto_108421 ) ) ( not ( = ?auto_108422 ?auto_108420 ) ) ( not ( = ?auto_108424 ?auto_108423 ) ) ( not ( = ?auto_108424 ?auto_108425 ) ) ( not ( = ?auto_108424 ?auto_108421 ) ) ( not ( = ?auto_108424 ?auto_108420 ) ) ( not ( = ?auto_108423 ?auto_108425 ) ) ( not ( = ?auto_108423 ?auto_108421 ) ) ( not ( = ?auto_108423 ?auto_108420 ) ) ( ON ?auto_108420 ?auto_108426 ) ( not ( = ?auto_108420 ?auto_108426 ) ) ( not ( = ?auto_108421 ?auto_108426 ) ) ( not ( = ?auto_108425 ?auto_108426 ) ) ( not ( = ?auto_108427 ?auto_108426 ) ) ( not ( = ?auto_108422 ?auto_108426 ) ) ( not ( = ?auto_108424 ?auto_108426 ) ) ( not ( = ?auto_108423 ?auto_108426 ) ) ( ON ?auto_108421 ?auto_108420 ) ( ON-TABLE ?auto_108426 ) ( ON ?auto_108425 ?auto_108421 ) ( ON ?auto_108423 ?auto_108425 ) ( ON ?auto_108424 ?auto_108423 ) ( ON ?auto_108422 ?auto_108424 ) ( ON ?auto_108427 ?auto_108422 ) ( CLEAR ?auto_108427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108426 ?auto_108420 ?auto_108421 ?auto_108425 ?auto_108423 ?auto_108424 ?auto_108422 )
      ( MAKE-2PILE ?auto_108420 ?auto_108421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108432 - BLOCK
      ?auto_108433 - BLOCK
      ?auto_108434 - BLOCK
      ?auto_108435 - BLOCK
    )
    :vars
    (
      ?auto_108436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108436 ?auto_108435 ) ( CLEAR ?auto_108436 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108432 ) ( ON ?auto_108433 ?auto_108432 ) ( ON ?auto_108434 ?auto_108433 ) ( ON ?auto_108435 ?auto_108434 ) ( not ( = ?auto_108432 ?auto_108433 ) ) ( not ( = ?auto_108432 ?auto_108434 ) ) ( not ( = ?auto_108432 ?auto_108435 ) ) ( not ( = ?auto_108432 ?auto_108436 ) ) ( not ( = ?auto_108433 ?auto_108434 ) ) ( not ( = ?auto_108433 ?auto_108435 ) ) ( not ( = ?auto_108433 ?auto_108436 ) ) ( not ( = ?auto_108434 ?auto_108435 ) ) ( not ( = ?auto_108434 ?auto_108436 ) ) ( not ( = ?auto_108435 ?auto_108436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108436 ?auto_108435 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108437 - BLOCK
      ?auto_108438 - BLOCK
      ?auto_108439 - BLOCK
      ?auto_108440 - BLOCK
    )
    :vars
    (
      ?auto_108441 - BLOCK
      ?auto_108442 - BLOCK
      ?auto_108443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108441 ?auto_108440 ) ( CLEAR ?auto_108441 ) ( ON-TABLE ?auto_108437 ) ( ON ?auto_108438 ?auto_108437 ) ( ON ?auto_108439 ?auto_108438 ) ( ON ?auto_108440 ?auto_108439 ) ( not ( = ?auto_108437 ?auto_108438 ) ) ( not ( = ?auto_108437 ?auto_108439 ) ) ( not ( = ?auto_108437 ?auto_108440 ) ) ( not ( = ?auto_108437 ?auto_108441 ) ) ( not ( = ?auto_108438 ?auto_108439 ) ) ( not ( = ?auto_108438 ?auto_108440 ) ) ( not ( = ?auto_108438 ?auto_108441 ) ) ( not ( = ?auto_108439 ?auto_108440 ) ) ( not ( = ?auto_108439 ?auto_108441 ) ) ( not ( = ?auto_108440 ?auto_108441 ) ) ( HOLDING ?auto_108442 ) ( CLEAR ?auto_108443 ) ( not ( = ?auto_108437 ?auto_108442 ) ) ( not ( = ?auto_108437 ?auto_108443 ) ) ( not ( = ?auto_108438 ?auto_108442 ) ) ( not ( = ?auto_108438 ?auto_108443 ) ) ( not ( = ?auto_108439 ?auto_108442 ) ) ( not ( = ?auto_108439 ?auto_108443 ) ) ( not ( = ?auto_108440 ?auto_108442 ) ) ( not ( = ?auto_108440 ?auto_108443 ) ) ( not ( = ?auto_108441 ?auto_108442 ) ) ( not ( = ?auto_108441 ?auto_108443 ) ) ( not ( = ?auto_108442 ?auto_108443 ) ) )
    :subtasks
    ( ( !STACK ?auto_108442 ?auto_108443 )
      ( MAKE-4PILE ?auto_108437 ?auto_108438 ?auto_108439 ?auto_108440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108444 - BLOCK
      ?auto_108445 - BLOCK
      ?auto_108446 - BLOCK
      ?auto_108447 - BLOCK
    )
    :vars
    (
      ?auto_108448 - BLOCK
      ?auto_108449 - BLOCK
      ?auto_108450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108448 ?auto_108447 ) ( ON-TABLE ?auto_108444 ) ( ON ?auto_108445 ?auto_108444 ) ( ON ?auto_108446 ?auto_108445 ) ( ON ?auto_108447 ?auto_108446 ) ( not ( = ?auto_108444 ?auto_108445 ) ) ( not ( = ?auto_108444 ?auto_108446 ) ) ( not ( = ?auto_108444 ?auto_108447 ) ) ( not ( = ?auto_108444 ?auto_108448 ) ) ( not ( = ?auto_108445 ?auto_108446 ) ) ( not ( = ?auto_108445 ?auto_108447 ) ) ( not ( = ?auto_108445 ?auto_108448 ) ) ( not ( = ?auto_108446 ?auto_108447 ) ) ( not ( = ?auto_108446 ?auto_108448 ) ) ( not ( = ?auto_108447 ?auto_108448 ) ) ( CLEAR ?auto_108449 ) ( not ( = ?auto_108444 ?auto_108450 ) ) ( not ( = ?auto_108444 ?auto_108449 ) ) ( not ( = ?auto_108445 ?auto_108450 ) ) ( not ( = ?auto_108445 ?auto_108449 ) ) ( not ( = ?auto_108446 ?auto_108450 ) ) ( not ( = ?auto_108446 ?auto_108449 ) ) ( not ( = ?auto_108447 ?auto_108450 ) ) ( not ( = ?auto_108447 ?auto_108449 ) ) ( not ( = ?auto_108448 ?auto_108450 ) ) ( not ( = ?auto_108448 ?auto_108449 ) ) ( not ( = ?auto_108450 ?auto_108449 ) ) ( ON ?auto_108450 ?auto_108448 ) ( CLEAR ?auto_108450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108444 ?auto_108445 ?auto_108446 ?auto_108447 ?auto_108448 )
      ( MAKE-4PILE ?auto_108444 ?auto_108445 ?auto_108446 ?auto_108447 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108451 - BLOCK
      ?auto_108452 - BLOCK
      ?auto_108453 - BLOCK
      ?auto_108454 - BLOCK
    )
    :vars
    (
      ?auto_108457 - BLOCK
      ?auto_108456 - BLOCK
      ?auto_108455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108457 ?auto_108454 ) ( ON-TABLE ?auto_108451 ) ( ON ?auto_108452 ?auto_108451 ) ( ON ?auto_108453 ?auto_108452 ) ( ON ?auto_108454 ?auto_108453 ) ( not ( = ?auto_108451 ?auto_108452 ) ) ( not ( = ?auto_108451 ?auto_108453 ) ) ( not ( = ?auto_108451 ?auto_108454 ) ) ( not ( = ?auto_108451 ?auto_108457 ) ) ( not ( = ?auto_108452 ?auto_108453 ) ) ( not ( = ?auto_108452 ?auto_108454 ) ) ( not ( = ?auto_108452 ?auto_108457 ) ) ( not ( = ?auto_108453 ?auto_108454 ) ) ( not ( = ?auto_108453 ?auto_108457 ) ) ( not ( = ?auto_108454 ?auto_108457 ) ) ( not ( = ?auto_108451 ?auto_108456 ) ) ( not ( = ?auto_108451 ?auto_108455 ) ) ( not ( = ?auto_108452 ?auto_108456 ) ) ( not ( = ?auto_108452 ?auto_108455 ) ) ( not ( = ?auto_108453 ?auto_108456 ) ) ( not ( = ?auto_108453 ?auto_108455 ) ) ( not ( = ?auto_108454 ?auto_108456 ) ) ( not ( = ?auto_108454 ?auto_108455 ) ) ( not ( = ?auto_108457 ?auto_108456 ) ) ( not ( = ?auto_108457 ?auto_108455 ) ) ( not ( = ?auto_108456 ?auto_108455 ) ) ( ON ?auto_108456 ?auto_108457 ) ( CLEAR ?auto_108456 ) ( HOLDING ?auto_108455 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108455 )
      ( MAKE-4PILE ?auto_108451 ?auto_108452 ?auto_108453 ?auto_108454 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108458 - BLOCK
      ?auto_108459 - BLOCK
      ?auto_108460 - BLOCK
      ?auto_108461 - BLOCK
    )
    :vars
    (
      ?auto_108462 - BLOCK
      ?auto_108464 - BLOCK
      ?auto_108463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108462 ?auto_108461 ) ( ON-TABLE ?auto_108458 ) ( ON ?auto_108459 ?auto_108458 ) ( ON ?auto_108460 ?auto_108459 ) ( ON ?auto_108461 ?auto_108460 ) ( not ( = ?auto_108458 ?auto_108459 ) ) ( not ( = ?auto_108458 ?auto_108460 ) ) ( not ( = ?auto_108458 ?auto_108461 ) ) ( not ( = ?auto_108458 ?auto_108462 ) ) ( not ( = ?auto_108459 ?auto_108460 ) ) ( not ( = ?auto_108459 ?auto_108461 ) ) ( not ( = ?auto_108459 ?auto_108462 ) ) ( not ( = ?auto_108460 ?auto_108461 ) ) ( not ( = ?auto_108460 ?auto_108462 ) ) ( not ( = ?auto_108461 ?auto_108462 ) ) ( not ( = ?auto_108458 ?auto_108464 ) ) ( not ( = ?auto_108458 ?auto_108463 ) ) ( not ( = ?auto_108459 ?auto_108464 ) ) ( not ( = ?auto_108459 ?auto_108463 ) ) ( not ( = ?auto_108460 ?auto_108464 ) ) ( not ( = ?auto_108460 ?auto_108463 ) ) ( not ( = ?auto_108461 ?auto_108464 ) ) ( not ( = ?auto_108461 ?auto_108463 ) ) ( not ( = ?auto_108462 ?auto_108464 ) ) ( not ( = ?auto_108462 ?auto_108463 ) ) ( not ( = ?auto_108464 ?auto_108463 ) ) ( ON ?auto_108464 ?auto_108462 ) ( ON ?auto_108463 ?auto_108464 ) ( CLEAR ?auto_108463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108458 ?auto_108459 ?auto_108460 ?auto_108461 ?auto_108462 ?auto_108464 )
      ( MAKE-4PILE ?auto_108458 ?auto_108459 ?auto_108460 ?auto_108461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108465 - BLOCK
      ?auto_108466 - BLOCK
      ?auto_108467 - BLOCK
      ?auto_108468 - BLOCK
    )
    :vars
    (
      ?auto_108469 - BLOCK
      ?auto_108470 - BLOCK
      ?auto_108471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108469 ?auto_108468 ) ( ON-TABLE ?auto_108465 ) ( ON ?auto_108466 ?auto_108465 ) ( ON ?auto_108467 ?auto_108466 ) ( ON ?auto_108468 ?auto_108467 ) ( not ( = ?auto_108465 ?auto_108466 ) ) ( not ( = ?auto_108465 ?auto_108467 ) ) ( not ( = ?auto_108465 ?auto_108468 ) ) ( not ( = ?auto_108465 ?auto_108469 ) ) ( not ( = ?auto_108466 ?auto_108467 ) ) ( not ( = ?auto_108466 ?auto_108468 ) ) ( not ( = ?auto_108466 ?auto_108469 ) ) ( not ( = ?auto_108467 ?auto_108468 ) ) ( not ( = ?auto_108467 ?auto_108469 ) ) ( not ( = ?auto_108468 ?auto_108469 ) ) ( not ( = ?auto_108465 ?auto_108470 ) ) ( not ( = ?auto_108465 ?auto_108471 ) ) ( not ( = ?auto_108466 ?auto_108470 ) ) ( not ( = ?auto_108466 ?auto_108471 ) ) ( not ( = ?auto_108467 ?auto_108470 ) ) ( not ( = ?auto_108467 ?auto_108471 ) ) ( not ( = ?auto_108468 ?auto_108470 ) ) ( not ( = ?auto_108468 ?auto_108471 ) ) ( not ( = ?auto_108469 ?auto_108470 ) ) ( not ( = ?auto_108469 ?auto_108471 ) ) ( not ( = ?auto_108470 ?auto_108471 ) ) ( ON ?auto_108470 ?auto_108469 ) ( HOLDING ?auto_108471 ) ( CLEAR ?auto_108470 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108465 ?auto_108466 ?auto_108467 ?auto_108468 ?auto_108469 ?auto_108470 ?auto_108471 )
      ( MAKE-4PILE ?auto_108465 ?auto_108466 ?auto_108467 ?auto_108468 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108472 - BLOCK
      ?auto_108473 - BLOCK
      ?auto_108474 - BLOCK
      ?auto_108475 - BLOCK
    )
    :vars
    (
      ?auto_108476 - BLOCK
      ?auto_108478 - BLOCK
      ?auto_108477 - BLOCK
      ?auto_108479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108476 ?auto_108475 ) ( ON-TABLE ?auto_108472 ) ( ON ?auto_108473 ?auto_108472 ) ( ON ?auto_108474 ?auto_108473 ) ( ON ?auto_108475 ?auto_108474 ) ( not ( = ?auto_108472 ?auto_108473 ) ) ( not ( = ?auto_108472 ?auto_108474 ) ) ( not ( = ?auto_108472 ?auto_108475 ) ) ( not ( = ?auto_108472 ?auto_108476 ) ) ( not ( = ?auto_108473 ?auto_108474 ) ) ( not ( = ?auto_108473 ?auto_108475 ) ) ( not ( = ?auto_108473 ?auto_108476 ) ) ( not ( = ?auto_108474 ?auto_108475 ) ) ( not ( = ?auto_108474 ?auto_108476 ) ) ( not ( = ?auto_108475 ?auto_108476 ) ) ( not ( = ?auto_108472 ?auto_108478 ) ) ( not ( = ?auto_108472 ?auto_108477 ) ) ( not ( = ?auto_108473 ?auto_108478 ) ) ( not ( = ?auto_108473 ?auto_108477 ) ) ( not ( = ?auto_108474 ?auto_108478 ) ) ( not ( = ?auto_108474 ?auto_108477 ) ) ( not ( = ?auto_108475 ?auto_108478 ) ) ( not ( = ?auto_108475 ?auto_108477 ) ) ( not ( = ?auto_108476 ?auto_108478 ) ) ( not ( = ?auto_108476 ?auto_108477 ) ) ( not ( = ?auto_108478 ?auto_108477 ) ) ( ON ?auto_108478 ?auto_108476 ) ( CLEAR ?auto_108478 ) ( ON ?auto_108477 ?auto_108479 ) ( CLEAR ?auto_108477 ) ( HAND-EMPTY ) ( not ( = ?auto_108472 ?auto_108479 ) ) ( not ( = ?auto_108473 ?auto_108479 ) ) ( not ( = ?auto_108474 ?auto_108479 ) ) ( not ( = ?auto_108475 ?auto_108479 ) ) ( not ( = ?auto_108476 ?auto_108479 ) ) ( not ( = ?auto_108478 ?auto_108479 ) ) ( not ( = ?auto_108477 ?auto_108479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108477 ?auto_108479 )
      ( MAKE-4PILE ?auto_108472 ?auto_108473 ?auto_108474 ?auto_108475 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108480 - BLOCK
      ?auto_108481 - BLOCK
      ?auto_108482 - BLOCK
      ?auto_108483 - BLOCK
    )
    :vars
    (
      ?auto_108484 - BLOCK
      ?auto_108486 - BLOCK
      ?auto_108487 - BLOCK
      ?auto_108485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108484 ?auto_108483 ) ( ON-TABLE ?auto_108480 ) ( ON ?auto_108481 ?auto_108480 ) ( ON ?auto_108482 ?auto_108481 ) ( ON ?auto_108483 ?auto_108482 ) ( not ( = ?auto_108480 ?auto_108481 ) ) ( not ( = ?auto_108480 ?auto_108482 ) ) ( not ( = ?auto_108480 ?auto_108483 ) ) ( not ( = ?auto_108480 ?auto_108484 ) ) ( not ( = ?auto_108481 ?auto_108482 ) ) ( not ( = ?auto_108481 ?auto_108483 ) ) ( not ( = ?auto_108481 ?auto_108484 ) ) ( not ( = ?auto_108482 ?auto_108483 ) ) ( not ( = ?auto_108482 ?auto_108484 ) ) ( not ( = ?auto_108483 ?auto_108484 ) ) ( not ( = ?auto_108480 ?auto_108486 ) ) ( not ( = ?auto_108480 ?auto_108487 ) ) ( not ( = ?auto_108481 ?auto_108486 ) ) ( not ( = ?auto_108481 ?auto_108487 ) ) ( not ( = ?auto_108482 ?auto_108486 ) ) ( not ( = ?auto_108482 ?auto_108487 ) ) ( not ( = ?auto_108483 ?auto_108486 ) ) ( not ( = ?auto_108483 ?auto_108487 ) ) ( not ( = ?auto_108484 ?auto_108486 ) ) ( not ( = ?auto_108484 ?auto_108487 ) ) ( not ( = ?auto_108486 ?auto_108487 ) ) ( ON ?auto_108487 ?auto_108485 ) ( CLEAR ?auto_108487 ) ( not ( = ?auto_108480 ?auto_108485 ) ) ( not ( = ?auto_108481 ?auto_108485 ) ) ( not ( = ?auto_108482 ?auto_108485 ) ) ( not ( = ?auto_108483 ?auto_108485 ) ) ( not ( = ?auto_108484 ?auto_108485 ) ) ( not ( = ?auto_108486 ?auto_108485 ) ) ( not ( = ?auto_108487 ?auto_108485 ) ) ( HOLDING ?auto_108486 ) ( CLEAR ?auto_108484 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108480 ?auto_108481 ?auto_108482 ?auto_108483 ?auto_108484 ?auto_108486 )
      ( MAKE-4PILE ?auto_108480 ?auto_108481 ?auto_108482 ?auto_108483 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108488 - BLOCK
      ?auto_108489 - BLOCK
      ?auto_108490 - BLOCK
      ?auto_108491 - BLOCK
    )
    :vars
    (
      ?auto_108493 - BLOCK
      ?auto_108495 - BLOCK
      ?auto_108494 - BLOCK
      ?auto_108492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108493 ?auto_108491 ) ( ON-TABLE ?auto_108488 ) ( ON ?auto_108489 ?auto_108488 ) ( ON ?auto_108490 ?auto_108489 ) ( ON ?auto_108491 ?auto_108490 ) ( not ( = ?auto_108488 ?auto_108489 ) ) ( not ( = ?auto_108488 ?auto_108490 ) ) ( not ( = ?auto_108488 ?auto_108491 ) ) ( not ( = ?auto_108488 ?auto_108493 ) ) ( not ( = ?auto_108489 ?auto_108490 ) ) ( not ( = ?auto_108489 ?auto_108491 ) ) ( not ( = ?auto_108489 ?auto_108493 ) ) ( not ( = ?auto_108490 ?auto_108491 ) ) ( not ( = ?auto_108490 ?auto_108493 ) ) ( not ( = ?auto_108491 ?auto_108493 ) ) ( not ( = ?auto_108488 ?auto_108495 ) ) ( not ( = ?auto_108488 ?auto_108494 ) ) ( not ( = ?auto_108489 ?auto_108495 ) ) ( not ( = ?auto_108489 ?auto_108494 ) ) ( not ( = ?auto_108490 ?auto_108495 ) ) ( not ( = ?auto_108490 ?auto_108494 ) ) ( not ( = ?auto_108491 ?auto_108495 ) ) ( not ( = ?auto_108491 ?auto_108494 ) ) ( not ( = ?auto_108493 ?auto_108495 ) ) ( not ( = ?auto_108493 ?auto_108494 ) ) ( not ( = ?auto_108495 ?auto_108494 ) ) ( ON ?auto_108494 ?auto_108492 ) ( not ( = ?auto_108488 ?auto_108492 ) ) ( not ( = ?auto_108489 ?auto_108492 ) ) ( not ( = ?auto_108490 ?auto_108492 ) ) ( not ( = ?auto_108491 ?auto_108492 ) ) ( not ( = ?auto_108493 ?auto_108492 ) ) ( not ( = ?auto_108495 ?auto_108492 ) ) ( not ( = ?auto_108494 ?auto_108492 ) ) ( CLEAR ?auto_108493 ) ( ON ?auto_108495 ?auto_108494 ) ( CLEAR ?auto_108495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108492 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108492 ?auto_108494 )
      ( MAKE-4PILE ?auto_108488 ?auto_108489 ?auto_108490 ?auto_108491 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108512 - BLOCK
      ?auto_108513 - BLOCK
      ?auto_108514 - BLOCK
      ?auto_108515 - BLOCK
    )
    :vars
    (
      ?auto_108519 - BLOCK
      ?auto_108516 - BLOCK
      ?auto_108517 - BLOCK
      ?auto_108518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108512 ) ( ON ?auto_108513 ?auto_108512 ) ( ON ?auto_108514 ?auto_108513 ) ( not ( = ?auto_108512 ?auto_108513 ) ) ( not ( = ?auto_108512 ?auto_108514 ) ) ( not ( = ?auto_108512 ?auto_108515 ) ) ( not ( = ?auto_108512 ?auto_108519 ) ) ( not ( = ?auto_108513 ?auto_108514 ) ) ( not ( = ?auto_108513 ?auto_108515 ) ) ( not ( = ?auto_108513 ?auto_108519 ) ) ( not ( = ?auto_108514 ?auto_108515 ) ) ( not ( = ?auto_108514 ?auto_108519 ) ) ( not ( = ?auto_108515 ?auto_108519 ) ) ( not ( = ?auto_108512 ?auto_108516 ) ) ( not ( = ?auto_108512 ?auto_108517 ) ) ( not ( = ?auto_108513 ?auto_108516 ) ) ( not ( = ?auto_108513 ?auto_108517 ) ) ( not ( = ?auto_108514 ?auto_108516 ) ) ( not ( = ?auto_108514 ?auto_108517 ) ) ( not ( = ?auto_108515 ?auto_108516 ) ) ( not ( = ?auto_108515 ?auto_108517 ) ) ( not ( = ?auto_108519 ?auto_108516 ) ) ( not ( = ?auto_108519 ?auto_108517 ) ) ( not ( = ?auto_108516 ?auto_108517 ) ) ( ON ?auto_108517 ?auto_108518 ) ( not ( = ?auto_108512 ?auto_108518 ) ) ( not ( = ?auto_108513 ?auto_108518 ) ) ( not ( = ?auto_108514 ?auto_108518 ) ) ( not ( = ?auto_108515 ?auto_108518 ) ) ( not ( = ?auto_108519 ?auto_108518 ) ) ( not ( = ?auto_108516 ?auto_108518 ) ) ( not ( = ?auto_108517 ?auto_108518 ) ) ( ON ?auto_108516 ?auto_108517 ) ( ON-TABLE ?auto_108518 ) ( ON ?auto_108519 ?auto_108516 ) ( CLEAR ?auto_108519 ) ( HOLDING ?auto_108515 ) ( CLEAR ?auto_108514 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108512 ?auto_108513 ?auto_108514 ?auto_108515 ?auto_108519 )
      ( MAKE-4PILE ?auto_108512 ?auto_108513 ?auto_108514 ?auto_108515 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108520 - BLOCK
      ?auto_108521 - BLOCK
      ?auto_108522 - BLOCK
      ?auto_108523 - BLOCK
    )
    :vars
    (
      ?auto_108526 - BLOCK
      ?auto_108524 - BLOCK
      ?auto_108525 - BLOCK
      ?auto_108527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108520 ) ( ON ?auto_108521 ?auto_108520 ) ( ON ?auto_108522 ?auto_108521 ) ( not ( = ?auto_108520 ?auto_108521 ) ) ( not ( = ?auto_108520 ?auto_108522 ) ) ( not ( = ?auto_108520 ?auto_108523 ) ) ( not ( = ?auto_108520 ?auto_108526 ) ) ( not ( = ?auto_108521 ?auto_108522 ) ) ( not ( = ?auto_108521 ?auto_108523 ) ) ( not ( = ?auto_108521 ?auto_108526 ) ) ( not ( = ?auto_108522 ?auto_108523 ) ) ( not ( = ?auto_108522 ?auto_108526 ) ) ( not ( = ?auto_108523 ?auto_108526 ) ) ( not ( = ?auto_108520 ?auto_108524 ) ) ( not ( = ?auto_108520 ?auto_108525 ) ) ( not ( = ?auto_108521 ?auto_108524 ) ) ( not ( = ?auto_108521 ?auto_108525 ) ) ( not ( = ?auto_108522 ?auto_108524 ) ) ( not ( = ?auto_108522 ?auto_108525 ) ) ( not ( = ?auto_108523 ?auto_108524 ) ) ( not ( = ?auto_108523 ?auto_108525 ) ) ( not ( = ?auto_108526 ?auto_108524 ) ) ( not ( = ?auto_108526 ?auto_108525 ) ) ( not ( = ?auto_108524 ?auto_108525 ) ) ( ON ?auto_108525 ?auto_108527 ) ( not ( = ?auto_108520 ?auto_108527 ) ) ( not ( = ?auto_108521 ?auto_108527 ) ) ( not ( = ?auto_108522 ?auto_108527 ) ) ( not ( = ?auto_108523 ?auto_108527 ) ) ( not ( = ?auto_108526 ?auto_108527 ) ) ( not ( = ?auto_108524 ?auto_108527 ) ) ( not ( = ?auto_108525 ?auto_108527 ) ) ( ON ?auto_108524 ?auto_108525 ) ( ON-TABLE ?auto_108527 ) ( ON ?auto_108526 ?auto_108524 ) ( CLEAR ?auto_108522 ) ( ON ?auto_108523 ?auto_108526 ) ( CLEAR ?auto_108523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108527 ?auto_108525 ?auto_108524 ?auto_108526 )
      ( MAKE-4PILE ?auto_108520 ?auto_108521 ?auto_108522 ?auto_108523 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108528 - BLOCK
      ?auto_108529 - BLOCK
      ?auto_108530 - BLOCK
      ?auto_108531 - BLOCK
    )
    :vars
    (
      ?auto_108534 - BLOCK
      ?auto_108533 - BLOCK
      ?auto_108532 - BLOCK
      ?auto_108535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108528 ) ( ON ?auto_108529 ?auto_108528 ) ( not ( = ?auto_108528 ?auto_108529 ) ) ( not ( = ?auto_108528 ?auto_108530 ) ) ( not ( = ?auto_108528 ?auto_108531 ) ) ( not ( = ?auto_108528 ?auto_108534 ) ) ( not ( = ?auto_108529 ?auto_108530 ) ) ( not ( = ?auto_108529 ?auto_108531 ) ) ( not ( = ?auto_108529 ?auto_108534 ) ) ( not ( = ?auto_108530 ?auto_108531 ) ) ( not ( = ?auto_108530 ?auto_108534 ) ) ( not ( = ?auto_108531 ?auto_108534 ) ) ( not ( = ?auto_108528 ?auto_108533 ) ) ( not ( = ?auto_108528 ?auto_108532 ) ) ( not ( = ?auto_108529 ?auto_108533 ) ) ( not ( = ?auto_108529 ?auto_108532 ) ) ( not ( = ?auto_108530 ?auto_108533 ) ) ( not ( = ?auto_108530 ?auto_108532 ) ) ( not ( = ?auto_108531 ?auto_108533 ) ) ( not ( = ?auto_108531 ?auto_108532 ) ) ( not ( = ?auto_108534 ?auto_108533 ) ) ( not ( = ?auto_108534 ?auto_108532 ) ) ( not ( = ?auto_108533 ?auto_108532 ) ) ( ON ?auto_108532 ?auto_108535 ) ( not ( = ?auto_108528 ?auto_108535 ) ) ( not ( = ?auto_108529 ?auto_108535 ) ) ( not ( = ?auto_108530 ?auto_108535 ) ) ( not ( = ?auto_108531 ?auto_108535 ) ) ( not ( = ?auto_108534 ?auto_108535 ) ) ( not ( = ?auto_108533 ?auto_108535 ) ) ( not ( = ?auto_108532 ?auto_108535 ) ) ( ON ?auto_108533 ?auto_108532 ) ( ON-TABLE ?auto_108535 ) ( ON ?auto_108534 ?auto_108533 ) ( ON ?auto_108531 ?auto_108534 ) ( CLEAR ?auto_108531 ) ( HOLDING ?auto_108530 ) ( CLEAR ?auto_108529 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108528 ?auto_108529 ?auto_108530 )
      ( MAKE-4PILE ?auto_108528 ?auto_108529 ?auto_108530 ?auto_108531 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108536 - BLOCK
      ?auto_108537 - BLOCK
      ?auto_108538 - BLOCK
      ?auto_108539 - BLOCK
    )
    :vars
    (
      ?auto_108541 - BLOCK
      ?auto_108542 - BLOCK
      ?auto_108540 - BLOCK
      ?auto_108543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108536 ) ( ON ?auto_108537 ?auto_108536 ) ( not ( = ?auto_108536 ?auto_108537 ) ) ( not ( = ?auto_108536 ?auto_108538 ) ) ( not ( = ?auto_108536 ?auto_108539 ) ) ( not ( = ?auto_108536 ?auto_108541 ) ) ( not ( = ?auto_108537 ?auto_108538 ) ) ( not ( = ?auto_108537 ?auto_108539 ) ) ( not ( = ?auto_108537 ?auto_108541 ) ) ( not ( = ?auto_108538 ?auto_108539 ) ) ( not ( = ?auto_108538 ?auto_108541 ) ) ( not ( = ?auto_108539 ?auto_108541 ) ) ( not ( = ?auto_108536 ?auto_108542 ) ) ( not ( = ?auto_108536 ?auto_108540 ) ) ( not ( = ?auto_108537 ?auto_108542 ) ) ( not ( = ?auto_108537 ?auto_108540 ) ) ( not ( = ?auto_108538 ?auto_108542 ) ) ( not ( = ?auto_108538 ?auto_108540 ) ) ( not ( = ?auto_108539 ?auto_108542 ) ) ( not ( = ?auto_108539 ?auto_108540 ) ) ( not ( = ?auto_108541 ?auto_108542 ) ) ( not ( = ?auto_108541 ?auto_108540 ) ) ( not ( = ?auto_108542 ?auto_108540 ) ) ( ON ?auto_108540 ?auto_108543 ) ( not ( = ?auto_108536 ?auto_108543 ) ) ( not ( = ?auto_108537 ?auto_108543 ) ) ( not ( = ?auto_108538 ?auto_108543 ) ) ( not ( = ?auto_108539 ?auto_108543 ) ) ( not ( = ?auto_108541 ?auto_108543 ) ) ( not ( = ?auto_108542 ?auto_108543 ) ) ( not ( = ?auto_108540 ?auto_108543 ) ) ( ON ?auto_108542 ?auto_108540 ) ( ON-TABLE ?auto_108543 ) ( ON ?auto_108541 ?auto_108542 ) ( ON ?auto_108539 ?auto_108541 ) ( CLEAR ?auto_108537 ) ( ON ?auto_108538 ?auto_108539 ) ( CLEAR ?auto_108538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108543 ?auto_108540 ?auto_108542 ?auto_108541 ?auto_108539 )
      ( MAKE-4PILE ?auto_108536 ?auto_108537 ?auto_108538 ?auto_108539 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108544 - BLOCK
      ?auto_108545 - BLOCK
      ?auto_108546 - BLOCK
      ?auto_108547 - BLOCK
    )
    :vars
    (
      ?auto_108551 - BLOCK
      ?auto_108549 - BLOCK
      ?auto_108548 - BLOCK
      ?auto_108550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108544 ) ( not ( = ?auto_108544 ?auto_108545 ) ) ( not ( = ?auto_108544 ?auto_108546 ) ) ( not ( = ?auto_108544 ?auto_108547 ) ) ( not ( = ?auto_108544 ?auto_108551 ) ) ( not ( = ?auto_108545 ?auto_108546 ) ) ( not ( = ?auto_108545 ?auto_108547 ) ) ( not ( = ?auto_108545 ?auto_108551 ) ) ( not ( = ?auto_108546 ?auto_108547 ) ) ( not ( = ?auto_108546 ?auto_108551 ) ) ( not ( = ?auto_108547 ?auto_108551 ) ) ( not ( = ?auto_108544 ?auto_108549 ) ) ( not ( = ?auto_108544 ?auto_108548 ) ) ( not ( = ?auto_108545 ?auto_108549 ) ) ( not ( = ?auto_108545 ?auto_108548 ) ) ( not ( = ?auto_108546 ?auto_108549 ) ) ( not ( = ?auto_108546 ?auto_108548 ) ) ( not ( = ?auto_108547 ?auto_108549 ) ) ( not ( = ?auto_108547 ?auto_108548 ) ) ( not ( = ?auto_108551 ?auto_108549 ) ) ( not ( = ?auto_108551 ?auto_108548 ) ) ( not ( = ?auto_108549 ?auto_108548 ) ) ( ON ?auto_108548 ?auto_108550 ) ( not ( = ?auto_108544 ?auto_108550 ) ) ( not ( = ?auto_108545 ?auto_108550 ) ) ( not ( = ?auto_108546 ?auto_108550 ) ) ( not ( = ?auto_108547 ?auto_108550 ) ) ( not ( = ?auto_108551 ?auto_108550 ) ) ( not ( = ?auto_108549 ?auto_108550 ) ) ( not ( = ?auto_108548 ?auto_108550 ) ) ( ON ?auto_108549 ?auto_108548 ) ( ON-TABLE ?auto_108550 ) ( ON ?auto_108551 ?auto_108549 ) ( ON ?auto_108547 ?auto_108551 ) ( ON ?auto_108546 ?auto_108547 ) ( CLEAR ?auto_108546 ) ( HOLDING ?auto_108545 ) ( CLEAR ?auto_108544 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108544 ?auto_108545 )
      ( MAKE-4PILE ?auto_108544 ?auto_108545 ?auto_108546 ?auto_108547 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108552 - BLOCK
      ?auto_108553 - BLOCK
      ?auto_108554 - BLOCK
      ?auto_108555 - BLOCK
    )
    :vars
    (
      ?auto_108557 - BLOCK
      ?auto_108556 - BLOCK
      ?auto_108559 - BLOCK
      ?auto_108558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108552 ) ( not ( = ?auto_108552 ?auto_108553 ) ) ( not ( = ?auto_108552 ?auto_108554 ) ) ( not ( = ?auto_108552 ?auto_108555 ) ) ( not ( = ?auto_108552 ?auto_108557 ) ) ( not ( = ?auto_108553 ?auto_108554 ) ) ( not ( = ?auto_108553 ?auto_108555 ) ) ( not ( = ?auto_108553 ?auto_108557 ) ) ( not ( = ?auto_108554 ?auto_108555 ) ) ( not ( = ?auto_108554 ?auto_108557 ) ) ( not ( = ?auto_108555 ?auto_108557 ) ) ( not ( = ?auto_108552 ?auto_108556 ) ) ( not ( = ?auto_108552 ?auto_108559 ) ) ( not ( = ?auto_108553 ?auto_108556 ) ) ( not ( = ?auto_108553 ?auto_108559 ) ) ( not ( = ?auto_108554 ?auto_108556 ) ) ( not ( = ?auto_108554 ?auto_108559 ) ) ( not ( = ?auto_108555 ?auto_108556 ) ) ( not ( = ?auto_108555 ?auto_108559 ) ) ( not ( = ?auto_108557 ?auto_108556 ) ) ( not ( = ?auto_108557 ?auto_108559 ) ) ( not ( = ?auto_108556 ?auto_108559 ) ) ( ON ?auto_108559 ?auto_108558 ) ( not ( = ?auto_108552 ?auto_108558 ) ) ( not ( = ?auto_108553 ?auto_108558 ) ) ( not ( = ?auto_108554 ?auto_108558 ) ) ( not ( = ?auto_108555 ?auto_108558 ) ) ( not ( = ?auto_108557 ?auto_108558 ) ) ( not ( = ?auto_108556 ?auto_108558 ) ) ( not ( = ?auto_108559 ?auto_108558 ) ) ( ON ?auto_108556 ?auto_108559 ) ( ON-TABLE ?auto_108558 ) ( ON ?auto_108557 ?auto_108556 ) ( ON ?auto_108555 ?auto_108557 ) ( ON ?auto_108554 ?auto_108555 ) ( CLEAR ?auto_108552 ) ( ON ?auto_108553 ?auto_108554 ) ( CLEAR ?auto_108553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108558 ?auto_108559 ?auto_108556 ?auto_108557 ?auto_108555 ?auto_108554 )
      ( MAKE-4PILE ?auto_108552 ?auto_108553 ?auto_108554 ?auto_108555 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108560 - BLOCK
      ?auto_108561 - BLOCK
      ?auto_108562 - BLOCK
      ?auto_108563 - BLOCK
    )
    :vars
    (
      ?auto_108564 - BLOCK
      ?auto_108566 - BLOCK
      ?auto_108565 - BLOCK
      ?auto_108567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108560 ?auto_108561 ) ) ( not ( = ?auto_108560 ?auto_108562 ) ) ( not ( = ?auto_108560 ?auto_108563 ) ) ( not ( = ?auto_108560 ?auto_108564 ) ) ( not ( = ?auto_108561 ?auto_108562 ) ) ( not ( = ?auto_108561 ?auto_108563 ) ) ( not ( = ?auto_108561 ?auto_108564 ) ) ( not ( = ?auto_108562 ?auto_108563 ) ) ( not ( = ?auto_108562 ?auto_108564 ) ) ( not ( = ?auto_108563 ?auto_108564 ) ) ( not ( = ?auto_108560 ?auto_108566 ) ) ( not ( = ?auto_108560 ?auto_108565 ) ) ( not ( = ?auto_108561 ?auto_108566 ) ) ( not ( = ?auto_108561 ?auto_108565 ) ) ( not ( = ?auto_108562 ?auto_108566 ) ) ( not ( = ?auto_108562 ?auto_108565 ) ) ( not ( = ?auto_108563 ?auto_108566 ) ) ( not ( = ?auto_108563 ?auto_108565 ) ) ( not ( = ?auto_108564 ?auto_108566 ) ) ( not ( = ?auto_108564 ?auto_108565 ) ) ( not ( = ?auto_108566 ?auto_108565 ) ) ( ON ?auto_108565 ?auto_108567 ) ( not ( = ?auto_108560 ?auto_108567 ) ) ( not ( = ?auto_108561 ?auto_108567 ) ) ( not ( = ?auto_108562 ?auto_108567 ) ) ( not ( = ?auto_108563 ?auto_108567 ) ) ( not ( = ?auto_108564 ?auto_108567 ) ) ( not ( = ?auto_108566 ?auto_108567 ) ) ( not ( = ?auto_108565 ?auto_108567 ) ) ( ON ?auto_108566 ?auto_108565 ) ( ON-TABLE ?auto_108567 ) ( ON ?auto_108564 ?auto_108566 ) ( ON ?auto_108563 ?auto_108564 ) ( ON ?auto_108562 ?auto_108563 ) ( ON ?auto_108561 ?auto_108562 ) ( CLEAR ?auto_108561 ) ( HOLDING ?auto_108560 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108560 )
      ( MAKE-4PILE ?auto_108560 ?auto_108561 ?auto_108562 ?auto_108563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108568 - BLOCK
      ?auto_108569 - BLOCK
      ?auto_108570 - BLOCK
      ?auto_108571 - BLOCK
    )
    :vars
    (
      ?auto_108575 - BLOCK
      ?auto_108574 - BLOCK
      ?auto_108572 - BLOCK
      ?auto_108573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108568 ?auto_108569 ) ) ( not ( = ?auto_108568 ?auto_108570 ) ) ( not ( = ?auto_108568 ?auto_108571 ) ) ( not ( = ?auto_108568 ?auto_108575 ) ) ( not ( = ?auto_108569 ?auto_108570 ) ) ( not ( = ?auto_108569 ?auto_108571 ) ) ( not ( = ?auto_108569 ?auto_108575 ) ) ( not ( = ?auto_108570 ?auto_108571 ) ) ( not ( = ?auto_108570 ?auto_108575 ) ) ( not ( = ?auto_108571 ?auto_108575 ) ) ( not ( = ?auto_108568 ?auto_108574 ) ) ( not ( = ?auto_108568 ?auto_108572 ) ) ( not ( = ?auto_108569 ?auto_108574 ) ) ( not ( = ?auto_108569 ?auto_108572 ) ) ( not ( = ?auto_108570 ?auto_108574 ) ) ( not ( = ?auto_108570 ?auto_108572 ) ) ( not ( = ?auto_108571 ?auto_108574 ) ) ( not ( = ?auto_108571 ?auto_108572 ) ) ( not ( = ?auto_108575 ?auto_108574 ) ) ( not ( = ?auto_108575 ?auto_108572 ) ) ( not ( = ?auto_108574 ?auto_108572 ) ) ( ON ?auto_108572 ?auto_108573 ) ( not ( = ?auto_108568 ?auto_108573 ) ) ( not ( = ?auto_108569 ?auto_108573 ) ) ( not ( = ?auto_108570 ?auto_108573 ) ) ( not ( = ?auto_108571 ?auto_108573 ) ) ( not ( = ?auto_108575 ?auto_108573 ) ) ( not ( = ?auto_108574 ?auto_108573 ) ) ( not ( = ?auto_108572 ?auto_108573 ) ) ( ON ?auto_108574 ?auto_108572 ) ( ON-TABLE ?auto_108573 ) ( ON ?auto_108575 ?auto_108574 ) ( ON ?auto_108571 ?auto_108575 ) ( ON ?auto_108570 ?auto_108571 ) ( ON ?auto_108569 ?auto_108570 ) ( ON ?auto_108568 ?auto_108569 ) ( CLEAR ?auto_108568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108573 ?auto_108572 ?auto_108574 ?auto_108575 ?auto_108571 ?auto_108570 ?auto_108569 )
      ( MAKE-4PILE ?auto_108568 ?auto_108569 ?auto_108570 ?auto_108571 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108579 - BLOCK
      ?auto_108580 - BLOCK
      ?auto_108581 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_108581 ) ( CLEAR ?auto_108580 ) ( ON-TABLE ?auto_108579 ) ( ON ?auto_108580 ?auto_108579 ) ( not ( = ?auto_108579 ?auto_108580 ) ) ( not ( = ?auto_108579 ?auto_108581 ) ) ( not ( = ?auto_108580 ?auto_108581 ) ) )
    :subtasks
    ( ( !STACK ?auto_108581 ?auto_108580 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108582 - BLOCK
      ?auto_108583 - BLOCK
      ?auto_108584 - BLOCK
    )
    :vars
    (
      ?auto_108585 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_108583 ) ( ON-TABLE ?auto_108582 ) ( ON ?auto_108583 ?auto_108582 ) ( not ( = ?auto_108582 ?auto_108583 ) ) ( not ( = ?auto_108582 ?auto_108584 ) ) ( not ( = ?auto_108583 ?auto_108584 ) ) ( ON ?auto_108584 ?auto_108585 ) ( CLEAR ?auto_108584 ) ( HAND-EMPTY ) ( not ( = ?auto_108582 ?auto_108585 ) ) ( not ( = ?auto_108583 ?auto_108585 ) ) ( not ( = ?auto_108584 ?auto_108585 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108584 ?auto_108585 )
      ( MAKE-3PILE ?auto_108582 ?auto_108583 ?auto_108584 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108586 - BLOCK
      ?auto_108587 - BLOCK
      ?auto_108588 - BLOCK
    )
    :vars
    (
      ?auto_108589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108586 ) ( not ( = ?auto_108586 ?auto_108587 ) ) ( not ( = ?auto_108586 ?auto_108588 ) ) ( not ( = ?auto_108587 ?auto_108588 ) ) ( ON ?auto_108588 ?auto_108589 ) ( CLEAR ?auto_108588 ) ( not ( = ?auto_108586 ?auto_108589 ) ) ( not ( = ?auto_108587 ?auto_108589 ) ) ( not ( = ?auto_108588 ?auto_108589 ) ) ( HOLDING ?auto_108587 ) ( CLEAR ?auto_108586 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108586 ?auto_108587 )
      ( MAKE-3PILE ?auto_108586 ?auto_108587 ?auto_108588 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108590 - BLOCK
      ?auto_108591 - BLOCK
      ?auto_108592 - BLOCK
    )
    :vars
    (
      ?auto_108593 - BLOCK
      ?auto_108594 - BLOCK
      ?auto_108596 - BLOCK
      ?auto_108595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108590 ) ( not ( = ?auto_108590 ?auto_108591 ) ) ( not ( = ?auto_108590 ?auto_108592 ) ) ( not ( = ?auto_108591 ?auto_108592 ) ) ( ON ?auto_108592 ?auto_108593 ) ( not ( = ?auto_108590 ?auto_108593 ) ) ( not ( = ?auto_108591 ?auto_108593 ) ) ( not ( = ?auto_108592 ?auto_108593 ) ) ( CLEAR ?auto_108590 ) ( ON ?auto_108591 ?auto_108592 ) ( CLEAR ?auto_108591 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108594 ) ( ON ?auto_108596 ?auto_108594 ) ( ON ?auto_108595 ?auto_108596 ) ( ON ?auto_108593 ?auto_108595 ) ( not ( = ?auto_108594 ?auto_108596 ) ) ( not ( = ?auto_108594 ?auto_108595 ) ) ( not ( = ?auto_108594 ?auto_108593 ) ) ( not ( = ?auto_108594 ?auto_108592 ) ) ( not ( = ?auto_108594 ?auto_108591 ) ) ( not ( = ?auto_108596 ?auto_108595 ) ) ( not ( = ?auto_108596 ?auto_108593 ) ) ( not ( = ?auto_108596 ?auto_108592 ) ) ( not ( = ?auto_108596 ?auto_108591 ) ) ( not ( = ?auto_108595 ?auto_108593 ) ) ( not ( = ?auto_108595 ?auto_108592 ) ) ( not ( = ?auto_108595 ?auto_108591 ) ) ( not ( = ?auto_108590 ?auto_108594 ) ) ( not ( = ?auto_108590 ?auto_108596 ) ) ( not ( = ?auto_108590 ?auto_108595 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108594 ?auto_108596 ?auto_108595 ?auto_108593 ?auto_108592 )
      ( MAKE-3PILE ?auto_108590 ?auto_108591 ?auto_108592 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108597 - BLOCK
      ?auto_108598 - BLOCK
      ?auto_108599 - BLOCK
    )
    :vars
    (
      ?auto_108600 - BLOCK
      ?auto_108601 - BLOCK
      ?auto_108602 - BLOCK
      ?auto_108603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108597 ?auto_108598 ) ) ( not ( = ?auto_108597 ?auto_108599 ) ) ( not ( = ?auto_108598 ?auto_108599 ) ) ( ON ?auto_108599 ?auto_108600 ) ( not ( = ?auto_108597 ?auto_108600 ) ) ( not ( = ?auto_108598 ?auto_108600 ) ) ( not ( = ?auto_108599 ?auto_108600 ) ) ( ON ?auto_108598 ?auto_108599 ) ( CLEAR ?auto_108598 ) ( ON-TABLE ?auto_108601 ) ( ON ?auto_108602 ?auto_108601 ) ( ON ?auto_108603 ?auto_108602 ) ( ON ?auto_108600 ?auto_108603 ) ( not ( = ?auto_108601 ?auto_108602 ) ) ( not ( = ?auto_108601 ?auto_108603 ) ) ( not ( = ?auto_108601 ?auto_108600 ) ) ( not ( = ?auto_108601 ?auto_108599 ) ) ( not ( = ?auto_108601 ?auto_108598 ) ) ( not ( = ?auto_108602 ?auto_108603 ) ) ( not ( = ?auto_108602 ?auto_108600 ) ) ( not ( = ?auto_108602 ?auto_108599 ) ) ( not ( = ?auto_108602 ?auto_108598 ) ) ( not ( = ?auto_108603 ?auto_108600 ) ) ( not ( = ?auto_108603 ?auto_108599 ) ) ( not ( = ?auto_108603 ?auto_108598 ) ) ( not ( = ?auto_108597 ?auto_108601 ) ) ( not ( = ?auto_108597 ?auto_108602 ) ) ( not ( = ?auto_108597 ?auto_108603 ) ) ( HOLDING ?auto_108597 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108597 )
      ( MAKE-3PILE ?auto_108597 ?auto_108598 ?auto_108599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108604 - BLOCK
      ?auto_108605 - BLOCK
      ?auto_108606 - BLOCK
    )
    :vars
    (
      ?auto_108608 - BLOCK
      ?auto_108607 - BLOCK
      ?auto_108609 - BLOCK
      ?auto_108610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108604 ?auto_108605 ) ) ( not ( = ?auto_108604 ?auto_108606 ) ) ( not ( = ?auto_108605 ?auto_108606 ) ) ( ON ?auto_108606 ?auto_108608 ) ( not ( = ?auto_108604 ?auto_108608 ) ) ( not ( = ?auto_108605 ?auto_108608 ) ) ( not ( = ?auto_108606 ?auto_108608 ) ) ( ON ?auto_108605 ?auto_108606 ) ( ON-TABLE ?auto_108607 ) ( ON ?auto_108609 ?auto_108607 ) ( ON ?auto_108610 ?auto_108609 ) ( ON ?auto_108608 ?auto_108610 ) ( not ( = ?auto_108607 ?auto_108609 ) ) ( not ( = ?auto_108607 ?auto_108610 ) ) ( not ( = ?auto_108607 ?auto_108608 ) ) ( not ( = ?auto_108607 ?auto_108606 ) ) ( not ( = ?auto_108607 ?auto_108605 ) ) ( not ( = ?auto_108609 ?auto_108610 ) ) ( not ( = ?auto_108609 ?auto_108608 ) ) ( not ( = ?auto_108609 ?auto_108606 ) ) ( not ( = ?auto_108609 ?auto_108605 ) ) ( not ( = ?auto_108610 ?auto_108608 ) ) ( not ( = ?auto_108610 ?auto_108606 ) ) ( not ( = ?auto_108610 ?auto_108605 ) ) ( not ( = ?auto_108604 ?auto_108607 ) ) ( not ( = ?auto_108604 ?auto_108609 ) ) ( not ( = ?auto_108604 ?auto_108610 ) ) ( ON ?auto_108604 ?auto_108605 ) ( CLEAR ?auto_108604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108607 ?auto_108609 ?auto_108610 ?auto_108608 ?auto_108606 ?auto_108605 )
      ( MAKE-3PILE ?auto_108604 ?auto_108605 ?auto_108606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108611 - BLOCK
      ?auto_108612 - BLOCK
      ?auto_108613 - BLOCK
    )
    :vars
    (
      ?auto_108614 - BLOCK
      ?auto_108617 - BLOCK
      ?auto_108615 - BLOCK
      ?auto_108616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108611 ?auto_108612 ) ) ( not ( = ?auto_108611 ?auto_108613 ) ) ( not ( = ?auto_108612 ?auto_108613 ) ) ( ON ?auto_108613 ?auto_108614 ) ( not ( = ?auto_108611 ?auto_108614 ) ) ( not ( = ?auto_108612 ?auto_108614 ) ) ( not ( = ?auto_108613 ?auto_108614 ) ) ( ON ?auto_108612 ?auto_108613 ) ( ON-TABLE ?auto_108617 ) ( ON ?auto_108615 ?auto_108617 ) ( ON ?auto_108616 ?auto_108615 ) ( ON ?auto_108614 ?auto_108616 ) ( not ( = ?auto_108617 ?auto_108615 ) ) ( not ( = ?auto_108617 ?auto_108616 ) ) ( not ( = ?auto_108617 ?auto_108614 ) ) ( not ( = ?auto_108617 ?auto_108613 ) ) ( not ( = ?auto_108617 ?auto_108612 ) ) ( not ( = ?auto_108615 ?auto_108616 ) ) ( not ( = ?auto_108615 ?auto_108614 ) ) ( not ( = ?auto_108615 ?auto_108613 ) ) ( not ( = ?auto_108615 ?auto_108612 ) ) ( not ( = ?auto_108616 ?auto_108614 ) ) ( not ( = ?auto_108616 ?auto_108613 ) ) ( not ( = ?auto_108616 ?auto_108612 ) ) ( not ( = ?auto_108611 ?auto_108617 ) ) ( not ( = ?auto_108611 ?auto_108615 ) ) ( not ( = ?auto_108611 ?auto_108616 ) ) ( HOLDING ?auto_108611 ) ( CLEAR ?auto_108612 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108617 ?auto_108615 ?auto_108616 ?auto_108614 ?auto_108613 ?auto_108612 ?auto_108611 )
      ( MAKE-3PILE ?auto_108611 ?auto_108612 ?auto_108613 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108618 - BLOCK
      ?auto_108619 - BLOCK
      ?auto_108620 - BLOCK
    )
    :vars
    (
      ?auto_108622 - BLOCK
      ?auto_108624 - BLOCK
      ?auto_108623 - BLOCK
      ?auto_108621 - BLOCK
      ?auto_108625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108618 ?auto_108619 ) ) ( not ( = ?auto_108618 ?auto_108620 ) ) ( not ( = ?auto_108619 ?auto_108620 ) ) ( ON ?auto_108620 ?auto_108622 ) ( not ( = ?auto_108618 ?auto_108622 ) ) ( not ( = ?auto_108619 ?auto_108622 ) ) ( not ( = ?auto_108620 ?auto_108622 ) ) ( ON ?auto_108619 ?auto_108620 ) ( ON-TABLE ?auto_108624 ) ( ON ?auto_108623 ?auto_108624 ) ( ON ?auto_108621 ?auto_108623 ) ( ON ?auto_108622 ?auto_108621 ) ( not ( = ?auto_108624 ?auto_108623 ) ) ( not ( = ?auto_108624 ?auto_108621 ) ) ( not ( = ?auto_108624 ?auto_108622 ) ) ( not ( = ?auto_108624 ?auto_108620 ) ) ( not ( = ?auto_108624 ?auto_108619 ) ) ( not ( = ?auto_108623 ?auto_108621 ) ) ( not ( = ?auto_108623 ?auto_108622 ) ) ( not ( = ?auto_108623 ?auto_108620 ) ) ( not ( = ?auto_108623 ?auto_108619 ) ) ( not ( = ?auto_108621 ?auto_108622 ) ) ( not ( = ?auto_108621 ?auto_108620 ) ) ( not ( = ?auto_108621 ?auto_108619 ) ) ( not ( = ?auto_108618 ?auto_108624 ) ) ( not ( = ?auto_108618 ?auto_108623 ) ) ( not ( = ?auto_108618 ?auto_108621 ) ) ( CLEAR ?auto_108619 ) ( ON ?auto_108618 ?auto_108625 ) ( CLEAR ?auto_108618 ) ( HAND-EMPTY ) ( not ( = ?auto_108618 ?auto_108625 ) ) ( not ( = ?auto_108619 ?auto_108625 ) ) ( not ( = ?auto_108620 ?auto_108625 ) ) ( not ( = ?auto_108622 ?auto_108625 ) ) ( not ( = ?auto_108624 ?auto_108625 ) ) ( not ( = ?auto_108623 ?auto_108625 ) ) ( not ( = ?auto_108621 ?auto_108625 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108618 ?auto_108625 )
      ( MAKE-3PILE ?auto_108618 ?auto_108619 ?auto_108620 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108626 - BLOCK
      ?auto_108627 - BLOCK
      ?auto_108628 - BLOCK
    )
    :vars
    (
      ?auto_108633 - BLOCK
      ?auto_108630 - BLOCK
      ?auto_108632 - BLOCK
      ?auto_108631 - BLOCK
      ?auto_108629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108626 ?auto_108627 ) ) ( not ( = ?auto_108626 ?auto_108628 ) ) ( not ( = ?auto_108627 ?auto_108628 ) ) ( ON ?auto_108628 ?auto_108633 ) ( not ( = ?auto_108626 ?auto_108633 ) ) ( not ( = ?auto_108627 ?auto_108633 ) ) ( not ( = ?auto_108628 ?auto_108633 ) ) ( ON-TABLE ?auto_108630 ) ( ON ?auto_108632 ?auto_108630 ) ( ON ?auto_108631 ?auto_108632 ) ( ON ?auto_108633 ?auto_108631 ) ( not ( = ?auto_108630 ?auto_108632 ) ) ( not ( = ?auto_108630 ?auto_108631 ) ) ( not ( = ?auto_108630 ?auto_108633 ) ) ( not ( = ?auto_108630 ?auto_108628 ) ) ( not ( = ?auto_108630 ?auto_108627 ) ) ( not ( = ?auto_108632 ?auto_108631 ) ) ( not ( = ?auto_108632 ?auto_108633 ) ) ( not ( = ?auto_108632 ?auto_108628 ) ) ( not ( = ?auto_108632 ?auto_108627 ) ) ( not ( = ?auto_108631 ?auto_108633 ) ) ( not ( = ?auto_108631 ?auto_108628 ) ) ( not ( = ?auto_108631 ?auto_108627 ) ) ( not ( = ?auto_108626 ?auto_108630 ) ) ( not ( = ?auto_108626 ?auto_108632 ) ) ( not ( = ?auto_108626 ?auto_108631 ) ) ( ON ?auto_108626 ?auto_108629 ) ( CLEAR ?auto_108626 ) ( not ( = ?auto_108626 ?auto_108629 ) ) ( not ( = ?auto_108627 ?auto_108629 ) ) ( not ( = ?auto_108628 ?auto_108629 ) ) ( not ( = ?auto_108633 ?auto_108629 ) ) ( not ( = ?auto_108630 ?auto_108629 ) ) ( not ( = ?auto_108632 ?auto_108629 ) ) ( not ( = ?auto_108631 ?auto_108629 ) ) ( HOLDING ?auto_108627 ) ( CLEAR ?auto_108628 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108630 ?auto_108632 ?auto_108631 ?auto_108633 ?auto_108628 ?auto_108627 )
      ( MAKE-3PILE ?auto_108626 ?auto_108627 ?auto_108628 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108634 - BLOCK
      ?auto_108635 - BLOCK
      ?auto_108636 - BLOCK
    )
    :vars
    (
      ?auto_108638 - BLOCK
      ?auto_108641 - BLOCK
      ?auto_108637 - BLOCK
      ?auto_108639 - BLOCK
      ?auto_108640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108634 ?auto_108635 ) ) ( not ( = ?auto_108634 ?auto_108636 ) ) ( not ( = ?auto_108635 ?auto_108636 ) ) ( ON ?auto_108636 ?auto_108638 ) ( not ( = ?auto_108634 ?auto_108638 ) ) ( not ( = ?auto_108635 ?auto_108638 ) ) ( not ( = ?auto_108636 ?auto_108638 ) ) ( ON-TABLE ?auto_108641 ) ( ON ?auto_108637 ?auto_108641 ) ( ON ?auto_108639 ?auto_108637 ) ( ON ?auto_108638 ?auto_108639 ) ( not ( = ?auto_108641 ?auto_108637 ) ) ( not ( = ?auto_108641 ?auto_108639 ) ) ( not ( = ?auto_108641 ?auto_108638 ) ) ( not ( = ?auto_108641 ?auto_108636 ) ) ( not ( = ?auto_108641 ?auto_108635 ) ) ( not ( = ?auto_108637 ?auto_108639 ) ) ( not ( = ?auto_108637 ?auto_108638 ) ) ( not ( = ?auto_108637 ?auto_108636 ) ) ( not ( = ?auto_108637 ?auto_108635 ) ) ( not ( = ?auto_108639 ?auto_108638 ) ) ( not ( = ?auto_108639 ?auto_108636 ) ) ( not ( = ?auto_108639 ?auto_108635 ) ) ( not ( = ?auto_108634 ?auto_108641 ) ) ( not ( = ?auto_108634 ?auto_108637 ) ) ( not ( = ?auto_108634 ?auto_108639 ) ) ( ON ?auto_108634 ?auto_108640 ) ( not ( = ?auto_108634 ?auto_108640 ) ) ( not ( = ?auto_108635 ?auto_108640 ) ) ( not ( = ?auto_108636 ?auto_108640 ) ) ( not ( = ?auto_108638 ?auto_108640 ) ) ( not ( = ?auto_108641 ?auto_108640 ) ) ( not ( = ?auto_108637 ?auto_108640 ) ) ( not ( = ?auto_108639 ?auto_108640 ) ) ( CLEAR ?auto_108636 ) ( ON ?auto_108635 ?auto_108634 ) ( CLEAR ?auto_108635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108640 ?auto_108634 )
      ( MAKE-3PILE ?auto_108634 ?auto_108635 ?auto_108636 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108642 - BLOCK
      ?auto_108643 - BLOCK
      ?auto_108644 - BLOCK
    )
    :vars
    (
      ?auto_108649 - BLOCK
      ?auto_108648 - BLOCK
      ?auto_108645 - BLOCK
      ?auto_108647 - BLOCK
      ?auto_108646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108642 ?auto_108643 ) ) ( not ( = ?auto_108642 ?auto_108644 ) ) ( not ( = ?auto_108643 ?auto_108644 ) ) ( not ( = ?auto_108642 ?auto_108649 ) ) ( not ( = ?auto_108643 ?auto_108649 ) ) ( not ( = ?auto_108644 ?auto_108649 ) ) ( ON-TABLE ?auto_108648 ) ( ON ?auto_108645 ?auto_108648 ) ( ON ?auto_108647 ?auto_108645 ) ( ON ?auto_108649 ?auto_108647 ) ( not ( = ?auto_108648 ?auto_108645 ) ) ( not ( = ?auto_108648 ?auto_108647 ) ) ( not ( = ?auto_108648 ?auto_108649 ) ) ( not ( = ?auto_108648 ?auto_108644 ) ) ( not ( = ?auto_108648 ?auto_108643 ) ) ( not ( = ?auto_108645 ?auto_108647 ) ) ( not ( = ?auto_108645 ?auto_108649 ) ) ( not ( = ?auto_108645 ?auto_108644 ) ) ( not ( = ?auto_108645 ?auto_108643 ) ) ( not ( = ?auto_108647 ?auto_108649 ) ) ( not ( = ?auto_108647 ?auto_108644 ) ) ( not ( = ?auto_108647 ?auto_108643 ) ) ( not ( = ?auto_108642 ?auto_108648 ) ) ( not ( = ?auto_108642 ?auto_108645 ) ) ( not ( = ?auto_108642 ?auto_108647 ) ) ( ON ?auto_108642 ?auto_108646 ) ( not ( = ?auto_108642 ?auto_108646 ) ) ( not ( = ?auto_108643 ?auto_108646 ) ) ( not ( = ?auto_108644 ?auto_108646 ) ) ( not ( = ?auto_108649 ?auto_108646 ) ) ( not ( = ?auto_108648 ?auto_108646 ) ) ( not ( = ?auto_108645 ?auto_108646 ) ) ( not ( = ?auto_108647 ?auto_108646 ) ) ( ON ?auto_108643 ?auto_108642 ) ( CLEAR ?auto_108643 ) ( ON-TABLE ?auto_108646 ) ( HOLDING ?auto_108644 ) ( CLEAR ?auto_108649 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108648 ?auto_108645 ?auto_108647 ?auto_108649 ?auto_108644 )
      ( MAKE-3PILE ?auto_108642 ?auto_108643 ?auto_108644 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108650 - BLOCK
      ?auto_108651 - BLOCK
      ?auto_108652 - BLOCK
    )
    :vars
    (
      ?auto_108653 - BLOCK
      ?auto_108656 - BLOCK
      ?auto_108654 - BLOCK
      ?auto_108657 - BLOCK
      ?auto_108655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108650 ?auto_108651 ) ) ( not ( = ?auto_108650 ?auto_108652 ) ) ( not ( = ?auto_108651 ?auto_108652 ) ) ( not ( = ?auto_108650 ?auto_108653 ) ) ( not ( = ?auto_108651 ?auto_108653 ) ) ( not ( = ?auto_108652 ?auto_108653 ) ) ( ON-TABLE ?auto_108656 ) ( ON ?auto_108654 ?auto_108656 ) ( ON ?auto_108657 ?auto_108654 ) ( ON ?auto_108653 ?auto_108657 ) ( not ( = ?auto_108656 ?auto_108654 ) ) ( not ( = ?auto_108656 ?auto_108657 ) ) ( not ( = ?auto_108656 ?auto_108653 ) ) ( not ( = ?auto_108656 ?auto_108652 ) ) ( not ( = ?auto_108656 ?auto_108651 ) ) ( not ( = ?auto_108654 ?auto_108657 ) ) ( not ( = ?auto_108654 ?auto_108653 ) ) ( not ( = ?auto_108654 ?auto_108652 ) ) ( not ( = ?auto_108654 ?auto_108651 ) ) ( not ( = ?auto_108657 ?auto_108653 ) ) ( not ( = ?auto_108657 ?auto_108652 ) ) ( not ( = ?auto_108657 ?auto_108651 ) ) ( not ( = ?auto_108650 ?auto_108656 ) ) ( not ( = ?auto_108650 ?auto_108654 ) ) ( not ( = ?auto_108650 ?auto_108657 ) ) ( ON ?auto_108650 ?auto_108655 ) ( not ( = ?auto_108650 ?auto_108655 ) ) ( not ( = ?auto_108651 ?auto_108655 ) ) ( not ( = ?auto_108652 ?auto_108655 ) ) ( not ( = ?auto_108653 ?auto_108655 ) ) ( not ( = ?auto_108656 ?auto_108655 ) ) ( not ( = ?auto_108654 ?auto_108655 ) ) ( not ( = ?auto_108657 ?auto_108655 ) ) ( ON ?auto_108651 ?auto_108650 ) ( ON-TABLE ?auto_108655 ) ( CLEAR ?auto_108653 ) ( ON ?auto_108652 ?auto_108651 ) ( CLEAR ?auto_108652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108655 ?auto_108650 ?auto_108651 )
      ( MAKE-3PILE ?auto_108650 ?auto_108651 ?auto_108652 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108658 - BLOCK
      ?auto_108659 - BLOCK
      ?auto_108660 - BLOCK
    )
    :vars
    (
      ?auto_108662 - BLOCK
      ?auto_108664 - BLOCK
      ?auto_108665 - BLOCK
      ?auto_108663 - BLOCK
      ?auto_108661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108658 ?auto_108659 ) ) ( not ( = ?auto_108658 ?auto_108660 ) ) ( not ( = ?auto_108659 ?auto_108660 ) ) ( not ( = ?auto_108658 ?auto_108662 ) ) ( not ( = ?auto_108659 ?auto_108662 ) ) ( not ( = ?auto_108660 ?auto_108662 ) ) ( ON-TABLE ?auto_108664 ) ( ON ?auto_108665 ?auto_108664 ) ( ON ?auto_108663 ?auto_108665 ) ( not ( = ?auto_108664 ?auto_108665 ) ) ( not ( = ?auto_108664 ?auto_108663 ) ) ( not ( = ?auto_108664 ?auto_108662 ) ) ( not ( = ?auto_108664 ?auto_108660 ) ) ( not ( = ?auto_108664 ?auto_108659 ) ) ( not ( = ?auto_108665 ?auto_108663 ) ) ( not ( = ?auto_108665 ?auto_108662 ) ) ( not ( = ?auto_108665 ?auto_108660 ) ) ( not ( = ?auto_108665 ?auto_108659 ) ) ( not ( = ?auto_108663 ?auto_108662 ) ) ( not ( = ?auto_108663 ?auto_108660 ) ) ( not ( = ?auto_108663 ?auto_108659 ) ) ( not ( = ?auto_108658 ?auto_108664 ) ) ( not ( = ?auto_108658 ?auto_108665 ) ) ( not ( = ?auto_108658 ?auto_108663 ) ) ( ON ?auto_108658 ?auto_108661 ) ( not ( = ?auto_108658 ?auto_108661 ) ) ( not ( = ?auto_108659 ?auto_108661 ) ) ( not ( = ?auto_108660 ?auto_108661 ) ) ( not ( = ?auto_108662 ?auto_108661 ) ) ( not ( = ?auto_108664 ?auto_108661 ) ) ( not ( = ?auto_108665 ?auto_108661 ) ) ( not ( = ?auto_108663 ?auto_108661 ) ) ( ON ?auto_108659 ?auto_108658 ) ( ON-TABLE ?auto_108661 ) ( ON ?auto_108660 ?auto_108659 ) ( CLEAR ?auto_108660 ) ( HOLDING ?auto_108662 ) ( CLEAR ?auto_108663 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108664 ?auto_108665 ?auto_108663 ?auto_108662 )
      ( MAKE-3PILE ?auto_108658 ?auto_108659 ?auto_108660 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108666 - BLOCK
      ?auto_108667 - BLOCK
      ?auto_108668 - BLOCK
    )
    :vars
    (
      ?auto_108670 - BLOCK
      ?auto_108673 - BLOCK
      ?auto_108669 - BLOCK
      ?auto_108672 - BLOCK
      ?auto_108671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108666 ?auto_108667 ) ) ( not ( = ?auto_108666 ?auto_108668 ) ) ( not ( = ?auto_108667 ?auto_108668 ) ) ( not ( = ?auto_108666 ?auto_108670 ) ) ( not ( = ?auto_108667 ?auto_108670 ) ) ( not ( = ?auto_108668 ?auto_108670 ) ) ( ON-TABLE ?auto_108673 ) ( ON ?auto_108669 ?auto_108673 ) ( ON ?auto_108672 ?auto_108669 ) ( not ( = ?auto_108673 ?auto_108669 ) ) ( not ( = ?auto_108673 ?auto_108672 ) ) ( not ( = ?auto_108673 ?auto_108670 ) ) ( not ( = ?auto_108673 ?auto_108668 ) ) ( not ( = ?auto_108673 ?auto_108667 ) ) ( not ( = ?auto_108669 ?auto_108672 ) ) ( not ( = ?auto_108669 ?auto_108670 ) ) ( not ( = ?auto_108669 ?auto_108668 ) ) ( not ( = ?auto_108669 ?auto_108667 ) ) ( not ( = ?auto_108672 ?auto_108670 ) ) ( not ( = ?auto_108672 ?auto_108668 ) ) ( not ( = ?auto_108672 ?auto_108667 ) ) ( not ( = ?auto_108666 ?auto_108673 ) ) ( not ( = ?auto_108666 ?auto_108669 ) ) ( not ( = ?auto_108666 ?auto_108672 ) ) ( ON ?auto_108666 ?auto_108671 ) ( not ( = ?auto_108666 ?auto_108671 ) ) ( not ( = ?auto_108667 ?auto_108671 ) ) ( not ( = ?auto_108668 ?auto_108671 ) ) ( not ( = ?auto_108670 ?auto_108671 ) ) ( not ( = ?auto_108673 ?auto_108671 ) ) ( not ( = ?auto_108669 ?auto_108671 ) ) ( not ( = ?auto_108672 ?auto_108671 ) ) ( ON ?auto_108667 ?auto_108666 ) ( ON-TABLE ?auto_108671 ) ( ON ?auto_108668 ?auto_108667 ) ( CLEAR ?auto_108672 ) ( ON ?auto_108670 ?auto_108668 ) ( CLEAR ?auto_108670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108671 ?auto_108666 ?auto_108667 ?auto_108668 )
      ( MAKE-3PILE ?auto_108666 ?auto_108667 ?auto_108668 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108674 - BLOCK
      ?auto_108675 - BLOCK
      ?auto_108676 - BLOCK
    )
    :vars
    (
      ?auto_108679 - BLOCK
      ?auto_108680 - BLOCK
      ?auto_108678 - BLOCK
      ?auto_108681 - BLOCK
      ?auto_108677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108674 ?auto_108675 ) ) ( not ( = ?auto_108674 ?auto_108676 ) ) ( not ( = ?auto_108675 ?auto_108676 ) ) ( not ( = ?auto_108674 ?auto_108679 ) ) ( not ( = ?auto_108675 ?auto_108679 ) ) ( not ( = ?auto_108676 ?auto_108679 ) ) ( ON-TABLE ?auto_108680 ) ( ON ?auto_108678 ?auto_108680 ) ( not ( = ?auto_108680 ?auto_108678 ) ) ( not ( = ?auto_108680 ?auto_108681 ) ) ( not ( = ?auto_108680 ?auto_108679 ) ) ( not ( = ?auto_108680 ?auto_108676 ) ) ( not ( = ?auto_108680 ?auto_108675 ) ) ( not ( = ?auto_108678 ?auto_108681 ) ) ( not ( = ?auto_108678 ?auto_108679 ) ) ( not ( = ?auto_108678 ?auto_108676 ) ) ( not ( = ?auto_108678 ?auto_108675 ) ) ( not ( = ?auto_108681 ?auto_108679 ) ) ( not ( = ?auto_108681 ?auto_108676 ) ) ( not ( = ?auto_108681 ?auto_108675 ) ) ( not ( = ?auto_108674 ?auto_108680 ) ) ( not ( = ?auto_108674 ?auto_108678 ) ) ( not ( = ?auto_108674 ?auto_108681 ) ) ( ON ?auto_108674 ?auto_108677 ) ( not ( = ?auto_108674 ?auto_108677 ) ) ( not ( = ?auto_108675 ?auto_108677 ) ) ( not ( = ?auto_108676 ?auto_108677 ) ) ( not ( = ?auto_108679 ?auto_108677 ) ) ( not ( = ?auto_108680 ?auto_108677 ) ) ( not ( = ?auto_108678 ?auto_108677 ) ) ( not ( = ?auto_108681 ?auto_108677 ) ) ( ON ?auto_108675 ?auto_108674 ) ( ON-TABLE ?auto_108677 ) ( ON ?auto_108676 ?auto_108675 ) ( ON ?auto_108679 ?auto_108676 ) ( CLEAR ?auto_108679 ) ( HOLDING ?auto_108681 ) ( CLEAR ?auto_108678 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108680 ?auto_108678 ?auto_108681 )
      ( MAKE-3PILE ?auto_108674 ?auto_108675 ?auto_108676 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108682 - BLOCK
      ?auto_108683 - BLOCK
      ?auto_108684 - BLOCK
    )
    :vars
    (
      ?auto_108688 - BLOCK
      ?auto_108687 - BLOCK
      ?auto_108685 - BLOCK
      ?auto_108689 - BLOCK
      ?auto_108686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108682 ?auto_108683 ) ) ( not ( = ?auto_108682 ?auto_108684 ) ) ( not ( = ?auto_108683 ?auto_108684 ) ) ( not ( = ?auto_108682 ?auto_108688 ) ) ( not ( = ?auto_108683 ?auto_108688 ) ) ( not ( = ?auto_108684 ?auto_108688 ) ) ( ON-TABLE ?auto_108687 ) ( ON ?auto_108685 ?auto_108687 ) ( not ( = ?auto_108687 ?auto_108685 ) ) ( not ( = ?auto_108687 ?auto_108689 ) ) ( not ( = ?auto_108687 ?auto_108688 ) ) ( not ( = ?auto_108687 ?auto_108684 ) ) ( not ( = ?auto_108687 ?auto_108683 ) ) ( not ( = ?auto_108685 ?auto_108689 ) ) ( not ( = ?auto_108685 ?auto_108688 ) ) ( not ( = ?auto_108685 ?auto_108684 ) ) ( not ( = ?auto_108685 ?auto_108683 ) ) ( not ( = ?auto_108689 ?auto_108688 ) ) ( not ( = ?auto_108689 ?auto_108684 ) ) ( not ( = ?auto_108689 ?auto_108683 ) ) ( not ( = ?auto_108682 ?auto_108687 ) ) ( not ( = ?auto_108682 ?auto_108685 ) ) ( not ( = ?auto_108682 ?auto_108689 ) ) ( ON ?auto_108682 ?auto_108686 ) ( not ( = ?auto_108682 ?auto_108686 ) ) ( not ( = ?auto_108683 ?auto_108686 ) ) ( not ( = ?auto_108684 ?auto_108686 ) ) ( not ( = ?auto_108688 ?auto_108686 ) ) ( not ( = ?auto_108687 ?auto_108686 ) ) ( not ( = ?auto_108685 ?auto_108686 ) ) ( not ( = ?auto_108689 ?auto_108686 ) ) ( ON ?auto_108683 ?auto_108682 ) ( ON-TABLE ?auto_108686 ) ( ON ?auto_108684 ?auto_108683 ) ( ON ?auto_108688 ?auto_108684 ) ( CLEAR ?auto_108685 ) ( ON ?auto_108689 ?auto_108688 ) ( CLEAR ?auto_108689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108686 ?auto_108682 ?auto_108683 ?auto_108684 ?auto_108688 )
      ( MAKE-3PILE ?auto_108682 ?auto_108683 ?auto_108684 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108690 - BLOCK
      ?auto_108691 - BLOCK
      ?auto_108692 - BLOCK
    )
    :vars
    (
      ?auto_108694 - BLOCK
      ?auto_108696 - BLOCK
      ?auto_108693 - BLOCK
      ?auto_108697 - BLOCK
      ?auto_108695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108690 ?auto_108691 ) ) ( not ( = ?auto_108690 ?auto_108692 ) ) ( not ( = ?auto_108691 ?auto_108692 ) ) ( not ( = ?auto_108690 ?auto_108694 ) ) ( not ( = ?auto_108691 ?auto_108694 ) ) ( not ( = ?auto_108692 ?auto_108694 ) ) ( ON-TABLE ?auto_108696 ) ( not ( = ?auto_108696 ?auto_108693 ) ) ( not ( = ?auto_108696 ?auto_108697 ) ) ( not ( = ?auto_108696 ?auto_108694 ) ) ( not ( = ?auto_108696 ?auto_108692 ) ) ( not ( = ?auto_108696 ?auto_108691 ) ) ( not ( = ?auto_108693 ?auto_108697 ) ) ( not ( = ?auto_108693 ?auto_108694 ) ) ( not ( = ?auto_108693 ?auto_108692 ) ) ( not ( = ?auto_108693 ?auto_108691 ) ) ( not ( = ?auto_108697 ?auto_108694 ) ) ( not ( = ?auto_108697 ?auto_108692 ) ) ( not ( = ?auto_108697 ?auto_108691 ) ) ( not ( = ?auto_108690 ?auto_108696 ) ) ( not ( = ?auto_108690 ?auto_108693 ) ) ( not ( = ?auto_108690 ?auto_108697 ) ) ( ON ?auto_108690 ?auto_108695 ) ( not ( = ?auto_108690 ?auto_108695 ) ) ( not ( = ?auto_108691 ?auto_108695 ) ) ( not ( = ?auto_108692 ?auto_108695 ) ) ( not ( = ?auto_108694 ?auto_108695 ) ) ( not ( = ?auto_108696 ?auto_108695 ) ) ( not ( = ?auto_108693 ?auto_108695 ) ) ( not ( = ?auto_108697 ?auto_108695 ) ) ( ON ?auto_108691 ?auto_108690 ) ( ON-TABLE ?auto_108695 ) ( ON ?auto_108692 ?auto_108691 ) ( ON ?auto_108694 ?auto_108692 ) ( ON ?auto_108697 ?auto_108694 ) ( CLEAR ?auto_108697 ) ( HOLDING ?auto_108693 ) ( CLEAR ?auto_108696 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108696 ?auto_108693 )
      ( MAKE-3PILE ?auto_108690 ?auto_108691 ?auto_108692 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108698 - BLOCK
      ?auto_108699 - BLOCK
      ?auto_108700 - BLOCK
    )
    :vars
    (
      ?auto_108703 - BLOCK
      ?auto_108705 - BLOCK
      ?auto_108702 - BLOCK
      ?auto_108701 - BLOCK
      ?auto_108704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108698 ?auto_108699 ) ) ( not ( = ?auto_108698 ?auto_108700 ) ) ( not ( = ?auto_108699 ?auto_108700 ) ) ( not ( = ?auto_108698 ?auto_108703 ) ) ( not ( = ?auto_108699 ?auto_108703 ) ) ( not ( = ?auto_108700 ?auto_108703 ) ) ( ON-TABLE ?auto_108705 ) ( not ( = ?auto_108705 ?auto_108702 ) ) ( not ( = ?auto_108705 ?auto_108701 ) ) ( not ( = ?auto_108705 ?auto_108703 ) ) ( not ( = ?auto_108705 ?auto_108700 ) ) ( not ( = ?auto_108705 ?auto_108699 ) ) ( not ( = ?auto_108702 ?auto_108701 ) ) ( not ( = ?auto_108702 ?auto_108703 ) ) ( not ( = ?auto_108702 ?auto_108700 ) ) ( not ( = ?auto_108702 ?auto_108699 ) ) ( not ( = ?auto_108701 ?auto_108703 ) ) ( not ( = ?auto_108701 ?auto_108700 ) ) ( not ( = ?auto_108701 ?auto_108699 ) ) ( not ( = ?auto_108698 ?auto_108705 ) ) ( not ( = ?auto_108698 ?auto_108702 ) ) ( not ( = ?auto_108698 ?auto_108701 ) ) ( ON ?auto_108698 ?auto_108704 ) ( not ( = ?auto_108698 ?auto_108704 ) ) ( not ( = ?auto_108699 ?auto_108704 ) ) ( not ( = ?auto_108700 ?auto_108704 ) ) ( not ( = ?auto_108703 ?auto_108704 ) ) ( not ( = ?auto_108705 ?auto_108704 ) ) ( not ( = ?auto_108702 ?auto_108704 ) ) ( not ( = ?auto_108701 ?auto_108704 ) ) ( ON ?auto_108699 ?auto_108698 ) ( ON-TABLE ?auto_108704 ) ( ON ?auto_108700 ?auto_108699 ) ( ON ?auto_108703 ?auto_108700 ) ( ON ?auto_108701 ?auto_108703 ) ( CLEAR ?auto_108705 ) ( ON ?auto_108702 ?auto_108701 ) ( CLEAR ?auto_108702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108704 ?auto_108698 ?auto_108699 ?auto_108700 ?auto_108703 ?auto_108701 )
      ( MAKE-3PILE ?auto_108698 ?auto_108699 ?auto_108700 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108706 - BLOCK
      ?auto_108707 - BLOCK
      ?auto_108708 - BLOCK
    )
    :vars
    (
      ?auto_108709 - BLOCK
      ?auto_108712 - BLOCK
      ?auto_108710 - BLOCK
      ?auto_108713 - BLOCK
      ?auto_108711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108706 ?auto_108707 ) ) ( not ( = ?auto_108706 ?auto_108708 ) ) ( not ( = ?auto_108707 ?auto_108708 ) ) ( not ( = ?auto_108706 ?auto_108709 ) ) ( not ( = ?auto_108707 ?auto_108709 ) ) ( not ( = ?auto_108708 ?auto_108709 ) ) ( not ( = ?auto_108712 ?auto_108710 ) ) ( not ( = ?auto_108712 ?auto_108713 ) ) ( not ( = ?auto_108712 ?auto_108709 ) ) ( not ( = ?auto_108712 ?auto_108708 ) ) ( not ( = ?auto_108712 ?auto_108707 ) ) ( not ( = ?auto_108710 ?auto_108713 ) ) ( not ( = ?auto_108710 ?auto_108709 ) ) ( not ( = ?auto_108710 ?auto_108708 ) ) ( not ( = ?auto_108710 ?auto_108707 ) ) ( not ( = ?auto_108713 ?auto_108709 ) ) ( not ( = ?auto_108713 ?auto_108708 ) ) ( not ( = ?auto_108713 ?auto_108707 ) ) ( not ( = ?auto_108706 ?auto_108712 ) ) ( not ( = ?auto_108706 ?auto_108710 ) ) ( not ( = ?auto_108706 ?auto_108713 ) ) ( ON ?auto_108706 ?auto_108711 ) ( not ( = ?auto_108706 ?auto_108711 ) ) ( not ( = ?auto_108707 ?auto_108711 ) ) ( not ( = ?auto_108708 ?auto_108711 ) ) ( not ( = ?auto_108709 ?auto_108711 ) ) ( not ( = ?auto_108712 ?auto_108711 ) ) ( not ( = ?auto_108710 ?auto_108711 ) ) ( not ( = ?auto_108713 ?auto_108711 ) ) ( ON ?auto_108707 ?auto_108706 ) ( ON-TABLE ?auto_108711 ) ( ON ?auto_108708 ?auto_108707 ) ( ON ?auto_108709 ?auto_108708 ) ( ON ?auto_108713 ?auto_108709 ) ( ON ?auto_108710 ?auto_108713 ) ( CLEAR ?auto_108710 ) ( HOLDING ?auto_108712 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108712 )
      ( MAKE-3PILE ?auto_108706 ?auto_108707 ?auto_108708 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108714 - BLOCK
      ?auto_108715 - BLOCK
      ?auto_108716 - BLOCK
    )
    :vars
    (
      ?auto_108719 - BLOCK
      ?auto_108718 - BLOCK
      ?auto_108717 - BLOCK
      ?auto_108721 - BLOCK
      ?auto_108720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108714 ?auto_108715 ) ) ( not ( = ?auto_108714 ?auto_108716 ) ) ( not ( = ?auto_108715 ?auto_108716 ) ) ( not ( = ?auto_108714 ?auto_108719 ) ) ( not ( = ?auto_108715 ?auto_108719 ) ) ( not ( = ?auto_108716 ?auto_108719 ) ) ( not ( = ?auto_108718 ?auto_108717 ) ) ( not ( = ?auto_108718 ?auto_108721 ) ) ( not ( = ?auto_108718 ?auto_108719 ) ) ( not ( = ?auto_108718 ?auto_108716 ) ) ( not ( = ?auto_108718 ?auto_108715 ) ) ( not ( = ?auto_108717 ?auto_108721 ) ) ( not ( = ?auto_108717 ?auto_108719 ) ) ( not ( = ?auto_108717 ?auto_108716 ) ) ( not ( = ?auto_108717 ?auto_108715 ) ) ( not ( = ?auto_108721 ?auto_108719 ) ) ( not ( = ?auto_108721 ?auto_108716 ) ) ( not ( = ?auto_108721 ?auto_108715 ) ) ( not ( = ?auto_108714 ?auto_108718 ) ) ( not ( = ?auto_108714 ?auto_108717 ) ) ( not ( = ?auto_108714 ?auto_108721 ) ) ( ON ?auto_108714 ?auto_108720 ) ( not ( = ?auto_108714 ?auto_108720 ) ) ( not ( = ?auto_108715 ?auto_108720 ) ) ( not ( = ?auto_108716 ?auto_108720 ) ) ( not ( = ?auto_108719 ?auto_108720 ) ) ( not ( = ?auto_108718 ?auto_108720 ) ) ( not ( = ?auto_108717 ?auto_108720 ) ) ( not ( = ?auto_108721 ?auto_108720 ) ) ( ON ?auto_108715 ?auto_108714 ) ( ON-TABLE ?auto_108720 ) ( ON ?auto_108716 ?auto_108715 ) ( ON ?auto_108719 ?auto_108716 ) ( ON ?auto_108721 ?auto_108719 ) ( ON ?auto_108717 ?auto_108721 ) ( ON ?auto_108718 ?auto_108717 ) ( CLEAR ?auto_108718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108720 ?auto_108714 ?auto_108715 ?auto_108716 ?auto_108719 ?auto_108721 ?auto_108717 )
      ( MAKE-3PILE ?auto_108714 ?auto_108715 ?auto_108716 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108725 - BLOCK
      ?auto_108726 - BLOCK
      ?auto_108727 - BLOCK
    )
    :vars
    (
      ?auto_108728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108728 ?auto_108727 ) ( CLEAR ?auto_108728 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108725 ) ( ON ?auto_108726 ?auto_108725 ) ( ON ?auto_108727 ?auto_108726 ) ( not ( = ?auto_108725 ?auto_108726 ) ) ( not ( = ?auto_108725 ?auto_108727 ) ) ( not ( = ?auto_108725 ?auto_108728 ) ) ( not ( = ?auto_108726 ?auto_108727 ) ) ( not ( = ?auto_108726 ?auto_108728 ) ) ( not ( = ?auto_108727 ?auto_108728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108728 ?auto_108727 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108729 - BLOCK
      ?auto_108730 - BLOCK
      ?auto_108731 - BLOCK
    )
    :vars
    (
      ?auto_108732 - BLOCK
      ?auto_108733 - BLOCK
      ?auto_108734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108732 ?auto_108731 ) ( CLEAR ?auto_108732 ) ( ON-TABLE ?auto_108729 ) ( ON ?auto_108730 ?auto_108729 ) ( ON ?auto_108731 ?auto_108730 ) ( not ( = ?auto_108729 ?auto_108730 ) ) ( not ( = ?auto_108729 ?auto_108731 ) ) ( not ( = ?auto_108729 ?auto_108732 ) ) ( not ( = ?auto_108730 ?auto_108731 ) ) ( not ( = ?auto_108730 ?auto_108732 ) ) ( not ( = ?auto_108731 ?auto_108732 ) ) ( HOLDING ?auto_108733 ) ( CLEAR ?auto_108734 ) ( not ( = ?auto_108729 ?auto_108733 ) ) ( not ( = ?auto_108729 ?auto_108734 ) ) ( not ( = ?auto_108730 ?auto_108733 ) ) ( not ( = ?auto_108730 ?auto_108734 ) ) ( not ( = ?auto_108731 ?auto_108733 ) ) ( not ( = ?auto_108731 ?auto_108734 ) ) ( not ( = ?auto_108732 ?auto_108733 ) ) ( not ( = ?auto_108732 ?auto_108734 ) ) ( not ( = ?auto_108733 ?auto_108734 ) ) )
    :subtasks
    ( ( !STACK ?auto_108733 ?auto_108734 )
      ( MAKE-3PILE ?auto_108729 ?auto_108730 ?auto_108731 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108735 - BLOCK
      ?auto_108736 - BLOCK
      ?auto_108737 - BLOCK
    )
    :vars
    (
      ?auto_108738 - BLOCK
      ?auto_108739 - BLOCK
      ?auto_108740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108738 ?auto_108737 ) ( ON-TABLE ?auto_108735 ) ( ON ?auto_108736 ?auto_108735 ) ( ON ?auto_108737 ?auto_108736 ) ( not ( = ?auto_108735 ?auto_108736 ) ) ( not ( = ?auto_108735 ?auto_108737 ) ) ( not ( = ?auto_108735 ?auto_108738 ) ) ( not ( = ?auto_108736 ?auto_108737 ) ) ( not ( = ?auto_108736 ?auto_108738 ) ) ( not ( = ?auto_108737 ?auto_108738 ) ) ( CLEAR ?auto_108739 ) ( not ( = ?auto_108735 ?auto_108740 ) ) ( not ( = ?auto_108735 ?auto_108739 ) ) ( not ( = ?auto_108736 ?auto_108740 ) ) ( not ( = ?auto_108736 ?auto_108739 ) ) ( not ( = ?auto_108737 ?auto_108740 ) ) ( not ( = ?auto_108737 ?auto_108739 ) ) ( not ( = ?auto_108738 ?auto_108740 ) ) ( not ( = ?auto_108738 ?auto_108739 ) ) ( not ( = ?auto_108740 ?auto_108739 ) ) ( ON ?auto_108740 ?auto_108738 ) ( CLEAR ?auto_108740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108735 ?auto_108736 ?auto_108737 ?auto_108738 )
      ( MAKE-3PILE ?auto_108735 ?auto_108736 ?auto_108737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108741 - BLOCK
      ?auto_108742 - BLOCK
      ?auto_108743 - BLOCK
    )
    :vars
    (
      ?auto_108745 - BLOCK
      ?auto_108744 - BLOCK
      ?auto_108746 - BLOCK
      ?auto_108747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108745 ?auto_108743 ) ( ON-TABLE ?auto_108741 ) ( ON ?auto_108742 ?auto_108741 ) ( ON ?auto_108743 ?auto_108742 ) ( not ( = ?auto_108741 ?auto_108742 ) ) ( not ( = ?auto_108741 ?auto_108743 ) ) ( not ( = ?auto_108741 ?auto_108745 ) ) ( not ( = ?auto_108742 ?auto_108743 ) ) ( not ( = ?auto_108742 ?auto_108745 ) ) ( not ( = ?auto_108743 ?auto_108745 ) ) ( not ( = ?auto_108741 ?auto_108744 ) ) ( not ( = ?auto_108741 ?auto_108746 ) ) ( not ( = ?auto_108742 ?auto_108744 ) ) ( not ( = ?auto_108742 ?auto_108746 ) ) ( not ( = ?auto_108743 ?auto_108744 ) ) ( not ( = ?auto_108743 ?auto_108746 ) ) ( not ( = ?auto_108745 ?auto_108744 ) ) ( not ( = ?auto_108745 ?auto_108746 ) ) ( not ( = ?auto_108744 ?auto_108746 ) ) ( ON ?auto_108744 ?auto_108745 ) ( CLEAR ?auto_108744 ) ( HOLDING ?auto_108746 ) ( CLEAR ?auto_108747 ) ( ON-TABLE ?auto_108747 ) ( not ( = ?auto_108747 ?auto_108746 ) ) ( not ( = ?auto_108741 ?auto_108747 ) ) ( not ( = ?auto_108742 ?auto_108747 ) ) ( not ( = ?auto_108743 ?auto_108747 ) ) ( not ( = ?auto_108745 ?auto_108747 ) ) ( not ( = ?auto_108744 ?auto_108747 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108747 ?auto_108746 )
      ( MAKE-3PILE ?auto_108741 ?auto_108742 ?auto_108743 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108748 - BLOCK
      ?auto_108749 - BLOCK
      ?auto_108750 - BLOCK
    )
    :vars
    (
      ?auto_108753 - BLOCK
      ?auto_108754 - BLOCK
      ?auto_108752 - BLOCK
      ?auto_108751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108753 ?auto_108750 ) ( ON-TABLE ?auto_108748 ) ( ON ?auto_108749 ?auto_108748 ) ( ON ?auto_108750 ?auto_108749 ) ( not ( = ?auto_108748 ?auto_108749 ) ) ( not ( = ?auto_108748 ?auto_108750 ) ) ( not ( = ?auto_108748 ?auto_108753 ) ) ( not ( = ?auto_108749 ?auto_108750 ) ) ( not ( = ?auto_108749 ?auto_108753 ) ) ( not ( = ?auto_108750 ?auto_108753 ) ) ( not ( = ?auto_108748 ?auto_108754 ) ) ( not ( = ?auto_108748 ?auto_108752 ) ) ( not ( = ?auto_108749 ?auto_108754 ) ) ( not ( = ?auto_108749 ?auto_108752 ) ) ( not ( = ?auto_108750 ?auto_108754 ) ) ( not ( = ?auto_108750 ?auto_108752 ) ) ( not ( = ?auto_108753 ?auto_108754 ) ) ( not ( = ?auto_108753 ?auto_108752 ) ) ( not ( = ?auto_108754 ?auto_108752 ) ) ( ON ?auto_108754 ?auto_108753 ) ( CLEAR ?auto_108751 ) ( ON-TABLE ?auto_108751 ) ( not ( = ?auto_108751 ?auto_108752 ) ) ( not ( = ?auto_108748 ?auto_108751 ) ) ( not ( = ?auto_108749 ?auto_108751 ) ) ( not ( = ?auto_108750 ?auto_108751 ) ) ( not ( = ?auto_108753 ?auto_108751 ) ) ( not ( = ?auto_108754 ?auto_108751 ) ) ( ON ?auto_108752 ?auto_108754 ) ( CLEAR ?auto_108752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108748 ?auto_108749 ?auto_108750 ?auto_108753 ?auto_108754 )
      ( MAKE-3PILE ?auto_108748 ?auto_108749 ?auto_108750 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108755 - BLOCK
      ?auto_108756 - BLOCK
      ?auto_108757 - BLOCK
    )
    :vars
    (
      ?auto_108759 - BLOCK
      ?auto_108760 - BLOCK
      ?auto_108761 - BLOCK
      ?auto_108758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108759 ?auto_108757 ) ( ON-TABLE ?auto_108755 ) ( ON ?auto_108756 ?auto_108755 ) ( ON ?auto_108757 ?auto_108756 ) ( not ( = ?auto_108755 ?auto_108756 ) ) ( not ( = ?auto_108755 ?auto_108757 ) ) ( not ( = ?auto_108755 ?auto_108759 ) ) ( not ( = ?auto_108756 ?auto_108757 ) ) ( not ( = ?auto_108756 ?auto_108759 ) ) ( not ( = ?auto_108757 ?auto_108759 ) ) ( not ( = ?auto_108755 ?auto_108760 ) ) ( not ( = ?auto_108755 ?auto_108761 ) ) ( not ( = ?auto_108756 ?auto_108760 ) ) ( not ( = ?auto_108756 ?auto_108761 ) ) ( not ( = ?auto_108757 ?auto_108760 ) ) ( not ( = ?auto_108757 ?auto_108761 ) ) ( not ( = ?auto_108759 ?auto_108760 ) ) ( not ( = ?auto_108759 ?auto_108761 ) ) ( not ( = ?auto_108760 ?auto_108761 ) ) ( ON ?auto_108760 ?auto_108759 ) ( not ( = ?auto_108758 ?auto_108761 ) ) ( not ( = ?auto_108755 ?auto_108758 ) ) ( not ( = ?auto_108756 ?auto_108758 ) ) ( not ( = ?auto_108757 ?auto_108758 ) ) ( not ( = ?auto_108759 ?auto_108758 ) ) ( not ( = ?auto_108760 ?auto_108758 ) ) ( ON ?auto_108761 ?auto_108760 ) ( CLEAR ?auto_108761 ) ( HOLDING ?auto_108758 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108758 )
      ( MAKE-3PILE ?auto_108755 ?auto_108756 ?auto_108757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108762 - BLOCK
      ?auto_108763 - BLOCK
      ?auto_108764 - BLOCK
    )
    :vars
    (
      ?auto_108767 - BLOCK
      ?auto_108766 - BLOCK
      ?auto_108768 - BLOCK
      ?auto_108765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108767 ?auto_108764 ) ( ON-TABLE ?auto_108762 ) ( ON ?auto_108763 ?auto_108762 ) ( ON ?auto_108764 ?auto_108763 ) ( not ( = ?auto_108762 ?auto_108763 ) ) ( not ( = ?auto_108762 ?auto_108764 ) ) ( not ( = ?auto_108762 ?auto_108767 ) ) ( not ( = ?auto_108763 ?auto_108764 ) ) ( not ( = ?auto_108763 ?auto_108767 ) ) ( not ( = ?auto_108764 ?auto_108767 ) ) ( not ( = ?auto_108762 ?auto_108766 ) ) ( not ( = ?auto_108762 ?auto_108768 ) ) ( not ( = ?auto_108763 ?auto_108766 ) ) ( not ( = ?auto_108763 ?auto_108768 ) ) ( not ( = ?auto_108764 ?auto_108766 ) ) ( not ( = ?auto_108764 ?auto_108768 ) ) ( not ( = ?auto_108767 ?auto_108766 ) ) ( not ( = ?auto_108767 ?auto_108768 ) ) ( not ( = ?auto_108766 ?auto_108768 ) ) ( ON ?auto_108766 ?auto_108767 ) ( not ( = ?auto_108765 ?auto_108768 ) ) ( not ( = ?auto_108762 ?auto_108765 ) ) ( not ( = ?auto_108763 ?auto_108765 ) ) ( not ( = ?auto_108764 ?auto_108765 ) ) ( not ( = ?auto_108767 ?auto_108765 ) ) ( not ( = ?auto_108766 ?auto_108765 ) ) ( ON ?auto_108768 ?auto_108766 ) ( ON ?auto_108765 ?auto_108768 ) ( CLEAR ?auto_108765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108762 ?auto_108763 ?auto_108764 ?auto_108767 ?auto_108766 ?auto_108768 )
      ( MAKE-3PILE ?auto_108762 ?auto_108763 ?auto_108764 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108769 - BLOCK
      ?auto_108770 - BLOCK
      ?auto_108771 - BLOCK
    )
    :vars
    (
      ?auto_108772 - BLOCK
      ?auto_108774 - BLOCK
      ?auto_108775 - BLOCK
      ?auto_108773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108772 ?auto_108771 ) ( ON-TABLE ?auto_108769 ) ( ON ?auto_108770 ?auto_108769 ) ( ON ?auto_108771 ?auto_108770 ) ( not ( = ?auto_108769 ?auto_108770 ) ) ( not ( = ?auto_108769 ?auto_108771 ) ) ( not ( = ?auto_108769 ?auto_108772 ) ) ( not ( = ?auto_108770 ?auto_108771 ) ) ( not ( = ?auto_108770 ?auto_108772 ) ) ( not ( = ?auto_108771 ?auto_108772 ) ) ( not ( = ?auto_108769 ?auto_108774 ) ) ( not ( = ?auto_108769 ?auto_108775 ) ) ( not ( = ?auto_108770 ?auto_108774 ) ) ( not ( = ?auto_108770 ?auto_108775 ) ) ( not ( = ?auto_108771 ?auto_108774 ) ) ( not ( = ?auto_108771 ?auto_108775 ) ) ( not ( = ?auto_108772 ?auto_108774 ) ) ( not ( = ?auto_108772 ?auto_108775 ) ) ( not ( = ?auto_108774 ?auto_108775 ) ) ( ON ?auto_108774 ?auto_108772 ) ( not ( = ?auto_108773 ?auto_108775 ) ) ( not ( = ?auto_108769 ?auto_108773 ) ) ( not ( = ?auto_108770 ?auto_108773 ) ) ( not ( = ?auto_108771 ?auto_108773 ) ) ( not ( = ?auto_108772 ?auto_108773 ) ) ( not ( = ?auto_108774 ?auto_108773 ) ) ( ON ?auto_108775 ?auto_108774 ) ( HOLDING ?auto_108773 ) ( CLEAR ?auto_108775 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108769 ?auto_108770 ?auto_108771 ?auto_108772 ?auto_108774 ?auto_108775 ?auto_108773 )
      ( MAKE-3PILE ?auto_108769 ?auto_108770 ?auto_108771 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108776 - BLOCK
      ?auto_108777 - BLOCK
      ?auto_108778 - BLOCK
    )
    :vars
    (
      ?auto_108780 - BLOCK
      ?auto_108782 - BLOCK
      ?auto_108781 - BLOCK
      ?auto_108779 - BLOCK
      ?auto_108783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108780 ?auto_108778 ) ( ON-TABLE ?auto_108776 ) ( ON ?auto_108777 ?auto_108776 ) ( ON ?auto_108778 ?auto_108777 ) ( not ( = ?auto_108776 ?auto_108777 ) ) ( not ( = ?auto_108776 ?auto_108778 ) ) ( not ( = ?auto_108776 ?auto_108780 ) ) ( not ( = ?auto_108777 ?auto_108778 ) ) ( not ( = ?auto_108777 ?auto_108780 ) ) ( not ( = ?auto_108778 ?auto_108780 ) ) ( not ( = ?auto_108776 ?auto_108782 ) ) ( not ( = ?auto_108776 ?auto_108781 ) ) ( not ( = ?auto_108777 ?auto_108782 ) ) ( not ( = ?auto_108777 ?auto_108781 ) ) ( not ( = ?auto_108778 ?auto_108782 ) ) ( not ( = ?auto_108778 ?auto_108781 ) ) ( not ( = ?auto_108780 ?auto_108782 ) ) ( not ( = ?auto_108780 ?auto_108781 ) ) ( not ( = ?auto_108782 ?auto_108781 ) ) ( ON ?auto_108782 ?auto_108780 ) ( not ( = ?auto_108779 ?auto_108781 ) ) ( not ( = ?auto_108776 ?auto_108779 ) ) ( not ( = ?auto_108777 ?auto_108779 ) ) ( not ( = ?auto_108778 ?auto_108779 ) ) ( not ( = ?auto_108780 ?auto_108779 ) ) ( not ( = ?auto_108782 ?auto_108779 ) ) ( ON ?auto_108781 ?auto_108782 ) ( CLEAR ?auto_108781 ) ( ON ?auto_108779 ?auto_108783 ) ( CLEAR ?auto_108779 ) ( HAND-EMPTY ) ( not ( = ?auto_108776 ?auto_108783 ) ) ( not ( = ?auto_108777 ?auto_108783 ) ) ( not ( = ?auto_108778 ?auto_108783 ) ) ( not ( = ?auto_108780 ?auto_108783 ) ) ( not ( = ?auto_108782 ?auto_108783 ) ) ( not ( = ?auto_108781 ?auto_108783 ) ) ( not ( = ?auto_108779 ?auto_108783 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108779 ?auto_108783 )
      ( MAKE-3PILE ?auto_108776 ?auto_108777 ?auto_108778 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108784 - BLOCK
      ?auto_108785 - BLOCK
      ?auto_108786 - BLOCK
    )
    :vars
    (
      ?auto_108790 - BLOCK
      ?auto_108787 - BLOCK
      ?auto_108791 - BLOCK
      ?auto_108789 - BLOCK
      ?auto_108788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108790 ?auto_108786 ) ( ON-TABLE ?auto_108784 ) ( ON ?auto_108785 ?auto_108784 ) ( ON ?auto_108786 ?auto_108785 ) ( not ( = ?auto_108784 ?auto_108785 ) ) ( not ( = ?auto_108784 ?auto_108786 ) ) ( not ( = ?auto_108784 ?auto_108790 ) ) ( not ( = ?auto_108785 ?auto_108786 ) ) ( not ( = ?auto_108785 ?auto_108790 ) ) ( not ( = ?auto_108786 ?auto_108790 ) ) ( not ( = ?auto_108784 ?auto_108787 ) ) ( not ( = ?auto_108784 ?auto_108791 ) ) ( not ( = ?auto_108785 ?auto_108787 ) ) ( not ( = ?auto_108785 ?auto_108791 ) ) ( not ( = ?auto_108786 ?auto_108787 ) ) ( not ( = ?auto_108786 ?auto_108791 ) ) ( not ( = ?auto_108790 ?auto_108787 ) ) ( not ( = ?auto_108790 ?auto_108791 ) ) ( not ( = ?auto_108787 ?auto_108791 ) ) ( ON ?auto_108787 ?auto_108790 ) ( not ( = ?auto_108789 ?auto_108791 ) ) ( not ( = ?auto_108784 ?auto_108789 ) ) ( not ( = ?auto_108785 ?auto_108789 ) ) ( not ( = ?auto_108786 ?auto_108789 ) ) ( not ( = ?auto_108790 ?auto_108789 ) ) ( not ( = ?auto_108787 ?auto_108789 ) ) ( ON ?auto_108789 ?auto_108788 ) ( CLEAR ?auto_108789 ) ( not ( = ?auto_108784 ?auto_108788 ) ) ( not ( = ?auto_108785 ?auto_108788 ) ) ( not ( = ?auto_108786 ?auto_108788 ) ) ( not ( = ?auto_108790 ?auto_108788 ) ) ( not ( = ?auto_108787 ?auto_108788 ) ) ( not ( = ?auto_108791 ?auto_108788 ) ) ( not ( = ?auto_108789 ?auto_108788 ) ) ( HOLDING ?auto_108791 ) ( CLEAR ?auto_108787 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108784 ?auto_108785 ?auto_108786 ?auto_108790 ?auto_108787 ?auto_108791 )
      ( MAKE-3PILE ?auto_108784 ?auto_108785 ?auto_108786 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108792 - BLOCK
      ?auto_108793 - BLOCK
      ?auto_108794 - BLOCK
    )
    :vars
    (
      ?auto_108799 - BLOCK
      ?auto_108798 - BLOCK
      ?auto_108796 - BLOCK
      ?auto_108795 - BLOCK
      ?auto_108797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108799 ?auto_108794 ) ( ON-TABLE ?auto_108792 ) ( ON ?auto_108793 ?auto_108792 ) ( ON ?auto_108794 ?auto_108793 ) ( not ( = ?auto_108792 ?auto_108793 ) ) ( not ( = ?auto_108792 ?auto_108794 ) ) ( not ( = ?auto_108792 ?auto_108799 ) ) ( not ( = ?auto_108793 ?auto_108794 ) ) ( not ( = ?auto_108793 ?auto_108799 ) ) ( not ( = ?auto_108794 ?auto_108799 ) ) ( not ( = ?auto_108792 ?auto_108798 ) ) ( not ( = ?auto_108792 ?auto_108796 ) ) ( not ( = ?auto_108793 ?auto_108798 ) ) ( not ( = ?auto_108793 ?auto_108796 ) ) ( not ( = ?auto_108794 ?auto_108798 ) ) ( not ( = ?auto_108794 ?auto_108796 ) ) ( not ( = ?auto_108799 ?auto_108798 ) ) ( not ( = ?auto_108799 ?auto_108796 ) ) ( not ( = ?auto_108798 ?auto_108796 ) ) ( ON ?auto_108798 ?auto_108799 ) ( not ( = ?auto_108795 ?auto_108796 ) ) ( not ( = ?auto_108792 ?auto_108795 ) ) ( not ( = ?auto_108793 ?auto_108795 ) ) ( not ( = ?auto_108794 ?auto_108795 ) ) ( not ( = ?auto_108799 ?auto_108795 ) ) ( not ( = ?auto_108798 ?auto_108795 ) ) ( ON ?auto_108795 ?auto_108797 ) ( not ( = ?auto_108792 ?auto_108797 ) ) ( not ( = ?auto_108793 ?auto_108797 ) ) ( not ( = ?auto_108794 ?auto_108797 ) ) ( not ( = ?auto_108799 ?auto_108797 ) ) ( not ( = ?auto_108798 ?auto_108797 ) ) ( not ( = ?auto_108796 ?auto_108797 ) ) ( not ( = ?auto_108795 ?auto_108797 ) ) ( CLEAR ?auto_108798 ) ( ON ?auto_108796 ?auto_108795 ) ( CLEAR ?auto_108796 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108797 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108797 ?auto_108795 )
      ( MAKE-3PILE ?auto_108792 ?auto_108793 ?auto_108794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108800 - BLOCK
      ?auto_108801 - BLOCK
      ?auto_108802 - BLOCK
    )
    :vars
    (
      ?auto_108804 - BLOCK
      ?auto_108807 - BLOCK
      ?auto_108806 - BLOCK
      ?auto_108805 - BLOCK
      ?auto_108803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108804 ?auto_108802 ) ( ON-TABLE ?auto_108800 ) ( ON ?auto_108801 ?auto_108800 ) ( ON ?auto_108802 ?auto_108801 ) ( not ( = ?auto_108800 ?auto_108801 ) ) ( not ( = ?auto_108800 ?auto_108802 ) ) ( not ( = ?auto_108800 ?auto_108804 ) ) ( not ( = ?auto_108801 ?auto_108802 ) ) ( not ( = ?auto_108801 ?auto_108804 ) ) ( not ( = ?auto_108802 ?auto_108804 ) ) ( not ( = ?auto_108800 ?auto_108807 ) ) ( not ( = ?auto_108800 ?auto_108806 ) ) ( not ( = ?auto_108801 ?auto_108807 ) ) ( not ( = ?auto_108801 ?auto_108806 ) ) ( not ( = ?auto_108802 ?auto_108807 ) ) ( not ( = ?auto_108802 ?auto_108806 ) ) ( not ( = ?auto_108804 ?auto_108807 ) ) ( not ( = ?auto_108804 ?auto_108806 ) ) ( not ( = ?auto_108807 ?auto_108806 ) ) ( not ( = ?auto_108805 ?auto_108806 ) ) ( not ( = ?auto_108800 ?auto_108805 ) ) ( not ( = ?auto_108801 ?auto_108805 ) ) ( not ( = ?auto_108802 ?auto_108805 ) ) ( not ( = ?auto_108804 ?auto_108805 ) ) ( not ( = ?auto_108807 ?auto_108805 ) ) ( ON ?auto_108805 ?auto_108803 ) ( not ( = ?auto_108800 ?auto_108803 ) ) ( not ( = ?auto_108801 ?auto_108803 ) ) ( not ( = ?auto_108802 ?auto_108803 ) ) ( not ( = ?auto_108804 ?auto_108803 ) ) ( not ( = ?auto_108807 ?auto_108803 ) ) ( not ( = ?auto_108806 ?auto_108803 ) ) ( not ( = ?auto_108805 ?auto_108803 ) ) ( ON ?auto_108806 ?auto_108805 ) ( CLEAR ?auto_108806 ) ( ON-TABLE ?auto_108803 ) ( HOLDING ?auto_108807 ) ( CLEAR ?auto_108804 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108800 ?auto_108801 ?auto_108802 ?auto_108804 ?auto_108807 )
      ( MAKE-3PILE ?auto_108800 ?auto_108801 ?auto_108802 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108808 - BLOCK
      ?auto_108809 - BLOCK
      ?auto_108810 - BLOCK
    )
    :vars
    (
      ?auto_108813 - BLOCK
      ?auto_108815 - BLOCK
      ?auto_108814 - BLOCK
      ?auto_108811 - BLOCK
      ?auto_108812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108813 ?auto_108810 ) ( ON-TABLE ?auto_108808 ) ( ON ?auto_108809 ?auto_108808 ) ( ON ?auto_108810 ?auto_108809 ) ( not ( = ?auto_108808 ?auto_108809 ) ) ( not ( = ?auto_108808 ?auto_108810 ) ) ( not ( = ?auto_108808 ?auto_108813 ) ) ( not ( = ?auto_108809 ?auto_108810 ) ) ( not ( = ?auto_108809 ?auto_108813 ) ) ( not ( = ?auto_108810 ?auto_108813 ) ) ( not ( = ?auto_108808 ?auto_108815 ) ) ( not ( = ?auto_108808 ?auto_108814 ) ) ( not ( = ?auto_108809 ?auto_108815 ) ) ( not ( = ?auto_108809 ?auto_108814 ) ) ( not ( = ?auto_108810 ?auto_108815 ) ) ( not ( = ?auto_108810 ?auto_108814 ) ) ( not ( = ?auto_108813 ?auto_108815 ) ) ( not ( = ?auto_108813 ?auto_108814 ) ) ( not ( = ?auto_108815 ?auto_108814 ) ) ( not ( = ?auto_108811 ?auto_108814 ) ) ( not ( = ?auto_108808 ?auto_108811 ) ) ( not ( = ?auto_108809 ?auto_108811 ) ) ( not ( = ?auto_108810 ?auto_108811 ) ) ( not ( = ?auto_108813 ?auto_108811 ) ) ( not ( = ?auto_108815 ?auto_108811 ) ) ( ON ?auto_108811 ?auto_108812 ) ( not ( = ?auto_108808 ?auto_108812 ) ) ( not ( = ?auto_108809 ?auto_108812 ) ) ( not ( = ?auto_108810 ?auto_108812 ) ) ( not ( = ?auto_108813 ?auto_108812 ) ) ( not ( = ?auto_108815 ?auto_108812 ) ) ( not ( = ?auto_108814 ?auto_108812 ) ) ( not ( = ?auto_108811 ?auto_108812 ) ) ( ON ?auto_108814 ?auto_108811 ) ( ON-TABLE ?auto_108812 ) ( CLEAR ?auto_108813 ) ( ON ?auto_108815 ?auto_108814 ) ( CLEAR ?auto_108815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108812 ?auto_108811 ?auto_108814 )
      ( MAKE-3PILE ?auto_108808 ?auto_108809 ?auto_108810 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108832 - BLOCK
      ?auto_108833 - BLOCK
      ?auto_108834 - BLOCK
    )
    :vars
    (
      ?auto_108835 - BLOCK
      ?auto_108838 - BLOCK
      ?auto_108837 - BLOCK
      ?auto_108839 - BLOCK
      ?auto_108836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108832 ) ( ON ?auto_108833 ?auto_108832 ) ( not ( = ?auto_108832 ?auto_108833 ) ) ( not ( = ?auto_108832 ?auto_108834 ) ) ( not ( = ?auto_108832 ?auto_108835 ) ) ( not ( = ?auto_108833 ?auto_108834 ) ) ( not ( = ?auto_108833 ?auto_108835 ) ) ( not ( = ?auto_108834 ?auto_108835 ) ) ( not ( = ?auto_108832 ?auto_108838 ) ) ( not ( = ?auto_108832 ?auto_108837 ) ) ( not ( = ?auto_108833 ?auto_108838 ) ) ( not ( = ?auto_108833 ?auto_108837 ) ) ( not ( = ?auto_108834 ?auto_108838 ) ) ( not ( = ?auto_108834 ?auto_108837 ) ) ( not ( = ?auto_108835 ?auto_108838 ) ) ( not ( = ?auto_108835 ?auto_108837 ) ) ( not ( = ?auto_108838 ?auto_108837 ) ) ( not ( = ?auto_108839 ?auto_108837 ) ) ( not ( = ?auto_108832 ?auto_108839 ) ) ( not ( = ?auto_108833 ?auto_108839 ) ) ( not ( = ?auto_108834 ?auto_108839 ) ) ( not ( = ?auto_108835 ?auto_108839 ) ) ( not ( = ?auto_108838 ?auto_108839 ) ) ( ON ?auto_108839 ?auto_108836 ) ( not ( = ?auto_108832 ?auto_108836 ) ) ( not ( = ?auto_108833 ?auto_108836 ) ) ( not ( = ?auto_108834 ?auto_108836 ) ) ( not ( = ?auto_108835 ?auto_108836 ) ) ( not ( = ?auto_108838 ?auto_108836 ) ) ( not ( = ?auto_108837 ?auto_108836 ) ) ( not ( = ?auto_108839 ?auto_108836 ) ) ( ON ?auto_108837 ?auto_108839 ) ( ON-TABLE ?auto_108836 ) ( ON ?auto_108838 ?auto_108837 ) ( ON ?auto_108835 ?auto_108838 ) ( CLEAR ?auto_108835 ) ( HOLDING ?auto_108834 ) ( CLEAR ?auto_108833 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108832 ?auto_108833 ?auto_108834 ?auto_108835 )
      ( MAKE-3PILE ?auto_108832 ?auto_108833 ?auto_108834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108840 - BLOCK
      ?auto_108841 - BLOCK
      ?auto_108842 - BLOCK
    )
    :vars
    (
      ?auto_108846 - BLOCK
      ?auto_108843 - BLOCK
      ?auto_108844 - BLOCK
      ?auto_108845 - BLOCK
      ?auto_108847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108840 ) ( ON ?auto_108841 ?auto_108840 ) ( not ( = ?auto_108840 ?auto_108841 ) ) ( not ( = ?auto_108840 ?auto_108842 ) ) ( not ( = ?auto_108840 ?auto_108846 ) ) ( not ( = ?auto_108841 ?auto_108842 ) ) ( not ( = ?auto_108841 ?auto_108846 ) ) ( not ( = ?auto_108842 ?auto_108846 ) ) ( not ( = ?auto_108840 ?auto_108843 ) ) ( not ( = ?auto_108840 ?auto_108844 ) ) ( not ( = ?auto_108841 ?auto_108843 ) ) ( not ( = ?auto_108841 ?auto_108844 ) ) ( not ( = ?auto_108842 ?auto_108843 ) ) ( not ( = ?auto_108842 ?auto_108844 ) ) ( not ( = ?auto_108846 ?auto_108843 ) ) ( not ( = ?auto_108846 ?auto_108844 ) ) ( not ( = ?auto_108843 ?auto_108844 ) ) ( not ( = ?auto_108845 ?auto_108844 ) ) ( not ( = ?auto_108840 ?auto_108845 ) ) ( not ( = ?auto_108841 ?auto_108845 ) ) ( not ( = ?auto_108842 ?auto_108845 ) ) ( not ( = ?auto_108846 ?auto_108845 ) ) ( not ( = ?auto_108843 ?auto_108845 ) ) ( ON ?auto_108845 ?auto_108847 ) ( not ( = ?auto_108840 ?auto_108847 ) ) ( not ( = ?auto_108841 ?auto_108847 ) ) ( not ( = ?auto_108842 ?auto_108847 ) ) ( not ( = ?auto_108846 ?auto_108847 ) ) ( not ( = ?auto_108843 ?auto_108847 ) ) ( not ( = ?auto_108844 ?auto_108847 ) ) ( not ( = ?auto_108845 ?auto_108847 ) ) ( ON ?auto_108844 ?auto_108845 ) ( ON-TABLE ?auto_108847 ) ( ON ?auto_108843 ?auto_108844 ) ( ON ?auto_108846 ?auto_108843 ) ( CLEAR ?auto_108841 ) ( ON ?auto_108842 ?auto_108846 ) ( CLEAR ?auto_108842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108847 ?auto_108845 ?auto_108844 ?auto_108843 ?auto_108846 )
      ( MAKE-3PILE ?auto_108840 ?auto_108841 ?auto_108842 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108848 - BLOCK
      ?auto_108849 - BLOCK
      ?auto_108850 - BLOCK
    )
    :vars
    (
      ?auto_108853 - BLOCK
      ?auto_108852 - BLOCK
      ?auto_108855 - BLOCK
      ?auto_108854 - BLOCK
      ?auto_108851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108848 ) ( not ( = ?auto_108848 ?auto_108849 ) ) ( not ( = ?auto_108848 ?auto_108850 ) ) ( not ( = ?auto_108848 ?auto_108853 ) ) ( not ( = ?auto_108849 ?auto_108850 ) ) ( not ( = ?auto_108849 ?auto_108853 ) ) ( not ( = ?auto_108850 ?auto_108853 ) ) ( not ( = ?auto_108848 ?auto_108852 ) ) ( not ( = ?auto_108848 ?auto_108855 ) ) ( not ( = ?auto_108849 ?auto_108852 ) ) ( not ( = ?auto_108849 ?auto_108855 ) ) ( not ( = ?auto_108850 ?auto_108852 ) ) ( not ( = ?auto_108850 ?auto_108855 ) ) ( not ( = ?auto_108853 ?auto_108852 ) ) ( not ( = ?auto_108853 ?auto_108855 ) ) ( not ( = ?auto_108852 ?auto_108855 ) ) ( not ( = ?auto_108854 ?auto_108855 ) ) ( not ( = ?auto_108848 ?auto_108854 ) ) ( not ( = ?auto_108849 ?auto_108854 ) ) ( not ( = ?auto_108850 ?auto_108854 ) ) ( not ( = ?auto_108853 ?auto_108854 ) ) ( not ( = ?auto_108852 ?auto_108854 ) ) ( ON ?auto_108854 ?auto_108851 ) ( not ( = ?auto_108848 ?auto_108851 ) ) ( not ( = ?auto_108849 ?auto_108851 ) ) ( not ( = ?auto_108850 ?auto_108851 ) ) ( not ( = ?auto_108853 ?auto_108851 ) ) ( not ( = ?auto_108852 ?auto_108851 ) ) ( not ( = ?auto_108855 ?auto_108851 ) ) ( not ( = ?auto_108854 ?auto_108851 ) ) ( ON ?auto_108855 ?auto_108854 ) ( ON-TABLE ?auto_108851 ) ( ON ?auto_108852 ?auto_108855 ) ( ON ?auto_108853 ?auto_108852 ) ( ON ?auto_108850 ?auto_108853 ) ( CLEAR ?auto_108850 ) ( HOLDING ?auto_108849 ) ( CLEAR ?auto_108848 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108848 ?auto_108849 )
      ( MAKE-3PILE ?auto_108848 ?auto_108849 ?auto_108850 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108856 - BLOCK
      ?auto_108857 - BLOCK
      ?auto_108858 - BLOCK
    )
    :vars
    (
      ?auto_108859 - BLOCK
      ?auto_108863 - BLOCK
      ?auto_108860 - BLOCK
      ?auto_108862 - BLOCK
      ?auto_108861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108856 ) ( not ( = ?auto_108856 ?auto_108857 ) ) ( not ( = ?auto_108856 ?auto_108858 ) ) ( not ( = ?auto_108856 ?auto_108859 ) ) ( not ( = ?auto_108857 ?auto_108858 ) ) ( not ( = ?auto_108857 ?auto_108859 ) ) ( not ( = ?auto_108858 ?auto_108859 ) ) ( not ( = ?auto_108856 ?auto_108863 ) ) ( not ( = ?auto_108856 ?auto_108860 ) ) ( not ( = ?auto_108857 ?auto_108863 ) ) ( not ( = ?auto_108857 ?auto_108860 ) ) ( not ( = ?auto_108858 ?auto_108863 ) ) ( not ( = ?auto_108858 ?auto_108860 ) ) ( not ( = ?auto_108859 ?auto_108863 ) ) ( not ( = ?auto_108859 ?auto_108860 ) ) ( not ( = ?auto_108863 ?auto_108860 ) ) ( not ( = ?auto_108862 ?auto_108860 ) ) ( not ( = ?auto_108856 ?auto_108862 ) ) ( not ( = ?auto_108857 ?auto_108862 ) ) ( not ( = ?auto_108858 ?auto_108862 ) ) ( not ( = ?auto_108859 ?auto_108862 ) ) ( not ( = ?auto_108863 ?auto_108862 ) ) ( ON ?auto_108862 ?auto_108861 ) ( not ( = ?auto_108856 ?auto_108861 ) ) ( not ( = ?auto_108857 ?auto_108861 ) ) ( not ( = ?auto_108858 ?auto_108861 ) ) ( not ( = ?auto_108859 ?auto_108861 ) ) ( not ( = ?auto_108863 ?auto_108861 ) ) ( not ( = ?auto_108860 ?auto_108861 ) ) ( not ( = ?auto_108862 ?auto_108861 ) ) ( ON ?auto_108860 ?auto_108862 ) ( ON-TABLE ?auto_108861 ) ( ON ?auto_108863 ?auto_108860 ) ( ON ?auto_108859 ?auto_108863 ) ( ON ?auto_108858 ?auto_108859 ) ( CLEAR ?auto_108856 ) ( ON ?auto_108857 ?auto_108858 ) ( CLEAR ?auto_108857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108861 ?auto_108862 ?auto_108860 ?auto_108863 ?auto_108859 ?auto_108858 )
      ( MAKE-3PILE ?auto_108856 ?auto_108857 ?auto_108858 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108864 - BLOCK
      ?auto_108865 - BLOCK
      ?auto_108866 - BLOCK
    )
    :vars
    (
      ?auto_108868 - BLOCK
      ?auto_108871 - BLOCK
      ?auto_108867 - BLOCK
      ?auto_108869 - BLOCK
      ?auto_108870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108864 ?auto_108865 ) ) ( not ( = ?auto_108864 ?auto_108866 ) ) ( not ( = ?auto_108864 ?auto_108868 ) ) ( not ( = ?auto_108865 ?auto_108866 ) ) ( not ( = ?auto_108865 ?auto_108868 ) ) ( not ( = ?auto_108866 ?auto_108868 ) ) ( not ( = ?auto_108864 ?auto_108871 ) ) ( not ( = ?auto_108864 ?auto_108867 ) ) ( not ( = ?auto_108865 ?auto_108871 ) ) ( not ( = ?auto_108865 ?auto_108867 ) ) ( not ( = ?auto_108866 ?auto_108871 ) ) ( not ( = ?auto_108866 ?auto_108867 ) ) ( not ( = ?auto_108868 ?auto_108871 ) ) ( not ( = ?auto_108868 ?auto_108867 ) ) ( not ( = ?auto_108871 ?auto_108867 ) ) ( not ( = ?auto_108869 ?auto_108867 ) ) ( not ( = ?auto_108864 ?auto_108869 ) ) ( not ( = ?auto_108865 ?auto_108869 ) ) ( not ( = ?auto_108866 ?auto_108869 ) ) ( not ( = ?auto_108868 ?auto_108869 ) ) ( not ( = ?auto_108871 ?auto_108869 ) ) ( ON ?auto_108869 ?auto_108870 ) ( not ( = ?auto_108864 ?auto_108870 ) ) ( not ( = ?auto_108865 ?auto_108870 ) ) ( not ( = ?auto_108866 ?auto_108870 ) ) ( not ( = ?auto_108868 ?auto_108870 ) ) ( not ( = ?auto_108871 ?auto_108870 ) ) ( not ( = ?auto_108867 ?auto_108870 ) ) ( not ( = ?auto_108869 ?auto_108870 ) ) ( ON ?auto_108867 ?auto_108869 ) ( ON-TABLE ?auto_108870 ) ( ON ?auto_108871 ?auto_108867 ) ( ON ?auto_108868 ?auto_108871 ) ( ON ?auto_108866 ?auto_108868 ) ( ON ?auto_108865 ?auto_108866 ) ( CLEAR ?auto_108865 ) ( HOLDING ?auto_108864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108864 )
      ( MAKE-3PILE ?auto_108864 ?auto_108865 ?auto_108866 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_108872 - BLOCK
      ?auto_108873 - BLOCK
      ?auto_108874 - BLOCK
    )
    :vars
    (
      ?auto_108875 - BLOCK
      ?auto_108876 - BLOCK
      ?auto_108877 - BLOCK
      ?auto_108879 - BLOCK
      ?auto_108878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108872 ?auto_108873 ) ) ( not ( = ?auto_108872 ?auto_108874 ) ) ( not ( = ?auto_108872 ?auto_108875 ) ) ( not ( = ?auto_108873 ?auto_108874 ) ) ( not ( = ?auto_108873 ?auto_108875 ) ) ( not ( = ?auto_108874 ?auto_108875 ) ) ( not ( = ?auto_108872 ?auto_108876 ) ) ( not ( = ?auto_108872 ?auto_108877 ) ) ( not ( = ?auto_108873 ?auto_108876 ) ) ( not ( = ?auto_108873 ?auto_108877 ) ) ( not ( = ?auto_108874 ?auto_108876 ) ) ( not ( = ?auto_108874 ?auto_108877 ) ) ( not ( = ?auto_108875 ?auto_108876 ) ) ( not ( = ?auto_108875 ?auto_108877 ) ) ( not ( = ?auto_108876 ?auto_108877 ) ) ( not ( = ?auto_108879 ?auto_108877 ) ) ( not ( = ?auto_108872 ?auto_108879 ) ) ( not ( = ?auto_108873 ?auto_108879 ) ) ( not ( = ?auto_108874 ?auto_108879 ) ) ( not ( = ?auto_108875 ?auto_108879 ) ) ( not ( = ?auto_108876 ?auto_108879 ) ) ( ON ?auto_108879 ?auto_108878 ) ( not ( = ?auto_108872 ?auto_108878 ) ) ( not ( = ?auto_108873 ?auto_108878 ) ) ( not ( = ?auto_108874 ?auto_108878 ) ) ( not ( = ?auto_108875 ?auto_108878 ) ) ( not ( = ?auto_108876 ?auto_108878 ) ) ( not ( = ?auto_108877 ?auto_108878 ) ) ( not ( = ?auto_108879 ?auto_108878 ) ) ( ON ?auto_108877 ?auto_108879 ) ( ON-TABLE ?auto_108878 ) ( ON ?auto_108876 ?auto_108877 ) ( ON ?auto_108875 ?auto_108876 ) ( ON ?auto_108874 ?auto_108875 ) ( ON ?auto_108873 ?auto_108874 ) ( ON ?auto_108872 ?auto_108873 ) ( CLEAR ?auto_108872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108878 ?auto_108879 ?auto_108877 ?auto_108876 ?auto_108875 ?auto_108874 ?auto_108873 )
      ( MAKE-3PILE ?auto_108872 ?auto_108873 ?auto_108874 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108884 - BLOCK
      ?auto_108885 - BLOCK
      ?auto_108886 - BLOCK
      ?auto_108887 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_108887 ) ( CLEAR ?auto_108886 ) ( ON-TABLE ?auto_108884 ) ( ON ?auto_108885 ?auto_108884 ) ( ON ?auto_108886 ?auto_108885 ) ( not ( = ?auto_108884 ?auto_108885 ) ) ( not ( = ?auto_108884 ?auto_108886 ) ) ( not ( = ?auto_108884 ?auto_108887 ) ) ( not ( = ?auto_108885 ?auto_108886 ) ) ( not ( = ?auto_108885 ?auto_108887 ) ) ( not ( = ?auto_108886 ?auto_108887 ) ) )
    :subtasks
    ( ( !STACK ?auto_108887 ?auto_108886 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108888 - BLOCK
      ?auto_108889 - BLOCK
      ?auto_108890 - BLOCK
      ?auto_108891 - BLOCK
    )
    :vars
    (
      ?auto_108892 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_108890 ) ( ON-TABLE ?auto_108888 ) ( ON ?auto_108889 ?auto_108888 ) ( ON ?auto_108890 ?auto_108889 ) ( not ( = ?auto_108888 ?auto_108889 ) ) ( not ( = ?auto_108888 ?auto_108890 ) ) ( not ( = ?auto_108888 ?auto_108891 ) ) ( not ( = ?auto_108889 ?auto_108890 ) ) ( not ( = ?auto_108889 ?auto_108891 ) ) ( not ( = ?auto_108890 ?auto_108891 ) ) ( ON ?auto_108891 ?auto_108892 ) ( CLEAR ?auto_108891 ) ( HAND-EMPTY ) ( not ( = ?auto_108888 ?auto_108892 ) ) ( not ( = ?auto_108889 ?auto_108892 ) ) ( not ( = ?auto_108890 ?auto_108892 ) ) ( not ( = ?auto_108891 ?auto_108892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108891 ?auto_108892 )
      ( MAKE-4PILE ?auto_108888 ?auto_108889 ?auto_108890 ?auto_108891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108893 - BLOCK
      ?auto_108894 - BLOCK
      ?auto_108895 - BLOCK
      ?auto_108896 - BLOCK
    )
    :vars
    (
      ?auto_108897 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108893 ) ( ON ?auto_108894 ?auto_108893 ) ( not ( = ?auto_108893 ?auto_108894 ) ) ( not ( = ?auto_108893 ?auto_108895 ) ) ( not ( = ?auto_108893 ?auto_108896 ) ) ( not ( = ?auto_108894 ?auto_108895 ) ) ( not ( = ?auto_108894 ?auto_108896 ) ) ( not ( = ?auto_108895 ?auto_108896 ) ) ( ON ?auto_108896 ?auto_108897 ) ( CLEAR ?auto_108896 ) ( not ( = ?auto_108893 ?auto_108897 ) ) ( not ( = ?auto_108894 ?auto_108897 ) ) ( not ( = ?auto_108895 ?auto_108897 ) ) ( not ( = ?auto_108896 ?auto_108897 ) ) ( HOLDING ?auto_108895 ) ( CLEAR ?auto_108894 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108893 ?auto_108894 ?auto_108895 )
      ( MAKE-4PILE ?auto_108893 ?auto_108894 ?auto_108895 ?auto_108896 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108898 - BLOCK
      ?auto_108899 - BLOCK
      ?auto_108900 - BLOCK
      ?auto_108901 - BLOCK
    )
    :vars
    (
      ?auto_108902 - BLOCK
      ?auto_108903 - BLOCK
      ?auto_108904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108898 ) ( ON ?auto_108899 ?auto_108898 ) ( not ( = ?auto_108898 ?auto_108899 ) ) ( not ( = ?auto_108898 ?auto_108900 ) ) ( not ( = ?auto_108898 ?auto_108901 ) ) ( not ( = ?auto_108899 ?auto_108900 ) ) ( not ( = ?auto_108899 ?auto_108901 ) ) ( not ( = ?auto_108900 ?auto_108901 ) ) ( ON ?auto_108901 ?auto_108902 ) ( not ( = ?auto_108898 ?auto_108902 ) ) ( not ( = ?auto_108899 ?auto_108902 ) ) ( not ( = ?auto_108900 ?auto_108902 ) ) ( not ( = ?auto_108901 ?auto_108902 ) ) ( CLEAR ?auto_108899 ) ( ON ?auto_108900 ?auto_108901 ) ( CLEAR ?auto_108900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108903 ) ( ON ?auto_108904 ?auto_108903 ) ( ON ?auto_108902 ?auto_108904 ) ( not ( = ?auto_108903 ?auto_108904 ) ) ( not ( = ?auto_108903 ?auto_108902 ) ) ( not ( = ?auto_108903 ?auto_108901 ) ) ( not ( = ?auto_108903 ?auto_108900 ) ) ( not ( = ?auto_108904 ?auto_108902 ) ) ( not ( = ?auto_108904 ?auto_108901 ) ) ( not ( = ?auto_108904 ?auto_108900 ) ) ( not ( = ?auto_108898 ?auto_108903 ) ) ( not ( = ?auto_108898 ?auto_108904 ) ) ( not ( = ?auto_108899 ?auto_108903 ) ) ( not ( = ?auto_108899 ?auto_108904 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108903 ?auto_108904 ?auto_108902 ?auto_108901 )
      ( MAKE-4PILE ?auto_108898 ?auto_108899 ?auto_108900 ?auto_108901 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108905 - BLOCK
      ?auto_108906 - BLOCK
      ?auto_108907 - BLOCK
      ?auto_108908 - BLOCK
    )
    :vars
    (
      ?auto_108911 - BLOCK
      ?auto_108910 - BLOCK
      ?auto_108909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108905 ) ( not ( = ?auto_108905 ?auto_108906 ) ) ( not ( = ?auto_108905 ?auto_108907 ) ) ( not ( = ?auto_108905 ?auto_108908 ) ) ( not ( = ?auto_108906 ?auto_108907 ) ) ( not ( = ?auto_108906 ?auto_108908 ) ) ( not ( = ?auto_108907 ?auto_108908 ) ) ( ON ?auto_108908 ?auto_108911 ) ( not ( = ?auto_108905 ?auto_108911 ) ) ( not ( = ?auto_108906 ?auto_108911 ) ) ( not ( = ?auto_108907 ?auto_108911 ) ) ( not ( = ?auto_108908 ?auto_108911 ) ) ( ON ?auto_108907 ?auto_108908 ) ( CLEAR ?auto_108907 ) ( ON-TABLE ?auto_108910 ) ( ON ?auto_108909 ?auto_108910 ) ( ON ?auto_108911 ?auto_108909 ) ( not ( = ?auto_108910 ?auto_108909 ) ) ( not ( = ?auto_108910 ?auto_108911 ) ) ( not ( = ?auto_108910 ?auto_108908 ) ) ( not ( = ?auto_108910 ?auto_108907 ) ) ( not ( = ?auto_108909 ?auto_108911 ) ) ( not ( = ?auto_108909 ?auto_108908 ) ) ( not ( = ?auto_108909 ?auto_108907 ) ) ( not ( = ?auto_108905 ?auto_108910 ) ) ( not ( = ?auto_108905 ?auto_108909 ) ) ( not ( = ?auto_108906 ?auto_108910 ) ) ( not ( = ?auto_108906 ?auto_108909 ) ) ( HOLDING ?auto_108906 ) ( CLEAR ?auto_108905 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108905 ?auto_108906 )
      ( MAKE-4PILE ?auto_108905 ?auto_108906 ?auto_108907 ?auto_108908 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108912 - BLOCK
      ?auto_108913 - BLOCK
      ?auto_108914 - BLOCK
      ?auto_108915 - BLOCK
    )
    :vars
    (
      ?auto_108918 - BLOCK
      ?auto_108916 - BLOCK
      ?auto_108917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108912 ) ( not ( = ?auto_108912 ?auto_108913 ) ) ( not ( = ?auto_108912 ?auto_108914 ) ) ( not ( = ?auto_108912 ?auto_108915 ) ) ( not ( = ?auto_108913 ?auto_108914 ) ) ( not ( = ?auto_108913 ?auto_108915 ) ) ( not ( = ?auto_108914 ?auto_108915 ) ) ( ON ?auto_108915 ?auto_108918 ) ( not ( = ?auto_108912 ?auto_108918 ) ) ( not ( = ?auto_108913 ?auto_108918 ) ) ( not ( = ?auto_108914 ?auto_108918 ) ) ( not ( = ?auto_108915 ?auto_108918 ) ) ( ON ?auto_108914 ?auto_108915 ) ( ON-TABLE ?auto_108916 ) ( ON ?auto_108917 ?auto_108916 ) ( ON ?auto_108918 ?auto_108917 ) ( not ( = ?auto_108916 ?auto_108917 ) ) ( not ( = ?auto_108916 ?auto_108918 ) ) ( not ( = ?auto_108916 ?auto_108915 ) ) ( not ( = ?auto_108916 ?auto_108914 ) ) ( not ( = ?auto_108917 ?auto_108918 ) ) ( not ( = ?auto_108917 ?auto_108915 ) ) ( not ( = ?auto_108917 ?auto_108914 ) ) ( not ( = ?auto_108912 ?auto_108916 ) ) ( not ( = ?auto_108912 ?auto_108917 ) ) ( not ( = ?auto_108913 ?auto_108916 ) ) ( not ( = ?auto_108913 ?auto_108917 ) ) ( CLEAR ?auto_108912 ) ( ON ?auto_108913 ?auto_108914 ) ( CLEAR ?auto_108913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108916 ?auto_108917 ?auto_108918 ?auto_108915 ?auto_108914 )
      ( MAKE-4PILE ?auto_108912 ?auto_108913 ?auto_108914 ?auto_108915 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108919 - BLOCK
      ?auto_108920 - BLOCK
      ?auto_108921 - BLOCK
      ?auto_108922 - BLOCK
    )
    :vars
    (
      ?auto_108923 - BLOCK
      ?auto_108924 - BLOCK
      ?auto_108925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108919 ?auto_108920 ) ) ( not ( = ?auto_108919 ?auto_108921 ) ) ( not ( = ?auto_108919 ?auto_108922 ) ) ( not ( = ?auto_108920 ?auto_108921 ) ) ( not ( = ?auto_108920 ?auto_108922 ) ) ( not ( = ?auto_108921 ?auto_108922 ) ) ( ON ?auto_108922 ?auto_108923 ) ( not ( = ?auto_108919 ?auto_108923 ) ) ( not ( = ?auto_108920 ?auto_108923 ) ) ( not ( = ?auto_108921 ?auto_108923 ) ) ( not ( = ?auto_108922 ?auto_108923 ) ) ( ON ?auto_108921 ?auto_108922 ) ( ON-TABLE ?auto_108924 ) ( ON ?auto_108925 ?auto_108924 ) ( ON ?auto_108923 ?auto_108925 ) ( not ( = ?auto_108924 ?auto_108925 ) ) ( not ( = ?auto_108924 ?auto_108923 ) ) ( not ( = ?auto_108924 ?auto_108922 ) ) ( not ( = ?auto_108924 ?auto_108921 ) ) ( not ( = ?auto_108925 ?auto_108923 ) ) ( not ( = ?auto_108925 ?auto_108922 ) ) ( not ( = ?auto_108925 ?auto_108921 ) ) ( not ( = ?auto_108919 ?auto_108924 ) ) ( not ( = ?auto_108919 ?auto_108925 ) ) ( not ( = ?auto_108920 ?auto_108924 ) ) ( not ( = ?auto_108920 ?auto_108925 ) ) ( ON ?auto_108920 ?auto_108921 ) ( CLEAR ?auto_108920 ) ( HOLDING ?auto_108919 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108919 )
      ( MAKE-4PILE ?auto_108919 ?auto_108920 ?auto_108921 ?auto_108922 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108926 - BLOCK
      ?auto_108927 - BLOCK
      ?auto_108928 - BLOCK
      ?auto_108929 - BLOCK
    )
    :vars
    (
      ?auto_108931 - BLOCK
      ?auto_108930 - BLOCK
      ?auto_108932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108926 ?auto_108927 ) ) ( not ( = ?auto_108926 ?auto_108928 ) ) ( not ( = ?auto_108926 ?auto_108929 ) ) ( not ( = ?auto_108927 ?auto_108928 ) ) ( not ( = ?auto_108927 ?auto_108929 ) ) ( not ( = ?auto_108928 ?auto_108929 ) ) ( ON ?auto_108929 ?auto_108931 ) ( not ( = ?auto_108926 ?auto_108931 ) ) ( not ( = ?auto_108927 ?auto_108931 ) ) ( not ( = ?auto_108928 ?auto_108931 ) ) ( not ( = ?auto_108929 ?auto_108931 ) ) ( ON ?auto_108928 ?auto_108929 ) ( ON-TABLE ?auto_108930 ) ( ON ?auto_108932 ?auto_108930 ) ( ON ?auto_108931 ?auto_108932 ) ( not ( = ?auto_108930 ?auto_108932 ) ) ( not ( = ?auto_108930 ?auto_108931 ) ) ( not ( = ?auto_108930 ?auto_108929 ) ) ( not ( = ?auto_108930 ?auto_108928 ) ) ( not ( = ?auto_108932 ?auto_108931 ) ) ( not ( = ?auto_108932 ?auto_108929 ) ) ( not ( = ?auto_108932 ?auto_108928 ) ) ( not ( = ?auto_108926 ?auto_108930 ) ) ( not ( = ?auto_108926 ?auto_108932 ) ) ( not ( = ?auto_108927 ?auto_108930 ) ) ( not ( = ?auto_108927 ?auto_108932 ) ) ( ON ?auto_108927 ?auto_108928 ) ( ON ?auto_108926 ?auto_108927 ) ( CLEAR ?auto_108926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108930 ?auto_108932 ?auto_108931 ?auto_108929 ?auto_108928 ?auto_108927 )
      ( MAKE-4PILE ?auto_108926 ?auto_108927 ?auto_108928 ?auto_108929 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108933 - BLOCK
      ?auto_108934 - BLOCK
      ?auto_108935 - BLOCK
      ?auto_108936 - BLOCK
    )
    :vars
    (
      ?auto_108939 - BLOCK
      ?auto_108937 - BLOCK
      ?auto_108938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108933 ?auto_108934 ) ) ( not ( = ?auto_108933 ?auto_108935 ) ) ( not ( = ?auto_108933 ?auto_108936 ) ) ( not ( = ?auto_108934 ?auto_108935 ) ) ( not ( = ?auto_108934 ?auto_108936 ) ) ( not ( = ?auto_108935 ?auto_108936 ) ) ( ON ?auto_108936 ?auto_108939 ) ( not ( = ?auto_108933 ?auto_108939 ) ) ( not ( = ?auto_108934 ?auto_108939 ) ) ( not ( = ?auto_108935 ?auto_108939 ) ) ( not ( = ?auto_108936 ?auto_108939 ) ) ( ON ?auto_108935 ?auto_108936 ) ( ON-TABLE ?auto_108937 ) ( ON ?auto_108938 ?auto_108937 ) ( ON ?auto_108939 ?auto_108938 ) ( not ( = ?auto_108937 ?auto_108938 ) ) ( not ( = ?auto_108937 ?auto_108939 ) ) ( not ( = ?auto_108937 ?auto_108936 ) ) ( not ( = ?auto_108937 ?auto_108935 ) ) ( not ( = ?auto_108938 ?auto_108939 ) ) ( not ( = ?auto_108938 ?auto_108936 ) ) ( not ( = ?auto_108938 ?auto_108935 ) ) ( not ( = ?auto_108933 ?auto_108937 ) ) ( not ( = ?auto_108933 ?auto_108938 ) ) ( not ( = ?auto_108934 ?auto_108937 ) ) ( not ( = ?auto_108934 ?auto_108938 ) ) ( ON ?auto_108934 ?auto_108935 ) ( HOLDING ?auto_108933 ) ( CLEAR ?auto_108934 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108937 ?auto_108938 ?auto_108939 ?auto_108936 ?auto_108935 ?auto_108934 ?auto_108933 )
      ( MAKE-4PILE ?auto_108933 ?auto_108934 ?auto_108935 ?auto_108936 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108940 - BLOCK
      ?auto_108941 - BLOCK
      ?auto_108942 - BLOCK
      ?auto_108943 - BLOCK
    )
    :vars
    (
      ?auto_108945 - BLOCK
      ?auto_108946 - BLOCK
      ?auto_108944 - BLOCK
      ?auto_108947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108940 ?auto_108941 ) ) ( not ( = ?auto_108940 ?auto_108942 ) ) ( not ( = ?auto_108940 ?auto_108943 ) ) ( not ( = ?auto_108941 ?auto_108942 ) ) ( not ( = ?auto_108941 ?auto_108943 ) ) ( not ( = ?auto_108942 ?auto_108943 ) ) ( ON ?auto_108943 ?auto_108945 ) ( not ( = ?auto_108940 ?auto_108945 ) ) ( not ( = ?auto_108941 ?auto_108945 ) ) ( not ( = ?auto_108942 ?auto_108945 ) ) ( not ( = ?auto_108943 ?auto_108945 ) ) ( ON ?auto_108942 ?auto_108943 ) ( ON-TABLE ?auto_108946 ) ( ON ?auto_108944 ?auto_108946 ) ( ON ?auto_108945 ?auto_108944 ) ( not ( = ?auto_108946 ?auto_108944 ) ) ( not ( = ?auto_108946 ?auto_108945 ) ) ( not ( = ?auto_108946 ?auto_108943 ) ) ( not ( = ?auto_108946 ?auto_108942 ) ) ( not ( = ?auto_108944 ?auto_108945 ) ) ( not ( = ?auto_108944 ?auto_108943 ) ) ( not ( = ?auto_108944 ?auto_108942 ) ) ( not ( = ?auto_108940 ?auto_108946 ) ) ( not ( = ?auto_108940 ?auto_108944 ) ) ( not ( = ?auto_108941 ?auto_108946 ) ) ( not ( = ?auto_108941 ?auto_108944 ) ) ( ON ?auto_108941 ?auto_108942 ) ( CLEAR ?auto_108941 ) ( ON ?auto_108940 ?auto_108947 ) ( CLEAR ?auto_108940 ) ( HAND-EMPTY ) ( not ( = ?auto_108940 ?auto_108947 ) ) ( not ( = ?auto_108941 ?auto_108947 ) ) ( not ( = ?auto_108942 ?auto_108947 ) ) ( not ( = ?auto_108943 ?auto_108947 ) ) ( not ( = ?auto_108945 ?auto_108947 ) ) ( not ( = ?auto_108946 ?auto_108947 ) ) ( not ( = ?auto_108944 ?auto_108947 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108940 ?auto_108947 )
      ( MAKE-4PILE ?auto_108940 ?auto_108941 ?auto_108942 ?auto_108943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108948 - BLOCK
      ?auto_108949 - BLOCK
      ?auto_108950 - BLOCK
      ?auto_108951 - BLOCK
    )
    :vars
    (
      ?auto_108955 - BLOCK
      ?auto_108954 - BLOCK
      ?auto_108953 - BLOCK
      ?auto_108952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108948 ?auto_108949 ) ) ( not ( = ?auto_108948 ?auto_108950 ) ) ( not ( = ?auto_108948 ?auto_108951 ) ) ( not ( = ?auto_108949 ?auto_108950 ) ) ( not ( = ?auto_108949 ?auto_108951 ) ) ( not ( = ?auto_108950 ?auto_108951 ) ) ( ON ?auto_108951 ?auto_108955 ) ( not ( = ?auto_108948 ?auto_108955 ) ) ( not ( = ?auto_108949 ?auto_108955 ) ) ( not ( = ?auto_108950 ?auto_108955 ) ) ( not ( = ?auto_108951 ?auto_108955 ) ) ( ON ?auto_108950 ?auto_108951 ) ( ON-TABLE ?auto_108954 ) ( ON ?auto_108953 ?auto_108954 ) ( ON ?auto_108955 ?auto_108953 ) ( not ( = ?auto_108954 ?auto_108953 ) ) ( not ( = ?auto_108954 ?auto_108955 ) ) ( not ( = ?auto_108954 ?auto_108951 ) ) ( not ( = ?auto_108954 ?auto_108950 ) ) ( not ( = ?auto_108953 ?auto_108955 ) ) ( not ( = ?auto_108953 ?auto_108951 ) ) ( not ( = ?auto_108953 ?auto_108950 ) ) ( not ( = ?auto_108948 ?auto_108954 ) ) ( not ( = ?auto_108948 ?auto_108953 ) ) ( not ( = ?auto_108949 ?auto_108954 ) ) ( not ( = ?auto_108949 ?auto_108953 ) ) ( ON ?auto_108948 ?auto_108952 ) ( CLEAR ?auto_108948 ) ( not ( = ?auto_108948 ?auto_108952 ) ) ( not ( = ?auto_108949 ?auto_108952 ) ) ( not ( = ?auto_108950 ?auto_108952 ) ) ( not ( = ?auto_108951 ?auto_108952 ) ) ( not ( = ?auto_108955 ?auto_108952 ) ) ( not ( = ?auto_108954 ?auto_108952 ) ) ( not ( = ?auto_108953 ?auto_108952 ) ) ( HOLDING ?auto_108949 ) ( CLEAR ?auto_108950 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108954 ?auto_108953 ?auto_108955 ?auto_108951 ?auto_108950 ?auto_108949 )
      ( MAKE-4PILE ?auto_108948 ?auto_108949 ?auto_108950 ?auto_108951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108956 - BLOCK
      ?auto_108957 - BLOCK
      ?auto_108958 - BLOCK
      ?auto_108959 - BLOCK
    )
    :vars
    (
      ?auto_108962 - BLOCK
      ?auto_108961 - BLOCK
      ?auto_108963 - BLOCK
      ?auto_108960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108956 ?auto_108957 ) ) ( not ( = ?auto_108956 ?auto_108958 ) ) ( not ( = ?auto_108956 ?auto_108959 ) ) ( not ( = ?auto_108957 ?auto_108958 ) ) ( not ( = ?auto_108957 ?auto_108959 ) ) ( not ( = ?auto_108958 ?auto_108959 ) ) ( ON ?auto_108959 ?auto_108962 ) ( not ( = ?auto_108956 ?auto_108962 ) ) ( not ( = ?auto_108957 ?auto_108962 ) ) ( not ( = ?auto_108958 ?auto_108962 ) ) ( not ( = ?auto_108959 ?auto_108962 ) ) ( ON ?auto_108958 ?auto_108959 ) ( ON-TABLE ?auto_108961 ) ( ON ?auto_108963 ?auto_108961 ) ( ON ?auto_108962 ?auto_108963 ) ( not ( = ?auto_108961 ?auto_108963 ) ) ( not ( = ?auto_108961 ?auto_108962 ) ) ( not ( = ?auto_108961 ?auto_108959 ) ) ( not ( = ?auto_108961 ?auto_108958 ) ) ( not ( = ?auto_108963 ?auto_108962 ) ) ( not ( = ?auto_108963 ?auto_108959 ) ) ( not ( = ?auto_108963 ?auto_108958 ) ) ( not ( = ?auto_108956 ?auto_108961 ) ) ( not ( = ?auto_108956 ?auto_108963 ) ) ( not ( = ?auto_108957 ?auto_108961 ) ) ( not ( = ?auto_108957 ?auto_108963 ) ) ( ON ?auto_108956 ?auto_108960 ) ( not ( = ?auto_108956 ?auto_108960 ) ) ( not ( = ?auto_108957 ?auto_108960 ) ) ( not ( = ?auto_108958 ?auto_108960 ) ) ( not ( = ?auto_108959 ?auto_108960 ) ) ( not ( = ?auto_108962 ?auto_108960 ) ) ( not ( = ?auto_108961 ?auto_108960 ) ) ( not ( = ?auto_108963 ?auto_108960 ) ) ( CLEAR ?auto_108958 ) ( ON ?auto_108957 ?auto_108956 ) ( CLEAR ?auto_108957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108960 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108960 ?auto_108956 )
      ( MAKE-4PILE ?auto_108956 ?auto_108957 ?auto_108958 ?auto_108959 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108964 - BLOCK
      ?auto_108965 - BLOCK
      ?auto_108966 - BLOCK
      ?auto_108967 - BLOCK
    )
    :vars
    (
      ?auto_108969 - BLOCK
      ?auto_108970 - BLOCK
      ?auto_108971 - BLOCK
      ?auto_108968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108964 ?auto_108965 ) ) ( not ( = ?auto_108964 ?auto_108966 ) ) ( not ( = ?auto_108964 ?auto_108967 ) ) ( not ( = ?auto_108965 ?auto_108966 ) ) ( not ( = ?auto_108965 ?auto_108967 ) ) ( not ( = ?auto_108966 ?auto_108967 ) ) ( ON ?auto_108967 ?auto_108969 ) ( not ( = ?auto_108964 ?auto_108969 ) ) ( not ( = ?auto_108965 ?auto_108969 ) ) ( not ( = ?auto_108966 ?auto_108969 ) ) ( not ( = ?auto_108967 ?auto_108969 ) ) ( ON-TABLE ?auto_108970 ) ( ON ?auto_108971 ?auto_108970 ) ( ON ?auto_108969 ?auto_108971 ) ( not ( = ?auto_108970 ?auto_108971 ) ) ( not ( = ?auto_108970 ?auto_108969 ) ) ( not ( = ?auto_108970 ?auto_108967 ) ) ( not ( = ?auto_108970 ?auto_108966 ) ) ( not ( = ?auto_108971 ?auto_108969 ) ) ( not ( = ?auto_108971 ?auto_108967 ) ) ( not ( = ?auto_108971 ?auto_108966 ) ) ( not ( = ?auto_108964 ?auto_108970 ) ) ( not ( = ?auto_108964 ?auto_108971 ) ) ( not ( = ?auto_108965 ?auto_108970 ) ) ( not ( = ?auto_108965 ?auto_108971 ) ) ( ON ?auto_108964 ?auto_108968 ) ( not ( = ?auto_108964 ?auto_108968 ) ) ( not ( = ?auto_108965 ?auto_108968 ) ) ( not ( = ?auto_108966 ?auto_108968 ) ) ( not ( = ?auto_108967 ?auto_108968 ) ) ( not ( = ?auto_108969 ?auto_108968 ) ) ( not ( = ?auto_108970 ?auto_108968 ) ) ( not ( = ?auto_108971 ?auto_108968 ) ) ( ON ?auto_108965 ?auto_108964 ) ( CLEAR ?auto_108965 ) ( ON-TABLE ?auto_108968 ) ( HOLDING ?auto_108966 ) ( CLEAR ?auto_108967 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108970 ?auto_108971 ?auto_108969 ?auto_108967 ?auto_108966 )
      ( MAKE-4PILE ?auto_108964 ?auto_108965 ?auto_108966 ?auto_108967 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108972 - BLOCK
      ?auto_108973 - BLOCK
      ?auto_108974 - BLOCK
      ?auto_108975 - BLOCK
    )
    :vars
    (
      ?auto_108979 - BLOCK
      ?auto_108976 - BLOCK
      ?auto_108978 - BLOCK
      ?auto_108977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108972 ?auto_108973 ) ) ( not ( = ?auto_108972 ?auto_108974 ) ) ( not ( = ?auto_108972 ?auto_108975 ) ) ( not ( = ?auto_108973 ?auto_108974 ) ) ( not ( = ?auto_108973 ?auto_108975 ) ) ( not ( = ?auto_108974 ?auto_108975 ) ) ( ON ?auto_108975 ?auto_108979 ) ( not ( = ?auto_108972 ?auto_108979 ) ) ( not ( = ?auto_108973 ?auto_108979 ) ) ( not ( = ?auto_108974 ?auto_108979 ) ) ( not ( = ?auto_108975 ?auto_108979 ) ) ( ON-TABLE ?auto_108976 ) ( ON ?auto_108978 ?auto_108976 ) ( ON ?auto_108979 ?auto_108978 ) ( not ( = ?auto_108976 ?auto_108978 ) ) ( not ( = ?auto_108976 ?auto_108979 ) ) ( not ( = ?auto_108976 ?auto_108975 ) ) ( not ( = ?auto_108976 ?auto_108974 ) ) ( not ( = ?auto_108978 ?auto_108979 ) ) ( not ( = ?auto_108978 ?auto_108975 ) ) ( not ( = ?auto_108978 ?auto_108974 ) ) ( not ( = ?auto_108972 ?auto_108976 ) ) ( not ( = ?auto_108972 ?auto_108978 ) ) ( not ( = ?auto_108973 ?auto_108976 ) ) ( not ( = ?auto_108973 ?auto_108978 ) ) ( ON ?auto_108972 ?auto_108977 ) ( not ( = ?auto_108972 ?auto_108977 ) ) ( not ( = ?auto_108973 ?auto_108977 ) ) ( not ( = ?auto_108974 ?auto_108977 ) ) ( not ( = ?auto_108975 ?auto_108977 ) ) ( not ( = ?auto_108979 ?auto_108977 ) ) ( not ( = ?auto_108976 ?auto_108977 ) ) ( not ( = ?auto_108978 ?auto_108977 ) ) ( ON ?auto_108973 ?auto_108972 ) ( ON-TABLE ?auto_108977 ) ( CLEAR ?auto_108975 ) ( ON ?auto_108974 ?auto_108973 ) ( CLEAR ?auto_108974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108977 ?auto_108972 ?auto_108973 )
      ( MAKE-4PILE ?auto_108972 ?auto_108973 ?auto_108974 ?auto_108975 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108980 - BLOCK
      ?auto_108981 - BLOCK
      ?auto_108982 - BLOCK
      ?auto_108983 - BLOCK
    )
    :vars
    (
      ?auto_108987 - BLOCK
      ?auto_108986 - BLOCK
      ?auto_108985 - BLOCK
      ?auto_108984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108980 ?auto_108981 ) ) ( not ( = ?auto_108980 ?auto_108982 ) ) ( not ( = ?auto_108980 ?auto_108983 ) ) ( not ( = ?auto_108981 ?auto_108982 ) ) ( not ( = ?auto_108981 ?auto_108983 ) ) ( not ( = ?auto_108982 ?auto_108983 ) ) ( not ( = ?auto_108980 ?auto_108987 ) ) ( not ( = ?auto_108981 ?auto_108987 ) ) ( not ( = ?auto_108982 ?auto_108987 ) ) ( not ( = ?auto_108983 ?auto_108987 ) ) ( ON-TABLE ?auto_108986 ) ( ON ?auto_108985 ?auto_108986 ) ( ON ?auto_108987 ?auto_108985 ) ( not ( = ?auto_108986 ?auto_108985 ) ) ( not ( = ?auto_108986 ?auto_108987 ) ) ( not ( = ?auto_108986 ?auto_108983 ) ) ( not ( = ?auto_108986 ?auto_108982 ) ) ( not ( = ?auto_108985 ?auto_108987 ) ) ( not ( = ?auto_108985 ?auto_108983 ) ) ( not ( = ?auto_108985 ?auto_108982 ) ) ( not ( = ?auto_108980 ?auto_108986 ) ) ( not ( = ?auto_108980 ?auto_108985 ) ) ( not ( = ?auto_108981 ?auto_108986 ) ) ( not ( = ?auto_108981 ?auto_108985 ) ) ( ON ?auto_108980 ?auto_108984 ) ( not ( = ?auto_108980 ?auto_108984 ) ) ( not ( = ?auto_108981 ?auto_108984 ) ) ( not ( = ?auto_108982 ?auto_108984 ) ) ( not ( = ?auto_108983 ?auto_108984 ) ) ( not ( = ?auto_108987 ?auto_108984 ) ) ( not ( = ?auto_108986 ?auto_108984 ) ) ( not ( = ?auto_108985 ?auto_108984 ) ) ( ON ?auto_108981 ?auto_108980 ) ( ON-TABLE ?auto_108984 ) ( ON ?auto_108982 ?auto_108981 ) ( CLEAR ?auto_108982 ) ( HOLDING ?auto_108983 ) ( CLEAR ?auto_108987 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108986 ?auto_108985 ?auto_108987 ?auto_108983 )
      ( MAKE-4PILE ?auto_108980 ?auto_108981 ?auto_108982 ?auto_108983 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108988 - BLOCK
      ?auto_108989 - BLOCK
      ?auto_108990 - BLOCK
      ?auto_108991 - BLOCK
    )
    :vars
    (
      ?auto_108992 - BLOCK
      ?auto_108995 - BLOCK
      ?auto_108994 - BLOCK
      ?auto_108993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108988 ?auto_108989 ) ) ( not ( = ?auto_108988 ?auto_108990 ) ) ( not ( = ?auto_108988 ?auto_108991 ) ) ( not ( = ?auto_108989 ?auto_108990 ) ) ( not ( = ?auto_108989 ?auto_108991 ) ) ( not ( = ?auto_108990 ?auto_108991 ) ) ( not ( = ?auto_108988 ?auto_108992 ) ) ( not ( = ?auto_108989 ?auto_108992 ) ) ( not ( = ?auto_108990 ?auto_108992 ) ) ( not ( = ?auto_108991 ?auto_108992 ) ) ( ON-TABLE ?auto_108995 ) ( ON ?auto_108994 ?auto_108995 ) ( ON ?auto_108992 ?auto_108994 ) ( not ( = ?auto_108995 ?auto_108994 ) ) ( not ( = ?auto_108995 ?auto_108992 ) ) ( not ( = ?auto_108995 ?auto_108991 ) ) ( not ( = ?auto_108995 ?auto_108990 ) ) ( not ( = ?auto_108994 ?auto_108992 ) ) ( not ( = ?auto_108994 ?auto_108991 ) ) ( not ( = ?auto_108994 ?auto_108990 ) ) ( not ( = ?auto_108988 ?auto_108995 ) ) ( not ( = ?auto_108988 ?auto_108994 ) ) ( not ( = ?auto_108989 ?auto_108995 ) ) ( not ( = ?auto_108989 ?auto_108994 ) ) ( ON ?auto_108988 ?auto_108993 ) ( not ( = ?auto_108988 ?auto_108993 ) ) ( not ( = ?auto_108989 ?auto_108993 ) ) ( not ( = ?auto_108990 ?auto_108993 ) ) ( not ( = ?auto_108991 ?auto_108993 ) ) ( not ( = ?auto_108992 ?auto_108993 ) ) ( not ( = ?auto_108995 ?auto_108993 ) ) ( not ( = ?auto_108994 ?auto_108993 ) ) ( ON ?auto_108989 ?auto_108988 ) ( ON-TABLE ?auto_108993 ) ( ON ?auto_108990 ?auto_108989 ) ( CLEAR ?auto_108992 ) ( ON ?auto_108991 ?auto_108990 ) ( CLEAR ?auto_108991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108993 ?auto_108988 ?auto_108989 ?auto_108990 )
      ( MAKE-4PILE ?auto_108988 ?auto_108989 ?auto_108990 ?auto_108991 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_108996 - BLOCK
      ?auto_108997 - BLOCK
      ?auto_108998 - BLOCK
      ?auto_108999 - BLOCK
    )
    :vars
    (
      ?auto_109001 - BLOCK
      ?auto_109002 - BLOCK
      ?auto_109003 - BLOCK
      ?auto_109000 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108996 ?auto_108997 ) ) ( not ( = ?auto_108996 ?auto_108998 ) ) ( not ( = ?auto_108996 ?auto_108999 ) ) ( not ( = ?auto_108997 ?auto_108998 ) ) ( not ( = ?auto_108997 ?auto_108999 ) ) ( not ( = ?auto_108998 ?auto_108999 ) ) ( not ( = ?auto_108996 ?auto_109001 ) ) ( not ( = ?auto_108997 ?auto_109001 ) ) ( not ( = ?auto_108998 ?auto_109001 ) ) ( not ( = ?auto_108999 ?auto_109001 ) ) ( ON-TABLE ?auto_109002 ) ( ON ?auto_109003 ?auto_109002 ) ( not ( = ?auto_109002 ?auto_109003 ) ) ( not ( = ?auto_109002 ?auto_109001 ) ) ( not ( = ?auto_109002 ?auto_108999 ) ) ( not ( = ?auto_109002 ?auto_108998 ) ) ( not ( = ?auto_109003 ?auto_109001 ) ) ( not ( = ?auto_109003 ?auto_108999 ) ) ( not ( = ?auto_109003 ?auto_108998 ) ) ( not ( = ?auto_108996 ?auto_109002 ) ) ( not ( = ?auto_108996 ?auto_109003 ) ) ( not ( = ?auto_108997 ?auto_109002 ) ) ( not ( = ?auto_108997 ?auto_109003 ) ) ( ON ?auto_108996 ?auto_109000 ) ( not ( = ?auto_108996 ?auto_109000 ) ) ( not ( = ?auto_108997 ?auto_109000 ) ) ( not ( = ?auto_108998 ?auto_109000 ) ) ( not ( = ?auto_108999 ?auto_109000 ) ) ( not ( = ?auto_109001 ?auto_109000 ) ) ( not ( = ?auto_109002 ?auto_109000 ) ) ( not ( = ?auto_109003 ?auto_109000 ) ) ( ON ?auto_108997 ?auto_108996 ) ( ON-TABLE ?auto_109000 ) ( ON ?auto_108998 ?auto_108997 ) ( ON ?auto_108999 ?auto_108998 ) ( CLEAR ?auto_108999 ) ( HOLDING ?auto_109001 ) ( CLEAR ?auto_109003 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109002 ?auto_109003 ?auto_109001 )
      ( MAKE-4PILE ?auto_108996 ?auto_108997 ?auto_108998 ?auto_108999 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109004 - BLOCK
      ?auto_109005 - BLOCK
      ?auto_109006 - BLOCK
      ?auto_109007 - BLOCK
    )
    :vars
    (
      ?auto_109010 - BLOCK
      ?auto_109008 - BLOCK
      ?auto_109009 - BLOCK
      ?auto_109011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109004 ?auto_109005 ) ) ( not ( = ?auto_109004 ?auto_109006 ) ) ( not ( = ?auto_109004 ?auto_109007 ) ) ( not ( = ?auto_109005 ?auto_109006 ) ) ( not ( = ?auto_109005 ?auto_109007 ) ) ( not ( = ?auto_109006 ?auto_109007 ) ) ( not ( = ?auto_109004 ?auto_109010 ) ) ( not ( = ?auto_109005 ?auto_109010 ) ) ( not ( = ?auto_109006 ?auto_109010 ) ) ( not ( = ?auto_109007 ?auto_109010 ) ) ( ON-TABLE ?auto_109008 ) ( ON ?auto_109009 ?auto_109008 ) ( not ( = ?auto_109008 ?auto_109009 ) ) ( not ( = ?auto_109008 ?auto_109010 ) ) ( not ( = ?auto_109008 ?auto_109007 ) ) ( not ( = ?auto_109008 ?auto_109006 ) ) ( not ( = ?auto_109009 ?auto_109010 ) ) ( not ( = ?auto_109009 ?auto_109007 ) ) ( not ( = ?auto_109009 ?auto_109006 ) ) ( not ( = ?auto_109004 ?auto_109008 ) ) ( not ( = ?auto_109004 ?auto_109009 ) ) ( not ( = ?auto_109005 ?auto_109008 ) ) ( not ( = ?auto_109005 ?auto_109009 ) ) ( ON ?auto_109004 ?auto_109011 ) ( not ( = ?auto_109004 ?auto_109011 ) ) ( not ( = ?auto_109005 ?auto_109011 ) ) ( not ( = ?auto_109006 ?auto_109011 ) ) ( not ( = ?auto_109007 ?auto_109011 ) ) ( not ( = ?auto_109010 ?auto_109011 ) ) ( not ( = ?auto_109008 ?auto_109011 ) ) ( not ( = ?auto_109009 ?auto_109011 ) ) ( ON ?auto_109005 ?auto_109004 ) ( ON-TABLE ?auto_109011 ) ( ON ?auto_109006 ?auto_109005 ) ( ON ?auto_109007 ?auto_109006 ) ( CLEAR ?auto_109009 ) ( ON ?auto_109010 ?auto_109007 ) ( CLEAR ?auto_109010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109011 ?auto_109004 ?auto_109005 ?auto_109006 ?auto_109007 )
      ( MAKE-4PILE ?auto_109004 ?auto_109005 ?auto_109006 ?auto_109007 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109012 - BLOCK
      ?auto_109013 - BLOCK
      ?auto_109014 - BLOCK
      ?auto_109015 - BLOCK
    )
    :vars
    (
      ?auto_109019 - BLOCK
      ?auto_109017 - BLOCK
      ?auto_109018 - BLOCK
      ?auto_109016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109012 ?auto_109013 ) ) ( not ( = ?auto_109012 ?auto_109014 ) ) ( not ( = ?auto_109012 ?auto_109015 ) ) ( not ( = ?auto_109013 ?auto_109014 ) ) ( not ( = ?auto_109013 ?auto_109015 ) ) ( not ( = ?auto_109014 ?auto_109015 ) ) ( not ( = ?auto_109012 ?auto_109019 ) ) ( not ( = ?auto_109013 ?auto_109019 ) ) ( not ( = ?auto_109014 ?auto_109019 ) ) ( not ( = ?auto_109015 ?auto_109019 ) ) ( ON-TABLE ?auto_109017 ) ( not ( = ?auto_109017 ?auto_109018 ) ) ( not ( = ?auto_109017 ?auto_109019 ) ) ( not ( = ?auto_109017 ?auto_109015 ) ) ( not ( = ?auto_109017 ?auto_109014 ) ) ( not ( = ?auto_109018 ?auto_109019 ) ) ( not ( = ?auto_109018 ?auto_109015 ) ) ( not ( = ?auto_109018 ?auto_109014 ) ) ( not ( = ?auto_109012 ?auto_109017 ) ) ( not ( = ?auto_109012 ?auto_109018 ) ) ( not ( = ?auto_109013 ?auto_109017 ) ) ( not ( = ?auto_109013 ?auto_109018 ) ) ( ON ?auto_109012 ?auto_109016 ) ( not ( = ?auto_109012 ?auto_109016 ) ) ( not ( = ?auto_109013 ?auto_109016 ) ) ( not ( = ?auto_109014 ?auto_109016 ) ) ( not ( = ?auto_109015 ?auto_109016 ) ) ( not ( = ?auto_109019 ?auto_109016 ) ) ( not ( = ?auto_109017 ?auto_109016 ) ) ( not ( = ?auto_109018 ?auto_109016 ) ) ( ON ?auto_109013 ?auto_109012 ) ( ON-TABLE ?auto_109016 ) ( ON ?auto_109014 ?auto_109013 ) ( ON ?auto_109015 ?auto_109014 ) ( ON ?auto_109019 ?auto_109015 ) ( CLEAR ?auto_109019 ) ( HOLDING ?auto_109018 ) ( CLEAR ?auto_109017 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109017 ?auto_109018 )
      ( MAKE-4PILE ?auto_109012 ?auto_109013 ?auto_109014 ?auto_109015 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109020 - BLOCK
      ?auto_109021 - BLOCK
      ?auto_109022 - BLOCK
      ?auto_109023 - BLOCK
    )
    :vars
    (
      ?auto_109025 - BLOCK
      ?auto_109027 - BLOCK
      ?auto_109026 - BLOCK
      ?auto_109024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109020 ?auto_109021 ) ) ( not ( = ?auto_109020 ?auto_109022 ) ) ( not ( = ?auto_109020 ?auto_109023 ) ) ( not ( = ?auto_109021 ?auto_109022 ) ) ( not ( = ?auto_109021 ?auto_109023 ) ) ( not ( = ?auto_109022 ?auto_109023 ) ) ( not ( = ?auto_109020 ?auto_109025 ) ) ( not ( = ?auto_109021 ?auto_109025 ) ) ( not ( = ?auto_109022 ?auto_109025 ) ) ( not ( = ?auto_109023 ?auto_109025 ) ) ( ON-TABLE ?auto_109027 ) ( not ( = ?auto_109027 ?auto_109026 ) ) ( not ( = ?auto_109027 ?auto_109025 ) ) ( not ( = ?auto_109027 ?auto_109023 ) ) ( not ( = ?auto_109027 ?auto_109022 ) ) ( not ( = ?auto_109026 ?auto_109025 ) ) ( not ( = ?auto_109026 ?auto_109023 ) ) ( not ( = ?auto_109026 ?auto_109022 ) ) ( not ( = ?auto_109020 ?auto_109027 ) ) ( not ( = ?auto_109020 ?auto_109026 ) ) ( not ( = ?auto_109021 ?auto_109027 ) ) ( not ( = ?auto_109021 ?auto_109026 ) ) ( ON ?auto_109020 ?auto_109024 ) ( not ( = ?auto_109020 ?auto_109024 ) ) ( not ( = ?auto_109021 ?auto_109024 ) ) ( not ( = ?auto_109022 ?auto_109024 ) ) ( not ( = ?auto_109023 ?auto_109024 ) ) ( not ( = ?auto_109025 ?auto_109024 ) ) ( not ( = ?auto_109027 ?auto_109024 ) ) ( not ( = ?auto_109026 ?auto_109024 ) ) ( ON ?auto_109021 ?auto_109020 ) ( ON-TABLE ?auto_109024 ) ( ON ?auto_109022 ?auto_109021 ) ( ON ?auto_109023 ?auto_109022 ) ( ON ?auto_109025 ?auto_109023 ) ( CLEAR ?auto_109027 ) ( ON ?auto_109026 ?auto_109025 ) ( CLEAR ?auto_109026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109024 ?auto_109020 ?auto_109021 ?auto_109022 ?auto_109023 ?auto_109025 )
      ( MAKE-4PILE ?auto_109020 ?auto_109021 ?auto_109022 ?auto_109023 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109028 - BLOCK
      ?auto_109029 - BLOCK
      ?auto_109030 - BLOCK
      ?auto_109031 - BLOCK
    )
    :vars
    (
      ?auto_109034 - BLOCK
      ?auto_109032 - BLOCK
      ?auto_109035 - BLOCK
      ?auto_109033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109028 ?auto_109029 ) ) ( not ( = ?auto_109028 ?auto_109030 ) ) ( not ( = ?auto_109028 ?auto_109031 ) ) ( not ( = ?auto_109029 ?auto_109030 ) ) ( not ( = ?auto_109029 ?auto_109031 ) ) ( not ( = ?auto_109030 ?auto_109031 ) ) ( not ( = ?auto_109028 ?auto_109034 ) ) ( not ( = ?auto_109029 ?auto_109034 ) ) ( not ( = ?auto_109030 ?auto_109034 ) ) ( not ( = ?auto_109031 ?auto_109034 ) ) ( not ( = ?auto_109032 ?auto_109035 ) ) ( not ( = ?auto_109032 ?auto_109034 ) ) ( not ( = ?auto_109032 ?auto_109031 ) ) ( not ( = ?auto_109032 ?auto_109030 ) ) ( not ( = ?auto_109035 ?auto_109034 ) ) ( not ( = ?auto_109035 ?auto_109031 ) ) ( not ( = ?auto_109035 ?auto_109030 ) ) ( not ( = ?auto_109028 ?auto_109032 ) ) ( not ( = ?auto_109028 ?auto_109035 ) ) ( not ( = ?auto_109029 ?auto_109032 ) ) ( not ( = ?auto_109029 ?auto_109035 ) ) ( ON ?auto_109028 ?auto_109033 ) ( not ( = ?auto_109028 ?auto_109033 ) ) ( not ( = ?auto_109029 ?auto_109033 ) ) ( not ( = ?auto_109030 ?auto_109033 ) ) ( not ( = ?auto_109031 ?auto_109033 ) ) ( not ( = ?auto_109034 ?auto_109033 ) ) ( not ( = ?auto_109032 ?auto_109033 ) ) ( not ( = ?auto_109035 ?auto_109033 ) ) ( ON ?auto_109029 ?auto_109028 ) ( ON-TABLE ?auto_109033 ) ( ON ?auto_109030 ?auto_109029 ) ( ON ?auto_109031 ?auto_109030 ) ( ON ?auto_109034 ?auto_109031 ) ( ON ?auto_109035 ?auto_109034 ) ( CLEAR ?auto_109035 ) ( HOLDING ?auto_109032 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109032 )
      ( MAKE-4PILE ?auto_109028 ?auto_109029 ?auto_109030 ?auto_109031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_109036 - BLOCK
      ?auto_109037 - BLOCK
      ?auto_109038 - BLOCK
      ?auto_109039 - BLOCK
    )
    :vars
    (
      ?auto_109040 - BLOCK
      ?auto_109042 - BLOCK
      ?auto_109043 - BLOCK
      ?auto_109041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109036 ?auto_109037 ) ) ( not ( = ?auto_109036 ?auto_109038 ) ) ( not ( = ?auto_109036 ?auto_109039 ) ) ( not ( = ?auto_109037 ?auto_109038 ) ) ( not ( = ?auto_109037 ?auto_109039 ) ) ( not ( = ?auto_109038 ?auto_109039 ) ) ( not ( = ?auto_109036 ?auto_109040 ) ) ( not ( = ?auto_109037 ?auto_109040 ) ) ( not ( = ?auto_109038 ?auto_109040 ) ) ( not ( = ?auto_109039 ?auto_109040 ) ) ( not ( = ?auto_109042 ?auto_109043 ) ) ( not ( = ?auto_109042 ?auto_109040 ) ) ( not ( = ?auto_109042 ?auto_109039 ) ) ( not ( = ?auto_109042 ?auto_109038 ) ) ( not ( = ?auto_109043 ?auto_109040 ) ) ( not ( = ?auto_109043 ?auto_109039 ) ) ( not ( = ?auto_109043 ?auto_109038 ) ) ( not ( = ?auto_109036 ?auto_109042 ) ) ( not ( = ?auto_109036 ?auto_109043 ) ) ( not ( = ?auto_109037 ?auto_109042 ) ) ( not ( = ?auto_109037 ?auto_109043 ) ) ( ON ?auto_109036 ?auto_109041 ) ( not ( = ?auto_109036 ?auto_109041 ) ) ( not ( = ?auto_109037 ?auto_109041 ) ) ( not ( = ?auto_109038 ?auto_109041 ) ) ( not ( = ?auto_109039 ?auto_109041 ) ) ( not ( = ?auto_109040 ?auto_109041 ) ) ( not ( = ?auto_109042 ?auto_109041 ) ) ( not ( = ?auto_109043 ?auto_109041 ) ) ( ON ?auto_109037 ?auto_109036 ) ( ON-TABLE ?auto_109041 ) ( ON ?auto_109038 ?auto_109037 ) ( ON ?auto_109039 ?auto_109038 ) ( ON ?auto_109040 ?auto_109039 ) ( ON ?auto_109043 ?auto_109040 ) ( ON ?auto_109042 ?auto_109043 ) ( CLEAR ?auto_109042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109041 ?auto_109036 ?auto_109037 ?auto_109038 ?auto_109039 ?auto_109040 ?auto_109043 )
      ( MAKE-4PILE ?auto_109036 ?auto_109037 ?auto_109038 ?auto_109039 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109046 - BLOCK
      ?auto_109047 - BLOCK
    )
    :vars
    (
      ?auto_109048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109048 ?auto_109047 ) ( CLEAR ?auto_109048 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109046 ) ( ON ?auto_109047 ?auto_109046 ) ( not ( = ?auto_109046 ?auto_109047 ) ) ( not ( = ?auto_109046 ?auto_109048 ) ) ( not ( = ?auto_109047 ?auto_109048 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109048 ?auto_109047 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109049 - BLOCK
      ?auto_109050 - BLOCK
    )
    :vars
    (
      ?auto_109051 - BLOCK
      ?auto_109052 - BLOCK
      ?auto_109053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109051 ?auto_109050 ) ( CLEAR ?auto_109051 ) ( ON-TABLE ?auto_109049 ) ( ON ?auto_109050 ?auto_109049 ) ( not ( = ?auto_109049 ?auto_109050 ) ) ( not ( = ?auto_109049 ?auto_109051 ) ) ( not ( = ?auto_109050 ?auto_109051 ) ) ( HOLDING ?auto_109052 ) ( CLEAR ?auto_109053 ) ( not ( = ?auto_109049 ?auto_109052 ) ) ( not ( = ?auto_109049 ?auto_109053 ) ) ( not ( = ?auto_109050 ?auto_109052 ) ) ( not ( = ?auto_109050 ?auto_109053 ) ) ( not ( = ?auto_109051 ?auto_109052 ) ) ( not ( = ?auto_109051 ?auto_109053 ) ) ( not ( = ?auto_109052 ?auto_109053 ) ) )
    :subtasks
    ( ( !STACK ?auto_109052 ?auto_109053 )
      ( MAKE-2PILE ?auto_109049 ?auto_109050 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109054 - BLOCK
      ?auto_109055 - BLOCK
    )
    :vars
    (
      ?auto_109056 - BLOCK
      ?auto_109058 - BLOCK
      ?auto_109057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109056 ?auto_109055 ) ( ON-TABLE ?auto_109054 ) ( ON ?auto_109055 ?auto_109054 ) ( not ( = ?auto_109054 ?auto_109055 ) ) ( not ( = ?auto_109054 ?auto_109056 ) ) ( not ( = ?auto_109055 ?auto_109056 ) ) ( CLEAR ?auto_109058 ) ( not ( = ?auto_109054 ?auto_109057 ) ) ( not ( = ?auto_109054 ?auto_109058 ) ) ( not ( = ?auto_109055 ?auto_109057 ) ) ( not ( = ?auto_109055 ?auto_109058 ) ) ( not ( = ?auto_109056 ?auto_109057 ) ) ( not ( = ?auto_109056 ?auto_109058 ) ) ( not ( = ?auto_109057 ?auto_109058 ) ) ( ON ?auto_109057 ?auto_109056 ) ( CLEAR ?auto_109057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109054 ?auto_109055 ?auto_109056 )
      ( MAKE-2PILE ?auto_109054 ?auto_109055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109059 - BLOCK
      ?auto_109060 - BLOCK
    )
    :vars
    (
      ?auto_109063 - BLOCK
      ?auto_109062 - BLOCK
      ?auto_109061 - BLOCK
      ?auto_109064 - BLOCK
      ?auto_109065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109063 ?auto_109060 ) ( ON-TABLE ?auto_109059 ) ( ON ?auto_109060 ?auto_109059 ) ( not ( = ?auto_109059 ?auto_109060 ) ) ( not ( = ?auto_109059 ?auto_109063 ) ) ( not ( = ?auto_109060 ?auto_109063 ) ) ( not ( = ?auto_109059 ?auto_109062 ) ) ( not ( = ?auto_109059 ?auto_109061 ) ) ( not ( = ?auto_109060 ?auto_109062 ) ) ( not ( = ?auto_109060 ?auto_109061 ) ) ( not ( = ?auto_109063 ?auto_109062 ) ) ( not ( = ?auto_109063 ?auto_109061 ) ) ( not ( = ?auto_109062 ?auto_109061 ) ) ( ON ?auto_109062 ?auto_109063 ) ( CLEAR ?auto_109062 ) ( HOLDING ?auto_109061 ) ( CLEAR ?auto_109064 ) ( ON-TABLE ?auto_109065 ) ( ON ?auto_109064 ?auto_109065 ) ( not ( = ?auto_109065 ?auto_109064 ) ) ( not ( = ?auto_109065 ?auto_109061 ) ) ( not ( = ?auto_109064 ?auto_109061 ) ) ( not ( = ?auto_109059 ?auto_109064 ) ) ( not ( = ?auto_109059 ?auto_109065 ) ) ( not ( = ?auto_109060 ?auto_109064 ) ) ( not ( = ?auto_109060 ?auto_109065 ) ) ( not ( = ?auto_109063 ?auto_109064 ) ) ( not ( = ?auto_109063 ?auto_109065 ) ) ( not ( = ?auto_109062 ?auto_109064 ) ) ( not ( = ?auto_109062 ?auto_109065 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109065 ?auto_109064 ?auto_109061 )
      ( MAKE-2PILE ?auto_109059 ?auto_109060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109066 - BLOCK
      ?auto_109067 - BLOCK
    )
    :vars
    (
      ?auto_109070 - BLOCK
      ?auto_109072 - BLOCK
      ?auto_109071 - BLOCK
      ?auto_109068 - BLOCK
      ?auto_109069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109070 ?auto_109067 ) ( ON-TABLE ?auto_109066 ) ( ON ?auto_109067 ?auto_109066 ) ( not ( = ?auto_109066 ?auto_109067 ) ) ( not ( = ?auto_109066 ?auto_109070 ) ) ( not ( = ?auto_109067 ?auto_109070 ) ) ( not ( = ?auto_109066 ?auto_109072 ) ) ( not ( = ?auto_109066 ?auto_109071 ) ) ( not ( = ?auto_109067 ?auto_109072 ) ) ( not ( = ?auto_109067 ?auto_109071 ) ) ( not ( = ?auto_109070 ?auto_109072 ) ) ( not ( = ?auto_109070 ?auto_109071 ) ) ( not ( = ?auto_109072 ?auto_109071 ) ) ( ON ?auto_109072 ?auto_109070 ) ( CLEAR ?auto_109068 ) ( ON-TABLE ?auto_109069 ) ( ON ?auto_109068 ?auto_109069 ) ( not ( = ?auto_109069 ?auto_109068 ) ) ( not ( = ?auto_109069 ?auto_109071 ) ) ( not ( = ?auto_109068 ?auto_109071 ) ) ( not ( = ?auto_109066 ?auto_109068 ) ) ( not ( = ?auto_109066 ?auto_109069 ) ) ( not ( = ?auto_109067 ?auto_109068 ) ) ( not ( = ?auto_109067 ?auto_109069 ) ) ( not ( = ?auto_109070 ?auto_109068 ) ) ( not ( = ?auto_109070 ?auto_109069 ) ) ( not ( = ?auto_109072 ?auto_109068 ) ) ( not ( = ?auto_109072 ?auto_109069 ) ) ( ON ?auto_109071 ?auto_109072 ) ( CLEAR ?auto_109071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109066 ?auto_109067 ?auto_109070 ?auto_109072 )
      ( MAKE-2PILE ?auto_109066 ?auto_109067 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109073 - BLOCK
      ?auto_109074 - BLOCK
    )
    :vars
    (
      ?auto_109076 - BLOCK
      ?auto_109077 - BLOCK
      ?auto_109075 - BLOCK
      ?auto_109079 - BLOCK
      ?auto_109078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109076 ?auto_109074 ) ( ON-TABLE ?auto_109073 ) ( ON ?auto_109074 ?auto_109073 ) ( not ( = ?auto_109073 ?auto_109074 ) ) ( not ( = ?auto_109073 ?auto_109076 ) ) ( not ( = ?auto_109074 ?auto_109076 ) ) ( not ( = ?auto_109073 ?auto_109077 ) ) ( not ( = ?auto_109073 ?auto_109075 ) ) ( not ( = ?auto_109074 ?auto_109077 ) ) ( not ( = ?auto_109074 ?auto_109075 ) ) ( not ( = ?auto_109076 ?auto_109077 ) ) ( not ( = ?auto_109076 ?auto_109075 ) ) ( not ( = ?auto_109077 ?auto_109075 ) ) ( ON ?auto_109077 ?auto_109076 ) ( ON-TABLE ?auto_109079 ) ( not ( = ?auto_109079 ?auto_109078 ) ) ( not ( = ?auto_109079 ?auto_109075 ) ) ( not ( = ?auto_109078 ?auto_109075 ) ) ( not ( = ?auto_109073 ?auto_109078 ) ) ( not ( = ?auto_109073 ?auto_109079 ) ) ( not ( = ?auto_109074 ?auto_109078 ) ) ( not ( = ?auto_109074 ?auto_109079 ) ) ( not ( = ?auto_109076 ?auto_109078 ) ) ( not ( = ?auto_109076 ?auto_109079 ) ) ( not ( = ?auto_109077 ?auto_109078 ) ) ( not ( = ?auto_109077 ?auto_109079 ) ) ( ON ?auto_109075 ?auto_109077 ) ( CLEAR ?auto_109075 ) ( HOLDING ?auto_109078 ) ( CLEAR ?auto_109079 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109079 ?auto_109078 )
      ( MAKE-2PILE ?auto_109073 ?auto_109074 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109080 - BLOCK
      ?auto_109081 - BLOCK
    )
    :vars
    (
      ?auto_109084 - BLOCK
      ?auto_109086 - BLOCK
      ?auto_109082 - BLOCK
      ?auto_109085 - BLOCK
      ?auto_109083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109084 ?auto_109081 ) ( ON-TABLE ?auto_109080 ) ( ON ?auto_109081 ?auto_109080 ) ( not ( = ?auto_109080 ?auto_109081 ) ) ( not ( = ?auto_109080 ?auto_109084 ) ) ( not ( = ?auto_109081 ?auto_109084 ) ) ( not ( = ?auto_109080 ?auto_109086 ) ) ( not ( = ?auto_109080 ?auto_109082 ) ) ( not ( = ?auto_109081 ?auto_109086 ) ) ( not ( = ?auto_109081 ?auto_109082 ) ) ( not ( = ?auto_109084 ?auto_109086 ) ) ( not ( = ?auto_109084 ?auto_109082 ) ) ( not ( = ?auto_109086 ?auto_109082 ) ) ( ON ?auto_109086 ?auto_109084 ) ( ON-TABLE ?auto_109085 ) ( not ( = ?auto_109085 ?auto_109083 ) ) ( not ( = ?auto_109085 ?auto_109082 ) ) ( not ( = ?auto_109083 ?auto_109082 ) ) ( not ( = ?auto_109080 ?auto_109083 ) ) ( not ( = ?auto_109080 ?auto_109085 ) ) ( not ( = ?auto_109081 ?auto_109083 ) ) ( not ( = ?auto_109081 ?auto_109085 ) ) ( not ( = ?auto_109084 ?auto_109083 ) ) ( not ( = ?auto_109084 ?auto_109085 ) ) ( not ( = ?auto_109086 ?auto_109083 ) ) ( not ( = ?auto_109086 ?auto_109085 ) ) ( ON ?auto_109082 ?auto_109086 ) ( CLEAR ?auto_109085 ) ( ON ?auto_109083 ?auto_109082 ) ( CLEAR ?auto_109083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109080 ?auto_109081 ?auto_109084 ?auto_109086 ?auto_109082 )
      ( MAKE-2PILE ?auto_109080 ?auto_109081 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109087 - BLOCK
      ?auto_109088 - BLOCK
    )
    :vars
    (
      ?auto_109093 - BLOCK
      ?auto_109089 - BLOCK
      ?auto_109090 - BLOCK
      ?auto_109092 - BLOCK
      ?auto_109091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109093 ?auto_109088 ) ( ON-TABLE ?auto_109087 ) ( ON ?auto_109088 ?auto_109087 ) ( not ( = ?auto_109087 ?auto_109088 ) ) ( not ( = ?auto_109087 ?auto_109093 ) ) ( not ( = ?auto_109088 ?auto_109093 ) ) ( not ( = ?auto_109087 ?auto_109089 ) ) ( not ( = ?auto_109087 ?auto_109090 ) ) ( not ( = ?auto_109088 ?auto_109089 ) ) ( not ( = ?auto_109088 ?auto_109090 ) ) ( not ( = ?auto_109093 ?auto_109089 ) ) ( not ( = ?auto_109093 ?auto_109090 ) ) ( not ( = ?auto_109089 ?auto_109090 ) ) ( ON ?auto_109089 ?auto_109093 ) ( not ( = ?auto_109092 ?auto_109091 ) ) ( not ( = ?auto_109092 ?auto_109090 ) ) ( not ( = ?auto_109091 ?auto_109090 ) ) ( not ( = ?auto_109087 ?auto_109091 ) ) ( not ( = ?auto_109087 ?auto_109092 ) ) ( not ( = ?auto_109088 ?auto_109091 ) ) ( not ( = ?auto_109088 ?auto_109092 ) ) ( not ( = ?auto_109093 ?auto_109091 ) ) ( not ( = ?auto_109093 ?auto_109092 ) ) ( not ( = ?auto_109089 ?auto_109091 ) ) ( not ( = ?auto_109089 ?auto_109092 ) ) ( ON ?auto_109090 ?auto_109089 ) ( ON ?auto_109091 ?auto_109090 ) ( CLEAR ?auto_109091 ) ( HOLDING ?auto_109092 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109092 )
      ( MAKE-2PILE ?auto_109087 ?auto_109088 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109094 - BLOCK
      ?auto_109095 - BLOCK
    )
    :vars
    (
      ?auto_109099 - BLOCK
      ?auto_109098 - BLOCK
      ?auto_109097 - BLOCK
      ?auto_109100 - BLOCK
      ?auto_109096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109099 ?auto_109095 ) ( ON-TABLE ?auto_109094 ) ( ON ?auto_109095 ?auto_109094 ) ( not ( = ?auto_109094 ?auto_109095 ) ) ( not ( = ?auto_109094 ?auto_109099 ) ) ( not ( = ?auto_109095 ?auto_109099 ) ) ( not ( = ?auto_109094 ?auto_109098 ) ) ( not ( = ?auto_109094 ?auto_109097 ) ) ( not ( = ?auto_109095 ?auto_109098 ) ) ( not ( = ?auto_109095 ?auto_109097 ) ) ( not ( = ?auto_109099 ?auto_109098 ) ) ( not ( = ?auto_109099 ?auto_109097 ) ) ( not ( = ?auto_109098 ?auto_109097 ) ) ( ON ?auto_109098 ?auto_109099 ) ( not ( = ?auto_109100 ?auto_109096 ) ) ( not ( = ?auto_109100 ?auto_109097 ) ) ( not ( = ?auto_109096 ?auto_109097 ) ) ( not ( = ?auto_109094 ?auto_109096 ) ) ( not ( = ?auto_109094 ?auto_109100 ) ) ( not ( = ?auto_109095 ?auto_109096 ) ) ( not ( = ?auto_109095 ?auto_109100 ) ) ( not ( = ?auto_109099 ?auto_109096 ) ) ( not ( = ?auto_109099 ?auto_109100 ) ) ( not ( = ?auto_109098 ?auto_109096 ) ) ( not ( = ?auto_109098 ?auto_109100 ) ) ( ON ?auto_109097 ?auto_109098 ) ( ON ?auto_109096 ?auto_109097 ) ( ON ?auto_109100 ?auto_109096 ) ( CLEAR ?auto_109100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109094 ?auto_109095 ?auto_109099 ?auto_109098 ?auto_109097 ?auto_109096 )
      ( MAKE-2PILE ?auto_109094 ?auto_109095 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109101 - BLOCK
      ?auto_109102 - BLOCK
    )
    :vars
    (
      ?auto_109103 - BLOCK
      ?auto_109104 - BLOCK
      ?auto_109106 - BLOCK
      ?auto_109105 - BLOCK
      ?auto_109107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109103 ?auto_109102 ) ( ON-TABLE ?auto_109101 ) ( ON ?auto_109102 ?auto_109101 ) ( not ( = ?auto_109101 ?auto_109102 ) ) ( not ( = ?auto_109101 ?auto_109103 ) ) ( not ( = ?auto_109102 ?auto_109103 ) ) ( not ( = ?auto_109101 ?auto_109104 ) ) ( not ( = ?auto_109101 ?auto_109106 ) ) ( not ( = ?auto_109102 ?auto_109104 ) ) ( not ( = ?auto_109102 ?auto_109106 ) ) ( not ( = ?auto_109103 ?auto_109104 ) ) ( not ( = ?auto_109103 ?auto_109106 ) ) ( not ( = ?auto_109104 ?auto_109106 ) ) ( ON ?auto_109104 ?auto_109103 ) ( not ( = ?auto_109105 ?auto_109107 ) ) ( not ( = ?auto_109105 ?auto_109106 ) ) ( not ( = ?auto_109107 ?auto_109106 ) ) ( not ( = ?auto_109101 ?auto_109107 ) ) ( not ( = ?auto_109101 ?auto_109105 ) ) ( not ( = ?auto_109102 ?auto_109107 ) ) ( not ( = ?auto_109102 ?auto_109105 ) ) ( not ( = ?auto_109103 ?auto_109107 ) ) ( not ( = ?auto_109103 ?auto_109105 ) ) ( not ( = ?auto_109104 ?auto_109107 ) ) ( not ( = ?auto_109104 ?auto_109105 ) ) ( ON ?auto_109106 ?auto_109104 ) ( ON ?auto_109107 ?auto_109106 ) ( HOLDING ?auto_109105 ) ( CLEAR ?auto_109107 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109101 ?auto_109102 ?auto_109103 ?auto_109104 ?auto_109106 ?auto_109107 ?auto_109105 )
      ( MAKE-2PILE ?auto_109101 ?auto_109102 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109108 - BLOCK
      ?auto_109109 - BLOCK
    )
    :vars
    (
      ?auto_109111 - BLOCK
      ?auto_109110 - BLOCK
      ?auto_109113 - BLOCK
      ?auto_109112 - BLOCK
      ?auto_109114 - BLOCK
      ?auto_109115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109111 ?auto_109109 ) ( ON-TABLE ?auto_109108 ) ( ON ?auto_109109 ?auto_109108 ) ( not ( = ?auto_109108 ?auto_109109 ) ) ( not ( = ?auto_109108 ?auto_109111 ) ) ( not ( = ?auto_109109 ?auto_109111 ) ) ( not ( = ?auto_109108 ?auto_109110 ) ) ( not ( = ?auto_109108 ?auto_109113 ) ) ( not ( = ?auto_109109 ?auto_109110 ) ) ( not ( = ?auto_109109 ?auto_109113 ) ) ( not ( = ?auto_109111 ?auto_109110 ) ) ( not ( = ?auto_109111 ?auto_109113 ) ) ( not ( = ?auto_109110 ?auto_109113 ) ) ( ON ?auto_109110 ?auto_109111 ) ( not ( = ?auto_109112 ?auto_109114 ) ) ( not ( = ?auto_109112 ?auto_109113 ) ) ( not ( = ?auto_109114 ?auto_109113 ) ) ( not ( = ?auto_109108 ?auto_109114 ) ) ( not ( = ?auto_109108 ?auto_109112 ) ) ( not ( = ?auto_109109 ?auto_109114 ) ) ( not ( = ?auto_109109 ?auto_109112 ) ) ( not ( = ?auto_109111 ?auto_109114 ) ) ( not ( = ?auto_109111 ?auto_109112 ) ) ( not ( = ?auto_109110 ?auto_109114 ) ) ( not ( = ?auto_109110 ?auto_109112 ) ) ( ON ?auto_109113 ?auto_109110 ) ( ON ?auto_109114 ?auto_109113 ) ( CLEAR ?auto_109114 ) ( ON ?auto_109112 ?auto_109115 ) ( CLEAR ?auto_109112 ) ( HAND-EMPTY ) ( not ( = ?auto_109108 ?auto_109115 ) ) ( not ( = ?auto_109109 ?auto_109115 ) ) ( not ( = ?auto_109111 ?auto_109115 ) ) ( not ( = ?auto_109110 ?auto_109115 ) ) ( not ( = ?auto_109113 ?auto_109115 ) ) ( not ( = ?auto_109112 ?auto_109115 ) ) ( not ( = ?auto_109114 ?auto_109115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109112 ?auto_109115 )
      ( MAKE-2PILE ?auto_109108 ?auto_109109 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109116 - BLOCK
      ?auto_109117 - BLOCK
    )
    :vars
    (
      ?auto_109121 - BLOCK
      ?auto_109119 - BLOCK
      ?auto_109118 - BLOCK
      ?auto_109122 - BLOCK
      ?auto_109123 - BLOCK
      ?auto_109120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109121 ?auto_109117 ) ( ON-TABLE ?auto_109116 ) ( ON ?auto_109117 ?auto_109116 ) ( not ( = ?auto_109116 ?auto_109117 ) ) ( not ( = ?auto_109116 ?auto_109121 ) ) ( not ( = ?auto_109117 ?auto_109121 ) ) ( not ( = ?auto_109116 ?auto_109119 ) ) ( not ( = ?auto_109116 ?auto_109118 ) ) ( not ( = ?auto_109117 ?auto_109119 ) ) ( not ( = ?auto_109117 ?auto_109118 ) ) ( not ( = ?auto_109121 ?auto_109119 ) ) ( not ( = ?auto_109121 ?auto_109118 ) ) ( not ( = ?auto_109119 ?auto_109118 ) ) ( ON ?auto_109119 ?auto_109121 ) ( not ( = ?auto_109122 ?auto_109123 ) ) ( not ( = ?auto_109122 ?auto_109118 ) ) ( not ( = ?auto_109123 ?auto_109118 ) ) ( not ( = ?auto_109116 ?auto_109123 ) ) ( not ( = ?auto_109116 ?auto_109122 ) ) ( not ( = ?auto_109117 ?auto_109123 ) ) ( not ( = ?auto_109117 ?auto_109122 ) ) ( not ( = ?auto_109121 ?auto_109123 ) ) ( not ( = ?auto_109121 ?auto_109122 ) ) ( not ( = ?auto_109119 ?auto_109123 ) ) ( not ( = ?auto_109119 ?auto_109122 ) ) ( ON ?auto_109118 ?auto_109119 ) ( ON ?auto_109122 ?auto_109120 ) ( CLEAR ?auto_109122 ) ( not ( = ?auto_109116 ?auto_109120 ) ) ( not ( = ?auto_109117 ?auto_109120 ) ) ( not ( = ?auto_109121 ?auto_109120 ) ) ( not ( = ?auto_109119 ?auto_109120 ) ) ( not ( = ?auto_109118 ?auto_109120 ) ) ( not ( = ?auto_109122 ?auto_109120 ) ) ( not ( = ?auto_109123 ?auto_109120 ) ) ( HOLDING ?auto_109123 ) ( CLEAR ?auto_109118 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109116 ?auto_109117 ?auto_109121 ?auto_109119 ?auto_109118 ?auto_109123 )
      ( MAKE-2PILE ?auto_109116 ?auto_109117 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109124 - BLOCK
      ?auto_109125 - BLOCK
    )
    :vars
    (
      ?auto_109129 - BLOCK
      ?auto_109127 - BLOCK
      ?auto_109130 - BLOCK
      ?auto_109128 - BLOCK
      ?auto_109126 - BLOCK
      ?auto_109131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109129 ?auto_109125 ) ( ON-TABLE ?auto_109124 ) ( ON ?auto_109125 ?auto_109124 ) ( not ( = ?auto_109124 ?auto_109125 ) ) ( not ( = ?auto_109124 ?auto_109129 ) ) ( not ( = ?auto_109125 ?auto_109129 ) ) ( not ( = ?auto_109124 ?auto_109127 ) ) ( not ( = ?auto_109124 ?auto_109130 ) ) ( not ( = ?auto_109125 ?auto_109127 ) ) ( not ( = ?auto_109125 ?auto_109130 ) ) ( not ( = ?auto_109129 ?auto_109127 ) ) ( not ( = ?auto_109129 ?auto_109130 ) ) ( not ( = ?auto_109127 ?auto_109130 ) ) ( ON ?auto_109127 ?auto_109129 ) ( not ( = ?auto_109128 ?auto_109126 ) ) ( not ( = ?auto_109128 ?auto_109130 ) ) ( not ( = ?auto_109126 ?auto_109130 ) ) ( not ( = ?auto_109124 ?auto_109126 ) ) ( not ( = ?auto_109124 ?auto_109128 ) ) ( not ( = ?auto_109125 ?auto_109126 ) ) ( not ( = ?auto_109125 ?auto_109128 ) ) ( not ( = ?auto_109129 ?auto_109126 ) ) ( not ( = ?auto_109129 ?auto_109128 ) ) ( not ( = ?auto_109127 ?auto_109126 ) ) ( not ( = ?auto_109127 ?auto_109128 ) ) ( ON ?auto_109130 ?auto_109127 ) ( ON ?auto_109128 ?auto_109131 ) ( not ( = ?auto_109124 ?auto_109131 ) ) ( not ( = ?auto_109125 ?auto_109131 ) ) ( not ( = ?auto_109129 ?auto_109131 ) ) ( not ( = ?auto_109127 ?auto_109131 ) ) ( not ( = ?auto_109130 ?auto_109131 ) ) ( not ( = ?auto_109128 ?auto_109131 ) ) ( not ( = ?auto_109126 ?auto_109131 ) ) ( CLEAR ?auto_109130 ) ( ON ?auto_109126 ?auto_109128 ) ( CLEAR ?auto_109126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109131 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109131 ?auto_109128 )
      ( MAKE-2PILE ?auto_109124 ?auto_109125 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109132 - BLOCK
      ?auto_109133 - BLOCK
    )
    :vars
    (
      ?auto_109135 - BLOCK
      ?auto_109137 - BLOCK
      ?auto_109136 - BLOCK
      ?auto_109134 - BLOCK
      ?auto_109138 - BLOCK
      ?auto_109139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109135 ?auto_109133 ) ( ON-TABLE ?auto_109132 ) ( ON ?auto_109133 ?auto_109132 ) ( not ( = ?auto_109132 ?auto_109133 ) ) ( not ( = ?auto_109132 ?auto_109135 ) ) ( not ( = ?auto_109133 ?auto_109135 ) ) ( not ( = ?auto_109132 ?auto_109137 ) ) ( not ( = ?auto_109132 ?auto_109136 ) ) ( not ( = ?auto_109133 ?auto_109137 ) ) ( not ( = ?auto_109133 ?auto_109136 ) ) ( not ( = ?auto_109135 ?auto_109137 ) ) ( not ( = ?auto_109135 ?auto_109136 ) ) ( not ( = ?auto_109137 ?auto_109136 ) ) ( ON ?auto_109137 ?auto_109135 ) ( not ( = ?auto_109134 ?auto_109138 ) ) ( not ( = ?auto_109134 ?auto_109136 ) ) ( not ( = ?auto_109138 ?auto_109136 ) ) ( not ( = ?auto_109132 ?auto_109138 ) ) ( not ( = ?auto_109132 ?auto_109134 ) ) ( not ( = ?auto_109133 ?auto_109138 ) ) ( not ( = ?auto_109133 ?auto_109134 ) ) ( not ( = ?auto_109135 ?auto_109138 ) ) ( not ( = ?auto_109135 ?auto_109134 ) ) ( not ( = ?auto_109137 ?auto_109138 ) ) ( not ( = ?auto_109137 ?auto_109134 ) ) ( ON ?auto_109134 ?auto_109139 ) ( not ( = ?auto_109132 ?auto_109139 ) ) ( not ( = ?auto_109133 ?auto_109139 ) ) ( not ( = ?auto_109135 ?auto_109139 ) ) ( not ( = ?auto_109137 ?auto_109139 ) ) ( not ( = ?auto_109136 ?auto_109139 ) ) ( not ( = ?auto_109134 ?auto_109139 ) ) ( not ( = ?auto_109138 ?auto_109139 ) ) ( ON ?auto_109138 ?auto_109134 ) ( CLEAR ?auto_109138 ) ( ON-TABLE ?auto_109139 ) ( HOLDING ?auto_109136 ) ( CLEAR ?auto_109137 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109132 ?auto_109133 ?auto_109135 ?auto_109137 ?auto_109136 )
      ( MAKE-2PILE ?auto_109132 ?auto_109133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109140 - BLOCK
      ?auto_109141 - BLOCK
    )
    :vars
    (
      ?auto_109147 - BLOCK
      ?auto_109144 - BLOCK
      ?auto_109143 - BLOCK
      ?auto_109142 - BLOCK
      ?auto_109145 - BLOCK
      ?auto_109146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109147 ?auto_109141 ) ( ON-TABLE ?auto_109140 ) ( ON ?auto_109141 ?auto_109140 ) ( not ( = ?auto_109140 ?auto_109141 ) ) ( not ( = ?auto_109140 ?auto_109147 ) ) ( not ( = ?auto_109141 ?auto_109147 ) ) ( not ( = ?auto_109140 ?auto_109144 ) ) ( not ( = ?auto_109140 ?auto_109143 ) ) ( not ( = ?auto_109141 ?auto_109144 ) ) ( not ( = ?auto_109141 ?auto_109143 ) ) ( not ( = ?auto_109147 ?auto_109144 ) ) ( not ( = ?auto_109147 ?auto_109143 ) ) ( not ( = ?auto_109144 ?auto_109143 ) ) ( ON ?auto_109144 ?auto_109147 ) ( not ( = ?auto_109142 ?auto_109145 ) ) ( not ( = ?auto_109142 ?auto_109143 ) ) ( not ( = ?auto_109145 ?auto_109143 ) ) ( not ( = ?auto_109140 ?auto_109145 ) ) ( not ( = ?auto_109140 ?auto_109142 ) ) ( not ( = ?auto_109141 ?auto_109145 ) ) ( not ( = ?auto_109141 ?auto_109142 ) ) ( not ( = ?auto_109147 ?auto_109145 ) ) ( not ( = ?auto_109147 ?auto_109142 ) ) ( not ( = ?auto_109144 ?auto_109145 ) ) ( not ( = ?auto_109144 ?auto_109142 ) ) ( ON ?auto_109142 ?auto_109146 ) ( not ( = ?auto_109140 ?auto_109146 ) ) ( not ( = ?auto_109141 ?auto_109146 ) ) ( not ( = ?auto_109147 ?auto_109146 ) ) ( not ( = ?auto_109144 ?auto_109146 ) ) ( not ( = ?auto_109143 ?auto_109146 ) ) ( not ( = ?auto_109142 ?auto_109146 ) ) ( not ( = ?auto_109145 ?auto_109146 ) ) ( ON ?auto_109145 ?auto_109142 ) ( ON-TABLE ?auto_109146 ) ( CLEAR ?auto_109144 ) ( ON ?auto_109143 ?auto_109145 ) ( CLEAR ?auto_109143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109146 ?auto_109142 ?auto_109145 )
      ( MAKE-2PILE ?auto_109140 ?auto_109141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109148 - BLOCK
      ?auto_109149 - BLOCK
    )
    :vars
    (
      ?auto_109150 - BLOCK
      ?auto_109154 - BLOCK
      ?auto_109155 - BLOCK
      ?auto_109152 - BLOCK
      ?auto_109153 - BLOCK
      ?auto_109151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109150 ?auto_109149 ) ( ON-TABLE ?auto_109148 ) ( ON ?auto_109149 ?auto_109148 ) ( not ( = ?auto_109148 ?auto_109149 ) ) ( not ( = ?auto_109148 ?auto_109150 ) ) ( not ( = ?auto_109149 ?auto_109150 ) ) ( not ( = ?auto_109148 ?auto_109154 ) ) ( not ( = ?auto_109148 ?auto_109155 ) ) ( not ( = ?auto_109149 ?auto_109154 ) ) ( not ( = ?auto_109149 ?auto_109155 ) ) ( not ( = ?auto_109150 ?auto_109154 ) ) ( not ( = ?auto_109150 ?auto_109155 ) ) ( not ( = ?auto_109154 ?auto_109155 ) ) ( not ( = ?auto_109152 ?auto_109153 ) ) ( not ( = ?auto_109152 ?auto_109155 ) ) ( not ( = ?auto_109153 ?auto_109155 ) ) ( not ( = ?auto_109148 ?auto_109153 ) ) ( not ( = ?auto_109148 ?auto_109152 ) ) ( not ( = ?auto_109149 ?auto_109153 ) ) ( not ( = ?auto_109149 ?auto_109152 ) ) ( not ( = ?auto_109150 ?auto_109153 ) ) ( not ( = ?auto_109150 ?auto_109152 ) ) ( not ( = ?auto_109154 ?auto_109153 ) ) ( not ( = ?auto_109154 ?auto_109152 ) ) ( ON ?auto_109152 ?auto_109151 ) ( not ( = ?auto_109148 ?auto_109151 ) ) ( not ( = ?auto_109149 ?auto_109151 ) ) ( not ( = ?auto_109150 ?auto_109151 ) ) ( not ( = ?auto_109154 ?auto_109151 ) ) ( not ( = ?auto_109155 ?auto_109151 ) ) ( not ( = ?auto_109152 ?auto_109151 ) ) ( not ( = ?auto_109153 ?auto_109151 ) ) ( ON ?auto_109153 ?auto_109152 ) ( ON-TABLE ?auto_109151 ) ( ON ?auto_109155 ?auto_109153 ) ( CLEAR ?auto_109155 ) ( HOLDING ?auto_109154 ) ( CLEAR ?auto_109150 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109148 ?auto_109149 ?auto_109150 ?auto_109154 )
      ( MAKE-2PILE ?auto_109148 ?auto_109149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109156 - BLOCK
      ?auto_109157 - BLOCK
    )
    :vars
    (
      ?auto_109159 - BLOCK
      ?auto_109163 - BLOCK
      ?auto_109162 - BLOCK
      ?auto_109158 - BLOCK
      ?auto_109160 - BLOCK
      ?auto_109161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109159 ?auto_109157 ) ( ON-TABLE ?auto_109156 ) ( ON ?auto_109157 ?auto_109156 ) ( not ( = ?auto_109156 ?auto_109157 ) ) ( not ( = ?auto_109156 ?auto_109159 ) ) ( not ( = ?auto_109157 ?auto_109159 ) ) ( not ( = ?auto_109156 ?auto_109163 ) ) ( not ( = ?auto_109156 ?auto_109162 ) ) ( not ( = ?auto_109157 ?auto_109163 ) ) ( not ( = ?auto_109157 ?auto_109162 ) ) ( not ( = ?auto_109159 ?auto_109163 ) ) ( not ( = ?auto_109159 ?auto_109162 ) ) ( not ( = ?auto_109163 ?auto_109162 ) ) ( not ( = ?auto_109158 ?auto_109160 ) ) ( not ( = ?auto_109158 ?auto_109162 ) ) ( not ( = ?auto_109160 ?auto_109162 ) ) ( not ( = ?auto_109156 ?auto_109160 ) ) ( not ( = ?auto_109156 ?auto_109158 ) ) ( not ( = ?auto_109157 ?auto_109160 ) ) ( not ( = ?auto_109157 ?auto_109158 ) ) ( not ( = ?auto_109159 ?auto_109160 ) ) ( not ( = ?auto_109159 ?auto_109158 ) ) ( not ( = ?auto_109163 ?auto_109160 ) ) ( not ( = ?auto_109163 ?auto_109158 ) ) ( ON ?auto_109158 ?auto_109161 ) ( not ( = ?auto_109156 ?auto_109161 ) ) ( not ( = ?auto_109157 ?auto_109161 ) ) ( not ( = ?auto_109159 ?auto_109161 ) ) ( not ( = ?auto_109163 ?auto_109161 ) ) ( not ( = ?auto_109162 ?auto_109161 ) ) ( not ( = ?auto_109158 ?auto_109161 ) ) ( not ( = ?auto_109160 ?auto_109161 ) ) ( ON ?auto_109160 ?auto_109158 ) ( ON-TABLE ?auto_109161 ) ( ON ?auto_109162 ?auto_109160 ) ( CLEAR ?auto_109159 ) ( ON ?auto_109163 ?auto_109162 ) ( CLEAR ?auto_109163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109161 ?auto_109158 ?auto_109160 ?auto_109162 )
      ( MAKE-2PILE ?auto_109156 ?auto_109157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109180 - BLOCK
      ?auto_109181 - BLOCK
    )
    :vars
    (
      ?auto_109186 - BLOCK
      ?auto_109184 - BLOCK
      ?auto_109183 - BLOCK
      ?auto_109185 - BLOCK
      ?auto_109182 - BLOCK
      ?auto_109187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109180 ) ( not ( = ?auto_109180 ?auto_109181 ) ) ( not ( = ?auto_109180 ?auto_109186 ) ) ( not ( = ?auto_109181 ?auto_109186 ) ) ( not ( = ?auto_109180 ?auto_109184 ) ) ( not ( = ?auto_109180 ?auto_109183 ) ) ( not ( = ?auto_109181 ?auto_109184 ) ) ( not ( = ?auto_109181 ?auto_109183 ) ) ( not ( = ?auto_109186 ?auto_109184 ) ) ( not ( = ?auto_109186 ?auto_109183 ) ) ( not ( = ?auto_109184 ?auto_109183 ) ) ( not ( = ?auto_109185 ?auto_109182 ) ) ( not ( = ?auto_109185 ?auto_109183 ) ) ( not ( = ?auto_109182 ?auto_109183 ) ) ( not ( = ?auto_109180 ?auto_109182 ) ) ( not ( = ?auto_109180 ?auto_109185 ) ) ( not ( = ?auto_109181 ?auto_109182 ) ) ( not ( = ?auto_109181 ?auto_109185 ) ) ( not ( = ?auto_109186 ?auto_109182 ) ) ( not ( = ?auto_109186 ?auto_109185 ) ) ( not ( = ?auto_109184 ?auto_109182 ) ) ( not ( = ?auto_109184 ?auto_109185 ) ) ( ON ?auto_109185 ?auto_109187 ) ( not ( = ?auto_109180 ?auto_109187 ) ) ( not ( = ?auto_109181 ?auto_109187 ) ) ( not ( = ?auto_109186 ?auto_109187 ) ) ( not ( = ?auto_109184 ?auto_109187 ) ) ( not ( = ?auto_109183 ?auto_109187 ) ) ( not ( = ?auto_109185 ?auto_109187 ) ) ( not ( = ?auto_109182 ?auto_109187 ) ) ( ON ?auto_109182 ?auto_109185 ) ( ON-TABLE ?auto_109187 ) ( ON ?auto_109183 ?auto_109182 ) ( ON ?auto_109184 ?auto_109183 ) ( ON ?auto_109186 ?auto_109184 ) ( CLEAR ?auto_109186 ) ( HOLDING ?auto_109181 ) ( CLEAR ?auto_109180 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109180 ?auto_109181 ?auto_109186 )
      ( MAKE-2PILE ?auto_109180 ?auto_109181 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109188 - BLOCK
      ?auto_109189 - BLOCK
    )
    :vars
    (
      ?auto_109190 - BLOCK
      ?auto_109194 - BLOCK
      ?auto_109193 - BLOCK
      ?auto_109192 - BLOCK
      ?auto_109195 - BLOCK
      ?auto_109191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109188 ) ( not ( = ?auto_109188 ?auto_109189 ) ) ( not ( = ?auto_109188 ?auto_109190 ) ) ( not ( = ?auto_109189 ?auto_109190 ) ) ( not ( = ?auto_109188 ?auto_109194 ) ) ( not ( = ?auto_109188 ?auto_109193 ) ) ( not ( = ?auto_109189 ?auto_109194 ) ) ( not ( = ?auto_109189 ?auto_109193 ) ) ( not ( = ?auto_109190 ?auto_109194 ) ) ( not ( = ?auto_109190 ?auto_109193 ) ) ( not ( = ?auto_109194 ?auto_109193 ) ) ( not ( = ?auto_109192 ?auto_109195 ) ) ( not ( = ?auto_109192 ?auto_109193 ) ) ( not ( = ?auto_109195 ?auto_109193 ) ) ( not ( = ?auto_109188 ?auto_109195 ) ) ( not ( = ?auto_109188 ?auto_109192 ) ) ( not ( = ?auto_109189 ?auto_109195 ) ) ( not ( = ?auto_109189 ?auto_109192 ) ) ( not ( = ?auto_109190 ?auto_109195 ) ) ( not ( = ?auto_109190 ?auto_109192 ) ) ( not ( = ?auto_109194 ?auto_109195 ) ) ( not ( = ?auto_109194 ?auto_109192 ) ) ( ON ?auto_109192 ?auto_109191 ) ( not ( = ?auto_109188 ?auto_109191 ) ) ( not ( = ?auto_109189 ?auto_109191 ) ) ( not ( = ?auto_109190 ?auto_109191 ) ) ( not ( = ?auto_109194 ?auto_109191 ) ) ( not ( = ?auto_109193 ?auto_109191 ) ) ( not ( = ?auto_109192 ?auto_109191 ) ) ( not ( = ?auto_109195 ?auto_109191 ) ) ( ON ?auto_109195 ?auto_109192 ) ( ON-TABLE ?auto_109191 ) ( ON ?auto_109193 ?auto_109195 ) ( ON ?auto_109194 ?auto_109193 ) ( ON ?auto_109190 ?auto_109194 ) ( CLEAR ?auto_109188 ) ( ON ?auto_109189 ?auto_109190 ) ( CLEAR ?auto_109189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109191 ?auto_109192 ?auto_109195 ?auto_109193 ?auto_109194 ?auto_109190 )
      ( MAKE-2PILE ?auto_109188 ?auto_109189 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109196 - BLOCK
      ?auto_109197 - BLOCK
    )
    :vars
    (
      ?auto_109203 - BLOCK
      ?auto_109198 - BLOCK
      ?auto_109202 - BLOCK
      ?auto_109201 - BLOCK
      ?auto_109199 - BLOCK
      ?auto_109200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109196 ?auto_109197 ) ) ( not ( = ?auto_109196 ?auto_109203 ) ) ( not ( = ?auto_109197 ?auto_109203 ) ) ( not ( = ?auto_109196 ?auto_109198 ) ) ( not ( = ?auto_109196 ?auto_109202 ) ) ( not ( = ?auto_109197 ?auto_109198 ) ) ( not ( = ?auto_109197 ?auto_109202 ) ) ( not ( = ?auto_109203 ?auto_109198 ) ) ( not ( = ?auto_109203 ?auto_109202 ) ) ( not ( = ?auto_109198 ?auto_109202 ) ) ( not ( = ?auto_109201 ?auto_109199 ) ) ( not ( = ?auto_109201 ?auto_109202 ) ) ( not ( = ?auto_109199 ?auto_109202 ) ) ( not ( = ?auto_109196 ?auto_109199 ) ) ( not ( = ?auto_109196 ?auto_109201 ) ) ( not ( = ?auto_109197 ?auto_109199 ) ) ( not ( = ?auto_109197 ?auto_109201 ) ) ( not ( = ?auto_109203 ?auto_109199 ) ) ( not ( = ?auto_109203 ?auto_109201 ) ) ( not ( = ?auto_109198 ?auto_109199 ) ) ( not ( = ?auto_109198 ?auto_109201 ) ) ( ON ?auto_109201 ?auto_109200 ) ( not ( = ?auto_109196 ?auto_109200 ) ) ( not ( = ?auto_109197 ?auto_109200 ) ) ( not ( = ?auto_109203 ?auto_109200 ) ) ( not ( = ?auto_109198 ?auto_109200 ) ) ( not ( = ?auto_109202 ?auto_109200 ) ) ( not ( = ?auto_109201 ?auto_109200 ) ) ( not ( = ?auto_109199 ?auto_109200 ) ) ( ON ?auto_109199 ?auto_109201 ) ( ON-TABLE ?auto_109200 ) ( ON ?auto_109202 ?auto_109199 ) ( ON ?auto_109198 ?auto_109202 ) ( ON ?auto_109203 ?auto_109198 ) ( ON ?auto_109197 ?auto_109203 ) ( CLEAR ?auto_109197 ) ( HOLDING ?auto_109196 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109196 )
      ( MAKE-2PILE ?auto_109196 ?auto_109197 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109204 - BLOCK
      ?auto_109205 - BLOCK
    )
    :vars
    (
      ?auto_109206 - BLOCK
      ?auto_109211 - BLOCK
      ?auto_109210 - BLOCK
      ?auto_109208 - BLOCK
      ?auto_109207 - BLOCK
      ?auto_109209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109204 ?auto_109205 ) ) ( not ( = ?auto_109204 ?auto_109206 ) ) ( not ( = ?auto_109205 ?auto_109206 ) ) ( not ( = ?auto_109204 ?auto_109211 ) ) ( not ( = ?auto_109204 ?auto_109210 ) ) ( not ( = ?auto_109205 ?auto_109211 ) ) ( not ( = ?auto_109205 ?auto_109210 ) ) ( not ( = ?auto_109206 ?auto_109211 ) ) ( not ( = ?auto_109206 ?auto_109210 ) ) ( not ( = ?auto_109211 ?auto_109210 ) ) ( not ( = ?auto_109208 ?auto_109207 ) ) ( not ( = ?auto_109208 ?auto_109210 ) ) ( not ( = ?auto_109207 ?auto_109210 ) ) ( not ( = ?auto_109204 ?auto_109207 ) ) ( not ( = ?auto_109204 ?auto_109208 ) ) ( not ( = ?auto_109205 ?auto_109207 ) ) ( not ( = ?auto_109205 ?auto_109208 ) ) ( not ( = ?auto_109206 ?auto_109207 ) ) ( not ( = ?auto_109206 ?auto_109208 ) ) ( not ( = ?auto_109211 ?auto_109207 ) ) ( not ( = ?auto_109211 ?auto_109208 ) ) ( ON ?auto_109208 ?auto_109209 ) ( not ( = ?auto_109204 ?auto_109209 ) ) ( not ( = ?auto_109205 ?auto_109209 ) ) ( not ( = ?auto_109206 ?auto_109209 ) ) ( not ( = ?auto_109211 ?auto_109209 ) ) ( not ( = ?auto_109210 ?auto_109209 ) ) ( not ( = ?auto_109208 ?auto_109209 ) ) ( not ( = ?auto_109207 ?auto_109209 ) ) ( ON ?auto_109207 ?auto_109208 ) ( ON-TABLE ?auto_109209 ) ( ON ?auto_109210 ?auto_109207 ) ( ON ?auto_109211 ?auto_109210 ) ( ON ?auto_109206 ?auto_109211 ) ( ON ?auto_109205 ?auto_109206 ) ( ON ?auto_109204 ?auto_109205 ) ( CLEAR ?auto_109204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109209 ?auto_109208 ?auto_109207 ?auto_109210 ?auto_109211 ?auto_109206 ?auto_109205 )
      ( MAKE-2PILE ?auto_109204 ?auto_109205 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109217 - BLOCK
      ?auto_109218 - BLOCK
      ?auto_109219 - BLOCK
      ?auto_109220 - BLOCK
      ?auto_109221 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_109221 ) ( CLEAR ?auto_109220 ) ( ON-TABLE ?auto_109217 ) ( ON ?auto_109218 ?auto_109217 ) ( ON ?auto_109219 ?auto_109218 ) ( ON ?auto_109220 ?auto_109219 ) ( not ( = ?auto_109217 ?auto_109218 ) ) ( not ( = ?auto_109217 ?auto_109219 ) ) ( not ( = ?auto_109217 ?auto_109220 ) ) ( not ( = ?auto_109217 ?auto_109221 ) ) ( not ( = ?auto_109218 ?auto_109219 ) ) ( not ( = ?auto_109218 ?auto_109220 ) ) ( not ( = ?auto_109218 ?auto_109221 ) ) ( not ( = ?auto_109219 ?auto_109220 ) ) ( not ( = ?auto_109219 ?auto_109221 ) ) ( not ( = ?auto_109220 ?auto_109221 ) ) )
    :subtasks
    ( ( !STACK ?auto_109221 ?auto_109220 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109222 - BLOCK
      ?auto_109223 - BLOCK
      ?auto_109224 - BLOCK
      ?auto_109225 - BLOCK
      ?auto_109226 - BLOCK
    )
    :vars
    (
      ?auto_109227 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109225 ) ( ON-TABLE ?auto_109222 ) ( ON ?auto_109223 ?auto_109222 ) ( ON ?auto_109224 ?auto_109223 ) ( ON ?auto_109225 ?auto_109224 ) ( not ( = ?auto_109222 ?auto_109223 ) ) ( not ( = ?auto_109222 ?auto_109224 ) ) ( not ( = ?auto_109222 ?auto_109225 ) ) ( not ( = ?auto_109222 ?auto_109226 ) ) ( not ( = ?auto_109223 ?auto_109224 ) ) ( not ( = ?auto_109223 ?auto_109225 ) ) ( not ( = ?auto_109223 ?auto_109226 ) ) ( not ( = ?auto_109224 ?auto_109225 ) ) ( not ( = ?auto_109224 ?auto_109226 ) ) ( not ( = ?auto_109225 ?auto_109226 ) ) ( ON ?auto_109226 ?auto_109227 ) ( CLEAR ?auto_109226 ) ( HAND-EMPTY ) ( not ( = ?auto_109222 ?auto_109227 ) ) ( not ( = ?auto_109223 ?auto_109227 ) ) ( not ( = ?auto_109224 ?auto_109227 ) ) ( not ( = ?auto_109225 ?auto_109227 ) ) ( not ( = ?auto_109226 ?auto_109227 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109226 ?auto_109227 )
      ( MAKE-5PILE ?auto_109222 ?auto_109223 ?auto_109224 ?auto_109225 ?auto_109226 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109228 - BLOCK
      ?auto_109229 - BLOCK
      ?auto_109230 - BLOCK
      ?auto_109231 - BLOCK
      ?auto_109232 - BLOCK
    )
    :vars
    (
      ?auto_109233 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109228 ) ( ON ?auto_109229 ?auto_109228 ) ( ON ?auto_109230 ?auto_109229 ) ( not ( = ?auto_109228 ?auto_109229 ) ) ( not ( = ?auto_109228 ?auto_109230 ) ) ( not ( = ?auto_109228 ?auto_109231 ) ) ( not ( = ?auto_109228 ?auto_109232 ) ) ( not ( = ?auto_109229 ?auto_109230 ) ) ( not ( = ?auto_109229 ?auto_109231 ) ) ( not ( = ?auto_109229 ?auto_109232 ) ) ( not ( = ?auto_109230 ?auto_109231 ) ) ( not ( = ?auto_109230 ?auto_109232 ) ) ( not ( = ?auto_109231 ?auto_109232 ) ) ( ON ?auto_109232 ?auto_109233 ) ( CLEAR ?auto_109232 ) ( not ( = ?auto_109228 ?auto_109233 ) ) ( not ( = ?auto_109229 ?auto_109233 ) ) ( not ( = ?auto_109230 ?auto_109233 ) ) ( not ( = ?auto_109231 ?auto_109233 ) ) ( not ( = ?auto_109232 ?auto_109233 ) ) ( HOLDING ?auto_109231 ) ( CLEAR ?auto_109230 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109228 ?auto_109229 ?auto_109230 ?auto_109231 )
      ( MAKE-5PILE ?auto_109228 ?auto_109229 ?auto_109230 ?auto_109231 ?auto_109232 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109234 - BLOCK
      ?auto_109235 - BLOCK
      ?auto_109236 - BLOCK
      ?auto_109237 - BLOCK
      ?auto_109238 - BLOCK
    )
    :vars
    (
      ?auto_109239 - BLOCK
      ?auto_109240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109234 ) ( ON ?auto_109235 ?auto_109234 ) ( ON ?auto_109236 ?auto_109235 ) ( not ( = ?auto_109234 ?auto_109235 ) ) ( not ( = ?auto_109234 ?auto_109236 ) ) ( not ( = ?auto_109234 ?auto_109237 ) ) ( not ( = ?auto_109234 ?auto_109238 ) ) ( not ( = ?auto_109235 ?auto_109236 ) ) ( not ( = ?auto_109235 ?auto_109237 ) ) ( not ( = ?auto_109235 ?auto_109238 ) ) ( not ( = ?auto_109236 ?auto_109237 ) ) ( not ( = ?auto_109236 ?auto_109238 ) ) ( not ( = ?auto_109237 ?auto_109238 ) ) ( ON ?auto_109238 ?auto_109239 ) ( not ( = ?auto_109234 ?auto_109239 ) ) ( not ( = ?auto_109235 ?auto_109239 ) ) ( not ( = ?auto_109236 ?auto_109239 ) ) ( not ( = ?auto_109237 ?auto_109239 ) ) ( not ( = ?auto_109238 ?auto_109239 ) ) ( CLEAR ?auto_109236 ) ( ON ?auto_109237 ?auto_109238 ) ( CLEAR ?auto_109237 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109240 ) ( ON ?auto_109239 ?auto_109240 ) ( not ( = ?auto_109240 ?auto_109239 ) ) ( not ( = ?auto_109240 ?auto_109238 ) ) ( not ( = ?auto_109240 ?auto_109237 ) ) ( not ( = ?auto_109234 ?auto_109240 ) ) ( not ( = ?auto_109235 ?auto_109240 ) ) ( not ( = ?auto_109236 ?auto_109240 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109240 ?auto_109239 ?auto_109238 )
      ( MAKE-5PILE ?auto_109234 ?auto_109235 ?auto_109236 ?auto_109237 ?auto_109238 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109241 - BLOCK
      ?auto_109242 - BLOCK
      ?auto_109243 - BLOCK
      ?auto_109244 - BLOCK
      ?auto_109245 - BLOCK
    )
    :vars
    (
      ?auto_109246 - BLOCK
      ?auto_109247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109241 ) ( ON ?auto_109242 ?auto_109241 ) ( not ( = ?auto_109241 ?auto_109242 ) ) ( not ( = ?auto_109241 ?auto_109243 ) ) ( not ( = ?auto_109241 ?auto_109244 ) ) ( not ( = ?auto_109241 ?auto_109245 ) ) ( not ( = ?auto_109242 ?auto_109243 ) ) ( not ( = ?auto_109242 ?auto_109244 ) ) ( not ( = ?auto_109242 ?auto_109245 ) ) ( not ( = ?auto_109243 ?auto_109244 ) ) ( not ( = ?auto_109243 ?auto_109245 ) ) ( not ( = ?auto_109244 ?auto_109245 ) ) ( ON ?auto_109245 ?auto_109246 ) ( not ( = ?auto_109241 ?auto_109246 ) ) ( not ( = ?auto_109242 ?auto_109246 ) ) ( not ( = ?auto_109243 ?auto_109246 ) ) ( not ( = ?auto_109244 ?auto_109246 ) ) ( not ( = ?auto_109245 ?auto_109246 ) ) ( ON ?auto_109244 ?auto_109245 ) ( CLEAR ?auto_109244 ) ( ON-TABLE ?auto_109247 ) ( ON ?auto_109246 ?auto_109247 ) ( not ( = ?auto_109247 ?auto_109246 ) ) ( not ( = ?auto_109247 ?auto_109245 ) ) ( not ( = ?auto_109247 ?auto_109244 ) ) ( not ( = ?auto_109241 ?auto_109247 ) ) ( not ( = ?auto_109242 ?auto_109247 ) ) ( not ( = ?auto_109243 ?auto_109247 ) ) ( HOLDING ?auto_109243 ) ( CLEAR ?auto_109242 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109241 ?auto_109242 ?auto_109243 )
      ( MAKE-5PILE ?auto_109241 ?auto_109242 ?auto_109243 ?auto_109244 ?auto_109245 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109248 - BLOCK
      ?auto_109249 - BLOCK
      ?auto_109250 - BLOCK
      ?auto_109251 - BLOCK
      ?auto_109252 - BLOCK
    )
    :vars
    (
      ?auto_109254 - BLOCK
      ?auto_109253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109248 ) ( ON ?auto_109249 ?auto_109248 ) ( not ( = ?auto_109248 ?auto_109249 ) ) ( not ( = ?auto_109248 ?auto_109250 ) ) ( not ( = ?auto_109248 ?auto_109251 ) ) ( not ( = ?auto_109248 ?auto_109252 ) ) ( not ( = ?auto_109249 ?auto_109250 ) ) ( not ( = ?auto_109249 ?auto_109251 ) ) ( not ( = ?auto_109249 ?auto_109252 ) ) ( not ( = ?auto_109250 ?auto_109251 ) ) ( not ( = ?auto_109250 ?auto_109252 ) ) ( not ( = ?auto_109251 ?auto_109252 ) ) ( ON ?auto_109252 ?auto_109254 ) ( not ( = ?auto_109248 ?auto_109254 ) ) ( not ( = ?auto_109249 ?auto_109254 ) ) ( not ( = ?auto_109250 ?auto_109254 ) ) ( not ( = ?auto_109251 ?auto_109254 ) ) ( not ( = ?auto_109252 ?auto_109254 ) ) ( ON ?auto_109251 ?auto_109252 ) ( ON-TABLE ?auto_109253 ) ( ON ?auto_109254 ?auto_109253 ) ( not ( = ?auto_109253 ?auto_109254 ) ) ( not ( = ?auto_109253 ?auto_109252 ) ) ( not ( = ?auto_109253 ?auto_109251 ) ) ( not ( = ?auto_109248 ?auto_109253 ) ) ( not ( = ?auto_109249 ?auto_109253 ) ) ( not ( = ?auto_109250 ?auto_109253 ) ) ( CLEAR ?auto_109249 ) ( ON ?auto_109250 ?auto_109251 ) ( CLEAR ?auto_109250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109253 ?auto_109254 ?auto_109252 ?auto_109251 )
      ( MAKE-5PILE ?auto_109248 ?auto_109249 ?auto_109250 ?auto_109251 ?auto_109252 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109255 - BLOCK
      ?auto_109256 - BLOCK
      ?auto_109257 - BLOCK
      ?auto_109258 - BLOCK
      ?auto_109259 - BLOCK
    )
    :vars
    (
      ?auto_109261 - BLOCK
      ?auto_109260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109255 ) ( not ( = ?auto_109255 ?auto_109256 ) ) ( not ( = ?auto_109255 ?auto_109257 ) ) ( not ( = ?auto_109255 ?auto_109258 ) ) ( not ( = ?auto_109255 ?auto_109259 ) ) ( not ( = ?auto_109256 ?auto_109257 ) ) ( not ( = ?auto_109256 ?auto_109258 ) ) ( not ( = ?auto_109256 ?auto_109259 ) ) ( not ( = ?auto_109257 ?auto_109258 ) ) ( not ( = ?auto_109257 ?auto_109259 ) ) ( not ( = ?auto_109258 ?auto_109259 ) ) ( ON ?auto_109259 ?auto_109261 ) ( not ( = ?auto_109255 ?auto_109261 ) ) ( not ( = ?auto_109256 ?auto_109261 ) ) ( not ( = ?auto_109257 ?auto_109261 ) ) ( not ( = ?auto_109258 ?auto_109261 ) ) ( not ( = ?auto_109259 ?auto_109261 ) ) ( ON ?auto_109258 ?auto_109259 ) ( ON-TABLE ?auto_109260 ) ( ON ?auto_109261 ?auto_109260 ) ( not ( = ?auto_109260 ?auto_109261 ) ) ( not ( = ?auto_109260 ?auto_109259 ) ) ( not ( = ?auto_109260 ?auto_109258 ) ) ( not ( = ?auto_109255 ?auto_109260 ) ) ( not ( = ?auto_109256 ?auto_109260 ) ) ( not ( = ?auto_109257 ?auto_109260 ) ) ( ON ?auto_109257 ?auto_109258 ) ( CLEAR ?auto_109257 ) ( HOLDING ?auto_109256 ) ( CLEAR ?auto_109255 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109255 ?auto_109256 )
      ( MAKE-5PILE ?auto_109255 ?auto_109256 ?auto_109257 ?auto_109258 ?auto_109259 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109262 - BLOCK
      ?auto_109263 - BLOCK
      ?auto_109264 - BLOCK
      ?auto_109265 - BLOCK
      ?auto_109266 - BLOCK
    )
    :vars
    (
      ?auto_109267 - BLOCK
      ?auto_109268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109262 ) ( not ( = ?auto_109262 ?auto_109263 ) ) ( not ( = ?auto_109262 ?auto_109264 ) ) ( not ( = ?auto_109262 ?auto_109265 ) ) ( not ( = ?auto_109262 ?auto_109266 ) ) ( not ( = ?auto_109263 ?auto_109264 ) ) ( not ( = ?auto_109263 ?auto_109265 ) ) ( not ( = ?auto_109263 ?auto_109266 ) ) ( not ( = ?auto_109264 ?auto_109265 ) ) ( not ( = ?auto_109264 ?auto_109266 ) ) ( not ( = ?auto_109265 ?auto_109266 ) ) ( ON ?auto_109266 ?auto_109267 ) ( not ( = ?auto_109262 ?auto_109267 ) ) ( not ( = ?auto_109263 ?auto_109267 ) ) ( not ( = ?auto_109264 ?auto_109267 ) ) ( not ( = ?auto_109265 ?auto_109267 ) ) ( not ( = ?auto_109266 ?auto_109267 ) ) ( ON ?auto_109265 ?auto_109266 ) ( ON-TABLE ?auto_109268 ) ( ON ?auto_109267 ?auto_109268 ) ( not ( = ?auto_109268 ?auto_109267 ) ) ( not ( = ?auto_109268 ?auto_109266 ) ) ( not ( = ?auto_109268 ?auto_109265 ) ) ( not ( = ?auto_109262 ?auto_109268 ) ) ( not ( = ?auto_109263 ?auto_109268 ) ) ( not ( = ?auto_109264 ?auto_109268 ) ) ( ON ?auto_109264 ?auto_109265 ) ( CLEAR ?auto_109262 ) ( ON ?auto_109263 ?auto_109264 ) ( CLEAR ?auto_109263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109268 ?auto_109267 ?auto_109266 ?auto_109265 ?auto_109264 )
      ( MAKE-5PILE ?auto_109262 ?auto_109263 ?auto_109264 ?auto_109265 ?auto_109266 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109269 - BLOCK
      ?auto_109270 - BLOCK
      ?auto_109271 - BLOCK
      ?auto_109272 - BLOCK
      ?auto_109273 - BLOCK
    )
    :vars
    (
      ?auto_109274 - BLOCK
      ?auto_109275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109269 ?auto_109270 ) ) ( not ( = ?auto_109269 ?auto_109271 ) ) ( not ( = ?auto_109269 ?auto_109272 ) ) ( not ( = ?auto_109269 ?auto_109273 ) ) ( not ( = ?auto_109270 ?auto_109271 ) ) ( not ( = ?auto_109270 ?auto_109272 ) ) ( not ( = ?auto_109270 ?auto_109273 ) ) ( not ( = ?auto_109271 ?auto_109272 ) ) ( not ( = ?auto_109271 ?auto_109273 ) ) ( not ( = ?auto_109272 ?auto_109273 ) ) ( ON ?auto_109273 ?auto_109274 ) ( not ( = ?auto_109269 ?auto_109274 ) ) ( not ( = ?auto_109270 ?auto_109274 ) ) ( not ( = ?auto_109271 ?auto_109274 ) ) ( not ( = ?auto_109272 ?auto_109274 ) ) ( not ( = ?auto_109273 ?auto_109274 ) ) ( ON ?auto_109272 ?auto_109273 ) ( ON-TABLE ?auto_109275 ) ( ON ?auto_109274 ?auto_109275 ) ( not ( = ?auto_109275 ?auto_109274 ) ) ( not ( = ?auto_109275 ?auto_109273 ) ) ( not ( = ?auto_109275 ?auto_109272 ) ) ( not ( = ?auto_109269 ?auto_109275 ) ) ( not ( = ?auto_109270 ?auto_109275 ) ) ( not ( = ?auto_109271 ?auto_109275 ) ) ( ON ?auto_109271 ?auto_109272 ) ( ON ?auto_109270 ?auto_109271 ) ( CLEAR ?auto_109270 ) ( HOLDING ?auto_109269 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109269 )
      ( MAKE-5PILE ?auto_109269 ?auto_109270 ?auto_109271 ?auto_109272 ?auto_109273 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109276 - BLOCK
      ?auto_109277 - BLOCK
      ?auto_109278 - BLOCK
      ?auto_109279 - BLOCK
      ?auto_109280 - BLOCK
    )
    :vars
    (
      ?auto_109281 - BLOCK
      ?auto_109282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109276 ?auto_109277 ) ) ( not ( = ?auto_109276 ?auto_109278 ) ) ( not ( = ?auto_109276 ?auto_109279 ) ) ( not ( = ?auto_109276 ?auto_109280 ) ) ( not ( = ?auto_109277 ?auto_109278 ) ) ( not ( = ?auto_109277 ?auto_109279 ) ) ( not ( = ?auto_109277 ?auto_109280 ) ) ( not ( = ?auto_109278 ?auto_109279 ) ) ( not ( = ?auto_109278 ?auto_109280 ) ) ( not ( = ?auto_109279 ?auto_109280 ) ) ( ON ?auto_109280 ?auto_109281 ) ( not ( = ?auto_109276 ?auto_109281 ) ) ( not ( = ?auto_109277 ?auto_109281 ) ) ( not ( = ?auto_109278 ?auto_109281 ) ) ( not ( = ?auto_109279 ?auto_109281 ) ) ( not ( = ?auto_109280 ?auto_109281 ) ) ( ON ?auto_109279 ?auto_109280 ) ( ON-TABLE ?auto_109282 ) ( ON ?auto_109281 ?auto_109282 ) ( not ( = ?auto_109282 ?auto_109281 ) ) ( not ( = ?auto_109282 ?auto_109280 ) ) ( not ( = ?auto_109282 ?auto_109279 ) ) ( not ( = ?auto_109276 ?auto_109282 ) ) ( not ( = ?auto_109277 ?auto_109282 ) ) ( not ( = ?auto_109278 ?auto_109282 ) ) ( ON ?auto_109278 ?auto_109279 ) ( ON ?auto_109277 ?auto_109278 ) ( ON ?auto_109276 ?auto_109277 ) ( CLEAR ?auto_109276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109282 ?auto_109281 ?auto_109280 ?auto_109279 ?auto_109278 ?auto_109277 )
      ( MAKE-5PILE ?auto_109276 ?auto_109277 ?auto_109278 ?auto_109279 ?auto_109280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109283 - BLOCK
      ?auto_109284 - BLOCK
      ?auto_109285 - BLOCK
      ?auto_109286 - BLOCK
      ?auto_109287 - BLOCK
    )
    :vars
    (
      ?auto_109288 - BLOCK
      ?auto_109289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109283 ?auto_109284 ) ) ( not ( = ?auto_109283 ?auto_109285 ) ) ( not ( = ?auto_109283 ?auto_109286 ) ) ( not ( = ?auto_109283 ?auto_109287 ) ) ( not ( = ?auto_109284 ?auto_109285 ) ) ( not ( = ?auto_109284 ?auto_109286 ) ) ( not ( = ?auto_109284 ?auto_109287 ) ) ( not ( = ?auto_109285 ?auto_109286 ) ) ( not ( = ?auto_109285 ?auto_109287 ) ) ( not ( = ?auto_109286 ?auto_109287 ) ) ( ON ?auto_109287 ?auto_109288 ) ( not ( = ?auto_109283 ?auto_109288 ) ) ( not ( = ?auto_109284 ?auto_109288 ) ) ( not ( = ?auto_109285 ?auto_109288 ) ) ( not ( = ?auto_109286 ?auto_109288 ) ) ( not ( = ?auto_109287 ?auto_109288 ) ) ( ON ?auto_109286 ?auto_109287 ) ( ON-TABLE ?auto_109289 ) ( ON ?auto_109288 ?auto_109289 ) ( not ( = ?auto_109289 ?auto_109288 ) ) ( not ( = ?auto_109289 ?auto_109287 ) ) ( not ( = ?auto_109289 ?auto_109286 ) ) ( not ( = ?auto_109283 ?auto_109289 ) ) ( not ( = ?auto_109284 ?auto_109289 ) ) ( not ( = ?auto_109285 ?auto_109289 ) ) ( ON ?auto_109285 ?auto_109286 ) ( ON ?auto_109284 ?auto_109285 ) ( HOLDING ?auto_109283 ) ( CLEAR ?auto_109284 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109289 ?auto_109288 ?auto_109287 ?auto_109286 ?auto_109285 ?auto_109284 ?auto_109283 )
      ( MAKE-5PILE ?auto_109283 ?auto_109284 ?auto_109285 ?auto_109286 ?auto_109287 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109290 - BLOCK
      ?auto_109291 - BLOCK
      ?auto_109292 - BLOCK
      ?auto_109293 - BLOCK
      ?auto_109294 - BLOCK
    )
    :vars
    (
      ?auto_109296 - BLOCK
      ?auto_109295 - BLOCK
      ?auto_109297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109290 ?auto_109291 ) ) ( not ( = ?auto_109290 ?auto_109292 ) ) ( not ( = ?auto_109290 ?auto_109293 ) ) ( not ( = ?auto_109290 ?auto_109294 ) ) ( not ( = ?auto_109291 ?auto_109292 ) ) ( not ( = ?auto_109291 ?auto_109293 ) ) ( not ( = ?auto_109291 ?auto_109294 ) ) ( not ( = ?auto_109292 ?auto_109293 ) ) ( not ( = ?auto_109292 ?auto_109294 ) ) ( not ( = ?auto_109293 ?auto_109294 ) ) ( ON ?auto_109294 ?auto_109296 ) ( not ( = ?auto_109290 ?auto_109296 ) ) ( not ( = ?auto_109291 ?auto_109296 ) ) ( not ( = ?auto_109292 ?auto_109296 ) ) ( not ( = ?auto_109293 ?auto_109296 ) ) ( not ( = ?auto_109294 ?auto_109296 ) ) ( ON ?auto_109293 ?auto_109294 ) ( ON-TABLE ?auto_109295 ) ( ON ?auto_109296 ?auto_109295 ) ( not ( = ?auto_109295 ?auto_109296 ) ) ( not ( = ?auto_109295 ?auto_109294 ) ) ( not ( = ?auto_109295 ?auto_109293 ) ) ( not ( = ?auto_109290 ?auto_109295 ) ) ( not ( = ?auto_109291 ?auto_109295 ) ) ( not ( = ?auto_109292 ?auto_109295 ) ) ( ON ?auto_109292 ?auto_109293 ) ( ON ?auto_109291 ?auto_109292 ) ( CLEAR ?auto_109291 ) ( ON ?auto_109290 ?auto_109297 ) ( CLEAR ?auto_109290 ) ( HAND-EMPTY ) ( not ( = ?auto_109290 ?auto_109297 ) ) ( not ( = ?auto_109291 ?auto_109297 ) ) ( not ( = ?auto_109292 ?auto_109297 ) ) ( not ( = ?auto_109293 ?auto_109297 ) ) ( not ( = ?auto_109294 ?auto_109297 ) ) ( not ( = ?auto_109296 ?auto_109297 ) ) ( not ( = ?auto_109295 ?auto_109297 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109290 ?auto_109297 )
      ( MAKE-5PILE ?auto_109290 ?auto_109291 ?auto_109292 ?auto_109293 ?auto_109294 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109298 - BLOCK
      ?auto_109299 - BLOCK
      ?auto_109300 - BLOCK
      ?auto_109301 - BLOCK
      ?auto_109302 - BLOCK
    )
    :vars
    (
      ?auto_109305 - BLOCK
      ?auto_109304 - BLOCK
      ?auto_109303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109298 ?auto_109299 ) ) ( not ( = ?auto_109298 ?auto_109300 ) ) ( not ( = ?auto_109298 ?auto_109301 ) ) ( not ( = ?auto_109298 ?auto_109302 ) ) ( not ( = ?auto_109299 ?auto_109300 ) ) ( not ( = ?auto_109299 ?auto_109301 ) ) ( not ( = ?auto_109299 ?auto_109302 ) ) ( not ( = ?auto_109300 ?auto_109301 ) ) ( not ( = ?auto_109300 ?auto_109302 ) ) ( not ( = ?auto_109301 ?auto_109302 ) ) ( ON ?auto_109302 ?auto_109305 ) ( not ( = ?auto_109298 ?auto_109305 ) ) ( not ( = ?auto_109299 ?auto_109305 ) ) ( not ( = ?auto_109300 ?auto_109305 ) ) ( not ( = ?auto_109301 ?auto_109305 ) ) ( not ( = ?auto_109302 ?auto_109305 ) ) ( ON ?auto_109301 ?auto_109302 ) ( ON-TABLE ?auto_109304 ) ( ON ?auto_109305 ?auto_109304 ) ( not ( = ?auto_109304 ?auto_109305 ) ) ( not ( = ?auto_109304 ?auto_109302 ) ) ( not ( = ?auto_109304 ?auto_109301 ) ) ( not ( = ?auto_109298 ?auto_109304 ) ) ( not ( = ?auto_109299 ?auto_109304 ) ) ( not ( = ?auto_109300 ?auto_109304 ) ) ( ON ?auto_109300 ?auto_109301 ) ( ON ?auto_109298 ?auto_109303 ) ( CLEAR ?auto_109298 ) ( not ( = ?auto_109298 ?auto_109303 ) ) ( not ( = ?auto_109299 ?auto_109303 ) ) ( not ( = ?auto_109300 ?auto_109303 ) ) ( not ( = ?auto_109301 ?auto_109303 ) ) ( not ( = ?auto_109302 ?auto_109303 ) ) ( not ( = ?auto_109305 ?auto_109303 ) ) ( not ( = ?auto_109304 ?auto_109303 ) ) ( HOLDING ?auto_109299 ) ( CLEAR ?auto_109300 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109304 ?auto_109305 ?auto_109302 ?auto_109301 ?auto_109300 ?auto_109299 )
      ( MAKE-5PILE ?auto_109298 ?auto_109299 ?auto_109300 ?auto_109301 ?auto_109302 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109306 - BLOCK
      ?auto_109307 - BLOCK
      ?auto_109308 - BLOCK
      ?auto_109309 - BLOCK
      ?auto_109310 - BLOCK
    )
    :vars
    (
      ?auto_109311 - BLOCK
      ?auto_109313 - BLOCK
      ?auto_109312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109306 ?auto_109307 ) ) ( not ( = ?auto_109306 ?auto_109308 ) ) ( not ( = ?auto_109306 ?auto_109309 ) ) ( not ( = ?auto_109306 ?auto_109310 ) ) ( not ( = ?auto_109307 ?auto_109308 ) ) ( not ( = ?auto_109307 ?auto_109309 ) ) ( not ( = ?auto_109307 ?auto_109310 ) ) ( not ( = ?auto_109308 ?auto_109309 ) ) ( not ( = ?auto_109308 ?auto_109310 ) ) ( not ( = ?auto_109309 ?auto_109310 ) ) ( ON ?auto_109310 ?auto_109311 ) ( not ( = ?auto_109306 ?auto_109311 ) ) ( not ( = ?auto_109307 ?auto_109311 ) ) ( not ( = ?auto_109308 ?auto_109311 ) ) ( not ( = ?auto_109309 ?auto_109311 ) ) ( not ( = ?auto_109310 ?auto_109311 ) ) ( ON ?auto_109309 ?auto_109310 ) ( ON-TABLE ?auto_109313 ) ( ON ?auto_109311 ?auto_109313 ) ( not ( = ?auto_109313 ?auto_109311 ) ) ( not ( = ?auto_109313 ?auto_109310 ) ) ( not ( = ?auto_109313 ?auto_109309 ) ) ( not ( = ?auto_109306 ?auto_109313 ) ) ( not ( = ?auto_109307 ?auto_109313 ) ) ( not ( = ?auto_109308 ?auto_109313 ) ) ( ON ?auto_109308 ?auto_109309 ) ( ON ?auto_109306 ?auto_109312 ) ( not ( = ?auto_109306 ?auto_109312 ) ) ( not ( = ?auto_109307 ?auto_109312 ) ) ( not ( = ?auto_109308 ?auto_109312 ) ) ( not ( = ?auto_109309 ?auto_109312 ) ) ( not ( = ?auto_109310 ?auto_109312 ) ) ( not ( = ?auto_109311 ?auto_109312 ) ) ( not ( = ?auto_109313 ?auto_109312 ) ) ( CLEAR ?auto_109308 ) ( ON ?auto_109307 ?auto_109306 ) ( CLEAR ?auto_109307 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109312 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109312 ?auto_109306 )
      ( MAKE-5PILE ?auto_109306 ?auto_109307 ?auto_109308 ?auto_109309 ?auto_109310 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109314 - BLOCK
      ?auto_109315 - BLOCK
      ?auto_109316 - BLOCK
      ?auto_109317 - BLOCK
      ?auto_109318 - BLOCK
    )
    :vars
    (
      ?auto_109320 - BLOCK
      ?auto_109319 - BLOCK
      ?auto_109321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109314 ?auto_109315 ) ) ( not ( = ?auto_109314 ?auto_109316 ) ) ( not ( = ?auto_109314 ?auto_109317 ) ) ( not ( = ?auto_109314 ?auto_109318 ) ) ( not ( = ?auto_109315 ?auto_109316 ) ) ( not ( = ?auto_109315 ?auto_109317 ) ) ( not ( = ?auto_109315 ?auto_109318 ) ) ( not ( = ?auto_109316 ?auto_109317 ) ) ( not ( = ?auto_109316 ?auto_109318 ) ) ( not ( = ?auto_109317 ?auto_109318 ) ) ( ON ?auto_109318 ?auto_109320 ) ( not ( = ?auto_109314 ?auto_109320 ) ) ( not ( = ?auto_109315 ?auto_109320 ) ) ( not ( = ?auto_109316 ?auto_109320 ) ) ( not ( = ?auto_109317 ?auto_109320 ) ) ( not ( = ?auto_109318 ?auto_109320 ) ) ( ON ?auto_109317 ?auto_109318 ) ( ON-TABLE ?auto_109319 ) ( ON ?auto_109320 ?auto_109319 ) ( not ( = ?auto_109319 ?auto_109320 ) ) ( not ( = ?auto_109319 ?auto_109318 ) ) ( not ( = ?auto_109319 ?auto_109317 ) ) ( not ( = ?auto_109314 ?auto_109319 ) ) ( not ( = ?auto_109315 ?auto_109319 ) ) ( not ( = ?auto_109316 ?auto_109319 ) ) ( ON ?auto_109314 ?auto_109321 ) ( not ( = ?auto_109314 ?auto_109321 ) ) ( not ( = ?auto_109315 ?auto_109321 ) ) ( not ( = ?auto_109316 ?auto_109321 ) ) ( not ( = ?auto_109317 ?auto_109321 ) ) ( not ( = ?auto_109318 ?auto_109321 ) ) ( not ( = ?auto_109320 ?auto_109321 ) ) ( not ( = ?auto_109319 ?auto_109321 ) ) ( ON ?auto_109315 ?auto_109314 ) ( CLEAR ?auto_109315 ) ( ON-TABLE ?auto_109321 ) ( HOLDING ?auto_109316 ) ( CLEAR ?auto_109317 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109319 ?auto_109320 ?auto_109318 ?auto_109317 ?auto_109316 )
      ( MAKE-5PILE ?auto_109314 ?auto_109315 ?auto_109316 ?auto_109317 ?auto_109318 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109322 - BLOCK
      ?auto_109323 - BLOCK
      ?auto_109324 - BLOCK
      ?auto_109325 - BLOCK
      ?auto_109326 - BLOCK
    )
    :vars
    (
      ?auto_109327 - BLOCK
      ?auto_109328 - BLOCK
      ?auto_109329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109322 ?auto_109323 ) ) ( not ( = ?auto_109322 ?auto_109324 ) ) ( not ( = ?auto_109322 ?auto_109325 ) ) ( not ( = ?auto_109322 ?auto_109326 ) ) ( not ( = ?auto_109323 ?auto_109324 ) ) ( not ( = ?auto_109323 ?auto_109325 ) ) ( not ( = ?auto_109323 ?auto_109326 ) ) ( not ( = ?auto_109324 ?auto_109325 ) ) ( not ( = ?auto_109324 ?auto_109326 ) ) ( not ( = ?auto_109325 ?auto_109326 ) ) ( ON ?auto_109326 ?auto_109327 ) ( not ( = ?auto_109322 ?auto_109327 ) ) ( not ( = ?auto_109323 ?auto_109327 ) ) ( not ( = ?auto_109324 ?auto_109327 ) ) ( not ( = ?auto_109325 ?auto_109327 ) ) ( not ( = ?auto_109326 ?auto_109327 ) ) ( ON ?auto_109325 ?auto_109326 ) ( ON-TABLE ?auto_109328 ) ( ON ?auto_109327 ?auto_109328 ) ( not ( = ?auto_109328 ?auto_109327 ) ) ( not ( = ?auto_109328 ?auto_109326 ) ) ( not ( = ?auto_109328 ?auto_109325 ) ) ( not ( = ?auto_109322 ?auto_109328 ) ) ( not ( = ?auto_109323 ?auto_109328 ) ) ( not ( = ?auto_109324 ?auto_109328 ) ) ( ON ?auto_109322 ?auto_109329 ) ( not ( = ?auto_109322 ?auto_109329 ) ) ( not ( = ?auto_109323 ?auto_109329 ) ) ( not ( = ?auto_109324 ?auto_109329 ) ) ( not ( = ?auto_109325 ?auto_109329 ) ) ( not ( = ?auto_109326 ?auto_109329 ) ) ( not ( = ?auto_109327 ?auto_109329 ) ) ( not ( = ?auto_109328 ?auto_109329 ) ) ( ON ?auto_109323 ?auto_109322 ) ( ON-TABLE ?auto_109329 ) ( CLEAR ?auto_109325 ) ( ON ?auto_109324 ?auto_109323 ) ( CLEAR ?auto_109324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109329 ?auto_109322 ?auto_109323 )
      ( MAKE-5PILE ?auto_109322 ?auto_109323 ?auto_109324 ?auto_109325 ?auto_109326 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109330 - BLOCK
      ?auto_109331 - BLOCK
      ?auto_109332 - BLOCK
      ?auto_109333 - BLOCK
      ?auto_109334 - BLOCK
    )
    :vars
    (
      ?auto_109336 - BLOCK
      ?auto_109335 - BLOCK
      ?auto_109337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109330 ?auto_109331 ) ) ( not ( = ?auto_109330 ?auto_109332 ) ) ( not ( = ?auto_109330 ?auto_109333 ) ) ( not ( = ?auto_109330 ?auto_109334 ) ) ( not ( = ?auto_109331 ?auto_109332 ) ) ( not ( = ?auto_109331 ?auto_109333 ) ) ( not ( = ?auto_109331 ?auto_109334 ) ) ( not ( = ?auto_109332 ?auto_109333 ) ) ( not ( = ?auto_109332 ?auto_109334 ) ) ( not ( = ?auto_109333 ?auto_109334 ) ) ( ON ?auto_109334 ?auto_109336 ) ( not ( = ?auto_109330 ?auto_109336 ) ) ( not ( = ?auto_109331 ?auto_109336 ) ) ( not ( = ?auto_109332 ?auto_109336 ) ) ( not ( = ?auto_109333 ?auto_109336 ) ) ( not ( = ?auto_109334 ?auto_109336 ) ) ( ON-TABLE ?auto_109335 ) ( ON ?auto_109336 ?auto_109335 ) ( not ( = ?auto_109335 ?auto_109336 ) ) ( not ( = ?auto_109335 ?auto_109334 ) ) ( not ( = ?auto_109335 ?auto_109333 ) ) ( not ( = ?auto_109330 ?auto_109335 ) ) ( not ( = ?auto_109331 ?auto_109335 ) ) ( not ( = ?auto_109332 ?auto_109335 ) ) ( ON ?auto_109330 ?auto_109337 ) ( not ( = ?auto_109330 ?auto_109337 ) ) ( not ( = ?auto_109331 ?auto_109337 ) ) ( not ( = ?auto_109332 ?auto_109337 ) ) ( not ( = ?auto_109333 ?auto_109337 ) ) ( not ( = ?auto_109334 ?auto_109337 ) ) ( not ( = ?auto_109336 ?auto_109337 ) ) ( not ( = ?auto_109335 ?auto_109337 ) ) ( ON ?auto_109331 ?auto_109330 ) ( ON-TABLE ?auto_109337 ) ( ON ?auto_109332 ?auto_109331 ) ( CLEAR ?auto_109332 ) ( HOLDING ?auto_109333 ) ( CLEAR ?auto_109334 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109335 ?auto_109336 ?auto_109334 ?auto_109333 )
      ( MAKE-5PILE ?auto_109330 ?auto_109331 ?auto_109332 ?auto_109333 ?auto_109334 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109338 - BLOCK
      ?auto_109339 - BLOCK
      ?auto_109340 - BLOCK
      ?auto_109341 - BLOCK
      ?auto_109342 - BLOCK
    )
    :vars
    (
      ?auto_109344 - BLOCK
      ?auto_109345 - BLOCK
      ?auto_109343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109338 ?auto_109339 ) ) ( not ( = ?auto_109338 ?auto_109340 ) ) ( not ( = ?auto_109338 ?auto_109341 ) ) ( not ( = ?auto_109338 ?auto_109342 ) ) ( not ( = ?auto_109339 ?auto_109340 ) ) ( not ( = ?auto_109339 ?auto_109341 ) ) ( not ( = ?auto_109339 ?auto_109342 ) ) ( not ( = ?auto_109340 ?auto_109341 ) ) ( not ( = ?auto_109340 ?auto_109342 ) ) ( not ( = ?auto_109341 ?auto_109342 ) ) ( ON ?auto_109342 ?auto_109344 ) ( not ( = ?auto_109338 ?auto_109344 ) ) ( not ( = ?auto_109339 ?auto_109344 ) ) ( not ( = ?auto_109340 ?auto_109344 ) ) ( not ( = ?auto_109341 ?auto_109344 ) ) ( not ( = ?auto_109342 ?auto_109344 ) ) ( ON-TABLE ?auto_109345 ) ( ON ?auto_109344 ?auto_109345 ) ( not ( = ?auto_109345 ?auto_109344 ) ) ( not ( = ?auto_109345 ?auto_109342 ) ) ( not ( = ?auto_109345 ?auto_109341 ) ) ( not ( = ?auto_109338 ?auto_109345 ) ) ( not ( = ?auto_109339 ?auto_109345 ) ) ( not ( = ?auto_109340 ?auto_109345 ) ) ( ON ?auto_109338 ?auto_109343 ) ( not ( = ?auto_109338 ?auto_109343 ) ) ( not ( = ?auto_109339 ?auto_109343 ) ) ( not ( = ?auto_109340 ?auto_109343 ) ) ( not ( = ?auto_109341 ?auto_109343 ) ) ( not ( = ?auto_109342 ?auto_109343 ) ) ( not ( = ?auto_109344 ?auto_109343 ) ) ( not ( = ?auto_109345 ?auto_109343 ) ) ( ON ?auto_109339 ?auto_109338 ) ( ON-TABLE ?auto_109343 ) ( ON ?auto_109340 ?auto_109339 ) ( CLEAR ?auto_109342 ) ( ON ?auto_109341 ?auto_109340 ) ( CLEAR ?auto_109341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109343 ?auto_109338 ?auto_109339 ?auto_109340 )
      ( MAKE-5PILE ?auto_109338 ?auto_109339 ?auto_109340 ?auto_109341 ?auto_109342 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109346 - BLOCK
      ?auto_109347 - BLOCK
      ?auto_109348 - BLOCK
      ?auto_109349 - BLOCK
      ?auto_109350 - BLOCK
    )
    :vars
    (
      ?auto_109352 - BLOCK
      ?auto_109351 - BLOCK
      ?auto_109353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109346 ?auto_109347 ) ) ( not ( = ?auto_109346 ?auto_109348 ) ) ( not ( = ?auto_109346 ?auto_109349 ) ) ( not ( = ?auto_109346 ?auto_109350 ) ) ( not ( = ?auto_109347 ?auto_109348 ) ) ( not ( = ?auto_109347 ?auto_109349 ) ) ( not ( = ?auto_109347 ?auto_109350 ) ) ( not ( = ?auto_109348 ?auto_109349 ) ) ( not ( = ?auto_109348 ?auto_109350 ) ) ( not ( = ?auto_109349 ?auto_109350 ) ) ( not ( = ?auto_109346 ?auto_109352 ) ) ( not ( = ?auto_109347 ?auto_109352 ) ) ( not ( = ?auto_109348 ?auto_109352 ) ) ( not ( = ?auto_109349 ?auto_109352 ) ) ( not ( = ?auto_109350 ?auto_109352 ) ) ( ON-TABLE ?auto_109351 ) ( ON ?auto_109352 ?auto_109351 ) ( not ( = ?auto_109351 ?auto_109352 ) ) ( not ( = ?auto_109351 ?auto_109350 ) ) ( not ( = ?auto_109351 ?auto_109349 ) ) ( not ( = ?auto_109346 ?auto_109351 ) ) ( not ( = ?auto_109347 ?auto_109351 ) ) ( not ( = ?auto_109348 ?auto_109351 ) ) ( ON ?auto_109346 ?auto_109353 ) ( not ( = ?auto_109346 ?auto_109353 ) ) ( not ( = ?auto_109347 ?auto_109353 ) ) ( not ( = ?auto_109348 ?auto_109353 ) ) ( not ( = ?auto_109349 ?auto_109353 ) ) ( not ( = ?auto_109350 ?auto_109353 ) ) ( not ( = ?auto_109352 ?auto_109353 ) ) ( not ( = ?auto_109351 ?auto_109353 ) ) ( ON ?auto_109347 ?auto_109346 ) ( ON-TABLE ?auto_109353 ) ( ON ?auto_109348 ?auto_109347 ) ( ON ?auto_109349 ?auto_109348 ) ( CLEAR ?auto_109349 ) ( HOLDING ?auto_109350 ) ( CLEAR ?auto_109352 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109351 ?auto_109352 ?auto_109350 )
      ( MAKE-5PILE ?auto_109346 ?auto_109347 ?auto_109348 ?auto_109349 ?auto_109350 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109354 - BLOCK
      ?auto_109355 - BLOCK
      ?auto_109356 - BLOCK
      ?auto_109357 - BLOCK
      ?auto_109358 - BLOCK
    )
    :vars
    (
      ?auto_109359 - BLOCK
      ?auto_109360 - BLOCK
      ?auto_109361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109354 ?auto_109355 ) ) ( not ( = ?auto_109354 ?auto_109356 ) ) ( not ( = ?auto_109354 ?auto_109357 ) ) ( not ( = ?auto_109354 ?auto_109358 ) ) ( not ( = ?auto_109355 ?auto_109356 ) ) ( not ( = ?auto_109355 ?auto_109357 ) ) ( not ( = ?auto_109355 ?auto_109358 ) ) ( not ( = ?auto_109356 ?auto_109357 ) ) ( not ( = ?auto_109356 ?auto_109358 ) ) ( not ( = ?auto_109357 ?auto_109358 ) ) ( not ( = ?auto_109354 ?auto_109359 ) ) ( not ( = ?auto_109355 ?auto_109359 ) ) ( not ( = ?auto_109356 ?auto_109359 ) ) ( not ( = ?auto_109357 ?auto_109359 ) ) ( not ( = ?auto_109358 ?auto_109359 ) ) ( ON-TABLE ?auto_109360 ) ( ON ?auto_109359 ?auto_109360 ) ( not ( = ?auto_109360 ?auto_109359 ) ) ( not ( = ?auto_109360 ?auto_109358 ) ) ( not ( = ?auto_109360 ?auto_109357 ) ) ( not ( = ?auto_109354 ?auto_109360 ) ) ( not ( = ?auto_109355 ?auto_109360 ) ) ( not ( = ?auto_109356 ?auto_109360 ) ) ( ON ?auto_109354 ?auto_109361 ) ( not ( = ?auto_109354 ?auto_109361 ) ) ( not ( = ?auto_109355 ?auto_109361 ) ) ( not ( = ?auto_109356 ?auto_109361 ) ) ( not ( = ?auto_109357 ?auto_109361 ) ) ( not ( = ?auto_109358 ?auto_109361 ) ) ( not ( = ?auto_109359 ?auto_109361 ) ) ( not ( = ?auto_109360 ?auto_109361 ) ) ( ON ?auto_109355 ?auto_109354 ) ( ON-TABLE ?auto_109361 ) ( ON ?auto_109356 ?auto_109355 ) ( ON ?auto_109357 ?auto_109356 ) ( CLEAR ?auto_109359 ) ( ON ?auto_109358 ?auto_109357 ) ( CLEAR ?auto_109358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109361 ?auto_109354 ?auto_109355 ?auto_109356 ?auto_109357 )
      ( MAKE-5PILE ?auto_109354 ?auto_109355 ?auto_109356 ?auto_109357 ?auto_109358 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109362 - BLOCK
      ?auto_109363 - BLOCK
      ?auto_109364 - BLOCK
      ?auto_109365 - BLOCK
      ?auto_109366 - BLOCK
    )
    :vars
    (
      ?auto_109367 - BLOCK
      ?auto_109368 - BLOCK
      ?auto_109369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109362 ?auto_109363 ) ) ( not ( = ?auto_109362 ?auto_109364 ) ) ( not ( = ?auto_109362 ?auto_109365 ) ) ( not ( = ?auto_109362 ?auto_109366 ) ) ( not ( = ?auto_109363 ?auto_109364 ) ) ( not ( = ?auto_109363 ?auto_109365 ) ) ( not ( = ?auto_109363 ?auto_109366 ) ) ( not ( = ?auto_109364 ?auto_109365 ) ) ( not ( = ?auto_109364 ?auto_109366 ) ) ( not ( = ?auto_109365 ?auto_109366 ) ) ( not ( = ?auto_109362 ?auto_109367 ) ) ( not ( = ?auto_109363 ?auto_109367 ) ) ( not ( = ?auto_109364 ?auto_109367 ) ) ( not ( = ?auto_109365 ?auto_109367 ) ) ( not ( = ?auto_109366 ?auto_109367 ) ) ( ON-TABLE ?auto_109368 ) ( not ( = ?auto_109368 ?auto_109367 ) ) ( not ( = ?auto_109368 ?auto_109366 ) ) ( not ( = ?auto_109368 ?auto_109365 ) ) ( not ( = ?auto_109362 ?auto_109368 ) ) ( not ( = ?auto_109363 ?auto_109368 ) ) ( not ( = ?auto_109364 ?auto_109368 ) ) ( ON ?auto_109362 ?auto_109369 ) ( not ( = ?auto_109362 ?auto_109369 ) ) ( not ( = ?auto_109363 ?auto_109369 ) ) ( not ( = ?auto_109364 ?auto_109369 ) ) ( not ( = ?auto_109365 ?auto_109369 ) ) ( not ( = ?auto_109366 ?auto_109369 ) ) ( not ( = ?auto_109367 ?auto_109369 ) ) ( not ( = ?auto_109368 ?auto_109369 ) ) ( ON ?auto_109363 ?auto_109362 ) ( ON-TABLE ?auto_109369 ) ( ON ?auto_109364 ?auto_109363 ) ( ON ?auto_109365 ?auto_109364 ) ( ON ?auto_109366 ?auto_109365 ) ( CLEAR ?auto_109366 ) ( HOLDING ?auto_109367 ) ( CLEAR ?auto_109368 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109368 ?auto_109367 )
      ( MAKE-5PILE ?auto_109362 ?auto_109363 ?auto_109364 ?auto_109365 ?auto_109366 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109370 - BLOCK
      ?auto_109371 - BLOCK
      ?auto_109372 - BLOCK
      ?auto_109373 - BLOCK
      ?auto_109374 - BLOCK
    )
    :vars
    (
      ?auto_109376 - BLOCK
      ?auto_109377 - BLOCK
      ?auto_109375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109370 ?auto_109371 ) ) ( not ( = ?auto_109370 ?auto_109372 ) ) ( not ( = ?auto_109370 ?auto_109373 ) ) ( not ( = ?auto_109370 ?auto_109374 ) ) ( not ( = ?auto_109371 ?auto_109372 ) ) ( not ( = ?auto_109371 ?auto_109373 ) ) ( not ( = ?auto_109371 ?auto_109374 ) ) ( not ( = ?auto_109372 ?auto_109373 ) ) ( not ( = ?auto_109372 ?auto_109374 ) ) ( not ( = ?auto_109373 ?auto_109374 ) ) ( not ( = ?auto_109370 ?auto_109376 ) ) ( not ( = ?auto_109371 ?auto_109376 ) ) ( not ( = ?auto_109372 ?auto_109376 ) ) ( not ( = ?auto_109373 ?auto_109376 ) ) ( not ( = ?auto_109374 ?auto_109376 ) ) ( ON-TABLE ?auto_109377 ) ( not ( = ?auto_109377 ?auto_109376 ) ) ( not ( = ?auto_109377 ?auto_109374 ) ) ( not ( = ?auto_109377 ?auto_109373 ) ) ( not ( = ?auto_109370 ?auto_109377 ) ) ( not ( = ?auto_109371 ?auto_109377 ) ) ( not ( = ?auto_109372 ?auto_109377 ) ) ( ON ?auto_109370 ?auto_109375 ) ( not ( = ?auto_109370 ?auto_109375 ) ) ( not ( = ?auto_109371 ?auto_109375 ) ) ( not ( = ?auto_109372 ?auto_109375 ) ) ( not ( = ?auto_109373 ?auto_109375 ) ) ( not ( = ?auto_109374 ?auto_109375 ) ) ( not ( = ?auto_109376 ?auto_109375 ) ) ( not ( = ?auto_109377 ?auto_109375 ) ) ( ON ?auto_109371 ?auto_109370 ) ( ON-TABLE ?auto_109375 ) ( ON ?auto_109372 ?auto_109371 ) ( ON ?auto_109373 ?auto_109372 ) ( ON ?auto_109374 ?auto_109373 ) ( CLEAR ?auto_109377 ) ( ON ?auto_109376 ?auto_109374 ) ( CLEAR ?auto_109376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109375 ?auto_109370 ?auto_109371 ?auto_109372 ?auto_109373 ?auto_109374 )
      ( MAKE-5PILE ?auto_109370 ?auto_109371 ?auto_109372 ?auto_109373 ?auto_109374 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109378 - BLOCK
      ?auto_109379 - BLOCK
      ?auto_109380 - BLOCK
      ?auto_109381 - BLOCK
      ?auto_109382 - BLOCK
    )
    :vars
    (
      ?auto_109384 - BLOCK
      ?auto_109383 - BLOCK
      ?auto_109385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109378 ?auto_109379 ) ) ( not ( = ?auto_109378 ?auto_109380 ) ) ( not ( = ?auto_109378 ?auto_109381 ) ) ( not ( = ?auto_109378 ?auto_109382 ) ) ( not ( = ?auto_109379 ?auto_109380 ) ) ( not ( = ?auto_109379 ?auto_109381 ) ) ( not ( = ?auto_109379 ?auto_109382 ) ) ( not ( = ?auto_109380 ?auto_109381 ) ) ( not ( = ?auto_109380 ?auto_109382 ) ) ( not ( = ?auto_109381 ?auto_109382 ) ) ( not ( = ?auto_109378 ?auto_109384 ) ) ( not ( = ?auto_109379 ?auto_109384 ) ) ( not ( = ?auto_109380 ?auto_109384 ) ) ( not ( = ?auto_109381 ?auto_109384 ) ) ( not ( = ?auto_109382 ?auto_109384 ) ) ( not ( = ?auto_109383 ?auto_109384 ) ) ( not ( = ?auto_109383 ?auto_109382 ) ) ( not ( = ?auto_109383 ?auto_109381 ) ) ( not ( = ?auto_109378 ?auto_109383 ) ) ( not ( = ?auto_109379 ?auto_109383 ) ) ( not ( = ?auto_109380 ?auto_109383 ) ) ( ON ?auto_109378 ?auto_109385 ) ( not ( = ?auto_109378 ?auto_109385 ) ) ( not ( = ?auto_109379 ?auto_109385 ) ) ( not ( = ?auto_109380 ?auto_109385 ) ) ( not ( = ?auto_109381 ?auto_109385 ) ) ( not ( = ?auto_109382 ?auto_109385 ) ) ( not ( = ?auto_109384 ?auto_109385 ) ) ( not ( = ?auto_109383 ?auto_109385 ) ) ( ON ?auto_109379 ?auto_109378 ) ( ON-TABLE ?auto_109385 ) ( ON ?auto_109380 ?auto_109379 ) ( ON ?auto_109381 ?auto_109380 ) ( ON ?auto_109382 ?auto_109381 ) ( ON ?auto_109384 ?auto_109382 ) ( CLEAR ?auto_109384 ) ( HOLDING ?auto_109383 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109383 )
      ( MAKE-5PILE ?auto_109378 ?auto_109379 ?auto_109380 ?auto_109381 ?auto_109382 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_109386 - BLOCK
      ?auto_109387 - BLOCK
      ?auto_109388 - BLOCK
      ?auto_109389 - BLOCK
      ?auto_109390 - BLOCK
    )
    :vars
    (
      ?auto_109392 - BLOCK
      ?auto_109393 - BLOCK
      ?auto_109391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109386 ?auto_109387 ) ) ( not ( = ?auto_109386 ?auto_109388 ) ) ( not ( = ?auto_109386 ?auto_109389 ) ) ( not ( = ?auto_109386 ?auto_109390 ) ) ( not ( = ?auto_109387 ?auto_109388 ) ) ( not ( = ?auto_109387 ?auto_109389 ) ) ( not ( = ?auto_109387 ?auto_109390 ) ) ( not ( = ?auto_109388 ?auto_109389 ) ) ( not ( = ?auto_109388 ?auto_109390 ) ) ( not ( = ?auto_109389 ?auto_109390 ) ) ( not ( = ?auto_109386 ?auto_109392 ) ) ( not ( = ?auto_109387 ?auto_109392 ) ) ( not ( = ?auto_109388 ?auto_109392 ) ) ( not ( = ?auto_109389 ?auto_109392 ) ) ( not ( = ?auto_109390 ?auto_109392 ) ) ( not ( = ?auto_109393 ?auto_109392 ) ) ( not ( = ?auto_109393 ?auto_109390 ) ) ( not ( = ?auto_109393 ?auto_109389 ) ) ( not ( = ?auto_109386 ?auto_109393 ) ) ( not ( = ?auto_109387 ?auto_109393 ) ) ( not ( = ?auto_109388 ?auto_109393 ) ) ( ON ?auto_109386 ?auto_109391 ) ( not ( = ?auto_109386 ?auto_109391 ) ) ( not ( = ?auto_109387 ?auto_109391 ) ) ( not ( = ?auto_109388 ?auto_109391 ) ) ( not ( = ?auto_109389 ?auto_109391 ) ) ( not ( = ?auto_109390 ?auto_109391 ) ) ( not ( = ?auto_109392 ?auto_109391 ) ) ( not ( = ?auto_109393 ?auto_109391 ) ) ( ON ?auto_109387 ?auto_109386 ) ( ON-TABLE ?auto_109391 ) ( ON ?auto_109388 ?auto_109387 ) ( ON ?auto_109389 ?auto_109388 ) ( ON ?auto_109390 ?auto_109389 ) ( ON ?auto_109392 ?auto_109390 ) ( ON ?auto_109393 ?auto_109392 ) ( CLEAR ?auto_109393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109391 ?auto_109386 ?auto_109387 ?auto_109388 ?auto_109389 ?auto_109390 ?auto_109392 )
      ( MAKE-5PILE ?auto_109386 ?auto_109387 ?auto_109388 ?auto_109389 ?auto_109390 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109395 - BLOCK
    )
    :vars
    (
      ?auto_109396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109396 ?auto_109395 ) ( CLEAR ?auto_109396 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109395 ) ( not ( = ?auto_109395 ?auto_109396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109396 ?auto_109395 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109397 - BLOCK
    )
    :vars
    (
      ?auto_109398 - BLOCK
      ?auto_109399 - BLOCK
      ?auto_109400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109398 ?auto_109397 ) ( CLEAR ?auto_109398 ) ( ON-TABLE ?auto_109397 ) ( not ( = ?auto_109397 ?auto_109398 ) ) ( HOLDING ?auto_109399 ) ( CLEAR ?auto_109400 ) ( not ( = ?auto_109397 ?auto_109399 ) ) ( not ( = ?auto_109397 ?auto_109400 ) ) ( not ( = ?auto_109398 ?auto_109399 ) ) ( not ( = ?auto_109398 ?auto_109400 ) ) ( not ( = ?auto_109399 ?auto_109400 ) ) )
    :subtasks
    ( ( !STACK ?auto_109399 ?auto_109400 )
      ( MAKE-1PILE ?auto_109397 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109401 - BLOCK
    )
    :vars
    (
      ?auto_109404 - BLOCK
      ?auto_109403 - BLOCK
      ?auto_109402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109404 ?auto_109401 ) ( ON-TABLE ?auto_109401 ) ( not ( = ?auto_109401 ?auto_109404 ) ) ( CLEAR ?auto_109403 ) ( not ( = ?auto_109401 ?auto_109402 ) ) ( not ( = ?auto_109401 ?auto_109403 ) ) ( not ( = ?auto_109404 ?auto_109402 ) ) ( not ( = ?auto_109404 ?auto_109403 ) ) ( not ( = ?auto_109402 ?auto_109403 ) ) ( ON ?auto_109402 ?auto_109404 ) ( CLEAR ?auto_109402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109401 ?auto_109404 )
      ( MAKE-1PILE ?auto_109401 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109405 - BLOCK
    )
    :vars
    (
      ?auto_109408 - BLOCK
      ?auto_109407 - BLOCK
      ?auto_109406 - BLOCK
      ?auto_109409 - BLOCK
      ?auto_109411 - BLOCK
      ?auto_109410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109408 ?auto_109405 ) ( ON-TABLE ?auto_109405 ) ( not ( = ?auto_109405 ?auto_109408 ) ) ( not ( = ?auto_109405 ?auto_109407 ) ) ( not ( = ?auto_109405 ?auto_109406 ) ) ( not ( = ?auto_109408 ?auto_109407 ) ) ( not ( = ?auto_109408 ?auto_109406 ) ) ( not ( = ?auto_109407 ?auto_109406 ) ) ( ON ?auto_109407 ?auto_109408 ) ( CLEAR ?auto_109407 ) ( HOLDING ?auto_109406 ) ( CLEAR ?auto_109409 ) ( ON-TABLE ?auto_109411 ) ( ON ?auto_109410 ?auto_109411 ) ( ON ?auto_109409 ?auto_109410 ) ( not ( = ?auto_109411 ?auto_109410 ) ) ( not ( = ?auto_109411 ?auto_109409 ) ) ( not ( = ?auto_109411 ?auto_109406 ) ) ( not ( = ?auto_109410 ?auto_109409 ) ) ( not ( = ?auto_109410 ?auto_109406 ) ) ( not ( = ?auto_109409 ?auto_109406 ) ) ( not ( = ?auto_109405 ?auto_109409 ) ) ( not ( = ?auto_109405 ?auto_109411 ) ) ( not ( = ?auto_109405 ?auto_109410 ) ) ( not ( = ?auto_109408 ?auto_109409 ) ) ( not ( = ?auto_109408 ?auto_109411 ) ) ( not ( = ?auto_109408 ?auto_109410 ) ) ( not ( = ?auto_109407 ?auto_109409 ) ) ( not ( = ?auto_109407 ?auto_109411 ) ) ( not ( = ?auto_109407 ?auto_109410 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109411 ?auto_109410 ?auto_109409 ?auto_109406 )
      ( MAKE-1PILE ?auto_109405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109412 - BLOCK
    )
    :vars
    (
      ?auto_109414 - BLOCK
      ?auto_109413 - BLOCK
      ?auto_109417 - BLOCK
      ?auto_109418 - BLOCK
      ?auto_109416 - BLOCK
      ?auto_109415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109414 ?auto_109412 ) ( ON-TABLE ?auto_109412 ) ( not ( = ?auto_109412 ?auto_109414 ) ) ( not ( = ?auto_109412 ?auto_109413 ) ) ( not ( = ?auto_109412 ?auto_109417 ) ) ( not ( = ?auto_109414 ?auto_109413 ) ) ( not ( = ?auto_109414 ?auto_109417 ) ) ( not ( = ?auto_109413 ?auto_109417 ) ) ( ON ?auto_109413 ?auto_109414 ) ( CLEAR ?auto_109418 ) ( ON-TABLE ?auto_109416 ) ( ON ?auto_109415 ?auto_109416 ) ( ON ?auto_109418 ?auto_109415 ) ( not ( = ?auto_109416 ?auto_109415 ) ) ( not ( = ?auto_109416 ?auto_109418 ) ) ( not ( = ?auto_109416 ?auto_109417 ) ) ( not ( = ?auto_109415 ?auto_109418 ) ) ( not ( = ?auto_109415 ?auto_109417 ) ) ( not ( = ?auto_109418 ?auto_109417 ) ) ( not ( = ?auto_109412 ?auto_109418 ) ) ( not ( = ?auto_109412 ?auto_109416 ) ) ( not ( = ?auto_109412 ?auto_109415 ) ) ( not ( = ?auto_109414 ?auto_109418 ) ) ( not ( = ?auto_109414 ?auto_109416 ) ) ( not ( = ?auto_109414 ?auto_109415 ) ) ( not ( = ?auto_109413 ?auto_109418 ) ) ( not ( = ?auto_109413 ?auto_109416 ) ) ( not ( = ?auto_109413 ?auto_109415 ) ) ( ON ?auto_109417 ?auto_109413 ) ( CLEAR ?auto_109417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109412 ?auto_109414 ?auto_109413 )
      ( MAKE-1PILE ?auto_109412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109419 - BLOCK
    )
    :vars
    (
      ?auto_109423 - BLOCK
      ?auto_109425 - BLOCK
      ?auto_109421 - BLOCK
      ?auto_109424 - BLOCK
      ?auto_109422 - BLOCK
      ?auto_109420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109423 ?auto_109419 ) ( ON-TABLE ?auto_109419 ) ( not ( = ?auto_109419 ?auto_109423 ) ) ( not ( = ?auto_109419 ?auto_109425 ) ) ( not ( = ?auto_109419 ?auto_109421 ) ) ( not ( = ?auto_109423 ?auto_109425 ) ) ( not ( = ?auto_109423 ?auto_109421 ) ) ( not ( = ?auto_109425 ?auto_109421 ) ) ( ON ?auto_109425 ?auto_109423 ) ( ON-TABLE ?auto_109424 ) ( ON ?auto_109422 ?auto_109424 ) ( not ( = ?auto_109424 ?auto_109422 ) ) ( not ( = ?auto_109424 ?auto_109420 ) ) ( not ( = ?auto_109424 ?auto_109421 ) ) ( not ( = ?auto_109422 ?auto_109420 ) ) ( not ( = ?auto_109422 ?auto_109421 ) ) ( not ( = ?auto_109420 ?auto_109421 ) ) ( not ( = ?auto_109419 ?auto_109420 ) ) ( not ( = ?auto_109419 ?auto_109424 ) ) ( not ( = ?auto_109419 ?auto_109422 ) ) ( not ( = ?auto_109423 ?auto_109420 ) ) ( not ( = ?auto_109423 ?auto_109424 ) ) ( not ( = ?auto_109423 ?auto_109422 ) ) ( not ( = ?auto_109425 ?auto_109420 ) ) ( not ( = ?auto_109425 ?auto_109424 ) ) ( not ( = ?auto_109425 ?auto_109422 ) ) ( ON ?auto_109421 ?auto_109425 ) ( CLEAR ?auto_109421 ) ( HOLDING ?auto_109420 ) ( CLEAR ?auto_109422 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109424 ?auto_109422 ?auto_109420 )
      ( MAKE-1PILE ?auto_109419 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109426 - BLOCK
    )
    :vars
    (
      ?auto_109432 - BLOCK
      ?auto_109428 - BLOCK
      ?auto_109430 - BLOCK
      ?auto_109427 - BLOCK
      ?auto_109431 - BLOCK
      ?auto_109429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109432 ?auto_109426 ) ( ON-TABLE ?auto_109426 ) ( not ( = ?auto_109426 ?auto_109432 ) ) ( not ( = ?auto_109426 ?auto_109428 ) ) ( not ( = ?auto_109426 ?auto_109430 ) ) ( not ( = ?auto_109432 ?auto_109428 ) ) ( not ( = ?auto_109432 ?auto_109430 ) ) ( not ( = ?auto_109428 ?auto_109430 ) ) ( ON ?auto_109428 ?auto_109432 ) ( ON-TABLE ?auto_109427 ) ( ON ?auto_109431 ?auto_109427 ) ( not ( = ?auto_109427 ?auto_109431 ) ) ( not ( = ?auto_109427 ?auto_109429 ) ) ( not ( = ?auto_109427 ?auto_109430 ) ) ( not ( = ?auto_109431 ?auto_109429 ) ) ( not ( = ?auto_109431 ?auto_109430 ) ) ( not ( = ?auto_109429 ?auto_109430 ) ) ( not ( = ?auto_109426 ?auto_109429 ) ) ( not ( = ?auto_109426 ?auto_109427 ) ) ( not ( = ?auto_109426 ?auto_109431 ) ) ( not ( = ?auto_109432 ?auto_109429 ) ) ( not ( = ?auto_109432 ?auto_109427 ) ) ( not ( = ?auto_109432 ?auto_109431 ) ) ( not ( = ?auto_109428 ?auto_109429 ) ) ( not ( = ?auto_109428 ?auto_109427 ) ) ( not ( = ?auto_109428 ?auto_109431 ) ) ( ON ?auto_109430 ?auto_109428 ) ( CLEAR ?auto_109431 ) ( ON ?auto_109429 ?auto_109430 ) ( CLEAR ?auto_109429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109426 ?auto_109432 ?auto_109428 ?auto_109430 )
      ( MAKE-1PILE ?auto_109426 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109433 - BLOCK
    )
    :vars
    (
      ?auto_109437 - BLOCK
      ?auto_109439 - BLOCK
      ?auto_109434 - BLOCK
      ?auto_109438 - BLOCK
      ?auto_109436 - BLOCK
      ?auto_109435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109437 ?auto_109433 ) ( ON-TABLE ?auto_109433 ) ( not ( = ?auto_109433 ?auto_109437 ) ) ( not ( = ?auto_109433 ?auto_109439 ) ) ( not ( = ?auto_109433 ?auto_109434 ) ) ( not ( = ?auto_109437 ?auto_109439 ) ) ( not ( = ?auto_109437 ?auto_109434 ) ) ( not ( = ?auto_109439 ?auto_109434 ) ) ( ON ?auto_109439 ?auto_109437 ) ( ON-TABLE ?auto_109438 ) ( not ( = ?auto_109438 ?auto_109436 ) ) ( not ( = ?auto_109438 ?auto_109435 ) ) ( not ( = ?auto_109438 ?auto_109434 ) ) ( not ( = ?auto_109436 ?auto_109435 ) ) ( not ( = ?auto_109436 ?auto_109434 ) ) ( not ( = ?auto_109435 ?auto_109434 ) ) ( not ( = ?auto_109433 ?auto_109435 ) ) ( not ( = ?auto_109433 ?auto_109438 ) ) ( not ( = ?auto_109433 ?auto_109436 ) ) ( not ( = ?auto_109437 ?auto_109435 ) ) ( not ( = ?auto_109437 ?auto_109438 ) ) ( not ( = ?auto_109437 ?auto_109436 ) ) ( not ( = ?auto_109439 ?auto_109435 ) ) ( not ( = ?auto_109439 ?auto_109438 ) ) ( not ( = ?auto_109439 ?auto_109436 ) ) ( ON ?auto_109434 ?auto_109439 ) ( ON ?auto_109435 ?auto_109434 ) ( CLEAR ?auto_109435 ) ( HOLDING ?auto_109436 ) ( CLEAR ?auto_109438 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109438 ?auto_109436 )
      ( MAKE-1PILE ?auto_109433 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109440 - BLOCK
    )
    :vars
    (
      ?auto_109443 - BLOCK
      ?auto_109444 - BLOCK
      ?auto_109445 - BLOCK
      ?auto_109446 - BLOCK
      ?auto_109441 - BLOCK
      ?auto_109442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109443 ?auto_109440 ) ( ON-TABLE ?auto_109440 ) ( not ( = ?auto_109440 ?auto_109443 ) ) ( not ( = ?auto_109440 ?auto_109444 ) ) ( not ( = ?auto_109440 ?auto_109445 ) ) ( not ( = ?auto_109443 ?auto_109444 ) ) ( not ( = ?auto_109443 ?auto_109445 ) ) ( not ( = ?auto_109444 ?auto_109445 ) ) ( ON ?auto_109444 ?auto_109443 ) ( ON-TABLE ?auto_109446 ) ( not ( = ?auto_109446 ?auto_109441 ) ) ( not ( = ?auto_109446 ?auto_109442 ) ) ( not ( = ?auto_109446 ?auto_109445 ) ) ( not ( = ?auto_109441 ?auto_109442 ) ) ( not ( = ?auto_109441 ?auto_109445 ) ) ( not ( = ?auto_109442 ?auto_109445 ) ) ( not ( = ?auto_109440 ?auto_109442 ) ) ( not ( = ?auto_109440 ?auto_109446 ) ) ( not ( = ?auto_109440 ?auto_109441 ) ) ( not ( = ?auto_109443 ?auto_109442 ) ) ( not ( = ?auto_109443 ?auto_109446 ) ) ( not ( = ?auto_109443 ?auto_109441 ) ) ( not ( = ?auto_109444 ?auto_109442 ) ) ( not ( = ?auto_109444 ?auto_109446 ) ) ( not ( = ?auto_109444 ?auto_109441 ) ) ( ON ?auto_109445 ?auto_109444 ) ( ON ?auto_109442 ?auto_109445 ) ( CLEAR ?auto_109446 ) ( ON ?auto_109441 ?auto_109442 ) ( CLEAR ?auto_109441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109440 ?auto_109443 ?auto_109444 ?auto_109445 ?auto_109442 )
      ( MAKE-1PILE ?auto_109440 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109447 - BLOCK
    )
    :vars
    (
      ?auto_109451 - BLOCK
      ?auto_109452 - BLOCK
      ?auto_109448 - BLOCK
      ?auto_109450 - BLOCK
      ?auto_109453 - BLOCK
      ?auto_109449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109451 ?auto_109447 ) ( ON-TABLE ?auto_109447 ) ( not ( = ?auto_109447 ?auto_109451 ) ) ( not ( = ?auto_109447 ?auto_109452 ) ) ( not ( = ?auto_109447 ?auto_109448 ) ) ( not ( = ?auto_109451 ?auto_109452 ) ) ( not ( = ?auto_109451 ?auto_109448 ) ) ( not ( = ?auto_109452 ?auto_109448 ) ) ( ON ?auto_109452 ?auto_109451 ) ( not ( = ?auto_109450 ?auto_109453 ) ) ( not ( = ?auto_109450 ?auto_109449 ) ) ( not ( = ?auto_109450 ?auto_109448 ) ) ( not ( = ?auto_109453 ?auto_109449 ) ) ( not ( = ?auto_109453 ?auto_109448 ) ) ( not ( = ?auto_109449 ?auto_109448 ) ) ( not ( = ?auto_109447 ?auto_109449 ) ) ( not ( = ?auto_109447 ?auto_109450 ) ) ( not ( = ?auto_109447 ?auto_109453 ) ) ( not ( = ?auto_109451 ?auto_109449 ) ) ( not ( = ?auto_109451 ?auto_109450 ) ) ( not ( = ?auto_109451 ?auto_109453 ) ) ( not ( = ?auto_109452 ?auto_109449 ) ) ( not ( = ?auto_109452 ?auto_109450 ) ) ( not ( = ?auto_109452 ?auto_109453 ) ) ( ON ?auto_109448 ?auto_109452 ) ( ON ?auto_109449 ?auto_109448 ) ( ON ?auto_109453 ?auto_109449 ) ( CLEAR ?auto_109453 ) ( HOLDING ?auto_109450 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109450 )
      ( MAKE-1PILE ?auto_109447 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109454 - BLOCK
    )
    :vars
    (
      ?auto_109458 - BLOCK
      ?auto_109455 - BLOCK
      ?auto_109460 - BLOCK
      ?auto_109457 - BLOCK
      ?auto_109459 - BLOCK
      ?auto_109456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109458 ?auto_109454 ) ( ON-TABLE ?auto_109454 ) ( not ( = ?auto_109454 ?auto_109458 ) ) ( not ( = ?auto_109454 ?auto_109455 ) ) ( not ( = ?auto_109454 ?auto_109460 ) ) ( not ( = ?auto_109458 ?auto_109455 ) ) ( not ( = ?auto_109458 ?auto_109460 ) ) ( not ( = ?auto_109455 ?auto_109460 ) ) ( ON ?auto_109455 ?auto_109458 ) ( not ( = ?auto_109457 ?auto_109459 ) ) ( not ( = ?auto_109457 ?auto_109456 ) ) ( not ( = ?auto_109457 ?auto_109460 ) ) ( not ( = ?auto_109459 ?auto_109456 ) ) ( not ( = ?auto_109459 ?auto_109460 ) ) ( not ( = ?auto_109456 ?auto_109460 ) ) ( not ( = ?auto_109454 ?auto_109456 ) ) ( not ( = ?auto_109454 ?auto_109457 ) ) ( not ( = ?auto_109454 ?auto_109459 ) ) ( not ( = ?auto_109458 ?auto_109456 ) ) ( not ( = ?auto_109458 ?auto_109457 ) ) ( not ( = ?auto_109458 ?auto_109459 ) ) ( not ( = ?auto_109455 ?auto_109456 ) ) ( not ( = ?auto_109455 ?auto_109457 ) ) ( not ( = ?auto_109455 ?auto_109459 ) ) ( ON ?auto_109460 ?auto_109455 ) ( ON ?auto_109456 ?auto_109460 ) ( ON ?auto_109459 ?auto_109456 ) ( ON ?auto_109457 ?auto_109459 ) ( CLEAR ?auto_109457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109454 ?auto_109458 ?auto_109455 ?auto_109460 ?auto_109456 ?auto_109459 )
      ( MAKE-1PILE ?auto_109454 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109461 - BLOCK
    )
    :vars
    (
      ?auto_109467 - BLOCK
      ?auto_109464 - BLOCK
      ?auto_109466 - BLOCK
      ?auto_109462 - BLOCK
      ?auto_109463 - BLOCK
      ?auto_109465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109467 ?auto_109461 ) ( ON-TABLE ?auto_109461 ) ( not ( = ?auto_109461 ?auto_109467 ) ) ( not ( = ?auto_109461 ?auto_109464 ) ) ( not ( = ?auto_109461 ?auto_109466 ) ) ( not ( = ?auto_109467 ?auto_109464 ) ) ( not ( = ?auto_109467 ?auto_109466 ) ) ( not ( = ?auto_109464 ?auto_109466 ) ) ( ON ?auto_109464 ?auto_109467 ) ( not ( = ?auto_109462 ?auto_109463 ) ) ( not ( = ?auto_109462 ?auto_109465 ) ) ( not ( = ?auto_109462 ?auto_109466 ) ) ( not ( = ?auto_109463 ?auto_109465 ) ) ( not ( = ?auto_109463 ?auto_109466 ) ) ( not ( = ?auto_109465 ?auto_109466 ) ) ( not ( = ?auto_109461 ?auto_109465 ) ) ( not ( = ?auto_109461 ?auto_109462 ) ) ( not ( = ?auto_109461 ?auto_109463 ) ) ( not ( = ?auto_109467 ?auto_109465 ) ) ( not ( = ?auto_109467 ?auto_109462 ) ) ( not ( = ?auto_109467 ?auto_109463 ) ) ( not ( = ?auto_109464 ?auto_109465 ) ) ( not ( = ?auto_109464 ?auto_109462 ) ) ( not ( = ?auto_109464 ?auto_109463 ) ) ( ON ?auto_109466 ?auto_109464 ) ( ON ?auto_109465 ?auto_109466 ) ( ON ?auto_109463 ?auto_109465 ) ( HOLDING ?auto_109462 ) ( CLEAR ?auto_109463 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109461 ?auto_109467 ?auto_109464 ?auto_109466 ?auto_109465 ?auto_109463 ?auto_109462 )
      ( MAKE-1PILE ?auto_109461 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109468 - BLOCK
    )
    :vars
    (
      ?auto_109474 - BLOCK
      ?auto_109470 - BLOCK
      ?auto_109471 - BLOCK
      ?auto_109473 - BLOCK
      ?auto_109472 - BLOCK
      ?auto_109469 - BLOCK
      ?auto_109475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109474 ?auto_109468 ) ( ON-TABLE ?auto_109468 ) ( not ( = ?auto_109468 ?auto_109474 ) ) ( not ( = ?auto_109468 ?auto_109470 ) ) ( not ( = ?auto_109468 ?auto_109471 ) ) ( not ( = ?auto_109474 ?auto_109470 ) ) ( not ( = ?auto_109474 ?auto_109471 ) ) ( not ( = ?auto_109470 ?auto_109471 ) ) ( ON ?auto_109470 ?auto_109474 ) ( not ( = ?auto_109473 ?auto_109472 ) ) ( not ( = ?auto_109473 ?auto_109469 ) ) ( not ( = ?auto_109473 ?auto_109471 ) ) ( not ( = ?auto_109472 ?auto_109469 ) ) ( not ( = ?auto_109472 ?auto_109471 ) ) ( not ( = ?auto_109469 ?auto_109471 ) ) ( not ( = ?auto_109468 ?auto_109469 ) ) ( not ( = ?auto_109468 ?auto_109473 ) ) ( not ( = ?auto_109468 ?auto_109472 ) ) ( not ( = ?auto_109474 ?auto_109469 ) ) ( not ( = ?auto_109474 ?auto_109473 ) ) ( not ( = ?auto_109474 ?auto_109472 ) ) ( not ( = ?auto_109470 ?auto_109469 ) ) ( not ( = ?auto_109470 ?auto_109473 ) ) ( not ( = ?auto_109470 ?auto_109472 ) ) ( ON ?auto_109471 ?auto_109470 ) ( ON ?auto_109469 ?auto_109471 ) ( ON ?auto_109472 ?auto_109469 ) ( CLEAR ?auto_109472 ) ( ON ?auto_109473 ?auto_109475 ) ( CLEAR ?auto_109473 ) ( HAND-EMPTY ) ( not ( = ?auto_109468 ?auto_109475 ) ) ( not ( = ?auto_109474 ?auto_109475 ) ) ( not ( = ?auto_109470 ?auto_109475 ) ) ( not ( = ?auto_109471 ?auto_109475 ) ) ( not ( = ?auto_109473 ?auto_109475 ) ) ( not ( = ?auto_109472 ?auto_109475 ) ) ( not ( = ?auto_109469 ?auto_109475 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109473 ?auto_109475 )
      ( MAKE-1PILE ?auto_109468 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109476 - BLOCK
    )
    :vars
    (
      ?auto_109479 - BLOCK
      ?auto_109482 - BLOCK
      ?auto_109477 - BLOCK
      ?auto_109481 - BLOCK
      ?auto_109478 - BLOCK
      ?auto_109480 - BLOCK
      ?auto_109483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109479 ?auto_109476 ) ( ON-TABLE ?auto_109476 ) ( not ( = ?auto_109476 ?auto_109479 ) ) ( not ( = ?auto_109476 ?auto_109482 ) ) ( not ( = ?auto_109476 ?auto_109477 ) ) ( not ( = ?auto_109479 ?auto_109482 ) ) ( not ( = ?auto_109479 ?auto_109477 ) ) ( not ( = ?auto_109482 ?auto_109477 ) ) ( ON ?auto_109482 ?auto_109479 ) ( not ( = ?auto_109481 ?auto_109478 ) ) ( not ( = ?auto_109481 ?auto_109480 ) ) ( not ( = ?auto_109481 ?auto_109477 ) ) ( not ( = ?auto_109478 ?auto_109480 ) ) ( not ( = ?auto_109478 ?auto_109477 ) ) ( not ( = ?auto_109480 ?auto_109477 ) ) ( not ( = ?auto_109476 ?auto_109480 ) ) ( not ( = ?auto_109476 ?auto_109481 ) ) ( not ( = ?auto_109476 ?auto_109478 ) ) ( not ( = ?auto_109479 ?auto_109480 ) ) ( not ( = ?auto_109479 ?auto_109481 ) ) ( not ( = ?auto_109479 ?auto_109478 ) ) ( not ( = ?auto_109482 ?auto_109480 ) ) ( not ( = ?auto_109482 ?auto_109481 ) ) ( not ( = ?auto_109482 ?auto_109478 ) ) ( ON ?auto_109477 ?auto_109482 ) ( ON ?auto_109480 ?auto_109477 ) ( ON ?auto_109481 ?auto_109483 ) ( CLEAR ?auto_109481 ) ( not ( = ?auto_109476 ?auto_109483 ) ) ( not ( = ?auto_109479 ?auto_109483 ) ) ( not ( = ?auto_109482 ?auto_109483 ) ) ( not ( = ?auto_109477 ?auto_109483 ) ) ( not ( = ?auto_109481 ?auto_109483 ) ) ( not ( = ?auto_109478 ?auto_109483 ) ) ( not ( = ?auto_109480 ?auto_109483 ) ) ( HOLDING ?auto_109478 ) ( CLEAR ?auto_109480 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109476 ?auto_109479 ?auto_109482 ?auto_109477 ?auto_109480 ?auto_109478 )
      ( MAKE-1PILE ?auto_109476 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109484 - BLOCK
    )
    :vars
    (
      ?auto_109487 - BLOCK
      ?auto_109491 - BLOCK
      ?auto_109485 - BLOCK
      ?auto_109490 - BLOCK
      ?auto_109486 - BLOCK
      ?auto_109488 - BLOCK
      ?auto_109489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109487 ?auto_109484 ) ( ON-TABLE ?auto_109484 ) ( not ( = ?auto_109484 ?auto_109487 ) ) ( not ( = ?auto_109484 ?auto_109491 ) ) ( not ( = ?auto_109484 ?auto_109485 ) ) ( not ( = ?auto_109487 ?auto_109491 ) ) ( not ( = ?auto_109487 ?auto_109485 ) ) ( not ( = ?auto_109491 ?auto_109485 ) ) ( ON ?auto_109491 ?auto_109487 ) ( not ( = ?auto_109490 ?auto_109486 ) ) ( not ( = ?auto_109490 ?auto_109488 ) ) ( not ( = ?auto_109490 ?auto_109485 ) ) ( not ( = ?auto_109486 ?auto_109488 ) ) ( not ( = ?auto_109486 ?auto_109485 ) ) ( not ( = ?auto_109488 ?auto_109485 ) ) ( not ( = ?auto_109484 ?auto_109488 ) ) ( not ( = ?auto_109484 ?auto_109490 ) ) ( not ( = ?auto_109484 ?auto_109486 ) ) ( not ( = ?auto_109487 ?auto_109488 ) ) ( not ( = ?auto_109487 ?auto_109490 ) ) ( not ( = ?auto_109487 ?auto_109486 ) ) ( not ( = ?auto_109491 ?auto_109488 ) ) ( not ( = ?auto_109491 ?auto_109490 ) ) ( not ( = ?auto_109491 ?auto_109486 ) ) ( ON ?auto_109485 ?auto_109491 ) ( ON ?auto_109488 ?auto_109485 ) ( ON ?auto_109490 ?auto_109489 ) ( not ( = ?auto_109484 ?auto_109489 ) ) ( not ( = ?auto_109487 ?auto_109489 ) ) ( not ( = ?auto_109491 ?auto_109489 ) ) ( not ( = ?auto_109485 ?auto_109489 ) ) ( not ( = ?auto_109490 ?auto_109489 ) ) ( not ( = ?auto_109486 ?auto_109489 ) ) ( not ( = ?auto_109488 ?auto_109489 ) ) ( CLEAR ?auto_109488 ) ( ON ?auto_109486 ?auto_109490 ) ( CLEAR ?auto_109486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109489 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109489 ?auto_109490 )
      ( MAKE-1PILE ?auto_109484 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109492 - BLOCK
    )
    :vars
    (
      ?auto_109495 - BLOCK
      ?auto_109497 - BLOCK
      ?auto_109496 - BLOCK
      ?auto_109499 - BLOCK
      ?auto_109498 - BLOCK
      ?auto_109494 - BLOCK
      ?auto_109493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109495 ?auto_109492 ) ( ON-TABLE ?auto_109492 ) ( not ( = ?auto_109492 ?auto_109495 ) ) ( not ( = ?auto_109492 ?auto_109497 ) ) ( not ( = ?auto_109492 ?auto_109496 ) ) ( not ( = ?auto_109495 ?auto_109497 ) ) ( not ( = ?auto_109495 ?auto_109496 ) ) ( not ( = ?auto_109497 ?auto_109496 ) ) ( ON ?auto_109497 ?auto_109495 ) ( not ( = ?auto_109499 ?auto_109498 ) ) ( not ( = ?auto_109499 ?auto_109494 ) ) ( not ( = ?auto_109499 ?auto_109496 ) ) ( not ( = ?auto_109498 ?auto_109494 ) ) ( not ( = ?auto_109498 ?auto_109496 ) ) ( not ( = ?auto_109494 ?auto_109496 ) ) ( not ( = ?auto_109492 ?auto_109494 ) ) ( not ( = ?auto_109492 ?auto_109499 ) ) ( not ( = ?auto_109492 ?auto_109498 ) ) ( not ( = ?auto_109495 ?auto_109494 ) ) ( not ( = ?auto_109495 ?auto_109499 ) ) ( not ( = ?auto_109495 ?auto_109498 ) ) ( not ( = ?auto_109497 ?auto_109494 ) ) ( not ( = ?auto_109497 ?auto_109499 ) ) ( not ( = ?auto_109497 ?auto_109498 ) ) ( ON ?auto_109496 ?auto_109497 ) ( ON ?auto_109499 ?auto_109493 ) ( not ( = ?auto_109492 ?auto_109493 ) ) ( not ( = ?auto_109495 ?auto_109493 ) ) ( not ( = ?auto_109497 ?auto_109493 ) ) ( not ( = ?auto_109496 ?auto_109493 ) ) ( not ( = ?auto_109499 ?auto_109493 ) ) ( not ( = ?auto_109498 ?auto_109493 ) ) ( not ( = ?auto_109494 ?auto_109493 ) ) ( ON ?auto_109498 ?auto_109499 ) ( CLEAR ?auto_109498 ) ( ON-TABLE ?auto_109493 ) ( HOLDING ?auto_109494 ) ( CLEAR ?auto_109496 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109492 ?auto_109495 ?auto_109497 ?auto_109496 ?auto_109494 )
      ( MAKE-1PILE ?auto_109492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109500 - BLOCK
    )
    :vars
    (
      ?auto_109504 - BLOCK
      ?auto_109506 - BLOCK
      ?auto_109502 - BLOCK
      ?auto_109505 - BLOCK
      ?auto_109501 - BLOCK
      ?auto_109503 - BLOCK
      ?auto_109507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109504 ?auto_109500 ) ( ON-TABLE ?auto_109500 ) ( not ( = ?auto_109500 ?auto_109504 ) ) ( not ( = ?auto_109500 ?auto_109506 ) ) ( not ( = ?auto_109500 ?auto_109502 ) ) ( not ( = ?auto_109504 ?auto_109506 ) ) ( not ( = ?auto_109504 ?auto_109502 ) ) ( not ( = ?auto_109506 ?auto_109502 ) ) ( ON ?auto_109506 ?auto_109504 ) ( not ( = ?auto_109505 ?auto_109501 ) ) ( not ( = ?auto_109505 ?auto_109503 ) ) ( not ( = ?auto_109505 ?auto_109502 ) ) ( not ( = ?auto_109501 ?auto_109503 ) ) ( not ( = ?auto_109501 ?auto_109502 ) ) ( not ( = ?auto_109503 ?auto_109502 ) ) ( not ( = ?auto_109500 ?auto_109503 ) ) ( not ( = ?auto_109500 ?auto_109505 ) ) ( not ( = ?auto_109500 ?auto_109501 ) ) ( not ( = ?auto_109504 ?auto_109503 ) ) ( not ( = ?auto_109504 ?auto_109505 ) ) ( not ( = ?auto_109504 ?auto_109501 ) ) ( not ( = ?auto_109506 ?auto_109503 ) ) ( not ( = ?auto_109506 ?auto_109505 ) ) ( not ( = ?auto_109506 ?auto_109501 ) ) ( ON ?auto_109502 ?auto_109506 ) ( ON ?auto_109505 ?auto_109507 ) ( not ( = ?auto_109500 ?auto_109507 ) ) ( not ( = ?auto_109504 ?auto_109507 ) ) ( not ( = ?auto_109506 ?auto_109507 ) ) ( not ( = ?auto_109502 ?auto_109507 ) ) ( not ( = ?auto_109505 ?auto_109507 ) ) ( not ( = ?auto_109501 ?auto_109507 ) ) ( not ( = ?auto_109503 ?auto_109507 ) ) ( ON ?auto_109501 ?auto_109505 ) ( ON-TABLE ?auto_109507 ) ( CLEAR ?auto_109502 ) ( ON ?auto_109503 ?auto_109501 ) ( CLEAR ?auto_109503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109507 ?auto_109505 ?auto_109501 )
      ( MAKE-1PILE ?auto_109500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109508 - BLOCK
    )
    :vars
    (
      ?auto_109510 - BLOCK
      ?auto_109509 - BLOCK
      ?auto_109511 - BLOCK
      ?auto_109512 - BLOCK
      ?auto_109513 - BLOCK
      ?auto_109514 - BLOCK
      ?auto_109515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109510 ?auto_109508 ) ( ON-TABLE ?auto_109508 ) ( not ( = ?auto_109508 ?auto_109510 ) ) ( not ( = ?auto_109508 ?auto_109509 ) ) ( not ( = ?auto_109508 ?auto_109511 ) ) ( not ( = ?auto_109510 ?auto_109509 ) ) ( not ( = ?auto_109510 ?auto_109511 ) ) ( not ( = ?auto_109509 ?auto_109511 ) ) ( ON ?auto_109509 ?auto_109510 ) ( not ( = ?auto_109512 ?auto_109513 ) ) ( not ( = ?auto_109512 ?auto_109514 ) ) ( not ( = ?auto_109512 ?auto_109511 ) ) ( not ( = ?auto_109513 ?auto_109514 ) ) ( not ( = ?auto_109513 ?auto_109511 ) ) ( not ( = ?auto_109514 ?auto_109511 ) ) ( not ( = ?auto_109508 ?auto_109514 ) ) ( not ( = ?auto_109508 ?auto_109512 ) ) ( not ( = ?auto_109508 ?auto_109513 ) ) ( not ( = ?auto_109510 ?auto_109514 ) ) ( not ( = ?auto_109510 ?auto_109512 ) ) ( not ( = ?auto_109510 ?auto_109513 ) ) ( not ( = ?auto_109509 ?auto_109514 ) ) ( not ( = ?auto_109509 ?auto_109512 ) ) ( not ( = ?auto_109509 ?auto_109513 ) ) ( ON ?auto_109512 ?auto_109515 ) ( not ( = ?auto_109508 ?auto_109515 ) ) ( not ( = ?auto_109510 ?auto_109515 ) ) ( not ( = ?auto_109509 ?auto_109515 ) ) ( not ( = ?auto_109511 ?auto_109515 ) ) ( not ( = ?auto_109512 ?auto_109515 ) ) ( not ( = ?auto_109513 ?auto_109515 ) ) ( not ( = ?auto_109514 ?auto_109515 ) ) ( ON ?auto_109513 ?auto_109512 ) ( ON-TABLE ?auto_109515 ) ( ON ?auto_109514 ?auto_109513 ) ( CLEAR ?auto_109514 ) ( HOLDING ?auto_109511 ) ( CLEAR ?auto_109509 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109508 ?auto_109510 ?auto_109509 ?auto_109511 )
      ( MAKE-1PILE ?auto_109508 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109516 - BLOCK
    )
    :vars
    (
      ?auto_109522 - BLOCK
      ?auto_109520 - BLOCK
      ?auto_109523 - BLOCK
      ?auto_109521 - BLOCK
      ?auto_109518 - BLOCK
      ?auto_109519 - BLOCK
      ?auto_109517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109522 ?auto_109516 ) ( ON-TABLE ?auto_109516 ) ( not ( = ?auto_109516 ?auto_109522 ) ) ( not ( = ?auto_109516 ?auto_109520 ) ) ( not ( = ?auto_109516 ?auto_109523 ) ) ( not ( = ?auto_109522 ?auto_109520 ) ) ( not ( = ?auto_109522 ?auto_109523 ) ) ( not ( = ?auto_109520 ?auto_109523 ) ) ( ON ?auto_109520 ?auto_109522 ) ( not ( = ?auto_109521 ?auto_109518 ) ) ( not ( = ?auto_109521 ?auto_109519 ) ) ( not ( = ?auto_109521 ?auto_109523 ) ) ( not ( = ?auto_109518 ?auto_109519 ) ) ( not ( = ?auto_109518 ?auto_109523 ) ) ( not ( = ?auto_109519 ?auto_109523 ) ) ( not ( = ?auto_109516 ?auto_109519 ) ) ( not ( = ?auto_109516 ?auto_109521 ) ) ( not ( = ?auto_109516 ?auto_109518 ) ) ( not ( = ?auto_109522 ?auto_109519 ) ) ( not ( = ?auto_109522 ?auto_109521 ) ) ( not ( = ?auto_109522 ?auto_109518 ) ) ( not ( = ?auto_109520 ?auto_109519 ) ) ( not ( = ?auto_109520 ?auto_109521 ) ) ( not ( = ?auto_109520 ?auto_109518 ) ) ( ON ?auto_109521 ?auto_109517 ) ( not ( = ?auto_109516 ?auto_109517 ) ) ( not ( = ?auto_109522 ?auto_109517 ) ) ( not ( = ?auto_109520 ?auto_109517 ) ) ( not ( = ?auto_109523 ?auto_109517 ) ) ( not ( = ?auto_109521 ?auto_109517 ) ) ( not ( = ?auto_109518 ?auto_109517 ) ) ( not ( = ?auto_109519 ?auto_109517 ) ) ( ON ?auto_109518 ?auto_109521 ) ( ON-TABLE ?auto_109517 ) ( ON ?auto_109519 ?auto_109518 ) ( CLEAR ?auto_109520 ) ( ON ?auto_109523 ?auto_109519 ) ( CLEAR ?auto_109523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109517 ?auto_109521 ?auto_109518 ?auto_109519 )
      ( MAKE-1PILE ?auto_109516 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109524 - BLOCK
    )
    :vars
    (
      ?auto_109531 - BLOCK
      ?auto_109525 - BLOCK
      ?auto_109528 - BLOCK
      ?auto_109526 - BLOCK
      ?auto_109530 - BLOCK
      ?auto_109529 - BLOCK
      ?auto_109527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109531 ?auto_109524 ) ( ON-TABLE ?auto_109524 ) ( not ( = ?auto_109524 ?auto_109531 ) ) ( not ( = ?auto_109524 ?auto_109525 ) ) ( not ( = ?auto_109524 ?auto_109528 ) ) ( not ( = ?auto_109531 ?auto_109525 ) ) ( not ( = ?auto_109531 ?auto_109528 ) ) ( not ( = ?auto_109525 ?auto_109528 ) ) ( not ( = ?auto_109526 ?auto_109530 ) ) ( not ( = ?auto_109526 ?auto_109529 ) ) ( not ( = ?auto_109526 ?auto_109528 ) ) ( not ( = ?auto_109530 ?auto_109529 ) ) ( not ( = ?auto_109530 ?auto_109528 ) ) ( not ( = ?auto_109529 ?auto_109528 ) ) ( not ( = ?auto_109524 ?auto_109529 ) ) ( not ( = ?auto_109524 ?auto_109526 ) ) ( not ( = ?auto_109524 ?auto_109530 ) ) ( not ( = ?auto_109531 ?auto_109529 ) ) ( not ( = ?auto_109531 ?auto_109526 ) ) ( not ( = ?auto_109531 ?auto_109530 ) ) ( not ( = ?auto_109525 ?auto_109529 ) ) ( not ( = ?auto_109525 ?auto_109526 ) ) ( not ( = ?auto_109525 ?auto_109530 ) ) ( ON ?auto_109526 ?auto_109527 ) ( not ( = ?auto_109524 ?auto_109527 ) ) ( not ( = ?auto_109531 ?auto_109527 ) ) ( not ( = ?auto_109525 ?auto_109527 ) ) ( not ( = ?auto_109528 ?auto_109527 ) ) ( not ( = ?auto_109526 ?auto_109527 ) ) ( not ( = ?auto_109530 ?auto_109527 ) ) ( not ( = ?auto_109529 ?auto_109527 ) ) ( ON ?auto_109530 ?auto_109526 ) ( ON-TABLE ?auto_109527 ) ( ON ?auto_109529 ?auto_109530 ) ( ON ?auto_109528 ?auto_109529 ) ( CLEAR ?auto_109528 ) ( HOLDING ?auto_109525 ) ( CLEAR ?auto_109531 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109524 ?auto_109531 ?auto_109525 )
      ( MAKE-1PILE ?auto_109524 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109532 - BLOCK
    )
    :vars
    (
      ?auto_109533 - BLOCK
      ?auto_109538 - BLOCK
      ?auto_109536 - BLOCK
      ?auto_109535 - BLOCK
      ?auto_109534 - BLOCK
      ?auto_109539 - BLOCK
      ?auto_109537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_109533 ?auto_109532 ) ( ON-TABLE ?auto_109532 ) ( not ( = ?auto_109532 ?auto_109533 ) ) ( not ( = ?auto_109532 ?auto_109538 ) ) ( not ( = ?auto_109532 ?auto_109536 ) ) ( not ( = ?auto_109533 ?auto_109538 ) ) ( not ( = ?auto_109533 ?auto_109536 ) ) ( not ( = ?auto_109538 ?auto_109536 ) ) ( not ( = ?auto_109535 ?auto_109534 ) ) ( not ( = ?auto_109535 ?auto_109539 ) ) ( not ( = ?auto_109535 ?auto_109536 ) ) ( not ( = ?auto_109534 ?auto_109539 ) ) ( not ( = ?auto_109534 ?auto_109536 ) ) ( not ( = ?auto_109539 ?auto_109536 ) ) ( not ( = ?auto_109532 ?auto_109539 ) ) ( not ( = ?auto_109532 ?auto_109535 ) ) ( not ( = ?auto_109532 ?auto_109534 ) ) ( not ( = ?auto_109533 ?auto_109539 ) ) ( not ( = ?auto_109533 ?auto_109535 ) ) ( not ( = ?auto_109533 ?auto_109534 ) ) ( not ( = ?auto_109538 ?auto_109539 ) ) ( not ( = ?auto_109538 ?auto_109535 ) ) ( not ( = ?auto_109538 ?auto_109534 ) ) ( ON ?auto_109535 ?auto_109537 ) ( not ( = ?auto_109532 ?auto_109537 ) ) ( not ( = ?auto_109533 ?auto_109537 ) ) ( not ( = ?auto_109538 ?auto_109537 ) ) ( not ( = ?auto_109536 ?auto_109537 ) ) ( not ( = ?auto_109535 ?auto_109537 ) ) ( not ( = ?auto_109534 ?auto_109537 ) ) ( not ( = ?auto_109539 ?auto_109537 ) ) ( ON ?auto_109534 ?auto_109535 ) ( ON-TABLE ?auto_109537 ) ( ON ?auto_109539 ?auto_109534 ) ( ON ?auto_109536 ?auto_109539 ) ( CLEAR ?auto_109533 ) ( ON ?auto_109538 ?auto_109536 ) ( CLEAR ?auto_109538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109537 ?auto_109535 ?auto_109534 ?auto_109539 ?auto_109536 )
      ( MAKE-1PILE ?auto_109532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109556 - BLOCK
    )
    :vars
    (
      ?auto_109557 - BLOCK
      ?auto_109558 - BLOCK
      ?auto_109562 - BLOCK
      ?auto_109559 - BLOCK
      ?auto_109560 - BLOCK
      ?auto_109563 - BLOCK
      ?auto_109561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109556 ?auto_109557 ) ) ( not ( = ?auto_109556 ?auto_109558 ) ) ( not ( = ?auto_109556 ?auto_109562 ) ) ( not ( = ?auto_109557 ?auto_109558 ) ) ( not ( = ?auto_109557 ?auto_109562 ) ) ( not ( = ?auto_109558 ?auto_109562 ) ) ( not ( = ?auto_109559 ?auto_109560 ) ) ( not ( = ?auto_109559 ?auto_109563 ) ) ( not ( = ?auto_109559 ?auto_109562 ) ) ( not ( = ?auto_109560 ?auto_109563 ) ) ( not ( = ?auto_109560 ?auto_109562 ) ) ( not ( = ?auto_109563 ?auto_109562 ) ) ( not ( = ?auto_109556 ?auto_109563 ) ) ( not ( = ?auto_109556 ?auto_109559 ) ) ( not ( = ?auto_109556 ?auto_109560 ) ) ( not ( = ?auto_109557 ?auto_109563 ) ) ( not ( = ?auto_109557 ?auto_109559 ) ) ( not ( = ?auto_109557 ?auto_109560 ) ) ( not ( = ?auto_109558 ?auto_109563 ) ) ( not ( = ?auto_109558 ?auto_109559 ) ) ( not ( = ?auto_109558 ?auto_109560 ) ) ( ON ?auto_109559 ?auto_109561 ) ( not ( = ?auto_109556 ?auto_109561 ) ) ( not ( = ?auto_109557 ?auto_109561 ) ) ( not ( = ?auto_109558 ?auto_109561 ) ) ( not ( = ?auto_109562 ?auto_109561 ) ) ( not ( = ?auto_109559 ?auto_109561 ) ) ( not ( = ?auto_109560 ?auto_109561 ) ) ( not ( = ?auto_109563 ?auto_109561 ) ) ( ON ?auto_109560 ?auto_109559 ) ( ON-TABLE ?auto_109561 ) ( ON ?auto_109563 ?auto_109560 ) ( ON ?auto_109562 ?auto_109563 ) ( ON ?auto_109558 ?auto_109562 ) ( ON ?auto_109557 ?auto_109558 ) ( CLEAR ?auto_109557 ) ( HOLDING ?auto_109556 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109556 ?auto_109557 )
      ( MAKE-1PILE ?auto_109556 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_109564 - BLOCK
    )
    :vars
    (
      ?auto_109567 - BLOCK
      ?auto_109569 - BLOCK
      ?auto_109566 - BLOCK
      ?auto_109568 - BLOCK
      ?auto_109570 - BLOCK
      ?auto_109565 - BLOCK
      ?auto_109571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109564 ?auto_109567 ) ) ( not ( = ?auto_109564 ?auto_109569 ) ) ( not ( = ?auto_109564 ?auto_109566 ) ) ( not ( = ?auto_109567 ?auto_109569 ) ) ( not ( = ?auto_109567 ?auto_109566 ) ) ( not ( = ?auto_109569 ?auto_109566 ) ) ( not ( = ?auto_109568 ?auto_109570 ) ) ( not ( = ?auto_109568 ?auto_109565 ) ) ( not ( = ?auto_109568 ?auto_109566 ) ) ( not ( = ?auto_109570 ?auto_109565 ) ) ( not ( = ?auto_109570 ?auto_109566 ) ) ( not ( = ?auto_109565 ?auto_109566 ) ) ( not ( = ?auto_109564 ?auto_109565 ) ) ( not ( = ?auto_109564 ?auto_109568 ) ) ( not ( = ?auto_109564 ?auto_109570 ) ) ( not ( = ?auto_109567 ?auto_109565 ) ) ( not ( = ?auto_109567 ?auto_109568 ) ) ( not ( = ?auto_109567 ?auto_109570 ) ) ( not ( = ?auto_109569 ?auto_109565 ) ) ( not ( = ?auto_109569 ?auto_109568 ) ) ( not ( = ?auto_109569 ?auto_109570 ) ) ( ON ?auto_109568 ?auto_109571 ) ( not ( = ?auto_109564 ?auto_109571 ) ) ( not ( = ?auto_109567 ?auto_109571 ) ) ( not ( = ?auto_109569 ?auto_109571 ) ) ( not ( = ?auto_109566 ?auto_109571 ) ) ( not ( = ?auto_109568 ?auto_109571 ) ) ( not ( = ?auto_109570 ?auto_109571 ) ) ( not ( = ?auto_109565 ?auto_109571 ) ) ( ON ?auto_109570 ?auto_109568 ) ( ON-TABLE ?auto_109571 ) ( ON ?auto_109565 ?auto_109570 ) ( ON ?auto_109566 ?auto_109565 ) ( ON ?auto_109569 ?auto_109566 ) ( ON ?auto_109567 ?auto_109569 ) ( ON ?auto_109564 ?auto_109567 ) ( CLEAR ?auto_109564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109571 ?auto_109568 ?auto_109570 ?auto_109565 ?auto_109566 ?auto_109569 ?auto_109567 )
      ( MAKE-1PILE ?auto_109564 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109578 - BLOCK
      ?auto_109579 - BLOCK
      ?auto_109580 - BLOCK
      ?auto_109581 - BLOCK
      ?auto_109582 - BLOCK
      ?auto_109583 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_109583 ) ( CLEAR ?auto_109582 ) ( ON-TABLE ?auto_109578 ) ( ON ?auto_109579 ?auto_109578 ) ( ON ?auto_109580 ?auto_109579 ) ( ON ?auto_109581 ?auto_109580 ) ( ON ?auto_109582 ?auto_109581 ) ( not ( = ?auto_109578 ?auto_109579 ) ) ( not ( = ?auto_109578 ?auto_109580 ) ) ( not ( = ?auto_109578 ?auto_109581 ) ) ( not ( = ?auto_109578 ?auto_109582 ) ) ( not ( = ?auto_109578 ?auto_109583 ) ) ( not ( = ?auto_109579 ?auto_109580 ) ) ( not ( = ?auto_109579 ?auto_109581 ) ) ( not ( = ?auto_109579 ?auto_109582 ) ) ( not ( = ?auto_109579 ?auto_109583 ) ) ( not ( = ?auto_109580 ?auto_109581 ) ) ( not ( = ?auto_109580 ?auto_109582 ) ) ( not ( = ?auto_109580 ?auto_109583 ) ) ( not ( = ?auto_109581 ?auto_109582 ) ) ( not ( = ?auto_109581 ?auto_109583 ) ) ( not ( = ?auto_109582 ?auto_109583 ) ) )
    :subtasks
    ( ( !STACK ?auto_109583 ?auto_109582 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109584 - BLOCK
      ?auto_109585 - BLOCK
      ?auto_109586 - BLOCK
      ?auto_109587 - BLOCK
      ?auto_109588 - BLOCK
      ?auto_109589 - BLOCK
    )
    :vars
    (
      ?auto_109590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109588 ) ( ON-TABLE ?auto_109584 ) ( ON ?auto_109585 ?auto_109584 ) ( ON ?auto_109586 ?auto_109585 ) ( ON ?auto_109587 ?auto_109586 ) ( ON ?auto_109588 ?auto_109587 ) ( not ( = ?auto_109584 ?auto_109585 ) ) ( not ( = ?auto_109584 ?auto_109586 ) ) ( not ( = ?auto_109584 ?auto_109587 ) ) ( not ( = ?auto_109584 ?auto_109588 ) ) ( not ( = ?auto_109584 ?auto_109589 ) ) ( not ( = ?auto_109585 ?auto_109586 ) ) ( not ( = ?auto_109585 ?auto_109587 ) ) ( not ( = ?auto_109585 ?auto_109588 ) ) ( not ( = ?auto_109585 ?auto_109589 ) ) ( not ( = ?auto_109586 ?auto_109587 ) ) ( not ( = ?auto_109586 ?auto_109588 ) ) ( not ( = ?auto_109586 ?auto_109589 ) ) ( not ( = ?auto_109587 ?auto_109588 ) ) ( not ( = ?auto_109587 ?auto_109589 ) ) ( not ( = ?auto_109588 ?auto_109589 ) ) ( ON ?auto_109589 ?auto_109590 ) ( CLEAR ?auto_109589 ) ( HAND-EMPTY ) ( not ( = ?auto_109584 ?auto_109590 ) ) ( not ( = ?auto_109585 ?auto_109590 ) ) ( not ( = ?auto_109586 ?auto_109590 ) ) ( not ( = ?auto_109587 ?auto_109590 ) ) ( not ( = ?auto_109588 ?auto_109590 ) ) ( not ( = ?auto_109589 ?auto_109590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109589 ?auto_109590 )
      ( MAKE-6PILE ?auto_109584 ?auto_109585 ?auto_109586 ?auto_109587 ?auto_109588 ?auto_109589 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109591 - BLOCK
      ?auto_109592 - BLOCK
      ?auto_109593 - BLOCK
      ?auto_109594 - BLOCK
      ?auto_109595 - BLOCK
      ?auto_109596 - BLOCK
    )
    :vars
    (
      ?auto_109597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109591 ) ( ON ?auto_109592 ?auto_109591 ) ( ON ?auto_109593 ?auto_109592 ) ( ON ?auto_109594 ?auto_109593 ) ( not ( = ?auto_109591 ?auto_109592 ) ) ( not ( = ?auto_109591 ?auto_109593 ) ) ( not ( = ?auto_109591 ?auto_109594 ) ) ( not ( = ?auto_109591 ?auto_109595 ) ) ( not ( = ?auto_109591 ?auto_109596 ) ) ( not ( = ?auto_109592 ?auto_109593 ) ) ( not ( = ?auto_109592 ?auto_109594 ) ) ( not ( = ?auto_109592 ?auto_109595 ) ) ( not ( = ?auto_109592 ?auto_109596 ) ) ( not ( = ?auto_109593 ?auto_109594 ) ) ( not ( = ?auto_109593 ?auto_109595 ) ) ( not ( = ?auto_109593 ?auto_109596 ) ) ( not ( = ?auto_109594 ?auto_109595 ) ) ( not ( = ?auto_109594 ?auto_109596 ) ) ( not ( = ?auto_109595 ?auto_109596 ) ) ( ON ?auto_109596 ?auto_109597 ) ( CLEAR ?auto_109596 ) ( not ( = ?auto_109591 ?auto_109597 ) ) ( not ( = ?auto_109592 ?auto_109597 ) ) ( not ( = ?auto_109593 ?auto_109597 ) ) ( not ( = ?auto_109594 ?auto_109597 ) ) ( not ( = ?auto_109595 ?auto_109597 ) ) ( not ( = ?auto_109596 ?auto_109597 ) ) ( HOLDING ?auto_109595 ) ( CLEAR ?auto_109594 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109591 ?auto_109592 ?auto_109593 ?auto_109594 ?auto_109595 )
      ( MAKE-6PILE ?auto_109591 ?auto_109592 ?auto_109593 ?auto_109594 ?auto_109595 ?auto_109596 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109598 - BLOCK
      ?auto_109599 - BLOCK
      ?auto_109600 - BLOCK
      ?auto_109601 - BLOCK
      ?auto_109602 - BLOCK
      ?auto_109603 - BLOCK
    )
    :vars
    (
      ?auto_109604 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109598 ) ( ON ?auto_109599 ?auto_109598 ) ( ON ?auto_109600 ?auto_109599 ) ( ON ?auto_109601 ?auto_109600 ) ( not ( = ?auto_109598 ?auto_109599 ) ) ( not ( = ?auto_109598 ?auto_109600 ) ) ( not ( = ?auto_109598 ?auto_109601 ) ) ( not ( = ?auto_109598 ?auto_109602 ) ) ( not ( = ?auto_109598 ?auto_109603 ) ) ( not ( = ?auto_109599 ?auto_109600 ) ) ( not ( = ?auto_109599 ?auto_109601 ) ) ( not ( = ?auto_109599 ?auto_109602 ) ) ( not ( = ?auto_109599 ?auto_109603 ) ) ( not ( = ?auto_109600 ?auto_109601 ) ) ( not ( = ?auto_109600 ?auto_109602 ) ) ( not ( = ?auto_109600 ?auto_109603 ) ) ( not ( = ?auto_109601 ?auto_109602 ) ) ( not ( = ?auto_109601 ?auto_109603 ) ) ( not ( = ?auto_109602 ?auto_109603 ) ) ( ON ?auto_109603 ?auto_109604 ) ( not ( = ?auto_109598 ?auto_109604 ) ) ( not ( = ?auto_109599 ?auto_109604 ) ) ( not ( = ?auto_109600 ?auto_109604 ) ) ( not ( = ?auto_109601 ?auto_109604 ) ) ( not ( = ?auto_109602 ?auto_109604 ) ) ( not ( = ?auto_109603 ?auto_109604 ) ) ( CLEAR ?auto_109601 ) ( ON ?auto_109602 ?auto_109603 ) ( CLEAR ?auto_109602 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109604 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109604 ?auto_109603 )
      ( MAKE-6PILE ?auto_109598 ?auto_109599 ?auto_109600 ?auto_109601 ?auto_109602 ?auto_109603 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109605 - BLOCK
      ?auto_109606 - BLOCK
      ?auto_109607 - BLOCK
      ?auto_109608 - BLOCK
      ?auto_109609 - BLOCK
      ?auto_109610 - BLOCK
    )
    :vars
    (
      ?auto_109611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109605 ) ( ON ?auto_109606 ?auto_109605 ) ( ON ?auto_109607 ?auto_109606 ) ( not ( = ?auto_109605 ?auto_109606 ) ) ( not ( = ?auto_109605 ?auto_109607 ) ) ( not ( = ?auto_109605 ?auto_109608 ) ) ( not ( = ?auto_109605 ?auto_109609 ) ) ( not ( = ?auto_109605 ?auto_109610 ) ) ( not ( = ?auto_109606 ?auto_109607 ) ) ( not ( = ?auto_109606 ?auto_109608 ) ) ( not ( = ?auto_109606 ?auto_109609 ) ) ( not ( = ?auto_109606 ?auto_109610 ) ) ( not ( = ?auto_109607 ?auto_109608 ) ) ( not ( = ?auto_109607 ?auto_109609 ) ) ( not ( = ?auto_109607 ?auto_109610 ) ) ( not ( = ?auto_109608 ?auto_109609 ) ) ( not ( = ?auto_109608 ?auto_109610 ) ) ( not ( = ?auto_109609 ?auto_109610 ) ) ( ON ?auto_109610 ?auto_109611 ) ( not ( = ?auto_109605 ?auto_109611 ) ) ( not ( = ?auto_109606 ?auto_109611 ) ) ( not ( = ?auto_109607 ?auto_109611 ) ) ( not ( = ?auto_109608 ?auto_109611 ) ) ( not ( = ?auto_109609 ?auto_109611 ) ) ( not ( = ?auto_109610 ?auto_109611 ) ) ( ON ?auto_109609 ?auto_109610 ) ( CLEAR ?auto_109609 ) ( ON-TABLE ?auto_109611 ) ( HOLDING ?auto_109608 ) ( CLEAR ?auto_109607 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109605 ?auto_109606 ?auto_109607 ?auto_109608 )
      ( MAKE-6PILE ?auto_109605 ?auto_109606 ?auto_109607 ?auto_109608 ?auto_109609 ?auto_109610 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109612 - BLOCK
      ?auto_109613 - BLOCK
      ?auto_109614 - BLOCK
      ?auto_109615 - BLOCK
      ?auto_109616 - BLOCK
      ?auto_109617 - BLOCK
    )
    :vars
    (
      ?auto_109618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109612 ) ( ON ?auto_109613 ?auto_109612 ) ( ON ?auto_109614 ?auto_109613 ) ( not ( = ?auto_109612 ?auto_109613 ) ) ( not ( = ?auto_109612 ?auto_109614 ) ) ( not ( = ?auto_109612 ?auto_109615 ) ) ( not ( = ?auto_109612 ?auto_109616 ) ) ( not ( = ?auto_109612 ?auto_109617 ) ) ( not ( = ?auto_109613 ?auto_109614 ) ) ( not ( = ?auto_109613 ?auto_109615 ) ) ( not ( = ?auto_109613 ?auto_109616 ) ) ( not ( = ?auto_109613 ?auto_109617 ) ) ( not ( = ?auto_109614 ?auto_109615 ) ) ( not ( = ?auto_109614 ?auto_109616 ) ) ( not ( = ?auto_109614 ?auto_109617 ) ) ( not ( = ?auto_109615 ?auto_109616 ) ) ( not ( = ?auto_109615 ?auto_109617 ) ) ( not ( = ?auto_109616 ?auto_109617 ) ) ( ON ?auto_109617 ?auto_109618 ) ( not ( = ?auto_109612 ?auto_109618 ) ) ( not ( = ?auto_109613 ?auto_109618 ) ) ( not ( = ?auto_109614 ?auto_109618 ) ) ( not ( = ?auto_109615 ?auto_109618 ) ) ( not ( = ?auto_109616 ?auto_109618 ) ) ( not ( = ?auto_109617 ?auto_109618 ) ) ( ON ?auto_109616 ?auto_109617 ) ( ON-TABLE ?auto_109618 ) ( CLEAR ?auto_109614 ) ( ON ?auto_109615 ?auto_109616 ) ( CLEAR ?auto_109615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109618 ?auto_109617 ?auto_109616 )
      ( MAKE-6PILE ?auto_109612 ?auto_109613 ?auto_109614 ?auto_109615 ?auto_109616 ?auto_109617 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109619 - BLOCK
      ?auto_109620 - BLOCK
      ?auto_109621 - BLOCK
      ?auto_109622 - BLOCK
      ?auto_109623 - BLOCK
      ?auto_109624 - BLOCK
    )
    :vars
    (
      ?auto_109625 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109619 ) ( ON ?auto_109620 ?auto_109619 ) ( not ( = ?auto_109619 ?auto_109620 ) ) ( not ( = ?auto_109619 ?auto_109621 ) ) ( not ( = ?auto_109619 ?auto_109622 ) ) ( not ( = ?auto_109619 ?auto_109623 ) ) ( not ( = ?auto_109619 ?auto_109624 ) ) ( not ( = ?auto_109620 ?auto_109621 ) ) ( not ( = ?auto_109620 ?auto_109622 ) ) ( not ( = ?auto_109620 ?auto_109623 ) ) ( not ( = ?auto_109620 ?auto_109624 ) ) ( not ( = ?auto_109621 ?auto_109622 ) ) ( not ( = ?auto_109621 ?auto_109623 ) ) ( not ( = ?auto_109621 ?auto_109624 ) ) ( not ( = ?auto_109622 ?auto_109623 ) ) ( not ( = ?auto_109622 ?auto_109624 ) ) ( not ( = ?auto_109623 ?auto_109624 ) ) ( ON ?auto_109624 ?auto_109625 ) ( not ( = ?auto_109619 ?auto_109625 ) ) ( not ( = ?auto_109620 ?auto_109625 ) ) ( not ( = ?auto_109621 ?auto_109625 ) ) ( not ( = ?auto_109622 ?auto_109625 ) ) ( not ( = ?auto_109623 ?auto_109625 ) ) ( not ( = ?auto_109624 ?auto_109625 ) ) ( ON ?auto_109623 ?auto_109624 ) ( ON-TABLE ?auto_109625 ) ( ON ?auto_109622 ?auto_109623 ) ( CLEAR ?auto_109622 ) ( HOLDING ?auto_109621 ) ( CLEAR ?auto_109620 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109619 ?auto_109620 ?auto_109621 )
      ( MAKE-6PILE ?auto_109619 ?auto_109620 ?auto_109621 ?auto_109622 ?auto_109623 ?auto_109624 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109626 - BLOCK
      ?auto_109627 - BLOCK
      ?auto_109628 - BLOCK
      ?auto_109629 - BLOCK
      ?auto_109630 - BLOCK
      ?auto_109631 - BLOCK
    )
    :vars
    (
      ?auto_109632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109626 ) ( ON ?auto_109627 ?auto_109626 ) ( not ( = ?auto_109626 ?auto_109627 ) ) ( not ( = ?auto_109626 ?auto_109628 ) ) ( not ( = ?auto_109626 ?auto_109629 ) ) ( not ( = ?auto_109626 ?auto_109630 ) ) ( not ( = ?auto_109626 ?auto_109631 ) ) ( not ( = ?auto_109627 ?auto_109628 ) ) ( not ( = ?auto_109627 ?auto_109629 ) ) ( not ( = ?auto_109627 ?auto_109630 ) ) ( not ( = ?auto_109627 ?auto_109631 ) ) ( not ( = ?auto_109628 ?auto_109629 ) ) ( not ( = ?auto_109628 ?auto_109630 ) ) ( not ( = ?auto_109628 ?auto_109631 ) ) ( not ( = ?auto_109629 ?auto_109630 ) ) ( not ( = ?auto_109629 ?auto_109631 ) ) ( not ( = ?auto_109630 ?auto_109631 ) ) ( ON ?auto_109631 ?auto_109632 ) ( not ( = ?auto_109626 ?auto_109632 ) ) ( not ( = ?auto_109627 ?auto_109632 ) ) ( not ( = ?auto_109628 ?auto_109632 ) ) ( not ( = ?auto_109629 ?auto_109632 ) ) ( not ( = ?auto_109630 ?auto_109632 ) ) ( not ( = ?auto_109631 ?auto_109632 ) ) ( ON ?auto_109630 ?auto_109631 ) ( ON-TABLE ?auto_109632 ) ( ON ?auto_109629 ?auto_109630 ) ( CLEAR ?auto_109627 ) ( ON ?auto_109628 ?auto_109629 ) ( CLEAR ?auto_109628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109632 ?auto_109631 ?auto_109630 ?auto_109629 )
      ( MAKE-6PILE ?auto_109626 ?auto_109627 ?auto_109628 ?auto_109629 ?auto_109630 ?auto_109631 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109633 - BLOCK
      ?auto_109634 - BLOCK
      ?auto_109635 - BLOCK
      ?auto_109636 - BLOCK
      ?auto_109637 - BLOCK
      ?auto_109638 - BLOCK
    )
    :vars
    (
      ?auto_109639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109633 ) ( not ( = ?auto_109633 ?auto_109634 ) ) ( not ( = ?auto_109633 ?auto_109635 ) ) ( not ( = ?auto_109633 ?auto_109636 ) ) ( not ( = ?auto_109633 ?auto_109637 ) ) ( not ( = ?auto_109633 ?auto_109638 ) ) ( not ( = ?auto_109634 ?auto_109635 ) ) ( not ( = ?auto_109634 ?auto_109636 ) ) ( not ( = ?auto_109634 ?auto_109637 ) ) ( not ( = ?auto_109634 ?auto_109638 ) ) ( not ( = ?auto_109635 ?auto_109636 ) ) ( not ( = ?auto_109635 ?auto_109637 ) ) ( not ( = ?auto_109635 ?auto_109638 ) ) ( not ( = ?auto_109636 ?auto_109637 ) ) ( not ( = ?auto_109636 ?auto_109638 ) ) ( not ( = ?auto_109637 ?auto_109638 ) ) ( ON ?auto_109638 ?auto_109639 ) ( not ( = ?auto_109633 ?auto_109639 ) ) ( not ( = ?auto_109634 ?auto_109639 ) ) ( not ( = ?auto_109635 ?auto_109639 ) ) ( not ( = ?auto_109636 ?auto_109639 ) ) ( not ( = ?auto_109637 ?auto_109639 ) ) ( not ( = ?auto_109638 ?auto_109639 ) ) ( ON ?auto_109637 ?auto_109638 ) ( ON-TABLE ?auto_109639 ) ( ON ?auto_109636 ?auto_109637 ) ( ON ?auto_109635 ?auto_109636 ) ( CLEAR ?auto_109635 ) ( HOLDING ?auto_109634 ) ( CLEAR ?auto_109633 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109633 ?auto_109634 )
      ( MAKE-6PILE ?auto_109633 ?auto_109634 ?auto_109635 ?auto_109636 ?auto_109637 ?auto_109638 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109640 - BLOCK
      ?auto_109641 - BLOCK
      ?auto_109642 - BLOCK
      ?auto_109643 - BLOCK
      ?auto_109644 - BLOCK
      ?auto_109645 - BLOCK
    )
    :vars
    (
      ?auto_109646 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109640 ) ( not ( = ?auto_109640 ?auto_109641 ) ) ( not ( = ?auto_109640 ?auto_109642 ) ) ( not ( = ?auto_109640 ?auto_109643 ) ) ( not ( = ?auto_109640 ?auto_109644 ) ) ( not ( = ?auto_109640 ?auto_109645 ) ) ( not ( = ?auto_109641 ?auto_109642 ) ) ( not ( = ?auto_109641 ?auto_109643 ) ) ( not ( = ?auto_109641 ?auto_109644 ) ) ( not ( = ?auto_109641 ?auto_109645 ) ) ( not ( = ?auto_109642 ?auto_109643 ) ) ( not ( = ?auto_109642 ?auto_109644 ) ) ( not ( = ?auto_109642 ?auto_109645 ) ) ( not ( = ?auto_109643 ?auto_109644 ) ) ( not ( = ?auto_109643 ?auto_109645 ) ) ( not ( = ?auto_109644 ?auto_109645 ) ) ( ON ?auto_109645 ?auto_109646 ) ( not ( = ?auto_109640 ?auto_109646 ) ) ( not ( = ?auto_109641 ?auto_109646 ) ) ( not ( = ?auto_109642 ?auto_109646 ) ) ( not ( = ?auto_109643 ?auto_109646 ) ) ( not ( = ?auto_109644 ?auto_109646 ) ) ( not ( = ?auto_109645 ?auto_109646 ) ) ( ON ?auto_109644 ?auto_109645 ) ( ON-TABLE ?auto_109646 ) ( ON ?auto_109643 ?auto_109644 ) ( ON ?auto_109642 ?auto_109643 ) ( CLEAR ?auto_109640 ) ( ON ?auto_109641 ?auto_109642 ) ( CLEAR ?auto_109641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109646 ?auto_109645 ?auto_109644 ?auto_109643 ?auto_109642 )
      ( MAKE-6PILE ?auto_109640 ?auto_109641 ?auto_109642 ?auto_109643 ?auto_109644 ?auto_109645 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109647 - BLOCK
      ?auto_109648 - BLOCK
      ?auto_109649 - BLOCK
      ?auto_109650 - BLOCK
      ?auto_109651 - BLOCK
      ?auto_109652 - BLOCK
    )
    :vars
    (
      ?auto_109653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109647 ?auto_109648 ) ) ( not ( = ?auto_109647 ?auto_109649 ) ) ( not ( = ?auto_109647 ?auto_109650 ) ) ( not ( = ?auto_109647 ?auto_109651 ) ) ( not ( = ?auto_109647 ?auto_109652 ) ) ( not ( = ?auto_109648 ?auto_109649 ) ) ( not ( = ?auto_109648 ?auto_109650 ) ) ( not ( = ?auto_109648 ?auto_109651 ) ) ( not ( = ?auto_109648 ?auto_109652 ) ) ( not ( = ?auto_109649 ?auto_109650 ) ) ( not ( = ?auto_109649 ?auto_109651 ) ) ( not ( = ?auto_109649 ?auto_109652 ) ) ( not ( = ?auto_109650 ?auto_109651 ) ) ( not ( = ?auto_109650 ?auto_109652 ) ) ( not ( = ?auto_109651 ?auto_109652 ) ) ( ON ?auto_109652 ?auto_109653 ) ( not ( = ?auto_109647 ?auto_109653 ) ) ( not ( = ?auto_109648 ?auto_109653 ) ) ( not ( = ?auto_109649 ?auto_109653 ) ) ( not ( = ?auto_109650 ?auto_109653 ) ) ( not ( = ?auto_109651 ?auto_109653 ) ) ( not ( = ?auto_109652 ?auto_109653 ) ) ( ON ?auto_109651 ?auto_109652 ) ( ON-TABLE ?auto_109653 ) ( ON ?auto_109650 ?auto_109651 ) ( ON ?auto_109649 ?auto_109650 ) ( ON ?auto_109648 ?auto_109649 ) ( CLEAR ?auto_109648 ) ( HOLDING ?auto_109647 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109647 )
      ( MAKE-6PILE ?auto_109647 ?auto_109648 ?auto_109649 ?auto_109650 ?auto_109651 ?auto_109652 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109654 - BLOCK
      ?auto_109655 - BLOCK
      ?auto_109656 - BLOCK
      ?auto_109657 - BLOCK
      ?auto_109658 - BLOCK
      ?auto_109659 - BLOCK
    )
    :vars
    (
      ?auto_109660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109654 ?auto_109655 ) ) ( not ( = ?auto_109654 ?auto_109656 ) ) ( not ( = ?auto_109654 ?auto_109657 ) ) ( not ( = ?auto_109654 ?auto_109658 ) ) ( not ( = ?auto_109654 ?auto_109659 ) ) ( not ( = ?auto_109655 ?auto_109656 ) ) ( not ( = ?auto_109655 ?auto_109657 ) ) ( not ( = ?auto_109655 ?auto_109658 ) ) ( not ( = ?auto_109655 ?auto_109659 ) ) ( not ( = ?auto_109656 ?auto_109657 ) ) ( not ( = ?auto_109656 ?auto_109658 ) ) ( not ( = ?auto_109656 ?auto_109659 ) ) ( not ( = ?auto_109657 ?auto_109658 ) ) ( not ( = ?auto_109657 ?auto_109659 ) ) ( not ( = ?auto_109658 ?auto_109659 ) ) ( ON ?auto_109659 ?auto_109660 ) ( not ( = ?auto_109654 ?auto_109660 ) ) ( not ( = ?auto_109655 ?auto_109660 ) ) ( not ( = ?auto_109656 ?auto_109660 ) ) ( not ( = ?auto_109657 ?auto_109660 ) ) ( not ( = ?auto_109658 ?auto_109660 ) ) ( not ( = ?auto_109659 ?auto_109660 ) ) ( ON ?auto_109658 ?auto_109659 ) ( ON-TABLE ?auto_109660 ) ( ON ?auto_109657 ?auto_109658 ) ( ON ?auto_109656 ?auto_109657 ) ( ON ?auto_109655 ?auto_109656 ) ( ON ?auto_109654 ?auto_109655 ) ( CLEAR ?auto_109654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109660 ?auto_109659 ?auto_109658 ?auto_109657 ?auto_109656 ?auto_109655 )
      ( MAKE-6PILE ?auto_109654 ?auto_109655 ?auto_109656 ?auto_109657 ?auto_109658 ?auto_109659 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109661 - BLOCK
      ?auto_109662 - BLOCK
      ?auto_109663 - BLOCK
      ?auto_109664 - BLOCK
      ?auto_109665 - BLOCK
      ?auto_109666 - BLOCK
    )
    :vars
    (
      ?auto_109667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109661 ?auto_109662 ) ) ( not ( = ?auto_109661 ?auto_109663 ) ) ( not ( = ?auto_109661 ?auto_109664 ) ) ( not ( = ?auto_109661 ?auto_109665 ) ) ( not ( = ?auto_109661 ?auto_109666 ) ) ( not ( = ?auto_109662 ?auto_109663 ) ) ( not ( = ?auto_109662 ?auto_109664 ) ) ( not ( = ?auto_109662 ?auto_109665 ) ) ( not ( = ?auto_109662 ?auto_109666 ) ) ( not ( = ?auto_109663 ?auto_109664 ) ) ( not ( = ?auto_109663 ?auto_109665 ) ) ( not ( = ?auto_109663 ?auto_109666 ) ) ( not ( = ?auto_109664 ?auto_109665 ) ) ( not ( = ?auto_109664 ?auto_109666 ) ) ( not ( = ?auto_109665 ?auto_109666 ) ) ( ON ?auto_109666 ?auto_109667 ) ( not ( = ?auto_109661 ?auto_109667 ) ) ( not ( = ?auto_109662 ?auto_109667 ) ) ( not ( = ?auto_109663 ?auto_109667 ) ) ( not ( = ?auto_109664 ?auto_109667 ) ) ( not ( = ?auto_109665 ?auto_109667 ) ) ( not ( = ?auto_109666 ?auto_109667 ) ) ( ON ?auto_109665 ?auto_109666 ) ( ON-TABLE ?auto_109667 ) ( ON ?auto_109664 ?auto_109665 ) ( ON ?auto_109663 ?auto_109664 ) ( ON ?auto_109662 ?auto_109663 ) ( HOLDING ?auto_109661 ) ( CLEAR ?auto_109662 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109667 ?auto_109666 ?auto_109665 ?auto_109664 ?auto_109663 ?auto_109662 ?auto_109661 )
      ( MAKE-6PILE ?auto_109661 ?auto_109662 ?auto_109663 ?auto_109664 ?auto_109665 ?auto_109666 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109668 - BLOCK
      ?auto_109669 - BLOCK
      ?auto_109670 - BLOCK
      ?auto_109671 - BLOCK
      ?auto_109672 - BLOCK
      ?auto_109673 - BLOCK
    )
    :vars
    (
      ?auto_109674 - BLOCK
      ?auto_109675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109668 ?auto_109669 ) ) ( not ( = ?auto_109668 ?auto_109670 ) ) ( not ( = ?auto_109668 ?auto_109671 ) ) ( not ( = ?auto_109668 ?auto_109672 ) ) ( not ( = ?auto_109668 ?auto_109673 ) ) ( not ( = ?auto_109669 ?auto_109670 ) ) ( not ( = ?auto_109669 ?auto_109671 ) ) ( not ( = ?auto_109669 ?auto_109672 ) ) ( not ( = ?auto_109669 ?auto_109673 ) ) ( not ( = ?auto_109670 ?auto_109671 ) ) ( not ( = ?auto_109670 ?auto_109672 ) ) ( not ( = ?auto_109670 ?auto_109673 ) ) ( not ( = ?auto_109671 ?auto_109672 ) ) ( not ( = ?auto_109671 ?auto_109673 ) ) ( not ( = ?auto_109672 ?auto_109673 ) ) ( ON ?auto_109673 ?auto_109674 ) ( not ( = ?auto_109668 ?auto_109674 ) ) ( not ( = ?auto_109669 ?auto_109674 ) ) ( not ( = ?auto_109670 ?auto_109674 ) ) ( not ( = ?auto_109671 ?auto_109674 ) ) ( not ( = ?auto_109672 ?auto_109674 ) ) ( not ( = ?auto_109673 ?auto_109674 ) ) ( ON ?auto_109672 ?auto_109673 ) ( ON-TABLE ?auto_109674 ) ( ON ?auto_109671 ?auto_109672 ) ( ON ?auto_109670 ?auto_109671 ) ( ON ?auto_109669 ?auto_109670 ) ( CLEAR ?auto_109669 ) ( ON ?auto_109668 ?auto_109675 ) ( CLEAR ?auto_109668 ) ( HAND-EMPTY ) ( not ( = ?auto_109668 ?auto_109675 ) ) ( not ( = ?auto_109669 ?auto_109675 ) ) ( not ( = ?auto_109670 ?auto_109675 ) ) ( not ( = ?auto_109671 ?auto_109675 ) ) ( not ( = ?auto_109672 ?auto_109675 ) ) ( not ( = ?auto_109673 ?auto_109675 ) ) ( not ( = ?auto_109674 ?auto_109675 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109668 ?auto_109675 )
      ( MAKE-6PILE ?auto_109668 ?auto_109669 ?auto_109670 ?auto_109671 ?auto_109672 ?auto_109673 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109676 - BLOCK
      ?auto_109677 - BLOCK
      ?auto_109678 - BLOCK
      ?auto_109679 - BLOCK
      ?auto_109680 - BLOCK
      ?auto_109681 - BLOCK
    )
    :vars
    (
      ?auto_109683 - BLOCK
      ?auto_109682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109676 ?auto_109677 ) ) ( not ( = ?auto_109676 ?auto_109678 ) ) ( not ( = ?auto_109676 ?auto_109679 ) ) ( not ( = ?auto_109676 ?auto_109680 ) ) ( not ( = ?auto_109676 ?auto_109681 ) ) ( not ( = ?auto_109677 ?auto_109678 ) ) ( not ( = ?auto_109677 ?auto_109679 ) ) ( not ( = ?auto_109677 ?auto_109680 ) ) ( not ( = ?auto_109677 ?auto_109681 ) ) ( not ( = ?auto_109678 ?auto_109679 ) ) ( not ( = ?auto_109678 ?auto_109680 ) ) ( not ( = ?auto_109678 ?auto_109681 ) ) ( not ( = ?auto_109679 ?auto_109680 ) ) ( not ( = ?auto_109679 ?auto_109681 ) ) ( not ( = ?auto_109680 ?auto_109681 ) ) ( ON ?auto_109681 ?auto_109683 ) ( not ( = ?auto_109676 ?auto_109683 ) ) ( not ( = ?auto_109677 ?auto_109683 ) ) ( not ( = ?auto_109678 ?auto_109683 ) ) ( not ( = ?auto_109679 ?auto_109683 ) ) ( not ( = ?auto_109680 ?auto_109683 ) ) ( not ( = ?auto_109681 ?auto_109683 ) ) ( ON ?auto_109680 ?auto_109681 ) ( ON-TABLE ?auto_109683 ) ( ON ?auto_109679 ?auto_109680 ) ( ON ?auto_109678 ?auto_109679 ) ( ON ?auto_109676 ?auto_109682 ) ( CLEAR ?auto_109676 ) ( not ( = ?auto_109676 ?auto_109682 ) ) ( not ( = ?auto_109677 ?auto_109682 ) ) ( not ( = ?auto_109678 ?auto_109682 ) ) ( not ( = ?auto_109679 ?auto_109682 ) ) ( not ( = ?auto_109680 ?auto_109682 ) ) ( not ( = ?auto_109681 ?auto_109682 ) ) ( not ( = ?auto_109683 ?auto_109682 ) ) ( HOLDING ?auto_109677 ) ( CLEAR ?auto_109678 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109683 ?auto_109681 ?auto_109680 ?auto_109679 ?auto_109678 ?auto_109677 )
      ( MAKE-6PILE ?auto_109676 ?auto_109677 ?auto_109678 ?auto_109679 ?auto_109680 ?auto_109681 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109684 - BLOCK
      ?auto_109685 - BLOCK
      ?auto_109686 - BLOCK
      ?auto_109687 - BLOCK
      ?auto_109688 - BLOCK
      ?auto_109689 - BLOCK
    )
    :vars
    (
      ?auto_109691 - BLOCK
      ?auto_109690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109684 ?auto_109685 ) ) ( not ( = ?auto_109684 ?auto_109686 ) ) ( not ( = ?auto_109684 ?auto_109687 ) ) ( not ( = ?auto_109684 ?auto_109688 ) ) ( not ( = ?auto_109684 ?auto_109689 ) ) ( not ( = ?auto_109685 ?auto_109686 ) ) ( not ( = ?auto_109685 ?auto_109687 ) ) ( not ( = ?auto_109685 ?auto_109688 ) ) ( not ( = ?auto_109685 ?auto_109689 ) ) ( not ( = ?auto_109686 ?auto_109687 ) ) ( not ( = ?auto_109686 ?auto_109688 ) ) ( not ( = ?auto_109686 ?auto_109689 ) ) ( not ( = ?auto_109687 ?auto_109688 ) ) ( not ( = ?auto_109687 ?auto_109689 ) ) ( not ( = ?auto_109688 ?auto_109689 ) ) ( ON ?auto_109689 ?auto_109691 ) ( not ( = ?auto_109684 ?auto_109691 ) ) ( not ( = ?auto_109685 ?auto_109691 ) ) ( not ( = ?auto_109686 ?auto_109691 ) ) ( not ( = ?auto_109687 ?auto_109691 ) ) ( not ( = ?auto_109688 ?auto_109691 ) ) ( not ( = ?auto_109689 ?auto_109691 ) ) ( ON ?auto_109688 ?auto_109689 ) ( ON-TABLE ?auto_109691 ) ( ON ?auto_109687 ?auto_109688 ) ( ON ?auto_109686 ?auto_109687 ) ( ON ?auto_109684 ?auto_109690 ) ( not ( = ?auto_109684 ?auto_109690 ) ) ( not ( = ?auto_109685 ?auto_109690 ) ) ( not ( = ?auto_109686 ?auto_109690 ) ) ( not ( = ?auto_109687 ?auto_109690 ) ) ( not ( = ?auto_109688 ?auto_109690 ) ) ( not ( = ?auto_109689 ?auto_109690 ) ) ( not ( = ?auto_109691 ?auto_109690 ) ) ( CLEAR ?auto_109686 ) ( ON ?auto_109685 ?auto_109684 ) ( CLEAR ?auto_109685 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109690 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109690 ?auto_109684 )
      ( MAKE-6PILE ?auto_109684 ?auto_109685 ?auto_109686 ?auto_109687 ?auto_109688 ?auto_109689 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109692 - BLOCK
      ?auto_109693 - BLOCK
      ?auto_109694 - BLOCK
      ?auto_109695 - BLOCK
      ?auto_109696 - BLOCK
      ?auto_109697 - BLOCK
    )
    :vars
    (
      ?auto_109699 - BLOCK
      ?auto_109698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109692 ?auto_109693 ) ) ( not ( = ?auto_109692 ?auto_109694 ) ) ( not ( = ?auto_109692 ?auto_109695 ) ) ( not ( = ?auto_109692 ?auto_109696 ) ) ( not ( = ?auto_109692 ?auto_109697 ) ) ( not ( = ?auto_109693 ?auto_109694 ) ) ( not ( = ?auto_109693 ?auto_109695 ) ) ( not ( = ?auto_109693 ?auto_109696 ) ) ( not ( = ?auto_109693 ?auto_109697 ) ) ( not ( = ?auto_109694 ?auto_109695 ) ) ( not ( = ?auto_109694 ?auto_109696 ) ) ( not ( = ?auto_109694 ?auto_109697 ) ) ( not ( = ?auto_109695 ?auto_109696 ) ) ( not ( = ?auto_109695 ?auto_109697 ) ) ( not ( = ?auto_109696 ?auto_109697 ) ) ( ON ?auto_109697 ?auto_109699 ) ( not ( = ?auto_109692 ?auto_109699 ) ) ( not ( = ?auto_109693 ?auto_109699 ) ) ( not ( = ?auto_109694 ?auto_109699 ) ) ( not ( = ?auto_109695 ?auto_109699 ) ) ( not ( = ?auto_109696 ?auto_109699 ) ) ( not ( = ?auto_109697 ?auto_109699 ) ) ( ON ?auto_109696 ?auto_109697 ) ( ON-TABLE ?auto_109699 ) ( ON ?auto_109695 ?auto_109696 ) ( ON ?auto_109692 ?auto_109698 ) ( not ( = ?auto_109692 ?auto_109698 ) ) ( not ( = ?auto_109693 ?auto_109698 ) ) ( not ( = ?auto_109694 ?auto_109698 ) ) ( not ( = ?auto_109695 ?auto_109698 ) ) ( not ( = ?auto_109696 ?auto_109698 ) ) ( not ( = ?auto_109697 ?auto_109698 ) ) ( not ( = ?auto_109699 ?auto_109698 ) ) ( ON ?auto_109693 ?auto_109692 ) ( CLEAR ?auto_109693 ) ( ON-TABLE ?auto_109698 ) ( HOLDING ?auto_109694 ) ( CLEAR ?auto_109695 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109699 ?auto_109697 ?auto_109696 ?auto_109695 ?auto_109694 )
      ( MAKE-6PILE ?auto_109692 ?auto_109693 ?auto_109694 ?auto_109695 ?auto_109696 ?auto_109697 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109700 - BLOCK
      ?auto_109701 - BLOCK
      ?auto_109702 - BLOCK
      ?auto_109703 - BLOCK
      ?auto_109704 - BLOCK
      ?auto_109705 - BLOCK
    )
    :vars
    (
      ?auto_109707 - BLOCK
      ?auto_109706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109700 ?auto_109701 ) ) ( not ( = ?auto_109700 ?auto_109702 ) ) ( not ( = ?auto_109700 ?auto_109703 ) ) ( not ( = ?auto_109700 ?auto_109704 ) ) ( not ( = ?auto_109700 ?auto_109705 ) ) ( not ( = ?auto_109701 ?auto_109702 ) ) ( not ( = ?auto_109701 ?auto_109703 ) ) ( not ( = ?auto_109701 ?auto_109704 ) ) ( not ( = ?auto_109701 ?auto_109705 ) ) ( not ( = ?auto_109702 ?auto_109703 ) ) ( not ( = ?auto_109702 ?auto_109704 ) ) ( not ( = ?auto_109702 ?auto_109705 ) ) ( not ( = ?auto_109703 ?auto_109704 ) ) ( not ( = ?auto_109703 ?auto_109705 ) ) ( not ( = ?auto_109704 ?auto_109705 ) ) ( ON ?auto_109705 ?auto_109707 ) ( not ( = ?auto_109700 ?auto_109707 ) ) ( not ( = ?auto_109701 ?auto_109707 ) ) ( not ( = ?auto_109702 ?auto_109707 ) ) ( not ( = ?auto_109703 ?auto_109707 ) ) ( not ( = ?auto_109704 ?auto_109707 ) ) ( not ( = ?auto_109705 ?auto_109707 ) ) ( ON ?auto_109704 ?auto_109705 ) ( ON-TABLE ?auto_109707 ) ( ON ?auto_109703 ?auto_109704 ) ( ON ?auto_109700 ?auto_109706 ) ( not ( = ?auto_109700 ?auto_109706 ) ) ( not ( = ?auto_109701 ?auto_109706 ) ) ( not ( = ?auto_109702 ?auto_109706 ) ) ( not ( = ?auto_109703 ?auto_109706 ) ) ( not ( = ?auto_109704 ?auto_109706 ) ) ( not ( = ?auto_109705 ?auto_109706 ) ) ( not ( = ?auto_109707 ?auto_109706 ) ) ( ON ?auto_109701 ?auto_109700 ) ( ON-TABLE ?auto_109706 ) ( CLEAR ?auto_109703 ) ( ON ?auto_109702 ?auto_109701 ) ( CLEAR ?auto_109702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109706 ?auto_109700 ?auto_109701 )
      ( MAKE-6PILE ?auto_109700 ?auto_109701 ?auto_109702 ?auto_109703 ?auto_109704 ?auto_109705 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109708 - BLOCK
      ?auto_109709 - BLOCK
      ?auto_109710 - BLOCK
      ?auto_109711 - BLOCK
      ?auto_109712 - BLOCK
      ?auto_109713 - BLOCK
    )
    :vars
    (
      ?auto_109715 - BLOCK
      ?auto_109714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109708 ?auto_109709 ) ) ( not ( = ?auto_109708 ?auto_109710 ) ) ( not ( = ?auto_109708 ?auto_109711 ) ) ( not ( = ?auto_109708 ?auto_109712 ) ) ( not ( = ?auto_109708 ?auto_109713 ) ) ( not ( = ?auto_109709 ?auto_109710 ) ) ( not ( = ?auto_109709 ?auto_109711 ) ) ( not ( = ?auto_109709 ?auto_109712 ) ) ( not ( = ?auto_109709 ?auto_109713 ) ) ( not ( = ?auto_109710 ?auto_109711 ) ) ( not ( = ?auto_109710 ?auto_109712 ) ) ( not ( = ?auto_109710 ?auto_109713 ) ) ( not ( = ?auto_109711 ?auto_109712 ) ) ( not ( = ?auto_109711 ?auto_109713 ) ) ( not ( = ?auto_109712 ?auto_109713 ) ) ( ON ?auto_109713 ?auto_109715 ) ( not ( = ?auto_109708 ?auto_109715 ) ) ( not ( = ?auto_109709 ?auto_109715 ) ) ( not ( = ?auto_109710 ?auto_109715 ) ) ( not ( = ?auto_109711 ?auto_109715 ) ) ( not ( = ?auto_109712 ?auto_109715 ) ) ( not ( = ?auto_109713 ?auto_109715 ) ) ( ON ?auto_109712 ?auto_109713 ) ( ON-TABLE ?auto_109715 ) ( ON ?auto_109708 ?auto_109714 ) ( not ( = ?auto_109708 ?auto_109714 ) ) ( not ( = ?auto_109709 ?auto_109714 ) ) ( not ( = ?auto_109710 ?auto_109714 ) ) ( not ( = ?auto_109711 ?auto_109714 ) ) ( not ( = ?auto_109712 ?auto_109714 ) ) ( not ( = ?auto_109713 ?auto_109714 ) ) ( not ( = ?auto_109715 ?auto_109714 ) ) ( ON ?auto_109709 ?auto_109708 ) ( ON-TABLE ?auto_109714 ) ( ON ?auto_109710 ?auto_109709 ) ( CLEAR ?auto_109710 ) ( HOLDING ?auto_109711 ) ( CLEAR ?auto_109712 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109715 ?auto_109713 ?auto_109712 ?auto_109711 )
      ( MAKE-6PILE ?auto_109708 ?auto_109709 ?auto_109710 ?auto_109711 ?auto_109712 ?auto_109713 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109716 - BLOCK
      ?auto_109717 - BLOCK
      ?auto_109718 - BLOCK
      ?auto_109719 - BLOCK
      ?auto_109720 - BLOCK
      ?auto_109721 - BLOCK
    )
    :vars
    (
      ?auto_109722 - BLOCK
      ?auto_109723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109716 ?auto_109717 ) ) ( not ( = ?auto_109716 ?auto_109718 ) ) ( not ( = ?auto_109716 ?auto_109719 ) ) ( not ( = ?auto_109716 ?auto_109720 ) ) ( not ( = ?auto_109716 ?auto_109721 ) ) ( not ( = ?auto_109717 ?auto_109718 ) ) ( not ( = ?auto_109717 ?auto_109719 ) ) ( not ( = ?auto_109717 ?auto_109720 ) ) ( not ( = ?auto_109717 ?auto_109721 ) ) ( not ( = ?auto_109718 ?auto_109719 ) ) ( not ( = ?auto_109718 ?auto_109720 ) ) ( not ( = ?auto_109718 ?auto_109721 ) ) ( not ( = ?auto_109719 ?auto_109720 ) ) ( not ( = ?auto_109719 ?auto_109721 ) ) ( not ( = ?auto_109720 ?auto_109721 ) ) ( ON ?auto_109721 ?auto_109722 ) ( not ( = ?auto_109716 ?auto_109722 ) ) ( not ( = ?auto_109717 ?auto_109722 ) ) ( not ( = ?auto_109718 ?auto_109722 ) ) ( not ( = ?auto_109719 ?auto_109722 ) ) ( not ( = ?auto_109720 ?auto_109722 ) ) ( not ( = ?auto_109721 ?auto_109722 ) ) ( ON ?auto_109720 ?auto_109721 ) ( ON-TABLE ?auto_109722 ) ( ON ?auto_109716 ?auto_109723 ) ( not ( = ?auto_109716 ?auto_109723 ) ) ( not ( = ?auto_109717 ?auto_109723 ) ) ( not ( = ?auto_109718 ?auto_109723 ) ) ( not ( = ?auto_109719 ?auto_109723 ) ) ( not ( = ?auto_109720 ?auto_109723 ) ) ( not ( = ?auto_109721 ?auto_109723 ) ) ( not ( = ?auto_109722 ?auto_109723 ) ) ( ON ?auto_109717 ?auto_109716 ) ( ON-TABLE ?auto_109723 ) ( ON ?auto_109718 ?auto_109717 ) ( CLEAR ?auto_109720 ) ( ON ?auto_109719 ?auto_109718 ) ( CLEAR ?auto_109719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109723 ?auto_109716 ?auto_109717 ?auto_109718 )
      ( MAKE-6PILE ?auto_109716 ?auto_109717 ?auto_109718 ?auto_109719 ?auto_109720 ?auto_109721 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109724 - BLOCK
      ?auto_109725 - BLOCK
      ?auto_109726 - BLOCK
      ?auto_109727 - BLOCK
      ?auto_109728 - BLOCK
      ?auto_109729 - BLOCK
    )
    :vars
    (
      ?auto_109730 - BLOCK
      ?auto_109731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109724 ?auto_109725 ) ) ( not ( = ?auto_109724 ?auto_109726 ) ) ( not ( = ?auto_109724 ?auto_109727 ) ) ( not ( = ?auto_109724 ?auto_109728 ) ) ( not ( = ?auto_109724 ?auto_109729 ) ) ( not ( = ?auto_109725 ?auto_109726 ) ) ( not ( = ?auto_109725 ?auto_109727 ) ) ( not ( = ?auto_109725 ?auto_109728 ) ) ( not ( = ?auto_109725 ?auto_109729 ) ) ( not ( = ?auto_109726 ?auto_109727 ) ) ( not ( = ?auto_109726 ?auto_109728 ) ) ( not ( = ?auto_109726 ?auto_109729 ) ) ( not ( = ?auto_109727 ?auto_109728 ) ) ( not ( = ?auto_109727 ?auto_109729 ) ) ( not ( = ?auto_109728 ?auto_109729 ) ) ( ON ?auto_109729 ?auto_109730 ) ( not ( = ?auto_109724 ?auto_109730 ) ) ( not ( = ?auto_109725 ?auto_109730 ) ) ( not ( = ?auto_109726 ?auto_109730 ) ) ( not ( = ?auto_109727 ?auto_109730 ) ) ( not ( = ?auto_109728 ?auto_109730 ) ) ( not ( = ?auto_109729 ?auto_109730 ) ) ( ON-TABLE ?auto_109730 ) ( ON ?auto_109724 ?auto_109731 ) ( not ( = ?auto_109724 ?auto_109731 ) ) ( not ( = ?auto_109725 ?auto_109731 ) ) ( not ( = ?auto_109726 ?auto_109731 ) ) ( not ( = ?auto_109727 ?auto_109731 ) ) ( not ( = ?auto_109728 ?auto_109731 ) ) ( not ( = ?auto_109729 ?auto_109731 ) ) ( not ( = ?auto_109730 ?auto_109731 ) ) ( ON ?auto_109725 ?auto_109724 ) ( ON-TABLE ?auto_109731 ) ( ON ?auto_109726 ?auto_109725 ) ( ON ?auto_109727 ?auto_109726 ) ( CLEAR ?auto_109727 ) ( HOLDING ?auto_109728 ) ( CLEAR ?auto_109729 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109730 ?auto_109729 ?auto_109728 )
      ( MAKE-6PILE ?auto_109724 ?auto_109725 ?auto_109726 ?auto_109727 ?auto_109728 ?auto_109729 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109732 - BLOCK
      ?auto_109733 - BLOCK
      ?auto_109734 - BLOCK
      ?auto_109735 - BLOCK
      ?auto_109736 - BLOCK
      ?auto_109737 - BLOCK
    )
    :vars
    (
      ?auto_109738 - BLOCK
      ?auto_109739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109732 ?auto_109733 ) ) ( not ( = ?auto_109732 ?auto_109734 ) ) ( not ( = ?auto_109732 ?auto_109735 ) ) ( not ( = ?auto_109732 ?auto_109736 ) ) ( not ( = ?auto_109732 ?auto_109737 ) ) ( not ( = ?auto_109733 ?auto_109734 ) ) ( not ( = ?auto_109733 ?auto_109735 ) ) ( not ( = ?auto_109733 ?auto_109736 ) ) ( not ( = ?auto_109733 ?auto_109737 ) ) ( not ( = ?auto_109734 ?auto_109735 ) ) ( not ( = ?auto_109734 ?auto_109736 ) ) ( not ( = ?auto_109734 ?auto_109737 ) ) ( not ( = ?auto_109735 ?auto_109736 ) ) ( not ( = ?auto_109735 ?auto_109737 ) ) ( not ( = ?auto_109736 ?auto_109737 ) ) ( ON ?auto_109737 ?auto_109738 ) ( not ( = ?auto_109732 ?auto_109738 ) ) ( not ( = ?auto_109733 ?auto_109738 ) ) ( not ( = ?auto_109734 ?auto_109738 ) ) ( not ( = ?auto_109735 ?auto_109738 ) ) ( not ( = ?auto_109736 ?auto_109738 ) ) ( not ( = ?auto_109737 ?auto_109738 ) ) ( ON-TABLE ?auto_109738 ) ( ON ?auto_109732 ?auto_109739 ) ( not ( = ?auto_109732 ?auto_109739 ) ) ( not ( = ?auto_109733 ?auto_109739 ) ) ( not ( = ?auto_109734 ?auto_109739 ) ) ( not ( = ?auto_109735 ?auto_109739 ) ) ( not ( = ?auto_109736 ?auto_109739 ) ) ( not ( = ?auto_109737 ?auto_109739 ) ) ( not ( = ?auto_109738 ?auto_109739 ) ) ( ON ?auto_109733 ?auto_109732 ) ( ON-TABLE ?auto_109739 ) ( ON ?auto_109734 ?auto_109733 ) ( ON ?auto_109735 ?auto_109734 ) ( CLEAR ?auto_109737 ) ( ON ?auto_109736 ?auto_109735 ) ( CLEAR ?auto_109736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109739 ?auto_109732 ?auto_109733 ?auto_109734 ?auto_109735 )
      ( MAKE-6PILE ?auto_109732 ?auto_109733 ?auto_109734 ?auto_109735 ?auto_109736 ?auto_109737 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109740 - BLOCK
      ?auto_109741 - BLOCK
      ?auto_109742 - BLOCK
      ?auto_109743 - BLOCK
      ?auto_109744 - BLOCK
      ?auto_109745 - BLOCK
    )
    :vars
    (
      ?auto_109746 - BLOCK
      ?auto_109747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109740 ?auto_109741 ) ) ( not ( = ?auto_109740 ?auto_109742 ) ) ( not ( = ?auto_109740 ?auto_109743 ) ) ( not ( = ?auto_109740 ?auto_109744 ) ) ( not ( = ?auto_109740 ?auto_109745 ) ) ( not ( = ?auto_109741 ?auto_109742 ) ) ( not ( = ?auto_109741 ?auto_109743 ) ) ( not ( = ?auto_109741 ?auto_109744 ) ) ( not ( = ?auto_109741 ?auto_109745 ) ) ( not ( = ?auto_109742 ?auto_109743 ) ) ( not ( = ?auto_109742 ?auto_109744 ) ) ( not ( = ?auto_109742 ?auto_109745 ) ) ( not ( = ?auto_109743 ?auto_109744 ) ) ( not ( = ?auto_109743 ?auto_109745 ) ) ( not ( = ?auto_109744 ?auto_109745 ) ) ( not ( = ?auto_109740 ?auto_109746 ) ) ( not ( = ?auto_109741 ?auto_109746 ) ) ( not ( = ?auto_109742 ?auto_109746 ) ) ( not ( = ?auto_109743 ?auto_109746 ) ) ( not ( = ?auto_109744 ?auto_109746 ) ) ( not ( = ?auto_109745 ?auto_109746 ) ) ( ON-TABLE ?auto_109746 ) ( ON ?auto_109740 ?auto_109747 ) ( not ( = ?auto_109740 ?auto_109747 ) ) ( not ( = ?auto_109741 ?auto_109747 ) ) ( not ( = ?auto_109742 ?auto_109747 ) ) ( not ( = ?auto_109743 ?auto_109747 ) ) ( not ( = ?auto_109744 ?auto_109747 ) ) ( not ( = ?auto_109745 ?auto_109747 ) ) ( not ( = ?auto_109746 ?auto_109747 ) ) ( ON ?auto_109741 ?auto_109740 ) ( ON-TABLE ?auto_109747 ) ( ON ?auto_109742 ?auto_109741 ) ( ON ?auto_109743 ?auto_109742 ) ( ON ?auto_109744 ?auto_109743 ) ( CLEAR ?auto_109744 ) ( HOLDING ?auto_109745 ) ( CLEAR ?auto_109746 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109746 ?auto_109745 )
      ( MAKE-6PILE ?auto_109740 ?auto_109741 ?auto_109742 ?auto_109743 ?auto_109744 ?auto_109745 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109748 - BLOCK
      ?auto_109749 - BLOCK
      ?auto_109750 - BLOCK
      ?auto_109751 - BLOCK
      ?auto_109752 - BLOCK
      ?auto_109753 - BLOCK
    )
    :vars
    (
      ?auto_109754 - BLOCK
      ?auto_109755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109748 ?auto_109749 ) ) ( not ( = ?auto_109748 ?auto_109750 ) ) ( not ( = ?auto_109748 ?auto_109751 ) ) ( not ( = ?auto_109748 ?auto_109752 ) ) ( not ( = ?auto_109748 ?auto_109753 ) ) ( not ( = ?auto_109749 ?auto_109750 ) ) ( not ( = ?auto_109749 ?auto_109751 ) ) ( not ( = ?auto_109749 ?auto_109752 ) ) ( not ( = ?auto_109749 ?auto_109753 ) ) ( not ( = ?auto_109750 ?auto_109751 ) ) ( not ( = ?auto_109750 ?auto_109752 ) ) ( not ( = ?auto_109750 ?auto_109753 ) ) ( not ( = ?auto_109751 ?auto_109752 ) ) ( not ( = ?auto_109751 ?auto_109753 ) ) ( not ( = ?auto_109752 ?auto_109753 ) ) ( not ( = ?auto_109748 ?auto_109754 ) ) ( not ( = ?auto_109749 ?auto_109754 ) ) ( not ( = ?auto_109750 ?auto_109754 ) ) ( not ( = ?auto_109751 ?auto_109754 ) ) ( not ( = ?auto_109752 ?auto_109754 ) ) ( not ( = ?auto_109753 ?auto_109754 ) ) ( ON-TABLE ?auto_109754 ) ( ON ?auto_109748 ?auto_109755 ) ( not ( = ?auto_109748 ?auto_109755 ) ) ( not ( = ?auto_109749 ?auto_109755 ) ) ( not ( = ?auto_109750 ?auto_109755 ) ) ( not ( = ?auto_109751 ?auto_109755 ) ) ( not ( = ?auto_109752 ?auto_109755 ) ) ( not ( = ?auto_109753 ?auto_109755 ) ) ( not ( = ?auto_109754 ?auto_109755 ) ) ( ON ?auto_109749 ?auto_109748 ) ( ON-TABLE ?auto_109755 ) ( ON ?auto_109750 ?auto_109749 ) ( ON ?auto_109751 ?auto_109750 ) ( ON ?auto_109752 ?auto_109751 ) ( CLEAR ?auto_109754 ) ( ON ?auto_109753 ?auto_109752 ) ( CLEAR ?auto_109753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109755 ?auto_109748 ?auto_109749 ?auto_109750 ?auto_109751 ?auto_109752 )
      ( MAKE-6PILE ?auto_109748 ?auto_109749 ?auto_109750 ?auto_109751 ?auto_109752 ?auto_109753 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109756 - BLOCK
      ?auto_109757 - BLOCK
      ?auto_109758 - BLOCK
      ?auto_109759 - BLOCK
      ?auto_109760 - BLOCK
      ?auto_109761 - BLOCK
    )
    :vars
    (
      ?auto_109762 - BLOCK
      ?auto_109763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109756 ?auto_109757 ) ) ( not ( = ?auto_109756 ?auto_109758 ) ) ( not ( = ?auto_109756 ?auto_109759 ) ) ( not ( = ?auto_109756 ?auto_109760 ) ) ( not ( = ?auto_109756 ?auto_109761 ) ) ( not ( = ?auto_109757 ?auto_109758 ) ) ( not ( = ?auto_109757 ?auto_109759 ) ) ( not ( = ?auto_109757 ?auto_109760 ) ) ( not ( = ?auto_109757 ?auto_109761 ) ) ( not ( = ?auto_109758 ?auto_109759 ) ) ( not ( = ?auto_109758 ?auto_109760 ) ) ( not ( = ?auto_109758 ?auto_109761 ) ) ( not ( = ?auto_109759 ?auto_109760 ) ) ( not ( = ?auto_109759 ?auto_109761 ) ) ( not ( = ?auto_109760 ?auto_109761 ) ) ( not ( = ?auto_109756 ?auto_109762 ) ) ( not ( = ?auto_109757 ?auto_109762 ) ) ( not ( = ?auto_109758 ?auto_109762 ) ) ( not ( = ?auto_109759 ?auto_109762 ) ) ( not ( = ?auto_109760 ?auto_109762 ) ) ( not ( = ?auto_109761 ?auto_109762 ) ) ( ON ?auto_109756 ?auto_109763 ) ( not ( = ?auto_109756 ?auto_109763 ) ) ( not ( = ?auto_109757 ?auto_109763 ) ) ( not ( = ?auto_109758 ?auto_109763 ) ) ( not ( = ?auto_109759 ?auto_109763 ) ) ( not ( = ?auto_109760 ?auto_109763 ) ) ( not ( = ?auto_109761 ?auto_109763 ) ) ( not ( = ?auto_109762 ?auto_109763 ) ) ( ON ?auto_109757 ?auto_109756 ) ( ON-TABLE ?auto_109763 ) ( ON ?auto_109758 ?auto_109757 ) ( ON ?auto_109759 ?auto_109758 ) ( ON ?auto_109760 ?auto_109759 ) ( ON ?auto_109761 ?auto_109760 ) ( CLEAR ?auto_109761 ) ( HOLDING ?auto_109762 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109762 )
      ( MAKE-6PILE ?auto_109756 ?auto_109757 ?auto_109758 ?auto_109759 ?auto_109760 ?auto_109761 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_109764 - BLOCK
      ?auto_109765 - BLOCK
      ?auto_109766 - BLOCK
      ?auto_109767 - BLOCK
      ?auto_109768 - BLOCK
      ?auto_109769 - BLOCK
    )
    :vars
    (
      ?auto_109770 - BLOCK
      ?auto_109771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109764 ?auto_109765 ) ) ( not ( = ?auto_109764 ?auto_109766 ) ) ( not ( = ?auto_109764 ?auto_109767 ) ) ( not ( = ?auto_109764 ?auto_109768 ) ) ( not ( = ?auto_109764 ?auto_109769 ) ) ( not ( = ?auto_109765 ?auto_109766 ) ) ( not ( = ?auto_109765 ?auto_109767 ) ) ( not ( = ?auto_109765 ?auto_109768 ) ) ( not ( = ?auto_109765 ?auto_109769 ) ) ( not ( = ?auto_109766 ?auto_109767 ) ) ( not ( = ?auto_109766 ?auto_109768 ) ) ( not ( = ?auto_109766 ?auto_109769 ) ) ( not ( = ?auto_109767 ?auto_109768 ) ) ( not ( = ?auto_109767 ?auto_109769 ) ) ( not ( = ?auto_109768 ?auto_109769 ) ) ( not ( = ?auto_109764 ?auto_109770 ) ) ( not ( = ?auto_109765 ?auto_109770 ) ) ( not ( = ?auto_109766 ?auto_109770 ) ) ( not ( = ?auto_109767 ?auto_109770 ) ) ( not ( = ?auto_109768 ?auto_109770 ) ) ( not ( = ?auto_109769 ?auto_109770 ) ) ( ON ?auto_109764 ?auto_109771 ) ( not ( = ?auto_109764 ?auto_109771 ) ) ( not ( = ?auto_109765 ?auto_109771 ) ) ( not ( = ?auto_109766 ?auto_109771 ) ) ( not ( = ?auto_109767 ?auto_109771 ) ) ( not ( = ?auto_109768 ?auto_109771 ) ) ( not ( = ?auto_109769 ?auto_109771 ) ) ( not ( = ?auto_109770 ?auto_109771 ) ) ( ON ?auto_109765 ?auto_109764 ) ( ON-TABLE ?auto_109771 ) ( ON ?auto_109766 ?auto_109765 ) ( ON ?auto_109767 ?auto_109766 ) ( ON ?auto_109768 ?auto_109767 ) ( ON ?auto_109769 ?auto_109768 ) ( ON ?auto_109770 ?auto_109769 ) ( CLEAR ?auto_109770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109771 ?auto_109764 ?auto_109765 ?auto_109766 ?auto_109767 ?auto_109768 ?auto_109769 )
      ( MAKE-6PILE ?auto_109764 ?auto_109765 ?auto_109766 ?auto_109767 ?auto_109768 ?auto_109769 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109779 - BLOCK
      ?auto_109780 - BLOCK
      ?auto_109781 - BLOCK
      ?auto_109782 - BLOCK
      ?auto_109783 - BLOCK
      ?auto_109784 - BLOCK
      ?auto_109785 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_109785 ) ( CLEAR ?auto_109784 ) ( ON-TABLE ?auto_109779 ) ( ON ?auto_109780 ?auto_109779 ) ( ON ?auto_109781 ?auto_109780 ) ( ON ?auto_109782 ?auto_109781 ) ( ON ?auto_109783 ?auto_109782 ) ( ON ?auto_109784 ?auto_109783 ) ( not ( = ?auto_109779 ?auto_109780 ) ) ( not ( = ?auto_109779 ?auto_109781 ) ) ( not ( = ?auto_109779 ?auto_109782 ) ) ( not ( = ?auto_109779 ?auto_109783 ) ) ( not ( = ?auto_109779 ?auto_109784 ) ) ( not ( = ?auto_109779 ?auto_109785 ) ) ( not ( = ?auto_109780 ?auto_109781 ) ) ( not ( = ?auto_109780 ?auto_109782 ) ) ( not ( = ?auto_109780 ?auto_109783 ) ) ( not ( = ?auto_109780 ?auto_109784 ) ) ( not ( = ?auto_109780 ?auto_109785 ) ) ( not ( = ?auto_109781 ?auto_109782 ) ) ( not ( = ?auto_109781 ?auto_109783 ) ) ( not ( = ?auto_109781 ?auto_109784 ) ) ( not ( = ?auto_109781 ?auto_109785 ) ) ( not ( = ?auto_109782 ?auto_109783 ) ) ( not ( = ?auto_109782 ?auto_109784 ) ) ( not ( = ?auto_109782 ?auto_109785 ) ) ( not ( = ?auto_109783 ?auto_109784 ) ) ( not ( = ?auto_109783 ?auto_109785 ) ) ( not ( = ?auto_109784 ?auto_109785 ) ) )
    :subtasks
    ( ( !STACK ?auto_109785 ?auto_109784 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109786 - BLOCK
      ?auto_109787 - BLOCK
      ?auto_109788 - BLOCK
      ?auto_109789 - BLOCK
      ?auto_109790 - BLOCK
      ?auto_109791 - BLOCK
      ?auto_109792 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_109791 ) ( ON-TABLE ?auto_109786 ) ( ON ?auto_109787 ?auto_109786 ) ( ON ?auto_109788 ?auto_109787 ) ( ON ?auto_109789 ?auto_109788 ) ( ON ?auto_109790 ?auto_109789 ) ( ON ?auto_109791 ?auto_109790 ) ( not ( = ?auto_109786 ?auto_109787 ) ) ( not ( = ?auto_109786 ?auto_109788 ) ) ( not ( = ?auto_109786 ?auto_109789 ) ) ( not ( = ?auto_109786 ?auto_109790 ) ) ( not ( = ?auto_109786 ?auto_109791 ) ) ( not ( = ?auto_109786 ?auto_109792 ) ) ( not ( = ?auto_109787 ?auto_109788 ) ) ( not ( = ?auto_109787 ?auto_109789 ) ) ( not ( = ?auto_109787 ?auto_109790 ) ) ( not ( = ?auto_109787 ?auto_109791 ) ) ( not ( = ?auto_109787 ?auto_109792 ) ) ( not ( = ?auto_109788 ?auto_109789 ) ) ( not ( = ?auto_109788 ?auto_109790 ) ) ( not ( = ?auto_109788 ?auto_109791 ) ) ( not ( = ?auto_109788 ?auto_109792 ) ) ( not ( = ?auto_109789 ?auto_109790 ) ) ( not ( = ?auto_109789 ?auto_109791 ) ) ( not ( = ?auto_109789 ?auto_109792 ) ) ( not ( = ?auto_109790 ?auto_109791 ) ) ( not ( = ?auto_109790 ?auto_109792 ) ) ( not ( = ?auto_109791 ?auto_109792 ) ) ( ON-TABLE ?auto_109792 ) ( CLEAR ?auto_109792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_109792 )
      ( MAKE-7PILE ?auto_109786 ?auto_109787 ?auto_109788 ?auto_109789 ?auto_109790 ?auto_109791 ?auto_109792 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109793 - BLOCK
      ?auto_109794 - BLOCK
      ?auto_109795 - BLOCK
      ?auto_109796 - BLOCK
      ?auto_109797 - BLOCK
      ?auto_109798 - BLOCK
      ?auto_109799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109793 ) ( ON ?auto_109794 ?auto_109793 ) ( ON ?auto_109795 ?auto_109794 ) ( ON ?auto_109796 ?auto_109795 ) ( ON ?auto_109797 ?auto_109796 ) ( not ( = ?auto_109793 ?auto_109794 ) ) ( not ( = ?auto_109793 ?auto_109795 ) ) ( not ( = ?auto_109793 ?auto_109796 ) ) ( not ( = ?auto_109793 ?auto_109797 ) ) ( not ( = ?auto_109793 ?auto_109798 ) ) ( not ( = ?auto_109793 ?auto_109799 ) ) ( not ( = ?auto_109794 ?auto_109795 ) ) ( not ( = ?auto_109794 ?auto_109796 ) ) ( not ( = ?auto_109794 ?auto_109797 ) ) ( not ( = ?auto_109794 ?auto_109798 ) ) ( not ( = ?auto_109794 ?auto_109799 ) ) ( not ( = ?auto_109795 ?auto_109796 ) ) ( not ( = ?auto_109795 ?auto_109797 ) ) ( not ( = ?auto_109795 ?auto_109798 ) ) ( not ( = ?auto_109795 ?auto_109799 ) ) ( not ( = ?auto_109796 ?auto_109797 ) ) ( not ( = ?auto_109796 ?auto_109798 ) ) ( not ( = ?auto_109796 ?auto_109799 ) ) ( not ( = ?auto_109797 ?auto_109798 ) ) ( not ( = ?auto_109797 ?auto_109799 ) ) ( not ( = ?auto_109798 ?auto_109799 ) ) ( ON-TABLE ?auto_109799 ) ( CLEAR ?auto_109799 ) ( HOLDING ?auto_109798 ) ( CLEAR ?auto_109797 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109793 ?auto_109794 ?auto_109795 ?auto_109796 ?auto_109797 ?auto_109798 )
      ( MAKE-7PILE ?auto_109793 ?auto_109794 ?auto_109795 ?auto_109796 ?auto_109797 ?auto_109798 ?auto_109799 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109800 - BLOCK
      ?auto_109801 - BLOCK
      ?auto_109802 - BLOCK
      ?auto_109803 - BLOCK
      ?auto_109804 - BLOCK
      ?auto_109805 - BLOCK
      ?auto_109806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109800 ) ( ON ?auto_109801 ?auto_109800 ) ( ON ?auto_109802 ?auto_109801 ) ( ON ?auto_109803 ?auto_109802 ) ( ON ?auto_109804 ?auto_109803 ) ( not ( = ?auto_109800 ?auto_109801 ) ) ( not ( = ?auto_109800 ?auto_109802 ) ) ( not ( = ?auto_109800 ?auto_109803 ) ) ( not ( = ?auto_109800 ?auto_109804 ) ) ( not ( = ?auto_109800 ?auto_109805 ) ) ( not ( = ?auto_109800 ?auto_109806 ) ) ( not ( = ?auto_109801 ?auto_109802 ) ) ( not ( = ?auto_109801 ?auto_109803 ) ) ( not ( = ?auto_109801 ?auto_109804 ) ) ( not ( = ?auto_109801 ?auto_109805 ) ) ( not ( = ?auto_109801 ?auto_109806 ) ) ( not ( = ?auto_109802 ?auto_109803 ) ) ( not ( = ?auto_109802 ?auto_109804 ) ) ( not ( = ?auto_109802 ?auto_109805 ) ) ( not ( = ?auto_109802 ?auto_109806 ) ) ( not ( = ?auto_109803 ?auto_109804 ) ) ( not ( = ?auto_109803 ?auto_109805 ) ) ( not ( = ?auto_109803 ?auto_109806 ) ) ( not ( = ?auto_109804 ?auto_109805 ) ) ( not ( = ?auto_109804 ?auto_109806 ) ) ( not ( = ?auto_109805 ?auto_109806 ) ) ( ON-TABLE ?auto_109806 ) ( CLEAR ?auto_109804 ) ( ON ?auto_109805 ?auto_109806 ) ( CLEAR ?auto_109805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109806 )
      ( MAKE-7PILE ?auto_109800 ?auto_109801 ?auto_109802 ?auto_109803 ?auto_109804 ?auto_109805 ?auto_109806 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109807 - BLOCK
      ?auto_109808 - BLOCK
      ?auto_109809 - BLOCK
      ?auto_109810 - BLOCK
      ?auto_109811 - BLOCK
      ?auto_109812 - BLOCK
      ?auto_109813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109807 ) ( ON ?auto_109808 ?auto_109807 ) ( ON ?auto_109809 ?auto_109808 ) ( ON ?auto_109810 ?auto_109809 ) ( not ( = ?auto_109807 ?auto_109808 ) ) ( not ( = ?auto_109807 ?auto_109809 ) ) ( not ( = ?auto_109807 ?auto_109810 ) ) ( not ( = ?auto_109807 ?auto_109811 ) ) ( not ( = ?auto_109807 ?auto_109812 ) ) ( not ( = ?auto_109807 ?auto_109813 ) ) ( not ( = ?auto_109808 ?auto_109809 ) ) ( not ( = ?auto_109808 ?auto_109810 ) ) ( not ( = ?auto_109808 ?auto_109811 ) ) ( not ( = ?auto_109808 ?auto_109812 ) ) ( not ( = ?auto_109808 ?auto_109813 ) ) ( not ( = ?auto_109809 ?auto_109810 ) ) ( not ( = ?auto_109809 ?auto_109811 ) ) ( not ( = ?auto_109809 ?auto_109812 ) ) ( not ( = ?auto_109809 ?auto_109813 ) ) ( not ( = ?auto_109810 ?auto_109811 ) ) ( not ( = ?auto_109810 ?auto_109812 ) ) ( not ( = ?auto_109810 ?auto_109813 ) ) ( not ( = ?auto_109811 ?auto_109812 ) ) ( not ( = ?auto_109811 ?auto_109813 ) ) ( not ( = ?auto_109812 ?auto_109813 ) ) ( ON-TABLE ?auto_109813 ) ( ON ?auto_109812 ?auto_109813 ) ( CLEAR ?auto_109812 ) ( HOLDING ?auto_109811 ) ( CLEAR ?auto_109810 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109807 ?auto_109808 ?auto_109809 ?auto_109810 ?auto_109811 )
      ( MAKE-7PILE ?auto_109807 ?auto_109808 ?auto_109809 ?auto_109810 ?auto_109811 ?auto_109812 ?auto_109813 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109814 - BLOCK
      ?auto_109815 - BLOCK
      ?auto_109816 - BLOCK
      ?auto_109817 - BLOCK
      ?auto_109818 - BLOCK
      ?auto_109819 - BLOCK
      ?auto_109820 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109814 ) ( ON ?auto_109815 ?auto_109814 ) ( ON ?auto_109816 ?auto_109815 ) ( ON ?auto_109817 ?auto_109816 ) ( not ( = ?auto_109814 ?auto_109815 ) ) ( not ( = ?auto_109814 ?auto_109816 ) ) ( not ( = ?auto_109814 ?auto_109817 ) ) ( not ( = ?auto_109814 ?auto_109818 ) ) ( not ( = ?auto_109814 ?auto_109819 ) ) ( not ( = ?auto_109814 ?auto_109820 ) ) ( not ( = ?auto_109815 ?auto_109816 ) ) ( not ( = ?auto_109815 ?auto_109817 ) ) ( not ( = ?auto_109815 ?auto_109818 ) ) ( not ( = ?auto_109815 ?auto_109819 ) ) ( not ( = ?auto_109815 ?auto_109820 ) ) ( not ( = ?auto_109816 ?auto_109817 ) ) ( not ( = ?auto_109816 ?auto_109818 ) ) ( not ( = ?auto_109816 ?auto_109819 ) ) ( not ( = ?auto_109816 ?auto_109820 ) ) ( not ( = ?auto_109817 ?auto_109818 ) ) ( not ( = ?auto_109817 ?auto_109819 ) ) ( not ( = ?auto_109817 ?auto_109820 ) ) ( not ( = ?auto_109818 ?auto_109819 ) ) ( not ( = ?auto_109818 ?auto_109820 ) ) ( not ( = ?auto_109819 ?auto_109820 ) ) ( ON-TABLE ?auto_109820 ) ( ON ?auto_109819 ?auto_109820 ) ( CLEAR ?auto_109817 ) ( ON ?auto_109818 ?auto_109819 ) ( CLEAR ?auto_109818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109820 ?auto_109819 )
      ( MAKE-7PILE ?auto_109814 ?auto_109815 ?auto_109816 ?auto_109817 ?auto_109818 ?auto_109819 ?auto_109820 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109821 - BLOCK
      ?auto_109822 - BLOCK
      ?auto_109823 - BLOCK
      ?auto_109824 - BLOCK
      ?auto_109825 - BLOCK
      ?auto_109826 - BLOCK
      ?auto_109827 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109821 ) ( ON ?auto_109822 ?auto_109821 ) ( ON ?auto_109823 ?auto_109822 ) ( not ( = ?auto_109821 ?auto_109822 ) ) ( not ( = ?auto_109821 ?auto_109823 ) ) ( not ( = ?auto_109821 ?auto_109824 ) ) ( not ( = ?auto_109821 ?auto_109825 ) ) ( not ( = ?auto_109821 ?auto_109826 ) ) ( not ( = ?auto_109821 ?auto_109827 ) ) ( not ( = ?auto_109822 ?auto_109823 ) ) ( not ( = ?auto_109822 ?auto_109824 ) ) ( not ( = ?auto_109822 ?auto_109825 ) ) ( not ( = ?auto_109822 ?auto_109826 ) ) ( not ( = ?auto_109822 ?auto_109827 ) ) ( not ( = ?auto_109823 ?auto_109824 ) ) ( not ( = ?auto_109823 ?auto_109825 ) ) ( not ( = ?auto_109823 ?auto_109826 ) ) ( not ( = ?auto_109823 ?auto_109827 ) ) ( not ( = ?auto_109824 ?auto_109825 ) ) ( not ( = ?auto_109824 ?auto_109826 ) ) ( not ( = ?auto_109824 ?auto_109827 ) ) ( not ( = ?auto_109825 ?auto_109826 ) ) ( not ( = ?auto_109825 ?auto_109827 ) ) ( not ( = ?auto_109826 ?auto_109827 ) ) ( ON-TABLE ?auto_109827 ) ( ON ?auto_109826 ?auto_109827 ) ( ON ?auto_109825 ?auto_109826 ) ( CLEAR ?auto_109825 ) ( HOLDING ?auto_109824 ) ( CLEAR ?auto_109823 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109821 ?auto_109822 ?auto_109823 ?auto_109824 )
      ( MAKE-7PILE ?auto_109821 ?auto_109822 ?auto_109823 ?auto_109824 ?auto_109825 ?auto_109826 ?auto_109827 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109828 - BLOCK
      ?auto_109829 - BLOCK
      ?auto_109830 - BLOCK
      ?auto_109831 - BLOCK
      ?auto_109832 - BLOCK
      ?auto_109833 - BLOCK
      ?auto_109834 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109828 ) ( ON ?auto_109829 ?auto_109828 ) ( ON ?auto_109830 ?auto_109829 ) ( not ( = ?auto_109828 ?auto_109829 ) ) ( not ( = ?auto_109828 ?auto_109830 ) ) ( not ( = ?auto_109828 ?auto_109831 ) ) ( not ( = ?auto_109828 ?auto_109832 ) ) ( not ( = ?auto_109828 ?auto_109833 ) ) ( not ( = ?auto_109828 ?auto_109834 ) ) ( not ( = ?auto_109829 ?auto_109830 ) ) ( not ( = ?auto_109829 ?auto_109831 ) ) ( not ( = ?auto_109829 ?auto_109832 ) ) ( not ( = ?auto_109829 ?auto_109833 ) ) ( not ( = ?auto_109829 ?auto_109834 ) ) ( not ( = ?auto_109830 ?auto_109831 ) ) ( not ( = ?auto_109830 ?auto_109832 ) ) ( not ( = ?auto_109830 ?auto_109833 ) ) ( not ( = ?auto_109830 ?auto_109834 ) ) ( not ( = ?auto_109831 ?auto_109832 ) ) ( not ( = ?auto_109831 ?auto_109833 ) ) ( not ( = ?auto_109831 ?auto_109834 ) ) ( not ( = ?auto_109832 ?auto_109833 ) ) ( not ( = ?auto_109832 ?auto_109834 ) ) ( not ( = ?auto_109833 ?auto_109834 ) ) ( ON-TABLE ?auto_109834 ) ( ON ?auto_109833 ?auto_109834 ) ( ON ?auto_109832 ?auto_109833 ) ( CLEAR ?auto_109830 ) ( ON ?auto_109831 ?auto_109832 ) ( CLEAR ?auto_109831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109834 ?auto_109833 ?auto_109832 )
      ( MAKE-7PILE ?auto_109828 ?auto_109829 ?auto_109830 ?auto_109831 ?auto_109832 ?auto_109833 ?auto_109834 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109835 - BLOCK
      ?auto_109836 - BLOCK
      ?auto_109837 - BLOCK
      ?auto_109838 - BLOCK
      ?auto_109839 - BLOCK
      ?auto_109840 - BLOCK
      ?auto_109841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109835 ) ( ON ?auto_109836 ?auto_109835 ) ( not ( = ?auto_109835 ?auto_109836 ) ) ( not ( = ?auto_109835 ?auto_109837 ) ) ( not ( = ?auto_109835 ?auto_109838 ) ) ( not ( = ?auto_109835 ?auto_109839 ) ) ( not ( = ?auto_109835 ?auto_109840 ) ) ( not ( = ?auto_109835 ?auto_109841 ) ) ( not ( = ?auto_109836 ?auto_109837 ) ) ( not ( = ?auto_109836 ?auto_109838 ) ) ( not ( = ?auto_109836 ?auto_109839 ) ) ( not ( = ?auto_109836 ?auto_109840 ) ) ( not ( = ?auto_109836 ?auto_109841 ) ) ( not ( = ?auto_109837 ?auto_109838 ) ) ( not ( = ?auto_109837 ?auto_109839 ) ) ( not ( = ?auto_109837 ?auto_109840 ) ) ( not ( = ?auto_109837 ?auto_109841 ) ) ( not ( = ?auto_109838 ?auto_109839 ) ) ( not ( = ?auto_109838 ?auto_109840 ) ) ( not ( = ?auto_109838 ?auto_109841 ) ) ( not ( = ?auto_109839 ?auto_109840 ) ) ( not ( = ?auto_109839 ?auto_109841 ) ) ( not ( = ?auto_109840 ?auto_109841 ) ) ( ON-TABLE ?auto_109841 ) ( ON ?auto_109840 ?auto_109841 ) ( ON ?auto_109839 ?auto_109840 ) ( ON ?auto_109838 ?auto_109839 ) ( CLEAR ?auto_109838 ) ( HOLDING ?auto_109837 ) ( CLEAR ?auto_109836 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109835 ?auto_109836 ?auto_109837 )
      ( MAKE-7PILE ?auto_109835 ?auto_109836 ?auto_109837 ?auto_109838 ?auto_109839 ?auto_109840 ?auto_109841 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109842 - BLOCK
      ?auto_109843 - BLOCK
      ?auto_109844 - BLOCK
      ?auto_109845 - BLOCK
      ?auto_109846 - BLOCK
      ?auto_109847 - BLOCK
      ?auto_109848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109842 ) ( ON ?auto_109843 ?auto_109842 ) ( not ( = ?auto_109842 ?auto_109843 ) ) ( not ( = ?auto_109842 ?auto_109844 ) ) ( not ( = ?auto_109842 ?auto_109845 ) ) ( not ( = ?auto_109842 ?auto_109846 ) ) ( not ( = ?auto_109842 ?auto_109847 ) ) ( not ( = ?auto_109842 ?auto_109848 ) ) ( not ( = ?auto_109843 ?auto_109844 ) ) ( not ( = ?auto_109843 ?auto_109845 ) ) ( not ( = ?auto_109843 ?auto_109846 ) ) ( not ( = ?auto_109843 ?auto_109847 ) ) ( not ( = ?auto_109843 ?auto_109848 ) ) ( not ( = ?auto_109844 ?auto_109845 ) ) ( not ( = ?auto_109844 ?auto_109846 ) ) ( not ( = ?auto_109844 ?auto_109847 ) ) ( not ( = ?auto_109844 ?auto_109848 ) ) ( not ( = ?auto_109845 ?auto_109846 ) ) ( not ( = ?auto_109845 ?auto_109847 ) ) ( not ( = ?auto_109845 ?auto_109848 ) ) ( not ( = ?auto_109846 ?auto_109847 ) ) ( not ( = ?auto_109846 ?auto_109848 ) ) ( not ( = ?auto_109847 ?auto_109848 ) ) ( ON-TABLE ?auto_109848 ) ( ON ?auto_109847 ?auto_109848 ) ( ON ?auto_109846 ?auto_109847 ) ( ON ?auto_109845 ?auto_109846 ) ( CLEAR ?auto_109843 ) ( ON ?auto_109844 ?auto_109845 ) ( CLEAR ?auto_109844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109848 ?auto_109847 ?auto_109846 ?auto_109845 )
      ( MAKE-7PILE ?auto_109842 ?auto_109843 ?auto_109844 ?auto_109845 ?auto_109846 ?auto_109847 ?auto_109848 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109849 - BLOCK
      ?auto_109850 - BLOCK
      ?auto_109851 - BLOCK
      ?auto_109852 - BLOCK
      ?auto_109853 - BLOCK
      ?auto_109854 - BLOCK
      ?auto_109855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109849 ) ( not ( = ?auto_109849 ?auto_109850 ) ) ( not ( = ?auto_109849 ?auto_109851 ) ) ( not ( = ?auto_109849 ?auto_109852 ) ) ( not ( = ?auto_109849 ?auto_109853 ) ) ( not ( = ?auto_109849 ?auto_109854 ) ) ( not ( = ?auto_109849 ?auto_109855 ) ) ( not ( = ?auto_109850 ?auto_109851 ) ) ( not ( = ?auto_109850 ?auto_109852 ) ) ( not ( = ?auto_109850 ?auto_109853 ) ) ( not ( = ?auto_109850 ?auto_109854 ) ) ( not ( = ?auto_109850 ?auto_109855 ) ) ( not ( = ?auto_109851 ?auto_109852 ) ) ( not ( = ?auto_109851 ?auto_109853 ) ) ( not ( = ?auto_109851 ?auto_109854 ) ) ( not ( = ?auto_109851 ?auto_109855 ) ) ( not ( = ?auto_109852 ?auto_109853 ) ) ( not ( = ?auto_109852 ?auto_109854 ) ) ( not ( = ?auto_109852 ?auto_109855 ) ) ( not ( = ?auto_109853 ?auto_109854 ) ) ( not ( = ?auto_109853 ?auto_109855 ) ) ( not ( = ?auto_109854 ?auto_109855 ) ) ( ON-TABLE ?auto_109855 ) ( ON ?auto_109854 ?auto_109855 ) ( ON ?auto_109853 ?auto_109854 ) ( ON ?auto_109852 ?auto_109853 ) ( ON ?auto_109851 ?auto_109852 ) ( CLEAR ?auto_109851 ) ( HOLDING ?auto_109850 ) ( CLEAR ?auto_109849 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109849 ?auto_109850 )
      ( MAKE-7PILE ?auto_109849 ?auto_109850 ?auto_109851 ?auto_109852 ?auto_109853 ?auto_109854 ?auto_109855 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109856 - BLOCK
      ?auto_109857 - BLOCK
      ?auto_109858 - BLOCK
      ?auto_109859 - BLOCK
      ?auto_109860 - BLOCK
      ?auto_109861 - BLOCK
      ?auto_109862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_109856 ) ( not ( = ?auto_109856 ?auto_109857 ) ) ( not ( = ?auto_109856 ?auto_109858 ) ) ( not ( = ?auto_109856 ?auto_109859 ) ) ( not ( = ?auto_109856 ?auto_109860 ) ) ( not ( = ?auto_109856 ?auto_109861 ) ) ( not ( = ?auto_109856 ?auto_109862 ) ) ( not ( = ?auto_109857 ?auto_109858 ) ) ( not ( = ?auto_109857 ?auto_109859 ) ) ( not ( = ?auto_109857 ?auto_109860 ) ) ( not ( = ?auto_109857 ?auto_109861 ) ) ( not ( = ?auto_109857 ?auto_109862 ) ) ( not ( = ?auto_109858 ?auto_109859 ) ) ( not ( = ?auto_109858 ?auto_109860 ) ) ( not ( = ?auto_109858 ?auto_109861 ) ) ( not ( = ?auto_109858 ?auto_109862 ) ) ( not ( = ?auto_109859 ?auto_109860 ) ) ( not ( = ?auto_109859 ?auto_109861 ) ) ( not ( = ?auto_109859 ?auto_109862 ) ) ( not ( = ?auto_109860 ?auto_109861 ) ) ( not ( = ?auto_109860 ?auto_109862 ) ) ( not ( = ?auto_109861 ?auto_109862 ) ) ( ON-TABLE ?auto_109862 ) ( ON ?auto_109861 ?auto_109862 ) ( ON ?auto_109860 ?auto_109861 ) ( ON ?auto_109859 ?auto_109860 ) ( ON ?auto_109858 ?auto_109859 ) ( CLEAR ?auto_109856 ) ( ON ?auto_109857 ?auto_109858 ) ( CLEAR ?auto_109857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109862 ?auto_109861 ?auto_109860 ?auto_109859 ?auto_109858 )
      ( MAKE-7PILE ?auto_109856 ?auto_109857 ?auto_109858 ?auto_109859 ?auto_109860 ?auto_109861 ?auto_109862 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109863 - BLOCK
      ?auto_109864 - BLOCK
      ?auto_109865 - BLOCK
      ?auto_109866 - BLOCK
      ?auto_109867 - BLOCK
      ?auto_109868 - BLOCK
      ?auto_109869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109863 ?auto_109864 ) ) ( not ( = ?auto_109863 ?auto_109865 ) ) ( not ( = ?auto_109863 ?auto_109866 ) ) ( not ( = ?auto_109863 ?auto_109867 ) ) ( not ( = ?auto_109863 ?auto_109868 ) ) ( not ( = ?auto_109863 ?auto_109869 ) ) ( not ( = ?auto_109864 ?auto_109865 ) ) ( not ( = ?auto_109864 ?auto_109866 ) ) ( not ( = ?auto_109864 ?auto_109867 ) ) ( not ( = ?auto_109864 ?auto_109868 ) ) ( not ( = ?auto_109864 ?auto_109869 ) ) ( not ( = ?auto_109865 ?auto_109866 ) ) ( not ( = ?auto_109865 ?auto_109867 ) ) ( not ( = ?auto_109865 ?auto_109868 ) ) ( not ( = ?auto_109865 ?auto_109869 ) ) ( not ( = ?auto_109866 ?auto_109867 ) ) ( not ( = ?auto_109866 ?auto_109868 ) ) ( not ( = ?auto_109866 ?auto_109869 ) ) ( not ( = ?auto_109867 ?auto_109868 ) ) ( not ( = ?auto_109867 ?auto_109869 ) ) ( not ( = ?auto_109868 ?auto_109869 ) ) ( ON-TABLE ?auto_109869 ) ( ON ?auto_109868 ?auto_109869 ) ( ON ?auto_109867 ?auto_109868 ) ( ON ?auto_109866 ?auto_109867 ) ( ON ?auto_109865 ?auto_109866 ) ( ON ?auto_109864 ?auto_109865 ) ( CLEAR ?auto_109864 ) ( HOLDING ?auto_109863 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109863 )
      ( MAKE-7PILE ?auto_109863 ?auto_109864 ?auto_109865 ?auto_109866 ?auto_109867 ?auto_109868 ?auto_109869 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109870 - BLOCK
      ?auto_109871 - BLOCK
      ?auto_109872 - BLOCK
      ?auto_109873 - BLOCK
      ?auto_109874 - BLOCK
      ?auto_109875 - BLOCK
      ?auto_109876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109870 ?auto_109871 ) ) ( not ( = ?auto_109870 ?auto_109872 ) ) ( not ( = ?auto_109870 ?auto_109873 ) ) ( not ( = ?auto_109870 ?auto_109874 ) ) ( not ( = ?auto_109870 ?auto_109875 ) ) ( not ( = ?auto_109870 ?auto_109876 ) ) ( not ( = ?auto_109871 ?auto_109872 ) ) ( not ( = ?auto_109871 ?auto_109873 ) ) ( not ( = ?auto_109871 ?auto_109874 ) ) ( not ( = ?auto_109871 ?auto_109875 ) ) ( not ( = ?auto_109871 ?auto_109876 ) ) ( not ( = ?auto_109872 ?auto_109873 ) ) ( not ( = ?auto_109872 ?auto_109874 ) ) ( not ( = ?auto_109872 ?auto_109875 ) ) ( not ( = ?auto_109872 ?auto_109876 ) ) ( not ( = ?auto_109873 ?auto_109874 ) ) ( not ( = ?auto_109873 ?auto_109875 ) ) ( not ( = ?auto_109873 ?auto_109876 ) ) ( not ( = ?auto_109874 ?auto_109875 ) ) ( not ( = ?auto_109874 ?auto_109876 ) ) ( not ( = ?auto_109875 ?auto_109876 ) ) ( ON-TABLE ?auto_109876 ) ( ON ?auto_109875 ?auto_109876 ) ( ON ?auto_109874 ?auto_109875 ) ( ON ?auto_109873 ?auto_109874 ) ( ON ?auto_109872 ?auto_109873 ) ( ON ?auto_109871 ?auto_109872 ) ( ON ?auto_109870 ?auto_109871 ) ( CLEAR ?auto_109870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109876 ?auto_109875 ?auto_109874 ?auto_109873 ?auto_109872 ?auto_109871 )
      ( MAKE-7PILE ?auto_109870 ?auto_109871 ?auto_109872 ?auto_109873 ?auto_109874 ?auto_109875 ?auto_109876 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109877 - BLOCK
      ?auto_109878 - BLOCK
      ?auto_109879 - BLOCK
      ?auto_109880 - BLOCK
      ?auto_109881 - BLOCK
      ?auto_109882 - BLOCK
      ?auto_109883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109877 ?auto_109878 ) ) ( not ( = ?auto_109877 ?auto_109879 ) ) ( not ( = ?auto_109877 ?auto_109880 ) ) ( not ( = ?auto_109877 ?auto_109881 ) ) ( not ( = ?auto_109877 ?auto_109882 ) ) ( not ( = ?auto_109877 ?auto_109883 ) ) ( not ( = ?auto_109878 ?auto_109879 ) ) ( not ( = ?auto_109878 ?auto_109880 ) ) ( not ( = ?auto_109878 ?auto_109881 ) ) ( not ( = ?auto_109878 ?auto_109882 ) ) ( not ( = ?auto_109878 ?auto_109883 ) ) ( not ( = ?auto_109879 ?auto_109880 ) ) ( not ( = ?auto_109879 ?auto_109881 ) ) ( not ( = ?auto_109879 ?auto_109882 ) ) ( not ( = ?auto_109879 ?auto_109883 ) ) ( not ( = ?auto_109880 ?auto_109881 ) ) ( not ( = ?auto_109880 ?auto_109882 ) ) ( not ( = ?auto_109880 ?auto_109883 ) ) ( not ( = ?auto_109881 ?auto_109882 ) ) ( not ( = ?auto_109881 ?auto_109883 ) ) ( not ( = ?auto_109882 ?auto_109883 ) ) ( ON-TABLE ?auto_109883 ) ( ON ?auto_109882 ?auto_109883 ) ( ON ?auto_109881 ?auto_109882 ) ( ON ?auto_109880 ?auto_109881 ) ( ON ?auto_109879 ?auto_109880 ) ( ON ?auto_109878 ?auto_109879 ) ( HOLDING ?auto_109877 ) ( CLEAR ?auto_109878 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109883 ?auto_109882 ?auto_109881 ?auto_109880 ?auto_109879 ?auto_109878 ?auto_109877 )
      ( MAKE-7PILE ?auto_109877 ?auto_109878 ?auto_109879 ?auto_109880 ?auto_109881 ?auto_109882 ?auto_109883 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109884 - BLOCK
      ?auto_109885 - BLOCK
      ?auto_109886 - BLOCK
      ?auto_109887 - BLOCK
      ?auto_109888 - BLOCK
      ?auto_109889 - BLOCK
      ?auto_109890 - BLOCK
    )
    :vars
    (
      ?auto_109891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109884 ?auto_109885 ) ) ( not ( = ?auto_109884 ?auto_109886 ) ) ( not ( = ?auto_109884 ?auto_109887 ) ) ( not ( = ?auto_109884 ?auto_109888 ) ) ( not ( = ?auto_109884 ?auto_109889 ) ) ( not ( = ?auto_109884 ?auto_109890 ) ) ( not ( = ?auto_109885 ?auto_109886 ) ) ( not ( = ?auto_109885 ?auto_109887 ) ) ( not ( = ?auto_109885 ?auto_109888 ) ) ( not ( = ?auto_109885 ?auto_109889 ) ) ( not ( = ?auto_109885 ?auto_109890 ) ) ( not ( = ?auto_109886 ?auto_109887 ) ) ( not ( = ?auto_109886 ?auto_109888 ) ) ( not ( = ?auto_109886 ?auto_109889 ) ) ( not ( = ?auto_109886 ?auto_109890 ) ) ( not ( = ?auto_109887 ?auto_109888 ) ) ( not ( = ?auto_109887 ?auto_109889 ) ) ( not ( = ?auto_109887 ?auto_109890 ) ) ( not ( = ?auto_109888 ?auto_109889 ) ) ( not ( = ?auto_109888 ?auto_109890 ) ) ( not ( = ?auto_109889 ?auto_109890 ) ) ( ON-TABLE ?auto_109890 ) ( ON ?auto_109889 ?auto_109890 ) ( ON ?auto_109888 ?auto_109889 ) ( ON ?auto_109887 ?auto_109888 ) ( ON ?auto_109886 ?auto_109887 ) ( ON ?auto_109885 ?auto_109886 ) ( CLEAR ?auto_109885 ) ( ON ?auto_109884 ?auto_109891 ) ( CLEAR ?auto_109884 ) ( HAND-EMPTY ) ( not ( = ?auto_109884 ?auto_109891 ) ) ( not ( = ?auto_109885 ?auto_109891 ) ) ( not ( = ?auto_109886 ?auto_109891 ) ) ( not ( = ?auto_109887 ?auto_109891 ) ) ( not ( = ?auto_109888 ?auto_109891 ) ) ( not ( = ?auto_109889 ?auto_109891 ) ) ( not ( = ?auto_109890 ?auto_109891 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_109884 ?auto_109891 )
      ( MAKE-7PILE ?auto_109884 ?auto_109885 ?auto_109886 ?auto_109887 ?auto_109888 ?auto_109889 ?auto_109890 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109892 - BLOCK
      ?auto_109893 - BLOCK
      ?auto_109894 - BLOCK
      ?auto_109895 - BLOCK
      ?auto_109896 - BLOCK
      ?auto_109897 - BLOCK
      ?auto_109898 - BLOCK
    )
    :vars
    (
      ?auto_109899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109892 ?auto_109893 ) ) ( not ( = ?auto_109892 ?auto_109894 ) ) ( not ( = ?auto_109892 ?auto_109895 ) ) ( not ( = ?auto_109892 ?auto_109896 ) ) ( not ( = ?auto_109892 ?auto_109897 ) ) ( not ( = ?auto_109892 ?auto_109898 ) ) ( not ( = ?auto_109893 ?auto_109894 ) ) ( not ( = ?auto_109893 ?auto_109895 ) ) ( not ( = ?auto_109893 ?auto_109896 ) ) ( not ( = ?auto_109893 ?auto_109897 ) ) ( not ( = ?auto_109893 ?auto_109898 ) ) ( not ( = ?auto_109894 ?auto_109895 ) ) ( not ( = ?auto_109894 ?auto_109896 ) ) ( not ( = ?auto_109894 ?auto_109897 ) ) ( not ( = ?auto_109894 ?auto_109898 ) ) ( not ( = ?auto_109895 ?auto_109896 ) ) ( not ( = ?auto_109895 ?auto_109897 ) ) ( not ( = ?auto_109895 ?auto_109898 ) ) ( not ( = ?auto_109896 ?auto_109897 ) ) ( not ( = ?auto_109896 ?auto_109898 ) ) ( not ( = ?auto_109897 ?auto_109898 ) ) ( ON-TABLE ?auto_109898 ) ( ON ?auto_109897 ?auto_109898 ) ( ON ?auto_109896 ?auto_109897 ) ( ON ?auto_109895 ?auto_109896 ) ( ON ?auto_109894 ?auto_109895 ) ( ON ?auto_109892 ?auto_109899 ) ( CLEAR ?auto_109892 ) ( not ( = ?auto_109892 ?auto_109899 ) ) ( not ( = ?auto_109893 ?auto_109899 ) ) ( not ( = ?auto_109894 ?auto_109899 ) ) ( not ( = ?auto_109895 ?auto_109899 ) ) ( not ( = ?auto_109896 ?auto_109899 ) ) ( not ( = ?auto_109897 ?auto_109899 ) ) ( not ( = ?auto_109898 ?auto_109899 ) ) ( HOLDING ?auto_109893 ) ( CLEAR ?auto_109894 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109898 ?auto_109897 ?auto_109896 ?auto_109895 ?auto_109894 ?auto_109893 )
      ( MAKE-7PILE ?auto_109892 ?auto_109893 ?auto_109894 ?auto_109895 ?auto_109896 ?auto_109897 ?auto_109898 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109900 - BLOCK
      ?auto_109901 - BLOCK
      ?auto_109902 - BLOCK
      ?auto_109903 - BLOCK
      ?auto_109904 - BLOCK
      ?auto_109905 - BLOCK
      ?auto_109906 - BLOCK
    )
    :vars
    (
      ?auto_109907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109900 ?auto_109901 ) ) ( not ( = ?auto_109900 ?auto_109902 ) ) ( not ( = ?auto_109900 ?auto_109903 ) ) ( not ( = ?auto_109900 ?auto_109904 ) ) ( not ( = ?auto_109900 ?auto_109905 ) ) ( not ( = ?auto_109900 ?auto_109906 ) ) ( not ( = ?auto_109901 ?auto_109902 ) ) ( not ( = ?auto_109901 ?auto_109903 ) ) ( not ( = ?auto_109901 ?auto_109904 ) ) ( not ( = ?auto_109901 ?auto_109905 ) ) ( not ( = ?auto_109901 ?auto_109906 ) ) ( not ( = ?auto_109902 ?auto_109903 ) ) ( not ( = ?auto_109902 ?auto_109904 ) ) ( not ( = ?auto_109902 ?auto_109905 ) ) ( not ( = ?auto_109902 ?auto_109906 ) ) ( not ( = ?auto_109903 ?auto_109904 ) ) ( not ( = ?auto_109903 ?auto_109905 ) ) ( not ( = ?auto_109903 ?auto_109906 ) ) ( not ( = ?auto_109904 ?auto_109905 ) ) ( not ( = ?auto_109904 ?auto_109906 ) ) ( not ( = ?auto_109905 ?auto_109906 ) ) ( ON-TABLE ?auto_109906 ) ( ON ?auto_109905 ?auto_109906 ) ( ON ?auto_109904 ?auto_109905 ) ( ON ?auto_109903 ?auto_109904 ) ( ON ?auto_109902 ?auto_109903 ) ( ON ?auto_109900 ?auto_109907 ) ( not ( = ?auto_109900 ?auto_109907 ) ) ( not ( = ?auto_109901 ?auto_109907 ) ) ( not ( = ?auto_109902 ?auto_109907 ) ) ( not ( = ?auto_109903 ?auto_109907 ) ) ( not ( = ?auto_109904 ?auto_109907 ) ) ( not ( = ?auto_109905 ?auto_109907 ) ) ( not ( = ?auto_109906 ?auto_109907 ) ) ( CLEAR ?auto_109902 ) ( ON ?auto_109901 ?auto_109900 ) ( CLEAR ?auto_109901 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_109907 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109907 ?auto_109900 )
      ( MAKE-7PILE ?auto_109900 ?auto_109901 ?auto_109902 ?auto_109903 ?auto_109904 ?auto_109905 ?auto_109906 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109908 - BLOCK
      ?auto_109909 - BLOCK
      ?auto_109910 - BLOCK
      ?auto_109911 - BLOCK
      ?auto_109912 - BLOCK
      ?auto_109913 - BLOCK
      ?auto_109914 - BLOCK
    )
    :vars
    (
      ?auto_109915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109908 ?auto_109909 ) ) ( not ( = ?auto_109908 ?auto_109910 ) ) ( not ( = ?auto_109908 ?auto_109911 ) ) ( not ( = ?auto_109908 ?auto_109912 ) ) ( not ( = ?auto_109908 ?auto_109913 ) ) ( not ( = ?auto_109908 ?auto_109914 ) ) ( not ( = ?auto_109909 ?auto_109910 ) ) ( not ( = ?auto_109909 ?auto_109911 ) ) ( not ( = ?auto_109909 ?auto_109912 ) ) ( not ( = ?auto_109909 ?auto_109913 ) ) ( not ( = ?auto_109909 ?auto_109914 ) ) ( not ( = ?auto_109910 ?auto_109911 ) ) ( not ( = ?auto_109910 ?auto_109912 ) ) ( not ( = ?auto_109910 ?auto_109913 ) ) ( not ( = ?auto_109910 ?auto_109914 ) ) ( not ( = ?auto_109911 ?auto_109912 ) ) ( not ( = ?auto_109911 ?auto_109913 ) ) ( not ( = ?auto_109911 ?auto_109914 ) ) ( not ( = ?auto_109912 ?auto_109913 ) ) ( not ( = ?auto_109912 ?auto_109914 ) ) ( not ( = ?auto_109913 ?auto_109914 ) ) ( ON-TABLE ?auto_109914 ) ( ON ?auto_109913 ?auto_109914 ) ( ON ?auto_109912 ?auto_109913 ) ( ON ?auto_109911 ?auto_109912 ) ( ON ?auto_109908 ?auto_109915 ) ( not ( = ?auto_109908 ?auto_109915 ) ) ( not ( = ?auto_109909 ?auto_109915 ) ) ( not ( = ?auto_109910 ?auto_109915 ) ) ( not ( = ?auto_109911 ?auto_109915 ) ) ( not ( = ?auto_109912 ?auto_109915 ) ) ( not ( = ?auto_109913 ?auto_109915 ) ) ( not ( = ?auto_109914 ?auto_109915 ) ) ( ON ?auto_109909 ?auto_109908 ) ( CLEAR ?auto_109909 ) ( ON-TABLE ?auto_109915 ) ( HOLDING ?auto_109910 ) ( CLEAR ?auto_109911 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109914 ?auto_109913 ?auto_109912 ?auto_109911 ?auto_109910 )
      ( MAKE-7PILE ?auto_109908 ?auto_109909 ?auto_109910 ?auto_109911 ?auto_109912 ?auto_109913 ?auto_109914 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109916 - BLOCK
      ?auto_109917 - BLOCK
      ?auto_109918 - BLOCK
      ?auto_109919 - BLOCK
      ?auto_109920 - BLOCK
      ?auto_109921 - BLOCK
      ?auto_109922 - BLOCK
    )
    :vars
    (
      ?auto_109923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109916 ?auto_109917 ) ) ( not ( = ?auto_109916 ?auto_109918 ) ) ( not ( = ?auto_109916 ?auto_109919 ) ) ( not ( = ?auto_109916 ?auto_109920 ) ) ( not ( = ?auto_109916 ?auto_109921 ) ) ( not ( = ?auto_109916 ?auto_109922 ) ) ( not ( = ?auto_109917 ?auto_109918 ) ) ( not ( = ?auto_109917 ?auto_109919 ) ) ( not ( = ?auto_109917 ?auto_109920 ) ) ( not ( = ?auto_109917 ?auto_109921 ) ) ( not ( = ?auto_109917 ?auto_109922 ) ) ( not ( = ?auto_109918 ?auto_109919 ) ) ( not ( = ?auto_109918 ?auto_109920 ) ) ( not ( = ?auto_109918 ?auto_109921 ) ) ( not ( = ?auto_109918 ?auto_109922 ) ) ( not ( = ?auto_109919 ?auto_109920 ) ) ( not ( = ?auto_109919 ?auto_109921 ) ) ( not ( = ?auto_109919 ?auto_109922 ) ) ( not ( = ?auto_109920 ?auto_109921 ) ) ( not ( = ?auto_109920 ?auto_109922 ) ) ( not ( = ?auto_109921 ?auto_109922 ) ) ( ON-TABLE ?auto_109922 ) ( ON ?auto_109921 ?auto_109922 ) ( ON ?auto_109920 ?auto_109921 ) ( ON ?auto_109919 ?auto_109920 ) ( ON ?auto_109916 ?auto_109923 ) ( not ( = ?auto_109916 ?auto_109923 ) ) ( not ( = ?auto_109917 ?auto_109923 ) ) ( not ( = ?auto_109918 ?auto_109923 ) ) ( not ( = ?auto_109919 ?auto_109923 ) ) ( not ( = ?auto_109920 ?auto_109923 ) ) ( not ( = ?auto_109921 ?auto_109923 ) ) ( not ( = ?auto_109922 ?auto_109923 ) ) ( ON ?auto_109917 ?auto_109916 ) ( ON-TABLE ?auto_109923 ) ( CLEAR ?auto_109919 ) ( ON ?auto_109918 ?auto_109917 ) ( CLEAR ?auto_109918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109923 ?auto_109916 ?auto_109917 )
      ( MAKE-7PILE ?auto_109916 ?auto_109917 ?auto_109918 ?auto_109919 ?auto_109920 ?auto_109921 ?auto_109922 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109924 - BLOCK
      ?auto_109925 - BLOCK
      ?auto_109926 - BLOCK
      ?auto_109927 - BLOCK
      ?auto_109928 - BLOCK
      ?auto_109929 - BLOCK
      ?auto_109930 - BLOCK
    )
    :vars
    (
      ?auto_109931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109924 ?auto_109925 ) ) ( not ( = ?auto_109924 ?auto_109926 ) ) ( not ( = ?auto_109924 ?auto_109927 ) ) ( not ( = ?auto_109924 ?auto_109928 ) ) ( not ( = ?auto_109924 ?auto_109929 ) ) ( not ( = ?auto_109924 ?auto_109930 ) ) ( not ( = ?auto_109925 ?auto_109926 ) ) ( not ( = ?auto_109925 ?auto_109927 ) ) ( not ( = ?auto_109925 ?auto_109928 ) ) ( not ( = ?auto_109925 ?auto_109929 ) ) ( not ( = ?auto_109925 ?auto_109930 ) ) ( not ( = ?auto_109926 ?auto_109927 ) ) ( not ( = ?auto_109926 ?auto_109928 ) ) ( not ( = ?auto_109926 ?auto_109929 ) ) ( not ( = ?auto_109926 ?auto_109930 ) ) ( not ( = ?auto_109927 ?auto_109928 ) ) ( not ( = ?auto_109927 ?auto_109929 ) ) ( not ( = ?auto_109927 ?auto_109930 ) ) ( not ( = ?auto_109928 ?auto_109929 ) ) ( not ( = ?auto_109928 ?auto_109930 ) ) ( not ( = ?auto_109929 ?auto_109930 ) ) ( ON-TABLE ?auto_109930 ) ( ON ?auto_109929 ?auto_109930 ) ( ON ?auto_109928 ?auto_109929 ) ( ON ?auto_109924 ?auto_109931 ) ( not ( = ?auto_109924 ?auto_109931 ) ) ( not ( = ?auto_109925 ?auto_109931 ) ) ( not ( = ?auto_109926 ?auto_109931 ) ) ( not ( = ?auto_109927 ?auto_109931 ) ) ( not ( = ?auto_109928 ?auto_109931 ) ) ( not ( = ?auto_109929 ?auto_109931 ) ) ( not ( = ?auto_109930 ?auto_109931 ) ) ( ON ?auto_109925 ?auto_109924 ) ( ON-TABLE ?auto_109931 ) ( ON ?auto_109926 ?auto_109925 ) ( CLEAR ?auto_109926 ) ( HOLDING ?auto_109927 ) ( CLEAR ?auto_109928 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109930 ?auto_109929 ?auto_109928 ?auto_109927 )
      ( MAKE-7PILE ?auto_109924 ?auto_109925 ?auto_109926 ?auto_109927 ?auto_109928 ?auto_109929 ?auto_109930 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109932 - BLOCK
      ?auto_109933 - BLOCK
      ?auto_109934 - BLOCK
      ?auto_109935 - BLOCK
      ?auto_109936 - BLOCK
      ?auto_109937 - BLOCK
      ?auto_109938 - BLOCK
    )
    :vars
    (
      ?auto_109939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109932 ?auto_109933 ) ) ( not ( = ?auto_109932 ?auto_109934 ) ) ( not ( = ?auto_109932 ?auto_109935 ) ) ( not ( = ?auto_109932 ?auto_109936 ) ) ( not ( = ?auto_109932 ?auto_109937 ) ) ( not ( = ?auto_109932 ?auto_109938 ) ) ( not ( = ?auto_109933 ?auto_109934 ) ) ( not ( = ?auto_109933 ?auto_109935 ) ) ( not ( = ?auto_109933 ?auto_109936 ) ) ( not ( = ?auto_109933 ?auto_109937 ) ) ( not ( = ?auto_109933 ?auto_109938 ) ) ( not ( = ?auto_109934 ?auto_109935 ) ) ( not ( = ?auto_109934 ?auto_109936 ) ) ( not ( = ?auto_109934 ?auto_109937 ) ) ( not ( = ?auto_109934 ?auto_109938 ) ) ( not ( = ?auto_109935 ?auto_109936 ) ) ( not ( = ?auto_109935 ?auto_109937 ) ) ( not ( = ?auto_109935 ?auto_109938 ) ) ( not ( = ?auto_109936 ?auto_109937 ) ) ( not ( = ?auto_109936 ?auto_109938 ) ) ( not ( = ?auto_109937 ?auto_109938 ) ) ( ON-TABLE ?auto_109938 ) ( ON ?auto_109937 ?auto_109938 ) ( ON ?auto_109936 ?auto_109937 ) ( ON ?auto_109932 ?auto_109939 ) ( not ( = ?auto_109932 ?auto_109939 ) ) ( not ( = ?auto_109933 ?auto_109939 ) ) ( not ( = ?auto_109934 ?auto_109939 ) ) ( not ( = ?auto_109935 ?auto_109939 ) ) ( not ( = ?auto_109936 ?auto_109939 ) ) ( not ( = ?auto_109937 ?auto_109939 ) ) ( not ( = ?auto_109938 ?auto_109939 ) ) ( ON ?auto_109933 ?auto_109932 ) ( ON-TABLE ?auto_109939 ) ( ON ?auto_109934 ?auto_109933 ) ( CLEAR ?auto_109936 ) ( ON ?auto_109935 ?auto_109934 ) ( CLEAR ?auto_109935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_109939 ?auto_109932 ?auto_109933 ?auto_109934 )
      ( MAKE-7PILE ?auto_109932 ?auto_109933 ?auto_109934 ?auto_109935 ?auto_109936 ?auto_109937 ?auto_109938 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109940 - BLOCK
      ?auto_109941 - BLOCK
      ?auto_109942 - BLOCK
      ?auto_109943 - BLOCK
      ?auto_109944 - BLOCK
      ?auto_109945 - BLOCK
      ?auto_109946 - BLOCK
    )
    :vars
    (
      ?auto_109947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109940 ?auto_109941 ) ) ( not ( = ?auto_109940 ?auto_109942 ) ) ( not ( = ?auto_109940 ?auto_109943 ) ) ( not ( = ?auto_109940 ?auto_109944 ) ) ( not ( = ?auto_109940 ?auto_109945 ) ) ( not ( = ?auto_109940 ?auto_109946 ) ) ( not ( = ?auto_109941 ?auto_109942 ) ) ( not ( = ?auto_109941 ?auto_109943 ) ) ( not ( = ?auto_109941 ?auto_109944 ) ) ( not ( = ?auto_109941 ?auto_109945 ) ) ( not ( = ?auto_109941 ?auto_109946 ) ) ( not ( = ?auto_109942 ?auto_109943 ) ) ( not ( = ?auto_109942 ?auto_109944 ) ) ( not ( = ?auto_109942 ?auto_109945 ) ) ( not ( = ?auto_109942 ?auto_109946 ) ) ( not ( = ?auto_109943 ?auto_109944 ) ) ( not ( = ?auto_109943 ?auto_109945 ) ) ( not ( = ?auto_109943 ?auto_109946 ) ) ( not ( = ?auto_109944 ?auto_109945 ) ) ( not ( = ?auto_109944 ?auto_109946 ) ) ( not ( = ?auto_109945 ?auto_109946 ) ) ( ON-TABLE ?auto_109946 ) ( ON ?auto_109945 ?auto_109946 ) ( ON ?auto_109940 ?auto_109947 ) ( not ( = ?auto_109940 ?auto_109947 ) ) ( not ( = ?auto_109941 ?auto_109947 ) ) ( not ( = ?auto_109942 ?auto_109947 ) ) ( not ( = ?auto_109943 ?auto_109947 ) ) ( not ( = ?auto_109944 ?auto_109947 ) ) ( not ( = ?auto_109945 ?auto_109947 ) ) ( not ( = ?auto_109946 ?auto_109947 ) ) ( ON ?auto_109941 ?auto_109940 ) ( ON-TABLE ?auto_109947 ) ( ON ?auto_109942 ?auto_109941 ) ( ON ?auto_109943 ?auto_109942 ) ( CLEAR ?auto_109943 ) ( HOLDING ?auto_109944 ) ( CLEAR ?auto_109945 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_109946 ?auto_109945 ?auto_109944 )
      ( MAKE-7PILE ?auto_109940 ?auto_109941 ?auto_109942 ?auto_109943 ?auto_109944 ?auto_109945 ?auto_109946 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109948 - BLOCK
      ?auto_109949 - BLOCK
      ?auto_109950 - BLOCK
      ?auto_109951 - BLOCK
      ?auto_109952 - BLOCK
      ?auto_109953 - BLOCK
      ?auto_109954 - BLOCK
    )
    :vars
    (
      ?auto_109955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109948 ?auto_109949 ) ) ( not ( = ?auto_109948 ?auto_109950 ) ) ( not ( = ?auto_109948 ?auto_109951 ) ) ( not ( = ?auto_109948 ?auto_109952 ) ) ( not ( = ?auto_109948 ?auto_109953 ) ) ( not ( = ?auto_109948 ?auto_109954 ) ) ( not ( = ?auto_109949 ?auto_109950 ) ) ( not ( = ?auto_109949 ?auto_109951 ) ) ( not ( = ?auto_109949 ?auto_109952 ) ) ( not ( = ?auto_109949 ?auto_109953 ) ) ( not ( = ?auto_109949 ?auto_109954 ) ) ( not ( = ?auto_109950 ?auto_109951 ) ) ( not ( = ?auto_109950 ?auto_109952 ) ) ( not ( = ?auto_109950 ?auto_109953 ) ) ( not ( = ?auto_109950 ?auto_109954 ) ) ( not ( = ?auto_109951 ?auto_109952 ) ) ( not ( = ?auto_109951 ?auto_109953 ) ) ( not ( = ?auto_109951 ?auto_109954 ) ) ( not ( = ?auto_109952 ?auto_109953 ) ) ( not ( = ?auto_109952 ?auto_109954 ) ) ( not ( = ?auto_109953 ?auto_109954 ) ) ( ON-TABLE ?auto_109954 ) ( ON ?auto_109953 ?auto_109954 ) ( ON ?auto_109948 ?auto_109955 ) ( not ( = ?auto_109948 ?auto_109955 ) ) ( not ( = ?auto_109949 ?auto_109955 ) ) ( not ( = ?auto_109950 ?auto_109955 ) ) ( not ( = ?auto_109951 ?auto_109955 ) ) ( not ( = ?auto_109952 ?auto_109955 ) ) ( not ( = ?auto_109953 ?auto_109955 ) ) ( not ( = ?auto_109954 ?auto_109955 ) ) ( ON ?auto_109949 ?auto_109948 ) ( ON-TABLE ?auto_109955 ) ( ON ?auto_109950 ?auto_109949 ) ( ON ?auto_109951 ?auto_109950 ) ( CLEAR ?auto_109953 ) ( ON ?auto_109952 ?auto_109951 ) ( CLEAR ?auto_109952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_109955 ?auto_109948 ?auto_109949 ?auto_109950 ?auto_109951 )
      ( MAKE-7PILE ?auto_109948 ?auto_109949 ?auto_109950 ?auto_109951 ?auto_109952 ?auto_109953 ?auto_109954 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109956 - BLOCK
      ?auto_109957 - BLOCK
      ?auto_109958 - BLOCK
      ?auto_109959 - BLOCK
      ?auto_109960 - BLOCK
      ?auto_109961 - BLOCK
      ?auto_109962 - BLOCK
    )
    :vars
    (
      ?auto_109963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109956 ?auto_109957 ) ) ( not ( = ?auto_109956 ?auto_109958 ) ) ( not ( = ?auto_109956 ?auto_109959 ) ) ( not ( = ?auto_109956 ?auto_109960 ) ) ( not ( = ?auto_109956 ?auto_109961 ) ) ( not ( = ?auto_109956 ?auto_109962 ) ) ( not ( = ?auto_109957 ?auto_109958 ) ) ( not ( = ?auto_109957 ?auto_109959 ) ) ( not ( = ?auto_109957 ?auto_109960 ) ) ( not ( = ?auto_109957 ?auto_109961 ) ) ( not ( = ?auto_109957 ?auto_109962 ) ) ( not ( = ?auto_109958 ?auto_109959 ) ) ( not ( = ?auto_109958 ?auto_109960 ) ) ( not ( = ?auto_109958 ?auto_109961 ) ) ( not ( = ?auto_109958 ?auto_109962 ) ) ( not ( = ?auto_109959 ?auto_109960 ) ) ( not ( = ?auto_109959 ?auto_109961 ) ) ( not ( = ?auto_109959 ?auto_109962 ) ) ( not ( = ?auto_109960 ?auto_109961 ) ) ( not ( = ?auto_109960 ?auto_109962 ) ) ( not ( = ?auto_109961 ?auto_109962 ) ) ( ON-TABLE ?auto_109962 ) ( ON ?auto_109956 ?auto_109963 ) ( not ( = ?auto_109956 ?auto_109963 ) ) ( not ( = ?auto_109957 ?auto_109963 ) ) ( not ( = ?auto_109958 ?auto_109963 ) ) ( not ( = ?auto_109959 ?auto_109963 ) ) ( not ( = ?auto_109960 ?auto_109963 ) ) ( not ( = ?auto_109961 ?auto_109963 ) ) ( not ( = ?auto_109962 ?auto_109963 ) ) ( ON ?auto_109957 ?auto_109956 ) ( ON-TABLE ?auto_109963 ) ( ON ?auto_109958 ?auto_109957 ) ( ON ?auto_109959 ?auto_109958 ) ( ON ?auto_109960 ?auto_109959 ) ( CLEAR ?auto_109960 ) ( HOLDING ?auto_109961 ) ( CLEAR ?auto_109962 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_109962 ?auto_109961 )
      ( MAKE-7PILE ?auto_109956 ?auto_109957 ?auto_109958 ?auto_109959 ?auto_109960 ?auto_109961 ?auto_109962 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109964 - BLOCK
      ?auto_109965 - BLOCK
      ?auto_109966 - BLOCK
      ?auto_109967 - BLOCK
      ?auto_109968 - BLOCK
      ?auto_109969 - BLOCK
      ?auto_109970 - BLOCK
    )
    :vars
    (
      ?auto_109971 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109964 ?auto_109965 ) ) ( not ( = ?auto_109964 ?auto_109966 ) ) ( not ( = ?auto_109964 ?auto_109967 ) ) ( not ( = ?auto_109964 ?auto_109968 ) ) ( not ( = ?auto_109964 ?auto_109969 ) ) ( not ( = ?auto_109964 ?auto_109970 ) ) ( not ( = ?auto_109965 ?auto_109966 ) ) ( not ( = ?auto_109965 ?auto_109967 ) ) ( not ( = ?auto_109965 ?auto_109968 ) ) ( not ( = ?auto_109965 ?auto_109969 ) ) ( not ( = ?auto_109965 ?auto_109970 ) ) ( not ( = ?auto_109966 ?auto_109967 ) ) ( not ( = ?auto_109966 ?auto_109968 ) ) ( not ( = ?auto_109966 ?auto_109969 ) ) ( not ( = ?auto_109966 ?auto_109970 ) ) ( not ( = ?auto_109967 ?auto_109968 ) ) ( not ( = ?auto_109967 ?auto_109969 ) ) ( not ( = ?auto_109967 ?auto_109970 ) ) ( not ( = ?auto_109968 ?auto_109969 ) ) ( not ( = ?auto_109968 ?auto_109970 ) ) ( not ( = ?auto_109969 ?auto_109970 ) ) ( ON-TABLE ?auto_109970 ) ( ON ?auto_109964 ?auto_109971 ) ( not ( = ?auto_109964 ?auto_109971 ) ) ( not ( = ?auto_109965 ?auto_109971 ) ) ( not ( = ?auto_109966 ?auto_109971 ) ) ( not ( = ?auto_109967 ?auto_109971 ) ) ( not ( = ?auto_109968 ?auto_109971 ) ) ( not ( = ?auto_109969 ?auto_109971 ) ) ( not ( = ?auto_109970 ?auto_109971 ) ) ( ON ?auto_109965 ?auto_109964 ) ( ON-TABLE ?auto_109971 ) ( ON ?auto_109966 ?auto_109965 ) ( ON ?auto_109967 ?auto_109966 ) ( ON ?auto_109968 ?auto_109967 ) ( CLEAR ?auto_109970 ) ( ON ?auto_109969 ?auto_109968 ) ( CLEAR ?auto_109969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_109971 ?auto_109964 ?auto_109965 ?auto_109966 ?auto_109967 ?auto_109968 )
      ( MAKE-7PILE ?auto_109964 ?auto_109965 ?auto_109966 ?auto_109967 ?auto_109968 ?auto_109969 ?auto_109970 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109972 - BLOCK
      ?auto_109973 - BLOCK
      ?auto_109974 - BLOCK
      ?auto_109975 - BLOCK
      ?auto_109976 - BLOCK
      ?auto_109977 - BLOCK
      ?auto_109978 - BLOCK
    )
    :vars
    (
      ?auto_109979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109972 ?auto_109973 ) ) ( not ( = ?auto_109972 ?auto_109974 ) ) ( not ( = ?auto_109972 ?auto_109975 ) ) ( not ( = ?auto_109972 ?auto_109976 ) ) ( not ( = ?auto_109972 ?auto_109977 ) ) ( not ( = ?auto_109972 ?auto_109978 ) ) ( not ( = ?auto_109973 ?auto_109974 ) ) ( not ( = ?auto_109973 ?auto_109975 ) ) ( not ( = ?auto_109973 ?auto_109976 ) ) ( not ( = ?auto_109973 ?auto_109977 ) ) ( not ( = ?auto_109973 ?auto_109978 ) ) ( not ( = ?auto_109974 ?auto_109975 ) ) ( not ( = ?auto_109974 ?auto_109976 ) ) ( not ( = ?auto_109974 ?auto_109977 ) ) ( not ( = ?auto_109974 ?auto_109978 ) ) ( not ( = ?auto_109975 ?auto_109976 ) ) ( not ( = ?auto_109975 ?auto_109977 ) ) ( not ( = ?auto_109975 ?auto_109978 ) ) ( not ( = ?auto_109976 ?auto_109977 ) ) ( not ( = ?auto_109976 ?auto_109978 ) ) ( not ( = ?auto_109977 ?auto_109978 ) ) ( ON ?auto_109972 ?auto_109979 ) ( not ( = ?auto_109972 ?auto_109979 ) ) ( not ( = ?auto_109973 ?auto_109979 ) ) ( not ( = ?auto_109974 ?auto_109979 ) ) ( not ( = ?auto_109975 ?auto_109979 ) ) ( not ( = ?auto_109976 ?auto_109979 ) ) ( not ( = ?auto_109977 ?auto_109979 ) ) ( not ( = ?auto_109978 ?auto_109979 ) ) ( ON ?auto_109973 ?auto_109972 ) ( ON-TABLE ?auto_109979 ) ( ON ?auto_109974 ?auto_109973 ) ( ON ?auto_109975 ?auto_109974 ) ( ON ?auto_109976 ?auto_109975 ) ( ON ?auto_109977 ?auto_109976 ) ( CLEAR ?auto_109977 ) ( HOLDING ?auto_109978 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109978 )
      ( MAKE-7PILE ?auto_109972 ?auto_109973 ?auto_109974 ?auto_109975 ?auto_109976 ?auto_109977 ?auto_109978 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_109980 - BLOCK
      ?auto_109981 - BLOCK
      ?auto_109982 - BLOCK
      ?auto_109983 - BLOCK
      ?auto_109984 - BLOCK
      ?auto_109985 - BLOCK
      ?auto_109986 - BLOCK
    )
    :vars
    (
      ?auto_109987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_109980 ?auto_109981 ) ) ( not ( = ?auto_109980 ?auto_109982 ) ) ( not ( = ?auto_109980 ?auto_109983 ) ) ( not ( = ?auto_109980 ?auto_109984 ) ) ( not ( = ?auto_109980 ?auto_109985 ) ) ( not ( = ?auto_109980 ?auto_109986 ) ) ( not ( = ?auto_109981 ?auto_109982 ) ) ( not ( = ?auto_109981 ?auto_109983 ) ) ( not ( = ?auto_109981 ?auto_109984 ) ) ( not ( = ?auto_109981 ?auto_109985 ) ) ( not ( = ?auto_109981 ?auto_109986 ) ) ( not ( = ?auto_109982 ?auto_109983 ) ) ( not ( = ?auto_109982 ?auto_109984 ) ) ( not ( = ?auto_109982 ?auto_109985 ) ) ( not ( = ?auto_109982 ?auto_109986 ) ) ( not ( = ?auto_109983 ?auto_109984 ) ) ( not ( = ?auto_109983 ?auto_109985 ) ) ( not ( = ?auto_109983 ?auto_109986 ) ) ( not ( = ?auto_109984 ?auto_109985 ) ) ( not ( = ?auto_109984 ?auto_109986 ) ) ( not ( = ?auto_109985 ?auto_109986 ) ) ( ON ?auto_109980 ?auto_109987 ) ( not ( = ?auto_109980 ?auto_109987 ) ) ( not ( = ?auto_109981 ?auto_109987 ) ) ( not ( = ?auto_109982 ?auto_109987 ) ) ( not ( = ?auto_109983 ?auto_109987 ) ) ( not ( = ?auto_109984 ?auto_109987 ) ) ( not ( = ?auto_109985 ?auto_109987 ) ) ( not ( = ?auto_109986 ?auto_109987 ) ) ( ON ?auto_109981 ?auto_109980 ) ( ON-TABLE ?auto_109987 ) ( ON ?auto_109982 ?auto_109981 ) ( ON ?auto_109983 ?auto_109982 ) ( ON ?auto_109984 ?auto_109983 ) ( ON ?auto_109985 ?auto_109984 ) ( ON ?auto_109986 ?auto_109985 ) ( CLEAR ?auto_109986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_109987 ?auto_109980 ?auto_109981 ?auto_109982 ?auto_109983 ?auto_109984 ?auto_109985 )
      ( MAKE-7PILE ?auto_109980 ?auto_109981 ?auto_109982 ?auto_109983 ?auto_109984 ?auto_109985 ?auto_109986 ) )
  )

)

