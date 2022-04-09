( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28113 - SURFACE
      ?auto_28114 - SURFACE
    )
    :vars
    (
      ?auto_28115 - HOIST
      ?auto_28116 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28115 ?auto_28116 ) ( SURFACE-AT ?auto_28113 ?auto_28116 ) ( CLEAR ?auto_28113 ) ( LIFTING ?auto_28115 ?auto_28114 ) ( IS-CRATE ?auto_28114 ) ( not ( = ?auto_28113 ?auto_28114 ) ) )
    :subtasks
    ( ( !DROP ?auto_28115 ?auto_28114 ?auto_28113 ?auto_28116 )
      ( MAKE-1CRATE-VERIFY ?auto_28113 ?auto_28114 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28117 - SURFACE
      ?auto_28118 - SURFACE
    )
    :vars
    (
      ?auto_28119 - HOIST
      ?auto_28120 - PLACE
      ?auto_28121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28119 ?auto_28120 ) ( SURFACE-AT ?auto_28117 ?auto_28120 ) ( CLEAR ?auto_28117 ) ( IS-CRATE ?auto_28118 ) ( not ( = ?auto_28117 ?auto_28118 ) ) ( TRUCK-AT ?auto_28121 ?auto_28120 ) ( AVAILABLE ?auto_28119 ) ( IN ?auto_28118 ?auto_28121 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28119 ?auto_28118 ?auto_28121 ?auto_28120 )
      ( MAKE-1CRATE ?auto_28117 ?auto_28118 )
      ( MAKE-1CRATE-VERIFY ?auto_28117 ?auto_28118 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28122 - SURFACE
      ?auto_28123 - SURFACE
    )
    :vars
    (
      ?auto_28124 - HOIST
      ?auto_28126 - PLACE
      ?auto_28125 - TRUCK
      ?auto_28127 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28124 ?auto_28126 ) ( SURFACE-AT ?auto_28122 ?auto_28126 ) ( CLEAR ?auto_28122 ) ( IS-CRATE ?auto_28123 ) ( not ( = ?auto_28122 ?auto_28123 ) ) ( AVAILABLE ?auto_28124 ) ( IN ?auto_28123 ?auto_28125 ) ( TRUCK-AT ?auto_28125 ?auto_28127 ) ( not ( = ?auto_28127 ?auto_28126 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28125 ?auto_28127 ?auto_28126 )
      ( MAKE-1CRATE ?auto_28122 ?auto_28123 )
      ( MAKE-1CRATE-VERIFY ?auto_28122 ?auto_28123 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28128 - SURFACE
      ?auto_28129 - SURFACE
    )
    :vars
    (
      ?auto_28131 - HOIST
      ?auto_28130 - PLACE
      ?auto_28132 - TRUCK
      ?auto_28133 - PLACE
      ?auto_28134 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28131 ?auto_28130 ) ( SURFACE-AT ?auto_28128 ?auto_28130 ) ( CLEAR ?auto_28128 ) ( IS-CRATE ?auto_28129 ) ( not ( = ?auto_28128 ?auto_28129 ) ) ( AVAILABLE ?auto_28131 ) ( TRUCK-AT ?auto_28132 ?auto_28133 ) ( not ( = ?auto_28133 ?auto_28130 ) ) ( HOIST-AT ?auto_28134 ?auto_28133 ) ( LIFTING ?auto_28134 ?auto_28129 ) ( not ( = ?auto_28131 ?auto_28134 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28134 ?auto_28129 ?auto_28132 ?auto_28133 )
      ( MAKE-1CRATE ?auto_28128 ?auto_28129 )
      ( MAKE-1CRATE-VERIFY ?auto_28128 ?auto_28129 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28135 - SURFACE
      ?auto_28136 - SURFACE
    )
    :vars
    (
      ?auto_28140 - HOIST
      ?auto_28137 - PLACE
      ?auto_28139 - TRUCK
      ?auto_28138 - PLACE
      ?auto_28141 - HOIST
      ?auto_28142 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28140 ?auto_28137 ) ( SURFACE-AT ?auto_28135 ?auto_28137 ) ( CLEAR ?auto_28135 ) ( IS-CRATE ?auto_28136 ) ( not ( = ?auto_28135 ?auto_28136 ) ) ( AVAILABLE ?auto_28140 ) ( TRUCK-AT ?auto_28139 ?auto_28138 ) ( not ( = ?auto_28138 ?auto_28137 ) ) ( HOIST-AT ?auto_28141 ?auto_28138 ) ( not ( = ?auto_28140 ?auto_28141 ) ) ( AVAILABLE ?auto_28141 ) ( SURFACE-AT ?auto_28136 ?auto_28138 ) ( ON ?auto_28136 ?auto_28142 ) ( CLEAR ?auto_28136 ) ( not ( = ?auto_28135 ?auto_28142 ) ) ( not ( = ?auto_28136 ?auto_28142 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28141 ?auto_28136 ?auto_28142 ?auto_28138 )
      ( MAKE-1CRATE ?auto_28135 ?auto_28136 )
      ( MAKE-1CRATE-VERIFY ?auto_28135 ?auto_28136 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28143 - SURFACE
      ?auto_28144 - SURFACE
    )
    :vars
    (
      ?auto_28147 - HOIST
      ?auto_28145 - PLACE
      ?auto_28150 - PLACE
      ?auto_28146 - HOIST
      ?auto_28148 - SURFACE
      ?auto_28149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28147 ?auto_28145 ) ( SURFACE-AT ?auto_28143 ?auto_28145 ) ( CLEAR ?auto_28143 ) ( IS-CRATE ?auto_28144 ) ( not ( = ?auto_28143 ?auto_28144 ) ) ( AVAILABLE ?auto_28147 ) ( not ( = ?auto_28150 ?auto_28145 ) ) ( HOIST-AT ?auto_28146 ?auto_28150 ) ( not ( = ?auto_28147 ?auto_28146 ) ) ( AVAILABLE ?auto_28146 ) ( SURFACE-AT ?auto_28144 ?auto_28150 ) ( ON ?auto_28144 ?auto_28148 ) ( CLEAR ?auto_28144 ) ( not ( = ?auto_28143 ?auto_28148 ) ) ( not ( = ?auto_28144 ?auto_28148 ) ) ( TRUCK-AT ?auto_28149 ?auto_28145 ) )
    :subtasks
    ( ( !DRIVE ?auto_28149 ?auto_28145 ?auto_28150 )
      ( MAKE-1CRATE ?auto_28143 ?auto_28144 )
      ( MAKE-1CRATE-VERIFY ?auto_28143 ?auto_28144 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28156 - SURFACE
      ?auto_28157 - SURFACE
    )
    :vars
    (
      ?auto_28158 - HOIST
      ?auto_28159 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28158 ?auto_28159 ) ( SURFACE-AT ?auto_28156 ?auto_28159 ) ( CLEAR ?auto_28156 ) ( LIFTING ?auto_28158 ?auto_28157 ) ( IS-CRATE ?auto_28157 ) ( not ( = ?auto_28156 ?auto_28157 ) ) )
    :subtasks
    ( ( !DROP ?auto_28158 ?auto_28157 ?auto_28156 ?auto_28159 )
      ( MAKE-1CRATE-VERIFY ?auto_28156 ?auto_28157 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28160 - SURFACE
      ?auto_28161 - SURFACE
      ?auto_28162 - SURFACE
    )
    :vars
    (
      ?auto_28163 - HOIST
      ?auto_28164 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28163 ?auto_28164 ) ( SURFACE-AT ?auto_28161 ?auto_28164 ) ( CLEAR ?auto_28161 ) ( LIFTING ?auto_28163 ?auto_28162 ) ( IS-CRATE ?auto_28162 ) ( not ( = ?auto_28161 ?auto_28162 ) ) ( ON ?auto_28161 ?auto_28160 ) ( not ( = ?auto_28160 ?auto_28161 ) ) ( not ( = ?auto_28160 ?auto_28162 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28161 ?auto_28162 )
      ( MAKE-2CRATE-VERIFY ?auto_28160 ?auto_28161 ?auto_28162 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28165 - SURFACE
      ?auto_28166 - SURFACE
    )
    :vars
    (
      ?auto_28167 - HOIST
      ?auto_28168 - PLACE
      ?auto_28169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28167 ?auto_28168 ) ( SURFACE-AT ?auto_28165 ?auto_28168 ) ( CLEAR ?auto_28165 ) ( IS-CRATE ?auto_28166 ) ( not ( = ?auto_28165 ?auto_28166 ) ) ( TRUCK-AT ?auto_28169 ?auto_28168 ) ( AVAILABLE ?auto_28167 ) ( IN ?auto_28166 ?auto_28169 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28167 ?auto_28166 ?auto_28169 ?auto_28168 )
      ( MAKE-1CRATE ?auto_28165 ?auto_28166 )
      ( MAKE-1CRATE-VERIFY ?auto_28165 ?auto_28166 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28170 - SURFACE
      ?auto_28171 - SURFACE
      ?auto_28172 - SURFACE
    )
    :vars
    (
      ?auto_28175 - HOIST
      ?auto_28174 - PLACE
      ?auto_28173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28175 ?auto_28174 ) ( SURFACE-AT ?auto_28171 ?auto_28174 ) ( CLEAR ?auto_28171 ) ( IS-CRATE ?auto_28172 ) ( not ( = ?auto_28171 ?auto_28172 ) ) ( TRUCK-AT ?auto_28173 ?auto_28174 ) ( AVAILABLE ?auto_28175 ) ( IN ?auto_28172 ?auto_28173 ) ( ON ?auto_28171 ?auto_28170 ) ( not ( = ?auto_28170 ?auto_28171 ) ) ( not ( = ?auto_28170 ?auto_28172 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28171 ?auto_28172 )
      ( MAKE-2CRATE-VERIFY ?auto_28170 ?auto_28171 ?auto_28172 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28176 - SURFACE
      ?auto_28177 - SURFACE
    )
    :vars
    (
      ?auto_28179 - HOIST
      ?auto_28178 - PLACE
      ?auto_28181 - TRUCK
      ?auto_28180 - SURFACE
      ?auto_28182 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28179 ?auto_28178 ) ( SURFACE-AT ?auto_28176 ?auto_28178 ) ( CLEAR ?auto_28176 ) ( IS-CRATE ?auto_28177 ) ( not ( = ?auto_28176 ?auto_28177 ) ) ( AVAILABLE ?auto_28179 ) ( IN ?auto_28177 ?auto_28181 ) ( ON ?auto_28176 ?auto_28180 ) ( not ( = ?auto_28180 ?auto_28176 ) ) ( not ( = ?auto_28180 ?auto_28177 ) ) ( TRUCK-AT ?auto_28181 ?auto_28182 ) ( not ( = ?auto_28182 ?auto_28178 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28181 ?auto_28182 ?auto_28178 )
      ( MAKE-2CRATE ?auto_28180 ?auto_28176 ?auto_28177 )
      ( MAKE-1CRATE-VERIFY ?auto_28176 ?auto_28177 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28183 - SURFACE
      ?auto_28184 - SURFACE
      ?auto_28185 - SURFACE
    )
    :vars
    (
      ?auto_28188 - HOIST
      ?auto_28187 - PLACE
      ?auto_28189 - TRUCK
      ?auto_28186 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28188 ?auto_28187 ) ( SURFACE-AT ?auto_28184 ?auto_28187 ) ( CLEAR ?auto_28184 ) ( IS-CRATE ?auto_28185 ) ( not ( = ?auto_28184 ?auto_28185 ) ) ( AVAILABLE ?auto_28188 ) ( IN ?auto_28185 ?auto_28189 ) ( ON ?auto_28184 ?auto_28183 ) ( not ( = ?auto_28183 ?auto_28184 ) ) ( not ( = ?auto_28183 ?auto_28185 ) ) ( TRUCK-AT ?auto_28189 ?auto_28186 ) ( not ( = ?auto_28186 ?auto_28187 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28184 ?auto_28185 )
      ( MAKE-2CRATE-VERIFY ?auto_28183 ?auto_28184 ?auto_28185 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28190 - SURFACE
      ?auto_28191 - SURFACE
    )
    :vars
    (
      ?auto_28192 - HOIST
      ?auto_28195 - PLACE
      ?auto_28193 - SURFACE
      ?auto_28196 - TRUCK
      ?auto_28194 - PLACE
      ?auto_28197 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28192 ?auto_28195 ) ( SURFACE-AT ?auto_28190 ?auto_28195 ) ( CLEAR ?auto_28190 ) ( IS-CRATE ?auto_28191 ) ( not ( = ?auto_28190 ?auto_28191 ) ) ( AVAILABLE ?auto_28192 ) ( ON ?auto_28190 ?auto_28193 ) ( not ( = ?auto_28193 ?auto_28190 ) ) ( not ( = ?auto_28193 ?auto_28191 ) ) ( TRUCK-AT ?auto_28196 ?auto_28194 ) ( not ( = ?auto_28194 ?auto_28195 ) ) ( HOIST-AT ?auto_28197 ?auto_28194 ) ( LIFTING ?auto_28197 ?auto_28191 ) ( not ( = ?auto_28192 ?auto_28197 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28197 ?auto_28191 ?auto_28196 ?auto_28194 )
      ( MAKE-2CRATE ?auto_28193 ?auto_28190 ?auto_28191 )
      ( MAKE-1CRATE-VERIFY ?auto_28190 ?auto_28191 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28198 - SURFACE
      ?auto_28199 - SURFACE
      ?auto_28200 - SURFACE
    )
    :vars
    (
      ?auto_28204 - HOIST
      ?auto_28201 - PLACE
      ?auto_28202 - TRUCK
      ?auto_28205 - PLACE
      ?auto_28203 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28204 ?auto_28201 ) ( SURFACE-AT ?auto_28199 ?auto_28201 ) ( CLEAR ?auto_28199 ) ( IS-CRATE ?auto_28200 ) ( not ( = ?auto_28199 ?auto_28200 ) ) ( AVAILABLE ?auto_28204 ) ( ON ?auto_28199 ?auto_28198 ) ( not ( = ?auto_28198 ?auto_28199 ) ) ( not ( = ?auto_28198 ?auto_28200 ) ) ( TRUCK-AT ?auto_28202 ?auto_28205 ) ( not ( = ?auto_28205 ?auto_28201 ) ) ( HOIST-AT ?auto_28203 ?auto_28205 ) ( LIFTING ?auto_28203 ?auto_28200 ) ( not ( = ?auto_28204 ?auto_28203 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28199 ?auto_28200 )
      ( MAKE-2CRATE-VERIFY ?auto_28198 ?auto_28199 ?auto_28200 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28206 - SURFACE
      ?auto_28207 - SURFACE
    )
    :vars
    (
      ?auto_28213 - HOIST
      ?auto_28209 - PLACE
      ?auto_28208 - SURFACE
      ?auto_28210 - TRUCK
      ?auto_28212 - PLACE
      ?auto_28211 - HOIST
      ?auto_28214 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28213 ?auto_28209 ) ( SURFACE-AT ?auto_28206 ?auto_28209 ) ( CLEAR ?auto_28206 ) ( IS-CRATE ?auto_28207 ) ( not ( = ?auto_28206 ?auto_28207 ) ) ( AVAILABLE ?auto_28213 ) ( ON ?auto_28206 ?auto_28208 ) ( not ( = ?auto_28208 ?auto_28206 ) ) ( not ( = ?auto_28208 ?auto_28207 ) ) ( TRUCK-AT ?auto_28210 ?auto_28212 ) ( not ( = ?auto_28212 ?auto_28209 ) ) ( HOIST-AT ?auto_28211 ?auto_28212 ) ( not ( = ?auto_28213 ?auto_28211 ) ) ( AVAILABLE ?auto_28211 ) ( SURFACE-AT ?auto_28207 ?auto_28212 ) ( ON ?auto_28207 ?auto_28214 ) ( CLEAR ?auto_28207 ) ( not ( = ?auto_28206 ?auto_28214 ) ) ( not ( = ?auto_28207 ?auto_28214 ) ) ( not ( = ?auto_28208 ?auto_28214 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28211 ?auto_28207 ?auto_28214 ?auto_28212 )
      ( MAKE-2CRATE ?auto_28208 ?auto_28206 ?auto_28207 )
      ( MAKE-1CRATE-VERIFY ?auto_28206 ?auto_28207 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28215 - SURFACE
      ?auto_28216 - SURFACE
      ?auto_28217 - SURFACE
    )
    :vars
    (
      ?auto_28222 - HOIST
      ?auto_28218 - PLACE
      ?auto_28219 - TRUCK
      ?auto_28221 - PLACE
      ?auto_28220 - HOIST
      ?auto_28223 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28222 ?auto_28218 ) ( SURFACE-AT ?auto_28216 ?auto_28218 ) ( CLEAR ?auto_28216 ) ( IS-CRATE ?auto_28217 ) ( not ( = ?auto_28216 ?auto_28217 ) ) ( AVAILABLE ?auto_28222 ) ( ON ?auto_28216 ?auto_28215 ) ( not ( = ?auto_28215 ?auto_28216 ) ) ( not ( = ?auto_28215 ?auto_28217 ) ) ( TRUCK-AT ?auto_28219 ?auto_28221 ) ( not ( = ?auto_28221 ?auto_28218 ) ) ( HOIST-AT ?auto_28220 ?auto_28221 ) ( not ( = ?auto_28222 ?auto_28220 ) ) ( AVAILABLE ?auto_28220 ) ( SURFACE-AT ?auto_28217 ?auto_28221 ) ( ON ?auto_28217 ?auto_28223 ) ( CLEAR ?auto_28217 ) ( not ( = ?auto_28216 ?auto_28223 ) ) ( not ( = ?auto_28217 ?auto_28223 ) ) ( not ( = ?auto_28215 ?auto_28223 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28216 ?auto_28217 )
      ( MAKE-2CRATE-VERIFY ?auto_28215 ?auto_28216 ?auto_28217 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28224 - SURFACE
      ?auto_28225 - SURFACE
    )
    :vars
    (
      ?auto_28226 - HOIST
      ?auto_28230 - PLACE
      ?auto_28231 - SURFACE
      ?auto_28232 - PLACE
      ?auto_28228 - HOIST
      ?auto_28227 - SURFACE
      ?auto_28229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28226 ?auto_28230 ) ( SURFACE-AT ?auto_28224 ?auto_28230 ) ( CLEAR ?auto_28224 ) ( IS-CRATE ?auto_28225 ) ( not ( = ?auto_28224 ?auto_28225 ) ) ( AVAILABLE ?auto_28226 ) ( ON ?auto_28224 ?auto_28231 ) ( not ( = ?auto_28231 ?auto_28224 ) ) ( not ( = ?auto_28231 ?auto_28225 ) ) ( not ( = ?auto_28232 ?auto_28230 ) ) ( HOIST-AT ?auto_28228 ?auto_28232 ) ( not ( = ?auto_28226 ?auto_28228 ) ) ( AVAILABLE ?auto_28228 ) ( SURFACE-AT ?auto_28225 ?auto_28232 ) ( ON ?auto_28225 ?auto_28227 ) ( CLEAR ?auto_28225 ) ( not ( = ?auto_28224 ?auto_28227 ) ) ( not ( = ?auto_28225 ?auto_28227 ) ) ( not ( = ?auto_28231 ?auto_28227 ) ) ( TRUCK-AT ?auto_28229 ?auto_28230 ) )
    :subtasks
    ( ( !DRIVE ?auto_28229 ?auto_28230 ?auto_28232 )
      ( MAKE-2CRATE ?auto_28231 ?auto_28224 ?auto_28225 )
      ( MAKE-1CRATE-VERIFY ?auto_28224 ?auto_28225 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28233 - SURFACE
      ?auto_28234 - SURFACE
      ?auto_28235 - SURFACE
    )
    :vars
    (
      ?auto_28240 - HOIST
      ?auto_28241 - PLACE
      ?auto_28236 - PLACE
      ?auto_28238 - HOIST
      ?auto_28239 - SURFACE
      ?auto_28237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28240 ?auto_28241 ) ( SURFACE-AT ?auto_28234 ?auto_28241 ) ( CLEAR ?auto_28234 ) ( IS-CRATE ?auto_28235 ) ( not ( = ?auto_28234 ?auto_28235 ) ) ( AVAILABLE ?auto_28240 ) ( ON ?auto_28234 ?auto_28233 ) ( not ( = ?auto_28233 ?auto_28234 ) ) ( not ( = ?auto_28233 ?auto_28235 ) ) ( not ( = ?auto_28236 ?auto_28241 ) ) ( HOIST-AT ?auto_28238 ?auto_28236 ) ( not ( = ?auto_28240 ?auto_28238 ) ) ( AVAILABLE ?auto_28238 ) ( SURFACE-AT ?auto_28235 ?auto_28236 ) ( ON ?auto_28235 ?auto_28239 ) ( CLEAR ?auto_28235 ) ( not ( = ?auto_28234 ?auto_28239 ) ) ( not ( = ?auto_28235 ?auto_28239 ) ) ( not ( = ?auto_28233 ?auto_28239 ) ) ( TRUCK-AT ?auto_28237 ?auto_28241 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28234 ?auto_28235 )
      ( MAKE-2CRATE-VERIFY ?auto_28233 ?auto_28234 ?auto_28235 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28242 - SURFACE
      ?auto_28243 - SURFACE
    )
    :vars
    (
      ?auto_28249 - HOIST
      ?auto_28247 - PLACE
      ?auto_28244 - SURFACE
      ?auto_28246 - PLACE
      ?auto_28245 - HOIST
      ?auto_28248 - SURFACE
      ?auto_28250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28249 ?auto_28247 ) ( IS-CRATE ?auto_28243 ) ( not ( = ?auto_28242 ?auto_28243 ) ) ( not ( = ?auto_28244 ?auto_28242 ) ) ( not ( = ?auto_28244 ?auto_28243 ) ) ( not ( = ?auto_28246 ?auto_28247 ) ) ( HOIST-AT ?auto_28245 ?auto_28246 ) ( not ( = ?auto_28249 ?auto_28245 ) ) ( AVAILABLE ?auto_28245 ) ( SURFACE-AT ?auto_28243 ?auto_28246 ) ( ON ?auto_28243 ?auto_28248 ) ( CLEAR ?auto_28243 ) ( not ( = ?auto_28242 ?auto_28248 ) ) ( not ( = ?auto_28243 ?auto_28248 ) ) ( not ( = ?auto_28244 ?auto_28248 ) ) ( TRUCK-AT ?auto_28250 ?auto_28247 ) ( SURFACE-AT ?auto_28244 ?auto_28247 ) ( CLEAR ?auto_28244 ) ( LIFTING ?auto_28249 ?auto_28242 ) ( IS-CRATE ?auto_28242 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28244 ?auto_28242 )
      ( MAKE-2CRATE ?auto_28244 ?auto_28242 ?auto_28243 )
      ( MAKE-1CRATE-VERIFY ?auto_28242 ?auto_28243 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28251 - SURFACE
      ?auto_28252 - SURFACE
      ?auto_28253 - SURFACE
    )
    :vars
    (
      ?auto_28254 - HOIST
      ?auto_28259 - PLACE
      ?auto_28257 - PLACE
      ?auto_28258 - HOIST
      ?auto_28255 - SURFACE
      ?auto_28256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28254 ?auto_28259 ) ( IS-CRATE ?auto_28253 ) ( not ( = ?auto_28252 ?auto_28253 ) ) ( not ( = ?auto_28251 ?auto_28252 ) ) ( not ( = ?auto_28251 ?auto_28253 ) ) ( not ( = ?auto_28257 ?auto_28259 ) ) ( HOIST-AT ?auto_28258 ?auto_28257 ) ( not ( = ?auto_28254 ?auto_28258 ) ) ( AVAILABLE ?auto_28258 ) ( SURFACE-AT ?auto_28253 ?auto_28257 ) ( ON ?auto_28253 ?auto_28255 ) ( CLEAR ?auto_28253 ) ( not ( = ?auto_28252 ?auto_28255 ) ) ( not ( = ?auto_28253 ?auto_28255 ) ) ( not ( = ?auto_28251 ?auto_28255 ) ) ( TRUCK-AT ?auto_28256 ?auto_28259 ) ( SURFACE-AT ?auto_28251 ?auto_28259 ) ( CLEAR ?auto_28251 ) ( LIFTING ?auto_28254 ?auto_28252 ) ( IS-CRATE ?auto_28252 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28252 ?auto_28253 )
      ( MAKE-2CRATE-VERIFY ?auto_28251 ?auto_28252 ?auto_28253 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28260 - SURFACE
      ?auto_28261 - SURFACE
    )
    :vars
    (
      ?auto_28268 - HOIST
      ?auto_28263 - PLACE
      ?auto_28264 - SURFACE
      ?auto_28265 - PLACE
      ?auto_28262 - HOIST
      ?auto_28267 - SURFACE
      ?auto_28266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28268 ?auto_28263 ) ( IS-CRATE ?auto_28261 ) ( not ( = ?auto_28260 ?auto_28261 ) ) ( not ( = ?auto_28264 ?auto_28260 ) ) ( not ( = ?auto_28264 ?auto_28261 ) ) ( not ( = ?auto_28265 ?auto_28263 ) ) ( HOIST-AT ?auto_28262 ?auto_28265 ) ( not ( = ?auto_28268 ?auto_28262 ) ) ( AVAILABLE ?auto_28262 ) ( SURFACE-AT ?auto_28261 ?auto_28265 ) ( ON ?auto_28261 ?auto_28267 ) ( CLEAR ?auto_28261 ) ( not ( = ?auto_28260 ?auto_28267 ) ) ( not ( = ?auto_28261 ?auto_28267 ) ) ( not ( = ?auto_28264 ?auto_28267 ) ) ( TRUCK-AT ?auto_28266 ?auto_28263 ) ( SURFACE-AT ?auto_28264 ?auto_28263 ) ( CLEAR ?auto_28264 ) ( IS-CRATE ?auto_28260 ) ( AVAILABLE ?auto_28268 ) ( IN ?auto_28260 ?auto_28266 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28268 ?auto_28260 ?auto_28266 ?auto_28263 )
      ( MAKE-2CRATE ?auto_28264 ?auto_28260 ?auto_28261 )
      ( MAKE-1CRATE-VERIFY ?auto_28260 ?auto_28261 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28269 - SURFACE
      ?auto_28270 - SURFACE
      ?auto_28271 - SURFACE
    )
    :vars
    (
      ?auto_28275 - HOIST
      ?auto_28274 - PLACE
      ?auto_28277 - PLACE
      ?auto_28276 - HOIST
      ?auto_28272 - SURFACE
      ?auto_28273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28275 ?auto_28274 ) ( IS-CRATE ?auto_28271 ) ( not ( = ?auto_28270 ?auto_28271 ) ) ( not ( = ?auto_28269 ?auto_28270 ) ) ( not ( = ?auto_28269 ?auto_28271 ) ) ( not ( = ?auto_28277 ?auto_28274 ) ) ( HOIST-AT ?auto_28276 ?auto_28277 ) ( not ( = ?auto_28275 ?auto_28276 ) ) ( AVAILABLE ?auto_28276 ) ( SURFACE-AT ?auto_28271 ?auto_28277 ) ( ON ?auto_28271 ?auto_28272 ) ( CLEAR ?auto_28271 ) ( not ( = ?auto_28270 ?auto_28272 ) ) ( not ( = ?auto_28271 ?auto_28272 ) ) ( not ( = ?auto_28269 ?auto_28272 ) ) ( TRUCK-AT ?auto_28273 ?auto_28274 ) ( SURFACE-AT ?auto_28269 ?auto_28274 ) ( CLEAR ?auto_28269 ) ( IS-CRATE ?auto_28270 ) ( AVAILABLE ?auto_28275 ) ( IN ?auto_28270 ?auto_28273 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28270 ?auto_28271 )
      ( MAKE-2CRATE-VERIFY ?auto_28269 ?auto_28270 ?auto_28271 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28278 - SURFACE
      ?auto_28279 - SURFACE
    )
    :vars
    (
      ?auto_28286 - HOIST
      ?auto_28282 - PLACE
      ?auto_28281 - SURFACE
      ?auto_28280 - PLACE
      ?auto_28284 - HOIST
      ?auto_28285 - SURFACE
      ?auto_28283 - TRUCK
      ?auto_28287 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28286 ?auto_28282 ) ( IS-CRATE ?auto_28279 ) ( not ( = ?auto_28278 ?auto_28279 ) ) ( not ( = ?auto_28281 ?auto_28278 ) ) ( not ( = ?auto_28281 ?auto_28279 ) ) ( not ( = ?auto_28280 ?auto_28282 ) ) ( HOIST-AT ?auto_28284 ?auto_28280 ) ( not ( = ?auto_28286 ?auto_28284 ) ) ( AVAILABLE ?auto_28284 ) ( SURFACE-AT ?auto_28279 ?auto_28280 ) ( ON ?auto_28279 ?auto_28285 ) ( CLEAR ?auto_28279 ) ( not ( = ?auto_28278 ?auto_28285 ) ) ( not ( = ?auto_28279 ?auto_28285 ) ) ( not ( = ?auto_28281 ?auto_28285 ) ) ( SURFACE-AT ?auto_28281 ?auto_28282 ) ( CLEAR ?auto_28281 ) ( IS-CRATE ?auto_28278 ) ( AVAILABLE ?auto_28286 ) ( IN ?auto_28278 ?auto_28283 ) ( TRUCK-AT ?auto_28283 ?auto_28287 ) ( not ( = ?auto_28287 ?auto_28282 ) ) ( not ( = ?auto_28280 ?auto_28287 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28283 ?auto_28287 ?auto_28282 )
      ( MAKE-2CRATE ?auto_28281 ?auto_28278 ?auto_28279 )
      ( MAKE-1CRATE-VERIFY ?auto_28278 ?auto_28279 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28288 - SURFACE
      ?auto_28289 - SURFACE
      ?auto_28290 - SURFACE
    )
    :vars
    (
      ?auto_28295 - HOIST
      ?auto_28296 - PLACE
      ?auto_28293 - PLACE
      ?auto_28292 - HOIST
      ?auto_28291 - SURFACE
      ?auto_28297 - TRUCK
      ?auto_28294 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28295 ?auto_28296 ) ( IS-CRATE ?auto_28290 ) ( not ( = ?auto_28289 ?auto_28290 ) ) ( not ( = ?auto_28288 ?auto_28289 ) ) ( not ( = ?auto_28288 ?auto_28290 ) ) ( not ( = ?auto_28293 ?auto_28296 ) ) ( HOIST-AT ?auto_28292 ?auto_28293 ) ( not ( = ?auto_28295 ?auto_28292 ) ) ( AVAILABLE ?auto_28292 ) ( SURFACE-AT ?auto_28290 ?auto_28293 ) ( ON ?auto_28290 ?auto_28291 ) ( CLEAR ?auto_28290 ) ( not ( = ?auto_28289 ?auto_28291 ) ) ( not ( = ?auto_28290 ?auto_28291 ) ) ( not ( = ?auto_28288 ?auto_28291 ) ) ( SURFACE-AT ?auto_28288 ?auto_28296 ) ( CLEAR ?auto_28288 ) ( IS-CRATE ?auto_28289 ) ( AVAILABLE ?auto_28295 ) ( IN ?auto_28289 ?auto_28297 ) ( TRUCK-AT ?auto_28297 ?auto_28294 ) ( not ( = ?auto_28294 ?auto_28296 ) ) ( not ( = ?auto_28293 ?auto_28294 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28289 ?auto_28290 )
      ( MAKE-2CRATE-VERIFY ?auto_28288 ?auto_28289 ?auto_28290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28298 - SURFACE
      ?auto_28299 - SURFACE
    )
    :vars
    (
      ?auto_28306 - HOIST
      ?auto_28301 - PLACE
      ?auto_28302 - SURFACE
      ?auto_28303 - PLACE
      ?auto_28305 - HOIST
      ?auto_28304 - SURFACE
      ?auto_28307 - TRUCK
      ?auto_28300 - PLACE
      ?auto_28308 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28306 ?auto_28301 ) ( IS-CRATE ?auto_28299 ) ( not ( = ?auto_28298 ?auto_28299 ) ) ( not ( = ?auto_28302 ?auto_28298 ) ) ( not ( = ?auto_28302 ?auto_28299 ) ) ( not ( = ?auto_28303 ?auto_28301 ) ) ( HOIST-AT ?auto_28305 ?auto_28303 ) ( not ( = ?auto_28306 ?auto_28305 ) ) ( AVAILABLE ?auto_28305 ) ( SURFACE-AT ?auto_28299 ?auto_28303 ) ( ON ?auto_28299 ?auto_28304 ) ( CLEAR ?auto_28299 ) ( not ( = ?auto_28298 ?auto_28304 ) ) ( not ( = ?auto_28299 ?auto_28304 ) ) ( not ( = ?auto_28302 ?auto_28304 ) ) ( SURFACE-AT ?auto_28302 ?auto_28301 ) ( CLEAR ?auto_28302 ) ( IS-CRATE ?auto_28298 ) ( AVAILABLE ?auto_28306 ) ( TRUCK-AT ?auto_28307 ?auto_28300 ) ( not ( = ?auto_28300 ?auto_28301 ) ) ( not ( = ?auto_28303 ?auto_28300 ) ) ( HOIST-AT ?auto_28308 ?auto_28300 ) ( LIFTING ?auto_28308 ?auto_28298 ) ( not ( = ?auto_28306 ?auto_28308 ) ) ( not ( = ?auto_28305 ?auto_28308 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28308 ?auto_28298 ?auto_28307 ?auto_28300 )
      ( MAKE-2CRATE ?auto_28302 ?auto_28298 ?auto_28299 )
      ( MAKE-1CRATE-VERIFY ?auto_28298 ?auto_28299 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28309 - SURFACE
      ?auto_28310 - SURFACE
      ?auto_28311 - SURFACE
    )
    :vars
    (
      ?auto_28316 - HOIST
      ?auto_28318 - PLACE
      ?auto_28315 - PLACE
      ?auto_28312 - HOIST
      ?auto_28313 - SURFACE
      ?auto_28317 - TRUCK
      ?auto_28319 - PLACE
      ?auto_28314 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28316 ?auto_28318 ) ( IS-CRATE ?auto_28311 ) ( not ( = ?auto_28310 ?auto_28311 ) ) ( not ( = ?auto_28309 ?auto_28310 ) ) ( not ( = ?auto_28309 ?auto_28311 ) ) ( not ( = ?auto_28315 ?auto_28318 ) ) ( HOIST-AT ?auto_28312 ?auto_28315 ) ( not ( = ?auto_28316 ?auto_28312 ) ) ( AVAILABLE ?auto_28312 ) ( SURFACE-AT ?auto_28311 ?auto_28315 ) ( ON ?auto_28311 ?auto_28313 ) ( CLEAR ?auto_28311 ) ( not ( = ?auto_28310 ?auto_28313 ) ) ( not ( = ?auto_28311 ?auto_28313 ) ) ( not ( = ?auto_28309 ?auto_28313 ) ) ( SURFACE-AT ?auto_28309 ?auto_28318 ) ( CLEAR ?auto_28309 ) ( IS-CRATE ?auto_28310 ) ( AVAILABLE ?auto_28316 ) ( TRUCK-AT ?auto_28317 ?auto_28319 ) ( not ( = ?auto_28319 ?auto_28318 ) ) ( not ( = ?auto_28315 ?auto_28319 ) ) ( HOIST-AT ?auto_28314 ?auto_28319 ) ( LIFTING ?auto_28314 ?auto_28310 ) ( not ( = ?auto_28316 ?auto_28314 ) ) ( not ( = ?auto_28312 ?auto_28314 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28310 ?auto_28311 )
      ( MAKE-2CRATE-VERIFY ?auto_28309 ?auto_28310 ?auto_28311 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28320 - SURFACE
      ?auto_28321 - SURFACE
    )
    :vars
    (
      ?auto_28327 - HOIST
      ?auto_28328 - PLACE
      ?auto_28323 - SURFACE
      ?auto_28324 - PLACE
      ?auto_28325 - HOIST
      ?auto_28329 - SURFACE
      ?auto_28330 - TRUCK
      ?auto_28322 - PLACE
      ?auto_28326 - HOIST
      ?auto_28331 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28327 ?auto_28328 ) ( IS-CRATE ?auto_28321 ) ( not ( = ?auto_28320 ?auto_28321 ) ) ( not ( = ?auto_28323 ?auto_28320 ) ) ( not ( = ?auto_28323 ?auto_28321 ) ) ( not ( = ?auto_28324 ?auto_28328 ) ) ( HOIST-AT ?auto_28325 ?auto_28324 ) ( not ( = ?auto_28327 ?auto_28325 ) ) ( AVAILABLE ?auto_28325 ) ( SURFACE-AT ?auto_28321 ?auto_28324 ) ( ON ?auto_28321 ?auto_28329 ) ( CLEAR ?auto_28321 ) ( not ( = ?auto_28320 ?auto_28329 ) ) ( not ( = ?auto_28321 ?auto_28329 ) ) ( not ( = ?auto_28323 ?auto_28329 ) ) ( SURFACE-AT ?auto_28323 ?auto_28328 ) ( CLEAR ?auto_28323 ) ( IS-CRATE ?auto_28320 ) ( AVAILABLE ?auto_28327 ) ( TRUCK-AT ?auto_28330 ?auto_28322 ) ( not ( = ?auto_28322 ?auto_28328 ) ) ( not ( = ?auto_28324 ?auto_28322 ) ) ( HOIST-AT ?auto_28326 ?auto_28322 ) ( not ( = ?auto_28327 ?auto_28326 ) ) ( not ( = ?auto_28325 ?auto_28326 ) ) ( AVAILABLE ?auto_28326 ) ( SURFACE-AT ?auto_28320 ?auto_28322 ) ( ON ?auto_28320 ?auto_28331 ) ( CLEAR ?auto_28320 ) ( not ( = ?auto_28320 ?auto_28331 ) ) ( not ( = ?auto_28321 ?auto_28331 ) ) ( not ( = ?auto_28323 ?auto_28331 ) ) ( not ( = ?auto_28329 ?auto_28331 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28326 ?auto_28320 ?auto_28331 ?auto_28322 )
      ( MAKE-2CRATE ?auto_28323 ?auto_28320 ?auto_28321 )
      ( MAKE-1CRATE-VERIFY ?auto_28320 ?auto_28321 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28332 - SURFACE
      ?auto_28333 - SURFACE
      ?auto_28334 - SURFACE
    )
    :vars
    (
      ?auto_28336 - HOIST
      ?auto_28335 - PLACE
      ?auto_28338 - PLACE
      ?auto_28337 - HOIST
      ?auto_28340 - SURFACE
      ?auto_28341 - TRUCK
      ?auto_28339 - PLACE
      ?auto_28342 - HOIST
      ?auto_28343 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28336 ?auto_28335 ) ( IS-CRATE ?auto_28334 ) ( not ( = ?auto_28333 ?auto_28334 ) ) ( not ( = ?auto_28332 ?auto_28333 ) ) ( not ( = ?auto_28332 ?auto_28334 ) ) ( not ( = ?auto_28338 ?auto_28335 ) ) ( HOIST-AT ?auto_28337 ?auto_28338 ) ( not ( = ?auto_28336 ?auto_28337 ) ) ( AVAILABLE ?auto_28337 ) ( SURFACE-AT ?auto_28334 ?auto_28338 ) ( ON ?auto_28334 ?auto_28340 ) ( CLEAR ?auto_28334 ) ( not ( = ?auto_28333 ?auto_28340 ) ) ( not ( = ?auto_28334 ?auto_28340 ) ) ( not ( = ?auto_28332 ?auto_28340 ) ) ( SURFACE-AT ?auto_28332 ?auto_28335 ) ( CLEAR ?auto_28332 ) ( IS-CRATE ?auto_28333 ) ( AVAILABLE ?auto_28336 ) ( TRUCK-AT ?auto_28341 ?auto_28339 ) ( not ( = ?auto_28339 ?auto_28335 ) ) ( not ( = ?auto_28338 ?auto_28339 ) ) ( HOIST-AT ?auto_28342 ?auto_28339 ) ( not ( = ?auto_28336 ?auto_28342 ) ) ( not ( = ?auto_28337 ?auto_28342 ) ) ( AVAILABLE ?auto_28342 ) ( SURFACE-AT ?auto_28333 ?auto_28339 ) ( ON ?auto_28333 ?auto_28343 ) ( CLEAR ?auto_28333 ) ( not ( = ?auto_28333 ?auto_28343 ) ) ( not ( = ?auto_28334 ?auto_28343 ) ) ( not ( = ?auto_28332 ?auto_28343 ) ) ( not ( = ?auto_28340 ?auto_28343 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28333 ?auto_28334 )
      ( MAKE-2CRATE-VERIFY ?auto_28332 ?auto_28333 ?auto_28334 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28344 - SURFACE
      ?auto_28345 - SURFACE
    )
    :vars
    (
      ?auto_28347 - HOIST
      ?auto_28346 - PLACE
      ?auto_28351 - SURFACE
      ?auto_28348 - PLACE
      ?auto_28352 - HOIST
      ?auto_28349 - SURFACE
      ?auto_28354 - PLACE
      ?auto_28355 - HOIST
      ?auto_28353 - SURFACE
      ?auto_28350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28347 ?auto_28346 ) ( IS-CRATE ?auto_28345 ) ( not ( = ?auto_28344 ?auto_28345 ) ) ( not ( = ?auto_28351 ?auto_28344 ) ) ( not ( = ?auto_28351 ?auto_28345 ) ) ( not ( = ?auto_28348 ?auto_28346 ) ) ( HOIST-AT ?auto_28352 ?auto_28348 ) ( not ( = ?auto_28347 ?auto_28352 ) ) ( AVAILABLE ?auto_28352 ) ( SURFACE-AT ?auto_28345 ?auto_28348 ) ( ON ?auto_28345 ?auto_28349 ) ( CLEAR ?auto_28345 ) ( not ( = ?auto_28344 ?auto_28349 ) ) ( not ( = ?auto_28345 ?auto_28349 ) ) ( not ( = ?auto_28351 ?auto_28349 ) ) ( SURFACE-AT ?auto_28351 ?auto_28346 ) ( CLEAR ?auto_28351 ) ( IS-CRATE ?auto_28344 ) ( AVAILABLE ?auto_28347 ) ( not ( = ?auto_28354 ?auto_28346 ) ) ( not ( = ?auto_28348 ?auto_28354 ) ) ( HOIST-AT ?auto_28355 ?auto_28354 ) ( not ( = ?auto_28347 ?auto_28355 ) ) ( not ( = ?auto_28352 ?auto_28355 ) ) ( AVAILABLE ?auto_28355 ) ( SURFACE-AT ?auto_28344 ?auto_28354 ) ( ON ?auto_28344 ?auto_28353 ) ( CLEAR ?auto_28344 ) ( not ( = ?auto_28344 ?auto_28353 ) ) ( not ( = ?auto_28345 ?auto_28353 ) ) ( not ( = ?auto_28351 ?auto_28353 ) ) ( not ( = ?auto_28349 ?auto_28353 ) ) ( TRUCK-AT ?auto_28350 ?auto_28346 ) )
    :subtasks
    ( ( !DRIVE ?auto_28350 ?auto_28346 ?auto_28354 )
      ( MAKE-2CRATE ?auto_28351 ?auto_28344 ?auto_28345 )
      ( MAKE-1CRATE-VERIFY ?auto_28344 ?auto_28345 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28356 - SURFACE
      ?auto_28357 - SURFACE
      ?auto_28358 - SURFACE
    )
    :vars
    (
      ?auto_28362 - HOIST
      ?auto_28361 - PLACE
      ?auto_28363 - PLACE
      ?auto_28359 - HOIST
      ?auto_28364 - SURFACE
      ?auto_28366 - PLACE
      ?auto_28360 - HOIST
      ?auto_28365 - SURFACE
      ?auto_28367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28362 ?auto_28361 ) ( IS-CRATE ?auto_28358 ) ( not ( = ?auto_28357 ?auto_28358 ) ) ( not ( = ?auto_28356 ?auto_28357 ) ) ( not ( = ?auto_28356 ?auto_28358 ) ) ( not ( = ?auto_28363 ?auto_28361 ) ) ( HOIST-AT ?auto_28359 ?auto_28363 ) ( not ( = ?auto_28362 ?auto_28359 ) ) ( AVAILABLE ?auto_28359 ) ( SURFACE-AT ?auto_28358 ?auto_28363 ) ( ON ?auto_28358 ?auto_28364 ) ( CLEAR ?auto_28358 ) ( not ( = ?auto_28357 ?auto_28364 ) ) ( not ( = ?auto_28358 ?auto_28364 ) ) ( not ( = ?auto_28356 ?auto_28364 ) ) ( SURFACE-AT ?auto_28356 ?auto_28361 ) ( CLEAR ?auto_28356 ) ( IS-CRATE ?auto_28357 ) ( AVAILABLE ?auto_28362 ) ( not ( = ?auto_28366 ?auto_28361 ) ) ( not ( = ?auto_28363 ?auto_28366 ) ) ( HOIST-AT ?auto_28360 ?auto_28366 ) ( not ( = ?auto_28362 ?auto_28360 ) ) ( not ( = ?auto_28359 ?auto_28360 ) ) ( AVAILABLE ?auto_28360 ) ( SURFACE-AT ?auto_28357 ?auto_28366 ) ( ON ?auto_28357 ?auto_28365 ) ( CLEAR ?auto_28357 ) ( not ( = ?auto_28357 ?auto_28365 ) ) ( not ( = ?auto_28358 ?auto_28365 ) ) ( not ( = ?auto_28356 ?auto_28365 ) ) ( not ( = ?auto_28364 ?auto_28365 ) ) ( TRUCK-AT ?auto_28367 ?auto_28361 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28357 ?auto_28358 )
      ( MAKE-2CRATE-VERIFY ?auto_28356 ?auto_28357 ?auto_28358 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28377 - SURFACE
      ?auto_28378 - SURFACE
    )
    :vars
    (
      ?auto_28379 - HOIST
      ?auto_28380 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28379 ?auto_28380 ) ( SURFACE-AT ?auto_28377 ?auto_28380 ) ( CLEAR ?auto_28377 ) ( LIFTING ?auto_28379 ?auto_28378 ) ( IS-CRATE ?auto_28378 ) ( not ( = ?auto_28377 ?auto_28378 ) ) )
    :subtasks
    ( ( !DROP ?auto_28379 ?auto_28378 ?auto_28377 ?auto_28380 )
      ( MAKE-1CRATE-VERIFY ?auto_28377 ?auto_28378 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28381 - SURFACE
      ?auto_28382 - SURFACE
      ?auto_28383 - SURFACE
    )
    :vars
    (
      ?auto_28384 - HOIST
      ?auto_28385 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28384 ?auto_28385 ) ( SURFACE-AT ?auto_28382 ?auto_28385 ) ( CLEAR ?auto_28382 ) ( LIFTING ?auto_28384 ?auto_28383 ) ( IS-CRATE ?auto_28383 ) ( not ( = ?auto_28382 ?auto_28383 ) ) ( ON ?auto_28382 ?auto_28381 ) ( not ( = ?auto_28381 ?auto_28382 ) ) ( not ( = ?auto_28381 ?auto_28383 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28382 ?auto_28383 )
      ( MAKE-2CRATE-VERIFY ?auto_28381 ?auto_28382 ?auto_28383 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28386 - SURFACE
      ?auto_28387 - SURFACE
      ?auto_28388 - SURFACE
      ?auto_28389 - SURFACE
    )
    :vars
    (
      ?auto_28390 - HOIST
      ?auto_28391 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28390 ?auto_28391 ) ( SURFACE-AT ?auto_28388 ?auto_28391 ) ( CLEAR ?auto_28388 ) ( LIFTING ?auto_28390 ?auto_28389 ) ( IS-CRATE ?auto_28389 ) ( not ( = ?auto_28388 ?auto_28389 ) ) ( ON ?auto_28387 ?auto_28386 ) ( ON ?auto_28388 ?auto_28387 ) ( not ( = ?auto_28386 ?auto_28387 ) ) ( not ( = ?auto_28386 ?auto_28388 ) ) ( not ( = ?auto_28386 ?auto_28389 ) ) ( not ( = ?auto_28387 ?auto_28388 ) ) ( not ( = ?auto_28387 ?auto_28389 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28388 ?auto_28389 )
      ( MAKE-3CRATE-VERIFY ?auto_28386 ?auto_28387 ?auto_28388 ?auto_28389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28392 - SURFACE
      ?auto_28393 - SURFACE
    )
    :vars
    (
      ?auto_28394 - HOIST
      ?auto_28395 - PLACE
      ?auto_28396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28394 ?auto_28395 ) ( SURFACE-AT ?auto_28392 ?auto_28395 ) ( CLEAR ?auto_28392 ) ( IS-CRATE ?auto_28393 ) ( not ( = ?auto_28392 ?auto_28393 ) ) ( TRUCK-AT ?auto_28396 ?auto_28395 ) ( AVAILABLE ?auto_28394 ) ( IN ?auto_28393 ?auto_28396 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28394 ?auto_28393 ?auto_28396 ?auto_28395 )
      ( MAKE-1CRATE ?auto_28392 ?auto_28393 )
      ( MAKE-1CRATE-VERIFY ?auto_28392 ?auto_28393 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28397 - SURFACE
      ?auto_28398 - SURFACE
      ?auto_28399 - SURFACE
    )
    :vars
    (
      ?auto_28402 - HOIST
      ?auto_28401 - PLACE
      ?auto_28400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28402 ?auto_28401 ) ( SURFACE-AT ?auto_28398 ?auto_28401 ) ( CLEAR ?auto_28398 ) ( IS-CRATE ?auto_28399 ) ( not ( = ?auto_28398 ?auto_28399 ) ) ( TRUCK-AT ?auto_28400 ?auto_28401 ) ( AVAILABLE ?auto_28402 ) ( IN ?auto_28399 ?auto_28400 ) ( ON ?auto_28398 ?auto_28397 ) ( not ( = ?auto_28397 ?auto_28398 ) ) ( not ( = ?auto_28397 ?auto_28399 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28398 ?auto_28399 )
      ( MAKE-2CRATE-VERIFY ?auto_28397 ?auto_28398 ?auto_28399 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28403 - SURFACE
      ?auto_28404 - SURFACE
      ?auto_28405 - SURFACE
      ?auto_28406 - SURFACE
    )
    :vars
    (
      ?auto_28408 - HOIST
      ?auto_28407 - PLACE
      ?auto_28409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28408 ?auto_28407 ) ( SURFACE-AT ?auto_28405 ?auto_28407 ) ( CLEAR ?auto_28405 ) ( IS-CRATE ?auto_28406 ) ( not ( = ?auto_28405 ?auto_28406 ) ) ( TRUCK-AT ?auto_28409 ?auto_28407 ) ( AVAILABLE ?auto_28408 ) ( IN ?auto_28406 ?auto_28409 ) ( ON ?auto_28405 ?auto_28404 ) ( not ( = ?auto_28404 ?auto_28405 ) ) ( not ( = ?auto_28404 ?auto_28406 ) ) ( ON ?auto_28404 ?auto_28403 ) ( not ( = ?auto_28403 ?auto_28404 ) ) ( not ( = ?auto_28403 ?auto_28405 ) ) ( not ( = ?auto_28403 ?auto_28406 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28404 ?auto_28405 ?auto_28406 )
      ( MAKE-3CRATE-VERIFY ?auto_28403 ?auto_28404 ?auto_28405 ?auto_28406 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28410 - SURFACE
      ?auto_28411 - SURFACE
    )
    :vars
    (
      ?auto_28413 - HOIST
      ?auto_28412 - PLACE
      ?auto_28414 - TRUCK
      ?auto_28415 - SURFACE
      ?auto_28416 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28413 ?auto_28412 ) ( SURFACE-AT ?auto_28410 ?auto_28412 ) ( CLEAR ?auto_28410 ) ( IS-CRATE ?auto_28411 ) ( not ( = ?auto_28410 ?auto_28411 ) ) ( AVAILABLE ?auto_28413 ) ( IN ?auto_28411 ?auto_28414 ) ( ON ?auto_28410 ?auto_28415 ) ( not ( = ?auto_28415 ?auto_28410 ) ) ( not ( = ?auto_28415 ?auto_28411 ) ) ( TRUCK-AT ?auto_28414 ?auto_28416 ) ( not ( = ?auto_28416 ?auto_28412 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28414 ?auto_28416 ?auto_28412 )
      ( MAKE-2CRATE ?auto_28415 ?auto_28410 ?auto_28411 )
      ( MAKE-1CRATE-VERIFY ?auto_28410 ?auto_28411 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28417 - SURFACE
      ?auto_28418 - SURFACE
      ?auto_28419 - SURFACE
    )
    :vars
    (
      ?auto_28420 - HOIST
      ?auto_28422 - PLACE
      ?auto_28421 - TRUCK
      ?auto_28423 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28420 ?auto_28422 ) ( SURFACE-AT ?auto_28418 ?auto_28422 ) ( CLEAR ?auto_28418 ) ( IS-CRATE ?auto_28419 ) ( not ( = ?auto_28418 ?auto_28419 ) ) ( AVAILABLE ?auto_28420 ) ( IN ?auto_28419 ?auto_28421 ) ( ON ?auto_28418 ?auto_28417 ) ( not ( = ?auto_28417 ?auto_28418 ) ) ( not ( = ?auto_28417 ?auto_28419 ) ) ( TRUCK-AT ?auto_28421 ?auto_28423 ) ( not ( = ?auto_28423 ?auto_28422 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28418 ?auto_28419 )
      ( MAKE-2CRATE-VERIFY ?auto_28417 ?auto_28418 ?auto_28419 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28424 - SURFACE
      ?auto_28425 - SURFACE
      ?auto_28426 - SURFACE
      ?auto_28427 - SURFACE
    )
    :vars
    (
      ?auto_28429 - HOIST
      ?auto_28428 - PLACE
      ?auto_28430 - TRUCK
      ?auto_28431 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28429 ?auto_28428 ) ( SURFACE-AT ?auto_28426 ?auto_28428 ) ( CLEAR ?auto_28426 ) ( IS-CRATE ?auto_28427 ) ( not ( = ?auto_28426 ?auto_28427 ) ) ( AVAILABLE ?auto_28429 ) ( IN ?auto_28427 ?auto_28430 ) ( ON ?auto_28426 ?auto_28425 ) ( not ( = ?auto_28425 ?auto_28426 ) ) ( not ( = ?auto_28425 ?auto_28427 ) ) ( TRUCK-AT ?auto_28430 ?auto_28431 ) ( not ( = ?auto_28431 ?auto_28428 ) ) ( ON ?auto_28425 ?auto_28424 ) ( not ( = ?auto_28424 ?auto_28425 ) ) ( not ( = ?auto_28424 ?auto_28426 ) ) ( not ( = ?auto_28424 ?auto_28427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28425 ?auto_28426 ?auto_28427 )
      ( MAKE-3CRATE-VERIFY ?auto_28424 ?auto_28425 ?auto_28426 ?auto_28427 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28432 - SURFACE
      ?auto_28433 - SURFACE
    )
    :vars
    (
      ?auto_28436 - HOIST
      ?auto_28434 - PLACE
      ?auto_28435 - SURFACE
      ?auto_28437 - TRUCK
      ?auto_28438 - PLACE
      ?auto_28439 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28436 ?auto_28434 ) ( SURFACE-AT ?auto_28432 ?auto_28434 ) ( CLEAR ?auto_28432 ) ( IS-CRATE ?auto_28433 ) ( not ( = ?auto_28432 ?auto_28433 ) ) ( AVAILABLE ?auto_28436 ) ( ON ?auto_28432 ?auto_28435 ) ( not ( = ?auto_28435 ?auto_28432 ) ) ( not ( = ?auto_28435 ?auto_28433 ) ) ( TRUCK-AT ?auto_28437 ?auto_28438 ) ( not ( = ?auto_28438 ?auto_28434 ) ) ( HOIST-AT ?auto_28439 ?auto_28438 ) ( LIFTING ?auto_28439 ?auto_28433 ) ( not ( = ?auto_28436 ?auto_28439 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28439 ?auto_28433 ?auto_28437 ?auto_28438 )
      ( MAKE-2CRATE ?auto_28435 ?auto_28432 ?auto_28433 )
      ( MAKE-1CRATE-VERIFY ?auto_28432 ?auto_28433 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28440 - SURFACE
      ?auto_28441 - SURFACE
      ?auto_28442 - SURFACE
    )
    :vars
    (
      ?auto_28443 - HOIST
      ?auto_28444 - PLACE
      ?auto_28447 - TRUCK
      ?auto_28445 - PLACE
      ?auto_28446 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28443 ?auto_28444 ) ( SURFACE-AT ?auto_28441 ?auto_28444 ) ( CLEAR ?auto_28441 ) ( IS-CRATE ?auto_28442 ) ( not ( = ?auto_28441 ?auto_28442 ) ) ( AVAILABLE ?auto_28443 ) ( ON ?auto_28441 ?auto_28440 ) ( not ( = ?auto_28440 ?auto_28441 ) ) ( not ( = ?auto_28440 ?auto_28442 ) ) ( TRUCK-AT ?auto_28447 ?auto_28445 ) ( not ( = ?auto_28445 ?auto_28444 ) ) ( HOIST-AT ?auto_28446 ?auto_28445 ) ( LIFTING ?auto_28446 ?auto_28442 ) ( not ( = ?auto_28443 ?auto_28446 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28441 ?auto_28442 )
      ( MAKE-2CRATE-VERIFY ?auto_28440 ?auto_28441 ?auto_28442 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28448 - SURFACE
      ?auto_28449 - SURFACE
      ?auto_28450 - SURFACE
      ?auto_28451 - SURFACE
    )
    :vars
    (
      ?auto_28452 - HOIST
      ?auto_28455 - PLACE
      ?auto_28456 - TRUCK
      ?auto_28454 - PLACE
      ?auto_28453 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28452 ?auto_28455 ) ( SURFACE-AT ?auto_28450 ?auto_28455 ) ( CLEAR ?auto_28450 ) ( IS-CRATE ?auto_28451 ) ( not ( = ?auto_28450 ?auto_28451 ) ) ( AVAILABLE ?auto_28452 ) ( ON ?auto_28450 ?auto_28449 ) ( not ( = ?auto_28449 ?auto_28450 ) ) ( not ( = ?auto_28449 ?auto_28451 ) ) ( TRUCK-AT ?auto_28456 ?auto_28454 ) ( not ( = ?auto_28454 ?auto_28455 ) ) ( HOIST-AT ?auto_28453 ?auto_28454 ) ( LIFTING ?auto_28453 ?auto_28451 ) ( not ( = ?auto_28452 ?auto_28453 ) ) ( ON ?auto_28449 ?auto_28448 ) ( not ( = ?auto_28448 ?auto_28449 ) ) ( not ( = ?auto_28448 ?auto_28450 ) ) ( not ( = ?auto_28448 ?auto_28451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28449 ?auto_28450 ?auto_28451 )
      ( MAKE-3CRATE-VERIFY ?auto_28448 ?auto_28449 ?auto_28450 ?auto_28451 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28457 - SURFACE
      ?auto_28458 - SURFACE
    )
    :vars
    (
      ?auto_28459 - HOIST
      ?auto_28463 - PLACE
      ?auto_28462 - SURFACE
      ?auto_28464 - TRUCK
      ?auto_28461 - PLACE
      ?auto_28460 - HOIST
      ?auto_28465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28459 ?auto_28463 ) ( SURFACE-AT ?auto_28457 ?auto_28463 ) ( CLEAR ?auto_28457 ) ( IS-CRATE ?auto_28458 ) ( not ( = ?auto_28457 ?auto_28458 ) ) ( AVAILABLE ?auto_28459 ) ( ON ?auto_28457 ?auto_28462 ) ( not ( = ?auto_28462 ?auto_28457 ) ) ( not ( = ?auto_28462 ?auto_28458 ) ) ( TRUCK-AT ?auto_28464 ?auto_28461 ) ( not ( = ?auto_28461 ?auto_28463 ) ) ( HOIST-AT ?auto_28460 ?auto_28461 ) ( not ( = ?auto_28459 ?auto_28460 ) ) ( AVAILABLE ?auto_28460 ) ( SURFACE-AT ?auto_28458 ?auto_28461 ) ( ON ?auto_28458 ?auto_28465 ) ( CLEAR ?auto_28458 ) ( not ( = ?auto_28457 ?auto_28465 ) ) ( not ( = ?auto_28458 ?auto_28465 ) ) ( not ( = ?auto_28462 ?auto_28465 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28460 ?auto_28458 ?auto_28465 ?auto_28461 )
      ( MAKE-2CRATE ?auto_28462 ?auto_28457 ?auto_28458 )
      ( MAKE-1CRATE-VERIFY ?auto_28457 ?auto_28458 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28466 - SURFACE
      ?auto_28467 - SURFACE
      ?auto_28468 - SURFACE
    )
    :vars
    (
      ?auto_28471 - HOIST
      ?auto_28472 - PLACE
      ?auto_28469 - TRUCK
      ?auto_28473 - PLACE
      ?auto_28474 - HOIST
      ?auto_28470 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28471 ?auto_28472 ) ( SURFACE-AT ?auto_28467 ?auto_28472 ) ( CLEAR ?auto_28467 ) ( IS-CRATE ?auto_28468 ) ( not ( = ?auto_28467 ?auto_28468 ) ) ( AVAILABLE ?auto_28471 ) ( ON ?auto_28467 ?auto_28466 ) ( not ( = ?auto_28466 ?auto_28467 ) ) ( not ( = ?auto_28466 ?auto_28468 ) ) ( TRUCK-AT ?auto_28469 ?auto_28473 ) ( not ( = ?auto_28473 ?auto_28472 ) ) ( HOIST-AT ?auto_28474 ?auto_28473 ) ( not ( = ?auto_28471 ?auto_28474 ) ) ( AVAILABLE ?auto_28474 ) ( SURFACE-AT ?auto_28468 ?auto_28473 ) ( ON ?auto_28468 ?auto_28470 ) ( CLEAR ?auto_28468 ) ( not ( = ?auto_28467 ?auto_28470 ) ) ( not ( = ?auto_28468 ?auto_28470 ) ) ( not ( = ?auto_28466 ?auto_28470 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28467 ?auto_28468 )
      ( MAKE-2CRATE-VERIFY ?auto_28466 ?auto_28467 ?auto_28468 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28475 - SURFACE
      ?auto_28476 - SURFACE
      ?auto_28477 - SURFACE
      ?auto_28478 - SURFACE
    )
    :vars
    (
      ?auto_28482 - HOIST
      ?auto_28480 - PLACE
      ?auto_28483 - TRUCK
      ?auto_28479 - PLACE
      ?auto_28481 - HOIST
      ?auto_28484 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28482 ?auto_28480 ) ( SURFACE-AT ?auto_28477 ?auto_28480 ) ( CLEAR ?auto_28477 ) ( IS-CRATE ?auto_28478 ) ( not ( = ?auto_28477 ?auto_28478 ) ) ( AVAILABLE ?auto_28482 ) ( ON ?auto_28477 ?auto_28476 ) ( not ( = ?auto_28476 ?auto_28477 ) ) ( not ( = ?auto_28476 ?auto_28478 ) ) ( TRUCK-AT ?auto_28483 ?auto_28479 ) ( not ( = ?auto_28479 ?auto_28480 ) ) ( HOIST-AT ?auto_28481 ?auto_28479 ) ( not ( = ?auto_28482 ?auto_28481 ) ) ( AVAILABLE ?auto_28481 ) ( SURFACE-AT ?auto_28478 ?auto_28479 ) ( ON ?auto_28478 ?auto_28484 ) ( CLEAR ?auto_28478 ) ( not ( = ?auto_28477 ?auto_28484 ) ) ( not ( = ?auto_28478 ?auto_28484 ) ) ( not ( = ?auto_28476 ?auto_28484 ) ) ( ON ?auto_28476 ?auto_28475 ) ( not ( = ?auto_28475 ?auto_28476 ) ) ( not ( = ?auto_28475 ?auto_28477 ) ) ( not ( = ?auto_28475 ?auto_28478 ) ) ( not ( = ?auto_28475 ?auto_28484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28476 ?auto_28477 ?auto_28478 )
      ( MAKE-3CRATE-VERIFY ?auto_28475 ?auto_28476 ?auto_28477 ?auto_28478 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28485 - SURFACE
      ?auto_28486 - SURFACE
    )
    :vars
    (
      ?auto_28490 - HOIST
      ?auto_28488 - PLACE
      ?auto_28492 - SURFACE
      ?auto_28487 - PLACE
      ?auto_28489 - HOIST
      ?auto_28493 - SURFACE
      ?auto_28491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28490 ?auto_28488 ) ( SURFACE-AT ?auto_28485 ?auto_28488 ) ( CLEAR ?auto_28485 ) ( IS-CRATE ?auto_28486 ) ( not ( = ?auto_28485 ?auto_28486 ) ) ( AVAILABLE ?auto_28490 ) ( ON ?auto_28485 ?auto_28492 ) ( not ( = ?auto_28492 ?auto_28485 ) ) ( not ( = ?auto_28492 ?auto_28486 ) ) ( not ( = ?auto_28487 ?auto_28488 ) ) ( HOIST-AT ?auto_28489 ?auto_28487 ) ( not ( = ?auto_28490 ?auto_28489 ) ) ( AVAILABLE ?auto_28489 ) ( SURFACE-AT ?auto_28486 ?auto_28487 ) ( ON ?auto_28486 ?auto_28493 ) ( CLEAR ?auto_28486 ) ( not ( = ?auto_28485 ?auto_28493 ) ) ( not ( = ?auto_28486 ?auto_28493 ) ) ( not ( = ?auto_28492 ?auto_28493 ) ) ( TRUCK-AT ?auto_28491 ?auto_28488 ) )
    :subtasks
    ( ( !DRIVE ?auto_28491 ?auto_28488 ?auto_28487 )
      ( MAKE-2CRATE ?auto_28492 ?auto_28485 ?auto_28486 )
      ( MAKE-1CRATE-VERIFY ?auto_28485 ?auto_28486 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28494 - SURFACE
      ?auto_28495 - SURFACE
      ?auto_28496 - SURFACE
    )
    :vars
    (
      ?auto_28499 - HOIST
      ?auto_28500 - PLACE
      ?auto_28501 - PLACE
      ?auto_28498 - HOIST
      ?auto_28502 - SURFACE
      ?auto_28497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28499 ?auto_28500 ) ( SURFACE-AT ?auto_28495 ?auto_28500 ) ( CLEAR ?auto_28495 ) ( IS-CRATE ?auto_28496 ) ( not ( = ?auto_28495 ?auto_28496 ) ) ( AVAILABLE ?auto_28499 ) ( ON ?auto_28495 ?auto_28494 ) ( not ( = ?auto_28494 ?auto_28495 ) ) ( not ( = ?auto_28494 ?auto_28496 ) ) ( not ( = ?auto_28501 ?auto_28500 ) ) ( HOIST-AT ?auto_28498 ?auto_28501 ) ( not ( = ?auto_28499 ?auto_28498 ) ) ( AVAILABLE ?auto_28498 ) ( SURFACE-AT ?auto_28496 ?auto_28501 ) ( ON ?auto_28496 ?auto_28502 ) ( CLEAR ?auto_28496 ) ( not ( = ?auto_28495 ?auto_28502 ) ) ( not ( = ?auto_28496 ?auto_28502 ) ) ( not ( = ?auto_28494 ?auto_28502 ) ) ( TRUCK-AT ?auto_28497 ?auto_28500 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28495 ?auto_28496 )
      ( MAKE-2CRATE-VERIFY ?auto_28494 ?auto_28495 ?auto_28496 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28503 - SURFACE
      ?auto_28504 - SURFACE
      ?auto_28505 - SURFACE
      ?auto_28506 - SURFACE
    )
    :vars
    (
      ?auto_28512 - HOIST
      ?auto_28507 - PLACE
      ?auto_28508 - PLACE
      ?auto_28509 - HOIST
      ?auto_28511 - SURFACE
      ?auto_28510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28512 ?auto_28507 ) ( SURFACE-AT ?auto_28505 ?auto_28507 ) ( CLEAR ?auto_28505 ) ( IS-CRATE ?auto_28506 ) ( not ( = ?auto_28505 ?auto_28506 ) ) ( AVAILABLE ?auto_28512 ) ( ON ?auto_28505 ?auto_28504 ) ( not ( = ?auto_28504 ?auto_28505 ) ) ( not ( = ?auto_28504 ?auto_28506 ) ) ( not ( = ?auto_28508 ?auto_28507 ) ) ( HOIST-AT ?auto_28509 ?auto_28508 ) ( not ( = ?auto_28512 ?auto_28509 ) ) ( AVAILABLE ?auto_28509 ) ( SURFACE-AT ?auto_28506 ?auto_28508 ) ( ON ?auto_28506 ?auto_28511 ) ( CLEAR ?auto_28506 ) ( not ( = ?auto_28505 ?auto_28511 ) ) ( not ( = ?auto_28506 ?auto_28511 ) ) ( not ( = ?auto_28504 ?auto_28511 ) ) ( TRUCK-AT ?auto_28510 ?auto_28507 ) ( ON ?auto_28504 ?auto_28503 ) ( not ( = ?auto_28503 ?auto_28504 ) ) ( not ( = ?auto_28503 ?auto_28505 ) ) ( not ( = ?auto_28503 ?auto_28506 ) ) ( not ( = ?auto_28503 ?auto_28511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28504 ?auto_28505 ?auto_28506 )
      ( MAKE-3CRATE-VERIFY ?auto_28503 ?auto_28504 ?auto_28505 ?auto_28506 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28513 - SURFACE
      ?auto_28514 - SURFACE
    )
    :vars
    (
      ?auto_28521 - HOIST
      ?auto_28515 - PLACE
      ?auto_28516 - SURFACE
      ?auto_28517 - PLACE
      ?auto_28518 - HOIST
      ?auto_28520 - SURFACE
      ?auto_28519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28521 ?auto_28515 ) ( IS-CRATE ?auto_28514 ) ( not ( = ?auto_28513 ?auto_28514 ) ) ( not ( = ?auto_28516 ?auto_28513 ) ) ( not ( = ?auto_28516 ?auto_28514 ) ) ( not ( = ?auto_28517 ?auto_28515 ) ) ( HOIST-AT ?auto_28518 ?auto_28517 ) ( not ( = ?auto_28521 ?auto_28518 ) ) ( AVAILABLE ?auto_28518 ) ( SURFACE-AT ?auto_28514 ?auto_28517 ) ( ON ?auto_28514 ?auto_28520 ) ( CLEAR ?auto_28514 ) ( not ( = ?auto_28513 ?auto_28520 ) ) ( not ( = ?auto_28514 ?auto_28520 ) ) ( not ( = ?auto_28516 ?auto_28520 ) ) ( TRUCK-AT ?auto_28519 ?auto_28515 ) ( SURFACE-AT ?auto_28516 ?auto_28515 ) ( CLEAR ?auto_28516 ) ( LIFTING ?auto_28521 ?auto_28513 ) ( IS-CRATE ?auto_28513 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28516 ?auto_28513 )
      ( MAKE-2CRATE ?auto_28516 ?auto_28513 ?auto_28514 )
      ( MAKE-1CRATE-VERIFY ?auto_28513 ?auto_28514 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28522 - SURFACE
      ?auto_28523 - SURFACE
      ?auto_28524 - SURFACE
    )
    :vars
    (
      ?auto_28528 - HOIST
      ?auto_28527 - PLACE
      ?auto_28530 - PLACE
      ?auto_28525 - HOIST
      ?auto_28526 - SURFACE
      ?auto_28529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28528 ?auto_28527 ) ( IS-CRATE ?auto_28524 ) ( not ( = ?auto_28523 ?auto_28524 ) ) ( not ( = ?auto_28522 ?auto_28523 ) ) ( not ( = ?auto_28522 ?auto_28524 ) ) ( not ( = ?auto_28530 ?auto_28527 ) ) ( HOIST-AT ?auto_28525 ?auto_28530 ) ( not ( = ?auto_28528 ?auto_28525 ) ) ( AVAILABLE ?auto_28525 ) ( SURFACE-AT ?auto_28524 ?auto_28530 ) ( ON ?auto_28524 ?auto_28526 ) ( CLEAR ?auto_28524 ) ( not ( = ?auto_28523 ?auto_28526 ) ) ( not ( = ?auto_28524 ?auto_28526 ) ) ( not ( = ?auto_28522 ?auto_28526 ) ) ( TRUCK-AT ?auto_28529 ?auto_28527 ) ( SURFACE-AT ?auto_28522 ?auto_28527 ) ( CLEAR ?auto_28522 ) ( LIFTING ?auto_28528 ?auto_28523 ) ( IS-CRATE ?auto_28523 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28523 ?auto_28524 )
      ( MAKE-2CRATE-VERIFY ?auto_28522 ?auto_28523 ?auto_28524 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28531 - SURFACE
      ?auto_28532 - SURFACE
      ?auto_28533 - SURFACE
      ?auto_28534 - SURFACE
    )
    :vars
    (
      ?auto_28540 - HOIST
      ?auto_28537 - PLACE
      ?auto_28536 - PLACE
      ?auto_28538 - HOIST
      ?auto_28539 - SURFACE
      ?auto_28535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28540 ?auto_28537 ) ( IS-CRATE ?auto_28534 ) ( not ( = ?auto_28533 ?auto_28534 ) ) ( not ( = ?auto_28532 ?auto_28533 ) ) ( not ( = ?auto_28532 ?auto_28534 ) ) ( not ( = ?auto_28536 ?auto_28537 ) ) ( HOIST-AT ?auto_28538 ?auto_28536 ) ( not ( = ?auto_28540 ?auto_28538 ) ) ( AVAILABLE ?auto_28538 ) ( SURFACE-AT ?auto_28534 ?auto_28536 ) ( ON ?auto_28534 ?auto_28539 ) ( CLEAR ?auto_28534 ) ( not ( = ?auto_28533 ?auto_28539 ) ) ( not ( = ?auto_28534 ?auto_28539 ) ) ( not ( = ?auto_28532 ?auto_28539 ) ) ( TRUCK-AT ?auto_28535 ?auto_28537 ) ( SURFACE-AT ?auto_28532 ?auto_28537 ) ( CLEAR ?auto_28532 ) ( LIFTING ?auto_28540 ?auto_28533 ) ( IS-CRATE ?auto_28533 ) ( ON ?auto_28532 ?auto_28531 ) ( not ( = ?auto_28531 ?auto_28532 ) ) ( not ( = ?auto_28531 ?auto_28533 ) ) ( not ( = ?auto_28531 ?auto_28534 ) ) ( not ( = ?auto_28531 ?auto_28539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28532 ?auto_28533 ?auto_28534 )
      ( MAKE-3CRATE-VERIFY ?auto_28531 ?auto_28532 ?auto_28533 ?auto_28534 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28541 - SURFACE
      ?auto_28542 - SURFACE
    )
    :vars
    (
      ?auto_28549 - HOIST
      ?auto_28546 - PLACE
      ?auto_28543 - SURFACE
      ?auto_28545 - PLACE
      ?auto_28547 - HOIST
      ?auto_28548 - SURFACE
      ?auto_28544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28549 ?auto_28546 ) ( IS-CRATE ?auto_28542 ) ( not ( = ?auto_28541 ?auto_28542 ) ) ( not ( = ?auto_28543 ?auto_28541 ) ) ( not ( = ?auto_28543 ?auto_28542 ) ) ( not ( = ?auto_28545 ?auto_28546 ) ) ( HOIST-AT ?auto_28547 ?auto_28545 ) ( not ( = ?auto_28549 ?auto_28547 ) ) ( AVAILABLE ?auto_28547 ) ( SURFACE-AT ?auto_28542 ?auto_28545 ) ( ON ?auto_28542 ?auto_28548 ) ( CLEAR ?auto_28542 ) ( not ( = ?auto_28541 ?auto_28548 ) ) ( not ( = ?auto_28542 ?auto_28548 ) ) ( not ( = ?auto_28543 ?auto_28548 ) ) ( TRUCK-AT ?auto_28544 ?auto_28546 ) ( SURFACE-AT ?auto_28543 ?auto_28546 ) ( CLEAR ?auto_28543 ) ( IS-CRATE ?auto_28541 ) ( AVAILABLE ?auto_28549 ) ( IN ?auto_28541 ?auto_28544 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28549 ?auto_28541 ?auto_28544 ?auto_28546 )
      ( MAKE-2CRATE ?auto_28543 ?auto_28541 ?auto_28542 )
      ( MAKE-1CRATE-VERIFY ?auto_28541 ?auto_28542 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28550 - SURFACE
      ?auto_28551 - SURFACE
      ?auto_28552 - SURFACE
    )
    :vars
    (
      ?auto_28554 - HOIST
      ?auto_28553 - PLACE
      ?auto_28556 - PLACE
      ?auto_28555 - HOIST
      ?auto_28557 - SURFACE
      ?auto_28558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28554 ?auto_28553 ) ( IS-CRATE ?auto_28552 ) ( not ( = ?auto_28551 ?auto_28552 ) ) ( not ( = ?auto_28550 ?auto_28551 ) ) ( not ( = ?auto_28550 ?auto_28552 ) ) ( not ( = ?auto_28556 ?auto_28553 ) ) ( HOIST-AT ?auto_28555 ?auto_28556 ) ( not ( = ?auto_28554 ?auto_28555 ) ) ( AVAILABLE ?auto_28555 ) ( SURFACE-AT ?auto_28552 ?auto_28556 ) ( ON ?auto_28552 ?auto_28557 ) ( CLEAR ?auto_28552 ) ( not ( = ?auto_28551 ?auto_28557 ) ) ( not ( = ?auto_28552 ?auto_28557 ) ) ( not ( = ?auto_28550 ?auto_28557 ) ) ( TRUCK-AT ?auto_28558 ?auto_28553 ) ( SURFACE-AT ?auto_28550 ?auto_28553 ) ( CLEAR ?auto_28550 ) ( IS-CRATE ?auto_28551 ) ( AVAILABLE ?auto_28554 ) ( IN ?auto_28551 ?auto_28558 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28551 ?auto_28552 )
      ( MAKE-2CRATE-VERIFY ?auto_28550 ?auto_28551 ?auto_28552 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28559 - SURFACE
      ?auto_28560 - SURFACE
      ?auto_28561 - SURFACE
      ?auto_28562 - SURFACE
    )
    :vars
    (
      ?auto_28567 - HOIST
      ?auto_28568 - PLACE
      ?auto_28565 - PLACE
      ?auto_28566 - HOIST
      ?auto_28563 - SURFACE
      ?auto_28564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28567 ?auto_28568 ) ( IS-CRATE ?auto_28562 ) ( not ( = ?auto_28561 ?auto_28562 ) ) ( not ( = ?auto_28560 ?auto_28561 ) ) ( not ( = ?auto_28560 ?auto_28562 ) ) ( not ( = ?auto_28565 ?auto_28568 ) ) ( HOIST-AT ?auto_28566 ?auto_28565 ) ( not ( = ?auto_28567 ?auto_28566 ) ) ( AVAILABLE ?auto_28566 ) ( SURFACE-AT ?auto_28562 ?auto_28565 ) ( ON ?auto_28562 ?auto_28563 ) ( CLEAR ?auto_28562 ) ( not ( = ?auto_28561 ?auto_28563 ) ) ( not ( = ?auto_28562 ?auto_28563 ) ) ( not ( = ?auto_28560 ?auto_28563 ) ) ( TRUCK-AT ?auto_28564 ?auto_28568 ) ( SURFACE-AT ?auto_28560 ?auto_28568 ) ( CLEAR ?auto_28560 ) ( IS-CRATE ?auto_28561 ) ( AVAILABLE ?auto_28567 ) ( IN ?auto_28561 ?auto_28564 ) ( ON ?auto_28560 ?auto_28559 ) ( not ( = ?auto_28559 ?auto_28560 ) ) ( not ( = ?auto_28559 ?auto_28561 ) ) ( not ( = ?auto_28559 ?auto_28562 ) ) ( not ( = ?auto_28559 ?auto_28563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28560 ?auto_28561 ?auto_28562 )
      ( MAKE-3CRATE-VERIFY ?auto_28559 ?auto_28560 ?auto_28561 ?auto_28562 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28569 - SURFACE
      ?auto_28570 - SURFACE
    )
    :vars
    (
      ?auto_28576 - HOIST
      ?auto_28577 - PLACE
      ?auto_28572 - SURFACE
      ?auto_28574 - PLACE
      ?auto_28575 - HOIST
      ?auto_28571 - SURFACE
      ?auto_28573 - TRUCK
      ?auto_28578 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28576 ?auto_28577 ) ( IS-CRATE ?auto_28570 ) ( not ( = ?auto_28569 ?auto_28570 ) ) ( not ( = ?auto_28572 ?auto_28569 ) ) ( not ( = ?auto_28572 ?auto_28570 ) ) ( not ( = ?auto_28574 ?auto_28577 ) ) ( HOIST-AT ?auto_28575 ?auto_28574 ) ( not ( = ?auto_28576 ?auto_28575 ) ) ( AVAILABLE ?auto_28575 ) ( SURFACE-AT ?auto_28570 ?auto_28574 ) ( ON ?auto_28570 ?auto_28571 ) ( CLEAR ?auto_28570 ) ( not ( = ?auto_28569 ?auto_28571 ) ) ( not ( = ?auto_28570 ?auto_28571 ) ) ( not ( = ?auto_28572 ?auto_28571 ) ) ( SURFACE-AT ?auto_28572 ?auto_28577 ) ( CLEAR ?auto_28572 ) ( IS-CRATE ?auto_28569 ) ( AVAILABLE ?auto_28576 ) ( IN ?auto_28569 ?auto_28573 ) ( TRUCK-AT ?auto_28573 ?auto_28578 ) ( not ( = ?auto_28578 ?auto_28577 ) ) ( not ( = ?auto_28574 ?auto_28578 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28573 ?auto_28578 ?auto_28577 )
      ( MAKE-2CRATE ?auto_28572 ?auto_28569 ?auto_28570 )
      ( MAKE-1CRATE-VERIFY ?auto_28569 ?auto_28570 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28579 - SURFACE
      ?auto_28580 - SURFACE
      ?auto_28581 - SURFACE
    )
    :vars
    (
      ?auto_28586 - HOIST
      ?auto_28583 - PLACE
      ?auto_28585 - PLACE
      ?auto_28582 - HOIST
      ?auto_28587 - SURFACE
      ?auto_28584 - TRUCK
      ?auto_28588 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28586 ?auto_28583 ) ( IS-CRATE ?auto_28581 ) ( not ( = ?auto_28580 ?auto_28581 ) ) ( not ( = ?auto_28579 ?auto_28580 ) ) ( not ( = ?auto_28579 ?auto_28581 ) ) ( not ( = ?auto_28585 ?auto_28583 ) ) ( HOIST-AT ?auto_28582 ?auto_28585 ) ( not ( = ?auto_28586 ?auto_28582 ) ) ( AVAILABLE ?auto_28582 ) ( SURFACE-AT ?auto_28581 ?auto_28585 ) ( ON ?auto_28581 ?auto_28587 ) ( CLEAR ?auto_28581 ) ( not ( = ?auto_28580 ?auto_28587 ) ) ( not ( = ?auto_28581 ?auto_28587 ) ) ( not ( = ?auto_28579 ?auto_28587 ) ) ( SURFACE-AT ?auto_28579 ?auto_28583 ) ( CLEAR ?auto_28579 ) ( IS-CRATE ?auto_28580 ) ( AVAILABLE ?auto_28586 ) ( IN ?auto_28580 ?auto_28584 ) ( TRUCK-AT ?auto_28584 ?auto_28588 ) ( not ( = ?auto_28588 ?auto_28583 ) ) ( not ( = ?auto_28585 ?auto_28588 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28580 ?auto_28581 )
      ( MAKE-2CRATE-VERIFY ?auto_28579 ?auto_28580 ?auto_28581 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28589 - SURFACE
      ?auto_28590 - SURFACE
      ?auto_28591 - SURFACE
      ?auto_28592 - SURFACE
    )
    :vars
    (
      ?auto_28595 - HOIST
      ?auto_28596 - PLACE
      ?auto_28597 - PLACE
      ?auto_28599 - HOIST
      ?auto_28593 - SURFACE
      ?auto_28598 - TRUCK
      ?auto_28594 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28595 ?auto_28596 ) ( IS-CRATE ?auto_28592 ) ( not ( = ?auto_28591 ?auto_28592 ) ) ( not ( = ?auto_28590 ?auto_28591 ) ) ( not ( = ?auto_28590 ?auto_28592 ) ) ( not ( = ?auto_28597 ?auto_28596 ) ) ( HOIST-AT ?auto_28599 ?auto_28597 ) ( not ( = ?auto_28595 ?auto_28599 ) ) ( AVAILABLE ?auto_28599 ) ( SURFACE-AT ?auto_28592 ?auto_28597 ) ( ON ?auto_28592 ?auto_28593 ) ( CLEAR ?auto_28592 ) ( not ( = ?auto_28591 ?auto_28593 ) ) ( not ( = ?auto_28592 ?auto_28593 ) ) ( not ( = ?auto_28590 ?auto_28593 ) ) ( SURFACE-AT ?auto_28590 ?auto_28596 ) ( CLEAR ?auto_28590 ) ( IS-CRATE ?auto_28591 ) ( AVAILABLE ?auto_28595 ) ( IN ?auto_28591 ?auto_28598 ) ( TRUCK-AT ?auto_28598 ?auto_28594 ) ( not ( = ?auto_28594 ?auto_28596 ) ) ( not ( = ?auto_28597 ?auto_28594 ) ) ( ON ?auto_28590 ?auto_28589 ) ( not ( = ?auto_28589 ?auto_28590 ) ) ( not ( = ?auto_28589 ?auto_28591 ) ) ( not ( = ?auto_28589 ?auto_28592 ) ) ( not ( = ?auto_28589 ?auto_28593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28590 ?auto_28591 ?auto_28592 )
      ( MAKE-3CRATE-VERIFY ?auto_28589 ?auto_28590 ?auto_28591 ?auto_28592 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28600 - SURFACE
      ?auto_28601 - SURFACE
    )
    :vars
    (
      ?auto_28605 - HOIST
      ?auto_28606 - PLACE
      ?auto_28602 - SURFACE
      ?auto_28607 - PLACE
      ?auto_28609 - HOIST
      ?auto_28603 - SURFACE
      ?auto_28608 - TRUCK
      ?auto_28604 - PLACE
      ?auto_28610 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28605 ?auto_28606 ) ( IS-CRATE ?auto_28601 ) ( not ( = ?auto_28600 ?auto_28601 ) ) ( not ( = ?auto_28602 ?auto_28600 ) ) ( not ( = ?auto_28602 ?auto_28601 ) ) ( not ( = ?auto_28607 ?auto_28606 ) ) ( HOIST-AT ?auto_28609 ?auto_28607 ) ( not ( = ?auto_28605 ?auto_28609 ) ) ( AVAILABLE ?auto_28609 ) ( SURFACE-AT ?auto_28601 ?auto_28607 ) ( ON ?auto_28601 ?auto_28603 ) ( CLEAR ?auto_28601 ) ( not ( = ?auto_28600 ?auto_28603 ) ) ( not ( = ?auto_28601 ?auto_28603 ) ) ( not ( = ?auto_28602 ?auto_28603 ) ) ( SURFACE-AT ?auto_28602 ?auto_28606 ) ( CLEAR ?auto_28602 ) ( IS-CRATE ?auto_28600 ) ( AVAILABLE ?auto_28605 ) ( TRUCK-AT ?auto_28608 ?auto_28604 ) ( not ( = ?auto_28604 ?auto_28606 ) ) ( not ( = ?auto_28607 ?auto_28604 ) ) ( HOIST-AT ?auto_28610 ?auto_28604 ) ( LIFTING ?auto_28610 ?auto_28600 ) ( not ( = ?auto_28605 ?auto_28610 ) ) ( not ( = ?auto_28609 ?auto_28610 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28610 ?auto_28600 ?auto_28608 ?auto_28604 )
      ( MAKE-2CRATE ?auto_28602 ?auto_28600 ?auto_28601 )
      ( MAKE-1CRATE-VERIFY ?auto_28600 ?auto_28601 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28611 - SURFACE
      ?auto_28612 - SURFACE
      ?auto_28613 - SURFACE
    )
    :vars
    (
      ?auto_28620 - HOIST
      ?auto_28616 - PLACE
      ?auto_28615 - PLACE
      ?auto_28621 - HOIST
      ?auto_28619 - SURFACE
      ?auto_28618 - TRUCK
      ?auto_28617 - PLACE
      ?auto_28614 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28620 ?auto_28616 ) ( IS-CRATE ?auto_28613 ) ( not ( = ?auto_28612 ?auto_28613 ) ) ( not ( = ?auto_28611 ?auto_28612 ) ) ( not ( = ?auto_28611 ?auto_28613 ) ) ( not ( = ?auto_28615 ?auto_28616 ) ) ( HOIST-AT ?auto_28621 ?auto_28615 ) ( not ( = ?auto_28620 ?auto_28621 ) ) ( AVAILABLE ?auto_28621 ) ( SURFACE-AT ?auto_28613 ?auto_28615 ) ( ON ?auto_28613 ?auto_28619 ) ( CLEAR ?auto_28613 ) ( not ( = ?auto_28612 ?auto_28619 ) ) ( not ( = ?auto_28613 ?auto_28619 ) ) ( not ( = ?auto_28611 ?auto_28619 ) ) ( SURFACE-AT ?auto_28611 ?auto_28616 ) ( CLEAR ?auto_28611 ) ( IS-CRATE ?auto_28612 ) ( AVAILABLE ?auto_28620 ) ( TRUCK-AT ?auto_28618 ?auto_28617 ) ( not ( = ?auto_28617 ?auto_28616 ) ) ( not ( = ?auto_28615 ?auto_28617 ) ) ( HOIST-AT ?auto_28614 ?auto_28617 ) ( LIFTING ?auto_28614 ?auto_28612 ) ( not ( = ?auto_28620 ?auto_28614 ) ) ( not ( = ?auto_28621 ?auto_28614 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28612 ?auto_28613 )
      ( MAKE-2CRATE-VERIFY ?auto_28611 ?auto_28612 ?auto_28613 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28622 - SURFACE
      ?auto_28623 - SURFACE
      ?auto_28624 - SURFACE
      ?auto_28625 - SURFACE
    )
    :vars
    (
      ?auto_28626 - HOIST
      ?auto_28628 - PLACE
      ?auto_28633 - PLACE
      ?auto_28631 - HOIST
      ?auto_28629 - SURFACE
      ?auto_28630 - TRUCK
      ?auto_28627 - PLACE
      ?auto_28632 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28626 ?auto_28628 ) ( IS-CRATE ?auto_28625 ) ( not ( = ?auto_28624 ?auto_28625 ) ) ( not ( = ?auto_28623 ?auto_28624 ) ) ( not ( = ?auto_28623 ?auto_28625 ) ) ( not ( = ?auto_28633 ?auto_28628 ) ) ( HOIST-AT ?auto_28631 ?auto_28633 ) ( not ( = ?auto_28626 ?auto_28631 ) ) ( AVAILABLE ?auto_28631 ) ( SURFACE-AT ?auto_28625 ?auto_28633 ) ( ON ?auto_28625 ?auto_28629 ) ( CLEAR ?auto_28625 ) ( not ( = ?auto_28624 ?auto_28629 ) ) ( not ( = ?auto_28625 ?auto_28629 ) ) ( not ( = ?auto_28623 ?auto_28629 ) ) ( SURFACE-AT ?auto_28623 ?auto_28628 ) ( CLEAR ?auto_28623 ) ( IS-CRATE ?auto_28624 ) ( AVAILABLE ?auto_28626 ) ( TRUCK-AT ?auto_28630 ?auto_28627 ) ( not ( = ?auto_28627 ?auto_28628 ) ) ( not ( = ?auto_28633 ?auto_28627 ) ) ( HOIST-AT ?auto_28632 ?auto_28627 ) ( LIFTING ?auto_28632 ?auto_28624 ) ( not ( = ?auto_28626 ?auto_28632 ) ) ( not ( = ?auto_28631 ?auto_28632 ) ) ( ON ?auto_28623 ?auto_28622 ) ( not ( = ?auto_28622 ?auto_28623 ) ) ( not ( = ?auto_28622 ?auto_28624 ) ) ( not ( = ?auto_28622 ?auto_28625 ) ) ( not ( = ?auto_28622 ?auto_28629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28623 ?auto_28624 ?auto_28625 )
      ( MAKE-3CRATE-VERIFY ?auto_28622 ?auto_28623 ?auto_28624 ?auto_28625 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28634 - SURFACE
      ?auto_28635 - SURFACE
    )
    :vars
    (
      ?auto_28636 - HOIST
      ?auto_28639 - PLACE
      ?auto_28637 - SURFACE
      ?auto_28644 - PLACE
      ?auto_28642 - HOIST
      ?auto_28640 - SURFACE
      ?auto_28641 - TRUCK
      ?auto_28638 - PLACE
      ?auto_28643 - HOIST
      ?auto_28645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28636 ?auto_28639 ) ( IS-CRATE ?auto_28635 ) ( not ( = ?auto_28634 ?auto_28635 ) ) ( not ( = ?auto_28637 ?auto_28634 ) ) ( not ( = ?auto_28637 ?auto_28635 ) ) ( not ( = ?auto_28644 ?auto_28639 ) ) ( HOIST-AT ?auto_28642 ?auto_28644 ) ( not ( = ?auto_28636 ?auto_28642 ) ) ( AVAILABLE ?auto_28642 ) ( SURFACE-AT ?auto_28635 ?auto_28644 ) ( ON ?auto_28635 ?auto_28640 ) ( CLEAR ?auto_28635 ) ( not ( = ?auto_28634 ?auto_28640 ) ) ( not ( = ?auto_28635 ?auto_28640 ) ) ( not ( = ?auto_28637 ?auto_28640 ) ) ( SURFACE-AT ?auto_28637 ?auto_28639 ) ( CLEAR ?auto_28637 ) ( IS-CRATE ?auto_28634 ) ( AVAILABLE ?auto_28636 ) ( TRUCK-AT ?auto_28641 ?auto_28638 ) ( not ( = ?auto_28638 ?auto_28639 ) ) ( not ( = ?auto_28644 ?auto_28638 ) ) ( HOIST-AT ?auto_28643 ?auto_28638 ) ( not ( = ?auto_28636 ?auto_28643 ) ) ( not ( = ?auto_28642 ?auto_28643 ) ) ( AVAILABLE ?auto_28643 ) ( SURFACE-AT ?auto_28634 ?auto_28638 ) ( ON ?auto_28634 ?auto_28645 ) ( CLEAR ?auto_28634 ) ( not ( = ?auto_28634 ?auto_28645 ) ) ( not ( = ?auto_28635 ?auto_28645 ) ) ( not ( = ?auto_28637 ?auto_28645 ) ) ( not ( = ?auto_28640 ?auto_28645 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28643 ?auto_28634 ?auto_28645 ?auto_28638 )
      ( MAKE-2CRATE ?auto_28637 ?auto_28634 ?auto_28635 )
      ( MAKE-1CRATE-VERIFY ?auto_28634 ?auto_28635 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28646 - SURFACE
      ?auto_28647 - SURFACE
      ?auto_28648 - SURFACE
    )
    :vars
    (
      ?auto_28654 - HOIST
      ?auto_28653 - PLACE
      ?auto_28652 - PLACE
      ?auto_28651 - HOIST
      ?auto_28655 - SURFACE
      ?auto_28656 - TRUCK
      ?auto_28649 - PLACE
      ?auto_28657 - HOIST
      ?auto_28650 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28654 ?auto_28653 ) ( IS-CRATE ?auto_28648 ) ( not ( = ?auto_28647 ?auto_28648 ) ) ( not ( = ?auto_28646 ?auto_28647 ) ) ( not ( = ?auto_28646 ?auto_28648 ) ) ( not ( = ?auto_28652 ?auto_28653 ) ) ( HOIST-AT ?auto_28651 ?auto_28652 ) ( not ( = ?auto_28654 ?auto_28651 ) ) ( AVAILABLE ?auto_28651 ) ( SURFACE-AT ?auto_28648 ?auto_28652 ) ( ON ?auto_28648 ?auto_28655 ) ( CLEAR ?auto_28648 ) ( not ( = ?auto_28647 ?auto_28655 ) ) ( not ( = ?auto_28648 ?auto_28655 ) ) ( not ( = ?auto_28646 ?auto_28655 ) ) ( SURFACE-AT ?auto_28646 ?auto_28653 ) ( CLEAR ?auto_28646 ) ( IS-CRATE ?auto_28647 ) ( AVAILABLE ?auto_28654 ) ( TRUCK-AT ?auto_28656 ?auto_28649 ) ( not ( = ?auto_28649 ?auto_28653 ) ) ( not ( = ?auto_28652 ?auto_28649 ) ) ( HOIST-AT ?auto_28657 ?auto_28649 ) ( not ( = ?auto_28654 ?auto_28657 ) ) ( not ( = ?auto_28651 ?auto_28657 ) ) ( AVAILABLE ?auto_28657 ) ( SURFACE-AT ?auto_28647 ?auto_28649 ) ( ON ?auto_28647 ?auto_28650 ) ( CLEAR ?auto_28647 ) ( not ( = ?auto_28647 ?auto_28650 ) ) ( not ( = ?auto_28648 ?auto_28650 ) ) ( not ( = ?auto_28646 ?auto_28650 ) ) ( not ( = ?auto_28655 ?auto_28650 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28647 ?auto_28648 )
      ( MAKE-2CRATE-VERIFY ?auto_28646 ?auto_28647 ?auto_28648 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28658 - SURFACE
      ?auto_28659 - SURFACE
      ?auto_28660 - SURFACE
      ?auto_28661 - SURFACE
    )
    :vars
    (
      ?auto_28662 - HOIST
      ?auto_28667 - PLACE
      ?auto_28670 - PLACE
      ?auto_28664 - HOIST
      ?auto_28669 - SURFACE
      ?auto_28665 - TRUCK
      ?auto_28668 - PLACE
      ?auto_28663 - HOIST
      ?auto_28666 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28662 ?auto_28667 ) ( IS-CRATE ?auto_28661 ) ( not ( = ?auto_28660 ?auto_28661 ) ) ( not ( = ?auto_28659 ?auto_28660 ) ) ( not ( = ?auto_28659 ?auto_28661 ) ) ( not ( = ?auto_28670 ?auto_28667 ) ) ( HOIST-AT ?auto_28664 ?auto_28670 ) ( not ( = ?auto_28662 ?auto_28664 ) ) ( AVAILABLE ?auto_28664 ) ( SURFACE-AT ?auto_28661 ?auto_28670 ) ( ON ?auto_28661 ?auto_28669 ) ( CLEAR ?auto_28661 ) ( not ( = ?auto_28660 ?auto_28669 ) ) ( not ( = ?auto_28661 ?auto_28669 ) ) ( not ( = ?auto_28659 ?auto_28669 ) ) ( SURFACE-AT ?auto_28659 ?auto_28667 ) ( CLEAR ?auto_28659 ) ( IS-CRATE ?auto_28660 ) ( AVAILABLE ?auto_28662 ) ( TRUCK-AT ?auto_28665 ?auto_28668 ) ( not ( = ?auto_28668 ?auto_28667 ) ) ( not ( = ?auto_28670 ?auto_28668 ) ) ( HOIST-AT ?auto_28663 ?auto_28668 ) ( not ( = ?auto_28662 ?auto_28663 ) ) ( not ( = ?auto_28664 ?auto_28663 ) ) ( AVAILABLE ?auto_28663 ) ( SURFACE-AT ?auto_28660 ?auto_28668 ) ( ON ?auto_28660 ?auto_28666 ) ( CLEAR ?auto_28660 ) ( not ( = ?auto_28660 ?auto_28666 ) ) ( not ( = ?auto_28661 ?auto_28666 ) ) ( not ( = ?auto_28659 ?auto_28666 ) ) ( not ( = ?auto_28669 ?auto_28666 ) ) ( ON ?auto_28659 ?auto_28658 ) ( not ( = ?auto_28658 ?auto_28659 ) ) ( not ( = ?auto_28658 ?auto_28660 ) ) ( not ( = ?auto_28658 ?auto_28661 ) ) ( not ( = ?auto_28658 ?auto_28669 ) ) ( not ( = ?auto_28658 ?auto_28666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28659 ?auto_28660 ?auto_28661 )
      ( MAKE-3CRATE-VERIFY ?auto_28658 ?auto_28659 ?auto_28660 ?auto_28661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28671 - SURFACE
      ?auto_28672 - SURFACE
    )
    :vars
    (
      ?auto_28673 - HOIST
      ?auto_28678 - PLACE
      ?auto_28682 - SURFACE
      ?auto_28681 - PLACE
      ?auto_28675 - HOIST
      ?auto_28680 - SURFACE
      ?auto_28679 - PLACE
      ?auto_28674 - HOIST
      ?auto_28677 - SURFACE
      ?auto_28676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28673 ?auto_28678 ) ( IS-CRATE ?auto_28672 ) ( not ( = ?auto_28671 ?auto_28672 ) ) ( not ( = ?auto_28682 ?auto_28671 ) ) ( not ( = ?auto_28682 ?auto_28672 ) ) ( not ( = ?auto_28681 ?auto_28678 ) ) ( HOIST-AT ?auto_28675 ?auto_28681 ) ( not ( = ?auto_28673 ?auto_28675 ) ) ( AVAILABLE ?auto_28675 ) ( SURFACE-AT ?auto_28672 ?auto_28681 ) ( ON ?auto_28672 ?auto_28680 ) ( CLEAR ?auto_28672 ) ( not ( = ?auto_28671 ?auto_28680 ) ) ( not ( = ?auto_28672 ?auto_28680 ) ) ( not ( = ?auto_28682 ?auto_28680 ) ) ( SURFACE-AT ?auto_28682 ?auto_28678 ) ( CLEAR ?auto_28682 ) ( IS-CRATE ?auto_28671 ) ( AVAILABLE ?auto_28673 ) ( not ( = ?auto_28679 ?auto_28678 ) ) ( not ( = ?auto_28681 ?auto_28679 ) ) ( HOIST-AT ?auto_28674 ?auto_28679 ) ( not ( = ?auto_28673 ?auto_28674 ) ) ( not ( = ?auto_28675 ?auto_28674 ) ) ( AVAILABLE ?auto_28674 ) ( SURFACE-AT ?auto_28671 ?auto_28679 ) ( ON ?auto_28671 ?auto_28677 ) ( CLEAR ?auto_28671 ) ( not ( = ?auto_28671 ?auto_28677 ) ) ( not ( = ?auto_28672 ?auto_28677 ) ) ( not ( = ?auto_28682 ?auto_28677 ) ) ( not ( = ?auto_28680 ?auto_28677 ) ) ( TRUCK-AT ?auto_28676 ?auto_28678 ) )
    :subtasks
    ( ( !DRIVE ?auto_28676 ?auto_28678 ?auto_28679 )
      ( MAKE-2CRATE ?auto_28682 ?auto_28671 ?auto_28672 )
      ( MAKE-1CRATE-VERIFY ?auto_28671 ?auto_28672 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28683 - SURFACE
      ?auto_28684 - SURFACE
      ?auto_28685 - SURFACE
    )
    :vars
    (
      ?auto_28686 - HOIST
      ?auto_28690 - PLACE
      ?auto_28692 - PLACE
      ?auto_28689 - HOIST
      ?auto_28687 - SURFACE
      ?auto_28693 - PLACE
      ?auto_28694 - HOIST
      ?auto_28688 - SURFACE
      ?auto_28691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28686 ?auto_28690 ) ( IS-CRATE ?auto_28685 ) ( not ( = ?auto_28684 ?auto_28685 ) ) ( not ( = ?auto_28683 ?auto_28684 ) ) ( not ( = ?auto_28683 ?auto_28685 ) ) ( not ( = ?auto_28692 ?auto_28690 ) ) ( HOIST-AT ?auto_28689 ?auto_28692 ) ( not ( = ?auto_28686 ?auto_28689 ) ) ( AVAILABLE ?auto_28689 ) ( SURFACE-AT ?auto_28685 ?auto_28692 ) ( ON ?auto_28685 ?auto_28687 ) ( CLEAR ?auto_28685 ) ( not ( = ?auto_28684 ?auto_28687 ) ) ( not ( = ?auto_28685 ?auto_28687 ) ) ( not ( = ?auto_28683 ?auto_28687 ) ) ( SURFACE-AT ?auto_28683 ?auto_28690 ) ( CLEAR ?auto_28683 ) ( IS-CRATE ?auto_28684 ) ( AVAILABLE ?auto_28686 ) ( not ( = ?auto_28693 ?auto_28690 ) ) ( not ( = ?auto_28692 ?auto_28693 ) ) ( HOIST-AT ?auto_28694 ?auto_28693 ) ( not ( = ?auto_28686 ?auto_28694 ) ) ( not ( = ?auto_28689 ?auto_28694 ) ) ( AVAILABLE ?auto_28694 ) ( SURFACE-AT ?auto_28684 ?auto_28693 ) ( ON ?auto_28684 ?auto_28688 ) ( CLEAR ?auto_28684 ) ( not ( = ?auto_28684 ?auto_28688 ) ) ( not ( = ?auto_28685 ?auto_28688 ) ) ( not ( = ?auto_28683 ?auto_28688 ) ) ( not ( = ?auto_28687 ?auto_28688 ) ) ( TRUCK-AT ?auto_28691 ?auto_28690 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28684 ?auto_28685 )
      ( MAKE-2CRATE-VERIFY ?auto_28683 ?auto_28684 ?auto_28685 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28695 - SURFACE
      ?auto_28696 - SURFACE
      ?auto_28697 - SURFACE
      ?auto_28698 - SURFACE
    )
    :vars
    (
      ?auto_28703 - HOIST
      ?auto_28700 - PLACE
      ?auto_28704 - PLACE
      ?auto_28705 - HOIST
      ?auto_28699 - SURFACE
      ?auto_28707 - PLACE
      ?auto_28702 - HOIST
      ?auto_28701 - SURFACE
      ?auto_28706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28703 ?auto_28700 ) ( IS-CRATE ?auto_28698 ) ( not ( = ?auto_28697 ?auto_28698 ) ) ( not ( = ?auto_28696 ?auto_28697 ) ) ( not ( = ?auto_28696 ?auto_28698 ) ) ( not ( = ?auto_28704 ?auto_28700 ) ) ( HOIST-AT ?auto_28705 ?auto_28704 ) ( not ( = ?auto_28703 ?auto_28705 ) ) ( AVAILABLE ?auto_28705 ) ( SURFACE-AT ?auto_28698 ?auto_28704 ) ( ON ?auto_28698 ?auto_28699 ) ( CLEAR ?auto_28698 ) ( not ( = ?auto_28697 ?auto_28699 ) ) ( not ( = ?auto_28698 ?auto_28699 ) ) ( not ( = ?auto_28696 ?auto_28699 ) ) ( SURFACE-AT ?auto_28696 ?auto_28700 ) ( CLEAR ?auto_28696 ) ( IS-CRATE ?auto_28697 ) ( AVAILABLE ?auto_28703 ) ( not ( = ?auto_28707 ?auto_28700 ) ) ( not ( = ?auto_28704 ?auto_28707 ) ) ( HOIST-AT ?auto_28702 ?auto_28707 ) ( not ( = ?auto_28703 ?auto_28702 ) ) ( not ( = ?auto_28705 ?auto_28702 ) ) ( AVAILABLE ?auto_28702 ) ( SURFACE-AT ?auto_28697 ?auto_28707 ) ( ON ?auto_28697 ?auto_28701 ) ( CLEAR ?auto_28697 ) ( not ( = ?auto_28697 ?auto_28701 ) ) ( not ( = ?auto_28698 ?auto_28701 ) ) ( not ( = ?auto_28696 ?auto_28701 ) ) ( not ( = ?auto_28699 ?auto_28701 ) ) ( TRUCK-AT ?auto_28706 ?auto_28700 ) ( ON ?auto_28696 ?auto_28695 ) ( not ( = ?auto_28695 ?auto_28696 ) ) ( not ( = ?auto_28695 ?auto_28697 ) ) ( not ( = ?auto_28695 ?auto_28698 ) ) ( not ( = ?auto_28695 ?auto_28699 ) ) ( not ( = ?auto_28695 ?auto_28701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28696 ?auto_28697 ?auto_28698 )
      ( MAKE-3CRATE-VERIFY ?auto_28695 ?auto_28696 ?auto_28697 ?auto_28698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28708 - SURFACE
      ?auto_28709 - SURFACE
    )
    :vars
    (
      ?auto_28714 - HOIST
      ?auto_28711 - PLACE
      ?auto_28715 - SURFACE
      ?auto_28716 - PLACE
      ?auto_28717 - HOIST
      ?auto_28710 - SURFACE
      ?auto_28719 - PLACE
      ?auto_28713 - HOIST
      ?auto_28712 - SURFACE
      ?auto_28718 - TRUCK
      ?auto_28720 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28714 ?auto_28711 ) ( IS-CRATE ?auto_28709 ) ( not ( = ?auto_28708 ?auto_28709 ) ) ( not ( = ?auto_28715 ?auto_28708 ) ) ( not ( = ?auto_28715 ?auto_28709 ) ) ( not ( = ?auto_28716 ?auto_28711 ) ) ( HOIST-AT ?auto_28717 ?auto_28716 ) ( not ( = ?auto_28714 ?auto_28717 ) ) ( AVAILABLE ?auto_28717 ) ( SURFACE-AT ?auto_28709 ?auto_28716 ) ( ON ?auto_28709 ?auto_28710 ) ( CLEAR ?auto_28709 ) ( not ( = ?auto_28708 ?auto_28710 ) ) ( not ( = ?auto_28709 ?auto_28710 ) ) ( not ( = ?auto_28715 ?auto_28710 ) ) ( IS-CRATE ?auto_28708 ) ( not ( = ?auto_28719 ?auto_28711 ) ) ( not ( = ?auto_28716 ?auto_28719 ) ) ( HOIST-AT ?auto_28713 ?auto_28719 ) ( not ( = ?auto_28714 ?auto_28713 ) ) ( not ( = ?auto_28717 ?auto_28713 ) ) ( AVAILABLE ?auto_28713 ) ( SURFACE-AT ?auto_28708 ?auto_28719 ) ( ON ?auto_28708 ?auto_28712 ) ( CLEAR ?auto_28708 ) ( not ( = ?auto_28708 ?auto_28712 ) ) ( not ( = ?auto_28709 ?auto_28712 ) ) ( not ( = ?auto_28715 ?auto_28712 ) ) ( not ( = ?auto_28710 ?auto_28712 ) ) ( TRUCK-AT ?auto_28718 ?auto_28711 ) ( SURFACE-AT ?auto_28720 ?auto_28711 ) ( CLEAR ?auto_28720 ) ( LIFTING ?auto_28714 ?auto_28715 ) ( IS-CRATE ?auto_28715 ) ( not ( = ?auto_28720 ?auto_28715 ) ) ( not ( = ?auto_28708 ?auto_28720 ) ) ( not ( = ?auto_28709 ?auto_28720 ) ) ( not ( = ?auto_28710 ?auto_28720 ) ) ( not ( = ?auto_28712 ?auto_28720 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28720 ?auto_28715 )
      ( MAKE-2CRATE ?auto_28715 ?auto_28708 ?auto_28709 )
      ( MAKE-1CRATE-VERIFY ?auto_28708 ?auto_28709 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28721 - SURFACE
      ?auto_28722 - SURFACE
      ?auto_28723 - SURFACE
    )
    :vars
    (
      ?auto_28725 - HOIST
      ?auto_28732 - PLACE
      ?auto_28729 - PLACE
      ?auto_28731 - HOIST
      ?auto_28733 - SURFACE
      ?auto_28727 - PLACE
      ?auto_28724 - HOIST
      ?auto_28730 - SURFACE
      ?auto_28728 - TRUCK
      ?auto_28726 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28725 ?auto_28732 ) ( IS-CRATE ?auto_28723 ) ( not ( = ?auto_28722 ?auto_28723 ) ) ( not ( = ?auto_28721 ?auto_28722 ) ) ( not ( = ?auto_28721 ?auto_28723 ) ) ( not ( = ?auto_28729 ?auto_28732 ) ) ( HOIST-AT ?auto_28731 ?auto_28729 ) ( not ( = ?auto_28725 ?auto_28731 ) ) ( AVAILABLE ?auto_28731 ) ( SURFACE-AT ?auto_28723 ?auto_28729 ) ( ON ?auto_28723 ?auto_28733 ) ( CLEAR ?auto_28723 ) ( not ( = ?auto_28722 ?auto_28733 ) ) ( not ( = ?auto_28723 ?auto_28733 ) ) ( not ( = ?auto_28721 ?auto_28733 ) ) ( IS-CRATE ?auto_28722 ) ( not ( = ?auto_28727 ?auto_28732 ) ) ( not ( = ?auto_28729 ?auto_28727 ) ) ( HOIST-AT ?auto_28724 ?auto_28727 ) ( not ( = ?auto_28725 ?auto_28724 ) ) ( not ( = ?auto_28731 ?auto_28724 ) ) ( AVAILABLE ?auto_28724 ) ( SURFACE-AT ?auto_28722 ?auto_28727 ) ( ON ?auto_28722 ?auto_28730 ) ( CLEAR ?auto_28722 ) ( not ( = ?auto_28722 ?auto_28730 ) ) ( not ( = ?auto_28723 ?auto_28730 ) ) ( not ( = ?auto_28721 ?auto_28730 ) ) ( not ( = ?auto_28733 ?auto_28730 ) ) ( TRUCK-AT ?auto_28728 ?auto_28732 ) ( SURFACE-AT ?auto_28726 ?auto_28732 ) ( CLEAR ?auto_28726 ) ( LIFTING ?auto_28725 ?auto_28721 ) ( IS-CRATE ?auto_28721 ) ( not ( = ?auto_28726 ?auto_28721 ) ) ( not ( = ?auto_28722 ?auto_28726 ) ) ( not ( = ?auto_28723 ?auto_28726 ) ) ( not ( = ?auto_28733 ?auto_28726 ) ) ( not ( = ?auto_28730 ?auto_28726 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28722 ?auto_28723 )
      ( MAKE-2CRATE-VERIFY ?auto_28721 ?auto_28722 ?auto_28723 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28734 - SURFACE
      ?auto_28735 - SURFACE
      ?auto_28736 - SURFACE
      ?auto_28737 - SURFACE
    )
    :vars
    (
      ?auto_28743 - HOIST
      ?auto_28745 - PLACE
      ?auto_28738 - PLACE
      ?auto_28739 - HOIST
      ?auto_28741 - SURFACE
      ?auto_28746 - PLACE
      ?auto_28744 - HOIST
      ?auto_28740 - SURFACE
      ?auto_28742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28743 ?auto_28745 ) ( IS-CRATE ?auto_28737 ) ( not ( = ?auto_28736 ?auto_28737 ) ) ( not ( = ?auto_28735 ?auto_28736 ) ) ( not ( = ?auto_28735 ?auto_28737 ) ) ( not ( = ?auto_28738 ?auto_28745 ) ) ( HOIST-AT ?auto_28739 ?auto_28738 ) ( not ( = ?auto_28743 ?auto_28739 ) ) ( AVAILABLE ?auto_28739 ) ( SURFACE-AT ?auto_28737 ?auto_28738 ) ( ON ?auto_28737 ?auto_28741 ) ( CLEAR ?auto_28737 ) ( not ( = ?auto_28736 ?auto_28741 ) ) ( not ( = ?auto_28737 ?auto_28741 ) ) ( not ( = ?auto_28735 ?auto_28741 ) ) ( IS-CRATE ?auto_28736 ) ( not ( = ?auto_28746 ?auto_28745 ) ) ( not ( = ?auto_28738 ?auto_28746 ) ) ( HOIST-AT ?auto_28744 ?auto_28746 ) ( not ( = ?auto_28743 ?auto_28744 ) ) ( not ( = ?auto_28739 ?auto_28744 ) ) ( AVAILABLE ?auto_28744 ) ( SURFACE-AT ?auto_28736 ?auto_28746 ) ( ON ?auto_28736 ?auto_28740 ) ( CLEAR ?auto_28736 ) ( not ( = ?auto_28736 ?auto_28740 ) ) ( not ( = ?auto_28737 ?auto_28740 ) ) ( not ( = ?auto_28735 ?auto_28740 ) ) ( not ( = ?auto_28741 ?auto_28740 ) ) ( TRUCK-AT ?auto_28742 ?auto_28745 ) ( SURFACE-AT ?auto_28734 ?auto_28745 ) ( CLEAR ?auto_28734 ) ( LIFTING ?auto_28743 ?auto_28735 ) ( IS-CRATE ?auto_28735 ) ( not ( = ?auto_28734 ?auto_28735 ) ) ( not ( = ?auto_28736 ?auto_28734 ) ) ( not ( = ?auto_28737 ?auto_28734 ) ) ( not ( = ?auto_28741 ?auto_28734 ) ) ( not ( = ?auto_28740 ?auto_28734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28735 ?auto_28736 ?auto_28737 )
      ( MAKE-3CRATE-VERIFY ?auto_28734 ?auto_28735 ?auto_28736 ?auto_28737 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28747 - SURFACE
      ?auto_28748 - SURFACE
    )
    :vars
    (
      ?auto_28756 - HOIST
      ?auto_28758 - PLACE
      ?auto_28749 - SURFACE
      ?auto_28750 - PLACE
      ?auto_28751 - HOIST
      ?auto_28753 - SURFACE
      ?auto_28759 - PLACE
      ?auto_28757 - HOIST
      ?auto_28752 - SURFACE
      ?auto_28755 - TRUCK
      ?auto_28754 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28756 ?auto_28758 ) ( IS-CRATE ?auto_28748 ) ( not ( = ?auto_28747 ?auto_28748 ) ) ( not ( = ?auto_28749 ?auto_28747 ) ) ( not ( = ?auto_28749 ?auto_28748 ) ) ( not ( = ?auto_28750 ?auto_28758 ) ) ( HOIST-AT ?auto_28751 ?auto_28750 ) ( not ( = ?auto_28756 ?auto_28751 ) ) ( AVAILABLE ?auto_28751 ) ( SURFACE-AT ?auto_28748 ?auto_28750 ) ( ON ?auto_28748 ?auto_28753 ) ( CLEAR ?auto_28748 ) ( not ( = ?auto_28747 ?auto_28753 ) ) ( not ( = ?auto_28748 ?auto_28753 ) ) ( not ( = ?auto_28749 ?auto_28753 ) ) ( IS-CRATE ?auto_28747 ) ( not ( = ?auto_28759 ?auto_28758 ) ) ( not ( = ?auto_28750 ?auto_28759 ) ) ( HOIST-AT ?auto_28757 ?auto_28759 ) ( not ( = ?auto_28756 ?auto_28757 ) ) ( not ( = ?auto_28751 ?auto_28757 ) ) ( AVAILABLE ?auto_28757 ) ( SURFACE-AT ?auto_28747 ?auto_28759 ) ( ON ?auto_28747 ?auto_28752 ) ( CLEAR ?auto_28747 ) ( not ( = ?auto_28747 ?auto_28752 ) ) ( not ( = ?auto_28748 ?auto_28752 ) ) ( not ( = ?auto_28749 ?auto_28752 ) ) ( not ( = ?auto_28753 ?auto_28752 ) ) ( TRUCK-AT ?auto_28755 ?auto_28758 ) ( SURFACE-AT ?auto_28754 ?auto_28758 ) ( CLEAR ?auto_28754 ) ( IS-CRATE ?auto_28749 ) ( not ( = ?auto_28754 ?auto_28749 ) ) ( not ( = ?auto_28747 ?auto_28754 ) ) ( not ( = ?auto_28748 ?auto_28754 ) ) ( not ( = ?auto_28753 ?auto_28754 ) ) ( not ( = ?auto_28752 ?auto_28754 ) ) ( AVAILABLE ?auto_28756 ) ( IN ?auto_28749 ?auto_28755 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28756 ?auto_28749 ?auto_28755 ?auto_28758 )
      ( MAKE-2CRATE ?auto_28749 ?auto_28747 ?auto_28748 )
      ( MAKE-1CRATE-VERIFY ?auto_28747 ?auto_28748 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28760 - SURFACE
      ?auto_28761 - SURFACE
      ?auto_28762 - SURFACE
    )
    :vars
    (
      ?auto_28772 - HOIST
      ?auto_28763 - PLACE
      ?auto_28771 - PLACE
      ?auto_28768 - HOIST
      ?auto_28764 - SURFACE
      ?auto_28770 - PLACE
      ?auto_28769 - HOIST
      ?auto_28766 - SURFACE
      ?auto_28765 - TRUCK
      ?auto_28767 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28772 ?auto_28763 ) ( IS-CRATE ?auto_28762 ) ( not ( = ?auto_28761 ?auto_28762 ) ) ( not ( = ?auto_28760 ?auto_28761 ) ) ( not ( = ?auto_28760 ?auto_28762 ) ) ( not ( = ?auto_28771 ?auto_28763 ) ) ( HOIST-AT ?auto_28768 ?auto_28771 ) ( not ( = ?auto_28772 ?auto_28768 ) ) ( AVAILABLE ?auto_28768 ) ( SURFACE-AT ?auto_28762 ?auto_28771 ) ( ON ?auto_28762 ?auto_28764 ) ( CLEAR ?auto_28762 ) ( not ( = ?auto_28761 ?auto_28764 ) ) ( not ( = ?auto_28762 ?auto_28764 ) ) ( not ( = ?auto_28760 ?auto_28764 ) ) ( IS-CRATE ?auto_28761 ) ( not ( = ?auto_28770 ?auto_28763 ) ) ( not ( = ?auto_28771 ?auto_28770 ) ) ( HOIST-AT ?auto_28769 ?auto_28770 ) ( not ( = ?auto_28772 ?auto_28769 ) ) ( not ( = ?auto_28768 ?auto_28769 ) ) ( AVAILABLE ?auto_28769 ) ( SURFACE-AT ?auto_28761 ?auto_28770 ) ( ON ?auto_28761 ?auto_28766 ) ( CLEAR ?auto_28761 ) ( not ( = ?auto_28761 ?auto_28766 ) ) ( not ( = ?auto_28762 ?auto_28766 ) ) ( not ( = ?auto_28760 ?auto_28766 ) ) ( not ( = ?auto_28764 ?auto_28766 ) ) ( TRUCK-AT ?auto_28765 ?auto_28763 ) ( SURFACE-AT ?auto_28767 ?auto_28763 ) ( CLEAR ?auto_28767 ) ( IS-CRATE ?auto_28760 ) ( not ( = ?auto_28767 ?auto_28760 ) ) ( not ( = ?auto_28761 ?auto_28767 ) ) ( not ( = ?auto_28762 ?auto_28767 ) ) ( not ( = ?auto_28764 ?auto_28767 ) ) ( not ( = ?auto_28766 ?auto_28767 ) ) ( AVAILABLE ?auto_28772 ) ( IN ?auto_28760 ?auto_28765 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28761 ?auto_28762 )
      ( MAKE-2CRATE-VERIFY ?auto_28760 ?auto_28761 ?auto_28762 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28773 - SURFACE
      ?auto_28774 - SURFACE
      ?auto_28775 - SURFACE
      ?auto_28776 - SURFACE
    )
    :vars
    (
      ?auto_28781 - HOIST
      ?auto_28778 - PLACE
      ?auto_28784 - PLACE
      ?auto_28785 - HOIST
      ?auto_28783 - SURFACE
      ?auto_28780 - PLACE
      ?auto_28777 - HOIST
      ?auto_28782 - SURFACE
      ?auto_28779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28781 ?auto_28778 ) ( IS-CRATE ?auto_28776 ) ( not ( = ?auto_28775 ?auto_28776 ) ) ( not ( = ?auto_28774 ?auto_28775 ) ) ( not ( = ?auto_28774 ?auto_28776 ) ) ( not ( = ?auto_28784 ?auto_28778 ) ) ( HOIST-AT ?auto_28785 ?auto_28784 ) ( not ( = ?auto_28781 ?auto_28785 ) ) ( AVAILABLE ?auto_28785 ) ( SURFACE-AT ?auto_28776 ?auto_28784 ) ( ON ?auto_28776 ?auto_28783 ) ( CLEAR ?auto_28776 ) ( not ( = ?auto_28775 ?auto_28783 ) ) ( not ( = ?auto_28776 ?auto_28783 ) ) ( not ( = ?auto_28774 ?auto_28783 ) ) ( IS-CRATE ?auto_28775 ) ( not ( = ?auto_28780 ?auto_28778 ) ) ( not ( = ?auto_28784 ?auto_28780 ) ) ( HOIST-AT ?auto_28777 ?auto_28780 ) ( not ( = ?auto_28781 ?auto_28777 ) ) ( not ( = ?auto_28785 ?auto_28777 ) ) ( AVAILABLE ?auto_28777 ) ( SURFACE-AT ?auto_28775 ?auto_28780 ) ( ON ?auto_28775 ?auto_28782 ) ( CLEAR ?auto_28775 ) ( not ( = ?auto_28775 ?auto_28782 ) ) ( not ( = ?auto_28776 ?auto_28782 ) ) ( not ( = ?auto_28774 ?auto_28782 ) ) ( not ( = ?auto_28783 ?auto_28782 ) ) ( TRUCK-AT ?auto_28779 ?auto_28778 ) ( SURFACE-AT ?auto_28773 ?auto_28778 ) ( CLEAR ?auto_28773 ) ( IS-CRATE ?auto_28774 ) ( not ( = ?auto_28773 ?auto_28774 ) ) ( not ( = ?auto_28775 ?auto_28773 ) ) ( not ( = ?auto_28776 ?auto_28773 ) ) ( not ( = ?auto_28783 ?auto_28773 ) ) ( not ( = ?auto_28782 ?auto_28773 ) ) ( AVAILABLE ?auto_28781 ) ( IN ?auto_28774 ?auto_28779 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28774 ?auto_28775 ?auto_28776 )
      ( MAKE-3CRATE-VERIFY ?auto_28773 ?auto_28774 ?auto_28775 ?auto_28776 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28786 - SURFACE
      ?auto_28787 - SURFACE
    )
    :vars
    (
      ?auto_28792 - HOIST
      ?auto_28789 - PLACE
      ?auto_28796 - SURFACE
      ?auto_28797 - PLACE
      ?auto_28798 - HOIST
      ?auto_28795 - SURFACE
      ?auto_28791 - PLACE
      ?auto_28788 - HOIST
      ?auto_28794 - SURFACE
      ?auto_28793 - SURFACE
      ?auto_28790 - TRUCK
      ?auto_28799 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28792 ?auto_28789 ) ( IS-CRATE ?auto_28787 ) ( not ( = ?auto_28786 ?auto_28787 ) ) ( not ( = ?auto_28796 ?auto_28786 ) ) ( not ( = ?auto_28796 ?auto_28787 ) ) ( not ( = ?auto_28797 ?auto_28789 ) ) ( HOIST-AT ?auto_28798 ?auto_28797 ) ( not ( = ?auto_28792 ?auto_28798 ) ) ( AVAILABLE ?auto_28798 ) ( SURFACE-AT ?auto_28787 ?auto_28797 ) ( ON ?auto_28787 ?auto_28795 ) ( CLEAR ?auto_28787 ) ( not ( = ?auto_28786 ?auto_28795 ) ) ( not ( = ?auto_28787 ?auto_28795 ) ) ( not ( = ?auto_28796 ?auto_28795 ) ) ( IS-CRATE ?auto_28786 ) ( not ( = ?auto_28791 ?auto_28789 ) ) ( not ( = ?auto_28797 ?auto_28791 ) ) ( HOIST-AT ?auto_28788 ?auto_28791 ) ( not ( = ?auto_28792 ?auto_28788 ) ) ( not ( = ?auto_28798 ?auto_28788 ) ) ( AVAILABLE ?auto_28788 ) ( SURFACE-AT ?auto_28786 ?auto_28791 ) ( ON ?auto_28786 ?auto_28794 ) ( CLEAR ?auto_28786 ) ( not ( = ?auto_28786 ?auto_28794 ) ) ( not ( = ?auto_28787 ?auto_28794 ) ) ( not ( = ?auto_28796 ?auto_28794 ) ) ( not ( = ?auto_28795 ?auto_28794 ) ) ( SURFACE-AT ?auto_28793 ?auto_28789 ) ( CLEAR ?auto_28793 ) ( IS-CRATE ?auto_28796 ) ( not ( = ?auto_28793 ?auto_28796 ) ) ( not ( = ?auto_28786 ?auto_28793 ) ) ( not ( = ?auto_28787 ?auto_28793 ) ) ( not ( = ?auto_28795 ?auto_28793 ) ) ( not ( = ?auto_28794 ?auto_28793 ) ) ( AVAILABLE ?auto_28792 ) ( IN ?auto_28796 ?auto_28790 ) ( TRUCK-AT ?auto_28790 ?auto_28799 ) ( not ( = ?auto_28799 ?auto_28789 ) ) ( not ( = ?auto_28797 ?auto_28799 ) ) ( not ( = ?auto_28791 ?auto_28799 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28790 ?auto_28799 ?auto_28789 )
      ( MAKE-2CRATE ?auto_28796 ?auto_28786 ?auto_28787 )
      ( MAKE-1CRATE-VERIFY ?auto_28786 ?auto_28787 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28800 - SURFACE
      ?auto_28801 - SURFACE
      ?auto_28802 - SURFACE
    )
    :vars
    (
      ?auto_28804 - HOIST
      ?auto_28811 - PLACE
      ?auto_28808 - PLACE
      ?auto_28807 - HOIST
      ?auto_28809 - SURFACE
      ?auto_28805 - PLACE
      ?auto_28810 - HOIST
      ?auto_28803 - SURFACE
      ?auto_28806 - SURFACE
      ?auto_28813 - TRUCK
      ?auto_28812 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28804 ?auto_28811 ) ( IS-CRATE ?auto_28802 ) ( not ( = ?auto_28801 ?auto_28802 ) ) ( not ( = ?auto_28800 ?auto_28801 ) ) ( not ( = ?auto_28800 ?auto_28802 ) ) ( not ( = ?auto_28808 ?auto_28811 ) ) ( HOIST-AT ?auto_28807 ?auto_28808 ) ( not ( = ?auto_28804 ?auto_28807 ) ) ( AVAILABLE ?auto_28807 ) ( SURFACE-AT ?auto_28802 ?auto_28808 ) ( ON ?auto_28802 ?auto_28809 ) ( CLEAR ?auto_28802 ) ( not ( = ?auto_28801 ?auto_28809 ) ) ( not ( = ?auto_28802 ?auto_28809 ) ) ( not ( = ?auto_28800 ?auto_28809 ) ) ( IS-CRATE ?auto_28801 ) ( not ( = ?auto_28805 ?auto_28811 ) ) ( not ( = ?auto_28808 ?auto_28805 ) ) ( HOIST-AT ?auto_28810 ?auto_28805 ) ( not ( = ?auto_28804 ?auto_28810 ) ) ( not ( = ?auto_28807 ?auto_28810 ) ) ( AVAILABLE ?auto_28810 ) ( SURFACE-AT ?auto_28801 ?auto_28805 ) ( ON ?auto_28801 ?auto_28803 ) ( CLEAR ?auto_28801 ) ( not ( = ?auto_28801 ?auto_28803 ) ) ( not ( = ?auto_28802 ?auto_28803 ) ) ( not ( = ?auto_28800 ?auto_28803 ) ) ( not ( = ?auto_28809 ?auto_28803 ) ) ( SURFACE-AT ?auto_28806 ?auto_28811 ) ( CLEAR ?auto_28806 ) ( IS-CRATE ?auto_28800 ) ( not ( = ?auto_28806 ?auto_28800 ) ) ( not ( = ?auto_28801 ?auto_28806 ) ) ( not ( = ?auto_28802 ?auto_28806 ) ) ( not ( = ?auto_28809 ?auto_28806 ) ) ( not ( = ?auto_28803 ?auto_28806 ) ) ( AVAILABLE ?auto_28804 ) ( IN ?auto_28800 ?auto_28813 ) ( TRUCK-AT ?auto_28813 ?auto_28812 ) ( not ( = ?auto_28812 ?auto_28811 ) ) ( not ( = ?auto_28808 ?auto_28812 ) ) ( not ( = ?auto_28805 ?auto_28812 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28801 ?auto_28802 )
      ( MAKE-2CRATE-VERIFY ?auto_28800 ?auto_28801 ?auto_28802 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28814 - SURFACE
      ?auto_28815 - SURFACE
      ?auto_28816 - SURFACE
      ?auto_28817 - SURFACE
    )
    :vars
    (
      ?auto_28823 - HOIST
      ?auto_28821 - PLACE
      ?auto_28822 - PLACE
      ?auto_28820 - HOIST
      ?auto_28818 - SURFACE
      ?auto_28827 - PLACE
      ?auto_28825 - HOIST
      ?auto_28819 - SURFACE
      ?auto_28824 - TRUCK
      ?auto_28826 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28823 ?auto_28821 ) ( IS-CRATE ?auto_28817 ) ( not ( = ?auto_28816 ?auto_28817 ) ) ( not ( = ?auto_28815 ?auto_28816 ) ) ( not ( = ?auto_28815 ?auto_28817 ) ) ( not ( = ?auto_28822 ?auto_28821 ) ) ( HOIST-AT ?auto_28820 ?auto_28822 ) ( not ( = ?auto_28823 ?auto_28820 ) ) ( AVAILABLE ?auto_28820 ) ( SURFACE-AT ?auto_28817 ?auto_28822 ) ( ON ?auto_28817 ?auto_28818 ) ( CLEAR ?auto_28817 ) ( not ( = ?auto_28816 ?auto_28818 ) ) ( not ( = ?auto_28817 ?auto_28818 ) ) ( not ( = ?auto_28815 ?auto_28818 ) ) ( IS-CRATE ?auto_28816 ) ( not ( = ?auto_28827 ?auto_28821 ) ) ( not ( = ?auto_28822 ?auto_28827 ) ) ( HOIST-AT ?auto_28825 ?auto_28827 ) ( not ( = ?auto_28823 ?auto_28825 ) ) ( not ( = ?auto_28820 ?auto_28825 ) ) ( AVAILABLE ?auto_28825 ) ( SURFACE-AT ?auto_28816 ?auto_28827 ) ( ON ?auto_28816 ?auto_28819 ) ( CLEAR ?auto_28816 ) ( not ( = ?auto_28816 ?auto_28819 ) ) ( not ( = ?auto_28817 ?auto_28819 ) ) ( not ( = ?auto_28815 ?auto_28819 ) ) ( not ( = ?auto_28818 ?auto_28819 ) ) ( SURFACE-AT ?auto_28814 ?auto_28821 ) ( CLEAR ?auto_28814 ) ( IS-CRATE ?auto_28815 ) ( not ( = ?auto_28814 ?auto_28815 ) ) ( not ( = ?auto_28816 ?auto_28814 ) ) ( not ( = ?auto_28817 ?auto_28814 ) ) ( not ( = ?auto_28818 ?auto_28814 ) ) ( not ( = ?auto_28819 ?auto_28814 ) ) ( AVAILABLE ?auto_28823 ) ( IN ?auto_28815 ?auto_28824 ) ( TRUCK-AT ?auto_28824 ?auto_28826 ) ( not ( = ?auto_28826 ?auto_28821 ) ) ( not ( = ?auto_28822 ?auto_28826 ) ) ( not ( = ?auto_28827 ?auto_28826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28815 ?auto_28816 ?auto_28817 )
      ( MAKE-3CRATE-VERIFY ?auto_28814 ?auto_28815 ?auto_28816 ?auto_28817 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28828 - SURFACE
      ?auto_28829 - SURFACE
    )
    :vars
    (
      ?auto_28836 - HOIST
      ?auto_28833 - PLACE
      ?auto_28837 - SURFACE
      ?auto_28834 - PLACE
      ?auto_28832 - HOIST
      ?auto_28830 - SURFACE
      ?auto_28841 - PLACE
      ?auto_28839 - HOIST
      ?auto_28831 - SURFACE
      ?auto_28835 - SURFACE
      ?auto_28838 - TRUCK
      ?auto_28840 - PLACE
      ?auto_28842 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28836 ?auto_28833 ) ( IS-CRATE ?auto_28829 ) ( not ( = ?auto_28828 ?auto_28829 ) ) ( not ( = ?auto_28837 ?auto_28828 ) ) ( not ( = ?auto_28837 ?auto_28829 ) ) ( not ( = ?auto_28834 ?auto_28833 ) ) ( HOIST-AT ?auto_28832 ?auto_28834 ) ( not ( = ?auto_28836 ?auto_28832 ) ) ( AVAILABLE ?auto_28832 ) ( SURFACE-AT ?auto_28829 ?auto_28834 ) ( ON ?auto_28829 ?auto_28830 ) ( CLEAR ?auto_28829 ) ( not ( = ?auto_28828 ?auto_28830 ) ) ( not ( = ?auto_28829 ?auto_28830 ) ) ( not ( = ?auto_28837 ?auto_28830 ) ) ( IS-CRATE ?auto_28828 ) ( not ( = ?auto_28841 ?auto_28833 ) ) ( not ( = ?auto_28834 ?auto_28841 ) ) ( HOIST-AT ?auto_28839 ?auto_28841 ) ( not ( = ?auto_28836 ?auto_28839 ) ) ( not ( = ?auto_28832 ?auto_28839 ) ) ( AVAILABLE ?auto_28839 ) ( SURFACE-AT ?auto_28828 ?auto_28841 ) ( ON ?auto_28828 ?auto_28831 ) ( CLEAR ?auto_28828 ) ( not ( = ?auto_28828 ?auto_28831 ) ) ( not ( = ?auto_28829 ?auto_28831 ) ) ( not ( = ?auto_28837 ?auto_28831 ) ) ( not ( = ?auto_28830 ?auto_28831 ) ) ( SURFACE-AT ?auto_28835 ?auto_28833 ) ( CLEAR ?auto_28835 ) ( IS-CRATE ?auto_28837 ) ( not ( = ?auto_28835 ?auto_28837 ) ) ( not ( = ?auto_28828 ?auto_28835 ) ) ( not ( = ?auto_28829 ?auto_28835 ) ) ( not ( = ?auto_28830 ?auto_28835 ) ) ( not ( = ?auto_28831 ?auto_28835 ) ) ( AVAILABLE ?auto_28836 ) ( TRUCK-AT ?auto_28838 ?auto_28840 ) ( not ( = ?auto_28840 ?auto_28833 ) ) ( not ( = ?auto_28834 ?auto_28840 ) ) ( not ( = ?auto_28841 ?auto_28840 ) ) ( HOIST-AT ?auto_28842 ?auto_28840 ) ( LIFTING ?auto_28842 ?auto_28837 ) ( not ( = ?auto_28836 ?auto_28842 ) ) ( not ( = ?auto_28832 ?auto_28842 ) ) ( not ( = ?auto_28839 ?auto_28842 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28842 ?auto_28837 ?auto_28838 ?auto_28840 )
      ( MAKE-2CRATE ?auto_28837 ?auto_28828 ?auto_28829 )
      ( MAKE-1CRATE-VERIFY ?auto_28828 ?auto_28829 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28843 - SURFACE
      ?auto_28844 - SURFACE
      ?auto_28845 - SURFACE
    )
    :vars
    (
      ?auto_28854 - HOIST
      ?auto_28852 - PLACE
      ?auto_28848 - PLACE
      ?auto_28850 - HOIST
      ?auto_28857 - SURFACE
      ?auto_28849 - PLACE
      ?auto_28853 - HOIST
      ?auto_28855 - SURFACE
      ?auto_28856 - SURFACE
      ?auto_28851 - TRUCK
      ?auto_28846 - PLACE
      ?auto_28847 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28854 ?auto_28852 ) ( IS-CRATE ?auto_28845 ) ( not ( = ?auto_28844 ?auto_28845 ) ) ( not ( = ?auto_28843 ?auto_28844 ) ) ( not ( = ?auto_28843 ?auto_28845 ) ) ( not ( = ?auto_28848 ?auto_28852 ) ) ( HOIST-AT ?auto_28850 ?auto_28848 ) ( not ( = ?auto_28854 ?auto_28850 ) ) ( AVAILABLE ?auto_28850 ) ( SURFACE-AT ?auto_28845 ?auto_28848 ) ( ON ?auto_28845 ?auto_28857 ) ( CLEAR ?auto_28845 ) ( not ( = ?auto_28844 ?auto_28857 ) ) ( not ( = ?auto_28845 ?auto_28857 ) ) ( not ( = ?auto_28843 ?auto_28857 ) ) ( IS-CRATE ?auto_28844 ) ( not ( = ?auto_28849 ?auto_28852 ) ) ( not ( = ?auto_28848 ?auto_28849 ) ) ( HOIST-AT ?auto_28853 ?auto_28849 ) ( not ( = ?auto_28854 ?auto_28853 ) ) ( not ( = ?auto_28850 ?auto_28853 ) ) ( AVAILABLE ?auto_28853 ) ( SURFACE-AT ?auto_28844 ?auto_28849 ) ( ON ?auto_28844 ?auto_28855 ) ( CLEAR ?auto_28844 ) ( not ( = ?auto_28844 ?auto_28855 ) ) ( not ( = ?auto_28845 ?auto_28855 ) ) ( not ( = ?auto_28843 ?auto_28855 ) ) ( not ( = ?auto_28857 ?auto_28855 ) ) ( SURFACE-AT ?auto_28856 ?auto_28852 ) ( CLEAR ?auto_28856 ) ( IS-CRATE ?auto_28843 ) ( not ( = ?auto_28856 ?auto_28843 ) ) ( not ( = ?auto_28844 ?auto_28856 ) ) ( not ( = ?auto_28845 ?auto_28856 ) ) ( not ( = ?auto_28857 ?auto_28856 ) ) ( not ( = ?auto_28855 ?auto_28856 ) ) ( AVAILABLE ?auto_28854 ) ( TRUCK-AT ?auto_28851 ?auto_28846 ) ( not ( = ?auto_28846 ?auto_28852 ) ) ( not ( = ?auto_28848 ?auto_28846 ) ) ( not ( = ?auto_28849 ?auto_28846 ) ) ( HOIST-AT ?auto_28847 ?auto_28846 ) ( LIFTING ?auto_28847 ?auto_28843 ) ( not ( = ?auto_28854 ?auto_28847 ) ) ( not ( = ?auto_28850 ?auto_28847 ) ) ( not ( = ?auto_28853 ?auto_28847 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28844 ?auto_28845 )
      ( MAKE-2CRATE-VERIFY ?auto_28843 ?auto_28844 ?auto_28845 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28858 - SURFACE
      ?auto_28859 - SURFACE
      ?auto_28860 - SURFACE
      ?auto_28861 - SURFACE
    )
    :vars
    (
      ?auto_28866 - HOIST
      ?auto_28865 - PLACE
      ?auto_28872 - PLACE
      ?auto_28869 - HOIST
      ?auto_28863 - SURFACE
      ?auto_28867 - PLACE
      ?auto_28868 - HOIST
      ?auto_28871 - SURFACE
      ?auto_28864 - TRUCK
      ?auto_28870 - PLACE
      ?auto_28862 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28866 ?auto_28865 ) ( IS-CRATE ?auto_28861 ) ( not ( = ?auto_28860 ?auto_28861 ) ) ( not ( = ?auto_28859 ?auto_28860 ) ) ( not ( = ?auto_28859 ?auto_28861 ) ) ( not ( = ?auto_28872 ?auto_28865 ) ) ( HOIST-AT ?auto_28869 ?auto_28872 ) ( not ( = ?auto_28866 ?auto_28869 ) ) ( AVAILABLE ?auto_28869 ) ( SURFACE-AT ?auto_28861 ?auto_28872 ) ( ON ?auto_28861 ?auto_28863 ) ( CLEAR ?auto_28861 ) ( not ( = ?auto_28860 ?auto_28863 ) ) ( not ( = ?auto_28861 ?auto_28863 ) ) ( not ( = ?auto_28859 ?auto_28863 ) ) ( IS-CRATE ?auto_28860 ) ( not ( = ?auto_28867 ?auto_28865 ) ) ( not ( = ?auto_28872 ?auto_28867 ) ) ( HOIST-AT ?auto_28868 ?auto_28867 ) ( not ( = ?auto_28866 ?auto_28868 ) ) ( not ( = ?auto_28869 ?auto_28868 ) ) ( AVAILABLE ?auto_28868 ) ( SURFACE-AT ?auto_28860 ?auto_28867 ) ( ON ?auto_28860 ?auto_28871 ) ( CLEAR ?auto_28860 ) ( not ( = ?auto_28860 ?auto_28871 ) ) ( not ( = ?auto_28861 ?auto_28871 ) ) ( not ( = ?auto_28859 ?auto_28871 ) ) ( not ( = ?auto_28863 ?auto_28871 ) ) ( SURFACE-AT ?auto_28858 ?auto_28865 ) ( CLEAR ?auto_28858 ) ( IS-CRATE ?auto_28859 ) ( not ( = ?auto_28858 ?auto_28859 ) ) ( not ( = ?auto_28860 ?auto_28858 ) ) ( not ( = ?auto_28861 ?auto_28858 ) ) ( not ( = ?auto_28863 ?auto_28858 ) ) ( not ( = ?auto_28871 ?auto_28858 ) ) ( AVAILABLE ?auto_28866 ) ( TRUCK-AT ?auto_28864 ?auto_28870 ) ( not ( = ?auto_28870 ?auto_28865 ) ) ( not ( = ?auto_28872 ?auto_28870 ) ) ( not ( = ?auto_28867 ?auto_28870 ) ) ( HOIST-AT ?auto_28862 ?auto_28870 ) ( LIFTING ?auto_28862 ?auto_28859 ) ( not ( = ?auto_28866 ?auto_28862 ) ) ( not ( = ?auto_28869 ?auto_28862 ) ) ( not ( = ?auto_28868 ?auto_28862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28859 ?auto_28860 ?auto_28861 )
      ( MAKE-3CRATE-VERIFY ?auto_28858 ?auto_28859 ?auto_28860 ?auto_28861 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28873 - SURFACE
      ?auto_28874 - SURFACE
    )
    :vars
    (
      ?auto_28879 - HOIST
      ?auto_28878 - PLACE
      ?auto_28882 - SURFACE
      ?auto_28887 - PLACE
      ?auto_28883 - HOIST
      ?auto_28876 - SURFACE
      ?auto_28880 - PLACE
      ?auto_28881 - HOIST
      ?auto_28886 - SURFACE
      ?auto_28884 - SURFACE
      ?auto_28877 - TRUCK
      ?auto_28885 - PLACE
      ?auto_28875 - HOIST
      ?auto_28888 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28879 ?auto_28878 ) ( IS-CRATE ?auto_28874 ) ( not ( = ?auto_28873 ?auto_28874 ) ) ( not ( = ?auto_28882 ?auto_28873 ) ) ( not ( = ?auto_28882 ?auto_28874 ) ) ( not ( = ?auto_28887 ?auto_28878 ) ) ( HOIST-AT ?auto_28883 ?auto_28887 ) ( not ( = ?auto_28879 ?auto_28883 ) ) ( AVAILABLE ?auto_28883 ) ( SURFACE-AT ?auto_28874 ?auto_28887 ) ( ON ?auto_28874 ?auto_28876 ) ( CLEAR ?auto_28874 ) ( not ( = ?auto_28873 ?auto_28876 ) ) ( not ( = ?auto_28874 ?auto_28876 ) ) ( not ( = ?auto_28882 ?auto_28876 ) ) ( IS-CRATE ?auto_28873 ) ( not ( = ?auto_28880 ?auto_28878 ) ) ( not ( = ?auto_28887 ?auto_28880 ) ) ( HOIST-AT ?auto_28881 ?auto_28880 ) ( not ( = ?auto_28879 ?auto_28881 ) ) ( not ( = ?auto_28883 ?auto_28881 ) ) ( AVAILABLE ?auto_28881 ) ( SURFACE-AT ?auto_28873 ?auto_28880 ) ( ON ?auto_28873 ?auto_28886 ) ( CLEAR ?auto_28873 ) ( not ( = ?auto_28873 ?auto_28886 ) ) ( not ( = ?auto_28874 ?auto_28886 ) ) ( not ( = ?auto_28882 ?auto_28886 ) ) ( not ( = ?auto_28876 ?auto_28886 ) ) ( SURFACE-AT ?auto_28884 ?auto_28878 ) ( CLEAR ?auto_28884 ) ( IS-CRATE ?auto_28882 ) ( not ( = ?auto_28884 ?auto_28882 ) ) ( not ( = ?auto_28873 ?auto_28884 ) ) ( not ( = ?auto_28874 ?auto_28884 ) ) ( not ( = ?auto_28876 ?auto_28884 ) ) ( not ( = ?auto_28886 ?auto_28884 ) ) ( AVAILABLE ?auto_28879 ) ( TRUCK-AT ?auto_28877 ?auto_28885 ) ( not ( = ?auto_28885 ?auto_28878 ) ) ( not ( = ?auto_28887 ?auto_28885 ) ) ( not ( = ?auto_28880 ?auto_28885 ) ) ( HOIST-AT ?auto_28875 ?auto_28885 ) ( not ( = ?auto_28879 ?auto_28875 ) ) ( not ( = ?auto_28883 ?auto_28875 ) ) ( not ( = ?auto_28881 ?auto_28875 ) ) ( AVAILABLE ?auto_28875 ) ( SURFACE-AT ?auto_28882 ?auto_28885 ) ( ON ?auto_28882 ?auto_28888 ) ( CLEAR ?auto_28882 ) ( not ( = ?auto_28873 ?auto_28888 ) ) ( not ( = ?auto_28874 ?auto_28888 ) ) ( not ( = ?auto_28882 ?auto_28888 ) ) ( not ( = ?auto_28876 ?auto_28888 ) ) ( not ( = ?auto_28886 ?auto_28888 ) ) ( not ( = ?auto_28884 ?auto_28888 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28875 ?auto_28882 ?auto_28888 ?auto_28885 )
      ( MAKE-2CRATE ?auto_28882 ?auto_28873 ?auto_28874 )
      ( MAKE-1CRATE-VERIFY ?auto_28873 ?auto_28874 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28889 - SURFACE
      ?auto_28890 - SURFACE
      ?auto_28891 - SURFACE
    )
    :vars
    (
      ?auto_28892 - HOIST
      ?auto_28897 - PLACE
      ?auto_28896 - PLACE
      ?auto_28902 - HOIST
      ?auto_28904 - SURFACE
      ?auto_28893 - PLACE
      ?auto_28898 - HOIST
      ?auto_28903 - SURFACE
      ?auto_28894 - SURFACE
      ?auto_28901 - TRUCK
      ?auto_28899 - PLACE
      ?auto_28895 - HOIST
      ?auto_28900 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28892 ?auto_28897 ) ( IS-CRATE ?auto_28891 ) ( not ( = ?auto_28890 ?auto_28891 ) ) ( not ( = ?auto_28889 ?auto_28890 ) ) ( not ( = ?auto_28889 ?auto_28891 ) ) ( not ( = ?auto_28896 ?auto_28897 ) ) ( HOIST-AT ?auto_28902 ?auto_28896 ) ( not ( = ?auto_28892 ?auto_28902 ) ) ( AVAILABLE ?auto_28902 ) ( SURFACE-AT ?auto_28891 ?auto_28896 ) ( ON ?auto_28891 ?auto_28904 ) ( CLEAR ?auto_28891 ) ( not ( = ?auto_28890 ?auto_28904 ) ) ( not ( = ?auto_28891 ?auto_28904 ) ) ( not ( = ?auto_28889 ?auto_28904 ) ) ( IS-CRATE ?auto_28890 ) ( not ( = ?auto_28893 ?auto_28897 ) ) ( not ( = ?auto_28896 ?auto_28893 ) ) ( HOIST-AT ?auto_28898 ?auto_28893 ) ( not ( = ?auto_28892 ?auto_28898 ) ) ( not ( = ?auto_28902 ?auto_28898 ) ) ( AVAILABLE ?auto_28898 ) ( SURFACE-AT ?auto_28890 ?auto_28893 ) ( ON ?auto_28890 ?auto_28903 ) ( CLEAR ?auto_28890 ) ( not ( = ?auto_28890 ?auto_28903 ) ) ( not ( = ?auto_28891 ?auto_28903 ) ) ( not ( = ?auto_28889 ?auto_28903 ) ) ( not ( = ?auto_28904 ?auto_28903 ) ) ( SURFACE-AT ?auto_28894 ?auto_28897 ) ( CLEAR ?auto_28894 ) ( IS-CRATE ?auto_28889 ) ( not ( = ?auto_28894 ?auto_28889 ) ) ( not ( = ?auto_28890 ?auto_28894 ) ) ( not ( = ?auto_28891 ?auto_28894 ) ) ( not ( = ?auto_28904 ?auto_28894 ) ) ( not ( = ?auto_28903 ?auto_28894 ) ) ( AVAILABLE ?auto_28892 ) ( TRUCK-AT ?auto_28901 ?auto_28899 ) ( not ( = ?auto_28899 ?auto_28897 ) ) ( not ( = ?auto_28896 ?auto_28899 ) ) ( not ( = ?auto_28893 ?auto_28899 ) ) ( HOIST-AT ?auto_28895 ?auto_28899 ) ( not ( = ?auto_28892 ?auto_28895 ) ) ( not ( = ?auto_28902 ?auto_28895 ) ) ( not ( = ?auto_28898 ?auto_28895 ) ) ( AVAILABLE ?auto_28895 ) ( SURFACE-AT ?auto_28889 ?auto_28899 ) ( ON ?auto_28889 ?auto_28900 ) ( CLEAR ?auto_28889 ) ( not ( = ?auto_28890 ?auto_28900 ) ) ( not ( = ?auto_28891 ?auto_28900 ) ) ( not ( = ?auto_28889 ?auto_28900 ) ) ( not ( = ?auto_28904 ?auto_28900 ) ) ( not ( = ?auto_28903 ?auto_28900 ) ) ( not ( = ?auto_28894 ?auto_28900 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28890 ?auto_28891 )
      ( MAKE-2CRATE-VERIFY ?auto_28889 ?auto_28890 ?auto_28891 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28905 - SURFACE
      ?auto_28906 - SURFACE
      ?auto_28907 - SURFACE
      ?auto_28908 - SURFACE
    )
    :vars
    (
      ?auto_28910 - HOIST
      ?auto_28919 - PLACE
      ?auto_28917 - PLACE
      ?auto_28915 - HOIST
      ?auto_28914 - SURFACE
      ?auto_28913 - PLACE
      ?auto_28911 - HOIST
      ?auto_28916 - SURFACE
      ?auto_28909 - TRUCK
      ?auto_28912 - PLACE
      ?auto_28918 - HOIST
      ?auto_28920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28910 ?auto_28919 ) ( IS-CRATE ?auto_28908 ) ( not ( = ?auto_28907 ?auto_28908 ) ) ( not ( = ?auto_28906 ?auto_28907 ) ) ( not ( = ?auto_28906 ?auto_28908 ) ) ( not ( = ?auto_28917 ?auto_28919 ) ) ( HOIST-AT ?auto_28915 ?auto_28917 ) ( not ( = ?auto_28910 ?auto_28915 ) ) ( AVAILABLE ?auto_28915 ) ( SURFACE-AT ?auto_28908 ?auto_28917 ) ( ON ?auto_28908 ?auto_28914 ) ( CLEAR ?auto_28908 ) ( not ( = ?auto_28907 ?auto_28914 ) ) ( not ( = ?auto_28908 ?auto_28914 ) ) ( not ( = ?auto_28906 ?auto_28914 ) ) ( IS-CRATE ?auto_28907 ) ( not ( = ?auto_28913 ?auto_28919 ) ) ( not ( = ?auto_28917 ?auto_28913 ) ) ( HOIST-AT ?auto_28911 ?auto_28913 ) ( not ( = ?auto_28910 ?auto_28911 ) ) ( not ( = ?auto_28915 ?auto_28911 ) ) ( AVAILABLE ?auto_28911 ) ( SURFACE-AT ?auto_28907 ?auto_28913 ) ( ON ?auto_28907 ?auto_28916 ) ( CLEAR ?auto_28907 ) ( not ( = ?auto_28907 ?auto_28916 ) ) ( not ( = ?auto_28908 ?auto_28916 ) ) ( not ( = ?auto_28906 ?auto_28916 ) ) ( not ( = ?auto_28914 ?auto_28916 ) ) ( SURFACE-AT ?auto_28905 ?auto_28919 ) ( CLEAR ?auto_28905 ) ( IS-CRATE ?auto_28906 ) ( not ( = ?auto_28905 ?auto_28906 ) ) ( not ( = ?auto_28907 ?auto_28905 ) ) ( not ( = ?auto_28908 ?auto_28905 ) ) ( not ( = ?auto_28914 ?auto_28905 ) ) ( not ( = ?auto_28916 ?auto_28905 ) ) ( AVAILABLE ?auto_28910 ) ( TRUCK-AT ?auto_28909 ?auto_28912 ) ( not ( = ?auto_28912 ?auto_28919 ) ) ( not ( = ?auto_28917 ?auto_28912 ) ) ( not ( = ?auto_28913 ?auto_28912 ) ) ( HOIST-AT ?auto_28918 ?auto_28912 ) ( not ( = ?auto_28910 ?auto_28918 ) ) ( not ( = ?auto_28915 ?auto_28918 ) ) ( not ( = ?auto_28911 ?auto_28918 ) ) ( AVAILABLE ?auto_28918 ) ( SURFACE-AT ?auto_28906 ?auto_28912 ) ( ON ?auto_28906 ?auto_28920 ) ( CLEAR ?auto_28906 ) ( not ( = ?auto_28907 ?auto_28920 ) ) ( not ( = ?auto_28908 ?auto_28920 ) ) ( not ( = ?auto_28906 ?auto_28920 ) ) ( not ( = ?auto_28914 ?auto_28920 ) ) ( not ( = ?auto_28916 ?auto_28920 ) ) ( not ( = ?auto_28905 ?auto_28920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28906 ?auto_28907 ?auto_28908 )
      ( MAKE-3CRATE-VERIFY ?auto_28905 ?auto_28906 ?auto_28907 ?auto_28908 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28921 - SURFACE
      ?auto_28922 - SURFACE
    )
    :vars
    (
      ?auto_28924 - HOIST
      ?auto_28935 - PLACE
      ?auto_28930 - SURFACE
      ?auto_28933 - PLACE
      ?auto_28931 - HOIST
      ?auto_28929 - SURFACE
      ?auto_28927 - PLACE
      ?auto_28925 - HOIST
      ?auto_28932 - SURFACE
      ?auto_28928 - SURFACE
      ?auto_28926 - PLACE
      ?auto_28934 - HOIST
      ?auto_28936 - SURFACE
      ?auto_28923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28924 ?auto_28935 ) ( IS-CRATE ?auto_28922 ) ( not ( = ?auto_28921 ?auto_28922 ) ) ( not ( = ?auto_28930 ?auto_28921 ) ) ( not ( = ?auto_28930 ?auto_28922 ) ) ( not ( = ?auto_28933 ?auto_28935 ) ) ( HOIST-AT ?auto_28931 ?auto_28933 ) ( not ( = ?auto_28924 ?auto_28931 ) ) ( AVAILABLE ?auto_28931 ) ( SURFACE-AT ?auto_28922 ?auto_28933 ) ( ON ?auto_28922 ?auto_28929 ) ( CLEAR ?auto_28922 ) ( not ( = ?auto_28921 ?auto_28929 ) ) ( not ( = ?auto_28922 ?auto_28929 ) ) ( not ( = ?auto_28930 ?auto_28929 ) ) ( IS-CRATE ?auto_28921 ) ( not ( = ?auto_28927 ?auto_28935 ) ) ( not ( = ?auto_28933 ?auto_28927 ) ) ( HOIST-AT ?auto_28925 ?auto_28927 ) ( not ( = ?auto_28924 ?auto_28925 ) ) ( not ( = ?auto_28931 ?auto_28925 ) ) ( AVAILABLE ?auto_28925 ) ( SURFACE-AT ?auto_28921 ?auto_28927 ) ( ON ?auto_28921 ?auto_28932 ) ( CLEAR ?auto_28921 ) ( not ( = ?auto_28921 ?auto_28932 ) ) ( not ( = ?auto_28922 ?auto_28932 ) ) ( not ( = ?auto_28930 ?auto_28932 ) ) ( not ( = ?auto_28929 ?auto_28932 ) ) ( SURFACE-AT ?auto_28928 ?auto_28935 ) ( CLEAR ?auto_28928 ) ( IS-CRATE ?auto_28930 ) ( not ( = ?auto_28928 ?auto_28930 ) ) ( not ( = ?auto_28921 ?auto_28928 ) ) ( not ( = ?auto_28922 ?auto_28928 ) ) ( not ( = ?auto_28929 ?auto_28928 ) ) ( not ( = ?auto_28932 ?auto_28928 ) ) ( AVAILABLE ?auto_28924 ) ( not ( = ?auto_28926 ?auto_28935 ) ) ( not ( = ?auto_28933 ?auto_28926 ) ) ( not ( = ?auto_28927 ?auto_28926 ) ) ( HOIST-AT ?auto_28934 ?auto_28926 ) ( not ( = ?auto_28924 ?auto_28934 ) ) ( not ( = ?auto_28931 ?auto_28934 ) ) ( not ( = ?auto_28925 ?auto_28934 ) ) ( AVAILABLE ?auto_28934 ) ( SURFACE-AT ?auto_28930 ?auto_28926 ) ( ON ?auto_28930 ?auto_28936 ) ( CLEAR ?auto_28930 ) ( not ( = ?auto_28921 ?auto_28936 ) ) ( not ( = ?auto_28922 ?auto_28936 ) ) ( not ( = ?auto_28930 ?auto_28936 ) ) ( not ( = ?auto_28929 ?auto_28936 ) ) ( not ( = ?auto_28932 ?auto_28936 ) ) ( not ( = ?auto_28928 ?auto_28936 ) ) ( TRUCK-AT ?auto_28923 ?auto_28935 ) )
    :subtasks
    ( ( !DRIVE ?auto_28923 ?auto_28935 ?auto_28926 )
      ( MAKE-2CRATE ?auto_28930 ?auto_28921 ?auto_28922 )
      ( MAKE-1CRATE-VERIFY ?auto_28921 ?auto_28922 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28937 - SURFACE
      ?auto_28938 - SURFACE
      ?auto_28939 - SURFACE
    )
    :vars
    (
      ?auto_28947 - HOIST
      ?auto_28951 - PLACE
      ?auto_28945 - PLACE
      ?auto_28950 - HOIST
      ?auto_28941 - SURFACE
      ?auto_28946 - PLACE
      ?auto_28952 - HOIST
      ?auto_28943 - SURFACE
      ?auto_28944 - SURFACE
      ?auto_28949 - PLACE
      ?auto_28942 - HOIST
      ?auto_28940 - SURFACE
      ?auto_28948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28947 ?auto_28951 ) ( IS-CRATE ?auto_28939 ) ( not ( = ?auto_28938 ?auto_28939 ) ) ( not ( = ?auto_28937 ?auto_28938 ) ) ( not ( = ?auto_28937 ?auto_28939 ) ) ( not ( = ?auto_28945 ?auto_28951 ) ) ( HOIST-AT ?auto_28950 ?auto_28945 ) ( not ( = ?auto_28947 ?auto_28950 ) ) ( AVAILABLE ?auto_28950 ) ( SURFACE-AT ?auto_28939 ?auto_28945 ) ( ON ?auto_28939 ?auto_28941 ) ( CLEAR ?auto_28939 ) ( not ( = ?auto_28938 ?auto_28941 ) ) ( not ( = ?auto_28939 ?auto_28941 ) ) ( not ( = ?auto_28937 ?auto_28941 ) ) ( IS-CRATE ?auto_28938 ) ( not ( = ?auto_28946 ?auto_28951 ) ) ( not ( = ?auto_28945 ?auto_28946 ) ) ( HOIST-AT ?auto_28952 ?auto_28946 ) ( not ( = ?auto_28947 ?auto_28952 ) ) ( not ( = ?auto_28950 ?auto_28952 ) ) ( AVAILABLE ?auto_28952 ) ( SURFACE-AT ?auto_28938 ?auto_28946 ) ( ON ?auto_28938 ?auto_28943 ) ( CLEAR ?auto_28938 ) ( not ( = ?auto_28938 ?auto_28943 ) ) ( not ( = ?auto_28939 ?auto_28943 ) ) ( not ( = ?auto_28937 ?auto_28943 ) ) ( not ( = ?auto_28941 ?auto_28943 ) ) ( SURFACE-AT ?auto_28944 ?auto_28951 ) ( CLEAR ?auto_28944 ) ( IS-CRATE ?auto_28937 ) ( not ( = ?auto_28944 ?auto_28937 ) ) ( not ( = ?auto_28938 ?auto_28944 ) ) ( not ( = ?auto_28939 ?auto_28944 ) ) ( not ( = ?auto_28941 ?auto_28944 ) ) ( not ( = ?auto_28943 ?auto_28944 ) ) ( AVAILABLE ?auto_28947 ) ( not ( = ?auto_28949 ?auto_28951 ) ) ( not ( = ?auto_28945 ?auto_28949 ) ) ( not ( = ?auto_28946 ?auto_28949 ) ) ( HOIST-AT ?auto_28942 ?auto_28949 ) ( not ( = ?auto_28947 ?auto_28942 ) ) ( not ( = ?auto_28950 ?auto_28942 ) ) ( not ( = ?auto_28952 ?auto_28942 ) ) ( AVAILABLE ?auto_28942 ) ( SURFACE-AT ?auto_28937 ?auto_28949 ) ( ON ?auto_28937 ?auto_28940 ) ( CLEAR ?auto_28937 ) ( not ( = ?auto_28938 ?auto_28940 ) ) ( not ( = ?auto_28939 ?auto_28940 ) ) ( not ( = ?auto_28937 ?auto_28940 ) ) ( not ( = ?auto_28941 ?auto_28940 ) ) ( not ( = ?auto_28943 ?auto_28940 ) ) ( not ( = ?auto_28944 ?auto_28940 ) ) ( TRUCK-AT ?auto_28948 ?auto_28951 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28938 ?auto_28939 )
      ( MAKE-2CRATE-VERIFY ?auto_28937 ?auto_28938 ?auto_28939 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28953 - SURFACE
      ?auto_28954 - SURFACE
      ?auto_28955 - SURFACE
      ?auto_28956 - SURFACE
    )
    :vars
    (
      ?auto_28968 - HOIST
      ?auto_28958 - PLACE
      ?auto_28966 - PLACE
      ?auto_28963 - HOIST
      ?auto_28965 - SURFACE
      ?auto_28964 - PLACE
      ?auto_28967 - HOIST
      ?auto_28962 - SURFACE
      ?auto_28961 - PLACE
      ?auto_28960 - HOIST
      ?auto_28957 - SURFACE
      ?auto_28959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28968 ?auto_28958 ) ( IS-CRATE ?auto_28956 ) ( not ( = ?auto_28955 ?auto_28956 ) ) ( not ( = ?auto_28954 ?auto_28955 ) ) ( not ( = ?auto_28954 ?auto_28956 ) ) ( not ( = ?auto_28966 ?auto_28958 ) ) ( HOIST-AT ?auto_28963 ?auto_28966 ) ( not ( = ?auto_28968 ?auto_28963 ) ) ( AVAILABLE ?auto_28963 ) ( SURFACE-AT ?auto_28956 ?auto_28966 ) ( ON ?auto_28956 ?auto_28965 ) ( CLEAR ?auto_28956 ) ( not ( = ?auto_28955 ?auto_28965 ) ) ( not ( = ?auto_28956 ?auto_28965 ) ) ( not ( = ?auto_28954 ?auto_28965 ) ) ( IS-CRATE ?auto_28955 ) ( not ( = ?auto_28964 ?auto_28958 ) ) ( not ( = ?auto_28966 ?auto_28964 ) ) ( HOIST-AT ?auto_28967 ?auto_28964 ) ( not ( = ?auto_28968 ?auto_28967 ) ) ( not ( = ?auto_28963 ?auto_28967 ) ) ( AVAILABLE ?auto_28967 ) ( SURFACE-AT ?auto_28955 ?auto_28964 ) ( ON ?auto_28955 ?auto_28962 ) ( CLEAR ?auto_28955 ) ( not ( = ?auto_28955 ?auto_28962 ) ) ( not ( = ?auto_28956 ?auto_28962 ) ) ( not ( = ?auto_28954 ?auto_28962 ) ) ( not ( = ?auto_28965 ?auto_28962 ) ) ( SURFACE-AT ?auto_28953 ?auto_28958 ) ( CLEAR ?auto_28953 ) ( IS-CRATE ?auto_28954 ) ( not ( = ?auto_28953 ?auto_28954 ) ) ( not ( = ?auto_28955 ?auto_28953 ) ) ( not ( = ?auto_28956 ?auto_28953 ) ) ( not ( = ?auto_28965 ?auto_28953 ) ) ( not ( = ?auto_28962 ?auto_28953 ) ) ( AVAILABLE ?auto_28968 ) ( not ( = ?auto_28961 ?auto_28958 ) ) ( not ( = ?auto_28966 ?auto_28961 ) ) ( not ( = ?auto_28964 ?auto_28961 ) ) ( HOIST-AT ?auto_28960 ?auto_28961 ) ( not ( = ?auto_28968 ?auto_28960 ) ) ( not ( = ?auto_28963 ?auto_28960 ) ) ( not ( = ?auto_28967 ?auto_28960 ) ) ( AVAILABLE ?auto_28960 ) ( SURFACE-AT ?auto_28954 ?auto_28961 ) ( ON ?auto_28954 ?auto_28957 ) ( CLEAR ?auto_28954 ) ( not ( = ?auto_28955 ?auto_28957 ) ) ( not ( = ?auto_28956 ?auto_28957 ) ) ( not ( = ?auto_28954 ?auto_28957 ) ) ( not ( = ?auto_28965 ?auto_28957 ) ) ( not ( = ?auto_28962 ?auto_28957 ) ) ( not ( = ?auto_28953 ?auto_28957 ) ) ( TRUCK-AT ?auto_28959 ?auto_28958 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28954 ?auto_28955 ?auto_28956 )
      ( MAKE-3CRATE-VERIFY ?auto_28953 ?auto_28954 ?auto_28955 ?auto_28956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28983 - SURFACE
      ?auto_28984 - SURFACE
    )
    :vars
    (
      ?auto_28985 - HOIST
      ?auto_28986 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28985 ?auto_28986 ) ( SURFACE-AT ?auto_28983 ?auto_28986 ) ( CLEAR ?auto_28983 ) ( LIFTING ?auto_28985 ?auto_28984 ) ( IS-CRATE ?auto_28984 ) ( not ( = ?auto_28983 ?auto_28984 ) ) )
    :subtasks
    ( ( !DROP ?auto_28985 ?auto_28984 ?auto_28983 ?auto_28986 )
      ( MAKE-1CRATE-VERIFY ?auto_28983 ?auto_28984 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28987 - SURFACE
      ?auto_28988 - SURFACE
      ?auto_28989 - SURFACE
    )
    :vars
    (
      ?auto_28991 - HOIST
      ?auto_28990 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28991 ?auto_28990 ) ( SURFACE-AT ?auto_28988 ?auto_28990 ) ( CLEAR ?auto_28988 ) ( LIFTING ?auto_28991 ?auto_28989 ) ( IS-CRATE ?auto_28989 ) ( not ( = ?auto_28988 ?auto_28989 ) ) ( ON ?auto_28988 ?auto_28987 ) ( not ( = ?auto_28987 ?auto_28988 ) ) ( not ( = ?auto_28987 ?auto_28989 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28988 ?auto_28989 )
      ( MAKE-2CRATE-VERIFY ?auto_28987 ?auto_28988 ?auto_28989 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28992 - SURFACE
      ?auto_28993 - SURFACE
      ?auto_28994 - SURFACE
      ?auto_28995 - SURFACE
    )
    :vars
    (
      ?auto_28997 - HOIST
      ?auto_28996 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28997 ?auto_28996 ) ( SURFACE-AT ?auto_28994 ?auto_28996 ) ( CLEAR ?auto_28994 ) ( LIFTING ?auto_28997 ?auto_28995 ) ( IS-CRATE ?auto_28995 ) ( not ( = ?auto_28994 ?auto_28995 ) ) ( ON ?auto_28993 ?auto_28992 ) ( ON ?auto_28994 ?auto_28993 ) ( not ( = ?auto_28992 ?auto_28993 ) ) ( not ( = ?auto_28992 ?auto_28994 ) ) ( not ( = ?auto_28992 ?auto_28995 ) ) ( not ( = ?auto_28993 ?auto_28994 ) ) ( not ( = ?auto_28993 ?auto_28995 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28994 ?auto_28995 )
      ( MAKE-3CRATE-VERIFY ?auto_28992 ?auto_28993 ?auto_28994 ?auto_28995 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28998 - SURFACE
      ?auto_28999 - SURFACE
      ?auto_29000 - SURFACE
      ?auto_29001 - SURFACE
      ?auto_29002 - SURFACE
    )
    :vars
    (
      ?auto_29004 - HOIST
      ?auto_29003 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29004 ?auto_29003 ) ( SURFACE-AT ?auto_29001 ?auto_29003 ) ( CLEAR ?auto_29001 ) ( LIFTING ?auto_29004 ?auto_29002 ) ( IS-CRATE ?auto_29002 ) ( not ( = ?auto_29001 ?auto_29002 ) ) ( ON ?auto_28999 ?auto_28998 ) ( ON ?auto_29000 ?auto_28999 ) ( ON ?auto_29001 ?auto_29000 ) ( not ( = ?auto_28998 ?auto_28999 ) ) ( not ( = ?auto_28998 ?auto_29000 ) ) ( not ( = ?auto_28998 ?auto_29001 ) ) ( not ( = ?auto_28998 ?auto_29002 ) ) ( not ( = ?auto_28999 ?auto_29000 ) ) ( not ( = ?auto_28999 ?auto_29001 ) ) ( not ( = ?auto_28999 ?auto_29002 ) ) ( not ( = ?auto_29000 ?auto_29001 ) ) ( not ( = ?auto_29000 ?auto_29002 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29001 ?auto_29002 )
      ( MAKE-4CRATE-VERIFY ?auto_28998 ?auto_28999 ?auto_29000 ?auto_29001 ?auto_29002 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29005 - SURFACE
      ?auto_29006 - SURFACE
    )
    :vars
    (
      ?auto_29008 - HOIST
      ?auto_29007 - PLACE
      ?auto_29009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29008 ?auto_29007 ) ( SURFACE-AT ?auto_29005 ?auto_29007 ) ( CLEAR ?auto_29005 ) ( IS-CRATE ?auto_29006 ) ( not ( = ?auto_29005 ?auto_29006 ) ) ( TRUCK-AT ?auto_29009 ?auto_29007 ) ( AVAILABLE ?auto_29008 ) ( IN ?auto_29006 ?auto_29009 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29008 ?auto_29006 ?auto_29009 ?auto_29007 )
      ( MAKE-1CRATE ?auto_29005 ?auto_29006 )
      ( MAKE-1CRATE-VERIFY ?auto_29005 ?auto_29006 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29010 - SURFACE
      ?auto_29011 - SURFACE
      ?auto_29012 - SURFACE
    )
    :vars
    (
      ?auto_29015 - HOIST
      ?auto_29013 - PLACE
      ?auto_29014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29015 ?auto_29013 ) ( SURFACE-AT ?auto_29011 ?auto_29013 ) ( CLEAR ?auto_29011 ) ( IS-CRATE ?auto_29012 ) ( not ( = ?auto_29011 ?auto_29012 ) ) ( TRUCK-AT ?auto_29014 ?auto_29013 ) ( AVAILABLE ?auto_29015 ) ( IN ?auto_29012 ?auto_29014 ) ( ON ?auto_29011 ?auto_29010 ) ( not ( = ?auto_29010 ?auto_29011 ) ) ( not ( = ?auto_29010 ?auto_29012 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29011 ?auto_29012 )
      ( MAKE-2CRATE-VERIFY ?auto_29010 ?auto_29011 ?auto_29012 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29016 - SURFACE
      ?auto_29017 - SURFACE
      ?auto_29018 - SURFACE
      ?auto_29019 - SURFACE
    )
    :vars
    (
      ?auto_29022 - HOIST
      ?auto_29021 - PLACE
      ?auto_29020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29022 ?auto_29021 ) ( SURFACE-AT ?auto_29018 ?auto_29021 ) ( CLEAR ?auto_29018 ) ( IS-CRATE ?auto_29019 ) ( not ( = ?auto_29018 ?auto_29019 ) ) ( TRUCK-AT ?auto_29020 ?auto_29021 ) ( AVAILABLE ?auto_29022 ) ( IN ?auto_29019 ?auto_29020 ) ( ON ?auto_29018 ?auto_29017 ) ( not ( = ?auto_29017 ?auto_29018 ) ) ( not ( = ?auto_29017 ?auto_29019 ) ) ( ON ?auto_29017 ?auto_29016 ) ( not ( = ?auto_29016 ?auto_29017 ) ) ( not ( = ?auto_29016 ?auto_29018 ) ) ( not ( = ?auto_29016 ?auto_29019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29017 ?auto_29018 ?auto_29019 )
      ( MAKE-3CRATE-VERIFY ?auto_29016 ?auto_29017 ?auto_29018 ?auto_29019 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29023 - SURFACE
      ?auto_29024 - SURFACE
      ?auto_29025 - SURFACE
      ?auto_29026 - SURFACE
      ?auto_29027 - SURFACE
    )
    :vars
    (
      ?auto_29030 - HOIST
      ?auto_29029 - PLACE
      ?auto_29028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29030 ?auto_29029 ) ( SURFACE-AT ?auto_29026 ?auto_29029 ) ( CLEAR ?auto_29026 ) ( IS-CRATE ?auto_29027 ) ( not ( = ?auto_29026 ?auto_29027 ) ) ( TRUCK-AT ?auto_29028 ?auto_29029 ) ( AVAILABLE ?auto_29030 ) ( IN ?auto_29027 ?auto_29028 ) ( ON ?auto_29026 ?auto_29025 ) ( not ( = ?auto_29025 ?auto_29026 ) ) ( not ( = ?auto_29025 ?auto_29027 ) ) ( ON ?auto_29024 ?auto_29023 ) ( ON ?auto_29025 ?auto_29024 ) ( not ( = ?auto_29023 ?auto_29024 ) ) ( not ( = ?auto_29023 ?auto_29025 ) ) ( not ( = ?auto_29023 ?auto_29026 ) ) ( not ( = ?auto_29023 ?auto_29027 ) ) ( not ( = ?auto_29024 ?auto_29025 ) ) ( not ( = ?auto_29024 ?auto_29026 ) ) ( not ( = ?auto_29024 ?auto_29027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29025 ?auto_29026 ?auto_29027 )
      ( MAKE-4CRATE-VERIFY ?auto_29023 ?auto_29024 ?auto_29025 ?auto_29026 ?auto_29027 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29031 - SURFACE
      ?auto_29032 - SURFACE
    )
    :vars
    (
      ?auto_29036 - HOIST
      ?auto_29035 - PLACE
      ?auto_29033 - TRUCK
      ?auto_29034 - SURFACE
      ?auto_29037 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29036 ?auto_29035 ) ( SURFACE-AT ?auto_29031 ?auto_29035 ) ( CLEAR ?auto_29031 ) ( IS-CRATE ?auto_29032 ) ( not ( = ?auto_29031 ?auto_29032 ) ) ( AVAILABLE ?auto_29036 ) ( IN ?auto_29032 ?auto_29033 ) ( ON ?auto_29031 ?auto_29034 ) ( not ( = ?auto_29034 ?auto_29031 ) ) ( not ( = ?auto_29034 ?auto_29032 ) ) ( TRUCK-AT ?auto_29033 ?auto_29037 ) ( not ( = ?auto_29037 ?auto_29035 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29033 ?auto_29037 ?auto_29035 )
      ( MAKE-2CRATE ?auto_29034 ?auto_29031 ?auto_29032 )
      ( MAKE-1CRATE-VERIFY ?auto_29031 ?auto_29032 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29038 - SURFACE
      ?auto_29039 - SURFACE
      ?auto_29040 - SURFACE
    )
    :vars
    (
      ?auto_29044 - HOIST
      ?auto_29041 - PLACE
      ?auto_29043 - TRUCK
      ?auto_29042 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29044 ?auto_29041 ) ( SURFACE-AT ?auto_29039 ?auto_29041 ) ( CLEAR ?auto_29039 ) ( IS-CRATE ?auto_29040 ) ( not ( = ?auto_29039 ?auto_29040 ) ) ( AVAILABLE ?auto_29044 ) ( IN ?auto_29040 ?auto_29043 ) ( ON ?auto_29039 ?auto_29038 ) ( not ( = ?auto_29038 ?auto_29039 ) ) ( not ( = ?auto_29038 ?auto_29040 ) ) ( TRUCK-AT ?auto_29043 ?auto_29042 ) ( not ( = ?auto_29042 ?auto_29041 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29039 ?auto_29040 )
      ( MAKE-2CRATE-VERIFY ?auto_29038 ?auto_29039 ?auto_29040 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29045 - SURFACE
      ?auto_29046 - SURFACE
      ?auto_29047 - SURFACE
      ?auto_29048 - SURFACE
    )
    :vars
    (
      ?auto_29049 - HOIST
      ?auto_29052 - PLACE
      ?auto_29050 - TRUCK
      ?auto_29051 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29049 ?auto_29052 ) ( SURFACE-AT ?auto_29047 ?auto_29052 ) ( CLEAR ?auto_29047 ) ( IS-CRATE ?auto_29048 ) ( not ( = ?auto_29047 ?auto_29048 ) ) ( AVAILABLE ?auto_29049 ) ( IN ?auto_29048 ?auto_29050 ) ( ON ?auto_29047 ?auto_29046 ) ( not ( = ?auto_29046 ?auto_29047 ) ) ( not ( = ?auto_29046 ?auto_29048 ) ) ( TRUCK-AT ?auto_29050 ?auto_29051 ) ( not ( = ?auto_29051 ?auto_29052 ) ) ( ON ?auto_29046 ?auto_29045 ) ( not ( = ?auto_29045 ?auto_29046 ) ) ( not ( = ?auto_29045 ?auto_29047 ) ) ( not ( = ?auto_29045 ?auto_29048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29046 ?auto_29047 ?auto_29048 )
      ( MAKE-3CRATE-VERIFY ?auto_29045 ?auto_29046 ?auto_29047 ?auto_29048 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29053 - SURFACE
      ?auto_29054 - SURFACE
      ?auto_29055 - SURFACE
      ?auto_29056 - SURFACE
      ?auto_29057 - SURFACE
    )
    :vars
    (
      ?auto_29058 - HOIST
      ?auto_29061 - PLACE
      ?auto_29059 - TRUCK
      ?auto_29060 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29058 ?auto_29061 ) ( SURFACE-AT ?auto_29056 ?auto_29061 ) ( CLEAR ?auto_29056 ) ( IS-CRATE ?auto_29057 ) ( not ( = ?auto_29056 ?auto_29057 ) ) ( AVAILABLE ?auto_29058 ) ( IN ?auto_29057 ?auto_29059 ) ( ON ?auto_29056 ?auto_29055 ) ( not ( = ?auto_29055 ?auto_29056 ) ) ( not ( = ?auto_29055 ?auto_29057 ) ) ( TRUCK-AT ?auto_29059 ?auto_29060 ) ( not ( = ?auto_29060 ?auto_29061 ) ) ( ON ?auto_29054 ?auto_29053 ) ( ON ?auto_29055 ?auto_29054 ) ( not ( = ?auto_29053 ?auto_29054 ) ) ( not ( = ?auto_29053 ?auto_29055 ) ) ( not ( = ?auto_29053 ?auto_29056 ) ) ( not ( = ?auto_29053 ?auto_29057 ) ) ( not ( = ?auto_29054 ?auto_29055 ) ) ( not ( = ?auto_29054 ?auto_29056 ) ) ( not ( = ?auto_29054 ?auto_29057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29055 ?auto_29056 ?auto_29057 )
      ( MAKE-4CRATE-VERIFY ?auto_29053 ?auto_29054 ?auto_29055 ?auto_29056 ?auto_29057 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29062 - SURFACE
      ?auto_29063 - SURFACE
    )
    :vars
    (
      ?auto_29065 - HOIST
      ?auto_29068 - PLACE
      ?auto_29064 - SURFACE
      ?auto_29066 - TRUCK
      ?auto_29067 - PLACE
      ?auto_29069 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29065 ?auto_29068 ) ( SURFACE-AT ?auto_29062 ?auto_29068 ) ( CLEAR ?auto_29062 ) ( IS-CRATE ?auto_29063 ) ( not ( = ?auto_29062 ?auto_29063 ) ) ( AVAILABLE ?auto_29065 ) ( ON ?auto_29062 ?auto_29064 ) ( not ( = ?auto_29064 ?auto_29062 ) ) ( not ( = ?auto_29064 ?auto_29063 ) ) ( TRUCK-AT ?auto_29066 ?auto_29067 ) ( not ( = ?auto_29067 ?auto_29068 ) ) ( HOIST-AT ?auto_29069 ?auto_29067 ) ( LIFTING ?auto_29069 ?auto_29063 ) ( not ( = ?auto_29065 ?auto_29069 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29069 ?auto_29063 ?auto_29066 ?auto_29067 )
      ( MAKE-2CRATE ?auto_29064 ?auto_29062 ?auto_29063 )
      ( MAKE-1CRATE-VERIFY ?auto_29062 ?auto_29063 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29070 - SURFACE
      ?auto_29071 - SURFACE
      ?auto_29072 - SURFACE
    )
    :vars
    (
      ?auto_29075 - HOIST
      ?auto_29077 - PLACE
      ?auto_29074 - TRUCK
      ?auto_29073 - PLACE
      ?auto_29076 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29075 ?auto_29077 ) ( SURFACE-AT ?auto_29071 ?auto_29077 ) ( CLEAR ?auto_29071 ) ( IS-CRATE ?auto_29072 ) ( not ( = ?auto_29071 ?auto_29072 ) ) ( AVAILABLE ?auto_29075 ) ( ON ?auto_29071 ?auto_29070 ) ( not ( = ?auto_29070 ?auto_29071 ) ) ( not ( = ?auto_29070 ?auto_29072 ) ) ( TRUCK-AT ?auto_29074 ?auto_29073 ) ( not ( = ?auto_29073 ?auto_29077 ) ) ( HOIST-AT ?auto_29076 ?auto_29073 ) ( LIFTING ?auto_29076 ?auto_29072 ) ( not ( = ?auto_29075 ?auto_29076 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29071 ?auto_29072 )
      ( MAKE-2CRATE-VERIFY ?auto_29070 ?auto_29071 ?auto_29072 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29078 - SURFACE
      ?auto_29079 - SURFACE
      ?auto_29080 - SURFACE
      ?auto_29081 - SURFACE
    )
    :vars
    (
      ?auto_29086 - HOIST
      ?auto_29083 - PLACE
      ?auto_29082 - TRUCK
      ?auto_29084 - PLACE
      ?auto_29085 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29086 ?auto_29083 ) ( SURFACE-AT ?auto_29080 ?auto_29083 ) ( CLEAR ?auto_29080 ) ( IS-CRATE ?auto_29081 ) ( not ( = ?auto_29080 ?auto_29081 ) ) ( AVAILABLE ?auto_29086 ) ( ON ?auto_29080 ?auto_29079 ) ( not ( = ?auto_29079 ?auto_29080 ) ) ( not ( = ?auto_29079 ?auto_29081 ) ) ( TRUCK-AT ?auto_29082 ?auto_29084 ) ( not ( = ?auto_29084 ?auto_29083 ) ) ( HOIST-AT ?auto_29085 ?auto_29084 ) ( LIFTING ?auto_29085 ?auto_29081 ) ( not ( = ?auto_29086 ?auto_29085 ) ) ( ON ?auto_29079 ?auto_29078 ) ( not ( = ?auto_29078 ?auto_29079 ) ) ( not ( = ?auto_29078 ?auto_29080 ) ) ( not ( = ?auto_29078 ?auto_29081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29079 ?auto_29080 ?auto_29081 )
      ( MAKE-3CRATE-VERIFY ?auto_29078 ?auto_29079 ?auto_29080 ?auto_29081 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29087 - SURFACE
      ?auto_29088 - SURFACE
      ?auto_29089 - SURFACE
      ?auto_29090 - SURFACE
      ?auto_29091 - SURFACE
    )
    :vars
    (
      ?auto_29096 - HOIST
      ?auto_29093 - PLACE
      ?auto_29092 - TRUCK
      ?auto_29094 - PLACE
      ?auto_29095 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29096 ?auto_29093 ) ( SURFACE-AT ?auto_29090 ?auto_29093 ) ( CLEAR ?auto_29090 ) ( IS-CRATE ?auto_29091 ) ( not ( = ?auto_29090 ?auto_29091 ) ) ( AVAILABLE ?auto_29096 ) ( ON ?auto_29090 ?auto_29089 ) ( not ( = ?auto_29089 ?auto_29090 ) ) ( not ( = ?auto_29089 ?auto_29091 ) ) ( TRUCK-AT ?auto_29092 ?auto_29094 ) ( not ( = ?auto_29094 ?auto_29093 ) ) ( HOIST-AT ?auto_29095 ?auto_29094 ) ( LIFTING ?auto_29095 ?auto_29091 ) ( not ( = ?auto_29096 ?auto_29095 ) ) ( ON ?auto_29088 ?auto_29087 ) ( ON ?auto_29089 ?auto_29088 ) ( not ( = ?auto_29087 ?auto_29088 ) ) ( not ( = ?auto_29087 ?auto_29089 ) ) ( not ( = ?auto_29087 ?auto_29090 ) ) ( not ( = ?auto_29087 ?auto_29091 ) ) ( not ( = ?auto_29088 ?auto_29089 ) ) ( not ( = ?auto_29088 ?auto_29090 ) ) ( not ( = ?auto_29088 ?auto_29091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29089 ?auto_29090 ?auto_29091 )
      ( MAKE-4CRATE-VERIFY ?auto_29087 ?auto_29088 ?auto_29089 ?auto_29090 ?auto_29091 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29097 - SURFACE
      ?auto_29098 - SURFACE
    )
    :vars
    (
      ?auto_29104 - HOIST
      ?auto_29100 - PLACE
      ?auto_29103 - SURFACE
      ?auto_29099 - TRUCK
      ?auto_29101 - PLACE
      ?auto_29102 - HOIST
      ?auto_29105 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29104 ?auto_29100 ) ( SURFACE-AT ?auto_29097 ?auto_29100 ) ( CLEAR ?auto_29097 ) ( IS-CRATE ?auto_29098 ) ( not ( = ?auto_29097 ?auto_29098 ) ) ( AVAILABLE ?auto_29104 ) ( ON ?auto_29097 ?auto_29103 ) ( not ( = ?auto_29103 ?auto_29097 ) ) ( not ( = ?auto_29103 ?auto_29098 ) ) ( TRUCK-AT ?auto_29099 ?auto_29101 ) ( not ( = ?auto_29101 ?auto_29100 ) ) ( HOIST-AT ?auto_29102 ?auto_29101 ) ( not ( = ?auto_29104 ?auto_29102 ) ) ( AVAILABLE ?auto_29102 ) ( SURFACE-AT ?auto_29098 ?auto_29101 ) ( ON ?auto_29098 ?auto_29105 ) ( CLEAR ?auto_29098 ) ( not ( = ?auto_29097 ?auto_29105 ) ) ( not ( = ?auto_29098 ?auto_29105 ) ) ( not ( = ?auto_29103 ?auto_29105 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29102 ?auto_29098 ?auto_29105 ?auto_29101 )
      ( MAKE-2CRATE ?auto_29103 ?auto_29097 ?auto_29098 )
      ( MAKE-1CRATE-VERIFY ?auto_29097 ?auto_29098 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29106 - SURFACE
      ?auto_29107 - SURFACE
      ?auto_29108 - SURFACE
    )
    :vars
    (
      ?auto_29110 - HOIST
      ?auto_29114 - PLACE
      ?auto_29112 - TRUCK
      ?auto_29113 - PLACE
      ?auto_29109 - HOIST
      ?auto_29111 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29110 ?auto_29114 ) ( SURFACE-AT ?auto_29107 ?auto_29114 ) ( CLEAR ?auto_29107 ) ( IS-CRATE ?auto_29108 ) ( not ( = ?auto_29107 ?auto_29108 ) ) ( AVAILABLE ?auto_29110 ) ( ON ?auto_29107 ?auto_29106 ) ( not ( = ?auto_29106 ?auto_29107 ) ) ( not ( = ?auto_29106 ?auto_29108 ) ) ( TRUCK-AT ?auto_29112 ?auto_29113 ) ( not ( = ?auto_29113 ?auto_29114 ) ) ( HOIST-AT ?auto_29109 ?auto_29113 ) ( not ( = ?auto_29110 ?auto_29109 ) ) ( AVAILABLE ?auto_29109 ) ( SURFACE-AT ?auto_29108 ?auto_29113 ) ( ON ?auto_29108 ?auto_29111 ) ( CLEAR ?auto_29108 ) ( not ( = ?auto_29107 ?auto_29111 ) ) ( not ( = ?auto_29108 ?auto_29111 ) ) ( not ( = ?auto_29106 ?auto_29111 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29107 ?auto_29108 )
      ( MAKE-2CRATE-VERIFY ?auto_29106 ?auto_29107 ?auto_29108 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29115 - SURFACE
      ?auto_29116 - SURFACE
      ?auto_29117 - SURFACE
      ?auto_29118 - SURFACE
    )
    :vars
    (
      ?auto_29121 - HOIST
      ?auto_29123 - PLACE
      ?auto_29120 - TRUCK
      ?auto_29119 - PLACE
      ?auto_29124 - HOIST
      ?auto_29122 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29121 ?auto_29123 ) ( SURFACE-AT ?auto_29117 ?auto_29123 ) ( CLEAR ?auto_29117 ) ( IS-CRATE ?auto_29118 ) ( not ( = ?auto_29117 ?auto_29118 ) ) ( AVAILABLE ?auto_29121 ) ( ON ?auto_29117 ?auto_29116 ) ( not ( = ?auto_29116 ?auto_29117 ) ) ( not ( = ?auto_29116 ?auto_29118 ) ) ( TRUCK-AT ?auto_29120 ?auto_29119 ) ( not ( = ?auto_29119 ?auto_29123 ) ) ( HOIST-AT ?auto_29124 ?auto_29119 ) ( not ( = ?auto_29121 ?auto_29124 ) ) ( AVAILABLE ?auto_29124 ) ( SURFACE-AT ?auto_29118 ?auto_29119 ) ( ON ?auto_29118 ?auto_29122 ) ( CLEAR ?auto_29118 ) ( not ( = ?auto_29117 ?auto_29122 ) ) ( not ( = ?auto_29118 ?auto_29122 ) ) ( not ( = ?auto_29116 ?auto_29122 ) ) ( ON ?auto_29116 ?auto_29115 ) ( not ( = ?auto_29115 ?auto_29116 ) ) ( not ( = ?auto_29115 ?auto_29117 ) ) ( not ( = ?auto_29115 ?auto_29118 ) ) ( not ( = ?auto_29115 ?auto_29122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29116 ?auto_29117 ?auto_29118 )
      ( MAKE-3CRATE-VERIFY ?auto_29115 ?auto_29116 ?auto_29117 ?auto_29118 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29125 - SURFACE
      ?auto_29126 - SURFACE
      ?auto_29127 - SURFACE
      ?auto_29128 - SURFACE
      ?auto_29129 - SURFACE
    )
    :vars
    (
      ?auto_29132 - HOIST
      ?auto_29134 - PLACE
      ?auto_29131 - TRUCK
      ?auto_29130 - PLACE
      ?auto_29135 - HOIST
      ?auto_29133 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29132 ?auto_29134 ) ( SURFACE-AT ?auto_29128 ?auto_29134 ) ( CLEAR ?auto_29128 ) ( IS-CRATE ?auto_29129 ) ( not ( = ?auto_29128 ?auto_29129 ) ) ( AVAILABLE ?auto_29132 ) ( ON ?auto_29128 ?auto_29127 ) ( not ( = ?auto_29127 ?auto_29128 ) ) ( not ( = ?auto_29127 ?auto_29129 ) ) ( TRUCK-AT ?auto_29131 ?auto_29130 ) ( not ( = ?auto_29130 ?auto_29134 ) ) ( HOIST-AT ?auto_29135 ?auto_29130 ) ( not ( = ?auto_29132 ?auto_29135 ) ) ( AVAILABLE ?auto_29135 ) ( SURFACE-AT ?auto_29129 ?auto_29130 ) ( ON ?auto_29129 ?auto_29133 ) ( CLEAR ?auto_29129 ) ( not ( = ?auto_29128 ?auto_29133 ) ) ( not ( = ?auto_29129 ?auto_29133 ) ) ( not ( = ?auto_29127 ?auto_29133 ) ) ( ON ?auto_29126 ?auto_29125 ) ( ON ?auto_29127 ?auto_29126 ) ( not ( = ?auto_29125 ?auto_29126 ) ) ( not ( = ?auto_29125 ?auto_29127 ) ) ( not ( = ?auto_29125 ?auto_29128 ) ) ( not ( = ?auto_29125 ?auto_29129 ) ) ( not ( = ?auto_29125 ?auto_29133 ) ) ( not ( = ?auto_29126 ?auto_29127 ) ) ( not ( = ?auto_29126 ?auto_29128 ) ) ( not ( = ?auto_29126 ?auto_29129 ) ) ( not ( = ?auto_29126 ?auto_29133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29127 ?auto_29128 ?auto_29129 )
      ( MAKE-4CRATE-VERIFY ?auto_29125 ?auto_29126 ?auto_29127 ?auto_29128 ?auto_29129 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29136 - SURFACE
      ?auto_29137 - SURFACE
    )
    :vars
    (
      ?auto_29140 - HOIST
      ?auto_29142 - PLACE
      ?auto_29143 - SURFACE
      ?auto_29138 - PLACE
      ?auto_29144 - HOIST
      ?auto_29141 - SURFACE
      ?auto_29139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29140 ?auto_29142 ) ( SURFACE-AT ?auto_29136 ?auto_29142 ) ( CLEAR ?auto_29136 ) ( IS-CRATE ?auto_29137 ) ( not ( = ?auto_29136 ?auto_29137 ) ) ( AVAILABLE ?auto_29140 ) ( ON ?auto_29136 ?auto_29143 ) ( not ( = ?auto_29143 ?auto_29136 ) ) ( not ( = ?auto_29143 ?auto_29137 ) ) ( not ( = ?auto_29138 ?auto_29142 ) ) ( HOIST-AT ?auto_29144 ?auto_29138 ) ( not ( = ?auto_29140 ?auto_29144 ) ) ( AVAILABLE ?auto_29144 ) ( SURFACE-AT ?auto_29137 ?auto_29138 ) ( ON ?auto_29137 ?auto_29141 ) ( CLEAR ?auto_29137 ) ( not ( = ?auto_29136 ?auto_29141 ) ) ( not ( = ?auto_29137 ?auto_29141 ) ) ( not ( = ?auto_29143 ?auto_29141 ) ) ( TRUCK-AT ?auto_29139 ?auto_29142 ) )
    :subtasks
    ( ( !DRIVE ?auto_29139 ?auto_29142 ?auto_29138 )
      ( MAKE-2CRATE ?auto_29143 ?auto_29136 ?auto_29137 )
      ( MAKE-1CRATE-VERIFY ?auto_29136 ?auto_29137 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29145 - SURFACE
      ?auto_29146 - SURFACE
      ?auto_29147 - SURFACE
    )
    :vars
    (
      ?auto_29150 - HOIST
      ?auto_29151 - PLACE
      ?auto_29149 - PLACE
      ?auto_29148 - HOIST
      ?auto_29153 - SURFACE
      ?auto_29152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29150 ?auto_29151 ) ( SURFACE-AT ?auto_29146 ?auto_29151 ) ( CLEAR ?auto_29146 ) ( IS-CRATE ?auto_29147 ) ( not ( = ?auto_29146 ?auto_29147 ) ) ( AVAILABLE ?auto_29150 ) ( ON ?auto_29146 ?auto_29145 ) ( not ( = ?auto_29145 ?auto_29146 ) ) ( not ( = ?auto_29145 ?auto_29147 ) ) ( not ( = ?auto_29149 ?auto_29151 ) ) ( HOIST-AT ?auto_29148 ?auto_29149 ) ( not ( = ?auto_29150 ?auto_29148 ) ) ( AVAILABLE ?auto_29148 ) ( SURFACE-AT ?auto_29147 ?auto_29149 ) ( ON ?auto_29147 ?auto_29153 ) ( CLEAR ?auto_29147 ) ( not ( = ?auto_29146 ?auto_29153 ) ) ( not ( = ?auto_29147 ?auto_29153 ) ) ( not ( = ?auto_29145 ?auto_29153 ) ) ( TRUCK-AT ?auto_29152 ?auto_29151 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29146 ?auto_29147 )
      ( MAKE-2CRATE-VERIFY ?auto_29145 ?auto_29146 ?auto_29147 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29154 - SURFACE
      ?auto_29155 - SURFACE
      ?auto_29156 - SURFACE
      ?auto_29157 - SURFACE
    )
    :vars
    (
      ?auto_29159 - HOIST
      ?auto_29162 - PLACE
      ?auto_29158 - PLACE
      ?auto_29161 - HOIST
      ?auto_29160 - SURFACE
      ?auto_29163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29159 ?auto_29162 ) ( SURFACE-AT ?auto_29156 ?auto_29162 ) ( CLEAR ?auto_29156 ) ( IS-CRATE ?auto_29157 ) ( not ( = ?auto_29156 ?auto_29157 ) ) ( AVAILABLE ?auto_29159 ) ( ON ?auto_29156 ?auto_29155 ) ( not ( = ?auto_29155 ?auto_29156 ) ) ( not ( = ?auto_29155 ?auto_29157 ) ) ( not ( = ?auto_29158 ?auto_29162 ) ) ( HOIST-AT ?auto_29161 ?auto_29158 ) ( not ( = ?auto_29159 ?auto_29161 ) ) ( AVAILABLE ?auto_29161 ) ( SURFACE-AT ?auto_29157 ?auto_29158 ) ( ON ?auto_29157 ?auto_29160 ) ( CLEAR ?auto_29157 ) ( not ( = ?auto_29156 ?auto_29160 ) ) ( not ( = ?auto_29157 ?auto_29160 ) ) ( not ( = ?auto_29155 ?auto_29160 ) ) ( TRUCK-AT ?auto_29163 ?auto_29162 ) ( ON ?auto_29155 ?auto_29154 ) ( not ( = ?auto_29154 ?auto_29155 ) ) ( not ( = ?auto_29154 ?auto_29156 ) ) ( not ( = ?auto_29154 ?auto_29157 ) ) ( not ( = ?auto_29154 ?auto_29160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29155 ?auto_29156 ?auto_29157 )
      ( MAKE-3CRATE-VERIFY ?auto_29154 ?auto_29155 ?auto_29156 ?auto_29157 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29164 - SURFACE
      ?auto_29165 - SURFACE
      ?auto_29166 - SURFACE
      ?auto_29167 - SURFACE
      ?auto_29168 - SURFACE
    )
    :vars
    (
      ?auto_29170 - HOIST
      ?auto_29173 - PLACE
      ?auto_29169 - PLACE
      ?auto_29172 - HOIST
      ?auto_29171 - SURFACE
      ?auto_29174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29170 ?auto_29173 ) ( SURFACE-AT ?auto_29167 ?auto_29173 ) ( CLEAR ?auto_29167 ) ( IS-CRATE ?auto_29168 ) ( not ( = ?auto_29167 ?auto_29168 ) ) ( AVAILABLE ?auto_29170 ) ( ON ?auto_29167 ?auto_29166 ) ( not ( = ?auto_29166 ?auto_29167 ) ) ( not ( = ?auto_29166 ?auto_29168 ) ) ( not ( = ?auto_29169 ?auto_29173 ) ) ( HOIST-AT ?auto_29172 ?auto_29169 ) ( not ( = ?auto_29170 ?auto_29172 ) ) ( AVAILABLE ?auto_29172 ) ( SURFACE-AT ?auto_29168 ?auto_29169 ) ( ON ?auto_29168 ?auto_29171 ) ( CLEAR ?auto_29168 ) ( not ( = ?auto_29167 ?auto_29171 ) ) ( not ( = ?auto_29168 ?auto_29171 ) ) ( not ( = ?auto_29166 ?auto_29171 ) ) ( TRUCK-AT ?auto_29174 ?auto_29173 ) ( ON ?auto_29165 ?auto_29164 ) ( ON ?auto_29166 ?auto_29165 ) ( not ( = ?auto_29164 ?auto_29165 ) ) ( not ( = ?auto_29164 ?auto_29166 ) ) ( not ( = ?auto_29164 ?auto_29167 ) ) ( not ( = ?auto_29164 ?auto_29168 ) ) ( not ( = ?auto_29164 ?auto_29171 ) ) ( not ( = ?auto_29165 ?auto_29166 ) ) ( not ( = ?auto_29165 ?auto_29167 ) ) ( not ( = ?auto_29165 ?auto_29168 ) ) ( not ( = ?auto_29165 ?auto_29171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29166 ?auto_29167 ?auto_29168 )
      ( MAKE-4CRATE-VERIFY ?auto_29164 ?auto_29165 ?auto_29166 ?auto_29167 ?auto_29168 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29175 - SURFACE
      ?auto_29176 - SURFACE
    )
    :vars
    (
      ?auto_29178 - HOIST
      ?auto_29182 - PLACE
      ?auto_29179 - SURFACE
      ?auto_29177 - PLACE
      ?auto_29181 - HOIST
      ?auto_29180 - SURFACE
      ?auto_29183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29178 ?auto_29182 ) ( IS-CRATE ?auto_29176 ) ( not ( = ?auto_29175 ?auto_29176 ) ) ( not ( = ?auto_29179 ?auto_29175 ) ) ( not ( = ?auto_29179 ?auto_29176 ) ) ( not ( = ?auto_29177 ?auto_29182 ) ) ( HOIST-AT ?auto_29181 ?auto_29177 ) ( not ( = ?auto_29178 ?auto_29181 ) ) ( AVAILABLE ?auto_29181 ) ( SURFACE-AT ?auto_29176 ?auto_29177 ) ( ON ?auto_29176 ?auto_29180 ) ( CLEAR ?auto_29176 ) ( not ( = ?auto_29175 ?auto_29180 ) ) ( not ( = ?auto_29176 ?auto_29180 ) ) ( not ( = ?auto_29179 ?auto_29180 ) ) ( TRUCK-AT ?auto_29183 ?auto_29182 ) ( SURFACE-AT ?auto_29179 ?auto_29182 ) ( CLEAR ?auto_29179 ) ( LIFTING ?auto_29178 ?auto_29175 ) ( IS-CRATE ?auto_29175 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29179 ?auto_29175 )
      ( MAKE-2CRATE ?auto_29179 ?auto_29175 ?auto_29176 )
      ( MAKE-1CRATE-VERIFY ?auto_29175 ?auto_29176 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29184 - SURFACE
      ?auto_29185 - SURFACE
      ?auto_29186 - SURFACE
    )
    :vars
    (
      ?auto_29190 - HOIST
      ?auto_29192 - PLACE
      ?auto_29188 - PLACE
      ?auto_29187 - HOIST
      ?auto_29189 - SURFACE
      ?auto_29191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29190 ?auto_29192 ) ( IS-CRATE ?auto_29186 ) ( not ( = ?auto_29185 ?auto_29186 ) ) ( not ( = ?auto_29184 ?auto_29185 ) ) ( not ( = ?auto_29184 ?auto_29186 ) ) ( not ( = ?auto_29188 ?auto_29192 ) ) ( HOIST-AT ?auto_29187 ?auto_29188 ) ( not ( = ?auto_29190 ?auto_29187 ) ) ( AVAILABLE ?auto_29187 ) ( SURFACE-AT ?auto_29186 ?auto_29188 ) ( ON ?auto_29186 ?auto_29189 ) ( CLEAR ?auto_29186 ) ( not ( = ?auto_29185 ?auto_29189 ) ) ( not ( = ?auto_29186 ?auto_29189 ) ) ( not ( = ?auto_29184 ?auto_29189 ) ) ( TRUCK-AT ?auto_29191 ?auto_29192 ) ( SURFACE-AT ?auto_29184 ?auto_29192 ) ( CLEAR ?auto_29184 ) ( LIFTING ?auto_29190 ?auto_29185 ) ( IS-CRATE ?auto_29185 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29185 ?auto_29186 )
      ( MAKE-2CRATE-VERIFY ?auto_29184 ?auto_29185 ?auto_29186 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29193 - SURFACE
      ?auto_29194 - SURFACE
      ?auto_29195 - SURFACE
      ?auto_29196 - SURFACE
    )
    :vars
    (
      ?auto_29202 - HOIST
      ?auto_29199 - PLACE
      ?auto_29201 - PLACE
      ?auto_29198 - HOIST
      ?auto_29200 - SURFACE
      ?auto_29197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29202 ?auto_29199 ) ( IS-CRATE ?auto_29196 ) ( not ( = ?auto_29195 ?auto_29196 ) ) ( not ( = ?auto_29194 ?auto_29195 ) ) ( not ( = ?auto_29194 ?auto_29196 ) ) ( not ( = ?auto_29201 ?auto_29199 ) ) ( HOIST-AT ?auto_29198 ?auto_29201 ) ( not ( = ?auto_29202 ?auto_29198 ) ) ( AVAILABLE ?auto_29198 ) ( SURFACE-AT ?auto_29196 ?auto_29201 ) ( ON ?auto_29196 ?auto_29200 ) ( CLEAR ?auto_29196 ) ( not ( = ?auto_29195 ?auto_29200 ) ) ( not ( = ?auto_29196 ?auto_29200 ) ) ( not ( = ?auto_29194 ?auto_29200 ) ) ( TRUCK-AT ?auto_29197 ?auto_29199 ) ( SURFACE-AT ?auto_29194 ?auto_29199 ) ( CLEAR ?auto_29194 ) ( LIFTING ?auto_29202 ?auto_29195 ) ( IS-CRATE ?auto_29195 ) ( ON ?auto_29194 ?auto_29193 ) ( not ( = ?auto_29193 ?auto_29194 ) ) ( not ( = ?auto_29193 ?auto_29195 ) ) ( not ( = ?auto_29193 ?auto_29196 ) ) ( not ( = ?auto_29193 ?auto_29200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29194 ?auto_29195 ?auto_29196 )
      ( MAKE-3CRATE-VERIFY ?auto_29193 ?auto_29194 ?auto_29195 ?auto_29196 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29203 - SURFACE
      ?auto_29204 - SURFACE
      ?auto_29205 - SURFACE
      ?auto_29206 - SURFACE
      ?auto_29207 - SURFACE
    )
    :vars
    (
      ?auto_29213 - HOIST
      ?auto_29210 - PLACE
      ?auto_29212 - PLACE
      ?auto_29209 - HOIST
      ?auto_29211 - SURFACE
      ?auto_29208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29213 ?auto_29210 ) ( IS-CRATE ?auto_29207 ) ( not ( = ?auto_29206 ?auto_29207 ) ) ( not ( = ?auto_29205 ?auto_29206 ) ) ( not ( = ?auto_29205 ?auto_29207 ) ) ( not ( = ?auto_29212 ?auto_29210 ) ) ( HOIST-AT ?auto_29209 ?auto_29212 ) ( not ( = ?auto_29213 ?auto_29209 ) ) ( AVAILABLE ?auto_29209 ) ( SURFACE-AT ?auto_29207 ?auto_29212 ) ( ON ?auto_29207 ?auto_29211 ) ( CLEAR ?auto_29207 ) ( not ( = ?auto_29206 ?auto_29211 ) ) ( not ( = ?auto_29207 ?auto_29211 ) ) ( not ( = ?auto_29205 ?auto_29211 ) ) ( TRUCK-AT ?auto_29208 ?auto_29210 ) ( SURFACE-AT ?auto_29205 ?auto_29210 ) ( CLEAR ?auto_29205 ) ( LIFTING ?auto_29213 ?auto_29206 ) ( IS-CRATE ?auto_29206 ) ( ON ?auto_29204 ?auto_29203 ) ( ON ?auto_29205 ?auto_29204 ) ( not ( = ?auto_29203 ?auto_29204 ) ) ( not ( = ?auto_29203 ?auto_29205 ) ) ( not ( = ?auto_29203 ?auto_29206 ) ) ( not ( = ?auto_29203 ?auto_29207 ) ) ( not ( = ?auto_29203 ?auto_29211 ) ) ( not ( = ?auto_29204 ?auto_29205 ) ) ( not ( = ?auto_29204 ?auto_29206 ) ) ( not ( = ?auto_29204 ?auto_29207 ) ) ( not ( = ?auto_29204 ?auto_29211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29205 ?auto_29206 ?auto_29207 )
      ( MAKE-4CRATE-VERIFY ?auto_29203 ?auto_29204 ?auto_29205 ?auto_29206 ?auto_29207 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29214 - SURFACE
      ?auto_29215 - SURFACE
    )
    :vars
    (
      ?auto_29222 - HOIST
      ?auto_29218 - PLACE
      ?auto_29221 - SURFACE
      ?auto_29220 - PLACE
      ?auto_29217 - HOIST
      ?auto_29219 - SURFACE
      ?auto_29216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29222 ?auto_29218 ) ( IS-CRATE ?auto_29215 ) ( not ( = ?auto_29214 ?auto_29215 ) ) ( not ( = ?auto_29221 ?auto_29214 ) ) ( not ( = ?auto_29221 ?auto_29215 ) ) ( not ( = ?auto_29220 ?auto_29218 ) ) ( HOIST-AT ?auto_29217 ?auto_29220 ) ( not ( = ?auto_29222 ?auto_29217 ) ) ( AVAILABLE ?auto_29217 ) ( SURFACE-AT ?auto_29215 ?auto_29220 ) ( ON ?auto_29215 ?auto_29219 ) ( CLEAR ?auto_29215 ) ( not ( = ?auto_29214 ?auto_29219 ) ) ( not ( = ?auto_29215 ?auto_29219 ) ) ( not ( = ?auto_29221 ?auto_29219 ) ) ( TRUCK-AT ?auto_29216 ?auto_29218 ) ( SURFACE-AT ?auto_29221 ?auto_29218 ) ( CLEAR ?auto_29221 ) ( IS-CRATE ?auto_29214 ) ( AVAILABLE ?auto_29222 ) ( IN ?auto_29214 ?auto_29216 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29222 ?auto_29214 ?auto_29216 ?auto_29218 )
      ( MAKE-2CRATE ?auto_29221 ?auto_29214 ?auto_29215 )
      ( MAKE-1CRATE-VERIFY ?auto_29214 ?auto_29215 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29223 - SURFACE
      ?auto_29224 - SURFACE
      ?auto_29225 - SURFACE
    )
    :vars
    (
      ?auto_29226 - HOIST
      ?auto_29227 - PLACE
      ?auto_29229 - PLACE
      ?auto_29230 - HOIST
      ?auto_29231 - SURFACE
      ?auto_29228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29226 ?auto_29227 ) ( IS-CRATE ?auto_29225 ) ( not ( = ?auto_29224 ?auto_29225 ) ) ( not ( = ?auto_29223 ?auto_29224 ) ) ( not ( = ?auto_29223 ?auto_29225 ) ) ( not ( = ?auto_29229 ?auto_29227 ) ) ( HOIST-AT ?auto_29230 ?auto_29229 ) ( not ( = ?auto_29226 ?auto_29230 ) ) ( AVAILABLE ?auto_29230 ) ( SURFACE-AT ?auto_29225 ?auto_29229 ) ( ON ?auto_29225 ?auto_29231 ) ( CLEAR ?auto_29225 ) ( not ( = ?auto_29224 ?auto_29231 ) ) ( not ( = ?auto_29225 ?auto_29231 ) ) ( not ( = ?auto_29223 ?auto_29231 ) ) ( TRUCK-AT ?auto_29228 ?auto_29227 ) ( SURFACE-AT ?auto_29223 ?auto_29227 ) ( CLEAR ?auto_29223 ) ( IS-CRATE ?auto_29224 ) ( AVAILABLE ?auto_29226 ) ( IN ?auto_29224 ?auto_29228 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29224 ?auto_29225 )
      ( MAKE-2CRATE-VERIFY ?auto_29223 ?auto_29224 ?auto_29225 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29232 - SURFACE
      ?auto_29233 - SURFACE
      ?auto_29234 - SURFACE
      ?auto_29235 - SURFACE
    )
    :vars
    (
      ?auto_29236 - HOIST
      ?auto_29237 - PLACE
      ?auto_29241 - PLACE
      ?auto_29240 - HOIST
      ?auto_29238 - SURFACE
      ?auto_29239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29236 ?auto_29237 ) ( IS-CRATE ?auto_29235 ) ( not ( = ?auto_29234 ?auto_29235 ) ) ( not ( = ?auto_29233 ?auto_29234 ) ) ( not ( = ?auto_29233 ?auto_29235 ) ) ( not ( = ?auto_29241 ?auto_29237 ) ) ( HOIST-AT ?auto_29240 ?auto_29241 ) ( not ( = ?auto_29236 ?auto_29240 ) ) ( AVAILABLE ?auto_29240 ) ( SURFACE-AT ?auto_29235 ?auto_29241 ) ( ON ?auto_29235 ?auto_29238 ) ( CLEAR ?auto_29235 ) ( not ( = ?auto_29234 ?auto_29238 ) ) ( not ( = ?auto_29235 ?auto_29238 ) ) ( not ( = ?auto_29233 ?auto_29238 ) ) ( TRUCK-AT ?auto_29239 ?auto_29237 ) ( SURFACE-AT ?auto_29233 ?auto_29237 ) ( CLEAR ?auto_29233 ) ( IS-CRATE ?auto_29234 ) ( AVAILABLE ?auto_29236 ) ( IN ?auto_29234 ?auto_29239 ) ( ON ?auto_29233 ?auto_29232 ) ( not ( = ?auto_29232 ?auto_29233 ) ) ( not ( = ?auto_29232 ?auto_29234 ) ) ( not ( = ?auto_29232 ?auto_29235 ) ) ( not ( = ?auto_29232 ?auto_29238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29233 ?auto_29234 ?auto_29235 )
      ( MAKE-3CRATE-VERIFY ?auto_29232 ?auto_29233 ?auto_29234 ?auto_29235 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29242 - SURFACE
      ?auto_29243 - SURFACE
      ?auto_29244 - SURFACE
      ?auto_29245 - SURFACE
      ?auto_29246 - SURFACE
    )
    :vars
    (
      ?auto_29247 - HOIST
      ?auto_29248 - PLACE
      ?auto_29252 - PLACE
      ?auto_29251 - HOIST
      ?auto_29249 - SURFACE
      ?auto_29250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29247 ?auto_29248 ) ( IS-CRATE ?auto_29246 ) ( not ( = ?auto_29245 ?auto_29246 ) ) ( not ( = ?auto_29244 ?auto_29245 ) ) ( not ( = ?auto_29244 ?auto_29246 ) ) ( not ( = ?auto_29252 ?auto_29248 ) ) ( HOIST-AT ?auto_29251 ?auto_29252 ) ( not ( = ?auto_29247 ?auto_29251 ) ) ( AVAILABLE ?auto_29251 ) ( SURFACE-AT ?auto_29246 ?auto_29252 ) ( ON ?auto_29246 ?auto_29249 ) ( CLEAR ?auto_29246 ) ( not ( = ?auto_29245 ?auto_29249 ) ) ( not ( = ?auto_29246 ?auto_29249 ) ) ( not ( = ?auto_29244 ?auto_29249 ) ) ( TRUCK-AT ?auto_29250 ?auto_29248 ) ( SURFACE-AT ?auto_29244 ?auto_29248 ) ( CLEAR ?auto_29244 ) ( IS-CRATE ?auto_29245 ) ( AVAILABLE ?auto_29247 ) ( IN ?auto_29245 ?auto_29250 ) ( ON ?auto_29243 ?auto_29242 ) ( ON ?auto_29244 ?auto_29243 ) ( not ( = ?auto_29242 ?auto_29243 ) ) ( not ( = ?auto_29242 ?auto_29244 ) ) ( not ( = ?auto_29242 ?auto_29245 ) ) ( not ( = ?auto_29242 ?auto_29246 ) ) ( not ( = ?auto_29242 ?auto_29249 ) ) ( not ( = ?auto_29243 ?auto_29244 ) ) ( not ( = ?auto_29243 ?auto_29245 ) ) ( not ( = ?auto_29243 ?auto_29246 ) ) ( not ( = ?auto_29243 ?auto_29249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29244 ?auto_29245 ?auto_29246 )
      ( MAKE-4CRATE-VERIFY ?auto_29242 ?auto_29243 ?auto_29244 ?auto_29245 ?auto_29246 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29253 - SURFACE
      ?auto_29254 - SURFACE
    )
    :vars
    (
      ?auto_29255 - HOIST
      ?auto_29256 - PLACE
      ?auto_29260 - SURFACE
      ?auto_29261 - PLACE
      ?auto_29259 - HOIST
      ?auto_29257 - SURFACE
      ?auto_29258 - TRUCK
      ?auto_29262 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29255 ?auto_29256 ) ( IS-CRATE ?auto_29254 ) ( not ( = ?auto_29253 ?auto_29254 ) ) ( not ( = ?auto_29260 ?auto_29253 ) ) ( not ( = ?auto_29260 ?auto_29254 ) ) ( not ( = ?auto_29261 ?auto_29256 ) ) ( HOIST-AT ?auto_29259 ?auto_29261 ) ( not ( = ?auto_29255 ?auto_29259 ) ) ( AVAILABLE ?auto_29259 ) ( SURFACE-AT ?auto_29254 ?auto_29261 ) ( ON ?auto_29254 ?auto_29257 ) ( CLEAR ?auto_29254 ) ( not ( = ?auto_29253 ?auto_29257 ) ) ( not ( = ?auto_29254 ?auto_29257 ) ) ( not ( = ?auto_29260 ?auto_29257 ) ) ( SURFACE-AT ?auto_29260 ?auto_29256 ) ( CLEAR ?auto_29260 ) ( IS-CRATE ?auto_29253 ) ( AVAILABLE ?auto_29255 ) ( IN ?auto_29253 ?auto_29258 ) ( TRUCK-AT ?auto_29258 ?auto_29262 ) ( not ( = ?auto_29262 ?auto_29256 ) ) ( not ( = ?auto_29261 ?auto_29262 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29258 ?auto_29262 ?auto_29256 )
      ( MAKE-2CRATE ?auto_29260 ?auto_29253 ?auto_29254 )
      ( MAKE-1CRATE-VERIFY ?auto_29253 ?auto_29254 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29263 - SURFACE
      ?auto_29264 - SURFACE
      ?auto_29265 - SURFACE
    )
    :vars
    (
      ?auto_29267 - HOIST
      ?auto_29268 - PLACE
      ?auto_29271 - PLACE
      ?auto_29272 - HOIST
      ?auto_29270 - SURFACE
      ?auto_29269 - TRUCK
      ?auto_29266 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29267 ?auto_29268 ) ( IS-CRATE ?auto_29265 ) ( not ( = ?auto_29264 ?auto_29265 ) ) ( not ( = ?auto_29263 ?auto_29264 ) ) ( not ( = ?auto_29263 ?auto_29265 ) ) ( not ( = ?auto_29271 ?auto_29268 ) ) ( HOIST-AT ?auto_29272 ?auto_29271 ) ( not ( = ?auto_29267 ?auto_29272 ) ) ( AVAILABLE ?auto_29272 ) ( SURFACE-AT ?auto_29265 ?auto_29271 ) ( ON ?auto_29265 ?auto_29270 ) ( CLEAR ?auto_29265 ) ( not ( = ?auto_29264 ?auto_29270 ) ) ( not ( = ?auto_29265 ?auto_29270 ) ) ( not ( = ?auto_29263 ?auto_29270 ) ) ( SURFACE-AT ?auto_29263 ?auto_29268 ) ( CLEAR ?auto_29263 ) ( IS-CRATE ?auto_29264 ) ( AVAILABLE ?auto_29267 ) ( IN ?auto_29264 ?auto_29269 ) ( TRUCK-AT ?auto_29269 ?auto_29266 ) ( not ( = ?auto_29266 ?auto_29268 ) ) ( not ( = ?auto_29271 ?auto_29266 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29264 ?auto_29265 )
      ( MAKE-2CRATE-VERIFY ?auto_29263 ?auto_29264 ?auto_29265 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29273 - SURFACE
      ?auto_29274 - SURFACE
      ?auto_29275 - SURFACE
      ?auto_29276 - SURFACE
    )
    :vars
    (
      ?auto_29280 - HOIST
      ?auto_29282 - PLACE
      ?auto_29283 - PLACE
      ?auto_29278 - HOIST
      ?auto_29277 - SURFACE
      ?auto_29279 - TRUCK
      ?auto_29281 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29280 ?auto_29282 ) ( IS-CRATE ?auto_29276 ) ( not ( = ?auto_29275 ?auto_29276 ) ) ( not ( = ?auto_29274 ?auto_29275 ) ) ( not ( = ?auto_29274 ?auto_29276 ) ) ( not ( = ?auto_29283 ?auto_29282 ) ) ( HOIST-AT ?auto_29278 ?auto_29283 ) ( not ( = ?auto_29280 ?auto_29278 ) ) ( AVAILABLE ?auto_29278 ) ( SURFACE-AT ?auto_29276 ?auto_29283 ) ( ON ?auto_29276 ?auto_29277 ) ( CLEAR ?auto_29276 ) ( not ( = ?auto_29275 ?auto_29277 ) ) ( not ( = ?auto_29276 ?auto_29277 ) ) ( not ( = ?auto_29274 ?auto_29277 ) ) ( SURFACE-AT ?auto_29274 ?auto_29282 ) ( CLEAR ?auto_29274 ) ( IS-CRATE ?auto_29275 ) ( AVAILABLE ?auto_29280 ) ( IN ?auto_29275 ?auto_29279 ) ( TRUCK-AT ?auto_29279 ?auto_29281 ) ( not ( = ?auto_29281 ?auto_29282 ) ) ( not ( = ?auto_29283 ?auto_29281 ) ) ( ON ?auto_29274 ?auto_29273 ) ( not ( = ?auto_29273 ?auto_29274 ) ) ( not ( = ?auto_29273 ?auto_29275 ) ) ( not ( = ?auto_29273 ?auto_29276 ) ) ( not ( = ?auto_29273 ?auto_29277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29274 ?auto_29275 ?auto_29276 )
      ( MAKE-3CRATE-VERIFY ?auto_29273 ?auto_29274 ?auto_29275 ?auto_29276 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29284 - SURFACE
      ?auto_29285 - SURFACE
      ?auto_29286 - SURFACE
      ?auto_29287 - SURFACE
      ?auto_29288 - SURFACE
    )
    :vars
    (
      ?auto_29292 - HOIST
      ?auto_29294 - PLACE
      ?auto_29295 - PLACE
      ?auto_29290 - HOIST
      ?auto_29289 - SURFACE
      ?auto_29291 - TRUCK
      ?auto_29293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29292 ?auto_29294 ) ( IS-CRATE ?auto_29288 ) ( not ( = ?auto_29287 ?auto_29288 ) ) ( not ( = ?auto_29286 ?auto_29287 ) ) ( not ( = ?auto_29286 ?auto_29288 ) ) ( not ( = ?auto_29295 ?auto_29294 ) ) ( HOIST-AT ?auto_29290 ?auto_29295 ) ( not ( = ?auto_29292 ?auto_29290 ) ) ( AVAILABLE ?auto_29290 ) ( SURFACE-AT ?auto_29288 ?auto_29295 ) ( ON ?auto_29288 ?auto_29289 ) ( CLEAR ?auto_29288 ) ( not ( = ?auto_29287 ?auto_29289 ) ) ( not ( = ?auto_29288 ?auto_29289 ) ) ( not ( = ?auto_29286 ?auto_29289 ) ) ( SURFACE-AT ?auto_29286 ?auto_29294 ) ( CLEAR ?auto_29286 ) ( IS-CRATE ?auto_29287 ) ( AVAILABLE ?auto_29292 ) ( IN ?auto_29287 ?auto_29291 ) ( TRUCK-AT ?auto_29291 ?auto_29293 ) ( not ( = ?auto_29293 ?auto_29294 ) ) ( not ( = ?auto_29295 ?auto_29293 ) ) ( ON ?auto_29285 ?auto_29284 ) ( ON ?auto_29286 ?auto_29285 ) ( not ( = ?auto_29284 ?auto_29285 ) ) ( not ( = ?auto_29284 ?auto_29286 ) ) ( not ( = ?auto_29284 ?auto_29287 ) ) ( not ( = ?auto_29284 ?auto_29288 ) ) ( not ( = ?auto_29284 ?auto_29289 ) ) ( not ( = ?auto_29285 ?auto_29286 ) ) ( not ( = ?auto_29285 ?auto_29287 ) ) ( not ( = ?auto_29285 ?auto_29288 ) ) ( not ( = ?auto_29285 ?auto_29289 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29286 ?auto_29287 ?auto_29288 )
      ( MAKE-4CRATE-VERIFY ?auto_29284 ?auto_29285 ?auto_29286 ?auto_29287 ?auto_29288 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29296 - SURFACE
      ?auto_29297 - SURFACE
    )
    :vars
    (
      ?auto_29302 - HOIST
      ?auto_29304 - PLACE
      ?auto_29300 - SURFACE
      ?auto_29305 - PLACE
      ?auto_29299 - HOIST
      ?auto_29298 - SURFACE
      ?auto_29301 - TRUCK
      ?auto_29303 - PLACE
      ?auto_29306 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29302 ?auto_29304 ) ( IS-CRATE ?auto_29297 ) ( not ( = ?auto_29296 ?auto_29297 ) ) ( not ( = ?auto_29300 ?auto_29296 ) ) ( not ( = ?auto_29300 ?auto_29297 ) ) ( not ( = ?auto_29305 ?auto_29304 ) ) ( HOIST-AT ?auto_29299 ?auto_29305 ) ( not ( = ?auto_29302 ?auto_29299 ) ) ( AVAILABLE ?auto_29299 ) ( SURFACE-AT ?auto_29297 ?auto_29305 ) ( ON ?auto_29297 ?auto_29298 ) ( CLEAR ?auto_29297 ) ( not ( = ?auto_29296 ?auto_29298 ) ) ( not ( = ?auto_29297 ?auto_29298 ) ) ( not ( = ?auto_29300 ?auto_29298 ) ) ( SURFACE-AT ?auto_29300 ?auto_29304 ) ( CLEAR ?auto_29300 ) ( IS-CRATE ?auto_29296 ) ( AVAILABLE ?auto_29302 ) ( TRUCK-AT ?auto_29301 ?auto_29303 ) ( not ( = ?auto_29303 ?auto_29304 ) ) ( not ( = ?auto_29305 ?auto_29303 ) ) ( HOIST-AT ?auto_29306 ?auto_29303 ) ( LIFTING ?auto_29306 ?auto_29296 ) ( not ( = ?auto_29302 ?auto_29306 ) ) ( not ( = ?auto_29299 ?auto_29306 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29306 ?auto_29296 ?auto_29301 ?auto_29303 )
      ( MAKE-2CRATE ?auto_29300 ?auto_29296 ?auto_29297 )
      ( MAKE-1CRATE-VERIFY ?auto_29296 ?auto_29297 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29307 - SURFACE
      ?auto_29308 - SURFACE
      ?auto_29309 - SURFACE
    )
    :vars
    (
      ?auto_29310 - HOIST
      ?auto_29315 - PLACE
      ?auto_29316 - PLACE
      ?auto_29313 - HOIST
      ?auto_29312 - SURFACE
      ?auto_29317 - TRUCK
      ?auto_29311 - PLACE
      ?auto_29314 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29310 ?auto_29315 ) ( IS-CRATE ?auto_29309 ) ( not ( = ?auto_29308 ?auto_29309 ) ) ( not ( = ?auto_29307 ?auto_29308 ) ) ( not ( = ?auto_29307 ?auto_29309 ) ) ( not ( = ?auto_29316 ?auto_29315 ) ) ( HOIST-AT ?auto_29313 ?auto_29316 ) ( not ( = ?auto_29310 ?auto_29313 ) ) ( AVAILABLE ?auto_29313 ) ( SURFACE-AT ?auto_29309 ?auto_29316 ) ( ON ?auto_29309 ?auto_29312 ) ( CLEAR ?auto_29309 ) ( not ( = ?auto_29308 ?auto_29312 ) ) ( not ( = ?auto_29309 ?auto_29312 ) ) ( not ( = ?auto_29307 ?auto_29312 ) ) ( SURFACE-AT ?auto_29307 ?auto_29315 ) ( CLEAR ?auto_29307 ) ( IS-CRATE ?auto_29308 ) ( AVAILABLE ?auto_29310 ) ( TRUCK-AT ?auto_29317 ?auto_29311 ) ( not ( = ?auto_29311 ?auto_29315 ) ) ( not ( = ?auto_29316 ?auto_29311 ) ) ( HOIST-AT ?auto_29314 ?auto_29311 ) ( LIFTING ?auto_29314 ?auto_29308 ) ( not ( = ?auto_29310 ?auto_29314 ) ) ( not ( = ?auto_29313 ?auto_29314 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29308 ?auto_29309 )
      ( MAKE-2CRATE-VERIFY ?auto_29307 ?auto_29308 ?auto_29309 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29318 - SURFACE
      ?auto_29319 - SURFACE
      ?auto_29320 - SURFACE
      ?auto_29321 - SURFACE
    )
    :vars
    (
      ?auto_29323 - HOIST
      ?auto_29326 - PLACE
      ?auto_29328 - PLACE
      ?auto_29329 - HOIST
      ?auto_29322 - SURFACE
      ?auto_29327 - TRUCK
      ?auto_29325 - PLACE
      ?auto_29324 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29323 ?auto_29326 ) ( IS-CRATE ?auto_29321 ) ( not ( = ?auto_29320 ?auto_29321 ) ) ( not ( = ?auto_29319 ?auto_29320 ) ) ( not ( = ?auto_29319 ?auto_29321 ) ) ( not ( = ?auto_29328 ?auto_29326 ) ) ( HOIST-AT ?auto_29329 ?auto_29328 ) ( not ( = ?auto_29323 ?auto_29329 ) ) ( AVAILABLE ?auto_29329 ) ( SURFACE-AT ?auto_29321 ?auto_29328 ) ( ON ?auto_29321 ?auto_29322 ) ( CLEAR ?auto_29321 ) ( not ( = ?auto_29320 ?auto_29322 ) ) ( not ( = ?auto_29321 ?auto_29322 ) ) ( not ( = ?auto_29319 ?auto_29322 ) ) ( SURFACE-AT ?auto_29319 ?auto_29326 ) ( CLEAR ?auto_29319 ) ( IS-CRATE ?auto_29320 ) ( AVAILABLE ?auto_29323 ) ( TRUCK-AT ?auto_29327 ?auto_29325 ) ( not ( = ?auto_29325 ?auto_29326 ) ) ( not ( = ?auto_29328 ?auto_29325 ) ) ( HOIST-AT ?auto_29324 ?auto_29325 ) ( LIFTING ?auto_29324 ?auto_29320 ) ( not ( = ?auto_29323 ?auto_29324 ) ) ( not ( = ?auto_29329 ?auto_29324 ) ) ( ON ?auto_29319 ?auto_29318 ) ( not ( = ?auto_29318 ?auto_29319 ) ) ( not ( = ?auto_29318 ?auto_29320 ) ) ( not ( = ?auto_29318 ?auto_29321 ) ) ( not ( = ?auto_29318 ?auto_29322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29319 ?auto_29320 ?auto_29321 )
      ( MAKE-3CRATE-VERIFY ?auto_29318 ?auto_29319 ?auto_29320 ?auto_29321 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29330 - SURFACE
      ?auto_29331 - SURFACE
      ?auto_29332 - SURFACE
      ?auto_29333 - SURFACE
      ?auto_29334 - SURFACE
    )
    :vars
    (
      ?auto_29336 - HOIST
      ?auto_29339 - PLACE
      ?auto_29341 - PLACE
      ?auto_29342 - HOIST
      ?auto_29335 - SURFACE
      ?auto_29340 - TRUCK
      ?auto_29338 - PLACE
      ?auto_29337 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29336 ?auto_29339 ) ( IS-CRATE ?auto_29334 ) ( not ( = ?auto_29333 ?auto_29334 ) ) ( not ( = ?auto_29332 ?auto_29333 ) ) ( not ( = ?auto_29332 ?auto_29334 ) ) ( not ( = ?auto_29341 ?auto_29339 ) ) ( HOIST-AT ?auto_29342 ?auto_29341 ) ( not ( = ?auto_29336 ?auto_29342 ) ) ( AVAILABLE ?auto_29342 ) ( SURFACE-AT ?auto_29334 ?auto_29341 ) ( ON ?auto_29334 ?auto_29335 ) ( CLEAR ?auto_29334 ) ( not ( = ?auto_29333 ?auto_29335 ) ) ( not ( = ?auto_29334 ?auto_29335 ) ) ( not ( = ?auto_29332 ?auto_29335 ) ) ( SURFACE-AT ?auto_29332 ?auto_29339 ) ( CLEAR ?auto_29332 ) ( IS-CRATE ?auto_29333 ) ( AVAILABLE ?auto_29336 ) ( TRUCK-AT ?auto_29340 ?auto_29338 ) ( not ( = ?auto_29338 ?auto_29339 ) ) ( not ( = ?auto_29341 ?auto_29338 ) ) ( HOIST-AT ?auto_29337 ?auto_29338 ) ( LIFTING ?auto_29337 ?auto_29333 ) ( not ( = ?auto_29336 ?auto_29337 ) ) ( not ( = ?auto_29342 ?auto_29337 ) ) ( ON ?auto_29331 ?auto_29330 ) ( ON ?auto_29332 ?auto_29331 ) ( not ( = ?auto_29330 ?auto_29331 ) ) ( not ( = ?auto_29330 ?auto_29332 ) ) ( not ( = ?auto_29330 ?auto_29333 ) ) ( not ( = ?auto_29330 ?auto_29334 ) ) ( not ( = ?auto_29330 ?auto_29335 ) ) ( not ( = ?auto_29331 ?auto_29332 ) ) ( not ( = ?auto_29331 ?auto_29333 ) ) ( not ( = ?auto_29331 ?auto_29334 ) ) ( not ( = ?auto_29331 ?auto_29335 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29332 ?auto_29333 ?auto_29334 )
      ( MAKE-4CRATE-VERIFY ?auto_29330 ?auto_29331 ?auto_29332 ?auto_29333 ?auto_29334 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29343 - SURFACE
      ?auto_29344 - SURFACE
    )
    :vars
    (
      ?auto_29347 - HOIST
      ?auto_29350 - PLACE
      ?auto_29346 - SURFACE
      ?auto_29352 - PLACE
      ?auto_29353 - HOIST
      ?auto_29345 - SURFACE
      ?auto_29351 - TRUCK
      ?auto_29349 - PLACE
      ?auto_29348 - HOIST
      ?auto_29354 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29347 ?auto_29350 ) ( IS-CRATE ?auto_29344 ) ( not ( = ?auto_29343 ?auto_29344 ) ) ( not ( = ?auto_29346 ?auto_29343 ) ) ( not ( = ?auto_29346 ?auto_29344 ) ) ( not ( = ?auto_29352 ?auto_29350 ) ) ( HOIST-AT ?auto_29353 ?auto_29352 ) ( not ( = ?auto_29347 ?auto_29353 ) ) ( AVAILABLE ?auto_29353 ) ( SURFACE-AT ?auto_29344 ?auto_29352 ) ( ON ?auto_29344 ?auto_29345 ) ( CLEAR ?auto_29344 ) ( not ( = ?auto_29343 ?auto_29345 ) ) ( not ( = ?auto_29344 ?auto_29345 ) ) ( not ( = ?auto_29346 ?auto_29345 ) ) ( SURFACE-AT ?auto_29346 ?auto_29350 ) ( CLEAR ?auto_29346 ) ( IS-CRATE ?auto_29343 ) ( AVAILABLE ?auto_29347 ) ( TRUCK-AT ?auto_29351 ?auto_29349 ) ( not ( = ?auto_29349 ?auto_29350 ) ) ( not ( = ?auto_29352 ?auto_29349 ) ) ( HOIST-AT ?auto_29348 ?auto_29349 ) ( not ( = ?auto_29347 ?auto_29348 ) ) ( not ( = ?auto_29353 ?auto_29348 ) ) ( AVAILABLE ?auto_29348 ) ( SURFACE-AT ?auto_29343 ?auto_29349 ) ( ON ?auto_29343 ?auto_29354 ) ( CLEAR ?auto_29343 ) ( not ( = ?auto_29343 ?auto_29354 ) ) ( not ( = ?auto_29344 ?auto_29354 ) ) ( not ( = ?auto_29346 ?auto_29354 ) ) ( not ( = ?auto_29345 ?auto_29354 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29348 ?auto_29343 ?auto_29354 ?auto_29349 )
      ( MAKE-2CRATE ?auto_29346 ?auto_29343 ?auto_29344 )
      ( MAKE-1CRATE-VERIFY ?auto_29343 ?auto_29344 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29355 - SURFACE
      ?auto_29356 - SURFACE
      ?auto_29357 - SURFACE
    )
    :vars
    (
      ?auto_29364 - HOIST
      ?auto_29358 - PLACE
      ?auto_29366 - PLACE
      ?auto_29360 - HOIST
      ?auto_29361 - SURFACE
      ?auto_29359 - TRUCK
      ?auto_29365 - PLACE
      ?auto_29362 - HOIST
      ?auto_29363 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29364 ?auto_29358 ) ( IS-CRATE ?auto_29357 ) ( not ( = ?auto_29356 ?auto_29357 ) ) ( not ( = ?auto_29355 ?auto_29356 ) ) ( not ( = ?auto_29355 ?auto_29357 ) ) ( not ( = ?auto_29366 ?auto_29358 ) ) ( HOIST-AT ?auto_29360 ?auto_29366 ) ( not ( = ?auto_29364 ?auto_29360 ) ) ( AVAILABLE ?auto_29360 ) ( SURFACE-AT ?auto_29357 ?auto_29366 ) ( ON ?auto_29357 ?auto_29361 ) ( CLEAR ?auto_29357 ) ( not ( = ?auto_29356 ?auto_29361 ) ) ( not ( = ?auto_29357 ?auto_29361 ) ) ( not ( = ?auto_29355 ?auto_29361 ) ) ( SURFACE-AT ?auto_29355 ?auto_29358 ) ( CLEAR ?auto_29355 ) ( IS-CRATE ?auto_29356 ) ( AVAILABLE ?auto_29364 ) ( TRUCK-AT ?auto_29359 ?auto_29365 ) ( not ( = ?auto_29365 ?auto_29358 ) ) ( not ( = ?auto_29366 ?auto_29365 ) ) ( HOIST-AT ?auto_29362 ?auto_29365 ) ( not ( = ?auto_29364 ?auto_29362 ) ) ( not ( = ?auto_29360 ?auto_29362 ) ) ( AVAILABLE ?auto_29362 ) ( SURFACE-AT ?auto_29356 ?auto_29365 ) ( ON ?auto_29356 ?auto_29363 ) ( CLEAR ?auto_29356 ) ( not ( = ?auto_29356 ?auto_29363 ) ) ( not ( = ?auto_29357 ?auto_29363 ) ) ( not ( = ?auto_29355 ?auto_29363 ) ) ( not ( = ?auto_29361 ?auto_29363 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29356 ?auto_29357 )
      ( MAKE-2CRATE-VERIFY ?auto_29355 ?auto_29356 ?auto_29357 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29367 - SURFACE
      ?auto_29368 - SURFACE
      ?auto_29369 - SURFACE
      ?auto_29370 - SURFACE
    )
    :vars
    (
      ?auto_29376 - HOIST
      ?auto_29372 - PLACE
      ?auto_29374 - PLACE
      ?auto_29379 - HOIST
      ?auto_29371 - SURFACE
      ?auto_29378 - TRUCK
      ?auto_29375 - PLACE
      ?auto_29377 - HOIST
      ?auto_29373 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29376 ?auto_29372 ) ( IS-CRATE ?auto_29370 ) ( not ( = ?auto_29369 ?auto_29370 ) ) ( not ( = ?auto_29368 ?auto_29369 ) ) ( not ( = ?auto_29368 ?auto_29370 ) ) ( not ( = ?auto_29374 ?auto_29372 ) ) ( HOIST-AT ?auto_29379 ?auto_29374 ) ( not ( = ?auto_29376 ?auto_29379 ) ) ( AVAILABLE ?auto_29379 ) ( SURFACE-AT ?auto_29370 ?auto_29374 ) ( ON ?auto_29370 ?auto_29371 ) ( CLEAR ?auto_29370 ) ( not ( = ?auto_29369 ?auto_29371 ) ) ( not ( = ?auto_29370 ?auto_29371 ) ) ( not ( = ?auto_29368 ?auto_29371 ) ) ( SURFACE-AT ?auto_29368 ?auto_29372 ) ( CLEAR ?auto_29368 ) ( IS-CRATE ?auto_29369 ) ( AVAILABLE ?auto_29376 ) ( TRUCK-AT ?auto_29378 ?auto_29375 ) ( not ( = ?auto_29375 ?auto_29372 ) ) ( not ( = ?auto_29374 ?auto_29375 ) ) ( HOIST-AT ?auto_29377 ?auto_29375 ) ( not ( = ?auto_29376 ?auto_29377 ) ) ( not ( = ?auto_29379 ?auto_29377 ) ) ( AVAILABLE ?auto_29377 ) ( SURFACE-AT ?auto_29369 ?auto_29375 ) ( ON ?auto_29369 ?auto_29373 ) ( CLEAR ?auto_29369 ) ( not ( = ?auto_29369 ?auto_29373 ) ) ( not ( = ?auto_29370 ?auto_29373 ) ) ( not ( = ?auto_29368 ?auto_29373 ) ) ( not ( = ?auto_29371 ?auto_29373 ) ) ( ON ?auto_29368 ?auto_29367 ) ( not ( = ?auto_29367 ?auto_29368 ) ) ( not ( = ?auto_29367 ?auto_29369 ) ) ( not ( = ?auto_29367 ?auto_29370 ) ) ( not ( = ?auto_29367 ?auto_29371 ) ) ( not ( = ?auto_29367 ?auto_29373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29368 ?auto_29369 ?auto_29370 )
      ( MAKE-3CRATE-VERIFY ?auto_29367 ?auto_29368 ?auto_29369 ?auto_29370 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29380 - SURFACE
      ?auto_29381 - SURFACE
      ?auto_29382 - SURFACE
      ?auto_29383 - SURFACE
      ?auto_29384 - SURFACE
    )
    :vars
    (
      ?auto_29390 - HOIST
      ?auto_29386 - PLACE
      ?auto_29388 - PLACE
      ?auto_29393 - HOIST
      ?auto_29385 - SURFACE
      ?auto_29392 - TRUCK
      ?auto_29389 - PLACE
      ?auto_29391 - HOIST
      ?auto_29387 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29390 ?auto_29386 ) ( IS-CRATE ?auto_29384 ) ( not ( = ?auto_29383 ?auto_29384 ) ) ( not ( = ?auto_29382 ?auto_29383 ) ) ( not ( = ?auto_29382 ?auto_29384 ) ) ( not ( = ?auto_29388 ?auto_29386 ) ) ( HOIST-AT ?auto_29393 ?auto_29388 ) ( not ( = ?auto_29390 ?auto_29393 ) ) ( AVAILABLE ?auto_29393 ) ( SURFACE-AT ?auto_29384 ?auto_29388 ) ( ON ?auto_29384 ?auto_29385 ) ( CLEAR ?auto_29384 ) ( not ( = ?auto_29383 ?auto_29385 ) ) ( not ( = ?auto_29384 ?auto_29385 ) ) ( not ( = ?auto_29382 ?auto_29385 ) ) ( SURFACE-AT ?auto_29382 ?auto_29386 ) ( CLEAR ?auto_29382 ) ( IS-CRATE ?auto_29383 ) ( AVAILABLE ?auto_29390 ) ( TRUCK-AT ?auto_29392 ?auto_29389 ) ( not ( = ?auto_29389 ?auto_29386 ) ) ( not ( = ?auto_29388 ?auto_29389 ) ) ( HOIST-AT ?auto_29391 ?auto_29389 ) ( not ( = ?auto_29390 ?auto_29391 ) ) ( not ( = ?auto_29393 ?auto_29391 ) ) ( AVAILABLE ?auto_29391 ) ( SURFACE-AT ?auto_29383 ?auto_29389 ) ( ON ?auto_29383 ?auto_29387 ) ( CLEAR ?auto_29383 ) ( not ( = ?auto_29383 ?auto_29387 ) ) ( not ( = ?auto_29384 ?auto_29387 ) ) ( not ( = ?auto_29382 ?auto_29387 ) ) ( not ( = ?auto_29385 ?auto_29387 ) ) ( ON ?auto_29381 ?auto_29380 ) ( ON ?auto_29382 ?auto_29381 ) ( not ( = ?auto_29380 ?auto_29381 ) ) ( not ( = ?auto_29380 ?auto_29382 ) ) ( not ( = ?auto_29380 ?auto_29383 ) ) ( not ( = ?auto_29380 ?auto_29384 ) ) ( not ( = ?auto_29380 ?auto_29385 ) ) ( not ( = ?auto_29380 ?auto_29387 ) ) ( not ( = ?auto_29381 ?auto_29382 ) ) ( not ( = ?auto_29381 ?auto_29383 ) ) ( not ( = ?auto_29381 ?auto_29384 ) ) ( not ( = ?auto_29381 ?auto_29385 ) ) ( not ( = ?auto_29381 ?auto_29387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29382 ?auto_29383 ?auto_29384 )
      ( MAKE-4CRATE-VERIFY ?auto_29380 ?auto_29381 ?auto_29382 ?auto_29383 ?auto_29384 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29394 - SURFACE
      ?auto_29395 - SURFACE
    )
    :vars
    (
      ?auto_29402 - HOIST
      ?auto_29398 - PLACE
      ?auto_29396 - SURFACE
      ?auto_29400 - PLACE
      ?auto_29405 - HOIST
      ?auto_29397 - SURFACE
      ?auto_29401 - PLACE
      ?auto_29403 - HOIST
      ?auto_29399 - SURFACE
      ?auto_29404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29402 ?auto_29398 ) ( IS-CRATE ?auto_29395 ) ( not ( = ?auto_29394 ?auto_29395 ) ) ( not ( = ?auto_29396 ?auto_29394 ) ) ( not ( = ?auto_29396 ?auto_29395 ) ) ( not ( = ?auto_29400 ?auto_29398 ) ) ( HOIST-AT ?auto_29405 ?auto_29400 ) ( not ( = ?auto_29402 ?auto_29405 ) ) ( AVAILABLE ?auto_29405 ) ( SURFACE-AT ?auto_29395 ?auto_29400 ) ( ON ?auto_29395 ?auto_29397 ) ( CLEAR ?auto_29395 ) ( not ( = ?auto_29394 ?auto_29397 ) ) ( not ( = ?auto_29395 ?auto_29397 ) ) ( not ( = ?auto_29396 ?auto_29397 ) ) ( SURFACE-AT ?auto_29396 ?auto_29398 ) ( CLEAR ?auto_29396 ) ( IS-CRATE ?auto_29394 ) ( AVAILABLE ?auto_29402 ) ( not ( = ?auto_29401 ?auto_29398 ) ) ( not ( = ?auto_29400 ?auto_29401 ) ) ( HOIST-AT ?auto_29403 ?auto_29401 ) ( not ( = ?auto_29402 ?auto_29403 ) ) ( not ( = ?auto_29405 ?auto_29403 ) ) ( AVAILABLE ?auto_29403 ) ( SURFACE-AT ?auto_29394 ?auto_29401 ) ( ON ?auto_29394 ?auto_29399 ) ( CLEAR ?auto_29394 ) ( not ( = ?auto_29394 ?auto_29399 ) ) ( not ( = ?auto_29395 ?auto_29399 ) ) ( not ( = ?auto_29396 ?auto_29399 ) ) ( not ( = ?auto_29397 ?auto_29399 ) ) ( TRUCK-AT ?auto_29404 ?auto_29398 ) )
    :subtasks
    ( ( !DRIVE ?auto_29404 ?auto_29398 ?auto_29401 )
      ( MAKE-2CRATE ?auto_29396 ?auto_29394 ?auto_29395 )
      ( MAKE-1CRATE-VERIFY ?auto_29394 ?auto_29395 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29406 - SURFACE
      ?auto_29407 - SURFACE
      ?auto_29408 - SURFACE
    )
    :vars
    (
      ?auto_29410 - HOIST
      ?auto_29411 - PLACE
      ?auto_29416 - PLACE
      ?auto_29415 - HOIST
      ?auto_29413 - SURFACE
      ?auto_29409 - PLACE
      ?auto_29412 - HOIST
      ?auto_29414 - SURFACE
      ?auto_29417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29410 ?auto_29411 ) ( IS-CRATE ?auto_29408 ) ( not ( = ?auto_29407 ?auto_29408 ) ) ( not ( = ?auto_29406 ?auto_29407 ) ) ( not ( = ?auto_29406 ?auto_29408 ) ) ( not ( = ?auto_29416 ?auto_29411 ) ) ( HOIST-AT ?auto_29415 ?auto_29416 ) ( not ( = ?auto_29410 ?auto_29415 ) ) ( AVAILABLE ?auto_29415 ) ( SURFACE-AT ?auto_29408 ?auto_29416 ) ( ON ?auto_29408 ?auto_29413 ) ( CLEAR ?auto_29408 ) ( not ( = ?auto_29407 ?auto_29413 ) ) ( not ( = ?auto_29408 ?auto_29413 ) ) ( not ( = ?auto_29406 ?auto_29413 ) ) ( SURFACE-AT ?auto_29406 ?auto_29411 ) ( CLEAR ?auto_29406 ) ( IS-CRATE ?auto_29407 ) ( AVAILABLE ?auto_29410 ) ( not ( = ?auto_29409 ?auto_29411 ) ) ( not ( = ?auto_29416 ?auto_29409 ) ) ( HOIST-AT ?auto_29412 ?auto_29409 ) ( not ( = ?auto_29410 ?auto_29412 ) ) ( not ( = ?auto_29415 ?auto_29412 ) ) ( AVAILABLE ?auto_29412 ) ( SURFACE-AT ?auto_29407 ?auto_29409 ) ( ON ?auto_29407 ?auto_29414 ) ( CLEAR ?auto_29407 ) ( not ( = ?auto_29407 ?auto_29414 ) ) ( not ( = ?auto_29408 ?auto_29414 ) ) ( not ( = ?auto_29406 ?auto_29414 ) ) ( not ( = ?auto_29413 ?auto_29414 ) ) ( TRUCK-AT ?auto_29417 ?auto_29411 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29407 ?auto_29408 )
      ( MAKE-2CRATE-VERIFY ?auto_29406 ?auto_29407 ?auto_29408 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29418 - SURFACE
      ?auto_29419 - SURFACE
      ?auto_29420 - SURFACE
      ?auto_29421 - SURFACE
    )
    :vars
    (
      ?auto_29426 - HOIST
      ?auto_29428 - PLACE
      ?auto_29422 - PLACE
      ?auto_29424 - HOIST
      ?auto_29427 - SURFACE
      ?auto_29425 - PLACE
      ?auto_29423 - HOIST
      ?auto_29429 - SURFACE
      ?auto_29430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29426 ?auto_29428 ) ( IS-CRATE ?auto_29421 ) ( not ( = ?auto_29420 ?auto_29421 ) ) ( not ( = ?auto_29419 ?auto_29420 ) ) ( not ( = ?auto_29419 ?auto_29421 ) ) ( not ( = ?auto_29422 ?auto_29428 ) ) ( HOIST-AT ?auto_29424 ?auto_29422 ) ( not ( = ?auto_29426 ?auto_29424 ) ) ( AVAILABLE ?auto_29424 ) ( SURFACE-AT ?auto_29421 ?auto_29422 ) ( ON ?auto_29421 ?auto_29427 ) ( CLEAR ?auto_29421 ) ( not ( = ?auto_29420 ?auto_29427 ) ) ( not ( = ?auto_29421 ?auto_29427 ) ) ( not ( = ?auto_29419 ?auto_29427 ) ) ( SURFACE-AT ?auto_29419 ?auto_29428 ) ( CLEAR ?auto_29419 ) ( IS-CRATE ?auto_29420 ) ( AVAILABLE ?auto_29426 ) ( not ( = ?auto_29425 ?auto_29428 ) ) ( not ( = ?auto_29422 ?auto_29425 ) ) ( HOIST-AT ?auto_29423 ?auto_29425 ) ( not ( = ?auto_29426 ?auto_29423 ) ) ( not ( = ?auto_29424 ?auto_29423 ) ) ( AVAILABLE ?auto_29423 ) ( SURFACE-AT ?auto_29420 ?auto_29425 ) ( ON ?auto_29420 ?auto_29429 ) ( CLEAR ?auto_29420 ) ( not ( = ?auto_29420 ?auto_29429 ) ) ( not ( = ?auto_29421 ?auto_29429 ) ) ( not ( = ?auto_29419 ?auto_29429 ) ) ( not ( = ?auto_29427 ?auto_29429 ) ) ( TRUCK-AT ?auto_29430 ?auto_29428 ) ( ON ?auto_29419 ?auto_29418 ) ( not ( = ?auto_29418 ?auto_29419 ) ) ( not ( = ?auto_29418 ?auto_29420 ) ) ( not ( = ?auto_29418 ?auto_29421 ) ) ( not ( = ?auto_29418 ?auto_29427 ) ) ( not ( = ?auto_29418 ?auto_29429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29419 ?auto_29420 ?auto_29421 )
      ( MAKE-3CRATE-VERIFY ?auto_29418 ?auto_29419 ?auto_29420 ?auto_29421 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29431 - SURFACE
      ?auto_29432 - SURFACE
      ?auto_29433 - SURFACE
      ?auto_29434 - SURFACE
      ?auto_29435 - SURFACE
    )
    :vars
    (
      ?auto_29440 - HOIST
      ?auto_29442 - PLACE
      ?auto_29436 - PLACE
      ?auto_29438 - HOIST
      ?auto_29441 - SURFACE
      ?auto_29439 - PLACE
      ?auto_29437 - HOIST
      ?auto_29443 - SURFACE
      ?auto_29444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29440 ?auto_29442 ) ( IS-CRATE ?auto_29435 ) ( not ( = ?auto_29434 ?auto_29435 ) ) ( not ( = ?auto_29433 ?auto_29434 ) ) ( not ( = ?auto_29433 ?auto_29435 ) ) ( not ( = ?auto_29436 ?auto_29442 ) ) ( HOIST-AT ?auto_29438 ?auto_29436 ) ( not ( = ?auto_29440 ?auto_29438 ) ) ( AVAILABLE ?auto_29438 ) ( SURFACE-AT ?auto_29435 ?auto_29436 ) ( ON ?auto_29435 ?auto_29441 ) ( CLEAR ?auto_29435 ) ( not ( = ?auto_29434 ?auto_29441 ) ) ( not ( = ?auto_29435 ?auto_29441 ) ) ( not ( = ?auto_29433 ?auto_29441 ) ) ( SURFACE-AT ?auto_29433 ?auto_29442 ) ( CLEAR ?auto_29433 ) ( IS-CRATE ?auto_29434 ) ( AVAILABLE ?auto_29440 ) ( not ( = ?auto_29439 ?auto_29442 ) ) ( not ( = ?auto_29436 ?auto_29439 ) ) ( HOIST-AT ?auto_29437 ?auto_29439 ) ( not ( = ?auto_29440 ?auto_29437 ) ) ( not ( = ?auto_29438 ?auto_29437 ) ) ( AVAILABLE ?auto_29437 ) ( SURFACE-AT ?auto_29434 ?auto_29439 ) ( ON ?auto_29434 ?auto_29443 ) ( CLEAR ?auto_29434 ) ( not ( = ?auto_29434 ?auto_29443 ) ) ( not ( = ?auto_29435 ?auto_29443 ) ) ( not ( = ?auto_29433 ?auto_29443 ) ) ( not ( = ?auto_29441 ?auto_29443 ) ) ( TRUCK-AT ?auto_29444 ?auto_29442 ) ( ON ?auto_29432 ?auto_29431 ) ( ON ?auto_29433 ?auto_29432 ) ( not ( = ?auto_29431 ?auto_29432 ) ) ( not ( = ?auto_29431 ?auto_29433 ) ) ( not ( = ?auto_29431 ?auto_29434 ) ) ( not ( = ?auto_29431 ?auto_29435 ) ) ( not ( = ?auto_29431 ?auto_29441 ) ) ( not ( = ?auto_29431 ?auto_29443 ) ) ( not ( = ?auto_29432 ?auto_29433 ) ) ( not ( = ?auto_29432 ?auto_29434 ) ) ( not ( = ?auto_29432 ?auto_29435 ) ) ( not ( = ?auto_29432 ?auto_29441 ) ) ( not ( = ?auto_29432 ?auto_29443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29433 ?auto_29434 ?auto_29435 )
      ( MAKE-4CRATE-VERIFY ?auto_29431 ?auto_29432 ?auto_29433 ?auto_29434 ?auto_29435 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29445 - SURFACE
      ?auto_29446 - SURFACE
    )
    :vars
    (
      ?auto_29452 - HOIST
      ?auto_29454 - PLACE
      ?auto_29448 - SURFACE
      ?auto_29447 - PLACE
      ?auto_29450 - HOIST
      ?auto_29453 - SURFACE
      ?auto_29451 - PLACE
      ?auto_29449 - HOIST
      ?auto_29455 - SURFACE
      ?auto_29456 - TRUCK
      ?auto_29457 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29452 ?auto_29454 ) ( IS-CRATE ?auto_29446 ) ( not ( = ?auto_29445 ?auto_29446 ) ) ( not ( = ?auto_29448 ?auto_29445 ) ) ( not ( = ?auto_29448 ?auto_29446 ) ) ( not ( = ?auto_29447 ?auto_29454 ) ) ( HOIST-AT ?auto_29450 ?auto_29447 ) ( not ( = ?auto_29452 ?auto_29450 ) ) ( AVAILABLE ?auto_29450 ) ( SURFACE-AT ?auto_29446 ?auto_29447 ) ( ON ?auto_29446 ?auto_29453 ) ( CLEAR ?auto_29446 ) ( not ( = ?auto_29445 ?auto_29453 ) ) ( not ( = ?auto_29446 ?auto_29453 ) ) ( not ( = ?auto_29448 ?auto_29453 ) ) ( IS-CRATE ?auto_29445 ) ( not ( = ?auto_29451 ?auto_29454 ) ) ( not ( = ?auto_29447 ?auto_29451 ) ) ( HOIST-AT ?auto_29449 ?auto_29451 ) ( not ( = ?auto_29452 ?auto_29449 ) ) ( not ( = ?auto_29450 ?auto_29449 ) ) ( AVAILABLE ?auto_29449 ) ( SURFACE-AT ?auto_29445 ?auto_29451 ) ( ON ?auto_29445 ?auto_29455 ) ( CLEAR ?auto_29445 ) ( not ( = ?auto_29445 ?auto_29455 ) ) ( not ( = ?auto_29446 ?auto_29455 ) ) ( not ( = ?auto_29448 ?auto_29455 ) ) ( not ( = ?auto_29453 ?auto_29455 ) ) ( TRUCK-AT ?auto_29456 ?auto_29454 ) ( SURFACE-AT ?auto_29457 ?auto_29454 ) ( CLEAR ?auto_29457 ) ( LIFTING ?auto_29452 ?auto_29448 ) ( IS-CRATE ?auto_29448 ) ( not ( = ?auto_29457 ?auto_29448 ) ) ( not ( = ?auto_29445 ?auto_29457 ) ) ( not ( = ?auto_29446 ?auto_29457 ) ) ( not ( = ?auto_29453 ?auto_29457 ) ) ( not ( = ?auto_29455 ?auto_29457 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29457 ?auto_29448 )
      ( MAKE-2CRATE ?auto_29448 ?auto_29445 ?auto_29446 )
      ( MAKE-1CRATE-VERIFY ?auto_29445 ?auto_29446 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29458 - SURFACE
      ?auto_29459 - SURFACE
      ?auto_29460 - SURFACE
    )
    :vars
    (
      ?auto_29470 - HOIST
      ?auto_29469 - PLACE
      ?auto_29468 - PLACE
      ?auto_29461 - HOIST
      ?auto_29464 - SURFACE
      ?auto_29466 - PLACE
      ?auto_29462 - HOIST
      ?auto_29463 - SURFACE
      ?auto_29467 - TRUCK
      ?auto_29465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29470 ?auto_29469 ) ( IS-CRATE ?auto_29460 ) ( not ( = ?auto_29459 ?auto_29460 ) ) ( not ( = ?auto_29458 ?auto_29459 ) ) ( not ( = ?auto_29458 ?auto_29460 ) ) ( not ( = ?auto_29468 ?auto_29469 ) ) ( HOIST-AT ?auto_29461 ?auto_29468 ) ( not ( = ?auto_29470 ?auto_29461 ) ) ( AVAILABLE ?auto_29461 ) ( SURFACE-AT ?auto_29460 ?auto_29468 ) ( ON ?auto_29460 ?auto_29464 ) ( CLEAR ?auto_29460 ) ( not ( = ?auto_29459 ?auto_29464 ) ) ( not ( = ?auto_29460 ?auto_29464 ) ) ( not ( = ?auto_29458 ?auto_29464 ) ) ( IS-CRATE ?auto_29459 ) ( not ( = ?auto_29466 ?auto_29469 ) ) ( not ( = ?auto_29468 ?auto_29466 ) ) ( HOIST-AT ?auto_29462 ?auto_29466 ) ( not ( = ?auto_29470 ?auto_29462 ) ) ( not ( = ?auto_29461 ?auto_29462 ) ) ( AVAILABLE ?auto_29462 ) ( SURFACE-AT ?auto_29459 ?auto_29466 ) ( ON ?auto_29459 ?auto_29463 ) ( CLEAR ?auto_29459 ) ( not ( = ?auto_29459 ?auto_29463 ) ) ( not ( = ?auto_29460 ?auto_29463 ) ) ( not ( = ?auto_29458 ?auto_29463 ) ) ( not ( = ?auto_29464 ?auto_29463 ) ) ( TRUCK-AT ?auto_29467 ?auto_29469 ) ( SURFACE-AT ?auto_29465 ?auto_29469 ) ( CLEAR ?auto_29465 ) ( LIFTING ?auto_29470 ?auto_29458 ) ( IS-CRATE ?auto_29458 ) ( not ( = ?auto_29465 ?auto_29458 ) ) ( not ( = ?auto_29459 ?auto_29465 ) ) ( not ( = ?auto_29460 ?auto_29465 ) ) ( not ( = ?auto_29464 ?auto_29465 ) ) ( not ( = ?auto_29463 ?auto_29465 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29459 ?auto_29460 )
      ( MAKE-2CRATE-VERIFY ?auto_29458 ?auto_29459 ?auto_29460 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29471 - SURFACE
      ?auto_29472 - SURFACE
      ?auto_29473 - SURFACE
      ?auto_29474 - SURFACE
    )
    :vars
    (
      ?auto_29478 - HOIST
      ?auto_29476 - PLACE
      ?auto_29483 - PLACE
      ?auto_29475 - HOIST
      ?auto_29482 - SURFACE
      ?auto_29481 - PLACE
      ?auto_29477 - HOIST
      ?auto_29480 - SURFACE
      ?auto_29479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29478 ?auto_29476 ) ( IS-CRATE ?auto_29474 ) ( not ( = ?auto_29473 ?auto_29474 ) ) ( not ( = ?auto_29472 ?auto_29473 ) ) ( not ( = ?auto_29472 ?auto_29474 ) ) ( not ( = ?auto_29483 ?auto_29476 ) ) ( HOIST-AT ?auto_29475 ?auto_29483 ) ( not ( = ?auto_29478 ?auto_29475 ) ) ( AVAILABLE ?auto_29475 ) ( SURFACE-AT ?auto_29474 ?auto_29483 ) ( ON ?auto_29474 ?auto_29482 ) ( CLEAR ?auto_29474 ) ( not ( = ?auto_29473 ?auto_29482 ) ) ( not ( = ?auto_29474 ?auto_29482 ) ) ( not ( = ?auto_29472 ?auto_29482 ) ) ( IS-CRATE ?auto_29473 ) ( not ( = ?auto_29481 ?auto_29476 ) ) ( not ( = ?auto_29483 ?auto_29481 ) ) ( HOIST-AT ?auto_29477 ?auto_29481 ) ( not ( = ?auto_29478 ?auto_29477 ) ) ( not ( = ?auto_29475 ?auto_29477 ) ) ( AVAILABLE ?auto_29477 ) ( SURFACE-AT ?auto_29473 ?auto_29481 ) ( ON ?auto_29473 ?auto_29480 ) ( CLEAR ?auto_29473 ) ( not ( = ?auto_29473 ?auto_29480 ) ) ( not ( = ?auto_29474 ?auto_29480 ) ) ( not ( = ?auto_29472 ?auto_29480 ) ) ( not ( = ?auto_29482 ?auto_29480 ) ) ( TRUCK-AT ?auto_29479 ?auto_29476 ) ( SURFACE-AT ?auto_29471 ?auto_29476 ) ( CLEAR ?auto_29471 ) ( LIFTING ?auto_29478 ?auto_29472 ) ( IS-CRATE ?auto_29472 ) ( not ( = ?auto_29471 ?auto_29472 ) ) ( not ( = ?auto_29473 ?auto_29471 ) ) ( not ( = ?auto_29474 ?auto_29471 ) ) ( not ( = ?auto_29482 ?auto_29471 ) ) ( not ( = ?auto_29480 ?auto_29471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29472 ?auto_29473 ?auto_29474 )
      ( MAKE-3CRATE-VERIFY ?auto_29471 ?auto_29472 ?auto_29473 ?auto_29474 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29484 - SURFACE
      ?auto_29485 - SURFACE
      ?auto_29486 - SURFACE
      ?auto_29487 - SURFACE
      ?auto_29488 - SURFACE
    )
    :vars
    (
      ?auto_29492 - HOIST
      ?auto_29490 - PLACE
      ?auto_29497 - PLACE
      ?auto_29489 - HOIST
      ?auto_29496 - SURFACE
      ?auto_29495 - PLACE
      ?auto_29491 - HOIST
      ?auto_29494 - SURFACE
      ?auto_29493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29492 ?auto_29490 ) ( IS-CRATE ?auto_29488 ) ( not ( = ?auto_29487 ?auto_29488 ) ) ( not ( = ?auto_29486 ?auto_29487 ) ) ( not ( = ?auto_29486 ?auto_29488 ) ) ( not ( = ?auto_29497 ?auto_29490 ) ) ( HOIST-AT ?auto_29489 ?auto_29497 ) ( not ( = ?auto_29492 ?auto_29489 ) ) ( AVAILABLE ?auto_29489 ) ( SURFACE-AT ?auto_29488 ?auto_29497 ) ( ON ?auto_29488 ?auto_29496 ) ( CLEAR ?auto_29488 ) ( not ( = ?auto_29487 ?auto_29496 ) ) ( not ( = ?auto_29488 ?auto_29496 ) ) ( not ( = ?auto_29486 ?auto_29496 ) ) ( IS-CRATE ?auto_29487 ) ( not ( = ?auto_29495 ?auto_29490 ) ) ( not ( = ?auto_29497 ?auto_29495 ) ) ( HOIST-AT ?auto_29491 ?auto_29495 ) ( not ( = ?auto_29492 ?auto_29491 ) ) ( not ( = ?auto_29489 ?auto_29491 ) ) ( AVAILABLE ?auto_29491 ) ( SURFACE-AT ?auto_29487 ?auto_29495 ) ( ON ?auto_29487 ?auto_29494 ) ( CLEAR ?auto_29487 ) ( not ( = ?auto_29487 ?auto_29494 ) ) ( not ( = ?auto_29488 ?auto_29494 ) ) ( not ( = ?auto_29486 ?auto_29494 ) ) ( not ( = ?auto_29496 ?auto_29494 ) ) ( TRUCK-AT ?auto_29493 ?auto_29490 ) ( SURFACE-AT ?auto_29485 ?auto_29490 ) ( CLEAR ?auto_29485 ) ( LIFTING ?auto_29492 ?auto_29486 ) ( IS-CRATE ?auto_29486 ) ( not ( = ?auto_29485 ?auto_29486 ) ) ( not ( = ?auto_29487 ?auto_29485 ) ) ( not ( = ?auto_29488 ?auto_29485 ) ) ( not ( = ?auto_29496 ?auto_29485 ) ) ( not ( = ?auto_29494 ?auto_29485 ) ) ( ON ?auto_29485 ?auto_29484 ) ( not ( = ?auto_29484 ?auto_29485 ) ) ( not ( = ?auto_29484 ?auto_29486 ) ) ( not ( = ?auto_29484 ?auto_29487 ) ) ( not ( = ?auto_29484 ?auto_29488 ) ) ( not ( = ?auto_29484 ?auto_29496 ) ) ( not ( = ?auto_29484 ?auto_29494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29486 ?auto_29487 ?auto_29488 )
      ( MAKE-4CRATE-VERIFY ?auto_29484 ?auto_29485 ?auto_29486 ?auto_29487 ?auto_29488 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29498 - SURFACE
      ?auto_29499 - SURFACE
    )
    :vars
    (
      ?auto_29504 - HOIST
      ?auto_29501 - PLACE
      ?auto_29505 - SURFACE
      ?auto_29510 - PLACE
      ?auto_29500 - HOIST
      ?auto_29509 - SURFACE
      ?auto_29508 - PLACE
      ?auto_29502 - HOIST
      ?auto_29507 - SURFACE
      ?auto_29506 - TRUCK
      ?auto_29503 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29504 ?auto_29501 ) ( IS-CRATE ?auto_29499 ) ( not ( = ?auto_29498 ?auto_29499 ) ) ( not ( = ?auto_29505 ?auto_29498 ) ) ( not ( = ?auto_29505 ?auto_29499 ) ) ( not ( = ?auto_29510 ?auto_29501 ) ) ( HOIST-AT ?auto_29500 ?auto_29510 ) ( not ( = ?auto_29504 ?auto_29500 ) ) ( AVAILABLE ?auto_29500 ) ( SURFACE-AT ?auto_29499 ?auto_29510 ) ( ON ?auto_29499 ?auto_29509 ) ( CLEAR ?auto_29499 ) ( not ( = ?auto_29498 ?auto_29509 ) ) ( not ( = ?auto_29499 ?auto_29509 ) ) ( not ( = ?auto_29505 ?auto_29509 ) ) ( IS-CRATE ?auto_29498 ) ( not ( = ?auto_29508 ?auto_29501 ) ) ( not ( = ?auto_29510 ?auto_29508 ) ) ( HOIST-AT ?auto_29502 ?auto_29508 ) ( not ( = ?auto_29504 ?auto_29502 ) ) ( not ( = ?auto_29500 ?auto_29502 ) ) ( AVAILABLE ?auto_29502 ) ( SURFACE-AT ?auto_29498 ?auto_29508 ) ( ON ?auto_29498 ?auto_29507 ) ( CLEAR ?auto_29498 ) ( not ( = ?auto_29498 ?auto_29507 ) ) ( not ( = ?auto_29499 ?auto_29507 ) ) ( not ( = ?auto_29505 ?auto_29507 ) ) ( not ( = ?auto_29509 ?auto_29507 ) ) ( TRUCK-AT ?auto_29506 ?auto_29501 ) ( SURFACE-AT ?auto_29503 ?auto_29501 ) ( CLEAR ?auto_29503 ) ( IS-CRATE ?auto_29505 ) ( not ( = ?auto_29503 ?auto_29505 ) ) ( not ( = ?auto_29498 ?auto_29503 ) ) ( not ( = ?auto_29499 ?auto_29503 ) ) ( not ( = ?auto_29509 ?auto_29503 ) ) ( not ( = ?auto_29507 ?auto_29503 ) ) ( AVAILABLE ?auto_29504 ) ( IN ?auto_29505 ?auto_29506 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29504 ?auto_29505 ?auto_29506 ?auto_29501 )
      ( MAKE-2CRATE ?auto_29505 ?auto_29498 ?auto_29499 )
      ( MAKE-1CRATE-VERIFY ?auto_29498 ?auto_29499 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29511 - SURFACE
      ?auto_29512 - SURFACE
      ?auto_29513 - SURFACE
    )
    :vars
    (
      ?auto_29519 - HOIST
      ?auto_29514 - PLACE
      ?auto_29522 - PLACE
      ?auto_29518 - HOIST
      ?auto_29523 - SURFACE
      ?auto_29520 - PLACE
      ?auto_29521 - HOIST
      ?auto_29515 - SURFACE
      ?auto_29516 - TRUCK
      ?auto_29517 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29519 ?auto_29514 ) ( IS-CRATE ?auto_29513 ) ( not ( = ?auto_29512 ?auto_29513 ) ) ( not ( = ?auto_29511 ?auto_29512 ) ) ( not ( = ?auto_29511 ?auto_29513 ) ) ( not ( = ?auto_29522 ?auto_29514 ) ) ( HOIST-AT ?auto_29518 ?auto_29522 ) ( not ( = ?auto_29519 ?auto_29518 ) ) ( AVAILABLE ?auto_29518 ) ( SURFACE-AT ?auto_29513 ?auto_29522 ) ( ON ?auto_29513 ?auto_29523 ) ( CLEAR ?auto_29513 ) ( not ( = ?auto_29512 ?auto_29523 ) ) ( not ( = ?auto_29513 ?auto_29523 ) ) ( not ( = ?auto_29511 ?auto_29523 ) ) ( IS-CRATE ?auto_29512 ) ( not ( = ?auto_29520 ?auto_29514 ) ) ( not ( = ?auto_29522 ?auto_29520 ) ) ( HOIST-AT ?auto_29521 ?auto_29520 ) ( not ( = ?auto_29519 ?auto_29521 ) ) ( not ( = ?auto_29518 ?auto_29521 ) ) ( AVAILABLE ?auto_29521 ) ( SURFACE-AT ?auto_29512 ?auto_29520 ) ( ON ?auto_29512 ?auto_29515 ) ( CLEAR ?auto_29512 ) ( not ( = ?auto_29512 ?auto_29515 ) ) ( not ( = ?auto_29513 ?auto_29515 ) ) ( not ( = ?auto_29511 ?auto_29515 ) ) ( not ( = ?auto_29523 ?auto_29515 ) ) ( TRUCK-AT ?auto_29516 ?auto_29514 ) ( SURFACE-AT ?auto_29517 ?auto_29514 ) ( CLEAR ?auto_29517 ) ( IS-CRATE ?auto_29511 ) ( not ( = ?auto_29517 ?auto_29511 ) ) ( not ( = ?auto_29512 ?auto_29517 ) ) ( not ( = ?auto_29513 ?auto_29517 ) ) ( not ( = ?auto_29523 ?auto_29517 ) ) ( not ( = ?auto_29515 ?auto_29517 ) ) ( AVAILABLE ?auto_29519 ) ( IN ?auto_29511 ?auto_29516 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29512 ?auto_29513 )
      ( MAKE-2CRATE-VERIFY ?auto_29511 ?auto_29512 ?auto_29513 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29524 - SURFACE
      ?auto_29525 - SURFACE
      ?auto_29526 - SURFACE
      ?auto_29527 - SURFACE
    )
    :vars
    (
      ?auto_29528 - HOIST
      ?auto_29529 - PLACE
      ?auto_29532 - PLACE
      ?auto_29533 - HOIST
      ?auto_29534 - SURFACE
      ?auto_29536 - PLACE
      ?auto_29530 - HOIST
      ?auto_29535 - SURFACE
      ?auto_29531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29528 ?auto_29529 ) ( IS-CRATE ?auto_29527 ) ( not ( = ?auto_29526 ?auto_29527 ) ) ( not ( = ?auto_29525 ?auto_29526 ) ) ( not ( = ?auto_29525 ?auto_29527 ) ) ( not ( = ?auto_29532 ?auto_29529 ) ) ( HOIST-AT ?auto_29533 ?auto_29532 ) ( not ( = ?auto_29528 ?auto_29533 ) ) ( AVAILABLE ?auto_29533 ) ( SURFACE-AT ?auto_29527 ?auto_29532 ) ( ON ?auto_29527 ?auto_29534 ) ( CLEAR ?auto_29527 ) ( not ( = ?auto_29526 ?auto_29534 ) ) ( not ( = ?auto_29527 ?auto_29534 ) ) ( not ( = ?auto_29525 ?auto_29534 ) ) ( IS-CRATE ?auto_29526 ) ( not ( = ?auto_29536 ?auto_29529 ) ) ( not ( = ?auto_29532 ?auto_29536 ) ) ( HOIST-AT ?auto_29530 ?auto_29536 ) ( not ( = ?auto_29528 ?auto_29530 ) ) ( not ( = ?auto_29533 ?auto_29530 ) ) ( AVAILABLE ?auto_29530 ) ( SURFACE-AT ?auto_29526 ?auto_29536 ) ( ON ?auto_29526 ?auto_29535 ) ( CLEAR ?auto_29526 ) ( not ( = ?auto_29526 ?auto_29535 ) ) ( not ( = ?auto_29527 ?auto_29535 ) ) ( not ( = ?auto_29525 ?auto_29535 ) ) ( not ( = ?auto_29534 ?auto_29535 ) ) ( TRUCK-AT ?auto_29531 ?auto_29529 ) ( SURFACE-AT ?auto_29524 ?auto_29529 ) ( CLEAR ?auto_29524 ) ( IS-CRATE ?auto_29525 ) ( not ( = ?auto_29524 ?auto_29525 ) ) ( not ( = ?auto_29526 ?auto_29524 ) ) ( not ( = ?auto_29527 ?auto_29524 ) ) ( not ( = ?auto_29534 ?auto_29524 ) ) ( not ( = ?auto_29535 ?auto_29524 ) ) ( AVAILABLE ?auto_29528 ) ( IN ?auto_29525 ?auto_29531 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29525 ?auto_29526 ?auto_29527 )
      ( MAKE-3CRATE-VERIFY ?auto_29524 ?auto_29525 ?auto_29526 ?auto_29527 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29537 - SURFACE
      ?auto_29538 - SURFACE
      ?auto_29539 - SURFACE
      ?auto_29540 - SURFACE
      ?auto_29541 - SURFACE
    )
    :vars
    (
      ?auto_29542 - HOIST
      ?auto_29543 - PLACE
      ?auto_29546 - PLACE
      ?auto_29547 - HOIST
      ?auto_29548 - SURFACE
      ?auto_29550 - PLACE
      ?auto_29544 - HOIST
      ?auto_29549 - SURFACE
      ?auto_29545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29542 ?auto_29543 ) ( IS-CRATE ?auto_29541 ) ( not ( = ?auto_29540 ?auto_29541 ) ) ( not ( = ?auto_29539 ?auto_29540 ) ) ( not ( = ?auto_29539 ?auto_29541 ) ) ( not ( = ?auto_29546 ?auto_29543 ) ) ( HOIST-AT ?auto_29547 ?auto_29546 ) ( not ( = ?auto_29542 ?auto_29547 ) ) ( AVAILABLE ?auto_29547 ) ( SURFACE-AT ?auto_29541 ?auto_29546 ) ( ON ?auto_29541 ?auto_29548 ) ( CLEAR ?auto_29541 ) ( not ( = ?auto_29540 ?auto_29548 ) ) ( not ( = ?auto_29541 ?auto_29548 ) ) ( not ( = ?auto_29539 ?auto_29548 ) ) ( IS-CRATE ?auto_29540 ) ( not ( = ?auto_29550 ?auto_29543 ) ) ( not ( = ?auto_29546 ?auto_29550 ) ) ( HOIST-AT ?auto_29544 ?auto_29550 ) ( not ( = ?auto_29542 ?auto_29544 ) ) ( not ( = ?auto_29547 ?auto_29544 ) ) ( AVAILABLE ?auto_29544 ) ( SURFACE-AT ?auto_29540 ?auto_29550 ) ( ON ?auto_29540 ?auto_29549 ) ( CLEAR ?auto_29540 ) ( not ( = ?auto_29540 ?auto_29549 ) ) ( not ( = ?auto_29541 ?auto_29549 ) ) ( not ( = ?auto_29539 ?auto_29549 ) ) ( not ( = ?auto_29548 ?auto_29549 ) ) ( TRUCK-AT ?auto_29545 ?auto_29543 ) ( SURFACE-AT ?auto_29538 ?auto_29543 ) ( CLEAR ?auto_29538 ) ( IS-CRATE ?auto_29539 ) ( not ( = ?auto_29538 ?auto_29539 ) ) ( not ( = ?auto_29540 ?auto_29538 ) ) ( not ( = ?auto_29541 ?auto_29538 ) ) ( not ( = ?auto_29548 ?auto_29538 ) ) ( not ( = ?auto_29549 ?auto_29538 ) ) ( AVAILABLE ?auto_29542 ) ( IN ?auto_29539 ?auto_29545 ) ( ON ?auto_29538 ?auto_29537 ) ( not ( = ?auto_29537 ?auto_29538 ) ) ( not ( = ?auto_29537 ?auto_29539 ) ) ( not ( = ?auto_29537 ?auto_29540 ) ) ( not ( = ?auto_29537 ?auto_29541 ) ) ( not ( = ?auto_29537 ?auto_29548 ) ) ( not ( = ?auto_29537 ?auto_29549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29539 ?auto_29540 ?auto_29541 )
      ( MAKE-4CRATE-VERIFY ?auto_29537 ?auto_29538 ?auto_29539 ?auto_29540 ?auto_29541 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29551 - SURFACE
      ?auto_29552 - SURFACE
    )
    :vars
    (
      ?auto_29553 - HOIST
      ?auto_29554 - PLACE
      ?auto_29558 - SURFACE
      ?auto_29557 - PLACE
      ?auto_29559 - HOIST
      ?auto_29560 - SURFACE
      ?auto_29563 - PLACE
      ?auto_29555 - HOIST
      ?auto_29561 - SURFACE
      ?auto_29562 - SURFACE
      ?auto_29556 - TRUCK
      ?auto_29564 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29553 ?auto_29554 ) ( IS-CRATE ?auto_29552 ) ( not ( = ?auto_29551 ?auto_29552 ) ) ( not ( = ?auto_29558 ?auto_29551 ) ) ( not ( = ?auto_29558 ?auto_29552 ) ) ( not ( = ?auto_29557 ?auto_29554 ) ) ( HOIST-AT ?auto_29559 ?auto_29557 ) ( not ( = ?auto_29553 ?auto_29559 ) ) ( AVAILABLE ?auto_29559 ) ( SURFACE-AT ?auto_29552 ?auto_29557 ) ( ON ?auto_29552 ?auto_29560 ) ( CLEAR ?auto_29552 ) ( not ( = ?auto_29551 ?auto_29560 ) ) ( not ( = ?auto_29552 ?auto_29560 ) ) ( not ( = ?auto_29558 ?auto_29560 ) ) ( IS-CRATE ?auto_29551 ) ( not ( = ?auto_29563 ?auto_29554 ) ) ( not ( = ?auto_29557 ?auto_29563 ) ) ( HOIST-AT ?auto_29555 ?auto_29563 ) ( not ( = ?auto_29553 ?auto_29555 ) ) ( not ( = ?auto_29559 ?auto_29555 ) ) ( AVAILABLE ?auto_29555 ) ( SURFACE-AT ?auto_29551 ?auto_29563 ) ( ON ?auto_29551 ?auto_29561 ) ( CLEAR ?auto_29551 ) ( not ( = ?auto_29551 ?auto_29561 ) ) ( not ( = ?auto_29552 ?auto_29561 ) ) ( not ( = ?auto_29558 ?auto_29561 ) ) ( not ( = ?auto_29560 ?auto_29561 ) ) ( SURFACE-AT ?auto_29562 ?auto_29554 ) ( CLEAR ?auto_29562 ) ( IS-CRATE ?auto_29558 ) ( not ( = ?auto_29562 ?auto_29558 ) ) ( not ( = ?auto_29551 ?auto_29562 ) ) ( not ( = ?auto_29552 ?auto_29562 ) ) ( not ( = ?auto_29560 ?auto_29562 ) ) ( not ( = ?auto_29561 ?auto_29562 ) ) ( AVAILABLE ?auto_29553 ) ( IN ?auto_29558 ?auto_29556 ) ( TRUCK-AT ?auto_29556 ?auto_29564 ) ( not ( = ?auto_29564 ?auto_29554 ) ) ( not ( = ?auto_29557 ?auto_29564 ) ) ( not ( = ?auto_29563 ?auto_29564 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29556 ?auto_29564 ?auto_29554 )
      ( MAKE-2CRATE ?auto_29558 ?auto_29551 ?auto_29552 )
      ( MAKE-1CRATE-VERIFY ?auto_29551 ?auto_29552 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29565 - SURFACE
      ?auto_29566 - SURFACE
      ?auto_29567 - SURFACE
    )
    :vars
    (
      ?auto_29571 - HOIST
      ?auto_29578 - PLACE
      ?auto_29576 - PLACE
      ?auto_29573 - HOIST
      ?auto_29570 - SURFACE
      ?auto_29568 - PLACE
      ?auto_29577 - HOIST
      ?auto_29574 - SURFACE
      ?auto_29575 - SURFACE
      ?auto_29569 - TRUCK
      ?auto_29572 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29571 ?auto_29578 ) ( IS-CRATE ?auto_29567 ) ( not ( = ?auto_29566 ?auto_29567 ) ) ( not ( = ?auto_29565 ?auto_29566 ) ) ( not ( = ?auto_29565 ?auto_29567 ) ) ( not ( = ?auto_29576 ?auto_29578 ) ) ( HOIST-AT ?auto_29573 ?auto_29576 ) ( not ( = ?auto_29571 ?auto_29573 ) ) ( AVAILABLE ?auto_29573 ) ( SURFACE-AT ?auto_29567 ?auto_29576 ) ( ON ?auto_29567 ?auto_29570 ) ( CLEAR ?auto_29567 ) ( not ( = ?auto_29566 ?auto_29570 ) ) ( not ( = ?auto_29567 ?auto_29570 ) ) ( not ( = ?auto_29565 ?auto_29570 ) ) ( IS-CRATE ?auto_29566 ) ( not ( = ?auto_29568 ?auto_29578 ) ) ( not ( = ?auto_29576 ?auto_29568 ) ) ( HOIST-AT ?auto_29577 ?auto_29568 ) ( not ( = ?auto_29571 ?auto_29577 ) ) ( not ( = ?auto_29573 ?auto_29577 ) ) ( AVAILABLE ?auto_29577 ) ( SURFACE-AT ?auto_29566 ?auto_29568 ) ( ON ?auto_29566 ?auto_29574 ) ( CLEAR ?auto_29566 ) ( not ( = ?auto_29566 ?auto_29574 ) ) ( not ( = ?auto_29567 ?auto_29574 ) ) ( not ( = ?auto_29565 ?auto_29574 ) ) ( not ( = ?auto_29570 ?auto_29574 ) ) ( SURFACE-AT ?auto_29575 ?auto_29578 ) ( CLEAR ?auto_29575 ) ( IS-CRATE ?auto_29565 ) ( not ( = ?auto_29575 ?auto_29565 ) ) ( not ( = ?auto_29566 ?auto_29575 ) ) ( not ( = ?auto_29567 ?auto_29575 ) ) ( not ( = ?auto_29570 ?auto_29575 ) ) ( not ( = ?auto_29574 ?auto_29575 ) ) ( AVAILABLE ?auto_29571 ) ( IN ?auto_29565 ?auto_29569 ) ( TRUCK-AT ?auto_29569 ?auto_29572 ) ( not ( = ?auto_29572 ?auto_29578 ) ) ( not ( = ?auto_29576 ?auto_29572 ) ) ( not ( = ?auto_29568 ?auto_29572 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29566 ?auto_29567 )
      ( MAKE-2CRATE-VERIFY ?auto_29565 ?auto_29566 ?auto_29567 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29579 - SURFACE
      ?auto_29580 - SURFACE
      ?auto_29581 - SURFACE
      ?auto_29582 - SURFACE
    )
    :vars
    (
      ?auto_29592 - HOIST
      ?auto_29591 - PLACE
      ?auto_29590 - PLACE
      ?auto_29587 - HOIST
      ?auto_29589 - SURFACE
      ?auto_29584 - PLACE
      ?auto_29585 - HOIST
      ?auto_29586 - SURFACE
      ?auto_29588 - TRUCK
      ?auto_29583 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29592 ?auto_29591 ) ( IS-CRATE ?auto_29582 ) ( not ( = ?auto_29581 ?auto_29582 ) ) ( not ( = ?auto_29580 ?auto_29581 ) ) ( not ( = ?auto_29580 ?auto_29582 ) ) ( not ( = ?auto_29590 ?auto_29591 ) ) ( HOIST-AT ?auto_29587 ?auto_29590 ) ( not ( = ?auto_29592 ?auto_29587 ) ) ( AVAILABLE ?auto_29587 ) ( SURFACE-AT ?auto_29582 ?auto_29590 ) ( ON ?auto_29582 ?auto_29589 ) ( CLEAR ?auto_29582 ) ( not ( = ?auto_29581 ?auto_29589 ) ) ( not ( = ?auto_29582 ?auto_29589 ) ) ( not ( = ?auto_29580 ?auto_29589 ) ) ( IS-CRATE ?auto_29581 ) ( not ( = ?auto_29584 ?auto_29591 ) ) ( not ( = ?auto_29590 ?auto_29584 ) ) ( HOIST-AT ?auto_29585 ?auto_29584 ) ( not ( = ?auto_29592 ?auto_29585 ) ) ( not ( = ?auto_29587 ?auto_29585 ) ) ( AVAILABLE ?auto_29585 ) ( SURFACE-AT ?auto_29581 ?auto_29584 ) ( ON ?auto_29581 ?auto_29586 ) ( CLEAR ?auto_29581 ) ( not ( = ?auto_29581 ?auto_29586 ) ) ( not ( = ?auto_29582 ?auto_29586 ) ) ( not ( = ?auto_29580 ?auto_29586 ) ) ( not ( = ?auto_29589 ?auto_29586 ) ) ( SURFACE-AT ?auto_29579 ?auto_29591 ) ( CLEAR ?auto_29579 ) ( IS-CRATE ?auto_29580 ) ( not ( = ?auto_29579 ?auto_29580 ) ) ( not ( = ?auto_29581 ?auto_29579 ) ) ( not ( = ?auto_29582 ?auto_29579 ) ) ( not ( = ?auto_29589 ?auto_29579 ) ) ( not ( = ?auto_29586 ?auto_29579 ) ) ( AVAILABLE ?auto_29592 ) ( IN ?auto_29580 ?auto_29588 ) ( TRUCK-AT ?auto_29588 ?auto_29583 ) ( not ( = ?auto_29583 ?auto_29591 ) ) ( not ( = ?auto_29590 ?auto_29583 ) ) ( not ( = ?auto_29584 ?auto_29583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29580 ?auto_29581 ?auto_29582 )
      ( MAKE-3CRATE-VERIFY ?auto_29579 ?auto_29580 ?auto_29581 ?auto_29582 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29593 - SURFACE
      ?auto_29594 - SURFACE
      ?auto_29595 - SURFACE
      ?auto_29596 - SURFACE
      ?auto_29597 - SURFACE
    )
    :vars
    (
      ?auto_29607 - HOIST
      ?auto_29606 - PLACE
      ?auto_29605 - PLACE
      ?auto_29602 - HOIST
      ?auto_29604 - SURFACE
      ?auto_29599 - PLACE
      ?auto_29600 - HOIST
      ?auto_29601 - SURFACE
      ?auto_29603 - TRUCK
      ?auto_29598 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29607 ?auto_29606 ) ( IS-CRATE ?auto_29597 ) ( not ( = ?auto_29596 ?auto_29597 ) ) ( not ( = ?auto_29595 ?auto_29596 ) ) ( not ( = ?auto_29595 ?auto_29597 ) ) ( not ( = ?auto_29605 ?auto_29606 ) ) ( HOIST-AT ?auto_29602 ?auto_29605 ) ( not ( = ?auto_29607 ?auto_29602 ) ) ( AVAILABLE ?auto_29602 ) ( SURFACE-AT ?auto_29597 ?auto_29605 ) ( ON ?auto_29597 ?auto_29604 ) ( CLEAR ?auto_29597 ) ( not ( = ?auto_29596 ?auto_29604 ) ) ( not ( = ?auto_29597 ?auto_29604 ) ) ( not ( = ?auto_29595 ?auto_29604 ) ) ( IS-CRATE ?auto_29596 ) ( not ( = ?auto_29599 ?auto_29606 ) ) ( not ( = ?auto_29605 ?auto_29599 ) ) ( HOIST-AT ?auto_29600 ?auto_29599 ) ( not ( = ?auto_29607 ?auto_29600 ) ) ( not ( = ?auto_29602 ?auto_29600 ) ) ( AVAILABLE ?auto_29600 ) ( SURFACE-AT ?auto_29596 ?auto_29599 ) ( ON ?auto_29596 ?auto_29601 ) ( CLEAR ?auto_29596 ) ( not ( = ?auto_29596 ?auto_29601 ) ) ( not ( = ?auto_29597 ?auto_29601 ) ) ( not ( = ?auto_29595 ?auto_29601 ) ) ( not ( = ?auto_29604 ?auto_29601 ) ) ( SURFACE-AT ?auto_29594 ?auto_29606 ) ( CLEAR ?auto_29594 ) ( IS-CRATE ?auto_29595 ) ( not ( = ?auto_29594 ?auto_29595 ) ) ( not ( = ?auto_29596 ?auto_29594 ) ) ( not ( = ?auto_29597 ?auto_29594 ) ) ( not ( = ?auto_29604 ?auto_29594 ) ) ( not ( = ?auto_29601 ?auto_29594 ) ) ( AVAILABLE ?auto_29607 ) ( IN ?auto_29595 ?auto_29603 ) ( TRUCK-AT ?auto_29603 ?auto_29598 ) ( not ( = ?auto_29598 ?auto_29606 ) ) ( not ( = ?auto_29605 ?auto_29598 ) ) ( not ( = ?auto_29599 ?auto_29598 ) ) ( ON ?auto_29594 ?auto_29593 ) ( not ( = ?auto_29593 ?auto_29594 ) ) ( not ( = ?auto_29593 ?auto_29595 ) ) ( not ( = ?auto_29593 ?auto_29596 ) ) ( not ( = ?auto_29593 ?auto_29597 ) ) ( not ( = ?auto_29593 ?auto_29604 ) ) ( not ( = ?auto_29593 ?auto_29601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29595 ?auto_29596 ?auto_29597 )
      ( MAKE-4CRATE-VERIFY ?auto_29593 ?auto_29594 ?auto_29595 ?auto_29596 ?auto_29597 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29608 - SURFACE
      ?auto_29609 - SURFACE
    )
    :vars
    (
      ?auto_29620 - HOIST
      ?auto_29619 - PLACE
      ?auto_29621 - SURFACE
      ?auto_29618 - PLACE
      ?auto_29615 - HOIST
      ?auto_29617 - SURFACE
      ?auto_29612 - PLACE
      ?auto_29613 - HOIST
      ?auto_29614 - SURFACE
      ?auto_29610 - SURFACE
      ?auto_29616 - TRUCK
      ?auto_29611 - PLACE
      ?auto_29622 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29620 ?auto_29619 ) ( IS-CRATE ?auto_29609 ) ( not ( = ?auto_29608 ?auto_29609 ) ) ( not ( = ?auto_29621 ?auto_29608 ) ) ( not ( = ?auto_29621 ?auto_29609 ) ) ( not ( = ?auto_29618 ?auto_29619 ) ) ( HOIST-AT ?auto_29615 ?auto_29618 ) ( not ( = ?auto_29620 ?auto_29615 ) ) ( AVAILABLE ?auto_29615 ) ( SURFACE-AT ?auto_29609 ?auto_29618 ) ( ON ?auto_29609 ?auto_29617 ) ( CLEAR ?auto_29609 ) ( not ( = ?auto_29608 ?auto_29617 ) ) ( not ( = ?auto_29609 ?auto_29617 ) ) ( not ( = ?auto_29621 ?auto_29617 ) ) ( IS-CRATE ?auto_29608 ) ( not ( = ?auto_29612 ?auto_29619 ) ) ( not ( = ?auto_29618 ?auto_29612 ) ) ( HOIST-AT ?auto_29613 ?auto_29612 ) ( not ( = ?auto_29620 ?auto_29613 ) ) ( not ( = ?auto_29615 ?auto_29613 ) ) ( AVAILABLE ?auto_29613 ) ( SURFACE-AT ?auto_29608 ?auto_29612 ) ( ON ?auto_29608 ?auto_29614 ) ( CLEAR ?auto_29608 ) ( not ( = ?auto_29608 ?auto_29614 ) ) ( not ( = ?auto_29609 ?auto_29614 ) ) ( not ( = ?auto_29621 ?auto_29614 ) ) ( not ( = ?auto_29617 ?auto_29614 ) ) ( SURFACE-AT ?auto_29610 ?auto_29619 ) ( CLEAR ?auto_29610 ) ( IS-CRATE ?auto_29621 ) ( not ( = ?auto_29610 ?auto_29621 ) ) ( not ( = ?auto_29608 ?auto_29610 ) ) ( not ( = ?auto_29609 ?auto_29610 ) ) ( not ( = ?auto_29617 ?auto_29610 ) ) ( not ( = ?auto_29614 ?auto_29610 ) ) ( AVAILABLE ?auto_29620 ) ( TRUCK-AT ?auto_29616 ?auto_29611 ) ( not ( = ?auto_29611 ?auto_29619 ) ) ( not ( = ?auto_29618 ?auto_29611 ) ) ( not ( = ?auto_29612 ?auto_29611 ) ) ( HOIST-AT ?auto_29622 ?auto_29611 ) ( LIFTING ?auto_29622 ?auto_29621 ) ( not ( = ?auto_29620 ?auto_29622 ) ) ( not ( = ?auto_29615 ?auto_29622 ) ) ( not ( = ?auto_29613 ?auto_29622 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29622 ?auto_29621 ?auto_29616 ?auto_29611 )
      ( MAKE-2CRATE ?auto_29621 ?auto_29608 ?auto_29609 )
      ( MAKE-1CRATE-VERIFY ?auto_29608 ?auto_29609 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29623 - SURFACE
      ?auto_29624 - SURFACE
      ?auto_29625 - SURFACE
    )
    :vars
    (
      ?auto_29629 - HOIST
      ?auto_29630 - PLACE
      ?auto_29631 - PLACE
      ?auto_29632 - HOIST
      ?auto_29635 - SURFACE
      ?auto_29636 - PLACE
      ?auto_29634 - HOIST
      ?auto_29628 - SURFACE
      ?auto_29627 - SURFACE
      ?auto_29626 - TRUCK
      ?auto_29637 - PLACE
      ?auto_29633 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29629 ?auto_29630 ) ( IS-CRATE ?auto_29625 ) ( not ( = ?auto_29624 ?auto_29625 ) ) ( not ( = ?auto_29623 ?auto_29624 ) ) ( not ( = ?auto_29623 ?auto_29625 ) ) ( not ( = ?auto_29631 ?auto_29630 ) ) ( HOIST-AT ?auto_29632 ?auto_29631 ) ( not ( = ?auto_29629 ?auto_29632 ) ) ( AVAILABLE ?auto_29632 ) ( SURFACE-AT ?auto_29625 ?auto_29631 ) ( ON ?auto_29625 ?auto_29635 ) ( CLEAR ?auto_29625 ) ( not ( = ?auto_29624 ?auto_29635 ) ) ( not ( = ?auto_29625 ?auto_29635 ) ) ( not ( = ?auto_29623 ?auto_29635 ) ) ( IS-CRATE ?auto_29624 ) ( not ( = ?auto_29636 ?auto_29630 ) ) ( not ( = ?auto_29631 ?auto_29636 ) ) ( HOIST-AT ?auto_29634 ?auto_29636 ) ( not ( = ?auto_29629 ?auto_29634 ) ) ( not ( = ?auto_29632 ?auto_29634 ) ) ( AVAILABLE ?auto_29634 ) ( SURFACE-AT ?auto_29624 ?auto_29636 ) ( ON ?auto_29624 ?auto_29628 ) ( CLEAR ?auto_29624 ) ( not ( = ?auto_29624 ?auto_29628 ) ) ( not ( = ?auto_29625 ?auto_29628 ) ) ( not ( = ?auto_29623 ?auto_29628 ) ) ( not ( = ?auto_29635 ?auto_29628 ) ) ( SURFACE-AT ?auto_29627 ?auto_29630 ) ( CLEAR ?auto_29627 ) ( IS-CRATE ?auto_29623 ) ( not ( = ?auto_29627 ?auto_29623 ) ) ( not ( = ?auto_29624 ?auto_29627 ) ) ( not ( = ?auto_29625 ?auto_29627 ) ) ( not ( = ?auto_29635 ?auto_29627 ) ) ( not ( = ?auto_29628 ?auto_29627 ) ) ( AVAILABLE ?auto_29629 ) ( TRUCK-AT ?auto_29626 ?auto_29637 ) ( not ( = ?auto_29637 ?auto_29630 ) ) ( not ( = ?auto_29631 ?auto_29637 ) ) ( not ( = ?auto_29636 ?auto_29637 ) ) ( HOIST-AT ?auto_29633 ?auto_29637 ) ( LIFTING ?auto_29633 ?auto_29623 ) ( not ( = ?auto_29629 ?auto_29633 ) ) ( not ( = ?auto_29632 ?auto_29633 ) ) ( not ( = ?auto_29634 ?auto_29633 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29624 ?auto_29625 )
      ( MAKE-2CRATE-VERIFY ?auto_29623 ?auto_29624 ?auto_29625 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29638 - SURFACE
      ?auto_29639 - SURFACE
      ?auto_29640 - SURFACE
      ?auto_29641 - SURFACE
    )
    :vars
    (
      ?auto_29650 - HOIST
      ?auto_29651 - PLACE
      ?auto_29644 - PLACE
      ?auto_29643 - HOIST
      ?auto_29646 - SURFACE
      ?auto_29645 - PLACE
      ?auto_29652 - HOIST
      ?auto_29649 - SURFACE
      ?auto_29642 - TRUCK
      ?auto_29648 - PLACE
      ?auto_29647 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29650 ?auto_29651 ) ( IS-CRATE ?auto_29641 ) ( not ( = ?auto_29640 ?auto_29641 ) ) ( not ( = ?auto_29639 ?auto_29640 ) ) ( not ( = ?auto_29639 ?auto_29641 ) ) ( not ( = ?auto_29644 ?auto_29651 ) ) ( HOIST-AT ?auto_29643 ?auto_29644 ) ( not ( = ?auto_29650 ?auto_29643 ) ) ( AVAILABLE ?auto_29643 ) ( SURFACE-AT ?auto_29641 ?auto_29644 ) ( ON ?auto_29641 ?auto_29646 ) ( CLEAR ?auto_29641 ) ( not ( = ?auto_29640 ?auto_29646 ) ) ( not ( = ?auto_29641 ?auto_29646 ) ) ( not ( = ?auto_29639 ?auto_29646 ) ) ( IS-CRATE ?auto_29640 ) ( not ( = ?auto_29645 ?auto_29651 ) ) ( not ( = ?auto_29644 ?auto_29645 ) ) ( HOIST-AT ?auto_29652 ?auto_29645 ) ( not ( = ?auto_29650 ?auto_29652 ) ) ( not ( = ?auto_29643 ?auto_29652 ) ) ( AVAILABLE ?auto_29652 ) ( SURFACE-AT ?auto_29640 ?auto_29645 ) ( ON ?auto_29640 ?auto_29649 ) ( CLEAR ?auto_29640 ) ( not ( = ?auto_29640 ?auto_29649 ) ) ( not ( = ?auto_29641 ?auto_29649 ) ) ( not ( = ?auto_29639 ?auto_29649 ) ) ( not ( = ?auto_29646 ?auto_29649 ) ) ( SURFACE-AT ?auto_29638 ?auto_29651 ) ( CLEAR ?auto_29638 ) ( IS-CRATE ?auto_29639 ) ( not ( = ?auto_29638 ?auto_29639 ) ) ( not ( = ?auto_29640 ?auto_29638 ) ) ( not ( = ?auto_29641 ?auto_29638 ) ) ( not ( = ?auto_29646 ?auto_29638 ) ) ( not ( = ?auto_29649 ?auto_29638 ) ) ( AVAILABLE ?auto_29650 ) ( TRUCK-AT ?auto_29642 ?auto_29648 ) ( not ( = ?auto_29648 ?auto_29651 ) ) ( not ( = ?auto_29644 ?auto_29648 ) ) ( not ( = ?auto_29645 ?auto_29648 ) ) ( HOIST-AT ?auto_29647 ?auto_29648 ) ( LIFTING ?auto_29647 ?auto_29639 ) ( not ( = ?auto_29650 ?auto_29647 ) ) ( not ( = ?auto_29643 ?auto_29647 ) ) ( not ( = ?auto_29652 ?auto_29647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29639 ?auto_29640 ?auto_29641 )
      ( MAKE-3CRATE-VERIFY ?auto_29638 ?auto_29639 ?auto_29640 ?auto_29641 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29653 - SURFACE
      ?auto_29654 - SURFACE
      ?auto_29655 - SURFACE
      ?auto_29656 - SURFACE
      ?auto_29657 - SURFACE
    )
    :vars
    (
      ?auto_29666 - HOIST
      ?auto_29667 - PLACE
      ?auto_29660 - PLACE
      ?auto_29659 - HOIST
      ?auto_29662 - SURFACE
      ?auto_29661 - PLACE
      ?auto_29668 - HOIST
      ?auto_29665 - SURFACE
      ?auto_29658 - TRUCK
      ?auto_29664 - PLACE
      ?auto_29663 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29666 ?auto_29667 ) ( IS-CRATE ?auto_29657 ) ( not ( = ?auto_29656 ?auto_29657 ) ) ( not ( = ?auto_29655 ?auto_29656 ) ) ( not ( = ?auto_29655 ?auto_29657 ) ) ( not ( = ?auto_29660 ?auto_29667 ) ) ( HOIST-AT ?auto_29659 ?auto_29660 ) ( not ( = ?auto_29666 ?auto_29659 ) ) ( AVAILABLE ?auto_29659 ) ( SURFACE-AT ?auto_29657 ?auto_29660 ) ( ON ?auto_29657 ?auto_29662 ) ( CLEAR ?auto_29657 ) ( not ( = ?auto_29656 ?auto_29662 ) ) ( not ( = ?auto_29657 ?auto_29662 ) ) ( not ( = ?auto_29655 ?auto_29662 ) ) ( IS-CRATE ?auto_29656 ) ( not ( = ?auto_29661 ?auto_29667 ) ) ( not ( = ?auto_29660 ?auto_29661 ) ) ( HOIST-AT ?auto_29668 ?auto_29661 ) ( not ( = ?auto_29666 ?auto_29668 ) ) ( not ( = ?auto_29659 ?auto_29668 ) ) ( AVAILABLE ?auto_29668 ) ( SURFACE-AT ?auto_29656 ?auto_29661 ) ( ON ?auto_29656 ?auto_29665 ) ( CLEAR ?auto_29656 ) ( not ( = ?auto_29656 ?auto_29665 ) ) ( not ( = ?auto_29657 ?auto_29665 ) ) ( not ( = ?auto_29655 ?auto_29665 ) ) ( not ( = ?auto_29662 ?auto_29665 ) ) ( SURFACE-AT ?auto_29654 ?auto_29667 ) ( CLEAR ?auto_29654 ) ( IS-CRATE ?auto_29655 ) ( not ( = ?auto_29654 ?auto_29655 ) ) ( not ( = ?auto_29656 ?auto_29654 ) ) ( not ( = ?auto_29657 ?auto_29654 ) ) ( not ( = ?auto_29662 ?auto_29654 ) ) ( not ( = ?auto_29665 ?auto_29654 ) ) ( AVAILABLE ?auto_29666 ) ( TRUCK-AT ?auto_29658 ?auto_29664 ) ( not ( = ?auto_29664 ?auto_29667 ) ) ( not ( = ?auto_29660 ?auto_29664 ) ) ( not ( = ?auto_29661 ?auto_29664 ) ) ( HOIST-AT ?auto_29663 ?auto_29664 ) ( LIFTING ?auto_29663 ?auto_29655 ) ( not ( = ?auto_29666 ?auto_29663 ) ) ( not ( = ?auto_29659 ?auto_29663 ) ) ( not ( = ?auto_29668 ?auto_29663 ) ) ( ON ?auto_29654 ?auto_29653 ) ( not ( = ?auto_29653 ?auto_29654 ) ) ( not ( = ?auto_29653 ?auto_29655 ) ) ( not ( = ?auto_29653 ?auto_29656 ) ) ( not ( = ?auto_29653 ?auto_29657 ) ) ( not ( = ?auto_29653 ?auto_29662 ) ) ( not ( = ?auto_29653 ?auto_29665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29655 ?auto_29656 ?auto_29657 )
      ( MAKE-4CRATE-VERIFY ?auto_29653 ?auto_29654 ?auto_29655 ?auto_29656 ?auto_29657 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29669 - SURFACE
      ?auto_29670 - SURFACE
    )
    :vars
    (
      ?auto_29680 - HOIST
      ?auto_29682 - PLACE
      ?auto_29671 - SURFACE
      ?auto_29674 - PLACE
      ?auto_29673 - HOIST
      ?auto_29676 - SURFACE
      ?auto_29675 - PLACE
      ?auto_29683 - HOIST
      ?auto_29679 - SURFACE
      ?auto_29681 - SURFACE
      ?auto_29672 - TRUCK
      ?auto_29678 - PLACE
      ?auto_29677 - HOIST
      ?auto_29684 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29680 ?auto_29682 ) ( IS-CRATE ?auto_29670 ) ( not ( = ?auto_29669 ?auto_29670 ) ) ( not ( = ?auto_29671 ?auto_29669 ) ) ( not ( = ?auto_29671 ?auto_29670 ) ) ( not ( = ?auto_29674 ?auto_29682 ) ) ( HOIST-AT ?auto_29673 ?auto_29674 ) ( not ( = ?auto_29680 ?auto_29673 ) ) ( AVAILABLE ?auto_29673 ) ( SURFACE-AT ?auto_29670 ?auto_29674 ) ( ON ?auto_29670 ?auto_29676 ) ( CLEAR ?auto_29670 ) ( not ( = ?auto_29669 ?auto_29676 ) ) ( not ( = ?auto_29670 ?auto_29676 ) ) ( not ( = ?auto_29671 ?auto_29676 ) ) ( IS-CRATE ?auto_29669 ) ( not ( = ?auto_29675 ?auto_29682 ) ) ( not ( = ?auto_29674 ?auto_29675 ) ) ( HOIST-AT ?auto_29683 ?auto_29675 ) ( not ( = ?auto_29680 ?auto_29683 ) ) ( not ( = ?auto_29673 ?auto_29683 ) ) ( AVAILABLE ?auto_29683 ) ( SURFACE-AT ?auto_29669 ?auto_29675 ) ( ON ?auto_29669 ?auto_29679 ) ( CLEAR ?auto_29669 ) ( not ( = ?auto_29669 ?auto_29679 ) ) ( not ( = ?auto_29670 ?auto_29679 ) ) ( not ( = ?auto_29671 ?auto_29679 ) ) ( not ( = ?auto_29676 ?auto_29679 ) ) ( SURFACE-AT ?auto_29681 ?auto_29682 ) ( CLEAR ?auto_29681 ) ( IS-CRATE ?auto_29671 ) ( not ( = ?auto_29681 ?auto_29671 ) ) ( not ( = ?auto_29669 ?auto_29681 ) ) ( not ( = ?auto_29670 ?auto_29681 ) ) ( not ( = ?auto_29676 ?auto_29681 ) ) ( not ( = ?auto_29679 ?auto_29681 ) ) ( AVAILABLE ?auto_29680 ) ( TRUCK-AT ?auto_29672 ?auto_29678 ) ( not ( = ?auto_29678 ?auto_29682 ) ) ( not ( = ?auto_29674 ?auto_29678 ) ) ( not ( = ?auto_29675 ?auto_29678 ) ) ( HOIST-AT ?auto_29677 ?auto_29678 ) ( not ( = ?auto_29680 ?auto_29677 ) ) ( not ( = ?auto_29673 ?auto_29677 ) ) ( not ( = ?auto_29683 ?auto_29677 ) ) ( AVAILABLE ?auto_29677 ) ( SURFACE-AT ?auto_29671 ?auto_29678 ) ( ON ?auto_29671 ?auto_29684 ) ( CLEAR ?auto_29671 ) ( not ( = ?auto_29669 ?auto_29684 ) ) ( not ( = ?auto_29670 ?auto_29684 ) ) ( not ( = ?auto_29671 ?auto_29684 ) ) ( not ( = ?auto_29676 ?auto_29684 ) ) ( not ( = ?auto_29679 ?auto_29684 ) ) ( not ( = ?auto_29681 ?auto_29684 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29677 ?auto_29671 ?auto_29684 ?auto_29678 )
      ( MAKE-2CRATE ?auto_29671 ?auto_29669 ?auto_29670 )
      ( MAKE-1CRATE-VERIFY ?auto_29669 ?auto_29670 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29685 - SURFACE
      ?auto_29686 - SURFACE
      ?auto_29687 - SURFACE
    )
    :vars
    (
      ?auto_29694 - HOIST
      ?auto_29692 - PLACE
      ?auto_29700 - PLACE
      ?auto_29688 - HOIST
      ?auto_29690 - SURFACE
      ?auto_29696 - PLACE
      ?auto_29695 - HOIST
      ?auto_29699 - SURFACE
      ?auto_29698 - SURFACE
      ?auto_29691 - TRUCK
      ?auto_29693 - PLACE
      ?auto_29689 - HOIST
      ?auto_29697 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29694 ?auto_29692 ) ( IS-CRATE ?auto_29687 ) ( not ( = ?auto_29686 ?auto_29687 ) ) ( not ( = ?auto_29685 ?auto_29686 ) ) ( not ( = ?auto_29685 ?auto_29687 ) ) ( not ( = ?auto_29700 ?auto_29692 ) ) ( HOIST-AT ?auto_29688 ?auto_29700 ) ( not ( = ?auto_29694 ?auto_29688 ) ) ( AVAILABLE ?auto_29688 ) ( SURFACE-AT ?auto_29687 ?auto_29700 ) ( ON ?auto_29687 ?auto_29690 ) ( CLEAR ?auto_29687 ) ( not ( = ?auto_29686 ?auto_29690 ) ) ( not ( = ?auto_29687 ?auto_29690 ) ) ( not ( = ?auto_29685 ?auto_29690 ) ) ( IS-CRATE ?auto_29686 ) ( not ( = ?auto_29696 ?auto_29692 ) ) ( not ( = ?auto_29700 ?auto_29696 ) ) ( HOIST-AT ?auto_29695 ?auto_29696 ) ( not ( = ?auto_29694 ?auto_29695 ) ) ( not ( = ?auto_29688 ?auto_29695 ) ) ( AVAILABLE ?auto_29695 ) ( SURFACE-AT ?auto_29686 ?auto_29696 ) ( ON ?auto_29686 ?auto_29699 ) ( CLEAR ?auto_29686 ) ( not ( = ?auto_29686 ?auto_29699 ) ) ( not ( = ?auto_29687 ?auto_29699 ) ) ( not ( = ?auto_29685 ?auto_29699 ) ) ( not ( = ?auto_29690 ?auto_29699 ) ) ( SURFACE-AT ?auto_29698 ?auto_29692 ) ( CLEAR ?auto_29698 ) ( IS-CRATE ?auto_29685 ) ( not ( = ?auto_29698 ?auto_29685 ) ) ( not ( = ?auto_29686 ?auto_29698 ) ) ( not ( = ?auto_29687 ?auto_29698 ) ) ( not ( = ?auto_29690 ?auto_29698 ) ) ( not ( = ?auto_29699 ?auto_29698 ) ) ( AVAILABLE ?auto_29694 ) ( TRUCK-AT ?auto_29691 ?auto_29693 ) ( not ( = ?auto_29693 ?auto_29692 ) ) ( not ( = ?auto_29700 ?auto_29693 ) ) ( not ( = ?auto_29696 ?auto_29693 ) ) ( HOIST-AT ?auto_29689 ?auto_29693 ) ( not ( = ?auto_29694 ?auto_29689 ) ) ( not ( = ?auto_29688 ?auto_29689 ) ) ( not ( = ?auto_29695 ?auto_29689 ) ) ( AVAILABLE ?auto_29689 ) ( SURFACE-AT ?auto_29685 ?auto_29693 ) ( ON ?auto_29685 ?auto_29697 ) ( CLEAR ?auto_29685 ) ( not ( = ?auto_29686 ?auto_29697 ) ) ( not ( = ?auto_29687 ?auto_29697 ) ) ( not ( = ?auto_29685 ?auto_29697 ) ) ( not ( = ?auto_29690 ?auto_29697 ) ) ( not ( = ?auto_29699 ?auto_29697 ) ) ( not ( = ?auto_29698 ?auto_29697 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29686 ?auto_29687 )
      ( MAKE-2CRATE-VERIFY ?auto_29685 ?auto_29686 ?auto_29687 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29701 - SURFACE
      ?auto_29702 - SURFACE
      ?auto_29703 - SURFACE
      ?auto_29704 - SURFACE
    )
    :vars
    (
      ?auto_29708 - HOIST
      ?auto_29712 - PLACE
      ?auto_29709 - PLACE
      ?auto_29713 - HOIST
      ?auto_29707 - SURFACE
      ?auto_29715 - PLACE
      ?auto_29710 - HOIST
      ?auto_29705 - SURFACE
      ?auto_29711 - TRUCK
      ?auto_29716 - PLACE
      ?auto_29714 - HOIST
      ?auto_29706 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29708 ?auto_29712 ) ( IS-CRATE ?auto_29704 ) ( not ( = ?auto_29703 ?auto_29704 ) ) ( not ( = ?auto_29702 ?auto_29703 ) ) ( not ( = ?auto_29702 ?auto_29704 ) ) ( not ( = ?auto_29709 ?auto_29712 ) ) ( HOIST-AT ?auto_29713 ?auto_29709 ) ( not ( = ?auto_29708 ?auto_29713 ) ) ( AVAILABLE ?auto_29713 ) ( SURFACE-AT ?auto_29704 ?auto_29709 ) ( ON ?auto_29704 ?auto_29707 ) ( CLEAR ?auto_29704 ) ( not ( = ?auto_29703 ?auto_29707 ) ) ( not ( = ?auto_29704 ?auto_29707 ) ) ( not ( = ?auto_29702 ?auto_29707 ) ) ( IS-CRATE ?auto_29703 ) ( not ( = ?auto_29715 ?auto_29712 ) ) ( not ( = ?auto_29709 ?auto_29715 ) ) ( HOIST-AT ?auto_29710 ?auto_29715 ) ( not ( = ?auto_29708 ?auto_29710 ) ) ( not ( = ?auto_29713 ?auto_29710 ) ) ( AVAILABLE ?auto_29710 ) ( SURFACE-AT ?auto_29703 ?auto_29715 ) ( ON ?auto_29703 ?auto_29705 ) ( CLEAR ?auto_29703 ) ( not ( = ?auto_29703 ?auto_29705 ) ) ( not ( = ?auto_29704 ?auto_29705 ) ) ( not ( = ?auto_29702 ?auto_29705 ) ) ( not ( = ?auto_29707 ?auto_29705 ) ) ( SURFACE-AT ?auto_29701 ?auto_29712 ) ( CLEAR ?auto_29701 ) ( IS-CRATE ?auto_29702 ) ( not ( = ?auto_29701 ?auto_29702 ) ) ( not ( = ?auto_29703 ?auto_29701 ) ) ( not ( = ?auto_29704 ?auto_29701 ) ) ( not ( = ?auto_29707 ?auto_29701 ) ) ( not ( = ?auto_29705 ?auto_29701 ) ) ( AVAILABLE ?auto_29708 ) ( TRUCK-AT ?auto_29711 ?auto_29716 ) ( not ( = ?auto_29716 ?auto_29712 ) ) ( not ( = ?auto_29709 ?auto_29716 ) ) ( not ( = ?auto_29715 ?auto_29716 ) ) ( HOIST-AT ?auto_29714 ?auto_29716 ) ( not ( = ?auto_29708 ?auto_29714 ) ) ( not ( = ?auto_29713 ?auto_29714 ) ) ( not ( = ?auto_29710 ?auto_29714 ) ) ( AVAILABLE ?auto_29714 ) ( SURFACE-AT ?auto_29702 ?auto_29716 ) ( ON ?auto_29702 ?auto_29706 ) ( CLEAR ?auto_29702 ) ( not ( = ?auto_29703 ?auto_29706 ) ) ( not ( = ?auto_29704 ?auto_29706 ) ) ( not ( = ?auto_29702 ?auto_29706 ) ) ( not ( = ?auto_29707 ?auto_29706 ) ) ( not ( = ?auto_29705 ?auto_29706 ) ) ( not ( = ?auto_29701 ?auto_29706 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29702 ?auto_29703 ?auto_29704 )
      ( MAKE-3CRATE-VERIFY ?auto_29701 ?auto_29702 ?auto_29703 ?auto_29704 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29717 - SURFACE
      ?auto_29718 - SURFACE
      ?auto_29719 - SURFACE
      ?auto_29720 - SURFACE
      ?auto_29721 - SURFACE
    )
    :vars
    (
      ?auto_29725 - HOIST
      ?auto_29729 - PLACE
      ?auto_29726 - PLACE
      ?auto_29730 - HOIST
      ?auto_29724 - SURFACE
      ?auto_29732 - PLACE
      ?auto_29727 - HOIST
      ?auto_29722 - SURFACE
      ?auto_29728 - TRUCK
      ?auto_29733 - PLACE
      ?auto_29731 - HOIST
      ?auto_29723 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29725 ?auto_29729 ) ( IS-CRATE ?auto_29721 ) ( not ( = ?auto_29720 ?auto_29721 ) ) ( not ( = ?auto_29719 ?auto_29720 ) ) ( not ( = ?auto_29719 ?auto_29721 ) ) ( not ( = ?auto_29726 ?auto_29729 ) ) ( HOIST-AT ?auto_29730 ?auto_29726 ) ( not ( = ?auto_29725 ?auto_29730 ) ) ( AVAILABLE ?auto_29730 ) ( SURFACE-AT ?auto_29721 ?auto_29726 ) ( ON ?auto_29721 ?auto_29724 ) ( CLEAR ?auto_29721 ) ( not ( = ?auto_29720 ?auto_29724 ) ) ( not ( = ?auto_29721 ?auto_29724 ) ) ( not ( = ?auto_29719 ?auto_29724 ) ) ( IS-CRATE ?auto_29720 ) ( not ( = ?auto_29732 ?auto_29729 ) ) ( not ( = ?auto_29726 ?auto_29732 ) ) ( HOIST-AT ?auto_29727 ?auto_29732 ) ( not ( = ?auto_29725 ?auto_29727 ) ) ( not ( = ?auto_29730 ?auto_29727 ) ) ( AVAILABLE ?auto_29727 ) ( SURFACE-AT ?auto_29720 ?auto_29732 ) ( ON ?auto_29720 ?auto_29722 ) ( CLEAR ?auto_29720 ) ( not ( = ?auto_29720 ?auto_29722 ) ) ( not ( = ?auto_29721 ?auto_29722 ) ) ( not ( = ?auto_29719 ?auto_29722 ) ) ( not ( = ?auto_29724 ?auto_29722 ) ) ( SURFACE-AT ?auto_29718 ?auto_29729 ) ( CLEAR ?auto_29718 ) ( IS-CRATE ?auto_29719 ) ( not ( = ?auto_29718 ?auto_29719 ) ) ( not ( = ?auto_29720 ?auto_29718 ) ) ( not ( = ?auto_29721 ?auto_29718 ) ) ( not ( = ?auto_29724 ?auto_29718 ) ) ( not ( = ?auto_29722 ?auto_29718 ) ) ( AVAILABLE ?auto_29725 ) ( TRUCK-AT ?auto_29728 ?auto_29733 ) ( not ( = ?auto_29733 ?auto_29729 ) ) ( not ( = ?auto_29726 ?auto_29733 ) ) ( not ( = ?auto_29732 ?auto_29733 ) ) ( HOIST-AT ?auto_29731 ?auto_29733 ) ( not ( = ?auto_29725 ?auto_29731 ) ) ( not ( = ?auto_29730 ?auto_29731 ) ) ( not ( = ?auto_29727 ?auto_29731 ) ) ( AVAILABLE ?auto_29731 ) ( SURFACE-AT ?auto_29719 ?auto_29733 ) ( ON ?auto_29719 ?auto_29723 ) ( CLEAR ?auto_29719 ) ( not ( = ?auto_29720 ?auto_29723 ) ) ( not ( = ?auto_29721 ?auto_29723 ) ) ( not ( = ?auto_29719 ?auto_29723 ) ) ( not ( = ?auto_29724 ?auto_29723 ) ) ( not ( = ?auto_29722 ?auto_29723 ) ) ( not ( = ?auto_29718 ?auto_29723 ) ) ( ON ?auto_29718 ?auto_29717 ) ( not ( = ?auto_29717 ?auto_29718 ) ) ( not ( = ?auto_29717 ?auto_29719 ) ) ( not ( = ?auto_29717 ?auto_29720 ) ) ( not ( = ?auto_29717 ?auto_29721 ) ) ( not ( = ?auto_29717 ?auto_29724 ) ) ( not ( = ?auto_29717 ?auto_29722 ) ) ( not ( = ?auto_29717 ?auto_29723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29719 ?auto_29720 ?auto_29721 )
      ( MAKE-4CRATE-VERIFY ?auto_29717 ?auto_29718 ?auto_29719 ?auto_29720 ?auto_29721 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29734 - SURFACE
      ?auto_29735 - SURFACE
    )
    :vars
    (
      ?auto_29741 - HOIST
      ?auto_29745 - PLACE
      ?auto_29737 - SURFACE
      ?auto_29742 - PLACE
      ?auto_29746 - HOIST
      ?auto_29740 - SURFACE
      ?auto_29748 - PLACE
      ?auto_29743 - HOIST
      ?auto_29736 - SURFACE
      ?auto_29739 - SURFACE
      ?auto_29749 - PLACE
      ?auto_29747 - HOIST
      ?auto_29738 - SURFACE
      ?auto_29744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29741 ?auto_29745 ) ( IS-CRATE ?auto_29735 ) ( not ( = ?auto_29734 ?auto_29735 ) ) ( not ( = ?auto_29737 ?auto_29734 ) ) ( not ( = ?auto_29737 ?auto_29735 ) ) ( not ( = ?auto_29742 ?auto_29745 ) ) ( HOIST-AT ?auto_29746 ?auto_29742 ) ( not ( = ?auto_29741 ?auto_29746 ) ) ( AVAILABLE ?auto_29746 ) ( SURFACE-AT ?auto_29735 ?auto_29742 ) ( ON ?auto_29735 ?auto_29740 ) ( CLEAR ?auto_29735 ) ( not ( = ?auto_29734 ?auto_29740 ) ) ( not ( = ?auto_29735 ?auto_29740 ) ) ( not ( = ?auto_29737 ?auto_29740 ) ) ( IS-CRATE ?auto_29734 ) ( not ( = ?auto_29748 ?auto_29745 ) ) ( not ( = ?auto_29742 ?auto_29748 ) ) ( HOIST-AT ?auto_29743 ?auto_29748 ) ( not ( = ?auto_29741 ?auto_29743 ) ) ( not ( = ?auto_29746 ?auto_29743 ) ) ( AVAILABLE ?auto_29743 ) ( SURFACE-AT ?auto_29734 ?auto_29748 ) ( ON ?auto_29734 ?auto_29736 ) ( CLEAR ?auto_29734 ) ( not ( = ?auto_29734 ?auto_29736 ) ) ( not ( = ?auto_29735 ?auto_29736 ) ) ( not ( = ?auto_29737 ?auto_29736 ) ) ( not ( = ?auto_29740 ?auto_29736 ) ) ( SURFACE-AT ?auto_29739 ?auto_29745 ) ( CLEAR ?auto_29739 ) ( IS-CRATE ?auto_29737 ) ( not ( = ?auto_29739 ?auto_29737 ) ) ( not ( = ?auto_29734 ?auto_29739 ) ) ( not ( = ?auto_29735 ?auto_29739 ) ) ( not ( = ?auto_29740 ?auto_29739 ) ) ( not ( = ?auto_29736 ?auto_29739 ) ) ( AVAILABLE ?auto_29741 ) ( not ( = ?auto_29749 ?auto_29745 ) ) ( not ( = ?auto_29742 ?auto_29749 ) ) ( not ( = ?auto_29748 ?auto_29749 ) ) ( HOIST-AT ?auto_29747 ?auto_29749 ) ( not ( = ?auto_29741 ?auto_29747 ) ) ( not ( = ?auto_29746 ?auto_29747 ) ) ( not ( = ?auto_29743 ?auto_29747 ) ) ( AVAILABLE ?auto_29747 ) ( SURFACE-AT ?auto_29737 ?auto_29749 ) ( ON ?auto_29737 ?auto_29738 ) ( CLEAR ?auto_29737 ) ( not ( = ?auto_29734 ?auto_29738 ) ) ( not ( = ?auto_29735 ?auto_29738 ) ) ( not ( = ?auto_29737 ?auto_29738 ) ) ( not ( = ?auto_29740 ?auto_29738 ) ) ( not ( = ?auto_29736 ?auto_29738 ) ) ( not ( = ?auto_29739 ?auto_29738 ) ) ( TRUCK-AT ?auto_29744 ?auto_29745 ) )
    :subtasks
    ( ( !DRIVE ?auto_29744 ?auto_29745 ?auto_29749 )
      ( MAKE-2CRATE ?auto_29737 ?auto_29734 ?auto_29735 )
      ( MAKE-1CRATE-VERIFY ?auto_29734 ?auto_29735 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29750 - SURFACE
      ?auto_29751 - SURFACE
      ?auto_29752 - SURFACE
    )
    :vars
    (
      ?auto_29756 - HOIST
      ?auto_29761 - PLACE
      ?auto_29759 - PLACE
      ?auto_29760 - HOIST
      ?auto_29764 - SURFACE
      ?auto_29765 - PLACE
      ?auto_29753 - HOIST
      ?auto_29755 - SURFACE
      ?auto_29762 - SURFACE
      ?auto_29757 - PLACE
      ?auto_29754 - HOIST
      ?auto_29763 - SURFACE
      ?auto_29758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29756 ?auto_29761 ) ( IS-CRATE ?auto_29752 ) ( not ( = ?auto_29751 ?auto_29752 ) ) ( not ( = ?auto_29750 ?auto_29751 ) ) ( not ( = ?auto_29750 ?auto_29752 ) ) ( not ( = ?auto_29759 ?auto_29761 ) ) ( HOIST-AT ?auto_29760 ?auto_29759 ) ( not ( = ?auto_29756 ?auto_29760 ) ) ( AVAILABLE ?auto_29760 ) ( SURFACE-AT ?auto_29752 ?auto_29759 ) ( ON ?auto_29752 ?auto_29764 ) ( CLEAR ?auto_29752 ) ( not ( = ?auto_29751 ?auto_29764 ) ) ( not ( = ?auto_29752 ?auto_29764 ) ) ( not ( = ?auto_29750 ?auto_29764 ) ) ( IS-CRATE ?auto_29751 ) ( not ( = ?auto_29765 ?auto_29761 ) ) ( not ( = ?auto_29759 ?auto_29765 ) ) ( HOIST-AT ?auto_29753 ?auto_29765 ) ( not ( = ?auto_29756 ?auto_29753 ) ) ( not ( = ?auto_29760 ?auto_29753 ) ) ( AVAILABLE ?auto_29753 ) ( SURFACE-AT ?auto_29751 ?auto_29765 ) ( ON ?auto_29751 ?auto_29755 ) ( CLEAR ?auto_29751 ) ( not ( = ?auto_29751 ?auto_29755 ) ) ( not ( = ?auto_29752 ?auto_29755 ) ) ( not ( = ?auto_29750 ?auto_29755 ) ) ( not ( = ?auto_29764 ?auto_29755 ) ) ( SURFACE-AT ?auto_29762 ?auto_29761 ) ( CLEAR ?auto_29762 ) ( IS-CRATE ?auto_29750 ) ( not ( = ?auto_29762 ?auto_29750 ) ) ( not ( = ?auto_29751 ?auto_29762 ) ) ( not ( = ?auto_29752 ?auto_29762 ) ) ( not ( = ?auto_29764 ?auto_29762 ) ) ( not ( = ?auto_29755 ?auto_29762 ) ) ( AVAILABLE ?auto_29756 ) ( not ( = ?auto_29757 ?auto_29761 ) ) ( not ( = ?auto_29759 ?auto_29757 ) ) ( not ( = ?auto_29765 ?auto_29757 ) ) ( HOIST-AT ?auto_29754 ?auto_29757 ) ( not ( = ?auto_29756 ?auto_29754 ) ) ( not ( = ?auto_29760 ?auto_29754 ) ) ( not ( = ?auto_29753 ?auto_29754 ) ) ( AVAILABLE ?auto_29754 ) ( SURFACE-AT ?auto_29750 ?auto_29757 ) ( ON ?auto_29750 ?auto_29763 ) ( CLEAR ?auto_29750 ) ( not ( = ?auto_29751 ?auto_29763 ) ) ( not ( = ?auto_29752 ?auto_29763 ) ) ( not ( = ?auto_29750 ?auto_29763 ) ) ( not ( = ?auto_29764 ?auto_29763 ) ) ( not ( = ?auto_29755 ?auto_29763 ) ) ( not ( = ?auto_29762 ?auto_29763 ) ) ( TRUCK-AT ?auto_29758 ?auto_29761 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29751 ?auto_29752 )
      ( MAKE-2CRATE-VERIFY ?auto_29750 ?auto_29751 ?auto_29752 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29766 - SURFACE
      ?auto_29767 - SURFACE
      ?auto_29768 - SURFACE
      ?auto_29769 - SURFACE
    )
    :vars
    (
      ?auto_29778 - HOIST
      ?auto_29773 - PLACE
      ?auto_29777 - PLACE
      ?auto_29775 - HOIST
      ?auto_29772 - SURFACE
      ?auto_29776 - PLACE
      ?auto_29779 - HOIST
      ?auto_29771 - SURFACE
      ?auto_29780 - PLACE
      ?auto_29781 - HOIST
      ?auto_29770 - SURFACE
      ?auto_29774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29778 ?auto_29773 ) ( IS-CRATE ?auto_29769 ) ( not ( = ?auto_29768 ?auto_29769 ) ) ( not ( = ?auto_29767 ?auto_29768 ) ) ( not ( = ?auto_29767 ?auto_29769 ) ) ( not ( = ?auto_29777 ?auto_29773 ) ) ( HOIST-AT ?auto_29775 ?auto_29777 ) ( not ( = ?auto_29778 ?auto_29775 ) ) ( AVAILABLE ?auto_29775 ) ( SURFACE-AT ?auto_29769 ?auto_29777 ) ( ON ?auto_29769 ?auto_29772 ) ( CLEAR ?auto_29769 ) ( not ( = ?auto_29768 ?auto_29772 ) ) ( not ( = ?auto_29769 ?auto_29772 ) ) ( not ( = ?auto_29767 ?auto_29772 ) ) ( IS-CRATE ?auto_29768 ) ( not ( = ?auto_29776 ?auto_29773 ) ) ( not ( = ?auto_29777 ?auto_29776 ) ) ( HOIST-AT ?auto_29779 ?auto_29776 ) ( not ( = ?auto_29778 ?auto_29779 ) ) ( not ( = ?auto_29775 ?auto_29779 ) ) ( AVAILABLE ?auto_29779 ) ( SURFACE-AT ?auto_29768 ?auto_29776 ) ( ON ?auto_29768 ?auto_29771 ) ( CLEAR ?auto_29768 ) ( not ( = ?auto_29768 ?auto_29771 ) ) ( not ( = ?auto_29769 ?auto_29771 ) ) ( not ( = ?auto_29767 ?auto_29771 ) ) ( not ( = ?auto_29772 ?auto_29771 ) ) ( SURFACE-AT ?auto_29766 ?auto_29773 ) ( CLEAR ?auto_29766 ) ( IS-CRATE ?auto_29767 ) ( not ( = ?auto_29766 ?auto_29767 ) ) ( not ( = ?auto_29768 ?auto_29766 ) ) ( not ( = ?auto_29769 ?auto_29766 ) ) ( not ( = ?auto_29772 ?auto_29766 ) ) ( not ( = ?auto_29771 ?auto_29766 ) ) ( AVAILABLE ?auto_29778 ) ( not ( = ?auto_29780 ?auto_29773 ) ) ( not ( = ?auto_29777 ?auto_29780 ) ) ( not ( = ?auto_29776 ?auto_29780 ) ) ( HOIST-AT ?auto_29781 ?auto_29780 ) ( not ( = ?auto_29778 ?auto_29781 ) ) ( not ( = ?auto_29775 ?auto_29781 ) ) ( not ( = ?auto_29779 ?auto_29781 ) ) ( AVAILABLE ?auto_29781 ) ( SURFACE-AT ?auto_29767 ?auto_29780 ) ( ON ?auto_29767 ?auto_29770 ) ( CLEAR ?auto_29767 ) ( not ( = ?auto_29768 ?auto_29770 ) ) ( not ( = ?auto_29769 ?auto_29770 ) ) ( not ( = ?auto_29767 ?auto_29770 ) ) ( not ( = ?auto_29772 ?auto_29770 ) ) ( not ( = ?auto_29771 ?auto_29770 ) ) ( not ( = ?auto_29766 ?auto_29770 ) ) ( TRUCK-AT ?auto_29774 ?auto_29773 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29767 ?auto_29768 ?auto_29769 )
      ( MAKE-3CRATE-VERIFY ?auto_29766 ?auto_29767 ?auto_29768 ?auto_29769 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29782 - SURFACE
      ?auto_29783 - SURFACE
      ?auto_29784 - SURFACE
      ?auto_29785 - SURFACE
      ?auto_29786 - SURFACE
    )
    :vars
    (
      ?auto_29795 - HOIST
      ?auto_29790 - PLACE
      ?auto_29794 - PLACE
      ?auto_29792 - HOIST
      ?auto_29789 - SURFACE
      ?auto_29793 - PLACE
      ?auto_29796 - HOIST
      ?auto_29788 - SURFACE
      ?auto_29797 - PLACE
      ?auto_29798 - HOIST
      ?auto_29787 - SURFACE
      ?auto_29791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29795 ?auto_29790 ) ( IS-CRATE ?auto_29786 ) ( not ( = ?auto_29785 ?auto_29786 ) ) ( not ( = ?auto_29784 ?auto_29785 ) ) ( not ( = ?auto_29784 ?auto_29786 ) ) ( not ( = ?auto_29794 ?auto_29790 ) ) ( HOIST-AT ?auto_29792 ?auto_29794 ) ( not ( = ?auto_29795 ?auto_29792 ) ) ( AVAILABLE ?auto_29792 ) ( SURFACE-AT ?auto_29786 ?auto_29794 ) ( ON ?auto_29786 ?auto_29789 ) ( CLEAR ?auto_29786 ) ( not ( = ?auto_29785 ?auto_29789 ) ) ( not ( = ?auto_29786 ?auto_29789 ) ) ( not ( = ?auto_29784 ?auto_29789 ) ) ( IS-CRATE ?auto_29785 ) ( not ( = ?auto_29793 ?auto_29790 ) ) ( not ( = ?auto_29794 ?auto_29793 ) ) ( HOIST-AT ?auto_29796 ?auto_29793 ) ( not ( = ?auto_29795 ?auto_29796 ) ) ( not ( = ?auto_29792 ?auto_29796 ) ) ( AVAILABLE ?auto_29796 ) ( SURFACE-AT ?auto_29785 ?auto_29793 ) ( ON ?auto_29785 ?auto_29788 ) ( CLEAR ?auto_29785 ) ( not ( = ?auto_29785 ?auto_29788 ) ) ( not ( = ?auto_29786 ?auto_29788 ) ) ( not ( = ?auto_29784 ?auto_29788 ) ) ( not ( = ?auto_29789 ?auto_29788 ) ) ( SURFACE-AT ?auto_29783 ?auto_29790 ) ( CLEAR ?auto_29783 ) ( IS-CRATE ?auto_29784 ) ( not ( = ?auto_29783 ?auto_29784 ) ) ( not ( = ?auto_29785 ?auto_29783 ) ) ( not ( = ?auto_29786 ?auto_29783 ) ) ( not ( = ?auto_29789 ?auto_29783 ) ) ( not ( = ?auto_29788 ?auto_29783 ) ) ( AVAILABLE ?auto_29795 ) ( not ( = ?auto_29797 ?auto_29790 ) ) ( not ( = ?auto_29794 ?auto_29797 ) ) ( not ( = ?auto_29793 ?auto_29797 ) ) ( HOIST-AT ?auto_29798 ?auto_29797 ) ( not ( = ?auto_29795 ?auto_29798 ) ) ( not ( = ?auto_29792 ?auto_29798 ) ) ( not ( = ?auto_29796 ?auto_29798 ) ) ( AVAILABLE ?auto_29798 ) ( SURFACE-AT ?auto_29784 ?auto_29797 ) ( ON ?auto_29784 ?auto_29787 ) ( CLEAR ?auto_29784 ) ( not ( = ?auto_29785 ?auto_29787 ) ) ( not ( = ?auto_29786 ?auto_29787 ) ) ( not ( = ?auto_29784 ?auto_29787 ) ) ( not ( = ?auto_29789 ?auto_29787 ) ) ( not ( = ?auto_29788 ?auto_29787 ) ) ( not ( = ?auto_29783 ?auto_29787 ) ) ( TRUCK-AT ?auto_29791 ?auto_29790 ) ( ON ?auto_29783 ?auto_29782 ) ( not ( = ?auto_29782 ?auto_29783 ) ) ( not ( = ?auto_29782 ?auto_29784 ) ) ( not ( = ?auto_29782 ?auto_29785 ) ) ( not ( = ?auto_29782 ?auto_29786 ) ) ( not ( = ?auto_29782 ?auto_29789 ) ) ( not ( = ?auto_29782 ?auto_29788 ) ) ( not ( = ?auto_29782 ?auto_29787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29784 ?auto_29785 ?auto_29786 )
      ( MAKE-4CRATE-VERIFY ?auto_29782 ?auto_29783 ?auto_29784 ?auto_29785 ?auto_29786 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29799 - SURFACE
      ?auto_29800 - SURFACE
    )
    :vars
    (
      ?auto_29810 - HOIST
      ?auto_29804 - PLACE
      ?auto_29807 - SURFACE
      ?auto_29809 - PLACE
      ?auto_29806 - HOIST
      ?auto_29803 - SURFACE
      ?auto_29808 - PLACE
      ?auto_29811 - HOIST
      ?auto_29802 - SURFACE
      ?auto_29812 - SURFACE
      ?auto_29813 - PLACE
      ?auto_29814 - HOIST
      ?auto_29801 - SURFACE
      ?auto_29805 - TRUCK
      ?auto_29815 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29810 ?auto_29804 ) ( IS-CRATE ?auto_29800 ) ( not ( = ?auto_29799 ?auto_29800 ) ) ( not ( = ?auto_29807 ?auto_29799 ) ) ( not ( = ?auto_29807 ?auto_29800 ) ) ( not ( = ?auto_29809 ?auto_29804 ) ) ( HOIST-AT ?auto_29806 ?auto_29809 ) ( not ( = ?auto_29810 ?auto_29806 ) ) ( AVAILABLE ?auto_29806 ) ( SURFACE-AT ?auto_29800 ?auto_29809 ) ( ON ?auto_29800 ?auto_29803 ) ( CLEAR ?auto_29800 ) ( not ( = ?auto_29799 ?auto_29803 ) ) ( not ( = ?auto_29800 ?auto_29803 ) ) ( not ( = ?auto_29807 ?auto_29803 ) ) ( IS-CRATE ?auto_29799 ) ( not ( = ?auto_29808 ?auto_29804 ) ) ( not ( = ?auto_29809 ?auto_29808 ) ) ( HOIST-AT ?auto_29811 ?auto_29808 ) ( not ( = ?auto_29810 ?auto_29811 ) ) ( not ( = ?auto_29806 ?auto_29811 ) ) ( AVAILABLE ?auto_29811 ) ( SURFACE-AT ?auto_29799 ?auto_29808 ) ( ON ?auto_29799 ?auto_29802 ) ( CLEAR ?auto_29799 ) ( not ( = ?auto_29799 ?auto_29802 ) ) ( not ( = ?auto_29800 ?auto_29802 ) ) ( not ( = ?auto_29807 ?auto_29802 ) ) ( not ( = ?auto_29803 ?auto_29802 ) ) ( IS-CRATE ?auto_29807 ) ( not ( = ?auto_29812 ?auto_29807 ) ) ( not ( = ?auto_29799 ?auto_29812 ) ) ( not ( = ?auto_29800 ?auto_29812 ) ) ( not ( = ?auto_29803 ?auto_29812 ) ) ( not ( = ?auto_29802 ?auto_29812 ) ) ( not ( = ?auto_29813 ?auto_29804 ) ) ( not ( = ?auto_29809 ?auto_29813 ) ) ( not ( = ?auto_29808 ?auto_29813 ) ) ( HOIST-AT ?auto_29814 ?auto_29813 ) ( not ( = ?auto_29810 ?auto_29814 ) ) ( not ( = ?auto_29806 ?auto_29814 ) ) ( not ( = ?auto_29811 ?auto_29814 ) ) ( AVAILABLE ?auto_29814 ) ( SURFACE-AT ?auto_29807 ?auto_29813 ) ( ON ?auto_29807 ?auto_29801 ) ( CLEAR ?auto_29807 ) ( not ( = ?auto_29799 ?auto_29801 ) ) ( not ( = ?auto_29800 ?auto_29801 ) ) ( not ( = ?auto_29807 ?auto_29801 ) ) ( not ( = ?auto_29803 ?auto_29801 ) ) ( not ( = ?auto_29802 ?auto_29801 ) ) ( not ( = ?auto_29812 ?auto_29801 ) ) ( TRUCK-AT ?auto_29805 ?auto_29804 ) ( SURFACE-AT ?auto_29815 ?auto_29804 ) ( CLEAR ?auto_29815 ) ( LIFTING ?auto_29810 ?auto_29812 ) ( IS-CRATE ?auto_29812 ) ( not ( = ?auto_29815 ?auto_29812 ) ) ( not ( = ?auto_29799 ?auto_29815 ) ) ( not ( = ?auto_29800 ?auto_29815 ) ) ( not ( = ?auto_29807 ?auto_29815 ) ) ( not ( = ?auto_29803 ?auto_29815 ) ) ( not ( = ?auto_29802 ?auto_29815 ) ) ( not ( = ?auto_29801 ?auto_29815 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29815 ?auto_29812 )
      ( MAKE-2CRATE ?auto_29807 ?auto_29799 ?auto_29800 )
      ( MAKE-1CRATE-VERIFY ?auto_29799 ?auto_29800 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29816 - SURFACE
      ?auto_29817 - SURFACE
      ?auto_29818 - SURFACE
    )
    :vars
    (
      ?auto_29825 - HOIST
      ?auto_29828 - PLACE
      ?auto_29821 - PLACE
      ?auto_29826 - HOIST
      ?auto_29827 - SURFACE
      ?auto_29823 - PLACE
      ?auto_29822 - HOIST
      ?auto_29829 - SURFACE
      ?auto_29820 - SURFACE
      ?auto_29831 - PLACE
      ?auto_29832 - HOIST
      ?auto_29819 - SURFACE
      ?auto_29824 - TRUCK
      ?auto_29830 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29825 ?auto_29828 ) ( IS-CRATE ?auto_29818 ) ( not ( = ?auto_29817 ?auto_29818 ) ) ( not ( = ?auto_29816 ?auto_29817 ) ) ( not ( = ?auto_29816 ?auto_29818 ) ) ( not ( = ?auto_29821 ?auto_29828 ) ) ( HOIST-AT ?auto_29826 ?auto_29821 ) ( not ( = ?auto_29825 ?auto_29826 ) ) ( AVAILABLE ?auto_29826 ) ( SURFACE-AT ?auto_29818 ?auto_29821 ) ( ON ?auto_29818 ?auto_29827 ) ( CLEAR ?auto_29818 ) ( not ( = ?auto_29817 ?auto_29827 ) ) ( not ( = ?auto_29818 ?auto_29827 ) ) ( not ( = ?auto_29816 ?auto_29827 ) ) ( IS-CRATE ?auto_29817 ) ( not ( = ?auto_29823 ?auto_29828 ) ) ( not ( = ?auto_29821 ?auto_29823 ) ) ( HOIST-AT ?auto_29822 ?auto_29823 ) ( not ( = ?auto_29825 ?auto_29822 ) ) ( not ( = ?auto_29826 ?auto_29822 ) ) ( AVAILABLE ?auto_29822 ) ( SURFACE-AT ?auto_29817 ?auto_29823 ) ( ON ?auto_29817 ?auto_29829 ) ( CLEAR ?auto_29817 ) ( not ( = ?auto_29817 ?auto_29829 ) ) ( not ( = ?auto_29818 ?auto_29829 ) ) ( not ( = ?auto_29816 ?auto_29829 ) ) ( not ( = ?auto_29827 ?auto_29829 ) ) ( IS-CRATE ?auto_29816 ) ( not ( = ?auto_29820 ?auto_29816 ) ) ( not ( = ?auto_29817 ?auto_29820 ) ) ( not ( = ?auto_29818 ?auto_29820 ) ) ( not ( = ?auto_29827 ?auto_29820 ) ) ( not ( = ?auto_29829 ?auto_29820 ) ) ( not ( = ?auto_29831 ?auto_29828 ) ) ( not ( = ?auto_29821 ?auto_29831 ) ) ( not ( = ?auto_29823 ?auto_29831 ) ) ( HOIST-AT ?auto_29832 ?auto_29831 ) ( not ( = ?auto_29825 ?auto_29832 ) ) ( not ( = ?auto_29826 ?auto_29832 ) ) ( not ( = ?auto_29822 ?auto_29832 ) ) ( AVAILABLE ?auto_29832 ) ( SURFACE-AT ?auto_29816 ?auto_29831 ) ( ON ?auto_29816 ?auto_29819 ) ( CLEAR ?auto_29816 ) ( not ( = ?auto_29817 ?auto_29819 ) ) ( not ( = ?auto_29818 ?auto_29819 ) ) ( not ( = ?auto_29816 ?auto_29819 ) ) ( not ( = ?auto_29827 ?auto_29819 ) ) ( not ( = ?auto_29829 ?auto_29819 ) ) ( not ( = ?auto_29820 ?auto_29819 ) ) ( TRUCK-AT ?auto_29824 ?auto_29828 ) ( SURFACE-AT ?auto_29830 ?auto_29828 ) ( CLEAR ?auto_29830 ) ( LIFTING ?auto_29825 ?auto_29820 ) ( IS-CRATE ?auto_29820 ) ( not ( = ?auto_29830 ?auto_29820 ) ) ( not ( = ?auto_29817 ?auto_29830 ) ) ( not ( = ?auto_29818 ?auto_29830 ) ) ( not ( = ?auto_29816 ?auto_29830 ) ) ( not ( = ?auto_29827 ?auto_29830 ) ) ( not ( = ?auto_29829 ?auto_29830 ) ) ( not ( = ?auto_29819 ?auto_29830 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29817 ?auto_29818 )
      ( MAKE-2CRATE-VERIFY ?auto_29816 ?auto_29817 ?auto_29818 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29833 - SURFACE
      ?auto_29834 - SURFACE
      ?auto_29835 - SURFACE
      ?auto_29836 - SURFACE
    )
    :vars
    (
      ?auto_29844 - HOIST
      ?auto_29847 - PLACE
      ?auto_29839 - PLACE
      ?auto_29846 - HOIST
      ?auto_29837 - SURFACE
      ?auto_29845 - PLACE
      ?auto_29843 - HOIST
      ?auto_29841 - SURFACE
      ?auto_29849 - PLACE
      ?auto_29840 - HOIST
      ?auto_29838 - SURFACE
      ?auto_29842 - TRUCK
      ?auto_29848 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29844 ?auto_29847 ) ( IS-CRATE ?auto_29836 ) ( not ( = ?auto_29835 ?auto_29836 ) ) ( not ( = ?auto_29834 ?auto_29835 ) ) ( not ( = ?auto_29834 ?auto_29836 ) ) ( not ( = ?auto_29839 ?auto_29847 ) ) ( HOIST-AT ?auto_29846 ?auto_29839 ) ( not ( = ?auto_29844 ?auto_29846 ) ) ( AVAILABLE ?auto_29846 ) ( SURFACE-AT ?auto_29836 ?auto_29839 ) ( ON ?auto_29836 ?auto_29837 ) ( CLEAR ?auto_29836 ) ( not ( = ?auto_29835 ?auto_29837 ) ) ( not ( = ?auto_29836 ?auto_29837 ) ) ( not ( = ?auto_29834 ?auto_29837 ) ) ( IS-CRATE ?auto_29835 ) ( not ( = ?auto_29845 ?auto_29847 ) ) ( not ( = ?auto_29839 ?auto_29845 ) ) ( HOIST-AT ?auto_29843 ?auto_29845 ) ( not ( = ?auto_29844 ?auto_29843 ) ) ( not ( = ?auto_29846 ?auto_29843 ) ) ( AVAILABLE ?auto_29843 ) ( SURFACE-AT ?auto_29835 ?auto_29845 ) ( ON ?auto_29835 ?auto_29841 ) ( CLEAR ?auto_29835 ) ( not ( = ?auto_29835 ?auto_29841 ) ) ( not ( = ?auto_29836 ?auto_29841 ) ) ( not ( = ?auto_29834 ?auto_29841 ) ) ( not ( = ?auto_29837 ?auto_29841 ) ) ( IS-CRATE ?auto_29834 ) ( not ( = ?auto_29833 ?auto_29834 ) ) ( not ( = ?auto_29835 ?auto_29833 ) ) ( not ( = ?auto_29836 ?auto_29833 ) ) ( not ( = ?auto_29837 ?auto_29833 ) ) ( not ( = ?auto_29841 ?auto_29833 ) ) ( not ( = ?auto_29849 ?auto_29847 ) ) ( not ( = ?auto_29839 ?auto_29849 ) ) ( not ( = ?auto_29845 ?auto_29849 ) ) ( HOIST-AT ?auto_29840 ?auto_29849 ) ( not ( = ?auto_29844 ?auto_29840 ) ) ( not ( = ?auto_29846 ?auto_29840 ) ) ( not ( = ?auto_29843 ?auto_29840 ) ) ( AVAILABLE ?auto_29840 ) ( SURFACE-AT ?auto_29834 ?auto_29849 ) ( ON ?auto_29834 ?auto_29838 ) ( CLEAR ?auto_29834 ) ( not ( = ?auto_29835 ?auto_29838 ) ) ( not ( = ?auto_29836 ?auto_29838 ) ) ( not ( = ?auto_29834 ?auto_29838 ) ) ( not ( = ?auto_29837 ?auto_29838 ) ) ( not ( = ?auto_29841 ?auto_29838 ) ) ( not ( = ?auto_29833 ?auto_29838 ) ) ( TRUCK-AT ?auto_29842 ?auto_29847 ) ( SURFACE-AT ?auto_29848 ?auto_29847 ) ( CLEAR ?auto_29848 ) ( LIFTING ?auto_29844 ?auto_29833 ) ( IS-CRATE ?auto_29833 ) ( not ( = ?auto_29848 ?auto_29833 ) ) ( not ( = ?auto_29835 ?auto_29848 ) ) ( not ( = ?auto_29836 ?auto_29848 ) ) ( not ( = ?auto_29834 ?auto_29848 ) ) ( not ( = ?auto_29837 ?auto_29848 ) ) ( not ( = ?auto_29841 ?auto_29848 ) ) ( not ( = ?auto_29838 ?auto_29848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29834 ?auto_29835 ?auto_29836 )
      ( MAKE-3CRATE-VERIFY ?auto_29833 ?auto_29834 ?auto_29835 ?auto_29836 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29850 - SURFACE
      ?auto_29851 - SURFACE
      ?auto_29852 - SURFACE
      ?auto_29853 - SURFACE
      ?auto_29854 - SURFACE
    )
    :vars
    (
      ?auto_29862 - HOIST
      ?auto_29865 - PLACE
      ?auto_29857 - PLACE
      ?auto_29864 - HOIST
      ?auto_29855 - SURFACE
      ?auto_29863 - PLACE
      ?auto_29861 - HOIST
      ?auto_29859 - SURFACE
      ?auto_29866 - PLACE
      ?auto_29858 - HOIST
      ?auto_29856 - SURFACE
      ?auto_29860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29862 ?auto_29865 ) ( IS-CRATE ?auto_29854 ) ( not ( = ?auto_29853 ?auto_29854 ) ) ( not ( = ?auto_29852 ?auto_29853 ) ) ( not ( = ?auto_29852 ?auto_29854 ) ) ( not ( = ?auto_29857 ?auto_29865 ) ) ( HOIST-AT ?auto_29864 ?auto_29857 ) ( not ( = ?auto_29862 ?auto_29864 ) ) ( AVAILABLE ?auto_29864 ) ( SURFACE-AT ?auto_29854 ?auto_29857 ) ( ON ?auto_29854 ?auto_29855 ) ( CLEAR ?auto_29854 ) ( not ( = ?auto_29853 ?auto_29855 ) ) ( not ( = ?auto_29854 ?auto_29855 ) ) ( not ( = ?auto_29852 ?auto_29855 ) ) ( IS-CRATE ?auto_29853 ) ( not ( = ?auto_29863 ?auto_29865 ) ) ( not ( = ?auto_29857 ?auto_29863 ) ) ( HOIST-AT ?auto_29861 ?auto_29863 ) ( not ( = ?auto_29862 ?auto_29861 ) ) ( not ( = ?auto_29864 ?auto_29861 ) ) ( AVAILABLE ?auto_29861 ) ( SURFACE-AT ?auto_29853 ?auto_29863 ) ( ON ?auto_29853 ?auto_29859 ) ( CLEAR ?auto_29853 ) ( not ( = ?auto_29853 ?auto_29859 ) ) ( not ( = ?auto_29854 ?auto_29859 ) ) ( not ( = ?auto_29852 ?auto_29859 ) ) ( not ( = ?auto_29855 ?auto_29859 ) ) ( IS-CRATE ?auto_29852 ) ( not ( = ?auto_29851 ?auto_29852 ) ) ( not ( = ?auto_29853 ?auto_29851 ) ) ( not ( = ?auto_29854 ?auto_29851 ) ) ( not ( = ?auto_29855 ?auto_29851 ) ) ( not ( = ?auto_29859 ?auto_29851 ) ) ( not ( = ?auto_29866 ?auto_29865 ) ) ( not ( = ?auto_29857 ?auto_29866 ) ) ( not ( = ?auto_29863 ?auto_29866 ) ) ( HOIST-AT ?auto_29858 ?auto_29866 ) ( not ( = ?auto_29862 ?auto_29858 ) ) ( not ( = ?auto_29864 ?auto_29858 ) ) ( not ( = ?auto_29861 ?auto_29858 ) ) ( AVAILABLE ?auto_29858 ) ( SURFACE-AT ?auto_29852 ?auto_29866 ) ( ON ?auto_29852 ?auto_29856 ) ( CLEAR ?auto_29852 ) ( not ( = ?auto_29853 ?auto_29856 ) ) ( not ( = ?auto_29854 ?auto_29856 ) ) ( not ( = ?auto_29852 ?auto_29856 ) ) ( not ( = ?auto_29855 ?auto_29856 ) ) ( not ( = ?auto_29859 ?auto_29856 ) ) ( not ( = ?auto_29851 ?auto_29856 ) ) ( TRUCK-AT ?auto_29860 ?auto_29865 ) ( SURFACE-AT ?auto_29850 ?auto_29865 ) ( CLEAR ?auto_29850 ) ( LIFTING ?auto_29862 ?auto_29851 ) ( IS-CRATE ?auto_29851 ) ( not ( = ?auto_29850 ?auto_29851 ) ) ( not ( = ?auto_29853 ?auto_29850 ) ) ( not ( = ?auto_29854 ?auto_29850 ) ) ( not ( = ?auto_29852 ?auto_29850 ) ) ( not ( = ?auto_29855 ?auto_29850 ) ) ( not ( = ?auto_29859 ?auto_29850 ) ) ( not ( = ?auto_29856 ?auto_29850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29852 ?auto_29853 ?auto_29854 )
      ( MAKE-4CRATE-VERIFY ?auto_29850 ?auto_29851 ?auto_29852 ?auto_29853 ?auto_29854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29867 - SURFACE
      ?auto_29868 - SURFACE
    )
    :vars
    (
      ?auto_29877 - HOIST
      ?auto_29880 - PLACE
      ?auto_29882 - SURFACE
      ?auto_29871 - PLACE
      ?auto_29879 - HOIST
      ?auto_29869 - SURFACE
      ?auto_29878 - PLACE
      ?auto_29876 - HOIST
      ?auto_29874 - SURFACE
      ?auto_29873 - SURFACE
      ?auto_29883 - PLACE
      ?auto_29872 - HOIST
      ?auto_29870 - SURFACE
      ?auto_29875 - TRUCK
      ?auto_29881 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29877 ?auto_29880 ) ( IS-CRATE ?auto_29868 ) ( not ( = ?auto_29867 ?auto_29868 ) ) ( not ( = ?auto_29882 ?auto_29867 ) ) ( not ( = ?auto_29882 ?auto_29868 ) ) ( not ( = ?auto_29871 ?auto_29880 ) ) ( HOIST-AT ?auto_29879 ?auto_29871 ) ( not ( = ?auto_29877 ?auto_29879 ) ) ( AVAILABLE ?auto_29879 ) ( SURFACE-AT ?auto_29868 ?auto_29871 ) ( ON ?auto_29868 ?auto_29869 ) ( CLEAR ?auto_29868 ) ( not ( = ?auto_29867 ?auto_29869 ) ) ( not ( = ?auto_29868 ?auto_29869 ) ) ( not ( = ?auto_29882 ?auto_29869 ) ) ( IS-CRATE ?auto_29867 ) ( not ( = ?auto_29878 ?auto_29880 ) ) ( not ( = ?auto_29871 ?auto_29878 ) ) ( HOIST-AT ?auto_29876 ?auto_29878 ) ( not ( = ?auto_29877 ?auto_29876 ) ) ( not ( = ?auto_29879 ?auto_29876 ) ) ( AVAILABLE ?auto_29876 ) ( SURFACE-AT ?auto_29867 ?auto_29878 ) ( ON ?auto_29867 ?auto_29874 ) ( CLEAR ?auto_29867 ) ( not ( = ?auto_29867 ?auto_29874 ) ) ( not ( = ?auto_29868 ?auto_29874 ) ) ( not ( = ?auto_29882 ?auto_29874 ) ) ( not ( = ?auto_29869 ?auto_29874 ) ) ( IS-CRATE ?auto_29882 ) ( not ( = ?auto_29873 ?auto_29882 ) ) ( not ( = ?auto_29867 ?auto_29873 ) ) ( not ( = ?auto_29868 ?auto_29873 ) ) ( not ( = ?auto_29869 ?auto_29873 ) ) ( not ( = ?auto_29874 ?auto_29873 ) ) ( not ( = ?auto_29883 ?auto_29880 ) ) ( not ( = ?auto_29871 ?auto_29883 ) ) ( not ( = ?auto_29878 ?auto_29883 ) ) ( HOIST-AT ?auto_29872 ?auto_29883 ) ( not ( = ?auto_29877 ?auto_29872 ) ) ( not ( = ?auto_29879 ?auto_29872 ) ) ( not ( = ?auto_29876 ?auto_29872 ) ) ( AVAILABLE ?auto_29872 ) ( SURFACE-AT ?auto_29882 ?auto_29883 ) ( ON ?auto_29882 ?auto_29870 ) ( CLEAR ?auto_29882 ) ( not ( = ?auto_29867 ?auto_29870 ) ) ( not ( = ?auto_29868 ?auto_29870 ) ) ( not ( = ?auto_29882 ?auto_29870 ) ) ( not ( = ?auto_29869 ?auto_29870 ) ) ( not ( = ?auto_29874 ?auto_29870 ) ) ( not ( = ?auto_29873 ?auto_29870 ) ) ( TRUCK-AT ?auto_29875 ?auto_29880 ) ( SURFACE-AT ?auto_29881 ?auto_29880 ) ( CLEAR ?auto_29881 ) ( IS-CRATE ?auto_29873 ) ( not ( = ?auto_29881 ?auto_29873 ) ) ( not ( = ?auto_29867 ?auto_29881 ) ) ( not ( = ?auto_29868 ?auto_29881 ) ) ( not ( = ?auto_29882 ?auto_29881 ) ) ( not ( = ?auto_29869 ?auto_29881 ) ) ( not ( = ?auto_29874 ?auto_29881 ) ) ( not ( = ?auto_29870 ?auto_29881 ) ) ( AVAILABLE ?auto_29877 ) ( IN ?auto_29873 ?auto_29875 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29877 ?auto_29873 ?auto_29875 ?auto_29880 )
      ( MAKE-2CRATE ?auto_29882 ?auto_29867 ?auto_29868 )
      ( MAKE-1CRATE-VERIFY ?auto_29867 ?auto_29868 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29884 - SURFACE
      ?auto_29885 - SURFACE
      ?auto_29886 - SURFACE
    )
    :vars
    (
      ?auto_29897 - HOIST
      ?auto_29888 - PLACE
      ?auto_29896 - PLACE
      ?auto_29889 - HOIST
      ?auto_29894 - SURFACE
      ?auto_29898 - PLACE
      ?auto_29899 - HOIST
      ?auto_29893 - SURFACE
      ?auto_29900 - SURFACE
      ?auto_29890 - PLACE
      ?auto_29891 - HOIST
      ?auto_29887 - SURFACE
      ?auto_29892 - TRUCK
      ?auto_29895 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29897 ?auto_29888 ) ( IS-CRATE ?auto_29886 ) ( not ( = ?auto_29885 ?auto_29886 ) ) ( not ( = ?auto_29884 ?auto_29885 ) ) ( not ( = ?auto_29884 ?auto_29886 ) ) ( not ( = ?auto_29896 ?auto_29888 ) ) ( HOIST-AT ?auto_29889 ?auto_29896 ) ( not ( = ?auto_29897 ?auto_29889 ) ) ( AVAILABLE ?auto_29889 ) ( SURFACE-AT ?auto_29886 ?auto_29896 ) ( ON ?auto_29886 ?auto_29894 ) ( CLEAR ?auto_29886 ) ( not ( = ?auto_29885 ?auto_29894 ) ) ( not ( = ?auto_29886 ?auto_29894 ) ) ( not ( = ?auto_29884 ?auto_29894 ) ) ( IS-CRATE ?auto_29885 ) ( not ( = ?auto_29898 ?auto_29888 ) ) ( not ( = ?auto_29896 ?auto_29898 ) ) ( HOIST-AT ?auto_29899 ?auto_29898 ) ( not ( = ?auto_29897 ?auto_29899 ) ) ( not ( = ?auto_29889 ?auto_29899 ) ) ( AVAILABLE ?auto_29899 ) ( SURFACE-AT ?auto_29885 ?auto_29898 ) ( ON ?auto_29885 ?auto_29893 ) ( CLEAR ?auto_29885 ) ( not ( = ?auto_29885 ?auto_29893 ) ) ( not ( = ?auto_29886 ?auto_29893 ) ) ( not ( = ?auto_29884 ?auto_29893 ) ) ( not ( = ?auto_29894 ?auto_29893 ) ) ( IS-CRATE ?auto_29884 ) ( not ( = ?auto_29900 ?auto_29884 ) ) ( not ( = ?auto_29885 ?auto_29900 ) ) ( not ( = ?auto_29886 ?auto_29900 ) ) ( not ( = ?auto_29894 ?auto_29900 ) ) ( not ( = ?auto_29893 ?auto_29900 ) ) ( not ( = ?auto_29890 ?auto_29888 ) ) ( not ( = ?auto_29896 ?auto_29890 ) ) ( not ( = ?auto_29898 ?auto_29890 ) ) ( HOIST-AT ?auto_29891 ?auto_29890 ) ( not ( = ?auto_29897 ?auto_29891 ) ) ( not ( = ?auto_29889 ?auto_29891 ) ) ( not ( = ?auto_29899 ?auto_29891 ) ) ( AVAILABLE ?auto_29891 ) ( SURFACE-AT ?auto_29884 ?auto_29890 ) ( ON ?auto_29884 ?auto_29887 ) ( CLEAR ?auto_29884 ) ( not ( = ?auto_29885 ?auto_29887 ) ) ( not ( = ?auto_29886 ?auto_29887 ) ) ( not ( = ?auto_29884 ?auto_29887 ) ) ( not ( = ?auto_29894 ?auto_29887 ) ) ( not ( = ?auto_29893 ?auto_29887 ) ) ( not ( = ?auto_29900 ?auto_29887 ) ) ( TRUCK-AT ?auto_29892 ?auto_29888 ) ( SURFACE-AT ?auto_29895 ?auto_29888 ) ( CLEAR ?auto_29895 ) ( IS-CRATE ?auto_29900 ) ( not ( = ?auto_29895 ?auto_29900 ) ) ( not ( = ?auto_29885 ?auto_29895 ) ) ( not ( = ?auto_29886 ?auto_29895 ) ) ( not ( = ?auto_29884 ?auto_29895 ) ) ( not ( = ?auto_29894 ?auto_29895 ) ) ( not ( = ?auto_29893 ?auto_29895 ) ) ( not ( = ?auto_29887 ?auto_29895 ) ) ( AVAILABLE ?auto_29897 ) ( IN ?auto_29900 ?auto_29892 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29885 ?auto_29886 )
      ( MAKE-2CRATE-VERIFY ?auto_29884 ?auto_29885 ?auto_29886 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29901 - SURFACE
      ?auto_29902 - SURFACE
      ?auto_29903 - SURFACE
      ?auto_29904 - SURFACE
    )
    :vars
    (
      ?auto_29905 - HOIST
      ?auto_29908 - PLACE
      ?auto_29912 - PLACE
      ?auto_29913 - HOIST
      ?auto_29914 - SURFACE
      ?auto_29907 - PLACE
      ?auto_29909 - HOIST
      ?auto_29916 - SURFACE
      ?auto_29915 - PLACE
      ?auto_29910 - HOIST
      ?auto_29906 - SURFACE
      ?auto_29911 - TRUCK
      ?auto_29917 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29905 ?auto_29908 ) ( IS-CRATE ?auto_29904 ) ( not ( = ?auto_29903 ?auto_29904 ) ) ( not ( = ?auto_29902 ?auto_29903 ) ) ( not ( = ?auto_29902 ?auto_29904 ) ) ( not ( = ?auto_29912 ?auto_29908 ) ) ( HOIST-AT ?auto_29913 ?auto_29912 ) ( not ( = ?auto_29905 ?auto_29913 ) ) ( AVAILABLE ?auto_29913 ) ( SURFACE-AT ?auto_29904 ?auto_29912 ) ( ON ?auto_29904 ?auto_29914 ) ( CLEAR ?auto_29904 ) ( not ( = ?auto_29903 ?auto_29914 ) ) ( not ( = ?auto_29904 ?auto_29914 ) ) ( not ( = ?auto_29902 ?auto_29914 ) ) ( IS-CRATE ?auto_29903 ) ( not ( = ?auto_29907 ?auto_29908 ) ) ( not ( = ?auto_29912 ?auto_29907 ) ) ( HOIST-AT ?auto_29909 ?auto_29907 ) ( not ( = ?auto_29905 ?auto_29909 ) ) ( not ( = ?auto_29913 ?auto_29909 ) ) ( AVAILABLE ?auto_29909 ) ( SURFACE-AT ?auto_29903 ?auto_29907 ) ( ON ?auto_29903 ?auto_29916 ) ( CLEAR ?auto_29903 ) ( not ( = ?auto_29903 ?auto_29916 ) ) ( not ( = ?auto_29904 ?auto_29916 ) ) ( not ( = ?auto_29902 ?auto_29916 ) ) ( not ( = ?auto_29914 ?auto_29916 ) ) ( IS-CRATE ?auto_29902 ) ( not ( = ?auto_29901 ?auto_29902 ) ) ( not ( = ?auto_29903 ?auto_29901 ) ) ( not ( = ?auto_29904 ?auto_29901 ) ) ( not ( = ?auto_29914 ?auto_29901 ) ) ( not ( = ?auto_29916 ?auto_29901 ) ) ( not ( = ?auto_29915 ?auto_29908 ) ) ( not ( = ?auto_29912 ?auto_29915 ) ) ( not ( = ?auto_29907 ?auto_29915 ) ) ( HOIST-AT ?auto_29910 ?auto_29915 ) ( not ( = ?auto_29905 ?auto_29910 ) ) ( not ( = ?auto_29913 ?auto_29910 ) ) ( not ( = ?auto_29909 ?auto_29910 ) ) ( AVAILABLE ?auto_29910 ) ( SURFACE-AT ?auto_29902 ?auto_29915 ) ( ON ?auto_29902 ?auto_29906 ) ( CLEAR ?auto_29902 ) ( not ( = ?auto_29903 ?auto_29906 ) ) ( not ( = ?auto_29904 ?auto_29906 ) ) ( not ( = ?auto_29902 ?auto_29906 ) ) ( not ( = ?auto_29914 ?auto_29906 ) ) ( not ( = ?auto_29916 ?auto_29906 ) ) ( not ( = ?auto_29901 ?auto_29906 ) ) ( TRUCK-AT ?auto_29911 ?auto_29908 ) ( SURFACE-AT ?auto_29917 ?auto_29908 ) ( CLEAR ?auto_29917 ) ( IS-CRATE ?auto_29901 ) ( not ( = ?auto_29917 ?auto_29901 ) ) ( not ( = ?auto_29903 ?auto_29917 ) ) ( not ( = ?auto_29904 ?auto_29917 ) ) ( not ( = ?auto_29902 ?auto_29917 ) ) ( not ( = ?auto_29914 ?auto_29917 ) ) ( not ( = ?auto_29916 ?auto_29917 ) ) ( not ( = ?auto_29906 ?auto_29917 ) ) ( AVAILABLE ?auto_29905 ) ( IN ?auto_29901 ?auto_29911 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29902 ?auto_29903 ?auto_29904 )
      ( MAKE-3CRATE-VERIFY ?auto_29901 ?auto_29902 ?auto_29903 ?auto_29904 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29918 - SURFACE
      ?auto_29919 - SURFACE
      ?auto_29920 - SURFACE
      ?auto_29921 - SURFACE
      ?auto_29922 - SURFACE
    )
    :vars
    (
      ?auto_29923 - HOIST
      ?auto_29926 - PLACE
      ?auto_29930 - PLACE
      ?auto_29931 - HOIST
      ?auto_29932 - SURFACE
      ?auto_29925 - PLACE
      ?auto_29927 - HOIST
      ?auto_29934 - SURFACE
      ?auto_29933 - PLACE
      ?auto_29928 - HOIST
      ?auto_29924 - SURFACE
      ?auto_29929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29923 ?auto_29926 ) ( IS-CRATE ?auto_29922 ) ( not ( = ?auto_29921 ?auto_29922 ) ) ( not ( = ?auto_29920 ?auto_29921 ) ) ( not ( = ?auto_29920 ?auto_29922 ) ) ( not ( = ?auto_29930 ?auto_29926 ) ) ( HOIST-AT ?auto_29931 ?auto_29930 ) ( not ( = ?auto_29923 ?auto_29931 ) ) ( AVAILABLE ?auto_29931 ) ( SURFACE-AT ?auto_29922 ?auto_29930 ) ( ON ?auto_29922 ?auto_29932 ) ( CLEAR ?auto_29922 ) ( not ( = ?auto_29921 ?auto_29932 ) ) ( not ( = ?auto_29922 ?auto_29932 ) ) ( not ( = ?auto_29920 ?auto_29932 ) ) ( IS-CRATE ?auto_29921 ) ( not ( = ?auto_29925 ?auto_29926 ) ) ( not ( = ?auto_29930 ?auto_29925 ) ) ( HOIST-AT ?auto_29927 ?auto_29925 ) ( not ( = ?auto_29923 ?auto_29927 ) ) ( not ( = ?auto_29931 ?auto_29927 ) ) ( AVAILABLE ?auto_29927 ) ( SURFACE-AT ?auto_29921 ?auto_29925 ) ( ON ?auto_29921 ?auto_29934 ) ( CLEAR ?auto_29921 ) ( not ( = ?auto_29921 ?auto_29934 ) ) ( not ( = ?auto_29922 ?auto_29934 ) ) ( not ( = ?auto_29920 ?auto_29934 ) ) ( not ( = ?auto_29932 ?auto_29934 ) ) ( IS-CRATE ?auto_29920 ) ( not ( = ?auto_29919 ?auto_29920 ) ) ( not ( = ?auto_29921 ?auto_29919 ) ) ( not ( = ?auto_29922 ?auto_29919 ) ) ( not ( = ?auto_29932 ?auto_29919 ) ) ( not ( = ?auto_29934 ?auto_29919 ) ) ( not ( = ?auto_29933 ?auto_29926 ) ) ( not ( = ?auto_29930 ?auto_29933 ) ) ( not ( = ?auto_29925 ?auto_29933 ) ) ( HOIST-AT ?auto_29928 ?auto_29933 ) ( not ( = ?auto_29923 ?auto_29928 ) ) ( not ( = ?auto_29931 ?auto_29928 ) ) ( not ( = ?auto_29927 ?auto_29928 ) ) ( AVAILABLE ?auto_29928 ) ( SURFACE-AT ?auto_29920 ?auto_29933 ) ( ON ?auto_29920 ?auto_29924 ) ( CLEAR ?auto_29920 ) ( not ( = ?auto_29921 ?auto_29924 ) ) ( not ( = ?auto_29922 ?auto_29924 ) ) ( not ( = ?auto_29920 ?auto_29924 ) ) ( not ( = ?auto_29932 ?auto_29924 ) ) ( not ( = ?auto_29934 ?auto_29924 ) ) ( not ( = ?auto_29919 ?auto_29924 ) ) ( TRUCK-AT ?auto_29929 ?auto_29926 ) ( SURFACE-AT ?auto_29918 ?auto_29926 ) ( CLEAR ?auto_29918 ) ( IS-CRATE ?auto_29919 ) ( not ( = ?auto_29918 ?auto_29919 ) ) ( not ( = ?auto_29921 ?auto_29918 ) ) ( not ( = ?auto_29922 ?auto_29918 ) ) ( not ( = ?auto_29920 ?auto_29918 ) ) ( not ( = ?auto_29932 ?auto_29918 ) ) ( not ( = ?auto_29934 ?auto_29918 ) ) ( not ( = ?auto_29924 ?auto_29918 ) ) ( AVAILABLE ?auto_29923 ) ( IN ?auto_29919 ?auto_29929 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29920 ?auto_29921 ?auto_29922 )
      ( MAKE-4CRATE-VERIFY ?auto_29918 ?auto_29919 ?auto_29920 ?auto_29921 ?auto_29922 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29935 - SURFACE
      ?auto_29936 - SURFACE
    )
    :vars
    (
      ?auto_29937 - HOIST
      ?auto_29941 - PLACE
      ?auto_29943 - SURFACE
      ?auto_29946 - PLACE
      ?auto_29947 - HOIST
      ?auto_29948 - SURFACE
      ?auto_29940 - PLACE
      ?auto_29942 - HOIST
      ?auto_29950 - SURFACE
      ?auto_29938 - SURFACE
      ?auto_29949 - PLACE
      ?auto_29944 - HOIST
      ?auto_29939 - SURFACE
      ?auto_29951 - SURFACE
      ?auto_29945 - TRUCK
      ?auto_29952 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29937 ?auto_29941 ) ( IS-CRATE ?auto_29936 ) ( not ( = ?auto_29935 ?auto_29936 ) ) ( not ( = ?auto_29943 ?auto_29935 ) ) ( not ( = ?auto_29943 ?auto_29936 ) ) ( not ( = ?auto_29946 ?auto_29941 ) ) ( HOIST-AT ?auto_29947 ?auto_29946 ) ( not ( = ?auto_29937 ?auto_29947 ) ) ( AVAILABLE ?auto_29947 ) ( SURFACE-AT ?auto_29936 ?auto_29946 ) ( ON ?auto_29936 ?auto_29948 ) ( CLEAR ?auto_29936 ) ( not ( = ?auto_29935 ?auto_29948 ) ) ( not ( = ?auto_29936 ?auto_29948 ) ) ( not ( = ?auto_29943 ?auto_29948 ) ) ( IS-CRATE ?auto_29935 ) ( not ( = ?auto_29940 ?auto_29941 ) ) ( not ( = ?auto_29946 ?auto_29940 ) ) ( HOIST-AT ?auto_29942 ?auto_29940 ) ( not ( = ?auto_29937 ?auto_29942 ) ) ( not ( = ?auto_29947 ?auto_29942 ) ) ( AVAILABLE ?auto_29942 ) ( SURFACE-AT ?auto_29935 ?auto_29940 ) ( ON ?auto_29935 ?auto_29950 ) ( CLEAR ?auto_29935 ) ( not ( = ?auto_29935 ?auto_29950 ) ) ( not ( = ?auto_29936 ?auto_29950 ) ) ( not ( = ?auto_29943 ?auto_29950 ) ) ( not ( = ?auto_29948 ?auto_29950 ) ) ( IS-CRATE ?auto_29943 ) ( not ( = ?auto_29938 ?auto_29943 ) ) ( not ( = ?auto_29935 ?auto_29938 ) ) ( not ( = ?auto_29936 ?auto_29938 ) ) ( not ( = ?auto_29948 ?auto_29938 ) ) ( not ( = ?auto_29950 ?auto_29938 ) ) ( not ( = ?auto_29949 ?auto_29941 ) ) ( not ( = ?auto_29946 ?auto_29949 ) ) ( not ( = ?auto_29940 ?auto_29949 ) ) ( HOIST-AT ?auto_29944 ?auto_29949 ) ( not ( = ?auto_29937 ?auto_29944 ) ) ( not ( = ?auto_29947 ?auto_29944 ) ) ( not ( = ?auto_29942 ?auto_29944 ) ) ( AVAILABLE ?auto_29944 ) ( SURFACE-AT ?auto_29943 ?auto_29949 ) ( ON ?auto_29943 ?auto_29939 ) ( CLEAR ?auto_29943 ) ( not ( = ?auto_29935 ?auto_29939 ) ) ( not ( = ?auto_29936 ?auto_29939 ) ) ( not ( = ?auto_29943 ?auto_29939 ) ) ( not ( = ?auto_29948 ?auto_29939 ) ) ( not ( = ?auto_29950 ?auto_29939 ) ) ( not ( = ?auto_29938 ?auto_29939 ) ) ( SURFACE-AT ?auto_29951 ?auto_29941 ) ( CLEAR ?auto_29951 ) ( IS-CRATE ?auto_29938 ) ( not ( = ?auto_29951 ?auto_29938 ) ) ( not ( = ?auto_29935 ?auto_29951 ) ) ( not ( = ?auto_29936 ?auto_29951 ) ) ( not ( = ?auto_29943 ?auto_29951 ) ) ( not ( = ?auto_29948 ?auto_29951 ) ) ( not ( = ?auto_29950 ?auto_29951 ) ) ( not ( = ?auto_29939 ?auto_29951 ) ) ( AVAILABLE ?auto_29937 ) ( IN ?auto_29938 ?auto_29945 ) ( TRUCK-AT ?auto_29945 ?auto_29952 ) ( not ( = ?auto_29952 ?auto_29941 ) ) ( not ( = ?auto_29946 ?auto_29952 ) ) ( not ( = ?auto_29940 ?auto_29952 ) ) ( not ( = ?auto_29949 ?auto_29952 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29945 ?auto_29952 ?auto_29941 )
      ( MAKE-2CRATE ?auto_29943 ?auto_29935 ?auto_29936 )
      ( MAKE-1CRATE-VERIFY ?auto_29935 ?auto_29936 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29953 - SURFACE
      ?auto_29954 - SURFACE
      ?auto_29955 - SURFACE
    )
    :vars
    (
      ?auto_29966 - HOIST
      ?auto_29956 - PLACE
      ?auto_29958 - PLACE
      ?auto_29965 - HOIST
      ?auto_29957 - SURFACE
      ?auto_29961 - PLACE
      ?auto_29962 - HOIST
      ?auto_29970 - SURFACE
      ?auto_29960 - SURFACE
      ?auto_29969 - PLACE
      ?auto_29968 - HOIST
      ?auto_29963 - SURFACE
      ?auto_29967 - SURFACE
      ?auto_29964 - TRUCK
      ?auto_29959 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29966 ?auto_29956 ) ( IS-CRATE ?auto_29955 ) ( not ( = ?auto_29954 ?auto_29955 ) ) ( not ( = ?auto_29953 ?auto_29954 ) ) ( not ( = ?auto_29953 ?auto_29955 ) ) ( not ( = ?auto_29958 ?auto_29956 ) ) ( HOIST-AT ?auto_29965 ?auto_29958 ) ( not ( = ?auto_29966 ?auto_29965 ) ) ( AVAILABLE ?auto_29965 ) ( SURFACE-AT ?auto_29955 ?auto_29958 ) ( ON ?auto_29955 ?auto_29957 ) ( CLEAR ?auto_29955 ) ( not ( = ?auto_29954 ?auto_29957 ) ) ( not ( = ?auto_29955 ?auto_29957 ) ) ( not ( = ?auto_29953 ?auto_29957 ) ) ( IS-CRATE ?auto_29954 ) ( not ( = ?auto_29961 ?auto_29956 ) ) ( not ( = ?auto_29958 ?auto_29961 ) ) ( HOIST-AT ?auto_29962 ?auto_29961 ) ( not ( = ?auto_29966 ?auto_29962 ) ) ( not ( = ?auto_29965 ?auto_29962 ) ) ( AVAILABLE ?auto_29962 ) ( SURFACE-AT ?auto_29954 ?auto_29961 ) ( ON ?auto_29954 ?auto_29970 ) ( CLEAR ?auto_29954 ) ( not ( = ?auto_29954 ?auto_29970 ) ) ( not ( = ?auto_29955 ?auto_29970 ) ) ( not ( = ?auto_29953 ?auto_29970 ) ) ( not ( = ?auto_29957 ?auto_29970 ) ) ( IS-CRATE ?auto_29953 ) ( not ( = ?auto_29960 ?auto_29953 ) ) ( not ( = ?auto_29954 ?auto_29960 ) ) ( not ( = ?auto_29955 ?auto_29960 ) ) ( not ( = ?auto_29957 ?auto_29960 ) ) ( not ( = ?auto_29970 ?auto_29960 ) ) ( not ( = ?auto_29969 ?auto_29956 ) ) ( not ( = ?auto_29958 ?auto_29969 ) ) ( not ( = ?auto_29961 ?auto_29969 ) ) ( HOIST-AT ?auto_29968 ?auto_29969 ) ( not ( = ?auto_29966 ?auto_29968 ) ) ( not ( = ?auto_29965 ?auto_29968 ) ) ( not ( = ?auto_29962 ?auto_29968 ) ) ( AVAILABLE ?auto_29968 ) ( SURFACE-AT ?auto_29953 ?auto_29969 ) ( ON ?auto_29953 ?auto_29963 ) ( CLEAR ?auto_29953 ) ( not ( = ?auto_29954 ?auto_29963 ) ) ( not ( = ?auto_29955 ?auto_29963 ) ) ( not ( = ?auto_29953 ?auto_29963 ) ) ( not ( = ?auto_29957 ?auto_29963 ) ) ( not ( = ?auto_29970 ?auto_29963 ) ) ( not ( = ?auto_29960 ?auto_29963 ) ) ( SURFACE-AT ?auto_29967 ?auto_29956 ) ( CLEAR ?auto_29967 ) ( IS-CRATE ?auto_29960 ) ( not ( = ?auto_29967 ?auto_29960 ) ) ( not ( = ?auto_29954 ?auto_29967 ) ) ( not ( = ?auto_29955 ?auto_29967 ) ) ( not ( = ?auto_29953 ?auto_29967 ) ) ( not ( = ?auto_29957 ?auto_29967 ) ) ( not ( = ?auto_29970 ?auto_29967 ) ) ( not ( = ?auto_29963 ?auto_29967 ) ) ( AVAILABLE ?auto_29966 ) ( IN ?auto_29960 ?auto_29964 ) ( TRUCK-AT ?auto_29964 ?auto_29959 ) ( not ( = ?auto_29959 ?auto_29956 ) ) ( not ( = ?auto_29958 ?auto_29959 ) ) ( not ( = ?auto_29961 ?auto_29959 ) ) ( not ( = ?auto_29969 ?auto_29959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29954 ?auto_29955 )
      ( MAKE-2CRATE-VERIFY ?auto_29953 ?auto_29954 ?auto_29955 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29971 - SURFACE
      ?auto_29972 - SURFACE
      ?auto_29973 - SURFACE
      ?auto_29974 - SURFACE
    )
    :vars
    (
      ?auto_29977 - HOIST
      ?auto_29979 - PLACE
      ?auto_29984 - PLACE
      ?auto_29975 - HOIST
      ?auto_29987 - SURFACE
      ?auto_29986 - PLACE
      ?auto_29976 - HOIST
      ?auto_29985 - SURFACE
      ?auto_29981 - PLACE
      ?auto_29978 - HOIST
      ?auto_29982 - SURFACE
      ?auto_29983 - SURFACE
      ?auto_29988 - TRUCK
      ?auto_29980 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29977 ?auto_29979 ) ( IS-CRATE ?auto_29974 ) ( not ( = ?auto_29973 ?auto_29974 ) ) ( not ( = ?auto_29972 ?auto_29973 ) ) ( not ( = ?auto_29972 ?auto_29974 ) ) ( not ( = ?auto_29984 ?auto_29979 ) ) ( HOIST-AT ?auto_29975 ?auto_29984 ) ( not ( = ?auto_29977 ?auto_29975 ) ) ( AVAILABLE ?auto_29975 ) ( SURFACE-AT ?auto_29974 ?auto_29984 ) ( ON ?auto_29974 ?auto_29987 ) ( CLEAR ?auto_29974 ) ( not ( = ?auto_29973 ?auto_29987 ) ) ( not ( = ?auto_29974 ?auto_29987 ) ) ( not ( = ?auto_29972 ?auto_29987 ) ) ( IS-CRATE ?auto_29973 ) ( not ( = ?auto_29986 ?auto_29979 ) ) ( not ( = ?auto_29984 ?auto_29986 ) ) ( HOIST-AT ?auto_29976 ?auto_29986 ) ( not ( = ?auto_29977 ?auto_29976 ) ) ( not ( = ?auto_29975 ?auto_29976 ) ) ( AVAILABLE ?auto_29976 ) ( SURFACE-AT ?auto_29973 ?auto_29986 ) ( ON ?auto_29973 ?auto_29985 ) ( CLEAR ?auto_29973 ) ( not ( = ?auto_29973 ?auto_29985 ) ) ( not ( = ?auto_29974 ?auto_29985 ) ) ( not ( = ?auto_29972 ?auto_29985 ) ) ( not ( = ?auto_29987 ?auto_29985 ) ) ( IS-CRATE ?auto_29972 ) ( not ( = ?auto_29971 ?auto_29972 ) ) ( not ( = ?auto_29973 ?auto_29971 ) ) ( not ( = ?auto_29974 ?auto_29971 ) ) ( not ( = ?auto_29987 ?auto_29971 ) ) ( not ( = ?auto_29985 ?auto_29971 ) ) ( not ( = ?auto_29981 ?auto_29979 ) ) ( not ( = ?auto_29984 ?auto_29981 ) ) ( not ( = ?auto_29986 ?auto_29981 ) ) ( HOIST-AT ?auto_29978 ?auto_29981 ) ( not ( = ?auto_29977 ?auto_29978 ) ) ( not ( = ?auto_29975 ?auto_29978 ) ) ( not ( = ?auto_29976 ?auto_29978 ) ) ( AVAILABLE ?auto_29978 ) ( SURFACE-AT ?auto_29972 ?auto_29981 ) ( ON ?auto_29972 ?auto_29982 ) ( CLEAR ?auto_29972 ) ( not ( = ?auto_29973 ?auto_29982 ) ) ( not ( = ?auto_29974 ?auto_29982 ) ) ( not ( = ?auto_29972 ?auto_29982 ) ) ( not ( = ?auto_29987 ?auto_29982 ) ) ( not ( = ?auto_29985 ?auto_29982 ) ) ( not ( = ?auto_29971 ?auto_29982 ) ) ( SURFACE-AT ?auto_29983 ?auto_29979 ) ( CLEAR ?auto_29983 ) ( IS-CRATE ?auto_29971 ) ( not ( = ?auto_29983 ?auto_29971 ) ) ( not ( = ?auto_29973 ?auto_29983 ) ) ( not ( = ?auto_29974 ?auto_29983 ) ) ( not ( = ?auto_29972 ?auto_29983 ) ) ( not ( = ?auto_29987 ?auto_29983 ) ) ( not ( = ?auto_29985 ?auto_29983 ) ) ( not ( = ?auto_29982 ?auto_29983 ) ) ( AVAILABLE ?auto_29977 ) ( IN ?auto_29971 ?auto_29988 ) ( TRUCK-AT ?auto_29988 ?auto_29980 ) ( not ( = ?auto_29980 ?auto_29979 ) ) ( not ( = ?auto_29984 ?auto_29980 ) ) ( not ( = ?auto_29986 ?auto_29980 ) ) ( not ( = ?auto_29981 ?auto_29980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29972 ?auto_29973 ?auto_29974 )
      ( MAKE-3CRATE-VERIFY ?auto_29971 ?auto_29972 ?auto_29973 ?auto_29974 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29989 - SURFACE
      ?auto_29990 - SURFACE
      ?auto_29991 - SURFACE
      ?auto_29992 - SURFACE
      ?auto_29993 - SURFACE
    )
    :vars
    (
      ?auto_29996 - HOIST
      ?auto_29998 - PLACE
      ?auto_30002 - PLACE
      ?auto_29994 - HOIST
      ?auto_30005 - SURFACE
      ?auto_30004 - PLACE
      ?auto_29995 - HOIST
      ?auto_30003 - SURFACE
      ?auto_30000 - PLACE
      ?auto_29997 - HOIST
      ?auto_30001 - SURFACE
      ?auto_30006 - TRUCK
      ?auto_29999 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29996 ?auto_29998 ) ( IS-CRATE ?auto_29993 ) ( not ( = ?auto_29992 ?auto_29993 ) ) ( not ( = ?auto_29991 ?auto_29992 ) ) ( not ( = ?auto_29991 ?auto_29993 ) ) ( not ( = ?auto_30002 ?auto_29998 ) ) ( HOIST-AT ?auto_29994 ?auto_30002 ) ( not ( = ?auto_29996 ?auto_29994 ) ) ( AVAILABLE ?auto_29994 ) ( SURFACE-AT ?auto_29993 ?auto_30002 ) ( ON ?auto_29993 ?auto_30005 ) ( CLEAR ?auto_29993 ) ( not ( = ?auto_29992 ?auto_30005 ) ) ( not ( = ?auto_29993 ?auto_30005 ) ) ( not ( = ?auto_29991 ?auto_30005 ) ) ( IS-CRATE ?auto_29992 ) ( not ( = ?auto_30004 ?auto_29998 ) ) ( not ( = ?auto_30002 ?auto_30004 ) ) ( HOIST-AT ?auto_29995 ?auto_30004 ) ( not ( = ?auto_29996 ?auto_29995 ) ) ( not ( = ?auto_29994 ?auto_29995 ) ) ( AVAILABLE ?auto_29995 ) ( SURFACE-AT ?auto_29992 ?auto_30004 ) ( ON ?auto_29992 ?auto_30003 ) ( CLEAR ?auto_29992 ) ( not ( = ?auto_29992 ?auto_30003 ) ) ( not ( = ?auto_29993 ?auto_30003 ) ) ( not ( = ?auto_29991 ?auto_30003 ) ) ( not ( = ?auto_30005 ?auto_30003 ) ) ( IS-CRATE ?auto_29991 ) ( not ( = ?auto_29990 ?auto_29991 ) ) ( not ( = ?auto_29992 ?auto_29990 ) ) ( not ( = ?auto_29993 ?auto_29990 ) ) ( not ( = ?auto_30005 ?auto_29990 ) ) ( not ( = ?auto_30003 ?auto_29990 ) ) ( not ( = ?auto_30000 ?auto_29998 ) ) ( not ( = ?auto_30002 ?auto_30000 ) ) ( not ( = ?auto_30004 ?auto_30000 ) ) ( HOIST-AT ?auto_29997 ?auto_30000 ) ( not ( = ?auto_29996 ?auto_29997 ) ) ( not ( = ?auto_29994 ?auto_29997 ) ) ( not ( = ?auto_29995 ?auto_29997 ) ) ( AVAILABLE ?auto_29997 ) ( SURFACE-AT ?auto_29991 ?auto_30000 ) ( ON ?auto_29991 ?auto_30001 ) ( CLEAR ?auto_29991 ) ( not ( = ?auto_29992 ?auto_30001 ) ) ( not ( = ?auto_29993 ?auto_30001 ) ) ( not ( = ?auto_29991 ?auto_30001 ) ) ( not ( = ?auto_30005 ?auto_30001 ) ) ( not ( = ?auto_30003 ?auto_30001 ) ) ( not ( = ?auto_29990 ?auto_30001 ) ) ( SURFACE-AT ?auto_29989 ?auto_29998 ) ( CLEAR ?auto_29989 ) ( IS-CRATE ?auto_29990 ) ( not ( = ?auto_29989 ?auto_29990 ) ) ( not ( = ?auto_29992 ?auto_29989 ) ) ( not ( = ?auto_29993 ?auto_29989 ) ) ( not ( = ?auto_29991 ?auto_29989 ) ) ( not ( = ?auto_30005 ?auto_29989 ) ) ( not ( = ?auto_30003 ?auto_29989 ) ) ( not ( = ?auto_30001 ?auto_29989 ) ) ( AVAILABLE ?auto_29996 ) ( IN ?auto_29990 ?auto_30006 ) ( TRUCK-AT ?auto_30006 ?auto_29999 ) ( not ( = ?auto_29999 ?auto_29998 ) ) ( not ( = ?auto_30002 ?auto_29999 ) ) ( not ( = ?auto_30004 ?auto_29999 ) ) ( not ( = ?auto_30000 ?auto_29999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29991 ?auto_29992 ?auto_29993 )
      ( MAKE-4CRATE-VERIFY ?auto_29989 ?auto_29990 ?auto_29991 ?auto_29992 ?auto_29993 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30007 - SURFACE
      ?auto_30008 - SURFACE
    )
    :vars
    (
      ?auto_30011 - HOIST
      ?auto_30014 - PLACE
      ?auto_30013 - SURFACE
      ?auto_30020 - PLACE
      ?auto_30009 - HOIST
      ?auto_30023 - SURFACE
      ?auto_30022 - PLACE
      ?auto_30010 - HOIST
      ?auto_30021 - SURFACE
      ?auto_30018 - SURFACE
      ?auto_30016 - PLACE
      ?auto_30012 - HOIST
      ?auto_30017 - SURFACE
      ?auto_30019 - SURFACE
      ?auto_30024 - TRUCK
      ?auto_30015 - PLACE
      ?auto_30025 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30011 ?auto_30014 ) ( IS-CRATE ?auto_30008 ) ( not ( = ?auto_30007 ?auto_30008 ) ) ( not ( = ?auto_30013 ?auto_30007 ) ) ( not ( = ?auto_30013 ?auto_30008 ) ) ( not ( = ?auto_30020 ?auto_30014 ) ) ( HOIST-AT ?auto_30009 ?auto_30020 ) ( not ( = ?auto_30011 ?auto_30009 ) ) ( AVAILABLE ?auto_30009 ) ( SURFACE-AT ?auto_30008 ?auto_30020 ) ( ON ?auto_30008 ?auto_30023 ) ( CLEAR ?auto_30008 ) ( not ( = ?auto_30007 ?auto_30023 ) ) ( not ( = ?auto_30008 ?auto_30023 ) ) ( not ( = ?auto_30013 ?auto_30023 ) ) ( IS-CRATE ?auto_30007 ) ( not ( = ?auto_30022 ?auto_30014 ) ) ( not ( = ?auto_30020 ?auto_30022 ) ) ( HOIST-AT ?auto_30010 ?auto_30022 ) ( not ( = ?auto_30011 ?auto_30010 ) ) ( not ( = ?auto_30009 ?auto_30010 ) ) ( AVAILABLE ?auto_30010 ) ( SURFACE-AT ?auto_30007 ?auto_30022 ) ( ON ?auto_30007 ?auto_30021 ) ( CLEAR ?auto_30007 ) ( not ( = ?auto_30007 ?auto_30021 ) ) ( not ( = ?auto_30008 ?auto_30021 ) ) ( not ( = ?auto_30013 ?auto_30021 ) ) ( not ( = ?auto_30023 ?auto_30021 ) ) ( IS-CRATE ?auto_30013 ) ( not ( = ?auto_30018 ?auto_30013 ) ) ( not ( = ?auto_30007 ?auto_30018 ) ) ( not ( = ?auto_30008 ?auto_30018 ) ) ( not ( = ?auto_30023 ?auto_30018 ) ) ( not ( = ?auto_30021 ?auto_30018 ) ) ( not ( = ?auto_30016 ?auto_30014 ) ) ( not ( = ?auto_30020 ?auto_30016 ) ) ( not ( = ?auto_30022 ?auto_30016 ) ) ( HOIST-AT ?auto_30012 ?auto_30016 ) ( not ( = ?auto_30011 ?auto_30012 ) ) ( not ( = ?auto_30009 ?auto_30012 ) ) ( not ( = ?auto_30010 ?auto_30012 ) ) ( AVAILABLE ?auto_30012 ) ( SURFACE-AT ?auto_30013 ?auto_30016 ) ( ON ?auto_30013 ?auto_30017 ) ( CLEAR ?auto_30013 ) ( not ( = ?auto_30007 ?auto_30017 ) ) ( not ( = ?auto_30008 ?auto_30017 ) ) ( not ( = ?auto_30013 ?auto_30017 ) ) ( not ( = ?auto_30023 ?auto_30017 ) ) ( not ( = ?auto_30021 ?auto_30017 ) ) ( not ( = ?auto_30018 ?auto_30017 ) ) ( SURFACE-AT ?auto_30019 ?auto_30014 ) ( CLEAR ?auto_30019 ) ( IS-CRATE ?auto_30018 ) ( not ( = ?auto_30019 ?auto_30018 ) ) ( not ( = ?auto_30007 ?auto_30019 ) ) ( not ( = ?auto_30008 ?auto_30019 ) ) ( not ( = ?auto_30013 ?auto_30019 ) ) ( not ( = ?auto_30023 ?auto_30019 ) ) ( not ( = ?auto_30021 ?auto_30019 ) ) ( not ( = ?auto_30017 ?auto_30019 ) ) ( AVAILABLE ?auto_30011 ) ( TRUCK-AT ?auto_30024 ?auto_30015 ) ( not ( = ?auto_30015 ?auto_30014 ) ) ( not ( = ?auto_30020 ?auto_30015 ) ) ( not ( = ?auto_30022 ?auto_30015 ) ) ( not ( = ?auto_30016 ?auto_30015 ) ) ( HOIST-AT ?auto_30025 ?auto_30015 ) ( LIFTING ?auto_30025 ?auto_30018 ) ( not ( = ?auto_30011 ?auto_30025 ) ) ( not ( = ?auto_30009 ?auto_30025 ) ) ( not ( = ?auto_30010 ?auto_30025 ) ) ( not ( = ?auto_30012 ?auto_30025 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30025 ?auto_30018 ?auto_30024 ?auto_30015 )
      ( MAKE-2CRATE ?auto_30013 ?auto_30007 ?auto_30008 )
      ( MAKE-1CRATE-VERIFY ?auto_30007 ?auto_30008 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30026 - SURFACE
      ?auto_30027 - SURFACE
      ?auto_30028 - SURFACE
    )
    :vars
    (
      ?auto_30031 - HOIST
      ?auto_30032 - PLACE
      ?auto_30043 - PLACE
      ?auto_30040 - HOIST
      ?auto_30035 - SURFACE
      ?auto_30029 - PLACE
      ?auto_30044 - HOIST
      ?auto_30033 - SURFACE
      ?auto_30036 - SURFACE
      ?auto_30037 - PLACE
      ?auto_30038 - HOIST
      ?auto_30030 - SURFACE
      ?auto_30034 - SURFACE
      ?auto_30039 - TRUCK
      ?auto_30042 - PLACE
      ?auto_30041 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30031 ?auto_30032 ) ( IS-CRATE ?auto_30028 ) ( not ( = ?auto_30027 ?auto_30028 ) ) ( not ( = ?auto_30026 ?auto_30027 ) ) ( not ( = ?auto_30026 ?auto_30028 ) ) ( not ( = ?auto_30043 ?auto_30032 ) ) ( HOIST-AT ?auto_30040 ?auto_30043 ) ( not ( = ?auto_30031 ?auto_30040 ) ) ( AVAILABLE ?auto_30040 ) ( SURFACE-AT ?auto_30028 ?auto_30043 ) ( ON ?auto_30028 ?auto_30035 ) ( CLEAR ?auto_30028 ) ( not ( = ?auto_30027 ?auto_30035 ) ) ( not ( = ?auto_30028 ?auto_30035 ) ) ( not ( = ?auto_30026 ?auto_30035 ) ) ( IS-CRATE ?auto_30027 ) ( not ( = ?auto_30029 ?auto_30032 ) ) ( not ( = ?auto_30043 ?auto_30029 ) ) ( HOIST-AT ?auto_30044 ?auto_30029 ) ( not ( = ?auto_30031 ?auto_30044 ) ) ( not ( = ?auto_30040 ?auto_30044 ) ) ( AVAILABLE ?auto_30044 ) ( SURFACE-AT ?auto_30027 ?auto_30029 ) ( ON ?auto_30027 ?auto_30033 ) ( CLEAR ?auto_30027 ) ( not ( = ?auto_30027 ?auto_30033 ) ) ( not ( = ?auto_30028 ?auto_30033 ) ) ( not ( = ?auto_30026 ?auto_30033 ) ) ( not ( = ?auto_30035 ?auto_30033 ) ) ( IS-CRATE ?auto_30026 ) ( not ( = ?auto_30036 ?auto_30026 ) ) ( not ( = ?auto_30027 ?auto_30036 ) ) ( not ( = ?auto_30028 ?auto_30036 ) ) ( not ( = ?auto_30035 ?auto_30036 ) ) ( not ( = ?auto_30033 ?auto_30036 ) ) ( not ( = ?auto_30037 ?auto_30032 ) ) ( not ( = ?auto_30043 ?auto_30037 ) ) ( not ( = ?auto_30029 ?auto_30037 ) ) ( HOIST-AT ?auto_30038 ?auto_30037 ) ( not ( = ?auto_30031 ?auto_30038 ) ) ( not ( = ?auto_30040 ?auto_30038 ) ) ( not ( = ?auto_30044 ?auto_30038 ) ) ( AVAILABLE ?auto_30038 ) ( SURFACE-AT ?auto_30026 ?auto_30037 ) ( ON ?auto_30026 ?auto_30030 ) ( CLEAR ?auto_30026 ) ( not ( = ?auto_30027 ?auto_30030 ) ) ( not ( = ?auto_30028 ?auto_30030 ) ) ( not ( = ?auto_30026 ?auto_30030 ) ) ( not ( = ?auto_30035 ?auto_30030 ) ) ( not ( = ?auto_30033 ?auto_30030 ) ) ( not ( = ?auto_30036 ?auto_30030 ) ) ( SURFACE-AT ?auto_30034 ?auto_30032 ) ( CLEAR ?auto_30034 ) ( IS-CRATE ?auto_30036 ) ( not ( = ?auto_30034 ?auto_30036 ) ) ( not ( = ?auto_30027 ?auto_30034 ) ) ( not ( = ?auto_30028 ?auto_30034 ) ) ( not ( = ?auto_30026 ?auto_30034 ) ) ( not ( = ?auto_30035 ?auto_30034 ) ) ( not ( = ?auto_30033 ?auto_30034 ) ) ( not ( = ?auto_30030 ?auto_30034 ) ) ( AVAILABLE ?auto_30031 ) ( TRUCK-AT ?auto_30039 ?auto_30042 ) ( not ( = ?auto_30042 ?auto_30032 ) ) ( not ( = ?auto_30043 ?auto_30042 ) ) ( not ( = ?auto_30029 ?auto_30042 ) ) ( not ( = ?auto_30037 ?auto_30042 ) ) ( HOIST-AT ?auto_30041 ?auto_30042 ) ( LIFTING ?auto_30041 ?auto_30036 ) ( not ( = ?auto_30031 ?auto_30041 ) ) ( not ( = ?auto_30040 ?auto_30041 ) ) ( not ( = ?auto_30044 ?auto_30041 ) ) ( not ( = ?auto_30038 ?auto_30041 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30027 ?auto_30028 )
      ( MAKE-2CRATE-VERIFY ?auto_30026 ?auto_30027 ?auto_30028 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30045 - SURFACE
      ?auto_30046 - SURFACE
      ?auto_30047 - SURFACE
      ?auto_30048 - SURFACE
    )
    :vars
    (
      ?auto_30062 - HOIST
      ?auto_30055 - PLACE
      ?auto_30060 - PLACE
      ?auto_30056 - HOIST
      ?auto_30051 - SURFACE
      ?auto_30063 - PLACE
      ?auto_30050 - HOIST
      ?auto_30057 - SURFACE
      ?auto_30058 - PLACE
      ?auto_30061 - HOIST
      ?auto_30059 - SURFACE
      ?auto_30049 - SURFACE
      ?auto_30053 - TRUCK
      ?auto_30054 - PLACE
      ?auto_30052 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30062 ?auto_30055 ) ( IS-CRATE ?auto_30048 ) ( not ( = ?auto_30047 ?auto_30048 ) ) ( not ( = ?auto_30046 ?auto_30047 ) ) ( not ( = ?auto_30046 ?auto_30048 ) ) ( not ( = ?auto_30060 ?auto_30055 ) ) ( HOIST-AT ?auto_30056 ?auto_30060 ) ( not ( = ?auto_30062 ?auto_30056 ) ) ( AVAILABLE ?auto_30056 ) ( SURFACE-AT ?auto_30048 ?auto_30060 ) ( ON ?auto_30048 ?auto_30051 ) ( CLEAR ?auto_30048 ) ( not ( = ?auto_30047 ?auto_30051 ) ) ( not ( = ?auto_30048 ?auto_30051 ) ) ( not ( = ?auto_30046 ?auto_30051 ) ) ( IS-CRATE ?auto_30047 ) ( not ( = ?auto_30063 ?auto_30055 ) ) ( not ( = ?auto_30060 ?auto_30063 ) ) ( HOIST-AT ?auto_30050 ?auto_30063 ) ( not ( = ?auto_30062 ?auto_30050 ) ) ( not ( = ?auto_30056 ?auto_30050 ) ) ( AVAILABLE ?auto_30050 ) ( SURFACE-AT ?auto_30047 ?auto_30063 ) ( ON ?auto_30047 ?auto_30057 ) ( CLEAR ?auto_30047 ) ( not ( = ?auto_30047 ?auto_30057 ) ) ( not ( = ?auto_30048 ?auto_30057 ) ) ( not ( = ?auto_30046 ?auto_30057 ) ) ( not ( = ?auto_30051 ?auto_30057 ) ) ( IS-CRATE ?auto_30046 ) ( not ( = ?auto_30045 ?auto_30046 ) ) ( not ( = ?auto_30047 ?auto_30045 ) ) ( not ( = ?auto_30048 ?auto_30045 ) ) ( not ( = ?auto_30051 ?auto_30045 ) ) ( not ( = ?auto_30057 ?auto_30045 ) ) ( not ( = ?auto_30058 ?auto_30055 ) ) ( not ( = ?auto_30060 ?auto_30058 ) ) ( not ( = ?auto_30063 ?auto_30058 ) ) ( HOIST-AT ?auto_30061 ?auto_30058 ) ( not ( = ?auto_30062 ?auto_30061 ) ) ( not ( = ?auto_30056 ?auto_30061 ) ) ( not ( = ?auto_30050 ?auto_30061 ) ) ( AVAILABLE ?auto_30061 ) ( SURFACE-AT ?auto_30046 ?auto_30058 ) ( ON ?auto_30046 ?auto_30059 ) ( CLEAR ?auto_30046 ) ( not ( = ?auto_30047 ?auto_30059 ) ) ( not ( = ?auto_30048 ?auto_30059 ) ) ( not ( = ?auto_30046 ?auto_30059 ) ) ( not ( = ?auto_30051 ?auto_30059 ) ) ( not ( = ?auto_30057 ?auto_30059 ) ) ( not ( = ?auto_30045 ?auto_30059 ) ) ( SURFACE-AT ?auto_30049 ?auto_30055 ) ( CLEAR ?auto_30049 ) ( IS-CRATE ?auto_30045 ) ( not ( = ?auto_30049 ?auto_30045 ) ) ( not ( = ?auto_30047 ?auto_30049 ) ) ( not ( = ?auto_30048 ?auto_30049 ) ) ( not ( = ?auto_30046 ?auto_30049 ) ) ( not ( = ?auto_30051 ?auto_30049 ) ) ( not ( = ?auto_30057 ?auto_30049 ) ) ( not ( = ?auto_30059 ?auto_30049 ) ) ( AVAILABLE ?auto_30062 ) ( TRUCK-AT ?auto_30053 ?auto_30054 ) ( not ( = ?auto_30054 ?auto_30055 ) ) ( not ( = ?auto_30060 ?auto_30054 ) ) ( not ( = ?auto_30063 ?auto_30054 ) ) ( not ( = ?auto_30058 ?auto_30054 ) ) ( HOIST-AT ?auto_30052 ?auto_30054 ) ( LIFTING ?auto_30052 ?auto_30045 ) ( not ( = ?auto_30062 ?auto_30052 ) ) ( not ( = ?auto_30056 ?auto_30052 ) ) ( not ( = ?auto_30050 ?auto_30052 ) ) ( not ( = ?auto_30061 ?auto_30052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30046 ?auto_30047 ?auto_30048 )
      ( MAKE-3CRATE-VERIFY ?auto_30045 ?auto_30046 ?auto_30047 ?auto_30048 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30064 - SURFACE
      ?auto_30065 - SURFACE
      ?auto_30066 - SURFACE
      ?auto_30067 - SURFACE
      ?auto_30068 - SURFACE
    )
    :vars
    (
      ?auto_30081 - HOIST
      ?auto_30074 - PLACE
      ?auto_30079 - PLACE
      ?auto_30075 - HOIST
      ?auto_30070 - SURFACE
      ?auto_30082 - PLACE
      ?auto_30069 - HOIST
      ?auto_30076 - SURFACE
      ?auto_30077 - PLACE
      ?auto_30080 - HOIST
      ?auto_30078 - SURFACE
      ?auto_30072 - TRUCK
      ?auto_30073 - PLACE
      ?auto_30071 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30081 ?auto_30074 ) ( IS-CRATE ?auto_30068 ) ( not ( = ?auto_30067 ?auto_30068 ) ) ( not ( = ?auto_30066 ?auto_30067 ) ) ( not ( = ?auto_30066 ?auto_30068 ) ) ( not ( = ?auto_30079 ?auto_30074 ) ) ( HOIST-AT ?auto_30075 ?auto_30079 ) ( not ( = ?auto_30081 ?auto_30075 ) ) ( AVAILABLE ?auto_30075 ) ( SURFACE-AT ?auto_30068 ?auto_30079 ) ( ON ?auto_30068 ?auto_30070 ) ( CLEAR ?auto_30068 ) ( not ( = ?auto_30067 ?auto_30070 ) ) ( not ( = ?auto_30068 ?auto_30070 ) ) ( not ( = ?auto_30066 ?auto_30070 ) ) ( IS-CRATE ?auto_30067 ) ( not ( = ?auto_30082 ?auto_30074 ) ) ( not ( = ?auto_30079 ?auto_30082 ) ) ( HOIST-AT ?auto_30069 ?auto_30082 ) ( not ( = ?auto_30081 ?auto_30069 ) ) ( not ( = ?auto_30075 ?auto_30069 ) ) ( AVAILABLE ?auto_30069 ) ( SURFACE-AT ?auto_30067 ?auto_30082 ) ( ON ?auto_30067 ?auto_30076 ) ( CLEAR ?auto_30067 ) ( not ( = ?auto_30067 ?auto_30076 ) ) ( not ( = ?auto_30068 ?auto_30076 ) ) ( not ( = ?auto_30066 ?auto_30076 ) ) ( not ( = ?auto_30070 ?auto_30076 ) ) ( IS-CRATE ?auto_30066 ) ( not ( = ?auto_30065 ?auto_30066 ) ) ( not ( = ?auto_30067 ?auto_30065 ) ) ( not ( = ?auto_30068 ?auto_30065 ) ) ( not ( = ?auto_30070 ?auto_30065 ) ) ( not ( = ?auto_30076 ?auto_30065 ) ) ( not ( = ?auto_30077 ?auto_30074 ) ) ( not ( = ?auto_30079 ?auto_30077 ) ) ( not ( = ?auto_30082 ?auto_30077 ) ) ( HOIST-AT ?auto_30080 ?auto_30077 ) ( not ( = ?auto_30081 ?auto_30080 ) ) ( not ( = ?auto_30075 ?auto_30080 ) ) ( not ( = ?auto_30069 ?auto_30080 ) ) ( AVAILABLE ?auto_30080 ) ( SURFACE-AT ?auto_30066 ?auto_30077 ) ( ON ?auto_30066 ?auto_30078 ) ( CLEAR ?auto_30066 ) ( not ( = ?auto_30067 ?auto_30078 ) ) ( not ( = ?auto_30068 ?auto_30078 ) ) ( not ( = ?auto_30066 ?auto_30078 ) ) ( not ( = ?auto_30070 ?auto_30078 ) ) ( not ( = ?auto_30076 ?auto_30078 ) ) ( not ( = ?auto_30065 ?auto_30078 ) ) ( SURFACE-AT ?auto_30064 ?auto_30074 ) ( CLEAR ?auto_30064 ) ( IS-CRATE ?auto_30065 ) ( not ( = ?auto_30064 ?auto_30065 ) ) ( not ( = ?auto_30067 ?auto_30064 ) ) ( not ( = ?auto_30068 ?auto_30064 ) ) ( not ( = ?auto_30066 ?auto_30064 ) ) ( not ( = ?auto_30070 ?auto_30064 ) ) ( not ( = ?auto_30076 ?auto_30064 ) ) ( not ( = ?auto_30078 ?auto_30064 ) ) ( AVAILABLE ?auto_30081 ) ( TRUCK-AT ?auto_30072 ?auto_30073 ) ( not ( = ?auto_30073 ?auto_30074 ) ) ( not ( = ?auto_30079 ?auto_30073 ) ) ( not ( = ?auto_30082 ?auto_30073 ) ) ( not ( = ?auto_30077 ?auto_30073 ) ) ( HOIST-AT ?auto_30071 ?auto_30073 ) ( LIFTING ?auto_30071 ?auto_30065 ) ( not ( = ?auto_30081 ?auto_30071 ) ) ( not ( = ?auto_30075 ?auto_30071 ) ) ( not ( = ?auto_30069 ?auto_30071 ) ) ( not ( = ?auto_30080 ?auto_30071 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30066 ?auto_30067 ?auto_30068 )
      ( MAKE-4CRATE-VERIFY ?auto_30064 ?auto_30065 ?auto_30066 ?auto_30067 ?auto_30068 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30083 - SURFACE
      ?auto_30084 - SURFACE
    )
    :vars
    (
      ?auto_30099 - HOIST
      ?auto_30092 - PLACE
      ?auto_30086 - SURFACE
      ?auto_30097 - PLACE
      ?auto_30093 - HOIST
      ?auto_30088 - SURFACE
      ?auto_30101 - PLACE
      ?auto_30087 - HOIST
      ?auto_30094 - SURFACE
      ?auto_30100 - SURFACE
      ?auto_30095 - PLACE
      ?auto_30098 - HOIST
      ?auto_30096 - SURFACE
      ?auto_30085 - SURFACE
      ?auto_30090 - TRUCK
      ?auto_30091 - PLACE
      ?auto_30089 - HOIST
      ?auto_30102 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30099 ?auto_30092 ) ( IS-CRATE ?auto_30084 ) ( not ( = ?auto_30083 ?auto_30084 ) ) ( not ( = ?auto_30086 ?auto_30083 ) ) ( not ( = ?auto_30086 ?auto_30084 ) ) ( not ( = ?auto_30097 ?auto_30092 ) ) ( HOIST-AT ?auto_30093 ?auto_30097 ) ( not ( = ?auto_30099 ?auto_30093 ) ) ( AVAILABLE ?auto_30093 ) ( SURFACE-AT ?auto_30084 ?auto_30097 ) ( ON ?auto_30084 ?auto_30088 ) ( CLEAR ?auto_30084 ) ( not ( = ?auto_30083 ?auto_30088 ) ) ( not ( = ?auto_30084 ?auto_30088 ) ) ( not ( = ?auto_30086 ?auto_30088 ) ) ( IS-CRATE ?auto_30083 ) ( not ( = ?auto_30101 ?auto_30092 ) ) ( not ( = ?auto_30097 ?auto_30101 ) ) ( HOIST-AT ?auto_30087 ?auto_30101 ) ( not ( = ?auto_30099 ?auto_30087 ) ) ( not ( = ?auto_30093 ?auto_30087 ) ) ( AVAILABLE ?auto_30087 ) ( SURFACE-AT ?auto_30083 ?auto_30101 ) ( ON ?auto_30083 ?auto_30094 ) ( CLEAR ?auto_30083 ) ( not ( = ?auto_30083 ?auto_30094 ) ) ( not ( = ?auto_30084 ?auto_30094 ) ) ( not ( = ?auto_30086 ?auto_30094 ) ) ( not ( = ?auto_30088 ?auto_30094 ) ) ( IS-CRATE ?auto_30086 ) ( not ( = ?auto_30100 ?auto_30086 ) ) ( not ( = ?auto_30083 ?auto_30100 ) ) ( not ( = ?auto_30084 ?auto_30100 ) ) ( not ( = ?auto_30088 ?auto_30100 ) ) ( not ( = ?auto_30094 ?auto_30100 ) ) ( not ( = ?auto_30095 ?auto_30092 ) ) ( not ( = ?auto_30097 ?auto_30095 ) ) ( not ( = ?auto_30101 ?auto_30095 ) ) ( HOIST-AT ?auto_30098 ?auto_30095 ) ( not ( = ?auto_30099 ?auto_30098 ) ) ( not ( = ?auto_30093 ?auto_30098 ) ) ( not ( = ?auto_30087 ?auto_30098 ) ) ( AVAILABLE ?auto_30098 ) ( SURFACE-AT ?auto_30086 ?auto_30095 ) ( ON ?auto_30086 ?auto_30096 ) ( CLEAR ?auto_30086 ) ( not ( = ?auto_30083 ?auto_30096 ) ) ( not ( = ?auto_30084 ?auto_30096 ) ) ( not ( = ?auto_30086 ?auto_30096 ) ) ( not ( = ?auto_30088 ?auto_30096 ) ) ( not ( = ?auto_30094 ?auto_30096 ) ) ( not ( = ?auto_30100 ?auto_30096 ) ) ( SURFACE-AT ?auto_30085 ?auto_30092 ) ( CLEAR ?auto_30085 ) ( IS-CRATE ?auto_30100 ) ( not ( = ?auto_30085 ?auto_30100 ) ) ( not ( = ?auto_30083 ?auto_30085 ) ) ( not ( = ?auto_30084 ?auto_30085 ) ) ( not ( = ?auto_30086 ?auto_30085 ) ) ( not ( = ?auto_30088 ?auto_30085 ) ) ( not ( = ?auto_30094 ?auto_30085 ) ) ( not ( = ?auto_30096 ?auto_30085 ) ) ( AVAILABLE ?auto_30099 ) ( TRUCK-AT ?auto_30090 ?auto_30091 ) ( not ( = ?auto_30091 ?auto_30092 ) ) ( not ( = ?auto_30097 ?auto_30091 ) ) ( not ( = ?auto_30101 ?auto_30091 ) ) ( not ( = ?auto_30095 ?auto_30091 ) ) ( HOIST-AT ?auto_30089 ?auto_30091 ) ( not ( = ?auto_30099 ?auto_30089 ) ) ( not ( = ?auto_30093 ?auto_30089 ) ) ( not ( = ?auto_30087 ?auto_30089 ) ) ( not ( = ?auto_30098 ?auto_30089 ) ) ( AVAILABLE ?auto_30089 ) ( SURFACE-AT ?auto_30100 ?auto_30091 ) ( ON ?auto_30100 ?auto_30102 ) ( CLEAR ?auto_30100 ) ( not ( = ?auto_30083 ?auto_30102 ) ) ( not ( = ?auto_30084 ?auto_30102 ) ) ( not ( = ?auto_30086 ?auto_30102 ) ) ( not ( = ?auto_30088 ?auto_30102 ) ) ( not ( = ?auto_30094 ?auto_30102 ) ) ( not ( = ?auto_30100 ?auto_30102 ) ) ( not ( = ?auto_30096 ?auto_30102 ) ) ( not ( = ?auto_30085 ?auto_30102 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30089 ?auto_30100 ?auto_30102 ?auto_30091 )
      ( MAKE-2CRATE ?auto_30086 ?auto_30083 ?auto_30084 )
      ( MAKE-1CRATE-VERIFY ?auto_30083 ?auto_30084 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30103 - SURFACE
      ?auto_30104 - SURFACE
      ?auto_30105 - SURFACE
    )
    :vars
    (
      ?auto_30116 - HOIST
      ?auto_30108 - PLACE
      ?auto_30118 - PLACE
      ?auto_30112 - HOIST
      ?auto_30119 - SURFACE
      ?auto_30120 - PLACE
      ?auto_30111 - HOIST
      ?auto_30113 - SURFACE
      ?auto_30115 - SURFACE
      ?auto_30121 - PLACE
      ?auto_30107 - HOIST
      ?auto_30106 - SURFACE
      ?auto_30122 - SURFACE
      ?auto_30109 - TRUCK
      ?auto_30110 - PLACE
      ?auto_30117 - HOIST
      ?auto_30114 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30116 ?auto_30108 ) ( IS-CRATE ?auto_30105 ) ( not ( = ?auto_30104 ?auto_30105 ) ) ( not ( = ?auto_30103 ?auto_30104 ) ) ( not ( = ?auto_30103 ?auto_30105 ) ) ( not ( = ?auto_30118 ?auto_30108 ) ) ( HOIST-AT ?auto_30112 ?auto_30118 ) ( not ( = ?auto_30116 ?auto_30112 ) ) ( AVAILABLE ?auto_30112 ) ( SURFACE-AT ?auto_30105 ?auto_30118 ) ( ON ?auto_30105 ?auto_30119 ) ( CLEAR ?auto_30105 ) ( not ( = ?auto_30104 ?auto_30119 ) ) ( not ( = ?auto_30105 ?auto_30119 ) ) ( not ( = ?auto_30103 ?auto_30119 ) ) ( IS-CRATE ?auto_30104 ) ( not ( = ?auto_30120 ?auto_30108 ) ) ( not ( = ?auto_30118 ?auto_30120 ) ) ( HOIST-AT ?auto_30111 ?auto_30120 ) ( not ( = ?auto_30116 ?auto_30111 ) ) ( not ( = ?auto_30112 ?auto_30111 ) ) ( AVAILABLE ?auto_30111 ) ( SURFACE-AT ?auto_30104 ?auto_30120 ) ( ON ?auto_30104 ?auto_30113 ) ( CLEAR ?auto_30104 ) ( not ( = ?auto_30104 ?auto_30113 ) ) ( not ( = ?auto_30105 ?auto_30113 ) ) ( not ( = ?auto_30103 ?auto_30113 ) ) ( not ( = ?auto_30119 ?auto_30113 ) ) ( IS-CRATE ?auto_30103 ) ( not ( = ?auto_30115 ?auto_30103 ) ) ( not ( = ?auto_30104 ?auto_30115 ) ) ( not ( = ?auto_30105 ?auto_30115 ) ) ( not ( = ?auto_30119 ?auto_30115 ) ) ( not ( = ?auto_30113 ?auto_30115 ) ) ( not ( = ?auto_30121 ?auto_30108 ) ) ( not ( = ?auto_30118 ?auto_30121 ) ) ( not ( = ?auto_30120 ?auto_30121 ) ) ( HOIST-AT ?auto_30107 ?auto_30121 ) ( not ( = ?auto_30116 ?auto_30107 ) ) ( not ( = ?auto_30112 ?auto_30107 ) ) ( not ( = ?auto_30111 ?auto_30107 ) ) ( AVAILABLE ?auto_30107 ) ( SURFACE-AT ?auto_30103 ?auto_30121 ) ( ON ?auto_30103 ?auto_30106 ) ( CLEAR ?auto_30103 ) ( not ( = ?auto_30104 ?auto_30106 ) ) ( not ( = ?auto_30105 ?auto_30106 ) ) ( not ( = ?auto_30103 ?auto_30106 ) ) ( not ( = ?auto_30119 ?auto_30106 ) ) ( not ( = ?auto_30113 ?auto_30106 ) ) ( not ( = ?auto_30115 ?auto_30106 ) ) ( SURFACE-AT ?auto_30122 ?auto_30108 ) ( CLEAR ?auto_30122 ) ( IS-CRATE ?auto_30115 ) ( not ( = ?auto_30122 ?auto_30115 ) ) ( not ( = ?auto_30104 ?auto_30122 ) ) ( not ( = ?auto_30105 ?auto_30122 ) ) ( not ( = ?auto_30103 ?auto_30122 ) ) ( not ( = ?auto_30119 ?auto_30122 ) ) ( not ( = ?auto_30113 ?auto_30122 ) ) ( not ( = ?auto_30106 ?auto_30122 ) ) ( AVAILABLE ?auto_30116 ) ( TRUCK-AT ?auto_30109 ?auto_30110 ) ( not ( = ?auto_30110 ?auto_30108 ) ) ( not ( = ?auto_30118 ?auto_30110 ) ) ( not ( = ?auto_30120 ?auto_30110 ) ) ( not ( = ?auto_30121 ?auto_30110 ) ) ( HOIST-AT ?auto_30117 ?auto_30110 ) ( not ( = ?auto_30116 ?auto_30117 ) ) ( not ( = ?auto_30112 ?auto_30117 ) ) ( not ( = ?auto_30111 ?auto_30117 ) ) ( not ( = ?auto_30107 ?auto_30117 ) ) ( AVAILABLE ?auto_30117 ) ( SURFACE-AT ?auto_30115 ?auto_30110 ) ( ON ?auto_30115 ?auto_30114 ) ( CLEAR ?auto_30115 ) ( not ( = ?auto_30104 ?auto_30114 ) ) ( not ( = ?auto_30105 ?auto_30114 ) ) ( not ( = ?auto_30103 ?auto_30114 ) ) ( not ( = ?auto_30119 ?auto_30114 ) ) ( not ( = ?auto_30113 ?auto_30114 ) ) ( not ( = ?auto_30115 ?auto_30114 ) ) ( not ( = ?auto_30106 ?auto_30114 ) ) ( not ( = ?auto_30122 ?auto_30114 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30104 ?auto_30105 )
      ( MAKE-2CRATE-VERIFY ?auto_30103 ?auto_30104 ?auto_30105 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30123 - SURFACE
      ?auto_30124 - SURFACE
      ?auto_30125 - SURFACE
      ?auto_30126 - SURFACE
    )
    :vars
    (
      ?auto_30135 - HOIST
      ?auto_30130 - PLACE
      ?auto_30136 - PLACE
      ?auto_30129 - HOIST
      ?auto_30137 - SURFACE
      ?auto_30138 - PLACE
      ?auto_30140 - HOIST
      ?auto_30128 - SURFACE
      ?auto_30142 - PLACE
      ?auto_30141 - HOIST
      ?auto_30133 - SURFACE
      ?auto_30127 - SURFACE
      ?auto_30139 - TRUCK
      ?auto_30134 - PLACE
      ?auto_30132 - HOIST
      ?auto_30131 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30135 ?auto_30130 ) ( IS-CRATE ?auto_30126 ) ( not ( = ?auto_30125 ?auto_30126 ) ) ( not ( = ?auto_30124 ?auto_30125 ) ) ( not ( = ?auto_30124 ?auto_30126 ) ) ( not ( = ?auto_30136 ?auto_30130 ) ) ( HOIST-AT ?auto_30129 ?auto_30136 ) ( not ( = ?auto_30135 ?auto_30129 ) ) ( AVAILABLE ?auto_30129 ) ( SURFACE-AT ?auto_30126 ?auto_30136 ) ( ON ?auto_30126 ?auto_30137 ) ( CLEAR ?auto_30126 ) ( not ( = ?auto_30125 ?auto_30137 ) ) ( not ( = ?auto_30126 ?auto_30137 ) ) ( not ( = ?auto_30124 ?auto_30137 ) ) ( IS-CRATE ?auto_30125 ) ( not ( = ?auto_30138 ?auto_30130 ) ) ( not ( = ?auto_30136 ?auto_30138 ) ) ( HOIST-AT ?auto_30140 ?auto_30138 ) ( not ( = ?auto_30135 ?auto_30140 ) ) ( not ( = ?auto_30129 ?auto_30140 ) ) ( AVAILABLE ?auto_30140 ) ( SURFACE-AT ?auto_30125 ?auto_30138 ) ( ON ?auto_30125 ?auto_30128 ) ( CLEAR ?auto_30125 ) ( not ( = ?auto_30125 ?auto_30128 ) ) ( not ( = ?auto_30126 ?auto_30128 ) ) ( not ( = ?auto_30124 ?auto_30128 ) ) ( not ( = ?auto_30137 ?auto_30128 ) ) ( IS-CRATE ?auto_30124 ) ( not ( = ?auto_30123 ?auto_30124 ) ) ( not ( = ?auto_30125 ?auto_30123 ) ) ( not ( = ?auto_30126 ?auto_30123 ) ) ( not ( = ?auto_30137 ?auto_30123 ) ) ( not ( = ?auto_30128 ?auto_30123 ) ) ( not ( = ?auto_30142 ?auto_30130 ) ) ( not ( = ?auto_30136 ?auto_30142 ) ) ( not ( = ?auto_30138 ?auto_30142 ) ) ( HOIST-AT ?auto_30141 ?auto_30142 ) ( not ( = ?auto_30135 ?auto_30141 ) ) ( not ( = ?auto_30129 ?auto_30141 ) ) ( not ( = ?auto_30140 ?auto_30141 ) ) ( AVAILABLE ?auto_30141 ) ( SURFACE-AT ?auto_30124 ?auto_30142 ) ( ON ?auto_30124 ?auto_30133 ) ( CLEAR ?auto_30124 ) ( not ( = ?auto_30125 ?auto_30133 ) ) ( not ( = ?auto_30126 ?auto_30133 ) ) ( not ( = ?auto_30124 ?auto_30133 ) ) ( not ( = ?auto_30137 ?auto_30133 ) ) ( not ( = ?auto_30128 ?auto_30133 ) ) ( not ( = ?auto_30123 ?auto_30133 ) ) ( SURFACE-AT ?auto_30127 ?auto_30130 ) ( CLEAR ?auto_30127 ) ( IS-CRATE ?auto_30123 ) ( not ( = ?auto_30127 ?auto_30123 ) ) ( not ( = ?auto_30125 ?auto_30127 ) ) ( not ( = ?auto_30126 ?auto_30127 ) ) ( not ( = ?auto_30124 ?auto_30127 ) ) ( not ( = ?auto_30137 ?auto_30127 ) ) ( not ( = ?auto_30128 ?auto_30127 ) ) ( not ( = ?auto_30133 ?auto_30127 ) ) ( AVAILABLE ?auto_30135 ) ( TRUCK-AT ?auto_30139 ?auto_30134 ) ( not ( = ?auto_30134 ?auto_30130 ) ) ( not ( = ?auto_30136 ?auto_30134 ) ) ( not ( = ?auto_30138 ?auto_30134 ) ) ( not ( = ?auto_30142 ?auto_30134 ) ) ( HOIST-AT ?auto_30132 ?auto_30134 ) ( not ( = ?auto_30135 ?auto_30132 ) ) ( not ( = ?auto_30129 ?auto_30132 ) ) ( not ( = ?auto_30140 ?auto_30132 ) ) ( not ( = ?auto_30141 ?auto_30132 ) ) ( AVAILABLE ?auto_30132 ) ( SURFACE-AT ?auto_30123 ?auto_30134 ) ( ON ?auto_30123 ?auto_30131 ) ( CLEAR ?auto_30123 ) ( not ( = ?auto_30125 ?auto_30131 ) ) ( not ( = ?auto_30126 ?auto_30131 ) ) ( not ( = ?auto_30124 ?auto_30131 ) ) ( not ( = ?auto_30137 ?auto_30131 ) ) ( not ( = ?auto_30128 ?auto_30131 ) ) ( not ( = ?auto_30123 ?auto_30131 ) ) ( not ( = ?auto_30133 ?auto_30131 ) ) ( not ( = ?auto_30127 ?auto_30131 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30124 ?auto_30125 ?auto_30126 )
      ( MAKE-3CRATE-VERIFY ?auto_30123 ?auto_30124 ?auto_30125 ?auto_30126 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30143 - SURFACE
      ?auto_30144 - SURFACE
      ?auto_30145 - SURFACE
      ?auto_30146 - SURFACE
      ?auto_30147 - SURFACE
    )
    :vars
    (
      ?auto_30155 - HOIST
      ?auto_30150 - PLACE
      ?auto_30156 - PLACE
      ?auto_30149 - HOIST
      ?auto_30157 - SURFACE
      ?auto_30158 - PLACE
      ?auto_30160 - HOIST
      ?auto_30148 - SURFACE
      ?auto_30162 - PLACE
      ?auto_30161 - HOIST
      ?auto_30153 - SURFACE
      ?auto_30159 - TRUCK
      ?auto_30154 - PLACE
      ?auto_30152 - HOIST
      ?auto_30151 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30155 ?auto_30150 ) ( IS-CRATE ?auto_30147 ) ( not ( = ?auto_30146 ?auto_30147 ) ) ( not ( = ?auto_30145 ?auto_30146 ) ) ( not ( = ?auto_30145 ?auto_30147 ) ) ( not ( = ?auto_30156 ?auto_30150 ) ) ( HOIST-AT ?auto_30149 ?auto_30156 ) ( not ( = ?auto_30155 ?auto_30149 ) ) ( AVAILABLE ?auto_30149 ) ( SURFACE-AT ?auto_30147 ?auto_30156 ) ( ON ?auto_30147 ?auto_30157 ) ( CLEAR ?auto_30147 ) ( not ( = ?auto_30146 ?auto_30157 ) ) ( not ( = ?auto_30147 ?auto_30157 ) ) ( not ( = ?auto_30145 ?auto_30157 ) ) ( IS-CRATE ?auto_30146 ) ( not ( = ?auto_30158 ?auto_30150 ) ) ( not ( = ?auto_30156 ?auto_30158 ) ) ( HOIST-AT ?auto_30160 ?auto_30158 ) ( not ( = ?auto_30155 ?auto_30160 ) ) ( not ( = ?auto_30149 ?auto_30160 ) ) ( AVAILABLE ?auto_30160 ) ( SURFACE-AT ?auto_30146 ?auto_30158 ) ( ON ?auto_30146 ?auto_30148 ) ( CLEAR ?auto_30146 ) ( not ( = ?auto_30146 ?auto_30148 ) ) ( not ( = ?auto_30147 ?auto_30148 ) ) ( not ( = ?auto_30145 ?auto_30148 ) ) ( not ( = ?auto_30157 ?auto_30148 ) ) ( IS-CRATE ?auto_30145 ) ( not ( = ?auto_30144 ?auto_30145 ) ) ( not ( = ?auto_30146 ?auto_30144 ) ) ( not ( = ?auto_30147 ?auto_30144 ) ) ( not ( = ?auto_30157 ?auto_30144 ) ) ( not ( = ?auto_30148 ?auto_30144 ) ) ( not ( = ?auto_30162 ?auto_30150 ) ) ( not ( = ?auto_30156 ?auto_30162 ) ) ( not ( = ?auto_30158 ?auto_30162 ) ) ( HOIST-AT ?auto_30161 ?auto_30162 ) ( not ( = ?auto_30155 ?auto_30161 ) ) ( not ( = ?auto_30149 ?auto_30161 ) ) ( not ( = ?auto_30160 ?auto_30161 ) ) ( AVAILABLE ?auto_30161 ) ( SURFACE-AT ?auto_30145 ?auto_30162 ) ( ON ?auto_30145 ?auto_30153 ) ( CLEAR ?auto_30145 ) ( not ( = ?auto_30146 ?auto_30153 ) ) ( not ( = ?auto_30147 ?auto_30153 ) ) ( not ( = ?auto_30145 ?auto_30153 ) ) ( not ( = ?auto_30157 ?auto_30153 ) ) ( not ( = ?auto_30148 ?auto_30153 ) ) ( not ( = ?auto_30144 ?auto_30153 ) ) ( SURFACE-AT ?auto_30143 ?auto_30150 ) ( CLEAR ?auto_30143 ) ( IS-CRATE ?auto_30144 ) ( not ( = ?auto_30143 ?auto_30144 ) ) ( not ( = ?auto_30146 ?auto_30143 ) ) ( not ( = ?auto_30147 ?auto_30143 ) ) ( not ( = ?auto_30145 ?auto_30143 ) ) ( not ( = ?auto_30157 ?auto_30143 ) ) ( not ( = ?auto_30148 ?auto_30143 ) ) ( not ( = ?auto_30153 ?auto_30143 ) ) ( AVAILABLE ?auto_30155 ) ( TRUCK-AT ?auto_30159 ?auto_30154 ) ( not ( = ?auto_30154 ?auto_30150 ) ) ( not ( = ?auto_30156 ?auto_30154 ) ) ( not ( = ?auto_30158 ?auto_30154 ) ) ( not ( = ?auto_30162 ?auto_30154 ) ) ( HOIST-AT ?auto_30152 ?auto_30154 ) ( not ( = ?auto_30155 ?auto_30152 ) ) ( not ( = ?auto_30149 ?auto_30152 ) ) ( not ( = ?auto_30160 ?auto_30152 ) ) ( not ( = ?auto_30161 ?auto_30152 ) ) ( AVAILABLE ?auto_30152 ) ( SURFACE-AT ?auto_30144 ?auto_30154 ) ( ON ?auto_30144 ?auto_30151 ) ( CLEAR ?auto_30144 ) ( not ( = ?auto_30146 ?auto_30151 ) ) ( not ( = ?auto_30147 ?auto_30151 ) ) ( not ( = ?auto_30145 ?auto_30151 ) ) ( not ( = ?auto_30157 ?auto_30151 ) ) ( not ( = ?auto_30148 ?auto_30151 ) ) ( not ( = ?auto_30144 ?auto_30151 ) ) ( not ( = ?auto_30153 ?auto_30151 ) ) ( not ( = ?auto_30143 ?auto_30151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30145 ?auto_30146 ?auto_30147 )
      ( MAKE-4CRATE-VERIFY ?auto_30143 ?auto_30144 ?auto_30145 ?auto_30146 ?auto_30147 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30163 - SURFACE
      ?auto_30164 - SURFACE
    )
    :vars
    (
      ?auto_30174 - HOIST
      ?auto_30169 - PLACE
      ?auto_30177 - SURFACE
      ?auto_30175 - PLACE
      ?auto_30168 - HOIST
      ?auto_30176 - SURFACE
      ?auto_30178 - PLACE
      ?auto_30180 - HOIST
      ?auto_30167 - SURFACE
      ?auto_30166 - SURFACE
      ?auto_30182 - PLACE
      ?auto_30181 - HOIST
      ?auto_30172 - SURFACE
      ?auto_30165 - SURFACE
      ?auto_30173 - PLACE
      ?auto_30171 - HOIST
      ?auto_30170 - SURFACE
      ?auto_30179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30174 ?auto_30169 ) ( IS-CRATE ?auto_30164 ) ( not ( = ?auto_30163 ?auto_30164 ) ) ( not ( = ?auto_30177 ?auto_30163 ) ) ( not ( = ?auto_30177 ?auto_30164 ) ) ( not ( = ?auto_30175 ?auto_30169 ) ) ( HOIST-AT ?auto_30168 ?auto_30175 ) ( not ( = ?auto_30174 ?auto_30168 ) ) ( AVAILABLE ?auto_30168 ) ( SURFACE-AT ?auto_30164 ?auto_30175 ) ( ON ?auto_30164 ?auto_30176 ) ( CLEAR ?auto_30164 ) ( not ( = ?auto_30163 ?auto_30176 ) ) ( not ( = ?auto_30164 ?auto_30176 ) ) ( not ( = ?auto_30177 ?auto_30176 ) ) ( IS-CRATE ?auto_30163 ) ( not ( = ?auto_30178 ?auto_30169 ) ) ( not ( = ?auto_30175 ?auto_30178 ) ) ( HOIST-AT ?auto_30180 ?auto_30178 ) ( not ( = ?auto_30174 ?auto_30180 ) ) ( not ( = ?auto_30168 ?auto_30180 ) ) ( AVAILABLE ?auto_30180 ) ( SURFACE-AT ?auto_30163 ?auto_30178 ) ( ON ?auto_30163 ?auto_30167 ) ( CLEAR ?auto_30163 ) ( not ( = ?auto_30163 ?auto_30167 ) ) ( not ( = ?auto_30164 ?auto_30167 ) ) ( not ( = ?auto_30177 ?auto_30167 ) ) ( not ( = ?auto_30176 ?auto_30167 ) ) ( IS-CRATE ?auto_30177 ) ( not ( = ?auto_30166 ?auto_30177 ) ) ( not ( = ?auto_30163 ?auto_30166 ) ) ( not ( = ?auto_30164 ?auto_30166 ) ) ( not ( = ?auto_30176 ?auto_30166 ) ) ( not ( = ?auto_30167 ?auto_30166 ) ) ( not ( = ?auto_30182 ?auto_30169 ) ) ( not ( = ?auto_30175 ?auto_30182 ) ) ( not ( = ?auto_30178 ?auto_30182 ) ) ( HOIST-AT ?auto_30181 ?auto_30182 ) ( not ( = ?auto_30174 ?auto_30181 ) ) ( not ( = ?auto_30168 ?auto_30181 ) ) ( not ( = ?auto_30180 ?auto_30181 ) ) ( AVAILABLE ?auto_30181 ) ( SURFACE-AT ?auto_30177 ?auto_30182 ) ( ON ?auto_30177 ?auto_30172 ) ( CLEAR ?auto_30177 ) ( not ( = ?auto_30163 ?auto_30172 ) ) ( not ( = ?auto_30164 ?auto_30172 ) ) ( not ( = ?auto_30177 ?auto_30172 ) ) ( not ( = ?auto_30176 ?auto_30172 ) ) ( not ( = ?auto_30167 ?auto_30172 ) ) ( not ( = ?auto_30166 ?auto_30172 ) ) ( SURFACE-AT ?auto_30165 ?auto_30169 ) ( CLEAR ?auto_30165 ) ( IS-CRATE ?auto_30166 ) ( not ( = ?auto_30165 ?auto_30166 ) ) ( not ( = ?auto_30163 ?auto_30165 ) ) ( not ( = ?auto_30164 ?auto_30165 ) ) ( not ( = ?auto_30177 ?auto_30165 ) ) ( not ( = ?auto_30176 ?auto_30165 ) ) ( not ( = ?auto_30167 ?auto_30165 ) ) ( not ( = ?auto_30172 ?auto_30165 ) ) ( AVAILABLE ?auto_30174 ) ( not ( = ?auto_30173 ?auto_30169 ) ) ( not ( = ?auto_30175 ?auto_30173 ) ) ( not ( = ?auto_30178 ?auto_30173 ) ) ( not ( = ?auto_30182 ?auto_30173 ) ) ( HOIST-AT ?auto_30171 ?auto_30173 ) ( not ( = ?auto_30174 ?auto_30171 ) ) ( not ( = ?auto_30168 ?auto_30171 ) ) ( not ( = ?auto_30180 ?auto_30171 ) ) ( not ( = ?auto_30181 ?auto_30171 ) ) ( AVAILABLE ?auto_30171 ) ( SURFACE-AT ?auto_30166 ?auto_30173 ) ( ON ?auto_30166 ?auto_30170 ) ( CLEAR ?auto_30166 ) ( not ( = ?auto_30163 ?auto_30170 ) ) ( not ( = ?auto_30164 ?auto_30170 ) ) ( not ( = ?auto_30177 ?auto_30170 ) ) ( not ( = ?auto_30176 ?auto_30170 ) ) ( not ( = ?auto_30167 ?auto_30170 ) ) ( not ( = ?auto_30166 ?auto_30170 ) ) ( not ( = ?auto_30172 ?auto_30170 ) ) ( not ( = ?auto_30165 ?auto_30170 ) ) ( TRUCK-AT ?auto_30179 ?auto_30169 ) )
    :subtasks
    ( ( !DRIVE ?auto_30179 ?auto_30169 ?auto_30173 )
      ( MAKE-2CRATE ?auto_30177 ?auto_30163 ?auto_30164 )
      ( MAKE-1CRATE-VERIFY ?auto_30163 ?auto_30164 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30183 - SURFACE
      ?auto_30184 - SURFACE
      ?auto_30185 - SURFACE
    )
    :vars
    (
      ?auto_30195 - HOIST
      ?auto_30192 - PLACE
      ?auto_30202 - PLACE
      ?auto_30186 - HOIST
      ?auto_30198 - SURFACE
      ?auto_30187 - PLACE
      ?auto_30201 - HOIST
      ?auto_30194 - SURFACE
      ?auto_30188 - SURFACE
      ?auto_30200 - PLACE
      ?auto_30193 - HOIST
      ?auto_30196 - SURFACE
      ?auto_30191 - SURFACE
      ?auto_30199 - PLACE
      ?auto_30190 - HOIST
      ?auto_30189 - SURFACE
      ?auto_30197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30195 ?auto_30192 ) ( IS-CRATE ?auto_30185 ) ( not ( = ?auto_30184 ?auto_30185 ) ) ( not ( = ?auto_30183 ?auto_30184 ) ) ( not ( = ?auto_30183 ?auto_30185 ) ) ( not ( = ?auto_30202 ?auto_30192 ) ) ( HOIST-AT ?auto_30186 ?auto_30202 ) ( not ( = ?auto_30195 ?auto_30186 ) ) ( AVAILABLE ?auto_30186 ) ( SURFACE-AT ?auto_30185 ?auto_30202 ) ( ON ?auto_30185 ?auto_30198 ) ( CLEAR ?auto_30185 ) ( not ( = ?auto_30184 ?auto_30198 ) ) ( not ( = ?auto_30185 ?auto_30198 ) ) ( not ( = ?auto_30183 ?auto_30198 ) ) ( IS-CRATE ?auto_30184 ) ( not ( = ?auto_30187 ?auto_30192 ) ) ( not ( = ?auto_30202 ?auto_30187 ) ) ( HOIST-AT ?auto_30201 ?auto_30187 ) ( not ( = ?auto_30195 ?auto_30201 ) ) ( not ( = ?auto_30186 ?auto_30201 ) ) ( AVAILABLE ?auto_30201 ) ( SURFACE-AT ?auto_30184 ?auto_30187 ) ( ON ?auto_30184 ?auto_30194 ) ( CLEAR ?auto_30184 ) ( not ( = ?auto_30184 ?auto_30194 ) ) ( not ( = ?auto_30185 ?auto_30194 ) ) ( not ( = ?auto_30183 ?auto_30194 ) ) ( not ( = ?auto_30198 ?auto_30194 ) ) ( IS-CRATE ?auto_30183 ) ( not ( = ?auto_30188 ?auto_30183 ) ) ( not ( = ?auto_30184 ?auto_30188 ) ) ( not ( = ?auto_30185 ?auto_30188 ) ) ( not ( = ?auto_30198 ?auto_30188 ) ) ( not ( = ?auto_30194 ?auto_30188 ) ) ( not ( = ?auto_30200 ?auto_30192 ) ) ( not ( = ?auto_30202 ?auto_30200 ) ) ( not ( = ?auto_30187 ?auto_30200 ) ) ( HOIST-AT ?auto_30193 ?auto_30200 ) ( not ( = ?auto_30195 ?auto_30193 ) ) ( not ( = ?auto_30186 ?auto_30193 ) ) ( not ( = ?auto_30201 ?auto_30193 ) ) ( AVAILABLE ?auto_30193 ) ( SURFACE-AT ?auto_30183 ?auto_30200 ) ( ON ?auto_30183 ?auto_30196 ) ( CLEAR ?auto_30183 ) ( not ( = ?auto_30184 ?auto_30196 ) ) ( not ( = ?auto_30185 ?auto_30196 ) ) ( not ( = ?auto_30183 ?auto_30196 ) ) ( not ( = ?auto_30198 ?auto_30196 ) ) ( not ( = ?auto_30194 ?auto_30196 ) ) ( not ( = ?auto_30188 ?auto_30196 ) ) ( SURFACE-AT ?auto_30191 ?auto_30192 ) ( CLEAR ?auto_30191 ) ( IS-CRATE ?auto_30188 ) ( not ( = ?auto_30191 ?auto_30188 ) ) ( not ( = ?auto_30184 ?auto_30191 ) ) ( not ( = ?auto_30185 ?auto_30191 ) ) ( not ( = ?auto_30183 ?auto_30191 ) ) ( not ( = ?auto_30198 ?auto_30191 ) ) ( not ( = ?auto_30194 ?auto_30191 ) ) ( not ( = ?auto_30196 ?auto_30191 ) ) ( AVAILABLE ?auto_30195 ) ( not ( = ?auto_30199 ?auto_30192 ) ) ( not ( = ?auto_30202 ?auto_30199 ) ) ( not ( = ?auto_30187 ?auto_30199 ) ) ( not ( = ?auto_30200 ?auto_30199 ) ) ( HOIST-AT ?auto_30190 ?auto_30199 ) ( not ( = ?auto_30195 ?auto_30190 ) ) ( not ( = ?auto_30186 ?auto_30190 ) ) ( not ( = ?auto_30201 ?auto_30190 ) ) ( not ( = ?auto_30193 ?auto_30190 ) ) ( AVAILABLE ?auto_30190 ) ( SURFACE-AT ?auto_30188 ?auto_30199 ) ( ON ?auto_30188 ?auto_30189 ) ( CLEAR ?auto_30188 ) ( not ( = ?auto_30184 ?auto_30189 ) ) ( not ( = ?auto_30185 ?auto_30189 ) ) ( not ( = ?auto_30183 ?auto_30189 ) ) ( not ( = ?auto_30198 ?auto_30189 ) ) ( not ( = ?auto_30194 ?auto_30189 ) ) ( not ( = ?auto_30188 ?auto_30189 ) ) ( not ( = ?auto_30196 ?auto_30189 ) ) ( not ( = ?auto_30191 ?auto_30189 ) ) ( TRUCK-AT ?auto_30197 ?auto_30192 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30184 ?auto_30185 )
      ( MAKE-2CRATE-VERIFY ?auto_30183 ?auto_30184 ?auto_30185 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30203 - SURFACE
      ?auto_30204 - SURFACE
      ?auto_30205 - SURFACE
      ?auto_30206 - SURFACE
    )
    :vars
    (
      ?auto_30216 - HOIST
      ?auto_30209 - PLACE
      ?auto_30210 - PLACE
      ?auto_30217 - HOIST
      ?auto_30207 - SURFACE
      ?auto_30221 - PLACE
      ?auto_30208 - HOIST
      ?auto_30212 - SURFACE
      ?auto_30215 - PLACE
      ?auto_30222 - HOIST
      ?auto_30218 - SURFACE
      ?auto_30214 - SURFACE
      ?auto_30219 - PLACE
      ?auto_30213 - HOIST
      ?auto_30211 - SURFACE
      ?auto_30220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30216 ?auto_30209 ) ( IS-CRATE ?auto_30206 ) ( not ( = ?auto_30205 ?auto_30206 ) ) ( not ( = ?auto_30204 ?auto_30205 ) ) ( not ( = ?auto_30204 ?auto_30206 ) ) ( not ( = ?auto_30210 ?auto_30209 ) ) ( HOIST-AT ?auto_30217 ?auto_30210 ) ( not ( = ?auto_30216 ?auto_30217 ) ) ( AVAILABLE ?auto_30217 ) ( SURFACE-AT ?auto_30206 ?auto_30210 ) ( ON ?auto_30206 ?auto_30207 ) ( CLEAR ?auto_30206 ) ( not ( = ?auto_30205 ?auto_30207 ) ) ( not ( = ?auto_30206 ?auto_30207 ) ) ( not ( = ?auto_30204 ?auto_30207 ) ) ( IS-CRATE ?auto_30205 ) ( not ( = ?auto_30221 ?auto_30209 ) ) ( not ( = ?auto_30210 ?auto_30221 ) ) ( HOIST-AT ?auto_30208 ?auto_30221 ) ( not ( = ?auto_30216 ?auto_30208 ) ) ( not ( = ?auto_30217 ?auto_30208 ) ) ( AVAILABLE ?auto_30208 ) ( SURFACE-AT ?auto_30205 ?auto_30221 ) ( ON ?auto_30205 ?auto_30212 ) ( CLEAR ?auto_30205 ) ( not ( = ?auto_30205 ?auto_30212 ) ) ( not ( = ?auto_30206 ?auto_30212 ) ) ( not ( = ?auto_30204 ?auto_30212 ) ) ( not ( = ?auto_30207 ?auto_30212 ) ) ( IS-CRATE ?auto_30204 ) ( not ( = ?auto_30203 ?auto_30204 ) ) ( not ( = ?auto_30205 ?auto_30203 ) ) ( not ( = ?auto_30206 ?auto_30203 ) ) ( not ( = ?auto_30207 ?auto_30203 ) ) ( not ( = ?auto_30212 ?auto_30203 ) ) ( not ( = ?auto_30215 ?auto_30209 ) ) ( not ( = ?auto_30210 ?auto_30215 ) ) ( not ( = ?auto_30221 ?auto_30215 ) ) ( HOIST-AT ?auto_30222 ?auto_30215 ) ( not ( = ?auto_30216 ?auto_30222 ) ) ( not ( = ?auto_30217 ?auto_30222 ) ) ( not ( = ?auto_30208 ?auto_30222 ) ) ( AVAILABLE ?auto_30222 ) ( SURFACE-AT ?auto_30204 ?auto_30215 ) ( ON ?auto_30204 ?auto_30218 ) ( CLEAR ?auto_30204 ) ( not ( = ?auto_30205 ?auto_30218 ) ) ( not ( = ?auto_30206 ?auto_30218 ) ) ( not ( = ?auto_30204 ?auto_30218 ) ) ( not ( = ?auto_30207 ?auto_30218 ) ) ( not ( = ?auto_30212 ?auto_30218 ) ) ( not ( = ?auto_30203 ?auto_30218 ) ) ( SURFACE-AT ?auto_30214 ?auto_30209 ) ( CLEAR ?auto_30214 ) ( IS-CRATE ?auto_30203 ) ( not ( = ?auto_30214 ?auto_30203 ) ) ( not ( = ?auto_30205 ?auto_30214 ) ) ( not ( = ?auto_30206 ?auto_30214 ) ) ( not ( = ?auto_30204 ?auto_30214 ) ) ( not ( = ?auto_30207 ?auto_30214 ) ) ( not ( = ?auto_30212 ?auto_30214 ) ) ( not ( = ?auto_30218 ?auto_30214 ) ) ( AVAILABLE ?auto_30216 ) ( not ( = ?auto_30219 ?auto_30209 ) ) ( not ( = ?auto_30210 ?auto_30219 ) ) ( not ( = ?auto_30221 ?auto_30219 ) ) ( not ( = ?auto_30215 ?auto_30219 ) ) ( HOIST-AT ?auto_30213 ?auto_30219 ) ( not ( = ?auto_30216 ?auto_30213 ) ) ( not ( = ?auto_30217 ?auto_30213 ) ) ( not ( = ?auto_30208 ?auto_30213 ) ) ( not ( = ?auto_30222 ?auto_30213 ) ) ( AVAILABLE ?auto_30213 ) ( SURFACE-AT ?auto_30203 ?auto_30219 ) ( ON ?auto_30203 ?auto_30211 ) ( CLEAR ?auto_30203 ) ( not ( = ?auto_30205 ?auto_30211 ) ) ( not ( = ?auto_30206 ?auto_30211 ) ) ( not ( = ?auto_30204 ?auto_30211 ) ) ( not ( = ?auto_30207 ?auto_30211 ) ) ( not ( = ?auto_30212 ?auto_30211 ) ) ( not ( = ?auto_30203 ?auto_30211 ) ) ( not ( = ?auto_30218 ?auto_30211 ) ) ( not ( = ?auto_30214 ?auto_30211 ) ) ( TRUCK-AT ?auto_30220 ?auto_30209 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30204 ?auto_30205 ?auto_30206 )
      ( MAKE-3CRATE-VERIFY ?auto_30203 ?auto_30204 ?auto_30205 ?auto_30206 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30223 - SURFACE
      ?auto_30224 - SURFACE
      ?auto_30225 - SURFACE
      ?auto_30226 - SURFACE
      ?auto_30227 - SURFACE
    )
    :vars
    (
      ?auto_30236 - HOIST
      ?auto_30230 - PLACE
      ?auto_30231 - PLACE
      ?auto_30237 - HOIST
      ?auto_30228 - SURFACE
      ?auto_30241 - PLACE
      ?auto_30229 - HOIST
      ?auto_30233 - SURFACE
      ?auto_30235 - PLACE
      ?auto_30242 - HOIST
      ?auto_30238 - SURFACE
      ?auto_30239 - PLACE
      ?auto_30234 - HOIST
      ?auto_30232 - SURFACE
      ?auto_30240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30236 ?auto_30230 ) ( IS-CRATE ?auto_30227 ) ( not ( = ?auto_30226 ?auto_30227 ) ) ( not ( = ?auto_30225 ?auto_30226 ) ) ( not ( = ?auto_30225 ?auto_30227 ) ) ( not ( = ?auto_30231 ?auto_30230 ) ) ( HOIST-AT ?auto_30237 ?auto_30231 ) ( not ( = ?auto_30236 ?auto_30237 ) ) ( AVAILABLE ?auto_30237 ) ( SURFACE-AT ?auto_30227 ?auto_30231 ) ( ON ?auto_30227 ?auto_30228 ) ( CLEAR ?auto_30227 ) ( not ( = ?auto_30226 ?auto_30228 ) ) ( not ( = ?auto_30227 ?auto_30228 ) ) ( not ( = ?auto_30225 ?auto_30228 ) ) ( IS-CRATE ?auto_30226 ) ( not ( = ?auto_30241 ?auto_30230 ) ) ( not ( = ?auto_30231 ?auto_30241 ) ) ( HOIST-AT ?auto_30229 ?auto_30241 ) ( not ( = ?auto_30236 ?auto_30229 ) ) ( not ( = ?auto_30237 ?auto_30229 ) ) ( AVAILABLE ?auto_30229 ) ( SURFACE-AT ?auto_30226 ?auto_30241 ) ( ON ?auto_30226 ?auto_30233 ) ( CLEAR ?auto_30226 ) ( not ( = ?auto_30226 ?auto_30233 ) ) ( not ( = ?auto_30227 ?auto_30233 ) ) ( not ( = ?auto_30225 ?auto_30233 ) ) ( not ( = ?auto_30228 ?auto_30233 ) ) ( IS-CRATE ?auto_30225 ) ( not ( = ?auto_30224 ?auto_30225 ) ) ( not ( = ?auto_30226 ?auto_30224 ) ) ( not ( = ?auto_30227 ?auto_30224 ) ) ( not ( = ?auto_30228 ?auto_30224 ) ) ( not ( = ?auto_30233 ?auto_30224 ) ) ( not ( = ?auto_30235 ?auto_30230 ) ) ( not ( = ?auto_30231 ?auto_30235 ) ) ( not ( = ?auto_30241 ?auto_30235 ) ) ( HOIST-AT ?auto_30242 ?auto_30235 ) ( not ( = ?auto_30236 ?auto_30242 ) ) ( not ( = ?auto_30237 ?auto_30242 ) ) ( not ( = ?auto_30229 ?auto_30242 ) ) ( AVAILABLE ?auto_30242 ) ( SURFACE-AT ?auto_30225 ?auto_30235 ) ( ON ?auto_30225 ?auto_30238 ) ( CLEAR ?auto_30225 ) ( not ( = ?auto_30226 ?auto_30238 ) ) ( not ( = ?auto_30227 ?auto_30238 ) ) ( not ( = ?auto_30225 ?auto_30238 ) ) ( not ( = ?auto_30228 ?auto_30238 ) ) ( not ( = ?auto_30233 ?auto_30238 ) ) ( not ( = ?auto_30224 ?auto_30238 ) ) ( SURFACE-AT ?auto_30223 ?auto_30230 ) ( CLEAR ?auto_30223 ) ( IS-CRATE ?auto_30224 ) ( not ( = ?auto_30223 ?auto_30224 ) ) ( not ( = ?auto_30226 ?auto_30223 ) ) ( not ( = ?auto_30227 ?auto_30223 ) ) ( not ( = ?auto_30225 ?auto_30223 ) ) ( not ( = ?auto_30228 ?auto_30223 ) ) ( not ( = ?auto_30233 ?auto_30223 ) ) ( not ( = ?auto_30238 ?auto_30223 ) ) ( AVAILABLE ?auto_30236 ) ( not ( = ?auto_30239 ?auto_30230 ) ) ( not ( = ?auto_30231 ?auto_30239 ) ) ( not ( = ?auto_30241 ?auto_30239 ) ) ( not ( = ?auto_30235 ?auto_30239 ) ) ( HOIST-AT ?auto_30234 ?auto_30239 ) ( not ( = ?auto_30236 ?auto_30234 ) ) ( not ( = ?auto_30237 ?auto_30234 ) ) ( not ( = ?auto_30229 ?auto_30234 ) ) ( not ( = ?auto_30242 ?auto_30234 ) ) ( AVAILABLE ?auto_30234 ) ( SURFACE-AT ?auto_30224 ?auto_30239 ) ( ON ?auto_30224 ?auto_30232 ) ( CLEAR ?auto_30224 ) ( not ( = ?auto_30226 ?auto_30232 ) ) ( not ( = ?auto_30227 ?auto_30232 ) ) ( not ( = ?auto_30225 ?auto_30232 ) ) ( not ( = ?auto_30228 ?auto_30232 ) ) ( not ( = ?auto_30233 ?auto_30232 ) ) ( not ( = ?auto_30224 ?auto_30232 ) ) ( not ( = ?auto_30238 ?auto_30232 ) ) ( not ( = ?auto_30223 ?auto_30232 ) ) ( TRUCK-AT ?auto_30240 ?auto_30230 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30225 ?auto_30226 ?auto_30227 )
      ( MAKE-4CRATE-VERIFY ?auto_30223 ?auto_30224 ?auto_30225 ?auto_30226 ?auto_30227 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30263 - SURFACE
      ?auto_30264 - SURFACE
    )
    :vars
    (
      ?auto_30265 - HOIST
      ?auto_30266 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30265 ?auto_30266 ) ( SURFACE-AT ?auto_30263 ?auto_30266 ) ( CLEAR ?auto_30263 ) ( LIFTING ?auto_30265 ?auto_30264 ) ( IS-CRATE ?auto_30264 ) ( not ( = ?auto_30263 ?auto_30264 ) ) )
    :subtasks
    ( ( !DROP ?auto_30265 ?auto_30264 ?auto_30263 ?auto_30266 )
      ( MAKE-1CRATE-VERIFY ?auto_30263 ?auto_30264 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30267 - SURFACE
      ?auto_30268 - SURFACE
      ?auto_30269 - SURFACE
    )
    :vars
    (
      ?auto_30270 - HOIST
      ?auto_30271 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30270 ?auto_30271 ) ( SURFACE-AT ?auto_30268 ?auto_30271 ) ( CLEAR ?auto_30268 ) ( LIFTING ?auto_30270 ?auto_30269 ) ( IS-CRATE ?auto_30269 ) ( not ( = ?auto_30268 ?auto_30269 ) ) ( ON ?auto_30268 ?auto_30267 ) ( not ( = ?auto_30267 ?auto_30268 ) ) ( not ( = ?auto_30267 ?auto_30269 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30268 ?auto_30269 )
      ( MAKE-2CRATE-VERIFY ?auto_30267 ?auto_30268 ?auto_30269 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30272 - SURFACE
      ?auto_30273 - SURFACE
      ?auto_30274 - SURFACE
      ?auto_30275 - SURFACE
    )
    :vars
    (
      ?auto_30276 - HOIST
      ?auto_30277 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30276 ?auto_30277 ) ( SURFACE-AT ?auto_30274 ?auto_30277 ) ( CLEAR ?auto_30274 ) ( LIFTING ?auto_30276 ?auto_30275 ) ( IS-CRATE ?auto_30275 ) ( not ( = ?auto_30274 ?auto_30275 ) ) ( ON ?auto_30273 ?auto_30272 ) ( ON ?auto_30274 ?auto_30273 ) ( not ( = ?auto_30272 ?auto_30273 ) ) ( not ( = ?auto_30272 ?auto_30274 ) ) ( not ( = ?auto_30272 ?auto_30275 ) ) ( not ( = ?auto_30273 ?auto_30274 ) ) ( not ( = ?auto_30273 ?auto_30275 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30274 ?auto_30275 )
      ( MAKE-3CRATE-VERIFY ?auto_30272 ?auto_30273 ?auto_30274 ?auto_30275 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30278 - SURFACE
      ?auto_30279 - SURFACE
      ?auto_30280 - SURFACE
      ?auto_30281 - SURFACE
      ?auto_30282 - SURFACE
    )
    :vars
    (
      ?auto_30283 - HOIST
      ?auto_30284 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30283 ?auto_30284 ) ( SURFACE-AT ?auto_30281 ?auto_30284 ) ( CLEAR ?auto_30281 ) ( LIFTING ?auto_30283 ?auto_30282 ) ( IS-CRATE ?auto_30282 ) ( not ( = ?auto_30281 ?auto_30282 ) ) ( ON ?auto_30279 ?auto_30278 ) ( ON ?auto_30280 ?auto_30279 ) ( ON ?auto_30281 ?auto_30280 ) ( not ( = ?auto_30278 ?auto_30279 ) ) ( not ( = ?auto_30278 ?auto_30280 ) ) ( not ( = ?auto_30278 ?auto_30281 ) ) ( not ( = ?auto_30278 ?auto_30282 ) ) ( not ( = ?auto_30279 ?auto_30280 ) ) ( not ( = ?auto_30279 ?auto_30281 ) ) ( not ( = ?auto_30279 ?auto_30282 ) ) ( not ( = ?auto_30280 ?auto_30281 ) ) ( not ( = ?auto_30280 ?auto_30282 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30281 ?auto_30282 )
      ( MAKE-4CRATE-VERIFY ?auto_30278 ?auto_30279 ?auto_30280 ?auto_30281 ?auto_30282 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30285 - SURFACE
      ?auto_30286 - SURFACE
      ?auto_30287 - SURFACE
      ?auto_30288 - SURFACE
      ?auto_30289 - SURFACE
      ?auto_30290 - SURFACE
    )
    :vars
    (
      ?auto_30291 - HOIST
      ?auto_30292 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30291 ?auto_30292 ) ( SURFACE-AT ?auto_30289 ?auto_30292 ) ( CLEAR ?auto_30289 ) ( LIFTING ?auto_30291 ?auto_30290 ) ( IS-CRATE ?auto_30290 ) ( not ( = ?auto_30289 ?auto_30290 ) ) ( ON ?auto_30286 ?auto_30285 ) ( ON ?auto_30287 ?auto_30286 ) ( ON ?auto_30288 ?auto_30287 ) ( ON ?auto_30289 ?auto_30288 ) ( not ( = ?auto_30285 ?auto_30286 ) ) ( not ( = ?auto_30285 ?auto_30287 ) ) ( not ( = ?auto_30285 ?auto_30288 ) ) ( not ( = ?auto_30285 ?auto_30289 ) ) ( not ( = ?auto_30285 ?auto_30290 ) ) ( not ( = ?auto_30286 ?auto_30287 ) ) ( not ( = ?auto_30286 ?auto_30288 ) ) ( not ( = ?auto_30286 ?auto_30289 ) ) ( not ( = ?auto_30286 ?auto_30290 ) ) ( not ( = ?auto_30287 ?auto_30288 ) ) ( not ( = ?auto_30287 ?auto_30289 ) ) ( not ( = ?auto_30287 ?auto_30290 ) ) ( not ( = ?auto_30288 ?auto_30289 ) ) ( not ( = ?auto_30288 ?auto_30290 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30289 ?auto_30290 )
      ( MAKE-5CRATE-VERIFY ?auto_30285 ?auto_30286 ?auto_30287 ?auto_30288 ?auto_30289 ?auto_30290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30293 - SURFACE
      ?auto_30294 - SURFACE
    )
    :vars
    (
      ?auto_30295 - HOIST
      ?auto_30296 - PLACE
      ?auto_30297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30295 ?auto_30296 ) ( SURFACE-AT ?auto_30293 ?auto_30296 ) ( CLEAR ?auto_30293 ) ( IS-CRATE ?auto_30294 ) ( not ( = ?auto_30293 ?auto_30294 ) ) ( TRUCK-AT ?auto_30297 ?auto_30296 ) ( AVAILABLE ?auto_30295 ) ( IN ?auto_30294 ?auto_30297 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30295 ?auto_30294 ?auto_30297 ?auto_30296 )
      ( MAKE-1CRATE ?auto_30293 ?auto_30294 )
      ( MAKE-1CRATE-VERIFY ?auto_30293 ?auto_30294 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30298 - SURFACE
      ?auto_30299 - SURFACE
      ?auto_30300 - SURFACE
    )
    :vars
    (
      ?auto_30303 - HOIST
      ?auto_30302 - PLACE
      ?auto_30301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30303 ?auto_30302 ) ( SURFACE-AT ?auto_30299 ?auto_30302 ) ( CLEAR ?auto_30299 ) ( IS-CRATE ?auto_30300 ) ( not ( = ?auto_30299 ?auto_30300 ) ) ( TRUCK-AT ?auto_30301 ?auto_30302 ) ( AVAILABLE ?auto_30303 ) ( IN ?auto_30300 ?auto_30301 ) ( ON ?auto_30299 ?auto_30298 ) ( not ( = ?auto_30298 ?auto_30299 ) ) ( not ( = ?auto_30298 ?auto_30300 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30299 ?auto_30300 )
      ( MAKE-2CRATE-VERIFY ?auto_30298 ?auto_30299 ?auto_30300 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30304 - SURFACE
      ?auto_30305 - SURFACE
      ?auto_30306 - SURFACE
      ?auto_30307 - SURFACE
    )
    :vars
    (
      ?auto_30308 - HOIST
      ?auto_30309 - PLACE
      ?auto_30310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30308 ?auto_30309 ) ( SURFACE-AT ?auto_30306 ?auto_30309 ) ( CLEAR ?auto_30306 ) ( IS-CRATE ?auto_30307 ) ( not ( = ?auto_30306 ?auto_30307 ) ) ( TRUCK-AT ?auto_30310 ?auto_30309 ) ( AVAILABLE ?auto_30308 ) ( IN ?auto_30307 ?auto_30310 ) ( ON ?auto_30306 ?auto_30305 ) ( not ( = ?auto_30305 ?auto_30306 ) ) ( not ( = ?auto_30305 ?auto_30307 ) ) ( ON ?auto_30305 ?auto_30304 ) ( not ( = ?auto_30304 ?auto_30305 ) ) ( not ( = ?auto_30304 ?auto_30306 ) ) ( not ( = ?auto_30304 ?auto_30307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30305 ?auto_30306 ?auto_30307 )
      ( MAKE-3CRATE-VERIFY ?auto_30304 ?auto_30305 ?auto_30306 ?auto_30307 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30311 - SURFACE
      ?auto_30312 - SURFACE
      ?auto_30313 - SURFACE
      ?auto_30314 - SURFACE
      ?auto_30315 - SURFACE
    )
    :vars
    (
      ?auto_30316 - HOIST
      ?auto_30317 - PLACE
      ?auto_30318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30316 ?auto_30317 ) ( SURFACE-AT ?auto_30314 ?auto_30317 ) ( CLEAR ?auto_30314 ) ( IS-CRATE ?auto_30315 ) ( not ( = ?auto_30314 ?auto_30315 ) ) ( TRUCK-AT ?auto_30318 ?auto_30317 ) ( AVAILABLE ?auto_30316 ) ( IN ?auto_30315 ?auto_30318 ) ( ON ?auto_30314 ?auto_30313 ) ( not ( = ?auto_30313 ?auto_30314 ) ) ( not ( = ?auto_30313 ?auto_30315 ) ) ( ON ?auto_30312 ?auto_30311 ) ( ON ?auto_30313 ?auto_30312 ) ( not ( = ?auto_30311 ?auto_30312 ) ) ( not ( = ?auto_30311 ?auto_30313 ) ) ( not ( = ?auto_30311 ?auto_30314 ) ) ( not ( = ?auto_30311 ?auto_30315 ) ) ( not ( = ?auto_30312 ?auto_30313 ) ) ( not ( = ?auto_30312 ?auto_30314 ) ) ( not ( = ?auto_30312 ?auto_30315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30313 ?auto_30314 ?auto_30315 )
      ( MAKE-4CRATE-VERIFY ?auto_30311 ?auto_30312 ?auto_30313 ?auto_30314 ?auto_30315 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30319 - SURFACE
      ?auto_30320 - SURFACE
      ?auto_30321 - SURFACE
      ?auto_30322 - SURFACE
      ?auto_30323 - SURFACE
      ?auto_30324 - SURFACE
    )
    :vars
    (
      ?auto_30325 - HOIST
      ?auto_30326 - PLACE
      ?auto_30327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30325 ?auto_30326 ) ( SURFACE-AT ?auto_30323 ?auto_30326 ) ( CLEAR ?auto_30323 ) ( IS-CRATE ?auto_30324 ) ( not ( = ?auto_30323 ?auto_30324 ) ) ( TRUCK-AT ?auto_30327 ?auto_30326 ) ( AVAILABLE ?auto_30325 ) ( IN ?auto_30324 ?auto_30327 ) ( ON ?auto_30323 ?auto_30322 ) ( not ( = ?auto_30322 ?auto_30323 ) ) ( not ( = ?auto_30322 ?auto_30324 ) ) ( ON ?auto_30320 ?auto_30319 ) ( ON ?auto_30321 ?auto_30320 ) ( ON ?auto_30322 ?auto_30321 ) ( not ( = ?auto_30319 ?auto_30320 ) ) ( not ( = ?auto_30319 ?auto_30321 ) ) ( not ( = ?auto_30319 ?auto_30322 ) ) ( not ( = ?auto_30319 ?auto_30323 ) ) ( not ( = ?auto_30319 ?auto_30324 ) ) ( not ( = ?auto_30320 ?auto_30321 ) ) ( not ( = ?auto_30320 ?auto_30322 ) ) ( not ( = ?auto_30320 ?auto_30323 ) ) ( not ( = ?auto_30320 ?auto_30324 ) ) ( not ( = ?auto_30321 ?auto_30322 ) ) ( not ( = ?auto_30321 ?auto_30323 ) ) ( not ( = ?auto_30321 ?auto_30324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30322 ?auto_30323 ?auto_30324 )
      ( MAKE-5CRATE-VERIFY ?auto_30319 ?auto_30320 ?auto_30321 ?auto_30322 ?auto_30323 ?auto_30324 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30328 - SURFACE
      ?auto_30329 - SURFACE
    )
    :vars
    (
      ?auto_30330 - HOIST
      ?auto_30332 - PLACE
      ?auto_30333 - TRUCK
      ?auto_30331 - SURFACE
      ?auto_30334 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30330 ?auto_30332 ) ( SURFACE-AT ?auto_30328 ?auto_30332 ) ( CLEAR ?auto_30328 ) ( IS-CRATE ?auto_30329 ) ( not ( = ?auto_30328 ?auto_30329 ) ) ( AVAILABLE ?auto_30330 ) ( IN ?auto_30329 ?auto_30333 ) ( ON ?auto_30328 ?auto_30331 ) ( not ( = ?auto_30331 ?auto_30328 ) ) ( not ( = ?auto_30331 ?auto_30329 ) ) ( TRUCK-AT ?auto_30333 ?auto_30334 ) ( not ( = ?auto_30334 ?auto_30332 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30333 ?auto_30334 ?auto_30332 )
      ( MAKE-2CRATE ?auto_30331 ?auto_30328 ?auto_30329 )
      ( MAKE-1CRATE-VERIFY ?auto_30328 ?auto_30329 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30335 - SURFACE
      ?auto_30336 - SURFACE
      ?auto_30337 - SURFACE
    )
    :vars
    (
      ?auto_30338 - HOIST
      ?auto_30340 - PLACE
      ?auto_30341 - TRUCK
      ?auto_30339 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30338 ?auto_30340 ) ( SURFACE-AT ?auto_30336 ?auto_30340 ) ( CLEAR ?auto_30336 ) ( IS-CRATE ?auto_30337 ) ( not ( = ?auto_30336 ?auto_30337 ) ) ( AVAILABLE ?auto_30338 ) ( IN ?auto_30337 ?auto_30341 ) ( ON ?auto_30336 ?auto_30335 ) ( not ( = ?auto_30335 ?auto_30336 ) ) ( not ( = ?auto_30335 ?auto_30337 ) ) ( TRUCK-AT ?auto_30341 ?auto_30339 ) ( not ( = ?auto_30339 ?auto_30340 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30336 ?auto_30337 )
      ( MAKE-2CRATE-VERIFY ?auto_30335 ?auto_30336 ?auto_30337 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30342 - SURFACE
      ?auto_30343 - SURFACE
      ?auto_30344 - SURFACE
      ?auto_30345 - SURFACE
    )
    :vars
    (
      ?auto_30346 - HOIST
      ?auto_30349 - PLACE
      ?auto_30348 - TRUCK
      ?auto_30347 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30346 ?auto_30349 ) ( SURFACE-AT ?auto_30344 ?auto_30349 ) ( CLEAR ?auto_30344 ) ( IS-CRATE ?auto_30345 ) ( not ( = ?auto_30344 ?auto_30345 ) ) ( AVAILABLE ?auto_30346 ) ( IN ?auto_30345 ?auto_30348 ) ( ON ?auto_30344 ?auto_30343 ) ( not ( = ?auto_30343 ?auto_30344 ) ) ( not ( = ?auto_30343 ?auto_30345 ) ) ( TRUCK-AT ?auto_30348 ?auto_30347 ) ( not ( = ?auto_30347 ?auto_30349 ) ) ( ON ?auto_30343 ?auto_30342 ) ( not ( = ?auto_30342 ?auto_30343 ) ) ( not ( = ?auto_30342 ?auto_30344 ) ) ( not ( = ?auto_30342 ?auto_30345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30343 ?auto_30344 ?auto_30345 )
      ( MAKE-3CRATE-VERIFY ?auto_30342 ?auto_30343 ?auto_30344 ?auto_30345 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30350 - SURFACE
      ?auto_30351 - SURFACE
      ?auto_30352 - SURFACE
      ?auto_30353 - SURFACE
      ?auto_30354 - SURFACE
    )
    :vars
    (
      ?auto_30355 - HOIST
      ?auto_30358 - PLACE
      ?auto_30357 - TRUCK
      ?auto_30356 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30355 ?auto_30358 ) ( SURFACE-AT ?auto_30353 ?auto_30358 ) ( CLEAR ?auto_30353 ) ( IS-CRATE ?auto_30354 ) ( not ( = ?auto_30353 ?auto_30354 ) ) ( AVAILABLE ?auto_30355 ) ( IN ?auto_30354 ?auto_30357 ) ( ON ?auto_30353 ?auto_30352 ) ( not ( = ?auto_30352 ?auto_30353 ) ) ( not ( = ?auto_30352 ?auto_30354 ) ) ( TRUCK-AT ?auto_30357 ?auto_30356 ) ( not ( = ?auto_30356 ?auto_30358 ) ) ( ON ?auto_30351 ?auto_30350 ) ( ON ?auto_30352 ?auto_30351 ) ( not ( = ?auto_30350 ?auto_30351 ) ) ( not ( = ?auto_30350 ?auto_30352 ) ) ( not ( = ?auto_30350 ?auto_30353 ) ) ( not ( = ?auto_30350 ?auto_30354 ) ) ( not ( = ?auto_30351 ?auto_30352 ) ) ( not ( = ?auto_30351 ?auto_30353 ) ) ( not ( = ?auto_30351 ?auto_30354 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30352 ?auto_30353 ?auto_30354 )
      ( MAKE-4CRATE-VERIFY ?auto_30350 ?auto_30351 ?auto_30352 ?auto_30353 ?auto_30354 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30359 - SURFACE
      ?auto_30360 - SURFACE
      ?auto_30361 - SURFACE
      ?auto_30362 - SURFACE
      ?auto_30363 - SURFACE
      ?auto_30364 - SURFACE
    )
    :vars
    (
      ?auto_30365 - HOIST
      ?auto_30368 - PLACE
      ?auto_30367 - TRUCK
      ?auto_30366 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30365 ?auto_30368 ) ( SURFACE-AT ?auto_30363 ?auto_30368 ) ( CLEAR ?auto_30363 ) ( IS-CRATE ?auto_30364 ) ( not ( = ?auto_30363 ?auto_30364 ) ) ( AVAILABLE ?auto_30365 ) ( IN ?auto_30364 ?auto_30367 ) ( ON ?auto_30363 ?auto_30362 ) ( not ( = ?auto_30362 ?auto_30363 ) ) ( not ( = ?auto_30362 ?auto_30364 ) ) ( TRUCK-AT ?auto_30367 ?auto_30366 ) ( not ( = ?auto_30366 ?auto_30368 ) ) ( ON ?auto_30360 ?auto_30359 ) ( ON ?auto_30361 ?auto_30360 ) ( ON ?auto_30362 ?auto_30361 ) ( not ( = ?auto_30359 ?auto_30360 ) ) ( not ( = ?auto_30359 ?auto_30361 ) ) ( not ( = ?auto_30359 ?auto_30362 ) ) ( not ( = ?auto_30359 ?auto_30363 ) ) ( not ( = ?auto_30359 ?auto_30364 ) ) ( not ( = ?auto_30360 ?auto_30361 ) ) ( not ( = ?auto_30360 ?auto_30362 ) ) ( not ( = ?auto_30360 ?auto_30363 ) ) ( not ( = ?auto_30360 ?auto_30364 ) ) ( not ( = ?auto_30361 ?auto_30362 ) ) ( not ( = ?auto_30361 ?auto_30363 ) ) ( not ( = ?auto_30361 ?auto_30364 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30362 ?auto_30363 ?auto_30364 )
      ( MAKE-5CRATE-VERIFY ?auto_30359 ?auto_30360 ?auto_30361 ?auto_30362 ?auto_30363 ?auto_30364 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30369 - SURFACE
      ?auto_30370 - SURFACE
    )
    :vars
    (
      ?auto_30371 - HOIST
      ?auto_30375 - PLACE
      ?auto_30373 - SURFACE
      ?auto_30374 - TRUCK
      ?auto_30372 - PLACE
      ?auto_30376 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30371 ?auto_30375 ) ( SURFACE-AT ?auto_30369 ?auto_30375 ) ( CLEAR ?auto_30369 ) ( IS-CRATE ?auto_30370 ) ( not ( = ?auto_30369 ?auto_30370 ) ) ( AVAILABLE ?auto_30371 ) ( ON ?auto_30369 ?auto_30373 ) ( not ( = ?auto_30373 ?auto_30369 ) ) ( not ( = ?auto_30373 ?auto_30370 ) ) ( TRUCK-AT ?auto_30374 ?auto_30372 ) ( not ( = ?auto_30372 ?auto_30375 ) ) ( HOIST-AT ?auto_30376 ?auto_30372 ) ( LIFTING ?auto_30376 ?auto_30370 ) ( not ( = ?auto_30371 ?auto_30376 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30376 ?auto_30370 ?auto_30374 ?auto_30372 )
      ( MAKE-2CRATE ?auto_30373 ?auto_30369 ?auto_30370 )
      ( MAKE-1CRATE-VERIFY ?auto_30369 ?auto_30370 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30377 - SURFACE
      ?auto_30378 - SURFACE
      ?auto_30379 - SURFACE
    )
    :vars
    (
      ?auto_30380 - HOIST
      ?auto_30381 - PLACE
      ?auto_30383 - TRUCK
      ?auto_30384 - PLACE
      ?auto_30382 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30380 ?auto_30381 ) ( SURFACE-AT ?auto_30378 ?auto_30381 ) ( CLEAR ?auto_30378 ) ( IS-CRATE ?auto_30379 ) ( not ( = ?auto_30378 ?auto_30379 ) ) ( AVAILABLE ?auto_30380 ) ( ON ?auto_30378 ?auto_30377 ) ( not ( = ?auto_30377 ?auto_30378 ) ) ( not ( = ?auto_30377 ?auto_30379 ) ) ( TRUCK-AT ?auto_30383 ?auto_30384 ) ( not ( = ?auto_30384 ?auto_30381 ) ) ( HOIST-AT ?auto_30382 ?auto_30384 ) ( LIFTING ?auto_30382 ?auto_30379 ) ( not ( = ?auto_30380 ?auto_30382 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30378 ?auto_30379 )
      ( MAKE-2CRATE-VERIFY ?auto_30377 ?auto_30378 ?auto_30379 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30385 - SURFACE
      ?auto_30386 - SURFACE
      ?auto_30387 - SURFACE
      ?auto_30388 - SURFACE
    )
    :vars
    (
      ?auto_30393 - HOIST
      ?auto_30389 - PLACE
      ?auto_30390 - TRUCK
      ?auto_30392 - PLACE
      ?auto_30391 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30393 ?auto_30389 ) ( SURFACE-AT ?auto_30387 ?auto_30389 ) ( CLEAR ?auto_30387 ) ( IS-CRATE ?auto_30388 ) ( not ( = ?auto_30387 ?auto_30388 ) ) ( AVAILABLE ?auto_30393 ) ( ON ?auto_30387 ?auto_30386 ) ( not ( = ?auto_30386 ?auto_30387 ) ) ( not ( = ?auto_30386 ?auto_30388 ) ) ( TRUCK-AT ?auto_30390 ?auto_30392 ) ( not ( = ?auto_30392 ?auto_30389 ) ) ( HOIST-AT ?auto_30391 ?auto_30392 ) ( LIFTING ?auto_30391 ?auto_30388 ) ( not ( = ?auto_30393 ?auto_30391 ) ) ( ON ?auto_30386 ?auto_30385 ) ( not ( = ?auto_30385 ?auto_30386 ) ) ( not ( = ?auto_30385 ?auto_30387 ) ) ( not ( = ?auto_30385 ?auto_30388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30386 ?auto_30387 ?auto_30388 )
      ( MAKE-3CRATE-VERIFY ?auto_30385 ?auto_30386 ?auto_30387 ?auto_30388 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30394 - SURFACE
      ?auto_30395 - SURFACE
      ?auto_30396 - SURFACE
      ?auto_30397 - SURFACE
      ?auto_30398 - SURFACE
    )
    :vars
    (
      ?auto_30403 - HOIST
      ?auto_30399 - PLACE
      ?auto_30400 - TRUCK
      ?auto_30402 - PLACE
      ?auto_30401 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30403 ?auto_30399 ) ( SURFACE-AT ?auto_30397 ?auto_30399 ) ( CLEAR ?auto_30397 ) ( IS-CRATE ?auto_30398 ) ( not ( = ?auto_30397 ?auto_30398 ) ) ( AVAILABLE ?auto_30403 ) ( ON ?auto_30397 ?auto_30396 ) ( not ( = ?auto_30396 ?auto_30397 ) ) ( not ( = ?auto_30396 ?auto_30398 ) ) ( TRUCK-AT ?auto_30400 ?auto_30402 ) ( not ( = ?auto_30402 ?auto_30399 ) ) ( HOIST-AT ?auto_30401 ?auto_30402 ) ( LIFTING ?auto_30401 ?auto_30398 ) ( not ( = ?auto_30403 ?auto_30401 ) ) ( ON ?auto_30395 ?auto_30394 ) ( ON ?auto_30396 ?auto_30395 ) ( not ( = ?auto_30394 ?auto_30395 ) ) ( not ( = ?auto_30394 ?auto_30396 ) ) ( not ( = ?auto_30394 ?auto_30397 ) ) ( not ( = ?auto_30394 ?auto_30398 ) ) ( not ( = ?auto_30395 ?auto_30396 ) ) ( not ( = ?auto_30395 ?auto_30397 ) ) ( not ( = ?auto_30395 ?auto_30398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30396 ?auto_30397 ?auto_30398 )
      ( MAKE-4CRATE-VERIFY ?auto_30394 ?auto_30395 ?auto_30396 ?auto_30397 ?auto_30398 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30404 - SURFACE
      ?auto_30405 - SURFACE
      ?auto_30406 - SURFACE
      ?auto_30407 - SURFACE
      ?auto_30408 - SURFACE
      ?auto_30409 - SURFACE
    )
    :vars
    (
      ?auto_30414 - HOIST
      ?auto_30410 - PLACE
      ?auto_30411 - TRUCK
      ?auto_30413 - PLACE
      ?auto_30412 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30414 ?auto_30410 ) ( SURFACE-AT ?auto_30408 ?auto_30410 ) ( CLEAR ?auto_30408 ) ( IS-CRATE ?auto_30409 ) ( not ( = ?auto_30408 ?auto_30409 ) ) ( AVAILABLE ?auto_30414 ) ( ON ?auto_30408 ?auto_30407 ) ( not ( = ?auto_30407 ?auto_30408 ) ) ( not ( = ?auto_30407 ?auto_30409 ) ) ( TRUCK-AT ?auto_30411 ?auto_30413 ) ( not ( = ?auto_30413 ?auto_30410 ) ) ( HOIST-AT ?auto_30412 ?auto_30413 ) ( LIFTING ?auto_30412 ?auto_30409 ) ( not ( = ?auto_30414 ?auto_30412 ) ) ( ON ?auto_30405 ?auto_30404 ) ( ON ?auto_30406 ?auto_30405 ) ( ON ?auto_30407 ?auto_30406 ) ( not ( = ?auto_30404 ?auto_30405 ) ) ( not ( = ?auto_30404 ?auto_30406 ) ) ( not ( = ?auto_30404 ?auto_30407 ) ) ( not ( = ?auto_30404 ?auto_30408 ) ) ( not ( = ?auto_30404 ?auto_30409 ) ) ( not ( = ?auto_30405 ?auto_30406 ) ) ( not ( = ?auto_30405 ?auto_30407 ) ) ( not ( = ?auto_30405 ?auto_30408 ) ) ( not ( = ?auto_30405 ?auto_30409 ) ) ( not ( = ?auto_30406 ?auto_30407 ) ) ( not ( = ?auto_30406 ?auto_30408 ) ) ( not ( = ?auto_30406 ?auto_30409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30407 ?auto_30408 ?auto_30409 )
      ( MAKE-5CRATE-VERIFY ?auto_30404 ?auto_30405 ?auto_30406 ?auto_30407 ?auto_30408 ?auto_30409 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30415 - SURFACE
      ?auto_30416 - SURFACE
    )
    :vars
    (
      ?auto_30422 - HOIST
      ?auto_30417 - PLACE
      ?auto_30421 - SURFACE
      ?auto_30418 - TRUCK
      ?auto_30420 - PLACE
      ?auto_30419 - HOIST
      ?auto_30423 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30422 ?auto_30417 ) ( SURFACE-AT ?auto_30415 ?auto_30417 ) ( CLEAR ?auto_30415 ) ( IS-CRATE ?auto_30416 ) ( not ( = ?auto_30415 ?auto_30416 ) ) ( AVAILABLE ?auto_30422 ) ( ON ?auto_30415 ?auto_30421 ) ( not ( = ?auto_30421 ?auto_30415 ) ) ( not ( = ?auto_30421 ?auto_30416 ) ) ( TRUCK-AT ?auto_30418 ?auto_30420 ) ( not ( = ?auto_30420 ?auto_30417 ) ) ( HOIST-AT ?auto_30419 ?auto_30420 ) ( not ( = ?auto_30422 ?auto_30419 ) ) ( AVAILABLE ?auto_30419 ) ( SURFACE-AT ?auto_30416 ?auto_30420 ) ( ON ?auto_30416 ?auto_30423 ) ( CLEAR ?auto_30416 ) ( not ( = ?auto_30415 ?auto_30423 ) ) ( not ( = ?auto_30416 ?auto_30423 ) ) ( not ( = ?auto_30421 ?auto_30423 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30419 ?auto_30416 ?auto_30423 ?auto_30420 )
      ( MAKE-2CRATE ?auto_30421 ?auto_30415 ?auto_30416 )
      ( MAKE-1CRATE-VERIFY ?auto_30415 ?auto_30416 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30424 - SURFACE
      ?auto_30425 - SURFACE
      ?auto_30426 - SURFACE
    )
    :vars
    (
      ?auto_30430 - HOIST
      ?auto_30432 - PLACE
      ?auto_30429 - TRUCK
      ?auto_30427 - PLACE
      ?auto_30428 - HOIST
      ?auto_30431 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30430 ?auto_30432 ) ( SURFACE-AT ?auto_30425 ?auto_30432 ) ( CLEAR ?auto_30425 ) ( IS-CRATE ?auto_30426 ) ( not ( = ?auto_30425 ?auto_30426 ) ) ( AVAILABLE ?auto_30430 ) ( ON ?auto_30425 ?auto_30424 ) ( not ( = ?auto_30424 ?auto_30425 ) ) ( not ( = ?auto_30424 ?auto_30426 ) ) ( TRUCK-AT ?auto_30429 ?auto_30427 ) ( not ( = ?auto_30427 ?auto_30432 ) ) ( HOIST-AT ?auto_30428 ?auto_30427 ) ( not ( = ?auto_30430 ?auto_30428 ) ) ( AVAILABLE ?auto_30428 ) ( SURFACE-AT ?auto_30426 ?auto_30427 ) ( ON ?auto_30426 ?auto_30431 ) ( CLEAR ?auto_30426 ) ( not ( = ?auto_30425 ?auto_30431 ) ) ( not ( = ?auto_30426 ?auto_30431 ) ) ( not ( = ?auto_30424 ?auto_30431 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30425 ?auto_30426 )
      ( MAKE-2CRATE-VERIFY ?auto_30424 ?auto_30425 ?auto_30426 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30433 - SURFACE
      ?auto_30434 - SURFACE
      ?auto_30435 - SURFACE
      ?auto_30436 - SURFACE
    )
    :vars
    (
      ?auto_30438 - HOIST
      ?auto_30441 - PLACE
      ?auto_30440 - TRUCK
      ?auto_30437 - PLACE
      ?auto_30442 - HOIST
      ?auto_30439 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30438 ?auto_30441 ) ( SURFACE-AT ?auto_30435 ?auto_30441 ) ( CLEAR ?auto_30435 ) ( IS-CRATE ?auto_30436 ) ( not ( = ?auto_30435 ?auto_30436 ) ) ( AVAILABLE ?auto_30438 ) ( ON ?auto_30435 ?auto_30434 ) ( not ( = ?auto_30434 ?auto_30435 ) ) ( not ( = ?auto_30434 ?auto_30436 ) ) ( TRUCK-AT ?auto_30440 ?auto_30437 ) ( not ( = ?auto_30437 ?auto_30441 ) ) ( HOIST-AT ?auto_30442 ?auto_30437 ) ( not ( = ?auto_30438 ?auto_30442 ) ) ( AVAILABLE ?auto_30442 ) ( SURFACE-AT ?auto_30436 ?auto_30437 ) ( ON ?auto_30436 ?auto_30439 ) ( CLEAR ?auto_30436 ) ( not ( = ?auto_30435 ?auto_30439 ) ) ( not ( = ?auto_30436 ?auto_30439 ) ) ( not ( = ?auto_30434 ?auto_30439 ) ) ( ON ?auto_30434 ?auto_30433 ) ( not ( = ?auto_30433 ?auto_30434 ) ) ( not ( = ?auto_30433 ?auto_30435 ) ) ( not ( = ?auto_30433 ?auto_30436 ) ) ( not ( = ?auto_30433 ?auto_30439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30434 ?auto_30435 ?auto_30436 )
      ( MAKE-3CRATE-VERIFY ?auto_30433 ?auto_30434 ?auto_30435 ?auto_30436 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30443 - SURFACE
      ?auto_30444 - SURFACE
      ?auto_30445 - SURFACE
      ?auto_30446 - SURFACE
      ?auto_30447 - SURFACE
    )
    :vars
    (
      ?auto_30449 - HOIST
      ?auto_30452 - PLACE
      ?auto_30451 - TRUCK
      ?auto_30448 - PLACE
      ?auto_30453 - HOIST
      ?auto_30450 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30449 ?auto_30452 ) ( SURFACE-AT ?auto_30446 ?auto_30452 ) ( CLEAR ?auto_30446 ) ( IS-CRATE ?auto_30447 ) ( not ( = ?auto_30446 ?auto_30447 ) ) ( AVAILABLE ?auto_30449 ) ( ON ?auto_30446 ?auto_30445 ) ( not ( = ?auto_30445 ?auto_30446 ) ) ( not ( = ?auto_30445 ?auto_30447 ) ) ( TRUCK-AT ?auto_30451 ?auto_30448 ) ( not ( = ?auto_30448 ?auto_30452 ) ) ( HOIST-AT ?auto_30453 ?auto_30448 ) ( not ( = ?auto_30449 ?auto_30453 ) ) ( AVAILABLE ?auto_30453 ) ( SURFACE-AT ?auto_30447 ?auto_30448 ) ( ON ?auto_30447 ?auto_30450 ) ( CLEAR ?auto_30447 ) ( not ( = ?auto_30446 ?auto_30450 ) ) ( not ( = ?auto_30447 ?auto_30450 ) ) ( not ( = ?auto_30445 ?auto_30450 ) ) ( ON ?auto_30444 ?auto_30443 ) ( ON ?auto_30445 ?auto_30444 ) ( not ( = ?auto_30443 ?auto_30444 ) ) ( not ( = ?auto_30443 ?auto_30445 ) ) ( not ( = ?auto_30443 ?auto_30446 ) ) ( not ( = ?auto_30443 ?auto_30447 ) ) ( not ( = ?auto_30443 ?auto_30450 ) ) ( not ( = ?auto_30444 ?auto_30445 ) ) ( not ( = ?auto_30444 ?auto_30446 ) ) ( not ( = ?auto_30444 ?auto_30447 ) ) ( not ( = ?auto_30444 ?auto_30450 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30445 ?auto_30446 ?auto_30447 )
      ( MAKE-4CRATE-VERIFY ?auto_30443 ?auto_30444 ?auto_30445 ?auto_30446 ?auto_30447 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30454 - SURFACE
      ?auto_30455 - SURFACE
      ?auto_30456 - SURFACE
      ?auto_30457 - SURFACE
      ?auto_30458 - SURFACE
      ?auto_30459 - SURFACE
    )
    :vars
    (
      ?auto_30461 - HOIST
      ?auto_30464 - PLACE
      ?auto_30463 - TRUCK
      ?auto_30460 - PLACE
      ?auto_30465 - HOIST
      ?auto_30462 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30461 ?auto_30464 ) ( SURFACE-AT ?auto_30458 ?auto_30464 ) ( CLEAR ?auto_30458 ) ( IS-CRATE ?auto_30459 ) ( not ( = ?auto_30458 ?auto_30459 ) ) ( AVAILABLE ?auto_30461 ) ( ON ?auto_30458 ?auto_30457 ) ( not ( = ?auto_30457 ?auto_30458 ) ) ( not ( = ?auto_30457 ?auto_30459 ) ) ( TRUCK-AT ?auto_30463 ?auto_30460 ) ( not ( = ?auto_30460 ?auto_30464 ) ) ( HOIST-AT ?auto_30465 ?auto_30460 ) ( not ( = ?auto_30461 ?auto_30465 ) ) ( AVAILABLE ?auto_30465 ) ( SURFACE-AT ?auto_30459 ?auto_30460 ) ( ON ?auto_30459 ?auto_30462 ) ( CLEAR ?auto_30459 ) ( not ( = ?auto_30458 ?auto_30462 ) ) ( not ( = ?auto_30459 ?auto_30462 ) ) ( not ( = ?auto_30457 ?auto_30462 ) ) ( ON ?auto_30455 ?auto_30454 ) ( ON ?auto_30456 ?auto_30455 ) ( ON ?auto_30457 ?auto_30456 ) ( not ( = ?auto_30454 ?auto_30455 ) ) ( not ( = ?auto_30454 ?auto_30456 ) ) ( not ( = ?auto_30454 ?auto_30457 ) ) ( not ( = ?auto_30454 ?auto_30458 ) ) ( not ( = ?auto_30454 ?auto_30459 ) ) ( not ( = ?auto_30454 ?auto_30462 ) ) ( not ( = ?auto_30455 ?auto_30456 ) ) ( not ( = ?auto_30455 ?auto_30457 ) ) ( not ( = ?auto_30455 ?auto_30458 ) ) ( not ( = ?auto_30455 ?auto_30459 ) ) ( not ( = ?auto_30455 ?auto_30462 ) ) ( not ( = ?auto_30456 ?auto_30457 ) ) ( not ( = ?auto_30456 ?auto_30458 ) ) ( not ( = ?auto_30456 ?auto_30459 ) ) ( not ( = ?auto_30456 ?auto_30462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30457 ?auto_30458 ?auto_30459 )
      ( MAKE-5CRATE-VERIFY ?auto_30454 ?auto_30455 ?auto_30456 ?auto_30457 ?auto_30458 ?auto_30459 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30466 - SURFACE
      ?auto_30467 - SURFACE
    )
    :vars
    (
      ?auto_30469 - HOIST
      ?auto_30472 - PLACE
      ?auto_30474 - SURFACE
      ?auto_30468 - PLACE
      ?auto_30473 - HOIST
      ?auto_30470 - SURFACE
      ?auto_30471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30469 ?auto_30472 ) ( SURFACE-AT ?auto_30466 ?auto_30472 ) ( CLEAR ?auto_30466 ) ( IS-CRATE ?auto_30467 ) ( not ( = ?auto_30466 ?auto_30467 ) ) ( AVAILABLE ?auto_30469 ) ( ON ?auto_30466 ?auto_30474 ) ( not ( = ?auto_30474 ?auto_30466 ) ) ( not ( = ?auto_30474 ?auto_30467 ) ) ( not ( = ?auto_30468 ?auto_30472 ) ) ( HOIST-AT ?auto_30473 ?auto_30468 ) ( not ( = ?auto_30469 ?auto_30473 ) ) ( AVAILABLE ?auto_30473 ) ( SURFACE-AT ?auto_30467 ?auto_30468 ) ( ON ?auto_30467 ?auto_30470 ) ( CLEAR ?auto_30467 ) ( not ( = ?auto_30466 ?auto_30470 ) ) ( not ( = ?auto_30467 ?auto_30470 ) ) ( not ( = ?auto_30474 ?auto_30470 ) ) ( TRUCK-AT ?auto_30471 ?auto_30472 ) )
    :subtasks
    ( ( !DRIVE ?auto_30471 ?auto_30472 ?auto_30468 )
      ( MAKE-2CRATE ?auto_30474 ?auto_30466 ?auto_30467 )
      ( MAKE-1CRATE-VERIFY ?auto_30466 ?auto_30467 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30475 - SURFACE
      ?auto_30476 - SURFACE
      ?auto_30477 - SURFACE
    )
    :vars
    (
      ?auto_30480 - HOIST
      ?auto_30483 - PLACE
      ?auto_30478 - PLACE
      ?auto_30482 - HOIST
      ?auto_30479 - SURFACE
      ?auto_30481 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30480 ?auto_30483 ) ( SURFACE-AT ?auto_30476 ?auto_30483 ) ( CLEAR ?auto_30476 ) ( IS-CRATE ?auto_30477 ) ( not ( = ?auto_30476 ?auto_30477 ) ) ( AVAILABLE ?auto_30480 ) ( ON ?auto_30476 ?auto_30475 ) ( not ( = ?auto_30475 ?auto_30476 ) ) ( not ( = ?auto_30475 ?auto_30477 ) ) ( not ( = ?auto_30478 ?auto_30483 ) ) ( HOIST-AT ?auto_30482 ?auto_30478 ) ( not ( = ?auto_30480 ?auto_30482 ) ) ( AVAILABLE ?auto_30482 ) ( SURFACE-AT ?auto_30477 ?auto_30478 ) ( ON ?auto_30477 ?auto_30479 ) ( CLEAR ?auto_30477 ) ( not ( = ?auto_30476 ?auto_30479 ) ) ( not ( = ?auto_30477 ?auto_30479 ) ) ( not ( = ?auto_30475 ?auto_30479 ) ) ( TRUCK-AT ?auto_30481 ?auto_30483 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30476 ?auto_30477 )
      ( MAKE-2CRATE-VERIFY ?auto_30475 ?auto_30476 ?auto_30477 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30484 - SURFACE
      ?auto_30485 - SURFACE
      ?auto_30486 - SURFACE
      ?auto_30487 - SURFACE
    )
    :vars
    (
      ?auto_30491 - HOIST
      ?auto_30492 - PLACE
      ?auto_30490 - PLACE
      ?auto_30489 - HOIST
      ?auto_30488 - SURFACE
      ?auto_30493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30491 ?auto_30492 ) ( SURFACE-AT ?auto_30486 ?auto_30492 ) ( CLEAR ?auto_30486 ) ( IS-CRATE ?auto_30487 ) ( not ( = ?auto_30486 ?auto_30487 ) ) ( AVAILABLE ?auto_30491 ) ( ON ?auto_30486 ?auto_30485 ) ( not ( = ?auto_30485 ?auto_30486 ) ) ( not ( = ?auto_30485 ?auto_30487 ) ) ( not ( = ?auto_30490 ?auto_30492 ) ) ( HOIST-AT ?auto_30489 ?auto_30490 ) ( not ( = ?auto_30491 ?auto_30489 ) ) ( AVAILABLE ?auto_30489 ) ( SURFACE-AT ?auto_30487 ?auto_30490 ) ( ON ?auto_30487 ?auto_30488 ) ( CLEAR ?auto_30487 ) ( not ( = ?auto_30486 ?auto_30488 ) ) ( not ( = ?auto_30487 ?auto_30488 ) ) ( not ( = ?auto_30485 ?auto_30488 ) ) ( TRUCK-AT ?auto_30493 ?auto_30492 ) ( ON ?auto_30485 ?auto_30484 ) ( not ( = ?auto_30484 ?auto_30485 ) ) ( not ( = ?auto_30484 ?auto_30486 ) ) ( not ( = ?auto_30484 ?auto_30487 ) ) ( not ( = ?auto_30484 ?auto_30488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30485 ?auto_30486 ?auto_30487 )
      ( MAKE-3CRATE-VERIFY ?auto_30484 ?auto_30485 ?auto_30486 ?auto_30487 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30494 - SURFACE
      ?auto_30495 - SURFACE
      ?auto_30496 - SURFACE
      ?auto_30497 - SURFACE
      ?auto_30498 - SURFACE
    )
    :vars
    (
      ?auto_30502 - HOIST
      ?auto_30503 - PLACE
      ?auto_30501 - PLACE
      ?auto_30500 - HOIST
      ?auto_30499 - SURFACE
      ?auto_30504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30502 ?auto_30503 ) ( SURFACE-AT ?auto_30497 ?auto_30503 ) ( CLEAR ?auto_30497 ) ( IS-CRATE ?auto_30498 ) ( not ( = ?auto_30497 ?auto_30498 ) ) ( AVAILABLE ?auto_30502 ) ( ON ?auto_30497 ?auto_30496 ) ( not ( = ?auto_30496 ?auto_30497 ) ) ( not ( = ?auto_30496 ?auto_30498 ) ) ( not ( = ?auto_30501 ?auto_30503 ) ) ( HOIST-AT ?auto_30500 ?auto_30501 ) ( not ( = ?auto_30502 ?auto_30500 ) ) ( AVAILABLE ?auto_30500 ) ( SURFACE-AT ?auto_30498 ?auto_30501 ) ( ON ?auto_30498 ?auto_30499 ) ( CLEAR ?auto_30498 ) ( not ( = ?auto_30497 ?auto_30499 ) ) ( not ( = ?auto_30498 ?auto_30499 ) ) ( not ( = ?auto_30496 ?auto_30499 ) ) ( TRUCK-AT ?auto_30504 ?auto_30503 ) ( ON ?auto_30495 ?auto_30494 ) ( ON ?auto_30496 ?auto_30495 ) ( not ( = ?auto_30494 ?auto_30495 ) ) ( not ( = ?auto_30494 ?auto_30496 ) ) ( not ( = ?auto_30494 ?auto_30497 ) ) ( not ( = ?auto_30494 ?auto_30498 ) ) ( not ( = ?auto_30494 ?auto_30499 ) ) ( not ( = ?auto_30495 ?auto_30496 ) ) ( not ( = ?auto_30495 ?auto_30497 ) ) ( not ( = ?auto_30495 ?auto_30498 ) ) ( not ( = ?auto_30495 ?auto_30499 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30496 ?auto_30497 ?auto_30498 )
      ( MAKE-4CRATE-VERIFY ?auto_30494 ?auto_30495 ?auto_30496 ?auto_30497 ?auto_30498 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30505 - SURFACE
      ?auto_30506 - SURFACE
      ?auto_30507 - SURFACE
      ?auto_30508 - SURFACE
      ?auto_30509 - SURFACE
      ?auto_30510 - SURFACE
    )
    :vars
    (
      ?auto_30514 - HOIST
      ?auto_30515 - PLACE
      ?auto_30513 - PLACE
      ?auto_30512 - HOIST
      ?auto_30511 - SURFACE
      ?auto_30516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30514 ?auto_30515 ) ( SURFACE-AT ?auto_30509 ?auto_30515 ) ( CLEAR ?auto_30509 ) ( IS-CRATE ?auto_30510 ) ( not ( = ?auto_30509 ?auto_30510 ) ) ( AVAILABLE ?auto_30514 ) ( ON ?auto_30509 ?auto_30508 ) ( not ( = ?auto_30508 ?auto_30509 ) ) ( not ( = ?auto_30508 ?auto_30510 ) ) ( not ( = ?auto_30513 ?auto_30515 ) ) ( HOIST-AT ?auto_30512 ?auto_30513 ) ( not ( = ?auto_30514 ?auto_30512 ) ) ( AVAILABLE ?auto_30512 ) ( SURFACE-AT ?auto_30510 ?auto_30513 ) ( ON ?auto_30510 ?auto_30511 ) ( CLEAR ?auto_30510 ) ( not ( = ?auto_30509 ?auto_30511 ) ) ( not ( = ?auto_30510 ?auto_30511 ) ) ( not ( = ?auto_30508 ?auto_30511 ) ) ( TRUCK-AT ?auto_30516 ?auto_30515 ) ( ON ?auto_30506 ?auto_30505 ) ( ON ?auto_30507 ?auto_30506 ) ( ON ?auto_30508 ?auto_30507 ) ( not ( = ?auto_30505 ?auto_30506 ) ) ( not ( = ?auto_30505 ?auto_30507 ) ) ( not ( = ?auto_30505 ?auto_30508 ) ) ( not ( = ?auto_30505 ?auto_30509 ) ) ( not ( = ?auto_30505 ?auto_30510 ) ) ( not ( = ?auto_30505 ?auto_30511 ) ) ( not ( = ?auto_30506 ?auto_30507 ) ) ( not ( = ?auto_30506 ?auto_30508 ) ) ( not ( = ?auto_30506 ?auto_30509 ) ) ( not ( = ?auto_30506 ?auto_30510 ) ) ( not ( = ?auto_30506 ?auto_30511 ) ) ( not ( = ?auto_30507 ?auto_30508 ) ) ( not ( = ?auto_30507 ?auto_30509 ) ) ( not ( = ?auto_30507 ?auto_30510 ) ) ( not ( = ?auto_30507 ?auto_30511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30508 ?auto_30509 ?auto_30510 )
      ( MAKE-5CRATE-VERIFY ?auto_30505 ?auto_30506 ?auto_30507 ?auto_30508 ?auto_30509 ?auto_30510 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30517 - SURFACE
      ?auto_30518 - SURFACE
    )
    :vars
    (
      ?auto_30523 - HOIST
      ?auto_30524 - PLACE
      ?auto_30521 - SURFACE
      ?auto_30522 - PLACE
      ?auto_30520 - HOIST
      ?auto_30519 - SURFACE
      ?auto_30525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30523 ?auto_30524 ) ( IS-CRATE ?auto_30518 ) ( not ( = ?auto_30517 ?auto_30518 ) ) ( not ( = ?auto_30521 ?auto_30517 ) ) ( not ( = ?auto_30521 ?auto_30518 ) ) ( not ( = ?auto_30522 ?auto_30524 ) ) ( HOIST-AT ?auto_30520 ?auto_30522 ) ( not ( = ?auto_30523 ?auto_30520 ) ) ( AVAILABLE ?auto_30520 ) ( SURFACE-AT ?auto_30518 ?auto_30522 ) ( ON ?auto_30518 ?auto_30519 ) ( CLEAR ?auto_30518 ) ( not ( = ?auto_30517 ?auto_30519 ) ) ( not ( = ?auto_30518 ?auto_30519 ) ) ( not ( = ?auto_30521 ?auto_30519 ) ) ( TRUCK-AT ?auto_30525 ?auto_30524 ) ( SURFACE-AT ?auto_30521 ?auto_30524 ) ( CLEAR ?auto_30521 ) ( LIFTING ?auto_30523 ?auto_30517 ) ( IS-CRATE ?auto_30517 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30521 ?auto_30517 )
      ( MAKE-2CRATE ?auto_30521 ?auto_30517 ?auto_30518 )
      ( MAKE-1CRATE-VERIFY ?auto_30517 ?auto_30518 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30526 - SURFACE
      ?auto_30527 - SURFACE
      ?auto_30528 - SURFACE
    )
    :vars
    (
      ?auto_30532 - HOIST
      ?auto_30531 - PLACE
      ?auto_30530 - PLACE
      ?auto_30533 - HOIST
      ?auto_30529 - SURFACE
      ?auto_30534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30532 ?auto_30531 ) ( IS-CRATE ?auto_30528 ) ( not ( = ?auto_30527 ?auto_30528 ) ) ( not ( = ?auto_30526 ?auto_30527 ) ) ( not ( = ?auto_30526 ?auto_30528 ) ) ( not ( = ?auto_30530 ?auto_30531 ) ) ( HOIST-AT ?auto_30533 ?auto_30530 ) ( not ( = ?auto_30532 ?auto_30533 ) ) ( AVAILABLE ?auto_30533 ) ( SURFACE-AT ?auto_30528 ?auto_30530 ) ( ON ?auto_30528 ?auto_30529 ) ( CLEAR ?auto_30528 ) ( not ( = ?auto_30527 ?auto_30529 ) ) ( not ( = ?auto_30528 ?auto_30529 ) ) ( not ( = ?auto_30526 ?auto_30529 ) ) ( TRUCK-AT ?auto_30534 ?auto_30531 ) ( SURFACE-AT ?auto_30526 ?auto_30531 ) ( CLEAR ?auto_30526 ) ( LIFTING ?auto_30532 ?auto_30527 ) ( IS-CRATE ?auto_30527 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30527 ?auto_30528 )
      ( MAKE-2CRATE-VERIFY ?auto_30526 ?auto_30527 ?auto_30528 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30535 - SURFACE
      ?auto_30536 - SURFACE
      ?auto_30537 - SURFACE
      ?auto_30538 - SURFACE
    )
    :vars
    (
      ?auto_30544 - HOIST
      ?auto_30539 - PLACE
      ?auto_30543 - PLACE
      ?auto_30540 - HOIST
      ?auto_30541 - SURFACE
      ?auto_30542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30544 ?auto_30539 ) ( IS-CRATE ?auto_30538 ) ( not ( = ?auto_30537 ?auto_30538 ) ) ( not ( = ?auto_30536 ?auto_30537 ) ) ( not ( = ?auto_30536 ?auto_30538 ) ) ( not ( = ?auto_30543 ?auto_30539 ) ) ( HOIST-AT ?auto_30540 ?auto_30543 ) ( not ( = ?auto_30544 ?auto_30540 ) ) ( AVAILABLE ?auto_30540 ) ( SURFACE-AT ?auto_30538 ?auto_30543 ) ( ON ?auto_30538 ?auto_30541 ) ( CLEAR ?auto_30538 ) ( not ( = ?auto_30537 ?auto_30541 ) ) ( not ( = ?auto_30538 ?auto_30541 ) ) ( not ( = ?auto_30536 ?auto_30541 ) ) ( TRUCK-AT ?auto_30542 ?auto_30539 ) ( SURFACE-AT ?auto_30536 ?auto_30539 ) ( CLEAR ?auto_30536 ) ( LIFTING ?auto_30544 ?auto_30537 ) ( IS-CRATE ?auto_30537 ) ( ON ?auto_30536 ?auto_30535 ) ( not ( = ?auto_30535 ?auto_30536 ) ) ( not ( = ?auto_30535 ?auto_30537 ) ) ( not ( = ?auto_30535 ?auto_30538 ) ) ( not ( = ?auto_30535 ?auto_30541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30536 ?auto_30537 ?auto_30538 )
      ( MAKE-3CRATE-VERIFY ?auto_30535 ?auto_30536 ?auto_30537 ?auto_30538 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30545 - SURFACE
      ?auto_30546 - SURFACE
      ?auto_30547 - SURFACE
      ?auto_30548 - SURFACE
      ?auto_30549 - SURFACE
    )
    :vars
    (
      ?auto_30555 - HOIST
      ?auto_30550 - PLACE
      ?auto_30554 - PLACE
      ?auto_30551 - HOIST
      ?auto_30552 - SURFACE
      ?auto_30553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30555 ?auto_30550 ) ( IS-CRATE ?auto_30549 ) ( not ( = ?auto_30548 ?auto_30549 ) ) ( not ( = ?auto_30547 ?auto_30548 ) ) ( not ( = ?auto_30547 ?auto_30549 ) ) ( not ( = ?auto_30554 ?auto_30550 ) ) ( HOIST-AT ?auto_30551 ?auto_30554 ) ( not ( = ?auto_30555 ?auto_30551 ) ) ( AVAILABLE ?auto_30551 ) ( SURFACE-AT ?auto_30549 ?auto_30554 ) ( ON ?auto_30549 ?auto_30552 ) ( CLEAR ?auto_30549 ) ( not ( = ?auto_30548 ?auto_30552 ) ) ( not ( = ?auto_30549 ?auto_30552 ) ) ( not ( = ?auto_30547 ?auto_30552 ) ) ( TRUCK-AT ?auto_30553 ?auto_30550 ) ( SURFACE-AT ?auto_30547 ?auto_30550 ) ( CLEAR ?auto_30547 ) ( LIFTING ?auto_30555 ?auto_30548 ) ( IS-CRATE ?auto_30548 ) ( ON ?auto_30546 ?auto_30545 ) ( ON ?auto_30547 ?auto_30546 ) ( not ( = ?auto_30545 ?auto_30546 ) ) ( not ( = ?auto_30545 ?auto_30547 ) ) ( not ( = ?auto_30545 ?auto_30548 ) ) ( not ( = ?auto_30545 ?auto_30549 ) ) ( not ( = ?auto_30545 ?auto_30552 ) ) ( not ( = ?auto_30546 ?auto_30547 ) ) ( not ( = ?auto_30546 ?auto_30548 ) ) ( not ( = ?auto_30546 ?auto_30549 ) ) ( not ( = ?auto_30546 ?auto_30552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30547 ?auto_30548 ?auto_30549 )
      ( MAKE-4CRATE-VERIFY ?auto_30545 ?auto_30546 ?auto_30547 ?auto_30548 ?auto_30549 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30556 - SURFACE
      ?auto_30557 - SURFACE
      ?auto_30558 - SURFACE
      ?auto_30559 - SURFACE
      ?auto_30560 - SURFACE
      ?auto_30561 - SURFACE
    )
    :vars
    (
      ?auto_30567 - HOIST
      ?auto_30562 - PLACE
      ?auto_30566 - PLACE
      ?auto_30563 - HOIST
      ?auto_30564 - SURFACE
      ?auto_30565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30567 ?auto_30562 ) ( IS-CRATE ?auto_30561 ) ( not ( = ?auto_30560 ?auto_30561 ) ) ( not ( = ?auto_30559 ?auto_30560 ) ) ( not ( = ?auto_30559 ?auto_30561 ) ) ( not ( = ?auto_30566 ?auto_30562 ) ) ( HOIST-AT ?auto_30563 ?auto_30566 ) ( not ( = ?auto_30567 ?auto_30563 ) ) ( AVAILABLE ?auto_30563 ) ( SURFACE-AT ?auto_30561 ?auto_30566 ) ( ON ?auto_30561 ?auto_30564 ) ( CLEAR ?auto_30561 ) ( not ( = ?auto_30560 ?auto_30564 ) ) ( not ( = ?auto_30561 ?auto_30564 ) ) ( not ( = ?auto_30559 ?auto_30564 ) ) ( TRUCK-AT ?auto_30565 ?auto_30562 ) ( SURFACE-AT ?auto_30559 ?auto_30562 ) ( CLEAR ?auto_30559 ) ( LIFTING ?auto_30567 ?auto_30560 ) ( IS-CRATE ?auto_30560 ) ( ON ?auto_30557 ?auto_30556 ) ( ON ?auto_30558 ?auto_30557 ) ( ON ?auto_30559 ?auto_30558 ) ( not ( = ?auto_30556 ?auto_30557 ) ) ( not ( = ?auto_30556 ?auto_30558 ) ) ( not ( = ?auto_30556 ?auto_30559 ) ) ( not ( = ?auto_30556 ?auto_30560 ) ) ( not ( = ?auto_30556 ?auto_30561 ) ) ( not ( = ?auto_30556 ?auto_30564 ) ) ( not ( = ?auto_30557 ?auto_30558 ) ) ( not ( = ?auto_30557 ?auto_30559 ) ) ( not ( = ?auto_30557 ?auto_30560 ) ) ( not ( = ?auto_30557 ?auto_30561 ) ) ( not ( = ?auto_30557 ?auto_30564 ) ) ( not ( = ?auto_30558 ?auto_30559 ) ) ( not ( = ?auto_30558 ?auto_30560 ) ) ( not ( = ?auto_30558 ?auto_30561 ) ) ( not ( = ?auto_30558 ?auto_30564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30559 ?auto_30560 ?auto_30561 )
      ( MAKE-5CRATE-VERIFY ?auto_30556 ?auto_30557 ?auto_30558 ?auto_30559 ?auto_30560 ?auto_30561 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30568 - SURFACE
      ?auto_30569 - SURFACE
    )
    :vars
    (
      ?auto_30576 - HOIST
      ?auto_30570 - PLACE
      ?auto_30572 - SURFACE
      ?auto_30575 - PLACE
      ?auto_30571 - HOIST
      ?auto_30573 - SURFACE
      ?auto_30574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30576 ?auto_30570 ) ( IS-CRATE ?auto_30569 ) ( not ( = ?auto_30568 ?auto_30569 ) ) ( not ( = ?auto_30572 ?auto_30568 ) ) ( not ( = ?auto_30572 ?auto_30569 ) ) ( not ( = ?auto_30575 ?auto_30570 ) ) ( HOIST-AT ?auto_30571 ?auto_30575 ) ( not ( = ?auto_30576 ?auto_30571 ) ) ( AVAILABLE ?auto_30571 ) ( SURFACE-AT ?auto_30569 ?auto_30575 ) ( ON ?auto_30569 ?auto_30573 ) ( CLEAR ?auto_30569 ) ( not ( = ?auto_30568 ?auto_30573 ) ) ( not ( = ?auto_30569 ?auto_30573 ) ) ( not ( = ?auto_30572 ?auto_30573 ) ) ( TRUCK-AT ?auto_30574 ?auto_30570 ) ( SURFACE-AT ?auto_30572 ?auto_30570 ) ( CLEAR ?auto_30572 ) ( IS-CRATE ?auto_30568 ) ( AVAILABLE ?auto_30576 ) ( IN ?auto_30568 ?auto_30574 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30576 ?auto_30568 ?auto_30574 ?auto_30570 )
      ( MAKE-2CRATE ?auto_30572 ?auto_30568 ?auto_30569 )
      ( MAKE-1CRATE-VERIFY ?auto_30568 ?auto_30569 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30577 - SURFACE
      ?auto_30578 - SURFACE
      ?auto_30579 - SURFACE
    )
    :vars
    (
      ?auto_30582 - HOIST
      ?auto_30585 - PLACE
      ?auto_30580 - PLACE
      ?auto_30584 - HOIST
      ?auto_30581 - SURFACE
      ?auto_30583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30582 ?auto_30585 ) ( IS-CRATE ?auto_30579 ) ( not ( = ?auto_30578 ?auto_30579 ) ) ( not ( = ?auto_30577 ?auto_30578 ) ) ( not ( = ?auto_30577 ?auto_30579 ) ) ( not ( = ?auto_30580 ?auto_30585 ) ) ( HOIST-AT ?auto_30584 ?auto_30580 ) ( not ( = ?auto_30582 ?auto_30584 ) ) ( AVAILABLE ?auto_30584 ) ( SURFACE-AT ?auto_30579 ?auto_30580 ) ( ON ?auto_30579 ?auto_30581 ) ( CLEAR ?auto_30579 ) ( not ( = ?auto_30578 ?auto_30581 ) ) ( not ( = ?auto_30579 ?auto_30581 ) ) ( not ( = ?auto_30577 ?auto_30581 ) ) ( TRUCK-AT ?auto_30583 ?auto_30585 ) ( SURFACE-AT ?auto_30577 ?auto_30585 ) ( CLEAR ?auto_30577 ) ( IS-CRATE ?auto_30578 ) ( AVAILABLE ?auto_30582 ) ( IN ?auto_30578 ?auto_30583 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30578 ?auto_30579 )
      ( MAKE-2CRATE-VERIFY ?auto_30577 ?auto_30578 ?auto_30579 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30586 - SURFACE
      ?auto_30587 - SURFACE
      ?auto_30588 - SURFACE
      ?auto_30589 - SURFACE
    )
    :vars
    (
      ?auto_30591 - HOIST
      ?auto_30595 - PLACE
      ?auto_30594 - PLACE
      ?auto_30592 - HOIST
      ?auto_30590 - SURFACE
      ?auto_30593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30591 ?auto_30595 ) ( IS-CRATE ?auto_30589 ) ( not ( = ?auto_30588 ?auto_30589 ) ) ( not ( = ?auto_30587 ?auto_30588 ) ) ( not ( = ?auto_30587 ?auto_30589 ) ) ( not ( = ?auto_30594 ?auto_30595 ) ) ( HOIST-AT ?auto_30592 ?auto_30594 ) ( not ( = ?auto_30591 ?auto_30592 ) ) ( AVAILABLE ?auto_30592 ) ( SURFACE-AT ?auto_30589 ?auto_30594 ) ( ON ?auto_30589 ?auto_30590 ) ( CLEAR ?auto_30589 ) ( not ( = ?auto_30588 ?auto_30590 ) ) ( not ( = ?auto_30589 ?auto_30590 ) ) ( not ( = ?auto_30587 ?auto_30590 ) ) ( TRUCK-AT ?auto_30593 ?auto_30595 ) ( SURFACE-AT ?auto_30587 ?auto_30595 ) ( CLEAR ?auto_30587 ) ( IS-CRATE ?auto_30588 ) ( AVAILABLE ?auto_30591 ) ( IN ?auto_30588 ?auto_30593 ) ( ON ?auto_30587 ?auto_30586 ) ( not ( = ?auto_30586 ?auto_30587 ) ) ( not ( = ?auto_30586 ?auto_30588 ) ) ( not ( = ?auto_30586 ?auto_30589 ) ) ( not ( = ?auto_30586 ?auto_30590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30587 ?auto_30588 ?auto_30589 )
      ( MAKE-3CRATE-VERIFY ?auto_30586 ?auto_30587 ?auto_30588 ?auto_30589 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30596 - SURFACE
      ?auto_30597 - SURFACE
      ?auto_30598 - SURFACE
      ?auto_30599 - SURFACE
      ?auto_30600 - SURFACE
    )
    :vars
    (
      ?auto_30602 - HOIST
      ?auto_30606 - PLACE
      ?auto_30605 - PLACE
      ?auto_30603 - HOIST
      ?auto_30601 - SURFACE
      ?auto_30604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30602 ?auto_30606 ) ( IS-CRATE ?auto_30600 ) ( not ( = ?auto_30599 ?auto_30600 ) ) ( not ( = ?auto_30598 ?auto_30599 ) ) ( not ( = ?auto_30598 ?auto_30600 ) ) ( not ( = ?auto_30605 ?auto_30606 ) ) ( HOIST-AT ?auto_30603 ?auto_30605 ) ( not ( = ?auto_30602 ?auto_30603 ) ) ( AVAILABLE ?auto_30603 ) ( SURFACE-AT ?auto_30600 ?auto_30605 ) ( ON ?auto_30600 ?auto_30601 ) ( CLEAR ?auto_30600 ) ( not ( = ?auto_30599 ?auto_30601 ) ) ( not ( = ?auto_30600 ?auto_30601 ) ) ( not ( = ?auto_30598 ?auto_30601 ) ) ( TRUCK-AT ?auto_30604 ?auto_30606 ) ( SURFACE-AT ?auto_30598 ?auto_30606 ) ( CLEAR ?auto_30598 ) ( IS-CRATE ?auto_30599 ) ( AVAILABLE ?auto_30602 ) ( IN ?auto_30599 ?auto_30604 ) ( ON ?auto_30597 ?auto_30596 ) ( ON ?auto_30598 ?auto_30597 ) ( not ( = ?auto_30596 ?auto_30597 ) ) ( not ( = ?auto_30596 ?auto_30598 ) ) ( not ( = ?auto_30596 ?auto_30599 ) ) ( not ( = ?auto_30596 ?auto_30600 ) ) ( not ( = ?auto_30596 ?auto_30601 ) ) ( not ( = ?auto_30597 ?auto_30598 ) ) ( not ( = ?auto_30597 ?auto_30599 ) ) ( not ( = ?auto_30597 ?auto_30600 ) ) ( not ( = ?auto_30597 ?auto_30601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30598 ?auto_30599 ?auto_30600 )
      ( MAKE-4CRATE-VERIFY ?auto_30596 ?auto_30597 ?auto_30598 ?auto_30599 ?auto_30600 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30607 - SURFACE
      ?auto_30608 - SURFACE
      ?auto_30609 - SURFACE
      ?auto_30610 - SURFACE
      ?auto_30611 - SURFACE
      ?auto_30612 - SURFACE
    )
    :vars
    (
      ?auto_30614 - HOIST
      ?auto_30618 - PLACE
      ?auto_30617 - PLACE
      ?auto_30615 - HOIST
      ?auto_30613 - SURFACE
      ?auto_30616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30614 ?auto_30618 ) ( IS-CRATE ?auto_30612 ) ( not ( = ?auto_30611 ?auto_30612 ) ) ( not ( = ?auto_30610 ?auto_30611 ) ) ( not ( = ?auto_30610 ?auto_30612 ) ) ( not ( = ?auto_30617 ?auto_30618 ) ) ( HOIST-AT ?auto_30615 ?auto_30617 ) ( not ( = ?auto_30614 ?auto_30615 ) ) ( AVAILABLE ?auto_30615 ) ( SURFACE-AT ?auto_30612 ?auto_30617 ) ( ON ?auto_30612 ?auto_30613 ) ( CLEAR ?auto_30612 ) ( not ( = ?auto_30611 ?auto_30613 ) ) ( not ( = ?auto_30612 ?auto_30613 ) ) ( not ( = ?auto_30610 ?auto_30613 ) ) ( TRUCK-AT ?auto_30616 ?auto_30618 ) ( SURFACE-AT ?auto_30610 ?auto_30618 ) ( CLEAR ?auto_30610 ) ( IS-CRATE ?auto_30611 ) ( AVAILABLE ?auto_30614 ) ( IN ?auto_30611 ?auto_30616 ) ( ON ?auto_30608 ?auto_30607 ) ( ON ?auto_30609 ?auto_30608 ) ( ON ?auto_30610 ?auto_30609 ) ( not ( = ?auto_30607 ?auto_30608 ) ) ( not ( = ?auto_30607 ?auto_30609 ) ) ( not ( = ?auto_30607 ?auto_30610 ) ) ( not ( = ?auto_30607 ?auto_30611 ) ) ( not ( = ?auto_30607 ?auto_30612 ) ) ( not ( = ?auto_30607 ?auto_30613 ) ) ( not ( = ?auto_30608 ?auto_30609 ) ) ( not ( = ?auto_30608 ?auto_30610 ) ) ( not ( = ?auto_30608 ?auto_30611 ) ) ( not ( = ?auto_30608 ?auto_30612 ) ) ( not ( = ?auto_30608 ?auto_30613 ) ) ( not ( = ?auto_30609 ?auto_30610 ) ) ( not ( = ?auto_30609 ?auto_30611 ) ) ( not ( = ?auto_30609 ?auto_30612 ) ) ( not ( = ?auto_30609 ?auto_30613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30610 ?auto_30611 ?auto_30612 )
      ( MAKE-5CRATE-VERIFY ?auto_30607 ?auto_30608 ?auto_30609 ?auto_30610 ?auto_30611 ?auto_30612 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30619 - SURFACE
      ?auto_30620 - SURFACE
    )
    :vars
    (
      ?auto_30622 - HOIST
      ?auto_30626 - PLACE
      ?auto_30627 - SURFACE
      ?auto_30625 - PLACE
      ?auto_30623 - HOIST
      ?auto_30621 - SURFACE
      ?auto_30624 - TRUCK
      ?auto_30628 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30622 ?auto_30626 ) ( IS-CRATE ?auto_30620 ) ( not ( = ?auto_30619 ?auto_30620 ) ) ( not ( = ?auto_30627 ?auto_30619 ) ) ( not ( = ?auto_30627 ?auto_30620 ) ) ( not ( = ?auto_30625 ?auto_30626 ) ) ( HOIST-AT ?auto_30623 ?auto_30625 ) ( not ( = ?auto_30622 ?auto_30623 ) ) ( AVAILABLE ?auto_30623 ) ( SURFACE-AT ?auto_30620 ?auto_30625 ) ( ON ?auto_30620 ?auto_30621 ) ( CLEAR ?auto_30620 ) ( not ( = ?auto_30619 ?auto_30621 ) ) ( not ( = ?auto_30620 ?auto_30621 ) ) ( not ( = ?auto_30627 ?auto_30621 ) ) ( SURFACE-AT ?auto_30627 ?auto_30626 ) ( CLEAR ?auto_30627 ) ( IS-CRATE ?auto_30619 ) ( AVAILABLE ?auto_30622 ) ( IN ?auto_30619 ?auto_30624 ) ( TRUCK-AT ?auto_30624 ?auto_30628 ) ( not ( = ?auto_30628 ?auto_30626 ) ) ( not ( = ?auto_30625 ?auto_30628 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30624 ?auto_30628 ?auto_30626 )
      ( MAKE-2CRATE ?auto_30627 ?auto_30619 ?auto_30620 )
      ( MAKE-1CRATE-VERIFY ?auto_30619 ?auto_30620 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30629 - SURFACE
      ?auto_30630 - SURFACE
      ?auto_30631 - SURFACE
    )
    :vars
    (
      ?auto_30636 - HOIST
      ?auto_30635 - PLACE
      ?auto_30632 - PLACE
      ?auto_30634 - HOIST
      ?auto_30637 - SURFACE
      ?auto_30638 - TRUCK
      ?auto_30633 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30636 ?auto_30635 ) ( IS-CRATE ?auto_30631 ) ( not ( = ?auto_30630 ?auto_30631 ) ) ( not ( = ?auto_30629 ?auto_30630 ) ) ( not ( = ?auto_30629 ?auto_30631 ) ) ( not ( = ?auto_30632 ?auto_30635 ) ) ( HOIST-AT ?auto_30634 ?auto_30632 ) ( not ( = ?auto_30636 ?auto_30634 ) ) ( AVAILABLE ?auto_30634 ) ( SURFACE-AT ?auto_30631 ?auto_30632 ) ( ON ?auto_30631 ?auto_30637 ) ( CLEAR ?auto_30631 ) ( not ( = ?auto_30630 ?auto_30637 ) ) ( not ( = ?auto_30631 ?auto_30637 ) ) ( not ( = ?auto_30629 ?auto_30637 ) ) ( SURFACE-AT ?auto_30629 ?auto_30635 ) ( CLEAR ?auto_30629 ) ( IS-CRATE ?auto_30630 ) ( AVAILABLE ?auto_30636 ) ( IN ?auto_30630 ?auto_30638 ) ( TRUCK-AT ?auto_30638 ?auto_30633 ) ( not ( = ?auto_30633 ?auto_30635 ) ) ( not ( = ?auto_30632 ?auto_30633 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30630 ?auto_30631 )
      ( MAKE-2CRATE-VERIFY ?auto_30629 ?auto_30630 ?auto_30631 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30639 - SURFACE
      ?auto_30640 - SURFACE
      ?auto_30641 - SURFACE
      ?auto_30642 - SURFACE
    )
    :vars
    (
      ?auto_30648 - HOIST
      ?auto_30645 - PLACE
      ?auto_30649 - PLACE
      ?auto_30646 - HOIST
      ?auto_30647 - SURFACE
      ?auto_30644 - TRUCK
      ?auto_30643 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30648 ?auto_30645 ) ( IS-CRATE ?auto_30642 ) ( not ( = ?auto_30641 ?auto_30642 ) ) ( not ( = ?auto_30640 ?auto_30641 ) ) ( not ( = ?auto_30640 ?auto_30642 ) ) ( not ( = ?auto_30649 ?auto_30645 ) ) ( HOIST-AT ?auto_30646 ?auto_30649 ) ( not ( = ?auto_30648 ?auto_30646 ) ) ( AVAILABLE ?auto_30646 ) ( SURFACE-AT ?auto_30642 ?auto_30649 ) ( ON ?auto_30642 ?auto_30647 ) ( CLEAR ?auto_30642 ) ( not ( = ?auto_30641 ?auto_30647 ) ) ( not ( = ?auto_30642 ?auto_30647 ) ) ( not ( = ?auto_30640 ?auto_30647 ) ) ( SURFACE-AT ?auto_30640 ?auto_30645 ) ( CLEAR ?auto_30640 ) ( IS-CRATE ?auto_30641 ) ( AVAILABLE ?auto_30648 ) ( IN ?auto_30641 ?auto_30644 ) ( TRUCK-AT ?auto_30644 ?auto_30643 ) ( not ( = ?auto_30643 ?auto_30645 ) ) ( not ( = ?auto_30649 ?auto_30643 ) ) ( ON ?auto_30640 ?auto_30639 ) ( not ( = ?auto_30639 ?auto_30640 ) ) ( not ( = ?auto_30639 ?auto_30641 ) ) ( not ( = ?auto_30639 ?auto_30642 ) ) ( not ( = ?auto_30639 ?auto_30647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30640 ?auto_30641 ?auto_30642 )
      ( MAKE-3CRATE-VERIFY ?auto_30639 ?auto_30640 ?auto_30641 ?auto_30642 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30650 - SURFACE
      ?auto_30651 - SURFACE
      ?auto_30652 - SURFACE
      ?auto_30653 - SURFACE
      ?auto_30654 - SURFACE
    )
    :vars
    (
      ?auto_30660 - HOIST
      ?auto_30657 - PLACE
      ?auto_30661 - PLACE
      ?auto_30658 - HOIST
      ?auto_30659 - SURFACE
      ?auto_30656 - TRUCK
      ?auto_30655 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30660 ?auto_30657 ) ( IS-CRATE ?auto_30654 ) ( not ( = ?auto_30653 ?auto_30654 ) ) ( not ( = ?auto_30652 ?auto_30653 ) ) ( not ( = ?auto_30652 ?auto_30654 ) ) ( not ( = ?auto_30661 ?auto_30657 ) ) ( HOIST-AT ?auto_30658 ?auto_30661 ) ( not ( = ?auto_30660 ?auto_30658 ) ) ( AVAILABLE ?auto_30658 ) ( SURFACE-AT ?auto_30654 ?auto_30661 ) ( ON ?auto_30654 ?auto_30659 ) ( CLEAR ?auto_30654 ) ( not ( = ?auto_30653 ?auto_30659 ) ) ( not ( = ?auto_30654 ?auto_30659 ) ) ( not ( = ?auto_30652 ?auto_30659 ) ) ( SURFACE-AT ?auto_30652 ?auto_30657 ) ( CLEAR ?auto_30652 ) ( IS-CRATE ?auto_30653 ) ( AVAILABLE ?auto_30660 ) ( IN ?auto_30653 ?auto_30656 ) ( TRUCK-AT ?auto_30656 ?auto_30655 ) ( not ( = ?auto_30655 ?auto_30657 ) ) ( not ( = ?auto_30661 ?auto_30655 ) ) ( ON ?auto_30651 ?auto_30650 ) ( ON ?auto_30652 ?auto_30651 ) ( not ( = ?auto_30650 ?auto_30651 ) ) ( not ( = ?auto_30650 ?auto_30652 ) ) ( not ( = ?auto_30650 ?auto_30653 ) ) ( not ( = ?auto_30650 ?auto_30654 ) ) ( not ( = ?auto_30650 ?auto_30659 ) ) ( not ( = ?auto_30651 ?auto_30652 ) ) ( not ( = ?auto_30651 ?auto_30653 ) ) ( not ( = ?auto_30651 ?auto_30654 ) ) ( not ( = ?auto_30651 ?auto_30659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30652 ?auto_30653 ?auto_30654 )
      ( MAKE-4CRATE-VERIFY ?auto_30650 ?auto_30651 ?auto_30652 ?auto_30653 ?auto_30654 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30662 - SURFACE
      ?auto_30663 - SURFACE
      ?auto_30664 - SURFACE
      ?auto_30665 - SURFACE
      ?auto_30666 - SURFACE
      ?auto_30667 - SURFACE
    )
    :vars
    (
      ?auto_30673 - HOIST
      ?auto_30670 - PLACE
      ?auto_30674 - PLACE
      ?auto_30671 - HOIST
      ?auto_30672 - SURFACE
      ?auto_30669 - TRUCK
      ?auto_30668 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30673 ?auto_30670 ) ( IS-CRATE ?auto_30667 ) ( not ( = ?auto_30666 ?auto_30667 ) ) ( not ( = ?auto_30665 ?auto_30666 ) ) ( not ( = ?auto_30665 ?auto_30667 ) ) ( not ( = ?auto_30674 ?auto_30670 ) ) ( HOIST-AT ?auto_30671 ?auto_30674 ) ( not ( = ?auto_30673 ?auto_30671 ) ) ( AVAILABLE ?auto_30671 ) ( SURFACE-AT ?auto_30667 ?auto_30674 ) ( ON ?auto_30667 ?auto_30672 ) ( CLEAR ?auto_30667 ) ( not ( = ?auto_30666 ?auto_30672 ) ) ( not ( = ?auto_30667 ?auto_30672 ) ) ( not ( = ?auto_30665 ?auto_30672 ) ) ( SURFACE-AT ?auto_30665 ?auto_30670 ) ( CLEAR ?auto_30665 ) ( IS-CRATE ?auto_30666 ) ( AVAILABLE ?auto_30673 ) ( IN ?auto_30666 ?auto_30669 ) ( TRUCK-AT ?auto_30669 ?auto_30668 ) ( not ( = ?auto_30668 ?auto_30670 ) ) ( not ( = ?auto_30674 ?auto_30668 ) ) ( ON ?auto_30663 ?auto_30662 ) ( ON ?auto_30664 ?auto_30663 ) ( ON ?auto_30665 ?auto_30664 ) ( not ( = ?auto_30662 ?auto_30663 ) ) ( not ( = ?auto_30662 ?auto_30664 ) ) ( not ( = ?auto_30662 ?auto_30665 ) ) ( not ( = ?auto_30662 ?auto_30666 ) ) ( not ( = ?auto_30662 ?auto_30667 ) ) ( not ( = ?auto_30662 ?auto_30672 ) ) ( not ( = ?auto_30663 ?auto_30664 ) ) ( not ( = ?auto_30663 ?auto_30665 ) ) ( not ( = ?auto_30663 ?auto_30666 ) ) ( not ( = ?auto_30663 ?auto_30667 ) ) ( not ( = ?auto_30663 ?auto_30672 ) ) ( not ( = ?auto_30664 ?auto_30665 ) ) ( not ( = ?auto_30664 ?auto_30666 ) ) ( not ( = ?auto_30664 ?auto_30667 ) ) ( not ( = ?auto_30664 ?auto_30672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30665 ?auto_30666 ?auto_30667 )
      ( MAKE-5CRATE-VERIFY ?auto_30662 ?auto_30663 ?auto_30664 ?auto_30665 ?auto_30666 ?auto_30667 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30675 - SURFACE
      ?auto_30676 - SURFACE
    )
    :vars
    (
      ?auto_30683 - HOIST
      ?auto_30680 - PLACE
      ?auto_30677 - SURFACE
      ?auto_30684 - PLACE
      ?auto_30681 - HOIST
      ?auto_30682 - SURFACE
      ?auto_30679 - TRUCK
      ?auto_30678 - PLACE
      ?auto_30685 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30683 ?auto_30680 ) ( IS-CRATE ?auto_30676 ) ( not ( = ?auto_30675 ?auto_30676 ) ) ( not ( = ?auto_30677 ?auto_30675 ) ) ( not ( = ?auto_30677 ?auto_30676 ) ) ( not ( = ?auto_30684 ?auto_30680 ) ) ( HOIST-AT ?auto_30681 ?auto_30684 ) ( not ( = ?auto_30683 ?auto_30681 ) ) ( AVAILABLE ?auto_30681 ) ( SURFACE-AT ?auto_30676 ?auto_30684 ) ( ON ?auto_30676 ?auto_30682 ) ( CLEAR ?auto_30676 ) ( not ( = ?auto_30675 ?auto_30682 ) ) ( not ( = ?auto_30676 ?auto_30682 ) ) ( not ( = ?auto_30677 ?auto_30682 ) ) ( SURFACE-AT ?auto_30677 ?auto_30680 ) ( CLEAR ?auto_30677 ) ( IS-CRATE ?auto_30675 ) ( AVAILABLE ?auto_30683 ) ( TRUCK-AT ?auto_30679 ?auto_30678 ) ( not ( = ?auto_30678 ?auto_30680 ) ) ( not ( = ?auto_30684 ?auto_30678 ) ) ( HOIST-AT ?auto_30685 ?auto_30678 ) ( LIFTING ?auto_30685 ?auto_30675 ) ( not ( = ?auto_30683 ?auto_30685 ) ) ( not ( = ?auto_30681 ?auto_30685 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30685 ?auto_30675 ?auto_30679 ?auto_30678 )
      ( MAKE-2CRATE ?auto_30677 ?auto_30675 ?auto_30676 )
      ( MAKE-1CRATE-VERIFY ?auto_30675 ?auto_30676 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30686 - SURFACE
      ?auto_30687 - SURFACE
      ?auto_30688 - SURFACE
    )
    :vars
    (
      ?auto_30696 - HOIST
      ?auto_30693 - PLACE
      ?auto_30695 - PLACE
      ?auto_30692 - HOIST
      ?auto_30691 - SURFACE
      ?auto_30689 - TRUCK
      ?auto_30694 - PLACE
      ?auto_30690 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30696 ?auto_30693 ) ( IS-CRATE ?auto_30688 ) ( not ( = ?auto_30687 ?auto_30688 ) ) ( not ( = ?auto_30686 ?auto_30687 ) ) ( not ( = ?auto_30686 ?auto_30688 ) ) ( not ( = ?auto_30695 ?auto_30693 ) ) ( HOIST-AT ?auto_30692 ?auto_30695 ) ( not ( = ?auto_30696 ?auto_30692 ) ) ( AVAILABLE ?auto_30692 ) ( SURFACE-AT ?auto_30688 ?auto_30695 ) ( ON ?auto_30688 ?auto_30691 ) ( CLEAR ?auto_30688 ) ( not ( = ?auto_30687 ?auto_30691 ) ) ( not ( = ?auto_30688 ?auto_30691 ) ) ( not ( = ?auto_30686 ?auto_30691 ) ) ( SURFACE-AT ?auto_30686 ?auto_30693 ) ( CLEAR ?auto_30686 ) ( IS-CRATE ?auto_30687 ) ( AVAILABLE ?auto_30696 ) ( TRUCK-AT ?auto_30689 ?auto_30694 ) ( not ( = ?auto_30694 ?auto_30693 ) ) ( not ( = ?auto_30695 ?auto_30694 ) ) ( HOIST-AT ?auto_30690 ?auto_30694 ) ( LIFTING ?auto_30690 ?auto_30687 ) ( not ( = ?auto_30696 ?auto_30690 ) ) ( not ( = ?auto_30692 ?auto_30690 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30687 ?auto_30688 )
      ( MAKE-2CRATE-VERIFY ?auto_30686 ?auto_30687 ?auto_30688 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30697 - SURFACE
      ?auto_30698 - SURFACE
      ?auto_30699 - SURFACE
      ?auto_30700 - SURFACE
    )
    :vars
    (
      ?auto_30701 - HOIST
      ?auto_30708 - PLACE
      ?auto_30707 - PLACE
      ?auto_30703 - HOIST
      ?auto_30705 - SURFACE
      ?auto_30704 - TRUCK
      ?auto_30706 - PLACE
      ?auto_30702 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30701 ?auto_30708 ) ( IS-CRATE ?auto_30700 ) ( not ( = ?auto_30699 ?auto_30700 ) ) ( not ( = ?auto_30698 ?auto_30699 ) ) ( not ( = ?auto_30698 ?auto_30700 ) ) ( not ( = ?auto_30707 ?auto_30708 ) ) ( HOIST-AT ?auto_30703 ?auto_30707 ) ( not ( = ?auto_30701 ?auto_30703 ) ) ( AVAILABLE ?auto_30703 ) ( SURFACE-AT ?auto_30700 ?auto_30707 ) ( ON ?auto_30700 ?auto_30705 ) ( CLEAR ?auto_30700 ) ( not ( = ?auto_30699 ?auto_30705 ) ) ( not ( = ?auto_30700 ?auto_30705 ) ) ( not ( = ?auto_30698 ?auto_30705 ) ) ( SURFACE-AT ?auto_30698 ?auto_30708 ) ( CLEAR ?auto_30698 ) ( IS-CRATE ?auto_30699 ) ( AVAILABLE ?auto_30701 ) ( TRUCK-AT ?auto_30704 ?auto_30706 ) ( not ( = ?auto_30706 ?auto_30708 ) ) ( not ( = ?auto_30707 ?auto_30706 ) ) ( HOIST-AT ?auto_30702 ?auto_30706 ) ( LIFTING ?auto_30702 ?auto_30699 ) ( not ( = ?auto_30701 ?auto_30702 ) ) ( not ( = ?auto_30703 ?auto_30702 ) ) ( ON ?auto_30698 ?auto_30697 ) ( not ( = ?auto_30697 ?auto_30698 ) ) ( not ( = ?auto_30697 ?auto_30699 ) ) ( not ( = ?auto_30697 ?auto_30700 ) ) ( not ( = ?auto_30697 ?auto_30705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30698 ?auto_30699 ?auto_30700 )
      ( MAKE-3CRATE-VERIFY ?auto_30697 ?auto_30698 ?auto_30699 ?auto_30700 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30709 - SURFACE
      ?auto_30710 - SURFACE
      ?auto_30711 - SURFACE
      ?auto_30712 - SURFACE
      ?auto_30713 - SURFACE
    )
    :vars
    (
      ?auto_30714 - HOIST
      ?auto_30721 - PLACE
      ?auto_30720 - PLACE
      ?auto_30716 - HOIST
      ?auto_30718 - SURFACE
      ?auto_30717 - TRUCK
      ?auto_30719 - PLACE
      ?auto_30715 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30714 ?auto_30721 ) ( IS-CRATE ?auto_30713 ) ( not ( = ?auto_30712 ?auto_30713 ) ) ( not ( = ?auto_30711 ?auto_30712 ) ) ( not ( = ?auto_30711 ?auto_30713 ) ) ( not ( = ?auto_30720 ?auto_30721 ) ) ( HOIST-AT ?auto_30716 ?auto_30720 ) ( not ( = ?auto_30714 ?auto_30716 ) ) ( AVAILABLE ?auto_30716 ) ( SURFACE-AT ?auto_30713 ?auto_30720 ) ( ON ?auto_30713 ?auto_30718 ) ( CLEAR ?auto_30713 ) ( not ( = ?auto_30712 ?auto_30718 ) ) ( not ( = ?auto_30713 ?auto_30718 ) ) ( not ( = ?auto_30711 ?auto_30718 ) ) ( SURFACE-AT ?auto_30711 ?auto_30721 ) ( CLEAR ?auto_30711 ) ( IS-CRATE ?auto_30712 ) ( AVAILABLE ?auto_30714 ) ( TRUCK-AT ?auto_30717 ?auto_30719 ) ( not ( = ?auto_30719 ?auto_30721 ) ) ( not ( = ?auto_30720 ?auto_30719 ) ) ( HOIST-AT ?auto_30715 ?auto_30719 ) ( LIFTING ?auto_30715 ?auto_30712 ) ( not ( = ?auto_30714 ?auto_30715 ) ) ( not ( = ?auto_30716 ?auto_30715 ) ) ( ON ?auto_30710 ?auto_30709 ) ( ON ?auto_30711 ?auto_30710 ) ( not ( = ?auto_30709 ?auto_30710 ) ) ( not ( = ?auto_30709 ?auto_30711 ) ) ( not ( = ?auto_30709 ?auto_30712 ) ) ( not ( = ?auto_30709 ?auto_30713 ) ) ( not ( = ?auto_30709 ?auto_30718 ) ) ( not ( = ?auto_30710 ?auto_30711 ) ) ( not ( = ?auto_30710 ?auto_30712 ) ) ( not ( = ?auto_30710 ?auto_30713 ) ) ( not ( = ?auto_30710 ?auto_30718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30711 ?auto_30712 ?auto_30713 )
      ( MAKE-4CRATE-VERIFY ?auto_30709 ?auto_30710 ?auto_30711 ?auto_30712 ?auto_30713 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30722 - SURFACE
      ?auto_30723 - SURFACE
      ?auto_30724 - SURFACE
      ?auto_30725 - SURFACE
      ?auto_30726 - SURFACE
      ?auto_30727 - SURFACE
    )
    :vars
    (
      ?auto_30728 - HOIST
      ?auto_30735 - PLACE
      ?auto_30734 - PLACE
      ?auto_30730 - HOIST
      ?auto_30732 - SURFACE
      ?auto_30731 - TRUCK
      ?auto_30733 - PLACE
      ?auto_30729 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30728 ?auto_30735 ) ( IS-CRATE ?auto_30727 ) ( not ( = ?auto_30726 ?auto_30727 ) ) ( not ( = ?auto_30725 ?auto_30726 ) ) ( not ( = ?auto_30725 ?auto_30727 ) ) ( not ( = ?auto_30734 ?auto_30735 ) ) ( HOIST-AT ?auto_30730 ?auto_30734 ) ( not ( = ?auto_30728 ?auto_30730 ) ) ( AVAILABLE ?auto_30730 ) ( SURFACE-AT ?auto_30727 ?auto_30734 ) ( ON ?auto_30727 ?auto_30732 ) ( CLEAR ?auto_30727 ) ( not ( = ?auto_30726 ?auto_30732 ) ) ( not ( = ?auto_30727 ?auto_30732 ) ) ( not ( = ?auto_30725 ?auto_30732 ) ) ( SURFACE-AT ?auto_30725 ?auto_30735 ) ( CLEAR ?auto_30725 ) ( IS-CRATE ?auto_30726 ) ( AVAILABLE ?auto_30728 ) ( TRUCK-AT ?auto_30731 ?auto_30733 ) ( not ( = ?auto_30733 ?auto_30735 ) ) ( not ( = ?auto_30734 ?auto_30733 ) ) ( HOIST-AT ?auto_30729 ?auto_30733 ) ( LIFTING ?auto_30729 ?auto_30726 ) ( not ( = ?auto_30728 ?auto_30729 ) ) ( not ( = ?auto_30730 ?auto_30729 ) ) ( ON ?auto_30723 ?auto_30722 ) ( ON ?auto_30724 ?auto_30723 ) ( ON ?auto_30725 ?auto_30724 ) ( not ( = ?auto_30722 ?auto_30723 ) ) ( not ( = ?auto_30722 ?auto_30724 ) ) ( not ( = ?auto_30722 ?auto_30725 ) ) ( not ( = ?auto_30722 ?auto_30726 ) ) ( not ( = ?auto_30722 ?auto_30727 ) ) ( not ( = ?auto_30722 ?auto_30732 ) ) ( not ( = ?auto_30723 ?auto_30724 ) ) ( not ( = ?auto_30723 ?auto_30725 ) ) ( not ( = ?auto_30723 ?auto_30726 ) ) ( not ( = ?auto_30723 ?auto_30727 ) ) ( not ( = ?auto_30723 ?auto_30732 ) ) ( not ( = ?auto_30724 ?auto_30725 ) ) ( not ( = ?auto_30724 ?auto_30726 ) ) ( not ( = ?auto_30724 ?auto_30727 ) ) ( not ( = ?auto_30724 ?auto_30732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30725 ?auto_30726 ?auto_30727 )
      ( MAKE-5CRATE-VERIFY ?auto_30722 ?auto_30723 ?auto_30724 ?auto_30725 ?auto_30726 ?auto_30727 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30736 - SURFACE
      ?auto_30737 - SURFACE
    )
    :vars
    (
      ?auto_30739 - HOIST
      ?auto_30746 - PLACE
      ?auto_30738 - SURFACE
      ?auto_30745 - PLACE
      ?auto_30741 - HOIST
      ?auto_30743 - SURFACE
      ?auto_30742 - TRUCK
      ?auto_30744 - PLACE
      ?auto_30740 - HOIST
      ?auto_30747 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30739 ?auto_30746 ) ( IS-CRATE ?auto_30737 ) ( not ( = ?auto_30736 ?auto_30737 ) ) ( not ( = ?auto_30738 ?auto_30736 ) ) ( not ( = ?auto_30738 ?auto_30737 ) ) ( not ( = ?auto_30745 ?auto_30746 ) ) ( HOIST-AT ?auto_30741 ?auto_30745 ) ( not ( = ?auto_30739 ?auto_30741 ) ) ( AVAILABLE ?auto_30741 ) ( SURFACE-AT ?auto_30737 ?auto_30745 ) ( ON ?auto_30737 ?auto_30743 ) ( CLEAR ?auto_30737 ) ( not ( = ?auto_30736 ?auto_30743 ) ) ( not ( = ?auto_30737 ?auto_30743 ) ) ( not ( = ?auto_30738 ?auto_30743 ) ) ( SURFACE-AT ?auto_30738 ?auto_30746 ) ( CLEAR ?auto_30738 ) ( IS-CRATE ?auto_30736 ) ( AVAILABLE ?auto_30739 ) ( TRUCK-AT ?auto_30742 ?auto_30744 ) ( not ( = ?auto_30744 ?auto_30746 ) ) ( not ( = ?auto_30745 ?auto_30744 ) ) ( HOIST-AT ?auto_30740 ?auto_30744 ) ( not ( = ?auto_30739 ?auto_30740 ) ) ( not ( = ?auto_30741 ?auto_30740 ) ) ( AVAILABLE ?auto_30740 ) ( SURFACE-AT ?auto_30736 ?auto_30744 ) ( ON ?auto_30736 ?auto_30747 ) ( CLEAR ?auto_30736 ) ( not ( = ?auto_30736 ?auto_30747 ) ) ( not ( = ?auto_30737 ?auto_30747 ) ) ( not ( = ?auto_30738 ?auto_30747 ) ) ( not ( = ?auto_30743 ?auto_30747 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30740 ?auto_30736 ?auto_30747 ?auto_30744 )
      ( MAKE-2CRATE ?auto_30738 ?auto_30736 ?auto_30737 )
      ( MAKE-1CRATE-VERIFY ?auto_30736 ?auto_30737 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30748 - SURFACE
      ?auto_30749 - SURFACE
      ?auto_30750 - SURFACE
    )
    :vars
    (
      ?auto_30751 - HOIST
      ?auto_30756 - PLACE
      ?auto_30753 - PLACE
      ?auto_30757 - HOIST
      ?auto_30755 - SURFACE
      ?auto_30754 - TRUCK
      ?auto_30758 - PLACE
      ?auto_30752 - HOIST
      ?auto_30759 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30751 ?auto_30756 ) ( IS-CRATE ?auto_30750 ) ( not ( = ?auto_30749 ?auto_30750 ) ) ( not ( = ?auto_30748 ?auto_30749 ) ) ( not ( = ?auto_30748 ?auto_30750 ) ) ( not ( = ?auto_30753 ?auto_30756 ) ) ( HOIST-AT ?auto_30757 ?auto_30753 ) ( not ( = ?auto_30751 ?auto_30757 ) ) ( AVAILABLE ?auto_30757 ) ( SURFACE-AT ?auto_30750 ?auto_30753 ) ( ON ?auto_30750 ?auto_30755 ) ( CLEAR ?auto_30750 ) ( not ( = ?auto_30749 ?auto_30755 ) ) ( not ( = ?auto_30750 ?auto_30755 ) ) ( not ( = ?auto_30748 ?auto_30755 ) ) ( SURFACE-AT ?auto_30748 ?auto_30756 ) ( CLEAR ?auto_30748 ) ( IS-CRATE ?auto_30749 ) ( AVAILABLE ?auto_30751 ) ( TRUCK-AT ?auto_30754 ?auto_30758 ) ( not ( = ?auto_30758 ?auto_30756 ) ) ( not ( = ?auto_30753 ?auto_30758 ) ) ( HOIST-AT ?auto_30752 ?auto_30758 ) ( not ( = ?auto_30751 ?auto_30752 ) ) ( not ( = ?auto_30757 ?auto_30752 ) ) ( AVAILABLE ?auto_30752 ) ( SURFACE-AT ?auto_30749 ?auto_30758 ) ( ON ?auto_30749 ?auto_30759 ) ( CLEAR ?auto_30749 ) ( not ( = ?auto_30749 ?auto_30759 ) ) ( not ( = ?auto_30750 ?auto_30759 ) ) ( not ( = ?auto_30748 ?auto_30759 ) ) ( not ( = ?auto_30755 ?auto_30759 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30749 ?auto_30750 )
      ( MAKE-2CRATE-VERIFY ?auto_30748 ?auto_30749 ?auto_30750 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30760 - SURFACE
      ?auto_30761 - SURFACE
      ?auto_30762 - SURFACE
      ?auto_30763 - SURFACE
    )
    :vars
    (
      ?auto_30767 - HOIST
      ?auto_30772 - PLACE
      ?auto_30769 - PLACE
      ?auto_30765 - HOIST
      ?auto_30764 - SURFACE
      ?auto_30766 - TRUCK
      ?auto_30771 - PLACE
      ?auto_30768 - HOIST
      ?auto_30770 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30767 ?auto_30772 ) ( IS-CRATE ?auto_30763 ) ( not ( = ?auto_30762 ?auto_30763 ) ) ( not ( = ?auto_30761 ?auto_30762 ) ) ( not ( = ?auto_30761 ?auto_30763 ) ) ( not ( = ?auto_30769 ?auto_30772 ) ) ( HOIST-AT ?auto_30765 ?auto_30769 ) ( not ( = ?auto_30767 ?auto_30765 ) ) ( AVAILABLE ?auto_30765 ) ( SURFACE-AT ?auto_30763 ?auto_30769 ) ( ON ?auto_30763 ?auto_30764 ) ( CLEAR ?auto_30763 ) ( not ( = ?auto_30762 ?auto_30764 ) ) ( not ( = ?auto_30763 ?auto_30764 ) ) ( not ( = ?auto_30761 ?auto_30764 ) ) ( SURFACE-AT ?auto_30761 ?auto_30772 ) ( CLEAR ?auto_30761 ) ( IS-CRATE ?auto_30762 ) ( AVAILABLE ?auto_30767 ) ( TRUCK-AT ?auto_30766 ?auto_30771 ) ( not ( = ?auto_30771 ?auto_30772 ) ) ( not ( = ?auto_30769 ?auto_30771 ) ) ( HOIST-AT ?auto_30768 ?auto_30771 ) ( not ( = ?auto_30767 ?auto_30768 ) ) ( not ( = ?auto_30765 ?auto_30768 ) ) ( AVAILABLE ?auto_30768 ) ( SURFACE-AT ?auto_30762 ?auto_30771 ) ( ON ?auto_30762 ?auto_30770 ) ( CLEAR ?auto_30762 ) ( not ( = ?auto_30762 ?auto_30770 ) ) ( not ( = ?auto_30763 ?auto_30770 ) ) ( not ( = ?auto_30761 ?auto_30770 ) ) ( not ( = ?auto_30764 ?auto_30770 ) ) ( ON ?auto_30761 ?auto_30760 ) ( not ( = ?auto_30760 ?auto_30761 ) ) ( not ( = ?auto_30760 ?auto_30762 ) ) ( not ( = ?auto_30760 ?auto_30763 ) ) ( not ( = ?auto_30760 ?auto_30764 ) ) ( not ( = ?auto_30760 ?auto_30770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30761 ?auto_30762 ?auto_30763 )
      ( MAKE-3CRATE-VERIFY ?auto_30760 ?auto_30761 ?auto_30762 ?auto_30763 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30773 - SURFACE
      ?auto_30774 - SURFACE
      ?auto_30775 - SURFACE
      ?auto_30776 - SURFACE
      ?auto_30777 - SURFACE
    )
    :vars
    (
      ?auto_30781 - HOIST
      ?auto_30786 - PLACE
      ?auto_30783 - PLACE
      ?auto_30779 - HOIST
      ?auto_30778 - SURFACE
      ?auto_30780 - TRUCK
      ?auto_30785 - PLACE
      ?auto_30782 - HOIST
      ?auto_30784 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30781 ?auto_30786 ) ( IS-CRATE ?auto_30777 ) ( not ( = ?auto_30776 ?auto_30777 ) ) ( not ( = ?auto_30775 ?auto_30776 ) ) ( not ( = ?auto_30775 ?auto_30777 ) ) ( not ( = ?auto_30783 ?auto_30786 ) ) ( HOIST-AT ?auto_30779 ?auto_30783 ) ( not ( = ?auto_30781 ?auto_30779 ) ) ( AVAILABLE ?auto_30779 ) ( SURFACE-AT ?auto_30777 ?auto_30783 ) ( ON ?auto_30777 ?auto_30778 ) ( CLEAR ?auto_30777 ) ( not ( = ?auto_30776 ?auto_30778 ) ) ( not ( = ?auto_30777 ?auto_30778 ) ) ( not ( = ?auto_30775 ?auto_30778 ) ) ( SURFACE-AT ?auto_30775 ?auto_30786 ) ( CLEAR ?auto_30775 ) ( IS-CRATE ?auto_30776 ) ( AVAILABLE ?auto_30781 ) ( TRUCK-AT ?auto_30780 ?auto_30785 ) ( not ( = ?auto_30785 ?auto_30786 ) ) ( not ( = ?auto_30783 ?auto_30785 ) ) ( HOIST-AT ?auto_30782 ?auto_30785 ) ( not ( = ?auto_30781 ?auto_30782 ) ) ( not ( = ?auto_30779 ?auto_30782 ) ) ( AVAILABLE ?auto_30782 ) ( SURFACE-AT ?auto_30776 ?auto_30785 ) ( ON ?auto_30776 ?auto_30784 ) ( CLEAR ?auto_30776 ) ( not ( = ?auto_30776 ?auto_30784 ) ) ( not ( = ?auto_30777 ?auto_30784 ) ) ( not ( = ?auto_30775 ?auto_30784 ) ) ( not ( = ?auto_30778 ?auto_30784 ) ) ( ON ?auto_30774 ?auto_30773 ) ( ON ?auto_30775 ?auto_30774 ) ( not ( = ?auto_30773 ?auto_30774 ) ) ( not ( = ?auto_30773 ?auto_30775 ) ) ( not ( = ?auto_30773 ?auto_30776 ) ) ( not ( = ?auto_30773 ?auto_30777 ) ) ( not ( = ?auto_30773 ?auto_30778 ) ) ( not ( = ?auto_30773 ?auto_30784 ) ) ( not ( = ?auto_30774 ?auto_30775 ) ) ( not ( = ?auto_30774 ?auto_30776 ) ) ( not ( = ?auto_30774 ?auto_30777 ) ) ( not ( = ?auto_30774 ?auto_30778 ) ) ( not ( = ?auto_30774 ?auto_30784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30775 ?auto_30776 ?auto_30777 )
      ( MAKE-4CRATE-VERIFY ?auto_30773 ?auto_30774 ?auto_30775 ?auto_30776 ?auto_30777 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30787 - SURFACE
      ?auto_30788 - SURFACE
      ?auto_30789 - SURFACE
      ?auto_30790 - SURFACE
      ?auto_30791 - SURFACE
      ?auto_30792 - SURFACE
    )
    :vars
    (
      ?auto_30796 - HOIST
      ?auto_30801 - PLACE
      ?auto_30798 - PLACE
      ?auto_30794 - HOIST
      ?auto_30793 - SURFACE
      ?auto_30795 - TRUCK
      ?auto_30800 - PLACE
      ?auto_30797 - HOIST
      ?auto_30799 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30796 ?auto_30801 ) ( IS-CRATE ?auto_30792 ) ( not ( = ?auto_30791 ?auto_30792 ) ) ( not ( = ?auto_30790 ?auto_30791 ) ) ( not ( = ?auto_30790 ?auto_30792 ) ) ( not ( = ?auto_30798 ?auto_30801 ) ) ( HOIST-AT ?auto_30794 ?auto_30798 ) ( not ( = ?auto_30796 ?auto_30794 ) ) ( AVAILABLE ?auto_30794 ) ( SURFACE-AT ?auto_30792 ?auto_30798 ) ( ON ?auto_30792 ?auto_30793 ) ( CLEAR ?auto_30792 ) ( not ( = ?auto_30791 ?auto_30793 ) ) ( not ( = ?auto_30792 ?auto_30793 ) ) ( not ( = ?auto_30790 ?auto_30793 ) ) ( SURFACE-AT ?auto_30790 ?auto_30801 ) ( CLEAR ?auto_30790 ) ( IS-CRATE ?auto_30791 ) ( AVAILABLE ?auto_30796 ) ( TRUCK-AT ?auto_30795 ?auto_30800 ) ( not ( = ?auto_30800 ?auto_30801 ) ) ( not ( = ?auto_30798 ?auto_30800 ) ) ( HOIST-AT ?auto_30797 ?auto_30800 ) ( not ( = ?auto_30796 ?auto_30797 ) ) ( not ( = ?auto_30794 ?auto_30797 ) ) ( AVAILABLE ?auto_30797 ) ( SURFACE-AT ?auto_30791 ?auto_30800 ) ( ON ?auto_30791 ?auto_30799 ) ( CLEAR ?auto_30791 ) ( not ( = ?auto_30791 ?auto_30799 ) ) ( not ( = ?auto_30792 ?auto_30799 ) ) ( not ( = ?auto_30790 ?auto_30799 ) ) ( not ( = ?auto_30793 ?auto_30799 ) ) ( ON ?auto_30788 ?auto_30787 ) ( ON ?auto_30789 ?auto_30788 ) ( ON ?auto_30790 ?auto_30789 ) ( not ( = ?auto_30787 ?auto_30788 ) ) ( not ( = ?auto_30787 ?auto_30789 ) ) ( not ( = ?auto_30787 ?auto_30790 ) ) ( not ( = ?auto_30787 ?auto_30791 ) ) ( not ( = ?auto_30787 ?auto_30792 ) ) ( not ( = ?auto_30787 ?auto_30793 ) ) ( not ( = ?auto_30787 ?auto_30799 ) ) ( not ( = ?auto_30788 ?auto_30789 ) ) ( not ( = ?auto_30788 ?auto_30790 ) ) ( not ( = ?auto_30788 ?auto_30791 ) ) ( not ( = ?auto_30788 ?auto_30792 ) ) ( not ( = ?auto_30788 ?auto_30793 ) ) ( not ( = ?auto_30788 ?auto_30799 ) ) ( not ( = ?auto_30789 ?auto_30790 ) ) ( not ( = ?auto_30789 ?auto_30791 ) ) ( not ( = ?auto_30789 ?auto_30792 ) ) ( not ( = ?auto_30789 ?auto_30793 ) ) ( not ( = ?auto_30789 ?auto_30799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30790 ?auto_30791 ?auto_30792 )
      ( MAKE-5CRATE-VERIFY ?auto_30787 ?auto_30788 ?auto_30789 ?auto_30790 ?auto_30791 ?auto_30792 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30802 - SURFACE
      ?auto_30803 - SURFACE
    )
    :vars
    (
      ?auto_30807 - HOIST
      ?auto_30812 - PLACE
      ?auto_30813 - SURFACE
      ?auto_30809 - PLACE
      ?auto_30805 - HOIST
      ?auto_30804 - SURFACE
      ?auto_30811 - PLACE
      ?auto_30808 - HOIST
      ?auto_30810 - SURFACE
      ?auto_30806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30807 ?auto_30812 ) ( IS-CRATE ?auto_30803 ) ( not ( = ?auto_30802 ?auto_30803 ) ) ( not ( = ?auto_30813 ?auto_30802 ) ) ( not ( = ?auto_30813 ?auto_30803 ) ) ( not ( = ?auto_30809 ?auto_30812 ) ) ( HOIST-AT ?auto_30805 ?auto_30809 ) ( not ( = ?auto_30807 ?auto_30805 ) ) ( AVAILABLE ?auto_30805 ) ( SURFACE-AT ?auto_30803 ?auto_30809 ) ( ON ?auto_30803 ?auto_30804 ) ( CLEAR ?auto_30803 ) ( not ( = ?auto_30802 ?auto_30804 ) ) ( not ( = ?auto_30803 ?auto_30804 ) ) ( not ( = ?auto_30813 ?auto_30804 ) ) ( SURFACE-AT ?auto_30813 ?auto_30812 ) ( CLEAR ?auto_30813 ) ( IS-CRATE ?auto_30802 ) ( AVAILABLE ?auto_30807 ) ( not ( = ?auto_30811 ?auto_30812 ) ) ( not ( = ?auto_30809 ?auto_30811 ) ) ( HOIST-AT ?auto_30808 ?auto_30811 ) ( not ( = ?auto_30807 ?auto_30808 ) ) ( not ( = ?auto_30805 ?auto_30808 ) ) ( AVAILABLE ?auto_30808 ) ( SURFACE-AT ?auto_30802 ?auto_30811 ) ( ON ?auto_30802 ?auto_30810 ) ( CLEAR ?auto_30802 ) ( not ( = ?auto_30802 ?auto_30810 ) ) ( not ( = ?auto_30803 ?auto_30810 ) ) ( not ( = ?auto_30813 ?auto_30810 ) ) ( not ( = ?auto_30804 ?auto_30810 ) ) ( TRUCK-AT ?auto_30806 ?auto_30812 ) )
    :subtasks
    ( ( !DRIVE ?auto_30806 ?auto_30812 ?auto_30811 )
      ( MAKE-2CRATE ?auto_30813 ?auto_30802 ?auto_30803 )
      ( MAKE-1CRATE-VERIFY ?auto_30802 ?auto_30803 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30814 - SURFACE
      ?auto_30815 - SURFACE
      ?auto_30816 - SURFACE
    )
    :vars
    (
      ?auto_30820 - HOIST
      ?auto_30823 - PLACE
      ?auto_30817 - PLACE
      ?auto_30818 - HOIST
      ?auto_30821 - SURFACE
      ?auto_30825 - PLACE
      ?auto_30819 - HOIST
      ?auto_30824 - SURFACE
      ?auto_30822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30820 ?auto_30823 ) ( IS-CRATE ?auto_30816 ) ( not ( = ?auto_30815 ?auto_30816 ) ) ( not ( = ?auto_30814 ?auto_30815 ) ) ( not ( = ?auto_30814 ?auto_30816 ) ) ( not ( = ?auto_30817 ?auto_30823 ) ) ( HOIST-AT ?auto_30818 ?auto_30817 ) ( not ( = ?auto_30820 ?auto_30818 ) ) ( AVAILABLE ?auto_30818 ) ( SURFACE-AT ?auto_30816 ?auto_30817 ) ( ON ?auto_30816 ?auto_30821 ) ( CLEAR ?auto_30816 ) ( not ( = ?auto_30815 ?auto_30821 ) ) ( not ( = ?auto_30816 ?auto_30821 ) ) ( not ( = ?auto_30814 ?auto_30821 ) ) ( SURFACE-AT ?auto_30814 ?auto_30823 ) ( CLEAR ?auto_30814 ) ( IS-CRATE ?auto_30815 ) ( AVAILABLE ?auto_30820 ) ( not ( = ?auto_30825 ?auto_30823 ) ) ( not ( = ?auto_30817 ?auto_30825 ) ) ( HOIST-AT ?auto_30819 ?auto_30825 ) ( not ( = ?auto_30820 ?auto_30819 ) ) ( not ( = ?auto_30818 ?auto_30819 ) ) ( AVAILABLE ?auto_30819 ) ( SURFACE-AT ?auto_30815 ?auto_30825 ) ( ON ?auto_30815 ?auto_30824 ) ( CLEAR ?auto_30815 ) ( not ( = ?auto_30815 ?auto_30824 ) ) ( not ( = ?auto_30816 ?auto_30824 ) ) ( not ( = ?auto_30814 ?auto_30824 ) ) ( not ( = ?auto_30821 ?auto_30824 ) ) ( TRUCK-AT ?auto_30822 ?auto_30823 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30815 ?auto_30816 )
      ( MAKE-2CRATE-VERIFY ?auto_30814 ?auto_30815 ?auto_30816 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30826 - SURFACE
      ?auto_30827 - SURFACE
      ?auto_30828 - SURFACE
      ?auto_30829 - SURFACE
    )
    :vars
    (
      ?auto_30833 - HOIST
      ?auto_30831 - PLACE
      ?auto_30832 - PLACE
      ?auto_30837 - HOIST
      ?auto_30830 - SURFACE
      ?auto_30838 - PLACE
      ?auto_30834 - HOIST
      ?auto_30835 - SURFACE
      ?auto_30836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30833 ?auto_30831 ) ( IS-CRATE ?auto_30829 ) ( not ( = ?auto_30828 ?auto_30829 ) ) ( not ( = ?auto_30827 ?auto_30828 ) ) ( not ( = ?auto_30827 ?auto_30829 ) ) ( not ( = ?auto_30832 ?auto_30831 ) ) ( HOIST-AT ?auto_30837 ?auto_30832 ) ( not ( = ?auto_30833 ?auto_30837 ) ) ( AVAILABLE ?auto_30837 ) ( SURFACE-AT ?auto_30829 ?auto_30832 ) ( ON ?auto_30829 ?auto_30830 ) ( CLEAR ?auto_30829 ) ( not ( = ?auto_30828 ?auto_30830 ) ) ( not ( = ?auto_30829 ?auto_30830 ) ) ( not ( = ?auto_30827 ?auto_30830 ) ) ( SURFACE-AT ?auto_30827 ?auto_30831 ) ( CLEAR ?auto_30827 ) ( IS-CRATE ?auto_30828 ) ( AVAILABLE ?auto_30833 ) ( not ( = ?auto_30838 ?auto_30831 ) ) ( not ( = ?auto_30832 ?auto_30838 ) ) ( HOIST-AT ?auto_30834 ?auto_30838 ) ( not ( = ?auto_30833 ?auto_30834 ) ) ( not ( = ?auto_30837 ?auto_30834 ) ) ( AVAILABLE ?auto_30834 ) ( SURFACE-AT ?auto_30828 ?auto_30838 ) ( ON ?auto_30828 ?auto_30835 ) ( CLEAR ?auto_30828 ) ( not ( = ?auto_30828 ?auto_30835 ) ) ( not ( = ?auto_30829 ?auto_30835 ) ) ( not ( = ?auto_30827 ?auto_30835 ) ) ( not ( = ?auto_30830 ?auto_30835 ) ) ( TRUCK-AT ?auto_30836 ?auto_30831 ) ( ON ?auto_30827 ?auto_30826 ) ( not ( = ?auto_30826 ?auto_30827 ) ) ( not ( = ?auto_30826 ?auto_30828 ) ) ( not ( = ?auto_30826 ?auto_30829 ) ) ( not ( = ?auto_30826 ?auto_30830 ) ) ( not ( = ?auto_30826 ?auto_30835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30827 ?auto_30828 ?auto_30829 )
      ( MAKE-3CRATE-VERIFY ?auto_30826 ?auto_30827 ?auto_30828 ?auto_30829 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30839 - SURFACE
      ?auto_30840 - SURFACE
      ?auto_30841 - SURFACE
      ?auto_30842 - SURFACE
      ?auto_30843 - SURFACE
    )
    :vars
    (
      ?auto_30847 - HOIST
      ?auto_30845 - PLACE
      ?auto_30846 - PLACE
      ?auto_30851 - HOIST
      ?auto_30844 - SURFACE
      ?auto_30852 - PLACE
      ?auto_30848 - HOIST
      ?auto_30849 - SURFACE
      ?auto_30850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30847 ?auto_30845 ) ( IS-CRATE ?auto_30843 ) ( not ( = ?auto_30842 ?auto_30843 ) ) ( not ( = ?auto_30841 ?auto_30842 ) ) ( not ( = ?auto_30841 ?auto_30843 ) ) ( not ( = ?auto_30846 ?auto_30845 ) ) ( HOIST-AT ?auto_30851 ?auto_30846 ) ( not ( = ?auto_30847 ?auto_30851 ) ) ( AVAILABLE ?auto_30851 ) ( SURFACE-AT ?auto_30843 ?auto_30846 ) ( ON ?auto_30843 ?auto_30844 ) ( CLEAR ?auto_30843 ) ( not ( = ?auto_30842 ?auto_30844 ) ) ( not ( = ?auto_30843 ?auto_30844 ) ) ( not ( = ?auto_30841 ?auto_30844 ) ) ( SURFACE-AT ?auto_30841 ?auto_30845 ) ( CLEAR ?auto_30841 ) ( IS-CRATE ?auto_30842 ) ( AVAILABLE ?auto_30847 ) ( not ( = ?auto_30852 ?auto_30845 ) ) ( not ( = ?auto_30846 ?auto_30852 ) ) ( HOIST-AT ?auto_30848 ?auto_30852 ) ( not ( = ?auto_30847 ?auto_30848 ) ) ( not ( = ?auto_30851 ?auto_30848 ) ) ( AVAILABLE ?auto_30848 ) ( SURFACE-AT ?auto_30842 ?auto_30852 ) ( ON ?auto_30842 ?auto_30849 ) ( CLEAR ?auto_30842 ) ( not ( = ?auto_30842 ?auto_30849 ) ) ( not ( = ?auto_30843 ?auto_30849 ) ) ( not ( = ?auto_30841 ?auto_30849 ) ) ( not ( = ?auto_30844 ?auto_30849 ) ) ( TRUCK-AT ?auto_30850 ?auto_30845 ) ( ON ?auto_30840 ?auto_30839 ) ( ON ?auto_30841 ?auto_30840 ) ( not ( = ?auto_30839 ?auto_30840 ) ) ( not ( = ?auto_30839 ?auto_30841 ) ) ( not ( = ?auto_30839 ?auto_30842 ) ) ( not ( = ?auto_30839 ?auto_30843 ) ) ( not ( = ?auto_30839 ?auto_30844 ) ) ( not ( = ?auto_30839 ?auto_30849 ) ) ( not ( = ?auto_30840 ?auto_30841 ) ) ( not ( = ?auto_30840 ?auto_30842 ) ) ( not ( = ?auto_30840 ?auto_30843 ) ) ( not ( = ?auto_30840 ?auto_30844 ) ) ( not ( = ?auto_30840 ?auto_30849 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30841 ?auto_30842 ?auto_30843 )
      ( MAKE-4CRATE-VERIFY ?auto_30839 ?auto_30840 ?auto_30841 ?auto_30842 ?auto_30843 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30853 - SURFACE
      ?auto_30854 - SURFACE
      ?auto_30855 - SURFACE
      ?auto_30856 - SURFACE
      ?auto_30857 - SURFACE
      ?auto_30858 - SURFACE
    )
    :vars
    (
      ?auto_30862 - HOIST
      ?auto_30860 - PLACE
      ?auto_30861 - PLACE
      ?auto_30866 - HOIST
      ?auto_30859 - SURFACE
      ?auto_30867 - PLACE
      ?auto_30863 - HOIST
      ?auto_30864 - SURFACE
      ?auto_30865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30862 ?auto_30860 ) ( IS-CRATE ?auto_30858 ) ( not ( = ?auto_30857 ?auto_30858 ) ) ( not ( = ?auto_30856 ?auto_30857 ) ) ( not ( = ?auto_30856 ?auto_30858 ) ) ( not ( = ?auto_30861 ?auto_30860 ) ) ( HOIST-AT ?auto_30866 ?auto_30861 ) ( not ( = ?auto_30862 ?auto_30866 ) ) ( AVAILABLE ?auto_30866 ) ( SURFACE-AT ?auto_30858 ?auto_30861 ) ( ON ?auto_30858 ?auto_30859 ) ( CLEAR ?auto_30858 ) ( not ( = ?auto_30857 ?auto_30859 ) ) ( not ( = ?auto_30858 ?auto_30859 ) ) ( not ( = ?auto_30856 ?auto_30859 ) ) ( SURFACE-AT ?auto_30856 ?auto_30860 ) ( CLEAR ?auto_30856 ) ( IS-CRATE ?auto_30857 ) ( AVAILABLE ?auto_30862 ) ( not ( = ?auto_30867 ?auto_30860 ) ) ( not ( = ?auto_30861 ?auto_30867 ) ) ( HOIST-AT ?auto_30863 ?auto_30867 ) ( not ( = ?auto_30862 ?auto_30863 ) ) ( not ( = ?auto_30866 ?auto_30863 ) ) ( AVAILABLE ?auto_30863 ) ( SURFACE-AT ?auto_30857 ?auto_30867 ) ( ON ?auto_30857 ?auto_30864 ) ( CLEAR ?auto_30857 ) ( not ( = ?auto_30857 ?auto_30864 ) ) ( not ( = ?auto_30858 ?auto_30864 ) ) ( not ( = ?auto_30856 ?auto_30864 ) ) ( not ( = ?auto_30859 ?auto_30864 ) ) ( TRUCK-AT ?auto_30865 ?auto_30860 ) ( ON ?auto_30854 ?auto_30853 ) ( ON ?auto_30855 ?auto_30854 ) ( ON ?auto_30856 ?auto_30855 ) ( not ( = ?auto_30853 ?auto_30854 ) ) ( not ( = ?auto_30853 ?auto_30855 ) ) ( not ( = ?auto_30853 ?auto_30856 ) ) ( not ( = ?auto_30853 ?auto_30857 ) ) ( not ( = ?auto_30853 ?auto_30858 ) ) ( not ( = ?auto_30853 ?auto_30859 ) ) ( not ( = ?auto_30853 ?auto_30864 ) ) ( not ( = ?auto_30854 ?auto_30855 ) ) ( not ( = ?auto_30854 ?auto_30856 ) ) ( not ( = ?auto_30854 ?auto_30857 ) ) ( not ( = ?auto_30854 ?auto_30858 ) ) ( not ( = ?auto_30854 ?auto_30859 ) ) ( not ( = ?auto_30854 ?auto_30864 ) ) ( not ( = ?auto_30855 ?auto_30856 ) ) ( not ( = ?auto_30855 ?auto_30857 ) ) ( not ( = ?auto_30855 ?auto_30858 ) ) ( not ( = ?auto_30855 ?auto_30859 ) ) ( not ( = ?auto_30855 ?auto_30864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30856 ?auto_30857 ?auto_30858 )
      ( MAKE-5CRATE-VERIFY ?auto_30853 ?auto_30854 ?auto_30855 ?auto_30856 ?auto_30857 ?auto_30858 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30868 - SURFACE
      ?auto_30869 - SURFACE
    )
    :vars
    (
      ?auto_30874 - HOIST
      ?auto_30872 - PLACE
      ?auto_30871 - SURFACE
      ?auto_30873 - PLACE
      ?auto_30878 - HOIST
      ?auto_30870 - SURFACE
      ?auto_30879 - PLACE
      ?auto_30875 - HOIST
      ?auto_30876 - SURFACE
      ?auto_30877 - TRUCK
      ?auto_30880 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30874 ?auto_30872 ) ( IS-CRATE ?auto_30869 ) ( not ( = ?auto_30868 ?auto_30869 ) ) ( not ( = ?auto_30871 ?auto_30868 ) ) ( not ( = ?auto_30871 ?auto_30869 ) ) ( not ( = ?auto_30873 ?auto_30872 ) ) ( HOIST-AT ?auto_30878 ?auto_30873 ) ( not ( = ?auto_30874 ?auto_30878 ) ) ( AVAILABLE ?auto_30878 ) ( SURFACE-AT ?auto_30869 ?auto_30873 ) ( ON ?auto_30869 ?auto_30870 ) ( CLEAR ?auto_30869 ) ( not ( = ?auto_30868 ?auto_30870 ) ) ( not ( = ?auto_30869 ?auto_30870 ) ) ( not ( = ?auto_30871 ?auto_30870 ) ) ( IS-CRATE ?auto_30868 ) ( not ( = ?auto_30879 ?auto_30872 ) ) ( not ( = ?auto_30873 ?auto_30879 ) ) ( HOIST-AT ?auto_30875 ?auto_30879 ) ( not ( = ?auto_30874 ?auto_30875 ) ) ( not ( = ?auto_30878 ?auto_30875 ) ) ( AVAILABLE ?auto_30875 ) ( SURFACE-AT ?auto_30868 ?auto_30879 ) ( ON ?auto_30868 ?auto_30876 ) ( CLEAR ?auto_30868 ) ( not ( = ?auto_30868 ?auto_30876 ) ) ( not ( = ?auto_30869 ?auto_30876 ) ) ( not ( = ?auto_30871 ?auto_30876 ) ) ( not ( = ?auto_30870 ?auto_30876 ) ) ( TRUCK-AT ?auto_30877 ?auto_30872 ) ( SURFACE-AT ?auto_30880 ?auto_30872 ) ( CLEAR ?auto_30880 ) ( LIFTING ?auto_30874 ?auto_30871 ) ( IS-CRATE ?auto_30871 ) ( not ( = ?auto_30880 ?auto_30871 ) ) ( not ( = ?auto_30868 ?auto_30880 ) ) ( not ( = ?auto_30869 ?auto_30880 ) ) ( not ( = ?auto_30870 ?auto_30880 ) ) ( not ( = ?auto_30876 ?auto_30880 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30880 ?auto_30871 )
      ( MAKE-2CRATE ?auto_30871 ?auto_30868 ?auto_30869 )
      ( MAKE-1CRATE-VERIFY ?auto_30868 ?auto_30869 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30881 - SURFACE
      ?auto_30882 - SURFACE
      ?auto_30883 - SURFACE
    )
    :vars
    (
      ?auto_30887 - HOIST
      ?auto_30891 - PLACE
      ?auto_30893 - PLACE
      ?auto_30890 - HOIST
      ?auto_30889 - SURFACE
      ?auto_30886 - PLACE
      ?auto_30892 - HOIST
      ?auto_30884 - SURFACE
      ?auto_30885 - TRUCK
      ?auto_30888 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30887 ?auto_30891 ) ( IS-CRATE ?auto_30883 ) ( not ( = ?auto_30882 ?auto_30883 ) ) ( not ( = ?auto_30881 ?auto_30882 ) ) ( not ( = ?auto_30881 ?auto_30883 ) ) ( not ( = ?auto_30893 ?auto_30891 ) ) ( HOIST-AT ?auto_30890 ?auto_30893 ) ( not ( = ?auto_30887 ?auto_30890 ) ) ( AVAILABLE ?auto_30890 ) ( SURFACE-AT ?auto_30883 ?auto_30893 ) ( ON ?auto_30883 ?auto_30889 ) ( CLEAR ?auto_30883 ) ( not ( = ?auto_30882 ?auto_30889 ) ) ( not ( = ?auto_30883 ?auto_30889 ) ) ( not ( = ?auto_30881 ?auto_30889 ) ) ( IS-CRATE ?auto_30882 ) ( not ( = ?auto_30886 ?auto_30891 ) ) ( not ( = ?auto_30893 ?auto_30886 ) ) ( HOIST-AT ?auto_30892 ?auto_30886 ) ( not ( = ?auto_30887 ?auto_30892 ) ) ( not ( = ?auto_30890 ?auto_30892 ) ) ( AVAILABLE ?auto_30892 ) ( SURFACE-AT ?auto_30882 ?auto_30886 ) ( ON ?auto_30882 ?auto_30884 ) ( CLEAR ?auto_30882 ) ( not ( = ?auto_30882 ?auto_30884 ) ) ( not ( = ?auto_30883 ?auto_30884 ) ) ( not ( = ?auto_30881 ?auto_30884 ) ) ( not ( = ?auto_30889 ?auto_30884 ) ) ( TRUCK-AT ?auto_30885 ?auto_30891 ) ( SURFACE-AT ?auto_30888 ?auto_30891 ) ( CLEAR ?auto_30888 ) ( LIFTING ?auto_30887 ?auto_30881 ) ( IS-CRATE ?auto_30881 ) ( not ( = ?auto_30888 ?auto_30881 ) ) ( not ( = ?auto_30882 ?auto_30888 ) ) ( not ( = ?auto_30883 ?auto_30888 ) ) ( not ( = ?auto_30889 ?auto_30888 ) ) ( not ( = ?auto_30884 ?auto_30888 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30882 ?auto_30883 )
      ( MAKE-2CRATE-VERIFY ?auto_30881 ?auto_30882 ?auto_30883 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30894 - SURFACE
      ?auto_30895 - SURFACE
      ?auto_30896 - SURFACE
      ?auto_30897 - SURFACE
    )
    :vars
    (
      ?auto_30906 - HOIST
      ?auto_30901 - PLACE
      ?auto_30905 - PLACE
      ?auto_30903 - HOIST
      ?auto_30898 - SURFACE
      ?auto_30899 - PLACE
      ?auto_30902 - HOIST
      ?auto_30904 - SURFACE
      ?auto_30900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30906 ?auto_30901 ) ( IS-CRATE ?auto_30897 ) ( not ( = ?auto_30896 ?auto_30897 ) ) ( not ( = ?auto_30895 ?auto_30896 ) ) ( not ( = ?auto_30895 ?auto_30897 ) ) ( not ( = ?auto_30905 ?auto_30901 ) ) ( HOIST-AT ?auto_30903 ?auto_30905 ) ( not ( = ?auto_30906 ?auto_30903 ) ) ( AVAILABLE ?auto_30903 ) ( SURFACE-AT ?auto_30897 ?auto_30905 ) ( ON ?auto_30897 ?auto_30898 ) ( CLEAR ?auto_30897 ) ( not ( = ?auto_30896 ?auto_30898 ) ) ( not ( = ?auto_30897 ?auto_30898 ) ) ( not ( = ?auto_30895 ?auto_30898 ) ) ( IS-CRATE ?auto_30896 ) ( not ( = ?auto_30899 ?auto_30901 ) ) ( not ( = ?auto_30905 ?auto_30899 ) ) ( HOIST-AT ?auto_30902 ?auto_30899 ) ( not ( = ?auto_30906 ?auto_30902 ) ) ( not ( = ?auto_30903 ?auto_30902 ) ) ( AVAILABLE ?auto_30902 ) ( SURFACE-AT ?auto_30896 ?auto_30899 ) ( ON ?auto_30896 ?auto_30904 ) ( CLEAR ?auto_30896 ) ( not ( = ?auto_30896 ?auto_30904 ) ) ( not ( = ?auto_30897 ?auto_30904 ) ) ( not ( = ?auto_30895 ?auto_30904 ) ) ( not ( = ?auto_30898 ?auto_30904 ) ) ( TRUCK-AT ?auto_30900 ?auto_30901 ) ( SURFACE-AT ?auto_30894 ?auto_30901 ) ( CLEAR ?auto_30894 ) ( LIFTING ?auto_30906 ?auto_30895 ) ( IS-CRATE ?auto_30895 ) ( not ( = ?auto_30894 ?auto_30895 ) ) ( not ( = ?auto_30896 ?auto_30894 ) ) ( not ( = ?auto_30897 ?auto_30894 ) ) ( not ( = ?auto_30898 ?auto_30894 ) ) ( not ( = ?auto_30904 ?auto_30894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30895 ?auto_30896 ?auto_30897 )
      ( MAKE-3CRATE-VERIFY ?auto_30894 ?auto_30895 ?auto_30896 ?auto_30897 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30907 - SURFACE
      ?auto_30908 - SURFACE
      ?auto_30909 - SURFACE
      ?auto_30910 - SURFACE
      ?auto_30911 - SURFACE
    )
    :vars
    (
      ?auto_30920 - HOIST
      ?auto_30915 - PLACE
      ?auto_30919 - PLACE
      ?auto_30917 - HOIST
      ?auto_30912 - SURFACE
      ?auto_30913 - PLACE
      ?auto_30916 - HOIST
      ?auto_30918 - SURFACE
      ?auto_30914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30920 ?auto_30915 ) ( IS-CRATE ?auto_30911 ) ( not ( = ?auto_30910 ?auto_30911 ) ) ( not ( = ?auto_30909 ?auto_30910 ) ) ( not ( = ?auto_30909 ?auto_30911 ) ) ( not ( = ?auto_30919 ?auto_30915 ) ) ( HOIST-AT ?auto_30917 ?auto_30919 ) ( not ( = ?auto_30920 ?auto_30917 ) ) ( AVAILABLE ?auto_30917 ) ( SURFACE-AT ?auto_30911 ?auto_30919 ) ( ON ?auto_30911 ?auto_30912 ) ( CLEAR ?auto_30911 ) ( not ( = ?auto_30910 ?auto_30912 ) ) ( not ( = ?auto_30911 ?auto_30912 ) ) ( not ( = ?auto_30909 ?auto_30912 ) ) ( IS-CRATE ?auto_30910 ) ( not ( = ?auto_30913 ?auto_30915 ) ) ( not ( = ?auto_30919 ?auto_30913 ) ) ( HOIST-AT ?auto_30916 ?auto_30913 ) ( not ( = ?auto_30920 ?auto_30916 ) ) ( not ( = ?auto_30917 ?auto_30916 ) ) ( AVAILABLE ?auto_30916 ) ( SURFACE-AT ?auto_30910 ?auto_30913 ) ( ON ?auto_30910 ?auto_30918 ) ( CLEAR ?auto_30910 ) ( not ( = ?auto_30910 ?auto_30918 ) ) ( not ( = ?auto_30911 ?auto_30918 ) ) ( not ( = ?auto_30909 ?auto_30918 ) ) ( not ( = ?auto_30912 ?auto_30918 ) ) ( TRUCK-AT ?auto_30914 ?auto_30915 ) ( SURFACE-AT ?auto_30908 ?auto_30915 ) ( CLEAR ?auto_30908 ) ( LIFTING ?auto_30920 ?auto_30909 ) ( IS-CRATE ?auto_30909 ) ( not ( = ?auto_30908 ?auto_30909 ) ) ( not ( = ?auto_30910 ?auto_30908 ) ) ( not ( = ?auto_30911 ?auto_30908 ) ) ( not ( = ?auto_30912 ?auto_30908 ) ) ( not ( = ?auto_30918 ?auto_30908 ) ) ( ON ?auto_30908 ?auto_30907 ) ( not ( = ?auto_30907 ?auto_30908 ) ) ( not ( = ?auto_30907 ?auto_30909 ) ) ( not ( = ?auto_30907 ?auto_30910 ) ) ( not ( = ?auto_30907 ?auto_30911 ) ) ( not ( = ?auto_30907 ?auto_30912 ) ) ( not ( = ?auto_30907 ?auto_30918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30909 ?auto_30910 ?auto_30911 )
      ( MAKE-4CRATE-VERIFY ?auto_30907 ?auto_30908 ?auto_30909 ?auto_30910 ?auto_30911 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30921 - SURFACE
      ?auto_30922 - SURFACE
      ?auto_30923 - SURFACE
      ?auto_30924 - SURFACE
      ?auto_30925 - SURFACE
      ?auto_30926 - SURFACE
    )
    :vars
    (
      ?auto_30935 - HOIST
      ?auto_30930 - PLACE
      ?auto_30934 - PLACE
      ?auto_30932 - HOIST
      ?auto_30927 - SURFACE
      ?auto_30928 - PLACE
      ?auto_30931 - HOIST
      ?auto_30933 - SURFACE
      ?auto_30929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30935 ?auto_30930 ) ( IS-CRATE ?auto_30926 ) ( not ( = ?auto_30925 ?auto_30926 ) ) ( not ( = ?auto_30924 ?auto_30925 ) ) ( not ( = ?auto_30924 ?auto_30926 ) ) ( not ( = ?auto_30934 ?auto_30930 ) ) ( HOIST-AT ?auto_30932 ?auto_30934 ) ( not ( = ?auto_30935 ?auto_30932 ) ) ( AVAILABLE ?auto_30932 ) ( SURFACE-AT ?auto_30926 ?auto_30934 ) ( ON ?auto_30926 ?auto_30927 ) ( CLEAR ?auto_30926 ) ( not ( = ?auto_30925 ?auto_30927 ) ) ( not ( = ?auto_30926 ?auto_30927 ) ) ( not ( = ?auto_30924 ?auto_30927 ) ) ( IS-CRATE ?auto_30925 ) ( not ( = ?auto_30928 ?auto_30930 ) ) ( not ( = ?auto_30934 ?auto_30928 ) ) ( HOIST-AT ?auto_30931 ?auto_30928 ) ( not ( = ?auto_30935 ?auto_30931 ) ) ( not ( = ?auto_30932 ?auto_30931 ) ) ( AVAILABLE ?auto_30931 ) ( SURFACE-AT ?auto_30925 ?auto_30928 ) ( ON ?auto_30925 ?auto_30933 ) ( CLEAR ?auto_30925 ) ( not ( = ?auto_30925 ?auto_30933 ) ) ( not ( = ?auto_30926 ?auto_30933 ) ) ( not ( = ?auto_30924 ?auto_30933 ) ) ( not ( = ?auto_30927 ?auto_30933 ) ) ( TRUCK-AT ?auto_30929 ?auto_30930 ) ( SURFACE-AT ?auto_30923 ?auto_30930 ) ( CLEAR ?auto_30923 ) ( LIFTING ?auto_30935 ?auto_30924 ) ( IS-CRATE ?auto_30924 ) ( not ( = ?auto_30923 ?auto_30924 ) ) ( not ( = ?auto_30925 ?auto_30923 ) ) ( not ( = ?auto_30926 ?auto_30923 ) ) ( not ( = ?auto_30927 ?auto_30923 ) ) ( not ( = ?auto_30933 ?auto_30923 ) ) ( ON ?auto_30922 ?auto_30921 ) ( ON ?auto_30923 ?auto_30922 ) ( not ( = ?auto_30921 ?auto_30922 ) ) ( not ( = ?auto_30921 ?auto_30923 ) ) ( not ( = ?auto_30921 ?auto_30924 ) ) ( not ( = ?auto_30921 ?auto_30925 ) ) ( not ( = ?auto_30921 ?auto_30926 ) ) ( not ( = ?auto_30921 ?auto_30927 ) ) ( not ( = ?auto_30921 ?auto_30933 ) ) ( not ( = ?auto_30922 ?auto_30923 ) ) ( not ( = ?auto_30922 ?auto_30924 ) ) ( not ( = ?auto_30922 ?auto_30925 ) ) ( not ( = ?auto_30922 ?auto_30926 ) ) ( not ( = ?auto_30922 ?auto_30927 ) ) ( not ( = ?auto_30922 ?auto_30933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30924 ?auto_30925 ?auto_30926 )
      ( MAKE-5CRATE-VERIFY ?auto_30921 ?auto_30922 ?auto_30923 ?auto_30924 ?auto_30925 ?auto_30926 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30936 - SURFACE
      ?auto_30937 - SURFACE
    )
    :vars
    (
      ?auto_30948 - HOIST
      ?auto_30942 - PLACE
      ?auto_30940 - SURFACE
      ?auto_30947 - PLACE
      ?auto_30944 - HOIST
      ?auto_30938 - SURFACE
      ?auto_30939 - PLACE
      ?auto_30943 - HOIST
      ?auto_30946 - SURFACE
      ?auto_30941 - TRUCK
      ?auto_30945 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30948 ?auto_30942 ) ( IS-CRATE ?auto_30937 ) ( not ( = ?auto_30936 ?auto_30937 ) ) ( not ( = ?auto_30940 ?auto_30936 ) ) ( not ( = ?auto_30940 ?auto_30937 ) ) ( not ( = ?auto_30947 ?auto_30942 ) ) ( HOIST-AT ?auto_30944 ?auto_30947 ) ( not ( = ?auto_30948 ?auto_30944 ) ) ( AVAILABLE ?auto_30944 ) ( SURFACE-AT ?auto_30937 ?auto_30947 ) ( ON ?auto_30937 ?auto_30938 ) ( CLEAR ?auto_30937 ) ( not ( = ?auto_30936 ?auto_30938 ) ) ( not ( = ?auto_30937 ?auto_30938 ) ) ( not ( = ?auto_30940 ?auto_30938 ) ) ( IS-CRATE ?auto_30936 ) ( not ( = ?auto_30939 ?auto_30942 ) ) ( not ( = ?auto_30947 ?auto_30939 ) ) ( HOIST-AT ?auto_30943 ?auto_30939 ) ( not ( = ?auto_30948 ?auto_30943 ) ) ( not ( = ?auto_30944 ?auto_30943 ) ) ( AVAILABLE ?auto_30943 ) ( SURFACE-AT ?auto_30936 ?auto_30939 ) ( ON ?auto_30936 ?auto_30946 ) ( CLEAR ?auto_30936 ) ( not ( = ?auto_30936 ?auto_30946 ) ) ( not ( = ?auto_30937 ?auto_30946 ) ) ( not ( = ?auto_30940 ?auto_30946 ) ) ( not ( = ?auto_30938 ?auto_30946 ) ) ( TRUCK-AT ?auto_30941 ?auto_30942 ) ( SURFACE-AT ?auto_30945 ?auto_30942 ) ( CLEAR ?auto_30945 ) ( IS-CRATE ?auto_30940 ) ( not ( = ?auto_30945 ?auto_30940 ) ) ( not ( = ?auto_30936 ?auto_30945 ) ) ( not ( = ?auto_30937 ?auto_30945 ) ) ( not ( = ?auto_30938 ?auto_30945 ) ) ( not ( = ?auto_30946 ?auto_30945 ) ) ( AVAILABLE ?auto_30948 ) ( IN ?auto_30940 ?auto_30941 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30948 ?auto_30940 ?auto_30941 ?auto_30942 )
      ( MAKE-2CRATE ?auto_30940 ?auto_30936 ?auto_30937 )
      ( MAKE-1CRATE-VERIFY ?auto_30936 ?auto_30937 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30949 - SURFACE
      ?auto_30950 - SURFACE
      ?auto_30951 - SURFACE
    )
    :vars
    (
      ?auto_30952 - HOIST
      ?auto_30956 - PLACE
      ?auto_30960 - PLACE
      ?auto_30957 - HOIST
      ?auto_30953 - SURFACE
      ?auto_30955 - PLACE
      ?auto_30961 - HOIST
      ?auto_30954 - SURFACE
      ?auto_30958 - TRUCK
      ?auto_30959 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30952 ?auto_30956 ) ( IS-CRATE ?auto_30951 ) ( not ( = ?auto_30950 ?auto_30951 ) ) ( not ( = ?auto_30949 ?auto_30950 ) ) ( not ( = ?auto_30949 ?auto_30951 ) ) ( not ( = ?auto_30960 ?auto_30956 ) ) ( HOIST-AT ?auto_30957 ?auto_30960 ) ( not ( = ?auto_30952 ?auto_30957 ) ) ( AVAILABLE ?auto_30957 ) ( SURFACE-AT ?auto_30951 ?auto_30960 ) ( ON ?auto_30951 ?auto_30953 ) ( CLEAR ?auto_30951 ) ( not ( = ?auto_30950 ?auto_30953 ) ) ( not ( = ?auto_30951 ?auto_30953 ) ) ( not ( = ?auto_30949 ?auto_30953 ) ) ( IS-CRATE ?auto_30950 ) ( not ( = ?auto_30955 ?auto_30956 ) ) ( not ( = ?auto_30960 ?auto_30955 ) ) ( HOIST-AT ?auto_30961 ?auto_30955 ) ( not ( = ?auto_30952 ?auto_30961 ) ) ( not ( = ?auto_30957 ?auto_30961 ) ) ( AVAILABLE ?auto_30961 ) ( SURFACE-AT ?auto_30950 ?auto_30955 ) ( ON ?auto_30950 ?auto_30954 ) ( CLEAR ?auto_30950 ) ( not ( = ?auto_30950 ?auto_30954 ) ) ( not ( = ?auto_30951 ?auto_30954 ) ) ( not ( = ?auto_30949 ?auto_30954 ) ) ( not ( = ?auto_30953 ?auto_30954 ) ) ( TRUCK-AT ?auto_30958 ?auto_30956 ) ( SURFACE-AT ?auto_30959 ?auto_30956 ) ( CLEAR ?auto_30959 ) ( IS-CRATE ?auto_30949 ) ( not ( = ?auto_30959 ?auto_30949 ) ) ( not ( = ?auto_30950 ?auto_30959 ) ) ( not ( = ?auto_30951 ?auto_30959 ) ) ( not ( = ?auto_30953 ?auto_30959 ) ) ( not ( = ?auto_30954 ?auto_30959 ) ) ( AVAILABLE ?auto_30952 ) ( IN ?auto_30949 ?auto_30958 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30950 ?auto_30951 )
      ( MAKE-2CRATE-VERIFY ?auto_30949 ?auto_30950 ?auto_30951 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30962 - SURFACE
      ?auto_30963 - SURFACE
      ?auto_30964 - SURFACE
      ?auto_30965 - SURFACE
    )
    :vars
    (
      ?auto_30967 - HOIST
      ?auto_30972 - PLACE
      ?auto_30974 - PLACE
      ?auto_30969 - HOIST
      ?auto_30968 - SURFACE
      ?auto_30966 - PLACE
      ?auto_30970 - HOIST
      ?auto_30971 - SURFACE
      ?auto_30973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30967 ?auto_30972 ) ( IS-CRATE ?auto_30965 ) ( not ( = ?auto_30964 ?auto_30965 ) ) ( not ( = ?auto_30963 ?auto_30964 ) ) ( not ( = ?auto_30963 ?auto_30965 ) ) ( not ( = ?auto_30974 ?auto_30972 ) ) ( HOIST-AT ?auto_30969 ?auto_30974 ) ( not ( = ?auto_30967 ?auto_30969 ) ) ( AVAILABLE ?auto_30969 ) ( SURFACE-AT ?auto_30965 ?auto_30974 ) ( ON ?auto_30965 ?auto_30968 ) ( CLEAR ?auto_30965 ) ( not ( = ?auto_30964 ?auto_30968 ) ) ( not ( = ?auto_30965 ?auto_30968 ) ) ( not ( = ?auto_30963 ?auto_30968 ) ) ( IS-CRATE ?auto_30964 ) ( not ( = ?auto_30966 ?auto_30972 ) ) ( not ( = ?auto_30974 ?auto_30966 ) ) ( HOIST-AT ?auto_30970 ?auto_30966 ) ( not ( = ?auto_30967 ?auto_30970 ) ) ( not ( = ?auto_30969 ?auto_30970 ) ) ( AVAILABLE ?auto_30970 ) ( SURFACE-AT ?auto_30964 ?auto_30966 ) ( ON ?auto_30964 ?auto_30971 ) ( CLEAR ?auto_30964 ) ( not ( = ?auto_30964 ?auto_30971 ) ) ( not ( = ?auto_30965 ?auto_30971 ) ) ( not ( = ?auto_30963 ?auto_30971 ) ) ( not ( = ?auto_30968 ?auto_30971 ) ) ( TRUCK-AT ?auto_30973 ?auto_30972 ) ( SURFACE-AT ?auto_30962 ?auto_30972 ) ( CLEAR ?auto_30962 ) ( IS-CRATE ?auto_30963 ) ( not ( = ?auto_30962 ?auto_30963 ) ) ( not ( = ?auto_30964 ?auto_30962 ) ) ( not ( = ?auto_30965 ?auto_30962 ) ) ( not ( = ?auto_30968 ?auto_30962 ) ) ( not ( = ?auto_30971 ?auto_30962 ) ) ( AVAILABLE ?auto_30967 ) ( IN ?auto_30963 ?auto_30973 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30963 ?auto_30964 ?auto_30965 )
      ( MAKE-3CRATE-VERIFY ?auto_30962 ?auto_30963 ?auto_30964 ?auto_30965 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30975 - SURFACE
      ?auto_30976 - SURFACE
      ?auto_30977 - SURFACE
      ?auto_30978 - SURFACE
      ?auto_30979 - SURFACE
    )
    :vars
    (
      ?auto_30981 - HOIST
      ?auto_30986 - PLACE
      ?auto_30988 - PLACE
      ?auto_30983 - HOIST
      ?auto_30982 - SURFACE
      ?auto_30980 - PLACE
      ?auto_30984 - HOIST
      ?auto_30985 - SURFACE
      ?auto_30987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30981 ?auto_30986 ) ( IS-CRATE ?auto_30979 ) ( not ( = ?auto_30978 ?auto_30979 ) ) ( not ( = ?auto_30977 ?auto_30978 ) ) ( not ( = ?auto_30977 ?auto_30979 ) ) ( not ( = ?auto_30988 ?auto_30986 ) ) ( HOIST-AT ?auto_30983 ?auto_30988 ) ( not ( = ?auto_30981 ?auto_30983 ) ) ( AVAILABLE ?auto_30983 ) ( SURFACE-AT ?auto_30979 ?auto_30988 ) ( ON ?auto_30979 ?auto_30982 ) ( CLEAR ?auto_30979 ) ( not ( = ?auto_30978 ?auto_30982 ) ) ( not ( = ?auto_30979 ?auto_30982 ) ) ( not ( = ?auto_30977 ?auto_30982 ) ) ( IS-CRATE ?auto_30978 ) ( not ( = ?auto_30980 ?auto_30986 ) ) ( not ( = ?auto_30988 ?auto_30980 ) ) ( HOIST-AT ?auto_30984 ?auto_30980 ) ( not ( = ?auto_30981 ?auto_30984 ) ) ( not ( = ?auto_30983 ?auto_30984 ) ) ( AVAILABLE ?auto_30984 ) ( SURFACE-AT ?auto_30978 ?auto_30980 ) ( ON ?auto_30978 ?auto_30985 ) ( CLEAR ?auto_30978 ) ( not ( = ?auto_30978 ?auto_30985 ) ) ( not ( = ?auto_30979 ?auto_30985 ) ) ( not ( = ?auto_30977 ?auto_30985 ) ) ( not ( = ?auto_30982 ?auto_30985 ) ) ( TRUCK-AT ?auto_30987 ?auto_30986 ) ( SURFACE-AT ?auto_30976 ?auto_30986 ) ( CLEAR ?auto_30976 ) ( IS-CRATE ?auto_30977 ) ( not ( = ?auto_30976 ?auto_30977 ) ) ( not ( = ?auto_30978 ?auto_30976 ) ) ( not ( = ?auto_30979 ?auto_30976 ) ) ( not ( = ?auto_30982 ?auto_30976 ) ) ( not ( = ?auto_30985 ?auto_30976 ) ) ( AVAILABLE ?auto_30981 ) ( IN ?auto_30977 ?auto_30987 ) ( ON ?auto_30976 ?auto_30975 ) ( not ( = ?auto_30975 ?auto_30976 ) ) ( not ( = ?auto_30975 ?auto_30977 ) ) ( not ( = ?auto_30975 ?auto_30978 ) ) ( not ( = ?auto_30975 ?auto_30979 ) ) ( not ( = ?auto_30975 ?auto_30982 ) ) ( not ( = ?auto_30975 ?auto_30985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30977 ?auto_30978 ?auto_30979 )
      ( MAKE-4CRATE-VERIFY ?auto_30975 ?auto_30976 ?auto_30977 ?auto_30978 ?auto_30979 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30989 - SURFACE
      ?auto_30990 - SURFACE
      ?auto_30991 - SURFACE
      ?auto_30992 - SURFACE
      ?auto_30993 - SURFACE
      ?auto_30994 - SURFACE
    )
    :vars
    (
      ?auto_30996 - HOIST
      ?auto_31001 - PLACE
      ?auto_31003 - PLACE
      ?auto_30998 - HOIST
      ?auto_30997 - SURFACE
      ?auto_30995 - PLACE
      ?auto_30999 - HOIST
      ?auto_31000 - SURFACE
      ?auto_31002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30996 ?auto_31001 ) ( IS-CRATE ?auto_30994 ) ( not ( = ?auto_30993 ?auto_30994 ) ) ( not ( = ?auto_30992 ?auto_30993 ) ) ( not ( = ?auto_30992 ?auto_30994 ) ) ( not ( = ?auto_31003 ?auto_31001 ) ) ( HOIST-AT ?auto_30998 ?auto_31003 ) ( not ( = ?auto_30996 ?auto_30998 ) ) ( AVAILABLE ?auto_30998 ) ( SURFACE-AT ?auto_30994 ?auto_31003 ) ( ON ?auto_30994 ?auto_30997 ) ( CLEAR ?auto_30994 ) ( not ( = ?auto_30993 ?auto_30997 ) ) ( not ( = ?auto_30994 ?auto_30997 ) ) ( not ( = ?auto_30992 ?auto_30997 ) ) ( IS-CRATE ?auto_30993 ) ( not ( = ?auto_30995 ?auto_31001 ) ) ( not ( = ?auto_31003 ?auto_30995 ) ) ( HOIST-AT ?auto_30999 ?auto_30995 ) ( not ( = ?auto_30996 ?auto_30999 ) ) ( not ( = ?auto_30998 ?auto_30999 ) ) ( AVAILABLE ?auto_30999 ) ( SURFACE-AT ?auto_30993 ?auto_30995 ) ( ON ?auto_30993 ?auto_31000 ) ( CLEAR ?auto_30993 ) ( not ( = ?auto_30993 ?auto_31000 ) ) ( not ( = ?auto_30994 ?auto_31000 ) ) ( not ( = ?auto_30992 ?auto_31000 ) ) ( not ( = ?auto_30997 ?auto_31000 ) ) ( TRUCK-AT ?auto_31002 ?auto_31001 ) ( SURFACE-AT ?auto_30991 ?auto_31001 ) ( CLEAR ?auto_30991 ) ( IS-CRATE ?auto_30992 ) ( not ( = ?auto_30991 ?auto_30992 ) ) ( not ( = ?auto_30993 ?auto_30991 ) ) ( not ( = ?auto_30994 ?auto_30991 ) ) ( not ( = ?auto_30997 ?auto_30991 ) ) ( not ( = ?auto_31000 ?auto_30991 ) ) ( AVAILABLE ?auto_30996 ) ( IN ?auto_30992 ?auto_31002 ) ( ON ?auto_30990 ?auto_30989 ) ( ON ?auto_30991 ?auto_30990 ) ( not ( = ?auto_30989 ?auto_30990 ) ) ( not ( = ?auto_30989 ?auto_30991 ) ) ( not ( = ?auto_30989 ?auto_30992 ) ) ( not ( = ?auto_30989 ?auto_30993 ) ) ( not ( = ?auto_30989 ?auto_30994 ) ) ( not ( = ?auto_30989 ?auto_30997 ) ) ( not ( = ?auto_30989 ?auto_31000 ) ) ( not ( = ?auto_30990 ?auto_30991 ) ) ( not ( = ?auto_30990 ?auto_30992 ) ) ( not ( = ?auto_30990 ?auto_30993 ) ) ( not ( = ?auto_30990 ?auto_30994 ) ) ( not ( = ?auto_30990 ?auto_30997 ) ) ( not ( = ?auto_30990 ?auto_31000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30992 ?auto_30993 ?auto_30994 )
      ( MAKE-5CRATE-VERIFY ?auto_30989 ?auto_30990 ?auto_30991 ?auto_30992 ?auto_30993 ?auto_30994 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31004 - SURFACE
      ?auto_31005 - SURFACE
    )
    :vars
    (
      ?auto_31009 - HOIST
      ?auto_31014 - PLACE
      ?auto_31006 - SURFACE
      ?auto_31016 - PLACE
      ?auto_31011 - HOIST
      ?auto_31010 - SURFACE
      ?auto_31007 - PLACE
      ?auto_31012 - HOIST
      ?auto_31013 - SURFACE
      ?auto_31008 - SURFACE
      ?auto_31015 - TRUCK
      ?auto_31017 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31009 ?auto_31014 ) ( IS-CRATE ?auto_31005 ) ( not ( = ?auto_31004 ?auto_31005 ) ) ( not ( = ?auto_31006 ?auto_31004 ) ) ( not ( = ?auto_31006 ?auto_31005 ) ) ( not ( = ?auto_31016 ?auto_31014 ) ) ( HOIST-AT ?auto_31011 ?auto_31016 ) ( not ( = ?auto_31009 ?auto_31011 ) ) ( AVAILABLE ?auto_31011 ) ( SURFACE-AT ?auto_31005 ?auto_31016 ) ( ON ?auto_31005 ?auto_31010 ) ( CLEAR ?auto_31005 ) ( not ( = ?auto_31004 ?auto_31010 ) ) ( not ( = ?auto_31005 ?auto_31010 ) ) ( not ( = ?auto_31006 ?auto_31010 ) ) ( IS-CRATE ?auto_31004 ) ( not ( = ?auto_31007 ?auto_31014 ) ) ( not ( = ?auto_31016 ?auto_31007 ) ) ( HOIST-AT ?auto_31012 ?auto_31007 ) ( not ( = ?auto_31009 ?auto_31012 ) ) ( not ( = ?auto_31011 ?auto_31012 ) ) ( AVAILABLE ?auto_31012 ) ( SURFACE-AT ?auto_31004 ?auto_31007 ) ( ON ?auto_31004 ?auto_31013 ) ( CLEAR ?auto_31004 ) ( not ( = ?auto_31004 ?auto_31013 ) ) ( not ( = ?auto_31005 ?auto_31013 ) ) ( not ( = ?auto_31006 ?auto_31013 ) ) ( not ( = ?auto_31010 ?auto_31013 ) ) ( SURFACE-AT ?auto_31008 ?auto_31014 ) ( CLEAR ?auto_31008 ) ( IS-CRATE ?auto_31006 ) ( not ( = ?auto_31008 ?auto_31006 ) ) ( not ( = ?auto_31004 ?auto_31008 ) ) ( not ( = ?auto_31005 ?auto_31008 ) ) ( not ( = ?auto_31010 ?auto_31008 ) ) ( not ( = ?auto_31013 ?auto_31008 ) ) ( AVAILABLE ?auto_31009 ) ( IN ?auto_31006 ?auto_31015 ) ( TRUCK-AT ?auto_31015 ?auto_31017 ) ( not ( = ?auto_31017 ?auto_31014 ) ) ( not ( = ?auto_31016 ?auto_31017 ) ) ( not ( = ?auto_31007 ?auto_31017 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_31015 ?auto_31017 ?auto_31014 )
      ( MAKE-2CRATE ?auto_31006 ?auto_31004 ?auto_31005 )
      ( MAKE-1CRATE-VERIFY ?auto_31004 ?auto_31005 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31018 - SURFACE
      ?auto_31019 - SURFACE
      ?auto_31020 - SURFACE
    )
    :vars
    (
      ?auto_31031 - HOIST
      ?auto_31030 - PLACE
      ?auto_31023 - PLACE
      ?auto_31025 - HOIST
      ?auto_31026 - SURFACE
      ?auto_31027 - PLACE
      ?auto_31021 - HOIST
      ?auto_31022 - SURFACE
      ?auto_31028 - SURFACE
      ?auto_31024 - TRUCK
      ?auto_31029 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31031 ?auto_31030 ) ( IS-CRATE ?auto_31020 ) ( not ( = ?auto_31019 ?auto_31020 ) ) ( not ( = ?auto_31018 ?auto_31019 ) ) ( not ( = ?auto_31018 ?auto_31020 ) ) ( not ( = ?auto_31023 ?auto_31030 ) ) ( HOIST-AT ?auto_31025 ?auto_31023 ) ( not ( = ?auto_31031 ?auto_31025 ) ) ( AVAILABLE ?auto_31025 ) ( SURFACE-AT ?auto_31020 ?auto_31023 ) ( ON ?auto_31020 ?auto_31026 ) ( CLEAR ?auto_31020 ) ( not ( = ?auto_31019 ?auto_31026 ) ) ( not ( = ?auto_31020 ?auto_31026 ) ) ( not ( = ?auto_31018 ?auto_31026 ) ) ( IS-CRATE ?auto_31019 ) ( not ( = ?auto_31027 ?auto_31030 ) ) ( not ( = ?auto_31023 ?auto_31027 ) ) ( HOIST-AT ?auto_31021 ?auto_31027 ) ( not ( = ?auto_31031 ?auto_31021 ) ) ( not ( = ?auto_31025 ?auto_31021 ) ) ( AVAILABLE ?auto_31021 ) ( SURFACE-AT ?auto_31019 ?auto_31027 ) ( ON ?auto_31019 ?auto_31022 ) ( CLEAR ?auto_31019 ) ( not ( = ?auto_31019 ?auto_31022 ) ) ( not ( = ?auto_31020 ?auto_31022 ) ) ( not ( = ?auto_31018 ?auto_31022 ) ) ( not ( = ?auto_31026 ?auto_31022 ) ) ( SURFACE-AT ?auto_31028 ?auto_31030 ) ( CLEAR ?auto_31028 ) ( IS-CRATE ?auto_31018 ) ( not ( = ?auto_31028 ?auto_31018 ) ) ( not ( = ?auto_31019 ?auto_31028 ) ) ( not ( = ?auto_31020 ?auto_31028 ) ) ( not ( = ?auto_31026 ?auto_31028 ) ) ( not ( = ?auto_31022 ?auto_31028 ) ) ( AVAILABLE ?auto_31031 ) ( IN ?auto_31018 ?auto_31024 ) ( TRUCK-AT ?auto_31024 ?auto_31029 ) ( not ( = ?auto_31029 ?auto_31030 ) ) ( not ( = ?auto_31023 ?auto_31029 ) ) ( not ( = ?auto_31027 ?auto_31029 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31019 ?auto_31020 )
      ( MAKE-2CRATE-VERIFY ?auto_31018 ?auto_31019 ?auto_31020 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31032 - SURFACE
      ?auto_31033 - SURFACE
      ?auto_31034 - SURFACE
      ?auto_31035 - SURFACE
    )
    :vars
    (
      ?auto_31039 - HOIST
      ?auto_31044 - PLACE
      ?auto_31036 - PLACE
      ?auto_31037 - HOIST
      ?auto_31043 - SURFACE
      ?auto_31040 - PLACE
      ?auto_31042 - HOIST
      ?auto_31041 - SURFACE
      ?auto_31045 - TRUCK
      ?auto_31038 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31039 ?auto_31044 ) ( IS-CRATE ?auto_31035 ) ( not ( = ?auto_31034 ?auto_31035 ) ) ( not ( = ?auto_31033 ?auto_31034 ) ) ( not ( = ?auto_31033 ?auto_31035 ) ) ( not ( = ?auto_31036 ?auto_31044 ) ) ( HOIST-AT ?auto_31037 ?auto_31036 ) ( not ( = ?auto_31039 ?auto_31037 ) ) ( AVAILABLE ?auto_31037 ) ( SURFACE-AT ?auto_31035 ?auto_31036 ) ( ON ?auto_31035 ?auto_31043 ) ( CLEAR ?auto_31035 ) ( not ( = ?auto_31034 ?auto_31043 ) ) ( not ( = ?auto_31035 ?auto_31043 ) ) ( not ( = ?auto_31033 ?auto_31043 ) ) ( IS-CRATE ?auto_31034 ) ( not ( = ?auto_31040 ?auto_31044 ) ) ( not ( = ?auto_31036 ?auto_31040 ) ) ( HOIST-AT ?auto_31042 ?auto_31040 ) ( not ( = ?auto_31039 ?auto_31042 ) ) ( not ( = ?auto_31037 ?auto_31042 ) ) ( AVAILABLE ?auto_31042 ) ( SURFACE-AT ?auto_31034 ?auto_31040 ) ( ON ?auto_31034 ?auto_31041 ) ( CLEAR ?auto_31034 ) ( not ( = ?auto_31034 ?auto_31041 ) ) ( not ( = ?auto_31035 ?auto_31041 ) ) ( not ( = ?auto_31033 ?auto_31041 ) ) ( not ( = ?auto_31043 ?auto_31041 ) ) ( SURFACE-AT ?auto_31032 ?auto_31044 ) ( CLEAR ?auto_31032 ) ( IS-CRATE ?auto_31033 ) ( not ( = ?auto_31032 ?auto_31033 ) ) ( not ( = ?auto_31034 ?auto_31032 ) ) ( not ( = ?auto_31035 ?auto_31032 ) ) ( not ( = ?auto_31043 ?auto_31032 ) ) ( not ( = ?auto_31041 ?auto_31032 ) ) ( AVAILABLE ?auto_31039 ) ( IN ?auto_31033 ?auto_31045 ) ( TRUCK-AT ?auto_31045 ?auto_31038 ) ( not ( = ?auto_31038 ?auto_31044 ) ) ( not ( = ?auto_31036 ?auto_31038 ) ) ( not ( = ?auto_31040 ?auto_31038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31033 ?auto_31034 ?auto_31035 )
      ( MAKE-3CRATE-VERIFY ?auto_31032 ?auto_31033 ?auto_31034 ?auto_31035 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31046 - SURFACE
      ?auto_31047 - SURFACE
      ?auto_31048 - SURFACE
      ?auto_31049 - SURFACE
      ?auto_31050 - SURFACE
    )
    :vars
    (
      ?auto_31054 - HOIST
      ?auto_31059 - PLACE
      ?auto_31051 - PLACE
      ?auto_31052 - HOIST
      ?auto_31058 - SURFACE
      ?auto_31055 - PLACE
      ?auto_31057 - HOIST
      ?auto_31056 - SURFACE
      ?auto_31060 - TRUCK
      ?auto_31053 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31054 ?auto_31059 ) ( IS-CRATE ?auto_31050 ) ( not ( = ?auto_31049 ?auto_31050 ) ) ( not ( = ?auto_31048 ?auto_31049 ) ) ( not ( = ?auto_31048 ?auto_31050 ) ) ( not ( = ?auto_31051 ?auto_31059 ) ) ( HOIST-AT ?auto_31052 ?auto_31051 ) ( not ( = ?auto_31054 ?auto_31052 ) ) ( AVAILABLE ?auto_31052 ) ( SURFACE-AT ?auto_31050 ?auto_31051 ) ( ON ?auto_31050 ?auto_31058 ) ( CLEAR ?auto_31050 ) ( not ( = ?auto_31049 ?auto_31058 ) ) ( not ( = ?auto_31050 ?auto_31058 ) ) ( not ( = ?auto_31048 ?auto_31058 ) ) ( IS-CRATE ?auto_31049 ) ( not ( = ?auto_31055 ?auto_31059 ) ) ( not ( = ?auto_31051 ?auto_31055 ) ) ( HOIST-AT ?auto_31057 ?auto_31055 ) ( not ( = ?auto_31054 ?auto_31057 ) ) ( not ( = ?auto_31052 ?auto_31057 ) ) ( AVAILABLE ?auto_31057 ) ( SURFACE-AT ?auto_31049 ?auto_31055 ) ( ON ?auto_31049 ?auto_31056 ) ( CLEAR ?auto_31049 ) ( not ( = ?auto_31049 ?auto_31056 ) ) ( not ( = ?auto_31050 ?auto_31056 ) ) ( not ( = ?auto_31048 ?auto_31056 ) ) ( not ( = ?auto_31058 ?auto_31056 ) ) ( SURFACE-AT ?auto_31047 ?auto_31059 ) ( CLEAR ?auto_31047 ) ( IS-CRATE ?auto_31048 ) ( not ( = ?auto_31047 ?auto_31048 ) ) ( not ( = ?auto_31049 ?auto_31047 ) ) ( not ( = ?auto_31050 ?auto_31047 ) ) ( not ( = ?auto_31058 ?auto_31047 ) ) ( not ( = ?auto_31056 ?auto_31047 ) ) ( AVAILABLE ?auto_31054 ) ( IN ?auto_31048 ?auto_31060 ) ( TRUCK-AT ?auto_31060 ?auto_31053 ) ( not ( = ?auto_31053 ?auto_31059 ) ) ( not ( = ?auto_31051 ?auto_31053 ) ) ( not ( = ?auto_31055 ?auto_31053 ) ) ( ON ?auto_31047 ?auto_31046 ) ( not ( = ?auto_31046 ?auto_31047 ) ) ( not ( = ?auto_31046 ?auto_31048 ) ) ( not ( = ?auto_31046 ?auto_31049 ) ) ( not ( = ?auto_31046 ?auto_31050 ) ) ( not ( = ?auto_31046 ?auto_31058 ) ) ( not ( = ?auto_31046 ?auto_31056 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31048 ?auto_31049 ?auto_31050 )
      ( MAKE-4CRATE-VERIFY ?auto_31046 ?auto_31047 ?auto_31048 ?auto_31049 ?auto_31050 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31061 - SURFACE
      ?auto_31062 - SURFACE
      ?auto_31063 - SURFACE
      ?auto_31064 - SURFACE
      ?auto_31065 - SURFACE
      ?auto_31066 - SURFACE
    )
    :vars
    (
      ?auto_31070 - HOIST
      ?auto_31075 - PLACE
      ?auto_31067 - PLACE
      ?auto_31068 - HOIST
      ?auto_31074 - SURFACE
      ?auto_31071 - PLACE
      ?auto_31073 - HOIST
      ?auto_31072 - SURFACE
      ?auto_31076 - TRUCK
      ?auto_31069 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31070 ?auto_31075 ) ( IS-CRATE ?auto_31066 ) ( not ( = ?auto_31065 ?auto_31066 ) ) ( not ( = ?auto_31064 ?auto_31065 ) ) ( not ( = ?auto_31064 ?auto_31066 ) ) ( not ( = ?auto_31067 ?auto_31075 ) ) ( HOIST-AT ?auto_31068 ?auto_31067 ) ( not ( = ?auto_31070 ?auto_31068 ) ) ( AVAILABLE ?auto_31068 ) ( SURFACE-AT ?auto_31066 ?auto_31067 ) ( ON ?auto_31066 ?auto_31074 ) ( CLEAR ?auto_31066 ) ( not ( = ?auto_31065 ?auto_31074 ) ) ( not ( = ?auto_31066 ?auto_31074 ) ) ( not ( = ?auto_31064 ?auto_31074 ) ) ( IS-CRATE ?auto_31065 ) ( not ( = ?auto_31071 ?auto_31075 ) ) ( not ( = ?auto_31067 ?auto_31071 ) ) ( HOIST-AT ?auto_31073 ?auto_31071 ) ( not ( = ?auto_31070 ?auto_31073 ) ) ( not ( = ?auto_31068 ?auto_31073 ) ) ( AVAILABLE ?auto_31073 ) ( SURFACE-AT ?auto_31065 ?auto_31071 ) ( ON ?auto_31065 ?auto_31072 ) ( CLEAR ?auto_31065 ) ( not ( = ?auto_31065 ?auto_31072 ) ) ( not ( = ?auto_31066 ?auto_31072 ) ) ( not ( = ?auto_31064 ?auto_31072 ) ) ( not ( = ?auto_31074 ?auto_31072 ) ) ( SURFACE-AT ?auto_31063 ?auto_31075 ) ( CLEAR ?auto_31063 ) ( IS-CRATE ?auto_31064 ) ( not ( = ?auto_31063 ?auto_31064 ) ) ( not ( = ?auto_31065 ?auto_31063 ) ) ( not ( = ?auto_31066 ?auto_31063 ) ) ( not ( = ?auto_31074 ?auto_31063 ) ) ( not ( = ?auto_31072 ?auto_31063 ) ) ( AVAILABLE ?auto_31070 ) ( IN ?auto_31064 ?auto_31076 ) ( TRUCK-AT ?auto_31076 ?auto_31069 ) ( not ( = ?auto_31069 ?auto_31075 ) ) ( not ( = ?auto_31067 ?auto_31069 ) ) ( not ( = ?auto_31071 ?auto_31069 ) ) ( ON ?auto_31062 ?auto_31061 ) ( ON ?auto_31063 ?auto_31062 ) ( not ( = ?auto_31061 ?auto_31062 ) ) ( not ( = ?auto_31061 ?auto_31063 ) ) ( not ( = ?auto_31061 ?auto_31064 ) ) ( not ( = ?auto_31061 ?auto_31065 ) ) ( not ( = ?auto_31061 ?auto_31066 ) ) ( not ( = ?auto_31061 ?auto_31074 ) ) ( not ( = ?auto_31061 ?auto_31072 ) ) ( not ( = ?auto_31062 ?auto_31063 ) ) ( not ( = ?auto_31062 ?auto_31064 ) ) ( not ( = ?auto_31062 ?auto_31065 ) ) ( not ( = ?auto_31062 ?auto_31066 ) ) ( not ( = ?auto_31062 ?auto_31074 ) ) ( not ( = ?auto_31062 ?auto_31072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31064 ?auto_31065 ?auto_31066 )
      ( MAKE-5CRATE-VERIFY ?auto_31061 ?auto_31062 ?auto_31063 ?auto_31064 ?auto_31065 ?auto_31066 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31077 - SURFACE
      ?auto_31078 - SURFACE
    )
    :vars
    (
      ?auto_31083 - HOIST
      ?auto_31089 - PLACE
      ?auto_31079 - SURFACE
      ?auto_31080 - PLACE
      ?auto_31081 - HOIST
      ?auto_31088 - SURFACE
      ?auto_31085 - PLACE
      ?auto_31087 - HOIST
      ?auto_31086 - SURFACE
      ?auto_31084 - SURFACE
      ?auto_31090 - TRUCK
      ?auto_31082 - PLACE
      ?auto_31091 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31083 ?auto_31089 ) ( IS-CRATE ?auto_31078 ) ( not ( = ?auto_31077 ?auto_31078 ) ) ( not ( = ?auto_31079 ?auto_31077 ) ) ( not ( = ?auto_31079 ?auto_31078 ) ) ( not ( = ?auto_31080 ?auto_31089 ) ) ( HOIST-AT ?auto_31081 ?auto_31080 ) ( not ( = ?auto_31083 ?auto_31081 ) ) ( AVAILABLE ?auto_31081 ) ( SURFACE-AT ?auto_31078 ?auto_31080 ) ( ON ?auto_31078 ?auto_31088 ) ( CLEAR ?auto_31078 ) ( not ( = ?auto_31077 ?auto_31088 ) ) ( not ( = ?auto_31078 ?auto_31088 ) ) ( not ( = ?auto_31079 ?auto_31088 ) ) ( IS-CRATE ?auto_31077 ) ( not ( = ?auto_31085 ?auto_31089 ) ) ( not ( = ?auto_31080 ?auto_31085 ) ) ( HOIST-AT ?auto_31087 ?auto_31085 ) ( not ( = ?auto_31083 ?auto_31087 ) ) ( not ( = ?auto_31081 ?auto_31087 ) ) ( AVAILABLE ?auto_31087 ) ( SURFACE-AT ?auto_31077 ?auto_31085 ) ( ON ?auto_31077 ?auto_31086 ) ( CLEAR ?auto_31077 ) ( not ( = ?auto_31077 ?auto_31086 ) ) ( not ( = ?auto_31078 ?auto_31086 ) ) ( not ( = ?auto_31079 ?auto_31086 ) ) ( not ( = ?auto_31088 ?auto_31086 ) ) ( SURFACE-AT ?auto_31084 ?auto_31089 ) ( CLEAR ?auto_31084 ) ( IS-CRATE ?auto_31079 ) ( not ( = ?auto_31084 ?auto_31079 ) ) ( not ( = ?auto_31077 ?auto_31084 ) ) ( not ( = ?auto_31078 ?auto_31084 ) ) ( not ( = ?auto_31088 ?auto_31084 ) ) ( not ( = ?auto_31086 ?auto_31084 ) ) ( AVAILABLE ?auto_31083 ) ( TRUCK-AT ?auto_31090 ?auto_31082 ) ( not ( = ?auto_31082 ?auto_31089 ) ) ( not ( = ?auto_31080 ?auto_31082 ) ) ( not ( = ?auto_31085 ?auto_31082 ) ) ( HOIST-AT ?auto_31091 ?auto_31082 ) ( LIFTING ?auto_31091 ?auto_31079 ) ( not ( = ?auto_31083 ?auto_31091 ) ) ( not ( = ?auto_31081 ?auto_31091 ) ) ( not ( = ?auto_31087 ?auto_31091 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31091 ?auto_31079 ?auto_31090 ?auto_31082 )
      ( MAKE-2CRATE ?auto_31079 ?auto_31077 ?auto_31078 )
      ( MAKE-1CRATE-VERIFY ?auto_31077 ?auto_31078 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31092 - SURFACE
      ?auto_31093 - SURFACE
      ?auto_31094 - SURFACE
    )
    :vars
    (
      ?auto_31099 - HOIST
      ?auto_31105 - PLACE
      ?auto_31097 - PLACE
      ?auto_31095 - HOIST
      ?auto_31103 - SURFACE
      ?auto_31100 - PLACE
      ?auto_31102 - HOIST
      ?auto_31098 - SURFACE
      ?auto_31106 - SURFACE
      ?auto_31096 - TRUCK
      ?auto_31101 - PLACE
      ?auto_31104 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31099 ?auto_31105 ) ( IS-CRATE ?auto_31094 ) ( not ( = ?auto_31093 ?auto_31094 ) ) ( not ( = ?auto_31092 ?auto_31093 ) ) ( not ( = ?auto_31092 ?auto_31094 ) ) ( not ( = ?auto_31097 ?auto_31105 ) ) ( HOIST-AT ?auto_31095 ?auto_31097 ) ( not ( = ?auto_31099 ?auto_31095 ) ) ( AVAILABLE ?auto_31095 ) ( SURFACE-AT ?auto_31094 ?auto_31097 ) ( ON ?auto_31094 ?auto_31103 ) ( CLEAR ?auto_31094 ) ( not ( = ?auto_31093 ?auto_31103 ) ) ( not ( = ?auto_31094 ?auto_31103 ) ) ( not ( = ?auto_31092 ?auto_31103 ) ) ( IS-CRATE ?auto_31093 ) ( not ( = ?auto_31100 ?auto_31105 ) ) ( not ( = ?auto_31097 ?auto_31100 ) ) ( HOIST-AT ?auto_31102 ?auto_31100 ) ( not ( = ?auto_31099 ?auto_31102 ) ) ( not ( = ?auto_31095 ?auto_31102 ) ) ( AVAILABLE ?auto_31102 ) ( SURFACE-AT ?auto_31093 ?auto_31100 ) ( ON ?auto_31093 ?auto_31098 ) ( CLEAR ?auto_31093 ) ( not ( = ?auto_31093 ?auto_31098 ) ) ( not ( = ?auto_31094 ?auto_31098 ) ) ( not ( = ?auto_31092 ?auto_31098 ) ) ( not ( = ?auto_31103 ?auto_31098 ) ) ( SURFACE-AT ?auto_31106 ?auto_31105 ) ( CLEAR ?auto_31106 ) ( IS-CRATE ?auto_31092 ) ( not ( = ?auto_31106 ?auto_31092 ) ) ( not ( = ?auto_31093 ?auto_31106 ) ) ( not ( = ?auto_31094 ?auto_31106 ) ) ( not ( = ?auto_31103 ?auto_31106 ) ) ( not ( = ?auto_31098 ?auto_31106 ) ) ( AVAILABLE ?auto_31099 ) ( TRUCK-AT ?auto_31096 ?auto_31101 ) ( not ( = ?auto_31101 ?auto_31105 ) ) ( not ( = ?auto_31097 ?auto_31101 ) ) ( not ( = ?auto_31100 ?auto_31101 ) ) ( HOIST-AT ?auto_31104 ?auto_31101 ) ( LIFTING ?auto_31104 ?auto_31092 ) ( not ( = ?auto_31099 ?auto_31104 ) ) ( not ( = ?auto_31095 ?auto_31104 ) ) ( not ( = ?auto_31102 ?auto_31104 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31093 ?auto_31094 )
      ( MAKE-2CRATE-VERIFY ?auto_31092 ?auto_31093 ?auto_31094 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31107 - SURFACE
      ?auto_31108 - SURFACE
      ?auto_31109 - SURFACE
      ?auto_31110 - SURFACE
    )
    :vars
    (
      ?auto_31112 - HOIST
      ?auto_31113 - PLACE
      ?auto_31120 - PLACE
      ?auto_31118 - HOIST
      ?auto_31111 - SURFACE
      ?auto_31114 - PLACE
      ?auto_31119 - HOIST
      ?auto_31117 - SURFACE
      ?auto_31121 - TRUCK
      ?auto_31115 - PLACE
      ?auto_31116 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31112 ?auto_31113 ) ( IS-CRATE ?auto_31110 ) ( not ( = ?auto_31109 ?auto_31110 ) ) ( not ( = ?auto_31108 ?auto_31109 ) ) ( not ( = ?auto_31108 ?auto_31110 ) ) ( not ( = ?auto_31120 ?auto_31113 ) ) ( HOIST-AT ?auto_31118 ?auto_31120 ) ( not ( = ?auto_31112 ?auto_31118 ) ) ( AVAILABLE ?auto_31118 ) ( SURFACE-AT ?auto_31110 ?auto_31120 ) ( ON ?auto_31110 ?auto_31111 ) ( CLEAR ?auto_31110 ) ( not ( = ?auto_31109 ?auto_31111 ) ) ( not ( = ?auto_31110 ?auto_31111 ) ) ( not ( = ?auto_31108 ?auto_31111 ) ) ( IS-CRATE ?auto_31109 ) ( not ( = ?auto_31114 ?auto_31113 ) ) ( not ( = ?auto_31120 ?auto_31114 ) ) ( HOIST-AT ?auto_31119 ?auto_31114 ) ( not ( = ?auto_31112 ?auto_31119 ) ) ( not ( = ?auto_31118 ?auto_31119 ) ) ( AVAILABLE ?auto_31119 ) ( SURFACE-AT ?auto_31109 ?auto_31114 ) ( ON ?auto_31109 ?auto_31117 ) ( CLEAR ?auto_31109 ) ( not ( = ?auto_31109 ?auto_31117 ) ) ( not ( = ?auto_31110 ?auto_31117 ) ) ( not ( = ?auto_31108 ?auto_31117 ) ) ( not ( = ?auto_31111 ?auto_31117 ) ) ( SURFACE-AT ?auto_31107 ?auto_31113 ) ( CLEAR ?auto_31107 ) ( IS-CRATE ?auto_31108 ) ( not ( = ?auto_31107 ?auto_31108 ) ) ( not ( = ?auto_31109 ?auto_31107 ) ) ( not ( = ?auto_31110 ?auto_31107 ) ) ( not ( = ?auto_31111 ?auto_31107 ) ) ( not ( = ?auto_31117 ?auto_31107 ) ) ( AVAILABLE ?auto_31112 ) ( TRUCK-AT ?auto_31121 ?auto_31115 ) ( not ( = ?auto_31115 ?auto_31113 ) ) ( not ( = ?auto_31120 ?auto_31115 ) ) ( not ( = ?auto_31114 ?auto_31115 ) ) ( HOIST-AT ?auto_31116 ?auto_31115 ) ( LIFTING ?auto_31116 ?auto_31108 ) ( not ( = ?auto_31112 ?auto_31116 ) ) ( not ( = ?auto_31118 ?auto_31116 ) ) ( not ( = ?auto_31119 ?auto_31116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31108 ?auto_31109 ?auto_31110 )
      ( MAKE-3CRATE-VERIFY ?auto_31107 ?auto_31108 ?auto_31109 ?auto_31110 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31122 - SURFACE
      ?auto_31123 - SURFACE
      ?auto_31124 - SURFACE
      ?auto_31125 - SURFACE
      ?auto_31126 - SURFACE
    )
    :vars
    (
      ?auto_31128 - HOIST
      ?auto_31129 - PLACE
      ?auto_31136 - PLACE
      ?auto_31134 - HOIST
      ?auto_31127 - SURFACE
      ?auto_31130 - PLACE
      ?auto_31135 - HOIST
      ?auto_31133 - SURFACE
      ?auto_31137 - TRUCK
      ?auto_31131 - PLACE
      ?auto_31132 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31128 ?auto_31129 ) ( IS-CRATE ?auto_31126 ) ( not ( = ?auto_31125 ?auto_31126 ) ) ( not ( = ?auto_31124 ?auto_31125 ) ) ( not ( = ?auto_31124 ?auto_31126 ) ) ( not ( = ?auto_31136 ?auto_31129 ) ) ( HOIST-AT ?auto_31134 ?auto_31136 ) ( not ( = ?auto_31128 ?auto_31134 ) ) ( AVAILABLE ?auto_31134 ) ( SURFACE-AT ?auto_31126 ?auto_31136 ) ( ON ?auto_31126 ?auto_31127 ) ( CLEAR ?auto_31126 ) ( not ( = ?auto_31125 ?auto_31127 ) ) ( not ( = ?auto_31126 ?auto_31127 ) ) ( not ( = ?auto_31124 ?auto_31127 ) ) ( IS-CRATE ?auto_31125 ) ( not ( = ?auto_31130 ?auto_31129 ) ) ( not ( = ?auto_31136 ?auto_31130 ) ) ( HOIST-AT ?auto_31135 ?auto_31130 ) ( not ( = ?auto_31128 ?auto_31135 ) ) ( not ( = ?auto_31134 ?auto_31135 ) ) ( AVAILABLE ?auto_31135 ) ( SURFACE-AT ?auto_31125 ?auto_31130 ) ( ON ?auto_31125 ?auto_31133 ) ( CLEAR ?auto_31125 ) ( not ( = ?auto_31125 ?auto_31133 ) ) ( not ( = ?auto_31126 ?auto_31133 ) ) ( not ( = ?auto_31124 ?auto_31133 ) ) ( not ( = ?auto_31127 ?auto_31133 ) ) ( SURFACE-AT ?auto_31123 ?auto_31129 ) ( CLEAR ?auto_31123 ) ( IS-CRATE ?auto_31124 ) ( not ( = ?auto_31123 ?auto_31124 ) ) ( not ( = ?auto_31125 ?auto_31123 ) ) ( not ( = ?auto_31126 ?auto_31123 ) ) ( not ( = ?auto_31127 ?auto_31123 ) ) ( not ( = ?auto_31133 ?auto_31123 ) ) ( AVAILABLE ?auto_31128 ) ( TRUCK-AT ?auto_31137 ?auto_31131 ) ( not ( = ?auto_31131 ?auto_31129 ) ) ( not ( = ?auto_31136 ?auto_31131 ) ) ( not ( = ?auto_31130 ?auto_31131 ) ) ( HOIST-AT ?auto_31132 ?auto_31131 ) ( LIFTING ?auto_31132 ?auto_31124 ) ( not ( = ?auto_31128 ?auto_31132 ) ) ( not ( = ?auto_31134 ?auto_31132 ) ) ( not ( = ?auto_31135 ?auto_31132 ) ) ( ON ?auto_31123 ?auto_31122 ) ( not ( = ?auto_31122 ?auto_31123 ) ) ( not ( = ?auto_31122 ?auto_31124 ) ) ( not ( = ?auto_31122 ?auto_31125 ) ) ( not ( = ?auto_31122 ?auto_31126 ) ) ( not ( = ?auto_31122 ?auto_31127 ) ) ( not ( = ?auto_31122 ?auto_31133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31124 ?auto_31125 ?auto_31126 )
      ( MAKE-4CRATE-VERIFY ?auto_31122 ?auto_31123 ?auto_31124 ?auto_31125 ?auto_31126 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31138 - SURFACE
      ?auto_31139 - SURFACE
      ?auto_31140 - SURFACE
      ?auto_31141 - SURFACE
      ?auto_31142 - SURFACE
      ?auto_31143 - SURFACE
    )
    :vars
    (
      ?auto_31145 - HOIST
      ?auto_31146 - PLACE
      ?auto_31153 - PLACE
      ?auto_31151 - HOIST
      ?auto_31144 - SURFACE
      ?auto_31147 - PLACE
      ?auto_31152 - HOIST
      ?auto_31150 - SURFACE
      ?auto_31154 - TRUCK
      ?auto_31148 - PLACE
      ?auto_31149 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31145 ?auto_31146 ) ( IS-CRATE ?auto_31143 ) ( not ( = ?auto_31142 ?auto_31143 ) ) ( not ( = ?auto_31141 ?auto_31142 ) ) ( not ( = ?auto_31141 ?auto_31143 ) ) ( not ( = ?auto_31153 ?auto_31146 ) ) ( HOIST-AT ?auto_31151 ?auto_31153 ) ( not ( = ?auto_31145 ?auto_31151 ) ) ( AVAILABLE ?auto_31151 ) ( SURFACE-AT ?auto_31143 ?auto_31153 ) ( ON ?auto_31143 ?auto_31144 ) ( CLEAR ?auto_31143 ) ( not ( = ?auto_31142 ?auto_31144 ) ) ( not ( = ?auto_31143 ?auto_31144 ) ) ( not ( = ?auto_31141 ?auto_31144 ) ) ( IS-CRATE ?auto_31142 ) ( not ( = ?auto_31147 ?auto_31146 ) ) ( not ( = ?auto_31153 ?auto_31147 ) ) ( HOIST-AT ?auto_31152 ?auto_31147 ) ( not ( = ?auto_31145 ?auto_31152 ) ) ( not ( = ?auto_31151 ?auto_31152 ) ) ( AVAILABLE ?auto_31152 ) ( SURFACE-AT ?auto_31142 ?auto_31147 ) ( ON ?auto_31142 ?auto_31150 ) ( CLEAR ?auto_31142 ) ( not ( = ?auto_31142 ?auto_31150 ) ) ( not ( = ?auto_31143 ?auto_31150 ) ) ( not ( = ?auto_31141 ?auto_31150 ) ) ( not ( = ?auto_31144 ?auto_31150 ) ) ( SURFACE-AT ?auto_31140 ?auto_31146 ) ( CLEAR ?auto_31140 ) ( IS-CRATE ?auto_31141 ) ( not ( = ?auto_31140 ?auto_31141 ) ) ( not ( = ?auto_31142 ?auto_31140 ) ) ( not ( = ?auto_31143 ?auto_31140 ) ) ( not ( = ?auto_31144 ?auto_31140 ) ) ( not ( = ?auto_31150 ?auto_31140 ) ) ( AVAILABLE ?auto_31145 ) ( TRUCK-AT ?auto_31154 ?auto_31148 ) ( not ( = ?auto_31148 ?auto_31146 ) ) ( not ( = ?auto_31153 ?auto_31148 ) ) ( not ( = ?auto_31147 ?auto_31148 ) ) ( HOIST-AT ?auto_31149 ?auto_31148 ) ( LIFTING ?auto_31149 ?auto_31141 ) ( not ( = ?auto_31145 ?auto_31149 ) ) ( not ( = ?auto_31151 ?auto_31149 ) ) ( not ( = ?auto_31152 ?auto_31149 ) ) ( ON ?auto_31139 ?auto_31138 ) ( ON ?auto_31140 ?auto_31139 ) ( not ( = ?auto_31138 ?auto_31139 ) ) ( not ( = ?auto_31138 ?auto_31140 ) ) ( not ( = ?auto_31138 ?auto_31141 ) ) ( not ( = ?auto_31138 ?auto_31142 ) ) ( not ( = ?auto_31138 ?auto_31143 ) ) ( not ( = ?auto_31138 ?auto_31144 ) ) ( not ( = ?auto_31138 ?auto_31150 ) ) ( not ( = ?auto_31139 ?auto_31140 ) ) ( not ( = ?auto_31139 ?auto_31141 ) ) ( not ( = ?auto_31139 ?auto_31142 ) ) ( not ( = ?auto_31139 ?auto_31143 ) ) ( not ( = ?auto_31139 ?auto_31144 ) ) ( not ( = ?auto_31139 ?auto_31150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31141 ?auto_31142 ?auto_31143 )
      ( MAKE-5CRATE-VERIFY ?auto_31138 ?auto_31139 ?auto_31140 ?auto_31141 ?auto_31142 ?auto_31143 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31155 - SURFACE
      ?auto_31156 - SURFACE
    )
    :vars
    (
      ?auto_31158 - HOIST
      ?auto_31159 - PLACE
      ?auto_31169 - SURFACE
      ?auto_31166 - PLACE
      ?auto_31164 - HOIST
      ?auto_31157 - SURFACE
      ?auto_31160 - PLACE
      ?auto_31165 - HOIST
      ?auto_31163 - SURFACE
      ?auto_31168 - SURFACE
      ?auto_31167 - TRUCK
      ?auto_31161 - PLACE
      ?auto_31162 - HOIST
      ?auto_31170 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31158 ?auto_31159 ) ( IS-CRATE ?auto_31156 ) ( not ( = ?auto_31155 ?auto_31156 ) ) ( not ( = ?auto_31169 ?auto_31155 ) ) ( not ( = ?auto_31169 ?auto_31156 ) ) ( not ( = ?auto_31166 ?auto_31159 ) ) ( HOIST-AT ?auto_31164 ?auto_31166 ) ( not ( = ?auto_31158 ?auto_31164 ) ) ( AVAILABLE ?auto_31164 ) ( SURFACE-AT ?auto_31156 ?auto_31166 ) ( ON ?auto_31156 ?auto_31157 ) ( CLEAR ?auto_31156 ) ( not ( = ?auto_31155 ?auto_31157 ) ) ( not ( = ?auto_31156 ?auto_31157 ) ) ( not ( = ?auto_31169 ?auto_31157 ) ) ( IS-CRATE ?auto_31155 ) ( not ( = ?auto_31160 ?auto_31159 ) ) ( not ( = ?auto_31166 ?auto_31160 ) ) ( HOIST-AT ?auto_31165 ?auto_31160 ) ( not ( = ?auto_31158 ?auto_31165 ) ) ( not ( = ?auto_31164 ?auto_31165 ) ) ( AVAILABLE ?auto_31165 ) ( SURFACE-AT ?auto_31155 ?auto_31160 ) ( ON ?auto_31155 ?auto_31163 ) ( CLEAR ?auto_31155 ) ( not ( = ?auto_31155 ?auto_31163 ) ) ( not ( = ?auto_31156 ?auto_31163 ) ) ( not ( = ?auto_31169 ?auto_31163 ) ) ( not ( = ?auto_31157 ?auto_31163 ) ) ( SURFACE-AT ?auto_31168 ?auto_31159 ) ( CLEAR ?auto_31168 ) ( IS-CRATE ?auto_31169 ) ( not ( = ?auto_31168 ?auto_31169 ) ) ( not ( = ?auto_31155 ?auto_31168 ) ) ( not ( = ?auto_31156 ?auto_31168 ) ) ( not ( = ?auto_31157 ?auto_31168 ) ) ( not ( = ?auto_31163 ?auto_31168 ) ) ( AVAILABLE ?auto_31158 ) ( TRUCK-AT ?auto_31167 ?auto_31161 ) ( not ( = ?auto_31161 ?auto_31159 ) ) ( not ( = ?auto_31166 ?auto_31161 ) ) ( not ( = ?auto_31160 ?auto_31161 ) ) ( HOIST-AT ?auto_31162 ?auto_31161 ) ( not ( = ?auto_31158 ?auto_31162 ) ) ( not ( = ?auto_31164 ?auto_31162 ) ) ( not ( = ?auto_31165 ?auto_31162 ) ) ( AVAILABLE ?auto_31162 ) ( SURFACE-AT ?auto_31169 ?auto_31161 ) ( ON ?auto_31169 ?auto_31170 ) ( CLEAR ?auto_31169 ) ( not ( = ?auto_31155 ?auto_31170 ) ) ( not ( = ?auto_31156 ?auto_31170 ) ) ( not ( = ?auto_31169 ?auto_31170 ) ) ( not ( = ?auto_31157 ?auto_31170 ) ) ( not ( = ?auto_31163 ?auto_31170 ) ) ( not ( = ?auto_31168 ?auto_31170 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31162 ?auto_31169 ?auto_31170 ?auto_31161 )
      ( MAKE-2CRATE ?auto_31169 ?auto_31155 ?auto_31156 )
      ( MAKE-1CRATE-VERIFY ?auto_31155 ?auto_31156 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31171 - SURFACE
      ?auto_31172 - SURFACE
      ?auto_31173 - SURFACE
    )
    :vars
    (
      ?auto_31179 - HOIST
      ?auto_31183 - PLACE
      ?auto_31182 - PLACE
      ?auto_31177 - HOIST
      ?auto_31181 - SURFACE
      ?auto_31174 - PLACE
      ?auto_31176 - HOIST
      ?auto_31178 - SURFACE
      ?auto_31185 - SURFACE
      ?auto_31175 - TRUCK
      ?auto_31186 - PLACE
      ?auto_31184 - HOIST
      ?auto_31180 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31179 ?auto_31183 ) ( IS-CRATE ?auto_31173 ) ( not ( = ?auto_31172 ?auto_31173 ) ) ( not ( = ?auto_31171 ?auto_31172 ) ) ( not ( = ?auto_31171 ?auto_31173 ) ) ( not ( = ?auto_31182 ?auto_31183 ) ) ( HOIST-AT ?auto_31177 ?auto_31182 ) ( not ( = ?auto_31179 ?auto_31177 ) ) ( AVAILABLE ?auto_31177 ) ( SURFACE-AT ?auto_31173 ?auto_31182 ) ( ON ?auto_31173 ?auto_31181 ) ( CLEAR ?auto_31173 ) ( not ( = ?auto_31172 ?auto_31181 ) ) ( not ( = ?auto_31173 ?auto_31181 ) ) ( not ( = ?auto_31171 ?auto_31181 ) ) ( IS-CRATE ?auto_31172 ) ( not ( = ?auto_31174 ?auto_31183 ) ) ( not ( = ?auto_31182 ?auto_31174 ) ) ( HOIST-AT ?auto_31176 ?auto_31174 ) ( not ( = ?auto_31179 ?auto_31176 ) ) ( not ( = ?auto_31177 ?auto_31176 ) ) ( AVAILABLE ?auto_31176 ) ( SURFACE-AT ?auto_31172 ?auto_31174 ) ( ON ?auto_31172 ?auto_31178 ) ( CLEAR ?auto_31172 ) ( not ( = ?auto_31172 ?auto_31178 ) ) ( not ( = ?auto_31173 ?auto_31178 ) ) ( not ( = ?auto_31171 ?auto_31178 ) ) ( not ( = ?auto_31181 ?auto_31178 ) ) ( SURFACE-AT ?auto_31185 ?auto_31183 ) ( CLEAR ?auto_31185 ) ( IS-CRATE ?auto_31171 ) ( not ( = ?auto_31185 ?auto_31171 ) ) ( not ( = ?auto_31172 ?auto_31185 ) ) ( not ( = ?auto_31173 ?auto_31185 ) ) ( not ( = ?auto_31181 ?auto_31185 ) ) ( not ( = ?auto_31178 ?auto_31185 ) ) ( AVAILABLE ?auto_31179 ) ( TRUCK-AT ?auto_31175 ?auto_31186 ) ( not ( = ?auto_31186 ?auto_31183 ) ) ( not ( = ?auto_31182 ?auto_31186 ) ) ( not ( = ?auto_31174 ?auto_31186 ) ) ( HOIST-AT ?auto_31184 ?auto_31186 ) ( not ( = ?auto_31179 ?auto_31184 ) ) ( not ( = ?auto_31177 ?auto_31184 ) ) ( not ( = ?auto_31176 ?auto_31184 ) ) ( AVAILABLE ?auto_31184 ) ( SURFACE-AT ?auto_31171 ?auto_31186 ) ( ON ?auto_31171 ?auto_31180 ) ( CLEAR ?auto_31171 ) ( not ( = ?auto_31172 ?auto_31180 ) ) ( not ( = ?auto_31173 ?auto_31180 ) ) ( not ( = ?auto_31171 ?auto_31180 ) ) ( not ( = ?auto_31181 ?auto_31180 ) ) ( not ( = ?auto_31178 ?auto_31180 ) ) ( not ( = ?auto_31185 ?auto_31180 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31172 ?auto_31173 )
      ( MAKE-2CRATE-VERIFY ?auto_31171 ?auto_31172 ?auto_31173 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31187 - SURFACE
      ?auto_31188 - SURFACE
      ?auto_31189 - SURFACE
      ?auto_31190 - SURFACE
    )
    :vars
    (
      ?auto_31202 - HOIST
      ?auto_31196 - PLACE
      ?auto_31200 - PLACE
      ?auto_31192 - HOIST
      ?auto_31197 - SURFACE
      ?auto_31199 - PLACE
      ?auto_31193 - HOIST
      ?auto_31191 - SURFACE
      ?auto_31195 - TRUCK
      ?auto_31201 - PLACE
      ?auto_31194 - HOIST
      ?auto_31198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31202 ?auto_31196 ) ( IS-CRATE ?auto_31190 ) ( not ( = ?auto_31189 ?auto_31190 ) ) ( not ( = ?auto_31188 ?auto_31189 ) ) ( not ( = ?auto_31188 ?auto_31190 ) ) ( not ( = ?auto_31200 ?auto_31196 ) ) ( HOIST-AT ?auto_31192 ?auto_31200 ) ( not ( = ?auto_31202 ?auto_31192 ) ) ( AVAILABLE ?auto_31192 ) ( SURFACE-AT ?auto_31190 ?auto_31200 ) ( ON ?auto_31190 ?auto_31197 ) ( CLEAR ?auto_31190 ) ( not ( = ?auto_31189 ?auto_31197 ) ) ( not ( = ?auto_31190 ?auto_31197 ) ) ( not ( = ?auto_31188 ?auto_31197 ) ) ( IS-CRATE ?auto_31189 ) ( not ( = ?auto_31199 ?auto_31196 ) ) ( not ( = ?auto_31200 ?auto_31199 ) ) ( HOIST-AT ?auto_31193 ?auto_31199 ) ( not ( = ?auto_31202 ?auto_31193 ) ) ( not ( = ?auto_31192 ?auto_31193 ) ) ( AVAILABLE ?auto_31193 ) ( SURFACE-AT ?auto_31189 ?auto_31199 ) ( ON ?auto_31189 ?auto_31191 ) ( CLEAR ?auto_31189 ) ( not ( = ?auto_31189 ?auto_31191 ) ) ( not ( = ?auto_31190 ?auto_31191 ) ) ( not ( = ?auto_31188 ?auto_31191 ) ) ( not ( = ?auto_31197 ?auto_31191 ) ) ( SURFACE-AT ?auto_31187 ?auto_31196 ) ( CLEAR ?auto_31187 ) ( IS-CRATE ?auto_31188 ) ( not ( = ?auto_31187 ?auto_31188 ) ) ( not ( = ?auto_31189 ?auto_31187 ) ) ( not ( = ?auto_31190 ?auto_31187 ) ) ( not ( = ?auto_31197 ?auto_31187 ) ) ( not ( = ?auto_31191 ?auto_31187 ) ) ( AVAILABLE ?auto_31202 ) ( TRUCK-AT ?auto_31195 ?auto_31201 ) ( not ( = ?auto_31201 ?auto_31196 ) ) ( not ( = ?auto_31200 ?auto_31201 ) ) ( not ( = ?auto_31199 ?auto_31201 ) ) ( HOIST-AT ?auto_31194 ?auto_31201 ) ( not ( = ?auto_31202 ?auto_31194 ) ) ( not ( = ?auto_31192 ?auto_31194 ) ) ( not ( = ?auto_31193 ?auto_31194 ) ) ( AVAILABLE ?auto_31194 ) ( SURFACE-AT ?auto_31188 ?auto_31201 ) ( ON ?auto_31188 ?auto_31198 ) ( CLEAR ?auto_31188 ) ( not ( = ?auto_31189 ?auto_31198 ) ) ( not ( = ?auto_31190 ?auto_31198 ) ) ( not ( = ?auto_31188 ?auto_31198 ) ) ( not ( = ?auto_31197 ?auto_31198 ) ) ( not ( = ?auto_31191 ?auto_31198 ) ) ( not ( = ?auto_31187 ?auto_31198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31188 ?auto_31189 ?auto_31190 )
      ( MAKE-3CRATE-VERIFY ?auto_31187 ?auto_31188 ?auto_31189 ?auto_31190 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31203 - SURFACE
      ?auto_31204 - SURFACE
      ?auto_31205 - SURFACE
      ?auto_31206 - SURFACE
      ?auto_31207 - SURFACE
    )
    :vars
    (
      ?auto_31219 - HOIST
      ?auto_31213 - PLACE
      ?auto_31217 - PLACE
      ?auto_31209 - HOIST
      ?auto_31214 - SURFACE
      ?auto_31216 - PLACE
      ?auto_31210 - HOIST
      ?auto_31208 - SURFACE
      ?auto_31212 - TRUCK
      ?auto_31218 - PLACE
      ?auto_31211 - HOIST
      ?auto_31215 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31219 ?auto_31213 ) ( IS-CRATE ?auto_31207 ) ( not ( = ?auto_31206 ?auto_31207 ) ) ( not ( = ?auto_31205 ?auto_31206 ) ) ( not ( = ?auto_31205 ?auto_31207 ) ) ( not ( = ?auto_31217 ?auto_31213 ) ) ( HOIST-AT ?auto_31209 ?auto_31217 ) ( not ( = ?auto_31219 ?auto_31209 ) ) ( AVAILABLE ?auto_31209 ) ( SURFACE-AT ?auto_31207 ?auto_31217 ) ( ON ?auto_31207 ?auto_31214 ) ( CLEAR ?auto_31207 ) ( not ( = ?auto_31206 ?auto_31214 ) ) ( not ( = ?auto_31207 ?auto_31214 ) ) ( not ( = ?auto_31205 ?auto_31214 ) ) ( IS-CRATE ?auto_31206 ) ( not ( = ?auto_31216 ?auto_31213 ) ) ( not ( = ?auto_31217 ?auto_31216 ) ) ( HOIST-AT ?auto_31210 ?auto_31216 ) ( not ( = ?auto_31219 ?auto_31210 ) ) ( not ( = ?auto_31209 ?auto_31210 ) ) ( AVAILABLE ?auto_31210 ) ( SURFACE-AT ?auto_31206 ?auto_31216 ) ( ON ?auto_31206 ?auto_31208 ) ( CLEAR ?auto_31206 ) ( not ( = ?auto_31206 ?auto_31208 ) ) ( not ( = ?auto_31207 ?auto_31208 ) ) ( not ( = ?auto_31205 ?auto_31208 ) ) ( not ( = ?auto_31214 ?auto_31208 ) ) ( SURFACE-AT ?auto_31204 ?auto_31213 ) ( CLEAR ?auto_31204 ) ( IS-CRATE ?auto_31205 ) ( not ( = ?auto_31204 ?auto_31205 ) ) ( not ( = ?auto_31206 ?auto_31204 ) ) ( not ( = ?auto_31207 ?auto_31204 ) ) ( not ( = ?auto_31214 ?auto_31204 ) ) ( not ( = ?auto_31208 ?auto_31204 ) ) ( AVAILABLE ?auto_31219 ) ( TRUCK-AT ?auto_31212 ?auto_31218 ) ( not ( = ?auto_31218 ?auto_31213 ) ) ( not ( = ?auto_31217 ?auto_31218 ) ) ( not ( = ?auto_31216 ?auto_31218 ) ) ( HOIST-AT ?auto_31211 ?auto_31218 ) ( not ( = ?auto_31219 ?auto_31211 ) ) ( not ( = ?auto_31209 ?auto_31211 ) ) ( not ( = ?auto_31210 ?auto_31211 ) ) ( AVAILABLE ?auto_31211 ) ( SURFACE-AT ?auto_31205 ?auto_31218 ) ( ON ?auto_31205 ?auto_31215 ) ( CLEAR ?auto_31205 ) ( not ( = ?auto_31206 ?auto_31215 ) ) ( not ( = ?auto_31207 ?auto_31215 ) ) ( not ( = ?auto_31205 ?auto_31215 ) ) ( not ( = ?auto_31214 ?auto_31215 ) ) ( not ( = ?auto_31208 ?auto_31215 ) ) ( not ( = ?auto_31204 ?auto_31215 ) ) ( ON ?auto_31204 ?auto_31203 ) ( not ( = ?auto_31203 ?auto_31204 ) ) ( not ( = ?auto_31203 ?auto_31205 ) ) ( not ( = ?auto_31203 ?auto_31206 ) ) ( not ( = ?auto_31203 ?auto_31207 ) ) ( not ( = ?auto_31203 ?auto_31214 ) ) ( not ( = ?auto_31203 ?auto_31208 ) ) ( not ( = ?auto_31203 ?auto_31215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31205 ?auto_31206 ?auto_31207 )
      ( MAKE-4CRATE-VERIFY ?auto_31203 ?auto_31204 ?auto_31205 ?auto_31206 ?auto_31207 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31220 - SURFACE
      ?auto_31221 - SURFACE
      ?auto_31222 - SURFACE
      ?auto_31223 - SURFACE
      ?auto_31224 - SURFACE
      ?auto_31225 - SURFACE
    )
    :vars
    (
      ?auto_31237 - HOIST
      ?auto_31231 - PLACE
      ?auto_31235 - PLACE
      ?auto_31227 - HOIST
      ?auto_31232 - SURFACE
      ?auto_31234 - PLACE
      ?auto_31228 - HOIST
      ?auto_31226 - SURFACE
      ?auto_31230 - TRUCK
      ?auto_31236 - PLACE
      ?auto_31229 - HOIST
      ?auto_31233 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31237 ?auto_31231 ) ( IS-CRATE ?auto_31225 ) ( not ( = ?auto_31224 ?auto_31225 ) ) ( not ( = ?auto_31223 ?auto_31224 ) ) ( not ( = ?auto_31223 ?auto_31225 ) ) ( not ( = ?auto_31235 ?auto_31231 ) ) ( HOIST-AT ?auto_31227 ?auto_31235 ) ( not ( = ?auto_31237 ?auto_31227 ) ) ( AVAILABLE ?auto_31227 ) ( SURFACE-AT ?auto_31225 ?auto_31235 ) ( ON ?auto_31225 ?auto_31232 ) ( CLEAR ?auto_31225 ) ( not ( = ?auto_31224 ?auto_31232 ) ) ( not ( = ?auto_31225 ?auto_31232 ) ) ( not ( = ?auto_31223 ?auto_31232 ) ) ( IS-CRATE ?auto_31224 ) ( not ( = ?auto_31234 ?auto_31231 ) ) ( not ( = ?auto_31235 ?auto_31234 ) ) ( HOIST-AT ?auto_31228 ?auto_31234 ) ( not ( = ?auto_31237 ?auto_31228 ) ) ( not ( = ?auto_31227 ?auto_31228 ) ) ( AVAILABLE ?auto_31228 ) ( SURFACE-AT ?auto_31224 ?auto_31234 ) ( ON ?auto_31224 ?auto_31226 ) ( CLEAR ?auto_31224 ) ( not ( = ?auto_31224 ?auto_31226 ) ) ( not ( = ?auto_31225 ?auto_31226 ) ) ( not ( = ?auto_31223 ?auto_31226 ) ) ( not ( = ?auto_31232 ?auto_31226 ) ) ( SURFACE-AT ?auto_31222 ?auto_31231 ) ( CLEAR ?auto_31222 ) ( IS-CRATE ?auto_31223 ) ( not ( = ?auto_31222 ?auto_31223 ) ) ( not ( = ?auto_31224 ?auto_31222 ) ) ( not ( = ?auto_31225 ?auto_31222 ) ) ( not ( = ?auto_31232 ?auto_31222 ) ) ( not ( = ?auto_31226 ?auto_31222 ) ) ( AVAILABLE ?auto_31237 ) ( TRUCK-AT ?auto_31230 ?auto_31236 ) ( not ( = ?auto_31236 ?auto_31231 ) ) ( not ( = ?auto_31235 ?auto_31236 ) ) ( not ( = ?auto_31234 ?auto_31236 ) ) ( HOIST-AT ?auto_31229 ?auto_31236 ) ( not ( = ?auto_31237 ?auto_31229 ) ) ( not ( = ?auto_31227 ?auto_31229 ) ) ( not ( = ?auto_31228 ?auto_31229 ) ) ( AVAILABLE ?auto_31229 ) ( SURFACE-AT ?auto_31223 ?auto_31236 ) ( ON ?auto_31223 ?auto_31233 ) ( CLEAR ?auto_31223 ) ( not ( = ?auto_31224 ?auto_31233 ) ) ( not ( = ?auto_31225 ?auto_31233 ) ) ( not ( = ?auto_31223 ?auto_31233 ) ) ( not ( = ?auto_31232 ?auto_31233 ) ) ( not ( = ?auto_31226 ?auto_31233 ) ) ( not ( = ?auto_31222 ?auto_31233 ) ) ( ON ?auto_31221 ?auto_31220 ) ( ON ?auto_31222 ?auto_31221 ) ( not ( = ?auto_31220 ?auto_31221 ) ) ( not ( = ?auto_31220 ?auto_31222 ) ) ( not ( = ?auto_31220 ?auto_31223 ) ) ( not ( = ?auto_31220 ?auto_31224 ) ) ( not ( = ?auto_31220 ?auto_31225 ) ) ( not ( = ?auto_31220 ?auto_31232 ) ) ( not ( = ?auto_31220 ?auto_31226 ) ) ( not ( = ?auto_31220 ?auto_31233 ) ) ( not ( = ?auto_31221 ?auto_31222 ) ) ( not ( = ?auto_31221 ?auto_31223 ) ) ( not ( = ?auto_31221 ?auto_31224 ) ) ( not ( = ?auto_31221 ?auto_31225 ) ) ( not ( = ?auto_31221 ?auto_31232 ) ) ( not ( = ?auto_31221 ?auto_31226 ) ) ( not ( = ?auto_31221 ?auto_31233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31223 ?auto_31224 ?auto_31225 )
      ( MAKE-5CRATE-VERIFY ?auto_31220 ?auto_31221 ?auto_31222 ?auto_31223 ?auto_31224 ?auto_31225 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31238 - SURFACE
      ?auto_31239 - SURFACE
    )
    :vars
    (
      ?auto_31253 - HOIST
      ?auto_31247 - PLACE
      ?auto_31240 - SURFACE
      ?auto_31251 - PLACE
      ?auto_31242 - HOIST
      ?auto_31248 - SURFACE
      ?auto_31250 - PLACE
      ?auto_31243 - HOIST
      ?auto_31241 - SURFACE
      ?auto_31244 - SURFACE
      ?auto_31252 - PLACE
      ?auto_31245 - HOIST
      ?auto_31249 - SURFACE
      ?auto_31246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31253 ?auto_31247 ) ( IS-CRATE ?auto_31239 ) ( not ( = ?auto_31238 ?auto_31239 ) ) ( not ( = ?auto_31240 ?auto_31238 ) ) ( not ( = ?auto_31240 ?auto_31239 ) ) ( not ( = ?auto_31251 ?auto_31247 ) ) ( HOIST-AT ?auto_31242 ?auto_31251 ) ( not ( = ?auto_31253 ?auto_31242 ) ) ( AVAILABLE ?auto_31242 ) ( SURFACE-AT ?auto_31239 ?auto_31251 ) ( ON ?auto_31239 ?auto_31248 ) ( CLEAR ?auto_31239 ) ( not ( = ?auto_31238 ?auto_31248 ) ) ( not ( = ?auto_31239 ?auto_31248 ) ) ( not ( = ?auto_31240 ?auto_31248 ) ) ( IS-CRATE ?auto_31238 ) ( not ( = ?auto_31250 ?auto_31247 ) ) ( not ( = ?auto_31251 ?auto_31250 ) ) ( HOIST-AT ?auto_31243 ?auto_31250 ) ( not ( = ?auto_31253 ?auto_31243 ) ) ( not ( = ?auto_31242 ?auto_31243 ) ) ( AVAILABLE ?auto_31243 ) ( SURFACE-AT ?auto_31238 ?auto_31250 ) ( ON ?auto_31238 ?auto_31241 ) ( CLEAR ?auto_31238 ) ( not ( = ?auto_31238 ?auto_31241 ) ) ( not ( = ?auto_31239 ?auto_31241 ) ) ( not ( = ?auto_31240 ?auto_31241 ) ) ( not ( = ?auto_31248 ?auto_31241 ) ) ( SURFACE-AT ?auto_31244 ?auto_31247 ) ( CLEAR ?auto_31244 ) ( IS-CRATE ?auto_31240 ) ( not ( = ?auto_31244 ?auto_31240 ) ) ( not ( = ?auto_31238 ?auto_31244 ) ) ( not ( = ?auto_31239 ?auto_31244 ) ) ( not ( = ?auto_31248 ?auto_31244 ) ) ( not ( = ?auto_31241 ?auto_31244 ) ) ( AVAILABLE ?auto_31253 ) ( not ( = ?auto_31252 ?auto_31247 ) ) ( not ( = ?auto_31251 ?auto_31252 ) ) ( not ( = ?auto_31250 ?auto_31252 ) ) ( HOIST-AT ?auto_31245 ?auto_31252 ) ( not ( = ?auto_31253 ?auto_31245 ) ) ( not ( = ?auto_31242 ?auto_31245 ) ) ( not ( = ?auto_31243 ?auto_31245 ) ) ( AVAILABLE ?auto_31245 ) ( SURFACE-AT ?auto_31240 ?auto_31252 ) ( ON ?auto_31240 ?auto_31249 ) ( CLEAR ?auto_31240 ) ( not ( = ?auto_31238 ?auto_31249 ) ) ( not ( = ?auto_31239 ?auto_31249 ) ) ( not ( = ?auto_31240 ?auto_31249 ) ) ( not ( = ?auto_31248 ?auto_31249 ) ) ( not ( = ?auto_31241 ?auto_31249 ) ) ( not ( = ?auto_31244 ?auto_31249 ) ) ( TRUCK-AT ?auto_31246 ?auto_31247 ) )
    :subtasks
    ( ( !DRIVE ?auto_31246 ?auto_31247 ?auto_31252 )
      ( MAKE-2CRATE ?auto_31240 ?auto_31238 ?auto_31239 )
      ( MAKE-1CRATE-VERIFY ?auto_31238 ?auto_31239 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31254 - SURFACE
      ?auto_31255 - SURFACE
      ?auto_31256 - SURFACE
    )
    :vars
    (
      ?auto_31266 - HOIST
      ?auto_31264 - PLACE
      ?auto_31263 - PLACE
      ?auto_31257 - HOIST
      ?auto_31265 - SURFACE
      ?auto_31261 - PLACE
      ?auto_31259 - HOIST
      ?auto_31258 - SURFACE
      ?auto_31268 - SURFACE
      ?auto_31260 - PLACE
      ?auto_31262 - HOIST
      ?auto_31267 - SURFACE
      ?auto_31269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31266 ?auto_31264 ) ( IS-CRATE ?auto_31256 ) ( not ( = ?auto_31255 ?auto_31256 ) ) ( not ( = ?auto_31254 ?auto_31255 ) ) ( not ( = ?auto_31254 ?auto_31256 ) ) ( not ( = ?auto_31263 ?auto_31264 ) ) ( HOIST-AT ?auto_31257 ?auto_31263 ) ( not ( = ?auto_31266 ?auto_31257 ) ) ( AVAILABLE ?auto_31257 ) ( SURFACE-AT ?auto_31256 ?auto_31263 ) ( ON ?auto_31256 ?auto_31265 ) ( CLEAR ?auto_31256 ) ( not ( = ?auto_31255 ?auto_31265 ) ) ( not ( = ?auto_31256 ?auto_31265 ) ) ( not ( = ?auto_31254 ?auto_31265 ) ) ( IS-CRATE ?auto_31255 ) ( not ( = ?auto_31261 ?auto_31264 ) ) ( not ( = ?auto_31263 ?auto_31261 ) ) ( HOIST-AT ?auto_31259 ?auto_31261 ) ( not ( = ?auto_31266 ?auto_31259 ) ) ( not ( = ?auto_31257 ?auto_31259 ) ) ( AVAILABLE ?auto_31259 ) ( SURFACE-AT ?auto_31255 ?auto_31261 ) ( ON ?auto_31255 ?auto_31258 ) ( CLEAR ?auto_31255 ) ( not ( = ?auto_31255 ?auto_31258 ) ) ( not ( = ?auto_31256 ?auto_31258 ) ) ( not ( = ?auto_31254 ?auto_31258 ) ) ( not ( = ?auto_31265 ?auto_31258 ) ) ( SURFACE-AT ?auto_31268 ?auto_31264 ) ( CLEAR ?auto_31268 ) ( IS-CRATE ?auto_31254 ) ( not ( = ?auto_31268 ?auto_31254 ) ) ( not ( = ?auto_31255 ?auto_31268 ) ) ( not ( = ?auto_31256 ?auto_31268 ) ) ( not ( = ?auto_31265 ?auto_31268 ) ) ( not ( = ?auto_31258 ?auto_31268 ) ) ( AVAILABLE ?auto_31266 ) ( not ( = ?auto_31260 ?auto_31264 ) ) ( not ( = ?auto_31263 ?auto_31260 ) ) ( not ( = ?auto_31261 ?auto_31260 ) ) ( HOIST-AT ?auto_31262 ?auto_31260 ) ( not ( = ?auto_31266 ?auto_31262 ) ) ( not ( = ?auto_31257 ?auto_31262 ) ) ( not ( = ?auto_31259 ?auto_31262 ) ) ( AVAILABLE ?auto_31262 ) ( SURFACE-AT ?auto_31254 ?auto_31260 ) ( ON ?auto_31254 ?auto_31267 ) ( CLEAR ?auto_31254 ) ( not ( = ?auto_31255 ?auto_31267 ) ) ( not ( = ?auto_31256 ?auto_31267 ) ) ( not ( = ?auto_31254 ?auto_31267 ) ) ( not ( = ?auto_31265 ?auto_31267 ) ) ( not ( = ?auto_31258 ?auto_31267 ) ) ( not ( = ?auto_31268 ?auto_31267 ) ) ( TRUCK-AT ?auto_31269 ?auto_31264 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31255 ?auto_31256 )
      ( MAKE-2CRATE-VERIFY ?auto_31254 ?auto_31255 ?auto_31256 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31270 - SURFACE
      ?auto_31271 - SURFACE
      ?auto_31272 - SURFACE
      ?auto_31273 - SURFACE
    )
    :vars
    (
      ?auto_31284 - HOIST
      ?auto_31280 - PLACE
      ?auto_31275 - PLACE
      ?auto_31274 - HOIST
      ?auto_31281 - SURFACE
      ?auto_31285 - PLACE
      ?auto_31276 - HOIST
      ?auto_31279 - SURFACE
      ?auto_31283 - PLACE
      ?auto_31282 - HOIST
      ?auto_31278 - SURFACE
      ?auto_31277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31284 ?auto_31280 ) ( IS-CRATE ?auto_31273 ) ( not ( = ?auto_31272 ?auto_31273 ) ) ( not ( = ?auto_31271 ?auto_31272 ) ) ( not ( = ?auto_31271 ?auto_31273 ) ) ( not ( = ?auto_31275 ?auto_31280 ) ) ( HOIST-AT ?auto_31274 ?auto_31275 ) ( not ( = ?auto_31284 ?auto_31274 ) ) ( AVAILABLE ?auto_31274 ) ( SURFACE-AT ?auto_31273 ?auto_31275 ) ( ON ?auto_31273 ?auto_31281 ) ( CLEAR ?auto_31273 ) ( not ( = ?auto_31272 ?auto_31281 ) ) ( not ( = ?auto_31273 ?auto_31281 ) ) ( not ( = ?auto_31271 ?auto_31281 ) ) ( IS-CRATE ?auto_31272 ) ( not ( = ?auto_31285 ?auto_31280 ) ) ( not ( = ?auto_31275 ?auto_31285 ) ) ( HOIST-AT ?auto_31276 ?auto_31285 ) ( not ( = ?auto_31284 ?auto_31276 ) ) ( not ( = ?auto_31274 ?auto_31276 ) ) ( AVAILABLE ?auto_31276 ) ( SURFACE-AT ?auto_31272 ?auto_31285 ) ( ON ?auto_31272 ?auto_31279 ) ( CLEAR ?auto_31272 ) ( not ( = ?auto_31272 ?auto_31279 ) ) ( not ( = ?auto_31273 ?auto_31279 ) ) ( not ( = ?auto_31271 ?auto_31279 ) ) ( not ( = ?auto_31281 ?auto_31279 ) ) ( SURFACE-AT ?auto_31270 ?auto_31280 ) ( CLEAR ?auto_31270 ) ( IS-CRATE ?auto_31271 ) ( not ( = ?auto_31270 ?auto_31271 ) ) ( not ( = ?auto_31272 ?auto_31270 ) ) ( not ( = ?auto_31273 ?auto_31270 ) ) ( not ( = ?auto_31281 ?auto_31270 ) ) ( not ( = ?auto_31279 ?auto_31270 ) ) ( AVAILABLE ?auto_31284 ) ( not ( = ?auto_31283 ?auto_31280 ) ) ( not ( = ?auto_31275 ?auto_31283 ) ) ( not ( = ?auto_31285 ?auto_31283 ) ) ( HOIST-AT ?auto_31282 ?auto_31283 ) ( not ( = ?auto_31284 ?auto_31282 ) ) ( not ( = ?auto_31274 ?auto_31282 ) ) ( not ( = ?auto_31276 ?auto_31282 ) ) ( AVAILABLE ?auto_31282 ) ( SURFACE-AT ?auto_31271 ?auto_31283 ) ( ON ?auto_31271 ?auto_31278 ) ( CLEAR ?auto_31271 ) ( not ( = ?auto_31272 ?auto_31278 ) ) ( not ( = ?auto_31273 ?auto_31278 ) ) ( not ( = ?auto_31271 ?auto_31278 ) ) ( not ( = ?auto_31281 ?auto_31278 ) ) ( not ( = ?auto_31279 ?auto_31278 ) ) ( not ( = ?auto_31270 ?auto_31278 ) ) ( TRUCK-AT ?auto_31277 ?auto_31280 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31271 ?auto_31272 ?auto_31273 )
      ( MAKE-3CRATE-VERIFY ?auto_31270 ?auto_31271 ?auto_31272 ?auto_31273 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31286 - SURFACE
      ?auto_31287 - SURFACE
      ?auto_31288 - SURFACE
      ?auto_31289 - SURFACE
      ?auto_31290 - SURFACE
    )
    :vars
    (
      ?auto_31301 - HOIST
      ?auto_31297 - PLACE
      ?auto_31292 - PLACE
      ?auto_31291 - HOIST
      ?auto_31298 - SURFACE
      ?auto_31302 - PLACE
      ?auto_31293 - HOIST
      ?auto_31296 - SURFACE
      ?auto_31300 - PLACE
      ?auto_31299 - HOIST
      ?auto_31295 - SURFACE
      ?auto_31294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31301 ?auto_31297 ) ( IS-CRATE ?auto_31290 ) ( not ( = ?auto_31289 ?auto_31290 ) ) ( not ( = ?auto_31288 ?auto_31289 ) ) ( not ( = ?auto_31288 ?auto_31290 ) ) ( not ( = ?auto_31292 ?auto_31297 ) ) ( HOIST-AT ?auto_31291 ?auto_31292 ) ( not ( = ?auto_31301 ?auto_31291 ) ) ( AVAILABLE ?auto_31291 ) ( SURFACE-AT ?auto_31290 ?auto_31292 ) ( ON ?auto_31290 ?auto_31298 ) ( CLEAR ?auto_31290 ) ( not ( = ?auto_31289 ?auto_31298 ) ) ( not ( = ?auto_31290 ?auto_31298 ) ) ( not ( = ?auto_31288 ?auto_31298 ) ) ( IS-CRATE ?auto_31289 ) ( not ( = ?auto_31302 ?auto_31297 ) ) ( not ( = ?auto_31292 ?auto_31302 ) ) ( HOIST-AT ?auto_31293 ?auto_31302 ) ( not ( = ?auto_31301 ?auto_31293 ) ) ( not ( = ?auto_31291 ?auto_31293 ) ) ( AVAILABLE ?auto_31293 ) ( SURFACE-AT ?auto_31289 ?auto_31302 ) ( ON ?auto_31289 ?auto_31296 ) ( CLEAR ?auto_31289 ) ( not ( = ?auto_31289 ?auto_31296 ) ) ( not ( = ?auto_31290 ?auto_31296 ) ) ( not ( = ?auto_31288 ?auto_31296 ) ) ( not ( = ?auto_31298 ?auto_31296 ) ) ( SURFACE-AT ?auto_31287 ?auto_31297 ) ( CLEAR ?auto_31287 ) ( IS-CRATE ?auto_31288 ) ( not ( = ?auto_31287 ?auto_31288 ) ) ( not ( = ?auto_31289 ?auto_31287 ) ) ( not ( = ?auto_31290 ?auto_31287 ) ) ( not ( = ?auto_31298 ?auto_31287 ) ) ( not ( = ?auto_31296 ?auto_31287 ) ) ( AVAILABLE ?auto_31301 ) ( not ( = ?auto_31300 ?auto_31297 ) ) ( not ( = ?auto_31292 ?auto_31300 ) ) ( not ( = ?auto_31302 ?auto_31300 ) ) ( HOIST-AT ?auto_31299 ?auto_31300 ) ( not ( = ?auto_31301 ?auto_31299 ) ) ( not ( = ?auto_31291 ?auto_31299 ) ) ( not ( = ?auto_31293 ?auto_31299 ) ) ( AVAILABLE ?auto_31299 ) ( SURFACE-AT ?auto_31288 ?auto_31300 ) ( ON ?auto_31288 ?auto_31295 ) ( CLEAR ?auto_31288 ) ( not ( = ?auto_31289 ?auto_31295 ) ) ( not ( = ?auto_31290 ?auto_31295 ) ) ( not ( = ?auto_31288 ?auto_31295 ) ) ( not ( = ?auto_31298 ?auto_31295 ) ) ( not ( = ?auto_31296 ?auto_31295 ) ) ( not ( = ?auto_31287 ?auto_31295 ) ) ( TRUCK-AT ?auto_31294 ?auto_31297 ) ( ON ?auto_31287 ?auto_31286 ) ( not ( = ?auto_31286 ?auto_31287 ) ) ( not ( = ?auto_31286 ?auto_31288 ) ) ( not ( = ?auto_31286 ?auto_31289 ) ) ( not ( = ?auto_31286 ?auto_31290 ) ) ( not ( = ?auto_31286 ?auto_31298 ) ) ( not ( = ?auto_31286 ?auto_31296 ) ) ( not ( = ?auto_31286 ?auto_31295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31288 ?auto_31289 ?auto_31290 )
      ( MAKE-4CRATE-VERIFY ?auto_31286 ?auto_31287 ?auto_31288 ?auto_31289 ?auto_31290 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31303 - SURFACE
      ?auto_31304 - SURFACE
      ?auto_31305 - SURFACE
      ?auto_31306 - SURFACE
      ?auto_31307 - SURFACE
      ?auto_31308 - SURFACE
    )
    :vars
    (
      ?auto_31319 - HOIST
      ?auto_31315 - PLACE
      ?auto_31310 - PLACE
      ?auto_31309 - HOIST
      ?auto_31316 - SURFACE
      ?auto_31320 - PLACE
      ?auto_31311 - HOIST
      ?auto_31314 - SURFACE
      ?auto_31318 - PLACE
      ?auto_31317 - HOIST
      ?auto_31313 - SURFACE
      ?auto_31312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31319 ?auto_31315 ) ( IS-CRATE ?auto_31308 ) ( not ( = ?auto_31307 ?auto_31308 ) ) ( not ( = ?auto_31306 ?auto_31307 ) ) ( not ( = ?auto_31306 ?auto_31308 ) ) ( not ( = ?auto_31310 ?auto_31315 ) ) ( HOIST-AT ?auto_31309 ?auto_31310 ) ( not ( = ?auto_31319 ?auto_31309 ) ) ( AVAILABLE ?auto_31309 ) ( SURFACE-AT ?auto_31308 ?auto_31310 ) ( ON ?auto_31308 ?auto_31316 ) ( CLEAR ?auto_31308 ) ( not ( = ?auto_31307 ?auto_31316 ) ) ( not ( = ?auto_31308 ?auto_31316 ) ) ( not ( = ?auto_31306 ?auto_31316 ) ) ( IS-CRATE ?auto_31307 ) ( not ( = ?auto_31320 ?auto_31315 ) ) ( not ( = ?auto_31310 ?auto_31320 ) ) ( HOIST-AT ?auto_31311 ?auto_31320 ) ( not ( = ?auto_31319 ?auto_31311 ) ) ( not ( = ?auto_31309 ?auto_31311 ) ) ( AVAILABLE ?auto_31311 ) ( SURFACE-AT ?auto_31307 ?auto_31320 ) ( ON ?auto_31307 ?auto_31314 ) ( CLEAR ?auto_31307 ) ( not ( = ?auto_31307 ?auto_31314 ) ) ( not ( = ?auto_31308 ?auto_31314 ) ) ( not ( = ?auto_31306 ?auto_31314 ) ) ( not ( = ?auto_31316 ?auto_31314 ) ) ( SURFACE-AT ?auto_31305 ?auto_31315 ) ( CLEAR ?auto_31305 ) ( IS-CRATE ?auto_31306 ) ( not ( = ?auto_31305 ?auto_31306 ) ) ( not ( = ?auto_31307 ?auto_31305 ) ) ( not ( = ?auto_31308 ?auto_31305 ) ) ( not ( = ?auto_31316 ?auto_31305 ) ) ( not ( = ?auto_31314 ?auto_31305 ) ) ( AVAILABLE ?auto_31319 ) ( not ( = ?auto_31318 ?auto_31315 ) ) ( not ( = ?auto_31310 ?auto_31318 ) ) ( not ( = ?auto_31320 ?auto_31318 ) ) ( HOIST-AT ?auto_31317 ?auto_31318 ) ( not ( = ?auto_31319 ?auto_31317 ) ) ( not ( = ?auto_31309 ?auto_31317 ) ) ( not ( = ?auto_31311 ?auto_31317 ) ) ( AVAILABLE ?auto_31317 ) ( SURFACE-AT ?auto_31306 ?auto_31318 ) ( ON ?auto_31306 ?auto_31313 ) ( CLEAR ?auto_31306 ) ( not ( = ?auto_31307 ?auto_31313 ) ) ( not ( = ?auto_31308 ?auto_31313 ) ) ( not ( = ?auto_31306 ?auto_31313 ) ) ( not ( = ?auto_31316 ?auto_31313 ) ) ( not ( = ?auto_31314 ?auto_31313 ) ) ( not ( = ?auto_31305 ?auto_31313 ) ) ( TRUCK-AT ?auto_31312 ?auto_31315 ) ( ON ?auto_31304 ?auto_31303 ) ( ON ?auto_31305 ?auto_31304 ) ( not ( = ?auto_31303 ?auto_31304 ) ) ( not ( = ?auto_31303 ?auto_31305 ) ) ( not ( = ?auto_31303 ?auto_31306 ) ) ( not ( = ?auto_31303 ?auto_31307 ) ) ( not ( = ?auto_31303 ?auto_31308 ) ) ( not ( = ?auto_31303 ?auto_31316 ) ) ( not ( = ?auto_31303 ?auto_31314 ) ) ( not ( = ?auto_31303 ?auto_31313 ) ) ( not ( = ?auto_31304 ?auto_31305 ) ) ( not ( = ?auto_31304 ?auto_31306 ) ) ( not ( = ?auto_31304 ?auto_31307 ) ) ( not ( = ?auto_31304 ?auto_31308 ) ) ( not ( = ?auto_31304 ?auto_31316 ) ) ( not ( = ?auto_31304 ?auto_31314 ) ) ( not ( = ?auto_31304 ?auto_31313 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31306 ?auto_31307 ?auto_31308 )
      ( MAKE-5CRATE-VERIFY ?auto_31303 ?auto_31304 ?auto_31305 ?auto_31306 ?auto_31307 ?auto_31308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31321 - SURFACE
      ?auto_31322 - SURFACE
    )
    :vars
    (
      ?auto_31334 - HOIST
      ?auto_31330 - PLACE
      ?auto_31326 - SURFACE
      ?auto_31324 - PLACE
      ?auto_31323 - HOIST
      ?auto_31331 - SURFACE
      ?auto_31336 - PLACE
      ?auto_31325 - HOIST
      ?auto_31329 - SURFACE
      ?auto_31335 - SURFACE
      ?auto_31333 - PLACE
      ?auto_31332 - HOIST
      ?auto_31328 - SURFACE
      ?auto_31327 - TRUCK
      ?auto_31337 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31334 ?auto_31330 ) ( IS-CRATE ?auto_31322 ) ( not ( = ?auto_31321 ?auto_31322 ) ) ( not ( = ?auto_31326 ?auto_31321 ) ) ( not ( = ?auto_31326 ?auto_31322 ) ) ( not ( = ?auto_31324 ?auto_31330 ) ) ( HOIST-AT ?auto_31323 ?auto_31324 ) ( not ( = ?auto_31334 ?auto_31323 ) ) ( AVAILABLE ?auto_31323 ) ( SURFACE-AT ?auto_31322 ?auto_31324 ) ( ON ?auto_31322 ?auto_31331 ) ( CLEAR ?auto_31322 ) ( not ( = ?auto_31321 ?auto_31331 ) ) ( not ( = ?auto_31322 ?auto_31331 ) ) ( not ( = ?auto_31326 ?auto_31331 ) ) ( IS-CRATE ?auto_31321 ) ( not ( = ?auto_31336 ?auto_31330 ) ) ( not ( = ?auto_31324 ?auto_31336 ) ) ( HOIST-AT ?auto_31325 ?auto_31336 ) ( not ( = ?auto_31334 ?auto_31325 ) ) ( not ( = ?auto_31323 ?auto_31325 ) ) ( AVAILABLE ?auto_31325 ) ( SURFACE-AT ?auto_31321 ?auto_31336 ) ( ON ?auto_31321 ?auto_31329 ) ( CLEAR ?auto_31321 ) ( not ( = ?auto_31321 ?auto_31329 ) ) ( not ( = ?auto_31322 ?auto_31329 ) ) ( not ( = ?auto_31326 ?auto_31329 ) ) ( not ( = ?auto_31331 ?auto_31329 ) ) ( IS-CRATE ?auto_31326 ) ( not ( = ?auto_31335 ?auto_31326 ) ) ( not ( = ?auto_31321 ?auto_31335 ) ) ( not ( = ?auto_31322 ?auto_31335 ) ) ( not ( = ?auto_31331 ?auto_31335 ) ) ( not ( = ?auto_31329 ?auto_31335 ) ) ( not ( = ?auto_31333 ?auto_31330 ) ) ( not ( = ?auto_31324 ?auto_31333 ) ) ( not ( = ?auto_31336 ?auto_31333 ) ) ( HOIST-AT ?auto_31332 ?auto_31333 ) ( not ( = ?auto_31334 ?auto_31332 ) ) ( not ( = ?auto_31323 ?auto_31332 ) ) ( not ( = ?auto_31325 ?auto_31332 ) ) ( AVAILABLE ?auto_31332 ) ( SURFACE-AT ?auto_31326 ?auto_31333 ) ( ON ?auto_31326 ?auto_31328 ) ( CLEAR ?auto_31326 ) ( not ( = ?auto_31321 ?auto_31328 ) ) ( not ( = ?auto_31322 ?auto_31328 ) ) ( not ( = ?auto_31326 ?auto_31328 ) ) ( not ( = ?auto_31331 ?auto_31328 ) ) ( not ( = ?auto_31329 ?auto_31328 ) ) ( not ( = ?auto_31335 ?auto_31328 ) ) ( TRUCK-AT ?auto_31327 ?auto_31330 ) ( SURFACE-AT ?auto_31337 ?auto_31330 ) ( CLEAR ?auto_31337 ) ( LIFTING ?auto_31334 ?auto_31335 ) ( IS-CRATE ?auto_31335 ) ( not ( = ?auto_31337 ?auto_31335 ) ) ( not ( = ?auto_31321 ?auto_31337 ) ) ( not ( = ?auto_31322 ?auto_31337 ) ) ( not ( = ?auto_31326 ?auto_31337 ) ) ( not ( = ?auto_31331 ?auto_31337 ) ) ( not ( = ?auto_31329 ?auto_31337 ) ) ( not ( = ?auto_31328 ?auto_31337 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31337 ?auto_31335 )
      ( MAKE-2CRATE ?auto_31326 ?auto_31321 ?auto_31322 )
      ( MAKE-1CRATE-VERIFY ?auto_31321 ?auto_31322 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31338 - SURFACE
      ?auto_31339 - SURFACE
      ?auto_31340 - SURFACE
    )
    :vars
    (
      ?auto_31352 - HOIST
      ?auto_31347 - PLACE
      ?auto_31341 - PLACE
      ?auto_31354 - HOIST
      ?auto_31346 - SURFACE
      ?auto_31343 - PLACE
      ?auto_31353 - HOIST
      ?auto_31345 - SURFACE
      ?auto_31348 - SURFACE
      ?auto_31344 - PLACE
      ?auto_31342 - HOIST
      ?auto_31351 - SURFACE
      ?auto_31350 - TRUCK
      ?auto_31349 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31352 ?auto_31347 ) ( IS-CRATE ?auto_31340 ) ( not ( = ?auto_31339 ?auto_31340 ) ) ( not ( = ?auto_31338 ?auto_31339 ) ) ( not ( = ?auto_31338 ?auto_31340 ) ) ( not ( = ?auto_31341 ?auto_31347 ) ) ( HOIST-AT ?auto_31354 ?auto_31341 ) ( not ( = ?auto_31352 ?auto_31354 ) ) ( AVAILABLE ?auto_31354 ) ( SURFACE-AT ?auto_31340 ?auto_31341 ) ( ON ?auto_31340 ?auto_31346 ) ( CLEAR ?auto_31340 ) ( not ( = ?auto_31339 ?auto_31346 ) ) ( not ( = ?auto_31340 ?auto_31346 ) ) ( not ( = ?auto_31338 ?auto_31346 ) ) ( IS-CRATE ?auto_31339 ) ( not ( = ?auto_31343 ?auto_31347 ) ) ( not ( = ?auto_31341 ?auto_31343 ) ) ( HOIST-AT ?auto_31353 ?auto_31343 ) ( not ( = ?auto_31352 ?auto_31353 ) ) ( not ( = ?auto_31354 ?auto_31353 ) ) ( AVAILABLE ?auto_31353 ) ( SURFACE-AT ?auto_31339 ?auto_31343 ) ( ON ?auto_31339 ?auto_31345 ) ( CLEAR ?auto_31339 ) ( not ( = ?auto_31339 ?auto_31345 ) ) ( not ( = ?auto_31340 ?auto_31345 ) ) ( not ( = ?auto_31338 ?auto_31345 ) ) ( not ( = ?auto_31346 ?auto_31345 ) ) ( IS-CRATE ?auto_31338 ) ( not ( = ?auto_31348 ?auto_31338 ) ) ( not ( = ?auto_31339 ?auto_31348 ) ) ( not ( = ?auto_31340 ?auto_31348 ) ) ( not ( = ?auto_31346 ?auto_31348 ) ) ( not ( = ?auto_31345 ?auto_31348 ) ) ( not ( = ?auto_31344 ?auto_31347 ) ) ( not ( = ?auto_31341 ?auto_31344 ) ) ( not ( = ?auto_31343 ?auto_31344 ) ) ( HOIST-AT ?auto_31342 ?auto_31344 ) ( not ( = ?auto_31352 ?auto_31342 ) ) ( not ( = ?auto_31354 ?auto_31342 ) ) ( not ( = ?auto_31353 ?auto_31342 ) ) ( AVAILABLE ?auto_31342 ) ( SURFACE-AT ?auto_31338 ?auto_31344 ) ( ON ?auto_31338 ?auto_31351 ) ( CLEAR ?auto_31338 ) ( not ( = ?auto_31339 ?auto_31351 ) ) ( not ( = ?auto_31340 ?auto_31351 ) ) ( not ( = ?auto_31338 ?auto_31351 ) ) ( not ( = ?auto_31346 ?auto_31351 ) ) ( not ( = ?auto_31345 ?auto_31351 ) ) ( not ( = ?auto_31348 ?auto_31351 ) ) ( TRUCK-AT ?auto_31350 ?auto_31347 ) ( SURFACE-AT ?auto_31349 ?auto_31347 ) ( CLEAR ?auto_31349 ) ( LIFTING ?auto_31352 ?auto_31348 ) ( IS-CRATE ?auto_31348 ) ( not ( = ?auto_31349 ?auto_31348 ) ) ( not ( = ?auto_31339 ?auto_31349 ) ) ( not ( = ?auto_31340 ?auto_31349 ) ) ( not ( = ?auto_31338 ?auto_31349 ) ) ( not ( = ?auto_31346 ?auto_31349 ) ) ( not ( = ?auto_31345 ?auto_31349 ) ) ( not ( = ?auto_31351 ?auto_31349 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31339 ?auto_31340 )
      ( MAKE-2CRATE-VERIFY ?auto_31338 ?auto_31339 ?auto_31340 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31355 - SURFACE
      ?auto_31356 - SURFACE
      ?auto_31357 - SURFACE
      ?auto_31358 - SURFACE
    )
    :vars
    (
      ?auto_31371 - HOIST
      ?auto_31364 - PLACE
      ?auto_31363 - PLACE
      ?auto_31360 - HOIST
      ?auto_31369 - SURFACE
      ?auto_31370 - PLACE
      ?auto_31359 - HOIST
      ?auto_31366 - SURFACE
      ?auto_31368 - PLACE
      ?auto_31365 - HOIST
      ?auto_31361 - SURFACE
      ?auto_31362 - TRUCK
      ?auto_31367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31371 ?auto_31364 ) ( IS-CRATE ?auto_31358 ) ( not ( = ?auto_31357 ?auto_31358 ) ) ( not ( = ?auto_31356 ?auto_31357 ) ) ( not ( = ?auto_31356 ?auto_31358 ) ) ( not ( = ?auto_31363 ?auto_31364 ) ) ( HOIST-AT ?auto_31360 ?auto_31363 ) ( not ( = ?auto_31371 ?auto_31360 ) ) ( AVAILABLE ?auto_31360 ) ( SURFACE-AT ?auto_31358 ?auto_31363 ) ( ON ?auto_31358 ?auto_31369 ) ( CLEAR ?auto_31358 ) ( not ( = ?auto_31357 ?auto_31369 ) ) ( not ( = ?auto_31358 ?auto_31369 ) ) ( not ( = ?auto_31356 ?auto_31369 ) ) ( IS-CRATE ?auto_31357 ) ( not ( = ?auto_31370 ?auto_31364 ) ) ( not ( = ?auto_31363 ?auto_31370 ) ) ( HOIST-AT ?auto_31359 ?auto_31370 ) ( not ( = ?auto_31371 ?auto_31359 ) ) ( not ( = ?auto_31360 ?auto_31359 ) ) ( AVAILABLE ?auto_31359 ) ( SURFACE-AT ?auto_31357 ?auto_31370 ) ( ON ?auto_31357 ?auto_31366 ) ( CLEAR ?auto_31357 ) ( not ( = ?auto_31357 ?auto_31366 ) ) ( not ( = ?auto_31358 ?auto_31366 ) ) ( not ( = ?auto_31356 ?auto_31366 ) ) ( not ( = ?auto_31369 ?auto_31366 ) ) ( IS-CRATE ?auto_31356 ) ( not ( = ?auto_31355 ?auto_31356 ) ) ( not ( = ?auto_31357 ?auto_31355 ) ) ( not ( = ?auto_31358 ?auto_31355 ) ) ( not ( = ?auto_31369 ?auto_31355 ) ) ( not ( = ?auto_31366 ?auto_31355 ) ) ( not ( = ?auto_31368 ?auto_31364 ) ) ( not ( = ?auto_31363 ?auto_31368 ) ) ( not ( = ?auto_31370 ?auto_31368 ) ) ( HOIST-AT ?auto_31365 ?auto_31368 ) ( not ( = ?auto_31371 ?auto_31365 ) ) ( not ( = ?auto_31360 ?auto_31365 ) ) ( not ( = ?auto_31359 ?auto_31365 ) ) ( AVAILABLE ?auto_31365 ) ( SURFACE-AT ?auto_31356 ?auto_31368 ) ( ON ?auto_31356 ?auto_31361 ) ( CLEAR ?auto_31356 ) ( not ( = ?auto_31357 ?auto_31361 ) ) ( not ( = ?auto_31358 ?auto_31361 ) ) ( not ( = ?auto_31356 ?auto_31361 ) ) ( not ( = ?auto_31369 ?auto_31361 ) ) ( not ( = ?auto_31366 ?auto_31361 ) ) ( not ( = ?auto_31355 ?auto_31361 ) ) ( TRUCK-AT ?auto_31362 ?auto_31364 ) ( SURFACE-AT ?auto_31367 ?auto_31364 ) ( CLEAR ?auto_31367 ) ( LIFTING ?auto_31371 ?auto_31355 ) ( IS-CRATE ?auto_31355 ) ( not ( = ?auto_31367 ?auto_31355 ) ) ( not ( = ?auto_31357 ?auto_31367 ) ) ( not ( = ?auto_31358 ?auto_31367 ) ) ( not ( = ?auto_31356 ?auto_31367 ) ) ( not ( = ?auto_31369 ?auto_31367 ) ) ( not ( = ?auto_31366 ?auto_31367 ) ) ( not ( = ?auto_31361 ?auto_31367 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31356 ?auto_31357 ?auto_31358 )
      ( MAKE-3CRATE-VERIFY ?auto_31355 ?auto_31356 ?auto_31357 ?auto_31358 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31372 - SURFACE
      ?auto_31373 - SURFACE
      ?auto_31374 - SURFACE
      ?auto_31375 - SURFACE
      ?auto_31376 - SURFACE
    )
    :vars
    (
      ?auto_31388 - HOIST
      ?auto_31382 - PLACE
      ?auto_31381 - PLACE
      ?auto_31378 - HOIST
      ?auto_31386 - SURFACE
      ?auto_31387 - PLACE
      ?auto_31377 - HOIST
      ?auto_31384 - SURFACE
      ?auto_31385 - PLACE
      ?auto_31383 - HOIST
      ?auto_31379 - SURFACE
      ?auto_31380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31388 ?auto_31382 ) ( IS-CRATE ?auto_31376 ) ( not ( = ?auto_31375 ?auto_31376 ) ) ( not ( = ?auto_31374 ?auto_31375 ) ) ( not ( = ?auto_31374 ?auto_31376 ) ) ( not ( = ?auto_31381 ?auto_31382 ) ) ( HOIST-AT ?auto_31378 ?auto_31381 ) ( not ( = ?auto_31388 ?auto_31378 ) ) ( AVAILABLE ?auto_31378 ) ( SURFACE-AT ?auto_31376 ?auto_31381 ) ( ON ?auto_31376 ?auto_31386 ) ( CLEAR ?auto_31376 ) ( not ( = ?auto_31375 ?auto_31386 ) ) ( not ( = ?auto_31376 ?auto_31386 ) ) ( not ( = ?auto_31374 ?auto_31386 ) ) ( IS-CRATE ?auto_31375 ) ( not ( = ?auto_31387 ?auto_31382 ) ) ( not ( = ?auto_31381 ?auto_31387 ) ) ( HOIST-AT ?auto_31377 ?auto_31387 ) ( not ( = ?auto_31388 ?auto_31377 ) ) ( not ( = ?auto_31378 ?auto_31377 ) ) ( AVAILABLE ?auto_31377 ) ( SURFACE-AT ?auto_31375 ?auto_31387 ) ( ON ?auto_31375 ?auto_31384 ) ( CLEAR ?auto_31375 ) ( not ( = ?auto_31375 ?auto_31384 ) ) ( not ( = ?auto_31376 ?auto_31384 ) ) ( not ( = ?auto_31374 ?auto_31384 ) ) ( not ( = ?auto_31386 ?auto_31384 ) ) ( IS-CRATE ?auto_31374 ) ( not ( = ?auto_31373 ?auto_31374 ) ) ( not ( = ?auto_31375 ?auto_31373 ) ) ( not ( = ?auto_31376 ?auto_31373 ) ) ( not ( = ?auto_31386 ?auto_31373 ) ) ( not ( = ?auto_31384 ?auto_31373 ) ) ( not ( = ?auto_31385 ?auto_31382 ) ) ( not ( = ?auto_31381 ?auto_31385 ) ) ( not ( = ?auto_31387 ?auto_31385 ) ) ( HOIST-AT ?auto_31383 ?auto_31385 ) ( not ( = ?auto_31388 ?auto_31383 ) ) ( not ( = ?auto_31378 ?auto_31383 ) ) ( not ( = ?auto_31377 ?auto_31383 ) ) ( AVAILABLE ?auto_31383 ) ( SURFACE-AT ?auto_31374 ?auto_31385 ) ( ON ?auto_31374 ?auto_31379 ) ( CLEAR ?auto_31374 ) ( not ( = ?auto_31375 ?auto_31379 ) ) ( not ( = ?auto_31376 ?auto_31379 ) ) ( not ( = ?auto_31374 ?auto_31379 ) ) ( not ( = ?auto_31386 ?auto_31379 ) ) ( not ( = ?auto_31384 ?auto_31379 ) ) ( not ( = ?auto_31373 ?auto_31379 ) ) ( TRUCK-AT ?auto_31380 ?auto_31382 ) ( SURFACE-AT ?auto_31372 ?auto_31382 ) ( CLEAR ?auto_31372 ) ( LIFTING ?auto_31388 ?auto_31373 ) ( IS-CRATE ?auto_31373 ) ( not ( = ?auto_31372 ?auto_31373 ) ) ( not ( = ?auto_31375 ?auto_31372 ) ) ( not ( = ?auto_31376 ?auto_31372 ) ) ( not ( = ?auto_31374 ?auto_31372 ) ) ( not ( = ?auto_31386 ?auto_31372 ) ) ( not ( = ?auto_31384 ?auto_31372 ) ) ( not ( = ?auto_31379 ?auto_31372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31374 ?auto_31375 ?auto_31376 )
      ( MAKE-4CRATE-VERIFY ?auto_31372 ?auto_31373 ?auto_31374 ?auto_31375 ?auto_31376 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31389 - SURFACE
      ?auto_31390 - SURFACE
      ?auto_31391 - SURFACE
      ?auto_31392 - SURFACE
      ?auto_31393 - SURFACE
      ?auto_31394 - SURFACE
    )
    :vars
    (
      ?auto_31406 - HOIST
      ?auto_31400 - PLACE
      ?auto_31399 - PLACE
      ?auto_31396 - HOIST
      ?auto_31404 - SURFACE
      ?auto_31405 - PLACE
      ?auto_31395 - HOIST
      ?auto_31402 - SURFACE
      ?auto_31403 - PLACE
      ?auto_31401 - HOIST
      ?auto_31397 - SURFACE
      ?auto_31398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31406 ?auto_31400 ) ( IS-CRATE ?auto_31394 ) ( not ( = ?auto_31393 ?auto_31394 ) ) ( not ( = ?auto_31392 ?auto_31393 ) ) ( not ( = ?auto_31392 ?auto_31394 ) ) ( not ( = ?auto_31399 ?auto_31400 ) ) ( HOIST-AT ?auto_31396 ?auto_31399 ) ( not ( = ?auto_31406 ?auto_31396 ) ) ( AVAILABLE ?auto_31396 ) ( SURFACE-AT ?auto_31394 ?auto_31399 ) ( ON ?auto_31394 ?auto_31404 ) ( CLEAR ?auto_31394 ) ( not ( = ?auto_31393 ?auto_31404 ) ) ( not ( = ?auto_31394 ?auto_31404 ) ) ( not ( = ?auto_31392 ?auto_31404 ) ) ( IS-CRATE ?auto_31393 ) ( not ( = ?auto_31405 ?auto_31400 ) ) ( not ( = ?auto_31399 ?auto_31405 ) ) ( HOIST-AT ?auto_31395 ?auto_31405 ) ( not ( = ?auto_31406 ?auto_31395 ) ) ( not ( = ?auto_31396 ?auto_31395 ) ) ( AVAILABLE ?auto_31395 ) ( SURFACE-AT ?auto_31393 ?auto_31405 ) ( ON ?auto_31393 ?auto_31402 ) ( CLEAR ?auto_31393 ) ( not ( = ?auto_31393 ?auto_31402 ) ) ( not ( = ?auto_31394 ?auto_31402 ) ) ( not ( = ?auto_31392 ?auto_31402 ) ) ( not ( = ?auto_31404 ?auto_31402 ) ) ( IS-CRATE ?auto_31392 ) ( not ( = ?auto_31391 ?auto_31392 ) ) ( not ( = ?auto_31393 ?auto_31391 ) ) ( not ( = ?auto_31394 ?auto_31391 ) ) ( not ( = ?auto_31404 ?auto_31391 ) ) ( not ( = ?auto_31402 ?auto_31391 ) ) ( not ( = ?auto_31403 ?auto_31400 ) ) ( not ( = ?auto_31399 ?auto_31403 ) ) ( not ( = ?auto_31405 ?auto_31403 ) ) ( HOIST-AT ?auto_31401 ?auto_31403 ) ( not ( = ?auto_31406 ?auto_31401 ) ) ( not ( = ?auto_31396 ?auto_31401 ) ) ( not ( = ?auto_31395 ?auto_31401 ) ) ( AVAILABLE ?auto_31401 ) ( SURFACE-AT ?auto_31392 ?auto_31403 ) ( ON ?auto_31392 ?auto_31397 ) ( CLEAR ?auto_31392 ) ( not ( = ?auto_31393 ?auto_31397 ) ) ( not ( = ?auto_31394 ?auto_31397 ) ) ( not ( = ?auto_31392 ?auto_31397 ) ) ( not ( = ?auto_31404 ?auto_31397 ) ) ( not ( = ?auto_31402 ?auto_31397 ) ) ( not ( = ?auto_31391 ?auto_31397 ) ) ( TRUCK-AT ?auto_31398 ?auto_31400 ) ( SURFACE-AT ?auto_31390 ?auto_31400 ) ( CLEAR ?auto_31390 ) ( LIFTING ?auto_31406 ?auto_31391 ) ( IS-CRATE ?auto_31391 ) ( not ( = ?auto_31390 ?auto_31391 ) ) ( not ( = ?auto_31393 ?auto_31390 ) ) ( not ( = ?auto_31394 ?auto_31390 ) ) ( not ( = ?auto_31392 ?auto_31390 ) ) ( not ( = ?auto_31404 ?auto_31390 ) ) ( not ( = ?auto_31402 ?auto_31390 ) ) ( not ( = ?auto_31397 ?auto_31390 ) ) ( ON ?auto_31390 ?auto_31389 ) ( not ( = ?auto_31389 ?auto_31390 ) ) ( not ( = ?auto_31389 ?auto_31391 ) ) ( not ( = ?auto_31389 ?auto_31392 ) ) ( not ( = ?auto_31389 ?auto_31393 ) ) ( not ( = ?auto_31389 ?auto_31394 ) ) ( not ( = ?auto_31389 ?auto_31404 ) ) ( not ( = ?auto_31389 ?auto_31402 ) ) ( not ( = ?auto_31389 ?auto_31397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31392 ?auto_31393 ?auto_31394 )
      ( MAKE-5CRATE-VERIFY ?auto_31389 ?auto_31390 ?auto_31391 ?auto_31392 ?auto_31393 ?auto_31394 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31407 - SURFACE
      ?auto_31408 - SURFACE
    )
    :vars
    (
      ?auto_31423 - HOIST
      ?auto_31416 - PLACE
      ?auto_31410 - SURFACE
      ?auto_31415 - PLACE
      ?auto_31412 - HOIST
      ?auto_31421 - SURFACE
      ?auto_31422 - PLACE
      ?auto_31409 - HOIST
      ?auto_31418 - SURFACE
      ?auto_31411 - SURFACE
      ?auto_31420 - PLACE
      ?auto_31417 - HOIST
      ?auto_31413 - SURFACE
      ?auto_31414 - TRUCK
      ?auto_31419 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31423 ?auto_31416 ) ( IS-CRATE ?auto_31408 ) ( not ( = ?auto_31407 ?auto_31408 ) ) ( not ( = ?auto_31410 ?auto_31407 ) ) ( not ( = ?auto_31410 ?auto_31408 ) ) ( not ( = ?auto_31415 ?auto_31416 ) ) ( HOIST-AT ?auto_31412 ?auto_31415 ) ( not ( = ?auto_31423 ?auto_31412 ) ) ( AVAILABLE ?auto_31412 ) ( SURFACE-AT ?auto_31408 ?auto_31415 ) ( ON ?auto_31408 ?auto_31421 ) ( CLEAR ?auto_31408 ) ( not ( = ?auto_31407 ?auto_31421 ) ) ( not ( = ?auto_31408 ?auto_31421 ) ) ( not ( = ?auto_31410 ?auto_31421 ) ) ( IS-CRATE ?auto_31407 ) ( not ( = ?auto_31422 ?auto_31416 ) ) ( not ( = ?auto_31415 ?auto_31422 ) ) ( HOIST-AT ?auto_31409 ?auto_31422 ) ( not ( = ?auto_31423 ?auto_31409 ) ) ( not ( = ?auto_31412 ?auto_31409 ) ) ( AVAILABLE ?auto_31409 ) ( SURFACE-AT ?auto_31407 ?auto_31422 ) ( ON ?auto_31407 ?auto_31418 ) ( CLEAR ?auto_31407 ) ( not ( = ?auto_31407 ?auto_31418 ) ) ( not ( = ?auto_31408 ?auto_31418 ) ) ( not ( = ?auto_31410 ?auto_31418 ) ) ( not ( = ?auto_31421 ?auto_31418 ) ) ( IS-CRATE ?auto_31410 ) ( not ( = ?auto_31411 ?auto_31410 ) ) ( not ( = ?auto_31407 ?auto_31411 ) ) ( not ( = ?auto_31408 ?auto_31411 ) ) ( not ( = ?auto_31421 ?auto_31411 ) ) ( not ( = ?auto_31418 ?auto_31411 ) ) ( not ( = ?auto_31420 ?auto_31416 ) ) ( not ( = ?auto_31415 ?auto_31420 ) ) ( not ( = ?auto_31422 ?auto_31420 ) ) ( HOIST-AT ?auto_31417 ?auto_31420 ) ( not ( = ?auto_31423 ?auto_31417 ) ) ( not ( = ?auto_31412 ?auto_31417 ) ) ( not ( = ?auto_31409 ?auto_31417 ) ) ( AVAILABLE ?auto_31417 ) ( SURFACE-AT ?auto_31410 ?auto_31420 ) ( ON ?auto_31410 ?auto_31413 ) ( CLEAR ?auto_31410 ) ( not ( = ?auto_31407 ?auto_31413 ) ) ( not ( = ?auto_31408 ?auto_31413 ) ) ( not ( = ?auto_31410 ?auto_31413 ) ) ( not ( = ?auto_31421 ?auto_31413 ) ) ( not ( = ?auto_31418 ?auto_31413 ) ) ( not ( = ?auto_31411 ?auto_31413 ) ) ( TRUCK-AT ?auto_31414 ?auto_31416 ) ( SURFACE-AT ?auto_31419 ?auto_31416 ) ( CLEAR ?auto_31419 ) ( IS-CRATE ?auto_31411 ) ( not ( = ?auto_31419 ?auto_31411 ) ) ( not ( = ?auto_31407 ?auto_31419 ) ) ( not ( = ?auto_31408 ?auto_31419 ) ) ( not ( = ?auto_31410 ?auto_31419 ) ) ( not ( = ?auto_31421 ?auto_31419 ) ) ( not ( = ?auto_31418 ?auto_31419 ) ) ( not ( = ?auto_31413 ?auto_31419 ) ) ( AVAILABLE ?auto_31423 ) ( IN ?auto_31411 ?auto_31414 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31423 ?auto_31411 ?auto_31414 ?auto_31416 )
      ( MAKE-2CRATE ?auto_31410 ?auto_31407 ?auto_31408 )
      ( MAKE-1CRATE-VERIFY ?auto_31407 ?auto_31408 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31424 - SURFACE
      ?auto_31425 - SURFACE
      ?auto_31426 - SURFACE
    )
    :vars
    (
      ?auto_31439 - HOIST
      ?auto_31430 - PLACE
      ?auto_31433 - PLACE
      ?auto_31432 - HOIST
      ?auto_31437 - SURFACE
      ?auto_31438 - PLACE
      ?auto_31429 - HOIST
      ?auto_31427 - SURFACE
      ?auto_31435 - SURFACE
      ?auto_31440 - PLACE
      ?auto_31436 - HOIST
      ?auto_31431 - SURFACE
      ?auto_31434 - TRUCK
      ?auto_31428 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31439 ?auto_31430 ) ( IS-CRATE ?auto_31426 ) ( not ( = ?auto_31425 ?auto_31426 ) ) ( not ( = ?auto_31424 ?auto_31425 ) ) ( not ( = ?auto_31424 ?auto_31426 ) ) ( not ( = ?auto_31433 ?auto_31430 ) ) ( HOIST-AT ?auto_31432 ?auto_31433 ) ( not ( = ?auto_31439 ?auto_31432 ) ) ( AVAILABLE ?auto_31432 ) ( SURFACE-AT ?auto_31426 ?auto_31433 ) ( ON ?auto_31426 ?auto_31437 ) ( CLEAR ?auto_31426 ) ( not ( = ?auto_31425 ?auto_31437 ) ) ( not ( = ?auto_31426 ?auto_31437 ) ) ( not ( = ?auto_31424 ?auto_31437 ) ) ( IS-CRATE ?auto_31425 ) ( not ( = ?auto_31438 ?auto_31430 ) ) ( not ( = ?auto_31433 ?auto_31438 ) ) ( HOIST-AT ?auto_31429 ?auto_31438 ) ( not ( = ?auto_31439 ?auto_31429 ) ) ( not ( = ?auto_31432 ?auto_31429 ) ) ( AVAILABLE ?auto_31429 ) ( SURFACE-AT ?auto_31425 ?auto_31438 ) ( ON ?auto_31425 ?auto_31427 ) ( CLEAR ?auto_31425 ) ( not ( = ?auto_31425 ?auto_31427 ) ) ( not ( = ?auto_31426 ?auto_31427 ) ) ( not ( = ?auto_31424 ?auto_31427 ) ) ( not ( = ?auto_31437 ?auto_31427 ) ) ( IS-CRATE ?auto_31424 ) ( not ( = ?auto_31435 ?auto_31424 ) ) ( not ( = ?auto_31425 ?auto_31435 ) ) ( not ( = ?auto_31426 ?auto_31435 ) ) ( not ( = ?auto_31437 ?auto_31435 ) ) ( not ( = ?auto_31427 ?auto_31435 ) ) ( not ( = ?auto_31440 ?auto_31430 ) ) ( not ( = ?auto_31433 ?auto_31440 ) ) ( not ( = ?auto_31438 ?auto_31440 ) ) ( HOIST-AT ?auto_31436 ?auto_31440 ) ( not ( = ?auto_31439 ?auto_31436 ) ) ( not ( = ?auto_31432 ?auto_31436 ) ) ( not ( = ?auto_31429 ?auto_31436 ) ) ( AVAILABLE ?auto_31436 ) ( SURFACE-AT ?auto_31424 ?auto_31440 ) ( ON ?auto_31424 ?auto_31431 ) ( CLEAR ?auto_31424 ) ( not ( = ?auto_31425 ?auto_31431 ) ) ( not ( = ?auto_31426 ?auto_31431 ) ) ( not ( = ?auto_31424 ?auto_31431 ) ) ( not ( = ?auto_31437 ?auto_31431 ) ) ( not ( = ?auto_31427 ?auto_31431 ) ) ( not ( = ?auto_31435 ?auto_31431 ) ) ( TRUCK-AT ?auto_31434 ?auto_31430 ) ( SURFACE-AT ?auto_31428 ?auto_31430 ) ( CLEAR ?auto_31428 ) ( IS-CRATE ?auto_31435 ) ( not ( = ?auto_31428 ?auto_31435 ) ) ( not ( = ?auto_31425 ?auto_31428 ) ) ( not ( = ?auto_31426 ?auto_31428 ) ) ( not ( = ?auto_31424 ?auto_31428 ) ) ( not ( = ?auto_31437 ?auto_31428 ) ) ( not ( = ?auto_31427 ?auto_31428 ) ) ( not ( = ?auto_31431 ?auto_31428 ) ) ( AVAILABLE ?auto_31439 ) ( IN ?auto_31435 ?auto_31434 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31425 ?auto_31426 )
      ( MAKE-2CRATE-VERIFY ?auto_31424 ?auto_31425 ?auto_31426 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31441 - SURFACE
      ?auto_31442 - SURFACE
      ?auto_31443 - SURFACE
      ?auto_31444 - SURFACE
    )
    :vars
    (
      ?auto_31449 - HOIST
      ?auto_31454 - PLACE
      ?auto_31450 - PLACE
      ?auto_31451 - HOIST
      ?auto_31457 - SURFACE
      ?auto_31448 - PLACE
      ?auto_31455 - HOIST
      ?auto_31452 - SURFACE
      ?auto_31453 - PLACE
      ?auto_31445 - HOIST
      ?auto_31456 - SURFACE
      ?auto_31446 - TRUCK
      ?auto_31447 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31449 ?auto_31454 ) ( IS-CRATE ?auto_31444 ) ( not ( = ?auto_31443 ?auto_31444 ) ) ( not ( = ?auto_31442 ?auto_31443 ) ) ( not ( = ?auto_31442 ?auto_31444 ) ) ( not ( = ?auto_31450 ?auto_31454 ) ) ( HOIST-AT ?auto_31451 ?auto_31450 ) ( not ( = ?auto_31449 ?auto_31451 ) ) ( AVAILABLE ?auto_31451 ) ( SURFACE-AT ?auto_31444 ?auto_31450 ) ( ON ?auto_31444 ?auto_31457 ) ( CLEAR ?auto_31444 ) ( not ( = ?auto_31443 ?auto_31457 ) ) ( not ( = ?auto_31444 ?auto_31457 ) ) ( not ( = ?auto_31442 ?auto_31457 ) ) ( IS-CRATE ?auto_31443 ) ( not ( = ?auto_31448 ?auto_31454 ) ) ( not ( = ?auto_31450 ?auto_31448 ) ) ( HOIST-AT ?auto_31455 ?auto_31448 ) ( not ( = ?auto_31449 ?auto_31455 ) ) ( not ( = ?auto_31451 ?auto_31455 ) ) ( AVAILABLE ?auto_31455 ) ( SURFACE-AT ?auto_31443 ?auto_31448 ) ( ON ?auto_31443 ?auto_31452 ) ( CLEAR ?auto_31443 ) ( not ( = ?auto_31443 ?auto_31452 ) ) ( not ( = ?auto_31444 ?auto_31452 ) ) ( not ( = ?auto_31442 ?auto_31452 ) ) ( not ( = ?auto_31457 ?auto_31452 ) ) ( IS-CRATE ?auto_31442 ) ( not ( = ?auto_31441 ?auto_31442 ) ) ( not ( = ?auto_31443 ?auto_31441 ) ) ( not ( = ?auto_31444 ?auto_31441 ) ) ( not ( = ?auto_31457 ?auto_31441 ) ) ( not ( = ?auto_31452 ?auto_31441 ) ) ( not ( = ?auto_31453 ?auto_31454 ) ) ( not ( = ?auto_31450 ?auto_31453 ) ) ( not ( = ?auto_31448 ?auto_31453 ) ) ( HOIST-AT ?auto_31445 ?auto_31453 ) ( not ( = ?auto_31449 ?auto_31445 ) ) ( not ( = ?auto_31451 ?auto_31445 ) ) ( not ( = ?auto_31455 ?auto_31445 ) ) ( AVAILABLE ?auto_31445 ) ( SURFACE-AT ?auto_31442 ?auto_31453 ) ( ON ?auto_31442 ?auto_31456 ) ( CLEAR ?auto_31442 ) ( not ( = ?auto_31443 ?auto_31456 ) ) ( not ( = ?auto_31444 ?auto_31456 ) ) ( not ( = ?auto_31442 ?auto_31456 ) ) ( not ( = ?auto_31457 ?auto_31456 ) ) ( not ( = ?auto_31452 ?auto_31456 ) ) ( not ( = ?auto_31441 ?auto_31456 ) ) ( TRUCK-AT ?auto_31446 ?auto_31454 ) ( SURFACE-AT ?auto_31447 ?auto_31454 ) ( CLEAR ?auto_31447 ) ( IS-CRATE ?auto_31441 ) ( not ( = ?auto_31447 ?auto_31441 ) ) ( not ( = ?auto_31443 ?auto_31447 ) ) ( not ( = ?auto_31444 ?auto_31447 ) ) ( not ( = ?auto_31442 ?auto_31447 ) ) ( not ( = ?auto_31457 ?auto_31447 ) ) ( not ( = ?auto_31452 ?auto_31447 ) ) ( not ( = ?auto_31456 ?auto_31447 ) ) ( AVAILABLE ?auto_31449 ) ( IN ?auto_31441 ?auto_31446 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31442 ?auto_31443 ?auto_31444 )
      ( MAKE-3CRATE-VERIFY ?auto_31441 ?auto_31442 ?auto_31443 ?auto_31444 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31458 - SURFACE
      ?auto_31459 - SURFACE
      ?auto_31460 - SURFACE
      ?auto_31461 - SURFACE
      ?auto_31462 - SURFACE
    )
    :vars
    (
      ?auto_31466 - HOIST
      ?auto_31471 - PLACE
      ?auto_31467 - PLACE
      ?auto_31468 - HOIST
      ?auto_31474 - SURFACE
      ?auto_31465 - PLACE
      ?auto_31472 - HOIST
      ?auto_31469 - SURFACE
      ?auto_31470 - PLACE
      ?auto_31463 - HOIST
      ?auto_31473 - SURFACE
      ?auto_31464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31466 ?auto_31471 ) ( IS-CRATE ?auto_31462 ) ( not ( = ?auto_31461 ?auto_31462 ) ) ( not ( = ?auto_31460 ?auto_31461 ) ) ( not ( = ?auto_31460 ?auto_31462 ) ) ( not ( = ?auto_31467 ?auto_31471 ) ) ( HOIST-AT ?auto_31468 ?auto_31467 ) ( not ( = ?auto_31466 ?auto_31468 ) ) ( AVAILABLE ?auto_31468 ) ( SURFACE-AT ?auto_31462 ?auto_31467 ) ( ON ?auto_31462 ?auto_31474 ) ( CLEAR ?auto_31462 ) ( not ( = ?auto_31461 ?auto_31474 ) ) ( not ( = ?auto_31462 ?auto_31474 ) ) ( not ( = ?auto_31460 ?auto_31474 ) ) ( IS-CRATE ?auto_31461 ) ( not ( = ?auto_31465 ?auto_31471 ) ) ( not ( = ?auto_31467 ?auto_31465 ) ) ( HOIST-AT ?auto_31472 ?auto_31465 ) ( not ( = ?auto_31466 ?auto_31472 ) ) ( not ( = ?auto_31468 ?auto_31472 ) ) ( AVAILABLE ?auto_31472 ) ( SURFACE-AT ?auto_31461 ?auto_31465 ) ( ON ?auto_31461 ?auto_31469 ) ( CLEAR ?auto_31461 ) ( not ( = ?auto_31461 ?auto_31469 ) ) ( not ( = ?auto_31462 ?auto_31469 ) ) ( not ( = ?auto_31460 ?auto_31469 ) ) ( not ( = ?auto_31474 ?auto_31469 ) ) ( IS-CRATE ?auto_31460 ) ( not ( = ?auto_31459 ?auto_31460 ) ) ( not ( = ?auto_31461 ?auto_31459 ) ) ( not ( = ?auto_31462 ?auto_31459 ) ) ( not ( = ?auto_31474 ?auto_31459 ) ) ( not ( = ?auto_31469 ?auto_31459 ) ) ( not ( = ?auto_31470 ?auto_31471 ) ) ( not ( = ?auto_31467 ?auto_31470 ) ) ( not ( = ?auto_31465 ?auto_31470 ) ) ( HOIST-AT ?auto_31463 ?auto_31470 ) ( not ( = ?auto_31466 ?auto_31463 ) ) ( not ( = ?auto_31468 ?auto_31463 ) ) ( not ( = ?auto_31472 ?auto_31463 ) ) ( AVAILABLE ?auto_31463 ) ( SURFACE-AT ?auto_31460 ?auto_31470 ) ( ON ?auto_31460 ?auto_31473 ) ( CLEAR ?auto_31460 ) ( not ( = ?auto_31461 ?auto_31473 ) ) ( not ( = ?auto_31462 ?auto_31473 ) ) ( not ( = ?auto_31460 ?auto_31473 ) ) ( not ( = ?auto_31474 ?auto_31473 ) ) ( not ( = ?auto_31469 ?auto_31473 ) ) ( not ( = ?auto_31459 ?auto_31473 ) ) ( TRUCK-AT ?auto_31464 ?auto_31471 ) ( SURFACE-AT ?auto_31458 ?auto_31471 ) ( CLEAR ?auto_31458 ) ( IS-CRATE ?auto_31459 ) ( not ( = ?auto_31458 ?auto_31459 ) ) ( not ( = ?auto_31461 ?auto_31458 ) ) ( not ( = ?auto_31462 ?auto_31458 ) ) ( not ( = ?auto_31460 ?auto_31458 ) ) ( not ( = ?auto_31474 ?auto_31458 ) ) ( not ( = ?auto_31469 ?auto_31458 ) ) ( not ( = ?auto_31473 ?auto_31458 ) ) ( AVAILABLE ?auto_31466 ) ( IN ?auto_31459 ?auto_31464 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31460 ?auto_31461 ?auto_31462 )
      ( MAKE-4CRATE-VERIFY ?auto_31458 ?auto_31459 ?auto_31460 ?auto_31461 ?auto_31462 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31475 - SURFACE
      ?auto_31476 - SURFACE
      ?auto_31477 - SURFACE
      ?auto_31478 - SURFACE
      ?auto_31479 - SURFACE
      ?auto_31480 - SURFACE
    )
    :vars
    (
      ?auto_31484 - HOIST
      ?auto_31489 - PLACE
      ?auto_31485 - PLACE
      ?auto_31486 - HOIST
      ?auto_31492 - SURFACE
      ?auto_31483 - PLACE
      ?auto_31490 - HOIST
      ?auto_31487 - SURFACE
      ?auto_31488 - PLACE
      ?auto_31481 - HOIST
      ?auto_31491 - SURFACE
      ?auto_31482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31484 ?auto_31489 ) ( IS-CRATE ?auto_31480 ) ( not ( = ?auto_31479 ?auto_31480 ) ) ( not ( = ?auto_31478 ?auto_31479 ) ) ( not ( = ?auto_31478 ?auto_31480 ) ) ( not ( = ?auto_31485 ?auto_31489 ) ) ( HOIST-AT ?auto_31486 ?auto_31485 ) ( not ( = ?auto_31484 ?auto_31486 ) ) ( AVAILABLE ?auto_31486 ) ( SURFACE-AT ?auto_31480 ?auto_31485 ) ( ON ?auto_31480 ?auto_31492 ) ( CLEAR ?auto_31480 ) ( not ( = ?auto_31479 ?auto_31492 ) ) ( not ( = ?auto_31480 ?auto_31492 ) ) ( not ( = ?auto_31478 ?auto_31492 ) ) ( IS-CRATE ?auto_31479 ) ( not ( = ?auto_31483 ?auto_31489 ) ) ( not ( = ?auto_31485 ?auto_31483 ) ) ( HOIST-AT ?auto_31490 ?auto_31483 ) ( not ( = ?auto_31484 ?auto_31490 ) ) ( not ( = ?auto_31486 ?auto_31490 ) ) ( AVAILABLE ?auto_31490 ) ( SURFACE-AT ?auto_31479 ?auto_31483 ) ( ON ?auto_31479 ?auto_31487 ) ( CLEAR ?auto_31479 ) ( not ( = ?auto_31479 ?auto_31487 ) ) ( not ( = ?auto_31480 ?auto_31487 ) ) ( not ( = ?auto_31478 ?auto_31487 ) ) ( not ( = ?auto_31492 ?auto_31487 ) ) ( IS-CRATE ?auto_31478 ) ( not ( = ?auto_31477 ?auto_31478 ) ) ( not ( = ?auto_31479 ?auto_31477 ) ) ( not ( = ?auto_31480 ?auto_31477 ) ) ( not ( = ?auto_31492 ?auto_31477 ) ) ( not ( = ?auto_31487 ?auto_31477 ) ) ( not ( = ?auto_31488 ?auto_31489 ) ) ( not ( = ?auto_31485 ?auto_31488 ) ) ( not ( = ?auto_31483 ?auto_31488 ) ) ( HOIST-AT ?auto_31481 ?auto_31488 ) ( not ( = ?auto_31484 ?auto_31481 ) ) ( not ( = ?auto_31486 ?auto_31481 ) ) ( not ( = ?auto_31490 ?auto_31481 ) ) ( AVAILABLE ?auto_31481 ) ( SURFACE-AT ?auto_31478 ?auto_31488 ) ( ON ?auto_31478 ?auto_31491 ) ( CLEAR ?auto_31478 ) ( not ( = ?auto_31479 ?auto_31491 ) ) ( not ( = ?auto_31480 ?auto_31491 ) ) ( not ( = ?auto_31478 ?auto_31491 ) ) ( not ( = ?auto_31492 ?auto_31491 ) ) ( not ( = ?auto_31487 ?auto_31491 ) ) ( not ( = ?auto_31477 ?auto_31491 ) ) ( TRUCK-AT ?auto_31482 ?auto_31489 ) ( SURFACE-AT ?auto_31476 ?auto_31489 ) ( CLEAR ?auto_31476 ) ( IS-CRATE ?auto_31477 ) ( not ( = ?auto_31476 ?auto_31477 ) ) ( not ( = ?auto_31479 ?auto_31476 ) ) ( not ( = ?auto_31480 ?auto_31476 ) ) ( not ( = ?auto_31478 ?auto_31476 ) ) ( not ( = ?auto_31492 ?auto_31476 ) ) ( not ( = ?auto_31487 ?auto_31476 ) ) ( not ( = ?auto_31491 ?auto_31476 ) ) ( AVAILABLE ?auto_31484 ) ( IN ?auto_31477 ?auto_31482 ) ( ON ?auto_31476 ?auto_31475 ) ( not ( = ?auto_31475 ?auto_31476 ) ) ( not ( = ?auto_31475 ?auto_31477 ) ) ( not ( = ?auto_31475 ?auto_31478 ) ) ( not ( = ?auto_31475 ?auto_31479 ) ) ( not ( = ?auto_31475 ?auto_31480 ) ) ( not ( = ?auto_31475 ?auto_31492 ) ) ( not ( = ?auto_31475 ?auto_31487 ) ) ( not ( = ?auto_31475 ?auto_31491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31478 ?auto_31479 ?auto_31480 )
      ( MAKE-5CRATE-VERIFY ?auto_31475 ?auto_31476 ?auto_31477 ?auto_31478 ?auto_31479 ?auto_31480 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31493 - SURFACE
      ?auto_31494 - SURFACE
    )
    :vars
    (
      ?auto_31500 - HOIST
      ?auto_31506 - PLACE
      ?auto_31495 - SURFACE
      ?auto_31501 - PLACE
      ?auto_31502 - HOIST
      ?auto_31509 - SURFACE
      ?auto_31499 - PLACE
      ?auto_31507 - HOIST
      ?auto_31504 - SURFACE
      ?auto_31503 - SURFACE
      ?auto_31505 - PLACE
      ?auto_31496 - HOIST
      ?auto_31508 - SURFACE
      ?auto_31498 - SURFACE
      ?auto_31497 - TRUCK
      ?auto_31510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31500 ?auto_31506 ) ( IS-CRATE ?auto_31494 ) ( not ( = ?auto_31493 ?auto_31494 ) ) ( not ( = ?auto_31495 ?auto_31493 ) ) ( not ( = ?auto_31495 ?auto_31494 ) ) ( not ( = ?auto_31501 ?auto_31506 ) ) ( HOIST-AT ?auto_31502 ?auto_31501 ) ( not ( = ?auto_31500 ?auto_31502 ) ) ( AVAILABLE ?auto_31502 ) ( SURFACE-AT ?auto_31494 ?auto_31501 ) ( ON ?auto_31494 ?auto_31509 ) ( CLEAR ?auto_31494 ) ( not ( = ?auto_31493 ?auto_31509 ) ) ( not ( = ?auto_31494 ?auto_31509 ) ) ( not ( = ?auto_31495 ?auto_31509 ) ) ( IS-CRATE ?auto_31493 ) ( not ( = ?auto_31499 ?auto_31506 ) ) ( not ( = ?auto_31501 ?auto_31499 ) ) ( HOIST-AT ?auto_31507 ?auto_31499 ) ( not ( = ?auto_31500 ?auto_31507 ) ) ( not ( = ?auto_31502 ?auto_31507 ) ) ( AVAILABLE ?auto_31507 ) ( SURFACE-AT ?auto_31493 ?auto_31499 ) ( ON ?auto_31493 ?auto_31504 ) ( CLEAR ?auto_31493 ) ( not ( = ?auto_31493 ?auto_31504 ) ) ( not ( = ?auto_31494 ?auto_31504 ) ) ( not ( = ?auto_31495 ?auto_31504 ) ) ( not ( = ?auto_31509 ?auto_31504 ) ) ( IS-CRATE ?auto_31495 ) ( not ( = ?auto_31503 ?auto_31495 ) ) ( not ( = ?auto_31493 ?auto_31503 ) ) ( not ( = ?auto_31494 ?auto_31503 ) ) ( not ( = ?auto_31509 ?auto_31503 ) ) ( not ( = ?auto_31504 ?auto_31503 ) ) ( not ( = ?auto_31505 ?auto_31506 ) ) ( not ( = ?auto_31501 ?auto_31505 ) ) ( not ( = ?auto_31499 ?auto_31505 ) ) ( HOIST-AT ?auto_31496 ?auto_31505 ) ( not ( = ?auto_31500 ?auto_31496 ) ) ( not ( = ?auto_31502 ?auto_31496 ) ) ( not ( = ?auto_31507 ?auto_31496 ) ) ( AVAILABLE ?auto_31496 ) ( SURFACE-AT ?auto_31495 ?auto_31505 ) ( ON ?auto_31495 ?auto_31508 ) ( CLEAR ?auto_31495 ) ( not ( = ?auto_31493 ?auto_31508 ) ) ( not ( = ?auto_31494 ?auto_31508 ) ) ( not ( = ?auto_31495 ?auto_31508 ) ) ( not ( = ?auto_31509 ?auto_31508 ) ) ( not ( = ?auto_31504 ?auto_31508 ) ) ( not ( = ?auto_31503 ?auto_31508 ) ) ( SURFACE-AT ?auto_31498 ?auto_31506 ) ( CLEAR ?auto_31498 ) ( IS-CRATE ?auto_31503 ) ( not ( = ?auto_31498 ?auto_31503 ) ) ( not ( = ?auto_31493 ?auto_31498 ) ) ( not ( = ?auto_31494 ?auto_31498 ) ) ( not ( = ?auto_31495 ?auto_31498 ) ) ( not ( = ?auto_31509 ?auto_31498 ) ) ( not ( = ?auto_31504 ?auto_31498 ) ) ( not ( = ?auto_31508 ?auto_31498 ) ) ( AVAILABLE ?auto_31500 ) ( IN ?auto_31503 ?auto_31497 ) ( TRUCK-AT ?auto_31497 ?auto_31510 ) ( not ( = ?auto_31510 ?auto_31506 ) ) ( not ( = ?auto_31501 ?auto_31510 ) ) ( not ( = ?auto_31499 ?auto_31510 ) ) ( not ( = ?auto_31505 ?auto_31510 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_31497 ?auto_31510 ?auto_31506 )
      ( MAKE-2CRATE ?auto_31495 ?auto_31493 ?auto_31494 )
      ( MAKE-1CRATE-VERIFY ?auto_31493 ?auto_31494 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31511 - SURFACE
      ?auto_31512 - SURFACE
      ?auto_31513 - SURFACE
    )
    :vars
    (
      ?auto_31517 - HOIST
      ?auto_31519 - PLACE
      ?auto_31526 - PLACE
      ?auto_31515 - HOIST
      ?auto_31516 - SURFACE
      ?auto_31518 - PLACE
      ?auto_31524 - HOIST
      ?auto_31514 - SURFACE
      ?auto_31527 - SURFACE
      ?auto_31521 - PLACE
      ?auto_31525 - HOIST
      ?auto_31528 - SURFACE
      ?auto_31520 - SURFACE
      ?auto_31523 - TRUCK
      ?auto_31522 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31517 ?auto_31519 ) ( IS-CRATE ?auto_31513 ) ( not ( = ?auto_31512 ?auto_31513 ) ) ( not ( = ?auto_31511 ?auto_31512 ) ) ( not ( = ?auto_31511 ?auto_31513 ) ) ( not ( = ?auto_31526 ?auto_31519 ) ) ( HOIST-AT ?auto_31515 ?auto_31526 ) ( not ( = ?auto_31517 ?auto_31515 ) ) ( AVAILABLE ?auto_31515 ) ( SURFACE-AT ?auto_31513 ?auto_31526 ) ( ON ?auto_31513 ?auto_31516 ) ( CLEAR ?auto_31513 ) ( not ( = ?auto_31512 ?auto_31516 ) ) ( not ( = ?auto_31513 ?auto_31516 ) ) ( not ( = ?auto_31511 ?auto_31516 ) ) ( IS-CRATE ?auto_31512 ) ( not ( = ?auto_31518 ?auto_31519 ) ) ( not ( = ?auto_31526 ?auto_31518 ) ) ( HOIST-AT ?auto_31524 ?auto_31518 ) ( not ( = ?auto_31517 ?auto_31524 ) ) ( not ( = ?auto_31515 ?auto_31524 ) ) ( AVAILABLE ?auto_31524 ) ( SURFACE-AT ?auto_31512 ?auto_31518 ) ( ON ?auto_31512 ?auto_31514 ) ( CLEAR ?auto_31512 ) ( not ( = ?auto_31512 ?auto_31514 ) ) ( not ( = ?auto_31513 ?auto_31514 ) ) ( not ( = ?auto_31511 ?auto_31514 ) ) ( not ( = ?auto_31516 ?auto_31514 ) ) ( IS-CRATE ?auto_31511 ) ( not ( = ?auto_31527 ?auto_31511 ) ) ( not ( = ?auto_31512 ?auto_31527 ) ) ( not ( = ?auto_31513 ?auto_31527 ) ) ( not ( = ?auto_31516 ?auto_31527 ) ) ( not ( = ?auto_31514 ?auto_31527 ) ) ( not ( = ?auto_31521 ?auto_31519 ) ) ( not ( = ?auto_31526 ?auto_31521 ) ) ( not ( = ?auto_31518 ?auto_31521 ) ) ( HOIST-AT ?auto_31525 ?auto_31521 ) ( not ( = ?auto_31517 ?auto_31525 ) ) ( not ( = ?auto_31515 ?auto_31525 ) ) ( not ( = ?auto_31524 ?auto_31525 ) ) ( AVAILABLE ?auto_31525 ) ( SURFACE-AT ?auto_31511 ?auto_31521 ) ( ON ?auto_31511 ?auto_31528 ) ( CLEAR ?auto_31511 ) ( not ( = ?auto_31512 ?auto_31528 ) ) ( not ( = ?auto_31513 ?auto_31528 ) ) ( not ( = ?auto_31511 ?auto_31528 ) ) ( not ( = ?auto_31516 ?auto_31528 ) ) ( not ( = ?auto_31514 ?auto_31528 ) ) ( not ( = ?auto_31527 ?auto_31528 ) ) ( SURFACE-AT ?auto_31520 ?auto_31519 ) ( CLEAR ?auto_31520 ) ( IS-CRATE ?auto_31527 ) ( not ( = ?auto_31520 ?auto_31527 ) ) ( not ( = ?auto_31512 ?auto_31520 ) ) ( not ( = ?auto_31513 ?auto_31520 ) ) ( not ( = ?auto_31511 ?auto_31520 ) ) ( not ( = ?auto_31516 ?auto_31520 ) ) ( not ( = ?auto_31514 ?auto_31520 ) ) ( not ( = ?auto_31528 ?auto_31520 ) ) ( AVAILABLE ?auto_31517 ) ( IN ?auto_31527 ?auto_31523 ) ( TRUCK-AT ?auto_31523 ?auto_31522 ) ( not ( = ?auto_31522 ?auto_31519 ) ) ( not ( = ?auto_31526 ?auto_31522 ) ) ( not ( = ?auto_31518 ?auto_31522 ) ) ( not ( = ?auto_31521 ?auto_31522 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31512 ?auto_31513 )
      ( MAKE-2CRATE-VERIFY ?auto_31511 ?auto_31512 ?auto_31513 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31529 - SURFACE
      ?auto_31530 - SURFACE
      ?auto_31531 - SURFACE
      ?auto_31532 - SURFACE
    )
    :vars
    (
      ?auto_31545 - HOIST
      ?auto_31536 - PLACE
      ?auto_31538 - PLACE
      ?auto_31534 - HOIST
      ?auto_31537 - SURFACE
      ?auto_31546 - PLACE
      ?auto_31543 - HOIST
      ?auto_31541 - SURFACE
      ?auto_31533 - PLACE
      ?auto_31540 - HOIST
      ?auto_31544 - SURFACE
      ?auto_31542 - SURFACE
      ?auto_31539 - TRUCK
      ?auto_31535 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31545 ?auto_31536 ) ( IS-CRATE ?auto_31532 ) ( not ( = ?auto_31531 ?auto_31532 ) ) ( not ( = ?auto_31530 ?auto_31531 ) ) ( not ( = ?auto_31530 ?auto_31532 ) ) ( not ( = ?auto_31538 ?auto_31536 ) ) ( HOIST-AT ?auto_31534 ?auto_31538 ) ( not ( = ?auto_31545 ?auto_31534 ) ) ( AVAILABLE ?auto_31534 ) ( SURFACE-AT ?auto_31532 ?auto_31538 ) ( ON ?auto_31532 ?auto_31537 ) ( CLEAR ?auto_31532 ) ( not ( = ?auto_31531 ?auto_31537 ) ) ( not ( = ?auto_31532 ?auto_31537 ) ) ( not ( = ?auto_31530 ?auto_31537 ) ) ( IS-CRATE ?auto_31531 ) ( not ( = ?auto_31546 ?auto_31536 ) ) ( not ( = ?auto_31538 ?auto_31546 ) ) ( HOIST-AT ?auto_31543 ?auto_31546 ) ( not ( = ?auto_31545 ?auto_31543 ) ) ( not ( = ?auto_31534 ?auto_31543 ) ) ( AVAILABLE ?auto_31543 ) ( SURFACE-AT ?auto_31531 ?auto_31546 ) ( ON ?auto_31531 ?auto_31541 ) ( CLEAR ?auto_31531 ) ( not ( = ?auto_31531 ?auto_31541 ) ) ( not ( = ?auto_31532 ?auto_31541 ) ) ( not ( = ?auto_31530 ?auto_31541 ) ) ( not ( = ?auto_31537 ?auto_31541 ) ) ( IS-CRATE ?auto_31530 ) ( not ( = ?auto_31529 ?auto_31530 ) ) ( not ( = ?auto_31531 ?auto_31529 ) ) ( not ( = ?auto_31532 ?auto_31529 ) ) ( not ( = ?auto_31537 ?auto_31529 ) ) ( not ( = ?auto_31541 ?auto_31529 ) ) ( not ( = ?auto_31533 ?auto_31536 ) ) ( not ( = ?auto_31538 ?auto_31533 ) ) ( not ( = ?auto_31546 ?auto_31533 ) ) ( HOIST-AT ?auto_31540 ?auto_31533 ) ( not ( = ?auto_31545 ?auto_31540 ) ) ( not ( = ?auto_31534 ?auto_31540 ) ) ( not ( = ?auto_31543 ?auto_31540 ) ) ( AVAILABLE ?auto_31540 ) ( SURFACE-AT ?auto_31530 ?auto_31533 ) ( ON ?auto_31530 ?auto_31544 ) ( CLEAR ?auto_31530 ) ( not ( = ?auto_31531 ?auto_31544 ) ) ( not ( = ?auto_31532 ?auto_31544 ) ) ( not ( = ?auto_31530 ?auto_31544 ) ) ( not ( = ?auto_31537 ?auto_31544 ) ) ( not ( = ?auto_31541 ?auto_31544 ) ) ( not ( = ?auto_31529 ?auto_31544 ) ) ( SURFACE-AT ?auto_31542 ?auto_31536 ) ( CLEAR ?auto_31542 ) ( IS-CRATE ?auto_31529 ) ( not ( = ?auto_31542 ?auto_31529 ) ) ( not ( = ?auto_31531 ?auto_31542 ) ) ( not ( = ?auto_31532 ?auto_31542 ) ) ( not ( = ?auto_31530 ?auto_31542 ) ) ( not ( = ?auto_31537 ?auto_31542 ) ) ( not ( = ?auto_31541 ?auto_31542 ) ) ( not ( = ?auto_31544 ?auto_31542 ) ) ( AVAILABLE ?auto_31545 ) ( IN ?auto_31529 ?auto_31539 ) ( TRUCK-AT ?auto_31539 ?auto_31535 ) ( not ( = ?auto_31535 ?auto_31536 ) ) ( not ( = ?auto_31538 ?auto_31535 ) ) ( not ( = ?auto_31546 ?auto_31535 ) ) ( not ( = ?auto_31533 ?auto_31535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31530 ?auto_31531 ?auto_31532 )
      ( MAKE-3CRATE-VERIFY ?auto_31529 ?auto_31530 ?auto_31531 ?auto_31532 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31547 - SURFACE
      ?auto_31548 - SURFACE
      ?auto_31549 - SURFACE
      ?auto_31550 - SURFACE
      ?auto_31551 - SURFACE
    )
    :vars
    (
      ?auto_31563 - HOIST
      ?auto_31555 - PLACE
      ?auto_31557 - PLACE
      ?auto_31553 - HOIST
      ?auto_31556 - SURFACE
      ?auto_31564 - PLACE
      ?auto_31561 - HOIST
      ?auto_31560 - SURFACE
      ?auto_31552 - PLACE
      ?auto_31559 - HOIST
      ?auto_31562 - SURFACE
      ?auto_31558 - TRUCK
      ?auto_31554 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31563 ?auto_31555 ) ( IS-CRATE ?auto_31551 ) ( not ( = ?auto_31550 ?auto_31551 ) ) ( not ( = ?auto_31549 ?auto_31550 ) ) ( not ( = ?auto_31549 ?auto_31551 ) ) ( not ( = ?auto_31557 ?auto_31555 ) ) ( HOIST-AT ?auto_31553 ?auto_31557 ) ( not ( = ?auto_31563 ?auto_31553 ) ) ( AVAILABLE ?auto_31553 ) ( SURFACE-AT ?auto_31551 ?auto_31557 ) ( ON ?auto_31551 ?auto_31556 ) ( CLEAR ?auto_31551 ) ( not ( = ?auto_31550 ?auto_31556 ) ) ( not ( = ?auto_31551 ?auto_31556 ) ) ( not ( = ?auto_31549 ?auto_31556 ) ) ( IS-CRATE ?auto_31550 ) ( not ( = ?auto_31564 ?auto_31555 ) ) ( not ( = ?auto_31557 ?auto_31564 ) ) ( HOIST-AT ?auto_31561 ?auto_31564 ) ( not ( = ?auto_31563 ?auto_31561 ) ) ( not ( = ?auto_31553 ?auto_31561 ) ) ( AVAILABLE ?auto_31561 ) ( SURFACE-AT ?auto_31550 ?auto_31564 ) ( ON ?auto_31550 ?auto_31560 ) ( CLEAR ?auto_31550 ) ( not ( = ?auto_31550 ?auto_31560 ) ) ( not ( = ?auto_31551 ?auto_31560 ) ) ( not ( = ?auto_31549 ?auto_31560 ) ) ( not ( = ?auto_31556 ?auto_31560 ) ) ( IS-CRATE ?auto_31549 ) ( not ( = ?auto_31548 ?auto_31549 ) ) ( not ( = ?auto_31550 ?auto_31548 ) ) ( not ( = ?auto_31551 ?auto_31548 ) ) ( not ( = ?auto_31556 ?auto_31548 ) ) ( not ( = ?auto_31560 ?auto_31548 ) ) ( not ( = ?auto_31552 ?auto_31555 ) ) ( not ( = ?auto_31557 ?auto_31552 ) ) ( not ( = ?auto_31564 ?auto_31552 ) ) ( HOIST-AT ?auto_31559 ?auto_31552 ) ( not ( = ?auto_31563 ?auto_31559 ) ) ( not ( = ?auto_31553 ?auto_31559 ) ) ( not ( = ?auto_31561 ?auto_31559 ) ) ( AVAILABLE ?auto_31559 ) ( SURFACE-AT ?auto_31549 ?auto_31552 ) ( ON ?auto_31549 ?auto_31562 ) ( CLEAR ?auto_31549 ) ( not ( = ?auto_31550 ?auto_31562 ) ) ( not ( = ?auto_31551 ?auto_31562 ) ) ( not ( = ?auto_31549 ?auto_31562 ) ) ( not ( = ?auto_31556 ?auto_31562 ) ) ( not ( = ?auto_31560 ?auto_31562 ) ) ( not ( = ?auto_31548 ?auto_31562 ) ) ( SURFACE-AT ?auto_31547 ?auto_31555 ) ( CLEAR ?auto_31547 ) ( IS-CRATE ?auto_31548 ) ( not ( = ?auto_31547 ?auto_31548 ) ) ( not ( = ?auto_31550 ?auto_31547 ) ) ( not ( = ?auto_31551 ?auto_31547 ) ) ( not ( = ?auto_31549 ?auto_31547 ) ) ( not ( = ?auto_31556 ?auto_31547 ) ) ( not ( = ?auto_31560 ?auto_31547 ) ) ( not ( = ?auto_31562 ?auto_31547 ) ) ( AVAILABLE ?auto_31563 ) ( IN ?auto_31548 ?auto_31558 ) ( TRUCK-AT ?auto_31558 ?auto_31554 ) ( not ( = ?auto_31554 ?auto_31555 ) ) ( not ( = ?auto_31557 ?auto_31554 ) ) ( not ( = ?auto_31564 ?auto_31554 ) ) ( not ( = ?auto_31552 ?auto_31554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31549 ?auto_31550 ?auto_31551 )
      ( MAKE-4CRATE-VERIFY ?auto_31547 ?auto_31548 ?auto_31549 ?auto_31550 ?auto_31551 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31565 - SURFACE
      ?auto_31566 - SURFACE
      ?auto_31567 - SURFACE
      ?auto_31568 - SURFACE
      ?auto_31569 - SURFACE
      ?auto_31570 - SURFACE
    )
    :vars
    (
      ?auto_31582 - HOIST
      ?auto_31574 - PLACE
      ?auto_31576 - PLACE
      ?auto_31572 - HOIST
      ?auto_31575 - SURFACE
      ?auto_31583 - PLACE
      ?auto_31580 - HOIST
      ?auto_31579 - SURFACE
      ?auto_31571 - PLACE
      ?auto_31578 - HOIST
      ?auto_31581 - SURFACE
      ?auto_31577 - TRUCK
      ?auto_31573 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31582 ?auto_31574 ) ( IS-CRATE ?auto_31570 ) ( not ( = ?auto_31569 ?auto_31570 ) ) ( not ( = ?auto_31568 ?auto_31569 ) ) ( not ( = ?auto_31568 ?auto_31570 ) ) ( not ( = ?auto_31576 ?auto_31574 ) ) ( HOIST-AT ?auto_31572 ?auto_31576 ) ( not ( = ?auto_31582 ?auto_31572 ) ) ( AVAILABLE ?auto_31572 ) ( SURFACE-AT ?auto_31570 ?auto_31576 ) ( ON ?auto_31570 ?auto_31575 ) ( CLEAR ?auto_31570 ) ( not ( = ?auto_31569 ?auto_31575 ) ) ( not ( = ?auto_31570 ?auto_31575 ) ) ( not ( = ?auto_31568 ?auto_31575 ) ) ( IS-CRATE ?auto_31569 ) ( not ( = ?auto_31583 ?auto_31574 ) ) ( not ( = ?auto_31576 ?auto_31583 ) ) ( HOIST-AT ?auto_31580 ?auto_31583 ) ( not ( = ?auto_31582 ?auto_31580 ) ) ( not ( = ?auto_31572 ?auto_31580 ) ) ( AVAILABLE ?auto_31580 ) ( SURFACE-AT ?auto_31569 ?auto_31583 ) ( ON ?auto_31569 ?auto_31579 ) ( CLEAR ?auto_31569 ) ( not ( = ?auto_31569 ?auto_31579 ) ) ( not ( = ?auto_31570 ?auto_31579 ) ) ( not ( = ?auto_31568 ?auto_31579 ) ) ( not ( = ?auto_31575 ?auto_31579 ) ) ( IS-CRATE ?auto_31568 ) ( not ( = ?auto_31567 ?auto_31568 ) ) ( not ( = ?auto_31569 ?auto_31567 ) ) ( not ( = ?auto_31570 ?auto_31567 ) ) ( not ( = ?auto_31575 ?auto_31567 ) ) ( not ( = ?auto_31579 ?auto_31567 ) ) ( not ( = ?auto_31571 ?auto_31574 ) ) ( not ( = ?auto_31576 ?auto_31571 ) ) ( not ( = ?auto_31583 ?auto_31571 ) ) ( HOIST-AT ?auto_31578 ?auto_31571 ) ( not ( = ?auto_31582 ?auto_31578 ) ) ( not ( = ?auto_31572 ?auto_31578 ) ) ( not ( = ?auto_31580 ?auto_31578 ) ) ( AVAILABLE ?auto_31578 ) ( SURFACE-AT ?auto_31568 ?auto_31571 ) ( ON ?auto_31568 ?auto_31581 ) ( CLEAR ?auto_31568 ) ( not ( = ?auto_31569 ?auto_31581 ) ) ( not ( = ?auto_31570 ?auto_31581 ) ) ( not ( = ?auto_31568 ?auto_31581 ) ) ( not ( = ?auto_31575 ?auto_31581 ) ) ( not ( = ?auto_31579 ?auto_31581 ) ) ( not ( = ?auto_31567 ?auto_31581 ) ) ( SURFACE-AT ?auto_31566 ?auto_31574 ) ( CLEAR ?auto_31566 ) ( IS-CRATE ?auto_31567 ) ( not ( = ?auto_31566 ?auto_31567 ) ) ( not ( = ?auto_31569 ?auto_31566 ) ) ( not ( = ?auto_31570 ?auto_31566 ) ) ( not ( = ?auto_31568 ?auto_31566 ) ) ( not ( = ?auto_31575 ?auto_31566 ) ) ( not ( = ?auto_31579 ?auto_31566 ) ) ( not ( = ?auto_31581 ?auto_31566 ) ) ( AVAILABLE ?auto_31582 ) ( IN ?auto_31567 ?auto_31577 ) ( TRUCK-AT ?auto_31577 ?auto_31573 ) ( not ( = ?auto_31573 ?auto_31574 ) ) ( not ( = ?auto_31576 ?auto_31573 ) ) ( not ( = ?auto_31583 ?auto_31573 ) ) ( not ( = ?auto_31571 ?auto_31573 ) ) ( ON ?auto_31566 ?auto_31565 ) ( not ( = ?auto_31565 ?auto_31566 ) ) ( not ( = ?auto_31565 ?auto_31567 ) ) ( not ( = ?auto_31565 ?auto_31568 ) ) ( not ( = ?auto_31565 ?auto_31569 ) ) ( not ( = ?auto_31565 ?auto_31570 ) ) ( not ( = ?auto_31565 ?auto_31575 ) ) ( not ( = ?auto_31565 ?auto_31579 ) ) ( not ( = ?auto_31565 ?auto_31581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31568 ?auto_31569 ?auto_31570 )
      ( MAKE-5CRATE-VERIFY ?auto_31565 ?auto_31566 ?auto_31567 ?auto_31568 ?auto_31569 ?auto_31570 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31584 - SURFACE
      ?auto_31585 - SURFACE
    )
    :vars
    (
      ?auto_31600 - HOIST
      ?auto_31590 - PLACE
      ?auto_31598 - SURFACE
      ?auto_31592 - PLACE
      ?auto_31588 - HOIST
      ?auto_31591 - SURFACE
      ?auto_31601 - PLACE
      ?auto_31597 - HOIST
      ?auto_31595 - SURFACE
      ?auto_31586 - SURFACE
      ?auto_31587 - PLACE
      ?auto_31594 - HOIST
      ?auto_31599 - SURFACE
      ?auto_31596 - SURFACE
      ?auto_31593 - TRUCK
      ?auto_31589 - PLACE
      ?auto_31602 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31600 ?auto_31590 ) ( IS-CRATE ?auto_31585 ) ( not ( = ?auto_31584 ?auto_31585 ) ) ( not ( = ?auto_31598 ?auto_31584 ) ) ( not ( = ?auto_31598 ?auto_31585 ) ) ( not ( = ?auto_31592 ?auto_31590 ) ) ( HOIST-AT ?auto_31588 ?auto_31592 ) ( not ( = ?auto_31600 ?auto_31588 ) ) ( AVAILABLE ?auto_31588 ) ( SURFACE-AT ?auto_31585 ?auto_31592 ) ( ON ?auto_31585 ?auto_31591 ) ( CLEAR ?auto_31585 ) ( not ( = ?auto_31584 ?auto_31591 ) ) ( not ( = ?auto_31585 ?auto_31591 ) ) ( not ( = ?auto_31598 ?auto_31591 ) ) ( IS-CRATE ?auto_31584 ) ( not ( = ?auto_31601 ?auto_31590 ) ) ( not ( = ?auto_31592 ?auto_31601 ) ) ( HOIST-AT ?auto_31597 ?auto_31601 ) ( not ( = ?auto_31600 ?auto_31597 ) ) ( not ( = ?auto_31588 ?auto_31597 ) ) ( AVAILABLE ?auto_31597 ) ( SURFACE-AT ?auto_31584 ?auto_31601 ) ( ON ?auto_31584 ?auto_31595 ) ( CLEAR ?auto_31584 ) ( not ( = ?auto_31584 ?auto_31595 ) ) ( not ( = ?auto_31585 ?auto_31595 ) ) ( not ( = ?auto_31598 ?auto_31595 ) ) ( not ( = ?auto_31591 ?auto_31595 ) ) ( IS-CRATE ?auto_31598 ) ( not ( = ?auto_31586 ?auto_31598 ) ) ( not ( = ?auto_31584 ?auto_31586 ) ) ( not ( = ?auto_31585 ?auto_31586 ) ) ( not ( = ?auto_31591 ?auto_31586 ) ) ( not ( = ?auto_31595 ?auto_31586 ) ) ( not ( = ?auto_31587 ?auto_31590 ) ) ( not ( = ?auto_31592 ?auto_31587 ) ) ( not ( = ?auto_31601 ?auto_31587 ) ) ( HOIST-AT ?auto_31594 ?auto_31587 ) ( not ( = ?auto_31600 ?auto_31594 ) ) ( not ( = ?auto_31588 ?auto_31594 ) ) ( not ( = ?auto_31597 ?auto_31594 ) ) ( AVAILABLE ?auto_31594 ) ( SURFACE-AT ?auto_31598 ?auto_31587 ) ( ON ?auto_31598 ?auto_31599 ) ( CLEAR ?auto_31598 ) ( not ( = ?auto_31584 ?auto_31599 ) ) ( not ( = ?auto_31585 ?auto_31599 ) ) ( not ( = ?auto_31598 ?auto_31599 ) ) ( not ( = ?auto_31591 ?auto_31599 ) ) ( not ( = ?auto_31595 ?auto_31599 ) ) ( not ( = ?auto_31586 ?auto_31599 ) ) ( SURFACE-AT ?auto_31596 ?auto_31590 ) ( CLEAR ?auto_31596 ) ( IS-CRATE ?auto_31586 ) ( not ( = ?auto_31596 ?auto_31586 ) ) ( not ( = ?auto_31584 ?auto_31596 ) ) ( not ( = ?auto_31585 ?auto_31596 ) ) ( not ( = ?auto_31598 ?auto_31596 ) ) ( not ( = ?auto_31591 ?auto_31596 ) ) ( not ( = ?auto_31595 ?auto_31596 ) ) ( not ( = ?auto_31599 ?auto_31596 ) ) ( AVAILABLE ?auto_31600 ) ( TRUCK-AT ?auto_31593 ?auto_31589 ) ( not ( = ?auto_31589 ?auto_31590 ) ) ( not ( = ?auto_31592 ?auto_31589 ) ) ( not ( = ?auto_31601 ?auto_31589 ) ) ( not ( = ?auto_31587 ?auto_31589 ) ) ( HOIST-AT ?auto_31602 ?auto_31589 ) ( LIFTING ?auto_31602 ?auto_31586 ) ( not ( = ?auto_31600 ?auto_31602 ) ) ( not ( = ?auto_31588 ?auto_31602 ) ) ( not ( = ?auto_31597 ?auto_31602 ) ) ( not ( = ?auto_31594 ?auto_31602 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31602 ?auto_31586 ?auto_31593 ?auto_31589 )
      ( MAKE-2CRATE ?auto_31598 ?auto_31584 ?auto_31585 )
      ( MAKE-1CRATE-VERIFY ?auto_31584 ?auto_31585 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31603 - SURFACE
      ?auto_31604 - SURFACE
      ?auto_31605 - SURFACE
    )
    :vars
    (
      ?auto_31608 - HOIST
      ?auto_31612 - PLACE
      ?auto_31607 - PLACE
      ?auto_31617 - HOIST
      ?auto_31618 - SURFACE
      ?auto_31613 - PLACE
      ?auto_31609 - HOIST
      ?auto_31610 - SURFACE
      ?auto_31620 - SURFACE
      ?auto_31615 - PLACE
      ?auto_31611 - HOIST
      ?auto_31619 - SURFACE
      ?auto_31621 - SURFACE
      ?auto_31614 - TRUCK
      ?auto_31616 - PLACE
      ?auto_31606 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31608 ?auto_31612 ) ( IS-CRATE ?auto_31605 ) ( not ( = ?auto_31604 ?auto_31605 ) ) ( not ( = ?auto_31603 ?auto_31604 ) ) ( not ( = ?auto_31603 ?auto_31605 ) ) ( not ( = ?auto_31607 ?auto_31612 ) ) ( HOIST-AT ?auto_31617 ?auto_31607 ) ( not ( = ?auto_31608 ?auto_31617 ) ) ( AVAILABLE ?auto_31617 ) ( SURFACE-AT ?auto_31605 ?auto_31607 ) ( ON ?auto_31605 ?auto_31618 ) ( CLEAR ?auto_31605 ) ( not ( = ?auto_31604 ?auto_31618 ) ) ( not ( = ?auto_31605 ?auto_31618 ) ) ( not ( = ?auto_31603 ?auto_31618 ) ) ( IS-CRATE ?auto_31604 ) ( not ( = ?auto_31613 ?auto_31612 ) ) ( not ( = ?auto_31607 ?auto_31613 ) ) ( HOIST-AT ?auto_31609 ?auto_31613 ) ( not ( = ?auto_31608 ?auto_31609 ) ) ( not ( = ?auto_31617 ?auto_31609 ) ) ( AVAILABLE ?auto_31609 ) ( SURFACE-AT ?auto_31604 ?auto_31613 ) ( ON ?auto_31604 ?auto_31610 ) ( CLEAR ?auto_31604 ) ( not ( = ?auto_31604 ?auto_31610 ) ) ( not ( = ?auto_31605 ?auto_31610 ) ) ( not ( = ?auto_31603 ?auto_31610 ) ) ( not ( = ?auto_31618 ?auto_31610 ) ) ( IS-CRATE ?auto_31603 ) ( not ( = ?auto_31620 ?auto_31603 ) ) ( not ( = ?auto_31604 ?auto_31620 ) ) ( not ( = ?auto_31605 ?auto_31620 ) ) ( not ( = ?auto_31618 ?auto_31620 ) ) ( not ( = ?auto_31610 ?auto_31620 ) ) ( not ( = ?auto_31615 ?auto_31612 ) ) ( not ( = ?auto_31607 ?auto_31615 ) ) ( not ( = ?auto_31613 ?auto_31615 ) ) ( HOIST-AT ?auto_31611 ?auto_31615 ) ( not ( = ?auto_31608 ?auto_31611 ) ) ( not ( = ?auto_31617 ?auto_31611 ) ) ( not ( = ?auto_31609 ?auto_31611 ) ) ( AVAILABLE ?auto_31611 ) ( SURFACE-AT ?auto_31603 ?auto_31615 ) ( ON ?auto_31603 ?auto_31619 ) ( CLEAR ?auto_31603 ) ( not ( = ?auto_31604 ?auto_31619 ) ) ( not ( = ?auto_31605 ?auto_31619 ) ) ( not ( = ?auto_31603 ?auto_31619 ) ) ( not ( = ?auto_31618 ?auto_31619 ) ) ( not ( = ?auto_31610 ?auto_31619 ) ) ( not ( = ?auto_31620 ?auto_31619 ) ) ( SURFACE-AT ?auto_31621 ?auto_31612 ) ( CLEAR ?auto_31621 ) ( IS-CRATE ?auto_31620 ) ( not ( = ?auto_31621 ?auto_31620 ) ) ( not ( = ?auto_31604 ?auto_31621 ) ) ( not ( = ?auto_31605 ?auto_31621 ) ) ( not ( = ?auto_31603 ?auto_31621 ) ) ( not ( = ?auto_31618 ?auto_31621 ) ) ( not ( = ?auto_31610 ?auto_31621 ) ) ( not ( = ?auto_31619 ?auto_31621 ) ) ( AVAILABLE ?auto_31608 ) ( TRUCK-AT ?auto_31614 ?auto_31616 ) ( not ( = ?auto_31616 ?auto_31612 ) ) ( not ( = ?auto_31607 ?auto_31616 ) ) ( not ( = ?auto_31613 ?auto_31616 ) ) ( not ( = ?auto_31615 ?auto_31616 ) ) ( HOIST-AT ?auto_31606 ?auto_31616 ) ( LIFTING ?auto_31606 ?auto_31620 ) ( not ( = ?auto_31608 ?auto_31606 ) ) ( not ( = ?auto_31617 ?auto_31606 ) ) ( not ( = ?auto_31609 ?auto_31606 ) ) ( not ( = ?auto_31611 ?auto_31606 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31604 ?auto_31605 )
      ( MAKE-2CRATE-VERIFY ?auto_31603 ?auto_31604 ?auto_31605 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31622 - SURFACE
      ?auto_31623 - SURFACE
      ?auto_31624 - SURFACE
      ?auto_31625 - SURFACE
    )
    :vars
    (
      ?auto_31635 - HOIST
      ?auto_31626 - PLACE
      ?auto_31639 - PLACE
      ?auto_31637 - HOIST
      ?auto_31633 - SURFACE
      ?auto_31629 - PLACE
      ?auto_31627 - HOIST
      ?auto_31638 - SURFACE
      ?auto_31628 - PLACE
      ?auto_31630 - HOIST
      ?auto_31636 - SURFACE
      ?auto_31634 - SURFACE
      ?auto_31640 - TRUCK
      ?auto_31632 - PLACE
      ?auto_31631 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31635 ?auto_31626 ) ( IS-CRATE ?auto_31625 ) ( not ( = ?auto_31624 ?auto_31625 ) ) ( not ( = ?auto_31623 ?auto_31624 ) ) ( not ( = ?auto_31623 ?auto_31625 ) ) ( not ( = ?auto_31639 ?auto_31626 ) ) ( HOIST-AT ?auto_31637 ?auto_31639 ) ( not ( = ?auto_31635 ?auto_31637 ) ) ( AVAILABLE ?auto_31637 ) ( SURFACE-AT ?auto_31625 ?auto_31639 ) ( ON ?auto_31625 ?auto_31633 ) ( CLEAR ?auto_31625 ) ( not ( = ?auto_31624 ?auto_31633 ) ) ( not ( = ?auto_31625 ?auto_31633 ) ) ( not ( = ?auto_31623 ?auto_31633 ) ) ( IS-CRATE ?auto_31624 ) ( not ( = ?auto_31629 ?auto_31626 ) ) ( not ( = ?auto_31639 ?auto_31629 ) ) ( HOIST-AT ?auto_31627 ?auto_31629 ) ( not ( = ?auto_31635 ?auto_31627 ) ) ( not ( = ?auto_31637 ?auto_31627 ) ) ( AVAILABLE ?auto_31627 ) ( SURFACE-AT ?auto_31624 ?auto_31629 ) ( ON ?auto_31624 ?auto_31638 ) ( CLEAR ?auto_31624 ) ( not ( = ?auto_31624 ?auto_31638 ) ) ( not ( = ?auto_31625 ?auto_31638 ) ) ( not ( = ?auto_31623 ?auto_31638 ) ) ( not ( = ?auto_31633 ?auto_31638 ) ) ( IS-CRATE ?auto_31623 ) ( not ( = ?auto_31622 ?auto_31623 ) ) ( not ( = ?auto_31624 ?auto_31622 ) ) ( not ( = ?auto_31625 ?auto_31622 ) ) ( not ( = ?auto_31633 ?auto_31622 ) ) ( not ( = ?auto_31638 ?auto_31622 ) ) ( not ( = ?auto_31628 ?auto_31626 ) ) ( not ( = ?auto_31639 ?auto_31628 ) ) ( not ( = ?auto_31629 ?auto_31628 ) ) ( HOIST-AT ?auto_31630 ?auto_31628 ) ( not ( = ?auto_31635 ?auto_31630 ) ) ( not ( = ?auto_31637 ?auto_31630 ) ) ( not ( = ?auto_31627 ?auto_31630 ) ) ( AVAILABLE ?auto_31630 ) ( SURFACE-AT ?auto_31623 ?auto_31628 ) ( ON ?auto_31623 ?auto_31636 ) ( CLEAR ?auto_31623 ) ( not ( = ?auto_31624 ?auto_31636 ) ) ( not ( = ?auto_31625 ?auto_31636 ) ) ( not ( = ?auto_31623 ?auto_31636 ) ) ( not ( = ?auto_31633 ?auto_31636 ) ) ( not ( = ?auto_31638 ?auto_31636 ) ) ( not ( = ?auto_31622 ?auto_31636 ) ) ( SURFACE-AT ?auto_31634 ?auto_31626 ) ( CLEAR ?auto_31634 ) ( IS-CRATE ?auto_31622 ) ( not ( = ?auto_31634 ?auto_31622 ) ) ( not ( = ?auto_31624 ?auto_31634 ) ) ( not ( = ?auto_31625 ?auto_31634 ) ) ( not ( = ?auto_31623 ?auto_31634 ) ) ( not ( = ?auto_31633 ?auto_31634 ) ) ( not ( = ?auto_31638 ?auto_31634 ) ) ( not ( = ?auto_31636 ?auto_31634 ) ) ( AVAILABLE ?auto_31635 ) ( TRUCK-AT ?auto_31640 ?auto_31632 ) ( not ( = ?auto_31632 ?auto_31626 ) ) ( not ( = ?auto_31639 ?auto_31632 ) ) ( not ( = ?auto_31629 ?auto_31632 ) ) ( not ( = ?auto_31628 ?auto_31632 ) ) ( HOIST-AT ?auto_31631 ?auto_31632 ) ( LIFTING ?auto_31631 ?auto_31622 ) ( not ( = ?auto_31635 ?auto_31631 ) ) ( not ( = ?auto_31637 ?auto_31631 ) ) ( not ( = ?auto_31627 ?auto_31631 ) ) ( not ( = ?auto_31630 ?auto_31631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31623 ?auto_31624 ?auto_31625 )
      ( MAKE-3CRATE-VERIFY ?auto_31622 ?auto_31623 ?auto_31624 ?auto_31625 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31641 - SURFACE
      ?auto_31642 - SURFACE
      ?auto_31643 - SURFACE
      ?auto_31644 - SURFACE
      ?auto_31645 - SURFACE
    )
    :vars
    (
      ?auto_31654 - HOIST
      ?auto_31646 - PLACE
      ?auto_31658 - PLACE
      ?auto_31656 - HOIST
      ?auto_31653 - SURFACE
      ?auto_31649 - PLACE
      ?auto_31647 - HOIST
      ?auto_31657 - SURFACE
      ?auto_31648 - PLACE
      ?auto_31650 - HOIST
      ?auto_31655 - SURFACE
      ?auto_31659 - TRUCK
      ?auto_31652 - PLACE
      ?auto_31651 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31654 ?auto_31646 ) ( IS-CRATE ?auto_31645 ) ( not ( = ?auto_31644 ?auto_31645 ) ) ( not ( = ?auto_31643 ?auto_31644 ) ) ( not ( = ?auto_31643 ?auto_31645 ) ) ( not ( = ?auto_31658 ?auto_31646 ) ) ( HOIST-AT ?auto_31656 ?auto_31658 ) ( not ( = ?auto_31654 ?auto_31656 ) ) ( AVAILABLE ?auto_31656 ) ( SURFACE-AT ?auto_31645 ?auto_31658 ) ( ON ?auto_31645 ?auto_31653 ) ( CLEAR ?auto_31645 ) ( not ( = ?auto_31644 ?auto_31653 ) ) ( not ( = ?auto_31645 ?auto_31653 ) ) ( not ( = ?auto_31643 ?auto_31653 ) ) ( IS-CRATE ?auto_31644 ) ( not ( = ?auto_31649 ?auto_31646 ) ) ( not ( = ?auto_31658 ?auto_31649 ) ) ( HOIST-AT ?auto_31647 ?auto_31649 ) ( not ( = ?auto_31654 ?auto_31647 ) ) ( not ( = ?auto_31656 ?auto_31647 ) ) ( AVAILABLE ?auto_31647 ) ( SURFACE-AT ?auto_31644 ?auto_31649 ) ( ON ?auto_31644 ?auto_31657 ) ( CLEAR ?auto_31644 ) ( not ( = ?auto_31644 ?auto_31657 ) ) ( not ( = ?auto_31645 ?auto_31657 ) ) ( not ( = ?auto_31643 ?auto_31657 ) ) ( not ( = ?auto_31653 ?auto_31657 ) ) ( IS-CRATE ?auto_31643 ) ( not ( = ?auto_31642 ?auto_31643 ) ) ( not ( = ?auto_31644 ?auto_31642 ) ) ( not ( = ?auto_31645 ?auto_31642 ) ) ( not ( = ?auto_31653 ?auto_31642 ) ) ( not ( = ?auto_31657 ?auto_31642 ) ) ( not ( = ?auto_31648 ?auto_31646 ) ) ( not ( = ?auto_31658 ?auto_31648 ) ) ( not ( = ?auto_31649 ?auto_31648 ) ) ( HOIST-AT ?auto_31650 ?auto_31648 ) ( not ( = ?auto_31654 ?auto_31650 ) ) ( not ( = ?auto_31656 ?auto_31650 ) ) ( not ( = ?auto_31647 ?auto_31650 ) ) ( AVAILABLE ?auto_31650 ) ( SURFACE-AT ?auto_31643 ?auto_31648 ) ( ON ?auto_31643 ?auto_31655 ) ( CLEAR ?auto_31643 ) ( not ( = ?auto_31644 ?auto_31655 ) ) ( not ( = ?auto_31645 ?auto_31655 ) ) ( not ( = ?auto_31643 ?auto_31655 ) ) ( not ( = ?auto_31653 ?auto_31655 ) ) ( not ( = ?auto_31657 ?auto_31655 ) ) ( not ( = ?auto_31642 ?auto_31655 ) ) ( SURFACE-AT ?auto_31641 ?auto_31646 ) ( CLEAR ?auto_31641 ) ( IS-CRATE ?auto_31642 ) ( not ( = ?auto_31641 ?auto_31642 ) ) ( not ( = ?auto_31644 ?auto_31641 ) ) ( not ( = ?auto_31645 ?auto_31641 ) ) ( not ( = ?auto_31643 ?auto_31641 ) ) ( not ( = ?auto_31653 ?auto_31641 ) ) ( not ( = ?auto_31657 ?auto_31641 ) ) ( not ( = ?auto_31655 ?auto_31641 ) ) ( AVAILABLE ?auto_31654 ) ( TRUCK-AT ?auto_31659 ?auto_31652 ) ( not ( = ?auto_31652 ?auto_31646 ) ) ( not ( = ?auto_31658 ?auto_31652 ) ) ( not ( = ?auto_31649 ?auto_31652 ) ) ( not ( = ?auto_31648 ?auto_31652 ) ) ( HOIST-AT ?auto_31651 ?auto_31652 ) ( LIFTING ?auto_31651 ?auto_31642 ) ( not ( = ?auto_31654 ?auto_31651 ) ) ( not ( = ?auto_31656 ?auto_31651 ) ) ( not ( = ?auto_31647 ?auto_31651 ) ) ( not ( = ?auto_31650 ?auto_31651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31643 ?auto_31644 ?auto_31645 )
      ( MAKE-4CRATE-VERIFY ?auto_31641 ?auto_31642 ?auto_31643 ?auto_31644 ?auto_31645 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31660 - SURFACE
      ?auto_31661 - SURFACE
      ?auto_31662 - SURFACE
      ?auto_31663 - SURFACE
      ?auto_31664 - SURFACE
      ?auto_31665 - SURFACE
    )
    :vars
    (
      ?auto_31674 - HOIST
      ?auto_31666 - PLACE
      ?auto_31678 - PLACE
      ?auto_31676 - HOIST
      ?auto_31673 - SURFACE
      ?auto_31669 - PLACE
      ?auto_31667 - HOIST
      ?auto_31677 - SURFACE
      ?auto_31668 - PLACE
      ?auto_31670 - HOIST
      ?auto_31675 - SURFACE
      ?auto_31679 - TRUCK
      ?auto_31672 - PLACE
      ?auto_31671 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31674 ?auto_31666 ) ( IS-CRATE ?auto_31665 ) ( not ( = ?auto_31664 ?auto_31665 ) ) ( not ( = ?auto_31663 ?auto_31664 ) ) ( not ( = ?auto_31663 ?auto_31665 ) ) ( not ( = ?auto_31678 ?auto_31666 ) ) ( HOIST-AT ?auto_31676 ?auto_31678 ) ( not ( = ?auto_31674 ?auto_31676 ) ) ( AVAILABLE ?auto_31676 ) ( SURFACE-AT ?auto_31665 ?auto_31678 ) ( ON ?auto_31665 ?auto_31673 ) ( CLEAR ?auto_31665 ) ( not ( = ?auto_31664 ?auto_31673 ) ) ( not ( = ?auto_31665 ?auto_31673 ) ) ( not ( = ?auto_31663 ?auto_31673 ) ) ( IS-CRATE ?auto_31664 ) ( not ( = ?auto_31669 ?auto_31666 ) ) ( not ( = ?auto_31678 ?auto_31669 ) ) ( HOIST-AT ?auto_31667 ?auto_31669 ) ( not ( = ?auto_31674 ?auto_31667 ) ) ( not ( = ?auto_31676 ?auto_31667 ) ) ( AVAILABLE ?auto_31667 ) ( SURFACE-AT ?auto_31664 ?auto_31669 ) ( ON ?auto_31664 ?auto_31677 ) ( CLEAR ?auto_31664 ) ( not ( = ?auto_31664 ?auto_31677 ) ) ( not ( = ?auto_31665 ?auto_31677 ) ) ( not ( = ?auto_31663 ?auto_31677 ) ) ( not ( = ?auto_31673 ?auto_31677 ) ) ( IS-CRATE ?auto_31663 ) ( not ( = ?auto_31662 ?auto_31663 ) ) ( not ( = ?auto_31664 ?auto_31662 ) ) ( not ( = ?auto_31665 ?auto_31662 ) ) ( not ( = ?auto_31673 ?auto_31662 ) ) ( not ( = ?auto_31677 ?auto_31662 ) ) ( not ( = ?auto_31668 ?auto_31666 ) ) ( not ( = ?auto_31678 ?auto_31668 ) ) ( not ( = ?auto_31669 ?auto_31668 ) ) ( HOIST-AT ?auto_31670 ?auto_31668 ) ( not ( = ?auto_31674 ?auto_31670 ) ) ( not ( = ?auto_31676 ?auto_31670 ) ) ( not ( = ?auto_31667 ?auto_31670 ) ) ( AVAILABLE ?auto_31670 ) ( SURFACE-AT ?auto_31663 ?auto_31668 ) ( ON ?auto_31663 ?auto_31675 ) ( CLEAR ?auto_31663 ) ( not ( = ?auto_31664 ?auto_31675 ) ) ( not ( = ?auto_31665 ?auto_31675 ) ) ( not ( = ?auto_31663 ?auto_31675 ) ) ( not ( = ?auto_31673 ?auto_31675 ) ) ( not ( = ?auto_31677 ?auto_31675 ) ) ( not ( = ?auto_31662 ?auto_31675 ) ) ( SURFACE-AT ?auto_31661 ?auto_31666 ) ( CLEAR ?auto_31661 ) ( IS-CRATE ?auto_31662 ) ( not ( = ?auto_31661 ?auto_31662 ) ) ( not ( = ?auto_31664 ?auto_31661 ) ) ( not ( = ?auto_31665 ?auto_31661 ) ) ( not ( = ?auto_31663 ?auto_31661 ) ) ( not ( = ?auto_31673 ?auto_31661 ) ) ( not ( = ?auto_31677 ?auto_31661 ) ) ( not ( = ?auto_31675 ?auto_31661 ) ) ( AVAILABLE ?auto_31674 ) ( TRUCK-AT ?auto_31679 ?auto_31672 ) ( not ( = ?auto_31672 ?auto_31666 ) ) ( not ( = ?auto_31678 ?auto_31672 ) ) ( not ( = ?auto_31669 ?auto_31672 ) ) ( not ( = ?auto_31668 ?auto_31672 ) ) ( HOIST-AT ?auto_31671 ?auto_31672 ) ( LIFTING ?auto_31671 ?auto_31662 ) ( not ( = ?auto_31674 ?auto_31671 ) ) ( not ( = ?auto_31676 ?auto_31671 ) ) ( not ( = ?auto_31667 ?auto_31671 ) ) ( not ( = ?auto_31670 ?auto_31671 ) ) ( ON ?auto_31661 ?auto_31660 ) ( not ( = ?auto_31660 ?auto_31661 ) ) ( not ( = ?auto_31660 ?auto_31662 ) ) ( not ( = ?auto_31660 ?auto_31663 ) ) ( not ( = ?auto_31660 ?auto_31664 ) ) ( not ( = ?auto_31660 ?auto_31665 ) ) ( not ( = ?auto_31660 ?auto_31673 ) ) ( not ( = ?auto_31660 ?auto_31677 ) ) ( not ( = ?auto_31660 ?auto_31675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31663 ?auto_31664 ?auto_31665 )
      ( MAKE-5CRATE-VERIFY ?auto_31660 ?auto_31661 ?auto_31662 ?auto_31663 ?auto_31664 ?auto_31665 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31680 - SURFACE
      ?auto_31681 - SURFACE
    )
    :vars
    (
      ?auto_31693 - HOIST
      ?auto_31682 - PLACE
      ?auto_31684 - SURFACE
      ?auto_31697 - PLACE
      ?auto_31695 - HOIST
      ?auto_31691 - SURFACE
      ?auto_31687 - PLACE
      ?auto_31685 - HOIST
      ?auto_31696 - SURFACE
      ?auto_31683 - SURFACE
      ?auto_31686 - PLACE
      ?auto_31688 - HOIST
      ?auto_31694 - SURFACE
      ?auto_31692 - SURFACE
      ?auto_31698 - TRUCK
      ?auto_31690 - PLACE
      ?auto_31689 - HOIST
      ?auto_31699 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31693 ?auto_31682 ) ( IS-CRATE ?auto_31681 ) ( not ( = ?auto_31680 ?auto_31681 ) ) ( not ( = ?auto_31684 ?auto_31680 ) ) ( not ( = ?auto_31684 ?auto_31681 ) ) ( not ( = ?auto_31697 ?auto_31682 ) ) ( HOIST-AT ?auto_31695 ?auto_31697 ) ( not ( = ?auto_31693 ?auto_31695 ) ) ( AVAILABLE ?auto_31695 ) ( SURFACE-AT ?auto_31681 ?auto_31697 ) ( ON ?auto_31681 ?auto_31691 ) ( CLEAR ?auto_31681 ) ( not ( = ?auto_31680 ?auto_31691 ) ) ( not ( = ?auto_31681 ?auto_31691 ) ) ( not ( = ?auto_31684 ?auto_31691 ) ) ( IS-CRATE ?auto_31680 ) ( not ( = ?auto_31687 ?auto_31682 ) ) ( not ( = ?auto_31697 ?auto_31687 ) ) ( HOIST-AT ?auto_31685 ?auto_31687 ) ( not ( = ?auto_31693 ?auto_31685 ) ) ( not ( = ?auto_31695 ?auto_31685 ) ) ( AVAILABLE ?auto_31685 ) ( SURFACE-AT ?auto_31680 ?auto_31687 ) ( ON ?auto_31680 ?auto_31696 ) ( CLEAR ?auto_31680 ) ( not ( = ?auto_31680 ?auto_31696 ) ) ( not ( = ?auto_31681 ?auto_31696 ) ) ( not ( = ?auto_31684 ?auto_31696 ) ) ( not ( = ?auto_31691 ?auto_31696 ) ) ( IS-CRATE ?auto_31684 ) ( not ( = ?auto_31683 ?auto_31684 ) ) ( not ( = ?auto_31680 ?auto_31683 ) ) ( not ( = ?auto_31681 ?auto_31683 ) ) ( not ( = ?auto_31691 ?auto_31683 ) ) ( not ( = ?auto_31696 ?auto_31683 ) ) ( not ( = ?auto_31686 ?auto_31682 ) ) ( not ( = ?auto_31697 ?auto_31686 ) ) ( not ( = ?auto_31687 ?auto_31686 ) ) ( HOIST-AT ?auto_31688 ?auto_31686 ) ( not ( = ?auto_31693 ?auto_31688 ) ) ( not ( = ?auto_31695 ?auto_31688 ) ) ( not ( = ?auto_31685 ?auto_31688 ) ) ( AVAILABLE ?auto_31688 ) ( SURFACE-AT ?auto_31684 ?auto_31686 ) ( ON ?auto_31684 ?auto_31694 ) ( CLEAR ?auto_31684 ) ( not ( = ?auto_31680 ?auto_31694 ) ) ( not ( = ?auto_31681 ?auto_31694 ) ) ( not ( = ?auto_31684 ?auto_31694 ) ) ( not ( = ?auto_31691 ?auto_31694 ) ) ( not ( = ?auto_31696 ?auto_31694 ) ) ( not ( = ?auto_31683 ?auto_31694 ) ) ( SURFACE-AT ?auto_31692 ?auto_31682 ) ( CLEAR ?auto_31692 ) ( IS-CRATE ?auto_31683 ) ( not ( = ?auto_31692 ?auto_31683 ) ) ( not ( = ?auto_31680 ?auto_31692 ) ) ( not ( = ?auto_31681 ?auto_31692 ) ) ( not ( = ?auto_31684 ?auto_31692 ) ) ( not ( = ?auto_31691 ?auto_31692 ) ) ( not ( = ?auto_31696 ?auto_31692 ) ) ( not ( = ?auto_31694 ?auto_31692 ) ) ( AVAILABLE ?auto_31693 ) ( TRUCK-AT ?auto_31698 ?auto_31690 ) ( not ( = ?auto_31690 ?auto_31682 ) ) ( not ( = ?auto_31697 ?auto_31690 ) ) ( not ( = ?auto_31687 ?auto_31690 ) ) ( not ( = ?auto_31686 ?auto_31690 ) ) ( HOIST-AT ?auto_31689 ?auto_31690 ) ( not ( = ?auto_31693 ?auto_31689 ) ) ( not ( = ?auto_31695 ?auto_31689 ) ) ( not ( = ?auto_31685 ?auto_31689 ) ) ( not ( = ?auto_31688 ?auto_31689 ) ) ( AVAILABLE ?auto_31689 ) ( SURFACE-AT ?auto_31683 ?auto_31690 ) ( ON ?auto_31683 ?auto_31699 ) ( CLEAR ?auto_31683 ) ( not ( = ?auto_31680 ?auto_31699 ) ) ( not ( = ?auto_31681 ?auto_31699 ) ) ( not ( = ?auto_31684 ?auto_31699 ) ) ( not ( = ?auto_31691 ?auto_31699 ) ) ( not ( = ?auto_31696 ?auto_31699 ) ) ( not ( = ?auto_31683 ?auto_31699 ) ) ( not ( = ?auto_31694 ?auto_31699 ) ) ( not ( = ?auto_31692 ?auto_31699 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31689 ?auto_31683 ?auto_31699 ?auto_31690 )
      ( MAKE-2CRATE ?auto_31684 ?auto_31680 ?auto_31681 )
      ( MAKE-1CRATE-VERIFY ?auto_31680 ?auto_31681 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31700 - SURFACE
      ?auto_31701 - SURFACE
      ?auto_31702 - SURFACE
    )
    :vars
    (
      ?auto_31709 - HOIST
      ?auto_31716 - PLACE
      ?auto_31711 - PLACE
      ?auto_31717 - HOIST
      ?auto_31712 - SURFACE
      ?auto_31714 - PLACE
      ?auto_31706 - HOIST
      ?auto_31713 - SURFACE
      ?auto_31704 - SURFACE
      ?auto_31718 - PLACE
      ?auto_31703 - HOIST
      ?auto_31715 - SURFACE
      ?auto_31705 - SURFACE
      ?auto_31719 - TRUCK
      ?auto_31708 - PLACE
      ?auto_31710 - HOIST
      ?auto_31707 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31709 ?auto_31716 ) ( IS-CRATE ?auto_31702 ) ( not ( = ?auto_31701 ?auto_31702 ) ) ( not ( = ?auto_31700 ?auto_31701 ) ) ( not ( = ?auto_31700 ?auto_31702 ) ) ( not ( = ?auto_31711 ?auto_31716 ) ) ( HOIST-AT ?auto_31717 ?auto_31711 ) ( not ( = ?auto_31709 ?auto_31717 ) ) ( AVAILABLE ?auto_31717 ) ( SURFACE-AT ?auto_31702 ?auto_31711 ) ( ON ?auto_31702 ?auto_31712 ) ( CLEAR ?auto_31702 ) ( not ( = ?auto_31701 ?auto_31712 ) ) ( not ( = ?auto_31702 ?auto_31712 ) ) ( not ( = ?auto_31700 ?auto_31712 ) ) ( IS-CRATE ?auto_31701 ) ( not ( = ?auto_31714 ?auto_31716 ) ) ( not ( = ?auto_31711 ?auto_31714 ) ) ( HOIST-AT ?auto_31706 ?auto_31714 ) ( not ( = ?auto_31709 ?auto_31706 ) ) ( not ( = ?auto_31717 ?auto_31706 ) ) ( AVAILABLE ?auto_31706 ) ( SURFACE-AT ?auto_31701 ?auto_31714 ) ( ON ?auto_31701 ?auto_31713 ) ( CLEAR ?auto_31701 ) ( not ( = ?auto_31701 ?auto_31713 ) ) ( not ( = ?auto_31702 ?auto_31713 ) ) ( not ( = ?auto_31700 ?auto_31713 ) ) ( not ( = ?auto_31712 ?auto_31713 ) ) ( IS-CRATE ?auto_31700 ) ( not ( = ?auto_31704 ?auto_31700 ) ) ( not ( = ?auto_31701 ?auto_31704 ) ) ( not ( = ?auto_31702 ?auto_31704 ) ) ( not ( = ?auto_31712 ?auto_31704 ) ) ( not ( = ?auto_31713 ?auto_31704 ) ) ( not ( = ?auto_31718 ?auto_31716 ) ) ( not ( = ?auto_31711 ?auto_31718 ) ) ( not ( = ?auto_31714 ?auto_31718 ) ) ( HOIST-AT ?auto_31703 ?auto_31718 ) ( not ( = ?auto_31709 ?auto_31703 ) ) ( not ( = ?auto_31717 ?auto_31703 ) ) ( not ( = ?auto_31706 ?auto_31703 ) ) ( AVAILABLE ?auto_31703 ) ( SURFACE-AT ?auto_31700 ?auto_31718 ) ( ON ?auto_31700 ?auto_31715 ) ( CLEAR ?auto_31700 ) ( not ( = ?auto_31701 ?auto_31715 ) ) ( not ( = ?auto_31702 ?auto_31715 ) ) ( not ( = ?auto_31700 ?auto_31715 ) ) ( not ( = ?auto_31712 ?auto_31715 ) ) ( not ( = ?auto_31713 ?auto_31715 ) ) ( not ( = ?auto_31704 ?auto_31715 ) ) ( SURFACE-AT ?auto_31705 ?auto_31716 ) ( CLEAR ?auto_31705 ) ( IS-CRATE ?auto_31704 ) ( not ( = ?auto_31705 ?auto_31704 ) ) ( not ( = ?auto_31701 ?auto_31705 ) ) ( not ( = ?auto_31702 ?auto_31705 ) ) ( not ( = ?auto_31700 ?auto_31705 ) ) ( not ( = ?auto_31712 ?auto_31705 ) ) ( not ( = ?auto_31713 ?auto_31705 ) ) ( not ( = ?auto_31715 ?auto_31705 ) ) ( AVAILABLE ?auto_31709 ) ( TRUCK-AT ?auto_31719 ?auto_31708 ) ( not ( = ?auto_31708 ?auto_31716 ) ) ( not ( = ?auto_31711 ?auto_31708 ) ) ( not ( = ?auto_31714 ?auto_31708 ) ) ( not ( = ?auto_31718 ?auto_31708 ) ) ( HOIST-AT ?auto_31710 ?auto_31708 ) ( not ( = ?auto_31709 ?auto_31710 ) ) ( not ( = ?auto_31717 ?auto_31710 ) ) ( not ( = ?auto_31706 ?auto_31710 ) ) ( not ( = ?auto_31703 ?auto_31710 ) ) ( AVAILABLE ?auto_31710 ) ( SURFACE-AT ?auto_31704 ?auto_31708 ) ( ON ?auto_31704 ?auto_31707 ) ( CLEAR ?auto_31704 ) ( not ( = ?auto_31701 ?auto_31707 ) ) ( not ( = ?auto_31702 ?auto_31707 ) ) ( not ( = ?auto_31700 ?auto_31707 ) ) ( not ( = ?auto_31712 ?auto_31707 ) ) ( not ( = ?auto_31713 ?auto_31707 ) ) ( not ( = ?auto_31704 ?auto_31707 ) ) ( not ( = ?auto_31715 ?auto_31707 ) ) ( not ( = ?auto_31705 ?auto_31707 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31701 ?auto_31702 )
      ( MAKE-2CRATE-VERIFY ?auto_31700 ?auto_31701 ?auto_31702 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31720 - SURFACE
      ?auto_31721 - SURFACE
      ?auto_31722 - SURFACE
      ?auto_31723 - SURFACE
    )
    :vars
    (
      ?auto_31730 - HOIST
      ?auto_31735 - PLACE
      ?auto_31724 - PLACE
      ?auto_31726 - HOIST
      ?auto_31725 - SURFACE
      ?auto_31736 - PLACE
      ?auto_31739 - HOIST
      ?auto_31734 - SURFACE
      ?auto_31729 - PLACE
      ?auto_31731 - HOIST
      ?auto_31738 - SURFACE
      ?auto_31728 - SURFACE
      ?auto_31727 - TRUCK
      ?auto_31733 - PLACE
      ?auto_31732 - HOIST
      ?auto_31737 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31730 ?auto_31735 ) ( IS-CRATE ?auto_31723 ) ( not ( = ?auto_31722 ?auto_31723 ) ) ( not ( = ?auto_31721 ?auto_31722 ) ) ( not ( = ?auto_31721 ?auto_31723 ) ) ( not ( = ?auto_31724 ?auto_31735 ) ) ( HOIST-AT ?auto_31726 ?auto_31724 ) ( not ( = ?auto_31730 ?auto_31726 ) ) ( AVAILABLE ?auto_31726 ) ( SURFACE-AT ?auto_31723 ?auto_31724 ) ( ON ?auto_31723 ?auto_31725 ) ( CLEAR ?auto_31723 ) ( not ( = ?auto_31722 ?auto_31725 ) ) ( not ( = ?auto_31723 ?auto_31725 ) ) ( not ( = ?auto_31721 ?auto_31725 ) ) ( IS-CRATE ?auto_31722 ) ( not ( = ?auto_31736 ?auto_31735 ) ) ( not ( = ?auto_31724 ?auto_31736 ) ) ( HOIST-AT ?auto_31739 ?auto_31736 ) ( not ( = ?auto_31730 ?auto_31739 ) ) ( not ( = ?auto_31726 ?auto_31739 ) ) ( AVAILABLE ?auto_31739 ) ( SURFACE-AT ?auto_31722 ?auto_31736 ) ( ON ?auto_31722 ?auto_31734 ) ( CLEAR ?auto_31722 ) ( not ( = ?auto_31722 ?auto_31734 ) ) ( not ( = ?auto_31723 ?auto_31734 ) ) ( not ( = ?auto_31721 ?auto_31734 ) ) ( not ( = ?auto_31725 ?auto_31734 ) ) ( IS-CRATE ?auto_31721 ) ( not ( = ?auto_31720 ?auto_31721 ) ) ( not ( = ?auto_31722 ?auto_31720 ) ) ( not ( = ?auto_31723 ?auto_31720 ) ) ( not ( = ?auto_31725 ?auto_31720 ) ) ( not ( = ?auto_31734 ?auto_31720 ) ) ( not ( = ?auto_31729 ?auto_31735 ) ) ( not ( = ?auto_31724 ?auto_31729 ) ) ( not ( = ?auto_31736 ?auto_31729 ) ) ( HOIST-AT ?auto_31731 ?auto_31729 ) ( not ( = ?auto_31730 ?auto_31731 ) ) ( not ( = ?auto_31726 ?auto_31731 ) ) ( not ( = ?auto_31739 ?auto_31731 ) ) ( AVAILABLE ?auto_31731 ) ( SURFACE-AT ?auto_31721 ?auto_31729 ) ( ON ?auto_31721 ?auto_31738 ) ( CLEAR ?auto_31721 ) ( not ( = ?auto_31722 ?auto_31738 ) ) ( not ( = ?auto_31723 ?auto_31738 ) ) ( not ( = ?auto_31721 ?auto_31738 ) ) ( not ( = ?auto_31725 ?auto_31738 ) ) ( not ( = ?auto_31734 ?auto_31738 ) ) ( not ( = ?auto_31720 ?auto_31738 ) ) ( SURFACE-AT ?auto_31728 ?auto_31735 ) ( CLEAR ?auto_31728 ) ( IS-CRATE ?auto_31720 ) ( not ( = ?auto_31728 ?auto_31720 ) ) ( not ( = ?auto_31722 ?auto_31728 ) ) ( not ( = ?auto_31723 ?auto_31728 ) ) ( not ( = ?auto_31721 ?auto_31728 ) ) ( not ( = ?auto_31725 ?auto_31728 ) ) ( not ( = ?auto_31734 ?auto_31728 ) ) ( not ( = ?auto_31738 ?auto_31728 ) ) ( AVAILABLE ?auto_31730 ) ( TRUCK-AT ?auto_31727 ?auto_31733 ) ( not ( = ?auto_31733 ?auto_31735 ) ) ( not ( = ?auto_31724 ?auto_31733 ) ) ( not ( = ?auto_31736 ?auto_31733 ) ) ( not ( = ?auto_31729 ?auto_31733 ) ) ( HOIST-AT ?auto_31732 ?auto_31733 ) ( not ( = ?auto_31730 ?auto_31732 ) ) ( not ( = ?auto_31726 ?auto_31732 ) ) ( not ( = ?auto_31739 ?auto_31732 ) ) ( not ( = ?auto_31731 ?auto_31732 ) ) ( AVAILABLE ?auto_31732 ) ( SURFACE-AT ?auto_31720 ?auto_31733 ) ( ON ?auto_31720 ?auto_31737 ) ( CLEAR ?auto_31720 ) ( not ( = ?auto_31722 ?auto_31737 ) ) ( not ( = ?auto_31723 ?auto_31737 ) ) ( not ( = ?auto_31721 ?auto_31737 ) ) ( not ( = ?auto_31725 ?auto_31737 ) ) ( not ( = ?auto_31734 ?auto_31737 ) ) ( not ( = ?auto_31720 ?auto_31737 ) ) ( not ( = ?auto_31738 ?auto_31737 ) ) ( not ( = ?auto_31728 ?auto_31737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31721 ?auto_31722 ?auto_31723 )
      ( MAKE-3CRATE-VERIFY ?auto_31720 ?auto_31721 ?auto_31722 ?auto_31723 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31740 - SURFACE
      ?auto_31741 - SURFACE
      ?auto_31742 - SURFACE
      ?auto_31743 - SURFACE
      ?auto_31744 - SURFACE
    )
    :vars
    (
      ?auto_31750 - HOIST
      ?auto_31755 - PLACE
      ?auto_31745 - PLACE
      ?auto_31747 - HOIST
      ?auto_31746 - SURFACE
      ?auto_31756 - PLACE
      ?auto_31759 - HOIST
      ?auto_31754 - SURFACE
      ?auto_31749 - PLACE
      ?auto_31751 - HOIST
      ?auto_31758 - SURFACE
      ?auto_31748 - TRUCK
      ?auto_31753 - PLACE
      ?auto_31752 - HOIST
      ?auto_31757 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31750 ?auto_31755 ) ( IS-CRATE ?auto_31744 ) ( not ( = ?auto_31743 ?auto_31744 ) ) ( not ( = ?auto_31742 ?auto_31743 ) ) ( not ( = ?auto_31742 ?auto_31744 ) ) ( not ( = ?auto_31745 ?auto_31755 ) ) ( HOIST-AT ?auto_31747 ?auto_31745 ) ( not ( = ?auto_31750 ?auto_31747 ) ) ( AVAILABLE ?auto_31747 ) ( SURFACE-AT ?auto_31744 ?auto_31745 ) ( ON ?auto_31744 ?auto_31746 ) ( CLEAR ?auto_31744 ) ( not ( = ?auto_31743 ?auto_31746 ) ) ( not ( = ?auto_31744 ?auto_31746 ) ) ( not ( = ?auto_31742 ?auto_31746 ) ) ( IS-CRATE ?auto_31743 ) ( not ( = ?auto_31756 ?auto_31755 ) ) ( not ( = ?auto_31745 ?auto_31756 ) ) ( HOIST-AT ?auto_31759 ?auto_31756 ) ( not ( = ?auto_31750 ?auto_31759 ) ) ( not ( = ?auto_31747 ?auto_31759 ) ) ( AVAILABLE ?auto_31759 ) ( SURFACE-AT ?auto_31743 ?auto_31756 ) ( ON ?auto_31743 ?auto_31754 ) ( CLEAR ?auto_31743 ) ( not ( = ?auto_31743 ?auto_31754 ) ) ( not ( = ?auto_31744 ?auto_31754 ) ) ( not ( = ?auto_31742 ?auto_31754 ) ) ( not ( = ?auto_31746 ?auto_31754 ) ) ( IS-CRATE ?auto_31742 ) ( not ( = ?auto_31741 ?auto_31742 ) ) ( not ( = ?auto_31743 ?auto_31741 ) ) ( not ( = ?auto_31744 ?auto_31741 ) ) ( not ( = ?auto_31746 ?auto_31741 ) ) ( not ( = ?auto_31754 ?auto_31741 ) ) ( not ( = ?auto_31749 ?auto_31755 ) ) ( not ( = ?auto_31745 ?auto_31749 ) ) ( not ( = ?auto_31756 ?auto_31749 ) ) ( HOIST-AT ?auto_31751 ?auto_31749 ) ( not ( = ?auto_31750 ?auto_31751 ) ) ( not ( = ?auto_31747 ?auto_31751 ) ) ( not ( = ?auto_31759 ?auto_31751 ) ) ( AVAILABLE ?auto_31751 ) ( SURFACE-AT ?auto_31742 ?auto_31749 ) ( ON ?auto_31742 ?auto_31758 ) ( CLEAR ?auto_31742 ) ( not ( = ?auto_31743 ?auto_31758 ) ) ( not ( = ?auto_31744 ?auto_31758 ) ) ( not ( = ?auto_31742 ?auto_31758 ) ) ( not ( = ?auto_31746 ?auto_31758 ) ) ( not ( = ?auto_31754 ?auto_31758 ) ) ( not ( = ?auto_31741 ?auto_31758 ) ) ( SURFACE-AT ?auto_31740 ?auto_31755 ) ( CLEAR ?auto_31740 ) ( IS-CRATE ?auto_31741 ) ( not ( = ?auto_31740 ?auto_31741 ) ) ( not ( = ?auto_31743 ?auto_31740 ) ) ( not ( = ?auto_31744 ?auto_31740 ) ) ( not ( = ?auto_31742 ?auto_31740 ) ) ( not ( = ?auto_31746 ?auto_31740 ) ) ( not ( = ?auto_31754 ?auto_31740 ) ) ( not ( = ?auto_31758 ?auto_31740 ) ) ( AVAILABLE ?auto_31750 ) ( TRUCK-AT ?auto_31748 ?auto_31753 ) ( not ( = ?auto_31753 ?auto_31755 ) ) ( not ( = ?auto_31745 ?auto_31753 ) ) ( not ( = ?auto_31756 ?auto_31753 ) ) ( not ( = ?auto_31749 ?auto_31753 ) ) ( HOIST-AT ?auto_31752 ?auto_31753 ) ( not ( = ?auto_31750 ?auto_31752 ) ) ( not ( = ?auto_31747 ?auto_31752 ) ) ( not ( = ?auto_31759 ?auto_31752 ) ) ( not ( = ?auto_31751 ?auto_31752 ) ) ( AVAILABLE ?auto_31752 ) ( SURFACE-AT ?auto_31741 ?auto_31753 ) ( ON ?auto_31741 ?auto_31757 ) ( CLEAR ?auto_31741 ) ( not ( = ?auto_31743 ?auto_31757 ) ) ( not ( = ?auto_31744 ?auto_31757 ) ) ( not ( = ?auto_31742 ?auto_31757 ) ) ( not ( = ?auto_31746 ?auto_31757 ) ) ( not ( = ?auto_31754 ?auto_31757 ) ) ( not ( = ?auto_31741 ?auto_31757 ) ) ( not ( = ?auto_31758 ?auto_31757 ) ) ( not ( = ?auto_31740 ?auto_31757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31742 ?auto_31743 ?auto_31744 )
      ( MAKE-4CRATE-VERIFY ?auto_31740 ?auto_31741 ?auto_31742 ?auto_31743 ?auto_31744 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31760 - SURFACE
      ?auto_31761 - SURFACE
      ?auto_31762 - SURFACE
      ?auto_31763 - SURFACE
      ?auto_31764 - SURFACE
      ?auto_31765 - SURFACE
    )
    :vars
    (
      ?auto_31771 - HOIST
      ?auto_31776 - PLACE
      ?auto_31766 - PLACE
      ?auto_31768 - HOIST
      ?auto_31767 - SURFACE
      ?auto_31777 - PLACE
      ?auto_31780 - HOIST
      ?auto_31775 - SURFACE
      ?auto_31770 - PLACE
      ?auto_31772 - HOIST
      ?auto_31779 - SURFACE
      ?auto_31769 - TRUCK
      ?auto_31774 - PLACE
      ?auto_31773 - HOIST
      ?auto_31778 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31771 ?auto_31776 ) ( IS-CRATE ?auto_31765 ) ( not ( = ?auto_31764 ?auto_31765 ) ) ( not ( = ?auto_31763 ?auto_31764 ) ) ( not ( = ?auto_31763 ?auto_31765 ) ) ( not ( = ?auto_31766 ?auto_31776 ) ) ( HOIST-AT ?auto_31768 ?auto_31766 ) ( not ( = ?auto_31771 ?auto_31768 ) ) ( AVAILABLE ?auto_31768 ) ( SURFACE-AT ?auto_31765 ?auto_31766 ) ( ON ?auto_31765 ?auto_31767 ) ( CLEAR ?auto_31765 ) ( not ( = ?auto_31764 ?auto_31767 ) ) ( not ( = ?auto_31765 ?auto_31767 ) ) ( not ( = ?auto_31763 ?auto_31767 ) ) ( IS-CRATE ?auto_31764 ) ( not ( = ?auto_31777 ?auto_31776 ) ) ( not ( = ?auto_31766 ?auto_31777 ) ) ( HOIST-AT ?auto_31780 ?auto_31777 ) ( not ( = ?auto_31771 ?auto_31780 ) ) ( not ( = ?auto_31768 ?auto_31780 ) ) ( AVAILABLE ?auto_31780 ) ( SURFACE-AT ?auto_31764 ?auto_31777 ) ( ON ?auto_31764 ?auto_31775 ) ( CLEAR ?auto_31764 ) ( not ( = ?auto_31764 ?auto_31775 ) ) ( not ( = ?auto_31765 ?auto_31775 ) ) ( not ( = ?auto_31763 ?auto_31775 ) ) ( not ( = ?auto_31767 ?auto_31775 ) ) ( IS-CRATE ?auto_31763 ) ( not ( = ?auto_31762 ?auto_31763 ) ) ( not ( = ?auto_31764 ?auto_31762 ) ) ( not ( = ?auto_31765 ?auto_31762 ) ) ( not ( = ?auto_31767 ?auto_31762 ) ) ( not ( = ?auto_31775 ?auto_31762 ) ) ( not ( = ?auto_31770 ?auto_31776 ) ) ( not ( = ?auto_31766 ?auto_31770 ) ) ( not ( = ?auto_31777 ?auto_31770 ) ) ( HOIST-AT ?auto_31772 ?auto_31770 ) ( not ( = ?auto_31771 ?auto_31772 ) ) ( not ( = ?auto_31768 ?auto_31772 ) ) ( not ( = ?auto_31780 ?auto_31772 ) ) ( AVAILABLE ?auto_31772 ) ( SURFACE-AT ?auto_31763 ?auto_31770 ) ( ON ?auto_31763 ?auto_31779 ) ( CLEAR ?auto_31763 ) ( not ( = ?auto_31764 ?auto_31779 ) ) ( not ( = ?auto_31765 ?auto_31779 ) ) ( not ( = ?auto_31763 ?auto_31779 ) ) ( not ( = ?auto_31767 ?auto_31779 ) ) ( not ( = ?auto_31775 ?auto_31779 ) ) ( not ( = ?auto_31762 ?auto_31779 ) ) ( SURFACE-AT ?auto_31761 ?auto_31776 ) ( CLEAR ?auto_31761 ) ( IS-CRATE ?auto_31762 ) ( not ( = ?auto_31761 ?auto_31762 ) ) ( not ( = ?auto_31764 ?auto_31761 ) ) ( not ( = ?auto_31765 ?auto_31761 ) ) ( not ( = ?auto_31763 ?auto_31761 ) ) ( not ( = ?auto_31767 ?auto_31761 ) ) ( not ( = ?auto_31775 ?auto_31761 ) ) ( not ( = ?auto_31779 ?auto_31761 ) ) ( AVAILABLE ?auto_31771 ) ( TRUCK-AT ?auto_31769 ?auto_31774 ) ( not ( = ?auto_31774 ?auto_31776 ) ) ( not ( = ?auto_31766 ?auto_31774 ) ) ( not ( = ?auto_31777 ?auto_31774 ) ) ( not ( = ?auto_31770 ?auto_31774 ) ) ( HOIST-AT ?auto_31773 ?auto_31774 ) ( not ( = ?auto_31771 ?auto_31773 ) ) ( not ( = ?auto_31768 ?auto_31773 ) ) ( not ( = ?auto_31780 ?auto_31773 ) ) ( not ( = ?auto_31772 ?auto_31773 ) ) ( AVAILABLE ?auto_31773 ) ( SURFACE-AT ?auto_31762 ?auto_31774 ) ( ON ?auto_31762 ?auto_31778 ) ( CLEAR ?auto_31762 ) ( not ( = ?auto_31764 ?auto_31778 ) ) ( not ( = ?auto_31765 ?auto_31778 ) ) ( not ( = ?auto_31763 ?auto_31778 ) ) ( not ( = ?auto_31767 ?auto_31778 ) ) ( not ( = ?auto_31775 ?auto_31778 ) ) ( not ( = ?auto_31762 ?auto_31778 ) ) ( not ( = ?auto_31779 ?auto_31778 ) ) ( not ( = ?auto_31761 ?auto_31778 ) ) ( ON ?auto_31761 ?auto_31760 ) ( not ( = ?auto_31760 ?auto_31761 ) ) ( not ( = ?auto_31760 ?auto_31762 ) ) ( not ( = ?auto_31760 ?auto_31763 ) ) ( not ( = ?auto_31760 ?auto_31764 ) ) ( not ( = ?auto_31760 ?auto_31765 ) ) ( not ( = ?auto_31760 ?auto_31767 ) ) ( not ( = ?auto_31760 ?auto_31775 ) ) ( not ( = ?auto_31760 ?auto_31779 ) ) ( not ( = ?auto_31760 ?auto_31778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31763 ?auto_31764 ?auto_31765 )
      ( MAKE-5CRATE-VERIFY ?auto_31760 ?auto_31761 ?auto_31762 ?auto_31763 ?auto_31764 ?auto_31765 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31781 - SURFACE
      ?auto_31782 - SURFACE
    )
    :vars
    (
      ?auto_31789 - HOIST
      ?auto_31794 - PLACE
      ?auto_31799 - SURFACE
      ?auto_31783 - PLACE
      ?auto_31785 - HOIST
      ?auto_31784 - SURFACE
      ?auto_31796 - PLACE
      ?auto_31800 - HOIST
      ?auto_31793 - SURFACE
      ?auto_31795 - SURFACE
      ?auto_31788 - PLACE
      ?auto_31790 - HOIST
      ?auto_31798 - SURFACE
      ?auto_31787 - SURFACE
      ?auto_31792 - PLACE
      ?auto_31791 - HOIST
      ?auto_31797 - SURFACE
      ?auto_31786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31789 ?auto_31794 ) ( IS-CRATE ?auto_31782 ) ( not ( = ?auto_31781 ?auto_31782 ) ) ( not ( = ?auto_31799 ?auto_31781 ) ) ( not ( = ?auto_31799 ?auto_31782 ) ) ( not ( = ?auto_31783 ?auto_31794 ) ) ( HOIST-AT ?auto_31785 ?auto_31783 ) ( not ( = ?auto_31789 ?auto_31785 ) ) ( AVAILABLE ?auto_31785 ) ( SURFACE-AT ?auto_31782 ?auto_31783 ) ( ON ?auto_31782 ?auto_31784 ) ( CLEAR ?auto_31782 ) ( not ( = ?auto_31781 ?auto_31784 ) ) ( not ( = ?auto_31782 ?auto_31784 ) ) ( not ( = ?auto_31799 ?auto_31784 ) ) ( IS-CRATE ?auto_31781 ) ( not ( = ?auto_31796 ?auto_31794 ) ) ( not ( = ?auto_31783 ?auto_31796 ) ) ( HOIST-AT ?auto_31800 ?auto_31796 ) ( not ( = ?auto_31789 ?auto_31800 ) ) ( not ( = ?auto_31785 ?auto_31800 ) ) ( AVAILABLE ?auto_31800 ) ( SURFACE-AT ?auto_31781 ?auto_31796 ) ( ON ?auto_31781 ?auto_31793 ) ( CLEAR ?auto_31781 ) ( not ( = ?auto_31781 ?auto_31793 ) ) ( not ( = ?auto_31782 ?auto_31793 ) ) ( not ( = ?auto_31799 ?auto_31793 ) ) ( not ( = ?auto_31784 ?auto_31793 ) ) ( IS-CRATE ?auto_31799 ) ( not ( = ?auto_31795 ?auto_31799 ) ) ( not ( = ?auto_31781 ?auto_31795 ) ) ( not ( = ?auto_31782 ?auto_31795 ) ) ( not ( = ?auto_31784 ?auto_31795 ) ) ( not ( = ?auto_31793 ?auto_31795 ) ) ( not ( = ?auto_31788 ?auto_31794 ) ) ( not ( = ?auto_31783 ?auto_31788 ) ) ( not ( = ?auto_31796 ?auto_31788 ) ) ( HOIST-AT ?auto_31790 ?auto_31788 ) ( not ( = ?auto_31789 ?auto_31790 ) ) ( not ( = ?auto_31785 ?auto_31790 ) ) ( not ( = ?auto_31800 ?auto_31790 ) ) ( AVAILABLE ?auto_31790 ) ( SURFACE-AT ?auto_31799 ?auto_31788 ) ( ON ?auto_31799 ?auto_31798 ) ( CLEAR ?auto_31799 ) ( not ( = ?auto_31781 ?auto_31798 ) ) ( not ( = ?auto_31782 ?auto_31798 ) ) ( not ( = ?auto_31799 ?auto_31798 ) ) ( not ( = ?auto_31784 ?auto_31798 ) ) ( not ( = ?auto_31793 ?auto_31798 ) ) ( not ( = ?auto_31795 ?auto_31798 ) ) ( SURFACE-AT ?auto_31787 ?auto_31794 ) ( CLEAR ?auto_31787 ) ( IS-CRATE ?auto_31795 ) ( not ( = ?auto_31787 ?auto_31795 ) ) ( not ( = ?auto_31781 ?auto_31787 ) ) ( not ( = ?auto_31782 ?auto_31787 ) ) ( not ( = ?auto_31799 ?auto_31787 ) ) ( not ( = ?auto_31784 ?auto_31787 ) ) ( not ( = ?auto_31793 ?auto_31787 ) ) ( not ( = ?auto_31798 ?auto_31787 ) ) ( AVAILABLE ?auto_31789 ) ( not ( = ?auto_31792 ?auto_31794 ) ) ( not ( = ?auto_31783 ?auto_31792 ) ) ( not ( = ?auto_31796 ?auto_31792 ) ) ( not ( = ?auto_31788 ?auto_31792 ) ) ( HOIST-AT ?auto_31791 ?auto_31792 ) ( not ( = ?auto_31789 ?auto_31791 ) ) ( not ( = ?auto_31785 ?auto_31791 ) ) ( not ( = ?auto_31800 ?auto_31791 ) ) ( not ( = ?auto_31790 ?auto_31791 ) ) ( AVAILABLE ?auto_31791 ) ( SURFACE-AT ?auto_31795 ?auto_31792 ) ( ON ?auto_31795 ?auto_31797 ) ( CLEAR ?auto_31795 ) ( not ( = ?auto_31781 ?auto_31797 ) ) ( not ( = ?auto_31782 ?auto_31797 ) ) ( not ( = ?auto_31799 ?auto_31797 ) ) ( not ( = ?auto_31784 ?auto_31797 ) ) ( not ( = ?auto_31793 ?auto_31797 ) ) ( not ( = ?auto_31795 ?auto_31797 ) ) ( not ( = ?auto_31798 ?auto_31797 ) ) ( not ( = ?auto_31787 ?auto_31797 ) ) ( TRUCK-AT ?auto_31786 ?auto_31794 ) )
    :subtasks
    ( ( !DRIVE ?auto_31786 ?auto_31794 ?auto_31792 )
      ( MAKE-2CRATE ?auto_31799 ?auto_31781 ?auto_31782 )
      ( MAKE-1CRATE-VERIFY ?auto_31781 ?auto_31782 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31801 - SURFACE
      ?auto_31802 - SURFACE
      ?auto_31803 - SURFACE
    )
    :vars
    (
      ?auto_31817 - HOIST
      ?auto_31809 - PLACE
      ?auto_31816 - PLACE
      ?auto_31805 - HOIST
      ?auto_31807 - SURFACE
      ?auto_31808 - PLACE
      ?auto_31814 - HOIST
      ?auto_31819 - SURFACE
      ?auto_31804 - SURFACE
      ?auto_31820 - PLACE
      ?auto_31806 - HOIST
      ?auto_31818 - SURFACE
      ?auto_31812 - SURFACE
      ?auto_31810 - PLACE
      ?auto_31815 - HOIST
      ?auto_31813 - SURFACE
      ?auto_31811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31817 ?auto_31809 ) ( IS-CRATE ?auto_31803 ) ( not ( = ?auto_31802 ?auto_31803 ) ) ( not ( = ?auto_31801 ?auto_31802 ) ) ( not ( = ?auto_31801 ?auto_31803 ) ) ( not ( = ?auto_31816 ?auto_31809 ) ) ( HOIST-AT ?auto_31805 ?auto_31816 ) ( not ( = ?auto_31817 ?auto_31805 ) ) ( AVAILABLE ?auto_31805 ) ( SURFACE-AT ?auto_31803 ?auto_31816 ) ( ON ?auto_31803 ?auto_31807 ) ( CLEAR ?auto_31803 ) ( not ( = ?auto_31802 ?auto_31807 ) ) ( not ( = ?auto_31803 ?auto_31807 ) ) ( not ( = ?auto_31801 ?auto_31807 ) ) ( IS-CRATE ?auto_31802 ) ( not ( = ?auto_31808 ?auto_31809 ) ) ( not ( = ?auto_31816 ?auto_31808 ) ) ( HOIST-AT ?auto_31814 ?auto_31808 ) ( not ( = ?auto_31817 ?auto_31814 ) ) ( not ( = ?auto_31805 ?auto_31814 ) ) ( AVAILABLE ?auto_31814 ) ( SURFACE-AT ?auto_31802 ?auto_31808 ) ( ON ?auto_31802 ?auto_31819 ) ( CLEAR ?auto_31802 ) ( not ( = ?auto_31802 ?auto_31819 ) ) ( not ( = ?auto_31803 ?auto_31819 ) ) ( not ( = ?auto_31801 ?auto_31819 ) ) ( not ( = ?auto_31807 ?auto_31819 ) ) ( IS-CRATE ?auto_31801 ) ( not ( = ?auto_31804 ?auto_31801 ) ) ( not ( = ?auto_31802 ?auto_31804 ) ) ( not ( = ?auto_31803 ?auto_31804 ) ) ( not ( = ?auto_31807 ?auto_31804 ) ) ( not ( = ?auto_31819 ?auto_31804 ) ) ( not ( = ?auto_31820 ?auto_31809 ) ) ( not ( = ?auto_31816 ?auto_31820 ) ) ( not ( = ?auto_31808 ?auto_31820 ) ) ( HOIST-AT ?auto_31806 ?auto_31820 ) ( not ( = ?auto_31817 ?auto_31806 ) ) ( not ( = ?auto_31805 ?auto_31806 ) ) ( not ( = ?auto_31814 ?auto_31806 ) ) ( AVAILABLE ?auto_31806 ) ( SURFACE-AT ?auto_31801 ?auto_31820 ) ( ON ?auto_31801 ?auto_31818 ) ( CLEAR ?auto_31801 ) ( not ( = ?auto_31802 ?auto_31818 ) ) ( not ( = ?auto_31803 ?auto_31818 ) ) ( not ( = ?auto_31801 ?auto_31818 ) ) ( not ( = ?auto_31807 ?auto_31818 ) ) ( not ( = ?auto_31819 ?auto_31818 ) ) ( not ( = ?auto_31804 ?auto_31818 ) ) ( SURFACE-AT ?auto_31812 ?auto_31809 ) ( CLEAR ?auto_31812 ) ( IS-CRATE ?auto_31804 ) ( not ( = ?auto_31812 ?auto_31804 ) ) ( not ( = ?auto_31802 ?auto_31812 ) ) ( not ( = ?auto_31803 ?auto_31812 ) ) ( not ( = ?auto_31801 ?auto_31812 ) ) ( not ( = ?auto_31807 ?auto_31812 ) ) ( not ( = ?auto_31819 ?auto_31812 ) ) ( not ( = ?auto_31818 ?auto_31812 ) ) ( AVAILABLE ?auto_31817 ) ( not ( = ?auto_31810 ?auto_31809 ) ) ( not ( = ?auto_31816 ?auto_31810 ) ) ( not ( = ?auto_31808 ?auto_31810 ) ) ( not ( = ?auto_31820 ?auto_31810 ) ) ( HOIST-AT ?auto_31815 ?auto_31810 ) ( not ( = ?auto_31817 ?auto_31815 ) ) ( not ( = ?auto_31805 ?auto_31815 ) ) ( not ( = ?auto_31814 ?auto_31815 ) ) ( not ( = ?auto_31806 ?auto_31815 ) ) ( AVAILABLE ?auto_31815 ) ( SURFACE-AT ?auto_31804 ?auto_31810 ) ( ON ?auto_31804 ?auto_31813 ) ( CLEAR ?auto_31804 ) ( not ( = ?auto_31802 ?auto_31813 ) ) ( not ( = ?auto_31803 ?auto_31813 ) ) ( not ( = ?auto_31801 ?auto_31813 ) ) ( not ( = ?auto_31807 ?auto_31813 ) ) ( not ( = ?auto_31819 ?auto_31813 ) ) ( not ( = ?auto_31804 ?auto_31813 ) ) ( not ( = ?auto_31818 ?auto_31813 ) ) ( not ( = ?auto_31812 ?auto_31813 ) ) ( TRUCK-AT ?auto_31811 ?auto_31809 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31802 ?auto_31803 )
      ( MAKE-2CRATE-VERIFY ?auto_31801 ?auto_31802 ?auto_31803 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31821 - SURFACE
      ?auto_31822 - SURFACE
      ?auto_31823 - SURFACE
      ?auto_31824 - SURFACE
    )
    :vars
    (
      ?auto_31831 - HOIST
      ?auto_31826 - PLACE
      ?auto_31840 - PLACE
      ?auto_31839 - HOIST
      ?auto_31833 - SURFACE
      ?auto_31837 - PLACE
      ?auto_31835 - HOIST
      ?auto_31838 - SURFACE
      ?auto_31825 - PLACE
      ?auto_31830 - HOIST
      ?auto_31828 - SURFACE
      ?auto_31832 - SURFACE
      ?auto_31829 - PLACE
      ?auto_31834 - HOIST
      ?auto_31827 - SURFACE
      ?auto_31836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31831 ?auto_31826 ) ( IS-CRATE ?auto_31824 ) ( not ( = ?auto_31823 ?auto_31824 ) ) ( not ( = ?auto_31822 ?auto_31823 ) ) ( not ( = ?auto_31822 ?auto_31824 ) ) ( not ( = ?auto_31840 ?auto_31826 ) ) ( HOIST-AT ?auto_31839 ?auto_31840 ) ( not ( = ?auto_31831 ?auto_31839 ) ) ( AVAILABLE ?auto_31839 ) ( SURFACE-AT ?auto_31824 ?auto_31840 ) ( ON ?auto_31824 ?auto_31833 ) ( CLEAR ?auto_31824 ) ( not ( = ?auto_31823 ?auto_31833 ) ) ( not ( = ?auto_31824 ?auto_31833 ) ) ( not ( = ?auto_31822 ?auto_31833 ) ) ( IS-CRATE ?auto_31823 ) ( not ( = ?auto_31837 ?auto_31826 ) ) ( not ( = ?auto_31840 ?auto_31837 ) ) ( HOIST-AT ?auto_31835 ?auto_31837 ) ( not ( = ?auto_31831 ?auto_31835 ) ) ( not ( = ?auto_31839 ?auto_31835 ) ) ( AVAILABLE ?auto_31835 ) ( SURFACE-AT ?auto_31823 ?auto_31837 ) ( ON ?auto_31823 ?auto_31838 ) ( CLEAR ?auto_31823 ) ( not ( = ?auto_31823 ?auto_31838 ) ) ( not ( = ?auto_31824 ?auto_31838 ) ) ( not ( = ?auto_31822 ?auto_31838 ) ) ( not ( = ?auto_31833 ?auto_31838 ) ) ( IS-CRATE ?auto_31822 ) ( not ( = ?auto_31821 ?auto_31822 ) ) ( not ( = ?auto_31823 ?auto_31821 ) ) ( not ( = ?auto_31824 ?auto_31821 ) ) ( not ( = ?auto_31833 ?auto_31821 ) ) ( not ( = ?auto_31838 ?auto_31821 ) ) ( not ( = ?auto_31825 ?auto_31826 ) ) ( not ( = ?auto_31840 ?auto_31825 ) ) ( not ( = ?auto_31837 ?auto_31825 ) ) ( HOIST-AT ?auto_31830 ?auto_31825 ) ( not ( = ?auto_31831 ?auto_31830 ) ) ( not ( = ?auto_31839 ?auto_31830 ) ) ( not ( = ?auto_31835 ?auto_31830 ) ) ( AVAILABLE ?auto_31830 ) ( SURFACE-AT ?auto_31822 ?auto_31825 ) ( ON ?auto_31822 ?auto_31828 ) ( CLEAR ?auto_31822 ) ( not ( = ?auto_31823 ?auto_31828 ) ) ( not ( = ?auto_31824 ?auto_31828 ) ) ( not ( = ?auto_31822 ?auto_31828 ) ) ( not ( = ?auto_31833 ?auto_31828 ) ) ( not ( = ?auto_31838 ?auto_31828 ) ) ( not ( = ?auto_31821 ?auto_31828 ) ) ( SURFACE-AT ?auto_31832 ?auto_31826 ) ( CLEAR ?auto_31832 ) ( IS-CRATE ?auto_31821 ) ( not ( = ?auto_31832 ?auto_31821 ) ) ( not ( = ?auto_31823 ?auto_31832 ) ) ( not ( = ?auto_31824 ?auto_31832 ) ) ( not ( = ?auto_31822 ?auto_31832 ) ) ( not ( = ?auto_31833 ?auto_31832 ) ) ( not ( = ?auto_31838 ?auto_31832 ) ) ( not ( = ?auto_31828 ?auto_31832 ) ) ( AVAILABLE ?auto_31831 ) ( not ( = ?auto_31829 ?auto_31826 ) ) ( not ( = ?auto_31840 ?auto_31829 ) ) ( not ( = ?auto_31837 ?auto_31829 ) ) ( not ( = ?auto_31825 ?auto_31829 ) ) ( HOIST-AT ?auto_31834 ?auto_31829 ) ( not ( = ?auto_31831 ?auto_31834 ) ) ( not ( = ?auto_31839 ?auto_31834 ) ) ( not ( = ?auto_31835 ?auto_31834 ) ) ( not ( = ?auto_31830 ?auto_31834 ) ) ( AVAILABLE ?auto_31834 ) ( SURFACE-AT ?auto_31821 ?auto_31829 ) ( ON ?auto_31821 ?auto_31827 ) ( CLEAR ?auto_31821 ) ( not ( = ?auto_31823 ?auto_31827 ) ) ( not ( = ?auto_31824 ?auto_31827 ) ) ( not ( = ?auto_31822 ?auto_31827 ) ) ( not ( = ?auto_31833 ?auto_31827 ) ) ( not ( = ?auto_31838 ?auto_31827 ) ) ( not ( = ?auto_31821 ?auto_31827 ) ) ( not ( = ?auto_31828 ?auto_31827 ) ) ( not ( = ?auto_31832 ?auto_31827 ) ) ( TRUCK-AT ?auto_31836 ?auto_31826 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31822 ?auto_31823 ?auto_31824 )
      ( MAKE-3CRATE-VERIFY ?auto_31821 ?auto_31822 ?auto_31823 ?auto_31824 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31841 - SURFACE
      ?auto_31842 - SURFACE
      ?auto_31843 - SURFACE
      ?auto_31844 - SURFACE
      ?auto_31845 - SURFACE
    )
    :vars
    (
      ?auto_31852 - HOIST
      ?auto_31847 - PLACE
      ?auto_31860 - PLACE
      ?auto_31859 - HOIST
      ?auto_31853 - SURFACE
      ?auto_31857 - PLACE
      ?auto_31855 - HOIST
      ?auto_31858 - SURFACE
      ?auto_31846 - PLACE
      ?auto_31851 - HOIST
      ?auto_31849 - SURFACE
      ?auto_31850 - PLACE
      ?auto_31854 - HOIST
      ?auto_31848 - SURFACE
      ?auto_31856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31852 ?auto_31847 ) ( IS-CRATE ?auto_31845 ) ( not ( = ?auto_31844 ?auto_31845 ) ) ( not ( = ?auto_31843 ?auto_31844 ) ) ( not ( = ?auto_31843 ?auto_31845 ) ) ( not ( = ?auto_31860 ?auto_31847 ) ) ( HOIST-AT ?auto_31859 ?auto_31860 ) ( not ( = ?auto_31852 ?auto_31859 ) ) ( AVAILABLE ?auto_31859 ) ( SURFACE-AT ?auto_31845 ?auto_31860 ) ( ON ?auto_31845 ?auto_31853 ) ( CLEAR ?auto_31845 ) ( not ( = ?auto_31844 ?auto_31853 ) ) ( not ( = ?auto_31845 ?auto_31853 ) ) ( not ( = ?auto_31843 ?auto_31853 ) ) ( IS-CRATE ?auto_31844 ) ( not ( = ?auto_31857 ?auto_31847 ) ) ( not ( = ?auto_31860 ?auto_31857 ) ) ( HOIST-AT ?auto_31855 ?auto_31857 ) ( not ( = ?auto_31852 ?auto_31855 ) ) ( not ( = ?auto_31859 ?auto_31855 ) ) ( AVAILABLE ?auto_31855 ) ( SURFACE-AT ?auto_31844 ?auto_31857 ) ( ON ?auto_31844 ?auto_31858 ) ( CLEAR ?auto_31844 ) ( not ( = ?auto_31844 ?auto_31858 ) ) ( not ( = ?auto_31845 ?auto_31858 ) ) ( not ( = ?auto_31843 ?auto_31858 ) ) ( not ( = ?auto_31853 ?auto_31858 ) ) ( IS-CRATE ?auto_31843 ) ( not ( = ?auto_31842 ?auto_31843 ) ) ( not ( = ?auto_31844 ?auto_31842 ) ) ( not ( = ?auto_31845 ?auto_31842 ) ) ( not ( = ?auto_31853 ?auto_31842 ) ) ( not ( = ?auto_31858 ?auto_31842 ) ) ( not ( = ?auto_31846 ?auto_31847 ) ) ( not ( = ?auto_31860 ?auto_31846 ) ) ( not ( = ?auto_31857 ?auto_31846 ) ) ( HOIST-AT ?auto_31851 ?auto_31846 ) ( not ( = ?auto_31852 ?auto_31851 ) ) ( not ( = ?auto_31859 ?auto_31851 ) ) ( not ( = ?auto_31855 ?auto_31851 ) ) ( AVAILABLE ?auto_31851 ) ( SURFACE-AT ?auto_31843 ?auto_31846 ) ( ON ?auto_31843 ?auto_31849 ) ( CLEAR ?auto_31843 ) ( not ( = ?auto_31844 ?auto_31849 ) ) ( not ( = ?auto_31845 ?auto_31849 ) ) ( not ( = ?auto_31843 ?auto_31849 ) ) ( not ( = ?auto_31853 ?auto_31849 ) ) ( not ( = ?auto_31858 ?auto_31849 ) ) ( not ( = ?auto_31842 ?auto_31849 ) ) ( SURFACE-AT ?auto_31841 ?auto_31847 ) ( CLEAR ?auto_31841 ) ( IS-CRATE ?auto_31842 ) ( not ( = ?auto_31841 ?auto_31842 ) ) ( not ( = ?auto_31844 ?auto_31841 ) ) ( not ( = ?auto_31845 ?auto_31841 ) ) ( not ( = ?auto_31843 ?auto_31841 ) ) ( not ( = ?auto_31853 ?auto_31841 ) ) ( not ( = ?auto_31858 ?auto_31841 ) ) ( not ( = ?auto_31849 ?auto_31841 ) ) ( AVAILABLE ?auto_31852 ) ( not ( = ?auto_31850 ?auto_31847 ) ) ( not ( = ?auto_31860 ?auto_31850 ) ) ( not ( = ?auto_31857 ?auto_31850 ) ) ( not ( = ?auto_31846 ?auto_31850 ) ) ( HOIST-AT ?auto_31854 ?auto_31850 ) ( not ( = ?auto_31852 ?auto_31854 ) ) ( not ( = ?auto_31859 ?auto_31854 ) ) ( not ( = ?auto_31855 ?auto_31854 ) ) ( not ( = ?auto_31851 ?auto_31854 ) ) ( AVAILABLE ?auto_31854 ) ( SURFACE-AT ?auto_31842 ?auto_31850 ) ( ON ?auto_31842 ?auto_31848 ) ( CLEAR ?auto_31842 ) ( not ( = ?auto_31844 ?auto_31848 ) ) ( not ( = ?auto_31845 ?auto_31848 ) ) ( not ( = ?auto_31843 ?auto_31848 ) ) ( not ( = ?auto_31853 ?auto_31848 ) ) ( not ( = ?auto_31858 ?auto_31848 ) ) ( not ( = ?auto_31842 ?auto_31848 ) ) ( not ( = ?auto_31849 ?auto_31848 ) ) ( not ( = ?auto_31841 ?auto_31848 ) ) ( TRUCK-AT ?auto_31856 ?auto_31847 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31843 ?auto_31844 ?auto_31845 )
      ( MAKE-4CRATE-VERIFY ?auto_31841 ?auto_31842 ?auto_31843 ?auto_31844 ?auto_31845 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31861 - SURFACE
      ?auto_31862 - SURFACE
      ?auto_31863 - SURFACE
      ?auto_31864 - SURFACE
      ?auto_31865 - SURFACE
      ?auto_31866 - SURFACE
    )
    :vars
    (
      ?auto_31873 - HOIST
      ?auto_31868 - PLACE
      ?auto_31881 - PLACE
      ?auto_31880 - HOIST
      ?auto_31874 - SURFACE
      ?auto_31878 - PLACE
      ?auto_31876 - HOIST
      ?auto_31879 - SURFACE
      ?auto_31867 - PLACE
      ?auto_31872 - HOIST
      ?auto_31870 - SURFACE
      ?auto_31871 - PLACE
      ?auto_31875 - HOIST
      ?auto_31869 - SURFACE
      ?auto_31877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31873 ?auto_31868 ) ( IS-CRATE ?auto_31866 ) ( not ( = ?auto_31865 ?auto_31866 ) ) ( not ( = ?auto_31864 ?auto_31865 ) ) ( not ( = ?auto_31864 ?auto_31866 ) ) ( not ( = ?auto_31881 ?auto_31868 ) ) ( HOIST-AT ?auto_31880 ?auto_31881 ) ( not ( = ?auto_31873 ?auto_31880 ) ) ( AVAILABLE ?auto_31880 ) ( SURFACE-AT ?auto_31866 ?auto_31881 ) ( ON ?auto_31866 ?auto_31874 ) ( CLEAR ?auto_31866 ) ( not ( = ?auto_31865 ?auto_31874 ) ) ( not ( = ?auto_31866 ?auto_31874 ) ) ( not ( = ?auto_31864 ?auto_31874 ) ) ( IS-CRATE ?auto_31865 ) ( not ( = ?auto_31878 ?auto_31868 ) ) ( not ( = ?auto_31881 ?auto_31878 ) ) ( HOIST-AT ?auto_31876 ?auto_31878 ) ( not ( = ?auto_31873 ?auto_31876 ) ) ( not ( = ?auto_31880 ?auto_31876 ) ) ( AVAILABLE ?auto_31876 ) ( SURFACE-AT ?auto_31865 ?auto_31878 ) ( ON ?auto_31865 ?auto_31879 ) ( CLEAR ?auto_31865 ) ( not ( = ?auto_31865 ?auto_31879 ) ) ( not ( = ?auto_31866 ?auto_31879 ) ) ( not ( = ?auto_31864 ?auto_31879 ) ) ( not ( = ?auto_31874 ?auto_31879 ) ) ( IS-CRATE ?auto_31864 ) ( not ( = ?auto_31863 ?auto_31864 ) ) ( not ( = ?auto_31865 ?auto_31863 ) ) ( not ( = ?auto_31866 ?auto_31863 ) ) ( not ( = ?auto_31874 ?auto_31863 ) ) ( not ( = ?auto_31879 ?auto_31863 ) ) ( not ( = ?auto_31867 ?auto_31868 ) ) ( not ( = ?auto_31881 ?auto_31867 ) ) ( not ( = ?auto_31878 ?auto_31867 ) ) ( HOIST-AT ?auto_31872 ?auto_31867 ) ( not ( = ?auto_31873 ?auto_31872 ) ) ( not ( = ?auto_31880 ?auto_31872 ) ) ( not ( = ?auto_31876 ?auto_31872 ) ) ( AVAILABLE ?auto_31872 ) ( SURFACE-AT ?auto_31864 ?auto_31867 ) ( ON ?auto_31864 ?auto_31870 ) ( CLEAR ?auto_31864 ) ( not ( = ?auto_31865 ?auto_31870 ) ) ( not ( = ?auto_31866 ?auto_31870 ) ) ( not ( = ?auto_31864 ?auto_31870 ) ) ( not ( = ?auto_31874 ?auto_31870 ) ) ( not ( = ?auto_31879 ?auto_31870 ) ) ( not ( = ?auto_31863 ?auto_31870 ) ) ( SURFACE-AT ?auto_31862 ?auto_31868 ) ( CLEAR ?auto_31862 ) ( IS-CRATE ?auto_31863 ) ( not ( = ?auto_31862 ?auto_31863 ) ) ( not ( = ?auto_31865 ?auto_31862 ) ) ( not ( = ?auto_31866 ?auto_31862 ) ) ( not ( = ?auto_31864 ?auto_31862 ) ) ( not ( = ?auto_31874 ?auto_31862 ) ) ( not ( = ?auto_31879 ?auto_31862 ) ) ( not ( = ?auto_31870 ?auto_31862 ) ) ( AVAILABLE ?auto_31873 ) ( not ( = ?auto_31871 ?auto_31868 ) ) ( not ( = ?auto_31881 ?auto_31871 ) ) ( not ( = ?auto_31878 ?auto_31871 ) ) ( not ( = ?auto_31867 ?auto_31871 ) ) ( HOIST-AT ?auto_31875 ?auto_31871 ) ( not ( = ?auto_31873 ?auto_31875 ) ) ( not ( = ?auto_31880 ?auto_31875 ) ) ( not ( = ?auto_31876 ?auto_31875 ) ) ( not ( = ?auto_31872 ?auto_31875 ) ) ( AVAILABLE ?auto_31875 ) ( SURFACE-AT ?auto_31863 ?auto_31871 ) ( ON ?auto_31863 ?auto_31869 ) ( CLEAR ?auto_31863 ) ( not ( = ?auto_31865 ?auto_31869 ) ) ( not ( = ?auto_31866 ?auto_31869 ) ) ( not ( = ?auto_31864 ?auto_31869 ) ) ( not ( = ?auto_31874 ?auto_31869 ) ) ( not ( = ?auto_31879 ?auto_31869 ) ) ( not ( = ?auto_31863 ?auto_31869 ) ) ( not ( = ?auto_31870 ?auto_31869 ) ) ( not ( = ?auto_31862 ?auto_31869 ) ) ( TRUCK-AT ?auto_31877 ?auto_31868 ) ( ON ?auto_31862 ?auto_31861 ) ( not ( = ?auto_31861 ?auto_31862 ) ) ( not ( = ?auto_31861 ?auto_31863 ) ) ( not ( = ?auto_31861 ?auto_31864 ) ) ( not ( = ?auto_31861 ?auto_31865 ) ) ( not ( = ?auto_31861 ?auto_31866 ) ) ( not ( = ?auto_31861 ?auto_31874 ) ) ( not ( = ?auto_31861 ?auto_31879 ) ) ( not ( = ?auto_31861 ?auto_31870 ) ) ( not ( = ?auto_31861 ?auto_31869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31864 ?auto_31865 ?auto_31866 )
      ( MAKE-5CRATE-VERIFY ?auto_31861 ?auto_31862 ?auto_31863 ?auto_31864 ?auto_31865 ?auto_31866 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31882 - SURFACE
      ?auto_31883 - SURFACE
    )
    :vars
    (
      ?auto_31890 - HOIST
      ?auto_31885 - PLACE
      ?auto_31897 - SURFACE
      ?auto_31901 - PLACE
      ?auto_31900 - HOIST
      ?auto_31892 - SURFACE
      ?auto_31898 - PLACE
      ?auto_31895 - HOIST
      ?auto_31899 - SURFACE
      ?auto_31893 - SURFACE
      ?auto_31884 - PLACE
      ?auto_31889 - HOIST
      ?auto_31887 - SURFACE
      ?auto_31891 - SURFACE
      ?auto_31888 - PLACE
      ?auto_31894 - HOIST
      ?auto_31886 - SURFACE
      ?auto_31896 - TRUCK
      ?auto_31902 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31890 ?auto_31885 ) ( IS-CRATE ?auto_31883 ) ( not ( = ?auto_31882 ?auto_31883 ) ) ( not ( = ?auto_31897 ?auto_31882 ) ) ( not ( = ?auto_31897 ?auto_31883 ) ) ( not ( = ?auto_31901 ?auto_31885 ) ) ( HOIST-AT ?auto_31900 ?auto_31901 ) ( not ( = ?auto_31890 ?auto_31900 ) ) ( AVAILABLE ?auto_31900 ) ( SURFACE-AT ?auto_31883 ?auto_31901 ) ( ON ?auto_31883 ?auto_31892 ) ( CLEAR ?auto_31883 ) ( not ( = ?auto_31882 ?auto_31892 ) ) ( not ( = ?auto_31883 ?auto_31892 ) ) ( not ( = ?auto_31897 ?auto_31892 ) ) ( IS-CRATE ?auto_31882 ) ( not ( = ?auto_31898 ?auto_31885 ) ) ( not ( = ?auto_31901 ?auto_31898 ) ) ( HOIST-AT ?auto_31895 ?auto_31898 ) ( not ( = ?auto_31890 ?auto_31895 ) ) ( not ( = ?auto_31900 ?auto_31895 ) ) ( AVAILABLE ?auto_31895 ) ( SURFACE-AT ?auto_31882 ?auto_31898 ) ( ON ?auto_31882 ?auto_31899 ) ( CLEAR ?auto_31882 ) ( not ( = ?auto_31882 ?auto_31899 ) ) ( not ( = ?auto_31883 ?auto_31899 ) ) ( not ( = ?auto_31897 ?auto_31899 ) ) ( not ( = ?auto_31892 ?auto_31899 ) ) ( IS-CRATE ?auto_31897 ) ( not ( = ?auto_31893 ?auto_31897 ) ) ( not ( = ?auto_31882 ?auto_31893 ) ) ( not ( = ?auto_31883 ?auto_31893 ) ) ( not ( = ?auto_31892 ?auto_31893 ) ) ( not ( = ?auto_31899 ?auto_31893 ) ) ( not ( = ?auto_31884 ?auto_31885 ) ) ( not ( = ?auto_31901 ?auto_31884 ) ) ( not ( = ?auto_31898 ?auto_31884 ) ) ( HOIST-AT ?auto_31889 ?auto_31884 ) ( not ( = ?auto_31890 ?auto_31889 ) ) ( not ( = ?auto_31900 ?auto_31889 ) ) ( not ( = ?auto_31895 ?auto_31889 ) ) ( AVAILABLE ?auto_31889 ) ( SURFACE-AT ?auto_31897 ?auto_31884 ) ( ON ?auto_31897 ?auto_31887 ) ( CLEAR ?auto_31897 ) ( not ( = ?auto_31882 ?auto_31887 ) ) ( not ( = ?auto_31883 ?auto_31887 ) ) ( not ( = ?auto_31897 ?auto_31887 ) ) ( not ( = ?auto_31892 ?auto_31887 ) ) ( not ( = ?auto_31899 ?auto_31887 ) ) ( not ( = ?auto_31893 ?auto_31887 ) ) ( IS-CRATE ?auto_31893 ) ( not ( = ?auto_31891 ?auto_31893 ) ) ( not ( = ?auto_31882 ?auto_31891 ) ) ( not ( = ?auto_31883 ?auto_31891 ) ) ( not ( = ?auto_31897 ?auto_31891 ) ) ( not ( = ?auto_31892 ?auto_31891 ) ) ( not ( = ?auto_31899 ?auto_31891 ) ) ( not ( = ?auto_31887 ?auto_31891 ) ) ( not ( = ?auto_31888 ?auto_31885 ) ) ( not ( = ?auto_31901 ?auto_31888 ) ) ( not ( = ?auto_31898 ?auto_31888 ) ) ( not ( = ?auto_31884 ?auto_31888 ) ) ( HOIST-AT ?auto_31894 ?auto_31888 ) ( not ( = ?auto_31890 ?auto_31894 ) ) ( not ( = ?auto_31900 ?auto_31894 ) ) ( not ( = ?auto_31895 ?auto_31894 ) ) ( not ( = ?auto_31889 ?auto_31894 ) ) ( AVAILABLE ?auto_31894 ) ( SURFACE-AT ?auto_31893 ?auto_31888 ) ( ON ?auto_31893 ?auto_31886 ) ( CLEAR ?auto_31893 ) ( not ( = ?auto_31882 ?auto_31886 ) ) ( not ( = ?auto_31883 ?auto_31886 ) ) ( not ( = ?auto_31897 ?auto_31886 ) ) ( not ( = ?auto_31892 ?auto_31886 ) ) ( not ( = ?auto_31899 ?auto_31886 ) ) ( not ( = ?auto_31893 ?auto_31886 ) ) ( not ( = ?auto_31887 ?auto_31886 ) ) ( not ( = ?auto_31891 ?auto_31886 ) ) ( TRUCK-AT ?auto_31896 ?auto_31885 ) ( SURFACE-AT ?auto_31902 ?auto_31885 ) ( CLEAR ?auto_31902 ) ( LIFTING ?auto_31890 ?auto_31891 ) ( IS-CRATE ?auto_31891 ) ( not ( = ?auto_31902 ?auto_31891 ) ) ( not ( = ?auto_31882 ?auto_31902 ) ) ( not ( = ?auto_31883 ?auto_31902 ) ) ( not ( = ?auto_31897 ?auto_31902 ) ) ( not ( = ?auto_31892 ?auto_31902 ) ) ( not ( = ?auto_31899 ?auto_31902 ) ) ( not ( = ?auto_31893 ?auto_31902 ) ) ( not ( = ?auto_31887 ?auto_31902 ) ) ( not ( = ?auto_31886 ?auto_31902 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31902 ?auto_31891 )
      ( MAKE-2CRATE ?auto_31897 ?auto_31882 ?auto_31883 )
      ( MAKE-1CRATE-VERIFY ?auto_31882 ?auto_31883 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31903 - SURFACE
      ?auto_31904 - SURFACE
      ?auto_31905 - SURFACE
    )
    :vars
    (
      ?auto_31908 - HOIST
      ?auto_31921 - PLACE
      ?auto_31910 - PLACE
      ?auto_31913 - HOIST
      ?auto_31915 - SURFACE
      ?auto_31919 - PLACE
      ?auto_31917 - HOIST
      ?auto_31914 - SURFACE
      ?auto_31907 - SURFACE
      ?auto_31922 - PLACE
      ?auto_31912 - HOIST
      ?auto_31920 - SURFACE
      ?auto_31918 - SURFACE
      ?auto_31909 - PLACE
      ?auto_31916 - HOIST
      ?auto_31906 - SURFACE
      ?auto_31911 - TRUCK
      ?auto_31923 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31908 ?auto_31921 ) ( IS-CRATE ?auto_31905 ) ( not ( = ?auto_31904 ?auto_31905 ) ) ( not ( = ?auto_31903 ?auto_31904 ) ) ( not ( = ?auto_31903 ?auto_31905 ) ) ( not ( = ?auto_31910 ?auto_31921 ) ) ( HOIST-AT ?auto_31913 ?auto_31910 ) ( not ( = ?auto_31908 ?auto_31913 ) ) ( AVAILABLE ?auto_31913 ) ( SURFACE-AT ?auto_31905 ?auto_31910 ) ( ON ?auto_31905 ?auto_31915 ) ( CLEAR ?auto_31905 ) ( not ( = ?auto_31904 ?auto_31915 ) ) ( not ( = ?auto_31905 ?auto_31915 ) ) ( not ( = ?auto_31903 ?auto_31915 ) ) ( IS-CRATE ?auto_31904 ) ( not ( = ?auto_31919 ?auto_31921 ) ) ( not ( = ?auto_31910 ?auto_31919 ) ) ( HOIST-AT ?auto_31917 ?auto_31919 ) ( not ( = ?auto_31908 ?auto_31917 ) ) ( not ( = ?auto_31913 ?auto_31917 ) ) ( AVAILABLE ?auto_31917 ) ( SURFACE-AT ?auto_31904 ?auto_31919 ) ( ON ?auto_31904 ?auto_31914 ) ( CLEAR ?auto_31904 ) ( not ( = ?auto_31904 ?auto_31914 ) ) ( not ( = ?auto_31905 ?auto_31914 ) ) ( not ( = ?auto_31903 ?auto_31914 ) ) ( not ( = ?auto_31915 ?auto_31914 ) ) ( IS-CRATE ?auto_31903 ) ( not ( = ?auto_31907 ?auto_31903 ) ) ( not ( = ?auto_31904 ?auto_31907 ) ) ( not ( = ?auto_31905 ?auto_31907 ) ) ( not ( = ?auto_31915 ?auto_31907 ) ) ( not ( = ?auto_31914 ?auto_31907 ) ) ( not ( = ?auto_31922 ?auto_31921 ) ) ( not ( = ?auto_31910 ?auto_31922 ) ) ( not ( = ?auto_31919 ?auto_31922 ) ) ( HOIST-AT ?auto_31912 ?auto_31922 ) ( not ( = ?auto_31908 ?auto_31912 ) ) ( not ( = ?auto_31913 ?auto_31912 ) ) ( not ( = ?auto_31917 ?auto_31912 ) ) ( AVAILABLE ?auto_31912 ) ( SURFACE-AT ?auto_31903 ?auto_31922 ) ( ON ?auto_31903 ?auto_31920 ) ( CLEAR ?auto_31903 ) ( not ( = ?auto_31904 ?auto_31920 ) ) ( not ( = ?auto_31905 ?auto_31920 ) ) ( not ( = ?auto_31903 ?auto_31920 ) ) ( not ( = ?auto_31915 ?auto_31920 ) ) ( not ( = ?auto_31914 ?auto_31920 ) ) ( not ( = ?auto_31907 ?auto_31920 ) ) ( IS-CRATE ?auto_31907 ) ( not ( = ?auto_31918 ?auto_31907 ) ) ( not ( = ?auto_31904 ?auto_31918 ) ) ( not ( = ?auto_31905 ?auto_31918 ) ) ( not ( = ?auto_31903 ?auto_31918 ) ) ( not ( = ?auto_31915 ?auto_31918 ) ) ( not ( = ?auto_31914 ?auto_31918 ) ) ( not ( = ?auto_31920 ?auto_31918 ) ) ( not ( = ?auto_31909 ?auto_31921 ) ) ( not ( = ?auto_31910 ?auto_31909 ) ) ( not ( = ?auto_31919 ?auto_31909 ) ) ( not ( = ?auto_31922 ?auto_31909 ) ) ( HOIST-AT ?auto_31916 ?auto_31909 ) ( not ( = ?auto_31908 ?auto_31916 ) ) ( not ( = ?auto_31913 ?auto_31916 ) ) ( not ( = ?auto_31917 ?auto_31916 ) ) ( not ( = ?auto_31912 ?auto_31916 ) ) ( AVAILABLE ?auto_31916 ) ( SURFACE-AT ?auto_31907 ?auto_31909 ) ( ON ?auto_31907 ?auto_31906 ) ( CLEAR ?auto_31907 ) ( not ( = ?auto_31904 ?auto_31906 ) ) ( not ( = ?auto_31905 ?auto_31906 ) ) ( not ( = ?auto_31903 ?auto_31906 ) ) ( not ( = ?auto_31915 ?auto_31906 ) ) ( not ( = ?auto_31914 ?auto_31906 ) ) ( not ( = ?auto_31907 ?auto_31906 ) ) ( not ( = ?auto_31920 ?auto_31906 ) ) ( not ( = ?auto_31918 ?auto_31906 ) ) ( TRUCK-AT ?auto_31911 ?auto_31921 ) ( SURFACE-AT ?auto_31923 ?auto_31921 ) ( CLEAR ?auto_31923 ) ( LIFTING ?auto_31908 ?auto_31918 ) ( IS-CRATE ?auto_31918 ) ( not ( = ?auto_31923 ?auto_31918 ) ) ( not ( = ?auto_31904 ?auto_31923 ) ) ( not ( = ?auto_31905 ?auto_31923 ) ) ( not ( = ?auto_31903 ?auto_31923 ) ) ( not ( = ?auto_31915 ?auto_31923 ) ) ( not ( = ?auto_31914 ?auto_31923 ) ) ( not ( = ?auto_31907 ?auto_31923 ) ) ( not ( = ?auto_31920 ?auto_31923 ) ) ( not ( = ?auto_31906 ?auto_31923 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31904 ?auto_31905 )
      ( MAKE-2CRATE-VERIFY ?auto_31903 ?auto_31904 ?auto_31905 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31924 - SURFACE
      ?auto_31925 - SURFACE
      ?auto_31926 - SURFACE
      ?auto_31927 - SURFACE
    )
    :vars
    (
      ?auto_31930 - HOIST
      ?auto_31937 - PLACE
      ?auto_31941 - PLACE
      ?auto_31935 - HOIST
      ?auto_31933 - SURFACE
      ?auto_31932 - PLACE
      ?auto_31942 - HOIST
      ?auto_31928 - SURFACE
      ?auto_31934 - PLACE
      ?auto_31939 - HOIST
      ?auto_31931 - SURFACE
      ?auto_31944 - SURFACE
      ?auto_31929 - PLACE
      ?auto_31943 - HOIST
      ?auto_31938 - SURFACE
      ?auto_31940 - TRUCK
      ?auto_31936 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31930 ?auto_31937 ) ( IS-CRATE ?auto_31927 ) ( not ( = ?auto_31926 ?auto_31927 ) ) ( not ( = ?auto_31925 ?auto_31926 ) ) ( not ( = ?auto_31925 ?auto_31927 ) ) ( not ( = ?auto_31941 ?auto_31937 ) ) ( HOIST-AT ?auto_31935 ?auto_31941 ) ( not ( = ?auto_31930 ?auto_31935 ) ) ( AVAILABLE ?auto_31935 ) ( SURFACE-AT ?auto_31927 ?auto_31941 ) ( ON ?auto_31927 ?auto_31933 ) ( CLEAR ?auto_31927 ) ( not ( = ?auto_31926 ?auto_31933 ) ) ( not ( = ?auto_31927 ?auto_31933 ) ) ( not ( = ?auto_31925 ?auto_31933 ) ) ( IS-CRATE ?auto_31926 ) ( not ( = ?auto_31932 ?auto_31937 ) ) ( not ( = ?auto_31941 ?auto_31932 ) ) ( HOIST-AT ?auto_31942 ?auto_31932 ) ( not ( = ?auto_31930 ?auto_31942 ) ) ( not ( = ?auto_31935 ?auto_31942 ) ) ( AVAILABLE ?auto_31942 ) ( SURFACE-AT ?auto_31926 ?auto_31932 ) ( ON ?auto_31926 ?auto_31928 ) ( CLEAR ?auto_31926 ) ( not ( = ?auto_31926 ?auto_31928 ) ) ( not ( = ?auto_31927 ?auto_31928 ) ) ( not ( = ?auto_31925 ?auto_31928 ) ) ( not ( = ?auto_31933 ?auto_31928 ) ) ( IS-CRATE ?auto_31925 ) ( not ( = ?auto_31924 ?auto_31925 ) ) ( not ( = ?auto_31926 ?auto_31924 ) ) ( not ( = ?auto_31927 ?auto_31924 ) ) ( not ( = ?auto_31933 ?auto_31924 ) ) ( not ( = ?auto_31928 ?auto_31924 ) ) ( not ( = ?auto_31934 ?auto_31937 ) ) ( not ( = ?auto_31941 ?auto_31934 ) ) ( not ( = ?auto_31932 ?auto_31934 ) ) ( HOIST-AT ?auto_31939 ?auto_31934 ) ( not ( = ?auto_31930 ?auto_31939 ) ) ( not ( = ?auto_31935 ?auto_31939 ) ) ( not ( = ?auto_31942 ?auto_31939 ) ) ( AVAILABLE ?auto_31939 ) ( SURFACE-AT ?auto_31925 ?auto_31934 ) ( ON ?auto_31925 ?auto_31931 ) ( CLEAR ?auto_31925 ) ( not ( = ?auto_31926 ?auto_31931 ) ) ( not ( = ?auto_31927 ?auto_31931 ) ) ( not ( = ?auto_31925 ?auto_31931 ) ) ( not ( = ?auto_31933 ?auto_31931 ) ) ( not ( = ?auto_31928 ?auto_31931 ) ) ( not ( = ?auto_31924 ?auto_31931 ) ) ( IS-CRATE ?auto_31924 ) ( not ( = ?auto_31944 ?auto_31924 ) ) ( not ( = ?auto_31926 ?auto_31944 ) ) ( not ( = ?auto_31927 ?auto_31944 ) ) ( not ( = ?auto_31925 ?auto_31944 ) ) ( not ( = ?auto_31933 ?auto_31944 ) ) ( not ( = ?auto_31928 ?auto_31944 ) ) ( not ( = ?auto_31931 ?auto_31944 ) ) ( not ( = ?auto_31929 ?auto_31937 ) ) ( not ( = ?auto_31941 ?auto_31929 ) ) ( not ( = ?auto_31932 ?auto_31929 ) ) ( not ( = ?auto_31934 ?auto_31929 ) ) ( HOIST-AT ?auto_31943 ?auto_31929 ) ( not ( = ?auto_31930 ?auto_31943 ) ) ( not ( = ?auto_31935 ?auto_31943 ) ) ( not ( = ?auto_31942 ?auto_31943 ) ) ( not ( = ?auto_31939 ?auto_31943 ) ) ( AVAILABLE ?auto_31943 ) ( SURFACE-AT ?auto_31924 ?auto_31929 ) ( ON ?auto_31924 ?auto_31938 ) ( CLEAR ?auto_31924 ) ( not ( = ?auto_31926 ?auto_31938 ) ) ( not ( = ?auto_31927 ?auto_31938 ) ) ( not ( = ?auto_31925 ?auto_31938 ) ) ( not ( = ?auto_31933 ?auto_31938 ) ) ( not ( = ?auto_31928 ?auto_31938 ) ) ( not ( = ?auto_31924 ?auto_31938 ) ) ( not ( = ?auto_31931 ?auto_31938 ) ) ( not ( = ?auto_31944 ?auto_31938 ) ) ( TRUCK-AT ?auto_31940 ?auto_31937 ) ( SURFACE-AT ?auto_31936 ?auto_31937 ) ( CLEAR ?auto_31936 ) ( LIFTING ?auto_31930 ?auto_31944 ) ( IS-CRATE ?auto_31944 ) ( not ( = ?auto_31936 ?auto_31944 ) ) ( not ( = ?auto_31926 ?auto_31936 ) ) ( not ( = ?auto_31927 ?auto_31936 ) ) ( not ( = ?auto_31925 ?auto_31936 ) ) ( not ( = ?auto_31933 ?auto_31936 ) ) ( not ( = ?auto_31928 ?auto_31936 ) ) ( not ( = ?auto_31924 ?auto_31936 ) ) ( not ( = ?auto_31931 ?auto_31936 ) ) ( not ( = ?auto_31938 ?auto_31936 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31925 ?auto_31926 ?auto_31927 )
      ( MAKE-3CRATE-VERIFY ?auto_31924 ?auto_31925 ?auto_31926 ?auto_31927 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31945 - SURFACE
      ?auto_31946 - SURFACE
      ?auto_31947 - SURFACE
      ?auto_31948 - SURFACE
      ?auto_31949 - SURFACE
    )
    :vars
    (
      ?auto_31952 - HOIST
      ?auto_31959 - PLACE
      ?auto_31963 - PLACE
      ?auto_31957 - HOIST
      ?auto_31955 - SURFACE
      ?auto_31954 - PLACE
      ?auto_31964 - HOIST
      ?auto_31950 - SURFACE
      ?auto_31956 - PLACE
      ?auto_31961 - HOIST
      ?auto_31953 - SURFACE
      ?auto_31951 - PLACE
      ?auto_31965 - HOIST
      ?auto_31960 - SURFACE
      ?auto_31962 - TRUCK
      ?auto_31958 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31952 ?auto_31959 ) ( IS-CRATE ?auto_31949 ) ( not ( = ?auto_31948 ?auto_31949 ) ) ( not ( = ?auto_31947 ?auto_31948 ) ) ( not ( = ?auto_31947 ?auto_31949 ) ) ( not ( = ?auto_31963 ?auto_31959 ) ) ( HOIST-AT ?auto_31957 ?auto_31963 ) ( not ( = ?auto_31952 ?auto_31957 ) ) ( AVAILABLE ?auto_31957 ) ( SURFACE-AT ?auto_31949 ?auto_31963 ) ( ON ?auto_31949 ?auto_31955 ) ( CLEAR ?auto_31949 ) ( not ( = ?auto_31948 ?auto_31955 ) ) ( not ( = ?auto_31949 ?auto_31955 ) ) ( not ( = ?auto_31947 ?auto_31955 ) ) ( IS-CRATE ?auto_31948 ) ( not ( = ?auto_31954 ?auto_31959 ) ) ( not ( = ?auto_31963 ?auto_31954 ) ) ( HOIST-AT ?auto_31964 ?auto_31954 ) ( not ( = ?auto_31952 ?auto_31964 ) ) ( not ( = ?auto_31957 ?auto_31964 ) ) ( AVAILABLE ?auto_31964 ) ( SURFACE-AT ?auto_31948 ?auto_31954 ) ( ON ?auto_31948 ?auto_31950 ) ( CLEAR ?auto_31948 ) ( not ( = ?auto_31948 ?auto_31950 ) ) ( not ( = ?auto_31949 ?auto_31950 ) ) ( not ( = ?auto_31947 ?auto_31950 ) ) ( not ( = ?auto_31955 ?auto_31950 ) ) ( IS-CRATE ?auto_31947 ) ( not ( = ?auto_31946 ?auto_31947 ) ) ( not ( = ?auto_31948 ?auto_31946 ) ) ( not ( = ?auto_31949 ?auto_31946 ) ) ( not ( = ?auto_31955 ?auto_31946 ) ) ( not ( = ?auto_31950 ?auto_31946 ) ) ( not ( = ?auto_31956 ?auto_31959 ) ) ( not ( = ?auto_31963 ?auto_31956 ) ) ( not ( = ?auto_31954 ?auto_31956 ) ) ( HOIST-AT ?auto_31961 ?auto_31956 ) ( not ( = ?auto_31952 ?auto_31961 ) ) ( not ( = ?auto_31957 ?auto_31961 ) ) ( not ( = ?auto_31964 ?auto_31961 ) ) ( AVAILABLE ?auto_31961 ) ( SURFACE-AT ?auto_31947 ?auto_31956 ) ( ON ?auto_31947 ?auto_31953 ) ( CLEAR ?auto_31947 ) ( not ( = ?auto_31948 ?auto_31953 ) ) ( not ( = ?auto_31949 ?auto_31953 ) ) ( not ( = ?auto_31947 ?auto_31953 ) ) ( not ( = ?auto_31955 ?auto_31953 ) ) ( not ( = ?auto_31950 ?auto_31953 ) ) ( not ( = ?auto_31946 ?auto_31953 ) ) ( IS-CRATE ?auto_31946 ) ( not ( = ?auto_31945 ?auto_31946 ) ) ( not ( = ?auto_31948 ?auto_31945 ) ) ( not ( = ?auto_31949 ?auto_31945 ) ) ( not ( = ?auto_31947 ?auto_31945 ) ) ( not ( = ?auto_31955 ?auto_31945 ) ) ( not ( = ?auto_31950 ?auto_31945 ) ) ( not ( = ?auto_31953 ?auto_31945 ) ) ( not ( = ?auto_31951 ?auto_31959 ) ) ( not ( = ?auto_31963 ?auto_31951 ) ) ( not ( = ?auto_31954 ?auto_31951 ) ) ( not ( = ?auto_31956 ?auto_31951 ) ) ( HOIST-AT ?auto_31965 ?auto_31951 ) ( not ( = ?auto_31952 ?auto_31965 ) ) ( not ( = ?auto_31957 ?auto_31965 ) ) ( not ( = ?auto_31964 ?auto_31965 ) ) ( not ( = ?auto_31961 ?auto_31965 ) ) ( AVAILABLE ?auto_31965 ) ( SURFACE-AT ?auto_31946 ?auto_31951 ) ( ON ?auto_31946 ?auto_31960 ) ( CLEAR ?auto_31946 ) ( not ( = ?auto_31948 ?auto_31960 ) ) ( not ( = ?auto_31949 ?auto_31960 ) ) ( not ( = ?auto_31947 ?auto_31960 ) ) ( not ( = ?auto_31955 ?auto_31960 ) ) ( not ( = ?auto_31950 ?auto_31960 ) ) ( not ( = ?auto_31946 ?auto_31960 ) ) ( not ( = ?auto_31953 ?auto_31960 ) ) ( not ( = ?auto_31945 ?auto_31960 ) ) ( TRUCK-AT ?auto_31962 ?auto_31959 ) ( SURFACE-AT ?auto_31958 ?auto_31959 ) ( CLEAR ?auto_31958 ) ( LIFTING ?auto_31952 ?auto_31945 ) ( IS-CRATE ?auto_31945 ) ( not ( = ?auto_31958 ?auto_31945 ) ) ( not ( = ?auto_31948 ?auto_31958 ) ) ( not ( = ?auto_31949 ?auto_31958 ) ) ( not ( = ?auto_31947 ?auto_31958 ) ) ( not ( = ?auto_31955 ?auto_31958 ) ) ( not ( = ?auto_31950 ?auto_31958 ) ) ( not ( = ?auto_31946 ?auto_31958 ) ) ( not ( = ?auto_31953 ?auto_31958 ) ) ( not ( = ?auto_31960 ?auto_31958 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31947 ?auto_31948 ?auto_31949 )
      ( MAKE-4CRATE-VERIFY ?auto_31945 ?auto_31946 ?auto_31947 ?auto_31948 ?auto_31949 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31966 - SURFACE
      ?auto_31967 - SURFACE
      ?auto_31968 - SURFACE
      ?auto_31969 - SURFACE
      ?auto_31970 - SURFACE
      ?auto_31971 - SURFACE
    )
    :vars
    (
      ?auto_31974 - HOIST
      ?auto_31980 - PLACE
      ?auto_31984 - PLACE
      ?auto_31979 - HOIST
      ?auto_31977 - SURFACE
      ?auto_31976 - PLACE
      ?auto_31985 - HOIST
      ?auto_31972 - SURFACE
      ?auto_31978 - PLACE
      ?auto_31982 - HOIST
      ?auto_31975 - SURFACE
      ?auto_31973 - PLACE
      ?auto_31986 - HOIST
      ?auto_31981 - SURFACE
      ?auto_31983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31974 ?auto_31980 ) ( IS-CRATE ?auto_31971 ) ( not ( = ?auto_31970 ?auto_31971 ) ) ( not ( = ?auto_31969 ?auto_31970 ) ) ( not ( = ?auto_31969 ?auto_31971 ) ) ( not ( = ?auto_31984 ?auto_31980 ) ) ( HOIST-AT ?auto_31979 ?auto_31984 ) ( not ( = ?auto_31974 ?auto_31979 ) ) ( AVAILABLE ?auto_31979 ) ( SURFACE-AT ?auto_31971 ?auto_31984 ) ( ON ?auto_31971 ?auto_31977 ) ( CLEAR ?auto_31971 ) ( not ( = ?auto_31970 ?auto_31977 ) ) ( not ( = ?auto_31971 ?auto_31977 ) ) ( not ( = ?auto_31969 ?auto_31977 ) ) ( IS-CRATE ?auto_31970 ) ( not ( = ?auto_31976 ?auto_31980 ) ) ( not ( = ?auto_31984 ?auto_31976 ) ) ( HOIST-AT ?auto_31985 ?auto_31976 ) ( not ( = ?auto_31974 ?auto_31985 ) ) ( not ( = ?auto_31979 ?auto_31985 ) ) ( AVAILABLE ?auto_31985 ) ( SURFACE-AT ?auto_31970 ?auto_31976 ) ( ON ?auto_31970 ?auto_31972 ) ( CLEAR ?auto_31970 ) ( not ( = ?auto_31970 ?auto_31972 ) ) ( not ( = ?auto_31971 ?auto_31972 ) ) ( not ( = ?auto_31969 ?auto_31972 ) ) ( not ( = ?auto_31977 ?auto_31972 ) ) ( IS-CRATE ?auto_31969 ) ( not ( = ?auto_31968 ?auto_31969 ) ) ( not ( = ?auto_31970 ?auto_31968 ) ) ( not ( = ?auto_31971 ?auto_31968 ) ) ( not ( = ?auto_31977 ?auto_31968 ) ) ( not ( = ?auto_31972 ?auto_31968 ) ) ( not ( = ?auto_31978 ?auto_31980 ) ) ( not ( = ?auto_31984 ?auto_31978 ) ) ( not ( = ?auto_31976 ?auto_31978 ) ) ( HOIST-AT ?auto_31982 ?auto_31978 ) ( not ( = ?auto_31974 ?auto_31982 ) ) ( not ( = ?auto_31979 ?auto_31982 ) ) ( not ( = ?auto_31985 ?auto_31982 ) ) ( AVAILABLE ?auto_31982 ) ( SURFACE-AT ?auto_31969 ?auto_31978 ) ( ON ?auto_31969 ?auto_31975 ) ( CLEAR ?auto_31969 ) ( not ( = ?auto_31970 ?auto_31975 ) ) ( not ( = ?auto_31971 ?auto_31975 ) ) ( not ( = ?auto_31969 ?auto_31975 ) ) ( not ( = ?auto_31977 ?auto_31975 ) ) ( not ( = ?auto_31972 ?auto_31975 ) ) ( not ( = ?auto_31968 ?auto_31975 ) ) ( IS-CRATE ?auto_31968 ) ( not ( = ?auto_31967 ?auto_31968 ) ) ( not ( = ?auto_31970 ?auto_31967 ) ) ( not ( = ?auto_31971 ?auto_31967 ) ) ( not ( = ?auto_31969 ?auto_31967 ) ) ( not ( = ?auto_31977 ?auto_31967 ) ) ( not ( = ?auto_31972 ?auto_31967 ) ) ( not ( = ?auto_31975 ?auto_31967 ) ) ( not ( = ?auto_31973 ?auto_31980 ) ) ( not ( = ?auto_31984 ?auto_31973 ) ) ( not ( = ?auto_31976 ?auto_31973 ) ) ( not ( = ?auto_31978 ?auto_31973 ) ) ( HOIST-AT ?auto_31986 ?auto_31973 ) ( not ( = ?auto_31974 ?auto_31986 ) ) ( not ( = ?auto_31979 ?auto_31986 ) ) ( not ( = ?auto_31985 ?auto_31986 ) ) ( not ( = ?auto_31982 ?auto_31986 ) ) ( AVAILABLE ?auto_31986 ) ( SURFACE-AT ?auto_31968 ?auto_31973 ) ( ON ?auto_31968 ?auto_31981 ) ( CLEAR ?auto_31968 ) ( not ( = ?auto_31970 ?auto_31981 ) ) ( not ( = ?auto_31971 ?auto_31981 ) ) ( not ( = ?auto_31969 ?auto_31981 ) ) ( not ( = ?auto_31977 ?auto_31981 ) ) ( not ( = ?auto_31972 ?auto_31981 ) ) ( not ( = ?auto_31968 ?auto_31981 ) ) ( not ( = ?auto_31975 ?auto_31981 ) ) ( not ( = ?auto_31967 ?auto_31981 ) ) ( TRUCK-AT ?auto_31983 ?auto_31980 ) ( SURFACE-AT ?auto_31966 ?auto_31980 ) ( CLEAR ?auto_31966 ) ( LIFTING ?auto_31974 ?auto_31967 ) ( IS-CRATE ?auto_31967 ) ( not ( = ?auto_31966 ?auto_31967 ) ) ( not ( = ?auto_31970 ?auto_31966 ) ) ( not ( = ?auto_31971 ?auto_31966 ) ) ( not ( = ?auto_31969 ?auto_31966 ) ) ( not ( = ?auto_31977 ?auto_31966 ) ) ( not ( = ?auto_31972 ?auto_31966 ) ) ( not ( = ?auto_31968 ?auto_31966 ) ) ( not ( = ?auto_31975 ?auto_31966 ) ) ( not ( = ?auto_31981 ?auto_31966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31969 ?auto_31970 ?auto_31971 )
      ( MAKE-5CRATE-VERIFY ?auto_31966 ?auto_31967 ?auto_31968 ?auto_31969 ?auto_31970 ?auto_31971 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31987 - SURFACE
      ?auto_31988 - SURFACE
    )
    :vars
    (
      ?auto_31991 - HOIST
      ?auto_31998 - PLACE
      ?auto_32003 - SURFACE
      ?auto_32004 - PLACE
      ?auto_31996 - HOIST
      ?auto_31994 - SURFACE
      ?auto_31993 - PLACE
      ?auto_32005 - HOIST
      ?auto_31989 - SURFACE
      ?auto_31999 - SURFACE
      ?auto_31995 - PLACE
      ?auto_32001 - HOIST
      ?auto_31992 - SURFACE
      ?auto_32007 - SURFACE
      ?auto_31990 - PLACE
      ?auto_32006 - HOIST
      ?auto_32000 - SURFACE
      ?auto_32002 - TRUCK
      ?auto_31997 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31991 ?auto_31998 ) ( IS-CRATE ?auto_31988 ) ( not ( = ?auto_31987 ?auto_31988 ) ) ( not ( = ?auto_32003 ?auto_31987 ) ) ( not ( = ?auto_32003 ?auto_31988 ) ) ( not ( = ?auto_32004 ?auto_31998 ) ) ( HOIST-AT ?auto_31996 ?auto_32004 ) ( not ( = ?auto_31991 ?auto_31996 ) ) ( AVAILABLE ?auto_31996 ) ( SURFACE-AT ?auto_31988 ?auto_32004 ) ( ON ?auto_31988 ?auto_31994 ) ( CLEAR ?auto_31988 ) ( not ( = ?auto_31987 ?auto_31994 ) ) ( not ( = ?auto_31988 ?auto_31994 ) ) ( not ( = ?auto_32003 ?auto_31994 ) ) ( IS-CRATE ?auto_31987 ) ( not ( = ?auto_31993 ?auto_31998 ) ) ( not ( = ?auto_32004 ?auto_31993 ) ) ( HOIST-AT ?auto_32005 ?auto_31993 ) ( not ( = ?auto_31991 ?auto_32005 ) ) ( not ( = ?auto_31996 ?auto_32005 ) ) ( AVAILABLE ?auto_32005 ) ( SURFACE-AT ?auto_31987 ?auto_31993 ) ( ON ?auto_31987 ?auto_31989 ) ( CLEAR ?auto_31987 ) ( not ( = ?auto_31987 ?auto_31989 ) ) ( not ( = ?auto_31988 ?auto_31989 ) ) ( not ( = ?auto_32003 ?auto_31989 ) ) ( not ( = ?auto_31994 ?auto_31989 ) ) ( IS-CRATE ?auto_32003 ) ( not ( = ?auto_31999 ?auto_32003 ) ) ( not ( = ?auto_31987 ?auto_31999 ) ) ( not ( = ?auto_31988 ?auto_31999 ) ) ( not ( = ?auto_31994 ?auto_31999 ) ) ( not ( = ?auto_31989 ?auto_31999 ) ) ( not ( = ?auto_31995 ?auto_31998 ) ) ( not ( = ?auto_32004 ?auto_31995 ) ) ( not ( = ?auto_31993 ?auto_31995 ) ) ( HOIST-AT ?auto_32001 ?auto_31995 ) ( not ( = ?auto_31991 ?auto_32001 ) ) ( not ( = ?auto_31996 ?auto_32001 ) ) ( not ( = ?auto_32005 ?auto_32001 ) ) ( AVAILABLE ?auto_32001 ) ( SURFACE-AT ?auto_32003 ?auto_31995 ) ( ON ?auto_32003 ?auto_31992 ) ( CLEAR ?auto_32003 ) ( not ( = ?auto_31987 ?auto_31992 ) ) ( not ( = ?auto_31988 ?auto_31992 ) ) ( not ( = ?auto_32003 ?auto_31992 ) ) ( not ( = ?auto_31994 ?auto_31992 ) ) ( not ( = ?auto_31989 ?auto_31992 ) ) ( not ( = ?auto_31999 ?auto_31992 ) ) ( IS-CRATE ?auto_31999 ) ( not ( = ?auto_32007 ?auto_31999 ) ) ( not ( = ?auto_31987 ?auto_32007 ) ) ( not ( = ?auto_31988 ?auto_32007 ) ) ( not ( = ?auto_32003 ?auto_32007 ) ) ( not ( = ?auto_31994 ?auto_32007 ) ) ( not ( = ?auto_31989 ?auto_32007 ) ) ( not ( = ?auto_31992 ?auto_32007 ) ) ( not ( = ?auto_31990 ?auto_31998 ) ) ( not ( = ?auto_32004 ?auto_31990 ) ) ( not ( = ?auto_31993 ?auto_31990 ) ) ( not ( = ?auto_31995 ?auto_31990 ) ) ( HOIST-AT ?auto_32006 ?auto_31990 ) ( not ( = ?auto_31991 ?auto_32006 ) ) ( not ( = ?auto_31996 ?auto_32006 ) ) ( not ( = ?auto_32005 ?auto_32006 ) ) ( not ( = ?auto_32001 ?auto_32006 ) ) ( AVAILABLE ?auto_32006 ) ( SURFACE-AT ?auto_31999 ?auto_31990 ) ( ON ?auto_31999 ?auto_32000 ) ( CLEAR ?auto_31999 ) ( not ( = ?auto_31987 ?auto_32000 ) ) ( not ( = ?auto_31988 ?auto_32000 ) ) ( not ( = ?auto_32003 ?auto_32000 ) ) ( not ( = ?auto_31994 ?auto_32000 ) ) ( not ( = ?auto_31989 ?auto_32000 ) ) ( not ( = ?auto_31999 ?auto_32000 ) ) ( not ( = ?auto_31992 ?auto_32000 ) ) ( not ( = ?auto_32007 ?auto_32000 ) ) ( TRUCK-AT ?auto_32002 ?auto_31998 ) ( SURFACE-AT ?auto_31997 ?auto_31998 ) ( CLEAR ?auto_31997 ) ( IS-CRATE ?auto_32007 ) ( not ( = ?auto_31997 ?auto_32007 ) ) ( not ( = ?auto_31987 ?auto_31997 ) ) ( not ( = ?auto_31988 ?auto_31997 ) ) ( not ( = ?auto_32003 ?auto_31997 ) ) ( not ( = ?auto_31994 ?auto_31997 ) ) ( not ( = ?auto_31989 ?auto_31997 ) ) ( not ( = ?auto_31999 ?auto_31997 ) ) ( not ( = ?auto_31992 ?auto_31997 ) ) ( not ( = ?auto_32000 ?auto_31997 ) ) ( AVAILABLE ?auto_31991 ) ( IN ?auto_32007 ?auto_32002 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31991 ?auto_32007 ?auto_32002 ?auto_31998 )
      ( MAKE-2CRATE ?auto_32003 ?auto_31987 ?auto_31988 )
      ( MAKE-1CRATE-VERIFY ?auto_31987 ?auto_31988 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32008 - SURFACE
      ?auto_32009 - SURFACE
      ?auto_32010 - SURFACE
    )
    :vars
    (
      ?auto_32027 - HOIST
      ?auto_32018 - PLACE
      ?auto_32025 - PLACE
      ?auto_32013 - HOIST
      ?auto_32016 - SURFACE
      ?auto_32017 - PLACE
      ?auto_32023 - HOIST
      ?auto_32026 - SURFACE
      ?auto_32014 - SURFACE
      ?auto_32019 - PLACE
      ?auto_32021 - HOIST
      ?auto_32012 - SURFACE
      ?auto_32015 - SURFACE
      ?auto_32020 - PLACE
      ?auto_32024 - HOIST
      ?auto_32028 - SURFACE
      ?auto_32011 - TRUCK
      ?auto_32022 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32027 ?auto_32018 ) ( IS-CRATE ?auto_32010 ) ( not ( = ?auto_32009 ?auto_32010 ) ) ( not ( = ?auto_32008 ?auto_32009 ) ) ( not ( = ?auto_32008 ?auto_32010 ) ) ( not ( = ?auto_32025 ?auto_32018 ) ) ( HOIST-AT ?auto_32013 ?auto_32025 ) ( not ( = ?auto_32027 ?auto_32013 ) ) ( AVAILABLE ?auto_32013 ) ( SURFACE-AT ?auto_32010 ?auto_32025 ) ( ON ?auto_32010 ?auto_32016 ) ( CLEAR ?auto_32010 ) ( not ( = ?auto_32009 ?auto_32016 ) ) ( not ( = ?auto_32010 ?auto_32016 ) ) ( not ( = ?auto_32008 ?auto_32016 ) ) ( IS-CRATE ?auto_32009 ) ( not ( = ?auto_32017 ?auto_32018 ) ) ( not ( = ?auto_32025 ?auto_32017 ) ) ( HOIST-AT ?auto_32023 ?auto_32017 ) ( not ( = ?auto_32027 ?auto_32023 ) ) ( not ( = ?auto_32013 ?auto_32023 ) ) ( AVAILABLE ?auto_32023 ) ( SURFACE-AT ?auto_32009 ?auto_32017 ) ( ON ?auto_32009 ?auto_32026 ) ( CLEAR ?auto_32009 ) ( not ( = ?auto_32009 ?auto_32026 ) ) ( not ( = ?auto_32010 ?auto_32026 ) ) ( not ( = ?auto_32008 ?auto_32026 ) ) ( not ( = ?auto_32016 ?auto_32026 ) ) ( IS-CRATE ?auto_32008 ) ( not ( = ?auto_32014 ?auto_32008 ) ) ( not ( = ?auto_32009 ?auto_32014 ) ) ( not ( = ?auto_32010 ?auto_32014 ) ) ( not ( = ?auto_32016 ?auto_32014 ) ) ( not ( = ?auto_32026 ?auto_32014 ) ) ( not ( = ?auto_32019 ?auto_32018 ) ) ( not ( = ?auto_32025 ?auto_32019 ) ) ( not ( = ?auto_32017 ?auto_32019 ) ) ( HOIST-AT ?auto_32021 ?auto_32019 ) ( not ( = ?auto_32027 ?auto_32021 ) ) ( not ( = ?auto_32013 ?auto_32021 ) ) ( not ( = ?auto_32023 ?auto_32021 ) ) ( AVAILABLE ?auto_32021 ) ( SURFACE-AT ?auto_32008 ?auto_32019 ) ( ON ?auto_32008 ?auto_32012 ) ( CLEAR ?auto_32008 ) ( not ( = ?auto_32009 ?auto_32012 ) ) ( not ( = ?auto_32010 ?auto_32012 ) ) ( not ( = ?auto_32008 ?auto_32012 ) ) ( not ( = ?auto_32016 ?auto_32012 ) ) ( not ( = ?auto_32026 ?auto_32012 ) ) ( not ( = ?auto_32014 ?auto_32012 ) ) ( IS-CRATE ?auto_32014 ) ( not ( = ?auto_32015 ?auto_32014 ) ) ( not ( = ?auto_32009 ?auto_32015 ) ) ( not ( = ?auto_32010 ?auto_32015 ) ) ( not ( = ?auto_32008 ?auto_32015 ) ) ( not ( = ?auto_32016 ?auto_32015 ) ) ( not ( = ?auto_32026 ?auto_32015 ) ) ( not ( = ?auto_32012 ?auto_32015 ) ) ( not ( = ?auto_32020 ?auto_32018 ) ) ( not ( = ?auto_32025 ?auto_32020 ) ) ( not ( = ?auto_32017 ?auto_32020 ) ) ( not ( = ?auto_32019 ?auto_32020 ) ) ( HOIST-AT ?auto_32024 ?auto_32020 ) ( not ( = ?auto_32027 ?auto_32024 ) ) ( not ( = ?auto_32013 ?auto_32024 ) ) ( not ( = ?auto_32023 ?auto_32024 ) ) ( not ( = ?auto_32021 ?auto_32024 ) ) ( AVAILABLE ?auto_32024 ) ( SURFACE-AT ?auto_32014 ?auto_32020 ) ( ON ?auto_32014 ?auto_32028 ) ( CLEAR ?auto_32014 ) ( not ( = ?auto_32009 ?auto_32028 ) ) ( not ( = ?auto_32010 ?auto_32028 ) ) ( not ( = ?auto_32008 ?auto_32028 ) ) ( not ( = ?auto_32016 ?auto_32028 ) ) ( not ( = ?auto_32026 ?auto_32028 ) ) ( not ( = ?auto_32014 ?auto_32028 ) ) ( not ( = ?auto_32012 ?auto_32028 ) ) ( not ( = ?auto_32015 ?auto_32028 ) ) ( TRUCK-AT ?auto_32011 ?auto_32018 ) ( SURFACE-AT ?auto_32022 ?auto_32018 ) ( CLEAR ?auto_32022 ) ( IS-CRATE ?auto_32015 ) ( not ( = ?auto_32022 ?auto_32015 ) ) ( not ( = ?auto_32009 ?auto_32022 ) ) ( not ( = ?auto_32010 ?auto_32022 ) ) ( not ( = ?auto_32008 ?auto_32022 ) ) ( not ( = ?auto_32016 ?auto_32022 ) ) ( not ( = ?auto_32026 ?auto_32022 ) ) ( not ( = ?auto_32014 ?auto_32022 ) ) ( not ( = ?auto_32012 ?auto_32022 ) ) ( not ( = ?auto_32028 ?auto_32022 ) ) ( AVAILABLE ?auto_32027 ) ( IN ?auto_32015 ?auto_32011 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32009 ?auto_32010 )
      ( MAKE-2CRATE-VERIFY ?auto_32008 ?auto_32009 ?auto_32010 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32029 - SURFACE
      ?auto_32030 - SURFACE
      ?auto_32031 - SURFACE
      ?auto_32032 - SURFACE
    )
    :vars
    (
      ?auto_32046 - HOIST
      ?auto_32041 - PLACE
      ?auto_32045 - PLACE
      ?auto_32040 - HOIST
      ?auto_32042 - SURFACE
      ?auto_32037 - PLACE
      ?auto_32033 - HOIST
      ?auto_32044 - SURFACE
      ?auto_32039 - PLACE
      ?auto_32047 - HOIST
      ?auto_32035 - SURFACE
      ?auto_32048 - SURFACE
      ?auto_32049 - PLACE
      ?auto_32034 - HOIST
      ?auto_32043 - SURFACE
      ?auto_32038 - TRUCK
      ?auto_32036 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32046 ?auto_32041 ) ( IS-CRATE ?auto_32032 ) ( not ( = ?auto_32031 ?auto_32032 ) ) ( not ( = ?auto_32030 ?auto_32031 ) ) ( not ( = ?auto_32030 ?auto_32032 ) ) ( not ( = ?auto_32045 ?auto_32041 ) ) ( HOIST-AT ?auto_32040 ?auto_32045 ) ( not ( = ?auto_32046 ?auto_32040 ) ) ( AVAILABLE ?auto_32040 ) ( SURFACE-AT ?auto_32032 ?auto_32045 ) ( ON ?auto_32032 ?auto_32042 ) ( CLEAR ?auto_32032 ) ( not ( = ?auto_32031 ?auto_32042 ) ) ( not ( = ?auto_32032 ?auto_32042 ) ) ( not ( = ?auto_32030 ?auto_32042 ) ) ( IS-CRATE ?auto_32031 ) ( not ( = ?auto_32037 ?auto_32041 ) ) ( not ( = ?auto_32045 ?auto_32037 ) ) ( HOIST-AT ?auto_32033 ?auto_32037 ) ( not ( = ?auto_32046 ?auto_32033 ) ) ( not ( = ?auto_32040 ?auto_32033 ) ) ( AVAILABLE ?auto_32033 ) ( SURFACE-AT ?auto_32031 ?auto_32037 ) ( ON ?auto_32031 ?auto_32044 ) ( CLEAR ?auto_32031 ) ( not ( = ?auto_32031 ?auto_32044 ) ) ( not ( = ?auto_32032 ?auto_32044 ) ) ( not ( = ?auto_32030 ?auto_32044 ) ) ( not ( = ?auto_32042 ?auto_32044 ) ) ( IS-CRATE ?auto_32030 ) ( not ( = ?auto_32029 ?auto_32030 ) ) ( not ( = ?auto_32031 ?auto_32029 ) ) ( not ( = ?auto_32032 ?auto_32029 ) ) ( not ( = ?auto_32042 ?auto_32029 ) ) ( not ( = ?auto_32044 ?auto_32029 ) ) ( not ( = ?auto_32039 ?auto_32041 ) ) ( not ( = ?auto_32045 ?auto_32039 ) ) ( not ( = ?auto_32037 ?auto_32039 ) ) ( HOIST-AT ?auto_32047 ?auto_32039 ) ( not ( = ?auto_32046 ?auto_32047 ) ) ( not ( = ?auto_32040 ?auto_32047 ) ) ( not ( = ?auto_32033 ?auto_32047 ) ) ( AVAILABLE ?auto_32047 ) ( SURFACE-AT ?auto_32030 ?auto_32039 ) ( ON ?auto_32030 ?auto_32035 ) ( CLEAR ?auto_32030 ) ( not ( = ?auto_32031 ?auto_32035 ) ) ( not ( = ?auto_32032 ?auto_32035 ) ) ( not ( = ?auto_32030 ?auto_32035 ) ) ( not ( = ?auto_32042 ?auto_32035 ) ) ( not ( = ?auto_32044 ?auto_32035 ) ) ( not ( = ?auto_32029 ?auto_32035 ) ) ( IS-CRATE ?auto_32029 ) ( not ( = ?auto_32048 ?auto_32029 ) ) ( not ( = ?auto_32031 ?auto_32048 ) ) ( not ( = ?auto_32032 ?auto_32048 ) ) ( not ( = ?auto_32030 ?auto_32048 ) ) ( not ( = ?auto_32042 ?auto_32048 ) ) ( not ( = ?auto_32044 ?auto_32048 ) ) ( not ( = ?auto_32035 ?auto_32048 ) ) ( not ( = ?auto_32049 ?auto_32041 ) ) ( not ( = ?auto_32045 ?auto_32049 ) ) ( not ( = ?auto_32037 ?auto_32049 ) ) ( not ( = ?auto_32039 ?auto_32049 ) ) ( HOIST-AT ?auto_32034 ?auto_32049 ) ( not ( = ?auto_32046 ?auto_32034 ) ) ( not ( = ?auto_32040 ?auto_32034 ) ) ( not ( = ?auto_32033 ?auto_32034 ) ) ( not ( = ?auto_32047 ?auto_32034 ) ) ( AVAILABLE ?auto_32034 ) ( SURFACE-AT ?auto_32029 ?auto_32049 ) ( ON ?auto_32029 ?auto_32043 ) ( CLEAR ?auto_32029 ) ( not ( = ?auto_32031 ?auto_32043 ) ) ( not ( = ?auto_32032 ?auto_32043 ) ) ( not ( = ?auto_32030 ?auto_32043 ) ) ( not ( = ?auto_32042 ?auto_32043 ) ) ( not ( = ?auto_32044 ?auto_32043 ) ) ( not ( = ?auto_32029 ?auto_32043 ) ) ( not ( = ?auto_32035 ?auto_32043 ) ) ( not ( = ?auto_32048 ?auto_32043 ) ) ( TRUCK-AT ?auto_32038 ?auto_32041 ) ( SURFACE-AT ?auto_32036 ?auto_32041 ) ( CLEAR ?auto_32036 ) ( IS-CRATE ?auto_32048 ) ( not ( = ?auto_32036 ?auto_32048 ) ) ( not ( = ?auto_32031 ?auto_32036 ) ) ( not ( = ?auto_32032 ?auto_32036 ) ) ( not ( = ?auto_32030 ?auto_32036 ) ) ( not ( = ?auto_32042 ?auto_32036 ) ) ( not ( = ?auto_32044 ?auto_32036 ) ) ( not ( = ?auto_32029 ?auto_32036 ) ) ( not ( = ?auto_32035 ?auto_32036 ) ) ( not ( = ?auto_32043 ?auto_32036 ) ) ( AVAILABLE ?auto_32046 ) ( IN ?auto_32048 ?auto_32038 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32030 ?auto_32031 ?auto_32032 )
      ( MAKE-3CRATE-VERIFY ?auto_32029 ?auto_32030 ?auto_32031 ?auto_32032 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32050 - SURFACE
      ?auto_32051 - SURFACE
      ?auto_32052 - SURFACE
      ?auto_32053 - SURFACE
      ?auto_32054 - SURFACE
    )
    :vars
    (
      ?auto_32068 - HOIST
      ?auto_32063 - PLACE
      ?auto_32067 - PLACE
      ?auto_32062 - HOIST
      ?auto_32064 - SURFACE
      ?auto_32059 - PLACE
      ?auto_32055 - HOIST
      ?auto_32066 - SURFACE
      ?auto_32061 - PLACE
      ?auto_32069 - HOIST
      ?auto_32057 - SURFACE
      ?auto_32070 - PLACE
      ?auto_32056 - HOIST
      ?auto_32065 - SURFACE
      ?auto_32060 - TRUCK
      ?auto_32058 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32068 ?auto_32063 ) ( IS-CRATE ?auto_32054 ) ( not ( = ?auto_32053 ?auto_32054 ) ) ( not ( = ?auto_32052 ?auto_32053 ) ) ( not ( = ?auto_32052 ?auto_32054 ) ) ( not ( = ?auto_32067 ?auto_32063 ) ) ( HOIST-AT ?auto_32062 ?auto_32067 ) ( not ( = ?auto_32068 ?auto_32062 ) ) ( AVAILABLE ?auto_32062 ) ( SURFACE-AT ?auto_32054 ?auto_32067 ) ( ON ?auto_32054 ?auto_32064 ) ( CLEAR ?auto_32054 ) ( not ( = ?auto_32053 ?auto_32064 ) ) ( not ( = ?auto_32054 ?auto_32064 ) ) ( not ( = ?auto_32052 ?auto_32064 ) ) ( IS-CRATE ?auto_32053 ) ( not ( = ?auto_32059 ?auto_32063 ) ) ( not ( = ?auto_32067 ?auto_32059 ) ) ( HOIST-AT ?auto_32055 ?auto_32059 ) ( not ( = ?auto_32068 ?auto_32055 ) ) ( not ( = ?auto_32062 ?auto_32055 ) ) ( AVAILABLE ?auto_32055 ) ( SURFACE-AT ?auto_32053 ?auto_32059 ) ( ON ?auto_32053 ?auto_32066 ) ( CLEAR ?auto_32053 ) ( not ( = ?auto_32053 ?auto_32066 ) ) ( not ( = ?auto_32054 ?auto_32066 ) ) ( not ( = ?auto_32052 ?auto_32066 ) ) ( not ( = ?auto_32064 ?auto_32066 ) ) ( IS-CRATE ?auto_32052 ) ( not ( = ?auto_32051 ?auto_32052 ) ) ( not ( = ?auto_32053 ?auto_32051 ) ) ( not ( = ?auto_32054 ?auto_32051 ) ) ( not ( = ?auto_32064 ?auto_32051 ) ) ( not ( = ?auto_32066 ?auto_32051 ) ) ( not ( = ?auto_32061 ?auto_32063 ) ) ( not ( = ?auto_32067 ?auto_32061 ) ) ( not ( = ?auto_32059 ?auto_32061 ) ) ( HOIST-AT ?auto_32069 ?auto_32061 ) ( not ( = ?auto_32068 ?auto_32069 ) ) ( not ( = ?auto_32062 ?auto_32069 ) ) ( not ( = ?auto_32055 ?auto_32069 ) ) ( AVAILABLE ?auto_32069 ) ( SURFACE-AT ?auto_32052 ?auto_32061 ) ( ON ?auto_32052 ?auto_32057 ) ( CLEAR ?auto_32052 ) ( not ( = ?auto_32053 ?auto_32057 ) ) ( not ( = ?auto_32054 ?auto_32057 ) ) ( not ( = ?auto_32052 ?auto_32057 ) ) ( not ( = ?auto_32064 ?auto_32057 ) ) ( not ( = ?auto_32066 ?auto_32057 ) ) ( not ( = ?auto_32051 ?auto_32057 ) ) ( IS-CRATE ?auto_32051 ) ( not ( = ?auto_32050 ?auto_32051 ) ) ( not ( = ?auto_32053 ?auto_32050 ) ) ( not ( = ?auto_32054 ?auto_32050 ) ) ( not ( = ?auto_32052 ?auto_32050 ) ) ( not ( = ?auto_32064 ?auto_32050 ) ) ( not ( = ?auto_32066 ?auto_32050 ) ) ( not ( = ?auto_32057 ?auto_32050 ) ) ( not ( = ?auto_32070 ?auto_32063 ) ) ( not ( = ?auto_32067 ?auto_32070 ) ) ( not ( = ?auto_32059 ?auto_32070 ) ) ( not ( = ?auto_32061 ?auto_32070 ) ) ( HOIST-AT ?auto_32056 ?auto_32070 ) ( not ( = ?auto_32068 ?auto_32056 ) ) ( not ( = ?auto_32062 ?auto_32056 ) ) ( not ( = ?auto_32055 ?auto_32056 ) ) ( not ( = ?auto_32069 ?auto_32056 ) ) ( AVAILABLE ?auto_32056 ) ( SURFACE-AT ?auto_32051 ?auto_32070 ) ( ON ?auto_32051 ?auto_32065 ) ( CLEAR ?auto_32051 ) ( not ( = ?auto_32053 ?auto_32065 ) ) ( not ( = ?auto_32054 ?auto_32065 ) ) ( not ( = ?auto_32052 ?auto_32065 ) ) ( not ( = ?auto_32064 ?auto_32065 ) ) ( not ( = ?auto_32066 ?auto_32065 ) ) ( not ( = ?auto_32051 ?auto_32065 ) ) ( not ( = ?auto_32057 ?auto_32065 ) ) ( not ( = ?auto_32050 ?auto_32065 ) ) ( TRUCK-AT ?auto_32060 ?auto_32063 ) ( SURFACE-AT ?auto_32058 ?auto_32063 ) ( CLEAR ?auto_32058 ) ( IS-CRATE ?auto_32050 ) ( not ( = ?auto_32058 ?auto_32050 ) ) ( not ( = ?auto_32053 ?auto_32058 ) ) ( not ( = ?auto_32054 ?auto_32058 ) ) ( not ( = ?auto_32052 ?auto_32058 ) ) ( not ( = ?auto_32064 ?auto_32058 ) ) ( not ( = ?auto_32066 ?auto_32058 ) ) ( not ( = ?auto_32051 ?auto_32058 ) ) ( not ( = ?auto_32057 ?auto_32058 ) ) ( not ( = ?auto_32065 ?auto_32058 ) ) ( AVAILABLE ?auto_32068 ) ( IN ?auto_32050 ?auto_32060 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32052 ?auto_32053 ?auto_32054 )
      ( MAKE-4CRATE-VERIFY ?auto_32050 ?auto_32051 ?auto_32052 ?auto_32053 ?auto_32054 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32071 - SURFACE
      ?auto_32072 - SURFACE
      ?auto_32073 - SURFACE
      ?auto_32074 - SURFACE
      ?auto_32075 - SURFACE
      ?auto_32076 - SURFACE
    )
    :vars
    (
      ?auto_32089 - HOIST
      ?auto_32084 - PLACE
      ?auto_32088 - PLACE
      ?auto_32083 - HOIST
      ?auto_32085 - SURFACE
      ?auto_32080 - PLACE
      ?auto_32077 - HOIST
      ?auto_32087 - SURFACE
      ?auto_32082 - PLACE
      ?auto_32090 - HOIST
      ?auto_32079 - SURFACE
      ?auto_32091 - PLACE
      ?auto_32078 - HOIST
      ?auto_32086 - SURFACE
      ?auto_32081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32089 ?auto_32084 ) ( IS-CRATE ?auto_32076 ) ( not ( = ?auto_32075 ?auto_32076 ) ) ( not ( = ?auto_32074 ?auto_32075 ) ) ( not ( = ?auto_32074 ?auto_32076 ) ) ( not ( = ?auto_32088 ?auto_32084 ) ) ( HOIST-AT ?auto_32083 ?auto_32088 ) ( not ( = ?auto_32089 ?auto_32083 ) ) ( AVAILABLE ?auto_32083 ) ( SURFACE-AT ?auto_32076 ?auto_32088 ) ( ON ?auto_32076 ?auto_32085 ) ( CLEAR ?auto_32076 ) ( not ( = ?auto_32075 ?auto_32085 ) ) ( not ( = ?auto_32076 ?auto_32085 ) ) ( not ( = ?auto_32074 ?auto_32085 ) ) ( IS-CRATE ?auto_32075 ) ( not ( = ?auto_32080 ?auto_32084 ) ) ( not ( = ?auto_32088 ?auto_32080 ) ) ( HOIST-AT ?auto_32077 ?auto_32080 ) ( not ( = ?auto_32089 ?auto_32077 ) ) ( not ( = ?auto_32083 ?auto_32077 ) ) ( AVAILABLE ?auto_32077 ) ( SURFACE-AT ?auto_32075 ?auto_32080 ) ( ON ?auto_32075 ?auto_32087 ) ( CLEAR ?auto_32075 ) ( not ( = ?auto_32075 ?auto_32087 ) ) ( not ( = ?auto_32076 ?auto_32087 ) ) ( not ( = ?auto_32074 ?auto_32087 ) ) ( not ( = ?auto_32085 ?auto_32087 ) ) ( IS-CRATE ?auto_32074 ) ( not ( = ?auto_32073 ?auto_32074 ) ) ( not ( = ?auto_32075 ?auto_32073 ) ) ( not ( = ?auto_32076 ?auto_32073 ) ) ( not ( = ?auto_32085 ?auto_32073 ) ) ( not ( = ?auto_32087 ?auto_32073 ) ) ( not ( = ?auto_32082 ?auto_32084 ) ) ( not ( = ?auto_32088 ?auto_32082 ) ) ( not ( = ?auto_32080 ?auto_32082 ) ) ( HOIST-AT ?auto_32090 ?auto_32082 ) ( not ( = ?auto_32089 ?auto_32090 ) ) ( not ( = ?auto_32083 ?auto_32090 ) ) ( not ( = ?auto_32077 ?auto_32090 ) ) ( AVAILABLE ?auto_32090 ) ( SURFACE-AT ?auto_32074 ?auto_32082 ) ( ON ?auto_32074 ?auto_32079 ) ( CLEAR ?auto_32074 ) ( not ( = ?auto_32075 ?auto_32079 ) ) ( not ( = ?auto_32076 ?auto_32079 ) ) ( not ( = ?auto_32074 ?auto_32079 ) ) ( not ( = ?auto_32085 ?auto_32079 ) ) ( not ( = ?auto_32087 ?auto_32079 ) ) ( not ( = ?auto_32073 ?auto_32079 ) ) ( IS-CRATE ?auto_32073 ) ( not ( = ?auto_32072 ?auto_32073 ) ) ( not ( = ?auto_32075 ?auto_32072 ) ) ( not ( = ?auto_32076 ?auto_32072 ) ) ( not ( = ?auto_32074 ?auto_32072 ) ) ( not ( = ?auto_32085 ?auto_32072 ) ) ( not ( = ?auto_32087 ?auto_32072 ) ) ( not ( = ?auto_32079 ?auto_32072 ) ) ( not ( = ?auto_32091 ?auto_32084 ) ) ( not ( = ?auto_32088 ?auto_32091 ) ) ( not ( = ?auto_32080 ?auto_32091 ) ) ( not ( = ?auto_32082 ?auto_32091 ) ) ( HOIST-AT ?auto_32078 ?auto_32091 ) ( not ( = ?auto_32089 ?auto_32078 ) ) ( not ( = ?auto_32083 ?auto_32078 ) ) ( not ( = ?auto_32077 ?auto_32078 ) ) ( not ( = ?auto_32090 ?auto_32078 ) ) ( AVAILABLE ?auto_32078 ) ( SURFACE-AT ?auto_32073 ?auto_32091 ) ( ON ?auto_32073 ?auto_32086 ) ( CLEAR ?auto_32073 ) ( not ( = ?auto_32075 ?auto_32086 ) ) ( not ( = ?auto_32076 ?auto_32086 ) ) ( not ( = ?auto_32074 ?auto_32086 ) ) ( not ( = ?auto_32085 ?auto_32086 ) ) ( not ( = ?auto_32087 ?auto_32086 ) ) ( not ( = ?auto_32073 ?auto_32086 ) ) ( not ( = ?auto_32079 ?auto_32086 ) ) ( not ( = ?auto_32072 ?auto_32086 ) ) ( TRUCK-AT ?auto_32081 ?auto_32084 ) ( SURFACE-AT ?auto_32071 ?auto_32084 ) ( CLEAR ?auto_32071 ) ( IS-CRATE ?auto_32072 ) ( not ( = ?auto_32071 ?auto_32072 ) ) ( not ( = ?auto_32075 ?auto_32071 ) ) ( not ( = ?auto_32076 ?auto_32071 ) ) ( not ( = ?auto_32074 ?auto_32071 ) ) ( not ( = ?auto_32085 ?auto_32071 ) ) ( not ( = ?auto_32087 ?auto_32071 ) ) ( not ( = ?auto_32073 ?auto_32071 ) ) ( not ( = ?auto_32079 ?auto_32071 ) ) ( not ( = ?auto_32086 ?auto_32071 ) ) ( AVAILABLE ?auto_32089 ) ( IN ?auto_32072 ?auto_32081 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32074 ?auto_32075 ?auto_32076 )
      ( MAKE-5CRATE-VERIFY ?auto_32071 ?auto_32072 ?auto_32073 ?auto_32074 ?auto_32075 ?auto_32076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32092 - SURFACE
      ?auto_32093 - SURFACE
    )
    :vars
    (
      ?auto_32109 - HOIST
      ?auto_32102 - PLACE
      ?auto_32104 - SURFACE
      ?auto_32108 - PLACE
      ?auto_32101 - HOIST
      ?auto_32105 - SURFACE
      ?auto_32098 - PLACE
      ?auto_32094 - HOIST
      ?auto_32107 - SURFACE
      ?auto_32103 - SURFACE
      ?auto_32100 - PLACE
      ?auto_32110 - HOIST
      ?auto_32096 - SURFACE
      ?auto_32111 - SURFACE
      ?auto_32112 - PLACE
      ?auto_32095 - HOIST
      ?auto_32106 - SURFACE
      ?auto_32097 - SURFACE
      ?auto_32099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32109 ?auto_32102 ) ( IS-CRATE ?auto_32093 ) ( not ( = ?auto_32092 ?auto_32093 ) ) ( not ( = ?auto_32104 ?auto_32092 ) ) ( not ( = ?auto_32104 ?auto_32093 ) ) ( not ( = ?auto_32108 ?auto_32102 ) ) ( HOIST-AT ?auto_32101 ?auto_32108 ) ( not ( = ?auto_32109 ?auto_32101 ) ) ( AVAILABLE ?auto_32101 ) ( SURFACE-AT ?auto_32093 ?auto_32108 ) ( ON ?auto_32093 ?auto_32105 ) ( CLEAR ?auto_32093 ) ( not ( = ?auto_32092 ?auto_32105 ) ) ( not ( = ?auto_32093 ?auto_32105 ) ) ( not ( = ?auto_32104 ?auto_32105 ) ) ( IS-CRATE ?auto_32092 ) ( not ( = ?auto_32098 ?auto_32102 ) ) ( not ( = ?auto_32108 ?auto_32098 ) ) ( HOIST-AT ?auto_32094 ?auto_32098 ) ( not ( = ?auto_32109 ?auto_32094 ) ) ( not ( = ?auto_32101 ?auto_32094 ) ) ( AVAILABLE ?auto_32094 ) ( SURFACE-AT ?auto_32092 ?auto_32098 ) ( ON ?auto_32092 ?auto_32107 ) ( CLEAR ?auto_32092 ) ( not ( = ?auto_32092 ?auto_32107 ) ) ( not ( = ?auto_32093 ?auto_32107 ) ) ( not ( = ?auto_32104 ?auto_32107 ) ) ( not ( = ?auto_32105 ?auto_32107 ) ) ( IS-CRATE ?auto_32104 ) ( not ( = ?auto_32103 ?auto_32104 ) ) ( not ( = ?auto_32092 ?auto_32103 ) ) ( not ( = ?auto_32093 ?auto_32103 ) ) ( not ( = ?auto_32105 ?auto_32103 ) ) ( not ( = ?auto_32107 ?auto_32103 ) ) ( not ( = ?auto_32100 ?auto_32102 ) ) ( not ( = ?auto_32108 ?auto_32100 ) ) ( not ( = ?auto_32098 ?auto_32100 ) ) ( HOIST-AT ?auto_32110 ?auto_32100 ) ( not ( = ?auto_32109 ?auto_32110 ) ) ( not ( = ?auto_32101 ?auto_32110 ) ) ( not ( = ?auto_32094 ?auto_32110 ) ) ( AVAILABLE ?auto_32110 ) ( SURFACE-AT ?auto_32104 ?auto_32100 ) ( ON ?auto_32104 ?auto_32096 ) ( CLEAR ?auto_32104 ) ( not ( = ?auto_32092 ?auto_32096 ) ) ( not ( = ?auto_32093 ?auto_32096 ) ) ( not ( = ?auto_32104 ?auto_32096 ) ) ( not ( = ?auto_32105 ?auto_32096 ) ) ( not ( = ?auto_32107 ?auto_32096 ) ) ( not ( = ?auto_32103 ?auto_32096 ) ) ( IS-CRATE ?auto_32103 ) ( not ( = ?auto_32111 ?auto_32103 ) ) ( not ( = ?auto_32092 ?auto_32111 ) ) ( not ( = ?auto_32093 ?auto_32111 ) ) ( not ( = ?auto_32104 ?auto_32111 ) ) ( not ( = ?auto_32105 ?auto_32111 ) ) ( not ( = ?auto_32107 ?auto_32111 ) ) ( not ( = ?auto_32096 ?auto_32111 ) ) ( not ( = ?auto_32112 ?auto_32102 ) ) ( not ( = ?auto_32108 ?auto_32112 ) ) ( not ( = ?auto_32098 ?auto_32112 ) ) ( not ( = ?auto_32100 ?auto_32112 ) ) ( HOIST-AT ?auto_32095 ?auto_32112 ) ( not ( = ?auto_32109 ?auto_32095 ) ) ( not ( = ?auto_32101 ?auto_32095 ) ) ( not ( = ?auto_32094 ?auto_32095 ) ) ( not ( = ?auto_32110 ?auto_32095 ) ) ( AVAILABLE ?auto_32095 ) ( SURFACE-AT ?auto_32103 ?auto_32112 ) ( ON ?auto_32103 ?auto_32106 ) ( CLEAR ?auto_32103 ) ( not ( = ?auto_32092 ?auto_32106 ) ) ( not ( = ?auto_32093 ?auto_32106 ) ) ( not ( = ?auto_32104 ?auto_32106 ) ) ( not ( = ?auto_32105 ?auto_32106 ) ) ( not ( = ?auto_32107 ?auto_32106 ) ) ( not ( = ?auto_32103 ?auto_32106 ) ) ( not ( = ?auto_32096 ?auto_32106 ) ) ( not ( = ?auto_32111 ?auto_32106 ) ) ( SURFACE-AT ?auto_32097 ?auto_32102 ) ( CLEAR ?auto_32097 ) ( IS-CRATE ?auto_32111 ) ( not ( = ?auto_32097 ?auto_32111 ) ) ( not ( = ?auto_32092 ?auto_32097 ) ) ( not ( = ?auto_32093 ?auto_32097 ) ) ( not ( = ?auto_32104 ?auto_32097 ) ) ( not ( = ?auto_32105 ?auto_32097 ) ) ( not ( = ?auto_32107 ?auto_32097 ) ) ( not ( = ?auto_32103 ?auto_32097 ) ) ( not ( = ?auto_32096 ?auto_32097 ) ) ( not ( = ?auto_32106 ?auto_32097 ) ) ( AVAILABLE ?auto_32109 ) ( IN ?auto_32111 ?auto_32099 ) ( TRUCK-AT ?auto_32099 ?auto_32108 ) )
    :subtasks
    ( ( !DRIVE ?auto_32099 ?auto_32108 ?auto_32102 )
      ( MAKE-2CRATE ?auto_32104 ?auto_32092 ?auto_32093 )
      ( MAKE-1CRATE-VERIFY ?auto_32092 ?auto_32093 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32113 - SURFACE
      ?auto_32114 - SURFACE
      ?auto_32115 - SURFACE
    )
    :vars
    (
      ?auto_32122 - HOIST
      ?auto_32126 - PLACE
      ?auto_32131 - PLACE
      ?auto_32132 - HOIST
      ?auto_32133 - SURFACE
      ?auto_32129 - PLACE
      ?auto_32116 - HOIST
      ?auto_32130 - SURFACE
      ?auto_32128 - SURFACE
      ?auto_32121 - PLACE
      ?auto_32120 - HOIST
      ?auto_32117 - SURFACE
      ?auto_32119 - SURFACE
      ?auto_32125 - PLACE
      ?auto_32118 - HOIST
      ?auto_32123 - SURFACE
      ?auto_32127 - SURFACE
      ?auto_32124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32122 ?auto_32126 ) ( IS-CRATE ?auto_32115 ) ( not ( = ?auto_32114 ?auto_32115 ) ) ( not ( = ?auto_32113 ?auto_32114 ) ) ( not ( = ?auto_32113 ?auto_32115 ) ) ( not ( = ?auto_32131 ?auto_32126 ) ) ( HOIST-AT ?auto_32132 ?auto_32131 ) ( not ( = ?auto_32122 ?auto_32132 ) ) ( AVAILABLE ?auto_32132 ) ( SURFACE-AT ?auto_32115 ?auto_32131 ) ( ON ?auto_32115 ?auto_32133 ) ( CLEAR ?auto_32115 ) ( not ( = ?auto_32114 ?auto_32133 ) ) ( not ( = ?auto_32115 ?auto_32133 ) ) ( not ( = ?auto_32113 ?auto_32133 ) ) ( IS-CRATE ?auto_32114 ) ( not ( = ?auto_32129 ?auto_32126 ) ) ( not ( = ?auto_32131 ?auto_32129 ) ) ( HOIST-AT ?auto_32116 ?auto_32129 ) ( not ( = ?auto_32122 ?auto_32116 ) ) ( not ( = ?auto_32132 ?auto_32116 ) ) ( AVAILABLE ?auto_32116 ) ( SURFACE-AT ?auto_32114 ?auto_32129 ) ( ON ?auto_32114 ?auto_32130 ) ( CLEAR ?auto_32114 ) ( not ( = ?auto_32114 ?auto_32130 ) ) ( not ( = ?auto_32115 ?auto_32130 ) ) ( not ( = ?auto_32113 ?auto_32130 ) ) ( not ( = ?auto_32133 ?auto_32130 ) ) ( IS-CRATE ?auto_32113 ) ( not ( = ?auto_32128 ?auto_32113 ) ) ( not ( = ?auto_32114 ?auto_32128 ) ) ( not ( = ?auto_32115 ?auto_32128 ) ) ( not ( = ?auto_32133 ?auto_32128 ) ) ( not ( = ?auto_32130 ?auto_32128 ) ) ( not ( = ?auto_32121 ?auto_32126 ) ) ( not ( = ?auto_32131 ?auto_32121 ) ) ( not ( = ?auto_32129 ?auto_32121 ) ) ( HOIST-AT ?auto_32120 ?auto_32121 ) ( not ( = ?auto_32122 ?auto_32120 ) ) ( not ( = ?auto_32132 ?auto_32120 ) ) ( not ( = ?auto_32116 ?auto_32120 ) ) ( AVAILABLE ?auto_32120 ) ( SURFACE-AT ?auto_32113 ?auto_32121 ) ( ON ?auto_32113 ?auto_32117 ) ( CLEAR ?auto_32113 ) ( not ( = ?auto_32114 ?auto_32117 ) ) ( not ( = ?auto_32115 ?auto_32117 ) ) ( not ( = ?auto_32113 ?auto_32117 ) ) ( not ( = ?auto_32133 ?auto_32117 ) ) ( not ( = ?auto_32130 ?auto_32117 ) ) ( not ( = ?auto_32128 ?auto_32117 ) ) ( IS-CRATE ?auto_32128 ) ( not ( = ?auto_32119 ?auto_32128 ) ) ( not ( = ?auto_32114 ?auto_32119 ) ) ( not ( = ?auto_32115 ?auto_32119 ) ) ( not ( = ?auto_32113 ?auto_32119 ) ) ( not ( = ?auto_32133 ?auto_32119 ) ) ( not ( = ?auto_32130 ?auto_32119 ) ) ( not ( = ?auto_32117 ?auto_32119 ) ) ( not ( = ?auto_32125 ?auto_32126 ) ) ( not ( = ?auto_32131 ?auto_32125 ) ) ( not ( = ?auto_32129 ?auto_32125 ) ) ( not ( = ?auto_32121 ?auto_32125 ) ) ( HOIST-AT ?auto_32118 ?auto_32125 ) ( not ( = ?auto_32122 ?auto_32118 ) ) ( not ( = ?auto_32132 ?auto_32118 ) ) ( not ( = ?auto_32116 ?auto_32118 ) ) ( not ( = ?auto_32120 ?auto_32118 ) ) ( AVAILABLE ?auto_32118 ) ( SURFACE-AT ?auto_32128 ?auto_32125 ) ( ON ?auto_32128 ?auto_32123 ) ( CLEAR ?auto_32128 ) ( not ( = ?auto_32114 ?auto_32123 ) ) ( not ( = ?auto_32115 ?auto_32123 ) ) ( not ( = ?auto_32113 ?auto_32123 ) ) ( not ( = ?auto_32133 ?auto_32123 ) ) ( not ( = ?auto_32130 ?auto_32123 ) ) ( not ( = ?auto_32128 ?auto_32123 ) ) ( not ( = ?auto_32117 ?auto_32123 ) ) ( not ( = ?auto_32119 ?auto_32123 ) ) ( SURFACE-AT ?auto_32127 ?auto_32126 ) ( CLEAR ?auto_32127 ) ( IS-CRATE ?auto_32119 ) ( not ( = ?auto_32127 ?auto_32119 ) ) ( not ( = ?auto_32114 ?auto_32127 ) ) ( not ( = ?auto_32115 ?auto_32127 ) ) ( not ( = ?auto_32113 ?auto_32127 ) ) ( not ( = ?auto_32133 ?auto_32127 ) ) ( not ( = ?auto_32130 ?auto_32127 ) ) ( not ( = ?auto_32128 ?auto_32127 ) ) ( not ( = ?auto_32117 ?auto_32127 ) ) ( not ( = ?auto_32123 ?auto_32127 ) ) ( AVAILABLE ?auto_32122 ) ( IN ?auto_32119 ?auto_32124 ) ( TRUCK-AT ?auto_32124 ?auto_32131 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32114 ?auto_32115 )
      ( MAKE-2CRATE-VERIFY ?auto_32113 ?auto_32114 ?auto_32115 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32134 - SURFACE
      ?auto_32135 - SURFACE
      ?auto_32136 - SURFACE
      ?auto_32137 - SURFACE
    )
    :vars
    (
      ?auto_32144 - HOIST
      ?auto_32138 - PLACE
      ?auto_32146 - PLACE
      ?auto_32150 - HOIST
      ?auto_32149 - SURFACE
      ?auto_32147 - PLACE
      ?auto_32141 - HOIST
      ?auto_32140 - SURFACE
      ?auto_32143 - PLACE
      ?auto_32153 - HOIST
      ?auto_32148 - SURFACE
      ?auto_32142 - SURFACE
      ?auto_32145 - PLACE
      ?auto_32139 - HOIST
      ?auto_32152 - SURFACE
      ?auto_32154 - SURFACE
      ?auto_32151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32144 ?auto_32138 ) ( IS-CRATE ?auto_32137 ) ( not ( = ?auto_32136 ?auto_32137 ) ) ( not ( = ?auto_32135 ?auto_32136 ) ) ( not ( = ?auto_32135 ?auto_32137 ) ) ( not ( = ?auto_32146 ?auto_32138 ) ) ( HOIST-AT ?auto_32150 ?auto_32146 ) ( not ( = ?auto_32144 ?auto_32150 ) ) ( AVAILABLE ?auto_32150 ) ( SURFACE-AT ?auto_32137 ?auto_32146 ) ( ON ?auto_32137 ?auto_32149 ) ( CLEAR ?auto_32137 ) ( not ( = ?auto_32136 ?auto_32149 ) ) ( not ( = ?auto_32137 ?auto_32149 ) ) ( not ( = ?auto_32135 ?auto_32149 ) ) ( IS-CRATE ?auto_32136 ) ( not ( = ?auto_32147 ?auto_32138 ) ) ( not ( = ?auto_32146 ?auto_32147 ) ) ( HOIST-AT ?auto_32141 ?auto_32147 ) ( not ( = ?auto_32144 ?auto_32141 ) ) ( not ( = ?auto_32150 ?auto_32141 ) ) ( AVAILABLE ?auto_32141 ) ( SURFACE-AT ?auto_32136 ?auto_32147 ) ( ON ?auto_32136 ?auto_32140 ) ( CLEAR ?auto_32136 ) ( not ( = ?auto_32136 ?auto_32140 ) ) ( not ( = ?auto_32137 ?auto_32140 ) ) ( not ( = ?auto_32135 ?auto_32140 ) ) ( not ( = ?auto_32149 ?auto_32140 ) ) ( IS-CRATE ?auto_32135 ) ( not ( = ?auto_32134 ?auto_32135 ) ) ( not ( = ?auto_32136 ?auto_32134 ) ) ( not ( = ?auto_32137 ?auto_32134 ) ) ( not ( = ?auto_32149 ?auto_32134 ) ) ( not ( = ?auto_32140 ?auto_32134 ) ) ( not ( = ?auto_32143 ?auto_32138 ) ) ( not ( = ?auto_32146 ?auto_32143 ) ) ( not ( = ?auto_32147 ?auto_32143 ) ) ( HOIST-AT ?auto_32153 ?auto_32143 ) ( not ( = ?auto_32144 ?auto_32153 ) ) ( not ( = ?auto_32150 ?auto_32153 ) ) ( not ( = ?auto_32141 ?auto_32153 ) ) ( AVAILABLE ?auto_32153 ) ( SURFACE-AT ?auto_32135 ?auto_32143 ) ( ON ?auto_32135 ?auto_32148 ) ( CLEAR ?auto_32135 ) ( not ( = ?auto_32136 ?auto_32148 ) ) ( not ( = ?auto_32137 ?auto_32148 ) ) ( not ( = ?auto_32135 ?auto_32148 ) ) ( not ( = ?auto_32149 ?auto_32148 ) ) ( not ( = ?auto_32140 ?auto_32148 ) ) ( not ( = ?auto_32134 ?auto_32148 ) ) ( IS-CRATE ?auto_32134 ) ( not ( = ?auto_32142 ?auto_32134 ) ) ( not ( = ?auto_32136 ?auto_32142 ) ) ( not ( = ?auto_32137 ?auto_32142 ) ) ( not ( = ?auto_32135 ?auto_32142 ) ) ( not ( = ?auto_32149 ?auto_32142 ) ) ( not ( = ?auto_32140 ?auto_32142 ) ) ( not ( = ?auto_32148 ?auto_32142 ) ) ( not ( = ?auto_32145 ?auto_32138 ) ) ( not ( = ?auto_32146 ?auto_32145 ) ) ( not ( = ?auto_32147 ?auto_32145 ) ) ( not ( = ?auto_32143 ?auto_32145 ) ) ( HOIST-AT ?auto_32139 ?auto_32145 ) ( not ( = ?auto_32144 ?auto_32139 ) ) ( not ( = ?auto_32150 ?auto_32139 ) ) ( not ( = ?auto_32141 ?auto_32139 ) ) ( not ( = ?auto_32153 ?auto_32139 ) ) ( AVAILABLE ?auto_32139 ) ( SURFACE-AT ?auto_32134 ?auto_32145 ) ( ON ?auto_32134 ?auto_32152 ) ( CLEAR ?auto_32134 ) ( not ( = ?auto_32136 ?auto_32152 ) ) ( not ( = ?auto_32137 ?auto_32152 ) ) ( not ( = ?auto_32135 ?auto_32152 ) ) ( not ( = ?auto_32149 ?auto_32152 ) ) ( not ( = ?auto_32140 ?auto_32152 ) ) ( not ( = ?auto_32134 ?auto_32152 ) ) ( not ( = ?auto_32148 ?auto_32152 ) ) ( not ( = ?auto_32142 ?auto_32152 ) ) ( SURFACE-AT ?auto_32154 ?auto_32138 ) ( CLEAR ?auto_32154 ) ( IS-CRATE ?auto_32142 ) ( not ( = ?auto_32154 ?auto_32142 ) ) ( not ( = ?auto_32136 ?auto_32154 ) ) ( not ( = ?auto_32137 ?auto_32154 ) ) ( not ( = ?auto_32135 ?auto_32154 ) ) ( not ( = ?auto_32149 ?auto_32154 ) ) ( not ( = ?auto_32140 ?auto_32154 ) ) ( not ( = ?auto_32134 ?auto_32154 ) ) ( not ( = ?auto_32148 ?auto_32154 ) ) ( not ( = ?auto_32152 ?auto_32154 ) ) ( AVAILABLE ?auto_32144 ) ( IN ?auto_32142 ?auto_32151 ) ( TRUCK-AT ?auto_32151 ?auto_32146 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32135 ?auto_32136 ?auto_32137 )
      ( MAKE-3CRATE-VERIFY ?auto_32134 ?auto_32135 ?auto_32136 ?auto_32137 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32155 - SURFACE
      ?auto_32156 - SURFACE
      ?auto_32157 - SURFACE
      ?auto_32158 - SURFACE
      ?auto_32159 - SURFACE
    )
    :vars
    (
      ?auto_32165 - HOIST
      ?auto_32160 - PLACE
      ?auto_32167 - PLACE
      ?auto_32171 - HOIST
      ?auto_32170 - SURFACE
      ?auto_32168 - PLACE
      ?auto_32163 - HOIST
      ?auto_32162 - SURFACE
      ?auto_32164 - PLACE
      ?auto_32174 - HOIST
      ?auto_32169 - SURFACE
      ?auto_32166 - PLACE
      ?auto_32161 - HOIST
      ?auto_32173 - SURFACE
      ?auto_32175 - SURFACE
      ?auto_32172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32165 ?auto_32160 ) ( IS-CRATE ?auto_32159 ) ( not ( = ?auto_32158 ?auto_32159 ) ) ( not ( = ?auto_32157 ?auto_32158 ) ) ( not ( = ?auto_32157 ?auto_32159 ) ) ( not ( = ?auto_32167 ?auto_32160 ) ) ( HOIST-AT ?auto_32171 ?auto_32167 ) ( not ( = ?auto_32165 ?auto_32171 ) ) ( AVAILABLE ?auto_32171 ) ( SURFACE-AT ?auto_32159 ?auto_32167 ) ( ON ?auto_32159 ?auto_32170 ) ( CLEAR ?auto_32159 ) ( not ( = ?auto_32158 ?auto_32170 ) ) ( not ( = ?auto_32159 ?auto_32170 ) ) ( not ( = ?auto_32157 ?auto_32170 ) ) ( IS-CRATE ?auto_32158 ) ( not ( = ?auto_32168 ?auto_32160 ) ) ( not ( = ?auto_32167 ?auto_32168 ) ) ( HOIST-AT ?auto_32163 ?auto_32168 ) ( not ( = ?auto_32165 ?auto_32163 ) ) ( not ( = ?auto_32171 ?auto_32163 ) ) ( AVAILABLE ?auto_32163 ) ( SURFACE-AT ?auto_32158 ?auto_32168 ) ( ON ?auto_32158 ?auto_32162 ) ( CLEAR ?auto_32158 ) ( not ( = ?auto_32158 ?auto_32162 ) ) ( not ( = ?auto_32159 ?auto_32162 ) ) ( not ( = ?auto_32157 ?auto_32162 ) ) ( not ( = ?auto_32170 ?auto_32162 ) ) ( IS-CRATE ?auto_32157 ) ( not ( = ?auto_32156 ?auto_32157 ) ) ( not ( = ?auto_32158 ?auto_32156 ) ) ( not ( = ?auto_32159 ?auto_32156 ) ) ( not ( = ?auto_32170 ?auto_32156 ) ) ( not ( = ?auto_32162 ?auto_32156 ) ) ( not ( = ?auto_32164 ?auto_32160 ) ) ( not ( = ?auto_32167 ?auto_32164 ) ) ( not ( = ?auto_32168 ?auto_32164 ) ) ( HOIST-AT ?auto_32174 ?auto_32164 ) ( not ( = ?auto_32165 ?auto_32174 ) ) ( not ( = ?auto_32171 ?auto_32174 ) ) ( not ( = ?auto_32163 ?auto_32174 ) ) ( AVAILABLE ?auto_32174 ) ( SURFACE-AT ?auto_32157 ?auto_32164 ) ( ON ?auto_32157 ?auto_32169 ) ( CLEAR ?auto_32157 ) ( not ( = ?auto_32158 ?auto_32169 ) ) ( not ( = ?auto_32159 ?auto_32169 ) ) ( not ( = ?auto_32157 ?auto_32169 ) ) ( not ( = ?auto_32170 ?auto_32169 ) ) ( not ( = ?auto_32162 ?auto_32169 ) ) ( not ( = ?auto_32156 ?auto_32169 ) ) ( IS-CRATE ?auto_32156 ) ( not ( = ?auto_32155 ?auto_32156 ) ) ( not ( = ?auto_32158 ?auto_32155 ) ) ( not ( = ?auto_32159 ?auto_32155 ) ) ( not ( = ?auto_32157 ?auto_32155 ) ) ( not ( = ?auto_32170 ?auto_32155 ) ) ( not ( = ?auto_32162 ?auto_32155 ) ) ( not ( = ?auto_32169 ?auto_32155 ) ) ( not ( = ?auto_32166 ?auto_32160 ) ) ( not ( = ?auto_32167 ?auto_32166 ) ) ( not ( = ?auto_32168 ?auto_32166 ) ) ( not ( = ?auto_32164 ?auto_32166 ) ) ( HOIST-AT ?auto_32161 ?auto_32166 ) ( not ( = ?auto_32165 ?auto_32161 ) ) ( not ( = ?auto_32171 ?auto_32161 ) ) ( not ( = ?auto_32163 ?auto_32161 ) ) ( not ( = ?auto_32174 ?auto_32161 ) ) ( AVAILABLE ?auto_32161 ) ( SURFACE-AT ?auto_32156 ?auto_32166 ) ( ON ?auto_32156 ?auto_32173 ) ( CLEAR ?auto_32156 ) ( not ( = ?auto_32158 ?auto_32173 ) ) ( not ( = ?auto_32159 ?auto_32173 ) ) ( not ( = ?auto_32157 ?auto_32173 ) ) ( not ( = ?auto_32170 ?auto_32173 ) ) ( not ( = ?auto_32162 ?auto_32173 ) ) ( not ( = ?auto_32156 ?auto_32173 ) ) ( not ( = ?auto_32169 ?auto_32173 ) ) ( not ( = ?auto_32155 ?auto_32173 ) ) ( SURFACE-AT ?auto_32175 ?auto_32160 ) ( CLEAR ?auto_32175 ) ( IS-CRATE ?auto_32155 ) ( not ( = ?auto_32175 ?auto_32155 ) ) ( not ( = ?auto_32158 ?auto_32175 ) ) ( not ( = ?auto_32159 ?auto_32175 ) ) ( not ( = ?auto_32157 ?auto_32175 ) ) ( not ( = ?auto_32170 ?auto_32175 ) ) ( not ( = ?auto_32162 ?auto_32175 ) ) ( not ( = ?auto_32156 ?auto_32175 ) ) ( not ( = ?auto_32169 ?auto_32175 ) ) ( not ( = ?auto_32173 ?auto_32175 ) ) ( AVAILABLE ?auto_32165 ) ( IN ?auto_32155 ?auto_32172 ) ( TRUCK-AT ?auto_32172 ?auto_32167 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32157 ?auto_32158 ?auto_32159 )
      ( MAKE-4CRATE-VERIFY ?auto_32155 ?auto_32156 ?auto_32157 ?auto_32158 ?auto_32159 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32176 - SURFACE
      ?auto_32177 - SURFACE
      ?auto_32178 - SURFACE
      ?auto_32179 - SURFACE
      ?auto_32180 - SURFACE
      ?auto_32181 - SURFACE
    )
    :vars
    (
      ?auto_32187 - HOIST
      ?auto_32182 - PLACE
      ?auto_32189 - PLACE
      ?auto_32193 - HOIST
      ?auto_32192 - SURFACE
      ?auto_32190 - PLACE
      ?auto_32185 - HOIST
      ?auto_32184 - SURFACE
      ?auto_32186 - PLACE
      ?auto_32196 - HOIST
      ?auto_32191 - SURFACE
      ?auto_32188 - PLACE
      ?auto_32183 - HOIST
      ?auto_32195 - SURFACE
      ?auto_32194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32187 ?auto_32182 ) ( IS-CRATE ?auto_32181 ) ( not ( = ?auto_32180 ?auto_32181 ) ) ( not ( = ?auto_32179 ?auto_32180 ) ) ( not ( = ?auto_32179 ?auto_32181 ) ) ( not ( = ?auto_32189 ?auto_32182 ) ) ( HOIST-AT ?auto_32193 ?auto_32189 ) ( not ( = ?auto_32187 ?auto_32193 ) ) ( AVAILABLE ?auto_32193 ) ( SURFACE-AT ?auto_32181 ?auto_32189 ) ( ON ?auto_32181 ?auto_32192 ) ( CLEAR ?auto_32181 ) ( not ( = ?auto_32180 ?auto_32192 ) ) ( not ( = ?auto_32181 ?auto_32192 ) ) ( not ( = ?auto_32179 ?auto_32192 ) ) ( IS-CRATE ?auto_32180 ) ( not ( = ?auto_32190 ?auto_32182 ) ) ( not ( = ?auto_32189 ?auto_32190 ) ) ( HOIST-AT ?auto_32185 ?auto_32190 ) ( not ( = ?auto_32187 ?auto_32185 ) ) ( not ( = ?auto_32193 ?auto_32185 ) ) ( AVAILABLE ?auto_32185 ) ( SURFACE-AT ?auto_32180 ?auto_32190 ) ( ON ?auto_32180 ?auto_32184 ) ( CLEAR ?auto_32180 ) ( not ( = ?auto_32180 ?auto_32184 ) ) ( not ( = ?auto_32181 ?auto_32184 ) ) ( not ( = ?auto_32179 ?auto_32184 ) ) ( not ( = ?auto_32192 ?auto_32184 ) ) ( IS-CRATE ?auto_32179 ) ( not ( = ?auto_32178 ?auto_32179 ) ) ( not ( = ?auto_32180 ?auto_32178 ) ) ( not ( = ?auto_32181 ?auto_32178 ) ) ( not ( = ?auto_32192 ?auto_32178 ) ) ( not ( = ?auto_32184 ?auto_32178 ) ) ( not ( = ?auto_32186 ?auto_32182 ) ) ( not ( = ?auto_32189 ?auto_32186 ) ) ( not ( = ?auto_32190 ?auto_32186 ) ) ( HOIST-AT ?auto_32196 ?auto_32186 ) ( not ( = ?auto_32187 ?auto_32196 ) ) ( not ( = ?auto_32193 ?auto_32196 ) ) ( not ( = ?auto_32185 ?auto_32196 ) ) ( AVAILABLE ?auto_32196 ) ( SURFACE-AT ?auto_32179 ?auto_32186 ) ( ON ?auto_32179 ?auto_32191 ) ( CLEAR ?auto_32179 ) ( not ( = ?auto_32180 ?auto_32191 ) ) ( not ( = ?auto_32181 ?auto_32191 ) ) ( not ( = ?auto_32179 ?auto_32191 ) ) ( not ( = ?auto_32192 ?auto_32191 ) ) ( not ( = ?auto_32184 ?auto_32191 ) ) ( not ( = ?auto_32178 ?auto_32191 ) ) ( IS-CRATE ?auto_32178 ) ( not ( = ?auto_32177 ?auto_32178 ) ) ( not ( = ?auto_32180 ?auto_32177 ) ) ( not ( = ?auto_32181 ?auto_32177 ) ) ( not ( = ?auto_32179 ?auto_32177 ) ) ( not ( = ?auto_32192 ?auto_32177 ) ) ( not ( = ?auto_32184 ?auto_32177 ) ) ( not ( = ?auto_32191 ?auto_32177 ) ) ( not ( = ?auto_32188 ?auto_32182 ) ) ( not ( = ?auto_32189 ?auto_32188 ) ) ( not ( = ?auto_32190 ?auto_32188 ) ) ( not ( = ?auto_32186 ?auto_32188 ) ) ( HOIST-AT ?auto_32183 ?auto_32188 ) ( not ( = ?auto_32187 ?auto_32183 ) ) ( not ( = ?auto_32193 ?auto_32183 ) ) ( not ( = ?auto_32185 ?auto_32183 ) ) ( not ( = ?auto_32196 ?auto_32183 ) ) ( AVAILABLE ?auto_32183 ) ( SURFACE-AT ?auto_32178 ?auto_32188 ) ( ON ?auto_32178 ?auto_32195 ) ( CLEAR ?auto_32178 ) ( not ( = ?auto_32180 ?auto_32195 ) ) ( not ( = ?auto_32181 ?auto_32195 ) ) ( not ( = ?auto_32179 ?auto_32195 ) ) ( not ( = ?auto_32192 ?auto_32195 ) ) ( not ( = ?auto_32184 ?auto_32195 ) ) ( not ( = ?auto_32178 ?auto_32195 ) ) ( not ( = ?auto_32191 ?auto_32195 ) ) ( not ( = ?auto_32177 ?auto_32195 ) ) ( SURFACE-AT ?auto_32176 ?auto_32182 ) ( CLEAR ?auto_32176 ) ( IS-CRATE ?auto_32177 ) ( not ( = ?auto_32176 ?auto_32177 ) ) ( not ( = ?auto_32180 ?auto_32176 ) ) ( not ( = ?auto_32181 ?auto_32176 ) ) ( not ( = ?auto_32179 ?auto_32176 ) ) ( not ( = ?auto_32192 ?auto_32176 ) ) ( not ( = ?auto_32184 ?auto_32176 ) ) ( not ( = ?auto_32178 ?auto_32176 ) ) ( not ( = ?auto_32191 ?auto_32176 ) ) ( not ( = ?auto_32195 ?auto_32176 ) ) ( AVAILABLE ?auto_32187 ) ( IN ?auto_32177 ?auto_32194 ) ( TRUCK-AT ?auto_32194 ?auto_32189 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32179 ?auto_32180 ?auto_32181 )
      ( MAKE-5CRATE-VERIFY ?auto_32176 ?auto_32177 ?auto_32178 ?auto_32179 ?auto_32180 ?auto_32181 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32197 - SURFACE
      ?auto_32198 - SURFACE
    )
    :vars
    (
      ?auto_32205 - HOIST
      ?auto_32199 - PLACE
      ?auto_32211 - SURFACE
      ?auto_32207 - PLACE
      ?auto_32212 - HOIST
      ?auto_32210 - SURFACE
      ?auto_32208 - PLACE
      ?auto_32202 - HOIST
      ?auto_32201 - SURFACE
      ?auto_32213 - SURFACE
      ?auto_32204 - PLACE
      ?auto_32216 - HOIST
      ?auto_32209 - SURFACE
      ?auto_32203 - SURFACE
      ?auto_32206 - PLACE
      ?auto_32200 - HOIST
      ?auto_32215 - SURFACE
      ?auto_32217 - SURFACE
      ?auto_32214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32205 ?auto_32199 ) ( IS-CRATE ?auto_32198 ) ( not ( = ?auto_32197 ?auto_32198 ) ) ( not ( = ?auto_32211 ?auto_32197 ) ) ( not ( = ?auto_32211 ?auto_32198 ) ) ( not ( = ?auto_32207 ?auto_32199 ) ) ( HOIST-AT ?auto_32212 ?auto_32207 ) ( not ( = ?auto_32205 ?auto_32212 ) ) ( SURFACE-AT ?auto_32198 ?auto_32207 ) ( ON ?auto_32198 ?auto_32210 ) ( CLEAR ?auto_32198 ) ( not ( = ?auto_32197 ?auto_32210 ) ) ( not ( = ?auto_32198 ?auto_32210 ) ) ( not ( = ?auto_32211 ?auto_32210 ) ) ( IS-CRATE ?auto_32197 ) ( not ( = ?auto_32208 ?auto_32199 ) ) ( not ( = ?auto_32207 ?auto_32208 ) ) ( HOIST-AT ?auto_32202 ?auto_32208 ) ( not ( = ?auto_32205 ?auto_32202 ) ) ( not ( = ?auto_32212 ?auto_32202 ) ) ( AVAILABLE ?auto_32202 ) ( SURFACE-AT ?auto_32197 ?auto_32208 ) ( ON ?auto_32197 ?auto_32201 ) ( CLEAR ?auto_32197 ) ( not ( = ?auto_32197 ?auto_32201 ) ) ( not ( = ?auto_32198 ?auto_32201 ) ) ( not ( = ?auto_32211 ?auto_32201 ) ) ( not ( = ?auto_32210 ?auto_32201 ) ) ( IS-CRATE ?auto_32211 ) ( not ( = ?auto_32213 ?auto_32211 ) ) ( not ( = ?auto_32197 ?auto_32213 ) ) ( not ( = ?auto_32198 ?auto_32213 ) ) ( not ( = ?auto_32210 ?auto_32213 ) ) ( not ( = ?auto_32201 ?auto_32213 ) ) ( not ( = ?auto_32204 ?auto_32199 ) ) ( not ( = ?auto_32207 ?auto_32204 ) ) ( not ( = ?auto_32208 ?auto_32204 ) ) ( HOIST-AT ?auto_32216 ?auto_32204 ) ( not ( = ?auto_32205 ?auto_32216 ) ) ( not ( = ?auto_32212 ?auto_32216 ) ) ( not ( = ?auto_32202 ?auto_32216 ) ) ( AVAILABLE ?auto_32216 ) ( SURFACE-AT ?auto_32211 ?auto_32204 ) ( ON ?auto_32211 ?auto_32209 ) ( CLEAR ?auto_32211 ) ( not ( = ?auto_32197 ?auto_32209 ) ) ( not ( = ?auto_32198 ?auto_32209 ) ) ( not ( = ?auto_32211 ?auto_32209 ) ) ( not ( = ?auto_32210 ?auto_32209 ) ) ( not ( = ?auto_32201 ?auto_32209 ) ) ( not ( = ?auto_32213 ?auto_32209 ) ) ( IS-CRATE ?auto_32213 ) ( not ( = ?auto_32203 ?auto_32213 ) ) ( not ( = ?auto_32197 ?auto_32203 ) ) ( not ( = ?auto_32198 ?auto_32203 ) ) ( not ( = ?auto_32211 ?auto_32203 ) ) ( not ( = ?auto_32210 ?auto_32203 ) ) ( not ( = ?auto_32201 ?auto_32203 ) ) ( not ( = ?auto_32209 ?auto_32203 ) ) ( not ( = ?auto_32206 ?auto_32199 ) ) ( not ( = ?auto_32207 ?auto_32206 ) ) ( not ( = ?auto_32208 ?auto_32206 ) ) ( not ( = ?auto_32204 ?auto_32206 ) ) ( HOIST-AT ?auto_32200 ?auto_32206 ) ( not ( = ?auto_32205 ?auto_32200 ) ) ( not ( = ?auto_32212 ?auto_32200 ) ) ( not ( = ?auto_32202 ?auto_32200 ) ) ( not ( = ?auto_32216 ?auto_32200 ) ) ( AVAILABLE ?auto_32200 ) ( SURFACE-AT ?auto_32213 ?auto_32206 ) ( ON ?auto_32213 ?auto_32215 ) ( CLEAR ?auto_32213 ) ( not ( = ?auto_32197 ?auto_32215 ) ) ( not ( = ?auto_32198 ?auto_32215 ) ) ( not ( = ?auto_32211 ?auto_32215 ) ) ( not ( = ?auto_32210 ?auto_32215 ) ) ( not ( = ?auto_32201 ?auto_32215 ) ) ( not ( = ?auto_32213 ?auto_32215 ) ) ( not ( = ?auto_32209 ?auto_32215 ) ) ( not ( = ?auto_32203 ?auto_32215 ) ) ( SURFACE-AT ?auto_32217 ?auto_32199 ) ( CLEAR ?auto_32217 ) ( IS-CRATE ?auto_32203 ) ( not ( = ?auto_32217 ?auto_32203 ) ) ( not ( = ?auto_32197 ?auto_32217 ) ) ( not ( = ?auto_32198 ?auto_32217 ) ) ( not ( = ?auto_32211 ?auto_32217 ) ) ( not ( = ?auto_32210 ?auto_32217 ) ) ( not ( = ?auto_32201 ?auto_32217 ) ) ( not ( = ?auto_32213 ?auto_32217 ) ) ( not ( = ?auto_32209 ?auto_32217 ) ) ( not ( = ?auto_32215 ?auto_32217 ) ) ( AVAILABLE ?auto_32205 ) ( TRUCK-AT ?auto_32214 ?auto_32207 ) ( LIFTING ?auto_32212 ?auto_32203 ) )
    :subtasks
    ( ( !LOAD ?auto_32212 ?auto_32203 ?auto_32214 ?auto_32207 )
      ( MAKE-2CRATE ?auto_32211 ?auto_32197 ?auto_32198 )
      ( MAKE-1CRATE-VERIFY ?auto_32197 ?auto_32198 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32218 - SURFACE
      ?auto_32219 - SURFACE
      ?auto_32220 - SURFACE
    )
    :vars
    (
      ?auto_32234 - HOIST
      ?auto_32222 - PLACE
      ?auto_32236 - PLACE
      ?auto_32228 - HOIST
      ?auto_32224 - SURFACE
      ?auto_32226 - PLACE
      ?auto_32223 - HOIST
      ?auto_32227 - SURFACE
      ?auto_32221 - SURFACE
      ?auto_32238 - PLACE
      ?auto_32233 - HOIST
      ?auto_32229 - SURFACE
      ?auto_32237 - SURFACE
      ?auto_32231 - PLACE
      ?auto_32232 - HOIST
      ?auto_32230 - SURFACE
      ?auto_32225 - SURFACE
      ?auto_32235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32234 ?auto_32222 ) ( IS-CRATE ?auto_32220 ) ( not ( = ?auto_32219 ?auto_32220 ) ) ( not ( = ?auto_32218 ?auto_32219 ) ) ( not ( = ?auto_32218 ?auto_32220 ) ) ( not ( = ?auto_32236 ?auto_32222 ) ) ( HOIST-AT ?auto_32228 ?auto_32236 ) ( not ( = ?auto_32234 ?auto_32228 ) ) ( SURFACE-AT ?auto_32220 ?auto_32236 ) ( ON ?auto_32220 ?auto_32224 ) ( CLEAR ?auto_32220 ) ( not ( = ?auto_32219 ?auto_32224 ) ) ( not ( = ?auto_32220 ?auto_32224 ) ) ( not ( = ?auto_32218 ?auto_32224 ) ) ( IS-CRATE ?auto_32219 ) ( not ( = ?auto_32226 ?auto_32222 ) ) ( not ( = ?auto_32236 ?auto_32226 ) ) ( HOIST-AT ?auto_32223 ?auto_32226 ) ( not ( = ?auto_32234 ?auto_32223 ) ) ( not ( = ?auto_32228 ?auto_32223 ) ) ( AVAILABLE ?auto_32223 ) ( SURFACE-AT ?auto_32219 ?auto_32226 ) ( ON ?auto_32219 ?auto_32227 ) ( CLEAR ?auto_32219 ) ( not ( = ?auto_32219 ?auto_32227 ) ) ( not ( = ?auto_32220 ?auto_32227 ) ) ( not ( = ?auto_32218 ?auto_32227 ) ) ( not ( = ?auto_32224 ?auto_32227 ) ) ( IS-CRATE ?auto_32218 ) ( not ( = ?auto_32221 ?auto_32218 ) ) ( not ( = ?auto_32219 ?auto_32221 ) ) ( not ( = ?auto_32220 ?auto_32221 ) ) ( not ( = ?auto_32224 ?auto_32221 ) ) ( not ( = ?auto_32227 ?auto_32221 ) ) ( not ( = ?auto_32238 ?auto_32222 ) ) ( not ( = ?auto_32236 ?auto_32238 ) ) ( not ( = ?auto_32226 ?auto_32238 ) ) ( HOIST-AT ?auto_32233 ?auto_32238 ) ( not ( = ?auto_32234 ?auto_32233 ) ) ( not ( = ?auto_32228 ?auto_32233 ) ) ( not ( = ?auto_32223 ?auto_32233 ) ) ( AVAILABLE ?auto_32233 ) ( SURFACE-AT ?auto_32218 ?auto_32238 ) ( ON ?auto_32218 ?auto_32229 ) ( CLEAR ?auto_32218 ) ( not ( = ?auto_32219 ?auto_32229 ) ) ( not ( = ?auto_32220 ?auto_32229 ) ) ( not ( = ?auto_32218 ?auto_32229 ) ) ( not ( = ?auto_32224 ?auto_32229 ) ) ( not ( = ?auto_32227 ?auto_32229 ) ) ( not ( = ?auto_32221 ?auto_32229 ) ) ( IS-CRATE ?auto_32221 ) ( not ( = ?auto_32237 ?auto_32221 ) ) ( not ( = ?auto_32219 ?auto_32237 ) ) ( not ( = ?auto_32220 ?auto_32237 ) ) ( not ( = ?auto_32218 ?auto_32237 ) ) ( not ( = ?auto_32224 ?auto_32237 ) ) ( not ( = ?auto_32227 ?auto_32237 ) ) ( not ( = ?auto_32229 ?auto_32237 ) ) ( not ( = ?auto_32231 ?auto_32222 ) ) ( not ( = ?auto_32236 ?auto_32231 ) ) ( not ( = ?auto_32226 ?auto_32231 ) ) ( not ( = ?auto_32238 ?auto_32231 ) ) ( HOIST-AT ?auto_32232 ?auto_32231 ) ( not ( = ?auto_32234 ?auto_32232 ) ) ( not ( = ?auto_32228 ?auto_32232 ) ) ( not ( = ?auto_32223 ?auto_32232 ) ) ( not ( = ?auto_32233 ?auto_32232 ) ) ( AVAILABLE ?auto_32232 ) ( SURFACE-AT ?auto_32221 ?auto_32231 ) ( ON ?auto_32221 ?auto_32230 ) ( CLEAR ?auto_32221 ) ( not ( = ?auto_32219 ?auto_32230 ) ) ( not ( = ?auto_32220 ?auto_32230 ) ) ( not ( = ?auto_32218 ?auto_32230 ) ) ( not ( = ?auto_32224 ?auto_32230 ) ) ( not ( = ?auto_32227 ?auto_32230 ) ) ( not ( = ?auto_32221 ?auto_32230 ) ) ( not ( = ?auto_32229 ?auto_32230 ) ) ( not ( = ?auto_32237 ?auto_32230 ) ) ( SURFACE-AT ?auto_32225 ?auto_32222 ) ( CLEAR ?auto_32225 ) ( IS-CRATE ?auto_32237 ) ( not ( = ?auto_32225 ?auto_32237 ) ) ( not ( = ?auto_32219 ?auto_32225 ) ) ( not ( = ?auto_32220 ?auto_32225 ) ) ( not ( = ?auto_32218 ?auto_32225 ) ) ( not ( = ?auto_32224 ?auto_32225 ) ) ( not ( = ?auto_32227 ?auto_32225 ) ) ( not ( = ?auto_32221 ?auto_32225 ) ) ( not ( = ?auto_32229 ?auto_32225 ) ) ( not ( = ?auto_32230 ?auto_32225 ) ) ( AVAILABLE ?auto_32234 ) ( TRUCK-AT ?auto_32235 ?auto_32236 ) ( LIFTING ?auto_32228 ?auto_32237 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32219 ?auto_32220 )
      ( MAKE-2CRATE-VERIFY ?auto_32218 ?auto_32219 ?auto_32220 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32239 - SURFACE
      ?auto_32240 - SURFACE
      ?auto_32241 - SURFACE
      ?auto_32242 - SURFACE
    )
    :vars
    (
      ?auto_32254 - HOIST
      ?auto_32246 - PLACE
      ?auto_32251 - PLACE
      ?auto_32243 - HOIST
      ?auto_32248 - SURFACE
      ?auto_32258 - PLACE
      ?auto_32257 - HOIST
      ?auto_32247 - SURFACE
      ?auto_32249 - PLACE
      ?auto_32259 - HOIST
      ?auto_32245 - SURFACE
      ?auto_32253 - SURFACE
      ?auto_32244 - PLACE
      ?auto_32250 - HOIST
      ?auto_32256 - SURFACE
      ?auto_32252 - SURFACE
      ?auto_32255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32254 ?auto_32246 ) ( IS-CRATE ?auto_32242 ) ( not ( = ?auto_32241 ?auto_32242 ) ) ( not ( = ?auto_32240 ?auto_32241 ) ) ( not ( = ?auto_32240 ?auto_32242 ) ) ( not ( = ?auto_32251 ?auto_32246 ) ) ( HOIST-AT ?auto_32243 ?auto_32251 ) ( not ( = ?auto_32254 ?auto_32243 ) ) ( SURFACE-AT ?auto_32242 ?auto_32251 ) ( ON ?auto_32242 ?auto_32248 ) ( CLEAR ?auto_32242 ) ( not ( = ?auto_32241 ?auto_32248 ) ) ( not ( = ?auto_32242 ?auto_32248 ) ) ( not ( = ?auto_32240 ?auto_32248 ) ) ( IS-CRATE ?auto_32241 ) ( not ( = ?auto_32258 ?auto_32246 ) ) ( not ( = ?auto_32251 ?auto_32258 ) ) ( HOIST-AT ?auto_32257 ?auto_32258 ) ( not ( = ?auto_32254 ?auto_32257 ) ) ( not ( = ?auto_32243 ?auto_32257 ) ) ( AVAILABLE ?auto_32257 ) ( SURFACE-AT ?auto_32241 ?auto_32258 ) ( ON ?auto_32241 ?auto_32247 ) ( CLEAR ?auto_32241 ) ( not ( = ?auto_32241 ?auto_32247 ) ) ( not ( = ?auto_32242 ?auto_32247 ) ) ( not ( = ?auto_32240 ?auto_32247 ) ) ( not ( = ?auto_32248 ?auto_32247 ) ) ( IS-CRATE ?auto_32240 ) ( not ( = ?auto_32239 ?auto_32240 ) ) ( not ( = ?auto_32241 ?auto_32239 ) ) ( not ( = ?auto_32242 ?auto_32239 ) ) ( not ( = ?auto_32248 ?auto_32239 ) ) ( not ( = ?auto_32247 ?auto_32239 ) ) ( not ( = ?auto_32249 ?auto_32246 ) ) ( not ( = ?auto_32251 ?auto_32249 ) ) ( not ( = ?auto_32258 ?auto_32249 ) ) ( HOIST-AT ?auto_32259 ?auto_32249 ) ( not ( = ?auto_32254 ?auto_32259 ) ) ( not ( = ?auto_32243 ?auto_32259 ) ) ( not ( = ?auto_32257 ?auto_32259 ) ) ( AVAILABLE ?auto_32259 ) ( SURFACE-AT ?auto_32240 ?auto_32249 ) ( ON ?auto_32240 ?auto_32245 ) ( CLEAR ?auto_32240 ) ( not ( = ?auto_32241 ?auto_32245 ) ) ( not ( = ?auto_32242 ?auto_32245 ) ) ( not ( = ?auto_32240 ?auto_32245 ) ) ( not ( = ?auto_32248 ?auto_32245 ) ) ( not ( = ?auto_32247 ?auto_32245 ) ) ( not ( = ?auto_32239 ?auto_32245 ) ) ( IS-CRATE ?auto_32239 ) ( not ( = ?auto_32253 ?auto_32239 ) ) ( not ( = ?auto_32241 ?auto_32253 ) ) ( not ( = ?auto_32242 ?auto_32253 ) ) ( not ( = ?auto_32240 ?auto_32253 ) ) ( not ( = ?auto_32248 ?auto_32253 ) ) ( not ( = ?auto_32247 ?auto_32253 ) ) ( not ( = ?auto_32245 ?auto_32253 ) ) ( not ( = ?auto_32244 ?auto_32246 ) ) ( not ( = ?auto_32251 ?auto_32244 ) ) ( not ( = ?auto_32258 ?auto_32244 ) ) ( not ( = ?auto_32249 ?auto_32244 ) ) ( HOIST-AT ?auto_32250 ?auto_32244 ) ( not ( = ?auto_32254 ?auto_32250 ) ) ( not ( = ?auto_32243 ?auto_32250 ) ) ( not ( = ?auto_32257 ?auto_32250 ) ) ( not ( = ?auto_32259 ?auto_32250 ) ) ( AVAILABLE ?auto_32250 ) ( SURFACE-AT ?auto_32239 ?auto_32244 ) ( ON ?auto_32239 ?auto_32256 ) ( CLEAR ?auto_32239 ) ( not ( = ?auto_32241 ?auto_32256 ) ) ( not ( = ?auto_32242 ?auto_32256 ) ) ( not ( = ?auto_32240 ?auto_32256 ) ) ( not ( = ?auto_32248 ?auto_32256 ) ) ( not ( = ?auto_32247 ?auto_32256 ) ) ( not ( = ?auto_32239 ?auto_32256 ) ) ( not ( = ?auto_32245 ?auto_32256 ) ) ( not ( = ?auto_32253 ?auto_32256 ) ) ( SURFACE-AT ?auto_32252 ?auto_32246 ) ( CLEAR ?auto_32252 ) ( IS-CRATE ?auto_32253 ) ( not ( = ?auto_32252 ?auto_32253 ) ) ( not ( = ?auto_32241 ?auto_32252 ) ) ( not ( = ?auto_32242 ?auto_32252 ) ) ( not ( = ?auto_32240 ?auto_32252 ) ) ( not ( = ?auto_32248 ?auto_32252 ) ) ( not ( = ?auto_32247 ?auto_32252 ) ) ( not ( = ?auto_32239 ?auto_32252 ) ) ( not ( = ?auto_32245 ?auto_32252 ) ) ( not ( = ?auto_32256 ?auto_32252 ) ) ( AVAILABLE ?auto_32254 ) ( TRUCK-AT ?auto_32255 ?auto_32251 ) ( LIFTING ?auto_32243 ?auto_32253 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32240 ?auto_32241 ?auto_32242 )
      ( MAKE-3CRATE-VERIFY ?auto_32239 ?auto_32240 ?auto_32241 ?auto_32242 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32260 - SURFACE
      ?auto_32261 - SURFACE
      ?auto_32262 - SURFACE
      ?auto_32263 - SURFACE
      ?auto_32264 - SURFACE
    )
    :vars
    (
      ?auto_32275 - HOIST
      ?auto_32268 - PLACE
      ?auto_32273 - PLACE
      ?auto_32265 - HOIST
      ?auto_32270 - SURFACE
      ?auto_32279 - PLACE
      ?auto_32278 - HOIST
      ?auto_32269 - SURFACE
      ?auto_32271 - PLACE
      ?auto_32280 - HOIST
      ?auto_32267 - SURFACE
      ?auto_32266 - PLACE
      ?auto_32272 - HOIST
      ?auto_32277 - SURFACE
      ?auto_32274 - SURFACE
      ?auto_32276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32275 ?auto_32268 ) ( IS-CRATE ?auto_32264 ) ( not ( = ?auto_32263 ?auto_32264 ) ) ( not ( = ?auto_32262 ?auto_32263 ) ) ( not ( = ?auto_32262 ?auto_32264 ) ) ( not ( = ?auto_32273 ?auto_32268 ) ) ( HOIST-AT ?auto_32265 ?auto_32273 ) ( not ( = ?auto_32275 ?auto_32265 ) ) ( SURFACE-AT ?auto_32264 ?auto_32273 ) ( ON ?auto_32264 ?auto_32270 ) ( CLEAR ?auto_32264 ) ( not ( = ?auto_32263 ?auto_32270 ) ) ( not ( = ?auto_32264 ?auto_32270 ) ) ( not ( = ?auto_32262 ?auto_32270 ) ) ( IS-CRATE ?auto_32263 ) ( not ( = ?auto_32279 ?auto_32268 ) ) ( not ( = ?auto_32273 ?auto_32279 ) ) ( HOIST-AT ?auto_32278 ?auto_32279 ) ( not ( = ?auto_32275 ?auto_32278 ) ) ( not ( = ?auto_32265 ?auto_32278 ) ) ( AVAILABLE ?auto_32278 ) ( SURFACE-AT ?auto_32263 ?auto_32279 ) ( ON ?auto_32263 ?auto_32269 ) ( CLEAR ?auto_32263 ) ( not ( = ?auto_32263 ?auto_32269 ) ) ( not ( = ?auto_32264 ?auto_32269 ) ) ( not ( = ?auto_32262 ?auto_32269 ) ) ( not ( = ?auto_32270 ?auto_32269 ) ) ( IS-CRATE ?auto_32262 ) ( not ( = ?auto_32261 ?auto_32262 ) ) ( not ( = ?auto_32263 ?auto_32261 ) ) ( not ( = ?auto_32264 ?auto_32261 ) ) ( not ( = ?auto_32270 ?auto_32261 ) ) ( not ( = ?auto_32269 ?auto_32261 ) ) ( not ( = ?auto_32271 ?auto_32268 ) ) ( not ( = ?auto_32273 ?auto_32271 ) ) ( not ( = ?auto_32279 ?auto_32271 ) ) ( HOIST-AT ?auto_32280 ?auto_32271 ) ( not ( = ?auto_32275 ?auto_32280 ) ) ( not ( = ?auto_32265 ?auto_32280 ) ) ( not ( = ?auto_32278 ?auto_32280 ) ) ( AVAILABLE ?auto_32280 ) ( SURFACE-AT ?auto_32262 ?auto_32271 ) ( ON ?auto_32262 ?auto_32267 ) ( CLEAR ?auto_32262 ) ( not ( = ?auto_32263 ?auto_32267 ) ) ( not ( = ?auto_32264 ?auto_32267 ) ) ( not ( = ?auto_32262 ?auto_32267 ) ) ( not ( = ?auto_32270 ?auto_32267 ) ) ( not ( = ?auto_32269 ?auto_32267 ) ) ( not ( = ?auto_32261 ?auto_32267 ) ) ( IS-CRATE ?auto_32261 ) ( not ( = ?auto_32260 ?auto_32261 ) ) ( not ( = ?auto_32263 ?auto_32260 ) ) ( not ( = ?auto_32264 ?auto_32260 ) ) ( not ( = ?auto_32262 ?auto_32260 ) ) ( not ( = ?auto_32270 ?auto_32260 ) ) ( not ( = ?auto_32269 ?auto_32260 ) ) ( not ( = ?auto_32267 ?auto_32260 ) ) ( not ( = ?auto_32266 ?auto_32268 ) ) ( not ( = ?auto_32273 ?auto_32266 ) ) ( not ( = ?auto_32279 ?auto_32266 ) ) ( not ( = ?auto_32271 ?auto_32266 ) ) ( HOIST-AT ?auto_32272 ?auto_32266 ) ( not ( = ?auto_32275 ?auto_32272 ) ) ( not ( = ?auto_32265 ?auto_32272 ) ) ( not ( = ?auto_32278 ?auto_32272 ) ) ( not ( = ?auto_32280 ?auto_32272 ) ) ( AVAILABLE ?auto_32272 ) ( SURFACE-AT ?auto_32261 ?auto_32266 ) ( ON ?auto_32261 ?auto_32277 ) ( CLEAR ?auto_32261 ) ( not ( = ?auto_32263 ?auto_32277 ) ) ( not ( = ?auto_32264 ?auto_32277 ) ) ( not ( = ?auto_32262 ?auto_32277 ) ) ( not ( = ?auto_32270 ?auto_32277 ) ) ( not ( = ?auto_32269 ?auto_32277 ) ) ( not ( = ?auto_32261 ?auto_32277 ) ) ( not ( = ?auto_32267 ?auto_32277 ) ) ( not ( = ?auto_32260 ?auto_32277 ) ) ( SURFACE-AT ?auto_32274 ?auto_32268 ) ( CLEAR ?auto_32274 ) ( IS-CRATE ?auto_32260 ) ( not ( = ?auto_32274 ?auto_32260 ) ) ( not ( = ?auto_32263 ?auto_32274 ) ) ( not ( = ?auto_32264 ?auto_32274 ) ) ( not ( = ?auto_32262 ?auto_32274 ) ) ( not ( = ?auto_32270 ?auto_32274 ) ) ( not ( = ?auto_32269 ?auto_32274 ) ) ( not ( = ?auto_32261 ?auto_32274 ) ) ( not ( = ?auto_32267 ?auto_32274 ) ) ( not ( = ?auto_32277 ?auto_32274 ) ) ( AVAILABLE ?auto_32275 ) ( TRUCK-AT ?auto_32276 ?auto_32273 ) ( LIFTING ?auto_32265 ?auto_32260 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32262 ?auto_32263 ?auto_32264 )
      ( MAKE-4CRATE-VERIFY ?auto_32260 ?auto_32261 ?auto_32262 ?auto_32263 ?auto_32264 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32281 - SURFACE
      ?auto_32282 - SURFACE
      ?auto_32283 - SURFACE
      ?auto_32284 - SURFACE
      ?auto_32285 - SURFACE
      ?auto_32286 - SURFACE
    )
    :vars
    (
      ?auto_32296 - HOIST
      ?auto_32290 - PLACE
      ?auto_32295 - PLACE
      ?auto_32287 - HOIST
      ?auto_32292 - SURFACE
      ?auto_32300 - PLACE
      ?auto_32299 - HOIST
      ?auto_32291 - SURFACE
      ?auto_32293 - PLACE
      ?auto_32301 - HOIST
      ?auto_32289 - SURFACE
      ?auto_32288 - PLACE
      ?auto_32294 - HOIST
      ?auto_32298 - SURFACE
      ?auto_32297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32296 ?auto_32290 ) ( IS-CRATE ?auto_32286 ) ( not ( = ?auto_32285 ?auto_32286 ) ) ( not ( = ?auto_32284 ?auto_32285 ) ) ( not ( = ?auto_32284 ?auto_32286 ) ) ( not ( = ?auto_32295 ?auto_32290 ) ) ( HOIST-AT ?auto_32287 ?auto_32295 ) ( not ( = ?auto_32296 ?auto_32287 ) ) ( SURFACE-AT ?auto_32286 ?auto_32295 ) ( ON ?auto_32286 ?auto_32292 ) ( CLEAR ?auto_32286 ) ( not ( = ?auto_32285 ?auto_32292 ) ) ( not ( = ?auto_32286 ?auto_32292 ) ) ( not ( = ?auto_32284 ?auto_32292 ) ) ( IS-CRATE ?auto_32285 ) ( not ( = ?auto_32300 ?auto_32290 ) ) ( not ( = ?auto_32295 ?auto_32300 ) ) ( HOIST-AT ?auto_32299 ?auto_32300 ) ( not ( = ?auto_32296 ?auto_32299 ) ) ( not ( = ?auto_32287 ?auto_32299 ) ) ( AVAILABLE ?auto_32299 ) ( SURFACE-AT ?auto_32285 ?auto_32300 ) ( ON ?auto_32285 ?auto_32291 ) ( CLEAR ?auto_32285 ) ( not ( = ?auto_32285 ?auto_32291 ) ) ( not ( = ?auto_32286 ?auto_32291 ) ) ( not ( = ?auto_32284 ?auto_32291 ) ) ( not ( = ?auto_32292 ?auto_32291 ) ) ( IS-CRATE ?auto_32284 ) ( not ( = ?auto_32283 ?auto_32284 ) ) ( not ( = ?auto_32285 ?auto_32283 ) ) ( not ( = ?auto_32286 ?auto_32283 ) ) ( not ( = ?auto_32292 ?auto_32283 ) ) ( not ( = ?auto_32291 ?auto_32283 ) ) ( not ( = ?auto_32293 ?auto_32290 ) ) ( not ( = ?auto_32295 ?auto_32293 ) ) ( not ( = ?auto_32300 ?auto_32293 ) ) ( HOIST-AT ?auto_32301 ?auto_32293 ) ( not ( = ?auto_32296 ?auto_32301 ) ) ( not ( = ?auto_32287 ?auto_32301 ) ) ( not ( = ?auto_32299 ?auto_32301 ) ) ( AVAILABLE ?auto_32301 ) ( SURFACE-AT ?auto_32284 ?auto_32293 ) ( ON ?auto_32284 ?auto_32289 ) ( CLEAR ?auto_32284 ) ( not ( = ?auto_32285 ?auto_32289 ) ) ( not ( = ?auto_32286 ?auto_32289 ) ) ( not ( = ?auto_32284 ?auto_32289 ) ) ( not ( = ?auto_32292 ?auto_32289 ) ) ( not ( = ?auto_32291 ?auto_32289 ) ) ( not ( = ?auto_32283 ?auto_32289 ) ) ( IS-CRATE ?auto_32283 ) ( not ( = ?auto_32282 ?auto_32283 ) ) ( not ( = ?auto_32285 ?auto_32282 ) ) ( not ( = ?auto_32286 ?auto_32282 ) ) ( not ( = ?auto_32284 ?auto_32282 ) ) ( not ( = ?auto_32292 ?auto_32282 ) ) ( not ( = ?auto_32291 ?auto_32282 ) ) ( not ( = ?auto_32289 ?auto_32282 ) ) ( not ( = ?auto_32288 ?auto_32290 ) ) ( not ( = ?auto_32295 ?auto_32288 ) ) ( not ( = ?auto_32300 ?auto_32288 ) ) ( not ( = ?auto_32293 ?auto_32288 ) ) ( HOIST-AT ?auto_32294 ?auto_32288 ) ( not ( = ?auto_32296 ?auto_32294 ) ) ( not ( = ?auto_32287 ?auto_32294 ) ) ( not ( = ?auto_32299 ?auto_32294 ) ) ( not ( = ?auto_32301 ?auto_32294 ) ) ( AVAILABLE ?auto_32294 ) ( SURFACE-AT ?auto_32283 ?auto_32288 ) ( ON ?auto_32283 ?auto_32298 ) ( CLEAR ?auto_32283 ) ( not ( = ?auto_32285 ?auto_32298 ) ) ( not ( = ?auto_32286 ?auto_32298 ) ) ( not ( = ?auto_32284 ?auto_32298 ) ) ( not ( = ?auto_32292 ?auto_32298 ) ) ( not ( = ?auto_32291 ?auto_32298 ) ) ( not ( = ?auto_32283 ?auto_32298 ) ) ( not ( = ?auto_32289 ?auto_32298 ) ) ( not ( = ?auto_32282 ?auto_32298 ) ) ( SURFACE-AT ?auto_32281 ?auto_32290 ) ( CLEAR ?auto_32281 ) ( IS-CRATE ?auto_32282 ) ( not ( = ?auto_32281 ?auto_32282 ) ) ( not ( = ?auto_32285 ?auto_32281 ) ) ( not ( = ?auto_32286 ?auto_32281 ) ) ( not ( = ?auto_32284 ?auto_32281 ) ) ( not ( = ?auto_32292 ?auto_32281 ) ) ( not ( = ?auto_32291 ?auto_32281 ) ) ( not ( = ?auto_32283 ?auto_32281 ) ) ( not ( = ?auto_32289 ?auto_32281 ) ) ( not ( = ?auto_32298 ?auto_32281 ) ) ( AVAILABLE ?auto_32296 ) ( TRUCK-AT ?auto_32297 ?auto_32295 ) ( LIFTING ?auto_32287 ?auto_32282 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32284 ?auto_32285 ?auto_32286 )
      ( MAKE-5CRATE-VERIFY ?auto_32281 ?auto_32282 ?auto_32283 ?auto_32284 ?auto_32285 ?auto_32286 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32302 - SURFACE
      ?auto_32303 - SURFACE
    )
    :vars
    (
      ?auto_32316 - HOIST
      ?auto_32307 - PLACE
      ?auto_32321 - SURFACE
      ?auto_32312 - PLACE
      ?auto_32304 - HOIST
      ?auto_32309 - SURFACE
      ?auto_32320 - PLACE
      ?auto_32319 - HOIST
      ?auto_32308 - SURFACE
      ?auto_32313 - SURFACE
      ?auto_32310 - PLACE
      ?auto_32322 - HOIST
      ?auto_32306 - SURFACE
      ?auto_32315 - SURFACE
      ?auto_32305 - PLACE
      ?auto_32311 - HOIST
      ?auto_32318 - SURFACE
      ?auto_32314 - SURFACE
      ?auto_32317 - TRUCK
      ?auto_32323 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32316 ?auto_32307 ) ( IS-CRATE ?auto_32303 ) ( not ( = ?auto_32302 ?auto_32303 ) ) ( not ( = ?auto_32321 ?auto_32302 ) ) ( not ( = ?auto_32321 ?auto_32303 ) ) ( not ( = ?auto_32312 ?auto_32307 ) ) ( HOIST-AT ?auto_32304 ?auto_32312 ) ( not ( = ?auto_32316 ?auto_32304 ) ) ( SURFACE-AT ?auto_32303 ?auto_32312 ) ( ON ?auto_32303 ?auto_32309 ) ( CLEAR ?auto_32303 ) ( not ( = ?auto_32302 ?auto_32309 ) ) ( not ( = ?auto_32303 ?auto_32309 ) ) ( not ( = ?auto_32321 ?auto_32309 ) ) ( IS-CRATE ?auto_32302 ) ( not ( = ?auto_32320 ?auto_32307 ) ) ( not ( = ?auto_32312 ?auto_32320 ) ) ( HOIST-AT ?auto_32319 ?auto_32320 ) ( not ( = ?auto_32316 ?auto_32319 ) ) ( not ( = ?auto_32304 ?auto_32319 ) ) ( AVAILABLE ?auto_32319 ) ( SURFACE-AT ?auto_32302 ?auto_32320 ) ( ON ?auto_32302 ?auto_32308 ) ( CLEAR ?auto_32302 ) ( not ( = ?auto_32302 ?auto_32308 ) ) ( not ( = ?auto_32303 ?auto_32308 ) ) ( not ( = ?auto_32321 ?auto_32308 ) ) ( not ( = ?auto_32309 ?auto_32308 ) ) ( IS-CRATE ?auto_32321 ) ( not ( = ?auto_32313 ?auto_32321 ) ) ( not ( = ?auto_32302 ?auto_32313 ) ) ( not ( = ?auto_32303 ?auto_32313 ) ) ( not ( = ?auto_32309 ?auto_32313 ) ) ( not ( = ?auto_32308 ?auto_32313 ) ) ( not ( = ?auto_32310 ?auto_32307 ) ) ( not ( = ?auto_32312 ?auto_32310 ) ) ( not ( = ?auto_32320 ?auto_32310 ) ) ( HOIST-AT ?auto_32322 ?auto_32310 ) ( not ( = ?auto_32316 ?auto_32322 ) ) ( not ( = ?auto_32304 ?auto_32322 ) ) ( not ( = ?auto_32319 ?auto_32322 ) ) ( AVAILABLE ?auto_32322 ) ( SURFACE-AT ?auto_32321 ?auto_32310 ) ( ON ?auto_32321 ?auto_32306 ) ( CLEAR ?auto_32321 ) ( not ( = ?auto_32302 ?auto_32306 ) ) ( not ( = ?auto_32303 ?auto_32306 ) ) ( not ( = ?auto_32321 ?auto_32306 ) ) ( not ( = ?auto_32309 ?auto_32306 ) ) ( not ( = ?auto_32308 ?auto_32306 ) ) ( not ( = ?auto_32313 ?auto_32306 ) ) ( IS-CRATE ?auto_32313 ) ( not ( = ?auto_32315 ?auto_32313 ) ) ( not ( = ?auto_32302 ?auto_32315 ) ) ( not ( = ?auto_32303 ?auto_32315 ) ) ( not ( = ?auto_32321 ?auto_32315 ) ) ( not ( = ?auto_32309 ?auto_32315 ) ) ( not ( = ?auto_32308 ?auto_32315 ) ) ( not ( = ?auto_32306 ?auto_32315 ) ) ( not ( = ?auto_32305 ?auto_32307 ) ) ( not ( = ?auto_32312 ?auto_32305 ) ) ( not ( = ?auto_32320 ?auto_32305 ) ) ( not ( = ?auto_32310 ?auto_32305 ) ) ( HOIST-AT ?auto_32311 ?auto_32305 ) ( not ( = ?auto_32316 ?auto_32311 ) ) ( not ( = ?auto_32304 ?auto_32311 ) ) ( not ( = ?auto_32319 ?auto_32311 ) ) ( not ( = ?auto_32322 ?auto_32311 ) ) ( AVAILABLE ?auto_32311 ) ( SURFACE-AT ?auto_32313 ?auto_32305 ) ( ON ?auto_32313 ?auto_32318 ) ( CLEAR ?auto_32313 ) ( not ( = ?auto_32302 ?auto_32318 ) ) ( not ( = ?auto_32303 ?auto_32318 ) ) ( not ( = ?auto_32321 ?auto_32318 ) ) ( not ( = ?auto_32309 ?auto_32318 ) ) ( not ( = ?auto_32308 ?auto_32318 ) ) ( not ( = ?auto_32313 ?auto_32318 ) ) ( not ( = ?auto_32306 ?auto_32318 ) ) ( not ( = ?auto_32315 ?auto_32318 ) ) ( SURFACE-AT ?auto_32314 ?auto_32307 ) ( CLEAR ?auto_32314 ) ( IS-CRATE ?auto_32315 ) ( not ( = ?auto_32314 ?auto_32315 ) ) ( not ( = ?auto_32302 ?auto_32314 ) ) ( not ( = ?auto_32303 ?auto_32314 ) ) ( not ( = ?auto_32321 ?auto_32314 ) ) ( not ( = ?auto_32309 ?auto_32314 ) ) ( not ( = ?auto_32308 ?auto_32314 ) ) ( not ( = ?auto_32313 ?auto_32314 ) ) ( not ( = ?auto_32306 ?auto_32314 ) ) ( not ( = ?auto_32318 ?auto_32314 ) ) ( AVAILABLE ?auto_32316 ) ( TRUCK-AT ?auto_32317 ?auto_32312 ) ( AVAILABLE ?auto_32304 ) ( SURFACE-AT ?auto_32315 ?auto_32312 ) ( ON ?auto_32315 ?auto_32323 ) ( CLEAR ?auto_32315 ) ( not ( = ?auto_32302 ?auto_32323 ) ) ( not ( = ?auto_32303 ?auto_32323 ) ) ( not ( = ?auto_32321 ?auto_32323 ) ) ( not ( = ?auto_32309 ?auto_32323 ) ) ( not ( = ?auto_32308 ?auto_32323 ) ) ( not ( = ?auto_32313 ?auto_32323 ) ) ( not ( = ?auto_32306 ?auto_32323 ) ) ( not ( = ?auto_32315 ?auto_32323 ) ) ( not ( = ?auto_32318 ?auto_32323 ) ) ( not ( = ?auto_32314 ?auto_32323 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32304 ?auto_32315 ?auto_32323 ?auto_32312 )
      ( MAKE-2CRATE ?auto_32321 ?auto_32302 ?auto_32303 )
      ( MAKE-1CRATE-VERIFY ?auto_32302 ?auto_32303 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32324 - SURFACE
      ?auto_32325 - SURFACE
      ?auto_32326 - SURFACE
    )
    :vars
    (
      ?auto_32327 - HOIST
      ?auto_32330 - PLACE
      ?auto_32331 - PLACE
      ?auto_32345 - HOIST
      ?auto_32329 - SURFACE
      ?auto_32334 - PLACE
      ?auto_32344 - HOIST
      ?auto_32336 - SURFACE
      ?auto_32338 - SURFACE
      ?auto_32332 - PLACE
      ?auto_32341 - HOIST
      ?auto_32339 - SURFACE
      ?auto_32337 - SURFACE
      ?auto_32333 - PLACE
      ?auto_32328 - HOIST
      ?auto_32342 - SURFACE
      ?auto_32343 - SURFACE
      ?auto_32340 - TRUCK
      ?auto_32335 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32327 ?auto_32330 ) ( IS-CRATE ?auto_32326 ) ( not ( = ?auto_32325 ?auto_32326 ) ) ( not ( = ?auto_32324 ?auto_32325 ) ) ( not ( = ?auto_32324 ?auto_32326 ) ) ( not ( = ?auto_32331 ?auto_32330 ) ) ( HOIST-AT ?auto_32345 ?auto_32331 ) ( not ( = ?auto_32327 ?auto_32345 ) ) ( SURFACE-AT ?auto_32326 ?auto_32331 ) ( ON ?auto_32326 ?auto_32329 ) ( CLEAR ?auto_32326 ) ( not ( = ?auto_32325 ?auto_32329 ) ) ( not ( = ?auto_32326 ?auto_32329 ) ) ( not ( = ?auto_32324 ?auto_32329 ) ) ( IS-CRATE ?auto_32325 ) ( not ( = ?auto_32334 ?auto_32330 ) ) ( not ( = ?auto_32331 ?auto_32334 ) ) ( HOIST-AT ?auto_32344 ?auto_32334 ) ( not ( = ?auto_32327 ?auto_32344 ) ) ( not ( = ?auto_32345 ?auto_32344 ) ) ( AVAILABLE ?auto_32344 ) ( SURFACE-AT ?auto_32325 ?auto_32334 ) ( ON ?auto_32325 ?auto_32336 ) ( CLEAR ?auto_32325 ) ( not ( = ?auto_32325 ?auto_32336 ) ) ( not ( = ?auto_32326 ?auto_32336 ) ) ( not ( = ?auto_32324 ?auto_32336 ) ) ( not ( = ?auto_32329 ?auto_32336 ) ) ( IS-CRATE ?auto_32324 ) ( not ( = ?auto_32338 ?auto_32324 ) ) ( not ( = ?auto_32325 ?auto_32338 ) ) ( not ( = ?auto_32326 ?auto_32338 ) ) ( not ( = ?auto_32329 ?auto_32338 ) ) ( not ( = ?auto_32336 ?auto_32338 ) ) ( not ( = ?auto_32332 ?auto_32330 ) ) ( not ( = ?auto_32331 ?auto_32332 ) ) ( not ( = ?auto_32334 ?auto_32332 ) ) ( HOIST-AT ?auto_32341 ?auto_32332 ) ( not ( = ?auto_32327 ?auto_32341 ) ) ( not ( = ?auto_32345 ?auto_32341 ) ) ( not ( = ?auto_32344 ?auto_32341 ) ) ( AVAILABLE ?auto_32341 ) ( SURFACE-AT ?auto_32324 ?auto_32332 ) ( ON ?auto_32324 ?auto_32339 ) ( CLEAR ?auto_32324 ) ( not ( = ?auto_32325 ?auto_32339 ) ) ( not ( = ?auto_32326 ?auto_32339 ) ) ( not ( = ?auto_32324 ?auto_32339 ) ) ( not ( = ?auto_32329 ?auto_32339 ) ) ( not ( = ?auto_32336 ?auto_32339 ) ) ( not ( = ?auto_32338 ?auto_32339 ) ) ( IS-CRATE ?auto_32338 ) ( not ( = ?auto_32337 ?auto_32338 ) ) ( not ( = ?auto_32325 ?auto_32337 ) ) ( not ( = ?auto_32326 ?auto_32337 ) ) ( not ( = ?auto_32324 ?auto_32337 ) ) ( not ( = ?auto_32329 ?auto_32337 ) ) ( not ( = ?auto_32336 ?auto_32337 ) ) ( not ( = ?auto_32339 ?auto_32337 ) ) ( not ( = ?auto_32333 ?auto_32330 ) ) ( not ( = ?auto_32331 ?auto_32333 ) ) ( not ( = ?auto_32334 ?auto_32333 ) ) ( not ( = ?auto_32332 ?auto_32333 ) ) ( HOIST-AT ?auto_32328 ?auto_32333 ) ( not ( = ?auto_32327 ?auto_32328 ) ) ( not ( = ?auto_32345 ?auto_32328 ) ) ( not ( = ?auto_32344 ?auto_32328 ) ) ( not ( = ?auto_32341 ?auto_32328 ) ) ( AVAILABLE ?auto_32328 ) ( SURFACE-AT ?auto_32338 ?auto_32333 ) ( ON ?auto_32338 ?auto_32342 ) ( CLEAR ?auto_32338 ) ( not ( = ?auto_32325 ?auto_32342 ) ) ( not ( = ?auto_32326 ?auto_32342 ) ) ( not ( = ?auto_32324 ?auto_32342 ) ) ( not ( = ?auto_32329 ?auto_32342 ) ) ( not ( = ?auto_32336 ?auto_32342 ) ) ( not ( = ?auto_32338 ?auto_32342 ) ) ( not ( = ?auto_32339 ?auto_32342 ) ) ( not ( = ?auto_32337 ?auto_32342 ) ) ( SURFACE-AT ?auto_32343 ?auto_32330 ) ( CLEAR ?auto_32343 ) ( IS-CRATE ?auto_32337 ) ( not ( = ?auto_32343 ?auto_32337 ) ) ( not ( = ?auto_32325 ?auto_32343 ) ) ( not ( = ?auto_32326 ?auto_32343 ) ) ( not ( = ?auto_32324 ?auto_32343 ) ) ( not ( = ?auto_32329 ?auto_32343 ) ) ( not ( = ?auto_32336 ?auto_32343 ) ) ( not ( = ?auto_32338 ?auto_32343 ) ) ( not ( = ?auto_32339 ?auto_32343 ) ) ( not ( = ?auto_32342 ?auto_32343 ) ) ( AVAILABLE ?auto_32327 ) ( TRUCK-AT ?auto_32340 ?auto_32331 ) ( AVAILABLE ?auto_32345 ) ( SURFACE-AT ?auto_32337 ?auto_32331 ) ( ON ?auto_32337 ?auto_32335 ) ( CLEAR ?auto_32337 ) ( not ( = ?auto_32325 ?auto_32335 ) ) ( not ( = ?auto_32326 ?auto_32335 ) ) ( not ( = ?auto_32324 ?auto_32335 ) ) ( not ( = ?auto_32329 ?auto_32335 ) ) ( not ( = ?auto_32336 ?auto_32335 ) ) ( not ( = ?auto_32338 ?auto_32335 ) ) ( not ( = ?auto_32339 ?auto_32335 ) ) ( not ( = ?auto_32337 ?auto_32335 ) ) ( not ( = ?auto_32342 ?auto_32335 ) ) ( not ( = ?auto_32343 ?auto_32335 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32325 ?auto_32326 )
      ( MAKE-2CRATE-VERIFY ?auto_32324 ?auto_32325 ?auto_32326 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32346 - SURFACE
      ?auto_32347 - SURFACE
      ?auto_32348 - SURFACE
      ?auto_32349 - SURFACE
    )
    :vars
    (
      ?auto_32351 - HOIST
      ?auto_32364 - PLACE
      ?auto_32354 - PLACE
      ?auto_32353 - HOIST
      ?auto_32355 - SURFACE
      ?auto_32367 - PLACE
      ?auto_32365 - HOIST
      ?auto_32362 - SURFACE
      ?auto_32350 - PLACE
      ?auto_32366 - HOIST
      ?auto_32360 - SURFACE
      ?auto_32356 - SURFACE
      ?auto_32363 - PLACE
      ?auto_32357 - HOIST
      ?auto_32352 - SURFACE
      ?auto_32358 - SURFACE
      ?auto_32359 - TRUCK
      ?auto_32361 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32351 ?auto_32364 ) ( IS-CRATE ?auto_32349 ) ( not ( = ?auto_32348 ?auto_32349 ) ) ( not ( = ?auto_32347 ?auto_32348 ) ) ( not ( = ?auto_32347 ?auto_32349 ) ) ( not ( = ?auto_32354 ?auto_32364 ) ) ( HOIST-AT ?auto_32353 ?auto_32354 ) ( not ( = ?auto_32351 ?auto_32353 ) ) ( SURFACE-AT ?auto_32349 ?auto_32354 ) ( ON ?auto_32349 ?auto_32355 ) ( CLEAR ?auto_32349 ) ( not ( = ?auto_32348 ?auto_32355 ) ) ( not ( = ?auto_32349 ?auto_32355 ) ) ( not ( = ?auto_32347 ?auto_32355 ) ) ( IS-CRATE ?auto_32348 ) ( not ( = ?auto_32367 ?auto_32364 ) ) ( not ( = ?auto_32354 ?auto_32367 ) ) ( HOIST-AT ?auto_32365 ?auto_32367 ) ( not ( = ?auto_32351 ?auto_32365 ) ) ( not ( = ?auto_32353 ?auto_32365 ) ) ( AVAILABLE ?auto_32365 ) ( SURFACE-AT ?auto_32348 ?auto_32367 ) ( ON ?auto_32348 ?auto_32362 ) ( CLEAR ?auto_32348 ) ( not ( = ?auto_32348 ?auto_32362 ) ) ( not ( = ?auto_32349 ?auto_32362 ) ) ( not ( = ?auto_32347 ?auto_32362 ) ) ( not ( = ?auto_32355 ?auto_32362 ) ) ( IS-CRATE ?auto_32347 ) ( not ( = ?auto_32346 ?auto_32347 ) ) ( not ( = ?auto_32348 ?auto_32346 ) ) ( not ( = ?auto_32349 ?auto_32346 ) ) ( not ( = ?auto_32355 ?auto_32346 ) ) ( not ( = ?auto_32362 ?auto_32346 ) ) ( not ( = ?auto_32350 ?auto_32364 ) ) ( not ( = ?auto_32354 ?auto_32350 ) ) ( not ( = ?auto_32367 ?auto_32350 ) ) ( HOIST-AT ?auto_32366 ?auto_32350 ) ( not ( = ?auto_32351 ?auto_32366 ) ) ( not ( = ?auto_32353 ?auto_32366 ) ) ( not ( = ?auto_32365 ?auto_32366 ) ) ( AVAILABLE ?auto_32366 ) ( SURFACE-AT ?auto_32347 ?auto_32350 ) ( ON ?auto_32347 ?auto_32360 ) ( CLEAR ?auto_32347 ) ( not ( = ?auto_32348 ?auto_32360 ) ) ( not ( = ?auto_32349 ?auto_32360 ) ) ( not ( = ?auto_32347 ?auto_32360 ) ) ( not ( = ?auto_32355 ?auto_32360 ) ) ( not ( = ?auto_32362 ?auto_32360 ) ) ( not ( = ?auto_32346 ?auto_32360 ) ) ( IS-CRATE ?auto_32346 ) ( not ( = ?auto_32356 ?auto_32346 ) ) ( not ( = ?auto_32348 ?auto_32356 ) ) ( not ( = ?auto_32349 ?auto_32356 ) ) ( not ( = ?auto_32347 ?auto_32356 ) ) ( not ( = ?auto_32355 ?auto_32356 ) ) ( not ( = ?auto_32362 ?auto_32356 ) ) ( not ( = ?auto_32360 ?auto_32356 ) ) ( not ( = ?auto_32363 ?auto_32364 ) ) ( not ( = ?auto_32354 ?auto_32363 ) ) ( not ( = ?auto_32367 ?auto_32363 ) ) ( not ( = ?auto_32350 ?auto_32363 ) ) ( HOIST-AT ?auto_32357 ?auto_32363 ) ( not ( = ?auto_32351 ?auto_32357 ) ) ( not ( = ?auto_32353 ?auto_32357 ) ) ( not ( = ?auto_32365 ?auto_32357 ) ) ( not ( = ?auto_32366 ?auto_32357 ) ) ( AVAILABLE ?auto_32357 ) ( SURFACE-AT ?auto_32346 ?auto_32363 ) ( ON ?auto_32346 ?auto_32352 ) ( CLEAR ?auto_32346 ) ( not ( = ?auto_32348 ?auto_32352 ) ) ( not ( = ?auto_32349 ?auto_32352 ) ) ( not ( = ?auto_32347 ?auto_32352 ) ) ( not ( = ?auto_32355 ?auto_32352 ) ) ( not ( = ?auto_32362 ?auto_32352 ) ) ( not ( = ?auto_32346 ?auto_32352 ) ) ( not ( = ?auto_32360 ?auto_32352 ) ) ( not ( = ?auto_32356 ?auto_32352 ) ) ( SURFACE-AT ?auto_32358 ?auto_32364 ) ( CLEAR ?auto_32358 ) ( IS-CRATE ?auto_32356 ) ( not ( = ?auto_32358 ?auto_32356 ) ) ( not ( = ?auto_32348 ?auto_32358 ) ) ( not ( = ?auto_32349 ?auto_32358 ) ) ( not ( = ?auto_32347 ?auto_32358 ) ) ( not ( = ?auto_32355 ?auto_32358 ) ) ( not ( = ?auto_32362 ?auto_32358 ) ) ( not ( = ?auto_32346 ?auto_32358 ) ) ( not ( = ?auto_32360 ?auto_32358 ) ) ( not ( = ?auto_32352 ?auto_32358 ) ) ( AVAILABLE ?auto_32351 ) ( TRUCK-AT ?auto_32359 ?auto_32354 ) ( AVAILABLE ?auto_32353 ) ( SURFACE-AT ?auto_32356 ?auto_32354 ) ( ON ?auto_32356 ?auto_32361 ) ( CLEAR ?auto_32356 ) ( not ( = ?auto_32348 ?auto_32361 ) ) ( not ( = ?auto_32349 ?auto_32361 ) ) ( not ( = ?auto_32347 ?auto_32361 ) ) ( not ( = ?auto_32355 ?auto_32361 ) ) ( not ( = ?auto_32362 ?auto_32361 ) ) ( not ( = ?auto_32346 ?auto_32361 ) ) ( not ( = ?auto_32360 ?auto_32361 ) ) ( not ( = ?auto_32356 ?auto_32361 ) ) ( not ( = ?auto_32352 ?auto_32361 ) ) ( not ( = ?auto_32358 ?auto_32361 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32347 ?auto_32348 ?auto_32349 )
      ( MAKE-3CRATE-VERIFY ?auto_32346 ?auto_32347 ?auto_32348 ?auto_32349 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32368 - SURFACE
      ?auto_32369 - SURFACE
      ?auto_32370 - SURFACE
      ?auto_32371 - SURFACE
      ?auto_32372 - SURFACE
    )
    :vars
    (
      ?auto_32374 - HOIST
      ?auto_32386 - PLACE
      ?auto_32377 - PLACE
      ?auto_32376 - HOIST
      ?auto_32378 - SURFACE
      ?auto_32389 - PLACE
      ?auto_32387 - HOIST
      ?auto_32384 - SURFACE
      ?auto_32373 - PLACE
      ?auto_32388 - HOIST
      ?auto_32382 - SURFACE
      ?auto_32385 - PLACE
      ?auto_32379 - HOIST
      ?auto_32375 - SURFACE
      ?auto_32380 - SURFACE
      ?auto_32381 - TRUCK
      ?auto_32383 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32374 ?auto_32386 ) ( IS-CRATE ?auto_32372 ) ( not ( = ?auto_32371 ?auto_32372 ) ) ( not ( = ?auto_32370 ?auto_32371 ) ) ( not ( = ?auto_32370 ?auto_32372 ) ) ( not ( = ?auto_32377 ?auto_32386 ) ) ( HOIST-AT ?auto_32376 ?auto_32377 ) ( not ( = ?auto_32374 ?auto_32376 ) ) ( SURFACE-AT ?auto_32372 ?auto_32377 ) ( ON ?auto_32372 ?auto_32378 ) ( CLEAR ?auto_32372 ) ( not ( = ?auto_32371 ?auto_32378 ) ) ( not ( = ?auto_32372 ?auto_32378 ) ) ( not ( = ?auto_32370 ?auto_32378 ) ) ( IS-CRATE ?auto_32371 ) ( not ( = ?auto_32389 ?auto_32386 ) ) ( not ( = ?auto_32377 ?auto_32389 ) ) ( HOIST-AT ?auto_32387 ?auto_32389 ) ( not ( = ?auto_32374 ?auto_32387 ) ) ( not ( = ?auto_32376 ?auto_32387 ) ) ( AVAILABLE ?auto_32387 ) ( SURFACE-AT ?auto_32371 ?auto_32389 ) ( ON ?auto_32371 ?auto_32384 ) ( CLEAR ?auto_32371 ) ( not ( = ?auto_32371 ?auto_32384 ) ) ( not ( = ?auto_32372 ?auto_32384 ) ) ( not ( = ?auto_32370 ?auto_32384 ) ) ( not ( = ?auto_32378 ?auto_32384 ) ) ( IS-CRATE ?auto_32370 ) ( not ( = ?auto_32369 ?auto_32370 ) ) ( not ( = ?auto_32371 ?auto_32369 ) ) ( not ( = ?auto_32372 ?auto_32369 ) ) ( not ( = ?auto_32378 ?auto_32369 ) ) ( not ( = ?auto_32384 ?auto_32369 ) ) ( not ( = ?auto_32373 ?auto_32386 ) ) ( not ( = ?auto_32377 ?auto_32373 ) ) ( not ( = ?auto_32389 ?auto_32373 ) ) ( HOIST-AT ?auto_32388 ?auto_32373 ) ( not ( = ?auto_32374 ?auto_32388 ) ) ( not ( = ?auto_32376 ?auto_32388 ) ) ( not ( = ?auto_32387 ?auto_32388 ) ) ( AVAILABLE ?auto_32388 ) ( SURFACE-AT ?auto_32370 ?auto_32373 ) ( ON ?auto_32370 ?auto_32382 ) ( CLEAR ?auto_32370 ) ( not ( = ?auto_32371 ?auto_32382 ) ) ( not ( = ?auto_32372 ?auto_32382 ) ) ( not ( = ?auto_32370 ?auto_32382 ) ) ( not ( = ?auto_32378 ?auto_32382 ) ) ( not ( = ?auto_32384 ?auto_32382 ) ) ( not ( = ?auto_32369 ?auto_32382 ) ) ( IS-CRATE ?auto_32369 ) ( not ( = ?auto_32368 ?auto_32369 ) ) ( not ( = ?auto_32371 ?auto_32368 ) ) ( not ( = ?auto_32372 ?auto_32368 ) ) ( not ( = ?auto_32370 ?auto_32368 ) ) ( not ( = ?auto_32378 ?auto_32368 ) ) ( not ( = ?auto_32384 ?auto_32368 ) ) ( not ( = ?auto_32382 ?auto_32368 ) ) ( not ( = ?auto_32385 ?auto_32386 ) ) ( not ( = ?auto_32377 ?auto_32385 ) ) ( not ( = ?auto_32389 ?auto_32385 ) ) ( not ( = ?auto_32373 ?auto_32385 ) ) ( HOIST-AT ?auto_32379 ?auto_32385 ) ( not ( = ?auto_32374 ?auto_32379 ) ) ( not ( = ?auto_32376 ?auto_32379 ) ) ( not ( = ?auto_32387 ?auto_32379 ) ) ( not ( = ?auto_32388 ?auto_32379 ) ) ( AVAILABLE ?auto_32379 ) ( SURFACE-AT ?auto_32369 ?auto_32385 ) ( ON ?auto_32369 ?auto_32375 ) ( CLEAR ?auto_32369 ) ( not ( = ?auto_32371 ?auto_32375 ) ) ( not ( = ?auto_32372 ?auto_32375 ) ) ( not ( = ?auto_32370 ?auto_32375 ) ) ( not ( = ?auto_32378 ?auto_32375 ) ) ( not ( = ?auto_32384 ?auto_32375 ) ) ( not ( = ?auto_32369 ?auto_32375 ) ) ( not ( = ?auto_32382 ?auto_32375 ) ) ( not ( = ?auto_32368 ?auto_32375 ) ) ( SURFACE-AT ?auto_32380 ?auto_32386 ) ( CLEAR ?auto_32380 ) ( IS-CRATE ?auto_32368 ) ( not ( = ?auto_32380 ?auto_32368 ) ) ( not ( = ?auto_32371 ?auto_32380 ) ) ( not ( = ?auto_32372 ?auto_32380 ) ) ( not ( = ?auto_32370 ?auto_32380 ) ) ( not ( = ?auto_32378 ?auto_32380 ) ) ( not ( = ?auto_32384 ?auto_32380 ) ) ( not ( = ?auto_32369 ?auto_32380 ) ) ( not ( = ?auto_32382 ?auto_32380 ) ) ( not ( = ?auto_32375 ?auto_32380 ) ) ( AVAILABLE ?auto_32374 ) ( TRUCK-AT ?auto_32381 ?auto_32377 ) ( AVAILABLE ?auto_32376 ) ( SURFACE-AT ?auto_32368 ?auto_32377 ) ( ON ?auto_32368 ?auto_32383 ) ( CLEAR ?auto_32368 ) ( not ( = ?auto_32371 ?auto_32383 ) ) ( not ( = ?auto_32372 ?auto_32383 ) ) ( not ( = ?auto_32370 ?auto_32383 ) ) ( not ( = ?auto_32378 ?auto_32383 ) ) ( not ( = ?auto_32384 ?auto_32383 ) ) ( not ( = ?auto_32369 ?auto_32383 ) ) ( not ( = ?auto_32382 ?auto_32383 ) ) ( not ( = ?auto_32368 ?auto_32383 ) ) ( not ( = ?auto_32375 ?auto_32383 ) ) ( not ( = ?auto_32380 ?auto_32383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32370 ?auto_32371 ?auto_32372 )
      ( MAKE-4CRATE-VERIFY ?auto_32368 ?auto_32369 ?auto_32370 ?auto_32371 ?auto_32372 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32390 - SURFACE
      ?auto_32391 - SURFACE
      ?auto_32392 - SURFACE
      ?auto_32393 - SURFACE
      ?auto_32394 - SURFACE
      ?auto_32395 - SURFACE
    )
    :vars
    (
      ?auto_32397 - HOIST
      ?auto_32408 - PLACE
      ?auto_32400 - PLACE
      ?auto_32399 - HOIST
      ?auto_32401 - SURFACE
      ?auto_32411 - PLACE
      ?auto_32409 - HOIST
      ?auto_32406 - SURFACE
      ?auto_32396 - PLACE
      ?auto_32410 - HOIST
      ?auto_32404 - SURFACE
      ?auto_32407 - PLACE
      ?auto_32402 - HOIST
      ?auto_32398 - SURFACE
      ?auto_32403 - TRUCK
      ?auto_32405 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32397 ?auto_32408 ) ( IS-CRATE ?auto_32395 ) ( not ( = ?auto_32394 ?auto_32395 ) ) ( not ( = ?auto_32393 ?auto_32394 ) ) ( not ( = ?auto_32393 ?auto_32395 ) ) ( not ( = ?auto_32400 ?auto_32408 ) ) ( HOIST-AT ?auto_32399 ?auto_32400 ) ( not ( = ?auto_32397 ?auto_32399 ) ) ( SURFACE-AT ?auto_32395 ?auto_32400 ) ( ON ?auto_32395 ?auto_32401 ) ( CLEAR ?auto_32395 ) ( not ( = ?auto_32394 ?auto_32401 ) ) ( not ( = ?auto_32395 ?auto_32401 ) ) ( not ( = ?auto_32393 ?auto_32401 ) ) ( IS-CRATE ?auto_32394 ) ( not ( = ?auto_32411 ?auto_32408 ) ) ( not ( = ?auto_32400 ?auto_32411 ) ) ( HOIST-AT ?auto_32409 ?auto_32411 ) ( not ( = ?auto_32397 ?auto_32409 ) ) ( not ( = ?auto_32399 ?auto_32409 ) ) ( AVAILABLE ?auto_32409 ) ( SURFACE-AT ?auto_32394 ?auto_32411 ) ( ON ?auto_32394 ?auto_32406 ) ( CLEAR ?auto_32394 ) ( not ( = ?auto_32394 ?auto_32406 ) ) ( not ( = ?auto_32395 ?auto_32406 ) ) ( not ( = ?auto_32393 ?auto_32406 ) ) ( not ( = ?auto_32401 ?auto_32406 ) ) ( IS-CRATE ?auto_32393 ) ( not ( = ?auto_32392 ?auto_32393 ) ) ( not ( = ?auto_32394 ?auto_32392 ) ) ( not ( = ?auto_32395 ?auto_32392 ) ) ( not ( = ?auto_32401 ?auto_32392 ) ) ( not ( = ?auto_32406 ?auto_32392 ) ) ( not ( = ?auto_32396 ?auto_32408 ) ) ( not ( = ?auto_32400 ?auto_32396 ) ) ( not ( = ?auto_32411 ?auto_32396 ) ) ( HOIST-AT ?auto_32410 ?auto_32396 ) ( not ( = ?auto_32397 ?auto_32410 ) ) ( not ( = ?auto_32399 ?auto_32410 ) ) ( not ( = ?auto_32409 ?auto_32410 ) ) ( AVAILABLE ?auto_32410 ) ( SURFACE-AT ?auto_32393 ?auto_32396 ) ( ON ?auto_32393 ?auto_32404 ) ( CLEAR ?auto_32393 ) ( not ( = ?auto_32394 ?auto_32404 ) ) ( not ( = ?auto_32395 ?auto_32404 ) ) ( not ( = ?auto_32393 ?auto_32404 ) ) ( not ( = ?auto_32401 ?auto_32404 ) ) ( not ( = ?auto_32406 ?auto_32404 ) ) ( not ( = ?auto_32392 ?auto_32404 ) ) ( IS-CRATE ?auto_32392 ) ( not ( = ?auto_32391 ?auto_32392 ) ) ( not ( = ?auto_32394 ?auto_32391 ) ) ( not ( = ?auto_32395 ?auto_32391 ) ) ( not ( = ?auto_32393 ?auto_32391 ) ) ( not ( = ?auto_32401 ?auto_32391 ) ) ( not ( = ?auto_32406 ?auto_32391 ) ) ( not ( = ?auto_32404 ?auto_32391 ) ) ( not ( = ?auto_32407 ?auto_32408 ) ) ( not ( = ?auto_32400 ?auto_32407 ) ) ( not ( = ?auto_32411 ?auto_32407 ) ) ( not ( = ?auto_32396 ?auto_32407 ) ) ( HOIST-AT ?auto_32402 ?auto_32407 ) ( not ( = ?auto_32397 ?auto_32402 ) ) ( not ( = ?auto_32399 ?auto_32402 ) ) ( not ( = ?auto_32409 ?auto_32402 ) ) ( not ( = ?auto_32410 ?auto_32402 ) ) ( AVAILABLE ?auto_32402 ) ( SURFACE-AT ?auto_32392 ?auto_32407 ) ( ON ?auto_32392 ?auto_32398 ) ( CLEAR ?auto_32392 ) ( not ( = ?auto_32394 ?auto_32398 ) ) ( not ( = ?auto_32395 ?auto_32398 ) ) ( not ( = ?auto_32393 ?auto_32398 ) ) ( not ( = ?auto_32401 ?auto_32398 ) ) ( not ( = ?auto_32406 ?auto_32398 ) ) ( not ( = ?auto_32392 ?auto_32398 ) ) ( not ( = ?auto_32404 ?auto_32398 ) ) ( not ( = ?auto_32391 ?auto_32398 ) ) ( SURFACE-AT ?auto_32390 ?auto_32408 ) ( CLEAR ?auto_32390 ) ( IS-CRATE ?auto_32391 ) ( not ( = ?auto_32390 ?auto_32391 ) ) ( not ( = ?auto_32394 ?auto_32390 ) ) ( not ( = ?auto_32395 ?auto_32390 ) ) ( not ( = ?auto_32393 ?auto_32390 ) ) ( not ( = ?auto_32401 ?auto_32390 ) ) ( not ( = ?auto_32406 ?auto_32390 ) ) ( not ( = ?auto_32392 ?auto_32390 ) ) ( not ( = ?auto_32404 ?auto_32390 ) ) ( not ( = ?auto_32398 ?auto_32390 ) ) ( AVAILABLE ?auto_32397 ) ( TRUCK-AT ?auto_32403 ?auto_32400 ) ( AVAILABLE ?auto_32399 ) ( SURFACE-AT ?auto_32391 ?auto_32400 ) ( ON ?auto_32391 ?auto_32405 ) ( CLEAR ?auto_32391 ) ( not ( = ?auto_32394 ?auto_32405 ) ) ( not ( = ?auto_32395 ?auto_32405 ) ) ( not ( = ?auto_32393 ?auto_32405 ) ) ( not ( = ?auto_32401 ?auto_32405 ) ) ( not ( = ?auto_32406 ?auto_32405 ) ) ( not ( = ?auto_32392 ?auto_32405 ) ) ( not ( = ?auto_32404 ?auto_32405 ) ) ( not ( = ?auto_32391 ?auto_32405 ) ) ( not ( = ?auto_32398 ?auto_32405 ) ) ( not ( = ?auto_32390 ?auto_32405 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32393 ?auto_32394 ?auto_32395 )
      ( MAKE-5CRATE-VERIFY ?auto_32390 ?auto_32391 ?auto_32392 ?auto_32393 ?auto_32394 ?auto_32395 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32412 - SURFACE
      ?auto_32413 - SURFACE
    )
    :vars
    (
      ?auto_32415 - HOIST
      ?auto_32430 - PLACE
      ?auto_32425 - SURFACE
      ?auto_32418 - PLACE
      ?auto_32417 - HOIST
      ?auto_32419 - SURFACE
      ?auto_32433 - PLACE
      ?auto_32431 - HOIST
      ?auto_32428 - SURFACE
      ?auto_32424 - SURFACE
      ?auto_32414 - PLACE
      ?auto_32432 - HOIST
      ?auto_32426 - SURFACE
      ?auto_32420 - SURFACE
      ?auto_32429 - PLACE
      ?auto_32421 - HOIST
      ?auto_32416 - SURFACE
      ?auto_32422 - SURFACE
      ?auto_32427 - SURFACE
      ?auto_32423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32415 ?auto_32430 ) ( IS-CRATE ?auto_32413 ) ( not ( = ?auto_32412 ?auto_32413 ) ) ( not ( = ?auto_32425 ?auto_32412 ) ) ( not ( = ?auto_32425 ?auto_32413 ) ) ( not ( = ?auto_32418 ?auto_32430 ) ) ( HOIST-AT ?auto_32417 ?auto_32418 ) ( not ( = ?auto_32415 ?auto_32417 ) ) ( SURFACE-AT ?auto_32413 ?auto_32418 ) ( ON ?auto_32413 ?auto_32419 ) ( CLEAR ?auto_32413 ) ( not ( = ?auto_32412 ?auto_32419 ) ) ( not ( = ?auto_32413 ?auto_32419 ) ) ( not ( = ?auto_32425 ?auto_32419 ) ) ( IS-CRATE ?auto_32412 ) ( not ( = ?auto_32433 ?auto_32430 ) ) ( not ( = ?auto_32418 ?auto_32433 ) ) ( HOIST-AT ?auto_32431 ?auto_32433 ) ( not ( = ?auto_32415 ?auto_32431 ) ) ( not ( = ?auto_32417 ?auto_32431 ) ) ( AVAILABLE ?auto_32431 ) ( SURFACE-AT ?auto_32412 ?auto_32433 ) ( ON ?auto_32412 ?auto_32428 ) ( CLEAR ?auto_32412 ) ( not ( = ?auto_32412 ?auto_32428 ) ) ( not ( = ?auto_32413 ?auto_32428 ) ) ( not ( = ?auto_32425 ?auto_32428 ) ) ( not ( = ?auto_32419 ?auto_32428 ) ) ( IS-CRATE ?auto_32425 ) ( not ( = ?auto_32424 ?auto_32425 ) ) ( not ( = ?auto_32412 ?auto_32424 ) ) ( not ( = ?auto_32413 ?auto_32424 ) ) ( not ( = ?auto_32419 ?auto_32424 ) ) ( not ( = ?auto_32428 ?auto_32424 ) ) ( not ( = ?auto_32414 ?auto_32430 ) ) ( not ( = ?auto_32418 ?auto_32414 ) ) ( not ( = ?auto_32433 ?auto_32414 ) ) ( HOIST-AT ?auto_32432 ?auto_32414 ) ( not ( = ?auto_32415 ?auto_32432 ) ) ( not ( = ?auto_32417 ?auto_32432 ) ) ( not ( = ?auto_32431 ?auto_32432 ) ) ( AVAILABLE ?auto_32432 ) ( SURFACE-AT ?auto_32425 ?auto_32414 ) ( ON ?auto_32425 ?auto_32426 ) ( CLEAR ?auto_32425 ) ( not ( = ?auto_32412 ?auto_32426 ) ) ( not ( = ?auto_32413 ?auto_32426 ) ) ( not ( = ?auto_32425 ?auto_32426 ) ) ( not ( = ?auto_32419 ?auto_32426 ) ) ( not ( = ?auto_32428 ?auto_32426 ) ) ( not ( = ?auto_32424 ?auto_32426 ) ) ( IS-CRATE ?auto_32424 ) ( not ( = ?auto_32420 ?auto_32424 ) ) ( not ( = ?auto_32412 ?auto_32420 ) ) ( not ( = ?auto_32413 ?auto_32420 ) ) ( not ( = ?auto_32425 ?auto_32420 ) ) ( not ( = ?auto_32419 ?auto_32420 ) ) ( not ( = ?auto_32428 ?auto_32420 ) ) ( not ( = ?auto_32426 ?auto_32420 ) ) ( not ( = ?auto_32429 ?auto_32430 ) ) ( not ( = ?auto_32418 ?auto_32429 ) ) ( not ( = ?auto_32433 ?auto_32429 ) ) ( not ( = ?auto_32414 ?auto_32429 ) ) ( HOIST-AT ?auto_32421 ?auto_32429 ) ( not ( = ?auto_32415 ?auto_32421 ) ) ( not ( = ?auto_32417 ?auto_32421 ) ) ( not ( = ?auto_32431 ?auto_32421 ) ) ( not ( = ?auto_32432 ?auto_32421 ) ) ( AVAILABLE ?auto_32421 ) ( SURFACE-AT ?auto_32424 ?auto_32429 ) ( ON ?auto_32424 ?auto_32416 ) ( CLEAR ?auto_32424 ) ( not ( = ?auto_32412 ?auto_32416 ) ) ( not ( = ?auto_32413 ?auto_32416 ) ) ( not ( = ?auto_32425 ?auto_32416 ) ) ( not ( = ?auto_32419 ?auto_32416 ) ) ( not ( = ?auto_32428 ?auto_32416 ) ) ( not ( = ?auto_32424 ?auto_32416 ) ) ( not ( = ?auto_32426 ?auto_32416 ) ) ( not ( = ?auto_32420 ?auto_32416 ) ) ( SURFACE-AT ?auto_32422 ?auto_32430 ) ( CLEAR ?auto_32422 ) ( IS-CRATE ?auto_32420 ) ( not ( = ?auto_32422 ?auto_32420 ) ) ( not ( = ?auto_32412 ?auto_32422 ) ) ( not ( = ?auto_32413 ?auto_32422 ) ) ( not ( = ?auto_32425 ?auto_32422 ) ) ( not ( = ?auto_32419 ?auto_32422 ) ) ( not ( = ?auto_32428 ?auto_32422 ) ) ( not ( = ?auto_32424 ?auto_32422 ) ) ( not ( = ?auto_32426 ?auto_32422 ) ) ( not ( = ?auto_32416 ?auto_32422 ) ) ( AVAILABLE ?auto_32415 ) ( AVAILABLE ?auto_32417 ) ( SURFACE-AT ?auto_32420 ?auto_32418 ) ( ON ?auto_32420 ?auto_32427 ) ( CLEAR ?auto_32420 ) ( not ( = ?auto_32412 ?auto_32427 ) ) ( not ( = ?auto_32413 ?auto_32427 ) ) ( not ( = ?auto_32425 ?auto_32427 ) ) ( not ( = ?auto_32419 ?auto_32427 ) ) ( not ( = ?auto_32428 ?auto_32427 ) ) ( not ( = ?auto_32424 ?auto_32427 ) ) ( not ( = ?auto_32426 ?auto_32427 ) ) ( not ( = ?auto_32420 ?auto_32427 ) ) ( not ( = ?auto_32416 ?auto_32427 ) ) ( not ( = ?auto_32422 ?auto_32427 ) ) ( TRUCK-AT ?auto_32423 ?auto_32430 ) )
    :subtasks
    ( ( !DRIVE ?auto_32423 ?auto_32430 ?auto_32418 )
      ( MAKE-2CRATE ?auto_32425 ?auto_32412 ?auto_32413 )
      ( MAKE-1CRATE-VERIFY ?auto_32412 ?auto_32413 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32434 - SURFACE
      ?auto_32435 - SURFACE
      ?auto_32436 - SURFACE
    )
    :vars
    (
      ?auto_32452 - HOIST
      ?auto_32454 - PLACE
      ?auto_32440 - PLACE
      ?auto_32449 - HOIST
      ?auto_32447 - SURFACE
      ?auto_32445 - PLACE
      ?auto_32439 - HOIST
      ?auto_32455 - SURFACE
      ?auto_32443 - SURFACE
      ?auto_32453 - PLACE
      ?auto_32442 - HOIST
      ?auto_32451 - SURFACE
      ?auto_32448 - SURFACE
      ?auto_32444 - PLACE
      ?auto_32437 - HOIST
      ?auto_32446 - SURFACE
      ?auto_32450 - SURFACE
      ?auto_32441 - SURFACE
      ?auto_32438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32452 ?auto_32454 ) ( IS-CRATE ?auto_32436 ) ( not ( = ?auto_32435 ?auto_32436 ) ) ( not ( = ?auto_32434 ?auto_32435 ) ) ( not ( = ?auto_32434 ?auto_32436 ) ) ( not ( = ?auto_32440 ?auto_32454 ) ) ( HOIST-AT ?auto_32449 ?auto_32440 ) ( not ( = ?auto_32452 ?auto_32449 ) ) ( SURFACE-AT ?auto_32436 ?auto_32440 ) ( ON ?auto_32436 ?auto_32447 ) ( CLEAR ?auto_32436 ) ( not ( = ?auto_32435 ?auto_32447 ) ) ( not ( = ?auto_32436 ?auto_32447 ) ) ( not ( = ?auto_32434 ?auto_32447 ) ) ( IS-CRATE ?auto_32435 ) ( not ( = ?auto_32445 ?auto_32454 ) ) ( not ( = ?auto_32440 ?auto_32445 ) ) ( HOIST-AT ?auto_32439 ?auto_32445 ) ( not ( = ?auto_32452 ?auto_32439 ) ) ( not ( = ?auto_32449 ?auto_32439 ) ) ( AVAILABLE ?auto_32439 ) ( SURFACE-AT ?auto_32435 ?auto_32445 ) ( ON ?auto_32435 ?auto_32455 ) ( CLEAR ?auto_32435 ) ( not ( = ?auto_32435 ?auto_32455 ) ) ( not ( = ?auto_32436 ?auto_32455 ) ) ( not ( = ?auto_32434 ?auto_32455 ) ) ( not ( = ?auto_32447 ?auto_32455 ) ) ( IS-CRATE ?auto_32434 ) ( not ( = ?auto_32443 ?auto_32434 ) ) ( not ( = ?auto_32435 ?auto_32443 ) ) ( not ( = ?auto_32436 ?auto_32443 ) ) ( not ( = ?auto_32447 ?auto_32443 ) ) ( not ( = ?auto_32455 ?auto_32443 ) ) ( not ( = ?auto_32453 ?auto_32454 ) ) ( not ( = ?auto_32440 ?auto_32453 ) ) ( not ( = ?auto_32445 ?auto_32453 ) ) ( HOIST-AT ?auto_32442 ?auto_32453 ) ( not ( = ?auto_32452 ?auto_32442 ) ) ( not ( = ?auto_32449 ?auto_32442 ) ) ( not ( = ?auto_32439 ?auto_32442 ) ) ( AVAILABLE ?auto_32442 ) ( SURFACE-AT ?auto_32434 ?auto_32453 ) ( ON ?auto_32434 ?auto_32451 ) ( CLEAR ?auto_32434 ) ( not ( = ?auto_32435 ?auto_32451 ) ) ( not ( = ?auto_32436 ?auto_32451 ) ) ( not ( = ?auto_32434 ?auto_32451 ) ) ( not ( = ?auto_32447 ?auto_32451 ) ) ( not ( = ?auto_32455 ?auto_32451 ) ) ( not ( = ?auto_32443 ?auto_32451 ) ) ( IS-CRATE ?auto_32443 ) ( not ( = ?auto_32448 ?auto_32443 ) ) ( not ( = ?auto_32435 ?auto_32448 ) ) ( not ( = ?auto_32436 ?auto_32448 ) ) ( not ( = ?auto_32434 ?auto_32448 ) ) ( not ( = ?auto_32447 ?auto_32448 ) ) ( not ( = ?auto_32455 ?auto_32448 ) ) ( not ( = ?auto_32451 ?auto_32448 ) ) ( not ( = ?auto_32444 ?auto_32454 ) ) ( not ( = ?auto_32440 ?auto_32444 ) ) ( not ( = ?auto_32445 ?auto_32444 ) ) ( not ( = ?auto_32453 ?auto_32444 ) ) ( HOIST-AT ?auto_32437 ?auto_32444 ) ( not ( = ?auto_32452 ?auto_32437 ) ) ( not ( = ?auto_32449 ?auto_32437 ) ) ( not ( = ?auto_32439 ?auto_32437 ) ) ( not ( = ?auto_32442 ?auto_32437 ) ) ( AVAILABLE ?auto_32437 ) ( SURFACE-AT ?auto_32443 ?auto_32444 ) ( ON ?auto_32443 ?auto_32446 ) ( CLEAR ?auto_32443 ) ( not ( = ?auto_32435 ?auto_32446 ) ) ( not ( = ?auto_32436 ?auto_32446 ) ) ( not ( = ?auto_32434 ?auto_32446 ) ) ( not ( = ?auto_32447 ?auto_32446 ) ) ( not ( = ?auto_32455 ?auto_32446 ) ) ( not ( = ?auto_32443 ?auto_32446 ) ) ( not ( = ?auto_32451 ?auto_32446 ) ) ( not ( = ?auto_32448 ?auto_32446 ) ) ( SURFACE-AT ?auto_32450 ?auto_32454 ) ( CLEAR ?auto_32450 ) ( IS-CRATE ?auto_32448 ) ( not ( = ?auto_32450 ?auto_32448 ) ) ( not ( = ?auto_32435 ?auto_32450 ) ) ( not ( = ?auto_32436 ?auto_32450 ) ) ( not ( = ?auto_32434 ?auto_32450 ) ) ( not ( = ?auto_32447 ?auto_32450 ) ) ( not ( = ?auto_32455 ?auto_32450 ) ) ( not ( = ?auto_32443 ?auto_32450 ) ) ( not ( = ?auto_32451 ?auto_32450 ) ) ( not ( = ?auto_32446 ?auto_32450 ) ) ( AVAILABLE ?auto_32452 ) ( AVAILABLE ?auto_32449 ) ( SURFACE-AT ?auto_32448 ?auto_32440 ) ( ON ?auto_32448 ?auto_32441 ) ( CLEAR ?auto_32448 ) ( not ( = ?auto_32435 ?auto_32441 ) ) ( not ( = ?auto_32436 ?auto_32441 ) ) ( not ( = ?auto_32434 ?auto_32441 ) ) ( not ( = ?auto_32447 ?auto_32441 ) ) ( not ( = ?auto_32455 ?auto_32441 ) ) ( not ( = ?auto_32443 ?auto_32441 ) ) ( not ( = ?auto_32451 ?auto_32441 ) ) ( not ( = ?auto_32448 ?auto_32441 ) ) ( not ( = ?auto_32446 ?auto_32441 ) ) ( not ( = ?auto_32450 ?auto_32441 ) ) ( TRUCK-AT ?auto_32438 ?auto_32454 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32435 ?auto_32436 )
      ( MAKE-2CRATE-VERIFY ?auto_32434 ?auto_32435 ?auto_32436 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32456 - SURFACE
      ?auto_32457 - SURFACE
      ?auto_32458 - SURFACE
      ?auto_32459 - SURFACE
    )
    :vars
    (
      ?auto_32460 - HOIST
      ?auto_32467 - PLACE
      ?auto_32477 - PLACE
      ?auto_32472 - HOIST
      ?auto_32471 - SURFACE
      ?auto_32462 - PLACE
      ?auto_32461 - HOIST
      ?auto_32473 - SURFACE
      ?auto_32476 - PLACE
      ?auto_32464 - HOIST
      ?auto_32465 - SURFACE
      ?auto_32470 - SURFACE
      ?auto_32466 - PLACE
      ?auto_32475 - HOIST
      ?auto_32463 - SURFACE
      ?auto_32469 - SURFACE
      ?auto_32468 - SURFACE
      ?auto_32474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32460 ?auto_32467 ) ( IS-CRATE ?auto_32459 ) ( not ( = ?auto_32458 ?auto_32459 ) ) ( not ( = ?auto_32457 ?auto_32458 ) ) ( not ( = ?auto_32457 ?auto_32459 ) ) ( not ( = ?auto_32477 ?auto_32467 ) ) ( HOIST-AT ?auto_32472 ?auto_32477 ) ( not ( = ?auto_32460 ?auto_32472 ) ) ( SURFACE-AT ?auto_32459 ?auto_32477 ) ( ON ?auto_32459 ?auto_32471 ) ( CLEAR ?auto_32459 ) ( not ( = ?auto_32458 ?auto_32471 ) ) ( not ( = ?auto_32459 ?auto_32471 ) ) ( not ( = ?auto_32457 ?auto_32471 ) ) ( IS-CRATE ?auto_32458 ) ( not ( = ?auto_32462 ?auto_32467 ) ) ( not ( = ?auto_32477 ?auto_32462 ) ) ( HOIST-AT ?auto_32461 ?auto_32462 ) ( not ( = ?auto_32460 ?auto_32461 ) ) ( not ( = ?auto_32472 ?auto_32461 ) ) ( AVAILABLE ?auto_32461 ) ( SURFACE-AT ?auto_32458 ?auto_32462 ) ( ON ?auto_32458 ?auto_32473 ) ( CLEAR ?auto_32458 ) ( not ( = ?auto_32458 ?auto_32473 ) ) ( not ( = ?auto_32459 ?auto_32473 ) ) ( not ( = ?auto_32457 ?auto_32473 ) ) ( not ( = ?auto_32471 ?auto_32473 ) ) ( IS-CRATE ?auto_32457 ) ( not ( = ?auto_32456 ?auto_32457 ) ) ( not ( = ?auto_32458 ?auto_32456 ) ) ( not ( = ?auto_32459 ?auto_32456 ) ) ( not ( = ?auto_32471 ?auto_32456 ) ) ( not ( = ?auto_32473 ?auto_32456 ) ) ( not ( = ?auto_32476 ?auto_32467 ) ) ( not ( = ?auto_32477 ?auto_32476 ) ) ( not ( = ?auto_32462 ?auto_32476 ) ) ( HOIST-AT ?auto_32464 ?auto_32476 ) ( not ( = ?auto_32460 ?auto_32464 ) ) ( not ( = ?auto_32472 ?auto_32464 ) ) ( not ( = ?auto_32461 ?auto_32464 ) ) ( AVAILABLE ?auto_32464 ) ( SURFACE-AT ?auto_32457 ?auto_32476 ) ( ON ?auto_32457 ?auto_32465 ) ( CLEAR ?auto_32457 ) ( not ( = ?auto_32458 ?auto_32465 ) ) ( not ( = ?auto_32459 ?auto_32465 ) ) ( not ( = ?auto_32457 ?auto_32465 ) ) ( not ( = ?auto_32471 ?auto_32465 ) ) ( not ( = ?auto_32473 ?auto_32465 ) ) ( not ( = ?auto_32456 ?auto_32465 ) ) ( IS-CRATE ?auto_32456 ) ( not ( = ?auto_32470 ?auto_32456 ) ) ( not ( = ?auto_32458 ?auto_32470 ) ) ( not ( = ?auto_32459 ?auto_32470 ) ) ( not ( = ?auto_32457 ?auto_32470 ) ) ( not ( = ?auto_32471 ?auto_32470 ) ) ( not ( = ?auto_32473 ?auto_32470 ) ) ( not ( = ?auto_32465 ?auto_32470 ) ) ( not ( = ?auto_32466 ?auto_32467 ) ) ( not ( = ?auto_32477 ?auto_32466 ) ) ( not ( = ?auto_32462 ?auto_32466 ) ) ( not ( = ?auto_32476 ?auto_32466 ) ) ( HOIST-AT ?auto_32475 ?auto_32466 ) ( not ( = ?auto_32460 ?auto_32475 ) ) ( not ( = ?auto_32472 ?auto_32475 ) ) ( not ( = ?auto_32461 ?auto_32475 ) ) ( not ( = ?auto_32464 ?auto_32475 ) ) ( AVAILABLE ?auto_32475 ) ( SURFACE-AT ?auto_32456 ?auto_32466 ) ( ON ?auto_32456 ?auto_32463 ) ( CLEAR ?auto_32456 ) ( not ( = ?auto_32458 ?auto_32463 ) ) ( not ( = ?auto_32459 ?auto_32463 ) ) ( not ( = ?auto_32457 ?auto_32463 ) ) ( not ( = ?auto_32471 ?auto_32463 ) ) ( not ( = ?auto_32473 ?auto_32463 ) ) ( not ( = ?auto_32456 ?auto_32463 ) ) ( not ( = ?auto_32465 ?auto_32463 ) ) ( not ( = ?auto_32470 ?auto_32463 ) ) ( SURFACE-AT ?auto_32469 ?auto_32467 ) ( CLEAR ?auto_32469 ) ( IS-CRATE ?auto_32470 ) ( not ( = ?auto_32469 ?auto_32470 ) ) ( not ( = ?auto_32458 ?auto_32469 ) ) ( not ( = ?auto_32459 ?auto_32469 ) ) ( not ( = ?auto_32457 ?auto_32469 ) ) ( not ( = ?auto_32471 ?auto_32469 ) ) ( not ( = ?auto_32473 ?auto_32469 ) ) ( not ( = ?auto_32456 ?auto_32469 ) ) ( not ( = ?auto_32465 ?auto_32469 ) ) ( not ( = ?auto_32463 ?auto_32469 ) ) ( AVAILABLE ?auto_32460 ) ( AVAILABLE ?auto_32472 ) ( SURFACE-AT ?auto_32470 ?auto_32477 ) ( ON ?auto_32470 ?auto_32468 ) ( CLEAR ?auto_32470 ) ( not ( = ?auto_32458 ?auto_32468 ) ) ( not ( = ?auto_32459 ?auto_32468 ) ) ( not ( = ?auto_32457 ?auto_32468 ) ) ( not ( = ?auto_32471 ?auto_32468 ) ) ( not ( = ?auto_32473 ?auto_32468 ) ) ( not ( = ?auto_32456 ?auto_32468 ) ) ( not ( = ?auto_32465 ?auto_32468 ) ) ( not ( = ?auto_32470 ?auto_32468 ) ) ( not ( = ?auto_32463 ?auto_32468 ) ) ( not ( = ?auto_32469 ?auto_32468 ) ) ( TRUCK-AT ?auto_32474 ?auto_32467 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32457 ?auto_32458 ?auto_32459 )
      ( MAKE-3CRATE-VERIFY ?auto_32456 ?auto_32457 ?auto_32458 ?auto_32459 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32478 - SURFACE
      ?auto_32479 - SURFACE
      ?auto_32480 - SURFACE
      ?auto_32481 - SURFACE
      ?auto_32482 - SURFACE
    )
    :vars
    (
      ?auto_32483 - HOIST
      ?auto_32490 - PLACE
      ?auto_32499 - PLACE
      ?auto_32494 - HOIST
      ?auto_32493 - SURFACE
      ?auto_32485 - PLACE
      ?auto_32484 - HOIST
      ?auto_32495 - SURFACE
      ?auto_32498 - PLACE
      ?auto_32487 - HOIST
      ?auto_32488 - SURFACE
      ?auto_32489 - PLACE
      ?auto_32497 - HOIST
      ?auto_32486 - SURFACE
      ?auto_32492 - SURFACE
      ?auto_32491 - SURFACE
      ?auto_32496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32483 ?auto_32490 ) ( IS-CRATE ?auto_32482 ) ( not ( = ?auto_32481 ?auto_32482 ) ) ( not ( = ?auto_32480 ?auto_32481 ) ) ( not ( = ?auto_32480 ?auto_32482 ) ) ( not ( = ?auto_32499 ?auto_32490 ) ) ( HOIST-AT ?auto_32494 ?auto_32499 ) ( not ( = ?auto_32483 ?auto_32494 ) ) ( SURFACE-AT ?auto_32482 ?auto_32499 ) ( ON ?auto_32482 ?auto_32493 ) ( CLEAR ?auto_32482 ) ( not ( = ?auto_32481 ?auto_32493 ) ) ( not ( = ?auto_32482 ?auto_32493 ) ) ( not ( = ?auto_32480 ?auto_32493 ) ) ( IS-CRATE ?auto_32481 ) ( not ( = ?auto_32485 ?auto_32490 ) ) ( not ( = ?auto_32499 ?auto_32485 ) ) ( HOIST-AT ?auto_32484 ?auto_32485 ) ( not ( = ?auto_32483 ?auto_32484 ) ) ( not ( = ?auto_32494 ?auto_32484 ) ) ( AVAILABLE ?auto_32484 ) ( SURFACE-AT ?auto_32481 ?auto_32485 ) ( ON ?auto_32481 ?auto_32495 ) ( CLEAR ?auto_32481 ) ( not ( = ?auto_32481 ?auto_32495 ) ) ( not ( = ?auto_32482 ?auto_32495 ) ) ( not ( = ?auto_32480 ?auto_32495 ) ) ( not ( = ?auto_32493 ?auto_32495 ) ) ( IS-CRATE ?auto_32480 ) ( not ( = ?auto_32479 ?auto_32480 ) ) ( not ( = ?auto_32481 ?auto_32479 ) ) ( not ( = ?auto_32482 ?auto_32479 ) ) ( not ( = ?auto_32493 ?auto_32479 ) ) ( not ( = ?auto_32495 ?auto_32479 ) ) ( not ( = ?auto_32498 ?auto_32490 ) ) ( not ( = ?auto_32499 ?auto_32498 ) ) ( not ( = ?auto_32485 ?auto_32498 ) ) ( HOIST-AT ?auto_32487 ?auto_32498 ) ( not ( = ?auto_32483 ?auto_32487 ) ) ( not ( = ?auto_32494 ?auto_32487 ) ) ( not ( = ?auto_32484 ?auto_32487 ) ) ( AVAILABLE ?auto_32487 ) ( SURFACE-AT ?auto_32480 ?auto_32498 ) ( ON ?auto_32480 ?auto_32488 ) ( CLEAR ?auto_32480 ) ( not ( = ?auto_32481 ?auto_32488 ) ) ( not ( = ?auto_32482 ?auto_32488 ) ) ( not ( = ?auto_32480 ?auto_32488 ) ) ( not ( = ?auto_32493 ?auto_32488 ) ) ( not ( = ?auto_32495 ?auto_32488 ) ) ( not ( = ?auto_32479 ?auto_32488 ) ) ( IS-CRATE ?auto_32479 ) ( not ( = ?auto_32478 ?auto_32479 ) ) ( not ( = ?auto_32481 ?auto_32478 ) ) ( not ( = ?auto_32482 ?auto_32478 ) ) ( not ( = ?auto_32480 ?auto_32478 ) ) ( not ( = ?auto_32493 ?auto_32478 ) ) ( not ( = ?auto_32495 ?auto_32478 ) ) ( not ( = ?auto_32488 ?auto_32478 ) ) ( not ( = ?auto_32489 ?auto_32490 ) ) ( not ( = ?auto_32499 ?auto_32489 ) ) ( not ( = ?auto_32485 ?auto_32489 ) ) ( not ( = ?auto_32498 ?auto_32489 ) ) ( HOIST-AT ?auto_32497 ?auto_32489 ) ( not ( = ?auto_32483 ?auto_32497 ) ) ( not ( = ?auto_32494 ?auto_32497 ) ) ( not ( = ?auto_32484 ?auto_32497 ) ) ( not ( = ?auto_32487 ?auto_32497 ) ) ( AVAILABLE ?auto_32497 ) ( SURFACE-AT ?auto_32479 ?auto_32489 ) ( ON ?auto_32479 ?auto_32486 ) ( CLEAR ?auto_32479 ) ( not ( = ?auto_32481 ?auto_32486 ) ) ( not ( = ?auto_32482 ?auto_32486 ) ) ( not ( = ?auto_32480 ?auto_32486 ) ) ( not ( = ?auto_32493 ?auto_32486 ) ) ( not ( = ?auto_32495 ?auto_32486 ) ) ( not ( = ?auto_32479 ?auto_32486 ) ) ( not ( = ?auto_32488 ?auto_32486 ) ) ( not ( = ?auto_32478 ?auto_32486 ) ) ( SURFACE-AT ?auto_32492 ?auto_32490 ) ( CLEAR ?auto_32492 ) ( IS-CRATE ?auto_32478 ) ( not ( = ?auto_32492 ?auto_32478 ) ) ( not ( = ?auto_32481 ?auto_32492 ) ) ( not ( = ?auto_32482 ?auto_32492 ) ) ( not ( = ?auto_32480 ?auto_32492 ) ) ( not ( = ?auto_32493 ?auto_32492 ) ) ( not ( = ?auto_32495 ?auto_32492 ) ) ( not ( = ?auto_32479 ?auto_32492 ) ) ( not ( = ?auto_32488 ?auto_32492 ) ) ( not ( = ?auto_32486 ?auto_32492 ) ) ( AVAILABLE ?auto_32483 ) ( AVAILABLE ?auto_32494 ) ( SURFACE-AT ?auto_32478 ?auto_32499 ) ( ON ?auto_32478 ?auto_32491 ) ( CLEAR ?auto_32478 ) ( not ( = ?auto_32481 ?auto_32491 ) ) ( not ( = ?auto_32482 ?auto_32491 ) ) ( not ( = ?auto_32480 ?auto_32491 ) ) ( not ( = ?auto_32493 ?auto_32491 ) ) ( not ( = ?auto_32495 ?auto_32491 ) ) ( not ( = ?auto_32479 ?auto_32491 ) ) ( not ( = ?auto_32488 ?auto_32491 ) ) ( not ( = ?auto_32478 ?auto_32491 ) ) ( not ( = ?auto_32486 ?auto_32491 ) ) ( not ( = ?auto_32492 ?auto_32491 ) ) ( TRUCK-AT ?auto_32496 ?auto_32490 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32480 ?auto_32481 ?auto_32482 )
      ( MAKE-4CRATE-VERIFY ?auto_32478 ?auto_32479 ?auto_32480 ?auto_32481 ?auto_32482 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32500 - SURFACE
      ?auto_32501 - SURFACE
      ?auto_32502 - SURFACE
      ?auto_32503 - SURFACE
      ?auto_32504 - SURFACE
      ?auto_32505 - SURFACE
    )
    :vars
    (
      ?auto_32506 - HOIST
      ?auto_32513 - PLACE
      ?auto_32521 - PLACE
      ?auto_32516 - HOIST
      ?auto_32515 - SURFACE
      ?auto_32508 - PLACE
      ?auto_32507 - HOIST
      ?auto_32517 - SURFACE
      ?auto_32520 - PLACE
      ?auto_32510 - HOIST
      ?auto_32511 - SURFACE
      ?auto_32512 - PLACE
      ?auto_32519 - HOIST
      ?auto_32509 - SURFACE
      ?auto_32514 - SURFACE
      ?auto_32518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32506 ?auto_32513 ) ( IS-CRATE ?auto_32505 ) ( not ( = ?auto_32504 ?auto_32505 ) ) ( not ( = ?auto_32503 ?auto_32504 ) ) ( not ( = ?auto_32503 ?auto_32505 ) ) ( not ( = ?auto_32521 ?auto_32513 ) ) ( HOIST-AT ?auto_32516 ?auto_32521 ) ( not ( = ?auto_32506 ?auto_32516 ) ) ( SURFACE-AT ?auto_32505 ?auto_32521 ) ( ON ?auto_32505 ?auto_32515 ) ( CLEAR ?auto_32505 ) ( not ( = ?auto_32504 ?auto_32515 ) ) ( not ( = ?auto_32505 ?auto_32515 ) ) ( not ( = ?auto_32503 ?auto_32515 ) ) ( IS-CRATE ?auto_32504 ) ( not ( = ?auto_32508 ?auto_32513 ) ) ( not ( = ?auto_32521 ?auto_32508 ) ) ( HOIST-AT ?auto_32507 ?auto_32508 ) ( not ( = ?auto_32506 ?auto_32507 ) ) ( not ( = ?auto_32516 ?auto_32507 ) ) ( AVAILABLE ?auto_32507 ) ( SURFACE-AT ?auto_32504 ?auto_32508 ) ( ON ?auto_32504 ?auto_32517 ) ( CLEAR ?auto_32504 ) ( not ( = ?auto_32504 ?auto_32517 ) ) ( not ( = ?auto_32505 ?auto_32517 ) ) ( not ( = ?auto_32503 ?auto_32517 ) ) ( not ( = ?auto_32515 ?auto_32517 ) ) ( IS-CRATE ?auto_32503 ) ( not ( = ?auto_32502 ?auto_32503 ) ) ( not ( = ?auto_32504 ?auto_32502 ) ) ( not ( = ?auto_32505 ?auto_32502 ) ) ( not ( = ?auto_32515 ?auto_32502 ) ) ( not ( = ?auto_32517 ?auto_32502 ) ) ( not ( = ?auto_32520 ?auto_32513 ) ) ( not ( = ?auto_32521 ?auto_32520 ) ) ( not ( = ?auto_32508 ?auto_32520 ) ) ( HOIST-AT ?auto_32510 ?auto_32520 ) ( not ( = ?auto_32506 ?auto_32510 ) ) ( not ( = ?auto_32516 ?auto_32510 ) ) ( not ( = ?auto_32507 ?auto_32510 ) ) ( AVAILABLE ?auto_32510 ) ( SURFACE-AT ?auto_32503 ?auto_32520 ) ( ON ?auto_32503 ?auto_32511 ) ( CLEAR ?auto_32503 ) ( not ( = ?auto_32504 ?auto_32511 ) ) ( not ( = ?auto_32505 ?auto_32511 ) ) ( not ( = ?auto_32503 ?auto_32511 ) ) ( not ( = ?auto_32515 ?auto_32511 ) ) ( not ( = ?auto_32517 ?auto_32511 ) ) ( not ( = ?auto_32502 ?auto_32511 ) ) ( IS-CRATE ?auto_32502 ) ( not ( = ?auto_32501 ?auto_32502 ) ) ( not ( = ?auto_32504 ?auto_32501 ) ) ( not ( = ?auto_32505 ?auto_32501 ) ) ( not ( = ?auto_32503 ?auto_32501 ) ) ( not ( = ?auto_32515 ?auto_32501 ) ) ( not ( = ?auto_32517 ?auto_32501 ) ) ( not ( = ?auto_32511 ?auto_32501 ) ) ( not ( = ?auto_32512 ?auto_32513 ) ) ( not ( = ?auto_32521 ?auto_32512 ) ) ( not ( = ?auto_32508 ?auto_32512 ) ) ( not ( = ?auto_32520 ?auto_32512 ) ) ( HOIST-AT ?auto_32519 ?auto_32512 ) ( not ( = ?auto_32506 ?auto_32519 ) ) ( not ( = ?auto_32516 ?auto_32519 ) ) ( not ( = ?auto_32507 ?auto_32519 ) ) ( not ( = ?auto_32510 ?auto_32519 ) ) ( AVAILABLE ?auto_32519 ) ( SURFACE-AT ?auto_32502 ?auto_32512 ) ( ON ?auto_32502 ?auto_32509 ) ( CLEAR ?auto_32502 ) ( not ( = ?auto_32504 ?auto_32509 ) ) ( not ( = ?auto_32505 ?auto_32509 ) ) ( not ( = ?auto_32503 ?auto_32509 ) ) ( not ( = ?auto_32515 ?auto_32509 ) ) ( not ( = ?auto_32517 ?auto_32509 ) ) ( not ( = ?auto_32502 ?auto_32509 ) ) ( not ( = ?auto_32511 ?auto_32509 ) ) ( not ( = ?auto_32501 ?auto_32509 ) ) ( SURFACE-AT ?auto_32500 ?auto_32513 ) ( CLEAR ?auto_32500 ) ( IS-CRATE ?auto_32501 ) ( not ( = ?auto_32500 ?auto_32501 ) ) ( not ( = ?auto_32504 ?auto_32500 ) ) ( not ( = ?auto_32505 ?auto_32500 ) ) ( not ( = ?auto_32503 ?auto_32500 ) ) ( not ( = ?auto_32515 ?auto_32500 ) ) ( not ( = ?auto_32517 ?auto_32500 ) ) ( not ( = ?auto_32502 ?auto_32500 ) ) ( not ( = ?auto_32511 ?auto_32500 ) ) ( not ( = ?auto_32509 ?auto_32500 ) ) ( AVAILABLE ?auto_32506 ) ( AVAILABLE ?auto_32516 ) ( SURFACE-AT ?auto_32501 ?auto_32521 ) ( ON ?auto_32501 ?auto_32514 ) ( CLEAR ?auto_32501 ) ( not ( = ?auto_32504 ?auto_32514 ) ) ( not ( = ?auto_32505 ?auto_32514 ) ) ( not ( = ?auto_32503 ?auto_32514 ) ) ( not ( = ?auto_32515 ?auto_32514 ) ) ( not ( = ?auto_32517 ?auto_32514 ) ) ( not ( = ?auto_32502 ?auto_32514 ) ) ( not ( = ?auto_32511 ?auto_32514 ) ) ( not ( = ?auto_32501 ?auto_32514 ) ) ( not ( = ?auto_32509 ?auto_32514 ) ) ( not ( = ?auto_32500 ?auto_32514 ) ) ( TRUCK-AT ?auto_32518 ?auto_32513 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32503 ?auto_32504 ?auto_32505 )
      ( MAKE-5CRATE-VERIFY ?auto_32500 ?auto_32501 ?auto_32502 ?auto_32503 ?auto_32504 ?auto_32505 ) )
  )

)

