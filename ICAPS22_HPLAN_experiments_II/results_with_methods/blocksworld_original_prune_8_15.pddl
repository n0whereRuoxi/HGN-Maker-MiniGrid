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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173153 - BLOCK
      ?auto_173154 - BLOCK
      ?auto_173155 - BLOCK
      ?auto_173156 - BLOCK
      ?auto_173157 - BLOCK
      ?auto_173158 - BLOCK
      ?auto_173159 - BLOCK
      ?auto_173160 - BLOCK
    )
    :vars
    (
      ?auto_173161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173161 ?auto_173160 ) ( CLEAR ?auto_173161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173153 ) ( ON ?auto_173154 ?auto_173153 ) ( ON ?auto_173155 ?auto_173154 ) ( ON ?auto_173156 ?auto_173155 ) ( ON ?auto_173157 ?auto_173156 ) ( ON ?auto_173158 ?auto_173157 ) ( ON ?auto_173159 ?auto_173158 ) ( ON ?auto_173160 ?auto_173159 ) ( not ( = ?auto_173153 ?auto_173154 ) ) ( not ( = ?auto_173153 ?auto_173155 ) ) ( not ( = ?auto_173153 ?auto_173156 ) ) ( not ( = ?auto_173153 ?auto_173157 ) ) ( not ( = ?auto_173153 ?auto_173158 ) ) ( not ( = ?auto_173153 ?auto_173159 ) ) ( not ( = ?auto_173153 ?auto_173160 ) ) ( not ( = ?auto_173153 ?auto_173161 ) ) ( not ( = ?auto_173154 ?auto_173155 ) ) ( not ( = ?auto_173154 ?auto_173156 ) ) ( not ( = ?auto_173154 ?auto_173157 ) ) ( not ( = ?auto_173154 ?auto_173158 ) ) ( not ( = ?auto_173154 ?auto_173159 ) ) ( not ( = ?auto_173154 ?auto_173160 ) ) ( not ( = ?auto_173154 ?auto_173161 ) ) ( not ( = ?auto_173155 ?auto_173156 ) ) ( not ( = ?auto_173155 ?auto_173157 ) ) ( not ( = ?auto_173155 ?auto_173158 ) ) ( not ( = ?auto_173155 ?auto_173159 ) ) ( not ( = ?auto_173155 ?auto_173160 ) ) ( not ( = ?auto_173155 ?auto_173161 ) ) ( not ( = ?auto_173156 ?auto_173157 ) ) ( not ( = ?auto_173156 ?auto_173158 ) ) ( not ( = ?auto_173156 ?auto_173159 ) ) ( not ( = ?auto_173156 ?auto_173160 ) ) ( not ( = ?auto_173156 ?auto_173161 ) ) ( not ( = ?auto_173157 ?auto_173158 ) ) ( not ( = ?auto_173157 ?auto_173159 ) ) ( not ( = ?auto_173157 ?auto_173160 ) ) ( not ( = ?auto_173157 ?auto_173161 ) ) ( not ( = ?auto_173158 ?auto_173159 ) ) ( not ( = ?auto_173158 ?auto_173160 ) ) ( not ( = ?auto_173158 ?auto_173161 ) ) ( not ( = ?auto_173159 ?auto_173160 ) ) ( not ( = ?auto_173159 ?auto_173161 ) ) ( not ( = ?auto_173160 ?auto_173161 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173161 ?auto_173160 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_173163 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_173163 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_173163 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_173164 - BLOCK
    )
    :vars
    (
      ?auto_173165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173164 ?auto_173165 ) ( CLEAR ?auto_173164 ) ( HAND-EMPTY ) ( not ( = ?auto_173164 ?auto_173165 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173164 ?auto_173165 )
      ( MAKE-1PILE ?auto_173164 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173173 - BLOCK
      ?auto_173174 - BLOCK
      ?auto_173175 - BLOCK
      ?auto_173176 - BLOCK
      ?auto_173177 - BLOCK
      ?auto_173178 - BLOCK
      ?auto_173179 - BLOCK
    )
    :vars
    (
      ?auto_173180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173180 ?auto_173179 ) ( CLEAR ?auto_173180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173173 ) ( ON ?auto_173174 ?auto_173173 ) ( ON ?auto_173175 ?auto_173174 ) ( ON ?auto_173176 ?auto_173175 ) ( ON ?auto_173177 ?auto_173176 ) ( ON ?auto_173178 ?auto_173177 ) ( ON ?auto_173179 ?auto_173178 ) ( not ( = ?auto_173173 ?auto_173174 ) ) ( not ( = ?auto_173173 ?auto_173175 ) ) ( not ( = ?auto_173173 ?auto_173176 ) ) ( not ( = ?auto_173173 ?auto_173177 ) ) ( not ( = ?auto_173173 ?auto_173178 ) ) ( not ( = ?auto_173173 ?auto_173179 ) ) ( not ( = ?auto_173173 ?auto_173180 ) ) ( not ( = ?auto_173174 ?auto_173175 ) ) ( not ( = ?auto_173174 ?auto_173176 ) ) ( not ( = ?auto_173174 ?auto_173177 ) ) ( not ( = ?auto_173174 ?auto_173178 ) ) ( not ( = ?auto_173174 ?auto_173179 ) ) ( not ( = ?auto_173174 ?auto_173180 ) ) ( not ( = ?auto_173175 ?auto_173176 ) ) ( not ( = ?auto_173175 ?auto_173177 ) ) ( not ( = ?auto_173175 ?auto_173178 ) ) ( not ( = ?auto_173175 ?auto_173179 ) ) ( not ( = ?auto_173175 ?auto_173180 ) ) ( not ( = ?auto_173176 ?auto_173177 ) ) ( not ( = ?auto_173176 ?auto_173178 ) ) ( not ( = ?auto_173176 ?auto_173179 ) ) ( not ( = ?auto_173176 ?auto_173180 ) ) ( not ( = ?auto_173177 ?auto_173178 ) ) ( not ( = ?auto_173177 ?auto_173179 ) ) ( not ( = ?auto_173177 ?auto_173180 ) ) ( not ( = ?auto_173178 ?auto_173179 ) ) ( not ( = ?auto_173178 ?auto_173180 ) ) ( not ( = ?auto_173179 ?auto_173180 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173180 ?auto_173179 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173181 - BLOCK
      ?auto_173182 - BLOCK
      ?auto_173183 - BLOCK
      ?auto_173184 - BLOCK
      ?auto_173185 - BLOCK
      ?auto_173186 - BLOCK
      ?auto_173187 - BLOCK
    )
    :vars
    (
      ?auto_173188 - BLOCK
      ?auto_173189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173188 ?auto_173187 ) ( CLEAR ?auto_173188 ) ( ON-TABLE ?auto_173181 ) ( ON ?auto_173182 ?auto_173181 ) ( ON ?auto_173183 ?auto_173182 ) ( ON ?auto_173184 ?auto_173183 ) ( ON ?auto_173185 ?auto_173184 ) ( ON ?auto_173186 ?auto_173185 ) ( ON ?auto_173187 ?auto_173186 ) ( not ( = ?auto_173181 ?auto_173182 ) ) ( not ( = ?auto_173181 ?auto_173183 ) ) ( not ( = ?auto_173181 ?auto_173184 ) ) ( not ( = ?auto_173181 ?auto_173185 ) ) ( not ( = ?auto_173181 ?auto_173186 ) ) ( not ( = ?auto_173181 ?auto_173187 ) ) ( not ( = ?auto_173181 ?auto_173188 ) ) ( not ( = ?auto_173182 ?auto_173183 ) ) ( not ( = ?auto_173182 ?auto_173184 ) ) ( not ( = ?auto_173182 ?auto_173185 ) ) ( not ( = ?auto_173182 ?auto_173186 ) ) ( not ( = ?auto_173182 ?auto_173187 ) ) ( not ( = ?auto_173182 ?auto_173188 ) ) ( not ( = ?auto_173183 ?auto_173184 ) ) ( not ( = ?auto_173183 ?auto_173185 ) ) ( not ( = ?auto_173183 ?auto_173186 ) ) ( not ( = ?auto_173183 ?auto_173187 ) ) ( not ( = ?auto_173183 ?auto_173188 ) ) ( not ( = ?auto_173184 ?auto_173185 ) ) ( not ( = ?auto_173184 ?auto_173186 ) ) ( not ( = ?auto_173184 ?auto_173187 ) ) ( not ( = ?auto_173184 ?auto_173188 ) ) ( not ( = ?auto_173185 ?auto_173186 ) ) ( not ( = ?auto_173185 ?auto_173187 ) ) ( not ( = ?auto_173185 ?auto_173188 ) ) ( not ( = ?auto_173186 ?auto_173187 ) ) ( not ( = ?auto_173186 ?auto_173188 ) ) ( not ( = ?auto_173187 ?auto_173188 ) ) ( HOLDING ?auto_173189 ) ( not ( = ?auto_173181 ?auto_173189 ) ) ( not ( = ?auto_173182 ?auto_173189 ) ) ( not ( = ?auto_173183 ?auto_173189 ) ) ( not ( = ?auto_173184 ?auto_173189 ) ) ( not ( = ?auto_173185 ?auto_173189 ) ) ( not ( = ?auto_173186 ?auto_173189 ) ) ( not ( = ?auto_173187 ?auto_173189 ) ) ( not ( = ?auto_173188 ?auto_173189 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_173189 )
      ( MAKE-7PILE ?auto_173181 ?auto_173182 ?auto_173183 ?auto_173184 ?auto_173185 ?auto_173186 ?auto_173187 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173190 - BLOCK
      ?auto_173191 - BLOCK
      ?auto_173192 - BLOCK
      ?auto_173193 - BLOCK
      ?auto_173194 - BLOCK
      ?auto_173195 - BLOCK
      ?auto_173196 - BLOCK
    )
    :vars
    (
      ?auto_173197 - BLOCK
      ?auto_173198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173197 ?auto_173196 ) ( ON-TABLE ?auto_173190 ) ( ON ?auto_173191 ?auto_173190 ) ( ON ?auto_173192 ?auto_173191 ) ( ON ?auto_173193 ?auto_173192 ) ( ON ?auto_173194 ?auto_173193 ) ( ON ?auto_173195 ?auto_173194 ) ( ON ?auto_173196 ?auto_173195 ) ( not ( = ?auto_173190 ?auto_173191 ) ) ( not ( = ?auto_173190 ?auto_173192 ) ) ( not ( = ?auto_173190 ?auto_173193 ) ) ( not ( = ?auto_173190 ?auto_173194 ) ) ( not ( = ?auto_173190 ?auto_173195 ) ) ( not ( = ?auto_173190 ?auto_173196 ) ) ( not ( = ?auto_173190 ?auto_173197 ) ) ( not ( = ?auto_173191 ?auto_173192 ) ) ( not ( = ?auto_173191 ?auto_173193 ) ) ( not ( = ?auto_173191 ?auto_173194 ) ) ( not ( = ?auto_173191 ?auto_173195 ) ) ( not ( = ?auto_173191 ?auto_173196 ) ) ( not ( = ?auto_173191 ?auto_173197 ) ) ( not ( = ?auto_173192 ?auto_173193 ) ) ( not ( = ?auto_173192 ?auto_173194 ) ) ( not ( = ?auto_173192 ?auto_173195 ) ) ( not ( = ?auto_173192 ?auto_173196 ) ) ( not ( = ?auto_173192 ?auto_173197 ) ) ( not ( = ?auto_173193 ?auto_173194 ) ) ( not ( = ?auto_173193 ?auto_173195 ) ) ( not ( = ?auto_173193 ?auto_173196 ) ) ( not ( = ?auto_173193 ?auto_173197 ) ) ( not ( = ?auto_173194 ?auto_173195 ) ) ( not ( = ?auto_173194 ?auto_173196 ) ) ( not ( = ?auto_173194 ?auto_173197 ) ) ( not ( = ?auto_173195 ?auto_173196 ) ) ( not ( = ?auto_173195 ?auto_173197 ) ) ( not ( = ?auto_173196 ?auto_173197 ) ) ( not ( = ?auto_173190 ?auto_173198 ) ) ( not ( = ?auto_173191 ?auto_173198 ) ) ( not ( = ?auto_173192 ?auto_173198 ) ) ( not ( = ?auto_173193 ?auto_173198 ) ) ( not ( = ?auto_173194 ?auto_173198 ) ) ( not ( = ?auto_173195 ?auto_173198 ) ) ( not ( = ?auto_173196 ?auto_173198 ) ) ( not ( = ?auto_173197 ?auto_173198 ) ) ( ON ?auto_173198 ?auto_173197 ) ( CLEAR ?auto_173198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173190 ?auto_173191 ?auto_173192 ?auto_173193 ?auto_173194 ?auto_173195 ?auto_173196 ?auto_173197 )
      ( MAKE-7PILE ?auto_173190 ?auto_173191 ?auto_173192 ?auto_173193 ?auto_173194 ?auto_173195 ?auto_173196 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173201 - BLOCK
      ?auto_173202 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_173202 ) ( CLEAR ?auto_173201 ) ( ON-TABLE ?auto_173201 ) ( not ( = ?auto_173201 ?auto_173202 ) ) )
    :subtasks
    ( ( !STACK ?auto_173202 ?auto_173201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173203 - BLOCK
      ?auto_173204 - BLOCK
    )
    :vars
    (
      ?auto_173205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173203 ) ( ON-TABLE ?auto_173203 ) ( not ( = ?auto_173203 ?auto_173204 ) ) ( ON ?auto_173204 ?auto_173205 ) ( CLEAR ?auto_173204 ) ( HAND-EMPTY ) ( not ( = ?auto_173203 ?auto_173205 ) ) ( not ( = ?auto_173204 ?auto_173205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173204 ?auto_173205 )
      ( MAKE-2PILE ?auto_173203 ?auto_173204 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173206 - BLOCK
      ?auto_173207 - BLOCK
    )
    :vars
    (
      ?auto_173208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173206 ?auto_173207 ) ) ( ON ?auto_173207 ?auto_173208 ) ( CLEAR ?auto_173207 ) ( not ( = ?auto_173206 ?auto_173208 ) ) ( not ( = ?auto_173207 ?auto_173208 ) ) ( HOLDING ?auto_173206 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173206 )
      ( MAKE-2PILE ?auto_173206 ?auto_173207 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173209 - BLOCK
      ?auto_173210 - BLOCK
    )
    :vars
    (
      ?auto_173211 - BLOCK
      ?auto_173216 - BLOCK
      ?auto_173213 - BLOCK
      ?auto_173217 - BLOCK
      ?auto_173214 - BLOCK
      ?auto_173215 - BLOCK
      ?auto_173212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173209 ?auto_173210 ) ) ( ON ?auto_173210 ?auto_173211 ) ( not ( = ?auto_173209 ?auto_173211 ) ) ( not ( = ?auto_173210 ?auto_173211 ) ) ( ON ?auto_173209 ?auto_173210 ) ( CLEAR ?auto_173209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173216 ) ( ON ?auto_173213 ?auto_173216 ) ( ON ?auto_173217 ?auto_173213 ) ( ON ?auto_173214 ?auto_173217 ) ( ON ?auto_173215 ?auto_173214 ) ( ON ?auto_173212 ?auto_173215 ) ( ON ?auto_173211 ?auto_173212 ) ( not ( = ?auto_173216 ?auto_173213 ) ) ( not ( = ?auto_173216 ?auto_173217 ) ) ( not ( = ?auto_173216 ?auto_173214 ) ) ( not ( = ?auto_173216 ?auto_173215 ) ) ( not ( = ?auto_173216 ?auto_173212 ) ) ( not ( = ?auto_173216 ?auto_173211 ) ) ( not ( = ?auto_173216 ?auto_173210 ) ) ( not ( = ?auto_173216 ?auto_173209 ) ) ( not ( = ?auto_173213 ?auto_173217 ) ) ( not ( = ?auto_173213 ?auto_173214 ) ) ( not ( = ?auto_173213 ?auto_173215 ) ) ( not ( = ?auto_173213 ?auto_173212 ) ) ( not ( = ?auto_173213 ?auto_173211 ) ) ( not ( = ?auto_173213 ?auto_173210 ) ) ( not ( = ?auto_173213 ?auto_173209 ) ) ( not ( = ?auto_173217 ?auto_173214 ) ) ( not ( = ?auto_173217 ?auto_173215 ) ) ( not ( = ?auto_173217 ?auto_173212 ) ) ( not ( = ?auto_173217 ?auto_173211 ) ) ( not ( = ?auto_173217 ?auto_173210 ) ) ( not ( = ?auto_173217 ?auto_173209 ) ) ( not ( = ?auto_173214 ?auto_173215 ) ) ( not ( = ?auto_173214 ?auto_173212 ) ) ( not ( = ?auto_173214 ?auto_173211 ) ) ( not ( = ?auto_173214 ?auto_173210 ) ) ( not ( = ?auto_173214 ?auto_173209 ) ) ( not ( = ?auto_173215 ?auto_173212 ) ) ( not ( = ?auto_173215 ?auto_173211 ) ) ( not ( = ?auto_173215 ?auto_173210 ) ) ( not ( = ?auto_173215 ?auto_173209 ) ) ( not ( = ?auto_173212 ?auto_173211 ) ) ( not ( = ?auto_173212 ?auto_173210 ) ) ( not ( = ?auto_173212 ?auto_173209 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173216 ?auto_173213 ?auto_173217 ?auto_173214 ?auto_173215 ?auto_173212 ?auto_173211 ?auto_173210 )
      ( MAKE-2PILE ?auto_173209 ?auto_173210 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173224 - BLOCK
      ?auto_173225 - BLOCK
      ?auto_173226 - BLOCK
      ?auto_173227 - BLOCK
      ?auto_173228 - BLOCK
      ?auto_173229 - BLOCK
    )
    :vars
    (
      ?auto_173230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173230 ?auto_173229 ) ( CLEAR ?auto_173230 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173224 ) ( ON ?auto_173225 ?auto_173224 ) ( ON ?auto_173226 ?auto_173225 ) ( ON ?auto_173227 ?auto_173226 ) ( ON ?auto_173228 ?auto_173227 ) ( ON ?auto_173229 ?auto_173228 ) ( not ( = ?auto_173224 ?auto_173225 ) ) ( not ( = ?auto_173224 ?auto_173226 ) ) ( not ( = ?auto_173224 ?auto_173227 ) ) ( not ( = ?auto_173224 ?auto_173228 ) ) ( not ( = ?auto_173224 ?auto_173229 ) ) ( not ( = ?auto_173224 ?auto_173230 ) ) ( not ( = ?auto_173225 ?auto_173226 ) ) ( not ( = ?auto_173225 ?auto_173227 ) ) ( not ( = ?auto_173225 ?auto_173228 ) ) ( not ( = ?auto_173225 ?auto_173229 ) ) ( not ( = ?auto_173225 ?auto_173230 ) ) ( not ( = ?auto_173226 ?auto_173227 ) ) ( not ( = ?auto_173226 ?auto_173228 ) ) ( not ( = ?auto_173226 ?auto_173229 ) ) ( not ( = ?auto_173226 ?auto_173230 ) ) ( not ( = ?auto_173227 ?auto_173228 ) ) ( not ( = ?auto_173227 ?auto_173229 ) ) ( not ( = ?auto_173227 ?auto_173230 ) ) ( not ( = ?auto_173228 ?auto_173229 ) ) ( not ( = ?auto_173228 ?auto_173230 ) ) ( not ( = ?auto_173229 ?auto_173230 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173230 ?auto_173229 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173231 - BLOCK
      ?auto_173232 - BLOCK
      ?auto_173233 - BLOCK
      ?auto_173234 - BLOCK
      ?auto_173235 - BLOCK
      ?auto_173236 - BLOCK
    )
    :vars
    (
      ?auto_173237 - BLOCK
      ?auto_173238 - BLOCK
      ?auto_173239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173237 ?auto_173236 ) ( CLEAR ?auto_173237 ) ( ON-TABLE ?auto_173231 ) ( ON ?auto_173232 ?auto_173231 ) ( ON ?auto_173233 ?auto_173232 ) ( ON ?auto_173234 ?auto_173233 ) ( ON ?auto_173235 ?auto_173234 ) ( ON ?auto_173236 ?auto_173235 ) ( not ( = ?auto_173231 ?auto_173232 ) ) ( not ( = ?auto_173231 ?auto_173233 ) ) ( not ( = ?auto_173231 ?auto_173234 ) ) ( not ( = ?auto_173231 ?auto_173235 ) ) ( not ( = ?auto_173231 ?auto_173236 ) ) ( not ( = ?auto_173231 ?auto_173237 ) ) ( not ( = ?auto_173232 ?auto_173233 ) ) ( not ( = ?auto_173232 ?auto_173234 ) ) ( not ( = ?auto_173232 ?auto_173235 ) ) ( not ( = ?auto_173232 ?auto_173236 ) ) ( not ( = ?auto_173232 ?auto_173237 ) ) ( not ( = ?auto_173233 ?auto_173234 ) ) ( not ( = ?auto_173233 ?auto_173235 ) ) ( not ( = ?auto_173233 ?auto_173236 ) ) ( not ( = ?auto_173233 ?auto_173237 ) ) ( not ( = ?auto_173234 ?auto_173235 ) ) ( not ( = ?auto_173234 ?auto_173236 ) ) ( not ( = ?auto_173234 ?auto_173237 ) ) ( not ( = ?auto_173235 ?auto_173236 ) ) ( not ( = ?auto_173235 ?auto_173237 ) ) ( not ( = ?auto_173236 ?auto_173237 ) ) ( HOLDING ?auto_173238 ) ( CLEAR ?auto_173239 ) ( not ( = ?auto_173231 ?auto_173238 ) ) ( not ( = ?auto_173231 ?auto_173239 ) ) ( not ( = ?auto_173232 ?auto_173238 ) ) ( not ( = ?auto_173232 ?auto_173239 ) ) ( not ( = ?auto_173233 ?auto_173238 ) ) ( not ( = ?auto_173233 ?auto_173239 ) ) ( not ( = ?auto_173234 ?auto_173238 ) ) ( not ( = ?auto_173234 ?auto_173239 ) ) ( not ( = ?auto_173235 ?auto_173238 ) ) ( not ( = ?auto_173235 ?auto_173239 ) ) ( not ( = ?auto_173236 ?auto_173238 ) ) ( not ( = ?auto_173236 ?auto_173239 ) ) ( not ( = ?auto_173237 ?auto_173238 ) ) ( not ( = ?auto_173237 ?auto_173239 ) ) ( not ( = ?auto_173238 ?auto_173239 ) ) )
    :subtasks
    ( ( !STACK ?auto_173238 ?auto_173239 )
      ( MAKE-6PILE ?auto_173231 ?auto_173232 ?auto_173233 ?auto_173234 ?auto_173235 ?auto_173236 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174571 - BLOCK
      ?auto_174572 - BLOCK
      ?auto_174573 - BLOCK
      ?auto_174574 - BLOCK
      ?auto_174575 - BLOCK
      ?auto_174576 - BLOCK
    )
    :vars
    (
      ?auto_174578 - BLOCK
      ?auto_174577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174578 ?auto_174576 ) ( ON-TABLE ?auto_174571 ) ( ON ?auto_174572 ?auto_174571 ) ( ON ?auto_174573 ?auto_174572 ) ( ON ?auto_174574 ?auto_174573 ) ( ON ?auto_174575 ?auto_174574 ) ( ON ?auto_174576 ?auto_174575 ) ( not ( = ?auto_174571 ?auto_174572 ) ) ( not ( = ?auto_174571 ?auto_174573 ) ) ( not ( = ?auto_174571 ?auto_174574 ) ) ( not ( = ?auto_174571 ?auto_174575 ) ) ( not ( = ?auto_174571 ?auto_174576 ) ) ( not ( = ?auto_174571 ?auto_174578 ) ) ( not ( = ?auto_174572 ?auto_174573 ) ) ( not ( = ?auto_174572 ?auto_174574 ) ) ( not ( = ?auto_174572 ?auto_174575 ) ) ( not ( = ?auto_174572 ?auto_174576 ) ) ( not ( = ?auto_174572 ?auto_174578 ) ) ( not ( = ?auto_174573 ?auto_174574 ) ) ( not ( = ?auto_174573 ?auto_174575 ) ) ( not ( = ?auto_174573 ?auto_174576 ) ) ( not ( = ?auto_174573 ?auto_174578 ) ) ( not ( = ?auto_174574 ?auto_174575 ) ) ( not ( = ?auto_174574 ?auto_174576 ) ) ( not ( = ?auto_174574 ?auto_174578 ) ) ( not ( = ?auto_174575 ?auto_174576 ) ) ( not ( = ?auto_174575 ?auto_174578 ) ) ( not ( = ?auto_174576 ?auto_174578 ) ) ( not ( = ?auto_174571 ?auto_174577 ) ) ( not ( = ?auto_174572 ?auto_174577 ) ) ( not ( = ?auto_174573 ?auto_174577 ) ) ( not ( = ?auto_174574 ?auto_174577 ) ) ( not ( = ?auto_174575 ?auto_174577 ) ) ( not ( = ?auto_174576 ?auto_174577 ) ) ( not ( = ?auto_174578 ?auto_174577 ) ) ( ON ?auto_174577 ?auto_174578 ) ( CLEAR ?auto_174577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174571 ?auto_174572 ?auto_174573 ?auto_174574 ?auto_174575 ?auto_174576 ?auto_174578 )
      ( MAKE-6PILE ?auto_174571 ?auto_174572 ?auto_174573 ?auto_174574 ?auto_174575 ?auto_174576 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173249 - BLOCK
      ?auto_173250 - BLOCK
      ?auto_173251 - BLOCK
      ?auto_173252 - BLOCK
      ?auto_173253 - BLOCK
      ?auto_173254 - BLOCK
    )
    :vars
    (
      ?auto_173257 - BLOCK
      ?auto_173255 - BLOCK
      ?auto_173256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173257 ?auto_173254 ) ( ON-TABLE ?auto_173249 ) ( ON ?auto_173250 ?auto_173249 ) ( ON ?auto_173251 ?auto_173250 ) ( ON ?auto_173252 ?auto_173251 ) ( ON ?auto_173253 ?auto_173252 ) ( ON ?auto_173254 ?auto_173253 ) ( not ( = ?auto_173249 ?auto_173250 ) ) ( not ( = ?auto_173249 ?auto_173251 ) ) ( not ( = ?auto_173249 ?auto_173252 ) ) ( not ( = ?auto_173249 ?auto_173253 ) ) ( not ( = ?auto_173249 ?auto_173254 ) ) ( not ( = ?auto_173249 ?auto_173257 ) ) ( not ( = ?auto_173250 ?auto_173251 ) ) ( not ( = ?auto_173250 ?auto_173252 ) ) ( not ( = ?auto_173250 ?auto_173253 ) ) ( not ( = ?auto_173250 ?auto_173254 ) ) ( not ( = ?auto_173250 ?auto_173257 ) ) ( not ( = ?auto_173251 ?auto_173252 ) ) ( not ( = ?auto_173251 ?auto_173253 ) ) ( not ( = ?auto_173251 ?auto_173254 ) ) ( not ( = ?auto_173251 ?auto_173257 ) ) ( not ( = ?auto_173252 ?auto_173253 ) ) ( not ( = ?auto_173252 ?auto_173254 ) ) ( not ( = ?auto_173252 ?auto_173257 ) ) ( not ( = ?auto_173253 ?auto_173254 ) ) ( not ( = ?auto_173253 ?auto_173257 ) ) ( not ( = ?auto_173254 ?auto_173257 ) ) ( not ( = ?auto_173249 ?auto_173255 ) ) ( not ( = ?auto_173249 ?auto_173256 ) ) ( not ( = ?auto_173250 ?auto_173255 ) ) ( not ( = ?auto_173250 ?auto_173256 ) ) ( not ( = ?auto_173251 ?auto_173255 ) ) ( not ( = ?auto_173251 ?auto_173256 ) ) ( not ( = ?auto_173252 ?auto_173255 ) ) ( not ( = ?auto_173252 ?auto_173256 ) ) ( not ( = ?auto_173253 ?auto_173255 ) ) ( not ( = ?auto_173253 ?auto_173256 ) ) ( not ( = ?auto_173254 ?auto_173255 ) ) ( not ( = ?auto_173254 ?auto_173256 ) ) ( not ( = ?auto_173257 ?auto_173255 ) ) ( not ( = ?auto_173257 ?auto_173256 ) ) ( not ( = ?auto_173255 ?auto_173256 ) ) ( ON ?auto_173255 ?auto_173257 ) ( CLEAR ?auto_173255 ) ( HOLDING ?auto_173256 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173256 )
      ( MAKE-6PILE ?auto_173249 ?auto_173250 ?auto_173251 ?auto_173252 ?auto_173253 ?auto_173254 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173258 - BLOCK
      ?auto_173259 - BLOCK
      ?auto_173260 - BLOCK
      ?auto_173261 - BLOCK
      ?auto_173262 - BLOCK
      ?auto_173263 - BLOCK
    )
    :vars
    (
      ?auto_173264 - BLOCK
      ?auto_173266 - BLOCK
      ?auto_173265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173264 ?auto_173263 ) ( ON-TABLE ?auto_173258 ) ( ON ?auto_173259 ?auto_173258 ) ( ON ?auto_173260 ?auto_173259 ) ( ON ?auto_173261 ?auto_173260 ) ( ON ?auto_173262 ?auto_173261 ) ( ON ?auto_173263 ?auto_173262 ) ( not ( = ?auto_173258 ?auto_173259 ) ) ( not ( = ?auto_173258 ?auto_173260 ) ) ( not ( = ?auto_173258 ?auto_173261 ) ) ( not ( = ?auto_173258 ?auto_173262 ) ) ( not ( = ?auto_173258 ?auto_173263 ) ) ( not ( = ?auto_173258 ?auto_173264 ) ) ( not ( = ?auto_173259 ?auto_173260 ) ) ( not ( = ?auto_173259 ?auto_173261 ) ) ( not ( = ?auto_173259 ?auto_173262 ) ) ( not ( = ?auto_173259 ?auto_173263 ) ) ( not ( = ?auto_173259 ?auto_173264 ) ) ( not ( = ?auto_173260 ?auto_173261 ) ) ( not ( = ?auto_173260 ?auto_173262 ) ) ( not ( = ?auto_173260 ?auto_173263 ) ) ( not ( = ?auto_173260 ?auto_173264 ) ) ( not ( = ?auto_173261 ?auto_173262 ) ) ( not ( = ?auto_173261 ?auto_173263 ) ) ( not ( = ?auto_173261 ?auto_173264 ) ) ( not ( = ?auto_173262 ?auto_173263 ) ) ( not ( = ?auto_173262 ?auto_173264 ) ) ( not ( = ?auto_173263 ?auto_173264 ) ) ( not ( = ?auto_173258 ?auto_173266 ) ) ( not ( = ?auto_173258 ?auto_173265 ) ) ( not ( = ?auto_173259 ?auto_173266 ) ) ( not ( = ?auto_173259 ?auto_173265 ) ) ( not ( = ?auto_173260 ?auto_173266 ) ) ( not ( = ?auto_173260 ?auto_173265 ) ) ( not ( = ?auto_173261 ?auto_173266 ) ) ( not ( = ?auto_173261 ?auto_173265 ) ) ( not ( = ?auto_173262 ?auto_173266 ) ) ( not ( = ?auto_173262 ?auto_173265 ) ) ( not ( = ?auto_173263 ?auto_173266 ) ) ( not ( = ?auto_173263 ?auto_173265 ) ) ( not ( = ?auto_173264 ?auto_173266 ) ) ( not ( = ?auto_173264 ?auto_173265 ) ) ( not ( = ?auto_173266 ?auto_173265 ) ) ( ON ?auto_173266 ?auto_173264 ) ( ON ?auto_173265 ?auto_173266 ) ( CLEAR ?auto_173265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173258 ?auto_173259 ?auto_173260 ?auto_173261 ?auto_173262 ?auto_173263 ?auto_173264 ?auto_173266 )
      ( MAKE-6PILE ?auto_173258 ?auto_173259 ?auto_173260 ?auto_173261 ?auto_173262 ?auto_173263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173270 - BLOCK
      ?auto_173271 - BLOCK
      ?auto_173272 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_173272 ) ( CLEAR ?auto_173271 ) ( ON-TABLE ?auto_173270 ) ( ON ?auto_173271 ?auto_173270 ) ( not ( = ?auto_173270 ?auto_173271 ) ) ( not ( = ?auto_173270 ?auto_173272 ) ) ( not ( = ?auto_173271 ?auto_173272 ) ) )
    :subtasks
    ( ( !STACK ?auto_173272 ?auto_173271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173273 - BLOCK
      ?auto_173274 - BLOCK
      ?auto_173275 - BLOCK
    )
    :vars
    (
      ?auto_173276 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173274 ) ( ON-TABLE ?auto_173273 ) ( ON ?auto_173274 ?auto_173273 ) ( not ( = ?auto_173273 ?auto_173274 ) ) ( not ( = ?auto_173273 ?auto_173275 ) ) ( not ( = ?auto_173274 ?auto_173275 ) ) ( ON ?auto_173275 ?auto_173276 ) ( CLEAR ?auto_173275 ) ( HAND-EMPTY ) ( not ( = ?auto_173273 ?auto_173276 ) ) ( not ( = ?auto_173274 ?auto_173276 ) ) ( not ( = ?auto_173275 ?auto_173276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173275 ?auto_173276 )
      ( MAKE-3PILE ?auto_173273 ?auto_173274 ?auto_173275 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173277 - BLOCK
      ?auto_173278 - BLOCK
      ?auto_173279 - BLOCK
    )
    :vars
    (
      ?auto_173280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173277 ) ( not ( = ?auto_173277 ?auto_173278 ) ) ( not ( = ?auto_173277 ?auto_173279 ) ) ( not ( = ?auto_173278 ?auto_173279 ) ) ( ON ?auto_173279 ?auto_173280 ) ( CLEAR ?auto_173279 ) ( not ( = ?auto_173277 ?auto_173280 ) ) ( not ( = ?auto_173278 ?auto_173280 ) ) ( not ( = ?auto_173279 ?auto_173280 ) ) ( HOLDING ?auto_173278 ) ( CLEAR ?auto_173277 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173277 ?auto_173278 )
      ( MAKE-3PILE ?auto_173277 ?auto_173278 ?auto_173279 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173281 - BLOCK
      ?auto_173282 - BLOCK
      ?auto_173283 - BLOCK
    )
    :vars
    (
      ?auto_173284 - BLOCK
      ?auto_173287 - BLOCK
      ?auto_173285 - BLOCK
      ?auto_173288 - BLOCK
      ?auto_173286 - BLOCK
      ?auto_173289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173281 ) ( not ( = ?auto_173281 ?auto_173282 ) ) ( not ( = ?auto_173281 ?auto_173283 ) ) ( not ( = ?auto_173282 ?auto_173283 ) ) ( ON ?auto_173283 ?auto_173284 ) ( not ( = ?auto_173281 ?auto_173284 ) ) ( not ( = ?auto_173282 ?auto_173284 ) ) ( not ( = ?auto_173283 ?auto_173284 ) ) ( CLEAR ?auto_173281 ) ( ON ?auto_173282 ?auto_173283 ) ( CLEAR ?auto_173282 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173287 ) ( ON ?auto_173285 ?auto_173287 ) ( ON ?auto_173288 ?auto_173285 ) ( ON ?auto_173286 ?auto_173288 ) ( ON ?auto_173289 ?auto_173286 ) ( ON ?auto_173284 ?auto_173289 ) ( not ( = ?auto_173287 ?auto_173285 ) ) ( not ( = ?auto_173287 ?auto_173288 ) ) ( not ( = ?auto_173287 ?auto_173286 ) ) ( not ( = ?auto_173287 ?auto_173289 ) ) ( not ( = ?auto_173287 ?auto_173284 ) ) ( not ( = ?auto_173287 ?auto_173283 ) ) ( not ( = ?auto_173287 ?auto_173282 ) ) ( not ( = ?auto_173285 ?auto_173288 ) ) ( not ( = ?auto_173285 ?auto_173286 ) ) ( not ( = ?auto_173285 ?auto_173289 ) ) ( not ( = ?auto_173285 ?auto_173284 ) ) ( not ( = ?auto_173285 ?auto_173283 ) ) ( not ( = ?auto_173285 ?auto_173282 ) ) ( not ( = ?auto_173288 ?auto_173286 ) ) ( not ( = ?auto_173288 ?auto_173289 ) ) ( not ( = ?auto_173288 ?auto_173284 ) ) ( not ( = ?auto_173288 ?auto_173283 ) ) ( not ( = ?auto_173288 ?auto_173282 ) ) ( not ( = ?auto_173286 ?auto_173289 ) ) ( not ( = ?auto_173286 ?auto_173284 ) ) ( not ( = ?auto_173286 ?auto_173283 ) ) ( not ( = ?auto_173286 ?auto_173282 ) ) ( not ( = ?auto_173289 ?auto_173284 ) ) ( not ( = ?auto_173289 ?auto_173283 ) ) ( not ( = ?auto_173289 ?auto_173282 ) ) ( not ( = ?auto_173281 ?auto_173287 ) ) ( not ( = ?auto_173281 ?auto_173285 ) ) ( not ( = ?auto_173281 ?auto_173288 ) ) ( not ( = ?auto_173281 ?auto_173286 ) ) ( not ( = ?auto_173281 ?auto_173289 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173287 ?auto_173285 ?auto_173288 ?auto_173286 ?auto_173289 ?auto_173284 ?auto_173283 )
      ( MAKE-3PILE ?auto_173281 ?auto_173282 ?auto_173283 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173290 - BLOCK
      ?auto_173291 - BLOCK
      ?auto_173292 - BLOCK
    )
    :vars
    (
      ?auto_173296 - BLOCK
      ?auto_173297 - BLOCK
      ?auto_173294 - BLOCK
      ?auto_173293 - BLOCK
      ?auto_173298 - BLOCK
      ?auto_173295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173290 ?auto_173291 ) ) ( not ( = ?auto_173290 ?auto_173292 ) ) ( not ( = ?auto_173291 ?auto_173292 ) ) ( ON ?auto_173292 ?auto_173296 ) ( not ( = ?auto_173290 ?auto_173296 ) ) ( not ( = ?auto_173291 ?auto_173296 ) ) ( not ( = ?auto_173292 ?auto_173296 ) ) ( ON ?auto_173291 ?auto_173292 ) ( CLEAR ?auto_173291 ) ( ON-TABLE ?auto_173297 ) ( ON ?auto_173294 ?auto_173297 ) ( ON ?auto_173293 ?auto_173294 ) ( ON ?auto_173298 ?auto_173293 ) ( ON ?auto_173295 ?auto_173298 ) ( ON ?auto_173296 ?auto_173295 ) ( not ( = ?auto_173297 ?auto_173294 ) ) ( not ( = ?auto_173297 ?auto_173293 ) ) ( not ( = ?auto_173297 ?auto_173298 ) ) ( not ( = ?auto_173297 ?auto_173295 ) ) ( not ( = ?auto_173297 ?auto_173296 ) ) ( not ( = ?auto_173297 ?auto_173292 ) ) ( not ( = ?auto_173297 ?auto_173291 ) ) ( not ( = ?auto_173294 ?auto_173293 ) ) ( not ( = ?auto_173294 ?auto_173298 ) ) ( not ( = ?auto_173294 ?auto_173295 ) ) ( not ( = ?auto_173294 ?auto_173296 ) ) ( not ( = ?auto_173294 ?auto_173292 ) ) ( not ( = ?auto_173294 ?auto_173291 ) ) ( not ( = ?auto_173293 ?auto_173298 ) ) ( not ( = ?auto_173293 ?auto_173295 ) ) ( not ( = ?auto_173293 ?auto_173296 ) ) ( not ( = ?auto_173293 ?auto_173292 ) ) ( not ( = ?auto_173293 ?auto_173291 ) ) ( not ( = ?auto_173298 ?auto_173295 ) ) ( not ( = ?auto_173298 ?auto_173296 ) ) ( not ( = ?auto_173298 ?auto_173292 ) ) ( not ( = ?auto_173298 ?auto_173291 ) ) ( not ( = ?auto_173295 ?auto_173296 ) ) ( not ( = ?auto_173295 ?auto_173292 ) ) ( not ( = ?auto_173295 ?auto_173291 ) ) ( not ( = ?auto_173290 ?auto_173297 ) ) ( not ( = ?auto_173290 ?auto_173294 ) ) ( not ( = ?auto_173290 ?auto_173293 ) ) ( not ( = ?auto_173290 ?auto_173298 ) ) ( not ( = ?auto_173290 ?auto_173295 ) ) ( HOLDING ?auto_173290 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173290 )
      ( MAKE-3PILE ?auto_173290 ?auto_173291 ?auto_173292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173299 - BLOCK
      ?auto_173300 - BLOCK
      ?auto_173301 - BLOCK
    )
    :vars
    (
      ?auto_173304 - BLOCK
      ?auto_173305 - BLOCK
      ?auto_173303 - BLOCK
      ?auto_173307 - BLOCK
      ?auto_173306 - BLOCK
      ?auto_173302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173299 ?auto_173300 ) ) ( not ( = ?auto_173299 ?auto_173301 ) ) ( not ( = ?auto_173300 ?auto_173301 ) ) ( ON ?auto_173301 ?auto_173304 ) ( not ( = ?auto_173299 ?auto_173304 ) ) ( not ( = ?auto_173300 ?auto_173304 ) ) ( not ( = ?auto_173301 ?auto_173304 ) ) ( ON ?auto_173300 ?auto_173301 ) ( ON-TABLE ?auto_173305 ) ( ON ?auto_173303 ?auto_173305 ) ( ON ?auto_173307 ?auto_173303 ) ( ON ?auto_173306 ?auto_173307 ) ( ON ?auto_173302 ?auto_173306 ) ( ON ?auto_173304 ?auto_173302 ) ( not ( = ?auto_173305 ?auto_173303 ) ) ( not ( = ?auto_173305 ?auto_173307 ) ) ( not ( = ?auto_173305 ?auto_173306 ) ) ( not ( = ?auto_173305 ?auto_173302 ) ) ( not ( = ?auto_173305 ?auto_173304 ) ) ( not ( = ?auto_173305 ?auto_173301 ) ) ( not ( = ?auto_173305 ?auto_173300 ) ) ( not ( = ?auto_173303 ?auto_173307 ) ) ( not ( = ?auto_173303 ?auto_173306 ) ) ( not ( = ?auto_173303 ?auto_173302 ) ) ( not ( = ?auto_173303 ?auto_173304 ) ) ( not ( = ?auto_173303 ?auto_173301 ) ) ( not ( = ?auto_173303 ?auto_173300 ) ) ( not ( = ?auto_173307 ?auto_173306 ) ) ( not ( = ?auto_173307 ?auto_173302 ) ) ( not ( = ?auto_173307 ?auto_173304 ) ) ( not ( = ?auto_173307 ?auto_173301 ) ) ( not ( = ?auto_173307 ?auto_173300 ) ) ( not ( = ?auto_173306 ?auto_173302 ) ) ( not ( = ?auto_173306 ?auto_173304 ) ) ( not ( = ?auto_173306 ?auto_173301 ) ) ( not ( = ?auto_173306 ?auto_173300 ) ) ( not ( = ?auto_173302 ?auto_173304 ) ) ( not ( = ?auto_173302 ?auto_173301 ) ) ( not ( = ?auto_173302 ?auto_173300 ) ) ( not ( = ?auto_173299 ?auto_173305 ) ) ( not ( = ?auto_173299 ?auto_173303 ) ) ( not ( = ?auto_173299 ?auto_173307 ) ) ( not ( = ?auto_173299 ?auto_173306 ) ) ( not ( = ?auto_173299 ?auto_173302 ) ) ( ON ?auto_173299 ?auto_173300 ) ( CLEAR ?auto_173299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173305 ?auto_173303 ?auto_173307 ?auto_173306 ?auto_173302 ?auto_173304 ?auto_173301 ?auto_173300 )
      ( MAKE-3PILE ?auto_173299 ?auto_173300 ?auto_173301 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173313 - BLOCK
      ?auto_173314 - BLOCK
      ?auto_173315 - BLOCK
      ?auto_173316 - BLOCK
      ?auto_173317 - BLOCK
    )
    :vars
    (
      ?auto_173318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173318 ?auto_173317 ) ( CLEAR ?auto_173318 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173313 ) ( ON ?auto_173314 ?auto_173313 ) ( ON ?auto_173315 ?auto_173314 ) ( ON ?auto_173316 ?auto_173315 ) ( ON ?auto_173317 ?auto_173316 ) ( not ( = ?auto_173313 ?auto_173314 ) ) ( not ( = ?auto_173313 ?auto_173315 ) ) ( not ( = ?auto_173313 ?auto_173316 ) ) ( not ( = ?auto_173313 ?auto_173317 ) ) ( not ( = ?auto_173313 ?auto_173318 ) ) ( not ( = ?auto_173314 ?auto_173315 ) ) ( not ( = ?auto_173314 ?auto_173316 ) ) ( not ( = ?auto_173314 ?auto_173317 ) ) ( not ( = ?auto_173314 ?auto_173318 ) ) ( not ( = ?auto_173315 ?auto_173316 ) ) ( not ( = ?auto_173315 ?auto_173317 ) ) ( not ( = ?auto_173315 ?auto_173318 ) ) ( not ( = ?auto_173316 ?auto_173317 ) ) ( not ( = ?auto_173316 ?auto_173318 ) ) ( not ( = ?auto_173317 ?auto_173318 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173318 ?auto_173317 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173319 - BLOCK
      ?auto_173320 - BLOCK
      ?auto_173321 - BLOCK
      ?auto_173322 - BLOCK
      ?auto_173323 - BLOCK
    )
    :vars
    (
      ?auto_173324 - BLOCK
      ?auto_173325 - BLOCK
      ?auto_173326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173324 ?auto_173323 ) ( CLEAR ?auto_173324 ) ( ON-TABLE ?auto_173319 ) ( ON ?auto_173320 ?auto_173319 ) ( ON ?auto_173321 ?auto_173320 ) ( ON ?auto_173322 ?auto_173321 ) ( ON ?auto_173323 ?auto_173322 ) ( not ( = ?auto_173319 ?auto_173320 ) ) ( not ( = ?auto_173319 ?auto_173321 ) ) ( not ( = ?auto_173319 ?auto_173322 ) ) ( not ( = ?auto_173319 ?auto_173323 ) ) ( not ( = ?auto_173319 ?auto_173324 ) ) ( not ( = ?auto_173320 ?auto_173321 ) ) ( not ( = ?auto_173320 ?auto_173322 ) ) ( not ( = ?auto_173320 ?auto_173323 ) ) ( not ( = ?auto_173320 ?auto_173324 ) ) ( not ( = ?auto_173321 ?auto_173322 ) ) ( not ( = ?auto_173321 ?auto_173323 ) ) ( not ( = ?auto_173321 ?auto_173324 ) ) ( not ( = ?auto_173322 ?auto_173323 ) ) ( not ( = ?auto_173322 ?auto_173324 ) ) ( not ( = ?auto_173323 ?auto_173324 ) ) ( HOLDING ?auto_173325 ) ( CLEAR ?auto_173326 ) ( not ( = ?auto_173319 ?auto_173325 ) ) ( not ( = ?auto_173319 ?auto_173326 ) ) ( not ( = ?auto_173320 ?auto_173325 ) ) ( not ( = ?auto_173320 ?auto_173326 ) ) ( not ( = ?auto_173321 ?auto_173325 ) ) ( not ( = ?auto_173321 ?auto_173326 ) ) ( not ( = ?auto_173322 ?auto_173325 ) ) ( not ( = ?auto_173322 ?auto_173326 ) ) ( not ( = ?auto_173323 ?auto_173325 ) ) ( not ( = ?auto_173323 ?auto_173326 ) ) ( not ( = ?auto_173324 ?auto_173325 ) ) ( not ( = ?auto_173324 ?auto_173326 ) ) ( not ( = ?auto_173325 ?auto_173326 ) ) )
    :subtasks
    ( ( !STACK ?auto_173325 ?auto_173326 )
      ( MAKE-5PILE ?auto_173319 ?auto_173320 ?auto_173321 ?auto_173322 ?auto_173323 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173327 - BLOCK
      ?auto_173328 - BLOCK
      ?auto_173329 - BLOCK
      ?auto_173330 - BLOCK
      ?auto_173331 - BLOCK
    )
    :vars
    (
      ?auto_173332 - BLOCK
      ?auto_173334 - BLOCK
      ?auto_173333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173332 ?auto_173331 ) ( ON-TABLE ?auto_173327 ) ( ON ?auto_173328 ?auto_173327 ) ( ON ?auto_173329 ?auto_173328 ) ( ON ?auto_173330 ?auto_173329 ) ( ON ?auto_173331 ?auto_173330 ) ( not ( = ?auto_173327 ?auto_173328 ) ) ( not ( = ?auto_173327 ?auto_173329 ) ) ( not ( = ?auto_173327 ?auto_173330 ) ) ( not ( = ?auto_173327 ?auto_173331 ) ) ( not ( = ?auto_173327 ?auto_173332 ) ) ( not ( = ?auto_173328 ?auto_173329 ) ) ( not ( = ?auto_173328 ?auto_173330 ) ) ( not ( = ?auto_173328 ?auto_173331 ) ) ( not ( = ?auto_173328 ?auto_173332 ) ) ( not ( = ?auto_173329 ?auto_173330 ) ) ( not ( = ?auto_173329 ?auto_173331 ) ) ( not ( = ?auto_173329 ?auto_173332 ) ) ( not ( = ?auto_173330 ?auto_173331 ) ) ( not ( = ?auto_173330 ?auto_173332 ) ) ( not ( = ?auto_173331 ?auto_173332 ) ) ( CLEAR ?auto_173334 ) ( not ( = ?auto_173327 ?auto_173333 ) ) ( not ( = ?auto_173327 ?auto_173334 ) ) ( not ( = ?auto_173328 ?auto_173333 ) ) ( not ( = ?auto_173328 ?auto_173334 ) ) ( not ( = ?auto_173329 ?auto_173333 ) ) ( not ( = ?auto_173329 ?auto_173334 ) ) ( not ( = ?auto_173330 ?auto_173333 ) ) ( not ( = ?auto_173330 ?auto_173334 ) ) ( not ( = ?auto_173331 ?auto_173333 ) ) ( not ( = ?auto_173331 ?auto_173334 ) ) ( not ( = ?auto_173332 ?auto_173333 ) ) ( not ( = ?auto_173332 ?auto_173334 ) ) ( not ( = ?auto_173333 ?auto_173334 ) ) ( ON ?auto_173333 ?auto_173332 ) ( CLEAR ?auto_173333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173327 ?auto_173328 ?auto_173329 ?auto_173330 ?auto_173331 ?auto_173332 )
      ( MAKE-5PILE ?auto_173327 ?auto_173328 ?auto_173329 ?auto_173330 ?auto_173331 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173335 - BLOCK
      ?auto_173336 - BLOCK
      ?auto_173337 - BLOCK
      ?auto_173338 - BLOCK
      ?auto_173339 - BLOCK
    )
    :vars
    (
      ?auto_173341 - BLOCK
      ?auto_173340 - BLOCK
      ?auto_173342 - BLOCK
      ?auto_173343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173341 ?auto_173339 ) ( ON-TABLE ?auto_173335 ) ( ON ?auto_173336 ?auto_173335 ) ( ON ?auto_173337 ?auto_173336 ) ( ON ?auto_173338 ?auto_173337 ) ( ON ?auto_173339 ?auto_173338 ) ( not ( = ?auto_173335 ?auto_173336 ) ) ( not ( = ?auto_173335 ?auto_173337 ) ) ( not ( = ?auto_173335 ?auto_173338 ) ) ( not ( = ?auto_173335 ?auto_173339 ) ) ( not ( = ?auto_173335 ?auto_173341 ) ) ( not ( = ?auto_173336 ?auto_173337 ) ) ( not ( = ?auto_173336 ?auto_173338 ) ) ( not ( = ?auto_173336 ?auto_173339 ) ) ( not ( = ?auto_173336 ?auto_173341 ) ) ( not ( = ?auto_173337 ?auto_173338 ) ) ( not ( = ?auto_173337 ?auto_173339 ) ) ( not ( = ?auto_173337 ?auto_173341 ) ) ( not ( = ?auto_173338 ?auto_173339 ) ) ( not ( = ?auto_173338 ?auto_173341 ) ) ( not ( = ?auto_173339 ?auto_173341 ) ) ( not ( = ?auto_173335 ?auto_173340 ) ) ( not ( = ?auto_173335 ?auto_173342 ) ) ( not ( = ?auto_173336 ?auto_173340 ) ) ( not ( = ?auto_173336 ?auto_173342 ) ) ( not ( = ?auto_173337 ?auto_173340 ) ) ( not ( = ?auto_173337 ?auto_173342 ) ) ( not ( = ?auto_173338 ?auto_173340 ) ) ( not ( = ?auto_173338 ?auto_173342 ) ) ( not ( = ?auto_173339 ?auto_173340 ) ) ( not ( = ?auto_173339 ?auto_173342 ) ) ( not ( = ?auto_173341 ?auto_173340 ) ) ( not ( = ?auto_173341 ?auto_173342 ) ) ( not ( = ?auto_173340 ?auto_173342 ) ) ( ON ?auto_173340 ?auto_173341 ) ( CLEAR ?auto_173340 ) ( HOLDING ?auto_173342 ) ( CLEAR ?auto_173343 ) ( ON-TABLE ?auto_173343 ) ( not ( = ?auto_173343 ?auto_173342 ) ) ( not ( = ?auto_173335 ?auto_173343 ) ) ( not ( = ?auto_173336 ?auto_173343 ) ) ( not ( = ?auto_173337 ?auto_173343 ) ) ( not ( = ?auto_173338 ?auto_173343 ) ) ( not ( = ?auto_173339 ?auto_173343 ) ) ( not ( = ?auto_173341 ?auto_173343 ) ) ( not ( = ?auto_173340 ?auto_173343 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173343 ?auto_173342 )
      ( MAKE-5PILE ?auto_173335 ?auto_173336 ?auto_173337 ?auto_173338 ?auto_173339 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_174863 - BLOCK
      ?auto_174864 - BLOCK
      ?auto_174865 - BLOCK
      ?auto_174866 - BLOCK
      ?auto_174867 - BLOCK
    )
    :vars
    (
      ?auto_174870 - BLOCK
      ?auto_174869 - BLOCK
      ?auto_174868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174870 ?auto_174867 ) ( ON-TABLE ?auto_174863 ) ( ON ?auto_174864 ?auto_174863 ) ( ON ?auto_174865 ?auto_174864 ) ( ON ?auto_174866 ?auto_174865 ) ( ON ?auto_174867 ?auto_174866 ) ( not ( = ?auto_174863 ?auto_174864 ) ) ( not ( = ?auto_174863 ?auto_174865 ) ) ( not ( = ?auto_174863 ?auto_174866 ) ) ( not ( = ?auto_174863 ?auto_174867 ) ) ( not ( = ?auto_174863 ?auto_174870 ) ) ( not ( = ?auto_174864 ?auto_174865 ) ) ( not ( = ?auto_174864 ?auto_174866 ) ) ( not ( = ?auto_174864 ?auto_174867 ) ) ( not ( = ?auto_174864 ?auto_174870 ) ) ( not ( = ?auto_174865 ?auto_174866 ) ) ( not ( = ?auto_174865 ?auto_174867 ) ) ( not ( = ?auto_174865 ?auto_174870 ) ) ( not ( = ?auto_174866 ?auto_174867 ) ) ( not ( = ?auto_174866 ?auto_174870 ) ) ( not ( = ?auto_174867 ?auto_174870 ) ) ( not ( = ?auto_174863 ?auto_174869 ) ) ( not ( = ?auto_174863 ?auto_174868 ) ) ( not ( = ?auto_174864 ?auto_174869 ) ) ( not ( = ?auto_174864 ?auto_174868 ) ) ( not ( = ?auto_174865 ?auto_174869 ) ) ( not ( = ?auto_174865 ?auto_174868 ) ) ( not ( = ?auto_174866 ?auto_174869 ) ) ( not ( = ?auto_174866 ?auto_174868 ) ) ( not ( = ?auto_174867 ?auto_174869 ) ) ( not ( = ?auto_174867 ?auto_174868 ) ) ( not ( = ?auto_174870 ?auto_174869 ) ) ( not ( = ?auto_174870 ?auto_174868 ) ) ( not ( = ?auto_174869 ?auto_174868 ) ) ( ON ?auto_174869 ?auto_174870 ) ( ON ?auto_174868 ?auto_174869 ) ( CLEAR ?auto_174868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174863 ?auto_174864 ?auto_174865 ?auto_174866 ?auto_174867 ?auto_174870 ?auto_174869 )
      ( MAKE-5PILE ?auto_174863 ?auto_174864 ?auto_174865 ?auto_174866 ?auto_174867 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173353 - BLOCK
      ?auto_173354 - BLOCK
      ?auto_173355 - BLOCK
      ?auto_173356 - BLOCK
      ?auto_173357 - BLOCK
    )
    :vars
    (
      ?auto_173361 - BLOCK
      ?auto_173359 - BLOCK
      ?auto_173360 - BLOCK
      ?auto_173358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173361 ?auto_173357 ) ( ON-TABLE ?auto_173353 ) ( ON ?auto_173354 ?auto_173353 ) ( ON ?auto_173355 ?auto_173354 ) ( ON ?auto_173356 ?auto_173355 ) ( ON ?auto_173357 ?auto_173356 ) ( not ( = ?auto_173353 ?auto_173354 ) ) ( not ( = ?auto_173353 ?auto_173355 ) ) ( not ( = ?auto_173353 ?auto_173356 ) ) ( not ( = ?auto_173353 ?auto_173357 ) ) ( not ( = ?auto_173353 ?auto_173361 ) ) ( not ( = ?auto_173354 ?auto_173355 ) ) ( not ( = ?auto_173354 ?auto_173356 ) ) ( not ( = ?auto_173354 ?auto_173357 ) ) ( not ( = ?auto_173354 ?auto_173361 ) ) ( not ( = ?auto_173355 ?auto_173356 ) ) ( not ( = ?auto_173355 ?auto_173357 ) ) ( not ( = ?auto_173355 ?auto_173361 ) ) ( not ( = ?auto_173356 ?auto_173357 ) ) ( not ( = ?auto_173356 ?auto_173361 ) ) ( not ( = ?auto_173357 ?auto_173361 ) ) ( not ( = ?auto_173353 ?auto_173359 ) ) ( not ( = ?auto_173353 ?auto_173360 ) ) ( not ( = ?auto_173354 ?auto_173359 ) ) ( not ( = ?auto_173354 ?auto_173360 ) ) ( not ( = ?auto_173355 ?auto_173359 ) ) ( not ( = ?auto_173355 ?auto_173360 ) ) ( not ( = ?auto_173356 ?auto_173359 ) ) ( not ( = ?auto_173356 ?auto_173360 ) ) ( not ( = ?auto_173357 ?auto_173359 ) ) ( not ( = ?auto_173357 ?auto_173360 ) ) ( not ( = ?auto_173361 ?auto_173359 ) ) ( not ( = ?auto_173361 ?auto_173360 ) ) ( not ( = ?auto_173359 ?auto_173360 ) ) ( ON ?auto_173359 ?auto_173361 ) ( not ( = ?auto_173358 ?auto_173360 ) ) ( not ( = ?auto_173353 ?auto_173358 ) ) ( not ( = ?auto_173354 ?auto_173358 ) ) ( not ( = ?auto_173355 ?auto_173358 ) ) ( not ( = ?auto_173356 ?auto_173358 ) ) ( not ( = ?auto_173357 ?auto_173358 ) ) ( not ( = ?auto_173361 ?auto_173358 ) ) ( not ( = ?auto_173359 ?auto_173358 ) ) ( ON ?auto_173360 ?auto_173359 ) ( CLEAR ?auto_173360 ) ( HOLDING ?auto_173358 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173358 )
      ( MAKE-5PILE ?auto_173353 ?auto_173354 ?auto_173355 ?auto_173356 ?auto_173357 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173362 - BLOCK
      ?auto_173363 - BLOCK
      ?auto_173364 - BLOCK
      ?auto_173365 - BLOCK
      ?auto_173366 - BLOCK
    )
    :vars
    (
      ?auto_173367 - BLOCK
      ?auto_173370 - BLOCK
      ?auto_173368 - BLOCK
      ?auto_173369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173367 ?auto_173366 ) ( ON-TABLE ?auto_173362 ) ( ON ?auto_173363 ?auto_173362 ) ( ON ?auto_173364 ?auto_173363 ) ( ON ?auto_173365 ?auto_173364 ) ( ON ?auto_173366 ?auto_173365 ) ( not ( = ?auto_173362 ?auto_173363 ) ) ( not ( = ?auto_173362 ?auto_173364 ) ) ( not ( = ?auto_173362 ?auto_173365 ) ) ( not ( = ?auto_173362 ?auto_173366 ) ) ( not ( = ?auto_173362 ?auto_173367 ) ) ( not ( = ?auto_173363 ?auto_173364 ) ) ( not ( = ?auto_173363 ?auto_173365 ) ) ( not ( = ?auto_173363 ?auto_173366 ) ) ( not ( = ?auto_173363 ?auto_173367 ) ) ( not ( = ?auto_173364 ?auto_173365 ) ) ( not ( = ?auto_173364 ?auto_173366 ) ) ( not ( = ?auto_173364 ?auto_173367 ) ) ( not ( = ?auto_173365 ?auto_173366 ) ) ( not ( = ?auto_173365 ?auto_173367 ) ) ( not ( = ?auto_173366 ?auto_173367 ) ) ( not ( = ?auto_173362 ?auto_173370 ) ) ( not ( = ?auto_173362 ?auto_173368 ) ) ( not ( = ?auto_173363 ?auto_173370 ) ) ( not ( = ?auto_173363 ?auto_173368 ) ) ( not ( = ?auto_173364 ?auto_173370 ) ) ( not ( = ?auto_173364 ?auto_173368 ) ) ( not ( = ?auto_173365 ?auto_173370 ) ) ( not ( = ?auto_173365 ?auto_173368 ) ) ( not ( = ?auto_173366 ?auto_173370 ) ) ( not ( = ?auto_173366 ?auto_173368 ) ) ( not ( = ?auto_173367 ?auto_173370 ) ) ( not ( = ?auto_173367 ?auto_173368 ) ) ( not ( = ?auto_173370 ?auto_173368 ) ) ( ON ?auto_173370 ?auto_173367 ) ( not ( = ?auto_173369 ?auto_173368 ) ) ( not ( = ?auto_173362 ?auto_173369 ) ) ( not ( = ?auto_173363 ?auto_173369 ) ) ( not ( = ?auto_173364 ?auto_173369 ) ) ( not ( = ?auto_173365 ?auto_173369 ) ) ( not ( = ?auto_173366 ?auto_173369 ) ) ( not ( = ?auto_173367 ?auto_173369 ) ) ( not ( = ?auto_173370 ?auto_173369 ) ) ( ON ?auto_173368 ?auto_173370 ) ( ON ?auto_173369 ?auto_173368 ) ( CLEAR ?auto_173369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173362 ?auto_173363 ?auto_173364 ?auto_173365 ?auto_173366 ?auto_173367 ?auto_173370 ?auto_173368 )
      ( MAKE-5PILE ?auto_173362 ?auto_173363 ?auto_173364 ?auto_173365 ?auto_173366 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173375 - BLOCK
      ?auto_173376 - BLOCK
      ?auto_173377 - BLOCK
      ?auto_173378 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_173378 ) ( CLEAR ?auto_173377 ) ( ON-TABLE ?auto_173375 ) ( ON ?auto_173376 ?auto_173375 ) ( ON ?auto_173377 ?auto_173376 ) ( not ( = ?auto_173375 ?auto_173376 ) ) ( not ( = ?auto_173375 ?auto_173377 ) ) ( not ( = ?auto_173375 ?auto_173378 ) ) ( not ( = ?auto_173376 ?auto_173377 ) ) ( not ( = ?auto_173376 ?auto_173378 ) ) ( not ( = ?auto_173377 ?auto_173378 ) ) )
    :subtasks
    ( ( !STACK ?auto_173378 ?auto_173377 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173379 - BLOCK
      ?auto_173380 - BLOCK
      ?auto_173381 - BLOCK
      ?auto_173382 - BLOCK
    )
    :vars
    (
      ?auto_173383 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173381 ) ( ON-TABLE ?auto_173379 ) ( ON ?auto_173380 ?auto_173379 ) ( ON ?auto_173381 ?auto_173380 ) ( not ( = ?auto_173379 ?auto_173380 ) ) ( not ( = ?auto_173379 ?auto_173381 ) ) ( not ( = ?auto_173379 ?auto_173382 ) ) ( not ( = ?auto_173380 ?auto_173381 ) ) ( not ( = ?auto_173380 ?auto_173382 ) ) ( not ( = ?auto_173381 ?auto_173382 ) ) ( ON ?auto_173382 ?auto_173383 ) ( CLEAR ?auto_173382 ) ( HAND-EMPTY ) ( not ( = ?auto_173379 ?auto_173383 ) ) ( not ( = ?auto_173380 ?auto_173383 ) ) ( not ( = ?auto_173381 ?auto_173383 ) ) ( not ( = ?auto_173382 ?auto_173383 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173382 ?auto_173383 )
      ( MAKE-4PILE ?auto_173379 ?auto_173380 ?auto_173381 ?auto_173382 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173384 - BLOCK
      ?auto_173385 - BLOCK
      ?auto_173386 - BLOCK
      ?auto_173387 - BLOCK
    )
    :vars
    (
      ?auto_173388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173384 ) ( ON ?auto_173385 ?auto_173384 ) ( not ( = ?auto_173384 ?auto_173385 ) ) ( not ( = ?auto_173384 ?auto_173386 ) ) ( not ( = ?auto_173384 ?auto_173387 ) ) ( not ( = ?auto_173385 ?auto_173386 ) ) ( not ( = ?auto_173385 ?auto_173387 ) ) ( not ( = ?auto_173386 ?auto_173387 ) ) ( ON ?auto_173387 ?auto_173388 ) ( CLEAR ?auto_173387 ) ( not ( = ?auto_173384 ?auto_173388 ) ) ( not ( = ?auto_173385 ?auto_173388 ) ) ( not ( = ?auto_173386 ?auto_173388 ) ) ( not ( = ?auto_173387 ?auto_173388 ) ) ( HOLDING ?auto_173386 ) ( CLEAR ?auto_173385 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173384 ?auto_173385 ?auto_173386 )
      ( MAKE-4PILE ?auto_173384 ?auto_173385 ?auto_173386 ?auto_173387 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173389 - BLOCK
      ?auto_173390 - BLOCK
      ?auto_173391 - BLOCK
      ?auto_173392 - BLOCK
    )
    :vars
    (
      ?auto_173393 - BLOCK
      ?auto_173396 - BLOCK
      ?auto_173395 - BLOCK
      ?auto_173394 - BLOCK
      ?auto_173397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173389 ) ( ON ?auto_173390 ?auto_173389 ) ( not ( = ?auto_173389 ?auto_173390 ) ) ( not ( = ?auto_173389 ?auto_173391 ) ) ( not ( = ?auto_173389 ?auto_173392 ) ) ( not ( = ?auto_173390 ?auto_173391 ) ) ( not ( = ?auto_173390 ?auto_173392 ) ) ( not ( = ?auto_173391 ?auto_173392 ) ) ( ON ?auto_173392 ?auto_173393 ) ( not ( = ?auto_173389 ?auto_173393 ) ) ( not ( = ?auto_173390 ?auto_173393 ) ) ( not ( = ?auto_173391 ?auto_173393 ) ) ( not ( = ?auto_173392 ?auto_173393 ) ) ( CLEAR ?auto_173390 ) ( ON ?auto_173391 ?auto_173392 ) ( CLEAR ?auto_173391 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173396 ) ( ON ?auto_173395 ?auto_173396 ) ( ON ?auto_173394 ?auto_173395 ) ( ON ?auto_173397 ?auto_173394 ) ( ON ?auto_173393 ?auto_173397 ) ( not ( = ?auto_173396 ?auto_173395 ) ) ( not ( = ?auto_173396 ?auto_173394 ) ) ( not ( = ?auto_173396 ?auto_173397 ) ) ( not ( = ?auto_173396 ?auto_173393 ) ) ( not ( = ?auto_173396 ?auto_173392 ) ) ( not ( = ?auto_173396 ?auto_173391 ) ) ( not ( = ?auto_173395 ?auto_173394 ) ) ( not ( = ?auto_173395 ?auto_173397 ) ) ( not ( = ?auto_173395 ?auto_173393 ) ) ( not ( = ?auto_173395 ?auto_173392 ) ) ( not ( = ?auto_173395 ?auto_173391 ) ) ( not ( = ?auto_173394 ?auto_173397 ) ) ( not ( = ?auto_173394 ?auto_173393 ) ) ( not ( = ?auto_173394 ?auto_173392 ) ) ( not ( = ?auto_173394 ?auto_173391 ) ) ( not ( = ?auto_173397 ?auto_173393 ) ) ( not ( = ?auto_173397 ?auto_173392 ) ) ( not ( = ?auto_173397 ?auto_173391 ) ) ( not ( = ?auto_173389 ?auto_173396 ) ) ( not ( = ?auto_173389 ?auto_173395 ) ) ( not ( = ?auto_173389 ?auto_173394 ) ) ( not ( = ?auto_173389 ?auto_173397 ) ) ( not ( = ?auto_173390 ?auto_173396 ) ) ( not ( = ?auto_173390 ?auto_173395 ) ) ( not ( = ?auto_173390 ?auto_173394 ) ) ( not ( = ?auto_173390 ?auto_173397 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173396 ?auto_173395 ?auto_173394 ?auto_173397 ?auto_173393 ?auto_173392 )
      ( MAKE-4PILE ?auto_173389 ?auto_173390 ?auto_173391 ?auto_173392 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173398 - BLOCK
      ?auto_173399 - BLOCK
      ?auto_173400 - BLOCK
      ?auto_173401 - BLOCK
    )
    :vars
    (
      ?auto_173406 - BLOCK
      ?auto_173404 - BLOCK
      ?auto_173403 - BLOCK
      ?auto_173405 - BLOCK
      ?auto_173402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173398 ) ( not ( = ?auto_173398 ?auto_173399 ) ) ( not ( = ?auto_173398 ?auto_173400 ) ) ( not ( = ?auto_173398 ?auto_173401 ) ) ( not ( = ?auto_173399 ?auto_173400 ) ) ( not ( = ?auto_173399 ?auto_173401 ) ) ( not ( = ?auto_173400 ?auto_173401 ) ) ( ON ?auto_173401 ?auto_173406 ) ( not ( = ?auto_173398 ?auto_173406 ) ) ( not ( = ?auto_173399 ?auto_173406 ) ) ( not ( = ?auto_173400 ?auto_173406 ) ) ( not ( = ?auto_173401 ?auto_173406 ) ) ( ON ?auto_173400 ?auto_173401 ) ( CLEAR ?auto_173400 ) ( ON-TABLE ?auto_173404 ) ( ON ?auto_173403 ?auto_173404 ) ( ON ?auto_173405 ?auto_173403 ) ( ON ?auto_173402 ?auto_173405 ) ( ON ?auto_173406 ?auto_173402 ) ( not ( = ?auto_173404 ?auto_173403 ) ) ( not ( = ?auto_173404 ?auto_173405 ) ) ( not ( = ?auto_173404 ?auto_173402 ) ) ( not ( = ?auto_173404 ?auto_173406 ) ) ( not ( = ?auto_173404 ?auto_173401 ) ) ( not ( = ?auto_173404 ?auto_173400 ) ) ( not ( = ?auto_173403 ?auto_173405 ) ) ( not ( = ?auto_173403 ?auto_173402 ) ) ( not ( = ?auto_173403 ?auto_173406 ) ) ( not ( = ?auto_173403 ?auto_173401 ) ) ( not ( = ?auto_173403 ?auto_173400 ) ) ( not ( = ?auto_173405 ?auto_173402 ) ) ( not ( = ?auto_173405 ?auto_173406 ) ) ( not ( = ?auto_173405 ?auto_173401 ) ) ( not ( = ?auto_173405 ?auto_173400 ) ) ( not ( = ?auto_173402 ?auto_173406 ) ) ( not ( = ?auto_173402 ?auto_173401 ) ) ( not ( = ?auto_173402 ?auto_173400 ) ) ( not ( = ?auto_173398 ?auto_173404 ) ) ( not ( = ?auto_173398 ?auto_173403 ) ) ( not ( = ?auto_173398 ?auto_173405 ) ) ( not ( = ?auto_173398 ?auto_173402 ) ) ( not ( = ?auto_173399 ?auto_173404 ) ) ( not ( = ?auto_173399 ?auto_173403 ) ) ( not ( = ?auto_173399 ?auto_173405 ) ) ( not ( = ?auto_173399 ?auto_173402 ) ) ( HOLDING ?auto_173399 ) ( CLEAR ?auto_173398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173398 ?auto_173399 )
      ( MAKE-4PILE ?auto_173398 ?auto_173399 ?auto_173400 ?auto_173401 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173407 - BLOCK
      ?auto_173408 - BLOCK
      ?auto_173409 - BLOCK
      ?auto_173410 - BLOCK
    )
    :vars
    (
      ?auto_173415 - BLOCK
      ?auto_173411 - BLOCK
      ?auto_173414 - BLOCK
      ?auto_173413 - BLOCK
      ?auto_173412 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173407 ) ( not ( = ?auto_173407 ?auto_173408 ) ) ( not ( = ?auto_173407 ?auto_173409 ) ) ( not ( = ?auto_173407 ?auto_173410 ) ) ( not ( = ?auto_173408 ?auto_173409 ) ) ( not ( = ?auto_173408 ?auto_173410 ) ) ( not ( = ?auto_173409 ?auto_173410 ) ) ( ON ?auto_173410 ?auto_173415 ) ( not ( = ?auto_173407 ?auto_173415 ) ) ( not ( = ?auto_173408 ?auto_173415 ) ) ( not ( = ?auto_173409 ?auto_173415 ) ) ( not ( = ?auto_173410 ?auto_173415 ) ) ( ON ?auto_173409 ?auto_173410 ) ( ON-TABLE ?auto_173411 ) ( ON ?auto_173414 ?auto_173411 ) ( ON ?auto_173413 ?auto_173414 ) ( ON ?auto_173412 ?auto_173413 ) ( ON ?auto_173415 ?auto_173412 ) ( not ( = ?auto_173411 ?auto_173414 ) ) ( not ( = ?auto_173411 ?auto_173413 ) ) ( not ( = ?auto_173411 ?auto_173412 ) ) ( not ( = ?auto_173411 ?auto_173415 ) ) ( not ( = ?auto_173411 ?auto_173410 ) ) ( not ( = ?auto_173411 ?auto_173409 ) ) ( not ( = ?auto_173414 ?auto_173413 ) ) ( not ( = ?auto_173414 ?auto_173412 ) ) ( not ( = ?auto_173414 ?auto_173415 ) ) ( not ( = ?auto_173414 ?auto_173410 ) ) ( not ( = ?auto_173414 ?auto_173409 ) ) ( not ( = ?auto_173413 ?auto_173412 ) ) ( not ( = ?auto_173413 ?auto_173415 ) ) ( not ( = ?auto_173413 ?auto_173410 ) ) ( not ( = ?auto_173413 ?auto_173409 ) ) ( not ( = ?auto_173412 ?auto_173415 ) ) ( not ( = ?auto_173412 ?auto_173410 ) ) ( not ( = ?auto_173412 ?auto_173409 ) ) ( not ( = ?auto_173407 ?auto_173411 ) ) ( not ( = ?auto_173407 ?auto_173414 ) ) ( not ( = ?auto_173407 ?auto_173413 ) ) ( not ( = ?auto_173407 ?auto_173412 ) ) ( not ( = ?auto_173408 ?auto_173411 ) ) ( not ( = ?auto_173408 ?auto_173414 ) ) ( not ( = ?auto_173408 ?auto_173413 ) ) ( not ( = ?auto_173408 ?auto_173412 ) ) ( CLEAR ?auto_173407 ) ( ON ?auto_173408 ?auto_173409 ) ( CLEAR ?auto_173408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173411 ?auto_173414 ?auto_173413 ?auto_173412 ?auto_173415 ?auto_173410 ?auto_173409 )
      ( MAKE-4PILE ?auto_173407 ?auto_173408 ?auto_173409 ?auto_173410 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173416 - BLOCK
      ?auto_173417 - BLOCK
      ?auto_173418 - BLOCK
      ?auto_173419 - BLOCK
    )
    :vars
    (
      ?auto_173422 - BLOCK
      ?auto_173424 - BLOCK
      ?auto_173420 - BLOCK
      ?auto_173423 - BLOCK
      ?auto_173421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173416 ?auto_173417 ) ) ( not ( = ?auto_173416 ?auto_173418 ) ) ( not ( = ?auto_173416 ?auto_173419 ) ) ( not ( = ?auto_173417 ?auto_173418 ) ) ( not ( = ?auto_173417 ?auto_173419 ) ) ( not ( = ?auto_173418 ?auto_173419 ) ) ( ON ?auto_173419 ?auto_173422 ) ( not ( = ?auto_173416 ?auto_173422 ) ) ( not ( = ?auto_173417 ?auto_173422 ) ) ( not ( = ?auto_173418 ?auto_173422 ) ) ( not ( = ?auto_173419 ?auto_173422 ) ) ( ON ?auto_173418 ?auto_173419 ) ( ON-TABLE ?auto_173424 ) ( ON ?auto_173420 ?auto_173424 ) ( ON ?auto_173423 ?auto_173420 ) ( ON ?auto_173421 ?auto_173423 ) ( ON ?auto_173422 ?auto_173421 ) ( not ( = ?auto_173424 ?auto_173420 ) ) ( not ( = ?auto_173424 ?auto_173423 ) ) ( not ( = ?auto_173424 ?auto_173421 ) ) ( not ( = ?auto_173424 ?auto_173422 ) ) ( not ( = ?auto_173424 ?auto_173419 ) ) ( not ( = ?auto_173424 ?auto_173418 ) ) ( not ( = ?auto_173420 ?auto_173423 ) ) ( not ( = ?auto_173420 ?auto_173421 ) ) ( not ( = ?auto_173420 ?auto_173422 ) ) ( not ( = ?auto_173420 ?auto_173419 ) ) ( not ( = ?auto_173420 ?auto_173418 ) ) ( not ( = ?auto_173423 ?auto_173421 ) ) ( not ( = ?auto_173423 ?auto_173422 ) ) ( not ( = ?auto_173423 ?auto_173419 ) ) ( not ( = ?auto_173423 ?auto_173418 ) ) ( not ( = ?auto_173421 ?auto_173422 ) ) ( not ( = ?auto_173421 ?auto_173419 ) ) ( not ( = ?auto_173421 ?auto_173418 ) ) ( not ( = ?auto_173416 ?auto_173424 ) ) ( not ( = ?auto_173416 ?auto_173420 ) ) ( not ( = ?auto_173416 ?auto_173423 ) ) ( not ( = ?auto_173416 ?auto_173421 ) ) ( not ( = ?auto_173417 ?auto_173424 ) ) ( not ( = ?auto_173417 ?auto_173420 ) ) ( not ( = ?auto_173417 ?auto_173423 ) ) ( not ( = ?auto_173417 ?auto_173421 ) ) ( ON ?auto_173417 ?auto_173418 ) ( CLEAR ?auto_173417 ) ( HOLDING ?auto_173416 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173416 )
      ( MAKE-4PILE ?auto_173416 ?auto_173417 ?auto_173418 ?auto_173419 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173425 - BLOCK
      ?auto_173426 - BLOCK
      ?auto_173427 - BLOCK
      ?auto_173428 - BLOCK
    )
    :vars
    (
      ?auto_173429 - BLOCK
      ?auto_173431 - BLOCK
      ?auto_173432 - BLOCK
      ?auto_173433 - BLOCK
      ?auto_173430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173425 ?auto_173426 ) ) ( not ( = ?auto_173425 ?auto_173427 ) ) ( not ( = ?auto_173425 ?auto_173428 ) ) ( not ( = ?auto_173426 ?auto_173427 ) ) ( not ( = ?auto_173426 ?auto_173428 ) ) ( not ( = ?auto_173427 ?auto_173428 ) ) ( ON ?auto_173428 ?auto_173429 ) ( not ( = ?auto_173425 ?auto_173429 ) ) ( not ( = ?auto_173426 ?auto_173429 ) ) ( not ( = ?auto_173427 ?auto_173429 ) ) ( not ( = ?auto_173428 ?auto_173429 ) ) ( ON ?auto_173427 ?auto_173428 ) ( ON-TABLE ?auto_173431 ) ( ON ?auto_173432 ?auto_173431 ) ( ON ?auto_173433 ?auto_173432 ) ( ON ?auto_173430 ?auto_173433 ) ( ON ?auto_173429 ?auto_173430 ) ( not ( = ?auto_173431 ?auto_173432 ) ) ( not ( = ?auto_173431 ?auto_173433 ) ) ( not ( = ?auto_173431 ?auto_173430 ) ) ( not ( = ?auto_173431 ?auto_173429 ) ) ( not ( = ?auto_173431 ?auto_173428 ) ) ( not ( = ?auto_173431 ?auto_173427 ) ) ( not ( = ?auto_173432 ?auto_173433 ) ) ( not ( = ?auto_173432 ?auto_173430 ) ) ( not ( = ?auto_173432 ?auto_173429 ) ) ( not ( = ?auto_173432 ?auto_173428 ) ) ( not ( = ?auto_173432 ?auto_173427 ) ) ( not ( = ?auto_173433 ?auto_173430 ) ) ( not ( = ?auto_173433 ?auto_173429 ) ) ( not ( = ?auto_173433 ?auto_173428 ) ) ( not ( = ?auto_173433 ?auto_173427 ) ) ( not ( = ?auto_173430 ?auto_173429 ) ) ( not ( = ?auto_173430 ?auto_173428 ) ) ( not ( = ?auto_173430 ?auto_173427 ) ) ( not ( = ?auto_173425 ?auto_173431 ) ) ( not ( = ?auto_173425 ?auto_173432 ) ) ( not ( = ?auto_173425 ?auto_173433 ) ) ( not ( = ?auto_173425 ?auto_173430 ) ) ( not ( = ?auto_173426 ?auto_173431 ) ) ( not ( = ?auto_173426 ?auto_173432 ) ) ( not ( = ?auto_173426 ?auto_173433 ) ) ( not ( = ?auto_173426 ?auto_173430 ) ) ( ON ?auto_173426 ?auto_173427 ) ( ON ?auto_173425 ?auto_173426 ) ( CLEAR ?auto_173425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173431 ?auto_173432 ?auto_173433 ?auto_173430 ?auto_173429 ?auto_173428 ?auto_173427 ?auto_173426 )
      ( MAKE-4PILE ?auto_173425 ?auto_173426 ?auto_173427 ?auto_173428 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173438 - BLOCK
      ?auto_173439 - BLOCK
      ?auto_173440 - BLOCK
      ?auto_173441 - BLOCK
    )
    :vars
    (
      ?auto_173442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173442 ?auto_173441 ) ( CLEAR ?auto_173442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173438 ) ( ON ?auto_173439 ?auto_173438 ) ( ON ?auto_173440 ?auto_173439 ) ( ON ?auto_173441 ?auto_173440 ) ( not ( = ?auto_173438 ?auto_173439 ) ) ( not ( = ?auto_173438 ?auto_173440 ) ) ( not ( = ?auto_173438 ?auto_173441 ) ) ( not ( = ?auto_173438 ?auto_173442 ) ) ( not ( = ?auto_173439 ?auto_173440 ) ) ( not ( = ?auto_173439 ?auto_173441 ) ) ( not ( = ?auto_173439 ?auto_173442 ) ) ( not ( = ?auto_173440 ?auto_173441 ) ) ( not ( = ?auto_173440 ?auto_173442 ) ) ( not ( = ?auto_173441 ?auto_173442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173442 ?auto_173441 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173443 - BLOCK
      ?auto_173444 - BLOCK
      ?auto_173445 - BLOCK
      ?auto_173446 - BLOCK
    )
    :vars
    (
      ?auto_173447 - BLOCK
      ?auto_173448 - BLOCK
      ?auto_173449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173447 ?auto_173446 ) ( CLEAR ?auto_173447 ) ( ON-TABLE ?auto_173443 ) ( ON ?auto_173444 ?auto_173443 ) ( ON ?auto_173445 ?auto_173444 ) ( ON ?auto_173446 ?auto_173445 ) ( not ( = ?auto_173443 ?auto_173444 ) ) ( not ( = ?auto_173443 ?auto_173445 ) ) ( not ( = ?auto_173443 ?auto_173446 ) ) ( not ( = ?auto_173443 ?auto_173447 ) ) ( not ( = ?auto_173444 ?auto_173445 ) ) ( not ( = ?auto_173444 ?auto_173446 ) ) ( not ( = ?auto_173444 ?auto_173447 ) ) ( not ( = ?auto_173445 ?auto_173446 ) ) ( not ( = ?auto_173445 ?auto_173447 ) ) ( not ( = ?auto_173446 ?auto_173447 ) ) ( HOLDING ?auto_173448 ) ( CLEAR ?auto_173449 ) ( not ( = ?auto_173443 ?auto_173448 ) ) ( not ( = ?auto_173443 ?auto_173449 ) ) ( not ( = ?auto_173444 ?auto_173448 ) ) ( not ( = ?auto_173444 ?auto_173449 ) ) ( not ( = ?auto_173445 ?auto_173448 ) ) ( not ( = ?auto_173445 ?auto_173449 ) ) ( not ( = ?auto_173446 ?auto_173448 ) ) ( not ( = ?auto_173446 ?auto_173449 ) ) ( not ( = ?auto_173447 ?auto_173448 ) ) ( not ( = ?auto_173447 ?auto_173449 ) ) ( not ( = ?auto_173448 ?auto_173449 ) ) )
    :subtasks
    ( ( !STACK ?auto_173448 ?auto_173449 )
      ( MAKE-4PILE ?auto_173443 ?auto_173444 ?auto_173445 ?auto_173446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173450 - BLOCK
      ?auto_173451 - BLOCK
      ?auto_173452 - BLOCK
      ?auto_173453 - BLOCK
    )
    :vars
    (
      ?auto_173454 - BLOCK
      ?auto_173455 - BLOCK
      ?auto_173456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173454 ?auto_173453 ) ( ON-TABLE ?auto_173450 ) ( ON ?auto_173451 ?auto_173450 ) ( ON ?auto_173452 ?auto_173451 ) ( ON ?auto_173453 ?auto_173452 ) ( not ( = ?auto_173450 ?auto_173451 ) ) ( not ( = ?auto_173450 ?auto_173452 ) ) ( not ( = ?auto_173450 ?auto_173453 ) ) ( not ( = ?auto_173450 ?auto_173454 ) ) ( not ( = ?auto_173451 ?auto_173452 ) ) ( not ( = ?auto_173451 ?auto_173453 ) ) ( not ( = ?auto_173451 ?auto_173454 ) ) ( not ( = ?auto_173452 ?auto_173453 ) ) ( not ( = ?auto_173452 ?auto_173454 ) ) ( not ( = ?auto_173453 ?auto_173454 ) ) ( CLEAR ?auto_173455 ) ( not ( = ?auto_173450 ?auto_173456 ) ) ( not ( = ?auto_173450 ?auto_173455 ) ) ( not ( = ?auto_173451 ?auto_173456 ) ) ( not ( = ?auto_173451 ?auto_173455 ) ) ( not ( = ?auto_173452 ?auto_173456 ) ) ( not ( = ?auto_173452 ?auto_173455 ) ) ( not ( = ?auto_173453 ?auto_173456 ) ) ( not ( = ?auto_173453 ?auto_173455 ) ) ( not ( = ?auto_173454 ?auto_173456 ) ) ( not ( = ?auto_173454 ?auto_173455 ) ) ( not ( = ?auto_173456 ?auto_173455 ) ) ( ON ?auto_173456 ?auto_173454 ) ( CLEAR ?auto_173456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173450 ?auto_173451 ?auto_173452 ?auto_173453 ?auto_173454 )
      ( MAKE-4PILE ?auto_173450 ?auto_173451 ?auto_173452 ?auto_173453 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173457 - BLOCK
      ?auto_173458 - BLOCK
      ?auto_173459 - BLOCK
      ?auto_173460 - BLOCK
    )
    :vars
    (
      ?auto_173463 - BLOCK
      ?auto_173462 - BLOCK
      ?auto_173461 - BLOCK
      ?auto_173465 - BLOCK
      ?auto_173464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173463 ?auto_173460 ) ( ON-TABLE ?auto_173457 ) ( ON ?auto_173458 ?auto_173457 ) ( ON ?auto_173459 ?auto_173458 ) ( ON ?auto_173460 ?auto_173459 ) ( not ( = ?auto_173457 ?auto_173458 ) ) ( not ( = ?auto_173457 ?auto_173459 ) ) ( not ( = ?auto_173457 ?auto_173460 ) ) ( not ( = ?auto_173457 ?auto_173463 ) ) ( not ( = ?auto_173458 ?auto_173459 ) ) ( not ( = ?auto_173458 ?auto_173460 ) ) ( not ( = ?auto_173458 ?auto_173463 ) ) ( not ( = ?auto_173459 ?auto_173460 ) ) ( not ( = ?auto_173459 ?auto_173463 ) ) ( not ( = ?auto_173460 ?auto_173463 ) ) ( not ( = ?auto_173457 ?auto_173462 ) ) ( not ( = ?auto_173457 ?auto_173461 ) ) ( not ( = ?auto_173458 ?auto_173462 ) ) ( not ( = ?auto_173458 ?auto_173461 ) ) ( not ( = ?auto_173459 ?auto_173462 ) ) ( not ( = ?auto_173459 ?auto_173461 ) ) ( not ( = ?auto_173460 ?auto_173462 ) ) ( not ( = ?auto_173460 ?auto_173461 ) ) ( not ( = ?auto_173463 ?auto_173462 ) ) ( not ( = ?auto_173463 ?auto_173461 ) ) ( not ( = ?auto_173462 ?auto_173461 ) ) ( ON ?auto_173462 ?auto_173463 ) ( CLEAR ?auto_173462 ) ( HOLDING ?auto_173461 ) ( CLEAR ?auto_173465 ) ( ON-TABLE ?auto_173464 ) ( ON ?auto_173465 ?auto_173464 ) ( not ( = ?auto_173464 ?auto_173465 ) ) ( not ( = ?auto_173464 ?auto_173461 ) ) ( not ( = ?auto_173465 ?auto_173461 ) ) ( not ( = ?auto_173457 ?auto_173465 ) ) ( not ( = ?auto_173457 ?auto_173464 ) ) ( not ( = ?auto_173458 ?auto_173465 ) ) ( not ( = ?auto_173458 ?auto_173464 ) ) ( not ( = ?auto_173459 ?auto_173465 ) ) ( not ( = ?auto_173459 ?auto_173464 ) ) ( not ( = ?auto_173460 ?auto_173465 ) ) ( not ( = ?auto_173460 ?auto_173464 ) ) ( not ( = ?auto_173463 ?auto_173465 ) ) ( not ( = ?auto_173463 ?auto_173464 ) ) ( not ( = ?auto_173462 ?auto_173465 ) ) ( not ( = ?auto_173462 ?auto_173464 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173464 ?auto_173465 ?auto_173461 )
      ( MAKE-4PILE ?auto_173457 ?auto_173458 ?auto_173459 ?auto_173460 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173466 - BLOCK
      ?auto_173467 - BLOCK
      ?auto_173468 - BLOCK
      ?auto_173469 - BLOCK
    )
    :vars
    (
      ?auto_173474 - BLOCK
      ?auto_173471 - BLOCK
      ?auto_173470 - BLOCK
      ?auto_173472 - BLOCK
      ?auto_173473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173474 ?auto_173469 ) ( ON-TABLE ?auto_173466 ) ( ON ?auto_173467 ?auto_173466 ) ( ON ?auto_173468 ?auto_173467 ) ( ON ?auto_173469 ?auto_173468 ) ( not ( = ?auto_173466 ?auto_173467 ) ) ( not ( = ?auto_173466 ?auto_173468 ) ) ( not ( = ?auto_173466 ?auto_173469 ) ) ( not ( = ?auto_173466 ?auto_173474 ) ) ( not ( = ?auto_173467 ?auto_173468 ) ) ( not ( = ?auto_173467 ?auto_173469 ) ) ( not ( = ?auto_173467 ?auto_173474 ) ) ( not ( = ?auto_173468 ?auto_173469 ) ) ( not ( = ?auto_173468 ?auto_173474 ) ) ( not ( = ?auto_173469 ?auto_173474 ) ) ( not ( = ?auto_173466 ?auto_173471 ) ) ( not ( = ?auto_173466 ?auto_173470 ) ) ( not ( = ?auto_173467 ?auto_173471 ) ) ( not ( = ?auto_173467 ?auto_173470 ) ) ( not ( = ?auto_173468 ?auto_173471 ) ) ( not ( = ?auto_173468 ?auto_173470 ) ) ( not ( = ?auto_173469 ?auto_173471 ) ) ( not ( = ?auto_173469 ?auto_173470 ) ) ( not ( = ?auto_173474 ?auto_173471 ) ) ( not ( = ?auto_173474 ?auto_173470 ) ) ( not ( = ?auto_173471 ?auto_173470 ) ) ( ON ?auto_173471 ?auto_173474 ) ( CLEAR ?auto_173472 ) ( ON-TABLE ?auto_173473 ) ( ON ?auto_173472 ?auto_173473 ) ( not ( = ?auto_173473 ?auto_173472 ) ) ( not ( = ?auto_173473 ?auto_173470 ) ) ( not ( = ?auto_173472 ?auto_173470 ) ) ( not ( = ?auto_173466 ?auto_173472 ) ) ( not ( = ?auto_173466 ?auto_173473 ) ) ( not ( = ?auto_173467 ?auto_173472 ) ) ( not ( = ?auto_173467 ?auto_173473 ) ) ( not ( = ?auto_173468 ?auto_173472 ) ) ( not ( = ?auto_173468 ?auto_173473 ) ) ( not ( = ?auto_173469 ?auto_173472 ) ) ( not ( = ?auto_173469 ?auto_173473 ) ) ( not ( = ?auto_173474 ?auto_173472 ) ) ( not ( = ?auto_173474 ?auto_173473 ) ) ( not ( = ?auto_173471 ?auto_173472 ) ) ( not ( = ?auto_173471 ?auto_173473 ) ) ( ON ?auto_173470 ?auto_173471 ) ( CLEAR ?auto_173470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173466 ?auto_173467 ?auto_173468 ?auto_173469 ?auto_173474 ?auto_173471 )
      ( MAKE-4PILE ?auto_173466 ?auto_173467 ?auto_173468 ?auto_173469 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173475 - BLOCK
      ?auto_173476 - BLOCK
      ?auto_173477 - BLOCK
      ?auto_173478 - BLOCK
    )
    :vars
    (
      ?auto_173482 - BLOCK
      ?auto_173480 - BLOCK
      ?auto_173479 - BLOCK
      ?auto_173483 - BLOCK
      ?auto_173481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173482 ?auto_173478 ) ( ON-TABLE ?auto_173475 ) ( ON ?auto_173476 ?auto_173475 ) ( ON ?auto_173477 ?auto_173476 ) ( ON ?auto_173478 ?auto_173477 ) ( not ( = ?auto_173475 ?auto_173476 ) ) ( not ( = ?auto_173475 ?auto_173477 ) ) ( not ( = ?auto_173475 ?auto_173478 ) ) ( not ( = ?auto_173475 ?auto_173482 ) ) ( not ( = ?auto_173476 ?auto_173477 ) ) ( not ( = ?auto_173476 ?auto_173478 ) ) ( not ( = ?auto_173476 ?auto_173482 ) ) ( not ( = ?auto_173477 ?auto_173478 ) ) ( not ( = ?auto_173477 ?auto_173482 ) ) ( not ( = ?auto_173478 ?auto_173482 ) ) ( not ( = ?auto_173475 ?auto_173480 ) ) ( not ( = ?auto_173475 ?auto_173479 ) ) ( not ( = ?auto_173476 ?auto_173480 ) ) ( not ( = ?auto_173476 ?auto_173479 ) ) ( not ( = ?auto_173477 ?auto_173480 ) ) ( not ( = ?auto_173477 ?auto_173479 ) ) ( not ( = ?auto_173478 ?auto_173480 ) ) ( not ( = ?auto_173478 ?auto_173479 ) ) ( not ( = ?auto_173482 ?auto_173480 ) ) ( not ( = ?auto_173482 ?auto_173479 ) ) ( not ( = ?auto_173480 ?auto_173479 ) ) ( ON ?auto_173480 ?auto_173482 ) ( ON-TABLE ?auto_173483 ) ( not ( = ?auto_173483 ?auto_173481 ) ) ( not ( = ?auto_173483 ?auto_173479 ) ) ( not ( = ?auto_173481 ?auto_173479 ) ) ( not ( = ?auto_173475 ?auto_173481 ) ) ( not ( = ?auto_173475 ?auto_173483 ) ) ( not ( = ?auto_173476 ?auto_173481 ) ) ( not ( = ?auto_173476 ?auto_173483 ) ) ( not ( = ?auto_173477 ?auto_173481 ) ) ( not ( = ?auto_173477 ?auto_173483 ) ) ( not ( = ?auto_173478 ?auto_173481 ) ) ( not ( = ?auto_173478 ?auto_173483 ) ) ( not ( = ?auto_173482 ?auto_173481 ) ) ( not ( = ?auto_173482 ?auto_173483 ) ) ( not ( = ?auto_173480 ?auto_173481 ) ) ( not ( = ?auto_173480 ?auto_173483 ) ) ( ON ?auto_173479 ?auto_173480 ) ( CLEAR ?auto_173479 ) ( HOLDING ?auto_173481 ) ( CLEAR ?auto_173483 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173483 ?auto_173481 )
      ( MAKE-4PILE ?auto_173475 ?auto_173476 ?auto_173477 ?auto_173478 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175177 - BLOCK
      ?auto_175178 - BLOCK
      ?auto_175179 - BLOCK
      ?auto_175180 - BLOCK
    )
    :vars
    (
      ?auto_175184 - BLOCK
      ?auto_175183 - BLOCK
      ?auto_175182 - BLOCK
      ?auto_175181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175184 ?auto_175180 ) ( ON-TABLE ?auto_175177 ) ( ON ?auto_175178 ?auto_175177 ) ( ON ?auto_175179 ?auto_175178 ) ( ON ?auto_175180 ?auto_175179 ) ( not ( = ?auto_175177 ?auto_175178 ) ) ( not ( = ?auto_175177 ?auto_175179 ) ) ( not ( = ?auto_175177 ?auto_175180 ) ) ( not ( = ?auto_175177 ?auto_175184 ) ) ( not ( = ?auto_175178 ?auto_175179 ) ) ( not ( = ?auto_175178 ?auto_175180 ) ) ( not ( = ?auto_175178 ?auto_175184 ) ) ( not ( = ?auto_175179 ?auto_175180 ) ) ( not ( = ?auto_175179 ?auto_175184 ) ) ( not ( = ?auto_175180 ?auto_175184 ) ) ( not ( = ?auto_175177 ?auto_175183 ) ) ( not ( = ?auto_175177 ?auto_175182 ) ) ( not ( = ?auto_175178 ?auto_175183 ) ) ( not ( = ?auto_175178 ?auto_175182 ) ) ( not ( = ?auto_175179 ?auto_175183 ) ) ( not ( = ?auto_175179 ?auto_175182 ) ) ( not ( = ?auto_175180 ?auto_175183 ) ) ( not ( = ?auto_175180 ?auto_175182 ) ) ( not ( = ?auto_175184 ?auto_175183 ) ) ( not ( = ?auto_175184 ?auto_175182 ) ) ( not ( = ?auto_175183 ?auto_175182 ) ) ( ON ?auto_175183 ?auto_175184 ) ( not ( = ?auto_175181 ?auto_175182 ) ) ( not ( = ?auto_175177 ?auto_175181 ) ) ( not ( = ?auto_175178 ?auto_175181 ) ) ( not ( = ?auto_175179 ?auto_175181 ) ) ( not ( = ?auto_175180 ?auto_175181 ) ) ( not ( = ?auto_175184 ?auto_175181 ) ) ( not ( = ?auto_175183 ?auto_175181 ) ) ( ON ?auto_175182 ?auto_175183 ) ( ON ?auto_175181 ?auto_175182 ) ( CLEAR ?auto_175181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175177 ?auto_175178 ?auto_175179 ?auto_175180 ?auto_175184 ?auto_175183 ?auto_175182 )
      ( MAKE-4PILE ?auto_175177 ?auto_175178 ?auto_175179 ?auto_175180 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173493 - BLOCK
      ?auto_173494 - BLOCK
      ?auto_173495 - BLOCK
      ?auto_173496 - BLOCK
    )
    :vars
    (
      ?auto_173501 - BLOCK
      ?auto_173498 - BLOCK
      ?auto_173499 - BLOCK
      ?auto_173500 - BLOCK
      ?auto_173497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173501 ?auto_173496 ) ( ON-TABLE ?auto_173493 ) ( ON ?auto_173494 ?auto_173493 ) ( ON ?auto_173495 ?auto_173494 ) ( ON ?auto_173496 ?auto_173495 ) ( not ( = ?auto_173493 ?auto_173494 ) ) ( not ( = ?auto_173493 ?auto_173495 ) ) ( not ( = ?auto_173493 ?auto_173496 ) ) ( not ( = ?auto_173493 ?auto_173501 ) ) ( not ( = ?auto_173494 ?auto_173495 ) ) ( not ( = ?auto_173494 ?auto_173496 ) ) ( not ( = ?auto_173494 ?auto_173501 ) ) ( not ( = ?auto_173495 ?auto_173496 ) ) ( not ( = ?auto_173495 ?auto_173501 ) ) ( not ( = ?auto_173496 ?auto_173501 ) ) ( not ( = ?auto_173493 ?auto_173498 ) ) ( not ( = ?auto_173493 ?auto_173499 ) ) ( not ( = ?auto_173494 ?auto_173498 ) ) ( not ( = ?auto_173494 ?auto_173499 ) ) ( not ( = ?auto_173495 ?auto_173498 ) ) ( not ( = ?auto_173495 ?auto_173499 ) ) ( not ( = ?auto_173496 ?auto_173498 ) ) ( not ( = ?auto_173496 ?auto_173499 ) ) ( not ( = ?auto_173501 ?auto_173498 ) ) ( not ( = ?auto_173501 ?auto_173499 ) ) ( not ( = ?auto_173498 ?auto_173499 ) ) ( ON ?auto_173498 ?auto_173501 ) ( not ( = ?auto_173500 ?auto_173497 ) ) ( not ( = ?auto_173500 ?auto_173499 ) ) ( not ( = ?auto_173497 ?auto_173499 ) ) ( not ( = ?auto_173493 ?auto_173497 ) ) ( not ( = ?auto_173493 ?auto_173500 ) ) ( not ( = ?auto_173494 ?auto_173497 ) ) ( not ( = ?auto_173494 ?auto_173500 ) ) ( not ( = ?auto_173495 ?auto_173497 ) ) ( not ( = ?auto_173495 ?auto_173500 ) ) ( not ( = ?auto_173496 ?auto_173497 ) ) ( not ( = ?auto_173496 ?auto_173500 ) ) ( not ( = ?auto_173501 ?auto_173497 ) ) ( not ( = ?auto_173501 ?auto_173500 ) ) ( not ( = ?auto_173498 ?auto_173497 ) ) ( not ( = ?auto_173498 ?auto_173500 ) ) ( ON ?auto_173499 ?auto_173498 ) ( ON ?auto_173497 ?auto_173499 ) ( CLEAR ?auto_173497 ) ( HOLDING ?auto_173500 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173500 )
      ( MAKE-4PILE ?auto_173493 ?auto_173494 ?auto_173495 ?auto_173496 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173502 - BLOCK
      ?auto_173503 - BLOCK
      ?auto_173504 - BLOCK
      ?auto_173505 - BLOCK
    )
    :vars
    (
      ?auto_173508 - BLOCK
      ?auto_173506 - BLOCK
      ?auto_173509 - BLOCK
      ?auto_173507 - BLOCK
      ?auto_173510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173508 ?auto_173505 ) ( ON-TABLE ?auto_173502 ) ( ON ?auto_173503 ?auto_173502 ) ( ON ?auto_173504 ?auto_173503 ) ( ON ?auto_173505 ?auto_173504 ) ( not ( = ?auto_173502 ?auto_173503 ) ) ( not ( = ?auto_173502 ?auto_173504 ) ) ( not ( = ?auto_173502 ?auto_173505 ) ) ( not ( = ?auto_173502 ?auto_173508 ) ) ( not ( = ?auto_173503 ?auto_173504 ) ) ( not ( = ?auto_173503 ?auto_173505 ) ) ( not ( = ?auto_173503 ?auto_173508 ) ) ( not ( = ?auto_173504 ?auto_173505 ) ) ( not ( = ?auto_173504 ?auto_173508 ) ) ( not ( = ?auto_173505 ?auto_173508 ) ) ( not ( = ?auto_173502 ?auto_173506 ) ) ( not ( = ?auto_173502 ?auto_173509 ) ) ( not ( = ?auto_173503 ?auto_173506 ) ) ( not ( = ?auto_173503 ?auto_173509 ) ) ( not ( = ?auto_173504 ?auto_173506 ) ) ( not ( = ?auto_173504 ?auto_173509 ) ) ( not ( = ?auto_173505 ?auto_173506 ) ) ( not ( = ?auto_173505 ?auto_173509 ) ) ( not ( = ?auto_173508 ?auto_173506 ) ) ( not ( = ?auto_173508 ?auto_173509 ) ) ( not ( = ?auto_173506 ?auto_173509 ) ) ( ON ?auto_173506 ?auto_173508 ) ( not ( = ?auto_173507 ?auto_173510 ) ) ( not ( = ?auto_173507 ?auto_173509 ) ) ( not ( = ?auto_173510 ?auto_173509 ) ) ( not ( = ?auto_173502 ?auto_173510 ) ) ( not ( = ?auto_173502 ?auto_173507 ) ) ( not ( = ?auto_173503 ?auto_173510 ) ) ( not ( = ?auto_173503 ?auto_173507 ) ) ( not ( = ?auto_173504 ?auto_173510 ) ) ( not ( = ?auto_173504 ?auto_173507 ) ) ( not ( = ?auto_173505 ?auto_173510 ) ) ( not ( = ?auto_173505 ?auto_173507 ) ) ( not ( = ?auto_173508 ?auto_173510 ) ) ( not ( = ?auto_173508 ?auto_173507 ) ) ( not ( = ?auto_173506 ?auto_173510 ) ) ( not ( = ?auto_173506 ?auto_173507 ) ) ( ON ?auto_173509 ?auto_173506 ) ( ON ?auto_173510 ?auto_173509 ) ( ON ?auto_173507 ?auto_173510 ) ( CLEAR ?auto_173507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173502 ?auto_173503 ?auto_173504 ?auto_173505 ?auto_173508 ?auto_173506 ?auto_173509 ?auto_173510 )
      ( MAKE-4PILE ?auto_173502 ?auto_173503 ?auto_173504 ?auto_173505 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173516 - BLOCK
      ?auto_173517 - BLOCK
      ?auto_173518 - BLOCK
      ?auto_173519 - BLOCK
      ?auto_173520 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_173520 ) ( CLEAR ?auto_173519 ) ( ON-TABLE ?auto_173516 ) ( ON ?auto_173517 ?auto_173516 ) ( ON ?auto_173518 ?auto_173517 ) ( ON ?auto_173519 ?auto_173518 ) ( not ( = ?auto_173516 ?auto_173517 ) ) ( not ( = ?auto_173516 ?auto_173518 ) ) ( not ( = ?auto_173516 ?auto_173519 ) ) ( not ( = ?auto_173516 ?auto_173520 ) ) ( not ( = ?auto_173517 ?auto_173518 ) ) ( not ( = ?auto_173517 ?auto_173519 ) ) ( not ( = ?auto_173517 ?auto_173520 ) ) ( not ( = ?auto_173518 ?auto_173519 ) ) ( not ( = ?auto_173518 ?auto_173520 ) ) ( not ( = ?auto_173519 ?auto_173520 ) ) )
    :subtasks
    ( ( !STACK ?auto_173520 ?auto_173519 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173521 - BLOCK
      ?auto_173522 - BLOCK
      ?auto_173523 - BLOCK
      ?auto_173524 - BLOCK
      ?auto_173525 - BLOCK
    )
    :vars
    (
      ?auto_173526 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173524 ) ( ON-TABLE ?auto_173521 ) ( ON ?auto_173522 ?auto_173521 ) ( ON ?auto_173523 ?auto_173522 ) ( ON ?auto_173524 ?auto_173523 ) ( not ( = ?auto_173521 ?auto_173522 ) ) ( not ( = ?auto_173521 ?auto_173523 ) ) ( not ( = ?auto_173521 ?auto_173524 ) ) ( not ( = ?auto_173521 ?auto_173525 ) ) ( not ( = ?auto_173522 ?auto_173523 ) ) ( not ( = ?auto_173522 ?auto_173524 ) ) ( not ( = ?auto_173522 ?auto_173525 ) ) ( not ( = ?auto_173523 ?auto_173524 ) ) ( not ( = ?auto_173523 ?auto_173525 ) ) ( not ( = ?auto_173524 ?auto_173525 ) ) ( ON ?auto_173525 ?auto_173526 ) ( CLEAR ?auto_173525 ) ( HAND-EMPTY ) ( not ( = ?auto_173521 ?auto_173526 ) ) ( not ( = ?auto_173522 ?auto_173526 ) ) ( not ( = ?auto_173523 ?auto_173526 ) ) ( not ( = ?auto_173524 ?auto_173526 ) ) ( not ( = ?auto_173525 ?auto_173526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173525 ?auto_173526 )
      ( MAKE-5PILE ?auto_173521 ?auto_173522 ?auto_173523 ?auto_173524 ?auto_173525 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173527 - BLOCK
      ?auto_173528 - BLOCK
      ?auto_173529 - BLOCK
      ?auto_173530 - BLOCK
      ?auto_173531 - BLOCK
    )
    :vars
    (
      ?auto_173532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173527 ) ( ON ?auto_173528 ?auto_173527 ) ( ON ?auto_173529 ?auto_173528 ) ( not ( = ?auto_173527 ?auto_173528 ) ) ( not ( = ?auto_173527 ?auto_173529 ) ) ( not ( = ?auto_173527 ?auto_173530 ) ) ( not ( = ?auto_173527 ?auto_173531 ) ) ( not ( = ?auto_173528 ?auto_173529 ) ) ( not ( = ?auto_173528 ?auto_173530 ) ) ( not ( = ?auto_173528 ?auto_173531 ) ) ( not ( = ?auto_173529 ?auto_173530 ) ) ( not ( = ?auto_173529 ?auto_173531 ) ) ( not ( = ?auto_173530 ?auto_173531 ) ) ( ON ?auto_173531 ?auto_173532 ) ( CLEAR ?auto_173531 ) ( not ( = ?auto_173527 ?auto_173532 ) ) ( not ( = ?auto_173528 ?auto_173532 ) ) ( not ( = ?auto_173529 ?auto_173532 ) ) ( not ( = ?auto_173530 ?auto_173532 ) ) ( not ( = ?auto_173531 ?auto_173532 ) ) ( HOLDING ?auto_173530 ) ( CLEAR ?auto_173529 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173527 ?auto_173528 ?auto_173529 ?auto_173530 )
      ( MAKE-5PILE ?auto_173527 ?auto_173528 ?auto_173529 ?auto_173530 ?auto_173531 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173533 - BLOCK
      ?auto_173534 - BLOCK
      ?auto_173535 - BLOCK
      ?auto_173536 - BLOCK
      ?auto_173537 - BLOCK
    )
    :vars
    (
      ?auto_173538 - BLOCK
      ?auto_173541 - BLOCK
      ?auto_173540 - BLOCK
      ?auto_173539 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173533 ) ( ON ?auto_173534 ?auto_173533 ) ( ON ?auto_173535 ?auto_173534 ) ( not ( = ?auto_173533 ?auto_173534 ) ) ( not ( = ?auto_173533 ?auto_173535 ) ) ( not ( = ?auto_173533 ?auto_173536 ) ) ( not ( = ?auto_173533 ?auto_173537 ) ) ( not ( = ?auto_173534 ?auto_173535 ) ) ( not ( = ?auto_173534 ?auto_173536 ) ) ( not ( = ?auto_173534 ?auto_173537 ) ) ( not ( = ?auto_173535 ?auto_173536 ) ) ( not ( = ?auto_173535 ?auto_173537 ) ) ( not ( = ?auto_173536 ?auto_173537 ) ) ( ON ?auto_173537 ?auto_173538 ) ( not ( = ?auto_173533 ?auto_173538 ) ) ( not ( = ?auto_173534 ?auto_173538 ) ) ( not ( = ?auto_173535 ?auto_173538 ) ) ( not ( = ?auto_173536 ?auto_173538 ) ) ( not ( = ?auto_173537 ?auto_173538 ) ) ( CLEAR ?auto_173535 ) ( ON ?auto_173536 ?auto_173537 ) ( CLEAR ?auto_173536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173541 ) ( ON ?auto_173540 ?auto_173541 ) ( ON ?auto_173539 ?auto_173540 ) ( ON ?auto_173538 ?auto_173539 ) ( not ( = ?auto_173541 ?auto_173540 ) ) ( not ( = ?auto_173541 ?auto_173539 ) ) ( not ( = ?auto_173541 ?auto_173538 ) ) ( not ( = ?auto_173541 ?auto_173537 ) ) ( not ( = ?auto_173541 ?auto_173536 ) ) ( not ( = ?auto_173540 ?auto_173539 ) ) ( not ( = ?auto_173540 ?auto_173538 ) ) ( not ( = ?auto_173540 ?auto_173537 ) ) ( not ( = ?auto_173540 ?auto_173536 ) ) ( not ( = ?auto_173539 ?auto_173538 ) ) ( not ( = ?auto_173539 ?auto_173537 ) ) ( not ( = ?auto_173539 ?auto_173536 ) ) ( not ( = ?auto_173533 ?auto_173541 ) ) ( not ( = ?auto_173533 ?auto_173540 ) ) ( not ( = ?auto_173533 ?auto_173539 ) ) ( not ( = ?auto_173534 ?auto_173541 ) ) ( not ( = ?auto_173534 ?auto_173540 ) ) ( not ( = ?auto_173534 ?auto_173539 ) ) ( not ( = ?auto_173535 ?auto_173541 ) ) ( not ( = ?auto_173535 ?auto_173540 ) ) ( not ( = ?auto_173535 ?auto_173539 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173541 ?auto_173540 ?auto_173539 ?auto_173538 ?auto_173537 )
      ( MAKE-5PILE ?auto_173533 ?auto_173534 ?auto_173535 ?auto_173536 ?auto_173537 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173542 - BLOCK
      ?auto_173543 - BLOCK
      ?auto_173544 - BLOCK
      ?auto_173545 - BLOCK
      ?auto_173546 - BLOCK
    )
    :vars
    (
      ?auto_173547 - BLOCK
      ?auto_173548 - BLOCK
      ?auto_173549 - BLOCK
      ?auto_173550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173542 ) ( ON ?auto_173543 ?auto_173542 ) ( not ( = ?auto_173542 ?auto_173543 ) ) ( not ( = ?auto_173542 ?auto_173544 ) ) ( not ( = ?auto_173542 ?auto_173545 ) ) ( not ( = ?auto_173542 ?auto_173546 ) ) ( not ( = ?auto_173543 ?auto_173544 ) ) ( not ( = ?auto_173543 ?auto_173545 ) ) ( not ( = ?auto_173543 ?auto_173546 ) ) ( not ( = ?auto_173544 ?auto_173545 ) ) ( not ( = ?auto_173544 ?auto_173546 ) ) ( not ( = ?auto_173545 ?auto_173546 ) ) ( ON ?auto_173546 ?auto_173547 ) ( not ( = ?auto_173542 ?auto_173547 ) ) ( not ( = ?auto_173543 ?auto_173547 ) ) ( not ( = ?auto_173544 ?auto_173547 ) ) ( not ( = ?auto_173545 ?auto_173547 ) ) ( not ( = ?auto_173546 ?auto_173547 ) ) ( ON ?auto_173545 ?auto_173546 ) ( CLEAR ?auto_173545 ) ( ON-TABLE ?auto_173548 ) ( ON ?auto_173549 ?auto_173548 ) ( ON ?auto_173550 ?auto_173549 ) ( ON ?auto_173547 ?auto_173550 ) ( not ( = ?auto_173548 ?auto_173549 ) ) ( not ( = ?auto_173548 ?auto_173550 ) ) ( not ( = ?auto_173548 ?auto_173547 ) ) ( not ( = ?auto_173548 ?auto_173546 ) ) ( not ( = ?auto_173548 ?auto_173545 ) ) ( not ( = ?auto_173549 ?auto_173550 ) ) ( not ( = ?auto_173549 ?auto_173547 ) ) ( not ( = ?auto_173549 ?auto_173546 ) ) ( not ( = ?auto_173549 ?auto_173545 ) ) ( not ( = ?auto_173550 ?auto_173547 ) ) ( not ( = ?auto_173550 ?auto_173546 ) ) ( not ( = ?auto_173550 ?auto_173545 ) ) ( not ( = ?auto_173542 ?auto_173548 ) ) ( not ( = ?auto_173542 ?auto_173549 ) ) ( not ( = ?auto_173542 ?auto_173550 ) ) ( not ( = ?auto_173543 ?auto_173548 ) ) ( not ( = ?auto_173543 ?auto_173549 ) ) ( not ( = ?auto_173543 ?auto_173550 ) ) ( not ( = ?auto_173544 ?auto_173548 ) ) ( not ( = ?auto_173544 ?auto_173549 ) ) ( not ( = ?auto_173544 ?auto_173550 ) ) ( HOLDING ?auto_173544 ) ( CLEAR ?auto_173543 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173542 ?auto_173543 ?auto_173544 )
      ( MAKE-5PILE ?auto_173542 ?auto_173543 ?auto_173544 ?auto_173545 ?auto_173546 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173551 - BLOCK
      ?auto_173552 - BLOCK
      ?auto_173553 - BLOCK
      ?auto_173554 - BLOCK
      ?auto_173555 - BLOCK
    )
    :vars
    (
      ?auto_173559 - BLOCK
      ?auto_173556 - BLOCK
      ?auto_173557 - BLOCK
      ?auto_173558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173551 ) ( ON ?auto_173552 ?auto_173551 ) ( not ( = ?auto_173551 ?auto_173552 ) ) ( not ( = ?auto_173551 ?auto_173553 ) ) ( not ( = ?auto_173551 ?auto_173554 ) ) ( not ( = ?auto_173551 ?auto_173555 ) ) ( not ( = ?auto_173552 ?auto_173553 ) ) ( not ( = ?auto_173552 ?auto_173554 ) ) ( not ( = ?auto_173552 ?auto_173555 ) ) ( not ( = ?auto_173553 ?auto_173554 ) ) ( not ( = ?auto_173553 ?auto_173555 ) ) ( not ( = ?auto_173554 ?auto_173555 ) ) ( ON ?auto_173555 ?auto_173559 ) ( not ( = ?auto_173551 ?auto_173559 ) ) ( not ( = ?auto_173552 ?auto_173559 ) ) ( not ( = ?auto_173553 ?auto_173559 ) ) ( not ( = ?auto_173554 ?auto_173559 ) ) ( not ( = ?auto_173555 ?auto_173559 ) ) ( ON ?auto_173554 ?auto_173555 ) ( ON-TABLE ?auto_173556 ) ( ON ?auto_173557 ?auto_173556 ) ( ON ?auto_173558 ?auto_173557 ) ( ON ?auto_173559 ?auto_173558 ) ( not ( = ?auto_173556 ?auto_173557 ) ) ( not ( = ?auto_173556 ?auto_173558 ) ) ( not ( = ?auto_173556 ?auto_173559 ) ) ( not ( = ?auto_173556 ?auto_173555 ) ) ( not ( = ?auto_173556 ?auto_173554 ) ) ( not ( = ?auto_173557 ?auto_173558 ) ) ( not ( = ?auto_173557 ?auto_173559 ) ) ( not ( = ?auto_173557 ?auto_173555 ) ) ( not ( = ?auto_173557 ?auto_173554 ) ) ( not ( = ?auto_173558 ?auto_173559 ) ) ( not ( = ?auto_173558 ?auto_173555 ) ) ( not ( = ?auto_173558 ?auto_173554 ) ) ( not ( = ?auto_173551 ?auto_173556 ) ) ( not ( = ?auto_173551 ?auto_173557 ) ) ( not ( = ?auto_173551 ?auto_173558 ) ) ( not ( = ?auto_173552 ?auto_173556 ) ) ( not ( = ?auto_173552 ?auto_173557 ) ) ( not ( = ?auto_173552 ?auto_173558 ) ) ( not ( = ?auto_173553 ?auto_173556 ) ) ( not ( = ?auto_173553 ?auto_173557 ) ) ( not ( = ?auto_173553 ?auto_173558 ) ) ( CLEAR ?auto_173552 ) ( ON ?auto_173553 ?auto_173554 ) ( CLEAR ?auto_173553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173556 ?auto_173557 ?auto_173558 ?auto_173559 ?auto_173555 ?auto_173554 )
      ( MAKE-5PILE ?auto_173551 ?auto_173552 ?auto_173553 ?auto_173554 ?auto_173555 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173560 - BLOCK
      ?auto_173561 - BLOCK
      ?auto_173562 - BLOCK
      ?auto_173563 - BLOCK
      ?auto_173564 - BLOCK
    )
    :vars
    (
      ?auto_173568 - BLOCK
      ?auto_173567 - BLOCK
      ?auto_173565 - BLOCK
      ?auto_173566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173560 ) ( not ( = ?auto_173560 ?auto_173561 ) ) ( not ( = ?auto_173560 ?auto_173562 ) ) ( not ( = ?auto_173560 ?auto_173563 ) ) ( not ( = ?auto_173560 ?auto_173564 ) ) ( not ( = ?auto_173561 ?auto_173562 ) ) ( not ( = ?auto_173561 ?auto_173563 ) ) ( not ( = ?auto_173561 ?auto_173564 ) ) ( not ( = ?auto_173562 ?auto_173563 ) ) ( not ( = ?auto_173562 ?auto_173564 ) ) ( not ( = ?auto_173563 ?auto_173564 ) ) ( ON ?auto_173564 ?auto_173568 ) ( not ( = ?auto_173560 ?auto_173568 ) ) ( not ( = ?auto_173561 ?auto_173568 ) ) ( not ( = ?auto_173562 ?auto_173568 ) ) ( not ( = ?auto_173563 ?auto_173568 ) ) ( not ( = ?auto_173564 ?auto_173568 ) ) ( ON ?auto_173563 ?auto_173564 ) ( ON-TABLE ?auto_173567 ) ( ON ?auto_173565 ?auto_173567 ) ( ON ?auto_173566 ?auto_173565 ) ( ON ?auto_173568 ?auto_173566 ) ( not ( = ?auto_173567 ?auto_173565 ) ) ( not ( = ?auto_173567 ?auto_173566 ) ) ( not ( = ?auto_173567 ?auto_173568 ) ) ( not ( = ?auto_173567 ?auto_173564 ) ) ( not ( = ?auto_173567 ?auto_173563 ) ) ( not ( = ?auto_173565 ?auto_173566 ) ) ( not ( = ?auto_173565 ?auto_173568 ) ) ( not ( = ?auto_173565 ?auto_173564 ) ) ( not ( = ?auto_173565 ?auto_173563 ) ) ( not ( = ?auto_173566 ?auto_173568 ) ) ( not ( = ?auto_173566 ?auto_173564 ) ) ( not ( = ?auto_173566 ?auto_173563 ) ) ( not ( = ?auto_173560 ?auto_173567 ) ) ( not ( = ?auto_173560 ?auto_173565 ) ) ( not ( = ?auto_173560 ?auto_173566 ) ) ( not ( = ?auto_173561 ?auto_173567 ) ) ( not ( = ?auto_173561 ?auto_173565 ) ) ( not ( = ?auto_173561 ?auto_173566 ) ) ( not ( = ?auto_173562 ?auto_173567 ) ) ( not ( = ?auto_173562 ?auto_173565 ) ) ( not ( = ?auto_173562 ?auto_173566 ) ) ( ON ?auto_173562 ?auto_173563 ) ( CLEAR ?auto_173562 ) ( HOLDING ?auto_173561 ) ( CLEAR ?auto_173560 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173560 ?auto_173561 )
      ( MAKE-5PILE ?auto_173560 ?auto_173561 ?auto_173562 ?auto_173563 ?auto_173564 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173569 - BLOCK
      ?auto_173570 - BLOCK
      ?auto_173571 - BLOCK
      ?auto_173572 - BLOCK
      ?auto_173573 - BLOCK
    )
    :vars
    (
      ?auto_173575 - BLOCK
      ?auto_173574 - BLOCK
      ?auto_173576 - BLOCK
      ?auto_173577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173569 ) ( not ( = ?auto_173569 ?auto_173570 ) ) ( not ( = ?auto_173569 ?auto_173571 ) ) ( not ( = ?auto_173569 ?auto_173572 ) ) ( not ( = ?auto_173569 ?auto_173573 ) ) ( not ( = ?auto_173570 ?auto_173571 ) ) ( not ( = ?auto_173570 ?auto_173572 ) ) ( not ( = ?auto_173570 ?auto_173573 ) ) ( not ( = ?auto_173571 ?auto_173572 ) ) ( not ( = ?auto_173571 ?auto_173573 ) ) ( not ( = ?auto_173572 ?auto_173573 ) ) ( ON ?auto_173573 ?auto_173575 ) ( not ( = ?auto_173569 ?auto_173575 ) ) ( not ( = ?auto_173570 ?auto_173575 ) ) ( not ( = ?auto_173571 ?auto_173575 ) ) ( not ( = ?auto_173572 ?auto_173575 ) ) ( not ( = ?auto_173573 ?auto_173575 ) ) ( ON ?auto_173572 ?auto_173573 ) ( ON-TABLE ?auto_173574 ) ( ON ?auto_173576 ?auto_173574 ) ( ON ?auto_173577 ?auto_173576 ) ( ON ?auto_173575 ?auto_173577 ) ( not ( = ?auto_173574 ?auto_173576 ) ) ( not ( = ?auto_173574 ?auto_173577 ) ) ( not ( = ?auto_173574 ?auto_173575 ) ) ( not ( = ?auto_173574 ?auto_173573 ) ) ( not ( = ?auto_173574 ?auto_173572 ) ) ( not ( = ?auto_173576 ?auto_173577 ) ) ( not ( = ?auto_173576 ?auto_173575 ) ) ( not ( = ?auto_173576 ?auto_173573 ) ) ( not ( = ?auto_173576 ?auto_173572 ) ) ( not ( = ?auto_173577 ?auto_173575 ) ) ( not ( = ?auto_173577 ?auto_173573 ) ) ( not ( = ?auto_173577 ?auto_173572 ) ) ( not ( = ?auto_173569 ?auto_173574 ) ) ( not ( = ?auto_173569 ?auto_173576 ) ) ( not ( = ?auto_173569 ?auto_173577 ) ) ( not ( = ?auto_173570 ?auto_173574 ) ) ( not ( = ?auto_173570 ?auto_173576 ) ) ( not ( = ?auto_173570 ?auto_173577 ) ) ( not ( = ?auto_173571 ?auto_173574 ) ) ( not ( = ?auto_173571 ?auto_173576 ) ) ( not ( = ?auto_173571 ?auto_173577 ) ) ( ON ?auto_173571 ?auto_173572 ) ( CLEAR ?auto_173569 ) ( ON ?auto_173570 ?auto_173571 ) ( CLEAR ?auto_173570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173574 ?auto_173576 ?auto_173577 ?auto_173575 ?auto_173573 ?auto_173572 ?auto_173571 )
      ( MAKE-5PILE ?auto_173569 ?auto_173570 ?auto_173571 ?auto_173572 ?auto_173573 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173578 - BLOCK
      ?auto_173579 - BLOCK
      ?auto_173580 - BLOCK
      ?auto_173581 - BLOCK
      ?auto_173582 - BLOCK
    )
    :vars
    (
      ?auto_173584 - BLOCK
      ?auto_173585 - BLOCK
      ?auto_173586 - BLOCK
      ?auto_173583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173578 ?auto_173579 ) ) ( not ( = ?auto_173578 ?auto_173580 ) ) ( not ( = ?auto_173578 ?auto_173581 ) ) ( not ( = ?auto_173578 ?auto_173582 ) ) ( not ( = ?auto_173579 ?auto_173580 ) ) ( not ( = ?auto_173579 ?auto_173581 ) ) ( not ( = ?auto_173579 ?auto_173582 ) ) ( not ( = ?auto_173580 ?auto_173581 ) ) ( not ( = ?auto_173580 ?auto_173582 ) ) ( not ( = ?auto_173581 ?auto_173582 ) ) ( ON ?auto_173582 ?auto_173584 ) ( not ( = ?auto_173578 ?auto_173584 ) ) ( not ( = ?auto_173579 ?auto_173584 ) ) ( not ( = ?auto_173580 ?auto_173584 ) ) ( not ( = ?auto_173581 ?auto_173584 ) ) ( not ( = ?auto_173582 ?auto_173584 ) ) ( ON ?auto_173581 ?auto_173582 ) ( ON-TABLE ?auto_173585 ) ( ON ?auto_173586 ?auto_173585 ) ( ON ?auto_173583 ?auto_173586 ) ( ON ?auto_173584 ?auto_173583 ) ( not ( = ?auto_173585 ?auto_173586 ) ) ( not ( = ?auto_173585 ?auto_173583 ) ) ( not ( = ?auto_173585 ?auto_173584 ) ) ( not ( = ?auto_173585 ?auto_173582 ) ) ( not ( = ?auto_173585 ?auto_173581 ) ) ( not ( = ?auto_173586 ?auto_173583 ) ) ( not ( = ?auto_173586 ?auto_173584 ) ) ( not ( = ?auto_173586 ?auto_173582 ) ) ( not ( = ?auto_173586 ?auto_173581 ) ) ( not ( = ?auto_173583 ?auto_173584 ) ) ( not ( = ?auto_173583 ?auto_173582 ) ) ( not ( = ?auto_173583 ?auto_173581 ) ) ( not ( = ?auto_173578 ?auto_173585 ) ) ( not ( = ?auto_173578 ?auto_173586 ) ) ( not ( = ?auto_173578 ?auto_173583 ) ) ( not ( = ?auto_173579 ?auto_173585 ) ) ( not ( = ?auto_173579 ?auto_173586 ) ) ( not ( = ?auto_173579 ?auto_173583 ) ) ( not ( = ?auto_173580 ?auto_173585 ) ) ( not ( = ?auto_173580 ?auto_173586 ) ) ( not ( = ?auto_173580 ?auto_173583 ) ) ( ON ?auto_173580 ?auto_173581 ) ( ON ?auto_173579 ?auto_173580 ) ( CLEAR ?auto_173579 ) ( HOLDING ?auto_173578 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173578 )
      ( MAKE-5PILE ?auto_173578 ?auto_173579 ?auto_173580 ?auto_173581 ?auto_173582 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173587 - BLOCK
      ?auto_173588 - BLOCK
      ?auto_173589 - BLOCK
      ?auto_173590 - BLOCK
      ?auto_173591 - BLOCK
    )
    :vars
    (
      ?auto_173593 - BLOCK
      ?auto_173594 - BLOCK
      ?auto_173592 - BLOCK
      ?auto_173595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173587 ?auto_173588 ) ) ( not ( = ?auto_173587 ?auto_173589 ) ) ( not ( = ?auto_173587 ?auto_173590 ) ) ( not ( = ?auto_173587 ?auto_173591 ) ) ( not ( = ?auto_173588 ?auto_173589 ) ) ( not ( = ?auto_173588 ?auto_173590 ) ) ( not ( = ?auto_173588 ?auto_173591 ) ) ( not ( = ?auto_173589 ?auto_173590 ) ) ( not ( = ?auto_173589 ?auto_173591 ) ) ( not ( = ?auto_173590 ?auto_173591 ) ) ( ON ?auto_173591 ?auto_173593 ) ( not ( = ?auto_173587 ?auto_173593 ) ) ( not ( = ?auto_173588 ?auto_173593 ) ) ( not ( = ?auto_173589 ?auto_173593 ) ) ( not ( = ?auto_173590 ?auto_173593 ) ) ( not ( = ?auto_173591 ?auto_173593 ) ) ( ON ?auto_173590 ?auto_173591 ) ( ON-TABLE ?auto_173594 ) ( ON ?auto_173592 ?auto_173594 ) ( ON ?auto_173595 ?auto_173592 ) ( ON ?auto_173593 ?auto_173595 ) ( not ( = ?auto_173594 ?auto_173592 ) ) ( not ( = ?auto_173594 ?auto_173595 ) ) ( not ( = ?auto_173594 ?auto_173593 ) ) ( not ( = ?auto_173594 ?auto_173591 ) ) ( not ( = ?auto_173594 ?auto_173590 ) ) ( not ( = ?auto_173592 ?auto_173595 ) ) ( not ( = ?auto_173592 ?auto_173593 ) ) ( not ( = ?auto_173592 ?auto_173591 ) ) ( not ( = ?auto_173592 ?auto_173590 ) ) ( not ( = ?auto_173595 ?auto_173593 ) ) ( not ( = ?auto_173595 ?auto_173591 ) ) ( not ( = ?auto_173595 ?auto_173590 ) ) ( not ( = ?auto_173587 ?auto_173594 ) ) ( not ( = ?auto_173587 ?auto_173592 ) ) ( not ( = ?auto_173587 ?auto_173595 ) ) ( not ( = ?auto_173588 ?auto_173594 ) ) ( not ( = ?auto_173588 ?auto_173592 ) ) ( not ( = ?auto_173588 ?auto_173595 ) ) ( not ( = ?auto_173589 ?auto_173594 ) ) ( not ( = ?auto_173589 ?auto_173592 ) ) ( not ( = ?auto_173589 ?auto_173595 ) ) ( ON ?auto_173589 ?auto_173590 ) ( ON ?auto_173588 ?auto_173589 ) ( ON ?auto_173587 ?auto_173588 ) ( CLEAR ?auto_173587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173594 ?auto_173592 ?auto_173595 ?auto_173593 ?auto_173591 ?auto_173590 ?auto_173589 ?auto_173588 )
      ( MAKE-5PILE ?auto_173587 ?auto_173588 ?auto_173589 ?auto_173590 ?auto_173591 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173599 - BLOCK
      ?auto_173600 - BLOCK
      ?auto_173601 - BLOCK
    )
    :vars
    (
      ?auto_173602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173602 ?auto_173601 ) ( CLEAR ?auto_173602 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173599 ) ( ON ?auto_173600 ?auto_173599 ) ( ON ?auto_173601 ?auto_173600 ) ( not ( = ?auto_173599 ?auto_173600 ) ) ( not ( = ?auto_173599 ?auto_173601 ) ) ( not ( = ?auto_173599 ?auto_173602 ) ) ( not ( = ?auto_173600 ?auto_173601 ) ) ( not ( = ?auto_173600 ?auto_173602 ) ) ( not ( = ?auto_173601 ?auto_173602 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173602 ?auto_173601 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173603 - BLOCK
      ?auto_173604 - BLOCK
      ?auto_173605 - BLOCK
    )
    :vars
    (
      ?auto_173606 - BLOCK
      ?auto_173607 - BLOCK
      ?auto_173608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173606 ?auto_173605 ) ( CLEAR ?auto_173606 ) ( ON-TABLE ?auto_173603 ) ( ON ?auto_173604 ?auto_173603 ) ( ON ?auto_173605 ?auto_173604 ) ( not ( = ?auto_173603 ?auto_173604 ) ) ( not ( = ?auto_173603 ?auto_173605 ) ) ( not ( = ?auto_173603 ?auto_173606 ) ) ( not ( = ?auto_173604 ?auto_173605 ) ) ( not ( = ?auto_173604 ?auto_173606 ) ) ( not ( = ?auto_173605 ?auto_173606 ) ) ( HOLDING ?auto_173607 ) ( CLEAR ?auto_173608 ) ( not ( = ?auto_173603 ?auto_173607 ) ) ( not ( = ?auto_173603 ?auto_173608 ) ) ( not ( = ?auto_173604 ?auto_173607 ) ) ( not ( = ?auto_173604 ?auto_173608 ) ) ( not ( = ?auto_173605 ?auto_173607 ) ) ( not ( = ?auto_173605 ?auto_173608 ) ) ( not ( = ?auto_173606 ?auto_173607 ) ) ( not ( = ?auto_173606 ?auto_173608 ) ) ( not ( = ?auto_173607 ?auto_173608 ) ) )
    :subtasks
    ( ( !STACK ?auto_173607 ?auto_173608 )
      ( MAKE-3PILE ?auto_173603 ?auto_173604 ?auto_173605 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173609 - BLOCK
      ?auto_173610 - BLOCK
      ?auto_173611 - BLOCK
    )
    :vars
    (
      ?auto_173613 - BLOCK
      ?auto_173614 - BLOCK
      ?auto_173612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173613 ?auto_173611 ) ( ON-TABLE ?auto_173609 ) ( ON ?auto_173610 ?auto_173609 ) ( ON ?auto_173611 ?auto_173610 ) ( not ( = ?auto_173609 ?auto_173610 ) ) ( not ( = ?auto_173609 ?auto_173611 ) ) ( not ( = ?auto_173609 ?auto_173613 ) ) ( not ( = ?auto_173610 ?auto_173611 ) ) ( not ( = ?auto_173610 ?auto_173613 ) ) ( not ( = ?auto_173611 ?auto_173613 ) ) ( CLEAR ?auto_173614 ) ( not ( = ?auto_173609 ?auto_173612 ) ) ( not ( = ?auto_173609 ?auto_173614 ) ) ( not ( = ?auto_173610 ?auto_173612 ) ) ( not ( = ?auto_173610 ?auto_173614 ) ) ( not ( = ?auto_173611 ?auto_173612 ) ) ( not ( = ?auto_173611 ?auto_173614 ) ) ( not ( = ?auto_173613 ?auto_173612 ) ) ( not ( = ?auto_173613 ?auto_173614 ) ) ( not ( = ?auto_173612 ?auto_173614 ) ) ( ON ?auto_173612 ?auto_173613 ) ( CLEAR ?auto_173612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173609 ?auto_173610 ?auto_173611 ?auto_173613 )
      ( MAKE-3PILE ?auto_173609 ?auto_173610 ?auto_173611 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173615 - BLOCK
      ?auto_173616 - BLOCK
      ?auto_173617 - BLOCK
    )
    :vars
    (
      ?auto_173619 - BLOCK
      ?auto_173620 - BLOCK
      ?auto_173618 - BLOCK
      ?auto_173623 - BLOCK
      ?auto_173621 - BLOCK
      ?auto_173622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173619 ?auto_173617 ) ( ON-TABLE ?auto_173615 ) ( ON ?auto_173616 ?auto_173615 ) ( ON ?auto_173617 ?auto_173616 ) ( not ( = ?auto_173615 ?auto_173616 ) ) ( not ( = ?auto_173615 ?auto_173617 ) ) ( not ( = ?auto_173615 ?auto_173619 ) ) ( not ( = ?auto_173616 ?auto_173617 ) ) ( not ( = ?auto_173616 ?auto_173619 ) ) ( not ( = ?auto_173617 ?auto_173619 ) ) ( not ( = ?auto_173615 ?auto_173620 ) ) ( not ( = ?auto_173615 ?auto_173618 ) ) ( not ( = ?auto_173616 ?auto_173620 ) ) ( not ( = ?auto_173616 ?auto_173618 ) ) ( not ( = ?auto_173617 ?auto_173620 ) ) ( not ( = ?auto_173617 ?auto_173618 ) ) ( not ( = ?auto_173619 ?auto_173620 ) ) ( not ( = ?auto_173619 ?auto_173618 ) ) ( not ( = ?auto_173620 ?auto_173618 ) ) ( ON ?auto_173620 ?auto_173619 ) ( CLEAR ?auto_173620 ) ( HOLDING ?auto_173618 ) ( CLEAR ?auto_173623 ) ( ON-TABLE ?auto_173621 ) ( ON ?auto_173622 ?auto_173621 ) ( ON ?auto_173623 ?auto_173622 ) ( not ( = ?auto_173621 ?auto_173622 ) ) ( not ( = ?auto_173621 ?auto_173623 ) ) ( not ( = ?auto_173621 ?auto_173618 ) ) ( not ( = ?auto_173622 ?auto_173623 ) ) ( not ( = ?auto_173622 ?auto_173618 ) ) ( not ( = ?auto_173623 ?auto_173618 ) ) ( not ( = ?auto_173615 ?auto_173623 ) ) ( not ( = ?auto_173615 ?auto_173621 ) ) ( not ( = ?auto_173615 ?auto_173622 ) ) ( not ( = ?auto_173616 ?auto_173623 ) ) ( not ( = ?auto_173616 ?auto_173621 ) ) ( not ( = ?auto_173616 ?auto_173622 ) ) ( not ( = ?auto_173617 ?auto_173623 ) ) ( not ( = ?auto_173617 ?auto_173621 ) ) ( not ( = ?auto_173617 ?auto_173622 ) ) ( not ( = ?auto_173619 ?auto_173623 ) ) ( not ( = ?auto_173619 ?auto_173621 ) ) ( not ( = ?auto_173619 ?auto_173622 ) ) ( not ( = ?auto_173620 ?auto_173623 ) ) ( not ( = ?auto_173620 ?auto_173621 ) ) ( not ( = ?auto_173620 ?auto_173622 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173621 ?auto_173622 ?auto_173623 ?auto_173618 )
      ( MAKE-3PILE ?auto_173615 ?auto_173616 ?auto_173617 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173624 - BLOCK
      ?auto_173625 - BLOCK
      ?auto_173626 - BLOCK
    )
    :vars
    (
      ?auto_173628 - BLOCK
      ?auto_173631 - BLOCK
      ?auto_173630 - BLOCK
      ?auto_173627 - BLOCK
      ?auto_173629 - BLOCK
      ?auto_173632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173628 ?auto_173626 ) ( ON-TABLE ?auto_173624 ) ( ON ?auto_173625 ?auto_173624 ) ( ON ?auto_173626 ?auto_173625 ) ( not ( = ?auto_173624 ?auto_173625 ) ) ( not ( = ?auto_173624 ?auto_173626 ) ) ( not ( = ?auto_173624 ?auto_173628 ) ) ( not ( = ?auto_173625 ?auto_173626 ) ) ( not ( = ?auto_173625 ?auto_173628 ) ) ( not ( = ?auto_173626 ?auto_173628 ) ) ( not ( = ?auto_173624 ?auto_173631 ) ) ( not ( = ?auto_173624 ?auto_173630 ) ) ( not ( = ?auto_173625 ?auto_173631 ) ) ( not ( = ?auto_173625 ?auto_173630 ) ) ( not ( = ?auto_173626 ?auto_173631 ) ) ( not ( = ?auto_173626 ?auto_173630 ) ) ( not ( = ?auto_173628 ?auto_173631 ) ) ( not ( = ?auto_173628 ?auto_173630 ) ) ( not ( = ?auto_173631 ?auto_173630 ) ) ( ON ?auto_173631 ?auto_173628 ) ( CLEAR ?auto_173627 ) ( ON-TABLE ?auto_173629 ) ( ON ?auto_173632 ?auto_173629 ) ( ON ?auto_173627 ?auto_173632 ) ( not ( = ?auto_173629 ?auto_173632 ) ) ( not ( = ?auto_173629 ?auto_173627 ) ) ( not ( = ?auto_173629 ?auto_173630 ) ) ( not ( = ?auto_173632 ?auto_173627 ) ) ( not ( = ?auto_173632 ?auto_173630 ) ) ( not ( = ?auto_173627 ?auto_173630 ) ) ( not ( = ?auto_173624 ?auto_173627 ) ) ( not ( = ?auto_173624 ?auto_173629 ) ) ( not ( = ?auto_173624 ?auto_173632 ) ) ( not ( = ?auto_173625 ?auto_173627 ) ) ( not ( = ?auto_173625 ?auto_173629 ) ) ( not ( = ?auto_173625 ?auto_173632 ) ) ( not ( = ?auto_173626 ?auto_173627 ) ) ( not ( = ?auto_173626 ?auto_173629 ) ) ( not ( = ?auto_173626 ?auto_173632 ) ) ( not ( = ?auto_173628 ?auto_173627 ) ) ( not ( = ?auto_173628 ?auto_173629 ) ) ( not ( = ?auto_173628 ?auto_173632 ) ) ( not ( = ?auto_173631 ?auto_173627 ) ) ( not ( = ?auto_173631 ?auto_173629 ) ) ( not ( = ?auto_173631 ?auto_173632 ) ) ( ON ?auto_173630 ?auto_173631 ) ( CLEAR ?auto_173630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173624 ?auto_173625 ?auto_173626 ?auto_173628 ?auto_173631 )
      ( MAKE-3PILE ?auto_173624 ?auto_173625 ?auto_173626 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173633 - BLOCK
      ?auto_173634 - BLOCK
      ?auto_173635 - BLOCK
    )
    :vars
    (
      ?auto_173638 - BLOCK
      ?auto_173641 - BLOCK
      ?auto_173639 - BLOCK
      ?auto_173640 - BLOCK
      ?auto_173637 - BLOCK
      ?auto_173636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173638 ?auto_173635 ) ( ON-TABLE ?auto_173633 ) ( ON ?auto_173634 ?auto_173633 ) ( ON ?auto_173635 ?auto_173634 ) ( not ( = ?auto_173633 ?auto_173634 ) ) ( not ( = ?auto_173633 ?auto_173635 ) ) ( not ( = ?auto_173633 ?auto_173638 ) ) ( not ( = ?auto_173634 ?auto_173635 ) ) ( not ( = ?auto_173634 ?auto_173638 ) ) ( not ( = ?auto_173635 ?auto_173638 ) ) ( not ( = ?auto_173633 ?auto_173641 ) ) ( not ( = ?auto_173633 ?auto_173639 ) ) ( not ( = ?auto_173634 ?auto_173641 ) ) ( not ( = ?auto_173634 ?auto_173639 ) ) ( not ( = ?auto_173635 ?auto_173641 ) ) ( not ( = ?auto_173635 ?auto_173639 ) ) ( not ( = ?auto_173638 ?auto_173641 ) ) ( not ( = ?auto_173638 ?auto_173639 ) ) ( not ( = ?auto_173641 ?auto_173639 ) ) ( ON ?auto_173641 ?auto_173638 ) ( ON-TABLE ?auto_173640 ) ( ON ?auto_173637 ?auto_173640 ) ( not ( = ?auto_173640 ?auto_173637 ) ) ( not ( = ?auto_173640 ?auto_173636 ) ) ( not ( = ?auto_173640 ?auto_173639 ) ) ( not ( = ?auto_173637 ?auto_173636 ) ) ( not ( = ?auto_173637 ?auto_173639 ) ) ( not ( = ?auto_173636 ?auto_173639 ) ) ( not ( = ?auto_173633 ?auto_173636 ) ) ( not ( = ?auto_173633 ?auto_173640 ) ) ( not ( = ?auto_173633 ?auto_173637 ) ) ( not ( = ?auto_173634 ?auto_173636 ) ) ( not ( = ?auto_173634 ?auto_173640 ) ) ( not ( = ?auto_173634 ?auto_173637 ) ) ( not ( = ?auto_173635 ?auto_173636 ) ) ( not ( = ?auto_173635 ?auto_173640 ) ) ( not ( = ?auto_173635 ?auto_173637 ) ) ( not ( = ?auto_173638 ?auto_173636 ) ) ( not ( = ?auto_173638 ?auto_173640 ) ) ( not ( = ?auto_173638 ?auto_173637 ) ) ( not ( = ?auto_173641 ?auto_173636 ) ) ( not ( = ?auto_173641 ?auto_173640 ) ) ( not ( = ?auto_173641 ?auto_173637 ) ) ( ON ?auto_173639 ?auto_173641 ) ( CLEAR ?auto_173639 ) ( HOLDING ?auto_173636 ) ( CLEAR ?auto_173637 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173640 ?auto_173637 ?auto_173636 )
      ( MAKE-3PILE ?auto_173633 ?auto_173634 ?auto_173635 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173642 - BLOCK
      ?auto_173643 - BLOCK
      ?auto_173644 - BLOCK
    )
    :vars
    (
      ?auto_173648 - BLOCK
      ?auto_173647 - BLOCK
      ?auto_173650 - BLOCK
      ?auto_173649 - BLOCK
      ?auto_173646 - BLOCK
      ?auto_173645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173648 ?auto_173644 ) ( ON-TABLE ?auto_173642 ) ( ON ?auto_173643 ?auto_173642 ) ( ON ?auto_173644 ?auto_173643 ) ( not ( = ?auto_173642 ?auto_173643 ) ) ( not ( = ?auto_173642 ?auto_173644 ) ) ( not ( = ?auto_173642 ?auto_173648 ) ) ( not ( = ?auto_173643 ?auto_173644 ) ) ( not ( = ?auto_173643 ?auto_173648 ) ) ( not ( = ?auto_173644 ?auto_173648 ) ) ( not ( = ?auto_173642 ?auto_173647 ) ) ( not ( = ?auto_173642 ?auto_173650 ) ) ( not ( = ?auto_173643 ?auto_173647 ) ) ( not ( = ?auto_173643 ?auto_173650 ) ) ( not ( = ?auto_173644 ?auto_173647 ) ) ( not ( = ?auto_173644 ?auto_173650 ) ) ( not ( = ?auto_173648 ?auto_173647 ) ) ( not ( = ?auto_173648 ?auto_173650 ) ) ( not ( = ?auto_173647 ?auto_173650 ) ) ( ON ?auto_173647 ?auto_173648 ) ( ON-TABLE ?auto_173649 ) ( ON ?auto_173646 ?auto_173649 ) ( not ( = ?auto_173649 ?auto_173646 ) ) ( not ( = ?auto_173649 ?auto_173645 ) ) ( not ( = ?auto_173649 ?auto_173650 ) ) ( not ( = ?auto_173646 ?auto_173645 ) ) ( not ( = ?auto_173646 ?auto_173650 ) ) ( not ( = ?auto_173645 ?auto_173650 ) ) ( not ( = ?auto_173642 ?auto_173645 ) ) ( not ( = ?auto_173642 ?auto_173649 ) ) ( not ( = ?auto_173642 ?auto_173646 ) ) ( not ( = ?auto_173643 ?auto_173645 ) ) ( not ( = ?auto_173643 ?auto_173649 ) ) ( not ( = ?auto_173643 ?auto_173646 ) ) ( not ( = ?auto_173644 ?auto_173645 ) ) ( not ( = ?auto_173644 ?auto_173649 ) ) ( not ( = ?auto_173644 ?auto_173646 ) ) ( not ( = ?auto_173648 ?auto_173645 ) ) ( not ( = ?auto_173648 ?auto_173649 ) ) ( not ( = ?auto_173648 ?auto_173646 ) ) ( not ( = ?auto_173647 ?auto_173645 ) ) ( not ( = ?auto_173647 ?auto_173649 ) ) ( not ( = ?auto_173647 ?auto_173646 ) ) ( ON ?auto_173650 ?auto_173647 ) ( CLEAR ?auto_173646 ) ( ON ?auto_173645 ?auto_173650 ) ( CLEAR ?auto_173645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173642 ?auto_173643 ?auto_173644 ?auto_173648 ?auto_173647 ?auto_173650 )
      ( MAKE-3PILE ?auto_173642 ?auto_173643 ?auto_173644 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173651 - BLOCK
      ?auto_173652 - BLOCK
      ?auto_173653 - BLOCK
    )
    :vars
    (
      ?auto_173659 - BLOCK
      ?auto_173658 - BLOCK
      ?auto_173654 - BLOCK
      ?auto_173656 - BLOCK
      ?auto_173655 - BLOCK
      ?auto_173657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173659 ?auto_173653 ) ( ON-TABLE ?auto_173651 ) ( ON ?auto_173652 ?auto_173651 ) ( ON ?auto_173653 ?auto_173652 ) ( not ( = ?auto_173651 ?auto_173652 ) ) ( not ( = ?auto_173651 ?auto_173653 ) ) ( not ( = ?auto_173651 ?auto_173659 ) ) ( not ( = ?auto_173652 ?auto_173653 ) ) ( not ( = ?auto_173652 ?auto_173659 ) ) ( not ( = ?auto_173653 ?auto_173659 ) ) ( not ( = ?auto_173651 ?auto_173658 ) ) ( not ( = ?auto_173651 ?auto_173654 ) ) ( not ( = ?auto_173652 ?auto_173658 ) ) ( not ( = ?auto_173652 ?auto_173654 ) ) ( not ( = ?auto_173653 ?auto_173658 ) ) ( not ( = ?auto_173653 ?auto_173654 ) ) ( not ( = ?auto_173659 ?auto_173658 ) ) ( not ( = ?auto_173659 ?auto_173654 ) ) ( not ( = ?auto_173658 ?auto_173654 ) ) ( ON ?auto_173658 ?auto_173659 ) ( ON-TABLE ?auto_173656 ) ( not ( = ?auto_173656 ?auto_173655 ) ) ( not ( = ?auto_173656 ?auto_173657 ) ) ( not ( = ?auto_173656 ?auto_173654 ) ) ( not ( = ?auto_173655 ?auto_173657 ) ) ( not ( = ?auto_173655 ?auto_173654 ) ) ( not ( = ?auto_173657 ?auto_173654 ) ) ( not ( = ?auto_173651 ?auto_173657 ) ) ( not ( = ?auto_173651 ?auto_173656 ) ) ( not ( = ?auto_173651 ?auto_173655 ) ) ( not ( = ?auto_173652 ?auto_173657 ) ) ( not ( = ?auto_173652 ?auto_173656 ) ) ( not ( = ?auto_173652 ?auto_173655 ) ) ( not ( = ?auto_173653 ?auto_173657 ) ) ( not ( = ?auto_173653 ?auto_173656 ) ) ( not ( = ?auto_173653 ?auto_173655 ) ) ( not ( = ?auto_173659 ?auto_173657 ) ) ( not ( = ?auto_173659 ?auto_173656 ) ) ( not ( = ?auto_173659 ?auto_173655 ) ) ( not ( = ?auto_173658 ?auto_173657 ) ) ( not ( = ?auto_173658 ?auto_173656 ) ) ( not ( = ?auto_173658 ?auto_173655 ) ) ( ON ?auto_173654 ?auto_173658 ) ( ON ?auto_173657 ?auto_173654 ) ( CLEAR ?auto_173657 ) ( HOLDING ?auto_173655 ) ( CLEAR ?auto_173656 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173656 ?auto_173655 )
      ( MAKE-3PILE ?auto_173651 ?auto_173652 ?auto_173653 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175518 - BLOCK
      ?auto_175519 - BLOCK
      ?auto_175520 - BLOCK
    )
    :vars
    (
      ?auto_175524 - BLOCK
      ?auto_175523 - BLOCK
      ?auto_175522 - BLOCK
      ?auto_175525 - BLOCK
      ?auto_175521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175524 ?auto_175520 ) ( ON-TABLE ?auto_175518 ) ( ON ?auto_175519 ?auto_175518 ) ( ON ?auto_175520 ?auto_175519 ) ( not ( = ?auto_175518 ?auto_175519 ) ) ( not ( = ?auto_175518 ?auto_175520 ) ) ( not ( = ?auto_175518 ?auto_175524 ) ) ( not ( = ?auto_175519 ?auto_175520 ) ) ( not ( = ?auto_175519 ?auto_175524 ) ) ( not ( = ?auto_175520 ?auto_175524 ) ) ( not ( = ?auto_175518 ?auto_175523 ) ) ( not ( = ?auto_175518 ?auto_175522 ) ) ( not ( = ?auto_175519 ?auto_175523 ) ) ( not ( = ?auto_175519 ?auto_175522 ) ) ( not ( = ?auto_175520 ?auto_175523 ) ) ( not ( = ?auto_175520 ?auto_175522 ) ) ( not ( = ?auto_175524 ?auto_175523 ) ) ( not ( = ?auto_175524 ?auto_175522 ) ) ( not ( = ?auto_175523 ?auto_175522 ) ) ( ON ?auto_175523 ?auto_175524 ) ( not ( = ?auto_175525 ?auto_175521 ) ) ( not ( = ?auto_175525 ?auto_175522 ) ) ( not ( = ?auto_175521 ?auto_175522 ) ) ( not ( = ?auto_175518 ?auto_175521 ) ) ( not ( = ?auto_175518 ?auto_175525 ) ) ( not ( = ?auto_175519 ?auto_175521 ) ) ( not ( = ?auto_175519 ?auto_175525 ) ) ( not ( = ?auto_175520 ?auto_175521 ) ) ( not ( = ?auto_175520 ?auto_175525 ) ) ( not ( = ?auto_175524 ?auto_175521 ) ) ( not ( = ?auto_175524 ?auto_175525 ) ) ( not ( = ?auto_175523 ?auto_175521 ) ) ( not ( = ?auto_175523 ?auto_175525 ) ) ( ON ?auto_175522 ?auto_175523 ) ( ON ?auto_175521 ?auto_175522 ) ( ON ?auto_175525 ?auto_175521 ) ( CLEAR ?auto_175525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175518 ?auto_175519 ?auto_175520 ?auto_175524 ?auto_175523 ?auto_175522 ?auto_175521 )
      ( MAKE-3PILE ?auto_175518 ?auto_175519 ?auto_175520 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173669 - BLOCK
      ?auto_173670 - BLOCK
      ?auto_173671 - BLOCK
    )
    :vars
    (
      ?auto_173675 - BLOCK
      ?auto_173673 - BLOCK
      ?auto_173674 - BLOCK
      ?auto_173676 - BLOCK
      ?auto_173672 - BLOCK
      ?auto_173677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173675 ?auto_173671 ) ( ON-TABLE ?auto_173669 ) ( ON ?auto_173670 ?auto_173669 ) ( ON ?auto_173671 ?auto_173670 ) ( not ( = ?auto_173669 ?auto_173670 ) ) ( not ( = ?auto_173669 ?auto_173671 ) ) ( not ( = ?auto_173669 ?auto_173675 ) ) ( not ( = ?auto_173670 ?auto_173671 ) ) ( not ( = ?auto_173670 ?auto_173675 ) ) ( not ( = ?auto_173671 ?auto_173675 ) ) ( not ( = ?auto_173669 ?auto_173673 ) ) ( not ( = ?auto_173669 ?auto_173674 ) ) ( not ( = ?auto_173670 ?auto_173673 ) ) ( not ( = ?auto_173670 ?auto_173674 ) ) ( not ( = ?auto_173671 ?auto_173673 ) ) ( not ( = ?auto_173671 ?auto_173674 ) ) ( not ( = ?auto_173675 ?auto_173673 ) ) ( not ( = ?auto_173675 ?auto_173674 ) ) ( not ( = ?auto_173673 ?auto_173674 ) ) ( ON ?auto_173673 ?auto_173675 ) ( not ( = ?auto_173676 ?auto_173672 ) ) ( not ( = ?auto_173676 ?auto_173677 ) ) ( not ( = ?auto_173676 ?auto_173674 ) ) ( not ( = ?auto_173672 ?auto_173677 ) ) ( not ( = ?auto_173672 ?auto_173674 ) ) ( not ( = ?auto_173677 ?auto_173674 ) ) ( not ( = ?auto_173669 ?auto_173677 ) ) ( not ( = ?auto_173669 ?auto_173676 ) ) ( not ( = ?auto_173669 ?auto_173672 ) ) ( not ( = ?auto_173670 ?auto_173677 ) ) ( not ( = ?auto_173670 ?auto_173676 ) ) ( not ( = ?auto_173670 ?auto_173672 ) ) ( not ( = ?auto_173671 ?auto_173677 ) ) ( not ( = ?auto_173671 ?auto_173676 ) ) ( not ( = ?auto_173671 ?auto_173672 ) ) ( not ( = ?auto_173675 ?auto_173677 ) ) ( not ( = ?auto_173675 ?auto_173676 ) ) ( not ( = ?auto_173675 ?auto_173672 ) ) ( not ( = ?auto_173673 ?auto_173677 ) ) ( not ( = ?auto_173673 ?auto_173676 ) ) ( not ( = ?auto_173673 ?auto_173672 ) ) ( ON ?auto_173674 ?auto_173673 ) ( ON ?auto_173677 ?auto_173674 ) ( ON ?auto_173672 ?auto_173677 ) ( CLEAR ?auto_173672 ) ( HOLDING ?auto_173676 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173676 )
      ( MAKE-3PILE ?auto_173669 ?auto_173670 ?auto_173671 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173678 - BLOCK
      ?auto_173679 - BLOCK
      ?auto_173680 - BLOCK
    )
    :vars
    (
      ?auto_173682 - BLOCK
      ?auto_173683 - BLOCK
      ?auto_173684 - BLOCK
      ?auto_173685 - BLOCK
      ?auto_173681 - BLOCK
      ?auto_173686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173682 ?auto_173680 ) ( ON-TABLE ?auto_173678 ) ( ON ?auto_173679 ?auto_173678 ) ( ON ?auto_173680 ?auto_173679 ) ( not ( = ?auto_173678 ?auto_173679 ) ) ( not ( = ?auto_173678 ?auto_173680 ) ) ( not ( = ?auto_173678 ?auto_173682 ) ) ( not ( = ?auto_173679 ?auto_173680 ) ) ( not ( = ?auto_173679 ?auto_173682 ) ) ( not ( = ?auto_173680 ?auto_173682 ) ) ( not ( = ?auto_173678 ?auto_173683 ) ) ( not ( = ?auto_173678 ?auto_173684 ) ) ( not ( = ?auto_173679 ?auto_173683 ) ) ( not ( = ?auto_173679 ?auto_173684 ) ) ( not ( = ?auto_173680 ?auto_173683 ) ) ( not ( = ?auto_173680 ?auto_173684 ) ) ( not ( = ?auto_173682 ?auto_173683 ) ) ( not ( = ?auto_173682 ?auto_173684 ) ) ( not ( = ?auto_173683 ?auto_173684 ) ) ( ON ?auto_173683 ?auto_173682 ) ( not ( = ?auto_173685 ?auto_173681 ) ) ( not ( = ?auto_173685 ?auto_173686 ) ) ( not ( = ?auto_173685 ?auto_173684 ) ) ( not ( = ?auto_173681 ?auto_173686 ) ) ( not ( = ?auto_173681 ?auto_173684 ) ) ( not ( = ?auto_173686 ?auto_173684 ) ) ( not ( = ?auto_173678 ?auto_173686 ) ) ( not ( = ?auto_173678 ?auto_173685 ) ) ( not ( = ?auto_173678 ?auto_173681 ) ) ( not ( = ?auto_173679 ?auto_173686 ) ) ( not ( = ?auto_173679 ?auto_173685 ) ) ( not ( = ?auto_173679 ?auto_173681 ) ) ( not ( = ?auto_173680 ?auto_173686 ) ) ( not ( = ?auto_173680 ?auto_173685 ) ) ( not ( = ?auto_173680 ?auto_173681 ) ) ( not ( = ?auto_173682 ?auto_173686 ) ) ( not ( = ?auto_173682 ?auto_173685 ) ) ( not ( = ?auto_173682 ?auto_173681 ) ) ( not ( = ?auto_173683 ?auto_173686 ) ) ( not ( = ?auto_173683 ?auto_173685 ) ) ( not ( = ?auto_173683 ?auto_173681 ) ) ( ON ?auto_173684 ?auto_173683 ) ( ON ?auto_173686 ?auto_173684 ) ( ON ?auto_173681 ?auto_173686 ) ( ON ?auto_173685 ?auto_173681 ) ( CLEAR ?auto_173685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173678 ?auto_173679 ?auto_173680 ?auto_173682 ?auto_173683 ?auto_173684 ?auto_173686 ?auto_173681 )
      ( MAKE-3PILE ?auto_173678 ?auto_173679 ?auto_173680 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173693 - BLOCK
      ?auto_173694 - BLOCK
      ?auto_173695 - BLOCK
      ?auto_173696 - BLOCK
      ?auto_173697 - BLOCK
      ?auto_173698 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_173698 ) ( CLEAR ?auto_173697 ) ( ON-TABLE ?auto_173693 ) ( ON ?auto_173694 ?auto_173693 ) ( ON ?auto_173695 ?auto_173694 ) ( ON ?auto_173696 ?auto_173695 ) ( ON ?auto_173697 ?auto_173696 ) ( not ( = ?auto_173693 ?auto_173694 ) ) ( not ( = ?auto_173693 ?auto_173695 ) ) ( not ( = ?auto_173693 ?auto_173696 ) ) ( not ( = ?auto_173693 ?auto_173697 ) ) ( not ( = ?auto_173693 ?auto_173698 ) ) ( not ( = ?auto_173694 ?auto_173695 ) ) ( not ( = ?auto_173694 ?auto_173696 ) ) ( not ( = ?auto_173694 ?auto_173697 ) ) ( not ( = ?auto_173694 ?auto_173698 ) ) ( not ( = ?auto_173695 ?auto_173696 ) ) ( not ( = ?auto_173695 ?auto_173697 ) ) ( not ( = ?auto_173695 ?auto_173698 ) ) ( not ( = ?auto_173696 ?auto_173697 ) ) ( not ( = ?auto_173696 ?auto_173698 ) ) ( not ( = ?auto_173697 ?auto_173698 ) ) )
    :subtasks
    ( ( !STACK ?auto_173698 ?auto_173697 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173699 - BLOCK
      ?auto_173700 - BLOCK
      ?auto_173701 - BLOCK
      ?auto_173702 - BLOCK
      ?auto_173703 - BLOCK
      ?auto_173704 - BLOCK
    )
    :vars
    (
      ?auto_173705 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173703 ) ( ON-TABLE ?auto_173699 ) ( ON ?auto_173700 ?auto_173699 ) ( ON ?auto_173701 ?auto_173700 ) ( ON ?auto_173702 ?auto_173701 ) ( ON ?auto_173703 ?auto_173702 ) ( not ( = ?auto_173699 ?auto_173700 ) ) ( not ( = ?auto_173699 ?auto_173701 ) ) ( not ( = ?auto_173699 ?auto_173702 ) ) ( not ( = ?auto_173699 ?auto_173703 ) ) ( not ( = ?auto_173699 ?auto_173704 ) ) ( not ( = ?auto_173700 ?auto_173701 ) ) ( not ( = ?auto_173700 ?auto_173702 ) ) ( not ( = ?auto_173700 ?auto_173703 ) ) ( not ( = ?auto_173700 ?auto_173704 ) ) ( not ( = ?auto_173701 ?auto_173702 ) ) ( not ( = ?auto_173701 ?auto_173703 ) ) ( not ( = ?auto_173701 ?auto_173704 ) ) ( not ( = ?auto_173702 ?auto_173703 ) ) ( not ( = ?auto_173702 ?auto_173704 ) ) ( not ( = ?auto_173703 ?auto_173704 ) ) ( ON ?auto_173704 ?auto_173705 ) ( CLEAR ?auto_173704 ) ( HAND-EMPTY ) ( not ( = ?auto_173699 ?auto_173705 ) ) ( not ( = ?auto_173700 ?auto_173705 ) ) ( not ( = ?auto_173701 ?auto_173705 ) ) ( not ( = ?auto_173702 ?auto_173705 ) ) ( not ( = ?auto_173703 ?auto_173705 ) ) ( not ( = ?auto_173704 ?auto_173705 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173704 ?auto_173705 )
      ( MAKE-6PILE ?auto_173699 ?auto_173700 ?auto_173701 ?auto_173702 ?auto_173703 ?auto_173704 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173706 - BLOCK
      ?auto_173707 - BLOCK
      ?auto_173708 - BLOCK
      ?auto_173709 - BLOCK
      ?auto_173710 - BLOCK
      ?auto_173711 - BLOCK
    )
    :vars
    (
      ?auto_173712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173706 ) ( ON ?auto_173707 ?auto_173706 ) ( ON ?auto_173708 ?auto_173707 ) ( ON ?auto_173709 ?auto_173708 ) ( not ( = ?auto_173706 ?auto_173707 ) ) ( not ( = ?auto_173706 ?auto_173708 ) ) ( not ( = ?auto_173706 ?auto_173709 ) ) ( not ( = ?auto_173706 ?auto_173710 ) ) ( not ( = ?auto_173706 ?auto_173711 ) ) ( not ( = ?auto_173707 ?auto_173708 ) ) ( not ( = ?auto_173707 ?auto_173709 ) ) ( not ( = ?auto_173707 ?auto_173710 ) ) ( not ( = ?auto_173707 ?auto_173711 ) ) ( not ( = ?auto_173708 ?auto_173709 ) ) ( not ( = ?auto_173708 ?auto_173710 ) ) ( not ( = ?auto_173708 ?auto_173711 ) ) ( not ( = ?auto_173709 ?auto_173710 ) ) ( not ( = ?auto_173709 ?auto_173711 ) ) ( not ( = ?auto_173710 ?auto_173711 ) ) ( ON ?auto_173711 ?auto_173712 ) ( CLEAR ?auto_173711 ) ( not ( = ?auto_173706 ?auto_173712 ) ) ( not ( = ?auto_173707 ?auto_173712 ) ) ( not ( = ?auto_173708 ?auto_173712 ) ) ( not ( = ?auto_173709 ?auto_173712 ) ) ( not ( = ?auto_173710 ?auto_173712 ) ) ( not ( = ?auto_173711 ?auto_173712 ) ) ( HOLDING ?auto_173710 ) ( CLEAR ?auto_173709 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173706 ?auto_173707 ?auto_173708 ?auto_173709 ?auto_173710 )
      ( MAKE-6PILE ?auto_173706 ?auto_173707 ?auto_173708 ?auto_173709 ?auto_173710 ?auto_173711 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173713 - BLOCK
      ?auto_173714 - BLOCK
      ?auto_173715 - BLOCK
      ?auto_173716 - BLOCK
      ?auto_173717 - BLOCK
      ?auto_173718 - BLOCK
    )
    :vars
    (
      ?auto_173719 - BLOCK
      ?auto_173720 - BLOCK
      ?auto_173721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173713 ) ( ON ?auto_173714 ?auto_173713 ) ( ON ?auto_173715 ?auto_173714 ) ( ON ?auto_173716 ?auto_173715 ) ( not ( = ?auto_173713 ?auto_173714 ) ) ( not ( = ?auto_173713 ?auto_173715 ) ) ( not ( = ?auto_173713 ?auto_173716 ) ) ( not ( = ?auto_173713 ?auto_173717 ) ) ( not ( = ?auto_173713 ?auto_173718 ) ) ( not ( = ?auto_173714 ?auto_173715 ) ) ( not ( = ?auto_173714 ?auto_173716 ) ) ( not ( = ?auto_173714 ?auto_173717 ) ) ( not ( = ?auto_173714 ?auto_173718 ) ) ( not ( = ?auto_173715 ?auto_173716 ) ) ( not ( = ?auto_173715 ?auto_173717 ) ) ( not ( = ?auto_173715 ?auto_173718 ) ) ( not ( = ?auto_173716 ?auto_173717 ) ) ( not ( = ?auto_173716 ?auto_173718 ) ) ( not ( = ?auto_173717 ?auto_173718 ) ) ( ON ?auto_173718 ?auto_173719 ) ( not ( = ?auto_173713 ?auto_173719 ) ) ( not ( = ?auto_173714 ?auto_173719 ) ) ( not ( = ?auto_173715 ?auto_173719 ) ) ( not ( = ?auto_173716 ?auto_173719 ) ) ( not ( = ?auto_173717 ?auto_173719 ) ) ( not ( = ?auto_173718 ?auto_173719 ) ) ( CLEAR ?auto_173716 ) ( ON ?auto_173717 ?auto_173718 ) ( CLEAR ?auto_173717 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173720 ) ( ON ?auto_173721 ?auto_173720 ) ( ON ?auto_173719 ?auto_173721 ) ( not ( = ?auto_173720 ?auto_173721 ) ) ( not ( = ?auto_173720 ?auto_173719 ) ) ( not ( = ?auto_173720 ?auto_173718 ) ) ( not ( = ?auto_173720 ?auto_173717 ) ) ( not ( = ?auto_173721 ?auto_173719 ) ) ( not ( = ?auto_173721 ?auto_173718 ) ) ( not ( = ?auto_173721 ?auto_173717 ) ) ( not ( = ?auto_173713 ?auto_173720 ) ) ( not ( = ?auto_173713 ?auto_173721 ) ) ( not ( = ?auto_173714 ?auto_173720 ) ) ( not ( = ?auto_173714 ?auto_173721 ) ) ( not ( = ?auto_173715 ?auto_173720 ) ) ( not ( = ?auto_173715 ?auto_173721 ) ) ( not ( = ?auto_173716 ?auto_173720 ) ) ( not ( = ?auto_173716 ?auto_173721 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173720 ?auto_173721 ?auto_173719 ?auto_173718 )
      ( MAKE-6PILE ?auto_173713 ?auto_173714 ?auto_173715 ?auto_173716 ?auto_173717 ?auto_173718 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173722 - BLOCK
      ?auto_173723 - BLOCK
      ?auto_173724 - BLOCK
      ?auto_173725 - BLOCK
      ?auto_173726 - BLOCK
      ?auto_173727 - BLOCK
    )
    :vars
    (
      ?auto_173728 - BLOCK
      ?auto_173729 - BLOCK
      ?auto_173730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173722 ) ( ON ?auto_173723 ?auto_173722 ) ( ON ?auto_173724 ?auto_173723 ) ( not ( = ?auto_173722 ?auto_173723 ) ) ( not ( = ?auto_173722 ?auto_173724 ) ) ( not ( = ?auto_173722 ?auto_173725 ) ) ( not ( = ?auto_173722 ?auto_173726 ) ) ( not ( = ?auto_173722 ?auto_173727 ) ) ( not ( = ?auto_173723 ?auto_173724 ) ) ( not ( = ?auto_173723 ?auto_173725 ) ) ( not ( = ?auto_173723 ?auto_173726 ) ) ( not ( = ?auto_173723 ?auto_173727 ) ) ( not ( = ?auto_173724 ?auto_173725 ) ) ( not ( = ?auto_173724 ?auto_173726 ) ) ( not ( = ?auto_173724 ?auto_173727 ) ) ( not ( = ?auto_173725 ?auto_173726 ) ) ( not ( = ?auto_173725 ?auto_173727 ) ) ( not ( = ?auto_173726 ?auto_173727 ) ) ( ON ?auto_173727 ?auto_173728 ) ( not ( = ?auto_173722 ?auto_173728 ) ) ( not ( = ?auto_173723 ?auto_173728 ) ) ( not ( = ?auto_173724 ?auto_173728 ) ) ( not ( = ?auto_173725 ?auto_173728 ) ) ( not ( = ?auto_173726 ?auto_173728 ) ) ( not ( = ?auto_173727 ?auto_173728 ) ) ( ON ?auto_173726 ?auto_173727 ) ( CLEAR ?auto_173726 ) ( ON-TABLE ?auto_173729 ) ( ON ?auto_173730 ?auto_173729 ) ( ON ?auto_173728 ?auto_173730 ) ( not ( = ?auto_173729 ?auto_173730 ) ) ( not ( = ?auto_173729 ?auto_173728 ) ) ( not ( = ?auto_173729 ?auto_173727 ) ) ( not ( = ?auto_173729 ?auto_173726 ) ) ( not ( = ?auto_173730 ?auto_173728 ) ) ( not ( = ?auto_173730 ?auto_173727 ) ) ( not ( = ?auto_173730 ?auto_173726 ) ) ( not ( = ?auto_173722 ?auto_173729 ) ) ( not ( = ?auto_173722 ?auto_173730 ) ) ( not ( = ?auto_173723 ?auto_173729 ) ) ( not ( = ?auto_173723 ?auto_173730 ) ) ( not ( = ?auto_173724 ?auto_173729 ) ) ( not ( = ?auto_173724 ?auto_173730 ) ) ( not ( = ?auto_173725 ?auto_173729 ) ) ( not ( = ?auto_173725 ?auto_173730 ) ) ( HOLDING ?auto_173725 ) ( CLEAR ?auto_173724 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173722 ?auto_173723 ?auto_173724 ?auto_173725 )
      ( MAKE-6PILE ?auto_173722 ?auto_173723 ?auto_173724 ?auto_173725 ?auto_173726 ?auto_173727 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173731 - BLOCK
      ?auto_173732 - BLOCK
      ?auto_173733 - BLOCK
      ?auto_173734 - BLOCK
      ?auto_173735 - BLOCK
      ?auto_173736 - BLOCK
    )
    :vars
    (
      ?auto_173737 - BLOCK
      ?auto_173738 - BLOCK
      ?auto_173739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173731 ) ( ON ?auto_173732 ?auto_173731 ) ( ON ?auto_173733 ?auto_173732 ) ( not ( = ?auto_173731 ?auto_173732 ) ) ( not ( = ?auto_173731 ?auto_173733 ) ) ( not ( = ?auto_173731 ?auto_173734 ) ) ( not ( = ?auto_173731 ?auto_173735 ) ) ( not ( = ?auto_173731 ?auto_173736 ) ) ( not ( = ?auto_173732 ?auto_173733 ) ) ( not ( = ?auto_173732 ?auto_173734 ) ) ( not ( = ?auto_173732 ?auto_173735 ) ) ( not ( = ?auto_173732 ?auto_173736 ) ) ( not ( = ?auto_173733 ?auto_173734 ) ) ( not ( = ?auto_173733 ?auto_173735 ) ) ( not ( = ?auto_173733 ?auto_173736 ) ) ( not ( = ?auto_173734 ?auto_173735 ) ) ( not ( = ?auto_173734 ?auto_173736 ) ) ( not ( = ?auto_173735 ?auto_173736 ) ) ( ON ?auto_173736 ?auto_173737 ) ( not ( = ?auto_173731 ?auto_173737 ) ) ( not ( = ?auto_173732 ?auto_173737 ) ) ( not ( = ?auto_173733 ?auto_173737 ) ) ( not ( = ?auto_173734 ?auto_173737 ) ) ( not ( = ?auto_173735 ?auto_173737 ) ) ( not ( = ?auto_173736 ?auto_173737 ) ) ( ON ?auto_173735 ?auto_173736 ) ( ON-TABLE ?auto_173738 ) ( ON ?auto_173739 ?auto_173738 ) ( ON ?auto_173737 ?auto_173739 ) ( not ( = ?auto_173738 ?auto_173739 ) ) ( not ( = ?auto_173738 ?auto_173737 ) ) ( not ( = ?auto_173738 ?auto_173736 ) ) ( not ( = ?auto_173738 ?auto_173735 ) ) ( not ( = ?auto_173739 ?auto_173737 ) ) ( not ( = ?auto_173739 ?auto_173736 ) ) ( not ( = ?auto_173739 ?auto_173735 ) ) ( not ( = ?auto_173731 ?auto_173738 ) ) ( not ( = ?auto_173731 ?auto_173739 ) ) ( not ( = ?auto_173732 ?auto_173738 ) ) ( not ( = ?auto_173732 ?auto_173739 ) ) ( not ( = ?auto_173733 ?auto_173738 ) ) ( not ( = ?auto_173733 ?auto_173739 ) ) ( not ( = ?auto_173734 ?auto_173738 ) ) ( not ( = ?auto_173734 ?auto_173739 ) ) ( CLEAR ?auto_173733 ) ( ON ?auto_173734 ?auto_173735 ) ( CLEAR ?auto_173734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173738 ?auto_173739 ?auto_173737 ?auto_173736 ?auto_173735 )
      ( MAKE-6PILE ?auto_173731 ?auto_173732 ?auto_173733 ?auto_173734 ?auto_173735 ?auto_173736 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173740 - BLOCK
      ?auto_173741 - BLOCK
      ?auto_173742 - BLOCK
      ?auto_173743 - BLOCK
      ?auto_173744 - BLOCK
      ?auto_173745 - BLOCK
    )
    :vars
    (
      ?auto_173747 - BLOCK
      ?auto_173746 - BLOCK
      ?auto_173748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173740 ) ( ON ?auto_173741 ?auto_173740 ) ( not ( = ?auto_173740 ?auto_173741 ) ) ( not ( = ?auto_173740 ?auto_173742 ) ) ( not ( = ?auto_173740 ?auto_173743 ) ) ( not ( = ?auto_173740 ?auto_173744 ) ) ( not ( = ?auto_173740 ?auto_173745 ) ) ( not ( = ?auto_173741 ?auto_173742 ) ) ( not ( = ?auto_173741 ?auto_173743 ) ) ( not ( = ?auto_173741 ?auto_173744 ) ) ( not ( = ?auto_173741 ?auto_173745 ) ) ( not ( = ?auto_173742 ?auto_173743 ) ) ( not ( = ?auto_173742 ?auto_173744 ) ) ( not ( = ?auto_173742 ?auto_173745 ) ) ( not ( = ?auto_173743 ?auto_173744 ) ) ( not ( = ?auto_173743 ?auto_173745 ) ) ( not ( = ?auto_173744 ?auto_173745 ) ) ( ON ?auto_173745 ?auto_173747 ) ( not ( = ?auto_173740 ?auto_173747 ) ) ( not ( = ?auto_173741 ?auto_173747 ) ) ( not ( = ?auto_173742 ?auto_173747 ) ) ( not ( = ?auto_173743 ?auto_173747 ) ) ( not ( = ?auto_173744 ?auto_173747 ) ) ( not ( = ?auto_173745 ?auto_173747 ) ) ( ON ?auto_173744 ?auto_173745 ) ( ON-TABLE ?auto_173746 ) ( ON ?auto_173748 ?auto_173746 ) ( ON ?auto_173747 ?auto_173748 ) ( not ( = ?auto_173746 ?auto_173748 ) ) ( not ( = ?auto_173746 ?auto_173747 ) ) ( not ( = ?auto_173746 ?auto_173745 ) ) ( not ( = ?auto_173746 ?auto_173744 ) ) ( not ( = ?auto_173748 ?auto_173747 ) ) ( not ( = ?auto_173748 ?auto_173745 ) ) ( not ( = ?auto_173748 ?auto_173744 ) ) ( not ( = ?auto_173740 ?auto_173746 ) ) ( not ( = ?auto_173740 ?auto_173748 ) ) ( not ( = ?auto_173741 ?auto_173746 ) ) ( not ( = ?auto_173741 ?auto_173748 ) ) ( not ( = ?auto_173742 ?auto_173746 ) ) ( not ( = ?auto_173742 ?auto_173748 ) ) ( not ( = ?auto_173743 ?auto_173746 ) ) ( not ( = ?auto_173743 ?auto_173748 ) ) ( ON ?auto_173743 ?auto_173744 ) ( CLEAR ?auto_173743 ) ( HOLDING ?auto_173742 ) ( CLEAR ?auto_173741 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173740 ?auto_173741 ?auto_173742 )
      ( MAKE-6PILE ?auto_173740 ?auto_173741 ?auto_173742 ?auto_173743 ?auto_173744 ?auto_173745 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173749 - BLOCK
      ?auto_173750 - BLOCK
      ?auto_173751 - BLOCK
      ?auto_173752 - BLOCK
      ?auto_173753 - BLOCK
      ?auto_173754 - BLOCK
    )
    :vars
    (
      ?auto_173755 - BLOCK
      ?auto_173756 - BLOCK
      ?auto_173757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173749 ) ( ON ?auto_173750 ?auto_173749 ) ( not ( = ?auto_173749 ?auto_173750 ) ) ( not ( = ?auto_173749 ?auto_173751 ) ) ( not ( = ?auto_173749 ?auto_173752 ) ) ( not ( = ?auto_173749 ?auto_173753 ) ) ( not ( = ?auto_173749 ?auto_173754 ) ) ( not ( = ?auto_173750 ?auto_173751 ) ) ( not ( = ?auto_173750 ?auto_173752 ) ) ( not ( = ?auto_173750 ?auto_173753 ) ) ( not ( = ?auto_173750 ?auto_173754 ) ) ( not ( = ?auto_173751 ?auto_173752 ) ) ( not ( = ?auto_173751 ?auto_173753 ) ) ( not ( = ?auto_173751 ?auto_173754 ) ) ( not ( = ?auto_173752 ?auto_173753 ) ) ( not ( = ?auto_173752 ?auto_173754 ) ) ( not ( = ?auto_173753 ?auto_173754 ) ) ( ON ?auto_173754 ?auto_173755 ) ( not ( = ?auto_173749 ?auto_173755 ) ) ( not ( = ?auto_173750 ?auto_173755 ) ) ( not ( = ?auto_173751 ?auto_173755 ) ) ( not ( = ?auto_173752 ?auto_173755 ) ) ( not ( = ?auto_173753 ?auto_173755 ) ) ( not ( = ?auto_173754 ?auto_173755 ) ) ( ON ?auto_173753 ?auto_173754 ) ( ON-TABLE ?auto_173756 ) ( ON ?auto_173757 ?auto_173756 ) ( ON ?auto_173755 ?auto_173757 ) ( not ( = ?auto_173756 ?auto_173757 ) ) ( not ( = ?auto_173756 ?auto_173755 ) ) ( not ( = ?auto_173756 ?auto_173754 ) ) ( not ( = ?auto_173756 ?auto_173753 ) ) ( not ( = ?auto_173757 ?auto_173755 ) ) ( not ( = ?auto_173757 ?auto_173754 ) ) ( not ( = ?auto_173757 ?auto_173753 ) ) ( not ( = ?auto_173749 ?auto_173756 ) ) ( not ( = ?auto_173749 ?auto_173757 ) ) ( not ( = ?auto_173750 ?auto_173756 ) ) ( not ( = ?auto_173750 ?auto_173757 ) ) ( not ( = ?auto_173751 ?auto_173756 ) ) ( not ( = ?auto_173751 ?auto_173757 ) ) ( not ( = ?auto_173752 ?auto_173756 ) ) ( not ( = ?auto_173752 ?auto_173757 ) ) ( ON ?auto_173752 ?auto_173753 ) ( CLEAR ?auto_173750 ) ( ON ?auto_173751 ?auto_173752 ) ( CLEAR ?auto_173751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173756 ?auto_173757 ?auto_173755 ?auto_173754 ?auto_173753 ?auto_173752 )
      ( MAKE-6PILE ?auto_173749 ?auto_173750 ?auto_173751 ?auto_173752 ?auto_173753 ?auto_173754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173758 - BLOCK
      ?auto_173759 - BLOCK
      ?auto_173760 - BLOCK
      ?auto_173761 - BLOCK
      ?auto_173762 - BLOCK
      ?auto_173763 - BLOCK
    )
    :vars
    (
      ?auto_173765 - BLOCK
      ?auto_173764 - BLOCK
      ?auto_173766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173758 ) ( not ( = ?auto_173758 ?auto_173759 ) ) ( not ( = ?auto_173758 ?auto_173760 ) ) ( not ( = ?auto_173758 ?auto_173761 ) ) ( not ( = ?auto_173758 ?auto_173762 ) ) ( not ( = ?auto_173758 ?auto_173763 ) ) ( not ( = ?auto_173759 ?auto_173760 ) ) ( not ( = ?auto_173759 ?auto_173761 ) ) ( not ( = ?auto_173759 ?auto_173762 ) ) ( not ( = ?auto_173759 ?auto_173763 ) ) ( not ( = ?auto_173760 ?auto_173761 ) ) ( not ( = ?auto_173760 ?auto_173762 ) ) ( not ( = ?auto_173760 ?auto_173763 ) ) ( not ( = ?auto_173761 ?auto_173762 ) ) ( not ( = ?auto_173761 ?auto_173763 ) ) ( not ( = ?auto_173762 ?auto_173763 ) ) ( ON ?auto_173763 ?auto_173765 ) ( not ( = ?auto_173758 ?auto_173765 ) ) ( not ( = ?auto_173759 ?auto_173765 ) ) ( not ( = ?auto_173760 ?auto_173765 ) ) ( not ( = ?auto_173761 ?auto_173765 ) ) ( not ( = ?auto_173762 ?auto_173765 ) ) ( not ( = ?auto_173763 ?auto_173765 ) ) ( ON ?auto_173762 ?auto_173763 ) ( ON-TABLE ?auto_173764 ) ( ON ?auto_173766 ?auto_173764 ) ( ON ?auto_173765 ?auto_173766 ) ( not ( = ?auto_173764 ?auto_173766 ) ) ( not ( = ?auto_173764 ?auto_173765 ) ) ( not ( = ?auto_173764 ?auto_173763 ) ) ( not ( = ?auto_173764 ?auto_173762 ) ) ( not ( = ?auto_173766 ?auto_173765 ) ) ( not ( = ?auto_173766 ?auto_173763 ) ) ( not ( = ?auto_173766 ?auto_173762 ) ) ( not ( = ?auto_173758 ?auto_173764 ) ) ( not ( = ?auto_173758 ?auto_173766 ) ) ( not ( = ?auto_173759 ?auto_173764 ) ) ( not ( = ?auto_173759 ?auto_173766 ) ) ( not ( = ?auto_173760 ?auto_173764 ) ) ( not ( = ?auto_173760 ?auto_173766 ) ) ( not ( = ?auto_173761 ?auto_173764 ) ) ( not ( = ?auto_173761 ?auto_173766 ) ) ( ON ?auto_173761 ?auto_173762 ) ( ON ?auto_173760 ?auto_173761 ) ( CLEAR ?auto_173760 ) ( HOLDING ?auto_173759 ) ( CLEAR ?auto_173758 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173758 ?auto_173759 )
      ( MAKE-6PILE ?auto_173758 ?auto_173759 ?auto_173760 ?auto_173761 ?auto_173762 ?auto_173763 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173767 - BLOCK
      ?auto_173768 - BLOCK
      ?auto_173769 - BLOCK
      ?auto_173770 - BLOCK
      ?auto_173771 - BLOCK
      ?auto_173772 - BLOCK
    )
    :vars
    (
      ?auto_173775 - BLOCK
      ?auto_173773 - BLOCK
      ?auto_173774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173767 ) ( not ( = ?auto_173767 ?auto_173768 ) ) ( not ( = ?auto_173767 ?auto_173769 ) ) ( not ( = ?auto_173767 ?auto_173770 ) ) ( not ( = ?auto_173767 ?auto_173771 ) ) ( not ( = ?auto_173767 ?auto_173772 ) ) ( not ( = ?auto_173768 ?auto_173769 ) ) ( not ( = ?auto_173768 ?auto_173770 ) ) ( not ( = ?auto_173768 ?auto_173771 ) ) ( not ( = ?auto_173768 ?auto_173772 ) ) ( not ( = ?auto_173769 ?auto_173770 ) ) ( not ( = ?auto_173769 ?auto_173771 ) ) ( not ( = ?auto_173769 ?auto_173772 ) ) ( not ( = ?auto_173770 ?auto_173771 ) ) ( not ( = ?auto_173770 ?auto_173772 ) ) ( not ( = ?auto_173771 ?auto_173772 ) ) ( ON ?auto_173772 ?auto_173775 ) ( not ( = ?auto_173767 ?auto_173775 ) ) ( not ( = ?auto_173768 ?auto_173775 ) ) ( not ( = ?auto_173769 ?auto_173775 ) ) ( not ( = ?auto_173770 ?auto_173775 ) ) ( not ( = ?auto_173771 ?auto_173775 ) ) ( not ( = ?auto_173772 ?auto_173775 ) ) ( ON ?auto_173771 ?auto_173772 ) ( ON-TABLE ?auto_173773 ) ( ON ?auto_173774 ?auto_173773 ) ( ON ?auto_173775 ?auto_173774 ) ( not ( = ?auto_173773 ?auto_173774 ) ) ( not ( = ?auto_173773 ?auto_173775 ) ) ( not ( = ?auto_173773 ?auto_173772 ) ) ( not ( = ?auto_173773 ?auto_173771 ) ) ( not ( = ?auto_173774 ?auto_173775 ) ) ( not ( = ?auto_173774 ?auto_173772 ) ) ( not ( = ?auto_173774 ?auto_173771 ) ) ( not ( = ?auto_173767 ?auto_173773 ) ) ( not ( = ?auto_173767 ?auto_173774 ) ) ( not ( = ?auto_173768 ?auto_173773 ) ) ( not ( = ?auto_173768 ?auto_173774 ) ) ( not ( = ?auto_173769 ?auto_173773 ) ) ( not ( = ?auto_173769 ?auto_173774 ) ) ( not ( = ?auto_173770 ?auto_173773 ) ) ( not ( = ?auto_173770 ?auto_173774 ) ) ( ON ?auto_173770 ?auto_173771 ) ( ON ?auto_173769 ?auto_173770 ) ( CLEAR ?auto_173767 ) ( ON ?auto_173768 ?auto_173769 ) ( CLEAR ?auto_173768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173773 ?auto_173774 ?auto_173775 ?auto_173772 ?auto_173771 ?auto_173770 ?auto_173769 )
      ( MAKE-6PILE ?auto_173767 ?auto_173768 ?auto_173769 ?auto_173770 ?auto_173771 ?auto_173772 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173776 - BLOCK
      ?auto_173777 - BLOCK
      ?auto_173778 - BLOCK
      ?auto_173779 - BLOCK
      ?auto_173780 - BLOCK
      ?auto_173781 - BLOCK
    )
    :vars
    (
      ?auto_173784 - BLOCK
      ?auto_173782 - BLOCK
      ?auto_173783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173776 ?auto_173777 ) ) ( not ( = ?auto_173776 ?auto_173778 ) ) ( not ( = ?auto_173776 ?auto_173779 ) ) ( not ( = ?auto_173776 ?auto_173780 ) ) ( not ( = ?auto_173776 ?auto_173781 ) ) ( not ( = ?auto_173777 ?auto_173778 ) ) ( not ( = ?auto_173777 ?auto_173779 ) ) ( not ( = ?auto_173777 ?auto_173780 ) ) ( not ( = ?auto_173777 ?auto_173781 ) ) ( not ( = ?auto_173778 ?auto_173779 ) ) ( not ( = ?auto_173778 ?auto_173780 ) ) ( not ( = ?auto_173778 ?auto_173781 ) ) ( not ( = ?auto_173779 ?auto_173780 ) ) ( not ( = ?auto_173779 ?auto_173781 ) ) ( not ( = ?auto_173780 ?auto_173781 ) ) ( ON ?auto_173781 ?auto_173784 ) ( not ( = ?auto_173776 ?auto_173784 ) ) ( not ( = ?auto_173777 ?auto_173784 ) ) ( not ( = ?auto_173778 ?auto_173784 ) ) ( not ( = ?auto_173779 ?auto_173784 ) ) ( not ( = ?auto_173780 ?auto_173784 ) ) ( not ( = ?auto_173781 ?auto_173784 ) ) ( ON ?auto_173780 ?auto_173781 ) ( ON-TABLE ?auto_173782 ) ( ON ?auto_173783 ?auto_173782 ) ( ON ?auto_173784 ?auto_173783 ) ( not ( = ?auto_173782 ?auto_173783 ) ) ( not ( = ?auto_173782 ?auto_173784 ) ) ( not ( = ?auto_173782 ?auto_173781 ) ) ( not ( = ?auto_173782 ?auto_173780 ) ) ( not ( = ?auto_173783 ?auto_173784 ) ) ( not ( = ?auto_173783 ?auto_173781 ) ) ( not ( = ?auto_173783 ?auto_173780 ) ) ( not ( = ?auto_173776 ?auto_173782 ) ) ( not ( = ?auto_173776 ?auto_173783 ) ) ( not ( = ?auto_173777 ?auto_173782 ) ) ( not ( = ?auto_173777 ?auto_173783 ) ) ( not ( = ?auto_173778 ?auto_173782 ) ) ( not ( = ?auto_173778 ?auto_173783 ) ) ( not ( = ?auto_173779 ?auto_173782 ) ) ( not ( = ?auto_173779 ?auto_173783 ) ) ( ON ?auto_173779 ?auto_173780 ) ( ON ?auto_173778 ?auto_173779 ) ( ON ?auto_173777 ?auto_173778 ) ( CLEAR ?auto_173777 ) ( HOLDING ?auto_173776 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173776 )
      ( MAKE-6PILE ?auto_173776 ?auto_173777 ?auto_173778 ?auto_173779 ?auto_173780 ?auto_173781 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_173785 - BLOCK
      ?auto_173786 - BLOCK
      ?auto_173787 - BLOCK
      ?auto_173788 - BLOCK
      ?auto_173789 - BLOCK
      ?auto_173790 - BLOCK
    )
    :vars
    (
      ?auto_173791 - BLOCK
      ?auto_173792 - BLOCK
      ?auto_173793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173785 ?auto_173786 ) ) ( not ( = ?auto_173785 ?auto_173787 ) ) ( not ( = ?auto_173785 ?auto_173788 ) ) ( not ( = ?auto_173785 ?auto_173789 ) ) ( not ( = ?auto_173785 ?auto_173790 ) ) ( not ( = ?auto_173786 ?auto_173787 ) ) ( not ( = ?auto_173786 ?auto_173788 ) ) ( not ( = ?auto_173786 ?auto_173789 ) ) ( not ( = ?auto_173786 ?auto_173790 ) ) ( not ( = ?auto_173787 ?auto_173788 ) ) ( not ( = ?auto_173787 ?auto_173789 ) ) ( not ( = ?auto_173787 ?auto_173790 ) ) ( not ( = ?auto_173788 ?auto_173789 ) ) ( not ( = ?auto_173788 ?auto_173790 ) ) ( not ( = ?auto_173789 ?auto_173790 ) ) ( ON ?auto_173790 ?auto_173791 ) ( not ( = ?auto_173785 ?auto_173791 ) ) ( not ( = ?auto_173786 ?auto_173791 ) ) ( not ( = ?auto_173787 ?auto_173791 ) ) ( not ( = ?auto_173788 ?auto_173791 ) ) ( not ( = ?auto_173789 ?auto_173791 ) ) ( not ( = ?auto_173790 ?auto_173791 ) ) ( ON ?auto_173789 ?auto_173790 ) ( ON-TABLE ?auto_173792 ) ( ON ?auto_173793 ?auto_173792 ) ( ON ?auto_173791 ?auto_173793 ) ( not ( = ?auto_173792 ?auto_173793 ) ) ( not ( = ?auto_173792 ?auto_173791 ) ) ( not ( = ?auto_173792 ?auto_173790 ) ) ( not ( = ?auto_173792 ?auto_173789 ) ) ( not ( = ?auto_173793 ?auto_173791 ) ) ( not ( = ?auto_173793 ?auto_173790 ) ) ( not ( = ?auto_173793 ?auto_173789 ) ) ( not ( = ?auto_173785 ?auto_173792 ) ) ( not ( = ?auto_173785 ?auto_173793 ) ) ( not ( = ?auto_173786 ?auto_173792 ) ) ( not ( = ?auto_173786 ?auto_173793 ) ) ( not ( = ?auto_173787 ?auto_173792 ) ) ( not ( = ?auto_173787 ?auto_173793 ) ) ( not ( = ?auto_173788 ?auto_173792 ) ) ( not ( = ?auto_173788 ?auto_173793 ) ) ( ON ?auto_173788 ?auto_173789 ) ( ON ?auto_173787 ?auto_173788 ) ( ON ?auto_173786 ?auto_173787 ) ( ON ?auto_173785 ?auto_173786 ) ( CLEAR ?auto_173785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173792 ?auto_173793 ?auto_173791 ?auto_173790 ?auto_173789 ?auto_173788 ?auto_173787 ?auto_173786 )
      ( MAKE-6PILE ?auto_173785 ?auto_173786 ?auto_173787 ?auto_173788 ?auto_173789 ?auto_173790 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173796 - BLOCK
      ?auto_173797 - BLOCK
    )
    :vars
    (
      ?auto_173798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173798 ?auto_173797 ) ( CLEAR ?auto_173798 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173796 ) ( ON ?auto_173797 ?auto_173796 ) ( not ( = ?auto_173796 ?auto_173797 ) ) ( not ( = ?auto_173796 ?auto_173798 ) ) ( not ( = ?auto_173797 ?auto_173798 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173798 ?auto_173797 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173799 - BLOCK
      ?auto_173800 - BLOCK
    )
    :vars
    (
      ?auto_173801 - BLOCK
      ?auto_173802 - BLOCK
      ?auto_173803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173801 ?auto_173800 ) ( CLEAR ?auto_173801 ) ( ON-TABLE ?auto_173799 ) ( ON ?auto_173800 ?auto_173799 ) ( not ( = ?auto_173799 ?auto_173800 ) ) ( not ( = ?auto_173799 ?auto_173801 ) ) ( not ( = ?auto_173800 ?auto_173801 ) ) ( HOLDING ?auto_173802 ) ( CLEAR ?auto_173803 ) ( not ( = ?auto_173799 ?auto_173802 ) ) ( not ( = ?auto_173799 ?auto_173803 ) ) ( not ( = ?auto_173800 ?auto_173802 ) ) ( not ( = ?auto_173800 ?auto_173803 ) ) ( not ( = ?auto_173801 ?auto_173802 ) ) ( not ( = ?auto_173801 ?auto_173803 ) ) ( not ( = ?auto_173802 ?auto_173803 ) ) )
    :subtasks
    ( ( !STACK ?auto_173802 ?auto_173803 )
      ( MAKE-2PILE ?auto_173799 ?auto_173800 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173804 - BLOCK
      ?auto_173805 - BLOCK
    )
    :vars
    (
      ?auto_173808 - BLOCK
      ?auto_173807 - BLOCK
      ?auto_173806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173808 ?auto_173805 ) ( ON-TABLE ?auto_173804 ) ( ON ?auto_173805 ?auto_173804 ) ( not ( = ?auto_173804 ?auto_173805 ) ) ( not ( = ?auto_173804 ?auto_173808 ) ) ( not ( = ?auto_173805 ?auto_173808 ) ) ( CLEAR ?auto_173807 ) ( not ( = ?auto_173804 ?auto_173806 ) ) ( not ( = ?auto_173804 ?auto_173807 ) ) ( not ( = ?auto_173805 ?auto_173806 ) ) ( not ( = ?auto_173805 ?auto_173807 ) ) ( not ( = ?auto_173808 ?auto_173806 ) ) ( not ( = ?auto_173808 ?auto_173807 ) ) ( not ( = ?auto_173806 ?auto_173807 ) ) ( ON ?auto_173806 ?auto_173808 ) ( CLEAR ?auto_173806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173804 ?auto_173805 ?auto_173808 )
      ( MAKE-2PILE ?auto_173804 ?auto_173805 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173809 - BLOCK
      ?auto_173810 - BLOCK
    )
    :vars
    (
      ?auto_173813 - BLOCK
      ?auto_173811 - BLOCK
      ?auto_173812 - BLOCK
      ?auto_173814 - BLOCK
      ?auto_173815 - BLOCK
      ?auto_173816 - BLOCK
      ?auto_173817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173813 ?auto_173810 ) ( ON-TABLE ?auto_173809 ) ( ON ?auto_173810 ?auto_173809 ) ( not ( = ?auto_173809 ?auto_173810 ) ) ( not ( = ?auto_173809 ?auto_173813 ) ) ( not ( = ?auto_173810 ?auto_173813 ) ) ( not ( = ?auto_173809 ?auto_173811 ) ) ( not ( = ?auto_173809 ?auto_173812 ) ) ( not ( = ?auto_173810 ?auto_173811 ) ) ( not ( = ?auto_173810 ?auto_173812 ) ) ( not ( = ?auto_173813 ?auto_173811 ) ) ( not ( = ?auto_173813 ?auto_173812 ) ) ( not ( = ?auto_173811 ?auto_173812 ) ) ( ON ?auto_173811 ?auto_173813 ) ( CLEAR ?auto_173811 ) ( HOLDING ?auto_173812 ) ( CLEAR ?auto_173814 ) ( ON-TABLE ?auto_173815 ) ( ON ?auto_173816 ?auto_173815 ) ( ON ?auto_173817 ?auto_173816 ) ( ON ?auto_173814 ?auto_173817 ) ( not ( = ?auto_173815 ?auto_173816 ) ) ( not ( = ?auto_173815 ?auto_173817 ) ) ( not ( = ?auto_173815 ?auto_173814 ) ) ( not ( = ?auto_173815 ?auto_173812 ) ) ( not ( = ?auto_173816 ?auto_173817 ) ) ( not ( = ?auto_173816 ?auto_173814 ) ) ( not ( = ?auto_173816 ?auto_173812 ) ) ( not ( = ?auto_173817 ?auto_173814 ) ) ( not ( = ?auto_173817 ?auto_173812 ) ) ( not ( = ?auto_173814 ?auto_173812 ) ) ( not ( = ?auto_173809 ?auto_173814 ) ) ( not ( = ?auto_173809 ?auto_173815 ) ) ( not ( = ?auto_173809 ?auto_173816 ) ) ( not ( = ?auto_173809 ?auto_173817 ) ) ( not ( = ?auto_173810 ?auto_173814 ) ) ( not ( = ?auto_173810 ?auto_173815 ) ) ( not ( = ?auto_173810 ?auto_173816 ) ) ( not ( = ?auto_173810 ?auto_173817 ) ) ( not ( = ?auto_173813 ?auto_173814 ) ) ( not ( = ?auto_173813 ?auto_173815 ) ) ( not ( = ?auto_173813 ?auto_173816 ) ) ( not ( = ?auto_173813 ?auto_173817 ) ) ( not ( = ?auto_173811 ?auto_173814 ) ) ( not ( = ?auto_173811 ?auto_173815 ) ) ( not ( = ?auto_173811 ?auto_173816 ) ) ( not ( = ?auto_173811 ?auto_173817 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173815 ?auto_173816 ?auto_173817 ?auto_173814 ?auto_173812 )
      ( MAKE-2PILE ?auto_173809 ?auto_173810 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173818 - BLOCK
      ?auto_173819 - BLOCK
    )
    :vars
    (
      ?auto_173826 - BLOCK
      ?auto_173820 - BLOCK
      ?auto_173824 - BLOCK
      ?auto_173823 - BLOCK
      ?auto_173821 - BLOCK
      ?auto_173825 - BLOCK
      ?auto_173822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173826 ?auto_173819 ) ( ON-TABLE ?auto_173818 ) ( ON ?auto_173819 ?auto_173818 ) ( not ( = ?auto_173818 ?auto_173819 ) ) ( not ( = ?auto_173818 ?auto_173826 ) ) ( not ( = ?auto_173819 ?auto_173826 ) ) ( not ( = ?auto_173818 ?auto_173820 ) ) ( not ( = ?auto_173818 ?auto_173824 ) ) ( not ( = ?auto_173819 ?auto_173820 ) ) ( not ( = ?auto_173819 ?auto_173824 ) ) ( not ( = ?auto_173826 ?auto_173820 ) ) ( not ( = ?auto_173826 ?auto_173824 ) ) ( not ( = ?auto_173820 ?auto_173824 ) ) ( ON ?auto_173820 ?auto_173826 ) ( CLEAR ?auto_173823 ) ( ON-TABLE ?auto_173821 ) ( ON ?auto_173825 ?auto_173821 ) ( ON ?auto_173822 ?auto_173825 ) ( ON ?auto_173823 ?auto_173822 ) ( not ( = ?auto_173821 ?auto_173825 ) ) ( not ( = ?auto_173821 ?auto_173822 ) ) ( not ( = ?auto_173821 ?auto_173823 ) ) ( not ( = ?auto_173821 ?auto_173824 ) ) ( not ( = ?auto_173825 ?auto_173822 ) ) ( not ( = ?auto_173825 ?auto_173823 ) ) ( not ( = ?auto_173825 ?auto_173824 ) ) ( not ( = ?auto_173822 ?auto_173823 ) ) ( not ( = ?auto_173822 ?auto_173824 ) ) ( not ( = ?auto_173823 ?auto_173824 ) ) ( not ( = ?auto_173818 ?auto_173823 ) ) ( not ( = ?auto_173818 ?auto_173821 ) ) ( not ( = ?auto_173818 ?auto_173825 ) ) ( not ( = ?auto_173818 ?auto_173822 ) ) ( not ( = ?auto_173819 ?auto_173823 ) ) ( not ( = ?auto_173819 ?auto_173821 ) ) ( not ( = ?auto_173819 ?auto_173825 ) ) ( not ( = ?auto_173819 ?auto_173822 ) ) ( not ( = ?auto_173826 ?auto_173823 ) ) ( not ( = ?auto_173826 ?auto_173821 ) ) ( not ( = ?auto_173826 ?auto_173825 ) ) ( not ( = ?auto_173826 ?auto_173822 ) ) ( not ( = ?auto_173820 ?auto_173823 ) ) ( not ( = ?auto_173820 ?auto_173821 ) ) ( not ( = ?auto_173820 ?auto_173825 ) ) ( not ( = ?auto_173820 ?auto_173822 ) ) ( ON ?auto_173824 ?auto_173820 ) ( CLEAR ?auto_173824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173818 ?auto_173819 ?auto_173826 ?auto_173820 )
      ( MAKE-2PILE ?auto_173818 ?auto_173819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173827 - BLOCK
      ?auto_173828 - BLOCK
    )
    :vars
    (
      ?auto_173833 - BLOCK
      ?auto_173831 - BLOCK
      ?auto_173835 - BLOCK
      ?auto_173832 - BLOCK
      ?auto_173829 - BLOCK
      ?auto_173834 - BLOCK
      ?auto_173830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173833 ?auto_173828 ) ( ON-TABLE ?auto_173827 ) ( ON ?auto_173828 ?auto_173827 ) ( not ( = ?auto_173827 ?auto_173828 ) ) ( not ( = ?auto_173827 ?auto_173833 ) ) ( not ( = ?auto_173828 ?auto_173833 ) ) ( not ( = ?auto_173827 ?auto_173831 ) ) ( not ( = ?auto_173827 ?auto_173835 ) ) ( not ( = ?auto_173828 ?auto_173831 ) ) ( not ( = ?auto_173828 ?auto_173835 ) ) ( not ( = ?auto_173833 ?auto_173831 ) ) ( not ( = ?auto_173833 ?auto_173835 ) ) ( not ( = ?auto_173831 ?auto_173835 ) ) ( ON ?auto_173831 ?auto_173833 ) ( ON-TABLE ?auto_173832 ) ( ON ?auto_173829 ?auto_173832 ) ( ON ?auto_173834 ?auto_173829 ) ( not ( = ?auto_173832 ?auto_173829 ) ) ( not ( = ?auto_173832 ?auto_173834 ) ) ( not ( = ?auto_173832 ?auto_173830 ) ) ( not ( = ?auto_173832 ?auto_173835 ) ) ( not ( = ?auto_173829 ?auto_173834 ) ) ( not ( = ?auto_173829 ?auto_173830 ) ) ( not ( = ?auto_173829 ?auto_173835 ) ) ( not ( = ?auto_173834 ?auto_173830 ) ) ( not ( = ?auto_173834 ?auto_173835 ) ) ( not ( = ?auto_173830 ?auto_173835 ) ) ( not ( = ?auto_173827 ?auto_173830 ) ) ( not ( = ?auto_173827 ?auto_173832 ) ) ( not ( = ?auto_173827 ?auto_173829 ) ) ( not ( = ?auto_173827 ?auto_173834 ) ) ( not ( = ?auto_173828 ?auto_173830 ) ) ( not ( = ?auto_173828 ?auto_173832 ) ) ( not ( = ?auto_173828 ?auto_173829 ) ) ( not ( = ?auto_173828 ?auto_173834 ) ) ( not ( = ?auto_173833 ?auto_173830 ) ) ( not ( = ?auto_173833 ?auto_173832 ) ) ( not ( = ?auto_173833 ?auto_173829 ) ) ( not ( = ?auto_173833 ?auto_173834 ) ) ( not ( = ?auto_173831 ?auto_173830 ) ) ( not ( = ?auto_173831 ?auto_173832 ) ) ( not ( = ?auto_173831 ?auto_173829 ) ) ( not ( = ?auto_173831 ?auto_173834 ) ) ( ON ?auto_173835 ?auto_173831 ) ( CLEAR ?auto_173835 ) ( HOLDING ?auto_173830 ) ( CLEAR ?auto_173834 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173832 ?auto_173829 ?auto_173834 ?auto_173830 )
      ( MAKE-2PILE ?auto_173827 ?auto_173828 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173836 - BLOCK
      ?auto_173837 - BLOCK
    )
    :vars
    (
      ?auto_173844 - BLOCK
      ?auto_173838 - BLOCK
      ?auto_173842 - BLOCK
      ?auto_173841 - BLOCK
      ?auto_173839 - BLOCK
      ?auto_173843 - BLOCK
      ?auto_173840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173844 ?auto_173837 ) ( ON-TABLE ?auto_173836 ) ( ON ?auto_173837 ?auto_173836 ) ( not ( = ?auto_173836 ?auto_173837 ) ) ( not ( = ?auto_173836 ?auto_173844 ) ) ( not ( = ?auto_173837 ?auto_173844 ) ) ( not ( = ?auto_173836 ?auto_173838 ) ) ( not ( = ?auto_173836 ?auto_173842 ) ) ( not ( = ?auto_173837 ?auto_173838 ) ) ( not ( = ?auto_173837 ?auto_173842 ) ) ( not ( = ?auto_173844 ?auto_173838 ) ) ( not ( = ?auto_173844 ?auto_173842 ) ) ( not ( = ?auto_173838 ?auto_173842 ) ) ( ON ?auto_173838 ?auto_173844 ) ( ON-TABLE ?auto_173841 ) ( ON ?auto_173839 ?auto_173841 ) ( ON ?auto_173843 ?auto_173839 ) ( not ( = ?auto_173841 ?auto_173839 ) ) ( not ( = ?auto_173841 ?auto_173843 ) ) ( not ( = ?auto_173841 ?auto_173840 ) ) ( not ( = ?auto_173841 ?auto_173842 ) ) ( not ( = ?auto_173839 ?auto_173843 ) ) ( not ( = ?auto_173839 ?auto_173840 ) ) ( not ( = ?auto_173839 ?auto_173842 ) ) ( not ( = ?auto_173843 ?auto_173840 ) ) ( not ( = ?auto_173843 ?auto_173842 ) ) ( not ( = ?auto_173840 ?auto_173842 ) ) ( not ( = ?auto_173836 ?auto_173840 ) ) ( not ( = ?auto_173836 ?auto_173841 ) ) ( not ( = ?auto_173836 ?auto_173839 ) ) ( not ( = ?auto_173836 ?auto_173843 ) ) ( not ( = ?auto_173837 ?auto_173840 ) ) ( not ( = ?auto_173837 ?auto_173841 ) ) ( not ( = ?auto_173837 ?auto_173839 ) ) ( not ( = ?auto_173837 ?auto_173843 ) ) ( not ( = ?auto_173844 ?auto_173840 ) ) ( not ( = ?auto_173844 ?auto_173841 ) ) ( not ( = ?auto_173844 ?auto_173839 ) ) ( not ( = ?auto_173844 ?auto_173843 ) ) ( not ( = ?auto_173838 ?auto_173840 ) ) ( not ( = ?auto_173838 ?auto_173841 ) ) ( not ( = ?auto_173838 ?auto_173839 ) ) ( not ( = ?auto_173838 ?auto_173843 ) ) ( ON ?auto_173842 ?auto_173838 ) ( CLEAR ?auto_173843 ) ( ON ?auto_173840 ?auto_173842 ) ( CLEAR ?auto_173840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173836 ?auto_173837 ?auto_173844 ?auto_173838 ?auto_173842 )
      ( MAKE-2PILE ?auto_173836 ?auto_173837 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173845 - BLOCK
      ?auto_173846 - BLOCK
    )
    :vars
    (
      ?auto_173852 - BLOCK
      ?auto_173848 - BLOCK
      ?auto_173850 - BLOCK
      ?auto_173853 - BLOCK
      ?auto_173849 - BLOCK
      ?auto_173847 - BLOCK
      ?auto_173851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173852 ?auto_173846 ) ( ON-TABLE ?auto_173845 ) ( ON ?auto_173846 ?auto_173845 ) ( not ( = ?auto_173845 ?auto_173846 ) ) ( not ( = ?auto_173845 ?auto_173852 ) ) ( not ( = ?auto_173846 ?auto_173852 ) ) ( not ( = ?auto_173845 ?auto_173848 ) ) ( not ( = ?auto_173845 ?auto_173850 ) ) ( not ( = ?auto_173846 ?auto_173848 ) ) ( not ( = ?auto_173846 ?auto_173850 ) ) ( not ( = ?auto_173852 ?auto_173848 ) ) ( not ( = ?auto_173852 ?auto_173850 ) ) ( not ( = ?auto_173848 ?auto_173850 ) ) ( ON ?auto_173848 ?auto_173852 ) ( ON-TABLE ?auto_173853 ) ( ON ?auto_173849 ?auto_173853 ) ( not ( = ?auto_173853 ?auto_173849 ) ) ( not ( = ?auto_173853 ?auto_173847 ) ) ( not ( = ?auto_173853 ?auto_173851 ) ) ( not ( = ?auto_173853 ?auto_173850 ) ) ( not ( = ?auto_173849 ?auto_173847 ) ) ( not ( = ?auto_173849 ?auto_173851 ) ) ( not ( = ?auto_173849 ?auto_173850 ) ) ( not ( = ?auto_173847 ?auto_173851 ) ) ( not ( = ?auto_173847 ?auto_173850 ) ) ( not ( = ?auto_173851 ?auto_173850 ) ) ( not ( = ?auto_173845 ?auto_173851 ) ) ( not ( = ?auto_173845 ?auto_173853 ) ) ( not ( = ?auto_173845 ?auto_173849 ) ) ( not ( = ?auto_173845 ?auto_173847 ) ) ( not ( = ?auto_173846 ?auto_173851 ) ) ( not ( = ?auto_173846 ?auto_173853 ) ) ( not ( = ?auto_173846 ?auto_173849 ) ) ( not ( = ?auto_173846 ?auto_173847 ) ) ( not ( = ?auto_173852 ?auto_173851 ) ) ( not ( = ?auto_173852 ?auto_173853 ) ) ( not ( = ?auto_173852 ?auto_173849 ) ) ( not ( = ?auto_173852 ?auto_173847 ) ) ( not ( = ?auto_173848 ?auto_173851 ) ) ( not ( = ?auto_173848 ?auto_173853 ) ) ( not ( = ?auto_173848 ?auto_173849 ) ) ( not ( = ?auto_173848 ?auto_173847 ) ) ( ON ?auto_173850 ?auto_173848 ) ( ON ?auto_173851 ?auto_173850 ) ( CLEAR ?auto_173851 ) ( HOLDING ?auto_173847 ) ( CLEAR ?auto_173849 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173853 ?auto_173849 ?auto_173847 )
      ( MAKE-2PILE ?auto_173845 ?auto_173846 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173854 - BLOCK
      ?auto_173855 - BLOCK
    )
    :vars
    (
      ?auto_173860 - BLOCK
      ?auto_173857 - BLOCK
      ?auto_173858 - BLOCK
      ?auto_173856 - BLOCK
      ?auto_173859 - BLOCK
      ?auto_173862 - BLOCK
      ?auto_173861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173860 ?auto_173855 ) ( ON-TABLE ?auto_173854 ) ( ON ?auto_173855 ?auto_173854 ) ( not ( = ?auto_173854 ?auto_173855 ) ) ( not ( = ?auto_173854 ?auto_173860 ) ) ( not ( = ?auto_173855 ?auto_173860 ) ) ( not ( = ?auto_173854 ?auto_173857 ) ) ( not ( = ?auto_173854 ?auto_173858 ) ) ( not ( = ?auto_173855 ?auto_173857 ) ) ( not ( = ?auto_173855 ?auto_173858 ) ) ( not ( = ?auto_173860 ?auto_173857 ) ) ( not ( = ?auto_173860 ?auto_173858 ) ) ( not ( = ?auto_173857 ?auto_173858 ) ) ( ON ?auto_173857 ?auto_173860 ) ( ON-TABLE ?auto_173856 ) ( ON ?auto_173859 ?auto_173856 ) ( not ( = ?auto_173856 ?auto_173859 ) ) ( not ( = ?auto_173856 ?auto_173862 ) ) ( not ( = ?auto_173856 ?auto_173861 ) ) ( not ( = ?auto_173856 ?auto_173858 ) ) ( not ( = ?auto_173859 ?auto_173862 ) ) ( not ( = ?auto_173859 ?auto_173861 ) ) ( not ( = ?auto_173859 ?auto_173858 ) ) ( not ( = ?auto_173862 ?auto_173861 ) ) ( not ( = ?auto_173862 ?auto_173858 ) ) ( not ( = ?auto_173861 ?auto_173858 ) ) ( not ( = ?auto_173854 ?auto_173861 ) ) ( not ( = ?auto_173854 ?auto_173856 ) ) ( not ( = ?auto_173854 ?auto_173859 ) ) ( not ( = ?auto_173854 ?auto_173862 ) ) ( not ( = ?auto_173855 ?auto_173861 ) ) ( not ( = ?auto_173855 ?auto_173856 ) ) ( not ( = ?auto_173855 ?auto_173859 ) ) ( not ( = ?auto_173855 ?auto_173862 ) ) ( not ( = ?auto_173860 ?auto_173861 ) ) ( not ( = ?auto_173860 ?auto_173856 ) ) ( not ( = ?auto_173860 ?auto_173859 ) ) ( not ( = ?auto_173860 ?auto_173862 ) ) ( not ( = ?auto_173857 ?auto_173861 ) ) ( not ( = ?auto_173857 ?auto_173856 ) ) ( not ( = ?auto_173857 ?auto_173859 ) ) ( not ( = ?auto_173857 ?auto_173862 ) ) ( ON ?auto_173858 ?auto_173857 ) ( ON ?auto_173861 ?auto_173858 ) ( CLEAR ?auto_173859 ) ( ON ?auto_173862 ?auto_173861 ) ( CLEAR ?auto_173862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173854 ?auto_173855 ?auto_173860 ?auto_173857 ?auto_173858 ?auto_173861 )
      ( MAKE-2PILE ?auto_173854 ?auto_173855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173863 - BLOCK
      ?auto_173864 - BLOCK
    )
    :vars
    (
      ?auto_173868 - BLOCK
      ?auto_173870 - BLOCK
      ?auto_173867 - BLOCK
      ?auto_173866 - BLOCK
      ?auto_173865 - BLOCK
      ?auto_173869 - BLOCK
      ?auto_173871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173868 ?auto_173864 ) ( ON-TABLE ?auto_173863 ) ( ON ?auto_173864 ?auto_173863 ) ( not ( = ?auto_173863 ?auto_173864 ) ) ( not ( = ?auto_173863 ?auto_173868 ) ) ( not ( = ?auto_173864 ?auto_173868 ) ) ( not ( = ?auto_173863 ?auto_173870 ) ) ( not ( = ?auto_173863 ?auto_173867 ) ) ( not ( = ?auto_173864 ?auto_173870 ) ) ( not ( = ?auto_173864 ?auto_173867 ) ) ( not ( = ?auto_173868 ?auto_173870 ) ) ( not ( = ?auto_173868 ?auto_173867 ) ) ( not ( = ?auto_173870 ?auto_173867 ) ) ( ON ?auto_173870 ?auto_173868 ) ( ON-TABLE ?auto_173866 ) ( not ( = ?auto_173866 ?auto_173865 ) ) ( not ( = ?auto_173866 ?auto_173869 ) ) ( not ( = ?auto_173866 ?auto_173871 ) ) ( not ( = ?auto_173866 ?auto_173867 ) ) ( not ( = ?auto_173865 ?auto_173869 ) ) ( not ( = ?auto_173865 ?auto_173871 ) ) ( not ( = ?auto_173865 ?auto_173867 ) ) ( not ( = ?auto_173869 ?auto_173871 ) ) ( not ( = ?auto_173869 ?auto_173867 ) ) ( not ( = ?auto_173871 ?auto_173867 ) ) ( not ( = ?auto_173863 ?auto_173871 ) ) ( not ( = ?auto_173863 ?auto_173866 ) ) ( not ( = ?auto_173863 ?auto_173865 ) ) ( not ( = ?auto_173863 ?auto_173869 ) ) ( not ( = ?auto_173864 ?auto_173871 ) ) ( not ( = ?auto_173864 ?auto_173866 ) ) ( not ( = ?auto_173864 ?auto_173865 ) ) ( not ( = ?auto_173864 ?auto_173869 ) ) ( not ( = ?auto_173868 ?auto_173871 ) ) ( not ( = ?auto_173868 ?auto_173866 ) ) ( not ( = ?auto_173868 ?auto_173865 ) ) ( not ( = ?auto_173868 ?auto_173869 ) ) ( not ( = ?auto_173870 ?auto_173871 ) ) ( not ( = ?auto_173870 ?auto_173866 ) ) ( not ( = ?auto_173870 ?auto_173865 ) ) ( not ( = ?auto_173870 ?auto_173869 ) ) ( ON ?auto_173867 ?auto_173870 ) ( ON ?auto_173871 ?auto_173867 ) ( ON ?auto_173869 ?auto_173871 ) ( CLEAR ?auto_173869 ) ( HOLDING ?auto_173865 ) ( CLEAR ?auto_173866 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173866 ?auto_173865 )
      ( MAKE-2PILE ?auto_173863 ?auto_173864 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175890 - BLOCK
      ?auto_175891 - BLOCK
    )
    :vars
    (
      ?auto_175896 - BLOCK
      ?auto_175895 - BLOCK
      ?auto_175897 - BLOCK
      ?auto_175894 - BLOCK
      ?auto_175893 - BLOCK
      ?auto_175892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175896 ?auto_175891 ) ( ON-TABLE ?auto_175890 ) ( ON ?auto_175891 ?auto_175890 ) ( not ( = ?auto_175890 ?auto_175891 ) ) ( not ( = ?auto_175890 ?auto_175896 ) ) ( not ( = ?auto_175891 ?auto_175896 ) ) ( not ( = ?auto_175890 ?auto_175895 ) ) ( not ( = ?auto_175890 ?auto_175897 ) ) ( not ( = ?auto_175891 ?auto_175895 ) ) ( not ( = ?auto_175891 ?auto_175897 ) ) ( not ( = ?auto_175896 ?auto_175895 ) ) ( not ( = ?auto_175896 ?auto_175897 ) ) ( not ( = ?auto_175895 ?auto_175897 ) ) ( ON ?auto_175895 ?auto_175896 ) ( not ( = ?auto_175894 ?auto_175893 ) ) ( not ( = ?auto_175894 ?auto_175892 ) ) ( not ( = ?auto_175894 ?auto_175897 ) ) ( not ( = ?auto_175893 ?auto_175892 ) ) ( not ( = ?auto_175893 ?auto_175897 ) ) ( not ( = ?auto_175892 ?auto_175897 ) ) ( not ( = ?auto_175890 ?auto_175892 ) ) ( not ( = ?auto_175890 ?auto_175894 ) ) ( not ( = ?auto_175890 ?auto_175893 ) ) ( not ( = ?auto_175891 ?auto_175892 ) ) ( not ( = ?auto_175891 ?auto_175894 ) ) ( not ( = ?auto_175891 ?auto_175893 ) ) ( not ( = ?auto_175896 ?auto_175892 ) ) ( not ( = ?auto_175896 ?auto_175894 ) ) ( not ( = ?auto_175896 ?auto_175893 ) ) ( not ( = ?auto_175895 ?auto_175892 ) ) ( not ( = ?auto_175895 ?auto_175894 ) ) ( not ( = ?auto_175895 ?auto_175893 ) ) ( ON ?auto_175897 ?auto_175895 ) ( ON ?auto_175892 ?auto_175897 ) ( ON ?auto_175893 ?auto_175892 ) ( ON ?auto_175894 ?auto_175893 ) ( CLEAR ?auto_175894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175890 ?auto_175891 ?auto_175896 ?auto_175895 ?auto_175897 ?auto_175892 ?auto_175893 )
      ( MAKE-2PILE ?auto_175890 ?auto_175891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173881 - BLOCK
      ?auto_173882 - BLOCK
    )
    :vars
    (
      ?auto_173885 - BLOCK
      ?auto_173889 - BLOCK
      ?auto_173883 - BLOCK
      ?auto_173884 - BLOCK
      ?auto_173887 - BLOCK
      ?auto_173888 - BLOCK
      ?auto_173886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173885 ?auto_173882 ) ( ON-TABLE ?auto_173881 ) ( ON ?auto_173882 ?auto_173881 ) ( not ( = ?auto_173881 ?auto_173882 ) ) ( not ( = ?auto_173881 ?auto_173885 ) ) ( not ( = ?auto_173882 ?auto_173885 ) ) ( not ( = ?auto_173881 ?auto_173889 ) ) ( not ( = ?auto_173881 ?auto_173883 ) ) ( not ( = ?auto_173882 ?auto_173889 ) ) ( not ( = ?auto_173882 ?auto_173883 ) ) ( not ( = ?auto_173885 ?auto_173889 ) ) ( not ( = ?auto_173885 ?auto_173883 ) ) ( not ( = ?auto_173889 ?auto_173883 ) ) ( ON ?auto_173889 ?auto_173885 ) ( not ( = ?auto_173884 ?auto_173887 ) ) ( not ( = ?auto_173884 ?auto_173888 ) ) ( not ( = ?auto_173884 ?auto_173886 ) ) ( not ( = ?auto_173884 ?auto_173883 ) ) ( not ( = ?auto_173887 ?auto_173888 ) ) ( not ( = ?auto_173887 ?auto_173886 ) ) ( not ( = ?auto_173887 ?auto_173883 ) ) ( not ( = ?auto_173888 ?auto_173886 ) ) ( not ( = ?auto_173888 ?auto_173883 ) ) ( not ( = ?auto_173886 ?auto_173883 ) ) ( not ( = ?auto_173881 ?auto_173886 ) ) ( not ( = ?auto_173881 ?auto_173884 ) ) ( not ( = ?auto_173881 ?auto_173887 ) ) ( not ( = ?auto_173881 ?auto_173888 ) ) ( not ( = ?auto_173882 ?auto_173886 ) ) ( not ( = ?auto_173882 ?auto_173884 ) ) ( not ( = ?auto_173882 ?auto_173887 ) ) ( not ( = ?auto_173882 ?auto_173888 ) ) ( not ( = ?auto_173885 ?auto_173886 ) ) ( not ( = ?auto_173885 ?auto_173884 ) ) ( not ( = ?auto_173885 ?auto_173887 ) ) ( not ( = ?auto_173885 ?auto_173888 ) ) ( not ( = ?auto_173889 ?auto_173886 ) ) ( not ( = ?auto_173889 ?auto_173884 ) ) ( not ( = ?auto_173889 ?auto_173887 ) ) ( not ( = ?auto_173889 ?auto_173888 ) ) ( ON ?auto_173883 ?auto_173889 ) ( ON ?auto_173886 ?auto_173883 ) ( ON ?auto_173888 ?auto_173886 ) ( ON ?auto_173887 ?auto_173888 ) ( CLEAR ?auto_173887 ) ( HOLDING ?auto_173884 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173884 )
      ( MAKE-2PILE ?auto_173881 ?auto_173882 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173890 - BLOCK
      ?auto_173891 - BLOCK
    )
    :vars
    (
      ?auto_173898 - BLOCK
      ?auto_173893 - BLOCK
      ?auto_173895 - BLOCK
      ?auto_173896 - BLOCK
      ?auto_173894 - BLOCK
      ?auto_173897 - BLOCK
      ?auto_173892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173898 ?auto_173891 ) ( ON-TABLE ?auto_173890 ) ( ON ?auto_173891 ?auto_173890 ) ( not ( = ?auto_173890 ?auto_173891 ) ) ( not ( = ?auto_173890 ?auto_173898 ) ) ( not ( = ?auto_173891 ?auto_173898 ) ) ( not ( = ?auto_173890 ?auto_173893 ) ) ( not ( = ?auto_173890 ?auto_173895 ) ) ( not ( = ?auto_173891 ?auto_173893 ) ) ( not ( = ?auto_173891 ?auto_173895 ) ) ( not ( = ?auto_173898 ?auto_173893 ) ) ( not ( = ?auto_173898 ?auto_173895 ) ) ( not ( = ?auto_173893 ?auto_173895 ) ) ( ON ?auto_173893 ?auto_173898 ) ( not ( = ?auto_173896 ?auto_173894 ) ) ( not ( = ?auto_173896 ?auto_173897 ) ) ( not ( = ?auto_173896 ?auto_173892 ) ) ( not ( = ?auto_173896 ?auto_173895 ) ) ( not ( = ?auto_173894 ?auto_173897 ) ) ( not ( = ?auto_173894 ?auto_173892 ) ) ( not ( = ?auto_173894 ?auto_173895 ) ) ( not ( = ?auto_173897 ?auto_173892 ) ) ( not ( = ?auto_173897 ?auto_173895 ) ) ( not ( = ?auto_173892 ?auto_173895 ) ) ( not ( = ?auto_173890 ?auto_173892 ) ) ( not ( = ?auto_173890 ?auto_173896 ) ) ( not ( = ?auto_173890 ?auto_173894 ) ) ( not ( = ?auto_173890 ?auto_173897 ) ) ( not ( = ?auto_173891 ?auto_173892 ) ) ( not ( = ?auto_173891 ?auto_173896 ) ) ( not ( = ?auto_173891 ?auto_173894 ) ) ( not ( = ?auto_173891 ?auto_173897 ) ) ( not ( = ?auto_173898 ?auto_173892 ) ) ( not ( = ?auto_173898 ?auto_173896 ) ) ( not ( = ?auto_173898 ?auto_173894 ) ) ( not ( = ?auto_173898 ?auto_173897 ) ) ( not ( = ?auto_173893 ?auto_173892 ) ) ( not ( = ?auto_173893 ?auto_173896 ) ) ( not ( = ?auto_173893 ?auto_173894 ) ) ( not ( = ?auto_173893 ?auto_173897 ) ) ( ON ?auto_173895 ?auto_173893 ) ( ON ?auto_173892 ?auto_173895 ) ( ON ?auto_173897 ?auto_173892 ) ( ON ?auto_173894 ?auto_173897 ) ( ON ?auto_173896 ?auto_173894 ) ( CLEAR ?auto_173896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173890 ?auto_173891 ?auto_173898 ?auto_173893 ?auto_173895 ?auto_173892 ?auto_173897 ?auto_173894 )
      ( MAKE-2PILE ?auto_173890 ?auto_173891 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173906 - BLOCK
      ?auto_173907 - BLOCK
      ?auto_173908 - BLOCK
      ?auto_173909 - BLOCK
      ?auto_173910 - BLOCK
      ?auto_173911 - BLOCK
      ?auto_173912 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_173912 ) ( CLEAR ?auto_173911 ) ( ON-TABLE ?auto_173906 ) ( ON ?auto_173907 ?auto_173906 ) ( ON ?auto_173908 ?auto_173907 ) ( ON ?auto_173909 ?auto_173908 ) ( ON ?auto_173910 ?auto_173909 ) ( ON ?auto_173911 ?auto_173910 ) ( not ( = ?auto_173906 ?auto_173907 ) ) ( not ( = ?auto_173906 ?auto_173908 ) ) ( not ( = ?auto_173906 ?auto_173909 ) ) ( not ( = ?auto_173906 ?auto_173910 ) ) ( not ( = ?auto_173906 ?auto_173911 ) ) ( not ( = ?auto_173906 ?auto_173912 ) ) ( not ( = ?auto_173907 ?auto_173908 ) ) ( not ( = ?auto_173907 ?auto_173909 ) ) ( not ( = ?auto_173907 ?auto_173910 ) ) ( not ( = ?auto_173907 ?auto_173911 ) ) ( not ( = ?auto_173907 ?auto_173912 ) ) ( not ( = ?auto_173908 ?auto_173909 ) ) ( not ( = ?auto_173908 ?auto_173910 ) ) ( not ( = ?auto_173908 ?auto_173911 ) ) ( not ( = ?auto_173908 ?auto_173912 ) ) ( not ( = ?auto_173909 ?auto_173910 ) ) ( not ( = ?auto_173909 ?auto_173911 ) ) ( not ( = ?auto_173909 ?auto_173912 ) ) ( not ( = ?auto_173910 ?auto_173911 ) ) ( not ( = ?auto_173910 ?auto_173912 ) ) ( not ( = ?auto_173911 ?auto_173912 ) ) )
    :subtasks
    ( ( !STACK ?auto_173912 ?auto_173911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173913 - BLOCK
      ?auto_173914 - BLOCK
      ?auto_173915 - BLOCK
      ?auto_173916 - BLOCK
      ?auto_173917 - BLOCK
      ?auto_173918 - BLOCK
      ?auto_173919 - BLOCK
    )
    :vars
    (
      ?auto_173920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173918 ) ( ON-TABLE ?auto_173913 ) ( ON ?auto_173914 ?auto_173913 ) ( ON ?auto_173915 ?auto_173914 ) ( ON ?auto_173916 ?auto_173915 ) ( ON ?auto_173917 ?auto_173916 ) ( ON ?auto_173918 ?auto_173917 ) ( not ( = ?auto_173913 ?auto_173914 ) ) ( not ( = ?auto_173913 ?auto_173915 ) ) ( not ( = ?auto_173913 ?auto_173916 ) ) ( not ( = ?auto_173913 ?auto_173917 ) ) ( not ( = ?auto_173913 ?auto_173918 ) ) ( not ( = ?auto_173913 ?auto_173919 ) ) ( not ( = ?auto_173914 ?auto_173915 ) ) ( not ( = ?auto_173914 ?auto_173916 ) ) ( not ( = ?auto_173914 ?auto_173917 ) ) ( not ( = ?auto_173914 ?auto_173918 ) ) ( not ( = ?auto_173914 ?auto_173919 ) ) ( not ( = ?auto_173915 ?auto_173916 ) ) ( not ( = ?auto_173915 ?auto_173917 ) ) ( not ( = ?auto_173915 ?auto_173918 ) ) ( not ( = ?auto_173915 ?auto_173919 ) ) ( not ( = ?auto_173916 ?auto_173917 ) ) ( not ( = ?auto_173916 ?auto_173918 ) ) ( not ( = ?auto_173916 ?auto_173919 ) ) ( not ( = ?auto_173917 ?auto_173918 ) ) ( not ( = ?auto_173917 ?auto_173919 ) ) ( not ( = ?auto_173918 ?auto_173919 ) ) ( ON ?auto_173919 ?auto_173920 ) ( CLEAR ?auto_173919 ) ( HAND-EMPTY ) ( not ( = ?auto_173913 ?auto_173920 ) ) ( not ( = ?auto_173914 ?auto_173920 ) ) ( not ( = ?auto_173915 ?auto_173920 ) ) ( not ( = ?auto_173916 ?auto_173920 ) ) ( not ( = ?auto_173917 ?auto_173920 ) ) ( not ( = ?auto_173918 ?auto_173920 ) ) ( not ( = ?auto_173919 ?auto_173920 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173919 ?auto_173920 )
      ( MAKE-7PILE ?auto_173913 ?auto_173914 ?auto_173915 ?auto_173916 ?auto_173917 ?auto_173918 ?auto_173919 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173921 - BLOCK
      ?auto_173922 - BLOCK
      ?auto_173923 - BLOCK
      ?auto_173924 - BLOCK
      ?auto_173925 - BLOCK
      ?auto_173926 - BLOCK
      ?auto_173927 - BLOCK
    )
    :vars
    (
      ?auto_173928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173921 ) ( ON ?auto_173922 ?auto_173921 ) ( ON ?auto_173923 ?auto_173922 ) ( ON ?auto_173924 ?auto_173923 ) ( ON ?auto_173925 ?auto_173924 ) ( not ( = ?auto_173921 ?auto_173922 ) ) ( not ( = ?auto_173921 ?auto_173923 ) ) ( not ( = ?auto_173921 ?auto_173924 ) ) ( not ( = ?auto_173921 ?auto_173925 ) ) ( not ( = ?auto_173921 ?auto_173926 ) ) ( not ( = ?auto_173921 ?auto_173927 ) ) ( not ( = ?auto_173922 ?auto_173923 ) ) ( not ( = ?auto_173922 ?auto_173924 ) ) ( not ( = ?auto_173922 ?auto_173925 ) ) ( not ( = ?auto_173922 ?auto_173926 ) ) ( not ( = ?auto_173922 ?auto_173927 ) ) ( not ( = ?auto_173923 ?auto_173924 ) ) ( not ( = ?auto_173923 ?auto_173925 ) ) ( not ( = ?auto_173923 ?auto_173926 ) ) ( not ( = ?auto_173923 ?auto_173927 ) ) ( not ( = ?auto_173924 ?auto_173925 ) ) ( not ( = ?auto_173924 ?auto_173926 ) ) ( not ( = ?auto_173924 ?auto_173927 ) ) ( not ( = ?auto_173925 ?auto_173926 ) ) ( not ( = ?auto_173925 ?auto_173927 ) ) ( not ( = ?auto_173926 ?auto_173927 ) ) ( ON ?auto_173927 ?auto_173928 ) ( CLEAR ?auto_173927 ) ( not ( = ?auto_173921 ?auto_173928 ) ) ( not ( = ?auto_173922 ?auto_173928 ) ) ( not ( = ?auto_173923 ?auto_173928 ) ) ( not ( = ?auto_173924 ?auto_173928 ) ) ( not ( = ?auto_173925 ?auto_173928 ) ) ( not ( = ?auto_173926 ?auto_173928 ) ) ( not ( = ?auto_173927 ?auto_173928 ) ) ( HOLDING ?auto_173926 ) ( CLEAR ?auto_173925 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173921 ?auto_173922 ?auto_173923 ?auto_173924 ?auto_173925 ?auto_173926 )
      ( MAKE-7PILE ?auto_173921 ?auto_173922 ?auto_173923 ?auto_173924 ?auto_173925 ?auto_173926 ?auto_173927 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173929 - BLOCK
      ?auto_173930 - BLOCK
      ?auto_173931 - BLOCK
      ?auto_173932 - BLOCK
      ?auto_173933 - BLOCK
      ?auto_173934 - BLOCK
      ?auto_173935 - BLOCK
    )
    :vars
    (
      ?auto_173936 - BLOCK
      ?auto_173937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173929 ) ( ON ?auto_173930 ?auto_173929 ) ( ON ?auto_173931 ?auto_173930 ) ( ON ?auto_173932 ?auto_173931 ) ( ON ?auto_173933 ?auto_173932 ) ( not ( = ?auto_173929 ?auto_173930 ) ) ( not ( = ?auto_173929 ?auto_173931 ) ) ( not ( = ?auto_173929 ?auto_173932 ) ) ( not ( = ?auto_173929 ?auto_173933 ) ) ( not ( = ?auto_173929 ?auto_173934 ) ) ( not ( = ?auto_173929 ?auto_173935 ) ) ( not ( = ?auto_173930 ?auto_173931 ) ) ( not ( = ?auto_173930 ?auto_173932 ) ) ( not ( = ?auto_173930 ?auto_173933 ) ) ( not ( = ?auto_173930 ?auto_173934 ) ) ( not ( = ?auto_173930 ?auto_173935 ) ) ( not ( = ?auto_173931 ?auto_173932 ) ) ( not ( = ?auto_173931 ?auto_173933 ) ) ( not ( = ?auto_173931 ?auto_173934 ) ) ( not ( = ?auto_173931 ?auto_173935 ) ) ( not ( = ?auto_173932 ?auto_173933 ) ) ( not ( = ?auto_173932 ?auto_173934 ) ) ( not ( = ?auto_173932 ?auto_173935 ) ) ( not ( = ?auto_173933 ?auto_173934 ) ) ( not ( = ?auto_173933 ?auto_173935 ) ) ( not ( = ?auto_173934 ?auto_173935 ) ) ( ON ?auto_173935 ?auto_173936 ) ( not ( = ?auto_173929 ?auto_173936 ) ) ( not ( = ?auto_173930 ?auto_173936 ) ) ( not ( = ?auto_173931 ?auto_173936 ) ) ( not ( = ?auto_173932 ?auto_173936 ) ) ( not ( = ?auto_173933 ?auto_173936 ) ) ( not ( = ?auto_173934 ?auto_173936 ) ) ( not ( = ?auto_173935 ?auto_173936 ) ) ( CLEAR ?auto_173933 ) ( ON ?auto_173934 ?auto_173935 ) ( CLEAR ?auto_173934 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173937 ) ( ON ?auto_173936 ?auto_173937 ) ( not ( = ?auto_173937 ?auto_173936 ) ) ( not ( = ?auto_173937 ?auto_173935 ) ) ( not ( = ?auto_173937 ?auto_173934 ) ) ( not ( = ?auto_173929 ?auto_173937 ) ) ( not ( = ?auto_173930 ?auto_173937 ) ) ( not ( = ?auto_173931 ?auto_173937 ) ) ( not ( = ?auto_173932 ?auto_173937 ) ) ( not ( = ?auto_173933 ?auto_173937 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173937 ?auto_173936 ?auto_173935 )
      ( MAKE-7PILE ?auto_173929 ?auto_173930 ?auto_173931 ?auto_173932 ?auto_173933 ?auto_173934 ?auto_173935 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173938 - BLOCK
      ?auto_173939 - BLOCK
      ?auto_173940 - BLOCK
      ?auto_173941 - BLOCK
      ?auto_173942 - BLOCK
      ?auto_173943 - BLOCK
      ?auto_173944 - BLOCK
    )
    :vars
    (
      ?auto_173945 - BLOCK
      ?auto_173946 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173938 ) ( ON ?auto_173939 ?auto_173938 ) ( ON ?auto_173940 ?auto_173939 ) ( ON ?auto_173941 ?auto_173940 ) ( not ( = ?auto_173938 ?auto_173939 ) ) ( not ( = ?auto_173938 ?auto_173940 ) ) ( not ( = ?auto_173938 ?auto_173941 ) ) ( not ( = ?auto_173938 ?auto_173942 ) ) ( not ( = ?auto_173938 ?auto_173943 ) ) ( not ( = ?auto_173938 ?auto_173944 ) ) ( not ( = ?auto_173939 ?auto_173940 ) ) ( not ( = ?auto_173939 ?auto_173941 ) ) ( not ( = ?auto_173939 ?auto_173942 ) ) ( not ( = ?auto_173939 ?auto_173943 ) ) ( not ( = ?auto_173939 ?auto_173944 ) ) ( not ( = ?auto_173940 ?auto_173941 ) ) ( not ( = ?auto_173940 ?auto_173942 ) ) ( not ( = ?auto_173940 ?auto_173943 ) ) ( not ( = ?auto_173940 ?auto_173944 ) ) ( not ( = ?auto_173941 ?auto_173942 ) ) ( not ( = ?auto_173941 ?auto_173943 ) ) ( not ( = ?auto_173941 ?auto_173944 ) ) ( not ( = ?auto_173942 ?auto_173943 ) ) ( not ( = ?auto_173942 ?auto_173944 ) ) ( not ( = ?auto_173943 ?auto_173944 ) ) ( ON ?auto_173944 ?auto_173945 ) ( not ( = ?auto_173938 ?auto_173945 ) ) ( not ( = ?auto_173939 ?auto_173945 ) ) ( not ( = ?auto_173940 ?auto_173945 ) ) ( not ( = ?auto_173941 ?auto_173945 ) ) ( not ( = ?auto_173942 ?auto_173945 ) ) ( not ( = ?auto_173943 ?auto_173945 ) ) ( not ( = ?auto_173944 ?auto_173945 ) ) ( ON ?auto_173943 ?auto_173944 ) ( CLEAR ?auto_173943 ) ( ON-TABLE ?auto_173946 ) ( ON ?auto_173945 ?auto_173946 ) ( not ( = ?auto_173946 ?auto_173945 ) ) ( not ( = ?auto_173946 ?auto_173944 ) ) ( not ( = ?auto_173946 ?auto_173943 ) ) ( not ( = ?auto_173938 ?auto_173946 ) ) ( not ( = ?auto_173939 ?auto_173946 ) ) ( not ( = ?auto_173940 ?auto_173946 ) ) ( not ( = ?auto_173941 ?auto_173946 ) ) ( not ( = ?auto_173942 ?auto_173946 ) ) ( HOLDING ?auto_173942 ) ( CLEAR ?auto_173941 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173938 ?auto_173939 ?auto_173940 ?auto_173941 ?auto_173942 )
      ( MAKE-7PILE ?auto_173938 ?auto_173939 ?auto_173940 ?auto_173941 ?auto_173942 ?auto_173943 ?auto_173944 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173947 - BLOCK
      ?auto_173948 - BLOCK
      ?auto_173949 - BLOCK
      ?auto_173950 - BLOCK
      ?auto_173951 - BLOCK
      ?auto_173952 - BLOCK
      ?auto_173953 - BLOCK
    )
    :vars
    (
      ?auto_173955 - BLOCK
      ?auto_173954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173947 ) ( ON ?auto_173948 ?auto_173947 ) ( ON ?auto_173949 ?auto_173948 ) ( ON ?auto_173950 ?auto_173949 ) ( not ( = ?auto_173947 ?auto_173948 ) ) ( not ( = ?auto_173947 ?auto_173949 ) ) ( not ( = ?auto_173947 ?auto_173950 ) ) ( not ( = ?auto_173947 ?auto_173951 ) ) ( not ( = ?auto_173947 ?auto_173952 ) ) ( not ( = ?auto_173947 ?auto_173953 ) ) ( not ( = ?auto_173948 ?auto_173949 ) ) ( not ( = ?auto_173948 ?auto_173950 ) ) ( not ( = ?auto_173948 ?auto_173951 ) ) ( not ( = ?auto_173948 ?auto_173952 ) ) ( not ( = ?auto_173948 ?auto_173953 ) ) ( not ( = ?auto_173949 ?auto_173950 ) ) ( not ( = ?auto_173949 ?auto_173951 ) ) ( not ( = ?auto_173949 ?auto_173952 ) ) ( not ( = ?auto_173949 ?auto_173953 ) ) ( not ( = ?auto_173950 ?auto_173951 ) ) ( not ( = ?auto_173950 ?auto_173952 ) ) ( not ( = ?auto_173950 ?auto_173953 ) ) ( not ( = ?auto_173951 ?auto_173952 ) ) ( not ( = ?auto_173951 ?auto_173953 ) ) ( not ( = ?auto_173952 ?auto_173953 ) ) ( ON ?auto_173953 ?auto_173955 ) ( not ( = ?auto_173947 ?auto_173955 ) ) ( not ( = ?auto_173948 ?auto_173955 ) ) ( not ( = ?auto_173949 ?auto_173955 ) ) ( not ( = ?auto_173950 ?auto_173955 ) ) ( not ( = ?auto_173951 ?auto_173955 ) ) ( not ( = ?auto_173952 ?auto_173955 ) ) ( not ( = ?auto_173953 ?auto_173955 ) ) ( ON ?auto_173952 ?auto_173953 ) ( ON-TABLE ?auto_173954 ) ( ON ?auto_173955 ?auto_173954 ) ( not ( = ?auto_173954 ?auto_173955 ) ) ( not ( = ?auto_173954 ?auto_173953 ) ) ( not ( = ?auto_173954 ?auto_173952 ) ) ( not ( = ?auto_173947 ?auto_173954 ) ) ( not ( = ?auto_173948 ?auto_173954 ) ) ( not ( = ?auto_173949 ?auto_173954 ) ) ( not ( = ?auto_173950 ?auto_173954 ) ) ( not ( = ?auto_173951 ?auto_173954 ) ) ( CLEAR ?auto_173950 ) ( ON ?auto_173951 ?auto_173952 ) ( CLEAR ?auto_173951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173954 ?auto_173955 ?auto_173953 ?auto_173952 )
      ( MAKE-7PILE ?auto_173947 ?auto_173948 ?auto_173949 ?auto_173950 ?auto_173951 ?auto_173952 ?auto_173953 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173956 - BLOCK
      ?auto_173957 - BLOCK
      ?auto_173958 - BLOCK
      ?auto_173959 - BLOCK
      ?auto_173960 - BLOCK
      ?auto_173961 - BLOCK
      ?auto_173962 - BLOCK
    )
    :vars
    (
      ?auto_173963 - BLOCK
      ?auto_173964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173956 ) ( ON ?auto_173957 ?auto_173956 ) ( ON ?auto_173958 ?auto_173957 ) ( not ( = ?auto_173956 ?auto_173957 ) ) ( not ( = ?auto_173956 ?auto_173958 ) ) ( not ( = ?auto_173956 ?auto_173959 ) ) ( not ( = ?auto_173956 ?auto_173960 ) ) ( not ( = ?auto_173956 ?auto_173961 ) ) ( not ( = ?auto_173956 ?auto_173962 ) ) ( not ( = ?auto_173957 ?auto_173958 ) ) ( not ( = ?auto_173957 ?auto_173959 ) ) ( not ( = ?auto_173957 ?auto_173960 ) ) ( not ( = ?auto_173957 ?auto_173961 ) ) ( not ( = ?auto_173957 ?auto_173962 ) ) ( not ( = ?auto_173958 ?auto_173959 ) ) ( not ( = ?auto_173958 ?auto_173960 ) ) ( not ( = ?auto_173958 ?auto_173961 ) ) ( not ( = ?auto_173958 ?auto_173962 ) ) ( not ( = ?auto_173959 ?auto_173960 ) ) ( not ( = ?auto_173959 ?auto_173961 ) ) ( not ( = ?auto_173959 ?auto_173962 ) ) ( not ( = ?auto_173960 ?auto_173961 ) ) ( not ( = ?auto_173960 ?auto_173962 ) ) ( not ( = ?auto_173961 ?auto_173962 ) ) ( ON ?auto_173962 ?auto_173963 ) ( not ( = ?auto_173956 ?auto_173963 ) ) ( not ( = ?auto_173957 ?auto_173963 ) ) ( not ( = ?auto_173958 ?auto_173963 ) ) ( not ( = ?auto_173959 ?auto_173963 ) ) ( not ( = ?auto_173960 ?auto_173963 ) ) ( not ( = ?auto_173961 ?auto_173963 ) ) ( not ( = ?auto_173962 ?auto_173963 ) ) ( ON ?auto_173961 ?auto_173962 ) ( ON-TABLE ?auto_173964 ) ( ON ?auto_173963 ?auto_173964 ) ( not ( = ?auto_173964 ?auto_173963 ) ) ( not ( = ?auto_173964 ?auto_173962 ) ) ( not ( = ?auto_173964 ?auto_173961 ) ) ( not ( = ?auto_173956 ?auto_173964 ) ) ( not ( = ?auto_173957 ?auto_173964 ) ) ( not ( = ?auto_173958 ?auto_173964 ) ) ( not ( = ?auto_173959 ?auto_173964 ) ) ( not ( = ?auto_173960 ?auto_173964 ) ) ( ON ?auto_173960 ?auto_173961 ) ( CLEAR ?auto_173960 ) ( HOLDING ?auto_173959 ) ( CLEAR ?auto_173958 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173956 ?auto_173957 ?auto_173958 ?auto_173959 )
      ( MAKE-7PILE ?auto_173956 ?auto_173957 ?auto_173958 ?auto_173959 ?auto_173960 ?auto_173961 ?auto_173962 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173965 - BLOCK
      ?auto_173966 - BLOCK
      ?auto_173967 - BLOCK
      ?auto_173968 - BLOCK
      ?auto_173969 - BLOCK
      ?auto_173970 - BLOCK
      ?auto_173971 - BLOCK
    )
    :vars
    (
      ?auto_173973 - BLOCK
      ?auto_173972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173965 ) ( ON ?auto_173966 ?auto_173965 ) ( ON ?auto_173967 ?auto_173966 ) ( not ( = ?auto_173965 ?auto_173966 ) ) ( not ( = ?auto_173965 ?auto_173967 ) ) ( not ( = ?auto_173965 ?auto_173968 ) ) ( not ( = ?auto_173965 ?auto_173969 ) ) ( not ( = ?auto_173965 ?auto_173970 ) ) ( not ( = ?auto_173965 ?auto_173971 ) ) ( not ( = ?auto_173966 ?auto_173967 ) ) ( not ( = ?auto_173966 ?auto_173968 ) ) ( not ( = ?auto_173966 ?auto_173969 ) ) ( not ( = ?auto_173966 ?auto_173970 ) ) ( not ( = ?auto_173966 ?auto_173971 ) ) ( not ( = ?auto_173967 ?auto_173968 ) ) ( not ( = ?auto_173967 ?auto_173969 ) ) ( not ( = ?auto_173967 ?auto_173970 ) ) ( not ( = ?auto_173967 ?auto_173971 ) ) ( not ( = ?auto_173968 ?auto_173969 ) ) ( not ( = ?auto_173968 ?auto_173970 ) ) ( not ( = ?auto_173968 ?auto_173971 ) ) ( not ( = ?auto_173969 ?auto_173970 ) ) ( not ( = ?auto_173969 ?auto_173971 ) ) ( not ( = ?auto_173970 ?auto_173971 ) ) ( ON ?auto_173971 ?auto_173973 ) ( not ( = ?auto_173965 ?auto_173973 ) ) ( not ( = ?auto_173966 ?auto_173973 ) ) ( not ( = ?auto_173967 ?auto_173973 ) ) ( not ( = ?auto_173968 ?auto_173973 ) ) ( not ( = ?auto_173969 ?auto_173973 ) ) ( not ( = ?auto_173970 ?auto_173973 ) ) ( not ( = ?auto_173971 ?auto_173973 ) ) ( ON ?auto_173970 ?auto_173971 ) ( ON-TABLE ?auto_173972 ) ( ON ?auto_173973 ?auto_173972 ) ( not ( = ?auto_173972 ?auto_173973 ) ) ( not ( = ?auto_173972 ?auto_173971 ) ) ( not ( = ?auto_173972 ?auto_173970 ) ) ( not ( = ?auto_173965 ?auto_173972 ) ) ( not ( = ?auto_173966 ?auto_173972 ) ) ( not ( = ?auto_173967 ?auto_173972 ) ) ( not ( = ?auto_173968 ?auto_173972 ) ) ( not ( = ?auto_173969 ?auto_173972 ) ) ( ON ?auto_173969 ?auto_173970 ) ( CLEAR ?auto_173967 ) ( ON ?auto_173968 ?auto_173969 ) ( CLEAR ?auto_173968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173972 ?auto_173973 ?auto_173971 ?auto_173970 ?auto_173969 )
      ( MAKE-7PILE ?auto_173965 ?auto_173966 ?auto_173967 ?auto_173968 ?auto_173969 ?auto_173970 ?auto_173971 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173974 - BLOCK
      ?auto_173975 - BLOCK
      ?auto_173976 - BLOCK
      ?auto_173977 - BLOCK
      ?auto_173978 - BLOCK
      ?auto_173979 - BLOCK
      ?auto_173980 - BLOCK
    )
    :vars
    (
      ?auto_173981 - BLOCK
      ?auto_173982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173974 ) ( ON ?auto_173975 ?auto_173974 ) ( not ( = ?auto_173974 ?auto_173975 ) ) ( not ( = ?auto_173974 ?auto_173976 ) ) ( not ( = ?auto_173974 ?auto_173977 ) ) ( not ( = ?auto_173974 ?auto_173978 ) ) ( not ( = ?auto_173974 ?auto_173979 ) ) ( not ( = ?auto_173974 ?auto_173980 ) ) ( not ( = ?auto_173975 ?auto_173976 ) ) ( not ( = ?auto_173975 ?auto_173977 ) ) ( not ( = ?auto_173975 ?auto_173978 ) ) ( not ( = ?auto_173975 ?auto_173979 ) ) ( not ( = ?auto_173975 ?auto_173980 ) ) ( not ( = ?auto_173976 ?auto_173977 ) ) ( not ( = ?auto_173976 ?auto_173978 ) ) ( not ( = ?auto_173976 ?auto_173979 ) ) ( not ( = ?auto_173976 ?auto_173980 ) ) ( not ( = ?auto_173977 ?auto_173978 ) ) ( not ( = ?auto_173977 ?auto_173979 ) ) ( not ( = ?auto_173977 ?auto_173980 ) ) ( not ( = ?auto_173978 ?auto_173979 ) ) ( not ( = ?auto_173978 ?auto_173980 ) ) ( not ( = ?auto_173979 ?auto_173980 ) ) ( ON ?auto_173980 ?auto_173981 ) ( not ( = ?auto_173974 ?auto_173981 ) ) ( not ( = ?auto_173975 ?auto_173981 ) ) ( not ( = ?auto_173976 ?auto_173981 ) ) ( not ( = ?auto_173977 ?auto_173981 ) ) ( not ( = ?auto_173978 ?auto_173981 ) ) ( not ( = ?auto_173979 ?auto_173981 ) ) ( not ( = ?auto_173980 ?auto_173981 ) ) ( ON ?auto_173979 ?auto_173980 ) ( ON-TABLE ?auto_173982 ) ( ON ?auto_173981 ?auto_173982 ) ( not ( = ?auto_173982 ?auto_173981 ) ) ( not ( = ?auto_173982 ?auto_173980 ) ) ( not ( = ?auto_173982 ?auto_173979 ) ) ( not ( = ?auto_173974 ?auto_173982 ) ) ( not ( = ?auto_173975 ?auto_173982 ) ) ( not ( = ?auto_173976 ?auto_173982 ) ) ( not ( = ?auto_173977 ?auto_173982 ) ) ( not ( = ?auto_173978 ?auto_173982 ) ) ( ON ?auto_173978 ?auto_173979 ) ( ON ?auto_173977 ?auto_173978 ) ( CLEAR ?auto_173977 ) ( HOLDING ?auto_173976 ) ( CLEAR ?auto_173975 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173974 ?auto_173975 ?auto_173976 )
      ( MAKE-7PILE ?auto_173974 ?auto_173975 ?auto_173976 ?auto_173977 ?auto_173978 ?auto_173979 ?auto_173980 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173983 - BLOCK
      ?auto_173984 - BLOCK
      ?auto_173985 - BLOCK
      ?auto_173986 - BLOCK
      ?auto_173987 - BLOCK
      ?auto_173988 - BLOCK
      ?auto_173989 - BLOCK
    )
    :vars
    (
      ?auto_173991 - BLOCK
      ?auto_173990 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173983 ) ( ON ?auto_173984 ?auto_173983 ) ( not ( = ?auto_173983 ?auto_173984 ) ) ( not ( = ?auto_173983 ?auto_173985 ) ) ( not ( = ?auto_173983 ?auto_173986 ) ) ( not ( = ?auto_173983 ?auto_173987 ) ) ( not ( = ?auto_173983 ?auto_173988 ) ) ( not ( = ?auto_173983 ?auto_173989 ) ) ( not ( = ?auto_173984 ?auto_173985 ) ) ( not ( = ?auto_173984 ?auto_173986 ) ) ( not ( = ?auto_173984 ?auto_173987 ) ) ( not ( = ?auto_173984 ?auto_173988 ) ) ( not ( = ?auto_173984 ?auto_173989 ) ) ( not ( = ?auto_173985 ?auto_173986 ) ) ( not ( = ?auto_173985 ?auto_173987 ) ) ( not ( = ?auto_173985 ?auto_173988 ) ) ( not ( = ?auto_173985 ?auto_173989 ) ) ( not ( = ?auto_173986 ?auto_173987 ) ) ( not ( = ?auto_173986 ?auto_173988 ) ) ( not ( = ?auto_173986 ?auto_173989 ) ) ( not ( = ?auto_173987 ?auto_173988 ) ) ( not ( = ?auto_173987 ?auto_173989 ) ) ( not ( = ?auto_173988 ?auto_173989 ) ) ( ON ?auto_173989 ?auto_173991 ) ( not ( = ?auto_173983 ?auto_173991 ) ) ( not ( = ?auto_173984 ?auto_173991 ) ) ( not ( = ?auto_173985 ?auto_173991 ) ) ( not ( = ?auto_173986 ?auto_173991 ) ) ( not ( = ?auto_173987 ?auto_173991 ) ) ( not ( = ?auto_173988 ?auto_173991 ) ) ( not ( = ?auto_173989 ?auto_173991 ) ) ( ON ?auto_173988 ?auto_173989 ) ( ON-TABLE ?auto_173990 ) ( ON ?auto_173991 ?auto_173990 ) ( not ( = ?auto_173990 ?auto_173991 ) ) ( not ( = ?auto_173990 ?auto_173989 ) ) ( not ( = ?auto_173990 ?auto_173988 ) ) ( not ( = ?auto_173983 ?auto_173990 ) ) ( not ( = ?auto_173984 ?auto_173990 ) ) ( not ( = ?auto_173985 ?auto_173990 ) ) ( not ( = ?auto_173986 ?auto_173990 ) ) ( not ( = ?auto_173987 ?auto_173990 ) ) ( ON ?auto_173987 ?auto_173988 ) ( ON ?auto_173986 ?auto_173987 ) ( CLEAR ?auto_173984 ) ( ON ?auto_173985 ?auto_173986 ) ( CLEAR ?auto_173985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173990 ?auto_173991 ?auto_173989 ?auto_173988 ?auto_173987 ?auto_173986 )
      ( MAKE-7PILE ?auto_173983 ?auto_173984 ?auto_173985 ?auto_173986 ?auto_173987 ?auto_173988 ?auto_173989 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_173992 - BLOCK
      ?auto_173993 - BLOCK
      ?auto_173994 - BLOCK
      ?auto_173995 - BLOCK
      ?auto_173996 - BLOCK
      ?auto_173997 - BLOCK
      ?auto_173998 - BLOCK
    )
    :vars
    (
      ?auto_174000 - BLOCK
      ?auto_173999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173992 ) ( not ( = ?auto_173992 ?auto_173993 ) ) ( not ( = ?auto_173992 ?auto_173994 ) ) ( not ( = ?auto_173992 ?auto_173995 ) ) ( not ( = ?auto_173992 ?auto_173996 ) ) ( not ( = ?auto_173992 ?auto_173997 ) ) ( not ( = ?auto_173992 ?auto_173998 ) ) ( not ( = ?auto_173993 ?auto_173994 ) ) ( not ( = ?auto_173993 ?auto_173995 ) ) ( not ( = ?auto_173993 ?auto_173996 ) ) ( not ( = ?auto_173993 ?auto_173997 ) ) ( not ( = ?auto_173993 ?auto_173998 ) ) ( not ( = ?auto_173994 ?auto_173995 ) ) ( not ( = ?auto_173994 ?auto_173996 ) ) ( not ( = ?auto_173994 ?auto_173997 ) ) ( not ( = ?auto_173994 ?auto_173998 ) ) ( not ( = ?auto_173995 ?auto_173996 ) ) ( not ( = ?auto_173995 ?auto_173997 ) ) ( not ( = ?auto_173995 ?auto_173998 ) ) ( not ( = ?auto_173996 ?auto_173997 ) ) ( not ( = ?auto_173996 ?auto_173998 ) ) ( not ( = ?auto_173997 ?auto_173998 ) ) ( ON ?auto_173998 ?auto_174000 ) ( not ( = ?auto_173992 ?auto_174000 ) ) ( not ( = ?auto_173993 ?auto_174000 ) ) ( not ( = ?auto_173994 ?auto_174000 ) ) ( not ( = ?auto_173995 ?auto_174000 ) ) ( not ( = ?auto_173996 ?auto_174000 ) ) ( not ( = ?auto_173997 ?auto_174000 ) ) ( not ( = ?auto_173998 ?auto_174000 ) ) ( ON ?auto_173997 ?auto_173998 ) ( ON-TABLE ?auto_173999 ) ( ON ?auto_174000 ?auto_173999 ) ( not ( = ?auto_173999 ?auto_174000 ) ) ( not ( = ?auto_173999 ?auto_173998 ) ) ( not ( = ?auto_173999 ?auto_173997 ) ) ( not ( = ?auto_173992 ?auto_173999 ) ) ( not ( = ?auto_173993 ?auto_173999 ) ) ( not ( = ?auto_173994 ?auto_173999 ) ) ( not ( = ?auto_173995 ?auto_173999 ) ) ( not ( = ?auto_173996 ?auto_173999 ) ) ( ON ?auto_173996 ?auto_173997 ) ( ON ?auto_173995 ?auto_173996 ) ( ON ?auto_173994 ?auto_173995 ) ( CLEAR ?auto_173994 ) ( HOLDING ?auto_173993 ) ( CLEAR ?auto_173992 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173992 ?auto_173993 )
      ( MAKE-7PILE ?auto_173992 ?auto_173993 ?auto_173994 ?auto_173995 ?auto_173996 ?auto_173997 ?auto_173998 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174001 - BLOCK
      ?auto_174002 - BLOCK
      ?auto_174003 - BLOCK
      ?auto_174004 - BLOCK
      ?auto_174005 - BLOCK
      ?auto_174006 - BLOCK
      ?auto_174007 - BLOCK
    )
    :vars
    (
      ?auto_174008 - BLOCK
      ?auto_174009 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174001 ) ( not ( = ?auto_174001 ?auto_174002 ) ) ( not ( = ?auto_174001 ?auto_174003 ) ) ( not ( = ?auto_174001 ?auto_174004 ) ) ( not ( = ?auto_174001 ?auto_174005 ) ) ( not ( = ?auto_174001 ?auto_174006 ) ) ( not ( = ?auto_174001 ?auto_174007 ) ) ( not ( = ?auto_174002 ?auto_174003 ) ) ( not ( = ?auto_174002 ?auto_174004 ) ) ( not ( = ?auto_174002 ?auto_174005 ) ) ( not ( = ?auto_174002 ?auto_174006 ) ) ( not ( = ?auto_174002 ?auto_174007 ) ) ( not ( = ?auto_174003 ?auto_174004 ) ) ( not ( = ?auto_174003 ?auto_174005 ) ) ( not ( = ?auto_174003 ?auto_174006 ) ) ( not ( = ?auto_174003 ?auto_174007 ) ) ( not ( = ?auto_174004 ?auto_174005 ) ) ( not ( = ?auto_174004 ?auto_174006 ) ) ( not ( = ?auto_174004 ?auto_174007 ) ) ( not ( = ?auto_174005 ?auto_174006 ) ) ( not ( = ?auto_174005 ?auto_174007 ) ) ( not ( = ?auto_174006 ?auto_174007 ) ) ( ON ?auto_174007 ?auto_174008 ) ( not ( = ?auto_174001 ?auto_174008 ) ) ( not ( = ?auto_174002 ?auto_174008 ) ) ( not ( = ?auto_174003 ?auto_174008 ) ) ( not ( = ?auto_174004 ?auto_174008 ) ) ( not ( = ?auto_174005 ?auto_174008 ) ) ( not ( = ?auto_174006 ?auto_174008 ) ) ( not ( = ?auto_174007 ?auto_174008 ) ) ( ON ?auto_174006 ?auto_174007 ) ( ON-TABLE ?auto_174009 ) ( ON ?auto_174008 ?auto_174009 ) ( not ( = ?auto_174009 ?auto_174008 ) ) ( not ( = ?auto_174009 ?auto_174007 ) ) ( not ( = ?auto_174009 ?auto_174006 ) ) ( not ( = ?auto_174001 ?auto_174009 ) ) ( not ( = ?auto_174002 ?auto_174009 ) ) ( not ( = ?auto_174003 ?auto_174009 ) ) ( not ( = ?auto_174004 ?auto_174009 ) ) ( not ( = ?auto_174005 ?auto_174009 ) ) ( ON ?auto_174005 ?auto_174006 ) ( ON ?auto_174004 ?auto_174005 ) ( ON ?auto_174003 ?auto_174004 ) ( CLEAR ?auto_174001 ) ( ON ?auto_174002 ?auto_174003 ) ( CLEAR ?auto_174002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174009 ?auto_174008 ?auto_174007 ?auto_174006 ?auto_174005 ?auto_174004 ?auto_174003 )
      ( MAKE-7PILE ?auto_174001 ?auto_174002 ?auto_174003 ?auto_174004 ?auto_174005 ?auto_174006 ?auto_174007 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174010 - BLOCK
      ?auto_174011 - BLOCK
      ?auto_174012 - BLOCK
      ?auto_174013 - BLOCK
      ?auto_174014 - BLOCK
      ?auto_174015 - BLOCK
      ?auto_174016 - BLOCK
    )
    :vars
    (
      ?auto_174017 - BLOCK
      ?auto_174018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174010 ?auto_174011 ) ) ( not ( = ?auto_174010 ?auto_174012 ) ) ( not ( = ?auto_174010 ?auto_174013 ) ) ( not ( = ?auto_174010 ?auto_174014 ) ) ( not ( = ?auto_174010 ?auto_174015 ) ) ( not ( = ?auto_174010 ?auto_174016 ) ) ( not ( = ?auto_174011 ?auto_174012 ) ) ( not ( = ?auto_174011 ?auto_174013 ) ) ( not ( = ?auto_174011 ?auto_174014 ) ) ( not ( = ?auto_174011 ?auto_174015 ) ) ( not ( = ?auto_174011 ?auto_174016 ) ) ( not ( = ?auto_174012 ?auto_174013 ) ) ( not ( = ?auto_174012 ?auto_174014 ) ) ( not ( = ?auto_174012 ?auto_174015 ) ) ( not ( = ?auto_174012 ?auto_174016 ) ) ( not ( = ?auto_174013 ?auto_174014 ) ) ( not ( = ?auto_174013 ?auto_174015 ) ) ( not ( = ?auto_174013 ?auto_174016 ) ) ( not ( = ?auto_174014 ?auto_174015 ) ) ( not ( = ?auto_174014 ?auto_174016 ) ) ( not ( = ?auto_174015 ?auto_174016 ) ) ( ON ?auto_174016 ?auto_174017 ) ( not ( = ?auto_174010 ?auto_174017 ) ) ( not ( = ?auto_174011 ?auto_174017 ) ) ( not ( = ?auto_174012 ?auto_174017 ) ) ( not ( = ?auto_174013 ?auto_174017 ) ) ( not ( = ?auto_174014 ?auto_174017 ) ) ( not ( = ?auto_174015 ?auto_174017 ) ) ( not ( = ?auto_174016 ?auto_174017 ) ) ( ON ?auto_174015 ?auto_174016 ) ( ON-TABLE ?auto_174018 ) ( ON ?auto_174017 ?auto_174018 ) ( not ( = ?auto_174018 ?auto_174017 ) ) ( not ( = ?auto_174018 ?auto_174016 ) ) ( not ( = ?auto_174018 ?auto_174015 ) ) ( not ( = ?auto_174010 ?auto_174018 ) ) ( not ( = ?auto_174011 ?auto_174018 ) ) ( not ( = ?auto_174012 ?auto_174018 ) ) ( not ( = ?auto_174013 ?auto_174018 ) ) ( not ( = ?auto_174014 ?auto_174018 ) ) ( ON ?auto_174014 ?auto_174015 ) ( ON ?auto_174013 ?auto_174014 ) ( ON ?auto_174012 ?auto_174013 ) ( ON ?auto_174011 ?auto_174012 ) ( CLEAR ?auto_174011 ) ( HOLDING ?auto_174010 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174010 )
      ( MAKE-7PILE ?auto_174010 ?auto_174011 ?auto_174012 ?auto_174013 ?auto_174014 ?auto_174015 ?auto_174016 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174019 - BLOCK
      ?auto_174020 - BLOCK
      ?auto_174021 - BLOCK
      ?auto_174022 - BLOCK
      ?auto_174023 - BLOCK
      ?auto_174024 - BLOCK
      ?auto_174025 - BLOCK
    )
    :vars
    (
      ?auto_174026 - BLOCK
      ?auto_174027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174019 ?auto_174020 ) ) ( not ( = ?auto_174019 ?auto_174021 ) ) ( not ( = ?auto_174019 ?auto_174022 ) ) ( not ( = ?auto_174019 ?auto_174023 ) ) ( not ( = ?auto_174019 ?auto_174024 ) ) ( not ( = ?auto_174019 ?auto_174025 ) ) ( not ( = ?auto_174020 ?auto_174021 ) ) ( not ( = ?auto_174020 ?auto_174022 ) ) ( not ( = ?auto_174020 ?auto_174023 ) ) ( not ( = ?auto_174020 ?auto_174024 ) ) ( not ( = ?auto_174020 ?auto_174025 ) ) ( not ( = ?auto_174021 ?auto_174022 ) ) ( not ( = ?auto_174021 ?auto_174023 ) ) ( not ( = ?auto_174021 ?auto_174024 ) ) ( not ( = ?auto_174021 ?auto_174025 ) ) ( not ( = ?auto_174022 ?auto_174023 ) ) ( not ( = ?auto_174022 ?auto_174024 ) ) ( not ( = ?auto_174022 ?auto_174025 ) ) ( not ( = ?auto_174023 ?auto_174024 ) ) ( not ( = ?auto_174023 ?auto_174025 ) ) ( not ( = ?auto_174024 ?auto_174025 ) ) ( ON ?auto_174025 ?auto_174026 ) ( not ( = ?auto_174019 ?auto_174026 ) ) ( not ( = ?auto_174020 ?auto_174026 ) ) ( not ( = ?auto_174021 ?auto_174026 ) ) ( not ( = ?auto_174022 ?auto_174026 ) ) ( not ( = ?auto_174023 ?auto_174026 ) ) ( not ( = ?auto_174024 ?auto_174026 ) ) ( not ( = ?auto_174025 ?auto_174026 ) ) ( ON ?auto_174024 ?auto_174025 ) ( ON-TABLE ?auto_174027 ) ( ON ?auto_174026 ?auto_174027 ) ( not ( = ?auto_174027 ?auto_174026 ) ) ( not ( = ?auto_174027 ?auto_174025 ) ) ( not ( = ?auto_174027 ?auto_174024 ) ) ( not ( = ?auto_174019 ?auto_174027 ) ) ( not ( = ?auto_174020 ?auto_174027 ) ) ( not ( = ?auto_174021 ?auto_174027 ) ) ( not ( = ?auto_174022 ?auto_174027 ) ) ( not ( = ?auto_174023 ?auto_174027 ) ) ( ON ?auto_174023 ?auto_174024 ) ( ON ?auto_174022 ?auto_174023 ) ( ON ?auto_174021 ?auto_174022 ) ( ON ?auto_174020 ?auto_174021 ) ( ON ?auto_174019 ?auto_174020 ) ( CLEAR ?auto_174019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174027 ?auto_174026 ?auto_174025 ?auto_174024 ?auto_174023 ?auto_174022 ?auto_174021 ?auto_174020 )
      ( MAKE-7PILE ?auto_174019 ?auto_174020 ?auto_174021 ?auto_174022 ?auto_174023 ?auto_174024 ?auto_174025 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174029 - BLOCK
    )
    :vars
    (
      ?auto_174030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174030 ?auto_174029 ) ( CLEAR ?auto_174030 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174029 ) ( not ( = ?auto_174029 ?auto_174030 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_174030 ?auto_174029 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174031 - BLOCK
    )
    :vars
    (
      ?auto_174032 - BLOCK
      ?auto_174033 - BLOCK
      ?auto_174034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174032 ?auto_174031 ) ( CLEAR ?auto_174032 ) ( ON-TABLE ?auto_174031 ) ( not ( = ?auto_174031 ?auto_174032 ) ) ( HOLDING ?auto_174033 ) ( CLEAR ?auto_174034 ) ( not ( = ?auto_174031 ?auto_174033 ) ) ( not ( = ?auto_174031 ?auto_174034 ) ) ( not ( = ?auto_174032 ?auto_174033 ) ) ( not ( = ?auto_174032 ?auto_174034 ) ) ( not ( = ?auto_174033 ?auto_174034 ) ) )
    :subtasks
    ( ( !STACK ?auto_174033 ?auto_174034 )
      ( MAKE-1PILE ?auto_174031 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174035 - BLOCK
    )
    :vars
    (
      ?auto_174037 - BLOCK
      ?auto_174038 - BLOCK
      ?auto_174036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174037 ?auto_174035 ) ( ON-TABLE ?auto_174035 ) ( not ( = ?auto_174035 ?auto_174037 ) ) ( CLEAR ?auto_174038 ) ( not ( = ?auto_174035 ?auto_174036 ) ) ( not ( = ?auto_174035 ?auto_174038 ) ) ( not ( = ?auto_174037 ?auto_174036 ) ) ( not ( = ?auto_174037 ?auto_174038 ) ) ( not ( = ?auto_174036 ?auto_174038 ) ) ( ON ?auto_174036 ?auto_174037 ) ( CLEAR ?auto_174036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174035 ?auto_174037 )
      ( MAKE-1PILE ?auto_174035 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174039 - BLOCK
    )
    :vars
    (
      ?auto_174040 - BLOCK
      ?auto_174041 - BLOCK
      ?auto_174042 - BLOCK
      ?auto_174045 - BLOCK
      ?auto_174044 - BLOCK
      ?auto_174047 - BLOCK
      ?auto_174043 - BLOCK
      ?auto_174046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174040 ?auto_174039 ) ( ON-TABLE ?auto_174039 ) ( not ( = ?auto_174039 ?auto_174040 ) ) ( not ( = ?auto_174039 ?auto_174041 ) ) ( not ( = ?auto_174039 ?auto_174042 ) ) ( not ( = ?auto_174040 ?auto_174041 ) ) ( not ( = ?auto_174040 ?auto_174042 ) ) ( not ( = ?auto_174041 ?auto_174042 ) ) ( ON ?auto_174041 ?auto_174040 ) ( CLEAR ?auto_174041 ) ( HOLDING ?auto_174042 ) ( CLEAR ?auto_174045 ) ( ON-TABLE ?auto_174044 ) ( ON ?auto_174047 ?auto_174044 ) ( ON ?auto_174043 ?auto_174047 ) ( ON ?auto_174046 ?auto_174043 ) ( ON ?auto_174045 ?auto_174046 ) ( not ( = ?auto_174044 ?auto_174047 ) ) ( not ( = ?auto_174044 ?auto_174043 ) ) ( not ( = ?auto_174044 ?auto_174046 ) ) ( not ( = ?auto_174044 ?auto_174045 ) ) ( not ( = ?auto_174044 ?auto_174042 ) ) ( not ( = ?auto_174047 ?auto_174043 ) ) ( not ( = ?auto_174047 ?auto_174046 ) ) ( not ( = ?auto_174047 ?auto_174045 ) ) ( not ( = ?auto_174047 ?auto_174042 ) ) ( not ( = ?auto_174043 ?auto_174046 ) ) ( not ( = ?auto_174043 ?auto_174045 ) ) ( not ( = ?auto_174043 ?auto_174042 ) ) ( not ( = ?auto_174046 ?auto_174045 ) ) ( not ( = ?auto_174046 ?auto_174042 ) ) ( not ( = ?auto_174045 ?auto_174042 ) ) ( not ( = ?auto_174039 ?auto_174045 ) ) ( not ( = ?auto_174039 ?auto_174044 ) ) ( not ( = ?auto_174039 ?auto_174047 ) ) ( not ( = ?auto_174039 ?auto_174043 ) ) ( not ( = ?auto_174039 ?auto_174046 ) ) ( not ( = ?auto_174040 ?auto_174045 ) ) ( not ( = ?auto_174040 ?auto_174044 ) ) ( not ( = ?auto_174040 ?auto_174047 ) ) ( not ( = ?auto_174040 ?auto_174043 ) ) ( not ( = ?auto_174040 ?auto_174046 ) ) ( not ( = ?auto_174041 ?auto_174045 ) ) ( not ( = ?auto_174041 ?auto_174044 ) ) ( not ( = ?auto_174041 ?auto_174047 ) ) ( not ( = ?auto_174041 ?auto_174043 ) ) ( not ( = ?auto_174041 ?auto_174046 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174044 ?auto_174047 ?auto_174043 ?auto_174046 ?auto_174045 ?auto_174042 )
      ( MAKE-1PILE ?auto_174039 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174048 - BLOCK
    )
    :vars
    (
      ?auto_174051 - BLOCK
      ?auto_174054 - BLOCK
      ?auto_174052 - BLOCK
      ?auto_174056 - BLOCK
      ?auto_174050 - BLOCK
      ?auto_174053 - BLOCK
      ?auto_174055 - BLOCK
      ?auto_174049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174051 ?auto_174048 ) ( ON-TABLE ?auto_174048 ) ( not ( = ?auto_174048 ?auto_174051 ) ) ( not ( = ?auto_174048 ?auto_174054 ) ) ( not ( = ?auto_174048 ?auto_174052 ) ) ( not ( = ?auto_174051 ?auto_174054 ) ) ( not ( = ?auto_174051 ?auto_174052 ) ) ( not ( = ?auto_174054 ?auto_174052 ) ) ( ON ?auto_174054 ?auto_174051 ) ( CLEAR ?auto_174056 ) ( ON-TABLE ?auto_174050 ) ( ON ?auto_174053 ?auto_174050 ) ( ON ?auto_174055 ?auto_174053 ) ( ON ?auto_174049 ?auto_174055 ) ( ON ?auto_174056 ?auto_174049 ) ( not ( = ?auto_174050 ?auto_174053 ) ) ( not ( = ?auto_174050 ?auto_174055 ) ) ( not ( = ?auto_174050 ?auto_174049 ) ) ( not ( = ?auto_174050 ?auto_174056 ) ) ( not ( = ?auto_174050 ?auto_174052 ) ) ( not ( = ?auto_174053 ?auto_174055 ) ) ( not ( = ?auto_174053 ?auto_174049 ) ) ( not ( = ?auto_174053 ?auto_174056 ) ) ( not ( = ?auto_174053 ?auto_174052 ) ) ( not ( = ?auto_174055 ?auto_174049 ) ) ( not ( = ?auto_174055 ?auto_174056 ) ) ( not ( = ?auto_174055 ?auto_174052 ) ) ( not ( = ?auto_174049 ?auto_174056 ) ) ( not ( = ?auto_174049 ?auto_174052 ) ) ( not ( = ?auto_174056 ?auto_174052 ) ) ( not ( = ?auto_174048 ?auto_174056 ) ) ( not ( = ?auto_174048 ?auto_174050 ) ) ( not ( = ?auto_174048 ?auto_174053 ) ) ( not ( = ?auto_174048 ?auto_174055 ) ) ( not ( = ?auto_174048 ?auto_174049 ) ) ( not ( = ?auto_174051 ?auto_174056 ) ) ( not ( = ?auto_174051 ?auto_174050 ) ) ( not ( = ?auto_174051 ?auto_174053 ) ) ( not ( = ?auto_174051 ?auto_174055 ) ) ( not ( = ?auto_174051 ?auto_174049 ) ) ( not ( = ?auto_174054 ?auto_174056 ) ) ( not ( = ?auto_174054 ?auto_174050 ) ) ( not ( = ?auto_174054 ?auto_174053 ) ) ( not ( = ?auto_174054 ?auto_174055 ) ) ( not ( = ?auto_174054 ?auto_174049 ) ) ( ON ?auto_174052 ?auto_174054 ) ( CLEAR ?auto_174052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174048 ?auto_174051 ?auto_174054 )
      ( MAKE-1PILE ?auto_174048 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174057 - BLOCK
    )
    :vars
    (
      ?auto_174065 - BLOCK
      ?auto_174063 - BLOCK
      ?auto_174062 - BLOCK
      ?auto_174064 - BLOCK
      ?auto_174059 - BLOCK
      ?auto_174058 - BLOCK
      ?auto_174060 - BLOCK
      ?auto_174061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174065 ?auto_174057 ) ( ON-TABLE ?auto_174057 ) ( not ( = ?auto_174057 ?auto_174065 ) ) ( not ( = ?auto_174057 ?auto_174063 ) ) ( not ( = ?auto_174057 ?auto_174062 ) ) ( not ( = ?auto_174065 ?auto_174063 ) ) ( not ( = ?auto_174065 ?auto_174062 ) ) ( not ( = ?auto_174063 ?auto_174062 ) ) ( ON ?auto_174063 ?auto_174065 ) ( ON-TABLE ?auto_174064 ) ( ON ?auto_174059 ?auto_174064 ) ( ON ?auto_174058 ?auto_174059 ) ( ON ?auto_174060 ?auto_174058 ) ( not ( = ?auto_174064 ?auto_174059 ) ) ( not ( = ?auto_174064 ?auto_174058 ) ) ( not ( = ?auto_174064 ?auto_174060 ) ) ( not ( = ?auto_174064 ?auto_174061 ) ) ( not ( = ?auto_174064 ?auto_174062 ) ) ( not ( = ?auto_174059 ?auto_174058 ) ) ( not ( = ?auto_174059 ?auto_174060 ) ) ( not ( = ?auto_174059 ?auto_174061 ) ) ( not ( = ?auto_174059 ?auto_174062 ) ) ( not ( = ?auto_174058 ?auto_174060 ) ) ( not ( = ?auto_174058 ?auto_174061 ) ) ( not ( = ?auto_174058 ?auto_174062 ) ) ( not ( = ?auto_174060 ?auto_174061 ) ) ( not ( = ?auto_174060 ?auto_174062 ) ) ( not ( = ?auto_174061 ?auto_174062 ) ) ( not ( = ?auto_174057 ?auto_174061 ) ) ( not ( = ?auto_174057 ?auto_174064 ) ) ( not ( = ?auto_174057 ?auto_174059 ) ) ( not ( = ?auto_174057 ?auto_174058 ) ) ( not ( = ?auto_174057 ?auto_174060 ) ) ( not ( = ?auto_174065 ?auto_174061 ) ) ( not ( = ?auto_174065 ?auto_174064 ) ) ( not ( = ?auto_174065 ?auto_174059 ) ) ( not ( = ?auto_174065 ?auto_174058 ) ) ( not ( = ?auto_174065 ?auto_174060 ) ) ( not ( = ?auto_174063 ?auto_174061 ) ) ( not ( = ?auto_174063 ?auto_174064 ) ) ( not ( = ?auto_174063 ?auto_174059 ) ) ( not ( = ?auto_174063 ?auto_174058 ) ) ( not ( = ?auto_174063 ?auto_174060 ) ) ( ON ?auto_174062 ?auto_174063 ) ( CLEAR ?auto_174062 ) ( HOLDING ?auto_174061 ) ( CLEAR ?auto_174060 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174064 ?auto_174059 ?auto_174058 ?auto_174060 ?auto_174061 )
      ( MAKE-1PILE ?auto_174057 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174066 - BLOCK
    )
    :vars
    (
      ?auto_174074 - BLOCK
      ?auto_174073 - BLOCK
      ?auto_174068 - BLOCK
      ?auto_174067 - BLOCK
      ?auto_174071 - BLOCK
      ?auto_174072 - BLOCK
      ?auto_174070 - BLOCK
      ?auto_174069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174074 ?auto_174066 ) ( ON-TABLE ?auto_174066 ) ( not ( = ?auto_174066 ?auto_174074 ) ) ( not ( = ?auto_174066 ?auto_174073 ) ) ( not ( = ?auto_174066 ?auto_174068 ) ) ( not ( = ?auto_174074 ?auto_174073 ) ) ( not ( = ?auto_174074 ?auto_174068 ) ) ( not ( = ?auto_174073 ?auto_174068 ) ) ( ON ?auto_174073 ?auto_174074 ) ( ON-TABLE ?auto_174067 ) ( ON ?auto_174071 ?auto_174067 ) ( ON ?auto_174072 ?auto_174071 ) ( ON ?auto_174070 ?auto_174072 ) ( not ( = ?auto_174067 ?auto_174071 ) ) ( not ( = ?auto_174067 ?auto_174072 ) ) ( not ( = ?auto_174067 ?auto_174070 ) ) ( not ( = ?auto_174067 ?auto_174069 ) ) ( not ( = ?auto_174067 ?auto_174068 ) ) ( not ( = ?auto_174071 ?auto_174072 ) ) ( not ( = ?auto_174071 ?auto_174070 ) ) ( not ( = ?auto_174071 ?auto_174069 ) ) ( not ( = ?auto_174071 ?auto_174068 ) ) ( not ( = ?auto_174072 ?auto_174070 ) ) ( not ( = ?auto_174072 ?auto_174069 ) ) ( not ( = ?auto_174072 ?auto_174068 ) ) ( not ( = ?auto_174070 ?auto_174069 ) ) ( not ( = ?auto_174070 ?auto_174068 ) ) ( not ( = ?auto_174069 ?auto_174068 ) ) ( not ( = ?auto_174066 ?auto_174069 ) ) ( not ( = ?auto_174066 ?auto_174067 ) ) ( not ( = ?auto_174066 ?auto_174071 ) ) ( not ( = ?auto_174066 ?auto_174072 ) ) ( not ( = ?auto_174066 ?auto_174070 ) ) ( not ( = ?auto_174074 ?auto_174069 ) ) ( not ( = ?auto_174074 ?auto_174067 ) ) ( not ( = ?auto_174074 ?auto_174071 ) ) ( not ( = ?auto_174074 ?auto_174072 ) ) ( not ( = ?auto_174074 ?auto_174070 ) ) ( not ( = ?auto_174073 ?auto_174069 ) ) ( not ( = ?auto_174073 ?auto_174067 ) ) ( not ( = ?auto_174073 ?auto_174071 ) ) ( not ( = ?auto_174073 ?auto_174072 ) ) ( not ( = ?auto_174073 ?auto_174070 ) ) ( ON ?auto_174068 ?auto_174073 ) ( CLEAR ?auto_174070 ) ( ON ?auto_174069 ?auto_174068 ) ( CLEAR ?auto_174069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174066 ?auto_174074 ?auto_174073 ?auto_174068 )
      ( MAKE-1PILE ?auto_174066 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174075 - BLOCK
    )
    :vars
    (
      ?auto_174077 - BLOCK
      ?auto_174081 - BLOCK
      ?auto_174076 - BLOCK
      ?auto_174080 - BLOCK
      ?auto_174079 - BLOCK
      ?auto_174082 - BLOCK
      ?auto_174078 - BLOCK
      ?auto_174083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174077 ?auto_174075 ) ( ON-TABLE ?auto_174075 ) ( not ( = ?auto_174075 ?auto_174077 ) ) ( not ( = ?auto_174075 ?auto_174081 ) ) ( not ( = ?auto_174075 ?auto_174076 ) ) ( not ( = ?auto_174077 ?auto_174081 ) ) ( not ( = ?auto_174077 ?auto_174076 ) ) ( not ( = ?auto_174081 ?auto_174076 ) ) ( ON ?auto_174081 ?auto_174077 ) ( ON-TABLE ?auto_174080 ) ( ON ?auto_174079 ?auto_174080 ) ( ON ?auto_174082 ?auto_174079 ) ( not ( = ?auto_174080 ?auto_174079 ) ) ( not ( = ?auto_174080 ?auto_174082 ) ) ( not ( = ?auto_174080 ?auto_174078 ) ) ( not ( = ?auto_174080 ?auto_174083 ) ) ( not ( = ?auto_174080 ?auto_174076 ) ) ( not ( = ?auto_174079 ?auto_174082 ) ) ( not ( = ?auto_174079 ?auto_174078 ) ) ( not ( = ?auto_174079 ?auto_174083 ) ) ( not ( = ?auto_174079 ?auto_174076 ) ) ( not ( = ?auto_174082 ?auto_174078 ) ) ( not ( = ?auto_174082 ?auto_174083 ) ) ( not ( = ?auto_174082 ?auto_174076 ) ) ( not ( = ?auto_174078 ?auto_174083 ) ) ( not ( = ?auto_174078 ?auto_174076 ) ) ( not ( = ?auto_174083 ?auto_174076 ) ) ( not ( = ?auto_174075 ?auto_174083 ) ) ( not ( = ?auto_174075 ?auto_174080 ) ) ( not ( = ?auto_174075 ?auto_174079 ) ) ( not ( = ?auto_174075 ?auto_174082 ) ) ( not ( = ?auto_174075 ?auto_174078 ) ) ( not ( = ?auto_174077 ?auto_174083 ) ) ( not ( = ?auto_174077 ?auto_174080 ) ) ( not ( = ?auto_174077 ?auto_174079 ) ) ( not ( = ?auto_174077 ?auto_174082 ) ) ( not ( = ?auto_174077 ?auto_174078 ) ) ( not ( = ?auto_174081 ?auto_174083 ) ) ( not ( = ?auto_174081 ?auto_174080 ) ) ( not ( = ?auto_174081 ?auto_174079 ) ) ( not ( = ?auto_174081 ?auto_174082 ) ) ( not ( = ?auto_174081 ?auto_174078 ) ) ( ON ?auto_174076 ?auto_174081 ) ( ON ?auto_174083 ?auto_174076 ) ( CLEAR ?auto_174083 ) ( HOLDING ?auto_174078 ) ( CLEAR ?auto_174082 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174080 ?auto_174079 ?auto_174082 ?auto_174078 )
      ( MAKE-1PILE ?auto_174075 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174084 - BLOCK
    )
    :vars
    (
      ?auto_174089 - BLOCK
      ?auto_174091 - BLOCK
      ?auto_174090 - BLOCK
      ?auto_174088 - BLOCK
      ?auto_174085 - BLOCK
      ?auto_174086 - BLOCK
      ?auto_174092 - BLOCK
      ?auto_174087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174089 ?auto_174084 ) ( ON-TABLE ?auto_174084 ) ( not ( = ?auto_174084 ?auto_174089 ) ) ( not ( = ?auto_174084 ?auto_174091 ) ) ( not ( = ?auto_174084 ?auto_174090 ) ) ( not ( = ?auto_174089 ?auto_174091 ) ) ( not ( = ?auto_174089 ?auto_174090 ) ) ( not ( = ?auto_174091 ?auto_174090 ) ) ( ON ?auto_174091 ?auto_174089 ) ( ON-TABLE ?auto_174088 ) ( ON ?auto_174085 ?auto_174088 ) ( ON ?auto_174086 ?auto_174085 ) ( not ( = ?auto_174088 ?auto_174085 ) ) ( not ( = ?auto_174088 ?auto_174086 ) ) ( not ( = ?auto_174088 ?auto_174092 ) ) ( not ( = ?auto_174088 ?auto_174087 ) ) ( not ( = ?auto_174088 ?auto_174090 ) ) ( not ( = ?auto_174085 ?auto_174086 ) ) ( not ( = ?auto_174085 ?auto_174092 ) ) ( not ( = ?auto_174085 ?auto_174087 ) ) ( not ( = ?auto_174085 ?auto_174090 ) ) ( not ( = ?auto_174086 ?auto_174092 ) ) ( not ( = ?auto_174086 ?auto_174087 ) ) ( not ( = ?auto_174086 ?auto_174090 ) ) ( not ( = ?auto_174092 ?auto_174087 ) ) ( not ( = ?auto_174092 ?auto_174090 ) ) ( not ( = ?auto_174087 ?auto_174090 ) ) ( not ( = ?auto_174084 ?auto_174087 ) ) ( not ( = ?auto_174084 ?auto_174088 ) ) ( not ( = ?auto_174084 ?auto_174085 ) ) ( not ( = ?auto_174084 ?auto_174086 ) ) ( not ( = ?auto_174084 ?auto_174092 ) ) ( not ( = ?auto_174089 ?auto_174087 ) ) ( not ( = ?auto_174089 ?auto_174088 ) ) ( not ( = ?auto_174089 ?auto_174085 ) ) ( not ( = ?auto_174089 ?auto_174086 ) ) ( not ( = ?auto_174089 ?auto_174092 ) ) ( not ( = ?auto_174091 ?auto_174087 ) ) ( not ( = ?auto_174091 ?auto_174088 ) ) ( not ( = ?auto_174091 ?auto_174085 ) ) ( not ( = ?auto_174091 ?auto_174086 ) ) ( not ( = ?auto_174091 ?auto_174092 ) ) ( ON ?auto_174090 ?auto_174091 ) ( ON ?auto_174087 ?auto_174090 ) ( CLEAR ?auto_174086 ) ( ON ?auto_174092 ?auto_174087 ) ( CLEAR ?auto_174092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174084 ?auto_174089 ?auto_174091 ?auto_174090 ?auto_174087 )
      ( MAKE-1PILE ?auto_174084 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174093 - BLOCK
    )
    :vars
    (
      ?auto_174099 - BLOCK
      ?auto_174094 - BLOCK
      ?auto_174096 - BLOCK
      ?auto_174095 - BLOCK
      ?auto_174098 - BLOCK
      ?auto_174100 - BLOCK
      ?auto_174097 - BLOCK
      ?auto_174101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174099 ?auto_174093 ) ( ON-TABLE ?auto_174093 ) ( not ( = ?auto_174093 ?auto_174099 ) ) ( not ( = ?auto_174093 ?auto_174094 ) ) ( not ( = ?auto_174093 ?auto_174096 ) ) ( not ( = ?auto_174099 ?auto_174094 ) ) ( not ( = ?auto_174099 ?auto_174096 ) ) ( not ( = ?auto_174094 ?auto_174096 ) ) ( ON ?auto_174094 ?auto_174099 ) ( ON-TABLE ?auto_174095 ) ( ON ?auto_174098 ?auto_174095 ) ( not ( = ?auto_174095 ?auto_174098 ) ) ( not ( = ?auto_174095 ?auto_174100 ) ) ( not ( = ?auto_174095 ?auto_174097 ) ) ( not ( = ?auto_174095 ?auto_174101 ) ) ( not ( = ?auto_174095 ?auto_174096 ) ) ( not ( = ?auto_174098 ?auto_174100 ) ) ( not ( = ?auto_174098 ?auto_174097 ) ) ( not ( = ?auto_174098 ?auto_174101 ) ) ( not ( = ?auto_174098 ?auto_174096 ) ) ( not ( = ?auto_174100 ?auto_174097 ) ) ( not ( = ?auto_174100 ?auto_174101 ) ) ( not ( = ?auto_174100 ?auto_174096 ) ) ( not ( = ?auto_174097 ?auto_174101 ) ) ( not ( = ?auto_174097 ?auto_174096 ) ) ( not ( = ?auto_174101 ?auto_174096 ) ) ( not ( = ?auto_174093 ?auto_174101 ) ) ( not ( = ?auto_174093 ?auto_174095 ) ) ( not ( = ?auto_174093 ?auto_174098 ) ) ( not ( = ?auto_174093 ?auto_174100 ) ) ( not ( = ?auto_174093 ?auto_174097 ) ) ( not ( = ?auto_174099 ?auto_174101 ) ) ( not ( = ?auto_174099 ?auto_174095 ) ) ( not ( = ?auto_174099 ?auto_174098 ) ) ( not ( = ?auto_174099 ?auto_174100 ) ) ( not ( = ?auto_174099 ?auto_174097 ) ) ( not ( = ?auto_174094 ?auto_174101 ) ) ( not ( = ?auto_174094 ?auto_174095 ) ) ( not ( = ?auto_174094 ?auto_174098 ) ) ( not ( = ?auto_174094 ?auto_174100 ) ) ( not ( = ?auto_174094 ?auto_174097 ) ) ( ON ?auto_174096 ?auto_174094 ) ( ON ?auto_174101 ?auto_174096 ) ( ON ?auto_174097 ?auto_174101 ) ( CLEAR ?auto_174097 ) ( HOLDING ?auto_174100 ) ( CLEAR ?auto_174098 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174095 ?auto_174098 ?auto_174100 )
      ( MAKE-1PILE ?auto_174093 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174102 - BLOCK
    )
    :vars
    (
      ?auto_174104 - BLOCK
      ?auto_174105 - BLOCK
      ?auto_174109 - BLOCK
      ?auto_174107 - BLOCK
      ?auto_174106 - BLOCK
      ?auto_174103 - BLOCK
      ?auto_174108 - BLOCK
      ?auto_174110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174104 ?auto_174102 ) ( ON-TABLE ?auto_174102 ) ( not ( = ?auto_174102 ?auto_174104 ) ) ( not ( = ?auto_174102 ?auto_174105 ) ) ( not ( = ?auto_174102 ?auto_174109 ) ) ( not ( = ?auto_174104 ?auto_174105 ) ) ( not ( = ?auto_174104 ?auto_174109 ) ) ( not ( = ?auto_174105 ?auto_174109 ) ) ( ON ?auto_174105 ?auto_174104 ) ( ON-TABLE ?auto_174107 ) ( ON ?auto_174106 ?auto_174107 ) ( not ( = ?auto_174107 ?auto_174106 ) ) ( not ( = ?auto_174107 ?auto_174103 ) ) ( not ( = ?auto_174107 ?auto_174108 ) ) ( not ( = ?auto_174107 ?auto_174110 ) ) ( not ( = ?auto_174107 ?auto_174109 ) ) ( not ( = ?auto_174106 ?auto_174103 ) ) ( not ( = ?auto_174106 ?auto_174108 ) ) ( not ( = ?auto_174106 ?auto_174110 ) ) ( not ( = ?auto_174106 ?auto_174109 ) ) ( not ( = ?auto_174103 ?auto_174108 ) ) ( not ( = ?auto_174103 ?auto_174110 ) ) ( not ( = ?auto_174103 ?auto_174109 ) ) ( not ( = ?auto_174108 ?auto_174110 ) ) ( not ( = ?auto_174108 ?auto_174109 ) ) ( not ( = ?auto_174110 ?auto_174109 ) ) ( not ( = ?auto_174102 ?auto_174110 ) ) ( not ( = ?auto_174102 ?auto_174107 ) ) ( not ( = ?auto_174102 ?auto_174106 ) ) ( not ( = ?auto_174102 ?auto_174103 ) ) ( not ( = ?auto_174102 ?auto_174108 ) ) ( not ( = ?auto_174104 ?auto_174110 ) ) ( not ( = ?auto_174104 ?auto_174107 ) ) ( not ( = ?auto_174104 ?auto_174106 ) ) ( not ( = ?auto_174104 ?auto_174103 ) ) ( not ( = ?auto_174104 ?auto_174108 ) ) ( not ( = ?auto_174105 ?auto_174110 ) ) ( not ( = ?auto_174105 ?auto_174107 ) ) ( not ( = ?auto_174105 ?auto_174106 ) ) ( not ( = ?auto_174105 ?auto_174103 ) ) ( not ( = ?auto_174105 ?auto_174108 ) ) ( ON ?auto_174109 ?auto_174105 ) ( ON ?auto_174110 ?auto_174109 ) ( ON ?auto_174108 ?auto_174110 ) ( CLEAR ?auto_174106 ) ( ON ?auto_174103 ?auto_174108 ) ( CLEAR ?auto_174103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174102 ?auto_174104 ?auto_174105 ?auto_174109 ?auto_174110 ?auto_174108 )
      ( MAKE-1PILE ?auto_174102 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174111 - BLOCK
    )
    :vars
    (
      ?auto_174115 - BLOCK
      ?auto_174113 - BLOCK
      ?auto_174119 - BLOCK
      ?auto_174117 - BLOCK
      ?auto_174112 - BLOCK
      ?auto_174118 - BLOCK
      ?auto_174116 - BLOCK
      ?auto_174114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174115 ?auto_174111 ) ( ON-TABLE ?auto_174111 ) ( not ( = ?auto_174111 ?auto_174115 ) ) ( not ( = ?auto_174111 ?auto_174113 ) ) ( not ( = ?auto_174111 ?auto_174119 ) ) ( not ( = ?auto_174115 ?auto_174113 ) ) ( not ( = ?auto_174115 ?auto_174119 ) ) ( not ( = ?auto_174113 ?auto_174119 ) ) ( ON ?auto_174113 ?auto_174115 ) ( ON-TABLE ?auto_174117 ) ( not ( = ?auto_174117 ?auto_174112 ) ) ( not ( = ?auto_174117 ?auto_174118 ) ) ( not ( = ?auto_174117 ?auto_174116 ) ) ( not ( = ?auto_174117 ?auto_174114 ) ) ( not ( = ?auto_174117 ?auto_174119 ) ) ( not ( = ?auto_174112 ?auto_174118 ) ) ( not ( = ?auto_174112 ?auto_174116 ) ) ( not ( = ?auto_174112 ?auto_174114 ) ) ( not ( = ?auto_174112 ?auto_174119 ) ) ( not ( = ?auto_174118 ?auto_174116 ) ) ( not ( = ?auto_174118 ?auto_174114 ) ) ( not ( = ?auto_174118 ?auto_174119 ) ) ( not ( = ?auto_174116 ?auto_174114 ) ) ( not ( = ?auto_174116 ?auto_174119 ) ) ( not ( = ?auto_174114 ?auto_174119 ) ) ( not ( = ?auto_174111 ?auto_174114 ) ) ( not ( = ?auto_174111 ?auto_174117 ) ) ( not ( = ?auto_174111 ?auto_174112 ) ) ( not ( = ?auto_174111 ?auto_174118 ) ) ( not ( = ?auto_174111 ?auto_174116 ) ) ( not ( = ?auto_174115 ?auto_174114 ) ) ( not ( = ?auto_174115 ?auto_174117 ) ) ( not ( = ?auto_174115 ?auto_174112 ) ) ( not ( = ?auto_174115 ?auto_174118 ) ) ( not ( = ?auto_174115 ?auto_174116 ) ) ( not ( = ?auto_174113 ?auto_174114 ) ) ( not ( = ?auto_174113 ?auto_174117 ) ) ( not ( = ?auto_174113 ?auto_174112 ) ) ( not ( = ?auto_174113 ?auto_174118 ) ) ( not ( = ?auto_174113 ?auto_174116 ) ) ( ON ?auto_174119 ?auto_174113 ) ( ON ?auto_174114 ?auto_174119 ) ( ON ?auto_174116 ?auto_174114 ) ( ON ?auto_174118 ?auto_174116 ) ( CLEAR ?auto_174118 ) ( HOLDING ?auto_174112 ) ( CLEAR ?auto_174117 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174117 ?auto_174112 )
      ( MAKE-1PILE ?auto_174111 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176290 - BLOCK
    )
    :vars
    (
      ?auto_176291 - BLOCK
      ?auto_176292 - BLOCK
      ?auto_176297 - BLOCK
      ?auto_176293 - BLOCK
      ?auto_176294 - BLOCK
      ?auto_176296 - BLOCK
      ?auto_176295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176291 ?auto_176290 ) ( ON-TABLE ?auto_176290 ) ( not ( = ?auto_176290 ?auto_176291 ) ) ( not ( = ?auto_176290 ?auto_176292 ) ) ( not ( = ?auto_176290 ?auto_176297 ) ) ( not ( = ?auto_176291 ?auto_176292 ) ) ( not ( = ?auto_176291 ?auto_176297 ) ) ( not ( = ?auto_176292 ?auto_176297 ) ) ( ON ?auto_176292 ?auto_176291 ) ( not ( = ?auto_176293 ?auto_176294 ) ) ( not ( = ?auto_176293 ?auto_176296 ) ) ( not ( = ?auto_176293 ?auto_176295 ) ) ( not ( = ?auto_176293 ?auto_176297 ) ) ( not ( = ?auto_176294 ?auto_176296 ) ) ( not ( = ?auto_176294 ?auto_176295 ) ) ( not ( = ?auto_176294 ?auto_176297 ) ) ( not ( = ?auto_176296 ?auto_176295 ) ) ( not ( = ?auto_176296 ?auto_176297 ) ) ( not ( = ?auto_176295 ?auto_176297 ) ) ( not ( = ?auto_176290 ?auto_176295 ) ) ( not ( = ?auto_176290 ?auto_176293 ) ) ( not ( = ?auto_176290 ?auto_176294 ) ) ( not ( = ?auto_176290 ?auto_176296 ) ) ( not ( = ?auto_176291 ?auto_176295 ) ) ( not ( = ?auto_176291 ?auto_176293 ) ) ( not ( = ?auto_176291 ?auto_176294 ) ) ( not ( = ?auto_176291 ?auto_176296 ) ) ( not ( = ?auto_176292 ?auto_176295 ) ) ( not ( = ?auto_176292 ?auto_176293 ) ) ( not ( = ?auto_176292 ?auto_176294 ) ) ( not ( = ?auto_176292 ?auto_176296 ) ) ( ON ?auto_176297 ?auto_176292 ) ( ON ?auto_176295 ?auto_176297 ) ( ON ?auto_176296 ?auto_176295 ) ( ON ?auto_176294 ?auto_176296 ) ( ON ?auto_176293 ?auto_176294 ) ( CLEAR ?auto_176293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176290 ?auto_176291 ?auto_176292 ?auto_176297 ?auto_176295 ?auto_176296 ?auto_176294 )
      ( MAKE-1PILE ?auto_176290 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174129 - BLOCK
    )
    :vars
    (
      ?auto_174134 - BLOCK
      ?auto_174135 - BLOCK
      ?auto_174130 - BLOCK
      ?auto_174137 - BLOCK
      ?auto_174132 - BLOCK
      ?auto_174133 - BLOCK
      ?auto_174136 - BLOCK
      ?auto_174131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174134 ?auto_174129 ) ( ON-TABLE ?auto_174129 ) ( not ( = ?auto_174129 ?auto_174134 ) ) ( not ( = ?auto_174129 ?auto_174135 ) ) ( not ( = ?auto_174129 ?auto_174130 ) ) ( not ( = ?auto_174134 ?auto_174135 ) ) ( not ( = ?auto_174134 ?auto_174130 ) ) ( not ( = ?auto_174135 ?auto_174130 ) ) ( ON ?auto_174135 ?auto_174134 ) ( not ( = ?auto_174137 ?auto_174132 ) ) ( not ( = ?auto_174137 ?auto_174133 ) ) ( not ( = ?auto_174137 ?auto_174136 ) ) ( not ( = ?auto_174137 ?auto_174131 ) ) ( not ( = ?auto_174137 ?auto_174130 ) ) ( not ( = ?auto_174132 ?auto_174133 ) ) ( not ( = ?auto_174132 ?auto_174136 ) ) ( not ( = ?auto_174132 ?auto_174131 ) ) ( not ( = ?auto_174132 ?auto_174130 ) ) ( not ( = ?auto_174133 ?auto_174136 ) ) ( not ( = ?auto_174133 ?auto_174131 ) ) ( not ( = ?auto_174133 ?auto_174130 ) ) ( not ( = ?auto_174136 ?auto_174131 ) ) ( not ( = ?auto_174136 ?auto_174130 ) ) ( not ( = ?auto_174131 ?auto_174130 ) ) ( not ( = ?auto_174129 ?auto_174131 ) ) ( not ( = ?auto_174129 ?auto_174137 ) ) ( not ( = ?auto_174129 ?auto_174132 ) ) ( not ( = ?auto_174129 ?auto_174133 ) ) ( not ( = ?auto_174129 ?auto_174136 ) ) ( not ( = ?auto_174134 ?auto_174131 ) ) ( not ( = ?auto_174134 ?auto_174137 ) ) ( not ( = ?auto_174134 ?auto_174132 ) ) ( not ( = ?auto_174134 ?auto_174133 ) ) ( not ( = ?auto_174134 ?auto_174136 ) ) ( not ( = ?auto_174135 ?auto_174131 ) ) ( not ( = ?auto_174135 ?auto_174137 ) ) ( not ( = ?auto_174135 ?auto_174132 ) ) ( not ( = ?auto_174135 ?auto_174133 ) ) ( not ( = ?auto_174135 ?auto_174136 ) ) ( ON ?auto_174130 ?auto_174135 ) ( ON ?auto_174131 ?auto_174130 ) ( ON ?auto_174136 ?auto_174131 ) ( ON ?auto_174133 ?auto_174136 ) ( ON ?auto_174132 ?auto_174133 ) ( CLEAR ?auto_174132 ) ( HOLDING ?auto_174137 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174137 )
      ( MAKE-1PILE ?auto_174129 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174138 - BLOCK
    )
    :vars
    (
      ?auto_174144 - BLOCK
      ?auto_174143 - BLOCK
      ?auto_174142 - BLOCK
      ?auto_174145 - BLOCK
      ?auto_174146 - BLOCK
      ?auto_174141 - BLOCK
      ?auto_174139 - BLOCK
      ?auto_174140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174144 ?auto_174138 ) ( ON-TABLE ?auto_174138 ) ( not ( = ?auto_174138 ?auto_174144 ) ) ( not ( = ?auto_174138 ?auto_174143 ) ) ( not ( = ?auto_174138 ?auto_174142 ) ) ( not ( = ?auto_174144 ?auto_174143 ) ) ( not ( = ?auto_174144 ?auto_174142 ) ) ( not ( = ?auto_174143 ?auto_174142 ) ) ( ON ?auto_174143 ?auto_174144 ) ( not ( = ?auto_174145 ?auto_174146 ) ) ( not ( = ?auto_174145 ?auto_174141 ) ) ( not ( = ?auto_174145 ?auto_174139 ) ) ( not ( = ?auto_174145 ?auto_174140 ) ) ( not ( = ?auto_174145 ?auto_174142 ) ) ( not ( = ?auto_174146 ?auto_174141 ) ) ( not ( = ?auto_174146 ?auto_174139 ) ) ( not ( = ?auto_174146 ?auto_174140 ) ) ( not ( = ?auto_174146 ?auto_174142 ) ) ( not ( = ?auto_174141 ?auto_174139 ) ) ( not ( = ?auto_174141 ?auto_174140 ) ) ( not ( = ?auto_174141 ?auto_174142 ) ) ( not ( = ?auto_174139 ?auto_174140 ) ) ( not ( = ?auto_174139 ?auto_174142 ) ) ( not ( = ?auto_174140 ?auto_174142 ) ) ( not ( = ?auto_174138 ?auto_174140 ) ) ( not ( = ?auto_174138 ?auto_174145 ) ) ( not ( = ?auto_174138 ?auto_174146 ) ) ( not ( = ?auto_174138 ?auto_174141 ) ) ( not ( = ?auto_174138 ?auto_174139 ) ) ( not ( = ?auto_174144 ?auto_174140 ) ) ( not ( = ?auto_174144 ?auto_174145 ) ) ( not ( = ?auto_174144 ?auto_174146 ) ) ( not ( = ?auto_174144 ?auto_174141 ) ) ( not ( = ?auto_174144 ?auto_174139 ) ) ( not ( = ?auto_174143 ?auto_174140 ) ) ( not ( = ?auto_174143 ?auto_174145 ) ) ( not ( = ?auto_174143 ?auto_174146 ) ) ( not ( = ?auto_174143 ?auto_174141 ) ) ( not ( = ?auto_174143 ?auto_174139 ) ) ( ON ?auto_174142 ?auto_174143 ) ( ON ?auto_174140 ?auto_174142 ) ( ON ?auto_174139 ?auto_174140 ) ( ON ?auto_174141 ?auto_174139 ) ( ON ?auto_174146 ?auto_174141 ) ( ON ?auto_174145 ?auto_174146 ) ( CLEAR ?auto_174145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174138 ?auto_174144 ?auto_174143 ?auto_174142 ?auto_174140 ?auto_174139 ?auto_174141 ?auto_174146 )
      ( MAKE-1PILE ?auto_174138 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174155 - BLOCK
      ?auto_174156 - BLOCK
      ?auto_174157 - BLOCK
      ?auto_174158 - BLOCK
      ?auto_174159 - BLOCK
      ?auto_174160 - BLOCK
      ?auto_174161 - BLOCK
      ?auto_174162 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_174162 ) ( CLEAR ?auto_174161 ) ( ON-TABLE ?auto_174155 ) ( ON ?auto_174156 ?auto_174155 ) ( ON ?auto_174157 ?auto_174156 ) ( ON ?auto_174158 ?auto_174157 ) ( ON ?auto_174159 ?auto_174158 ) ( ON ?auto_174160 ?auto_174159 ) ( ON ?auto_174161 ?auto_174160 ) ( not ( = ?auto_174155 ?auto_174156 ) ) ( not ( = ?auto_174155 ?auto_174157 ) ) ( not ( = ?auto_174155 ?auto_174158 ) ) ( not ( = ?auto_174155 ?auto_174159 ) ) ( not ( = ?auto_174155 ?auto_174160 ) ) ( not ( = ?auto_174155 ?auto_174161 ) ) ( not ( = ?auto_174155 ?auto_174162 ) ) ( not ( = ?auto_174156 ?auto_174157 ) ) ( not ( = ?auto_174156 ?auto_174158 ) ) ( not ( = ?auto_174156 ?auto_174159 ) ) ( not ( = ?auto_174156 ?auto_174160 ) ) ( not ( = ?auto_174156 ?auto_174161 ) ) ( not ( = ?auto_174156 ?auto_174162 ) ) ( not ( = ?auto_174157 ?auto_174158 ) ) ( not ( = ?auto_174157 ?auto_174159 ) ) ( not ( = ?auto_174157 ?auto_174160 ) ) ( not ( = ?auto_174157 ?auto_174161 ) ) ( not ( = ?auto_174157 ?auto_174162 ) ) ( not ( = ?auto_174158 ?auto_174159 ) ) ( not ( = ?auto_174158 ?auto_174160 ) ) ( not ( = ?auto_174158 ?auto_174161 ) ) ( not ( = ?auto_174158 ?auto_174162 ) ) ( not ( = ?auto_174159 ?auto_174160 ) ) ( not ( = ?auto_174159 ?auto_174161 ) ) ( not ( = ?auto_174159 ?auto_174162 ) ) ( not ( = ?auto_174160 ?auto_174161 ) ) ( not ( = ?auto_174160 ?auto_174162 ) ) ( not ( = ?auto_174161 ?auto_174162 ) ) )
    :subtasks
    ( ( !STACK ?auto_174162 ?auto_174161 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174163 - BLOCK
      ?auto_174164 - BLOCK
      ?auto_174165 - BLOCK
      ?auto_174166 - BLOCK
      ?auto_174167 - BLOCK
      ?auto_174168 - BLOCK
      ?auto_174169 - BLOCK
      ?auto_174170 - BLOCK
    )
    :vars
    (
      ?auto_174171 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_174169 ) ( ON-TABLE ?auto_174163 ) ( ON ?auto_174164 ?auto_174163 ) ( ON ?auto_174165 ?auto_174164 ) ( ON ?auto_174166 ?auto_174165 ) ( ON ?auto_174167 ?auto_174166 ) ( ON ?auto_174168 ?auto_174167 ) ( ON ?auto_174169 ?auto_174168 ) ( not ( = ?auto_174163 ?auto_174164 ) ) ( not ( = ?auto_174163 ?auto_174165 ) ) ( not ( = ?auto_174163 ?auto_174166 ) ) ( not ( = ?auto_174163 ?auto_174167 ) ) ( not ( = ?auto_174163 ?auto_174168 ) ) ( not ( = ?auto_174163 ?auto_174169 ) ) ( not ( = ?auto_174163 ?auto_174170 ) ) ( not ( = ?auto_174164 ?auto_174165 ) ) ( not ( = ?auto_174164 ?auto_174166 ) ) ( not ( = ?auto_174164 ?auto_174167 ) ) ( not ( = ?auto_174164 ?auto_174168 ) ) ( not ( = ?auto_174164 ?auto_174169 ) ) ( not ( = ?auto_174164 ?auto_174170 ) ) ( not ( = ?auto_174165 ?auto_174166 ) ) ( not ( = ?auto_174165 ?auto_174167 ) ) ( not ( = ?auto_174165 ?auto_174168 ) ) ( not ( = ?auto_174165 ?auto_174169 ) ) ( not ( = ?auto_174165 ?auto_174170 ) ) ( not ( = ?auto_174166 ?auto_174167 ) ) ( not ( = ?auto_174166 ?auto_174168 ) ) ( not ( = ?auto_174166 ?auto_174169 ) ) ( not ( = ?auto_174166 ?auto_174170 ) ) ( not ( = ?auto_174167 ?auto_174168 ) ) ( not ( = ?auto_174167 ?auto_174169 ) ) ( not ( = ?auto_174167 ?auto_174170 ) ) ( not ( = ?auto_174168 ?auto_174169 ) ) ( not ( = ?auto_174168 ?auto_174170 ) ) ( not ( = ?auto_174169 ?auto_174170 ) ) ( ON ?auto_174170 ?auto_174171 ) ( CLEAR ?auto_174170 ) ( HAND-EMPTY ) ( not ( = ?auto_174163 ?auto_174171 ) ) ( not ( = ?auto_174164 ?auto_174171 ) ) ( not ( = ?auto_174165 ?auto_174171 ) ) ( not ( = ?auto_174166 ?auto_174171 ) ) ( not ( = ?auto_174167 ?auto_174171 ) ) ( not ( = ?auto_174168 ?auto_174171 ) ) ( not ( = ?auto_174169 ?auto_174171 ) ) ( not ( = ?auto_174170 ?auto_174171 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_174170 ?auto_174171 )
      ( MAKE-8PILE ?auto_174163 ?auto_174164 ?auto_174165 ?auto_174166 ?auto_174167 ?auto_174168 ?auto_174169 ?auto_174170 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174172 - BLOCK
      ?auto_174173 - BLOCK
      ?auto_174174 - BLOCK
      ?auto_174175 - BLOCK
      ?auto_174176 - BLOCK
      ?auto_174177 - BLOCK
      ?auto_174178 - BLOCK
      ?auto_174179 - BLOCK
    )
    :vars
    (
      ?auto_174180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174172 ) ( ON ?auto_174173 ?auto_174172 ) ( ON ?auto_174174 ?auto_174173 ) ( ON ?auto_174175 ?auto_174174 ) ( ON ?auto_174176 ?auto_174175 ) ( ON ?auto_174177 ?auto_174176 ) ( not ( = ?auto_174172 ?auto_174173 ) ) ( not ( = ?auto_174172 ?auto_174174 ) ) ( not ( = ?auto_174172 ?auto_174175 ) ) ( not ( = ?auto_174172 ?auto_174176 ) ) ( not ( = ?auto_174172 ?auto_174177 ) ) ( not ( = ?auto_174172 ?auto_174178 ) ) ( not ( = ?auto_174172 ?auto_174179 ) ) ( not ( = ?auto_174173 ?auto_174174 ) ) ( not ( = ?auto_174173 ?auto_174175 ) ) ( not ( = ?auto_174173 ?auto_174176 ) ) ( not ( = ?auto_174173 ?auto_174177 ) ) ( not ( = ?auto_174173 ?auto_174178 ) ) ( not ( = ?auto_174173 ?auto_174179 ) ) ( not ( = ?auto_174174 ?auto_174175 ) ) ( not ( = ?auto_174174 ?auto_174176 ) ) ( not ( = ?auto_174174 ?auto_174177 ) ) ( not ( = ?auto_174174 ?auto_174178 ) ) ( not ( = ?auto_174174 ?auto_174179 ) ) ( not ( = ?auto_174175 ?auto_174176 ) ) ( not ( = ?auto_174175 ?auto_174177 ) ) ( not ( = ?auto_174175 ?auto_174178 ) ) ( not ( = ?auto_174175 ?auto_174179 ) ) ( not ( = ?auto_174176 ?auto_174177 ) ) ( not ( = ?auto_174176 ?auto_174178 ) ) ( not ( = ?auto_174176 ?auto_174179 ) ) ( not ( = ?auto_174177 ?auto_174178 ) ) ( not ( = ?auto_174177 ?auto_174179 ) ) ( not ( = ?auto_174178 ?auto_174179 ) ) ( ON ?auto_174179 ?auto_174180 ) ( CLEAR ?auto_174179 ) ( not ( = ?auto_174172 ?auto_174180 ) ) ( not ( = ?auto_174173 ?auto_174180 ) ) ( not ( = ?auto_174174 ?auto_174180 ) ) ( not ( = ?auto_174175 ?auto_174180 ) ) ( not ( = ?auto_174176 ?auto_174180 ) ) ( not ( = ?auto_174177 ?auto_174180 ) ) ( not ( = ?auto_174178 ?auto_174180 ) ) ( not ( = ?auto_174179 ?auto_174180 ) ) ( HOLDING ?auto_174178 ) ( CLEAR ?auto_174177 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174172 ?auto_174173 ?auto_174174 ?auto_174175 ?auto_174176 ?auto_174177 ?auto_174178 )
      ( MAKE-8PILE ?auto_174172 ?auto_174173 ?auto_174174 ?auto_174175 ?auto_174176 ?auto_174177 ?auto_174178 ?auto_174179 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174181 - BLOCK
      ?auto_174182 - BLOCK
      ?auto_174183 - BLOCK
      ?auto_174184 - BLOCK
      ?auto_174185 - BLOCK
      ?auto_174186 - BLOCK
      ?auto_174187 - BLOCK
      ?auto_174188 - BLOCK
    )
    :vars
    (
      ?auto_174189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174181 ) ( ON ?auto_174182 ?auto_174181 ) ( ON ?auto_174183 ?auto_174182 ) ( ON ?auto_174184 ?auto_174183 ) ( ON ?auto_174185 ?auto_174184 ) ( ON ?auto_174186 ?auto_174185 ) ( not ( = ?auto_174181 ?auto_174182 ) ) ( not ( = ?auto_174181 ?auto_174183 ) ) ( not ( = ?auto_174181 ?auto_174184 ) ) ( not ( = ?auto_174181 ?auto_174185 ) ) ( not ( = ?auto_174181 ?auto_174186 ) ) ( not ( = ?auto_174181 ?auto_174187 ) ) ( not ( = ?auto_174181 ?auto_174188 ) ) ( not ( = ?auto_174182 ?auto_174183 ) ) ( not ( = ?auto_174182 ?auto_174184 ) ) ( not ( = ?auto_174182 ?auto_174185 ) ) ( not ( = ?auto_174182 ?auto_174186 ) ) ( not ( = ?auto_174182 ?auto_174187 ) ) ( not ( = ?auto_174182 ?auto_174188 ) ) ( not ( = ?auto_174183 ?auto_174184 ) ) ( not ( = ?auto_174183 ?auto_174185 ) ) ( not ( = ?auto_174183 ?auto_174186 ) ) ( not ( = ?auto_174183 ?auto_174187 ) ) ( not ( = ?auto_174183 ?auto_174188 ) ) ( not ( = ?auto_174184 ?auto_174185 ) ) ( not ( = ?auto_174184 ?auto_174186 ) ) ( not ( = ?auto_174184 ?auto_174187 ) ) ( not ( = ?auto_174184 ?auto_174188 ) ) ( not ( = ?auto_174185 ?auto_174186 ) ) ( not ( = ?auto_174185 ?auto_174187 ) ) ( not ( = ?auto_174185 ?auto_174188 ) ) ( not ( = ?auto_174186 ?auto_174187 ) ) ( not ( = ?auto_174186 ?auto_174188 ) ) ( not ( = ?auto_174187 ?auto_174188 ) ) ( ON ?auto_174188 ?auto_174189 ) ( not ( = ?auto_174181 ?auto_174189 ) ) ( not ( = ?auto_174182 ?auto_174189 ) ) ( not ( = ?auto_174183 ?auto_174189 ) ) ( not ( = ?auto_174184 ?auto_174189 ) ) ( not ( = ?auto_174185 ?auto_174189 ) ) ( not ( = ?auto_174186 ?auto_174189 ) ) ( not ( = ?auto_174187 ?auto_174189 ) ) ( not ( = ?auto_174188 ?auto_174189 ) ) ( CLEAR ?auto_174186 ) ( ON ?auto_174187 ?auto_174188 ) ( CLEAR ?auto_174187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174189 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174189 ?auto_174188 )
      ( MAKE-8PILE ?auto_174181 ?auto_174182 ?auto_174183 ?auto_174184 ?auto_174185 ?auto_174186 ?auto_174187 ?auto_174188 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174190 - BLOCK
      ?auto_174191 - BLOCK
      ?auto_174192 - BLOCK
      ?auto_174193 - BLOCK
      ?auto_174194 - BLOCK
      ?auto_174195 - BLOCK
      ?auto_174196 - BLOCK
      ?auto_174197 - BLOCK
    )
    :vars
    (
      ?auto_174198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174190 ) ( ON ?auto_174191 ?auto_174190 ) ( ON ?auto_174192 ?auto_174191 ) ( ON ?auto_174193 ?auto_174192 ) ( ON ?auto_174194 ?auto_174193 ) ( not ( = ?auto_174190 ?auto_174191 ) ) ( not ( = ?auto_174190 ?auto_174192 ) ) ( not ( = ?auto_174190 ?auto_174193 ) ) ( not ( = ?auto_174190 ?auto_174194 ) ) ( not ( = ?auto_174190 ?auto_174195 ) ) ( not ( = ?auto_174190 ?auto_174196 ) ) ( not ( = ?auto_174190 ?auto_174197 ) ) ( not ( = ?auto_174191 ?auto_174192 ) ) ( not ( = ?auto_174191 ?auto_174193 ) ) ( not ( = ?auto_174191 ?auto_174194 ) ) ( not ( = ?auto_174191 ?auto_174195 ) ) ( not ( = ?auto_174191 ?auto_174196 ) ) ( not ( = ?auto_174191 ?auto_174197 ) ) ( not ( = ?auto_174192 ?auto_174193 ) ) ( not ( = ?auto_174192 ?auto_174194 ) ) ( not ( = ?auto_174192 ?auto_174195 ) ) ( not ( = ?auto_174192 ?auto_174196 ) ) ( not ( = ?auto_174192 ?auto_174197 ) ) ( not ( = ?auto_174193 ?auto_174194 ) ) ( not ( = ?auto_174193 ?auto_174195 ) ) ( not ( = ?auto_174193 ?auto_174196 ) ) ( not ( = ?auto_174193 ?auto_174197 ) ) ( not ( = ?auto_174194 ?auto_174195 ) ) ( not ( = ?auto_174194 ?auto_174196 ) ) ( not ( = ?auto_174194 ?auto_174197 ) ) ( not ( = ?auto_174195 ?auto_174196 ) ) ( not ( = ?auto_174195 ?auto_174197 ) ) ( not ( = ?auto_174196 ?auto_174197 ) ) ( ON ?auto_174197 ?auto_174198 ) ( not ( = ?auto_174190 ?auto_174198 ) ) ( not ( = ?auto_174191 ?auto_174198 ) ) ( not ( = ?auto_174192 ?auto_174198 ) ) ( not ( = ?auto_174193 ?auto_174198 ) ) ( not ( = ?auto_174194 ?auto_174198 ) ) ( not ( = ?auto_174195 ?auto_174198 ) ) ( not ( = ?auto_174196 ?auto_174198 ) ) ( not ( = ?auto_174197 ?auto_174198 ) ) ( ON ?auto_174196 ?auto_174197 ) ( CLEAR ?auto_174196 ) ( ON-TABLE ?auto_174198 ) ( HOLDING ?auto_174195 ) ( CLEAR ?auto_174194 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174190 ?auto_174191 ?auto_174192 ?auto_174193 ?auto_174194 ?auto_174195 )
      ( MAKE-8PILE ?auto_174190 ?auto_174191 ?auto_174192 ?auto_174193 ?auto_174194 ?auto_174195 ?auto_174196 ?auto_174197 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174199 - BLOCK
      ?auto_174200 - BLOCK
      ?auto_174201 - BLOCK
      ?auto_174202 - BLOCK
      ?auto_174203 - BLOCK
      ?auto_174204 - BLOCK
      ?auto_174205 - BLOCK
      ?auto_174206 - BLOCK
    )
    :vars
    (
      ?auto_174207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174199 ) ( ON ?auto_174200 ?auto_174199 ) ( ON ?auto_174201 ?auto_174200 ) ( ON ?auto_174202 ?auto_174201 ) ( ON ?auto_174203 ?auto_174202 ) ( not ( = ?auto_174199 ?auto_174200 ) ) ( not ( = ?auto_174199 ?auto_174201 ) ) ( not ( = ?auto_174199 ?auto_174202 ) ) ( not ( = ?auto_174199 ?auto_174203 ) ) ( not ( = ?auto_174199 ?auto_174204 ) ) ( not ( = ?auto_174199 ?auto_174205 ) ) ( not ( = ?auto_174199 ?auto_174206 ) ) ( not ( = ?auto_174200 ?auto_174201 ) ) ( not ( = ?auto_174200 ?auto_174202 ) ) ( not ( = ?auto_174200 ?auto_174203 ) ) ( not ( = ?auto_174200 ?auto_174204 ) ) ( not ( = ?auto_174200 ?auto_174205 ) ) ( not ( = ?auto_174200 ?auto_174206 ) ) ( not ( = ?auto_174201 ?auto_174202 ) ) ( not ( = ?auto_174201 ?auto_174203 ) ) ( not ( = ?auto_174201 ?auto_174204 ) ) ( not ( = ?auto_174201 ?auto_174205 ) ) ( not ( = ?auto_174201 ?auto_174206 ) ) ( not ( = ?auto_174202 ?auto_174203 ) ) ( not ( = ?auto_174202 ?auto_174204 ) ) ( not ( = ?auto_174202 ?auto_174205 ) ) ( not ( = ?auto_174202 ?auto_174206 ) ) ( not ( = ?auto_174203 ?auto_174204 ) ) ( not ( = ?auto_174203 ?auto_174205 ) ) ( not ( = ?auto_174203 ?auto_174206 ) ) ( not ( = ?auto_174204 ?auto_174205 ) ) ( not ( = ?auto_174204 ?auto_174206 ) ) ( not ( = ?auto_174205 ?auto_174206 ) ) ( ON ?auto_174206 ?auto_174207 ) ( not ( = ?auto_174199 ?auto_174207 ) ) ( not ( = ?auto_174200 ?auto_174207 ) ) ( not ( = ?auto_174201 ?auto_174207 ) ) ( not ( = ?auto_174202 ?auto_174207 ) ) ( not ( = ?auto_174203 ?auto_174207 ) ) ( not ( = ?auto_174204 ?auto_174207 ) ) ( not ( = ?auto_174205 ?auto_174207 ) ) ( not ( = ?auto_174206 ?auto_174207 ) ) ( ON ?auto_174205 ?auto_174206 ) ( ON-TABLE ?auto_174207 ) ( CLEAR ?auto_174203 ) ( ON ?auto_174204 ?auto_174205 ) ( CLEAR ?auto_174204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174207 ?auto_174206 ?auto_174205 )
      ( MAKE-8PILE ?auto_174199 ?auto_174200 ?auto_174201 ?auto_174202 ?auto_174203 ?auto_174204 ?auto_174205 ?auto_174206 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174208 - BLOCK
      ?auto_174209 - BLOCK
      ?auto_174210 - BLOCK
      ?auto_174211 - BLOCK
      ?auto_174212 - BLOCK
      ?auto_174213 - BLOCK
      ?auto_174214 - BLOCK
      ?auto_174215 - BLOCK
    )
    :vars
    (
      ?auto_174216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174208 ) ( ON ?auto_174209 ?auto_174208 ) ( ON ?auto_174210 ?auto_174209 ) ( ON ?auto_174211 ?auto_174210 ) ( not ( = ?auto_174208 ?auto_174209 ) ) ( not ( = ?auto_174208 ?auto_174210 ) ) ( not ( = ?auto_174208 ?auto_174211 ) ) ( not ( = ?auto_174208 ?auto_174212 ) ) ( not ( = ?auto_174208 ?auto_174213 ) ) ( not ( = ?auto_174208 ?auto_174214 ) ) ( not ( = ?auto_174208 ?auto_174215 ) ) ( not ( = ?auto_174209 ?auto_174210 ) ) ( not ( = ?auto_174209 ?auto_174211 ) ) ( not ( = ?auto_174209 ?auto_174212 ) ) ( not ( = ?auto_174209 ?auto_174213 ) ) ( not ( = ?auto_174209 ?auto_174214 ) ) ( not ( = ?auto_174209 ?auto_174215 ) ) ( not ( = ?auto_174210 ?auto_174211 ) ) ( not ( = ?auto_174210 ?auto_174212 ) ) ( not ( = ?auto_174210 ?auto_174213 ) ) ( not ( = ?auto_174210 ?auto_174214 ) ) ( not ( = ?auto_174210 ?auto_174215 ) ) ( not ( = ?auto_174211 ?auto_174212 ) ) ( not ( = ?auto_174211 ?auto_174213 ) ) ( not ( = ?auto_174211 ?auto_174214 ) ) ( not ( = ?auto_174211 ?auto_174215 ) ) ( not ( = ?auto_174212 ?auto_174213 ) ) ( not ( = ?auto_174212 ?auto_174214 ) ) ( not ( = ?auto_174212 ?auto_174215 ) ) ( not ( = ?auto_174213 ?auto_174214 ) ) ( not ( = ?auto_174213 ?auto_174215 ) ) ( not ( = ?auto_174214 ?auto_174215 ) ) ( ON ?auto_174215 ?auto_174216 ) ( not ( = ?auto_174208 ?auto_174216 ) ) ( not ( = ?auto_174209 ?auto_174216 ) ) ( not ( = ?auto_174210 ?auto_174216 ) ) ( not ( = ?auto_174211 ?auto_174216 ) ) ( not ( = ?auto_174212 ?auto_174216 ) ) ( not ( = ?auto_174213 ?auto_174216 ) ) ( not ( = ?auto_174214 ?auto_174216 ) ) ( not ( = ?auto_174215 ?auto_174216 ) ) ( ON ?auto_174214 ?auto_174215 ) ( ON-TABLE ?auto_174216 ) ( ON ?auto_174213 ?auto_174214 ) ( CLEAR ?auto_174213 ) ( HOLDING ?auto_174212 ) ( CLEAR ?auto_174211 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174208 ?auto_174209 ?auto_174210 ?auto_174211 ?auto_174212 )
      ( MAKE-8PILE ?auto_174208 ?auto_174209 ?auto_174210 ?auto_174211 ?auto_174212 ?auto_174213 ?auto_174214 ?auto_174215 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174217 - BLOCK
      ?auto_174218 - BLOCK
      ?auto_174219 - BLOCK
      ?auto_174220 - BLOCK
      ?auto_174221 - BLOCK
      ?auto_174222 - BLOCK
      ?auto_174223 - BLOCK
      ?auto_174224 - BLOCK
    )
    :vars
    (
      ?auto_174225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174217 ) ( ON ?auto_174218 ?auto_174217 ) ( ON ?auto_174219 ?auto_174218 ) ( ON ?auto_174220 ?auto_174219 ) ( not ( = ?auto_174217 ?auto_174218 ) ) ( not ( = ?auto_174217 ?auto_174219 ) ) ( not ( = ?auto_174217 ?auto_174220 ) ) ( not ( = ?auto_174217 ?auto_174221 ) ) ( not ( = ?auto_174217 ?auto_174222 ) ) ( not ( = ?auto_174217 ?auto_174223 ) ) ( not ( = ?auto_174217 ?auto_174224 ) ) ( not ( = ?auto_174218 ?auto_174219 ) ) ( not ( = ?auto_174218 ?auto_174220 ) ) ( not ( = ?auto_174218 ?auto_174221 ) ) ( not ( = ?auto_174218 ?auto_174222 ) ) ( not ( = ?auto_174218 ?auto_174223 ) ) ( not ( = ?auto_174218 ?auto_174224 ) ) ( not ( = ?auto_174219 ?auto_174220 ) ) ( not ( = ?auto_174219 ?auto_174221 ) ) ( not ( = ?auto_174219 ?auto_174222 ) ) ( not ( = ?auto_174219 ?auto_174223 ) ) ( not ( = ?auto_174219 ?auto_174224 ) ) ( not ( = ?auto_174220 ?auto_174221 ) ) ( not ( = ?auto_174220 ?auto_174222 ) ) ( not ( = ?auto_174220 ?auto_174223 ) ) ( not ( = ?auto_174220 ?auto_174224 ) ) ( not ( = ?auto_174221 ?auto_174222 ) ) ( not ( = ?auto_174221 ?auto_174223 ) ) ( not ( = ?auto_174221 ?auto_174224 ) ) ( not ( = ?auto_174222 ?auto_174223 ) ) ( not ( = ?auto_174222 ?auto_174224 ) ) ( not ( = ?auto_174223 ?auto_174224 ) ) ( ON ?auto_174224 ?auto_174225 ) ( not ( = ?auto_174217 ?auto_174225 ) ) ( not ( = ?auto_174218 ?auto_174225 ) ) ( not ( = ?auto_174219 ?auto_174225 ) ) ( not ( = ?auto_174220 ?auto_174225 ) ) ( not ( = ?auto_174221 ?auto_174225 ) ) ( not ( = ?auto_174222 ?auto_174225 ) ) ( not ( = ?auto_174223 ?auto_174225 ) ) ( not ( = ?auto_174224 ?auto_174225 ) ) ( ON ?auto_174223 ?auto_174224 ) ( ON-TABLE ?auto_174225 ) ( ON ?auto_174222 ?auto_174223 ) ( CLEAR ?auto_174220 ) ( ON ?auto_174221 ?auto_174222 ) ( CLEAR ?auto_174221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174225 ?auto_174224 ?auto_174223 ?auto_174222 )
      ( MAKE-8PILE ?auto_174217 ?auto_174218 ?auto_174219 ?auto_174220 ?auto_174221 ?auto_174222 ?auto_174223 ?auto_174224 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174226 - BLOCK
      ?auto_174227 - BLOCK
      ?auto_174228 - BLOCK
      ?auto_174229 - BLOCK
      ?auto_174230 - BLOCK
      ?auto_174231 - BLOCK
      ?auto_174232 - BLOCK
      ?auto_174233 - BLOCK
    )
    :vars
    (
      ?auto_174234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174226 ) ( ON ?auto_174227 ?auto_174226 ) ( ON ?auto_174228 ?auto_174227 ) ( not ( = ?auto_174226 ?auto_174227 ) ) ( not ( = ?auto_174226 ?auto_174228 ) ) ( not ( = ?auto_174226 ?auto_174229 ) ) ( not ( = ?auto_174226 ?auto_174230 ) ) ( not ( = ?auto_174226 ?auto_174231 ) ) ( not ( = ?auto_174226 ?auto_174232 ) ) ( not ( = ?auto_174226 ?auto_174233 ) ) ( not ( = ?auto_174227 ?auto_174228 ) ) ( not ( = ?auto_174227 ?auto_174229 ) ) ( not ( = ?auto_174227 ?auto_174230 ) ) ( not ( = ?auto_174227 ?auto_174231 ) ) ( not ( = ?auto_174227 ?auto_174232 ) ) ( not ( = ?auto_174227 ?auto_174233 ) ) ( not ( = ?auto_174228 ?auto_174229 ) ) ( not ( = ?auto_174228 ?auto_174230 ) ) ( not ( = ?auto_174228 ?auto_174231 ) ) ( not ( = ?auto_174228 ?auto_174232 ) ) ( not ( = ?auto_174228 ?auto_174233 ) ) ( not ( = ?auto_174229 ?auto_174230 ) ) ( not ( = ?auto_174229 ?auto_174231 ) ) ( not ( = ?auto_174229 ?auto_174232 ) ) ( not ( = ?auto_174229 ?auto_174233 ) ) ( not ( = ?auto_174230 ?auto_174231 ) ) ( not ( = ?auto_174230 ?auto_174232 ) ) ( not ( = ?auto_174230 ?auto_174233 ) ) ( not ( = ?auto_174231 ?auto_174232 ) ) ( not ( = ?auto_174231 ?auto_174233 ) ) ( not ( = ?auto_174232 ?auto_174233 ) ) ( ON ?auto_174233 ?auto_174234 ) ( not ( = ?auto_174226 ?auto_174234 ) ) ( not ( = ?auto_174227 ?auto_174234 ) ) ( not ( = ?auto_174228 ?auto_174234 ) ) ( not ( = ?auto_174229 ?auto_174234 ) ) ( not ( = ?auto_174230 ?auto_174234 ) ) ( not ( = ?auto_174231 ?auto_174234 ) ) ( not ( = ?auto_174232 ?auto_174234 ) ) ( not ( = ?auto_174233 ?auto_174234 ) ) ( ON ?auto_174232 ?auto_174233 ) ( ON-TABLE ?auto_174234 ) ( ON ?auto_174231 ?auto_174232 ) ( ON ?auto_174230 ?auto_174231 ) ( CLEAR ?auto_174230 ) ( HOLDING ?auto_174229 ) ( CLEAR ?auto_174228 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174226 ?auto_174227 ?auto_174228 ?auto_174229 )
      ( MAKE-8PILE ?auto_174226 ?auto_174227 ?auto_174228 ?auto_174229 ?auto_174230 ?auto_174231 ?auto_174232 ?auto_174233 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174235 - BLOCK
      ?auto_174236 - BLOCK
      ?auto_174237 - BLOCK
      ?auto_174238 - BLOCK
      ?auto_174239 - BLOCK
      ?auto_174240 - BLOCK
      ?auto_174241 - BLOCK
      ?auto_174242 - BLOCK
    )
    :vars
    (
      ?auto_174243 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174235 ) ( ON ?auto_174236 ?auto_174235 ) ( ON ?auto_174237 ?auto_174236 ) ( not ( = ?auto_174235 ?auto_174236 ) ) ( not ( = ?auto_174235 ?auto_174237 ) ) ( not ( = ?auto_174235 ?auto_174238 ) ) ( not ( = ?auto_174235 ?auto_174239 ) ) ( not ( = ?auto_174235 ?auto_174240 ) ) ( not ( = ?auto_174235 ?auto_174241 ) ) ( not ( = ?auto_174235 ?auto_174242 ) ) ( not ( = ?auto_174236 ?auto_174237 ) ) ( not ( = ?auto_174236 ?auto_174238 ) ) ( not ( = ?auto_174236 ?auto_174239 ) ) ( not ( = ?auto_174236 ?auto_174240 ) ) ( not ( = ?auto_174236 ?auto_174241 ) ) ( not ( = ?auto_174236 ?auto_174242 ) ) ( not ( = ?auto_174237 ?auto_174238 ) ) ( not ( = ?auto_174237 ?auto_174239 ) ) ( not ( = ?auto_174237 ?auto_174240 ) ) ( not ( = ?auto_174237 ?auto_174241 ) ) ( not ( = ?auto_174237 ?auto_174242 ) ) ( not ( = ?auto_174238 ?auto_174239 ) ) ( not ( = ?auto_174238 ?auto_174240 ) ) ( not ( = ?auto_174238 ?auto_174241 ) ) ( not ( = ?auto_174238 ?auto_174242 ) ) ( not ( = ?auto_174239 ?auto_174240 ) ) ( not ( = ?auto_174239 ?auto_174241 ) ) ( not ( = ?auto_174239 ?auto_174242 ) ) ( not ( = ?auto_174240 ?auto_174241 ) ) ( not ( = ?auto_174240 ?auto_174242 ) ) ( not ( = ?auto_174241 ?auto_174242 ) ) ( ON ?auto_174242 ?auto_174243 ) ( not ( = ?auto_174235 ?auto_174243 ) ) ( not ( = ?auto_174236 ?auto_174243 ) ) ( not ( = ?auto_174237 ?auto_174243 ) ) ( not ( = ?auto_174238 ?auto_174243 ) ) ( not ( = ?auto_174239 ?auto_174243 ) ) ( not ( = ?auto_174240 ?auto_174243 ) ) ( not ( = ?auto_174241 ?auto_174243 ) ) ( not ( = ?auto_174242 ?auto_174243 ) ) ( ON ?auto_174241 ?auto_174242 ) ( ON-TABLE ?auto_174243 ) ( ON ?auto_174240 ?auto_174241 ) ( ON ?auto_174239 ?auto_174240 ) ( CLEAR ?auto_174237 ) ( ON ?auto_174238 ?auto_174239 ) ( CLEAR ?auto_174238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174243 ?auto_174242 ?auto_174241 ?auto_174240 ?auto_174239 )
      ( MAKE-8PILE ?auto_174235 ?auto_174236 ?auto_174237 ?auto_174238 ?auto_174239 ?auto_174240 ?auto_174241 ?auto_174242 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174244 - BLOCK
      ?auto_174245 - BLOCK
      ?auto_174246 - BLOCK
      ?auto_174247 - BLOCK
      ?auto_174248 - BLOCK
      ?auto_174249 - BLOCK
      ?auto_174250 - BLOCK
      ?auto_174251 - BLOCK
    )
    :vars
    (
      ?auto_174252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174244 ) ( ON ?auto_174245 ?auto_174244 ) ( not ( = ?auto_174244 ?auto_174245 ) ) ( not ( = ?auto_174244 ?auto_174246 ) ) ( not ( = ?auto_174244 ?auto_174247 ) ) ( not ( = ?auto_174244 ?auto_174248 ) ) ( not ( = ?auto_174244 ?auto_174249 ) ) ( not ( = ?auto_174244 ?auto_174250 ) ) ( not ( = ?auto_174244 ?auto_174251 ) ) ( not ( = ?auto_174245 ?auto_174246 ) ) ( not ( = ?auto_174245 ?auto_174247 ) ) ( not ( = ?auto_174245 ?auto_174248 ) ) ( not ( = ?auto_174245 ?auto_174249 ) ) ( not ( = ?auto_174245 ?auto_174250 ) ) ( not ( = ?auto_174245 ?auto_174251 ) ) ( not ( = ?auto_174246 ?auto_174247 ) ) ( not ( = ?auto_174246 ?auto_174248 ) ) ( not ( = ?auto_174246 ?auto_174249 ) ) ( not ( = ?auto_174246 ?auto_174250 ) ) ( not ( = ?auto_174246 ?auto_174251 ) ) ( not ( = ?auto_174247 ?auto_174248 ) ) ( not ( = ?auto_174247 ?auto_174249 ) ) ( not ( = ?auto_174247 ?auto_174250 ) ) ( not ( = ?auto_174247 ?auto_174251 ) ) ( not ( = ?auto_174248 ?auto_174249 ) ) ( not ( = ?auto_174248 ?auto_174250 ) ) ( not ( = ?auto_174248 ?auto_174251 ) ) ( not ( = ?auto_174249 ?auto_174250 ) ) ( not ( = ?auto_174249 ?auto_174251 ) ) ( not ( = ?auto_174250 ?auto_174251 ) ) ( ON ?auto_174251 ?auto_174252 ) ( not ( = ?auto_174244 ?auto_174252 ) ) ( not ( = ?auto_174245 ?auto_174252 ) ) ( not ( = ?auto_174246 ?auto_174252 ) ) ( not ( = ?auto_174247 ?auto_174252 ) ) ( not ( = ?auto_174248 ?auto_174252 ) ) ( not ( = ?auto_174249 ?auto_174252 ) ) ( not ( = ?auto_174250 ?auto_174252 ) ) ( not ( = ?auto_174251 ?auto_174252 ) ) ( ON ?auto_174250 ?auto_174251 ) ( ON-TABLE ?auto_174252 ) ( ON ?auto_174249 ?auto_174250 ) ( ON ?auto_174248 ?auto_174249 ) ( ON ?auto_174247 ?auto_174248 ) ( CLEAR ?auto_174247 ) ( HOLDING ?auto_174246 ) ( CLEAR ?auto_174245 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174244 ?auto_174245 ?auto_174246 )
      ( MAKE-8PILE ?auto_174244 ?auto_174245 ?auto_174246 ?auto_174247 ?auto_174248 ?auto_174249 ?auto_174250 ?auto_174251 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174253 - BLOCK
      ?auto_174254 - BLOCK
      ?auto_174255 - BLOCK
      ?auto_174256 - BLOCK
      ?auto_174257 - BLOCK
      ?auto_174258 - BLOCK
      ?auto_174259 - BLOCK
      ?auto_174260 - BLOCK
    )
    :vars
    (
      ?auto_174261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174253 ) ( ON ?auto_174254 ?auto_174253 ) ( not ( = ?auto_174253 ?auto_174254 ) ) ( not ( = ?auto_174253 ?auto_174255 ) ) ( not ( = ?auto_174253 ?auto_174256 ) ) ( not ( = ?auto_174253 ?auto_174257 ) ) ( not ( = ?auto_174253 ?auto_174258 ) ) ( not ( = ?auto_174253 ?auto_174259 ) ) ( not ( = ?auto_174253 ?auto_174260 ) ) ( not ( = ?auto_174254 ?auto_174255 ) ) ( not ( = ?auto_174254 ?auto_174256 ) ) ( not ( = ?auto_174254 ?auto_174257 ) ) ( not ( = ?auto_174254 ?auto_174258 ) ) ( not ( = ?auto_174254 ?auto_174259 ) ) ( not ( = ?auto_174254 ?auto_174260 ) ) ( not ( = ?auto_174255 ?auto_174256 ) ) ( not ( = ?auto_174255 ?auto_174257 ) ) ( not ( = ?auto_174255 ?auto_174258 ) ) ( not ( = ?auto_174255 ?auto_174259 ) ) ( not ( = ?auto_174255 ?auto_174260 ) ) ( not ( = ?auto_174256 ?auto_174257 ) ) ( not ( = ?auto_174256 ?auto_174258 ) ) ( not ( = ?auto_174256 ?auto_174259 ) ) ( not ( = ?auto_174256 ?auto_174260 ) ) ( not ( = ?auto_174257 ?auto_174258 ) ) ( not ( = ?auto_174257 ?auto_174259 ) ) ( not ( = ?auto_174257 ?auto_174260 ) ) ( not ( = ?auto_174258 ?auto_174259 ) ) ( not ( = ?auto_174258 ?auto_174260 ) ) ( not ( = ?auto_174259 ?auto_174260 ) ) ( ON ?auto_174260 ?auto_174261 ) ( not ( = ?auto_174253 ?auto_174261 ) ) ( not ( = ?auto_174254 ?auto_174261 ) ) ( not ( = ?auto_174255 ?auto_174261 ) ) ( not ( = ?auto_174256 ?auto_174261 ) ) ( not ( = ?auto_174257 ?auto_174261 ) ) ( not ( = ?auto_174258 ?auto_174261 ) ) ( not ( = ?auto_174259 ?auto_174261 ) ) ( not ( = ?auto_174260 ?auto_174261 ) ) ( ON ?auto_174259 ?auto_174260 ) ( ON-TABLE ?auto_174261 ) ( ON ?auto_174258 ?auto_174259 ) ( ON ?auto_174257 ?auto_174258 ) ( ON ?auto_174256 ?auto_174257 ) ( CLEAR ?auto_174254 ) ( ON ?auto_174255 ?auto_174256 ) ( CLEAR ?auto_174255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174261 ?auto_174260 ?auto_174259 ?auto_174258 ?auto_174257 ?auto_174256 )
      ( MAKE-8PILE ?auto_174253 ?auto_174254 ?auto_174255 ?auto_174256 ?auto_174257 ?auto_174258 ?auto_174259 ?auto_174260 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174262 - BLOCK
      ?auto_174263 - BLOCK
      ?auto_174264 - BLOCK
      ?auto_174265 - BLOCK
      ?auto_174266 - BLOCK
      ?auto_174267 - BLOCK
      ?auto_174268 - BLOCK
      ?auto_174269 - BLOCK
    )
    :vars
    (
      ?auto_174270 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174262 ) ( not ( = ?auto_174262 ?auto_174263 ) ) ( not ( = ?auto_174262 ?auto_174264 ) ) ( not ( = ?auto_174262 ?auto_174265 ) ) ( not ( = ?auto_174262 ?auto_174266 ) ) ( not ( = ?auto_174262 ?auto_174267 ) ) ( not ( = ?auto_174262 ?auto_174268 ) ) ( not ( = ?auto_174262 ?auto_174269 ) ) ( not ( = ?auto_174263 ?auto_174264 ) ) ( not ( = ?auto_174263 ?auto_174265 ) ) ( not ( = ?auto_174263 ?auto_174266 ) ) ( not ( = ?auto_174263 ?auto_174267 ) ) ( not ( = ?auto_174263 ?auto_174268 ) ) ( not ( = ?auto_174263 ?auto_174269 ) ) ( not ( = ?auto_174264 ?auto_174265 ) ) ( not ( = ?auto_174264 ?auto_174266 ) ) ( not ( = ?auto_174264 ?auto_174267 ) ) ( not ( = ?auto_174264 ?auto_174268 ) ) ( not ( = ?auto_174264 ?auto_174269 ) ) ( not ( = ?auto_174265 ?auto_174266 ) ) ( not ( = ?auto_174265 ?auto_174267 ) ) ( not ( = ?auto_174265 ?auto_174268 ) ) ( not ( = ?auto_174265 ?auto_174269 ) ) ( not ( = ?auto_174266 ?auto_174267 ) ) ( not ( = ?auto_174266 ?auto_174268 ) ) ( not ( = ?auto_174266 ?auto_174269 ) ) ( not ( = ?auto_174267 ?auto_174268 ) ) ( not ( = ?auto_174267 ?auto_174269 ) ) ( not ( = ?auto_174268 ?auto_174269 ) ) ( ON ?auto_174269 ?auto_174270 ) ( not ( = ?auto_174262 ?auto_174270 ) ) ( not ( = ?auto_174263 ?auto_174270 ) ) ( not ( = ?auto_174264 ?auto_174270 ) ) ( not ( = ?auto_174265 ?auto_174270 ) ) ( not ( = ?auto_174266 ?auto_174270 ) ) ( not ( = ?auto_174267 ?auto_174270 ) ) ( not ( = ?auto_174268 ?auto_174270 ) ) ( not ( = ?auto_174269 ?auto_174270 ) ) ( ON ?auto_174268 ?auto_174269 ) ( ON-TABLE ?auto_174270 ) ( ON ?auto_174267 ?auto_174268 ) ( ON ?auto_174266 ?auto_174267 ) ( ON ?auto_174265 ?auto_174266 ) ( ON ?auto_174264 ?auto_174265 ) ( CLEAR ?auto_174264 ) ( HOLDING ?auto_174263 ) ( CLEAR ?auto_174262 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174262 ?auto_174263 )
      ( MAKE-8PILE ?auto_174262 ?auto_174263 ?auto_174264 ?auto_174265 ?auto_174266 ?auto_174267 ?auto_174268 ?auto_174269 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174271 - BLOCK
      ?auto_174272 - BLOCK
      ?auto_174273 - BLOCK
      ?auto_174274 - BLOCK
      ?auto_174275 - BLOCK
      ?auto_174276 - BLOCK
      ?auto_174277 - BLOCK
      ?auto_174278 - BLOCK
    )
    :vars
    (
      ?auto_174279 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174271 ) ( not ( = ?auto_174271 ?auto_174272 ) ) ( not ( = ?auto_174271 ?auto_174273 ) ) ( not ( = ?auto_174271 ?auto_174274 ) ) ( not ( = ?auto_174271 ?auto_174275 ) ) ( not ( = ?auto_174271 ?auto_174276 ) ) ( not ( = ?auto_174271 ?auto_174277 ) ) ( not ( = ?auto_174271 ?auto_174278 ) ) ( not ( = ?auto_174272 ?auto_174273 ) ) ( not ( = ?auto_174272 ?auto_174274 ) ) ( not ( = ?auto_174272 ?auto_174275 ) ) ( not ( = ?auto_174272 ?auto_174276 ) ) ( not ( = ?auto_174272 ?auto_174277 ) ) ( not ( = ?auto_174272 ?auto_174278 ) ) ( not ( = ?auto_174273 ?auto_174274 ) ) ( not ( = ?auto_174273 ?auto_174275 ) ) ( not ( = ?auto_174273 ?auto_174276 ) ) ( not ( = ?auto_174273 ?auto_174277 ) ) ( not ( = ?auto_174273 ?auto_174278 ) ) ( not ( = ?auto_174274 ?auto_174275 ) ) ( not ( = ?auto_174274 ?auto_174276 ) ) ( not ( = ?auto_174274 ?auto_174277 ) ) ( not ( = ?auto_174274 ?auto_174278 ) ) ( not ( = ?auto_174275 ?auto_174276 ) ) ( not ( = ?auto_174275 ?auto_174277 ) ) ( not ( = ?auto_174275 ?auto_174278 ) ) ( not ( = ?auto_174276 ?auto_174277 ) ) ( not ( = ?auto_174276 ?auto_174278 ) ) ( not ( = ?auto_174277 ?auto_174278 ) ) ( ON ?auto_174278 ?auto_174279 ) ( not ( = ?auto_174271 ?auto_174279 ) ) ( not ( = ?auto_174272 ?auto_174279 ) ) ( not ( = ?auto_174273 ?auto_174279 ) ) ( not ( = ?auto_174274 ?auto_174279 ) ) ( not ( = ?auto_174275 ?auto_174279 ) ) ( not ( = ?auto_174276 ?auto_174279 ) ) ( not ( = ?auto_174277 ?auto_174279 ) ) ( not ( = ?auto_174278 ?auto_174279 ) ) ( ON ?auto_174277 ?auto_174278 ) ( ON-TABLE ?auto_174279 ) ( ON ?auto_174276 ?auto_174277 ) ( ON ?auto_174275 ?auto_174276 ) ( ON ?auto_174274 ?auto_174275 ) ( ON ?auto_174273 ?auto_174274 ) ( CLEAR ?auto_174271 ) ( ON ?auto_174272 ?auto_174273 ) ( CLEAR ?auto_174272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174279 ?auto_174278 ?auto_174277 ?auto_174276 ?auto_174275 ?auto_174274 ?auto_174273 )
      ( MAKE-8PILE ?auto_174271 ?auto_174272 ?auto_174273 ?auto_174274 ?auto_174275 ?auto_174276 ?auto_174277 ?auto_174278 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174280 - BLOCK
      ?auto_174281 - BLOCK
      ?auto_174282 - BLOCK
      ?auto_174283 - BLOCK
      ?auto_174284 - BLOCK
      ?auto_174285 - BLOCK
      ?auto_174286 - BLOCK
      ?auto_174287 - BLOCK
    )
    :vars
    (
      ?auto_174288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174280 ?auto_174281 ) ) ( not ( = ?auto_174280 ?auto_174282 ) ) ( not ( = ?auto_174280 ?auto_174283 ) ) ( not ( = ?auto_174280 ?auto_174284 ) ) ( not ( = ?auto_174280 ?auto_174285 ) ) ( not ( = ?auto_174280 ?auto_174286 ) ) ( not ( = ?auto_174280 ?auto_174287 ) ) ( not ( = ?auto_174281 ?auto_174282 ) ) ( not ( = ?auto_174281 ?auto_174283 ) ) ( not ( = ?auto_174281 ?auto_174284 ) ) ( not ( = ?auto_174281 ?auto_174285 ) ) ( not ( = ?auto_174281 ?auto_174286 ) ) ( not ( = ?auto_174281 ?auto_174287 ) ) ( not ( = ?auto_174282 ?auto_174283 ) ) ( not ( = ?auto_174282 ?auto_174284 ) ) ( not ( = ?auto_174282 ?auto_174285 ) ) ( not ( = ?auto_174282 ?auto_174286 ) ) ( not ( = ?auto_174282 ?auto_174287 ) ) ( not ( = ?auto_174283 ?auto_174284 ) ) ( not ( = ?auto_174283 ?auto_174285 ) ) ( not ( = ?auto_174283 ?auto_174286 ) ) ( not ( = ?auto_174283 ?auto_174287 ) ) ( not ( = ?auto_174284 ?auto_174285 ) ) ( not ( = ?auto_174284 ?auto_174286 ) ) ( not ( = ?auto_174284 ?auto_174287 ) ) ( not ( = ?auto_174285 ?auto_174286 ) ) ( not ( = ?auto_174285 ?auto_174287 ) ) ( not ( = ?auto_174286 ?auto_174287 ) ) ( ON ?auto_174287 ?auto_174288 ) ( not ( = ?auto_174280 ?auto_174288 ) ) ( not ( = ?auto_174281 ?auto_174288 ) ) ( not ( = ?auto_174282 ?auto_174288 ) ) ( not ( = ?auto_174283 ?auto_174288 ) ) ( not ( = ?auto_174284 ?auto_174288 ) ) ( not ( = ?auto_174285 ?auto_174288 ) ) ( not ( = ?auto_174286 ?auto_174288 ) ) ( not ( = ?auto_174287 ?auto_174288 ) ) ( ON ?auto_174286 ?auto_174287 ) ( ON-TABLE ?auto_174288 ) ( ON ?auto_174285 ?auto_174286 ) ( ON ?auto_174284 ?auto_174285 ) ( ON ?auto_174283 ?auto_174284 ) ( ON ?auto_174282 ?auto_174283 ) ( ON ?auto_174281 ?auto_174282 ) ( CLEAR ?auto_174281 ) ( HOLDING ?auto_174280 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174280 )
      ( MAKE-8PILE ?auto_174280 ?auto_174281 ?auto_174282 ?auto_174283 ?auto_174284 ?auto_174285 ?auto_174286 ?auto_174287 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174289 - BLOCK
      ?auto_174290 - BLOCK
      ?auto_174291 - BLOCK
      ?auto_174292 - BLOCK
      ?auto_174293 - BLOCK
      ?auto_174294 - BLOCK
      ?auto_174295 - BLOCK
      ?auto_174296 - BLOCK
    )
    :vars
    (
      ?auto_174297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174289 ?auto_174290 ) ) ( not ( = ?auto_174289 ?auto_174291 ) ) ( not ( = ?auto_174289 ?auto_174292 ) ) ( not ( = ?auto_174289 ?auto_174293 ) ) ( not ( = ?auto_174289 ?auto_174294 ) ) ( not ( = ?auto_174289 ?auto_174295 ) ) ( not ( = ?auto_174289 ?auto_174296 ) ) ( not ( = ?auto_174290 ?auto_174291 ) ) ( not ( = ?auto_174290 ?auto_174292 ) ) ( not ( = ?auto_174290 ?auto_174293 ) ) ( not ( = ?auto_174290 ?auto_174294 ) ) ( not ( = ?auto_174290 ?auto_174295 ) ) ( not ( = ?auto_174290 ?auto_174296 ) ) ( not ( = ?auto_174291 ?auto_174292 ) ) ( not ( = ?auto_174291 ?auto_174293 ) ) ( not ( = ?auto_174291 ?auto_174294 ) ) ( not ( = ?auto_174291 ?auto_174295 ) ) ( not ( = ?auto_174291 ?auto_174296 ) ) ( not ( = ?auto_174292 ?auto_174293 ) ) ( not ( = ?auto_174292 ?auto_174294 ) ) ( not ( = ?auto_174292 ?auto_174295 ) ) ( not ( = ?auto_174292 ?auto_174296 ) ) ( not ( = ?auto_174293 ?auto_174294 ) ) ( not ( = ?auto_174293 ?auto_174295 ) ) ( not ( = ?auto_174293 ?auto_174296 ) ) ( not ( = ?auto_174294 ?auto_174295 ) ) ( not ( = ?auto_174294 ?auto_174296 ) ) ( not ( = ?auto_174295 ?auto_174296 ) ) ( ON ?auto_174296 ?auto_174297 ) ( not ( = ?auto_174289 ?auto_174297 ) ) ( not ( = ?auto_174290 ?auto_174297 ) ) ( not ( = ?auto_174291 ?auto_174297 ) ) ( not ( = ?auto_174292 ?auto_174297 ) ) ( not ( = ?auto_174293 ?auto_174297 ) ) ( not ( = ?auto_174294 ?auto_174297 ) ) ( not ( = ?auto_174295 ?auto_174297 ) ) ( not ( = ?auto_174296 ?auto_174297 ) ) ( ON ?auto_174295 ?auto_174296 ) ( ON-TABLE ?auto_174297 ) ( ON ?auto_174294 ?auto_174295 ) ( ON ?auto_174293 ?auto_174294 ) ( ON ?auto_174292 ?auto_174293 ) ( ON ?auto_174291 ?auto_174292 ) ( ON ?auto_174290 ?auto_174291 ) ( ON ?auto_174289 ?auto_174290 ) ( CLEAR ?auto_174289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174297 ?auto_174296 ?auto_174295 ?auto_174294 ?auto_174293 ?auto_174292 ?auto_174291 ?auto_174290 )
      ( MAKE-8PILE ?auto_174289 ?auto_174290 ?auto_174291 ?auto_174292 ?auto_174293 ?auto_174294 ?auto_174295 ?auto_174296 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174434 - BLOCK
    )
    :vars
    (
      ?auto_174435 - BLOCK
      ?auto_174436 - BLOCK
      ?auto_174437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174434 ?auto_174435 ) ( CLEAR ?auto_174434 ) ( not ( = ?auto_174434 ?auto_174435 ) ) ( HOLDING ?auto_174436 ) ( CLEAR ?auto_174437 ) ( not ( = ?auto_174434 ?auto_174436 ) ) ( not ( = ?auto_174434 ?auto_174437 ) ) ( not ( = ?auto_174435 ?auto_174436 ) ) ( not ( = ?auto_174435 ?auto_174437 ) ) ( not ( = ?auto_174436 ?auto_174437 ) ) )
    :subtasks
    ( ( !STACK ?auto_174436 ?auto_174437 )
      ( MAKE-1PILE ?auto_174434 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174438 - BLOCK
    )
    :vars
    (
      ?auto_174440 - BLOCK
      ?auto_174441 - BLOCK
      ?auto_174439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174438 ?auto_174440 ) ( not ( = ?auto_174438 ?auto_174440 ) ) ( CLEAR ?auto_174441 ) ( not ( = ?auto_174438 ?auto_174439 ) ) ( not ( = ?auto_174438 ?auto_174441 ) ) ( not ( = ?auto_174440 ?auto_174439 ) ) ( not ( = ?auto_174440 ?auto_174441 ) ) ( not ( = ?auto_174439 ?auto_174441 ) ) ( ON ?auto_174439 ?auto_174438 ) ( CLEAR ?auto_174439 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174440 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174440 ?auto_174438 )
      ( MAKE-1PILE ?auto_174438 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174442 - BLOCK
    )
    :vars
    (
      ?auto_174445 - BLOCK
      ?auto_174443 - BLOCK
      ?auto_174444 - BLOCK
      ?auto_174448 - BLOCK
      ?auto_174447 - BLOCK
      ?auto_174450 - BLOCK
      ?auto_174446 - BLOCK
      ?auto_174449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174442 ?auto_174445 ) ( not ( = ?auto_174442 ?auto_174445 ) ) ( not ( = ?auto_174442 ?auto_174443 ) ) ( not ( = ?auto_174442 ?auto_174444 ) ) ( not ( = ?auto_174445 ?auto_174443 ) ) ( not ( = ?auto_174445 ?auto_174444 ) ) ( not ( = ?auto_174443 ?auto_174444 ) ) ( ON ?auto_174443 ?auto_174442 ) ( CLEAR ?auto_174443 ) ( ON-TABLE ?auto_174445 ) ( HOLDING ?auto_174444 ) ( CLEAR ?auto_174448 ) ( ON-TABLE ?auto_174447 ) ( ON ?auto_174450 ?auto_174447 ) ( ON ?auto_174446 ?auto_174450 ) ( ON ?auto_174449 ?auto_174446 ) ( ON ?auto_174448 ?auto_174449 ) ( not ( = ?auto_174447 ?auto_174450 ) ) ( not ( = ?auto_174447 ?auto_174446 ) ) ( not ( = ?auto_174447 ?auto_174449 ) ) ( not ( = ?auto_174447 ?auto_174448 ) ) ( not ( = ?auto_174447 ?auto_174444 ) ) ( not ( = ?auto_174450 ?auto_174446 ) ) ( not ( = ?auto_174450 ?auto_174449 ) ) ( not ( = ?auto_174450 ?auto_174448 ) ) ( not ( = ?auto_174450 ?auto_174444 ) ) ( not ( = ?auto_174446 ?auto_174449 ) ) ( not ( = ?auto_174446 ?auto_174448 ) ) ( not ( = ?auto_174446 ?auto_174444 ) ) ( not ( = ?auto_174449 ?auto_174448 ) ) ( not ( = ?auto_174449 ?auto_174444 ) ) ( not ( = ?auto_174448 ?auto_174444 ) ) ( not ( = ?auto_174442 ?auto_174448 ) ) ( not ( = ?auto_174442 ?auto_174447 ) ) ( not ( = ?auto_174442 ?auto_174450 ) ) ( not ( = ?auto_174442 ?auto_174446 ) ) ( not ( = ?auto_174442 ?auto_174449 ) ) ( not ( = ?auto_174445 ?auto_174448 ) ) ( not ( = ?auto_174445 ?auto_174447 ) ) ( not ( = ?auto_174445 ?auto_174450 ) ) ( not ( = ?auto_174445 ?auto_174446 ) ) ( not ( = ?auto_174445 ?auto_174449 ) ) ( not ( = ?auto_174443 ?auto_174448 ) ) ( not ( = ?auto_174443 ?auto_174447 ) ) ( not ( = ?auto_174443 ?auto_174450 ) ) ( not ( = ?auto_174443 ?auto_174446 ) ) ( not ( = ?auto_174443 ?auto_174449 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174447 ?auto_174450 ?auto_174446 ?auto_174449 ?auto_174448 ?auto_174444 )
      ( MAKE-1PILE ?auto_174442 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174451 - BLOCK
    )
    :vars
    (
      ?auto_174452 - BLOCK
      ?auto_174458 - BLOCK
      ?auto_174457 - BLOCK
      ?auto_174459 - BLOCK
      ?auto_174453 - BLOCK
      ?auto_174455 - BLOCK
      ?auto_174454 - BLOCK
      ?auto_174456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174451 ?auto_174452 ) ( not ( = ?auto_174451 ?auto_174452 ) ) ( not ( = ?auto_174451 ?auto_174458 ) ) ( not ( = ?auto_174451 ?auto_174457 ) ) ( not ( = ?auto_174452 ?auto_174458 ) ) ( not ( = ?auto_174452 ?auto_174457 ) ) ( not ( = ?auto_174458 ?auto_174457 ) ) ( ON ?auto_174458 ?auto_174451 ) ( ON-TABLE ?auto_174452 ) ( CLEAR ?auto_174459 ) ( ON-TABLE ?auto_174453 ) ( ON ?auto_174455 ?auto_174453 ) ( ON ?auto_174454 ?auto_174455 ) ( ON ?auto_174456 ?auto_174454 ) ( ON ?auto_174459 ?auto_174456 ) ( not ( = ?auto_174453 ?auto_174455 ) ) ( not ( = ?auto_174453 ?auto_174454 ) ) ( not ( = ?auto_174453 ?auto_174456 ) ) ( not ( = ?auto_174453 ?auto_174459 ) ) ( not ( = ?auto_174453 ?auto_174457 ) ) ( not ( = ?auto_174455 ?auto_174454 ) ) ( not ( = ?auto_174455 ?auto_174456 ) ) ( not ( = ?auto_174455 ?auto_174459 ) ) ( not ( = ?auto_174455 ?auto_174457 ) ) ( not ( = ?auto_174454 ?auto_174456 ) ) ( not ( = ?auto_174454 ?auto_174459 ) ) ( not ( = ?auto_174454 ?auto_174457 ) ) ( not ( = ?auto_174456 ?auto_174459 ) ) ( not ( = ?auto_174456 ?auto_174457 ) ) ( not ( = ?auto_174459 ?auto_174457 ) ) ( not ( = ?auto_174451 ?auto_174459 ) ) ( not ( = ?auto_174451 ?auto_174453 ) ) ( not ( = ?auto_174451 ?auto_174455 ) ) ( not ( = ?auto_174451 ?auto_174454 ) ) ( not ( = ?auto_174451 ?auto_174456 ) ) ( not ( = ?auto_174452 ?auto_174459 ) ) ( not ( = ?auto_174452 ?auto_174453 ) ) ( not ( = ?auto_174452 ?auto_174455 ) ) ( not ( = ?auto_174452 ?auto_174454 ) ) ( not ( = ?auto_174452 ?auto_174456 ) ) ( not ( = ?auto_174458 ?auto_174459 ) ) ( not ( = ?auto_174458 ?auto_174453 ) ) ( not ( = ?auto_174458 ?auto_174455 ) ) ( not ( = ?auto_174458 ?auto_174454 ) ) ( not ( = ?auto_174458 ?auto_174456 ) ) ( ON ?auto_174457 ?auto_174458 ) ( CLEAR ?auto_174457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174452 ?auto_174451 ?auto_174458 )
      ( MAKE-1PILE ?auto_174451 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174460 - BLOCK
    )
    :vars
    (
      ?auto_174463 - BLOCK
      ?auto_174467 - BLOCK
      ?auto_174466 - BLOCK
      ?auto_174468 - BLOCK
      ?auto_174461 - BLOCK
      ?auto_174465 - BLOCK
      ?auto_174462 - BLOCK
      ?auto_174464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174460 ?auto_174463 ) ( not ( = ?auto_174460 ?auto_174463 ) ) ( not ( = ?auto_174460 ?auto_174467 ) ) ( not ( = ?auto_174460 ?auto_174466 ) ) ( not ( = ?auto_174463 ?auto_174467 ) ) ( not ( = ?auto_174463 ?auto_174466 ) ) ( not ( = ?auto_174467 ?auto_174466 ) ) ( ON ?auto_174467 ?auto_174460 ) ( ON-TABLE ?auto_174463 ) ( ON-TABLE ?auto_174468 ) ( ON ?auto_174461 ?auto_174468 ) ( ON ?auto_174465 ?auto_174461 ) ( ON ?auto_174462 ?auto_174465 ) ( not ( = ?auto_174468 ?auto_174461 ) ) ( not ( = ?auto_174468 ?auto_174465 ) ) ( not ( = ?auto_174468 ?auto_174462 ) ) ( not ( = ?auto_174468 ?auto_174464 ) ) ( not ( = ?auto_174468 ?auto_174466 ) ) ( not ( = ?auto_174461 ?auto_174465 ) ) ( not ( = ?auto_174461 ?auto_174462 ) ) ( not ( = ?auto_174461 ?auto_174464 ) ) ( not ( = ?auto_174461 ?auto_174466 ) ) ( not ( = ?auto_174465 ?auto_174462 ) ) ( not ( = ?auto_174465 ?auto_174464 ) ) ( not ( = ?auto_174465 ?auto_174466 ) ) ( not ( = ?auto_174462 ?auto_174464 ) ) ( not ( = ?auto_174462 ?auto_174466 ) ) ( not ( = ?auto_174464 ?auto_174466 ) ) ( not ( = ?auto_174460 ?auto_174464 ) ) ( not ( = ?auto_174460 ?auto_174468 ) ) ( not ( = ?auto_174460 ?auto_174461 ) ) ( not ( = ?auto_174460 ?auto_174465 ) ) ( not ( = ?auto_174460 ?auto_174462 ) ) ( not ( = ?auto_174463 ?auto_174464 ) ) ( not ( = ?auto_174463 ?auto_174468 ) ) ( not ( = ?auto_174463 ?auto_174461 ) ) ( not ( = ?auto_174463 ?auto_174465 ) ) ( not ( = ?auto_174463 ?auto_174462 ) ) ( not ( = ?auto_174467 ?auto_174464 ) ) ( not ( = ?auto_174467 ?auto_174468 ) ) ( not ( = ?auto_174467 ?auto_174461 ) ) ( not ( = ?auto_174467 ?auto_174465 ) ) ( not ( = ?auto_174467 ?auto_174462 ) ) ( ON ?auto_174466 ?auto_174467 ) ( CLEAR ?auto_174466 ) ( HOLDING ?auto_174464 ) ( CLEAR ?auto_174462 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174468 ?auto_174461 ?auto_174465 ?auto_174462 ?auto_174464 )
      ( MAKE-1PILE ?auto_174460 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174469 - BLOCK
    )
    :vars
    (
      ?auto_174476 - BLOCK
      ?auto_174475 - BLOCK
      ?auto_174473 - BLOCK
      ?auto_174470 - BLOCK
      ?auto_174471 - BLOCK
      ?auto_174477 - BLOCK
      ?auto_174472 - BLOCK
      ?auto_174474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174469 ?auto_174476 ) ( not ( = ?auto_174469 ?auto_174476 ) ) ( not ( = ?auto_174469 ?auto_174475 ) ) ( not ( = ?auto_174469 ?auto_174473 ) ) ( not ( = ?auto_174476 ?auto_174475 ) ) ( not ( = ?auto_174476 ?auto_174473 ) ) ( not ( = ?auto_174475 ?auto_174473 ) ) ( ON ?auto_174475 ?auto_174469 ) ( ON-TABLE ?auto_174476 ) ( ON-TABLE ?auto_174470 ) ( ON ?auto_174471 ?auto_174470 ) ( ON ?auto_174477 ?auto_174471 ) ( ON ?auto_174472 ?auto_174477 ) ( not ( = ?auto_174470 ?auto_174471 ) ) ( not ( = ?auto_174470 ?auto_174477 ) ) ( not ( = ?auto_174470 ?auto_174472 ) ) ( not ( = ?auto_174470 ?auto_174474 ) ) ( not ( = ?auto_174470 ?auto_174473 ) ) ( not ( = ?auto_174471 ?auto_174477 ) ) ( not ( = ?auto_174471 ?auto_174472 ) ) ( not ( = ?auto_174471 ?auto_174474 ) ) ( not ( = ?auto_174471 ?auto_174473 ) ) ( not ( = ?auto_174477 ?auto_174472 ) ) ( not ( = ?auto_174477 ?auto_174474 ) ) ( not ( = ?auto_174477 ?auto_174473 ) ) ( not ( = ?auto_174472 ?auto_174474 ) ) ( not ( = ?auto_174472 ?auto_174473 ) ) ( not ( = ?auto_174474 ?auto_174473 ) ) ( not ( = ?auto_174469 ?auto_174474 ) ) ( not ( = ?auto_174469 ?auto_174470 ) ) ( not ( = ?auto_174469 ?auto_174471 ) ) ( not ( = ?auto_174469 ?auto_174477 ) ) ( not ( = ?auto_174469 ?auto_174472 ) ) ( not ( = ?auto_174476 ?auto_174474 ) ) ( not ( = ?auto_174476 ?auto_174470 ) ) ( not ( = ?auto_174476 ?auto_174471 ) ) ( not ( = ?auto_174476 ?auto_174477 ) ) ( not ( = ?auto_174476 ?auto_174472 ) ) ( not ( = ?auto_174475 ?auto_174474 ) ) ( not ( = ?auto_174475 ?auto_174470 ) ) ( not ( = ?auto_174475 ?auto_174471 ) ) ( not ( = ?auto_174475 ?auto_174477 ) ) ( not ( = ?auto_174475 ?auto_174472 ) ) ( ON ?auto_174473 ?auto_174475 ) ( CLEAR ?auto_174472 ) ( ON ?auto_174474 ?auto_174473 ) ( CLEAR ?auto_174474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174476 ?auto_174469 ?auto_174475 ?auto_174473 )
      ( MAKE-1PILE ?auto_174469 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174478 - BLOCK
    )
    :vars
    (
      ?auto_174480 - BLOCK
      ?auto_174485 - BLOCK
      ?auto_174481 - BLOCK
      ?auto_174484 - BLOCK
      ?auto_174486 - BLOCK
      ?auto_174483 - BLOCK
      ?auto_174479 - BLOCK
      ?auto_174482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174478 ?auto_174480 ) ( not ( = ?auto_174478 ?auto_174480 ) ) ( not ( = ?auto_174478 ?auto_174485 ) ) ( not ( = ?auto_174478 ?auto_174481 ) ) ( not ( = ?auto_174480 ?auto_174485 ) ) ( not ( = ?auto_174480 ?auto_174481 ) ) ( not ( = ?auto_174485 ?auto_174481 ) ) ( ON ?auto_174485 ?auto_174478 ) ( ON-TABLE ?auto_174480 ) ( ON-TABLE ?auto_174484 ) ( ON ?auto_174486 ?auto_174484 ) ( ON ?auto_174483 ?auto_174486 ) ( not ( = ?auto_174484 ?auto_174486 ) ) ( not ( = ?auto_174484 ?auto_174483 ) ) ( not ( = ?auto_174484 ?auto_174479 ) ) ( not ( = ?auto_174484 ?auto_174482 ) ) ( not ( = ?auto_174484 ?auto_174481 ) ) ( not ( = ?auto_174486 ?auto_174483 ) ) ( not ( = ?auto_174486 ?auto_174479 ) ) ( not ( = ?auto_174486 ?auto_174482 ) ) ( not ( = ?auto_174486 ?auto_174481 ) ) ( not ( = ?auto_174483 ?auto_174479 ) ) ( not ( = ?auto_174483 ?auto_174482 ) ) ( not ( = ?auto_174483 ?auto_174481 ) ) ( not ( = ?auto_174479 ?auto_174482 ) ) ( not ( = ?auto_174479 ?auto_174481 ) ) ( not ( = ?auto_174482 ?auto_174481 ) ) ( not ( = ?auto_174478 ?auto_174482 ) ) ( not ( = ?auto_174478 ?auto_174484 ) ) ( not ( = ?auto_174478 ?auto_174486 ) ) ( not ( = ?auto_174478 ?auto_174483 ) ) ( not ( = ?auto_174478 ?auto_174479 ) ) ( not ( = ?auto_174480 ?auto_174482 ) ) ( not ( = ?auto_174480 ?auto_174484 ) ) ( not ( = ?auto_174480 ?auto_174486 ) ) ( not ( = ?auto_174480 ?auto_174483 ) ) ( not ( = ?auto_174480 ?auto_174479 ) ) ( not ( = ?auto_174485 ?auto_174482 ) ) ( not ( = ?auto_174485 ?auto_174484 ) ) ( not ( = ?auto_174485 ?auto_174486 ) ) ( not ( = ?auto_174485 ?auto_174483 ) ) ( not ( = ?auto_174485 ?auto_174479 ) ) ( ON ?auto_174481 ?auto_174485 ) ( ON ?auto_174482 ?auto_174481 ) ( CLEAR ?auto_174482 ) ( HOLDING ?auto_174479 ) ( CLEAR ?auto_174483 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174484 ?auto_174486 ?auto_174483 ?auto_174479 )
      ( MAKE-1PILE ?auto_174478 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174487 - BLOCK
    )
    :vars
    (
      ?auto_174489 - BLOCK
      ?auto_174493 - BLOCK
      ?auto_174495 - BLOCK
      ?auto_174491 - BLOCK
      ?auto_174492 - BLOCK
      ?auto_174494 - BLOCK
      ?auto_174488 - BLOCK
      ?auto_174490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174487 ?auto_174489 ) ( not ( = ?auto_174487 ?auto_174489 ) ) ( not ( = ?auto_174487 ?auto_174493 ) ) ( not ( = ?auto_174487 ?auto_174495 ) ) ( not ( = ?auto_174489 ?auto_174493 ) ) ( not ( = ?auto_174489 ?auto_174495 ) ) ( not ( = ?auto_174493 ?auto_174495 ) ) ( ON ?auto_174493 ?auto_174487 ) ( ON-TABLE ?auto_174489 ) ( ON-TABLE ?auto_174491 ) ( ON ?auto_174492 ?auto_174491 ) ( ON ?auto_174494 ?auto_174492 ) ( not ( = ?auto_174491 ?auto_174492 ) ) ( not ( = ?auto_174491 ?auto_174494 ) ) ( not ( = ?auto_174491 ?auto_174488 ) ) ( not ( = ?auto_174491 ?auto_174490 ) ) ( not ( = ?auto_174491 ?auto_174495 ) ) ( not ( = ?auto_174492 ?auto_174494 ) ) ( not ( = ?auto_174492 ?auto_174488 ) ) ( not ( = ?auto_174492 ?auto_174490 ) ) ( not ( = ?auto_174492 ?auto_174495 ) ) ( not ( = ?auto_174494 ?auto_174488 ) ) ( not ( = ?auto_174494 ?auto_174490 ) ) ( not ( = ?auto_174494 ?auto_174495 ) ) ( not ( = ?auto_174488 ?auto_174490 ) ) ( not ( = ?auto_174488 ?auto_174495 ) ) ( not ( = ?auto_174490 ?auto_174495 ) ) ( not ( = ?auto_174487 ?auto_174490 ) ) ( not ( = ?auto_174487 ?auto_174491 ) ) ( not ( = ?auto_174487 ?auto_174492 ) ) ( not ( = ?auto_174487 ?auto_174494 ) ) ( not ( = ?auto_174487 ?auto_174488 ) ) ( not ( = ?auto_174489 ?auto_174490 ) ) ( not ( = ?auto_174489 ?auto_174491 ) ) ( not ( = ?auto_174489 ?auto_174492 ) ) ( not ( = ?auto_174489 ?auto_174494 ) ) ( not ( = ?auto_174489 ?auto_174488 ) ) ( not ( = ?auto_174493 ?auto_174490 ) ) ( not ( = ?auto_174493 ?auto_174491 ) ) ( not ( = ?auto_174493 ?auto_174492 ) ) ( not ( = ?auto_174493 ?auto_174494 ) ) ( not ( = ?auto_174493 ?auto_174488 ) ) ( ON ?auto_174495 ?auto_174493 ) ( ON ?auto_174490 ?auto_174495 ) ( CLEAR ?auto_174494 ) ( ON ?auto_174488 ?auto_174490 ) ( CLEAR ?auto_174488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174489 ?auto_174487 ?auto_174493 ?auto_174495 ?auto_174490 )
      ( MAKE-1PILE ?auto_174487 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174496 - BLOCK
    )
    :vars
    (
      ?auto_174500 - BLOCK
      ?auto_174501 - BLOCK
      ?auto_174502 - BLOCK
      ?auto_174498 - BLOCK
      ?auto_174499 - BLOCK
      ?auto_174497 - BLOCK
      ?auto_174503 - BLOCK
      ?auto_174504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174496 ?auto_174500 ) ( not ( = ?auto_174496 ?auto_174500 ) ) ( not ( = ?auto_174496 ?auto_174501 ) ) ( not ( = ?auto_174496 ?auto_174502 ) ) ( not ( = ?auto_174500 ?auto_174501 ) ) ( not ( = ?auto_174500 ?auto_174502 ) ) ( not ( = ?auto_174501 ?auto_174502 ) ) ( ON ?auto_174501 ?auto_174496 ) ( ON-TABLE ?auto_174500 ) ( ON-TABLE ?auto_174498 ) ( ON ?auto_174499 ?auto_174498 ) ( not ( = ?auto_174498 ?auto_174499 ) ) ( not ( = ?auto_174498 ?auto_174497 ) ) ( not ( = ?auto_174498 ?auto_174503 ) ) ( not ( = ?auto_174498 ?auto_174504 ) ) ( not ( = ?auto_174498 ?auto_174502 ) ) ( not ( = ?auto_174499 ?auto_174497 ) ) ( not ( = ?auto_174499 ?auto_174503 ) ) ( not ( = ?auto_174499 ?auto_174504 ) ) ( not ( = ?auto_174499 ?auto_174502 ) ) ( not ( = ?auto_174497 ?auto_174503 ) ) ( not ( = ?auto_174497 ?auto_174504 ) ) ( not ( = ?auto_174497 ?auto_174502 ) ) ( not ( = ?auto_174503 ?auto_174504 ) ) ( not ( = ?auto_174503 ?auto_174502 ) ) ( not ( = ?auto_174504 ?auto_174502 ) ) ( not ( = ?auto_174496 ?auto_174504 ) ) ( not ( = ?auto_174496 ?auto_174498 ) ) ( not ( = ?auto_174496 ?auto_174499 ) ) ( not ( = ?auto_174496 ?auto_174497 ) ) ( not ( = ?auto_174496 ?auto_174503 ) ) ( not ( = ?auto_174500 ?auto_174504 ) ) ( not ( = ?auto_174500 ?auto_174498 ) ) ( not ( = ?auto_174500 ?auto_174499 ) ) ( not ( = ?auto_174500 ?auto_174497 ) ) ( not ( = ?auto_174500 ?auto_174503 ) ) ( not ( = ?auto_174501 ?auto_174504 ) ) ( not ( = ?auto_174501 ?auto_174498 ) ) ( not ( = ?auto_174501 ?auto_174499 ) ) ( not ( = ?auto_174501 ?auto_174497 ) ) ( not ( = ?auto_174501 ?auto_174503 ) ) ( ON ?auto_174502 ?auto_174501 ) ( ON ?auto_174504 ?auto_174502 ) ( ON ?auto_174503 ?auto_174504 ) ( CLEAR ?auto_174503 ) ( HOLDING ?auto_174497 ) ( CLEAR ?auto_174499 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174498 ?auto_174499 ?auto_174497 )
      ( MAKE-1PILE ?auto_174496 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174505 - BLOCK
    )
    :vars
    (
      ?auto_174510 - BLOCK
      ?auto_174509 - BLOCK
      ?auto_174506 - BLOCK
      ?auto_174507 - BLOCK
      ?auto_174513 - BLOCK
      ?auto_174508 - BLOCK
      ?auto_174512 - BLOCK
      ?auto_174511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174505 ?auto_174510 ) ( not ( = ?auto_174505 ?auto_174510 ) ) ( not ( = ?auto_174505 ?auto_174509 ) ) ( not ( = ?auto_174505 ?auto_174506 ) ) ( not ( = ?auto_174510 ?auto_174509 ) ) ( not ( = ?auto_174510 ?auto_174506 ) ) ( not ( = ?auto_174509 ?auto_174506 ) ) ( ON ?auto_174509 ?auto_174505 ) ( ON-TABLE ?auto_174510 ) ( ON-TABLE ?auto_174507 ) ( ON ?auto_174513 ?auto_174507 ) ( not ( = ?auto_174507 ?auto_174513 ) ) ( not ( = ?auto_174507 ?auto_174508 ) ) ( not ( = ?auto_174507 ?auto_174512 ) ) ( not ( = ?auto_174507 ?auto_174511 ) ) ( not ( = ?auto_174507 ?auto_174506 ) ) ( not ( = ?auto_174513 ?auto_174508 ) ) ( not ( = ?auto_174513 ?auto_174512 ) ) ( not ( = ?auto_174513 ?auto_174511 ) ) ( not ( = ?auto_174513 ?auto_174506 ) ) ( not ( = ?auto_174508 ?auto_174512 ) ) ( not ( = ?auto_174508 ?auto_174511 ) ) ( not ( = ?auto_174508 ?auto_174506 ) ) ( not ( = ?auto_174512 ?auto_174511 ) ) ( not ( = ?auto_174512 ?auto_174506 ) ) ( not ( = ?auto_174511 ?auto_174506 ) ) ( not ( = ?auto_174505 ?auto_174511 ) ) ( not ( = ?auto_174505 ?auto_174507 ) ) ( not ( = ?auto_174505 ?auto_174513 ) ) ( not ( = ?auto_174505 ?auto_174508 ) ) ( not ( = ?auto_174505 ?auto_174512 ) ) ( not ( = ?auto_174510 ?auto_174511 ) ) ( not ( = ?auto_174510 ?auto_174507 ) ) ( not ( = ?auto_174510 ?auto_174513 ) ) ( not ( = ?auto_174510 ?auto_174508 ) ) ( not ( = ?auto_174510 ?auto_174512 ) ) ( not ( = ?auto_174509 ?auto_174511 ) ) ( not ( = ?auto_174509 ?auto_174507 ) ) ( not ( = ?auto_174509 ?auto_174513 ) ) ( not ( = ?auto_174509 ?auto_174508 ) ) ( not ( = ?auto_174509 ?auto_174512 ) ) ( ON ?auto_174506 ?auto_174509 ) ( ON ?auto_174511 ?auto_174506 ) ( ON ?auto_174512 ?auto_174511 ) ( CLEAR ?auto_174513 ) ( ON ?auto_174508 ?auto_174512 ) ( CLEAR ?auto_174508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174510 ?auto_174505 ?auto_174509 ?auto_174506 ?auto_174511 ?auto_174512 )
      ( MAKE-1PILE ?auto_174505 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174514 - BLOCK
    )
    :vars
    (
      ?auto_174519 - BLOCK
      ?auto_174522 - BLOCK
      ?auto_174518 - BLOCK
      ?auto_174515 - BLOCK
      ?auto_174517 - BLOCK
      ?auto_174516 - BLOCK
      ?auto_174520 - BLOCK
      ?auto_174521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174514 ?auto_174519 ) ( not ( = ?auto_174514 ?auto_174519 ) ) ( not ( = ?auto_174514 ?auto_174522 ) ) ( not ( = ?auto_174514 ?auto_174518 ) ) ( not ( = ?auto_174519 ?auto_174522 ) ) ( not ( = ?auto_174519 ?auto_174518 ) ) ( not ( = ?auto_174522 ?auto_174518 ) ) ( ON ?auto_174522 ?auto_174514 ) ( ON-TABLE ?auto_174519 ) ( ON-TABLE ?auto_174515 ) ( not ( = ?auto_174515 ?auto_174517 ) ) ( not ( = ?auto_174515 ?auto_174516 ) ) ( not ( = ?auto_174515 ?auto_174520 ) ) ( not ( = ?auto_174515 ?auto_174521 ) ) ( not ( = ?auto_174515 ?auto_174518 ) ) ( not ( = ?auto_174517 ?auto_174516 ) ) ( not ( = ?auto_174517 ?auto_174520 ) ) ( not ( = ?auto_174517 ?auto_174521 ) ) ( not ( = ?auto_174517 ?auto_174518 ) ) ( not ( = ?auto_174516 ?auto_174520 ) ) ( not ( = ?auto_174516 ?auto_174521 ) ) ( not ( = ?auto_174516 ?auto_174518 ) ) ( not ( = ?auto_174520 ?auto_174521 ) ) ( not ( = ?auto_174520 ?auto_174518 ) ) ( not ( = ?auto_174521 ?auto_174518 ) ) ( not ( = ?auto_174514 ?auto_174521 ) ) ( not ( = ?auto_174514 ?auto_174515 ) ) ( not ( = ?auto_174514 ?auto_174517 ) ) ( not ( = ?auto_174514 ?auto_174516 ) ) ( not ( = ?auto_174514 ?auto_174520 ) ) ( not ( = ?auto_174519 ?auto_174521 ) ) ( not ( = ?auto_174519 ?auto_174515 ) ) ( not ( = ?auto_174519 ?auto_174517 ) ) ( not ( = ?auto_174519 ?auto_174516 ) ) ( not ( = ?auto_174519 ?auto_174520 ) ) ( not ( = ?auto_174522 ?auto_174521 ) ) ( not ( = ?auto_174522 ?auto_174515 ) ) ( not ( = ?auto_174522 ?auto_174517 ) ) ( not ( = ?auto_174522 ?auto_174516 ) ) ( not ( = ?auto_174522 ?auto_174520 ) ) ( ON ?auto_174518 ?auto_174522 ) ( ON ?auto_174521 ?auto_174518 ) ( ON ?auto_174520 ?auto_174521 ) ( ON ?auto_174516 ?auto_174520 ) ( CLEAR ?auto_174516 ) ( HOLDING ?auto_174517 ) ( CLEAR ?auto_174515 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174515 ?auto_174517 )
      ( MAKE-1PILE ?auto_174514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174523 - BLOCK
    )
    :vars
    (
      ?auto_174525 - BLOCK
      ?auto_174529 - BLOCK
      ?auto_174524 - BLOCK
      ?auto_174528 - BLOCK
      ?auto_174530 - BLOCK
      ?auto_174531 - BLOCK
      ?auto_174527 - BLOCK
      ?auto_174526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174523 ?auto_174525 ) ( not ( = ?auto_174523 ?auto_174525 ) ) ( not ( = ?auto_174523 ?auto_174529 ) ) ( not ( = ?auto_174523 ?auto_174524 ) ) ( not ( = ?auto_174525 ?auto_174529 ) ) ( not ( = ?auto_174525 ?auto_174524 ) ) ( not ( = ?auto_174529 ?auto_174524 ) ) ( ON ?auto_174529 ?auto_174523 ) ( ON-TABLE ?auto_174525 ) ( ON-TABLE ?auto_174528 ) ( not ( = ?auto_174528 ?auto_174530 ) ) ( not ( = ?auto_174528 ?auto_174531 ) ) ( not ( = ?auto_174528 ?auto_174527 ) ) ( not ( = ?auto_174528 ?auto_174526 ) ) ( not ( = ?auto_174528 ?auto_174524 ) ) ( not ( = ?auto_174530 ?auto_174531 ) ) ( not ( = ?auto_174530 ?auto_174527 ) ) ( not ( = ?auto_174530 ?auto_174526 ) ) ( not ( = ?auto_174530 ?auto_174524 ) ) ( not ( = ?auto_174531 ?auto_174527 ) ) ( not ( = ?auto_174531 ?auto_174526 ) ) ( not ( = ?auto_174531 ?auto_174524 ) ) ( not ( = ?auto_174527 ?auto_174526 ) ) ( not ( = ?auto_174527 ?auto_174524 ) ) ( not ( = ?auto_174526 ?auto_174524 ) ) ( not ( = ?auto_174523 ?auto_174526 ) ) ( not ( = ?auto_174523 ?auto_174528 ) ) ( not ( = ?auto_174523 ?auto_174530 ) ) ( not ( = ?auto_174523 ?auto_174531 ) ) ( not ( = ?auto_174523 ?auto_174527 ) ) ( not ( = ?auto_174525 ?auto_174526 ) ) ( not ( = ?auto_174525 ?auto_174528 ) ) ( not ( = ?auto_174525 ?auto_174530 ) ) ( not ( = ?auto_174525 ?auto_174531 ) ) ( not ( = ?auto_174525 ?auto_174527 ) ) ( not ( = ?auto_174529 ?auto_174526 ) ) ( not ( = ?auto_174529 ?auto_174528 ) ) ( not ( = ?auto_174529 ?auto_174530 ) ) ( not ( = ?auto_174529 ?auto_174531 ) ) ( not ( = ?auto_174529 ?auto_174527 ) ) ( ON ?auto_174524 ?auto_174529 ) ( ON ?auto_174526 ?auto_174524 ) ( ON ?auto_174527 ?auto_174526 ) ( ON ?auto_174531 ?auto_174527 ) ( CLEAR ?auto_174528 ) ( ON ?auto_174530 ?auto_174531 ) ( CLEAR ?auto_174530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174525 ?auto_174523 ?auto_174529 ?auto_174524 ?auto_174526 ?auto_174527 ?auto_174531 )
      ( MAKE-1PILE ?auto_174523 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174532 - BLOCK
    )
    :vars
    (
      ?auto_174540 - BLOCK
      ?auto_174538 - BLOCK
      ?auto_174535 - BLOCK
      ?auto_174533 - BLOCK
      ?auto_174539 - BLOCK
      ?auto_174537 - BLOCK
      ?auto_174534 - BLOCK
      ?auto_174536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174532 ?auto_174540 ) ( not ( = ?auto_174532 ?auto_174540 ) ) ( not ( = ?auto_174532 ?auto_174538 ) ) ( not ( = ?auto_174532 ?auto_174535 ) ) ( not ( = ?auto_174540 ?auto_174538 ) ) ( not ( = ?auto_174540 ?auto_174535 ) ) ( not ( = ?auto_174538 ?auto_174535 ) ) ( ON ?auto_174538 ?auto_174532 ) ( ON-TABLE ?auto_174540 ) ( not ( = ?auto_174533 ?auto_174539 ) ) ( not ( = ?auto_174533 ?auto_174537 ) ) ( not ( = ?auto_174533 ?auto_174534 ) ) ( not ( = ?auto_174533 ?auto_174536 ) ) ( not ( = ?auto_174533 ?auto_174535 ) ) ( not ( = ?auto_174539 ?auto_174537 ) ) ( not ( = ?auto_174539 ?auto_174534 ) ) ( not ( = ?auto_174539 ?auto_174536 ) ) ( not ( = ?auto_174539 ?auto_174535 ) ) ( not ( = ?auto_174537 ?auto_174534 ) ) ( not ( = ?auto_174537 ?auto_174536 ) ) ( not ( = ?auto_174537 ?auto_174535 ) ) ( not ( = ?auto_174534 ?auto_174536 ) ) ( not ( = ?auto_174534 ?auto_174535 ) ) ( not ( = ?auto_174536 ?auto_174535 ) ) ( not ( = ?auto_174532 ?auto_174536 ) ) ( not ( = ?auto_174532 ?auto_174533 ) ) ( not ( = ?auto_174532 ?auto_174539 ) ) ( not ( = ?auto_174532 ?auto_174537 ) ) ( not ( = ?auto_174532 ?auto_174534 ) ) ( not ( = ?auto_174540 ?auto_174536 ) ) ( not ( = ?auto_174540 ?auto_174533 ) ) ( not ( = ?auto_174540 ?auto_174539 ) ) ( not ( = ?auto_174540 ?auto_174537 ) ) ( not ( = ?auto_174540 ?auto_174534 ) ) ( not ( = ?auto_174538 ?auto_174536 ) ) ( not ( = ?auto_174538 ?auto_174533 ) ) ( not ( = ?auto_174538 ?auto_174539 ) ) ( not ( = ?auto_174538 ?auto_174537 ) ) ( not ( = ?auto_174538 ?auto_174534 ) ) ( ON ?auto_174535 ?auto_174538 ) ( ON ?auto_174536 ?auto_174535 ) ( ON ?auto_174534 ?auto_174536 ) ( ON ?auto_174537 ?auto_174534 ) ( ON ?auto_174539 ?auto_174537 ) ( CLEAR ?auto_174539 ) ( HOLDING ?auto_174533 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174533 )
      ( MAKE-1PILE ?auto_174532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174541 - BLOCK
    )
    :vars
    (
      ?auto_174545 - BLOCK
      ?auto_174544 - BLOCK
      ?auto_174549 - BLOCK
      ?auto_174542 - BLOCK
      ?auto_174548 - BLOCK
      ?auto_174546 - BLOCK
      ?auto_174547 - BLOCK
      ?auto_174543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174541 ?auto_174545 ) ( not ( = ?auto_174541 ?auto_174545 ) ) ( not ( = ?auto_174541 ?auto_174544 ) ) ( not ( = ?auto_174541 ?auto_174549 ) ) ( not ( = ?auto_174545 ?auto_174544 ) ) ( not ( = ?auto_174545 ?auto_174549 ) ) ( not ( = ?auto_174544 ?auto_174549 ) ) ( ON ?auto_174544 ?auto_174541 ) ( ON-TABLE ?auto_174545 ) ( not ( = ?auto_174542 ?auto_174548 ) ) ( not ( = ?auto_174542 ?auto_174546 ) ) ( not ( = ?auto_174542 ?auto_174547 ) ) ( not ( = ?auto_174542 ?auto_174543 ) ) ( not ( = ?auto_174542 ?auto_174549 ) ) ( not ( = ?auto_174548 ?auto_174546 ) ) ( not ( = ?auto_174548 ?auto_174547 ) ) ( not ( = ?auto_174548 ?auto_174543 ) ) ( not ( = ?auto_174548 ?auto_174549 ) ) ( not ( = ?auto_174546 ?auto_174547 ) ) ( not ( = ?auto_174546 ?auto_174543 ) ) ( not ( = ?auto_174546 ?auto_174549 ) ) ( not ( = ?auto_174547 ?auto_174543 ) ) ( not ( = ?auto_174547 ?auto_174549 ) ) ( not ( = ?auto_174543 ?auto_174549 ) ) ( not ( = ?auto_174541 ?auto_174543 ) ) ( not ( = ?auto_174541 ?auto_174542 ) ) ( not ( = ?auto_174541 ?auto_174548 ) ) ( not ( = ?auto_174541 ?auto_174546 ) ) ( not ( = ?auto_174541 ?auto_174547 ) ) ( not ( = ?auto_174545 ?auto_174543 ) ) ( not ( = ?auto_174545 ?auto_174542 ) ) ( not ( = ?auto_174545 ?auto_174548 ) ) ( not ( = ?auto_174545 ?auto_174546 ) ) ( not ( = ?auto_174545 ?auto_174547 ) ) ( not ( = ?auto_174544 ?auto_174543 ) ) ( not ( = ?auto_174544 ?auto_174542 ) ) ( not ( = ?auto_174544 ?auto_174548 ) ) ( not ( = ?auto_174544 ?auto_174546 ) ) ( not ( = ?auto_174544 ?auto_174547 ) ) ( ON ?auto_174549 ?auto_174544 ) ( ON ?auto_174543 ?auto_174549 ) ( ON ?auto_174547 ?auto_174543 ) ( ON ?auto_174546 ?auto_174547 ) ( ON ?auto_174548 ?auto_174546 ) ( ON ?auto_174542 ?auto_174548 ) ( CLEAR ?auto_174542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174545 ?auto_174541 ?auto_174544 ?auto_174549 ?auto_174543 ?auto_174547 ?auto_174546 ?auto_174548 )
      ( MAKE-1PILE ?auto_174541 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174563 - BLOCK
      ?auto_174564 - BLOCK
      ?auto_174565 - BLOCK
      ?auto_174566 - BLOCK
      ?auto_174567 - BLOCK
      ?auto_174568 - BLOCK
    )
    :vars
    (
      ?auto_174569 - BLOCK
      ?auto_174570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174569 ?auto_174568 ) ( CLEAR ?auto_174569 ) ( ON-TABLE ?auto_174563 ) ( ON ?auto_174564 ?auto_174563 ) ( ON ?auto_174565 ?auto_174564 ) ( ON ?auto_174566 ?auto_174565 ) ( ON ?auto_174567 ?auto_174566 ) ( ON ?auto_174568 ?auto_174567 ) ( not ( = ?auto_174563 ?auto_174564 ) ) ( not ( = ?auto_174563 ?auto_174565 ) ) ( not ( = ?auto_174563 ?auto_174566 ) ) ( not ( = ?auto_174563 ?auto_174567 ) ) ( not ( = ?auto_174563 ?auto_174568 ) ) ( not ( = ?auto_174563 ?auto_174569 ) ) ( not ( = ?auto_174564 ?auto_174565 ) ) ( not ( = ?auto_174564 ?auto_174566 ) ) ( not ( = ?auto_174564 ?auto_174567 ) ) ( not ( = ?auto_174564 ?auto_174568 ) ) ( not ( = ?auto_174564 ?auto_174569 ) ) ( not ( = ?auto_174565 ?auto_174566 ) ) ( not ( = ?auto_174565 ?auto_174567 ) ) ( not ( = ?auto_174565 ?auto_174568 ) ) ( not ( = ?auto_174565 ?auto_174569 ) ) ( not ( = ?auto_174566 ?auto_174567 ) ) ( not ( = ?auto_174566 ?auto_174568 ) ) ( not ( = ?auto_174566 ?auto_174569 ) ) ( not ( = ?auto_174567 ?auto_174568 ) ) ( not ( = ?auto_174567 ?auto_174569 ) ) ( not ( = ?auto_174568 ?auto_174569 ) ) ( HOLDING ?auto_174570 ) ( not ( = ?auto_174563 ?auto_174570 ) ) ( not ( = ?auto_174564 ?auto_174570 ) ) ( not ( = ?auto_174565 ?auto_174570 ) ) ( not ( = ?auto_174566 ?auto_174570 ) ) ( not ( = ?auto_174567 ?auto_174570 ) ) ( not ( = ?auto_174568 ?auto_174570 ) ) ( not ( = ?auto_174569 ?auto_174570 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_174570 )
      ( MAKE-6PILE ?auto_174563 ?auto_174564 ?auto_174565 ?auto_174566 ?auto_174567 ?auto_174568 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174688 - BLOCK
      ?auto_174689 - BLOCK
    )
    :vars
    (
      ?auto_174690 - BLOCK
      ?auto_174692 - BLOCK
      ?auto_174695 - BLOCK
      ?auto_174693 - BLOCK
      ?auto_174691 - BLOCK
      ?auto_174694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174688 ?auto_174689 ) ) ( ON ?auto_174689 ?auto_174690 ) ( not ( = ?auto_174688 ?auto_174690 ) ) ( not ( = ?auto_174689 ?auto_174690 ) ) ( ON ?auto_174688 ?auto_174689 ) ( CLEAR ?auto_174688 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174692 ) ( ON ?auto_174695 ?auto_174692 ) ( ON ?auto_174693 ?auto_174695 ) ( ON ?auto_174691 ?auto_174693 ) ( ON ?auto_174694 ?auto_174691 ) ( ON ?auto_174690 ?auto_174694 ) ( not ( = ?auto_174692 ?auto_174695 ) ) ( not ( = ?auto_174692 ?auto_174693 ) ) ( not ( = ?auto_174692 ?auto_174691 ) ) ( not ( = ?auto_174692 ?auto_174694 ) ) ( not ( = ?auto_174692 ?auto_174690 ) ) ( not ( = ?auto_174692 ?auto_174689 ) ) ( not ( = ?auto_174692 ?auto_174688 ) ) ( not ( = ?auto_174695 ?auto_174693 ) ) ( not ( = ?auto_174695 ?auto_174691 ) ) ( not ( = ?auto_174695 ?auto_174694 ) ) ( not ( = ?auto_174695 ?auto_174690 ) ) ( not ( = ?auto_174695 ?auto_174689 ) ) ( not ( = ?auto_174695 ?auto_174688 ) ) ( not ( = ?auto_174693 ?auto_174691 ) ) ( not ( = ?auto_174693 ?auto_174694 ) ) ( not ( = ?auto_174693 ?auto_174690 ) ) ( not ( = ?auto_174693 ?auto_174689 ) ) ( not ( = ?auto_174693 ?auto_174688 ) ) ( not ( = ?auto_174691 ?auto_174694 ) ) ( not ( = ?auto_174691 ?auto_174690 ) ) ( not ( = ?auto_174691 ?auto_174689 ) ) ( not ( = ?auto_174691 ?auto_174688 ) ) ( not ( = ?auto_174694 ?auto_174690 ) ) ( not ( = ?auto_174694 ?auto_174689 ) ) ( not ( = ?auto_174694 ?auto_174688 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174692 ?auto_174695 ?auto_174693 ?auto_174691 ?auto_174694 ?auto_174690 ?auto_174689 )
      ( MAKE-2PILE ?auto_174688 ?auto_174689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174698 - BLOCK
      ?auto_174699 - BLOCK
    )
    :vars
    (
      ?auto_174700 - BLOCK
      ?auto_174701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174698 ?auto_174699 ) ) ( ON ?auto_174699 ?auto_174700 ) ( CLEAR ?auto_174699 ) ( not ( = ?auto_174698 ?auto_174700 ) ) ( not ( = ?auto_174699 ?auto_174700 ) ) ( ON ?auto_174698 ?auto_174701 ) ( CLEAR ?auto_174698 ) ( HAND-EMPTY ) ( not ( = ?auto_174698 ?auto_174701 ) ) ( not ( = ?auto_174699 ?auto_174701 ) ) ( not ( = ?auto_174700 ?auto_174701 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_174698 ?auto_174701 )
      ( MAKE-2PILE ?auto_174698 ?auto_174699 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174702 - BLOCK
      ?auto_174703 - BLOCK
    )
    :vars
    (
      ?auto_174704 - BLOCK
      ?auto_174705 - BLOCK
      ?auto_174709 - BLOCK
      ?auto_174707 - BLOCK
      ?auto_174706 - BLOCK
      ?auto_174708 - BLOCK
      ?auto_174710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174702 ?auto_174703 ) ) ( not ( = ?auto_174702 ?auto_174704 ) ) ( not ( = ?auto_174703 ?auto_174704 ) ) ( ON ?auto_174702 ?auto_174705 ) ( CLEAR ?auto_174702 ) ( not ( = ?auto_174702 ?auto_174705 ) ) ( not ( = ?auto_174703 ?auto_174705 ) ) ( not ( = ?auto_174704 ?auto_174705 ) ) ( HOLDING ?auto_174703 ) ( CLEAR ?auto_174704 ) ( ON-TABLE ?auto_174709 ) ( ON ?auto_174707 ?auto_174709 ) ( ON ?auto_174706 ?auto_174707 ) ( ON ?auto_174708 ?auto_174706 ) ( ON ?auto_174710 ?auto_174708 ) ( ON ?auto_174704 ?auto_174710 ) ( not ( = ?auto_174709 ?auto_174707 ) ) ( not ( = ?auto_174709 ?auto_174706 ) ) ( not ( = ?auto_174709 ?auto_174708 ) ) ( not ( = ?auto_174709 ?auto_174710 ) ) ( not ( = ?auto_174709 ?auto_174704 ) ) ( not ( = ?auto_174709 ?auto_174703 ) ) ( not ( = ?auto_174707 ?auto_174706 ) ) ( not ( = ?auto_174707 ?auto_174708 ) ) ( not ( = ?auto_174707 ?auto_174710 ) ) ( not ( = ?auto_174707 ?auto_174704 ) ) ( not ( = ?auto_174707 ?auto_174703 ) ) ( not ( = ?auto_174706 ?auto_174708 ) ) ( not ( = ?auto_174706 ?auto_174710 ) ) ( not ( = ?auto_174706 ?auto_174704 ) ) ( not ( = ?auto_174706 ?auto_174703 ) ) ( not ( = ?auto_174708 ?auto_174710 ) ) ( not ( = ?auto_174708 ?auto_174704 ) ) ( not ( = ?auto_174708 ?auto_174703 ) ) ( not ( = ?auto_174710 ?auto_174704 ) ) ( not ( = ?auto_174710 ?auto_174703 ) ) ( not ( = ?auto_174702 ?auto_174709 ) ) ( not ( = ?auto_174702 ?auto_174707 ) ) ( not ( = ?auto_174702 ?auto_174706 ) ) ( not ( = ?auto_174702 ?auto_174708 ) ) ( not ( = ?auto_174702 ?auto_174710 ) ) ( not ( = ?auto_174705 ?auto_174709 ) ) ( not ( = ?auto_174705 ?auto_174707 ) ) ( not ( = ?auto_174705 ?auto_174706 ) ) ( not ( = ?auto_174705 ?auto_174708 ) ) ( not ( = ?auto_174705 ?auto_174710 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174709 ?auto_174707 ?auto_174706 ?auto_174708 ?auto_174710 ?auto_174704 ?auto_174703 )
      ( MAKE-2PILE ?auto_174702 ?auto_174703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174711 - BLOCK
      ?auto_174712 - BLOCK
    )
    :vars
    (
      ?auto_174716 - BLOCK
      ?auto_174715 - BLOCK
      ?auto_174718 - BLOCK
      ?auto_174714 - BLOCK
      ?auto_174717 - BLOCK
      ?auto_174713 - BLOCK
      ?auto_174719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174711 ?auto_174712 ) ) ( not ( = ?auto_174711 ?auto_174716 ) ) ( not ( = ?auto_174712 ?auto_174716 ) ) ( ON ?auto_174711 ?auto_174715 ) ( not ( = ?auto_174711 ?auto_174715 ) ) ( not ( = ?auto_174712 ?auto_174715 ) ) ( not ( = ?auto_174716 ?auto_174715 ) ) ( CLEAR ?auto_174716 ) ( ON-TABLE ?auto_174718 ) ( ON ?auto_174714 ?auto_174718 ) ( ON ?auto_174717 ?auto_174714 ) ( ON ?auto_174713 ?auto_174717 ) ( ON ?auto_174719 ?auto_174713 ) ( ON ?auto_174716 ?auto_174719 ) ( not ( = ?auto_174718 ?auto_174714 ) ) ( not ( = ?auto_174718 ?auto_174717 ) ) ( not ( = ?auto_174718 ?auto_174713 ) ) ( not ( = ?auto_174718 ?auto_174719 ) ) ( not ( = ?auto_174718 ?auto_174716 ) ) ( not ( = ?auto_174718 ?auto_174712 ) ) ( not ( = ?auto_174714 ?auto_174717 ) ) ( not ( = ?auto_174714 ?auto_174713 ) ) ( not ( = ?auto_174714 ?auto_174719 ) ) ( not ( = ?auto_174714 ?auto_174716 ) ) ( not ( = ?auto_174714 ?auto_174712 ) ) ( not ( = ?auto_174717 ?auto_174713 ) ) ( not ( = ?auto_174717 ?auto_174719 ) ) ( not ( = ?auto_174717 ?auto_174716 ) ) ( not ( = ?auto_174717 ?auto_174712 ) ) ( not ( = ?auto_174713 ?auto_174719 ) ) ( not ( = ?auto_174713 ?auto_174716 ) ) ( not ( = ?auto_174713 ?auto_174712 ) ) ( not ( = ?auto_174719 ?auto_174716 ) ) ( not ( = ?auto_174719 ?auto_174712 ) ) ( not ( = ?auto_174711 ?auto_174718 ) ) ( not ( = ?auto_174711 ?auto_174714 ) ) ( not ( = ?auto_174711 ?auto_174717 ) ) ( not ( = ?auto_174711 ?auto_174713 ) ) ( not ( = ?auto_174711 ?auto_174719 ) ) ( not ( = ?auto_174715 ?auto_174718 ) ) ( not ( = ?auto_174715 ?auto_174714 ) ) ( not ( = ?auto_174715 ?auto_174717 ) ) ( not ( = ?auto_174715 ?auto_174713 ) ) ( not ( = ?auto_174715 ?auto_174719 ) ) ( ON ?auto_174712 ?auto_174711 ) ( CLEAR ?auto_174712 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174715 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174715 ?auto_174711 )
      ( MAKE-2PILE ?auto_174711 ?auto_174712 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174720 - BLOCK
      ?auto_174721 - BLOCK
    )
    :vars
    (
      ?auto_174725 - BLOCK
      ?auto_174728 - BLOCK
      ?auto_174724 - BLOCK
      ?auto_174722 - BLOCK
      ?auto_174723 - BLOCK
      ?auto_174727 - BLOCK
      ?auto_174726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174720 ?auto_174721 ) ) ( not ( = ?auto_174720 ?auto_174725 ) ) ( not ( = ?auto_174721 ?auto_174725 ) ) ( ON ?auto_174720 ?auto_174728 ) ( not ( = ?auto_174720 ?auto_174728 ) ) ( not ( = ?auto_174721 ?auto_174728 ) ) ( not ( = ?auto_174725 ?auto_174728 ) ) ( ON-TABLE ?auto_174724 ) ( ON ?auto_174722 ?auto_174724 ) ( ON ?auto_174723 ?auto_174722 ) ( ON ?auto_174727 ?auto_174723 ) ( ON ?auto_174726 ?auto_174727 ) ( not ( = ?auto_174724 ?auto_174722 ) ) ( not ( = ?auto_174724 ?auto_174723 ) ) ( not ( = ?auto_174724 ?auto_174727 ) ) ( not ( = ?auto_174724 ?auto_174726 ) ) ( not ( = ?auto_174724 ?auto_174725 ) ) ( not ( = ?auto_174724 ?auto_174721 ) ) ( not ( = ?auto_174722 ?auto_174723 ) ) ( not ( = ?auto_174722 ?auto_174727 ) ) ( not ( = ?auto_174722 ?auto_174726 ) ) ( not ( = ?auto_174722 ?auto_174725 ) ) ( not ( = ?auto_174722 ?auto_174721 ) ) ( not ( = ?auto_174723 ?auto_174727 ) ) ( not ( = ?auto_174723 ?auto_174726 ) ) ( not ( = ?auto_174723 ?auto_174725 ) ) ( not ( = ?auto_174723 ?auto_174721 ) ) ( not ( = ?auto_174727 ?auto_174726 ) ) ( not ( = ?auto_174727 ?auto_174725 ) ) ( not ( = ?auto_174727 ?auto_174721 ) ) ( not ( = ?auto_174726 ?auto_174725 ) ) ( not ( = ?auto_174726 ?auto_174721 ) ) ( not ( = ?auto_174720 ?auto_174724 ) ) ( not ( = ?auto_174720 ?auto_174722 ) ) ( not ( = ?auto_174720 ?auto_174723 ) ) ( not ( = ?auto_174720 ?auto_174727 ) ) ( not ( = ?auto_174720 ?auto_174726 ) ) ( not ( = ?auto_174728 ?auto_174724 ) ) ( not ( = ?auto_174728 ?auto_174722 ) ) ( not ( = ?auto_174728 ?auto_174723 ) ) ( not ( = ?auto_174728 ?auto_174727 ) ) ( not ( = ?auto_174728 ?auto_174726 ) ) ( ON ?auto_174721 ?auto_174720 ) ( CLEAR ?auto_174721 ) ( ON-TABLE ?auto_174728 ) ( HOLDING ?auto_174725 ) ( CLEAR ?auto_174726 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174724 ?auto_174722 ?auto_174723 ?auto_174727 ?auto_174726 ?auto_174725 )
      ( MAKE-2PILE ?auto_174720 ?auto_174721 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174729 - BLOCK
      ?auto_174730 - BLOCK
    )
    :vars
    (
      ?auto_174734 - BLOCK
      ?auto_174736 - BLOCK
      ?auto_174732 - BLOCK
      ?auto_174733 - BLOCK
      ?auto_174731 - BLOCK
      ?auto_174737 - BLOCK
      ?auto_174735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174729 ?auto_174730 ) ) ( not ( = ?auto_174729 ?auto_174734 ) ) ( not ( = ?auto_174730 ?auto_174734 ) ) ( ON ?auto_174729 ?auto_174736 ) ( not ( = ?auto_174729 ?auto_174736 ) ) ( not ( = ?auto_174730 ?auto_174736 ) ) ( not ( = ?auto_174734 ?auto_174736 ) ) ( ON-TABLE ?auto_174732 ) ( ON ?auto_174733 ?auto_174732 ) ( ON ?auto_174731 ?auto_174733 ) ( ON ?auto_174737 ?auto_174731 ) ( ON ?auto_174735 ?auto_174737 ) ( not ( = ?auto_174732 ?auto_174733 ) ) ( not ( = ?auto_174732 ?auto_174731 ) ) ( not ( = ?auto_174732 ?auto_174737 ) ) ( not ( = ?auto_174732 ?auto_174735 ) ) ( not ( = ?auto_174732 ?auto_174734 ) ) ( not ( = ?auto_174732 ?auto_174730 ) ) ( not ( = ?auto_174733 ?auto_174731 ) ) ( not ( = ?auto_174733 ?auto_174737 ) ) ( not ( = ?auto_174733 ?auto_174735 ) ) ( not ( = ?auto_174733 ?auto_174734 ) ) ( not ( = ?auto_174733 ?auto_174730 ) ) ( not ( = ?auto_174731 ?auto_174737 ) ) ( not ( = ?auto_174731 ?auto_174735 ) ) ( not ( = ?auto_174731 ?auto_174734 ) ) ( not ( = ?auto_174731 ?auto_174730 ) ) ( not ( = ?auto_174737 ?auto_174735 ) ) ( not ( = ?auto_174737 ?auto_174734 ) ) ( not ( = ?auto_174737 ?auto_174730 ) ) ( not ( = ?auto_174735 ?auto_174734 ) ) ( not ( = ?auto_174735 ?auto_174730 ) ) ( not ( = ?auto_174729 ?auto_174732 ) ) ( not ( = ?auto_174729 ?auto_174733 ) ) ( not ( = ?auto_174729 ?auto_174731 ) ) ( not ( = ?auto_174729 ?auto_174737 ) ) ( not ( = ?auto_174729 ?auto_174735 ) ) ( not ( = ?auto_174736 ?auto_174732 ) ) ( not ( = ?auto_174736 ?auto_174733 ) ) ( not ( = ?auto_174736 ?auto_174731 ) ) ( not ( = ?auto_174736 ?auto_174737 ) ) ( not ( = ?auto_174736 ?auto_174735 ) ) ( ON ?auto_174730 ?auto_174729 ) ( ON-TABLE ?auto_174736 ) ( CLEAR ?auto_174735 ) ( ON ?auto_174734 ?auto_174730 ) ( CLEAR ?auto_174734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174736 ?auto_174729 ?auto_174730 )
      ( MAKE-2PILE ?auto_174729 ?auto_174730 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174738 - BLOCK
      ?auto_174739 - BLOCK
    )
    :vars
    (
      ?auto_174745 - BLOCK
      ?auto_174744 - BLOCK
      ?auto_174743 - BLOCK
      ?auto_174746 - BLOCK
      ?auto_174740 - BLOCK
      ?auto_174741 - BLOCK
      ?auto_174742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174738 ?auto_174739 ) ) ( not ( = ?auto_174738 ?auto_174745 ) ) ( not ( = ?auto_174739 ?auto_174745 ) ) ( ON ?auto_174738 ?auto_174744 ) ( not ( = ?auto_174738 ?auto_174744 ) ) ( not ( = ?auto_174739 ?auto_174744 ) ) ( not ( = ?auto_174745 ?auto_174744 ) ) ( ON-TABLE ?auto_174743 ) ( ON ?auto_174746 ?auto_174743 ) ( ON ?auto_174740 ?auto_174746 ) ( ON ?auto_174741 ?auto_174740 ) ( not ( = ?auto_174743 ?auto_174746 ) ) ( not ( = ?auto_174743 ?auto_174740 ) ) ( not ( = ?auto_174743 ?auto_174741 ) ) ( not ( = ?auto_174743 ?auto_174742 ) ) ( not ( = ?auto_174743 ?auto_174745 ) ) ( not ( = ?auto_174743 ?auto_174739 ) ) ( not ( = ?auto_174746 ?auto_174740 ) ) ( not ( = ?auto_174746 ?auto_174741 ) ) ( not ( = ?auto_174746 ?auto_174742 ) ) ( not ( = ?auto_174746 ?auto_174745 ) ) ( not ( = ?auto_174746 ?auto_174739 ) ) ( not ( = ?auto_174740 ?auto_174741 ) ) ( not ( = ?auto_174740 ?auto_174742 ) ) ( not ( = ?auto_174740 ?auto_174745 ) ) ( not ( = ?auto_174740 ?auto_174739 ) ) ( not ( = ?auto_174741 ?auto_174742 ) ) ( not ( = ?auto_174741 ?auto_174745 ) ) ( not ( = ?auto_174741 ?auto_174739 ) ) ( not ( = ?auto_174742 ?auto_174745 ) ) ( not ( = ?auto_174742 ?auto_174739 ) ) ( not ( = ?auto_174738 ?auto_174743 ) ) ( not ( = ?auto_174738 ?auto_174746 ) ) ( not ( = ?auto_174738 ?auto_174740 ) ) ( not ( = ?auto_174738 ?auto_174741 ) ) ( not ( = ?auto_174738 ?auto_174742 ) ) ( not ( = ?auto_174744 ?auto_174743 ) ) ( not ( = ?auto_174744 ?auto_174746 ) ) ( not ( = ?auto_174744 ?auto_174740 ) ) ( not ( = ?auto_174744 ?auto_174741 ) ) ( not ( = ?auto_174744 ?auto_174742 ) ) ( ON ?auto_174739 ?auto_174738 ) ( ON-TABLE ?auto_174744 ) ( ON ?auto_174745 ?auto_174739 ) ( CLEAR ?auto_174745 ) ( HOLDING ?auto_174742 ) ( CLEAR ?auto_174741 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174743 ?auto_174746 ?auto_174740 ?auto_174741 ?auto_174742 )
      ( MAKE-2PILE ?auto_174738 ?auto_174739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174747 - BLOCK
      ?auto_174748 - BLOCK
    )
    :vars
    (
      ?auto_174753 - BLOCK
      ?auto_174754 - BLOCK
      ?auto_174752 - BLOCK
      ?auto_174755 - BLOCK
      ?auto_174750 - BLOCK
      ?auto_174749 - BLOCK
      ?auto_174751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174747 ?auto_174748 ) ) ( not ( = ?auto_174747 ?auto_174753 ) ) ( not ( = ?auto_174748 ?auto_174753 ) ) ( ON ?auto_174747 ?auto_174754 ) ( not ( = ?auto_174747 ?auto_174754 ) ) ( not ( = ?auto_174748 ?auto_174754 ) ) ( not ( = ?auto_174753 ?auto_174754 ) ) ( ON-TABLE ?auto_174752 ) ( ON ?auto_174755 ?auto_174752 ) ( ON ?auto_174750 ?auto_174755 ) ( ON ?auto_174749 ?auto_174750 ) ( not ( = ?auto_174752 ?auto_174755 ) ) ( not ( = ?auto_174752 ?auto_174750 ) ) ( not ( = ?auto_174752 ?auto_174749 ) ) ( not ( = ?auto_174752 ?auto_174751 ) ) ( not ( = ?auto_174752 ?auto_174753 ) ) ( not ( = ?auto_174752 ?auto_174748 ) ) ( not ( = ?auto_174755 ?auto_174750 ) ) ( not ( = ?auto_174755 ?auto_174749 ) ) ( not ( = ?auto_174755 ?auto_174751 ) ) ( not ( = ?auto_174755 ?auto_174753 ) ) ( not ( = ?auto_174755 ?auto_174748 ) ) ( not ( = ?auto_174750 ?auto_174749 ) ) ( not ( = ?auto_174750 ?auto_174751 ) ) ( not ( = ?auto_174750 ?auto_174753 ) ) ( not ( = ?auto_174750 ?auto_174748 ) ) ( not ( = ?auto_174749 ?auto_174751 ) ) ( not ( = ?auto_174749 ?auto_174753 ) ) ( not ( = ?auto_174749 ?auto_174748 ) ) ( not ( = ?auto_174751 ?auto_174753 ) ) ( not ( = ?auto_174751 ?auto_174748 ) ) ( not ( = ?auto_174747 ?auto_174752 ) ) ( not ( = ?auto_174747 ?auto_174755 ) ) ( not ( = ?auto_174747 ?auto_174750 ) ) ( not ( = ?auto_174747 ?auto_174749 ) ) ( not ( = ?auto_174747 ?auto_174751 ) ) ( not ( = ?auto_174754 ?auto_174752 ) ) ( not ( = ?auto_174754 ?auto_174755 ) ) ( not ( = ?auto_174754 ?auto_174750 ) ) ( not ( = ?auto_174754 ?auto_174749 ) ) ( not ( = ?auto_174754 ?auto_174751 ) ) ( ON ?auto_174748 ?auto_174747 ) ( ON-TABLE ?auto_174754 ) ( ON ?auto_174753 ?auto_174748 ) ( CLEAR ?auto_174749 ) ( ON ?auto_174751 ?auto_174753 ) ( CLEAR ?auto_174751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174754 ?auto_174747 ?auto_174748 ?auto_174753 )
      ( MAKE-2PILE ?auto_174747 ?auto_174748 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174756 - BLOCK
      ?auto_174757 - BLOCK
    )
    :vars
    (
      ?auto_174764 - BLOCK
      ?auto_174759 - BLOCK
      ?auto_174760 - BLOCK
      ?auto_174762 - BLOCK
      ?auto_174758 - BLOCK
      ?auto_174761 - BLOCK
      ?auto_174763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174756 ?auto_174757 ) ) ( not ( = ?auto_174756 ?auto_174764 ) ) ( not ( = ?auto_174757 ?auto_174764 ) ) ( ON ?auto_174756 ?auto_174759 ) ( not ( = ?auto_174756 ?auto_174759 ) ) ( not ( = ?auto_174757 ?auto_174759 ) ) ( not ( = ?auto_174764 ?auto_174759 ) ) ( ON-TABLE ?auto_174760 ) ( ON ?auto_174762 ?auto_174760 ) ( ON ?auto_174758 ?auto_174762 ) ( not ( = ?auto_174760 ?auto_174762 ) ) ( not ( = ?auto_174760 ?auto_174758 ) ) ( not ( = ?auto_174760 ?auto_174761 ) ) ( not ( = ?auto_174760 ?auto_174763 ) ) ( not ( = ?auto_174760 ?auto_174764 ) ) ( not ( = ?auto_174760 ?auto_174757 ) ) ( not ( = ?auto_174762 ?auto_174758 ) ) ( not ( = ?auto_174762 ?auto_174761 ) ) ( not ( = ?auto_174762 ?auto_174763 ) ) ( not ( = ?auto_174762 ?auto_174764 ) ) ( not ( = ?auto_174762 ?auto_174757 ) ) ( not ( = ?auto_174758 ?auto_174761 ) ) ( not ( = ?auto_174758 ?auto_174763 ) ) ( not ( = ?auto_174758 ?auto_174764 ) ) ( not ( = ?auto_174758 ?auto_174757 ) ) ( not ( = ?auto_174761 ?auto_174763 ) ) ( not ( = ?auto_174761 ?auto_174764 ) ) ( not ( = ?auto_174761 ?auto_174757 ) ) ( not ( = ?auto_174763 ?auto_174764 ) ) ( not ( = ?auto_174763 ?auto_174757 ) ) ( not ( = ?auto_174756 ?auto_174760 ) ) ( not ( = ?auto_174756 ?auto_174762 ) ) ( not ( = ?auto_174756 ?auto_174758 ) ) ( not ( = ?auto_174756 ?auto_174761 ) ) ( not ( = ?auto_174756 ?auto_174763 ) ) ( not ( = ?auto_174759 ?auto_174760 ) ) ( not ( = ?auto_174759 ?auto_174762 ) ) ( not ( = ?auto_174759 ?auto_174758 ) ) ( not ( = ?auto_174759 ?auto_174761 ) ) ( not ( = ?auto_174759 ?auto_174763 ) ) ( ON ?auto_174757 ?auto_174756 ) ( ON-TABLE ?auto_174759 ) ( ON ?auto_174764 ?auto_174757 ) ( ON ?auto_174763 ?auto_174764 ) ( CLEAR ?auto_174763 ) ( HOLDING ?auto_174761 ) ( CLEAR ?auto_174758 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174760 ?auto_174762 ?auto_174758 ?auto_174761 )
      ( MAKE-2PILE ?auto_174756 ?auto_174757 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174765 - BLOCK
      ?auto_174766 - BLOCK
    )
    :vars
    (
      ?auto_174770 - BLOCK
      ?auto_174773 - BLOCK
      ?auto_174772 - BLOCK
      ?auto_174771 - BLOCK
      ?auto_174769 - BLOCK
      ?auto_174767 - BLOCK
      ?auto_174768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174765 ?auto_174766 ) ) ( not ( = ?auto_174765 ?auto_174770 ) ) ( not ( = ?auto_174766 ?auto_174770 ) ) ( ON ?auto_174765 ?auto_174773 ) ( not ( = ?auto_174765 ?auto_174773 ) ) ( not ( = ?auto_174766 ?auto_174773 ) ) ( not ( = ?auto_174770 ?auto_174773 ) ) ( ON-TABLE ?auto_174772 ) ( ON ?auto_174771 ?auto_174772 ) ( ON ?auto_174769 ?auto_174771 ) ( not ( = ?auto_174772 ?auto_174771 ) ) ( not ( = ?auto_174772 ?auto_174769 ) ) ( not ( = ?auto_174772 ?auto_174767 ) ) ( not ( = ?auto_174772 ?auto_174768 ) ) ( not ( = ?auto_174772 ?auto_174770 ) ) ( not ( = ?auto_174772 ?auto_174766 ) ) ( not ( = ?auto_174771 ?auto_174769 ) ) ( not ( = ?auto_174771 ?auto_174767 ) ) ( not ( = ?auto_174771 ?auto_174768 ) ) ( not ( = ?auto_174771 ?auto_174770 ) ) ( not ( = ?auto_174771 ?auto_174766 ) ) ( not ( = ?auto_174769 ?auto_174767 ) ) ( not ( = ?auto_174769 ?auto_174768 ) ) ( not ( = ?auto_174769 ?auto_174770 ) ) ( not ( = ?auto_174769 ?auto_174766 ) ) ( not ( = ?auto_174767 ?auto_174768 ) ) ( not ( = ?auto_174767 ?auto_174770 ) ) ( not ( = ?auto_174767 ?auto_174766 ) ) ( not ( = ?auto_174768 ?auto_174770 ) ) ( not ( = ?auto_174768 ?auto_174766 ) ) ( not ( = ?auto_174765 ?auto_174772 ) ) ( not ( = ?auto_174765 ?auto_174771 ) ) ( not ( = ?auto_174765 ?auto_174769 ) ) ( not ( = ?auto_174765 ?auto_174767 ) ) ( not ( = ?auto_174765 ?auto_174768 ) ) ( not ( = ?auto_174773 ?auto_174772 ) ) ( not ( = ?auto_174773 ?auto_174771 ) ) ( not ( = ?auto_174773 ?auto_174769 ) ) ( not ( = ?auto_174773 ?auto_174767 ) ) ( not ( = ?auto_174773 ?auto_174768 ) ) ( ON ?auto_174766 ?auto_174765 ) ( ON-TABLE ?auto_174773 ) ( ON ?auto_174770 ?auto_174766 ) ( ON ?auto_174768 ?auto_174770 ) ( CLEAR ?auto_174769 ) ( ON ?auto_174767 ?auto_174768 ) ( CLEAR ?auto_174767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174773 ?auto_174765 ?auto_174766 ?auto_174770 ?auto_174768 )
      ( MAKE-2PILE ?auto_174765 ?auto_174766 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174774 - BLOCK
      ?auto_174775 - BLOCK
    )
    :vars
    (
      ?auto_174776 - BLOCK
      ?auto_174782 - BLOCK
      ?auto_174780 - BLOCK
      ?auto_174779 - BLOCK
      ?auto_174778 - BLOCK
      ?auto_174781 - BLOCK
      ?auto_174777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174774 ?auto_174775 ) ) ( not ( = ?auto_174774 ?auto_174776 ) ) ( not ( = ?auto_174775 ?auto_174776 ) ) ( ON ?auto_174774 ?auto_174782 ) ( not ( = ?auto_174774 ?auto_174782 ) ) ( not ( = ?auto_174775 ?auto_174782 ) ) ( not ( = ?auto_174776 ?auto_174782 ) ) ( ON-TABLE ?auto_174780 ) ( ON ?auto_174779 ?auto_174780 ) ( not ( = ?auto_174780 ?auto_174779 ) ) ( not ( = ?auto_174780 ?auto_174778 ) ) ( not ( = ?auto_174780 ?auto_174781 ) ) ( not ( = ?auto_174780 ?auto_174777 ) ) ( not ( = ?auto_174780 ?auto_174776 ) ) ( not ( = ?auto_174780 ?auto_174775 ) ) ( not ( = ?auto_174779 ?auto_174778 ) ) ( not ( = ?auto_174779 ?auto_174781 ) ) ( not ( = ?auto_174779 ?auto_174777 ) ) ( not ( = ?auto_174779 ?auto_174776 ) ) ( not ( = ?auto_174779 ?auto_174775 ) ) ( not ( = ?auto_174778 ?auto_174781 ) ) ( not ( = ?auto_174778 ?auto_174777 ) ) ( not ( = ?auto_174778 ?auto_174776 ) ) ( not ( = ?auto_174778 ?auto_174775 ) ) ( not ( = ?auto_174781 ?auto_174777 ) ) ( not ( = ?auto_174781 ?auto_174776 ) ) ( not ( = ?auto_174781 ?auto_174775 ) ) ( not ( = ?auto_174777 ?auto_174776 ) ) ( not ( = ?auto_174777 ?auto_174775 ) ) ( not ( = ?auto_174774 ?auto_174780 ) ) ( not ( = ?auto_174774 ?auto_174779 ) ) ( not ( = ?auto_174774 ?auto_174778 ) ) ( not ( = ?auto_174774 ?auto_174781 ) ) ( not ( = ?auto_174774 ?auto_174777 ) ) ( not ( = ?auto_174782 ?auto_174780 ) ) ( not ( = ?auto_174782 ?auto_174779 ) ) ( not ( = ?auto_174782 ?auto_174778 ) ) ( not ( = ?auto_174782 ?auto_174781 ) ) ( not ( = ?auto_174782 ?auto_174777 ) ) ( ON ?auto_174775 ?auto_174774 ) ( ON-TABLE ?auto_174782 ) ( ON ?auto_174776 ?auto_174775 ) ( ON ?auto_174777 ?auto_174776 ) ( ON ?auto_174781 ?auto_174777 ) ( CLEAR ?auto_174781 ) ( HOLDING ?auto_174778 ) ( CLEAR ?auto_174779 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174780 ?auto_174779 ?auto_174778 )
      ( MAKE-2PILE ?auto_174774 ?auto_174775 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174783 - BLOCK
      ?auto_174784 - BLOCK
    )
    :vars
    (
      ?auto_174791 - BLOCK
      ?auto_174787 - BLOCK
      ?auto_174788 - BLOCK
      ?auto_174789 - BLOCK
      ?auto_174790 - BLOCK
      ?auto_174786 - BLOCK
      ?auto_174785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174783 ?auto_174784 ) ) ( not ( = ?auto_174783 ?auto_174791 ) ) ( not ( = ?auto_174784 ?auto_174791 ) ) ( ON ?auto_174783 ?auto_174787 ) ( not ( = ?auto_174783 ?auto_174787 ) ) ( not ( = ?auto_174784 ?auto_174787 ) ) ( not ( = ?auto_174791 ?auto_174787 ) ) ( ON-TABLE ?auto_174788 ) ( ON ?auto_174789 ?auto_174788 ) ( not ( = ?auto_174788 ?auto_174789 ) ) ( not ( = ?auto_174788 ?auto_174790 ) ) ( not ( = ?auto_174788 ?auto_174786 ) ) ( not ( = ?auto_174788 ?auto_174785 ) ) ( not ( = ?auto_174788 ?auto_174791 ) ) ( not ( = ?auto_174788 ?auto_174784 ) ) ( not ( = ?auto_174789 ?auto_174790 ) ) ( not ( = ?auto_174789 ?auto_174786 ) ) ( not ( = ?auto_174789 ?auto_174785 ) ) ( not ( = ?auto_174789 ?auto_174791 ) ) ( not ( = ?auto_174789 ?auto_174784 ) ) ( not ( = ?auto_174790 ?auto_174786 ) ) ( not ( = ?auto_174790 ?auto_174785 ) ) ( not ( = ?auto_174790 ?auto_174791 ) ) ( not ( = ?auto_174790 ?auto_174784 ) ) ( not ( = ?auto_174786 ?auto_174785 ) ) ( not ( = ?auto_174786 ?auto_174791 ) ) ( not ( = ?auto_174786 ?auto_174784 ) ) ( not ( = ?auto_174785 ?auto_174791 ) ) ( not ( = ?auto_174785 ?auto_174784 ) ) ( not ( = ?auto_174783 ?auto_174788 ) ) ( not ( = ?auto_174783 ?auto_174789 ) ) ( not ( = ?auto_174783 ?auto_174790 ) ) ( not ( = ?auto_174783 ?auto_174786 ) ) ( not ( = ?auto_174783 ?auto_174785 ) ) ( not ( = ?auto_174787 ?auto_174788 ) ) ( not ( = ?auto_174787 ?auto_174789 ) ) ( not ( = ?auto_174787 ?auto_174790 ) ) ( not ( = ?auto_174787 ?auto_174786 ) ) ( not ( = ?auto_174787 ?auto_174785 ) ) ( ON ?auto_174784 ?auto_174783 ) ( ON-TABLE ?auto_174787 ) ( ON ?auto_174791 ?auto_174784 ) ( ON ?auto_174785 ?auto_174791 ) ( ON ?auto_174786 ?auto_174785 ) ( CLEAR ?auto_174789 ) ( ON ?auto_174790 ?auto_174786 ) ( CLEAR ?auto_174790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174787 ?auto_174783 ?auto_174784 ?auto_174791 ?auto_174785 ?auto_174786 )
      ( MAKE-2PILE ?auto_174783 ?auto_174784 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174792 - BLOCK
      ?auto_174793 - BLOCK
    )
    :vars
    (
      ?auto_174795 - BLOCK
      ?auto_174796 - BLOCK
      ?auto_174799 - BLOCK
      ?auto_174798 - BLOCK
      ?auto_174800 - BLOCK
      ?auto_174797 - BLOCK
      ?auto_174794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174792 ?auto_174793 ) ) ( not ( = ?auto_174792 ?auto_174795 ) ) ( not ( = ?auto_174793 ?auto_174795 ) ) ( ON ?auto_174792 ?auto_174796 ) ( not ( = ?auto_174792 ?auto_174796 ) ) ( not ( = ?auto_174793 ?auto_174796 ) ) ( not ( = ?auto_174795 ?auto_174796 ) ) ( ON-TABLE ?auto_174799 ) ( not ( = ?auto_174799 ?auto_174798 ) ) ( not ( = ?auto_174799 ?auto_174800 ) ) ( not ( = ?auto_174799 ?auto_174797 ) ) ( not ( = ?auto_174799 ?auto_174794 ) ) ( not ( = ?auto_174799 ?auto_174795 ) ) ( not ( = ?auto_174799 ?auto_174793 ) ) ( not ( = ?auto_174798 ?auto_174800 ) ) ( not ( = ?auto_174798 ?auto_174797 ) ) ( not ( = ?auto_174798 ?auto_174794 ) ) ( not ( = ?auto_174798 ?auto_174795 ) ) ( not ( = ?auto_174798 ?auto_174793 ) ) ( not ( = ?auto_174800 ?auto_174797 ) ) ( not ( = ?auto_174800 ?auto_174794 ) ) ( not ( = ?auto_174800 ?auto_174795 ) ) ( not ( = ?auto_174800 ?auto_174793 ) ) ( not ( = ?auto_174797 ?auto_174794 ) ) ( not ( = ?auto_174797 ?auto_174795 ) ) ( not ( = ?auto_174797 ?auto_174793 ) ) ( not ( = ?auto_174794 ?auto_174795 ) ) ( not ( = ?auto_174794 ?auto_174793 ) ) ( not ( = ?auto_174792 ?auto_174799 ) ) ( not ( = ?auto_174792 ?auto_174798 ) ) ( not ( = ?auto_174792 ?auto_174800 ) ) ( not ( = ?auto_174792 ?auto_174797 ) ) ( not ( = ?auto_174792 ?auto_174794 ) ) ( not ( = ?auto_174796 ?auto_174799 ) ) ( not ( = ?auto_174796 ?auto_174798 ) ) ( not ( = ?auto_174796 ?auto_174800 ) ) ( not ( = ?auto_174796 ?auto_174797 ) ) ( not ( = ?auto_174796 ?auto_174794 ) ) ( ON ?auto_174793 ?auto_174792 ) ( ON-TABLE ?auto_174796 ) ( ON ?auto_174795 ?auto_174793 ) ( ON ?auto_174794 ?auto_174795 ) ( ON ?auto_174797 ?auto_174794 ) ( ON ?auto_174800 ?auto_174797 ) ( CLEAR ?auto_174800 ) ( HOLDING ?auto_174798 ) ( CLEAR ?auto_174799 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174799 ?auto_174798 )
      ( MAKE-2PILE ?auto_174792 ?auto_174793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174801 - BLOCK
      ?auto_174802 - BLOCK
    )
    :vars
    (
      ?auto_174808 - BLOCK
      ?auto_174803 - BLOCK
      ?auto_174807 - BLOCK
      ?auto_174805 - BLOCK
      ?auto_174809 - BLOCK
      ?auto_174804 - BLOCK
      ?auto_174806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174801 ?auto_174802 ) ) ( not ( = ?auto_174801 ?auto_174808 ) ) ( not ( = ?auto_174802 ?auto_174808 ) ) ( ON ?auto_174801 ?auto_174803 ) ( not ( = ?auto_174801 ?auto_174803 ) ) ( not ( = ?auto_174802 ?auto_174803 ) ) ( not ( = ?auto_174808 ?auto_174803 ) ) ( ON-TABLE ?auto_174807 ) ( not ( = ?auto_174807 ?auto_174805 ) ) ( not ( = ?auto_174807 ?auto_174809 ) ) ( not ( = ?auto_174807 ?auto_174804 ) ) ( not ( = ?auto_174807 ?auto_174806 ) ) ( not ( = ?auto_174807 ?auto_174808 ) ) ( not ( = ?auto_174807 ?auto_174802 ) ) ( not ( = ?auto_174805 ?auto_174809 ) ) ( not ( = ?auto_174805 ?auto_174804 ) ) ( not ( = ?auto_174805 ?auto_174806 ) ) ( not ( = ?auto_174805 ?auto_174808 ) ) ( not ( = ?auto_174805 ?auto_174802 ) ) ( not ( = ?auto_174809 ?auto_174804 ) ) ( not ( = ?auto_174809 ?auto_174806 ) ) ( not ( = ?auto_174809 ?auto_174808 ) ) ( not ( = ?auto_174809 ?auto_174802 ) ) ( not ( = ?auto_174804 ?auto_174806 ) ) ( not ( = ?auto_174804 ?auto_174808 ) ) ( not ( = ?auto_174804 ?auto_174802 ) ) ( not ( = ?auto_174806 ?auto_174808 ) ) ( not ( = ?auto_174806 ?auto_174802 ) ) ( not ( = ?auto_174801 ?auto_174807 ) ) ( not ( = ?auto_174801 ?auto_174805 ) ) ( not ( = ?auto_174801 ?auto_174809 ) ) ( not ( = ?auto_174801 ?auto_174804 ) ) ( not ( = ?auto_174801 ?auto_174806 ) ) ( not ( = ?auto_174803 ?auto_174807 ) ) ( not ( = ?auto_174803 ?auto_174805 ) ) ( not ( = ?auto_174803 ?auto_174809 ) ) ( not ( = ?auto_174803 ?auto_174804 ) ) ( not ( = ?auto_174803 ?auto_174806 ) ) ( ON ?auto_174802 ?auto_174801 ) ( ON-TABLE ?auto_174803 ) ( ON ?auto_174808 ?auto_174802 ) ( ON ?auto_174806 ?auto_174808 ) ( ON ?auto_174804 ?auto_174806 ) ( ON ?auto_174809 ?auto_174804 ) ( CLEAR ?auto_174807 ) ( ON ?auto_174805 ?auto_174809 ) ( CLEAR ?auto_174805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174803 ?auto_174801 ?auto_174802 ?auto_174808 ?auto_174806 ?auto_174804 ?auto_174809 )
      ( MAKE-2PILE ?auto_174801 ?auto_174802 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174810 - BLOCK
      ?auto_174811 - BLOCK
    )
    :vars
    (
      ?auto_174814 - BLOCK
      ?auto_174818 - BLOCK
      ?auto_174812 - BLOCK
      ?auto_174817 - BLOCK
      ?auto_174816 - BLOCK
      ?auto_174815 - BLOCK
      ?auto_174813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174810 ?auto_174811 ) ) ( not ( = ?auto_174810 ?auto_174814 ) ) ( not ( = ?auto_174811 ?auto_174814 ) ) ( ON ?auto_174810 ?auto_174818 ) ( not ( = ?auto_174810 ?auto_174818 ) ) ( not ( = ?auto_174811 ?auto_174818 ) ) ( not ( = ?auto_174814 ?auto_174818 ) ) ( not ( = ?auto_174812 ?auto_174817 ) ) ( not ( = ?auto_174812 ?auto_174816 ) ) ( not ( = ?auto_174812 ?auto_174815 ) ) ( not ( = ?auto_174812 ?auto_174813 ) ) ( not ( = ?auto_174812 ?auto_174814 ) ) ( not ( = ?auto_174812 ?auto_174811 ) ) ( not ( = ?auto_174817 ?auto_174816 ) ) ( not ( = ?auto_174817 ?auto_174815 ) ) ( not ( = ?auto_174817 ?auto_174813 ) ) ( not ( = ?auto_174817 ?auto_174814 ) ) ( not ( = ?auto_174817 ?auto_174811 ) ) ( not ( = ?auto_174816 ?auto_174815 ) ) ( not ( = ?auto_174816 ?auto_174813 ) ) ( not ( = ?auto_174816 ?auto_174814 ) ) ( not ( = ?auto_174816 ?auto_174811 ) ) ( not ( = ?auto_174815 ?auto_174813 ) ) ( not ( = ?auto_174815 ?auto_174814 ) ) ( not ( = ?auto_174815 ?auto_174811 ) ) ( not ( = ?auto_174813 ?auto_174814 ) ) ( not ( = ?auto_174813 ?auto_174811 ) ) ( not ( = ?auto_174810 ?auto_174812 ) ) ( not ( = ?auto_174810 ?auto_174817 ) ) ( not ( = ?auto_174810 ?auto_174816 ) ) ( not ( = ?auto_174810 ?auto_174815 ) ) ( not ( = ?auto_174810 ?auto_174813 ) ) ( not ( = ?auto_174818 ?auto_174812 ) ) ( not ( = ?auto_174818 ?auto_174817 ) ) ( not ( = ?auto_174818 ?auto_174816 ) ) ( not ( = ?auto_174818 ?auto_174815 ) ) ( not ( = ?auto_174818 ?auto_174813 ) ) ( ON ?auto_174811 ?auto_174810 ) ( ON-TABLE ?auto_174818 ) ( ON ?auto_174814 ?auto_174811 ) ( ON ?auto_174813 ?auto_174814 ) ( ON ?auto_174815 ?auto_174813 ) ( ON ?auto_174816 ?auto_174815 ) ( ON ?auto_174817 ?auto_174816 ) ( CLEAR ?auto_174817 ) ( HOLDING ?auto_174812 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174812 )
      ( MAKE-2PILE ?auto_174810 ?auto_174811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174819 - BLOCK
      ?auto_174820 - BLOCK
    )
    :vars
    (
      ?auto_174825 - BLOCK
      ?auto_174826 - BLOCK
      ?auto_174827 - BLOCK
      ?auto_174824 - BLOCK
      ?auto_174822 - BLOCK
      ?auto_174821 - BLOCK
      ?auto_174823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174819 ?auto_174820 ) ) ( not ( = ?auto_174819 ?auto_174825 ) ) ( not ( = ?auto_174820 ?auto_174825 ) ) ( ON ?auto_174819 ?auto_174826 ) ( not ( = ?auto_174819 ?auto_174826 ) ) ( not ( = ?auto_174820 ?auto_174826 ) ) ( not ( = ?auto_174825 ?auto_174826 ) ) ( not ( = ?auto_174827 ?auto_174824 ) ) ( not ( = ?auto_174827 ?auto_174822 ) ) ( not ( = ?auto_174827 ?auto_174821 ) ) ( not ( = ?auto_174827 ?auto_174823 ) ) ( not ( = ?auto_174827 ?auto_174825 ) ) ( not ( = ?auto_174827 ?auto_174820 ) ) ( not ( = ?auto_174824 ?auto_174822 ) ) ( not ( = ?auto_174824 ?auto_174821 ) ) ( not ( = ?auto_174824 ?auto_174823 ) ) ( not ( = ?auto_174824 ?auto_174825 ) ) ( not ( = ?auto_174824 ?auto_174820 ) ) ( not ( = ?auto_174822 ?auto_174821 ) ) ( not ( = ?auto_174822 ?auto_174823 ) ) ( not ( = ?auto_174822 ?auto_174825 ) ) ( not ( = ?auto_174822 ?auto_174820 ) ) ( not ( = ?auto_174821 ?auto_174823 ) ) ( not ( = ?auto_174821 ?auto_174825 ) ) ( not ( = ?auto_174821 ?auto_174820 ) ) ( not ( = ?auto_174823 ?auto_174825 ) ) ( not ( = ?auto_174823 ?auto_174820 ) ) ( not ( = ?auto_174819 ?auto_174827 ) ) ( not ( = ?auto_174819 ?auto_174824 ) ) ( not ( = ?auto_174819 ?auto_174822 ) ) ( not ( = ?auto_174819 ?auto_174821 ) ) ( not ( = ?auto_174819 ?auto_174823 ) ) ( not ( = ?auto_174826 ?auto_174827 ) ) ( not ( = ?auto_174826 ?auto_174824 ) ) ( not ( = ?auto_174826 ?auto_174822 ) ) ( not ( = ?auto_174826 ?auto_174821 ) ) ( not ( = ?auto_174826 ?auto_174823 ) ) ( ON ?auto_174820 ?auto_174819 ) ( ON-TABLE ?auto_174826 ) ( ON ?auto_174825 ?auto_174820 ) ( ON ?auto_174823 ?auto_174825 ) ( ON ?auto_174821 ?auto_174823 ) ( ON ?auto_174822 ?auto_174821 ) ( ON ?auto_174824 ?auto_174822 ) ( ON ?auto_174827 ?auto_174824 ) ( CLEAR ?auto_174827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174826 ?auto_174819 ?auto_174820 ?auto_174825 ?auto_174823 ?auto_174821 ?auto_174822 ?auto_174824 )
      ( MAKE-2PILE ?auto_174819 ?auto_174820 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_174855 - BLOCK
      ?auto_174856 - BLOCK
      ?auto_174857 - BLOCK
      ?auto_174858 - BLOCK
      ?auto_174859 - BLOCK
    )
    :vars
    (
      ?auto_174861 - BLOCK
      ?auto_174862 - BLOCK
      ?auto_174860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174861 ?auto_174859 ) ( ON-TABLE ?auto_174855 ) ( ON ?auto_174856 ?auto_174855 ) ( ON ?auto_174857 ?auto_174856 ) ( ON ?auto_174858 ?auto_174857 ) ( ON ?auto_174859 ?auto_174858 ) ( not ( = ?auto_174855 ?auto_174856 ) ) ( not ( = ?auto_174855 ?auto_174857 ) ) ( not ( = ?auto_174855 ?auto_174858 ) ) ( not ( = ?auto_174855 ?auto_174859 ) ) ( not ( = ?auto_174855 ?auto_174861 ) ) ( not ( = ?auto_174856 ?auto_174857 ) ) ( not ( = ?auto_174856 ?auto_174858 ) ) ( not ( = ?auto_174856 ?auto_174859 ) ) ( not ( = ?auto_174856 ?auto_174861 ) ) ( not ( = ?auto_174857 ?auto_174858 ) ) ( not ( = ?auto_174857 ?auto_174859 ) ) ( not ( = ?auto_174857 ?auto_174861 ) ) ( not ( = ?auto_174858 ?auto_174859 ) ) ( not ( = ?auto_174858 ?auto_174861 ) ) ( not ( = ?auto_174859 ?auto_174861 ) ) ( not ( = ?auto_174855 ?auto_174862 ) ) ( not ( = ?auto_174855 ?auto_174860 ) ) ( not ( = ?auto_174856 ?auto_174862 ) ) ( not ( = ?auto_174856 ?auto_174860 ) ) ( not ( = ?auto_174857 ?auto_174862 ) ) ( not ( = ?auto_174857 ?auto_174860 ) ) ( not ( = ?auto_174858 ?auto_174862 ) ) ( not ( = ?auto_174858 ?auto_174860 ) ) ( not ( = ?auto_174859 ?auto_174862 ) ) ( not ( = ?auto_174859 ?auto_174860 ) ) ( not ( = ?auto_174861 ?auto_174862 ) ) ( not ( = ?auto_174861 ?auto_174860 ) ) ( not ( = ?auto_174862 ?auto_174860 ) ) ( ON ?auto_174862 ?auto_174861 ) ( CLEAR ?auto_174862 ) ( HOLDING ?auto_174860 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174860 )
      ( MAKE-5PILE ?auto_174855 ?auto_174856 ?auto_174857 ?auto_174858 ?auto_174859 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_174968 - BLOCK
      ?auto_174969 - BLOCK
      ?auto_174970 - BLOCK
    )
    :vars
    (
      ?auto_174971 - BLOCK
      ?auto_174974 - BLOCK
      ?auto_174975 - BLOCK
      ?auto_174973 - BLOCK
      ?auto_174972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174968 ) ( not ( = ?auto_174968 ?auto_174969 ) ) ( not ( = ?auto_174968 ?auto_174970 ) ) ( not ( = ?auto_174969 ?auto_174970 ) ) ( ON ?auto_174970 ?auto_174971 ) ( not ( = ?auto_174968 ?auto_174971 ) ) ( not ( = ?auto_174969 ?auto_174971 ) ) ( not ( = ?auto_174970 ?auto_174971 ) ) ( CLEAR ?auto_174968 ) ( ON ?auto_174969 ?auto_174970 ) ( CLEAR ?auto_174969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174974 ) ( ON ?auto_174975 ?auto_174974 ) ( ON ?auto_174973 ?auto_174975 ) ( ON ?auto_174972 ?auto_174973 ) ( ON ?auto_174971 ?auto_174972 ) ( not ( = ?auto_174974 ?auto_174975 ) ) ( not ( = ?auto_174974 ?auto_174973 ) ) ( not ( = ?auto_174974 ?auto_174972 ) ) ( not ( = ?auto_174974 ?auto_174971 ) ) ( not ( = ?auto_174974 ?auto_174970 ) ) ( not ( = ?auto_174974 ?auto_174969 ) ) ( not ( = ?auto_174975 ?auto_174973 ) ) ( not ( = ?auto_174975 ?auto_174972 ) ) ( not ( = ?auto_174975 ?auto_174971 ) ) ( not ( = ?auto_174975 ?auto_174970 ) ) ( not ( = ?auto_174975 ?auto_174969 ) ) ( not ( = ?auto_174973 ?auto_174972 ) ) ( not ( = ?auto_174973 ?auto_174971 ) ) ( not ( = ?auto_174973 ?auto_174970 ) ) ( not ( = ?auto_174973 ?auto_174969 ) ) ( not ( = ?auto_174972 ?auto_174971 ) ) ( not ( = ?auto_174972 ?auto_174970 ) ) ( not ( = ?auto_174972 ?auto_174969 ) ) ( not ( = ?auto_174968 ?auto_174974 ) ) ( not ( = ?auto_174968 ?auto_174975 ) ) ( not ( = ?auto_174968 ?auto_174973 ) ) ( not ( = ?auto_174968 ?auto_174972 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174974 ?auto_174975 ?auto_174973 ?auto_174972 ?auto_174971 ?auto_174970 )
      ( MAKE-3PILE ?auto_174968 ?auto_174969 ?auto_174970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_174976 - BLOCK
      ?auto_174977 - BLOCK
      ?auto_174978 - BLOCK
    )
    :vars
    (
      ?auto_174979 - BLOCK
      ?auto_174982 - BLOCK
      ?auto_174981 - BLOCK
      ?auto_174980 - BLOCK
      ?auto_174983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174976 ?auto_174977 ) ) ( not ( = ?auto_174976 ?auto_174978 ) ) ( not ( = ?auto_174977 ?auto_174978 ) ) ( ON ?auto_174978 ?auto_174979 ) ( not ( = ?auto_174976 ?auto_174979 ) ) ( not ( = ?auto_174977 ?auto_174979 ) ) ( not ( = ?auto_174978 ?auto_174979 ) ) ( ON ?auto_174977 ?auto_174978 ) ( CLEAR ?auto_174977 ) ( ON-TABLE ?auto_174982 ) ( ON ?auto_174981 ?auto_174982 ) ( ON ?auto_174980 ?auto_174981 ) ( ON ?auto_174983 ?auto_174980 ) ( ON ?auto_174979 ?auto_174983 ) ( not ( = ?auto_174982 ?auto_174981 ) ) ( not ( = ?auto_174982 ?auto_174980 ) ) ( not ( = ?auto_174982 ?auto_174983 ) ) ( not ( = ?auto_174982 ?auto_174979 ) ) ( not ( = ?auto_174982 ?auto_174978 ) ) ( not ( = ?auto_174982 ?auto_174977 ) ) ( not ( = ?auto_174981 ?auto_174980 ) ) ( not ( = ?auto_174981 ?auto_174983 ) ) ( not ( = ?auto_174981 ?auto_174979 ) ) ( not ( = ?auto_174981 ?auto_174978 ) ) ( not ( = ?auto_174981 ?auto_174977 ) ) ( not ( = ?auto_174980 ?auto_174983 ) ) ( not ( = ?auto_174980 ?auto_174979 ) ) ( not ( = ?auto_174980 ?auto_174978 ) ) ( not ( = ?auto_174980 ?auto_174977 ) ) ( not ( = ?auto_174983 ?auto_174979 ) ) ( not ( = ?auto_174983 ?auto_174978 ) ) ( not ( = ?auto_174983 ?auto_174977 ) ) ( not ( = ?auto_174976 ?auto_174982 ) ) ( not ( = ?auto_174976 ?auto_174981 ) ) ( not ( = ?auto_174976 ?auto_174980 ) ) ( not ( = ?auto_174976 ?auto_174983 ) ) ( HOLDING ?auto_174976 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174976 )
      ( MAKE-3PILE ?auto_174976 ?auto_174977 ?auto_174978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_174984 - BLOCK
      ?auto_174985 - BLOCK
      ?auto_174986 - BLOCK
    )
    :vars
    (
      ?auto_174988 - BLOCK
      ?auto_174987 - BLOCK
      ?auto_174989 - BLOCK
      ?auto_174990 - BLOCK
      ?auto_174991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174984 ?auto_174985 ) ) ( not ( = ?auto_174984 ?auto_174986 ) ) ( not ( = ?auto_174985 ?auto_174986 ) ) ( ON ?auto_174986 ?auto_174988 ) ( not ( = ?auto_174984 ?auto_174988 ) ) ( not ( = ?auto_174985 ?auto_174988 ) ) ( not ( = ?auto_174986 ?auto_174988 ) ) ( ON ?auto_174985 ?auto_174986 ) ( ON-TABLE ?auto_174987 ) ( ON ?auto_174989 ?auto_174987 ) ( ON ?auto_174990 ?auto_174989 ) ( ON ?auto_174991 ?auto_174990 ) ( ON ?auto_174988 ?auto_174991 ) ( not ( = ?auto_174987 ?auto_174989 ) ) ( not ( = ?auto_174987 ?auto_174990 ) ) ( not ( = ?auto_174987 ?auto_174991 ) ) ( not ( = ?auto_174987 ?auto_174988 ) ) ( not ( = ?auto_174987 ?auto_174986 ) ) ( not ( = ?auto_174987 ?auto_174985 ) ) ( not ( = ?auto_174989 ?auto_174990 ) ) ( not ( = ?auto_174989 ?auto_174991 ) ) ( not ( = ?auto_174989 ?auto_174988 ) ) ( not ( = ?auto_174989 ?auto_174986 ) ) ( not ( = ?auto_174989 ?auto_174985 ) ) ( not ( = ?auto_174990 ?auto_174991 ) ) ( not ( = ?auto_174990 ?auto_174988 ) ) ( not ( = ?auto_174990 ?auto_174986 ) ) ( not ( = ?auto_174990 ?auto_174985 ) ) ( not ( = ?auto_174991 ?auto_174988 ) ) ( not ( = ?auto_174991 ?auto_174986 ) ) ( not ( = ?auto_174991 ?auto_174985 ) ) ( not ( = ?auto_174984 ?auto_174987 ) ) ( not ( = ?auto_174984 ?auto_174989 ) ) ( not ( = ?auto_174984 ?auto_174990 ) ) ( not ( = ?auto_174984 ?auto_174991 ) ) ( ON ?auto_174984 ?auto_174985 ) ( CLEAR ?auto_174984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174987 ?auto_174989 ?auto_174990 ?auto_174991 ?auto_174988 ?auto_174986 ?auto_174985 )
      ( MAKE-3PILE ?auto_174984 ?auto_174985 ?auto_174986 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_174995 - BLOCK
      ?auto_174996 - BLOCK
      ?auto_174997 - BLOCK
    )
    :vars
    (
      ?auto_175001 - BLOCK
      ?auto_174998 - BLOCK
      ?auto_175000 - BLOCK
      ?auto_174999 - BLOCK
      ?auto_175002 - BLOCK
      ?auto_175003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174995 ?auto_174996 ) ) ( not ( = ?auto_174995 ?auto_174997 ) ) ( not ( = ?auto_174996 ?auto_174997 ) ) ( ON ?auto_174997 ?auto_175001 ) ( not ( = ?auto_174995 ?auto_175001 ) ) ( not ( = ?auto_174996 ?auto_175001 ) ) ( not ( = ?auto_174997 ?auto_175001 ) ) ( ON ?auto_174996 ?auto_174997 ) ( CLEAR ?auto_174996 ) ( ON-TABLE ?auto_174998 ) ( ON ?auto_175000 ?auto_174998 ) ( ON ?auto_174999 ?auto_175000 ) ( ON ?auto_175002 ?auto_174999 ) ( ON ?auto_175001 ?auto_175002 ) ( not ( = ?auto_174998 ?auto_175000 ) ) ( not ( = ?auto_174998 ?auto_174999 ) ) ( not ( = ?auto_174998 ?auto_175002 ) ) ( not ( = ?auto_174998 ?auto_175001 ) ) ( not ( = ?auto_174998 ?auto_174997 ) ) ( not ( = ?auto_174998 ?auto_174996 ) ) ( not ( = ?auto_175000 ?auto_174999 ) ) ( not ( = ?auto_175000 ?auto_175002 ) ) ( not ( = ?auto_175000 ?auto_175001 ) ) ( not ( = ?auto_175000 ?auto_174997 ) ) ( not ( = ?auto_175000 ?auto_174996 ) ) ( not ( = ?auto_174999 ?auto_175002 ) ) ( not ( = ?auto_174999 ?auto_175001 ) ) ( not ( = ?auto_174999 ?auto_174997 ) ) ( not ( = ?auto_174999 ?auto_174996 ) ) ( not ( = ?auto_175002 ?auto_175001 ) ) ( not ( = ?auto_175002 ?auto_174997 ) ) ( not ( = ?auto_175002 ?auto_174996 ) ) ( not ( = ?auto_174995 ?auto_174998 ) ) ( not ( = ?auto_174995 ?auto_175000 ) ) ( not ( = ?auto_174995 ?auto_174999 ) ) ( not ( = ?auto_174995 ?auto_175002 ) ) ( ON ?auto_174995 ?auto_175003 ) ( CLEAR ?auto_174995 ) ( HAND-EMPTY ) ( not ( = ?auto_174995 ?auto_175003 ) ) ( not ( = ?auto_174996 ?auto_175003 ) ) ( not ( = ?auto_174997 ?auto_175003 ) ) ( not ( = ?auto_175001 ?auto_175003 ) ) ( not ( = ?auto_174998 ?auto_175003 ) ) ( not ( = ?auto_175000 ?auto_175003 ) ) ( not ( = ?auto_174999 ?auto_175003 ) ) ( not ( = ?auto_175002 ?auto_175003 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_174995 ?auto_175003 )
      ( MAKE-3PILE ?auto_174995 ?auto_174996 ?auto_174997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175004 - BLOCK
      ?auto_175005 - BLOCK
      ?auto_175006 - BLOCK
    )
    :vars
    (
      ?auto_175010 - BLOCK
      ?auto_175012 - BLOCK
      ?auto_175007 - BLOCK
      ?auto_175009 - BLOCK
      ?auto_175011 - BLOCK
      ?auto_175008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175004 ?auto_175005 ) ) ( not ( = ?auto_175004 ?auto_175006 ) ) ( not ( = ?auto_175005 ?auto_175006 ) ) ( ON ?auto_175006 ?auto_175010 ) ( not ( = ?auto_175004 ?auto_175010 ) ) ( not ( = ?auto_175005 ?auto_175010 ) ) ( not ( = ?auto_175006 ?auto_175010 ) ) ( ON-TABLE ?auto_175012 ) ( ON ?auto_175007 ?auto_175012 ) ( ON ?auto_175009 ?auto_175007 ) ( ON ?auto_175011 ?auto_175009 ) ( ON ?auto_175010 ?auto_175011 ) ( not ( = ?auto_175012 ?auto_175007 ) ) ( not ( = ?auto_175012 ?auto_175009 ) ) ( not ( = ?auto_175012 ?auto_175011 ) ) ( not ( = ?auto_175012 ?auto_175010 ) ) ( not ( = ?auto_175012 ?auto_175006 ) ) ( not ( = ?auto_175012 ?auto_175005 ) ) ( not ( = ?auto_175007 ?auto_175009 ) ) ( not ( = ?auto_175007 ?auto_175011 ) ) ( not ( = ?auto_175007 ?auto_175010 ) ) ( not ( = ?auto_175007 ?auto_175006 ) ) ( not ( = ?auto_175007 ?auto_175005 ) ) ( not ( = ?auto_175009 ?auto_175011 ) ) ( not ( = ?auto_175009 ?auto_175010 ) ) ( not ( = ?auto_175009 ?auto_175006 ) ) ( not ( = ?auto_175009 ?auto_175005 ) ) ( not ( = ?auto_175011 ?auto_175010 ) ) ( not ( = ?auto_175011 ?auto_175006 ) ) ( not ( = ?auto_175011 ?auto_175005 ) ) ( not ( = ?auto_175004 ?auto_175012 ) ) ( not ( = ?auto_175004 ?auto_175007 ) ) ( not ( = ?auto_175004 ?auto_175009 ) ) ( not ( = ?auto_175004 ?auto_175011 ) ) ( ON ?auto_175004 ?auto_175008 ) ( CLEAR ?auto_175004 ) ( not ( = ?auto_175004 ?auto_175008 ) ) ( not ( = ?auto_175005 ?auto_175008 ) ) ( not ( = ?auto_175006 ?auto_175008 ) ) ( not ( = ?auto_175010 ?auto_175008 ) ) ( not ( = ?auto_175012 ?auto_175008 ) ) ( not ( = ?auto_175007 ?auto_175008 ) ) ( not ( = ?auto_175009 ?auto_175008 ) ) ( not ( = ?auto_175011 ?auto_175008 ) ) ( HOLDING ?auto_175005 ) ( CLEAR ?auto_175006 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175012 ?auto_175007 ?auto_175009 ?auto_175011 ?auto_175010 ?auto_175006 ?auto_175005 )
      ( MAKE-3PILE ?auto_175004 ?auto_175005 ?auto_175006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175013 - BLOCK
      ?auto_175014 - BLOCK
      ?auto_175015 - BLOCK
    )
    :vars
    (
      ?auto_175018 - BLOCK
      ?auto_175017 - BLOCK
      ?auto_175016 - BLOCK
      ?auto_175019 - BLOCK
      ?auto_175021 - BLOCK
      ?auto_175020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175013 ?auto_175014 ) ) ( not ( = ?auto_175013 ?auto_175015 ) ) ( not ( = ?auto_175014 ?auto_175015 ) ) ( ON ?auto_175015 ?auto_175018 ) ( not ( = ?auto_175013 ?auto_175018 ) ) ( not ( = ?auto_175014 ?auto_175018 ) ) ( not ( = ?auto_175015 ?auto_175018 ) ) ( ON-TABLE ?auto_175017 ) ( ON ?auto_175016 ?auto_175017 ) ( ON ?auto_175019 ?auto_175016 ) ( ON ?auto_175021 ?auto_175019 ) ( ON ?auto_175018 ?auto_175021 ) ( not ( = ?auto_175017 ?auto_175016 ) ) ( not ( = ?auto_175017 ?auto_175019 ) ) ( not ( = ?auto_175017 ?auto_175021 ) ) ( not ( = ?auto_175017 ?auto_175018 ) ) ( not ( = ?auto_175017 ?auto_175015 ) ) ( not ( = ?auto_175017 ?auto_175014 ) ) ( not ( = ?auto_175016 ?auto_175019 ) ) ( not ( = ?auto_175016 ?auto_175021 ) ) ( not ( = ?auto_175016 ?auto_175018 ) ) ( not ( = ?auto_175016 ?auto_175015 ) ) ( not ( = ?auto_175016 ?auto_175014 ) ) ( not ( = ?auto_175019 ?auto_175021 ) ) ( not ( = ?auto_175019 ?auto_175018 ) ) ( not ( = ?auto_175019 ?auto_175015 ) ) ( not ( = ?auto_175019 ?auto_175014 ) ) ( not ( = ?auto_175021 ?auto_175018 ) ) ( not ( = ?auto_175021 ?auto_175015 ) ) ( not ( = ?auto_175021 ?auto_175014 ) ) ( not ( = ?auto_175013 ?auto_175017 ) ) ( not ( = ?auto_175013 ?auto_175016 ) ) ( not ( = ?auto_175013 ?auto_175019 ) ) ( not ( = ?auto_175013 ?auto_175021 ) ) ( ON ?auto_175013 ?auto_175020 ) ( not ( = ?auto_175013 ?auto_175020 ) ) ( not ( = ?auto_175014 ?auto_175020 ) ) ( not ( = ?auto_175015 ?auto_175020 ) ) ( not ( = ?auto_175018 ?auto_175020 ) ) ( not ( = ?auto_175017 ?auto_175020 ) ) ( not ( = ?auto_175016 ?auto_175020 ) ) ( not ( = ?auto_175019 ?auto_175020 ) ) ( not ( = ?auto_175021 ?auto_175020 ) ) ( CLEAR ?auto_175015 ) ( ON ?auto_175014 ?auto_175013 ) ( CLEAR ?auto_175014 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175020 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175020 ?auto_175013 )
      ( MAKE-3PILE ?auto_175013 ?auto_175014 ?auto_175015 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175022 - BLOCK
      ?auto_175023 - BLOCK
      ?auto_175024 - BLOCK
    )
    :vars
    (
      ?auto_175030 - BLOCK
      ?auto_175027 - BLOCK
      ?auto_175029 - BLOCK
      ?auto_175028 - BLOCK
      ?auto_175025 - BLOCK
      ?auto_175026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175022 ?auto_175023 ) ) ( not ( = ?auto_175022 ?auto_175024 ) ) ( not ( = ?auto_175023 ?auto_175024 ) ) ( not ( = ?auto_175022 ?auto_175030 ) ) ( not ( = ?auto_175023 ?auto_175030 ) ) ( not ( = ?auto_175024 ?auto_175030 ) ) ( ON-TABLE ?auto_175027 ) ( ON ?auto_175029 ?auto_175027 ) ( ON ?auto_175028 ?auto_175029 ) ( ON ?auto_175025 ?auto_175028 ) ( ON ?auto_175030 ?auto_175025 ) ( not ( = ?auto_175027 ?auto_175029 ) ) ( not ( = ?auto_175027 ?auto_175028 ) ) ( not ( = ?auto_175027 ?auto_175025 ) ) ( not ( = ?auto_175027 ?auto_175030 ) ) ( not ( = ?auto_175027 ?auto_175024 ) ) ( not ( = ?auto_175027 ?auto_175023 ) ) ( not ( = ?auto_175029 ?auto_175028 ) ) ( not ( = ?auto_175029 ?auto_175025 ) ) ( not ( = ?auto_175029 ?auto_175030 ) ) ( not ( = ?auto_175029 ?auto_175024 ) ) ( not ( = ?auto_175029 ?auto_175023 ) ) ( not ( = ?auto_175028 ?auto_175025 ) ) ( not ( = ?auto_175028 ?auto_175030 ) ) ( not ( = ?auto_175028 ?auto_175024 ) ) ( not ( = ?auto_175028 ?auto_175023 ) ) ( not ( = ?auto_175025 ?auto_175030 ) ) ( not ( = ?auto_175025 ?auto_175024 ) ) ( not ( = ?auto_175025 ?auto_175023 ) ) ( not ( = ?auto_175022 ?auto_175027 ) ) ( not ( = ?auto_175022 ?auto_175029 ) ) ( not ( = ?auto_175022 ?auto_175028 ) ) ( not ( = ?auto_175022 ?auto_175025 ) ) ( ON ?auto_175022 ?auto_175026 ) ( not ( = ?auto_175022 ?auto_175026 ) ) ( not ( = ?auto_175023 ?auto_175026 ) ) ( not ( = ?auto_175024 ?auto_175026 ) ) ( not ( = ?auto_175030 ?auto_175026 ) ) ( not ( = ?auto_175027 ?auto_175026 ) ) ( not ( = ?auto_175029 ?auto_175026 ) ) ( not ( = ?auto_175028 ?auto_175026 ) ) ( not ( = ?auto_175025 ?auto_175026 ) ) ( ON ?auto_175023 ?auto_175022 ) ( CLEAR ?auto_175023 ) ( ON-TABLE ?auto_175026 ) ( HOLDING ?auto_175024 ) ( CLEAR ?auto_175030 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175027 ?auto_175029 ?auto_175028 ?auto_175025 ?auto_175030 ?auto_175024 )
      ( MAKE-3PILE ?auto_175022 ?auto_175023 ?auto_175024 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175031 - BLOCK
      ?auto_175032 - BLOCK
      ?auto_175033 - BLOCK
    )
    :vars
    (
      ?auto_175034 - BLOCK
      ?auto_175037 - BLOCK
      ?auto_175038 - BLOCK
      ?auto_175039 - BLOCK
      ?auto_175036 - BLOCK
      ?auto_175035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175031 ?auto_175032 ) ) ( not ( = ?auto_175031 ?auto_175033 ) ) ( not ( = ?auto_175032 ?auto_175033 ) ) ( not ( = ?auto_175031 ?auto_175034 ) ) ( not ( = ?auto_175032 ?auto_175034 ) ) ( not ( = ?auto_175033 ?auto_175034 ) ) ( ON-TABLE ?auto_175037 ) ( ON ?auto_175038 ?auto_175037 ) ( ON ?auto_175039 ?auto_175038 ) ( ON ?auto_175036 ?auto_175039 ) ( ON ?auto_175034 ?auto_175036 ) ( not ( = ?auto_175037 ?auto_175038 ) ) ( not ( = ?auto_175037 ?auto_175039 ) ) ( not ( = ?auto_175037 ?auto_175036 ) ) ( not ( = ?auto_175037 ?auto_175034 ) ) ( not ( = ?auto_175037 ?auto_175033 ) ) ( not ( = ?auto_175037 ?auto_175032 ) ) ( not ( = ?auto_175038 ?auto_175039 ) ) ( not ( = ?auto_175038 ?auto_175036 ) ) ( not ( = ?auto_175038 ?auto_175034 ) ) ( not ( = ?auto_175038 ?auto_175033 ) ) ( not ( = ?auto_175038 ?auto_175032 ) ) ( not ( = ?auto_175039 ?auto_175036 ) ) ( not ( = ?auto_175039 ?auto_175034 ) ) ( not ( = ?auto_175039 ?auto_175033 ) ) ( not ( = ?auto_175039 ?auto_175032 ) ) ( not ( = ?auto_175036 ?auto_175034 ) ) ( not ( = ?auto_175036 ?auto_175033 ) ) ( not ( = ?auto_175036 ?auto_175032 ) ) ( not ( = ?auto_175031 ?auto_175037 ) ) ( not ( = ?auto_175031 ?auto_175038 ) ) ( not ( = ?auto_175031 ?auto_175039 ) ) ( not ( = ?auto_175031 ?auto_175036 ) ) ( ON ?auto_175031 ?auto_175035 ) ( not ( = ?auto_175031 ?auto_175035 ) ) ( not ( = ?auto_175032 ?auto_175035 ) ) ( not ( = ?auto_175033 ?auto_175035 ) ) ( not ( = ?auto_175034 ?auto_175035 ) ) ( not ( = ?auto_175037 ?auto_175035 ) ) ( not ( = ?auto_175038 ?auto_175035 ) ) ( not ( = ?auto_175039 ?auto_175035 ) ) ( not ( = ?auto_175036 ?auto_175035 ) ) ( ON ?auto_175032 ?auto_175031 ) ( ON-TABLE ?auto_175035 ) ( CLEAR ?auto_175034 ) ( ON ?auto_175033 ?auto_175032 ) ( CLEAR ?auto_175033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175035 ?auto_175031 ?auto_175032 )
      ( MAKE-3PILE ?auto_175031 ?auto_175032 ?auto_175033 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175040 - BLOCK
      ?auto_175041 - BLOCK
      ?auto_175042 - BLOCK
    )
    :vars
    (
      ?auto_175045 - BLOCK
      ?auto_175047 - BLOCK
      ?auto_175048 - BLOCK
      ?auto_175043 - BLOCK
      ?auto_175046 - BLOCK
      ?auto_175044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175040 ?auto_175041 ) ) ( not ( = ?auto_175040 ?auto_175042 ) ) ( not ( = ?auto_175041 ?auto_175042 ) ) ( not ( = ?auto_175040 ?auto_175045 ) ) ( not ( = ?auto_175041 ?auto_175045 ) ) ( not ( = ?auto_175042 ?auto_175045 ) ) ( ON-TABLE ?auto_175047 ) ( ON ?auto_175048 ?auto_175047 ) ( ON ?auto_175043 ?auto_175048 ) ( ON ?auto_175046 ?auto_175043 ) ( not ( = ?auto_175047 ?auto_175048 ) ) ( not ( = ?auto_175047 ?auto_175043 ) ) ( not ( = ?auto_175047 ?auto_175046 ) ) ( not ( = ?auto_175047 ?auto_175045 ) ) ( not ( = ?auto_175047 ?auto_175042 ) ) ( not ( = ?auto_175047 ?auto_175041 ) ) ( not ( = ?auto_175048 ?auto_175043 ) ) ( not ( = ?auto_175048 ?auto_175046 ) ) ( not ( = ?auto_175048 ?auto_175045 ) ) ( not ( = ?auto_175048 ?auto_175042 ) ) ( not ( = ?auto_175048 ?auto_175041 ) ) ( not ( = ?auto_175043 ?auto_175046 ) ) ( not ( = ?auto_175043 ?auto_175045 ) ) ( not ( = ?auto_175043 ?auto_175042 ) ) ( not ( = ?auto_175043 ?auto_175041 ) ) ( not ( = ?auto_175046 ?auto_175045 ) ) ( not ( = ?auto_175046 ?auto_175042 ) ) ( not ( = ?auto_175046 ?auto_175041 ) ) ( not ( = ?auto_175040 ?auto_175047 ) ) ( not ( = ?auto_175040 ?auto_175048 ) ) ( not ( = ?auto_175040 ?auto_175043 ) ) ( not ( = ?auto_175040 ?auto_175046 ) ) ( ON ?auto_175040 ?auto_175044 ) ( not ( = ?auto_175040 ?auto_175044 ) ) ( not ( = ?auto_175041 ?auto_175044 ) ) ( not ( = ?auto_175042 ?auto_175044 ) ) ( not ( = ?auto_175045 ?auto_175044 ) ) ( not ( = ?auto_175047 ?auto_175044 ) ) ( not ( = ?auto_175048 ?auto_175044 ) ) ( not ( = ?auto_175043 ?auto_175044 ) ) ( not ( = ?auto_175046 ?auto_175044 ) ) ( ON ?auto_175041 ?auto_175040 ) ( ON-TABLE ?auto_175044 ) ( ON ?auto_175042 ?auto_175041 ) ( CLEAR ?auto_175042 ) ( HOLDING ?auto_175045 ) ( CLEAR ?auto_175046 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175047 ?auto_175048 ?auto_175043 ?auto_175046 ?auto_175045 )
      ( MAKE-3PILE ?auto_175040 ?auto_175041 ?auto_175042 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175049 - BLOCK
      ?auto_175050 - BLOCK
      ?auto_175051 - BLOCK
    )
    :vars
    (
      ?auto_175055 - BLOCK
      ?auto_175057 - BLOCK
      ?auto_175056 - BLOCK
      ?auto_175053 - BLOCK
      ?auto_175052 - BLOCK
      ?auto_175054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175049 ?auto_175050 ) ) ( not ( = ?auto_175049 ?auto_175051 ) ) ( not ( = ?auto_175050 ?auto_175051 ) ) ( not ( = ?auto_175049 ?auto_175055 ) ) ( not ( = ?auto_175050 ?auto_175055 ) ) ( not ( = ?auto_175051 ?auto_175055 ) ) ( ON-TABLE ?auto_175057 ) ( ON ?auto_175056 ?auto_175057 ) ( ON ?auto_175053 ?auto_175056 ) ( ON ?auto_175052 ?auto_175053 ) ( not ( = ?auto_175057 ?auto_175056 ) ) ( not ( = ?auto_175057 ?auto_175053 ) ) ( not ( = ?auto_175057 ?auto_175052 ) ) ( not ( = ?auto_175057 ?auto_175055 ) ) ( not ( = ?auto_175057 ?auto_175051 ) ) ( not ( = ?auto_175057 ?auto_175050 ) ) ( not ( = ?auto_175056 ?auto_175053 ) ) ( not ( = ?auto_175056 ?auto_175052 ) ) ( not ( = ?auto_175056 ?auto_175055 ) ) ( not ( = ?auto_175056 ?auto_175051 ) ) ( not ( = ?auto_175056 ?auto_175050 ) ) ( not ( = ?auto_175053 ?auto_175052 ) ) ( not ( = ?auto_175053 ?auto_175055 ) ) ( not ( = ?auto_175053 ?auto_175051 ) ) ( not ( = ?auto_175053 ?auto_175050 ) ) ( not ( = ?auto_175052 ?auto_175055 ) ) ( not ( = ?auto_175052 ?auto_175051 ) ) ( not ( = ?auto_175052 ?auto_175050 ) ) ( not ( = ?auto_175049 ?auto_175057 ) ) ( not ( = ?auto_175049 ?auto_175056 ) ) ( not ( = ?auto_175049 ?auto_175053 ) ) ( not ( = ?auto_175049 ?auto_175052 ) ) ( ON ?auto_175049 ?auto_175054 ) ( not ( = ?auto_175049 ?auto_175054 ) ) ( not ( = ?auto_175050 ?auto_175054 ) ) ( not ( = ?auto_175051 ?auto_175054 ) ) ( not ( = ?auto_175055 ?auto_175054 ) ) ( not ( = ?auto_175057 ?auto_175054 ) ) ( not ( = ?auto_175056 ?auto_175054 ) ) ( not ( = ?auto_175053 ?auto_175054 ) ) ( not ( = ?auto_175052 ?auto_175054 ) ) ( ON ?auto_175050 ?auto_175049 ) ( ON-TABLE ?auto_175054 ) ( ON ?auto_175051 ?auto_175050 ) ( CLEAR ?auto_175052 ) ( ON ?auto_175055 ?auto_175051 ) ( CLEAR ?auto_175055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175054 ?auto_175049 ?auto_175050 ?auto_175051 )
      ( MAKE-3PILE ?auto_175049 ?auto_175050 ?auto_175051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175058 - BLOCK
      ?auto_175059 - BLOCK
      ?auto_175060 - BLOCK
    )
    :vars
    (
      ?auto_175063 - BLOCK
      ?auto_175065 - BLOCK
      ?auto_175066 - BLOCK
      ?auto_175061 - BLOCK
      ?auto_175064 - BLOCK
      ?auto_175062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175058 ?auto_175059 ) ) ( not ( = ?auto_175058 ?auto_175060 ) ) ( not ( = ?auto_175059 ?auto_175060 ) ) ( not ( = ?auto_175058 ?auto_175063 ) ) ( not ( = ?auto_175059 ?auto_175063 ) ) ( not ( = ?auto_175060 ?auto_175063 ) ) ( ON-TABLE ?auto_175065 ) ( ON ?auto_175066 ?auto_175065 ) ( ON ?auto_175061 ?auto_175066 ) ( not ( = ?auto_175065 ?auto_175066 ) ) ( not ( = ?auto_175065 ?auto_175061 ) ) ( not ( = ?auto_175065 ?auto_175064 ) ) ( not ( = ?auto_175065 ?auto_175063 ) ) ( not ( = ?auto_175065 ?auto_175060 ) ) ( not ( = ?auto_175065 ?auto_175059 ) ) ( not ( = ?auto_175066 ?auto_175061 ) ) ( not ( = ?auto_175066 ?auto_175064 ) ) ( not ( = ?auto_175066 ?auto_175063 ) ) ( not ( = ?auto_175066 ?auto_175060 ) ) ( not ( = ?auto_175066 ?auto_175059 ) ) ( not ( = ?auto_175061 ?auto_175064 ) ) ( not ( = ?auto_175061 ?auto_175063 ) ) ( not ( = ?auto_175061 ?auto_175060 ) ) ( not ( = ?auto_175061 ?auto_175059 ) ) ( not ( = ?auto_175064 ?auto_175063 ) ) ( not ( = ?auto_175064 ?auto_175060 ) ) ( not ( = ?auto_175064 ?auto_175059 ) ) ( not ( = ?auto_175058 ?auto_175065 ) ) ( not ( = ?auto_175058 ?auto_175066 ) ) ( not ( = ?auto_175058 ?auto_175061 ) ) ( not ( = ?auto_175058 ?auto_175064 ) ) ( ON ?auto_175058 ?auto_175062 ) ( not ( = ?auto_175058 ?auto_175062 ) ) ( not ( = ?auto_175059 ?auto_175062 ) ) ( not ( = ?auto_175060 ?auto_175062 ) ) ( not ( = ?auto_175063 ?auto_175062 ) ) ( not ( = ?auto_175065 ?auto_175062 ) ) ( not ( = ?auto_175066 ?auto_175062 ) ) ( not ( = ?auto_175061 ?auto_175062 ) ) ( not ( = ?auto_175064 ?auto_175062 ) ) ( ON ?auto_175059 ?auto_175058 ) ( ON-TABLE ?auto_175062 ) ( ON ?auto_175060 ?auto_175059 ) ( ON ?auto_175063 ?auto_175060 ) ( CLEAR ?auto_175063 ) ( HOLDING ?auto_175064 ) ( CLEAR ?auto_175061 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175065 ?auto_175066 ?auto_175061 ?auto_175064 )
      ( MAKE-3PILE ?auto_175058 ?auto_175059 ?auto_175060 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175067 - BLOCK
      ?auto_175068 - BLOCK
      ?auto_175069 - BLOCK
    )
    :vars
    (
      ?auto_175071 - BLOCK
      ?auto_175070 - BLOCK
      ?auto_175074 - BLOCK
      ?auto_175075 - BLOCK
      ?auto_175073 - BLOCK
      ?auto_175072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175067 ?auto_175068 ) ) ( not ( = ?auto_175067 ?auto_175069 ) ) ( not ( = ?auto_175068 ?auto_175069 ) ) ( not ( = ?auto_175067 ?auto_175071 ) ) ( not ( = ?auto_175068 ?auto_175071 ) ) ( not ( = ?auto_175069 ?auto_175071 ) ) ( ON-TABLE ?auto_175070 ) ( ON ?auto_175074 ?auto_175070 ) ( ON ?auto_175075 ?auto_175074 ) ( not ( = ?auto_175070 ?auto_175074 ) ) ( not ( = ?auto_175070 ?auto_175075 ) ) ( not ( = ?auto_175070 ?auto_175073 ) ) ( not ( = ?auto_175070 ?auto_175071 ) ) ( not ( = ?auto_175070 ?auto_175069 ) ) ( not ( = ?auto_175070 ?auto_175068 ) ) ( not ( = ?auto_175074 ?auto_175075 ) ) ( not ( = ?auto_175074 ?auto_175073 ) ) ( not ( = ?auto_175074 ?auto_175071 ) ) ( not ( = ?auto_175074 ?auto_175069 ) ) ( not ( = ?auto_175074 ?auto_175068 ) ) ( not ( = ?auto_175075 ?auto_175073 ) ) ( not ( = ?auto_175075 ?auto_175071 ) ) ( not ( = ?auto_175075 ?auto_175069 ) ) ( not ( = ?auto_175075 ?auto_175068 ) ) ( not ( = ?auto_175073 ?auto_175071 ) ) ( not ( = ?auto_175073 ?auto_175069 ) ) ( not ( = ?auto_175073 ?auto_175068 ) ) ( not ( = ?auto_175067 ?auto_175070 ) ) ( not ( = ?auto_175067 ?auto_175074 ) ) ( not ( = ?auto_175067 ?auto_175075 ) ) ( not ( = ?auto_175067 ?auto_175073 ) ) ( ON ?auto_175067 ?auto_175072 ) ( not ( = ?auto_175067 ?auto_175072 ) ) ( not ( = ?auto_175068 ?auto_175072 ) ) ( not ( = ?auto_175069 ?auto_175072 ) ) ( not ( = ?auto_175071 ?auto_175072 ) ) ( not ( = ?auto_175070 ?auto_175072 ) ) ( not ( = ?auto_175074 ?auto_175072 ) ) ( not ( = ?auto_175075 ?auto_175072 ) ) ( not ( = ?auto_175073 ?auto_175072 ) ) ( ON ?auto_175068 ?auto_175067 ) ( ON-TABLE ?auto_175072 ) ( ON ?auto_175069 ?auto_175068 ) ( ON ?auto_175071 ?auto_175069 ) ( CLEAR ?auto_175075 ) ( ON ?auto_175073 ?auto_175071 ) ( CLEAR ?auto_175073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175072 ?auto_175067 ?auto_175068 ?auto_175069 ?auto_175071 )
      ( MAKE-3PILE ?auto_175067 ?auto_175068 ?auto_175069 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175076 - BLOCK
      ?auto_175077 - BLOCK
      ?auto_175078 - BLOCK
    )
    :vars
    (
      ?auto_175080 - BLOCK
      ?auto_175082 - BLOCK
      ?auto_175083 - BLOCK
      ?auto_175079 - BLOCK
      ?auto_175081 - BLOCK
      ?auto_175084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175076 ?auto_175077 ) ) ( not ( = ?auto_175076 ?auto_175078 ) ) ( not ( = ?auto_175077 ?auto_175078 ) ) ( not ( = ?auto_175076 ?auto_175080 ) ) ( not ( = ?auto_175077 ?auto_175080 ) ) ( not ( = ?auto_175078 ?auto_175080 ) ) ( ON-TABLE ?auto_175082 ) ( ON ?auto_175083 ?auto_175082 ) ( not ( = ?auto_175082 ?auto_175083 ) ) ( not ( = ?auto_175082 ?auto_175079 ) ) ( not ( = ?auto_175082 ?auto_175081 ) ) ( not ( = ?auto_175082 ?auto_175080 ) ) ( not ( = ?auto_175082 ?auto_175078 ) ) ( not ( = ?auto_175082 ?auto_175077 ) ) ( not ( = ?auto_175083 ?auto_175079 ) ) ( not ( = ?auto_175083 ?auto_175081 ) ) ( not ( = ?auto_175083 ?auto_175080 ) ) ( not ( = ?auto_175083 ?auto_175078 ) ) ( not ( = ?auto_175083 ?auto_175077 ) ) ( not ( = ?auto_175079 ?auto_175081 ) ) ( not ( = ?auto_175079 ?auto_175080 ) ) ( not ( = ?auto_175079 ?auto_175078 ) ) ( not ( = ?auto_175079 ?auto_175077 ) ) ( not ( = ?auto_175081 ?auto_175080 ) ) ( not ( = ?auto_175081 ?auto_175078 ) ) ( not ( = ?auto_175081 ?auto_175077 ) ) ( not ( = ?auto_175076 ?auto_175082 ) ) ( not ( = ?auto_175076 ?auto_175083 ) ) ( not ( = ?auto_175076 ?auto_175079 ) ) ( not ( = ?auto_175076 ?auto_175081 ) ) ( ON ?auto_175076 ?auto_175084 ) ( not ( = ?auto_175076 ?auto_175084 ) ) ( not ( = ?auto_175077 ?auto_175084 ) ) ( not ( = ?auto_175078 ?auto_175084 ) ) ( not ( = ?auto_175080 ?auto_175084 ) ) ( not ( = ?auto_175082 ?auto_175084 ) ) ( not ( = ?auto_175083 ?auto_175084 ) ) ( not ( = ?auto_175079 ?auto_175084 ) ) ( not ( = ?auto_175081 ?auto_175084 ) ) ( ON ?auto_175077 ?auto_175076 ) ( ON-TABLE ?auto_175084 ) ( ON ?auto_175078 ?auto_175077 ) ( ON ?auto_175080 ?auto_175078 ) ( ON ?auto_175081 ?auto_175080 ) ( CLEAR ?auto_175081 ) ( HOLDING ?auto_175079 ) ( CLEAR ?auto_175083 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175082 ?auto_175083 ?auto_175079 )
      ( MAKE-3PILE ?auto_175076 ?auto_175077 ?auto_175078 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175085 - BLOCK
      ?auto_175086 - BLOCK
      ?auto_175087 - BLOCK
    )
    :vars
    (
      ?auto_175091 - BLOCK
      ?auto_175092 - BLOCK
      ?auto_175089 - BLOCK
      ?auto_175090 - BLOCK
      ?auto_175093 - BLOCK
      ?auto_175088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175085 ?auto_175086 ) ) ( not ( = ?auto_175085 ?auto_175087 ) ) ( not ( = ?auto_175086 ?auto_175087 ) ) ( not ( = ?auto_175085 ?auto_175091 ) ) ( not ( = ?auto_175086 ?auto_175091 ) ) ( not ( = ?auto_175087 ?auto_175091 ) ) ( ON-TABLE ?auto_175092 ) ( ON ?auto_175089 ?auto_175092 ) ( not ( = ?auto_175092 ?auto_175089 ) ) ( not ( = ?auto_175092 ?auto_175090 ) ) ( not ( = ?auto_175092 ?auto_175093 ) ) ( not ( = ?auto_175092 ?auto_175091 ) ) ( not ( = ?auto_175092 ?auto_175087 ) ) ( not ( = ?auto_175092 ?auto_175086 ) ) ( not ( = ?auto_175089 ?auto_175090 ) ) ( not ( = ?auto_175089 ?auto_175093 ) ) ( not ( = ?auto_175089 ?auto_175091 ) ) ( not ( = ?auto_175089 ?auto_175087 ) ) ( not ( = ?auto_175089 ?auto_175086 ) ) ( not ( = ?auto_175090 ?auto_175093 ) ) ( not ( = ?auto_175090 ?auto_175091 ) ) ( not ( = ?auto_175090 ?auto_175087 ) ) ( not ( = ?auto_175090 ?auto_175086 ) ) ( not ( = ?auto_175093 ?auto_175091 ) ) ( not ( = ?auto_175093 ?auto_175087 ) ) ( not ( = ?auto_175093 ?auto_175086 ) ) ( not ( = ?auto_175085 ?auto_175092 ) ) ( not ( = ?auto_175085 ?auto_175089 ) ) ( not ( = ?auto_175085 ?auto_175090 ) ) ( not ( = ?auto_175085 ?auto_175093 ) ) ( ON ?auto_175085 ?auto_175088 ) ( not ( = ?auto_175085 ?auto_175088 ) ) ( not ( = ?auto_175086 ?auto_175088 ) ) ( not ( = ?auto_175087 ?auto_175088 ) ) ( not ( = ?auto_175091 ?auto_175088 ) ) ( not ( = ?auto_175092 ?auto_175088 ) ) ( not ( = ?auto_175089 ?auto_175088 ) ) ( not ( = ?auto_175090 ?auto_175088 ) ) ( not ( = ?auto_175093 ?auto_175088 ) ) ( ON ?auto_175086 ?auto_175085 ) ( ON-TABLE ?auto_175088 ) ( ON ?auto_175087 ?auto_175086 ) ( ON ?auto_175091 ?auto_175087 ) ( ON ?auto_175093 ?auto_175091 ) ( CLEAR ?auto_175089 ) ( ON ?auto_175090 ?auto_175093 ) ( CLEAR ?auto_175090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175088 ?auto_175085 ?auto_175086 ?auto_175087 ?auto_175091 ?auto_175093 )
      ( MAKE-3PILE ?auto_175085 ?auto_175086 ?auto_175087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175094 - BLOCK
      ?auto_175095 - BLOCK
      ?auto_175096 - BLOCK
    )
    :vars
    (
      ?auto_175099 - BLOCK
      ?auto_175098 - BLOCK
      ?auto_175102 - BLOCK
      ?auto_175100 - BLOCK
      ?auto_175101 - BLOCK
      ?auto_175097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175094 ?auto_175095 ) ) ( not ( = ?auto_175094 ?auto_175096 ) ) ( not ( = ?auto_175095 ?auto_175096 ) ) ( not ( = ?auto_175094 ?auto_175099 ) ) ( not ( = ?auto_175095 ?auto_175099 ) ) ( not ( = ?auto_175096 ?auto_175099 ) ) ( ON-TABLE ?auto_175098 ) ( not ( = ?auto_175098 ?auto_175102 ) ) ( not ( = ?auto_175098 ?auto_175100 ) ) ( not ( = ?auto_175098 ?auto_175101 ) ) ( not ( = ?auto_175098 ?auto_175099 ) ) ( not ( = ?auto_175098 ?auto_175096 ) ) ( not ( = ?auto_175098 ?auto_175095 ) ) ( not ( = ?auto_175102 ?auto_175100 ) ) ( not ( = ?auto_175102 ?auto_175101 ) ) ( not ( = ?auto_175102 ?auto_175099 ) ) ( not ( = ?auto_175102 ?auto_175096 ) ) ( not ( = ?auto_175102 ?auto_175095 ) ) ( not ( = ?auto_175100 ?auto_175101 ) ) ( not ( = ?auto_175100 ?auto_175099 ) ) ( not ( = ?auto_175100 ?auto_175096 ) ) ( not ( = ?auto_175100 ?auto_175095 ) ) ( not ( = ?auto_175101 ?auto_175099 ) ) ( not ( = ?auto_175101 ?auto_175096 ) ) ( not ( = ?auto_175101 ?auto_175095 ) ) ( not ( = ?auto_175094 ?auto_175098 ) ) ( not ( = ?auto_175094 ?auto_175102 ) ) ( not ( = ?auto_175094 ?auto_175100 ) ) ( not ( = ?auto_175094 ?auto_175101 ) ) ( ON ?auto_175094 ?auto_175097 ) ( not ( = ?auto_175094 ?auto_175097 ) ) ( not ( = ?auto_175095 ?auto_175097 ) ) ( not ( = ?auto_175096 ?auto_175097 ) ) ( not ( = ?auto_175099 ?auto_175097 ) ) ( not ( = ?auto_175098 ?auto_175097 ) ) ( not ( = ?auto_175102 ?auto_175097 ) ) ( not ( = ?auto_175100 ?auto_175097 ) ) ( not ( = ?auto_175101 ?auto_175097 ) ) ( ON ?auto_175095 ?auto_175094 ) ( ON-TABLE ?auto_175097 ) ( ON ?auto_175096 ?auto_175095 ) ( ON ?auto_175099 ?auto_175096 ) ( ON ?auto_175101 ?auto_175099 ) ( ON ?auto_175100 ?auto_175101 ) ( CLEAR ?auto_175100 ) ( HOLDING ?auto_175102 ) ( CLEAR ?auto_175098 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175098 ?auto_175102 )
      ( MAKE-3PILE ?auto_175094 ?auto_175095 ?auto_175096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175103 - BLOCK
      ?auto_175104 - BLOCK
      ?auto_175105 - BLOCK
    )
    :vars
    (
      ?auto_175107 - BLOCK
      ?auto_175106 - BLOCK
      ?auto_175111 - BLOCK
      ?auto_175108 - BLOCK
      ?auto_175110 - BLOCK
      ?auto_175109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175103 ?auto_175104 ) ) ( not ( = ?auto_175103 ?auto_175105 ) ) ( not ( = ?auto_175104 ?auto_175105 ) ) ( not ( = ?auto_175103 ?auto_175107 ) ) ( not ( = ?auto_175104 ?auto_175107 ) ) ( not ( = ?auto_175105 ?auto_175107 ) ) ( ON-TABLE ?auto_175106 ) ( not ( = ?auto_175106 ?auto_175111 ) ) ( not ( = ?auto_175106 ?auto_175108 ) ) ( not ( = ?auto_175106 ?auto_175110 ) ) ( not ( = ?auto_175106 ?auto_175107 ) ) ( not ( = ?auto_175106 ?auto_175105 ) ) ( not ( = ?auto_175106 ?auto_175104 ) ) ( not ( = ?auto_175111 ?auto_175108 ) ) ( not ( = ?auto_175111 ?auto_175110 ) ) ( not ( = ?auto_175111 ?auto_175107 ) ) ( not ( = ?auto_175111 ?auto_175105 ) ) ( not ( = ?auto_175111 ?auto_175104 ) ) ( not ( = ?auto_175108 ?auto_175110 ) ) ( not ( = ?auto_175108 ?auto_175107 ) ) ( not ( = ?auto_175108 ?auto_175105 ) ) ( not ( = ?auto_175108 ?auto_175104 ) ) ( not ( = ?auto_175110 ?auto_175107 ) ) ( not ( = ?auto_175110 ?auto_175105 ) ) ( not ( = ?auto_175110 ?auto_175104 ) ) ( not ( = ?auto_175103 ?auto_175106 ) ) ( not ( = ?auto_175103 ?auto_175111 ) ) ( not ( = ?auto_175103 ?auto_175108 ) ) ( not ( = ?auto_175103 ?auto_175110 ) ) ( ON ?auto_175103 ?auto_175109 ) ( not ( = ?auto_175103 ?auto_175109 ) ) ( not ( = ?auto_175104 ?auto_175109 ) ) ( not ( = ?auto_175105 ?auto_175109 ) ) ( not ( = ?auto_175107 ?auto_175109 ) ) ( not ( = ?auto_175106 ?auto_175109 ) ) ( not ( = ?auto_175111 ?auto_175109 ) ) ( not ( = ?auto_175108 ?auto_175109 ) ) ( not ( = ?auto_175110 ?auto_175109 ) ) ( ON ?auto_175104 ?auto_175103 ) ( ON-TABLE ?auto_175109 ) ( ON ?auto_175105 ?auto_175104 ) ( ON ?auto_175107 ?auto_175105 ) ( ON ?auto_175110 ?auto_175107 ) ( ON ?auto_175108 ?auto_175110 ) ( CLEAR ?auto_175106 ) ( ON ?auto_175111 ?auto_175108 ) ( CLEAR ?auto_175111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175109 ?auto_175103 ?auto_175104 ?auto_175105 ?auto_175107 ?auto_175110 ?auto_175108 )
      ( MAKE-3PILE ?auto_175103 ?auto_175104 ?auto_175105 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175112 - BLOCK
      ?auto_175113 - BLOCK
      ?auto_175114 - BLOCK
    )
    :vars
    (
      ?auto_175120 - BLOCK
      ?auto_175118 - BLOCK
      ?auto_175119 - BLOCK
      ?auto_175116 - BLOCK
      ?auto_175117 - BLOCK
      ?auto_175115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175112 ?auto_175113 ) ) ( not ( = ?auto_175112 ?auto_175114 ) ) ( not ( = ?auto_175113 ?auto_175114 ) ) ( not ( = ?auto_175112 ?auto_175120 ) ) ( not ( = ?auto_175113 ?auto_175120 ) ) ( not ( = ?auto_175114 ?auto_175120 ) ) ( not ( = ?auto_175118 ?auto_175119 ) ) ( not ( = ?auto_175118 ?auto_175116 ) ) ( not ( = ?auto_175118 ?auto_175117 ) ) ( not ( = ?auto_175118 ?auto_175120 ) ) ( not ( = ?auto_175118 ?auto_175114 ) ) ( not ( = ?auto_175118 ?auto_175113 ) ) ( not ( = ?auto_175119 ?auto_175116 ) ) ( not ( = ?auto_175119 ?auto_175117 ) ) ( not ( = ?auto_175119 ?auto_175120 ) ) ( not ( = ?auto_175119 ?auto_175114 ) ) ( not ( = ?auto_175119 ?auto_175113 ) ) ( not ( = ?auto_175116 ?auto_175117 ) ) ( not ( = ?auto_175116 ?auto_175120 ) ) ( not ( = ?auto_175116 ?auto_175114 ) ) ( not ( = ?auto_175116 ?auto_175113 ) ) ( not ( = ?auto_175117 ?auto_175120 ) ) ( not ( = ?auto_175117 ?auto_175114 ) ) ( not ( = ?auto_175117 ?auto_175113 ) ) ( not ( = ?auto_175112 ?auto_175118 ) ) ( not ( = ?auto_175112 ?auto_175119 ) ) ( not ( = ?auto_175112 ?auto_175116 ) ) ( not ( = ?auto_175112 ?auto_175117 ) ) ( ON ?auto_175112 ?auto_175115 ) ( not ( = ?auto_175112 ?auto_175115 ) ) ( not ( = ?auto_175113 ?auto_175115 ) ) ( not ( = ?auto_175114 ?auto_175115 ) ) ( not ( = ?auto_175120 ?auto_175115 ) ) ( not ( = ?auto_175118 ?auto_175115 ) ) ( not ( = ?auto_175119 ?auto_175115 ) ) ( not ( = ?auto_175116 ?auto_175115 ) ) ( not ( = ?auto_175117 ?auto_175115 ) ) ( ON ?auto_175113 ?auto_175112 ) ( ON-TABLE ?auto_175115 ) ( ON ?auto_175114 ?auto_175113 ) ( ON ?auto_175120 ?auto_175114 ) ( ON ?auto_175117 ?auto_175120 ) ( ON ?auto_175116 ?auto_175117 ) ( ON ?auto_175119 ?auto_175116 ) ( CLEAR ?auto_175119 ) ( HOLDING ?auto_175118 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175118 )
      ( MAKE-3PILE ?auto_175112 ?auto_175113 ?auto_175114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175121 - BLOCK
      ?auto_175122 - BLOCK
      ?auto_175123 - BLOCK
    )
    :vars
    (
      ?auto_175124 - BLOCK
      ?auto_175129 - BLOCK
      ?auto_175126 - BLOCK
      ?auto_175125 - BLOCK
      ?auto_175128 - BLOCK
      ?auto_175127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175121 ?auto_175122 ) ) ( not ( = ?auto_175121 ?auto_175123 ) ) ( not ( = ?auto_175122 ?auto_175123 ) ) ( not ( = ?auto_175121 ?auto_175124 ) ) ( not ( = ?auto_175122 ?auto_175124 ) ) ( not ( = ?auto_175123 ?auto_175124 ) ) ( not ( = ?auto_175129 ?auto_175126 ) ) ( not ( = ?auto_175129 ?auto_175125 ) ) ( not ( = ?auto_175129 ?auto_175128 ) ) ( not ( = ?auto_175129 ?auto_175124 ) ) ( not ( = ?auto_175129 ?auto_175123 ) ) ( not ( = ?auto_175129 ?auto_175122 ) ) ( not ( = ?auto_175126 ?auto_175125 ) ) ( not ( = ?auto_175126 ?auto_175128 ) ) ( not ( = ?auto_175126 ?auto_175124 ) ) ( not ( = ?auto_175126 ?auto_175123 ) ) ( not ( = ?auto_175126 ?auto_175122 ) ) ( not ( = ?auto_175125 ?auto_175128 ) ) ( not ( = ?auto_175125 ?auto_175124 ) ) ( not ( = ?auto_175125 ?auto_175123 ) ) ( not ( = ?auto_175125 ?auto_175122 ) ) ( not ( = ?auto_175128 ?auto_175124 ) ) ( not ( = ?auto_175128 ?auto_175123 ) ) ( not ( = ?auto_175128 ?auto_175122 ) ) ( not ( = ?auto_175121 ?auto_175129 ) ) ( not ( = ?auto_175121 ?auto_175126 ) ) ( not ( = ?auto_175121 ?auto_175125 ) ) ( not ( = ?auto_175121 ?auto_175128 ) ) ( ON ?auto_175121 ?auto_175127 ) ( not ( = ?auto_175121 ?auto_175127 ) ) ( not ( = ?auto_175122 ?auto_175127 ) ) ( not ( = ?auto_175123 ?auto_175127 ) ) ( not ( = ?auto_175124 ?auto_175127 ) ) ( not ( = ?auto_175129 ?auto_175127 ) ) ( not ( = ?auto_175126 ?auto_175127 ) ) ( not ( = ?auto_175125 ?auto_175127 ) ) ( not ( = ?auto_175128 ?auto_175127 ) ) ( ON ?auto_175122 ?auto_175121 ) ( ON-TABLE ?auto_175127 ) ( ON ?auto_175123 ?auto_175122 ) ( ON ?auto_175124 ?auto_175123 ) ( ON ?auto_175128 ?auto_175124 ) ( ON ?auto_175125 ?auto_175128 ) ( ON ?auto_175126 ?auto_175125 ) ( ON ?auto_175129 ?auto_175126 ) ( CLEAR ?auto_175129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175127 ?auto_175121 ?auto_175122 ?auto_175123 ?auto_175124 ?auto_175128 ?auto_175125 ?auto_175126 )
      ( MAKE-3PILE ?auto_175121 ?auto_175122 ?auto_175123 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175153 - BLOCK
      ?auto_175154 - BLOCK
      ?auto_175155 - BLOCK
      ?auto_175156 - BLOCK
    )
    :vars
    (
      ?auto_175158 - BLOCK
      ?auto_175159 - BLOCK
      ?auto_175157 - BLOCK
      ?auto_175160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175158 ?auto_175156 ) ( ON-TABLE ?auto_175153 ) ( ON ?auto_175154 ?auto_175153 ) ( ON ?auto_175155 ?auto_175154 ) ( ON ?auto_175156 ?auto_175155 ) ( not ( = ?auto_175153 ?auto_175154 ) ) ( not ( = ?auto_175153 ?auto_175155 ) ) ( not ( = ?auto_175153 ?auto_175156 ) ) ( not ( = ?auto_175153 ?auto_175158 ) ) ( not ( = ?auto_175154 ?auto_175155 ) ) ( not ( = ?auto_175154 ?auto_175156 ) ) ( not ( = ?auto_175154 ?auto_175158 ) ) ( not ( = ?auto_175155 ?auto_175156 ) ) ( not ( = ?auto_175155 ?auto_175158 ) ) ( not ( = ?auto_175156 ?auto_175158 ) ) ( not ( = ?auto_175153 ?auto_175159 ) ) ( not ( = ?auto_175153 ?auto_175157 ) ) ( not ( = ?auto_175154 ?auto_175159 ) ) ( not ( = ?auto_175154 ?auto_175157 ) ) ( not ( = ?auto_175155 ?auto_175159 ) ) ( not ( = ?auto_175155 ?auto_175157 ) ) ( not ( = ?auto_175156 ?auto_175159 ) ) ( not ( = ?auto_175156 ?auto_175157 ) ) ( not ( = ?auto_175158 ?auto_175159 ) ) ( not ( = ?auto_175158 ?auto_175157 ) ) ( not ( = ?auto_175159 ?auto_175157 ) ) ( ON ?auto_175159 ?auto_175158 ) ( CLEAR ?auto_175159 ) ( HOLDING ?auto_175157 ) ( CLEAR ?auto_175160 ) ( ON-TABLE ?auto_175160 ) ( not ( = ?auto_175160 ?auto_175157 ) ) ( not ( = ?auto_175153 ?auto_175160 ) ) ( not ( = ?auto_175154 ?auto_175160 ) ) ( not ( = ?auto_175155 ?auto_175160 ) ) ( not ( = ?auto_175156 ?auto_175160 ) ) ( not ( = ?auto_175158 ?auto_175160 ) ) ( not ( = ?auto_175159 ?auto_175160 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175160 ?auto_175157 )
      ( MAKE-4PILE ?auto_175153 ?auto_175154 ?auto_175155 ?auto_175156 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175161 - BLOCK
      ?auto_175162 - BLOCK
      ?auto_175163 - BLOCK
      ?auto_175164 - BLOCK
    )
    :vars
    (
      ?auto_175167 - BLOCK
      ?auto_175166 - BLOCK
      ?auto_175168 - BLOCK
      ?auto_175165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175167 ?auto_175164 ) ( ON-TABLE ?auto_175161 ) ( ON ?auto_175162 ?auto_175161 ) ( ON ?auto_175163 ?auto_175162 ) ( ON ?auto_175164 ?auto_175163 ) ( not ( = ?auto_175161 ?auto_175162 ) ) ( not ( = ?auto_175161 ?auto_175163 ) ) ( not ( = ?auto_175161 ?auto_175164 ) ) ( not ( = ?auto_175161 ?auto_175167 ) ) ( not ( = ?auto_175162 ?auto_175163 ) ) ( not ( = ?auto_175162 ?auto_175164 ) ) ( not ( = ?auto_175162 ?auto_175167 ) ) ( not ( = ?auto_175163 ?auto_175164 ) ) ( not ( = ?auto_175163 ?auto_175167 ) ) ( not ( = ?auto_175164 ?auto_175167 ) ) ( not ( = ?auto_175161 ?auto_175166 ) ) ( not ( = ?auto_175161 ?auto_175168 ) ) ( not ( = ?auto_175162 ?auto_175166 ) ) ( not ( = ?auto_175162 ?auto_175168 ) ) ( not ( = ?auto_175163 ?auto_175166 ) ) ( not ( = ?auto_175163 ?auto_175168 ) ) ( not ( = ?auto_175164 ?auto_175166 ) ) ( not ( = ?auto_175164 ?auto_175168 ) ) ( not ( = ?auto_175167 ?auto_175166 ) ) ( not ( = ?auto_175167 ?auto_175168 ) ) ( not ( = ?auto_175166 ?auto_175168 ) ) ( ON ?auto_175166 ?auto_175167 ) ( CLEAR ?auto_175165 ) ( ON-TABLE ?auto_175165 ) ( not ( = ?auto_175165 ?auto_175168 ) ) ( not ( = ?auto_175161 ?auto_175165 ) ) ( not ( = ?auto_175162 ?auto_175165 ) ) ( not ( = ?auto_175163 ?auto_175165 ) ) ( not ( = ?auto_175164 ?auto_175165 ) ) ( not ( = ?auto_175167 ?auto_175165 ) ) ( not ( = ?auto_175166 ?auto_175165 ) ) ( ON ?auto_175168 ?auto_175166 ) ( CLEAR ?auto_175168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175161 ?auto_175162 ?auto_175163 ?auto_175164 ?auto_175167 ?auto_175166 )
      ( MAKE-4PILE ?auto_175161 ?auto_175162 ?auto_175163 ?auto_175164 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175169 - BLOCK
      ?auto_175170 - BLOCK
      ?auto_175171 - BLOCK
      ?auto_175172 - BLOCK
    )
    :vars
    (
      ?auto_175174 - BLOCK
      ?auto_175173 - BLOCK
      ?auto_175175 - BLOCK
      ?auto_175176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175174 ?auto_175172 ) ( ON-TABLE ?auto_175169 ) ( ON ?auto_175170 ?auto_175169 ) ( ON ?auto_175171 ?auto_175170 ) ( ON ?auto_175172 ?auto_175171 ) ( not ( = ?auto_175169 ?auto_175170 ) ) ( not ( = ?auto_175169 ?auto_175171 ) ) ( not ( = ?auto_175169 ?auto_175172 ) ) ( not ( = ?auto_175169 ?auto_175174 ) ) ( not ( = ?auto_175170 ?auto_175171 ) ) ( not ( = ?auto_175170 ?auto_175172 ) ) ( not ( = ?auto_175170 ?auto_175174 ) ) ( not ( = ?auto_175171 ?auto_175172 ) ) ( not ( = ?auto_175171 ?auto_175174 ) ) ( not ( = ?auto_175172 ?auto_175174 ) ) ( not ( = ?auto_175169 ?auto_175173 ) ) ( not ( = ?auto_175169 ?auto_175175 ) ) ( not ( = ?auto_175170 ?auto_175173 ) ) ( not ( = ?auto_175170 ?auto_175175 ) ) ( not ( = ?auto_175171 ?auto_175173 ) ) ( not ( = ?auto_175171 ?auto_175175 ) ) ( not ( = ?auto_175172 ?auto_175173 ) ) ( not ( = ?auto_175172 ?auto_175175 ) ) ( not ( = ?auto_175174 ?auto_175173 ) ) ( not ( = ?auto_175174 ?auto_175175 ) ) ( not ( = ?auto_175173 ?auto_175175 ) ) ( ON ?auto_175173 ?auto_175174 ) ( not ( = ?auto_175176 ?auto_175175 ) ) ( not ( = ?auto_175169 ?auto_175176 ) ) ( not ( = ?auto_175170 ?auto_175176 ) ) ( not ( = ?auto_175171 ?auto_175176 ) ) ( not ( = ?auto_175172 ?auto_175176 ) ) ( not ( = ?auto_175174 ?auto_175176 ) ) ( not ( = ?auto_175173 ?auto_175176 ) ) ( ON ?auto_175175 ?auto_175173 ) ( CLEAR ?auto_175175 ) ( HOLDING ?auto_175176 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175176 )
      ( MAKE-4PILE ?auto_175169 ?auto_175170 ?auto_175171 ?auto_175172 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175189 - BLOCK
      ?auto_175190 - BLOCK
      ?auto_175191 - BLOCK
      ?auto_175192 - BLOCK
    )
    :vars
    (
      ?auto_175193 - BLOCK
      ?auto_175194 - BLOCK
      ?auto_175196 - BLOCK
      ?auto_175195 - BLOCK
      ?auto_175197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175193 ?auto_175192 ) ( ON-TABLE ?auto_175189 ) ( ON ?auto_175190 ?auto_175189 ) ( ON ?auto_175191 ?auto_175190 ) ( ON ?auto_175192 ?auto_175191 ) ( not ( = ?auto_175189 ?auto_175190 ) ) ( not ( = ?auto_175189 ?auto_175191 ) ) ( not ( = ?auto_175189 ?auto_175192 ) ) ( not ( = ?auto_175189 ?auto_175193 ) ) ( not ( = ?auto_175190 ?auto_175191 ) ) ( not ( = ?auto_175190 ?auto_175192 ) ) ( not ( = ?auto_175190 ?auto_175193 ) ) ( not ( = ?auto_175191 ?auto_175192 ) ) ( not ( = ?auto_175191 ?auto_175193 ) ) ( not ( = ?auto_175192 ?auto_175193 ) ) ( not ( = ?auto_175189 ?auto_175194 ) ) ( not ( = ?auto_175189 ?auto_175196 ) ) ( not ( = ?auto_175190 ?auto_175194 ) ) ( not ( = ?auto_175190 ?auto_175196 ) ) ( not ( = ?auto_175191 ?auto_175194 ) ) ( not ( = ?auto_175191 ?auto_175196 ) ) ( not ( = ?auto_175192 ?auto_175194 ) ) ( not ( = ?auto_175192 ?auto_175196 ) ) ( not ( = ?auto_175193 ?auto_175194 ) ) ( not ( = ?auto_175193 ?auto_175196 ) ) ( not ( = ?auto_175194 ?auto_175196 ) ) ( ON ?auto_175194 ?auto_175193 ) ( not ( = ?auto_175195 ?auto_175196 ) ) ( not ( = ?auto_175189 ?auto_175195 ) ) ( not ( = ?auto_175190 ?auto_175195 ) ) ( not ( = ?auto_175191 ?auto_175195 ) ) ( not ( = ?auto_175192 ?auto_175195 ) ) ( not ( = ?auto_175193 ?auto_175195 ) ) ( not ( = ?auto_175194 ?auto_175195 ) ) ( ON ?auto_175196 ?auto_175194 ) ( CLEAR ?auto_175196 ) ( ON ?auto_175195 ?auto_175197 ) ( CLEAR ?auto_175195 ) ( HAND-EMPTY ) ( not ( = ?auto_175189 ?auto_175197 ) ) ( not ( = ?auto_175190 ?auto_175197 ) ) ( not ( = ?auto_175191 ?auto_175197 ) ) ( not ( = ?auto_175192 ?auto_175197 ) ) ( not ( = ?auto_175193 ?auto_175197 ) ) ( not ( = ?auto_175194 ?auto_175197 ) ) ( not ( = ?auto_175196 ?auto_175197 ) ) ( not ( = ?auto_175195 ?auto_175197 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175195 ?auto_175197 )
      ( MAKE-4PILE ?auto_175189 ?auto_175190 ?auto_175191 ?auto_175192 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175198 - BLOCK
      ?auto_175199 - BLOCK
      ?auto_175200 - BLOCK
      ?auto_175201 - BLOCK
    )
    :vars
    (
      ?auto_175206 - BLOCK
      ?auto_175203 - BLOCK
      ?auto_175205 - BLOCK
      ?auto_175204 - BLOCK
      ?auto_175202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175206 ?auto_175201 ) ( ON-TABLE ?auto_175198 ) ( ON ?auto_175199 ?auto_175198 ) ( ON ?auto_175200 ?auto_175199 ) ( ON ?auto_175201 ?auto_175200 ) ( not ( = ?auto_175198 ?auto_175199 ) ) ( not ( = ?auto_175198 ?auto_175200 ) ) ( not ( = ?auto_175198 ?auto_175201 ) ) ( not ( = ?auto_175198 ?auto_175206 ) ) ( not ( = ?auto_175199 ?auto_175200 ) ) ( not ( = ?auto_175199 ?auto_175201 ) ) ( not ( = ?auto_175199 ?auto_175206 ) ) ( not ( = ?auto_175200 ?auto_175201 ) ) ( not ( = ?auto_175200 ?auto_175206 ) ) ( not ( = ?auto_175201 ?auto_175206 ) ) ( not ( = ?auto_175198 ?auto_175203 ) ) ( not ( = ?auto_175198 ?auto_175205 ) ) ( not ( = ?auto_175199 ?auto_175203 ) ) ( not ( = ?auto_175199 ?auto_175205 ) ) ( not ( = ?auto_175200 ?auto_175203 ) ) ( not ( = ?auto_175200 ?auto_175205 ) ) ( not ( = ?auto_175201 ?auto_175203 ) ) ( not ( = ?auto_175201 ?auto_175205 ) ) ( not ( = ?auto_175206 ?auto_175203 ) ) ( not ( = ?auto_175206 ?auto_175205 ) ) ( not ( = ?auto_175203 ?auto_175205 ) ) ( ON ?auto_175203 ?auto_175206 ) ( not ( = ?auto_175204 ?auto_175205 ) ) ( not ( = ?auto_175198 ?auto_175204 ) ) ( not ( = ?auto_175199 ?auto_175204 ) ) ( not ( = ?auto_175200 ?auto_175204 ) ) ( not ( = ?auto_175201 ?auto_175204 ) ) ( not ( = ?auto_175206 ?auto_175204 ) ) ( not ( = ?auto_175203 ?auto_175204 ) ) ( ON ?auto_175204 ?auto_175202 ) ( CLEAR ?auto_175204 ) ( not ( = ?auto_175198 ?auto_175202 ) ) ( not ( = ?auto_175199 ?auto_175202 ) ) ( not ( = ?auto_175200 ?auto_175202 ) ) ( not ( = ?auto_175201 ?auto_175202 ) ) ( not ( = ?auto_175206 ?auto_175202 ) ) ( not ( = ?auto_175203 ?auto_175202 ) ) ( not ( = ?auto_175205 ?auto_175202 ) ) ( not ( = ?auto_175204 ?auto_175202 ) ) ( HOLDING ?auto_175205 ) ( CLEAR ?auto_175203 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175198 ?auto_175199 ?auto_175200 ?auto_175201 ?auto_175206 ?auto_175203 ?auto_175205 )
      ( MAKE-4PILE ?auto_175198 ?auto_175199 ?auto_175200 ?auto_175201 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175280 - BLOCK
      ?auto_175281 - BLOCK
      ?auto_175282 - BLOCK
      ?auto_175283 - BLOCK
    )
    :vars
    (
      ?auto_175284 - BLOCK
      ?auto_175286 - BLOCK
      ?auto_175287 - BLOCK
      ?auto_175285 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175280 ) ( ON ?auto_175281 ?auto_175280 ) ( not ( = ?auto_175280 ?auto_175281 ) ) ( not ( = ?auto_175280 ?auto_175282 ) ) ( not ( = ?auto_175280 ?auto_175283 ) ) ( not ( = ?auto_175281 ?auto_175282 ) ) ( not ( = ?auto_175281 ?auto_175283 ) ) ( not ( = ?auto_175282 ?auto_175283 ) ) ( ON ?auto_175283 ?auto_175284 ) ( not ( = ?auto_175280 ?auto_175284 ) ) ( not ( = ?auto_175281 ?auto_175284 ) ) ( not ( = ?auto_175282 ?auto_175284 ) ) ( not ( = ?auto_175283 ?auto_175284 ) ) ( CLEAR ?auto_175281 ) ( ON ?auto_175282 ?auto_175283 ) ( CLEAR ?auto_175282 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175286 ) ( ON ?auto_175287 ?auto_175286 ) ( ON ?auto_175285 ?auto_175287 ) ( ON ?auto_175284 ?auto_175285 ) ( not ( = ?auto_175286 ?auto_175287 ) ) ( not ( = ?auto_175286 ?auto_175285 ) ) ( not ( = ?auto_175286 ?auto_175284 ) ) ( not ( = ?auto_175286 ?auto_175283 ) ) ( not ( = ?auto_175286 ?auto_175282 ) ) ( not ( = ?auto_175287 ?auto_175285 ) ) ( not ( = ?auto_175287 ?auto_175284 ) ) ( not ( = ?auto_175287 ?auto_175283 ) ) ( not ( = ?auto_175287 ?auto_175282 ) ) ( not ( = ?auto_175285 ?auto_175284 ) ) ( not ( = ?auto_175285 ?auto_175283 ) ) ( not ( = ?auto_175285 ?auto_175282 ) ) ( not ( = ?auto_175280 ?auto_175286 ) ) ( not ( = ?auto_175280 ?auto_175287 ) ) ( not ( = ?auto_175280 ?auto_175285 ) ) ( not ( = ?auto_175281 ?auto_175286 ) ) ( not ( = ?auto_175281 ?auto_175287 ) ) ( not ( = ?auto_175281 ?auto_175285 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175286 ?auto_175287 ?auto_175285 ?auto_175284 ?auto_175283 )
      ( MAKE-4PILE ?auto_175280 ?auto_175281 ?auto_175282 ?auto_175283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175288 - BLOCK
      ?auto_175289 - BLOCK
      ?auto_175290 - BLOCK
      ?auto_175291 - BLOCK
    )
    :vars
    (
      ?auto_175292 - BLOCK
      ?auto_175295 - BLOCK
      ?auto_175293 - BLOCK
      ?auto_175294 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175288 ) ( not ( = ?auto_175288 ?auto_175289 ) ) ( not ( = ?auto_175288 ?auto_175290 ) ) ( not ( = ?auto_175288 ?auto_175291 ) ) ( not ( = ?auto_175289 ?auto_175290 ) ) ( not ( = ?auto_175289 ?auto_175291 ) ) ( not ( = ?auto_175290 ?auto_175291 ) ) ( ON ?auto_175291 ?auto_175292 ) ( not ( = ?auto_175288 ?auto_175292 ) ) ( not ( = ?auto_175289 ?auto_175292 ) ) ( not ( = ?auto_175290 ?auto_175292 ) ) ( not ( = ?auto_175291 ?auto_175292 ) ) ( ON ?auto_175290 ?auto_175291 ) ( CLEAR ?auto_175290 ) ( ON-TABLE ?auto_175295 ) ( ON ?auto_175293 ?auto_175295 ) ( ON ?auto_175294 ?auto_175293 ) ( ON ?auto_175292 ?auto_175294 ) ( not ( = ?auto_175295 ?auto_175293 ) ) ( not ( = ?auto_175295 ?auto_175294 ) ) ( not ( = ?auto_175295 ?auto_175292 ) ) ( not ( = ?auto_175295 ?auto_175291 ) ) ( not ( = ?auto_175295 ?auto_175290 ) ) ( not ( = ?auto_175293 ?auto_175294 ) ) ( not ( = ?auto_175293 ?auto_175292 ) ) ( not ( = ?auto_175293 ?auto_175291 ) ) ( not ( = ?auto_175293 ?auto_175290 ) ) ( not ( = ?auto_175294 ?auto_175292 ) ) ( not ( = ?auto_175294 ?auto_175291 ) ) ( not ( = ?auto_175294 ?auto_175290 ) ) ( not ( = ?auto_175288 ?auto_175295 ) ) ( not ( = ?auto_175288 ?auto_175293 ) ) ( not ( = ?auto_175288 ?auto_175294 ) ) ( not ( = ?auto_175289 ?auto_175295 ) ) ( not ( = ?auto_175289 ?auto_175293 ) ) ( not ( = ?auto_175289 ?auto_175294 ) ) ( HOLDING ?auto_175289 ) ( CLEAR ?auto_175288 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175288 ?auto_175289 )
      ( MAKE-4PILE ?auto_175288 ?auto_175289 ?auto_175290 ?auto_175291 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175296 - BLOCK
      ?auto_175297 - BLOCK
      ?auto_175298 - BLOCK
      ?auto_175299 - BLOCK
    )
    :vars
    (
      ?auto_175300 - BLOCK
      ?auto_175303 - BLOCK
      ?auto_175301 - BLOCK
      ?auto_175302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175296 ) ( not ( = ?auto_175296 ?auto_175297 ) ) ( not ( = ?auto_175296 ?auto_175298 ) ) ( not ( = ?auto_175296 ?auto_175299 ) ) ( not ( = ?auto_175297 ?auto_175298 ) ) ( not ( = ?auto_175297 ?auto_175299 ) ) ( not ( = ?auto_175298 ?auto_175299 ) ) ( ON ?auto_175299 ?auto_175300 ) ( not ( = ?auto_175296 ?auto_175300 ) ) ( not ( = ?auto_175297 ?auto_175300 ) ) ( not ( = ?auto_175298 ?auto_175300 ) ) ( not ( = ?auto_175299 ?auto_175300 ) ) ( ON ?auto_175298 ?auto_175299 ) ( ON-TABLE ?auto_175303 ) ( ON ?auto_175301 ?auto_175303 ) ( ON ?auto_175302 ?auto_175301 ) ( ON ?auto_175300 ?auto_175302 ) ( not ( = ?auto_175303 ?auto_175301 ) ) ( not ( = ?auto_175303 ?auto_175302 ) ) ( not ( = ?auto_175303 ?auto_175300 ) ) ( not ( = ?auto_175303 ?auto_175299 ) ) ( not ( = ?auto_175303 ?auto_175298 ) ) ( not ( = ?auto_175301 ?auto_175302 ) ) ( not ( = ?auto_175301 ?auto_175300 ) ) ( not ( = ?auto_175301 ?auto_175299 ) ) ( not ( = ?auto_175301 ?auto_175298 ) ) ( not ( = ?auto_175302 ?auto_175300 ) ) ( not ( = ?auto_175302 ?auto_175299 ) ) ( not ( = ?auto_175302 ?auto_175298 ) ) ( not ( = ?auto_175296 ?auto_175303 ) ) ( not ( = ?auto_175296 ?auto_175301 ) ) ( not ( = ?auto_175296 ?auto_175302 ) ) ( not ( = ?auto_175297 ?auto_175303 ) ) ( not ( = ?auto_175297 ?auto_175301 ) ) ( not ( = ?auto_175297 ?auto_175302 ) ) ( CLEAR ?auto_175296 ) ( ON ?auto_175297 ?auto_175298 ) ( CLEAR ?auto_175297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175303 ?auto_175301 ?auto_175302 ?auto_175300 ?auto_175299 ?auto_175298 )
      ( MAKE-4PILE ?auto_175296 ?auto_175297 ?auto_175298 ?auto_175299 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175304 - BLOCK
      ?auto_175305 - BLOCK
      ?auto_175306 - BLOCK
      ?auto_175307 - BLOCK
    )
    :vars
    (
      ?auto_175309 - BLOCK
      ?auto_175311 - BLOCK
      ?auto_175310 - BLOCK
      ?auto_175308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175304 ?auto_175305 ) ) ( not ( = ?auto_175304 ?auto_175306 ) ) ( not ( = ?auto_175304 ?auto_175307 ) ) ( not ( = ?auto_175305 ?auto_175306 ) ) ( not ( = ?auto_175305 ?auto_175307 ) ) ( not ( = ?auto_175306 ?auto_175307 ) ) ( ON ?auto_175307 ?auto_175309 ) ( not ( = ?auto_175304 ?auto_175309 ) ) ( not ( = ?auto_175305 ?auto_175309 ) ) ( not ( = ?auto_175306 ?auto_175309 ) ) ( not ( = ?auto_175307 ?auto_175309 ) ) ( ON ?auto_175306 ?auto_175307 ) ( ON-TABLE ?auto_175311 ) ( ON ?auto_175310 ?auto_175311 ) ( ON ?auto_175308 ?auto_175310 ) ( ON ?auto_175309 ?auto_175308 ) ( not ( = ?auto_175311 ?auto_175310 ) ) ( not ( = ?auto_175311 ?auto_175308 ) ) ( not ( = ?auto_175311 ?auto_175309 ) ) ( not ( = ?auto_175311 ?auto_175307 ) ) ( not ( = ?auto_175311 ?auto_175306 ) ) ( not ( = ?auto_175310 ?auto_175308 ) ) ( not ( = ?auto_175310 ?auto_175309 ) ) ( not ( = ?auto_175310 ?auto_175307 ) ) ( not ( = ?auto_175310 ?auto_175306 ) ) ( not ( = ?auto_175308 ?auto_175309 ) ) ( not ( = ?auto_175308 ?auto_175307 ) ) ( not ( = ?auto_175308 ?auto_175306 ) ) ( not ( = ?auto_175304 ?auto_175311 ) ) ( not ( = ?auto_175304 ?auto_175310 ) ) ( not ( = ?auto_175304 ?auto_175308 ) ) ( not ( = ?auto_175305 ?auto_175311 ) ) ( not ( = ?auto_175305 ?auto_175310 ) ) ( not ( = ?auto_175305 ?auto_175308 ) ) ( ON ?auto_175305 ?auto_175306 ) ( CLEAR ?auto_175305 ) ( HOLDING ?auto_175304 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175304 )
      ( MAKE-4PILE ?auto_175304 ?auto_175305 ?auto_175306 ?auto_175307 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175312 - BLOCK
      ?auto_175313 - BLOCK
      ?auto_175314 - BLOCK
      ?auto_175315 - BLOCK
    )
    :vars
    (
      ?auto_175318 - BLOCK
      ?auto_175317 - BLOCK
      ?auto_175316 - BLOCK
      ?auto_175319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175312 ?auto_175313 ) ) ( not ( = ?auto_175312 ?auto_175314 ) ) ( not ( = ?auto_175312 ?auto_175315 ) ) ( not ( = ?auto_175313 ?auto_175314 ) ) ( not ( = ?auto_175313 ?auto_175315 ) ) ( not ( = ?auto_175314 ?auto_175315 ) ) ( ON ?auto_175315 ?auto_175318 ) ( not ( = ?auto_175312 ?auto_175318 ) ) ( not ( = ?auto_175313 ?auto_175318 ) ) ( not ( = ?auto_175314 ?auto_175318 ) ) ( not ( = ?auto_175315 ?auto_175318 ) ) ( ON ?auto_175314 ?auto_175315 ) ( ON-TABLE ?auto_175317 ) ( ON ?auto_175316 ?auto_175317 ) ( ON ?auto_175319 ?auto_175316 ) ( ON ?auto_175318 ?auto_175319 ) ( not ( = ?auto_175317 ?auto_175316 ) ) ( not ( = ?auto_175317 ?auto_175319 ) ) ( not ( = ?auto_175317 ?auto_175318 ) ) ( not ( = ?auto_175317 ?auto_175315 ) ) ( not ( = ?auto_175317 ?auto_175314 ) ) ( not ( = ?auto_175316 ?auto_175319 ) ) ( not ( = ?auto_175316 ?auto_175318 ) ) ( not ( = ?auto_175316 ?auto_175315 ) ) ( not ( = ?auto_175316 ?auto_175314 ) ) ( not ( = ?auto_175319 ?auto_175318 ) ) ( not ( = ?auto_175319 ?auto_175315 ) ) ( not ( = ?auto_175319 ?auto_175314 ) ) ( not ( = ?auto_175312 ?auto_175317 ) ) ( not ( = ?auto_175312 ?auto_175316 ) ) ( not ( = ?auto_175312 ?auto_175319 ) ) ( not ( = ?auto_175313 ?auto_175317 ) ) ( not ( = ?auto_175313 ?auto_175316 ) ) ( not ( = ?auto_175313 ?auto_175319 ) ) ( ON ?auto_175313 ?auto_175314 ) ( ON ?auto_175312 ?auto_175313 ) ( CLEAR ?auto_175312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175317 ?auto_175316 ?auto_175319 ?auto_175318 ?auto_175315 ?auto_175314 ?auto_175313 )
      ( MAKE-4PILE ?auto_175312 ?auto_175313 ?auto_175314 ?auto_175315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175324 - BLOCK
      ?auto_175325 - BLOCK
      ?auto_175326 - BLOCK
      ?auto_175327 - BLOCK
    )
    :vars
    (
      ?auto_175328 - BLOCK
      ?auto_175330 - BLOCK
      ?auto_175329 - BLOCK
      ?auto_175331 - BLOCK
      ?auto_175332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175324 ?auto_175325 ) ) ( not ( = ?auto_175324 ?auto_175326 ) ) ( not ( = ?auto_175324 ?auto_175327 ) ) ( not ( = ?auto_175325 ?auto_175326 ) ) ( not ( = ?auto_175325 ?auto_175327 ) ) ( not ( = ?auto_175326 ?auto_175327 ) ) ( ON ?auto_175327 ?auto_175328 ) ( not ( = ?auto_175324 ?auto_175328 ) ) ( not ( = ?auto_175325 ?auto_175328 ) ) ( not ( = ?auto_175326 ?auto_175328 ) ) ( not ( = ?auto_175327 ?auto_175328 ) ) ( ON ?auto_175326 ?auto_175327 ) ( ON-TABLE ?auto_175330 ) ( ON ?auto_175329 ?auto_175330 ) ( ON ?auto_175331 ?auto_175329 ) ( ON ?auto_175328 ?auto_175331 ) ( not ( = ?auto_175330 ?auto_175329 ) ) ( not ( = ?auto_175330 ?auto_175331 ) ) ( not ( = ?auto_175330 ?auto_175328 ) ) ( not ( = ?auto_175330 ?auto_175327 ) ) ( not ( = ?auto_175330 ?auto_175326 ) ) ( not ( = ?auto_175329 ?auto_175331 ) ) ( not ( = ?auto_175329 ?auto_175328 ) ) ( not ( = ?auto_175329 ?auto_175327 ) ) ( not ( = ?auto_175329 ?auto_175326 ) ) ( not ( = ?auto_175331 ?auto_175328 ) ) ( not ( = ?auto_175331 ?auto_175327 ) ) ( not ( = ?auto_175331 ?auto_175326 ) ) ( not ( = ?auto_175324 ?auto_175330 ) ) ( not ( = ?auto_175324 ?auto_175329 ) ) ( not ( = ?auto_175324 ?auto_175331 ) ) ( not ( = ?auto_175325 ?auto_175330 ) ) ( not ( = ?auto_175325 ?auto_175329 ) ) ( not ( = ?auto_175325 ?auto_175331 ) ) ( ON ?auto_175325 ?auto_175326 ) ( CLEAR ?auto_175325 ) ( ON ?auto_175324 ?auto_175332 ) ( CLEAR ?auto_175324 ) ( HAND-EMPTY ) ( not ( = ?auto_175324 ?auto_175332 ) ) ( not ( = ?auto_175325 ?auto_175332 ) ) ( not ( = ?auto_175326 ?auto_175332 ) ) ( not ( = ?auto_175327 ?auto_175332 ) ) ( not ( = ?auto_175328 ?auto_175332 ) ) ( not ( = ?auto_175330 ?auto_175332 ) ) ( not ( = ?auto_175329 ?auto_175332 ) ) ( not ( = ?auto_175331 ?auto_175332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175324 ?auto_175332 )
      ( MAKE-4PILE ?auto_175324 ?auto_175325 ?auto_175326 ?auto_175327 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175333 - BLOCK
      ?auto_175334 - BLOCK
      ?auto_175335 - BLOCK
      ?auto_175336 - BLOCK
    )
    :vars
    (
      ?auto_175337 - BLOCK
      ?auto_175339 - BLOCK
      ?auto_175341 - BLOCK
      ?auto_175340 - BLOCK
      ?auto_175338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175333 ?auto_175334 ) ) ( not ( = ?auto_175333 ?auto_175335 ) ) ( not ( = ?auto_175333 ?auto_175336 ) ) ( not ( = ?auto_175334 ?auto_175335 ) ) ( not ( = ?auto_175334 ?auto_175336 ) ) ( not ( = ?auto_175335 ?auto_175336 ) ) ( ON ?auto_175336 ?auto_175337 ) ( not ( = ?auto_175333 ?auto_175337 ) ) ( not ( = ?auto_175334 ?auto_175337 ) ) ( not ( = ?auto_175335 ?auto_175337 ) ) ( not ( = ?auto_175336 ?auto_175337 ) ) ( ON ?auto_175335 ?auto_175336 ) ( ON-TABLE ?auto_175339 ) ( ON ?auto_175341 ?auto_175339 ) ( ON ?auto_175340 ?auto_175341 ) ( ON ?auto_175337 ?auto_175340 ) ( not ( = ?auto_175339 ?auto_175341 ) ) ( not ( = ?auto_175339 ?auto_175340 ) ) ( not ( = ?auto_175339 ?auto_175337 ) ) ( not ( = ?auto_175339 ?auto_175336 ) ) ( not ( = ?auto_175339 ?auto_175335 ) ) ( not ( = ?auto_175341 ?auto_175340 ) ) ( not ( = ?auto_175341 ?auto_175337 ) ) ( not ( = ?auto_175341 ?auto_175336 ) ) ( not ( = ?auto_175341 ?auto_175335 ) ) ( not ( = ?auto_175340 ?auto_175337 ) ) ( not ( = ?auto_175340 ?auto_175336 ) ) ( not ( = ?auto_175340 ?auto_175335 ) ) ( not ( = ?auto_175333 ?auto_175339 ) ) ( not ( = ?auto_175333 ?auto_175341 ) ) ( not ( = ?auto_175333 ?auto_175340 ) ) ( not ( = ?auto_175334 ?auto_175339 ) ) ( not ( = ?auto_175334 ?auto_175341 ) ) ( not ( = ?auto_175334 ?auto_175340 ) ) ( ON ?auto_175333 ?auto_175338 ) ( CLEAR ?auto_175333 ) ( not ( = ?auto_175333 ?auto_175338 ) ) ( not ( = ?auto_175334 ?auto_175338 ) ) ( not ( = ?auto_175335 ?auto_175338 ) ) ( not ( = ?auto_175336 ?auto_175338 ) ) ( not ( = ?auto_175337 ?auto_175338 ) ) ( not ( = ?auto_175339 ?auto_175338 ) ) ( not ( = ?auto_175341 ?auto_175338 ) ) ( not ( = ?auto_175340 ?auto_175338 ) ) ( HOLDING ?auto_175334 ) ( CLEAR ?auto_175335 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175339 ?auto_175341 ?auto_175340 ?auto_175337 ?auto_175336 ?auto_175335 ?auto_175334 )
      ( MAKE-4PILE ?auto_175333 ?auto_175334 ?auto_175335 ?auto_175336 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175342 - BLOCK
      ?auto_175343 - BLOCK
      ?auto_175344 - BLOCK
      ?auto_175345 - BLOCK
    )
    :vars
    (
      ?auto_175349 - BLOCK
      ?auto_175347 - BLOCK
      ?auto_175348 - BLOCK
      ?auto_175346 - BLOCK
      ?auto_175350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175342 ?auto_175343 ) ) ( not ( = ?auto_175342 ?auto_175344 ) ) ( not ( = ?auto_175342 ?auto_175345 ) ) ( not ( = ?auto_175343 ?auto_175344 ) ) ( not ( = ?auto_175343 ?auto_175345 ) ) ( not ( = ?auto_175344 ?auto_175345 ) ) ( ON ?auto_175345 ?auto_175349 ) ( not ( = ?auto_175342 ?auto_175349 ) ) ( not ( = ?auto_175343 ?auto_175349 ) ) ( not ( = ?auto_175344 ?auto_175349 ) ) ( not ( = ?auto_175345 ?auto_175349 ) ) ( ON ?auto_175344 ?auto_175345 ) ( ON-TABLE ?auto_175347 ) ( ON ?auto_175348 ?auto_175347 ) ( ON ?auto_175346 ?auto_175348 ) ( ON ?auto_175349 ?auto_175346 ) ( not ( = ?auto_175347 ?auto_175348 ) ) ( not ( = ?auto_175347 ?auto_175346 ) ) ( not ( = ?auto_175347 ?auto_175349 ) ) ( not ( = ?auto_175347 ?auto_175345 ) ) ( not ( = ?auto_175347 ?auto_175344 ) ) ( not ( = ?auto_175348 ?auto_175346 ) ) ( not ( = ?auto_175348 ?auto_175349 ) ) ( not ( = ?auto_175348 ?auto_175345 ) ) ( not ( = ?auto_175348 ?auto_175344 ) ) ( not ( = ?auto_175346 ?auto_175349 ) ) ( not ( = ?auto_175346 ?auto_175345 ) ) ( not ( = ?auto_175346 ?auto_175344 ) ) ( not ( = ?auto_175342 ?auto_175347 ) ) ( not ( = ?auto_175342 ?auto_175348 ) ) ( not ( = ?auto_175342 ?auto_175346 ) ) ( not ( = ?auto_175343 ?auto_175347 ) ) ( not ( = ?auto_175343 ?auto_175348 ) ) ( not ( = ?auto_175343 ?auto_175346 ) ) ( ON ?auto_175342 ?auto_175350 ) ( not ( = ?auto_175342 ?auto_175350 ) ) ( not ( = ?auto_175343 ?auto_175350 ) ) ( not ( = ?auto_175344 ?auto_175350 ) ) ( not ( = ?auto_175345 ?auto_175350 ) ) ( not ( = ?auto_175349 ?auto_175350 ) ) ( not ( = ?auto_175347 ?auto_175350 ) ) ( not ( = ?auto_175348 ?auto_175350 ) ) ( not ( = ?auto_175346 ?auto_175350 ) ) ( CLEAR ?auto_175344 ) ( ON ?auto_175343 ?auto_175342 ) ( CLEAR ?auto_175343 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175350 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175350 ?auto_175342 )
      ( MAKE-4PILE ?auto_175342 ?auto_175343 ?auto_175344 ?auto_175345 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175351 - BLOCK
      ?auto_175352 - BLOCK
      ?auto_175353 - BLOCK
      ?auto_175354 - BLOCK
    )
    :vars
    (
      ?auto_175355 - BLOCK
      ?auto_175356 - BLOCK
      ?auto_175359 - BLOCK
      ?auto_175357 - BLOCK
      ?auto_175358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175351 ?auto_175352 ) ) ( not ( = ?auto_175351 ?auto_175353 ) ) ( not ( = ?auto_175351 ?auto_175354 ) ) ( not ( = ?auto_175352 ?auto_175353 ) ) ( not ( = ?auto_175352 ?auto_175354 ) ) ( not ( = ?auto_175353 ?auto_175354 ) ) ( ON ?auto_175354 ?auto_175355 ) ( not ( = ?auto_175351 ?auto_175355 ) ) ( not ( = ?auto_175352 ?auto_175355 ) ) ( not ( = ?auto_175353 ?auto_175355 ) ) ( not ( = ?auto_175354 ?auto_175355 ) ) ( ON-TABLE ?auto_175356 ) ( ON ?auto_175359 ?auto_175356 ) ( ON ?auto_175357 ?auto_175359 ) ( ON ?auto_175355 ?auto_175357 ) ( not ( = ?auto_175356 ?auto_175359 ) ) ( not ( = ?auto_175356 ?auto_175357 ) ) ( not ( = ?auto_175356 ?auto_175355 ) ) ( not ( = ?auto_175356 ?auto_175354 ) ) ( not ( = ?auto_175356 ?auto_175353 ) ) ( not ( = ?auto_175359 ?auto_175357 ) ) ( not ( = ?auto_175359 ?auto_175355 ) ) ( not ( = ?auto_175359 ?auto_175354 ) ) ( not ( = ?auto_175359 ?auto_175353 ) ) ( not ( = ?auto_175357 ?auto_175355 ) ) ( not ( = ?auto_175357 ?auto_175354 ) ) ( not ( = ?auto_175357 ?auto_175353 ) ) ( not ( = ?auto_175351 ?auto_175356 ) ) ( not ( = ?auto_175351 ?auto_175359 ) ) ( not ( = ?auto_175351 ?auto_175357 ) ) ( not ( = ?auto_175352 ?auto_175356 ) ) ( not ( = ?auto_175352 ?auto_175359 ) ) ( not ( = ?auto_175352 ?auto_175357 ) ) ( ON ?auto_175351 ?auto_175358 ) ( not ( = ?auto_175351 ?auto_175358 ) ) ( not ( = ?auto_175352 ?auto_175358 ) ) ( not ( = ?auto_175353 ?auto_175358 ) ) ( not ( = ?auto_175354 ?auto_175358 ) ) ( not ( = ?auto_175355 ?auto_175358 ) ) ( not ( = ?auto_175356 ?auto_175358 ) ) ( not ( = ?auto_175359 ?auto_175358 ) ) ( not ( = ?auto_175357 ?auto_175358 ) ) ( ON ?auto_175352 ?auto_175351 ) ( CLEAR ?auto_175352 ) ( ON-TABLE ?auto_175358 ) ( HOLDING ?auto_175353 ) ( CLEAR ?auto_175354 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175356 ?auto_175359 ?auto_175357 ?auto_175355 ?auto_175354 ?auto_175353 )
      ( MAKE-4PILE ?auto_175351 ?auto_175352 ?auto_175353 ?auto_175354 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175360 - BLOCK
      ?auto_175361 - BLOCK
      ?auto_175362 - BLOCK
      ?auto_175363 - BLOCK
    )
    :vars
    (
      ?auto_175367 - BLOCK
      ?auto_175368 - BLOCK
      ?auto_175366 - BLOCK
      ?auto_175364 - BLOCK
      ?auto_175365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175360 ?auto_175361 ) ) ( not ( = ?auto_175360 ?auto_175362 ) ) ( not ( = ?auto_175360 ?auto_175363 ) ) ( not ( = ?auto_175361 ?auto_175362 ) ) ( not ( = ?auto_175361 ?auto_175363 ) ) ( not ( = ?auto_175362 ?auto_175363 ) ) ( ON ?auto_175363 ?auto_175367 ) ( not ( = ?auto_175360 ?auto_175367 ) ) ( not ( = ?auto_175361 ?auto_175367 ) ) ( not ( = ?auto_175362 ?auto_175367 ) ) ( not ( = ?auto_175363 ?auto_175367 ) ) ( ON-TABLE ?auto_175368 ) ( ON ?auto_175366 ?auto_175368 ) ( ON ?auto_175364 ?auto_175366 ) ( ON ?auto_175367 ?auto_175364 ) ( not ( = ?auto_175368 ?auto_175366 ) ) ( not ( = ?auto_175368 ?auto_175364 ) ) ( not ( = ?auto_175368 ?auto_175367 ) ) ( not ( = ?auto_175368 ?auto_175363 ) ) ( not ( = ?auto_175368 ?auto_175362 ) ) ( not ( = ?auto_175366 ?auto_175364 ) ) ( not ( = ?auto_175366 ?auto_175367 ) ) ( not ( = ?auto_175366 ?auto_175363 ) ) ( not ( = ?auto_175366 ?auto_175362 ) ) ( not ( = ?auto_175364 ?auto_175367 ) ) ( not ( = ?auto_175364 ?auto_175363 ) ) ( not ( = ?auto_175364 ?auto_175362 ) ) ( not ( = ?auto_175360 ?auto_175368 ) ) ( not ( = ?auto_175360 ?auto_175366 ) ) ( not ( = ?auto_175360 ?auto_175364 ) ) ( not ( = ?auto_175361 ?auto_175368 ) ) ( not ( = ?auto_175361 ?auto_175366 ) ) ( not ( = ?auto_175361 ?auto_175364 ) ) ( ON ?auto_175360 ?auto_175365 ) ( not ( = ?auto_175360 ?auto_175365 ) ) ( not ( = ?auto_175361 ?auto_175365 ) ) ( not ( = ?auto_175362 ?auto_175365 ) ) ( not ( = ?auto_175363 ?auto_175365 ) ) ( not ( = ?auto_175367 ?auto_175365 ) ) ( not ( = ?auto_175368 ?auto_175365 ) ) ( not ( = ?auto_175366 ?auto_175365 ) ) ( not ( = ?auto_175364 ?auto_175365 ) ) ( ON ?auto_175361 ?auto_175360 ) ( ON-TABLE ?auto_175365 ) ( CLEAR ?auto_175363 ) ( ON ?auto_175362 ?auto_175361 ) ( CLEAR ?auto_175362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175365 ?auto_175360 ?auto_175361 )
      ( MAKE-4PILE ?auto_175360 ?auto_175361 ?auto_175362 ?auto_175363 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175369 - BLOCK
      ?auto_175370 - BLOCK
      ?auto_175371 - BLOCK
      ?auto_175372 - BLOCK
    )
    :vars
    (
      ?auto_175373 - BLOCK
      ?auto_175374 - BLOCK
      ?auto_175377 - BLOCK
      ?auto_175376 - BLOCK
      ?auto_175375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175369 ?auto_175370 ) ) ( not ( = ?auto_175369 ?auto_175371 ) ) ( not ( = ?auto_175369 ?auto_175372 ) ) ( not ( = ?auto_175370 ?auto_175371 ) ) ( not ( = ?auto_175370 ?auto_175372 ) ) ( not ( = ?auto_175371 ?auto_175372 ) ) ( not ( = ?auto_175369 ?auto_175373 ) ) ( not ( = ?auto_175370 ?auto_175373 ) ) ( not ( = ?auto_175371 ?auto_175373 ) ) ( not ( = ?auto_175372 ?auto_175373 ) ) ( ON-TABLE ?auto_175374 ) ( ON ?auto_175377 ?auto_175374 ) ( ON ?auto_175376 ?auto_175377 ) ( ON ?auto_175373 ?auto_175376 ) ( not ( = ?auto_175374 ?auto_175377 ) ) ( not ( = ?auto_175374 ?auto_175376 ) ) ( not ( = ?auto_175374 ?auto_175373 ) ) ( not ( = ?auto_175374 ?auto_175372 ) ) ( not ( = ?auto_175374 ?auto_175371 ) ) ( not ( = ?auto_175377 ?auto_175376 ) ) ( not ( = ?auto_175377 ?auto_175373 ) ) ( not ( = ?auto_175377 ?auto_175372 ) ) ( not ( = ?auto_175377 ?auto_175371 ) ) ( not ( = ?auto_175376 ?auto_175373 ) ) ( not ( = ?auto_175376 ?auto_175372 ) ) ( not ( = ?auto_175376 ?auto_175371 ) ) ( not ( = ?auto_175369 ?auto_175374 ) ) ( not ( = ?auto_175369 ?auto_175377 ) ) ( not ( = ?auto_175369 ?auto_175376 ) ) ( not ( = ?auto_175370 ?auto_175374 ) ) ( not ( = ?auto_175370 ?auto_175377 ) ) ( not ( = ?auto_175370 ?auto_175376 ) ) ( ON ?auto_175369 ?auto_175375 ) ( not ( = ?auto_175369 ?auto_175375 ) ) ( not ( = ?auto_175370 ?auto_175375 ) ) ( not ( = ?auto_175371 ?auto_175375 ) ) ( not ( = ?auto_175372 ?auto_175375 ) ) ( not ( = ?auto_175373 ?auto_175375 ) ) ( not ( = ?auto_175374 ?auto_175375 ) ) ( not ( = ?auto_175377 ?auto_175375 ) ) ( not ( = ?auto_175376 ?auto_175375 ) ) ( ON ?auto_175370 ?auto_175369 ) ( ON-TABLE ?auto_175375 ) ( ON ?auto_175371 ?auto_175370 ) ( CLEAR ?auto_175371 ) ( HOLDING ?auto_175372 ) ( CLEAR ?auto_175373 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175374 ?auto_175377 ?auto_175376 ?auto_175373 ?auto_175372 )
      ( MAKE-4PILE ?auto_175369 ?auto_175370 ?auto_175371 ?auto_175372 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175378 - BLOCK
      ?auto_175379 - BLOCK
      ?auto_175380 - BLOCK
      ?auto_175381 - BLOCK
    )
    :vars
    (
      ?auto_175385 - BLOCK
      ?auto_175386 - BLOCK
      ?auto_175384 - BLOCK
      ?auto_175382 - BLOCK
      ?auto_175383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175378 ?auto_175379 ) ) ( not ( = ?auto_175378 ?auto_175380 ) ) ( not ( = ?auto_175378 ?auto_175381 ) ) ( not ( = ?auto_175379 ?auto_175380 ) ) ( not ( = ?auto_175379 ?auto_175381 ) ) ( not ( = ?auto_175380 ?auto_175381 ) ) ( not ( = ?auto_175378 ?auto_175385 ) ) ( not ( = ?auto_175379 ?auto_175385 ) ) ( not ( = ?auto_175380 ?auto_175385 ) ) ( not ( = ?auto_175381 ?auto_175385 ) ) ( ON-TABLE ?auto_175386 ) ( ON ?auto_175384 ?auto_175386 ) ( ON ?auto_175382 ?auto_175384 ) ( ON ?auto_175385 ?auto_175382 ) ( not ( = ?auto_175386 ?auto_175384 ) ) ( not ( = ?auto_175386 ?auto_175382 ) ) ( not ( = ?auto_175386 ?auto_175385 ) ) ( not ( = ?auto_175386 ?auto_175381 ) ) ( not ( = ?auto_175386 ?auto_175380 ) ) ( not ( = ?auto_175384 ?auto_175382 ) ) ( not ( = ?auto_175384 ?auto_175385 ) ) ( not ( = ?auto_175384 ?auto_175381 ) ) ( not ( = ?auto_175384 ?auto_175380 ) ) ( not ( = ?auto_175382 ?auto_175385 ) ) ( not ( = ?auto_175382 ?auto_175381 ) ) ( not ( = ?auto_175382 ?auto_175380 ) ) ( not ( = ?auto_175378 ?auto_175386 ) ) ( not ( = ?auto_175378 ?auto_175384 ) ) ( not ( = ?auto_175378 ?auto_175382 ) ) ( not ( = ?auto_175379 ?auto_175386 ) ) ( not ( = ?auto_175379 ?auto_175384 ) ) ( not ( = ?auto_175379 ?auto_175382 ) ) ( ON ?auto_175378 ?auto_175383 ) ( not ( = ?auto_175378 ?auto_175383 ) ) ( not ( = ?auto_175379 ?auto_175383 ) ) ( not ( = ?auto_175380 ?auto_175383 ) ) ( not ( = ?auto_175381 ?auto_175383 ) ) ( not ( = ?auto_175385 ?auto_175383 ) ) ( not ( = ?auto_175386 ?auto_175383 ) ) ( not ( = ?auto_175384 ?auto_175383 ) ) ( not ( = ?auto_175382 ?auto_175383 ) ) ( ON ?auto_175379 ?auto_175378 ) ( ON-TABLE ?auto_175383 ) ( ON ?auto_175380 ?auto_175379 ) ( CLEAR ?auto_175385 ) ( ON ?auto_175381 ?auto_175380 ) ( CLEAR ?auto_175381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175383 ?auto_175378 ?auto_175379 ?auto_175380 )
      ( MAKE-4PILE ?auto_175378 ?auto_175379 ?auto_175380 ?auto_175381 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175387 - BLOCK
      ?auto_175388 - BLOCK
      ?auto_175389 - BLOCK
      ?auto_175390 - BLOCK
    )
    :vars
    (
      ?auto_175393 - BLOCK
      ?auto_175391 - BLOCK
      ?auto_175392 - BLOCK
      ?auto_175395 - BLOCK
      ?auto_175394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175387 ?auto_175388 ) ) ( not ( = ?auto_175387 ?auto_175389 ) ) ( not ( = ?auto_175387 ?auto_175390 ) ) ( not ( = ?auto_175388 ?auto_175389 ) ) ( not ( = ?auto_175388 ?auto_175390 ) ) ( not ( = ?auto_175389 ?auto_175390 ) ) ( not ( = ?auto_175387 ?auto_175393 ) ) ( not ( = ?auto_175388 ?auto_175393 ) ) ( not ( = ?auto_175389 ?auto_175393 ) ) ( not ( = ?auto_175390 ?auto_175393 ) ) ( ON-TABLE ?auto_175391 ) ( ON ?auto_175392 ?auto_175391 ) ( ON ?auto_175395 ?auto_175392 ) ( not ( = ?auto_175391 ?auto_175392 ) ) ( not ( = ?auto_175391 ?auto_175395 ) ) ( not ( = ?auto_175391 ?auto_175393 ) ) ( not ( = ?auto_175391 ?auto_175390 ) ) ( not ( = ?auto_175391 ?auto_175389 ) ) ( not ( = ?auto_175392 ?auto_175395 ) ) ( not ( = ?auto_175392 ?auto_175393 ) ) ( not ( = ?auto_175392 ?auto_175390 ) ) ( not ( = ?auto_175392 ?auto_175389 ) ) ( not ( = ?auto_175395 ?auto_175393 ) ) ( not ( = ?auto_175395 ?auto_175390 ) ) ( not ( = ?auto_175395 ?auto_175389 ) ) ( not ( = ?auto_175387 ?auto_175391 ) ) ( not ( = ?auto_175387 ?auto_175392 ) ) ( not ( = ?auto_175387 ?auto_175395 ) ) ( not ( = ?auto_175388 ?auto_175391 ) ) ( not ( = ?auto_175388 ?auto_175392 ) ) ( not ( = ?auto_175388 ?auto_175395 ) ) ( ON ?auto_175387 ?auto_175394 ) ( not ( = ?auto_175387 ?auto_175394 ) ) ( not ( = ?auto_175388 ?auto_175394 ) ) ( not ( = ?auto_175389 ?auto_175394 ) ) ( not ( = ?auto_175390 ?auto_175394 ) ) ( not ( = ?auto_175393 ?auto_175394 ) ) ( not ( = ?auto_175391 ?auto_175394 ) ) ( not ( = ?auto_175392 ?auto_175394 ) ) ( not ( = ?auto_175395 ?auto_175394 ) ) ( ON ?auto_175388 ?auto_175387 ) ( ON-TABLE ?auto_175394 ) ( ON ?auto_175389 ?auto_175388 ) ( ON ?auto_175390 ?auto_175389 ) ( CLEAR ?auto_175390 ) ( HOLDING ?auto_175393 ) ( CLEAR ?auto_175395 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175391 ?auto_175392 ?auto_175395 ?auto_175393 )
      ( MAKE-4PILE ?auto_175387 ?auto_175388 ?auto_175389 ?auto_175390 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175396 - BLOCK
      ?auto_175397 - BLOCK
      ?auto_175398 - BLOCK
      ?auto_175399 - BLOCK
    )
    :vars
    (
      ?auto_175402 - BLOCK
      ?auto_175400 - BLOCK
      ?auto_175403 - BLOCK
      ?auto_175401 - BLOCK
      ?auto_175404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175396 ?auto_175397 ) ) ( not ( = ?auto_175396 ?auto_175398 ) ) ( not ( = ?auto_175396 ?auto_175399 ) ) ( not ( = ?auto_175397 ?auto_175398 ) ) ( not ( = ?auto_175397 ?auto_175399 ) ) ( not ( = ?auto_175398 ?auto_175399 ) ) ( not ( = ?auto_175396 ?auto_175402 ) ) ( not ( = ?auto_175397 ?auto_175402 ) ) ( not ( = ?auto_175398 ?auto_175402 ) ) ( not ( = ?auto_175399 ?auto_175402 ) ) ( ON-TABLE ?auto_175400 ) ( ON ?auto_175403 ?auto_175400 ) ( ON ?auto_175401 ?auto_175403 ) ( not ( = ?auto_175400 ?auto_175403 ) ) ( not ( = ?auto_175400 ?auto_175401 ) ) ( not ( = ?auto_175400 ?auto_175402 ) ) ( not ( = ?auto_175400 ?auto_175399 ) ) ( not ( = ?auto_175400 ?auto_175398 ) ) ( not ( = ?auto_175403 ?auto_175401 ) ) ( not ( = ?auto_175403 ?auto_175402 ) ) ( not ( = ?auto_175403 ?auto_175399 ) ) ( not ( = ?auto_175403 ?auto_175398 ) ) ( not ( = ?auto_175401 ?auto_175402 ) ) ( not ( = ?auto_175401 ?auto_175399 ) ) ( not ( = ?auto_175401 ?auto_175398 ) ) ( not ( = ?auto_175396 ?auto_175400 ) ) ( not ( = ?auto_175396 ?auto_175403 ) ) ( not ( = ?auto_175396 ?auto_175401 ) ) ( not ( = ?auto_175397 ?auto_175400 ) ) ( not ( = ?auto_175397 ?auto_175403 ) ) ( not ( = ?auto_175397 ?auto_175401 ) ) ( ON ?auto_175396 ?auto_175404 ) ( not ( = ?auto_175396 ?auto_175404 ) ) ( not ( = ?auto_175397 ?auto_175404 ) ) ( not ( = ?auto_175398 ?auto_175404 ) ) ( not ( = ?auto_175399 ?auto_175404 ) ) ( not ( = ?auto_175402 ?auto_175404 ) ) ( not ( = ?auto_175400 ?auto_175404 ) ) ( not ( = ?auto_175403 ?auto_175404 ) ) ( not ( = ?auto_175401 ?auto_175404 ) ) ( ON ?auto_175397 ?auto_175396 ) ( ON-TABLE ?auto_175404 ) ( ON ?auto_175398 ?auto_175397 ) ( ON ?auto_175399 ?auto_175398 ) ( CLEAR ?auto_175401 ) ( ON ?auto_175402 ?auto_175399 ) ( CLEAR ?auto_175402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175404 ?auto_175396 ?auto_175397 ?auto_175398 ?auto_175399 )
      ( MAKE-4PILE ?auto_175396 ?auto_175397 ?auto_175398 ?auto_175399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175405 - BLOCK
      ?auto_175406 - BLOCK
      ?auto_175407 - BLOCK
      ?auto_175408 - BLOCK
    )
    :vars
    (
      ?auto_175409 - BLOCK
      ?auto_175413 - BLOCK
      ?auto_175412 - BLOCK
      ?auto_175411 - BLOCK
      ?auto_175410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175405 ?auto_175406 ) ) ( not ( = ?auto_175405 ?auto_175407 ) ) ( not ( = ?auto_175405 ?auto_175408 ) ) ( not ( = ?auto_175406 ?auto_175407 ) ) ( not ( = ?auto_175406 ?auto_175408 ) ) ( not ( = ?auto_175407 ?auto_175408 ) ) ( not ( = ?auto_175405 ?auto_175409 ) ) ( not ( = ?auto_175406 ?auto_175409 ) ) ( not ( = ?auto_175407 ?auto_175409 ) ) ( not ( = ?auto_175408 ?auto_175409 ) ) ( ON-TABLE ?auto_175413 ) ( ON ?auto_175412 ?auto_175413 ) ( not ( = ?auto_175413 ?auto_175412 ) ) ( not ( = ?auto_175413 ?auto_175411 ) ) ( not ( = ?auto_175413 ?auto_175409 ) ) ( not ( = ?auto_175413 ?auto_175408 ) ) ( not ( = ?auto_175413 ?auto_175407 ) ) ( not ( = ?auto_175412 ?auto_175411 ) ) ( not ( = ?auto_175412 ?auto_175409 ) ) ( not ( = ?auto_175412 ?auto_175408 ) ) ( not ( = ?auto_175412 ?auto_175407 ) ) ( not ( = ?auto_175411 ?auto_175409 ) ) ( not ( = ?auto_175411 ?auto_175408 ) ) ( not ( = ?auto_175411 ?auto_175407 ) ) ( not ( = ?auto_175405 ?auto_175413 ) ) ( not ( = ?auto_175405 ?auto_175412 ) ) ( not ( = ?auto_175405 ?auto_175411 ) ) ( not ( = ?auto_175406 ?auto_175413 ) ) ( not ( = ?auto_175406 ?auto_175412 ) ) ( not ( = ?auto_175406 ?auto_175411 ) ) ( ON ?auto_175405 ?auto_175410 ) ( not ( = ?auto_175405 ?auto_175410 ) ) ( not ( = ?auto_175406 ?auto_175410 ) ) ( not ( = ?auto_175407 ?auto_175410 ) ) ( not ( = ?auto_175408 ?auto_175410 ) ) ( not ( = ?auto_175409 ?auto_175410 ) ) ( not ( = ?auto_175413 ?auto_175410 ) ) ( not ( = ?auto_175412 ?auto_175410 ) ) ( not ( = ?auto_175411 ?auto_175410 ) ) ( ON ?auto_175406 ?auto_175405 ) ( ON-TABLE ?auto_175410 ) ( ON ?auto_175407 ?auto_175406 ) ( ON ?auto_175408 ?auto_175407 ) ( ON ?auto_175409 ?auto_175408 ) ( CLEAR ?auto_175409 ) ( HOLDING ?auto_175411 ) ( CLEAR ?auto_175412 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175413 ?auto_175412 ?auto_175411 )
      ( MAKE-4PILE ?auto_175405 ?auto_175406 ?auto_175407 ?auto_175408 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175414 - BLOCK
      ?auto_175415 - BLOCK
      ?auto_175416 - BLOCK
      ?auto_175417 - BLOCK
    )
    :vars
    (
      ?auto_175420 - BLOCK
      ?auto_175419 - BLOCK
      ?auto_175418 - BLOCK
      ?auto_175421 - BLOCK
      ?auto_175422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175414 ?auto_175415 ) ) ( not ( = ?auto_175414 ?auto_175416 ) ) ( not ( = ?auto_175414 ?auto_175417 ) ) ( not ( = ?auto_175415 ?auto_175416 ) ) ( not ( = ?auto_175415 ?auto_175417 ) ) ( not ( = ?auto_175416 ?auto_175417 ) ) ( not ( = ?auto_175414 ?auto_175420 ) ) ( not ( = ?auto_175415 ?auto_175420 ) ) ( not ( = ?auto_175416 ?auto_175420 ) ) ( not ( = ?auto_175417 ?auto_175420 ) ) ( ON-TABLE ?auto_175419 ) ( ON ?auto_175418 ?auto_175419 ) ( not ( = ?auto_175419 ?auto_175418 ) ) ( not ( = ?auto_175419 ?auto_175421 ) ) ( not ( = ?auto_175419 ?auto_175420 ) ) ( not ( = ?auto_175419 ?auto_175417 ) ) ( not ( = ?auto_175419 ?auto_175416 ) ) ( not ( = ?auto_175418 ?auto_175421 ) ) ( not ( = ?auto_175418 ?auto_175420 ) ) ( not ( = ?auto_175418 ?auto_175417 ) ) ( not ( = ?auto_175418 ?auto_175416 ) ) ( not ( = ?auto_175421 ?auto_175420 ) ) ( not ( = ?auto_175421 ?auto_175417 ) ) ( not ( = ?auto_175421 ?auto_175416 ) ) ( not ( = ?auto_175414 ?auto_175419 ) ) ( not ( = ?auto_175414 ?auto_175418 ) ) ( not ( = ?auto_175414 ?auto_175421 ) ) ( not ( = ?auto_175415 ?auto_175419 ) ) ( not ( = ?auto_175415 ?auto_175418 ) ) ( not ( = ?auto_175415 ?auto_175421 ) ) ( ON ?auto_175414 ?auto_175422 ) ( not ( = ?auto_175414 ?auto_175422 ) ) ( not ( = ?auto_175415 ?auto_175422 ) ) ( not ( = ?auto_175416 ?auto_175422 ) ) ( not ( = ?auto_175417 ?auto_175422 ) ) ( not ( = ?auto_175420 ?auto_175422 ) ) ( not ( = ?auto_175419 ?auto_175422 ) ) ( not ( = ?auto_175418 ?auto_175422 ) ) ( not ( = ?auto_175421 ?auto_175422 ) ) ( ON ?auto_175415 ?auto_175414 ) ( ON-TABLE ?auto_175422 ) ( ON ?auto_175416 ?auto_175415 ) ( ON ?auto_175417 ?auto_175416 ) ( ON ?auto_175420 ?auto_175417 ) ( CLEAR ?auto_175418 ) ( ON ?auto_175421 ?auto_175420 ) ( CLEAR ?auto_175421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175422 ?auto_175414 ?auto_175415 ?auto_175416 ?auto_175417 ?auto_175420 )
      ( MAKE-4PILE ?auto_175414 ?auto_175415 ?auto_175416 ?auto_175417 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175423 - BLOCK
      ?auto_175424 - BLOCK
      ?auto_175425 - BLOCK
      ?auto_175426 - BLOCK
    )
    :vars
    (
      ?auto_175428 - BLOCK
      ?auto_175430 - BLOCK
      ?auto_175429 - BLOCK
      ?auto_175431 - BLOCK
      ?auto_175427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175423 ?auto_175424 ) ) ( not ( = ?auto_175423 ?auto_175425 ) ) ( not ( = ?auto_175423 ?auto_175426 ) ) ( not ( = ?auto_175424 ?auto_175425 ) ) ( not ( = ?auto_175424 ?auto_175426 ) ) ( not ( = ?auto_175425 ?auto_175426 ) ) ( not ( = ?auto_175423 ?auto_175428 ) ) ( not ( = ?auto_175424 ?auto_175428 ) ) ( not ( = ?auto_175425 ?auto_175428 ) ) ( not ( = ?auto_175426 ?auto_175428 ) ) ( ON-TABLE ?auto_175430 ) ( not ( = ?auto_175430 ?auto_175429 ) ) ( not ( = ?auto_175430 ?auto_175431 ) ) ( not ( = ?auto_175430 ?auto_175428 ) ) ( not ( = ?auto_175430 ?auto_175426 ) ) ( not ( = ?auto_175430 ?auto_175425 ) ) ( not ( = ?auto_175429 ?auto_175431 ) ) ( not ( = ?auto_175429 ?auto_175428 ) ) ( not ( = ?auto_175429 ?auto_175426 ) ) ( not ( = ?auto_175429 ?auto_175425 ) ) ( not ( = ?auto_175431 ?auto_175428 ) ) ( not ( = ?auto_175431 ?auto_175426 ) ) ( not ( = ?auto_175431 ?auto_175425 ) ) ( not ( = ?auto_175423 ?auto_175430 ) ) ( not ( = ?auto_175423 ?auto_175429 ) ) ( not ( = ?auto_175423 ?auto_175431 ) ) ( not ( = ?auto_175424 ?auto_175430 ) ) ( not ( = ?auto_175424 ?auto_175429 ) ) ( not ( = ?auto_175424 ?auto_175431 ) ) ( ON ?auto_175423 ?auto_175427 ) ( not ( = ?auto_175423 ?auto_175427 ) ) ( not ( = ?auto_175424 ?auto_175427 ) ) ( not ( = ?auto_175425 ?auto_175427 ) ) ( not ( = ?auto_175426 ?auto_175427 ) ) ( not ( = ?auto_175428 ?auto_175427 ) ) ( not ( = ?auto_175430 ?auto_175427 ) ) ( not ( = ?auto_175429 ?auto_175427 ) ) ( not ( = ?auto_175431 ?auto_175427 ) ) ( ON ?auto_175424 ?auto_175423 ) ( ON-TABLE ?auto_175427 ) ( ON ?auto_175425 ?auto_175424 ) ( ON ?auto_175426 ?auto_175425 ) ( ON ?auto_175428 ?auto_175426 ) ( ON ?auto_175431 ?auto_175428 ) ( CLEAR ?auto_175431 ) ( HOLDING ?auto_175429 ) ( CLEAR ?auto_175430 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175430 ?auto_175429 )
      ( MAKE-4PILE ?auto_175423 ?auto_175424 ?auto_175425 ?auto_175426 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175432 - BLOCK
      ?auto_175433 - BLOCK
      ?auto_175434 - BLOCK
      ?auto_175435 - BLOCK
    )
    :vars
    (
      ?auto_175436 - BLOCK
      ?auto_175437 - BLOCK
      ?auto_175438 - BLOCK
      ?auto_175439 - BLOCK
      ?auto_175440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175432 ?auto_175433 ) ) ( not ( = ?auto_175432 ?auto_175434 ) ) ( not ( = ?auto_175432 ?auto_175435 ) ) ( not ( = ?auto_175433 ?auto_175434 ) ) ( not ( = ?auto_175433 ?auto_175435 ) ) ( not ( = ?auto_175434 ?auto_175435 ) ) ( not ( = ?auto_175432 ?auto_175436 ) ) ( not ( = ?auto_175433 ?auto_175436 ) ) ( not ( = ?auto_175434 ?auto_175436 ) ) ( not ( = ?auto_175435 ?auto_175436 ) ) ( ON-TABLE ?auto_175437 ) ( not ( = ?auto_175437 ?auto_175438 ) ) ( not ( = ?auto_175437 ?auto_175439 ) ) ( not ( = ?auto_175437 ?auto_175436 ) ) ( not ( = ?auto_175437 ?auto_175435 ) ) ( not ( = ?auto_175437 ?auto_175434 ) ) ( not ( = ?auto_175438 ?auto_175439 ) ) ( not ( = ?auto_175438 ?auto_175436 ) ) ( not ( = ?auto_175438 ?auto_175435 ) ) ( not ( = ?auto_175438 ?auto_175434 ) ) ( not ( = ?auto_175439 ?auto_175436 ) ) ( not ( = ?auto_175439 ?auto_175435 ) ) ( not ( = ?auto_175439 ?auto_175434 ) ) ( not ( = ?auto_175432 ?auto_175437 ) ) ( not ( = ?auto_175432 ?auto_175438 ) ) ( not ( = ?auto_175432 ?auto_175439 ) ) ( not ( = ?auto_175433 ?auto_175437 ) ) ( not ( = ?auto_175433 ?auto_175438 ) ) ( not ( = ?auto_175433 ?auto_175439 ) ) ( ON ?auto_175432 ?auto_175440 ) ( not ( = ?auto_175432 ?auto_175440 ) ) ( not ( = ?auto_175433 ?auto_175440 ) ) ( not ( = ?auto_175434 ?auto_175440 ) ) ( not ( = ?auto_175435 ?auto_175440 ) ) ( not ( = ?auto_175436 ?auto_175440 ) ) ( not ( = ?auto_175437 ?auto_175440 ) ) ( not ( = ?auto_175438 ?auto_175440 ) ) ( not ( = ?auto_175439 ?auto_175440 ) ) ( ON ?auto_175433 ?auto_175432 ) ( ON-TABLE ?auto_175440 ) ( ON ?auto_175434 ?auto_175433 ) ( ON ?auto_175435 ?auto_175434 ) ( ON ?auto_175436 ?auto_175435 ) ( ON ?auto_175439 ?auto_175436 ) ( CLEAR ?auto_175437 ) ( ON ?auto_175438 ?auto_175439 ) ( CLEAR ?auto_175438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175440 ?auto_175432 ?auto_175433 ?auto_175434 ?auto_175435 ?auto_175436 ?auto_175439 )
      ( MAKE-4PILE ?auto_175432 ?auto_175433 ?auto_175434 ?auto_175435 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175441 - BLOCK
      ?auto_175442 - BLOCK
      ?auto_175443 - BLOCK
      ?auto_175444 - BLOCK
    )
    :vars
    (
      ?auto_175449 - BLOCK
      ?auto_175448 - BLOCK
      ?auto_175446 - BLOCK
      ?auto_175445 - BLOCK
      ?auto_175447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175441 ?auto_175442 ) ) ( not ( = ?auto_175441 ?auto_175443 ) ) ( not ( = ?auto_175441 ?auto_175444 ) ) ( not ( = ?auto_175442 ?auto_175443 ) ) ( not ( = ?auto_175442 ?auto_175444 ) ) ( not ( = ?auto_175443 ?auto_175444 ) ) ( not ( = ?auto_175441 ?auto_175449 ) ) ( not ( = ?auto_175442 ?auto_175449 ) ) ( not ( = ?auto_175443 ?auto_175449 ) ) ( not ( = ?auto_175444 ?auto_175449 ) ) ( not ( = ?auto_175448 ?auto_175446 ) ) ( not ( = ?auto_175448 ?auto_175445 ) ) ( not ( = ?auto_175448 ?auto_175449 ) ) ( not ( = ?auto_175448 ?auto_175444 ) ) ( not ( = ?auto_175448 ?auto_175443 ) ) ( not ( = ?auto_175446 ?auto_175445 ) ) ( not ( = ?auto_175446 ?auto_175449 ) ) ( not ( = ?auto_175446 ?auto_175444 ) ) ( not ( = ?auto_175446 ?auto_175443 ) ) ( not ( = ?auto_175445 ?auto_175449 ) ) ( not ( = ?auto_175445 ?auto_175444 ) ) ( not ( = ?auto_175445 ?auto_175443 ) ) ( not ( = ?auto_175441 ?auto_175448 ) ) ( not ( = ?auto_175441 ?auto_175446 ) ) ( not ( = ?auto_175441 ?auto_175445 ) ) ( not ( = ?auto_175442 ?auto_175448 ) ) ( not ( = ?auto_175442 ?auto_175446 ) ) ( not ( = ?auto_175442 ?auto_175445 ) ) ( ON ?auto_175441 ?auto_175447 ) ( not ( = ?auto_175441 ?auto_175447 ) ) ( not ( = ?auto_175442 ?auto_175447 ) ) ( not ( = ?auto_175443 ?auto_175447 ) ) ( not ( = ?auto_175444 ?auto_175447 ) ) ( not ( = ?auto_175449 ?auto_175447 ) ) ( not ( = ?auto_175448 ?auto_175447 ) ) ( not ( = ?auto_175446 ?auto_175447 ) ) ( not ( = ?auto_175445 ?auto_175447 ) ) ( ON ?auto_175442 ?auto_175441 ) ( ON-TABLE ?auto_175447 ) ( ON ?auto_175443 ?auto_175442 ) ( ON ?auto_175444 ?auto_175443 ) ( ON ?auto_175449 ?auto_175444 ) ( ON ?auto_175445 ?auto_175449 ) ( ON ?auto_175446 ?auto_175445 ) ( CLEAR ?auto_175446 ) ( HOLDING ?auto_175448 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175448 )
      ( MAKE-4PILE ?auto_175441 ?auto_175442 ?auto_175443 ?auto_175444 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175450 - BLOCK
      ?auto_175451 - BLOCK
      ?auto_175452 - BLOCK
      ?auto_175453 - BLOCK
    )
    :vars
    (
      ?auto_175458 - BLOCK
      ?auto_175454 - BLOCK
      ?auto_175455 - BLOCK
      ?auto_175457 - BLOCK
      ?auto_175456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175450 ?auto_175451 ) ) ( not ( = ?auto_175450 ?auto_175452 ) ) ( not ( = ?auto_175450 ?auto_175453 ) ) ( not ( = ?auto_175451 ?auto_175452 ) ) ( not ( = ?auto_175451 ?auto_175453 ) ) ( not ( = ?auto_175452 ?auto_175453 ) ) ( not ( = ?auto_175450 ?auto_175458 ) ) ( not ( = ?auto_175451 ?auto_175458 ) ) ( not ( = ?auto_175452 ?auto_175458 ) ) ( not ( = ?auto_175453 ?auto_175458 ) ) ( not ( = ?auto_175454 ?auto_175455 ) ) ( not ( = ?auto_175454 ?auto_175457 ) ) ( not ( = ?auto_175454 ?auto_175458 ) ) ( not ( = ?auto_175454 ?auto_175453 ) ) ( not ( = ?auto_175454 ?auto_175452 ) ) ( not ( = ?auto_175455 ?auto_175457 ) ) ( not ( = ?auto_175455 ?auto_175458 ) ) ( not ( = ?auto_175455 ?auto_175453 ) ) ( not ( = ?auto_175455 ?auto_175452 ) ) ( not ( = ?auto_175457 ?auto_175458 ) ) ( not ( = ?auto_175457 ?auto_175453 ) ) ( not ( = ?auto_175457 ?auto_175452 ) ) ( not ( = ?auto_175450 ?auto_175454 ) ) ( not ( = ?auto_175450 ?auto_175455 ) ) ( not ( = ?auto_175450 ?auto_175457 ) ) ( not ( = ?auto_175451 ?auto_175454 ) ) ( not ( = ?auto_175451 ?auto_175455 ) ) ( not ( = ?auto_175451 ?auto_175457 ) ) ( ON ?auto_175450 ?auto_175456 ) ( not ( = ?auto_175450 ?auto_175456 ) ) ( not ( = ?auto_175451 ?auto_175456 ) ) ( not ( = ?auto_175452 ?auto_175456 ) ) ( not ( = ?auto_175453 ?auto_175456 ) ) ( not ( = ?auto_175458 ?auto_175456 ) ) ( not ( = ?auto_175454 ?auto_175456 ) ) ( not ( = ?auto_175455 ?auto_175456 ) ) ( not ( = ?auto_175457 ?auto_175456 ) ) ( ON ?auto_175451 ?auto_175450 ) ( ON-TABLE ?auto_175456 ) ( ON ?auto_175452 ?auto_175451 ) ( ON ?auto_175453 ?auto_175452 ) ( ON ?auto_175458 ?auto_175453 ) ( ON ?auto_175457 ?auto_175458 ) ( ON ?auto_175455 ?auto_175457 ) ( ON ?auto_175454 ?auto_175455 ) ( CLEAR ?auto_175454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175456 ?auto_175450 ?auto_175451 ?auto_175452 ?auto_175453 ?auto_175458 ?auto_175457 ?auto_175455 )
      ( MAKE-4PILE ?auto_175450 ?auto_175451 ?auto_175452 ?auto_175453 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175478 - BLOCK
      ?auto_175479 - BLOCK
      ?auto_175480 - BLOCK
    )
    :vars
    (
      ?auto_175481 - BLOCK
      ?auto_175483 - BLOCK
      ?auto_175482 - BLOCK
      ?auto_175485 - BLOCK
      ?auto_175484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175481 ?auto_175480 ) ( ON-TABLE ?auto_175478 ) ( ON ?auto_175479 ?auto_175478 ) ( ON ?auto_175480 ?auto_175479 ) ( not ( = ?auto_175478 ?auto_175479 ) ) ( not ( = ?auto_175478 ?auto_175480 ) ) ( not ( = ?auto_175478 ?auto_175481 ) ) ( not ( = ?auto_175479 ?auto_175480 ) ) ( not ( = ?auto_175479 ?auto_175481 ) ) ( not ( = ?auto_175480 ?auto_175481 ) ) ( not ( = ?auto_175478 ?auto_175483 ) ) ( not ( = ?auto_175478 ?auto_175482 ) ) ( not ( = ?auto_175479 ?auto_175483 ) ) ( not ( = ?auto_175479 ?auto_175482 ) ) ( not ( = ?auto_175480 ?auto_175483 ) ) ( not ( = ?auto_175480 ?auto_175482 ) ) ( not ( = ?auto_175481 ?auto_175483 ) ) ( not ( = ?auto_175481 ?auto_175482 ) ) ( not ( = ?auto_175483 ?auto_175482 ) ) ( ON ?auto_175483 ?auto_175481 ) ( CLEAR ?auto_175483 ) ( HOLDING ?auto_175482 ) ( CLEAR ?auto_175485 ) ( ON-TABLE ?auto_175484 ) ( ON ?auto_175485 ?auto_175484 ) ( not ( = ?auto_175484 ?auto_175485 ) ) ( not ( = ?auto_175484 ?auto_175482 ) ) ( not ( = ?auto_175485 ?auto_175482 ) ) ( not ( = ?auto_175478 ?auto_175485 ) ) ( not ( = ?auto_175478 ?auto_175484 ) ) ( not ( = ?auto_175479 ?auto_175485 ) ) ( not ( = ?auto_175479 ?auto_175484 ) ) ( not ( = ?auto_175480 ?auto_175485 ) ) ( not ( = ?auto_175480 ?auto_175484 ) ) ( not ( = ?auto_175481 ?auto_175485 ) ) ( not ( = ?auto_175481 ?auto_175484 ) ) ( not ( = ?auto_175483 ?auto_175485 ) ) ( not ( = ?auto_175483 ?auto_175484 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175484 ?auto_175485 ?auto_175482 )
      ( MAKE-3PILE ?auto_175478 ?auto_175479 ?auto_175480 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175486 - BLOCK
      ?auto_175487 - BLOCK
      ?auto_175488 - BLOCK
    )
    :vars
    (
      ?auto_175491 - BLOCK
      ?auto_175490 - BLOCK
      ?auto_175493 - BLOCK
      ?auto_175489 - BLOCK
      ?auto_175492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175491 ?auto_175488 ) ( ON-TABLE ?auto_175486 ) ( ON ?auto_175487 ?auto_175486 ) ( ON ?auto_175488 ?auto_175487 ) ( not ( = ?auto_175486 ?auto_175487 ) ) ( not ( = ?auto_175486 ?auto_175488 ) ) ( not ( = ?auto_175486 ?auto_175491 ) ) ( not ( = ?auto_175487 ?auto_175488 ) ) ( not ( = ?auto_175487 ?auto_175491 ) ) ( not ( = ?auto_175488 ?auto_175491 ) ) ( not ( = ?auto_175486 ?auto_175490 ) ) ( not ( = ?auto_175486 ?auto_175493 ) ) ( not ( = ?auto_175487 ?auto_175490 ) ) ( not ( = ?auto_175487 ?auto_175493 ) ) ( not ( = ?auto_175488 ?auto_175490 ) ) ( not ( = ?auto_175488 ?auto_175493 ) ) ( not ( = ?auto_175491 ?auto_175490 ) ) ( not ( = ?auto_175491 ?auto_175493 ) ) ( not ( = ?auto_175490 ?auto_175493 ) ) ( ON ?auto_175490 ?auto_175491 ) ( CLEAR ?auto_175489 ) ( ON-TABLE ?auto_175492 ) ( ON ?auto_175489 ?auto_175492 ) ( not ( = ?auto_175492 ?auto_175489 ) ) ( not ( = ?auto_175492 ?auto_175493 ) ) ( not ( = ?auto_175489 ?auto_175493 ) ) ( not ( = ?auto_175486 ?auto_175489 ) ) ( not ( = ?auto_175486 ?auto_175492 ) ) ( not ( = ?auto_175487 ?auto_175489 ) ) ( not ( = ?auto_175487 ?auto_175492 ) ) ( not ( = ?auto_175488 ?auto_175489 ) ) ( not ( = ?auto_175488 ?auto_175492 ) ) ( not ( = ?auto_175491 ?auto_175489 ) ) ( not ( = ?auto_175491 ?auto_175492 ) ) ( not ( = ?auto_175490 ?auto_175489 ) ) ( not ( = ?auto_175490 ?auto_175492 ) ) ( ON ?auto_175493 ?auto_175490 ) ( CLEAR ?auto_175493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175486 ?auto_175487 ?auto_175488 ?auto_175491 ?auto_175490 )
      ( MAKE-3PILE ?auto_175486 ?auto_175487 ?auto_175488 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175494 - BLOCK
      ?auto_175495 - BLOCK
      ?auto_175496 - BLOCK
    )
    :vars
    (
      ?auto_175500 - BLOCK
      ?auto_175499 - BLOCK
      ?auto_175497 - BLOCK
      ?auto_175501 - BLOCK
      ?auto_175498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175500 ?auto_175496 ) ( ON-TABLE ?auto_175494 ) ( ON ?auto_175495 ?auto_175494 ) ( ON ?auto_175496 ?auto_175495 ) ( not ( = ?auto_175494 ?auto_175495 ) ) ( not ( = ?auto_175494 ?auto_175496 ) ) ( not ( = ?auto_175494 ?auto_175500 ) ) ( not ( = ?auto_175495 ?auto_175496 ) ) ( not ( = ?auto_175495 ?auto_175500 ) ) ( not ( = ?auto_175496 ?auto_175500 ) ) ( not ( = ?auto_175494 ?auto_175499 ) ) ( not ( = ?auto_175494 ?auto_175497 ) ) ( not ( = ?auto_175495 ?auto_175499 ) ) ( not ( = ?auto_175495 ?auto_175497 ) ) ( not ( = ?auto_175496 ?auto_175499 ) ) ( not ( = ?auto_175496 ?auto_175497 ) ) ( not ( = ?auto_175500 ?auto_175499 ) ) ( not ( = ?auto_175500 ?auto_175497 ) ) ( not ( = ?auto_175499 ?auto_175497 ) ) ( ON ?auto_175499 ?auto_175500 ) ( ON-TABLE ?auto_175501 ) ( not ( = ?auto_175501 ?auto_175498 ) ) ( not ( = ?auto_175501 ?auto_175497 ) ) ( not ( = ?auto_175498 ?auto_175497 ) ) ( not ( = ?auto_175494 ?auto_175498 ) ) ( not ( = ?auto_175494 ?auto_175501 ) ) ( not ( = ?auto_175495 ?auto_175498 ) ) ( not ( = ?auto_175495 ?auto_175501 ) ) ( not ( = ?auto_175496 ?auto_175498 ) ) ( not ( = ?auto_175496 ?auto_175501 ) ) ( not ( = ?auto_175500 ?auto_175498 ) ) ( not ( = ?auto_175500 ?auto_175501 ) ) ( not ( = ?auto_175499 ?auto_175498 ) ) ( not ( = ?auto_175499 ?auto_175501 ) ) ( ON ?auto_175497 ?auto_175499 ) ( CLEAR ?auto_175497 ) ( HOLDING ?auto_175498 ) ( CLEAR ?auto_175501 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175501 ?auto_175498 )
      ( MAKE-3PILE ?auto_175494 ?auto_175495 ?auto_175496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175502 - BLOCK
      ?auto_175503 - BLOCK
      ?auto_175504 - BLOCK
    )
    :vars
    (
      ?auto_175506 - BLOCK
      ?auto_175508 - BLOCK
      ?auto_175507 - BLOCK
      ?auto_175509 - BLOCK
      ?auto_175505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175506 ?auto_175504 ) ( ON-TABLE ?auto_175502 ) ( ON ?auto_175503 ?auto_175502 ) ( ON ?auto_175504 ?auto_175503 ) ( not ( = ?auto_175502 ?auto_175503 ) ) ( not ( = ?auto_175502 ?auto_175504 ) ) ( not ( = ?auto_175502 ?auto_175506 ) ) ( not ( = ?auto_175503 ?auto_175504 ) ) ( not ( = ?auto_175503 ?auto_175506 ) ) ( not ( = ?auto_175504 ?auto_175506 ) ) ( not ( = ?auto_175502 ?auto_175508 ) ) ( not ( = ?auto_175502 ?auto_175507 ) ) ( not ( = ?auto_175503 ?auto_175508 ) ) ( not ( = ?auto_175503 ?auto_175507 ) ) ( not ( = ?auto_175504 ?auto_175508 ) ) ( not ( = ?auto_175504 ?auto_175507 ) ) ( not ( = ?auto_175506 ?auto_175508 ) ) ( not ( = ?auto_175506 ?auto_175507 ) ) ( not ( = ?auto_175508 ?auto_175507 ) ) ( ON ?auto_175508 ?auto_175506 ) ( ON-TABLE ?auto_175509 ) ( not ( = ?auto_175509 ?auto_175505 ) ) ( not ( = ?auto_175509 ?auto_175507 ) ) ( not ( = ?auto_175505 ?auto_175507 ) ) ( not ( = ?auto_175502 ?auto_175505 ) ) ( not ( = ?auto_175502 ?auto_175509 ) ) ( not ( = ?auto_175503 ?auto_175505 ) ) ( not ( = ?auto_175503 ?auto_175509 ) ) ( not ( = ?auto_175504 ?auto_175505 ) ) ( not ( = ?auto_175504 ?auto_175509 ) ) ( not ( = ?auto_175506 ?auto_175505 ) ) ( not ( = ?auto_175506 ?auto_175509 ) ) ( not ( = ?auto_175508 ?auto_175505 ) ) ( not ( = ?auto_175508 ?auto_175509 ) ) ( ON ?auto_175507 ?auto_175508 ) ( CLEAR ?auto_175509 ) ( ON ?auto_175505 ?auto_175507 ) ( CLEAR ?auto_175505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175502 ?auto_175503 ?auto_175504 ?auto_175506 ?auto_175508 ?auto_175507 )
      ( MAKE-3PILE ?auto_175502 ?auto_175503 ?auto_175504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175510 - BLOCK
      ?auto_175511 - BLOCK
      ?auto_175512 - BLOCK
    )
    :vars
    (
      ?auto_175513 - BLOCK
      ?auto_175517 - BLOCK
      ?auto_175516 - BLOCK
      ?auto_175514 - BLOCK
      ?auto_175515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175513 ?auto_175512 ) ( ON-TABLE ?auto_175510 ) ( ON ?auto_175511 ?auto_175510 ) ( ON ?auto_175512 ?auto_175511 ) ( not ( = ?auto_175510 ?auto_175511 ) ) ( not ( = ?auto_175510 ?auto_175512 ) ) ( not ( = ?auto_175510 ?auto_175513 ) ) ( not ( = ?auto_175511 ?auto_175512 ) ) ( not ( = ?auto_175511 ?auto_175513 ) ) ( not ( = ?auto_175512 ?auto_175513 ) ) ( not ( = ?auto_175510 ?auto_175517 ) ) ( not ( = ?auto_175510 ?auto_175516 ) ) ( not ( = ?auto_175511 ?auto_175517 ) ) ( not ( = ?auto_175511 ?auto_175516 ) ) ( not ( = ?auto_175512 ?auto_175517 ) ) ( not ( = ?auto_175512 ?auto_175516 ) ) ( not ( = ?auto_175513 ?auto_175517 ) ) ( not ( = ?auto_175513 ?auto_175516 ) ) ( not ( = ?auto_175517 ?auto_175516 ) ) ( ON ?auto_175517 ?auto_175513 ) ( not ( = ?auto_175514 ?auto_175515 ) ) ( not ( = ?auto_175514 ?auto_175516 ) ) ( not ( = ?auto_175515 ?auto_175516 ) ) ( not ( = ?auto_175510 ?auto_175515 ) ) ( not ( = ?auto_175510 ?auto_175514 ) ) ( not ( = ?auto_175511 ?auto_175515 ) ) ( not ( = ?auto_175511 ?auto_175514 ) ) ( not ( = ?auto_175512 ?auto_175515 ) ) ( not ( = ?auto_175512 ?auto_175514 ) ) ( not ( = ?auto_175513 ?auto_175515 ) ) ( not ( = ?auto_175513 ?auto_175514 ) ) ( not ( = ?auto_175517 ?auto_175515 ) ) ( not ( = ?auto_175517 ?auto_175514 ) ) ( ON ?auto_175516 ?auto_175517 ) ( ON ?auto_175515 ?auto_175516 ) ( CLEAR ?auto_175515 ) ( HOLDING ?auto_175514 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175514 )
      ( MAKE-3PILE ?auto_175510 ?auto_175511 ?auto_175512 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175529 - BLOCK
      ?auto_175530 - BLOCK
      ?auto_175531 - BLOCK
    )
    :vars
    (
      ?auto_175534 - BLOCK
      ?auto_175533 - BLOCK
      ?auto_175535 - BLOCK
      ?auto_175532 - BLOCK
      ?auto_175536 - BLOCK
      ?auto_175537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175534 ?auto_175531 ) ( ON-TABLE ?auto_175529 ) ( ON ?auto_175530 ?auto_175529 ) ( ON ?auto_175531 ?auto_175530 ) ( not ( = ?auto_175529 ?auto_175530 ) ) ( not ( = ?auto_175529 ?auto_175531 ) ) ( not ( = ?auto_175529 ?auto_175534 ) ) ( not ( = ?auto_175530 ?auto_175531 ) ) ( not ( = ?auto_175530 ?auto_175534 ) ) ( not ( = ?auto_175531 ?auto_175534 ) ) ( not ( = ?auto_175529 ?auto_175533 ) ) ( not ( = ?auto_175529 ?auto_175535 ) ) ( not ( = ?auto_175530 ?auto_175533 ) ) ( not ( = ?auto_175530 ?auto_175535 ) ) ( not ( = ?auto_175531 ?auto_175533 ) ) ( not ( = ?auto_175531 ?auto_175535 ) ) ( not ( = ?auto_175534 ?auto_175533 ) ) ( not ( = ?auto_175534 ?auto_175535 ) ) ( not ( = ?auto_175533 ?auto_175535 ) ) ( ON ?auto_175533 ?auto_175534 ) ( not ( = ?auto_175532 ?auto_175536 ) ) ( not ( = ?auto_175532 ?auto_175535 ) ) ( not ( = ?auto_175536 ?auto_175535 ) ) ( not ( = ?auto_175529 ?auto_175536 ) ) ( not ( = ?auto_175529 ?auto_175532 ) ) ( not ( = ?auto_175530 ?auto_175536 ) ) ( not ( = ?auto_175530 ?auto_175532 ) ) ( not ( = ?auto_175531 ?auto_175536 ) ) ( not ( = ?auto_175531 ?auto_175532 ) ) ( not ( = ?auto_175534 ?auto_175536 ) ) ( not ( = ?auto_175534 ?auto_175532 ) ) ( not ( = ?auto_175533 ?auto_175536 ) ) ( not ( = ?auto_175533 ?auto_175532 ) ) ( ON ?auto_175535 ?auto_175533 ) ( ON ?auto_175536 ?auto_175535 ) ( CLEAR ?auto_175536 ) ( ON ?auto_175532 ?auto_175537 ) ( CLEAR ?auto_175532 ) ( HAND-EMPTY ) ( not ( = ?auto_175529 ?auto_175537 ) ) ( not ( = ?auto_175530 ?auto_175537 ) ) ( not ( = ?auto_175531 ?auto_175537 ) ) ( not ( = ?auto_175534 ?auto_175537 ) ) ( not ( = ?auto_175533 ?auto_175537 ) ) ( not ( = ?auto_175535 ?auto_175537 ) ) ( not ( = ?auto_175532 ?auto_175537 ) ) ( not ( = ?auto_175536 ?auto_175537 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175532 ?auto_175537 )
      ( MAKE-3PILE ?auto_175529 ?auto_175530 ?auto_175531 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175538 - BLOCK
      ?auto_175539 - BLOCK
      ?auto_175540 - BLOCK
    )
    :vars
    (
      ?auto_175546 - BLOCK
      ?auto_175542 - BLOCK
      ?auto_175545 - BLOCK
      ?auto_175544 - BLOCK
      ?auto_175543 - BLOCK
      ?auto_175541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175546 ?auto_175540 ) ( ON-TABLE ?auto_175538 ) ( ON ?auto_175539 ?auto_175538 ) ( ON ?auto_175540 ?auto_175539 ) ( not ( = ?auto_175538 ?auto_175539 ) ) ( not ( = ?auto_175538 ?auto_175540 ) ) ( not ( = ?auto_175538 ?auto_175546 ) ) ( not ( = ?auto_175539 ?auto_175540 ) ) ( not ( = ?auto_175539 ?auto_175546 ) ) ( not ( = ?auto_175540 ?auto_175546 ) ) ( not ( = ?auto_175538 ?auto_175542 ) ) ( not ( = ?auto_175538 ?auto_175545 ) ) ( not ( = ?auto_175539 ?auto_175542 ) ) ( not ( = ?auto_175539 ?auto_175545 ) ) ( not ( = ?auto_175540 ?auto_175542 ) ) ( not ( = ?auto_175540 ?auto_175545 ) ) ( not ( = ?auto_175546 ?auto_175542 ) ) ( not ( = ?auto_175546 ?auto_175545 ) ) ( not ( = ?auto_175542 ?auto_175545 ) ) ( ON ?auto_175542 ?auto_175546 ) ( not ( = ?auto_175544 ?auto_175543 ) ) ( not ( = ?auto_175544 ?auto_175545 ) ) ( not ( = ?auto_175543 ?auto_175545 ) ) ( not ( = ?auto_175538 ?auto_175543 ) ) ( not ( = ?auto_175538 ?auto_175544 ) ) ( not ( = ?auto_175539 ?auto_175543 ) ) ( not ( = ?auto_175539 ?auto_175544 ) ) ( not ( = ?auto_175540 ?auto_175543 ) ) ( not ( = ?auto_175540 ?auto_175544 ) ) ( not ( = ?auto_175546 ?auto_175543 ) ) ( not ( = ?auto_175546 ?auto_175544 ) ) ( not ( = ?auto_175542 ?auto_175543 ) ) ( not ( = ?auto_175542 ?auto_175544 ) ) ( ON ?auto_175545 ?auto_175542 ) ( ON ?auto_175544 ?auto_175541 ) ( CLEAR ?auto_175544 ) ( not ( = ?auto_175538 ?auto_175541 ) ) ( not ( = ?auto_175539 ?auto_175541 ) ) ( not ( = ?auto_175540 ?auto_175541 ) ) ( not ( = ?auto_175546 ?auto_175541 ) ) ( not ( = ?auto_175542 ?auto_175541 ) ) ( not ( = ?auto_175545 ?auto_175541 ) ) ( not ( = ?auto_175544 ?auto_175541 ) ) ( not ( = ?auto_175543 ?auto_175541 ) ) ( HOLDING ?auto_175543 ) ( CLEAR ?auto_175545 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175538 ?auto_175539 ?auto_175540 ?auto_175546 ?auto_175542 ?auto_175545 ?auto_175543 )
      ( MAKE-3PILE ?auto_175538 ?auto_175539 ?auto_175540 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175547 - BLOCK
      ?auto_175548 - BLOCK
      ?auto_175549 - BLOCK
    )
    :vars
    (
      ?auto_175553 - BLOCK
      ?auto_175550 - BLOCK
      ?auto_175555 - BLOCK
      ?auto_175552 - BLOCK
      ?auto_175551 - BLOCK
      ?auto_175554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175553 ?auto_175549 ) ( ON-TABLE ?auto_175547 ) ( ON ?auto_175548 ?auto_175547 ) ( ON ?auto_175549 ?auto_175548 ) ( not ( = ?auto_175547 ?auto_175548 ) ) ( not ( = ?auto_175547 ?auto_175549 ) ) ( not ( = ?auto_175547 ?auto_175553 ) ) ( not ( = ?auto_175548 ?auto_175549 ) ) ( not ( = ?auto_175548 ?auto_175553 ) ) ( not ( = ?auto_175549 ?auto_175553 ) ) ( not ( = ?auto_175547 ?auto_175550 ) ) ( not ( = ?auto_175547 ?auto_175555 ) ) ( not ( = ?auto_175548 ?auto_175550 ) ) ( not ( = ?auto_175548 ?auto_175555 ) ) ( not ( = ?auto_175549 ?auto_175550 ) ) ( not ( = ?auto_175549 ?auto_175555 ) ) ( not ( = ?auto_175553 ?auto_175550 ) ) ( not ( = ?auto_175553 ?auto_175555 ) ) ( not ( = ?auto_175550 ?auto_175555 ) ) ( ON ?auto_175550 ?auto_175553 ) ( not ( = ?auto_175552 ?auto_175551 ) ) ( not ( = ?auto_175552 ?auto_175555 ) ) ( not ( = ?auto_175551 ?auto_175555 ) ) ( not ( = ?auto_175547 ?auto_175551 ) ) ( not ( = ?auto_175547 ?auto_175552 ) ) ( not ( = ?auto_175548 ?auto_175551 ) ) ( not ( = ?auto_175548 ?auto_175552 ) ) ( not ( = ?auto_175549 ?auto_175551 ) ) ( not ( = ?auto_175549 ?auto_175552 ) ) ( not ( = ?auto_175553 ?auto_175551 ) ) ( not ( = ?auto_175553 ?auto_175552 ) ) ( not ( = ?auto_175550 ?auto_175551 ) ) ( not ( = ?auto_175550 ?auto_175552 ) ) ( ON ?auto_175555 ?auto_175550 ) ( ON ?auto_175552 ?auto_175554 ) ( not ( = ?auto_175547 ?auto_175554 ) ) ( not ( = ?auto_175548 ?auto_175554 ) ) ( not ( = ?auto_175549 ?auto_175554 ) ) ( not ( = ?auto_175553 ?auto_175554 ) ) ( not ( = ?auto_175550 ?auto_175554 ) ) ( not ( = ?auto_175555 ?auto_175554 ) ) ( not ( = ?auto_175552 ?auto_175554 ) ) ( not ( = ?auto_175551 ?auto_175554 ) ) ( CLEAR ?auto_175555 ) ( ON ?auto_175551 ?auto_175552 ) ( CLEAR ?auto_175551 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175554 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175554 ?auto_175552 )
      ( MAKE-3PILE ?auto_175547 ?auto_175548 ?auto_175549 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175556 - BLOCK
      ?auto_175557 - BLOCK
      ?auto_175558 - BLOCK
    )
    :vars
    (
      ?auto_175560 - BLOCK
      ?auto_175564 - BLOCK
      ?auto_175559 - BLOCK
      ?auto_175563 - BLOCK
      ?auto_175561 - BLOCK
      ?auto_175562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175560 ?auto_175558 ) ( ON-TABLE ?auto_175556 ) ( ON ?auto_175557 ?auto_175556 ) ( ON ?auto_175558 ?auto_175557 ) ( not ( = ?auto_175556 ?auto_175557 ) ) ( not ( = ?auto_175556 ?auto_175558 ) ) ( not ( = ?auto_175556 ?auto_175560 ) ) ( not ( = ?auto_175557 ?auto_175558 ) ) ( not ( = ?auto_175557 ?auto_175560 ) ) ( not ( = ?auto_175558 ?auto_175560 ) ) ( not ( = ?auto_175556 ?auto_175564 ) ) ( not ( = ?auto_175556 ?auto_175559 ) ) ( not ( = ?auto_175557 ?auto_175564 ) ) ( not ( = ?auto_175557 ?auto_175559 ) ) ( not ( = ?auto_175558 ?auto_175564 ) ) ( not ( = ?auto_175558 ?auto_175559 ) ) ( not ( = ?auto_175560 ?auto_175564 ) ) ( not ( = ?auto_175560 ?auto_175559 ) ) ( not ( = ?auto_175564 ?auto_175559 ) ) ( ON ?auto_175564 ?auto_175560 ) ( not ( = ?auto_175563 ?auto_175561 ) ) ( not ( = ?auto_175563 ?auto_175559 ) ) ( not ( = ?auto_175561 ?auto_175559 ) ) ( not ( = ?auto_175556 ?auto_175561 ) ) ( not ( = ?auto_175556 ?auto_175563 ) ) ( not ( = ?auto_175557 ?auto_175561 ) ) ( not ( = ?auto_175557 ?auto_175563 ) ) ( not ( = ?auto_175558 ?auto_175561 ) ) ( not ( = ?auto_175558 ?auto_175563 ) ) ( not ( = ?auto_175560 ?auto_175561 ) ) ( not ( = ?auto_175560 ?auto_175563 ) ) ( not ( = ?auto_175564 ?auto_175561 ) ) ( not ( = ?auto_175564 ?auto_175563 ) ) ( ON ?auto_175563 ?auto_175562 ) ( not ( = ?auto_175556 ?auto_175562 ) ) ( not ( = ?auto_175557 ?auto_175562 ) ) ( not ( = ?auto_175558 ?auto_175562 ) ) ( not ( = ?auto_175560 ?auto_175562 ) ) ( not ( = ?auto_175564 ?auto_175562 ) ) ( not ( = ?auto_175559 ?auto_175562 ) ) ( not ( = ?auto_175563 ?auto_175562 ) ) ( not ( = ?auto_175561 ?auto_175562 ) ) ( ON ?auto_175561 ?auto_175563 ) ( CLEAR ?auto_175561 ) ( ON-TABLE ?auto_175562 ) ( HOLDING ?auto_175559 ) ( CLEAR ?auto_175564 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175556 ?auto_175557 ?auto_175558 ?auto_175560 ?auto_175564 ?auto_175559 )
      ( MAKE-3PILE ?auto_175556 ?auto_175557 ?auto_175558 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175623 - BLOCK
      ?auto_175624 - BLOCK
      ?auto_175625 - BLOCK
      ?auto_175626 - BLOCK
      ?auto_175627 - BLOCK
    )
    :vars
    (
      ?auto_175628 - BLOCK
      ?auto_175630 - BLOCK
      ?auto_175629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175623 ) ( ON ?auto_175624 ?auto_175623 ) ( ON ?auto_175625 ?auto_175624 ) ( not ( = ?auto_175623 ?auto_175624 ) ) ( not ( = ?auto_175623 ?auto_175625 ) ) ( not ( = ?auto_175623 ?auto_175626 ) ) ( not ( = ?auto_175623 ?auto_175627 ) ) ( not ( = ?auto_175624 ?auto_175625 ) ) ( not ( = ?auto_175624 ?auto_175626 ) ) ( not ( = ?auto_175624 ?auto_175627 ) ) ( not ( = ?auto_175625 ?auto_175626 ) ) ( not ( = ?auto_175625 ?auto_175627 ) ) ( not ( = ?auto_175626 ?auto_175627 ) ) ( ON ?auto_175627 ?auto_175628 ) ( not ( = ?auto_175623 ?auto_175628 ) ) ( not ( = ?auto_175624 ?auto_175628 ) ) ( not ( = ?auto_175625 ?auto_175628 ) ) ( not ( = ?auto_175626 ?auto_175628 ) ) ( not ( = ?auto_175627 ?auto_175628 ) ) ( CLEAR ?auto_175625 ) ( ON ?auto_175626 ?auto_175627 ) ( CLEAR ?auto_175626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175630 ) ( ON ?auto_175629 ?auto_175630 ) ( ON ?auto_175628 ?auto_175629 ) ( not ( = ?auto_175630 ?auto_175629 ) ) ( not ( = ?auto_175630 ?auto_175628 ) ) ( not ( = ?auto_175630 ?auto_175627 ) ) ( not ( = ?auto_175630 ?auto_175626 ) ) ( not ( = ?auto_175629 ?auto_175628 ) ) ( not ( = ?auto_175629 ?auto_175627 ) ) ( not ( = ?auto_175629 ?auto_175626 ) ) ( not ( = ?auto_175623 ?auto_175630 ) ) ( not ( = ?auto_175623 ?auto_175629 ) ) ( not ( = ?auto_175624 ?auto_175630 ) ) ( not ( = ?auto_175624 ?auto_175629 ) ) ( not ( = ?auto_175625 ?auto_175630 ) ) ( not ( = ?auto_175625 ?auto_175629 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175630 ?auto_175629 ?auto_175628 ?auto_175627 )
      ( MAKE-5PILE ?auto_175623 ?auto_175624 ?auto_175625 ?auto_175626 ?auto_175627 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175631 - BLOCK
      ?auto_175632 - BLOCK
      ?auto_175633 - BLOCK
      ?auto_175634 - BLOCK
      ?auto_175635 - BLOCK
    )
    :vars
    (
      ?auto_175636 - BLOCK
      ?auto_175637 - BLOCK
      ?auto_175638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175631 ) ( ON ?auto_175632 ?auto_175631 ) ( not ( = ?auto_175631 ?auto_175632 ) ) ( not ( = ?auto_175631 ?auto_175633 ) ) ( not ( = ?auto_175631 ?auto_175634 ) ) ( not ( = ?auto_175631 ?auto_175635 ) ) ( not ( = ?auto_175632 ?auto_175633 ) ) ( not ( = ?auto_175632 ?auto_175634 ) ) ( not ( = ?auto_175632 ?auto_175635 ) ) ( not ( = ?auto_175633 ?auto_175634 ) ) ( not ( = ?auto_175633 ?auto_175635 ) ) ( not ( = ?auto_175634 ?auto_175635 ) ) ( ON ?auto_175635 ?auto_175636 ) ( not ( = ?auto_175631 ?auto_175636 ) ) ( not ( = ?auto_175632 ?auto_175636 ) ) ( not ( = ?auto_175633 ?auto_175636 ) ) ( not ( = ?auto_175634 ?auto_175636 ) ) ( not ( = ?auto_175635 ?auto_175636 ) ) ( ON ?auto_175634 ?auto_175635 ) ( CLEAR ?auto_175634 ) ( ON-TABLE ?auto_175637 ) ( ON ?auto_175638 ?auto_175637 ) ( ON ?auto_175636 ?auto_175638 ) ( not ( = ?auto_175637 ?auto_175638 ) ) ( not ( = ?auto_175637 ?auto_175636 ) ) ( not ( = ?auto_175637 ?auto_175635 ) ) ( not ( = ?auto_175637 ?auto_175634 ) ) ( not ( = ?auto_175638 ?auto_175636 ) ) ( not ( = ?auto_175638 ?auto_175635 ) ) ( not ( = ?auto_175638 ?auto_175634 ) ) ( not ( = ?auto_175631 ?auto_175637 ) ) ( not ( = ?auto_175631 ?auto_175638 ) ) ( not ( = ?auto_175632 ?auto_175637 ) ) ( not ( = ?auto_175632 ?auto_175638 ) ) ( not ( = ?auto_175633 ?auto_175637 ) ) ( not ( = ?auto_175633 ?auto_175638 ) ) ( HOLDING ?auto_175633 ) ( CLEAR ?auto_175632 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175631 ?auto_175632 ?auto_175633 )
      ( MAKE-5PILE ?auto_175631 ?auto_175632 ?auto_175633 ?auto_175634 ?auto_175635 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175639 - BLOCK
      ?auto_175640 - BLOCK
      ?auto_175641 - BLOCK
      ?auto_175642 - BLOCK
      ?auto_175643 - BLOCK
    )
    :vars
    (
      ?auto_175646 - BLOCK
      ?auto_175644 - BLOCK
      ?auto_175645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175639 ) ( ON ?auto_175640 ?auto_175639 ) ( not ( = ?auto_175639 ?auto_175640 ) ) ( not ( = ?auto_175639 ?auto_175641 ) ) ( not ( = ?auto_175639 ?auto_175642 ) ) ( not ( = ?auto_175639 ?auto_175643 ) ) ( not ( = ?auto_175640 ?auto_175641 ) ) ( not ( = ?auto_175640 ?auto_175642 ) ) ( not ( = ?auto_175640 ?auto_175643 ) ) ( not ( = ?auto_175641 ?auto_175642 ) ) ( not ( = ?auto_175641 ?auto_175643 ) ) ( not ( = ?auto_175642 ?auto_175643 ) ) ( ON ?auto_175643 ?auto_175646 ) ( not ( = ?auto_175639 ?auto_175646 ) ) ( not ( = ?auto_175640 ?auto_175646 ) ) ( not ( = ?auto_175641 ?auto_175646 ) ) ( not ( = ?auto_175642 ?auto_175646 ) ) ( not ( = ?auto_175643 ?auto_175646 ) ) ( ON ?auto_175642 ?auto_175643 ) ( ON-TABLE ?auto_175644 ) ( ON ?auto_175645 ?auto_175644 ) ( ON ?auto_175646 ?auto_175645 ) ( not ( = ?auto_175644 ?auto_175645 ) ) ( not ( = ?auto_175644 ?auto_175646 ) ) ( not ( = ?auto_175644 ?auto_175643 ) ) ( not ( = ?auto_175644 ?auto_175642 ) ) ( not ( = ?auto_175645 ?auto_175646 ) ) ( not ( = ?auto_175645 ?auto_175643 ) ) ( not ( = ?auto_175645 ?auto_175642 ) ) ( not ( = ?auto_175639 ?auto_175644 ) ) ( not ( = ?auto_175639 ?auto_175645 ) ) ( not ( = ?auto_175640 ?auto_175644 ) ) ( not ( = ?auto_175640 ?auto_175645 ) ) ( not ( = ?auto_175641 ?auto_175644 ) ) ( not ( = ?auto_175641 ?auto_175645 ) ) ( CLEAR ?auto_175640 ) ( ON ?auto_175641 ?auto_175642 ) ( CLEAR ?auto_175641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175644 ?auto_175645 ?auto_175646 ?auto_175643 ?auto_175642 )
      ( MAKE-5PILE ?auto_175639 ?auto_175640 ?auto_175641 ?auto_175642 ?auto_175643 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175647 - BLOCK
      ?auto_175648 - BLOCK
      ?auto_175649 - BLOCK
      ?auto_175650 - BLOCK
      ?auto_175651 - BLOCK
    )
    :vars
    (
      ?auto_175654 - BLOCK
      ?auto_175653 - BLOCK
      ?auto_175652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175647 ) ( not ( = ?auto_175647 ?auto_175648 ) ) ( not ( = ?auto_175647 ?auto_175649 ) ) ( not ( = ?auto_175647 ?auto_175650 ) ) ( not ( = ?auto_175647 ?auto_175651 ) ) ( not ( = ?auto_175648 ?auto_175649 ) ) ( not ( = ?auto_175648 ?auto_175650 ) ) ( not ( = ?auto_175648 ?auto_175651 ) ) ( not ( = ?auto_175649 ?auto_175650 ) ) ( not ( = ?auto_175649 ?auto_175651 ) ) ( not ( = ?auto_175650 ?auto_175651 ) ) ( ON ?auto_175651 ?auto_175654 ) ( not ( = ?auto_175647 ?auto_175654 ) ) ( not ( = ?auto_175648 ?auto_175654 ) ) ( not ( = ?auto_175649 ?auto_175654 ) ) ( not ( = ?auto_175650 ?auto_175654 ) ) ( not ( = ?auto_175651 ?auto_175654 ) ) ( ON ?auto_175650 ?auto_175651 ) ( ON-TABLE ?auto_175653 ) ( ON ?auto_175652 ?auto_175653 ) ( ON ?auto_175654 ?auto_175652 ) ( not ( = ?auto_175653 ?auto_175652 ) ) ( not ( = ?auto_175653 ?auto_175654 ) ) ( not ( = ?auto_175653 ?auto_175651 ) ) ( not ( = ?auto_175653 ?auto_175650 ) ) ( not ( = ?auto_175652 ?auto_175654 ) ) ( not ( = ?auto_175652 ?auto_175651 ) ) ( not ( = ?auto_175652 ?auto_175650 ) ) ( not ( = ?auto_175647 ?auto_175653 ) ) ( not ( = ?auto_175647 ?auto_175652 ) ) ( not ( = ?auto_175648 ?auto_175653 ) ) ( not ( = ?auto_175648 ?auto_175652 ) ) ( not ( = ?auto_175649 ?auto_175653 ) ) ( not ( = ?auto_175649 ?auto_175652 ) ) ( ON ?auto_175649 ?auto_175650 ) ( CLEAR ?auto_175649 ) ( HOLDING ?auto_175648 ) ( CLEAR ?auto_175647 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175647 ?auto_175648 )
      ( MAKE-5PILE ?auto_175647 ?auto_175648 ?auto_175649 ?auto_175650 ?auto_175651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175655 - BLOCK
      ?auto_175656 - BLOCK
      ?auto_175657 - BLOCK
      ?auto_175658 - BLOCK
      ?auto_175659 - BLOCK
    )
    :vars
    (
      ?auto_175662 - BLOCK
      ?auto_175661 - BLOCK
      ?auto_175660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175655 ) ( not ( = ?auto_175655 ?auto_175656 ) ) ( not ( = ?auto_175655 ?auto_175657 ) ) ( not ( = ?auto_175655 ?auto_175658 ) ) ( not ( = ?auto_175655 ?auto_175659 ) ) ( not ( = ?auto_175656 ?auto_175657 ) ) ( not ( = ?auto_175656 ?auto_175658 ) ) ( not ( = ?auto_175656 ?auto_175659 ) ) ( not ( = ?auto_175657 ?auto_175658 ) ) ( not ( = ?auto_175657 ?auto_175659 ) ) ( not ( = ?auto_175658 ?auto_175659 ) ) ( ON ?auto_175659 ?auto_175662 ) ( not ( = ?auto_175655 ?auto_175662 ) ) ( not ( = ?auto_175656 ?auto_175662 ) ) ( not ( = ?auto_175657 ?auto_175662 ) ) ( not ( = ?auto_175658 ?auto_175662 ) ) ( not ( = ?auto_175659 ?auto_175662 ) ) ( ON ?auto_175658 ?auto_175659 ) ( ON-TABLE ?auto_175661 ) ( ON ?auto_175660 ?auto_175661 ) ( ON ?auto_175662 ?auto_175660 ) ( not ( = ?auto_175661 ?auto_175660 ) ) ( not ( = ?auto_175661 ?auto_175662 ) ) ( not ( = ?auto_175661 ?auto_175659 ) ) ( not ( = ?auto_175661 ?auto_175658 ) ) ( not ( = ?auto_175660 ?auto_175662 ) ) ( not ( = ?auto_175660 ?auto_175659 ) ) ( not ( = ?auto_175660 ?auto_175658 ) ) ( not ( = ?auto_175655 ?auto_175661 ) ) ( not ( = ?auto_175655 ?auto_175660 ) ) ( not ( = ?auto_175656 ?auto_175661 ) ) ( not ( = ?auto_175656 ?auto_175660 ) ) ( not ( = ?auto_175657 ?auto_175661 ) ) ( not ( = ?auto_175657 ?auto_175660 ) ) ( ON ?auto_175657 ?auto_175658 ) ( CLEAR ?auto_175655 ) ( ON ?auto_175656 ?auto_175657 ) ( CLEAR ?auto_175656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175661 ?auto_175660 ?auto_175662 ?auto_175659 ?auto_175658 ?auto_175657 )
      ( MAKE-5PILE ?auto_175655 ?auto_175656 ?auto_175657 ?auto_175658 ?auto_175659 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175663 - BLOCK
      ?auto_175664 - BLOCK
      ?auto_175665 - BLOCK
      ?auto_175666 - BLOCK
      ?auto_175667 - BLOCK
    )
    :vars
    (
      ?auto_175669 - BLOCK
      ?auto_175670 - BLOCK
      ?auto_175668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175663 ?auto_175664 ) ) ( not ( = ?auto_175663 ?auto_175665 ) ) ( not ( = ?auto_175663 ?auto_175666 ) ) ( not ( = ?auto_175663 ?auto_175667 ) ) ( not ( = ?auto_175664 ?auto_175665 ) ) ( not ( = ?auto_175664 ?auto_175666 ) ) ( not ( = ?auto_175664 ?auto_175667 ) ) ( not ( = ?auto_175665 ?auto_175666 ) ) ( not ( = ?auto_175665 ?auto_175667 ) ) ( not ( = ?auto_175666 ?auto_175667 ) ) ( ON ?auto_175667 ?auto_175669 ) ( not ( = ?auto_175663 ?auto_175669 ) ) ( not ( = ?auto_175664 ?auto_175669 ) ) ( not ( = ?auto_175665 ?auto_175669 ) ) ( not ( = ?auto_175666 ?auto_175669 ) ) ( not ( = ?auto_175667 ?auto_175669 ) ) ( ON ?auto_175666 ?auto_175667 ) ( ON-TABLE ?auto_175670 ) ( ON ?auto_175668 ?auto_175670 ) ( ON ?auto_175669 ?auto_175668 ) ( not ( = ?auto_175670 ?auto_175668 ) ) ( not ( = ?auto_175670 ?auto_175669 ) ) ( not ( = ?auto_175670 ?auto_175667 ) ) ( not ( = ?auto_175670 ?auto_175666 ) ) ( not ( = ?auto_175668 ?auto_175669 ) ) ( not ( = ?auto_175668 ?auto_175667 ) ) ( not ( = ?auto_175668 ?auto_175666 ) ) ( not ( = ?auto_175663 ?auto_175670 ) ) ( not ( = ?auto_175663 ?auto_175668 ) ) ( not ( = ?auto_175664 ?auto_175670 ) ) ( not ( = ?auto_175664 ?auto_175668 ) ) ( not ( = ?auto_175665 ?auto_175670 ) ) ( not ( = ?auto_175665 ?auto_175668 ) ) ( ON ?auto_175665 ?auto_175666 ) ( ON ?auto_175664 ?auto_175665 ) ( CLEAR ?auto_175664 ) ( HOLDING ?auto_175663 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175663 )
      ( MAKE-5PILE ?auto_175663 ?auto_175664 ?auto_175665 ?auto_175666 ?auto_175667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175671 - BLOCK
      ?auto_175672 - BLOCK
      ?auto_175673 - BLOCK
      ?auto_175674 - BLOCK
      ?auto_175675 - BLOCK
    )
    :vars
    (
      ?auto_175677 - BLOCK
      ?auto_175676 - BLOCK
      ?auto_175678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175671 ?auto_175672 ) ) ( not ( = ?auto_175671 ?auto_175673 ) ) ( not ( = ?auto_175671 ?auto_175674 ) ) ( not ( = ?auto_175671 ?auto_175675 ) ) ( not ( = ?auto_175672 ?auto_175673 ) ) ( not ( = ?auto_175672 ?auto_175674 ) ) ( not ( = ?auto_175672 ?auto_175675 ) ) ( not ( = ?auto_175673 ?auto_175674 ) ) ( not ( = ?auto_175673 ?auto_175675 ) ) ( not ( = ?auto_175674 ?auto_175675 ) ) ( ON ?auto_175675 ?auto_175677 ) ( not ( = ?auto_175671 ?auto_175677 ) ) ( not ( = ?auto_175672 ?auto_175677 ) ) ( not ( = ?auto_175673 ?auto_175677 ) ) ( not ( = ?auto_175674 ?auto_175677 ) ) ( not ( = ?auto_175675 ?auto_175677 ) ) ( ON ?auto_175674 ?auto_175675 ) ( ON-TABLE ?auto_175676 ) ( ON ?auto_175678 ?auto_175676 ) ( ON ?auto_175677 ?auto_175678 ) ( not ( = ?auto_175676 ?auto_175678 ) ) ( not ( = ?auto_175676 ?auto_175677 ) ) ( not ( = ?auto_175676 ?auto_175675 ) ) ( not ( = ?auto_175676 ?auto_175674 ) ) ( not ( = ?auto_175678 ?auto_175677 ) ) ( not ( = ?auto_175678 ?auto_175675 ) ) ( not ( = ?auto_175678 ?auto_175674 ) ) ( not ( = ?auto_175671 ?auto_175676 ) ) ( not ( = ?auto_175671 ?auto_175678 ) ) ( not ( = ?auto_175672 ?auto_175676 ) ) ( not ( = ?auto_175672 ?auto_175678 ) ) ( not ( = ?auto_175673 ?auto_175676 ) ) ( not ( = ?auto_175673 ?auto_175678 ) ) ( ON ?auto_175673 ?auto_175674 ) ( ON ?auto_175672 ?auto_175673 ) ( ON ?auto_175671 ?auto_175672 ) ( CLEAR ?auto_175671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175676 ?auto_175678 ?auto_175677 ?auto_175675 ?auto_175674 ?auto_175673 ?auto_175672 )
      ( MAKE-5PILE ?auto_175671 ?auto_175672 ?auto_175673 ?auto_175674 ?auto_175675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175684 - BLOCK
      ?auto_175685 - BLOCK
      ?auto_175686 - BLOCK
      ?auto_175687 - BLOCK
      ?auto_175688 - BLOCK
    )
    :vars
    (
      ?auto_175689 - BLOCK
      ?auto_175691 - BLOCK
      ?auto_175690 - BLOCK
      ?auto_175692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175684 ?auto_175685 ) ) ( not ( = ?auto_175684 ?auto_175686 ) ) ( not ( = ?auto_175684 ?auto_175687 ) ) ( not ( = ?auto_175684 ?auto_175688 ) ) ( not ( = ?auto_175685 ?auto_175686 ) ) ( not ( = ?auto_175685 ?auto_175687 ) ) ( not ( = ?auto_175685 ?auto_175688 ) ) ( not ( = ?auto_175686 ?auto_175687 ) ) ( not ( = ?auto_175686 ?auto_175688 ) ) ( not ( = ?auto_175687 ?auto_175688 ) ) ( ON ?auto_175688 ?auto_175689 ) ( not ( = ?auto_175684 ?auto_175689 ) ) ( not ( = ?auto_175685 ?auto_175689 ) ) ( not ( = ?auto_175686 ?auto_175689 ) ) ( not ( = ?auto_175687 ?auto_175689 ) ) ( not ( = ?auto_175688 ?auto_175689 ) ) ( ON ?auto_175687 ?auto_175688 ) ( ON-TABLE ?auto_175691 ) ( ON ?auto_175690 ?auto_175691 ) ( ON ?auto_175689 ?auto_175690 ) ( not ( = ?auto_175691 ?auto_175690 ) ) ( not ( = ?auto_175691 ?auto_175689 ) ) ( not ( = ?auto_175691 ?auto_175688 ) ) ( not ( = ?auto_175691 ?auto_175687 ) ) ( not ( = ?auto_175690 ?auto_175689 ) ) ( not ( = ?auto_175690 ?auto_175688 ) ) ( not ( = ?auto_175690 ?auto_175687 ) ) ( not ( = ?auto_175684 ?auto_175691 ) ) ( not ( = ?auto_175684 ?auto_175690 ) ) ( not ( = ?auto_175685 ?auto_175691 ) ) ( not ( = ?auto_175685 ?auto_175690 ) ) ( not ( = ?auto_175686 ?auto_175691 ) ) ( not ( = ?auto_175686 ?auto_175690 ) ) ( ON ?auto_175686 ?auto_175687 ) ( ON ?auto_175685 ?auto_175686 ) ( CLEAR ?auto_175685 ) ( ON ?auto_175684 ?auto_175692 ) ( CLEAR ?auto_175684 ) ( HAND-EMPTY ) ( not ( = ?auto_175684 ?auto_175692 ) ) ( not ( = ?auto_175685 ?auto_175692 ) ) ( not ( = ?auto_175686 ?auto_175692 ) ) ( not ( = ?auto_175687 ?auto_175692 ) ) ( not ( = ?auto_175688 ?auto_175692 ) ) ( not ( = ?auto_175689 ?auto_175692 ) ) ( not ( = ?auto_175691 ?auto_175692 ) ) ( not ( = ?auto_175690 ?auto_175692 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175684 ?auto_175692 )
      ( MAKE-5PILE ?auto_175684 ?auto_175685 ?auto_175686 ?auto_175687 ?auto_175688 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175693 - BLOCK
      ?auto_175694 - BLOCK
      ?auto_175695 - BLOCK
      ?auto_175696 - BLOCK
      ?auto_175697 - BLOCK
    )
    :vars
    (
      ?auto_175700 - BLOCK
      ?auto_175699 - BLOCK
      ?auto_175698 - BLOCK
      ?auto_175701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175693 ?auto_175694 ) ) ( not ( = ?auto_175693 ?auto_175695 ) ) ( not ( = ?auto_175693 ?auto_175696 ) ) ( not ( = ?auto_175693 ?auto_175697 ) ) ( not ( = ?auto_175694 ?auto_175695 ) ) ( not ( = ?auto_175694 ?auto_175696 ) ) ( not ( = ?auto_175694 ?auto_175697 ) ) ( not ( = ?auto_175695 ?auto_175696 ) ) ( not ( = ?auto_175695 ?auto_175697 ) ) ( not ( = ?auto_175696 ?auto_175697 ) ) ( ON ?auto_175697 ?auto_175700 ) ( not ( = ?auto_175693 ?auto_175700 ) ) ( not ( = ?auto_175694 ?auto_175700 ) ) ( not ( = ?auto_175695 ?auto_175700 ) ) ( not ( = ?auto_175696 ?auto_175700 ) ) ( not ( = ?auto_175697 ?auto_175700 ) ) ( ON ?auto_175696 ?auto_175697 ) ( ON-TABLE ?auto_175699 ) ( ON ?auto_175698 ?auto_175699 ) ( ON ?auto_175700 ?auto_175698 ) ( not ( = ?auto_175699 ?auto_175698 ) ) ( not ( = ?auto_175699 ?auto_175700 ) ) ( not ( = ?auto_175699 ?auto_175697 ) ) ( not ( = ?auto_175699 ?auto_175696 ) ) ( not ( = ?auto_175698 ?auto_175700 ) ) ( not ( = ?auto_175698 ?auto_175697 ) ) ( not ( = ?auto_175698 ?auto_175696 ) ) ( not ( = ?auto_175693 ?auto_175699 ) ) ( not ( = ?auto_175693 ?auto_175698 ) ) ( not ( = ?auto_175694 ?auto_175699 ) ) ( not ( = ?auto_175694 ?auto_175698 ) ) ( not ( = ?auto_175695 ?auto_175699 ) ) ( not ( = ?auto_175695 ?auto_175698 ) ) ( ON ?auto_175695 ?auto_175696 ) ( ON ?auto_175693 ?auto_175701 ) ( CLEAR ?auto_175693 ) ( not ( = ?auto_175693 ?auto_175701 ) ) ( not ( = ?auto_175694 ?auto_175701 ) ) ( not ( = ?auto_175695 ?auto_175701 ) ) ( not ( = ?auto_175696 ?auto_175701 ) ) ( not ( = ?auto_175697 ?auto_175701 ) ) ( not ( = ?auto_175700 ?auto_175701 ) ) ( not ( = ?auto_175699 ?auto_175701 ) ) ( not ( = ?auto_175698 ?auto_175701 ) ) ( HOLDING ?auto_175694 ) ( CLEAR ?auto_175695 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175699 ?auto_175698 ?auto_175700 ?auto_175697 ?auto_175696 ?auto_175695 ?auto_175694 )
      ( MAKE-5PILE ?auto_175693 ?auto_175694 ?auto_175695 ?auto_175696 ?auto_175697 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175702 - BLOCK
      ?auto_175703 - BLOCK
      ?auto_175704 - BLOCK
      ?auto_175705 - BLOCK
      ?auto_175706 - BLOCK
    )
    :vars
    (
      ?auto_175707 - BLOCK
      ?auto_175709 - BLOCK
      ?auto_175708 - BLOCK
      ?auto_175710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175702 ?auto_175703 ) ) ( not ( = ?auto_175702 ?auto_175704 ) ) ( not ( = ?auto_175702 ?auto_175705 ) ) ( not ( = ?auto_175702 ?auto_175706 ) ) ( not ( = ?auto_175703 ?auto_175704 ) ) ( not ( = ?auto_175703 ?auto_175705 ) ) ( not ( = ?auto_175703 ?auto_175706 ) ) ( not ( = ?auto_175704 ?auto_175705 ) ) ( not ( = ?auto_175704 ?auto_175706 ) ) ( not ( = ?auto_175705 ?auto_175706 ) ) ( ON ?auto_175706 ?auto_175707 ) ( not ( = ?auto_175702 ?auto_175707 ) ) ( not ( = ?auto_175703 ?auto_175707 ) ) ( not ( = ?auto_175704 ?auto_175707 ) ) ( not ( = ?auto_175705 ?auto_175707 ) ) ( not ( = ?auto_175706 ?auto_175707 ) ) ( ON ?auto_175705 ?auto_175706 ) ( ON-TABLE ?auto_175709 ) ( ON ?auto_175708 ?auto_175709 ) ( ON ?auto_175707 ?auto_175708 ) ( not ( = ?auto_175709 ?auto_175708 ) ) ( not ( = ?auto_175709 ?auto_175707 ) ) ( not ( = ?auto_175709 ?auto_175706 ) ) ( not ( = ?auto_175709 ?auto_175705 ) ) ( not ( = ?auto_175708 ?auto_175707 ) ) ( not ( = ?auto_175708 ?auto_175706 ) ) ( not ( = ?auto_175708 ?auto_175705 ) ) ( not ( = ?auto_175702 ?auto_175709 ) ) ( not ( = ?auto_175702 ?auto_175708 ) ) ( not ( = ?auto_175703 ?auto_175709 ) ) ( not ( = ?auto_175703 ?auto_175708 ) ) ( not ( = ?auto_175704 ?auto_175709 ) ) ( not ( = ?auto_175704 ?auto_175708 ) ) ( ON ?auto_175704 ?auto_175705 ) ( ON ?auto_175702 ?auto_175710 ) ( not ( = ?auto_175702 ?auto_175710 ) ) ( not ( = ?auto_175703 ?auto_175710 ) ) ( not ( = ?auto_175704 ?auto_175710 ) ) ( not ( = ?auto_175705 ?auto_175710 ) ) ( not ( = ?auto_175706 ?auto_175710 ) ) ( not ( = ?auto_175707 ?auto_175710 ) ) ( not ( = ?auto_175709 ?auto_175710 ) ) ( not ( = ?auto_175708 ?auto_175710 ) ) ( CLEAR ?auto_175704 ) ( ON ?auto_175703 ?auto_175702 ) ( CLEAR ?auto_175703 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175710 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175710 ?auto_175702 )
      ( MAKE-5PILE ?auto_175702 ?auto_175703 ?auto_175704 ?auto_175705 ?auto_175706 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175711 - BLOCK
      ?auto_175712 - BLOCK
      ?auto_175713 - BLOCK
      ?auto_175714 - BLOCK
      ?auto_175715 - BLOCK
    )
    :vars
    (
      ?auto_175716 - BLOCK
      ?auto_175717 - BLOCK
      ?auto_175719 - BLOCK
      ?auto_175718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175711 ?auto_175712 ) ) ( not ( = ?auto_175711 ?auto_175713 ) ) ( not ( = ?auto_175711 ?auto_175714 ) ) ( not ( = ?auto_175711 ?auto_175715 ) ) ( not ( = ?auto_175712 ?auto_175713 ) ) ( not ( = ?auto_175712 ?auto_175714 ) ) ( not ( = ?auto_175712 ?auto_175715 ) ) ( not ( = ?auto_175713 ?auto_175714 ) ) ( not ( = ?auto_175713 ?auto_175715 ) ) ( not ( = ?auto_175714 ?auto_175715 ) ) ( ON ?auto_175715 ?auto_175716 ) ( not ( = ?auto_175711 ?auto_175716 ) ) ( not ( = ?auto_175712 ?auto_175716 ) ) ( not ( = ?auto_175713 ?auto_175716 ) ) ( not ( = ?auto_175714 ?auto_175716 ) ) ( not ( = ?auto_175715 ?auto_175716 ) ) ( ON ?auto_175714 ?auto_175715 ) ( ON-TABLE ?auto_175717 ) ( ON ?auto_175719 ?auto_175717 ) ( ON ?auto_175716 ?auto_175719 ) ( not ( = ?auto_175717 ?auto_175719 ) ) ( not ( = ?auto_175717 ?auto_175716 ) ) ( not ( = ?auto_175717 ?auto_175715 ) ) ( not ( = ?auto_175717 ?auto_175714 ) ) ( not ( = ?auto_175719 ?auto_175716 ) ) ( not ( = ?auto_175719 ?auto_175715 ) ) ( not ( = ?auto_175719 ?auto_175714 ) ) ( not ( = ?auto_175711 ?auto_175717 ) ) ( not ( = ?auto_175711 ?auto_175719 ) ) ( not ( = ?auto_175712 ?auto_175717 ) ) ( not ( = ?auto_175712 ?auto_175719 ) ) ( not ( = ?auto_175713 ?auto_175717 ) ) ( not ( = ?auto_175713 ?auto_175719 ) ) ( ON ?auto_175711 ?auto_175718 ) ( not ( = ?auto_175711 ?auto_175718 ) ) ( not ( = ?auto_175712 ?auto_175718 ) ) ( not ( = ?auto_175713 ?auto_175718 ) ) ( not ( = ?auto_175714 ?auto_175718 ) ) ( not ( = ?auto_175715 ?auto_175718 ) ) ( not ( = ?auto_175716 ?auto_175718 ) ) ( not ( = ?auto_175717 ?auto_175718 ) ) ( not ( = ?auto_175719 ?auto_175718 ) ) ( ON ?auto_175712 ?auto_175711 ) ( CLEAR ?auto_175712 ) ( ON-TABLE ?auto_175718 ) ( HOLDING ?auto_175713 ) ( CLEAR ?auto_175714 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175717 ?auto_175719 ?auto_175716 ?auto_175715 ?auto_175714 ?auto_175713 )
      ( MAKE-5PILE ?auto_175711 ?auto_175712 ?auto_175713 ?auto_175714 ?auto_175715 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175720 - BLOCK
      ?auto_175721 - BLOCK
      ?auto_175722 - BLOCK
      ?auto_175723 - BLOCK
      ?auto_175724 - BLOCK
    )
    :vars
    (
      ?auto_175726 - BLOCK
      ?auto_175727 - BLOCK
      ?auto_175725 - BLOCK
      ?auto_175728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175720 ?auto_175721 ) ) ( not ( = ?auto_175720 ?auto_175722 ) ) ( not ( = ?auto_175720 ?auto_175723 ) ) ( not ( = ?auto_175720 ?auto_175724 ) ) ( not ( = ?auto_175721 ?auto_175722 ) ) ( not ( = ?auto_175721 ?auto_175723 ) ) ( not ( = ?auto_175721 ?auto_175724 ) ) ( not ( = ?auto_175722 ?auto_175723 ) ) ( not ( = ?auto_175722 ?auto_175724 ) ) ( not ( = ?auto_175723 ?auto_175724 ) ) ( ON ?auto_175724 ?auto_175726 ) ( not ( = ?auto_175720 ?auto_175726 ) ) ( not ( = ?auto_175721 ?auto_175726 ) ) ( not ( = ?auto_175722 ?auto_175726 ) ) ( not ( = ?auto_175723 ?auto_175726 ) ) ( not ( = ?auto_175724 ?auto_175726 ) ) ( ON ?auto_175723 ?auto_175724 ) ( ON-TABLE ?auto_175727 ) ( ON ?auto_175725 ?auto_175727 ) ( ON ?auto_175726 ?auto_175725 ) ( not ( = ?auto_175727 ?auto_175725 ) ) ( not ( = ?auto_175727 ?auto_175726 ) ) ( not ( = ?auto_175727 ?auto_175724 ) ) ( not ( = ?auto_175727 ?auto_175723 ) ) ( not ( = ?auto_175725 ?auto_175726 ) ) ( not ( = ?auto_175725 ?auto_175724 ) ) ( not ( = ?auto_175725 ?auto_175723 ) ) ( not ( = ?auto_175720 ?auto_175727 ) ) ( not ( = ?auto_175720 ?auto_175725 ) ) ( not ( = ?auto_175721 ?auto_175727 ) ) ( not ( = ?auto_175721 ?auto_175725 ) ) ( not ( = ?auto_175722 ?auto_175727 ) ) ( not ( = ?auto_175722 ?auto_175725 ) ) ( ON ?auto_175720 ?auto_175728 ) ( not ( = ?auto_175720 ?auto_175728 ) ) ( not ( = ?auto_175721 ?auto_175728 ) ) ( not ( = ?auto_175722 ?auto_175728 ) ) ( not ( = ?auto_175723 ?auto_175728 ) ) ( not ( = ?auto_175724 ?auto_175728 ) ) ( not ( = ?auto_175726 ?auto_175728 ) ) ( not ( = ?auto_175727 ?auto_175728 ) ) ( not ( = ?auto_175725 ?auto_175728 ) ) ( ON ?auto_175721 ?auto_175720 ) ( ON-TABLE ?auto_175728 ) ( CLEAR ?auto_175723 ) ( ON ?auto_175722 ?auto_175721 ) ( CLEAR ?auto_175722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175728 ?auto_175720 ?auto_175721 )
      ( MAKE-5PILE ?auto_175720 ?auto_175721 ?auto_175722 ?auto_175723 ?auto_175724 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175729 - BLOCK
      ?auto_175730 - BLOCK
      ?auto_175731 - BLOCK
      ?auto_175732 - BLOCK
      ?auto_175733 - BLOCK
    )
    :vars
    (
      ?auto_175737 - BLOCK
      ?auto_175735 - BLOCK
      ?auto_175736 - BLOCK
      ?auto_175734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175729 ?auto_175730 ) ) ( not ( = ?auto_175729 ?auto_175731 ) ) ( not ( = ?auto_175729 ?auto_175732 ) ) ( not ( = ?auto_175729 ?auto_175733 ) ) ( not ( = ?auto_175730 ?auto_175731 ) ) ( not ( = ?auto_175730 ?auto_175732 ) ) ( not ( = ?auto_175730 ?auto_175733 ) ) ( not ( = ?auto_175731 ?auto_175732 ) ) ( not ( = ?auto_175731 ?auto_175733 ) ) ( not ( = ?auto_175732 ?auto_175733 ) ) ( ON ?auto_175733 ?auto_175737 ) ( not ( = ?auto_175729 ?auto_175737 ) ) ( not ( = ?auto_175730 ?auto_175737 ) ) ( not ( = ?auto_175731 ?auto_175737 ) ) ( not ( = ?auto_175732 ?auto_175737 ) ) ( not ( = ?auto_175733 ?auto_175737 ) ) ( ON-TABLE ?auto_175735 ) ( ON ?auto_175736 ?auto_175735 ) ( ON ?auto_175737 ?auto_175736 ) ( not ( = ?auto_175735 ?auto_175736 ) ) ( not ( = ?auto_175735 ?auto_175737 ) ) ( not ( = ?auto_175735 ?auto_175733 ) ) ( not ( = ?auto_175735 ?auto_175732 ) ) ( not ( = ?auto_175736 ?auto_175737 ) ) ( not ( = ?auto_175736 ?auto_175733 ) ) ( not ( = ?auto_175736 ?auto_175732 ) ) ( not ( = ?auto_175729 ?auto_175735 ) ) ( not ( = ?auto_175729 ?auto_175736 ) ) ( not ( = ?auto_175730 ?auto_175735 ) ) ( not ( = ?auto_175730 ?auto_175736 ) ) ( not ( = ?auto_175731 ?auto_175735 ) ) ( not ( = ?auto_175731 ?auto_175736 ) ) ( ON ?auto_175729 ?auto_175734 ) ( not ( = ?auto_175729 ?auto_175734 ) ) ( not ( = ?auto_175730 ?auto_175734 ) ) ( not ( = ?auto_175731 ?auto_175734 ) ) ( not ( = ?auto_175732 ?auto_175734 ) ) ( not ( = ?auto_175733 ?auto_175734 ) ) ( not ( = ?auto_175737 ?auto_175734 ) ) ( not ( = ?auto_175735 ?auto_175734 ) ) ( not ( = ?auto_175736 ?auto_175734 ) ) ( ON ?auto_175730 ?auto_175729 ) ( ON-TABLE ?auto_175734 ) ( ON ?auto_175731 ?auto_175730 ) ( CLEAR ?auto_175731 ) ( HOLDING ?auto_175732 ) ( CLEAR ?auto_175733 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175735 ?auto_175736 ?auto_175737 ?auto_175733 ?auto_175732 )
      ( MAKE-5PILE ?auto_175729 ?auto_175730 ?auto_175731 ?auto_175732 ?auto_175733 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175738 - BLOCK
      ?auto_175739 - BLOCK
      ?auto_175740 - BLOCK
      ?auto_175741 - BLOCK
      ?auto_175742 - BLOCK
    )
    :vars
    (
      ?auto_175744 - BLOCK
      ?auto_175743 - BLOCK
      ?auto_175745 - BLOCK
      ?auto_175746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175738 ?auto_175739 ) ) ( not ( = ?auto_175738 ?auto_175740 ) ) ( not ( = ?auto_175738 ?auto_175741 ) ) ( not ( = ?auto_175738 ?auto_175742 ) ) ( not ( = ?auto_175739 ?auto_175740 ) ) ( not ( = ?auto_175739 ?auto_175741 ) ) ( not ( = ?auto_175739 ?auto_175742 ) ) ( not ( = ?auto_175740 ?auto_175741 ) ) ( not ( = ?auto_175740 ?auto_175742 ) ) ( not ( = ?auto_175741 ?auto_175742 ) ) ( ON ?auto_175742 ?auto_175744 ) ( not ( = ?auto_175738 ?auto_175744 ) ) ( not ( = ?auto_175739 ?auto_175744 ) ) ( not ( = ?auto_175740 ?auto_175744 ) ) ( not ( = ?auto_175741 ?auto_175744 ) ) ( not ( = ?auto_175742 ?auto_175744 ) ) ( ON-TABLE ?auto_175743 ) ( ON ?auto_175745 ?auto_175743 ) ( ON ?auto_175744 ?auto_175745 ) ( not ( = ?auto_175743 ?auto_175745 ) ) ( not ( = ?auto_175743 ?auto_175744 ) ) ( not ( = ?auto_175743 ?auto_175742 ) ) ( not ( = ?auto_175743 ?auto_175741 ) ) ( not ( = ?auto_175745 ?auto_175744 ) ) ( not ( = ?auto_175745 ?auto_175742 ) ) ( not ( = ?auto_175745 ?auto_175741 ) ) ( not ( = ?auto_175738 ?auto_175743 ) ) ( not ( = ?auto_175738 ?auto_175745 ) ) ( not ( = ?auto_175739 ?auto_175743 ) ) ( not ( = ?auto_175739 ?auto_175745 ) ) ( not ( = ?auto_175740 ?auto_175743 ) ) ( not ( = ?auto_175740 ?auto_175745 ) ) ( ON ?auto_175738 ?auto_175746 ) ( not ( = ?auto_175738 ?auto_175746 ) ) ( not ( = ?auto_175739 ?auto_175746 ) ) ( not ( = ?auto_175740 ?auto_175746 ) ) ( not ( = ?auto_175741 ?auto_175746 ) ) ( not ( = ?auto_175742 ?auto_175746 ) ) ( not ( = ?auto_175744 ?auto_175746 ) ) ( not ( = ?auto_175743 ?auto_175746 ) ) ( not ( = ?auto_175745 ?auto_175746 ) ) ( ON ?auto_175739 ?auto_175738 ) ( ON-TABLE ?auto_175746 ) ( ON ?auto_175740 ?auto_175739 ) ( CLEAR ?auto_175742 ) ( ON ?auto_175741 ?auto_175740 ) ( CLEAR ?auto_175741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175746 ?auto_175738 ?auto_175739 ?auto_175740 )
      ( MAKE-5PILE ?auto_175738 ?auto_175739 ?auto_175740 ?auto_175741 ?auto_175742 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175747 - BLOCK
      ?auto_175748 - BLOCK
      ?auto_175749 - BLOCK
      ?auto_175750 - BLOCK
      ?auto_175751 - BLOCK
    )
    :vars
    (
      ?auto_175752 - BLOCK
      ?auto_175754 - BLOCK
      ?auto_175753 - BLOCK
      ?auto_175755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175747 ?auto_175748 ) ) ( not ( = ?auto_175747 ?auto_175749 ) ) ( not ( = ?auto_175747 ?auto_175750 ) ) ( not ( = ?auto_175747 ?auto_175751 ) ) ( not ( = ?auto_175748 ?auto_175749 ) ) ( not ( = ?auto_175748 ?auto_175750 ) ) ( not ( = ?auto_175748 ?auto_175751 ) ) ( not ( = ?auto_175749 ?auto_175750 ) ) ( not ( = ?auto_175749 ?auto_175751 ) ) ( not ( = ?auto_175750 ?auto_175751 ) ) ( not ( = ?auto_175747 ?auto_175752 ) ) ( not ( = ?auto_175748 ?auto_175752 ) ) ( not ( = ?auto_175749 ?auto_175752 ) ) ( not ( = ?auto_175750 ?auto_175752 ) ) ( not ( = ?auto_175751 ?auto_175752 ) ) ( ON-TABLE ?auto_175754 ) ( ON ?auto_175753 ?auto_175754 ) ( ON ?auto_175752 ?auto_175753 ) ( not ( = ?auto_175754 ?auto_175753 ) ) ( not ( = ?auto_175754 ?auto_175752 ) ) ( not ( = ?auto_175754 ?auto_175751 ) ) ( not ( = ?auto_175754 ?auto_175750 ) ) ( not ( = ?auto_175753 ?auto_175752 ) ) ( not ( = ?auto_175753 ?auto_175751 ) ) ( not ( = ?auto_175753 ?auto_175750 ) ) ( not ( = ?auto_175747 ?auto_175754 ) ) ( not ( = ?auto_175747 ?auto_175753 ) ) ( not ( = ?auto_175748 ?auto_175754 ) ) ( not ( = ?auto_175748 ?auto_175753 ) ) ( not ( = ?auto_175749 ?auto_175754 ) ) ( not ( = ?auto_175749 ?auto_175753 ) ) ( ON ?auto_175747 ?auto_175755 ) ( not ( = ?auto_175747 ?auto_175755 ) ) ( not ( = ?auto_175748 ?auto_175755 ) ) ( not ( = ?auto_175749 ?auto_175755 ) ) ( not ( = ?auto_175750 ?auto_175755 ) ) ( not ( = ?auto_175751 ?auto_175755 ) ) ( not ( = ?auto_175752 ?auto_175755 ) ) ( not ( = ?auto_175754 ?auto_175755 ) ) ( not ( = ?auto_175753 ?auto_175755 ) ) ( ON ?auto_175748 ?auto_175747 ) ( ON-TABLE ?auto_175755 ) ( ON ?auto_175749 ?auto_175748 ) ( ON ?auto_175750 ?auto_175749 ) ( CLEAR ?auto_175750 ) ( HOLDING ?auto_175751 ) ( CLEAR ?auto_175752 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175754 ?auto_175753 ?auto_175752 ?auto_175751 )
      ( MAKE-5PILE ?auto_175747 ?auto_175748 ?auto_175749 ?auto_175750 ?auto_175751 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175756 - BLOCK
      ?auto_175757 - BLOCK
      ?auto_175758 - BLOCK
      ?auto_175759 - BLOCK
      ?auto_175760 - BLOCK
    )
    :vars
    (
      ?auto_175764 - BLOCK
      ?auto_175763 - BLOCK
      ?auto_175762 - BLOCK
      ?auto_175761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175756 ?auto_175757 ) ) ( not ( = ?auto_175756 ?auto_175758 ) ) ( not ( = ?auto_175756 ?auto_175759 ) ) ( not ( = ?auto_175756 ?auto_175760 ) ) ( not ( = ?auto_175757 ?auto_175758 ) ) ( not ( = ?auto_175757 ?auto_175759 ) ) ( not ( = ?auto_175757 ?auto_175760 ) ) ( not ( = ?auto_175758 ?auto_175759 ) ) ( not ( = ?auto_175758 ?auto_175760 ) ) ( not ( = ?auto_175759 ?auto_175760 ) ) ( not ( = ?auto_175756 ?auto_175764 ) ) ( not ( = ?auto_175757 ?auto_175764 ) ) ( not ( = ?auto_175758 ?auto_175764 ) ) ( not ( = ?auto_175759 ?auto_175764 ) ) ( not ( = ?auto_175760 ?auto_175764 ) ) ( ON-TABLE ?auto_175763 ) ( ON ?auto_175762 ?auto_175763 ) ( ON ?auto_175764 ?auto_175762 ) ( not ( = ?auto_175763 ?auto_175762 ) ) ( not ( = ?auto_175763 ?auto_175764 ) ) ( not ( = ?auto_175763 ?auto_175760 ) ) ( not ( = ?auto_175763 ?auto_175759 ) ) ( not ( = ?auto_175762 ?auto_175764 ) ) ( not ( = ?auto_175762 ?auto_175760 ) ) ( not ( = ?auto_175762 ?auto_175759 ) ) ( not ( = ?auto_175756 ?auto_175763 ) ) ( not ( = ?auto_175756 ?auto_175762 ) ) ( not ( = ?auto_175757 ?auto_175763 ) ) ( not ( = ?auto_175757 ?auto_175762 ) ) ( not ( = ?auto_175758 ?auto_175763 ) ) ( not ( = ?auto_175758 ?auto_175762 ) ) ( ON ?auto_175756 ?auto_175761 ) ( not ( = ?auto_175756 ?auto_175761 ) ) ( not ( = ?auto_175757 ?auto_175761 ) ) ( not ( = ?auto_175758 ?auto_175761 ) ) ( not ( = ?auto_175759 ?auto_175761 ) ) ( not ( = ?auto_175760 ?auto_175761 ) ) ( not ( = ?auto_175764 ?auto_175761 ) ) ( not ( = ?auto_175763 ?auto_175761 ) ) ( not ( = ?auto_175762 ?auto_175761 ) ) ( ON ?auto_175757 ?auto_175756 ) ( ON-TABLE ?auto_175761 ) ( ON ?auto_175758 ?auto_175757 ) ( ON ?auto_175759 ?auto_175758 ) ( CLEAR ?auto_175764 ) ( ON ?auto_175760 ?auto_175759 ) ( CLEAR ?auto_175760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175761 ?auto_175756 ?auto_175757 ?auto_175758 ?auto_175759 )
      ( MAKE-5PILE ?auto_175756 ?auto_175757 ?auto_175758 ?auto_175759 ?auto_175760 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175765 - BLOCK
      ?auto_175766 - BLOCK
      ?auto_175767 - BLOCK
      ?auto_175768 - BLOCK
      ?auto_175769 - BLOCK
    )
    :vars
    (
      ?auto_175771 - BLOCK
      ?auto_175772 - BLOCK
      ?auto_175773 - BLOCK
      ?auto_175770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175765 ?auto_175766 ) ) ( not ( = ?auto_175765 ?auto_175767 ) ) ( not ( = ?auto_175765 ?auto_175768 ) ) ( not ( = ?auto_175765 ?auto_175769 ) ) ( not ( = ?auto_175766 ?auto_175767 ) ) ( not ( = ?auto_175766 ?auto_175768 ) ) ( not ( = ?auto_175766 ?auto_175769 ) ) ( not ( = ?auto_175767 ?auto_175768 ) ) ( not ( = ?auto_175767 ?auto_175769 ) ) ( not ( = ?auto_175768 ?auto_175769 ) ) ( not ( = ?auto_175765 ?auto_175771 ) ) ( not ( = ?auto_175766 ?auto_175771 ) ) ( not ( = ?auto_175767 ?auto_175771 ) ) ( not ( = ?auto_175768 ?auto_175771 ) ) ( not ( = ?auto_175769 ?auto_175771 ) ) ( ON-TABLE ?auto_175772 ) ( ON ?auto_175773 ?auto_175772 ) ( not ( = ?auto_175772 ?auto_175773 ) ) ( not ( = ?auto_175772 ?auto_175771 ) ) ( not ( = ?auto_175772 ?auto_175769 ) ) ( not ( = ?auto_175772 ?auto_175768 ) ) ( not ( = ?auto_175773 ?auto_175771 ) ) ( not ( = ?auto_175773 ?auto_175769 ) ) ( not ( = ?auto_175773 ?auto_175768 ) ) ( not ( = ?auto_175765 ?auto_175772 ) ) ( not ( = ?auto_175765 ?auto_175773 ) ) ( not ( = ?auto_175766 ?auto_175772 ) ) ( not ( = ?auto_175766 ?auto_175773 ) ) ( not ( = ?auto_175767 ?auto_175772 ) ) ( not ( = ?auto_175767 ?auto_175773 ) ) ( ON ?auto_175765 ?auto_175770 ) ( not ( = ?auto_175765 ?auto_175770 ) ) ( not ( = ?auto_175766 ?auto_175770 ) ) ( not ( = ?auto_175767 ?auto_175770 ) ) ( not ( = ?auto_175768 ?auto_175770 ) ) ( not ( = ?auto_175769 ?auto_175770 ) ) ( not ( = ?auto_175771 ?auto_175770 ) ) ( not ( = ?auto_175772 ?auto_175770 ) ) ( not ( = ?auto_175773 ?auto_175770 ) ) ( ON ?auto_175766 ?auto_175765 ) ( ON-TABLE ?auto_175770 ) ( ON ?auto_175767 ?auto_175766 ) ( ON ?auto_175768 ?auto_175767 ) ( ON ?auto_175769 ?auto_175768 ) ( CLEAR ?auto_175769 ) ( HOLDING ?auto_175771 ) ( CLEAR ?auto_175773 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175772 ?auto_175773 ?auto_175771 )
      ( MAKE-5PILE ?auto_175765 ?auto_175766 ?auto_175767 ?auto_175768 ?auto_175769 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175774 - BLOCK
      ?auto_175775 - BLOCK
      ?auto_175776 - BLOCK
      ?auto_175777 - BLOCK
      ?auto_175778 - BLOCK
    )
    :vars
    (
      ?auto_175781 - BLOCK
      ?auto_175782 - BLOCK
      ?auto_175780 - BLOCK
      ?auto_175779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175774 ?auto_175775 ) ) ( not ( = ?auto_175774 ?auto_175776 ) ) ( not ( = ?auto_175774 ?auto_175777 ) ) ( not ( = ?auto_175774 ?auto_175778 ) ) ( not ( = ?auto_175775 ?auto_175776 ) ) ( not ( = ?auto_175775 ?auto_175777 ) ) ( not ( = ?auto_175775 ?auto_175778 ) ) ( not ( = ?auto_175776 ?auto_175777 ) ) ( not ( = ?auto_175776 ?auto_175778 ) ) ( not ( = ?auto_175777 ?auto_175778 ) ) ( not ( = ?auto_175774 ?auto_175781 ) ) ( not ( = ?auto_175775 ?auto_175781 ) ) ( not ( = ?auto_175776 ?auto_175781 ) ) ( not ( = ?auto_175777 ?auto_175781 ) ) ( not ( = ?auto_175778 ?auto_175781 ) ) ( ON-TABLE ?auto_175782 ) ( ON ?auto_175780 ?auto_175782 ) ( not ( = ?auto_175782 ?auto_175780 ) ) ( not ( = ?auto_175782 ?auto_175781 ) ) ( not ( = ?auto_175782 ?auto_175778 ) ) ( not ( = ?auto_175782 ?auto_175777 ) ) ( not ( = ?auto_175780 ?auto_175781 ) ) ( not ( = ?auto_175780 ?auto_175778 ) ) ( not ( = ?auto_175780 ?auto_175777 ) ) ( not ( = ?auto_175774 ?auto_175782 ) ) ( not ( = ?auto_175774 ?auto_175780 ) ) ( not ( = ?auto_175775 ?auto_175782 ) ) ( not ( = ?auto_175775 ?auto_175780 ) ) ( not ( = ?auto_175776 ?auto_175782 ) ) ( not ( = ?auto_175776 ?auto_175780 ) ) ( ON ?auto_175774 ?auto_175779 ) ( not ( = ?auto_175774 ?auto_175779 ) ) ( not ( = ?auto_175775 ?auto_175779 ) ) ( not ( = ?auto_175776 ?auto_175779 ) ) ( not ( = ?auto_175777 ?auto_175779 ) ) ( not ( = ?auto_175778 ?auto_175779 ) ) ( not ( = ?auto_175781 ?auto_175779 ) ) ( not ( = ?auto_175782 ?auto_175779 ) ) ( not ( = ?auto_175780 ?auto_175779 ) ) ( ON ?auto_175775 ?auto_175774 ) ( ON-TABLE ?auto_175779 ) ( ON ?auto_175776 ?auto_175775 ) ( ON ?auto_175777 ?auto_175776 ) ( ON ?auto_175778 ?auto_175777 ) ( CLEAR ?auto_175780 ) ( ON ?auto_175781 ?auto_175778 ) ( CLEAR ?auto_175781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175779 ?auto_175774 ?auto_175775 ?auto_175776 ?auto_175777 ?auto_175778 )
      ( MAKE-5PILE ?auto_175774 ?auto_175775 ?auto_175776 ?auto_175777 ?auto_175778 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175783 - BLOCK
      ?auto_175784 - BLOCK
      ?auto_175785 - BLOCK
      ?auto_175786 - BLOCK
      ?auto_175787 - BLOCK
    )
    :vars
    (
      ?auto_175788 - BLOCK
      ?auto_175790 - BLOCK
      ?auto_175791 - BLOCK
      ?auto_175789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175783 ?auto_175784 ) ) ( not ( = ?auto_175783 ?auto_175785 ) ) ( not ( = ?auto_175783 ?auto_175786 ) ) ( not ( = ?auto_175783 ?auto_175787 ) ) ( not ( = ?auto_175784 ?auto_175785 ) ) ( not ( = ?auto_175784 ?auto_175786 ) ) ( not ( = ?auto_175784 ?auto_175787 ) ) ( not ( = ?auto_175785 ?auto_175786 ) ) ( not ( = ?auto_175785 ?auto_175787 ) ) ( not ( = ?auto_175786 ?auto_175787 ) ) ( not ( = ?auto_175783 ?auto_175788 ) ) ( not ( = ?auto_175784 ?auto_175788 ) ) ( not ( = ?auto_175785 ?auto_175788 ) ) ( not ( = ?auto_175786 ?auto_175788 ) ) ( not ( = ?auto_175787 ?auto_175788 ) ) ( ON-TABLE ?auto_175790 ) ( not ( = ?auto_175790 ?auto_175791 ) ) ( not ( = ?auto_175790 ?auto_175788 ) ) ( not ( = ?auto_175790 ?auto_175787 ) ) ( not ( = ?auto_175790 ?auto_175786 ) ) ( not ( = ?auto_175791 ?auto_175788 ) ) ( not ( = ?auto_175791 ?auto_175787 ) ) ( not ( = ?auto_175791 ?auto_175786 ) ) ( not ( = ?auto_175783 ?auto_175790 ) ) ( not ( = ?auto_175783 ?auto_175791 ) ) ( not ( = ?auto_175784 ?auto_175790 ) ) ( not ( = ?auto_175784 ?auto_175791 ) ) ( not ( = ?auto_175785 ?auto_175790 ) ) ( not ( = ?auto_175785 ?auto_175791 ) ) ( ON ?auto_175783 ?auto_175789 ) ( not ( = ?auto_175783 ?auto_175789 ) ) ( not ( = ?auto_175784 ?auto_175789 ) ) ( not ( = ?auto_175785 ?auto_175789 ) ) ( not ( = ?auto_175786 ?auto_175789 ) ) ( not ( = ?auto_175787 ?auto_175789 ) ) ( not ( = ?auto_175788 ?auto_175789 ) ) ( not ( = ?auto_175790 ?auto_175789 ) ) ( not ( = ?auto_175791 ?auto_175789 ) ) ( ON ?auto_175784 ?auto_175783 ) ( ON-TABLE ?auto_175789 ) ( ON ?auto_175785 ?auto_175784 ) ( ON ?auto_175786 ?auto_175785 ) ( ON ?auto_175787 ?auto_175786 ) ( ON ?auto_175788 ?auto_175787 ) ( CLEAR ?auto_175788 ) ( HOLDING ?auto_175791 ) ( CLEAR ?auto_175790 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175790 ?auto_175791 )
      ( MAKE-5PILE ?auto_175783 ?auto_175784 ?auto_175785 ?auto_175786 ?auto_175787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175792 - BLOCK
      ?auto_175793 - BLOCK
      ?auto_175794 - BLOCK
      ?auto_175795 - BLOCK
      ?auto_175796 - BLOCK
    )
    :vars
    (
      ?auto_175799 - BLOCK
      ?auto_175797 - BLOCK
      ?auto_175798 - BLOCK
      ?auto_175800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175792 ?auto_175793 ) ) ( not ( = ?auto_175792 ?auto_175794 ) ) ( not ( = ?auto_175792 ?auto_175795 ) ) ( not ( = ?auto_175792 ?auto_175796 ) ) ( not ( = ?auto_175793 ?auto_175794 ) ) ( not ( = ?auto_175793 ?auto_175795 ) ) ( not ( = ?auto_175793 ?auto_175796 ) ) ( not ( = ?auto_175794 ?auto_175795 ) ) ( not ( = ?auto_175794 ?auto_175796 ) ) ( not ( = ?auto_175795 ?auto_175796 ) ) ( not ( = ?auto_175792 ?auto_175799 ) ) ( not ( = ?auto_175793 ?auto_175799 ) ) ( not ( = ?auto_175794 ?auto_175799 ) ) ( not ( = ?auto_175795 ?auto_175799 ) ) ( not ( = ?auto_175796 ?auto_175799 ) ) ( ON-TABLE ?auto_175797 ) ( not ( = ?auto_175797 ?auto_175798 ) ) ( not ( = ?auto_175797 ?auto_175799 ) ) ( not ( = ?auto_175797 ?auto_175796 ) ) ( not ( = ?auto_175797 ?auto_175795 ) ) ( not ( = ?auto_175798 ?auto_175799 ) ) ( not ( = ?auto_175798 ?auto_175796 ) ) ( not ( = ?auto_175798 ?auto_175795 ) ) ( not ( = ?auto_175792 ?auto_175797 ) ) ( not ( = ?auto_175792 ?auto_175798 ) ) ( not ( = ?auto_175793 ?auto_175797 ) ) ( not ( = ?auto_175793 ?auto_175798 ) ) ( not ( = ?auto_175794 ?auto_175797 ) ) ( not ( = ?auto_175794 ?auto_175798 ) ) ( ON ?auto_175792 ?auto_175800 ) ( not ( = ?auto_175792 ?auto_175800 ) ) ( not ( = ?auto_175793 ?auto_175800 ) ) ( not ( = ?auto_175794 ?auto_175800 ) ) ( not ( = ?auto_175795 ?auto_175800 ) ) ( not ( = ?auto_175796 ?auto_175800 ) ) ( not ( = ?auto_175799 ?auto_175800 ) ) ( not ( = ?auto_175797 ?auto_175800 ) ) ( not ( = ?auto_175798 ?auto_175800 ) ) ( ON ?auto_175793 ?auto_175792 ) ( ON-TABLE ?auto_175800 ) ( ON ?auto_175794 ?auto_175793 ) ( ON ?auto_175795 ?auto_175794 ) ( ON ?auto_175796 ?auto_175795 ) ( ON ?auto_175799 ?auto_175796 ) ( CLEAR ?auto_175797 ) ( ON ?auto_175798 ?auto_175799 ) ( CLEAR ?auto_175798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175800 ?auto_175792 ?auto_175793 ?auto_175794 ?auto_175795 ?auto_175796 ?auto_175799 )
      ( MAKE-5PILE ?auto_175792 ?auto_175793 ?auto_175794 ?auto_175795 ?auto_175796 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175801 - BLOCK
      ?auto_175802 - BLOCK
      ?auto_175803 - BLOCK
      ?auto_175804 - BLOCK
      ?auto_175805 - BLOCK
    )
    :vars
    (
      ?auto_175806 - BLOCK
      ?auto_175809 - BLOCK
      ?auto_175807 - BLOCK
      ?auto_175808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175801 ?auto_175802 ) ) ( not ( = ?auto_175801 ?auto_175803 ) ) ( not ( = ?auto_175801 ?auto_175804 ) ) ( not ( = ?auto_175801 ?auto_175805 ) ) ( not ( = ?auto_175802 ?auto_175803 ) ) ( not ( = ?auto_175802 ?auto_175804 ) ) ( not ( = ?auto_175802 ?auto_175805 ) ) ( not ( = ?auto_175803 ?auto_175804 ) ) ( not ( = ?auto_175803 ?auto_175805 ) ) ( not ( = ?auto_175804 ?auto_175805 ) ) ( not ( = ?auto_175801 ?auto_175806 ) ) ( not ( = ?auto_175802 ?auto_175806 ) ) ( not ( = ?auto_175803 ?auto_175806 ) ) ( not ( = ?auto_175804 ?auto_175806 ) ) ( not ( = ?auto_175805 ?auto_175806 ) ) ( not ( = ?auto_175809 ?auto_175807 ) ) ( not ( = ?auto_175809 ?auto_175806 ) ) ( not ( = ?auto_175809 ?auto_175805 ) ) ( not ( = ?auto_175809 ?auto_175804 ) ) ( not ( = ?auto_175807 ?auto_175806 ) ) ( not ( = ?auto_175807 ?auto_175805 ) ) ( not ( = ?auto_175807 ?auto_175804 ) ) ( not ( = ?auto_175801 ?auto_175809 ) ) ( not ( = ?auto_175801 ?auto_175807 ) ) ( not ( = ?auto_175802 ?auto_175809 ) ) ( not ( = ?auto_175802 ?auto_175807 ) ) ( not ( = ?auto_175803 ?auto_175809 ) ) ( not ( = ?auto_175803 ?auto_175807 ) ) ( ON ?auto_175801 ?auto_175808 ) ( not ( = ?auto_175801 ?auto_175808 ) ) ( not ( = ?auto_175802 ?auto_175808 ) ) ( not ( = ?auto_175803 ?auto_175808 ) ) ( not ( = ?auto_175804 ?auto_175808 ) ) ( not ( = ?auto_175805 ?auto_175808 ) ) ( not ( = ?auto_175806 ?auto_175808 ) ) ( not ( = ?auto_175809 ?auto_175808 ) ) ( not ( = ?auto_175807 ?auto_175808 ) ) ( ON ?auto_175802 ?auto_175801 ) ( ON-TABLE ?auto_175808 ) ( ON ?auto_175803 ?auto_175802 ) ( ON ?auto_175804 ?auto_175803 ) ( ON ?auto_175805 ?auto_175804 ) ( ON ?auto_175806 ?auto_175805 ) ( ON ?auto_175807 ?auto_175806 ) ( CLEAR ?auto_175807 ) ( HOLDING ?auto_175809 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175809 )
      ( MAKE-5PILE ?auto_175801 ?auto_175802 ?auto_175803 ?auto_175804 ?auto_175805 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175810 - BLOCK
      ?auto_175811 - BLOCK
      ?auto_175812 - BLOCK
      ?auto_175813 - BLOCK
      ?auto_175814 - BLOCK
    )
    :vars
    (
      ?auto_175815 - BLOCK
      ?auto_175818 - BLOCK
      ?auto_175816 - BLOCK
      ?auto_175817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175810 ?auto_175811 ) ) ( not ( = ?auto_175810 ?auto_175812 ) ) ( not ( = ?auto_175810 ?auto_175813 ) ) ( not ( = ?auto_175810 ?auto_175814 ) ) ( not ( = ?auto_175811 ?auto_175812 ) ) ( not ( = ?auto_175811 ?auto_175813 ) ) ( not ( = ?auto_175811 ?auto_175814 ) ) ( not ( = ?auto_175812 ?auto_175813 ) ) ( not ( = ?auto_175812 ?auto_175814 ) ) ( not ( = ?auto_175813 ?auto_175814 ) ) ( not ( = ?auto_175810 ?auto_175815 ) ) ( not ( = ?auto_175811 ?auto_175815 ) ) ( not ( = ?auto_175812 ?auto_175815 ) ) ( not ( = ?auto_175813 ?auto_175815 ) ) ( not ( = ?auto_175814 ?auto_175815 ) ) ( not ( = ?auto_175818 ?auto_175816 ) ) ( not ( = ?auto_175818 ?auto_175815 ) ) ( not ( = ?auto_175818 ?auto_175814 ) ) ( not ( = ?auto_175818 ?auto_175813 ) ) ( not ( = ?auto_175816 ?auto_175815 ) ) ( not ( = ?auto_175816 ?auto_175814 ) ) ( not ( = ?auto_175816 ?auto_175813 ) ) ( not ( = ?auto_175810 ?auto_175818 ) ) ( not ( = ?auto_175810 ?auto_175816 ) ) ( not ( = ?auto_175811 ?auto_175818 ) ) ( not ( = ?auto_175811 ?auto_175816 ) ) ( not ( = ?auto_175812 ?auto_175818 ) ) ( not ( = ?auto_175812 ?auto_175816 ) ) ( ON ?auto_175810 ?auto_175817 ) ( not ( = ?auto_175810 ?auto_175817 ) ) ( not ( = ?auto_175811 ?auto_175817 ) ) ( not ( = ?auto_175812 ?auto_175817 ) ) ( not ( = ?auto_175813 ?auto_175817 ) ) ( not ( = ?auto_175814 ?auto_175817 ) ) ( not ( = ?auto_175815 ?auto_175817 ) ) ( not ( = ?auto_175818 ?auto_175817 ) ) ( not ( = ?auto_175816 ?auto_175817 ) ) ( ON ?auto_175811 ?auto_175810 ) ( ON-TABLE ?auto_175817 ) ( ON ?auto_175812 ?auto_175811 ) ( ON ?auto_175813 ?auto_175812 ) ( ON ?auto_175814 ?auto_175813 ) ( ON ?auto_175815 ?auto_175814 ) ( ON ?auto_175816 ?auto_175815 ) ( ON ?auto_175818 ?auto_175816 ) ( CLEAR ?auto_175818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175817 ?auto_175810 ?auto_175811 ?auto_175812 ?auto_175813 ?auto_175814 ?auto_175815 ?auto_175816 )
      ( MAKE-5PILE ?auto_175810 ?auto_175811 ?auto_175812 ?auto_175813 ?auto_175814 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175834 - BLOCK
      ?auto_175835 - BLOCK
    )
    :vars
    (
      ?auto_175838 - BLOCK
      ?auto_175836 - BLOCK
      ?auto_175837 - BLOCK
      ?auto_175841 - BLOCK
      ?auto_175840 - BLOCK
      ?auto_175839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175838 ?auto_175835 ) ( ON-TABLE ?auto_175834 ) ( ON ?auto_175835 ?auto_175834 ) ( not ( = ?auto_175834 ?auto_175835 ) ) ( not ( = ?auto_175834 ?auto_175838 ) ) ( not ( = ?auto_175835 ?auto_175838 ) ) ( not ( = ?auto_175834 ?auto_175836 ) ) ( not ( = ?auto_175834 ?auto_175837 ) ) ( not ( = ?auto_175835 ?auto_175836 ) ) ( not ( = ?auto_175835 ?auto_175837 ) ) ( not ( = ?auto_175838 ?auto_175836 ) ) ( not ( = ?auto_175838 ?auto_175837 ) ) ( not ( = ?auto_175836 ?auto_175837 ) ) ( ON ?auto_175836 ?auto_175838 ) ( CLEAR ?auto_175836 ) ( HOLDING ?auto_175837 ) ( CLEAR ?auto_175841 ) ( ON-TABLE ?auto_175840 ) ( ON ?auto_175839 ?auto_175840 ) ( ON ?auto_175841 ?auto_175839 ) ( not ( = ?auto_175840 ?auto_175839 ) ) ( not ( = ?auto_175840 ?auto_175841 ) ) ( not ( = ?auto_175840 ?auto_175837 ) ) ( not ( = ?auto_175839 ?auto_175841 ) ) ( not ( = ?auto_175839 ?auto_175837 ) ) ( not ( = ?auto_175841 ?auto_175837 ) ) ( not ( = ?auto_175834 ?auto_175841 ) ) ( not ( = ?auto_175834 ?auto_175840 ) ) ( not ( = ?auto_175834 ?auto_175839 ) ) ( not ( = ?auto_175835 ?auto_175841 ) ) ( not ( = ?auto_175835 ?auto_175840 ) ) ( not ( = ?auto_175835 ?auto_175839 ) ) ( not ( = ?auto_175838 ?auto_175841 ) ) ( not ( = ?auto_175838 ?auto_175840 ) ) ( not ( = ?auto_175838 ?auto_175839 ) ) ( not ( = ?auto_175836 ?auto_175841 ) ) ( not ( = ?auto_175836 ?auto_175840 ) ) ( not ( = ?auto_175836 ?auto_175839 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175840 ?auto_175839 ?auto_175841 ?auto_175837 )
      ( MAKE-2PILE ?auto_175834 ?auto_175835 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175842 - BLOCK
      ?auto_175843 - BLOCK
    )
    :vars
    (
      ?auto_175848 - BLOCK
      ?auto_175846 - BLOCK
      ?auto_175847 - BLOCK
      ?auto_175845 - BLOCK
      ?auto_175844 - BLOCK
      ?auto_175849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175848 ?auto_175843 ) ( ON-TABLE ?auto_175842 ) ( ON ?auto_175843 ?auto_175842 ) ( not ( = ?auto_175842 ?auto_175843 ) ) ( not ( = ?auto_175842 ?auto_175848 ) ) ( not ( = ?auto_175843 ?auto_175848 ) ) ( not ( = ?auto_175842 ?auto_175846 ) ) ( not ( = ?auto_175842 ?auto_175847 ) ) ( not ( = ?auto_175843 ?auto_175846 ) ) ( not ( = ?auto_175843 ?auto_175847 ) ) ( not ( = ?auto_175848 ?auto_175846 ) ) ( not ( = ?auto_175848 ?auto_175847 ) ) ( not ( = ?auto_175846 ?auto_175847 ) ) ( ON ?auto_175846 ?auto_175848 ) ( CLEAR ?auto_175845 ) ( ON-TABLE ?auto_175844 ) ( ON ?auto_175849 ?auto_175844 ) ( ON ?auto_175845 ?auto_175849 ) ( not ( = ?auto_175844 ?auto_175849 ) ) ( not ( = ?auto_175844 ?auto_175845 ) ) ( not ( = ?auto_175844 ?auto_175847 ) ) ( not ( = ?auto_175849 ?auto_175845 ) ) ( not ( = ?auto_175849 ?auto_175847 ) ) ( not ( = ?auto_175845 ?auto_175847 ) ) ( not ( = ?auto_175842 ?auto_175845 ) ) ( not ( = ?auto_175842 ?auto_175844 ) ) ( not ( = ?auto_175842 ?auto_175849 ) ) ( not ( = ?auto_175843 ?auto_175845 ) ) ( not ( = ?auto_175843 ?auto_175844 ) ) ( not ( = ?auto_175843 ?auto_175849 ) ) ( not ( = ?auto_175848 ?auto_175845 ) ) ( not ( = ?auto_175848 ?auto_175844 ) ) ( not ( = ?auto_175848 ?auto_175849 ) ) ( not ( = ?auto_175846 ?auto_175845 ) ) ( not ( = ?auto_175846 ?auto_175844 ) ) ( not ( = ?auto_175846 ?auto_175849 ) ) ( ON ?auto_175847 ?auto_175846 ) ( CLEAR ?auto_175847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175842 ?auto_175843 ?auto_175848 ?auto_175846 )
      ( MAKE-2PILE ?auto_175842 ?auto_175843 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175850 - BLOCK
      ?auto_175851 - BLOCK
    )
    :vars
    (
      ?auto_175856 - BLOCK
      ?auto_175857 - BLOCK
      ?auto_175854 - BLOCK
      ?auto_175855 - BLOCK
      ?auto_175852 - BLOCK
      ?auto_175853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175856 ?auto_175851 ) ( ON-TABLE ?auto_175850 ) ( ON ?auto_175851 ?auto_175850 ) ( not ( = ?auto_175850 ?auto_175851 ) ) ( not ( = ?auto_175850 ?auto_175856 ) ) ( not ( = ?auto_175851 ?auto_175856 ) ) ( not ( = ?auto_175850 ?auto_175857 ) ) ( not ( = ?auto_175850 ?auto_175854 ) ) ( not ( = ?auto_175851 ?auto_175857 ) ) ( not ( = ?auto_175851 ?auto_175854 ) ) ( not ( = ?auto_175856 ?auto_175857 ) ) ( not ( = ?auto_175856 ?auto_175854 ) ) ( not ( = ?auto_175857 ?auto_175854 ) ) ( ON ?auto_175857 ?auto_175856 ) ( ON-TABLE ?auto_175855 ) ( ON ?auto_175852 ?auto_175855 ) ( not ( = ?auto_175855 ?auto_175852 ) ) ( not ( = ?auto_175855 ?auto_175853 ) ) ( not ( = ?auto_175855 ?auto_175854 ) ) ( not ( = ?auto_175852 ?auto_175853 ) ) ( not ( = ?auto_175852 ?auto_175854 ) ) ( not ( = ?auto_175853 ?auto_175854 ) ) ( not ( = ?auto_175850 ?auto_175853 ) ) ( not ( = ?auto_175850 ?auto_175855 ) ) ( not ( = ?auto_175850 ?auto_175852 ) ) ( not ( = ?auto_175851 ?auto_175853 ) ) ( not ( = ?auto_175851 ?auto_175855 ) ) ( not ( = ?auto_175851 ?auto_175852 ) ) ( not ( = ?auto_175856 ?auto_175853 ) ) ( not ( = ?auto_175856 ?auto_175855 ) ) ( not ( = ?auto_175856 ?auto_175852 ) ) ( not ( = ?auto_175857 ?auto_175853 ) ) ( not ( = ?auto_175857 ?auto_175855 ) ) ( not ( = ?auto_175857 ?auto_175852 ) ) ( ON ?auto_175854 ?auto_175857 ) ( CLEAR ?auto_175854 ) ( HOLDING ?auto_175853 ) ( CLEAR ?auto_175852 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175855 ?auto_175852 ?auto_175853 )
      ( MAKE-2PILE ?auto_175850 ?auto_175851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175858 - BLOCK
      ?auto_175859 - BLOCK
    )
    :vars
    (
      ?auto_175863 - BLOCK
      ?auto_175862 - BLOCK
      ?auto_175861 - BLOCK
      ?auto_175860 - BLOCK
      ?auto_175865 - BLOCK
      ?auto_175864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175863 ?auto_175859 ) ( ON-TABLE ?auto_175858 ) ( ON ?auto_175859 ?auto_175858 ) ( not ( = ?auto_175858 ?auto_175859 ) ) ( not ( = ?auto_175858 ?auto_175863 ) ) ( not ( = ?auto_175859 ?auto_175863 ) ) ( not ( = ?auto_175858 ?auto_175862 ) ) ( not ( = ?auto_175858 ?auto_175861 ) ) ( not ( = ?auto_175859 ?auto_175862 ) ) ( not ( = ?auto_175859 ?auto_175861 ) ) ( not ( = ?auto_175863 ?auto_175862 ) ) ( not ( = ?auto_175863 ?auto_175861 ) ) ( not ( = ?auto_175862 ?auto_175861 ) ) ( ON ?auto_175862 ?auto_175863 ) ( ON-TABLE ?auto_175860 ) ( ON ?auto_175865 ?auto_175860 ) ( not ( = ?auto_175860 ?auto_175865 ) ) ( not ( = ?auto_175860 ?auto_175864 ) ) ( not ( = ?auto_175860 ?auto_175861 ) ) ( not ( = ?auto_175865 ?auto_175864 ) ) ( not ( = ?auto_175865 ?auto_175861 ) ) ( not ( = ?auto_175864 ?auto_175861 ) ) ( not ( = ?auto_175858 ?auto_175864 ) ) ( not ( = ?auto_175858 ?auto_175860 ) ) ( not ( = ?auto_175858 ?auto_175865 ) ) ( not ( = ?auto_175859 ?auto_175864 ) ) ( not ( = ?auto_175859 ?auto_175860 ) ) ( not ( = ?auto_175859 ?auto_175865 ) ) ( not ( = ?auto_175863 ?auto_175864 ) ) ( not ( = ?auto_175863 ?auto_175860 ) ) ( not ( = ?auto_175863 ?auto_175865 ) ) ( not ( = ?auto_175862 ?auto_175864 ) ) ( not ( = ?auto_175862 ?auto_175860 ) ) ( not ( = ?auto_175862 ?auto_175865 ) ) ( ON ?auto_175861 ?auto_175862 ) ( CLEAR ?auto_175865 ) ( ON ?auto_175864 ?auto_175861 ) ( CLEAR ?auto_175864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175858 ?auto_175859 ?auto_175863 ?auto_175862 ?auto_175861 )
      ( MAKE-2PILE ?auto_175858 ?auto_175859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175866 - BLOCK
      ?auto_175867 - BLOCK
    )
    :vars
    (
      ?auto_175870 - BLOCK
      ?auto_175868 - BLOCK
      ?auto_175869 - BLOCK
      ?auto_175871 - BLOCK
      ?auto_175873 - BLOCK
      ?auto_175872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175870 ?auto_175867 ) ( ON-TABLE ?auto_175866 ) ( ON ?auto_175867 ?auto_175866 ) ( not ( = ?auto_175866 ?auto_175867 ) ) ( not ( = ?auto_175866 ?auto_175870 ) ) ( not ( = ?auto_175867 ?auto_175870 ) ) ( not ( = ?auto_175866 ?auto_175868 ) ) ( not ( = ?auto_175866 ?auto_175869 ) ) ( not ( = ?auto_175867 ?auto_175868 ) ) ( not ( = ?auto_175867 ?auto_175869 ) ) ( not ( = ?auto_175870 ?auto_175868 ) ) ( not ( = ?auto_175870 ?auto_175869 ) ) ( not ( = ?auto_175868 ?auto_175869 ) ) ( ON ?auto_175868 ?auto_175870 ) ( ON-TABLE ?auto_175871 ) ( not ( = ?auto_175871 ?auto_175873 ) ) ( not ( = ?auto_175871 ?auto_175872 ) ) ( not ( = ?auto_175871 ?auto_175869 ) ) ( not ( = ?auto_175873 ?auto_175872 ) ) ( not ( = ?auto_175873 ?auto_175869 ) ) ( not ( = ?auto_175872 ?auto_175869 ) ) ( not ( = ?auto_175866 ?auto_175872 ) ) ( not ( = ?auto_175866 ?auto_175871 ) ) ( not ( = ?auto_175866 ?auto_175873 ) ) ( not ( = ?auto_175867 ?auto_175872 ) ) ( not ( = ?auto_175867 ?auto_175871 ) ) ( not ( = ?auto_175867 ?auto_175873 ) ) ( not ( = ?auto_175870 ?auto_175872 ) ) ( not ( = ?auto_175870 ?auto_175871 ) ) ( not ( = ?auto_175870 ?auto_175873 ) ) ( not ( = ?auto_175868 ?auto_175872 ) ) ( not ( = ?auto_175868 ?auto_175871 ) ) ( not ( = ?auto_175868 ?auto_175873 ) ) ( ON ?auto_175869 ?auto_175868 ) ( ON ?auto_175872 ?auto_175869 ) ( CLEAR ?auto_175872 ) ( HOLDING ?auto_175873 ) ( CLEAR ?auto_175871 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175871 ?auto_175873 )
      ( MAKE-2PILE ?auto_175866 ?auto_175867 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175874 - BLOCK
      ?auto_175875 - BLOCK
    )
    :vars
    (
      ?auto_175876 - BLOCK
      ?auto_175879 - BLOCK
      ?auto_175878 - BLOCK
      ?auto_175880 - BLOCK
      ?auto_175881 - BLOCK
      ?auto_175877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175876 ?auto_175875 ) ( ON-TABLE ?auto_175874 ) ( ON ?auto_175875 ?auto_175874 ) ( not ( = ?auto_175874 ?auto_175875 ) ) ( not ( = ?auto_175874 ?auto_175876 ) ) ( not ( = ?auto_175875 ?auto_175876 ) ) ( not ( = ?auto_175874 ?auto_175879 ) ) ( not ( = ?auto_175874 ?auto_175878 ) ) ( not ( = ?auto_175875 ?auto_175879 ) ) ( not ( = ?auto_175875 ?auto_175878 ) ) ( not ( = ?auto_175876 ?auto_175879 ) ) ( not ( = ?auto_175876 ?auto_175878 ) ) ( not ( = ?auto_175879 ?auto_175878 ) ) ( ON ?auto_175879 ?auto_175876 ) ( ON-TABLE ?auto_175880 ) ( not ( = ?auto_175880 ?auto_175881 ) ) ( not ( = ?auto_175880 ?auto_175877 ) ) ( not ( = ?auto_175880 ?auto_175878 ) ) ( not ( = ?auto_175881 ?auto_175877 ) ) ( not ( = ?auto_175881 ?auto_175878 ) ) ( not ( = ?auto_175877 ?auto_175878 ) ) ( not ( = ?auto_175874 ?auto_175877 ) ) ( not ( = ?auto_175874 ?auto_175880 ) ) ( not ( = ?auto_175874 ?auto_175881 ) ) ( not ( = ?auto_175875 ?auto_175877 ) ) ( not ( = ?auto_175875 ?auto_175880 ) ) ( not ( = ?auto_175875 ?auto_175881 ) ) ( not ( = ?auto_175876 ?auto_175877 ) ) ( not ( = ?auto_175876 ?auto_175880 ) ) ( not ( = ?auto_175876 ?auto_175881 ) ) ( not ( = ?auto_175879 ?auto_175877 ) ) ( not ( = ?auto_175879 ?auto_175880 ) ) ( not ( = ?auto_175879 ?auto_175881 ) ) ( ON ?auto_175878 ?auto_175879 ) ( ON ?auto_175877 ?auto_175878 ) ( CLEAR ?auto_175880 ) ( ON ?auto_175881 ?auto_175877 ) ( CLEAR ?auto_175881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175874 ?auto_175875 ?auto_175876 ?auto_175879 ?auto_175878 ?auto_175877 )
      ( MAKE-2PILE ?auto_175874 ?auto_175875 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175882 - BLOCK
      ?auto_175883 - BLOCK
    )
    :vars
    (
      ?auto_175887 - BLOCK
      ?auto_175886 - BLOCK
      ?auto_175888 - BLOCK
      ?auto_175884 - BLOCK
      ?auto_175885 - BLOCK
      ?auto_175889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175887 ?auto_175883 ) ( ON-TABLE ?auto_175882 ) ( ON ?auto_175883 ?auto_175882 ) ( not ( = ?auto_175882 ?auto_175883 ) ) ( not ( = ?auto_175882 ?auto_175887 ) ) ( not ( = ?auto_175883 ?auto_175887 ) ) ( not ( = ?auto_175882 ?auto_175886 ) ) ( not ( = ?auto_175882 ?auto_175888 ) ) ( not ( = ?auto_175883 ?auto_175886 ) ) ( not ( = ?auto_175883 ?auto_175888 ) ) ( not ( = ?auto_175887 ?auto_175886 ) ) ( not ( = ?auto_175887 ?auto_175888 ) ) ( not ( = ?auto_175886 ?auto_175888 ) ) ( ON ?auto_175886 ?auto_175887 ) ( not ( = ?auto_175884 ?auto_175885 ) ) ( not ( = ?auto_175884 ?auto_175889 ) ) ( not ( = ?auto_175884 ?auto_175888 ) ) ( not ( = ?auto_175885 ?auto_175889 ) ) ( not ( = ?auto_175885 ?auto_175888 ) ) ( not ( = ?auto_175889 ?auto_175888 ) ) ( not ( = ?auto_175882 ?auto_175889 ) ) ( not ( = ?auto_175882 ?auto_175884 ) ) ( not ( = ?auto_175882 ?auto_175885 ) ) ( not ( = ?auto_175883 ?auto_175889 ) ) ( not ( = ?auto_175883 ?auto_175884 ) ) ( not ( = ?auto_175883 ?auto_175885 ) ) ( not ( = ?auto_175887 ?auto_175889 ) ) ( not ( = ?auto_175887 ?auto_175884 ) ) ( not ( = ?auto_175887 ?auto_175885 ) ) ( not ( = ?auto_175886 ?auto_175889 ) ) ( not ( = ?auto_175886 ?auto_175884 ) ) ( not ( = ?auto_175886 ?auto_175885 ) ) ( ON ?auto_175888 ?auto_175886 ) ( ON ?auto_175889 ?auto_175888 ) ( ON ?auto_175885 ?auto_175889 ) ( CLEAR ?auto_175885 ) ( HOLDING ?auto_175884 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175884 )
      ( MAKE-2PILE ?auto_175882 ?auto_175883 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175900 - BLOCK
      ?auto_175901 - BLOCK
    )
    :vars
    (
      ?auto_175905 - BLOCK
      ?auto_175903 - BLOCK
      ?auto_175902 - BLOCK
      ?auto_175906 - BLOCK
      ?auto_175904 - BLOCK
      ?auto_175907 - BLOCK
      ?auto_175908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175905 ?auto_175901 ) ( ON-TABLE ?auto_175900 ) ( ON ?auto_175901 ?auto_175900 ) ( not ( = ?auto_175900 ?auto_175901 ) ) ( not ( = ?auto_175900 ?auto_175905 ) ) ( not ( = ?auto_175901 ?auto_175905 ) ) ( not ( = ?auto_175900 ?auto_175903 ) ) ( not ( = ?auto_175900 ?auto_175902 ) ) ( not ( = ?auto_175901 ?auto_175903 ) ) ( not ( = ?auto_175901 ?auto_175902 ) ) ( not ( = ?auto_175905 ?auto_175903 ) ) ( not ( = ?auto_175905 ?auto_175902 ) ) ( not ( = ?auto_175903 ?auto_175902 ) ) ( ON ?auto_175903 ?auto_175905 ) ( not ( = ?auto_175906 ?auto_175904 ) ) ( not ( = ?auto_175906 ?auto_175907 ) ) ( not ( = ?auto_175906 ?auto_175902 ) ) ( not ( = ?auto_175904 ?auto_175907 ) ) ( not ( = ?auto_175904 ?auto_175902 ) ) ( not ( = ?auto_175907 ?auto_175902 ) ) ( not ( = ?auto_175900 ?auto_175907 ) ) ( not ( = ?auto_175900 ?auto_175906 ) ) ( not ( = ?auto_175900 ?auto_175904 ) ) ( not ( = ?auto_175901 ?auto_175907 ) ) ( not ( = ?auto_175901 ?auto_175906 ) ) ( not ( = ?auto_175901 ?auto_175904 ) ) ( not ( = ?auto_175905 ?auto_175907 ) ) ( not ( = ?auto_175905 ?auto_175906 ) ) ( not ( = ?auto_175905 ?auto_175904 ) ) ( not ( = ?auto_175903 ?auto_175907 ) ) ( not ( = ?auto_175903 ?auto_175906 ) ) ( not ( = ?auto_175903 ?auto_175904 ) ) ( ON ?auto_175902 ?auto_175903 ) ( ON ?auto_175907 ?auto_175902 ) ( ON ?auto_175904 ?auto_175907 ) ( CLEAR ?auto_175904 ) ( ON ?auto_175906 ?auto_175908 ) ( CLEAR ?auto_175906 ) ( HAND-EMPTY ) ( not ( = ?auto_175900 ?auto_175908 ) ) ( not ( = ?auto_175901 ?auto_175908 ) ) ( not ( = ?auto_175905 ?auto_175908 ) ) ( not ( = ?auto_175903 ?auto_175908 ) ) ( not ( = ?auto_175902 ?auto_175908 ) ) ( not ( = ?auto_175906 ?auto_175908 ) ) ( not ( = ?auto_175904 ?auto_175908 ) ) ( not ( = ?auto_175907 ?auto_175908 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175906 ?auto_175908 )
      ( MAKE-2PILE ?auto_175900 ?auto_175901 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175909 - BLOCK
      ?auto_175910 - BLOCK
    )
    :vars
    (
      ?auto_175914 - BLOCK
      ?auto_175913 - BLOCK
      ?auto_175912 - BLOCK
      ?auto_175917 - BLOCK
      ?auto_175911 - BLOCK
      ?auto_175916 - BLOCK
      ?auto_175915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175914 ?auto_175910 ) ( ON-TABLE ?auto_175909 ) ( ON ?auto_175910 ?auto_175909 ) ( not ( = ?auto_175909 ?auto_175910 ) ) ( not ( = ?auto_175909 ?auto_175914 ) ) ( not ( = ?auto_175910 ?auto_175914 ) ) ( not ( = ?auto_175909 ?auto_175913 ) ) ( not ( = ?auto_175909 ?auto_175912 ) ) ( not ( = ?auto_175910 ?auto_175913 ) ) ( not ( = ?auto_175910 ?auto_175912 ) ) ( not ( = ?auto_175914 ?auto_175913 ) ) ( not ( = ?auto_175914 ?auto_175912 ) ) ( not ( = ?auto_175913 ?auto_175912 ) ) ( ON ?auto_175913 ?auto_175914 ) ( not ( = ?auto_175917 ?auto_175911 ) ) ( not ( = ?auto_175917 ?auto_175916 ) ) ( not ( = ?auto_175917 ?auto_175912 ) ) ( not ( = ?auto_175911 ?auto_175916 ) ) ( not ( = ?auto_175911 ?auto_175912 ) ) ( not ( = ?auto_175916 ?auto_175912 ) ) ( not ( = ?auto_175909 ?auto_175916 ) ) ( not ( = ?auto_175909 ?auto_175917 ) ) ( not ( = ?auto_175909 ?auto_175911 ) ) ( not ( = ?auto_175910 ?auto_175916 ) ) ( not ( = ?auto_175910 ?auto_175917 ) ) ( not ( = ?auto_175910 ?auto_175911 ) ) ( not ( = ?auto_175914 ?auto_175916 ) ) ( not ( = ?auto_175914 ?auto_175917 ) ) ( not ( = ?auto_175914 ?auto_175911 ) ) ( not ( = ?auto_175913 ?auto_175916 ) ) ( not ( = ?auto_175913 ?auto_175917 ) ) ( not ( = ?auto_175913 ?auto_175911 ) ) ( ON ?auto_175912 ?auto_175913 ) ( ON ?auto_175916 ?auto_175912 ) ( ON ?auto_175917 ?auto_175915 ) ( CLEAR ?auto_175917 ) ( not ( = ?auto_175909 ?auto_175915 ) ) ( not ( = ?auto_175910 ?auto_175915 ) ) ( not ( = ?auto_175914 ?auto_175915 ) ) ( not ( = ?auto_175913 ?auto_175915 ) ) ( not ( = ?auto_175912 ?auto_175915 ) ) ( not ( = ?auto_175917 ?auto_175915 ) ) ( not ( = ?auto_175911 ?auto_175915 ) ) ( not ( = ?auto_175916 ?auto_175915 ) ) ( HOLDING ?auto_175911 ) ( CLEAR ?auto_175916 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175909 ?auto_175910 ?auto_175914 ?auto_175913 ?auto_175912 ?auto_175916 ?auto_175911 )
      ( MAKE-2PILE ?auto_175909 ?auto_175910 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175918 - BLOCK
      ?auto_175919 - BLOCK
    )
    :vars
    (
      ?auto_175926 - BLOCK
      ?auto_175921 - BLOCK
      ?auto_175925 - BLOCK
      ?auto_175924 - BLOCK
      ?auto_175920 - BLOCK
      ?auto_175923 - BLOCK
      ?auto_175922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175926 ?auto_175919 ) ( ON-TABLE ?auto_175918 ) ( ON ?auto_175919 ?auto_175918 ) ( not ( = ?auto_175918 ?auto_175919 ) ) ( not ( = ?auto_175918 ?auto_175926 ) ) ( not ( = ?auto_175919 ?auto_175926 ) ) ( not ( = ?auto_175918 ?auto_175921 ) ) ( not ( = ?auto_175918 ?auto_175925 ) ) ( not ( = ?auto_175919 ?auto_175921 ) ) ( not ( = ?auto_175919 ?auto_175925 ) ) ( not ( = ?auto_175926 ?auto_175921 ) ) ( not ( = ?auto_175926 ?auto_175925 ) ) ( not ( = ?auto_175921 ?auto_175925 ) ) ( ON ?auto_175921 ?auto_175926 ) ( not ( = ?auto_175924 ?auto_175920 ) ) ( not ( = ?auto_175924 ?auto_175923 ) ) ( not ( = ?auto_175924 ?auto_175925 ) ) ( not ( = ?auto_175920 ?auto_175923 ) ) ( not ( = ?auto_175920 ?auto_175925 ) ) ( not ( = ?auto_175923 ?auto_175925 ) ) ( not ( = ?auto_175918 ?auto_175923 ) ) ( not ( = ?auto_175918 ?auto_175924 ) ) ( not ( = ?auto_175918 ?auto_175920 ) ) ( not ( = ?auto_175919 ?auto_175923 ) ) ( not ( = ?auto_175919 ?auto_175924 ) ) ( not ( = ?auto_175919 ?auto_175920 ) ) ( not ( = ?auto_175926 ?auto_175923 ) ) ( not ( = ?auto_175926 ?auto_175924 ) ) ( not ( = ?auto_175926 ?auto_175920 ) ) ( not ( = ?auto_175921 ?auto_175923 ) ) ( not ( = ?auto_175921 ?auto_175924 ) ) ( not ( = ?auto_175921 ?auto_175920 ) ) ( ON ?auto_175925 ?auto_175921 ) ( ON ?auto_175923 ?auto_175925 ) ( ON ?auto_175924 ?auto_175922 ) ( not ( = ?auto_175918 ?auto_175922 ) ) ( not ( = ?auto_175919 ?auto_175922 ) ) ( not ( = ?auto_175926 ?auto_175922 ) ) ( not ( = ?auto_175921 ?auto_175922 ) ) ( not ( = ?auto_175925 ?auto_175922 ) ) ( not ( = ?auto_175924 ?auto_175922 ) ) ( not ( = ?auto_175920 ?auto_175922 ) ) ( not ( = ?auto_175923 ?auto_175922 ) ) ( CLEAR ?auto_175923 ) ( ON ?auto_175920 ?auto_175924 ) ( CLEAR ?auto_175920 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175922 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175922 ?auto_175924 )
      ( MAKE-2PILE ?auto_175918 ?auto_175919 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175927 - BLOCK
      ?auto_175928 - BLOCK
    )
    :vars
    (
      ?auto_175934 - BLOCK
      ?auto_175933 - BLOCK
      ?auto_175929 - BLOCK
      ?auto_175930 - BLOCK
      ?auto_175935 - BLOCK
      ?auto_175931 - BLOCK
      ?auto_175932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175934 ?auto_175928 ) ( ON-TABLE ?auto_175927 ) ( ON ?auto_175928 ?auto_175927 ) ( not ( = ?auto_175927 ?auto_175928 ) ) ( not ( = ?auto_175927 ?auto_175934 ) ) ( not ( = ?auto_175928 ?auto_175934 ) ) ( not ( = ?auto_175927 ?auto_175933 ) ) ( not ( = ?auto_175927 ?auto_175929 ) ) ( not ( = ?auto_175928 ?auto_175933 ) ) ( not ( = ?auto_175928 ?auto_175929 ) ) ( not ( = ?auto_175934 ?auto_175933 ) ) ( not ( = ?auto_175934 ?auto_175929 ) ) ( not ( = ?auto_175933 ?auto_175929 ) ) ( ON ?auto_175933 ?auto_175934 ) ( not ( = ?auto_175930 ?auto_175935 ) ) ( not ( = ?auto_175930 ?auto_175931 ) ) ( not ( = ?auto_175930 ?auto_175929 ) ) ( not ( = ?auto_175935 ?auto_175931 ) ) ( not ( = ?auto_175935 ?auto_175929 ) ) ( not ( = ?auto_175931 ?auto_175929 ) ) ( not ( = ?auto_175927 ?auto_175931 ) ) ( not ( = ?auto_175927 ?auto_175930 ) ) ( not ( = ?auto_175927 ?auto_175935 ) ) ( not ( = ?auto_175928 ?auto_175931 ) ) ( not ( = ?auto_175928 ?auto_175930 ) ) ( not ( = ?auto_175928 ?auto_175935 ) ) ( not ( = ?auto_175934 ?auto_175931 ) ) ( not ( = ?auto_175934 ?auto_175930 ) ) ( not ( = ?auto_175934 ?auto_175935 ) ) ( not ( = ?auto_175933 ?auto_175931 ) ) ( not ( = ?auto_175933 ?auto_175930 ) ) ( not ( = ?auto_175933 ?auto_175935 ) ) ( ON ?auto_175929 ?auto_175933 ) ( ON ?auto_175930 ?auto_175932 ) ( not ( = ?auto_175927 ?auto_175932 ) ) ( not ( = ?auto_175928 ?auto_175932 ) ) ( not ( = ?auto_175934 ?auto_175932 ) ) ( not ( = ?auto_175933 ?auto_175932 ) ) ( not ( = ?auto_175929 ?auto_175932 ) ) ( not ( = ?auto_175930 ?auto_175932 ) ) ( not ( = ?auto_175935 ?auto_175932 ) ) ( not ( = ?auto_175931 ?auto_175932 ) ) ( ON ?auto_175935 ?auto_175930 ) ( CLEAR ?auto_175935 ) ( ON-TABLE ?auto_175932 ) ( HOLDING ?auto_175931 ) ( CLEAR ?auto_175929 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175927 ?auto_175928 ?auto_175934 ?auto_175933 ?auto_175929 ?auto_175931 )
      ( MAKE-2PILE ?auto_175927 ?auto_175928 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175936 - BLOCK
      ?auto_175937 - BLOCK
    )
    :vars
    (
      ?auto_175943 - BLOCK
      ?auto_175939 - BLOCK
      ?auto_175938 - BLOCK
      ?auto_175941 - BLOCK
      ?auto_175940 - BLOCK
      ?auto_175942 - BLOCK
      ?auto_175944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175943 ?auto_175937 ) ( ON-TABLE ?auto_175936 ) ( ON ?auto_175937 ?auto_175936 ) ( not ( = ?auto_175936 ?auto_175937 ) ) ( not ( = ?auto_175936 ?auto_175943 ) ) ( not ( = ?auto_175937 ?auto_175943 ) ) ( not ( = ?auto_175936 ?auto_175939 ) ) ( not ( = ?auto_175936 ?auto_175938 ) ) ( not ( = ?auto_175937 ?auto_175939 ) ) ( not ( = ?auto_175937 ?auto_175938 ) ) ( not ( = ?auto_175943 ?auto_175939 ) ) ( not ( = ?auto_175943 ?auto_175938 ) ) ( not ( = ?auto_175939 ?auto_175938 ) ) ( ON ?auto_175939 ?auto_175943 ) ( not ( = ?auto_175941 ?auto_175940 ) ) ( not ( = ?auto_175941 ?auto_175942 ) ) ( not ( = ?auto_175941 ?auto_175938 ) ) ( not ( = ?auto_175940 ?auto_175942 ) ) ( not ( = ?auto_175940 ?auto_175938 ) ) ( not ( = ?auto_175942 ?auto_175938 ) ) ( not ( = ?auto_175936 ?auto_175942 ) ) ( not ( = ?auto_175936 ?auto_175941 ) ) ( not ( = ?auto_175936 ?auto_175940 ) ) ( not ( = ?auto_175937 ?auto_175942 ) ) ( not ( = ?auto_175937 ?auto_175941 ) ) ( not ( = ?auto_175937 ?auto_175940 ) ) ( not ( = ?auto_175943 ?auto_175942 ) ) ( not ( = ?auto_175943 ?auto_175941 ) ) ( not ( = ?auto_175943 ?auto_175940 ) ) ( not ( = ?auto_175939 ?auto_175942 ) ) ( not ( = ?auto_175939 ?auto_175941 ) ) ( not ( = ?auto_175939 ?auto_175940 ) ) ( ON ?auto_175938 ?auto_175939 ) ( ON ?auto_175941 ?auto_175944 ) ( not ( = ?auto_175936 ?auto_175944 ) ) ( not ( = ?auto_175937 ?auto_175944 ) ) ( not ( = ?auto_175943 ?auto_175944 ) ) ( not ( = ?auto_175939 ?auto_175944 ) ) ( not ( = ?auto_175938 ?auto_175944 ) ) ( not ( = ?auto_175941 ?auto_175944 ) ) ( not ( = ?auto_175940 ?auto_175944 ) ) ( not ( = ?auto_175942 ?auto_175944 ) ) ( ON ?auto_175940 ?auto_175941 ) ( ON-TABLE ?auto_175944 ) ( CLEAR ?auto_175938 ) ( ON ?auto_175942 ?auto_175940 ) ( CLEAR ?auto_175942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175944 ?auto_175941 ?auto_175940 )
      ( MAKE-2PILE ?auto_175936 ?auto_175937 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175994 - BLOCK
      ?auto_175995 - BLOCK
      ?auto_175996 - BLOCK
      ?auto_175997 - BLOCK
      ?auto_175998 - BLOCK
      ?auto_175999 - BLOCK
    )
    :vars
    (
      ?auto_176000 - BLOCK
      ?auto_176001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175994 ) ( ON ?auto_175995 ?auto_175994 ) ( ON ?auto_175996 ?auto_175995 ) ( ON ?auto_175997 ?auto_175996 ) ( not ( = ?auto_175994 ?auto_175995 ) ) ( not ( = ?auto_175994 ?auto_175996 ) ) ( not ( = ?auto_175994 ?auto_175997 ) ) ( not ( = ?auto_175994 ?auto_175998 ) ) ( not ( = ?auto_175994 ?auto_175999 ) ) ( not ( = ?auto_175995 ?auto_175996 ) ) ( not ( = ?auto_175995 ?auto_175997 ) ) ( not ( = ?auto_175995 ?auto_175998 ) ) ( not ( = ?auto_175995 ?auto_175999 ) ) ( not ( = ?auto_175996 ?auto_175997 ) ) ( not ( = ?auto_175996 ?auto_175998 ) ) ( not ( = ?auto_175996 ?auto_175999 ) ) ( not ( = ?auto_175997 ?auto_175998 ) ) ( not ( = ?auto_175997 ?auto_175999 ) ) ( not ( = ?auto_175998 ?auto_175999 ) ) ( ON ?auto_175999 ?auto_176000 ) ( not ( = ?auto_175994 ?auto_176000 ) ) ( not ( = ?auto_175995 ?auto_176000 ) ) ( not ( = ?auto_175996 ?auto_176000 ) ) ( not ( = ?auto_175997 ?auto_176000 ) ) ( not ( = ?auto_175998 ?auto_176000 ) ) ( not ( = ?auto_175999 ?auto_176000 ) ) ( CLEAR ?auto_175997 ) ( ON ?auto_175998 ?auto_175999 ) ( CLEAR ?auto_175998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176001 ) ( ON ?auto_176000 ?auto_176001 ) ( not ( = ?auto_176001 ?auto_176000 ) ) ( not ( = ?auto_176001 ?auto_175999 ) ) ( not ( = ?auto_176001 ?auto_175998 ) ) ( not ( = ?auto_175994 ?auto_176001 ) ) ( not ( = ?auto_175995 ?auto_176001 ) ) ( not ( = ?auto_175996 ?auto_176001 ) ) ( not ( = ?auto_175997 ?auto_176001 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176001 ?auto_176000 ?auto_175999 )
      ( MAKE-6PILE ?auto_175994 ?auto_175995 ?auto_175996 ?auto_175997 ?auto_175998 ?auto_175999 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176002 - BLOCK
      ?auto_176003 - BLOCK
      ?auto_176004 - BLOCK
      ?auto_176005 - BLOCK
      ?auto_176006 - BLOCK
      ?auto_176007 - BLOCK
    )
    :vars
    (
      ?auto_176008 - BLOCK
      ?auto_176009 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176002 ) ( ON ?auto_176003 ?auto_176002 ) ( ON ?auto_176004 ?auto_176003 ) ( not ( = ?auto_176002 ?auto_176003 ) ) ( not ( = ?auto_176002 ?auto_176004 ) ) ( not ( = ?auto_176002 ?auto_176005 ) ) ( not ( = ?auto_176002 ?auto_176006 ) ) ( not ( = ?auto_176002 ?auto_176007 ) ) ( not ( = ?auto_176003 ?auto_176004 ) ) ( not ( = ?auto_176003 ?auto_176005 ) ) ( not ( = ?auto_176003 ?auto_176006 ) ) ( not ( = ?auto_176003 ?auto_176007 ) ) ( not ( = ?auto_176004 ?auto_176005 ) ) ( not ( = ?auto_176004 ?auto_176006 ) ) ( not ( = ?auto_176004 ?auto_176007 ) ) ( not ( = ?auto_176005 ?auto_176006 ) ) ( not ( = ?auto_176005 ?auto_176007 ) ) ( not ( = ?auto_176006 ?auto_176007 ) ) ( ON ?auto_176007 ?auto_176008 ) ( not ( = ?auto_176002 ?auto_176008 ) ) ( not ( = ?auto_176003 ?auto_176008 ) ) ( not ( = ?auto_176004 ?auto_176008 ) ) ( not ( = ?auto_176005 ?auto_176008 ) ) ( not ( = ?auto_176006 ?auto_176008 ) ) ( not ( = ?auto_176007 ?auto_176008 ) ) ( ON ?auto_176006 ?auto_176007 ) ( CLEAR ?auto_176006 ) ( ON-TABLE ?auto_176009 ) ( ON ?auto_176008 ?auto_176009 ) ( not ( = ?auto_176009 ?auto_176008 ) ) ( not ( = ?auto_176009 ?auto_176007 ) ) ( not ( = ?auto_176009 ?auto_176006 ) ) ( not ( = ?auto_176002 ?auto_176009 ) ) ( not ( = ?auto_176003 ?auto_176009 ) ) ( not ( = ?auto_176004 ?auto_176009 ) ) ( not ( = ?auto_176005 ?auto_176009 ) ) ( HOLDING ?auto_176005 ) ( CLEAR ?auto_176004 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176002 ?auto_176003 ?auto_176004 ?auto_176005 )
      ( MAKE-6PILE ?auto_176002 ?auto_176003 ?auto_176004 ?auto_176005 ?auto_176006 ?auto_176007 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176010 - BLOCK
      ?auto_176011 - BLOCK
      ?auto_176012 - BLOCK
      ?auto_176013 - BLOCK
      ?auto_176014 - BLOCK
      ?auto_176015 - BLOCK
    )
    :vars
    (
      ?auto_176017 - BLOCK
      ?auto_176016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176010 ) ( ON ?auto_176011 ?auto_176010 ) ( ON ?auto_176012 ?auto_176011 ) ( not ( = ?auto_176010 ?auto_176011 ) ) ( not ( = ?auto_176010 ?auto_176012 ) ) ( not ( = ?auto_176010 ?auto_176013 ) ) ( not ( = ?auto_176010 ?auto_176014 ) ) ( not ( = ?auto_176010 ?auto_176015 ) ) ( not ( = ?auto_176011 ?auto_176012 ) ) ( not ( = ?auto_176011 ?auto_176013 ) ) ( not ( = ?auto_176011 ?auto_176014 ) ) ( not ( = ?auto_176011 ?auto_176015 ) ) ( not ( = ?auto_176012 ?auto_176013 ) ) ( not ( = ?auto_176012 ?auto_176014 ) ) ( not ( = ?auto_176012 ?auto_176015 ) ) ( not ( = ?auto_176013 ?auto_176014 ) ) ( not ( = ?auto_176013 ?auto_176015 ) ) ( not ( = ?auto_176014 ?auto_176015 ) ) ( ON ?auto_176015 ?auto_176017 ) ( not ( = ?auto_176010 ?auto_176017 ) ) ( not ( = ?auto_176011 ?auto_176017 ) ) ( not ( = ?auto_176012 ?auto_176017 ) ) ( not ( = ?auto_176013 ?auto_176017 ) ) ( not ( = ?auto_176014 ?auto_176017 ) ) ( not ( = ?auto_176015 ?auto_176017 ) ) ( ON ?auto_176014 ?auto_176015 ) ( ON-TABLE ?auto_176016 ) ( ON ?auto_176017 ?auto_176016 ) ( not ( = ?auto_176016 ?auto_176017 ) ) ( not ( = ?auto_176016 ?auto_176015 ) ) ( not ( = ?auto_176016 ?auto_176014 ) ) ( not ( = ?auto_176010 ?auto_176016 ) ) ( not ( = ?auto_176011 ?auto_176016 ) ) ( not ( = ?auto_176012 ?auto_176016 ) ) ( not ( = ?auto_176013 ?auto_176016 ) ) ( CLEAR ?auto_176012 ) ( ON ?auto_176013 ?auto_176014 ) ( CLEAR ?auto_176013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176016 ?auto_176017 ?auto_176015 ?auto_176014 )
      ( MAKE-6PILE ?auto_176010 ?auto_176011 ?auto_176012 ?auto_176013 ?auto_176014 ?auto_176015 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176018 - BLOCK
      ?auto_176019 - BLOCK
      ?auto_176020 - BLOCK
      ?auto_176021 - BLOCK
      ?auto_176022 - BLOCK
      ?auto_176023 - BLOCK
    )
    :vars
    (
      ?auto_176024 - BLOCK
      ?auto_176025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176018 ) ( ON ?auto_176019 ?auto_176018 ) ( not ( = ?auto_176018 ?auto_176019 ) ) ( not ( = ?auto_176018 ?auto_176020 ) ) ( not ( = ?auto_176018 ?auto_176021 ) ) ( not ( = ?auto_176018 ?auto_176022 ) ) ( not ( = ?auto_176018 ?auto_176023 ) ) ( not ( = ?auto_176019 ?auto_176020 ) ) ( not ( = ?auto_176019 ?auto_176021 ) ) ( not ( = ?auto_176019 ?auto_176022 ) ) ( not ( = ?auto_176019 ?auto_176023 ) ) ( not ( = ?auto_176020 ?auto_176021 ) ) ( not ( = ?auto_176020 ?auto_176022 ) ) ( not ( = ?auto_176020 ?auto_176023 ) ) ( not ( = ?auto_176021 ?auto_176022 ) ) ( not ( = ?auto_176021 ?auto_176023 ) ) ( not ( = ?auto_176022 ?auto_176023 ) ) ( ON ?auto_176023 ?auto_176024 ) ( not ( = ?auto_176018 ?auto_176024 ) ) ( not ( = ?auto_176019 ?auto_176024 ) ) ( not ( = ?auto_176020 ?auto_176024 ) ) ( not ( = ?auto_176021 ?auto_176024 ) ) ( not ( = ?auto_176022 ?auto_176024 ) ) ( not ( = ?auto_176023 ?auto_176024 ) ) ( ON ?auto_176022 ?auto_176023 ) ( ON-TABLE ?auto_176025 ) ( ON ?auto_176024 ?auto_176025 ) ( not ( = ?auto_176025 ?auto_176024 ) ) ( not ( = ?auto_176025 ?auto_176023 ) ) ( not ( = ?auto_176025 ?auto_176022 ) ) ( not ( = ?auto_176018 ?auto_176025 ) ) ( not ( = ?auto_176019 ?auto_176025 ) ) ( not ( = ?auto_176020 ?auto_176025 ) ) ( not ( = ?auto_176021 ?auto_176025 ) ) ( ON ?auto_176021 ?auto_176022 ) ( CLEAR ?auto_176021 ) ( HOLDING ?auto_176020 ) ( CLEAR ?auto_176019 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176018 ?auto_176019 ?auto_176020 )
      ( MAKE-6PILE ?auto_176018 ?auto_176019 ?auto_176020 ?auto_176021 ?auto_176022 ?auto_176023 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176026 - BLOCK
      ?auto_176027 - BLOCK
      ?auto_176028 - BLOCK
      ?auto_176029 - BLOCK
      ?auto_176030 - BLOCK
      ?auto_176031 - BLOCK
    )
    :vars
    (
      ?auto_176032 - BLOCK
      ?auto_176033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176026 ) ( ON ?auto_176027 ?auto_176026 ) ( not ( = ?auto_176026 ?auto_176027 ) ) ( not ( = ?auto_176026 ?auto_176028 ) ) ( not ( = ?auto_176026 ?auto_176029 ) ) ( not ( = ?auto_176026 ?auto_176030 ) ) ( not ( = ?auto_176026 ?auto_176031 ) ) ( not ( = ?auto_176027 ?auto_176028 ) ) ( not ( = ?auto_176027 ?auto_176029 ) ) ( not ( = ?auto_176027 ?auto_176030 ) ) ( not ( = ?auto_176027 ?auto_176031 ) ) ( not ( = ?auto_176028 ?auto_176029 ) ) ( not ( = ?auto_176028 ?auto_176030 ) ) ( not ( = ?auto_176028 ?auto_176031 ) ) ( not ( = ?auto_176029 ?auto_176030 ) ) ( not ( = ?auto_176029 ?auto_176031 ) ) ( not ( = ?auto_176030 ?auto_176031 ) ) ( ON ?auto_176031 ?auto_176032 ) ( not ( = ?auto_176026 ?auto_176032 ) ) ( not ( = ?auto_176027 ?auto_176032 ) ) ( not ( = ?auto_176028 ?auto_176032 ) ) ( not ( = ?auto_176029 ?auto_176032 ) ) ( not ( = ?auto_176030 ?auto_176032 ) ) ( not ( = ?auto_176031 ?auto_176032 ) ) ( ON ?auto_176030 ?auto_176031 ) ( ON-TABLE ?auto_176033 ) ( ON ?auto_176032 ?auto_176033 ) ( not ( = ?auto_176033 ?auto_176032 ) ) ( not ( = ?auto_176033 ?auto_176031 ) ) ( not ( = ?auto_176033 ?auto_176030 ) ) ( not ( = ?auto_176026 ?auto_176033 ) ) ( not ( = ?auto_176027 ?auto_176033 ) ) ( not ( = ?auto_176028 ?auto_176033 ) ) ( not ( = ?auto_176029 ?auto_176033 ) ) ( ON ?auto_176029 ?auto_176030 ) ( CLEAR ?auto_176027 ) ( ON ?auto_176028 ?auto_176029 ) ( CLEAR ?auto_176028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176033 ?auto_176032 ?auto_176031 ?auto_176030 ?auto_176029 )
      ( MAKE-6PILE ?auto_176026 ?auto_176027 ?auto_176028 ?auto_176029 ?auto_176030 ?auto_176031 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176034 - BLOCK
      ?auto_176035 - BLOCK
      ?auto_176036 - BLOCK
      ?auto_176037 - BLOCK
      ?auto_176038 - BLOCK
      ?auto_176039 - BLOCK
    )
    :vars
    (
      ?auto_176040 - BLOCK
      ?auto_176041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176034 ) ( not ( = ?auto_176034 ?auto_176035 ) ) ( not ( = ?auto_176034 ?auto_176036 ) ) ( not ( = ?auto_176034 ?auto_176037 ) ) ( not ( = ?auto_176034 ?auto_176038 ) ) ( not ( = ?auto_176034 ?auto_176039 ) ) ( not ( = ?auto_176035 ?auto_176036 ) ) ( not ( = ?auto_176035 ?auto_176037 ) ) ( not ( = ?auto_176035 ?auto_176038 ) ) ( not ( = ?auto_176035 ?auto_176039 ) ) ( not ( = ?auto_176036 ?auto_176037 ) ) ( not ( = ?auto_176036 ?auto_176038 ) ) ( not ( = ?auto_176036 ?auto_176039 ) ) ( not ( = ?auto_176037 ?auto_176038 ) ) ( not ( = ?auto_176037 ?auto_176039 ) ) ( not ( = ?auto_176038 ?auto_176039 ) ) ( ON ?auto_176039 ?auto_176040 ) ( not ( = ?auto_176034 ?auto_176040 ) ) ( not ( = ?auto_176035 ?auto_176040 ) ) ( not ( = ?auto_176036 ?auto_176040 ) ) ( not ( = ?auto_176037 ?auto_176040 ) ) ( not ( = ?auto_176038 ?auto_176040 ) ) ( not ( = ?auto_176039 ?auto_176040 ) ) ( ON ?auto_176038 ?auto_176039 ) ( ON-TABLE ?auto_176041 ) ( ON ?auto_176040 ?auto_176041 ) ( not ( = ?auto_176041 ?auto_176040 ) ) ( not ( = ?auto_176041 ?auto_176039 ) ) ( not ( = ?auto_176041 ?auto_176038 ) ) ( not ( = ?auto_176034 ?auto_176041 ) ) ( not ( = ?auto_176035 ?auto_176041 ) ) ( not ( = ?auto_176036 ?auto_176041 ) ) ( not ( = ?auto_176037 ?auto_176041 ) ) ( ON ?auto_176037 ?auto_176038 ) ( ON ?auto_176036 ?auto_176037 ) ( CLEAR ?auto_176036 ) ( HOLDING ?auto_176035 ) ( CLEAR ?auto_176034 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176034 ?auto_176035 )
      ( MAKE-6PILE ?auto_176034 ?auto_176035 ?auto_176036 ?auto_176037 ?auto_176038 ?auto_176039 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176042 - BLOCK
      ?auto_176043 - BLOCK
      ?auto_176044 - BLOCK
      ?auto_176045 - BLOCK
      ?auto_176046 - BLOCK
      ?auto_176047 - BLOCK
    )
    :vars
    (
      ?auto_176048 - BLOCK
      ?auto_176049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176042 ) ( not ( = ?auto_176042 ?auto_176043 ) ) ( not ( = ?auto_176042 ?auto_176044 ) ) ( not ( = ?auto_176042 ?auto_176045 ) ) ( not ( = ?auto_176042 ?auto_176046 ) ) ( not ( = ?auto_176042 ?auto_176047 ) ) ( not ( = ?auto_176043 ?auto_176044 ) ) ( not ( = ?auto_176043 ?auto_176045 ) ) ( not ( = ?auto_176043 ?auto_176046 ) ) ( not ( = ?auto_176043 ?auto_176047 ) ) ( not ( = ?auto_176044 ?auto_176045 ) ) ( not ( = ?auto_176044 ?auto_176046 ) ) ( not ( = ?auto_176044 ?auto_176047 ) ) ( not ( = ?auto_176045 ?auto_176046 ) ) ( not ( = ?auto_176045 ?auto_176047 ) ) ( not ( = ?auto_176046 ?auto_176047 ) ) ( ON ?auto_176047 ?auto_176048 ) ( not ( = ?auto_176042 ?auto_176048 ) ) ( not ( = ?auto_176043 ?auto_176048 ) ) ( not ( = ?auto_176044 ?auto_176048 ) ) ( not ( = ?auto_176045 ?auto_176048 ) ) ( not ( = ?auto_176046 ?auto_176048 ) ) ( not ( = ?auto_176047 ?auto_176048 ) ) ( ON ?auto_176046 ?auto_176047 ) ( ON-TABLE ?auto_176049 ) ( ON ?auto_176048 ?auto_176049 ) ( not ( = ?auto_176049 ?auto_176048 ) ) ( not ( = ?auto_176049 ?auto_176047 ) ) ( not ( = ?auto_176049 ?auto_176046 ) ) ( not ( = ?auto_176042 ?auto_176049 ) ) ( not ( = ?auto_176043 ?auto_176049 ) ) ( not ( = ?auto_176044 ?auto_176049 ) ) ( not ( = ?auto_176045 ?auto_176049 ) ) ( ON ?auto_176045 ?auto_176046 ) ( ON ?auto_176044 ?auto_176045 ) ( CLEAR ?auto_176042 ) ( ON ?auto_176043 ?auto_176044 ) ( CLEAR ?auto_176043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176049 ?auto_176048 ?auto_176047 ?auto_176046 ?auto_176045 ?auto_176044 )
      ( MAKE-6PILE ?auto_176042 ?auto_176043 ?auto_176044 ?auto_176045 ?auto_176046 ?auto_176047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176050 - BLOCK
      ?auto_176051 - BLOCK
      ?auto_176052 - BLOCK
      ?auto_176053 - BLOCK
      ?auto_176054 - BLOCK
      ?auto_176055 - BLOCK
    )
    :vars
    (
      ?auto_176056 - BLOCK
      ?auto_176057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176050 ?auto_176051 ) ) ( not ( = ?auto_176050 ?auto_176052 ) ) ( not ( = ?auto_176050 ?auto_176053 ) ) ( not ( = ?auto_176050 ?auto_176054 ) ) ( not ( = ?auto_176050 ?auto_176055 ) ) ( not ( = ?auto_176051 ?auto_176052 ) ) ( not ( = ?auto_176051 ?auto_176053 ) ) ( not ( = ?auto_176051 ?auto_176054 ) ) ( not ( = ?auto_176051 ?auto_176055 ) ) ( not ( = ?auto_176052 ?auto_176053 ) ) ( not ( = ?auto_176052 ?auto_176054 ) ) ( not ( = ?auto_176052 ?auto_176055 ) ) ( not ( = ?auto_176053 ?auto_176054 ) ) ( not ( = ?auto_176053 ?auto_176055 ) ) ( not ( = ?auto_176054 ?auto_176055 ) ) ( ON ?auto_176055 ?auto_176056 ) ( not ( = ?auto_176050 ?auto_176056 ) ) ( not ( = ?auto_176051 ?auto_176056 ) ) ( not ( = ?auto_176052 ?auto_176056 ) ) ( not ( = ?auto_176053 ?auto_176056 ) ) ( not ( = ?auto_176054 ?auto_176056 ) ) ( not ( = ?auto_176055 ?auto_176056 ) ) ( ON ?auto_176054 ?auto_176055 ) ( ON-TABLE ?auto_176057 ) ( ON ?auto_176056 ?auto_176057 ) ( not ( = ?auto_176057 ?auto_176056 ) ) ( not ( = ?auto_176057 ?auto_176055 ) ) ( not ( = ?auto_176057 ?auto_176054 ) ) ( not ( = ?auto_176050 ?auto_176057 ) ) ( not ( = ?auto_176051 ?auto_176057 ) ) ( not ( = ?auto_176052 ?auto_176057 ) ) ( not ( = ?auto_176053 ?auto_176057 ) ) ( ON ?auto_176053 ?auto_176054 ) ( ON ?auto_176052 ?auto_176053 ) ( ON ?auto_176051 ?auto_176052 ) ( CLEAR ?auto_176051 ) ( HOLDING ?auto_176050 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176050 )
      ( MAKE-6PILE ?auto_176050 ?auto_176051 ?auto_176052 ?auto_176053 ?auto_176054 ?auto_176055 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176058 - BLOCK
      ?auto_176059 - BLOCK
      ?auto_176060 - BLOCK
      ?auto_176061 - BLOCK
      ?auto_176062 - BLOCK
      ?auto_176063 - BLOCK
    )
    :vars
    (
      ?auto_176064 - BLOCK
      ?auto_176065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176058 ?auto_176059 ) ) ( not ( = ?auto_176058 ?auto_176060 ) ) ( not ( = ?auto_176058 ?auto_176061 ) ) ( not ( = ?auto_176058 ?auto_176062 ) ) ( not ( = ?auto_176058 ?auto_176063 ) ) ( not ( = ?auto_176059 ?auto_176060 ) ) ( not ( = ?auto_176059 ?auto_176061 ) ) ( not ( = ?auto_176059 ?auto_176062 ) ) ( not ( = ?auto_176059 ?auto_176063 ) ) ( not ( = ?auto_176060 ?auto_176061 ) ) ( not ( = ?auto_176060 ?auto_176062 ) ) ( not ( = ?auto_176060 ?auto_176063 ) ) ( not ( = ?auto_176061 ?auto_176062 ) ) ( not ( = ?auto_176061 ?auto_176063 ) ) ( not ( = ?auto_176062 ?auto_176063 ) ) ( ON ?auto_176063 ?auto_176064 ) ( not ( = ?auto_176058 ?auto_176064 ) ) ( not ( = ?auto_176059 ?auto_176064 ) ) ( not ( = ?auto_176060 ?auto_176064 ) ) ( not ( = ?auto_176061 ?auto_176064 ) ) ( not ( = ?auto_176062 ?auto_176064 ) ) ( not ( = ?auto_176063 ?auto_176064 ) ) ( ON ?auto_176062 ?auto_176063 ) ( ON-TABLE ?auto_176065 ) ( ON ?auto_176064 ?auto_176065 ) ( not ( = ?auto_176065 ?auto_176064 ) ) ( not ( = ?auto_176065 ?auto_176063 ) ) ( not ( = ?auto_176065 ?auto_176062 ) ) ( not ( = ?auto_176058 ?auto_176065 ) ) ( not ( = ?auto_176059 ?auto_176065 ) ) ( not ( = ?auto_176060 ?auto_176065 ) ) ( not ( = ?auto_176061 ?auto_176065 ) ) ( ON ?auto_176061 ?auto_176062 ) ( ON ?auto_176060 ?auto_176061 ) ( ON ?auto_176059 ?auto_176060 ) ( ON ?auto_176058 ?auto_176059 ) ( CLEAR ?auto_176058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176065 ?auto_176064 ?auto_176063 ?auto_176062 ?auto_176061 ?auto_176060 ?auto_176059 )
      ( MAKE-6PILE ?auto_176058 ?auto_176059 ?auto_176060 ?auto_176061 ?auto_176062 ?auto_176063 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176072 - BLOCK
      ?auto_176073 - BLOCK
      ?auto_176074 - BLOCK
      ?auto_176075 - BLOCK
      ?auto_176076 - BLOCK
      ?auto_176077 - BLOCK
    )
    :vars
    (
      ?auto_176078 - BLOCK
      ?auto_176079 - BLOCK
      ?auto_176080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176072 ?auto_176073 ) ) ( not ( = ?auto_176072 ?auto_176074 ) ) ( not ( = ?auto_176072 ?auto_176075 ) ) ( not ( = ?auto_176072 ?auto_176076 ) ) ( not ( = ?auto_176072 ?auto_176077 ) ) ( not ( = ?auto_176073 ?auto_176074 ) ) ( not ( = ?auto_176073 ?auto_176075 ) ) ( not ( = ?auto_176073 ?auto_176076 ) ) ( not ( = ?auto_176073 ?auto_176077 ) ) ( not ( = ?auto_176074 ?auto_176075 ) ) ( not ( = ?auto_176074 ?auto_176076 ) ) ( not ( = ?auto_176074 ?auto_176077 ) ) ( not ( = ?auto_176075 ?auto_176076 ) ) ( not ( = ?auto_176075 ?auto_176077 ) ) ( not ( = ?auto_176076 ?auto_176077 ) ) ( ON ?auto_176077 ?auto_176078 ) ( not ( = ?auto_176072 ?auto_176078 ) ) ( not ( = ?auto_176073 ?auto_176078 ) ) ( not ( = ?auto_176074 ?auto_176078 ) ) ( not ( = ?auto_176075 ?auto_176078 ) ) ( not ( = ?auto_176076 ?auto_176078 ) ) ( not ( = ?auto_176077 ?auto_176078 ) ) ( ON ?auto_176076 ?auto_176077 ) ( ON-TABLE ?auto_176079 ) ( ON ?auto_176078 ?auto_176079 ) ( not ( = ?auto_176079 ?auto_176078 ) ) ( not ( = ?auto_176079 ?auto_176077 ) ) ( not ( = ?auto_176079 ?auto_176076 ) ) ( not ( = ?auto_176072 ?auto_176079 ) ) ( not ( = ?auto_176073 ?auto_176079 ) ) ( not ( = ?auto_176074 ?auto_176079 ) ) ( not ( = ?auto_176075 ?auto_176079 ) ) ( ON ?auto_176075 ?auto_176076 ) ( ON ?auto_176074 ?auto_176075 ) ( ON ?auto_176073 ?auto_176074 ) ( CLEAR ?auto_176073 ) ( ON ?auto_176072 ?auto_176080 ) ( CLEAR ?auto_176072 ) ( HAND-EMPTY ) ( not ( = ?auto_176072 ?auto_176080 ) ) ( not ( = ?auto_176073 ?auto_176080 ) ) ( not ( = ?auto_176074 ?auto_176080 ) ) ( not ( = ?auto_176075 ?auto_176080 ) ) ( not ( = ?auto_176076 ?auto_176080 ) ) ( not ( = ?auto_176077 ?auto_176080 ) ) ( not ( = ?auto_176078 ?auto_176080 ) ) ( not ( = ?auto_176079 ?auto_176080 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176072 ?auto_176080 )
      ( MAKE-6PILE ?auto_176072 ?auto_176073 ?auto_176074 ?auto_176075 ?auto_176076 ?auto_176077 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176081 - BLOCK
      ?auto_176082 - BLOCK
      ?auto_176083 - BLOCK
      ?auto_176084 - BLOCK
      ?auto_176085 - BLOCK
      ?auto_176086 - BLOCK
    )
    :vars
    (
      ?auto_176087 - BLOCK
      ?auto_176088 - BLOCK
      ?auto_176089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176081 ?auto_176082 ) ) ( not ( = ?auto_176081 ?auto_176083 ) ) ( not ( = ?auto_176081 ?auto_176084 ) ) ( not ( = ?auto_176081 ?auto_176085 ) ) ( not ( = ?auto_176081 ?auto_176086 ) ) ( not ( = ?auto_176082 ?auto_176083 ) ) ( not ( = ?auto_176082 ?auto_176084 ) ) ( not ( = ?auto_176082 ?auto_176085 ) ) ( not ( = ?auto_176082 ?auto_176086 ) ) ( not ( = ?auto_176083 ?auto_176084 ) ) ( not ( = ?auto_176083 ?auto_176085 ) ) ( not ( = ?auto_176083 ?auto_176086 ) ) ( not ( = ?auto_176084 ?auto_176085 ) ) ( not ( = ?auto_176084 ?auto_176086 ) ) ( not ( = ?auto_176085 ?auto_176086 ) ) ( ON ?auto_176086 ?auto_176087 ) ( not ( = ?auto_176081 ?auto_176087 ) ) ( not ( = ?auto_176082 ?auto_176087 ) ) ( not ( = ?auto_176083 ?auto_176087 ) ) ( not ( = ?auto_176084 ?auto_176087 ) ) ( not ( = ?auto_176085 ?auto_176087 ) ) ( not ( = ?auto_176086 ?auto_176087 ) ) ( ON ?auto_176085 ?auto_176086 ) ( ON-TABLE ?auto_176088 ) ( ON ?auto_176087 ?auto_176088 ) ( not ( = ?auto_176088 ?auto_176087 ) ) ( not ( = ?auto_176088 ?auto_176086 ) ) ( not ( = ?auto_176088 ?auto_176085 ) ) ( not ( = ?auto_176081 ?auto_176088 ) ) ( not ( = ?auto_176082 ?auto_176088 ) ) ( not ( = ?auto_176083 ?auto_176088 ) ) ( not ( = ?auto_176084 ?auto_176088 ) ) ( ON ?auto_176084 ?auto_176085 ) ( ON ?auto_176083 ?auto_176084 ) ( ON ?auto_176081 ?auto_176089 ) ( CLEAR ?auto_176081 ) ( not ( = ?auto_176081 ?auto_176089 ) ) ( not ( = ?auto_176082 ?auto_176089 ) ) ( not ( = ?auto_176083 ?auto_176089 ) ) ( not ( = ?auto_176084 ?auto_176089 ) ) ( not ( = ?auto_176085 ?auto_176089 ) ) ( not ( = ?auto_176086 ?auto_176089 ) ) ( not ( = ?auto_176087 ?auto_176089 ) ) ( not ( = ?auto_176088 ?auto_176089 ) ) ( HOLDING ?auto_176082 ) ( CLEAR ?auto_176083 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176088 ?auto_176087 ?auto_176086 ?auto_176085 ?auto_176084 ?auto_176083 ?auto_176082 )
      ( MAKE-6PILE ?auto_176081 ?auto_176082 ?auto_176083 ?auto_176084 ?auto_176085 ?auto_176086 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176090 - BLOCK
      ?auto_176091 - BLOCK
      ?auto_176092 - BLOCK
      ?auto_176093 - BLOCK
      ?auto_176094 - BLOCK
      ?auto_176095 - BLOCK
    )
    :vars
    (
      ?auto_176098 - BLOCK
      ?auto_176097 - BLOCK
      ?auto_176096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176090 ?auto_176091 ) ) ( not ( = ?auto_176090 ?auto_176092 ) ) ( not ( = ?auto_176090 ?auto_176093 ) ) ( not ( = ?auto_176090 ?auto_176094 ) ) ( not ( = ?auto_176090 ?auto_176095 ) ) ( not ( = ?auto_176091 ?auto_176092 ) ) ( not ( = ?auto_176091 ?auto_176093 ) ) ( not ( = ?auto_176091 ?auto_176094 ) ) ( not ( = ?auto_176091 ?auto_176095 ) ) ( not ( = ?auto_176092 ?auto_176093 ) ) ( not ( = ?auto_176092 ?auto_176094 ) ) ( not ( = ?auto_176092 ?auto_176095 ) ) ( not ( = ?auto_176093 ?auto_176094 ) ) ( not ( = ?auto_176093 ?auto_176095 ) ) ( not ( = ?auto_176094 ?auto_176095 ) ) ( ON ?auto_176095 ?auto_176098 ) ( not ( = ?auto_176090 ?auto_176098 ) ) ( not ( = ?auto_176091 ?auto_176098 ) ) ( not ( = ?auto_176092 ?auto_176098 ) ) ( not ( = ?auto_176093 ?auto_176098 ) ) ( not ( = ?auto_176094 ?auto_176098 ) ) ( not ( = ?auto_176095 ?auto_176098 ) ) ( ON ?auto_176094 ?auto_176095 ) ( ON-TABLE ?auto_176097 ) ( ON ?auto_176098 ?auto_176097 ) ( not ( = ?auto_176097 ?auto_176098 ) ) ( not ( = ?auto_176097 ?auto_176095 ) ) ( not ( = ?auto_176097 ?auto_176094 ) ) ( not ( = ?auto_176090 ?auto_176097 ) ) ( not ( = ?auto_176091 ?auto_176097 ) ) ( not ( = ?auto_176092 ?auto_176097 ) ) ( not ( = ?auto_176093 ?auto_176097 ) ) ( ON ?auto_176093 ?auto_176094 ) ( ON ?auto_176092 ?auto_176093 ) ( ON ?auto_176090 ?auto_176096 ) ( not ( = ?auto_176090 ?auto_176096 ) ) ( not ( = ?auto_176091 ?auto_176096 ) ) ( not ( = ?auto_176092 ?auto_176096 ) ) ( not ( = ?auto_176093 ?auto_176096 ) ) ( not ( = ?auto_176094 ?auto_176096 ) ) ( not ( = ?auto_176095 ?auto_176096 ) ) ( not ( = ?auto_176098 ?auto_176096 ) ) ( not ( = ?auto_176097 ?auto_176096 ) ) ( CLEAR ?auto_176092 ) ( ON ?auto_176091 ?auto_176090 ) ( CLEAR ?auto_176091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176096 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176096 ?auto_176090 )
      ( MAKE-6PILE ?auto_176090 ?auto_176091 ?auto_176092 ?auto_176093 ?auto_176094 ?auto_176095 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176099 - BLOCK
      ?auto_176100 - BLOCK
      ?auto_176101 - BLOCK
      ?auto_176102 - BLOCK
      ?auto_176103 - BLOCK
      ?auto_176104 - BLOCK
    )
    :vars
    (
      ?auto_176105 - BLOCK
      ?auto_176107 - BLOCK
      ?auto_176106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176099 ?auto_176100 ) ) ( not ( = ?auto_176099 ?auto_176101 ) ) ( not ( = ?auto_176099 ?auto_176102 ) ) ( not ( = ?auto_176099 ?auto_176103 ) ) ( not ( = ?auto_176099 ?auto_176104 ) ) ( not ( = ?auto_176100 ?auto_176101 ) ) ( not ( = ?auto_176100 ?auto_176102 ) ) ( not ( = ?auto_176100 ?auto_176103 ) ) ( not ( = ?auto_176100 ?auto_176104 ) ) ( not ( = ?auto_176101 ?auto_176102 ) ) ( not ( = ?auto_176101 ?auto_176103 ) ) ( not ( = ?auto_176101 ?auto_176104 ) ) ( not ( = ?auto_176102 ?auto_176103 ) ) ( not ( = ?auto_176102 ?auto_176104 ) ) ( not ( = ?auto_176103 ?auto_176104 ) ) ( ON ?auto_176104 ?auto_176105 ) ( not ( = ?auto_176099 ?auto_176105 ) ) ( not ( = ?auto_176100 ?auto_176105 ) ) ( not ( = ?auto_176101 ?auto_176105 ) ) ( not ( = ?auto_176102 ?auto_176105 ) ) ( not ( = ?auto_176103 ?auto_176105 ) ) ( not ( = ?auto_176104 ?auto_176105 ) ) ( ON ?auto_176103 ?auto_176104 ) ( ON-TABLE ?auto_176107 ) ( ON ?auto_176105 ?auto_176107 ) ( not ( = ?auto_176107 ?auto_176105 ) ) ( not ( = ?auto_176107 ?auto_176104 ) ) ( not ( = ?auto_176107 ?auto_176103 ) ) ( not ( = ?auto_176099 ?auto_176107 ) ) ( not ( = ?auto_176100 ?auto_176107 ) ) ( not ( = ?auto_176101 ?auto_176107 ) ) ( not ( = ?auto_176102 ?auto_176107 ) ) ( ON ?auto_176102 ?auto_176103 ) ( ON ?auto_176099 ?auto_176106 ) ( not ( = ?auto_176099 ?auto_176106 ) ) ( not ( = ?auto_176100 ?auto_176106 ) ) ( not ( = ?auto_176101 ?auto_176106 ) ) ( not ( = ?auto_176102 ?auto_176106 ) ) ( not ( = ?auto_176103 ?auto_176106 ) ) ( not ( = ?auto_176104 ?auto_176106 ) ) ( not ( = ?auto_176105 ?auto_176106 ) ) ( not ( = ?auto_176107 ?auto_176106 ) ) ( ON ?auto_176100 ?auto_176099 ) ( CLEAR ?auto_176100 ) ( ON-TABLE ?auto_176106 ) ( HOLDING ?auto_176101 ) ( CLEAR ?auto_176102 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176107 ?auto_176105 ?auto_176104 ?auto_176103 ?auto_176102 ?auto_176101 )
      ( MAKE-6PILE ?auto_176099 ?auto_176100 ?auto_176101 ?auto_176102 ?auto_176103 ?auto_176104 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176108 - BLOCK
      ?auto_176109 - BLOCK
      ?auto_176110 - BLOCK
      ?auto_176111 - BLOCK
      ?auto_176112 - BLOCK
      ?auto_176113 - BLOCK
    )
    :vars
    (
      ?auto_176116 - BLOCK
      ?auto_176114 - BLOCK
      ?auto_176115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176108 ?auto_176109 ) ) ( not ( = ?auto_176108 ?auto_176110 ) ) ( not ( = ?auto_176108 ?auto_176111 ) ) ( not ( = ?auto_176108 ?auto_176112 ) ) ( not ( = ?auto_176108 ?auto_176113 ) ) ( not ( = ?auto_176109 ?auto_176110 ) ) ( not ( = ?auto_176109 ?auto_176111 ) ) ( not ( = ?auto_176109 ?auto_176112 ) ) ( not ( = ?auto_176109 ?auto_176113 ) ) ( not ( = ?auto_176110 ?auto_176111 ) ) ( not ( = ?auto_176110 ?auto_176112 ) ) ( not ( = ?auto_176110 ?auto_176113 ) ) ( not ( = ?auto_176111 ?auto_176112 ) ) ( not ( = ?auto_176111 ?auto_176113 ) ) ( not ( = ?auto_176112 ?auto_176113 ) ) ( ON ?auto_176113 ?auto_176116 ) ( not ( = ?auto_176108 ?auto_176116 ) ) ( not ( = ?auto_176109 ?auto_176116 ) ) ( not ( = ?auto_176110 ?auto_176116 ) ) ( not ( = ?auto_176111 ?auto_176116 ) ) ( not ( = ?auto_176112 ?auto_176116 ) ) ( not ( = ?auto_176113 ?auto_176116 ) ) ( ON ?auto_176112 ?auto_176113 ) ( ON-TABLE ?auto_176114 ) ( ON ?auto_176116 ?auto_176114 ) ( not ( = ?auto_176114 ?auto_176116 ) ) ( not ( = ?auto_176114 ?auto_176113 ) ) ( not ( = ?auto_176114 ?auto_176112 ) ) ( not ( = ?auto_176108 ?auto_176114 ) ) ( not ( = ?auto_176109 ?auto_176114 ) ) ( not ( = ?auto_176110 ?auto_176114 ) ) ( not ( = ?auto_176111 ?auto_176114 ) ) ( ON ?auto_176111 ?auto_176112 ) ( ON ?auto_176108 ?auto_176115 ) ( not ( = ?auto_176108 ?auto_176115 ) ) ( not ( = ?auto_176109 ?auto_176115 ) ) ( not ( = ?auto_176110 ?auto_176115 ) ) ( not ( = ?auto_176111 ?auto_176115 ) ) ( not ( = ?auto_176112 ?auto_176115 ) ) ( not ( = ?auto_176113 ?auto_176115 ) ) ( not ( = ?auto_176116 ?auto_176115 ) ) ( not ( = ?auto_176114 ?auto_176115 ) ) ( ON ?auto_176109 ?auto_176108 ) ( ON-TABLE ?auto_176115 ) ( CLEAR ?auto_176111 ) ( ON ?auto_176110 ?auto_176109 ) ( CLEAR ?auto_176110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176115 ?auto_176108 ?auto_176109 )
      ( MAKE-6PILE ?auto_176108 ?auto_176109 ?auto_176110 ?auto_176111 ?auto_176112 ?auto_176113 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176117 - BLOCK
      ?auto_176118 - BLOCK
      ?auto_176119 - BLOCK
      ?auto_176120 - BLOCK
      ?auto_176121 - BLOCK
      ?auto_176122 - BLOCK
    )
    :vars
    (
      ?auto_176124 - BLOCK
      ?auto_176125 - BLOCK
      ?auto_176123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176117 ?auto_176118 ) ) ( not ( = ?auto_176117 ?auto_176119 ) ) ( not ( = ?auto_176117 ?auto_176120 ) ) ( not ( = ?auto_176117 ?auto_176121 ) ) ( not ( = ?auto_176117 ?auto_176122 ) ) ( not ( = ?auto_176118 ?auto_176119 ) ) ( not ( = ?auto_176118 ?auto_176120 ) ) ( not ( = ?auto_176118 ?auto_176121 ) ) ( not ( = ?auto_176118 ?auto_176122 ) ) ( not ( = ?auto_176119 ?auto_176120 ) ) ( not ( = ?auto_176119 ?auto_176121 ) ) ( not ( = ?auto_176119 ?auto_176122 ) ) ( not ( = ?auto_176120 ?auto_176121 ) ) ( not ( = ?auto_176120 ?auto_176122 ) ) ( not ( = ?auto_176121 ?auto_176122 ) ) ( ON ?auto_176122 ?auto_176124 ) ( not ( = ?auto_176117 ?auto_176124 ) ) ( not ( = ?auto_176118 ?auto_176124 ) ) ( not ( = ?auto_176119 ?auto_176124 ) ) ( not ( = ?auto_176120 ?auto_176124 ) ) ( not ( = ?auto_176121 ?auto_176124 ) ) ( not ( = ?auto_176122 ?auto_176124 ) ) ( ON ?auto_176121 ?auto_176122 ) ( ON-TABLE ?auto_176125 ) ( ON ?auto_176124 ?auto_176125 ) ( not ( = ?auto_176125 ?auto_176124 ) ) ( not ( = ?auto_176125 ?auto_176122 ) ) ( not ( = ?auto_176125 ?auto_176121 ) ) ( not ( = ?auto_176117 ?auto_176125 ) ) ( not ( = ?auto_176118 ?auto_176125 ) ) ( not ( = ?auto_176119 ?auto_176125 ) ) ( not ( = ?auto_176120 ?auto_176125 ) ) ( ON ?auto_176117 ?auto_176123 ) ( not ( = ?auto_176117 ?auto_176123 ) ) ( not ( = ?auto_176118 ?auto_176123 ) ) ( not ( = ?auto_176119 ?auto_176123 ) ) ( not ( = ?auto_176120 ?auto_176123 ) ) ( not ( = ?auto_176121 ?auto_176123 ) ) ( not ( = ?auto_176122 ?auto_176123 ) ) ( not ( = ?auto_176124 ?auto_176123 ) ) ( not ( = ?auto_176125 ?auto_176123 ) ) ( ON ?auto_176118 ?auto_176117 ) ( ON-TABLE ?auto_176123 ) ( ON ?auto_176119 ?auto_176118 ) ( CLEAR ?auto_176119 ) ( HOLDING ?auto_176120 ) ( CLEAR ?auto_176121 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176125 ?auto_176124 ?auto_176122 ?auto_176121 ?auto_176120 )
      ( MAKE-6PILE ?auto_176117 ?auto_176118 ?auto_176119 ?auto_176120 ?auto_176121 ?auto_176122 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176126 - BLOCK
      ?auto_176127 - BLOCK
      ?auto_176128 - BLOCK
      ?auto_176129 - BLOCK
      ?auto_176130 - BLOCK
      ?auto_176131 - BLOCK
    )
    :vars
    (
      ?auto_176134 - BLOCK
      ?auto_176133 - BLOCK
      ?auto_176132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176126 ?auto_176127 ) ) ( not ( = ?auto_176126 ?auto_176128 ) ) ( not ( = ?auto_176126 ?auto_176129 ) ) ( not ( = ?auto_176126 ?auto_176130 ) ) ( not ( = ?auto_176126 ?auto_176131 ) ) ( not ( = ?auto_176127 ?auto_176128 ) ) ( not ( = ?auto_176127 ?auto_176129 ) ) ( not ( = ?auto_176127 ?auto_176130 ) ) ( not ( = ?auto_176127 ?auto_176131 ) ) ( not ( = ?auto_176128 ?auto_176129 ) ) ( not ( = ?auto_176128 ?auto_176130 ) ) ( not ( = ?auto_176128 ?auto_176131 ) ) ( not ( = ?auto_176129 ?auto_176130 ) ) ( not ( = ?auto_176129 ?auto_176131 ) ) ( not ( = ?auto_176130 ?auto_176131 ) ) ( ON ?auto_176131 ?auto_176134 ) ( not ( = ?auto_176126 ?auto_176134 ) ) ( not ( = ?auto_176127 ?auto_176134 ) ) ( not ( = ?auto_176128 ?auto_176134 ) ) ( not ( = ?auto_176129 ?auto_176134 ) ) ( not ( = ?auto_176130 ?auto_176134 ) ) ( not ( = ?auto_176131 ?auto_176134 ) ) ( ON ?auto_176130 ?auto_176131 ) ( ON-TABLE ?auto_176133 ) ( ON ?auto_176134 ?auto_176133 ) ( not ( = ?auto_176133 ?auto_176134 ) ) ( not ( = ?auto_176133 ?auto_176131 ) ) ( not ( = ?auto_176133 ?auto_176130 ) ) ( not ( = ?auto_176126 ?auto_176133 ) ) ( not ( = ?auto_176127 ?auto_176133 ) ) ( not ( = ?auto_176128 ?auto_176133 ) ) ( not ( = ?auto_176129 ?auto_176133 ) ) ( ON ?auto_176126 ?auto_176132 ) ( not ( = ?auto_176126 ?auto_176132 ) ) ( not ( = ?auto_176127 ?auto_176132 ) ) ( not ( = ?auto_176128 ?auto_176132 ) ) ( not ( = ?auto_176129 ?auto_176132 ) ) ( not ( = ?auto_176130 ?auto_176132 ) ) ( not ( = ?auto_176131 ?auto_176132 ) ) ( not ( = ?auto_176134 ?auto_176132 ) ) ( not ( = ?auto_176133 ?auto_176132 ) ) ( ON ?auto_176127 ?auto_176126 ) ( ON-TABLE ?auto_176132 ) ( ON ?auto_176128 ?auto_176127 ) ( CLEAR ?auto_176130 ) ( ON ?auto_176129 ?auto_176128 ) ( CLEAR ?auto_176129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176132 ?auto_176126 ?auto_176127 ?auto_176128 )
      ( MAKE-6PILE ?auto_176126 ?auto_176127 ?auto_176128 ?auto_176129 ?auto_176130 ?auto_176131 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176135 - BLOCK
      ?auto_176136 - BLOCK
      ?auto_176137 - BLOCK
      ?auto_176138 - BLOCK
      ?auto_176139 - BLOCK
      ?auto_176140 - BLOCK
    )
    :vars
    (
      ?auto_176141 - BLOCK
      ?auto_176143 - BLOCK
      ?auto_176142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176135 ?auto_176136 ) ) ( not ( = ?auto_176135 ?auto_176137 ) ) ( not ( = ?auto_176135 ?auto_176138 ) ) ( not ( = ?auto_176135 ?auto_176139 ) ) ( not ( = ?auto_176135 ?auto_176140 ) ) ( not ( = ?auto_176136 ?auto_176137 ) ) ( not ( = ?auto_176136 ?auto_176138 ) ) ( not ( = ?auto_176136 ?auto_176139 ) ) ( not ( = ?auto_176136 ?auto_176140 ) ) ( not ( = ?auto_176137 ?auto_176138 ) ) ( not ( = ?auto_176137 ?auto_176139 ) ) ( not ( = ?auto_176137 ?auto_176140 ) ) ( not ( = ?auto_176138 ?auto_176139 ) ) ( not ( = ?auto_176138 ?auto_176140 ) ) ( not ( = ?auto_176139 ?auto_176140 ) ) ( ON ?auto_176140 ?auto_176141 ) ( not ( = ?auto_176135 ?auto_176141 ) ) ( not ( = ?auto_176136 ?auto_176141 ) ) ( not ( = ?auto_176137 ?auto_176141 ) ) ( not ( = ?auto_176138 ?auto_176141 ) ) ( not ( = ?auto_176139 ?auto_176141 ) ) ( not ( = ?auto_176140 ?auto_176141 ) ) ( ON-TABLE ?auto_176143 ) ( ON ?auto_176141 ?auto_176143 ) ( not ( = ?auto_176143 ?auto_176141 ) ) ( not ( = ?auto_176143 ?auto_176140 ) ) ( not ( = ?auto_176143 ?auto_176139 ) ) ( not ( = ?auto_176135 ?auto_176143 ) ) ( not ( = ?auto_176136 ?auto_176143 ) ) ( not ( = ?auto_176137 ?auto_176143 ) ) ( not ( = ?auto_176138 ?auto_176143 ) ) ( ON ?auto_176135 ?auto_176142 ) ( not ( = ?auto_176135 ?auto_176142 ) ) ( not ( = ?auto_176136 ?auto_176142 ) ) ( not ( = ?auto_176137 ?auto_176142 ) ) ( not ( = ?auto_176138 ?auto_176142 ) ) ( not ( = ?auto_176139 ?auto_176142 ) ) ( not ( = ?auto_176140 ?auto_176142 ) ) ( not ( = ?auto_176141 ?auto_176142 ) ) ( not ( = ?auto_176143 ?auto_176142 ) ) ( ON ?auto_176136 ?auto_176135 ) ( ON-TABLE ?auto_176142 ) ( ON ?auto_176137 ?auto_176136 ) ( ON ?auto_176138 ?auto_176137 ) ( CLEAR ?auto_176138 ) ( HOLDING ?auto_176139 ) ( CLEAR ?auto_176140 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176143 ?auto_176141 ?auto_176140 ?auto_176139 )
      ( MAKE-6PILE ?auto_176135 ?auto_176136 ?auto_176137 ?auto_176138 ?auto_176139 ?auto_176140 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176144 - BLOCK
      ?auto_176145 - BLOCK
      ?auto_176146 - BLOCK
      ?auto_176147 - BLOCK
      ?auto_176148 - BLOCK
      ?auto_176149 - BLOCK
    )
    :vars
    (
      ?auto_176150 - BLOCK
      ?auto_176152 - BLOCK
      ?auto_176151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176144 ?auto_176145 ) ) ( not ( = ?auto_176144 ?auto_176146 ) ) ( not ( = ?auto_176144 ?auto_176147 ) ) ( not ( = ?auto_176144 ?auto_176148 ) ) ( not ( = ?auto_176144 ?auto_176149 ) ) ( not ( = ?auto_176145 ?auto_176146 ) ) ( not ( = ?auto_176145 ?auto_176147 ) ) ( not ( = ?auto_176145 ?auto_176148 ) ) ( not ( = ?auto_176145 ?auto_176149 ) ) ( not ( = ?auto_176146 ?auto_176147 ) ) ( not ( = ?auto_176146 ?auto_176148 ) ) ( not ( = ?auto_176146 ?auto_176149 ) ) ( not ( = ?auto_176147 ?auto_176148 ) ) ( not ( = ?auto_176147 ?auto_176149 ) ) ( not ( = ?auto_176148 ?auto_176149 ) ) ( ON ?auto_176149 ?auto_176150 ) ( not ( = ?auto_176144 ?auto_176150 ) ) ( not ( = ?auto_176145 ?auto_176150 ) ) ( not ( = ?auto_176146 ?auto_176150 ) ) ( not ( = ?auto_176147 ?auto_176150 ) ) ( not ( = ?auto_176148 ?auto_176150 ) ) ( not ( = ?auto_176149 ?auto_176150 ) ) ( ON-TABLE ?auto_176152 ) ( ON ?auto_176150 ?auto_176152 ) ( not ( = ?auto_176152 ?auto_176150 ) ) ( not ( = ?auto_176152 ?auto_176149 ) ) ( not ( = ?auto_176152 ?auto_176148 ) ) ( not ( = ?auto_176144 ?auto_176152 ) ) ( not ( = ?auto_176145 ?auto_176152 ) ) ( not ( = ?auto_176146 ?auto_176152 ) ) ( not ( = ?auto_176147 ?auto_176152 ) ) ( ON ?auto_176144 ?auto_176151 ) ( not ( = ?auto_176144 ?auto_176151 ) ) ( not ( = ?auto_176145 ?auto_176151 ) ) ( not ( = ?auto_176146 ?auto_176151 ) ) ( not ( = ?auto_176147 ?auto_176151 ) ) ( not ( = ?auto_176148 ?auto_176151 ) ) ( not ( = ?auto_176149 ?auto_176151 ) ) ( not ( = ?auto_176150 ?auto_176151 ) ) ( not ( = ?auto_176152 ?auto_176151 ) ) ( ON ?auto_176145 ?auto_176144 ) ( ON-TABLE ?auto_176151 ) ( ON ?auto_176146 ?auto_176145 ) ( ON ?auto_176147 ?auto_176146 ) ( CLEAR ?auto_176149 ) ( ON ?auto_176148 ?auto_176147 ) ( CLEAR ?auto_176148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176151 ?auto_176144 ?auto_176145 ?auto_176146 ?auto_176147 )
      ( MAKE-6PILE ?auto_176144 ?auto_176145 ?auto_176146 ?auto_176147 ?auto_176148 ?auto_176149 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176153 - BLOCK
      ?auto_176154 - BLOCK
      ?auto_176155 - BLOCK
      ?auto_176156 - BLOCK
      ?auto_176157 - BLOCK
      ?auto_176158 - BLOCK
    )
    :vars
    (
      ?auto_176161 - BLOCK
      ?auto_176160 - BLOCK
      ?auto_176159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176153 ?auto_176154 ) ) ( not ( = ?auto_176153 ?auto_176155 ) ) ( not ( = ?auto_176153 ?auto_176156 ) ) ( not ( = ?auto_176153 ?auto_176157 ) ) ( not ( = ?auto_176153 ?auto_176158 ) ) ( not ( = ?auto_176154 ?auto_176155 ) ) ( not ( = ?auto_176154 ?auto_176156 ) ) ( not ( = ?auto_176154 ?auto_176157 ) ) ( not ( = ?auto_176154 ?auto_176158 ) ) ( not ( = ?auto_176155 ?auto_176156 ) ) ( not ( = ?auto_176155 ?auto_176157 ) ) ( not ( = ?auto_176155 ?auto_176158 ) ) ( not ( = ?auto_176156 ?auto_176157 ) ) ( not ( = ?auto_176156 ?auto_176158 ) ) ( not ( = ?auto_176157 ?auto_176158 ) ) ( not ( = ?auto_176153 ?auto_176161 ) ) ( not ( = ?auto_176154 ?auto_176161 ) ) ( not ( = ?auto_176155 ?auto_176161 ) ) ( not ( = ?auto_176156 ?auto_176161 ) ) ( not ( = ?auto_176157 ?auto_176161 ) ) ( not ( = ?auto_176158 ?auto_176161 ) ) ( ON-TABLE ?auto_176160 ) ( ON ?auto_176161 ?auto_176160 ) ( not ( = ?auto_176160 ?auto_176161 ) ) ( not ( = ?auto_176160 ?auto_176158 ) ) ( not ( = ?auto_176160 ?auto_176157 ) ) ( not ( = ?auto_176153 ?auto_176160 ) ) ( not ( = ?auto_176154 ?auto_176160 ) ) ( not ( = ?auto_176155 ?auto_176160 ) ) ( not ( = ?auto_176156 ?auto_176160 ) ) ( ON ?auto_176153 ?auto_176159 ) ( not ( = ?auto_176153 ?auto_176159 ) ) ( not ( = ?auto_176154 ?auto_176159 ) ) ( not ( = ?auto_176155 ?auto_176159 ) ) ( not ( = ?auto_176156 ?auto_176159 ) ) ( not ( = ?auto_176157 ?auto_176159 ) ) ( not ( = ?auto_176158 ?auto_176159 ) ) ( not ( = ?auto_176161 ?auto_176159 ) ) ( not ( = ?auto_176160 ?auto_176159 ) ) ( ON ?auto_176154 ?auto_176153 ) ( ON-TABLE ?auto_176159 ) ( ON ?auto_176155 ?auto_176154 ) ( ON ?auto_176156 ?auto_176155 ) ( ON ?auto_176157 ?auto_176156 ) ( CLEAR ?auto_176157 ) ( HOLDING ?auto_176158 ) ( CLEAR ?auto_176161 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176160 ?auto_176161 ?auto_176158 )
      ( MAKE-6PILE ?auto_176153 ?auto_176154 ?auto_176155 ?auto_176156 ?auto_176157 ?auto_176158 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176162 - BLOCK
      ?auto_176163 - BLOCK
      ?auto_176164 - BLOCK
      ?auto_176165 - BLOCK
      ?auto_176166 - BLOCK
      ?auto_176167 - BLOCK
    )
    :vars
    (
      ?auto_176168 - BLOCK
      ?auto_176170 - BLOCK
      ?auto_176169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176162 ?auto_176163 ) ) ( not ( = ?auto_176162 ?auto_176164 ) ) ( not ( = ?auto_176162 ?auto_176165 ) ) ( not ( = ?auto_176162 ?auto_176166 ) ) ( not ( = ?auto_176162 ?auto_176167 ) ) ( not ( = ?auto_176163 ?auto_176164 ) ) ( not ( = ?auto_176163 ?auto_176165 ) ) ( not ( = ?auto_176163 ?auto_176166 ) ) ( not ( = ?auto_176163 ?auto_176167 ) ) ( not ( = ?auto_176164 ?auto_176165 ) ) ( not ( = ?auto_176164 ?auto_176166 ) ) ( not ( = ?auto_176164 ?auto_176167 ) ) ( not ( = ?auto_176165 ?auto_176166 ) ) ( not ( = ?auto_176165 ?auto_176167 ) ) ( not ( = ?auto_176166 ?auto_176167 ) ) ( not ( = ?auto_176162 ?auto_176168 ) ) ( not ( = ?auto_176163 ?auto_176168 ) ) ( not ( = ?auto_176164 ?auto_176168 ) ) ( not ( = ?auto_176165 ?auto_176168 ) ) ( not ( = ?auto_176166 ?auto_176168 ) ) ( not ( = ?auto_176167 ?auto_176168 ) ) ( ON-TABLE ?auto_176170 ) ( ON ?auto_176168 ?auto_176170 ) ( not ( = ?auto_176170 ?auto_176168 ) ) ( not ( = ?auto_176170 ?auto_176167 ) ) ( not ( = ?auto_176170 ?auto_176166 ) ) ( not ( = ?auto_176162 ?auto_176170 ) ) ( not ( = ?auto_176163 ?auto_176170 ) ) ( not ( = ?auto_176164 ?auto_176170 ) ) ( not ( = ?auto_176165 ?auto_176170 ) ) ( ON ?auto_176162 ?auto_176169 ) ( not ( = ?auto_176162 ?auto_176169 ) ) ( not ( = ?auto_176163 ?auto_176169 ) ) ( not ( = ?auto_176164 ?auto_176169 ) ) ( not ( = ?auto_176165 ?auto_176169 ) ) ( not ( = ?auto_176166 ?auto_176169 ) ) ( not ( = ?auto_176167 ?auto_176169 ) ) ( not ( = ?auto_176168 ?auto_176169 ) ) ( not ( = ?auto_176170 ?auto_176169 ) ) ( ON ?auto_176163 ?auto_176162 ) ( ON-TABLE ?auto_176169 ) ( ON ?auto_176164 ?auto_176163 ) ( ON ?auto_176165 ?auto_176164 ) ( ON ?auto_176166 ?auto_176165 ) ( CLEAR ?auto_176168 ) ( ON ?auto_176167 ?auto_176166 ) ( CLEAR ?auto_176167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176169 ?auto_176162 ?auto_176163 ?auto_176164 ?auto_176165 ?auto_176166 )
      ( MAKE-6PILE ?auto_176162 ?auto_176163 ?auto_176164 ?auto_176165 ?auto_176166 ?auto_176167 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176171 - BLOCK
      ?auto_176172 - BLOCK
      ?auto_176173 - BLOCK
      ?auto_176174 - BLOCK
      ?auto_176175 - BLOCK
      ?auto_176176 - BLOCK
    )
    :vars
    (
      ?auto_176178 - BLOCK
      ?auto_176179 - BLOCK
      ?auto_176177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176171 ?auto_176172 ) ) ( not ( = ?auto_176171 ?auto_176173 ) ) ( not ( = ?auto_176171 ?auto_176174 ) ) ( not ( = ?auto_176171 ?auto_176175 ) ) ( not ( = ?auto_176171 ?auto_176176 ) ) ( not ( = ?auto_176172 ?auto_176173 ) ) ( not ( = ?auto_176172 ?auto_176174 ) ) ( not ( = ?auto_176172 ?auto_176175 ) ) ( not ( = ?auto_176172 ?auto_176176 ) ) ( not ( = ?auto_176173 ?auto_176174 ) ) ( not ( = ?auto_176173 ?auto_176175 ) ) ( not ( = ?auto_176173 ?auto_176176 ) ) ( not ( = ?auto_176174 ?auto_176175 ) ) ( not ( = ?auto_176174 ?auto_176176 ) ) ( not ( = ?auto_176175 ?auto_176176 ) ) ( not ( = ?auto_176171 ?auto_176178 ) ) ( not ( = ?auto_176172 ?auto_176178 ) ) ( not ( = ?auto_176173 ?auto_176178 ) ) ( not ( = ?auto_176174 ?auto_176178 ) ) ( not ( = ?auto_176175 ?auto_176178 ) ) ( not ( = ?auto_176176 ?auto_176178 ) ) ( ON-TABLE ?auto_176179 ) ( not ( = ?auto_176179 ?auto_176178 ) ) ( not ( = ?auto_176179 ?auto_176176 ) ) ( not ( = ?auto_176179 ?auto_176175 ) ) ( not ( = ?auto_176171 ?auto_176179 ) ) ( not ( = ?auto_176172 ?auto_176179 ) ) ( not ( = ?auto_176173 ?auto_176179 ) ) ( not ( = ?auto_176174 ?auto_176179 ) ) ( ON ?auto_176171 ?auto_176177 ) ( not ( = ?auto_176171 ?auto_176177 ) ) ( not ( = ?auto_176172 ?auto_176177 ) ) ( not ( = ?auto_176173 ?auto_176177 ) ) ( not ( = ?auto_176174 ?auto_176177 ) ) ( not ( = ?auto_176175 ?auto_176177 ) ) ( not ( = ?auto_176176 ?auto_176177 ) ) ( not ( = ?auto_176178 ?auto_176177 ) ) ( not ( = ?auto_176179 ?auto_176177 ) ) ( ON ?auto_176172 ?auto_176171 ) ( ON-TABLE ?auto_176177 ) ( ON ?auto_176173 ?auto_176172 ) ( ON ?auto_176174 ?auto_176173 ) ( ON ?auto_176175 ?auto_176174 ) ( ON ?auto_176176 ?auto_176175 ) ( CLEAR ?auto_176176 ) ( HOLDING ?auto_176178 ) ( CLEAR ?auto_176179 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176179 ?auto_176178 )
      ( MAKE-6PILE ?auto_176171 ?auto_176172 ?auto_176173 ?auto_176174 ?auto_176175 ?auto_176176 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176180 - BLOCK
      ?auto_176181 - BLOCK
      ?auto_176182 - BLOCK
      ?auto_176183 - BLOCK
      ?auto_176184 - BLOCK
      ?auto_176185 - BLOCK
    )
    :vars
    (
      ?auto_176188 - BLOCK
      ?auto_176187 - BLOCK
      ?auto_176186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176180 ?auto_176181 ) ) ( not ( = ?auto_176180 ?auto_176182 ) ) ( not ( = ?auto_176180 ?auto_176183 ) ) ( not ( = ?auto_176180 ?auto_176184 ) ) ( not ( = ?auto_176180 ?auto_176185 ) ) ( not ( = ?auto_176181 ?auto_176182 ) ) ( not ( = ?auto_176181 ?auto_176183 ) ) ( not ( = ?auto_176181 ?auto_176184 ) ) ( not ( = ?auto_176181 ?auto_176185 ) ) ( not ( = ?auto_176182 ?auto_176183 ) ) ( not ( = ?auto_176182 ?auto_176184 ) ) ( not ( = ?auto_176182 ?auto_176185 ) ) ( not ( = ?auto_176183 ?auto_176184 ) ) ( not ( = ?auto_176183 ?auto_176185 ) ) ( not ( = ?auto_176184 ?auto_176185 ) ) ( not ( = ?auto_176180 ?auto_176188 ) ) ( not ( = ?auto_176181 ?auto_176188 ) ) ( not ( = ?auto_176182 ?auto_176188 ) ) ( not ( = ?auto_176183 ?auto_176188 ) ) ( not ( = ?auto_176184 ?auto_176188 ) ) ( not ( = ?auto_176185 ?auto_176188 ) ) ( ON-TABLE ?auto_176187 ) ( not ( = ?auto_176187 ?auto_176188 ) ) ( not ( = ?auto_176187 ?auto_176185 ) ) ( not ( = ?auto_176187 ?auto_176184 ) ) ( not ( = ?auto_176180 ?auto_176187 ) ) ( not ( = ?auto_176181 ?auto_176187 ) ) ( not ( = ?auto_176182 ?auto_176187 ) ) ( not ( = ?auto_176183 ?auto_176187 ) ) ( ON ?auto_176180 ?auto_176186 ) ( not ( = ?auto_176180 ?auto_176186 ) ) ( not ( = ?auto_176181 ?auto_176186 ) ) ( not ( = ?auto_176182 ?auto_176186 ) ) ( not ( = ?auto_176183 ?auto_176186 ) ) ( not ( = ?auto_176184 ?auto_176186 ) ) ( not ( = ?auto_176185 ?auto_176186 ) ) ( not ( = ?auto_176188 ?auto_176186 ) ) ( not ( = ?auto_176187 ?auto_176186 ) ) ( ON ?auto_176181 ?auto_176180 ) ( ON-TABLE ?auto_176186 ) ( ON ?auto_176182 ?auto_176181 ) ( ON ?auto_176183 ?auto_176182 ) ( ON ?auto_176184 ?auto_176183 ) ( ON ?auto_176185 ?auto_176184 ) ( CLEAR ?auto_176187 ) ( ON ?auto_176188 ?auto_176185 ) ( CLEAR ?auto_176188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176186 ?auto_176180 ?auto_176181 ?auto_176182 ?auto_176183 ?auto_176184 ?auto_176185 )
      ( MAKE-6PILE ?auto_176180 ?auto_176181 ?auto_176182 ?auto_176183 ?auto_176184 ?auto_176185 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176189 - BLOCK
      ?auto_176190 - BLOCK
      ?auto_176191 - BLOCK
      ?auto_176192 - BLOCK
      ?auto_176193 - BLOCK
      ?auto_176194 - BLOCK
    )
    :vars
    (
      ?auto_176195 - BLOCK
      ?auto_176196 - BLOCK
      ?auto_176197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176189 ?auto_176190 ) ) ( not ( = ?auto_176189 ?auto_176191 ) ) ( not ( = ?auto_176189 ?auto_176192 ) ) ( not ( = ?auto_176189 ?auto_176193 ) ) ( not ( = ?auto_176189 ?auto_176194 ) ) ( not ( = ?auto_176190 ?auto_176191 ) ) ( not ( = ?auto_176190 ?auto_176192 ) ) ( not ( = ?auto_176190 ?auto_176193 ) ) ( not ( = ?auto_176190 ?auto_176194 ) ) ( not ( = ?auto_176191 ?auto_176192 ) ) ( not ( = ?auto_176191 ?auto_176193 ) ) ( not ( = ?auto_176191 ?auto_176194 ) ) ( not ( = ?auto_176192 ?auto_176193 ) ) ( not ( = ?auto_176192 ?auto_176194 ) ) ( not ( = ?auto_176193 ?auto_176194 ) ) ( not ( = ?auto_176189 ?auto_176195 ) ) ( not ( = ?auto_176190 ?auto_176195 ) ) ( not ( = ?auto_176191 ?auto_176195 ) ) ( not ( = ?auto_176192 ?auto_176195 ) ) ( not ( = ?auto_176193 ?auto_176195 ) ) ( not ( = ?auto_176194 ?auto_176195 ) ) ( not ( = ?auto_176196 ?auto_176195 ) ) ( not ( = ?auto_176196 ?auto_176194 ) ) ( not ( = ?auto_176196 ?auto_176193 ) ) ( not ( = ?auto_176189 ?auto_176196 ) ) ( not ( = ?auto_176190 ?auto_176196 ) ) ( not ( = ?auto_176191 ?auto_176196 ) ) ( not ( = ?auto_176192 ?auto_176196 ) ) ( ON ?auto_176189 ?auto_176197 ) ( not ( = ?auto_176189 ?auto_176197 ) ) ( not ( = ?auto_176190 ?auto_176197 ) ) ( not ( = ?auto_176191 ?auto_176197 ) ) ( not ( = ?auto_176192 ?auto_176197 ) ) ( not ( = ?auto_176193 ?auto_176197 ) ) ( not ( = ?auto_176194 ?auto_176197 ) ) ( not ( = ?auto_176195 ?auto_176197 ) ) ( not ( = ?auto_176196 ?auto_176197 ) ) ( ON ?auto_176190 ?auto_176189 ) ( ON-TABLE ?auto_176197 ) ( ON ?auto_176191 ?auto_176190 ) ( ON ?auto_176192 ?auto_176191 ) ( ON ?auto_176193 ?auto_176192 ) ( ON ?auto_176194 ?auto_176193 ) ( ON ?auto_176195 ?auto_176194 ) ( CLEAR ?auto_176195 ) ( HOLDING ?auto_176196 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176196 )
      ( MAKE-6PILE ?auto_176189 ?auto_176190 ?auto_176191 ?auto_176192 ?auto_176193 ?auto_176194 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176198 - BLOCK
      ?auto_176199 - BLOCK
      ?auto_176200 - BLOCK
      ?auto_176201 - BLOCK
      ?auto_176202 - BLOCK
      ?auto_176203 - BLOCK
    )
    :vars
    (
      ?auto_176204 - BLOCK
      ?auto_176206 - BLOCK
      ?auto_176205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176198 ?auto_176199 ) ) ( not ( = ?auto_176198 ?auto_176200 ) ) ( not ( = ?auto_176198 ?auto_176201 ) ) ( not ( = ?auto_176198 ?auto_176202 ) ) ( not ( = ?auto_176198 ?auto_176203 ) ) ( not ( = ?auto_176199 ?auto_176200 ) ) ( not ( = ?auto_176199 ?auto_176201 ) ) ( not ( = ?auto_176199 ?auto_176202 ) ) ( not ( = ?auto_176199 ?auto_176203 ) ) ( not ( = ?auto_176200 ?auto_176201 ) ) ( not ( = ?auto_176200 ?auto_176202 ) ) ( not ( = ?auto_176200 ?auto_176203 ) ) ( not ( = ?auto_176201 ?auto_176202 ) ) ( not ( = ?auto_176201 ?auto_176203 ) ) ( not ( = ?auto_176202 ?auto_176203 ) ) ( not ( = ?auto_176198 ?auto_176204 ) ) ( not ( = ?auto_176199 ?auto_176204 ) ) ( not ( = ?auto_176200 ?auto_176204 ) ) ( not ( = ?auto_176201 ?auto_176204 ) ) ( not ( = ?auto_176202 ?auto_176204 ) ) ( not ( = ?auto_176203 ?auto_176204 ) ) ( not ( = ?auto_176206 ?auto_176204 ) ) ( not ( = ?auto_176206 ?auto_176203 ) ) ( not ( = ?auto_176206 ?auto_176202 ) ) ( not ( = ?auto_176198 ?auto_176206 ) ) ( not ( = ?auto_176199 ?auto_176206 ) ) ( not ( = ?auto_176200 ?auto_176206 ) ) ( not ( = ?auto_176201 ?auto_176206 ) ) ( ON ?auto_176198 ?auto_176205 ) ( not ( = ?auto_176198 ?auto_176205 ) ) ( not ( = ?auto_176199 ?auto_176205 ) ) ( not ( = ?auto_176200 ?auto_176205 ) ) ( not ( = ?auto_176201 ?auto_176205 ) ) ( not ( = ?auto_176202 ?auto_176205 ) ) ( not ( = ?auto_176203 ?auto_176205 ) ) ( not ( = ?auto_176204 ?auto_176205 ) ) ( not ( = ?auto_176206 ?auto_176205 ) ) ( ON ?auto_176199 ?auto_176198 ) ( ON-TABLE ?auto_176205 ) ( ON ?auto_176200 ?auto_176199 ) ( ON ?auto_176201 ?auto_176200 ) ( ON ?auto_176202 ?auto_176201 ) ( ON ?auto_176203 ?auto_176202 ) ( ON ?auto_176204 ?auto_176203 ) ( ON ?auto_176206 ?auto_176204 ) ( CLEAR ?auto_176206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176205 ?auto_176198 ?auto_176199 ?auto_176200 ?auto_176201 ?auto_176202 ?auto_176203 ?auto_176204 )
      ( MAKE-6PILE ?auto_176198 ?auto_176199 ?auto_176200 ?auto_176201 ?auto_176202 ?auto_176203 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176218 - BLOCK
    )
    :vars
    (
      ?auto_176221 - BLOCK
      ?auto_176219 - BLOCK
      ?auto_176220 - BLOCK
      ?auto_176223 - BLOCK
      ?auto_176222 - BLOCK
      ?auto_176225 - BLOCK
      ?auto_176224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176221 ?auto_176218 ) ( ON-TABLE ?auto_176218 ) ( not ( = ?auto_176218 ?auto_176221 ) ) ( not ( = ?auto_176218 ?auto_176219 ) ) ( not ( = ?auto_176218 ?auto_176220 ) ) ( not ( = ?auto_176221 ?auto_176219 ) ) ( not ( = ?auto_176221 ?auto_176220 ) ) ( not ( = ?auto_176219 ?auto_176220 ) ) ( ON ?auto_176219 ?auto_176221 ) ( CLEAR ?auto_176219 ) ( HOLDING ?auto_176220 ) ( CLEAR ?auto_176223 ) ( ON-TABLE ?auto_176222 ) ( ON ?auto_176225 ?auto_176222 ) ( ON ?auto_176224 ?auto_176225 ) ( ON ?auto_176223 ?auto_176224 ) ( not ( = ?auto_176222 ?auto_176225 ) ) ( not ( = ?auto_176222 ?auto_176224 ) ) ( not ( = ?auto_176222 ?auto_176223 ) ) ( not ( = ?auto_176222 ?auto_176220 ) ) ( not ( = ?auto_176225 ?auto_176224 ) ) ( not ( = ?auto_176225 ?auto_176223 ) ) ( not ( = ?auto_176225 ?auto_176220 ) ) ( not ( = ?auto_176224 ?auto_176223 ) ) ( not ( = ?auto_176224 ?auto_176220 ) ) ( not ( = ?auto_176223 ?auto_176220 ) ) ( not ( = ?auto_176218 ?auto_176223 ) ) ( not ( = ?auto_176218 ?auto_176222 ) ) ( not ( = ?auto_176218 ?auto_176225 ) ) ( not ( = ?auto_176218 ?auto_176224 ) ) ( not ( = ?auto_176221 ?auto_176223 ) ) ( not ( = ?auto_176221 ?auto_176222 ) ) ( not ( = ?auto_176221 ?auto_176225 ) ) ( not ( = ?auto_176221 ?auto_176224 ) ) ( not ( = ?auto_176219 ?auto_176223 ) ) ( not ( = ?auto_176219 ?auto_176222 ) ) ( not ( = ?auto_176219 ?auto_176225 ) ) ( not ( = ?auto_176219 ?auto_176224 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176222 ?auto_176225 ?auto_176224 ?auto_176223 ?auto_176220 )
      ( MAKE-1PILE ?auto_176218 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176226 - BLOCK
    )
    :vars
    (
      ?auto_176229 - BLOCK
      ?auto_176228 - BLOCK
      ?auto_176231 - BLOCK
      ?auto_176233 - BLOCK
      ?auto_176232 - BLOCK
      ?auto_176230 - BLOCK
      ?auto_176227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176229 ?auto_176226 ) ( ON-TABLE ?auto_176226 ) ( not ( = ?auto_176226 ?auto_176229 ) ) ( not ( = ?auto_176226 ?auto_176228 ) ) ( not ( = ?auto_176226 ?auto_176231 ) ) ( not ( = ?auto_176229 ?auto_176228 ) ) ( not ( = ?auto_176229 ?auto_176231 ) ) ( not ( = ?auto_176228 ?auto_176231 ) ) ( ON ?auto_176228 ?auto_176229 ) ( CLEAR ?auto_176233 ) ( ON-TABLE ?auto_176232 ) ( ON ?auto_176230 ?auto_176232 ) ( ON ?auto_176227 ?auto_176230 ) ( ON ?auto_176233 ?auto_176227 ) ( not ( = ?auto_176232 ?auto_176230 ) ) ( not ( = ?auto_176232 ?auto_176227 ) ) ( not ( = ?auto_176232 ?auto_176233 ) ) ( not ( = ?auto_176232 ?auto_176231 ) ) ( not ( = ?auto_176230 ?auto_176227 ) ) ( not ( = ?auto_176230 ?auto_176233 ) ) ( not ( = ?auto_176230 ?auto_176231 ) ) ( not ( = ?auto_176227 ?auto_176233 ) ) ( not ( = ?auto_176227 ?auto_176231 ) ) ( not ( = ?auto_176233 ?auto_176231 ) ) ( not ( = ?auto_176226 ?auto_176233 ) ) ( not ( = ?auto_176226 ?auto_176232 ) ) ( not ( = ?auto_176226 ?auto_176230 ) ) ( not ( = ?auto_176226 ?auto_176227 ) ) ( not ( = ?auto_176229 ?auto_176233 ) ) ( not ( = ?auto_176229 ?auto_176232 ) ) ( not ( = ?auto_176229 ?auto_176230 ) ) ( not ( = ?auto_176229 ?auto_176227 ) ) ( not ( = ?auto_176228 ?auto_176233 ) ) ( not ( = ?auto_176228 ?auto_176232 ) ) ( not ( = ?auto_176228 ?auto_176230 ) ) ( not ( = ?auto_176228 ?auto_176227 ) ) ( ON ?auto_176231 ?auto_176228 ) ( CLEAR ?auto_176231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176226 ?auto_176229 ?auto_176228 )
      ( MAKE-1PILE ?auto_176226 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176234 - BLOCK
    )
    :vars
    (
      ?auto_176236 - BLOCK
      ?auto_176241 - BLOCK
      ?auto_176238 - BLOCK
      ?auto_176240 - BLOCK
      ?auto_176235 - BLOCK
      ?auto_176239 - BLOCK
      ?auto_176237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176236 ?auto_176234 ) ( ON-TABLE ?auto_176234 ) ( not ( = ?auto_176234 ?auto_176236 ) ) ( not ( = ?auto_176234 ?auto_176241 ) ) ( not ( = ?auto_176234 ?auto_176238 ) ) ( not ( = ?auto_176236 ?auto_176241 ) ) ( not ( = ?auto_176236 ?auto_176238 ) ) ( not ( = ?auto_176241 ?auto_176238 ) ) ( ON ?auto_176241 ?auto_176236 ) ( ON-TABLE ?auto_176240 ) ( ON ?auto_176235 ?auto_176240 ) ( ON ?auto_176239 ?auto_176235 ) ( not ( = ?auto_176240 ?auto_176235 ) ) ( not ( = ?auto_176240 ?auto_176239 ) ) ( not ( = ?auto_176240 ?auto_176237 ) ) ( not ( = ?auto_176240 ?auto_176238 ) ) ( not ( = ?auto_176235 ?auto_176239 ) ) ( not ( = ?auto_176235 ?auto_176237 ) ) ( not ( = ?auto_176235 ?auto_176238 ) ) ( not ( = ?auto_176239 ?auto_176237 ) ) ( not ( = ?auto_176239 ?auto_176238 ) ) ( not ( = ?auto_176237 ?auto_176238 ) ) ( not ( = ?auto_176234 ?auto_176237 ) ) ( not ( = ?auto_176234 ?auto_176240 ) ) ( not ( = ?auto_176234 ?auto_176235 ) ) ( not ( = ?auto_176234 ?auto_176239 ) ) ( not ( = ?auto_176236 ?auto_176237 ) ) ( not ( = ?auto_176236 ?auto_176240 ) ) ( not ( = ?auto_176236 ?auto_176235 ) ) ( not ( = ?auto_176236 ?auto_176239 ) ) ( not ( = ?auto_176241 ?auto_176237 ) ) ( not ( = ?auto_176241 ?auto_176240 ) ) ( not ( = ?auto_176241 ?auto_176235 ) ) ( not ( = ?auto_176241 ?auto_176239 ) ) ( ON ?auto_176238 ?auto_176241 ) ( CLEAR ?auto_176238 ) ( HOLDING ?auto_176237 ) ( CLEAR ?auto_176239 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176240 ?auto_176235 ?auto_176239 ?auto_176237 )
      ( MAKE-1PILE ?auto_176234 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176242 - BLOCK
    )
    :vars
    (
      ?auto_176244 - BLOCK
      ?auto_176246 - BLOCK
      ?auto_176247 - BLOCK
      ?auto_176248 - BLOCK
      ?auto_176245 - BLOCK
      ?auto_176249 - BLOCK
      ?auto_176243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176244 ?auto_176242 ) ( ON-TABLE ?auto_176242 ) ( not ( = ?auto_176242 ?auto_176244 ) ) ( not ( = ?auto_176242 ?auto_176246 ) ) ( not ( = ?auto_176242 ?auto_176247 ) ) ( not ( = ?auto_176244 ?auto_176246 ) ) ( not ( = ?auto_176244 ?auto_176247 ) ) ( not ( = ?auto_176246 ?auto_176247 ) ) ( ON ?auto_176246 ?auto_176244 ) ( ON-TABLE ?auto_176248 ) ( ON ?auto_176245 ?auto_176248 ) ( ON ?auto_176249 ?auto_176245 ) ( not ( = ?auto_176248 ?auto_176245 ) ) ( not ( = ?auto_176248 ?auto_176249 ) ) ( not ( = ?auto_176248 ?auto_176243 ) ) ( not ( = ?auto_176248 ?auto_176247 ) ) ( not ( = ?auto_176245 ?auto_176249 ) ) ( not ( = ?auto_176245 ?auto_176243 ) ) ( not ( = ?auto_176245 ?auto_176247 ) ) ( not ( = ?auto_176249 ?auto_176243 ) ) ( not ( = ?auto_176249 ?auto_176247 ) ) ( not ( = ?auto_176243 ?auto_176247 ) ) ( not ( = ?auto_176242 ?auto_176243 ) ) ( not ( = ?auto_176242 ?auto_176248 ) ) ( not ( = ?auto_176242 ?auto_176245 ) ) ( not ( = ?auto_176242 ?auto_176249 ) ) ( not ( = ?auto_176244 ?auto_176243 ) ) ( not ( = ?auto_176244 ?auto_176248 ) ) ( not ( = ?auto_176244 ?auto_176245 ) ) ( not ( = ?auto_176244 ?auto_176249 ) ) ( not ( = ?auto_176246 ?auto_176243 ) ) ( not ( = ?auto_176246 ?auto_176248 ) ) ( not ( = ?auto_176246 ?auto_176245 ) ) ( not ( = ?auto_176246 ?auto_176249 ) ) ( ON ?auto_176247 ?auto_176246 ) ( CLEAR ?auto_176249 ) ( ON ?auto_176243 ?auto_176247 ) ( CLEAR ?auto_176243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176242 ?auto_176244 ?auto_176246 ?auto_176247 )
      ( MAKE-1PILE ?auto_176242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176250 - BLOCK
    )
    :vars
    (
      ?auto_176253 - BLOCK
      ?auto_176252 - BLOCK
      ?auto_176257 - BLOCK
      ?auto_176256 - BLOCK
      ?auto_176255 - BLOCK
      ?auto_176251 - BLOCK
      ?auto_176254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176253 ?auto_176250 ) ( ON-TABLE ?auto_176250 ) ( not ( = ?auto_176250 ?auto_176253 ) ) ( not ( = ?auto_176250 ?auto_176252 ) ) ( not ( = ?auto_176250 ?auto_176257 ) ) ( not ( = ?auto_176253 ?auto_176252 ) ) ( not ( = ?auto_176253 ?auto_176257 ) ) ( not ( = ?auto_176252 ?auto_176257 ) ) ( ON ?auto_176252 ?auto_176253 ) ( ON-TABLE ?auto_176256 ) ( ON ?auto_176255 ?auto_176256 ) ( not ( = ?auto_176256 ?auto_176255 ) ) ( not ( = ?auto_176256 ?auto_176251 ) ) ( not ( = ?auto_176256 ?auto_176254 ) ) ( not ( = ?auto_176256 ?auto_176257 ) ) ( not ( = ?auto_176255 ?auto_176251 ) ) ( not ( = ?auto_176255 ?auto_176254 ) ) ( not ( = ?auto_176255 ?auto_176257 ) ) ( not ( = ?auto_176251 ?auto_176254 ) ) ( not ( = ?auto_176251 ?auto_176257 ) ) ( not ( = ?auto_176254 ?auto_176257 ) ) ( not ( = ?auto_176250 ?auto_176254 ) ) ( not ( = ?auto_176250 ?auto_176256 ) ) ( not ( = ?auto_176250 ?auto_176255 ) ) ( not ( = ?auto_176250 ?auto_176251 ) ) ( not ( = ?auto_176253 ?auto_176254 ) ) ( not ( = ?auto_176253 ?auto_176256 ) ) ( not ( = ?auto_176253 ?auto_176255 ) ) ( not ( = ?auto_176253 ?auto_176251 ) ) ( not ( = ?auto_176252 ?auto_176254 ) ) ( not ( = ?auto_176252 ?auto_176256 ) ) ( not ( = ?auto_176252 ?auto_176255 ) ) ( not ( = ?auto_176252 ?auto_176251 ) ) ( ON ?auto_176257 ?auto_176252 ) ( ON ?auto_176254 ?auto_176257 ) ( CLEAR ?auto_176254 ) ( HOLDING ?auto_176251 ) ( CLEAR ?auto_176255 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176256 ?auto_176255 ?auto_176251 )
      ( MAKE-1PILE ?auto_176250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176258 - BLOCK
    )
    :vars
    (
      ?auto_176261 - BLOCK
      ?auto_176259 - BLOCK
      ?auto_176260 - BLOCK
      ?auto_176265 - BLOCK
      ?auto_176262 - BLOCK
      ?auto_176263 - BLOCK
      ?auto_176264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176261 ?auto_176258 ) ( ON-TABLE ?auto_176258 ) ( not ( = ?auto_176258 ?auto_176261 ) ) ( not ( = ?auto_176258 ?auto_176259 ) ) ( not ( = ?auto_176258 ?auto_176260 ) ) ( not ( = ?auto_176261 ?auto_176259 ) ) ( not ( = ?auto_176261 ?auto_176260 ) ) ( not ( = ?auto_176259 ?auto_176260 ) ) ( ON ?auto_176259 ?auto_176261 ) ( ON-TABLE ?auto_176265 ) ( ON ?auto_176262 ?auto_176265 ) ( not ( = ?auto_176265 ?auto_176262 ) ) ( not ( = ?auto_176265 ?auto_176263 ) ) ( not ( = ?auto_176265 ?auto_176264 ) ) ( not ( = ?auto_176265 ?auto_176260 ) ) ( not ( = ?auto_176262 ?auto_176263 ) ) ( not ( = ?auto_176262 ?auto_176264 ) ) ( not ( = ?auto_176262 ?auto_176260 ) ) ( not ( = ?auto_176263 ?auto_176264 ) ) ( not ( = ?auto_176263 ?auto_176260 ) ) ( not ( = ?auto_176264 ?auto_176260 ) ) ( not ( = ?auto_176258 ?auto_176264 ) ) ( not ( = ?auto_176258 ?auto_176265 ) ) ( not ( = ?auto_176258 ?auto_176262 ) ) ( not ( = ?auto_176258 ?auto_176263 ) ) ( not ( = ?auto_176261 ?auto_176264 ) ) ( not ( = ?auto_176261 ?auto_176265 ) ) ( not ( = ?auto_176261 ?auto_176262 ) ) ( not ( = ?auto_176261 ?auto_176263 ) ) ( not ( = ?auto_176259 ?auto_176264 ) ) ( not ( = ?auto_176259 ?auto_176265 ) ) ( not ( = ?auto_176259 ?auto_176262 ) ) ( not ( = ?auto_176259 ?auto_176263 ) ) ( ON ?auto_176260 ?auto_176259 ) ( ON ?auto_176264 ?auto_176260 ) ( CLEAR ?auto_176262 ) ( ON ?auto_176263 ?auto_176264 ) ( CLEAR ?auto_176263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176258 ?auto_176261 ?auto_176259 ?auto_176260 ?auto_176264 )
      ( MAKE-1PILE ?auto_176258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176266 - BLOCK
    )
    :vars
    (
      ?auto_176267 - BLOCK
      ?auto_176272 - BLOCK
      ?auto_176273 - BLOCK
      ?auto_176270 - BLOCK
      ?auto_176268 - BLOCK
      ?auto_176269 - BLOCK
      ?auto_176271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176267 ?auto_176266 ) ( ON-TABLE ?auto_176266 ) ( not ( = ?auto_176266 ?auto_176267 ) ) ( not ( = ?auto_176266 ?auto_176272 ) ) ( not ( = ?auto_176266 ?auto_176273 ) ) ( not ( = ?auto_176267 ?auto_176272 ) ) ( not ( = ?auto_176267 ?auto_176273 ) ) ( not ( = ?auto_176272 ?auto_176273 ) ) ( ON ?auto_176272 ?auto_176267 ) ( ON-TABLE ?auto_176270 ) ( not ( = ?auto_176270 ?auto_176268 ) ) ( not ( = ?auto_176270 ?auto_176269 ) ) ( not ( = ?auto_176270 ?auto_176271 ) ) ( not ( = ?auto_176270 ?auto_176273 ) ) ( not ( = ?auto_176268 ?auto_176269 ) ) ( not ( = ?auto_176268 ?auto_176271 ) ) ( not ( = ?auto_176268 ?auto_176273 ) ) ( not ( = ?auto_176269 ?auto_176271 ) ) ( not ( = ?auto_176269 ?auto_176273 ) ) ( not ( = ?auto_176271 ?auto_176273 ) ) ( not ( = ?auto_176266 ?auto_176271 ) ) ( not ( = ?auto_176266 ?auto_176270 ) ) ( not ( = ?auto_176266 ?auto_176268 ) ) ( not ( = ?auto_176266 ?auto_176269 ) ) ( not ( = ?auto_176267 ?auto_176271 ) ) ( not ( = ?auto_176267 ?auto_176270 ) ) ( not ( = ?auto_176267 ?auto_176268 ) ) ( not ( = ?auto_176267 ?auto_176269 ) ) ( not ( = ?auto_176272 ?auto_176271 ) ) ( not ( = ?auto_176272 ?auto_176270 ) ) ( not ( = ?auto_176272 ?auto_176268 ) ) ( not ( = ?auto_176272 ?auto_176269 ) ) ( ON ?auto_176273 ?auto_176272 ) ( ON ?auto_176271 ?auto_176273 ) ( ON ?auto_176269 ?auto_176271 ) ( CLEAR ?auto_176269 ) ( HOLDING ?auto_176268 ) ( CLEAR ?auto_176270 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176270 ?auto_176268 )
      ( MAKE-1PILE ?auto_176266 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176274 - BLOCK
    )
    :vars
    (
      ?auto_176281 - BLOCK
      ?auto_176277 - BLOCK
      ?auto_176276 - BLOCK
      ?auto_176279 - BLOCK
      ?auto_176278 - BLOCK
      ?auto_176275 - BLOCK
      ?auto_176280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176281 ?auto_176274 ) ( ON-TABLE ?auto_176274 ) ( not ( = ?auto_176274 ?auto_176281 ) ) ( not ( = ?auto_176274 ?auto_176277 ) ) ( not ( = ?auto_176274 ?auto_176276 ) ) ( not ( = ?auto_176281 ?auto_176277 ) ) ( not ( = ?auto_176281 ?auto_176276 ) ) ( not ( = ?auto_176277 ?auto_176276 ) ) ( ON ?auto_176277 ?auto_176281 ) ( ON-TABLE ?auto_176279 ) ( not ( = ?auto_176279 ?auto_176278 ) ) ( not ( = ?auto_176279 ?auto_176275 ) ) ( not ( = ?auto_176279 ?auto_176280 ) ) ( not ( = ?auto_176279 ?auto_176276 ) ) ( not ( = ?auto_176278 ?auto_176275 ) ) ( not ( = ?auto_176278 ?auto_176280 ) ) ( not ( = ?auto_176278 ?auto_176276 ) ) ( not ( = ?auto_176275 ?auto_176280 ) ) ( not ( = ?auto_176275 ?auto_176276 ) ) ( not ( = ?auto_176280 ?auto_176276 ) ) ( not ( = ?auto_176274 ?auto_176280 ) ) ( not ( = ?auto_176274 ?auto_176279 ) ) ( not ( = ?auto_176274 ?auto_176278 ) ) ( not ( = ?auto_176274 ?auto_176275 ) ) ( not ( = ?auto_176281 ?auto_176280 ) ) ( not ( = ?auto_176281 ?auto_176279 ) ) ( not ( = ?auto_176281 ?auto_176278 ) ) ( not ( = ?auto_176281 ?auto_176275 ) ) ( not ( = ?auto_176277 ?auto_176280 ) ) ( not ( = ?auto_176277 ?auto_176279 ) ) ( not ( = ?auto_176277 ?auto_176278 ) ) ( not ( = ?auto_176277 ?auto_176275 ) ) ( ON ?auto_176276 ?auto_176277 ) ( ON ?auto_176280 ?auto_176276 ) ( ON ?auto_176275 ?auto_176280 ) ( CLEAR ?auto_176279 ) ( ON ?auto_176278 ?auto_176275 ) ( CLEAR ?auto_176278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176274 ?auto_176281 ?auto_176277 ?auto_176276 ?auto_176280 ?auto_176275 )
      ( MAKE-1PILE ?auto_176274 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176282 - BLOCK
    )
    :vars
    (
      ?auto_176289 - BLOCK
      ?auto_176288 - BLOCK
      ?auto_176284 - BLOCK
      ?auto_176287 - BLOCK
      ?auto_176283 - BLOCK
      ?auto_176286 - BLOCK
      ?auto_176285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176289 ?auto_176282 ) ( ON-TABLE ?auto_176282 ) ( not ( = ?auto_176282 ?auto_176289 ) ) ( not ( = ?auto_176282 ?auto_176288 ) ) ( not ( = ?auto_176282 ?auto_176284 ) ) ( not ( = ?auto_176289 ?auto_176288 ) ) ( not ( = ?auto_176289 ?auto_176284 ) ) ( not ( = ?auto_176288 ?auto_176284 ) ) ( ON ?auto_176288 ?auto_176289 ) ( not ( = ?auto_176287 ?auto_176283 ) ) ( not ( = ?auto_176287 ?auto_176286 ) ) ( not ( = ?auto_176287 ?auto_176285 ) ) ( not ( = ?auto_176287 ?auto_176284 ) ) ( not ( = ?auto_176283 ?auto_176286 ) ) ( not ( = ?auto_176283 ?auto_176285 ) ) ( not ( = ?auto_176283 ?auto_176284 ) ) ( not ( = ?auto_176286 ?auto_176285 ) ) ( not ( = ?auto_176286 ?auto_176284 ) ) ( not ( = ?auto_176285 ?auto_176284 ) ) ( not ( = ?auto_176282 ?auto_176285 ) ) ( not ( = ?auto_176282 ?auto_176287 ) ) ( not ( = ?auto_176282 ?auto_176283 ) ) ( not ( = ?auto_176282 ?auto_176286 ) ) ( not ( = ?auto_176289 ?auto_176285 ) ) ( not ( = ?auto_176289 ?auto_176287 ) ) ( not ( = ?auto_176289 ?auto_176283 ) ) ( not ( = ?auto_176289 ?auto_176286 ) ) ( not ( = ?auto_176288 ?auto_176285 ) ) ( not ( = ?auto_176288 ?auto_176287 ) ) ( not ( = ?auto_176288 ?auto_176283 ) ) ( not ( = ?auto_176288 ?auto_176286 ) ) ( ON ?auto_176284 ?auto_176288 ) ( ON ?auto_176285 ?auto_176284 ) ( ON ?auto_176286 ?auto_176285 ) ( ON ?auto_176283 ?auto_176286 ) ( CLEAR ?auto_176283 ) ( HOLDING ?auto_176287 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176287 )
      ( MAKE-1PILE ?auto_176282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176299 - BLOCK
    )
    :vars
    (
      ?auto_176302 - BLOCK
      ?auto_176306 - BLOCK
      ?auto_176300 - BLOCK
      ?auto_176301 - BLOCK
      ?auto_176303 - BLOCK
      ?auto_176304 - BLOCK
      ?auto_176305 - BLOCK
      ?auto_176307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176302 ?auto_176299 ) ( ON-TABLE ?auto_176299 ) ( not ( = ?auto_176299 ?auto_176302 ) ) ( not ( = ?auto_176299 ?auto_176306 ) ) ( not ( = ?auto_176299 ?auto_176300 ) ) ( not ( = ?auto_176302 ?auto_176306 ) ) ( not ( = ?auto_176302 ?auto_176300 ) ) ( not ( = ?auto_176306 ?auto_176300 ) ) ( ON ?auto_176306 ?auto_176302 ) ( not ( = ?auto_176301 ?auto_176303 ) ) ( not ( = ?auto_176301 ?auto_176304 ) ) ( not ( = ?auto_176301 ?auto_176305 ) ) ( not ( = ?auto_176301 ?auto_176300 ) ) ( not ( = ?auto_176303 ?auto_176304 ) ) ( not ( = ?auto_176303 ?auto_176305 ) ) ( not ( = ?auto_176303 ?auto_176300 ) ) ( not ( = ?auto_176304 ?auto_176305 ) ) ( not ( = ?auto_176304 ?auto_176300 ) ) ( not ( = ?auto_176305 ?auto_176300 ) ) ( not ( = ?auto_176299 ?auto_176305 ) ) ( not ( = ?auto_176299 ?auto_176301 ) ) ( not ( = ?auto_176299 ?auto_176303 ) ) ( not ( = ?auto_176299 ?auto_176304 ) ) ( not ( = ?auto_176302 ?auto_176305 ) ) ( not ( = ?auto_176302 ?auto_176301 ) ) ( not ( = ?auto_176302 ?auto_176303 ) ) ( not ( = ?auto_176302 ?auto_176304 ) ) ( not ( = ?auto_176306 ?auto_176305 ) ) ( not ( = ?auto_176306 ?auto_176301 ) ) ( not ( = ?auto_176306 ?auto_176303 ) ) ( not ( = ?auto_176306 ?auto_176304 ) ) ( ON ?auto_176300 ?auto_176306 ) ( ON ?auto_176305 ?auto_176300 ) ( ON ?auto_176304 ?auto_176305 ) ( ON ?auto_176303 ?auto_176304 ) ( CLEAR ?auto_176303 ) ( ON ?auto_176301 ?auto_176307 ) ( CLEAR ?auto_176301 ) ( HAND-EMPTY ) ( not ( = ?auto_176299 ?auto_176307 ) ) ( not ( = ?auto_176302 ?auto_176307 ) ) ( not ( = ?auto_176306 ?auto_176307 ) ) ( not ( = ?auto_176300 ?auto_176307 ) ) ( not ( = ?auto_176301 ?auto_176307 ) ) ( not ( = ?auto_176303 ?auto_176307 ) ) ( not ( = ?auto_176304 ?auto_176307 ) ) ( not ( = ?auto_176305 ?auto_176307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176301 ?auto_176307 )
      ( MAKE-1PILE ?auto_176299 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176308 - BLOCK
    )
    :vars
    (
      ?auto_176309 - BLOCK
      ?auto_176312 - BLOCK
      ?auto_176310 - BLOCK
      ?auto_176316 - BLOCK
      ?auto_176314 - BLOCK
      ?auto_176315 - BLOCK
      ?auto_176311 - BLOCK
      ?auto_176313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176309 ?auto_176308 ) ( ON-TABLE ?auto_176308 ) ( not ( = ?auto_176308 ?auto_176309 ) ) ( not ( = ?auto_176308 ?auto_176312 ) ) ( not ( = ?auto_176308 ?auto_176310 ) ) ( not ( = ?auto_176309 ?auto_176312 ) ) ( not ( = ?auto_176309 ?auto_176310 ) ) ( not ( = ?auto_176312 ?auto_176310 ) ) ( ON ?auto_176312 ?auto_176309 ) ( not ( = ?auto_176316 ?auto_176314 ) ) ( not ( = ?auto_176316 ?auto_176315 ) ) ( not ( = ?auto_176316 ?auto_176311 ) ) ( not ( = ?auto_176316 ?auto_176310 ) ) ( not ( = ?auto_176314 ?auto_176315 ) ) ( not ( = ?auto_176314 ?auto_176311 ) ) ( not ( = ?auto_176314 ?auto_176310 ) ) ( not ( = ?auto_176315 ?auto_176311 ) ) ( not ( = ?auto_176315 ?auto_176310 ) ) ( not ( = ?auto_176311 ?auto_176310 ) ) ( not ( = ?auto_176308 ?auto_176311 ) ) ( not ( = ?auto_176308 ?auto_176316 ) ) ( not ( = ?auto_176308 ?auto_176314 ) ) ( not ( = ?auto_176308 ?auto_176315 ) ) ( not ( = ?auto_176309 ?auto_176311 ) ) ( not ( = ?auto_176309 ?auto_176316 ) ) ( not ( = ?auto_176309 ?auto_176314 ) ) ( not ( = ?auto_176309 ?auto_176315 ) ) ( not ( = ?auto_176312 ?auto_176311 ) ) ( not ( = ?auto_176312 ?auto_176316 ) ) ( not ( = ?auto_176312 ?auto_176314 ) ) ( not ( = ?auto_176312 ?auto_176315 ) ) ( ON ?auto_176310 ?auto_176312 ) ( ON ?auto_176311 ?auto_176310 ) ( ON ?auto_176315 ?auto_176311 ) ( ON ?auto_176316 ?auto_176313 ) ( CLEAR ?auto_176316 ) ( not ( = ?auto_176308 ?auto_176313 ) ) ( not ( = ?auto_176309 ?auto_176313 ) ) ( not ( = ?auto_176312 ?auto_176313 ) ) ( not ( = ?auto_176310 ?auto_176313 ) ) ( not ( = ?auto_176316 ?auto_176313 ) ) ( not ( = ?auto_176314 ?auto_176313 ) ) ( not ( = ?auto_176315 ?auto_176313 ) ) ( not ( = ?auto_176311 ?auto_176313 ) ) ( HOLDING ?auto_176314 ) ( CLEAR ?auto_176315 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176308 ?auto_176309 ?auto_176312 ?auto_176310 ?auto_176311 ?auto_176315 ?auto_176314 )
      ( MAKE-1PILE ?auto_176308 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176317 - BLOCK
    )
    :vars
    (
      ?auto_176318 - BLOCK
      ?auto_176324 - BLOCK
      ?auto_176322 - BLOCK
      ?auto_176319 - BLOCK
      ?auto_176323 - BLOCK
      ?auto_176321 - BLOCK
      ?auto_176325 - BLOCK
      ?auto_176320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176318 ?auto_176317 ) ( ON-TABLE ?auto_176317 ) ( not ( = ?auto_176317 ?auto_176318 ) ) ( not ( = ?auto_176317 ?auto_176324 ) ) ( not ( = ?auto_176317 ?auto_176322 ) ) ( not ( = ?auto_176318 ?auto_176324 ) ) ( not ( = ?auto_176318 ?auto_176322 ) ) ( not ( = ?auto_176324 ?auto_176322 ) ) ( ON ?auto_176324 ?auto_176318 ) ( not ( = ?auto_176319 ?auto_176323 ) ) ( not ( = ?auto_176319 ?auto_176321 ) ) ( not ( = ?auto_176319 ?auto_176325 ) ) ( not ( = ?auto_176319 ?auto_176322 ) ) ( not ( = ?auto_176323 ?auto_176321 ) ) ( not ( = ?auto_176323 ?auto_176325 ) ) ( not ( = ?auto_176323 ?auto_176322 ) ) ( not ( = ?auto_176321 ?auto_176325 ) ) ( not ( = ?auto_176321 ?auto_176322 ) ) ( not ( = ?auto_176325 ?auto_176322 ) ) ( not ( = ?auto_176317 ?auto_176325 ) ) ( not ( = ?auto_176317 ?auto_176319 ) ) ( not ( = ?auto_176317 ?auto_176323 ) ) ( not ( = ?auto_176317 ?auto_176321 ) ) ( not ( = ?auto_176318 ?auto_176325 ) ) ( not ( = ?auto_176318 ?auto_176319 ) ) ( not ( = ?auto_176318 ?auto_176323 ) ) ( not ( = ?auto_176318 ?auto_176321 ) ) ( not ( = ?auto_176324 ?auto_176325 ) ) ( not ( = ?auto_176324 ?auto_176319 ) ) ( not ( = ?auto_176324 ?auto_176323 ) ) ( not ( = ?auto_176324 ?auto_176321 ) ) ( ON ?auto_176322 ?auto_176324 ) ( ON ?auto_176325 ?auto_176322 ) ( ON ?auto_176321 ?auto_176325 ) ( ON ?auto_176319 ?auto_176320 ) ( not ( = ?auto_176317 ?auto_176320 ) ) ( not ( = ?auto_176318 ?auto_176320 ) ) ( not ( = ?auto_176324 ?auto_176320 ) ) ( not ( = ?auto_176322 ?auto_176320 ) ) ( not ( = ?auto_176319 ?auto_176320 ) ) ( not ( = ?auto_176323 ?auto_176320 ) ) ( not ( = ?auto_176321 ?auto_176320 ) ) ( not ( = ?auto_176325 ?auto_176320 ) ) ( CLEAR ?auto_176321 ) ( ON ?auto_176323 ?auto_176319 ) ( CLEAR ?auto_176323 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176320 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176320 ?auto_176319 )
      ( MAKE-1PILE ?auto_176317 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176326 - BLOCK
    )
    :vars
    (
      ?auto_176332 - BLOCK
      ?auto_176327 - BLOCK
      ?auto_176333 - BLOCK
      ?auto_176328 - BLOCK
      ?auto_176329 - BLOCK
      ?auto_176331 - BLOCK
      ?auto_176334 - BLOCK
      ?auto_176330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176332 ?auto_176326 ) ( ON-TABLE ?auto_176326 ) ( not ( = ?auto_176326 ?auto_176332 ) ) ( not ( = ?auto_176326 ?auto_176327 ) ) ( not ( = ?auto_176326 ?auto_176333 ) ) ( not ( = ?auto_176332 ?auto_176327 ) ) ( not ( = ?auto_176332 ?auto_176333 ) ) ( not ( = ?auto_176327 ?auto_176333 ) ) ( ON ?auto_176327 ?auto_176332 ) ( not ( = ?auto_176328 ?auto_176329 ) ) ( not ( = ?auto_176328 ?auto_176331 ) ) ( not ( = ?auto_176328 ?auto_176334 ) ) ( not ( = ?auto_176328 ?auto_176333 ) ) ( not ( = ?auto_176329 ?auto_176331 ) ) ( not ( = ?auto_176329 ?auto_176334 ) ) ( not ( = ?auto_176329 ?auto_176333 ) ) ( not ( = ?auto_176331 ?auto_176334 ) ) ( not ( = ?auto_176331 ?auto_176333 ) ) ( not ( = ?auto_176334 ?auto_176333 ) ) ( not ( = ?auto_176326 ?auto_176334 ) ) ( not ( = ?auto_176326 ?auto_176328 ) ) ( not ( = ?auto_176326 ?auto_176329 ) ) ( not ( = ?auto_176326 ?auto_176331 ) ) ( not ( = ?auto_176332 ?auto_176334 ) ) ( not ( = ?auto_176332 ?auto_176328 ) ) ( not ( = ?auto_176332 ?auto_176329 ) ) ( not ( = ?auto_176332 ?auto_176331 ) ) ( not ( = ?auto_176327 ?auto_176334 ) ) ( not ( = ?auto_176327 ?auto_176328 ) ) ( not ( = ?auto_176327 ?auto_176329 ) ) ( not ( = ?auto_176327 ?auto_176331 ) ) ( ON ?auto_176333 ?auto_176327 ) ( ON ?auto_176334 ?auto_176333 ) ( ON ?auto_176328 ?auto_176330 ) ( not ( = ?auto_176326 ?auto_176330 ) ) ( not ( = ?auto_176332 ?auto_176330 ) ) ( not ( = ?auto_176327 ?auto_176330 ) ) ( not ( = ?auto_176333 ?auto_176330 ) ) ( not ( = ?auto_176328 ?auto_176330 ) ) ( not ( = ?auto_176329 ?auto_176330 ) ) ( not ( = ?auto_176331 ?auto_176330 ) ) ( not ( = ?auto_176334 ?auto_176330 ) ) ( ON ?auto_176329 ?auto_176328 ) ( CLEAR ?auto_176329 ) ( ON-TABLE ?auto_176330 ) ( HOLDING ?auto_176331 ) ( CLEAR ?auto_176334 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176326 ?auto_176332 ?auto_176327 ?auto_176333 ?auto_176334 ?auto_176331 )
      ( MAKE-1PILE ?auto_176326 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176335 - BLOCK
    )
    :vars
    (
      ?auto_176342 - BLOCK
      ?auto_176340 - BLOCK
      ?auto_176338 - BLOCK
      ?auto_176336 - BLOCK
      ?auto_176337 - BLOCK
      ?auto_176341 - BLOCK
      ?auto_176339 - BLOCK
      ?auto_176343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176342 ?auto_176335 ) ( ON-TABLE ?auto_176335 ) ( not ( = ?auto_176335 ?auto_176342 ) ) ( not ( = ?auto_176335 ?auto_176340 ) ) ( not ( = ?auto_176335 ?auto_176338 ) ) ( not ( = ?auto_176342 ?auto_176340 ) ) ( not ( = ?auto_176342 ?auto_176338 ) ) ( not ( = ?auto_176340 ?auto_176338 ) ) ( ON ?auto_176340 ?auto_176342 ) ( not ( = ?auto_176336 ?auto_176337 ) ) ( not ( = ?auto_176336 ?auto_176341 ) ) ( not ( = ?auto_176336 ?auto_176339 ) ) ( not ( = ?auto_176336 ?auto_176338 ) ) ( not ( = ?auto_176337 ?auto_176341 ) ) ( not ( = ?auto_176337 ?auto_176339 ) ) ( not ( = ?auto_176337 ?auto_176338 ) ) ( not ( = ?auto_176341 ?auto_176339 ) ) ( not ( = ?auto_176341 ?auto_176338 ) ) ( not ( = ?auto_176339 ?auto_176338 ) ) ( not ( = ?auto_176335 ?auto_176339 ) ) ( not ( = ?auto_176335 ?auto_176336 ) ) ( not ( = ?auto_176335 ?auto_176337 ) ) ( not ( = ?auto_176335 ?auto_176341 ) ) ( not ( = ?auto_176342 ?auto_176339 ) ) ( not ( = ?auto_176342 ?auto_176336 ) ) ( not ( = ?auto_176342 ?auto_176337 ) ) ( not ( = ?auto_176342 ?auto_176341 ) ) ( not ( = ?auto_176340 ?auto_176339 ) ) ( not ( = ?auto_176340 ?auto_176336 ) ) ( not ( = ?auto_176340 ?auto_176337 ) ) ( not ( = ?auto_176340 ?auto_176341 ) ) ( ON ?auto_176338 ?auto_176340 ) ( ON ?auto_176339 ?auto_176338 ) ( ON ?auto_176336 ?auto_176343 ) ( not ( = ?auto_176335 ?auto_176343 ) ) ( not ( = ?auto_176342 ?auto_176343 ) ) ( not ( = ?auto_176340 ?auto_176343 ) ) ( not ( = ?auto_176338 ?auto_176343 ) ) ( not ( = ?auto_176336 ?auto_176343 ) ) ( not ( = ?auto_176337 ?auto_176343 ) ) ( not ( = ?auto_176341 ?auto_176343 ) ) ( not ( = ?auto_176339 ?auto_176343 ) ) ( ON ?auto_176337 ?auto_176336 ) ( ON-TABLE ?auto_176343 ) ( CLEAR ?auto_176339 ) ( ON ?auto_176341 ?auto_176337 ) ( CLEAR ?auto_176341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176343 ?auto_176336 ?auto_176337 )
      ( MAKE-1PILE ?auto_176335 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176387 - BLOCK
      ?auto_176388 - BLOCK
      ?auto_176389 - BLOCK
      ?auto_176390 - BLOCK
      ?auto_176391 - BLOCK
      ?auto_176392 - BLOCK
      ?auto_176393 - BLOCK
    )
    :vars
    (
      ?auto_176394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176387 ) ( ON ?auto_176388 ?auto_176387 ) ( ON ?auto_176389 ?auto_176388 ) ( ON ?auto_176390 ?auto_176389 ) ( ON ?auto_176391 ?auto_176390 ) ( not ( = ?auto_176387 ?auto_176388 ) ) ( not ( = ?auto_176387 ?auto_176389 ) ) ( not ( = ?auto_176387 ?auto_176390 ) ) ( not ( = ?auto_176387 ?auto_176391 ) ) ( not ( = ?auto_176387 ?auto_176392 ) ) ( not ( = ?auto_176387 ?auto_176393 ) ) ( not ( = ?auto_176388 ?auto_176389 ) ) ( not ( = ?auto_176388 ?auto_176390 ) ) ( not ( = ?auto_176388 ?auto_176391 ) ) ( not ( = ?auto_176388 ?auto_176392 ) ) ( not ( = ?auto_176388 ?auto_176393 ) ) ( not ( = ?auto_176389 ?auto_176390 ) ) ( not ( = ?auto_176389 ?auto_176391 ) ) ( not ( = ?auto_176389 ?auto_176392 ) ) ( not ( = ?auto_176389 ?auto_176393 ) ) ( not ( = ?auto_176390 ?auto_176391 ) ) ( not ( = ?auto_176390 ?auto_176392 ) ) ( not ( = ?auto_176390 ?auto_176393 ) ) ( not ( = ?auto_176391 ?auto_176392 ) ) ( not ( = ?auto_176391 ?auto_176393 ) ) ( not ( = ?auto_176392 ?auto_176393 ) ) ( ON ?auto_176393 ?auto_176394 ) ( not ( = ?auto_176387 ?auto_176394 ) ) ( not ( = ?auto_176388 ?auto_176394 ) ) ( not ( = ?auto_176389 ?auto_176394 ) ) ( not ( = ?auto_176390 ?auto_176394 ) ) ( not ( = ?auto_176391 ?auto_176394 ) ) ( not ( = ?auto_176392 ?auto_176394 ) ) ( not ( = ?auto_176393 ?auto_176394 ) ) ( CLEAR ?auto_176391 ) ( ON ?auto_176392 ?auto_176393 ) ( CLEAR ?auto_176392 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176394 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176394 ?auto_176393 )
      ( MAKE-7PILE ?auto_176387 ?auto_176388 ?auto_176389 ?auto_176390 ?auto_176391 ?auto_176392 ?auto_176393 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176395 - BLOCK
      ?auto_176396 - BLOCK
      ?auto_176397 - BLOCK
      ?auto_176398 - BLOCK
      ?auto_176399 - BLOCK
      ?auto_176400 - BLOCK
      ?auto_176401 - BLOCK
    )
    :vars
    (
      ?auto_176402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176395 ) ( ON ?auto_176396 ?auto_176395 ) ( ON ?auto_176397 ?auto_176396 ) ( ON ?auto_176398 ?auto_176397 ) ( not ( = ?auto_176395 ?auto_176396 ) ) ( not ( = ?auto_176395 ?auto_176397 ) ) ( not ( = ?auto_176395 ?auto_176398 ) ) ( not ( = ?auto_176395 ?auto_176399 ) ) ( not ( = ?auto_176395 ?auto_176400 ) ) ( not ( = ?auto_176395 ?auto_176401 ) ) ( not ( = ?auto_176396 ?auto_176397 ) ) ( not ( = ?auto_176396 ?auto_176398 ) ) ( not ( = ?auto_176396 ?auto_176399 ) ) ( not ( = ?auto_176396 ?auto_176400 ) ) ( not ( = ?auto_176396 ?auto_176401 ) ) ( not ( = ?auto_176397 ?auto_176398 ) ) ( not ( = ?auto_176397 ?auto_176399 ) ) ( not ( = ?auto_176397 ?auto_176400 ) ) ( not ( = ?auto_176397 ?auto_176401 ) ) ( not ( = ?auto_176398 ?auto_176399 ) ) ( not ( = ?auto_176398 ?auto_176400 ) ) ( not ( = ?auto_176398 ?auto_176401 ) ) ( not ( = ?auto_176399 ?auto_176400 ) ) ( not ( = ?auto_176399 ?auto_176401 ) ) ( not ( = ?auto_176400 ?auto_176401 ) ) ( ON ?auto_176401 ?auto_176402 ) ( not ( = ?auto_176395 ?auto_176402 ) ) ( not ( = ?auto_176396 ?auto_176402 ) ) ( not ( = ?auto_176397 ?auto_176402 ) ) ( not ( = ?auto_176398 ?auto_176402 ) ) ( not ( = ?auto_176399 ?auto_176402 ) ) ( not ( = ?auto_176400 ?auto_176402 ) ) ( not ( = ?auto_176401 ?auto_176402 ) ) ( ON ?auto_176400 ?auto_176401 ) ( CLEAR ?auto_176400 ) ( ON-TABLE ?auto_176402 ) ( HOLDING ?auto_176399 ) ( CLEAR ?auto_176398 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176395 ?auto_176396 ?auto_176397 ?auto_176398 ?auto_176399 )
      ( MAKE-7PILE ?auto_176395 ?auto_176396 ?auto_176397 ?auto_176398 ?auto_176399 ?auto_176400 ?auto_176401 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176403 - BLOCK
      ?auto_176404 - BLOCK
      ?auto_176405 - BLOCK
      ?auto_176406 - BLOCK
      ?auto_176407 - BLOCK
      ?auto_176408 - BLOCK
      ?auto_176409 - BLOCK
    )
    :vars
    (
      ?auto_176410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176403 ) ( ON ?auto_176404 ?auto_176403 ) ( ON ?auto_176405 ?auto_176404 ) ( ON ?auto_176406 ?auto_176405 ) ( not ( = ?auto_176403 ?auto_176404 ) ) ( not ( = ?auto_176403 ?auto_176405 ) ) ( not ( = ?auto_176403 ?auto_176406 ) ) ( not ( = ?auto_176403 ?auto_176407 ) ) ( not ( = ?auto_176403 ?auto_176408 ) ) ( not ( = ?auto_176403 ?auto_176409 ) ) ( not ( = ?auto_176404 ?auto_176405 ) ) ( not ( = ?auto_176404 ?auto_176406 ) ) ( not ( = ?auto_176404 ?auto_176407 ) ) ( not ( = ?auto_176404 ?auto_176408 ) ) ( not ( = ?auto_176404 ?auto_176409 ) ) ( not ( = ?auto_176405 ?auto_176406 ) ) ( not ( = ?auto_176405 ?auto_176407 ) ) ( not ( = ?auto_176405 ?auto_176408 ) ) ( not ( = ?auto_176405 ?auto_176409 ) ) ( not ( = ?auto_176406 ?auto_176407 ) ) ( not ( = ?auto_176406 ?auto_176408 ) ) ( not ( = ?auto_176406 ?auto_176409 ) ) ( not ( = ?auto_176407 ?auto_176408 ) ) ( not ( = ?auto_176407 ?auto_176409 ) ) ( not ( = ?auto_176408 ?auto_176409 ) ) ( ON ?auto_176409 ?auto_176410 ) ( not ( = ?auto_176403 ?auto_176410 ) ) ( not ( = ?auto_176404 ?auto_176410 ) ) ( not ( = ?auto_176405 ?auto_176410 ) ) ( not ( = ?auto_176406 ?auto_176410 ) ) ( not ( = ?auto_176407 ?auto_176410 ) ) ( not ( = ?auto_176408 ?auto_176410 ) ) ( not ( = ?auto_176409 ?auto_176410 ) ) ( ON ?auto_176408 ?auto_176409 ) ( ON-TABLE ?auto_176410 ) ( CLEAR ?auto_176406 ) ( ON ?auto_176407 ?auto_176408 ) ( CLEAR ?auto_176407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176410 ?auto_176409 ?auto_176408 )
      ( MAKE-7PILE ?auto_176403 ?auto_176404 ?auto_176405 ?auto_176406 ?auto_176407 ?auto_176408 ?auto_176409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176411 - BLOCK
      ?auto_176412 - BLOCK
      ?auto_176413 - BLOCK
      ?auto_176414 - BLOCK
      ?auto_176415 - BLOCK
      ?auto_176416 - BLOCK
      ?auto_176417 - BLOCK
    )
    :vars
    (
      ?auto_176418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176411 ) ( ON ?auto_176412 ?auto_176411 ) ( ON ?auto_176413 ?auto_176412 ) ( not ( = ?auto_176411 ?auto_176412 ) ) ( not ( = ?auto_176411 ?auto_176413 ) ) ( not ( = ?auto_176411 ?auto_176414 ) ) ( not ( = ?auto_176411 ?auto_176415 ) ) ( not ( = ?auto_176411 ?auto_176416 ) ) ( not ( = ?auto_176411 ?auto_176417 ) ) ( not ( = ?auto_176412 ?auto_176413 ) ) ( not ( = ?auto_176412 ?auto_176414 ) ) ( not ( = ?auto_176412 ?auto_176415 ) ) ( not ( = ?auto_176412 ?auto_176416 ) ) ( not ( = ?auto_176412 ?auto_176417 ) ) ( not ( = ?auto_176413 ?auto_176414 ) ) ( not ( = ?auto_176413 ?auto_176415 ) ) ( not ( = ?auto_176413 ?auto_176416 ) ) ( not ( = ?auto_176413 ?auto_176417 ) ) ( not ( = ?auto_176414 ?auto_176415 ) ) ( not ( = ?auto_176414 ?auto_176416 ) ) ( not ( = ?auto_176414 ?auto_176417 ) ) ( not ( = ?auto_176415 ?auto_176416 ) ) ( not ( = ?auto_176415 ?auto_176417 ) ) ( not ( = ?auto_176416 ?auto_176417 ) ) ( ON ?auto_176417 ?auto_176418 ) ( not ( = ?auto_176411 ?auto_176418 ) ) ( not ( = ?auto_176412 ?auto_176418 ) ) ( not ( = ?auto_176413 ?auto_176418 ) ) ( not ( = ?auto_176414 ?auto_176418 ) ) ( not ( = ?auto_176415 ?auto_176418 ) ) ( not ( = ?auto_176416 ?auto_176418 ) ) ( not ( = ?auto_176417 ?auto_176418 ) ) ( ON ?auto_176416 ?auto_176417 ) ( ON-TABLE ?auto_176418 ) ( ON ?auto_176415 ?auto_176416 ) ( CLEAR ?auto_176415 ) ( HOLDING ?auto_176414 ) ( CLEAR ?auto_176413 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176411 ?auto_176412 ?auto_176413 ?auto_176414 )
      ( MAKE-7PILE ?auto_176411 ?auto_176412 ?auto_176413 ?auto_176414 ?auto_176415 ?auto_176416 ?auto_176417 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176419 - BLOCK
      ?auto_176420 - BLOCK
      ?auto_176421 - BLOCK
      ?auto_176422 - BLOCK
      ?auto_176423 - BLOCK
      ?auto_176424 - BLOCK
      ?auto_176425 - BLOCK
    )
    :vars
    (
      ?auto_176426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176419 ) ( ON ?auto_176420 ?auto_176419 ) ( ON ?auto_176421 ?auto_176420 ) ( not ( = ?auto_176419 ?auto_176420 ) ) ( not ( = ?auto_176419 ?auto_176421 ) ) ( not ( = ?auto_176419 ?auto_176422 ) ) ( not ( = ?auto_176419 ?auto_176423 ) ) ( not ( = ?auto_176419 ?auto_176424 ) ) ( not ( = ?auto_176419 ?auto_176425 ) ) ( not ( = ?auto_176420 ?auto_176421 ) ) ( not ( = ?auto_176420 ?auto_176422 ) ) ( not ( = ?auto_176420 ?auto_176423 ) ) ( not ( = ?auto_176420 ?auto_176424 ) ) ( not ( = ?auto_176420 ?auto_176425 ) ) ( not ( = ?auto_176421 ?auto_176422 ) ) ( not ( = ?auto_176421 ?auto_176423 ) ) ( not ( = ?auto_176421 ?auto_176424 ) ) ( not ( = ?auto_176421 ?auto_176425 ) ) ( not ( = ?auto_176422 ?auto_176423 ) ) ( not ( = ?auto_176422 ?auto_176424 ) ) ( not ( = ?auto_176422 ?auto_176425 ) ) ( not ( = ?auto_176423 ?auto_176424 ) ) ( not ( = ?auto_176423 ?auto_176425 ) ) ( not ( = ?auto_176424 ?auto_176425 ) ) ( ON ?auto_176425 ?auto_176426 ) ( not ( = ?auto_176419 ?auto_176426 ) ) ( not ( = ?auto_176420 ?auto_176426 ) ) ( not ( = ?auto_176421 ?auto_176426 ) ) ( not ( = ?auto_176422 ?auto_176426 ) ) ( not ( = ?auto_176423 ?auto_176426 ) ) ( not ( = ?auto_176424 ?auto_176426 ) ) ( not ( = ?auto_176425 ?auto_176426 ) ) ( ON ?auto_176424 ?auto_176425 ) ( ON-TABLE ?auto_176426 ) ( ON ?auto_176423 ?auto_176424 ) ( CLEAR ?auto_176421 ) ( ON ?auto_176422 ?auto_176423 ) ( CLEAR ?auto_176422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176426 ?auto_176425 ?auto_176424 ?auto_176423 )
      ( MAKE-7PILE ?auto_176419 ?auto_176420 ?auto_176421 ?auto_176422 ?auto_176423 ?auto_176424 ?auto_176425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176427 - BLOCK
      ?auto_176428 - BLOCK
      ?auto_176429 - BLOCK
      ?auto_176430 - BLOCK
      ?auto_176431 - BLOCK
      ?auto_176432 - BLOCK
      ?auto_176433 - BLOCK
    )
    :vars
    (
      ?auto_176434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176427 ) ( ON ?auto_176428 ?auto_176427 ) ( not ( = ?auto_176427 ?auto_176428 ) ) ( not ( = ?auto_176427 ?auto_176429 ) ) ( not ( = ?auto_176427 ?auto_176430 ) ) ( not ( = ?auto_176427 ?auto_176431 ) ) ( not ( = ?auto_176427 ?auto_176432 ) ) ( not ( = ?auto_176427 ?auto_176433 ) ) ( not ( = ?auto_176428 ?auto_176429 ) ) ( not ( = ?auto_176428 ?auto_176430 ) ) ( not ( = ?auto_176428 ?auto_176431 ) ) ( not ( = ?auto_176428 ?auto_176432 ) ) ( not ( = ?auto_176428 ?auto_176433 ) ) ( not ( = ?auto_176429 ?auto_176430 ) ) ( not ( = ?auto_176429 ?auto_176431 ) ) ( not ( = ?auto_176429 ?auto_176432 ) ) ( not ( = ?auto_176429 ?auto_176433 ) ) ( not ( = ?auto_176430 ?auto_176431 ) ) ( not ( = ?auto_176430 ?auto_176432 ) ) ( not ( = ?auto_176430 ?auto_176433 ) ) ( not ( = ?auto_176431 ?auto_176432 ) ) ( not ( = ?auto_176431 ?auto_176433 ) ) ( not ( = ?auto_176432 ?auto_176433 ) ) ( ON ?auto_176433 ?auto_176434 ) ( not ( = ?auto_176427 ?auto_176434 ) ) ( not ( = ?auto_176428 ?auto_176434 ) ) ( not ( = ?auto_176429 ?auto_176434 ) ) ( not ( = ?auto_176430 ?auto_176434 ) ) ( not ( = ?auto_176431 ?auto_176434 ) ) ( not ( = ?auto_176432 ?auto_176434 ) ) ( not ( = ?auto_176433 ?auto_176434 ) ) ( ON ?auto_176432 ?auto_176433 ) ( ON-TABLE ?auto_176434 ) ( ON ?auto_176431 ?auto_176432 ) ( ON ?auto_176430 ?auto_176431 ) ( CLEAR ?auto_176430 ) ( HOLDING ?auto_176429 ) ( CLEAR ?auto_176428 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176427 ?auto_176428 ?auto_176429 )
      ( MAKE-7PILE ?auto_176427 ?auto_176428 ?auto_176429 ?auto_176430 ?auto_176431 ?auto_176432 ?auto_176433 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176435 - BLOCK
      ?auto_176436 - BLOCK
      ?auto_176437 - BLOCK
      ?auto_176438 - BLOCK
      ?auto_176439 - BLOCK
      ?auto_176440 - BLOCK
      ?auto_176441 - BLOCK
    )
    :vars
    (
      ?auto_176442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176435 ) ( ON ?auto_176436 ?auto_176435 ) ( not ( = ?auto_176435 ?auto_176436 ) ) ( not ( = ?auto_176435 ?auto_176437 ) ) ( not ( = ?auto_176435 ?auto_176438 ) ) ( not ( = ?auto_176435 ?auto_176439 ) ) ( not ( = ?auto_176435 ?auto_176440 ) ) ( not ( = ?auto_176435 ?auto_176441 ) ) ( not ( = ?auto_176436 ?auto_176437 ) ) ( not ( = ?auto_176436 ?auto_176438 ) ) ( not ( = ?auto_176436 ?auto_176439 ) ) ( not ( = ?auto_176436 ?auto_176440 ) ) ( not ( = ?auto_176436 ?auto_176441 ) ) ( not ( = ?auto_176437 ?auto_176438 ) ) ( not ( = ?auto_176437 ?auto_176439 ) ) ( not ( = ?auto_176437 ?auto_176440 ) ) ( not ( = ?auto_176437 ?auto_176441 ) ) ( not ( = ?auto_176438 ?auto_176439 ) ) ( not ( = ?auto_176438 ?auto_176440 ) ) ( not ( = ?auto_176438 ?auto_176441 ) ) ( not ( = ?auto_176439 ?auto_176440 ) ) ( not ( = ?auto_176439 ?auto_176441 ) ) ( not ( = ?auto_176440 ?auto_176441 ) ) ( ON ?auto_176441 ?auto_176442 ) ( not ( = ?auto_176435 ?auto_176442 ) ) ( not ( = ?auto_176436 ?auto_176442 ) ) ( not ( = ?auto_176437 ?auto_176442 ) ) ( not ( = ?auto_176438 ?auto_176442 ) ) ( not ( = ?auto_176439 ?auto_176442 ) ) ( not ( = ?auto_176440 ?auto_176442 ) ) ( not ( = ?auto_176441 ?auto_176442 ) ) ( ON ?auto_176440 ?auto_176441 ) ( ON-TABLE ?auto_176442 ) ( ON ?auto_176439 ?auto_176440 ) ( ON ?auto_176438 ?auto_176439 ) ( CLEAR ?auto_176436 ) ( ON ?auto_176437 ?auto_176438 ) ( CLEAR ?auto_176437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176442 ?auto_176441 ?auto_176440 ?auto_176439 ?auto_176438 )
      ( MAKE-7PILE ?auto_176435 ?auto_176436 ?auto_176437 ?auto_176438 ?auto_176439 ?auto_176440 ?auto_176441 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176443 - BLOCK
      ?auto_176444 - BLOCK
      ?auto_176445 - BLOCK
      ?auto_176446 - BLOCK
      ?auto_176447 - BLOCK
      ?auto_176448 - BLOCK
      ?auto_176449 - BLOCK
    )
    :vars
    (
      ?auto_176450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176443 ) ( not ( = ?auto_176443 ?auto_176444 ) ) ( not ( = ?auto_176443 ?auto_176445 ) ) ( not ( = ?auto_176443 ?auto_176446 ) ) ( not ( = ?auto_176443 ?auto_176447 ) ) ( not ( = ?auto_176443 ?auto_176448 ) ) ( not ( = ?auto_176443 ?auto_176449 ) ) ( not ( = ?auto_176444 ?auto_176445 ) ) ( not ( = ?auto_176444 ?auto_176446 ) ) ( not ( = ?auto_176444 ?auto_176447 ) ) ( not ( = ?auto_176444 ?auto_176448 ) ) ( not ( = ?auto_176444 ?auto_176449 ) ) ( not ( = ?auto_176445 ?auto_176446 ) ) ( not ( = ?auto_176445 ?auto_176447 ) ) ( not ( = ?auto_176445 ?auto_176448 ) ) ( not ( = ?auto_176445 ?auto_176449 ) ) ( not ( = ?auto_176446 ?auto_176447 ) ) ( not ( = ?auto_176446 ?auto_176448 ) ) ( not ( = ?auto_176446 ?auto_176449 ) ) ( not ( = ?auto_176447 ?auto_176448 ) ) ( not ( = ?auto_176447 ?auto_176449 ) ) ( not ( = ?auto_176448 ?auto_176449 ) ) ( ON ?auto_176449 ?auto_176450 ) ( not ( = ?auto_176443 ?auto_176450 ) ) ( not ( = ?auto_176444 ?auto_176450 ) ) ( not ( = ?auto_176445 ?auto_176450 ) ) ( not ( = ?auto_176446 ?auto_176450 ) ) ( not ( = ?auto_176447 ?auto_176450 ) ) ( not ( = ?auto_176448 ?auto_176450 ) ) ( not ( = ?auto_176449 ?auto_176450 ) ) ( ON ?auto_176448 ?auto_176449 ) ( ON-TABLE ?auto_176450 ) ( ON ?auto_176447 ?auto_176448 ) ( ON ?auto_176446 ?auto_176447 ) ( ON ?auto_176445 ?auto_176446 ) ( CLEAR ?auto_176445 ) ( HOLDING ?auto_176444 ) ( CLEAR ?auto_176443 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176443 ?auto_176444 )
      ( MAKE-7PILE ?auto_176443 ?auto_176444 ?auto_176445 ?auto_176446 ?auto_176447 ?auto_176448 ?auto_176449 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176451 - BLOCK
      ?auto_176452 - BLOCK
      ?auto_176453 - BLOCK
      ?auto_176454 - BLOCK
      ?auto_176455 - BLOCK
      ?auto_176456 - BLOCK
      ?auto_176457 - BLOCK
    )
    :vars
    (
      ?auto_176458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176451 ) ( not ( = ?auto_176451 ?auto_176452 ) ) ( not ( = ?auto_176451 ?auto_176453 ) ) ( not ( = ?auto_176451 ?auto_176454 ) ) ( not ( = ?auto_176451 ?auto_176455 ) ) ( not ( = ?auto_176451 ?auto_176456 ) ) ( not ( = ?auto_176451 ?auto_176457 ) ) ( not ( = ?auto_176452 ?auto_176453 ) ) ( not ( = ?auto_176452 ?auto_176454 ) ) ( not ( = ?auto_176452 ?auto_176455 ) ) ( not ( = ?auto_176452 ?auto_176456 ) ) ( not ( = ?auto_176452 ?auto_176457 ) ) ( not ( = ?auto_176453 ?auto_176454 ) ) ( not ( = ?auto_176453 ?auto_176455 ) ) ( not ( = ?auto_176453 ?auto_176456 ) ) ( not ( = ?auto_176453 ?auto_176457 ) ) ( not ( = ?auto_176454 ?auto_176455 ) ) ( not ( = ?auto_176454 ?auto_176456 ) ) ( not ( = ?auto_176454 ?auto_176457 ) ) ( not ( = ?auto_176455 ?auto_176456 ) ) ( not ( = ?auto_176455 ?auto_176457 ) ) ( not ( = ?auto_176456 ?auto_176457 ) ) ( ON ?auto_176457 ?auto_176458 ) ( not ( = ?auto_176451 ?auto_176458 ) ) ( not ( = ?auto_176452 ?auto_176458 ) ) ( not ( = ?auto_176453 ?auto_176458 ) ) ( not ( = ?auto_176454 ?auto_176458 ) ) ( not ( = ?auto_176455 ?auto_176458 ) ) ( not ( = ?auto_176456 ?auto_176458 ) ) ( not ( = ?auto_176457 ?auto_176458 ) ) ( ON ?auto_176456 ?auto_176457 ) ( ON-TABLE ?auto_176458 ) ( ON ?auto_176455 ?auto_176456 ) ( ON ?auto_176454 ?auto_176455 ) ( ON ?auto_176453 ?auto_176454 ) ( CLEAR ?auto_176451 ) ( ON ?auto_176452 ?auto_176453 ) ( CLEAR ?auto_176452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176458 ?auto_176457 ?auto_176456 ?auto_176455 ?auto_176454 ?auto_176453 )
      ( MAKE-7PILE ?auto_176451 ?auto_176452 ?auto_176453 ?auto_176454 ?auto_176455 ?auto_176456 ?auto_176457 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176459 - BLOCK
      ?auto_176460 - BLOCK
      ?auto_176461 - BLOCK
      ?auto_176462 - BLOCK
      ?auto_176463 - BLOCK
      ?auto_176464 - BLOCK
      ?auto_176465 - BLOCK
    )
    :vars
    (
      ?auto_176466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176459 ?auto_176460 ) ) ( not ( = ?auto_176459 ?auto_176461 ) ) ( not ( = ?auto_176459 ?auto_176462 ) ) ( not ( = ?auto_176459 ?auto_176463 ) ) ( not ( = ?auto_176459 ?auto_176464 ) ) ( not ( = ?auto_176459 ?auto_176465 ) ) ( not ( = ?auto_176460 ?auto_176461 ) ) ( not ( = ?auto_176460 ?auto_176462 ) ) ( not ( = ?auto_176460 ?auto_176463 ) ) ( not ( = ?auto_176460 ?auto_176464 ) ) ( not ( = ?auto_176460 ?auto_176465 ) ) ( not ( = ?auto_176461 ?auto_176462 ) ) ( not ( = ?auto_176461 ?auto_176463 ) ) ( not ( = ?auto_176461 ?auto_176464 ) ) ( not ( = ?auto_176461 ?auto_176465 ) ) ( not ( = ?auto_176462 ?auto_176463 ) ) ( not ( = ?auto_176462 ?auto_176464 ) ) ( not ( = ?auto_176462 ?auto_176465 ) ) ( not ( = ?auto_176463 ?auto_176464 ) ) ( not ( = ?auto_176463 ?auto_176465 ) ) ( not ( = ?auto_176464 ?auto_176465 ) ) ( ON ?auto_176465 ?auto_176466 ) ( not ( = ?auto_176459 ?auto_176466 ) ) ( not ( = ?auto_176460 ?auto_176466 ) ) ( not ( = ?auto_176461 ?auto_176466 ) ) ( not ( = ?auto_176462 ?auto_176466 ) ) ( not ( = ?auto_176463 ?auto_176466 ) ) ( not ( = ?auto_176464 ?auto_176466 ) ) ( not ( = ?auto_176465 ?auto_176466 ) ) ( ON ?auto_176464 ?auto_176465 ) ( ON-TABLE ?auto_176466 ) ( ON ?auto_176463 ?auto_176464 ) ( ON ?auto_176462 ?auto_176463 ) ( ON ?auto_176461 ?auto_176462 ) ( ON ?auto_176460 ?auto_176461 ) ( CLEAR ?auto_176460 ) ( HOLDING ?auto_176459 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176459 )
      ( MAKE-7PILE ?auto_176459 ?auto_176460 ?auto_176461 ?auto_176462 ?auto_176463 ?auto_176464 ?auto_176465 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176467 - BLOCK
      ?auto_176468 - BLOCK
      ?auto_176469 - BLOCK
      ?auto_176470 - BLOCK
      ?auto_176471 - BLOCK
      ?auto_176472 - BLOCK
      ?auto_176473 - BLOCK
    )
    :vars
    (
      ?auto_176474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176467 ?auto_176468 ) ) ( not ( = ?auto_176467 ?auto_176469 ) ) ( not ( = ?auto_176467 ?auto_176470 ) ) ( not ( = ?auto_176467 ?auto_176471 ) ) ( not ( = ?auto_176467 ?auto_176472 ) ) ( not ( = ?auto_176467 ?auto_176473 ) ) ( not ( = ?auto_176468 ?auto_176469 ) ) ( not ( = ?auto_176468 ?auto_176470 ) ) ( not ( = ?auto_176468 ?auto_176471 ) ) ( not ( = ?auto_176468 ?auto_176472 ) ) ( not ( = ?auto_176468 ?auto_176473 ) ) ( not ( = ?auto_176469 ?auto_176470 ) ) ( not ( = ?auto_176469 ?auto_176471 ) ) ( not ( = ?auto_176469 ?auto_176472 ) ) ( not ( = ?auto_176469 ?auto_176473 ) ) ( not ( = ?auto_176470 ?auto_176471 ) ) ( not ( = ?auto_176470 ?auto_176472 ) ) ( not ( = ?auto_176470 ?auto_176473 ) ) ( not ( = ?auto_176471 ?auto_176472 ) ) ( not ( = ?auto_176471 ?auto_176473 ) ) ( not ( = ?auto_176472 ?auto_176473 ) ) ( ON ?auto_176473 ?auto_176474 ) ( not ( = ?auto_176467 ?auto_176474 ) ) ( not ( = ?auto_176468 ?auto_176474 ) ) ( not ( = ?auto_176469 ?auto_176474 ) ) ( not ( = ?auto_176470 ?auto_176474 ) ) ( not ( = ?auto_176471 ?auto_176474 ) ) ( not ( = ?auto_176472 ?auto_176474 ) ) ( not ( = ?auto_176473 ?auto_176474 ) ) ( ON ?auto_176472 ?auto_176473 ) ( ON-TABLE ?auto_176474 ) ( ON ?auto_176471 ?auto_176472 ) ( ON ?auto_176470 ?auto_176471 ) ( ON ?auto_176469 ?auto_176470 ) ( ON ?auto_176468 ?auto_176469 ) ( ON ?auto_176467 ?auto_176468 ) ( CLEAR ?auto_176467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176474 ?auto_176473 ?auto_176472 ?auto_176471 ?auto_176470 ?auto_176469 ?auto_176468 )
      ( MAKE-7PILE ?auto_176467 ?auto_176468 ?auto_176469 ?auto_176470 ?auto_176471 ?auto_176472 ?auto_176473 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176482 - BLOCK
      ?auto_176483 - BLOCK
      ?auto_176484 - BLOCK
      ?auto_176485 - BLOCK
      ?auto_176486 - BLOCK
      ?auto_176487 - BLOCK
      ?auto_176488 - BLOCK
    )
    :vars
    (
      ?auto_176489 - BLOCK
      ?auto_176490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176482 ?auto_176483 ) ) ( not ( = ?auto_176482 ?auto_176484 ) ) ( not ( = ?auto_176482 ?auto_176485 ) ) ( not ( = ?auto_176482 ?auto_176486 ) ) ( not ( = ?auto_176482 ?auto_176487 ) ) ( not ( = ?auto_176482 ?auto_176488 ) ) ( not ( = ?auto_176483 ?auto_176484 ) ) ( not ( = ?auto_176483 ?auto_176485 ) ) ( not ( = ?auto_176483 ?auto_176486 ) ) ( not ( = ?auto_176483 ?auto_176487 ) ) ( not ( = ?auto_176483 ?auto_176488 ) ) ( not ( = ?auto_176484 ?auto_176485 ) ) ( not ( = ?auto_176484 ?auto_176486 ) ) ( not ( = ?auto_176484 ?auto_176487 ) ) ( not ( = ?auto_176484 ?auto_176488 ) ) ( not ( = ?auto_176485 ?auto_176486 ) ) ( not ( = ?auto_176485 ?auto_176487 ) ) ( not ( = ?auto_176485 ?auto_176488 ) ) ( not ( = ?auto_176486 ?auto_176487 ) ) ( not ( = ?auto_176486 ?auto_176488 ) ) ( not ( = ?auto_176487 ?auto_176488 ) ) ( ON ?auto_176488 ?auto_176489 ) ( not ( = ?auto_176482 ?auto_176489 ) ) ( not ( = ?auto_176483 ?auto_176489 ) ) ( not ( = ?auto_176484 ?auto_176489 ) ) ( not ( = ?auto_176485 ?auto_176489 ) ) ( not ( = ?auto_176486 ?auto_176489 ) ) ( not ( = ?auto_176487 ?auto_176489 ) ) ( not ( = ?auto_176488 ?auto_176489 ) ) ( ON ?auto_176487 ?auto_176488 ) ( ON-TABLE ?auto_176489 ) ( ON ?auto_176486 ?auto_176487 ) ( ON ?auto_176485 ?auto_176486 ) ( ON ?auto_176484 ?auto_176485 ) ( ON ?auto_176483 ?auto_176484 ) ( CLEAR ?auto_176483 ) ( ON ?auto_176482 ?auto_176490 ) ( CLEAR ?auto_176482 ) ( HAND-EMPTY ) ( not ( = ?auto_176482 ?auto_176490 ) ) ( not ( = ?auto_176483 ?auto_176490 ) ) ( not ( = ?auto_176484 ?auto_176490 ) ) ( not ( = ?auto_176485 ?auto_176490 ) ) ( not ( = ?auto_176486 ?auto_176490 ) ) ( not ( = ?auto_176487 ?auto_176490 ) ) ( not ( = ?auto_176488 ?auto_176490 ) ) ( not ( = ?auto_176489 ?auto_176490 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176482 ?auto_176490 )
      ( MAKE-7PILE ?auto_176482 ?auto_176483 ?auto_176484 ?auto_176485 ?auto_176486 ?auto_176487 ?auto_176488 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176491 - BLOCK
      ?auto_176492 - BLOCK
      ?auto_176493 - BLOCK
      ?auto_176494 - BLOCK
      ?auto_176495 - BLOCK
      ?auto_176496 - BLOCK
      ?auto_176497 - BLOCK
    )
    :vars
    (
      ?auto_176498 - BLOCK
      ?auto_176499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176491 ?auto_176492 ) ) ( not ( = ?auto_176491 ?auto_176493 ) ) ( not ( = ?auto_176491 ?auto_176494 ) ) ( not ( = ?auto_176491 ?auto_176495 ) ) ( not ( = ?auto_176491 ?auto_176496 ) ) ( not ( = ?auto_176491 ?auto_176497 ) ) ( not ( = ?auto_176492 ?auto_176493 ) ) ( not ( = ?auto_176492 ?auto_176494 ) ) ( not ( = ?auto_176492 ?auto_176495 ) ) ( not ( = ?auto_176492 ?auto_176496 ) ) ( not ( = ?auto_176492 ?auto_176497 ) ) ( not ( = ?auto_176493 ?auto_176494 ) ) ( not ( = ?auto_176493 ?auto_176495 ) ) ( not ( = ?auto_176493 ?auto_176496 ) ) ( not ( = ?auto_176493 ?auto_176497 ) ) ( not ( = ?auto_176494 ?auto_176495 ) ) ( not ( = ?auto_176494 ?auto_176496 ) ) ( not ( = ?auto_176494 ?auto_176497 ) ) ( not ( = ?auto_176495 ?auto_176496 ) ) ( not ( = ?auto_176495 ?auto_176497 ) ) ( not ( = ?auto_176496 ?auto_176497 ) ) ( ON ?auto_176497 ?auto_176498 ) ( not ( = ?auto_176491 ?auto_176498 ) ) ( not ( = ?auto_176492 ?auto_176498 ) ) ( not ( = ?auto_176493 ?auto_176498 ) ) ( not ( = ?auto_176494 ?auto_176498 ) ) ( not ( = ?auto_176495 ?auto_176498 ) ) ( not ( = ?auto_176496 ?auto_176498 ) ) ( not ( = ?auto_176497 ?auto_176498 ) ) ( ON ?auto_176496 ?auto_176497 ) ( ON-TABLE ?auto_176498 ) ( ON ?auto_176495 ?auto_176496 ) ( ON ?auto_176494 ?auto_176495 ) ( ON ?auto_176493 ?auto_176494 ) ( ON ?auto_176491 ?auto_176499 ) ( CLEAR ?auto_176491 ) ( not ( = ?auto_176491 ?auto_176499 ) ) ( not ( = ?auto_176492 ?auto_176499 ) ) ( not ( = ?auto_176493 ?auto_176499 ) ) ( not ( = ?auto_176494 ?auto_176499 ) ) ( not ( = ?auto_176495 ?auto_176499 ) ) ( not ( = ?auto_176496 ?auto_176499 ) ) ( not ( = ?auto_176497 ?auto_176499 ) ) ( not ( = ?auto_176498 ?auto_176499 ) ) ( HOLDING ?auto_176492 ) ( CLEAR ?auto_176493 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176498 ?auto_176497 ?auto_176496 ?auto_176495 ?auto_176494 ?auto_176493 ?auto_176492 )
      ( MAKE-7PILE ?auto_176491 ?auto_176492 ?auto_176493 ?auto_176494 ?auto_176495 ?auto_176496 ?auto_176497 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176500 - BLOCK
      ?auto_176501 - BLOCK
      ?auto_176502 - BLOCK
      ?auto_176503 - BLOCK
      ?auto_176504 - BLOCK
      ?auto_176505 - BLOCK
      ?auto_176506 - BLOCK
    )
    :vars
    (
      ?auto_176507 - BLOCK
      ?auto_176508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176500 ?auto_176501 ) ) ( not ( = ?auto_176500 ?auto_176502 ) ) ( not ( = ?auto_176500 ?auto_176503 ) ) ( not ( = ?auto_176500 ?auto_176504 ) ) ( not ( = ?auto_176500 ?auto_176505 ) ) ( not ( = ?auto_176500 ?auto_176506 ) ) ( not ( = ?auto_176501 ?auto_176502 ) ) ( not ( = ?auto_176501 ?auto_176503 ) ) ( not ( = ?auto_176501 ?auto_176504 ) ) ( not ( = ?auto_176501 ?auto_176505 ) ) ( not ( = ?auto_176501 ?auto_176506 ) ) ( not ( = ?auto_176502 ?auto_176503 ) ) ( not ( = ?auto_176502 ?auto_176504 ) ) ( not ( = ?auto_176502 ?auto_176505 ) ) ( not ( = ?auto_176502 ?auto_176506 ) ) ( not ( = ?auto_176503 ?auto_176504 ) ) ( not ( = ?auto_176503 ?auto_176505 ) ) ( not ( = ?auto_176503 ?auto_176506 ) ) ( not ( = ?auto_176504 ?auto_176505 ) ) ( not ( = ?auto_176504 ?auto_176506 ) ) ( not ( = ?auto_176505 ?auto_176506 ) ) ( ON ?auto_176506 ?auto_176507 ) ( not ( = ?auto_176500 ?auto_176507 ) ) ( not ( = ?auto_176501 ?auto_176507 ) ) ( not ( = ?auto_176502 ?auto_176507 ) ) ( not ( = ?auto_176503 ?auto_176507 ) ) ( not ( = ?auto_176504 ?auto_176507 ) ) ( not ( = ?auto_176505 ?auto_176507 ) ) ( not ( = ?auto_176506 ?auto_176507 ) ) ( ON ?auto_176505 ?auto_176506 ) ( ON-TABLE ?auto_176507 ) ( ON ?auto_176504 ?auto_176505 ) ( ON ?auto_176503 ?auto_176504 ) ( ON ?auto_176502 ?auto_176503 ) ( ON ?auto_176500 ?auto_176508 ) ( not ( = ?auto_176500 ?auto_176508 ) ) ( not ( = ?auto_176501 ?auto_176508 ) ) ( not ( = ?auto_176502 ?auto_176508 ) ) ( not ( = ?auto_176503 ?auto_176508 ) ) ( not ( = ?auto_176504 ?auto_176508 ) ) ( not ( = ?auto_176505 ?auto_176508 ) ) ( not ( = ?auto_176506 ?auto_176508 ) ) ( not ( = ?auto_176507 ?auto_176508 ) ) ( CLEAR ?auto_176502 ) ( ON ?auto_176501 ?auto_176500 ) ( CLEAR ?auto_176501 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176508 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176508 ?auto_176500 )
      ( MAKE-7PILE ?auto_176500 ?auto_176501 ?auto_176502 ?auto_176503 ?auto_176504 ?auto_176505 ?auto_176506 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176509 - BLOCK
      ?auto_176510 - BLOCK
      ?auto_176511 - BLOCK
      ?auto_176512 - BLOCK
      ?auto_176513 - BLOCK
      ?auto_176514 - BLOCK
      ?auto_176515 - BLOCK
    )
    :vars
    (
      ?auto_176516 - BLOCK
      ?auto_176517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176509 ?auto_176510 ) ) ( not ( = ?auto_176509 ?auto_176511 ) ) ( not ( = ?auto_176509 ?auto_176512 ) ) ( not ( = ?auto_176509 ?auto_176513 ) ) ( not ( = ?auto_176509 ?auto_176514 ) ) ( not ( = ?auto_176509 ?auto_176515 ) ) ( not ( = ?auto_176510 ?auto_176511 ) ) ( not ( = ?auto_176510 ?auto_176512 ) ) ( not ( = ?auto_176510 ?auto_176513 ) ) ( not ( = ?auto_176510 ?auto_176514 ) ) ( not ( = ?auto_176510 ?auto_176515 ) ) ( not ( = ?auto_176511 ?auto_176512 ) ) ( not ( = ?auto_176511 ?auto_176513 ) ) ( not ( = ?auto_176511 ?auto_176514 ) ) ( not ( = ?auto_176511 ?auto_176515 ) ) ( not ( = ?auto_176512 ?auto_176513 ) ) ( not ( = ?auto_176512 ?auto_176514 ) ) ( not ( = ?auto_176512 ?auto_176515 ) ) ( not ( = ?auto_176513 ?auto_176514 ) ) ( not ( = ?auto_176513 ?auto_176515 ) ) ( not ( = ?auto_176514 ?auto_176515 ) ) ( ON ?auto_176515 ?auto_176516 ) ( not ( = ?auto_176509 ?auto_176516 ) ) ( not ( = ?auto_176510 ?auto_176516 ) ) ( not ( = ?auto_176511 ?auto_176516 ) ) ( not ( = ?auto_176512 ?auto_176516 ) ) ( not ( = ?auto_176513 ?auto_176516 ) ) ( not ( = ?auto_176514 ?auto_176516 ) ) ( not ( = ?auto_176515 ?auto_176516 ) ) ( ON ?auto_176514 ?auto_176515 ) ( ON-TABLE ?auto_176516 ) ( ON ?auto_176513 ?auto_176514 ) ( ON ?auto_176512 ?auto_176513 ) ( ON ?auto_176509 ?auto_176517 ) ( not ( = ?auto_176509 ?auto_176517 ) ) ( not ( = ?auto_176510 ?auto_176517 ) ) ( not ( = ?auto_176511 ?auto_176517 ) ) ( not ( = ?auto_176512 ?auto_176517 ) ) ( not ( = ?auto_176513 ?auto_176517 ) ) ( not ( = ?auto_176514 ?auto_176517 ) ) ( not ( = ?auto_176515 ?auto_176517 ) ) ( not ( = ?auto_176516 ?auto_176517 ) ) ( ON ?auto_176510 ?auto_176509 ) ( CLEAR ?auto_176510 ) ( ON-TABLE ?auto_176517 ) ( HOLDING ?auto_176511 ) ( CLEAR ?auto_176512 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176516 ?auto_176515 ?auto_176514 ?auto_176513 ?auto_176512 ?auto_176511 )
      ( MAKE-7PILE ?auto_176509 ?auto_176510 ?auto_176511 ?auto_176512 ?auto_176513 ?auto_176514 ?auto_176515 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176518 - BLOCK
      ?auto_176519 - BLOCK
      ?auto_176520 - BLOCK
      ?auto_176521 - BLOCK
      ?auto_176522 - BLOCK
      ?auto_176523 - BLOCK
      ?auto_176524 - BLOCK
    )
    :vars
    (
      ?auto_176525 - BLOCK
      ?auto_176526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176518 ?auto_176519 ) ) ( not ( = ?auto_176518 ?auto_176520 ) ) ( not ( = ?auto_176518 ?auto_176521 ) ) ( not ( = ?auto_176518 ?auto_176522 ) ) ( not ( = ?auto_176518 ?auto_176523 ) ) ( not ( = ?auto_176518 ?auto_176524 ) ) ( not ( = ?auto_176519 ?auto_176520 ) ) ( not ( = ?auto_176519 ?auto_176521 ) ) ( not ( = ?auto_176519 ?auto_176522 ) ) ( not ( = ?auto_176519 ?auto_176523 ) ) ( not ( = ?auto_176519 ?auto_176524 ) ) ( not ( = ?auto_176520 ?auto_176521 ) ) ( not ( = ?auto_176520 ?auto_176522 ) ) ( not ( = ?auto_176520 ?auto_176523 ) ) ( not ( = ?auto_176520 ?auto_176524 ) ) ( not ( = ?auto_176521 ?auto_176522 ) ) ( not ( = ?auto_176521 ?auto_176523 ) ) ( not ( = ?auto_176521 ?auto_176524 ) ) ( not ( = ?auto_176522 ?auto_176523 ) ) ( not ( = ?auto_176522 ?auto_176524 ) ) ( not ( = ?auto_176523 ?auto_176524 ) ) ( ON ?auto_176524 ?auto_176525 ) ( not ( = ?auto_176518 ?auto_176525 ) ) ( not ( = ?auto_176519 ?auto_176525 ) ) ( not ( = ?auto_176520 ?auto_176525 ) ) ( not ( = ?auto_176521 ?auto_176525 ) ) ( not ( = ?auto_176522 ?auto_176525 ) ) ( not ( = ?auto_176523 ?auto_176525 ) ) ( not ( = ?auto_176524 ?auto_176525 ) ) ( ON ?auto_176523 ?auto_176524 ) ( ON-TABLE ?auto_176525 ) ( ON ?auto_176522 ?auto_176523 ) ( ON ?auto_176521 ?auto_176522 ) ( ON ?auto_176518 ?auto_176526 ) ( not ( = ?auto_176518 ?auto_176526 ) ) ( not ( = ?auto_176519 ?auto_176526 ) ) ( not ( = ?auto_176520 ?auto_176526 ) ) ( not ( = ?auto_176521 ?auto_176526 ) ) ( not ( = ?auto_176522 ?auto_176526 ) ) ( not ( = ?auto_176523 ?auto_176526 ) ) ( not ( = ?auto_176524 ?auto_176526 ) ) ( not ( = ?auto_176525 ?auto_176526 ) ) ( ON ?auto_176519 ?auto_176518 ) ( ON-TABLE ?auto_176526 ) ( CLEAR ?auto_176521 ) ( ON ?auto_176520 ?auto_176519 ) ( CLEAR ?auto_176520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176526 ?auto_176518 ?auto_176519 )
      ( MAKE-7PILE ?auto_176518 ?auto_176519 ?auto_176520 ?auto_176521 ?auto_176522 ?auto_176523 ?auto_176524 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176527 - BLOCK
      ?auto_176528 - BLOCK
      ?auto_176529 - BLOCK
      ?auto_176530 - BLOCK
      ?auto_176531 - BLOCK
      ?auto_176532 - BLOCK
      ?auto_176533 - BLOCK
    )
    :vars
    (
      ?auto_176534 - BLOCK
      ?auto_176535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176527 ?auto_176528 ) ) ( not ( = ?auto_176527 ?auto_176529 ) ) ( not ( = ?auto_176527 ?auto_176530 ) ) ( not ( = ?auto_176527 ?auto_176531 ) ) ( not ( = ?auto_176527 ?auto_176532 ) ) ( not ( = ?auto_176527 ?auto_176533 ) ) ( not ( = ?auto_176528 ?auto_176529 ) ) ( not ( = ?auto_176528 ?auto_176530 ) ) ( not ( = ?auto_176528 ?auto_176531 ) ) ( not ( = ?auto_176528 ?auto_176532 ) ) ( not ( = ?auto_176528 ?auto_176533 ) ) ( not ( = ?auto_176529 ?auto_176530 ) ) ( not ( = ?auto_176529 ?auto_176531 ) ) ( not ( = ?auto_176529 ?auto_176532 ) ) ( not ( = ?auto_176529 ?auto_176533 ) ) ( not ( = ?auto_176530 ?auto_176531 ) ) ( not ( = ?auto_176530 ?auto_176532 ) ) ( not ( = ?auto_176530 ?auto_176533 ) ) ( not ( = ?auto_176531 ?auto_176532 ) ) ( not ( = ?auto_176531 ?auto_176533 ) ) ( not ( = ?auto_176532 ?auto_176533 ) ) ( ON ?auto_176533 ?auto_176534 ) ( not ( = ?auto_176527 ?auto_176534 ) ) ( not ( = ?auto_176528 ?auto_176534 ) ) ( not ( = ?auto_176529 ?auto_176534 ) ) ( not ( = ?auto_176530 ?auto_176534 ) ) ( not ( = ?auto_176531 ?auto_176534 ) ) ( not ( = ?auto_176532 ?auto_176534 ) ) ( not ( = ?auto_176533 ?auto_176534 ) ) ( ON ?auto_176532 ?auto_176533 ) ( ON-TABLE ?auto_176534 ) ( ON ?auto_176531 ?auto_176532 ) ( ON ?auto_176527 ?auto_176535 ) ( not ( = ?auto_176527 ?auto_176535 ) ) ( not ( = ?auto_176528 ?auto_176535 ) ) ( not ( = ?auto_176529 ?auto_176535 ) ) ( not ( = ?auto_176530 ?auto_176535 ) ) ( not ( = ?auto_176531 ?auto_176535 ) ) ( not ( = ?auto_176532 ?auto_176535 ) ) ( not ( = ?auto_176533 ?auto_176535 ) ) ( not ( = ?auto_176534 ?auto_176535 ) ) ( ON ?auto_176528 ?auto_176527 ) ( ON-TABLE ?auto_176535 ) ( ON ?auto_176529 ?auto_176528 ) ( CLEAR ?auto_176529 ) ( HOLDING ?auto_176530 ) ( CLEAR ?auto_176531 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176534 ?auto_176533 ?auto_176532 ?auto_176531 ?auto_176530 )
      ( MAKE-7PILE ?auto_176527 ?auto_176528 ?auto_176529 ?auto_176530 ?auto_176531 ?auto_176532 ?auto_176533 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176536 - BLOCK
      ?auto_176537 - BLOCK
      ?auto_176538 - BLOCK
      ?auto_176539 - BLOCK
      ?auto_176540 - BLOCK
      ?auto_176541 - BLOCK
      ?auto_176542 - BLOCK
    )
    :vars
    (
      ?auto_176543 - BLOCK
      ?auto_176544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176536 ?auto_176537 ) ) ( not ( = ?auto_176536 ?auto_176538 ) ) ( not ( = ?auto_176536 ?auto_176539 ) ) ( not ( = ?auto_176536 ?auto_176540 ) ) ( not ( = ?auto_176536 ?auto_176541 ) ) ( not ( = ?auto_176536 ?auto_176542 ) ) ( not ( = ?auto_176537 ?auto_176538 ) ) ( not ( = ?auto_176537 ?auto_176539 ) ) ( not ( = ?auto_176537 ?auto_176540 ) ) ( not ( = ?auto_176537 ?auto_176541 ) ) ( not ( = ?auto_176537 ?auto_176542 ) ) ( not ( = ?auto_176538 ?auto_176539 ) ) ( not ( = ?auto_176538 ?auto_176540 ) ) ( not ( = ?auto_176538 ?auto_176541 ) ) ( not ( = ?auto_176538 ?auto_176542 ) ) ( not ( = ?auto_176539 ?auto_176540 ) ) ( not ( = ?auto_176539 ?auto_176541 ) ) ( not ( = ?auto_176539 ?auto_176542 ) ) ( not ( = ?auto_176540 ?auto_176541 ) ) ( not ( = ?auto_176540 ?auto_176542 ) ) ( not ( = ?auto_176541 ?auto_176542 ) ) ( ON ?auto_176542 ?auto_176543 ) ( not ( = ?auto_176536 ?auto_176543 ) ) ( not ( = ?auto_176537 ?auto_176543 ) ) ( not ( = ?auto_176538 ?auto_176543 ) ) ( not ( = ?auto_176539 ?auto_176543 ) ) ( not ( = ?auto_176540 ?auto_176543 ) ) ( not ( = ?auto_176541 ?auto_176543 ) ) ( not ( = ?auto_176542 ?auto_176543 ) ) ( ON ?auto_176541 ?auto_176542 ) ( ON-TABLE ?auto_176543 ) ( ON ?auto_176540 ?auto_176541 ) ( ON ?auto_176536 ?auto_176544 ) ( not ( = ?auto_176536 ?auto_176544 ) ) ( not ( = ?auto_176537 ?auto_176544 ) ) ( not ( = ?auto_176538 ?auto_176544 ) ) ( not ( = ?auto_176539 ?auto_176544 ) ) ( not ( = ?auto_176540 ?auto_176544 ) ) ( not ( = ?auto_176541 ?auto_176544 ) ) ( not ( = ?auto_176542 ?auto_176544 ) ) ( not ( = ?auto_176543 ?auto_176544 ) ) ( ON ?auto_176537 ?auto_176536 ) ( ON-TABLE ?auto_176544 ) ( ON ?auto_176538 ?auto_176537 ) ( CLEAR ?auto_176540 ) ( ON ?auto_176539 ?auto_176538 ) ( CLEAR ?auto_176539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176544 ?auto_176536 ?auto_176537 ?auto_176538 )
      ( MAKE-7PILE ?auto_176536 ?auto_176537 ?auto_176538 ?auto_176539 ?auto_176540 ?auto_176541 ?auto_176542 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176545 - BLOCK
      ?auto_176546 - BLOCK
      ?auto_176547 - BLOCK
      ?auto_176548 - BLOCK
      ?auto_176549 - BLOCK
      ?auto_176550 - BLOCK
      ?auto_176551 - BLOCK
    )
    :vars
    (
      ?auto_176553 - BLOCK
      ?auto_176552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176545 ?auto_176546 ) ) ( not ( = ?auto_176545 ?auto_176547 ) ) ( not ( = ?auto_176545 ?auto_176548 ) ) ( not ( = ?auto_176545 ?auto_176549 ) ) ( not ( = ?auto_176545 ?auto_176550 ) ) ( not ( = ?auto_176545 ?auto_176551 ) ) ( not ( = ?auto_176546 ?auto_176547 ) ) ( not ( = ?auto_176546 ?auto_176548 ) ) ( not ( = ?auto_176546 ?auto_176549 ) ) ( not ( = ?auto_176546 ?auto_176550 ) ) ( not ( = ?auto_176546 ?auto_176551 ) ) ( not ( = ?auto_176547 ?auto_176548 ) ) ( not ( = ?auto_176547 ?auto_176549 ) ) ( not ( = ?auto_176547 ?auto_176550 ) ) ( not ( = ?auto_176547 ?auto_176551 ) ) ( not ( = ?auto_176548 ?auto_176549 ) ) ( not ( = ?auto_176548 ?auto_176550 ) ) ( not ( = ?auto_176548 ?auto_176551 ) ) ( not ( = ?auto_176549 ?auto_176550 ) ) ( not ( = ?auto_176549 ?auto_176551 ) ) ( not ( = ?auto_176550 ?auto_176551 ) ) ( ON ?auto_176551 ?auto_176553 ) ( not ( = ?auto_176545 ?auto_176553 ) ) ( not ( = ?auto_176546 ?auto_176553 ) ) ( not ( = ?auto_176547 ?auto_176553 ) ) ( not ( = ?auto_176548 ?auto_176553 ) ) ( not ( = ?auto_176549 ?auto_176553 ) ) ( not ( = ?auto_176550 ?auto_176553 ) ) ( not ( = ?auto_176551 ?auto_176553 ) ) ( ON ?auto_176550 ?auto_176551 ) ( ON-TABLE ?auto_176553 ) ( ON ?auto_176545 ?auto_176552 ) ( not ( = ?auto_176545 ?auto_176552 ) ) ( not ( = ?auto_176546 ?auto_176552 ) ) ( not ( = ?auto_176547 ?auto_176552 ) ) ( not ( = ?auto_176548 ?auto_176552 ) ) ( not ( = ?auto_176549 ?auto_176552 ) ) ( not ( = ?auto_176550 ?auto_176552 ) ) ( not ( = ?auto_176551 ?auto_176552 ) ) ( not ( = ?auto_176553 ?auto_176552 ) ) ( ON ?auto_176546 ?auto_176545 ) ( ON-TABLE ?auto_176552 ) ( ON ?auto_176547 ?auto_176546 ) ( ON ?auto_176548 ?auto_176547 ) ( CLEAR ?auto_176548 ) ( HOLDING ?auto_176549 ) ( CLEAR ?auto_176550 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176553 ?auto_176551 ?auto_176550 ?auto_176549 )
      ( MAKE-7PILE ?auto_176545 ?auto_176546 ?auto_176547 ?auto_176548 ?auto_176549 ?auto_176550 ?auto_176551 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176554 - BLOCK
      ?auto_176555 - BLOCK
      ?auto_176556 - BLOCK
      ?auto_176557 - BLOCK
      ?auto_176558 - BLOCK
      ?auto_176559 - BLOCK
      ?auto_176560 - BLOCK
    )
    :vars
    (
      ?auto_176561 - BLOCK
      ?auto_176562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176554 ?auto_176555 ) ) ( not ( = ?auto_176554 ?auto_176556 ) ) ( not ( = ?auto_176554 ?auto_176557 ) ) ( not ( = ?auto_176554 ?auto_176558 ) ) ( not ( = ?auto_176554 ?auto_176559 ) ) ( not ( = ?auto_176554 ?auto_176560 ) ) ( not ( = ?auto_176555 ?auto_176556 ) ) ( not ( = ?auto_176555 ?auto_176557 ) ) ( not ( = ?auto_176555 ?auto_176558 ) ) ( not ( = ?auto_176555 ?auto_176559 ) ) ( not ( = ?auto_176555 ?auto_176560 ) ) ( not ( = ?auto_176556 ?auto_176557 ) ) ( not ( = ?auto_176556 ?auto_176558 ) ) ( not ( = ?auto_176556 ?auto_176559 ) ) ( not ( = ?auto_176556 ?auto_176560 ) ) ( not ( = ?auto_176557 ?auto_176558 ) ) ( not ( = ?auto_176557 ?auto_176559 ) ) ( not ( = ?auto_176557 ?auto_176560 ) ) ( not ( = ?auto_176558 ?auto_176559 ) ) ( not ( = ?auto_176558 ?auto_176560 ) ) ( not ( = ?auto_176559 ?auto_176560 ) ) ( ON ?auto_176560 ?auto_176561 ) ( not ( = ?auto_176554 ?auto_176561 ) ) ( not ( = ?auto_176555 ?auto_176561 ) ) ( not ( = ?auto_176556 ?auto_176561 ) ) ( not ( = ?auto_176557 ?auto_176561 ) ) ( not ( = ?auto_176558 ?auto_176561 ) ) ( not ( = ?auto_176559 ?auto_176561 ) ) ( not ( = ?auto_176560 ?auto_176561 ) ) ( ON ?auto_176559 ?auto_176560 ) ( ON-TABLE ?auto_176561 ) ( ON ?auto_176554 ?auto_176562 ) ( not ( = ?auto_176554 ?auto_176562 ) ) ( not ( = ?auto_176555 ?auto_176562 ) ) ( not ( = ?auto_176556 ?auto_176562 ) ) ( not ( = ?auto_176557 ?auto_176562 ) ) ( not ( = ?auto_176558 ?auto_176562 ) ) ( not ( = ?auto_176559 ?auto_176562 ) ) ( not ( = ?auto_176560 ?auto_176562 ) ) ( not ( = ?auto_176561 ?auto_176562 ) ) ( ON ?auto_176555 ?auto_176554 ) ( ON-TABLE ?auto_176562 ) ( ON ?auto_176556 ?auto_176555 ) ( ON ?auto_176557 ?auto_176556 ) ( CLEAR ?auto_176559 ) ( ON ?auto_176558 ?auto_176557 ) ( CLEAR ?auto_176558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176562 ?auto_176554 ?auto_176555 ?auto_176556 ?auto_176557 )
      ( MAKE-7PILE ?auto_176554 ?auto_176555 ?auto_176556 ?auto_176557 ?auto_176558 ?auto_176559 ?auto_176560 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176563 - BLOCK
      ?auto_176564 - BLOCK
      ?auto_176565 - BLOCK
      ?auto_176566 - BLOCK
      ?auto_176567 - BLOCK
      ?auto_176568 - BLOCK
      ?auto_176569 - BLOCK
    )
    :vars
    (
      ?auto_176571 - BLOCK
      ?auto_176570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176563 ?auto_176564 ) ) ( not ( = ?auto_176563 ?auto_176565 ) ) ( not ( = ?auto_176563 ?auto_176566 ) ) ( not ( = ?auto_176563 ?auto_176567 ) ) ( not ( = ?auto_176563 ?auto_176568 ) ) ( not ( = ?auto_176563 ?auto_176569 ) ) ( not ( = ?auto_176564 ?auto_176565 ) ) ( not ( = ?auto_176564 ?auto_176566 ) ) ( not ( = ?auto_176564 ?auto_176567 ) ) ( not ( = ?auto_176564 ?auto_176568 ) ) ( not ( = ?auto_176564 ?auto_176569 ) ) ( not ( = ?auto_176565 ?auto_176566 ) ) ( not ( = ?auto_176565 ?auto_176567 ) ) ( not ( = ?auto_176565 ?auto_176568 ) ) ( not ( = ?auto_176565 ?auto_176569 ) ) ( not ( = ?auto_176566 ?auto_176567 ) ) ( not ( = ?auto_176566 ?auto_176568 ) ) ( not ( = ?auto_176566 ?auto_176569 ) ) ( not ( = ?auto_176567 ?auto_176568 ) ) ( not ( = ?auto_176567 ?auto_176569 ) ) ( not ( = ?auto_176568 ?auto_176569 ) ) ( ON ?auto_176569 ?auto_176571 ) ( not ( = ?auto_176563 ?auto_176571 ) ) ( not ( = ?auto_176564 ?auto_176571 ) ) ( not ( = ?auto_176565 ?auto_176571 ) ) ( not ( = ?auto_176566 ?auto_176571 ) ) ( not ( = ?auto_176567 ?auto_176571 ) ) ( not ( = ?auto_176568 ?auto_176571 ) ) ( not ( = ?auto_176569 ?auto_176571 ) ) ( ON-TABLE ?auto_176571 ) ( ON ?auto_176563 ?auto_176570 ) ( not ( = ?auto_176563 ?auto_176570 ) ) ( not ( = ?auto_176564 ?auto_176570 ) ) ( not ( = ?auto_176565 ?auto_176570 ) ) ( not ( = ?auto_176566 ?auto_176570 ) ) ( not ( = ?auto_176567 ?auto_176570 ) ) ( not ( = ?auto_176568 ?auto_176570 ) ) ( not ( = ?auto_176569 ?auto_176570 ) ) ( not ( = ?auto_176571 ?auto_176570 ) ) ( ON ?auto_176564 ?auto_176563 ) ( ON-TABLE ?auto_176570 ) ( ON ?auto_176565 ?auto_176564 ) ( ON ?auto_176566 ?auto_176565 ) ( ON ?auto_176567 ?auto_176566 ) ( CLEAR ?auto_176567 ) ( HOLDING ?auto_176568 ) ( CLEAR ?auto_176569 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176571 ?auto_176569 ?auto_176568 )
      ( MAKE-7PILE ?auto_176563 ?auto_176564 ?auto_176565 ?auto_176566 ?auto_176567 ?auto_176568 ?auto_176569 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176572 - BLOCK
      ?auto_176573 - BLOCK
      ?auto_176574 - BLOCK
      ?auto_176575 - BLOCK
      ?auto_176576 - BLOCK
      ?auto_176577 - BLOCK
      ?auto_176578 - BLOCK
    )
    :vars
    (
      ?auto_176579 - BLOCK
      ?auto_176580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176572 ?auto_176573 ) ) ( not ( = ?auto_176572 ?auto_176574 ) ) ( not ( = ?auto_176572 ?auto_176575 ) ) ( not ( = ?auto_176572 ?auto_176576 ) ) ( not ( = ?auto_176572 ?auto_176577 ) ) ( not ( = ?auto_176572 ?auto_176578 ) ) ( not ( = ?auto_176573 ?auto_176574 ) ) ( not ( = ?auto_176573 ?auto_176575 ) ) ( not ( = ?auto_176573 ?auto_176576 ) ) ( not ( = ?auto_176573 ?auto_176577 ) ) ( not ( = ?auto_176573 ?auto_176578 ) ) ( not ( = ?auto_176574 ?auto_176575 ) ) ( not ( = ?auto_176574 ?auto_176576 ) ) ( not ( = ?auto_176574 ?auto_176577 ) ) ( not ( = ?auto_176574 ?auto_176578 ) ) ( not ( = ?auto_176575 ?auto_176576 ) ) ( not ( = ?auto_176575 ?auto_176577 ) ) ( not ( = ?auto_176575 ?auto_176578 ) ) ( not ( = ?auto_176576 ?auto_176577 ) ) ( not ( = ?auto_176576 ?auto_176578 ) ) ( not ( = ?auto_176577 ?auto_176578 ) ) ( ON ?auto_176578 ?auto_176579 ) ( not ( = ?auto_176572 ?auto_176579 ) ) ( not ( = ?auto_176573 ?auto_176579 ) ) ( not ( = ?auto_176574 ?auto_176579 ) ) ( not ( = ?auto_176575 ?auto_176579 ) ) ( not ( = ?auto_176576 ?auto_176579 ) ) ( not ( = ?auto_176577 ?auto_176579 ) ) ( not ( = ?auto_176578 ?auto_176579 ) ) ( ON-TABLE ?auto_176579 ) ( ON ?auto_176572 ?auto_176580 ) ( not ( = ?auto_176572 ?auto_176580 ) ) ( not ( = ?auto_176573 ?auto_176580 ) ) ( not ( = ?auto_176574 ?auto_176580 ) ) ( not ( = ?auto_176575 ?auto_176580 ) ) ( not ( = ?auto_176576 ?auto_176580 ) ) ( not ( = ?auto_176577 ?auto_176580 ) ) ( not ( = ?auto_176578 ?auto_176580 ) ) ( not ( = ?auto_176579 ?auto_176580 ) ) ( ON ?auto_176573 ?auto_176572 ) ( ON-TABLE ?auto_176580 ) ( ON ?auto_176574 ?auto_176573 ) ( ON ?auto_176575 ?auto_176574 ) ( ON ?auto_176576 ?auto_176575 ) ( CLEAR ?auto_176578 ) ( ON ?auto_176577 ?auto_176576 ) ( CLEAR ?auto_176577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176580 ?auto_176572 ?auto_176573 ?auto_176574 ?auto_176575 ?auto_176576 )
      ( MAKE-7PILE ?auto_176572 ?auto_176573 ?auto_176574 ?auto_176575 ?auto_176576 ?auto_176577 ?auto_176578 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176581 - BLOCK
      ?auto_176582 - BLOCK
      ?auto_176583 - BLOCK
      ?auto_176584 - BLOCK
      ?auto_176585 - BLOCK
      ?auto_176586 - BLOCK
      ?auto_176587 - BLOCK
    )
    :vars
    (
      ?auto_176588 - BLOCK
      ?auto_176589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176581 ?auto_176582 ) ) ( not ( = ?auto_176581 ?auto_176583 ) ) ( not ( = ?auto_176581 ?auto_176584 ) ) ( not ( = ?auto_176581 ?auto_176585 ) ) ( not ( = ?auto_176581 ?auto_176586 ) ) ( not ( = ?auto_176581 ?auto_176587 ) ) ( not ( = ?auto_176582 ?auto_176583 ) ) ( not ( = ?auto_176582 ?auto_176584 ) ) ( not ( = ?auto_176582 ?auto_176585 ) ) ( not ( = ?auto_176582 ?auto_176586 ) ) ( not ( = ?auto_176582 ?auto_176587 ) ) ( not ( = ?auto_176583 ?auto_176584 ) ) ( not ( = ?auto_176583 ?auto_176585 ) ) ( not ( = ?auto_176583 ?auto_176586 ) ) ( not ( = ?auto_176583 ?auto_176587 ) ) ( not ( = ?auto_176584 ?auto_176585 ) ) ( not ( = ?auto_176584 ?auto_176586 ) ) ( not ( = ?auto_176584 ?auto_176587 ) ) ( not ( = ?auto_176585 ?auto_176586 ) ) ( not ( = ?auto_176585 ?auto_176587 ) ) ( not ( = ?auto_176586 ?auto_176587 ) ) ( not ( = ?auto_176581 ?auto_176588 ) ) ( not ( = ?auto_176582 ?auto_176588 ) ) ( not ( = ?auto_176583 ?auto_176588 ) ) ( not ( = ?auto_176584 ?auto_176588 ) ) ( not ( = ?auto_176585 ?auto_176588 ) ) ( not ( = ?auto_176586 ?auto_176588 ) ) ( not ( = ?auto_176587 ?auto_176588 ) ) ( ON-TABLE ?auto_176588 ) ( ON ?auto_176581 ?auto_176589 ) ( not ( = ?auto_176581 ?auto_176589 ) ) ( not ( = ?auto_176582 ?auto_176589 ) ) ( not ( = ?auto_176583 ?auto_176589 ) ) ( not ( = ?auto_176584 ?auto_176589 ) ) ( not ( = ?auto_176585 ?auto_176589 ) ) ( not ( = ?auto_176586 ?auto_176589 ) ) ( not ( = ?auto_176587 ?auto_176589 ) ) ( not ( = ?auto_176588 ?auto_176589 ) ) ( ON ?auto_176582 ?auto_176581 ) ( ON-TABLE ?auto_176589 ) ( ON ?auto_176583 ?auto_176582 ) ( ON ?auto_176584 ?auto_176583 ) ( ON ?auto_176585 ?auto_176584 ) ( ON ?auto_176586 ?auto_176585 ) ( CLEAR ?auto_176586 ) ( HOLDING ?auto_176587 ) ( CLEAR ?auto_176588 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176588 ?auto_176587 )
      ( MAKE-7PILE ?auto_176581 ?auto_176582 ?auto_176583 ?auto_176584 ?auto_176585 ?auto_176586 ?auto_176587 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176590 - BLOCK
      ?auto_176591 - BLOCK
      ?auto_176592 - BLOCK
      ?auto_176593 - BLOCK
      ?auto_176594 - BLOCK
      ?auto_176595 - BLOCK
      ?auto_176596 - BLOCK
    )
    :vars
    (
      ?auto_176597 - BLOCK
      ?auto_176598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176590 ?auto_176591 ) ) ( not ( = ?auto_176590 ?auto_176592 ) ) ( not ( = ?auto_176590 ?auto_176593 ) ) ( not ( = ?auto_176590 ?auto_176594 ) ) ( not ( = ?auto_176590 ?auto_176595 ) ) ( not ( = ?auto_176590 ?auto_176596 ) ) ( not ( = ?auto_176591 ?auto_176592 ) ) ( not ( = ?auto_176591 ?auto_176593 ) ) ( not ( = ?auto_176591 ?auto_176594 ) ) ( not ( = ?auto_176591 ?auto_176595 ) ) ( not ( = ?auto_176591 ?auto_176596 ) ) ( not ( = ?auto_176592 ?auto_176593 ) ) ( not ( = ?auto_176592 ?auto_176594 ) ) ( not ( = ?auto_176592 ?auto_176595 ) ) ( not ( = ?auto_176592 ?auto_176596 ) ) ( not ( = ?auto_176593 ?auto_176594 ) ) ( not ( = ?auto_176593 ?auto_176595 ) ) ( not ( = ?auto_176593 ?auto_176596 ) ) ( not ( = ?auto_176594 ?auto_176595 ) ) ( not ( = ?auto_176594 ?auto_176596 ) ) ( not ( = ?auto_176595 ?auto_176596 ) ) ( not ( = ?auto_176590 ?auto_176597 ) ) ( not ( = ?auto_176591 ?auto_176597 ) ) ( not ( = ?auto_176592 ?auto_176597 ) ) ( not ( = ?auto_176593 ?auto_176597 ) ) ( not ( = ?auto_176594 ?auto_176597 ) ) ( not ( = ?auto_176595 ?auto_176597 ) ) ( not ( = ?auto_176596 ?auto_176597 ) ) ( ON-TABLE ?auto_176597 ) ( ON ?auto_176590 ?auto_176598 ) ( not ( = ?auto_176590 ?auto_176598 ) ) ( not ( = ?auto_176591 ?auto_176598 ) ) ( not ( = ?auto_176592 ?auto_176598 ) ) ( not ( = ?auto_176593 ?auto_176598 ) ) ( not ( = ?auto_176594 ?auto_176598 ) ) ( not ( = ?auto_176595 ?auto_176598 ) ) ( not ( = ?auto_176596 ?auto_176598 ) ) ( not ( = ?auto_176597 ?auto_176598 ) ) ( ON ?auto_176591 ?auto_176590 ) ( ON-TABLE ?auto_176598 ) ( ON ?auto_176592 ?auto_176591 ) ( ON ?auto_176593 ?auto_176592 ) ( ON ?auto_176594 ?auto_176593 ) ( ON ?auto_176595 ?auto_176594 ) ( CLEAR ?auto_176597 ) ( ON ?auto_176596 ?auto_176595 ) ( CLEAR ?auto_176596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176598 ?auto_176590 ?auto_176591 ?auto_176592 ?auto_176593 ?auto_176594 ?auto_176595 )
      ( MAKE-7PILE ?auto_176590 ?auto_176591 ?auto_176592 ?auto_176593 ?auto_176594 ?auto_176595 ?auto_176596 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176599 - BLOCK
      ?auto_176600 - BLOCK
      ?auto_176601 - BLOCK
      ?auto_176602 - BLOCK
      ?auto_176603 - BLOCK
      ?auto_176604 - BLOCK
      ?auto_176605 - BLOCK
    )
    :vars
    (
      ?auto_176607 - BLOCK
      ?auto_176606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176599 ?auto_176600 ) ) ( not ( = ?auto_176599 ?auto_176601 ) ) ( not ( = ?auto_176599 ?auto_176602 ) ) ( not ( = ?auto_176599 ?auto_176603 ) ) ( not ( = ?auto_176599 ?auto_176604 ) ) ( not ( = ?auto_176599 ?auto_176605 ) ) ( not ( = ?auto_176600 ?auto_176601 ) ) ( not ( = ?auto_176600 ?auto_176602 ) ) ( not ( = ?auto_176600 ?auto_176603 ) ) ( not ( = ?auto_176600 ?auto_176604 ) ) ( not ( = ?auto_176600 ?auto_176605 ) ) ( not ( = ?auto_176601 ?auto_176602 ) ) ( not ( = ?auto_176601 ?auto_176603 ) ) ( not ( = ?auto_176601 ?auto_176604 ) ) ( not ( = ?auto_176601 ?auto_176605 ) ) ( not ( = ?auto_176602 ?auto_176603 ) ) ( not ( = ?auto_176602 ?auto_176604 ) ) ( not ( = ?auto_176602 ?auto_176605 ) ) ( not ( = ?auto_176603 ?auto_176604 ) ) ( not ( = ?auto_176603 ?auto_176605 ) ) ( not ( = ?auto_176604 ?auto_176605 ) ) ( not ( = ?auto_176599 ?auto_176607 ) ) ( not ( = ?auto_176600 ?auto_176607 ) ) ( not ( = ?auto_176601 ?auto_176607 ) ) ( not ( = ?auto_176602 ?auto_176607 ) ) ( not ( = ?auto_176603 ?auto_176607 ) ) ( not ( = ?auto_176604 ?auto_176607 ) ) ( not ( = ?auto_176605 ?auto_176607 ) ) ( ON ?auto_176599 ?auto_176606 ) ( not ( = ?auto_176599 ?auto_176606 ) ) ( not ( = ?auto_176600 ?auto_176606 ) ) ( not ( = ?auto_176601 ?auto_176606 ) ) ( not ( = ?auto_176602 ?auto_176606 ) ) ( not ( = ?auto_176603 ?auto_176606 ) ) ( not ( = ?auto_176604 ?auto_176606 ) ) ( not ( = ?auto_176605 ?auto_176606 ) ) ( not ( = ?auto_176607 ?auto_176606 ) ) ( ON ?auto_176600 ?auto_176599 ) ( ON-TABLE ?auto_176606 ) ( ON ?auto_176601 ?auto_176600 ) ( ON ?auto_176602 ?auto_176601 ) ( ON ?auto_176603 ?auto_176602 ) ( ON ?auto_176604 ?auto_176603 ) ( ON ?auto_176605 ?auto_176604 ) ( CLEAR ?auto_176605 ) ( HOLDING ?auto_176607 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176607 )
      ( MAKE-7PILE ?auto_176599 ?auto_176600 ?auto_176601 ?auto_176602 ?auto_176603 ?auto_176604 ?auto_176605 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176608 - BLOCK
      ?auto_176609 - BLOCK
      ?auto_176610 - BLOCK
      ?auto_176611 - BLOCK
      ?auto_176612 - BLOCK
      ?auto_176613 - BLOCK
      ?auto_176614 - BLOCK
    )
    :vars
    (
      ?auto_176616 - BLOCK
      ?auto_176615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176608 ?auto_176609 ) ) ( not ( = ?auto_176608 ?auto_176610 ) ) ( not ( = ?auto_176608 ?auto_176611 ) ) ( not ( = ?auto_176608 ?auto_176612 ) ) ( not ( = ?auto_176608 ?auto_176613 ) ) ( not ( = ?auto_176608 ?auto_176614 ) ) ( not ( = ?auto_176609 ?auto_176610 ) ) ( not ( = ?auto_176609 ?auto_176611 ) ) ( not ( = ?auto_176609 ?auto_176612 ) ) ( not ( = ?auto_176609 ?auto_176613 ) ) ( not ( = ?auto_176609 ?auto_176614 ) ) ( not ( = ?auto_176610 ?auto_176611 ) ) ( not ( = ?auto_176610 ?auto_176612 ) ) ( not ( = ?auto_176610 ?auto_176613 ) ) ( not ( = ?auto_176610 ?auto_176614 ) ) ( not ( = ?auto_176611 ?auto_176612 ) ) ( not ( = ?auto_176611 ?auto_176613 ) ) ( not ( = ?auto_176611 ?auto_176614 ) ) ( not ( = ?auto_176612 ?auto_176613 ) ) ( not ( = ?auto_176612 ?auto_176614 ) ) ( not ( = ?auto_176613 ?auto_176614 ) ) ( not ( = ?auto_176608 ?auto_176616 ) ) ( not ( = ?auto_176609 ?auto_176616 ) ) ( not ( = ?auto_176610 ?auto_176616 ) ) ( not ( = ?auto_176611 ?auto_176616 ) ) ( not ( = ?auto_176612 ?auto_176616 ) ) ( not ( = ?auto_176613 ?auto_176616 ) ) ( not ( = ?auto_176614 ?auto_176616 ) ) ( ON ?auto_176608 ?auto_176615 ) ( not ( = ?auto_176608 ?auto_176615 ) ) ( not ( = ?auto_176609 ?auto_176615 ) ) ( not ( = ?auto_176610 ?auto_176615 ) ) ( not ( = ?auto_176611 ?auto_176615 ) ) ( not ( = ?auto_176612 ?auto_176615 ) ) ( not ( = ?auto_176613 ?auto_176615 ) ) ( not ( = ?auto_176614 ?auto_176615 ) ) ( not ( = ?auto_176616 ?auto_176615 ) ) ( ON ?auto_176609 ?auto_176608 ) ( ON-TABLE ?auto_176615 ) ( ON ?auto_176610 ?auto_176609 ) ( ON ?auto_176611 ?auto_176610 ) ( ON ?auto_176612 ?auto_176611 ) ( ON ?auto_176613 ?auto_176612 ) ( ON ?auto_176614 ?auto_176613 ) ( ON ?auto_176616 ?auto_176614 ) ( CLEAR ?auto_176616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176615 ?auto_176608 ?auto_176609 ?auto_176610 ?auto_176611 ?auto_176612 ?auto_176613 ?auto_176614 )
      ( MAKE-7PILE ?auto_176608 ?auto_176609 ?auto_176610 ?auto_176611 ?auto_176612 ?auto_176613 ?auto_176614 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176633 - BLOCK
      ?auto_176634 - BLOCK
      ?auto_176635 - BLOCK
      ?auto_176636 - BLOCK
      ?auto_176637 - BLOCK
      ?auto_176638 - BLOCK
      ?auto_176639 - BLOCK
      ?auto_176640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_176639 ) ( ON-TABLE ?auto_176633 ) ( ON ?auto_176634 ?auto_176633 ) ( ON ?auto_176635 ?auto_176634 ) ( ON ?auto_176636 ?auto_176635 ) ( ON ?auto_176637 ?auto_176636 ) ( ON ?auto_176638 ?auto_176637 ) ( ON ?auto_176639 ?auto_176638 ) ( not ( = ?auto_176633 ?auto_176634 ) ) ( not ( = ?auto_176633 ?auto_176635 ) ) ( not ( = ?auto_176633 ?auto_176636 ) ) ( not ( = ?auto_176633 ?auto_176637 ) ) ( not ( = ?auto_176633 ?auto_176638 ) ) ( not ( = ?auto_176633 ?auto_176639 ) ) ( not ( = ?auto_176633 ?auto_176640 ) ) ( not ( = ?auto_176634 ?auto_176635 ) ) ( not ( = ?auto_176634 ?auto_176636 ) ) ( not ( = ?auto_176634 ?auto_176637 ) ) ( not ( = ?auto_176634 ?auto_176638 ) ) ( not ( = ?auto_176634 ?auto_176639 ) ) ( not ( = ?auto_176634 ?auto_176640 ) ) ( not ( = ?auto_176635 ?auto_176636 ) ) ( not ( = ?auto_176635 ?auto_176637 ) ) ( not ( = ?auto_176635 ?auto_176638 ) ) ( not ( = ?auto_176635 ?auto_176639 ) ) ( not ( = ?auto_176635 ?auto_176640 ) ) ( not ( = ?auto_176636 ?auto_176637 ) ) ( not ( = ?auto_176636 ?auto_176638 ) ) ( not ( = ?auto_176636 ?auto_176639 ) ) ( not ( = ?auto_176636 ?auto_176640 ) ) ( not ( = ?auto_176637 ?auto_176638 ) ) ( not ( = ?auto_176637 ?auto_176639 ) ) ( not ( = ?auto_176637 ?auto_176640 ) ) ( not ( = ?auto_176638 ?auto_176639 ) ) ( not ( = ?auto_176638 ?auto_176640 ) ) ( not ( = ?auto_176639 ?auto_176640 ) ) ( ON-TABLE ?auto_176640 ) ( CLEAR ?auto_176640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_176640 )
      ( MAKE-8PILE ?auto_176633 ?auto_176634 ?auto_176635 ?auto_176636 ?auto_176637 ?auto_176638 ?auto_176639 ?auto_176640 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176641 - BLOCK
      ?auto_176642 - BLOCK
      ?auto_176643 - BLOCK
      ?auto_176644 - BLOCK
      ?auto_176645 - BLOCK
      ?auto_176646 - BLOCK
      ?auto_176647 - BLOCK
      ?auto_176648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176641 ) ( ON ?auto_176642 ?auto_176641 ) ( ON ?auto_176643 ?auto_176642 ) ( ON ?auto_176644 ?auto_176643 ) ( ON ?auto_176645 ?auto_176644 ) ( ON ?auto_176646 ?auto_176645 ) ( not ( = ?auto_176641 ?auto_176642 ) ) ( not ( = ?auto_176641 ?auto_176643 ) ) ( not ( = ?auto_176641 ?auto_176644 ) ) ( not ( = ?auto_176641 ?auto_176645 ) ) ( not ( = ?auto_176641 ?auto_176646 ) ) ( not ( = ?auto_176641 ?auto_176647 ) ) ( not ( = ?auto_176641 ?auto_176648 ) ) ( not ( = ?auto_176642 ?auto_176643 ) ) ( not ( = ?auto_176642 ?auto_176644 ) ) ( not ( = ?auto_176642 ?auto_176645 ) ) ( not ( = ?auto_176642 ?auto_176646 ) ) ( not ( = ?auto_176642 ?auto_176647 ) ) ( not ( = ?auto_176642 ?auto_176648 ) ) ( not ( = ?auto_176643 ?auto_176644 ) ) ( not ( = ?auto_176643 ?auto_176645 ) ) ( not ( = ?auto_176643 ?auto_176646 ) ) ( not ( = ?auto_176643 ?auto_176647 ) ) ( not ( = ?auto_176643 ?auto_176648 ) ) ( not ( = ?auto_176644 ?auto_176645 ) ) ( not ( = ?auto_176644 ?auto_176646 ) ) ( not ( = ?auto_176644 ?auto_176647 ) ) ( not ( = ?auto_176644 ?auto_176648 ) ) ( not ( = ?auto_176645 ?auto_176646 ) ) ( not ( = ?auto_176645 ?auto_176647 ) ) ( not ( = ?auto_176645 ?auto_176648 ) ) ( not ( = ?auto_176646 ?auto_176647 ) ) ( not ( = ?auto_176646 ?auto_176648 ) ) ( not ( = ?auto_176647 ?auto_176648 ) ) ( ON-TABLE ?auto_176648 ) ( CLEAR ?auto_176648 ) ( HOLDING ?auto_176647 ) ( CLEAR ?auto_176646 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176641 ?auto_176642 ?auto_176643 ?auto_176644 ?auto_176645 ?auto_176646 ?auto_176647 )
      ( MAKE-8PILE ?auto_176641 ?auto_176642 ?auto_176643 ?auto_176644 ?auto_176645 ?auto_176646 ?auto_176647 ?auto_176648 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176649 - BLOCK
      ?auto_176650 - BLOCK
      ?auto_176651 - BLOCK
      ?auto_176652 - BLOCK
      ?auto_176653 - BLOCK
      ?auto_176654 - BLOCK
      ?auto_176655 - BLOCK
      ?auto_176656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176649 ) ( ON ?auto_176650 ?auto_176649 ) ( ON ?auto_176651 ?auto_176650 ) ( ON ?auto_176652 ?auto_176651 ) ( ON ?auto_176653 ?auto_176652 ) ( ON ?auto_176654 ?auto_176653 ) ( not ( = ?auto_176649 ?auto_176650 ) ) ( not ( = ?auto_176649 ?auto_176651 ) ) ( not ( = ?auto_176649 ?auto_176652 ) ) ( not ( = ?auto_176649 ?auto_176653 ) ) ( not ( = ?auto_176649 ?auto_176654 ) ) ( not ( = ?auto_176649 ?auto_176655 ) ) ( not ( = ?auto_176649 ?auto_176656 ) ) ( not ( = ?auto_176650 ?auto_176651 ) ) ( not ( = ?auto_176650 ?auto_176652 ) ) ( not ( = ?auto_176650 ?auto_176653 ) ) ( not ( = ?auto_176650 ?auto_176654 ) ) ( not ( = ?auto_176650 ?auto_176655 ) ) ( not ( = ?auto_176650 ?auto_176656 ) ) ( not ( = ?auto_176651 ?auto_176652 ) ) ( not ( = ?auto_176651 ?auto_176653 ) ) ( not ( = ?auto_176651 ?auto_176654 ) ) ( not ( = ?auto_176651 ?auto_176655 ) ) ( not ( = ?auto_176651 ?auto_176656 ) ) ( not ( = ?auto_176652 ?auto_176653 ) ) ( not ( = ?auto_176652 ?auto_176654 ) ) ( not ( = ?auto_176652 ?auto_176655 ) ) ( not ( = ?auto_176652 ?auto_176656 ) ) ( not ( = ?auto_176653 ?auto_176654 ) ) ( not ( = ?auto_176653 ?auto_176655 ) ) ( not ( = ?auto_176653 ?auto_176656 ) ) ( not ( = ?auto_176654 ?auto_176655 ) ) ( not ( = ?auto_176654 ?auto_176656 ) ) ( not ( = ?auto_176655 ?auto_176656 ) ) ( ON-TABLE ?auto_176656 ) ( CLEAR ?auto_176654 ) ( ON ?auto_176655 ?auto_176656 ) ( CLEAR ?auto_176655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176656 )
      ( MAKE-8PILE ?auto_176649 ?auto_176650 ?auto_176651 ?auto_176652 ?auto_176653 ?auto_176654 ?auto_176655 ?auto_176656 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176657 - BLOCK
      ?auto_176658 - BLOCK
      ?auto_176659 - BLOCK
      ?auto_176660 - BLOCK
      ?auto_176661 - BLOCK
      ?auto_176662 - BLOCK
      ?auto_176663 - BLOCK
      ?auto_176664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176657 ) ( ON ?auto_176658 ?auto_176657 ) ( ON ?auto_176659 ?auto_176658 ) ( ON ?auto_176660 ?auto_176659 ) ( ON ?auto_176661 ?auto_176660 ) ( not ( = ?auto_176657 ?auto_176658 ) ) ( not ( = ?auto_176657 ?auto_176659 ) ) ( not ( = ?auto_176657 ?auto_176660 ) ) ( not ( = ?auto_176657 ?auto_176661 ) ) ( not ( = ?auto_176657 ?auto_176662 ) ) ( not ( = ?auto_176657 ?auto_176663 ) ) ( not ( = ?auto_176657 ?auto_176664 ) ) ( not ( = ?auto_176658 ?auto_176659 ) ) ( not ( = ?auto_176658 ?auto_176660 ) ) ( not ( = ?auto_176658 ?auto_176661 ) ) ( not ( = ?auto_176658 ?auto_176662 ) ) ( not ( = ?auto_176658 ?auto_176663 ) ) ( not ( = ?auto_176658 ?auto_176664 ) ) ( not ( = ?auto_176659 ?auto_176660 ) ) ( not ( = ?auto_176659 ?auto_176661 ) ) ( not ( = ?auto_176659 ?auto_176662 ) ) ( not ( = ?auto_176659 ?auto_176663 ) ) ( not ( = ?auto_176659 ?auto_176664 ) ) ( not ( = ?auto_176660 ?auto_176661 ) ) ( not ( = ?auto_176660 ?auto_176662 ) ) ( not ( = ?auto_176660 ?auto_176663 ) ) ( not ( = ?auto_176660 ?auto_176664 ) ) ( not ( = ?auto_176661 ?auto_176662 ) ) ( not ( = ?auto_176661 ?auto_176663 ) ) ( not ( = ?auto_176661 ?auto_176664 ) ) ( not ( = ?auto_176662 ?auto_176663 ) ) ( not ( = ?auto_176662 ?auto_176664 ) ) ( not ( = ?auto_176663 ?auto_176664 ) ) ( ON-TABLE ?auto_176664 ) ( ON ?auto_176663 ?auto_176664 ) ( CLEAR ?auto_176663 ) ( HOLDING ?auto_176662 ) ( CLEAR ?auto_176661 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176657 ?auto_176658 ?auto_176659 ?auto_176660 ?auto_176661 ?auto_176662 )
      ( MAKE-8PILE ?auto_176657 ?auto_176658 ?auto_176659 ?auto_176660 ?auto_176661 ?auto_176662 ?auto_176663 ?auto_176664 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176665 - BLOCK
      ?auto_176666 - BLOCK
      ?auto_176667 - BLOCK
      ?auto_176668 - BLOCK
      ?auto_176669 - BLOCK
      ?auto_176670 - BLOCK
      ?auto_176671 - BLOCK
      ?auto_176672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176665 ) ( ON ?auto_176666 ?auto_176665 ) ( ON ?auto_176667 ?auto_176666 ) ( ON ?auto_176668 ?auto_176667 ) ( ON ?auto_176669 ?auto_176668 ) ( not ( = ?auto_176665 ?auto_176666 ) ) ( not ( = ?auto_176665 ?auto_176667 ) ) ( not ( = ?auto_176665 ?auto_176668 ) ) ( not ( = ?auto_176665 ?auto_176669 ) ) ( not ( = ?auto_176665 ?auto_176670 ) ) ( not ( = ?auto_176665 ?auto_176671 ) ) ( not ( = ?auto_176665 ?auto_176672 ) ) ( not ( = ?auto_176666 ?auto_176667 ) ) ( not ( = ?auto_176666 ?auto_176668 ) ) ( not ( = ?auto_176666 ?auto_176669 ) ) ( not ( = ?auto_176666 ?auto_176670 ) ) ( not ( = ?auto_176666 ?auto_176671 ) ) ( not ( = ?auto_176666 ?auto_176672 ) ) ( not ( = ?auto_176667 ?auto_176668 ) ) ( not ( = ?auto_176667 ?auto_176669 ) ) ( not ( = ?auto_176667 ?auto_176670 ) ) ( not ( = ?auto_176667 ?auto_176671 ) ) ( not ( = ?auto_176667 ?auto_176672 ) ) ( not ( = ?auto_176668 ?auto_176669 ) ) ( not ( = ?auto_176668 ?auto_176670 ) ) ( not ( = ?auto_176668 ?auto_176671 ) ) ( not ( = ?auto_176668 ?auto_176672 ) ) ( not ( = ?auto_176669 ?auto_176670 ) ) ( not ( = ?auto_176669 ?auto_176671 ) ) ( not ( = ?auto_176669 ?auto_176672 ) ) ( not ( = ?auto_176670 ?auto_176671 ) ) ( not ( = ?auto_176670 ?auto_176672 ) ) ( not ( = ?auto_176671 ?auto_176672 ) ) ( ON-TABLE ?auto_176672 ) ( ON ?auto_176671 ?auto_176672 ) ( CLEAR ?auto_176669 ) ( ON ?auto_176670 ?auto_176671 ) ( CLEAR ?auto_176670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176672 ?auto_176671 )
      ( MAKE-8PILE ?auto_176665 ?auto_176666 ?auto_176667 ?auto_176668 ?auto_176669 ?auto_176670 ?auto_176671 ?auto_176672 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176673 - BLOCK
      ?auto_176674 - BLOCK
      ?auto_176675 - BLOCK
      ?auto_176676 - BLOCK
      ?auto_176677 - BLOCK
      ?auto_176678 - BLOCK
      ?auto_176679 - BLOCK
      ?auto_176680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176673 ) ( ON ?auto_176674 ?auto_176673 ) ( ON ?auto_176675 ?auto_176674 ) ( ON ?auto_176676 ?auto_176675 ) ( not ( = ?auto_176673 ?auto_176674 ) ) ( not ( = ?auto_176673 ?auto_176675 ) ) ( not ( = ?auto_176673 ?auto_176676 ) ) ( not ( = ?auto_176673 ?auto_176677 ) ) ( not ( = ?auto_176673 ?auto_176678 ) ) ( not ( = ?auto_176673 ?auto_176679 ) ) ( not ( = ?auto_176673 ?auto_176680 ) ) ( not ( = ?auto_176674 ?auto_176675 ) ) ( not ( = ?auto_176674 ?auto_176676 ) ) ( not ( = ?auto_176674 ?auto_176677 ) ) ( not ( = ?auto_176674 ?auto_176678 ) ) ( not ( = ?auto_176674 ?auto_176679 ) ) ( not ( = ?auto_176674 ?auto_176680 ) ) ( not ( = ?auto_176675 ?auto_176676 ) ) ( not ( = ?auto_176675 ?auto_176677 ) ) ( not ( = ?auto_176675 ?auto_176678 ) ) ( not ( = ?auto_176675 ?auto_176679 ) ) ( not ( = ?auto_176675 ?auto_176680 ) ) ( not ( = ?auto_176676 ?auto_176677 ) ) ( not ( = ?auto_176676 ?auto_176678 ) ) ( not ( = ?auto_176676 ?auto_176679 ) ) ( not ( = ?auto_176676 ?auto_176680 ) ) ( not ( = ?auto_176677 ?auto_176678 ) ) ( not ( = ?auto_176677 ?auto_176679 ) ) ( not ( = ?auto_176677 ?auto_176680 ) ) ( not ( = ?auto_176678 ?auto_176679 ) ) ( not ( = ?auto_176678 ?auto_176680 ) ) ( not ( = ?auto_176679 ?auto_176680 ) ) ( ON-TABLE ?auto_176680 ) ( ON ?auto_176679 ?auto_176680 ) ( ON ?auto_176678 ?auto_176679 ) ( CLEAR ?auto_176678 ) ( HOLDING ?auto_176677 ) ( CLEAR ?auto_176676 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176673 ?auto_176674 ?auto_176675 ?auto_176676 ?auto_176677 )
      ( MAKE-8PILE ?auto_176673 ?auto_176674 ?auto_176675 ?auto_176676 ?auto_176677 ?auto_176678 ?auto_176679 ?auto_176680 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176681 - BLOCK
      ?auto_176682 - BLOCK
      ?auto_176683 - BLOCK
      ?auto_176684 - BLOCK
      ?auto_176685 - BLOCK
      ?auto_176686 - BLOCK
      ?auto_176687 - BLOCK
      ?auto_176688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176681 ) ( ON ?auto_176682 ?auto_176681 ) ( ON ?auto_176683 ?auto_176682 ) ( ON ?auto_176684 ?auto_176683 ) ( not ( = ?auto_176681 ?auto_176682 ) ) ( not ( = ?auto_176681 ?auto_176683 ) ) ( not ( = ?auto_176681 ?auto_176684 ) ) ( not ( = ?auto_176681 ?auto_176685 ) ) ( not ( = ?auto_176681 ?auto_176686 ) ) ( not ( = ?auto_176681 ?auto_176687 ) ) ( not ( = ?auto_176681 ?auto_176688 ) ) ( not ( = ?auto_176682 ?auto_176683 ) ) ( not ( = ?auto_176682 ?auto_176684 ) ) ( not ( = ?auto_176682 ?auto_176685 ) ) ( not ( = ?auto_176682 ?auto_176686 ) ) ( not ( = ?auto_176682 ?auto_176687 ) ) ( not ( = ?auto_176682 ?auto_176688 ) ) ( not ( = ?auto_176683 ?auto_176684 ) ) ( not ( = ?auto_176683 ?auto_176685 ) ) ( not ( = ?auto_176683 ?auto_176686 ) ) ( not ( = ?auto_176683 ?auto_176687 ) ) ( not ( = ?auto_176683 ?auto_176688 ) ) ( not ( = ?auto_176684 ?auto_176685 ) ) ( not ( = ?auto_176684 ?auto_176686 ) ) ( not ( = ?auto_176684 ?auto_176687 ) ) ( not ( = ?auto_176684 ?auto_176688 ) ) ( not ( = ?auto_176685 ?auto_176686 ) ) ( not ( = ?auto_176685 ?auto_176687 ) ) ( not ( = ?auto_176685 ?auto_176688 ) ) ( not ( = ?auto_176686 ?auto_176687 ) ) ( not ( = ?auto_176686 ?auto_176688 ) ) ( not ( = ?auto_176687 ?auto_176688 ) ) ( ON-TABLE ?auto_176688 ) ( ON ?auto_176687 ?auto_176688 ) ( ON ?auto_176686 ?auto_176687 ) ( CLEAR ?auto_176684 ) ( ON ?auto_176685 ?auto_176686 ) ( CLEAR ?auto_176685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176688 ?auto_176687 ?auto_176686 )
      ( MAKE-8PILE ?auto_176681 ?auto_176682 ?auto_176683 ?auto_176684 ?auto_176685 ?auto_176686 ?auto_176687 ?auto_176688 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176689 - BLOCK
      ?auto_176690 - BLOCK
      ?auto_176691 - BLOCK
      ?auto_176692 - BLOCK
      ?auto_176693 - BLOCK
      ?auto_176694 - BLOCK
      ?auto_176695 - BLOCK
      ?auto_176696 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176689 ) ( ON ?auto_176690 ?auto_176689 ) ( ON ?auto_176691 ?auto_176690 ) ( not ( = ?auto_176689 ?auto_176690 ) ) ( not ( = ?auto_176689 ?auto_176691 ) ) ( not ( = ?auto_176689 ?auto_176692 ) ) ( not ( = ?auto_176689 ?auto_176693 ) ) ( not ( = ?auto_176689 ?auto_176694 ) ) ( not ( = ?auto_176689 ?auto_176695 ) ) ( not ( = ?auto_176689 ?auto_176696 ) ) ( not ( = ?auto_176690 ?auto_176691 ) ) ( not ( = ?auto_176690 ?auto_176692 ) ) ( not ( = ?auto_176690 ?auto_176693 ) ) ( not ( = ?auto_176690 ?auto_176694 ) ) ( not ( = ?auto_176690 ?auto_176695 ) ) ( not ( = ?auto_176690 ?auto_176696 ) ) ( not ( = ?auto_176691 ?auto_176692 ) ) ( not ( = ?auto_176691 ?auto_176693 ) ) ( not ( = ?auto_176691 ?auto_176694 ) ) ( not ( = ?auto_176691 ?auto_176695 ) ) ( not ( = ?auto_176691 ?auto_176696 ) ) ( not ( = ?auto_176692 ?auto_176693 ) ) ( not ( = ?auto_176692 ?auto_176694 ) ) ( not ( = ?auto_176692 ?auto_176695 ) ) ( not ( = ?auto_176692 ?auto_176696 ) ) ( not ( = ?auto_176693 ?auto_176694 ) ) ( not ( = ?auto_176693 ?auto_176695 ) ) ( not ( = ?auto_176693 ?auto_176696 ) ) ( not ( = ?auto_176694 ?auto_176695 ) ) ( not ( = ?auto_176694 ?auto_176696 ) ) ( not ( = ?auto_176695 ?auto_176696 ) ) ( ON-TABLE ?auto_176696 ) ( ON ?auto_176695 ?auto_176696 ) ( ON ?auto_176694 ?auto_176695 ) ( ON ?auto_176693 ?auto_176694 ) ( CLEAR ?auto_176693 ) ( HOLDING ?auto_176692 ) ( CLEAR ?auto_176691 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176689 ?auto_176690 ?auto_176691 ?auto_176692 )
      ( MAKE-8PILE ?auto_176689 ?auto_176690 ?auto_176691 ?auto_176692 ?auto_176693 ?auto_176694 ?auto_176695 ?auto_176696 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176697 - BLOCK
      ?auto_176698 - BLOCK
      ?auto_176699 - BLOCK
      ?auto_176700 - BLOCK
      ?auto_176701 - BLOCK
      ?auto_176702 - BLOCK
      ?auto_176703 - BLOCK
      ?auto_176704 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176697 ) ( ON ?auto_176698 ?auto_176697 ) ( ON ?auto_176699 ?auto_176698 ) ( not ( = ?auto_176697 ?auto_176698 ) ) ( not ( = ?auto_176697 ?auto_176699 ) ) ( not ( = ?auto_176697 ?auto_176700 ) ) ( not ( = ?auto_176697 ?auto_176701 ) ) ( not ( = ?auto_176697 ?auto_176702 ) ) ( not ( = ?auto_176697 ?auto_176703 ) ) ( not ( = ?auto_176697 ?auto_176704 ) ) ( not ( = ?auto_176698 ?auto_176699 ) ) ( not ( = ?auto_176698 ?auto_176700 ) ) ( not ( = ?auto_176698 ?auto_176701 ) ) ( not ( = ?auto_176698 ?auto_176702 ) ) ( not ( = ?auto_176698 ?auto_176703 ) ) ( not ( = ?auto_176698 ?auto_176704 ) ) ( not ( = ?auto_176699 ?auto_176700 ) ) ( not ( = ?auto_176699 ?auto_176701 ) ) ( not ( = ?auto_176699 ?auto_176702 ) ) ( not ( = ?auto_176699 ?auto_176703 ) ) ( not ( = ?auto_176699 ?auto_176704 ) ) ( not ( = ?auto_176700 ?auto_176701 ) ) ( not ( = ?auto_176700 ?auto_176702 ) ) ( not ( = ?auto_176700 ?auto_176703 ) ) ( not ( = ?auto_176700 ?auto_176704 ) ) ( not ( = ?auto_176701 ?auto_176702 ) ) ( not ( = ?auto_176701 ?auto_176703 ) ) ( not ( = ?auto_176701 ?auto_176704 ) ) ( not ( = ?auto_176702 ?auto_176703 ) ) ( not ( = ?auto_176702 ?auto_176704 ) ) ( not ( = ?auto_176703 ?auto_176704 ) ) ( ON-TABLE ?auto_176704 ) ( ON ?auto_176703 ?auto_176704 ) ( ON ?auto_176702 ?auto_176703 ) ( ON ?auto_176701 ?auto_176702 ) ( CLEAR ?auto_176699 ) ( ON ?auto_176700 ?auto_176701 ) ( CLEAR ?auto_176700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176704 ?auto_176703 ?auto_176702 ?auto_176701 )
      ( MAKE-8PILE ?auto_176697 ?auto_176698 ?auto_176699 ?auto_176700 ?auto_176701 ?auto_176702 ?auto_176703 ?auto_176704 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176705 - BLOCK
      ?auto_176706 - BLOCK
      ?auto_176707 - BLOCK
      ?auto_176708 - BLOCK
      ?auto_176709 - BLOCK
      ?auto_176710 - BLOCK
      ?auto_176711 - BLOCK
      ?auto_176712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176705 ) ( ON ?auto_176706 ?auto_176705 ) ( not ( = ?auto_176705 ?auto_176706 ) ) ( not ( = ?auto_176705 ?auto_176707 ) ) ( not ( = ?auto_176705 ?auto_176708 ) ) ( not ( = ?auto_176705 ?auto_176709 ) ) ( not ( = ?auto_176705 ?auto_176710 ) ) ( not ( = ?auto_176705 ?auto_176711 ) ) ( not ( = ?auto_176705 ?auto_176712 ) ) ( not ( = ?auto_176706 ?auto_176707 ) ) ( not ( = ?auto_176706 ?auto_176708 ) ) ( not ( = ?auto_176706 ?auto_176709 ) ) ( not ( = ?auto_176706 ?auto_176710 ) ) ( not ( = ?auto_176706 ?auto_176711 ) ) ( not ( = ?auto_176706 ?auto_176712 ) ) ( not ( = ?auto_176707 ?auto_176708 ) ) ( not ( = ?auto_176707 ?auto_176709 ) ) ( not ( = ?auto_176707 ?auto_176710 ) ) ( not ( = ?auto_176707 ?auto_176711 ) ) ( not ( = ?auto_176707 ?auto_176712 ) ) ( not ( = ?auto_176708 ?auto_176709 ) ) ( not ( = ?auto_176708 ?auto_176710 ) ) ( not ( = ?auto_176708 ?auto_176711 ) ) ( not ( = ?auto_176708 ?auto_176712 ) ) ( not ( = ?auto_176709 ?auto_176710 ) ) ( not ( = ?auto_176709 ?auto_176711 ) ) ( not ( = ?auto_176709 ?auto_176712 ) ) ( not ( = ?auto_176710 ?auto_176711 ) ) ( not ( = ?auto_176710 ?auto_176712 ) ) ( not ( = ?auto_176711 ?auto_176712 ) ) ( ON-TABLE ?auto_176712 ) ( ON ?auto_176711 ?auto_176712 ) ( ON ?auto_176710 ?auto_176711 ) ( ON ?auto_176709 ?auto_176710 ) ( ON ?auto_176708 ?auto_176709 ) ( CLEAR ?auto_176708 ) ( HOLDING ?auto_176707 ) ( CLEAR ?auto_176706 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176705 ?auto_176706 ?auto_176707 )
      ( MAKE-8PILE ?auto_176705 ?auto_176706 ?auto_176707 ?auto_176708 ?auto_176709 ?auto_176710 ?auto_176711 ?auto_176712 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176713 - BLOCK
      ?auto_176714 - BLOCK
      ?auto_176715 - BLOCK
      ?auto_176716 - BLOCK
      ?auto_176717 - BLOCK
      ?auto_176718 - BLOCK
      ?auto_176719 - BLOCK
      ?auto_176720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176713 ) ( ON ?auto_176714 ?auto_176713 ) ( not ( = ?auto_176713 ?auto_176714 ) ) ( not ( = ?auto_176713 ?auto_176715 ) ) ( not ( = ?auto_176713 ?auto_176716 ) ) ( not ( = ?auto_176713 ?auto_176717 ) ) ( not ( = ?auto_176713 ?auto_176718 ) ) ( not ( = ?auto_176713 ?auto_176719 ) ) ( not ( = ?auto_176713 ?auto_176720 ) ) ( not ( = ?auto_176714 ?auto_176715 ) ) ( not ( = ?auto_176714 ?auto_176716 ) ) ( not ( = ?auto_176714 ?auto_176717 ) ) ( not ( = ?auto_176714 ?auto_176718 ) ) ( not ( = ?auto_176714 ?auto_176719 ) ) ( not ( = ?auto_176714 ?auto_176720 ) ) ( not ( = ?auto_176715 ?auto_176716 ) ) ( not ( = ?auto_176715 ?auto_176717 ) ) ( not ( = ?auto_176715 ?auto_176718 ) ) ( not ( = ?auto_176715 ?auto_176719 ) ) ( not ( = ?auto_176715 ?auto_176720 ) ) ( not ( = ?auto_176716 ?auto_176717 ) ) ( not ( = ?auto_176716 ?auto_176718 ) ) ( not ( = ?auto_176716 ?auto_176719 ) ) ( not ( = ?auto_176716 ?auto_176720 ) ) ( not ( = ?auto_176717 ?auto_176718 ) ) ( not ( = ?auto_176717 ?auto_176719 ) ) ( not ( = ?auto_176717 ?auto_176720 ) ) ( not ( = ?auto_176718 ?auto_176719 ) ) ( not ( = ?auto_176718 ?auto_176720 ) ) ( not ( = ?auto_176719 ?auto_176720 ) ) ( ON-TABLE ?auto_176720 ) ( ON ?auto_176719 ?auto_176720 ) ( ON ?auto_176718 ?auto_176719 ) ( ON ?auto_176717 ?auto_176718 ) ( ON ?auto_176716 ?auto_176717 ) ( CLEAR ?auto_176714 ) ( ON ?auto_176715 ?auto_176716 ) ( CLEAR ?auto_176715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176720 ?auto_176719 ?auto_176718 ?auto_176717 ?auto_176716 )
      ( MAKE-8PILE ?auto_176713 ?auto_176714 ?auto_176715 ?auto_176716 ?auto_176717 ?auto_176718 ?auto_176719 ?auto_176720 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176721 - BLOCK
      ?auto_176722 - BLOCK
      ?auto_176723 - BLOCK
      ?auto_176724 - BLOCK
      ?auto_176725 - BLOCK
      ?auto_176726 - BLOCK
      ?auto_176727 - BLOCK
      ?auto_176728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176721 ) ( not ( = ?auto_176721 ?auto_176722 ) ) ( not ( = ?auto_176721 ?auto_176723 ) ) ( not ( = ?auto_176721 ?auto_176724 ) ) ( not ( = ?auto_176721 ?auto_176725 ) ) ( not ( = ?auto_176721 ?auto_176726 ) ) ( not ( = ?auto_176721 ?auto_176727 ) ) ( not ( = ?auto_176721 ?auto_176728 ) ) ( not ( = ?auto_176722 ?auto_176723 ) ) ( not ( = ?auto_176722 ?auto_176724 ) ) ( not ( = ?auto_176722 ?auto_176725 ) ) ( not ( = ?auto_176722 ?auto_176726 ) ) ( not ( = ?auto_176722 ?auto_176727 ) ) ( not ( = ?auto_176722 ?auto_176728 ) ) ( not ( = ?auto_176723 ?auto_176724 ) ) ( not ( = ?auto_176723 ?auto_176725 ) ) ( not ( = ?auto_176723 ?auto_176726 ) ) ( not ( = ?auto_176723 ?auto_176727 ) ) ( not ( = ?auto_176723 ?auto_176728 ) ) ( not ( = ?auto_176724 ?auto_176725 ) ) ( not ( = ?auto_176724 ?auto_176726 ) ) ( not ( = ?auto_176724 ?auto_176727 ) ) ( not ( = ?auto_176724 ?auto_176728 ) ) ( not ( = ?auto_176725 ?auto_176726 ) ) ( not ( = ?auto_176725 ?auto_176727 ) ) ( not ( = ?auto_176725 ?auto_176728 ) ) ( not ( = ?auto_176726 ?auto_176727 ) ) ( not ( = ?auto_176726 ?auto_176728 ) ) ( not ( = ?auto_176727 ?auto_176728 ) ) ( ON-TABLE ?auto_176728 ) ( ON ?auto_176727 ?auto_176728 ) ( ON ?auto_176726 ?auto_176727 ) ( ON ?auto_176725 ?auto_176726 ) ( ON ?auto_176724 ?auto_176725 ) ( ON ?auto_176723 ?auto_176724 ) ( CLEAR ?auto_176723 ) ( HOLDING ?auto_176722 ) ( CLEAR ?auto_176721 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176721 ?auto_176722 )
      ( MAKE-8PILE ?auto_176721 ?auto_176722 ?auto_176723 ?auto_176724 ?auto_176725 ?auto_176726 ?auto_176727 ?auto_176728 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176729 - BLOCK
      ?auto_176730 - BLOCK
      ?auto_176731 - BLOCK
      ?auto_176732 - BLOCK
      ?auto_176733 - BLOCK
      ?auto_176734 - BLOCK
      ?auto_176735 - BLOCK
      ?auto_176736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176729 ) ( not ( = ?auto_176729 ?auto_176730 ) ) ( not ( = ?auto_176729 ?auto_176731 ) ) ( not ( = ?auto_176729 ?auto_176732 ) ) ( not ( = ?auto_176729 ?auto_176733 ) ) ( not ( = ?auto_176729 ?auto_176734 ) ) ( not ( = ?auto_176729 ?auto_176735 ) ) ( not ( = ?auto_176729 ?auto_176736 ) ) ( not ( = ?auto_176730 ?auto_176731 ) ) ( not ( = ?auto_176730 ?auto_176732 ) ) ( not ( = ?auto_176730 ?auto_176733 ) ) ( not ( = ?auto_176730 ?auto_176734 ) ) ( not ( = ?auto_176730 ?auto_176735 ) ) ( not ( = ?auto_176730 ?auto_176736 ) ) ( not ( = ?auto_176731 ?auto_176732 ) ) ( not ( = ?auto_176731 ?auto_176733 ) ) ( not ( = ?auto_176731 ?auto_176734 ) ) ( not ( = ?auto_176731 ?auto_176735 ) ) ( not ( = ?auto_176731 ?auto_176736 ) ) ( not ( = ?auto_176732 ?auto_176733 ) ) ( not ( = ?auto_176732 ?auto_176734 ) ) ( not ( = ?auto_176732 ?auto_176735 ) ) ( not ( = ?auto_176732 ?auto_176736 ) ) ( not ( = ?auto_176733 ?auto_176734 ) ) ( not ( = ?auto_176733 ?auto_176735 ) ) ( not ( = ?auto_176733 ?auto_176736 ) ) ( not ( = ?auto_176734 ?auto_176735 ) ) ( not ( = ?auto_176734 ?auto_176736 ) ) ( not ( = ?auto_176735 ?auto_176736 ) ) ( ON-TABLE ?auto_176736 ) ( ON ?auto_176735 ?auto_176736 ) ( ON ?auto_176734 ?auto_176735 ) ( ON ?auto_176733 ?auto_176734 ) ( ON ?auto_176732 ?auto_176733 ) ( ON ?auto_176731 ?auto_176732 ) ( CLEAR ?auto_176729 ) ( ON ?auto_176730 ?auto_176731 ) ( CLEAR ?auto_176730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176736 ?auto_176735 ?auto_176734 ?auto_176733 ?auto_176732 ?auto_176731 )
      ( MAKE-8PILE ?auto_176729 ?auto_176730 ?auto_176731 ?auto_176732 ?auto_176733 ?auto_176734 ?auto_176735 ?auto_176736 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176737 - BLOCK
      ?auto_176738 - BLOCK
      ?auto_176739 - BLOCK
      ?auto_176740 - BLOCK
      ?auto_176741 - BLOCK
      ?auto_176742 - BLOCK
      ?auto_176743 - BLOCK
      ?auto_176744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176737 ?auto_176738 ) ) ( not ( = ?auto_176737 ?auto_176739 ) ) ( not ( = ?auto_176737 ?auto_176740 ) ) ( not ( = ?auto_176737 ?auto_176741 ) ) ( not ( = ?auto_176737 ?auto_176742 ) ) ( not ( = ?auto_176737 ?auto_176743 ) ) ( not ( = ?auto_176737 ?auto_176744 ) ) ( not ( = ?auto_176738 ?auto_176739 ) ) ( not ( = ?auto_176738 ?auto_176740 ) ) ( not ( = ?auto_176738 ?auto_176741 ) ) ( not ( = ?auto_176738 ?auto_176742 ) ) ( not ( = ?auto_176738 ?auto_176743 ) ) ( not ( = ?auto_176738 ?auto_176744 ) ) ( not ( = ?auto_176739 ?auto_176740 ) ) ( not ( = ?auto_176739 ?auto_176741 ) ) ( not ( = ?auto_176739 ?auto_176742 ) ) ( not ( = ?auto_176739 ?auto_176743 ) ) ( not ( = ?auto_176739 ?auto_176744 ) ) ( not ( = ?auto_176740 ?auto_176741 ) ) ( not ( = ?auto_176740 ?auto_176742 ) ) ( not ( = ?auto_176740 ?auto_176743 ) ) ( not ( = ?auto_176740 ?auto_176744 ) ) ( not ( = ?auto_176741 ?auto_176742 ) ) ( not ( = ?auto_176741 ?auto_176743 ) ) ( not ( = ?auto_176741 ?auto_176744 ) ) ( not ( = ?auto_176742 ?auto_176743 ) ) ( not ( = ?auto_176742 ?auto_176744 ) ) ( not ( = ?auto_176743 ?auto_176744 ) ) ( ON-TABLE ?auto_176744 ) ( ON ?auto_176743 ?auto_176744 ) ( ON ?auto_176742 ?auto_176743 ) ( ON ?auto_176741 ?auto_176742 ) ( ON ?auto_176740 ?auto_176741 ) ( ON ?auto_176739 ?auto_176740 ) ( ON ?auto_176738 ?auto_176739 ) ( CLEAR ?auto_176738 ) ( HOLDING ?auto_176737 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176737 )
      ( MAKE-8PILE ?auto_176737 ?auto_176738 ?auto_176739 ?auto_176740 ?auto_176741 ?auto_176742 ?auto_176743 ?auto_176744 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176745 - BLOCK
      ?auto_176746 - BLOCK
      ?auto_176747 - BLOCK
      ?auto_176748 - BLOCK
      ?auto_176749 - BLOCK
      ?auto_176750 - BLOCK
      ?auto_176751 - BLOCK
      ?auto_176752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176745 ?auto_176746 ) ) ( not ( = ?auto_176745 ?auto_176747 ) ) ( not ( = ?auto_176745 ?auto_176748 ) ) ( not ( = ?auto_176745 ?auto_176749 ) ) ( not ( = ?auto_176745 ?auto_176750 ) ) ( not ( = ?auto_176745 ?auto_176751 ) ) ( not ( = ?auto_176745 ?auto_176752 ) ) ( not ( = ?auto_176746 ?auto_176747 ) ) ( not ( = ?auto_176746 ?auto_176748 ) ) ( not ( = ?auto_176746 ?auto_176749 ) ) ( not ( = ?auto_176746 ?auto_176750 ) ) ( not ( = ?auto_176746 ?auto_176751 ) ) ( not ( = ?auto_176746 ?auto_176752 ) ) ( not ( = ?auto_176747 ?auto_176748 ) ) ( not ( = ?auto_176747 ?auto_176749 ) ) ( not ( = ?auto_176747 ?auto_176750 ) ) ( not ( = ?auto_176747 ?auto_176751 ) ) ( not ( = ?auto_176747 ?auto_176752 ) ) ( not ( = ?auto_176748 ?auto_176749 ) ) ( not ( = ?auto_176748 ?auto_176750 ) ) ( not ( = ?auto_176748 ?auto_176751 ) ) ( not ( = ?auto_176748 ?auto_176752 ) ) ( not ( = ?auto_176749 ?auto_176750 ) ) ( not ( = ?auto_176749 ?auto_176751 ) ) ( not ( = ?auto_176749 ?auto_176752 ) ) ( not ( = ?auto_176750 ?auto_176751 ) ) ( not ( = ?auto_176750 ?auto_176752 ) ) ( not ( = ?auto_176751 ?auto_176752 ) ) ( ON-TABLE ?auto_176752 ) ( ON ?auto_176751 ?auto_176752 ) ( ON ?auto_176750 ?auto_176751 ) ( ON ?auto_176749 ?auto_176750 ) ( ON ?auto_176748 ?auto_176749 ) ( ON ?auto_176747 ?auto_176748 ) ( ON ?auto_176746 ?auto_176747 ) ( ON ?auto_176745 ?auto_176746 ) ( CLEAR ?auto_176745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176752 ?auto_176751 ?auto_176750 ?auto_176749 ?auto_176748 ?auto_176747 ?auto_176746 )
      ( MAKE-8PILE ?auto_176745 ?auto_176746 ?auto_176747 ?auto_176748 ?auto_176749 ?auto_176750 ?auto_176751 ?auto_176752 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176761 - BLOCK
      ?auto_176762 - BLOCK
      ?auto_176763 - BLOCK
      ?auto_176764 - BLOCK
      ?auto_176765 - BLOCK
      ?auto_176766 - BLOCK
      ?auto_176767 - BLOCK
      ?auto_176768 - BLOCK
    )
    :vars
    (
      ?auto_176769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176761 ?auto_176762 ) ) ( not ( = ?auto_176761 ?auto_176763 ) ) ( not ( = ?auto_176761 ?auto_176764 ) ) ( not ( = ?auto_176761 ?auto_176765 ) ) ( not ( = ?auto_176761 ?auto_176766 ) ) ( not ( = ?auto_176761 ?auto_176767 ) ) ( not ( = ?auto_176761 ?auto_176768 ) ) ( not ( = ?auto_176762 ?auto_176763 ) ) ( not ( = ?auto_176762 ?auto_176764 ) ) ( not ( = ?auto_176762 ?auto_176765 ) ) ( not ( = ?auto_176762 ?auto_176766 ) ) ( not ( = ?auto_176762 ?auto_176767 ) ) ( not ( = ?auto_176762 ?auto_176768 ) ) ( not ( = ?auto_176763 ?auto_176764 ) ) ( not ( = ?auto_176763 ?auto_176765 ) ) ( not ( = ?auto_176763 ?auto_176766 ) ) ( not ( = ?auto_176763 ?auto_176767 ) ) ( not ( = ?auto_176763 ?auto_176768 ) ) ( not ( = ?auto_176764 ?auto_176765 ) ) ( not ( = ?auto_176764 ?auto_176766 ) ) ( not ( = ?auto_176764 ?auto_176767 ) ) ( not ( = ?auto_176764 ?auto_176768 ) ) ( not ( = ?auto_176765 ?auto_176766 ) ) ( not ( = ?auto_176765 ?auto_176767 ) ) ( not ( = ?auto_176765 ?auto_176768 ) ) ( not ( = ?auto_176766 ?auto_176767 ) ) ( not ( = ?auto_176766 ?auto_176768 ) ) ( not ( = ?auto_176767 ?auto_176768 ) ) ( ON-TABLE ?auto_176768 ) ( ON ?auto_176767 ?auto_176768 ) ( ON ?auto_176766 ?auto_176767 ) ( ON ?auto_176765 ?auto_176766 ) ( ON ?auto_176764 ?auto_176765 ) ( ON ?auto_176763 ?auto_176764 ) ( ON ?auto_176762 ?auto_176763 ) ( CLEAR ?auto_176762 ) ( ON ?auto_176761 ?auto_176769 ) ( CLEAR ?auto_176761 ) ( HAND-EMPTY ) ( not ( = ?auto_176761 ?auto_176769 ) ) ( not ( = ?auto_176762 ?auto_176769 ) ) ( not ( = ?auto_176763 ?auto_176769 ) ) ( not ( = ?auto_176764 ?auto_176769 ) ) ( not ( = ?auto_176765 ?auto_176769 ) ) ( not ( = ?auto_176766 ?auto_176769 ) ) ( not ( = ?auto_176767 ?auto_176769 ) ) ( not ( = ?auto_176768 ?auto_176769 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176761 ?auto_176769 )
      ( MAKE-8PILE ?auto_176761 ?auto_176762 ?auto_176763 ?auto_176764 ?auto_176765 ?auto_176766 ?auto_176767 ?auto_176768 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176770 - BLOCK
      ?auto_176771 - BLOCK
      ?auto_176772 - BLOCK
      ?auto_176773 - BLOCK
      ?auto_176774 - BLOCK
      ?auto_176775 - BLOCK
      ?auto_176776 - BLOCK
      ?auto_176777 - BLOCK
    )
    :vars
    (
      ?auto_176778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176770 ?auto_176771 ) ) ( not ( = ?auto_176770 ?auto_176772 ) ) ( not ( = ?auto_176770 ?auto_176773 ) ) ( not ( = ?auto_176770 ?auto_176774 ) ) ( not ( = ?auto_176770 ?auto_176775 ) ) ( not ( = ?auto_176770 ?auto_176776 ) ) ( not ( = ?auto_176770 ?auto_176777 ) ) ( not ( = ?auto_176771 ?auto_176772 ) ) ( not ( = ?auto_176771 ?auto_176773 ) ) ( not ( = ?auto_176771 ?auto_176774 ) ) ( not ( = ?auto_176771 ?auto_176775 ) ) ( not ( = ?auto_176771 ?auto_176776 ) ) ( not ( = ?auto_176771 ?auto_176777 ) ) ( not ( = ?auto_176772 ?auto_176773 ) ) ( not ( = ?auto_176772 ?auto_176774 ) ) ( not ( = ?auto_176772 ?auto_176775 ) ) ( not ( = ?auto_176772 ?auto_176776 ) ) ( not ( = ?auto_176772 ?auto_176777 ) ) ( not ( = ?auto_176773 ?auto_176774 ) ) ( not ( = ?auto_176773 ?auto_176775 ) ) ( not ( = ?auto_176773 ?auto_176776 ) ) ( not ( = ?auto_176773 ?auto_176777 ) ) ( not ( = ?auto_176774 ?auto_176775 ) ) ( not ( = ?auto_176774 ?auto_176776 ) ) ( not ( = ?auto_176774 ?auto_176777 ) ) ( not ( = ?auto_176775 ?auto_176776 ) ) ( not ( = ?auto_176775 ?auto_176777 ) ) ( not ( = ?auto_176776 ?auto_176777 ) ) ( ON-TABLE ?auto_176777 ) ( ON ?auto_176776 ?auto_176777 ) ( ON ?auto_176775 ?auto_176776 ) ( ON ?auto_176774 ?auto_176775 ) ( ON ?auto_176773 ?auto_176774 ) ( ON ?auto_176772 ?auto_176773 ) ( ON ?auto_176770 ?auto_176778 ) ( CLEAR ?auto_176770 ) ( not ( = ?auto_176770 ?auto_176778 ) ) ( not ( = ?auto_176771 ?auto_176778 ) ) ( not ( = ?auto_176772 ?auto_176778 ) ) ( not ( = ?auto_176773 ?auto_176778 ) ) ( not ( = ?auto_176774 ?auto_176778 ) ) ( not ( = ?auto_176775 ?auto_176778 ) ) ( not ( = ?auto_176776 ?auto_176778 ) ) ( not ( = ?auto_176777 ?auto_176778 ) ) ( HOLDING ?auto_176771 ) ( CLEAR ?auto_176772 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176777 ?auto_176776 ?auto_176775 ?auto_176774 ?auto_176773 ?auto_176772 ?auto_176771 )
      ( MAKE-8PILE ?auto_176770 ?auto_176771 ?auto_176772 ?auto_176773 ?auto_176774 ?auto_176775 ?auto_176776 ?auto_176777 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176779 - BLOCK
      ?auto_176780 - BLOCK
      ?auto_176781 - BLOCK
      ?auto_176782 - BLOCK
      ?auto_176783 - BLOCK
      ?auto_176784 - BLOCK
      ?auto_176785 - BLOCK
      ?auto_176786 - BLOCK
    )
    :vars
    (
      ?auto_176787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176779 ?auto_176780 ) ) ( not ( = ?auto_176779 ?auto_176781 ) ) ( not ( = ?auto_176779 ?auto_176782 ) ) ( not ( = ?auto_176779 ?auto_176783 ) ) ( not ( = ?auto_176779 ?auto_176784 ) ) ( not ( = ?auto_176779 ?auto_176785 ) ) ( not ( = ?auto_176779 ?auto_176786 ) ) ( not ( = ?auto_176780 ?auto_176781 ) ) ( not ( = ?auto_176780 ?auto_176782 ) ) ( not ( = ?auto_176780 ?auto_176783 ) ) ( not ( = ?auto_176780 ?auto_176784 ) ) ( not ( = ?auto_176780 ?auto_176785 ) ) ( not ( = ?auto_176780 ?auto_176786 ) ) ( not ( = ?auto_176781 ?auto_176782 ) ) ( not ( = ?auto_176781 ?auto_176783 ) ) ( not ( = ?auto_176781 ?auto_176784 ) ) ( not ( = ?auto_176781 ?auto_176785 ) ) ( not ( = ?auto_176781 ?auto_176786 ) ) ( not ( = ?auto_176782 ?auto_176783 ) ) ( not ( = ?auto_176782 ?auto_176784 ) ) ( not ( = ?auto_176782 ?auto_176785 ) ) ( not ( = ?auto_176782 ?auto_176786 ) ) ( not ( = ?auto_176783 ?auto_176784 ) ) ( not ( = ?auto_176783 ?auto_176785 ) ) ( not ( = ?auto_176783 ?auto_176786 ) ) ( not ( = ?auto_176784 ?auto_176785 ) ) ( not ( = ?auto_176784 ?auto_176786 ) ) ( not ( = ?auto_176785 ?auto_176786 ) ) ( ON-TABLE ?auto_176786 ) ( ON ?auto_176785 ?auto_176786 ) ( ON ?auto_176784 ?auto_176785 ) ( ON ?auto_176783 ?auto_176784 ) ( ON ?auto_176782 ?auto_176783 ) ( ON ?auto_176781 ?auto_176782 ) ( ON ?auto_176779 ?auto_176787 ) ( not ( = ?auto_176779 ?auto_176787 ) ) ( not ( = ?auto_176780 ?auto_176787 ) ) ( not ( = ?auto_176781 ?auto_176787 ) ) ( not ( = ?auto_176782 ?auto_176787 ) ) ( not ( = ?auto_176783 ?auto_176787 ) ) ( not ( = ?auto_176784 ?auto_176787 ) ) ( not ( = ?auto_176785 ?auto_176787 ) ) ( not ( = ?auto_176786 ?auto_176787 ) ) ( CLEAR ?auto_176781 ) ( ON ?auto_176780 ?auto_176779 ) ( CLEAR ?auto_176780 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176787 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176787 ?auto_176779 )
      ( MAKE-8PILE ?auto_176779 ?auto_176780 ?auto_176781 ?auto_176782 ?auto_176783 ?auto_176784 ?auto_176785 ?auto_176786 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176788 - BLOCK
      ?auto_176789 - BLOCK
      ?auto_176790 - BLOCK
      ?auto_176791 - BLOCK
      ?auto_176792 - BLOCK
      ?auto_176793 - BLOCK
      ?auto_176794 - BLOCK
      ?auto_176795 - BLOCK
    )
    :vars
    (
      ?auto_176796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176788 ?auto_176789 ) ) ( not ( = ?auto_176788 ?auto_176790 ) ) ( not ( = ?auto_176788 ?auto_176791 ) ) ( not ( = ?auto_176788 ?auto_176792 ) ) ( not ( = ?auto_176788 ?auto_176793 ) ) ( not ( = ?auto_176788 ?auto_176794 ) ) ( not ( = ?auto_176788 ?auto_176795 ) ) ( not ( = ?auto_176789 ?auto_176790 ) ) ( not ( = ?auto_176789 ?auto_176791 ) ) ( not ( = ?auto_176789 ?auto_176792 ) ) ( not ( = ?auto_176789 ?auto_176793 ) ) ( not ( = ?auto_176789 ?auto_176794 ) ) ( not ( = ?auto_176789 ?auto_176795 ) ) ( not ( = ?auto_176790 ?auto_176791 ) ) ( not ( = ?auto_176790 ?auto_176792 ) ) ( not ( = ?auto_176790 ?auto_176793 ) ) ( not ( = ?auto_176790 ?auto_176794 ) ) ( not ( = ?auto_176790 ?auto_176795 ) ) ( not ( = ?auto_176791 ?auto_176792 ) ) ( not ( = ?auto_176791 ?auto_176793 ) ) ( not ( = ?auto_176791 ?auto_176794 ) ) ( not ( = ?auto_176791 ?auto_176795 ) ) ( not ( = ?auto_176792 ?auto_176793 ) ) ( not ( = ?auto_176792 ?auto_176794 ) ) ( not ( = ?auto_176792 ?auto_176795 ) ) ( not ( = ?auto_176793 ?auto_176794 ) ) ( not ( = ?auto_176793 ?auto_176795 ) ) ( not ( = ?auto_176794 ?auto_176795 ) ) ( ON-TABLE ?auto_176795 ) ( ON ?auto_176794 ?auto_176795 ) ( ON ?auto_176793 ?auto_176794 ) ( ON ?auto_176792 ?auto_176793 ) ( ON ?auto_176791 ?auto_176792 ) ( ON ?auto_176788 ?auto_176796 ) ( not ( = ?auto_176788 ?auto_176796 ) ) ( not ( = ?auto_176789 ?auto_176796 ) ) ( not ( = ?auto_176790 ?auto_176796 ) ) ( not ( = ?auto_176791 ?auto_176796 ) ) ( not ( = ?auto_176792 ?auto_176796 ) ) ( not ( = ?auto_176793 ?auto_176796 ) ) ( not ( = ?auto_176794 ?auto_176796 ) ) ( not ( = ?auto_176795 ?auto_176796 ) ) ( ON ?auto_176789 ?auto_176788 ) ( CLEAR ?auto_176789 ) ( ON-TABLE ?auto_176796 ) ( HOLDING ?auto_176790 ) ( CLEAR ?auto_176791 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176795 ?auto_176794 ?auto_176793 ?auto_176792 ?auto_176791 ?auto_176790 )
      ( MAKE-8PILE ?auto_176788 ?auto_176789 ?auto_176790 ?auto_176791 ?auto_176792 ?auto_176793 ?auto_176794 ?auto_176795 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176797 - BLOCK
      ?auto_176798 - BLOCK
      ?auto_176799 - BLOCK
      ?auto_176800 - BLOCK
      ?auto_176801 - BLOCK
      ?auto_176802 - BLOCK
      ?auto_176803 - BLOCK
      ?auto_176804 - BLOCK
    )
    :vars
    (
      ?auto_176805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176797 ?auto_176798 ) ) ( not ( = ?auto_176797 ?auto_176799 ) ) ( not ( = ?auto_176797 ?auto_176800 ) ) ( not ( = ?auto_176797 ?auto_176801 ) ) ( not ( = ?auto_176797 ?auto_176802 ) ) ( not ( = ?auto_176797 ?auto_176803 ) ) ( not ( = ?auto_176797 ?auto_176804 ) ) ( not ( = ?auto_176798 ?auto_176799 ) ) ( not ( = ?auto_176798 ?auto_176800 ) ) ( not ( = ?auto_176798 ?auto_176801 ) ) ( not ( = ?auto_176798 ?auto_176802 ) ) ( not ( = ?auto_176798 ?auto_176803 ) ) ( not ( = ?auto_176798 ?auto_176804 ) ) ( not ( = ?auto_176799 ?auto_176800 ) ) ( not ( = ?auto_176799 ?auto_176801 ) ) ( not ( = ?auto_176799 ?auto_176802 ) ) ( not ( = ?auto_176799 ?auto_176803 ) ) ( not ( = ?auto_176799 ?auto_176804 ) ) ( not ( = ?auto_176800 ?auto_176801 ) ) ( not ( = ?auto_176800 ?auto_176802 ) ) ( not ( = ?auto_176800 ?auto_176803 ) ) ( not ( = ?auto_176800 ?auto_176804 ) ) ( not ( = ?auto_176801 ?auto_176802 ) ) ( not ( = ?auto_176801 ?auto_176803 ) ) ( not ( = ?auto_176801 ?auto_176804 ) ) ( not ( = ?auto_176802 ?auto_176803 ) ) ( not ( = ?auto_176802 ?auto_176804 ) ) ( not ( = ?auto_176803 ?auto_176804 ) ) ( ON-TABLE ?auto_176804 ) ( ON ?auto_176803 ?auto_176804 ) ( ON ?auto_176802 ?auto_176803 ) ( ON ?auto_176801 ?auto_176802 ) ( ON ?auto_176800 ?auto_176801 ) ( ON ?auto_176797 ?auto_176805 ) ( not ( = ?auto_176797 ?auto_176805 ) ) ( not ( = ?auto_176798 ?auto_176805 ) ) ( not ( = ?auto_176799 ?auto_176805 ) ) ( not ( = ?auto_176800 ?auto_176805 ) ) ( not ( = ?auto_176801 ?auto_176805 ) ) ( not ( = ?auto_176802 ?auto_176805 ) ) ( not ( = ?auto_176803 ?auto_176805 ) ) ( not ( = ?auto_176804 ?auto_176805 ) ) ( ON ?auto_176798 ?auto_176797 ) ( ON-TABLE ?auto_176805 ) ( CLEAR ?auto_176800 ) ( ON ?auto_176799 ?auto_176798 ) ( CLEAR ?auto_176799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176805 ?auto_176797 ?auto_176798 )
      ( MAKE-8PILE ?auto_176797 ?auto_176798 ?auto_176799 ?auto_176800 ?auto_176801 ?auto_176802 ?auto_176803 ?auto_176804 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176806 - BLOCK
      ?auto_176807 - BLOCK
      ?auto_176808 - BLOCK
      ?auto_176809 - BLOCK
      ?auto_176810 - BLOCK
      ?auto_176811 - BLOCK
      ?auto_176812 - BLOCK
      ?auto_176813 - BLOCK
    )
    :vars
    (
      ?auto_176814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176806 ?auto_176807 ) ) ( not ( = ?auto_176806 ?auto_176808 ) ) ( not ( = ?auto_176806 ?auto_176809 ) ) ( not ( = ?auto_176806 ?auto_176810 ) ) ( not ( = ?auto_176806 ?auto_176811 ) ) ( not ( = ?auto_176806 ?auto_176812 ) ) ( not ( = ?auto_176806 ?auto_176813 ) ) ( not ( = ?auto_176807 ?auto_176808 ) ) ( not ( = ?auto_176807 ?auto_176809 ) ) ( not ( = ?auto_176807 ?auto_176810 ) ) ( not ( = ?auto_176807 ?auto_176811 ) ) ( not ( = ?auto_176807 ?auto_176812 ) ) ( not ( = ?auto_176807 ?auto_176813 ) ) ( not ( = ?auto_176808 ?auto_176809 ) ) ( not ( = ?auto_176808 ?auto_176810 ) ) ( not ( = ?auto_176808 ?auto_176811 ) ) ( not ( = ?auto_176808 ?auto_176812 ) ) ( not ( = ?auto_176808 ?auto_176813 ) ) ( not ( = ?auto_176809 ?auto_176810 ) ) ( not ( = ?auto_176809 ?auto_176811 ) ) ( not ( = ?auto_176809 ?auto_176812 ) ) ( not ( = ?auto_176809 ?auto_176813 ) ) ( not ( = ?auto_176810 ?auto_176811 ) ) ( not ( = ?auto_176810 ?auto_176812 ) ) ( not ( = ?auto_176810 ?auto_176813 ) ) ( not ( = ?auto_176811 ?auto_176812 ) ) ( not ( = ?auto_176811 ?auto_176813 ) ) ( not ( = ?auto_176812 ?auto_176813 ) ) ( ON-TABLE ?auto_176813 ) ( ON ?auto_176812 ?auto_176813 ) ( ON ?auto_176811 ?auto_176812 ) ( ON ?auto_176810 ?auto_176811 ) ( ON ?auto_176806 ?auto_176814 ) ( not ( = ?auto_176806 ?auto_176814 ) ) ( not ( = ?auto_176807 ?auto_176814 ) ) ( not ( = ?auto_176808 ?auto_176814 ) ) ( not ( = ?auto_176809 ?auto_176814 ) ) ( not ( = ?auto_176810 ?auto_176814 ) ) ( not ( = ?auto_176811 ?auto_176814 ) ) ( not ( = ?auto_176812 ?auto_176814 ) ) ( not ( = ?auto_176813 ?auto_176814 ) ) ( ON ?auto_176807 ?auto_176806 ) ( ON-TABLE ?auto_176814 ) ( ON ?auto_176808 ?auto_176807 ) ( CLEAR ?auto_176808 ) ( HOLDING ?auto_176809 ) ( CLEAR ?auto_176810 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176813 ?auto_176812 ?auto_176811 ?auto_176810 ?auto_176809 )
      ( MAKE-8PILE ?auto_176806 ?auto_176807 ?auto_176808 ?auto_176809 ?auto_176810 ?auto_176811 ?auto_176812 ?auto_176813 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176815 - BLOCK
      ?auto_176816 - BLOCK
      ?auto_176817 - BLOCK
      ?auto_176818 - BLOCK
      ?auto_176819 - BLOCK
      ?auto_176820 - BLOCK
      ?auto_176821 - BLOCK
      ?auto_176822 - BLOCK
    )
    :vars
    (
      ?auto_176823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176815 ?auto_176816 ) ) ( not ( = ?auto_176815 ?auto_176817 ) ) ( not ( = ?auto_176815 ?auto_176818 ) ) ( not ( = ?auto_176815 ?auto_176819 ) ) ( not ( = ?auto_176815 ?auto_176820 ) ) ( not ( = ?auto_176815 ?auto_176821 ) ) ( not ( = ?auto_176815 ?auto_176822 ) ) ( not ( = ?auto_176816 ?auto_176817 ) ) ( not ( = ?auto_176816 ?auto_176818 ) ) ( not ( = ?auto_176816 ?auto_176819 ) ) ( not ( = ?auto_176816 ?auto_176820 ) ) ( not ( = ?auto_176816 ?auto_176821 ) ) ( not ( = ?auto_176816 ?auto_176822 ) ) ( not ( = ?auto_176817 ?auto_176818 ) ) ( not ( = ?auto_176817 ?auto_176819 ) ) ( not ( = ?auto_176817 ?auto_176820 ) ) ( not ( = ?auto_176817 ?auto_176821 ) ) ( not ( = ?auto_176817 ?auto_176822 ) ) ( not ( = ?auto_176818 ?auto_176819 ) ) ( not ( = ?auto_176818 ?auto_176820 ) ) ( not ( = ?auto_176818 ?auto_176821 ) ) ( not ( = ?auto_176818 ?auto_176822 ) ) ( not ( = ?auto_176819 ?auto_176820 ) ) ( not ( = ?auto_176819 ?auto_176821 ) ) ( not ( = ?auto_176819 ?auto_176822 ) ) ( not ( = ?auto_176820 ?auto_176821 ) ) ( not ( = ?auto_176820 ?auto_176822 ) ) ( not ( = ?auto_176821 ?auto_176822 ) ) ( ON-TABLE ?auto_176822 ) ( ON ?auto_176821 ?auto_176822 ) ( ON ?auto_176820 ?auto_176821 ) ( ON ?auto_176819 ?auto_176820 ) ( ON ?auto_176815 ?auto_176823 ) ( not ( = ?auto_176815 ?auto_176823 ) ) ( not ( = ?auto_176816 ?auto_176823 ) ) ( not ( = ?auto_176817 ?auto_176823 ) ) ( not ( = ?auto_176818 ?auto_176823 ) ) ( not ( = ?auto_176819 ?auto_176823 ) ) ( not ( = ?auto_176820 ?auto_176823 ) ) ( not ( = ?auto_176821 ?auto_176823 ) ) ( not ( = ?auto_176822 ?auto_176823 ) ) ( ON ?auto_176816 ?auto_176815 ) ( ON-TABLE ?auto_176823 ) ( ON ?auto_176817 ?auto_176816 ) ( CLEAR ?auto_176819 ) ( ON ?auto_176818 ?auto_176817 ) ( CLEAR ?auto_176818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176823 ?auto_176815 ?auto_176816 ?auto_176817 )
      ( MAKE-8PILE ?auto_176815 ?auto_176816 ?auto_176817 ?auto_176818 ?auto_176819 ?auto_176820 ?auto_176821 ?auto_176822 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176824 - BLOCK
      ?auto_176825 - BLOCK
      ?auto_176826 - BLOCK
      ?auto_176827 - BLOCK
      ?auto_176828 - BLOCK
      ?auto_176829 - BLOCK
      ?auto_176830 - BLOCK
      ?auto_176831 - BLOCK
    )
    :vars
    (
      ?auto_176832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176824 ?auto_176825 ) ) ( not ( = ?auto_176824 ?auto_176826 ) ) ( not ( = ?auto_176824 ?auto_176827 ) ) ( not ( = ?auto_176824 ?auto_176828 ) ) ( not ( = ?auto_176824 ?auto_176829 ) ) ( not ( = ?auto_176824 ?auto_176830 ) ) ( not ( = ?auto_176824 ?auto_176831 ) ) ( not ( = ?auto_176825 ?auto_176826 ) ) ( not ( = ?auto_176825 ?auto_176827 ) ) ( not ( = ?auto_176825 ?auto_176828 ) ) ( not ( = ?auto_176825 ?auto_176829 ) ) ( not ( = ?auto_176825 ?auto_176830 ) ) ( not ( = ?auto_176825 ?auto_176831 ) ) ( not ( = ?auto_176826 ?auto_176827 ) ) ( not ( = ?auto_176826 ?auto_176828 ) ) ( not ( = ?auto_176826 ?auto_176829 ) ) ( not ( = ?auto_176826 ?auto_176830 ) ) ( not ( = ?auto_176826 ?auto_176831 ) ) ( not ( = ?auto_176827 ?auto_176828 ) ) ( not ( = ?auto_176827 ?auto_176829 ) ) ( not ( = ?auto_176827 ?auto_176830 ) ) ( not ( = ?auto_176827 ?auto_176831 ) ) ( not ( = ?auto_176828 ?auto_176829 ) ) ( not ( = ?auto_176828 ?auto_176830 ) ) ( not ( = ?auto_176828 ?auto_176831 ) ) ( not ( = ?auto_176829 ?auto_176830 ) ) ( not ( = ?auto_176829 ?auto_176831 ) ) ( not ( = ?auto_176830 ?auto_176831 ) ) ( ON-TABLE ?auto_176831 ) ( ON ?auto_176830 ?auto_176831 ) ( ON ?auto_176829 ?auto_176830 ) ( ON ?auto_176824 ?auto_176832 ) ( not ( = ?auto_176824 ?auto_176832 ) ) ( not ( = ?auto_176825 ?auto_176832 ) ) ( not ( = ?auto_176826 ?auto_176832 ) ) ( not ( = ?auto_176827 ?auto_176832 ) ) ( not ( = ?auto_176828 ?auto_176832 ) ) ( not ( = ?auto_176829 ?auto_176832 ) ) ( not ( = ?auto_176830 ?auto_176832 ) ) ( not ( = ?auto_176831 ?auto_176832 ) ) ( ON ?auto_176825 ?auto_176824 ) ( ON-TABLE ?auto_176832 ) ( ON ?auto_176826 ?auto_176825 ) ( ON ?auto_176827 ?auto_176826 ) ( CLEAR ?auto_176827 ) ( HOLDING ?auto_176828 ) ( CLEAR ?auto_176829 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176831 ?auto_176830 ?auto_176829 ?auto_176828 )
      ( MAKE-8PILE ?auto_176824 ?auto_176825 ?auto_176826 ?auto_176827 ?auto_176828 ?auto_176829 ?auto_176830 ?auto_176831 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176833 - BLOCK
      ?auto_176834 - BLOCK
      ?auto_176835 - BLOCK
      ?auto_176836 - BLOCK
      ?auto_176837 - BLOCK
      ?auto_176838 - BLOCK
      ?auto_176839 - BLOCK
      ?auto_176840 - BLOCK
    )
    :vars
    (
      ?auto_176841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176833 ?auto_176834 ) ) ( not ( = ?auto_176833 ?auto_176835 ) ) ( not ( = ?auto_176833 ?auto_176836 ) ) ( not ( = ?auto_176833 ?auto_176837 ) ) ( not ( = ?auto_176833 ?auto_176838 ) ) ( not ( = ?auto_176833 ?auto_176839 ) ) ( not ( = ?auto_176833 ?auto_176840 ) ) ( not ( = ?auto_176834 ?auto_176835 ) ) ( not ( = ?auto_176834 ?auto_176836 ) ) ( not ( = ?auto_176834 ?auto_176837 ) ) ( not ( = ?auto_176834 ?auto_176838 ) ) ( not ( = ?auto_176834 ?auto_176839 ) ) ( not ( = ?auto_176834 ?auto_176840 ) ) ( not ( = ?auto_176835 ?auto_176836 ) ) ( not ( = ?auto_176835 ?auto_176837 ) ) ( not ( = ?auto_176835 ?auto_176838 ) ) ( not ( = ?auto_176835 ?auto_176839 ) ) ( not ( = ?auto_176835 ?auto_176840 ) ) ( not ( = ?auto_176836 ?auto_176837 ) ) ( not ( = ?auto_176836 ?auto_176838 ) ) ( not ( = ?auto_176836 ?auto_176839 ) ) ( not ( = ?auto_176836 ?auto_176840 ) ) ( not ( = ?auto_176837 ?auto_176838 ) ) ( not ( = ?auto_176837 ?auto_176839 ) ) ( not ( = ?auto_176837 ?auto_176840 ) ) ( not ( = ?auto_176838 ?auto_176839 ) ) ( not ( = ?auto_176838 ?auto_176840 ) ) ( not ( = ?auto_176839 ?auto_176840 ) ) ( ON-TABLE ?auto_176840 ) ( ON ?auto_176839 ?auto_176840 ) ( ON ?auto_176838 ?auto_176839 ) ( ON ?auto_176833 ?auto_176841 ) ( not ( = ?auto_176833 ?auto_176841 ) ) ( not ( = ?auto_176834 ?auto_176841 ) ) ( not ( = ?auto_176835 ?auto_176841 ) ) ( not ( = ?auto_176836 ?auto_176841 ) ) ( not ( = ?auto_176837 ?auto_176841 ) ) ( not ( = ?auto_176838 ?auto_176841 ) ) ( not ( = ?auto_176839 ?auto_176841 ) ) ( not ( = ?auto_176840 ?auto_176841 ) ) ( ON ?auto_176834 ?auto_176833 ) ( ON-TABLE ?auto_176841 ) ( ON ?auto_176835 ?auto_176834 ) ( ON ?auto_176836 ?auto_176835 ) ( CLEAR ?auto_176838 ) ( ON ?auto_176837 ?auto_176836 ) ( CLEAR ?auto_176837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176841 ?auto_176833 ?auto_176834 ?auto_176835 ?auto_176836 )
      ( MAKE-8PILE ?auto_176833 ?auto_176834 ?auto_176835 ?auto_176836 ?auto_176837 ?auto_176838 ?auto_176839 ?auto_176840 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176842 - BLOCK
      ?auto_176843 - BLOCK
      ?auto_176844 - BLOCK
      ?auto_176845 - BLOCK
      ?auto_176846 - BLOCK
      ?auto_176847 - BLOCK
      ?auto_176848 - BLOCK
      ?auto_176849 - BLOCK
    )
    :vars
    (
      ?auto_176850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176842 ?auto_176843 ) ) ( not ( = ?auto_176842 ?auto_176844 ) ) ( not ( = ?auto_176842 ?auto_176845 ) ) ( not ( = ?auto_176842 ?auto_176846 ) ) ( not ( = ?auto_176842 ?auto_176847 ) ) ( not ( = ?auto_176842 ?auto_176848 ) ) ( not ( = ?auto_176842 ?auto_176849 ) ) ( not ( = ?auto_176843 ?auto_176844 ) ) ( not ( = ?auto_176843 ?auto_176845 ) ) ( not ( = ?auto_176843 ?auto_176846 ) ) ( not ( = ?auto_176843 ?auto_176847 ) ) ( not ( = ?auto_176843 ?auto_176848 ) ) ( not ( = ?auto_176843 ?auto_176849 ) ) ( not ( = ?auto_176844 ?auto_176845 ) ) ( not ( = ?auto_176844 ?auto_176846 ) ) ( not ( = ?auto_176844 ?auto_176847 ) ) ( not ( = ?auto_176844 ?auto_176848 ) ) ( not ( = ?auto_176844 ?auto_176849 ) ) ( not ( = ?auto_176845 ?auto_176846 ) ) ( not ( = ?auto_176845 ?auto_176847 ) ) ( not ( = ?auto_176845 ?auto_176848 ) ) ( not ( = ?auto_176845 ?auto_176849 ) ) ( not ( = ?auto_176846 ?auto_176847 ) ) ( not ( = ?auto_176846 ?auto_176848 ) ) ( not ( = ?auto_176846 ?auto_176849 ) ) ( not ( = ?auto_176847 ?auto_176848 ) ) ( not ( = ?auto_176847 ?auto_176849 ) ) ( not ( = ?auto_176848 ?auto_176849 ) ) ( ON-TABLE ?auto_176849 ) ( ON ?auto_176848 ?auto_176849 ) ( ON ?auto_176842 ?auto_176850 ) ( not ( = ?auto_176842 ?auto_176850 ) ) ( not ( = ?auto_176843 ?auto_176850 ) ) ( not ( = ?auto_176844 ?auto_176850 ) ) ( not ( = ?auto_176845 ?auto_176850 ) ) ( not ( = ?auto_176846 ?auto_176850 ) ) ( not ( = ?auto_176847 ?auto_176850 ) ) ( not ( = ?auto_176848 ?auto_176850 ) ) ( not ( = ?auto_176849 ?auto_176850 ) ) ( ON ?auto_176843 ?auto_176842 ) ( ON-TABLE ?auto_176850 ) ( ON ?auto_176844 ?auto_176843 ) ( ON ?auto_176845 ?auto_176844 ) ( ON ?auto_176846 ?auto_176845 ) ( CLEAR ?auto_176846 ) ( HOLDING ?auto_176847 ) ( CLEAR ?auto_176848 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176849 ?auto_176848 ?auto_176847 )
      ( MAKE-8PILE ?auto_176842 ?auto_176843 ?auto_176844 ?auto_176845 ?auto_176846 ?auto_176847 ?auto_176848 ?auto_176849 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176851 - BLOCK
      ?auto_176852 - BLOCK
      ?auto_176853 - BLOCK
      ?auto_176854 - BLOCK
      ?auto_176855 - BLOCK
      ?auto_176856 - BLOCK
      ?auto_176857 - BLOCK
      ?auto_176858 - BLOCK
    )
    :vars
    (
      ?auto_176859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176851 ?auto_176852 ) ) ( not ( = ?auto_176851 ?auto_176853 ) ) ( not ( = ?auto_176851 ?auto_176854 ) ) ( not ( = ?auto_176851 ?auto_176855 ) ) ( not ( = ?auto_176851 ?auto_176856 ) ) ( not ( = ?auto_176851 ?auto_176857 ) ) ( not ( = ?auto_176851 ?auto_176858 ) ) ( not ( = ?auto_176852 ?auto_176853 ) ) ( not ( = ?auto_176852 ?auto_176854 ) ) ( not ( = ?auto_176852 ?auto_176855 ) ) ( not ( = ?auto_176852 ?auto_176856 ) ) ( not ( = ?auto_176852 ?auto_176857 ) ) ( not ( = ?auto_176852 ?auto_176858 ) ) ( not ( = ?auto_176853 ?auto_176854 ) ) ( not ( = ?auto_176853 ?auto_176855 ) ) ( not ( = ?auto_176853 ?auto_176856 ) ) ( not ( = ?auto_176853 ?auto_176857 ) ) ( not ( = ?auto_176853 ?auto_176858 ) ) ( not ( = ?auto_176854 ?auto_176855 ) ) ( not ( = ?auto_176854 ?auto_176856 ) ) ( not ( = ?auto_176854 ?auto_176857 ) ) ( not ( = ?auto_176854 ?auto_176858 ) ) ( not ( = ?auto_176855 ?auto_176856 ) ) ( not ( = ?auto_176855 ?auto_176857 ) ) ( not ( = ?auto_176855 ?auto_176858 ) ) ( not ( = ?auto_176856 ?auto_176857 ) ) ( not ( = ?auto_176856 ?auto_176858 ) ) ( not ( = ?auto_176857 ?auto_176858 ) ) ( ON-TABLE ?auto_176858 ) ( ON ?auto_176857 ?auto_176858 ) ( ON ?auto_176851 ?auto_176859 ) ( not ( = ?auto_176851 ?auto_176859 ) ) ( not ( = ?auto_176852 ?auto_176859 ) ) ( not ( = ?auto_176853 ?auto_176859 ) ) ( not ( = ?auto_176854 ?auto_176859 ) ) ( not ( = ?auto_176855 ?auto_176859 ) ) ( not ( = ?auto_176856 ?auto_176859 ) ) ( not ( = ?auto_176857 ?auto_176859 ) ) ( not ( = ?auto_176858 ?auto_176859 ) ) ( ON ?auto_176852 ?auto_176851 ) ( ON-TABLE ?auto_176859 ) ( ON ?auto_176853 ?auto_176852 ) ( ON ?auto_176854 ?auto_176853 ) ( ON ?auto_176855 ?auto_176854 ) ( CLEAR ?auto_176857 ) ( ON ?auto_176856 ?auto_176855 ) ( CLEAR ?auto_176856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176859 ?auto_176851 ?auto_176852 ?auto_176853 ?auto_176854 ?auto_176855 )
      ( MAKE-8PILE ?auto_176851 ?auto_176852 ?auto_176853 ?auto_176854 ?auto_176855 ?auto_176856 ?auto_176857 ?auto_176858 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176860 - BLOCK
      ?auto_176861 - BLOCK
      ?auto_176862 - BLOCK
      ?auto_176863 - BLOCK
      ?auto_176864 - BLOCK
      ?auto_176865 - BLOCK
      ?auto_176866 - BLOCK
      ?auto_176867 - BLOCK
    )
    :vars
    (
      ?auto_176868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176860 ?auto_176861 ) ) ( not ( = ?auto_176860 ?auto_176862 ) ) ( not ( = ?auto_176860 ?auto_176863 ) ) ( not ( = ?auto_176860 ?auto_176864 ) ) ( not ( = ?auto_176860 ?auto_176865 ) ) ( not ( = ?auto_176860 ?auto_176866 ) ) ( not ( = ?auto_176860 ?auto_176867 ) ) ( not ( = ?auto_176861 ?auto_176862 ) ) ( not ( = ?auto_176861 ?auto_176863 ) ) ( not ( = ?auto_176861 ?auto_176864 ) ) ( not ( = ?auto_176861 ?auto_176865 ) ) ( not ( = ?auto_176861 ?auto_176866 ) ) ( not ( = ?auto_176861 ?auto_176867 ) ) ( not ( = ?auto_176862 ?auto_176863 ) ) ( not ( = ?auto_176862 ?auto_176864 ) ) ( not ( = ?auto_176862 ?auto_176865 ) ) ( not ( = ?auto_176862 ?auto_176866 ) ) ( not ( = ?auto_176862 ?auto_176867 ) ) ( not ( = ?auto_176863 ?auto_176864 ) ) ( not ( = ?auto_176863 ?auto_176865 ) ) ( not ( = ?auto_176863 ?auto_176866 ) ) ( not ( = ?auto_176863 ?auto_176867 ) ) ( not ( = ?auto_176864 ?auto_176865 ) ) ( not ( = ?auto_176864 ?auto_176866 ) ) ( not ( = ?auto_176864 ?auto_176867 ) ) ( not ( = ?auto_176865 ?auto_176866 ) ) ( not ( = ?auto_176865 ?auto_176867 ) ) ( not ( = ?auto_176866 ?auto_176867 ) ) ( ON-TABLE ?auto_176867 ) ( ON ?auto_176860 ?auto_176868 ) ( not ( = ?auto_176860 ?auto_176868 ) ) ( not ( = ?auto_176861 ?auto_176868 ) ) ( not ( = ?auto_176862 ?auto_176868 ) ) ( not ( = ?auto_176863 ?auto_176868 ) ) ( not ( = ?auto_176864 ?auto_176868 ) ) ( not ( = ?auto_176865 ?auto_176868 ) ) ( not ( = ?auto_176866 ?auto_176868 ) ) ( not ( = ?auto_176867 ?auto_176868 ) ) ( ON ?auto_176861 ?auto_176860 ) ( ON-TABLE ?auto_176868 ) ( ON ?auto_176862 ?auto_176861 ) ( ON ?auto_176863 ?auto_176862 ) ( ON ?auto_176864 ?auto_176863 ) ( ON ?auto_176865 ?auto_176864 ) ( CLEAR ?auto_176865 ) ( HOLDING ?auto_176866 ) ( CLEAR ?auto_176867 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176867 ?auto_176866 )
      ( MAKE-8PILE ?auto_176860 ?auto_176861 ?auto_176862 ?auto_176863 ?auto_176864 ?auto_176865 ?auto_176866 ?auto_176867 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176869 - BLOCK
      ?auto_176870 - BLOCK
      ?auto_176871 - BLOCK
      ?auto_176872 - BLOCK
      ?auto_176873 - BLOCK
      ?auto_176874 - BLOCK
      ?auto_176875 - BLOCK
      ?auto_176876 - BLOCK
    )
    :vars
    (
      ?auto_176877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176869 ?auto_176870 ) ) ( not ( = ?auto_176869 ?auto_176871 ) ) ( not ( = ?auto_176869 ?auto_176872 ) ) ( not ( = ?auto_176869 ?auto_176873 ) ) ( not ( = ?auto_176869 ?auto_176874 ) ) ( not ( = ?auto_176869 ?auto_176875 ) ) ( not ( = ?auto_176869 ?auto_176876 ) ) ( not ( = ?auto_176870 ?auto_176871 ) ) ( not ( = ?auto_176870 ?auto_176872 ) ) ( not ( = ?auto_176870 ?auto_176873 ) ) ( not ( = ?auto_176870 ?auto_176874 ) ) ( not ( = ?auto_176870 ?auto_176875 ) ) ( not ( = ?auto_176870 ?auto_176876 ) ) ( not ( = ?auto_176871 ?auto_176872 ) ) ( not ( = ?auto_176871 ?auto_176873 ) ) ( not ( = ?auto_176871 ?auto_176874 ) ) ( not ( = ?auto_176871 ?auto_176875 ) ) ( not ( = ?auto_176871 ?auto_176876 ) ) ( not ( = ?auto_176872 ?auto_176873 ) ) ( not ( = ?auto_176872 ?auto_176874 ) ) ( not ( = ?auto_176872 ?auto_176875 ) ) ( not ( = ?auto_176872 ?auto_176876 ) ) ( not ( = ?auto_176873 ?auto_176874 ) ) ( not ( = ?auto_176873 ?auto_176875 ) ) ( not ( = ?auto_176873 ?auto_176876 ) ) ( not ( = ?auto_176874 ?auto_176875 ) ) ( not ( = ?auto_176874 ?auto_176876 ) ) ( not ( = ?auto_176875 ?auto_176876 ) ) ( ON-TABLE ?auto_176876 ) ( ON ?auto_176869 ?auto_176877 ) ( not ( = ?auto_176869 ?auto_176877 ) ) ( not ( = ?auto_176870 ?auto_176877 ) ) ( not ( = ?auto_176871 ?auto_176877 ) ) ( not ( = ?auto_176872 ?auto_176877 ) ) ( not ( = ?auto_176873 ?auto_176877 ) ) ( not ( = ?auto_176874 ?auto_176877 ) ) ( not ( = ?auto_176875 ?auto_176877 ) ) ( not ( = ?auto_176876 ?auto_176877 ) ) ( ON ?auto_176870 ?auto_176869 ) ( ON-TABLE ?auto_176877 ) ( ON ?auto_176871 ?auto_176870 ) ( ON ?auto_176872 ?auto_176871 ) ( ON ?auto_176873 ?auto_176872 ) ( ON ?auto_176874 ?auto_176873 ) ( CLEAR ?auto_176876 ) ( ON ?auto_176875 ?auto_176874 ) ( CLEAR ?auto_176875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176877 ?auto_176869 ?auto_176870 ?auto_176871 ?auto_176872 ?auto_176873 ?auto_176874 )
      ( MAKE-8PILE ?auto_176869 ?auto_176870 ?auto_176871 ?auto_176872 ?auto_176873 ?auto_176874 ?auto_176875 ?auto_176876 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176878 - BLOCK
      ?auto_176879 - BLOCK
      ?auto_176880 - BLOCK
      ?auto_176881 - BLOCK
      ?auto_176882 - BLOCK
      ?auto_176883 - BLOCK
      ?auto_176884 - BLOCK
      ?auto_176885 - BLOCK
    )
    :vars
    (
      ?auto_176886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176878 ?auto_176879 ) ) ( not ( = ?auto_176878 ?auto_176880 ) ) ( not ( = ?auto_176878 ?auto_176881 ) ) ( not ( = ?auto_176878 ?auto_176882 ) ) ( not ( = ?auto_176878 ?auto_176883 ) ) ( not ( = ?auto_176878 ?auto_176884 ) ) ( not ( = ?auto_176878 ?auto_176885 ) ) ( not ( = ?auto_176879 ?auto_176880 ) ) ( not ( = ?auto_176879 ?auto_176881 ) ) ( not ( = ?auto_176879 ?auto_176882 ) ) ( not ( = ?auto_176879 ?auto_176883 ) ) ( not ( = ?auto_176879 ?auto_176884 ) ) ( not ( = ?auto_176879 ?auto_176885 ) ) ( not ( = ?auto_176880 ?auto_176881 ) ) ( not ( = ?auto_176880 ?auto_176882 ) ) ( not ( = ?auto_176880 ?auto_176883 ) ) ( not ( = ?auto_176880 ?auto_176884 ) ) ( not ( = ?auto_176880 ?auto_176885 ) ) ( not ( = ?auto_176881 ?auto_176882 ) ) ( not ( = ?auto_176881 ?auto_176883 ) ) ( not ( = ?auto_176881 ?auto_176884 ) ) ( not ( = ?auto_176881 ?auto_176885 ) ) ( not ( = ?auto_176882 ?auto_176883 ) ) ( not ( = ?auto_176882 ?auto_176884 ) ) ( not ( = ?auto_176882 ?auto_176885 ) ) ( not ( = ?auto_176883 ?auto_176884 ) ) ( not ( = ?auto_176883 ?auto_176885 ) ) ( not ( = ?auto_176884 ?auto_176885 ) ) ( ON ?auto_176878 ?auto_176886 ) ( not ( = ?auto_176878 ?auto_176886 ) ) ( not ( = ?auto_176879 ?auto_176886 ) ) ( not ( = ?auto_176880 ?auto_176886 ) ) ( not ( = ?auto_176881 ?auto_176886 ) ) ( not ( = ?auto_176882 ?auto_176886 ) ) ( not ( = ?auto_176883 ?auto_176886 ) ) ( not ( = ?auto_176884 ?auto_176886 ) ) ( not ( = ?auto_176885 ?auto_176886 ) ) ( ON ?auto_176879 ?auto_176878 ) ( ON-TABLE ?auto_176886 ) ( ON ?auto_176880 ?auto_176879 ) ( ON ?auto_176881 ?auto_176880 ) ( ON ?auto_176882 ?auto_176881 ) ( ON ?auto_176883 ?auto_176882 ) ( ON ?auto_176884 ?auto_176883 ) ( CLEAR ?auto_176884 ) ( HOLDING ?auto_176885 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176885 )
      ( MAKE-8PILE ?auto_176878 ?auto_176879 ?auto_176880 ?auto_176881 ?auto_176882 ?auto_176883 ?auto_176884 ?auto_176885 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176887 - BLOCK
      ?auto_176888 - BLOCK
      ?auto_176889 - BLOCK
      ?auto_176890 - BLOCK
      ?auto_176891 - BLOCK
      ?auto_176892 - BLOCK
      ?auto_176893 - BLOCK
      ?auto_176894 - BLOCK
    )
    :vars
    (
      ?auto_176895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176887 ?auto_176888 ) ) ( not ( = ?auto_176887 ?auto_176889 ) ) ( not ( = ?auto_176887 ?auto_176890 ) ) ( not ( = ?auto_176887 ?auto_176891 ) ) ( not ( = ?auto_176887 ?auto_176892 ) ) ( not ( = ?auto_176887 ?auto_176893 ) ) ( not ( = ?auto_176887 ?auto_176894 ) ) ( not ( = ?auto_176888 ?auto_176889 ) ) ( not ( = ?auto_176888 ?auto_176890 ) ) ( not ( = ?auto_176888 ?auto_176891 ) ) ( not ( = ?auto_176888 ?auto_176892 ) ) ( not ( = ?auto_176888 ?auto_176893 ) ) ( not ( = ?auto_176888 ?auto_176894 ) ) ( not ( = ?auto_176889 ?auto_176890 ) ) ( not ( = ?auto_176889 ?auto_176891 ) ) ( not ( = ?auto_176889 ?auto_176892 ) ) ( not ( = ?auto_176889 ?auto_176893 ) ) ( not ( = ?auto_176889 ?auto_176894 ) ) ( not ( = ?auto_176890 ?auto_176891 ) ) ( not ( = ?auto_176890 ?auto_176892 ) ) ( not ( = ?auto_176890 ?auto_176893 ) ) ( not ( = ?auto_176890 ?auto_176894 ) ) ( not ( = ?auto_176891 ?auto_176892 ) ) ( not ( = ?auto_176891 ?auto_176893 ) ) ( not ( = ?auto_176891 ?auto_176894 ) ) ( not ( = ?auto_176892 ?auto_176893 ) ) ( not ( = ?auto_176892 ?auto_176894 ) ) ( not ( = ?auto_176893 ?auto_176894 ) ) ( ON ?auto_176887 ?auto_176895 ) ( not ( = ?auto_176887 ?auto_176895 ) ) ( not ( = ?auto_176888 ?auto_176895 ) ) ( not ( = ?auto_176889 ?auto_176895 ) ) ( not ( = ?auto_176890 ?auto_176895 ) ) ( not ( = ?auto_176891 ?auto_176895 ) ) ( not ( = ?auto_176892 ?auto_176895 ) ) ( not ( = ?auto_176893 ?auto_176895 ) ) ( not ( = ?auto_176894 ?auto_176895 ) ) ( ON ?auto_176888 ?auto_176887 ) ( ON-TABLE ?auto_176895 ) ( ON ?auto_176889 ?auto_176888 ) ( ON ?auto_176890 ?auto_176889 ) ( ON ?auto_176891 ?auto_176890 ) ( ON ?auto_176892 ?auto_176891 ) ( ON ?auto_176893 ?auto_176892 ) ( ON ?auto_176894 ?auto_176893 ) ( CLEAR ?auto_176894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176895 ?auto_176887 ?auto_176888 ?auto_176889 ?auto_176890 ?auto_176891 ?auto_176892 ?auto_176893 )
      ( MAKE-8PILE ?auto_176887 ?auto_176888 ?auto_176889 ?auto_176890 ?auto_176891 ?auto_176892 ?auto_176893 ?auto_176894 ) )
  )

)

