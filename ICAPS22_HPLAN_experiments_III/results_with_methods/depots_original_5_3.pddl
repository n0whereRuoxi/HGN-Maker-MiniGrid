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
      ?auto_28087 - SURFACE
      ?auto_28088 - SURFACE
    )
    :vars
    (
      ?auto_28089 - HOIST
      ?auto_28090 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28089 ?auto_28090 ) ( SURFACE-AT ?auto_28087 ?auto_28090 ) ( CLEAR ?auto_28087 ) ( LIFTING ?auto_28089 ?auto_28088 ) ( IS-CRATE ?auto_28088 ) ( not ( = ?auto_28087 ?auto_28088 ) ) )
    :subtasks
    ( ( !DROP ?auto_28089 ?auto_28088 ?auto_28087 ?auto_28090 )
      ( MAKE-1CRATE-VERIFY ?auto_28087 ?auto_28088 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28091 - SURFACE
      ?auto_28092 - SURFACE
    )
    :vars
    (
      ?auto_28093 - HOIST
      ?auto_28094 - PLACE
      ?auto_28095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28093 ?auto_28094 ) ( SURFACE-AT ?auto_28091 ?auto_28094 ) ( CLEAR ?auto_28091 ) ( IS-CRATE ?auto_28092 ) ( not ( = ?auto_28091 ?auto_28092 ) ) ( TRUCK-AT ?auto_28095 ?auto_28094 ) ( AVAILABLE ?auto_28093 ) ( IN ?auto_28092 ?auto_28095 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28093 ?auto_28092 ?auto_28095 ?auto_28094 )
      ( MAKE-1CRATE ?auto_28091 ?auto_28092 )
      ( MAKE-1CRATE-VERIFY ?auto_28091 ?auto_28092 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28096 - SURFACE
      ?auto_28097 - SURFACE
    )
    :vars
    (
      ?auto_28100 - HOIST
      ?auto_28099 - PLACE
      ?auto_28098 - TRUCK
      ?auto_28101 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28100 ?auto_28099 ) ( SURFACE-AT ?auto_28096 ?auto_28099 ) ( CLEAR ?auto_28096 ) ( IS-CRATE ?auto_28097 ) ( not ( = ?auto_28096 ?auto_28097 ) ) ( AVAILABLE ?auto_28100 ) ( IN ?auto_28097 ?auto_28098 ) ( TRUCK-AT ?auto_28098 ?auto_28101 ) ( not ( = ?auto_28101 ?auto_28099 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28098 ?auto_28101 ?auto_28099 )
      ( MAKE-1CRATE ?auto_28096 ?auto_28097 )
      ( MAKE-1CRATE-VERIFY ?auto_28096 ?auto_28097 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28102 - SURFACE
      ?auto_28103 - SURFACE
    )
    :vars
    (
      ?auto_28107 - HOIST
      ?auto_28105 - PLACE
      ?auto_28106 - TRUCK
      ?auto_28104 - PLACE
      ?auto_28108 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28107 ?auto_28105 ) ( SURFACE-AT ?auto_28102 ?auto_28105 ) ( CLEAR ?auto_28102 ) ( IS-CRATE ?auto_28103 ) ( not ( = ?auto_28102 ?auto_28103 ) ) ( AVAILABLE ?auto_28107 ) ( TRUCK-AT ?auto_28106 ?auto_28104 ) ( not ( = ?auto_28104 ?auto_28105 ) ) ( HOIST-AT ?auto_28108 ?auto_28104 ) ( LIFTING ?auto_28108 ?auto_28103 ) ( not ( = ?auto_28107 ?auto_28108 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28108 ?auto_28103 ?auto_28106 ?auto_28104 )
      ( MAKE-1CRATE ?auto_28102 ?auto_28103 )
      ( MAKE-1CRATE-VERIFY ?auto_28102 ?auto_28103 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28109 - SURFACE
      ?auto_28110 - SURFACE
    )
    :vars
    (
      ?auto_28111 - HOIST
      ?auto_28115 - PLACE
      ?auto_28113 - TRUCK
      ?auto_28112 - PLACE
      ?auto_28114 - HOIST
      ?auto_28116 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28111 ?auto_28115 ) ( SURFACE-AT ?auto_28109 ?auto_28115 ) ( CLEAR ?auto_28109 ) ( IS-CRATE ?auto_28110 ) ( not ( = ?auto_28109 ?auto_28110 ) ) ( AVAILABLE ?auto_28111 ) ( TRUCK-AT ?auto_28113 ?auto_28112 ) ( not ( = ?auto_28112 ?auto_28115 ) ) ( HOIST-AT ?auto_28114 ?auto_28112 ) ( not ( = ?auto_28111 ?auto_28114 ) ) ( AVAILABLE ?auto_28114 ) ( SURFACE-AT ?auto_28110 ?auto_28112 ) ( ON ?auto_28110 ?auto_28116 ) ( CLEAR ?auto_28110 ) ( not ( = ?auto_28109 ?auto_28116 ) ) ( not ( = ?auto_28110 ?auto_28116 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28114 ?auto_28110 ?auto_28116 ?auto_28112 )
      ( MAKE-1CRATE ?auto_28109 ?auto_28110 )
      ( MAKE-1CRATE-VERIFY ?auto_28109 ?auto_28110 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28117 - SURFACE
      ?auto_28118 - SURFACE
    )
    :vars
    (
      ?auto_28120 - HOIST
      ?auto_28122 - PLACE
      ?auto_28124 - PLACE
      ?auto_28123 - HOIST
      ?auto_28121 - SURFACE
      ?auto_28119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28120 ?auto_28122 ) ( SURFACE-AT ?auto_28117 ?auto_28122 ) ( CLEAR ?auto_28117 ) ( IS-CRATE ?auto_28118 ) ( not ( = ?auto_28117 ?auto_28118 ) ) ( AVAILABLE ?auto_28120 ) ( not ( = ?auto_28124 ?auto_28122 ) ) ( HOIST-AT ?auto_28123 ?auto_28124 ) ( not ( = ?auto_28120 ?auto_28123 ) ) ( AVAILABLE ?auto_28123 ) ( SURFACE-AT ?auto_28118 ?auto_28124 ) ( ON ?auto_28118 ?auto_28121 ) ( CLEAR ?auto_28118 ) ( not ( = ?auto_28117 ?auto_28121 ) ) ( not ( = ?auto_28118 ?auto_28121 ) ) ( TRUCK-AT ?auto_28119 ?auto_28122 ) )
    :subtasks
    ( ( !DRIVE ?auto_28119 ?auto_28122 ?auto_28124 )
      ( MAKE-1CRATE ?auto_28117 ?auto_28118 )
      ( MAKE-1CRATE-VERIFY ?auto_28117 ?auto_28118 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28130 - SURFACE
      ?auto_28131 - SURFACE
    )
    :vars
    (
      ?auto_28132 - HOIST
      ?auto_28133 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28132 ?auto_28133 ) ( SURFACE-AT ?auto_28130 ?auto_28133 ) ( CLEAR ?auto_28130 ) ( LIFTING ?auto_28132 ?auto_28131 ) ( IS-CRATE ?auto_28131 ) ( not ( = ?auto_28130 ?auto_28131 ) ) )
    :subtasks
    ( ( !DROP ?auto_28132 ?auto_28131 ?auto_28130 ?auto_28133 )
      ( MAKE-1CRATE-VERIFY ?auto_28130 ?auto_28131 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28134 - SURFACE
      ?auto_28135 - SURFACE
      ?auto_28136 - SURFACE
    )
    :vars
    (
      ?auto_28138 - HOIST
      ?auto_28137 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28138 ?auto_28137 ) ( SURFACE-AT ?auto_28135 ?auto_28137 ) ( CLEAR ?auto_28135 ) ( LIFTING ?auto_28138 ?auto_28136 ) ( IS-CRATE ?auto_28136 ) ( not ( = ?auto_28135 ?auto_28136 ) ) ( ON ?auto_28135 ?auto_28134 ) ( not ( = ?auto_28134 ?auto_28135 ) ) ( not ( = ?auto_28134 ?auto_28136 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28135 ?auto_28136 )
      ( MAKE-2CRATE-VERIFY ?auto_28134 ?auto_28135 ?auto_28136 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28139 - SURFACE
      ?auto_28140 - SURFACE
    )
    :vars
    (
      ?auto_28142 - HOIST
      ?auto_28141 - PLACE
      ?auto_28143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28142 ?auto_28141 ) ( SURFACE-AT ?auto_28139 ?auto_28141 ) ( CLEAR ?auto_28139 ) ( IS-CRATE ?auto_28140 ) ( not ( = ?auto_28139 ?auto_28140 ) ) ( TRUCK-AT ?auto_28143 ?auto_28141 ) ( AVAILABLE ?auto_28142 ) ( IN ?auto_28140 ?auto_28143 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28142 ?auto_28140 ?auto_28143 ?auto_28141 )
      ( MAKE-1CRATE ?auto_28139 ?auto_28140 )
      ( MAKE-1CRATE-VERIFY ?auto_28139 ?auto_28140 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28144 - SURFACE
      ?auto_28145 - SURFACE
      ?auto_28146 - SURFACE
    )
    :vars
    (
      ?auto_28147 - HOIST
      ?auto_28149 - PLACE
      ?auto_28148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28147 ?auto_28149 ) ( SURFACE-AT ?auto_28145 ?auto_28149 ) ( CLEAR ?auto_28145 ) ( IS-CRATE ?auto_28146 ) ( not ( = ?auto_28145 ?auto_28146 ) ) ( TRUCK-AT ?auto_28148 ?auto_28149 ) ( AVAILABLE ?auto_28147 ) ( IN ?auto_28146 ?auto_28148 ) ( ON ?auto_28145 ?auto_28144 ) ( not ( = ?auto_28144 ?auto_28145 ) ) ( not ( = ?auto_28144 ?auto_28146 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28145 ?auto_28146 )
      ( MAKE-2CRATE-VERIFY ?auto_28144 ?auto_28145 ?auto_28146 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28150 - SURFACE
      ?auto_28151 - SURFACE
    )
    :vars
    (
      ?auto_28154 - HOIST
      ?auto_28152 - PLACE
      ?auto_28153 - TRUCK
      ?auto_28155 - SURFACE
      ?auto_28156 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28154 ?auto_28152 ) ( SURFACE-AT ?auto_28150 ?auto_28152 ) ( CLEAR ?auto_28150 ) ( IS-CRATE ?auto_28151 ) ( not ( = ?auto_28150 ?auto_28151 ) ) ( AVAILABLE ?auto_28154 ) ( IN ?auto_28151 ?auto_28153 ) ( ON ?auto_28150 ?auto_28155 ) ( not ( = ?auto_28155 ?auto_28150 ) ) ( not ( = ?auto_28155 ?auto_28151 ) ) ( TRUCK-AT ?auto_28153 ?auto_28156 ) ( not ( = ?auto_28156 ?auto_28152 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28153 ?auto_28156 ?auto_28152 )
      ( MAKE-2CRATE ?auto_28155 ?auto_28150 ?auto_28151 )
      ( MAKE-1CRATE-VERIFY ?auto_28150 ?auto_28151 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28157 - SURFACE
      ?auto_28158 - SURFACE
      ?auto_28159 - SURFACE
    )
    :vars
    (
      ?auto_28161 - HOIST
      ?auto_28163 - PLACE
      ?auto_28162 - TRUCK
      ?auto_28160 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28161 ?auto_28163 ) ( SURFACE-AT ?auto_28158 ?auto_28163 ) ( CLEAR ?auto_28158 ) ( IS-CRATE ?auto_28159 ) ( not ( = ?auto_28158 ?auto_28159 ) ) ( AVAILABLE ?auto_28161 ) ( IN ?auto_28159 ?auto_28162 ) ( ON ?auto_28158 ?auto_28157 ) ( not ( = ?auto_28157 ?auto_28158 ) ) ( not ( = ?auto_28157 ?auto_28159 ) ) ( TRUCK-AT ?auto_28162 ?auto_28160 ) ( not ( = ?auto_28160 ?auto_28163 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28158 ?auto_28159 )
      ( MAKE-2CRATE-VERIFY ?auto_28157 ?auto_28158 ?auto_28159 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28164 - SURFACE
      ?auto_28165 - SURFACE
    )
    :vars
    (
      ?auto_28169 - HOIST
      ?auto_28168 - PLACE
      ?auto_28167 - SURFACE
      ?auto_28170 - TRUCK
      ?auto_28166 - PLACE
      ?auto_28171 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28169 ?auto_28168 ) ( SURFACE-AT ?auto_28164 ?auto_28168 ) ( CLEAR ?auto_28164 ) ( IS-CRATE ?auto_28165 ) ( not ( = ?auto_28164 ?auto_28165 ) ) ( AVAILABLE ?auto_28169 ) ( ON ?auto_28164 ?auto_28167 ) ( not ( = ?auto_28167 ?auto_28164 ) ) ( not ( = ?auto_28167 ?auto_28165 ) ) ( TRUCK-AT ?auto_28170 ?auto_28166 ) ( not ( = ?auto_28166 ?auto_28168 ) ) ( HOIST-AT ?auto_28171 ?auto_28166 ) ( LIFTING ?auto_28171 ?auto_28165 ) ( not ( = ?auto_28169 ?auto_28171 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28171 ?auto_28165 ?auto_28170 ?auto_28166 )
      ( MAKE-2CRATE ?auto_28167 ?auto_28164 ?auto_28165 )
      ( MAKE-1CRATE-VERIFY ?auto_28164 ?auto_28165 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28172 - SURFACE
      ?auto_28173 - SURFACE
      ?auto_28174 - SURFACE
    )
    :vars
    (
      ?auto_28176 - HOIST
      ?auto_28175 - PLACE
      ?auto_28178 - TRUCK
      ?auto_28177 - PLACE
      ?auto_28179 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28176 ?auto_28175 ) ( SURFACE-AT ?auto_28173 ?auto_28175 ) ( CLEAR ?auto_28173 ) ( IS-CRATE ?auto_28174 ) ( not ( = ?auto_28173 ?auto_28174 ) ) ( AVAILABLE ?auto_28176 ) ( ON ?auto_28173 ?auto_28172 ) ( not ( = ?auto_28172 ?auto_28173 ) ) ( not ( = ?auto_28172 ?auto_28174 ) ) ( TRUCK-AT ?auto_28178 ?auto_28177 ) ( not ( = ?auto_28177 ?auto_28175 ) ) ( HOIST-AT ?auto_28179 ?auto_28177 ) ( LIFTING ?auto_28179 ?auto_28174 ) ( not ( = ?auto_28176 ?auto_28179 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28173 ?auto_28174 )
      ( MAKE-2CRATE-VERIFY ?auto_28172 ?auto_28173 ?auto_28174 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28180 - SURFACE
      ?auto_28181 - SURFACE
    )
    :vars
    (
      ?auto_28186 - HOIST
      ?auto_28183 - PLACE
      ?auto_28184 - SURFACE
      ?auto_28182 - TRUCK
      ?auto_28185 - PLACE
      ?auto_28187 - HOIST
      ?auto_28188 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28186 ?auto_28183 ) ( SURFACE-AT ?auto_28180 ?auto_28183 ) ( CLEAR ?auto_28180 ) ( IS-CRATE ?auto_28181 ) ( not ( = ?auto_28180 ?auto_28181 ) ) ( AVAILABLE ?auto_28186 ) ( ON ?auto_28180 ?auto_28184 ) ( not ( = ?auto_28184 ?auto_28180 ) ) ( not ( = ?auto_28184 ?auto_28181 ) ) ( TRUCK-AT ?auto_28182 ?auto_28185 ) ( not ( = ?auto_28185 ?auto_28183 ) ) ( HOIST-AT ?auto_28187 ?auto_28185 ) ( not ( = ?auto_28186 ?auto_28187 ) ) ( AVAILABLE ?auto_28187 ) ( SURFACE-AT ?auto_28181 ?auto_28185 ) ( ON ?auto_28181 ?auto_28188 ) ( CLEAR ?auto_28181 ) ( not ( = ?auto_28180 ?auto_28188 ) ) ( not ( = ?auto_28181 ?auto_28188 ) ) ( not ( = ?auto_28184 ?auto_28188 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28187 ?auto_28181 ?auto_28188 ?auto_28185 )
      ( MAKE-2CRATE ?auto_28184 ?auto_28180 ?auto_28181 )
      ( MAKE-1CRATE-VERIFY ?auto_28180 ?auto_28181 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28189 - SURFACE
      ?auto_28190 - SURFACE
      ?auto_28191 - SURFACE
    )
    :vars
    (
      ?auto_28197 - HOIST
      ?auto_28196 - PLACE
      ?auto_28195 - TRUCK
      ?auto_28192 - PLACE
      ?auto_28194 - HOIST
      ?auto_28193 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28197 ?auto_28196 ) ( SURFACE-AT ?auto_28190 ?auto_28196 ) ( CLEAR ?auto_28190 ) ( IS-CRATE ?auto_28191 ) ( not ( = ?auto_28190 ?auto_28191 ) ) ( AVAILABLE ?auto_28197 ) ( ON ?auto_28190 ?auto_28189 ) ( not ( = ?auto_28189 ?auto_28190 ) ) ( not ( = ?auto_28189 ?auto_28191 ) ) ( TRUCK-AT ?auto_28195 ?auto_28192 ) ( not ( = ?auto_28192 ?auto_28196 ) ) ( HOIST-AT ?auto_28194 ?auto_28192 ) ( not ( = ?auto_28197 ?auto_28194 ) ) ( AVAILABLE ?auto_28194 ) ( SURFACE-AT ?auto_28191 ?auto_28192 ) ( ON ?auto_28191 ?auto_28193 ) ( CLEAR ?auto_28191 ) ( not ( = ?auto_28190 ?auto_28193 ) ) ( not ( = ?auto_28191 ?auto_28193 ) ) ( not ( = ?auto_28189 ?auto_28193 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28190 ?auto_28191 )
      ( MAKE-2CRATE-VERIFY ?auto_28189 ?auto_28190 ?auto_28191 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28198 - SURFACE
      ?auto_28199 - SURFACE
    )
    :vars
    (
      ?auto_28204 - HOIST
      ?auto_28205 - PLACE
      ?auto_28203 - SURFACE
      ?auto_28202 - PLACE
      ?auto_28201 - HOIST
      ?auto_28200 - SURFACE
      ?auto_28206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28204 ?auto_28205 ) ( SURFACE-AT ?auto_28198 ?auto_28205 ) ( CLEAR ?auto_28198 ) ( IS-CRATE ?auto_28199 ) ( not ( = ?auto_28198 ?auto_28199 ) ) ( AVAILABLE ?auto_28204 ) ( ON ?auto_28198 ?auto_28203 ) ( not ( = ?auto_28203 ?auto_28198 ) ) ( not ( = ?auto_28203 ?auto_28199 ) ) ( not ( = ?auto_28202 ?auto_28205 ) ) ( HOIST-AT ?auto_28201 ?auto_28202 ) ( not ( = ?auto_28204 ?auto_28201 ) ) ( AVAILABLE ?auto_28201 ) ( SURFACE-AT ?auto_28199 ?auto_28202 ) ( ON ?auto_28199 ?auto_28200 ) ( CLEAR ?auto_28199 ) ( not ( = ?auto_28198 ?auto_28200 ) ) ( not ( = ?auto_28199 ?auto_28200 ) ) ( not ( = ?auto_28203 ?auto_28200 ) ) ( TRUCK-AT ?auto_28206 ?auto_28205 ) )
    :subtasks
    ( ( !DRIVE ?auto_28206 ?auto_28205 ?auto_28202 )
      ( MAKE-2CRATE ?auto_28203 ?auto_28198 ?auto_28199 )
      ( MAKE-1CRATE-VERIFY ?auto_28198 ?auto_28199 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28207 - SURFACE
      ?auto_28208 - SURFACE
      ?auto_28209 - SURFACE
    )
    :vars
    (
      ?auto_28210 - HOIST
      ?auto_28211 - PLACE
      ?auto_28213 - PLACE
      ?auto_28214 - HOIST
      ?auto_28215 - SURFACE
      ?auto_28212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28210 ?auto_28211 ) ( SURFACE-AT ?auto_28208 ?auto_28211 ) ( CLEAR ?auto_28208 ) ( IS-CRATE ?auto_28209 ) ( not ( = ?auto_28208 ?auto_28209 ) ) ( AVAILABLE ?auto_28210 ) ( ON ?auto_28208 ?auto_28207 ) ( not ( = ?auto_28207 ?auto_28208 ) ) ( not ( = ?auto_28207 ?auto_28209 ) ) ( not ( = ?auto_28213 ?auto_28211 ) ) ( HOIST-AT ?auto_28214 ?auto_28213 ) ( not ( = ?auto_28210 ?auto_28214 ) ) ( AVAILABLE ?auto_28214 ) ( SURFACE-AT ?auto_28209 ?auto_28213 ) ( ON ?auto_28209 ?auto_28215 ) ( CLEAR ?auto_28209 ) ( not ( = ?auto_28208 ?auto_28215 ) ) ( not ( = ?auto_28209 ?auto_28215 ) ) ( not ( = ?auto_28207 ?auto_28215 ) ) ( TRUCK-AT ?auto_28212 ?auto_28211 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28208 ?auto_28209 )
      ( MAKE-2CRATE-VERIFY ?auto_28207 ?auto_28208 ?auto_28209 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28216 - SURFACE
      ?auto_28217 - SURFACE
    )
    :vars
    (
      ?auto_28219 - HOIST
      ?auto_28218 - PLACE
      ?auto_28221 - SURFACE
      ?auto_28224 - PLACE
      ?auto_28222 - HOIST
      ?auto_28220 - SURFACE
      ?auto_28223 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28219 ?auto_28218 ) ( IS-CRATE ?auto_28217 ) ( not ( = ?auto_28216 ?auto_28217 ) ) ( not ( = ?auto_28221 ?auto_28216 ) ) ( not ( = ?auto_28221 ?auto_28217 ) ) ( not ( = ?auto_28224 ?auto_28218 ) ) ( HOIST-AT ?auto_28222 ?auto_28224 ) ( not ( = ?auto_28219 ?auto_28222 ) ) ( AVAILABLE ?auto_28222 ) ( SURFACE-AT ?auto_28217 ?auto_28224 ) ( ON ?auto_28217 ?auto_28220 ) ( CLEAR ?auto_28217 ) ( not ( = ?auto_28216 ?auto_28220 ) ) ( not ( = ?auto_28217 ?auto_28220 ) ) ( not ( = ?auto_28221 ?auto_28220 ) ) ( TRUCK-AT ?auto_28223 ?auto_28218 ) ( SURFACE-AT ?auto_28221 ?auto_28218 ) ( CLEAR ?auto_28221 ) ( LIFTING ?auto_28219 ?auto_28216 ) ( IS-CRATE ?auto_28216 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28221 ?auto_28216 )
      ( MAKE-2CRATE ?auto_28221 ?auto_28216 ?auto_28217 )
      ( MAKE-1CRATE-VERIFY ?auto_28216 ?auto_28217 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28225 - SURFACE
      ?auto_28226 - SURFACE
      ?auto_28227 - SURFACE
    )
    :vars
    (
      ?auto_28233 - HOIST
      ?auto_28229 - PLACE
      ?auto_28232 - PLACE
      ?auto_28228 - HOIST
      ?auto_28230 - SURFACE
      ?auto_28231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28233 ?auto_28229 ) ( IS-CRATE ?auto_28227 ) ( not ( = ?auto_28226 ?auto_28227 ) ) ( not ( = ?auto_28225 ?auto_28226 ) ) ( not ( = ?auto_28225 ?auto_28227 ) ) ( not ( = ?auto_28232 ?auto_28229 ) ) ( HOIST-AT ?auto_28228 ?auto_28232 ) ( not ( = ?auto_28233 ?auto_28228 ) ) ( AVAILABLE ?auto_28228 ) ( SURFACE-AT ?auto_28227 ?auto_28232 ) ( ON ?auto_28227 ?auto_28230 ) ( CLEAR ?auto_28227 ) ( not ( = ?auto_28226 ?auto_28230 ) ) ( not ( = ?auto_28227 ?auto_28230 ) ) ( not ( = ?auto_28225 ?auto_28230 ) ) ( TRUCK-AT ?auto_28231 ?auto_28229 ) ( SURFACE-AT ?auto_28225 ?auto_28229 ) ( CLEAR ?auto_28225 ) ( LIFTING ?auto_28233 ?auto_28226 ) ( IS-CRATE ?auto_28226 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28226 ?auto_28227 )
      ( MAKE-2CRATE-VERIFY ?auto_28225 ?auto_28226 ?auto_28227 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28234 - SURFACE
      ?auto_28235 - SURFACE
    )
    :vars
    (
      ?auto_28241 - HOIST
      ?auto_28242 - PLACE
      ?auto_28239 - SURFACE
      ?auto_28240 - PLACE
      ?auto_28238 - HOIST
      ?auto_28236 - SURFACE
      ?auto_28237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28241 ?auto_28242 ) ( IS-CRATE ?auto_28235 ) ( not ( = ?auto_28234 ?auto_28235 ) ) ( not ( = ?auto_28239 ?auto_28234 ) ) ( not ( = ?auto_28239 ?auto_28235 ) ) ( not ( = ?auto_28240 ?auto_28242 ) ) ( HOIST-AT ?auto_28238 ?auto_28240 ) ( not ( = ?auto_28241 ?auto_28238 ) ) ( AVAILABLE ?auto_28238 ) ( SURFACE-AT ?auto_28235 ?auto_28240 ) ( ON ?auto_28235 ?auto_28236 ) ( CLEAR ?auto_28235 ) ( not ( = ?auto_28234 ?auto_28236 ) ) ( not ( = ?auto_28235 ?auto_28236 ) ) ( not ( = ?auto_28239 ?auto_28236 ) ) ( TRUCK-AT ?auto_28237 ?auto_28242 ) ( SURFACE-AT ?auto_28239 ?auto_28242 ) ( CLEAR ?auto_28239 ) ( IS-CRATE ?auto_28234 ) ( AVAILABLE ?auto_28241 ) ( IN ?auto_28234 ?auto_28237 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28241 ?auto_28234 ?auto_28237 ?auto_28242 )
      ( MAKE-2CRATE ?auto_28239 ?auto_28234 ?auto_28235 )
      ( MAKE-1CRATE-VERIFY ?auto_28234 ?auto_28235 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28243 - SURFACE
      ?auto_28244 - SURFACE
      ?auto_28245 - SURFACE
    )
    :vars
    (
      ?auto_28247 - HOIST
      ?auto_28251 - PLACE
      ?auto_28246 - PLACE
      ?auto_28248 - HOIST
      ?auto_28249 - SURFACE
      ?auto_28250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28247 ?auto_28251 ) ( IS-CRATE ?auto_28245 ) ( not ( = ?auto_28244 ?auto_28245 ) ) ( not ( = ?auto_28243 ?auto_28244 ) ) ( not ( = ?auto_28243 ?auto_28245 ) ) ( not ( = ?auto_28246 ?auto_28251 ) ) ( HOIST-AT ?auto_28248 ?auto_28246 ) ( not ( = ?auto_28247 ?auto_28248 ) ) ( AVAILABLE ?auto_28248 ) ( SURFACE-AT ?auto_28245 ?auto_28246 ) ( ON ?auto_28245 ?auto_28249 ) ( CLEAR ?auto_28245 ) ( not ( = ?auto_28244 ?auto_28249 ) ) ( not ( = ?auto_28245 ?auto_28249 ) ) ( not ( = ?auto_28243 ?auto_28249 ) ) ( TRUCK-AT ?auto_28250 ?auto_28251 ) ( SURFACE-AT ?auto_28243 ?auto_28251 ) ( CLEAR ?auto_28243 ) ( IS-CRATE ?auto_28244 ) ( AVAILABLE ?auto_28247 ) ( IN ?auto_28244 ?auto_28250 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28244 ?auto_28245 )
      ( MAKE-2CRATE-VERIFY ?auto_28243 ?auto_28244 ?auto_28245 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28252 - SURFACE
      ?auto_28253 - SURFACE
    )
    :vars
    (
      ?auto_28256 - HOIST
      ?auto_28258 - PLACE
      ?auto_28257 - SURFACE
      ?auto_28259 - PLACE
      ?auto_28260 - HOIST
      ?auto_28255 - SURFACE
      ?auto_28254 - TRUCK
      ?auto_28261 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28256 ?auto_28258 ) ( IS-CRATE ?auto_28253 ) ( not ( = ?auto_28252 ?auto_28253 ) ) ( not ( = ?auto_28257 ?auto_28252 ) ) ( not ( = ?auto_28257 ?auto_28253 ) ) ( not ( = ?auto_28259 ?auto_28258 ) ) ( HOIST-AT ?auto_28260 ?auto_28259 ) ( not ( = ?auto_28256 ?auto_28260 ) ) ( AVAILABLE ?auto_28260 ) ( SURFACE-AT ?auto_28253 ?auto_28259 ) ( ON ?auto_28253 ?auto_28255 ) ( CLEAR ?auto_28253 ) ( not ( = ?auto_28252 ?auto_28255 ) ) ( not ( = ?auto_28253 ?auto_28255 ) ) ( not ( = ?auto_28257 ?auto_28255 ) ) ( SURFACE-AT ?auto_28257 ?auto_28258 ) ( CLEAR ?auto_28257 ) ( IS-CRATE ?auto_28252 ) ( AVAILABLE ?auto_28256 ) ( IN ?auto_28252 ?auto_28254 ) ( TRUCK-AT ?auto_28254 ?auto_28261 ) ( not ( = ?auto_28261 ?auto_28258 ) ) ( not ( = ?auto_28259 ?auto_28261 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28254 ?auto_28261 ?auto_28258 )
      ( MAKE-2CRATE ?auto_28257 ?auto_28252 ?auto_28253 )
      ( MAKE-1CRATE-VERIFY ?auto_28252 ?auto_28253 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28262 - SURFACE
      ?auto_28263 - SURFACE
      ?auto_28264 - SURFACE
    )
    :vars
    (
      ?auto_28270 - HOIST
      ?auto_28265 - PLACE
      ?auto_28271 - PLACE
      ?auto_28269 - HOIST
      ?auto_28267 - SURFACE
      ?auto_28268 - TRUCK
      ?auto_28266 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28270 ?auto_28265 ) ( IS-CRATE ?auto_28264 ) ( not ( = ?auto_28263 ?auto_28264 ) ) ( not ( = ?auto_28262 ?auto_28263 ) ) ( not ( = ?auto_28262 ?auto_28264 ) ) ( not ( = ?auto_28271 ?auto_28265 ) ) ( HOIST-AT ?auto_28269 ?auto_28271 ) ( not ( = ?auto_28270 ?auto_28269 ) ) ( AVAILABLE ?auto_28269 ) ( SURFACE-AT ?auto_28264 ?auto_28271 ) ( ON ?auto_28264 ?auto_28267 ) ( CLEAR ?auto_28264 ) ( not ( = ?auto_28263 ?auto_28267 ) ) ( not ( = ?auto_28264 ?auto_28267 ) ) ( not ( = ?auto_28262 ?auto_28267 ) ) ( SURFACE-AT ?auto_28262 ?auto_28265 ) ( CLEAR ?auto_28262 ) ( IS-CRATE ?auto_28263 ) ( AVAILABLE ?auto_28270 ) ( IN ?auto_28263 ?auto_28268 ) ( TRUCK-AT ?auto_28268 ?auto_28266 ) ( not ( = ?auto_28266 ?auto_28265 ) ) ( not ( = ?auto_28271 ?auto_28266 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28263 ?auto_28264 )
      ( MAKE-2CRATE-VERIFY ?auto_28262 ?auto_28263 ?auto_28264 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28272 - SURFACE
      ?auto_28273 - SURFACE
    )
    :vars
    (
      ?auto_28277 - HOIST
      ?auto_28275 - PLACE
      ?auto_28280 - SURFACE
      ?auto_28276 - PLACE
      ?auto_28274 - HOIST
      ?auto_28279 - SURFACE
      ?auto_28281 - TRUCK
      ?auto_28278 - PLACE
      ?auto_28282 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28277 ?auto_28275 ) ( IS-CRATE ?auto_28273 ) ( not ( = ?auto_28272 ?auto_28273 ) ) ( not ( = ?auto_28280 ?auto_28272 ) ) ( not ( = ?auto_28280 ?auto_28273 ) ) ( not ( = ?auto_28276 ?auto_28275 ) ) ( HOIST-AT ?auto_28274 ?auto_28276 ) ( not ( = ?auto_28277 ?auto_28274 ) ) ( AVAILABLE ?auto_28274 ) ( SURFACE-AT ?auto_28273 ?auto_28276 ) ( ON ?auto_28273 ?auto_28279 ) ( CLEAR ?auto_28273 ) ( not ( = ?auto_28272 ?auto_28279 ) ) ( not ( = ?auto_28273 ?auto_28279 ) ) ( not ( = ?auto_28280 ?auto_28279 ) ) ( SURFACE-AT ?auto_28280 ?auto_28275 ) ( CLEAR ?auto_28280 ) ( IS-CRATE ?auto_28272 ) ( AVAILABLE ?auto_28277 ) ( TRUCK-AT ?auto_28281 ?auto_28278 ) ( not ( = ?auto_28278 ?auto_28275 ) ) ( not ( = ?auto_28276 ?auto_28278 ) ) ( HOIST-AT ?auto_28282 ?auto_28278 ) ( LIFTING ?auto_28282 ?auto_28272 ) ( not ( = ?auto_28277 ?auto_28282 ) ) ( not ( = ?auto_28274 ?auto_28282 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28282 ?auto_28272 ?auto_28281 ?auto_28278 )
      ( MAKE-2CRATE ?auto_28280 ?auto_28272 ?auto_28273 )
      ( MAKE-1CRATE-VERIFY ?auto_28272 ?auto_28273 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28283 - SURFACE
      ?auto_28284 - SURFACE
      ?auto_28285 - SURFACE
    )
    :vars
    (
      ?auto_28288 - HOIST
      ?auto_28287 - PLACE
      ?auto_28290 - PLACE
      ?auto_28291 - HOIST
      ?auto_28293 - SURFACE
      ?auto_28286 - TRUCK
      ?auto_28289 - PLACE
      ?auto_28292 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28288 ?auto_28287 ) ( IS-CRATE ?auto_28285 ) ( not ( = ?auto_28284 ?auto_28285 ) ) ( not ( = ?auto_28283 ?auto_28284 ) ) ( not ( = ?auto_28283 ?auto_28285 ) ) ( not ( = ?auto_28290 ?auto_28287 ) ) ( HOIST-AT ?auto_28291 ?auto_28290 ) ( not ( = ?auto_28288 ?auto_28291 ) ) ( AVAILABLE ?auto_28291 ) ( SURFACE-AT ?auto_28285 ?auto_28290 ) ( ON ?auto_28285 ?auto_28293 ) ( CLEAR ?auto_28285 ) ( not ( = ?auto_28284 ?auto_28293 ) ) ( not ( = ?auto_28285 ?auto_28293 ) ) ( not ( = ?auto_28283 ?auto_28293 ) ) ( SURFACE-AT ?auto_28283 ?auto_28287 ) ( CLEAR ?auto_28283 ) ( IS-CRATE ?auto_28284 ) ( AVAILABLE ?auto_28288 ) ( TRUCK-AT ?auto_28286 ?auto_28289 ) ( not ( = ?auto_28289 ?auto_28287 ) ) ( not ( = ?auto_28290 ?auto_28289 ) ) ( HOIST-AT ?auto_28292 ?auto_28289 ) ( LIFTING ?auto_28292 ?auto_28284 ) ( not ( = ?auto_28288 ?auto_28292 ) ) ( not ( = ?auto_28291 ?auto_28292 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28284 ?auto_28285 )
      ( MAKE-2CRATE-VERIFY ?auto_28283 ?auto_28284 ?auto_28285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28294 - SURFACE
      ?auto_28295 - SURFACE
    )
    :vars
    (
      ?auto_28304 - HOIST
      ?auto_28303 - PLACE
      ?auto_28302 - SURFACE
      ?auto_28299 - PLACE
      ?auto_28301 - HOIST
      ?auto_28298 - SURFACE
      ?auto_28300 - TRUCK
      ?auto_28297 - PLACE
      ?auto_28296 - HOIST
      ?auto_28305 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28304 ?auto_28303 ) ( IS-CRATE ?auto_28295 ) ( not ( = ?auto_28294 ?auto_28295 ) ) ( not ( = ?auto_28302 ?auto_28294 ) ) ( not ( = ?auto_28302 ?auto_28295 ) ) ( not ( = ?auto_28299 ?auto_28303 ) ) ( HOIST-AT ?auto_28301 ?auto_28299 ) ( not ( = ?auto_28304 ?auto_28301 ) ) ( AVAILABLE ?auto_28301 ) ( SURFACE-AT ?auto_28295 ?auto_28299 ) ( ON ?auto_28295 ?auto_28298 ) ( CLEAR ?auto_28295 ) ( not ( = ?auto_28294 ?auto_28298 ) ) ( not ( = ?auto_28295 ?auto_28298 ) ) ( not ( = ?auto_28302 ?auto_28298 ) ) ( SURFACE-AT ?auto_28302 ?auto_28303 ) ( CLEAR ?auto_28302 ) ( IS-CRATE ?auto_28294 ) ( AVAILABLE ?auto_28304 ) ( TRUCK-AT ?auto_28300 ?auto_28297 ) ( not ( = ?auto_28297 ?auto_28303 ) ) ( not ( = ?auto_28299 ?auto_28297 ) ) ( HOIST-AT ?auto_28296 ?auto_28297 ) ( not ( = ?auto_28304 ?auto_28296 ) ) ( not ( = ?auto_28301 ?auto_28296 ) ) ( AVAILABLE ?auto_28296 ) ( SURFACE-AT ?auto_28294 ?auto_28297 ) ( ON ?auto_28294 ?auto_28305 ) ( CLEAR ?auto_28294 ) ( not ( = ?auto_28294 ?auto_28305 ) ) ( not ( = ?auto_28295 ?auto_28305 ) ) ( not ( = ?auto_28302 ?auto_28305 ) ) ( not ( = ?auto_28298 ?auto_28305 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28296 ?auto_28294 ?auto_28305 ?auto_28297 )
      ( MAKE-2CRATE ?auto_28302 ?auto_28294 ?auto_28295 )
      ( MAKE-1CRATE-VERIFY ?auto_28294 ?auto_28295 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28306 - SURFACE
      ?auto_28307 - SURFACE
      ?auto_28308 - SURFACE
    )
    :vars
    (
      ?auto_28317 - HOIST
      ?auto_28315 - PLACE
      ?auto_28312 - PLACE
      ?auto_28313 - HOIST
      ?auto_28316 - SURFACE
      ?auto_28314 - TRUCK
      ?auto_28311 - PLACE
      ?auto_28310 - HOIST
      ?auto_28309 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28317 ?auto_28315 ) ( IS-CRATE ?auto_28308 ) ( not ( = ?auto_28307 ?auto_28308 ) ) ( not ( = ?auto_28306 ?auto_28307 ) ) ( not ( = ?auto_28306 ?auto_28308 ) ) ( not ( = ?auto_28312 ?auto_28315 ) ) ( HOIST-AT ?auto_28313 ?auto_28312 ) ( not ( = ?auto_28317 ?auto_28313 ) ) ( AVAILABLE ?auto_28313 ) ( SURFACE-AT ?auto_28308 ?auto_28312 ) ( ON ?auto_28308 ?auto_28316 ) ( CLEAR ?auto_28308 ) ( not ( = ?auto_28307 ?auto_28316 ) ) ( not ( = ?auto_28308 ?auto_28316 ) ) ( not ( = ?auto_28306 ?auto_28316 ) ) ( SURFACE-AT ?auto_28306 ?auto_28315 ) ( CLEAR ?auto_28306 ) ( IS-CRATE ?auto_28307 ) ( AVAILABLE ?auto_28317 ) ( TRUCK-AT ?auto_28314 ?auto_28311 ) ( not ( = ?auto_28311 ?auto_28315 ) ) ( not ( = ?auto_28312 ?auto_28311 ) ) ( HOIST-AT ?auto_28310 ?auto_28311 ) ( not ( = ?auto_28317 ?auto_28310 ) ) ( not ( = ?auto_28313 ?auto_28310 ) ) ( AVAILABLE ?auto_28310 ) ( SURFACE-AT ?auto_28307 ?auto_28311 ) ( ON ?auto_28307 ?auto_28309 ) ( CLEAR ?auto_28307 ) ( not ( = ?auto_28307 ?auto_28309 ) ) ( not ( = ?auto_28308 ?auto_28309 ) ) ( not ( = ?auto_28306 ?auto_28309 ) ) ( not ( = ?auto_28316 ?auto_28309 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28307 ?auto_28308 )
      ( MAKE-2CRATE-VERIFY ?auto_28306 ?auto_28307 ?auto_28308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28318 - SURFACE
      ?auto_28319 - SURFACE
    )
    :vars
    (
      ?auto_28323 - HOIST
      ?auto_28320 - PLACE
      ?auto_28321 - SURFACE
      ?auto_28328 - PLACE
      ?auto_28325 - HOIST
      ?auto_28327 - SURFACE
      ?auto_28329 - PLACE
      ?auto_28326 - HOIST
      ?auto_28324 - SURFACE
      ?auto_28322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28323 ?auto_28320 ) ( IS-CRATE ?auto_28319 ) ( not ( = ?auto_28318 ?auto_28319 ) ) ( not ( = ?auto_28321 ?auto_28318 ) ) ( not ( = ?auto_28321 ?auto_28319 ) ) ( not ( = ?auto_28328 ?auto_28320 ) ) ( HOIST-AT ?auto_28325 ?auto_28328 ) ( not ( = ?auto_28323 ?auto_28325 ) ) ( AVAILABLE ?auto_28325 ) ( SURFACE-AT ?auto_28319 ?auto_28328 ) ( ON ?auto_28319 ?auto_28327 ) ( CLEAR ?auto_28319 ) ( not ( = ?auto_28318 ?auto_28327 ) ) ( not ( = ?auto_28319 ?auto_28327 ) ) ( not ( = ?auto_28321 ?auto_28327 ) ) ( SURFACE-AT ?auto_28321 ?auto_28320 ) ( CLEAR ?auto_28321 ) ( IS-CRATE ?auto_28318 ) ( AVAILABLE ?auto_28323 ) ( not ( = ?auto_28329 ?auto_28320 ) ) ( not ( = ?auto_28328 ?auto_28329 ) ) ( HOIST-AT ?auto_28326 ?auto_28329 ) ( not ( = ?auto_28323 ?auto_28326 ) ) ( not ( = ?auto_28325 ?auto_28326 ) ) ( AVAILABLE ?auto_28326 ) ( SURFACE-AT ?auto_28318 ?auto_28329 ) ( ON ?auto_28318 ?auto_28324 ) ( CLEAR ?auto_28318 ) ( not ( = ?auto_28318 ?auto_28324 ) ) ( not ( = ?auto_28319 ?auto_28324 ) ) ( not ( = ?auto_28321 ?auto_28324 ) ) ( not ( = ?auto_28327 ?auto_28324 ) ) ( TRUCK-AT ?auto_28322 ?auto_28320 ) )
    :subtasks
    ( ( !DRIVE ?auto_28322 ?auto_28320 ?auto_28329 )
      ( MAKE-2CRATE ?auto_28321 ?auto_28318 ?auto_28319 )
      ( MAKE-1CRATE-VERIFY ?auto_28318 ?auto_28319 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28330 - SURFACE
      ?auto_28331 - SURFACE
      ?auto_28332 - SURFACE
    )
    :vars
    (
      ?auto_28341 - HOIST
      ?auto_28335 - PLACE
      ?auto_28339 - PLACE
      ?auto_28333 - HOIST
      ?auto_28334 - SURFACE
      ?auto_28338 - PLACE
      ?auto_28340 - HOIST
      ?auto_28336 - SURFACE
      ?auto_28337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28341 ?auto_28335 ) ( IS-CRATE ?auto_28332 ) ( not ( = ?auto_28331 ?auto_28332 ) ) ( not ( = ?auto_28330 ?auto_28331 ) ) ( not ( = ?auto_28330 ?auto_28332 ) ) ( not ( = ?auto_28339 ?auto_28335 ) ) ( HOIST-AT ?auto_28333 ?auto_28339 ) ( not ( = ?auto_28341 ?auto_28333 ) ) ( AVAILABLE ?auto_28333 ) ( SURFACE-AT ?auto_28332 ?auto_28339 ) ( ON ?auto_28332 ?auto_28334 ) ( CLEAR ?auto_28332 ) ( not ( = ?auto_28331 ?auto_28334 ) ) ( not ( = ?auto_28332 ?auto_28334 ) ) ( not ( = ?auto_28330 ?auto_28334 ) ) ( SURFACE-AT ?auto_28330 ?auto_28335 ) ( CLEAR ?auto_28330 ) ( IS-CRATE ?auto_28331 ) ( AVAILABLE ?auto_28341 ) ( not ( = ?auto_28338 ?auto_28335 ) ) ( not ( = ?auto_28339 ?auto_28338 ) ) ( HOIST-AT ?auto_28340 ?auto_28338 ) ( not ( = ?auto_28341 ?auto_28340 ) ) ( not ( = ?auto_28333 ?auto_28340 ) ) ( AVAILABLE ?auto_28340 ) ( SURFACE-AT ?auto_28331 ?auto_28338 ) ( ON ?auto_28331 ?auto_28336 ) ( CLEAR ?auto_28331 ) ( not ( = ?auto_28331 ?auto_28336 ) ) ( not ( = ?auto_28332 ?auto_28336 ) ) ( not ( = ?auto_28330 ?auto_28336 ) ) ( not ( = ?auto_28334 ?auto_28336 ) ) ( TRUCK-AT ?auto_28337 ?auto_28335 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28331 ?auto_28332 )
      ( MAKE-2CRATE-VERIFY ?auto_28330 ?auto_28331 ?auto_28332 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28351 - SURFACE
      ?auto_28352 - SURFACE
    )
    :vars
    (
      ?auto_28353 - HOIST
      ?auto_28354 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28353 ?auto_28354 ) ( SURFACE-AT ?auto_28351 ?auto_28354 ) ( CLEAR ?auto_28351 ) ( LIFTING ?auto_28353 ?auto_28352 ) ( IS-CRATE ?auto_28352 ) ( not ( = ?auto_28351 ?auto_28352 ) ) )
    :subtasks
    ( ( !DROP ?auto_28353 ?auto_28352 ?auto_28351 ?auto_28354 )
      ( MAKE-1CRATE-VERIFY ?auto_28351 ?auto_28352 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28355 - SURFACE
      ?auto_28356 - SURFACE
      ?auto_28357 - SURFACE
    )
    :vars
    (
      ?auto_28358 - HOIST
      ?auto_28359 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28358 ?auto_28359 ) ( SURFACE-AT ?auto_28356 ?auto_28359 ) ( CLEAR ?auto_28356 ) ( LIFTING ?auto_28358 ?auto_28357 ) ( IS-CRATE ?auto_28357 ) ( not ( = ?auto_28356 ?auto_28357 ) ) ( ON ?auto_28356 ?auto_28355 ) ( not ( = ?auto_28355 ?auto_28356 ) ) ( not ( = ?auto_28355 ?auto_28357 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28356 ?auto_28357 )
      ( MAKE-2CRATE-VERIFY ?auto_28355 ?auto_28356 ?auto_28357 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28360 - SURFACE
      ?auto_28361 - SURFACE
      ?auto_28362 - SURFACE
      ?auto_28363 - SURFACE
    )
    :vars
    (
      ?auto_28364 - HOIST
      ?auto_28365 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28364 ?auto_28365 ) ( SURFACE-AT ?auto_28362 ?auto_28365 ) ( CLEAR ?auto_28362 ) ( LIFTING ?auto_28364 ?auto_28363 ) ( IS-CRATE ?auto_28363 ) ( not ( = ?auto_28362 ?auto_28363 ) ) ( ON ?auto_28361 ?auto_28360 ) ( ON ?auto_28362 ?auto_28361 ) ( not ( = ?auto_28360 ?auto_28361 ) ) ( not ( = ?auto_28360 ?auto_28362 ) ) ( not ( = ?auto_28360 ?auto_28363 ) ) ( not ( = ?auto_28361 ?auto_28362 ) ) ( not ( = ?auto_28361 ?auto_28363 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28362 ?auto_28363 )
      ( MAKE-3CRATE-VERIFY ?auto_28360 ?auto_28361 ?auto_28362 ?auto_28363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28366 - SURFACE
      ?auto_28367 - SURFACE
    )
    :vars
    (
      ?auto_28368 - HOIST
      ?auto_28369 - PLACE
      ?auto_28370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28368 ?auto_28369 ) ( SURFACE-AT ?auto_28366 ?auto_28369 ) ( CLEAR ?auto_28366 ) ( IS-CRATE ?auto_28367 ) ( not ( = ?auto_28366 ?auto_28367 ) ) ( TRUCK-AT ?auto_28370 ?auto_28369 ) ( AVAILABLE ?auto_28368 ) ( IN ?auto_28367 ?auto_28370 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28368 ?auto_28367 ?auto_28370 ?auto_28369 )
      ( MAKE-1CRATE ?auto_28366 ?auto_28367 )
      ( MAKE-1CRATE-VERIFY ?auto_28366 ?auto_28367 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28371 - SURFACE
      ?auto_28372 - SURFACE
      ?auto_28373 - SURFACE
    )
    :vars
    (
      ?auto_28374 - HOIST
      ?auto_28375 - PLACE
      ?auto_28376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28374 ?auto_28375 ) ( SURFACE-AT ?auto_28372 ?auto_28375 ) ( CLEAR ?auto_28372 ) ( IS-CRATE ?auto_28373 ) ( not ( = ?auto_28372 ?auto_28373 ) ) ( TRUCK-AT ?auto_28376 ?auto_28375 ) ( AVAILABLE ?auto_28374 ) ( IN ?auto_28373 ?auto_28376 ) ( ON ?auto_28372 ?auto_28371 ) ( not ( = ?auto_28371 ?auto_28372 ) ) ( not ( = ?auto_28371 ?auto_28373 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28372 ?auto_28373 )
      ( MAKE-2CRATE-VERIFY ?auto_28371 ?auto_28372 ?auto_28373 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28377 - SURFACE
      ?auto_28378 - SURFACE
      ?auto_28379 - SURFACE
      ?auto_28380 - SURFACE
    )
    :vars
    (
      ?auto_28382 - HOIST
      ?auto_28381 - PLACE
      ?auto_28383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28382 ?auto_28381 ) ( SURFACE-AT ?auto_28379 ?auto_28381 ) ( CLEAR ?auto_28379 ) ( IS-CRATE ?auto_28380 ) ( not ( = ?auto_28379 ?auto_28380 ) ) ( TRUCK-AT ?auto_28383 ?auto_28381 ) ( AVAILABLE ?auto_28382 ) ( IN ?auto_28380 ?auto_28383 ) ( ON ?auto_28379 ?auto_28378 ) ( not ( = ?auto_28378 ?auto_28379 ) ) ( not ( = ?auto_28378 ?auto_28380 ) ) ( ON ?auto_28378 ?auto_28377 ) ( not ( = ?auto_28377 ?auto_28378 ) ) ( not ( = ?auto_28377 ?auto_28379 ) ) ( not ( = ?auto_28377 ?auto_28380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28378 ?auto_28379 ?auto_28380 )
      ( MAKE-3CRATE-VERIFY ?auto_28377 ?auto_28378 ?auto_28379 ?auto_28380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28384 - SURFACE
      ?auto_28385 - SURFACE
    )
    :vars
    (
      ?auto_28388 - HOIST
      ?auto_28386 - PLACE
      ?auto_28389 - TRUCK
      ?auto_28387 - SURFACE
      ?auto_28390 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28388 ?auto_28386 ) ( SURFACE-AT ?auto_28384 ?auto_28386 ) ( CLEAR ?auto_28384 ) ( IS-CRATE ?auto_28385 ) ( not ( = ?auto_28384 ?auto_28385 ) ) ( AVAILABLE ?auto_28388 ) ( IN ?auto_28385 ?auto_28389 ) ( ON ?auto_28384 ?auto_28387 ) ( not ( = ?auto_28387 ?auto_28384 ) ) ( not ( = ?auto_28387 ?auto_28385 ) ) ( TRUCK-AT ?auto_28389 ?auto_28390 ) ( not ( = ?auto_28390 ?auto_28386 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28389 ?auto_28390 ?auto_28386 )
      ( MAKE-2CRATE ?auto_28387 ?auto_28384 ?auto_28385 )
      ( MAKE-1CRATE-VERIFY ?auto_28384 ?auto_28385 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28391 - SURFACE
      ?auto_28392 - SURFACE
      ?auto_28393 - SURFACE
    )
    :vars
    (
      ?auto_28395 - HOIST
      ?auto_28396 - PLACE
      ?auto_28397 - TRUCK
      ?auto_28394 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28395 ?auto_28396 ) ( SURFACE-AT ?auto_28392 ?auto_28396 ) ( CLEAR ?auto_28392 ) ( IS-CRATE ?auto_28393 ) ( not ( = ?auto_28392 ?auto_28393 ) ) ( AVAILABLE ?auto_28395 ) ( IN ?auto_28393 ?auto_28397 ) ( ON ?auto_28392 ?auto_28391 ) ( not ( = ?auto_28391 ?auto_28392 ) ) ( not ( = ?auto_28391 ?auto_28393 ) ) ( TRUCK-AT ?auto_28397 ?auto_28394 ) ( not ( = ?auto_28394 ?auto_28396 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28392 ?auto_28393 )
      ( MAKE-2CRATE-VERIFY ?auto_28391 ?auto_28392 ?auto_28393 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28398 - SURFACE
      ?auto_28399 - SURFACE
      ?auto_28400 - SURFACE
      ?auto_28401 - SURFACE
    )
    :vars
    (
      ?auto_28404 - HOIST
      ?auto_28403 - PLACE
      ?auto_28402 - TRUCK
      ?auto_28405 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28404 ?auto_28403 ) ( SURFACE-AT ?auto_28400 ?auto_28403 ) ( CLEAR ?auto_28400 ) ( IS-CRATE ?auto_28401 ) ( not ( = ?auto_28400 ?auto_28401 ) ) ( AVAILABLE ?auto_28404 ) ( IN ?auto_28401 ?auto_28402 ) ( ON ?auto_28400 ?auto_28399 ) ( not ( = ?auto_28399 ?auto_28400 ) ) ( not ( = ?auto_28399 ?auto_28401 ) ) ( TRUCK-AT ?auto_28402 ?auto_28405 ) ( not ( = ?auto_28405 ?auto_28403 ) ) ( ON ?auto_28399 ?auto_28398 ) ( not ( = ?auto_28398 ?auto_28399 ) ) ( not ( = ?auto_28398 ?auto_28400 ) ) ( not ( = ?auto_28398 ?auto_28401 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28399 ?auto_28400 ?auto_28401 )
      ( MAKE-3CRATE-VERIFY ?auto_28398 ?auto_28399 ?auto_28400 ?auto_28401 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28406 - SURFACE
      ?auto_28407 - SURFACE
    )
    :vars
    (
      ?auto_28410 - HOIST
      ?auto_28409 - PLACE
      ?auto_28412 - SURFACE
      ?auto_28408 - TRUCK
      ?auto_28411 - PLACE
      ?auto_28413 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28410 ?auto_28409 ) ( SURFACE-AT ?auto_28406 ?auto_28409 ) ( CLEAR ?auto_28406 ) ( IS-CRATE ?auto_28407 ) ( not ( = ?auto_28406 ?auto_28407 ) ) ( AVAILABLE ?auto_28410 ) ( ON ?auto_28406 ?auto_28412 ) ( not ( = ?auto_28412 ?auto_28406 ) ) ( not ( = ?auto_28412 ?auto_28407 ) ) ( TRUCK-AT ?auto_28408 ?auto_28411 ) ( not ( = ?auto_28411 ?auto_28409 ) ) ( HOIST-AT ?auto_28413 ?auto_28411 ) ( LIFTING ?auto_28413 ?auto_28407 ) ( not ( = ?auto_28410 ?auto_28413 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28413 ?auto_28407 ?auto_28408 ?auto_28411 )
      ( MAKE-2CRATE ?auto_28412 ?auto_28406 ?auto_28407 )
      ( MAKE-1CRATE-VERIFY ?auto_28406 ?auto_28407 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28414 - SURFACE
      ?auto_28415 - SURFACE
      ?auto_28416 - SURFACE
    )
    :vars
    (
      ?auto_28420 - HOIST
      ?auto_28417 - PLACE
      ?auto_28421 - TRUCK
      ?auto_28418 - PLACE
      ?auto_28419 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28420 ?auto_28417 ) ( SURFACE-AT ?auto_28415 ?auto_28417 ) ( CLEAR ?auto_28415 ) ( IS-CRATE ?auto_28416 ) ( not ( = ?auto_28415 ?auto_28416 ) ) ( AVAILABLE ?auto_28420 ) ( ON ?auto_28415 ?auto_28414 ) ( not ( = ?auto_28414 ?auto_28415 ) ) ( not ( = ?auto_28414 ?auto_28416 ) ) ( TRUCK-AT ?auto_28421 ?auto_28418 ) ( not ( = ?auto_28418 ?auto_28417 ) ) ( HOIST-AT ?auto_28419 ?auto_28418 ) ( LIFTING ?auto_28419 ?auto_28416 ) ( not ( = ?auto_28420 ?auto_28419 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28415 ?auto_28416 )
      ( MAKE-2CRATE-VERIFY ?auto_28414 ?auto_28415 ?auto_28416 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28422 - SURFACE
      ?auto_28423 - SURFACE
      ?auto_28424 - SURFACE
      ?auto_28425 - SURFACE
    )
    :vars
    (
      ?auto_28428 - HOIST
      ?auto_28429 - PLACE
      ?auto_28427 - TRUCK
      ?auto_28426 - PLACE
      ?auto_28430 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28428 ?auto_28429 ) ( SURFACE-AT ?auto_28424 ?auto_28429 ) ( CLEAR ?auto_28424 ) ( IS-CRATE ?auto_28425 ) ( not ( = ?auto_28424 ?auto_28425 ) ) ( AVAILABLE ?auto_28428 ) ( ON ?auto_28424 ?auto_28423 ) ( not ( = ?auto_28423 ?auto_28424 ) ) ( not ( = ?auto_28423 ?auto_28425 ) ) ( TRUCK-AT ?auto_28427 ?auto_28426 ) ( not ( = ?auto_28426 ?auto_28429 ) ) ( HOIST-AT ?auto_28430 ?auto_28426 ) ( LIFTING ?auto_28430 ?auto_28425 ) ( not ( = ?auto_28428 ?auto_28430 ) ) ( ON ?auto_28423 ?auto_28422 ) ( not ( = ?auto_28422 ?auto_28423 ) ) ( not ( = ?auto_28422 ?auto_28424 ) ) ( not ( = ?auto_28422 ?auto_28425 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28423 ?auto_28424 ?auto_28425 )
      ( MAKE-3CRATE-VERIFY ?auto_28422 ?auto_28423 ?auto_28424 ?auto_28425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28431 - SURFACE
      ?auto_28432 - SURFACE
    )
    :vars
    (
      ?auto_28436 - HOIST
      ?auto_28437 - PLACE
      ?auto_28434 - SURFACE
      ?auto_28435 - TRUCK
      ?auto_28433 - PLACE
      ?auto_28438 - HOIST
      ?auto_28439 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28436 ?auto_28437 ) ( SURFACE-AT ?auto_28431 ?auto_28437 ) ( CLEAR ?auto_28431 ) ( IS-CRATE ?auto_28432 ) ( not ( = ?auto_28431 ?auto_28432 ) ) ( AVAILABLE ?auto_28436 ) ( ON ?auto_28431 ?auto_28434 ) ( not ( = ?auto_28434 ?auto_28431 ) ) ( not ( = ?auto_28434 ?auto_28432 ) ) ( TRUCK-AT ?auto_28435 ?auto_28433 ) ( not ( = ?auto_28433 ?auto_28437 ) ) ( HOIST-AT ?auto_28438 ?auto_28433 ) ( not ( = ?auto_28436 ?auto_28438 ) ) ( AVAILABLE ?auto_28438 ) ( SURFACE-AT ?auto_28432 ?auto_28433 ) ( ON ?auto_28432 ?auto_28439 ) ( CLEAR ?auto_28432 ) ( not ( = ?auto_28431 ?auto_28439 ) ) ( not ( = ?auto_28432 ?auto_28439 ) ) ( not ( = ?auto_28434 ?auto_28439 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28438 ?auto_28432 ?auto_28439 ?auto_28433 )
      ( MAKE-2CRATE ?auto_28434 ?auto_28431 ?auto_28432 )
      ( MAKE-1CRATE-VERIFY ?auto_28431 ?auto_28432 ) )
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
      ?auto_28448 - HOIST
      ?auto_28445 - PLACE
      ?auto_28443 - TRUCK
      ?auto_28447 - PLACE
      ?auto_28446 - HOIST
      ?auto_28444 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28448 ?auto_28445 ) ( SURFACE-AT ?auto_28441 ?auto_28445 ) ( CLEAR ?auto_28441 ) ( IS-CRATE ?auto_28442 ) ( not ( = ?auto_28441 ?auto_28442 ) ) ( AVAILABLE ?auto_28448 ) ( ON ?auto_28441 ?auto_28440 ) ( not ( = ?auto_28440 ?auto_28441 ) ) ( not ( = ?auto_28440 ?auto_28442 ) ) ( TRUCK-AT ?auto_28443 ?auto_28447 ) ( not ( = ?auto_28447 ?auto_28445 ) ) ( HOIST-AT ?auto_28446 ?auto_28447 ) ( not ( = ?auto_28448 ?auto_28446 ) ) ( AVAILABLE ?auto_28446 ) ( SURFACE-AT ?auto_28442 ?auto_28447 ) ( ON ?auto_28442 ?auto_28444 ) ( CLEAR ?auto_28442 ) ( not ( = ?auto_28441 ?auto_28444 ) ) ( not ( = ?auto_28442 ?auto_28444 ) ) ( not ( = ?auto_28440 ?auto_28444 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28441 ?auto_28442 )
      ( MAKE-2CRATE-VERIFY ?auto_28440 ?auto_28441 ?auto_28442 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28449 - SURFACE
      ?auto_28450 - SURFACE
      ?auto_28451 - SURFACE
      ?auto_28452 - SURFACE
    )
    :vars
    (
      ?auto_28456 - HOIST
      ?auto_28455 - PLACE
      ?auto_28454 - TRUCK
      ?auto_28458 - PLACE
      ?auto_28457 - HOIST
      ?auto_28453 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28456 ?auto_28455 ) ( SURFACE-AT ?auto_28451 ?auto_28455 ) ( CLEAR ?auto_28451 ) ( IS-CRATE ?auto_28452 ) ( not ( = ?auto_28451 ?auto_28452 ) ) ( AVAILABLE ?auto_28456 ) ( ON ?auto_28451 ?auto_28450 ) ( not ( = ?auto_28450 ?auto_28451 ) ) ( not ( = ?auto_28450 ?auto_28452 ) ) ( TRUCK-AT ?auto_28454 ?auto_28458 ) ( not ( = ?auto_28458 ?auto_28455 ) ) ( HOIST-AT ?auto_28457 ?auto_28458 ) ( not ( = ?auto_28456 ?auto_28457 ) ) ( AVAILABLE ?auto_28457 ) ( SURFACE-AT ?auto_28452 ?auto_28458 ) ( ON ?auto_28452 ?auto_28453 ) ( CLEAR ?auto_28452 ) ( not ( = ?auto_28451 ?auto_28453 ) ) ( not ( = ?auto_28452 ?auto_28453 ) ) ( not ( = ?auto_28450 ?auto_28453 ) ) ( ON ?auto_28450 ?auto_28449 ) ( not ( = ?auto_28449 ?auto_28450 ) ) ( not ( = ?auto_28449 ?auto_28451 ) ) ( not ( = ?auto_28449 ?auto_28452 ) ) ( not ( = ?auto_28449 ?auto_28453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28450 ?auto_28451 ?auto_28452 )
      ( MAKE-3CRATE-VERIFY ?auto_28449 ?auto_28450 ?auto_28451 ?auto_28452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28459 - SURFACE
      ?auto_28460 - SURFACE
    )
    :vars
    (
      ?auto_28465 - HOIST
      ?auto_28463 - PLACE
      ?auto_28464 - SURFACE
      ?auto_28467 - PLACE
      ?auto_28466 - HOIST
      ?auto_28461 - SURFACE
      ?auto_28462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28465 ?auto_28463 ) ( SURFACE-AT ?auto_28459 ?auto_28463 ) ( CLEAR ?auto_28459 ) ( IS-CRATE ?auto_28460 ) ( not ( = ?auto_28459 ?auto_28460 ) ) ( AVAILABLE ?auto_28465 ) ( ON ?auto_28459 ?auto_28464 ) ( not ( = ?auto_28464 ?auto_28459 ) ) ( not ( = ?auto_28464 ?auto_28460 ) ) ( not ( = ?auto_28467 ?auto_28463 ) ) ( HOIST-AT ?auto_28466 ?auto_28467 ) ( not ( = ?auto_28465 ?auto_28466 ) ) ( AVAILABLE ?auto_28466 ) ( SURFACE-AT ?auto_28460 ?auto_28467 ) ( ON ?auto_28460 ?auto_28461 ) ( CLEAR ?auto_28460 ) ( not ( = ?auto_28459 ?auto_28461 ) ) ( not ( = ?auto_28460 ?auto_28461 ) ) ( not ( = ?auto_28464 ?auto_28461 ) ) ( TRUCK-AT ?auto_28462 ?auto_28463 ) )
    :subtasks
    ( ( !DRIVE ?auto_28462 ?auto_28463 ?auto_28467 )
      ( MAKE-2CRATE ?auto_28464 ?auto_28459 ?auto_28460 )
      ( MAKE-1CRATE-VERIFY ?auto_28459 ?auto_28460 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28468 - SURFACE
      ?auto_28469 - SURFACE
      ?auto_28470 - SURFACE
    )
    :vars
    (
      ?auto_28476 - HOIST
      ?auto_28472 - PLACE
      ?auto_28471 - PLACE
      ?auto_28474 - HOIST
      ?auto_28473 - SURFACE
      ?auto_28475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28476 ?auto_28472 ) ( SURFACE-AT ?auto_28469 ?auto_28472 ) ( CLEAR ?auto_28469 ) ( IS-CRATE ?auto_28470 ) ( not ( = ?auto_28469 ?auto_28470 ) ) ( AVAILABLE ?auto_28476 ) ( ON ?auto_28469 ?auto_28468 ) ( not ( = ?auto_28468 ?auto_28469 ) ) ( not ( = ?auto_28468 ?auto_28470 ) ) ( not ( = ?auto_28471 ?auto_28472 ) ) ( HOIST-AT ?auto_28474 ?auto_28471 ) ( not ( = ?auto_28476 ?auto_28474 ) ) ( AVAILABLE ?auto_28474 ) ( SURFACE-AT ?auto_28470 ?auto_28471 ) ( ON ?auto_28470 ?auto_28473 ) ( CLEAR ?auto_28470 ) ( not ( = ?auto_28469 ?auto_28473 ) ) ( not ( = ?auto_28470 ?auto_28473 ) ) ( not ( = ?auto_28468 ?auto_28473 ) ) ( TRUCK-AT ?auto_28475 ?auto_28472 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28469 ?auto_28470 )
      ( MAKE-2CRATE-VERIFY ?auto_28468 ?auto_28469 ?auto_28470 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28477 - SURFACE
      ?auto_28478 - SURFACE
      ?auto_28479 - SURFACE
      ?auto_28480 - SURFACE
    )
    :vars
    (
      ?auto_28484 - HOIST
      ?auto_28486 - PLACE
      ?auto_28481 - PLACE
      ?auto_28483 - HOIST
      ?auto_28485 - SURFACE
      ?auto_28482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28484 ?auto_28486 ) ( SURFACE-AT ?auto_28479 ?auto_28486 ) ( CLEAR ?auto_28479 ) ( IS-CRATE ?auto_28480 ) ( not ( = ?auto_28479 ?auto_28480 ) ) ( AVAILABLE ?auto_28484 ) ( ON ?auto_28479 ?auto_28478 ) ( not ( = ?auto_28478 ?auto_28479 ) ) ( not ( = ?auto_28478 ?auto_28480 ) ) ( not ( = ?auto_28481 ?auto_28486 ) ) ( HOIST-AT ?auto_28483 ?auto_28481 ) ( not ( = ?auto_28484 ?auto_28483 ) ) ( AVAILABLE ?auto_28483 ) ( SURFACE-AT ?auto_28480 ?auto_28481 ) ( ON ?auto_28480 ?auto_28485 ) ( CLEAR ?auto_28480 ) ( not ( = ?auto_28479 ?auto_28485 ) ) ( not ( = ?auto_28480 ?auto_28485 ) ) ( not ( = ?auto_28478 ?auto_28485 ) ) ( TRUCK-AT ?auto_28482 ?auto_28486 ) ( ON ?auto_28478 ?auto_28477 ) ( not ( = ?auto_28477 ?auto_28478 ) ) ( not ( = ?auto_28477 ?auto_28479 ) ) ( not ( = ?auto_28477 ?auto_28480 ) ) ( not ( = ?auto_28477 ?auto_28485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28478 ?auto_28479 ?auto_28480 )
      ( MAKE-3CRATE-VERIFY ?auto_28477 ?auto_28478 ?auto_28479 ?auto_28480 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28487 - SURFACE
      ?auto_28488 - SURFACE
    )
    :vars
    (
      ?auto_28492 - HOIST
      ?auto_28495 - PLACE
      ?auto_28493 - SURFACE
      ?auto_28489 - PLACE
      ?auto_28491 - HOIST
      ?auto_28494 - SURFACE
      ?auto_28490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28492 ?auto_28495 ) ( IS-CRATE ?auto_28488 ) ( not ( = ?auto_28487 ?auto_28488 ) ) ( not ( = ?auto_28493 ?auto_28487 ) ) ( not ( = ?auto_28493 ?auto_28488 ) ) ( not ( = ?auto_28489 ?auto_28495 ) ) ( HOIST-AT ?auto_28491 ?auto_28489 ) ( not ( = ?auto_28492 ?auto_28491 ) ) ( AVAILABLE ?auto_28491 ) ( SURFACE-AT ?auto_28488 ?auto_28489 ) ( ON ?auto_28488 ?auto_28494 ) ( CLEAR ?auto_28488 ) ( not ( = ?auto_28487 ?auto_28494 ) ) ( not ( = ?auto_28488 ?auto_28494 ) ) ( not ( = ?auto_28493 ?auto_28494 ) ) ( TRUCK-AT ?auto_28490 ?auto_28495 ) ( SURFACE-AT ?auto_28493 ?auto_28495 ) ( CLEAR ?auto_28493 ) ( LIFTING ?auto_28492 ?auto_28487 ) ( IS-CRATE ?auto_28487 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28493 ?auto_28487 )
      ( MAKE-2CRATE ?auto_28493 ?auto_28487 ?auto_28488 )
      ( MAKE-1CRATE-VERIFY ?auto_28487 ?auto_28488 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28496 - SURFACE
      ?auto_28497 - SURFACE
      ?auto_28498 - SURFACE
    )
    :vars
    (
      ?auto_28504 - HOIST
      ?auto_28500 - PLACE
      ?auto_28502 - PLACE
      ?auto_28503 - HOIST
      ?auto_28499 - SURFACE
      ?auto_28501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28504 ?auto_28500 ) ( IS-CRATE ?auto_28498 ) ( not ( = ?auto_28497 ?auto_28498 ) ) ( not ( = ?auto_28496 ?auto_28497 ) ) ( not ( = ?auto_28496 ?auto_28498 ) ) ( not ( = ?auto_28502 ?auto_28500 ) ) ( HOIST-AT ?auto_28503 ?auto_28502 ) ( not ( = ?auto_28504 ?auto_28503 ) ) ( AVAILABLE ?auto_28503 ) ( SURFACE-AT ?auto_28498 ?auto_28502 ) ( ON ?auto_28498 ?auto_28499 ) ( CLEAR ?auto_28498 ) ( not ( = ?auto_28497 ?auto_28499 ) ) ( not ( = ?auto_28498 ?auto_28499 ) ) ( not ( = ?auto_28496 ?auto_28499 ) ) ( TRUCK-AT ?auto_28501 ?auto_28500 ) ( SURFACE-AT ?auto_28496 ?auto_28500 ) ( CLEAR ?auto_28496 ) ( LIFTING ?auto_28504 ?auto_28497 ) ( IS-CRATE ?auto_28497 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28497 ?auto_28498 )
      ( MAKE-2CRATE-VERIFY ?auto_28496 ?auto_28497 ?auto_28498 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28505 - SURFACE
      ?auto_28506 - SURFACE
      ?auto_28507 - SURFACE
      ?auto_28508 - SURFACE
    )
    :vars
    (
      ?auto_28510 - HOIST
      ?auto_28511 - PLACE
      ?auto_28509 - PLACE
      ?auto_28514 - HOIST
      ?auto_28512 - SURFACE
      ?auto_28513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28510 ?auto_28511 ) ( IS-CRATE ?auto_28508 ) ( not ( = ?auto_28507 ?auto_28508 ) ) ( not ( = ?auto_28506 ?auto_28507 ) ) ( not ( = ?auto_28506 ?auto_28508 ) ) ( not ( = ?auto_28509 ?auto_28511 ) ) ( HOIST-AT ?auto_28514 ?auto_28509 ) ( not ( = ?auto_28510 ?auto_28514 ) ) ( AVAILABLE ?auto_28514 ) ( SURFACE-AT ?auto_28508 ?auto_28509 ) ( ON ?auto_28508 ?auto_28512 ) ( CLEAR ?auto_28508 ) ( not ( = ?auto_28507 ?auto_28512 ) ) ( not ( = ?auto_28508 ?auto_28512 ) ) ( not ( = ?auto_28506 ?auto_28512 ) ) ( TRUCK-AT ?auto_28513 ?auto_28511 ) ( SURFACE-AT ?auto_28506 ?auto_28511 ) ( CLEAR ?auto_28506 ) ( LIFTING ?auto_28510 ?auto_28507 ) ( IS-CRATE ?auto_28507 ) ( ON ?auto_28506 ?auto_28505 ) ( not ( = ?auto_28505 ?auto_28506 ) ) ( not ( = ?auto_28505 ?auto_28507 ) ) ( not ( = ?auto_28505 ?auto_28508 ) ) ( not ( = ?auto_28505 ?auto_28512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28506 ?auto_28507 ?auto_28508 )
      ( MAKE-3CRATE-VERIFY ?auto_28505 ?auto_28506 ?auto_28507 ?auto_28508 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28515 - SURFACE
      ?auto_28516 - SURFACE
    )
    :vars
    (
      ?auto_28518 - HOIST
      ?auto_28520 - PLACE
      ?auto_28519 - SURFACE
      ?auto_28517 - PLACE
      ?auto_28523 - HOIST
      ?auto_28521 - SURFACE
      ?auto_28522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28518 ?auto_28520 ) ( IS-CRATE ?auto_28516 ) ( not ( = ?auto_28515 ?auto_28516 ) ) ( not ( = ?auto_28519 ?auto_28515 ) ) ( not ( = ?auto_28519 ?auto_28516 ) ) ( not ( = ?auto_28517 ?auto_28520 ) ) ( HOIST-AT ?auto_28523 ?auto_28517 ) ( not ( = ?auto_28518 ?auto_28523 ) ) ( AVAILABLE ?auto_28523 ) ( SURFACE-AT ?auto_28516 ?auto_28517 ) ( ON ?auto_28516 ?auto_28521 ) ( CLEAR ?auto_28516 ) ( not ( = ?auto_28515 ?auto_28521 ) ) ( not ( = ?auto_28516 ?auto_28521 ) ) ( not ( = ?auto_28519 ?auto_28521 ) ) ( TRUCK-AT ?auto_28522 ?auto_28520 ) ( SURFACE-AT ?auto_28519 ?auto_28520 ) ( CLEAR ?auto_28519 ) ( IS-CRATE ?auto_28515 ) ( AVAILABLE ?auto_28518 ) ( IN ?auto_28515 ?auto_28522 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28518 ?auto_28515 ?auto_28522 ?auto_28520 )
      ( MAKE-2CRATE ?auto_28519 ?auto_28515 ?auto_28516 )
      ( MAKE-1CRATE-VERIFY ?auto_28515 ?auto_28516 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28524 - SURFACE
      ?auto_28525 - SURFACE
      ?auto_28526 - SURFACE
    )
    :vars
    (
      ?auto_28532 - HOIST
      ?auto_28528 - PLACE
      ?auto_28530 - PLACE
      ?auto_28531 - HOIST
      ?auto_28527 - SURFACE
      ?auto_28529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28532 ?auto_28528 ) ( IS-CRATE ?auto_28526 ) ( not ( = ?auto_28525 ?auto_28526 ) ) ( not ( = ?auto_28524 ?auto_28525 ) ) ( not ( = ?auto_28524 ?auto_28526 ) ) ( not ( = ?auto_28530 ?auto_28528 ) ) ( HOIST-AT ?auto_28531 ?auto_28530 ) ( not ( = ?auto_28532 ?auto_28531 ) ) ( AVAILABLE ?auto_28531 ) ( SURFACE-AT ?auto_28526 ?auto_28530 ) ( ON ?auto_28526 ?auto_28527 ) ( CLEAR ?auto_28526 ) ( not ( = ?auto_28525 ?auto_28527 ) ) ( not ( = ?auto_28526 ?auto_28527 ) ) ( not ( = ?auto_28524 ?auto_28527 ) ) ( TRUCK-AT ?auto_28529 ?auto_28528 ) ( SURFACE-AT ?auto_28524 ?auto_28528 ) ( CLEAR ?auto_28524 ) ( IS-CRATE ?auto_28525 ) ( AVAILABLE ?auto_28532 ) ( IN ?auto_28525 ?auto_28529 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28525 ?auto_28526 )
      ( MAKE-2CRATE-VERIFY ?auto_28524 ?auto_28525 ?auto_28526 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28533 - SURFACE
      ?auto_28534 - SURFACE
      ?auto_28535 - SURFACE
      ?auto_28536 - SURFACE
    )
    :vars
    (
      ?auto_28541 - HOIST
      ?auto_28540 - PLACE
      ?auto_28539 - PLACE
      ?auto_28538 - HOIST
      ?auto_28537 - SURFACE
      ?auto_28542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28541 ?auto_28540 ) ( IS-CRATE ?auto_28536 ) ( not ( = ?auto_28535 ?auto_28536 ) ) ( not ( = ?auto_28534 ?auto_28535 ) ) ( not ( = ?auto_28534 ?auto_28536 ) ) ( not ( = ?auto_28539 ?auto_28540 ) ) ( HOIST-AT ?auto_28538 ?auto_28539 ) ( not ( = ?auto_28541 ?auto_28538 ) ) ( AVAILABLE ?auto_28538 ) ( SURFACE-AT ?auto_28536 ?auto_28539 ) ( ON ?auto_28536 ?auto_28537 ) ( CLEAR ?auto_28536 ) ( not ( = ?auto_28535 ?auto_28537 ) ) ( not ( = ?auto_28536 ?auto_28537 ) ) ( not ( = ?auto_28534 ?auto_28537 ) ) ( TRUCK-AT ?auto_28542 ?auto_28540 ) ( SURFACE-AT ?auto_28534 ?auto_28540 ) ( CLEAR ?auto_28534 ) ( IS-CRATE ?auto_28535 ) ( AVAILABLE ?auto_28541 ) ( IN ?auto_28535 ?auto_28542 ) ( ON ?auto_28534 ?auto_28533 ) ( not ( = ?auto_28533 ?auto_28534 ) ) ( not ( = ?auto_28533 ?auto_28535 ) ) ( not ( = ?auto_28533 ?auto_28536 ) ) ( not ( = ?auto_28533 ?auto_28537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28534 ?auto_28535 ?auto_28536 )
      ( MAKE-3CRATE-VERIFY ?auto_28533 ?auto_28534 ?auto_28535 ?auto_28536 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28543 - SURFACE
      ?auto_28544 - SURFACE
    )
    :vars
    (
      ?auto_28550 - HOIST
      ?auto_28549 - PLACE
      ?auto_28547 - SURFACE
      ?auto_28548 - PLACE
      ?auto_28546 - HOIST
      ?auto_28545 - SURFACE
      ?auto_28551 - TRUCK
      ?auto_28552 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28550 ?auto_28549 ) ( IS-CRATE ?auto_28544 ) ( not ( = ?auto_28543 ?auto_28544 ) ) ( not ( = ?auto_28547 ?auto_28543 ) ) ( not ( = ?auto_28547 ?auto_28544 ) ) ( not ( = ?auto_28548 ?auto_28549 ) ) ( HOIST-AT ?auto_28546 ?auto_28548 ) ( not ( = ?auto_28550 ?auto_28546 ) ) ( AVAILABLE ?auto_28546 ) ( SURFACE-AT ?auto_28544 ?auto_28548 ) ( ON ?auto_28544 ?auto_28545 ) ( CLEAR ?auto_28544 ) ( not ( = ?auto_28543 ?auto_28545 ) ) ( not ( = ?auto_28544 ?auto_28545 ) ) ( not ( = ?auto_28547 ?auto_28545 ) ) ( SURFACE-AT ?auto_28547 ?auto_28549 ) ( CLEAR ?auto_28547 ) ( IS-CRATE ?auto_28543 ) ( AVAILABLE ?auto_28550 ) ( IN ?auto_28543 ?auto_28551 ) ( TRUCK-AT ?auto_28551 ?auto_28552 ) ( not ( = ?auto_28552 ?auto_28549 ) ) ( not ( = ?auto_28548 ?auto_28552 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28551 ?auto_28552 ?auto_28549 )
      ( MAKE-2CRATE ?auto_28547 ?auto_28543 ?auto_28544 )
      ( MAKE-1CRATE-VERIFY ?auto_28543 ?auto_28544 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28553 - SURFACE
      ?auto_28554 - SURFACE
      ?auto_28555 - SURFACE
    )
    :vars
    (
      ?auto_28562 - HOIST
      ?auto_28561 - PLACE
      ?auto_28559 - PLACE
      ?auto_28556 - HOIST
      ?auto_28557 - SURFACE
      ?auto_28560 - TRUCK
      ?auto_28558 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28562 ?auto_28561 ) ( IS-CRATE ?auto_28555 ) ( not ( = ?auto_28554 ?auto_28555 ) ) ( not ( = ?auto_28553 ?auto_28554 ) ) ( not ( = ?auto_28553 ?auto_28555 ) ) ( not ( = ?auto_28559 ?auto_28561 ) ) ( HOIST-AT ?auto_28556 ?auto_28559 ) ( not ( = ?auto_28562 ?auto_28556 ) ) ( AVAILABLE ?auto_28556 ) ( SURFACE-AT ?auto_28555 ?auto_28559 ) ( ON ?auto_28555 ?auto_28557 ) ( CLEAR ?auto_28555 ) ( not ( = ?auto_28554 ?auto_28557 ) ) ( not ( = ?auto_28555 ?auto_28557 ) ) ( not ( = ?auto_28553 ?auto_28557 ) ) ( SURFACE-AT ?auto_28553 ?auto_28561 ) ( CLEAR ?auto_28553 ) ( IS-CRATE ?auto_28554 ) ( AVAILABLE ?auto_28562 ) ( IN ?auto_28554 ?auto_28560 ) ( TRUCK-AT ?auto_28560 ?auto_28558 ) ( not ( = ?auto_28558 ?auto_28561 ) ) ( not ( = ?auto_28559 ?auto_28558 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28554 ?auto_28555 )
      ( MAKE-2CRATE-VERIFY ?auto_28553 ?auto_28554 ?auto_28555 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28563 - SURFACE
      ?auto_28564 - SURFACE
      ?auto_28565 - SURFACE
      ?auto_28566 - SURFACE
    )
    :vars
    (
      ?auto_28571 - HOIST
      ?auto_28572 - PLACE
      ?auto_28570 - PLACE
      ?auto_28569 - HOIST
      ?auto_28567 - SURFACE
      ?auto_28573 - TRUCK
      ?auto_28568 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28571 ?auto_28572 ) ( IS-CRATE ?auto_28566 ) ( not ( = ?auto_28565 ?auto_28566 ) ) ( not ( = ?auto_28564 ?auto_28565 ) ) ( not ( = ?auto_28564 ?auto_28566 ) ) ( not ( = ?auto_28570 ?auto_28572 ) ) ( HOIST-AT ?auto_28569 ?auto_28570 ) ( not ( = ?auto_28571 ?auto_28569 ) ) ( AVAILABLE ?auto_28569 ) ( SURFACE-AT ?auto_28566 ?auto_28570 ) ( ON ?auto_28566 ?auto_28567 ) ( CLEAR ?auto_28566 ) ( not ( = ?auto_28565 ?auto_28567 ) ) ( not ( = ?auto_28566 ?auto_28567 ) ) ( not ( = ?auto_28564 ?auto_28567 ) ) ( SURFACE-AT ?auto_28564 ?auto_28572 ) ( CLEAR ?auto_28564 ) ( IS-CRATE ?auto_28565 ) ( AVAILABLE ?auto_28571 ) ( IN ?auto_28565 ?auto_28573 ) ( TRUCK-AT ?auto_28573 ?auto_28568 ) ( not ( = ?auto_28568 ?auto_28572 ) ) ( not ( = ?auto_28570 ?auto_28568 ) ) ( ON ?auto_28564 ?auto_28563 ) ( not ( = ?auto_28563 ?auto_28564 ) ) ( not ( = ?auto_28563 ?auto_28565 ) ) ( not ( = ?auto_28563 ?auto_28566 ) ) ( not ( = ?auto_28563 ?auto_28567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28564 ?auto_28565 ?auto_28566 )
      ( MAKE-3CRATE-VERIFY ?auto_28563 ?auto_28564 ?auto_28565 ?auto_28566 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28574 - SURFACE
      ?auto_28575 - SURFACE
    )
    :vars
    (
      ?auto_28581 - HOIST
      ?auto_28582 - PLACE
      ?auto_28577 - SURFACE
      ?auto_28580 - PLACE
      ?auto_28579 - HOIST
      ?auto_28576 - SURFACE
      ?auto_28583 - TRUCK
      ?auto_28578 - PLACE
      ?auto_28584 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28581 ?auto_28582 ) ( IS-CRATE ?auto_28575 ) ( not ( = ?auto_28574 ?auto_28575 ) ) ( not ( = ?auto_28577 ?auto_28574 ) ) ( not ( = ?auto_28577 ?auto_28575 ) ) ( not ( = ?auto_28580 ?auto_28582 ) ) ( HOIST-AT ?auto_28579 ?auto_28580 ) ( not ( = ?auto_28581 ?auto_28579 ) ) ( AVAILABLE ?auto_28579 ) ( SURFACE-AT ?auto_28575 ?auto_28580 ) ( ON ?auto_28575 ?auto_28576 ) ( CLEAR ?auto_28575 ) ( not ( = ?auto_28574 ?auto_28576 ) ) ( not ( = ?auto_28575 ?auto_28576 ) ) ( not ( = ?auto_28577 ?auto_28576 ) ) ( SURFACE-AT ?auto_28577 ?auto_28582 ) ( CLEAR ?auto_28577 ) ( IS-CRATE ?auto_28574 ) ( AVAILABLE ?auto_28581 ) ( TRUCK-AT ?auto_28583 ?auto_28578 ) ( not ( = ?auto_28578 ?auto_28582 ) ) ( not ( = ?auto_28580 ?auto_28578 ) ) ( HOIST-AT ?auto_28584 ?auto_28578 ) ( LIFTING ?auto_28584 ?auto_28574 ) ( not ( = ?auto_28581 ?auto_28584 ) ) ( not ( = ?auto_28579 ?auto_28584 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28584 ?auto_28574 ?auto_28583 ?auto_28578 )
      ( MAKE-2CRATE ?auto_28577 ?auto_28574 ?auto_28575 )
      ( MAKE-1CRATE-VERIFY ?auto_28574 ?auto_28575 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28585 - SURFACE
      ?auto_28586 - SURFACE
      ?auto_28587 - SURFACE
    )
    :vars
    (
      ?auto_28589 - HOIST
      ?auto_28595 - PLACE
      ?auto_28588 - PLACE
      ?auto_28594 - HOIST
      ?auto_28591 - SURFACE
      ?auto_28590 - TRUCK
      ?auto_28593 - PLACE
      ?auto_28592 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28589 ?auto_28595 ) ( IS-CRATE ?auto_28587 ) ( not ( = ?auto_28586 ?auto_28587 ) ) ( not ( = ?auto_28585 ?auto_28586 ) ) ( not ( = ?auto_28585 ?auto_28587 ) ) ( not ( = ?auto_28588 ?auto_28595 ) ) ( HOIST-AT ?auto_28594 ?auto_28588 ) ( not ( = ?auto_28589 ?auto_28594 ) ) ( AVAILABLE ?auto_28594 ) ( SURFACE-AT ?auto_28587 ?auto_28588 ) ( ON ?auto_28587 ?auto_28591 ) ( CLEAR ?auto_28587 ) ( not ( = ?auto_28586 ?auto_28591 ) ) ( not ( = ?auto_28587 ?auto_28591 ) ) ( not ( = ?auto_28585 ?auto_28591 ) ) ( SURFACE-AT ?auto_28585 ?auto_28595 ) ( CLEAR ?auto_28585 ) ( IS-CRATE ?auto_28586 ) ( AVAILABLE ?auto_28589 ) ( TRUCK-AT ?auto_28590 ?auto_28593 ) ( not ( = ?auto_28593 ?auto_28595 ) ) ( not ( = ?auto_28588 ?auto_28593 ) ) ( HOIST-AT ?auto_28592 ?auto_28593 ) ( LIFTING ?auto_28592 ?auto_28586 ) ( not ( = ?auto_28589 ?auto_28592 ) ) ( not ( = ?auto_28594 ?auto_28592 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28586 ?auto_28587 )
      ( MAKE-2CRATE-VERIFY ?auto_28585 ?auto_28586 ?auto_28587 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28596 - SURFACE
      ?auto_28597 - SURFACE
      ?auto_28598 - SURFACE
      ?auto_28599 - SURFACE
    )
    :vars
    (
      ?auto_28605 - HOIST
      ?auto_28600 - PLACE
      ?auto_28607 - PLACE
      ?auto_28601 - HOIST
      ?auto_28606 - SURFACE
      ?auto_28604 - TRUCK
      ?auto_28603 - PLACE
      ?auto_28602 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28605 ?auto_28600 ) ( IS-CRATE ?auto_28599 ) ( not ( = ?auto_28598 ?auto_28599 ) ) ( not ( = ?auto_28597 ?auto_28598 ) ) ( not ( = ?auto_28597 ?auto_28599 ) ) ( not ( = ?auto_28607 ?auto_28600 ) ) ( HOIST-AT ?auto_28601 ?auto_28607 ) ( not ( = ?auto_28605 ?auto_28601 ) ) ( AVAILABLE ?auto_28601 ) ( SURFACE-AT ?auto_28599 ?auto_28607 ) ( ON ?auto_28599 ?auto_28606 ) ( CLEAR ?auto_28599 ) ( not ( = ?auto_28598 ?auto_28606 ) ) ( not ( = ?auto_28599 ?auto_28606 ) ) ( not ( = ?auto_28597 ?auto_28606 ) ) ( SURFACE-AT ?auto_28597 ?auto_28600 ) ( CLEAR ?auto_28597 ) ( IS-CRATE ?auto_28598 ) ( AVAILABLE ?auto_28605 ) ( TRUCK-AT ?auto_28604 ?auto_28603 ) ( not ( = ?auto_28603 ?auto_28600 ) ) ( not ( = ?auto_28607 ?auto_28603 ) ) ( HOIST-AT ?auto_28602 ?auto_28603 ) ( LIFTING ?auto_28602 ?auto_28598 ) ( not ( = ?auto_28605 ?auto_28602 ) ) ( not ( = ?auto_28601 ?auto_28602 ) ) ( ON ?auto_28597 ?auto_28596 ) ( not ( = ?auto_28596 ?auto_28597 ) ) ( not ( = ?auto_28596 ?auto_28598 ) ) ( not ( = ?auto_28596 ?auto_28599 ) ) ( not ( = ?auto_28596 ?auto_28606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28597 ?auto_28598 ?auto_28599 )
      ( MAKE-3CRATE-VERIFY ?auto_28596 ?auto_28597 ?auto_28598 ?auto_28599 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28608 - SURFACE
      ?auto_28609 - SURFACE
    )
    :vars
    (
      ?auto_28616 - HOIST
      ?auto_28611 - PLACE
      ?auto_28610 - SURFACE
      ?auto_28618 - PLACE
      ?auto_28612 - HOIST
      ?auto_28617 - SURFACE
      ?auto_28615 - TRUCK
      ?auto_28614 - PLACE
      ?auto_28613 - HOIST
      ?auto_28619 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28616 ?auto_28611 ) ( IS-CRATE ?auto_28609 ) ( not ( = ?auto_28608 ?auto_28609 ) ) ( not ( = ?auto_28610 ?auto_28608 ) ) ( not ( = ?auto_28610 ?auto_28609 ) ) ( not ( = ?auto_28618 ?auto_28611 ) ) ( HOIST-AT ?auto_28612 ?auto_28618 ) ( not ( = ?auto_28616 ?auto_28612 ) ) ( AVAILABLE ?auto_28612 ) ( SURFACE-AT ?auto_28609 ?auto_28618 ) ( ON ?auto_28609 ?auto_28617 ) ( CLEAR ?auto_28609 ) ( not ( = ?auto_28608 ?auto_28617 ) ) ( not ( = ?auto_28609 ?auto_28617 ) ) ( not ( = ?auto_28610 ?auto_28617 ) ) ( SURFACE-AT ?auto_28610 ?auto_28611 ) ( CLEAR ?auto_28610 ) ( IS-CRATE ?auto_28608 ) ( AVAILABLE ?auto_28616 ) ( TRUCK-AT ?auto_28615 ?auto_28614 ) ( not ( = ?auto_28614 ?auto_28611 ) ) ( not ( = ?auto_28618 ?auto_28614 ) ) ( HOIST-AT ?auto_28613 ?auto_28614 ) ( not ( = ?auto_28616 ?auto_28613 ) ) ( not ( = ?auto_28612 ?auto_28613 ) ) ( AVAILABLE ?auto_28613 ) ( SURFACE-AT ?auto_28608 ?auto_28614 ) ( ON ?auto_28608 ?auto_28619 ) ( CLEAR ?auto_28608 ) ( not ( = ?auto_28608 ?auto_28619 ) ) ( not ( = ?auto_28609 ?auto_28619 ) ) ( not ( = ?auto_28610 ?auto_28619 ) ) ( not ( = ?auto_28617 ?auto_28619 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28613 ?auto_28608 ?auto_28619 ?auto_28614 )
      ( MAKE-2CRATE ?auto_28610 ?auto_28608 ?auto_28609 )
      ( MAKE-1CRATE-VERIFY ?auto_28608 ?auto_28609 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28620 - SURFACE
      ?auto_28621 - SURFACE
      ?auto_28622 - SURFACE
    )
    :vars
    (
      ?auto_28631 - HOIST
      ?auto_28628 - PLACE
      ?auto_28629 - PLACE
      ?auto_28625 - HOIST
      ?auto_28626 - SURFACE
      ?auto_28627 - TRUCK
      ?auto_28624 - PLACE
      ?auto_28630 - HOIST
      ?auto_28623 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28631 ?auto_28628 ) ( IS-CRATE ?auto_28622 ) ( not ( = ?auto_28621 ?auto_28622 ) ) ( not ( = ?auto_28620 ?auto_28621 ) ) ( not ( = ?auto_28620 ?auto_28622 ) ) ( not ( = ?auto_28629 ?auto_28628 ) ) ( HOIST-AT ?auto_28625 ?auto_28629 ) ( not ( = ?auto_28631 ?auto_28625 ) ) ( AVAILABLE ?auto_28625 ) ( SURFACE-AT ?auto_28622 ?auto_28629 ) ( ON ?auto_28622 ?auto_28626 ) ( CLEAR ?auto_28622 ) ( not ( = ?auto_28621 ?auto_28626 ) ) ( not ( = ?auto_28622 ?auto_28626 ) ) ( not ( = ?auto_28620 ?auto_28626 ) ) ( SURFACE-AT ?auto_28620 ?auto_28628 ) ( CLEAR ?auto_28620 ) ( IS-CRATE ?auto_28621 ) ( AVAILABLE ?auto_28631 ) ( TRUCK-AT ?auto_28627 ?auto_28624 ) ( not ( = ?auto_28624 ?auto_28628 ) ) ( not ( = ?auto_28629 ?auto_28624 ) ) ( HOIST-AT ?auto_28630 ?auto_28624 ) ( not ( = ?auto_28631 ?auto_28630 ) ) ( not ( = ?auto_28625 ?auto_28630 ) ) ( AVAILABLE ?auto_28630 ) ( SURFACE-AT ?auto_28621 ?auto_28624 ) ( ON ?auto_28621 ?auto_28623 ) ( CLEAR ?auto_28621 ) ( not ( = ?auto_28621 ?auto_28623 ) ) ( not ( = ?auto_28622 ?auto_28623 ) ) ( not ( = ?auto_28620 ?auto_28623 ) ) ( not ( = ?auto_28626 ?auto_28623 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28621 ?auto_28622 )
      ( MAKE-2CRATE-VERIFY ?auto_28620 ?auto_28621 ?auto_28622 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28632 - SURFACE
      ?auto_28633 - SURFACE
      ?auto_28634 - SURFACE
      ?auto_28635 - SURFACE
    )
    :vars
    (
      ?auto_28637 - HOIST
      ?auto_28636 - PLACE
      ?auto_28641 - PLACE
      ?auto_28643 - HOIST
      ?auto_28644 - SURFACE
      ?auto_28640 - TRUCK
      ?auto_28638 - PLACE
      ?auto_28642 - HOIST
      ?auto_28639 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28637 ?auto_28636 ) ( IS-CRATE ?auto_28635 ) ( not ( = ?auto_28634 ?auto_28635 ) ) ( not ( = ?auto_28633 ?auto_28634 ) ) ( not ( = ?auto_28633 ?auto_28635 ) ) ( not ( = ?auto_28641 ?auto_28636 ) ) ( HOIST-AT ?auto_28643 ?auto_28641 ) ( not ( = ?auto_28637 ?auto_28643 ) ) ( AVAILABLE ?auto_28643 ) ( SURFACE-AT ?auto_28635 ?auto_28641 ) ( ON ?auto_28635 ?auto_28644 ) ( CLEAR ?auto_28635 ) ( not ( = ?auto_28634 ?auto_28644 ) ) ( not ( = ?auto_28635 ?auto_28644 ) ) ( not ( = ?auto_28633 ?auto_28644 ) ) ( SURFACE-AT ?auto_28633 ?auto_28636 ) ( CLEAR ?auto_28633 ) ( IS-CRATE ?auto_28634 ) ( AVAILABLE ?auto_28637 ) ( TRUCK-AT ?auto_28640 ?auto_28638 ) ( not ( = ?auto_28638 ?auto_28636 ) ) ( not ( = ?auto_28641 ?auto_28638 ) ) ( HOIST-AT ?auto_28642 ?auto_28638 ) ( not ( = ?auto_28637 ?auto_28642 ) ) ( not ( = ?auto_28643 ?auto_28642 ) ) ( AVAILABLE ?auto_28642 ) ( SURFACE-AT ?auto_28634 ?auto_28638 ) ( ON ?auto_28634 ?auto_28639 ) ( CLEAR ?auto_28634 ) ( not ( = ?auto_28634 ?auto_28639 ) ) ( not ( = ?auto_28635 ?auto_28639 ) ) ( not ( = ?auto_28633 ?auto_28639 ) ) ( not ( = ?auto_28644 ?auto_28639 ) ) ( ON ?auto_28633 ?auto_28632 ) ( not ( = ?auto_28632 ?auto_28633 ) ) ( not ( = ?auto_28632 ?auto_28634 ) ) ( not ( = ?auto_28632 ?auto_28635 ) ) ( not ( = ?auto_28632 ?auto_28644 ) ) ( not ( = ?auto_28632 ?auto_28639 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28633 ?auto_28634 ?auto_28635 )
      ( MAKE-3CRATE-VERIFY ?auto_28632 ?auto_28633 ?auto_28634 ?auto_28635 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28645 - SURFACE
      ?auto_28646 - SURFACE
    )
    :vars
    (
      ?auto_28649 - HOIST
      ?auto_28647 - PLACE
      ?auto_28648 - SURFACE
      ?auto_28653 - PLACE
      ?auto_28655 - HOIST
      ?auto_28656 - SURFACE
      ?auto_28650 - PLACE
      ?auto_28654 - HOIST
      ?auto_28651 - SURFACE
      ?auto_28652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28649 ?auto_28647 ) ( IS-CRATE ?auto_28646 ) ( not ( = ?auto_28645 ?auto_28646 ) ) ( not ( = ?auto_28648 ?auto_28645 ) ) ( not ( = ?auto_28648 ?auto_28646 ) ) ( not ( = ?auto_28653 ?auto_28647 ) ) ( HOIST-AT ?auto_28655 ?auto_28653 ) ( not ( = ?auto_28649 ?auto_28655 ) ) ( AVAILABLE ?auto_28655 ) ( SURFACE-AT ?auto_28646 ?auto_28653 ) ( ON ?auto_28646 ?auto_28656 ) ( CLEAR ?auto_28646 ) ( not ( = ?auto_28645 ?auto_28656 ) ) ( not ( = ?auto_28646 ?auto_28656 ) ) ( not ( = ?auto_28648 ?auto_28656 ) ) ( SURFACE-AT ?auto_28648 ?auto_28647 ) ( CLEAR ?auto_28648 ) ( IS-CRATE ?auto_28645 ) ( AVAILABLE ?auto_28649 ) ( not ( = ?auto_28650 ?auto_28647 ) ) ( not ( = ?auto_28653 ?auto_28650 ) ) ( HOIST-AT ?auto_28654 ?auto_28650 ) ( not ( = ?auto_28649 ?auto_28654 ) ) ( not ( = ?auto_28655 ?auto_28654 ) ) ( AVAILABLE ?auto_28654 ) ( SURFACE-AT ?auto_28645 ?auto_28650 ) ( ON ?auto_28645 ?auto_28651 ) ( CLEAR ?auto_28645 ) ( not ( = ?auto_28645 ?auto_28651 ) ) ( not ( = ?auto_28646 ?auto_28651 ) ) ( not ( = ?auto_28648 ?auto_28651 ) ) ( not ( = ?auto_28656 ?auto_28651 ) ) ( TRUCK-AT ?auto_28652 ?auto_28647 ) )
    :subtasks
    ( ( !DRIVE ?auto_28652 ?auto_28647 ?auto_28650 )
      ( MAKE-2CRATE ?auto_28648 ?auto_28645 ?auto_28646 )
      ( MAKE-1CRATE-VERIFY ?auto_28645 ?auto_28646 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28657 - SURFACE
      ?auto_28658 - SURFACE
      ?auto_28659 - SURFACE
    )
    :vars
    (
      ?auto_28663 - HOIST
      ?auto_28664 - PLACE
      ?auto_28665 - PLACE
      ?auto_28660 - HOIST
      ?auto_28661 - SURFACE
      ?auto_28668 - PLACE
      ?auto_28666 - HOIST
      ?auto_28662 - SURFACE
      ?auto_28667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28663 ?auto_28664 ) ( IS-CRATE ?auto_28659 ) ( not ( = ?auto_28658 ?auto_28659 ) ) ( not ( = ?auto_28657 ?auto_28658 ) ) ( not ( = ?auto_28657 ?auto_28659 ) ) ( not ( = ?auto_28665 ?auto_28664 ) ) ( HOIST-AT ?auto_28660 ?auto_28665 ) ( not ( = ?auto_28663 ?auto_28660 ) ) ( AVAILABLE ?auto_28660 ) ( SURFACE-AT ?auto_28659 ?auto_28665 ) ( ON ?auto_28659 ?auto_28661 ) ( CLEAR ?auto_28659 ) ( not ( = ?auto_28658 ?auto_28661 ) ) ( not ( = ?auto_28659 ?auto_28661 ) ) ( not ( = ?auto_28657 ?auto_28661 ) ) ( SURFACE-AT ?auto_28657 ?auto_28664 ) ( CLEAR ?auto_28657 ) ( IS-CRATE ?auto_28658 ) ( AVAILABLE ?auto_28663 ) ( not ( = ?auto_28668 ?auto_28664 ) ) ( not ( = ?auto_28665 ?auto_28668 ) ) ( HOIST-AT ?auto_28666 ?auto_28668 ) ( not ( = ?auto_28663 ?auto_28666 ) ) ( not ( = ?auto_28660 ?auto_28666 ) ) ( AVAILABLE ?auto_28666 ) ( SURFACE-AT ?auto_28658 ?auto_28668 ) ( ON ?auto_28658 ?auto_28662 ) ( CLEAR ?auto_28658 ) ( not ( = ?auto_28658 ?auto_28662 ) ) ( not ( = ?auto_28659 ?auto_28662 ) ) ( not ( = ?auto_28657 ?auto_28662 ) ) ( not ( = ?auto_28661 ?auto_28662 ) ) ( TRUCK-AT ?auto_28667 ?auto_28664 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28658 ?auto_28659 )
      ( MAKE-2CRATE-VERIFY ?auto_28657 ?auto_28658 ?auto_28659 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28669 - SURFACE
      ?auto_28670 - SURFACE
      ?auto_28671 - SURFACE
      ?auto_28672 - SURFACE
    )
    :vars
    (
      ?auto_28674 - HOIST
      ?auto_28680 - PLACE
      ?auto_28673 - PLACE
      ?auto_28677 - HOIST
      ?auto_28681 - SURFACE
      ?auto_28678 - PLACE
      ?auto_28675 - HOIST
      ?auto_28676 - SURFACE
      ?auto_28679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28674 ?auto_28680 ) ( IS-CRATE ?auto_28672 ) ( not ( = ?auto_28671 ?auto_28672 ) ) ( not ( = ?auto_28670 ?auto_28671 ) ) ( not ( = ?auto_28670 ?auto_28672 ) ) ( not ( = ?auto_28673 ?auto_28680 ) ) ( HOIST-AT ?auto_28677 ?auto_28673 ) ( not ( = ?auto_28674 ?auto_28677 ) ) ( AVAILABLE ?auto_28677 ) ( SURFACE-AT ?auto_28672 ?auto_28673 ) ( ON ?auto_28672 ?auto_28681 ) ( CLEAR ?auto_28672 ) ( not ( = ?auto_28671 ?auto_28681 ) ) ( not ( = ?auto_28672 ?auto_28681 ) ) ( not ( = ?auto_28670 ?auto_28681 ) ) ( SURFACE-AT ?auto_28670 ?auto_28680 ) ( CLEAR ?auto_28670 ) ( IS-CRATE ?auto_28671 ) ( AVAILABLE ?auto_28674 ) ( not ( = ?auto_28678 ?auto_28680 ) ) ( not ( = ?auto_28673 ?auto_28678 ) ) ( HOIST-AT ?auto_28675 ?auto_28678 ) ( not ( = ?auto_28674 ?auto_28675 ) ) ( not ( = ?auto_28677 ?auto_28675 ) ) ( AVAILABLE ?auto_28675 ) ( SURFACE-AT ?auto_28671 ?auto_28678 ) ( ON ?auto_28671 ?auto_28676 ) ( CLEAR ?auto_28671 ) ( not ( = ?auto_28671 ?auto_28676 ) ) ( not ( = ?auto_28672 ?auto_28676 ) ) ( not ( = ?auto_28670 ?auto_28676 ) ) ( not ( = ?auto_28681 ?auto_28676 ) ) ( TRUCK-AT ?auto_28679 ?auto_28680 ) ( ON ?auto_28670 ?auto_28669 ) ( not ( = ?auto_28669 ?auto_28670 ) ) ( not ( = ?auto_28669 ?auto_28671 ) ) ( not ( = ?auto_28669 ?auto_28672 ) ) ( not ( = ?auto_28669 ?auto_28681 ) ) ( not ( = ?auto_28669 ?auto_28676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28670 ?auto_28671 ?auto_28672 )
      ( MAKE-3CRATE-VERIFY ?auto_28669 ?auto_28670 ?auto_28671 ?auto_28672 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28682 - SURFACE
      ?auto_28683 - SURFACE
    )
    :vars
    (
      ?auto_28685 - HOIST
      ?auto_28691 - PLACE
      ?auto_28693 - SURFACE
      ?auto_28684 - PLACE
      ?auto_28688 - HOIST
      ?auto_28692 - SURFACE
      ?auto_28689 - PLACE
      ?auto_28686 - HOIST
      ?auto_28687 - SURFACE
      ?auto_28690 - TRUCK
      ?auto_28694 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28685 ?auto_28691 ) ( IS-CRATE ?auto_28683 ) ( not ( = ?auto_28682 ?auto_28683 ) ) ( not ( = ?auto_28693 ?auto_28682 ) ) ( not ( = ?auto_28693 ?auto_28683 ) ) ( not ( = ?auto_28684 ?auto_28691 ) ) ( HOIST-AT ?auto_28688 ?auto_28684 ) ( not ( = ?auto_28685 ?auto_28688 ) ) ( AVAILABLE ?auto_28688 ) ( SURFACE-AT ?auto_28683 ?auto_28684 ) ( ON ?auto_28683 ?auto_28692 ) ( CLEAR ?auto_28683 ) ( not ( = ?auto_28682 ?auto_28692 ) ) ( not ( = ?auto_28683 ?auto_28692 ) ) ( not ( = ?auto_28693 ?auto_28692 ) ) ( IS-CRATE ?auto_28682 ) ( not ( = ?auto_28689 ?auto_28691 ) ) ( not ( = ?auto_28684 ?auto_28689 ) ) ( HOIST-AT ?auto_28686 ?auto_28689 ) ( not ( = ?auto_28685 ?auto_28686 ) ) ( not ( = ?auto_28688 ?auto_28686 ) ) ( AVAILABLE ?auto_28686 ) ( SURFACE-AT ?auto_28682 ?auto_28689 ) ( ON ?auto_28682 ?auto_28687 ) ( CLEAR ?auto_28682 ) ( not ( = ?auto_28682 ?auto_28687 ) ) ( not ( = ?auto_28683 ?auto_28687 ) ) ( not ( = ?auto_28693 ?auto_28687 ) ) ( not ( = ?auto_28692 ?auto_28687 ) ) ( TRUCK-AT ?auto_28690 ?auto_28691 ) ( SURFACE-AT ?auto_28694 ?auto_28691 ) ( CLEAR ?auto_28694 ) ( LIFTING ?auto_28685 ?auto_28693 ) ( IS-CRATE ?auto_28693 ) ( not ( = ?auto_28694 ?auto_28693 ) ) ( not ( = ?auto_28682 ?auto_28694 ) ) ( not ( = ?auto_28683 ?auto_28694 ) ) ( not ( = ?auto_28692 ?auto_28694 ) ) ( not ( = ?auto_28687 ?auto_28694 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28694 ?auto_28693 )
      ( MAKE-2CRATE ?auto_28693 ?auto_28682 ?auto_28683 )
      ( MAKE-1CRATE-VERIFY ?auto_28682 ?auto_28683 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28695 - SURFACE
      ?auto_28696 - SURFACE
      ?auto_28697 - SURFACE
    )
    :vars
    (
      ?auto_28705 - HOIST
      ?auto_28704 - PLACE
      ?auto_28703 - PLACE
      ?auto_28707 - HOIST
      ?auto_28706 - SURFACE
      ?auto_28699 - PLACE
      ?auto_28700 - HOIST
      ?auto_28701 - SURFACE
      ?auto_28698 - TRUCK
      ?auto_28702 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28705 ?auto_28704 ) ( IS-CRATE ?auto_28697 ) ( not ( = ?auto_28696 ?auto_28697 ) ) ( not ( = ?auto_28695 ?auto_28696 ) ) ( not ( = ?auto_28695 ?auto_28697 ) ) ( not ( = ?auto_28703 ?auto_28704 ) ) ( HOIST-AT ?auto_28707 ?auto_28703 ) ( not ( = ?auto_28705 ?auto_28707 ) ) ( AVAILABLE ?auto_28707 ) ( SURFACE-AT ?auto_28697 ?auto_28703 ) ( ON ?auto_28697 ?auto_28706 ) ( CLEAR ?auto_28697 ) ( not ( = ?auto_28696 ?auto_28706 ) ) ( not ( = ?auto_28697 ?auto_28706 ) ) ( not ( = ?auto_28695 ?auto_28706 ) ) ( IS-CRATE ?auto_28696 ) ( not ( = ?auto_28699 ?auto_28704 ) ) ( not ( = ?auto_28703 ?auto_28699 ) ) ( HOIST-AT ?auto_28700 ?auto_28699 ) ( not ( = ?auto_28705 ?auto_28700 ) ) ( not ( = ?auto_28707 ?auto_28700 ) ) ( AVAILABLE ?auto_28700 ) ( SURFACE-AT ?auto_28696 ?auto_28699 ) ( ON ?auto_28696 ?auto_28701 ) ( CLEAR ?auto_28696 ) ( not ( = ?auto_28696 ?auto_28701 ) ) ( not ( = ?auto_28697 ?auto_28701 ) ) ( not ( = ?auto_28695 ?auto_28701 ) ) ( not ( = ?auto_28706 ?auto_28701 ) ) ( TRUCK-AT ?auto_28698 ?auto_28704 ) ( SURFACE-AT ?auto_28702 ?auto_28704 ) ( CLEAR ?auto_28702 ) ( LIFTING ?auto_28705 ?auto_28695 ) ( IS-CRATE ?auto_28695 ) ( not ( = ?auto_28702 ?auto_28695 ) ) ( not ( = ?auto_28696 ?auto_28702 ) ) ( not ( = ?auto_28697 ?auto_28702 ) ) ( not ( = ?auto_28706 ?auto_28702 ) ) ( not ( = ?auto_28701 ?auto_28702 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28696 ?auto_28697 )
      ( MAKE-2CRATE-VERIFY ?auto_28695 ?auto_28696 ?auto_28697 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28708 - SURFACE
      ?auto_28709 - SURFACE
      ?auto_28710 - SURFACE
      ?auto_28711 - SURFACE
    )
    :vars
    (
      ?auto_28713 - HOIST
      ?auto_28717 - PLACE
      ?auto_28714 - PLACE
      ?auto_28712 - HOIST
      ?auto_28715 - SURFACE
      ?auto_28720 - PLACE
      ?auto_28716 - HOIST
      ?auto_28718 - SURFACE
      ?auto_28719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28713 ?auto_28717 ) ( IS-CRATE ?auto_28711 ) ( not ( = ?auto_28710 ?auto_28711 ) ) ( not ( = ?auto_28709 ?auto_28710 ) ) ( not ( = ?auto_28709 ?auto_28711 ) ) ( not ( = ?auto_28714 ?auto_28717 ) ) ( HOIST-AT ?auto_28712 ?auto_28714 ) ( not ( = ?auto_28713 ?auto_28712 ) ) ( AVAILABLE ?auto_28712 ) ( SURFACE-AT ?auto_28711 ?auto_28714 ) ( ON ?auto_28711 ?auto_28715 ) ( CLEAR ?auto_28711 ) ( not ( = ?auto_28710 ?auto_28715 ) ) ( not ( = ?auto_28711 ?auto_28715 ) ) ( not ( = ?auto_28709 ?auto_28715 ) ) ( IS-CRATE ?auto_28710 ) ( not ( = ?auto_28720 ?auto_28717 ) ) ( not ( = ?auto_28714 ?auto_28720 ) ) ( HOIST-AT ?auto_28716 ?auto_28720 ) ( not ( = ?auto_28713 ?auto_28716 ) ) ( not ( = ?auto_28712 ?auto_28716 ) ) ( AVAILABLE ?auto_28716 ) ( SURFACE-AT ?auto_28710 ?auto_28720 ) ( ON ?auto_28710 ?auto_28718 ) ( CLEAR ?auto_28710 ) ( not ( = ?auto_28710 ?auto_28718 ) ) ( not ( = ?auto_28711 ?auto_28718 ) ) ( not ( = ?auto_28709 ?auto_28718 ) ) ( not ( = ?auto_28715 ?auto_28718 ) ) ( TRUCK-AT ?auto_28719 ?auto_28717 ) ( SURFACE-AT ?auto_28708 ?auto_28717 ) ( CLEAR ?auto_28708 ) ( LIFTING ?auto_28713 ?auto_28709 ) ( IS-CRATE ?auto_28709 ) ( not ( = ?auto_28708 ?auto_28709 ) ) ( not ( = ?auto_28710 ?auto_28708 ) ) ( not ( = ?auto_28711 ?auto_28708 ) ) ( not ( = ?auto_28715 ?auto_28708 ) ) ( not ( = ?auto_28718 ?auto_28708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28709 ?auto_28710 ?auto_28711 )
      ( MAKE-3CRATE-VERIFY ?auto_28708 ?auto_28709 ?auto_28710 ?auto_28711 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28721 - SURFACE
      ?auto_28722 - SURFACE
    )
    :vars
    (
      ?auto_28725 - HOIST
      ?auto_28729 - PLACE
      ?auto_28724 - SURFACE
      ?auto_28726 - PLACE
      ?auto_28723 - HOIST
      ?auto_28727 - SURFACE
      ?auto_28733 - PLACE
      ?auto_28728 - HOIST
      ?auto_28730 - SURFACE
      ?auto_28731 - TRUCK
      ?auto_28732 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28725 ?auto_28729 ) ( IS-CRATE ?auto_28722 ) ( not ( = ?auto_28721 ?auto_28722 ) ) ( not ( = ?auto_28724 ?auto_28721 ) ) ( not ( = ?auto_28724 ?auto_28722 ) ) ( not ( = ?auto_28726 ?auto_28729 ) ) ( HOIST-AT ?auto_28723 ?auto_28726 ) ( not ( = ?auto_28725 ?auto_28723 ) ) ( AVAILABLE ?auto_28723 ) ( SURFACE-AT ?auto_28722 ?auto_28726 ) ( ON ?auto_28722 ?auto_28727 ) ( CLEAR ?auto_28722 ) ( not ( = ?auto_28721 ?auto_28727 ) ) ( not ( = ?auto_28722 ?auto_28727 ) ) ( not ( = ?auto_28724 ?auto_28727 ) ) ( IS-CRATE ?auto_28721 ) ( not ( = ?auto_28733 ?auto_28729 ) ) ( not ( = ?auto_28726 ?auto_28733 ) ) ( HOIST-AT ?auto_28728 ?auto_28733 ) ( not ( = ?auto_28725 ?auto_28728 ) ) ( not ( = ?auto_28723 ?auto_28728 ) ) ( AVAILABLE ?auto_28728 ) ( SURFACE-AT ?auto_28721 ?auto_28733 ) ( ON ?auto_28721 ?auto_28730 ) ( CLEAR ?auto_28721 ) ( not ( = ?auto_28721 ?auto_28730 ) ) ( not ( = ?auto_28722 ?auto_28730 ) ) ( not ( = ?auto_28724 ?auto_28730 ) ) ( not ( = ?auto_28727 ?auto_28730 ) ) ( TRUCK-AT ?auto_28731 ?auto_28729 ) ( SURFACE-AT ?auto_28732 ?auto_28729 ) ( CLEAR ?auto_28732 ) ( IS-CRATE ?auto_28724 ) ( not ( = ?auto_28732 ?auto_28724 ) ) ( not ( = ?auto_28721 ?auto_28732 ) ) ( not ( = ?auto_28722 ?auto_28732 ) ) ( not ( = ?auto_28727 ?auto_28732 ) ) ( not ( = ?auto_28730 ?auto_28732 ) ) ( AVAILABLE ?auto_28725 ) ( IN ?auto_28724 ?auto_28731 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28725 ?auto_28724 ?auto_28731 ?auto_28729 )
      ( MAKE-2CRATE ?auto_28724 ?auto_28721 ?auto_28722 )
      ( MAKE-1CRATE-VERIFY ?auto_28721 ?auto_28722 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28734 - SURFACE
      ?auto_28735 - SURFACE
      ?auto_28736 - SURFACE
    )
    :vars
    (
      ?auto_28738 - HOIST
      ?auto_28739 - PLACE
      ?auto_28744 - PLACE
      ?auto_28746 - HOIST
      ?auto_28740 - SURFACE
      ?auto_28743 - PLACE
      ?auto_28741 - HOIST
      ?auto_28742 - SURFACE
      ?auto_28737 - TRUCK
      ?auto_28745 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28738 ?auto_28739 ) ( IS-CRATE ?auto_28736 ) ( not ( = ?auto_28735 ?auto_28736 ) ) ( not ( = ?auto_28734 ?auto_28735 ) ) ( not ( = ?auto_28734 ?auto_28736 ) ) ( not ( = ?auto_28744 ?auto_28739 ) ) ( HOIST-AT ?auto_28746 ?auto_28744 ) ( not ( = ?auto_28738 ?auto_28746 ) ) ( AVAILABLE ?auto_28746 ) ( SURFACE-AT ?auto_28736 ?auto_28744 ) ( ON ?auto_28736 ?auto_28740 ) ( CLEAR ?auto_28736 ) ( not ( = ?auto_28735 ?auto_28740 ) ) ( not ( = ?auto_28736 ?auto_28740 ) ) ( not ( = ?auto_28734 ?auto_28740 ) ) ( IS-CRATE ?auto_28735 ) ( not ( = ?auto_28743 ?auto_28739 ) ) ( not ( = ?auto_28744 ?auto_28743 ) ) ( HOIST-AT ?auto_28741 ?auto_28743 ) ( not ( = ?auto_28738 ?auto_28741 ) ) ( not ( = ?auto_28746 ?auto_28741 ) ) ( AVAILABLE ?auto_28741 ) ( SURFACE-AT ?auto_28735 ?auto_28743 ) ( ON ?auto_28735 ?auto_28742 ) ( CLEAR ?auto_28735 ) ( not ( = ?auto_28735 ?auto_28742 ) ) ( not ( = ?auto_28736 ?auto_28742 ) ) ( not ( = ?auto_28734 ?auto_28742 ) ) ( not ( = ?auto_28740 ?auto_28742 ) ) ( TRUCK-AT ?auto_28737 ?auto_28739 ) ( SURFACE-AT ?auto_28745 ?auto_28739 ) ( CLEAR ?auto_28745 ) ( IS-CRATE ?auto_28734 ) ( not ( = ?auto_28745 ?auto_28734 ) ) ( not ( = ?auto_28735 ?auto_28745 ) ) ( not ( = ?auto_28736 ?auto_28745 ) ) ( not ( = ?auto_28740 ?auto_28745 ) ) ( not ( = ?auto_28742 ?auto_28745 ) ) ( AVAILABLE ?auto_28738 ) ( IN ?auto_28734 ?auto_28737 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28735 ?auto_28736 )
      ( MAKE-2CRATE-VERIFY ?auto_28734 ?auto_28735 ?auto_28736 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28747 - SURFACE
      ?auto_28748 - SURFACE
      ?auto_28749 - SURFACE
      ?auto_28750 - SURFACE
    )
    :vars
    (
      ?auto_28753 - HOIST
      ?auto_28756 - PLACE
      ?auto_28757 - PLACE
      ?auto_28751 - HOIST
      ?auto_28759 - SURFACE
      ?auto_28755 - PLACE
      ?auto_28758 - HOIST
      ?auto_28754 - SURFACE
      ?auto_28752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28753 ?auto_28756 ) ( IS-CRATE ?auto_28750 ) ( not ( = ?auto_28749 ?auto_28750 ) ) ( not ( = ?auto_28748 ?auto_28749 ) ) ( not ( = ?auto_28748 ?auto_28750 ) ) ( not ( = ?auto_28757 ?auto_28756 ) ) ( HOIST-AT ?auto_28751 ?auto_28757 ) ( not ( = ?auto_28753 ?auto_28751 ) ) ( AVAILABLE ?auto_28751 ) ( SURFACE-AT ?auto_28750 ?auto_28757 ) ( ON ?auto_28750 ?auto_28759 ) ( CLEAR ?auto_28750 ) ( not ( = ?auto_28749 ?auto_28759 ) ) ( not ( = ?auto_28750 ?auto_28759 ) ) ( not ( = ?auto_28748 ?auto_28759 ) ) ( IS-CRATE ?auto_28749 ) ( not ( = ?auto_28755 ?auto_28756 ) ) ( not ( = ?auto_28757 ?auto_28755 ) ) ( HOIST-AT ?auto_28758 ?auto_28755 ) ( not ( = ?auto_28753 ?auto_28758 ) ) ( not ( = ?auto_28751 ?auto_28758 ) ) ( AVAILABLE ?auto_28758 ) ( SURFACE-AT ?auto_28749 ?auto_28755 ) ( ON ?auto_28749 ?auto_28754 ) ( CLEAR ?auto_28749 ) ( not ( = ?auto_28749 ?auto_28754 ) ) ( not ( = ?auto_28750 ?auto_28754 ) ) ( not ( = ?auto_28748 ?auto_28754 ) ) ( not ( = ?auto_28759 ?auto_28754 ) ) ( TRUCK-AT ?auto_28752 ?auto_28756 ) ( SURFACE-AT ?auto_28747 ?auto_28756 ) ( CLEAR ?auto_28747 ) ( IS-CRATE ?auto_28748 ) ( not ( = ?auto_28747 ?auto_28748 ) ) ( not ( = ?auto_28749 ?auto_28747 ) ) ( not ( = ?auto_28750 ?auto_28747 ) ) ( not ( = ?auto_28759 ?auto_28747 ) ) ( not ( = ?auto_28754 ?auto_28747 ) ) ( AVAILABLE ?auto_28753 ) ( IN ?auto_28748 ?auto_28752 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28748 ?auto_28749 ?auto_28750 )
      ( MAKE-3CRATE-VERIFY ?auto_28747 ?auto_28748 ?auto_28749 ?auto_28750 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28760 - SURFACE
      ?auto_28761 - SURFACE
    )
    :vars
    (
      ?auto_28765 - HOIST
      ?auto_28769 - PLACE
      ?auto_28762 - SURFACE
      ?auto_28770 - PLACE
      ?auto_28763 - HOIST
      ?auto_28772 - SURFACE
      ?auto_28768 - PLACE
      ?auto_28771 - HOIST
      ?auto_28766 - SURFACE
      ?auto_28767 - SURFACE
      ?auto_28764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28765 ?auto_28769 ) ( IS-CRATE ?auto_28761 ) ( not ( = ?auto_28760 ?auto_28761 ) ) ( not ( = ?auto_28762 ?auto_28760 ) ) ( not ( = ?auto_28762 ?auto_28761 ) ) ( not ( = ?auto_28770 ?auto_28769 ) ) ( HOIST-AT ?auto_28763 ?auto_28770 ) ( not ( = ?auto_28765 ?auto_28763 ) ) ( AVAILABLE ?auto_28763 ) ( SURFACE-AT ?auto_28761 ?auto_28770 ) ( ON ?auto_28761 ?auto_28772 ) ( CLEAR ?auto_28761 ) ( not ( = ?auto_28760 ?auto_28772 ) ) ( not ( = ?auto_28761 ?auto_28772 ) ) ( not ( = ?auto_28762 ?auto_28772 ) ) ( IS-CRATE ?auto_28760 ) ( not ( = ?auto_28768 ?auto_28769 ) ) ( not ( = ?auto_28770 ?auto_28768 ) ) ( HOIST-AT ?auto_28771 ?auto_28768 ) ( not ( = ?auto_28765 ?auto_28771 ) ) ( not ( = ?auto_28763 ?auto_28771 ) ) ( AVAILABLE ?auto_28771 ) ( SURFACE-AT ?auto_28760 ?auto_28768 ) ( ON ?auto_28760 ?auto_28766 ) ( CLEAR ?auto_28760 ) ( not ( = ?auto_28760 ?auto_28766 ) ) ( not ( = ?auto_28761 ?auto_28766 ) ) ( not ( = ?auto_28762 ?auto_28766 ) ) ( not ( = ?auto_28772 ?auto_28766 ) ) ( SURFACE-AT ?auto_28767 ?auto_28769 ) ( CLEAR ?auto_28767 ) ( IS-CRATE ?auto_28762 ) ( not ( = ?auto_28767 ?auto_28762 ) ) ( not ( = ?auto_28760 ?auto_28767 ) ) ( not ( = ?auto_28761 ?auto_28767 ) ) ( not ( = ?auto_28772 ?auto_28767 ) ) ( not ( = ?auto_28766 ?auto_28767 ) ) ( AVAILABLE ?auto_28765 ) ( IN ?auto_28762 ?auto_28764 ) ( TRUCK-AT ?auto_28764 ?auto_28770 ) )
    :subtasks
    ( ( !DRIVE ?auto_28764 ?auto_28770 ?auto_28769 )
      ( MAKE-2CRATE ?auto_28762 ?auto_28760 ?auto_28761 )
      ( MAKE-1CRATE-VERIFY ?auto_28760 ?auto_28761 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28773 - SURFACE
      ?auto_28774 - SURFACE
      ?auto_28775 - SURFACE
    )
    :vars
    (
      ?auto_28778 - HOIST
      ?auto_28779 - PLACE
      ?auto_28780 - PLACE
      ?auto_28776 - HOIST
      ?auto_28785 - SURFACE
      ?auto_28777 - PLACE
      ?auto_28783 - HOIST
      ?auto_28781 - SURFACE
      ?auto_28782 - SURFACE
      ?auto_28784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28778 ?auto_28779 ) ( IS-CRATE ?auto_28775 ) ( not ( = ?auto_28774 ?auto_28775 ) ) ( not ( = ?auto_28773 ?auto_28774 ) ) ( not ( = ?auto_28773 ?auto_28775 ) ) ( not ( = ?auto_28780 ?auto_28779 ) ) ( HOIST-AT ?auto_28776 ?auto_28780 ) ( not ( = ?auto_28778 ?auto_28776 ) ) ( AVAILABLE ?auto_28776 ) ( SURFACE-AT ?auto_28775 ?auto_28780 ) ( ON ?auto_28775 ?auto_28785 ) ( CLEAR ?auto_28775 ) ( not ( = ?auto_28774 ?auto_28785 ) ) ( not ( = ?auto_28775 ?auto_28785 ) ) ( not ( = ?auto_28773 ?auto_28785 ) ) ( IS-CRATE ?auto_28774 ) ( not ( = ?auto_28777 ?auto_28779 ) ) ( not ( = ?auto_28780 ?auto_28777 ) ) ( HOIST-AT ?auto_28783 ?auto_28777 ) ( not ( = ?auto_28778 ?auto_28783 ) ) ( not ( = ?auto_28776 ?auto_28783 ) ) ( AVAILABLE ?auto_28783 ) ( SURFACE-AT ?auto_28774 ?auto_28777 ) ( ON ?auto_28774 ?auto_28781 ) ( CLEAR ?auto_28774 ) ( not ( = ?auto_28774 ?auto_28781 ) ) ( not ( = ?auto_28775 ?auto_28781 ) ) ( not ( = ?auto_28773 ?auto_28781 ) ) ( not ( = ?auto_28785 ?auto_28781 ) ) ( SURFACE-AT ?auto_28782 ?auto_28779 ) ( CLEAR ?auto_28782 ) ( IS-CRATE ?auto_28773 ) ( not ( = ?auto_28782 ?auto_28773 ) ) ( not ( = ?auto_28774 ?auto_28782 ) ) ( not ( = ?auto_28775 ?auto_28782 ) ) ( not ( = ?auto_28785 ?auto_28782 ) ) ( not ( = ?auto_28781 ?auto_28782 ) ) ( AVAILABLE ?auto_28778 ) ( IN ?auto_28773 ?auto_28784 ) ( TRUCK-AT ?auto_28784 ?auto_28780 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28774 ?auto_28775 )
      ( MAKE-2CRATE-VERIFY ?auto_28773 ?auto_28774 ?auto_28775 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28786 - SURFACE
      ?auto_28787 - SURFACE
      ?auto_28788 - SURFACE
      ?auto_28789 - SURFACE
    )
    :vars
    (
      ?auto_28795 - HOIST
      ?auto_28791 - PLACE
      ?auto_28796 - PLACE
      ?auto_28797 - HOIST
      ?auto_28790 - SURFACE
      ?auto_28793 - PLACE
      ?auto_28794 - HOIST
      ?auto_28792 - SURFACE
      ?auto_28798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28795 ?auto_28791 ) ( IS-CRATE ?auto_28789 ) ( not ( = ?auto_28788 ?auto_28789 ) ) ( not ( = ?auto_28787 ?auto_28788 ) ) ( not ( = ?auto_28787 ?auto_28789 ) ) ( not ( = ?auto_28796 ?auto_28791 ) ) ( HOIST-AT ?auto_28797 ?auto_28796 ) ( not ( = ?auto_28795 ?auto_28797 ) ) ( AVAILABLE ?auto_28797 ) ( SURFACE-AT ?auto_28789 ?auto_28796 ) ( ON ?auto_28789 ?auto_28790 ) ( CLEAR ?auto_28789 ) ( not ( = ?auto_28788 ?auto_28790 ) ) ( not ( = ?auto_28789 ?auto_28790 ) ) ( not ( = ?auto_28787 ?auto_28790 ) ) ( IS-CRATE ?auto_28788 ) ( not ( = ?auto_28793 ?auto_28791 ) ) ( not ( = ?auto_28796 ?auto_28793 ) ) ( HOIST-AT ?auto_28794 ?auto_28793 ) ( not ( = ?auto_28795 ?auto_28794 ) ) ( not ( = ?auto_28797 ?auto_28794 ) ) ( AVAILABLE ?auto_28794 ) ( SURFACE-AT ?auto_28788 ?auto_28793 ) ( ON ?auto_28788 ?auto_28792 ) ( CLEAR ?auto_28788 ) ( not ( = ?auto_28788 ?auto_28792 ) ) ( not ( = ?auto_28789 ?auto_28792 ) ) ( not ( = ?auto_28787 ?auto_28792 ) ) ( not ( = ?auto_28790 ?auto_28792 ) ) ( SURFACE-AT ?auto_28786 ?auto_28791 ) ( CLEAR ?auto_28786 ) ( IS-CRATE ?auto_28787 ) ( not ( = ?auto_28786 ?auto_28787 ) ) ( not ( = ?auto_28788 ?auto_28786 ) ) ( not ( = ?auto_28789 ?auto_28786 ) ) ( not ( = ?auto_28790 ?auto_28786 ) ) ( not ( = ?auto_28792 ?auto_28786 ) ) ( AVAILABLE ?auto_28795 ) ( IN ?auto_28787 ?auto_28798 ) ( TRUCK-AT ?auto_28798 ?auto_28796 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28787 ?auto_28788 ?auto_28789 )
      ( MAKE-3CRATE-VERIFY ?auto_28786 ?auto_28787 ?auto_28788 ?auto_28789 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28799 - SURFACE
      ?auto_28800 - SURFACE
    )
    :vars
    (
      ?auto_28808 - HOIST
      ?auto_28803 - PLACE
      ?auto_28804 - SURFACE
      ?auto_28809 - PLACE
      ?auto_28810 - HOIST
      ?auto_28801 - SURFACE
      ?auto_28806 - PLACE
      ?auto_28807 - HOIST
      ?auto_28805 - SURFACE
      ?auto_28802 - SURFACE
      ?auto_28811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28808 ?auto_28803 ) ( IS-CRATE ?auto_28800 ) ( not ( = ?auto_28799 ?auto_28800 ) ) ( not ( = ?auto_28804 ?auto_28799 ) ) ( not ( = ?auto_28804 ?auto_28800 ) ) ( not ( = ?auto_28809 ?auto_28803 ) ) ( HOIST-AT ?auto_28810 ?auto_28809 ) ( not ( = ?auto_28808 ?auto_28810 ) ) ( SURFACE-AT ?auto_28800 ?auto_28809 ) ( ON ?auto_28800 ?auto_28801 ) ( CLEAR ?auto_28800 ) ( not ( = ?auto_28799 ?auto_28801 ) ) ( not ( = ?auto_28800 ?auto_28801 ) ) ( not ( = ?auto_28804 ?auto_28801 ) ) ( IS-CRATE ?auto_28799 ) ( not ( = ?auto_28806 ?auto_28803 ) ) ( not ( = ?auto_28809 ?auto_28806 ) ) ( HOIST-AT ?auto_28807 ?auto_28806 ) ( not ( = ?auto_28808 ?auto_28807 ) ) ( not ( = ?auto_28810 ?auto_28807 ) ) ( AVAILABLE ?auto_28807 ) ( SURFACE-AT ?auto_28799 ?auto_28806 ) ( ON ?auto_28799 ?auto_28805 ) ( CLEAR ?auto_28799 ) ( not ( = ?auto_28799 ?auto_28805 ) ) ( not ( = ?auto_28800 ?auto_28805 ) ) ( not ( = ?auto_28804 ?auto_28805 ) ) ( not ( = ?auto_28801 ?auto_28805 ) ) ( SURFACE-AT ?auto_28802 ?auto_28803 ) ( CLEAR ?auto_28802 ) ( IS-CRATE ?auto_28804 ) ( not ( = ?auto_28802 ?auto_28804 ) ) ( not ( = ?auto_28799 ?auto_28802 ) ) ( not ( = ?auto_28800 ?auto_28802 ) ) ( not ( = ?auto_28801 ?auto_28802 ) ) ( not ( = ?auto_28805 ?auto_28802 ) ) ( AVAILABLE ?auto_28808 ) ( TRUCK-AT ?auto_28811 ?auto_28809 ) ( LIFTING ?auto_28810 ?auto_28804 ) )
    :subtasks
    ( ( !LOAD ?auto_28810 ?auto_28804 ?auto_28811 ?auto_28809 )
      ( MAKE-2CRATE ?auto_28804 ?auto_28799 ?auto_28800 )
      ( MAKE-1CRATE-VERIFY ?auto_28799 ?auto_28800 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28812 - SURFACE
      ?auto_28813 - SURFACE
      ?auto_28814 - SURFACE
    )
    :vars
    (
      ?auto_28823 - HOIST
      ?auto_28822 - PLACE
      ?auto_28818 - PLACE
      ?auto_28816 - HOIST
      ?auto_28819 - SURFACE
      ?auto_28815 - PLACE
      ?auto_28824 - HOIST
      ?auto_28820 - SURFACE
      ?auto_28817 - SURFACE
      ?auto_28821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28823 ?auto_28822 ) ( IS-CRATE ?auto_28814 ) ( not ( = ?auto_28813 ?auto_28814 ) ) ( not ( = ?auto_28812 ?auto_28813 ) ) ( not ( = ?auto_28812 ?auto_28814 ) ) ( not ( = ?auto_28818 ?auto_28822 ) ) ( HOIST-AT ?auto_28816 ?auto_28818 ) ( not ( = ?auto_28823 ?auto_28816 ) ) ( SURFACE-AT ?auto_28814 ?auto_28818 ) ( ON ?auto_28814 ?auto_28819 ) ( CLEAR ?auto_28814 ) ( not ( = ?auto_28813 ?auto_28819 ) ) ( not ( = ?auto_28814 ?auto_28819 ) ) ( not ( = ?auto_28812 ?auto_28819 ) ) ( IS-CRATE ?auto_28813 ) ( not ( = ?auto_28815 ?auto_28822 ) ) ( not ( = ?auto_28818 ?auto_28815 ) ) ( HOIST-AT ?auto_28824 ?auto_28815 ) ( not ( = ?auto_28823 ?auto_28824 ) ) ( not ( = ?auto_28816 ?auto_28824 ) ) ( AVAILABLE ?auto_28824 ) ( SURFACE-AT ?auto_28813 ?auto_28815 ) ( ON ?auto_28813 ?auto_28820 ) ( CLEAR ?auto_28813 ) ( not ( = ?auto_28813 ?auto_28820 ) ) ( not ( = ?auto_28814 ?auto_28820 ) ) ( not ( = ?auto_28812 ?auto_28820 ) ) ( not ( = ?auto_28819 ?auto_28820 ) ) ( SURFACE-AT ?auto_28817 ?auto_28822 ) ( CLEAR ?auto_28817 ) ( IS-CRATE ?auto_28812 ) ( not ( = ?auto_28817 ?auto_28812 ) ) ( not ( = ?auto_28813 ?auto_28817 ) ) ( not ( = ?auto_28814 ?auto_28817 ) ) ( not ( = ?auto_28819 ?auto_28817 ) ) ( not ( = ?auto_28820 ?auto_28817 ) ) ( AVAILABLE ?auto_28823 ) ( TRUCK-AT ?auto_28821 ?auto_28818 ) ( LIFTING ?auto_28816 ?auto_28812 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28813 ?auto_28814 )
      ( MAKE-2CRATE-VERIFY ?auto_28812 ?auto_28813 ?auto_28814 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28825 - SURFACE
      ?auto_28826 - SURFACE
      ?auto_28827 - SURFACE
      ?auto_28828 - SURFACE
    )
    :vars
    (
      ?auto_28833 - HOIST
      ?auto_28832 - PLACE
      ?auto_28835 - PLACE
      ?auto_28837 - HOIST
      ?auto_28836 - SURFACE
      ?auto_28829 - PLACE
      ?auto_28831 - HOIST
      ?auto_28834 - SURFACE
      ?auto_28830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28833 ?auto_28832 ) ( IS-CRATE ?auto_28828 ) ( not ( = ?auto_28827 ?auto_28828 ) ) ( not ( = ?auto_28826 ?auto_28827 ) ) ( not ( = ?auto_28826 ?auto_28828 ) ) ( not ( = ?auto_28835 ?auto_28832 ) ) ( HOIST-AT ?auto_28837 ?auto_28835 ) ( not ( = ?auto_28833 ?auto_28837 ) ) ( SURFACE-AT ?auto_28828 ?auto_28835 ) ( ON ?auto_28828 ?auto_28836 ) ( CLEAR ?auto_28828 ) ( not ( = ?auto_28827 ?auto_28836 ) ) ( not ( = ?auto_28828 ?auto_28836 ) ) ( not ( = ?auto_28826 ?auto_28836 ) ) ( IS-CRATE ?auto_28827 ) ( not ( = ?auto_28829 ?auto_28832 ) ) ( not ( = ?auto_28835 ?auto_28829 ) ) ( HOIST-AT ?auto_28831 ?auto_28829 ) ( not ( = ?auto_28833 ?auto_28831 ) ) ( not ( = ?auto_28837 ?auto_28831 ) ) ( AVAILABLE ?auto_28831 ) ( SURFACE-AT ?auto_28827 ?auto_28829 ) ( ON ?auto_28827 ?auto_28834 ) ( CLEAR ?auto_28827 ) ( not ( = ?auto_28827 ?auto_28834 ) ) ( not ( = ?auto_28828 ?auto_28834 ) ) ( not ( = ?auto_28826 ?auto_28834 ) ) ( not ( = ?auto_28836 ?auto_28834 ) ) ( SURFACE-AT ?auto_28825 ?auto_28832 ) ( CLEAR ?auto_28825 ) ( IS-CRATE ?auto_28826 ) ( not ( = ?auto_28825 ?auto_28826 ) ) ( not ( = ?auto_28827 ?auto_28825 ) ) ( not ( = ?auto_28828 ?auto_28825 ) ) ( not ( = ?auto_28836 ?auto_28825 ) ) ( not ( = ?auto_28834 ?auto_28825 ) ) ( AVAILABLE ?auto_28833 ) ( TRUCK-AT ?auto_28830 ?auto_28835 ) ( LIFTING ?auto_28837 ?auto_28826 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28826 ?auto_28827 ?auto_28828 )
      ( MAKE-3CRATE-VERIFY ?auto_28825 ?auto_28826 ?auto_28827 ?auto_28828 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28838 - SURFACE
      ?auto_28839 - SURFACE
    )
    :vars
    (
      ?auto_28845 - HOIST
      ?auto_28844 - PLACE
      ?auto_28840 - SURFACE
      ?auto_28847 - PLACE
      ?auto_28850 - HOIST
      ?auto_28848 - SURFACE
      ?auto_28841 - PLACE
      ?auto_28843 - HOIST
      ?auto_28846 - SURFACE
      ?auto_28849 - SURFACE
      ?auto_28842 - TRUCK
      ?auto_28851 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28845 ?auto_28844 ) ( IS-CRATE ?auto_28839 ) ( not ( = ?auto_28838 ?auto_28839 ) ) ( not ( = ?auto_28840 ?auto_28838 ) ) ( not ( = ?auto_28840 ?auto_28839 ) ) ( not ( = ?auto_28847 ?auto_28844 ) ) ( HOIST-AT ?auto_28850 ?auto_28847 ) ( not ( = ?auto_28845 ?auto_28850 ) ) ( SURFACE-AT ?auto_28839 ?auto_28847 ) ( ON ?auto_28839 ?auto_28848 ) ( CLEAR ?auto_28839 ) ( not ( = ?auto_28838 ?auto_28848 ) ) ( not ( = ?auto_28839 ?auto_28848 ) ) ( not ( = ?auto_28840 ?auto_28848 ) ) ( IS-CRATE ?auto_28838 ) ( not ( = ?auto_28841 ?auto_28844 ) ) ( not ( = ?auto_28847 ?auto_28841 ) ) ( HOIST-AT ?auto_28843 ?auto_28841 ) ( not ( = ?auto_28845 ?auto_28843 ) ) ( not ( = ?auto_28850 ?auto_28843 ) ) ( AVAILABLE ?auto_28843 ) ( SURFACE-AT ?auto_28838 ?auto_28841 ) ( ON ?auto_28838 ?auto_28846 ) ( CLEAR ?auto_28838 ) ( not ( = ?auto_28838 ?auto_28846 ) ) ( not ( = ?auto_28839 ?auto_28846 ) ) ( not ( = ?auto_28840 ?auto_28846 ) ) ( not ( = ?auto_28848 ?auto_28846 ) ) ( SURFACE-AT ?auto_28849 ?auto_28844 ) ( CLEAR ?auto_28849 ) ( IS-CRATE ?auto_28840 ) ( not ( = ?auto_28849 ?auto_28840 ) ) ( not ( = ?auto_28838 ?auto_28849 ) ) ( not ( = ?auto_28839 ?auto_28849 ) ) ( not ( = ?auto_28848 ?auto_28849 ) ) ( not ( = ?auto_28846 ?auto_28849 ) ) ( AVAILABLE ?auto_28845 ) ( TRUCK-AT ?auto_28842 ?auto_28847 ) ( AVAILABLE ?auto_28850 ) ( SURFACE-AT ?auto_28840 ?auto_28847 ) ( ON ?auto_28840 ?auto_28851 ) ( CLEAR ?auto_28840 ) ( not ( = ?auto_28838 ?auto_28851 ) ) ( not ( = ?auto_28839 ?auto_28851 ) ) ( not ( = ?auto_28840 ?auto_28851 ) ) ( not ( = ?auto_28848 ?auto_28851 ) ) ( not ( = ?auto_28846 ?auto_28851 ) ) ( not ( = ?auto_28849 ?auto_28851 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28850 ?auto_28840 ?auto_28851 ?auto_28847 )
      ( MAKE-2CRATE ?auto_28840 ?auto_28838 ?auto_28839 )
      ( MAKE-1CRATE-VERIFY ?auto_28838 ?auto_28839 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28852 - SURFACE
      ?auto_28853 - SURFACE
      ?auto_28854 - SURFACE
    )
    :vars
    (
      ?auto_28864 - HOIST
      ?auto_28858 - PLACE
      ?auto_28862 - PLACE
      ?auto_28865 - HOIST
      ?auto_28860 - SURFACE
      ?auto_28857 - PLACE
      ?auto_28863 - HOIST
      ?auto_28861 - SURFACE
      ?auto_28855 - SURFACE
      ?auto_28859 - TRUCK
      ?auto_28856 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28864 ?auto_28858 ) ( IS-CRATE ?auto_28854 ) ( not ( = ?auto_28853 ?auto_28854 ) ) ( not ( = ?auto_28852 ?auto_28853 ) ) ( not ( = ?auto_28852 ?auto_28854 ) ) ( not ( = ?auto_28862 ?auto_28858 ) ) ( HOIST-AT ?auto_28865 ?auto_28862 ) ( not ( = ?auto_28864 ?auto_28865 ) ) ( SURFACE-AT ?auto_28854 ?auto_28862 ) ( ON ?auto_28854 ?auto_28860 ) ( CLEAR ?auto_28854 ) ( not ( = ?auto_28853 ?auto_28860 ) ) ( not ( = ?auto_28854 ?auto_28860 ) ) ( not ( = ?auto_28852 ?auto_28860 ) ) ( IS-CRATE ?auto_28853 ) ( not ( = ?auto_28857 ?auto_28858 ) ) ( not ( = ?auto_28862 ?auto_28857 ) ) ( HOIST-AT ?auto_28863 ?auto_28857 ) ( not ( = ?auto_28864 ?auto_28863 ) ) ( not ( = ?auto_28865 ?auto_28863 ) ) ( AVAILABLE ?auto_28863 ) ( SURFACE-AT ?auto_28853 ?auto_28857 ) ( ON ?auto_28853 ?auto_28861 ) ( CLEAR ?auto_28853 ) ( not ( = ?auto_28853 ?auto_28861 ) ) ( not ( = ?auto_28854 ?auto_28861 ) ) ( not ( = ?auto_28852 ?auto_28861 ) ) ( not ( = ?auto_28860 ?auto_28861 ) ) ( SURFACE-AT ?auto_28855 ?auto_28858 ) ( CLEAR ?auto_28855 ) ( IS-CRATE ?auto_28852 ) ( not ( = ?auto_28855 ?auto_28852 ) ) ( not ( = ?auto_28853 ?auto_28855 ) ) ( not ( = ?auto_28854 ?auto_28855 ) ) ( not ( = ?auto_28860 ?auto_28855 ) ) ( not ( = ?auto_28861 ?auto_28855 ) ) ( AVAILABLE ?auto_28864 ) ( TRUCK-AT ?auto_28859 ?auto_28862 ) ( AVAILABLE ?auto_28865 ) ( SURFACE-AT ?auto_28852 ?auto_28862 ) ( ON ?auto_28852 ?auto_28856 ) ( CLEAR ?auto_28852 ) ( not ( = ?auto_28853 ?auto_28856 ) ) ( not ( = ?auto_28854 ?auto_28856 ) ) ( not ( = ?auto_28852 ?auto_28856 ) ) ( not ( = ?auto_28860 ?auto_28856 ) ) ( not ( = ?auto_28861 ?auto_28856 ) ) ( not ( = ?auto_28855 ?auto_28856 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28853 ?auto_28854 )
      ( MAKE-2CRATE-VERIFY ?auto_28852 ?auto_28853 ?auto_28854 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28866 - SURFACE
      ?auto_28867 - SURFACE
      ?auto_28868 - SURFACE
      ?auto_28869 - SURFACE
    )
    :vars
    (
      ?auto_28879 - HOIST
      ?auto_28870 - PLACE
      ?auto_28874 - PLACE
      ?auto_28877 - HOIST
      ?auto_28878 - SURFACE
      ?auto_28873 - PLACE
      ?auto_28876 - HOIST
      ?auto_28871 - SURFACE
      ?auto_28872 - TRUCK
      ?auto_28875 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28879 ?auto_28870 ) ( IS-CRATE ?auto_28869 ) ( not ( = ?auto_28868 ?auto_28869 ) ) ( not ( = ?auto_28867 ?auto_28868 ) ) ( not ( = ?auto_28867 ?auto_28869 ) ) ( not ( = ?auto_28874 ?auto_28870 ) ) ( HOIST-AT ?auto_28877 ?auto_28874 ) ( not ( = ?auto_28879 ?auto_28877 ) ) ( SURFACE-AT ?auto_28869 ?auto_28874 ) ( ON ?auto_28869 ?auto_28878 ) ( CLEAR ?auto_28869 ) ( not ( = ?auto_28868 ?auto_28878 ) ) ( not ( = ?auto_28869 ?auto_28878 ) ) ( not ( = ?auto_28867 ?auto_28878 ) ) ( IS-CRATE ?auto_28868 ) ( not ( = ?auto_28873 ?auto_28870 ) ) ( not ( = ?auto_28874 ?auto_28873 ) ) ( HOIST-AT ?auto_28876 ?auto_28873 ) ( not ( = ?auto_28879 ?auto_28876 ) ) ( not ( = ?auto_28877 ?auto_28876 ) ) ( AVAILABLE ?auto_28876 ) ( SURFACE-AT ?auto_28868 ?auto_28873 ) ( ON ?auto_28868 ?auto_28871 ) ( CLEAR ?auto_28868 ) ( not ( = ?auto_28868 ?auto_28871 ) ) ( not ( = ?auto_28869 ?auto_28871 ) ) ( not ( = ?auto_28867 ?auto_28871 ) ) ( not ( = ?auto_28878 ?auto_28871 ) ) ( SURFACE-AT ?auto_28866 ?auto_28870 ) ( CLEAR ?auto_28866 ) ( IS-CRATE ?auto_28867 ) ( not ( = ?auto_28866 ?auto_28867 ) ) ( not ( = ?auto_28868 ?auto_28866 ) ) ( not ( = ?auto_28869 ?auto_28866 ) ) ( not ( = ?auto_28878 ?auto_28866 ) ) ( not ( = ?auto_28871 ?auto_28866 ) ) ( AVAILABLE ?auto_28879 ) ( TRUCK-AT ?auto_28872 ?auto_28874 ) ( AVAILABLE ?auto_28877 ) ( SURFACE-AT ?auto_28867 ?auto_28874 ) ( ON ?auto_28867 ?auto_28875 ) ( CLEAR ?auto_28867 ) ( not ( = ?auto_28868 ?auto_28875 ) ) ( not ( = ?auto_28869 ?auto_28875 ) ) ( not ( = ?auto_28867 ?auto_28875 ) ) ( not ( = ?auto_28878 ?auto_28875 ) ) ( not ( = ?auto_28871 ?auto_28875 ) ) ( not ( = ?auto_28866 ?auto_28875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28867 ?auto_28868 ?auto_28869 )
      ( MAKE-3CRATE-VERIFY ?auto_28866 ?auto_28867 ?auto_28868 ?auto_28869 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28880 - SURFACE
      ?auto_28881 - SURFACE
    )
    :vars
    (
      ?auto_28893 - HOIST
      ?auto_28882 - PLACE
      ?auto_28890 - SURFACE
      ?auto_28887 - PLACE
      ?auto_28891 - HOIST
      ?auto_28892 - SURFACE
      ?auto_28886 - PLACE
      ?auto_28889 - HOIST
      ?auto_28883 - SURFACE
      ?auto_28885 - SURFACE
      ?auto_28888 - SURFACE
      ?auto_28884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28893 ?auto_28882 ) ( IS-CRATE ?auto_28881 ) ( not ( = ?auto_28880 ?auto_28881 ) ) ( not ( = ?auto_28890 ?auto_28880 ) ) ( not ( = ?auto_28890 ?auto_28881 ) ) ( not ( = ?auto_28887 ?auto_28882 ) ) ( HOIST-AT ?auto_28891 ?auto_28887 ) ( not ( = ?auto_28893 ?auto_28891 ) ) ( SURFACE-AT ?auto_28881 ?auto_28887 ) ( ON ?auto_28881 ?auto_28892 ) ( CLEAR ?auto_28881 ) ( not ( = ?auto_28880 ?auto_28892 ) ) ( not ( = ?auto_28881 ?auto_28892 ) ) ( not ( = ?auto_28890 ?auto_28892 ) ) ( IS-CRATE ?auto_28880 ) ( not ( = ?auto_28886 ?auto_28882 ) ) ( not ( = ?auto_28887 ?auto_28886 ) ) ( HOIST-AT ?auto_28889 ?auto_28886 ) ( not ( = ?auto_28893 ?auto_28889 ) ) ( not ( = ?auto_28891 ?auto_28889 ) ) ( AVAILABLE ?auto_28889 ) ( SURFACE-AT ?auto_28880 ?auto_28886 ) ( ON ?auto_28880 ?auto_28883 ) ( CLEAR ?auto_28880 ) ( not ( = ?auto_28880 ?auto_28883 ) ) ( not ( = ?auto_28881 ?auto_28883 ) ) ( not ( = ?auto_28890 ?auto_28883 ) ) ( not ( = ?auto_28892 ?auto_28883 ) ) ( SURFACE-AT ?auto_28885 ?auto_28882 ) ( CLEAR ?auto_28885 ) ( IS-CRATE ?auto_28890 ) ( not ( = ?auto_28885 ?auto_28890 ) ) ( not ( = ?auto_28880 ?auto_28885 ) ) ( not ( = ?auto_28881 ?auto_28885 ) ) ( not ( = ?auto_28892 ?auto_28885 ) ) ( not ( = ?auto_28883 ?auto_28885 ) ) ( AVAILABLE ?auto_28893 ) ( AVAILABLE ?auto_28891 ) ( SURFACE-AT ?auto_28890 ?auto_28887 ) ( ON ?auto_28890 ?auto_28888 ) ( CLEAR ?auto_28890 ) ( not ( = ?auto_28880 ?auto_28888 ) ) ( not ( = ?auto_28881 ?auto_28888 ) ) ( not ( = ?auto_28890 ?auto_28888 ) ) ( not ( = ?auto_28892 ?auto_28888 ) ) ( not ( = ?auto_28883 ?auto_28888 ) ) ( not ( = ?auto_28885 ?auto_28888 ) ) ( TRUCK-AT ?auto_28884 ?auto_28882 ) )
    :subtasks
    ( ( !DRIVE ?auto_28884 ?auto_28882 ?auto_28887 )
      ( MAKE-2CRATE ?auto_28890 ?auto_28880 ?auto_28881 )
      ( MAKE-1CRATE-VERIFY ?auto_28880 ?auto_28881 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28894 - SURFACE
      ?auto_28895 - SURFACE
      ?auto_28896 - SURFACE
    )
    :vars
    (
      ?auto_28903 - HOIST
      ?auto_28906 - PLACE
      ?auto_28907 - PLACE
      ?auto_28905 - HOIST
      ?auto_28899 - SURFACE
      ?auto_28900 - PLACE
      ?auto_28902 - HOIST
      ?auto_28897 - SURFACE
      ?auto_28901 - SURFACE
      ?auto_28904 - SURFACE
      ?auto_28898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28903 ?auto_28906 ) ( IS-CRATE ?auto_28896 ) ( not ( = ?auto_28895 ?auto_28896 ) ) ( not ( = ?auto_28894 ?auto_28895 ) ) ( not ( = ?auto_28894 ?auto_28896 ) ) ( not ( = ?auto_28907 ?auto_28906 ) ) ( HOIST-AT ?auto_28905 ?auto_28907 ) ( not ( = ?auto_28903 ?auto_28905 ) ) ( SURFACE-AT ?auto_28896 ?auto_28907 ) ( ON ?auto_28896 ?auto_28899 ) ( CLEAR ?auto_28896 ) ( not ( = ?auto_28895 ?auto_28899 ) ) ( not ( = ?auto_28896 ?auto_28899 ) ) ( not ( = ?auto_28894 ?auto_28899 ) ) ( IS-CRATE ?auto_28895 ) ( not ( = ?auto_28900 ?auto_28906 ) ) ( not ( = ?auto_28907 ?auto_28900 ) ) ( HOIST-AT ?auto_28902 ?auto_28900 ) ( not ( = ?auto_28903 ?auto_28902 ) ) ( not ( = ?auto_28905 ?auto_28902 ) ) ( AVAILABLE ?auto_28902 ) ( SURFACE-AT ?auto_28895 ?auto_28900 ) ( ON ?auto_28895 ?auto_28897 ) ( CLEAR ?auto_28895 ) ( not ( = ?auto_28895 ?auto_28897 ) ) ( not ( = ?auto_28896 ?auto_28897 ) ) ( not ( = ?auto_28894 ?auto_28897 ) ) ( not ( = ?auto_28899 ?auto_28897 ) ) ( SURFACE-AT ?auto_28901 ?auto_28906 ) ( CLEAR ?auto_28901 ) ( IS-CRATE ?auto_28894 ) ( not ( = ?auto_28901 ?auto_28894 ) ) ( not ( = ?auto_28895 ?auto_28901 ) ) ( not ( = ?auto_28896 ?auto_28901 ) ) ( not ( = ?auto_28899 ?auto_28901 ) ) ( not ( = ?auto_28897 ?auto_28901 ) ) ( AVAILABLE ?auto_28903 ) ( AVAILABLE ?auto_28905 ) ( SURFACE-AT ?auto_28894 ?auto_28907 ) ( ON ?auto_28894 ?auto_28904 ) ( CLEAR ?auto_28894 ) ( not ( = ?auto_28895 ?auto_28904 ) ) ( not ( = ?auto_28896 ?auto_28904 ) ) ( not ( = ?auto_28894 ?auto_28904 ) ) ( not ( = ?auto_28899 ?auto_28904 ) ) ( not ( = ?auto_28897 ?auto_28904 ) ) ( not ( = ?auto_28901 ?auto_28904 ) ) ( TRUCK-AT ?auto_28898 ?auto_28906 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28895 ?auto_28896 )
      ( MAKE-2CRATE-VERIFY ?auto_28894 ?auto_28895 ?auto_28896 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28908 - SURFACE
      ?auto_28909 - SURFACE
      ?auto_28910 - SURFACE
      ?auto_28911 - SURFACE
    )
    :vars
    (
      ?auto_28919 - HOIST
      ?auto_28914 - PLACE
      ?auto_28913 - PLACE
      ?auto_28921 - HOIST
      ?auto_28920 - SURFACE
      ?auto_28917 - PLACE
      ?auto_28912 - HOIST
      ?auto_28916 - SURFACE
      ?auto_28918 - SURFACE
      ?auto_28915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28919 ?auto_28914 ) ( IS-CRATE ?auto_28911 ) ( not ( = ?auto_28910 ?auto_28911 ) ) ( not ( = ?auto_28909 ?auto_28910 ) ) ( not ( = ?auto_28909 ?auto_28911 ) ) ( not ( = ?auto_28913 ?auto_28914 ) ) ( HOIST-AT ?auto_28921 ?auto_28913 ) ( not ( = ?auto_28919 ?auto_28921 ) ) ( SURFACE-AT ?auto_28911 ?auto_28913 ) ( ON ?auto_28911 ?auto_28920 ) ( CLEAR ?auto_28911 ) ( not ( = ?auto_28910 ?auto_28920 ) ) ( not ( = ?auto_28911 ?auto_28920 ) ) ( not ( = ?auto_28909 ?auto_28920 ) ) ( IS-CRATE ?auto_28910 ) ( not ( = ?auto_28917 ?auto_28914 ) ) ( not ( = ?auto_28913 ?auto_28917 ) ) ( HOIST-AT ?auto_28912 ?auto_28917 ) ( not ( = ?auto_28919 ?auto_28912 ) ) ( not ( = ?auto_28921 ?auto_28912 ) ) ( AVAILABLE ?auto_28912 ) ( SURFACE-AT ?auto_28910 ?auto_28917 ) ( ON ?auto_28910 ?auto_28916 ) ( CLEAR ?auto_28910 ) ( not ( = ?auto_28910 ?auto_28916 ) ) ( not ( = ?auto_28911 ?auto_28916 ) ) ( not ( = ?auto_28909 ?auto_28916 ) ) ( not ( = ?auto_28920 ?auto_28916 ) ) ( SURFACE-AT ?auto_28908 ?auto_28914 ) ( CLEAR ?auto_28908 ) ( IS-CRATE ?auto_28909 ) ( not ( = ?auto_28908 ?auto_28909 ) ) ( not ( = ?auto_28910 ?auto_28908 ) ) ( not ( = ?auto_28911 ?auto_28908 ) ) ( not ( = ?auto_28920 ?auto_28908 ) ) ( not ( = ?auto_28916 ?auto_28908 ) ) ( AVAILABLE ?auto_28919 ) ( AVAILABLE ?auto_28921 ) ( SURFACE-AT ?auto_28909 ?auto_28913 ) ( ON ?auto_28909 ?auto_28918 ) ( CLEAR ?auto_28909 ) ( not ( = ?auto_28910 ?auto_28918 ) ) ( not ( = ?auto_28911 ?auto_28918 ) ) ( not ( = ?auto_28909 ?auto_28918 ) ) ( not ( = ?auto_28920 ?auto_28918 ) ) ( not ( = ?auto_28916 ?auto_28918 ) ) ( not ( = ?auto_28908 ?auto_28918 ) ) ( TRUCK-AT ?auto_28915 ?auto_28914 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28909 ?auto_28910 ?auto_28911 )
      ( MAKE-3CRATE-VERIFY ?auto_28908 ?auto_28909 ?auto_28910 ?auto_28911 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28936 - SURFACE
      ?auto_28937 - SURFACE
    )
    :vars
    (
      ?auto_28938 - HOIST
      ?auto_28939 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28938 ?auto_28939 ) ( SURFACE-AT ?auto_28936 ?auto_28939 ) ( CLEAR ?auto_28936 ) ( LIFTING ?auto_28938 ?auto_28937 ) ( IS-CRATE ?auto_28937 ) ( not ( = ?auto_28936 ?auto_28937 ) ) )
    :subtasks
    ( ( !DROP ?auto_28938 ?auto_28937 ?auto_28936 ?auto_28939 )
      ( MAKE-1CRATE-VERIFY ?auto_28936 ?auto_28937 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28940 - SURFACE
      ?auto_28941 - SURFACE
      ?auto_28942 - SURFACE
    )
    :vars
    (
      ?auto_28943 - HOIST
      ?auto_28944 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28943 ?auto_28944 ) ( SURFACE-AT ?auto_28941 ?auto_28944 ) ( CLEAR ?auto_28941 ) ( LIFTING ?auto_28943 ?auto_28942 ) ( IS-CRATE ?auto_28942 ) ( not ( = ?auto_28941 ?auto_28942 ) ) ( ON ?auto_28941 ?auto_28940 ) ( not ( = ?auto_28940 ?auto_28941 ) ) ( not ( = ?auto_28940 ?auto_28942 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28941 ?auto_28942 )
      ( MAKE-2CRATE-VERIFY ?auto_28940 ?auto_28941 ?auto_28942 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28945 - SURFACE
      ?auto_28946 - SURFACE
      ?auto_28947 - SURFACE
      ?auto_28948 - SURFACE
    )
    :vars
    (
      ?auto_28949 - HOIST
      ?auto_28950 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28949 ?auto_28950 ) ( SURFACE-AT ?auto_28947 ?auto_28950 ) ( CLEAR ?auto_28947 ) ( LIFTING ?auto_28949 ?auto_28948 ) ( IS-CRATE ?auto_28948 ) ( not ( = ?auto_28947 ?auto_28948 ) ) ( ON ?auto_28946 ?auto_28945 ) ( ON ?auto_28947 ?auto_28946 ) ( not ( = ?auto_28945 ?auto_28946 ) ) ( not ( = ?auto_28945 ?auto_28947 ) ) ( not ( = ?auto_28945 ?auto_28948 ) ) ( not ( = ?auto_28946 ?auto_28947 ) ) ( not ( = ?auto_28946 ?auto_28948 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28947 ?auto_28948 )
      ( MAKE-3CRATE-VERIFY ?auto_28945 ?auto_28946 ?auto_28947 ?auto_28948 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28951 - SURFACE
      ?auto_28952 - SURFACE
      ?auto_28953 - SURFACE
      ?auto_28954 - SURFACE
      ?auto_28955 - SURFACE
    )
    :vars
    (
      ?auto_28956 - HOIST
      ?auto_28957 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28956 ?auto_28957 ) ( SURFACE-AT ?auto_28954 ?auto_28957 ) ( CLEAR ?auto_28954 ) ( LIFTING ?auto_28956 ?auto_28955 ) ( IS-CRATE ?auto_28955 ) ( not ( = ?auto_28954 ?auto_28955 ) ) ( ON ?auto_28952 ?auto_28951 ) ( ON ?auto_28953 ?auto_28952 ) ( ON ?auto_28954 ?auto_28953 ) ( not ( = ?auto_28951 ?auto_28952 ) ) ( not ( = ?auto_28951 ?auto_28953 ) ) ( not ( = ?auto_28951 ?auto_28954 ) ) ( not ( = ?auto_28951 ?auto_28955 ) ) ( not ( = ?auto_28952 ?auto_28953 ) ) ( not ( = ?auto_28952 ?auto_28954 ) ) ( not ( = ?auto_28952 ?auto_28955 ) ) ( not ( = ?auto_28953 ?auto_28954 ) ) ( not ( = ?auto_28953 ?auto_28955 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28954 ?auto_28955 )
      ( MAKE-4CRATE-VERIFY ?auto_28951 ?auto_28952 ?auto_28953 ?auto_28954 ?auto_28955 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28958 - SURFACE
      ?auto_28959 - SURFACE
    )
    :vars
    (
      ?auto_28960 - HOIST
      ?auto_28961 - PLACE
      ?auto_28962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28960 ?auto_28961 ) ( SURFACE-AT ?auto_28958 ?auto_28961 ) ( CLEAR ?auto_28958 ) ( IS-CRATE ?auto_28959 ) ( not ( = ?auto_28958 ?auto_28959 ) ) ( TRUCK-AT ?auto_28962 ?auto_28961 ) ( AVAILABLE ?auto_28960 ) ( IN ?auto_28959 ?auto_28962 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28960 ?auto_28959 ?auto_28962 ?auto_28961 )
      ( MAKE-1CRATE ?auto_28958 ?auto_28959 )
      ( MAKE-1CRATE-VERIFY ?auto_28958 ?auto_28959 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28963 - SURFACE
      ?auto_28964 - SURFACE
      ?auto_28965 - SURFACE
    )
    :vars
    (
      ?auto_28967 - HOIST
      ?auto_28968 - PLACE
      ?auto_28966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28967 ?auto_28968 ) ( SURFACE-AT ?auto_28964 ?auto_28968 ) ( CLEAR ?auto_28964 ) ( IS-CRATE ?auto_28965 ) ( not ( = ?auto_28964 ?auto_28965 ) ) ( TRUCK-AT ?auto_28966 ?auto_28968 ) ( AVAILABLE ?auto_28967 ) ( IN ?auto_28965 ?auto_28966 ) ( ON ?auto_28964 ?auto_28963 ) ( not ( = ?auto_28963 ?auto_28964 ) ) ( not ( = ?auto_28963 ?auto_28965 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28964 ?auto_28965 )
      ( MAKE-2CRATE-VERIFY ?auto_28963 ?auto_28964 ?auto_28965 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28969 - SURFACE
      ?auto_28970 - SURFACE
      ?auto_28971 - SURFACE
      ?auto_28972 - SURFACE
    )
    :vars
    (
      ?auto_28974 - HOIST
      ?auto_28973 - PLACE
      ?auto_28975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28974 ?auto_28973 ) ( SURFACE-AT ?auto_28971 ?auto_28973 ) ( CLEAR ?auto_28971 ) ( IS-CRATE ?auto_28972 ) ( not ( = ?auto_28971 ?auto_28972 ) ) ( TRUCK-AT ?auto_28975 ?auto_28973 ) ( AVAILABLE ?auto_28974 ) ( IN ?auto_28972 ?auto_28975 ) ( ON ?auto_28971 ?auto_28970 ) ( not ( = ?auto_28970 ?auto_28971 ) ) ( not ( = ?auto_28970 ?auto_28972 ) ) ( ON ?auto_28970 ?auto_28969 ) ( not ( = ?auto_28969 ?auto_28970 ) ) ( not ( = ?auto_28969 ?auto_28971 ) ) ( not ( = ?auto_28969 ?auto_28972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28970 ?auto_28971 ?auto_28972 )
      ( MAKE-3CRATE-VERIFY ?auto_28969 ?auto_28970 ?auto_28971 ?auto_28972 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28976 - SURFACE
      ?auto_28977 - SURFACE
      ?auto_28978 - SURFACE
      ?auto_28979 - SURFACE
      ?auto_28980 - SURFACE
    )
    :vars
    (
      ?auto_28982 - HOIST
      ?auto_28981 - PLACE
      ?auto_28983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28982 ?auto_28981 ) ( SURFACE-AT ?auto_28979 ?auto_28981 ) ( CLEAR ?auto_28979 ) ( IS-CRATE ?auto_28980 ) ( not ( = ?auto_28979 ?auto_28980 ) ) ( TRUCK-AT ?auto_28983 ?auto_28981 ) ( AVAILABLE ?auto_28982 ) ( IN ?auto_28980 ?auto_28983 ) ( ON ?auto_28979 ?auto_28978 ) ( not ( = ?auto_28978 ?auto_28979 ) ) ( not ( = ?auto_28978 ?auto_28980 ) ) ( ON ?auto_28977 ?auto_28976 ) ( ON ?auto_28978 ?auto_28977 ) ( not ( = ?auto_28976 ?auto_28977 ) ) ( not ( = ?auto_28976 ?auto_28978 ) ) ( not ( = ?auto_28976 ?auto_28979 ) ) ( not ( = ?auto_28976 ?auto_28980 ) ) ( not ( = ?auto_28977 ?auto_28978 ) ) ( not ( = ?auto_28977 ?auto_28979 ) ) ( not ( = ?auto_28977 ?auto_28980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28978 ?auto_28979 ?auto_28980 )
      ( MAKE-4CRATE-VERIFY ?auto_28976 ?auto_28977 ?auto_28978 ?auto_28979 ?auto_28980 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28984 - SURFACE
      ?auto_28985 - SURFACE
    )
    :vars
    (
      ?auto_28987 - HOIST
      ?auto_28986 - PLACE
      ?auto_28988 - TRUCK
      ?auto_28989 - SURFACE
      ?auto_28990 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28987 ?auto_28986 ) ( SURFACE-AT ?auto_28984 ?auto_28986 ) ( CLEAR ?auto_28984 ) ( IS-CRATE ?auto_28985 ) ( not ( = ?auto_28984 ?auto_28985 ) ) ( AVAILABLE ?auto_28987 ) ( IN ?auto_28985 ?auto_28988 ) ( ON ?auto_28984 ?auto_28989 ) ( not ( = ?auto_28989 ?auto_28984 ) ) ( not ( = ?auto_28989 ?auto_28985 ) ) ( TRUCK-AT ?auto_28988 ?auto_28990 ) ( not ( = ?auto_28990 ?auto_28986 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28988 ?auto_28990 ?auto_28986 )
      ( MAKE-2CRATE ?auto_28989 ?auto_28984 ?auto_28985 )
      ( MAKE-1CRATE-VERIFY ?auto_28984 ?auto_28985 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28991 - SURFACE
      ?auto_28992 - SURFACE
      ?auto_28993 - SURFACE
    )
    :vars
    (
      ?auto_28994 - HOIST
      ?auto_28996 - PLACE
      ?auto_28995 - TRUCK
      ?auto_28997 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28994 ?auto_28996 ) ( SURFACE-AT ?auto_28992 ?auto_28996 ) ( CLEAR ?auto_28992 ) ( IS-CRATE ?auto_28993 ) ( not ( = ?auto_28992 ?auto_28993 ) ) ( AVAILABLE ?auto_28994 ) ( IN ?auto_28993 ?auto_28995 ) ( ON ?auto_28992 ?auto_28991 ) ( not ( = ?auto_28991 ?auto_28992 ) ) ( not ( = ?auto_28991 ?auto_28993 ) ) ( TRUCK-AT ?auto_28995 ?auto_28997 ) ( not ( = ?auto_28997 ?auto_28996 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28992 ?auto_28993 )
      ( MAKE-2CRATE-VERIFY ?auto_28991 ?auto_28992 ?auto_28993 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28998 - SURFACE
      ?auto_28999 - SURFACE
      ?auto_29000 - SURFACE
      ?auto_29001 - SURFACE
    )
    :vars
    (
      ?auto_29003 - HOIST
      ?auto_29004 - PLACE
      ?auto_29005 - TRUCK
      ?auto_29002 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29003 ?auto_29004 ) ( SURFACE-AT ?auto_29000 ?auto_29004 ) ( CLEAR ?auto_29000 ) ( IS-CRATE ?auto_29001 ) ( not ( = ?auto_29000 ?auto_29001 ) ) ( AVAILABLE ?auto_29003 ) ( IN ?auto_29001 ?auto_29005 ) ( ON ?auto_29000 ?auto_28999 ) ( not ( = ?auto_28999 ?auto_29000 ) ) ( not ( = ?auto_28999 ?auto_29001 ) ) ( TRUCK-AT ?auto_29005 ?auto_29002 ) ( not ( = ?auto_29002 ?auto_29004 ) ) ( ON ?auto_28999 ?auto_28998 ) ( not ( = ?auto_28998 ?auto_28999 ) ) ( not ( = ?auto_28998 ?auto_29000 ) ) ( not ( = ?auto_28998 ?auto_29001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28999 ?auto_29000 ?auto_29001 )
      ( MAKE-3CRATE-VERIFY ?auto_28998 ?auto_28999 ?auto_29000 ?auto_29001 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29006 - SURFACE
      ?auto_29007 - SURFACE
      ?auto_29008 - SURFACE
      ?auto_29009 - SURFACE
      ?auto_29010 - SURFACE
    )
    :vars
    (
      ?auto_29012 - HOIST
      ?auto_29013 - PLACE
      ?auto_29014 - TRUCK
      ?auto_29011 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29012 ?auto_29013 ) ( SURFACE-AT ?auto_29009 ?auto_29013 ) ( CLEAR ?auto_29009 ) ( IS-CRATE ?auto_29010 ) ( not ( = ?auto_29009 ?auto_29010 ) ) ( AVAILABLE ?auto_29012 ) ( IN ?auto_29010 ?auto_29014 ) ( ON ?auto_29009 ?auto_29008 ) ( not ( = ?auto_29008 ?auto_29009 ) ) ( not ( = ?auto_29008 ?auto_29010 ) ) ( TRUCK-AT ?auto_29014 ?auto_29011 ) ( not ( = ?auto_29011 ?auto_29013 ) ) ( ON ?auto_29007 ?auto_29006 ) ( ON ?auto_29008 ?auto_29007 ) ( not ( = ?auto_29006 ?auto_29007 ) ) ( not ( = ?auto_29006 ?auto_29008 ) ) ( not ( = ?auto_29006 ?auto_29009 ) ) ( not ( = ?auto_29006 ?auto_29010 ) ) ( not ( = ?auto_29007 ?auto_29008 ) ) ( not ( = ?auto_29007 ?auto_29009 ) ) ( not ( = ?auto_29007 ?auto_29010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29008 ?auto_29009 ?auto_29010 )
      ( MAKE-4CRATE-VERIFY ?auto_29006 ?auto_29007 ?auto_29008 ?auto_29009 ?auto_29010 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29015 - SURFACE
      ?auto_29016 - SURFACE
    )
    :vars
    (
      ?auto_29019 - HOIST
      ?auto_29020 - PLACE
      ?auto_29017 - SURFACE
      ?auto_29021 - TRUCK
      ?auto_29018 - PLACE
      ?auto_29022 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29019 ?auto_29020 ) ( SURFACE-AT ?auto_29015 ?auto_29020 ) ( CLEAR ?auto_29015 ) ( IS-CRATE ?auto_29016 ) ( not ( = ?auto_29015 ?auto_29016 ) ) ( AVAILABLE ?auto_29019 ) ( ON ?auto_29015 ?auto_29017 ) ( not ( = ?auto_29017 ?auto_29015 ) ) ( not ( = ?auto_29017 ?auto_29016 ) ) ( TRUCK-AT ?auto_29021 ?auto_29018 ) ( not ( = ?auto_29018 ?auto_29020 ) ) ( HOIST-AT ?auto_29022 ?auto_29018 ) ( LIFTING ?auto_29022 ?auto_29016 ) ( not ( = ?auto_29019 ?auto_29022 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29022 ?auto_29016 ?auto_29021 ?auto_29018 )
      ( MAKE-2CRATE ?auto_29017 ?auto_29015 ?auto_29016 )
      ( MAKE-1CRATE-VERIFY ?auto_29015 ?auto_29016 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29023 - SURFACE
      ?auto_29024 - SURFACE
      ?auto_29025 - SURFACE
    )
    :vars
    (
      ?auto_29029 - HOIST
      ?auto_29026 - PLACE
      ?auto_29030 - TRUCK
      ?auto_29028 - PLACE
      ?auto_29027 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29029 ?auto_29026 ) ( SURFACE-AT ?auto_29024 ?auto_29026 ) ( CLEAR ?auto_29024 ) ( IS-CRATE ?auto_29025 ) ( not ( = ?auto_29024 ?auto_29025 ) ) ( AVAILABLE ?auto_29029 ) ( ON ?auto_29024 ?auto_29023 ) ( not ( = ?auto_29023 ?auto_29024 ) ) ( not ( = ?auto_29023 ?auto_29025 ) ) ( TRUCK-AT ?auto_29030 ?auto_29028 ) ( not ( = ?auto_29028 ?auto_29026 ) ) ( HOIST-AT ?auto_29027 ?auto_29028 ) ( LIFTING ?auto_29027 ?auto_29025 ) ( not ( = ?auto_29029 ?auto_29027 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29024 ?auto_29025 )
      ( MAKE-2CRATE-VERIFY ?auto_29023 ?auto_29024 ?auto_29025 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29031 - SURFACE
      ?auto_29032 - SURFACE
      ?auto_29033 - SURFACE
      ?auto_29034 - SURFACE
    )
    :vars
    (
      ?auto_29035 - HOIST
      ?auto_29036 - PLACE
      ?auto_29039 - TRUCK
      ?auto_29038 - PLACE
      ?auto_29037 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29035 ?auto_29036 ) ( SURFACE-AT ?auto_29033 ?auto_29036 ) ( CLEAR ?auto_29033 ) ( IS-CRATE ?auto_29034 ) ( not ( = ?auto_29033 ?auto_29034 ) ) ( AVAILABLE ?auto_29035 ) ( ON ?auto_29033 ?auto_29032 ) ( not ( = ?auto_29032 ?auto_29033 ) ) ( not ( = ?auto_29032 ?auto_29034 ) ) ( TRUCK-AT ?auto_29039 ?auto_29038 ) ( not ( = ?auto_29038 ?auto_29036 ) ) ( HOIST-AT ?auto_29037 ?auto_29038 ) ( LIFTING ?auto_29037 ?auto_29034 ) ( not ( = ?auto_29035 ?auto_29037 ) ) ( ON ?auto_29032 ?auto_29031 ) ( not ( = ?auto_29031 ?auto_29032 ) ) ( not ( = ?auto_29031 ?auto_29033 ) ) ( not ( = ?auto_29031 ?auto_29034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29032 ?auto_29033 ?auto_29034 )
      ( MAKE-3CRATE-VERIFY ?auto_29031 ?auto_29032 ?auto_29033 ?auto_29034 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29040 - SURFACE
      ?auto_29041 - SURFACE
      ?auto_29042 - SURFACE
      ?auto_29043 - SURFACE
      ?auto_29044 - SURFACE
    )
    :vars
    (
      ?auto_29045 - HOIST
      ?auto_29046 - PLACE
      ?auto_29049 - TRUCK
      ?auto_29048 - PLACE
      ?auto_29047 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29045 ?auto_29046 ) ( SURFACE-AT ?auto_29043 ?auto_29046 ) ( CLEAR ?auto_29043 ) ( IS-CRATE ?auto_29044 ) ( not ( = ?auto_29043 ?auto_29044 ) ) ( AVAILABLE ?auto_29045 ) ( ON ?auto_29043 ?auto_29042 ) ( not ( = ?auto_29042 ?auto_29043 ) ) ( not ( = ?auto_29042 ?auto_29044 ) ) ( TRUCK-AT ?auto_29049 ?auto_29048 ) ( not ( = ?auto_29048 ?auto_29046 ) ) ( HOIST-AT ?auto_29047 ?auto_29048 ) ( LIFTING ?auto_29047 ?auto_29044 ) ( not ( = ?auto_29045 ?auto_29047 ) ) ( ON ?auto_29041 ?auto_29040 ) ( ON ?auto_29042 ?auto_29041 ) ( not ( = ?auto_29040 ?auto_29041 ) ) ( not ( = ?auto_29040 ?auto_29042 ) ) ( not ( = ?auto_29040 ?auto_29043 ) ) ( not ( = ?auto_29040 ?auto_29044 ) ) ( not ( = ?auto_29041 ?auto_29042 ) ) ( not ( = ?auto_29041 ?auto_29043 ) ) ( not ( = ?auto_29041 ?auto_29044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29042 ?auto_29043 ?auto_29044 )
      ( MAKE-4CRATE-VERIFY ?auto_29040 ?auto_29041 ?auto_29042 ?auto_29043 ?auto_29044 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29050 - SURFACE
      ?auto_29051 - SURFACE
    )
    :vars
    (
      ?auto_29052 - HOIST
      ?auto_29053 - PLACE
      ?auto_29056 - SURFACE
      ?auto_29057 - TRUCK
      ?auto_29055 - PLACE
      ?auto_29054 - HOIST
      ?auto_29058 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29052 ?auto_29053 ) ( SURFACE-AT ?auto_29050 ?auto_29053 ) ( CLEAR ?auto_29050 ) ( IS-CRATE ?auto_29051 ) ( not ( = ?auto_29050 ?auto_29051 ) ) ( AVAILABLE ?auto_29052 ) ( ON ?auto_29050 ?auto_29056 ) ( not ( = ?auto_29056 ?auto_29050 ) ) ( not ( = ?auto_29056 ?auto_29051 ) ) ( TRUCK-AT ?auto_29057 ?auto_29055 ) ( not ( = ?auto_29055 ?auto_29053 ) ) ( HOIST-AT ?auto_29054 ?auto_29055 ) ( not ( = ?auto_29052 ?auto_29054 ) ) ( AVAILABLE ?auto_29054 ) ( SURFACE-AT ?auto_29051 ?auto_29055 ) ( ON ?auto_29051 ?auto_29058 ) ( CLEAR ?auto_29051 ) ( not ( = ?auto_29050 ?auto_29058 ) ) ( not ( = ?auto_29051 ?auto_29058 ) ) ( not ( = ?auto_29056 ?auto_29058 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29054 ?auto_29051 ?auto_29058 ?auto_29055 )
      ( MAKE-2CRATE ?auto_29056 ?auto_29050 ?auto_29051 )
      ( MAKE-1CRATE-VERIFY ?auto_29050 ?auto_29051 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29059 - SURFACE
      ?auto_29060 - SURFACE
      ?auto_29061 - SURFACE
    )
    :vars
    (
      ?auto_29065 - HOIST
      ?auto_29067 - PLACE
      ?auto_29063 - TRUCK
      ?auto_29062 - PLACE
      ?auto_29066 - HOIST
      ?auto_29064 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29065 ?auto_29067 ) ( SURFACE-AT ?auto_29060 ?auto_29067 ) ( CLEAR ?auto_29060 ) ( IS-CRATE ?auto_29061 ) ( not ( = ?auto_29060 ?auto_29061 ) ) ( AVAILABLE ?auto_29065 ) ( ON ?auto_29060 ?auto_29059 ) ( not ( = ?auto_29059 ?auto_29060 ) ) ( not ( = ?auto_29059 ?auto_29061 ) ) ( TRUCK-AT ?auto_29063 ?auto_29062 ) ( not ( = ?auto_29062 ?auto_29067 ) ) ( HOIST-AT ?auto_29066 ?auto_29062 ) ( not ( = ?auto_29065 ?auto_29066 ) ) ( AVAILABLE ?auto_29066 ) ( SURFACE-AT ?auto_29061 ?auto_29062 ) ( ON ?auto_29061 ?auto_29064 ) ( CLEAR ?auto_29061 ) ( not ( = ?auto_29060 ?auto_29064 ) ) ( not ( = ?auto_29061 ?auto_29064 ) ) ( not ( = ?auto_29059 ?auto_29064 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29060 ?auto_29061 )
      ( MAKE-2CRATE-VERIFY ?auto_29059 ?auto_29060 ?auto_29061 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29068 - SURFACE
      ?auto_29069 - SURFACE
      ?auto_29070 - SURFACE
      ?auto_29071 - SURFACE
    )
    :vars
    (
      ?auto_29072 - HOIST
      ?auto_29074 - PLACE
      ?auto_29077 - TRUCK
      ?auto_29075 - PLACE
      ?auto_29076 - HOIST
      ?auto_29073 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29072 ?auto_29074 ) ( SURFACE-AT ?auto_29070 ?auto_29074 ) ( CLEAR ?auto_29070 ) ( IS-CRATE ?auto_29071 ) ( not ( = ?auto_29070 ?auto_29071 ) ) ( AVAILABLE ?auto_29072 ) ( ON ?auto_29070 ?auto_29069 ) ( not ( = ?auto_29069 ?auto_29070 ) ) ( not ( = ?auto_29069 ?auto_29071 ) ) ( TRUCK-AT ?auto_29077 ?auto_29075 ) ( not ( = ?auto_29075 ?auto_29074 ) ) ( HOIST-AT ?auto_29076 ?auto_29075 ) ( not ( = ?auto_29072 ?auto_29076 ) ) ( AVAILABLE ?auto_29076 ) ( SURFACE-AT ?auto_29071 ?auto_29075 ) ( ON ?auto_29071 ?auto_29073 ) ( CLEAR ?auto_29071 ) ( not ( = ?auto_29070 ?auto_29073 ) ) ( not ( = ?auto_29071 ?auto_29073 ) ) ( not ( = ?auto_29069 ?auto_29073 ) ) ( ON ?auto_29069 ?auto_29068 ) ( not ( = ?auto_29068 ?auto_29069 ) ) ( not ( = ?auto_29068 ?auto_29070 ) ) ( not ( = ?auto_29068 ?auto_29071 ) ) ( not ( = ?auto_29068 ?auto_29073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29069 ?auto_29070 ?auto_29071 )
      ( MAKE-3CRATE-VERIFY ?auto_29068 ?auto_29069 ?auto_29070 ?auto_29071 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29078 - SURFACE
      ?auto_29079 - SURFACE
      ?auto_29080 - SURFACE
      ?auto_29081 - SURFACE
      ?auto_29082 - SURFACE
    )
    :vars
    (
      ?auto_29083 - HOIST
      ?auto_29085 - PLACE
      ?auto_29088 - TRUCK
      ?auto_29086 - PLACE
      ?auto_29087 - HOIST
      ?auto_29084 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29083 ?auto_29085 ) ( SURFACE-AT ?auto_29081 ?auto_29085 ) ( CLEAR ?auto_29081 ) ( IS-CRATE ?auto_29082 ) ( not ( = ?auto_29081 ?auto_29082 ) ) ( AVAILABLE ?auto_29083 ) ( ON ?auto_29081 ?auto_29080 ) ( not ( = ?auto_29080 ?auto_29081 ) ) ( not ( = ?auto_29080 ?auto_29082 ) ) ( TRUCK-AT ?auto_29088 ?auto_29086 ) ( not ( = ?auto_29086 ?auto_29085 ) ) ( HOIST-AT ?auto_29087 ?auto_29086 ) ( not ( = ?auto_29083 ?auto_29087 ) ) ( AVAILABLE ?auto_29087 ) ( SURFACE-AT ?auto_29082 ?auto_29086 ) ( ON ?auto_29082 ?auto_29084 ) ( CLEAR ?auto_29082 ) ( not ( = ?auto_29081 ?auto_29084 ) ) ( not ( = ?auto_29082 ?auto_29084 ) ) ( not ( = ?auto_29080 ?auto_29084 ) ) ( ON ?auto_29079 ?auto_29078 ) ( ON ?auto_29080 ?auto_29079 ) ( not ( = ?auto_29078 ?auto_29079 ) ) ( not ( = ?auto_29078 ?auto_29080 ) ) ( not ( = ?auto_29078 ?auto_29081 ) ) ( not ( = ?auto_29078 ?auto_29082 ) ) ( not ( = ?auto_29078 ?auto_29084 ) ) ( not ( = ?auto_29079 ?auto_29080 ) ) ( not ( = ?auto_29079 ?auto_29081 ) ) ( not ( = ?auto_29079 ?auto_29082 ) ) ( not ( = ?auto_29079 ?auto_29084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29080 ?auto_29081 ?auto_29082 )
      ( MAKE-4CRATE-VERIFY ?auto_29078 ?auto_29079 ?auto_29080 ?auto_29081 ?auto_29082 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29089 - SURFACE
      ?auto_29090 - SURFACE
    )
    :vars
    (
      ?auto_29091 - HOIST
      ?auto_29093 - PLACE
      ?auto_29097 - SURFACE
      ?auto_29094 - PLACE
      ?auto_29095 - HOIST
      ?auto_29092 - SURFACE
      ?auto_29096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29091 ?auto_29093 ) ( SURFACE-AT ?auto_29089 ?auto_29093 ) ( CLEAR ?auto_29089 ) ( IS-CRATE ?auto_29090 ) ( not ( = ?auto_29089 ?auto_29090 ) ) ( AVAILABLE ?auto_29091 ) ( ON ?auto_29089 ?auto_29097 ) ( not ( = ?auto_29097 ?auto_29089 ) ) ( not ( = ?auto_29097 ?auto_29090 ) ) ( not ( = ?auto_29094 ?auto_29093 ) ) ( HOIST-AT ?auto_29095 ?auto_29094 ) ( not ( = ?auto_29091 ?auto_29095 ) ) ( AVAILABLE ?auto_29095 ) ( SURFACE-AT ?auto_29090 ?auto_29094 ) ( ON ?auto_29090 ?auto_29092 ) ( CLEAR ?auto_29090 ) ( not ( = ?auto_29089 ?auto_29092 ) ) ( not ( = ?auto_29090 ?auto_29092 ) ) ( not ( = ?auto_29097 ?auto_29092 ) ) ( TRUCK-AT ?auto_29096 ?auto_29093 ) )
    :subtasks
    ( ( !DRIVE ?auto_29096 ?auto_29093 ?auto_29094 )
      ( MAKE-2CRATE ?auto_29097 ?auto_29089 ?auto_29090 )
      ( MAKE-1CRATE-VERIFY ?auto_29089 ?auto_29090 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29098 - SURFACE
      ?auto_29099 - SURFACE
      ?auto_29100 - SURFACE
    )
    :vars
    (
      ?auto_29101 - HOIST
      ?auto_29106 - PLACE
      ?auto_29102 - PLACE
      ?auto_29105 - HOIST
      ?auto_29103 - SURFACE
      ?auto_29104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29101 ?auto_29106 ) ( SURFACE-AT ?auto_29099 ?auto_29106 ) ( CLEAR ?auto_29099 ) ( IS-CRATE ?auto_29100 ) ( not ( = ?auto_29099 ?auto_29100 ) ) ( AVAILABLE ?auto_29101 ) ( ON ?auto_29099 ?auto_29098 ) ( not ( = ?auto_29098 ?auto_29099 ) ) ( not ( = ?auto_29098 ?auto_29100 ) ) ( not ( = ?auto_29102 ?auto_29106 ) ) ( HOIST-AT ?auto_29105 ?auto_29102 ) ( not ( = ?auto_29101 ?auto_29105 ) ) ( AVAILABLE ?auto_29105 ) ( SURFACE-AT ?auto_29100 ?auto_29102 ) ( ON ?auto_29100 ?auto_29103 ) ( CLEAR ?auto_29100 ) ( not ( = ?auto_29099 ?auto_29103 ) ) ( not ( = ?auto_29100 ?auto_29103 ) ) ( not ( = ?auto_29098 ?auto_29103 ) ) ( TRUCK-AT ?auto_29104 ?auto_29106 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29099 ?auto_29100 )
      ( MAKE-2CRATE-VERIFY ?auto_29098 ?auto_29099 ?auto_29100 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29107 - SURFACE
      ?auto_29108 - SURFACE
      ?auto_29109 - SURFACE
      ?auto_29110 - SURFACE
    )
    :vars
    (
      ?auto_29116 - HOIST
      ?auto_29114 - PLACE
      ?auto_29112 - PLACE
      ?auto_29113 - HOIST
      ?auto_29115 - SURFACE
      ?auto_29111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29116 ?auto_29114 ) ( SURFACE-AT ?auto_29109 ?auto_29114 ) ( CLEAR ?auto_29109 ) ( IS-CRATE ?auto_29110 ) ( not ( = ?auto_29109 ?auto_29110 ) ) ( AVAILABLE ?auto_29116 ) ( ON ?auto_29109 ?auto_29108 ) ( not ( = ?auto_29108 ?auto_29109 ) ) ( not ( = ?auto_29108 ?auto_29110 ) ) ( not ( = ?auto_29112 ?auto_29114 ) ) ( HOIST-AT ?auto_29113 ?auto_29112 ) ( not ( = ?auto_29116 ?auto_29113 ) ) ( AVAILABLE ?auto_29113 ) ( SURFACE-AT ?auto_29110 ?auto_29112 ) ( ON ?auto_29110 ?auto_29115 ) ( CLEAR ?auto_29110 ) ( not ( = ?auto_29109 ?auto_29115 ) ) ( not ( = ?auto_29110 ?auto_29115 ) ) ( not ( = ?auto_29108 ?auto_29115 ) ) ( TRUCK-AT ?auto_29111 ?auto_29114 ) ( ON ?auto_29108 ?auto_29107 ) ( not ( = ?auto_29107 ?auto_29108 ) ) ( not ( = ?auto_29107 ?auto_29109 ) ) ( not ( = ?auto_29107 ?auto_29110 ) ) ( not ( = ?auto_29107 ?auto_29115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29108 ?auto_29109 ?auto_29110 )
      ( MAKE-3CRATE-VERIFY ?auto_29107 ?auto_29108 ?auto_29109 ?auto_29110 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29117 - SURFACE
      ?auto_29118 - SURFACE
      ?auto_29119 - SURFACE
      ?auto_29120 - SURFACE
      ?auto_29121 - SURFACE
    )
    :vars
    (
      ?auto_29127 - HOIST
      ?auto_29125 - PLACE
      ?auto_29123 - PLACE
      ?auto_29124 - HOIST
      ?auto_29126 - SURFACE
      ?auto_29122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29127 ?auto_29125 ) ( SURFACE-AT ?auto_29120 ?auto_29125 ) ( CLEAR ?auto_29120 ) ( IS-CRATE ?auto_29121 ) ( not ( = ?auto_29120 ?auto_29121 ) ) ( AVAILABLE ?auto_29127 ) ( ON ?auto_29120 ?auto_29119 ) ( not ( = ?auto_29119 ?auto_29120 ) ) ( not ( = ?auto_29119 ?auto_29121 ) ) ( not ( = ?auto_29123 ?auto_29125 ) ) ( HOIST-AT ?auto_29124 ?auto_29123 ) ( not ( = ?auto_29127 ?auto_29124 ) ) ( AVAILABLE ?auto_29124 ) ( SURFACE-AT ?auto_29121 ?auto_29123 ) ( ON ?auto_29121 ?auto_29126 ) ( CLEAR ?auto_29121 ) ( not ( = ?auto_29120 ?auto_29126 ) ) ( not ( = ?auto_29121 ?auto_29126 ) ) ( not ( = ?auto_29119 ?auto_29126 ) ) ( TRUCK-AT ?auto_29122 ?auto_29125 ) ( ON ?auto_29118 ?auto_29117 ) ( ON ?auto_29119 ?auto_29118 ) ( not ( = ?auto_29117 ?auto_29118 ) ) ( not ( = ?auto_29117 ?auto_29119 ) ) ( not ( = ?auto_29117 ?auto_29120 ) ) ( not ( = ?auto_29117 ?auto_29121 ) ) ( not ( = ?auto_29117 ?auto_29126 ) ) ( not ( = ?auto_29118 ?auto_29119 ) ) ( not ( = ?auto_29118 ?auto_29120 ) ) ( not ( = ?auto_29118 ?auto_29121 ) ) ( not ( = ?auto_29118 ?auto_29126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29119 ?auto_29120 ?auto_29121 )
      ( MAKE-4CRATE-VERIFY ?auto_29117 ?auto_29118 ?auto_29119 ?auto_29120 ?auto_29121 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29128 - SURFACE
      ?auto_29129 - SURFACE
    )
    :vars
    (
      ?auto_29136 - HOIST
      ?auto_29134 - PLACE
      ?auto_29133 - SURFACE
      ?auto_29131 - PLACE
      ?auto_29132 - HOIST
      ?auto_29135 - SURFACE
      ?auto_29130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29136 ?auto_29134 ) ( IS-CRATE ?auto_29129 ) ( not ( = ?auto_29128 ?auto_29129 ) ) ( not ( = ?auto_29133 ?auto_29128 ) ) ( not ( = ?auto_29133 ?auto_29129 ) ) ( not ( = ?auto_29131 ?auto_29134 ) ) ( HOIST-AT ?auto_29132 ?auto_29131 ) ( not ( = ?auto_29136 ?auto_29132 ) ) ( AVAILABLE ?auto_29132 ) ( SURFACE-AT ?auto_29129 ?auto_29131 ) ( ON ?auto_29129 ?auto_29135 ) ( CLEAR ?auto_29129 ) ( not ( = ?auto_29128 ?auto_29135 ) ) ( not ( = ?auto_29129 ?auto_29135 ) ) ( not ( = ?auto_29133 ?auto_29135 ) ) ( TRUCK-AT ?auto_29130 ?auto_29134 ) ( SURFACE-AT ?auto_29133 ?auto_29134 ) ( CLEAR ?auto_29133 ) ( LIFTING ?auto_29136 ?auto_29128 ) ( IS-CRATE ?auto_29128 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29133 ?auto_29128 )
      ( MAKE-2CRATE ?auto_29133 ?auto_29128 ?auto_29129 )
      ( MAKE-1CRATE-VERIFY ?auto_29128 ?auto_29129 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29137 - SURFACE
      ?auto_29138 - SURFACE
      ?auto_29139 - SURFACE
    )
    :vars
    (
      ?auto_29140 - HOIST
      ?auto_29142 - PLACE
      ?auto_29141 - PLACE
      ?auto_29145 - HOIST
      ?auto_29144 - SURFACE
      ?auto_29143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29140 ?auto_29142 ) ( IS-CRATE ?auto_29139 ) ( not ( = ?auto_29138 ?auto_29139 ) ) ( not ( = ?auto_29137 ?auto_29138 ) ) ( not ( = ?auto_29137 ?auto_29139 ) ) ( not ( = ?auto_29141 ?auto_29142 ) ) ( HOIST-AT ?auto_29145 ?auto_29141 ) ( not ( = ?auto_29140 ?auto_29145 ) ) ( AVAILABLE ?auto_29145 ) ( SURFACE-AT ?auto_29139 ?auto_29141 ) ( ON ?auto_29139 ?auto_29144 ) ( CLEAR ?auto_29139 ) ( not ( = ?auto_29138 ?auto_29144 ) ) ( not ( = ?auto_29139 ?auto_29144 ) ) ( not ( = ?auto_29137 ?auto_29144 ) ) ( TRUCK-AT ?auto_29143 ?auto_29142 ) ( SURFACE-AT ?auto_29137 ?auto_29142 ) ( CLEAR ?auto_29137 ) ( LIFTING ?auto_29140 ?auto_29138 ) ( IS-CRATE ?auto_29138 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29138 ?auto_29139 )
      ( MAKE-2CRATE-VERIFY ?auto_29137 ?auto_29138 ?auto_29139 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29146 - SURFACE
      ?auto_29147 - SURFACE
      ?auto_29148 - SURFACE
      ?auto_29149 - SURFACE
    )
    :vars
    (
      ?auto_29154 - HOIST
      ?auto_29152 - PLACE
      ?auto_29153 - PLACE
      ?auto_29150 - HOIST
      ?auto_29151 - SURFACE
      ?auto_29155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29154 ?auto_29152 ) ( IS-CRATE ?auto_29149 ) ( not ( = ?auto_29148 ?auto_29149 ) ) ( not ( = ?auto_29147 ?auto_29148 ) ) ( not ( = ?auto_29147 ?auto_29149 ) ) ( not ( = ?auto_29153 ?auto_29152 ) ) ( HOIST-AT ?auto_29150 ?auto_29153 ) ( not ( = ?auto_29154 ?auto_29150 ) ) ( AVAILABLE ?auto_29150 ) ( SURFACE-AT ?auto_29149 ?auto_29153 ) ( ON ?auto_29149 ?auto_29151 ) ( CLEAR ?auto_29149 ) ( not ( = ?auto_29148 ?auto_29151 ) ) ( not ( = ?auto_29149 ?auto_29151 ) ) ( not ( = ?auto_29147 ?auto_29151 ) ) ( TRUCK-AT ?auto_29155 ?auto_29152 ) ( SURFACE-AT ?auto_29147 ?auto_29152 ) ( CLEAR ?auto_29147 ) ( LIFTING ?auto_29154 ?auto_29148 ) ( IS-CRATE ?auto_29148 ) ( ON ?auto_29147 ?auto_29146 ) ( not ( = ?auto_29146 ?auto_29147 ) ) ( not ( = ?auto_29146 ?auto_29148 ) ) ( not ( = ?auto_29146 ?auto_29149 ) ) ( not ( = ?auto_29146 ?auto_29151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29147 ?auto_29148 ?auto_29149 )
      ( MAKE-3CRATE-VERIFY ?auto_29146 ?auto_29147 ?auto_29148 ?auto_29149 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29156 - SURFACE
      ?auto_29157 - SURFACE
      ?auto_29158 - SURFACE
      ?auto_29159 - SURFACE
      ?auto_29160 - SURFACE
    )
    :vars
    (
      ?auto_29165 - HOIST
      ?auto_29163 - PLACE
      ?auto_29164 - PLACE
      ?auto_29161 - HOIST
      ?auto_29162 - SURFACE
      ?auto_29166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29165 ?auto_29163 ) ( IS-CRATE ?auto_29160 ) ( not ( = ?auto_29159 ?auto_29160 ) ) ( not ( = ?auto_29158 ?auto_29159 ) ) ( not ( = ?auto_29158 ?auto_29160 ) ) ( not ( = ?auto_29164 ?auto_29163 ) ) ( HOIST-AT ?auto_29161 ?auto_29164 ) ( not ( = ?auto_29165 ?auto_29161 ) ) ( AVAILABLE ?auto_29161 ) ( SURFACE-AT ?auto_29160 ?auto_29164 ) ( ON ?auto_29160 ?auto_29162 ) ( CLEAR ?auto_29160 ) ( not ( = ?auto_29159 ?auto_29162 ) ) ( not ( = ?auto_29160 ?auto_29162 ) ) ( not ( = ?auto_29158 ?auto_29162 ) ) ( TRUCK-AT ?auto_29166 ?auto_29163 ) ( SURFACE-AT ?auto_29158 ?auto_29163 ) ( CLEAR ?auto_29158 ) ( LIFTING ?auto_29165 ?auto_29159 ) ( IS-CRATE ?auto_29159 ) ( ON ?auto_29157 ?auto_29156 ) ( ON ?auto_29158 ?auto_29157 ) ( not ( = ?auto_29156 ?auto_29157 ) ) ( not ( = ?auto_29156 ?auto_29158 ) ) ( not ( = ?auto_29156 ?auto_29159 ) ) ( not ( = ?auto_29156 ?auto_29160 ) ) ( not ( = ?auto_29156 ?auto_29162 ) ) ( not ( = ?auto_29157 ?auto_29158 ) ) ( not ( = ?auto_29157 ?auto_29159 ) ) ( not ( = ?auto_29157 ?auto_29160 ) ) ( not ( = ?auto_29157 ?auto_29162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29158 ?auto_29159 ?auto_29160 )
      ( MAKE-4CRATE-VERIFY ?auto_29156 ?auto_29157 ?auto_29158 ?auto_29159 ?auto_29160 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29167 - SURFACE
      ?auto_29168 - SURFACE
    )
    :vars
    (
      ?auto_29174 - HOIST
      ?auto_29171 - PLACE
      ?auto_29173 - SURFACE
      ?auto_29172 - PLACE
      ?auto_29169 - HOIST
      ?auto_29170 - SURFACE
      ?auto_29175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29174 ?auto_29171 ) ( IS-CRATE ?auto_29168 ) ( not ( = ?auto_29167 ?auto_29168 ) ) ( not ( = ?auto_29173 ?auto_29167 ) ) ( not ( = ?auto_29173 ?auto_29168 ) ) ( not ( = ?auto_29172 ?auto_29171 ) ) ( HOIST-AT ?auto_29169 ?auto_29172 ) ( not ( = ?auto_29174 ?auto_29169 ) ) ( AVAILABLE ?auto_29169 ) ( SURFACE-AT ?auto_29168 ?auto_29172 ) ( ON ?auto_29168 ?auto_29170 ) ( CLEAR ?auto_29168 ) ( not ( = ?auto_29167 ?auto_29170 ) ) ( not ( = ?auto_29168 ?auto_29170 ) ) ( not ( = ?auto_29173 ?auto_29170 ) ) ( TRUCK-AT ?auto_29175 ?auto_29171 ) ( SURFACE-AT ?auto_29173 ?auto_29171 ) ( CLEAR ?auto_29173 ) ( IS-CRATE ?auto_29167 ) ( AVAILABLE ?auto_29174 ) ( IN ?auto_29167 ?auto_29175 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29174 ?auto_29167 ?auto_29175 ?auto_29171 )
      ( MAKE-2CRATE ?auto_29173 ?auto_29167 ?auto_29168 )
      ( MAKE-1CRATE-VERIFY ?auto_29167 ?auto_29168 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29176 - SURFACE
      ?auto_29177 - SURFACE
      ?auto_29178 - SURFACE
    )
    :vars
    (
      ?auto_29182 - HOIST
      ?auto_29184 - PLACE
      ?auto_29183 - PLACE
      ?auto_29180 - HOIST
      ?auto_29181 - SURFACE
      ?auto_29179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29182 ?auto_29184 ) ( IS-CRATE ?auto_29178 ) ( not ( = ?auto_29177 ?auto_29178 ) ) ( not ( = ?auto_29176 ?auto_29177 ) ) ( not ( = ?auto_29176 ?auto_29178 ) ) ( not ( = ?auto_29183 ?auto_29184 ) ) ( HOIST-AT ?auto_29180 ?auto_29183 ) ( not ( = ?auto_29182 ?auto_29180 ) ) ( AVAILABLE ?auto_29180 ) ( SURFACE-AT ?auto_29178 ?auto_29183 ) ( ON ?auto_29178 ?auto_29181 ) ( CLEAR ?auto_29178 ) ( not ( = ?auto_29177 ?auto_29181 ) ) ( not ( = ?auto_29178 ?auto_29181 ) ) ( not ( = ?auto_29176 ?auto_29181 ) ) ( TRUCK-AT ?auto_29179 ?auto_29184 ) ( SURFACE-AT ?auto_29176 ?auto_29184 ) ( CLEAR ?auto_29176 ) ( IS-CRATE ?auto_29177 ) ( AVAILABLE ?auto_29182 ) ( IN ?auto_29177 ?auto_29179 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29177 ?auto_29178 )
      ( MAKE-2CRATE-VERIFY ?auto_29176 ?auto_29177 ?auto_29178 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29185 - SURFACE
      ?auto_29186 - SURFACE
      ?auto_29187 - SURFACE
      ?auto_29188 - SURFACE
    )
    :vars
    (
      ?auto_29191 - HOIST
      ?auto_29194 - PLACE
      ?auto_29192 - PLACE
      ?auto_29190 - HOIST
      ?auto_29193 - SURFACE
      ?auto_29189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29191 ?auto_29194 ) ( IS-CRATE ?auto_29188 ) ( not ( = ?auto_29187 ?auto_29188 ) ) ( not ( = ?auto_29186 ?auto_29187 ) ) ( not ( = ?auto_29186 ?auto_29188 ) ) ( not ( = ?auto_29192 ?auto_29194 ) ) ( HOIST-AT ?auto_29190 ?auto_29192 ) ( not ( = ?auto_29191 ?auto_29190 ) ) ( AVAILABLE ?auto_29190 ) ( SURFACE-AT ?auto_29188 ?auto_29192 ) ( ON ?auto_29188 ?auto_29193 ) ( CLEAR ?auto_29188 ) ( not ( = ?auto_29187 ?auto_29193 ) ) ( not ( = ?auto_29188 ?auto_29193 ) ) ( not ( = ?auto_29186 ?auto_29193 ) ) ( TRUCK-AT ?auto_29189 ?auto_29194 ) ( SURFACE-AT ?auto_29186 ?auto_29194 ) ( CLEAR ?auto_29186 ) ( IS-CRATE ?auto_29187 ) ( AVAILABLE ?auto_29191 ) ( IN ?auto_29187 ?auto_29189 ) ( ON ?auto_29186 ?auto_29185 ) ( not ( = ?auto_29185 ?auto_29186 ) ) ( not ( = ?auto_29185 ?auto_29187 ) ) ( not ( = ?auto_29185 ?auto_29188 ) ) ( not ( = ?auto_29185 ?auto_29193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29186 ?auto_29187 ?auto_29188 )
      ( MAKE-3CRATE-VERIFY ?auto_29185 ?auto_29186 ?auto_29187 ?auto_29188 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29195 - SURFACE
      ?auto_29196 - SURFACE
      ?auto_29197 - SURFACE
      ?auto_29198 - SURFACE
      ?auto_29199 - SURFACE
    )
    :vars
    (
      ?auto_29202 - HOIST
      ?auto_29205 - PLACE
      ?auto_29203 - PLACE
      ?auto_29201 - HOIST
      ?auto_29204 - SURFACE
      ?auto_29200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29202 ?auto_29205 ) ( IS-CRATE ?auto_29199 ) ( not ( = ?auto_29198 ?auto_29199 ) ) ( not ( = ?auto_29197 ?auto_29198 ) ) ( not ( = ?auto_29197 ?auto_29199 ) ) ( not ( = ?auto_29203 ?auto_29205 ) ) ( HOIST-AT ?auto_29201 ?auto_29203 ) ( not ( = ?auto_29202 ?auto_29201 ) ) ( AVAILABLE ?auto_29201 ) ( SURFACE-AT ?auto_29199 ?auto_29203 ) ( ON ?auto_29199 ?auto_29204 ) ( CLEAR ?auto_29199 ) ( not ( = ?auto_29198 ?auto_29204 ) ) ( not ( = ?auto_29199 ?auto_29204 ) ) ( not ( = ?auto_29197 ?auto_29204 ) ) ( TRUCK-AT ?auto_29200 ?auto_29205 ) ( SURFACE-AT ?auto_29197 ?auto_29205 ) ( CLEAR ?auto_29197 ) ( IS-CRATE ?auto_29198 ) ( AVAILABLE ?auto_29202 ) ( IN ?auto_29198 ?auto_29200 ) ( ON ?auto_29196 ?auto_29195 ) ( ON ?auto_29197 ?auto_29196 ) ( not ( = ?auto_29195 ?auto_29196 ) ) ( not ( = ?auto_29195 ?auto_29197 ) ) ( not ( = ?auto_29195 ?auto_29198 ) ) ( not ( = ?auto_29195 ?auto_29199 ) ) ( not ( = ?auto_29195 ?auto_29204 ) ) ( not ( = ?auto_29196 ?auto_29197 ) ) ( not ( = ?auto_29196 ?auto_29198 ) ) ( not ( = ?auto_29196 ?auto_29199 ) ) ( not ( = ?auto_29196 ?auto_29204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29197 ?auto_29198 ?auto_29199 )
      ( MAKE-4CRATE-VERIFY ?auto_29195 ?auto_29196 ?auto_29197 ?auto_29198 ?auto_29199 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29206 - SURFACE
      ?auto_29207 - SURFACE
    )
    :vars
    (
      ?auto_29211 - HOIST
      ?auto_29214 - PLACE
      ?auto_29210 - SURFACE
      ?auto_29212 - PLACE
      ?auto_29209 - HOIST
      ?auto_29213 - SURFACE
      ?auto_29208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29211 ?auto_29214 ) ( IS-CRATE ?auto_29207 ) ( not ( = ?auto_29206 ?auto_29207 ) ) ( not ( = ?auto_29210 ?auto_29206 ) ) ( not ( = ?auto_29210 ?auto_29207 ) ) ( not ( = ?auto_29212 ?auto_29214 ) ) ( HOIST-AT ?auto_29209 ?auto_29212 ) ( not ( = ?auto_29211 ?auto_29209 ) ) ( AVAILABLE ?auto_29209 ) ( SURFACE-AT ?auto_29207 ?auto_29212 ) ( ON ?auto_29207 ?auto_29213 ) ( CLEAR ?auto_29207 ) ( not ( = ?auto_29206 ?auto_29213 ) ) ( not ( = ?auto_29207 ?auto_29213 ) ) ( not ( = ?auto_29210 ?auto_29213 ) ) ( SURFACE-AT ?auto_29210 ?auto_29214 ) ( CLEAR ?auto_29210 ) ( IS-CRATE ?auto_29206 ) ( AVAILABLE ?auto_29211 ) ( IN ?auto_29206 ?auto_29208 ) ( TRUCK-AT ?auto_29208 ?auto_29212 ) )
    :subtasks
    ( ( !DRIVE ?auto_29208 ?auto_29212 ?auto_29214 )
      ( MAKE-2CRATE ?auto_29210 ?auto_29206 ?auto_29207 )
      ( MAKE-1CRATE-VERIFY ?auto_29206 ?auto_29207 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29215 - SURFACE
      ?auto_29216 - SURFACE
      ?auto_29217 - SURFACE
    )
    :vars
    (
      ?auto_29220 - HOIST
      ?auto_29221 - PLACE
      ?auto_29223 - PLACE
      ?auto_29218 - HOIST
      ?auto_29222 - SURFACE
      ?auto_29219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29220 ?auto_29221 ) ( IS-CRATE ?auto_29217 ) ( not ( = ?auto_29216 ?auto_29217 ) ) ( not ( = ?auto_29215 ?auto_29216 ) ) ( not ( = ?auto_29215 ?auto_29217 ) ) ( not ( = ?auto_29223 ?auto_29221 ) ) ( HOIST-AT ?auto_29218 ?auto_29223 ) ( not ( = ?auto_29220 ?auto_29218 ) ) ( AVAILABLE ?auto_29218 ) ( SURFACE-AT ?auto_29217 ?auto_29223 ) ( ON ?auto_29217 ?auto_29222 ) ( CLEAR ?auto_29217 ) ( not ( = ?auto_29216 ?auto_29222 ) ) ( not ( = ?auto_29217 ?auto_29222 ) ) ( not ( = ?auto_29215 ?auto_29222 ) ) ( SURFACE-AT ?auto_29215 ?auto_29221 ) ( CLEAR ?auto_29215 ) ( IS-CRATE ?auto_29216 ) ( AVAILABLE ?auto_29220 ) ( IN ?auto_29216 ?auto_29219 ) ( TRUCK-AT ?auto_29219 ?auto_29223 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29216 ?auto_29217 )
      ( MAKE-2CRATE-VERIFY ?auto_29215 ?auto_29216 ?auto_29217 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29224 - SURFACE
      ?auto_29225 - SURFACE
      ?auto_29226 - SURFACE
      ?auto_29227 - SURFACE
    )
    :vars
    (
      ?auto_29232 - HOIST
      ?auto_29233 - PLACE
      ?auto_29230 - PLACE
      ?auto_29231 - HOIST
      ?auto_29228 - SURFACE
      ?auto_29229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29232 ?auto_29233 ) ( IS-CRATE ?auto_29227 ) ( not ( = ?auto_29226 ?auto_29227 ) ) ( not ( = ?auto_29225 ?auto_29226 ) ) ( not ( = ?auto_29225 ?auto_29227 ) ) ( not ( = ?auto_29230 ?auto_29233 ) ) ( HOIST-AT ?auto_29231 ?auto_29230 ) ( not ( = ?auto_29232 ?auto_29231 ) ) ( AVAILABLE ?auto_29231 ) ( SURFACE-AT ?auto_29227 ?auto_29230 ) ( ON ?auto_29227 ?auto_29228 ) ( CLEAR ?auto_29227 ) ( not ( = ?auto_29226 ?auto_29228 ) ) ( not ( = ?auto_29227 ?auto_29228 ) ) ( not ( = ?auto_29225 ?auto_29228 ) ) ( SURFACE-AT ?auto_29225 ?auto_29233 ) ( CLEAR ?auto_29225 ) ( IS-CRATE ?auto_29226 ) ( AVAILABLE ?auto_29232 ) ( IN ?auto_29226 ?auto_29229 ) ( TRUCK-AT ?auto_29229 ?auto_29230 ) ( ON ?auto_29225 ?auto_29224 ) ( not ( = ?auto_29224 ?auto_29225 ) ) ( not ( = ?auto_29224 ?auto_29226 ) ) ( not ( = ?auto_29224 ?auto_29227 ) ) ( not ( = ?auto_29224 ?auto_29228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29225 ?auto_29226 ?auto_29227 )
      ( MAKE-3CRATE-VERIFY ?auto_29224 ?auto_29225 ?auto_29226 ?auto_29227 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29234 - SURFACE
      ?auto_29235 - SURFACE
      ?auto_29236 - SURFACE
      ?auto_29237 - SURFACE
      ?auto_29238 - SURFACE
    )
    :vars
    (
      ?auto_29243 - HOIST
      ?auto_29244 - PLACE
      ?auto_29241 - PLACE
      ?auto_29242 - HOIST
      ?auto_29239 - SURFACE
      ?auto_29240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29243 ?auto_29244 ) ( IS-CRATE ?auto_29238 ) ( not ( = ?auto_29237 ?auto_29238 ) ) ( not ( = ?auto_29236 ?auto_29237 ) ) ( not ( = ?auto_29236 ?auto_29238 ) ) ( not ( = ?auto_29241 ?auto_29244 ) ) ( HOIST-AT ?auto_29242 ?auto_29241 ) ( not ( = ?auto_29243 ?auto_29242 ) ) ( AVAILABLE ?auto_29242 ) ( SURFACE-AT ?auto_29238 ?auto_29241 ) ( ON ?auto_29238 ?auto_29239 ) ( CLEAR ?auto_29238 ) ( not ( = ?auto_29237 ?auto_29239 ) ) ( not ( = ?auto_29238 ?auto_29239 ) ) ( not ( = ?auto_29236 ?auto_29239 ) ) ( SURFACE-AT ?auto_29236 ?auto_29244 ) ( CLEAR ?auto_29236 ) ( IS-CRATE ?auto_29237 ) ( AVAILABLE ?auto_29243 ) ( IN ?auto_29237 ?auto_29240 ) ( TRUCK-AT ?auto_29240 ?auto_29241 ) ( ON ?auto_29235 ?auto_29234 ) ( ON ?auto_29236 ?auto_29235 ) ( not ( = ?auto_29234 ?auto_29235 ) ) ( not ( = ?auto_29234 ?auto_29236 ) ) ( not ( = ?auto_29234 ?auto_29237 ) ) ( not ( = ?auto_29234 ?auto_29238 ) ) ( not ( = ?auto_29234 ?auto_29239 ) ) ( not ( = ?auto_29235 ?auto_29236 ) ) ( not ( = ?auto_29235 ?auto_29237 ) ) ( not ( = ?auto_29235 ?auto_29238 ) ) ( not ( = ?auto_29235 ?auto_29239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29236 ?auto_29237 ?auto_29238 )
      ( MAKE-4CRATE-VERIFY ?auto_29234 ?auto_29235 ?auto_29236 ?auto_29237 ?auto_29238 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29245 - SURFACE
      ?auto_29246 - SURFACE
    )
    :vars
    (
      ?auto_29252 - HOIST
      ?auto_29253 - PLACE
      ?auto_29247 - SURFACE
      ?auto_29250 - PLACE
      ?auto_29251 - HOIST
      ?auto_29248 - SURFACE
      ?auto_29249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29252 ?auto_29253 ) ( IS-CRATE ?auto_29246 ) ( not ( = ?auto_29245 ?auto_29246 ) ) ( not ( = ?auto_29247 ?auto_29245 ) ) ( not ( = ?auto_29247 ?auto_29246 ) ) ( not ( = ?auto_29250 ?auto_29253 ) ) ( HOIST-AT ?auto_29251 ?auto_29250 ) ( not ( = ?auto_29252 ?auto_29251 ) ) ( SURFACE-AT ?auto_29246 ?auto_29250 ) ( ON ?auto_29246 ?auto_29248 ) ( CLEAR ?auto_29246 ) ( not ( = ?auto_29245 ?auto_29248 ) ) ( not ( = ?auto_29246 ?auto_29248 ) ) ( not ( = ?auto_29247 ?auto_29248 ) ) ( SURFACE-AT ?auto_29247 ?auto_29253 ) ( CLEAR ?auto_29247 ) ( IS-CRATE ?auto_29245 ) ( AVAILABLE ?auto_29252 ) ( TRUCK-AT ?auto_29249 ?auto_29250 ) ( LIFTING ?auto_29251 ?auto_29245 ) )
    :subtasks
    ( ( !LOAD ?auto_29251 ?auto_29245 ?auto_29249 ?auto_29250 )
      ( MAKE-2CRATE ?auto_29247 ?auto_29245 ?auto_29246 )
      ( MAKE-1CRATE-VERIFY ?auto_29245 ?auto_29246 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29254 - SURFACE
      ?auto_29255 - SURFACE
      ?auto_29256 - SURFACE
    )
    :vars
    (
      ?auto_29259 - HOIST
      ?auto_29260 - PLACE
      ?auto_29262 - PLACE
      ?auto_29257 - HOIST
      ?auto_29258 - SURFACE
      ?auto_29261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29259 ?auto_29260 ) ( IS-CRATE ?auto_29256 ) ( not ( = ?auto_29255 ?auto_29256 ) ) ( not ( = ?auto_29254 ?auto_29255 ) ) ( not ( = ?auto_29254 ?auto_29256 ) ) ( not ( = ?auto_29262 ?auto_29260 ) ) ( HOIST-AT ?auto_29257 ?auto_29262 ) ( not ( = ?auto_29259 ?auto_29257 ) ) ( SURFACE-AT ?auto_29256 ?auto_29262 ) ( ON ?auto_29256 ?auto_29258 ) ( CLEAR ?auto_29256 ) ( not ( = ?auto_29255 ?auto_29258 ) ) ( not ( = ?auto_29256 ?auto_29258 ) ) ( not ( = ?auto_29254 ?auto_29258 ) ) ( SURFACE-AT ?auto_29254 ?auto_29260 ) ( CLEAR ?auto_29254 ) ( IS-CRATE ?auto_29255 ) ( AVAILABLE ?auto_29259 ) ( TRUCK-AT ?auto_29261 ?auto_29262 ) ( LIFTING ?auto_29257 ?auto_29255 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29255 ?auto_29256 )
      ( MAKE-2CRATE-VERIFY ?auto_29254 ?auto_29255 ?auto_29256 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29263 - SURFACE
      ?auto_29264 - SURFACE
      ?auto_29265 - SURFACE
      ?auto_29266 - SURFACE
    )
    :vars
    (
      ?auto_29270 - HOIST
      ?auto_29267 - PLACE
      ?auto_29272 - PLACE
      ?auto_29271 - HOIST
      ?auto_29268 - SURFACE
      ?auto_29269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29270 ?auto_29267 ) ( IS-CRATE ?auto_29266 ) ( not ( = ?auto_29265 ?auto_29266 ) ) ( not ( = ?auto_29264 ?auto_29265 ) ) ( not ( = ?auto_29264 ?auto_29266 ) ) ( not ( = ?auto_29272 ?auto_29267 ) ) ( HOIST-AT ?auto_29271 ?auto_29272 ) ( not ( = ?auto_29270 ?auto_29271 ) ) ( SURFACE-AT ?auto_29266 ?auto_29272 ) ( ON ?auto_29266 ?auto_29268 ) ( CLEAR ?auto_29266 ) ( not ( = ?auto_29265 ?auto_29268 ) ) ( not ( = ?auto_29266 ?auto_29268 ) ) ( not ( = ?auto_29264 ?auto_29268 ) ) ( SURFACE-AT ?auto_29264 ?auto_29267 ) ( CLEAR ?auto_29264 ) ( IS-CRATE ?auto_29265 ) ( AVAILABLE ?auto_29270 ) ( TRUCK-AT ?auto_29269 ?auto_29272 ) ( LIFTING ?auto_29271 ?auto_29265 ) ( ON ?auto_29264 ?auto_29263 ) ( not ( = ?auto_29263 ?auto_29264 ) ) ( not ( = ?auto_29263 ?auto_29265 ) ) ( not ( = ?auto_29263 ?auto_29266 ) ) ( not ( = ?auto_29263 ?auto_29268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29264 ?auto_29265 ?auto_29266 )
      ( MAKE-3CRATE-VERIFY ?auto_29263 ?auto_29264 ?auto_29265 ?auto_29266 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29273 - SURFACE
      ?auto_29274 - SURFACE
      ?auto_29275 - SURFACE
      ?auto_29276 - SURFACE
      ?auto_29277 - SURFACE
    )
    :vars
    (
      ?auto_29281 - HOIST
      ?auto_29278 - PLACE
      ?auto_29283 - PLACE
      ?auto_29282 - HOIST
      ?auto_29279 - SURFACE
      ?auto_29280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29281 ?auto_29278 ) ( IS-CRATE ?auto_29277 ) ( not ( = ?auto_29276 ?auto_29277 ) ) ( not ( = ?auto_29275 ?auto_29276 ) ) ( not ( = ?auto_29275 ?auto_29277 ) ) ( not ( = ?auto_29283 ?auto_29278 ) ) ( HOIST-AT ?auto_29282 ?auto_29283 ) ( not ( = ?auto_29281 ?auto_29282 ) ) ( SURFACE-AT ?auto_29277 ?auto_29283 ) ( ON ?auto_29277 ?auto_29279 ) ( CLEAR ?auto_29277 ) ( not ( = ?auto_29276 ?auto_29279 ) ) ( not ( = ?auto_29277 ?auto_29279 ) ) ( not ( = ?auto_29275 ?auto_29279 ) ) ( SURFACE-AT ?auto_29275 ?auto_29278 ) ( CLEAR ?auto_29275 ) ( IS-CRATE ?auto_29276 ) ( AVAILABLE ?auto_29281 ) ( TRUCK-AT ?auto_29280 ?auto_29283 ) ( LIFTING ?auto_29282 ?auto_29276 ) ( ON ?auto_29274 ?auto_29273 ) ( ON ?auto_29275 ?auto_29274 ) ( not ( = ?auto_29273 ?auto_29274 ) ) ( not ( = ?auto_29273 ?auto_29275 ) ) ( not ( = ?auto_29273 ?auto_29276 ) ) ( not ( = ?auto_29273 ?auto_29277 ) ) ( not ( = ?auto_29273 ?auto_29279 ) ) ( not ( = ?auto_29274 ?auto_29275 ) ) ( not ( = ?auto_29274 ?auto_29276 ) ) ( not ( = ?auto_29274 ?auto_29277 ) ) ( not ( = ?auto_29274 ?auto_29279 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29275 ?auto_29276 ?auto_29277 )
      ( MAKE-4CRATE-VERIFY ?auto_29273 ?auto_29274 ?auto_29275 ?auto_29276 ?auto_29277 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29284 - SURFACE
      ?auto_29285 - SURFACE
    )
    :vars
    (
      ?auto_29289 - HOIST
      ?auto_29286 - PLACE
      ?auto_29292 - SURFACE
      ?auto_29291 - PLACE
      ?auto_29290 - HOIST
      ?auto_29287 - SURFACE
      ?auto_29288 - TRUCK
      ?auto_29293 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29289 ?auto_29286 ) ( IS-CRATE ?auto_29285 ) ( not ( = ?auto_29284 ?auto_29285 ) ) ( not ( = ?auto_29292 ?auto_29284 ) ) ( not ( = ?auto_29292 ?auto_29285 ) ) ( not ( = ?auto_29291 ?auto_29286 ) ) ( HOIST-AT ?auto_29290 ?auto_29291 ) ( not ( = ?auto_29289 ?auto_29290 ) ) ( SURFACE-AT ?auto_29285 ?auto_29291 ) ( ON ?auto_29285 ?auto_29287 ) ( CLEAR ?auto_29285 ) ( not ( = ?auto_29284 ?auto_29287 ) ) ( not ( = ?auto_29285 ?auto_29287 ) ) ( not ( = ?auto_29292 ?auto_29287 ) ) ( SURFACE-AT ?auto_29292 ?auto_29286 ) ( CLEAR ?auto_29292 ) ( IS-CRATE ?auto_29284 ) ( AVAILABLE ?auto_29289 ) ( TRUCK-AT ?auto_29288 ?auto_29291 ) ( AVAILABLE ?auto_29290 ) ( SURFACE-AT ?auto_29284 ?auto_29291 ) ( ON ?auto_29284 ?auto_29293 ) ( CLEAR ?auto_29284 ) ( not ( = ?auto_29284 ?auto_29293 ) ) ( not ( = ?auto_29285 ?auto_29293 ) ) ( not ( = ?auto_29292 ?auto_29293 ) ) ( not ( = ?auto_29287 ?auto_29293 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29290 ?auto_29284 ?auto_29293 ?auto_29291 )
      ( MAKE-2CRATE ?auto_29292 ?auto_29284 ?auto_29285 )
      ( MAKE-1CRATE-VERIFY ?auto_29284 ?auto_29285 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29294 - SURFACE
      ?auto_29295 - SURFACE
      ?auto_29296 - SURFACE
    )
    :vars
    (
      ?auto_29298 - HOIST
      ?auto_29303 - PLACE
      ?auto_29301 - PLACE
      ?auto_29297 - HOIST
      ?auto_29302 - SURFACE
      ?auto_29299 - TRUCK
      ?auto_29300 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29298 ?auto_29303 ) ( IS-CRATE ?auto_29296 ) ( not ( = ?auto_29295 ?auto_29296 ) ) ( not ( = ?auto_29294 ?auto_29295 ) ) ( not ( = ?auto_29294 ?auto_29296 ) ) ( not ( = ?auto_29301 ?auto_29303 ) ) ( HOIST-AT ?auto_29297 ?auto_29301 ) ( not ( = ?auto_29298 ?auto_29297 ) ) ( SURFACE-AT ?auto_29296 ?auto_29301 ) ( ON ?auto_29296 ?auto_29302 ) ( CLEAR ?auto_29296 ) ( not ( = ?auto_29295 ?auto_29302 ) ) ( not ( = ?auto_29296 ?auto_29302 ) ) ( not ( = ?auto_29294 ?auto_29302 ) ) ( SURFACE-AT ?auto_29294 ?auto_29303 ) ( CLEAR ?auto_29294 ) ( IS-CRATE ?auto_29295 ) ( AVAILABLE ?auto_29298 ) ( TRUCK-AT ?auto_29299 ?auto_29301 ) ( AVAILABLE ?auto_29297 ) ( SURFACE-AT ?auto_29295 ?auto_29301 ) ( ON ?auto_29295 ?auto_29300 ) ( CLEAR ?auto_29295 ) ( not ( = ?auto_29295 ?auto_29300 ) ) ( not ( = ?auto_29296 ?auto_29300 ) ) ( not ( = ?auto_29294 ?auto_29300 ) ) ( not ( = ?auto_29302 ?auto_29300 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29295 ?auto_29296 )
      ( MAKE-2CRATE-VERIFY ?auto_29294 ?auto_29295 ?auto_29296 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29304 - SURFACE
      ?auto_29305 - SURFACE
      ?auto_29306 - SURFACE
      ?auto_29307 - SURFACE
    )
    :vars
    (
      ?auto_29313 - HOIST
      ?auto_29309 - PLACE
      ?auto_29311 - PLACE
      ?auto_29308 - HOIST
      ?auto_29310 - SURFACE
      ?auto_29312 - TRUCK
      ?auto_29314 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29313 ?auto_29309 ) ( IS-CRATE ?auto_29307 ) ( not ( = ?auto_29306 ?auto_29307 ) ) ( not ( = ?auto_29305 ?auto_29306 ) ) ( not ( = ?auto_29305 ?auto_29307 ) ) ( not ( = ?auto_29311 ?auto_29309 ) ) ( HOIST-AT ?auto_29308 ?auto_29311 ) ( not ( = ?auto_29313 ?auto_29308 ) ) ( SURFACE-AT ?auto_29307 ?auto_29311 ) ( ON ?auto_29307 ?auto_29310 ) ( CLEAR ?auto_29307 ) ( not ( = ?auto_29306 ?auto_29310 ) ) ( not ( = ?auto_29307 ?auto_29310 ) ) ( not ( = ?auto_29305 ?auto_29310 ) ) ( SURFACE-AT ?auto_29305 ?auto_29309 ) ( CLEAR ?auto_29305 ) ( IS-CRATE ?auto_29306 ) ( AVAILABLE ?auto_29313 ) ( TRUCK-AT ?auto_29312 ?auto_29311 ) ( AVAILABLE ?auto_29308 ) ( SURFACE-AT ?auto_29306 ?auto_29311 ) ( ON ?auto_29306 ?auto_29314 ) ( CLEAR ?auto_29306 ) ( not ( = ?auto_29306 ?auto_29314 ) ) ( not ( = ?auto_29307 ?auto_29314 ) ) ( not ( = ?auto_29305 ?auto_29314 ) ) ( not ( = ?auto_29310 ?auto_29314 ) ) ( ON ?auto_29305 ?auto_29304 ) ( not ( = ?auto_29304 ?auto_29305 ) ) ( not ( = ?auto_29304 ?auto_29306 ) ) ( not ( = ?auto_29304 ?auto_29307 ) ) ( not ( = ?auto_29304 ?auto_29310 ) ) ( not ( = ?auto_29304 ?auto_29314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29305 ?auto_29306 ?auto_29307 )
      ( MAKE-3CRATE-VERIFY ?auto_29304 ?auto_29305 ?auto_29306 ?auto_29307 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29315 - SURFACE
      ?auto_29316 - SURFACE
      ?auto_29317 - SURFACE
      ?auto_29318 - SURFACE
      ?auto_29319 - SURFACE
    )
    :vars
    (
      ?auto_29325 - HOIST
      ?auto_29321 - PLACE
      ?auto_29323 - PLACE
      ?auto_29320 - HOIST
      ?auto_29322 - SURFACE
      ?auto_29324 - TRUCK
      ?auto_29326 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29325 ?auto_29321 ) ( IS-CRATE ?auto_29319 ) ( not ( = ?auto_29318 ?auto_29319 ) ) ( not ( = ?auto_29317 ?auto_29318 ) ) ( not ( = ?auto_29317 ?auto_29319 ) ) ( not ( = ?auto_29323 ?auto_29321 ) ) ( HOIST-AT ?auto_29320 ?auto_29323 ) ( not ( = ?auto_29325 ?auto_29320 ) ) ( SURFACE-AT ?auto_29319 ?auto_29323 ) ( ON ?auto_29319 ?auto_29322 ) ( CLEAR ?auto_29319 ) ( not ( = ?auto_29318 ?auto_29322 ) ) ( not ( = ?auto_29319 ?auto_29322 ) ) ( not ( = ?auto_29317 ?auto_29322 ) ) ( SURFACE-AT ?auto_29317 ?auto_29321 ) ( CLEAR ?auto_29317 ) ( IS-CRATE ?auto_29318 ) ( AVAILABLE ?auto_29325 ) ( TRUCK-AT ?auto_29324 ?auto_29323 ) ( AVAILABLE ?auto_29320 ) ( SURFACE-AT ?auto_29318 ?auto_29323 ) ( ON ?auto_29318 ?auto_29326 ) ( CLEAR ?auto_29318 ) ( not ( = ?auto_29318 ?auto_29326 ) ) ( not ( = ?auto_29319 ?auto_29326 ) ) ( not ( = ?auto_29317 ?auto_29326 ) ) ( not ( = ?auto_29322 ?auto_29326 ) ) ( ON ?auto_29316 ?auto_29315 ) ( ON ?auto_29317 ?auto_29316 ) ( not ( = ?auto_29315 ?auto_29316 ) ) ( not ( = ?auto_29315 ?auto_29317 ) ) ( not ( = ?auto_29315 ?auto_29318 ) ) ( not ( = ?auto_29315 ?auto_29319 ) ) ( not ( = ?auto_29315 ?auto_29322 ) ) ( not ( = ?auto_29315 ?auto_29326 ) ) ( not ( = ?auto_29316 ?auto_29317 ) ) ( not ( = ?auto_29316 ?auto_29318 ) ) ( not ( = ?auto_29316 ?auto_29319 ) ) ( not ( = ?auto_29316 ?auto_29322 ) ) ( not ( = ?auto_29316 ?auto_29326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29317 ?auto_29318 ?auto_29319 )
      ( MAKE-4CRATE-VERIFY ?auto_29315 ?auto_29316 ?auto_29317 ?auto_29318 ?auto_29319 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29327 - SURFACE
      ?auto_29328 - SURFACE
    )
    :vars
    (
      ?auto_29335 - HOIST
      ?auto_29330 - PLACE
      ?auto_29334 - SURFACE
      ?auto_29332 - PLACE
      ?auto_29329 - HOIST
      ?auto_29331 - SURFACE
      ?auto_29336 - SURFACE
      ?auto_29333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29335 ?auto_29330 ) ( IS-CRATE ?auto_29328 ) ( not ( = ?auto_29327 ?auto_29328 ) ) ( not ( = ?auto_29334 ?auto_29327 ) ) ( not ( = ?auto_29334 ?auto_29328 ) ) ( not ( = ?auto_29332 ?auto_29330 ) ) ( HOIST-AT ?auto_29329 ?auto_29332 ) ( not ( = ?auto_29335 ?auto_29329 ) ) ( SURFACE-AT ?auto_29328 ?auto_29332 ) ( ON ?auto_29328 ?auto_29331 ) ( CLEAR ?auto_29328 ) ( not ( = ?auto_29327 ?auto_29331 ) ) ( not ( = ?auto_29328 ?auto_29331 ) ) ( not ( = ?auto_29334 ?auto_29331 ) ) ( SURFACE-AT ?auto_29334 ?auto_29330 ) ( CLEAR ?auto_29334 ) ( IS-CRATE ?auto_29327 ) ( AVAILABLE ?auto_29335 ) ( AVAILABLE ?auto_29329 ) ( SURFACE-AT ?auto_29327 ?auto_29332 ) ( ON ?auto_29327 ?auto_29336 ) ( CLEAR ?auto_29327 ) ( not ( = ?auto_29327 ?auto_29336 ) ) ( not ( = ?auto_29328 ?auto_29336 ) ) ( not ( = ?auto_29334 ?auto_29336 ) ) ( not ( = ?auto_29331 ?auto_29336 ) ) ( TRUCK-AT ?auto_29333 ?auto_29330 ) )
    :subtasks
    ( ( !DRIVE ?auto_29333 ?auto_29330 ?auto_29332 )
      ( MAKE-2CRATE ?auto_29334 ?auto_29327 ?auto_29328 )
      ( MAKE-1CRATE-VERIFY ?auto_29327 ?auto_29328 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29337 - SURFACE
      ?auto_29338 - SURFACE
      ?auto_29339 - SURFACE
    )
    :vars
    (
      ?auto_29343 - HOIST
      ?auto_29342 - PLACE
      ?auto_29340 - PLACE
      ?auto_29344 - HOIST
      ?auto_29346 - SURFACE
      ?auto_29341 - SURFACE
      ?auto_29345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29343 ?auto_29342 ) ( IS-CRATE ?auto_29339 ) ( not ( = ?auto_29338 ?auto_29339 ) ) ( not ( = ?auto_29337 ?auto_29338 ) ) ( not ( = ?auto_29337 ?auto_29339 ) ) ( not ( = ?auto_29340 ?auto_29342 ) ) ( HOIST-AT ?auto_29344 ?auto_29340 ) ( not ( = ?auto_29343 ?auto_29344 ) ) ( SURFACE-AT ?auto_29339 ?auto_29340 ) ( ON ?auto_29339 ?auto_29346 ) ( CLEAR ?auto_29339 ) ( not ( = ?auto_29338 ?auto_29346 ) ) ( not ( = ?auto_29339 ?auto_29346 ) ) ( not ( = ?auto_29337 ?auto_29346 ) ) ( SURFACE-AT ?auto_29337 ?auto_29342 ) ( CLEAR ?auto_29337 ) ( IS-CRATE ?auto_29338 ) ( AVAILABLE ?auto_29343 ) ( AVAILABLE ?auto_29344 ) ( SURFACE-AT ?auto_29338 ?auto_29340 ) ( ON ?auto_29338 ?auto_29341 ) ( CLEAR ?auto_29338 ) ( not ( = ?auto_29338 ?auto_29341 ) ) ( not ( = ?auto_29339 ?auto_29341 ) ) ( not ( = ?auto_29337 ?auto_29341 ) ) ( not ( = ?auto_29346 ?auto_29341 ) ) ( TRUCK-AT ?auto_29345 ?auto_29342 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29338 ?auto_29339 )
      ( MAKE-2CRATE-VERIFY ?auto_29337 ?auto_29338 ?auto_29339 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29347 - SURFACE
      ?auto_29348 - SURFACE
      ?auto_29349 - SURFACE
      ?auto_29350 - SURFACE
    )
    :vars
    (
      ?auto_29352 - HOIST
      ?auto_29356 - PLACE
      ?auto_29355 - PLACE
      ?auto_29351 - HOIST
      ?auto_29357 - SURFACE
      ?auto_29354 - SURFACE
      ?auto_29353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29352 ?auto_29356 ) ( IS-CRATE ?auto_29350 ) ( not ( = ?auto_29349 ?auto_29350 ) ) ( not ( = ?auto_29348 ?auto_29349 ) ) ( not ( = ?auto_29348 ?auto_29350 ) ) ( not ( = ?auto_29355 ?auto_29356 ) ) ( HOIST-AT ?auto_29351 ?auto_29355 ) ( not ( = ?auto_29352 ?auto_29351 ) ) ( SURFACE-AT ?auto_29350 ?auto_29355 ) ( ON ?auto_29350 ?auto_29357 ) ( CLEAR ?auto_29350 ) ( not ( = ?auto_29349 ?auto_29357 ) ) ( not ( = ?auto_29350 ?auto_29357 ) ) ( not ( = ?auto_29348 ?auto_29357 ) ) ( SURFACE-AT ?auto_29348 ?auto_29356 ) ( CLEAR ?auto_29348 ) ( IS-CRATE ?auto_29349 ) ( AVAILABLE ?auto_29352 ) ( AVAILABLE ?auto_29351 ) ( SURFACE-AT ?auto_29349 ?auto_29355 ) ( ON ?auto_29349 ?auto_29354 ) ( CLEAR ?auto_29349 ) ( not ( = ?auto_29349 ?auto_29354 ) ) ( not ( = ?auto_29350 ?auto_29354 ) ) ( not ( = ?auto_29348 ?auto_29354 ) ) ( not ( = ?auto_29357 ?auto_29354 ) ) ( TRUCK-AT ?auto_29353 ?auto_29356 ) ( ON ?auto_29348 ?auto_29347 ) ( not ( = ?auto_29347 ?auto_29348 ) ) ( not ( = ?auto_29347 ?auto_29349 ) ) ( not ( = ?auto_29347 ?auto_29350 ) ) ( not ( = ?auto_29347 ?auto_29357 ) ) ( not ( = ?auto_29347 ?auto_29354 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29348 ?auto_29349 ?auto_29350 )
      ( MAKE-3CRATE-VERIFY ?auto_29347 ?auto_29348 ?auto_29349 ?auto_29350 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29358 - SURFACE
      ?auto_29359 - SURFACE
      ?auto_29360 - SURFACE
      ?auto_29361 - SURFACE
      ?auto_29362 - SURFACE
    )
    :vars
    (
      ?auto_29364 - HOIST
      ?auto_29368 - PLACE
      ?auto_29367 - PLACE
      ?auto_29363 - HOIST
      ?auto_29369 - SURFACE
      ?auto_29366 - SURFACE
      ?auto_29365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29364 ?auto_29368 ) ( IS-CRATE ?auto_29362 ) ( not ( = ?auto_29361 ?auto_29362 ) ) ( not ( = ?auto_29360 ?auto_29361 ) ) ( not ( = ?auto_29360 ?auto_29362 ) ) ( not ( = ?auto_29367 ?auto_29368 ) ) ( HOIST-AT ?auto_29363 ?auto_29367 ) ( not ( = ?auto_29364 ?auto_29363 ) ) ( SURFACE-AT ?auto_29362 ?auto_29367 ) ( ON ?auto_29362 ?auto_29369 ) ( CLEAR ?auto_29362 ) ( not ( = ?auto_29361 ?auto_29369 ) ) ( not ( = ?auto_29362 ?auto_29369 ) ) ( not ( = ?auto_29360 ?auto_29369 ) ) ( SURFACE-AT ?auto_29360 ?auto_29368 ) ( CLEAR ?auto_29360 ) ( IS-CRATE ?auto_29361 ) ( AVAILABLE ?auto_29364 ) ( AVAILABLE ?auto_29363 ) ( SURFACE-AT ?auto_29361 ?auto_29367 ) ( ON ?auto_29361 ?auto_29366 ) ( CLEAR ?auto_29361 ) ( not ( = ?auto_29361 ?auto_29366 ) ) ( not ( = ?auto_29362 ?auto_29366 ) ) ( not ( = ?auto_29360 ?auto_29366 ) ) ( not ( = ?auto_29369 ?auto_29366 ) ) ( TRUCK-AT ?auto_29365 ?auto_29368 ) ( ON ?auto_29359 ?auto_29358 ) ( ON ?auto_29360 ?auto_29359 ) ( not ( = ?auto_29358 ?auto_29359 ) ) ( not ( = ?auto_29358 ?auto_29360 ) ) ( not ( = ?auto_29358 ?auto_29361 ) ) ( not ( = ?auto_29358 ?auto_29362 ) ) ( not ( = ?auto_29358 ?auto_29369 ) ) ( not ( = ?auto_29358 ?auto_29366 ) ) ( not ( = ?auto_29359 ?auto_29360 ) ) ( not ( = ?auto_29359 ?auto_29361 ) ) ( not ( = ?auto_29359 ?auto_29362 ) ) ( not ( = ?auto_29359 ?auto_29369 ) ) ( not ( = ?auto_29359 ?auto_29366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29360 ?auto_29361 ?auto_29362 )
      ( MAKE-4CRATE-VERIFY ?auto_29358 ?auto_29359 ?auto_29360 ?auto_29361 ?auto_29362 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29370 - SURFACE
      ?auto_29371 - SURFACE
    )
    :vars
    (
      ?auto_29373 - HOIST
      ?auto_29378 - PLACE
      ?auto_29374 - SURFACE
      ?auto_29377 - PLACE
      ?auto_29372 - HOIST
      ?auto_29379 - SURFACE
      ?auto_29376 - SURFACE
      ?auto_29375 - TRUCK
      ?auto_29380 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29373 ?auto_29378 ) ( IS-CRATE ?auto_29371 ) ( not ( = ?auto_29370 ?auto_29371 ) ) ( not ( = ?auto_29374 ?auto_29370 ) ) ( not ( = ?auto_29374 ?auto_29371 ) ) ( not ( = ?auto_29377 ?auto_29378 ) ) ( HOIST-AT ?auto_29372 ?auto_29377 ) ( not ( = ?auto_29373 ?auto_29372 ) ) ( SURFACE-AT ?auto_29371 ?auto_29377 ) ( ON ?auto_29371 ?auto_29379 ) ( CLEAR ?auto_29371 ) ( not ( = ?auto_29370 ?auto_29379 ) ) ( not ( = ?auto_29371 ?auto_29379 ) ) ( not ( = ?auto_29374 ?auto_29379 ) ) ( IS-CRATE ?auto_29370 ) ( AVAILABLE ?auto_29372 ) ( SURFACE-AT ?auto_29370 ?auto_29377 ) ( ON ?auto_29370 ?auto_29376 ) ( CLEAR ?auto_29370 ) ( not ( = ?auto_29370 ?auto_29376 ) ) ( not ( = ?auto_29371 ?auto_29376 ) ) ( not ( = ?auto_29374 ?auto_29376 ) ) ( not ( = ?auto_29379 ?auto_29376 ) ) ( TRUCK-AT ?auto_29375 ?auto_29378 ) ( SURFACE-AT ?auto_29380 ?auto_29378 ) ( CLEAR ?auto_29380 ) ( LIFTING ?auto_29373 ?auto_29374 ) ( IS-CRATE ?auto_29374 ) ( not ( = ?auto_29380 ?auto_29374 ) ) ( not ( = ?auto_29370 ?auto_29380 ) ) ( not ( = ?auto_29371 ?auto_29380 ) ) ( not ( = ?auto_29379 ?auto_29380 ) ) ( not ( = ?auto_29376 ?auto_29380 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29380 ?auto_29374 )
      ( MAKE-2CRATE ?auto_29374 ?auto_29370 ?auto_29371 )
      ( MAKE-1CRATE-VERIFY ?auto_29370 ?auto_29371 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29381 - SURFACE
      ?auto_29382 - SURFACE
      ?auto_29383 - SURFACE
    )
    :vars
    (
      ?auto_29389 - HOIST
      ?auto_29387 - PLACE
      ?auto_29388 - PLACE
      ?auto_29386 - HOIST
      ?auto_29390 - SURFACE
      ?auto_29385 - SURFACE
      ?auto_29384 - TRUCK
      ?auto_29391 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29389 ?auto_29387 ) ( IS-CRATE ?auto_29383 ) ( not ( = ?auto_29382 ?auto_29383 ) ) ( not ( = ?auto_29381 ?auto_29382 ) ) ( not ( = ?auto_29381 ?auto_29383 ) ) ( not ( = ?auto_29388 ?auto_29387 ) ) ( HOIST-AT ?auto_29386 ?auto_29388 ) ( not ( = ?auto_29389 ?auto_29386 ) ) ( SURFACE-AT ?auto_29383 ?auto_29388 ) ( ON ?auto_29383 ?auto_29390 ) ( CLEAR ?auto_29383 ) ( not ( = ?auto_29382 ?auto_29390 ) ) ( not ( = ?auto_29383 ?auto_29390 ) ) ( not ( = ?auto_29381 ?auto_29390 ) ) ( IS-CRATE ?auto_29382 ) ( AVAILABLE ?auto_29386 ) ( SURFACE-AT ?auto_29382 ?auto_29388 ) ( ON ?auto_29382 ?auto_29385 ) ( CLEAR ?auto_29382 ) ( not ( = ?auto_29382 ?auto_29385 ) ) ( not ( = ?auto_29383 ?auto_29385 ) ) ( not ( = ?auto_29381 ?auto_29385 ) ) ( not ( = ?auto_29390 ?auto_29385 ) ) ( TRUCK-AT ?auto_29384 ?auto_29387 ) ( SURFACE-AT ?auto_29391 ?auto_29387 ) ( CLEAR ?auto_29391 ) ( LIFTING ?auto_29389 ?auto_29381 ) ( IS-CRATE ?auto_29381 ) ( not ( = ?auto_29391 ?auto_29381 ) ) ( not ( = ?auto_29382 ?auto_29391 ) ) ( not ( = ?auto_29383 ?auto_29391 ) ) ( not ( = ?auto_29390 ?auto_29391 ) ) ( not ( = ?auto_29385 ?auto_29391 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29382 ?auto_29383 )
      ( MAKE-2CRATE-VERIFY ?auto_29381 ?auto_29382 ?auto_29383 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29392 - SURFACE
      ?auto_29393 - SURFACE
      ?auto_29394 - SURFACE
      ?auto_29395 - SURFACE
    )
    :vars
    (
      ?auto_29396 - HOIST
      ?auto_29397 - PLACE
      ?auto_29400 - PLACE
      ?auto_29402 - HOIST
      ?auto_29398 - SURFACE
      ?auto_29399 - SURFACE
      ?auto_29401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29396 ?auto_29397 ) ( IS-CRATE ?auto_29395 ) ( not ( = ?auto_29394 ?auto_29395 ) ) ( not ( = ?auto_29393 ?auto_29394 ) ) ( not ( = ?auto_29393 ?auto_29395 ) ) ( not ( = ?auto_29400 ?auto_29397 ) ) ( HOIST-AT ?auto_29402 ?auto_29400 ) ( not ( = ?auto_29396 ?auto_29402 ) ) ( SURFACE-AT ?auto_29395 ?auto_29400 ) ( ON ?auto_29395 ?auto_29398 ) ( CLEAR ?auto_29395 ) ( not ( = ?auto_29394 ?auto_29398 ) ) ( not ( = ?auto_29395 ?auto_29398 ) ) ( not ( = ?auto_29393 ?auto_29398 ) ) ( IS-CRATE ?auto_29394 ) ( AVAILABLE ?auto_29402 ) ( SURFACE-AT ?auto_29394 ?auto_29400 ) ( ON ?auto_29394 ?auto_29399 ) ( CLEAR ?auto_29394 ) ( not ( = ?auto_29394 ?auto_29399 ) ) ( not ( = ?auto_29395 ?auto_29399 ) ) ( not ( = ?auto_29393 ?auto_29399 ) ) ( not ( = ?auto_29398 ?auto_29399 ) ) ( TRUCK-AT ?auto_29401 ?auto_29397 ) ( SURFACE-AT ?auto_29392 ?auto_29397 ) ( CLEAR ?auto_29392 ) ( LIFTING ?auto_29396 ?auto_29393 ) ( IS-CRATE ?auto_29393 ) ( not ( = ?auto_29392 ?auto_29393 ) ) ( not ( = ?auto_29394 ?auto_29392 ) ) ( not ( = ?auto_29395 ?auto_29392 ) ) ( not ( = ?auto_29398 ?auto_29392 ) ) ( not ( = ?auto_29399 ?auto_29392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29393 ?auto_29394 ?auto_29395 )
      ( MAKE-3CRATE-VERIFY ?auto_29392 ?auto_29393 ?auto_29394 ?auto_29395 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29403 - SURFACE
      ?auto_29404 - SURFACE
      ?auto_29405 - SURFACE
      ?auto_29406 - SURFACE
      ?auto_29407 - SURFACE
    )
    :vars
    (
      ?auto_29408 - HOIST
      ?auto_29409 - PLACE
      ?auto_29412 - PLACE
      ?auto_29414 - HOIST
      ?auto_29410 - SURFACE
      ?auto_29411 - SURFACE
      ?auto_29413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29408 ?auto_29409 ) ( IS-CRATE ?auto_29407 ) ( not ( = ?auto_29406 ?auto_29407 ) ) ( not ( = ?auto_29405 ?auto_29406 ) ) ( not ( = ?auto_29405 ?auto_29407 ) ) ( not ( = ?auto_29412 ?auto_29409 ) ) ( HOIST-AT ?auto_29414 ?auto_29412 ) ( not ( = ?auto_29408 ?auto_29414 ) ) ( SURFACE-AT ?auto_29407 ?auto_29412 ) ( ON ?auto_29407 ?auto_29410 ) ( CLEAR ?auto_29407 ) ( not ( = ?auto_29406 ?auto_29410 ) ) ( not ( = ?auto_29407 ?auto_29410 ) ) ( not ( = ?auto_29405 ?auto_29410 ) ) ( IS-CRATE ?auto_29406 ) ( AVAILABLE ?auto_29414 ) ( SURFACE-AT ?auto_29406 ?auto_29412 ) ( ON ?auto_29406 ?auto_29411 ) ( CLEAR ?auto_29406 ) ( not ( = ?auto_29406 ?auto_29411 ) ) ( not ( = ?auto_29407 ?auto_29411 ) ) ( not ( = ?auto_29405 ?auto_29411 ) ) ( not ( = ?auto_29410 ?auto_29411 ) ) ( TRUCK-AT ?auto_29413 ?auto_29409 ) ( SURFACE-AT ?auto_29404 ?auto_29409 ) ( CLEAR ?auto_29404 ) ( LIFTING ?auto_29408 ?auto_29405 ) ( IS-CRATE ?auto_29405 ) ( not ( = ?auto_29404 ?auto_29405 ) ) ( not ( = ?auto_29406 ?auto_29404 ) ) ( not ( = ?auto_29407 ?auto_29404 ) ) ( not ( = ?auto_29410 ?auto_29404 ) ) ( not ( = ?auto_29411 ?auto_29404 ) ) ( ON ?auto_29404 ?auto_29403 ) ( not ( = ?auto_29403 ?auto_29404 ) ) ( not ( = ?auto_29403 ?auto_29405 ) ) ( not ( = ?auto_29403 ?auto_29406 ) ) ( not ( = ?auto_29403 ?auto_29407 ) ) ( not ( = ?auto_29403 ?auto_29410 ) ) ( not ( = ?auto_29403 ?auto_29411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29405 ?auto_29406 ?auto_29407 )
      ( MAKE-4CRATE-VERIFY ?auto_29403 ?auto_29404 ?auto_29405 ?auto_29406 ?auto_29407 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29415 - SURFACE
      ?auto_29416 - SURFACE
    )
    :vars
    (
      ?auto_29417 - HOIST
      ?auto_29418 - PLACE
      ?auto_29424 - SURFACE
      ?auto_29421 - PLACE
      ?auto_29425 - HOIST
      ?auto_29419 - SURFACE
      ?auto_29420 - SURFACE
      ?auto_29422 - TRUCK
      ?auto_29423 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29417 ?auto_29418 ) ( IS-CRATE ?auto_29416 ) ( not ( = ?auto_29415 ?auto_29416 ) ) ( not ( = ?auto_29424 ?auto_29415 ) ) ( not ( = ?auto_29424 ?auto_29416 ) ) ( not ( = ?auto_29421 ?auto_29418 ) ) ( HOIST-AT ?auto_29425 ?auto_29421 ) ( not ( = ?auto_29417 ?auto_29425 ) ) ( SURFACE-AT ?auto_29416 ?auto_29421 ) ( ON ?auto_29416 ?auto_29419 ) ( CLEAR ?auto_29416 ) ( not ( = ?auto_29415 ?auto_29419 ) ) ( not ( = ?auto_29416 ?auto_29419 ) ) ( not ( = ?auto_29424 ?auto_29419 ) ) ( IS-CRATE ?auto_29415 ) ( AVAILABLE ?auto_29425 ) ( SURFACE-AT ?auto_29415 ?auto_29421 ) ( ON ?auto_29415 ?auto_29420 ) ( CLEAR ?auto_29415 ) ( not ( = ?auto_29415 ?auto_29420 ) ) ( not ( = ?auto_29416 ?auto_29420 ) ) ( not ( = ?auto_29424 ?auto_29420 ) ) ( not ( = ?auto_29419 ?auto_29420 ) ) ( TRUCK-AT ?auto_29422 ?auto_29418 ) ( SURFACE-AT ?auto_29423 ?auto_29418 ) ( CLEAR ?auto_29423 ) ( IS-CRATE ?auto_29424 ) ( not ( = ?auto_29423 ?auto_29424 ) ) ( not ( = ?auto_29415 ?auto_29423 ) ) ( not ( = ?auto_29416 ?auto_29423 ) ) ( not ( = ?auto_29419 ?auto_29423 ) ) ( not ( = ?auto_29420 ?auto_29423 ) ) ( AVAILABLE ?auto_29417 ) ( IN ?auto_29424 ?auto_29422 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29417 ?auto_29424 ?auto_29422 ?auto_29418 )
      ( MAKE-2CRATE ?auto_29424 ?auto_29415 ?auto_29416 )
      ( MAKE-1CRATE-VERIFY ?auto_29415 ?auto_29416 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29426 - SURFACE
      ?auto_29427 - SURFACE
      ?auto_29428 - SURFACE
    )
    :vars
    (
      ?auto_29431 - HOIST
      ?auto_29430 - PLACE
      ?auto_29434 - PLACE
      ?auto_29435 - HOIST
      ?auto_29429 - SURFACE
      ?auto_29436 - SURFACE
      ?auto_29433 - TRUCK
      ?auto_29432 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29431 ?auto_29430 ) ( IS-CRATE ?auto_29428 ) ( not ( = ?auto_29427 ?auto_29428 ) ) ( not ( = ?auto_29426 ?auto_29427 ) ) ( not ( = ?auto_29426 ?auto_29428 ) ) ( not ( = ?auto_29434 ?auto_29430 ) ) ( HOIST-AT ?auto_29435 ?auto_29434 ) ( not ( = ?auto_29431 ?auto_29435 ) ) ( SURFACE-AT ?auto_29428 ?auto_29434 ) ( ON ?auto_29428 ?auto_29429 ) ( CLEAR ?auto_29428 ) ( not ( = ?auto_29427 ?auto_29429 ) ) ( not ( = ?auto_29428 ?auto_29429 ) ) ( not ( = ?auto_29426 ?auto_29429 ) ) ( IS-CRATE ?auto_29427 ) ( AVAILABLE ?auto_29435 ) ( SURFACE-AT ?auto_29427 ?auto_29434 ) ( ON ?auto_29427 ?auto_29436 ) ( CLEAR ?auto_29427 ) ( not ( = ?auto_29427 ?auto_29436 ) ) ( not ( = ?auto_29428 ?auto_29436 ) ) ( not ( = ?auto_29426 ?auto_29436 ) ) ( not ( = ?auto_29429 ?auto_29436 ) ) ( TRUCK-AT ?auto_29433 ?auto_29430 ) ( SURFACE-AT ?auto_29432 ?auto_29430 ) ( CLEAR ?auto_29432 ) ( IS-CRATE ?auto_29426 ) ( not ( = ?auto_29432 ?auto_29426 ) ) ( not ( = ?auto_29427 ?auto_29432 ) ) ( not ( = ?auto_29428 ?auto_29432 ) ) ( not ( = ?auto_29429 ?auto_29432 ) ) ( not ( = ?auto_29436 ?auto_29432 ) ) ( AVAILABLE ?auto_29431 ) ( IN ?auto_29426 ?auto_29433 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29427 ?auto_29428 )
      ( MAKE-2CRATE-VERIFY ?auto_29426 ?auto_29427 ?auto_29428 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29437 - SURFACE
      ?auto_29438 - SURFACE
      ?auto_29439 - SURFACE
      ?auto_29440 - SURFACE
    )
    :vars
    (
      ?auto_29441 - HOIST
      ?auto_29444 - PLACE
      ?auto_29447 - PLACE
      ?auto_29443 - HOIST
      ?auto_29446 - SURFACE
      ?auto_29445 - SURFACE
      ?auto_29442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29441 ?auto_29444 ) ( IS-CRATE ?auto_29440 ) ( not ( = ?auto_29439 ?auto_29440 ) ) ( not ( = ?auto_29438 ?auto_29439 ) ) ( not ( = ?auto_29438 ?auto_29440 ) ) ( not ( = ?auto_29447 ?auto_29444 ) ) ( HOIST-AT ?auto_29443 ?auto_29447 ) ( not ( = ?auto_29441 ?auto_29443 ) ) ( SURFACE-AT ?auto_29440 ?auto_29447 ) ( ON ?auto_29440 ?auto_29446 ) ( CLEAR ?auto_29440 ) ( not ( = ?auto_29439 ?auto_29446 ) ) ( not ( = ?auto_29440 ?auto_29446 ) ) ( not ( = ?auto_29438 ?auto_29446 ) ) ( IS-CRATE ?auto_29439 ) ( AVAILABLE ?auto_29443 ) ( SURFACE-AT ?auto_29439 ?auto_29447 ) ( ON ?auto_29439 ?auto_29445 ) ( CLEAR ?auto_29439 ) ( not ( = ?auto_29439 ?auto_29445 ) ) ( not ( = ?auto_29440 ?auto_29445 ) ) ( not ( = ?auto_29438 ?auto_29445 ) ) ( not ( = ?auto_29446 ?auto_29445 ) ) ( TRUCK-AT ?auto_29442 ?auto_29444 ) ( SURFACE-AT ?auto_29437 ?auto_29444 ) ( CLEAR ?auto_29437 ) ( IS-CRATE ?auto_29438 ) ( not ( = ?auto_29437 ?auto_29438 ) ) ( not ( = ?auto_29439 ?auto_29437 ) ) ( not ( = ?auto_29440 ?auto_29437 ) ) ( not ( = ?auto_29446 ?auto_29437 ) ) ( not ( = ?auto_29445 ?auto_29437 ) ) ( AVAILABLE ?auto_29441 ) ( IN ?auto_29438 ?auto_29442 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29438 ?auto_29439 ?auto_29440 )
      ( MAKE-3CRATE-VERIFY ?auto_29437 ?auto_29438 ?auto_29439 ?auto_29440 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29448 - SURFACE
      ?auto_29449 - SURFACE
      ?auto_29450 - SURFACE
      ?auto_29451 - SURFACE
      ?auto_29452 - SURFACE
    )
    :vars
    (
      ?auto_29453 - HOIST
      ?auto_29456 - PLACE
      ?auto_29459 - PLACE
      ?auto_29455 - HOIST
      ?auto_29458 - SURFACE
      ?auto_29457 - SURFACE
      ?auto_29454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29453 ?auto_29456 ) ( IS-CRATE ?auto_29452 ) ( not ( = ?auto_29451 ?auto_29452 ) ) ( not ( = ?auto_29450 ?auto_29451 ) ) ( not ( = ?auto_29450 ?auto_29452 ) ) ( not ( = ?auto_29459 ?auto_29456 ) ) ( HOIST-AT ?auto_29455 ?auto_29459 ) ( not ( = ?auto_29453 ?auto_29455 ) ) ( SURFACE-AT ?auto_29452 ?auto_29459 ) ( ON ?auto_29452 ?auto_29458 ) ( CLEAR ?auto_29452 ) ( not ( = ?auto_29451 ?auto_29458 ) ) ( not ( = ?auto_29452 ?auto_29458 ) ) ( not ( = ?auto_29450 ?auto_29458 ) ) ( IS-CRATE ?auto_29451 ) ( AVAILABLE ?auto_29455 ) ( SURFACE-AT ?auto_29451 ?auto_29459 ) ( ON ?auto_29451 ?auto_29457 ) ( CLEAR ?auto_29451 ) ( not ( = ?auto_29451 ?auto_29457 ) ) ( not ( = ?auto_29452 ?auto_29457 ) ) ( not ( = ?auto_29450 ?auto_29457 ) ) ( not ( = ?auto_29458 ?auto_29457 ) ) ( TRUCK-AT ?auto_29454 ?auto_29456 ) ( SURFACE-AT ?auto_29449 ?auto_29456 ) ( CLEAR ?auto_29449 ) ( IS-CRATE ?auto_29450 ) ( not ( = ?auto_29449 ?auto_29450 ) ) ( not ( = ?auto_29451 ?auto_29449 ) ) ( not ( = ?auto_29452 ?auto_29449 ) ) ( not ( = ?auto_29458 ?auto_29449 ) ) ( not ( = ?auto_29457 ?auto_29449 ) ) ( AVAILABLE ?auto_29453 ) ( IN ?auto_29450 ?auto_29454 ) ( ON ?auto_29449 ?auto_29448 ) ( not ( = ?auto_29448 ?auto_29449 ) ) ( not ( = ?auto_29448 ?auto_29450 ) ) ( not ( = ?auto_29448 ?auto_29451 ) ) ( not ( = ?auto_29448 ?auto_29452 ) ) ( not ( = ?auto_29448 ?auto_29458 ) ) ( not ( = ?auto_29448 ?auto_29457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29450 ?auto_29451 ?auto_29452 )
      ( MAKE-4CRATE-VERIFY ?auto_29448 ?auto_29449 ?auto_29450 ?auto_29451 ?auto_29452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29460 - SURFACE
      ?auto_29461 - SURFACE
    )
    :vars
    (
      ?auto_29463 - HOIST
      ?auto_29466 - PLACE
      ?auto_29462 - SURFACE
      ?auto_29469 - PLACE
      ?auto_29465 - HOIST
      ?auto_29468 - SURFACE
      ?auto_29467 - SURFACE
      ?auto_29470 - SURFACE
      ?auto_29464 - TRUCK
      ?auto_29471 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29463 ?auto_29466 ) ( IS-CRATE ?auto_29461 ) ( not ( = ?auto_29460 ?auto_29461 ) ) ( not ( = ?auto_29462 ?auto_29460 ) ) ( not ( = ?auto_29462 ?auto_29461 ) ) ( not ( = ?auto_29469 ?auto_29466 ) ) ( HOIST-AT ?auto_29465 ?auto_29469 ) ( not ( = ?auto_29463 ?auto_29465 ) ) ( SURFACE-AT ?auto_29461 ?auto_29469 ) ( ON ?auto_29461 ?auto_29468 ) ( CLEAR ?auto_29461 ) ( not ( = ?auto_29460 ?auto_29468 ) ) ( not ( = ?auto_29461 ?auto_29468 ) ) ( not ( = ?auto_29462 ?auto_29468 ) ) ( IS-CRATE ?auto_29460 ) ( AVAILABLE ?auto_29465 ) ( SURFACE-AT ?auto_29460 ?auto_29469 ) ( ON ?auto_29460 ?auto_29467 ) ( CLEAR ?auto_29460 ) ( not ( = ?auto_29460 ?auto_29467 ) ) ( not ( = ?auto_29461 ?auto_29467 ) ) ( not ( = ?auto_29462 ?auto_29467 ) ) ( not ( = ?auto_29468 ?auto_29467 ) ) ( SURFACE-AT ?auto_29470 ?auto_29466 ) ( CLEAR ?auto_29470 ) ( IS-CRATE ?auto_29462 ) ( not ( = ?auto_29470 ?auto_29462 ) ) ( not ( = ?auto_29460 ?auto_29470 ) ) ( not ( = ?auto_29461 ?auto_29470 ) ) ( not ( = ?auto_29468 ?auto_29470 ) ) ( not ( = ?auto_29467 ?auto_29470 ) ) ( AVAILABLE ?auto_29463 ) ( IN ?auto_29462 ?auto_29464 ) ( TRUCK-AT ?auto_29464 ?auto_29471 ) ( not ( = ?auto_29471 ?auto_29466 ) ) ( not ( = ?auto_29469 ?auto_29471 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_29464 ?auto_29471 ?auto_29466 )
      ( MAKE-2CRATE ?auto_29462 ?auto_29460 ?auto_29461 )
      ( MAKE-1CRATE-VERIFY ?auto_29460 ?auto_29461 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29472 - SURFACE
      ?auto_29473 - SURFACE
      ?auto_29474 - SURFACE
    )
    :vars
    (
      ?auto_29482 - HOIST
      ?auto_29475 - PLACE
      ?auto_29480 - PLACE
      ?auto_29479 - HOIST
      ?auto_29478 - SURFACE
      ?auto_29477 - SURFACE
      ?auto_29483 - SURFACE
      ?auto_29476 - TRUCK
      ?auto_29481 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29482 ?auto_29475 ) ( IS-CRATE ?auto_29474 ) ( not ( = ?auto_29473 ?auto_29474 ) ) ( not ( = ?auto_29472 ?auto_29473 ) ) ( not ( = ?auto_29472 ?auto_29474 ) ) ( not ( = ?auto_29480 ?auto_29475 ) ) ( HOIST-AT ?auto_29479 ?auto_29480 ) ( not ( = ?auto_29482 ?auto_29479 ) ) ( SURFACE-AT ?auto_29474 ?auto_29480 ) ( ON ?auto_29474 ?auto_29478 ) ( CLEAR ?auto_29474 ) ( not ( = ?auto_29473 ?auto_29478 ) ) ( not ( = ?auto_29474 ?auto_29478 ) ) ( not ( = ?auto_29472 ?auto_29478 ) ) ( IS-CRATE ?auto_29473 ) ( AVAILABLE ?auto_29479 ) ( SURFACE-AT ?auto_29473 ?auto_29480 ) ( ON ?auto_29473 ?auto_29477 ) ( CLEAR ?auto_29473 ) ( not ( = ?auto_29473 ?auto_29477 ) ) ( not ( = ?auto_29474 ?auto_29477 ) ) ( not ( = ?auto_29472 ?auto_29477 ) ) ( not ( = ?auto_29478 ?auto_29477 ) ) ( SURFACE-AT ?auto_29483 ?auto_29475 ) ( CLEAR ?auto_29483 ) ( IS-CRATE ?auto_29472 ) ( not ( = ?auto_29483 ?auto_29472 ) ) ( not ( = ?auto_29473 ?auto_29483 ) ) ( not ( = ?auto_29474 ?auto_29483 ) ) ( not ( = ?auto_29478 ?auto_29483 ) ) ( not ( = ?auto_29477 ?auto_29483 ) ) ( AVAILABLE ?auto_29482 ) ( IN ?auto_29472 ?auto_29476 ) ( TRUCK-AT ?auto_29476 ?auto_29481 ) ( not ( = ?auto_29481 ?auto_29475 ) ) ( not ( = ?auto_29480 ?auto_29481 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29473 ?auto_29474 )
      ( MAKE-2CRATE-VERIFY ?auto_29472 ?auto_29473 ?auto_29474 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29484 - SURFACE
      ?auto_29485 - SURFACE
      ?auto_29486 - SURFACE
      ?auto_29487 - SURFACE
    )
    :vars
    (
      ?auto_29491 - HOIST
      ?auto_29494 - PLACE
      ?auto_29493 - PLACE
      ?auto_29490 - HOIST
      ?auto_29492 - SURFACE
      ?auto_29488 - SURFACE
      ?auto_29495 - TRUCK
      ?auto_29489 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29491 ?auto_29494 ) ( IS-CRATE ?auto_29487 ) ( not ( = ?auto_29486 ?auto_29487 ) ) ( not ( = ?auto_29485 ?auto_29486 ) ) ( not ( = ?auto_29485 ?auto_29487 ) ) ( not ( = ?auto_29493 ?auto_29494 ) ) ( HOIST-AT ?auto_29490 ?auto_29493 ) ( not ( = ?auto_29491 ?auto_29490 ) ) ( SURFACE-AT ?auto_29487 ?auto_29493 ) ( ON ?auto_29487 ?auto_29492 ) ( CLEAR ?auto_29487 ) ( not ( = ?auto_29486 ?auto_29492 ) ) ( not ( = ?auto_29487 ?auto_29492 ) ) ( not ( = ?auto_29485 ?auto_29492 ) ) ( IS-CRATE ?auto_29486 ) ( AVAILABLE ?auto_29490 ) ( SURFACE-AT ?auto_29486 ?auto_29493 ) ( ON ?auto_29486 ?auto_29488 ) ( CLEAR ?auto_29486 ) ( not ( = ?auto_29486 ?auto_29488 ) ) ( not ( = ?auto_29487 ?auto_29488 ) ) ( not ( = ?auto_29485 ?auto_29488 ) ) ( not ( = ?auto_29492 ?auto_29488 ) ) ( SURFACE-AT ?auto_29484 ?auto_29494 ) ( CLEAR ?auto_29484 ) ( IS-CRATE ?auto_29485 ) ( not ( = ?auto_29484 ?auto_29485 ) ) ( not ( = ?auto_29486 ?auto_29484 ) ) ( not ( = ?auto_29487 ?auto_29484 ) ) ( not ( = ?auto_29492 ?auto_29484 ) ) ( not ( = ?auto_29488 ?auto_29484 ) ) ( AVAILABLE ?auto_29491 ) ( IN ?auto_29485 ?auto_29495 ) ( TRUCK-AT ?auto_29495 ?auto_29489 ) ( not ( = ?auto_29489 ?auto_29494 ) ) ( not ( = ?auto_29493 ?auto_29489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29485 ?auto_29486 ?auto_29487 )
      ( MAKE-3CRATE-VERIFY ?auto_29484 ?auto_29485 ?auto_29486 ?auto_29487 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29496 - SURFACE
      ?auto_29497 - SURFACE
      ?auto_29498 - SURFACE
      ?auto_29499 - SURFACE
      ?auto_29500 - SURFACE
    )
    :vars
    (
      ?auto_29504 - HOIST
      ?auto_29507 - PLACE
      ?auto_29506 - PLACE
      ?auto_29503 - HOIST
      ?auto_29505 - SURFACE
      ?auto_29501 - SURFACE
      ?auto_29508 - TRUCK
      ?auto_29502 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29504 ?auto_29507 ) ( IS-CRATE ?auto_29500 ) ( not ( = ?auto_29499 ?auto_29500 ) ) ( not ( = ?auto_29498 ?auto_29499 ) ) ( not ( = ?auto_29498 ?auto_29500 ) ) ( not ( = ?auto_29506 ?auto_29507 ) ) ( HOIST-AT ?auto_29503 ?auto_29506 ) ( not ( = ?auto_29504 ?auto_29503 ) ) ( SURFACE-AT ?auto_29500 ?auto_29506 ) ( ON ?auto_29500 ?auto_29505 ) ( CLEAR ?auto_29500 ) ( not ( = ?auto_29499 ?auto_29505 ) ) ( not ( = ?auto_29500 ?auto_29505 ) ) ( not ( = ?auto_29498 ?auto_29505 ) ) ( IS-CRATE ?auto_29499 ) ( AVAILABLE ?auto_29503 ) ( SURFACE-AT ?auto_29499 ?auto_29506 ) ( ON ?auto_29499 ?auto_29501 ) ( CLEAR ?auto_29499 ) ( not ( = ?auto_29499 ?auto_29501 ) ) ( not ( = ?auto_29500 ?auto_29501 ) ) ( not ( = ?auto_29498 ?auto_29501 ) ) ( not ( = ?auto_29505 ?auto_29501 ) ) ( SURFACE-AT ?auto_29497 ?auto_29507 ) ( CLEAR ?auto_29497 ) ( IS-CRATE ?auto_29498 ) ( not ( = ?auto_29497 ?auto_29498 ) ) ( not ( = ?auto_29499 ?auto_29497 ) ) ( not ( = ?auto_29500 ?auto_29497 ) ) ( not ( = ?auto_29505 ?auto_29497 ) ) ( not ( = ?auto_29501 ?auto_29497 ) ) ( AVAILABLE ?auto_29504 ) ( IN ?auto_29498 ?auto_29508 ) ( TRUCK-AT ?auto_29508 ?auto_29502 ) ( not ( = ?auto_29502 ?auto_29507 ) ) ( not ( = ?auto_29506 ?auto_29502 ) ) ( ON ?auto_29497 ?auto_29496 ) ( not ( = ?auto_29496 ?auto_29497 ) ) ( not ( = ?auto_29496 ?auto_29498 ) ) ( not ( = ?auto_29496 ?auto_29499 ) ) ( not ( = ?auto_29496 ?auto_29500 ) ) ( not ( = ?auto_29496 ?auto_29505 ) ) ( not ( = ?auto_29496 ?auto_29501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29498 ?auto_29499 ?auto_29500 )
      ( MAKE-4CRATE-VERIFY ?auto_29496 ?auto_29497 ?auto_29498 ?auto_29499 ?auto_29500 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29509 - SURFACE
      ?auto_29510 - SURFACE
    )
    :vars
    (
      ?auto_29516 - HOIST
      ?auto_29519 - PLACE
      ?auto_29511 - SURFACE
      ?auto_29518 - PLACE
      ?auto_29515 - HOIST
      ?auto_29517 - SURFACE
      ?auto_29512 - SURFACE
      ?auto_29514 - SURFACE
      ?auto_29520 - TRUCK
      ?auto_29513 - PLACE
      ?auto_29521 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29516 ?auto_29519 ) ( IS-CRATE ?auto_29510 ) ( not ( = ?auto_29509 ?auto_29510 ) ) ( not ( = ?auto_29511 ?auto_29509 ) ) ( not ( = ?auto_29511 ?auto_29510 ) ) ( not ( = ?auto_29518 ?auto_29519 ) ) ( HOIST-AT ?auto_29515 ?auto_29518 ) ( not ( = ?auto_29516 ?auto_29515 ) ) ( SURFACE-AT ?auto_29510 ?auto_29518 ) ( ON ?auto_29510 ?auto_29517 ) ( CLEAR ?auto_29510 ) ( not ( = ?auto_29509 ?auto_29517 ) ) ( not ( = ?auto_29510 ?auto_29517 ) ) ( not ( = ?auto_29511 ?auto_29517 ) ) ( IS-CRATE ?auto_29509 ) ( AVAILABLE ?auto_29515 ) ( SURFACE-AT ?auto_29509 ?auto_29518 ) ( ON ?auto_29509 ?auto_29512 ) ( CLEAR ?auto_29509 ) ( not ( = ?auto_29509 ?auto_29512 ) ) ( not ( = ?auto_29510 ?auto_29512 ) ) ( not ( = ?auto_29511 ?auto_29512 ) ) ( not ( = ?auto_29517 ?auto_29512 ) ) ( SURFACE-AT ?auto_29514 ?auto_29519 ) ( CLEAR ?auto_29514 ) ( IS-CRATE ?auto_29511 ) ( not ( = ?auto_29514 ?auto_29511 ) ) ( not ( = ?auto_29509 ?auto_29514 ) ) ( not ( = ?auto_29510 ?auto_29514 ) ) ( not ( = ?auto_29517 ?auto_29514 ) ) ( not ( = ?auto_29512 ?auto_29514 ) ) ( AVAILABLE ?auto_29516 ) ( TRUCK-AT ?auto_29520 ?auto_29513 ) ( not ( = ?auto_29513 ?auto_29519 ) ) ( not ( = ?auto_29518 ?auto_29513 ) ) ( HOIST-AT ?auto_29521 ?auto_29513 ) ( LIFTING ?auto_29521 ?auto_29511 ) ( not ( = ?auto_29516 ?auto_29521 ) ) ( not ( = ?auto_29515 ?auto_29521 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29521 ?auto_29511 ?auto_29520 ?auto_29513 )
      ( MAKE-2CRATE ?auto_29511 ?auto_29509 ?auto_29510 )
      ( MAKE-1CRATE-VERIFY ?auto_29509 ?auto_29510 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29522 - SURFACE
      ?auto_29523 - SURFACE
      ?auto_29524 - SURFACE
    )
    :vars
    (
      ?auto_29534 - HOIST
      ?auto_29528 - PLACE
      ?auto_29526 - PLACE
      ?auto_29525 - HOIST
      ?auto_29531 - SURFACE
      ?auto_29529 - SURFACE
      ?auto_29533 - SURFACE
      ?auto_29527 - TRUCK
      ?auto_29532 - PLACE
      ?auto_29530 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29534 ?auto_29528 ) ( IS-CRATE ?auto_29524 ) ( not ( = ?auto_29523 ?auto_29524 ) ) ( not ( = ?auto_29522 ?auto_29523 ) ) ( not ( = ?auto_29522 ?auto_29524 ) ) ( not ( = ?auto_29526 ?auto_29528 ) ) ( HOIST-AT ?auto_29525 ?auto_29526 ) ( not ( = ?auto_29534 ?auto_29525 ) ) ( SURFACE-AT ?auto_29524 ?auto_29526 ) ( ON ?auto_29524 ?auto_29531 ) ( CLEAR ?auto_29524 ) ( not ( = ?auto_29523 ?auto_29531 ) ) ( not ( = ?auto_29524 ?auto_29531 ) ) ( not ( = ?auto_29522 ?auto_29531 ) ) ( IS-CRATE ?auto_29523 ) ( AVAILABLE ?auto_29525 ) ( SURFACE-AT ?auto_29523 ?auto_29526 ) ( ON ?auto_29523 ?auto_29529 ) ( CLEAR ?auto_29523 ) ( not ( = ?auto_29523 ?auto_29529 ) ) ( not ( = ?auto_29524 ?auto_29529 ) ) ( not ( = ?auto_29522 ?auto_29529 ) ) ( not ( = ?auto_29531 ?auto_29529 ) ) ( SURFACE-AT ?auto_29533 ?auto_29528 ) ( CLEAR ?auto_29533 ) ( IS-CRATE ?auto_29522 ) ( not ( = ?auto_29533 ?auto_29522 ) ) ( not ( = ?auto_29523 ?auto_29533 ) ) ( not ( = ?auto_29524 ?auto_29533 ) ) ( not ( = ?auto_29531 ?auto_29533 ) ) ( not ( = ?auto_29529 ?auto_29533 ) ) ( AVAILABLE ?auto_29534 ) ( TRUCK-AT ?auto_29527 ?auto_29532 ) ( not ( = ?auto_29532 ?auto_29528 ) ) ( not ( = ?auto_29526 ?auto_29532 ) ) ( HOIST-AT ?auto_29530 ?auto_29532 ) ( LIFTING ?auto_29530 ?auto_29522 ) ( not ( = ?auto_29534 ?auto_29530 ) ) ( not ( = ?auto_29525 ?auto_29530 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29523 ?auto_29524 )
      ( MAKE-2CRATE-VERIFY ?auto_29522 ?auto_29523 ?auto_29524 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29535 - SURFACE
      ?auto_29536 - SURFACE
      ?auto_29537 - SURFACE
      ?auto_29538 - SURFACE
    )
    :vars
    (
      ?auto_29543 - HOIST
      ?auto_29541 - PLACE
      ?auto_29545 - PLACE
      ?auto_29542 - HOIST
      ?auto_29540 - SURFACE
      ?auto_29547 - SURFACE
      ?auto_29539 - TRUCK
      ?auto_29544 - PLACE
      ?auto_29546 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29543 ?auto_29541 ) ( IS-CRATE ?auto_29538 ) ( not ( = ?auto_29537 ?auto_29538 ) ) ( not ( = ?auto_29536 ?auto_29537 ) ) ( not ( = ?auto_29536 ?auto_29538 ) ) ( not ( = ?auto_29545 ?auto_29541 ) ) ( HOIST-AT ?auto_29542 ?auto_29545 ) ( not ( = ?auto_29543 ?auto_29542 ) ) ( SURFACE-AT ?auto_29538 ?auto_29545 ) ( ON ?auto_29538 ?auto_29540 ) ( CLEAR ?auto_29538 ) ( not ( = ?auto_29537 ?auto_29540 ) ) ( not ( = ?auto_29538 ?auto_29540 ) ) ( not ( = ?auto_29536 ?auto_29540 ) ) ( IS-CRATE ?auto_29537 ) ( AVAILABLE ?auto_29542 ) ( SURFACE-AT ?auto_29537 ?auto_29545 ) ( ON ?auto_29537 ?auto_29547 ) ( CLEAR ?auto_29537 ) ( not ( = ?auto_29537 ?auto_29547 ) ) ( not ( = ?auto_29538 ?auto_29547 ) ) ( not ( = ?auto_29536 ?auto_29547 ) ) ( not ( = ?auto_29540 ?auto_29547 ) ) ( SURFACE-AT ?auto_29535 ?auto_29541 ) ( CLEAR ?auto_29535 ) ( IS-CRATE ?auto_29536 ) ( not ( = ?auto_29535 ?auto_29536 ) ) ( not ( = ?auto_29537 ?auto_29535 ) ) ( not ( = ?auto_29538 ?auto_29535 ) ) ( not ( = ?auto_29540 ?auto_29535 ) ) ( not ( = ?auto_29547 ?auto_29535 ) ) ( AVAILABLE ?auto_29543 ) ( TRUCK-AT ?auto_29539 ?auto_29544 ) ( not ( = ?auto_29544 ?auto_29541 ) ) ( not ( = ?auto_29545 ?auto_29544 ) ) ( HOIST-AT ?auto_29546 ?auto_29544 ) ( LIFTING ?auto_29546 ?auto_29536 ) ( not ( = ?auto_29543 ?auto_29546 ) ) ( not ( = ?auto_29542 ?auto_29546 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29536 ?auto_29537 ?auto_29538 )
      ( MAKE-3CRATE-VERIFY ?auto_29535 ?auto_29536 ?auto_29537 ?auto_29538 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29548 - SURFACE
      ?auto_29549 - SURFACE
      ?auto_29550 - SURFACE
      ?auto_29551 - SURFACE
      ?auto_29552 - SURFACE
    )
    :vars
    (
      ?auto_29557 - HOIST
      ?auto_29555 - PLACE
      ?auto_29559 - PLACE
      ?auto_29556 - HOIST
      ?auto_29554 - SURFACE
      ?auto_29561 - SURFACE
      ?auto_29553 - TRUCK
      ?auto_29558 - PLACE
      ?auto_29560 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29557 ?auto_29555 ) ( IS-CRATE ?auto_29552 ) ( not ( = ?auto_29551 ?auto_29552 ) ) ( not ( = ?auto_29550 ?auto_29551 ) ) ( not ( = ?auto_29550 ?auto_29552 ) ) ( not ( = ?auto_29559 ?auto_29555 ) ) ( HOIST-AT ?auto_29556 ?auto_29559 ) ( not ( = ?auto_29557 ?auto_29556 ) ) ( SURFACE-AT ?auto_29552 ?auto_29559 ) ( ON ?auto_29552 ?auto_29554 ) ( CLEAR ?auto_29552 ) ( not ( = ?auto_29551 ?auto_29554 ) ) ( not ( = ?auto_29552 ?auto_29554 ) ) ( not ( = ?auto_29550 ?auto_29554 ) ) ( IS-CRATE ?auto_29551 ) ( AVAILABLE ?auto_29556 ) ( SURFACE-AT ?auto_29551 ?auto_29559 ) ( ON ?auto_29551 ?auto_29561 ) ( CLEAR ?auto_29551 ) ( not ( = ?auto_29551 ?auto_29561 ) ) ( not ( = ?auto_29552 ?auto_29561 ) ) ( not ( = ?auto_29550 ?auto_29561 ) ) ( not ( = ?auto_29554 ?auto_29561 ) ) ( SURFACE-AT ?auto_29549 ?auto_29555 ) ( CLEAR ?auto_29549 ) ( IS-CRATE ?auto_29550 ) ( not ( = ?auto_29549 ?auto_29550 ) ) ( not ( = ?auto_29551 ?auto_29549 ) ) ( not ( = ?auto_29552 ?auto_29549 ) ) ( not ( = ?auto_29554 ?auto_29549 ) ) ( not ( = ?auto_29561 ?auto_29549 ) ) ( AVAILABLE ?auto_29557 ) ( TRUCK-AT ?auto_29553 ?auto_29558 ) ( not ( = ?auto_29558 ?auto_29555 ) ) ( not ( = ?auto_29559 ?auto_29558 ) ) ( HOIST-AT ?auto_29560 ?auto_29558 ) ( LIFTING ?auto_29560 ?auto_29550 ) ( not ( = ?auto_29557 ?auto_29560 ) ) ( not ( = ?auto_29556 ?auto_29560 ) ) ( ON ?auto_29549 ?auto_29548 ) ( not ( = ?auto_29548 ?auto_29549 ) ) ( not ( = ?auto_29548 ?auto_29550 ) ) ( not ( = ?auto_29548 ?auto_29551 ) ) ( not ( = ?auto_29548 ?auto_29552 ) ) ( not ( = ?auto_29548 ?auto_29554 ) ) ( not ( = ?auto_29548 ?auto_29561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29550 ?auto_29551 ?auto_29552 )
      ( MAKE-4CRATE-VERIFY ?auto_29548 ?auto_29549 ?auto_29550 ?auto_29551 ?auto_29552 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29562 - SURFACE
      ?auto_29563 - SURFACE
    )
    :vars
    (
      ?auto_29569 - HOIST
      ?auto_29566 - PLACE
      ?auto_29567 - SURFACE
      ?auto_29571 - PLACE
      ?auto_29568 - HOIST
      ?auto_29565 - SURFACE
      ?auto_29573 - SURFACE
      ?auto_29574 - SURFACE
      ?auto_29564 - TRUCK
      ?auto_29570 - PLACE
      ?auto_29572 - HOIST
      ?auto_29575 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29569 ?auto_29566 ) ( IS-CRATE ?auto_29563 ) ( not ( = ?auto_29562 ?auto_29563 ) ) ( not ( = ?auto_29567 ?auto_29562 ) ) ( not ( = ?auto_29567 ?auto_29563 ) ) ( not ( = ?auto_29571 ?auto_29566 ) ) ( HOIST-AT ?auto_29568 ?auto_29571 ) ( not ( = ?auto_29569 ?auto_29568 ) ) ( SURFACE-AT ?auto_29563 ?auto_29571 ) ( ON ?auto_29563 ?auto_29565 ) ( CLEAR ?auto_29563 ) ( not ( = ?auto_29562 ?auto_29565 ) ) ( not ( = ?auto_29563 ?auto_29565 ) ) ( not ( = ?auto_29567 ?auto_29565 ) ) ( IS-CRATE ?auto_29562 ) ( AVAILABLE ?auto_29568 ) ( SURFACE-AT ?auto_29562 ?auto_29571 ) ( ON ?auto_29562 ?auto_29573 ) ( CLEAR ?auto_29562 ) ( not ( = ?auto_29562 ?auto_29573 ) ) ( not ( = ?auto_29563 ?auto_29573 ) ) ( not ( = ?auto_29567 ?auto_29573 ) ) ( not ( = ?auto_29565 ?auto_29573 ) ) ( SURFACE-AT ?auto_29574 ?auto_29566 ) ( CLEAR ?auto_29574 ) ( IS-CRATE ?auto_29567 ) ( not ( = ?auto_29574 ?auto_29567 ) ) ( not ( = ?auto_29562 ?auto_29574 ) ) ( not ( = ?auto_29563 ?auto_29574 ) ) ( not ( = ?auto_29565 ?auto_29574 ) ) ( not ( = ?auto_29573 ?auto_29574 ) ) ( AVAILABLE ?auto_29569 ) ( TRUCK-AT ?auto_29564 ?auto_29570 ) ( not ( = ?auto_29570 ?auto_29566 ) ) ( not ( = ?auto_29571 ?auto_29570 ) ) ( HOIST-AT ?auto_29572 ?auto_29570 ) ( not ( = ?auto_29569 ?auto_29572 ) ) ( not ( = ?auto_29568 ?auto_29572 ) ) ( AVAILABLE ?auto_29572 ) ( SURFACE-AT ?auto_29567 ?auto_29570 ) ( ON ?auto_29567 ?auto_29575 ) ( CLEAR ?auto_29567 ) ( not ( = ?auto_29562 ?auto_29575 ) ) ( not ( = ?auto_29563 ?auto_29575 ) ) ( not ( = ?auto_29567 ?auto_29575 ) ) ( not ( = ?auto_29565 ?auto_29575 ) ) ( not ( = ?auto_29573 ?auto_29575 ) ) ( not ( = ?auto_29574 ?auto_29575 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29572 ?auto_29567 ?auto_29575 ?auto_29570 )
      ( MAKE-2CRATE ?auto_29567 ?auto_29562 ?auto_29563 )
      ( MAKE-1CRATE-VERIFY ?auto_29562 ?auto_29563 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29576 - SURFACE
      ?auto_29577 - SURFACE
      ?auto_29578 - SURFACE
    )
    :vars
    (
      ?auto_29588 - HOIST
      ?auto_29586 - PLACE
      ?auto_29580 - PLACE
      ?auto_29584 - HOIST
      ?auto_29582 - SURFACE
      ?auto_29581 - SURFACE
      ?auto_29583 - SURFACE
      ?auto_29585 - TRUCK
      ?auto_29589 - PLACE
      ?auto_29587 - HOIST
      ?auto_29579 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29588 ?auto_29586 ) ( IS-CRATE ?auto_29578 ) ( not ( = ?auto_29577 ?auto_29578 ) ) ( not ( = ?auto_29576 ?auto_29577 ) ) ( not ( = ?auto_29576 ?auto_29578 ) ) ( not ( = ?auto_29580 ?auto_29586 ) ) ( HOIST-AT ?auto_29584 ?auto_29580 ) ( not ( = ?auto_29588 ?auto_29584 ) ) ( SURFACE-AT ?auto_29578 ?auto_29580 ) ( ON ?auto_29578 ?auto_29582 ) ( CLEAR ?auto_29578 ) ( not ( = ?auto_29577 ?auto_29582 ) ) ( not ( = ?auto_29578 ?auto_29582 ) ) ( not ( = ?auto_29576 ?auto_29582 ) ) ( IS-CRATE ?auto_29577 ) ( AVAILABLE ?auto_29584 ) ( SURFACE-AT ?auto_29577 ?auto_29580 ) ( ON ?auto_29577 ?auto_29581 ) ( CLEAR ?auto_29577 ) ( not ( = ?auto_29577 ?auto_29581 ) ) ( not ( = ?auto_29578 ?auto_29581 ) ) ( not ( = ?auto_29576 ?auto_29581 ) ) ( not ( = ?auto_29582 ?auto_29581 ) ) ( SURFACE-AT ?auto_29583 ?auto_29586 ) ( CLEAR ?auto_29583 ) ( IS-CRATE ?auto_29576 ) ( not ( = ?auto_29583 ?auto_29576 ) ) ( not ( = ?auto_29577 ?auto_29583 ) ) ( not ( = ?auto_29578 ?auto_29583 ) ) ( not ( = ?auto_29582 ?auto_29583 ) ) ( not ( = ?auto_29581 ?auto_29583 ) ) ( AVAILABLE ?auto_29588 ) ( TRUCK-AT ?auto_29585 ?auto_29589 ) ( not ( = ?auto_29589 ?auto_29586 ) ) ( not ( = ?auto_29580 ?auto_29589 ) ) ( HOIST-AT ?auto_29587 ?auto_29589 ) ( not ( = ?auto_29588 ?auto_29587 ) ) ( not ( = ?auto_29584 ?auto_29587 ) ) ( AVAILABLE ?auto_29587 ) ( SURFACE-AT ?auto_29576 ?auto_29589 ) ( ON ?auto_29576 ?auto_29579 ) ( CLEAR ?auto_29576 ) ( not ( = ?auto_29577 ?auto_29579 ) ) ( not ( = ?auto_29578 ?auto_29579 ) ) ( not ( = ?auto_29576 ?auto_29579 ) ) ( not ( = ?auto_29582 ?auto_29579 ) ) ( not ( = ?auto_29581 ?auto_29579 ) ) ( not ( = ?auto_29583 ?auto_29579 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29577 ?auto_29578 )
      ( MAKE-2CRATE-VERIFY ?auto_29576 ?auto_29577 ?auto_29578 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29590 - SURFACE
      ?auto_29591 - SURFACE
      ?auto_29592 - SURFACE
      ?auto_29593 - SURFACE
    )
    :vars
    (
      ?auto_29599 - HOIST
      ?auto_29595 - PLACE
      ?auto_29603 - PLACE
      ?auto_29601 - HOIST
      ?auto_29598 - SURFACE
      ?auto_29602 - SURFACE
      ?auto_29597 - TRUCK
      ?auto_29594 - PLACE
      ?auto_29596 - HOIST
      ?auto_29600 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29599 ?auto_29595 ) ( IS-CRATE ?auto_29593 ) ( not ( = ?auto_29592 ?auto_29593 ) ) ( not ( = ?auto_29591 ?auto_29592 ) ) ( not ( = ?auto_29591 ?auto_29593 ) ) ( not ( = ?auto_29603 ?auto_29595 ) ) ( HOIST-AT ?auto_29601 ?auto_29603 ) ( not ( = ?auto_29599 ?auto_29601 ) ) ( SURFACE-AT ?auto_29593 ?auto_29603 ) ( ON ?auto_29593 ?auto_29598 ) ( CLEAR ?auto_29593 ) ( not ( = ?auto_29592 ?auto_29598 ) ) ( not ( = ?auto_29593 ?auto_29598 ) ) ( not ( = ?auto_29591 ?auto_29598 ) ) ( IS-CRATE ?auto_29592 ) ( AVAILABLE ?auto_29601 ) ( SURFACE-AT ?auto_29592 ?auto_29603 ) ( ON ?auto_29592 ?auto_29602 ) ( CLEAR ?auto_29592 ) ( not ( = ?auto_29592 ?auto_29602 ) ) ( not ( = ?auto_29593 ?auto_29602 ) ) ( not ( = ?auto_29591 ?auto_29602 ) ) ( not ( = ?auto_29598 ?auto_29602 ) ) ( SURFACE-AT ?auto_29590 ?auto_29595 ) ( CLEAR ?auto_29590 ) ( IS-CRATE ?auto_29591 ) ( not ( = ?auto_29590 ?auto_29591 ) ) ( not ( = ?auto_29592 ?auto_29590 ) ) ( not ( = ?auto_29593 ?auto_29590 ) ) ( not ( = ?auto_29598 ?auto_29590 ) ) ( not ( = ?auto_29602 ?auto_29590 ) ) ( AVAILABLE ?auto_29599 ) ( TRUCK-AT ?auto_29597 ?auto_29594 ) ( not ( = ?auto_29594 ?auto_29595 ) ) ( not ( = ?auto_29603 ?auto_29594 ) ) ( HOIST-AT ?auto_29596 ?auto_29594 ) ( not ( = ?auto_29599 ?auto_29596 ) ) ( not ( = ?auto_29601 ?auto_29596 ) ) ( AVAILABLE ?auto_29596 ) ( SURFACE-AT ?auto_29591 ?auto_29594 ) ( ON ?auto_29591 ?auto_29600 ) ( CLEAR ?auto_29591 ) ( not ( = ?auto_29592 ?auto_29600 ) ) ( not ( = ?auto_29593 ?auto_29600 ) ) ( not ( = ?auto_29591 ?auto_29600 ) ) ( not ( = ?auto_29598 ?auto_29600 ) ) ( not ( = ?auto_29602 ?auto_29600 ) ) ( not ( = ?auto_29590 ?auto_29600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29591 ?auto_29592 ?auto_29593 )
      ( MAKE-3CRATE-VERIFY ?auto_29590 ?auto_29591 ?auto_29592 ?auto_29593 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29604 - SURFACE
      ?auto_29605 - SURFACE
      ?auto_29606 - SURFACE
      ?auto_29607 - SURFACE
      ?auto_29608 - SURFACE
    )
    :vars
    (
      ?auto_29614 - HOIST
      ?auto_29610 - PLACE
      ?auto_29618 - PLACE
      ?auto_29616 - HOIST
      ?auto_29613 - SURFACE
      ?auto_29617 - SURFACE
      ?auto_29612 - TRUCK
      ?auto_29609 - PLACE
      ?auto_29611 - HOIST
      ?auto_29615 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29614 ?auto_29610 ) ( IS-CRATE ?auto_29608 ) ( not ( = ?auto_29607 ?auto_29608 ) ) ( not ( = ?auto_29606 ?auto_29607 ) ) ( not ( = ?auto_29606 ?auto_29608 ) ) ( not ( = ?auto_29618 ?auto_29610 ) ) ( HOIST-AT ?auto_29616 ?auto_29618 ) ( not ( = ?auto_29614 ?auto_29616 ) ) ( SURFACE-AT ?auto_29608 ?auto_29618 ) ( ON ?auto_29608 ?auto_29613 ) ( CLEAR ?auto_29608 ) ( not ( = ?auto_29607 ?auto_29613 ) ) ( not ( = ?auto_29608 ?auto_29613 ) ) ( not ( = ?auto_29606 ?auto_29613 ) ) ( IS-CRATE ?auto_29607 ) ( AVAILABLE ?auto_29616 ) ( SURFACE-AT ?auto_29607 ?auto_29618 ) ( ON ?auto_29607 ?auto_29617 ) ( CLEAR ?auto_29607 ) ( not ( = ?auto_29607 ?auto_29617 ) ) ( not ( = ?auto_29608 ?auto_29617 ) ) ( not ( = ?auto_29606 ?auto_29617 ) ) ( not ( = ?auto_29613 ?auto_29617 ) ) ( SURFACE-AT ?auto_29605 ?auto_29610 ) ( CLEAR ?auto_29605 ) ( IS-CRATE ?auto_29606 ) ( not ( = ?auto_29605 ?auto_29606 ) ) ( not ( = ?auto_29607 ?auto_29605 ) ) ( not ( = ?auto_29608 ?auto_29605 ) ) ( not ( = ?auto_29613 ?auto_29605 ) ) ( not ( = ?auto_29617 ?auto_29605 ) ) ( AVAILABLE ?auto_29614 ) ( TRUCK-AT ?auto_29612 ?auto_29609 ) ( not ( = ?auto_29609 ?auto_29610 ) ) ( not ( = ?auto_29618 ?auto_29609 ) ) ( HOIST-AT ?auto_29611 ?auto_29609 ) ( not ( = ?auto_29614 ?auto_29611 ) ) ( not ( = ?auto_29616 ?auto_29611 ) ) ( AVAILABLE ?auto_29611 ) ( SURFACE-AT ?auto_29606 ?auto_29609 ) ( ON ?auto_29606 ?auto_29615 ) ( CLEAR ?auto_29606 ) ( not ( = ?auto_29607 ?auto_29615 ) ) ( not ( = ?auto_29608 ?auto_29615 ) ) ( not ( = ?auto_29606 ?auto_29615 ) ) ( not ( = ?auto_29613 ?auto_29615 ) ) ( not ( = ?auto_29617 ?auto_29615 ) ) ( not ( = ?auto_29605 ?auto_29615 ) ) ( ON ?auto_29605 ?auto_29604 ) ( not ( = ?auto_29604 ?auto_29605 ) ) ( not ( = ?auto_29604 ?auto_29606 ) ) ( not ( = ?auto_29604 ?auto_29607 ) ) ( not ( = ?auto_29604 ?auto_29608 ) ) ( not ( = ?auto_29604 ?auto_29613 ) ) ( not ( = ?auto_29604 ?auto_29617 ) ) ( not ( = ?auto_29604 ?auto_29615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29606 ?auto_29607 ?auto_29608 )
      ( MAKE-4CRATE-VERIFY ?auto_29604 ?auto_29605 ?auto_29606 ?auto_29607 ?auto_29608 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29619 - SURFACE
      ?auto_29620 - SURFACE
    )
    :vars
    (
      ?auto_29627 - HOIST
      ?auto_29622 - PLACE
      ?auto_29625 - SURFACE
      ?auto_29632 - PLACE
      ?auto_29630 - HOIST
      ?auto_29626 - SURFACE
      ?auto_29631 - SURFACE
      ?auto_29628 - SURFACE
      ?auto_29621 - PLACE
      ?auto_29623 - HOIST
      ?auto_29629 - SURFACE
      ?auto_29624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29627 ?auto_29622 ) ( IS-CRATE ?auto_29620 ) ( not ( = ?auto_29619 ?auto_29620 ) ) ( not ( = ?auto_29625 ?auto_29619 ) ) ( not ( = ?auto_29625 ?auto_29620 ) ) ( not ( = ?auto_29632 ?auto_29622 ) ) ( HOIST-AT ?auto_29630 ?auto_29632 ) ( not ( = ?auto_29627 ?auto_29630 ) ) ( SURFACE-AT ?auto_29620 ?auto_29632 ) ( ON ?auto_29620 ?auto_29626 ) ( CLEAR ?auto_29620 ) ( not ( = ?auto_29619 ?auto_29626 ) ) ( not ( = ?auto_29620 ?auto_29626 ) ) ( not ( = ?auto_29625 ?auto_29626 ) ) ( IS-CRATE ?auto_29619 ) ( AVAILABLE ?auto_29630 ) ( SURFACE-AT ?auto_29619 ?auto_29632 ) ( ON ?auto_29619 ?auto_29631 ) ( CLEAR ?auto_29619 ) ( not ( = ?auto_29619 ?auto_29631 ) ) ( not ( = ?auto_29620 ?auto_29631 ) ) ( not ( = ?auto_29625 ?auto_29631 ) ) ( not ( = ?auto_29626 ?auto_29631 ) ) ( SURFACE-AT ?auto_29628 ?auto_29622 ) ( CLEAR ?auto_29628 ) ( IS-CRATE ?auto_29625 ) ( not ( = ?auto_29628 ?auto_29625 ) ) ( not ( = ?auto_29619 ?auto_29628 ) ) ( not ( = ?auto_29620 ?auto_29628 ) ) ( not ( = ?auto_29626 ?auto_29628 ) ) ( not ( = ?auto_29631 ?auto_29628 ) ) ( AVAILABLE ?auto_29627 ) ( not ( = ?auto_29621 ?auto_29622 ) ) ( not ( = ?auto_29632 ?auto_29621 ) ) ( HOIST-AT ?auto_29623 ?auto_29621 ) ( not ( = ?auto_29627 ?auto_29623 ) ) ( not ( = ?auto_29630 ?auto_29623 ) ) ( AVAILABLE ?auto_29623 ) ( SURFACE-AT ?auto_29625 ?auto_29621 ) ( ON ?auto_29625 ?auto_29629 ) ( CLEAR ?auto_29625 ) ( not ( = ?auto_29619 ?auto_29629 ) ) ( not ( = ?auto_29620 ?auto_29629 ) ) ( not ( = ?auto_29625 ?auto_29629 ) ) ( not ( = ?auto_29626 ?auto_29629 ) ) ( not ( = ?auto_29631 ?auto_29629 ) ) ( not ( = ?auto_29628 ?auto_29629 ) ) ( TRUCK-AT ?auto_29624 ?auto_29622 ) )
    :subtasks
    ( ( !DRIVE ?auto_29624 ?auto_29622 ?auto_29621 )
      ( MAKE-2CRATE ?auto_29625 ?auto_29619 ?auto_29620 )
      ( MAKE-1CRATE-VERIFY ?auto_29619 ?auto_29620 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29633 - SURFACE
      ?auto_29634 - SURFACE
      ?auto_29635 - SURFACE
    )
    :vars
    (
      ?auto_29645 - HOIST
      ?auto_29641 - PLACE
      ?auto_29643 - PLACE
      ?auto_29642 - HOIST
      ?auto_29640 - SURFACE
      ?auto_29646 - SURFACE
      ?auto_29644 - SURFACE
      ?auto_29637 - PLACE
      ?auto_29638 - HOIST
      ?auto_29639 - SURFACE
      ?auto_29636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29645 ?auto_29641 ) ( IS-CRATE ?auto_29635 ) ( not ( = ?auto_29634 ?auto_29635 ) ) ( not ( = ?auto_29633 ?auto_29634 ) ) ( not ( = ?auto_29633 ?auto_29635 ) ) ( not ( = ?auto_29643 ?auto_29641 ) ) ( HOIST-AT ?auto_29642 ?auto_29643 ) ( not ( = ?auto_29645 ?auto_29642 ) ) ( SURFACE-AT ?auto_29635 ?auto_29643 ) ( ON ?auto_29635 ?auto_29640 ) ( CLEAR ?auto_29635 ) ( not ( = ?auto_29634 ?auto_29640 ) ) ( not ( = ?auto_29635 ?auto_29640 ) ) ( not ( = ?auto_29633 ?auto_29640 ) ) ( IS-CRATE ?auto_29634 ) ( AVAILABLE ?auto_29642 ) ( SURFACE-AT ?auto_29634 ?auto_29643 ) ( ON ?auto_29634 ?auto_29646 ) ( CLEAR ?auto_29634 ) ( not ( = ?auto_29634 ?auto_29646 ) ) ( not ( = ?auto_29635 ?auto_29646 ) ) ( not ( = ?auto_29633 ?auto_29646 ) ) ( not ( = ?auto_29640 ?auto_29646 ) ) ( SURFACE-AT ?auto_29644 ?auto_29641 ) ( CLEAR ?auto_29644 ) ( IS-CRATE ?auto_29633 ) ( not ( = ?auto_29644 ?auto_29633 ) ) ( not ( = ?auto_29634 ?auto_29644 ) ) ( not ( = ?auto_29635 ?auto_29644 ) ) ( not ( = ?auto_29640 ?auto_29644 ) ) ( not ( = ?auto_29646 ?auto_29644 ) ) ( AVAILABLE ?auto_29645 ) ( not ( = ?auto_29637 ?auto_29641 ) ) ( not ( = ?auto_29643 ?auto_29637 ) ) ( HOIST-AT ?auto_29638 ?auto_29637 ) ( not ( = ?auto_29645 ?auto_29638 ) ) ( not ( = ?auto_29642 ?auto_29638 ) ) ( AVAILABLE ?auto_29638 ) ( SURFACE-AT ?auto_29633 ?auto_29637 ) ( ON ?auto_29633 ?auto_29639 ) ( CLEAR ?auto_29633 ) ( not ( = ?auto_29634 ?auto_29639 ) ) ( not ( = ?auto_29635 ?auto_29639 ) ) ( not ( = ?auto_29633 ?auto_29639 ) ) ( not ( = ?auto_29640 ?auto_29639 ) ) ( not ( = ?auto_29646 ?auto_29639 ) ) ( not ( = ?auto_29644 ?auto_29639 ) ) ( TRUCK-AT ?auto_29636 ?auto_29641 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29634 ?auto_29635 )
      ( MAKE-2CRATE-VERIFY ?auto_29633 ?auto_29634 ?auto_29635 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29647 - SURFACE
      ?auto_29648 - SURFACE
      ?auto_29649 - SURFACE
      ?auto_29650 - SURFACE
    )
    :vars
    (
      ?auto_29655 - HOIST
      ?auto_29653 - PLACE
      ?auto_29651 - PLACE
      ?auto_29658 - HOIST
      ?auto_29654 - SURFACE
      ?auto_29656 - SURFACE
      ?auto_29660 - PLACE
      ?auto_29652 - HOIST
      ?auto_29659 - SURFACE
      ?auto_29657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29655 ?auto_29653 ) ( IS-CRATE ?auto_29650 ) ( not ( = ?auto_29649 ?auto_29650 ) ) ( not ( = ?auto_29648 ?auto_29649 ) ) ( not ( = ?auto_29648 ?auto_29650 ) ) ( not ( = ?auto_29651 ?auto_29653 ) ) ( HOIST-AT ?auto_29658 ?auto_29651 ) ( not ( = ?auto_29655 ?auto_29658 ) ) ( SURFACE-AT ?auto_29650 ?auto_29651 ) ( ON ?auto_29650 ?auto_29654 ) ( CLEAR ?auto_29650 ) ( not ( = ?auto_29649 ?auto_29654 ) ) ( not ( = ?auto_29650 ?auto_29654 ) ) ( not ( = ?auto_29648 ?auto_29654 ) ) ( IS-CRATE ?auto_29649 ) ( AVAILABLE ?auto_29658 ) ( SURFACE-AT ?auto_29649 ?auto_29651 ) ( ON ?auto_29649 ?auto_29656 ) ( CLEAR ?auto_29649 ) ( not ( = ?auto_29649 ?auto_29656 ) ) ( not ( = ?auto_29650 ?auto_29656 ) ) ( not ( = ?auto_29648 ?auto_29656 ) ) ( not ( = ?auto_29654 ?auto_29656 ) ) ( SURFACE-AT ?auto_29647 ?auto_29653 ) ( CLEAR ?auto_29647 ) ( IS-CRATE ?auto_29648 ) ( not ( = ?auto_29647 ?auto_29648 ) ) ( not ( = ?auto_29649 ?auto_29647 ) ) ( not ( = ?auto_29650 ?auto_29647 ) ) ( not ( = ?auto_29654 ?auto_29647 ) ) ( not ( = ?auto_29656 ?auto_29647 ) ) ( AVAILABLE ?auto_29655 ) ( not ( = ?auto_29660 ?auto_29653 ) ) ( not ( = ?auto_29651 ?auto_29660 ) ) ( HOIST-AT ?auto_29652 ?auto_29660 ) ( not ( = ?auto_29655 ?auto_29652 ) ) ( not ( = ?auto_29658 ?auto_29652 ) ) ( AVAILABLE ?auto_29652 ) ( SURFACE-AT ?auto_29648 ?auto_29660 ) ( ON ?auto_29648 ?auto_29659 ) ( CLEAR ?auto_29648 ) ( not ( = ?auto_29649 ?auto_29659 ) ) ( not ( = ?auto_29650 ?auto_29659 ) ) ( not ( = ?auto_29648 ?auto_29659 ) ) ( not ( = ?auto_29654 ?auto_29659 ) ) ( not ( = ?auto_29656 ?auto_29659 ) ) ( not ( = ?auto_29647 ?auto_29659 ) ) ( TRUCK-AT ?auto_29657 ?auto_29653 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29648 ?auto_29649 ?auto_29650 )
      ( MAKE-3CRATE-VERIFY ?auto_29647 ?auto_29648 ?auto_29649 ?auto_29650 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29661 - SURFACE
      ?auto_29662 - SURFACE
      ?auto_29663 - SURFACE
      ?auto_29664 - SURFACE
      ?auto_29665 - SURFACE
    )
    :vars
    (
      ?auto_29670 - HOIST
      ?auto_29668 - PLACE
      ?auto_29666 - PLACE
      ?auto_29673 - HOIST
      ?auto_29669 - SURFACE
      ?auto_29671 - SURFACE
      ?auto_29675 - PLACE
      ?auto_29667 - HOIST
      ?auto_29674 - SURFACE
      ?auto_29672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29670 ?auto_29668 ) ( IS-CRATE ?auto_29665 ) ( not ( = ?auto_29664 ?auto_29665 ) ) ( not ( = ?auto_29663 ?auto_29664 ) ) ( not ( = ?auto_29663 ?auto_29665 ) ) ( not ( = ?auto_29666 ?auto_29668 ) ) ( HOIST-AT ?auto_29673 ?auto_29666 ) ( not ( = ?auto_29670 ?auto_29673 ) ) ( SURFACE-AT ?auto_29665 ?auto_29666 ) ( ON ?auto_29665 ?auto_29669 ) ( CLEAR ?auto_29665 ) ( not ( = ?auto_29664 ?auto_29669 ) ) ( not ( = ?auto_29665 ?auto_29669 ) ) ( not ( = ?auto_29663 ?auto_29669 ) ) ( IS-CRATE ?auto_29664 ) ( AVAILABLE ?auto_29673 ) ( SURFACE-AT ?auto_29664 ?auto_29666 ) ( ON ?auto_29664 ?auto_29671 ) ( CLEAR ?auto_29664 ) ( not ( = ?auto_29664 ?auto_29671 ) ) ( not ( = ?auto_29665 ?auto_29671 ) ) ( not ( = ?auto_29663 ?auto_29671 ) ) ( not ( = ?auto_29669 ?auto_29671 ) ) ( SURFACE-AT ?auto_29662 ?auto_29668 ) ( CLEAR ?auto_29662 ) ( IS-CRATE ?auto_29663 ) ( not ( = ?auto_29662 ?auto_29663 ) ) ( not ( = ?auto_29664 ?auto_29662 ) ) ( not ( = ?auto_29665 ?auto_29662 ) ) ( not ( = ?auto_29669 ?auto_29662 ) ) ( not ( = ?auto_29671 ?auto_29662 ) ) ( AVAILABLE ?auto_29670 ) ( not ( = ?auto_29675 ?auto_29668 ) ) ( not ( = ?auto_29666 ?auto_29675 ) ) ( HOIST-AT ?auto_29667 ?auto_29675 ) ( not ( = ?auto_29670 ?auto_29667 ) ) ( not ( = ?auto_29673 ?auto_29667 ) ) ( AVAILABLE ?auto_29667 ) ( SURFACE-AT ?auto_29663 ?auto_29675 ) ( ON ?auto_29663 ?auto_29674 ) ( CLEAR ?auto_29663 ) ( not ( = ?auto_29664 ?auto_29674 ) ) ( not ( = ?auto_29665 ?auto_29674 ) ) ( not ( = ?auto_29663 ?auto_29674 ) ) ( not ( = ?auto_29669 ?auto_29674 ) ) ( not ( = ?auto_29671 ?auto_29674 ) ) ( not ( = ?auto_29662 ?auto_29674 ) ) ( TRUCK-AT ?auto_29672 ?auto_29668 ) ( ON ?auto_29662 ?auto_29661 ) ( not ( = ?auto_29661 ?auto_29662 ) ) ( not ( = ?auto_29661 ?auto_29663 ) ) ( not ( = ?auto_29661 ?auto_29664 ) ) ( not ( = ?auto_29661 ?auto_29665 ) ) ( not ( = ?auto_29661 ?auto_29669 ) ) ( not ( = ?auto_29661 ?auto_29671 ) ) ( not ( = ?auto_29661 ?auto_29674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29663 ?auto_29664 ?auto_29665 )
      ( MAKE-4CRATE-VERIFY ?auto_29661 ?auto_29662 ?auto_29663 ?auto_29664 ?auto_29665 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29676 - SURFACE
      ?auto_29677 - SURFACE
    )
    :vars
    (
      ?auto_29683 - HOIST
      ?auto_29680 - PLACE
      ?auto_29682 - SURFACE
      ?auto_29678 - PLACE
      ?auto_29686 - HOIST
      ?auto_29681 - SURFACE
      ?auto_29684 - SURFACE
      ?auto_29687 - SURFACE
      ?auto_29689 - PLACE
      ?auto_29679 - HOIST
      ?auto_29688 - SURFACE
      ?auto_29685 - TRUCK
      ?auto_29690 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29683 ?auto_29680 ) ( IS-CRATE ?auto_29677 ) ( not ( = ?auto_29676 ?auto_29677 ) ) ( not ( = ?auto_29682 ?auto_29676 ) ) ( not ( = ?auto_29682 ?auto_29677 ) ) ( not ( = ?auto_29678 ?auto_29680 ) ) ( HOIST-AT ?auto_29686 ?auto_29678 ) ( not ( = ?auto_29683 ?auto_29686 ) ) ( SURFACE-AT ?auto_29677 ?auto_29678 ) ( ON ?auto_29677 ?auto_29681 ) ( CLEAR ?auto_29677 ) ( not ( = ?auto_29676 ?auto_29681 ) ) ( not ( = ?auto_29677 ?auto_29681 ) ) ( not ( = ?auto_29682 ?auto_29681 ) ) ( IS-CRATE ?auto_29676 ) ( AVAILABLE ?auto_29686 ) ( SURFACE-AT ?auto_29676 ?auto_29678 ) ( ON ?auto_29676 ?auto_29684 ) ( CLEAR ?auto_29676 ) ( not ( = ?auto_29676 ?auto_29684 ) ) ( not ( = ?auto_29677 ?auto_29684 ) ) ( not ( = ?auto_29682 ?auto_29684 ) ) ( not ( = ?auto_29681 ?auto_29684 ) ) ( IS-CRATE ?auto_29682 ) ( not ( = ?auto_29687 ?auto_29682 ) ) ( not ( = ?auto_29676 ?auto_29687 ) ) ( not ( = ?auto_29677 ?auto_29687 ) ) ( not ( = ?auto_29681 ?auto_29687 ) ) ( not ( = ?auto_29684 ?auto_29687 ) ) ( not ( = ?auto_29689 ?auto_29680 ) ) ( not ( = ?auto_29678 ?auto_29689 ) ) ( HOIST-AT ?auto_29679 ?auto_29689 ) ( not ( = ?auto_29683 ?auto_29679 ) ) ( not ( = ?auto_29686 ?auto_29679 ) ) ( AVAILABLE ?auto_29679 ) ( SURFACE-AT ?auto_29682 ?auto_29689 ) ( ON ?auto_29682 ?auto_29688 ) ( CLEAR ?auto_29682 ) ( not ( = ?auto_29676 ?auto_29688 ) ) ( not ( = ?auto_29677 ?auto_29688 ) ) ( not ( = ?auto_29682 ?auto_29688 ) ) ( not ( = ?auto_29681 ?auto_29688 ) ) ( not ( = ?auto_29684 ?auto_29688 ) ) ( not ( = ?auto_29687 ?auto_29688 ) ) ( TRUCK-AT ?auto_29685 ?auto_29680 ) ( SURFACE-AT ?auto_29690 ?auto_29680 ) ( CLEAR ?auto_29690 ) ( LIFTING ?auto_29683 ?auto_29687 ) ( IS-CRATE ?auto_29687 ) ( not ( = ?auto_29690 ?auto_29687 ) ) ( not ( = ?auto_29676 ?auto_29690 ) ) ( not ( = ?auto_29677 ?auto_29690 ) ) ( not ( = ?auto_29682 ?auto_29690 ) ) ( not ( = ?auto_29681 ?auto_29690 ) ) ( not ( = ?auto_29684 ?auto_29690 ) ) ( not ( = ?auto_29688 ?auto_29690 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29690 ?auto_29687 )
      ( MAKE-2CRATE ?auto_29682 ?auto_29676 ?auto_29677 )
      ( MAKE-1CRATE-VERIFY ?auto_29676 ?auto_29677 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29691 - SURFACE
      ?auto_29692 - SURFACE
      ?auto_29693 - SURFACE
    )
    :vars
    (
      ?auto_29701 - HOIST
      ?auto_29697 - PLACE
      ?auto_29705 - PLACE
      ?auto_29700 - HOIST
      ?auto_29698 - SURFACE
      ?auto_29702 - SURFACE
      ?auto_29699 - SURFACE
      ?auto_29696 - PLACE
      ?auto_29704 - HOIST
      ?auto_29694 - SURFACE
      ?auto_29695 - TRUCK
      ?auto_29703 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29701 ?auto_29697 ) ( IS-CRATE ?auto_29693 ) ( not ( = ?auto_29692 ?auto_29693 ) ) ( not ( = ?auto_29691 ?auto_29692 ) ) ( not ( = ?auto_29691 ?auto_29693 ) ) ( not ( = ?auto_29705 ?auto_29697 ) ) ( HOIST-AT ?auto_29700 ?auto_29705 ) ( not ( = ?auto_29701 ?auto_29700 ) ) ( SURFACE-AT ?auto_29693 ?auto_29705 ) ( ON ?auto_29693 ?auto_29698 ) ( CLEAR ?auto_29693 ) ( not ( = ?auto_29692 ?auto_29698 ) ) ( not ( = ?auto_29693 ?auto_29698 ) ) ( not ( = ?auto_29691 ?auto_29698 ) ) ( IS-CRATE ?auto_29692 ) ( AVAILABLE ?auto_29700 ) ( SURFACE-AT ?auto_29692 ?auto_29705 ) ( ON ?auto_29692 ?auto_29702 ) ( CLEAR ?auto_29692 ) ( not ( = ?auto_29692 ?auto_29702 ) ) ( not ( = ?auto_29693 ?auto_29702 ) ) ( not ( = ?auto_29691 ?auto_29702 ) ) ( not ( = ?auto_29698 ?auto_29702 ) ) ( IS-CRATE ?auto_29691 ) ( not ( = ?auto_29699 ?auto_29691 ) ) ( not ( = ?auto_29692 ?auto_29699 ) ) ( not ( = ?auto_29693 ?auto_29699 ) ) ( not ( = ?auto_29698 ?auto_29699 ) ) ( not ( = ?auto_29702 ?auto_29699 ) ) ( not ( = ?auto_29696 ?auto_29697 ) ) ( not ( = ?auto_29705 ?auto_29696 ) ) ( HOIST-AT ?auto_29704 ?auto_29696 ) ( not ( = ?auto_29701 ?auto_29704 ) ) ( not ( = ?auto_29700 ?auto_29704 ) ) ( AVAILABLE ?auto_29704 ) ( SURFACE-AT ?auto_29691 ?auto_29696 ) ( ON ?auto_29691 ?auto_29694 ) ( CLEAR ?auto_29691 ) ( not ( = ?auto_29692 ?auto_29694 ) ) ( not ( = ?auto_29693 ?auto_29694 ) ) ( not ( = ?auto_29691 ?auto_29694 ) ) ( not ( = ?auto_29698 ?auto_29694 ) ) ( not ( = ?auto_29702 ?auto_29694 ) ) ( not ( = ?auto_29699 ?auto_29694 ) ) ( TRUCK-AT ?auto_29695 ?auto_29697 ) ( SURFACE-AT ?auto_29703 ?auto_29697 ) ( CLEAR ?auto_29703 ) ( LIFTING ?auto_29701 ?auto_29699 ) ( IS-CRATE ?auto_29699 ) ( not ( = ?auto_29703 ?auto_29699 ) ) ( not ( = ?auto_29692 ?auto_29703 ) ) ( not ( = ?auto_29693 ?auto_29703 ) ) ( not ( = ?auto_29691 ?auto_29703 ) ) ( not ( = ?auto_29698 ?auto_29703 ) ) ( not ( = ?auto_29702 ?auto_29703 ) ) ( not ( = ?auto_29694 ?auto_29703 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29692 ?auto_29693 )
      ( MAKE-2CRATE-VERIFY ?auto_29691 ?auto_29692 ?auto_29693 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29706 - SURFACE
      ?auto_29707 - SURFACE
      ?auto_29708 - SURFACE
      ?auto_29709 - SURFACE
    )
    :vars
    (
      ?auto_29714 - HOIST
      ?auto_29717 - PLACE
      ?auto_29711 - PLACE
      ?auto_29719 - HOIST
      ?auto_29710 - SURFACE
      ?auto_29715 - SURFACE
      ?auto_29720 - PLACE
      ?auto_29718 - HOIST
      ?auto_29716 - SURFACE
      ?auto_29713 - TRUCK
      ?auto_29712 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29714 ?auto_29717 ) ( IS-CRATE ?auto_29709 ) ( not ( = ?auto_29708 ?auto_29709 ) ) ( not ( = ?auto_29707 ?auto_29708 ) ) ( not ( = ?auto_29707 ?auto_29709 ) ) ( not ( = ?auto_29711 ?auto_29717 ) ) ( HOIST-AT ?auto_29719 ?auto_29711 ) ( not ( = ?auto_29714 ?auto_29719 ) ) ( SURFACE-AT ?auto_29709 ?auto_29711 ) ( ON ?auto_29709 ?auto_29710 ) ( CLEAR ?auto_29709 ) ( not ( = ?auto_29708 ?auto_29710 ) ) ( not ( = ?auto_29709 ?auto_29710 ) ) ( not ( = ?auto_29707 ?auto_29710 ) ) ( IS-CRATE ?auto_29708 ) ( AVAILABLE ?auto_29719 ) ( SURFACE-AT ?auto_29708 ?auto_29711 ) ( ON ?auto_29708 ?auto_29715 ) ( CLEAR ?auto_29708 ) ( not ( = ?auto_29708 ?auto_29715 ) ) ( not ( = ?auto_29709 ?auto_29715 ) ) ( not ( = ?auto_29707 ?auto_29715 ) ) ( not ( = ?auto_29710 ?auto_29715 ) ) ( IS-CRATE ?auto_29707 ) ( not ( = ?auto_29706 ?auto_29707 ) ) ( not ( = ?auto_29708 ?auto_29706 ) ) ( not ( = ?auto_29709 ?auto_29706 ) ) ( not ( = ?auto_29710 ?auto_29706 ) ) ( not ( = ?auto_29715 ?auto_29706 ) ) ( not ( = ?auto_29720 ?auto_29717 ) ) ( not ( = ?auto_29711 ?auto_29720 ) ) ( HOIST-AT ?auto_29718 ?auto_29720 ) ( not ( = ?auto_29714 ?auto_29718 ) ) ( not ( = ?auto_29719 ?auto_29718 ) ) ( AVAILABLE ?auto_29718 ) ( SURFACE-AT ?auto_29707 ?auto_29720 ) ( ON ?auto_29707 ?auto_29716 ) ( CLEAR ?auto_29707 ) ( not ( = ?auto_29708 ?auto_29716 ) ) ( not ( = ?auto_29709 ?auto_29716 ) ) ( not ( = ?auto_29707 ?auto_29716 ) ) ( not ( = ?auto_29710 ?auto_29716 ) ) ( not ( = ?auto_29715 ?auto_29716 ) ) ( not ( = ?auto_29706 ?auto_29716 ) ) ( TRUCK-AT ?auto_29713 ?auto_29717 ) ( SURFACE-AT ?auto_29712 ?auto_29717 ) ( CLEAR ?auto_29712 ) ( LIFTING ?auto_29714 ?auto_29706 ) ( IS-CRATE ?auto_29706 ) ( not ( = ?auto_29712 ?auto_29706 ) ) ( not ( = ?auto_29708 ?auto_29712 ) ) ( not ( = ?auto_29709 ?auto_29712 ) ) ( not ( = ?auto_29707 ?auto_29712 ) ) ( not ( = ?auto_29710 ?auto_29712 ) ) ( not ( = ?auto_29715 ?auto_29712 ) ) ( not ( = ?auto_29716 ?auto_29712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29707 ?auto_29708 ?auto_29709 )
      ( MAKE-3CRATE-VERIFY ?auto_29706 ?auto_29707 ?auto_29708 ?auto_29709 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29721 - SURFACE
      ?auto_29722 - SURFACE
      ?auto_29723 - SURFACE
      ?auto_29724 - SURFACE
      ?auto_29725 - SURFACE
    )
    :vars
    (
      ?auto_29729 - HOIST
      ?auto_29732 - PLACE
      ?auto_29727 - PLACE
      ?auto_29734 - HOIST
      ?auto_29726 - SURFACE
      ?auto_29730 - SURFACE
      ?auto_29735 - PLACE
      ?auto_29733 - HOIST
      ?auto_29731 - SURFACE
      ?auto_29728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29729 ?auto_29732 ) ( IS-CRATE ?auto_29725 ) ( not ( = ?auto_29724 ?auto_29725 ) ) ( not ( = ?auto_29723 ?auto_29724 ) ) ( not ( = ?auto_29723 ?auto_29725 ) ) ( not ( = ?auto_29727 ?auto_29732 ) ) ( HOIST-AT ?auto_29734 ?auto_29727 ) ( not ( = ?auto_29729 ?auto_29734 ) ) ( SURFACE-AT ?auto_29725 ?auto_29727 ) ( ON ?auto_29725 ?auto_29726 ) ( CLEAR ?auto_29725 ) ( not ( = ?auto_29724 ?auto_29726 ) ) ( not ( = ?auto_29725 ?auto_29726 ) ) ( not ( = ?auto_29723 ?auto_29726 ) ) ( IS-CRATE ?auto_29724 ) ( AVAILABLE ?auto_29734 ) ( SURFACE-AT ?auto_29724 ?auto_29727 ) ( ON ?auto_29724 ?auto_29730 ) ( CLEAR ?auto_29724 ) ( not ( = ?auto_29724 ?auto_29730 ) ) ( not ( = ?auto_29725 ?auto_29730 ) ) ( not ( = ?auto_29723 ?auto_29730 ) ) ( not ( = ?auto_29726 ?auto_29730 ) ) ( IS-CRATE ?auto_29723 ) ( not ( = ?auto_29722 ?auto_29723 ) ) ( not ( = ?auto_29724 ?auto_29722 ) ) ( not ( = ?auto_29725 ?auto_29722 ) ) ( not ( = ?auto_29726 ?auto_29722 ) ) ( not ( = ?auto_29730 ?auto_29722 ) ) ( not ( = ?auto_29735 ?auto_29732 ) ) ( not ( = ?auto_29727 ?auto_29735 ) ) ( HOIST-AT ?auto_29733 ?auto_29735 ) ( not ( = ?auto_29729 ?auto_29733 ) ) ( not ( = ?auto_29734 ?auto_29733 ) ) ( AVAILABLE ?auto_29733 ) ( SURFACE-AT ?auto_29723 ?auto_29735 ) ( ON ?auto_29723 ?auto_29731 ) ( CLEAR ?auto_29723 ) ( not ( = ?auto_29724 ?auto_29731 ) ) ( not ( = ?auto_29725 ?auto_29731 ) ) ( not ( = ?auto_29723 ?auto_29731 ) ) ( not ( = ?auto_29726 ?auto_29731 ) ) ( not ( = ?auto_29730 ?auto_29731 ) ) ( not ( = ?auto_29722 ?auto_29731 ) ) ( TRUCK-AT ?auto_29728 ?auto_29732 ) ( SURFACE-AT ?auto_29721 ?auto_29732 ) ( CLEAR ?auto_29721 ) ( LIFTING ?auto_29729 ?auto_29722 ) ( IS-CRATE ?auto_29722 ) ( not ( = ?auto_29721 ?auto_29722 ) ) ( not ( = ?auto_29724 ?auto_29721 ) ) ( not ( = ?auto_29725 ?auto_29721 ) ) ( not ( = ?auto_29723 ?auto_29721 ) ) ( not ( = ?auto_29726 ?auto_29721 ) ) ( not ( = ?auto_29730 ?auto_29721 ) ) ( not ( = ?auto_29731 ?auto_29721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29723 ?auto_29724 ?auto_29725 )
      ( MAKE-4CRATE-VERIFY ?auto_29721 ?auto_29722 ?auto_29723 ?auto_29724 ?auto_29725 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29736 - SURFACE
      ?auto_29737 - SURFACE
    )
    :vars
    (
      ?auto_29743 - HOIST
      ?auto_29746 - PLACE
      ?auto_29750 - SURFACE
      ?auto_29739 - PLACE
      ?auto_29748 - HOIST
      ?auto_29738 - SURFACE
      ?auto_29744 - SURFACE
      ?auto_29742 - SURFACE
      ?auto_29749 - PLACE
      ?auto_29747 - HOIST
      ?auto_29745 - SURFACE
      ?auto_29741 - TRUCK
      ?auto_29740 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29743 ?auto_29746 ) ( IS-CRATE ?auto_29737 ) ( not ( = ?auto_29736 ?auto_29737 ) ) ( not ( = ?auto_29750 ?auto_29736 ) ) ( not ( = ?auto_29750 ?auto_29737 ) ) ( not ( = ?auto_29739 ?auto_29746 ) ) ( HOIST-AT ?auto_29748 ?auto_29739 ) ( not ( = ?auto_29743 ?auto_29748 ) ) ( SURFACE-AT ?auto_29737 ?auto_29739 ) ( ON ?auto_29737 ?auto_29738 ) ( CLEAR ?auto_29737 ) ( not ( = ?auto_29736 ?auto_29738 ) ) ( not ( = ?auto_29737 ?auto_29738 ) ) ( not ( = ?auto_29750 ?auto_29738 ) ) ( IS-CRATE ?auto_29736 ) ( AVAILABLE ?auto_29748 ) ( SURFACE-AT ?auto_29736 ?auto_29739 ) ( ON ?auto_29736 ?auto_29744 ) ( CLEAR ?auto_29736 ) ( not ( = ?auto_29736 ?auto_29744 ) ) ( not ( = ?auto_29737 ?auto_29744 ) ) ( not ( = ?auto_29750 ?auto_29744 ) ) ( not ( = ?auto_29738 ?auto_29744 ) ) ( IS-CRATE ?auto_29750 ) ( not ( = ?auto_29742 ?auto_29750 ) ) ( not ( = ?auto_29736 ?auto_29742 ) ) ( not ( = ?auto_29737 ?auto_29742 ) ) ( not ( = ?auto_29738 ?auto_29742 ) ) ( not ( = ?auto_29744 ?auto_29742 ) ) ( not ( = ?auto_29749 ?auto_29746 ) ) ( not ( = ?auto_29739 ?auto_29749 ) ) ( HOIST-AT ?auto_29747 ?auto_29749 ) ( not ( = ?auto_29743 ?auto_29747 ) ) ( not ( = ?auto_29748 ?auto_29747 ) ) ( AVAILABLE ?auto_29747 ) ( SURFACE-AT ?auto_29750 ?auto_29749 ) ( ON ?auto_29750 ?auto_29745 ) ( CLEAR ?auto_29750 ) ( not ( = ?auto_29736 ?auto_29745 ) ) ( not ( = ?auto_29737 ?auto_29745 ) ) ( not ( = ?auto_29750 ?auto_29745 ) ) ( not ( = ?auto_29738 ?auto_29745 ) ) ( not ( = ?auto_29744 ?auto_29745 ) ) ( not ( = ?auto_29742 ?auto_29745 ) ) ( TRUCK-AT ?auto_29741 ?auto_29746 ) ( SURFACE-AT ?auto_29740 ?auto_29746 ) ( CLEAR ?auto_29740 ) ( IS-CRATE ?auto_29742 ) ( not ( = ?auto_29740 ?auto_29742 ) ) ( not ( = ?auto_29736 ?auto_29740 ) ) ( not ( = ?auto_29737 ?auto_29740 ) ) ( not ( = ?auto_29750 ?auto_29740 ) ) ( not ( = ?auto_29738 ?auto_29740 ) ) ( not ( = ?auto_29744 ?auto_29740 ) ) ( not ( = ?auto_29745 ?auto_29740 ) ) ( AVAILABLE ?auto_29743 ) ( IN ?auto_29742 ?auto_29741 ) )
    :subtasks
    ( ( !UNLOAD ?auto_29743 ?auto_29742 ?auto_29741 ?auto_29746 )
      ( MAKE-2CRATE ?auto_29750 ?auto_29736 ?auto_29737 )
      ( MAKE-1CRATE-VERIFY ?auto_29736 ?auto_29737 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29751 - SURFACE
      ?auto_29752 - SURFACE
      ?auto_29753 - SURFACE
    )
    :vars
    (
      ?auto_29762 - HOIST
      ?auto_29756 - PLACE
      ?auto_29764 - PLACE
      ?auto_29761 - HOIST
      ?auto_29758 - SURFACE
      ?auto_29765 - SURFACE
      ?auto_29759 - SURFACE
      ?auto_29755 - PLACE
      ?auto_29757 - HOIST
      ?auto_29754 - SURFACE
      ?auto_29763 - TRUCK
      ?auto_29760 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29762 ?auto_29756 ) ( IS-CRATE ?auto_29753 ) ( not ( = ?auto_29752 ?auto_29753 ) ) ( not ( = ?auto_29751 ?auto_29752 ) ) ( not ( = ?auto_29751 ?auto_29753 ) ) ( not ( = ?auto_29764 ?auto_29756 ) ) ( HOIST-AT ?auto_29761 ?auto_29764 ) ( not ( = ?auto_29762 ?auto_29761 ) ) ( SURFACE-AT ?auto_29753 ?auto_29764 ) ( ON ?auto_29753 ?auto_29758 ) ( CLEAR ?auto_29753 ) ( not ( = ?auto_29752 ?auto_29758 ) ) ( not ( = ?auto_29753 ?auto_29758 ) ) ( not ( = ?auto_29751 ?auto_29758 ) ) ( IS-CRATE ?auto_29752 ) ( AVAILABLE ?auto_29761 ) ( SURFACE-AT ?auto_29752 ?auto_29764 ) ( ON ?auto_29752 ?auto_29765 ) ( CLEAR ?auto_29752 ) ( not ( = ?auto_29752 ?auto_29765 ) ) ( not ( = ?auto_29753 ?auto_29765 ) ) ( not ( = ?auto_29751 ?auto_29765 ) ) ( not ( = ?auto_29758 ?auto_29765 ) ) ( IS-CRATE ?auto_29751 ) ( not ( = ?auto_29759 ?auto_29751 ) ) ( not ( = ?auto_29752 ?auto_29759 ) ) ( not ( = ?auto_29753 ?auto_29759 ) ) ( not ( = ?auto_29758 ?auto_29759 ) ) ( not ( = ?auto_29765 ?auto_29759 ) ) ( not ( = ?auto_29755 ?auto_29756 ) ) ( not ( = ?auto_29764 ?auto_29755 ) ) ( HOIST-AT ?auto_29757 ?auto_29755 ) ( not ( = ?auto_29762 ?auto_29757 ) ) ( not ( = ?auto_29761 ?auto_29757 ) ) ( AVAILABLE ?auto_29757 ) ( SURFACE-AT ?auto_29751 ?auto_29755 ) ( ON ?auto_29751 ?auto_29754 ) ( CLEAR ?auto_29751 ) ( not ( = ?auto_29752 ?auto_29754 ) ) ( not ( = ?auto_29753 ?auto_29754 ) ) ( not ( = ?auto_29751 ?auto_29754 ) ) ( not ( = ?auto_29758 ?auto_29754 ) ) ( not ( = ?auto_29765 ?auto_29754 ) ) ( not ( = ?auto_29759 ?auto_29754 ) ) ( TRUCK-AT ?auto_29763 ?auto_29756 ) ( SURFACE-AT ?auto_29760 ?auto_29756 ) ( CLEAR ?auto_29760 ) ( IS-CRATE ?auto_29759 ) ( not ( = ?auto_29760 ?auto_29759 ) ) ( not ( = ?auto_29752 ?auto_29760 ) ) ( not ( = ?auto_29753 ?auto_29760 ) ) ( not ( = ?auto_29751 ?auto_29760 ) ) ( not ( = ?auto_29758 ?auto_29760 ) ) ( not ( = ?auto_29765 ?auto_29760 ) ) ( not ( = ?auto_29754 ?auto_29760 ) ) ( AVAILABLE ?auto_29762 ) ( IN ?auto_29759 ?auto_29763 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29752 ?auto_29753 )
      ( MAKE-2CRATE-VERIFY ?auto_29751 ?auto_29752 ?auto_29753 ) )
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
      ?auto_29773 - HOIST
      ?auto_29776 - PLACE
      ?auto_29772 - PLACE
      ?auto_29775 - HOIST
      ?auto_29771 - SURFACE
      ?auto_29770 - SURFACE
      ?auto_29778 - PLACE
      ?auto_29777 - HOIST
      ?auto_29779 - SURFACE
      ?auto_29774 - TRUCK
      ?auto_29780 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29773 ?auto_29776 ) ( IS-CRATE ?auto_29769 ) ( not ( = ?auto_29768 ?auto_29769 ) ) ( not ( = ?auto_29767 ?auto_29768 ) ) ( not ( = ?auto_29767 ?auto_29769 ) ) ( not ( = ?auto_29772 ?auto_29776 ) ) ( HOIST-AT ?auto_29775 ?auto_29772 ) ( not ( = ?auto_29773 ?auto_29775 ) ) ( SURFACE-AT ?auto_29769 ?auto_29772 ) ( ON ?auto_29769 ?auto_29771 ) ( CLEAR ?auto_29769 ) ( not ( = ?auto_29768 ?auto_29771 ) ) ( not ( = ?auto_29769 ?auto_29771 ) ) ( not ( = ?auto_29767 ?auto_29771 ) ) ( IS-CRATE ?auto_29768 ) ( AVAILABLE ?auto_29775 ) ( SURFACE-AT ?auto_29768 ?auto_29772 ) ( ON ?auto_29768 ?auto_29770 ) ( CLEAR ?auto_29768 ) ( not ( = ?auto_29768 ?auto_29770 ) ) ( not ( = ?auto_29769 ?auto_29770 ) ) ( not ( = ?auto_29767 ?auto_29770 ) ) ( not ( = ?auto_29771 ?auto_29770 ) ) ( IS-CRATE ?auto_29767 ) ( not ( = ?auto_29766 ?auto_29767 ) ) ( not ( = ?auto_29768 ?auto_29766 ) ) ( not ( = ?auto_29769 ?auto_29766 ) ) ( not ( = ?auto_29771 ?auto_29766 ) ) ( not ( = ?auto_29770 ?auto_29766 ) ) ( not ( = ?auto_29778 ?auto_29776 ) ) ( not ( = ?auto_29772 ?auto_29778 ) ) ( HOIST-AT ?auto_29777 ?auto_29778 ) ( not ( = ?auto_29773 ?auto_29777 ) ) ( not ( = ?auto_29775 ?auto_29777 ) ) ( AVAILABLE ?auto_29777 ) ( SURFACE-AT ?auto_29767 ?auto_29778 ) ( ON ?auto_29767 ?auto_29779 ) ( CLEAR ?auto_29767 ) ( not ( = ?auto_29768 ?auto_29779 ) ) ( not ( = ?auto_29769 ?auto_29779 ) ) ( not ( = ?auto_29767 ?auto_29779 ) ) ( not ( = ?auto_29771 ?auto_29779 ) ) ( not ( = ?auto_29770 ?auto_29779 ) ) ( not ( = ?auto_29766 ?auto_29779 ) ) ( TRUCK-AT ?auto_29774 ?auto_29776 ) ( SURFACE-AT ?auto_29780 ?auto_29776 ) ( CLEAR ?auto_29780 ) ( IS-CRATE ?auto_29766 ) ( not ( = ?auto_29780 ?auto_29766 ) ) ( not ( = ?auto_29768 ?auto_29780 ) ) ( not ( = ?auto_29769 ?auto_29780 ) ) ( not ( = ?auto_29767 ?auto_29780 ) ) ( not ( = ?auto_29771 ?auto_29780 ) ) ( not ( = ?auto_29770 ?auto_29780 ) ) ( not ( = ?auto_29779 ?auto_29780 ) ) ( AVAILABLE ?auto_29773 ) ( IN ?auto_29766 ?auto_29774 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29767 ?auto_29768 ?auto_29769 )
      ( MAKE-3CRATE-VERIFY ?auto_29766 ?auto_29767 ?auto_29768 ?auto_29769 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29781 - SURFACE
      ?auto_29782 - SURFACE
      ?auto_29783 - SURFACE
      ?auto_29784 - SURFACE
      ?auto_29785 - SURFACE
    )
    :vars
    (
      ?auto_29789 - HOIST
      ?auto_29792 - PLACE
      ?auto_29788 - PLACE
      ?auto_29791 - HOIST
      ?auto_29787 - SURFACE
      ?auto_29786 - SURFACE
      ?auto_29794 - PLACE
      ?auto_29793 - HOIST
      ?auto_29795 - SURFACE
      ?auto_29790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29789 ?auto_29792 ) ( IS-CRATE ?auto_29785 ) ( not ( = ?auto_29784 ?auto_29785 ) ) ( not ( = ?auto_29783 ?auto_29784 ) ) ( not ( = ?auto_29783 ?auto_29785 ) ) ( not ( = ?auto_29788 ?auto_29792 ) ) ( HOIST-AT ?auto_29791 ?auto_29788 ) ( not ( = ?auto_29789 ?auto_29791 ) ) ( SURFACE-AT ?auto_29785 ?auto_29788 ) ( ON ?auto_29785 ?auto_29787 ) ( CLEAR ?auto_29785 ) ( not ( = ?auto_29784 ?auto_29787 ) ) ( not ( = ?auto_29785 ?auto_29787 ) ) ( not ( = ?auto_29783 ?auto_29787 ) ) ( IS-CRATE ?auto_29784 ) ( AVAILABLE ?auto_29791 ) ( SURFACE-AT ?auto_29784 ?auto_29788 ) ( ON ?auto_29784 ?auto_29786 ) ( CLEAR ?auto_29784 ) ( not ( = ?auto_29784 ?auto_29786 ) ) ( not ( = ?auto_29785 ?auto_29786 ) ) ( not ( = ?auto_29783 ?auto_29786 ) ) ( not ( = ?auto_29787 ?auto_29786 ) ) ( IS-CRATE ?auto_29783 ) ( not ( = ?auto_29782 ?auto_29783 ) ) ( not ( = ?auto_29784 ?auto_29782 ) ) ( not ( = ?auto_29785 ?auto_29782 ) ) ( not ( = ?auto_29787 ?auto_29782 ) ) ( not ( = ?auto_29786 ?auto_29782 ) ) ( not ( = ?auto_29794 ?auto_29792 ) ) ( not ( = ?auto_29788 ?auto_29794 ) ) ( HOIST-AT ?auto_29793 ?auto_29794 ) ( not ( = ?auto_29789 ?auto_29793 ) ) ( not ( = ?auto_29791 ?auto_29793 ) ) ( AVAILABLE ?auto_29793 ) ( SURFACE-AT ?auto_29783 ?auto_29794 ) ( ON ?auto_29783 ?auto_29795 ) ( CLEAR ?auto_29783 ) ( not ( = ?auto_29784 ?auto_29795 ) ) ( not ( = ?auto_29785 ?auto_29795 ) ) ( not ( = ?auto_29783 ?auto_29795 ) ) ( not ( = ?auto_29787 ?auto_29795 ) ) ( not ( = ?auto_29786 ?auto_29795 ) ) ( not ( = ?auto_29782 ?auto_29795 ) ) ( TRUCK-AT ?auto_29790 ?auto_29792 ) ( SURFACE-AT ?auto_29781 ?auto_29792 ) ( CLEAR ?auto_29781 ) ( IS-CRATE ?auto_29782 ) ( not ( = ?auto_29781 ?auto_29782 ) ) ( not ( = ?auto_29784 ?auto_29781 ) ) ( not ( = ?auto_29785 ?auto_29781 ) ) ( not ( = ?auto_29783 ?auto_29781 ) ) ( not ( = ?auto_29787 ?auto_29781 ) ) ( not ( = ?auto_29786 ?auto_29781 ) ) ( not ( = ?auto_29795 ?auto_29781 ) ) ( AVAILABLE ?auto_29789 ) ( IN ?auto_29782 ?auto_29790 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29783 ?auto_29784 ?auto_29785 )
      ( MAKE-4CRATE-VERIFY ?auto_29781 ?auto_29782 ?auto_29783 ?auto_29784 ?auto_29785 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29796 - SURFACE
      ?auto_29797 - SURFACE
    )
    :vars
    (
      ?auto_29801 - HOIST
      ?auto_29806 - PLACE
      ?auto_29804 - SURFACE
      ?auto_29800 - PLACE
      ?auto_29805 - HOIST
      ?auto_29799 - SURFACE
      ?auto_29798 - SURFACE
      ?auto_29803 - SURFACE
      ?auto_29808 - PLACE
      ?auto_29807 - HOIST
      ?auto_29809 - SURFACE
      ?auto_29810 - SURFACE
      ?auto_29802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29801 ?auto_29806 ) ( IS-CRATE ?auto_29797 ) ( not ( = ?auto_29796 ?auto_29797 ) ) ( not ( = ?auto_29804 ?auto_29796 ) ) ( not ( = ?auto_29804 ?auto_29797 ) ) ( not ( = ?auto_29800 ?auto_29806 ) ) ( HOIST-AT ?auto_29805 ?auto_29800 ) ( not ( = ?auto_29801 ?auto_29805 ) ) ( SURFACE-AT ?auto_29797 ?auto_29800 ) ( ON ?auto_29797 ?auto_29799 ) ( CLEAR ?auto_29797 ) ( not ( = ?auto_29796 ?auto_29799 ) ) ( not ( = ?auto_29797 ?auto_29799 ) ) ( not ( = ?auto_29804 ?auto_29799 ) ) ( IS-CRATE ?auto_29796 ) ( AVAILABLE ?auto_29805 ) ( SURFACE-AT ?auto_29796 ?auto_29800 ) ( ON ?auto_29796 ?auto_29798 ) ( CLEAR ?auto_29796 ) ( not ( = ?auto_29796 ?auto_29798 ) ) ( not ( = ?auto_29797 ?auto_29798 ) ) ( not ( = ?auto_29804 ?auto_29798 ) ) ( not ( = ?auto_29799 ?auto_29798 ) ) ( IS-CRATE ?auto_29804 ) ( not ( = ?auto_29803 ?auto_29804 ) ) ( not ( = ?auto_29796 ?auto_29803 ) ) ( not ( = ?auto_29797 ?auto_29803 ) ) ( not ( = ?auto_29799 ?auto_29803 ) ) ( not ( = ?auto_29798 ?auto_29803 ) ) ( not ( = ?auto_29808 ?auto_29806 ) ) ( not ( = ?auto_29800 ?auto_29808 ) ) ( HOIST-AT ?auto_29807 ?auto_29808 ) ( not ( = ?auto_29801 ?auto_29807 ) ) ( not ( = ?auto_29805 ?auto_29807 ) ) ( AVAILABLE ?auto_29807 ) ( SURFACE-AT ?auto_29804 ?auto_29808 ) ( ON ?auto_29804 ?auto_29809 ) ( CLEAR ?auto_29804 ) ( not ( = ?auto_29796 ?auto_29809 ) ) ( not ( = ?auto_29797 ?auto_29809 ) ) ( not ( = ?auto_29804 ?auto_29809 ) ) ( not ( = ?auto_29799 ?auto_29809 ) ) ( not ( = ?auto_29798 ?auto_29809 ) ) ( not ( = ?auto_29803 ?auto_29809 ) ) ( SURFACE-AT ?auto_29810 ?auto_29806 ) ( CLEAR ?auto_29810 ) ( IS-CRATE ?auto_29803 ) ( not ( = ?auto_29810 ?auto_29803 ) ) ( not ( = ?auto_29796 ?auto_29810 ) ) ( not ( = ?auto_29797 ?auto_29810 ) ) ( not ( = ?auto_29804 ?auto_29810 ) ) ( not ( = ?auto_29799 ?auto_29810 ) ) ( not ( = ?auto_29798 ?auto_29810 ) ) ( not ( = ?auto_29809 ?auto_29810 ) ) ( AVAILABLE ?auto_29801 ) ( IN ?auto_29803 ?auto_29802 ) ( TRUCK-AT ?auto_29802 ?auto_29800 ) )
    :subtasks
    ( ( !DRIVE ?auto_29802 ?auto_29800 ?auto_29806 )
      ( MAKE-2CRATE ?auto_29804 ?auto_29796 ?auto_29797 )
      ( MAKE-1CRATE-VERIFY ?auto_29796 ?auto_29797 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29811 - SURFACE
      ?auto_29812 - SURFACE
      ?auto_29813 - SURFACE
    )
    :vars
    (
      ?auto_29825 - HOIST
      ?auto_29820 - PLACE
      ?auto_29819 - PLACE
      ?auto_29824 - HOIST
      ?auto_29815 - SURFACE
      ?auto_29818 - SURFACE
      ?auto_29822 - SURFACE
      ?auto_29823 - PLACE
      ?auto_29821 - HOIST
      ?auto_29817 - SURFACE
      ?auto_29814 - SURFACE
      ?auto_29816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29825 ?auto_29820 ) ( IS-CRATE ?auto_29813 ) ( not ( = ?auto_29812 ?auto_29813 ) ) ( not ( = ?auto_29811 ?auto_29812 ) ) ( not ( = ?auto_29811 ?auto_29813 ) ) ( not ( = ?auto_29819 ?auto_29820 ) ) ( HOIST-AT ?auto_29824 ?auto_29819 ) ( not ( = ?auto_29825 ?auto_29824 ) ) ( SURFACE-AT ?auto_29813 ?auto_29819 ) ( ON ?auto_29813 ?auto_29815 ) ( CLEAR ?auto_29813 ) ( not ( = ?auto_29812 ?auto_29815 ) ) ( not ( = ?auto_29813 ?auto_29815 ) ) ( not ( = ?auto_29811 ?auto_29815 ) ) ( IS-CRATE ?auto_29812 ) ( AVAILABLE ?auto_29824 ) ( SURFACE-AT ?auto_29812 ?auto_29819 ) ( ON ?auto_29812 ?auto_29818 ) ( CLEAR ?auto_29812 ) ( not ( = ?auto_29812 ?auto_29818 ) ) ( not ( = ?auto_29813 ?auto_29818 ) ) ( not ( = ?auto_29811 ?auto_29818 ) ) ( not ( = ?auto_29815 ?auto_29818 ) ) ( IS-CRATE ?auto_29811 ) ( not ( = ?auto_29822 ?auto_29811 ) ) ( not ( = ?auto_29812 ?auto_29822 ) ) ( not ( = ?auto_29813 ?auto_29822 ) ) ( not ( = ?auto_29815 ?auto_29822 ) ) ( not ( = ?auto_29818 ?auto_29822 ) ) ( not ( = ?auto_29823 ?auto_29820 ) ) ( not ( = ?auto_29819 ?auto_29823 ) ) ( HOIST-AT ?auto_29821 ?auto_29823 ) ( not ( = ?auto_29825 ?auto_29821 ) ) ( not ( = ?auto_29824 ?auto_29821 ) ) ( AVAILABLE ?auto_29821 ) ( SURFACE-AT ?auto_29811 ?auto_29823 ) ( ON ?auto_29811 ?auto_29817 ) ( CLEAR ?auto_29811 ) ( not ( = ?auto_29812 ?auto_29817 ) ) ( not ( = ?auto_29813 ?auto_29817 ) ) ( not ( = ?auto_29811 ?auto_29817 ) ) ( not ( = ?auto_29815 ?auto_29817 ) ) ( not ( = ?auto_29818 ?auto_29817 ) ) ( not ( = ?auto_29822 ?auto_29817 ) ) ( SURFACE-AT ?auto_29814 ?auto_29820 ) ( CLEAR ?auto_29814 ) ( IS-CRATE ?auto_29822 ) ( not ( = ?auto_29814 ?auto_29822 ) ) ( not ( = ?auto_29812 ?auto_29814 ) ) ( not ( = ?auto_29813 ?auto_29814 ) ) ( not ( = ?auto_29811 ?auto_29814 ) ) ( not ( = ?auto_29815 ?auto_29814 ) ) ( not ( = ?auto_29818 ?auto_29814 ) ) ( not ( = ?auto_29817 ?auto_29814 ) ) ( AVAILABLE ?auto_29825 ) ( IN ?auto_29822 ?auto_29816 ) ( TRUCK-AT ?auto_29816 ?auto_29819 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29812 ?auto_29813 )
      ( MAKE-2CRATE-VERIFY ?auto_29811 ?auto_29812 ?auto_29813 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29826 - SURFACE
      ?auto_29827 - SURFACE
      ?auto_29828 - SURFACE
      ?auto_29829 - SURFACE
    )
    :vars
    (
      ?auto_29832 - HOIST
      ?auto_29835 - PLACE
      ?auto_29837 - PLACE
      ?auto_29833 - HOIST
      ?auto_29831 - SURFACE
      ?auto_29839 - SURFACE
      ?auto_29830 - PLACE
      ?auto_29836 - HOIST
      ?auto_29840 - SURFACE
      ?auto_29838 - SURFACE
      ?auto_29834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29832 ?auto_29835 ) ( IS-CRATE ?auto_29829 ) ( not ( = ?auto_29828 ?auto_29829 ) ) ( not ( = ?auto_29827 ?auto_29828 ) ) ( not ( = ?auto_29827 ?auto_29829 ) ) ( not ( = ?auto_29837 ?auto_29835 ) ) ( HOIST-AT ?auto_29833 ?auto_29837 ) ( not ( = ?auto_29832 ?auto_29833 ) ) ( SURFACE-AT ?auto_29829 ?auto_29837 ) ( ON ?auto_29829 ?auto_29831 ) ( CLEAR ?auto_29829 ) ( not ( = ?auto_29828 ?auto_29831 ) ) ( not ( = ?auto_29829 ?auto_29831 ) ) ( not ( = ?auto_29827 ?auto_29831 ) ) ( IS-CRATE ?auto_29828 ) ( AVAILABLE ?auto_29833 ) ( SURFACE-AT ?auto_29828 ?auto_29837 ) ( ON ?auto_29828 ?auto_29839 ) ( CLEAR ?auto_29828 ) ( not ( = ?auto_29828 ?auto_29839 ) ) ( not ( = ?auto_29829 ?auto_29839 ) ) ( not ( = ?auto_29827 ?auto_29839 ) ) ( not ( = ?auto_29831 ?auto_29839 ) ) ( IS-CRATE ?auto_29827 ) ( not ( = ?auto_29826 ?auto_29827 ) ) ( not ( = ?auto_29828 ?auto_29826 ) ) ( not ( = ?auto_29829 ?auto_29826 ) ) ( not ( = ?auto_29831 ?auto_29826 ) ) ( not ( = ?auto_29839 ?auto_29826 ) ) ( not ( = ?auto_29830 ?auto_29835 ) ) ( not ( = ?auto_29837 ?auto_29830 ) ) ( HOIST-AT ?auto_29836 ?auto_29830 ) ( not ( = ?auto_29832 ?auto_29836 ) ) ( not ( = ?auto_29833 ?auto_29836 ) ) ( AVAILABLE ?auto_29836 ) ( SURFACE-AT ?auto_29827 ?auto_29830 ) ( ON ?auto_29827 ?auto_29840 ) ( CLEAR ?auto_29827 ) ( not ( = ?auto_29828 ?auto_29840 ) ) ( not ( = ?auto_29829 ?auto_29840 ) ) ( not ( = ?auto_29827 ?auto_29840 ) ) ( not ( = ?auto_29831 ?auto_29840 ) ) ( not ( = ?auto_29839 ?auto_29840 ) ) ( not ( = ?auto_29826 ?auto_29840 ) ) ( SURFACE-AT ?auto_29838 ?auto_29835 ) ( CLEAR ?auto_29838 ) ( IS-CRATE ?auto_29826 ) ( not ( = ?auto_29838 ?auto_29826 ) ) ( not ( = ?auto_29828 ?auto_29838 ) ) ( not ( = ?auto_29829 ?auto_29838 ) ) ( not ( = ?auto_29827 ?auto_29838 ) ) ( not ( = ?auto_29831 ?auto_29838 ) ) ( not ( = ?auto_29839 ?auto_29838 ) ) ( not ( = ?auto_29840 ?auto_29838 ) ) ( AVAILABLE ?auto_29832 ) ( IN ?auto_29826 ?auto_29834 ) ( TRUCK-AT ?auto_29834 ?auto_29837 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29827 ?auto_29828 ?auto_29829 )
      ( MAKE-3CRATE-VERIFY ?auto_29826 ?auto_29827 ?auto_29828 ?auto_29829 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29841 - SURFACE
      ?auto_29842 - SURFACE
      ?auto_29843 - SURFACE
      ?auto_29844 - SURFACE
      ?auto_29845 - SURFACE
    )
    :vars
    (
      ?auto_29848 - HOIST
      ?auto_29851 - PLACE
      ?auto_29853 - PLACE
      ?auto_29849 - HOIST
      ?auto_29847 - SURFACE
      ?auto_29854 - SURFACE
      ?auto_29846 - PLACE
      ?auto_29852 - HOIST
      ?auto_29855 - SURFACE
      ?auto_29850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29848 ?auto_29851 ) ( IS-CRATE ?auto_29845 ) ( not ( = ?auto_29844 ?auto_29845 ) ) ( not ( = ?auto_29843 ?auto_29844 ) ) ( not ( = ?auto_29843 ?auto_29845 ) ) ( not ( = ?auto_29853 ?auto_29851 ) ) ( HOIST-AT ?auto_29849 ?auto_29853 ) ( not ( = ?auto_29848 ?auto_29849 ) ) ( SURFACE-AT ?auto_29845 ?auto_29853 ) ( ON ?auto_29845 ?auto_29847 ) ( CLEAR ?auto_29845 ) ( not ( = ?auto_29844 ?auto_29847 ) ) ( not ( = ?auto_29845 ?auto_29847 ) ) ( not ( = ?auto_29843 ?auto_29847 ) ) ( IS-CRATE ?auto_29844 ) ( AVAILABLE ?auto_29849 ) ( SURFACE-AT ?auto_29844 ?auto_29853 ) ( ON ?auto_29844 ?auto_29854 ) ( CLEAR ?auto_29844 ) ( not ( = ?auto_29844 ?auto_29854 ) ) ( not ( = ?auto_29845 ?auto_29854 ) ) ( not ( = ?auto_29843 ?auto_29854 ) ) ( not ( = ?auto_29847 ?auto_29854 ) ) ( IS-CRATE ?auto_29843 ) ( not ( = ?auto_29842 ?auto_29843 ) ) ( not ( = ?auto_29844 ?auto_29842 ) ) ( not ( = ?auto_29845 ?auto_29842 ) ) ( not ( = ?auto_29847 ?auto_29842 ) ) ( not ( = ?auto_29854 ?auto_29842 ) ) ( not ( = ?auto_29846 ?auto_29851 ) ) ( not ( = ?auto_29853 ?auto_29846 ) ) ( HOIST-AT ?auto_29852 ?auto_29846 ) ( not ( = ?auto_29848 ?auto_29852 ) ) ( not ( = ?auto_29849 ?auto_29852 ) ) ( AVAILABLE ?auto_29852 ) ( SURFACE-AT ?auto_29843 ?auto_29846 ) ( ON ?auto_29843 ?auto_29855 ) ( CLEAR ?auto_29843 ) ( not ( = ?auto_29844 ?auto_29855 ) ) ( not ( = ?auto_29845 ?auto_29855 ) ) ( not ( = ?auto_29843 ?auto_29855 ) ) ( not ( = ?auto_29847 ?auto_29855 ) ) ( not ( = ?auto_29854 ?auto_29855 ) ) ( not ( = ?auto_29842 ?auto_29855 ) ) ( SURFACE-AT ?auto_29841 ?auto_29851 ) ( CLEAR ?auto_29841 ) ( IS-CRATE ?auto_29842 ) ( not ( = ?auto_29841 ?auto_29842 ) ) ( not ( = ?auto_29844 ?auto_29841 ) ) ( not ( = ?auto_29845 ?auto_29841 ) ) ( not ( = ?auto_29843 ?auto_29841 ) ) ( not ( = ?auto_29847 ?auto_29841 ) ) ( not ( = ?auto_29854 ?auto_29841 ) ) ( not ( = ?auto_29855 ?auto_29841 ) ) ( AVAILABLE ?auto_29848 ) ( IN ?auto_29842 ?auto_29850 ) ( TRUCK-AT ?auto_29850 ?auto_29853 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29843 ?auto_29844 ?auto_29845 )
      ( MAKE-4CRATE-VERIFY ?auto_29841 ?auto_29842 ?auto_29843 ?auto_29844 ?auto_29845 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29856 - SURFACE
      ?auto_29857 - SURFACE
    )
    :vars
    (
      ?auto_29860 - HOIST
      ?auto_29863 - PLACE
      ?auto_29868 - SURFACE
      ?auto_29865 - PLACE
      ?auto_29861 - HOIST
      ?auto_29859 - SURFACE
      ?auto_29869 - SURFACE
      ?auto_29866 - SURFACE
      ?auto_29858 - PLACE
      ?auto_29864 - HOIST
      ?auto_29870 - SURFACE
      ?auto_29867 - SURFACE
      ?auto_29862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29860 ?auto_29863 ) ( IS-CRATE ?auto_29857 ) ( not ( = ?auto_29856 ?auto_29857 ) ) ( not ( = ?auto_29868 ?auto_29856 ) ) ( not ( = ?auto_29868 ?auto_29857 ) ) ( not ( = ?auto_29865 ?auto_29863 ) ) ( HOIST-AT ?auto_29861 ?auto_29865 ) ( not ( = ?auto_29860 ?auto_29861 ) ) ( SURFACE-AT ?auto_29857 ?auto_29865 ) ( ON ?auto_29857 ?auto_29859 ) ( CLEAR ?auto_29857 ) ( not ( = ?auto_29856 ?auto_29859 ) ) ( not ( = ?auto_29857 ?auto_29859 ) ) ( not ( = ?auto_29868 ?auto_29859 ) ) ( IS-CRATE ?auto_29856 ) ( SURFACE-AT ?auto_29856 ?auto_29865 ) ( ON ?auto_29856 ?auto_29869 ) ( CLEAR ?auto_29856 ) ( not ( = ?auto_29856 ?auto_29869 ) ) ( not ( = ?auto_29857 ?auto_29869 ) ) ( not ( = ?auto_29868 ?auto_29869 ) ) ( not ( = ?auto_29859 ?auto_29869 ) ) ( IS-CRATE ?auto_29868 ) ( not ( = ?auto_29866 ?auto_29868 ) ) ( not ( = ?auto_29856 ?auto_29866 ) ) ( not ( = ?auto_29857 ?auto_29866 ) ) ( not ( = ?auto_29859 ?auto_29866 ) ) ( not ( = ?auto_29869 ?auto_29866 ) ) ( not ( = ?auto_29858 ?auto_29863 ) ) ( not ( = ?auto_29865 ?auto_29858 ) ) ( HOIST-AT ?auto_29864 ?auto_29858 ) ( not ( = ?auto_29860 ?auto_29864 ) ) ( not ( = ?auto_29861 ?auto_29864 ) ) ( AVAILABLE ?auto_29864 ) ( SURFACE-AT ?auto_29868 ?auto_29858 ) ( ON ?auto_29868 ?auto_29870 ) ( CLEAR ?auto_29868 ) ( not ( = ?auto_29856 ?auto_29870 ) ) ( not ( = ?auto_29857 ?auto_29870 ) ) ( not ( = ?auto_29868 ?auto_29870 ) ) ( not ( = ?auto_29859 ?auto_29870 ) ) ( not ( = ?auto_29869 ?auto_29870 ) ) ( not ( = ?auto_29866 ?auto_29870 ) ) ( SURFACE-AT ?auto_29867 ?auto_29863 ) ( CLEAR ?auto_29867 ) ( IS-CRATE ?auto_29866 ) ( not ( = ?auto_29867 ?auto_29866 ) ) ( not ( = ?auto_29856 ?auto_29867 ) ) ( not ( = ?auto_29857 ?auto_29867 ) ) ( not ( = ?auto_29868 ?auto_29867 ) ) ( not ( = ?auto_29859 ?auto_29867 ) ) ( not ( = ?auto_29869 ?auto_29867 ) ) ( not ( = ?auto_29870 ?auto_29867 ) ) ( AVAILABLE ?auto_29860 ) ( TRUCK-AT ?auto_29862 ?auto_29865 ) ( LIFTING ?auto_29861 ?auto_29866 ) )
    :subtasks
    ( ( !LOAD ?auto_29861 ?auto_29866 ?auto_29862 ?auto_29865 )
      ( MAKE-2CRATE ?auto_29868 ?auto_29856 ?auto_29857 )
      ( MAKE-1CRATE-VERIFY ?auto_29856 ?auto_29857 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29871 - SURFACE
      ?auto_29872 - SURFACE
      ?auto_29873 - SURFACE
    )
    :vars
    (
      ?auto_29880 - HOIST
      ?auto_29876 - PLACE
      ?auto_29877 - PLACE
      ?auto_29885 - HOIST
      ?auto_29874 - SURFACE
      ?auto_29881 - SURFACE
      ?auto_29878 - SURFACE
      ?auto_29882 - PLACE
      ?auto_29884 - HOIST
      ?auto_29883 - SURFACE
      ?auto_29879 - SURFACE
      ?auto_29875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29880 ?auto_29876 ) ( IS-CRATE ?auto_29873 ) ( not ( = ?auto_29872 ?auto_29873 ) ) ( not ( = ?auto_29871 ?auto_29872 ) ) ( not ( = ?auto_29871 ?auto_29873 ) ) ( not ( = ?auto_29877 ?auto_29876 ) ) ( HOIST-AT ?auto_29885 ?auto_29877 ) ( not ( = ?auto_29880 ?auto_29885 ) ) ( SURFACE-AT ?auto_29873 ?auto_29877 ) ( ON ?auto_29873 ?auto_29874 ) ( CLEAR ?auto_29873 ) ( not ( = ?auto_29872 ?auto_29874 ) ) ( not ( = ?auto_29873 ?auto_29874 ) ) ( not ( = ?auto_29871 ?auto_29874 ) ) ( IS-CRATE ?auto_29872 ) ( SURFACE-AT ?auto_29872 ?auto_29877 ) ( ON ?auto_29872 ?auto_29881 ) ( CLEAR ?auto_29872 ) ( not ( = ?auto_29872 ?auto_29881 ) ) ( not ( = ?auto_29873 ?auto_29881 ) ) ( not ( = ?auto_29871 ?auto_29881 ) ) ( not ( = ?auto_29874 ?auto_29881 ) ) ( IS-CRATE ?auto_29871 ) ( not ( = ?auto_29878 ?auto_29871 ) ) ( not ( = ?auto_29872 ?auto_29878 ) ) ( not ( = ?auto_29873 ?auto_29878 ) ) ( not ( = ?auto_29874 ?auto_29878 ) ) ( not ( = ?auto_29881 ?auto_29878 ) ) ( not ( = ?auto_29882 ?auto_29876 ) ) ( not ( = ?auto_29877 ?auto_29882 ) ) ( HOIST-AT ?auto_29884 ?auto_29882 ) ( not ( = ?auto_29880 ?auto_29884 ) ) ( not ( = ?auto_29885 ?auto_29884 ) ) ( AVAILABLE ?auto_29884 ) ( SURFACE-AT ?auto_29871 ?auto_29882 ) ( ON ?auto_29871 ?auto_29883 ) ( CLEAR ?auto_29871 ) ( not ( = ?auto_29872 ?auto_29883 ) ) ( not ( = ?auto_29873 ?auto_29883 ) ) ( not ( = ?auto_29871 ?auto_29883 ) ) ( not ( = ?auto_29874 ?auto_29883 ) ) ( not ( = ?auto_29881 ?auto_29883 ) ) ( not ( = ?auto_29878 ?auto_29883 ) ) ( SURFACE-AT ?auto_29879 ?auto_29876 ) ( CLEAR ?auto_29879 ) ( IS-CRATE ?auto_29878 ) ( not ( = ?auto_29879 ?auto_29878 ) ) ( not ( = ?auto_29872 ?auto_29879 ) ) ( not ( = ?auto_29873 ?auto_29879 ) ) ( not ( = ?auto_29871 ?auto_29879 ) ) ( not ( = ?auto_29874 ?auto_29879 ) ) ( not ( = ?auto_29881 ?auto_29879 ) ) ( not ( = ?auto_29883 ?auto_29879 ) ) ( AVAILABLE ?auto_29880 ) ( TRUCK-AT ?auto_29875 ?auto_29877 ) ( LIFTING ?auto_29885 ?auto_29878 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29872 ?auto_29873 )
      ( MAKE-2CRATE-VERIFY ?auto_29871 ?auto_29872 ?auto_29873 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29886 - SURFACE
      ?auto_29887 - SURFACE
      ?auto_29888 - SURFACE
      ?auto_29889 - SURFACE
    )
    :vars
    (
      ?auto_29891 - HOIST
      ?auto_29900 - PLACE
      ?auto_29893 - PLACE
      ?auto_29890 - HOIST
      ?auto_29896 - SURFACE
      ?auto_29899 - SURFACE
      ?auto_29892 - PLACE
      ?auto_29897 - HOIST
      ?auto_29895 - SURFACE
      ?auto_29894 - SURFACE
      ?auto_29898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29891 ?auto_29900 ) ( IS-CRATE ?auto_29889 ) ( not ( = ?auto_29888 ?auto_29889 ) ) ( not ( = ?auto_29887 ?auto_29888 ) ) ( not ( = ?auto_29887 ?auto_29889 ) ) ( not ( = ?auto_29893 ?auto_29900 ) ) ( HOIST-AT ?auto_29890 ?auto_29893 ) ( not ( = ?auto_29891 ?auto_29890 ) ) ( SURFACE-AT ?auto_29889 ?auto_29893 ) ( ON ?auto_29889 ?auto_29896 ) ( CLEAR ?auto_29889 ) ( not ( = ?auto_29888 ?auto_29896 ) ) ( not ( = ?auto_29889 ?auto_29896 ) ) ( not ( = ?auto_29887 ?auto_29896 ) ) ( IS-CRATE ?auto_29888 ) ( SURFACE-AT ?auto_29888 ?auto_29893 ) ( ON ?auto_29888 ?auto_29899 ) ( CLEAR ?auto_29888 ) ( not ( = ?auto_29888 ?auto_29899 ) ) ( not ( = ?auto_29889 ?auto_29899 ) ) ( not ( = ?auto_29887 ?auto_29899 ) ) ( not ( = ?auto_29896 ?auto_29899 ) ) ( IS-CRATE ?auto_29887 ) ( not ( = ?auto_29886 ?auto_29887 ) ) ( not ( = ?auto_29888 ?auto_29886 ) ) ( not ( = ?auto_29889 ?auto_29886 ) ) ( not ( = ?auto_29896 ?auto_29886 ) ) ( not ( = ?auto_29899 ?auto_29886 ) ) ( not ( = ?auto_29892 ?auto_29900 ) ) ( not ( = ?auto_29893 ?auto_29892 ) ) ( HOIST-AT ?auto_29897 ?auto_29892 ) ( not ( = ?auto_29891 ?auto_29897 ) ) ( not ( = ?auto_29890 ?auto_29897 ) ) ( AVAILABLE ?auto_29897 ) ( SURFACE-AT ?auto_29887 ?auto_29892 ) ( ON ?auto_29887 ?auto_29895 ) ( CLEAR ?auto_29887 ) ( not ( = ?auto_29888 ?auto_29895 ) ) ( not ( = ?auto_29889 ?auto_29895 ) ) ( not ( = ?auto_29887 ?auto_29895 ) ) ( not ( = ?auto_29896 ?auto_29895 ) ) ( not ( = ?auto_29899 ?auto_29895 ) ) ( not ( = ?auto_29886 ?auto_29895 ) ) ( SURFACE-AT ?auto_29894 ?auto_29900 ) ( CLEAR ?auto_29894 ) ( IS-CRATE ?auto_29886 ) ( not ( = ?auto_29894 ?auto_29886 ) ) ( not ( = ?auto_29888 ?auto_29894 ) ) ( not ( = ?auto_29889 ?auto_29894 ) ) ( not ( = ?auto_29887 ?auto_29894 ) ) ( not ( = ?auto_29896 ?auto_29894 ) ) ( not ( = ?auto_29899 ?auto_29894 ) ) ( not ( = ?auto_29895 ?auto_29894 ) ) ( AVAILABLE ?auto_29891 ) ( TRUCK-AT ?auto_29898 ?auto_29893 ) ( LIFTING ?auto_29890 ?auto_29886 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29887 ?auto_29888 ?auto_29889 )
      ( MAKE-3CRATE-VERIFY ?auto_29886 ?auto_29887 ?auto_29888 ?auto_29889 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29901 - SURFACE
      ?auto_29902 - SURFACE
      ?auto_29903 - SURFACE
      ?auto_29904 - SURFACE
      ?auto_29905 - SURFACE
    )
    :vars
    (
      ?auto_29907 - HOIST
      ?auto_29915 - PLACE
      ?auto_29909 - PLACE
      ?auto_29906 - HOIST
      ?auto_29911 - SURFACE
      ?auto_29914 - SURFACE
      ?auto_29908 - PLACE
      ?auto_29912 - HOIST
      ?auto_29910 - SURFACE
      ?auto_29913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29907 ?auto_29915 ) ( IS-CRATE ?auto_29905 ) ( not ( = ?auto_29904 ?auto_29905 ) ) ( not ( = ?auto_29903 ?auto_29904 ) ) ( not ( = ?auto_29903 ?auto_29905 ) ) ( not ( = ?auto_29909 ?auto_29915 ) ) ( HOIST-AT ?auto_29906 ?auto_29909 ) ( not ( = ?auto_29907 ?auto_29906 ) ) ( SURFACE-AT ?auto_29905 ?auto_29909 ) ( ON ?auto_29905 ?auto_29911 ) ( CLEAR ?auto_29905 ) ( not ( = ?auto_29904 ?auto_29911 ) ) ( not ( = ?auto_29905 ?auto_29911 ) ) ( not ( = ?auto_29903 ?auto_29911 ) ) ( IS-CRATE ?auto_29904 ) ( SURFACE-AT ?auto_29904 ?auto_29909 ) ( ON ?auto_29904 ?auto_29914 ) ( CLEAR ?auto_29904 ) ( not ( = ?auto_29904 ?auto_29914 ) ) ( not ( = ?auto_29905 ?auto_29914 ) ) ( not ( = ?auto_29903 ?auto_29914 ) ) ( not ( = ?auto_29911 ?auto_29914 ) ) ( IS-CRATE ?auto_29903 ) ( not ( = ?auto_29902 ?auto_29903 ) ) ( not ( = ?auto_29904 ?auto_29902 ) ) ( not ( = ?auto_29905 ?auto_29902 ) ) ( not ( = ?auto_29911 ?auto_29902 ) ) ( not ( = ?auto_29914 ?auto_29902 ) ) ( not ( = ?auto_29908 ?auto_29915 ) ) ( not ( = ?auto_29909 ?auto_29908 ) ) ( HOIST-AT ?auto_29912 ?auto_29908 ) ( not ( = ?auto_29907 ?auto_29912 ) ) ( not ( = ?auto_29906 ?auto_29912 ) ) ( AVAILABLE ?auto_29912 ) ( SURFACE-AT ?auto_29903 ?auto_29908 ) ( ON ?auto_29903 ?auto_29910 ) ( CLEAR ?auto_29903 ) ( not ( = ?auto_29904 ?auto_29910 ) ) ( not ( = ?auto_29905 ?auto_29910 ) ) ( not ( = ?auto_29903 ?auto_29910 ) ) ( not ( = ?auto_29911 ?auto_29910 ) ) ( not ( = ?auto_29914 ?auto_29910 ) ) ( not ( = ?auto_29902 ?auto_29910 ) ) ( SURFACE-AT ?auto_29901 ?auto_29915 ) ( CLEAR ?auto_29901 ) ( IS-CRATE ?auto_29902 ) ( not ( = ?auto_29901 ?auto_29902 ) ) ( not ( = ?auto_29904 ?auto_29901 ) ) ( not ( = ?auto_29905 ?auto_29901 ) ) ( not ( = ?auto_29903 ?auto_29901 ) ) ( not ( = ?auto_29911 ?auto_29901 ) ) ( not ( = ?auto_29914 ?auto_29901 ) ) ( not ( = ?auto_29910 ?auto_29901 ) ) ( AVAILABLE ?auto_29907 ) ( TRUCK-AT ?auto_29913 ?auto_29909 ) ( LIFTING ?auto_29906 ?auto_29902 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29903 ?auto_29904 ?auto_29905 )
      ( MAKE-4CRATE-VERIFY ?auto_29901 ?auto_29902 ?auto_29903 ?auto_29904 ?auto_29905 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29916 - SURFACE
      ?auto_29917 - SURFACE
    )
    :vars
    (
      ?auto_29919 - HOIST
      ?auto_29929 - PLACE
      ?auto_29930 - SURFACE
      ?auto_29921 - PLACE
      ?auto_29918 - HOIST
      ?auto_29924 - SURFACE
      ?auto_29928 - SURFACE
      ?auto_29927 - SURFACE
      ?auto_29920 - PLACE
      ?auto_29925 - HOIST
      ?auto_29923 - SURFACE
      ?auto_29922 - SURFACE
      ?auto_29926 - TRUCK
      ?auto_29931 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29919 ?auto_29929 ) ( IS-CRATE ?auto_29917 ) ( not ( = ?auto_29916 ?auto_29917 ) ) ( not ( = ?auto_29930 ?auto_29916 ) ) ( not ( = ?auto_29930 ?auto_29917 ) ) ( not ( = ?auto_29921 ?auto_29929 ) ) ( HOIST-AT ?auto_29918 ?auto_29921 ) ( not ( = ?auto_29919 ?auto_29918 ) ) ( SURFACE-AT ?auto_29917 ?auto_29921 ) ( ON ?auto_29917 ?auto_29924 ) ( CLEAR ?auto_29917 ) ( not ( = ?auto_29916 ?auto_29924 ) ) ( not ( = ?auto_29917 ?auto_29924 ) ) ( not ( = ?auto_29930 ?auto_29924 ) ) ( IS-CRATE ?auto_29916 ) ( SURFACE-AT ?auto_29916 ?auto_29921 ) ( ON ?auto_29916 ?auto_29928 ) ( CLEAR ?auto_29916 ) ( not ( = ?auto_29916 ?auto_29928 ) ) ( not ( = ?auto_29917 ?auto_29928 ) ) ( not ( = ?auto_29930 ?auto_29928 ) ) ( not ( = ?auto_29924 ?auto_29928 ) ) ( IS-CRATE ?auto_29930 ) ( not ( = ?auto_29927 ?auto_29930 ) ) ( not ( = ?auto_29916 ?auto_29927 ) ) ( not ( = ?auto_29917 ?auto_29927 ) ) ( not ( = ?auto_29924 ?auto_29927 ) ) ( not ( = ?auto_29928 ?auto_29927 ) ) ( not ( = ?auto_29920 ?auto_29929 ) ) ( not ( = ?auto_29921 ?auto_29920 ) ) ( HOIST-AT ?auto_29925 ?auto_29920 ) ( not ( = ?auto_29919 ?auto_29925 ) ) ( not ( = ?auto_29918 ?auto_29925 ) ) ( AVAILABLE ?auto_29925 ) ( SURFACE-AT ?auto_29930 ?auto_29920 ) ( ON ?auto_29930 ?auto_29923 ) ( CLEAR ?auto_29930 ) ( not ( = ?auto_29916 ?auto_29923 ) ) ( not ( = ?auto_29917 ?auto_29923 ) ) ( not ( = ?auto_29930 ?auto_29923 ) ) ( not ( = ?auto_29924 ?auto_29923 ) ) ( not ( = ?auto_29928 ?auto_29923 ) ) ( not ( = ?auto_29927 ?auto_29923 ) ) ( SURFACE-AT ?auto_29922 ?auto_29929 ) ( CLEAR ?auto_29922 ) ( IS-CRATE ?auto_29927 ) ( not ( = ?auto_29922 ?auto_29927 ) ) ( not ( = ?auto_29916 ?auto_29922 ) ) ( not ( = ?auto_29917 ?auto_29922 ) ) ( not ( = ?auto_29930 ?auto_29922 ) ) ( not ( = ?auto_29924 ?auto_29922 ) ) ( not ( = ?auto_29928 ?auto_29922 ) ) ( not ( = ?auto_29923 ?auto_29922 ) ) ( AVAILABLE ?auto_29919 ) ( TRUCK-AT ?auto_29926 ?auto_29921 ) ( AVAILABLE ?auto_29918 ) ( SURFACE-AT ?auto_29927 ?auto_29921 ) ( ON ?auto_29927 ?auto_29931 ) ( CLEAR ?auto_29927 ) ( not ( = ?auto_29916 ?auto_29931 ) ) ( not ( = ?auto_29917 ?auto_29931 ) ) ( not ( = ?auto_29930 ?auto_29931 ) ) ( not ( = ?auto_29924 ?auto_29931 ) ) ( not ( = ?auto_29928 ?auto_29931 ) ) ( not ( = ?auto_29927 ?auto_29931 ) ) ( not ( = ?auto_29923 ?auto_29931 ) ) ( not ( = ?auto_29922 ?auto_29931 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29918 ?auto_29927 ?auto_29931 ?auto_29921 )
      ( MAKE-2CRATE ?auto_29930 ?auto_29916 ?auto_29917 )
      ( MAKE-1CRATE-VERIFY ?auto_29916 ?auto_29917 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29932 - SURFACE
      ?auto_29933 - SURFACE
      ?auto_29934 - SURFACE
    )
    :vars
    (
      ?auto_29941 - HOIST
      ?auto_29945 - PLACE
      ?auto_29937 - PLACE
      ?auto_29944 - HOIST
      ?auto_29942 - SURFACE
      ?auto_29936 - SURFACE
      ?auto_29939 - SURFACE
      ?auto_29943 - PLACE
      ?auto_29946 - HOIST
      ?auto_29935 - SURFACE
      ?auto_29938 - SURFACE
      ?auto_29940 - TRUCK
      ?auto_29947 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29941 ?auto_29945 ) ( IS-CRATE ?auto_29934 ) ( not ( = ?auto_29933 ?auto_29934 ) ) ( not ( = ?auto_29932 ?auto_29933 ) ) ( not ( = ?auto_29932 ?auto_29934 ) ) ( not ( = ?auto_29937 ?auto_29945 ) ) ( HOIST-AT ?auto_29944 ?auto_29937 ) ( not ( = ?auto_29941 ?auto_29944 ) ) ( SURFACE-AT ?auto_29934 ?auto_29937 ) ( ON ?auto_29934 ?auto_29942 ) ( CLEAR ?auto_29934 ) ( not ( = ?auto_29933 ?auto_29942 ) ) ( not ( = ?auto_29934 ?auto_29942 ) ) ( not ( = ?auto_29932 ?auto_29942 ) ) ( IS-CRATE ?auto_29933 ) ( SURFACE-AT ?auto_29933 ?auto_29937 ) ( ON ?auto_29933 ?auto_29936 ) ( CLEAR ?auto_29933 ) ( not ( = ?auto_29933 ?auto_29936 ) ) ( not ( = ?auto_29934 ?auto_29936 ) ) ( not ( = ?auto_29932 ?auto_29936 ) ) ( not ( = ?auto_29942 ?auto_29936 ) ) ( IS-CRATE ?auto_29932 ) ( not ( = ?auto_29939 ?auto_29932 ) ) ( not ( = ?auto_29933 ?auto_29939 ) ) ( not ( = ?auto_29934 ?auto_29939 ) ) ( not ( = ?auto_29942 ?auto_29939 ) ) ( not ( = ?auto_29936 ?auto_29939 ) ) ( not ( = ?auto_29943 ?auto_29945 ) ) ( not ( = ?auto_29937 ?auto_29943 ) ) ( HOIST-AT ?auto_29946 ?auto_29943 ) ( not ( = ?auto_29941 ?auto_29946 ) ) ( not ( = ?auto_29944 ?auto_29946 ) ) ( AVAILABLE ?auto_29946 ) ( SURFACE-AT ?auto_29932 ?auto_29943 ) ( ON ?auto_29932 ?auto_29935 ) ( CLEAR ?auto_29932 ) ( not ( = ?auto_29933 ?auto_29935 ) ) ( not ( = ?auto_29934 ?auto_29935 ) ) ( not ( = ?auto_29932 ?auto_29935 ) ) ( not ( = ?auto_29942 ?auto_29935 ) ) ( not ( = ?auto_29936 ?auto_29935 ) ) ( not ( = ?auto_29939 ?auto_29935 ) ) ( SURFACE-AT ?auto_29938 ?auto_29945 ) ( CLEAR ?auto_29938 ) ( IS-CRATE ?auto_29939 ) ( not ( = ?auto_29938 ?auto_29939 ) ) ( not ( = ?auto_29933 ?auto_29938 ) ) ( not ( = ?auto_29934 ?auto_29938 ) ) ( not ( = ?auto_29932 ?auto_29938 ) ) ( not ( = ?auto_29942 ?auto_29938 ) ) ( not ( = ?auto_29936 ?auto_29938 ) ) ( not ( = ?auto_29935 ?auto_29938 ) ) ( AVAILABLE ?auto_29941 ) ( TRUCK-AT ?auto_29940 ?auto_29937 ) ( AVAILABLE ?auto_29944 ) ( SURFACE-AT ?auto_29939 ?auto_29937 ) ( ON ?auto_29939 ?auto_29947 ) ( CLEAR ?auto_29939 ) ( not ( = ?auto_29933 ?auto_29947 ) ) ( not ( = ?auto_29934 ?auto_29947 ) ) ( not ( = ?auto_29932 ?auto_29947 ) ) ( not ( = ?auto_29942 ?auto_29947 ) ) ( not ( = ?auto_29936 ?auto_29947 ) ) ( not ( = ?auto_29939 ?auto_29947 ) ) ( not ( = ?auto_29935 ?auto_29947 ) ) ( not ( = ?auto_29938 ?auto_29947 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29933 ?auto_29934 )
      ( MAKE-2CRATE-VERIFY ?auto_29932 ?auto_29933 ?auto_29934 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29948 - SURFACE
      ?auto_29949 - SURFACE
      ?auto_29950 - SURFACE
      ?auto_29951 - SURFACE
    )
    :vars
    (
      ?auto_29953 - HOIST
      ?auto_29958 - PLACE
      ?auto_29959 - PLACE
      ?auto_29956 - HOIST
      ?auto_29952 - SURFACE
      ?auto_29963 - SURFACE
      ?auto_29960 - PLACE
      ?auto_29961 - HOIST
      ?auto_29954 - SURFACE
      ?auto_29962 - SURFACE
      ?auto_29955 - TRUCK
      ?auto_29957 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29953 ?auto_29958 ) ( IS-CRATE ?auto_29951 ) ( not ( = ?auto_29950 ?auto_29951 ) ) ( not ( = ?auto_29949 ?auto_29950 ) ) ( not ( = ?auto_29949 ?auto_29951 ) ) ( not ( = ?auto_29959 ?auto_29958 ) ) ( HOIST-AT ?auto_29956 ?auto_29959 ) ( not ( = ?auto_29953 ?auto_29956 ) ) ( SURFACE-AT ?auto_29951 ?auto_29959 ) ( ON ?auto_29951 ?auto_29952 ) ( CLEAR ?auto_29951 ) ( not ( = ?auto_29950 ?auto_29952 ) ) ( not ( = ?auto_29951 ?auto_29952 ) ) ( not ( = ?auto_29949 ?auto_29952 ) ) ( IS-CRATE ?auto_29950 ) ( SURFACE-AT ?auto_29950 ?auto_29959 ) ( ON ?auto_29950 ?auto_29963 ) ( CLEAR ?auto_29950 ) ( not ( = ?auto_29950 ?auto_29963 ) ) ( not ( = ?auto_29951 ?auto_29963 ) ) ( not ( = ?auto_29949 ?auto_29963 ) ) ( not ( = ?auto_29952 ?auto_29963 ) ) ( IS-CRATE ?auto_29949 ) ( not ( = ?auto_29948 ?auto_29949 ) ) ( not ( = ?auto_29950 ?auto_29948 ) ) ( not ( = ?auto_29951 ?auto_29948 ) ) ( not ( = ?auto_29952 ?auto_29948 ) ) ( not ( = ?auto_29963 ?auto_29948 ) ) ( not ( = ?auto_29960 ?auto_29958 ) ) ( not ( = ?auto_29959 ?auto_29960 ) ) ( HOIST-AT ?auto_29961 ?auto_29960 ) ( not ( = ?auto_29953 ?auto_29961 ) ) ( not ( = ?auto_29956 ?auto_29961 ) ) ( AVAILABLE ?auto_29961 ) ( SURFACE-AT ?auto_29949 ?auto_29960 ) ( ON ?auto_29949 ?auto_29954 ) ( CLEAR ?auto_29949 ) ( not ( = ?auto_29950 ?auto_29954 ) ) ( not ( = ?auto_29951 ?auto_29954 ) ) ( not ( = ?auto_29949 ?auto_29954 ) ) ( not ( = ?auto_29952 ?auto_29954 ) ) ( not ( = ?auto_29963 ?auto_29954 ) ) ( not ( = ?auto_29948 ?auto_29954 ) ) ( SURFACE-AT ?auto_29962 ?auto_29958 ) ( CLEAR ?auto_29962 ) ( IS-CRATE ?auto_29948 ) ( not ( = ?auto_29962 ?auto_29948 ) ) ( not ( = ?auto_29950 ?auto_29962 ) ) ( not ( = ?auto_29951 ?auto_29962 ) ) ( not ( = ?auto_29949 ?auto_29962 ) ) ( not ( = ?auto_29952 ?auto_29962 ) ) ( not ( = ?auto_29963 ?auto_29962 ) ) ( not ( = ?auto_29954 ?auto_29962 ) ) ( AVAILABLE ?auto_29953 ) ( TRUCK-AT ?auto_29955 ?auto_29959 ) ( AVAILABLE ?auto_29956 ) ( SURFACE-AT ?auto_29948 ?auto_29959 ) ( ON ?auto_29948 ?auto_29957 ) ( CLEAR ?auto_29948 ) ( not ( = ?auto_29950 ?auto_29957 ) ) ( not ( = ?auto_29951 ?auto_29957 ) ) ( not ( = ?auto_29949 ?auto_29957 ) ) ( not ( = ?auto_29952 ?auto_29957 ) ) ( not ( = ?auto_29963 ?auto_29957 ) ) ( not ( = ?auto_29948 ?auto_29957 ) ) ( not ( = ?auto_29954 ?auto_29957 ) ) ( not ( = ?auto_29962 ?auto_29957 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29949 ?auto_29950 ?auto_29951 )
      ( MAKE-3CRATE-VERIFY ?auto_29948 ?auto_29949 ?auto_29950 ?auto_29951 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29964 - SURFACE
      ?auto_29965 - SURFACE
      ?auto_29966 - SURFACE
      ?auto_29967 - SURFACE
      ?auto_29968 - SURFACE
    )
    :vars
    (
      ?auto_29970 - HOIST
      ?auto_29975 - PLACE
      ?auto_29976 - PLACE
      ?auto_29973 - HOIST
      ?auto_29969 - SURFACE
      ?auto_29979 - SURFACE
      ?auto_29977 - PLACE
      ?auto_29978 - HOIST
      ?auto_29971 - SURFACE
      ?auto_29972 - TRUCK
      ?auto_29974 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29970 ?auto_29975 ) ( IS-CRATE ?auto_29968 ) ( not ( = ?auto_29967 ?auto_29968 ) ) ( not ( = ?auto_29966 ?auto_29967 ) ) ( not ( = ?auto_29966 ?auto_29968 ) ) ( not ( = ?auto_29976 ?auto_29975 ) ) ( HOIST-AT ?auto_29973 ?auto_29976 ) ( not ( = ?auto_29970 ?auto_29973 ) ) ( SURFACE-AT ?auto_29968 ?auto_29976 ) ( ON ?auto_29968 ?auto_29969 ) ( CLEAR ?auto_29968 ) ( not ( = ?auto_29967 ?auto_29969 ) ) ( not ( = ?auto_29968 ?auto_29969 ) ) ( not ( = ?auto_29966 ?auto_29969 ) ) ( IS-CRATE ?auto_29967 ) ( SURFACE-AT ?auto_29967 ?auto_29976 ) ( ON ?auto_29967 ?auto_29979 ) ( CLEAR ?auto_29967 ) ( not ( = ?auto_29967 ?auto_29979 ) ) ( not ( = ?auto_29968 ?auto_29979 ) ) ( not ( = ?auto_29966 ?auto_29979 ) ) ( not ( = ?auto_29969 ?auto_29979 ) ) ( IS-CRATE ?auto_29966 ) ( not ( = ?auto_29965 ?auto_29966 ) ) ( not ( = ?auto_29967 ?auto_29965 ) ) ( not ( = ?auto_29968 ?auto_29965 ) ) ( not ( = ?auto_29969 ?auto_29965 ) ) ( not ( = ?auto_29979 ?auto_29965 ) ) ( not ( = ?auto_29977 ?auto_29975 ) ) ( not ( = ?auto_29976 ?auto_29977 ) ) ( HOIST-AT ?auto_29978 ?auto_29977 ) ( not ( = ?auto_29970 ?auto_29978 ) ) ( not ( = ?auto_29973 ?auto_29978 ) ) ( AVAILABLE ?auto_29978 ) ( SURFACE-AT ?auto_29966 ?auto_29977 ) ( ON ?auto_29966 ?auto_29971 ) ( CLEAR ?auto_29966 ) ( not ( = ?auto_29967 ?auto_29971 ) ) ( not ( = ?auto_29968 ?auto_29971 ) ) ( not ( = ?auto_29966 ?auto_29971 ) ) ( not ( = ?auto_29969 ?auto_29971 ) ) ( not ( = ?auto_29979 ?auto_29971 ) ) ( not ( = ?auto_29965 ?auto_29971 ) ) ( SURFACE-AT ?auto_29964 ?auto_29975 ) ( CLEAR ?auto_29964 ) ( IS-CRATE ?auto_29965 ) ( not ( = ?auto_29964 ?auto_29965 ) ) ( not ( = ?auto_29967 ?auto_29964 ) ) ( not ( = ?auto_29968 ?auto_29964 ) ) ( not ( = ?auto_29966 ?auto_29964 ) ) ( not ( = ?auto_29969 ?auto_29964 ) ) ( not ( = ?auto_29979 ?auto_29964 ) ) ( not ( = ?auto_29971 ?auto_29964 ) ) ( AVAILABLE ?auto_29970 ) ( TRUCK-AT ?auto_29972 ?auto_29976 ) ( AVAILABLE ?auto_29973 ) ( SURFACE-AT ?auto_29965 ?auto_29976 ) ( ON ?auto_29965 ?auto_29974 ) ( CLEAR ?auto_29965 ) ( not ( = ?auto_29967 ?auto_29974 ) ) ( not ( = ?auto_29968 ?auto_29974 ) ) ( not ( = ?auto_29966 ?auto_29974 ) ) ( not ( = ?auto_29969 ?auto_29974 ) ) ( not ( = ?auto_29979 ?auto_29974 ) ) ( not ( = ?auto_29965 ?auto_29974 ) ) ( not ( = ?auto_29971 ?auto_29974 ) ) ( not ( = ?auto_29964 ?auto_29974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29966 ?auto_29967 ?auto_29968 )
      ( MAKE-4CRATE-VERIFY ?auto_29964 ?auto_29965 ?auto_29966 ?auto_29967 ?auto_29968 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29980 - SURFACE
      ?auto_29981 - SURFACE
    )
    :vars
    (
      ?auto_29983 - HOIST
      ?auto_29990 - PLACE
      ?auto_29985 - SURFACE
      ?auto_29991 - PLACE
      ?auto_29988 - HOIST
      ?auto_29982 - SURFACE
      ?auto_29995 - SURFACE
      ?auto_29987 - SURFACE
      ?auto_29992 - PLACE
      ?auto_29993 - HOIST
      ?auto_29984 - SURFACE
      ?auto_29994 - SURFACE
      ?auto_29989 - SURFACE
      ?auto_29986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29983 ?auto_29990 ) ( IS-CRATE ?auto_29981 ) ( not ( = ?auto_29980 ?auto_29981 ) ) ( not ( = ?auto_29985 ?auto_29980 ) ) ( not ( = ?auto_29985 ?auto_29981 ) ) ( not ( = ?auto_29991 ?auto_29990 ) ) ( HOIST-AT ?auto_29988 ?auto_29991 ) ( not ( = ?auto_29983 ?auto_29988 ) ) ( SURFACE-AT ?auto_29981 ?auto_29991 ) ( ON ?auto_29981 ?auto_29982 ) ( CLEAR ?auto_29981 ) ( not ( = ?auto_29980 ?auto_29982 ) ) ( not ( = ?auto_29981 ?auto_29982 ) ) ( not ( = ?auto_29985 ?auto_29982 ) ) ( IS-CRATE ?auto_29980 ) ( SURFACE-AT ?auto_29980 ?auto_29991 ) ( ON ?auto_29980 ?auto_29995 ) ( CLEAR ?auto_29980 ) ( not ( = ?auto_29980 ?auto_29995 ) ) ( not ( = ?auto_29981 ?auto_29995 ) ) ( not ( = ?auto_29985 ?auto_29995 ) ) ( not ( = ?auto_29982 ?auto_29995 ) ) ( IS-CRATE ?auto_29985 ) ( not ( = ?auto_29987 ?auto_29985 ) ) ( not ( = ?auto_29980 ?auto_29987 ) ) ( not ( = ?auto_29981 ?auto_29987 ) ) ( not ( = ?auto_29982 ?auto_29987 ) ) ( not ( = ?auto_29995 ?auto_29987 ) ) ( not ( = ?auto_29992 ?auto_29990 ) ) ( not ( = ?auto_29991 ?auto_29992 ) ) ( HOIST-AT ?auto_29993 ?auto_29992 ) ( not ( = ?auto_29983 ?auto_29993 ) ) ( not ( = ?auto_29988 ?auto_29993 ) ) ( AVAILABLE ?auto_29993 ) ( SURFACE-AT ?auto_29985 ?auto_29992 ) ( ON ?auto_29985 ?auto_29984 ) ( CLEAR ?auto_29985 ) ( not ( = ?auto_29980 ?auto_29984 ) ) ( not ( = ?auto_29981 ?auto_29984 ) ) ( not ( = ?auto_29985 ?auto_29984 ) ) ( not ( = ?auto_29982 ?auto_29984 ) ) ( not ( = ?auto_29995 ?auto_29984 ) ) ( not ( = ?auto_29987 ?auto_29984 ) ) ( SURFACE-AT ?auto_29994 ?auto_29990 ) ( CLEAR ?auto_29994 ) ( IS-CRATE ?auto_29987 ) ( not ( = ?auto_29994 ?auto_29987 ) ) ( not ( = ?auto_29980 ?auto_29994 ) ) ( not ( = ?auto_29981 ?auto_29994 ) ) ( not ( = ?auto_29985 ?auto_29994 ) ) ( not ( = ?auto_29982 ?auto_29994 ) ) ( not ( = ?auto_29995 ?auto_29994 ) ) ( not ( = ?auto_29984 ?auto_29994 ) ) ( AVAILABLE ?auto_29983 ) ( AVAILABLE ?auto_29988 ) ( SURFACE-AT ?auto_29987 ?auto_29991 ) ( ON ?auto_29987 ?auto_29989 ) ( CLEAR ?auto_29987 ) ( not ( = ?auto_29980 ?auto_29989 ) ) ( not ( = ?auto_29981 ?auto_29989 ) ) ( not ( = ?auto_29985 ?auto_29989 ) ) ( not ( = ?auto_29982 ?auto_29989 ) ) ( not ( = ?auto_29995 ?auto_29989 ) ) ( not ( = ?auto_29987 ?auto_29989 ) ) ( not ( = ?auto_29984 ?auto_29989 ) ) ( not ( = ?auto_29994 ?auto_29989 ) ) ( TRUCK-AT ?auto_29986 ?auto_29990 ) )
    :subtasks
    ( ( !DRIVE ?auto_29986 ?auto_29990 ?auto_29991 )
      ( MAKE-2CRATE ?auto_29985 ?auto_29980 ?auto_29981 )
      ( MAKE-1CRATE-VERIFY ?auto_29980 ?auto_29981 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29996 - SURFACE
      ?auto_29997 - SURFACE
      ?auto_29998 - SURFACE
    )
    :vars
    (
      ?auto_30011 - HOIST
      ?auto_30001 - PLACE
      ?auto_30009 - PLACE
      ?auto_30000 - HOIST
      ?auto_30006 - SURFACE
      ?auto_30005 - SURFACE
      ?auto_30003 - SURFACE
      ?auto_29999 - PLACE
      ?auto_30002 - HOIST
      ?auto_30008 - SURFACE
      ?auto_30004 - SURFACE
      ?auto_30010 - SURFACE
      ?auto_30007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30011 ?auto_30001 ) ( IS-CRATE ?auto_29998 ) ( not ( = ?auto_29997 ?auto_29998 ) ) ( not ( = ?auto_29996 ?auto_29997 ) ) ( not ( = ?auto_29996 ?auto_29998 ) ) ( not ( = ?auto_30009 ?auto_30001 ) ) ( HOIST-AT ?auto_30000 ?auto_30009 ) ( not ( = ?auto_30011 ?auto_30000 ) ) ( SURFACE-AT ?auto_29998 ?auto_30009 ) ( ON ?auto_29998 ?auto_30006 ) ( CLEAR ?auto_29998 ) ( not ( = ?auto_29997 ?auto_30006 ) ) ( not ( = ?auto_29998 ?auto_30006 ) ) ( not ( = ?auto_29996 ?auto_30006 ) ) ( IS-CRATE ?auto_29997 ) ( SURFACE-AT ?auto_29997 ?auto_30009 ) ( ON ?auto_29997 ?auto_30005 ) ( CLEAR ?auto_29997 ) ( not ( = ?auto_29997 ?auto_30005 ) ) ( not ( = ?auto_29998 ?auto_30005 ) ) ( not ( = ?auto_29996 ?auto_30005 ) ) ( not ( = ?auto_30006 ?auto_30005 ) ) ( IS-CRATE ?auto_29996 ) ( not ( = ?auto_30003 ?auto_29996 ) ) ( not ( = ?auto_29997 ?auto_30003 ) ) ( not ( = ?auto_29998 ?auto_30003 ) ) ( not ( = ?auto_30006 ?auto_30003 ) ) ( not ( = ?auto_30005 ?auto_30003 ) ) ( not ( = ?auto_29999 ?auto_30001 ) ) ( not ( = ?auto_30009 ?auto_29999 ) ) ( HOIST-AT ?auto_30002 ?auto_29999 ) ( not ( = ?auto_30011 ?auto_30002 ) ) ( not ( = ?auto_30000 ?auto_30002 ) ) ( AVAILABLE ?auto_30002 ) ( SURFACE-AT ?auto_29996 ?auto_29999 ) ( ON ?auto_29996 ?auto_30008 ) ( CLEAR ?auto_29996 ) ( not ( = ?auto_29997 ?auto_30008 ) ) ( not ( = ?auto_29998 ?auto_30008 ) ) ( not ( = ?auto_29996 ?auto_30008 ) ) ( not ( = ?auto_30006 ?auto_30008 ) ) ( not ( = ?auto_30005 ?auto_30008 ) ) ( not ( = ?auto_30003 ?auto_30008 ) ) ( SURFACE-AT ?auto_30004 ?auto_30001 ) ( CLEAR ?auto_30004 ) ( IS-CRATE ?auto_30003 ) ( not ( = ?auto_30004 ?auto_30003 ) ) ( not ( = ?auto_29997 ?auto_30004 ) ) ( not ( = ?auto_29998 ?auto_30004 ) ) ( not ( = ?auto_29996 ?auto_30004 ) ) ( not ( = ?auto_30006 ?auto_30004 ) ) ( not ( = ?auto_30005 ?auto_30004 ) ) ( not ( = ?auto_30008 ?auto_30004 ) ) ( AVAILABLE ?auto_30011 ) ( AVAILABLE ?auto_30000 ) ( SURFACE-AT ?auto_30003 ?auto_30009 ) ( ON ?auto_30003 ?auto_30010 ) ( CLEAR ?auto_30003 ) ( not ( = ?auto_29997 ?auto_30010 ) ) ( not ( = ?auto_29998 ?auto_30010 ) ) ( not ( = ?auto_29996 ?auto_30010 ) ) ( not ( = ?auto_30006 ?auto_30010 ) ) ( not ( = ?auto_30005 ?auto_30010 ) ) ( not ( = ?auto_30003 ?auto_30010 ) ) ( not ( = ?auto_30008 ?auto_30010 ) ) ( not ( = ?auto_30004 ?auto_30010 ) ) ( TRUCK-AT ?auto_30007 ?auto_30001 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29997 ?auto_29998 )
      ( MAKE-2CRATE-VERIFY ?auto_29996 ?auto_29997 ?auto_29998 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30012 - SURFACE
      ?auto_30013 - SURFACE
      ?auto_30014 - SURFACE
      ?auto_30015 - SURFACE
    )
    :vars
    (
      ?auto_30021 - HOIST
      ?auto_30026 - PLACE
      ?auto_30022 - PLACE
      ?auto_30023 - HOIST
      ?auto_30024 - SURFACE
      ?auto_30027 - SURFACE
      ?auto_30020 - PLACE
      ?auto_30016 - HOIST
      ?auto_30019 - SURFACE
      ?auto_30018 - SURFACE
      ?auto_30017 - SURFACE
      ?auto_30025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30021 ?auto_30026 ) ( IS-CRATE ?auto_30015 ) ( not ( = ?auto_30014 ?auto_30015 ) ) ( not ( = ?auto_30013 ?auto_30014 ) ) ( not ( = ?auto_30013 ?auto_30015 ) ) ( not ( = ?auto_30022 ?auto_30026 ) ) ( HOIST-AT ?auto_30023 ?auto_30022 ) ( not ( = ?auto_30021 ?auto_30023 ) ) ( SURFACE-AT ?auto_30015 ?auto_30022 ) ( ON ?auto_30015 ?auto_30024 ) ( CLEAR ?auto_30015 ) ( not ( = ?auto_30014 ?auto_30024 ) ) ( not ( = ?auto_30015 ?auto_30024 ) ) ( not ( = ?auto_30013 ?auto_30024 ) ) ( IS-CRATE ?auto_30014 ) ( SURFACE-AT ?auto_30014 ?auto_30022 ) ( ON ?auto_30014 ?auto_30027 ) ( CLEAR ?auto_30014 ) ( not ( = ?auto_30014 ?auto_30027 ) ) ( not ( = ?auto_30015 ?auto_30027 ) ) ( not ( = ?auto_30013 ?auto_30027 ) ) ( not ( = ?auto_30024 ?auto_30027 ) ) ( IS-CRATE ?auto_30013 ) ( not ( = ?auto_30012 ?auto_30013 ) ) ( not ( = ?auto_30014 ?auto_30012 ) ) ( not ( = ?auto_30015 ?auto_30012 ) ) ( not ( = ?auto_30024 ?auto_30012 ) ) ( not ( = ?auto_30027 ?auto_30012 ) ) ( not ( = ?auto_30020 ?auto_30026 ) ) ( not ( = ?auto_30022 ?auto_30020 ) ) ( HOIST-AT ?auto_30016 ?auto_30020 ) ( not ( = ?auto_30021 ?auto_30016 ) ) ( not ( = ?auto_30023 ?auto_30016 ) ) ( AVAILABLE ?auto_30016 ) ( SURFACE-AT ?auto_30013 ?auto_30020 ) ( ON ?auto_30013 ?auto_30019 ) ( CLEAR ?auto_30013 ) ( not ( = ?auto_30014 ?auto_30019 ) ) ( not ( = ?auto_30015 ?auto_30019 ) ) ( not ( = ?auto_30013 ?auto_30019 ) ) ( not ( = ?auto_30024 ?auto_30019 ) ) ( not ( = ?auto_30027 ?auto_30019 ) ) ( not ( = ?auto_30012 ?auto_30019 ) ) ( SURFACE-AT ?auto_30018 ?auto_30026 ) ( CLEAR ?auto_30018 ) ( IS-CRATE ?auto_30012 ) ( not ( = ?auto_30018 ?auto_30012 ) ) ( not ( = ?auto_30014 ?auto_30018 ) ) ( not ( = ?auto_30015 ?auto_30018 ) ) ( not ( = ?auto_30013 ?auto_30018 ) ) ( not ( = ?auto_30024 ?auto_30018 ) ) ( not ( = ?auto_30027 ?auto_30018 ) ) ( not ( = ?auto_30019 ?auto_30018 ) ) ( AVAILABLE ?auto_30021 ) ( AVAILABLE ?auto_30023 ) ( SURFACE-AT ?auto_30012 ?auto_30022 ) ( ON ?auto_30012 ?auto_30017 ) ( CLEAR ?auto_30012 ) ( not ( = ?auto_30014 ?auto_30017 ) ) ( not ( = ?auto_30015 ?auto_30017 ) ) ( not ( = ?auto_30013 ?auto_30017 ) ) ( not ( = ?auto_30024 ?auto_30017 ) ) ( not ( = ?auto_30027 ?auto_30017 ) ) ( not ( = ?auto_30012 ?auto_30017 ) ) ( not ( = ?auto_30019 ?auto_30017 ) ) ( not ( = ?auto_30018 ?auto_30017 ) ) ( TRUCK-AT ?auto_30025 ?auto_30026 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30013 ?auto_30014 ?auto_30015 )
      ( MAKE-3CRATE-VERIFY ?auto_30012 ?auto_30013 ?auto_30014 ?auto_30015 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30028 - SURFACE
      ?auto_30029 - SURFACE
      ?auto_30030 - SURFACE
      ?auto_30031 - SURFACE
      ?auto_30032 - SURFACE
    )
    :vars
    (
      ?auto_30037 - HOIST
      ?auto_30042 - PLACE
      ?auto_30038 - PLACE
      ?auto_30039 - HOIST
      ?auto_30040 - SURFACE
      ?auto_30043 - SURFACE
      ?auto_30036 - PLACE
      ?auto_30033 - HOIST
      ?auto_30035 - SURFACE
      ?auto_30034 - SURFACE
      ?auto_30041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30037 ?auto_30042 ) ( IS-CRATE ?auto_30032 ) ( not ( = ?auto_30031 ?auto_30032 ) ) ( not ( = ?auto_30030 ?auto_30031 ) ) ( not ( = ?auto_30030 ?auto_30032 ) ) ( not ( = ?auto_30038 ?auto_30042 ) ) ( HOIST-AT ?auto_30039 ?auto_30038 ) ( not ( = ?auto_30037 ?auto_30039 ) ) ( SURFACE-AT ?auto_30032 ?auto_30038 ) ( ON ?auto_30032 ?auto_30040 ) ( CLEAR ?auto_30032 ) ( not ( = ?auto_30031 ?auto_30040 ) ) ( not ( = ?auto_30032 ?auto_30040 ) ) ( not ( = ?auto_30030 ?auto_30040 ) ) ( IS-CRATE ?auto_30031 ) ( SURFACE-AT ?auto_30031 ?auto_30038 ) ( ON ?auto_30031 ?auto_30043 ) ( CLEAR ?auto_30031 ) ( not ( = ?auto_30031 ?auto_30043 ) ) ( not ( = ?auto_30032 ?auto_30043 ) ) ( not ( = ?auto_30030 ?auto_30043 ) ) ( not ( = ?auto_30040 ?auto_30043 ) ) ( IS-CRATE ?auto_30030 ) ( not ( = ?auto_30029 ?auto_30030 ) ) ( not ( = ?auto_30031 ?auto_30029 ) ) ( not ( = ?auto_30032 ?auto_30029 ) ) ( not ( = ?auto_30040 ?auto_30029 ) ) ( not ( = ?auto_30043 ?auto_30029 ) ) ( not ( = ?auto_30036 ?auto_30042 ) ) ( not ( = ?auto_30038 ?auto_30036 ) ) ( HOIST-AT ?auto_30033 ?auto_30036 ) ( not ( = ?auto_30037 ?auto_30033 ) ) ( not ( = ?auto_30039 ?auto_30033 ) ) ( AVAILABLE ?auto_30033 ) ( SURFACE-AT ?auto_30030 ?auto_30036 ) ( ON ?auto_30030 ?auto_30035 ) ( CLEAR ?auto_30030 ) ( not ( = ?auto_30031 ?auto_30035 ) ) ( not ( = ?auto_30032 ?auto_30035 ) ) ( not ( = ?auto_30030 ?auto_30035 ) ) ( not ( = ?auto_30040 ?auto_30035 ) ) ( not ( = ?auto_30043 ?auto_30035 ) ) ( not ( = ?auto_30029 ?auto_30035 ) ) ( SURFACE-AT ?auto_30028 ?auto_30042 ) ( CLEAR ?auto_30028 ) ( IS-CRATE ?auto_30029 ) ( not ( = ?auto_30028 ?auto_30029 ) ) ( not ( = ?auto_30031 ?auto_30028 ) ) ( not ( = ?auto_30032 ?auto_30028 ) ) ( not ( = ?auto_30030 ?auto_30028 ) ) ( not ( = ?auto_30040 ?auto_30028 ) ) ( not ( = ?auto_30043 ?auto_30028 ) ) ( not ( = ?auto_30035 ?auto_30028 ) ) ( AVAILABLE ?auto_30037 ) ( AVAILABLE ?auto_30039 ) ( SURFACE-AT ?auto_30029 ?auto_30038 ) ( ON ?auto_30029 ?auto_30034 ) ( CLEAR ?auto_30029 ) ( not ( = ?auto_30031 ?auto_30034 ) ) ( not ( = ?auto_30032 ?auto_30034 ) ) ( not ( = ?auto_30030 ?auto_30034 ) ) ( not ( = ?auto_30040 ?auto_30034 ) ) ( not ( = ?auto_30043 ?auto_30034 ) ) ( not ( = ?auto_30029 ?auto_30034 ) ) ( not ( = ?auto_30035 ?auto_30034 ) ) ( not ( = ?auto_30028 ?auto_30034 ) ) ( TRUCK-AT ?auto_30041 ?auto_30042 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30030 ?auto_30031 ?auto_30032 )
      ( MAKE-4CRATE-VERIFY ?auto_30028 ?auto_30029 ?auto_30030 ?auto_30031 ?auto_30032 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30064 - SURFACE
      ?auto_30065 - SURFACE
    )
    :vars
    (
      ?auto_30066 - HOIST
      ?auto_30067 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30066 ?auto_30067 ) ( SURFACE-AT ?auto_30064 ?auto_30067 ) ( CLEAR ?auto_30064 ) ( LIFTING ?auto_30066 ?auto_30065 ) ( IS-CRATE ?auto_30065 ) ( not ( = ?auto_30064 ?auto_30065 ) ) )
    :subtasks
    ( ( !DROP ?auto_30066 ?auto_30065 ?auto_30064 ?auto_30067 )
      ( MAKE-1CRATE-VERIFY ?auto_30064 ?auto_30065 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30068 - SURFACE
      ?auto_30069 - SURFACE
      ?auto_30070 - SURFACE
    )
    :vars
    (
      ?auto_30072 - HOIST
      ?auto_30071 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30072 ?auto_30071 ) ( SURFACE-AT ?auto_30069 ?auto_30071 ) ( CLEAR ?auto_30069 ) ( LIFTING ?auto_30072 ?auto_30070 ) ( IS-CRATE ?auto_30070 ) ( not ( = ?auto_30069 ?auto_30070 ) ) ( ON ?auto_30069 ?auto_30068 ) ( not ( = ?auto_30068 ?auto_30069 ) ) ( not ( = ?auto_30068 ?auto_30070 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30069 ?auto_30070 )
      ( MAKE-2CRATE-VERIFY ?auto_30068 ?auto_30069 ?auto_30070 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30073 - SURFACE
      ?auto_30074 - SURFACE
      ?auto_30075 - SURFACE
      ?auto_30076 - SURFACE
    )
    :vars
    (
      ?auto_30078 - HOIST
      ?auto_30077 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30078 ?auto_30077 ) ( SURFACE-AT ?auto_30075 ?auto_30077 ) ( CLEAR ?auto_30075 ) ( LIFTING ?auto_30078 ?auto_30076 ) ( IS-CRATE ?auto_30076 ) ( not ( = ?auto_30075 ?auto_30076 ) ) ( ON ?auto_30074 ?auto_30073 ) ( ON ?auto_30075 ?auto_30074 ) ( not ( = ?auto_30073 ?auto_30074 ) ) ( not ( = ?auto_30073 ?auto_30075 ) ) ( not ( = ?auto_30073 ?auto_30076 ) ) ( not ( = ?auto_30074 ?auto_30075 ) ) ( not ( = ?auto_30074 ?auto_30076 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30075 ?auto_30076 )
      ( MAKE-3CRATE-VERIFY ?auto_30073 ?auto_30074 ?auto_30075 ?auto_30076 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30079 - SURFACE
      ?auto_30080 - SURFACE
      ?auto_30081 - SURFACE
      ?auto_30082 - SURFACE
      ?auto_30083 - SURFACE
    )
    :vars
    (
      ?auto_30085 - HOIST
      ?auto_30084 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30085 ?auto_30084 ) ( SURFACE-AT ?auto_30082 ?auto_30084 ) ( CLEAR ?auto_30082 ) ( LIFTING ?auto_30085 ?auto_30083 ) ( IS-CRATE ?auto_30083 ) ( not ( = ?auto_30082 ?auto_30083 ) ) ( ON ?auto_30080 ?auto_30079 ) ( ON ?auto_30081 ?auto_30080 ) ( ON ?auto_30082 ?auto_30081 ) ( not ( = ?auto_30079 ?auto_30080 ) ) ( not ( = ?auto_30079 ?auto_30081 ) ) ( not ( = ?auto_30079 ?auto_30082 ) ) ( not ( = ?auto_30079 ?auto_30083 ) ) ( not ( = ?auto_30080 ?auto_30081 ) ) ( not ( = ?auto_30080 ?auto_30082 ) ) ( not ( = ?auto_30080 ?auto_30083 ) ) ( not ( = ?auto_30081 ?auto_30082 ) ) ( not ( = ?auto_30081 ?auto_30083 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30082 ?auto_30083 )
      ( MAKE-4CRATE-VERIFY ?auto_30079 ?auto_30080 ?auto_30081 ?auto_30082 ?auto_30083 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30086 - SURFACE
      ?auto_30087 - SURFACE
      ?auto_30088 - SURFACE
      ?auto_30089 - SURFACE
      ?auto_30090 - SURFACE
      ?auto_30091 - SURFACE
    )
    :vars
    (
      ?auto_30093 - HOIST
      ?auto_30092 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30093 ?auto_30092 ) ( SURFACE-AT ?auto_30090 ?auto_30092 ) ( CLEAR ?auto_30090 ) ( LIFTING ?auto_30093 ?auto_30091 ) ( IS-CRATE ?auto_30091 ) ( not ( = ?auto_30090 ?auto_30091 ) ) ( ON ?auto_30087 ?auto_30086 ) ( ON ?auto_30088 ?auto_30087 ) ( ON ?auto_30089 ?auto_30088 ) ( ON ?auto_30090 ?auto_30089 ) ( not ( = ?auto_30086 ?auto_30087 ) ) ( not ( = ?auto_30086 ?auto_30088 ) ) ( not ( = ?auto_30086 ?auto_30089 ) ) ( not ( = ?auto_30086 ?auto_30090 ) ) ( not ( = ?auto_30086 ?auto_30091 ) ) ( not ( = ?auto_30087 ?auto_30088 ) ) ( not ( = ?auto_30087 ?auto_30089 ) ) ( not ( = ?auto_30087 ?auto_30090 ) ) ( not ( = ?auto_30087 ?auto_30091 ) ) ( not ( = ?auto_30088 ?auto_30089 ) ) ( not ( = ?auto_30088 ?auto_30090 ) ) ( not ( = ?auto_30088 ?auto_30091 ) ) ( not ( = ?auto_30089 ?auto_30090 ) ) ( not ( = ?auto_30089 ?auto_30091 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30090 ?auto_30091 )
      ( MAKE-5CRATE-VERIFY ?auto_30086 ?auto_30087 ?auto_30088 ?auto_30089 ?auto_30090 ?auto_30091 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30094 - SURFACE
      ?auto_30095 - SURFACE
    )
    :vars
    (
      ?auto_30097 - HOIST
      ?auto_30096 - PLACE
      ?auto_30098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30097 ?auto_30096 ) ( SURFACE-AT ?auto_30094 ?auto_30096 ) ( CLEAR ?auto_30094 ) ( IS-CRATE ?auto_30095 ) ( not ( = ?auto_30094 ?auto_30095 ) ) ( TRUCK-AT ?auto_30098 ?auto_30096 ) ( AVAILABLE ?auto_30097 ) ( IN ?auto_30095 ?auto_30098 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30097 ?auto_30095 ?auto_30098 ?auto_30096 )
      ( MAKE-1CRATE ?auto_30094 ?auto_30095 )
      ( MAKE-1CRATE-VERIFY ?auto_30094 ?auto_30095 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30099 - SURFACE
      ?auto_30100 - SURFACE
      ?auto_30101 - SURFACE
    )
    :vars
    (
      ?auto_30102 - HOIST
      ?auto_30103 - PLACE
      ?auto_30104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30102 ?auto_30103 ) ( SURFACE-AT ?auto_30100 ?auto_30103 ) ( CLEAR ?auto_30100 ) ( IS-CRATE ?auto_30101 ) ( not ( = ?auto_30100 ?auto_30101 ) ) ( TRUCK-AT ?auto_30104 ?auto_30103 ) ( AVAILABLE ?auto_30102 ) ( IN ?auto_30101 ?auto_30104 ) ( ON ?auto_30100 ?auto_30099 ) ( not ( = ?auto_30099 ?auto_30100 ) ) ( not ( = ?auto_30099 ?auto_30101 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30100 ?auto_30101 )
      ( MAKE-2CRATE-VERIFY ?auto_30099 ?auto_30100 ?auto_30101 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30105 - SURFACE
      ?auto_30106 - SURFACE
      ?auto_30107 - SURFACE
      ?auto_30108 - SURFACE
    )
    :vars
    (
      ?auto_30111 - HOIST
      ?auto_30110 - PLACE
      ?auto_30109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30111 ?auto_30110 ) ( SURFACE-AT ?auto_30107 ?auto_30110 ) ( CLEAR ?auto_30107 ) ( IS-CRATE ?auto_30108 ) ( not ( = ?auto_30107 ?auto_30108 ) ) ( TRUCK-AT ?auto_30109 ?auto_30110 ) ( AVAILABLE ?auto_30111 ) ( IN ?auto_30108 ?auto_30109 ) ( ON ?auto_30107 ?auto_30106 ) ( not ( = ?auto_30106 ?auto_30107 ) ) ( not ( = ?auto_30106 ?auto_30108 ) ) ( ON ?auto_30106 ?auto_30105 ) ( not ( = ?auto_30105 ?auto_30106 ) ) ( not ( = ?auto_30105 ?auto_30107 ) ) ( not ( = ?auto_30105 ?auto_30108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30106 ?auto_30107 ?auto_30108 )
      ( MAKE-3CRATE-VERIFY ?auto_30105 ?auto_30106 ?auto_30107 ?auto_30108 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30112 - SURFACE
      ?auto_30113 - SURFACE
      ?auto_30114 - SURFACE
      ?auto_30115 - SURFACE
      ?auto_30116 - SURFACE
    )
    :vars
    (
      ?auto_30119 - HOIST
      ?auto_30118 - PLACE
      ?auto_30117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30119 ?auto_30118 ) ( SURFACE-AT ?auto_30115 ?auto_30118 ) ( CLEAR ?auto_30115 ) ( IS-CRATE ?auto_30116 ) ( not ( = ?auto_30115 ?auto_30116 ) ) ( TRUCK-AT ?auto_30117 ?auto_30118 ) ( AVAILABLE ?auto_30119 ) ( IN ?auto_30116 ?auto_30117 ) ( ON ?auto_30115 ?auto_30114 ) ( not ( = ?auto_30114 ?auto_30115 ) ) ( not ( = ?auto_30114 ?auto_30116 ) ) ( ON ?auto_30113 ?auto_30112 ) ( ON ?auto_30114 ?auto_30113 ) ( not ( = ?auto_30112 ?auto_30113 ) ) ( not ( = ?auto_30112 ?auto_30114 ) ) ( not ( = ?auto_30112 ?auto_30115 ) ) ( not ( = ?auto_30112 ?auto_30116 ) ) ( not ( = ?auto_30113 ?auto_30114 ) ) ( not ( = ?auto_30113 ?auto_30115 ) ) ( not ( = ?auto_30113 ?auto_30116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30114 ?auto_30115 ?auto_30116 )
      ( MAKE-4CRATE-VERIFY ?auto_30112 ?auto_30113 ?auto_30114 ?auto_30115 ?auto_30116 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30120 - SURFACE
      ?auto_30121 - SURFACE
      ?auto_30122 - SURFACE
      ?auto_30123 - SURFACE
      ?auto_30124 - SURFACE
      ?auto_30125 - SURFACE
    )
    :vars
    (
      ?auto_30128 - HOIST
      ?auto_30127 - PLACE
      ?auto_30126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30128 ?auto_30127 ) ( SURFACE-AT ?auto_30124 ?auto_30127 ) ( CLEAR ?auto_30124 ) ( IS-CRATE ?auto_30125 ) ( not ( = ?auto_30124 ?auto_30125 ) ) ( TRUCK-AT ?auto_30126 ?auto_30127 ) ( AVAILABLE ?auto_30128 ) ( IN ?auto_30125 ?auto_30126 ) ( ON ?auto_30124 ?auto_30123 ) ( not ( = ?auto_30123 ?auto_30124 ) ) ( not ( = ?auto_30123 ?auto_30125 ) ) ( ON ?auto_30121 ?auto_30120 ) ( ON ?auto_30122 ?auto_30121 ) ( ON ?auto_30123 ?auto_30122 ) ( not ( = ?auto_30120 ?auto_30121 ) ) ( not ( = ?auto_30120 ?auto_30122 ) ) ( not ( = ?auto_30120 ?auto_30123 ) ) ( not ( = ?auto_30120 ?auto_30124 ) ) ( not ( = ?auto_30120 ?auto_30125 ) ) ( not ( = ?auto_30121 ?auto_30122 ) ) ( not ( = ?auto_30121 ?auto_30123 ) ) ( not ( = ?auto_30121 ?auto_30124 ) ) ( not ( = ?auto_30121 ?auto_30125 ) ) ( not ( = ?auto_30122 ?auto_30123 ) ) ( not ( = ?auto_30122 ?auto_30124 ) ) ( not ( = ?auto_30122 ?auto_30125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30123 ?auto_30124 ?auto_30125 )
      ( MAKE-5CRATE-VERIFY ?auto_30120 ?auto_30121 ?auto_30122 ?auto_30123 ?auto_30124 ?auto_30125 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30129 - SURFACE
      ?auto_30130 - SURFACE
    )
    :vars
    (
      ?auto_30133 - HOIST
      ?auto_30132 - PLACE
      ?auto_30131 - TRUCK
      ?auto_30134 - SURFACE
      ?auto_30135 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30133 ?auto_30132 ) ( SURFACE-AT ?auto_30129 ?auto_30132 ) ( CLEAR ?auto_30129 ) ( IS-CRATE ?auto_30130 ) ( not ( = ?auto_30129 ?auto_30130 ) ) ( AVAILABLE ?auto_30133 ) ( IN ?auto_30130 ?auto_30131 ) ( ON ?auto_30129 ?auto_30134 ) ( not ( = ?auto_30134 ?auto_30129 ) ) ( not ( = ?auto_30134 ?auto_30130 ) ) ( TRUCK-AT ?auto_30131 ?auto_30135 ) ( not ( = ?auto_30135 ?auto_30132 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30131 ?auto_30135 ?auto_30132 )
      ( MAKE-2CRATE ?auto_30134 ?auto_30129 ?auto_30130 )
      ( MAKE-1CRATE-VERIFY ?auto_30129 ?auto_30130 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30136 - SURFACE
      ?auto_30137 - SURFACE
      ?auto_30138 - SURFACE
    )
    :vars
    (
      ?auto_30141 - HOIST
      ?auto_30140 - PLACE
      ?auto_30142 - TRUCK
      ?auto_30139 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30141 ?auto_30140 ) ( SURFACE-AT ?auto_30137 ?auto_30140 ) ( CLEAR ?auto_30137 ) ( IS-CRATE ?auto_30138 ) ( not ( = ?auto_30137 ?auto_30138 ) ) ( AVAILABLE ?auto_30141 ) ( IN ?auto_30138 ?auto_30142 ) ( ON ?auto_30137 ?auto_30136 ) ( not ( = ?auto_30136 ?auto_30137 ) ) ( not ( = ?auto_30136 ?auto_30138 ) ) ( TRUCK-AT ?auto_30142 ?auto_30139 ) ( not ( = ?auto_30139 ?auto_30140 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30137 ?auto_30138 )
      ( MAKE-2CRATE-VERIFY ?auto_30136 ?auto_30137 ?auto_30138 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30143 - SURFACE
      ?auto_30144 - SURFACE
      ?auto_30145 - SURFACE
      ?auto_30146 - SURFACE
    )
    :vars
    (
      ?auto_30149 - HOIST
      ?auto_30148 - PLACE
      ?auto_30147 - TRUCK
      ?auto_30150 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30149 ?auto_30148 ) ( SURFACE-AT ?auto_30145 ?auto_30148 ) ( CLEAR ?auto_30145 ) ( IS-CRATE ?auto_30146 ) ( not ( = ?auto_30145 ?auto_30146 ) ) ( AVAILABLE ?auto_30149 ) ( IN ?auto_30146 ?auto_30147 ) ( ON ?auto_30145 ?auto_30144 ) ( not ( = ?auto_30144 ?auto_30145 ) ) ( not ( = ?auto_30144 ?auto_30146 ) ) ( TRUCK-AT ?auto_30147 ?auto_30150 ) ( not ( = ?auto_30150 ?auto_30148 ) ) ( ON ?auto_30144 ?auto_30143 ) ( not ( = ?auto_30143 ?auto_30144 ) ) ( not ( = ?auto_30143 ?auto_30145 ) ) ( not ( = ?auto_30143 ?auto_30146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30144 ?auto_30145 ?auto_30146 )
      ( MAKE-3CRATE-VERIFY ?auto_30143 ?auto_30144 ?auto_30145 ?auto_30146 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30151 - SURFACE
      ?auto_30152 - SURFACE
      ?auto_30153 - SURFACE
      ?auto_30154 - SURFACE
      ?auto_30155 - SURFACE
    )
    :vars
    (
      ?auto_30158 - HOIST
      ?auto_30157 - PLACE
      ?auto_30156 - TRUCK
      ?auto_30159 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30158 ?auto_30157 ) ( SURFACE-AT ?auto_30154 ?auto_30157 ) ( CLEAR ?auto_30154 ) ( IS-CRATE ?auto_30155 ) ( not ( = ?auto_30154 ?auto_30155 ) ) ( AVAILABLE ?auto_30158 ) ( IN ?auto_30155 ?auto_30156 ) ( ON ?auto_30154 ?auto_30153 ) ( not ( = ?auto_30153 ?auto_30154 ) ) ( not ( = ?auto_30153 ?auto_30155 ) ) ( TRUCK-AT ?auto_30156 ?auto_30159 ) ( not ( = ?auto_30159 ?auto_30157 ) ) ( ON ?auto_30152 ?auto_30151 ) ( ON ?auto_30153 ?auto_30152 ) ( not ( = ?auto_30151 ?auto_30152 ) ) ( not ( = ?auto_30151 ?auto_30153 ) ) ( not ( = ?auto_30151 ?auto_30154 ) ) ( not ( = ?auto_30151 ?auto_30155 ) ) ( not ( = ?auto_30152 ?auto_30153 ) ) ( not ( = ?auto_30152 ?auto_30154 ) ) ( not ( = ?auto_30152 ?auto_30155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30153 ?auto_30154 ?auto_30155 )
      ( MAKE-4CRATE-VERIFY ?auto_30151 ?auto_30152 ?auto_30153 ?auto_30154 ?auto_30155 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30160 - SURFACE
      ?auto_30161 - SURFACE
      ?auto_30162 - SURFACE
      ?auto_30163 - SURFACE
      ?auto_30164 - SURFACE
      ?auto_30165 - SURFACE
    )
    :vars
    (
      ?auto_30168 - HOIST
      ?auto_30167 - PLACE
      ?auto_30166 - TRUCK
      ?auto_30169 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30168 ?auto_30167 ) ( SURFACE-AT ?auto_30164 ?auto_30167 ) ( CLEAR ?auto_30164 ) ( IS-CRATE ?auto_30165 ) ( not ( = ?auto_30164 ?auto_30165 ) ) ( AVAILABLE ?auto_30168 ) ( IN ?auto_30165 ?auto_30166 ) ( ON ?auto_30164 ?auto_30163 ) ( not ( = ?auto_30163 ?auto_30164 ) ) ( not ( = ?auto_30163 ?auto_30165 ) ) ( TRUCK-AT ?auto_30166 ?auto_30169 ) ( not ( = ?auto_30169 ?auto_30167 ) ) ( ON ?auto_30161 ?auto_30160 ) ( ON ?auto_30162 ?auto_30161 ) ( ON ?auto_30163 ?auto_30162 ) ( not ( = ?auto_30160 ?auto_30161 ) ) ( not ( = ?auto_30160 ?auto_30162 ) ) ( not ( = ?auto_30160 ?auto_30163 ) ) ( not ( = ?auto_30160 ?auto_30164 ) ) ( not ( = ?auto_30160 ?auto_30165 ) ) ( not ( = ?auto_30161 ?auto_30162 ) ) ( not ( = ?auto_30161 ?auto_30163 ) ) ( not ( = ?auto_30161 ?auto_30164 ) ) ( not ( = ?auto_30161 ?auto_30165 ) ) ( not ( = ?auto_30162 ?auto_30163 ) ) ( not ( = ?auto_30162 ?auto_30164 ) ) ( not ( = ?auto_30162 ?auto_30165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30163 ?auto_30164 ?auto_30165 )
      ( MAKE-5CRATE-VERIFY ?auto_30160 ?auto_30161 ?auto_30162 ?auto_30163 ?auto_30164 ?auto_30165 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30170 - SURFACE
      ?auto_30171 - SURFACE
    )
    :vars
    (
      ?auto_30175 - HOIST
      ?auto_30174 - PLACE
      ?auto_30172 - SURFACE
      ?auto_30173 - TRUCK
      ?auto_30176 - PLACE
      ?auto_30177 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30175 ?auto_30174 ) ( SURFACE-AT ?auto_30170 ?auto_30174 ) ( CLEAR ?auto_30170 ) ( IS-CRATE ?auto_30171 ) ( not ( = ?auto_30170 ?auto_30171 ) ) ( AVAILABLE ?auto_30175 ) ( ON ?auto_30170 ?auto_30172 ) ( not ( = ?auto_30172 ?auto_30170 ) ) ( not ( = ?auto_30172 ?auto_30171 ) ) ( TRUCK-AT ?auto_30173 ?auto_30176 ) ( not ( = ?auto_30176 ?auto_30174 ) ) ( HOIST-AT ?auto_30177 ?auto_30176 ) ( LIFTING ?auto_30177 ?auto_30171 ) ( not ( = ?auto_30175 ?auto_30177 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30177 ?auto_30171 ?auto_30173 ?auto_30176 )
      ( MAKE-2CRATE ?auto_30172 ?auto_30170 ?auto_30171 )
      ( MAKE-1CRATE-VERIFY ?auto_30170 ?auto_30171 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30178 - SURFACE
      ?auto_30179 - SURFACE
      ?auto_30180 - SURFACE
    )
    :vars
    (
      ?auto_30181 - HOIST
      ?auto_30182 - PLACE
      ?auto_30183 - TRUCK
      ?auto_30184 - PLACE
      ?auto_30185 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30181 ?auto_30182 ) ( SURFACE-AT ?auto_30179 ?auto_30182 ) ( CLEAR ?auto_30179 ) ( IS-CRATE ?auto_30180 ) ( not ( = ?auto_30179 ?auto_30180 ) ) ( AVAILABLE ?auto_30181 ) ( ON ?auto_30179 ?auto_30178 ) ( not ( = ?auto_30178 ?auto_30179 ) ) ( not ( = ?auto_30178 ?auto_30180 ) ) ( TRUCK-AT ?auto_30183 ?auto_30184 ) ( not ( = ?auto_30184 ?auto_30182 ) ) ( HOIST-AT ?auto_30185 ?auto_30184 ) ( LIFTING ?auto_30185 ?auto_30180 ) ( not ( = ?auto_30181 ?auto_30185 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30179 ?auto_30180 )
      ( MAKE-2CRATE-VERIFY ?auto_30178 ?auto_30179 ?auto_30180 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30186 - SURFACE
      ?auto_30187 - SURFACE
      ?auto_30188 - SURFACE
      ?auto_30189 - SURFACE
    )
    :vars
    (
      ?auto_30192 - HOIST
      ?auto_30194 - PLACE
      ?auto_30193 - TRUCK
      ?auto_30190 - PLACE
      ?auto_30191 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30192 ?auto_30194 ) ( SURFACE-AT ?auto_30188 ?auto_30194 ) ( CLEAR ?auto_30188 ) ( IS-CRATE ?auto_30189 ) ( not ( = ?auto_30188 ?auto_30189 ) ) ( AVAILABLE ?auto_30192 ) ( ON ?auto_30188 ?auto_30187 ) ( not ( = ?auto_30187 ?auto_30188 ) ) ( not ( = ?auto_30187 ?auto_30189 ) ) ( TRUCK-AT ?auto_30193 ?auto_30190 ) ( not ( = ?auto_30190 ?auto_30194 ) ) ( HOIST-AT ?auto_30191 ?auto_30190 ) ( LIFTING ?auto_30191 ?auto_30189 ) ( not ( = ?auto_30192 ?auto_30191 ) ) ( ON ?auto_30187 ?auto_30186 ) ( not ( = ?auto_30186 ?auto_30187 ) ) ( not ( = ?auto_30186 ?auto_30188 ) ) ( not ( = ?auto_30186 ?auto_30189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30187 ?auto_30188 ?auto_30189 )
      ( MAKE-3CRATE-VERIFY ?auto_30186 ?auto_30187 ?auto_30188 ?auto_30189 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30195 - SURFACE
      ?auto_30196 - SURFACE
      ?auto_30197 - SURFACE
      ?auto_30198 - SURFACE
      ?auto_30199 - SURFACE
    )
    :vars
    (
      ?auto_30202 - HOIST
      ?auto_30204 - PLACE
      ?auto_30203 - TRUCK
      ?auto_30200 - PLACE
      ?auto_30201 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30202 ?auto_30204 ) ( SURFACE-AT ?auto_30198 ?auto_30204 ) ( CLEAR ?auto_30198 ) ( IS-CRATE ?auto_30199 ) ( not ( = ?auto_30198 ?auto_30199 ) ) ( AVAILABLE ?auto_30202 ) ( ON ?auto_30198 ?auto_30197 ) ( not ( = ?auto_30197 ?auto_30198 ) ) ( not ( = ?auto_30197 ?auto_30199 ) ) ( TRUCK-AT ?auto_30203 ?auto_30200 ) ( not ( = ?auto_30200 ?auto_30204 ) ) ( HOIST-AT ?auto_30201 ?auto_30200 ) ( LIFTING ?auto_30201 ?auto_30199 ) ( not ( = ?auto_30202 ?auto_30201 ) ) ( ON ?auto_30196 ?auto_30195 ) ( ON ?auto_30197 ?auto_30196 ) ( not ( = ?auto_30195 ?auto_30196 ) ) ( not ( = ?auto_30195 ?auto_30197 ) ) ( not ( = ?auto_30195 ?auto_30198 ) ) ( not ( = ?auto_30195 ?auto_30199 ) ) ( not ( = ?auto_30196 ?auto_30197 ) ) ( not ( = ?auto_30196 ?auto_30198 ) ) ( not ( = ?auto_30196 ?auto_30199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30197 ?auto_30198 ?auto_30199 )
      ( MAKE-4CRATE-VERIFY ?auto_30195 ?auto_30196 ?auto_30197 ?auto_30198 ?auto_30199 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30205 - SURFACE
      ?auto_30206 - SURFACE
      ?auto_30207 - SURFACE
      ?auto_30208 - SURFACE
      ?auto_30209 - SURFACE
      ?auto_30210 - SURFACE
    )
    :vars
    (
      ?auto_30213 - HOIST
      ?auto_30215 - PLACE
      ?auto_30214 - TRUCK
      ?auto_30211 - PLACE
      ?auto_30212 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30213 ?auto_30215 ) ( SURFACE-AT ?auto_30209 ?auto_30215 ) ( CLEAR ?auto_30209 ) ( IS-CRATE ?auto_30210 ) ( not ( = ?auto_30209 ?auto_30210 ) ) ( AVAILABLE ?auto_30213 ) ( ON ?auto_30209 ?auto_30208 ) ( not ( = ?auto_30208 ?auto_30209 ) ) ( not ( = ?auto_30208 ?auto_30210 ) ) ( TRUCK-AT ?auto_30214 ?auto_30211 ) ( not ( = ?auto_30211 ?auto_30215 ) ) ( HOIST-AT ?auto_30212 ?auto_30211 ) ( LIFTING ?auto_30212 ?auto_30210 ) ( not ( = ?auto_30213 ?auto_30212 ) ) ( ON ?auto_30206 ?auto_30205 ) ( ON ?auto_30207 ?auto_30206 ) ( ON ?auto_30208 ?auto_30207 ) ( not ( = ?auto_30205 ?auto_30206 ) ) ( not ( = ?auto_30205 ?auto_30207 ) ) ( not ( = ?auto_30205 ?auto_30208 ) ) ( not ( = ?auto_30205 ?auto_30209 ) ) ( not ( = ?auto_30205 ?auto_30210 ) ) ( not ( = ?auto_30206 ?auto_30207 ) ) ( not ( = ?auto_30206 ?auto_30208 ) ) ( not ( = ?auto_30206 ?auto_30209 ) ) ( not ( = ?auto_30206 ?auto_30210 ) ) ( not ( = ?auto_30207 ?auto_30208 ) ) ( not ( = ?auto_30207 ?auto_30209 ) ) ( not ( = ?auto_30207 ?auto_30210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30208 ?auto_30209 ?auto_30210 )
      ( MAKE-5CRATE-VERIFY ?auto_30205 ?auto_30206 ?auto_30207 ?auto_30208 ?auto_30209 ?auto_30210 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30216 - SURFACE
      ?auto_30217 - SURFACE
    )
    :vars
    (
      ?auto_30221 - HOIST
      ?auto_30223 - PLACE
      ?auto_30220 - SURFACE
      ?auto_30222 - TRUCK
      ?auto_30218 - PLACE
      ?auto_30219 - HOIST
      ?auto_30224 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30221 ?auto_30223 ) ( SURFACE-AT ?auto_30216 ?auto_30223 ) ( CLEAR ?auto_30216 ) ( IS-CRATE ?auto_30217 ) ( not ( = ?auto_30216 ?auto_30217 ) ) ( AVAILABLE ?auto_30221 ) ( ON ?auto_30216 ?auto_30220 ) ( not ( = ?auto_30220 ?auto_30216 ) ) ( not ( = ?auto_30220 ?auto_30217 ) ) ( TRUCK-AT ?auto_30222 ?auto_30218 ) ( not ( = ?auto_30218 ?auto_30223 ) ) ( HOIST-AT ?auto_30219 ?auto_30218 ) ( not ( = ?auto_30221 ?auto_30219 ) ) ( AVAILABLE ?auto_30219 ) ( SURFACE-AT ?auto_30217 ?auto_30218 ) ( ON ?auto_30217 ?auto_30224 ) ( CLEAR ?auto_30217 ) ( not ( = ?auto_30216 ?auto_30224 ) ) ( not ( = ?auto_30217 ?auto_30224 ) ) ( not ( = ?auto_30220 ?auto_30224 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30219 ?auto_30217 ?auto_30224 ?auto_30218 )
      ( MAKE-2CRATE ?auto_30220 ?auto_30216 ?auto_30217 )
      ( MAKE-1CRATE-VERIFY ?auto_30216 ?auto_30217 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30225 - SURFACE
      ?auto_30226 - SURFACE
      ?auto_30227 - SURFACE
    )
    :vars
    (
      ?auto_30228 - HOIST
      ?auto_30232 - PLACE
      ?auto_30231 - TRUCK
      ?auto_30229 - PLACE
      ?auto_30233 - HOIST
      ?auto_30230 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30228 ?auto_30232 ) ( SURFACE-AT ?auto_30226 ?auto_30232 ) ( CLEAR ?auto_30226 ) ( IS-CRATE ?auto_30227 ) ( not ( = ?auto_30226 ?auto_30227 ) ) ( AVAILABLE ?auto_30228 ) ( ON ?auto_30226 ?auto_30225 ) ( not ( = ?auto_30225 ?auto_30226 ) ) ( not ( = ?auto_30225 ?auto_30227 ) ) ( TRUCK-AT ?auto_30231 ?auto_30229 ) ( not ( = ?auto_30229 ?auto_30232 ) ) ( HOIST-AT ?auto_30233 ?auto_30229 ) ( not ( = ?auto_30228 ?auto_30233 ) ) ( AVAILABLE ?auto_30233 ) ( SURFACE-AT ?auto_30227 ?auto_30229 ) ( ON ?auto_30227 ?auto_30230 ) ( CLEAR ?auto_30227 ) ( not ( = ?auto_30226 ?auto_30230 ) ) ( not ( = ?auto_30227 ?auto_30230 ) ) ( not ( = ?auto_30225 ?auto_30230 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30226 ?auto_30227 )
      ( MAKE-2CRATE-VERIFY ?auto_30225 ?auto_30226 ?auto_30227 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30234 - SURFACE
      ?auto_30235 - SURFACE
      ?auto_30236 - SURFACE
      ?auto_30237 - SURFACE
    )
    :vars
    (
      ?auto_30241 - HOIST
      ?auto_30239 - PLACE
      ?auto_30240 - TRUCK
      ?auto_30238 - PLACE
      ?auto_30243 - HOIST
      ?auto_30242 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30241 ?auto_30239 ) ( SURFACE-AT ?auto_30236 ?auto_30239 ) ( CLEAR ?auto_30236 ) ( IS-CRATE ?auto_30237 ) ( not ( = ?auto_30236 ?auto_30237 ) ) ( AVAILABLE ?auto_30241 ) ( ON ?auto_30236 ?auto_30235 ) ( not ( = ?auto_30235 ?auto_30236 ) ) ( not ( = ?auto_30235 ?auto_30237 ) ) ( TRUCK-AT ?auto_30240 ?auto_30238 ) ( not ( = ?auto_30238 ?auto_30239 ) ) ( HOIST-AT ?auto_30243 ?auto_30238 ) ( not ( = ?auto_30241 ?auto_30243 ) ) ( AVAILABLE ?auto_30243 ) ( SURFACE-AT ?auto_30237 ?auto_30238 ) ( ON ?auto_30237 ?auto_30242 ) ( CLEAR ?auto_30237 ) ( not ( = ?auto_30236 ?auto_30242 ) ) ( not ( = ?auto_30237 ?auto_30242 ) ) ( not ( = ?auto_30235 ?auto_30242 ) ) ( ON ?auto_30235 ?auto_30234 ) ( not ( = ?auto_30234 ?auto_30235 ) ) ( not ( = ?auto_30234 ?auto_30236 ) ) ( not ( = ?auto_30234 ?auto_30237 ) ) ( not ( = ?auto_30234 ?auto_30242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30235 ?auto_30236 ?auto_30237 )
      ( MAKE-3CRATE-VERIFY ?auto_30234 ?auto_30235 ?auto_30236 ?auto_30237 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30244 - SURFACE
      ?auto_30245 - SURFACE
      ?auto_30246 - SURFACE
      ?auto_30247 - SURFACE
      ?auto_30248 - SURFACE
    )
    :vars
    (
      ?auto_30252 - HOIST
      ?auto_30250 - PLACE
      ?auto_30251 - TRUCK
      ?auto_30249 - PLACE
      ?auto_30254 - HOIST
      ?auto_30253 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30252 ?auto_30250 ) ( SURFACE-AT ?auto_30247 ?auto_30250 ) ( CLEAR ?auto_30247 ) ( IS-CRATE ?auto_30248 ) ( not ( = ?auto_30247 ?auto_30248 ) ) ( AVAILABLE ?auto_30252 ) ( ON ?auto_30247 ?auto_30246 ) ( not ( = ?auto_30246 ?auto_30247 ) ) ( not ( = ?auto_30246 ?auto_30248 ) ) ( TRUCK-AT ?auto_30251 ?auto_30249 ) ( not ( = ?auto_30249 ?auto_30250 ) ) ( HOIST-AT ?auto_30254 ?auto_30249 ) ( not ( = ?auto_30252 ?auto_30254 ) ) ( AVAILABLE ?auto_30254 ) ( SURFACE-AT ?auto_30248 ?auto_30249 ) ( ON ?auto_30248 ?auto_30253 ) ( CLEAR ?auto_30248 ) ( not ( = ?auto_30247 ?auto_30253 ) ) ( not ( = ?auto_30248 ?auto_30253 ) ) ( not ( = ?auto_30246 ?auto_30253 ) ) ( ON ?auto_30245 ?auto_30244 ) ( ON ?auto_30246 ?auto_30245 ) ( not ( = ?auto_30244 ?auto_30245 ) ) ( not ( = ?auto_30244 ?auto_30246 ) ) ( not ( = ?auto_30244 ?auto_30247 ) ) ( not ( = ?auto_30244 ?auto_30248 ) ) ( not ( = ?auto_30244 ?auto_30253 ) ) ( not ( = ?auto_30245 ?auto_30246 ) ) ( not ( = ?auto_30245 ?auto_30247 ) ) ( not ( = ?auto_30245 ?auto_30248 ) ) ( not ( = ?auto_30245 ?auto_30253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30246 ?auto_30247 ?auto_30248 )
      ( MAKE-4CRATE-VERIFY ?auto_30244 ?auto_30245 ?auto_30246 ?auto_30247 ?auto_30248 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30255 - SURFACE
      ?auto_30256 - SURFACE
      ?auto_30257 - SURFACE
      ?auto_30258 - SURFACE
      ?auto_30259 - SURFACE
      ?auto_30260 - SURFACE
    )
    :vars
    (
      ?auto_30264 - HOIST
      ?auto_30262 - PLACE
      ?auto_30263 - TRUCK
      ?auto_30261 - PLACE
      ?auto_30266 - HOIST
      ?auto_30265 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30264 ?auto_30262 ) ( SURFACE-AT ?auto_30259 ?auto_30262 ) ( CLEAR ?auto_30259 ) ( IS-CRATE ?auto_30260 ) ( not ( = ?auto_30259 ?auto_30260 ) ) ( AVAILABLE ?auto_30264 ) ( ON ?auto_30259 ?auto_30258 ) ( not ( = ?auto_30258 ?auto_30259 ) ) ( not ( = ?auto_30258 ?auto_30260 ) ) ( TRUCK-AT ?auto_30263 ?auto_30261 ) ( not ( = ?auto_30261 ?auto_30262 ) ) ( HOIST-AT ?auto_30266 ?auto_30261 ) ( not ( = ?auto_30264 ?auto_30266 ) ) ( AVAILABLE ?auto_30266 ) ( SURFACE-AT ?auto_30260 ?auto_30261 ) ( ON ?auto_30260 ?auto_30265 ) ( CLEAR ?auto_30260 ) ( not ( = ?auto_30259 ?auto_30265 ) ) ( not ( = ?auto_30260 ?auto_30265 ) ) ( not ( = ?auto_30258 ?auto_30265 ) ) ( ON ?auto_30256 ?auto_30255 ) ( ON ?auto_30257 ?auto_30256 ) ( ON ?auto_30258 ?auto_30257 ) ( not ( = ?auto_30255 ?auto_30256 ) ) ( not ( = ?auto_30255 ?auto_30257 ) ) ( not ( = ?auto_30255 ?auto_30258 ) ) ( not ( = ?auto_30255 ?auto_30259 ) ) ( not ( = ?auto_30255 ?auto_30260 ) ) ( not ( = ?auto_30255 ?auto_30265 ) ) ( not ( = ?auto_30256 ?auto_30257 ) ) ( not ( = ?auto_30256 ?auto_30258 ) ) ( not ( = ?auto_30256 ?auto_30259 ) ) ( not ( = ?auto_30256 ?auto_30260 ) ) ( not ( = ?auto_30256 ?auto_30265 ) ) ( not ( = ?auto_30257 ?auto_30258 ) ) ( not ( = ?auto_30257 ?auto_30259 ) ) ( not ( = ?auto_30257 ?auto_30260 ) ) ( not ( = ?auto_30257 ?auto_30265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30258 ?auto_30259 ?auto_30260 )
      ( MAKE-5CRATE-VERIFY ?auto_30255 ?auto_30256 ?auto_30257 ?auto_30258 ?auto_30259 ?auto_30260 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30267 - SURFACE
      ?auto_30268 - SURFACE
    )
    :vars
    (
      ?auto_30272 - HOIST
      ?auto_30270 - PLACE
      ?auto_30275 - SURFACE
      ?auto_30269 - PLACE
      ?auto_30274 - HOIST
      ?auto_30273 - SURFACE
      ?auto_30271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30272 ?auto_30270 ) ( SURFACE-AT ?auto_30267 ?auto_30270 ) ( CLEAR ?auto_30267 ) ( IS-CRATE ?auto_30268 ) ( not ( = ?auto_30267 ?auto_30268 ) ) ( AVAILABLE ?auto_30272 ) ( ON ?auto_30267 ?auto_30275 ) ( not ( = ?auto_30275 ?auto_30267 ) ) ( not ( = ?auto_30275 ?auto_30268 ) ) ( not ( = ?auto_30269 ?auto_30270 ) ) ( HOIST-AT ?auto_30274 ?auto_30269 ) ( not ( = ?auto_30272 ?auto_30274 ) ) ( AVAILABLE ?auto_30274 ) ( SURFACE-AT ?auto_30268 ?auto_30269 ) ( ON ?auto_30268 ?auto_30273 ) ( CLEAR ?auto_30268 ) ( not ( = ?auto_30267 ?auto_30273 ) ) ( not ( = ?auto_30268 ?auto_30273 ) ) ( not ( = ?auto_30275 ?auto_30273 ) ) ( TRUCK-AT ?auto_30271 ?auto_30270 ) )
    :subtasks
    ( ( !DRIVE ?auto_30271 ?auto_30270 ?auto_30269 )
      ( MAKE-2CRATE ?auto_30275 ?auto_30267 ?auto_30268 )
      ( MAKE-1CRATE-VERIFY ?auto_30267 ?auto_30268 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30276 - SURFACE
      ?auto_30277 - SURFACE
      ?auto_30278 - SURFACE
    )
    :vars
    (
      ?auto_30282 - HOIST
      ?auto_30279 - PLACE
      ?auto_30281 - PLACE
      ?auto_30284 - HOIST
      ?auto_30280 - SURFACE
      ?auto_30283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30282 ?auto_30279 ) ( SURFACE-AT ?auto_30277 ?auto_30279 ) ( CLEAR ?auto_30277 ) ( IS-CRATE ?auto_30278 ) ( not ( = ?auto_30277 ?auto_30278 ) ) ( AVAILABLE ?auto_30282 ) ( ON ?auto_30277 ?auto_30276 ) ( not ( = ?auto_30276 ?auto_30277 ) ) ( not ( = ?auto_30276 ?auto_30278 ) ) ( not ( = ?auto_30281 ?auto_30279 ) ) ( HOIST-AT ?auto_30284 ?auto_30281 ) ( not ( = ?auto_30282 ?auto_30284 ) ) ( AVAILABLE ?auto_30284 ) ( SURFACE-AT ?auto_30278 ?auto_30281 ) ( ON ?auto_30278 ?auto_30280 ) ( CLEAR ?auto_30278 ) ( not ( = ?auto_30277 ?auto_30280 ) ) ( not ( = ?auto_30278 ?auto_30280 ) ) ( not ( = ?auto_30276 ?auto_30280 ) ) ( TRUCK-AT ?auto_30283 ?auto_30279 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30277 ?auto_30278 )
      ( MAKE-2CRATE-VERIFY ?auto_30276 ?auto_30277 ?auto_30278 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30285 - SURFACE
      ?auto_30286 - SURFACE
      ?auto_30287 - SURFACE
      ?auto_30288 - SURFACE
    )
    :vars
    (
      ?auto_30289 - HOIST
      ?auto_30291 - PLACE
      ?auto_30292 - PLACE
      ?auto_30294 - HOIST
      ?auto_30293 - SURFACE
      ?auto_30290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30289 ?auto_30291 ) ( SURFACE-AT ?auto_30287 ?auto_30291 ) ( CLEAR ?auto_30287 ) ( IS-CRATE ?auto_30288 ) ( not ( = ?auto_30287 ?auto_30288 ) ) ( AVAILABLE ?auto_30289 ) ( ON ?auto_30287 ?auto_30286 ) ( not ( = ?auto_30286 ?auto_30287 ) ) ( not ( = ?auto_30286 ?auto_30288 ) ) ( not ( = ?auto_30292 ?auto_30291 ) ) ( HOIST-AT ?auto_30294 ?auto_30292 ) ( not ( = ?auto_30289 ?auto_30294 ) ) ( AVAILABLE ?auto_30294 ) ( SURFACE-AT ?auto_30288 ?auto_30292 ) ( ON ?auto_30288 ?auto_30293 ) ( CLEAR ?auto_30288 ) ( not ( = ?auto_30287 ?auto_30293 ) ) ( not ( = ?auto_30288 ?auto_30293 ) ) ( not ( = ?auto_30286 ?auto_30293 ) ) ( TRUCK-AT ?auto_30290 ?auto_30291 ) ( ON ?auto_30286 ?auto_30285 ) ( not ( = ?auto_30285 ?auto_30286 ) ) ( not ( = ?auto_30285 ?auto_30287 ) ) ( not ( = ?auto_30285 ?auto_30288 ) ) ( not ( = ?auto_30285 ?auto_30293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30286 ?auto_30287 ?auto_30288 )
      ( MAKE-3CRATE-VERIFY ?auto_30285 ?auto_30286 ?auto_30287 ?auto_30288 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30295 - SURFACE
      ?auto_30296 - SURFACE
      ?auto_30297 - SURFACE
      ?auto_30298 - SURFACE
      ?auto_30299 - SURFACE
    )
    :vars
    (
      ?auto_30300 - HOIST
      ?auto_30302 - PLACE
      ?auto_30303 - PLACE
      ?auto_30305 - HOIST
      ?auto_30304 - SURFACE
      ?auto_30301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30300 ?auto_30302 ) ( SURFACE-AT ?auto_30298 ?auto_30302 ) ( CLEAR ?auto_30298 ) ( IS-CRATE ?auto_30299 ) ( not ( = ?auto_30298 ?auto_30299 ) ) ( AVAILABLE ?auto_30300 ) ( ON ?auto_30298 ?auto_30297 ) ( not ( = ?auto_30297 ?auto_30298 ) ) ( not ( = ?auto_30297 ?auto_30299 ) ) ( not ( = ?auto_30303 ?auto_30302 ) ) ( HOIST-AT ?auto_30305 ?auto_30303 ) ( not ( = ?auto_30300 ?auto_30305 ) ) ( AVAILABLE ?auto_30305 ) ( SURFACE-AT ?auto_30299 ?auto_30303 ) ( ON ?auto_30299 ?auto_30304 ) ( CLEAR ?auto_30299 ) ( not ( = ?auto_30298 ?auto_30304 ) ) ( not ( = ?auto_30299 ?auto_30304 ) ) ( not ( = ?auto_30297 ?auto_30304 ) ) ( TRUCK-AT ?auto_30301 ?auto_30302 ) ( ON ?auto_30296 ?auto_30295 ) ( ON ?auto_30297 ?auto_30296 ) ( not ( = ?auto_30295 ?auto_30296 ) ) ( not ( = ?auto_30295 ?auto_30297 ) ) ( not ( = ?auto_30295 ?auto_30298 ) ) ( not ( = ?auto_30295 ?auto_30299 ) ) ( not ( = ?auto_30295 ?auto_30304 ) ) ( not ( = ?auto_30296 ?auto_30297 ) ) ( not ( = ?auto_30296 ?auto_30298 ) ) ( not ( = ?auto_30296 ?auto_30299 ) ) ( not ( = ?auto_30296 ?auto_30304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30297 ?auto_30298 ?auto_30299 )
      ( MAKE-4CRATE-VERIFY ?auto_30295 ?auto_30296 ?auto_30297 ?auto_30298 ?auto_30299 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30306 - SURFACE
      ?auto_30307 - SURFACE
      ?auto_30308 - SURFACE
      ?auto_30309 - SURFACE
      ?auto_30310 - SURFACE
      ?auto_30311 - SURFACE
    )
    :vars
    (
      ?auto_30312 - HOIST
      ?auto_30314 - PLACE
      ?auto_30315 - PLACE
      ?auto_30317 - HOIST
      ?auto_30316 - SURFACE
      ?auto_30313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30312 ?auto_30314 ) ( SURFACE-AT ?auto_30310 ?auto_30314 ) ( CLEAR ?auto_30310 ) ( IS-CRATE ?auto_30311 ) ( not ( = ?auto_30310 ?auto_30311 ) ) ( AVAILABLE ?auto_30312 ) ( ON ?auto_30310 ?auto_30309 ) ( not ( = ?auto_30309 ?auto_30310 ) ) ( not ( = ?auto_30309 ?auto_30311 ) ) ( not ( = ?auto_30315 ?auto_30314 ) ) ( HOIST-AT ?auto_30317 ?auto_30315 ) ( not ( = ?auto_30312 ?auto_30317 ) ) ( AVAILABLE ?auto_30317 ) ( SURFACE-AT ?auto_30311 ?auto_30315 ) ( ON ?auto_30311 ?auto_30316 ) ( CLEAR ?auto_30311 ) ( not ( = ?auto_30310 ?auto_30316 ) ) ( not ( = ?auto_30311 ?auto_30316 ) ) ( not ( = ?auto_30309 ?auto_30316 ) ) ( TRUCK-AT ?auto_30313 ?auto_30314 ) ( ON ?auto_30307 ?auto_30306 ) ( ON ?auto_30308 ?auto_30307 ) ( ON ?auto_30309 ?auto_30308 ) ( not ( = ?auto_30306 ?auto_30307 ) ) ( not ( = ?auto_30306 ?auto_30308 ) ) ( not ( = ?auto_30306 ?auto_30309 ) ) ( not ( = ?auto_30306 ?auto_30310 ) ) ( not ( = ?auto_30306 ?auto_30311 ) ) ( not ( = ?auto_30306 ?auto_30316 ) ) ( not ( = ?auto_30307 ?auto_30308 ) ) ( not ( = ?auto_30307 ?auto_30309 ) ) ( not ( = ?auto_30307 ?auto_30310 ) ) ( not ( = ?auto_30307 ?auto_30311 ) ) ( not ( = ?auto_30307 ?auto_30316 ) ) ( not ( = ?auto_30308 ?auto_30309 ) ) ( not ( = ?auto_30308 ?auto_30310 ) ) ( not ( = ?auto_30308 ?auto_30311 ) ) ( not ( = ?auto_30308 ?auto_30316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30309 ?auto_30310 ?auto_30311 )
      ( MAKE-5CRATE-VERIFY ?auto_30306 ?auto_30307 ?auto_30308 ?auto_30309 ?auto_30310 ?auto_30311 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30318 - SURFACE
      ?auto_30319 - SURFACE
    )
    :vars
    (
      ?auto_30320 - HOIST
      ?auto_30322 - PLACE
      ?auto_30323 - SURFACE
      ?auto_30324 - PLACE
      ?auto_30326 - HOIST
      ?auto_30325 - SURFACE
      ?auto_30321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30320 ?auto_30322 ) ( IS-CRATE ?auto_30319 ) ( not ( = ?auto_30318 ?auto_30319 ) ) ( not ( = ?auto_30323 ?auto_30318 ) ) ( not ( = ?auto_30323 ?auto_30319 ) ) ( not ( = ?auto_30324 ?auto_30322 ) ) ( HOIST-AT ?auto_30326 ?auto_30324 ) ( not ( = ?auto_30320 ?auto_30326 ) ) ( AVAILABLE ?auto_30326 ) ( SURFACE-AT ?auto_30319 ?auto_30324 ) ( ON ?auto_30319 ?auto_30325 ) ( CLEAR ?auto_30319 ) ( not ( = ?auto_30318 ?auto_30325 ) ) ( not ( = ?auto_30319 ?auto_30325 ) ) ( not ( = ?auto_30323 ?auto_30325 ) ) ( TRUCK-AT ?auto_30321 ?auto_30322 ) ( SURFACE-AT ?auto_30323 ?auto_30322 ) ( CLEAR ?auto_30323 ) ( LIFTING ?auto_30320 ?auto_30318 ) ( IS-CRATE ?auto_30318 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30323 ?auto_30318 )
      ( MAKE-2CRATE ?auto_30323 ?auto_30318 ?auto_30319 )
      ( MAKE-1CRATE-VERIFY ?auto_30318 ?auto_30319 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30327 - SURFACE
      ?auto_30328 - SURFACE
      ?auto_30329 - SURFACE
    )
    :vars
    (
      ?auto_30330 - HOIST
      ?auto_30335 - PLACE
      ?auto_30332 - PLACE
      ?auto_30334 - HOIST
      ?auto_30331 - SURFACE
      ?auto_30333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30330 ?auto_30335 ) ( IS-CRATE ?auto_30329 ) ( not ( = ?auto_30328 ?auto_30329 ) ) ( not ( = ?auto_30327 ?auto_30328 ) ) ( not ( = ?auto_30327 ?auto_30329 ) ) ( not ( = ?auto_30332 ?auto_30335 ) ) ( HOIST-AT ?auto_30334 ?auto_30332 ) ( not ( = ?auto_30330 ?auto_30334 ) ) ( AVAILABLE ?auto_30334 ) ( SURFACE-AT ?auto_30329 ?auto_30332 ) ( ON ?auto_30329 ?auto_30331 ) ( CLEAR ?auto_30329 ) ( not ( = ?auto_30328 ?auto_30331 ) ) ( not ( = ?auto_30329 ?auto_30331 ) ) ( not ( = ?auto_30327 ?auto_30331 ) ) ( TRUCK-AT ?auto_30333 ?auto_30335 ) ( SURFACE-AT ?auto_30327 ?auto_30335 ) ( CLEAR ?auto_30327 ) ( LIFTING ?auto_30330 ?auto_30328 ) ( IS-CRATE ?auto_30328 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30328 ?auto_30329 )
      ( MAKE-2CRATE-VERIFY ?auto_30327 ?auto_30328 ?auto_30329 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30336 - SURFACE
      ?auto_30337 - SURFACE
      ?auto_30338 - SURFACE
      ?auto_30339 - SURFACE
    )
    :vars
    (
      ?auto_30343 - HOIST
      ?auto_30344 - PLACE
      ?auto_30341 - PLACE
      ?auto_30342 - HOIST
      ?auto_30345 - SURFACE
      ?auto_30340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30343 ?auto_30344 ) ( IS-CRATE ?auto_30339 ) ( not ( = ?auto_30338 ?auto_30339 ) ) ( not ( = ?auto_30337 ?auto_30338 ) ) ( not ( = ?auto_30337 ?auto_30339 ) ) ( not ( = ?auto_30341 ?auto_30344 ) ) ( HOIST-AT ?auto_30342 ?auto_30341 ) ( not ( = ?auto_30343 ?auto_30342 ) ) ( AVAILABLE ?auto_30342 ) ( SURFACE-AT ?auto_30339 ?auto_30341 ) ( ON ?auto_30339 ?auto_30345 ) ( CLEAR ?auto_30339 ) ( not ( = ?auto_30338 ?auto_30345 ) ) ( not ( = ?auto_30339 ?auto_30345 ) ) ( not ( = ?auto_30337 ?auto_30345 ) ) ( TRUCK-AT ?auto_30340 ?auto_30344 ) ( SURFACE-AT ?auto_30337 ?auto_30344 ) ( CLEAR ?auto_30337 ) ( LIFTING ?auto_30343 ?auto_30338 ) ( IS-CRATE ?auto_30338 ) ( ON ?auto_30337 ?auto_30336 ) ( not ( = ?auto_30336 ?auto_30337 ) ) ( not ( = ?auto_30336 ?auto_30338 ) ) ( not ( = ?auto_30336 ?auto_30339 ) ) ( not ( = ?auto_30336 ?auto_30345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30337 ?auto_30338 ?auto_30339 )
      ( MAKE-3CRATE-VERIFY ?auto_30336 ?auto_30337 ?auto_30338 ?auto_30339 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30346 - SURFACE
      ?auto_30347 - SURFACE
      ?auto_30348 - SURFACE
      ?auto_30349 - SURFACE
      ?auto_30350 - SURFACE
    )
    :vars
    (
      ?auto_30354 - HOIST
      ?auto_30355 - PLACE
      ?auto_30352 - PLACE
      ?auto_30353 - HOIST
      ?auto_30356 - SURFACE
      ?auto_30351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30354 ?auto_30355 ) ( IS-CRATE ?auto_30350 ) ( not ( = ?auto_30349 ?auto_30350 ) ) ( not ( = ?auto_30348 ?auto_30349 ) ) ( not ( = ?auto_30348 ?auto_30350 ) ) ( not ( = ?auto_30352 ?auto_30355 ) ) ( HOIST-AT ?auto_30353 ?auto_30352 ) ( not ( = ?auto_30354 ?auto_30353 ) ) ( AVAILABLE ?auto_30353 ) ( SURFACE-AT ?auto_30350 ?auto_30352 ) ( ON ?auto_30350 ?auto_30356 ) ( CLEAR ?auto_30350 ) ( not ( = ?auto_30349 ?auto_30356 ) ) ( not ( = ?auto_30350 ?auto_30356 ) ) ( not ( = ?auto_30348 ?auto_30356 ) ) ( TRUCK-AT ?auto_30351 ?auto_30355 ) ( SURFACE-AT ?auto_30348 ?auto_30355 ) ( CLEAR ?auto_30348 ) ( LIFTING ?auto_30354 ?auto_30349 ) ( IS-CRATE ?auto_30349 ) ( ON ?auto_30347 ?auto_30346 ) ( ON ?auto_30348 ?auto_30347 ) ( not ( = ?auto_30346 ?auto_30347 ) ) ( not ( = ?auto_30346 ?auto_30348 ) ) ( not ( = ?auto_30346 ?auto_30349 ) ) ( not ( = ?auto_30346 ?auto_30350 ) ) ( not ( = ?auto_30346 ?auto_30356 ) ) ( not ( = ?auto_30347 ?auto_30348 ) ) ( not ( = ?auto_30347 ?auto_30349 ) ) ( not ( = ?auto_30347 ?auto_30350 ) ) ( not ( = ?auto_30347 ?auto_30356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30348 ?auto_30349 ?auto_30350 )
      ( MAKE-4CRATE-VERIFY ?auto_30346 ?auto_30347 ?auto_30348 ?auto_30349 ?auto_30350 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30357 - SURFACE
      ?auto_30358 - SURFACE
      ?auto_30359 - SURFACE
      ?auto_30360 - SURFACE
      ?auto_30361 - SURFACE
      ?auto_30362 - SURFACE
    )
    :vars
    (
      ?auto_30366 - HOIST
      ?auto_30367 - PLACE
      ?auto_30364 - PLACE
      ?auto_30365 - HOIST
      ?auto_30368 - SURFACE
      ?auto_30363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30366 ?auto_30367 ) ( IS-CRATE ?auto_30362 ) ( not ( = ?auto_30361 ?auto_30362 ) ) ( not ( = ?auto_30360 ?auto_30361 ) ) ( not ( = ?auto_30360 ?auto_30362 ) ) ( not ( = ?auto_30364 ?auto_30367 ) ) ( HOIST-AT ?auto_30365 ?auto_30364 ) ( not ( = ?auto_30366 ?auto_30365 ) ) ( AVAILABLE ?auto_30365 ) ( SURFACE-AT ?auto_30362 ?auto_30364 ) ( ON ?auto_30362 ?auto_30368 ) ( CLEAR ?auto_30362 ) ( not ( = ?auto_30361 ?auto_30368 ) ) ( not ( = ?auto_30362 ?auto_30368 ) ) ( not ( = ?auto_30360 ?auto_30368 ) ) ( TRUCK-AT ?auto_30363 ?auto_30367 ) ( SURFACE-AT ?auto_30360 ?auto_30367 ) ( CLEAR ?auto_30360 ) ( LIFTING ?auto_30366 ?auto_30361 ) ( IS-CRATE ?auto_30361 ) ( ON ?auto_30358 ?auto_30357 ) ( ON ?auto_30359 ?auto_30358 ) ( ON ?auto_30360 ?auto_30359 ) ( not ( = ?auto_30357 ?auto_30358 ) ) ( not ( = ?auto_30357 ?auto_30359 ) ) ( not ( = ?auto_30357 ?auto_30360 ) ) ( not ( = ?auto_30357 ?auto_30361 ) ) ( not ( = ?auto_30357 ?auto_30362 ) ) ( not ( = ?auto_30357 ?auto_30368 ) ) ( not ( = ?auto_30358 ?auto_30359 ) ) ( not ( = ?auto_30358 ?auto_30360 ) ) ( not ( = ?auto_30358 ?auto_30361 ) ) ( not ( = ?auto_30358 ?auto_30362 ) ) ( not ( = ?auto_30358 ?auto_30368 ) ) ( not ( = ?auto_30359 ?auto_30360 ) ) ( not ( = ?auto_30359 ?auto_30361 ) ) ( not ( = ?auto_30359 ?auto_30362 ) ) ( not ( = ?auto_30359 ?auto_30368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30360 ?auto_30361 ?auto_30362 )
      ( MAKE-5CRATE-VERIFY ?auto_30357 ?auto_30358 ?auto_30359 ?auto_30360 ?auto_30361 ?auto_30362 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30369 - SURFACE
      ?auto_30370 - SURFACE
    )
    :vars
    (
      ?auto_30375 - HOIST
      ?auto_30376 - PLACE
      ?auto_30374 - SURFACE
      ?auto_30372 - PLACE
      ?auto_30373 - HOIST
      ?auto_30377 - SURFACE
      ?auto_30371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30375 ?auto_30376 ) ( IS-CRATE ?auto_30370 ) ( not ( = ?auto_30369 ?auto_30370 ) ) ( not ( = ?auto_30374 ?auto_30369 ) ) ( not ( = ?auto_30374 ?auto_30370 ) ) ( not ( = ?auto_30372 ?auto_30376 ) ) ( HOIST-AT ?auto_30373 ?auto_30372 ) ( not ( = ?auto_30375 ?auto_30373 ) ) ( AVAILABLE ?auto_30373 ) ( SURFACE-AT ?auto_30370 ?auto_30372 ) ( ON ?auto_30370 ?auto_30377 ) ( CLEAR ?auto_30370 ) ( not ( = ?auto_30369 ?auto_30377 ) ) ( not ( = ?auto_30370 ?auto_30377 ) ) ( not ( = ?auto_30374 ?auto_30377 ) ) ( TRUCK-AT ?auto_30371 ?auto_30376 ) ( SURFACE-AT ?auto_30374 ?auto_30376 ) ( CLEAR ?auto_30374 ) ( IS-CRATE ?auto_30369 ) ( AVAILABLE ?auto_30375 ) ( IN ?auto_30369 ?auto_30371 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30375 ?auto_30369 ?auto_30371 ?auto_30376 )
      ( MAKE-2CRATE ?auto_30374 ?auto_30369 ?auto_30370 )
      ( MAKE-1CRATE-VERIFY ?auto_30369 ?auto_30370 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30378 - SURFACE
      ?auto_30379 - SURFACE
      ?auto_30380 - SURFACE
    )
    :vars
    (
      ?auto_30383 - HOIST
      ?auto_30382 - PLACE
      ?auto_30385 - PLACE
      ?auto_30384 - HOIST
      ?auto_30386 - SURFACE
      ?auto_30381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30383 ?auto_30382 ) ( IS-CRATE ?auto_30380 ) ( not ( = ?auto_30379 ?auto_30380 ) ) ( not ( = ?auto_30378 ?auto_30379 ) ) ( not ( = ?auto_30378 ?auto_30380 ) ) ( not ( = ?auto_30385 ?auto_30382 ) ) ( HOIST-AT ?auto_30384 ?auto_30385 ) ( not ( = ?auto_30383 ?auto_30384 ) ) ( AVAILABLE ?auto_30384 ) ( SURFACE-AT ?auto_30380 ?auto_30385 ) ( ON ?auto_30380 ?auto_30386 ) ( CLEAR ?auto_30380 ) ( not ( = ?auto_30379 ?auto_30386 ) ) ( not ( = ?auto_30380 ?auto_30386 ) ) ( not ( = ?auto_30378 ?auto_30386 ) ) ( TRUCK-AT ?auto_30381 ?auto_30382 ) ( SURFACE-AT ?auto_30378 ?auto_30382 ) ( CLEAR ?auto_30378 ) ( IS-CRATE ?auto_30379 ) ( AVAILABLE ?auto_30383 ) ( IN ?auto_30379 ?auto_30381 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30379 ?auto_30380 )
      ( MAKE-2CRATE-VERIFY ?auto_30378 ?auto_30379 ?auto_30380 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30387 - SURFACE
      ?auto_30388 - SURFACE
      ?auto_30389 - SURFACE
      ?auto_30390 - SURFACE
    )
    :vars
    (
      ?auto_30392 - HOIST
      ?auto_30391 - PLACE
      ?auto_30393 - PLACE
      ?auto_30394 - HOIST
      ?auto_30396 - SURFACE
      ?auto_30395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30392 ?auto_30391 ) ( IS-CRATE ?auto_30390 ) ( not ( = ?auto_30389 ?auto_30390 ) ) ( not ( = ?auto_30388 ?auto_30389 ) ) ( not ( = ?auto_30388 ?auto_30390 ) ) ( not ( = ?auto_30393 ?auto_30391 ) ) ( HOIST-AT ?auto_30394 ?auto_30393 ) ( not ( = ?auto_30392 ?auto_30394 ) ) ( AVAILABLE ?auto_30394 ) ( SURFACE-AT ?auto_30390 ?auto_30393 ) ( ON ?auto_30390 ?auto_30396 ) ( CLEAR ?auto_30390 ) ( not ( = ?auto_30389 ?auto_30396 ) ) ( not ( = ?auto_30390 ?auto_30396 ) ) ( not ( = ?auto_30388 ?auto_30396 ) ) ( TRUCK-AT ?auto_30395 ?auto_30391 ) ( SURFACE-AT ?auto_30388 ?auto_30391 ) ( CLEAR ?auto_30388 ) ( IS-CRATE ?auto_30389 ) ( AVAILABLE ?auto_30392 ) ( IN ?auto_30389 ?auto_30395 ) ( ON ?auto_30388 ?auto_30387 ) ( not ( = ?auto_30387 ?auto_30388 ) ) ( not ( = ?auto_30387 ?auto_30389 ) ) ( not ( = ?auto_30387 ?auto_30390 ) ) ( not ( = ?auto_30387 ?auto_30396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30388 ?auto_30389 ?auto_30390 )
      ( MAKE-3CRATE-VERIFY ?auto_30387 ?auto_30388 ?auto_30389 ?auto_30390 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30397 - SURFACE
      ?auto_30398 - SURFACE
      ?auto_30399 - SURFACE
      ?auto_30400 - SURFACE
      ?auto_30401 - SURFACE
    )
    :vars
    (
      ?auto_30403 - HOIST
      ?auto_30402 - PLACE
      ?auto_30404 - PLACE
      ?auto_30405 - HOIST
      ?auto_30407 - SURFACE
      ?auto_30406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30403 ?auto_30402 ) ( IS-CRATE ?auto_30401 ) ( not ( = ?auto_30400 ?auto_30401 ) ) ( not ( = ?auto_30399 ?auto_30400 ) ) ( not ( = ?auto_30399 ?auto_30401 ) ) ( not ( = ?auto_30404 ?auto_30402 ) ) ( HOIST-AT ?auto_30405 ?auto_30404 ) ( not ( = ?auto_30403 ?auto_30405 ) ) ( AVAILABLE ?auto_30405 ) ( SURFACE-AT ?auto_30401 ?auto_30404 ) ( ON ?auto_30401 ?auto_30407 ) ( CLEAR ?auto_30401 ) ( not ( = ?auto_30400 ?auto_30407 ) ) ( not ( = ?auto_30401 ?auto_30407 ) ) ( not ( = ?auto_30399 ?auto_30407 ) ) ( TRUCK-AT ?auto_30406 ?auto_30402 ) ( SURFACE-AT ?auto_30399 ?auto_30402 ) ( CLEAR ?auto_30399 ) ( IS-CRATE ?auto_30400 ) ( AVAILABLE ?auto_30403 ) ( IN ?auto_30400 ?auto_30406 ) ( ON ?auto_30398 ?auto_30397 ) ( ON ?auto_30399 ?auto_30398 ) ( not ( = ?auto_30397 ?auto_30398 ) ) ( not ( = ?auto_30397 ?auto_30399 ) ) ( not ( = ?auto_30397 ?auto_30400 ) ) ( not ( = ?auto_30397 ?auto_30401 ) ) ( not ( = ?auto_30397 ?auto_30407 ) ) ( not ( = ?auto_30398 ?auto_30399 ) ) ( not ( = ?auto_30398 ?auto_30400 ) ) ( not ( = ?auto_30398 ?auto_30401 ) ) ( not ( = ?auto_30398 ?auto_30407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30399 ?auto_30400 ?auto_30401 )
      ( MAKE-4CRATE-VERIFY ?auto_30397 ?auto_30398 ?auto_30399 ?auto_30400 ?auto_30401 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30408 - SURFACE
      ?auto_30409 - SURFACE
      ?auto_30410 - SURFACE
      ?auto_30411 - SURFACE
      ?auto_30412 - SURFACE
      ?auto_30413 - SURFACE
    )
    :vars
    (
      ?auto_30415 - HOIST
      ?auto_30414 - PLACE
      ?auto_30416 - PLACE
      ?auto_30417 - HOIST
      ?auto_30419 - SURFACE
      ?auto_30418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30415 ?auto_30414 ) ( IS-CRATE ?auto_30413 ) ( not ( = ?auto_30412 ?auto_30413 ) ) ( not ( = ?auto_30411 ?auto_30412 ) ) ( not ( = ?auto_30411 ?auto_30413 ) ) ( not ( = ?auto_30416 ?auto_30414 ) ) ( HOIST-AT ?auto_30417 ?auto_30416 ) ( not ( = ?auto_30415 ?auto_30417 ) ) ( AVAILABLE ?auto_30417 ) ( SURFACE-AT ?auto_30413 ?auto_30416 ) ( ON ?auto_30413 ?auto_30419 ) ( CLEAR ?auto_30413 ) ( not ( = ?auto_30412 ?auto_30419 ) ) ( not ( = ?auto_30413 ?auto_30419 ) ) ( not ( = ?auto_30411 ?auto_30419 ) ) ( TRUCK-AT ?auto_30418 ?auto_30414 ) ( SURFACE-AT ?auto_30411 ?auto_30414 ) ( CLEAR ?auto_30411 ) ( IS-CRATE ?auto_30412 ) ( AVAILABLE ?auto_30415 ) ( IN ?auto_30412 ?auto_30418 ) ( ON ?auto_30409 ?auto_30408 ) ( ON ?auto_30410 ?auto_30409 ) ( ON ?auto_30411 ?auto_30410 ) ( not ( = ?auto_30408 ?auto_30409 ) ) ( not ( = ?auto_30408 ?auto_30410 ) ) ( not ( = ?auto_30408 ?auto_30411 ) ) ( not ( = ?auto_30408 ?auto_30412 ) ) ( not ( = ?auto_30408 ?auto_30413 ) ) ( not ( = ?auto_30408 ?auto_30419 ) ) ( not ( = ?auto_30409 ?auto_30410 ) ) ( not ( = ?auto_30409 ?auto_30411 ) ) ( not ( = ?auto_30409 ?auto_30412 ) ) ( not ( = ?auto_30409 ?auto_30413 ) ) ( not ( = ?auto_30409 ?auto_30419 ) ) ( not ( = ?auto_30410 ?auto_30411 ) ) ( not ( = ?auto_30410 ?auto_30412 ) ) ( not ( = ?auto_30410 ?auto_30413 ) ) ( not ( = ?auto_30410 ?auto_30419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30411 ?auto_30412 ?auto_30413 )
      ( MAKE-5CRATE-VERIFY ?auto_30408 ?auto_30409 ?auto_30410 ?auto_30411 ?auto_30412 ?auto_30413 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30420 - SURFACE
      ?auto_30421 - SURFACE
    )
    :vars
    (
      ?auto_30424 - HOIST
      ?auto_30423 - PLACE
      ?auto_30422 - SURFACE
      ?auto_30425 - PLACE
      ?auto_30426 - HOIST
      ?auto_30428 - SURFACE
      ?auto_30427 - TRUCK
      ?auto_30429 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30424 ?auto_30423 ) ( IS-CRATE ?auto_30421 ) ( not ( = ?auto_30420 ?auto_30421 ) ) ( not ( = ?auto_30422 ?auto_30420 ) ) ( not ( = ?auto_30422 ?auto_30421 ) ) ( not ( = ?auto_30425 ?auto_30423 ) ) ( HOIST-AT ?auto_30426 ?auto_30425 ) ( not ( = ?auto_30424 ?auto_30426 ) ) ( AVAILABLE ?auto_30426 ) ( SURFACE-AT ?auto_30421 ?auto_30425 ) ( ON ?auto_30421 ?auto_30428 ) ( CLEAR ?auto_30421 ) ( not ( = ?auto_30420 ?auto_30428 ) ) ( not ( = ?auto_30421 ?auto_30428 ) ) ( not ( = ?auto_30422 ?auto_30428 ) ) ( SURFACE-AT ?auto_30422 ?auto_30423 ) ( CLEAR ?auto_30422 ) ( IS-CRATE ?auto_30420 ) ( AVAILABLE ?auto_30424 ) ( IN ?auto_30420 ?auto_30427 ) ( TRUCK-AT ?auto_30427 ?auto_30429 ) ( not ( = ?auto_30429 ?auto_30423 ) ) ( not ( = ?auto_30425 ?auto_30429 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_30427 ?auto_30429 ?auto_30423 )
      ( MAKE-2CRATE ?auto_30422 ?auto_30420 ?auto_30421 )
      ( MAKE-1CRATE-VERIFY ?auto_30420 ?auto_30421 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30430 - SURFACE
      ?auto_30431 - SURFACE
      ?auto_30432 - SURFACE
    )
    :vars
    (
      ?auto_30437 - HOIST
      ?auto_30439 - PLACE
      ?auto_30434 - PLACE
      ?auto_30438 - HOIST
      ?auto_30433 - SURFACE
      ?auto_30435 - TRUCK
      ?auto_30436 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30437 ?auto_30439 ) ( IS-CRATE ?auto_30432 ) ( not ( = ?auto_30431 ?auto_30432 ) ) ( not ( = ?auto_30430 ?auto_30431 ) ) ( not ( = ?auto_30430 ?auto_30432 ) ) ( not ( = ?auto_30434 ?auto_30439 ) ) ( HOIST-AT ?auto_30438 ?auto_30434 ) ( not ( = ?auto_30437 ?auto_30438 ) ) ( AVAILABLE ?auto_30438 ) ( SURFACE-AT ?auto_30432 ?auto_30434 ) ( ON ?auto_30432 ?auto_30433 ) ( CLEAR ?auto_30432 ) ( not ( = ?auto_30431 ?auto_30433 ) ) ( not ( = ?auto_30432 ?auto_30433 ) ) ( not ( = ?auto_30430 ?auto_30433 ) ) ( SURFACE-AT ?auto_30430 ?auto_30439 ) ( CLEAR ?auto_30430 ) ( IS-CRATE ?auto_30431 ) ( AVAILABLE ?auto_30437 ) ( IN ?auto_30431 ?auto_30435 ) ( TRUCK-AT ?auto_30435 ?auto_30436 ) ( not ( = ?auto_30436 ?auto_30439 ) ) ( not ( = ?auto_30434 ?auto_30436 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30431 ?auto_30432 )
      ( MAKE-2CRATE-VERIFY ?auto_30430 ?auto_30431 ?auto_30432 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30440 - SURFACE
      ?auto_30441 - SURFACE
      ?auto_30442 - SURFACE
      ?auto_30443 - SURFACE
    )
    :vars
    (
      ?auto_30450 - HOIST
      ?auto_30445 - PLACE
      ?auto_30444 - PLACE
      ?auto_30446 - HOIST
      ?auto_30449 - SURFACE
      ?auto_30447 - TRUCK
      ?auto_30448 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30450 ?auto_30445 ) ( IS-CRATE ?auto_30443 ) ( not ( = ?auto_30442 ?auto_30443 ) ) ( not ( = ?auto_30441 ?auto_30442 ) ) ( not ( = ?auto_30441 ?auto_30443 ) ) ( not ( = ?auto_30444 ?auto_30445 ) ) ( HOIST-AT ?auto_30446 ?auto_30444 ) ( not ( = ?auto_30450 ?auto_30446 ) ) ( AVAILABLE ?auto_30446 ) ( SURFACE-AT ?auto_30443 ?auto_30444 ) ( ON ?auto_30443 ?auto_30449 ) ( CLEAR ?auto_30443 ) ( not ( = ?auto_30442 ?auto_30449 ) ) ( not ( = ?auto_30443 ?auto_30449 ) ) ( not ( = ?auto_30441 ?auto_30449 ) ) ( SURFACE-AT ?auto_30441 ?auto_30445 ) ( CLEAR ?auto_30441 ) ( IS-CRATE ?auto_30442 ) ( AVAILABLE ?auto_30450 ) ( IN ?auto_30442 ?auto_30447 ) ( TRUCK-AT ?auto_30447 ?auto_30448 ) ( not ( = ?auto_30448 ?auto_30445 ) ) ( not ( = ?auto_30444 ?auto_30448 ) ) ( ON ?auto_30441 ?auto_30440 ) ( not ( = ?auto_30440 ?auto_30441 ) ) ( not ( = ?auto_30440 ?auto_30442 ) ) ( not ( = ?auto_30440 ?auto_30443 ) ) ( not ( = ?auto_30440 ?auto_30449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30441 ?auto_30442 ?auto_30443 )
      ( MAKE-3CRATE-VERIFY ?auto_30440 ?auto_30441 ?auto_30442 ?auto_30443 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30451 - SURFACE
      ?auto_30452 - SURFACE
      ?auto_30453 - SURFACE
      ?auto_30454 - SURFACE
      ?auto_30455 - SURFACE
    )
    :vars
    (
      ?auto_30462 - HOIST
      ?auto_30457 - PLACE
      ?auto_30456 - PLACE
      ?auto_30458 - HOIST
      ?auto_30461 - SURFACE
      ?auto_30459 - TRUCK
      ?auto_30460 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30462 ?auto_30457 ) ( IS-CRATE ?auto_30455 ) ( not ( = ?auto_30454 ?auto_30455 ) ) ( not ( = ?auto_30453 ?auto_30454 ) ) ( not ( = ?auto_30453 ?auto_30455 ) ) ( not ( = ?auto_30456 ?auto_30457 ) ) ( HOIST-AT ?auto_30458 ?auto_30456 ) ( not ( = ?auto_30462 ?auto_30458 ) ) ( AVAILABLE ?auto_30458 ) ( SURFACE-AT ?auto_30455 ?auto_30456 ) ( ON ?auto_30455 ?auto_30461 ) ( CLEAR ?auto_30455 ) ( not ( = ?auto_30454 ?auto_30461 ) ) ( not ( = ?auto_30455 ?auto_30461 ) ) ( not ( = ?auto_30453 ?auto_30461 ) ) ( SURFACE-AT ?auto_30453 ?auto_30457 ) ( CLEAR ?auto_30453 ) ( IS-CRATE ?auto_30454 ) ( AVAILABLE ?auto_30462 ) ( IN ?auto_30454 ?auto_30459 ) ( TRUCK-AT ?auto_30459 ?auto_30460 ) ( not ( = ?auto_30460 ?auto_30457 ) ) ( not ( = ?auto_30456 ?auto_30460 ) ) ( ON ?auto_30452 ?auto_30451 ) ( ON ?auto_30453 ?auto_30452 ) ( not ( = ?auto_30451 ?auto_30452 ) ) ( not ( = ?auto_30451 ?auto_30453 ) ) ( not ( = ?auto_30451 ?auto_30454 ) ) ( not ( = ?auto_30451 ?auto_30455 ) ) ( not ( = ?auto_30451 ?auto_30461 ) ) ( not ( = ?auto_30452 ?auto_30453 ) ) ( not ( = ?auto_30452 ?auto_30454 ) ) ( not ( = ?auto_30452 ?auto_30455 ) ) ( not ( = ?auto_30452 ?auto_30461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30453 ?auto_30454 ?auto_30455 )
      ( MAKE-4CRATE-VERIFY ?auto_30451 ?auto_30452 ?auto_30453 ?auto_30454 ?auto_30455 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30463 - SURFACE
      ?auto_30464 - SURFACE
      ?auto_30465 - SURFACE
      ?auto_30466 - SURFACE
      ?auto_30467 - SURFACE
      ?auto_30468 - SURFACE
    )
    :vars
    (
      ?auto_30475 - HOIST
      ?auto_30470 - PLACE
      ?auto_30469 - PLACE
      ?auto_30471 - HOIST
      ?auto_30474 - SURFACE
      ?auto_30472 - TRUCK
      ?auto_30473 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30475 ?auto_30470 ) ( IS-CRATE ?auto_30468 ) ( not ( = ?auto_30467 ?auto_30468 ) ) ( not ( = ?auto_30466 ?auto_30467 ) ) ( not ( = ?auto_30466 ?auto_30468 ) ) ( not ( = ?auto_30469 ?auto_30470 ) ) ( HOIST-AT ?auto_30471 ?auto_30469 ) ( not ( = ?auto_30475 ?auto_30471 ) ) ( AVAILABLE ?auto_30471 ) ( SURFACE-AT ?auto_30468 ?auto_30469 ) ( ON ?auto_30468 ?auto_30474 ) ( CLEAR ?auto_30468 ) ( not ( = ?auto_30467 ?auto_30474 ) ) ( not ( = ?auto_30468 ?auto_30474 ) ) ( not ( = ?auto_30466 ?auto_30474 ) ) ( SURFACE-AT ?auto_30466 ?auto_30470 ) ( CLEAR ?auto_30466 ) ( IS-CRATE ?auto_30467 ) ( AVAILABLE ?auto_30475 ) ( IN ?auto_30467 ?auto_30472 ) ( TRUCK-AT ?auto_30472 ?auto_30473 ) ( not ( = ?auto_30473 ?auto_30470 ) ) ( not ( = ?auto_30469 ?auto_30473 ) ) ( ON ?auto_30464 ?auto_30463 ) ( ON ?auto_30465 ?auto_30464 ) ( ON ?auto_30466 ?auto_30465 ) ( not ( = ?auto_30463 ?auto_30464 ) ) ( not ( = ?auto_30463 ?auto_30465 ) ) ( not ( = ?auto_30463 ?auto_30466 ) ) ( not ( = ?auto_30463 ?auto_30467 ) ) ( not ( = ?auto_30463 ?auto_30468 ) ) ( not ( = ?auto_30463 ?auto_30474 ) ) ( not ( = ?auto_30464 ?auto_30465 ) ) ( not ( = ?auto_30464 ?auto_30466 ) ) ( not ( = ?auto_30464 ?auto_30467 ) ) ( not ( = ?auto_30464 ?auto_30468 ) ) ( not ( = ?auto_30464 ?auto_30474 ) ) ( not ( = ?auto_30465 ?auto_30466 ) ) ( not ( = ?auto_30465 ?auto_30467 ) ) ( not ( = ?auto_30465 ?auto_30468 ) ) ( not ( = ?auto_30465 ?auto_30474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30466 ?auto_30467 ?auto_30468 )
      ( MAKE-5CRATE-VERIFY ?auto_30463 ?auto_30464 ?auto_30465 ?auto_30466 ?auto_30467 ?auto_30468 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30476 - SURFACE
      ?auto_30477 - SURFACE
    )
    :vars
    (
      ?auto_30485 - HOIST
      ?auto_30480 - PLACE
      ?auto_30479 - SURFACE
      ?auto_30478 - PLACE
      ?auto_30481 - HOIST
      ?auto_30484 - SURFACE
      ?auto_30482 - TRUCK
      ?auto_30483 - PLACE
      ?auto_30486 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30485 ?auto_30480 ) ( IS-CRATE ?auto_30477 ) ( not ( = ?auto_30476 ?auto_30477 ) ) ( not ( = ?auto_30479 ?auto_30476 ) ) ( not ( = ?auto_30479 ?auto_30477 ) ) ( not ( = ?auto_30478 ?auto_30480 ) ) ( HOIST-AT ?auto_30481 ?auto_30478 ) ( not ( = ?auto_30485 ?auto_30481 ) ) ( AVAILABLE ?auto_30481 ) ( SURFACE-AT ?auto_30477 ?auto_30478 ) ( ON ?auto_30477 ?auto_30484 ) ( CLEAR ?auto_30477 ) ( not ( = ?auto_30476 ?auto_30484 ) ) ( not ( = ?auto_30477 ?auto_30484 ) ) ( not ( = ?auto_30479 ?auto_30484 ) ) ( SURFACE-AT ?auto_30479 ?auto_30480 ) ( CLEAR ?auto_30479 ) ( IS-CRATE ?auto_30476 ) ( AVAILABLE ?auto_30485 ) ( TRUCK-AT ?auto_30482 ?auto_30483 ) ( not ( = ?auto_30483 ?auto_30480 ) ) ( not ( = ?auto_30478 ?auto_30483 ) ) ( HOIST-AT ?auto_30486 ?auto_30483 ) ( LIFTING ?auto_30486 ?auto_30476 ) ( not ( = ?auto_30485 ?auto_30486 ) ) ( not ( = ?auto_30481 ?auto_30486 ) ) )
    :subtasks
    ( ( !LOAD ?auto_30486 ?auto_30476 ?auto_30482 ?auto_30483 )
      ( MAKE-2CRATE ?auto_30479 ?auto_30476 ?auto_30477 )
      ( MAKE-1CRATE-VERIFY ?auto_30476 ?auto_30477 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30487 - SURFACE
      ?auto_30488 - SURFACE
      ?auto_30489 - SURFACE
    )
    :vars
    (
      ?auto_30490 - HOIST
      ?auto_30492 - PLACE
      ?auto_30496 - PLACE
      ?auto_30493 - HOIST
      ?auto_30497 - SURFACE
      ?auto_30494 - TRUCK
      ?auto_30495 - PLACE
      ?auto_30491 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30490 ?auto_30492 ) ( IS-CRATE ?auto_30489 ) ( not ( = ?auto_30488 ?auto_30489 ) ) ( not ( = ?auto_30487 ?auto_30488 ) ) ( not ( = ?auto_30487 ?auto_30489 ) ) ( not ( = ?auto_30496 ?auto_30492 ) ) ( HOIST-AT ?auto_30493 ?auto_30496 ) ( not ( = ?auto_30490 ?auto_30493 ) ) ( AVAILABLE ?auto_30493 ) ( SURFACE-AT ?auto_30489 ?auto_30496 ) ( ON ?auto_30489 ?auto_30497 ) ( CLEAR ?auto_30489 ) ( not ( = ?auto_30488 ?auto_30497 ) ) ( not ( = ?auto_30489 ?auto_30497 ) ) ( not ( = ?auto_30487 ?auto_30497 ) ) ( SURFACE-AT ?auto_30487 ?auto_30492 ) ( CLEAR ?auto_30487 ) ( IS-CRATE ?auto_30488 ) ( AVAILABLE ?auto_30490 ) ( TRUCK-AT ?auto_30494 ?auto_30495 ) ( not ( = ?auto_30495 ?auto_30492 ) ) ( not ( = ?auto_30496 ?auto_30495 ) ) ( HOIST-AT ?auto_30491 ?auto_30495 ) ( LIFTING ?auto_30491 ?auto_30488 ) ( not ( = ?auto_30490 ?auto_30491 ) ) ( not ( = ?auto_30493 ?auto_30491 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30488 ?auto_30489 )
      ( MAKE-2CRATE-VERIFY ?auto_30487 ?auto_30488 ?auto_30489 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30498 - SURFACE
      ?auto_30499 - SURFACE
      ?auto_30500 - SURFACE
      ?auto_30501 - SURFACE
    )
    :vars
    (
      ?auto_30506 - HOIST
      ?auto_30502 - PLACE
      ?auto_30505 - PLACE
      ?auto_30509 - HOIST
      ?auto_30507 - SURFACE
      ?auto_30504 - TRUCK
      ?auto_30503 - PLACE
      ?auto_30508 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30506 ?auto_30502 ) ( IS-CRATE ?auto_30501 ) ( not ( = ?auto_30500 ?auto_30501 ) ) ( not ( = ?auto_30499 ?auto_30500 ) ) ( not ( = ?auto_30499 ?auto_30501 ) ) ( not ( = ?auto_30505 ?auto_30502 ) ) ( HOIST-AT ?auto_30509 ?auto_30505 ) ( not ( = ?auto_30506 ?auto_30509 ) ) ( AVAILABLE ?auto_30509 ) ( SURFACE-AT ?auto_30501 ?auto_30505 ) ( ON ?auto_30501 ?auto_30507 ) ( CLEAR ?auto_30501 ) ( not ( = ?auto_30500 ?auto_30507 ) ) ( not ( = ?auto_30501 ?auto_30507 ) ) ( not ( = ?auto_30499 ?auto_30507 ) ) ( SURFACE-AT ?auto_30499 ?auto_30502 ) ( CLEAR ?auto_30499 ) ( IS-CRATE ?auto_30500 ) ( AVAILABLE ?auto_30506 ) ( TRUCK-AT ?auto_30504 ?auto_30503 ) ( not ( = ?auto_30503 ?auto_30502 ) ) ( not ( = ?auto_30505 ?auto_30503 ) ) ( HOIST-AT ?auto_30508 ?auto_30503 ) ( LIFTING ?auto_30508 ?auto_30500 ) ( not ( = ?auto_30506 ?auto_30508 ) ) ( not ( = ?auto_30509 ?auto_30508 ) ) ( ON ?auto_30499 ?auto_30498 ) ( not ( = ?auto_30498 ?auto_30499 ) ) ( not ( = ?auto_30498 ?auto_30500 ) ) ( not ( = ?auto_30498 ?auto_30501 ) ) ( not ( = ?auto_30498 ?auto_30507 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30499 ?auto_30500 ?auto_30501 )
      ( MAKE-3CRATE-VERIFY ?auto_30498 ?auto_30499 ?auto_30500 ?auto_30501 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30510 - SURFACE
      ?auto_30511 - SURFACE
      ?auto_30512 - SURFACE
      ?auto_30513 - SURFACE
      ?auto_30514 - SURFACE
    )
    :vars
    (
      ?auto_30519 - HOIST
      ?auto_30515 - PLACE
      ?auto_30518 - PLACE
      ?auto_30522 - HOIST
      ?auto_30520 - SURFACE
      ?auto_30517 - TRUCK
      ?auto_30516 - PLACE
      ?auto_30521 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30519 ?auto_30515 ) ( IS-CRATE ?auto_30514 ) ( not ( = ?auto_30513 ?auto_30514 ) ) ( not ( = ?auto_30512 ?auto_30513 ) ) ( not ( = ?auto_30512 ?auto_30514 ) ) ( not ( = ?auto_30518 ?auto_30515 ) ) ( HOIST-AT ?auto_30522 ?auto_30518 ) ( not ( = ?auto_30519 ?auto_30522 ) ) ( AVAILABLE ?auto_30522 ) ( SURFACE-AT ?auto_30514 ?auto_30518 ) ( ON ?auto_30514 ?auto_30520 ) ( CLEAR ?auto_30514 ) ( not ( = ?auto_30513 ?auto_30520 ) ) ( not ( = ?auto_30514 ?auto_30520 ) ) ( not ( = ?auto_30512 ?auto_30520 ) ) ( SURFACE-AT ?auto_30512 ?auto_30515 ) ( CLEAR ?auto_30512 ) ( IS-CRATE ?auto_30513 ) ( AVAILABLE ?auto_30519 ) ( TRUCK-AT ?auto_30517 ?auto_30516 ) ( not ( = ?auto_30516 ?auto_30515 ) ) ( not ( = ?auto_30518 ?auto_30516 ) ) ( HOIST-AT ?auto_30521 ?auto_30516 ) ( LIFTING ?auto_30521 ?auto_30513 ) ( not ( = ?auto_30519 ?auto_30521 ) ) ( not ( = ?auto_30522 ?auto_30521 ) ) ( ON ?auto_30511 ?auto_30510 ) ( ON ?auto_30512 ?auto_30511 ) ( not ( = ?auto_30510 ?auto_30511 ) ) ( not ( = ?auto_30510 ?auto_30512 ) ) ( not ( = ?auto_30510 ?auto_30513 ) ) ( not ( = ?auto_30510 ?auto_30514 ) ) ( not ( = ?auto_30510 ?auto_30520 ) ) ( not ( = ?auto_30511 ?auto_30512 ) ) ( not ( = ?auto_30511 ?auto_30513 ) ) ( not ( = ?auto_30511 ?auto_30514 ) ) ( not ( = ?auto_30511 ?auto_30520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30512 ?auto_30513 ?auto_30514 )
      ( MAKE-4CRATE-VERIFY ?auto_30510 ?auto_30511 ?auto_30512 ?auto_30513 ?auto_30514 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30523 - SURFACE
      ?auto_30524 - SURFACE
      ?auto_30525 - SURFACE
      ?auto_30526 - SURFACE
      ?auto_30527 - SURFACE
      ?auto_30528 - SURFACE
    )
    :vars
    (
      ?auto_30533 - HOIST
      ?auto_30529 - PLACE
      ?auto_30532 - PLACE
      ?auto_30536 - HOIST
      ?auto_30534 - SURFACE
      ?auto_30531 - TRUCK
      ?auto_30530 - PLACE
      ?auto_30535 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_30533 ?auto_30529 ) ( IS-CRATE ?auto_30528 ) ( not ( = ?auto_30527 ?auto_30528 ) ) ( not ( = ?auto_30526 ?auto_30527 ) ) ( not ( = ?auto_30526 ?auto_30528 ) ) ( not ( = ?auto_30532 ?auto_30529 ) ) ( HOIST-AT ?auto_30536 ?auto_30532 ) ( not ( = ?auto_30533 ?auto_30536 ) ) ( AVAILABLE ?auto_30536 ) ( SURFACE-AT ?auto_30528 ?auto_30532 ) ( ON ?auto_30528 ?auto_30534 ) ( CLEAR ?auto_30528 ) ( not ( = ?auto_30527 ?auto_30534 ) ) ( not ( = ?auto_30528 ?auto_30534 ) ) ( not ( = ?auto_30526 ?auto_30534 ) ) ( SURFACE-AT ?auto_30526 ?auto_30529 ) ( CLEAR ?auto_30526 ) ( IS-CRATE ?auto_30527 ) ( AVAILABLE ?auto_30533 ) ( TRUCK-AT ?auto_30531 ?auto_30530 ) ( not ( = ?auto_30530 ?auto_30529 ) ) ( not ( = ?auto_30532 ?auto_30530 ) ) ( HOIST-AT ?auto_30535 ?auto_30530 ) ( LIFTING ?auto_30535 ?auto_30527 ) ( not ( = ?auto_30533 ?auto_30535 ) ) ( not ( = ?auto_30536 ?auto_30535 ) ) ( ON ?auto_30524 ?auto_30523 ) ( ON ?auto_30525 ?auto_30524 ) ( ON ?auto_30526 ?auto_30525 ) ( not ( = ?auto_30523 ?auto_30524 ) ) ( not ( = ?auto_30523 ?auto_30525 ) ) ( not ( = ?auto_30523 ?auto_30526 ) ) ( not ( = ?auto_30523 ?auto_30527 ) ) ( not ( = ?auto_30523 ?auto_30528 ) ) ( not ( = ?auto_30523 ?auto_30534 ) ) ( not ( = ?auto_30524 ?auto_30525 ) ) ( not ( = ?auto_30524 ?auto_30526 ) ) ( not ( = ?auto_30524 ?auto_30527 ) ) ( not ( = ?auto_30524 ?auto_30528 ) ) ( not ( = ?auto_30524 ?auto_30534 ) ) ( not ( = ?auto_30525 ?auto_30526 ) ) ( not ( = ?auto_30525 ?auto_30527 ) ) ( not ( = ?auto_30525 ?auto_30528 ) ) ( not ( = ?auto_30525 ?auto_30534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30526 ?auto_30527 ?auto_30528 )
      ( MAKE-5CRATE-VERIFY ?auto_30523 ?auto_30524 ?auto_30525 ?auto_30526 ?auto_30527 ?auto_30528 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30537 - SURFACE
      ?auto_30538 - SURFACE
    )
    :vars
    (
      ?auto_30543 - HOIST
      ?auto_30539 - PLACE
      ?auto_30544 - SURFACE
      ?auto_30542 - PLACE
      ?auto_30547 - HOIST
      ?auto_30545 - SURFACE
      ?auto_30541 - TRUCK
      ?auto_30540 - PLACE
      ?auto_30546 - HOIST
      ?auto_30548 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30543 ?auto_30539 ) ( IS-CRATE ?auto_30538 ) ( not ( = ?auto_30537 ?auto_30538 ) ) ( not ( = ?auto_30544 ?auto_30537 ) ) ( not ( = ?auto_30544 ?auto_30538 ) ) ( not ( = ?auto_30542 ?auto_30539 ) ) ( HOIST-AT ?auto_30547 ?auto_30542 ) ( not ( = ?auto_30543 ?auto_30547 ) ) ( AVAILABLE ?auto_30547 ) ( SURFACE-AT ?auto_30538 ?auto_30542 ) ( ON ?auto_30538 ?auto_30545 ) ( CLEAR ?auto_30538 ) ( not ( = ?auto_30537 ?auto_30545 ) ) ( not ( = ?auto_30538 ?auto_30545 ) ) ( not ( = ?auto_30544 ?auto_30545 ) ) ( SURFACE-AT ?auto_30544 ?auto_30539 ) ( CLEAR ?auto_30544 ) ( IS-CRATE ?auto_30537 ) ( AVAILABLE ?auto_30543 ) ( TRUCK-AT ?auto_30541 ?auto_30540 ) ( not ( = ?auto_30540 ?auto_30539 ) ) ( not ( = ?auto_30542 ?auto_30540 ) ) ( HOIST-AT ?auto_30546 ?auto_30540 ) ( not ( = ?auto_30543 ?auto_30546 ) ) ( not ( = ?auto_30547 ?auto_30546 ) ) ( AVAILABLE ?auto_30546 ) ( SURFACE-AT ?auto_30537 ?auto_30540 ) ( ON ?auto_30537 ?auto_30548 ) ( CLEAR ?auto_30537 ) ( not ( = ?auto_30537 ?auto_30548 ) ) ( not ( = ?auto_30538 ?auto_30548 ) ) ( not ( = ?auto_30544 ?auto_30548 ) ) ( not ( = ?auto_30545 ?auto_30548 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30546 ?auto_30537 ?auto_30548 ?auto_30540 )
      ( MAKE-2CRATE ?auto_30544 ?auto_30537 ?auto_30538 )
      ( MAKE-1CRATE-VERIFY ?auto_30537 ?auto_30538 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30549 - SURFACE
      ?auto_30550 - SURFACE
      ?auto_30551 - SURFACE
    )
    :vars
    (
      ?auto_30557 - HOIST
      ?auto_30556 - PLACE
      ?auto_30553 - PLACE
      ?auto_30554 - HOIST
      ?auto_30555 - SURFACE
      ?auto_30559 - TRUCK
      ?auto_30558 - PLACE
      ?auto_30552 - HOIST
      ?auto_30560 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30557 ?auto_30556 ) ( IS-CRATE ?auto_30551 ) ( not ( = ?auto_30550 ?auto_30551 ) ) ( not ( = ?auto_30549 ?auto_30550 ) ) ( not ( = ?auto_30549 ?auto_30551 ) ) ( not ( = ?auto_30553 ?auto_30556 ) ) ( HOIST-AT ?auto_30554 ?auto_30553 ) ( not ( = ?auto_30557 ?auto_30554 ) ) ( AVAILABLE ?auto_30554 ) ( SURFACE-AT ?auto_30551 ?auto_30553 ) ( ON ?auto_30551 ?auto_30555 ) ( CLEAR ?auto_30551 ) ( not ( = ?auto_30550 ?auto_30555 ) ) ( not ( = ?auto_30551 ?auto_30555 ) ) ( not ( = ?auto_30549 ?auto_30555 ) ) ( SURFACE-AT ?auto_30549 ?auto_30556 ) ( CLEAR ?auto_30549 ) ( IS-CRATE ?auto_30550 ) ( AVAILABLE ?auto_30557 ) ( TRUCK-AT ?auto_30559 ?auto_30558 ) ( not ( = ?auto_30558 ?auto_30556 ) ) ( not ( = ?auto_30553 ?auto_30558 ) ) ( HOIST-AT ?auto_30552 ?auto_30558 ) ( not ( = ?auto_30557 ?auto_30552 ) ) ( not ( = ?auto_30554 ?auto_30552 ) ) ( AVAILABLE ?auto_30552 ) ( SURFACE-AT ?auto_30550 ?auto_30558 ) ( ON ?auto_30550 ?auto_30560 ) ( CLEAR ?auto_30550 ) ( not ( = ?auto_30550 ?auto_30560 ) ) ( not ( = ?auto_30551 ?auto_30560 ) ) ( not ( = ?auto_30549 ?auto_30560 ) ) ( not ( = ?auto_30555 ?auto_30560 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30550 ?auto_30551 )
      ( MAKE-2CRATE-VERIFY ?auto_30549 ?auto_30550 ?auto_30551 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30561 - SURFACE
      ?auto_30562 - SURFACE
      ?auto_30563 - SURFACE
      ?auto_30564 - SURFACE
    )
    :vars
    (
      ?auto_30571 - HOIST
      ?auto_30568 - PLACE
      ?auto_30566 - PLACE
      ?auto_30565 - HOIST
      ?auto_30572 - SURFACE
      ?auto_30570 - TRUCK
      ?auto_30573 - PLACE
      ?auto_30567 - HOIST
      ?auto_30569 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30571 ?auto_30568 ) ( IS-CRATE ?auto_30564 ) ( not ( = ?auto_30563 ?auto_30564 ) ) ( not ( = ?auto_30562 ?auto_30563 ) ) ( not ( = ?auto_30562 ?auto_30564 ) ) ( not ( = ?auto_30566 ?auto_30568 ) ) ( HOIST-AT ?auto_30565 ?auto_30566 ) ( not ( = ?auto_30571 ?auto_30565 ) ) ( AVAILABLE ?auto_30565 ) ( SURFACE-AT ?auto_30564 ?auto_30566 ) ( ON ?auto_30564 ?auto_30572 ) ( CLEAR ?auto_30564 ) ( not ( = ?auto_30563 ?auto_30572 ) ) ( not ( = ?auto_30564 ?auto_30572 ) ) ( not ( = ?auto_30562 ?auto_30572 ) ) ( SURFACE-AT ?auto_30562 ?auto_30568 ) ( CLEAR ?auto_30562 ) ( IS-CRATE ?auto_30563 ) ( AVAILABLE ?auto_30571 ) ( TRUCK-AT ?auto_30570 ?auto_30573 ) ( not ( = ?auto_30573 ?auto_30568 ) ) ( not ( = ?auto_30566 ?auto_30573 ) ) ( HOIST-AT ?auto_30567 ?auto_30573 ) ( not ( = ?auto_30571 ?auto_30567 ) ) ( not ( = ?auto_30565 ?auto_30567 ) ) ( AVAILABLE ?auto_30567 ) ( SURFACE-AT ?auto_30563 ?auto_30573 ) ( ON ?auto_30563 ?auto_30569 ) ( CLEAR ?auto_30563 ) ( not ( = ?auto_30563 ?auto_30569 ) ) ( not ( = ?auto_30564 ?auto_30569 ) ) ( not ( = ?auto_30562 ?auto_30569 ) ) ( not ( = ?auto_30572 ?auto_30569 ) ) ( ON ?auto_30562 ?auto_30561 ) ( not ( = ?auto_30561 ?auto_30562 ) ) ( not ( = ?auto_30561 ?auto_30563 ) ) ( not ( = ?auto_30561 ?auto_30564 ) ) ( not ( = ?auto_30561 ?auto_30572 ) ) ( not ( = ?auto_30561 ?auto_30569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30562 ?auto_30563 ?auto_30564 )
      ( MAKE-3CRATE-VERIFY ?auto_30561 ?auto_30562 ?auto_30563 ?auto_30564 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30574 - SURFACE
      ?auto_30575 - SURFACE
      ?auto_30576 - SURFACE
      ?auto_30577 - SURFACE
      ?auto_30578 - SURFACE
    )
    :vars
    (
      ?auto_30585 - HOIST
      ?auto_30582 - PLACE
      ?auto_30580 - PLACE
      ?auto_30579 - HOIST
      ?auto_30586 - SURFACE
      ?auto_30584 - TRUCK
      ?auto_30587 - PLACE
      ?auto_30581 - HOIST
      ?auto_30583 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30585 ?auto_30582 ) ( IS-CRATE ?auto_30578 ) ( not ( = ?auto_30577 ?auto_30578 ) ) ( not ( = ?auto_30576 ?auto_30577 ) ) ( not ( = ?auto_30576 ?auto_30578 ) ) ( not ( = ?auto_30580 ?auto_30582 ) ) ( HOIST-AT ?auto_30579 ?auto_30580 ) ( not ( = ?auto_30585 ?auto_30579 ) ) ( AVAILABLE ?auto_30579 ) ( SURFACE-AT ?auto_30578 ?auto_30580 ) ( ON ?auto_30578 ?auto_30586 ) ( CLEAR ?auto_30578 ) ( not ( = ?auto_30577 ?auto_30586 ) ) ( not ( = ?auto_30578 ?auto_30586 ) ) ( not ( = ?auto_30576 ?auto_30586 ) ) ( SURFACE-AT ?auto_30576 ?auto_30582 ) ( CLEAR ?auto_30576 ) ( IS-CRATE ?auto_30577 ) ( AVAILABLE ?auto_30585 ) ( TRUCK-AT ?auto_30584 ?auto_30587 ) ( not ( = ?auto_30587 ?auto_30582 ) ) ( not ( = ?auto_30580 ?auto_30587 ) ) ( HOIST-AT ?auto_30581 ?auto_30587 ) ( not ( = ?auto_30585 ?auto_30581 ) ) ( not ( = ?auto_30579 ?auto_30581 ) ) ( AVAILABLE ?auto_30581 ) ( SURFACE-AT ?auto_30577 ?auto_30587 ) ( ON ?auto_30577 ?auto_30583 ) ( CLEAR ?auto_30577 ) ( not ( = ?auto_30577 ?auto_30583 ) ) ( not ( = ?auto_30578 ?auto_30583 ) ) ( not ( = ?auto_30576 ?auto_30583 ) ) ( not ( = ?auto_30586 ?auto_30583 ) ) ( ON ?auto_30575 ?auto_30574 ) ( ON ?auto_30576 ?auto_30575 ) ( not ( = ?auto_30574 ?auto_30575 ) ) ( not ( = ?auto_30574 ?auto_30576 ) ) ( not ( = ?auto_30574 ?auto_30577 ) ) ( not ( = ?auto_30574 ?auto_30578 ) ) ( not ( = ?auto_30574 ?auto_30586 ) ) ( not ( = ?auto_30574 ?auto_30583 ) ) ( not ( = ?auto_30575 ?auto_30576 ) ) ( not ( = ?auto_30575 ?auto_30577 ) ) ( not ( = ?auto_30575 ?auto_30578 ) ) ( not ( = ?auto_30575 ?auto_30586 ) ) ( not ( = ?auto_30575 ?auto_30583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30576 ?auto_30577 ?auto_30578 )
      ( MAKE-4CRATE-VERIFY ?auto_30574 ?auto_30575 ?auto_30576 ?auto_30577 ?auto_30578 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30588 - SURFACE
      ?auto_30589 - SURFACE
      ?auto_30590 - SURFACE
      ?auto_30591 - SURFACE
      ?auto_30592 - SURFACE
      ?auto_30593 - SURFACE
    )
    :vars
    (
      ?auto_30600 - HOIST
      ?auto_30597 - PLACE
      ?auto_30595 - PLACE
      ?auto_30594 - HOIST
      ?auto_30601 - SURFACE
      ?auto_30599 - TRUCK
      ?auto_30602 - PLACE
      ?auto_30596 - HOIST
      ?auto_30598 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30600 ?auto_30597 ) ( IS-CRATE ?auto_30593 ) ( not ( = ?auto_30592 ?auto_30593 ) ) ( not ( = ?auto_30591 ?auto_30592 ) ) ( not ( = ?auto_30591 ?auto_30593 ) ) ( not ( = ?auto_30595 ?auto_30597 ) ) ( HOIST-AT ?auto_30594 ?auto_30595 ) ( not ( = ?auto_30600 ?auto_30594 ) ) ( AVAILABLE ?auto_30594 ) ( SURFACE-AT ?auto_30593 ?auto_30595 ) ( ON ?auto_30593 ?auto_30601 ) ( CLEAR ?auto_30593 ) ( not ( = ?auto_30592 ?auto_30601 ) ) ( not ( = ?auto_30593 ?auto_30601 ) ) ( not ( = ?auto_30591 ?auto_30601 ) ) ( SURFACE-AT ?auto_30591 ?auto_30597 ) ( CLEAR ?auto_30591 ) ( IS-CRATE ?auto_30592 ) ( AVAILABLE ?auto_30600 ) ( TRUCK-AT ?auto_30599 ?auto_30602 ) ( not ( = ?auto_30602 ?auto_30597 ) ) ( not ( = ?auto_30595 ?auto_30602 ) ) ( HOIST-AT ?auto_30596 ?auto_30602 ) ( not ( = ?auto_30600 ?auto_30596 ) ) ( not ( = ?auto_30594 ?auto_30596 ) ) ( AVAILABLE ?auto_30596 ) ( SURFACE-AT ?auto_30592 ?auto_30602 ) ( ON ?auto_30592 ?auto_30598 ) ( CLEAR ?auto_30592 ) ( not ( = ?auto_30592 ?auto_30598 ) ) ( not ( = ?auto_30593 ?auto_30598 ) ) ( not ( = ?auto_30591 ?auto_30598 ) ) ( not ( = ?auto_30601 ?auto_30598 ) ) ( ON ?auto_30589 ?auto_30588 ) ( ON ?auto_30590 ?auto_30589 ) ( ON ?auto_30591 ?auto_30590 ) ( not ( = ?auto_30588 ?auto_30589 ) ) ( not ( = ?auto_30588 ?auto_30590 ) ) ( not ( = ?auto_30588 ?auto_30591 ) ) ( not ( = ?auto_30588 ?auto_30592 ) ) ( not ( = ?auto_30588 ?auto_30593 ) ) ( not ( = ?auto_30588 ?auto_30601 ) ) ( not ( = ?auto_30588 ?auto_30598 ) ) ( not ( = ?auto_30589 ?auto_30590 ) ) ( not ( = ?auto_30589 ?auto_30591 ) ) ( not ( = ?auto_30589 ?auto_30592 ) ) ( not ( = ?auto_30589 ?auto_30593 ) ) ( not ( = ?auto_30589 ?auto_30601 ) ) ( not ( = ?auto_30589 ?auto_30598 ) ) ( not ( = ?auto_30590 ?auto_30591 ) ) ( not ( = ?auto_30590 ?auto_30592 ) ) ( not ( = ?auto_30590 ?auto_30593 ) ) ( not ( = ?auto_30590 ?auto_30601 ) ) ( not ( = ?auto_30590 ?auto_30598 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30591 ?auto_30592 ?auto_30593 )
      ( MAKE-5CRATE-VERIFY ?auto_30588 ?auto_30589 ?auto_30590 ?auto_30591 ?auto_30592 ?auto_30593 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30603 - SURFACE
      ?auto_30604 - SURFACE
    )
    :vars
    (
      ?auto_30612 - HOIST
      ?auto_30609 - PLACE
      ?auto_30608 - SURFACE
      ?auto_30606 - PLACE
      ?auto_30605 - HOIST
      ?auto_30613 - SURFACE
      ?auto_30614 - PLACE
      ?auto_30607 - HOIST
      ?auto_30610 - SURFACE
      ?auto_30611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30612 ?auto_30609 ) ( IS-CRATE ?auto_30604 ) ( not ( = ?auto_30603 ?auto_30604 ) ) ( not ( = ?auto_30608 ?auto_30603 ) ) ( not ( = ?auto_30608 ?auto_30604 ) ) ( not ( = ?auto_30606 ?auto_30609 ) ) ( HOIST-AT ?auto_30605 ?auto_30606 ) ( not ( = ?auto_30612 ?auto_30605 ) ) ( AVAILABLE ?auto_30605 ) ( SURFACE-AT ?auto_30604 ?auto_30606 ) ( ON ?auto_30604 ?auto_30613 ) ( CLEAR ?auto_30604 ) ( not ( = ?auto_30603 ?auto_30613 ) ) ( not ( = ?auto_30604 ?auto_30613 ) ) ( not ( = ?auto_30608 ?auto_30613 ) ) ( SURFACE-AT ?auto_30608 ?auto_30609 ) ( CLEAR ?auto_30608 ) ( IS-CRATE ?auto_30603 ) ( AVAILABLE ?auto_30612 ) ( not ( = ?auto_30614 ?auto_30609 ) ) ( not ( = ?auto_30606 ?auto_30614 ) ) ( HOIST-AT ?auto_30607 ?auto_30614 ) ( not ( = ?auto_30612 ?auto_30607 ) ) ( not ( = ?auto_30605 ?auto_30607 ) ) ( AVAILABLE ?auto_30607 ) ( SURFACE-AT ?auto_30603 ?auto_30614 ) ( ON ?auto_30603 ?auto_30610 ) ( CLEAR ?auto_30603 ) ( not ( = ?auto_30603 ?auto_30610 ) ) ( not ( = ?auto_30604 ?auto_30610 ) ) ( not ( = ?auto_30608 ?auto_30610 ) ) ( not ( = ?auto_30613 ?auto_30610 ) ) ( TRUCK-AT ?auto_30611 ?auto_30609 ) )
    :subtasks
    ( ( !DRIVE ?auto_30611 ?auto_30609 ?auto_30614 )
      ( MAKE-2CRATE ?auto_30608 ?auto_30603 ?auto_30604 )
      ( MAKE-1CRATE-VERIFY ?auto_30603 ?auto_30604 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30615 - SURFACE
      ?auto_30616 - SURFACE
      ?auto_30617 - SURFACE
    )
    :vars
    (
      ?auto_30621 - HOIST
      ?auto_30622 - PLACE
      ?auto_30623 - PLACE
      ?auto_30620 - HOIST
      ?auto_30619 - SURFACE
      ?auto_30625 - PLACE
      ?auto_30618 - HOIST
      ?auto_30626 - SURFACE
      ?auto_30624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30621 ?auto_30622 ) ( IS-CRATE ?auto_30617 ) ( not ( = ?auto_30616 ?auto_30617 ) ) ( not ( = ?auto_30615 ?auto_30616 ) ) ( not ( = ?auto_30615 ?auto_30617 ) ) ( not ( = ?auto_30623 ?auto_30622 ) ) ( HOIST-AT ?auto_30620 ?auto_30623 ) ( not ( = ?auto_30621 ?auto_30620 ) ) ( AVAILABLE ?auto_30620 ) ( SURFACE-AT ?auto_30617 ?auto_30623 ) ( ON ?auto_30617 ?auto_30619 ) ( CLEAR ?auto_30617 ) ( not ( = ?auto_30616 ?auto_30619 ) ) ( not ( = ?auto_30617 ?auto_30619 ) ) ( not ( = ?auto_30615 ?auto_30619 ) ) ( SURFACE-AT ?auto_30615 ?auto_30622 ) ( CLEAR ?auto_30615 ) ( IS-CRATE ?auto_30616 ) ( AVAILABLE ?auto_30621 ) ( not ( = ?auto_30625 ?auto_30622 ) ) ( not ( = ?auto_30623 ?auto_30625 ) ) ( HOIST-AT ?auto_30618 ?auto_30625 ) ( not ( = ?auto_30621 ?auto_30618 ) ) ( not ( = ?auto_30620 ?auto_30618 ) ) ( AVAILABLE ?auto_30618 ) ( SURFACE-AT ?auto_30616 ?auto_30625 ) ( ON ?auto_30616 ?auto_30626 ) ( CLEAR ?auto_30616 ) ( not ( = ?auto_30616 ?auto_30626 ) ) ( not ( = ?auto_30617 ?auto_30626 ) ) ( not ( = ?auto_30615 ?auto_30626 ) ) ( not ( = ?auto_30619 ?auto_30626 ) ) ( TRUCK-AT ?auto_30624 ?auto_30622 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30616 ?auto_30617 )
      ( MAKE-2CRATE-VERIFY ?auto_30615 ?auto_30616 ?auto_30617 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30627 - SURFACE
      ?auto_30628 - SURFACE
      ?auto_30629 - SURFACE
      ?auto_30630 - SURFACE
    )
    :vars
    (
      ?auto_30632 - HOIST
      ?auto_30635 - PLACE
      ?auto_30639 - PLACE
      ?auto_30631 - HOIST
      ?auto_30634 - SURFACE
      ?auto_30638 - PLACE
      ?auto_30637 - HOIST
      ?auto_30636 - SURFACE
      ?auto_30633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30632 ?auto_30635 ) ( IS-CRATE ?auto_30630 ) ( not ( = ?auto_30629 ?auto_30630 ) ) ( not ( = ?auto_30628 ?auto_30629 ) ) ( not ( = ?auto_30628 ?auto_30630 ) ) ( not ( = ?auto_30639 ?auto_30635 ) ) ( HOIST-AT ?auto_30631 ?auto_30639 ) ( not ( = ?auto_30632 ?auto_30631 ) ) ( AVAILABLE ?auto_30631 ) ( SURFACE-AT ?auto_30630 ?auto_30639 ) ( ON ?auto_30630 ?auto_30634 ) ( CLEAR ?auto_30630 ) ( not ( = ?auto_30629 ?auto_30634 ) ) ( not ( = ?auto_30630 ?auto_30634 ) ) ( not ( = ?auto_30628 ?auto_30634 ) ) ( SURFACE-AT ?auto_30628 ?auto_30635 ) ( CLEAR ?auto_30628 ) ( IS-CRATE ?auto_30629 ) ( AVAILABLE ?auto_30632 ) ( not ( = ?auto_30638 ?auto_30635 ) ) ( not ( = ?auto_30639 ?auto_30638 ) ) ( HOIST-AT ?auto_30637 ?auto_30638 ) ( not ( = ?auto_30632 ?auto_30637 ) ) ( not ( = ?auto_30631 ?auto_30637 ) ) ( AVAILABLE ?auto_30637 ) ( SURFACE-AT ?auto_30629 ?auto_30638 ) ( ON ?auto_30629 ?auto_30636 ) ( CLEAR ?auto_30629 ) ( not ( = ?auto_30629 ?auto_30636 ) ) ( not ( = ?auto_30630 ?auto_30636 ) ) ( not ( = ?auto_30628 ?auto_30636 ) ) ( not ( = ?auto_30634 ?auto_30636 ) ) ( TRUCK-AT ?auto_30633 ?auto_30635 ) ( ON ?auto_30628 ?auto_30627 ) ( not ( = ?auto_30627 ?auto_30628 ) ) ( not ( = ?auto_30627 ?auto_30629 ) ) ( not ( = ?auto_30627 ?auto_30630 ) ) ( not ( = ?auto_30627 ?auto_30634 ) ) ( not ( = ?auto_30627 ?auto_30636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30628 ?auto_30629 ?auto_30630 )
      ( MAKE-3CRATE-VERIFY ?auto_30627 ?auto_30628 ?auto_30629 ?auto_30630 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30640 - SURFACE
      ?auto_30641 - SURFACE
      ?auto_30642 - SURFACE
      ?auto_30643 - SURFACE
      ?auto_30644 - SURFACE
    )
    :vars
    (
      ?auto_30646 - HOIST
      ?auto_30649 - PLACE
      ?auto_30653 - PLACE
      ?auto_30645 - HOIST
      ?auto_30648 - SURFACE
      ?auto_30652 - PLACE
      ?auto_30651 - HOIST
      ?auto_30650 - SURFACE
      ?auto_30647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30646 ?auto_30649 ) ( IS-CRATE ?auto_30644 ) ( not ( = ?auto_30643 ?auto_30644 ) ) ( not ( = ?auto_30642 ?auto_30643 ) ) ( not ( = ?auto_30642 ?auto_30644 ) ) ( not ( = ?auto_30653 ?auto_30649 ) ) ( HOIST-AT ?auto_30645 ?auto_30653 ) ( not ( = ?auto_30646 ?auto_30645 ) ) ( AVAILABLE ?auto_30645 ) ( SURFACE-AT ?auto_30644 ?auto_30653 ) ( ON ?auto_30644 ?auto_30648 ) ( CLEAR ?auto_30644 ) ( not ( = ?auto_30643 ?auto_30648 ) ) ( not ( = ?auto_30644 ?auto_30648 ) ) ( not ( = ?auto_30642 ?auto_30648 ) ) ( SURFACE-AT ?auto_30642 ?auto_30649 ) ( CLEAR ?auto_30642 ) ( IS-CRATE ?auto_30643 ) ( AVAILABLE ?auto_30646 ) ( not ( = ?auto_30652 ?auto_30649 ) ) ( not ( = ?auto_30653 ?auto_30652 ) ) ( HOIST-AT ?auto_30651 ?auto_30652 ) ( not ( = ?auto_30646 ?auto_30651 ) ) ( not ( = ?auto_30645 ?auto_30651 ) ) ( AVAILABLE ?auto_30651 ) ( SURFACE-AT ?auto_30643 ?auto_30652 ) ( ON ?auto_30643 ?auto_30650 ) ( CLEAR ?auto_30643 ) ( not ( = ?auto_30643 ?auto_30650 ) ) ( not ( = ?auto_30644 ?auto_30650 ) ) ( not ( = ?auto_30642 ?auto_30650 ) ) ( not ( = ?auto_30648 ?auto_30650 ) ) ( TRUCK-AT ?auto_30647 ?auto_30649 ) ( ON ?auto_30641 ?auto_30640 ) ( ON ?auto_30642 ?auto_30641 ) ( not ( = ?auto_30640 ?auto_30641 ) ) ( not ( = ?auto_30640 ?auto_30642 ) ) ( not ( = ?auto_30640 ?auto_30643 ) ) ( not ( = ?auto_30640 ?auto_30644 ) ) ( not ( = ?auto_30640 ?auto_30648 ) ) ( not ( = ?auto_30640 ?auto_30650 ) ) ( not ( = ?auto_30641 ?auto_30642 ) ) ( not ( = ?auto_30641 ?auto_30643 ) ) ( not ( = ?auto_30641 ?auto_30644 ) ) ( not ( = ?auto_30641 ?auto_30648 ) ) ( not ( = ?auto_30641 ?auto_30650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30642 ?auto_30643 ?auto_30644 )
      ( MAKE-4CRATE-VERIFY ?auto_30640 ?auto_30641 ?auto_30642 ?auto_30643 ?auto_30644 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30654 - SURFACE
      ?auto_30655 - SURFACE
      ?auto_30656 - SURFACE
      ?auto_30657 - SURFACE
      ?auto_30658 - SURFACE
      ?auto_30659 - SURFACE
    )
    :vars
    (
      ?auto_30661 - HOIST
      ?auto_30664 - PLACE
      ?auto_30668 - PLACE
      ?auto_30660 - HOIST
      ?auto_30663 - SURFACE
      ?auto_30667 - PLACE
      ?auto_30666 - HOIST
      ?auto_30665 - SURFACE
      ?auto_30662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30661 ?auto_30664 ) ( IS-CRATE ?auto_30659 ) ( not ( = ?auto_30658 ?auto_30659 ) ) ( not ( = ?auto_30657 ?auto_30658 ) ) ( not ( = ?auto_30657 ?auto_30659 ) ) ( not ( = ?auto_30668 ?auto_30664 ) ) ( HOIST-AT ?auto_30660 ?auto_30668 ) ( not ( = ?auto_30661 ?auto_30660 ) ) ( AVAILABLE ?auto_30660 ) ( SURFACE-AT ?auto_30659 ?auto_30668 ) ( ON ?auto_30659 ?auto_30663 ) ( CLEAR ?auto_30659 ) ( not ( = ?auto_30658 ?auto_30663 ) ) ( not ( = ?auto_30659 ?auto_30663 ) ) ( not ( = ?auto_30657 ?auto_30663 ) ) ( SURFACE-AT ?auto_30657 ?auto_30664 ) ( CLEAR ?auto_30657 ) ( IS-CRATE ?auto_30658 ) ( AVAILABLE ?auto_30661 ) ( not ( = ?auto_30667 ?auto_30664 ) ) ( not ( = ?auto_30668 ?auto_30667 ) ) ( HOIST-AT ?auto_30666 ?auto_30667 ) ( not ( = ?auto_30661 ?auto_30666 ) ) ( not ( = ?auto_30660 ?auto_30666 ) ) ( AVAILABLE ?auto_30666 ) ( SURFACE-AT ?auto_30658 ?auto_30667 ) ( ON ?auto_30658 ?auto_30665 ) ( CLEAR ?auto_30658 ) ( not ( = ?auto_30658 ?auto_30665 ) ) ( not ( = ?auto_30659 ?auto_30665 ) ) ( not ( = ?auto_30657 ?auto_30665 ) ) ( not ( = ?auto_30663 ?auto_30665 ) ) ( TRUCK-AT ?auto_30662 ?auto_30664 ) ( ON ?auto_30655 ?auto_30654 ) ( ON ?auto_30656 ?auto_30655 ) ( ON ?auto_30657 ?auto_30656 ) ( not ( = ?auto_30654 ?auto_30655 ) ) ( not ( = ?auto_30654 ?auto_30656 ) ) ( not ( = ?auto_30654 ?auto_30657 ) ) ( not ( = ?auto_30654 ?auto_30658 ) ) ( not ( = ?auto_30654 ?auto_30659 ) ) ( not ( = ?auto_30654 ?auto_30663 ) ) ( not ( = ?auto_30654 ?auto_30665 ) ) ( not ( = ?auto_30655 ?auto_30656 ) ) ( not ( = ?auto_30655 ?auto_30657 ) ) ( not ( = ?auto_30655 ?auto_30658 ) ) ( not ( = ?auto_30655 ?auto_30659 ) ) ( not ( = ?auto_30655 ?auto_30663 ) ) ( not ( = ?auto_30655 ?auto_30665 ) ) ( not ( = ?auto_30656 ?auto_30657 ) ) ( not ( = ?auto_30656 ?auto_30658 ) ) ( not ( = ?auto_30656 ?auto_30659 ) ) ( not ( = ?auto_30656 ?auto_30663 ) ) ( not ( = ?auto_30656 ?auto_30665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30657 ?auto_30658 ?auto_30659 )
      ( MAKE-5CRATE-VERIFY ?auto_30654 ?auto_30655 ?auto_30656 ?auto_30657 ?auto_30658 ?auto_30659 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30669 - SURFACE
      ?auto_30670 - SURFACE
    )
    :vars
    (
      ?auto_30672 - HOIST
      ?auto_30675 - PLACE
      ?auto_30677 - SURFACE
      ?auto_30680 - PLACE
      ?auto_30671 - HOIST
      ?auto_30674 - SURFACE
      ?auto_30679 - PLACE
      ?auto_30678 - HOIST
      ?auto_30676 - SURFACE
      ?auto_30673 - TRUCK
      ?auto_30681 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30672 ?auto_30675 ) ( IS-CRATE ?auto_30670 ) ( not ( = ?auto_30669 ?auto_30670 ) ) ( not ( = ?auto_30677 ?auto_30669 ) ) ( not ( = ?auto_30677 ?auto_30670 ) ) ( not ( = ?auto_30680 ?auto_30675 ) ) ( HOIST-AT ?auto_30671 ?auto_30680 ) ( not ( = ?auto_30672 ?auto_30671 ) ) ( AVAILABLE ?auto_30671 ) ( SURFACE-AT ?auto_30670 ?auto_30680 ) ( ON ?auto_30670 ?auto_30674 ) ( CLEAR ?auto_30670 ) ( not ( = ?auto_30669 ?auto_30674 ) ) ( not ( = ?auto_30670 ?auto_30674 ) ) ( not ( = ?auto_30677 ?auto_30674 ) ) ( IS-CRATE ?auto_30669 ) ( not ( = ?auto_30679 ?auto_30675 ) ) ( not ( = ?auto_30680 ?auto_30679 ) ) ( HOIST-AT ?auto_30678 ?auto_30679 ) ( not ( = ?auto_30672 ?auto_30678 ) ) ( not ( = ?auto_30671 ?auto_30678 ) ) ( AVAILABLE ?auto_30678 ) ( SURFACE-AT ?auto_30669 ?auto_30679 ) ( ON ?auto_30669 ?auto_30676 ) ( CLEAR ?auto_30669 ) ( not ( = ?auto_30669 ?auto_30676 ) ) ( not ( = ?auto_30670 ?auto_30676 ) ) ( not ( = ?auto_30677 ?auto_30676 ) ) ( not ( = ?auto_30674 ?auto_30676 ) ) ( TRUCK-AT ?auto_30673 ?auto_30675 ) ( SURFACE-AT ?auto_30681 ?auto_30675 ) ( CLEAR ?auto_30681 ) ( LIFTING ?auto_30672 ?auto_30677 ) ( IS-CRATE ?auto_30677 ) ( not ( = ?auto_30681 ?auto_30677 ) ) ( not ( = ?auto_30669 ?auto_30681 ) ) ( not ( = ?auto_30670 ?auto_30681 ) ) ( not ( = ?auto_30674 ?auto_30681 ) ) ( not ( = ?auto_30676 ?auto_30681 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30681 ?auto_30677 )
      ( MAKE-2CRATE ?auto_30677 ?auto_30669 ?auto_30670 )
      ( MAKE-1CRATE-VERIFY ?auto_30669 ?auto_30670 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30682 - SURFACE
      ?auto_30683 - SURFACE
      ?auto_30684 - SURFACE
    )
    :vars
    (
      ?auto_30689 - HOIST
      ?auto_30693 - PLACE
      ?auto_30694 - PLACE
      ?auto_30685 - HOIST
      ?auto_30691 - SURFACE
      ?auto_30688 - PLACE
      ?auto_30690 - HOIST
      ?auto_30692 - SURFACE
      ?auto_30687 - TRUCK
      ?auto_30686 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30689 ?auto_30693 ) ( IS-CRATE ?auto_30684 ) ( not ( = ?auto_30683 ?auto_30684 ) ) ( not ( = ?auto_30682 ?auto_30683 ) ) ( not ( = ?auto_30682 ?auto_30684 ) ) ( not ( = ?auto_30694 ?auto_30693 ) ) ( HOIST-AT ?auto_30685 ?auto_30694 ) ( not ( = ?auto_30689 ?auto_30685 ) ) ( AVAILABLE ?auto_30685 ) ( SURFACE-AT ?auto_30684 ?auto_30694 ) ( ON ?auto_30684 ?auto_30691 ) ( CLEAR ?auto_30684 ) ( not ( = ?auto_30683 ?auto_30691 ) ) ( not ( = ?auto_30684 ?auto_30691 ) ) ( not ( = ?auto_30682 ?auto_30691 ) ) ( IS-CRATE ?auto_30683 ) ( not ( = ?auto_30688 ?auto_30693 ) ) ( not ( = ?auto_30694 ?auto_30688 ) ) ( HOIST-AT ?auto_30690 ?auto_30688 ) ( not ( = ?auto_30689 ?auto_30690 ) ) ( not ( = ?auto_30685 ?auto_30690 ) ) ( AVAILABLE ?auto_30690 ) ( SURFACE-AT ?auto_30683 ?auto_30688 ) ( ON ?auto_30683 ?auto_30692 ) ( CLEAR ?auto_30683 ) ( not ( = ?auto_30683 ?auto_30692 ) ) ( not ( = ?auto_30684 ?auto_30692 ) ) ( not ( = ?auto_30682 ?auto_30692 ) ) ( not ( = ?auto_30691 ?auto_30692 ) ) ( TRUCK-AT ?auto_30687 ?auto_30693 ) ( SURFACE-AT ?auto_30686 ?auto_30693 ) ( CLEAR ?auto_30686 ) ( LIFTING ?auto_30689 ?auto_30682 ) ( IS-CRATE ?auto_30682 ) ( not ( = ?auto_30686 ?auto_30682 ) ) ( not ( = ?auto_30683 ?auto_30686 ) ) ( not ( = ?auto_30684 ?auto_30686 ) ) ( not ( = ?auto_30691 ?auto_30686 ) ) ( not ( = ?auto_30692 ?auto_30686 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30683 ?auto_30684 )
      ( MAKE-2CRATE-VERIFY ?auto_30682 ?auto_30683 ?auto_30684 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30695 - SURFACE
      ?auto_30696 - SURFACE
      ?auto_30697 - SURFACE
      ?auto_30698 - SURFACE
    )
    :vars
    (
      ?auto_30705 - HOIST
      ?auto_30703 - PLACE
      ?auto_30699 - PLACE
      ?auto_30706 - HOIST
      ?auto_30704 - SURFACE
      ?auto_30700 - PLACE
      ?auto_30707 - HOIST
      ?auto_30702 - SURFACE
      ?auto_30701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30705 ?auto_30703 ) ( IS-CRATE ?auto_30698 ) ( not ( = ?auto_30697 ?auto_30698 ) ) ( not ( = ?auto_30696 ?auto_30697 ) ) ( not ( = ?auto_30696 ?auto_30698 ) ) ( not ( = ?auto_30699 ?auto_30703 ) ) ( HOIST-AT ?auto_30706 ?auto_30699 ) ( not ( = ?auto_30705 ?auto_30706 ) ) ( AVAILABLE ?auto_30706 ) ( SURFACE-AT ?auto_30698 ?auto_30699 ) ( ON ?auto_30698 ?auto_30704 ) ( CLEAR ?auto_30698 ) ( not ( = ?auto_30697 ?auto_30704 ) ) ( not ( = ?auto_30698 ?auto_30704 ) ) ( not ( = ?auto_30696 ?auto_30704 ) ) ( IS-CRATE ?auto_30697 ) ( not ( = ?auto_30700 ?auto_30703 ) ) ( not ( = ?auto_30699 ?auto_30700 ) ) ( HOIST-AT ?auto_30707 ?auto_30700 ) ( not ( = ?auto_30705 ?auto_30707 ) ) ( not ( = ?auto_30706 ?auto_30707 ) ) ( AVAILABLE ?auto_30707 ) ( SURFACE-AT ?auto_30697 ?auto_30700 ) ( ON ?auto_30697 ?auto_30702 ) ( CLEAR ?auto_30697 ) ( not ( = ?auto_30697 ?auto_30702 ) ) ( not ( = ?auto_30698 ?auto_30702 ) ) ( not ( = ?auto_30696 ?auto_30702 ) ) ( not ( = ?auto_30704 ?auto_30702 ) ) ( TRUCK-AT ?auto_30701 ?auto_30703 ) ( SURFACE-AT ?auto_30695 ?auto_30703 ) ( CLEAR ?auto_30695 ) ( LIFTING ?auto_30705 ?auto_30696 ) ( IS-CRATE ?auto_30696 ) ( not ( = ?auto_30695 ?auto_30696 ) ) ( not ( = ?auto_30697 ?auto_30695 ) ) ( not ( = ?auto_30698 ?auto_30695 ) ) ( not ( = ?auto_30704 ?auto_30695 ) ) ( not ( = ?auto_30702 ?auto_30695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30696 ?auto_30697 ?auto_30698 )
      ( MAKE-3CRATE-VERIFY ?auto_30695 ?auto_30696 ?auto_30697 ?auto_30698 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30708 - SURFACE
      ?auto_30709 - SURFACE
      ?auto_30710 - SURFACE
      ?auto_30711 - SURFACE
      ?auto_30712 - SURFACE
    )
    :vars
    (
      ?auto_30719 - HOIST
      ?auto_30717 - PLACE
      ?auto_30713 - PLACE
      ?auto_30720 - HOIST
      ?auto_30718 - SURFACE
      ?auto_30714 - PLACE
      ?auto_30721 - HOIST
      ?auto_30716 - SURFACE
      ?auto_30715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30719 ?auto_30717 ) ( IS-CRATE ?auto_30712 ) ( not ( = ?auto_30711 ?auto_30712 ) ) ( not ( = ?auto_30710 ?auto_30711 ) ) ( not ( = ?auto_30710 ?auto_30712 ) ) ( not ( = ?auto_30713 ?auto_30717 ) ) ( HOIST-AT ?auto_30720 ?auto_30713 ) ( not ( = ?auto_30719 ?auto_30720 ) ) ( AVAILABLE ?auto_30720 ) ( SURFACE-AT ?auto_30712 ?auto_30713 ) ( ON ?auto_30712 ?auto_30718 ) ( CLEAR ?auto_30712 ) ( not ( = ?auto_30711 ?auto_30718 ) ) ( not ( = ?auto_30712 ?auto_30718 ) ) ( not ( = ?auto_30710 ?auto_30718 ) ) ( IS-CRATE ?auto_30711 ) ( not ( = ?auto_30714 ?auto_30717 ) ) ( not ( = ?auto_30713 ?auto_30714 ) ) ( HOIST-AT ?auto_30721 ?auto_30714 ) ( not ( = ?auto_30719 ?auto_30721 ) ) ( not ( = ?auto_30720 ?auto_30721 ) ) ( AVAILABLE ?auto_30721 ) ( SURFACE-AT ?auto_30711 ?auto_30714 ) ( ON ?auto_30711 ?auto_30716 ) ( CLEAR ?auto_30711 ) ( not ( = ?auto_30711 ?auto_30716 ) ) ( not ( = ?auto_30712 ?auto_30716 ) ) ( not ( = ?auto_30710 ?auto_30716 ) ) ( not ( = ?auto_30718 ?auto_30716 ) ) ( TRUCK-AT ?auto_30715 ?auto_30717 ) ( SURFACE-AT ?auto_30709 ?auto_30717 ) ( CLEAR ?auto_30709 ) ( LIFTING ?auto_30719 ?auto_30710 ) ( IS-CRATE ?auto_30710 ) ( not ( = ?auto_30709 ?auto_30710 ) ) ( not ( = ?auto_30711 ?auto_30709 ) ) ( not ( = ?auto_30712 ?auto_30709 ) ) ( not ( = ?auto_30718 ?auto_30709 ) ) ( not ( = ?auto_30716 ?auto_30709 ) ) ( ON ?auto_30709 ?auto_30708 ) ( not ( = ?auto_30708 ?auto_30709 ) ) ( not ( = ?auto_30708 ?auto_30710 ) ) ( not ( = ?auto_30708 ?auto_30711 ) ) ( not ( = ?auto_30708 ?auto_30712 ) ) ( not ( = ?auto_30708 ?auto_30718 ) ) ( not ( = ?auto_30708 ?auto_30716 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30710 ?auto_30711 ?auto_30712 )
      ( MAKE-4CRATE-VERIFY ?auto_30708 ?auto_30709 ?auto_30710 ?auto_30711 ?auto_30712 ) )
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
      ?auto_30734 - HOIST
      ?auto_30732 - PLACE
      ?auto_30728 - PLACE
      ?auto_30735 - HOIST
      ?auto_30733 - SURFACE
      ?auto_30729 - PLACE
      ?auto_30736 - HOIST
      ?auto_30731 - SURFACE
      ?auto_30730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30734 ?auto_30732 ) ( IS-CRATE ?auto_30727 ) ( not ( = ?auto_30726 ?auto_30727 ) ) ( not ( = ?auto_30725 ?auto_30726 ) ) ( not ( = ?auto_30725 ?auto_30727 ) ) ( not ( = ?auto_30728 ?auto_30732 ) ) ( HOIST-AT ?auto_30735 ?auto_30728 ) ( not ( = ?auto_30734 ?auto_30735 ) ) ( AVAILABLE ?auto_30735 ) ( SURFACE-AT ?auto_30727 ?auto_30728 ) ( ON ?auto_30727 ?auto_30733 ) ( CLEAR ?auto_30727 ) ( not ( = ?auto_30726 ?auto_30733 ) ) ( not ( = ?auto_30727 ?auto_30733 ) ) ( not ( = ?auto_30725 ?auto_30733 ) ) ( IS-CRATE ?auto_30726 ) ( not ( = ?auto_30729 ?auto_30732 ) ) ( not ( = ?auto_30728 ?auto_30729 ) ) ( HOIST-AT ?auto_30736 ?auto_30729 ) ( not ( = ?auto_30734 ?auto_30736 ) ) ( not ( = ?auto_30735 ?auto_30736 ) ) ( AVAILABLE ?auto_30736 ) ( SURFACE-AT ?auto_30726 ?auto_30729 ) ( ON ?auto_30726 ?auto_30731 ) ( CLEAR ?auto_30726 ) ( not ( = ?auto_30726 ?auto_30731 ) ) ( not ( = ?auto_30727 ?auto_30731 ) ) ( not ( = ?auto_30725 ?auto_30731 ) ) ( not ( = ?auto_30733 ?auto_30731 ) ) ( TRUCK-AT ?auto_30730 ?auto_30732 ) ( SURFACE-AT ?auto_30724 ?auto_30732 ) ( CLEAR ?auto_30724 ) ( LIFTING ?auto_30734 ?auto_30725 ) ( IS-CRATE ?auto_30725 ) ( not ( = ?auto_30724 ?auto_30725 ) ) ( not ( = ?auto_30726 ?auto_30724 ) ) ( not ( = ?auto_30727 ?auto_30724 ) ) ( not ( = ?auto_30733 ?auto_30724 ) ) ( not ( = ?auto_30731 ?auto_30724 ) ) ( ON ?auto_30723 ?auto_30722 ) ( ON ?auto_30724 ?auto_30723 ) ( not ( = ?auto_30722 ?auto_30723 ) ) ( not ( = ?auto_30722 ?auto_30724 ) ) ( not ( = ?auto_30722 ?auto_30725 ) ) ( not ( = ?auto_30722 ?auto_30726 ) ) ( not ( = ?auto_30722 ?auto_30727 ) ) ( not ( = ?auto_30722 ?auto_30733 ) ) ( not ( = ?auto_30722 ?auto_30731 ) ) ( not ( = ?auto_30723 ?auto_30724 ) ) ( not ( = ?auto_30723 ?auto_30725 ) ) ( not ( = ?auto_30723 ?auto_30726 ) ) ( not ( = ?auto_30723 ?auto_30727 ) ) ( not ( = ?auto_30723 ?auto_30733 ) ) ( not ( = ?auto_30723 ?auto_30731 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30725 ?auto_30726 ?auto_30727 )
      ( MAKE-5CRATE-VERIFY ?auto_30722 ?auto_30723 ?auto_30724 ?auto_30725 ?auto_30726 ?auto_30727 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30737 - SURFACE
      ?auto_30738 - SURFACE
    )
    :vars
    (
      ?auto_30746 - HOIST
      ?auto_30744 - PLACE
      ?auto_30742 - SURFACE
      ?auto_30739 - PLACE
      ?auto_30747 - HOIST
      ?auto_30745 - SURFACE
      ?auto_30740 - PLACE
      ?auto_30749 - HOIST
      ?auto_30743 - SURFACE
      ?auto_30741 - TRUCK
      ?auto_30748 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30746 ?auto_30744 ) ( IS-CRATE ?auto_30738 ) ( not ( = ?auto_30737 ?auto_30738 ) ) ( not ( = ?auto_30742 ?auto_30737 ) ) ( not ( = ?auto_30742 ?auto_30738 ) ) ( not ( = ?auto_30739 ?auto_30744 ) ) ( HOIST-AT ?auto_30747 ?auto_30739 ) ( not ( = ?auto_30746 ?auto_30747 ) ) ( AVAILABLE ?auto_30747 ) ( SURFACE-AT ?auto_30738 ?auto_30739 ) ( ON ?auto_30738 ?auto_30745 ) ( CLEAR ?auto_30738 ) ( not ( = ?auto_30737 ?auto_30745 ) ) ( not ( = ?auto_30738 ?auto_30745 ) ) ( not ( = ?auto_30742 ?auto_30745 ) ) ( IS-CRATE ?auto_30737 ) ( not ( = ?auto_30740 ?auto_30744 ) ) ( not ( = ?auto_30739 ?auto_30740 ) ) ( HOIST-AT ?auto_30749 ?auto_30740 ) ( not ( = ?auto_30746 ?auto_30749 ) ) ( not ( = ?auto_30747 ?auto_30749 ) ) ( AVAILABLE ?auto_30749 ) ( SURFACE-AT ?auto_30737 ?auto_30740 ) ( ON ?auto_30737 ?auto_30743 ) ( CLEAR ?auto_30737 ) ( not ( = ?auto_30737 ?auto_30743 ) ) ( not ( = ?auto_30738 ?auto_30743 ) ) ( not ( = ?auto_30742 ?auto_30743 ) ) ( not ( = ?auto_30745 ?auto_30743 ) ) ( TRUCK-AT ?auto_30741 ?auto_30744 ) ( SURFACE-AT ?auto_30748 ?auto_30744 ) ( CLEAR ?auto_30748 ) ( IS-CRATE ?auto_30742 ) ( not ( = ?auto_30748 ?auto_30742 ) ) ( not ( = ?auto_30737 ?auto_30748 ) ) ( not ( = ?auto_30738 ?auto_30748 ) ) ( not ( = ?auto_30745 ?auto_30748 ) ) ( not ( = ?auto_30743 ?auto_30748 ) ) ( AVAILABLE ?auto_30746 ) ( IN ?auto_30742 ?auto_30741 ) )
    :subtasks
    ( ( !UNLOAD ?auto_30746 ?auto_30742 ?auto_30741 ?auto_30744 )
      ( MAKE-2CRATE ?auto_30742 ?auto_30737 ?auto_30738 )
      ( MAKE-1CRATE-VERIFY ?auto_30737 ?auto_30738 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30750 - SURFACE
      ?auto_30751 - SURFACE
      ?auto_30752 - SURFACE
    )
    :vars
    (
      ?auto_30757 - HOIST
      ?auto_30762 - PLACE
      ?auto_30759 - PLACE
      ?auto_30754 - HOIST
      ?auto_30753 - SURFACE
      ?auto_30756 - PLACE
      ?auto_30761 - HOIST
      ?auto_30758 - SURFACE
      ?auto_30760 - TRUCK
      ?auto_30755 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30757 ?auto_30762 ) ( IS-CRATE ?auto_30752 ) ( not ( = ?auto_30751 ?auto_30752 ) ) ( not ( = ?auto_30750 ?auto_30751 ) ) ( not ( = ?auto_30750 ?auto_30752 ) ) ( not ( = ?auto_30759 ?auto_30762 ) ) ( HOIST-AT ?auto_30754 ?auto_30759 ) ( not ( = ?auto_30757 ?auto_30754 ) ) ( AVAILABLE ?auto_30754 ) ( SURFACE-AT ?auto_30752 ?auto_30759 ) ( ON ?auto_30752 ?auto_30753 ) ( CLEAR ?auto_30752 ) ( not ( = ?auto_30751 ?auto_30753 ) ) ( not ( = ?auto_30752 ?auto_30753 ) ) ( not ( = ?auto_30750 ?auto_30753 ) ) ( IS-CRATE ?auto_30751 ) ( not ( = ?auto_30756 ?auto_30762 ) ) ( not ( = ?auto_30759 ?auto_30756 ) ) ( HOIST-AT ?auto_30761 ?auto_30756 ) ( not ( = ?auto_30757 ?auto_30761 ) ) ( not ( = ?auto_30754 ?auto_30761 ) ) ( AVAILABLE ?auto_30761 ) ( SURFACE-AT ?auto_30751 ?auto_30756 ) ( ON ?auto_30751 ?auto_30758 ) ( CLEAR ?auto_30751 ) ( not ( = ?auto_30751 ?auto_30758 ) ) ( not ( = ?auto_30752 ?auto_30758 ) ) ( not ( = ?auto_30750 ?auto_30758 ) ) ( not ( = ?auto_30753 ?auto_30758 ) ) ( TRUCK-AT ?auto_30760 ?auto_30762 ) ( SURFACE-AT ?auto_30755 ?auto_30762 ) ( CLEAR ?auto_30755 ) ( IS-CRATE ?auto_30750 ) ( not ( = ?auto_30755 ?auto_30750 ) ) ( not ( = ?auto_30751 ?auto_30755 ) ) ( not ( = ?auto_30752 ?auto_30755 ) ) ( not ( = ?auto_30753 ?auto_30755 ) ) ( not ( = ?auto_30758 ?auto_30755 ) ) ( AVAILABLE ?auto_30757 ) ( IN ?auto_30750 ?auto_30760 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30751 ?auto_30752 )
      ( MAKE-2CRATE-VERIFY ?auto_30750 ?auto_30751 ?auto_30752 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30763 - SURFACE
      ?auto_30764 - SURFACE
      ?auto_30765 - SURFACE
      ?auto_30766 - SURFACE
    )
    :vars
    (
      ?auto_30768 - HOIST
      ?auto_30769 - PLACE
      ?auto_30770 - PLACE
      ?auto_30771 - HOIST
      ?auto_30774 - SURFACE
      ?auto_30767 - PLACE
      ?auto_30775 - HOIST
      ?auto_30772 - SURFACE
      ?auto_30773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30768 ?auto_30769 ) ( IS-CRATE ?auto_30766 ) ( not ( = ?auto_30765 ?auto_30766 ) ) ( not ( = ?auto_30764 ?auto_30765 ) ) ( not ( = ?auto_30764 ?auto_30766 ) ) ( not ( = ?auto_30770 ?auto_30769 ) ) ( HOIST-AT ?auto_30771 ?auto_30770 ) ( not ( = ?auto_30768 ?auto_30771 ) ) ( AVAILABLE ?auto_30771 ) ( SURFACE-AT ?auto_30766 ?auto_30770 ) ( ON ?auto_30766 ?auto_30774 ) ( CLEAR ?auto_30766 ) ( not ( = ?auto_30765 ?auto_30774 ) ) ( not ( = ?auto_30766 ?auto_30774 ) ) ( not ( = ?auto_30764 ?auto_30774 ) ) ( IS-CRATE ?auto_30765 ) ( not ( = ?auto_30767 ?auto_30769 ) ) ( not ( = ?auto_30770 ?auto_30767 ) ) ( HOIST-AT ?auto_30775 ?auto_30767 ) ( not ( = ?auto_30768 ?auto_30775 ) ) ( not ( = ?auto_30771 ?auto_30775 ) ) ( AVAILABLE ?auto_30775 ) ( SURFACE-AT ?auto_30765 ?auto_30767 ) ( ON ?auto_30765 ?auto_30772 ) ( CLEAR ?auto_30765 ) ( not ( = ?auto_30765 ?auto_30772 ) ) ( not ( = ?auto_30766 ?auto_30772 ) ) ( not ( = ?auto_30764 ?auto_30772 ) ) ( not ( = ?auto_30774 ?auto_30772 ) ) ( TRUCK-AT ?auto_30773 ?auto_30769 ) ( SURFACE-AT ?auto_30763 ?auto_30769 ) ( CLEAR ?auto_30763 ) ( IS-CRATE ?auto_30764 ) ( not ( = ?auto_30763 ?auto_30764 ) ) ( not ( = ?auto_30765 ?auto_30763 ) ) ( not ( = ?auto_30766 ?auto_30763 ) ) ( not ( = ?auto_30774 ?auto_30763 ) ) ( not ( = ?auto_30772 ?auto_30763 ) ) ( AVAILABLE ?auto_30768 ) ( IN ?auto_30764 ?auto_30773 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30764 ?auto_30765 ?auto_30766 )
      ( MAKE-3CRATE-VERIFY ?auto_30763 ?auto_30764 ?auto_30765 ?auto_30766 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30776 - SURFACE
      ?auto_30777 - SURFACE
      ?auto_30778 - SURFACE
      ?auto_30779 - SURFACE
      ?auto_30780 - SURFACE
    )
    :vars
    (
      ?auto_30782 - HOIST
      ?auto_30783 - PLACE
      ?auto_30784 - PLACE
      ?auto_30785 - HOIST
      ?auto_30788 - SURFACE
      ?auto_30781 - PLACE
      ?auto_30789 - HOIST
      ?auto_30786 - SURFACE
      ?auto_30787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30782 ?auto_30783 ) ( IS-CRATE ?auto_30780 ) ( not ( = ?auto_30779 ?auto_30780 ) ) ( not ( = ?auto_30778 ?auto_30779 ) ) ( not ( = ?auto_30778 ?auto_30780 ) ) ( not ( = ?auto_30784 ?auto_30783 ) ) ( HOIST-AT ?auto_30785 ?auto_30784 ) ( not ( = ?auto_30782 ?auto_30785 ) ) ( AVAILABLE ?auto_30785 ) ( SURFACE-AT ?auto_30780 ?auto_30784 ) ( ON ?auto_30780 ?auto_30788 ) ( CLEAR ?auto_30780 ) ( not ( = ?auto_30779 ?auto_30788 ) ) ( not ( = ?auto_30780 ?auto_30788 ) ) ( not ( = ?auto_30778 ?auto_30788 ) ) ( IS-CRATE ?auto_30779 ) ( not ( = ?auto_30781 ?auto_30783 ) ) ( not ( = ?auto_30784 ?auto_30781 ) ) ( HOIST-AT ?auto_30789 ?auto_30781 ) ( not ( = ?auto_30782 ?auto_30789 ) ) ( not ( = ?auto_30785 ?auto_30789 ) ) ( AVAILABLE ?auto_30789 ) ( SURFACE-AT ?auto_30779 ?auto_30781 ) ( ON ?auto_30779 ?auto_30786 ) ( CLEAR ?auto_30779 ) ( not ( = ?auto_30779 ?auto_30786 ) ) ( not ( = ?auto_30780 ?auto_30786 ) ) ( not ( = ?auto_30778 ?auto_30786 ) ) ( not ( = ?auto_30788 ?auto_30786 ) ) ( TRUCK-AT ?auto_30787 ?auto_30783 ) ( SURFACE-AT ?auto_30777 ?auto_30783 ) ( CLEAR ?auto_30777 ) ( IS-CRATE ?auto_30778 ) ( not ( = ?auto_30777 ?auto_30778 ) ) ( not ( = ?auto_30779 ?auto_30777 ) ) ( not ( = ?auto_30780 ?auto_30777 ) ) ( not ( = ?auto_30788 ?auto_30777 ) ) ( not ( = ?auto_30786 ?auto_30777 ) ) ( AVAILABLE ?auto_30782 ) ( IN ?auto_30778 ?auto_30787 ) ( ON ?auto_30777 ?auto_30776 ) ( not ( = ?auto_30776 ?auto_30777 ) ) ( not ( = ?auto_30776 ?auto_30778 ) ) ( not ( = ?auto_30776 ?auto_30779 ) ) ( not ( = ?auto_30776 ?auto_30780 ) ) ( not ( = ?auto_30776 ?auto_30788 ) ) ( not ( = ?auto_30776 ?auto_30786 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30778 ?auto_30779 ?auto_30780 )
      ( MAKE-4CRATE-VERIFY ?auto_30776 ?auto_30777 ?auto_30778 ?auto_30779 ?auto_30780 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30790 - SURFACE
      ?auto_30791 - SURFACE
      ?auto_30792 - SURFACE
      ?auto_30793 - SURFACE
      ?auto_30794 - SURFACE
      ?auto_30795 - SURFACE
    )
    :vars
    (
      ?auto_30797 - HOIST
      ?auto_30798 - PLACE
      ?auto_30799 - PLACE
      ?auto_30800 - HOIST
      ?auto_30803 - SURFACE
      ?auto_30796 - PLACE
      ?auto_30804 - HOIST
      ?auto_30801 - SURFACE
      ?auto_30802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30797 ?auto_30798 ) ( IS-CRATE ?auto_30795 ) ( not ( = ?auto_30794 ?auto_30795 ) ) ( not ( = ?auto_30793 ?auto_30794 ) ) ( not ( = ?auto_30793 ?auto_30795 ) ) ( not ( = ?auto_30799 ?auto_30798 ) ) ( HOIST-AT ?auto_30800 ?auto_30799 ) ( not ( = ?auto_30797 ?auto_30800 ) ) ( AVAILABLE ?auto_30800 ) ( SURFACE-AT ?auto_30795 ?auto_30799 ) ( ON ?auto_30795 ?auto_30803 ) ( CLEAR ?auto_30795 ) ( not ( = ?auto_30794 ?auto_30803 ) ) ( not ( = ?auto_30795 ?auto_30803 ) ) ( not ( = ?auto_30793 ?auto_30803 ) ) ( IS-CRATE ?auto_30794 ) ( not ( = ?auto_30796 ?auto_30798 ) ) ( not ( = ?auto_30799 ?auto_30796 ) ) ( HOIST-AT ?auto_30804 ?auto_30796 ) ( not ( = ?auto_30797 ?auto_30804 ) ) ( not ( = ?auto_30800 ?auto_30804 ) ) ( AVAILABLE ?auto_30804 ) ( SURFACE-AT ?auto_30794 ?auto_30796 ) ( ON ?auto_30794 ?auto_30801 ) ( CLEAR ?auto_30794 ) ( not ( = ?auto_30794 ?auto_30801 ) ) ( not ( = ?auto_30795 ?auto_30801 ) ) ( not ( = ?auto_30793 ?auto_30801 ) ) ( not ( = ?auto_30803 ?auto_30801 ) ) ( TRUCK-AT ?auto_30802 ?auto_30798 ) ( SURFACE-AT ?auto_30792 ?auto_30798 ) ( CLEAR ?auto_30792 ) ( IS-CRATE ?auto_30793 ) ( not ( = ?auto_30792 ?auto_30793 ) ) ( not ( = ?auto_30794 ?auto_30792 ) ) ( not ( = ?auto_30795 ?auto_30792 ) ) ( not ( = ?auto_30803 ?auto_30792 ) ) ( not ( = ?auto_30801 ?auto_30792 ) ) ( AVAILABLE ?auto_30797 ) ( IN ?auto_30793 ?auto_30802 ) ( ON ?auto_30791 ?auto_30790 ) ( ON ?auto_30792 ?auto_30791 ) ( not ( = ?auto_30790 ?auto_30791 ) ) ( not ( = ?auto_30790 ?auto_30792 ) ) ( not ( = ?auto_30790 ?auto_30793 ) ) ( not ( = ?auto_30790 ?auto_30794 ) ) ( not ( = ?auto_30790 ?auto_30795 ) ) ( not ( = ?auto_30790 ?auto_30803 ) ) ( not ( = ?auto_30790 ?auto_30801 ) ) ( not ( = ?auto_30791 ?auto_30792 ) ) ( not ( = ?auto_30791 ?auto_30793 ) ) ( not ( = ?auto_30791 ?auto_30794 ) ) ( not ( = ?auto_30791 ?auto_30795 ) ) ( not ( = ?auto_30791 ?auto_30803 ) ) ( not ( = ?auto_30791 ?auto_30801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30793 ?auto_30794 ?auto_30795 )
      ( MAKE-5CRATE-VERIFY ?auto_30790 ?auto_30791 ?auto_30792 ?auto_30793 ?auto_30794 ?auto_30795 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30805 - SURFACE
      ?auto_30806 - SURFACE
    )
    :vars
    (
      ?auto_30808 - HOIST
      ?auto_30809 - PLACE
      ?auto_30812 - SURFACE
      ?auto_30811 - PLACE
      ?auto_30813 - HOIST
      ?auto_30816 - SURFACE
      ?auto_30807 - PLACE
      ?auto_30817 - HOIST
      ?auto_30814 - SURFACE
      ?auto_30810 - SURFACE
      ?auto_30815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30808 ?auto_30809 ) ( IS-CRATE ?auto_30806 ) ( not ( = ?auto_30805 ?auto_30806 ) ) ( not ( = ?auto_30812 ?auto_30805 ) ) ( not ( = ?auto_30812 ?auto_30806 ) ) ( not ( = ?auto_30811 ?auto_30809 ) ) ( HOIST-AT ?auto_30813 ?auto_30811 ) ( not ( = ?auto_30808 ?auto_30813 ) ) ( AVAILABLE ?auto_30813 ) ( SURFACE-AT ?auto_30806 ?auto_30811 ) ( ON ?auto_30806 ?auto_30816 ) ( CLEAR ?auto_30806 ) ( not ( = ?auto_30805 ?auto_30816 ) ) ( not ( = ?auto_30806 ?auto_30816 ) ) ( not ( = ?auto_30812 ?auto_30816 ) ) ( IS-CRATE ?auto_30805 ) ( not ( = ?auto_30807 ?auto_30809 ) ) ( not ( = ?auto_30811 ?auto_30807 ) ) ( HOIST-AT ?auto_30817 ?auto_30807 ) ( not ( = ?auto_30808 ?auto_30817 ) ) ( not ( = ?auto_30813 ?auto_30817 ) ) ( AVAILABLE ?auto_30817 ) ( SURFACE-AT ?auto_30805 ?auto_30807 ) ( ON ?auto_30805 ?auto_30814 ) ( CLEAR ?auto_30805 ) ( not ( = ?auto_30805 ?auto_30814 ) ) ( not ( = ?auto_30806 ?auto_30814 ) ) ( not ( = ?auto_30812 ?auto_30814 ) ) ( not ( = ?auto_30816 ?auto_30814 ) ) ( SURFACE-AT ?auto_30810 ?auto_30809 ) ( CLEAR ?auto_30810 ) ( IS-CRATE ?auto_30812 ) ( not ( = ?auto_30810 ?auto_30812 ) ) ( not ( = ?auto_30805 ?auto_30810 ) ) ( not ( = ?auto_30806 ?auto_30810 ) ) ( not ( = ?auto_30816 ?auto_30810 ) ) ( not ( = ?auto_30814 ?auto_30810 ) ) ( AVAILABLE ?auto_30808 ) ( IN ?auto_30812 ?auto_30815 ) ( TRUCK-AT ?auto_30815 ?auto_30807 ) )
    :subtasks
    ( ( !DRIVE ?auto_30815 ?auto_30807 ?auto_30809 )
      ( MAKE-2CRATE ?auto_30812 ?auto_30805 ?auto_30806 )
      ( MAKE-1CRATE-VERIFY ?auto_30805 ?auto_30806 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30818 - SURFACE
      ?auto_30819 - SURFACE
      ?auto_30820 - SURFACE
    )
    :vars
    (
      ?auto_30826 - HOIST
      ?auto_30830 - PLACE
      ?auto_30828 - PLACE
      ?auto_30823 - HOIST
      ?auto_30827 - SURFACE
      ?auto_30825 - PLACE
      ?auto_30824 - HOIST
      ?auto_30821 - SURFACE
      ?auto_30829 - SURFACE
      ?auto_30822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30826 ?auto_30830 ) ( IS-CRATE ?auto_30820 ) ( not ( = ?auto_30819 ?auto_30820 ) ) ( not ( = ?auto_30818 ?auto_30819 ) ) ( not ( = ?auto_30818 ?auto_30820 ) ) ( not ( = ?auto_30828 ?auto_30830 ) ) ( HOIST-AT ?auto_30823 ?auto_30828 ) ( not ( = ?auto_30826 ?auto_30823 ) ) ( AVAILABLE ?auto_30823 ) ( SURFACE-AT ?auto_30820 ?auto_30828 ) ( ON ?auto_30820 ?auto_30827 ) ( CLEAR ?auto_30820 ) ( not ( = ?auto_30819 ?auto_30827 ) ) ( not ( = ?auto_30820 ?auto_30827 ) ) ( not ( = ?auto_30818 ?auto_30827 ) ) ( IS-CRATE ?auto_30819 ) ( not ( = ?auto_30825 ?auto_30830 ) ) ( not ( = ?auto_30828 ?auto_30825 ) ) ( HOIST-AT ?auto_30824 ?auto_30825 ) ( not ( = ?auto_30826 ?auto_30824 ) ) ( not ( = ?auto_30823 ?auto_30824 ) ) ( AVAILABLE ?auto_30824 ) ( SURFACE-AT ?auto_30819 ?auto_30825 ) ( ON ?auto_30819 ?auto_30821 ) ( CLEAR ?auto_30819 ) ( not ( = ?auto_30819 ?auto_30821 ) ) ( not ( = ?auto_30820 ?auto_30821 ) ) ( not ( = ?auto_30818 ?auto_30821 ) ) ( not ( = ?auto_30827 ?auto_30821 ) ) ( SURFACE-AT ?auto_30829 ?auto_30830 ) ( CLEAR ?auto_30829 ) ( IS-CRATE ?auto_30818 ) ( not ( = ?auto_30829 ?auto_30818 ) ) ( not ( = ?auto_30819 ?auto_30829 ) ) ( not ( = ?auto_30820 ?auto_30829 ) ) ( not ( = ?auto_30827 ?auto_30829 ) ) ( not ( = ?auto_30821 ?auto_30829 ) ) ( AVAILABLE ?auto_30826 ) ( IN ?auto_30818 ?auto_30822 ) ( TRUCK-AT ?auto_30822 ?auto_30825 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30819 ?auto_30820 )
      ( MAKE-2CRATE-VERIFY ?auto_30818 ?auto_30819 ?auto_30820 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30831 - SURFACE
      ?auto_30832 - SURFACE
      ?auto_30833 - SURFACE
      ?auto_30834 - SURFACE
    )
    :vars
    (
      ?auto_30839 - HOIST
      ?auto_30837 - PLACE
      ?auto_30842 - PLACE
      ?auto_30840 - HOIST
      ?auto_30836 - SURFACE
      ?auto_30835 - PLACE
      ?auto_30843 - HOIST
      ?auto_30838 - SURFACE
      ?auto_30841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30839 ?auto_30837 ) ( IS-CRATE ?auto_30834 ) ( not ( = ?auto_30833 ?auto_30834 ) ) ( not ( = ?auto_30832 ?auto_30833 ) ) ( not ( = ?auto_30832 ?auto_30834 ) ) ( not ( = ?auto_30842 ?auto_30837 ) ) ( HOIST-AT ?auto_30840 ?auto_30842 ) ( not ( = ?auto_30839 ?auto_30840 ) ) ( AVAILABLE ?auto_30840 ) ( SURFACE-AT ?auto_30834 ?auto_30842 ) ( ON ?auto_30834 ?auto_30836 ) ( CLEAR ?auto_30834 ) ( not ( = ?auto_30833 ?auto_30836 ) ) ( not ( = ?auto_30834 ?auto_30836 ) ) ( not ( = ?auto_30832 ?auto_30836 ) ) ( IS-CRATE ?auto_30833 ) ( not ( = ?auto_30835 ?auto_30837 ) ) ( not ( = ?auto_30842 ?auto_30835 ) ) ( HOIST-AT ?auto_30843 ?auto_30835 ) ( not ( = ?auto_30839 ?auto_30843 ) ) ( not ( = ?auto_30840 ?auto_30843 ) ) ( AVAILABLE ?auto_30843 ) ( SURFACE-AT ?auto_30833 ?auto_30835 ) ( ON ?auto_30833 ?auto_30838 ) ( CLEAR ?auto_30833 ) ( not ( = ?auto_30833 ?auto_30838 ) ) ( not ( = ?auto_30834 ?auto_30838 ) ) ( not ( = ?auto_30832 ?auto_30838 ) ) ( not ( = ?auto_30836 ?auto_30838 ) ) ( SURFACE-AT ?auto_30831 ?auto_30837 ) ( CLEAR ?auto_30831 ) ( IS-CRATE ?auto_30832 ) ( not ( = ?auto_30831 ?auto_30832 ) ) ( not ( = ?auto_30833 ?auto_30831 ) ) ( not ( = ?auto_30834 ?auto_30831 ) ) ( not ( = ?auto_30836 ?auto_30831 ) ) ( not ( = ?auto_30838 ?auto_30831 ) ) ( AVAILABLE ?auto_30839 ) ( IN ?auto_30832 ?auto_30841 ) ( TRUCK-AT ?auto_30841 ?auto_30835 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30832 ?auto_30833 ?auto_30834 )
      ( MAKE-3CRATE-VERIFY ?auto_30831 ?auto_30832 ?auto_30833 ?auto_30834 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30844 - SURFACE
      ?auto_30845 - SURFACE
      ?auto_30846 - SURFACE
      ?auto_30847 - SURFACE
      ?auto_30848 - SURFACE
    )
    :vars
    (
      ?auto_30853 - HOIST
      ?auto_30851 - PLACE
      ?auto_30856 - PLACE
      ?auto_30854 - HOIST
      ?auto_30850 - SURFACE
      ?auto_30849 - PLACE
      ?auto_30857 - HOIST
      ?auto_30852 - SURFACE
      ?auto_30855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30853 ?auto_30851 ) ( IS-CRATE ?auto_30848 ) ( not ( = ?auto_30847 ?auto_30848 ) ) ( not ( = ?auto_30846 ?auto_30847 ) ) ( not ( = ?auto_30846 ?auto_30848 ) ) ( not ( = ?auto_30856 ?auto_30851 ) ) ( HOIST-AT ?auto_30854 ?auto_30856 ) ( not ( = ?auto_30853 ?auto_30854 ) ) ( AVAILABLE ?auto_30854 ) ( SURFACE-AT ?auto_30848 ?auto_30856 ) ( ON ?auto_30848 ?auto_30850 ) ( CLEAR ?auto_30848 ) ( not ( = ?auto_30847 ?auto_30850 ) ) ( not ( = ?auto_30848 ?auto_30850 ) ) ( not ( = ?auto_30846 ?auto_30850 ) ) ( IS-CRATE ?auto_30847 ) ( not ( = ?auto_30849 ?auto_30851 ) ) ( not ( = ?auto_30856 ?auto_30849 ) ) ( HOIST-AT ?auto_30857 ?auto_30849 ) ( not ( = ?auto_30853 ?auto_30857 ) ) ( not ( = ?auto_30854 ?auto_30857 ) ) ( AVAILABLE ?auto_30857 ) ( SURFACE-AT ?auto_30847 ?auto_30849 ) ( ON ?auto_30847 ?auto_30852 ) ( CLEAR ?auto_30847 ) ( not ( = ?auto_30847 ?auto_30852 ) ) ( not ( = ?auto_30848 ?auto_30852 ) ) ( not ( = ?auto_30846 ?auto_30852 ) ) ( not ( = ?auto_30850 ?auto_30852 ) ) ( SURFACE-AT ?auto_30845 ?auto_30851 ) ( CLEAR ?auto_30845 ) ( IS-CRATE ?auto_30846 ) ( not ( = ?auto_30845 ?auto_30846 ) ) ( not ( = ?auto_30847 ?auto_30845 ) ) ( not ( = ?auto_30848 ?auto_30845 ) ) ( not ( = ?auto_30850 ?auto_30845 ) ) ( not ( = ?auto_30852 ?auto_30845 ) ) ( AVAILABLE ?auto_30853 ) ( IN ?auto_30846 ?auto_30855 ) ( TRUCK-AT ?auto_30855 ?auto_30849 ) ( ON ?auto_30845 ?auto_30844 ) ( not ( = ?auto_30844 ?auto_30845 ) ) ( not ( = ?auto_30844 ?auto_30846 ) ) ( not ( = ?auto_30844 ?auto_30847 ) ) ( not ( = ?auto_30844 ?auto_30848 ) ) ( not ( = ?auto_30844 ?auto_30850 ) ) ( not ( = ?auto_30844 ?auto_30852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30846 ?auto_30847 ?auto_30848 )
      ( MAKE-4CRATE-VERIFY ?auto_30844 ?auto_30845 ?auto_30846 ?auto_30847 ?auto_30848 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30858 - SURFACE
      ?auto_30859 - SURFACE
      ?auto_30860 - SURFACE
      ?auto_30861 - SURFACE
      ?auto_30862 - SURFACE
      ?auto_30863 - SURFACE
    )
    :vars
    (
      ?auto_30868 - HOIST
      ?auto_30866 - PLACE
      ?auto_30871 - PLACE
      ?auto_30869 - HOIST
      ?auto_30865 - SURFACE
      ?auto_30864 - PLACE
      ?auto_30872 - HOIST
      ?auto_30867 - SURFACE
      ?auto_30870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30868 ?auto_30866 ) ( IS-CRATE ?auto_30863 ) ( not ( = ?auto_30862 ?auto_30863 ) ) ( not ( = ?auto_30861 ?auto_30862 ) ) ( not ( = ?auto_30861 ?auto_30863 ) ) ( not ( = ?auto_30871 ?auto_30866 ) ) ( HOIST-AT ?auto_30869 ?auto_30871 ) ( not ( = ?auto_30868 ?auto_30869 ) ) ( AVAILABLE ?auto_30869 ) ( SURFACE-AT ?auto_30863 ?auto_30871 ) ( ON ?auto_30863 ?auto_30865 ) ( CLEAR ?auto_30863 ) ( not ( = ?auto_30862 ?auto_30865 ) ) ( not ( = ?auto_30863 ?auto_30865 ) ) ( not ( = ?auto_30861 ?auto_30865 ) ) ( IS-CRATE ?auto_30862 ) ( not ( = ?auto_30864 ?auto_30866 ) ) ( not ( = ?auto_30871 ?auto_30864 ) ) ( HOIST-AT ?auto_30872 ?auto_30864 ) ( not ( = ?auto_30868 ?auto_30872 ) ) ( not ( = ?auto_30869 ?auto_30872 ) ) ( AVAILABLE ?auto_30872 ) ( SURFACE-AT ?auto_30862 ?auto_30864 ) ( ON ?auto_30862 ?auto_30867 ) ( CLEAR ?auto_30862 ) ( not ( = ?auto_30862 ?auto_30867 ) ) ( not ( = ?auto_30863 ?auto_30867 ) ) ( not ( = ?auto_30861 ?auto_30867 ) ) ( not ( = ?auto_30865 ?auto_30867 ) ) ( SURFACE-AT ?auto_30860 ?auto_30866 ) ( CLEAR ?auto_30860 ) ( IS-CRATE ?auto_30861 ) ( not ( = ?auto_30860 ?auto_30861 ) ) ( not ( = ?auto_30862 ?auto_30860 ) ) ( not ( = ?auto_30863 ?auto_30860 ) ) ( not ( = ?auto_30865 ?auto_30860 ) ) ( not ( = ?auto_30867 ?auto_30860 ) ) ( AVAILABLE ?auto_30868 ) ( IN ?auto_30861 ?auto_30870 ) ( TRUCK-AT ?auto_30870 ?auto_30864 ) ( ON ?auto_30859 ?auto_30858 ) ( ON ?auto_30860 ?auto_30859 ) ( not ( = ?auto_30858 ?auto_30859 ) ) ( not ( = ?auto_30858 ?auto_30860 ) ) ( not ( = ?auto_30858 ?auto_30861 ) ) ( not ( = ?auto_30858 ?auto_30862 ) ) ( not ( = ?auto_30858 ?auto_30863 ) ) ( not ( = ?auto_30858 ?auto_30865 ) ) ( not ( = ?auto_30858 ?auto_30867 ) ) ( not ( = ?auto_30859 ?auto_30860 ) ) ( not ( = ?auto_30859 ?auto_30861 ) ) ( not ( = ?auto_30859 ?auto_30862 ) ) ( not ( = ?auto_30859 ?auto_30863 ) ) ( not ( = ?auto_30859 ?auto_30865 ) ) ( not ( = ?auto_30859 ?auto_30867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30861 ?auto_30862 ?auto_30863 )
      ( MAKE-5CRATE-VERIFY ?auto_30858 ?auto_30859 ?auto_30860 ?auto_30861 ?auto_30862 ?auto_30863 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30873 - SURFACE
      ?auto_30874 - SURFACE
    )
    :vars
    (
      ?auto_30881 - HOIST
      ?auto_30877 - PLACE
      ?auto_30879 - SURFACE
      ?auto_30884 - PLACE
      ?auto_30882 - HOIST
      ?auto_30876 - SURFACE
      ?auto_30875 - PLACE
      ?auto_30885 - HOIST
      ?auto_30878 - SURFACE
      ?auto_30880 - SURFACE
      ?auto_30883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30881 ?auto_30877 ) ( IS-CRATE ?auto_30874 ) ( not ( = ?auto_30873 ?auto_30874 ) ) ( not ( = ?auto_30879 ?auto_30873 ) ) ( not ( = ?auto_30879 ?auto_30874 ) ) ( not ( = ?auto_30884 ?auto_30877 ) ) ( HOIST-AT ?auto_30882 ?auto_30884 ) ( not ( = ?auto_30881 ?auto_30882 ) ) ( AVAILABLE ?auto_30882 ) ( SURFACE-AT ?auto_30874 ?auto_30884 ) ( ON ?auto_30874 ?auto_30876 ) ( CLEAR ?auto_30874 ) ( not ( = ?auto_30873 ?auto_30876 ) ) ( not ( = ?auto_30874 ?auto_30876 ) ) ( not ( = ?auto_30879 ?auto_30876 ) ) ( IS-CRATE ?auto_30873 ) ( not ( = ?auto_30875 ?auto_30877 ) ) ( not ( = ?auto_30884 ?auto_30875 ) ) ( HOIST-AT ?auto_30885 ?auto_30875 ) ( not ( = ?auto_30881 ?auto_30885 ) ) ( not ( = ?auto_30882 ?auto_30885 ) ) ( SURFACE-AT ?auto_30873 ?auto_30875 ) ( ON ?auto_30873 ?auto_30878 ) ( CLEAR ?auto_30873 ) ( not ( = ?auto_30873 ?auto_30878 ) ) ( not ( = ?auto_30874 ?auto_30878 ) ) ( not ( = ?auto_30879 ?auto_30878 ) ) ( not ( = ?auto_30876 ?auto_30878 ) ) ( SURFACE-AT ?auto_30880 ?auto_30877 ) ( CLEAR ?auto_30880 ) ( IS-CRATE ?auto_30879 ) ( not ( = ?auto_30880 ?auto_30879 ) ) ( not ( = ?auto_30873 ?auto_30880 ) ) ( not ( = ?auto_30874 ?auto_30880 ) ) ( not ( = ?auto_30876 ?auto_30880 ) ) ( not ( = ?auto_30878 ?auto_30880 ) ) ( AVAILABLE ?auto_30881 ) ( TRUCK-AT ?auto_30883 ?auto_30875 ) ( LIFTING ?auto_30885 ?auto_30879 ) )
    :subtasks
    ( ( !LOAD ?auto_30885 ?auto_30879 ?auto_30883 ?auto_30875 )
      ( MAKE-2CRATE ?auto_30879 ?auto_30873 ?auto_30874 )
      ( MAKE-1CRATE-VERIFY ?auto_30873 ?auto_30874 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30886 - SURFACE
      ?auto_30887 - SURFACE
      ?auto_30888 - SURFACE
    )
    :vars
    (
      ?auto_30898 - HOIST
      ?auto_30891 - PLACE
      ?auto_30896 - PLACE
      ?auto_30892 - HOIST
      ?auto_30893 - SURFACE
      ?auto_30895 - PLACE
      ?auto_30890 - HOIST
      ?auto_30894 - SURFACE
      ?auto_30889 - SURFACE
      ?auto_30897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30898 ?auto_30891 ) ( IS-CRATE ?auto_30888 ) ( not ( = ?auto_30887 ?auto_30888 ) ) ( not ( = ?auto_30886 ?auto_30887 ) ) ( not ( = ?auto_30886 ?auto_30888 ) ) ( not ( = ?auto_30896 ?auto_30891 ) ) ( HOIST-AT ?auto_30892 ?auto_30896 ) ( not ( = ?auto_30898 ?auto_30892 ) ) ( AVAILABLE ?auto_30892 ) ( SURFACE-AT ?auto_30888 ?auto_30896 ) ( ON ?auto_30888 ?auto_30893 ) ( CLEAR ?auto_30888 ) ( not ( = ?auto_30887 ?auto_30893 ) ) ( not ( = ?auto_30888 ?auto_30893 ) ) ( not ( = ?auto_30886 ?auto_30893 ) ) ( IS-CRATE ?auto_30887 ) ( not ( = ?auto_30895 ?auto_30891 ) ) ( not ( = ?auto_30896 ?auto_30895 ) ) ( HOIST-AT ?auto_30890 ?auto_30895 ) ( not ( = ?auto_30898 ?auto_30890 ) ) ( not ( = ?auto_30892 ?auto_30890 ) ) ( SURFACE-AT ?auto_30887 ?auto_30895 ) ( ON ?auto_30887 ?auto_30894 ) ( CLEAR ?auto_30887 ) ( not ( = ?auto_30887 ?auto_30894 ) ) ( not ( = ?auto_30888 ?auto_30894 ) ) ( not ( = ?auto_30886 ?auto_30894 ) ) ( not ( = ?auto_30893 ?auto_30894 ) ) ( SURFACE-AT ?auto_30889 ?auto_30891 ) ( CLEAR ?auto_30889 ) ( IS-CRATE ?auto_30886 ) ( not ( = ?auto_30889 ?auto_30886 ) ) ( not ( = ?auto_30887 ?auto_30889 ) ) ( not ( = ?auto_30888 ?auto_30889 ) ) ( not ( = ?auto_30893 ?auto_30889 ) ) ( not ( = ?auto_30894 ?auto_30889 ) ) ( AVAILABLE ?auto_30898 ) ( TRUCK-AT ?auto_30897 ?auto_30895 ) ( LIFTING ?auto_30890 ?auto_30886 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30887 ?auto_30888 )
      ( MAKE-2CRATE-VERIFY ?auto_30886 ?auto_30887 ?auto_30888 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30899 - SURFACE
      ?auto_30900 - SURFACE
      ?auto_30901 - SURFACE
      ?auto_30902 - SURFACE
    )
    :vars
    (
      ?auto_30905 - HOIST
      ?auto_30907 - PLACE
      ?auto_30904 - PLACE
      ?auto_30911 - HOIST
      ?auto_30908 - SURFACE
      ?auto_30909 - PLACE
      ?auto_30903 - HOIST
      ?auto_30910 - SURFACE
      ?auto_30906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30905 ?auto_30907 ) ( IS-CRATE ?auto_30902 ) ( not ( = ?auto_30901 ?auto_30902 ) ) ( not ( = ?auto_30900 ?auto_30901 ) ) ( not ( = ?auto_30900 ?auto_30902 ) ) ( not ( = ?auto_30904 ?auto_30907 ) ) ( HOIST-AT ?auto_30911 ?auto_30904 ) ( not ( = ?auto_30905 ?auto_30911 ) ) ( AVAILABLE ?auto_30911 ) ( SURFACE-AT ?auto_30902 ?auto_30904 ) ( ON ?auto_30902 ?auto_30908 ) ( CLEAR ?auto_30902 ) ( not ( = ?auto_30901 ?auto_30908 ) ) ( not ( = ?auto_30902 ?auto_30908 ) ) ( not ( = ?auto_30900 ?auto_30908 ) ) ( IS-CRATE ?auto_30901 ) ( not ( = ?auto_30909 ?auto_30907 ) ) ( not ( = ?auto_30904 ?auto_30909 ) ) ( HOIST-AT ?auto_30903 ?auto_30909 ) ( not ( = ?auto_30905 ?auto_30903 ) ) ( not ( = ?auto_30911 ?auto_30903 ) ) ( SURFACE-AT ?auto_30901 ?auto_30909 ) ( ON ?auto_30901 ?auto_30910 ) ( CLEAR ?auto_30901 ) ( not ( = ?auto_30901 ?auto_30910 ) ) ( not ( = ?auto_30902 ?auto_30910 ) ) ( not ( = ?auto_30900 ?auto_30910 ) ) ( not ( = ?auto_30908 ?auto_30910 ) ) ( SURFACE-AT ?auto_30899 ?auto_30907 ) ( CLEAR ?auto_30899 ) ( IS-CRATE ?auto_30900 ) ( not ( = ?auto_30899 ?auto_30900 ) ) ( not ( = ?auto_30901 ?auto_30899 ) ) ( not ( = ?auto_30902 ?auto_30899 ) ) ( not ( = ?auto_30908 ?auto_30899 ) ) ( not ( = ?auto_30910 ?auto_30899 ) ) ( AVAILABLE ?auto_30905 ) ( TRUCK-AT ?auto_30906 ?auto_30909 ) ( LIFTING ?auto_30903 ?auto_30900 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30900 ?auto_30901 ?auto_30902 )
      ( MAKE-3CRATE-VERIFY ?auto_30899 ?auto_30900 ?auto_30901 ?auto_30902 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30912 - SURFACE
      ?auto_30913 - SURFACE
      ?auto_30914 - SURFACE
      ?auto_30915 - SURFACE
      ?auto_30916 - SURFACE
    )
    :vars
    (
      ?auto_30919 - HOIST
      ?auto_30921 - PLACE
      ?auto_30918 - PLACE
      ?auto_30925 - HOIST
      ?auto_30922 - SURFACE
      ?auto_30923 - PLACE
      ?auto_30917 - HOIST
      ?auto_30924 - SURFACE
      ?auto_30920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30919 ?auto_30921 ) ( IS-CRATE ?auto_30916 ) ( not ( = ?auto_30915 ?auto_30916 ) ) ( not ( = ?auto_30914 ?auto_30915 ) ) ( not ( = ?auto_30914 ?auto_30916 ) ) ( not ( = ?auto_30918 ?auto_30921 ) ) ( HOIST-AT ?auto_30925 ?auto_30918 ) ( not ( = ?auto_30919 ?auto_30925 ) ) ( AVAILABLE ?auto_30925 ) ( SURFACE-AT ?auto_30916 ?auto_30918 ) ( ON ?auto_30916 ?auto_30922 ) ( CLEAR ?auto_30916 ) ( not ( = ?auto_30915 ?auto_30922 ) ) ( not ( = ?auto_30916 ?auto_30922 ) ) ( not ( = ?auto_30914 ?auto_30922 ) ) ( IS-CRATE ?auto_30915 ) ( not ( = ?auto_30923 ?auto_30921 ) ) ( not ( = ?auto_30918 ?auto_30923 ) ) ( HOIST-AT ?auto_30917 ?auto_30923 ) ( not ( = ?auto_30919 ?auto_30917 ) ) ( not ( = ?auto_30925 ?auto_30917 ) ) ( SURFACE-AT ?auto_30915 ?auto_30923 ) ( ON ?auto_30915 ?auto_30924 ) ( CLEAR ?auto_30915 ) ( not ( = ?auto_30915 ?auto_30924 ) ) ( not ( = ?auto_30916 ?auto_30924 ) ) ( not ( = ?auto_30914 ?auto_30924 ) ) ( not ( = ?auto_30922 ?auto_30924 ) ) ( SURFACE-AT ?auto_30913 ?auto_30921 ) ( CLEAR ?auto_30913 ) ( IS-CRATE ?auto_30914 ) ( not ( = ?auto_30913 ?auto_30914 ) ) ( not ( = ?auto_30915 ?auto_30913 ) ) ( not ( = ?auto_30916 ?auto_30913 ) ) ( not ( = ?auto_30922 ?auto_30913 ) ) ( not ( = ?auto_30924 ?auto_30913 ) ) ( AVAILABLE ?auto_30919 ) ( TRUCK-AT ?auto_30920 ?auto_30923 ) ( LIFTING ?auto_30917 ?auto_30914 ) ( ON ?auto_30913 ?auto_30912 ) ( not ( = ?auto_30912 ?auto_30913 ) ) ( not ( = ?auto_30912 ?auto_30914 ) ) ( not ( = ?auto_30912 ?auto_30915 ) ) ( not ( = ?auto_30912 ?auto_30916 ) ) ( not ( = ?auto_30912 ?auto_30922 ) ) ( not ( = ?auto_30912 ?auto_30924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30914 ?auto_30915 ?auto_30916 )
      ( MAKE-4CRATE-VERIFY ?auto_30912 ?auto_30913 ?auto_30914 ?auto_30915 ?auto_30916 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30926 - SURFACE
      ?auto_30927 - SURFACE
      ?auto_30928 - SURFACE
      ?auto_30929 - SURFACE
      ?auto_30930 - SURFACE
      ?auto_30931 - SURFACE
    )
    :vars
    (
      ?auto_30934 - HOIST
      ?auto_30936 - PLACE
      ?auto_30933 - PLACE
      ?auto_30940 - HOIST
      ?auto_30937 - SURFACE
      ?auto_30938 - PLACE
      ?auto_30932 - HOIST
      ?auto_30939 - SURFACE
      ?auto_30935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30934 ?auto_30936 ) ( IS-CRATE ?auto_30931 ) ( not ( = ?auto_30930 ?auto_30931 ) ) ( not ( = ?auto_30929 ?auto_30930 ) ) ( not ( = ?auto_30929 ?auto_30931 ) ) ( not ( = ?auto_30933 ?auto_30936 ) ) ( HOIST-AT ?auto_30940 ?auto_30933 ) ( not ( = ?auto_30934 ?auto_30940 ) ) ( AVAILABLE ?auto_30940 ) ( SURFACE-AT ?auto_30931 ?auto_30933 ) ( ON ?auto_30931 ?auto_30937 ) ( CLEAR ?auto_30931 ) ( not ( = ?auto_30930 ?auto_30937 ) ) ( not ( = ?auto_30931 ?auto_30937 ) ) ( not ( = ?auto_30929 ?auto_30937 ) ) ( IS-CRATE ?auto_30930 ) ( not ( = ?auto_30938 ?auto_30936 ) ) ( not ( = ?auto_30933 ?auto_30938 ) ) ( HOIST-AT ?auto_30932 ?auto_30938 ) ( not ( = ?auto_30934 ?auto_30932 ) ) ( not ( = ?auto_30940 ?auto_30932 ) ) ( SURFACE-AT ?auto_30930 ?auto_30938 ) ( ON ?auto_30930 ?auto_30939 ) ( CLEAR ?auto_30930 ) ( not ( = ?auto_30930 ?auto_30939 ) ) ( not ( = ?auto_30931 ?auto_30939 ) ) ( not ( = ?auto_30929 ?auto_30939 ) ) ( not ( = ?auto_30937 ?auto_30939 ) ) ( SURFACE-AT ?auto_30928 ?auto_30936 ) ( CLEAR ?auto_30928 ) ( IS-CRATE ?auto_30929 ) ( not ( = ?auto_30928 ?auto_30929 ) ) ( not ( = ?auto_30930 ?auto_30928 ) ) ( not ( = ?auto_30931 ?auto_30928 ) ) ( not ( = ?auto_30937 ?auto_30928 ) ) ( not ( = ?auto_30939 ?auto_30928 ) ) ( AVAILABLE ?auto_30934 ) ( TRUCK-AT ?auto_30935 ?auto_30938 ) ( LIFTING ?auto_30932 ?auto_30929 ) ( ON ?auto_30927 ?auto_30926 ) ( ON ?auto_30928 ?auto_30927 ) ( not ( = ?auto_30926 ?auto_30927 ) ) ( not ( = ?auto_30926 ?auto_30928 ) ) ( not ( = ?auto_30926 ?auto_30929 ) ) ( not ( = ?auto_30926 ?auto_30930 ) ) ( not ( = ?auto_30926 ?auto_30931 ) ) ( not ( = ?auto_30926 ?auto_30937 ) ) ( not ( = ?auto_30926 ?auto_30939 ) ) ( not ( = ?auto_30927 ?auto_30928 ) ) ( not ( = ?auto_30927 ?auto_30929 ) ) ( not ( = ?auto_30927 ?auto_30930 ) ) ( not ( = ?auto_30927 ?auto_30931 ) ) ( not ( = ?auto_30927 ?auto_30937 ) ) ( not ( = ?auto_30927 ?auto_30939 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30929 ?auto_30930 ?auto_30931 )
      ( MAKE-5CRATE-VERIFY ?auto_30926 ?auto_30927 ?auto_30928 ?auto_30929 ?auto_30930 ?auto_30931 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30941 - SURFACE
      ?auto_30942 - SURFACE
    )
    :vars
    (
      ?auto_30945 - HOIST
      ?auto_30948 - PLACE
      ?auto_30952 - SURFACE
      ?auto_30944 - PLACE
      ?auto_30953 - HOIST
      ?auto_30949 - SURFACE
      ?auto_30950 - PLACE
      ?auto_30943 - HOIST
      ?auto_30951 - SURFACE
      ?auto_30947 - SURFACE
      ?auto_30946 - TRUCK
      ?auto_30954 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30945 ?auto_30948 ) ( IS-CRATE ?auto_30942 ) ( not ( = ?auto_30941 ?auto_30942 ) ) ( not ( = ?auto_30952 ?auto_30941 ) ) ( not ( = ?auto_30952 ?auto_30942 ) ) ( not ( = ?auto_30944 ?auto_30948 ) ) ( HOIST-AT ?auto_30953 ?auto_30944 ) ( not ( = ?auto_30945 ?auto_30953 ) ) ( AVAILABLE ?auto_30953 ) ( SURFACE-AT ?auto_30942 ?auto_30944 ) ( ON ?auto_30942 ?auto_30949 ) ( CLEAR ?auto_30942 ) ( not ( = ?auto_30941 ?auto_30949 ) ) ( not ( = ?auto_30942 ?auto_30949 ) ) ( not ( = ?auto_30952 ?auto_30949 ) ) ( IS-CRATE ?auto_30941 ) ( not ( = ?auto_30950 ?auto_30948 ) ) ( not ( = ?auto_30944 ?auto_30950 ) ) ( HOIST-AT ?auto_30943 ?auto_30950 ) ( not ( = ?auto_30945 ?auto_30943 ) ) ( not ( = ?auto_30953 ?auto_30943 ) ) ( SURFACE-AT ?auto_30941 ?auto_30950 ) ( ON ?auto_30941 ?auto_30951 ) ( CLEAR ?auto_30941 ) ( not ( = ?auto_30941 ?auto_30951 ) ) ( not ( = ?auto_30942 ?auto_30951 ) ) ( not ( = ?auto_30952 ?auto_30951 ) ) ( not ( = ?auto_30949 ?auto_30951 ) ) ( SURFACE-AT ?auto_30947 ?auto_30948 ) ( CLEAR ?auto_30947 ) ( IS-CRATE ?auto_30952 ) ( not ( = ?auto_30947 ?auto_30952 ) ) ( not ( = ?auto_30941 ?auto_30947 ) ) ( not ( = ?auto_30942 ?auto_30947 ) ) ( not ( = ?auto_30949 ?auto_30947 ) ) ( not ( = ?auto_30951 ?auto_30947 ) ) ( AVAILABLE ?auto_30945 ) ( TRUCK-AT ?auto_30946 ?auto_30950 ) ( AVAILABLE ?auto_30943 ) ( SURFACE-AT ?auto_30952 ?auto_30950 ) ( ON ?auto_30952 ?auto_30954 ) ( CLEAR ?auto_30952 ) ( not ( = ?auto_30941 ?auto_30954 ) ) ( not ( = ?auto_30942 ?auto_30954 ) ) ( not ( = ?auto_30952 ?auto_30954 ) ) ( not ( = ?auto_30949 ?auto_30954 ) ) ( not ( = ?auto_30951 ?auto_30954 ) ) ( not ( = ?auto_30947 ?auto_30954 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30943 ?auto_30952 ?auto_30954 ?auto_30950 )
      ( MAKE-2CRATE ?auto_30952 ?auto_30941 ?auto_30942 )
      ( MAKE-1CRATE-VERIFY ?auto_30941 ?auto_30942 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30955 - SURFACE
      ?auto_30956 - SURFACE
      ?auto_30957 - SURFACE
    )
    :vars
    (
      ?auto_30967 - HOIST
      ?auto_30959 - PLACE
      ?auto_30958 - PLACE
      ?auto_30968 - HOIST
      ?auto_30962 - SURFACE
      ?auto_30963 - PLACE
      ?auto_30966 - HOIST
      ?auto_30960 - SURFACE
      ?auto_30965 - SURFACE
      ?auto_30961 - TRUCK
      ?auto_30964 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30967 ?auto_30959 ) ( IS-CRATE ?auto_30957 ) ( not ( = ?auto_30956 ?auto_30957 ) ) ( not ( = ?auto_30955 ?auto_30956 ) ) ( not ( = ?auto_30955 ?auto_30957 ) ) ( not ( = ?auto_30958 ?auto_30959 ) ) ( HOIST-AT ?auto_30968 ?auto_30958 ) ( not ( = ?auto_30967 ?auto_30968 ) ) ( AVAILABLE ?auto_30968 ) ( SURFACE-AT ?auto_30957 ?auto_30958 ) ( ON ?auto_30957 ?auto_30962 ) ( CLEAR ?auto_30957 ) ( not ( = ?auto_30956 ?auto_30962 ) ) ( not ( = ?auto_30957 ?auto_30962 ) ) ( not ( = ?auto_30955 ?auto_30962 ) ) ( IS-CRATE ?auto_30956 ) ( not ( = ?auto_30963 ?auto_30959 ) ) ( not ( = ?auto_30958 ?auto_30963 ) ) ( HOIST-AT ?auto_30966 ?auto_30963 ) ( not ( = ?auto_30967 ?auto_30966 ) ) ( not ( = ?auto_30968 ?auto_30966 ) ) ( SURFACE-AT ?auto_30956 ?auto_30963 ) ( ON ?auto_30956 ?auto_30960 ) ( CLEAR ?auto_30956 ) ( not ( = ?auto_30956 ?auto_30960 ) ) ( not ( = ?auto_30957 ?auto_30960 ) ) ( not ( = ?auto_30955 ?auto_30960 ) ) ( not ( = ?auto_30962 ?auto_30960 ) ) ( SURFACE-AT ?auto_30965 ?auto_30959 ) ( CLEAR ?auto_30965 ) ( IS-CRATE ?auto_30955 ) ( not ( = ?auto_30965 ?auto_30955 ) ) ( not ( = ?auto_30956 ?auto_30965 ) ) ( not ( = ?auto_30957 ?auto_30965 ) ) ( not ( = ?auto_30962 ?auto_30965 ) ) ( not ( = ?auto_30960 ?auto_30965 ) ) ( AVAILABLE ?auto_30967 ) ( TRUCK-AT ?auto_30961 ?auto_30963 ) ( AVAILABLE ?auto_30966 ) ( SURFACE-AT ?auto_30955 ?auto_30963 ) ( ON ?auto_30955 ?auto_30964 ) ( CLEAR ?auto_30955 ) ( not ( = ?auto_30956 ?auto_30964 ) ) ( not ( = ?auto_30957 ?auto_30964 ) ) ( not ( = ?auto_30955 ?auto_30964 ) ) ( not ( = ?auto_30962 ?auto_30964 ) ) ( not ( = ?auto_30960 ?auto_30964 ) ) ( not ( = ?auto_30965 ?auto_30964 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30956 ?auto_30957 )
      ( MAKE-2CRATE-VERIFY ?auto_30955 ?auto_30956 ?auto_30957 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30969 - SURFACE
      ?auto_30970 - SURFACE
      ?auto_30971 - SURFACE
      ?auto_30972 - SURFACE
    )
    :vars
    (
      ?auto_30976 - HOIST
      ?auto_30980 - PLACE
      ?auto_30978 - PLACE
      ?auto_30981 - HOIST
      ?auto_30974 - SURFACE
      ?auto_30982 - PLACE
      ?auto_30979 - HOIST
      ?auto_30977 - SURFACE
      ?auto_30973 - TRUCK
      ?auto_30975 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30976 ?auto_30980 ) ( IS-CRATE ?auto_30972 ) ( not ( = ?auto_30971 ?auto_30972 ) ) ( not ( = ?auto_30970 ?auto_30971 ) ) ( not ( = ?auto_30970 ?auto_30972 ) ) ( not ( = ?auto_30978 ?auto_30980 ) ) ( HOIST-AT ?auto_30981 ?auto_30978 ) ( not ( = ?auto_30976 ?auto_30981 ) ) ( AVAILABLE ?auto_30981 ) ( SURFACE-AT ?auto_30972 ?auto_30978 ) ( ON ?auto_30972 ?auto_30974 ) ( CLEAR ?auto_30972 ) ( not ( = ?auto_30971 ?auto_30974 ) ) ( not ( = ?auto_30972 ?auto_30974 ) ) ( not ( = ?auto_30970 ?auto_30974 ) ) ( IS-CRATE ?auto_30971 ) ( not ( = ?auto_30982 ?auto_30980 ) ) ( not ( = ?auto_30978 ?auto_30982 ) ) ( HOIST-AT ?auto_30979 ?auto_30982 ) ( not ( = ?auto_30976 ?auto_30979 ) ) ( not ( = ?auto_30981 ?auto_30979 ) ) ( SURFACE-AT ?auto_30971 ?auto_30982 ) ( ON ?auto_30971 ?auto_30977 ) ( CLEAR ?auto_30971 ) ( not ( = ?auto_30971 ?auto_30977 ) ) ( not ( = ?auto_30972 ?auto_30977 ) ) ( not ( = ?auto_30970 ?auto_30977 ) ) ( not ( = ?auto_30974 ?auto_30977 ) ) ( SURFACE-AT ?auto_30969 ?auto_30980 ) ( CLEAR ?auto_30969 ) ( IS-CRATE ?auto_30970 ) ( not ( = ?auto_30969 ?auto_30970 ) ) ( not ( = ?auto_30971 ?auto_30969 ) ) ( not ( = ?auto_30972 ?auto_30969 ) ) ( not ( = ?auto_30974 ?auto_30969 ) ) ( not ( = ?auto_30977 ?auto_30969 ) ) ( AVAILABLE ?auto_30976 ) ( TRUCK-AT ?auto_30973 ?auto_30982 ) ( AVAILABLE ?auto_30979 ) ( SURFACE-AT ?auto_30970 ?auto_30982 ) ( ON ?auto_30970 ?auto_30975 ) ( CLEAR ?auto_30970 ) ( not ( = ?auto_30971 ?auto_30975 ) ) ( not ( = ?auto_30972 ?auto_30975 ) ) ( not ( = ?auto_30970 ?auto_30975 ) ) ( not ( = ?auto_30974 ?auto_30975 ) ) ( not ( = ?auto_30977 ?auto_30975 ) ) ( not ( = ?auto_30969 ?auto_30975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30970 ?auto_30971 ?auto_30972 )
      ( MAKE-3CRATE-VERIFY ?auto_30969 ?auto_30970 ?auto_30971 ?auto_30972 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30983 - SURFACE
      ?auto_30984 - SURFACE
      ?auto_30985 - SURFACE
      ?auto_30986 - SURFACE
      ?auto_30987 - SURFACE
    )
    :vars
    (
      ?auto_30991 - HOIST
      ?auto_30995 - PLACE
      ?auto_30993 - PLACE
      ?auto_30996 - HOIST
      ?auto_30989 - SURFACE
      ?auto_30997 - PLACE
      ?auto_30994 - HOIST
      ?auto_30992 - SURFACE
      ?auto_30988 - TRUCK
      ?auto_30990 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30991 ?auto_30995 ) ( IS-CRATE ?auto_30987 ) ( not ( = ?auto_30986 ?auto_30987 ) ) ( not ( = ?auto_30985 ?auto_30986 ) ) ( not ( = ?auto_30985 ?auto_30987 ) ) ( not ( = ?auto_30993 ?auto_30995 ) ) ( HOIST-AT ?auto_30996 ?auto_30993 ) ( not ( = ?auto_30991 ?auto_30996 ) ) ( AVAILABLE ?auto_30996 ) ( SURFACE-AT ?auto_30987 ?auto_30993 ) ( ON ?auto_30987 ?auto_30989 ) ( CLEAR ?auto_30987 ) ( not ( = ?auto_30986 ?auto_30989 ) ) ( not ( = ?auto_30987 ?auto_30989 ) ) ( not ( = ?auto_30985 ?auto_30989 ) ) ( IS-CRATE ?auto_30986 ) ( not ( = ?auto_30997 ?auto_30995 ) ) ( not ( = ?auto_30993 ?auto_30997 ) ) ( HOIST-AT ?auto_30994 ?auto_30997 ) ( not ( = ?auto_30991 ?auto_30994 ) ) ( not ( = ?auto_30996 ?auto_30994 ) ) ( SURFACE-AT ?auto_30986 ?auto_30997 ) ( ON ?auto_30986 ?auto_30992 ) ( CLEAR ?auto_30986 ) ( not ( = ?auto_30986 ?auto_30992 ) ) ( not ( = ?auto_30987 ?auto_30992 ) ) ( not ( = ?auto_30985 ?auto_30992 ) ) ( not ( = ?auto_30989 ?auto_30992 ) ) ( SURFACE-AT ?auto_30984 ?auto_30995 ) ( CLEAR ?auto_30984 ) ( IS-CRATE ?auto_30985 ) ( not ( = ?auto_30984 ?auto_30985 ) ) ( not ( = ?auto_30986 ?auto_30984 ) ) ( not ( = ?auto_30987 ?auto_30984 ) ) ( not ( = ?auto_30989 ?auto_30984 ) ) ( not ( = ?auto_30992 ?auto_30984 ) ) ( AVAILABLE ?auto_30991 ) ( TRUCK-AT ?auto_30988 ?auto_30997 ) ( AVAILABLE ?auto_30994 ) ( SURFACE-AT ?auto_30985 ?auto_30997 ) ( ON ?auto_30985 ?auto_30990 ) ( CLEAR ?auto_30985 ) ( not ( = ?auto_30986 ?auto_30990 ) ) ( not ( = ?auto_30987 ?auto_30990 ) ) ( not ( = ?auto_30985 ?auto_30990 ) ) ( not ( = ?auto_30989 ?auto_30990 ) ) ( not ( = ?auto_30992 ?auto_30990 ) ) ( not ( = ?auto_30984 ?auto_30990 ) ) ( ON ?auto_30984 ?auto_30983 ) ( not ( = ?auto_30983 ?auto_30984 ) ) ( not ( = ?auto_30983 ?auto_30985 ) ) ( not ( = ?auto_30983 ?auto_30986 ) ) ( not ( = ?auto_30983 ?auto_30987 ) ) ( not ( = ?auto_30983 ?auto_30989 ) ) ( not ( = ?auto_30983 ?auto_30992 ) ) ( not ( = ?auto_30983 ?auto_30990 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30985 ?auto_30986 ?auto_30987 )
      ( MAKE-4CRATE-VERIFY ?auto_30983 ?auto_30984 ?auto_30985 ?auto_30986 ?auto_30987 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30998 - SURFACE
      ?auto_30999 - SURFACE
      ?auto_31000 - SURFACE
      ?auto_31001 - SURFACE
      ?auto_31002 - SURFACE
      ?auto_31003 - SURFACE
    )
    :vars
    (
      ?auto_31007 - HOIST
      ?auto_31011 - PLACE
      ?auto_31009 - PLACE
      ?auto_31012 - HOIST
      ?auto_31005 - SURFACE
      ?auto_31013 - PLACE
      ?auto_31010 - HOIST
      ?auto_31008 - SURFACE
      ?auto_31004 - TRUCK
      ?auto_31006 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31007 ?auto_31011 ) ( IS-CRATE ?auto_31003 ) ( not ( = ?auto_31002 ?auto_31003 ) ) ( not ( = ?auto_31001 ?auto_31002 ) ) ( not ( = ?auto_31001 ?auto_31003 ) ) ( not ( = ?auto_31009 ?auto_31011 ) ) ( HOIST-AT ?auto_31012 ?auto_31009 ) ( not ( = ?auto_31007 ?auto_31012 ) ) ( AVAILABLE ?auto_31012 ) ( SURFACE-AT ?auto_31003 ?auto_31009 ) ( ON ?auto_31003 ?auto_31005 ) ( CLEAR ?auto_31003 ) ( not ( = ?auto_31002 ?auto_31005 ) ) ( not ( = ?auto_31003 ?auto_31005 ) ) ( not ( = ?auto_31001 ?auto_31005 ) ) ( IS-CRATE ?auto_31002 ) ( not ( = ?auto_31013 ?auto_31011 ) ) ( not ( = ?auto_31009 ?auto_31013 ) ) ( HOIST-AT ?auto_31010 ?auto_31013 ) ( not ( = ?auto_31007 ?auto_31010 ) ) ( not ( = ?auto_31012 ?auto_31010 ) ) ( SURFACE-AT ?auto_31002 ?auto_31013 ) ( ON ?auto_31002 ?auto_31008 ) ( CLEAR ?auto_31002 ) ( not ( = ?auto_31002 ?auto_31008 ) ) ( not ( = ?auto_31003 ?auto_31008 ) ) ( not ( = ?auto_31001 ?auto_31008 ) ) ( not ( = ?auto_31005 ?auto_31008 ) ) ( SURFACE-AT ?auto_31000 ?auto_31011 ) ( CLEAR ?auto_31000 ) ( IS-CRATE ?auto_31001 ) ( not ( = ?auto_31000 ?auto_31001 ) ) ( not ( = ?auto_31002 ?auto_31000 ) ) ( not ( = ?auto_31003 ?auto_31000 ) ) ( not ( = ?auto_31005 ?auto_31000 ) ) ( not ( = ?auto_31008 ?auto_31000 ) ) ( AVAILABLE ?auto_31007 ) ( TRUCK-AT ?auto_31004 ?auto_31013 ) ( AVAILABLE ?auto_31010 ) ( SURFACE-AT ?auto_31001 ?auto_31013 ) ( ON ?auto_31001 ?auto_31006 ) ( CLEAR ?auto_31001 ) ( not ( = ?auto_31002 ?auto_31006 ) ) ( not ( = ?auto_31003 ?auto_31006 ) ) ( not ( = ?auto_31001 ?auto_31006 ) ) ( not ( = ?auto_31005 ?auto_31006 ) ) ( not ( = ?auto_31008 ?auto_31006 ) ) ( not ( = ?auto_31000 ?auto_31006 ) ) ( ON ?auto_30999 ?auto_30998 ) ( ON ?auto_31000 ?auto_30999 ) ( not ( = ?auto_30998 ?auto_30999 ) ) ( not ( = ?auto_30998 ?auto_31000 ) ) ( not ( = ?auto_30998 ?auto_31001 ) ) ( not ( = ?auto_30998 ?auto_31002 ) ) ( not ( = ?auto_30998 ?auto_31003 ) ) ( not ( = ?auto_30998 ?auto_31005 ) ) ( not ( = ?auto_30998 ?auto_31008 ) ) ( not ( = ?auto_30998 ?auto_31006 ) ) ( not ( = ?auto_30999 ?auto_31000 ) ) ( not ( = ?auto_30999 ?auto_31001 ) ) ( not ( = ?auto_30999 ?auto_31002 ) ) ( not ( = ?auto_30999 ?auto_31003 ) ) ( not ( = ?auto_30999 ?auto_31005 ) ) ( not ( = ?auto_30999 ?auto_31008 ) ) ( not ( = ?auto_30999 ?auto_31006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31001 ?auto_31002 ?auto_31003 )
      ( MAKE-5CRATE-VERIFY ?auto_30998 ?auto_30999 ?auto_31000 ?auto_31001 ?auto_31002 ?auto_31003 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31014 - SURFACE
      ?auto_31015 - SURFACE
    )
    :vars
    (
      ?auto_31020 - HOIST
      ?auto_31025 - PLACE
      ?auto_31023 - SURFACE
      ?auto_31022 - PLACE
      ?auto_31026 - HOIST
      ?auto_31017 - SURFACE
      ?auto_31027 - PLACE
      ?auto_31024 - HOIST
      ?auto_31021 - SURFACE
      ?auto_31019 - SURFACE
      ?auto_31018 - SURFACE
      ?auto_31016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31020 ?auto_31025 ) ( IS-CRATE ?auto_31015 ) ( not ( = ?auto_31014 ?auto_31015 ) ) ( not ( = ?auto_31023 ?auto_31014 ) ) ( not ( = ?auto_31023 ?auto_31015 ) ) ( not ( = ?auto_31022 ?auto_31025 ) ) ( HOIST-AT ?auto_31026 ?auto_31022 ) ( not ( = ?auto_31020 ?auto_31026 ) ) ( AVAILABLE ?auto_31026 ) ( SURFACE-AT ?auto_31015 ?auto_31022 ) ( ON ?auto_31015 ?auto_31017 ) ( CLEAR ?auto_31015 ) ( not ( = ?auto_31014 ?auto_31017 ) ) ( not ( = ?auto_31015 ?auto_31017 ) ) ( not ( = ?auto_31023 ?auto_31017 ) ) ( IS-CRATE ?auto_31014 ) ( not ( = ?auto_31027 ?auto_31025 ) ) ( not ( = ?auto_31022 ?auto_31027 ) ) ( HOIST-AT ?auto_31024 ?auto_31027 ) ( not ( = ?auto_31020 ?auto_31024 ) ) ( not ( = ?auto_31026 ?auto_31024 ) ) ( SURFACE-AT ?auto_31014 ?auto_31027 ) ( ON ?auto_31014 ?auto_31021 ) ( CLEAR ?auto_31014 ) ( not ( = ?auto_31014 ?auto_31021 ) ) ( not ( = ?auto_31015 ?auto_31021 ) ) ( not ( = ?auto_31023 ?auto_31021 ) ) ( not ( = ?auto_31017 ?auto_31021 ) ) ( SURFACE-AT ?auto_31019 ?auto_31025 ) ( CLEAR ?auto_31019 ) ( IS-CRATE ?auto_31023 ) ( not ( = ?auto_31019 ?auto_31023 ) ) ( not ( = ?auto_31014 ?auto_31019 ) ) ( not ( = ?auto_31015 ?auto_31019 ) ) ( not ( = ?auto_31017 ?auto_31019 ) ) ( not ( = ?auto_31021 ?auto_31019 ) ) ( AVAILABLE ?auto_31020 ) ( AVAILABLE ?auto_31024 ) ( SURFACE-AT ?auto_31023 ?auto_31027 ) ( ON ?auto_31023 ?auto_31018 ) ( CLEAR ?auto_31023 ) ( not ( = ?auto_31014 ?auto_31018 ) ) ( not ( = ?auto_31015 ?auto_31018 ) ) ( not ( = ?auto_31023 ?auto_31018 ) ) ( not ( = ?auto_31017 ?auto_31018 ) ) ( not ( = ?auto_31021 ?auto_31018 ) ) ( not ( = ?auto_31019 ?auto_31018 ) ) ( TRUCK-AT ?auto_31016 ?auto_31025 ) )
    :subtasks
    ( ( !DRIVE ?auto_31016 ?auto_31025 ?auto_31027 )
      ( MAKE-2CRATE ?auto_31023 ?auto_31014 ?auto_31015 )
      ( MAKE-1CRATE-VERIFY ?auto_31014 ?auto_31015 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31028 - SURFACE
      ?auto_31029 - SURFACE
      ?auto_31030 - SURFACE
    )
    :vars
    (
      ?auto_31035 - HOIST
      ?auto_31033 - PLACE
      ?auto_31037 - PLACE
      ?auto_31040 - HOIST
      ?auto_31038 - SURFACE
      ?auto_31032 - PLACE
      ?auto_31034 - HOIST
      ?auto_31039 - SURFACE
      ?auto_31036 - SURFACE
      ?auto_31031 - SURFACE
      ?auto_31041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31035 ?auto_31033 ) ( IS-CRATE ?auto_31030 ) ( not ( = ?auto_31029 ?auto_31030 ) ) ( not ( = ?auto_31028 ?auto_31029 ) ) ( not ( = ?auto_31028 ?auto_31030 ) ) ( not ( = ?auto_31037 ?auto_31033 ) ) ( HOIST-AT ?auto_31040 ?auto_31037 ) ( not ( = ?auto_31035 ?auto_31040 ) ) ( AVAILABLE ?auto_31040 ) ( SURFACE-AT ?auto_31030 ?auto_31037 ) ( ON ?auto_31030 ?auto_31038 ) ( CLEAR ?auto_31030 ) ( not ( = ?auto_31029 ?auto_31038 ) ) ( not ( = ?auto_31030 ?auto_31038 ) ) ( not ( = ?auto_31028 ?auto_31038 ) ) ( IS-CRATE ?auto_31029 ) ( not ( = ?auto_31032 ?auto_31033 ) ) ( not ( = ?auto_31037 ?auto_31032 ) ) ( HOIST-AT ?auto_31034 ?auto_31032 ) ( not ( = ?auto_31035 ?auto_31034 ) ) ( not ( = ?auto_31040 ?auto_31034 ) ) ( SURFACE-AT ?auto_31029 ?auto_31032 ) ( ON ?auto_31029 ?auto_31039 ) ( CLEAR ?auto_31029 ) ( not ( = ?auto_31029 ?auto_31039 ) ) ( not ( = ?auto_31030 ?auto_31039 ) ) ( not ( = ?auto_31028 ?auto_31039 ) ) ( not ( = ?auto_31038 ?auto_31039 ) ) ( SURFACE-AT ?auto_31036 ?auto_31033 ) ( CLEAR ?auto_31036 ) ( IS-CRATE ?auto_31028 ) ( not ( = ?auto_31036 ?auto_31028 ) ) ( not ( = ?auto_31029 ?auto_31036 ) ) ( not ( = ?auto_31030 ?auto_31036 ) ) ( not ( = ?auto_31038 ?auto_31036 ) ) ( not ( = ?auto_31039 ?auto_31036 ) ) ( AVAILABLE ?auto_31035 ) ( AVAILABLE ?auto_31034 ) ( SURFACE-AT ?auto_31028 ?auto_31032 ) ( ON ?auto_31028 ?auto_31031 ) ( CLEAR ?auto_31028 ) ( not ( = ?auto_31029 ?auto_31031 ) ) ( not ( = ?auto_31030 ?auto_31031 ) ) ( not ( = ?auto_31028 ?auto_31031 ) ) ( not ( = ?auto_31038 ?auto_31031 ) ) ( not ( = ?auto_31039 ?auto_31031 ) ) ( not ( = ?auto_31036 ?auto_31031 ) ) ( TRUCK-AT ?auto_31041 ?auto_31033 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31029 ?auto_31030 )
      ( MAKE-2CRATE-VERIFY ?auto_31028 ?auto_31029 ?auto_31030 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31042 - SURFACE
      ?auto_31043 - SURFACE
      ?auto_31044 - SURFACE
      ?auto_31045 - SURFACE
    )
    :vars
    (
      ?auto_31049 - HOIST
      ?auto_31052 - PLACE
      ?auto_31055 - PLACE
      ?auto_31047 - HOIST
      ?auto_31050 - SURFACE
      ?auto_31054 - PLACE
      ?auto_31048 - HOIST
      ?auto_31053 - SURFACE
      ?auto_31051 - SURFACE
      ?auto_31046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31049 ?auto_31052 ) ( IS-CRATE ?auto_31045 ) ( not ( = ?auto_31044 ?auto_31045 ) ) ( not ( = ?auto_31043 ?auto_31044 ) ) ( not ( = ?auto_31043 ?auto_31045 ) ) ( not ( = ?auto_31055 ?auto_31052 ) ) ( HOIST-AT ?auto_31047 ?auto_31055 ) ( not ( = ?auto_31049 ?auto_31047 ) ) ( AVAILABLE ?auto_31047 ) ( SURFACE-AT ?auto_31045 ?auto_31055 ) ( ON ?auto_31045 ?auto_31050 ) ( CLEAR ?auto_31045 ) ( not ( = ?auto_31044 ?auto_31050 ) ) ( not ( = ?auto_31045 ?auto_31050 ) ) ( not ( = ?auto_31043 ?auto_31050 ) ) ( IS-CRATE ?auto_31044 ) ( not ( = ?auto_31054 ?auto_31052 ) ) ( not ( = ?auto_31055 ?auto_31054 ) ) ( HOIST-AT ?auto_31048 ?auto_31054 ) ( not ( = ?auto_31049 ?auto_31048 ) ) ( not ( = ?auto_31047 ?auto_31048 ) ) ( SURFACE-AT ?auto_31044 ?auto_31054 ) ( ON ?auto_31044 ?auto_31053 ) ( CLEAR ?auto_31044 ) ( not ( = ?auto_31044 ?auto_31053 ) ) ( not ( = ?auto_31045 ?auto_31053 ) ) ( not ( = ?auto_31043 ?auto_31053 ) ) ( not ( = ?auto_31050 ?auto_31053 ) ) ( SURFACE-AT ?auto_31042 ?auto_31052 ) ( CLEAR ?auto_31042 ) ( IS-CRATE ?auto_31043 ) ( not ( = ?auto_31042 ?auto_31043 ) ) ( not ( = ?auto_31044 ?auto_31042 ) ) ( not ( = ?auto_31045 ?auto_31042 ) ) ( not ( = ?auto_31050 ?auto_31042 ) ) ( not ( = ?auto_31053 ?auto_31042 ) ) ( AVAILABLE ?auto_31049 ) ( AVAILABLE ?auto_31048 ) ( SURFACE-AT ?auto_31043 ?auto_31054 ) ( ON ?auto_31043 ?auto_31051 ) ( CLEAR ?auto_31043 ) ( not ( = ?auto_31044 ?auto_31051 ) ) ( not ( = ?auto_31045 ?auto_31051 ) ) ( not ( = ?auto_31043 ?auto_31051 ) ) ( not ( = ?auto_31050 ?auto_31051 ) ) ( not ( = ?auto_31053 ?auto_31051 ) ) ( not ( = ?auto_31042 ?auto_31051 ) ) ( TRUCK-AT ?auto_31046 ?auto_31052 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31043 ?auto_31044 ?auto_31045 )
      ( MAKE-3CRATE-VERIFY ?auto_31042 ?auto_31043 ?auto_31044 ?auto_31045 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31056 - SURFACE
      ?auto_31057 - SURFACE
      ?auto_31058 - SURFACE
      ?auto_31059 - SURFACE
      ?auto_31060 - SURFACE
    )
    :vars
    (
      ?auto_31064 - HOIST
      ?auto_31067 - PLACE
      ?auto_31070 - PLACE
      ?auto_31062 - HOIST
      ?auto_31065 - SURFACE
      ?auto_31069 - PLACE
      ?auto_31063 - HOIST
      ?auto_31068 - SURFACE
      ?auto_31066 - SURFACE
      ?auto_31061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31064 ?auto_31067 ) ( IS-CRATE ?auto_31060 ) ( not ( = ?auto_31059 ?auto_31060 ) ) ( not ( = ?auto_31058 ?auto_31059 ) ) ( not ( = ?auto_31058 ?auto_31060 ) ) ( not ( = ?auto_31070 ?auto_31067 ) ) ( HOIST-AT ?auto_31062 ?auto_31070 ) ( not ( = ?auto_31064 ?auto_31062 ) ) ( AVAILABLE ?auto_31062 ) ( SURFACE-AT ?auto_31060 ?auto_31070 ) ( ON ?auto_31060 ?auto_31065 ) ( CLEAR ?auto_31060 ) ( not ( = ?auto_31059 ?auto_31065 ) ) ( not ( = ?auto_31060 ?auto_31065 ) ) ( not ( = ?auto_31058 ?auto_31065 ) ) ( IS-CRATE ?auto_31059 ) ( not ( = ?auto_31069 ?auto_31067 ) ) ( not ( = ?auto_31070 ?auto_31069 ) ) ( HOIST-AT ?auto_31063 ?auto_31069 ) ( not ( = ?auto_31064 ?auto_31063 ) ) ( not ( = ?auto_31062 ?auto_31063 ) ) ( SURFACE-AT ?auto_31059 ?auto_31069 ) ( ON ?auto_31059 ?auto_31068 ) ( CLEAR ?auto_31059 ) ( not ( = ?auto_31059 ?auto_31068 ) ) ( not ( = ?auto_31060 ?auto_31068 ) ) ( not ( = ?auto_31058 ?auto_31068 ) ) ( not ( = ?auto_31065 ?auto_31068 ) ) ( SURFACE-AT ?auto_31057 ?auto_31067 ) ( CLEAR ?auto_31057 ) ( IS-CRATE ?auto_31058 ) ( not ( = ?auto_31057 ?auto_31058 ) ) ( not ( = ?auto_31059 ?auto_31057 ) ) ( not ( = ?auto_31060 ?auto_31057 ) ) ( not ( = ?auto_31065 ?auto_31057 ) ) ( not ( = ?auto_31068 ?auto_31057 ) ) ( AVAILABLE ?auto_31064 ) ( AVAILABLE ?auto_31063 ) ( SURFACE-AT ?auto_31058 ?auto_31069 ) ( ON ?auto_31058 ?auto_31066 ) ( CLEAR ?auto_31058 ) ( not ( = ?auto_31059 ?auto_31066 ) ) ( not ( = ?auto_31060 ?auto_31066 ) ) ( not ( = ?auto_31058 ?auto_31066 ) ) ( not ( = ?auto_31065 ?auto_31066 ) ) ( not ( = ?auto_31068 ?auto_31066 ) ) ( not ( = ?auto_31057 ?auto_31066 ) ) ( TRUCK-AT ?auto_31061 ?auto_31067 ) ( ON ?auto_31057 ?auto_31056 ) ( not ( = ?auto_31056 ?auto_31057 ) ) ( not ( = ?auto_31056 ?auto_31058 ) ) ( not ( = ?auto_31056 ?auto_31059 ) ) ( not ( = ?auto_31056 ?auto_31060 ) ) ( not ( = ?auto_31056 ?auto_31065 ) ) ( not ( = ?auto_31056 ?auto_31068 ) ) ( not ( = ?auto_31056 ?auto_31066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31058 ?auto_31059 ?auto_31060 )
      ( MAKE-4CRATE-VERIFY ?auto_31056 ?auto_31057 ?auto_31058 ?auto_31059 ?auto_31060 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31071 - SURFACE
      ?auto_31072 - SURFACE
      ?auto_31073 - SURFACE
      ?auto_31074 - SURFACE
      ?auto_31075 - SURFACE
      ?auto_31076 - SURFACE
    )
    :vars
    (
      ?auto_31080 - HOIST
      ?auto_31083 - PLACE
      ?auto_31086 - PLACE
      ?auto_31078 - HOIST
      ?auto_31081 - SURFACE
      ?auto_31085 - PLACE
      ?auto_31079 - HOIST
      ?auto_31084 - SURFACE
      ?auto_31082 - SURFACE
      ?auto_31077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31080 ?auto_31083 ) ( IS-CRATE ?auto_31076 ) ( not ( = ?auto_31075 ?auto_31076 ) ) ( not ( = ?auto_31074 ?auto_31075 ) ) ( not ( = ?auto_31074 ?auto_31076 ) ) ( not ( = ?auto_31086 ?auto_31083 ) ) ( HOIST-AT ?auto_31078 ?auto_31086 ) ( not ( = ?auto_31080 ?auto_31078 ) ) ( AVAILABLE ?auto_31078 ) ( SURFACE-AT ?auto_31076 ?auto_31086 ) ( ON ?auto_31076 ?auto_31081 ) ( CLEAR ?auto_31076 ) ( not ( = ?auto_31075 ?auto_31081 ) ) ( not ( = ?auto_31076 ?auto_31081 ) ) ( not ( = ?auto_31074 ?auto_31081 ) ) ( IS-CRATE ?auto_31075 ) ( not ( = ?auto_31085 ?auto_31083 ) ) ( not ( = ?auto_31086 ?auto_31085 ) ) ( HOIST-AT ?auto_31079 ?auto_31085 ) ( not ( = ?auto_31080 ?auto_31079 ) ) ( not ( = ?auto_31078 ?auto_31079 ) ) ( SURFACE-AT ?auto_31075 ?auto_31085 ) ( ON ?auto_31075 ?auto_31084 ) ( CLEAR ?auto_31075 ) ( not ( = ?auto_31075 ?auto_31084 ) ) ( not ( = ?auto_31076 ?auto_31084 ) ) ( not ( = ?auto_31074 ?auto_31084 ) ) ( not ( = ?auto_31081 ?auto_31084 ) ) ( SURFACE-AT ?auto_31073 ?auto_31083 ) ( CLEAR ?auto_31073 ) ( IS-CRATE ?auto_31074 ) ( not ( = ?auto_31073 ?auto_31074 ) ) ( not ( = ?auto_31075 ?auto_31073 ) ) ( not ( = ?auto_31076 ?auto_31073 ) ) ( not ( = ?auto_31081 ?auto_31073 ) ) ( not ( = ?auto_31084 ?auto_31073 ) ) ( AVAILABLE ?auto_31080 ) ( AVAILABLE ?auto_31079 ) ( SURFACE-AT ?auto_31074 ?auto_31085 ) ( ON ?auto_31074 ?auto_31082 ) ( CLEAR ?auto_31074 ) ( not ( = ?auto_31075 ?auto_31082 ) ) ( not ( = ?auto_31076 ?auto_31082 ) ) ( not ( = ?auto_31074 ?auto_31082 ) ) ( not ( = ?auto_31081 ?auto_31082 ) ) ( not ( = ?auto_31084 ?auto_31082 ) ) ( not ( = ?auto_31073 ?auto_31082 ) ) ( TRUCK-AT ?auto_31077 ?auto_31083 ) ( ON ?auto_31072 ?auto_31071 ) ( ON ?auto_31073 ?auto_31072 ) ( not ( = ?auto_31071 ?auto_31072 ) ) ( not ( = ?auto_31071 ?auto_31073 ) ) ( not ( = ?auto_31071 ?auto_31074 ) ) ( not ( = ?auto_31071 ?auto_31075 ) ) ( not ( = ?auto_31071 ?auto_31076 ) ) ( not ( = ?auto_31071 ?auto_31081 ) ) ( not ( = ?auto_31071 ?auto_31084 ) ) ( not ( = ?auto_31071 ?auto_31082 ) ) ( not ( = ?auto_31072 ?auto_31073 ) ) ( not ( = ?auto_31072 ?auto_31074 ) ) ( not ( = ?auto_31072 ?auto_31075 ) ) ( not ( = ?auto_31072 ?auto_31076 ) ) ( not ( = ?auto_31072 ?auto_31081 ) ) ( not ( = ?auto_31072 ?auto_31084 ) ) ( not ( = ?auto_31072 ?auto_31082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31074 ?auto_31075 ?auto_31076 )
      ( MAKE-5CRATE-VERIFY ?auto_31071 ?auto_31072 ?auto_31073 ?auto_31074 ?auto_31075 ?auto_31076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31087 - SURFACE
      ?auto_31088 - SURFACE
    )
    :vars
    (
      ?auto_31092 - HOIST
      ?auto_31096 - PLACE
      ?auto_31099 - SURFACE
      ?auto_31100 - PLACE
      ?auto_31090 - HOIST
      ?auto_31093 - SURFACE
      ?auto_31098 - PLACE
      ?auto_31091 - HOIST
      ?auto_31097 - SURFACE
      ?auto_31094 - SURFACE
      ?auto_31095 - SURFACE
      ?auto_31089 - TRUCK
      ?auto_31101 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31092 ?auto_31096 ) ( IS-CRATE ?auto_31088 ) ( not ( = ?auto_31087 ?auto_31088 ) ) ( not ( = ?auto_31099 ?auto_31087 ) ) ( not ( = ?auto_31099 ?auto_31088 ) ) ( not ( = ?auto_31100 ?auto_31096 ) ) ( HOIST-AT ?auto_31090 ?auto_31100 ) ( not ( = ?auto_31092 ?auto_31090 ) ) ( AVAILABLE ?auto_31090 ) ( SURFACE-AT ?auto_31088 ?auto_31100 ) ( ON ?auto_31088 ?auto_31093 ) ( CLEAR ?auto_31088 ) ( not ( = ?auto_31087 ?auto_31093 ) ) ( not ( = ?auto_31088 ?auto_31093 ) ) ( not ( = ?auto_31099 ?auto_31093 ) ) ( IS-CRATE ?auto_31087 ) ( not ( = ?auto_31098 ?auto_31096 ) ) ( not ( = ?auto_31100 ?auto_31098 ) ) ( HOIST-AT ?auto_31091 ?auto_31098 ) ( not ( = ?auto_31092 ?auto_31091 ) ) ( not ( = ?auto_31090 ?auto_31091 ) ) ( SURFACE-AT ?auto_31087 ?auto_31098 ) ( ON ?auto_31087 ?auto_31097 ) ( CLEAR ?auto_31087 ) ( not ( = ?auto_31087 ?auto_31097 ) ) ( not ( = ?auto_31088 ?auto_31097 ) ) ( not ( = ?auto_31099 ?auto_31097 ) ) ( not ( = ?auto_31093 ?auto_31097 ) ) ( IS-CRATE ?auto_31099 ) ( not ( = ?auto_31094 ?auto_31099 ) ) ( not ( = ?auto_31087 ?auto_31094 ) ) ( not ( = ?auto_31088 ?auto_31094 ) ) ( not ( = ?auto_31093 ?auto_31094 ) ) ( not ( = ?auto_31097 ?auto_31094 ) ) ( AVAILABLE ?auto_31091 ) ( SURFACE-AT ?auto_31099 ?auto_31098 ) ( ON ?auto_31099 ?auto_31095 ) ( CLEAR ?auto_31099 ) ( not ( = ?auto_31087 ?auto_31095 ) ) ( not ( = ?auto_31088 ?auto_31095 ) ) ( not ( = ?auto_31099 ?auto_31095 ) ) ( not ( = ?auto_31093 ?auto_31095 ) ) ( not ( = ?auto_31097 ?auto_31095 ) ) ( not ( = ?auto_31094 ?auto_31095 ) ) ( TRUCK-AT ?auto_31089 ?auto_31096 ) ( SURFACE-AT ?auto_31101 ?auto_31096 ) ( CLEAR ?auto_31101 ) ( LIFTING ?auto_31092 ?auto_31094 ) ( IS-CRATE ?auto_31094 ) ( not ( = ?auto_31101 ?auto_31094 ) ) ( not ( = ?auto_31087 ?auto_31101 ) ) ( not ( = ?auto_31088 ?auto_31101 ) ) ( not ( = ?auto_31099 ?auto_31101 ) ) ( not ( = ?auto_31093 ?auto_31101 ) ) ( not ( = ?auto_31097 ?auto_31101 ) ) ( not ( = ?auto_31095 ?auto_31101 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31101 ?auto_31094 )
      ( MAKE-2CRATE ?auto_31099 ?auto_31087 ?auto_31088 )
      ( MAKE-1CRATE-VERIFY ?auto_31087 ?auto_31088 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31102 - SURFACE
      ?auto_31103 - SURFACE
      ?auto_31104 - SURFACE
    )
    :vars
    (
      ?auto_31108 - HOIST
      ?auto_31112 - PLACE
      ?auto_31110 - PLACE
      ?auto_31114 - HOIST
      ?auto_31111 - SURFACE
      ?auto_31105 - PLACE
      ?auto_31113 - HOIST
      ?auto_31115 - SURFACE
      ?auto_31109 - SURFACE
      ?auto_31107 - SURFACE
      ?auto_31116 - TRUCK
      ?auto_31106 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31108 ?auto_31112 ) ( IS-CRATE ?auto_31104 ) ( not ( = ?auto_31103 ?auto_31104 ) ) ( not ( = ?auto_31102 ?auto_31103 ) ) ( not ( = ?auto_31102 ?auto_31104 ) ) ( not ( = ?auto_31110 ?auto_31112 ) ) ( HOIST-AT ?auto_31114 ?auto_31110 ) ( not ( = ?auto_31108 ?auto_31114 ) ) ( AVAILABLE ?auto_31114 ) ( SURFACE-AT ?auto_31104 ?auto_31110 ) ( ON ?auto_31104 ?auto_31111 ) ( CLEAR ?auto_31104 ) ( not ( = ?auto_31103 ?auto_31111 ) ) ( not ( = ?auto_31104 ?auto_31111 ) ) ( not ( = ?auto_31102 ?auto_31111 ) ) ( IS-CRATE ?auto_31103 ) ( not ( = ?auto_31105 ?auto_31112 ) ) ( not ( = ?auto_31110 ?auto_31105 ) ) ( HOIST-AT ?auto_31113 ?auto_31105 ) ( not ( = ?auto_31108 ?auto_31113 ) ) ( not ( = ?auto_31114 ?auto_31113 ) ) ( SURFACE-AT ?auto_31103 ?auto_31105 ) ( ON ?auto_31103 ?auto_31115 ) ( CLEAR ?auto_31103 ) ( not ( = ?auto_31103 ?auto_31115 ) ) ( not ( = ?auto_31104 ?auto_31115 ) ) ( not ( = ?auto_31102 ?auto_31115 ) ) ( not ( = ?auto_31111 ?auto_31115 ) ) ( IS-CRATE ?auto_31102 ) ( not ( = ?auto_31109 ?auto_31102 ) ) ( not ( = ?auto_31103 ?auto_31109 ) ) ( not ( = ?auto_31104 ?auto_31109 ) ) ( not ( = ?auto_31111 ?auto_31109 ) ) ( not ( = ?auto_31115 ?auto_31109 ) ) ( AVAILABLE ?auto_31113 ) ( SURFACE-AT ?auto_31102 ?auto_31105 ) ( ON ?auto_31102 ?auto_31107 ) ( CLEAR ?auto_31102 ) ( not ( = ?auto_31103 ?auto_31107 ) ) ( not ( = ?auto_31104 ?auto_31107 ) ) ( not ( = ?auto_31102 ?auto_31107 ) ) ( not ( = ?auto_31111 ?auto_31107 ) ) ( not ( = ?auto_31115 ?auto_31107 ) ) ( not ( = ?auto_31109 ?auto_31107 ) ) ( TRUCK-AT ?auto_31116 ?auto_31112 ) ( SURFACE-AT ?auto_31106 ?auto_31112 ) ( CLEAR ?auto_31106 ) ( LIFTING ?auto_31108 ?auto_31109 ) ( IS-CRATE ?auto_31109 ) ( not ( = ?auto_31106 ?auto_31109 ) ) ( not ( = ?auto_31103 ?auto_31106 ) ) ( not ( = ?auto_31104 ?auto_31106 ) ) ( not ( = ?auto_31102 ?auto_31106 ) ) ( not ( = ?auto_31111 ?auto_31106 ) ) ( not ( = ?auto_31115 ?auto_31106 ) ) ( not ( = ?auto_31107 ?auto_31106 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31103 ?auto_31104 )
      ( MAKE-2CRATE-VERIFY ?auto_31102 ?auto_31103 ?auto_31104 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31117 - SURFACE
      ?auto_31118 - SURFACE
      ?auto_31119 - SURFACE
      ?auto_31120 - SURFACE
    )
    :vars
    (
      ?auto_31123 - HOIST
      ?auto_31125 - PLACE
      ?auto_31124 - PLACE
      ?auto_31130 - HOIST
      ?auto_31128 - SURFACE
      ?auto_31126 - PLACE
      ?auto_31131 - HOIST
      ?auto_31122 - SURFACE
      ?auto_31121 - SURFACE
      ?auto_31129 - TRUCK
      ?auto_31127 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31123 ?auto_31125 ) ( IS-CRATE ?auto_31120 ) ( not ( = ?auto_31119 ?auto_31120 ) ) ( not ( = ?auto_31118 ?auto_31119 ) ) ( not ( = ?auto_31118 ?auto_31120 ) ) ( not ( = ?auto_31124 ?auto_31125 ) ) ( HOIST-AT ?auto_31130 ?auto_31124 ) ( not ( = ?auto_31123 ?auto_31130 ) ) ( AVAILABLE ?auto_31130 ) ( SURFACE-AT ?auto_31120 ?auto_31124 ) ( ON ?auto_31120 ?auto_31128 ) ( CLEAR ?auto_31120 ) ( not ( = ?auto_31119 ?auto_31128 ) ) ( not ( = ?auto_31120 ?auto_31128 ) ) ( not ( = ?auto_31118 ?auto_31128 ) ) ( IS-CRATE ?auto_31119 ) ( not ( = ?auto_31126 ?auto_31125 ) ) ( not ( = ?auto_31124 ?auto_31126 ) ) ( HOIST-AT ?auto_31131 ?auto_31126 ) ( not ( = ?auto_31123 ?auto_31131 ) ) ( not ( = ?auto_31130 ?auto_31131 ) ) ( SURFACE-AT ?auto_31119 ?auto_31126 ) ( ON ?auto_31119 ?auto_31122 ) ( CLEAR ?auto_31119 ) ( not ( = ?auto_31119 ?auto_31122 ) ) ( not ( = ?auto_31120 ?auto_31122 ) ) ( not ( = ?auto_31118 ?auto_31122 ) ) ( not ( = ?auto_31128 ?auto_31122 ) ) ( IS-CRATE ?auto_31118 ) ( not ( = ?auto_31117 ?auto_31118 ) ) ( not ( = ?auto_31119 ?auto_31117 ) ) ( not ( = ?auto_31120 ?auto_31117 ) ) ( not ( = ?auto_31128 ?auto_31117 ) ) ( not ( = ?auto_31122 ?auto_31117 ) ) ( AVAILABLE ?auto_31131 ) ( SURFACE-AT ?auto_31118 ?auto_31126 ) ( ON ?auto_31118 ?auto_31121 ) ( CLEAR ?auto_31118 ) ( not ( = ?auto_31119 ?auto_31121 ) ) ( not ( = ?auto_31120 ?auto_31121 ) ) ( not ( = ?auto_31118 ?auto_31121 ) ) ( not ( = ?auto_31128 ?auto_31121 ) ) ( not ( = ?auto_31122 ?auto_31121 ) ) ( not ( = ?auto_31117 ?auto_31121 ) ) ( TRUCK-AT ?auto_31129 ?auto_31125 ) ( SURFACE-AT ?auto_31127 ?auto_31125 ) ( CLEAR ?auto_31127 ) ( LIFTING ?auto_31123 ?auto_31117 ) ( IS-CRATE ?auto_31117 ) ( not ( = ?auto_31127 ?auto_31117 ) ) ( not ( = ?auto_31119 ?auto_31127 ) ) ( not ( = ?auto_31120 ?auto_31127 ) ) ( not ( = ?auto_31118 ?auto_31127 ) ) ( not ( = ?auto_31128 ?auto_31127 ) ) ( not ( = ?auto_31122 ?auto_31127 ) ) ( not ( = ?auto_31121 ?auto_31127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31118 ?auto_31119 ?auto_31120 )
      ( MAKE-3CRATE-VERIFY ?auto_31117 ?auto_31118 ?auto_31119 ?auto_31120 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31132 - SURFACE
      ?auto_31133 - SURFACE
      ?auto_31134 - SURFACE
      ?auto_31135 - SURFACE
      ?auto_31136 - SURFACE
    )
    :vars
    (
      ?auto_31139 - HOIST
      ?auto_31141 - PLACE
      ?auto_31140 - PLACE
      ?auto_31145 - HOIST
      ?auto_31143 - SURFACE
      ?auto_31142 - PLACE
      ?auto_31146 - HOIST
      ?auto_31138 - SURFACE
      ?auto_31137 - SURFACE
      ?auto_31144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31139 ?auto_31141 ) ( IS-CRATE ?auto_31136 ) ( not ( = ?auto_31135 ?auto_31136 ) ) ( not ( = ?auto_31134 ?auto_31135 ) ) ( not ( = ?auto_31134 ?auto_31136 ) ) ( not ( = ?auto_31140 ?auto_31141 ) ) ( HOIST-AT ?auto_31145 ?auto_31140 ) ( not ( = ?auto_31139 ?auto_31145 ) ) ( AVAILABLE ?auto_31145 ) ( SURFACE-AT ?auto_31136 ?auto_31140 ) ( ON ?auto_31136 ?auto_31143 ) ( CLEAR ?auto_31136 ) ( not ( = ?auto_31135 ?auto_31143 ) ) ( not ( = ?auto_31136 ?auto_31143 ) ) ( not ( = ?auto_31134 ?auto_31143 ) ) ( IS-CRATE ?auto_31135 ) ( not ( = ?auto_31142 ?auto_31141 ) ) ( not ( = ?auto_31140 ?auto_31142 ) ) ( HOIST-AT ?auto_31146 ?auto_31142 ) ( not ( = ?auto_31139 ?auto_31146 ) ) ( not ( = ?auto_31145 ?auto_31146 ) ) ( SURFACE-AT ?auto_31135 ?auto_31142 ) ( ON ?auto_31135 ?auto_31138 ) ( CLEAR ?auto_31135 ) ( not ( = ?auto_31135 ?auto_31138 ) ) ( not ( = ?auto_31136 ?auto_31138 ) ) ( not ( = ?auto_31134 ?auto_31138 ) ) ( not ( = ?auto_31143 ?auto_31138 ) ) ( IS-CRATE ?auto_31134 ) ( not ( = ?auto_31133 ?auto_31134 ) ) ( not ( = ?auto_31135 ?auto_31133 ) ) ( not ( = ?auto_31136 ?auto_31133 ) ) ( not ( = ?auto_31143 ?auto_31133 ) ) ( not ( = ?auto_31138 ?auto_31133 ) ) ( AVAILABLE ?auto_31146 ) ( SURFACE-AT ?auto_31134 ?auto_31142 ) ( ON ?auto_31134 ?auto_31137 ) ( CLEAR ?auto_31134 ) ( not ( = ?auto_31135 ?auto_31137 ) ) ( not ( = ?auto_31136 ?auto_31137 ) ) ( not ( = ?auto_31134 ?auto_31137 ) ) ( not ( = ?auto_31143 ?auto_31137 ) ) ( not ( = ?auto_31138 ?auto_31137 ) ) ( not ( = ?auto_31133 ?auto_31137 ) ) ( TRUCK-AT ?auto_31144 ?auto_31141 ) ( SURFACE-AT ?auto_31132 ?auto_31141 ) ( CLEAR ?auto_31132 ) ( LIFTING ?auto_31139 ?auto_31133 ) ( IS-CRATE ?auto_31133 ) ( not ( = ?auto_31132 ?auto_31133 ) ) ( not ( = ?auto_31135 ?auto_31132 ) ) ( not ( = ?auto_31136 ?auto_31132 ) ) ( not ( = ?auto_31134 ?auto_31132 ) ) ( not ( = ?auto_31143 ?auto_31132 ) ) ( not ( = ?auto_31138 ?auto_31132 ) ) ( not ( = ?auto_31137 ?auto_31132 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31134 ?auto_31135 ?auto_31136 )
      ( MAKE-4CRATE-VERIFY ?auto_31132 ?auto_31133 ?auto_31134 ?auto_31135 ?auto_31136 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31147 - SURFACE
      ?auto_31148 - SURFACE
      ?auto_31149 - SURFACE
      ?auto_31150 - SURFACE
      ?auto_31151 - SURFACE
      ?auto_31152 - SURFACE
    )
    :vars
    (
      ?auto_31155 - HOIST
      ?auto_31157 - PLACE
      ?auto_31156 - PLACE
      ?auto_31161 - HOIST
      ?auto_31159 - SURFACE
      ?auto_31158 - PLACE
      ?auto_31162 - HOIST
      ?auto_31154 - SURFACE
      ?auto_31153 - SURFACE
      ?auto_31160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31155 ?auto_31157 ) ( IS-CRATE ?auto_31152 ) ( not ( = ?auto_31151 ?auto_31152 ) ) ( not ( = ?auto_31150 ?auto_31151 ) ) ( not ( = ?auto_31150 ?auto_31152 ) ) ( not ( = ?auto_31156 ?auto_31157 ) ) ( HOIST-AT ?auto_31161 ?auto_31156 ) ( not ( = ?auto_31155 ?auto_31161 ) ) ( AVAILABLE ?auto_31161 ) ( SURFACE-AT ?auto_31152 ?auto_31156 ) ( ON ?auto_31152 ?auto_31159 ) ( CLEAR ?auto_31152 ) ( not ( = ?auto_31151 ?auto_31159 ) ) ( not ( = ?auto_31152 ?auto_31159 ) ) ( not ( = ?auto_31150 ?auto_31159 ) ) ( IS-CRATE ?auto_31151 ) ( not ( = ?auto_31158 ?auto_31157 ) ) ( not ( = ?auto_31156 ?auto_31158 ) ) ( HOIST-AT ?auto_31162 ?auto_31158 ) ( not ( = ?auto_31155 ?auto_31162 ) ) ( not ( = ?auto_31161 ?auto_31162 ) ) ( SURFACE-AT ?auto_31151 ?auto_31158 ) ( ON ?auto_31151 ?auto_31154 ) ( CLEAR ?auto_31151 ) ( not ( = ?auto_31151 ?auto_31154 ) ) ( not ( = ?auto_31152 ?auto_31154 ) ) ( not ( = ?auto_31150 ?auto_31154 ) ) ( not ( = ?auto_31159 ?auto_31154 ) ) ( IS-CRATE ?auto_31150 ) ( not ( = ?auto_31149 ?auto_31150 ) ) ( not ( = ?auto_31151 ?auto_31149 ) ) ( not ( = ?auto_31152 ?auto_31149 ) ) ( not ( = ?auto_31159 ?auto_31149 ) ) ( not ( = ?auto_31154 ?auto_31149 ) ) ( AVAILABLE ?auto_31162 ) ( SURFACE-AT ?auto_31150 ?auto_31158 ) ( ON ?auto_31150 ?auto_31153 ) ( CLEAR ?auto_31150 ) ( not ( = ?auto_31151 ?auto_31153 ) ) ( not ( = ?auto_31152 ?auto_31153 ) ) ( not ( = ?auto_31150 ?auto_31153 ) ) ( not ( = ?auto_31159 ?auto_31153 ) ) ( not ( = ?auto_31154 ?auto_31153 ) ) ( not ( = ?auto_31149 ?auto_31153 ) ) ( TRUCK-AT ?auto_31160 ?auto_31157 ) ( SURFACE-AT ?auto_31148 ?auto_31157 ) ( CLEAR ?auto_31148 ) ( LIFTING ?auto_31155 ?auto_31149 ) ( IS-CRATE ?auto_31149 ) ( not ( = ?auto_31148 ?auto_31149 ) ) ( not ( = ?auto_31151 ?auto_31148 ) ) ( not ( = ?auto_31152 ?auto_31148 ) ) ( not ( = ?auto_31150 ?auto_31148 ) ) ( not ( = ?auto_31159 ?auto_31148 ) ) ( not ( = ?auto_31154 ?auto_31148 ) ) ( not ( = ?auto_31153 ?auto_31148 ) ) ( ON ?auto_31148 ?auto_31147 ) ( not ( = ?auto_31147 ?auto_31148 ) ) ( not ( = ?auto_31147 ?auto_31149 ) ) ( not ( = ?auto_31147 ?auto_31150 ) ) ( not ( = ?auto_31147 ?auto_31151 ) ) ( not ( = ?auto_31147 ?auto_31152 ) ) ( not ( = ?auto_31147 ?auto_31159 ) ) ( not ( = ?auto_31147 ?auto_31154 ) ) ( not ( = ?auto_31147 ?auto_31153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31150 ?auto_31151 ?auto_31152 )
      ( MAKE-5CRATE-VERIFY ?auto_31147 ?auto_31148 ?auto_31149 ?auto_31150 ?auto_31151 ?auto_31152 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31163 - SURFACE
      ?auto_31164 - SURFACE
    )
    :vars
    (
      ?auto_31167 - HOIST
      ?auto_31170 - PLACE
      ?auto_31169 - SURFACE
      ?auto_31168 - PLACE
      ?auto_31176 - HOIST
      ?auto_31174 - SURFACE
      ?auto_31171 - PLACE
      ?auto_31177 - HOIST
      ?auto_31166 - SURFACE
      ?auto_31173 - SURFACE
      ?auto_31165 - SURFACE
      ?auto_31175 - TRUCK
      ?auto_31172 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31167 ?auto_31170 ) ( IS-CRATE ?auto_31164 ) ( not ( = ?auto_31163 ?auto_31164 ) ) ( not ( = ?auto_31169 ?auto_31163 ) ) ( not ( = ?auto_31169 ?auto_31164 ) ) ( not ( = ?auto_31168 ?auto_31170 ) ) ( HOIST-AT ?auto_31176 ?auto_31168 ) ( not ( = ?auto_31167 ?auto_31176 ) ) ( AVAILABLE ?auto_31176 ) ( SURFACE-AT ?auto_31164 ?auto_31168 ) ( ON ?auto_31164 ?auto_31174 ) ( CLEAR ?auto_31164 ) ( not ( = ?auto_31163 ?auto_31174 ) ) ( not ( = ?auto_31164 ?auto_31174 ) ) ( not ( = ?auto_31169 ?auto_31174 ) ) ( IS-CRATE ?auto_31163 ) ( not ( = ?auto_31171 ?auto_31170 ) ) ( not ( = ?auto_31168 ?auto_31171 ) ) ( HOIST-AT ?auto_31177 ?auto_31171 ) ( not ( = ?auto_31167 ?auto_31177 ) ) ( not ( = ?auto_31176 ?auto_31177 ) ) ( SURFACE-AT ?auto_31163 ?auto_31171 ) ( ON ?auto_31163 ?auto_31166 ) ( CLEAR ?auto_31163 ) ( not ( = ?auto_31163 ?auto_31166 ) ) ( not ( = ?auto_31164 ?auto_31166 ) ) ( not ( = ?auto_31169 ?auto_31166 ) ) ( not ( = ?auto_31174 ?auto_31166 ) ) ( IS-CRATE ?auto_31169 ) ( not ( = ?auto_31173 ?auto_31169 ) ) ( not ( = ?auto_31163 ?auto_31173 ) ) ( not ( = ?auto_31164 ?auto_31173 ) ) ( not ( = ?auto_31174 ?auto_31173 ) ) ( not ( = ?auto_31166 ?auto_31173 ) ) ( AVAILABLE ?auto_31177 ) ( SURFACE-AT ?auto_31169 ?auto_31171 ) ( ON ?auto_31169 ?auto_31165 ) ( CLEAR ?auto_31169 ) ( not ( = ?auto_31163 ?auto_31165 ) ) ( not ( = ?auto_31164 ?auto_31165 ) ) ( not ( = ?auto_31169 ?auto_31165 ) ) ( not ( = ?auto_31174 ?auto_31165 ) ) ( not ( = ?auto_31166 ?auto_31165 ) ) ( not ( = ?auto_31173 ?auto_31165 ) ) ( TRUCK-AT ?auto_31175 ?auto_31170 ) ( SURFACE-AT ?auto_31172 ?auto_31170 ) ( CLEAR ?auto_31172 ) ( IS-CRATE ?auto_31173 ) ( not ( = ?auto_31172 ?auto_31173 ) ) ( not ( = ?auto_31163 ?auto_31172 ) ) ( not ( = ?auto_31164 ?auto_31172 ) ) ( not ( = ?auto_31169 ?auto_31172 ) ) ( not ( = ?auto_31174 ?auto_31172 ) ) ( not ( = ?auto_31166 ?auto_31172 ) ) ( not ( = ?auto_31165 ?auto_31172 ) ) ( AVAILABLE ?auto_31167 ) ( IN ?auto_31173 ?auto_31175 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31167 ?auto_31173 ?auto_31175 ?auto_31170 )
      ( MAKE-2CRATE ?auto_31169 ?auto_31163 ?auto_31164 )
      ( MAKE-1CRATE-VERIFY ?auto_31163 ?auto_31164 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31178 - SURFACE
      ?auto_31179 - SURFACE
      ?auto_31180 - SURFACE
    )
    :vars
    (
      ?auto_31182 - HOIST
      ?auto_31186 - PLACE
      ?auto_31188 - PLACE
      ?auto_31189 - HOIST
      ?auto_31181 - SURFACE
      ?auto_31191 - PLACE
      ?auto_31184 - HOIST
      ?auto_31183 - SURFACE
      ?auto_31185 - SURFACE
      ?auto_31190 - SURFACE
      ?auto_31192 - TRUCK
      ?auto_31187 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31182 ?auto_31186 ) ( IS-CRATE ?auto_31180 ) ( not ( = ?auto_31179 ?auto_31180 ) ) ( not ( = ?auto_31178 ?auto_31179 ) ) ( not ( = ?auto_31178 ?auto_31180 ) ) ( not ( = ?auto_31188 ?auto_31186 ) ) ( HOIST-AT ?auto_31189 ?auto_31188 ) ( not ( = ?auto_31182 ?auto_31189 ) ) ( AVAILABLE ?auto_31189 ) ( SURFACE-AT ?auto_31180 ?auto_31188 ) ( ON ?auto_31180 ?auto_31181 ) ( CLEAR ?auto_31180 ) ( not ( = ?auto_31179 ?auto_31181 ) ) ( not ( = ?auto_31180 ?auto_31181 ) ) ( not ( = ?auto_31178 ?auto_31181 ) ) ( IS-CRATE ?auto_31179 ) ( not ( = ?auto_31191 ?auto_31186 ) ) ( not ( = ?auto_31188 ?auto_31191 ) ) ( HOIST-AT ?auto_31184 ?auto_31191 ) ( not ( = ?auto_31182 ?auto_31184 ) ) ( not ( = ?auto_31189 ?auto_31184 ) ) ( SURFACE-AT ?auto_31179 ?auto_31191 ) ( ON ?auto_31179 ?auto_31183 ) ( CLEAR ?auto_31179 ) ( not ( = ?auto_31179 ?auto_31183 ) ) ( not ( = ?auto_31180 ?auto_31183 ) ) ( not ( = ?auto_31178 ?auto_31183 ) ) ( not ( = ?auto_31181 ?auto_31183 ) ) ( IS-CRATE ?auto_31178 ) ( not ( = ?auto_31185 ?auto_31178 ) ) ( not ( = ?auto_31179 ?auto_31185 ) ) ( not ( = ?auto_31180 ?auto_31185 ) ) ( not ( = ?auto_31181 ?auto_31185 ) ) ( not ( = ?auto_31183 ?auto_31185 ) ) ( AVAILABLE ?auto_31184 ) ( SURFACE-AT ?auto_31178 ?auto_31191 ) ( ON ?auto_31178 ?auto_31190 ) ( CLEAR ?auto_31178 ) ( not ( = ?auto_31179 ?auto_31190 ) ) ( not ( = ?auto_31180 ?auto_31190 ) ) ( not ( = ?auto_31178 ?auto_31190 ) ) ( not ( = ?auto_31181 ?auto_31190 ) ) ( not ( = ?auto_31183 ?auto_31190 ) ) ( not ( = ?auto_31185 ?auto_31190 ) ) ( TRUCK-AT ?auto_31192 ?auto_31186 ) ( SURFACE-AT ?auto_31187 ?auto_31186 ) ( CLEAR ?auto_31187 ) ( IS-CRATE ?auto_31185 ) ( not ( = ?auto_31187 ?auto_31185 ) ) ( not ( = ?auto_31179 ?auto_31187 ) ) ( not ( = ?auto_31180 ?auto_31187 ) ) ( not ( = ?auto_31178 ?auto_31187 ) ) ( not ( = ?auto_31181 ?auto_31187 ) ) ( not ( = ?auto_31183 ?auto_31187 ) ) ( not ( = ?auto_31190 ?auto_31187 ) ) ( AVAILABLE ?auto_31182 ) ( IN ?auto_31185 ?auto_31192 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31179 ?auto_31180 )
      ( MAKE-2CRATE-VERIFY ?auto_31178 ?auto_31179 ?auto_31180 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31193 - SURFACE
      ?auto_31194 - SURFACE
      ?auto_31195 - SURFACE
      ?auto_31196 - SURFACE
    )
    :vars
    (
      ?auto_31205 - HOIST
      ?auto_31203 - PLACE
      ?auto_31197 - PLACE
      ?auto_31207 - HOIST
      ?auto_31202 - SURFACE
      ?auto_31201 - PLACE
      ?auto_31199 - HOIST
      ?auto_31200 - SURFACE
      ?auto_31204 - SURFACE
      ?auto_31206 - TRUCK
      ?auto_31198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31205 ?auto_31203 ) ( IS-CRATE ?auto_31196 ) ( not ( = ?auto_31195 ?auto_31196 ) ) ( not ( = ?auto_31194 ?auto_31195 ) ) ( not ( = ?auto_31194 ?auto_31196 ) ) ( not ( = ?auto_31197 ?auto_31203 ) ) ( HOIST-AT ?auto_31207 ?auto_31197 ) ( not ( = ?auto_31205 ?auto_31207 ) ) ( AVAILABLE ?auto_31207 ) ( SURFACE-AT ?auto_31196 ?auto_31197 ) ( ON ?auto_31196 ?auto_31202 ) ( CLEAR ?auto_31196 ) ( not ( = ?auto_31195 ?auto_31202 ) ) ( not ( = ?auto_31196 ?auto_31202 ) ) ( not ( = ?auto_31194 ?auto_31202 ) ) ( IS-CRATE ?auto_31195 ) ( not ( = ?auto_31201 ?auto_31203 ) ) ( not ( = ?auto_31197 ?auto_31201 ) ) ( HOIST-AT ?auto_31199 ?auto_31201 ) ( not ( = ?auto_31205 ?auto_31199 ) ) ( not ( = ?auto_31207 ?auto_31199 ) ) ( SURFACE-AT ?auto_31195 ?auto_31201 ) ( ON ?auto_31195 ?auto_31200 ) ( CLEAR ?auto_31195 ) ( not ( = ?auto_31195 ?auto_31200 ) ) ( not ( = ?auto_31196 ?auto_31200 ) ) ( not ( = ?auto_31194 ?auto_31200 ) ) ( not ( = ?auto_31202 ?auto_31200 ) ) ( IS-CRATE ?auto_31194 ) ( not ( = ?auto_31193 ?auto_31194 ) ) ( not ( = ?auto_31195 ?auto_31193 ) ) ( not ( = ?auto_31196 ?auto_31193 ) ) ( not ( = ?auto_31202 ?auto_31193 ) ) ( not ( = ?auto_31200 ?auto_31193 ) ) ( AVAILABLE ?auto_31199 ) ( SURFACE-AT ?auto_31194 ?auto_31201 ) ( ON ?auto_31194 ?auto_31204 ) ( CLEAR ?auto_31194 ) ( not ( = ?auto_31195 ?auto_31204 ) ) ( not ( = ?auto_31196 ?auto_31204 ) ) ( not ( = ?auto_31194 ?auto_31204 ) ) ( not ( = ?auto_31202 ?auto_31204 ) ) ( not ( = ?auto_31200 ?auto_31204 ) ) ( not ( = ?auto_31193 ?auto_31204 ) ) ( TRUCK-AT ?auto_31206 ?auto_31203 ) ( SURFACE-AT ?auto_31198 ?auto_31203 ) ( CLEAR ?auto_31198 ) ( IS-CRATE ?auto_31193 ) ( not ( = ?auto_31198 ?auto_31193 ) ) ( not ( = ?auto_31195 ?auto_31198 ) ) ( not ( = ?auto_31196 ?auto_31198 ) ) ( not ( = ?auto_31194 ?auto_31198 ) ) ( not ( = ?auto_31202 ?auto_31198 ) ) ( not ( = ?auto_31200 ?auto_31198 ) ) ( not ( = ?auto_31204 ?auto_31198 ) ) ( AVAILABLE ?auto_31205 ) ( IN ?auto_31193 ?auto_31206 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31194 ?auto_31195 ?auto_31196 )
      ( MAKE-3CRATE-VERIFY ?auto_31193 ?auto_31194 ?auto_31195 ?auto_31196 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31208 - SURFACE
      ?auto_31209 - SURFACE
      ?auto_31210 - SURFACE
      ?auto_31211 - SURFACE
      ?auto_31212 - SURFACE
    )
    :vars
    (
      ?auto_31220 - HOIST
      ?auto_31218 - PLACE
      ?auto_31213 - PLACE
      ?auto_31222 - HOIST
      ?auto_31217 - SURFACE
      ?auto_31216 - PLACE
      ?auto_31214 - HOIST
      ?auto_31215 - SURFACE
      ?auto_31219 - SURFACE
      ?auto_31221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31220 ?auto_31218 ) ( IS-CRATE ?auto_31212 ) ( not ( = ?auto_31211 ?auto_31212 ) ) ( not ( = ?auto_31210 ?auto_31211 ) ) ( not ( = ?auto_31210 ?auto_31212 ) ) ( not ( = ?auto_31213 ?auto_31218 ) ) ( HOIST-AT ?auto_31222 ?auto_31213 ) ( not ( = ?auto_31220 ?auto_31222 ) ) ( AVAILABLE ?auto_31222 ) ( SURFACE-AT ?auto_31212 ?auto_31213 ) ( ON ?auto_31212 ?auto_31217 ) ( CLEAR ?auto_31212 ) ( not ( = ?auto_31211 ?auto_31217 ) ) ( not ( = ?auto_31212 ?auto_31217 ) ) ( not ( = ?auto_31210 ?auto_31217 ) ) ( IS-CRATE ?auto_31211 ) ( not ( = ?auto_31216 ?auto_31218 ) ) ( not ( = ?auto_31213 ?auto_31216 ) ) ( HOIST-AT ?auto_31214 ?auto_31216 ) ( not ( = ?auto_31220 ?auto_31214 ) ) ( not ( = ?auto_31222 ?auto_31214 ) ) ( SURFACE-AT ?auto_31211 ?auto_31216 ) ( ON ?auto_31211 ?auto_31215 ) ( CLEAR ?auto_31211 ) ( not ( = ?auto_31211 ?auto_31215 ) ) ( not ( = ?auto_31212 ?auto_31215 ) ) ( not ( = ?auto_31210 ?auto_31215 ) ) ( not ( = ?auto_31217 ?auto_31215 ) ) ( IS-CRATE ?auto_31210 ) ( not ( = ?auto_31209 ?auto_31210 ) ) ( not ( = ?auto_31211 ?auto_31209 ) ) ( not ( = ?auto_31212 ?auto_31209 ) ) ( not ( = ?auto_31217 ?auto_31209 ) ) ( not ( = ?auto_31215 ?auto_31209 ) ) ( AVAILABLE ?auto_31214 ) ( SURFACE-AT ?auto_31210 ?auto_31216 ) ( ON ?auto_31210 ?auto_31219 ) ( CLEAR ?auto_31210 ) ( not ( = ?auto_31211 ?auto_31219 ) ) ( not ( = ?auto_31212 ?auto_31219 ) ) ( not ( = ?auto_31210 ?auto_31219 ) ) ( not ( = ?auto_31217 ?auto_31219 ) ) ( not ( = ?auto_31215 ?auto_31219 ) ) ( not ( = ?auto_31209 ?auto_31219 ) ) ( TRUCK-AT ?auto_31221 ?auto_31218 ) ( SURFACE-AT ?auto_31208 ?auto_31218 ) ( CLEAR ?auto_31208 ) ( IS-CRATE ?auto_31209 ) ( not ( = ?auto_31208 ?auto_31209 ) ) ( not ( = ?auto_31211 ?auto_31208 ) ) ( not ( = ?auto_31212 ?auto_31208 ) ) ( not ( = ?auto_31210 ?auto_31208 ) ) ( not ( = ?auto_31217 ?auto_31208 ) ) ( not ( = ?auto_31215 ?auto_31208 ) ) ( not ( = ?auto_31219 ?auto_31208 ) ) ( AVAILABLE ?auto_31220 ) ( IN ?auto_31209 ?auto_31221 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31210 ?auto_31211 ?auto_31212 )
      ( MAKE-4CRATE-VERIFY ?auto_31208 ?auto_31209 ?auto_31210 ?auto_31211 ?auto_31212 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31223 - SURFACE
      ?auto_31224 - SURFACE
      ?auto_31225 - SURFACE
      ?auto_31226 - SURFACE
      ?auto_31227 - SURFACE
      ?auto_31228 - SURFACE
    )
    :vars
    (
      ?auto_31236 - HOIST
      ?auto_31234 - PLACE
      ?auto_31229 - PLACE
      ?auto_31238 - HOIST
      ?auto_31233 - SURFACE
      ?auto_31232 - PLACE
      ?auto_31230 - HOIST
      ?auto_31231 - SURFACE
      ?auto_31235 - SURFACE
      ?auto_31237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31236 ?auto_31234 ) ( IS-CRATE ?auto_31228 ) ( not ( = ?auto_31227 ?auto_31228 ) ) ( not ( = ?auto_31226 ?auto_31227 ) ) ( not ( = ?auto_31226 ?auto_31228 ) ) ( not ( = ?auto_31229 ?auto_31234 ) ) ( HOIST-AT ?auto_31238 ?auto_31229 ) ( not ( = ?auto_31236 ?auto_31238 ) ) ( AVAILABLE ?auto_31238 ) ( SURFACE-AT ?auto_31228 ?auto_31229 ) ( ON ?auto_31228 ?auto_31233 ) ( CLEAR ?auto_31228 ) ( not ( = ?auto_31227 ?auto_31233 ) ) ( not ( = ?auto_31228 ?auto_31233 ) ) ( not ( = ?auto_31226 ?auto_31233 ) ) ( IS-CRATE ?auto_31227 ) ( not ( = ?auto_31232 ?auto_31234 ) ) ( not ( = ?auto_31229 ?auto_31232 ) ) ( HOIST-AT ?auto_31230 ?auto_31232 ) ( not ( = ?auto_31236 ?auto_31230 ) ) ( not ( = ?auto_31238 ?auto_31230 ) ) ( SURFACE-AT ?auto_31227 ?auto_31232 ) ( ON ?auto_31227 ?auto_31231 ) ( CLEAR ?auto_31227 ) ( not ( = ?auto_31227 ?auto_31231 ) ) ( not ( = ?auto_31228 ?auto_31231 ) ) ( not ( = ?auto_31226 ?auto_31231 ) ) ( not ( = ?auto_31233 ?auto_31231 ) ) ( IS-CRATE ?auto_31226 ) ( not ( = ?auto_31225 ?auto_31226 ) ) ( not ( = ?auto_31227 ?auto_31225 ) ) ( not ( = ?auto_31228 ?auto_31225 ) ) ( not ( = ?auto_31233 ?auto_31225 ) ) ( not ( = ?auto_31231 ?auto_31225 ) ) ( AVAILABLE ?auto_31230 ) ( SURFACE-AT ?auto_31226 ?auto_31232 ) ( ON ?auto_31226 ?auto_31235 ) ( CLEAR ?auto_31226 ) ( not ( = ?auto_31227 ?auto_31235 ) ) ( not ( = ?auto_31228 ?auto_31235 ) ) ( not ( = ?auto_31226 ?auto_31235 ) ) ( not ( = ?auto_31233 ?auto_31235 ) ) ( not ( = ?auto_31231 ?auto_31235 ) ) ( not ( = ?auto_31225 ?auto_31235 ) ) ( TRUCK-AT ?auto_31237 ?auto_31234 ) ( SURFACE-AT ?auto_31224 ?auto_31234 ) ( CLEAR ?auto_31224 ) ( IS-CRATE ?auto_31225 ) ( not ( = ?auto_31224 ?auto_31225 ) ) ( not ( = ?auto_31227 ?auto_31224 ) ) ( not ( = ?auto_31228 ?auto_31224 ) ) ( not ( = ?auto_31226 ?auto_31224 ) ) ( not ( = ?auto_31233 ?auto_31224 ) ) ( not ( = ?auto_31231 ?auto_31224 ) ) ( not ( = ?auto_31235 ?auto_31224 ) ) ( AVAILABLE ?auto_31236 ) ( IN ?auto_31225 ?auto_31237 ) ( ON ?auto_31224 ?auto_31223 ) ( not ( = ?auto_31223 ?auto_31224 ) ) ( not ( = ?auto_31223 ?auto_31225 ) ) ( not ( = ?auto_31223 ?auto_31226 ) ) ( not ( = ?auto_31223 ?auto_31227 ) ) ( not ( = ?auto_31223 ?auto_31228 ) ) ( not ( = ?auto_31223 ?auto_31233 ) ) ( not ( = ?auto_31223 ?auto_31231 ) ) ( not ( = ?auto_31223 ?auto_31235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31226 ?auto_31227 ?auto_31228 )
      ( MAKE-5CRATE-VERIFY ?auto_31223 ?auto_31224 ?auto_31225 ?auto_31226 ?auto_31227 ?auto_31228 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31239 - SURFACE
      ?auto_31240 - SURFACE
    )
    :vars
    (
      ?auto_31251 - HOIST
      ?auto_31248 - PLACE
      ?auto_31245 - SURFACE
      ?auto_31241 - PLACE
      ?auto_31253 - HOIST
      ?auto_31247 - SURFACE
      ?auto_31246 - PLACE
      ?auto_31243 - HOIST
      ?auto_31244 - SURFACE
      ?auto_31250 - SURFACE
      ?auto_31249 - SURFACE
      ?auto_31242 - SURFACE
      ?auto_31252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31251 ?auto_31248 ) ( IS-CRATE ?auto_31240 ) ( not ( = ?auto_31239 ?auto_31240 ) ) ( not ( = ?auto_31245 ?auto_31239 ) ) ( not ( = ?auto_31245 ?auto_31240 ) ) ( not ( = ?auto_31241 ?auto_31248 ) ) ( HOIST-AT ?auto_31253 ?auto_31241 ) ( not ( = ?auto_31251 ?auto_31253 ) ) ( AVAILABLE ?auto_31253 ) ( SURFACE-AT ?auto_31240 ?auto_31241 ) ( ON ?auto_31240 ?auto_31247 ) ( CLEAR ?auto_31240 ) ( not ( = ?auto_31239 ?auto_31247 ) ) ( not ( = ?auto_31240 ?auto_31247 ) ) ( not ( = ?auto_31245 ?auto_31247 ) ) ( IS-CRATE ?auto_31239 ) ( not ( = ?auto_31246 ?auto_31248 ) ) ( not ( = ?auto_31241 ?auto_31246 ) ) ( HOIST-AT ?auto_31243 ?auto_31246 ) ( not ( = ?auto_31251 ?auto_31243 ) ) ( not ( = ?auto_31253 ?auto_31243 ) ) ( SURFACE-AT ?auto_31239 ?auto_31246 ) ( ON ?auto_31239 ?auto_31244 ) ( CLEAR ?auto_31239 ) ( not ( = ?auto_31239 ?auto_31244 ) ) ( not ( = ?auto_31240 ?auto_31244 ) ) ( not ( = ?auto_31245 ?auto_31244 ) ) ( not ( = ?auto_31247 ?auto_31244 ) ) ( IS-CRATE ?auto_31245 ) ( not ( = ?auto_31250 ?auto_31245 ) ) ( not ( = ?auto_31239 ?auto_31250 ) ) ( not ( = ?auto_31240 ?auto_31250 ) ) ( not ( = ?auto_31247 ?auto_31250 ) ) ( not ( = ?auto_31244 ?auto_31250 ) ) ( AVAILABLE ?auto_31243 ) ( SURFACE-AT ?auto_31245 ?auto_31246 ) ( ON ?auto_31245 ?auto_31249 ) ( CLEAR ?auto_31245 ) ( not ( = ?auto_31239 ?auto_31249 ) ) ( not ( = ?auto_31240 ?auto_31249 ) ) ( not ( = ?auto_31245 ?auto_31249 ) ) ( not ( = ?auto_31247 ?auto_31249 ) ) ( not ( = ?auto_31244 ?auto_31249 ) ) ( not ( = ?auto_31250 ?auto_31249 ) ) ( SURFACE-AT ?auto_31242 ?auto_31248 ) ( CLEAR ?auto_31242 ) ( IS-CRATE ?auto_31250 ) ( not ( = ?auto_31242 ?auto_31250 ) ) ( not ( = ?auto_31239 ?auto_31242 ) ) ( not ( = ?auto_31240 ?auto_31242 ) ) ( not ( = ?auto_31245 ?auto_31242 ) ) ( not ( = ?auto_31247 ?auto_31242 ) ) ( not ( = ?auto_31244 ?auto_31242 ) ) ( not ( = ?auto_31249 ?auto_31242 ) ) ( AVAILABLE ?auto_31251 ) ( IN ?auto_31250 ?auto_31252 ) ( TRUCK-AT ?auto_31252 ?auto_31241 ) )
    :subtasks
    ( ( !DRIVE ?auto_31252 ?auto_31241 ?auto_31248 )
      ( MAKE-2CRATE ?auto_31245 ?auto_31239 ?auto_31240 )
      ( MAKE-1CRATE-VERIFY ?auto_31239 ?auto_31240 ) )
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
      ?auto_31257 - HOIST
      ?auto_31265 - PLACE
      ?auto_31258 - PLACE
      ?auto_31261 - HOIST
      ?auto_31266 - SURFACE
      ?auto_31268 - PLACE
      ?auto_31264 - HOIST
      ?auto_31259 - SURFACE
      ?auto_31263 - SURFACE
      ?auto_31267 - SURFACE
      ?auto_31262 - SURFACE
      ?auto_31260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31257 ?auto_31265 ) ( IS-CRATE ?auto_31256 ) ( not ( = ?auto_31255 ?auto_31256 ) ) ( not ( = ?auto_31254 ?auto_31255 ) ) ( not ( = ?auto_31254 ?auto_31256 ) ) ( not ( = ?auto_31258 ?auto_31265 ) ) ( HOIST-AT ?auto_31261 ?auto_31258 ) ( not ( = ?auto_31257 ?auto_31261 ) ) ( AVAILABLE ?auto_31261 ) ( SURFACE-AT ?auto_31256 ?auto_31258 ) ( ON ?auto_31256 ?auto_31266 ) ( CLEAR ?auto_31256 ) ( not ( = ?auto_31255 ?auto_31266 ) ) ( not ( = ?auto_31256 ?auto_31266 ) ) ( not ( = ?auto_31254 ?auto_31266 ) ) ( IS-CRATE ?auto_31255 ) ( not ( = ?auto_31268 ?auto_31265 ) ) ( not ( = ?auto_31258 ?auto_31268 ) ) ( HOIST-AT ?auto_31264 ?auto_31268 ) ( not ( = ?auto_31257 ?auto_31264 ) ) ( not ( = ?auto_31261 ?auto_31264 ) ) ( SURFACE-AT ?auto_31255 ?auto_31268 ) ( ON ?auto_31255 ?auto_31259 ) ( CLEAR ?auto_31255 ) ( not ( = ?auto_31255 ?auto_31259 ) ) ( not ( = ?auto_31256 ?auto_31259 ) ) ( not ( = ?auto_31254 ?auto_31259 ) ) ( not ( = ?auto_31266 ?auto_31259 ) ) ( IS-CRATE ?auto_31254 ) ( not ( = ?auto_31263 ?auto_31254 ) ) ( not ( = ?auto_31255 ?auto_31263 ) ) ( not ( = ?auto_31256 ?auto_31263 ) ) ( not ( = ?auto_31266 ?auto_31263 ) ) ( not ( = ?auto_31259 ?auto_31263 ) ) ( AVAILABLE ?auto_31264 ) ( SURFACE-AT ?auto_31254 ?auto_31268 ) ( ON ?auto_31254 ?auto_31267 ) ( CLEAR ?auto_31254 ) ( not ( = ?auto_31255 ?auto_31267 ) ) ( not ( = ?auto_31256 ?auto_31267 ) ) ( not ( = ?auto_31254 ?auto_31267 ) ) ( not ( = ?auto_31266 ?auto_31267 ) ) ( not ( = ?auto_31259 ?auto_31267 ) ) ( not ( = ?auto_31263 ?auto_31267 ) ) ( SURFACE-AT ?auto_31262 ?auto_31265 ) ( CLEAR ?auto_31262 ) ( IS-CRATE ?auto_31263 ) ( not ( = ?auto_31262 ?auto_31263 ) ) ( not ( = ?auto_31255 ?auto_31262 ) ) ( not ( = ?auto_31256 ?auto_31262 ) ) ( not ( = ?auto_31254 ?auto_31262 ) ) ( not ( = ?auto_31266 ?auto_31262 ) ) ( not ( = ?auto_31259 ?auto_31262 ) ) ( not ( = ?auto_31267 ?auto_31262 ) ) ( AVAILABLE ?auto_31257 ) ( IN ?auto_31263 ?auto_31260 ) ( TRUCK-AT ?auto_31260 ?auto_31258 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31255 ?auto_31256 )
      ( MAKE-2CRATE-VERIFY ?auto_31254 ?auto_31255 ?auto_31256 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31269 - SURFACE
      ?auto_31270 - SURFACE
      ?auto_31271 - SURFACE
      ?auto_31272 - SURFACE
    )
    :vars
    (
      ?auto_31281 - HOIST
      ?auto_31277 - PLACE
      ?auto_31275 - PLACE
      ?auto_31273 - HOIST
      ?auto_31280 - SURFACE
      ?auto_31279 - PLACE
      ?auto_31278 - HOIST
      ?auto_31282 - SURFACE
      ?auto_31274 - SURFACE
      ?auto_31276 - SURFACE
      ?auto_31283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31281 ?auto_31277 ) ( IS-CRATE ?auto_31272 ) ( not ( = ?auto_31271 ?auto_31272 ) ) ( not ( = ?auto_31270 ?auto_31271 ) ) ( not ( = ?auto_31270 ?auto_31272 ) ) ( not ( = ?auto_31275 ?auto_31277 ) ) ( HOIST-AT ?auto_31273 ?auto_31275 ) ( not ( = ?auto_31281 ?auto_31273 ) ) ( AVAILABLE ?auto_31273 ) ( SURFACE-AT ?auto_31272 ?auto_31275 ) ( ON ?auto_31272 ?auto_31280 ) ( CLEAR ?auto_31272 ) ( not ( = ?auto_31271 ?auto_31280 ) ) ( not ( = ?auto_31272 ?auto_31280 ) ) ( not ( = ?auto_31270 ?auto_31280 ) ) ( IS-CRATE ?auto_31271 ) ( not ( = ?auto_31279 ?auto_31277 ) ) ( not ( = ?auto_31275 ?auto_31279 ) ) ( HOIST-AT ?auto_31278 ?auto_31279 ) ( not ( = ?auto_31281 ?auto_31278 ) ) ( not ( = ?auto_31273 ?auto_31278 ) ) ( SURFACE-AT ?auto_31271 ?auto_31279 ) ( ON ?auto_31271 ?auto_31282 ) ( CLEAR ?auto_31271 ) ( not ( = ?auto_31271 ?auto_31282 ) ) ( not ( = ?auto_31272 ?auto_31282 ) ) ( not ( = ?auto_31270 ?auto_31282 ) ) ( not ( = ?auto_31280 ?auto_31282 ) ) ( IS-CRATE ?auto_31270 ) ( not ( = ?auto_31269 ?auto_31270 ) ) ( not ( = ?auto_31271 ?auto_31269 ) ) ( not ( = ?auto_31272 ?auto_31269 ) ) ( not ( = ?auto_31280 ?auto_31269 ) ) ( not ( = ?auto_31282 ?auto_31269 ) ) ( AVAILABLE ?auto_31278 ) ( SURFACE-AT ?auto_31270 ?auto_31279 ) ( ON ?auto_31270 ?auto_31274 ) ( CLEAR ?auto_31270 ) ( not ( = ?auto_31271 ?auto_31274 ) ) ( not ( = ?auto_31272 ?auto_31274 ) ) ( not ( = ?auto_31270 ?auto_31274 ) ) ( not ( = ?auto_31280 ?auto_31274 ) ) ( not ( = ?auto_31282 ?auto_31274 ) ) ( not ( = ?auto_31269 ?auto_31274 ) ) ( SURFACE-AT ?auto_31276 ?auto_31277 ) ( CLEAR ?auto_31276 ) ( IS-CRATE ?auto_31269 ) ( not ( = ?auto_31276 ?auto_31269 ) ) ( not ( = ?auto_31271 ?auto_31276 ) ) ( not ( = ?auto_31272 ?auto_31276 ) ) ( not ( = ?auto_31270 ?auto_31276 ) ) ( not ( = ?auto_31280 ?auto_31276 ) ) ( not ( = ?auto_31282 ?auto_31276 ) ) ( not ( = ?auto_31274 ?auto_31276 ) ) ( AVAILABLE ?auto_31281 ) ( IN ?auto_31269 ?auto_31283 ) ( TRUCK-AT ?auto_31283 ?auto_31275 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31270 ?auto_31271 ?auto_31272 )
      ( MAKE-3CRATE-VERIFY ?auto_31269 ?auto_31270 ?auto_31271 ?auto_31272 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31284 - SURFACE
      ?auto_31285 - SURFACE
      ?auto_31286 - SURFACE
      ?auto_31287 - SURFACE
      ?auto_31288 - SURFACE
    )
    :vars
    (
      ?auto_31296 - HOIST
      ?auto_31292 - PLACE
      ?auto_31291 - PLACE
      ?auto_31289 - HOIST
      ?auto_31295 - SURFACE
      ?auto_31294 - PLACE
      ?auto_31293 - HOIST
      ?auto_31297 - SURFACE
      ?auto_31290 - SURFACE
      ?auto_31298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31296 ?auto_31292 ) ( IS-CRATE ?auto_31288 ) ( not ( = ?auto_31287 ?auto_31288 ) ) ( not ( = ?auto_31286 ?auto_31287 ) ) ( not ( = ?auto_31286 ?auto_31288 ) ) ( not ( = ?auto_31291 ?auto_31292 ) ) ( HOIST-AT ?auto_31289 ?auto_31291 ) ( not ( = ?auto_31296 ?auto_31289 ) ) ( AVAILABLE ?auto_31289 ) ( SURFACE-AT ?auto_31288 ?auto_31291 ) ( ON ?auto_31288 ?auto_31295 ) ( CLEAR ?auto_31288 ) ( not ( = ?auto_31287 ?auto_31295 ) ) ( not ( = ?auto_31288 ?auto_31295 ) ) ( not ( = ?auto_31286 ?auto_31295 ) ) ( IS-CRATE ?auto_31287 ) ( not ( = ?auto_31294 ?auto_31292 ) ) ( not ( = ?auto_31291 ?auto_31294 ) ) ( HOIST-AT ?auto_31293 ?auto_31294 ) ( not ( = ?auto_31296 ?auto_31293 ) ) ( not ( = ?auto_31289 ?auto_31293 ) ) ( SURFACE-AT ?auto_31287 ?auto_31294 ) ( ON ?auto_31287 ?auto_31297 ) ( CLEAR ?auto_31287 ) ( not ( = ?auto_31287 ?auto_31297 ) ) ( not ( = ?auto_31288 ?auto_31297 ) ) ( not ( = ?auto_31286 ?auto_31297 ) ) ( not ( = ?auto_31295 ?auto_31297 ) ) ( IS-CRATE ?auto_31286 ) ( not ( = ?auto_31285 ?auto_31286 ) ) ( not ( = ?auto_31287 ?auto_31285 ) ) ( not ( = ?auto_31288 ?auto_31285 ) ) ( not ( = ?auto_31295 ?auto_31285 ) ) ( not ( = ?auto_31297 ?auto_31285 ) ) ( AVAILABLE ?auto_31293 ) ( SURFACE-AT ?auto_31286 ?auto_31294 ) ( ON ?auto_31286 ?auto_31290 ) ( CLEAR ?auto_31286 ) ( not ( = ?auto_31287 ?auto_31290 ) ) ( not ( = ?auto_31288 ?auto_31290 ) ) ( not ( = ?auto_31286 ?auto_31290 ) ) ( not ( = ?auto_31295 ?auto_31290 ) ) ( not ( = ?auto_31297 ?auto_31290 ) ) ( not ( = ?auto_31285 ?auto_31290 ) ) ( SURFACE-AT ?auto_31284 ?auto_31292 ) ( CLEAR ?auto_31284 ) ( IS-CRATE ?auto_31285 ) ( not ( = ?auto_31284 ?auto_31285 ) ) ( not ( = ?auto_31287 ?auto_31284 ) ) ( not ( = ?auto_31288 ?auto_31284 ) ) ( not ( = ?auto_31286 ?auto_31284 ) ) ( not ( = ?auto_31295 ?auto_31284 ) ) ( not ( = ?auto_31297 ?auto_31284 ) ) ( not ( = ?auto_31290 ?auto_31284 ) ) ( AVAILABLE ?auto_31296 ) ( IN ?auto_31285 ?auto_31298 ) ( TRUCK-AT ?auto_31298 ?auto_31291 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31286 ?auto_31287 ?auto_31288 )
      ( MAKE-4CRATE-VERIFY ?auto_31284 ?auto_31285 ?auto_31286 ?auto_31287 ?auto_31288 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31299 - SURFACE
      ?auto_31300 - SURFACE
      ?auto_31301 - SURFACE
      ?auto_31302 - SURFACE
      ?auto_31303 - SURFACE
      ?auto_31304 - SURFACE
    )
    :vars
    (
      ?auto_31312 - HOIST
      ?auto_31308 - PLACE
      ?auto_31307 - PLACE
      ?auto_31305 - HOIST
      ?auto_31311 - SURFACE
      ?auto_31310 - PLACE
      ?auto_31309 - HOIST
      ?auto_31313 - SURFACE
      ?auto_31306 - SURFACE
      ?auto_31314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31312 ?auto_31308 ) ( IS-CRATE ?auto_31304 ) ( not ( = ?auto_31303 ?auto_31304 ) ) ( not ( = ?auto_31302 ?auto_31303 ) ) ( not ( = ?auto_31302 ?auto_31304 ) ) ( not ( = ?auto_31307 ?auto_31308 ) ) ( HOIST-AT ?auto_31305 ?auto_31307 ) ( not ( = ?auto_31312 ?auto_31305 ) ) ( AVAILABLE ?auto_31305 ) ( SURFACE-AT ?auto_31304 ?auto_31307 ) ( ON ?auto_31304 ?auto_31311 ) ( CLEAR ?auto_31304 ) ( not ( = ?auto_31303 ?auto_31311 ) ) ( not ( = ?auto_31304 ?auto_31311 ) ) ( not ( = ?auto_31302 ?auto_31311 ) ) ( IS-CRATE ?auto_31303 ) ( not ( = ?auto_31310 ?auto_31308 ) ) ( not ( = ?auto_31307 ?auto_31310 ) ) ( HOIST-AT ?auto_31309 ?auto_31310 ) ( not ( = ?auto_31312 ?auto_31309 ) ) ( not ( = ?auto_31305 ?auto_31309 ) ) ( SURFACE-AT ?auto_31303 ?auto_31310 ) ( ON ?auto_31303 ?auto_31313 ) ( CLEAR ?auto_31303 ) ( not ( = ?auto_31303 ?auto_31313 ) ) ( not ( = ?auto_31304 ?auto_31313 ) ) ( not ( = ?auto_31302 ?auto_31313 ) ) ( not ( = ?auto_31311 ?auto_31313 ) ) ( IS-CRATE ?auto_31302 ) ( not ( = ?auto_31301 ?auto_31302 ) ) ( not ( = ?auto_31303 ?auto_31301 ) ) ( not ( = ?auto_31304 ?auto_31301 ) ) ( not ( = ?auto_31311 ?auto_31301 ) ) ( not ( = ?auto_31313 ?auto_31301 ) ) ( AVAILABLE ?auto_31309 ) ( SURFACE-AT ?auto_31302 ?auto_31310 ) ( ON ?auto_31302 ?auto_31306 ) ( CLEAR ?auto_31302 ) ( not ( = ?auto_31303 ?auto_31306 ) ) ( not ( = ?auto_31304 ?auto_31306 ) ) ( not ( = ?auto_31302 ?auto_31306 ) ) ( not ( = ?auto_31311 ?auto_31306 ) ) ( not ( = ?auto_31313 ?auto_31306 ) ) ( not ( = ?auto_31301 ?auto_31306 ) ) ( SURFACE-AT ?auto_31300 ?auto_31308 ) ( CLEAR ?auto_31300 ) ( IS-CRATE ?auto_31301 ) ( not ( = ?auto_31300 ?auto_31301 ) ) ( not ( = ?auto_31303 ?auto_31300 ) ) ( not ( = ?auto_31304 ?auto_31300 ) ) ( not ( = ?auto_31302 ?auto_31300 ) ) ( not ( = ?auto_31311 ?auto_31300 ) ) ( not ( = ?auto_31313 ?auto_31300 ) ) ( not ( = ?auto_31306 ?auto_31300 ) ) ( AVAILABLE ?auto_31312 ) ( IN ?auto_31301 ?auto_31314 ) ( TRUCK-AT ?auto_31314 ?auto_31307 ) ( ON ?auto_31300 ?auto_31299 ) ( not ( = ?auto_31299 ?auto_31300 ) ) ( not ( = ?auto_31299 ?auto_31301 ) ) ( not ( = ?auto_31299 ?auto_31302 ) ) ( not ( = ?auto_31299 ?auto_31303 ) ) ( not ( = ?auto_31299 ?auto_31304 ) ) ( not ( = ?auto_31299 ?auto_31311 ) ) ( not ( = ?auto_31299 ?auto_31313 ) ) ( not ( = ?auto_31299 ?auto_31306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31302 ?auto_31303 ?auto_31304 )
      ( MAKE-5CRATE-VERIFY ?auto_31299 ?auto_31300 ?auto_31301 ?auto_31302 ?auto_31303 ?auto_31304 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31315 - SURFACE
      ?auto_31316 - SURFACE
    )
    :vars
    (
      ?auto_31325 - HOIST
      ?auto_31321 - PLACE
      ?auto_31327 - SURFACE
      ?auto_31319 - PLACE
      ?auto_31317 - HOIST
      ?auto_31324 - SURFACE
      ?auto_31323 - PLACE
      ?auto_31322 - HOIST
      ?auto_31326 - SURFACE
      ?auto_31328 - SURFACE
      ?auto_31318 - SURFACE
      ?auto_31320 - SURFACE
      ?auto_31329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31325 ?auto_31321 ) ( IS-CRATE ?auto_31316 ) ( not ( = ?auto_31315 ?auto_31316 ) ) ( not ( = ?auto_31327 ?auto_31315 ) ) ( not ( = ?auto_31327 ?auto_31316 ) ) ( not ( = ?auto_31319 ?auto_31321 ) ) ( HOIST-AT ?auto_31317 ?auto_31319 ) ( not ( = ?auto_31325 ?auto_31317 ) ) ( SURFACE-AT ?auto_31316 ?auto_31319 ) ( ON ?auto_31316 ?auto_31324 ) ( CLEAR ?auto_31316 ) ( not ( = ?auto_31315 ?auto_31324 ) ) ( not ( = ?auto_31316 ?auto_31324 ) ) ( not ( = ?auto_31327 ?auto_31324 ) ) ( IS-CRATE ?auto_31315 ) ( not ( = ?auto_31323 ?auto_31321 ) ) ( not ( = ?auto_31319 ?auto_31323 ) ) ( HOIST-AT ?auto_31322 ?auto_31323 ) ( not ( = ?auto_31325 ?auto_31322 ) ) ( not ( = ?auto_31317 ?auto_31322 ) ) ( SURFACE-AT ?auto_31315 ?auto_31323 ) ( ON ?auto_31315 ?auto_31326 ) ( CLEAR ?auto_31315 ) ( not ( = ?auto_31315 ?auto_31326 ) ) ( not ( = ?auto_31316 ?auto_31326 ) ) ( not ( = ?auto_31327 ?auto_31326 ) ) ( not ( = ?auto_31324 ?auto_31326 ) ) ( IS-CRATE ?auto_31327 ) ( not ( = ?auto_31328 ?auto_31327 ) ) ( not ( = ?auto_31315 ?auto_31328 ) ) ( not ( = ?auto_31316 ?auto_31328 ) ) ( not ( = ?auto_31324 ?auto_31328 ) ) ( not ( = ?auto_31326 ?auto_31328 ) ) ( AVAILABLE ?auto_31322 ) ( SURFACE-AT ?auto_31327 ?auto_31323 ) ( ON ?auto_31327 ?auto_31318 ) ( CLEAR ?auto_31327 ) ( not ( = ?auto_31315 ?auto_31318 ) ) ( not ( = ?auto_31316 ?auto_31318 ) ) ( not ( = ?auto_31327 ?auto_31318 ) ) ( not ( = ?auto_31324 ?auto_31318 ) ) ( not ( = ?auto_31326 ?auto_31318 ) ) ( not ( = ?auto_31328 ?auto_31318 ) ) ( SURFACE-AT ?auto_31320 ?auto_31321 ) ( CLEAR ?auto_31320 ) ( IS-CRATE ?auto_31328 ) ( not ( = ?auto_31320 ?auto_31328 ) ) ( not ( = ?auto_31315 ?auto_31320 ) ) ( not ( = ?auto_31316 ?auto_31320 ) ) ( not ( = ?auto_31327 ?auto_31320 ) ) ( not ( = ?auto_31324 ?auto_31320 ) ) ( not ( = ?auto_31326 ?auto_31320 ) ) ( not ( = ?auto_31318 ?auto_31320 ) ) ( AVAILABLE ?auto_31325 ) ( TRUCK-AT ?auto_31329 ?auto_31319 ) ( LIFTING ?auto_31317 ?auto_31328 ) )
    :subtasks
    ( ( !LOAD ?auto_31317 ?auto_31328 ?auto_31329 ?auto_31319 )
      ( MAKE-2CRATE ?auto_31327 ?auto_31315 ?auto_31316 )
      ( MAKE-1CRATE-VERIFY ?auto_31315 ?auto_31316 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31330 - SURFACE
      ?auto_31331 - SURFACE
      ?auto_31332 - SURFACE
    )
    :vars
    (
      ?auto_31335 - HOIST
      ?auto_31334 - PLACE
      ?auto_31339 - PLACE
      ?auto_31333 - HOIST
      ?auto_31336 - SURFACE
      ?auto_31340 - PLACE
      ?auto_31344 - HOIST
      ?auto_31341 - SURFACE
      ?auto_31343 - SURFACE
      ?auto_31337 - SURFACE
      ?auto_31338 - SURFACE
      ?auto_31342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31335 ?auto_31334 ) ( IS-CRATE ?auto_31332 ) ( not ( = ?auto_31331 ?auto_31332 ) ) ( not ( = ?auto_31330 ?auto_31331 ) ) ( not ( = ?auto_31330 ?auto_31332 ) ) ( not ( = ?auto_31339 ?auto_31334 ) ) ( HOIST-AT ?auto_31333 ?auto_31339 ) ( not ( = ?auto_31335 ?auto_31333 ) ) ( SURFACE-AT ?auto_31332 ?auto_31339 ) ( ON ?auto_31332 ?auto_31336 ) ( CLEAR ?auto_31332 ) ( not ( = ?auto_31331 ?auto_31336 ) ) ( not ( = ?auto_31332 ?auto_31336 ) ) ( not ( = ?auto_31330 ?auto_31336 ) ) ( IS-CRATE ?auto_31331 ) ( not ( = ?auto_31340 ?auto_31334 ) ) ( not ( = ?auto_31339 ?auto_31340 ) ) ( HOIST-AT ?auto_31344 ?auto_31340 ) ( not ( = ?auto_31335 ?auto_31344 ) ) ( not ( = ?auto_31333 ?auto_31344 ) ) ( SURFACE-AT ?auto_31331 ?auto_31340 ) ( ON ?auto_31331 ?auto_31341 ) ( CLEAR ?auto_31331 ) ( not ( = ?auto_31331 ?auto_31341 ) ) ( not ( = ?auto_31332 ?auto_31341 ) ) ( not ( = ?auto_31330 ?auto_31341 ) ) ( not ( = ?auto_31336 ?auto_31341 ) ) ( IS-CRATE ?auto_31330 ) ( not ( = ?auto_31343 ?auto_31330 ) ) ( not ( = ?auto_31331 ?auto_31343 ) ) ( not ( = ?auto_31332 ?auto_31343 ) ) ( not ( = ?auto_31336 ?auto_31343 ) ) ( not ( = ?auto_31341 ?auto_31343 ) ) ( AVAILABLE ?auto_31344 ) ( SURFACE-AT ?auto_31330 ?auto_31340 ) ( ON ?auto_31330 ?auto_31337 ) ( CLEAR ?auto_31330 ) ( not ( = ?auto_31331 ?auto_31337 ) ) ( not ( = ?auto_31332 ?auto_31337 ) ) ( not ( = ?auto_31330 ?auto_31337 ) ) ( not ( = ?auto_31336 ?auto_31337 ) ) ( not ( = ?auto_31341 ?auto_31337 ) ) ( not ( = ?auto_31343 ?auto_31337 ) ) ( SURFACE-AT ?auto_31338 ?auto_31334 ) ( CLEAR ?auto_31338 ) ( IS-CRATE ?auto_31343 ) ( not ( = ?auto_31338 ?auto_31343 ) ) ( not ( = ?auto_31331 ?auto_31338 ) ) ( not ( = ?auto_31332 ?auto_31338 ) ) ( not ( = ?auto_31330 ?auto_31338 ) ) ( not ( = ?auto_31336 ?auto_31338 ) ) ( not ( = ?auto_31341 ?auto_31338 ) ) ( not ( = ?auto_31337 ?auto_31338 ) ) ( AVAILABLE ?auto_31335 ) ( TRUCK-AT ?auto_31342 ?auto_31339 ) ( LIFTING ?auto_31333 ?auto_31343 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31331 ?auto_31332 )
      ( MAKE-2CRATE-VERIFY ?auto_31330 ?auto_31331 ?auto_31332 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31345 - SURFACE
      ?auto_31346 - SURFACE
      ?auto_31347 - SURFACE
      ?auto_31348 - SURFACE
    )
    :vars
    (
      ?auto_31351 - HOIST
      ?auto_31354 - PLACE
      ?auto_31355 - PLACE
      ?auto_31359 - HOIST
      ?auto_31358 - SURFACE
      ?auto_31356 - PLACE
      ?auto_31357 - HOIST
      ?auto_31349 - SURFACE
      ?auto_31353 - SURFACE
      ?auto_31350 - SURFACE
      ?auto_31352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31351 ?auto_31354 ) ( IS-CRATE ?auto_31348 ) ( not ( = ?auto_31347 ?auto_31348 ) ) ( not ( = ?auto_31346 ?auto_31347 ) ) ( not ( = ?auto_31346 ?auto_31348 ) ) ( not ( = ?auto_31355 ?auto_31354 ) ) ( HOIST-AT ?auto_31359 ?auto_31355 ) ( not ( = ?auto_31351 ?auto_31359 ) ) ( SURFACE-AT ?auto_31348 ?auto_31355 ) ( ON ?auto_31348 ?auto_31358 ) ( CLEAR ?auto_31348 ) ( not ( = ?auto_31347 ?auto_31358 ) ) ( not ( = ?auto_31348 ?auto_31358 ) ) ( not ( = ?auto_31346 ?auto_31358 ) ) ( IS-CRATE ?auto_31347 ) ( not ( = ?auto_31356 ?auto_31354 ) ) ( not ( = ?auto_31355 ?auto_31356 ) ) ( HOIST-AT ?auto_31357 ?auto_31356 ) ( not ( = ?auto_31351 ?auto_31357 ) ) ( not ( = ?auto_31359 ?auto_31357 ) ) ( SURFACE-AT ?auto_31347 ?auto_31356 ) ( ON ?auto_31347 ?auto_31349 ) ( CLEAR ?auto_31347 ) ( not ( = ?auto_31347 ?auto_31349 ) ) ( not ( = ?auto_31348 ?auto_31349 ) ) ( not ( = ?auto_31346 ?auto_31349 ) ) ( not ( = ?auto_31358 ?auto_31349 ) ) ( IS-CRATE ?auto_31346 ) ( not ( = ?auto_31345 ?auto_31346 ) ) ( not ( = ?auto_31347 ?auto_31345 ) ) ( not ( = ?auto_31348 ?auto_31345 ) ) ( not ( = ?auto_31358 ?auto_31345 ) ) ( not ( = ?auto_31349 ?auto_31345 ) ) ( AVAILABLE ?auto_31357 ) ( SURFACE-AT ?auto_31346 ?auto_31356 ) ( ON ?auto_31346 ?auto_31353 ) ( CLEAR ?auto_31346 ) ( not ( = ?auto_31347 ?auto_31353 ) ) ( not ( = ?auto_31348 ?auto_31353 ) ) ( not ( = ?auto_31346 ?auto_31353 ) ) ( not ( = ?auto_31358 ?auto_31353 ) ) ( not ( = ?auto_31349 ?auto_31353 ) ) ( not ( = ?auto_31345 ?auto_31353 ) ) ( SURFACE-AT ?auto_31350 ?auto_31354 ) ( CLEAR ?auto_31350 ) ( IS-CRATE ?auto_31345 ) ( not ( = ?auto_31350 ?auto_31345 ) ) ( not ( = ?auto_31347 ?auto_31350 ) ) ( not ( = ?auto_31348 ?auto_31350 ) ) ( not ( = ?auto_31346 ?auto_31350 ) ) ( not ( = ?auto_31358 ?auto_31350 ) ) ( not ( = ?auto_31349 ?auto_31350 ) ) ( not ( = ?auto_31353 ?auto_31350 ) ) ( AVAILABLE ?auto_31351 ) ( TRUCK-AT ?auto_31352 ?auto_31355 ) ( LIFTING ?auto_31359 ?auto_31345 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31346 ?auto_31347 ?auto_31348 )
      ( MAKE-3CRATE-VERIFY ?auto_31345 ?auto_31346 ?auto_31347 ?auto_31348 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31360 - SURFACE
      ?auto_31361 - SURFACE
      ?auto_31362 - SURFACE
      ?auto_31363 - SURFACE
      ?auto_31364 - SURFACE
    )
    :vars
    (
      ?auto_31366 - HOIST
      ?auto_31369 - PLACE
      ?auto_31370 - PLACE
      ?auto_31374 - HOIST
      ?auto_31373 - SURFACE
      ?auto_31371 - PLACE
      ?auto_31372 - HOIST
      ?auto_31365 - SURFACE
      ?auto_31368 - SURFACE
      ?auto_31367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31366 ?auto_31369 ) ( IS-CRATE ?auto_31364 ) ( not ( = ?auto_31363 ?auto_31364 ) ) ( not ( = ?auto_31362 ?auto_31363 ) ) ( not ( = ?auto_31362 ?auto_31364 ) ) ( not ( = ?auto_31370 ?auto_31369 ) ) ( HOIST-AT ?auto_31374 ?auto_31370 ) ( not ( = ?auto_31366 ?auto_31374 ) ) ( SURFACE-AT ?auto_31364 ?auto_31370 ) ( ON ?auto_31364 ?auto_31373 ) ( CLEAR ?auto_31364 ) ( not ( = ?auto_31363 ?auto_31373 ) ) ( not ( = ?auto_31364 ?auto_31373 ) ) ( not ( = ?auto_31362 ?auto_31373 ) ) ( IS-CRATE ?auto_31363 ) ( not ( = ?auto_31371 ?auto_31369 ) ) ( not ( = ?auto_31370 ?auto_31371 ) ) ( HOIST-AT ?auto_31372 ?auto_31371 ) ( not ( = ?auto_31366 ?auto_31372 ) ) ( not ( = ?auto_31374 ?auto_31372 ) ) ( SURFACE-AT ?auto_31363 ?auto_31371 ) ( ON ?auto_31363 ?auto_31365 ) ( CLEAR ?auto_31363 ) ( not ( = ?auto_31363 ?auto_31365 ) ) ( not ( = ?auto_31364 ?auto_31365 ) ) ( not ( = ?auto_31362 ?auto_31365 ) ) ( not ( = ?auto_31373 ?auto_31365 ) ) ( IS-CRATE ?auto_31362 ) ( not ( = ?auto_31361 ?auto_31362 ) ) ( not ( = ?auto_31363 ?auto_31361 ) ) ( not ( = ?auto_31364 ?auto_31361 ) ) ( not ( = ?auto_31373 ?auto_31361 ) ) ( not ( = ?auto_31365 ?auto_31361 ) ) ( AVAILABLE ?auto_31372 ) ( SURFACE-AT ?auto_31362 ?auto_31371 ) ( ON ?auto_31362 ?auto_31368 ) ( CLEAR ?auto_31362 ) ( not ( = ?auto_31363 ?auto_31368 ) ) ( not ( = ?auto_31364 ?auto_31368 ) ) ( not ( = ?auto_31362 ?auto_31368 ) ) ( not ( = ?auto_31373 ?auto_31368 ) ) ( not ( = ?auto_31365 ?auto_31368 ) ) ( not ( = ?auto_31361 ?auto_31368 ) ) ( SURFACE-AT ?auto_31360 ?auto_31369 ) ( CLEAR ?auto_31360 ) ( IS-CRATE ?auto_31361 ) ( not ( = ?auto_31360 ?auto_31361 ) ) ( not ( = ?auto_31363 ?auto_31360 ) ) ( not ( = ?auto_31364 ?auto_31360 ) ) ( not ( = ?auto_31362 ?auto_31360 ) ) ( not ( = ?auto_31373 ?auto_31360 ) ) ( not ( = ?auto_31365 ?auto_31360 ) ) ( not ( = ?auto_31368 ?auto_31360 ) ) ( AVAILABLE ?auto_31366 ) ( TRUCK-AT ?auto_31367 ?auto_31370 ) ( LIFTING ?auto_31374 ?auto_31361 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31362 ?auto_31363 ?auto_31364 )
      ( MAKE-4CRATE-VERIFY ?auto_31360 ?auto_31361 ?auto_31362 ?auto_31363 ?auto_31364 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31375 - SURFACE
      ?auto_31376 - SURFACE
      ?auto_31377 - SURFACE
      ?auto_31378 - SURFACE
      ?auto_31379 - SURFACE
      ?auto_31380 - SURFACE
    )
    :vars
    (
      ?auto_31382 - HOIST
      ?auto_31385 - PLACE
      ?auto_31386 - PLACE
      ?auto_31390 - HOIST
      ?auto_31389 - SURFACE
      ?auto_31387 - PLACE
      ?auto_31388 - HOIST
      ?auto_31381 - SURFACE
      ?auto_31384 - SURFACE
      ?auto_31383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31382 ?auto_31385 ) ( IS-CRATE ?auto_31380 ) ( not ( = ?auto_31379 ?auto_31380 ) ) ( not ( = ?auto_31378 ?auto_31379 ) ) ( not ( = ?auto_31378 ?auto_31380 ) ) ( not ( = ?auto_31386 ?auto_31385 ) ) ( HOIST-AT ?auto_31390 ?auto_31386 ) ( not ( = ?auto_31382 ?auto_31390 ) ) ( SURFACE-AT ?auto_31380 ?auto_31386 ) ( ON ?auto_31380 ?auto_31389 ) ( CLEAR ?auto_31380 ) ( not ( = ?auto_31379 ?auto_31389 ) ) ( not ( = ?auto_31380 ?auto_31389 ) ) ( not ( = ?auto_31378 ?auto_31389 ) ) ( IS-CRATE ?auto_31379 ) ( not ( = ?auto_31387 ?auto_31385 ) ) ( not ( = ?auto_31386 ?auto_31387 ) ) ( HOIST-AT ?auto_31388 ?auto_31387 ) ( not ( = ?auto_31382 ?auto_31388 ) ) ( not ( = ?auto_31390 ?auto_31388 ) ) ( SURFACE-AT ?auto_31379 ?auto_31387 ) ( ON ?auto_31379 ?auto_31381 ) ( CLEAR ?auto_31379 ) ( not ( = ?auto_31379 ?auto_31381 ) ) ( not ( = ?auto_31380 ?auto_31381 ) ) ( not ( = ?auto_31378 ?auto_31381 ) ) ( not ( = ?auto_31389 ?auto_31381 ) ) ( IS-CRATE ?auto_31378 ) ( not ( = ?auto_31377 ?auto_31378 ) ) ( not ( = ?auto_31379 ?auto_31377 ) ) ( not ( = ?auto_31380 ?auto_31377 ) ) ( not ( = ?auto_31389 ?auto_31377 ) ) ( not ( = ?auto_31381 ?auto_31377 ) ) ( AVAILABLE ?auto_31388 ) ( SURFACE-AT ?auto_31378 ?auto_31387 ) ( ON ?auto_31378 ?auto_31384 ) ( CLEAR ?auto_31378 ) ( not ( = ?auto_31379 ?auto_31384 ) ) ( not ( = ?auto_31380 ?auto_31384 ) ) ( not ( = ?auto_31378 ?auto_31384 ) ) ( not ( = ?auto_31389 ?auto_31384 ) ) ( not ( = ?auto_31381 ?auto_31384 ) ) ( not ( = ?auto_31377 ?auto_31384 ) ) ( SURFACE-AT ?auto_31376 ?auto_31385 ) ( CLEAR ?auto_31376 ) ( IS-CRATE ?auto_31377 ) ( not ( = ?auto_31376 ?auto_31377 ) ) ( not ( = ?auto_31379 ?auto_31376 ) ) ( not ( = ?auto_31380 ?auto_31376 ) ) ( not ( = ?auto_31378 ?auto_31376 ) ) ( not ( = ?auto_31389 ?auto_31376 ) ) ( not ( = ?auto_31381 ?auto_31376 ) ) ( not ( = ?auto_31384 ?auto_31376 ) ) ( AVAILABLE ?auto_31382 ) ( TRUCK-AT ?auto_31383 ?auto_31386 ) ( LIFTING ?auto_31390 ?auto_31377 ) ( ON ?auto_31376 ?auto_31375 ) ( not ( = ?auto_31375 ?auto_31376 ) ) ( not ( = ?auto_31375 ?auto_31377 ) ) ( not ( = ?auto_31375 ?auto_31378 ) ) ( not ( = ?auto_31375 ?auto_31379 ) ) ( not ( = ?auto_31375 ?auto_31380 ) ) ( not ( = ?auto_31375 ?auto_31389 ) ) ( not ( = ?auto_31375 ?auto_31381 ) ) ( not ( = ?auto_31375 ?auto_31384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31378 ?auto_31379 ?auto_31380 )
      ( MAKE-5CRATE-VERIFY ?auto_31375 ?auto_31376 ?auto_31377 ?auto_31378 ?auto_31379 ?auto_31380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31391 - SURFACE
      ?auto_31392 - SURFACE
    )
    :vars
    (
      ?auto_31395 - HOIST
      ?auto_31398 - PLACE
      ?auto_31405 - SURFACE
      ?auto_31399 - PLACE
      ?auto_31404 - HOIST
      ?auto_31403 - SURFACE
      ?auto_31400 - PLACE
      ?auto_31402 - HOIST
      ?auto_31393 - SURFACE
      ?auto_31401 - SURFACE
      ?auto_31397 - SURFACE
      ?auto_31394 - SURFACE
      ?auto_31396 - TRUCK
      ?auto_31406 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31395 ?auto_31398 ) ( IS-CRATE ?auto_31392 ) ( not ( = ?auto_31391 ?auto_31392 ) ) ( not ( = ?auto_31405 ?auto_31391 ) ) ( not ( = ?auto_31405 ?auto_31392 ) ) ( not ( = ?auto_31399 ?auto_31398 ) ) ( HOIST-AT ?auto_31404 ?auto_31399 ) ( not ( = ?auto_31395 ?auto_31404 ) ) ( SURFACE-AT ?auto_31392 ?auto_31399 ) ( ON ?auto_31392 ?auto_31403 ) ( CLEAR ?auto_31392 ) ( not ( = ?auto_31391 ?auto_31403 ) ) ( not ( = ?auto_31392 ?auto_31403 ) ) ( not ( = ?auto_31405 ?auto_31403 ) ) ( IS-CRATE ?auto_31391 ) ( not ( = ?auto_31400 ?auto_31398 ) ) ( not ( = ?auto_31399 ?auto_31400 ) ) ( HOIST-AT ?auto_31402 ?auto_31400 ) ( not ( = ?auto_31395 ?auto_31402 ) ) ( not ( = ?auto_31404 ?auto_31402 ) ) ( SURFACE-AT ?auto_31391 ?auto_31400 ) ( ON ?auto_31391 ?auto_31393 ) ( CLEAR ?auto_31391 ) ( not ( = ?auto_31391 ?auto_31393 ) ) ( not ( = ?auto_31392 ?auto_31393 ) ) ( not ( = ?auto_31405 ?auto_31393 ) ) ( not ( = ?auto_31403 ?auto_31393 ) ) ( IS-CRATE ?auto_31405 ) ( not ( = ?auto_31401 ?auto_31405 ) ) ( not ( = ?auto_31391 ?auto_31401 ) ) ( not ( = ?auto_31392 ?auto_31401 ) ) ( not ( = ?auto_31403 ?auto_31401 ) ) ( not ( = ?auto_31393 ?auto_31401 ) ) ( AVAILABLE ?auto_31402 ) ( SURFACE-AT ?auto_31405 ?auto_31400 ) ( ON ?auto_31405 ?auto_31397 ) ( CLEAR ?auto_31405 ) ( not ( = ?auto_31391 ?auto_31397 ) ) ( not ( = ?auto_31392 ?auto_31397 ) ) ( not ( = ?auto_31405 ?auto_31397 ) ) ( not ( = ?auto_31403 ?auto_31397 ) ) ( not ( = ?auto_31393 ?auto_31397 ) ) ( not ( = ?auto_31401 ?auto_31397 ) ) ( SURFACE-AT ?auto_31394 ?auto_31398 ) ( CLEAR ?auto_31394 ) ( IS-CRATE ?auto_31401 ) ( not ( = ?auto_31394 ?auto_31401 ) ) ( not ( = ?auto_31391 ?auto_31394 ) ) ( not ( = ?auto_31392 ?auto_31394 ) ) ( not ( = ?auto_31405 ?auto_31394 ) ) ( not ( = ?auto_31403 ?auto_31394 ) ) ( not ( = ?auto_31393 ?auto_31394 ) ) ( not ( = ?auto_31397 ?auto_31394 ) ) ( AVAILABLE ?auto_31395 ) ( TRUCK-AT ?auto_31396 ?auto_31399 ) ( AVAILABLE ?auto_31404 ) ( SURFACE-AT ?auto_31401 ?auto_31399 ) ( ON ?auto_31401 ?auto_31406 ) ( CLEAR ?auto_31401 ) ( not ( = ?auto_31391 ?auto_31406 ) ) ( not ( = ?auto_31392 ?auto_31406 ) ) ( not ( = ?auto_31405 ?auto_31406 ) ) ( not ( = ?auto_31403 ?auto_31406 ) ) ( not ( = ?auto_31393 ?auto_31406 ) ) ( not ( = ?auto_31401 ?auto_31406 ) ) ( not ( = ?auto_31397 ?auto_31406 ) ) ( not ( = ?auto_31394 ?auto_31406 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31404 ?auto_31401 ?auto_31406 ?auto_31399 )
      ( MAKE-2CRATE ?auto_31405 ?auto_31391 ?auto_31392 )
      ( MAKE-1CRATE-VERIFY ?auto_31391 ?auto_31392 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31407 - SURFACE
      ?auto_31408 - SURFACE
      ?auto_31409 - SURFACE
    )
    :vars
    (
      ?auto_31412 - HOIST
      ?auto_31416 - PLACE
      ?auto_31418 - PLACE
      ?auto_31410 - HOIST
      ?auto_31415 - SURFACE
      ?auto_31414 - PLACE
      ?auto_31417 - HOIST
      ?auto_31422 - SURFACE
      ?auto_31420 - SURFACE
      ?auto_31411 - SURFACE
      ?auto_31421 - SURFACE
      ?auto_31413 - TRUCK
      ?auto_31419 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31412 ?auto_31416 ) ( IS-CRATE ?auto_31409 ) ( not ( = ?auto_31408 ?auto_31409 ) ) ( not ( = ?auto_31407 ?auto_31408 ) ) ( not ( = ?auto_31407 ?auto_31409 ) ) ( not ( = ?auto_31418 ?auto_31416 ) ) ( HOIST-AT ?auto_31410 ?auto_31418 ) ( not ( = ?auto_31412 ?auto_31410 ) ) ( SURFACE-AT ?auto_31409 ?auto_31418 ) ( ON ?auto_31409 ?auto_31415 ) ( CLEAR ?auto_31409 ) ( not ( = ?auto_31408 ?auto_31415 ) ) ( not ( = ?auto_31409 ?auto_31415 ) ) ( not ( = ?auto_31407 ?auto_31415 ) ) ( IS-CRATE ?auto_31408 ) ( not ( = ?auto_31414 ?auto_31416 ) ) ( not ( = ?auto_31418 ?auto_31414 ) ) ( HOIST-AT ?auto_31417 ?auto_31414 ) ( not ( = ?auto_31412 ?auto_31417 ) ) ( not ( = ?auto_31410 ?auto_31417 ) ) ( SURFACE-AT ?auto_31408 ?auto_31414 ) ( ON ?auto_31408 ?auto_31422 ) ( CLEAR ?auto_31408 ) ( not ( = ?auto_31408 ?auto_31422 ) ) ( not ( = ?auto_31409 ?auto_31422 ) ) ( not ( = ?auto_31407 ?auto_31422 ) ) ( not ( = ?auto_31415 ?auto_31422 ) ) ( IS-CRATE ?auto_31407 ) ( not ( = ?auto_31420 ?auto_31407 ) ) ( not ( = ?auto_31408 ?auto_31420 ) ) ( not ( = ?auto_31409 ?auto_31420 ) ) ( not ( = ?auto_31415 ?auto_31420 ) ) ( not ( = ?auto_31422 ?auto_31420 ) ) ( AVAILABLE ?auto_31417 ) ( SURFACE-AT ?auto_31407 ?auto_31414 ) ( ON ?auto_31407 ?auto_31411 ) ( CLEAR ?auto_31407 ) ( not ( = ?auto_31408 ?auto_31411 ) ) ( not ( = ?auto_31409 ?auto_31411 ) ) ( not ( = ?auto_31407 ?auto_31411 ) ) ( not ( = ?auto_31415 ?auto_31411 ) ) ( not ( = ?auto_31422 ?auto_31411 ) ) ( not ( = ?auto_31420 ?auto_31411 ) ) ( SURFACE-AT ?auto_31421 ?auto_31416 ) ( CLEAR ?auto_31421 ) ( IS-CRATE ?auto_31420 ) ( not ( = ?auto_31421 ?auto_31420 ) ) ( not ( = ?auto_31408 ?auto_31421 ) ) ( not ( = ?auto_31409 ?auto_31421 ) ) ( not ( = ?auto_31407 ?auto_31421 ) ) ( not ( = ?auto_31415 ?auto_31421 ) ) ( not ( = ?auto_31422 ?auto_31421 ) ) ( not ( = ?auto_31411 ?auto_31421 ) ) ( AVAILABLE ?auto_31412 ) ( TRUCK-AT ?auto_31413 ?auto_31418 ) ( AVAILABLE ?auto_31410 ) ( SURFACE-AT ?auto_31420 ?auto_31418 ) ( ON ?auto_31420 ?auto_31419 ) ( CLEAR ?auto_31420 ) ( not ( = ?auto_31408 ?auto_31419 ) ) ( not ( = ?auto_31409 ?auto_31419 ) ) ( not ( = ?auto_31407 ?auto_31419 ) ) ( not ( = ?auto_31415 ?auto_31419 ) ) ( not ( = ?auto_31422 ?auto_31419 ) ) ( not ( = ?auto_31420 ?auto_31419 ) ) ( not ( = ?auto_31411 ?auto_31419 ) ) ( not ( = ?auto_31421 ?auto_31419 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31408 ?auto_31409 )
      ( MAKE-2CRATE-VERIFY ?auto_31407 ?auto_31408 ?auto_31409 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31423 - SURFACE
      ?auto_31424 - SURFACE
      ?auto_31425 - SURFACE
      ?auto_31426 - SURFACE
    )
    :vars
    (
      ?auto_31432 - HOIST
      ?auto_31435 - PLACE
      ?auto_31434 - PLACE
      ?auto_31436 - HOIST
      ?auto_31430 - SURFACE
      ?auto_31431 - PLACE
      ?auto_31429 - HOIST
      ?auto_31427 - SURFACE
      ?auto_31438 - SURFACE
      ?auto_31437 - SURFACE
      ?auto_31428 - TRUCK
      ?auto_31433 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31432 ?auto_31435 ) ( IS-CRATE ?auto_31426 ) ( not ( = ?auto_31425 ?auto_31426 ) ) ( not ( = ?auto_31424 ?auto_31425 ) ) ( not ( = ?auto_31424 ?auto_31426 ) ) ( not ( = ?auto_31434 ?auto_31435 ) ) ( HOIST-AT ?auto_31436 ?auto_31434 ) ( not ( = ?auto_31432 ?auto_31436 ) ) ( SURFACE-AT ?auto_31426 ?auto_31434 ) ( ON ?auto_31426 ?auto_31430 ) ( CLEAR ?auto_31426 ) ( not ( = ?auto_31425 ?auto_31430 ) ) ( not ( = ?auto_31426 ?auto_31430 ) ) ( not ( = ?auto_31424 ?auto_31430 ) ) ( IS-CRATE ?auto_31425 ) ( not ( = ?auto_31431 ?auto_31435 ) ) ( not ( = ?auto_31434 ?auto_31431 ) ) ( HOIST-AT ?auto_31429 ?auto_31431 ) ( not ( = ?auto_31432 ?auto_31429 ) ) ( not ( = ?auto_31436 ?auto_31429 ) ) ( SURFACE-AT ?auto_31425 ?auto_31431 ) ( ON ?auto_31425 ?auto_31427 ) ( CLEAR ?auto_31425 ) ( not ( = ?auto_31425 ?auto_31427 ) ) ( not ( = ?auto_31426 ?auto_31427 ) ) ( not ( = ?auto_31424 ?auto_31427 ) ) ( not ( = ?auto_31430 ?auto_31427 ) ) ( IS-CRATE ?auto_31424 ) ( not ( = ?auto_31423 ?auto_31424 ) ) ( not ( = ?auto_31425 ?auto_31423 ) ) ( not ( = ?auto_31426 ?auto_31423 ) ) ( not ( = ?auto_31430 ?auto_31423 ) ) ( not ( = ?auto_31427 ?auto_31423 ) ) ( AVAILABLE ?auto_31429 ) ( SURFACE-AT ?auto_31424 ?auto_31431 ) ( ON ?auto_31424 ?auto_31438 ) ( CLEAR ?auto_31424 ) ( not ( = ?auto_31425 ?auto_31438 ) ) ( not ( = ?auto_31426 ?auto_31438 ) ) ( not ( = ?auto_31424 ?auto_31438 ) ) ( not ( = ?auto_31430 ?auto_31438 ) ) ( not ( = ?auto_31427 ?auto_31438 ) ) ( not ( = ?auto_31423 ?auto_31438 ) ) ( SURFACE-AT ?auto_31437 ?auto_31435 ) ( CLEAR ?auto_31437 ) ( IS-CRATE ?auto_31423 ) ( not ( = ?auto_31437 ?auto_31423 ) ) ( not ( = ?auto_31425 ?auto_31437 ) ) ( not ( = ?auto_31426 ?auto_31437 ) ) ( not ( = ?auto_31424 ?auto_31437 ) ) ( not ( = ?auto_31430 ?auto_31437 ) ) ( not ( = ?auto_31427 ?auto_31437 ) ) ( not ( = ?auto_31438 ?auto_31437 ) ) ( AVAILABLE ?auto_31432 ) ( TRUCK-AT ?auto_31428 ?auto_31434 ) ( AVAILABLE ?auto_31436 ) ( SURFACE-AT ?auto_31423 ?auto_31434 ) ( ON ?auto_31423 ?auto_31433 ) ( CLEAR ?auto_31423 ) ( not ( = ?auto_31425 ?auto_31433 ) ) ( not ( = ?auto_31426 ?auto_31433 ) ) ( not ( = ?auto_31424 ?auto_31433 ) ) ( not ( = ?auto_31430 ?auto_31433 ) ) ( not ( = ?auto_31427 ?auto_31433 ) ) ( not ( = ?auto_31423 ?auto_31433 ) ) ( not ( = ?auto_31438 ?auto_31433 ) ) ( not ( = ?auto_31437 ?auto_31433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31424 ?auto_31425 ?auto_31426 )
      ( MAKE-3CRATE-VERIFY ?auto_31423 ?auto_31424 ?auto_31425 ?auto_31426 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31439 - SURFACE
      ?auto_31440 - SURFACE
      ?auto_31441 - SURFACE
      ?auto_31442 - SURFACE
      ?auto_31443 - SURFACE
    )
    :vars
    (
      ?auto_31449 - HOIST
      ?auto_31452 - PLACE
      ?auto_31451 - PLACE
      ?auto_31453 - HOIST
      ?auto_31447 - SURFACE
      ?auto_31448 - PLACE
      ?auto_31446 - HOIST
      ?auto_31444 - SURFACE
      ?auto_31454 - SURFACE
      ?auto_31445 - TRUCK
      ?auto_31450 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31449 ?auto_31452 ) ( IS-CRATE ?auto_31443 ) ( not ( = ?auto_31442 ?auto_31443 ) ) ( not ( = ?auto_31441 ?auto_31442 ) ) ( not ( = ?auto_31441 ?auto_31443 ) ) ( not ( = ?auto_31451 ?auto_31452 ) ) ( HOIST-AT ?auto_31453 ?auto_31451 ) ( not ( = ?auto_31449 ?auto_31453 ) ) ( SURFACE-AT ?auto_31443 ?auto_31451 ) ( ON ?auto_31443 ?auto_31447 ) ( CLEAR ?auto_31443 ) ( not ( = ?auto_31442 ?auto_31447 ) ) ( not ( = ?auto_31443 ?auto_31447 ) ) ( not ( = ?auto_31441 ?auto_31447 ) ) ( IS-CRATE ?auto_31442 ) ( not ( = ?auto_31448 ?auto_31452 ) ) ( not ( = ?auto_31451 ?auto_31448 ) ) ( HOIST-AT ?auto_31446 ?auto_31448 ) ( not ( = ?auto_31449 ?auto_31446 ) ) ( not ( = ?auto_31453 ?auto_31446 ) ) ( SURFACE-AT ?auto_31442 ?auto_31448 ) ( ON ?auto_31442 ?auto_31444 ) ( CLEAR ?auto_31442 ) ( not ( = ?auto_31442 ?auto_31444 ) ) ( not ( = ?auto_31443 ?auto_31444 ) ) ( not ( = ?auto_31441 ?auto_31444 ) ) ( not ( = ?auto_31447 ?auto_31444 ) ) ( IS-CRATE ?auto_31441 ) ( not ( = ?auto_31440 ?auto_31441 ) ) ( not ( = ?auto_31442 ?auto_31440 ) ) ( not ( = ?auto_31443 ?auto_31440 ) ) ( not ( = ?auto_31447 ?auto_31440 ) ) ( not ( = ?auto_31444 ?auto_31440 ) ) ( AVAILABLE ?auto_31446 ) ( SURFACE-AT ?auto_31441 ?auto_31448 ) ( ON ?auto_31441 ?auto_31454 ) ( CLEAR ?auto_31441 ) ( not ( = ?auto_31442 ?auto_31454 ) ) ( not ( = ?auto_31443 ?auto_31454 ) ) ( not ( = ?auto_31441 ?auto_31454 ) ) ( not ( = ?auto_31447 ?auto_31454 ) ) ( not ( = ?auto_31444 ?auto_31454 ) ) ( not ( = ?auto_31440 ?auto_31454 ) ) ( SURFACE-AT ?auto_31439 ?auto_31452 ) ( CLEAR ?auto_31439 ) ( IS-CRATE ?auto_31440 ) ( not ( = ?auto_31439 ?auto_31440 ) ) ( not ( = ?auto_31442 ?auto_31439 ) ) ( not ( = ?auto_31443 ?auto_31439 ) ) ( not ( = ?auto_31441 ?auto_31439 ) ) ( not ( = ?auto_31447 ?auto_31439 ) ) ( not ( = ?auto_31444 ?auto_31439 ) ) ( not ( = ?auto_31454 ?auto_31439 ) ) ( AVAILABLE ?auto_31449 ) ( TRUCK-AT ?auto_31445 ?auto_31451 ) ( AVAILABLE ?auto_31453 ) ( SURFACE-AT ?auto_31440 ?auto_31451 ) ( ON ?auto_31440 ?auto_31450 ) ( CLEAR ?auto_31440 ) ( not ( = ?auto_31442 ?auto_31450 ) ) ( not ( = ?auto_31443 ?auto_31450 ) ) ( not ( = ?auto_31441 ?auto_31450 ) ) ( not ( = ?auto_31447 ?auto_31450 ) ) ( not ( = ?auto_31444 ?auto_31450 ) ) ( not ( = ?auto_31440 ?auto_31450 ) ) ( not ( = ?auto_31454 ?auto_31450 ) ) ( not ( = ?auto_31439 ?auto_31450 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31441 ?auto_31442 ?auto_31443 )
      ( MAKE-4CRATE-VERIFY ?auto_31439 ?auto_31440 ?auto_31441 ?auto_31442 ?auto_31443 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31455 - SURFACE
      ?auto_31456 - SURFACE
      ?auto_31457 - SURFACE
      ?auto_31458 - SURFACE
      ?auto_31459 - SURFACE
      ?auto_31460 - SURFACE
    )
    :vars
    (
      ?auto_31466 - HOIST
      ?auto_31469 - PLACE
      ?auto_31468 - PLACE
      ?auto_31470 - HOIST
      ?auto_31464 - SURFACE
      ?auto_31465 - PLACE
      ?auto_31463 - HOIST
      ?auto_31461 - SURFACE
      ?auto_31471 - SURFACE
      ?auto_31462 - TRUCK
      ?auto_31467 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31466 ?auto_31469 ) ( IS-CRATE ?auto_31460 ) ( not ( = ?auto_31459 ?auto_31460 ) ) ( not ( = ?auto_31458 ?auto_31459 ) ) ( not ( = ?auto_31458 ?auto_31460 ) ) ( not ( = ?auto_31468 ?auto_31469 ) ) ( HOIST-AT ?auto_31470 ?auto_31468 ) ( not ( = ?auto_31466 ?auto_31470 ) ) ( SURFACE-AT ?auto_31460 ?auto_31468 ) ( ON ?auto_31460 ?auto_31464 ) ( CLEAR ?auto_31460 ) ( not ( = ?auto_31459 ?auto_31464 ) ) ( not ( = ?auto_31460 ?auto_31464 ) ) ( not ( = ?auto_31458 ?auto_31464 ) ) ( IS-CRATE ?auto_31459 ) ( not ( = ?auto_31465 ?auto_31469 ) ) ( not ( = ?auto_31468 ?auto_31465 ) ) ( HOIST-AT ?auto_31463 ?auto_31465 ) ( not ( = ?auto_31466 ?auto_31463 ) ) ( not ( = ?auto_31470 ?auto_31463 ) ) ( SURFACE-AT ?auto_31459 ?auto_31465 ) ( ON ?auto_31459 ?auto_31461 ) ( CLEAR ?auto_31459 ) ( not ( = ?auto_31459 ?auto_31461 ) ) ( not ( = ?auto_31460 ?auto_31461 ) ) ( not ( = ?auto_31458 ?auto_31461 ) ) ( not ( = ?auto_31464 ?auto_31461 ) ) ( IS-CRATE ?auto_31458 ) ( not ( = ?auto_31457 ?auto_31458 ) ) ( not ( = ?auto_31459 ?auto_31457 ) ) ( not ( = ?auto_31460 ?auto_31457 ) ) ( not ( = ?auto_31464 ?auto_31457 ) ) ( not ( = ?auto_31461 ?auto_31457 ) ) ( AVAILABLE ?auto_31463 ) ( SURFACE-AT ?auto_31458 ?auto_31465 ) ( ON ?auto_31458 ?auto_31471 ) ( CLEAR ?auto_31458 ) ( not ( = ?auto_31459 ?auto_31471 ) ) ( not ( = ?auto_31460 ?auto_31471 ) ) ( not ( = ?auto_31458 ?auto_31471 ) ) ( not ( = ?auto_31464 ?auto_31471 ) ) ( not ( = ?auto_31461 ?auto_31471 ) ) ( not ( = ?auto_31457 ?auto_31471 ) ) ( SURFACE-AT ?auto_31456 ?auto_31469 ) ( CLEAR ?auto_31456 ) ( IS-CRATE ?auto_31457 ) ( not ( = ?auto_31456 ?auto_31457 ) ) ( not ( = ?auto_31459 ?auto_31456 ) ) ( not ( = ?auto_31460 ?auto_31456 ) ) ( not ( = ?auto_31458 ?auto_31456 ) ) ( not ( = ?auto_31464 ?auto_31456 ) ) ( not ( = ?auto_31461 ?auto_31456 ) ) ( not ( = ?auto_31471 ?auto_31456 ) ) ( AVAILABLE ?auto_31466 ) ( TRUCK-AT ?auto_31462 ?auto_31468 ) ( AVAILABLE ?auto_31470 ) ( SURFACE-AT ?auto_31457 ?auto_31468 ) ( ON ?auto_31457 ?auto_31467 ) ( CLEAR ?auto_31457 ) ( not ( = ?auto_31459 ?auto_31467 ) ) ( not ( = ?auto_31460 ?auto_31467 ) ) ( not ( = ?auto_31458 ?auto_31467 ) ) ( not ( = ?auto_31464 ?auto_31467 ) ) ( not ( = ?auto_31461 ?auto_31467 ) ) ( not ( = ?auto_31457 ?auto_31467 ) ) ( not ( = ?auto_31471 ?auto_31467 ) ) ( not ( = ?auto_31456 ?auto_31467 ) ) ( ON ?auto_31456 ?auto_31455 ) ( not ( = ?auto_31455 ?auto_31456 ) ) ( not ( = ?auto_31455 ?auto_31457 ) ) ( not ( = ?auto_31455 ?auto_31458 ) ) ( not ( = ?auto_31455 ?auto_31459 ) ) ( not ( = ?auto_31455 ?auto_31460 ) ) ( not ( = ?auto_31455 ?auto_31464 ) ) ( not ( = ?auto_31455 ?auto_31461 ) ) ( not ( = ?auto_31455 ?auto_31471 ) ) ( not ( = ?auto_31455 ?auto_31467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31458 ?auto_31459 ?auto_31460 )
      ( MAKE-5CRATE-VERIFY ?auto_31455 ?auto_31456 ?auto_31457 ?auto_31458 ?auto_31459 ?auto_31460 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31472 - SURFACE
      ?auto_31473 - SURFACE
    )
    :vars
    (
      ?auto_31479 - HOIST
      ?auto_31482 - PLACE
      ?auto_31483 - SURFACE
      ?auto_31481 - PLACE
      ?auto_31484 - HOIST
      ?auto_31477 - SURFACE
      ?auto_31478 - PLACE
      ?auto_31476 - HOIST
      ?auto_31474 - SURFACE
      ?auto_31486 - SURFACE
      ?auto_31487 - SURFACE
      ?auto_31485 - SURFACE
      ?auto_31480 - SURFACE
      ?auto_31475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31479 ?auto_31482 ) ( IS-CRATE ?auto_31473 ) ( not ( = ?auto_31472 ?auto_31473 ) ) ( not ( = ?auto_31483 ?auto_31472 ) ) ( not ( = ?auto_31483 ?auto_31473 ) ) ( not ( = ?auto_31481 ?auto_31482 ) ) ( HOIST-AT ?auto_31484 ?auto_31481 ) ( not ( = ?auto_31479 ?auto_31484 ) ) ( SURFACE-AT ?auto_31473 ?auto_31481 ) ( ON ?auto_31473 ?auto_31477 ) ( CLEAR ?auto_31473 ) ( not ( = ?auto_31472 ?auto_31477 ) ) ( not ( = ?auto_31473 ?auto_31477 ) ) ( not ( = ?auto_31483 ?auto_31477 ) ) ( IS-CRATE ?auto_31472 ) ( not ( = ?auto_31478 ?auto_31482 ) ) ( not ( = ?auto_31481 ?auto_31478 ) ) ( HOIST-AT ?auto_31476 ?auto_31478 ) ( not ( = ?auto_31479 ?auto_31476 ) ) ( not ( = ?auto_31484 ?auto_31476 ) ) ( SURFACE-AT ?auto_31472 ?auto_31478 ) ( ON ?auto_31472 ?auto_31474 ) ( CLEAR ?auto_31472 ) ( not ( = ?auto_31472 ?auto_31474 ) ) ( not ( = ?auto_31473 ?auto_31474 ) ) ( not ( = ?auto_31483 ?auto_31474 ) ) ( not ( = ?auto_31477 ?auto_31474 ) ) ( IS-CRATE ?auto_31483 ) ( not ( = ?auto_31486 ?auto_31483 ) ) ( not ( = ?auto_31472 ?auto_31486 ) ) ( not ( = ?auto_31473 ?auto_31486 ) ) ( not ( = ?auto_31477 ?auto_31486 ) ) ( not ( = ?auto_31474 ?auto_31486 ) ) ( AVAILABLE ?auto_31476 ) ( SURFACE-AT ?auto_31483 ?auto_31478 ) ( ON ?auto_31483 ?auto_31487 ) ( CLEAR ?auto_31483 ) ( not ( = ?auto_31472 ?auto_31487 ) ) ( not ( = ?auto_31473 ?auto_31487 ) ) ( not ( = ?auto_31483 ?auto_31487 ) ) ( not ( = ?auto_31477 ?auto_31487 ) ) ( not ( = ?auto_31474 ?auto_31487 ) ) ( not ( = ?auto_31486 ?auto_31487 ) ) ( SURFACE-AT ?auto_31485 ?auto_31482 ) ( CLEAR ?auto_31485 ) ( IS-CRATE ?auto_31486 ) ( not ( = ?auto_31485 ?auto_31486 ) ) ( not ( = ?auto_31472 ?auto_31485 ) ) ( not ( = ?auto_31473 ?auto_31485 ) ) ( not ( = ?auto_31483 ?auto_31485 ) ) ( not ( = ?auto_31477 ?auto_31485 ) ) ( not ( = ?auto_31474 ?auto_31485 ) ) ( not ( = ?auto_31487 ?auto_31485 ) ) ( AVAILABLE ?auto_31479 ) ( AVAILABLE ?auto_31484 ) ( SURFACE-AT ?auto_31486 ?auto_31481 ) ( ON ?auto_31486 ?auto_31480 ) ( CLEAR ?auto_31486 ) ( not ( = ?auto_31472 ?auto_31480 ) ) ( not ( = ?auto_31473 ?auto_31480 ) ) ( not ( = ?auto_31483 ?auto_31480 ) ) ( not ( = ?auto_31477 ?auto_31480 ) ) ( not ( = ?auto_31474 ?auto_31480 ) ) ( not ( = ?auto_31486 ?auto_31480 ) ) ( not ( = ?auto_31487 ?auto_31480 ) ) ( not ( = ?auto_31485 ?auto_31480 ) ) ( TRUCK-AT ?auto_31475 ?auto_31482 ) )
    :subtasks
    ( ( !DRIVE ?auto_31475 ?auto_31482 ?auto_31481 )
      ( MAKE-2CRATE ?auto_31483 ?auto_31472 ?auto_31473 )
      ( MAKE-1CRATE-VERIFY ?auto_31472 ?auto_31473 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31488 - SURFACE
      ?auto_31489 - SURFACE
      ?auto_31490 - SURFACE
    )
    :vars
    (
      ?auto_31498 - HOIST
      ?auto_31495 - PLACE
      ?auto_31503 - PLACE
      ?auto_31497 - HOIST
      ?auto_31491 - SURFACE
      ?auto_31499 - PLACE
      ?auto_31492 - HOIST
      ?auto_31494 - SURFACE
      ?auto_31501 - SURFACE
      ?auto_31493 - SURFACE
      ?auto_31500 - SURFACE
      ?auto_31502 - SURFACE
      ?auto_31496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31498 ?auto_31495 ) ( IS-CRATE ?auto_31490 ) ( not ( = ?auto_31489 ?auto_31490 ) ) ( not ( = ?auto_31488 ?auto_31489 ) ) ( not ( = ?auto_31488 ?auto_31490 ) ) ( not ( = ?auto_31503 ?auto_31495 ) ) ( HOIST-AT ?auto_31497 ?auto_31503 ) ( not ( = ?auto_31498 ?auto_31497 ) ) ( SURFACE-AT ?auto_31490 ?auto_31503 ) ( ON ?auto_31490 ?auto_31491 ) ( CLEAR ?auto_31490 ) ( not ( = ?auto_31489 ?auto_31491 ) ) ( not ( = ?auto_31490 ?auto_31491 ) ) ( not ( = ?auto_31488 ?auto_31491 ) ) ( IS-CRATE ?auto_31489 ) ( not ( = ?auto_31499 ?auto_31495 ) ) ( not ( = ?auto_31503 ?auto_31499 ) ) ( HOIST-AT ?auto_31492 ?auto_31499 ) ( not ( = ?auto_31498 ?auto_31492 ) ) ( not ( = ?auto_31497 ?auto_31492 ) ) ( SURFACE-AT ?auto_31489 ?auto_31499 ) ( ON ?auto_31489 ?auto_31494 ) ( CLEAR ?auto_31489 ) ( not ( = ?auto_31489 ?auto_31494 ) ) ( not ( = ?auto_31490 ?auto_31494 ) ) ( not ( = ?auto_31488 ?auto_31494 ) ) ( not ( = ?auto_31491 ?auto_31494 ) ) ( IS-CRATE ?auto_31488 ) ( not ( = ?auto_31501 ?auto_31488 ) ) ( not ( = ?auto_31489 ?auto_31501 ) ) ( not ( = ?auto_31490 ?auto_31501 ) ) ( not ( = ?auto_31491 ?auto_31501 ) ) ( not ( = ?auto_31494 ?auto_31501 ) ) ( AVAILABLE ?auto_31492 ) ( SURFACE-AT ?auto_31488 ?auto_31499 ) ( ON ?auto_31488 ?auto_31493 ) ( CLEAR ?auto_31488 ) ( not ( = ?auto_31489 ?auto_31493 ) ) ( not ( = ?auto_31490 ?auto_31493 ) ) ( not ( = ?auto_31488 ?auto_31493 ) ) ( not ( = ?auto_31491 ?auto_31493 ) ) ( not ( = ?auto_31494 ?auto_31493 ) ) ( not ( = ?auto_31501 ?auto_31493 ) ) ( SURFACE-AT ?auto_31500 ?auto_31495 ) ( CLEAR ?auto_31500 ) ( IS-CRATE ?auto_31501 ) ( not ( = ?auto_31500 ?auto_31501 ) ) ( not ( = ?auto_31489 ?auto_31500 ) ) ( not ( = ?auto_31490 ?auto_31500 ) ) ( not ( = ?auto_31488 ?auto_31500 ) ) ( not ( = ?auto_31491 ?auto_31500 ) ) ( not ( = ?auto_31494 ?auto_31500 ) ) ( not ( = ?auto_31493 ?auto_31500 ) ) ( AVAILABLE ?auto_31498 ) ( AVAILABLE ?auto_31497 ) ( SURFACE-AT ?auto_31501 ?auto_31503 ) ( ON ?auto_31501 ?auto_31502 ) ( CLEAR ?auto_31501 ) ( not ( = ?auto_31489 ?auto_31502 ) ) ( not ( = ?auto_31490 ?auto_31502 ) ) ( not ( = ?auto_31488 ?auto_31502 ) ) ( not ( = ?auto_31491 ?auto_31502 ) ) ( not ( = ?auto_31494 ?auto_31502 ) ) ( not ( = ?auto_31501 ?auto_31502 ) ) ( not ( = ?auto_31493 ?auto_31502 ) ) ( not ( = ?auto_31500 ?auto_31502 ) ) ( TRUCK-AT ?auto_31496 ?auto_31495 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31489 ?auto_31490 )
      ( MAKE-2CRATE-VERIFY ?auto_31488 ?auto_31489 ?auto_31490 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31504 - SURFACE
      ?auto_31505 - SURFACE
      ?auto_31506 - SURFACE
      ?auto_31507 - SURFACE
    )
    :vars
    (
      ?auto_31511 - HOIST
      ?auto_31515 - PLACE
      ?auto_31516 - PLACE
      ?auto_31512 - HOIST
      ?auto_31517 - SURFACE
      ?auto_31508 - PLACE
      ?auto_31513 - HOIST
      ?auto_31519 - SURFACE
      ?auto_31514 - SURFACE
      ?auto_31509 - SURFACE
      ?auto_31510 - SURFACE
      ?auto_31518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31511 ?auto_31515 ) ( IS-CRATE ?auto_31507 ) ( not ( = ?auto_31506 ?auto_31507 ) ) ( not ( = ?auto_31505 ?auto_31506 ) ) ( not ( = ?auto_31505 ?auto_31507 ) ) ( not ( = ?auto_31516 ?auto_31515 ) ) ( HOIST-AT ?auto_31512 ?auto_31516 ) ( not ( = ?auto_31511 ?auto_31512 ) ) ( SURFACE-AT ?auto_31507 ?auto_31516 ) ( ON ?auto_31507 ?auto_31517 ) ( CLEAR ?auto_31507 ) ( not ( = ?auto_31506 ?auto_31517 ) ) ( not ( = ?auto_31507 ?auto_31517 ) ) ( not ( = ?auto_31505 ?auto_31517 ) ) ( IS-CRATE ?auto_31506 ) ( not ( = ?auto_31508 ?auto_31515 ) ) ( not ( = ?auto_31516 ?auto_31508 ) ) ( HOIST-AT ?auto_31513 ?auto_31508 ) ( not ( = ?auto_31511 ?auto_31513 ) ) ( not ( = ?auto_31512 ?auto_31513 ) ) ( SURFACE-AT ?auto_31506 ?auto_31508 ) ( ON ?auto_31506 ?auto_31519 ) ( CLEAR ?auto_31506 ) ( not ( = ?auto_31506 ?auto_31519 ) ) ( not ( = ?auto_31507 ?auto_31519 ) ) ( not ( = ?auto_31505 ?auto_31519 ) ) ( not ( = ?auto_31517 ?auto_31519 ) ) ( IS-CRATE ?auto_31505 ) ( not ( = ?auto_31504 ?auto_31505 ) ) ( not ( = ?auto_31506 ?auto_31504 ) ) ( not ( = ?auto_31507 ?auto_31504 ) ) ( not ( = ?auto_31517 ?auto_31504 ) ) ( not ( = ?auto_31519 ?auto_31504 ) ) ( AVAILABLE ?auto_31513 ) ( SURFACE-AT ?auto_31505 ?auto_31508 ) ( ON ?auto_31505 ?auto_31514 ) ( CLEAR ?auto_31505 ) ( not ( = ?auto_31506 ?auto_31514 ) ) ( not ( = ?auto_31507 ?auto_31514 ) ) ( not ( = ?auto_31505 ?auto_31514 ) ) ( not ( = ?auto_31517 ?auto_31514 ) ) ( not ( = ?auto_31519 ?auto_31514 ) ) ( not ( = ?auto_31504 ?auto_31514 ) ) ( SURFACE-AT ?auto_31509 ?auto_31515 ) ( CLEAR ?auto_31509 ) ( IS-CRATE ?auto_31504 ) ( not ( = ?auto_31509 ?auto_31504 ) ) ( not ( = ?auto_31506 ?auto_31509 ) ) ( not ( = ?auto_31507 ?auto_31509 ) ) ( not ( = ?auto_31505 ?auto_31509 ) ) ( not ( = ?auto_31517 ?auto_31509 ) ) ( not ( = ?auto_31519 ?auto_31509 ) ) ( not ( = ?auto_31514 ?auto_31509 ) ) ( AVAILABLE ?auto_31511 ) ( AVAILABLE ?auto_31512 ) ( SURFACE-AT ?auto_31504 ?auto_31516 ) ( ON ?auto_31504 ?auto_31510 ) ( CLEAR ?auto_31504 ) ( not ( = ?auto_31506 ?auto_31510 ) ) ( not ( = ?auto_31507 ?auto_31510 ) ) ( not ( = ?auto_31505 ?auto_31510 ) ) ( not ( = ?auto_31517 ?auto_31510 ) ) ( not ( = ?auto_31519 ?auto_31510 ) ) ( not ( = ?auto_31504 ?auto_31510 ) ) ( not ( = ?auto_31514 ?auto_31510 ) ) ( not ( = ?auto_31509 ?auto_31510 ) ) ( TRUCK-AT ?auto_31518 ?auto_31515 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31505 ?auto_31506 ?auto_31507 )
      ( MAKE-3CRATE-VERIFY ?auto_31504 ?auto_31505 ?auto_31506 ?auto_31507 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31520 - SURFACE
      ?auto_31521 - SURFACE
      ?auto_31522 - SURFACE
      ?auto_31523 - SURFACE
      ?auto_31524 - SURFACE
    )
    :vars
    (
      ?auto_31527 - HOIST
      ?auto_31531 - PLACE
      ?auto_31532 - PLACE
      ?auto_31528 - HOIST
      ?auto_31533 - SURFACE
      ?auto_31525 - PLACE
      ?auto_31529 - HOIST
      ?auto_31535 - SURFACE
      ?auto_31530 - SURFACE
      ?auto_31526 - SURFACE
      ?auto_31534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31527 ?auto_31531 ) ( IS-CRATE ?auto_31524 ) ( not ( = ?auto_31523 ?auto_31524 ) ) ( not ( = ?auto_31522 ?auto_31523 ) ) ( not ( = ?auto_31522 ?auto_31524 ) ) ( not ( = ?auto_31532 ?auto_31531 ) ) ( HOIST-AT ?auto_31528 ?auto_31532 ) ( not ( = ?auto_31527 ?auto_31528 ) ) ( SURFACE-AT ?auto_31524 ?auto_31532 ) ( ON ?auto_31524 ?auto_31533 ) ( CLEAR ?auto_31524 ) ( not ( = ?auto_31523 ?auto_31533 ) ) ( not ( = ?auto_31524 ?auto_31533 ) ) ( not ( = ?auto_31522 ?auto_31533 ) ) ( IS-CRATE ?auto_31523 ) ( not ( = ?auto_31525 ?auto_31531 ) ) ( not ( = ?auto_31532 ?auto_31525 ) ) ( HOIST-AT ?auto_31529 ?auto_31525 ) ( not ( = ?auto_31527 ?auto_31529 ) ) ( not ( = ?auto_31528 ?auto_31529 ) ) ( SURFACE-AT ?auto_31523 ?auto_31525 ) ( ON ?auto_31523 ?auto_31535 ) ( CLEAR ?auto_31523 ) ( not ( = ?auto_31523 ?auto_31535 ) ) ( not ( = ?auto_31524 ?auto_31535 ) ) ( not ( = ?auto_31522 ?auto_31535 ) ) ( not ( = ?auto_31533 ?auto_31535 ) ) ( IS-CRATE ?auto_31522 ) ( not ( = ?auto_31521 ?auto_31522 ) ) ( not ( = ?auto_31523 ?auto_31521 ) ) ( not ( = ?auto_31524 ?auto_31521 ) ) ( not ( = ?auto_31533 ?auto_31521 ) ) ( not ( = ?auto_31535 ?auto_31521 ) ) ( AVAILABLE ?auto_31529 ) ( SURFACE-AT ?auto_31522 ?auto_31525 ) ( ON ?auto_31522 ?auto_31530 ) ( CLEAR ?auto_31522 ) ( not ( = ?auto_31523 ?auto_31530 ) ) ( not ( = ?auto_31524 ?auto_31530 ) ) ( not ( = ?auto_31522 ?auto_31530 ) ) ( not ( = ?auto_31533 ?auto_31530 ) ) ( not ( = ?auto_31535 ?auto_31530 ) ) ( not ( = ?auto_31521 ?auto_31530 ) ) ( SURFACE-AT ?auto_31520 ?auto_31531 ) ( CLEAR ?auto_31520 ) ( IS-CRATE ?auto_31521 ) ( not ( = ?auto_31520 ?auto_31521 ) ) ( not ( = ?auto_31523 ?auto_31520 ) ) ( not ( = ?auto_31524 ?auto_31520 ) ) ( not ( = ?auto_31522 ?auto_31520 ) ) ( not ( = ?auto_31533 ?auto_31520 ) ) ( not ( = ?auto_31535 ?auto_31520 ) ) ( not ( = ?auto_31530 ?auto_31520 ) ) ( AVAILABLE ?auto_31527 ) ( AVAILABLE ?auto_31528 ) ( SURFACE-AT ?auto_31521 ?auto_31532 ) ( ON ?auto_31521 ?auto_31526 ) ( CLEAR ?auto_31521 ) ( not ( = ?auto_31523 ?auto_31526 ) ) ( not ( = ?auto_31524 ?auto_31526 ) ) ( not ( = ?auto_31522 ?auto_31526 ) ) ( not ( = ?auto_31533 ?auto_31526 ) ) ( not ( = ?auto_31535 ?auto_31526 ) ) ( not ( = ?auto_31521 ?auto_31526 ) ) ( not ( = ?auto_31530 ?auto_31526 ) ) ( not ( = ?auto_31520 ?auto_31526 ) ) ( TRUCK-AT ?auto_31534 ?auto_31531 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31522 ?auto_31523 ?auto_31524 )
      ( MAKE-4CRATE-VERIFY ?auto_31520 ?auto_31521 ?auto_31522 ?auto_31523 ?auto_31524 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31536 - SURFACE
      ?auto_31537 - SURFACE
      ?auto_31538 - SURFACE
      ?auto_31539 - SURFACE
      ?auto_31540 - SURFACE
      ?auto_31541 - SURFACE
    )
    :vars
    (
      ?auto_31544 - HOIST
      ?auto_31548 - PLACE
      ?auto_31549 - PLACE
      ?auto_31545 - HOIST
      ?auto_31550 - SURFACE
      ?auto_31542 - PLACE
      ?auto_31546 - HOIST
      ?auto_31552 - SURFACE
      ?auto_31547 - SURFACE
      ?auto_31543 - SURFACE
      ?auto_31551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31544 ?auto_31548 ) ( IS-CRATE ?auto_31541 ) ( not ( = ?auto_31540 ?auto_31541 ) ) ( not ( = ?auto_31539 ?auto_31540 ) ) ( not ( = ?auto_31539 ?auto_31541 ) ) ( not ( = ?auto_31549 ?auto_31548 ) ) ( HOIST-AT ?auto_31545 ?auto_31549 ) ( not ( = ?auto_31544 ?auto_31545 ) ) ( SURFACE-AT ?auto_31541 ?auto_31549 ) ( ON ?auto_31541 ?auto_31550 ) ( CLEAR ?auto_31541 ) ( not ( = ?auto_31540 ?auto_31550 ) ) ( not ( = ?auto_31541 ?auto_31550 ) ) ( not ( = ?auto_31539 ?auto_31550 ) ) ( IS-CRATE ?auto_31540 ) ( not ( = ?auto_31542 ?auto_31548 ) ) ( not ( = ?auto_31549 ?auto_31542 ) ) ( HOIST-AT ?auto_31546 ?auto_31542 ) ( not ( = ?auto_31544 ?auto_31546 ) ) ( not ( = ?auto_31545 ?auto_31546 ) ) ( SURFACE-AT ?auto_31540 ?auto_31542 ) ( ON ?auto_31540 ?auto_31552 ) ( CLEAR ?auto_31540 ) ( not ( = ?auto_31540 ?auto_31552 ) ) ( not ( = ?auto_31541 ?auto_31552 ) ) ( not ( = ?auto_31539 ?auto_31552 ) ) ( not ( = ?auto_31550 ?auto_31552 ) ) ( IS-CRATE ?auto_31539 ) ( not ( = ?auto_31538 ?auto_31539 ) ) ( not ( = ?auto_31540 ?auto_31538 ) ) ( not ( = ?auto_31541 ?auto_31538 ) ) ( not ( = ?auto_31550 ?auto_31538 ) ) ( not ( = ?auto_31552 ?auto_31538 ) ) ( AVAILABLE ?auto_31546 ) ( SURFACE-AT ?auto_31539 ?auto_31542 ) ( ON ?auto_31539 ?auto_31547 ) ( CLEAR ?auto_31539 ) ( not ( = ?auto_31540 ?auto_31547 ) ) ( not ( = ?auto_31541 ?auto_31547 ) ) ( not ( = ?auto_31539 ?auto_31547 ) ) ( not ( = ?auto_31550 ?auto_31547 ) ) ( not ( = ?auto_31552 ?auto_31547 ) ) ( not ( = ?auto_31538 ?auto_31547 ) ) ( SURFACE-AT ?auto_31537 ?auto_31548 ) ( CLEAR ?auto_31537 ) ( IS-CRATE ?auto_31538 ) ( not ( = ?auto_31537 ?auto_31538 ) ) ( not ( = ?auto_31540 ?auto_31537 ) ) ( not ( = ?auto_31541 ?auto_31537 ) ) ( not ( = ?auto_31539 ?auto_31537 ) ) ( not ( = ?auto_31550 ?auto_31537 ) ) ( not ( = ?auto_31552 ?auto_31537 ) ) ( not ( = ?auto_31547 ?auto_31537 ) ) ( AVAILABLE ?auto_31544 ) ( AVAILABLE ?auto_31545 ) ( SURFACE-AT ?auto_31538 ?auto_31549 ) ( ON ?auto_31538 ?auto_31543 ) ( CLEAR ?auto_31538 ) ( not ( = ?auto_31540 ?auto_31543 ) ) ( not ( = ?auto_31541 ?auto_31543 ) ) ( not ( = ?auto_31539 ?auto_31543 ) ) ( not ( = ?auto_31550 ?auto_31543 ) ) ( not ( = ?auto_31552 ?auto_31543 ) ) ( not ( = ?auto_31538 ?auto_31543 ) ) ( not ( = ?auto_31547 ?auto_31543 ) ) ( not ( = ?auto_31537 ?auto_31543 ) ) ( TRUCK-AT ?auto_31551 ?auto_31548 ) ( ON ?auto_31537 ?auto_31536 ) ( not ( = ?auto_31536 ?auto_31537 ) ) ( not ( = ?auto_31536 ?auto_31538 ) ) ( not ( = ?auto_31536 ?auto_31539 ) ) ( not ( = ?auto_31536 ?auto_31540 ) ) ( not ( = ?auto_31536 ?auto_31541 ) ) ( not ( = ?auto_31536 ?auto_31550 ) ) ( not ( = ?auto_31536 ?auto_31552 ) ) ( not ( = ?auto_31536 ?auto_31547 ) ) ( not ( = ?auto_31536 ?auto_31543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31539 ?auto_31540 ?auto_31541 )
      ( MAKE-5CRATE-VERIFY ?auto_31536 ?auto_31537 ?auto_31538 ?auto_31539 ?auto_31540 ?auto_31541 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31553 - SURFACE
      ?auto_31554 - SURFACE
    )
    :vars
    (
      ?auto_31558 - HOIST
      ?auto_31564 - PLACE
      ?auto_31563 - SURFACE
      ?auto_31565 - PLACE
      ?auto_31559 - HOIST
      ?auto_31566 - SURFACE
      ?auto_31555 - PLACE
      ?auto_31561 - HOIST
      ?auto_31568 - SURFACE
      ?auto_31560 - SURFACE
      ?auto_31562 - SURFACE
      ?auto_31556 - SURFACE
      ?auto_31557 - SURFACE
      ?auto_31567 - TRUCK
      ?auto_31569 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31558 ?auto_31564 ) ( IS-CRATE ?auto_31554 ) ( not ( = ?auto_31553 ?auto_31554 ) ) ( not ( = ?auto_31563 ?auto_31553 ) ) ( not ( = ?auto_31563 ?auto_31554 ) ) ( not ( = ?auto_31565 ?auto_31564 ) ) ( HOIST-AT ?auto_31559 ?auto_31565 ) ( not ( = ?auto_31558 ?auto_31559 ) ) ( SURFACE-AT ?auto_31554 ?auto_31565 ) ( ON ?auto_31554 ?auto_31566 ) ( CLEAR ?auto_31554 ) ( not ( = ?auto_31553 ?auto_31566 ) ) ( not ( = ?auto_31554 ?auto_31566 ) ) ( not ( = ?auto_31563 ?auto_31566 ) ) ( IS-CRATE ?auto_31553 ) ( not ( = ?auto_31555 ?auto_31564 ) ) ( not ( = ?auto_31565 ?auto_31555 ) ) ( HOIST-AT ?auto_31561 ?auto_31555 ) ( not ( = ?auto_31558 ?auto_31561 ) ) ( not ( = ?auto_31559 ?auto_31561 ) ) ( SURFACE-AT ?auto_31553 ?auto_31555 ) ( ON ?auto_31553 ?auto_31568 ) ( CLEAR ?auto_31553 ) ( not ( = ?auto_31553 ?auto_31568 ) ) ( not ( = ?auto_31554 ?auto_31568 ) ) ( not ( = ?auto_31563 ?auto_31568 ) ) ( not ( = ?auto_31566 ?auto_31568 ) ) ( IS-CRATE ?auto_31563 ) ( not ( = ?auto_31560 ?auto_31563 ) ) ( not ( = ?auto_31553 ?auto_31560 ) ) ( not ( = ?auto_31554 ?auto_31560 ) ) ( not ( = ?auto_31566 ?auto_31560 ) ) ( not ( = ?auto_31568 ?auto_31560 ) ) ( AVAILABLE ?auto_31561 ) ( SURFACE-AT ?auto_31563 ?auto_31555 ) ( ON ?auto_31563 ?auto_31562 ) ( CLEAR ?auto_31563 ) ( not ( = ?auto_31553 ?auto_31562 ) ) ( not ( = ?auto_31554 ?auto_31562 ) ) ( not ( = ?auto_31563 ?auto_31562 ) ) ( not ( = ?auto_31566 ?auto_31562 ) ) ( not ( = ?auto_31568 ?auto_31562 ) ) ( not ( = ?auto_31560 ?auto_31562 ) ) ( IS-CRATE ?auto_31560 ) ( not ( = ?auto_31556 ?auto_31560 ) ) ( not ( = ?auto_31553 ?auto_31556 ) ) ( not ( = ?auto_31554 ?auto_31556 ) ) ( not ( = ?auto_31563 ?auto_31556 ) ) ( not ( = ?auto_31566 ?auto_31556 ) ) ( not ( = ?auto_31568 ?auto_31556 ) ) ( not ( = ?auto_31562 ?auto_31556 ) ) ( AVAILABLE ?auto_31559 ) ( SURFACE-AT ?auto_31560 ?auto_31565 ) ( ON ?auto_31560 ?auto_31557 ) ( CLEAR ?auto_31560 ) ( not ( = ?auto_31553 ?auto_31557 ) ) ( not ( = ?auto_31554 ?auto_31557 ) ) ( not ( = ?auto_31563 ?auto_31557 ) ) ( not ( = ?auto_31566 ?auto_31557 ) ) ( not ( = ?auto_31568 ?auto_31557 ) ) ( not ( = ?auto_31560 ?auto_31557 ) ) ( not ( = ?auto_31562 ?auto_31557 ) ) ( not ( = ?auto_31556 ?auto_31557 ) ) ( TRUCK-AT ?auto_31567 ?auto_31564 ) ( SURFACE-AT ?auto_31569 ?auto_31564 ) ( CLEAR ?auto_31569 ) ( LIFTING ?auto_31558 ?auto_31556 ) ( IS-CRATE ?auto_31556 ) ( not ( = ?auto_31569 ?auto_31556 ) ) ( not ( = ?auto_31553 ?auto_31569 ) ) ( not ( = ?auto_31554 ?auto_31569 ) ) ( not ( = ?auto_31563 ?auto_31569 ) ) ( not ( = ?auto_31566 ?auto_31569 ) ) ( not ( = ?auto_31568 ?auto_31569 ) ) ( not ( = ?auto_31560 ?auto_31569 ) ) ( not ( = ?auto_31562 ?auto_31569 ) ) ( not ( = ?auto_31557 ?auto_31569 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31569 ?auto_31556 )
      ( MAKE-2CRATE ?auto_31563 ?auto_31553 ?auto_31554 )
      ( MAKE-1CRATE-VERIFY ?auto_31553 ?auto_31554 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31570 - SURFACE
      ?auto_31571 - SURFACE
      ?auto_31572 - SURFACE
    )
    :vars
    (
      ?auto_31575 - HOIST
      ?auto_31581 - PLACE
      ?auto_31577 - PLACE
      ?auto_31583 - HOIST
      ?auto_31579 - SURFACE
      ?auto_31585 - PLACE
      ?auto_31586 - HOIST
      ?auto_31576 - SURFACE
      ?auto_31573 - SURFACE
      ?auto_31580 - SURFACE
      ?auto_31584 - SURFACE
      ?auto_31582 - SURFACE
      ?auto_31574 - TRUCK
      ?auto_31578 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31575 ?auto_31581 ) ( IS-CRATE ?auto_31572 ) ( not ( = ?auto_31571 ?auto_31572 ) ) ( not ( = ?auto_31570 ?auto_31571 ) ) ( not ( = ?auto_31570 ?auto_31572 ) ) ( not ( = ?auto_31577 ?auto_31581 ) ) ( HOIST-AT ?auto_31583 ?auto_31577 ) ( not ( = ?auto_31575 ?auto_31583 ) ) ( SURFACE-AT ?auto_31572 ?auto_31577 ) ( ON ?auto_31572 ?auto_31579 ) ( CLEAR ?auto_31572 ) ( not ( = ?auto_31571 ?auto_31579 ) ) ( not ( = ?auto_31572 ?auto_31579 ) ) ( not ( = ?auto_31570 ?auto_31579 ) ) ( IS-CRATE ?auto_31571 ) ( not ( = ?auto_31585 ?auto_31581 ) ) ( not ( = ?auto_31577 ?auto_31585 ) ) ( HOIST-AT ?auto_31586 ?auto_31585 ) ( not ( = ?auto_31575 ?auto_31586 ) ) ( not ( = ?auto_31583 ?auto_31586 ) ) ( SURFACE-AT ?auto_31571 ?auto_31585 ) ( ON ?auto_31571 ?auto_31576 ) ( CLEAR ?auto_31571 ) ( not ( = ?auto_31571 ?auto_31576 ) ) ( not ( = ?auto_31572 ?auto_31576 ) ) ( not ( = ?auto_31570 ?auto_31576 ) ) ( not ( = ?auto_31579 ?auto_31576 ) ) ( IS-CRATE ?auto_31570 ) ( not ( = ?auto_31573 ?auto_31570 ) ) ( not ( = ?auto_31571 ?auto_31573 ) ) ( not ( = ?auto_31572 ?auto_31573 ) ) ( not ( = ?auto_31579 ?auto_31573 ) ) ( not ( = ?auto_31576 ?auto_31573 ) ) ( AVAILABLE ?auto_31586 ) ( SURFACE-AT ?auto_31570 ?auto_31585 ) ( ON ?auto_31570 ?auto_31580 ) ( CLEAR ?auto_31570 ) ( not ( = ?auto_31571 ?auto_31580 ) ) ( not ( = ?auto_31572 ?auto_31580 ) ) ( not ( = ?auto_31570 ?auto_31580 ) ) ( not ( = ?auto_31579 ?auto_31580 ) ) ( not ( = ?auto_31576 ?auto_31580 ) ) ( not ( = ?auto_31573 ?auto_31580 ) ) ( IS-CRATE ?auto_31573 ) ( not ( = ?auto_31584 ?auto_31573 ) ) ( not ( = ?auto_31571 ?auto_31584 ) ) ( not ( = ?auto_31572 ?auto_31584 ) ) ( not ( = ?auto_31570 ?auto_31584 ) ) ( not ( = ?auto_31579 ?auto_31584 ) ) ( not ( = ?auto_31576 ?auto_31584 ) ) ( not ( = ?auto_31580 ?auto_31584 ) ) ( AVAILABLE ?auto_31583 ) ( SURFACE-AT ?auto_31573 ?auto_31577 ) ( ON ?auto_31573 ?auto_31582 ) ( CLEAR ?auto_31573 ) ( not ( = ?auto_31571 ?auto_31582 ) ) ( not ( = ?auto_31572 ?auto_31582 ) ) ( not ( = ?auto_31570 ?auto_31582 ) ) ( not ( = ?auto_31579 ?auto_31582 ) ) ( not ( = ?auto_31576 ?auto_31582 ) ) ( not ( = ?auto_31573 ?auto_31582 ) ) ( not ( = ?auto_31580 ?auto_31582 ) ) ( not ( = ?auto_31584 ?auto_31582 ) ) ( TRUCK-AT ?auto_31574 ?auto_31581 ) ( SURFACE-AT ?auto_31578 ?auto_31581 ) ( CLEAR ?auto_31578 ) ( LIFTING ?auto_31575 ?auto_31584 ) ( IS-CRATE ?auto_31584 ) ( not ( = ?auto_31578 ?auto_31584 ) ) ( not ( = ?auto_31571 ?auto_31578 ) ) ( not ( = ?auto_31572 ?auto_31578 ) ) ( not ( = ?auto_31570 ?auto_31578 ) ) ( not ( = ?auto_31579 ?auto_31578 ) ) ( not ( = ?auto_31576 ?auto_31578 ) ) ( not ( = ?auto_31573 ?auto_31578 ) ) ( not ( = ?auto_31580 ?auto_31578 ) ) ( not ( = ?auto_31582 ?auto_31578 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31571 ?auto_31572 )
      ( MAKE-2CRATE-VERIFY ?auto_31570 ?auto_31571 ?auto_31572 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31587 - SURFACE
      ?auto_31588 - SURFACE
      ?auto_31589 - SURFACE
      ?auto_31590 - SURFACE
    )
    :vars
    (
      ?auto_31602 - HOIST
      ?auto_31593 - PLACE
      ?auto_31600 - PLACE
      ?auto_31596 - HOIST
      ?auto_31603 - SURFACE
      ?auto_31599 - PLACE
      ?auto_31601 - HOIST
      ?auto_31591 - SURFACE
      ?auto_31598 - SURFACE
      ?auto_31594 - SURFACE
      ?auto_31597 - SURFACE
      ?auto_31592 - TRUCK
      ?auto_31595 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31602 ?auto_31593 ) ( IS-CRATE ?auto_31590 ) ( not ( = ?auto_31589 ?auto_31590 ) ) ( not ( = ?auto_31588 ?auto_31589 ) ) ( not ( = ?auto_31588 ?auto_31590 ) ) ( not ( = ?auto_31600 ?auto_31593 ) ) ( HOIST-AT ?auto_31596 ?auto_31600 ) ( not ( = ?auto_31602 ?auto_31596 ) ) ( SURFACE-AT ?auto_31590 ?auto_31600 ) ( ON ?auto_31590 ?auto_31603 ) ( CLEAR ?auto_31590 ) ( not ( = ?auto_31589 ?auto_31603 ) ) ( not ( = ?auto_31590 ?auto_31603 ) ) ( not ( = ?auto_31588 ?auto_31603 ) ) ( IS-CRATE ?auto_31589 ) ( not ( = ?auto_31599 ?auto_31593 ) ) ( not ( = ?auto_31600 ?auto_31599 ) ) ( HOIST-AT ?auto_31601 ?auto_31599 ) ( not ( = ?auto_31602 ?auto_31601 ) ) ( not ( = ?auto_31596 ?auto_31601 ) ) ( SURFACE-AT ?auto_31589 ?auto_31599 ) ( ON ?auto_31589 ?auto_31591 ) ( CLEAR ?auto_31589 ) ( not ( = ?auto_31589 ?auto_31591 ) ) ( not ( = ?auto_31590 ?auto_31591 ) ) ( not ( = ?auto_31588 ?auto_31591 ) ) ( not ( = ?auto_31603 ?auto_31591 ) ) ( IS-CRATE ?auto_31588 ) ( not ( = ?auto_31587 ?auto_31588 ) ) ( not ( = ?auto_31589 ?auto_31587 ) ) ( not ( = ?auto_31590 ?auto_31587 ) ) ( not ( = ?auto_31603 ?auto_31587 ) ) ( not ( = ?auto_31591 ?auto_31587 ) ) ( AVAILABLE ?auto_31601 ) ( SURFACE-AT ?auto_31588 ?auto_31599 ) ( ON ?auto_31588 ?auto_31598 ) ( CLEAR ?auto_31588 ) ( not ( = ?auto_31589 ?auto_31598 ) ) ( not ( = ?auto_31590 ?auto_31598 ) ) ( not ( = ?auto_31588 ?auto_31598 ) ) ( not ( = ?auto_31603 ?auto_31598 ) ) ( not ( = ?auto_31591 ?auto_31598 ) ) ( not ( = ?auto_31587 ?auto_31598 ) ) ( IS-CRATE ?auto_31587 ) ( not ( = ?auto_31594 ?auto_31587 ) ) ( not ( = ?auto_31589 ?auto_31594 ) ) ( not ( = ?auto_31590 ?auto_31594 ) ) ( not ( = ?auto_31588 ?auto_31594 ) ) ( not ( = ?auto_31603 ?auto_31594 ) ) ( not ( = ?auto_31591 ?auto_31594 ) ) ( not ( = ?auto_31598 ?auto_31594 ) ) ( AVAILABLE ?auto_31596 ) ( SURFACE-AT ?auto_31587 ?auto_31600 ) ( ON ?auto_31587 ?auto_31597 ) ( CLEAR ?auto_31587 ) ( not ( = ?auto_31589 ?auto_31597 ) ) ( not ( = ?auto_31590 ?auto_31597 ) ) ( not ( = ?auto_31588 ?auto_31597 ) ) ( not ( = ?auto_31603 ?auto_31597 ) ) ( not ( = ?auto_31591 ?auto_31597 ) ) ( not ( = ?auto_31587 ?auto_31597 ) ) ( not ( = ?auto_31598 ?auto_31597 ) ) ( not ( = ?auto_31594 ?auto_31597 ) ) ( TRUCK-AT ?auto_31592 ?auto_31593 ) ( SURFACE-AT ?auto_31595 ?auto_31593 ) ( CLEAR ?auto_31595 ) ( LIFTING ?auto_31602 ?auto_31594 ) ( IS-CRATE ?auto_31594 ) ( not ( = ?auto_31595 ?auto_31594 ) ) ( not ( = ?auto_31589 ?auto_31595 ) ) ( not ( = ?auto_31590 ?auto_31595 ) ) ( not ( = ?auto_31588 ?auto_31595 ) ) ( not ( = ?auto_31603 ?auto_31595 ) ) ( not ( = ?auto_31591 ?auto_31595 ) ) ( not ( = ?auto_31587 ?auto_31595 ) ) ( not ( = ?auto_31598 ?auto_31595 ) ) ( not ( = ?auto_31597 ?auto_31595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31588 ?auto_31589 ?auto_31590 )
      ( MAKE-3CRATE-VERIFY ?auto_31587 ?auto_31588 ?auto_31589 ?auto_31590 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31604 - SURFACE
      ?auto_31605 - SURFACE
      ?auto_31606 - SURFACE
      ?auto_31607 - SURFACE
      ?auto_31608 - SURFACE
    )
    :vars
    (
      ?auto_31619 - HOIST
      ?auto_31611 - PLACE
      ?auto_31617 - PLACE
      ?auto_31613 - HOIST
      ?auto_31620 - SURFACE
      ?auto_31616 - PLACE
      ?auto_31618 - HOIST
      ?auto_31609 - SURFACE
      ?auto_31615 - SURFACE
      ?auto_31614 - SURFACE
      ?auto_31610 - TRUCK
      ?auto_31612 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31619 ?auto_31611 ) ( IS-CRATE ?auto_31608 ) ( not ( = ?auto_31607 ?auto_31608 ) ) ( not ( = ?auto_31606 ?auto_31607 ) ) ( not ( = ?auto_31606 ?auto_31608 ) ) ( not ( = ?auto_31617 ?auto_31611 ) ) ( HOIST-AT ?auto_31613 ?auto_31617 ) ( not ( = ?auto_31619 ?auto_31613 ) ) ( SURFACE-AT ?auto_31608 ?auto_31617 ) ( ON ?auto_31608 ?auto_31620 ) ( CLEAR ?auto_31608 ) ( not ( = ?auto_31607 ?auto_31620 ) ) ( not ( = ?auto_31608 ?auto_31620 ) ) ( not ( = ?auto_31606 ?auto_31620 ) ) ( IS-CRATE ?auto_31607 ) ( not ( = ?auto_31616 ?auto_31611 ) ) ( not ( = ?auto_31617 ?auto_31616 ) ) ( HOIST-AT ?auto_31618 ?auto_31616 ) ( not ( = ?auto_31619 ?auto_31618 ) ) ( not ( = ?auto_31613 ?auto_31618 ) ) ( SURFACE-AT ?auto_31607 ?auto_31616 ) ( ON ?auto_31607 ?auto_31609 ) ( CLEAR ?auto_31607 ) ( not ( = ?auto_31607 ?auto_31609 ) ) ( not ( = ?auto_31608 ?auto_31609 ) ) ( not ( = ?auto_31606 ?auto_31609 ) ) ( not ( = ?auto_31620 ?auto_31609 ) ) ( IS-CRATE ?auto_31606 ) ( not ( = ?auto_31605 ?auto_31606 ) ) ( not ( = ?auto_31607 ?auto_31605 ) ) ( not ( = ?auto_31608 ?auto_31605 ) ) ( not ( = ?auto_31620 ?auto_31605 ) ) ( not ( = ?auto_31609 ?auto_31605 ) ) ( AVAILABLE ?auto_31618 ) ( SURFACE-AT ?auto_31606 ?auto_31616 ) ( ON ?auto_31606 ?auto_31615 ) ( CLEAR ?auto_31606 ) ( not ( = ?auto_31607 ?auto_31615 ) ) ( not ( = ?auto_31608 ?auto_31615 ) ) ( not ( = ?auto_31606 ?auto_31615 ) ) ( not ( = ?auto_31620 ?auto_31615 ) ) ( not ( = ?auto_31609 ?auto_31615 ) ) ( not ( = ?auto_31605 ?auto_31615 ) ) ( IS-CRATE ?auto_31605 ) ( not ( = ?auto_31604 ?auto_31605 ) ) ( not ( = ?auto_31607 ?auto_31604 ) ) ( not ( = ?auto_31608 ?auto_31604 ) ) ( not ( = ?auto_31606 ?auto_31604 ) ) ( not ( = ?auto_31620 ?auto_31604 ) ) ( not ( = ?auto_31609 ?auto_31604 ) ) ( not ( = ?auto_31615 ?auto_31604 ) ) ( AVAILABLE ?auto_31613 ) ( SURFACE-AT ?auto_31605 ?auto_31617 ) ( ON ?auto_31605 ?auto_31614 ) ( CLEAR ?auto_31605 ) ( not ( = ?auto_31607 ?auto_31614 ) ) ( not ( = ?auto_31608 ?auto_31614 ) ) ( not ( = ?auto_31606 ?auto_31614 ) ) ( not ( = ?auto_31620 ?auto_31614 ) ) ( not ( = ?auto_31609 ?auto_31614 ) ) ( not ( = ?auto_31605 ?auto_31614 ) ) ( not ( = ?auto_31615 ?auto_31614 ) ) ( not ( = ?auto_31604 ?auto_31614 ) ) ( TRUCK-AT ?auto_31610 ?auto_31611 ) ( SURFACE-AT ?auto_31612 ?auto_31611 ) ( CLEAR ?auto_31612 ) ( LIFTING ?auto_31619 ?auto_31604 ) ( IS-CRATE ?auto_31604 ) ( not ( = ?auto_31612 ?auto_31604 ) ) ( not ( = ?auto_31607 ?auto_31612 ) ) ( not ( = ?auto_31608 ?auto_31612 ) ) ( not ( = ?auto_31606 ?auto_31612 ) ) ( not ( = ?auto_31620 ?auto_31612 ) ) ( not ( = ?auto_31609 ?auto_31612 ) ) ( not ( = ?auto_31605 ?auto_31612 ) ) ( not ( = ?auto_31615 ?auto_31612 ) ) ( not ( = ?auto_31614 ?auto_31612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31606 ?auto_31607 ?auto_31608 )
      ( MAKE-4CRATE-VERIFY ?auto_31604 ?auto_31605 ?auto_31606 ?auto_31607 ?auto_31608 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31621 - SURFACE
      ?auto_31622 - SURFACE
      ?auto_31623 - SURFACE
      ?auto_31624 - SURFACE
      ?auto_31625 - SURFACE
      ?auto_31626 - SURFACE
    )
    :vars
    (
      ?auto_31636 - HOIST
      ?auto_31629 - PLACE
      ?auto_31634 - PLACE
      ?auto_31630 - HOIST
      ?auto_31637 - SURFACE
      ?auto_31633 - PLACE
      ?auto_31635 - HOIST
      ?auto_31627 - SURFACE
      ?auto_31632 - SURFACE
      ?auto_31631 - SURFACE
      ?auto_31628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31636 ?auto_31629 ) ( IS-CRATE ?auto_31626 ) ( not ( = ?auto_31625 ?auto_31626 ) ) ( not ( = ?auto_31624 ?auto_31625 ) ) ( not ( = ?auto_31624 ?auto_31626 ) ) ( not ( = ?auto_31634 ?auto_31629 ) ) ( HOIST-AT ?auto_31630 ?auto_31634 ) ( not ( = ?auto_31636 ?auto_31630 ) ) ( SURFACE-AT ?auto_31626 ?auto_31634 ) ( ON ?auto_31626 ?auto_31637 ) ( CLEAR ?auto_31626 ) ( not ( = ?auto_31625 ?auto_31637 ) ) ( not ( = ?auto_31626 ?auto_31637 ) ) ( not ( = ?auto_31624 ?auto_31637 ) ) ( IS-CRATE ?auto_31625 ) ( not ( = ?auto_31633 ?auto_31629 ) ) ( not ( = ?auto_31634 ?auto_31633 ) ) ( HOIST-AT ?auto_31635 ?auto_31633 ) ( not ( = ?auto_31636 ?auto_31635 ) ) ( not ( = ?auto_31630 ?auto_31635 ) ) ( SURFACE-AT ?auto_31625 ?auto_31633 ) ( ON ?auto_31625 ?auto_31627 ) ( CLEAR ?auto_31625 ) ( not ( = ?auto_31625 ?auto_31627 ) ) ( not ( = ?auto_31626 ?auto_31627 ) ) ( not ( = ?auto_31624 ?auto_31627 ) ) ( not ( = ?auto_31637 ?auto_31627 ) ) ( IS-CRATE ?auto_31624 ) ( not ( = ?auto_31623 ?auto_31624 ) ) ( not ( = ?auto_31625 ?auto_31623 ) ) ( not ( = ?auto_31626 ?auto_31623 ) ) ( not ( = ?auto_31637 ?auto_31623 ) ) ( not ( = ?auto_31627 ?auto_31623 ) ) ( AVAILABLE ?auto_31635 ) ( SURFACE-AT ?auto_31624 ?auto_31633 ) ( ON ?auto_31624 ?auto_31632 ) ( CLEAR ?auto_31624 ) ( not ( = ?auto_31625 ?auto_31632 ) ) ( not ( = ?auto_31626 ?auto_31632 ) ) ( not ( = ?auto_31624 ?auto_31632 ) ) ( not ( = ?auto_31637 ?auto_31632 ) ) ( not ( = ?auto_31627 ?auto_31632 ) ) ( not ( = ?auto_31623 ?auto_31632 ) ) ( IS-CRATE ?auto_31623 ) ( not ( = ?auto_31622 ?auto_31623 ) ) ( not ( = ?auto_31625 ?auto_31622 ) ) ( not ( = ?auto_31626 ?auto_31622 ) ) ( not ( = ?auto_31624 ?auto_31622 ) ) ( not ( = ?auto_31637 ?auto_31622 ) ) ( not ( = ?auto_31627 ?auto_31622 ) ) ( not ( = ?auto_31632 ?auto_31622 ) ) ( AVAILABLE ?auto_31630 ) ( SURFACE-AT ?auto_31623 ?auto_31634 ) ( ON ?auto_31623 ?auto_31631 ) ( CLEAR ?auto_31623 ) ( not ( = ?auto_31625 ?auto_31631 ) ) ( not ( = ?auto_31626 ?auto_31631 ) ) ( not ( = ?auto_31624 ?auto_31631 ) ) ( not ( = ?auto_31637 ?auto_31631 ) ) ( not ( = ?auto_31627 ?auto_31631 ) ) ( not ( = ?auto_31623 ?auto_31631 ) ) ( not ( = ?auto_31632 ?auto_31631 ) ) ( not ( = ?auto_31622 ?auto_31631 ) ) ( TRUCK-AT ?auto_31628 ?auto_31629 ) ( SURFACE-AT ?auto_31621 ?auto_31629 ) ( CLEAR ?auto_31621 ) ( LIFTING ?auto_31636 ?auto_31622 ) ( IS-CRATE ?auto_31622 ) ( not ( = ?auto_31621 ?auto_31622 ) ) ( not ( = ?auto_31625 ?auto_31621 ) ) ( not ( = ?auto_31626 ?auto_31621 ) ) ( not ( = ?auto_31624 ?auto_31621 ) ) ( not ( = ?auto_31637 ?auto_31621 ) ) ( not ( = ?auto_31627 ?auto_31621 ) ) ( not ( = ?auto_31623 ?auto_31621 ) ) ( not ( = ?auto_31632 ?auto_31621 ) ) ( not ( = ?auto_31631 ?auto_31621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31624 ?auto_31625 ?auto_31626 )
      ( MAKE-5CRATE-VERIFY ?auto_31621 ?auto_31622 ?auto_31623 ?auto_31624 ?auto_31625 ?auto_31626 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31638 - SURFACE
      ?auto_31639 - SURFACE
    )
    :vars
    (
      ?auto_31651 - HOIST
      ?auto_31642 - PLACE
      ?auto_31654 - SURFACE
      ?auto_31649 - PLACE
      ?auto_31645 - HOIST
      ?auto_31653 - SURFACE
      ?auto_31648 - PLACE
      ?auto_31650 - HOIST
      ?auto_31640 - SURFACE
      ?auto_31652 - SURFACE
      ?auto_31647 - SURFACE
      ?auto_31643 - SURFACE
      ?auto_31646 - SURFACE
      ?auto_31641 - TRUCK
      ?auto_31644 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31651 ?auto_31642 ) ( IS-CRATE ?auto_31639 ) ( not ( = ?auto_31638 ?auto_31639 ) ) ( not ( = ?auto_31654 ?auto_31638 ) ) ( not ( = ?auto_31654 ?auto_31639 ) ) ( not ( = ?auto_31649 ?auto_31642 ) ) ( HOIST-AT ?auto_31645 ?auto_31649 ) ( not ( = ?auto_31651 ?auto_31645 ) ) ( SURFACE-AT ?auto_31639 ?auto_31649 ) ( ON ?auto_31639 ?auto_31653 ) ( CLEAR ?auto_31639 ) ( not ( = ?auto_31638 ?auto_31653 ) ) ( not ( = ?auto_31639 ?auto_31653 ) ) ( not ( = ?auto_31654 ?auto_31653 ) ) ( IS-CRATE ?auto_31638 ) ( not ( = ?auto_31648 ?auto_31642 ) ) ( not ( = ?auto_31649 ?auto_31648 ) ) ( HOIST-AT ?auto_31650 ?auto_31648 ) ( not ( = ?auto_31651 ?auto_31650 ) ) ( not ( = ?auto_31645 ?auto_31650 ) ) ( SURFACE-AT ?auto_31638 ?auto_31648 ) ( ON ?auto_31638 ?auto_31640 ) ( CLEAR ?auto_31638 ) ( not ( = ?auto_31638 ?auto_31640 ) ) ( not ( = ?auto_31639 ?auto_31640 ) ) ( not ( = ?auto_31654 ?auto_31640 ) ) ( not ( = ?auto_31653 ?auto_31640 ) ) ( IS-CRATE ?auto_31654 ) ( not ( = ?auto_31652 ?auto_31654 ) ) ( not ( = ?auto_31638 ?auto_31652 ) ) ( not ( = ?auto_31639 ?auto_31652 ) ) ( not ( = ?auto_31653 ?auto_31652 ) ) ( not ( = ?auto_31640 ?auto_31652 ) ) ( AVAILABLE ?auto_31650 ) ( SURFACE-AT ?auto_31654 ?auto_31648 ) ( ON ?auto_31654 ?auto_31647 ) ( CLEAR ?auto_31654 ) ( not ( = ?auto_31638 ?auto_31647 ) ) ( not ( = ?auto_31639 ?auto_31647 ) ) ( not ( = ?auto_31654 ?auto_31647 ) ) ( not ( = ?auto_31653 ?auto_31647 ) ) ( not ( = ?auto_31640 ?auto_31647 ) ) ( not ( = ?auto_31652 ?auto_31647 ) ) ( IS-CRATE ?auto_31652 ) ( not ( = ?auto_31643 ?auto_31652 ) ) ( not ( = ?auto_31638 ?auto_31643 ) ) ( not ( = ?auto_31639 ?auto_31643 ) ) ( not ( = ?auto_31654 ?auto_31643 ) ) ( not ( = ?auto_31653 ?auto_31643 ) ) ( not ( = ?auto_31640 ?auto_31643 ) ) ( not ( = ?auto_31647 ?auto_31643 ) ) ( AVAILABLE ?auto_31645 ) ( SURFACE-AT ?auto_31652 ?auto_31649 ) ( ON ?auto_31652 ?auto_31646 ) ( CLEAR ?auto_31652 ) ( not ( = ?auto_31638 ?auto_31646 ) ) ( not ( = ?auto_31639 ?auto_31646 ) ) ( not ( = ?auto_31654 ?auto_31646 ) ) ( not ( = ?auto_31653 ?auto_31646 ) ) ( not ( = ?auto_31640 ?auto_31646 ) ) ( not ( = ?auto_31652 ?auto_31646 ) ) ( not ( = ?auto_31647 ?auto_31646 ) ) ( not ( = ?auto_31643 ?auto_31646 ) ) ( TRUCK-AT ?auto_31641 ?auto_31642 ) ( SURFACE-AT ?auto_31644 ?auto_31642 ) ( CLEAR ?auto_31644 ) ( IS-CRATE ?auto_31643 ) ( not ( = ?auto_31644 ?auto_31643 ) ) ( not ( = ?auto_31638 ?auto_31644 ) ) ( not ( = ?auto_31639 ?auto_31644 ) ) ( not ( = ?auto_31654 ?auto_31644 ) ) ( not ( = ?auto_31653 ?auto_31644 ) ) ( not ( = ?auto_31640 ?auto_31644 ) ) ( not ( = ?auto_31652 ?auto_31644 ) ) ( not ( = ?auto_31647 ?auto_31644 ) ) ( not ( = ?auto_31646 ?auto_31644 ) ) ( AVAILABLE ?auto_31651 ) ( IN ?auto_31643 ?auto_31641 ) )
    :subtasks
    ( ( !UNLOAD ?auto_31651 ?auto_31643 ?auto_31641 ?auto_31642 )
      ( MAKE-2CRATE ?auto_31654 ?auto_31638 ?auto_31639 )
      ( MAKE-1CRATE-VERIFY ?auto_31638 ?auto_31639 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31655 - SURFACE
      ?auto_31656 - SURFACE
      ?auto_31657 - SURFACE
    )
    :vars
    (
      ?auto_31669 - HOIST
      ?auto_31668 - PLACE
      ?auto_31665 - PLACE
      ?auto_31662 - HOIST
      ?auto_31664 - SURFACE
      ?auto_31671 - PLACE
      ?auto_31670 - HOIST
      ?auto_31666 - SURFACE
      ?auto_31667 - SURFACE
      ?auto_31658 - SURFACE
      ?auto_31660 - SURFACE
      ?auto_31663 - SURFACE
      ?auto_31661 - TRUCK
      ?auto_31659 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31669 ?auto_31668 ) ( IS-CRATE ?auto_31657 ) ( not ( = ?auto_31656 ?auto_31657 ) ) ( not ( = ?auto_31655 ?auto_31656 ) ) ( not ( = ?auto_31655 ?auto_31657 ) ) ( not ( = ?auto_31665 ?auto_31668 ) ) ( HOIST-AT ?auto_31662 ?auto_31665 ) ( not ( = ?auto_31669 ?auto_31662 ) ) ( SURFACE-AT ?auto_31657 ?auto_31665 ) ( ON ?auto_31657 ?auto_31664 ) ( CLEAR ?auto_31657 ) ( not ( = ?auto_31656 ?auto_31664 ) ) ( not ( = ?auto_31657 ?auto_31664 ) ) ( not ( = ?auto_31655 ?auto_31664 ) ) ( IS-CRATE ?auto_31656 ) ( not ( = ?auto_31671 ?auto_31668 ) ) ( not ( = ?auto_31665 ?auto_31671 ) ) ( HOIST-AT ?auto_31670 ?auto_31671 ) ( not ( = ?auto_31669 ?auto_31670 ) ) ( not ( = ?auto_31662 ?auto_31670 ) ) ( SURFACE-AT ?auto_31656 ?auto_31671 ) ( ON ?auto_31656 ?auto_31666 ) ( CLEAR ?auto_31656 ) ( not ( = ?auto_31656 ?auto_31666 ) ) ( not ( = ?auto_31657 ?auto_31666 ) ) ( not ( = ?auto_31655 ?auto_31666 ) ) ( not ( = ?auto_31664 ?auto_31666 ) ) ( IS-CRATE ?auto_31655 ) ( not ( = ?auto_31667 ?auto_31655 ) ) ( not ( = ?auto_31656 ?auto_31667 ) ) ( not ( = ?auto_31657 ?auto_31667 ) ) ( not ( = ?auto_31664 ?auto_31667 ) ) ( not ( = ?auto_31666 ?auto_31667 ) ) ( AVAILABLE ?auto_31670 ) ( SURFACE-AT ?auto_31655 ?auto_31671 ) ( ON ?auto_31655 ?auto_31658 ) ( CLEAR ?auto_31655 ) ( not ( = ?auto_31656 ?auto_31658 ) ) ( not ( = ?auto_31657 ?auto_31658 ) ) ( not ( = ?auto_31655 ?auto_31658 ) ) ( not ( = ?auto_31664 ?auto_31658 ) ) ( not ( = ?auto_31666 ?auto_31658 ) ) ( not ( = ?auto_31667 ?auto_31658 ) ) ( IS-CRATE ?auto_31667 ) ( not ( = ?auto_31660 ?auto_31667 ) ) ( not ( = ?auto_31656 ?auto_31660 ) ) ( not ( = ?auto_31657 ?auto_31660 ) ) ( not ( = ?auto_31655 ?auto_31660 ) ) ( not ( = ?auto_31664 ?auto_31660 ) ) ( not ( = ?auto_31666 ?auto_31660 ) ) ( not ( = ?auto_31658 ?auto_31660 ) ) ( AVAILABLE ?auto_31662 ) ( SURFACE-AT ?auto_31667 ?auto_31665 ) ( ON ?auto_31667 ?auto_31663 ) ( CLEAR ?auto_31667 ) ( not ( = ?auto_31656 ?auto_31663 ) ) ( not ( = ?auto_31657 ?auto_31663 ) ) ( not ( = ?auto_31655 ?auto_31663 ) ) ( not ( = ?auto_31664 ?auto_31663 ) ) ( not ( = ?auto_31666 ?auto_31663 ) ) ( not ( = ?auto_31667 ?auto_31663 ) ) ( not ( = ?auto_31658 ?auto_31663 ) ) ( not ( = ?auto_31660 ?auto_31663 ) ) ( TRUCK-AT ?auto_31661 ?auto_31668 ) ( SURFACE-AT ?auto_31659 ?auto_31668 ) ( CLEAR ?auto_31659 ) ( IS-CRATE ?auto_31660 ) ( not ( = ?auto_31659 ?auto_31660 ) ) ( not ( = ?auto_31656 ?auto_31659 ) ) ( not ( = ?auto_31657 ?auto_31659 ) ) ( not ( = ?auto_31655 ?auto_31659 ) ) ( not ( = ?auto_31664 ?auto_31659 ) ) ( not ( = ?auto_31666 ?auto_31659 ) ) ( not ( = ?auto_31667 ?auto_31659 ) ) ( not ( = ?auto_31658 ?auto_31659 ) ) ( not ( = ?auto_31663 ?auto_31659 ) ) ( AVAILABLE ?auto_31669 ) ( IN ?auto_31660 ?auto_31661 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31656 ?auto_31657 )
      ( MAKE-2CRATE-VERIFY ?auto_31655 ?auto_31656 ?auto_31657 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31672 - SURFACE
      ?auto_31673 - SURFACE
      ?auto_31674 - SURFACE
      ?auto_31675 - SURFACE
    )
    :vars
    (
      ?auto_31683 - HOIST
      ?auto_31678 - PLACE
      ?auto_31687 - PLACE
      ?auto_31677 - HOIST
      ?auto_31682 - SURFACE
      ?auto_31680 - PLACE
      ?auto_31684 - HOIST
      ?auto_31685 - SURFACE
      ?auto_31679 - SURFACE
      ?auto_31681 - SURFACE
      ?auto_31688 - SURFACE
      ?auto_31686 - TRUCK
      ?auto_31676 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31683 ?auto_31678 ) ( IS-CRATE ?auto_31675 ) ( not ( = ?auto_31674 ?auto_31675 ) ) ( not ( = ?auto_31673 ?auto_31674 ) ) ( not ( = ?auto_31673 ?auto_31675 ) ) ( not ( = ?auto_31687 ?auto_31678 ) ) ( HOIST-AT ?auto_31677 ?auto_31687 ) ( not ( = ?auto_31683 ?auto_31677 ) ) ( SURFACE-AT ?auto_31675 ?auto_31687 ) ( ON ?auto_31675 ?auto_31682 ) ( CLEAR ?auto_31675 ) ( not ( = ?auto_31674 ?auto_31682 ) ) ( not ( = ?auto_31675 ?auto_31682 ) ) ( not ( = ?auto_31673 ?auto_31682 ) ) ( IS-CRATE ?auto_31674 ) ( not ( = ?auto_31680 ?auto_31678 ) ) ( not ( = ?auto_31687 ?auto_31680 ) ) ( HOIST-AT ?auto_31684 ?auto_31680 ) ( not ( = ?auto_31683 ?auto_31684 ) ) ( not ( = ?auto_31677 ?auto_31684 ) ) ( SURFACE-AT ?auto_31674 ?auto_31680 ) ( ON ?auto_31674 ?auto_31685 ) ( CLEAR ?auto_31674 ) ( not ( = ?auto_31674 ?auto_31685 ) ) ( not ( = ?auto_31675 ?auto_31685 ) ) ( not ( = ?auto_31673 ?auto_31685 ) ) ( not ( = ?auto_31682 ?auto_31685 ) ) ( IS-CRATE ?auto_31673 ) ( not ( = ?auto_31672 ?auto_31673 ) ) ( not ( = ?auto_31674 ?auto_31672 ) ) ( not ( = ?auto_31675 ?auto_31672 ) ) ( not ( = ?auto_31682 ?auto_31672 ) ) ( not ( = ?auto_31685 ?auto_31672 ) ) ( AVAILABLE ?auto_31684 ) ( SURFACE-AT ?auto_31673 ?auto_31680 ) ( ON ?auto_31673 ?auto_31679 ) ( CLEAR ?auto_31673 ) ( not ( = ?auto_31674 ?auto_31679 ) ) ( not ( = ?auto_31675 ?auto_31679 ) ) ( not ( = ?auto_31673 ?auto_31679 ) ) ( not ( = ?auto_31682 ?auto_31679 ) ) ( not ( = ?auto_31685 ?auto_31679 ) ) ( not ( = ?auto_31672 ?auto_31679 ) ) ( IS-CRATE ?auto_31672 ) ( not ( = ?auto_31681 ?auto_31672 ) ) ( not ( = ?auto_31674 ?auto_31681 ) ) ( not ( = ?auto_31675 ?auto_31681 ) ) ( not ( = ?auto_31673 ?auto_31681 ) ) ( not ( = ?auto_31682 ?auto_31681 ) ) ( not ( = ?auto_31685 ?auto_31681 ) ) ( not ( = ?auto_31679 ?auto_31681 ) ) ( AVAILABLE ?auto_31677 ) ( SURFACE-AT ?auto_31672 ?auto_31687 ) ( ON ?auto_31672 ?auto_31688 ) ( CLEAR ?auto_31672 ) ( not ( = ?auto_31674 ?auto_31688 ) ) ( not ( = ?auto_31675 ?auto_31688 ) ) ( not ( = ?auto_31673 ?auto_31688 ) ) ( not ( = ?auto_31682 ?auto_31688 ) ) ( not ( = ?auto_31685 ?auto_31688 ) ) ( not ( = ?auto_31672 ?auto_31688 ) ) ( not ( = ?auto_31679 ?auto_31688 ) ) ( not ( = ?auto_31681 ?auto_31688 ) ) ( TRUCK-AT ?auto_31686 ?auto_31678 ) ( SURFACE-AT ?auto_31676 ?auto_31678 ) ( CLEAR ?auto_31676 ) ( IS-CRATE ?auto_31681 ) ( not ( = ?auto_31676 ?auto_31681 ) ) ( not ( = ?auto_31674 ?auto_31676 ) ) ( not ( = ?auto_31675 ?auto_31676 ) ) ( not ( = ?auto_31673 ?auto_31676 ) ) ( not ( = ?auto_31682 ?auto_31676 ) ) ( not ( = ?auto_31685 ?auto_31676 ) ) ( not ( = ?auto_31672 ?auto_31676 ) ) ( not ( = ?auto_31679 ?auto_31676 ) ) ( not ( = ?auto_31688 ?auto_31676 ) ) ( AVAILABLE ?auto_31683 ) ( IN ?auto_31681 ?auto_31686 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31673 ?auto_31674 ?auto_31675 )
      ( MAKE-3CRATE-VERIFY ?auto_31672 ?auto_31673 ?auto_31674 ?auto_31675 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31689 - SURFACE
      ?auto_31690 - SURFACE
      ?auto_31691 - SURFACE
      ?auto_31692 - SURFACE
      ?auto_31693 - SURFACE
    )
    :vars
    (
      ?auto_31700 - HOIST
      ?auto_31696 - PLACE
      ?auto_31704 - PLACE
      ?auto_31695 - HOIST
      ?auto_31699 - SURFACE
      ?auto_31698 - PLACE
      ?auto_31701 - HOIST
      ?auto_31702 - SURFACE
      ?auto_31697 - SURFACE
      ?auto_31705 - SURFACE
      ?auto_31703 - TRUCK
      ?auto_31694 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31700 ?auto_31696 ) ( IS-CRATE ?auto_31693 ) ( not ( = ?auto_31692 ?auto_31693 ) ) ( not ( = ?auto_31691 ?auto_31692 ) ) ( not ( = ?auto_31691 ?auto_31693 ) ) ( not ( = ?auto_31704 ?auto_31696 ) ) ( HOIST-AT ?auto_31695 ?auto_31704 ) ( not ( = ?auto_31700 ?auto_31695 ) ) ( SURFACE-AT ?auto_31693 ?auto_31704 ) ( ON ?auto_31693 ?auto_31699 ) ( CLEAR ?auto_31693 ) ( not ( = ?auto_31692 ?auto_31699 ) ) ( not ( = ?auto_31693 ?auto_31699 ) ) ( not ( = ?auto_31691 ?auto_31699 ) ) ( IS-CRATE ?auto_31692 ) ( not ( = ?auto_31698 ?auto_31696 ) ) ( not ( = ?auto_31704 ?auto_31698 ) ) ( HOIST-AT ?auto_31701 ?auto_31698 ) ( not ( = ?auto_31700 ?auto_31701 ) ) ( not ( = ?auto_31695 ?auto_31701 ) ) ( SURFACE-AT ?auto_31692 ?auto_31698 ) ( ON ?auto_31692 ?auto_31702 ) ( CLEAR ?auto_31692 ) ( not ( = ?auto_31692 ?auto_31702 ) ) ( not ( = ?auto_31693 ?auto_31702 ) ) ( not ( = ?auto_31691 ?auto_31702 ) ) ( not ( = ?auto_31699 ?auto_31702 ) ) ( IS-CRATE ?auto_31691 ) ( not ( = ?auto_31690 ?auto_31691 ) ) ( not ( = ?auto_31692 ?auto_31690 ) ) ( not ( = ?auto_31693 ?auto_31690 ) ) ( not ( = ?auto_31699 ?auto_31690 ) ) ( not ( = ?auto_31702 ?auto_31690 ) ) ( AVAILABLE ?auto_31701 ) ( SURFACE-AT ?auto_31691 ?auto_31698 ) ( ON ?auto_31691 ?auto_31697 ) ( CLEAR ?auto_31691 ) ( not ( = ?auto_31692 ?auto_31697 ) ) ( not ( = ?auto_31693 ?auto_31697 ) ) ( not ( = ?auto_31691 ?auto_31697 ) ) ( not ( = ?auto_31699 ?auto_31697 ) ) ( not ( = ?auto_31702 ?auto_31697 ) ) ( not ( = ?auto_31690 ?auto_31697 ) ) ( IS-CRATE ?auto_31690 ) ( not ( = ?auto_31689 ?auto_31690 ) ) ( not ( = ?auto_31692 ?auto_31689 ) ) ( not ( = ?auto_31693 ?auto_31689 ) ) ( not ( = ?auto_31691 ?auto_31689 ) ) ( not ( = ?auto_31699 ?auto_31689 ) ) ( not ( = ?auto_31702 ?auto_31689 ) ) ( not ( = ?auto_31697 ?auto_31689 ) ) ( AVAILABLE ?auto_31695 ) ( SURFACE-AT ?auto_31690 ?auto_31704 ) ( ON ?auto_31690 ?auto_31705 ) ( CLEAR ?auto_31690 ) ( not ( = ?auto_31692 ?auto_31705 ) ) ( not ( = ?auto_31693 ?auto_31705 ) ) ( not ( = ?auto_31691 ?auto_31705 ) ) ( not ( = ?auto_31699 ?auto_31705 ) ) ( not ( = ?auto_31702 ?auto_31705 ) ) ( not ( = ?auto_31690 ?auto_31705 ) ) ( not ( = ?auto_31697 ?auto_31705 ) ) ( not ( = ?auto_31689 ?auto_31705 ) ) ( TRUCK-AT ?auto_31703 ?auto_31696 ) ( SURFACE-AT ?auto_31694 ?auto_31696 ) ( CLEAR ?auto_31694 ) ( IS-CRATE ?auto_31689 ) ( not ( = ?auto_31694 ?auto_31689 ) ) ( not ( = ?auto_31692 ?auto_31694 ) ) ( not ( = ?auto_31693 ?auto_31694 ) ) ( not ( = ?auto_31691 ?auto_31694 ) ) ( not ( = ?auto_31699 ?auto_31694 ) ) ( not ( = ?auto_31702 ?auto_31694 ) ) ( not ( = ?auto_31690 ?auto_31694 ) ) ( not ( = ?auto_31697 ?auto_31694 ) ) ( not ( = ?auto_31705 ?auto_31694 ) ) ( AVAILABLE ?auto_31700 ) ( IN ?auto_31689 ?auto_31703 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31691 ?auto_31692 ?auto_31693 )
      ( MAKE-4CRATE-VERIFY ?auto_31689 ?auto_31690 ?auto_31691 ?auto_31692 ?auto_31693 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31706 - SURFACE
      ?auto_31707 - SURFACE
      ?auto_31708 - SURFACE
      ?auto_31709 - SURFACE
      ?auto_31710 - SURFACE
      ?auto_31711 - SURFACE
    )
    :vars
    (
      ?auto_31717 - HOIST
      ?auto_31713 - PLACE
      ?auto_31721 - PLACE
      ?auto_31712 - HOIST
      ?auto_31716 - SURFACE
      ?auto_31715 - PLACE
      ?auto_31718 - HOIST
      ?auto_31719 - SURFACE
      ?auto_31714 - SURFACE
      ?auto_31722 - SURFACE
      ?auto_31720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31717 ?auto_31713 ) ( IS-CRATE ?auto_31711 ) ( not ( = ?auto_31710 ?auto_31711 ) ) ( not ( = ?auto_31709 ?auto_31710 ) ) ( not ( = ?auto_31709 ?auto_31711 ) ) ( not ( = ?auto_31721 ?auto_31713 ) ) ( HOIST-AT ?auto_31712 ?auto_31721 ) ( not ( = ?auto_31717 ?auto_31712 ) ) ( SURFACE-AT ?auto_31711 ?auto_31721 ) ( ON ?auto_31711 ?auto_31716 ) ( CLEAR ?auto_31711 ) ( not ( = ?auto_31710 ?auto_31716 ) ) ( not ( = ?auto_31711 ?auto_31716 ) ) ( not ( = ?auto_31709 ?auto_31716 ) ) ( IS-CRATE ?auto_31710 ) ( not ( = ?auto_31715 ?auto_31713 ) ) ( not ( = ?auto_31721 ?auto_31715 ) ) ( HOIST-AT ?auto_31718 ?auto_31715 ) ( not ( = ?auto_31717 ?auto_31718 ) ) ( not ( = ?auto_31712 ?auto_31718 ) ) ( SURFACE-AT ?auto_31710 ?auto_31715 ) ( ON ?auto_31710 ?auto_31719 ) ( CLEAR ?auto_31710 ) ( not ( = ?auto_31710 ?auto_31719 ) ) ( not ( = ?auto_31711 ?auto_31719 ) ) ( not ( = ?auto_31709 ?auto_31719 ) ) ( not ( = ?auto_31716 ?auto_31719 ) ) ( IS-CRATE ?auto_31709 ) ( not ( = ?auto_31708 ?auto_31709 ) ) ( not ( = ?auto_31710 ?auto_31708 ) ) ( not ( = ?auto_31711 ?auto_31708 ) ) ( not ( = ?auto_31716 ?auto_31708 ) ) ( not ( = ?auto_31719 ?auto_31708 ) ) ( AVAILABLE ?auto_31718 ) ( SURFACE-AT ?auto_31709 ?auto_31715 ) ( ON ?auto_31709 ?auto_31714 ) ( CLEAR ?auto_31709 ) ( not ( = ?auto_31710 ?auto_31714 ) ) ( not ( = ?auto_31711 ?auto_31714 ) ) ( not ( = ?auto_31709 ?auto_31714 ) ) ( not ( = ?auto_31716 ?auto_31714 ) ) ( not ( = ?auto_31719 ?auto_31714 ) ) ( not ( = ?auto_31708 ?auto_31714 ) ) ( IS-CRATE ?auto_31708 ) ( not ( = ?auto_31707 ?auto_31708 ) ) ( not ( = ?auto_31710 ?auto_31707 ) ) ( not ( = ?auto_31711 ?auto_31707 ) ) ( not ( = ?auto_31709 ?auto_31707 ) ) ( not ( = ?auto_31716 ?auto_31707 ) ) ( not ( = ?auto_31719 ?auto_31707 ) ) ( not ( = ?auto_31714 ?auto_31707 ) ) ( AVAILABLE ?auto_31712 ) ( SURFACE-AT ?auto_31708 ?auto_31721 ) ( ON ?auto_31708 ?auto_31722 ) ( CLEAR ?auto_31708 ) ( not ( = ?auto_31710 ?auto_31722 ) ) ( not ( = ?auto_31711 ?auto_31722 ) ) ( not ( = ?auto_31709 ?auto_31722 ) ) ( not ( = ?auto_31716 ?auto_31722 ) ) ( not ( = ?auto_31719 ?auto_31722 ) ) ( not ( = ?auto_31708 ?auto_31722 ) ) ( not ( = ?auto_31714 ?auto_31722 ) ) ( not ( = ?auto_31707 ?auto_31722 ) ) ( TRUCK-AT ?auto_31720 ?auto_31713 ) ( SURFACE-AT ?auto_31706 ?auto_31713 ) ( CLEAR ?auto_31706 ) ( IS-CRATE ?auto_31707 ) ( not ( = ?auto_31706 ?auto_31707 ) ) ( not ( = ?auto_31710 ?auto_31706 ) ) ( not ( = ?auto_31711 ?auto_31706 ) ) ( not ( = ?auto_31709 ?auto_31706 ) ) ( not ( = ?auto_31716 ?auto_31706 ) ) ( not ( = ?auto_31719 ?auto_31706 ) ) ( not ( = ?auto_31708 ?auto_31706 ) ) ( not ( = ?auto_31714 ?auto_31706 ) ) ( not ( = ?auto_31722 ?auto_31706 ) ) ( AVAILABLE ?auto_31717 ) ( IN ?auto_31707 ?auto_31720 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31709 ?auto_31710 ?auto_31711 )
      ( MAKE-5CRATE-VERIFY ?auto_31706 ?auto_31707 ?auto_31708 ?auto_31709 ?auto_31710 ?auto_31711 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31723 - SURFACE
      ?auto_31724 - SURFACE
    )
    :vars
    (
      ?auto_31734 - HOIST
      ?auto_31729 - PLACE
      ?auto_31728 - SURFACE
      ?auto_31738 - PLACE
      ?auto_31727 - HOIST
      ?auto_31733 - SURFACE
      ?auto_31731 - PLACE
      ?auto_31735 - HOIST
      ?auto_31736 - SURFACE
      ?auto_31725 - SURFACE
      ?auto_31730 - SURFACE
      ?auto_31732 - SURFACE
      ?auto_31739 - SURFACE
      ?auto_31726 - SURFACE
      ?auto_31737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31734 ?auto_31729 ) ( IS-CRATE ?auto_31724 ) ( not ( = ?auto_31723 ?auto_31724 ) ) ( not ( = ?auto_31728 ?auto_31723 ) ) ( not ( = ?auto_31728 ?auto_31724 ) ) ( not ( = ?auto_31738 ?auto_31729 ) ) ( HOIST-AT ?auto_31727 ?auto_31738 ) ( not ( = ?auto_31734 ?auto_31727 ) ) ( SURFACE-AT ?auto_31724 ?auto_31738 ) ( ON ?auto_31724 ?auto_31733 ) ( CLEAR ?auto_31724 ) ( not ( = ?auto_31723 ?auto_31733 ) ) ( not ( = ?auto_31724 ?auto_31733 ) ) ( not ( = ?auto_31728 ?auto_31733 ) ) ( IS-CRATE ?auto_31723 ) ( not ( = ?auto_31731 ?auto_31729 ) ) ( not ( = ?auto_31738 ?auto_31731 ) ) ( HOIST-AT ?auto_31735 ?auto_31731 ) ( not ( = ?auto_31734 ?auto_31735 ) ) ( not ( = ?auto_31727 ?auto_31735 ) ) ( SURFACE-AT ?auto_31723 ?auto_31731 ) ( ON ?auto_31723 ?auto_31736 ) ( CLEAR ?auto_31723 ) ( not ( = ?auto_31723 ?auto_31736 ) ) ( not ( = ?auto_31724 ?auto_31736 ) ) ( not ( = ?auto_31728 ?auto_31736 ) ) ( not ( = ?auto_31733 ?auto_31736 ) ) ( IS-CRATE ?auto_31728 ) ( not ( = ?auto_31725 ?auto_31728 ) ) ( not ( = ?auto_31723 ?auto_31725 ) ) ( not ( = ?auto_31724 ?auto_31725 ) ) ( not ( = ?auto_31733 ?auto_31725 ) ) ( not ( = ?auto_31736 ?auto_31725 ) ) ( AVAILABLE ?auto_31735 ) ( SURFACE-AT ?auto_31728 ?auto_31731 ) ( ON ?auto_31728 ?auto_31730 ) ( CLEAR ?auto_31728 ) ( not ( = ?auto_31723 ?auto_31730 ) ) ( not ( = ?auto_31724 ?auto_31730 ) ) ( not ( = ?auto_31728 ?auto_31730 ) ) ( not ( = ?auto_31733 ?auto_31730 ) ) ( not ( = ?auto_31736 ?auto_31730 ) ) ( not ( = ?auto_31725 ?auto_31730 ) ) ( IS-CRATE ?auto_31725 ) ( not ( = ?auto_31732 ?auto_31725 ) ) ( not ( = ?auto_31723 ?auto_31732 ) ) ( not ( = ?auto_31724 ?auto_31732 ) ) ( not ( = ?auto_31728 ?auto_31732 ) ) ( not ( = ?auto_31733 ?auto_31732 ) ) ( not ( = ?auto_31736 ?auto_31732 ) ) ( not ( = ?auto_31730 ?auto_31732 ) ) ( AVAILABLE ?auto_31727 ) ( SURFACE-AT ?auto_31725 ?auto_31738 ) ( ON ?auto_31725 ?auto_31739 ) ( CLEAR ?auto_31725 ) ( not ( = ?auto_31723 ?auto_31739 ) ) ( not ( = ?auto_31724 ?auto_31739 ) ) ( not ( = ?auto_31728 ?auto_31739 ) ) ( not ( = ?auto_31733 ?auto_31739 ) ) ( not ( = ?auto_31736 ?auto_31739 ) ) ( not ( = ?auto_31725 ?auto_31739 ) ) ( not ( = ?auto_31730 ?auto_31739 ) ) ( not ( = ?auto_31732 ?auto_31739 ) ) ( SURFACE-AT ?auto_31726 ?auto_31729 ) ( CLEAR ?auto_31726 ) ( IS-CRATE ?auto_31732 ) ( not ( = ?auto_31726 ?auto_31732 ) ) ( not ( = ?auto_31723 ?auto_31726 ) ) ( not ( = ?auto_31724 ?auto_31726 ) ) ( not ( = ?auto_31728 ?auto_31726 ) ) ( not ( = ?auto_31733 ?auto_31726 ) ) ( not ( = ?auto_31736 ?auto_31726 ) ) ( not ( = ?auto_31725 ?auto_31726 ) ) ( not ( = ?auto_31730 ?auto_31726 ) ) ( not ( = ?auto_31739 ?auto_31726 ) ) ( AVAILABLE ?auto_31734 ) ( IN ?auto_31732 ?auto_31737 ) ( TRUCK-AT ?auto_31737 ?auto_31731 ) )
    :subtasks
    ( ( !DRIVE ?auto_31737 ?auto_31731 ?auto_31729 )
      ( MAKE-2CRATE ?auto_31728 ?auto_31723 ?auto_31724 )
      ( MAKE-1CRATE-VERIFY ?auto_31723 ?auto_31724 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31740 - SURFACE
      ?auto_31741 - SURFACE
      ?auto_31742 - SURFACE
    )
    :vars
    (
      ?auto_31747 - HOIST
      ?auto_31749 - PLACE
      ?auto_31748 - PLACE
      ?auto_31756 - HOIST
      ?auto_31752 - SURFACE
      ?auto_31750 - PLACE
      ?auto_31754 - HOIST
      ?auto_31745 - SURFACE
      ?auto_31755 - SURFACE
      ?auto_31746 - SURFACE
      ?auto_31743 - SURFACE
      ?auto_31744 - SURFACE
      ?auto_31753 - SURFACE
      ?auto_31751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31747 ?auto_31749 ) ( IS-CRATE ?auto_31742 ) ( not ( = ?auto_31741 ?auto_31742 ) ) ( not ( = ?auto_31740 ?auto_31741 ) ) ( not ( = ?auto_31740 ?auto_31742 ) ) ( not ( = ?auto_31748 ?auto_31749 ) ) ( HOIST-AT ?auto_31756 ?auto_31748 ) ( not ( = ?auto_31747 ?auto_31756 ) ) ( SURFACE-AT ?auto_31742 ?auto_31748 ) ( ON ?auto_31742 ?auto_31752 ) ( CLEAR ?auto_31742 ) ( not ( = ?auto_31741 ?auto_31752 ) ) ( not ( = ?auto_31742 ?auto_31752 ) ) ( not ( = ?auto_31740 ?auto_31752 ) ) ( IS-CRATE ?auto_31741 ) ( not ( = ?auto_31750 ?auto_31749 ) ) ( not ( = ?auto_31748 ?auto_31750 ) ) ( HOIST-AT ?auto_31754 ?auto_31750 ) ( not ( = ?auto_31747 ?auto_31754 ) ) ( not ( = ?auto_31756 ?auto_31754 ) ) ( SURFACE-AT ?auto_31741 ?auto_31750 ) ( ON ?auto_31741 ?auto_31745 ) ( CLEAR ?auto_31741 ) ( not ( = ?auto_31741 ?auto_31745 ) ) ( not ( = ?auto_31742 ?auto_31745 ) ) ( not ( = ?auto_31740 ?auto_31745 ) ) ( not ( = ?auto_31752 ?auto_31745 ) ) ( IS-CRATE ?auto_31740 ) ( not ( = ?auto_31755 ?auto_31740 ) ) ( not ( = ?auto_31741 ?auto_31755 ) ) ( not ( = ?auto_31742 ?auto_31755 ) ) ( not ( = ?auto_31752 ?auto_31755 ) ) ( not ( = ?auto_31745 ?auto_31755 ) ) ( AVAILABLE ?auto_31754 ) ( SURFACE-AT ?auto_31740 ?auto_31750 ) ( ON ?auto_31740 ?auto_31746 ) ( CLEAR ?auto_31740 ) ( not ( = ?auto_31741 ?auto_31746 ) ) ( not ( = ?auto_31742 ?auto_31746 ) ) ( not ( = ?auto_31740 ?auto_31746 ) ) ( not ( = ?auto_31752 ?auto_31746 ) ) ( not ( = ?auto_31745 ?auto_31746 ) ) ( not ( = ?auto_31755 ?auto_31746 ) ) ( IS-CRATE ?auto_31755 ) ( not ( = ?auto_31743 ?auto_31755 ) ) ( not ( = ?auto_31741 ?auto_31743 ) ) ( not ( = ?auto_31742 ?auto_31743 ) ) ( not ( = ?auto_31740 ?auto_31743 ) ) ( not ( = ?auto_31752 ?auto_31743 ) ) ( not ( = ?auto_31745 ?auto_31743 ) ) ( not ( = ?auto_31746 ?auto_31743 ) ) ( AVAILABLE ?auto_31756 ) ( SURFACE-AT ?auto_31755 ?auto_31748 ) ( ON ?auto_31755 ?auto_31744 ) ( CLEAR ?auto_31755 ) ( not ( = ?auto_31741 ?auto_31744 ) ) ( not ( = ?auto_31742 ?auto_31744 ) ) ( not ( = ?auto_31740 ?auto_31744 ) ) ( not ( = ?auto_31752 ?auto_31744 ) ) ( not ( = ?auto_31745 ?auto_31744 ) ) ( not ( = ?auto_31755 ?auto_31744 ) ) ( not ( = ?auto_31746 ?auto_31744 ) ) ( not ( = ?auto_31743 ?auto_31744 ) ) ( SURFACE-AT ?auto_31753 ?auto_31749 ) ( CLEAR ?auto_31753 ) ( IS-CRATE ?auto_31743 ) ( not ( = ?auto_31753 ?auto_31743 ) ) ( not ( = ?auto_31741 ?auto_31753 ) ) ( not ( = ?auto_31742 ?auto_31753 ) ) ( not ( = ?auto_31740 ?auto_31753 ) ) ( not ( = ?auto_31752 ?auto_31753 ) ) ( not ( = ?auto_31745 ?auto_31753 ) ) ( not ( = ?auto_31755 ?auto_31753 ) ) ( not ( = ?auto_31746 ?auto_31753 ) ) ( not ( = ?auto_31744 ?auto_31753 ) ) ( AVAILABLE ?auto_31747 ) ( IN ?auto_31743 ?auto_31751 ) ( TRUCK-AT ?auto_31751 ?auto_31750 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31741 ?auto_31742 )
      ( MAKE-2CRATE-VERIFY ?auto_31740 ?auto_31741 ?auto_31742 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31757 - SURFACE
      ?auto_31758 - SURFACE
      ?auto_31759 - SURFACE
      ?auto_31760 - SURFACE
    )
    :vars
    (
      ?auto_31767 - HOIST
      ?auto_31765 - PLACE
      ?auto_31773 - PLACE
      ?auto_31772 - HOIST
      ?auto_31764 - SURFACE
      ?auto_31763 - PLACE
      ?auto_31771 - HOIST
      ?auto_31769 - SURFACE
      ?auto_31761 - SURFACE
      ?auto_31766 - SURFACE
      ?auto_31768 - SURFACE
      ?auto_31770 - SURFACE
      ?auto_31762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31767 ?auto_31765 ) ( IS-CRATE ?auto_31760 ) ( not ( = ?auto_31759 ?auto_31760 ) ) ( not ( = ?auto_31758 ?auto_31759 ) ) ( not ( = ?auto_31758 ?auto_31760 ) ) ( not ( = ?auto_31773 ?auto_31765 ) ) ( HOIST-AT ?auto_31772 ?auto_31773 ) ( not ( = ?auto_31767 ?auto_31772 ) ) ( SURFACE-AT ?auto_31760 ?auto_31773 ) ( ON ?auto_31760 ?auto_31764 ) ( CLEAR ?auto_31760 ) ( not ( = ?auto_31759 ?auto_31764 ) ) ( not ( = ?auto_31760 ?auto_31764 ) ) ( not ( = ?auto_31758 ?auto_31764 ) ) ( IS-CRATE ?auto_31759 ) ( not ( = ?auto_31763 ?auto_31765 ) ) ( not ( = ?auto_31773 ?auto_31763 ) ) ( HOIST-AT ?auto_31771 ?auto_31763 ) ( not ( = ?auto_31767 ?auto_31771 ) ) ( not ( = ?auto_31772 ?auto_31771 ) ) ( SURFACE-AT ?auto_31759 ?auto_31763 ) ( ON ?auto_31759 ?auto_31769 ) ( CLEAR ?auto_31759 ) ( not ( = ?auto_31759 ?auto_31769 ) ) ( not ( = ?auto_31760 ?auto_31769 ) ) ( not ( = ?auto_31758 ?auto_31769 ) ) ( not ( = ?auto_31764 ?auto_31769 ) ) ( IS-CRATE ?auto_31758 ) ( not ( = ?auto_31757 ?auto_31758 ) ) ( not ( = ?auto_31759 ?auto_31757 ) ) ( not ( = ?auto_31760 ?auto_31757 ) ) ( not ( = ?auto_31764 ?auto_31757 ) ) ( not ( = ?auto_31769 ?auto_31757 ) ) ( AVAILABLE ?auto_31771 ) ( SURFACE-AT ?auto_31758 ?auto_31763 ) ( ON ?auto_31758 ?auto_31761 ) ( CLEAR ?auto_31758 ) ( not ( = ?auto_31759 ?auto_31761 ) ) ( not ( = ?auto_31760 ?auto_31761 ) ) ( not ( = ?auto_31758 ?auto_31761 ) ) ( not ( = ?auto_31764 ?auto_31761 ) ) ( not ( = ?auto_31769 ?auto_31761 ) ) ( not ( = ?auto_31757 ?auto_31761 ) ) ( IS-CRATE ?auto_31757 ) ( not ( = ?auto_31766 ?auto_31757 ) ) ( not ( = ?auto_31759 ?auto_31766 ) ) ( not ( = ?auto_31760 ?auto_31766 ) ) ( not ( = ?auto_31758 ?auto_31766 ) ) ( not ( = ?auto_31764 ?auto_31766 ) ) ( not ( = ?auto_31769 ?auto_31766 ) ) ( not ( = ?auto_31761 ?auto_31766 ) ) ( AVAILABLE ?auto_31772 ) ( SURFACE-AT ?auto_31757 ?auto_31773 ) ( ON ?auto_31757 ?auto_31768 ) ( CLEAR ?auto_31757 ) ( not ( = ?auto_31759 ?auto_31768 ) ) ( not ( = ?auto_31760 ?auto_31768 ) ) ( not ( = ?auto_31758 ?auto_31768 ) ) ( not ( = ?auto_31764 ?auto_31768 ) ) ( not ( = ?auto_31769 ?auto_31768 ) ) ( not ( = ?auto_31757 ?auto_31768 ) ) ( not ( = ?auto_31761 ?auto_31768 ) ) ( not ( = ?auto_31766 ?auto_31768 ) ) ( SURFACE-AT ?auto_31770 ?auto_31765 ) ( CLEAR ?auto_31770 ) ( IS-CRATE ?auto_31766 ) ( not ( = ?auto_31770 ?auto_31766 ) ) ( not ( = ?auto_31759 ?auto_31770 ) ) ( not ( = ?auto_31760 ?auto_31770 ) ) ( not ( = ?auto_31758 ?auto_31770 ) ) ( not ( = ?auto_31764 ?auto_31770 ) ) ( not ( = ?auto_31769 ?auto_31770 ) ) ( not ( = ?auto_31757 ?auto_31770 ) ) ( not ( = ?auto_31761 ?auto_31770 ) ) ( not ( = ?auto_31768 ?auto_31770 ) ) ( AVAILABLE ?auto_31767 ) ( IN ?auto_31766 ?auto_31762 ) ( TRUCK-AT ?auto_31762 ?auto_31763 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31758 ?auto_31759 ?auto_31760 )
      ( MAKE-3CRATE-VERIFY ?auto_31757 ?auto_31758 ?auto_31759 ?auto_31760 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31774 - SURFACE
      ?auto_31775 - SURFACE
      ?auto_31776 - SURFACE
      ?auto_31777 - SURFACE
      ?auto_31778 - SURFACE
    )
    :vars
    (
      ?auto_31784 - HOIST
      ?auto_31783 - PLACE
      ?auto_31790 - PLACE
      ?auto_31789 - HOIST
      ?auto_31782 - SURFACE
      ?auto_31781 - PLACE
      ?auto_31788 - HOIST
      ?auto_31786 - SURFACE
      ?auto_31779 - SURFACE
      ?auto_31785 - SURFACE
      ?auto_31787 - SURFACE
      ?auto_31780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31784 ?auto_31783 ) ( IS-CRATE ?auto_31778 ) ( not ( = ?auto_31777 ?auto_31778 ) ) ( not ( = ?auto_31776 ?auto_31777 ) ) ( not ( = ?auto_31776 ?auto_31778 ) ) ( not ( = ?auto_31790 ?auto_31783 ) ) ( HOIST-AT ?auto_31789 ?auto_31790 ) ( not ( = ?auto_31784 ?auto_31789 ) ) ( SURFACE-AT ?auto_31778 ?auto_31790 ) ( ON ?auto_31778 ?auto_31782 ) ( CLEAR ?auto_31778 ) ( not ( = ?auto_31777 ?auto_31782 ) ) ( not ( = ?auto_31778 ?auto_31782 ) ) ( not ( = ?auto_31776 ?auto_31782 ) ) ( IS-CRATE ?auto_31777 ) ( not ( = ?auto_31781 ?auto_31783 ) ) ( not ( = ?auto_31790 ?auto_31781 ) ) ( HOIST-AT ?auto_31788 ?auto_31781 ) ( not ( = ?auto_31784 ?auto_31788 ) ) ( not ( = ?auto_31789 ?auto_31788 ) ) ( SURFACE-AT ?auto_31777 ?auto_31781 ) ( ON ?auto_31777 ?auto_31786 ) ( CLEAR ?auto_31777 ) ( not ( = ?auto_31777 ?auto_31786 ) ) ( not ( = ?auto_31778 ?auto_31786 ) ) ( not ( = ?auto_31776 ?auto_31786 ) ) ( not ( = ?auto_31782 ?auto_31786 ) ) ( IS-CRATE ?auto_31776 ) ( not ( = ?auto_31775 ?auto_31776 ) ) ( not ( = ?auto_31777 ?auto_31775 ) ) ( not ( = ?auto_31778 ?auto_31775 ) ) ( not ( = ?auto_31782 ?auto_31775 ) ) ( not ( = ?auto_31786 ?auto_31775 ) ) ( AVAILABLE ?auto_31788 ) ( SURFACE-AT ?auto_31776 ?auto_31781 ) ( ON ?auto_31776 ?auto_31779 ) ( CLEAR ?auto_31776 ) ( not ( = ?auto_31777 ?auto_31779 ) ) ( not ( = ?auto_31778 ?auto_31779 ) ) ( not ( = ?auto_31776 ?auto_31779 ) ) ( not ( = ?auto_31782 ?auto_31779 ) ) ( not ( = ?auto_31786 ?auto_31779 ) ) ( not ( = ?auto_31775 ?auto_31779 ) ) ( IS-CRATE ?auto_31775 ) ( not ( = ?auto_31774 ?auto_31775 ) ) ( not ( = ?auto_31777 ?auto_31774 ) ) ( not ( = ?auto_31778 ?auto_31774 ) ) ( not ( = ?auto_31776 ?auto_31774 ) ) ( not ( = ?auto_31782 ?auto_31774 ) ) ( not ( = ?auto_31786 ?auto_31774 ) ) ( not ( = ?auto_31779 ?auto_31774 ) ) ( AVAILABLE ?auto_31789 ) ( SURFACE-AT ?auto_31775 ?auto_31790 ) ( ON ?auto_31775 ?auto_31785 ) ( CLEAR ?auto_31775 ) ( not ( = ?auto_31777 ?auto_31785 ) ) ( not ( = ?auto_31778 ?auto_31785 ) ) ( not ( = ?auto_31776 ?auto_31785 ) ) ( not ( = ?auto_31782 ?auto_31785 ) ) ( not ( = ?auto_31786 ?auto_31785 ) ) ( not ( = ?auto_31775 ?auto_31785 ) ) ( not ( = ?auto_31779 ?auto_31785 ) ) ( not ( = ?auto_31774 ?auto_31785 ) ) ( SURFACE-AT ?auto_31787 ?auto_31783 ) ( CLEAR ?auto_31787 ) ( IS-CRATE ?auto_31774 ) ( not ( = ?auto_31787 ?auto_31774 ) ) ( not ( = ?auto_31777 ?auto_31787 ) ) ( not ( = ?auto_31778 ?auto_31787 ) ) ( not ( = ?auto_31776 ?auto_31787 ) ) ( not ( = ?auto_31782 ?auto_31787 ) ) ( not ( = ?auto_31786 ?auto_31787 ) ) ( not ( = ?auto_31775 ?auto_31787 ) ) ( not ( = ?auto_31779 ?auto_31787 ) ) ( not ( = ?auto_31785 ?auto_31787 ) ) ( AVAILABLE ?auto_31784 ) ( IN ?auto_31774 ?auto_31780 ) ( TRUCK-AT ?auto_31780 ?auto_31781 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31776 ?auto_31777 ?auto_31778 )
      ( MAKE-4CRATE-VERIFY ?auto_31774 ?auto_31775 ?auto_31776 ?auto_31777 ?auto_31778 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31791 - SURFACE
      ?auto_31792 - SURFACE
      ?auto_31793 - SURFACE
      ?auto_31794 - SURFACE
      ?auto_31795 - SURFACE
      ?auto_31796 - SURFACE
    )
    :vars
    (
      ?auto_31802 - HOIST
      ?auto_31801 - PLACE
      ?auto_31807 - PLACE
      ?auto_31806 - HOIST
      ?auto_31800 - SURFACE
      ?auto_31799 - PLACE
      ?auto_31805 - HOIST
      ?auto_31804 - SURFACE
      ?auto_31797 - SURFACE
      ?auto_31803 - SURFACE
      ?auto_31798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31802 ?auto_31801 ) ( IS-CRATE ?auto_31796 ) ( not ( = ?auto_31795 ?auto_31796 ) ) ( not ( = ?auto_31794 ?auto_31795 ) ) ( not ( = ?auto_31794 ?auto_31796 ) ) ( not ( = ?auto_31807 ?auto_31801 ) ) ( HOIST-AT ?auto_31806 ?auto_31807 ) ( not ( = ?auto_31802 ?auto_31806 ) ) ( SURFACE-AT ?auto_31796 ?auto_31807 ) ( ON ?auto_31796 ?auto_31800 ) ( CLEAR ?auto_31796 ) ( not ( = ?auto_31795 ?auto_31800 ) ) ( not ( = ?auto_31796 ?auto_31800 ) ) ( not ( = ?auto_31794 ?auto_31800 ) ) ( IS-CRATE ?auto_31795 ) ( not ( = ?auto_31799 ?auto_31801 ) ) ( not ( = ?auto_31807 ?auto_31799 ) ) ( HOIST-AT ?auto_31805 ?auto_31799 ) ( not ( = ?auto_31802 ?auto_31805 ) ) ( not ( = ?auto_31806 ?auto_31805 ) ) ( SURFACE-AT ?auto_31795 ?auto_31799 ) ( ON ?auto_31795 ?auto_31804 ) ( CLEAR ?auto_31795 ) ( not ( = ?auto_31795 ?auto_31804 ) ) ( not ( = ?auto_31796 ?auto_31804 ) ) ( not ( = ?auto_31794 ?auto_31804 ) ) ( not ( = ?auto_31800 ?auto_31804 ) ) ( IS-CRATE ?auto_31794 ) ( not ( = ?auto_31793 ?auto_31794 ) ) ( not ( = ?auto_31795 ?auto_31793 ) ) ( not ( = ?auto_31796 ?auto_31793 ) ) ( not ( = ?auto_31800 ?auto_31793 ) ) ( not ( = ?auto_31804 ?auto_31793 ) ) ( AVAILABLE ?auto_31805 ) ( SURFACE-AT ?auto_31794 ?auto_31799 ) ( ON ?auto_31794 ?auto_31797 ) ( CLEAR ?auto_31794 ) ( not ( = ?auto_31795 ?auto_31797 ) ) ( not ( = ?auto_31796 ?auto_31797 ) ) ( not ( = ?auto_31794 ?auto_31797 ) ) ( not ( = ?auto_31800 ?auto_31797 ) ) ( not ( = ?auto_31804 ?auto_31797 ) ) ( not ( = ?auto_31793 ?auto_31797 ) ) ( IS-CRATE ?auto_31793 ) ( not ( = ?auto_31792 ?auto_31793 ) ) ( not ( = ?auto_31795 ?auto_31792 ) ) ( not ( = ?auto_31796 ?auto_31792 ) ) ( not ( = ?auto_31794 ?auto_31792 ) ) ( not ( = ?auto_31800 ?auto_31792 ) ) ( not ( = ?auto_31804 ?auto_31792 ) ) ( not ( = ?auto_31797 ?auto_31792 ) ) ( AVAILABLE ?auto_31806 ) ( SURFACE-AT ?auto_31793 ?auto_31807 ) ( ON ?auto_31793 ?auto_31803 ) ( CLEAR ?auto_31793 ) ( not ( = ?auto_31795 ?auto_31803 ) ) ( not ( = ?auto_31796 ?auto_31803 ) ) ( not ( = ?auto_31794 ?auto_31803 ) ) ( not ( = ?auto_31800 ?auto_31803 ) ) ( not ( = ?auto_31804 ?auto_31803 ) ) ( not ( = ?auto_31793 ?auto_31803 ) ) ( not ( = ?auto_31797 ?auto_31803 ) ) ( not ( = ?auto_31792 ?auto_31803 ) ) ( SURFACE-AT ?auto_31791 ?auto_31801 ) ( CLEAR ?auto_31791 ) ( IS-CRATE ?auto_31792 ) ( not ( = ?auto_31791 ?auto_31792 ) ) ( not ( = ?auto_31795 ?auto_31791 ) ) ( not ( = ?auto_31796 ?auto_31791 ) ) ( not ( = ?auto_31794 ?auto_31791 ) ) ( not ( = ?auto_31800 ?auto_31791 ) ) ( not ( = ?auto_31804 ?auto_31791 ) ) ( not ( = ?auto_31793 ?auto_31791 ) ) ( not ( = ?auto_31797 ?auto_31791 ) ) ( not ( = ?auto_31803 ?auto_31791 ) ) ( AVAILABLE ?auto_31802 ) ( IN ?auto_31792 ?auto_31798 ) ( TRUCK-AT ?auto_31798 ?auto_31799 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31794 ?auto_31795 ?auto_31796 )
      ( MAKE-5CRATE-VERIFY ?auto_31791 ?auto_31792 ?auto_31793 ?auto_31794 ?auto_31795 ?auto_31796 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31808 - SURFACE
      ?auto_31809 - SURFACE
    )
    :vars
    (
      ?auto_31816 - HOIST
      ?auto_31814 - PLACE
      ?auto_31817 - SURFACE
      ?auto_31824 - PLACE
      ?auto_31823 - HOIST
      ?auto_31813 - SURFACE
      ?auto_31812 - PLACE
      ?auto_31821 - HOIST
      ?auto_31819 - SURFACE
      ?auto_31822 - SURFACE
      ?auto_31810 - SURFACE
      ?auto_31815 - SURFACE
      ?auto_31818 - SURFACE
      ?auto_31820 - SURFACE
      ?auto_31811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31816 ?auto_31814 ) ( IS-CRATE ?auto_31809 ) ( not ( = ?auto_31808 ?auto_31809 ) ) ( not ( = ?auto_31817 ?auto_31808 ) ) ( not ( = ?auto_31817 ?auto_31809 ) ) ( not ( = ?auto_31824 ?auto_31814 ) ) ( HOIST-AT ?auto_31823 ?auto_31824 ) ( not ( = ?auto_31816 ?auto_31823 ) ) ( SURFACE-AT ?auto_31809 ?auto_31824 ) ( ON ?auto_31809 ?auto_31813 ) ( CLEAR ?auto_31809 ) ( not ( = ?auto_31808 ?auto_31813 ) ) ( not ( = ?auto_31809 ?auto_31813 ) ) ( not ( = ?auto_31817 ?auto_31813 ) ) ( IS-CRATE ?auto_31808 ) ( not ( = ?auto_31812 ?auto_31814 ) ) ( not ( = ?auto_31824 ?auto_31812 ) ) ( HOIST-AT ?auto_31821 ?auto_31812 ) ( not ( = ?auto_31816 ?auto_31821 ) ) ( not ( = ?auto_31823 ?auto_31821 ) ) ( SURFACE-AT ?auto_31808 ?auto_31812 ) ( ON ?auto_31808 ?auto_31819 ) ( CLEAR ?auto_31808 ) ( not ( = ?auto_31808 ?auto_31819 ) ) ( not ( = ?auto_31809 ?auto_31819 ) ) ( not ( = ?auto_31817 ?auto_31819 ) ) ( not ( = ?auto_31813 ?auto_31819 ) ) ( IS-CRATE ?auto_31817 ) ( not ( = ?auto_31822 ?auto_31817 ) ) ( not ( = ?auto_31808 ?auto_31822 ) ) ( not ( = ?auto_31809 ?auto_31822 ) ) ( not ( = ?auto_31813 ?auto_31822 ) ) ( not ( = ?auto_31819 ?auto_31822 ) ) ( SURFACE-AT ?auto_31817 ?auto_31812 ) ( ON ?auto_31817 ?auto_31810 ) ( CLEAR ?auto_31817 ) ( not ( = ?auto_31808 ?auto_31810 ) ) ( not ( = ?auto_31809 ?auto_31810 ) ) ( not ( = ?auto_31817 ?auto_31810 ) ) ( not ( = ?auto_31813 ?auto_31810 ) ) ( not ( = ?auto_31819 ?auto_31810 ) ) ( not ( = ?auto_31822 ?auto_31810 ) ) ( IS-CRATE ?auto_31822 ) ( not ( = ?auto_31815 ?auto_31822 ) ) ( not ( = ?auto_31808 ?auto_31815 ) ) ( not ( = ?auto_31809 ?auto_31815 ) ) ( not ( = ?auto_31817 ?auto_31815 ) ) ( not ( = ?auto_31813 ?auto_31815 ) ) ( not ( = ?auto_31819 ?auto_31815 ) ) ( not ( = ?auto_31810 ?auto_31815 ) ) ( AVAILABLE ?auto_31823 ) ( SURFACE-AT ?auto_31822 ?auto_31824 ) ( ON ?auto_31822 ?auto_31818 ) ( CLEAR ?auto_31822 ) ( not ( = ?auto_31808 ?auto_31818 ) ) ( not ( = ?auto_31809 ?auto_31818 ) ) ( not ( = ?auto_31817 ?auto_31818 ) ) ( not ( = ?auto_31813 ?auto_31818 ) ) ( not ( = ?auto_31819 ?auto_31818 ) ) ( not ( = ?auto_31822 ?auto_31818 ) ) ( not ( = ?auto_31810 ?auto_31818 ) ) ( not ( = ?auto_31815 ?auto_31818 ) ) ( SURFACE-AT ?auto_31820 ?auto_31814 ) ( CLEAR ?auto_31820 ) ( IS-CRATE ?auto_31815 ) ( not ( = ?auto_31820 ?auto_31815 ) ) ( not ( = ?auto_31808 ?auto_31820 ) ) ( not ( = ?auto_31809 ?auto_31820 ) ) ( not ( = ?auto_31817 ?auto_31820 ) ) ( not ( = ?auto_31813 ?auto_31820 ) ) ( not ( = ?auto_31819 ?auto_31820 ) ) ( not ( = ?auto_31822 ?auto_31820 ) ) ( not ( = ?auto_31810 ?auto_31820 ) ) ( not ( = ?auto_31818 ?auto_31820 ) ) ( AVAILABLE ?auto_31816 ) ( TRUCK-AT ?auto_31811 ?auto_31812 ) ( LIFTING ?auto_31821 ?auto_31815 ) )
    :subtasks
    ( ( !LOAD ?auto_31821 ?auto_31815 ?auto_31811 ?auto_31812 )
      ( MAKE-2CRATE ?auto_31817 ?auto_31808 ?auto_31809 )
      ( MAKE-1CRATE-VERIFY ?auto_31808 ?auto_31809 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31825 - SURFACE
      ?auto_31826 - SURFACE
      ?auto_31827 - SURFACE
    )
    :vars
    (
      ?auto_31837 - HOIST
      ?auto_31838 - PLACE
      ?auto_31828 - PLACE
      ?auto_31831 - HOIST
      ?auto_31829 - SURFACE
      ?auto_31841 - PLACE
      ?auto_31840 - HOIST
      ?auto_31830 - SURFACE
      ?auto_31833 - SURFACE
      ?auto_31836 - SURFACE
      ?auto_31839 - SURFACE
      ?auto_31834 - SURFACE
      ?auto_31832 - SURFACE
      ?auto_31835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31837 ?auto_31838 ) ( IS-CRATE ?auto_31827 ) ( not ( = ?auto_31826 ?auto_31827 ) ) ( not ( = ?auto_31825 ?auto_31826 ) ) ( not ( = ?auto_31825 ?auto_31827 ) ) ( not ( = ?auto_31828 ?auto_31838 ) ) ( HOIST-AT ?auto_31831 ?auto_31828 ) ( not ( = ?auto_31837 ?auto_31831 ) ) ( SURFACE-AT ?auto_31827 ?auto_31828 ) ( ON ?auto_31827 ?auto_31829 ) ( CLEAR ?auto_31827 ) ( not ( = ?auto_31826 ?auto_31829 ) ) ( not ( = ?auto_31827 ?auto_31829 ) ) ( not ( = ?auto_31825 ?auto_31829 ) ) ( IS-CRATE ?auto_31826 ) ( not ( = ?auto_31841 ?auto_31838 ) ) ( not ( = ?auto_31828 ?auto_31841 ) ) ( HOIST-AT ?auto_31840 ?auto_31841 ) ( not ( = ?auto_31837 ?auto_31840 ) ) ( not ( = ?auto_31831 ?auto_31840 ) ) ( SURFACE-AT ?auto_31826 ?auto_31841 ) ( ON ?auto_31826 ?auto_31830 ) ( CLEAR ?auto_31826 ) ( not ( = ?auto_31826 ?auto_31830 ) ) ( not ( = ?auto_31827 ?auto_31830 ) ) ( not ( = ?auto_31825 ?auto_31830 ) ) ( not ( = ?auto_31829 ?auto_31830 ) ) ( IS-CRATE ?auto_31825 ) ( not ( = ?auto_31833 ?auto_31825 ) ) ( not ( = ?auto_31826 ?auto_31833 ) ) ( not ( = ?auto_31827 ?auto_31833 ) ) ( not ( = ?auto_31829 ?auto_31833 ) ) ( not ( = ?auto_31830 ?auto_31833 ) ) ( SURFACE-AT ?auto_31825 ?auto_31841 ) ( ON ?auto_31825 ?auto_31836 ) ( CLEAR ?auto_31825 ) ( not ( = ?auto_31826 ?auto_31836 ) ) ( not ( = ?auto_31827 ?auto_31836 ) ) ( not ( = ?auto_31825 ?auto_31836 ) ) ( not ( = ?auto_31829 ?auto_31836 ) ) ( not ( = ?auto_31830 ?auto_31836 ) ) ( not ( = ?auto_31833 ?auto_31836 ) ) ( IS-CRATE ?auto_31833 ) ( not ( = ?auto_31839 ?auto_31833 ) ) ( not ( = ?auto_31826 ?auto_31839 ) ) ( not ( = ?auto_31827 ?auto_31839 ) ) ( not ( = ?auto_31825 ?auto_31839 ) ) ( not ( = ?auto_31829 ?auto_31839 ) ) ( not ( = ?auto_31830 ?auto_31839 ) ) ( not ( = ?auto_31836 ?auto_31839 ) ) ( AVAILABLE ?auto_31831 ) ( SURFACE-AT ?auto_31833 ?auto_31828 ) ( ON ?auto_31833 ?auto_31834 ) ( CLEAR ?auto_31833 ) ( not ( = ?auto_31826 ?auto_31834 ) ) ( not ( = ?auto_31827 ?auto_31834 ) ) ( not ( = ?auto_31825 ?auto_31834 ) ) ( not ( = ?auto_31829 ?auto_31834 ) ) ( not ( = ?auto_31830 ?auto_31834 ) ) ( not ( = ?auto_31833 ?auto_31834 ) ) ( not ( = ?auto_31836 ?auto_31834 ) ) ( not ( = ?auto_31839 ?auto_31834 ) ) ( SURFACE-AT ?auto_31832 ?auto_31838 ) ( CLEAR ?auto_31832 ) ( IS-CRATE ?auto_31839 ) ( not ( = ?auto_31832 ?auto_31839 ) ) ( not ( = ?auto_31826 ?auto_31832 ) ) ( not ( = ?auto_31827 ?auto_31832 ) ) ( not ( = ?auto_31825 ?auto_31832 ) ) ( not ( = ?auto_31829 ?auto_31832 ) ) ( not ( = ?auto_31830 ?auto_31832 ) ) ( not ( = ?auto_31833 ?auto_31832 ) ) ( not ( = ?auto_31836 ?auto_31832 ) ) ( not ( = ?auto_31834 ?auto_31832 ) ) ( AVAILABLE ?auto_31837 ) ( TRUCK-AT ?auto_31835 ?auto_31841 ) ( LIFTING ?auto_31840 ?auto_31839 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31826 ?auto_31827 )
      ( MAKE-2CRATE-VERIFY ?auto_31825 ?auto_31826 ?auto_31827 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31842 - SURFACE
      ?auto_31843 - SURFACE
      ?auto_31844 - SURFACE
      ?auto_31845 - SURFACE
    )
    :vars
    (
      ?auto_31848 - HOIST
      ?auto_31857 - PLACE
      ?auto_31853 - PLACE
      ?auto_31855 - HOIST
      ?auto_31856 - SURFACE
      ?auto_31851 - PLACE
      ?auto_31854 - HOIST
      ?auto_31858 - SURFACE
      ?auto_31846 - SURFACE
      ?auto_31849 - SURFACE
      ?auto_31850 - SURFACE
      ?auto_31852 - SURFACE
      ?auto_31847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31848 ?auto_31857 ) ( IS-CRATE ?auto_31845 ) ( not ( = ?auto_31844 ?auto_31845 ) ) ( not ( = ?auto_31843 ?auto_31844 ) ) ( not ( = ?auto_31843 ?auto_31845 ) ) ( not ( = ?auto_31853 ?auto_31857 ) ) ( HOIST-AT ?auto_31855 ?auto_31853 ) ( not ( = ?auto_31848 ?auto_31855 ) ) ( SURFACE-AT ?auto_31845 ?auto_31853 ) ( ON ?auto_31845 ?auto_31856 ) ( CLEAR ?auto_31845 ) ( not ( = ?auto_31844 ?auto_31856 ) ) ( not ( = ?auto_31845 ?auto_31856 ) ) ( not ( = ?auto_31843 ?auto_31856 ) ) ( IS-CRATE ?auto_31844 ) ( not ( = ?auto_31851 ?auto_31857 ) ) ( not ( = ?auto_31853 ?auto_31851 ) ) ( HOIST-AT ?auto_31854 ?auto_31851 ) ( not ( = ?auto_31848 ?auto_31854 ) ) ( not ( = ?auto_31855 ?auto_31854 ) ) ( SURFACE-AT ?auto_31844 ?auto_31851 ) ( ON ?auto_31844 ?auto_31858 ) ( CLEAR ?auto_31844 ) ( not ( = ?auto_31844 ?auto_31858 ) ) ( not ( = ?auto_31845 ?auto_31858 ) ) ( not ( = ?auto_31843 ?auto_31858 ) ) ( not ( = ?auto_31856 ?auto_31858 ) ) ( IS-CRATE ?auto_31843 ) ( not ( = ?auto_31842 ?auto_31843 ) ) ( not ( = ?auto_31844 ?auto_31842 ) ) ( not ( = ?auto_31845 ?auto_31842 ) ) ( not ( = ?auto_31856 ?auto_31842 ) ) ( not ( = ?auto_31858 ?auto_31842 ) ) ( SURFACE-AT ?auto_31843 ?auto_31851 ) ( ON ?auto_31843 ?auto_31846 ) ( CLEAR ?auto_31843 ) ( not ( = ?auto_31844 ?auto_31846 ) ) ( not ( = ?auto_31845 ?auto_31846 ) ) ( not ( = ?auto_31843 ?auto_31846 ) ) ( not ( = ?auto_31856 ?auto_31846 ) ) ( not ( = ?auto_31858 ?auto_31846 ) ) ( not ( = ?auto_31842 ?auto_31846 ) ) ( IS-CRATE ?auto_31842 ) ( not ( = ?auto_31849 ?auto_31842 ) ) ( not ( = ?auto_31844 ?auto_31849 ) ) ( not ( = ?auto_31845 ?auto_31849 ) ) ( not ( = ?auto_31843 ?auto_31849 ) ) ( not ( = ?auto_31856 ?auto_31849 ) ) ( not ( = ?auto_31858 ?auto_31849 ) ) ( not ( = ?auto_31846 ?auto_31849 ) ) ( AVAILABLE ?auto_31855 ) ( SURFACE-AT ?auto_31842 ?auto_31853 ) ( ON ?auto_31842 ?auto_31850 ) ( CLEAR ?auto_31842 ) ( not ( = ?auto_31844 ?auto_31850 ) ) ( not ( = ?auto_31845 ?auto_31850 ) ) ( not ( = ?auto_31843 ?auto_31850 ) ) ( not ( = ?auto_31856 ?auto_31850 ) ) ( not ( = ?auto_31858 ?auto_31850 ) ) ( not ( = ?auto_31842 ?auto_31850 ) ) ( not ( = ?auto_31846 ?auto_31850 ) ) ( not ( = ?auto_31849 ?auto_31850 ) ) ( SURFACE-AT ?auto_31852 ?auto_31857 ) ( CLEAR ?auto_31852 ) ( IS-CRATE ?auto_31849 ) ( not ( = ?auto_31852 ?auto_31849 ) ) ( not ( = ?auto_31844 ?auto_31852 ) ) ( not ( = ?auto_31845 ?auto_31852 ) ) ( not ( = ?auto_31843 ?auto_31852 ) ) ( not ( = ?auto_31856 ?auto_31852 ) ) ( not ( = ?auto_31858 ?auto_31852 ) ) ( not ( = ?auto_31842 ?auto_31852 ) ) ( not ( = ?auto_31846 ?auto_31852 ) ) ( not ( = ?auto_31850 ?auto_31852 ) ) ( AVAILABLE ?auto_31848 ) ( TRUCK-AT ?auto_31847 ?auto_31851 ) ( LIFTING ?auto_31854 ?auto_31849 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31843 ?auto_31844 ?auto_31845 )
      ( MAKE-3CRATE-VERIFY ?auto_31842 ?auto_31843 ?auto_31844 ?auto_31845 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31859 - SURFACE
      ?auto_31860 - SURFACE
      ?auto_31861 - SURFACE
      ?auto_31862 - SURFACE
      ?auto_31863 - SURFACE
    )
    :vars
    (
      ?auto_31866 - HOIST
      ?auto_31874 - PLACE
      ?auto_31870 - PLACE
      ?auto_31872 - HOIST
      ?auto_31873 - SURFACE
      ?auto_31868 - PLACE
      ?auto_31871 - HOIST
      ?auto_31875 - SURFACE
      ?auto_31864 - SURFACE
      ?auto_31867 - SURFACE
      ?auto_31869 - SURFACE
      ?auto_31865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31866 ?auto_31874 ) ( IS-CRATE ?auto_31863 ) ( not ( = ?auto_31862 ?auto_31863 ) ) ( not ( = ?auto_31861 ?auto_31862 ) ) ( not ( = ?auto_31861 ?auto_31863 ) ) ( not ( = ?auto_31870 ?auto_31874 ) ) ( HOIST-AT ?auto_31872 ?auto_31870 ) ( not ( = ?auto_31866 ?auto_31872 ) ) ( SURFACE-AT ?auto_31863 ?auto_31870 ) ( ON ?auto_31863 ?auto_31873 ) ( CLEAR ?auto_31863 ) ( not ( = ?auto_31862 ?auto_31873 ) ) ( not ( = ?auto_31863 ?auto_31873 ) ) ( not ( = ?auto_31861 ?auto_31873 ) ) ( IS-CRATE ?auto_31862 ) ( not ( = ?auto_31868 ?auto_31874 ) ) ( not ( = ?auto_31870 ?auto_31868 ) ) ( HOIST-AT ?auto_31871 ?auto_31868 ) ( not ( = ?auto_31866 ?auto_31871 ) ) ( not ( = ?auto_31872 ?auto_31871 ) ) ( SURFACE-AT ?auto_31862 ?auto_31868 ) ( ON ?auto_31862 ?auto_31875 ) ( CLEAR ?auto_31862 ) ( not ( = ?auto_31862 ?auto_31875 ) ) ( not ( = ?auto_31863 ?auto_31875 ) ) ( not ( = ?auto_31861 ?auto_31875 ) ) ( not ( = ?auto_31873 ?auto_31875 ) ) ( IS-CRATE ?auto_31861 ) ( not ( = ?auto_31860 ?auto_31861 ) ) ( not ( = ?auto_31862 ?auto_31860 ) ) ( not ( = ?auto_31863 ?auto_31860 ) ) ( not ( = ?auto_31873 ?auto_31860 ) ) ( not ( = ?auto_31875 ?auto_31860 ) ) ( SURFACE-AT ?auto_31861 ?auto_31868 ) ( ON ?auto_31861 ?auto_31864 ) ( CLEAR ?auto_31861 ) ( not ( = ?auto_31862 ?auto_31864 ) ) ( not ( = ?auto_31863 ?auto_31864 ) ) ( not ( = ?auto_31861 ?auto_31864 ) ) ( not ( = ?auto_31873 ?auto_31864 ) ) ( not ( = ?auto_31875 ?auto_31864 ) ) ( not ( = ?auto_31860 ?auto_31864 ) ) ( IS-CRATE ?auto_31860 ) ( not ( = ?auto_31859 ?auto_31860 ) ) ( not ( = ?auto_31862 ?auto_31859 ) ) ( not ( = ?auto_31863 ?auto_31859 ) ) ( not ( = ?auto_31861 ?auto_31859 ) ) ( not ( = ?auto_31873 ?auto_31859 ) ) ( not ( = ?auto_31875 ?auto_31859 ) ) ( not ( = ?auto_31864 ?auto_31859 ) ) ( AVAILABLE ?auto_31872 ) ( SURFACE-AT ?auto_31860 ?auto_31870 ) ( ON ?auto_31860 ?auto_31867 ) ( CLEAR ?auto_31860 ) ( not ( = ?auto_31862 ?auto_31867 ) ) ( not ( = ?auto_31863 ?auto_31867 ) ) ( not ( = ?auto_31861 ?auto_31867 ) ) ( not ( = ?auto_31873 ?auto_31867 ) ) ( not ( = ?auto_31875 ?auto_31867 ) ) ( not ( = ?auto_31860 ?auto_31867 ) ) ( not ( = ?auto_31864 ?auto_31867 ) ) ( not ( = ?auto_31859 ?auto_31867 ) ) ( SURFACE-AT ?auto_31869 ?auto_31874 ) ( CLEAR ?auto_31869 ) ( IS-CRATE ?auto_31859 ) ( not ( = ?auto_31869 ?auto_31859 ) ) ( not ( = ?auto_31862 ?auto_31869 ) ) ( not ( = ?auto_31863 ?auto_31869 ) ) ( not ( = ?auto_31861 ?auto_31869 ) ) ( not ( = ?auto_31873 ?auto_31869 ) ) ( not ( = ?auto_31875 ?auto_31869 ) ) ( not ( = ?auto_31860 ?auto_31869 ) ) ( not ( = ?auto_31864 ?auto_31869 ) ) ( not ( = ?auto_31867 ?auto_31869 ) ) ( AVAILABLE ?auto_31866 ) ( TRUCK-AT ?auto_31865 ?auto_31868 ) ( LIFTING ?auto_31871 ?auto_31859 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31861 ?auto_31862 ?auto_31863 )
      ( MAKE-4CRATE-VERIFY ?auto_31859 ?auto_31860 ?auto_31861 ?auto_31862 ?auto_31863 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31876 - SURFACE
      ?auto_31877 - SURFACE
      ?auto_31878 - SURFACE
      ?auto_31879 - SURFACE
      ?auto_31880 - SURFACE
      ?auto_31881 - SURFACE
    )
    :vars
    (
      ?auto_31884 - HOIST
      ?auto_31891 - PLACE
      ?auto_31887 - PLACE
      ?auto_31889 - HOIST
      ?auto_31890 - SURFACE
      ?auto_31886 - PLACE
      ?auto_31888 - HOIST
      ?auto_31892 - SURFACE
      ?auto_31882 - SURFACE
      ?auto_31885 - SURFACE
      ?auto_31883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31884 ?auto_31891 ) ( IS-CRATE ?auto_31881 ) ( not ( = ?auto_31880 ?auto_31881 ) ) ( not ( = ?auto_31879 ?auto_31880 ) ) ( not ( = ?auto_31879 ?auto_31881 ) ) ( not ( = ?auto_31887 ?auto_31891 ) ) ( HOIST-AT ?auto_31889 ?auto_31887 ) ( not ( = ?auto_31884 ?auto_31889 ) ) ( SURFACE-AT ?auto_31881 ?auto_31887 ) ( ON ?auto_31881 ?auto_31890 ) ( CLEAR ?auto_31881 ) ( not ( = ?auto_31880 ?auto_31890 ) ) ( not ( = ?auto_31881 ?auto_31890 ) ) ( not ( = ?auto_31879 ?auto_31890 ) ) ( IS-CRATE ?auto_31880 ) ( not ( = ?auto_31886 ?auto_31891 ) ) ( not ( = ?auto_31887 ?auto_31886 ) ) ( HOIST-AT ?auto_31888 ?auto_31886 ) ( not ( = ?auto_31884 ?auto_31888 ) ) ( not ( = ?auto_31889 ?auto_31888 ) ) ( SURFACE-AT ?auto_31880 ?auto_31886 ) ( ON ?auto_31880 ?auto_31892 ) ( CLEAR ?auto_31880 ) ( not ( = ?auto_31880 ?auto_31892 ) ) ( not ( = ?auto_31881 ?auto_31892 ) ) ( not ( = ?auto_31879 ?auto_31892 ) ) ( not ( = ?auto_31890 ?auto_31892 ) ) ( IS-CRATE ?auto_31879 ) ( not ( = ?auto_31878 ?auto_31879 ) ) ( not ( = ?auto_31880 ?auto_31878 ) ) ( not ( = ?auto_31881 ?auto_31878 ) ) ( not ( = ?auto_31890 ?auto_31878 ) ) ( not ( = ?auto_31892 ?auto_31878 ) ) ( SURFACE-AT ?auto_31879 ?auto_31886 ) ( ON ?auto_31879 ?auto_31882 ) ( CLEAR ?auto_31879 ) ( not ( = ?auto_31880 ?auto_31882 ) ) ( not ( = ?auto_31881 ?auto_31882 ) ) ( not ( = ?auto_31879 ?auto_31882 ) ) ( not ( = ?auto_31890 ?auto_31882 ) ) ( not ( = ?auto_31892 ?auto_31882 ) ) ( not ( = ?auto_31878 ?auto_31882 ) ) ( IS-CRATE ?auto_31878 ) ( not ( = ?auto_31877 ?auto_31878 ) ) ( not ( = ?auto_31880 ?auto_31877 ) ) ( not ( = ?auto_31881 ?auto_31877 ) ) ( not ( = ?auto_31879 ?auto_31877 ) ) ( not ( = ?auto_31890 ?auto_31877 ) ) ( not ( = ?auto_31892 ?auto_31877 ) ) ( not ( = ?auto_31882 ?auto_31877 ) ) ( AVAILABLE ?auto_31889 ) ( SURFACE-AT ?auto_31878 ?auto_31887 ) ( ON ?auto_31878 ?auto_31885 ) ( CLEAR ?auto_31878 ) ( not ( = ?auto_31880 ?auto_31885 ) ) ( not ( = ?auto_31881 ?auto_31885 ) ) ( not ( = ?auto_31879 ?auto_31885 ) ) ( not ( = ?auto_31890 ?auto_31885 ) ) ( not ( = ?auto_31892 ?auto_31885 ) ) ( not ( = ?auto_31878 ?auto_31885 ) ) ( not ( = ?auto_31882 ?auto_31885 ) ) ( not ( = ?auto_31877 ?auto_31885 ) ) ( SURFACE-AT ?auto_31876 ?auto_31891 ) ( CLEAR ?auto_31876 ) ( IS-CRATE ?auto_31877 ) ( not ( = ?auto_31876 ?auto_31877 ) ) ( not ( = ?auto_31880 ?auto_31876 ) ) ( not ( = ?auto_31881 ?auto_31876 ) ) ( not ( = ?auto_31879 ?auto_31876 ) ) ( not ( = ?auto_31890 ?auto_31876 ) ) ( not ( = ?auto_31892 ?auto_31876 ) ) ( not ( = ?auto_31878 ?auto_31876 ) ) ( not ( = ?auto_31882 ?auto_31876 ) ) ( not ( = ?auto_31885 ?auto_31876 ) ) ( AVAILABLE ?auto_31884 ) ( TRUCK-AT ?auto_31883 ?auto_31886 ) ( LIFTING ?auto_31888 ?auto_31877 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31879 ?auto_31880 ?auto_31881 )
      ( MAKE-5CRATE-VERIFY ?auto_31876 ?auto_31877 ?auto_31878 ?auto_31879 ?auto_31880 ?auto_31881 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31893 - SURFACE
      ?auto_31894 - SURFACE
    )
    :vars
    (
      ?auto_31897 - HOIST
      ?auto_31908 - PLACE
      ?auto_31904 - SURFACE
      ?auto_31903 - PLACE
      ?auto_31906 - HOIST
      ?auto_31907 - SURFACE
      ?auto_31900 - PLACE
      ?auto_31905 - HOIST
      ?auto_31909 - SURFACE
      ?auto_31902 - SURFACE
      ?auto_31895 - SURFACE
      ?auto_31898 - SURFACE
      ?auto_31899 - SURFACE
      ?auto_31901 - SURFACE
      ?auto_31896 - TRUCK
      ?auto_31910 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31897 ?auto_31908 ) ( IS-CRATE ?auto_31894 ) ( not ( = ?auto_31893 ?auto_31894 ) ) ( not ( = ?auto_31904 ?auto_31893 ) ) ( not ( = ?auto_31904 ?auto_31894 ) ) ( not ( = ?auto_31903 ?auto_31908 ) ) ( HOIST-AT ?auto_31906 ?auto_31903 ) ( not ( = ?auto_31897 ?auto_31906 ) ) ( SURFACE-AT ?auto_31894 ?auto_31903 ) ( ON ?auto_31894 ?auto_31907 ) ( CLEAR ?auto_31894 ) ( not ( = ?auto_31893 ?auto_31907 ) ) ( not ( = ?auto_31894 ?auto_31907 ) ) ( not ( = ?auto_31904 ?auto_31907 ) ) ( IS-CRATE ?auto_31893 ) ( not ( = ?auto_31900 ?auto_31908 ) ) ( not ( = ?auto_31903 ?auto_31900 ) ) ( HOIST-AT ?auto_31905 ?auto_31900 ) ( not ( = ?auto_31897 ?auto_31905 ) ) ( not ( = ?auto_31906 ?auto_31905 ) ) ( SURFACE-AT ?auto_31893 ?auto_31900 ) ( ON ?auto_31893 ?auto_31909 ) ( CLEAR ?auto_31893 ) ( not ( = ?auto_31893 ?auto_31909 ) ) ( not ( = ?auto_31894 ?auto_31909 ) ) ( not ( = ?auto_31904 ?auto_31909 ) ) ( not ( = ?auto_31907 ?auto_31909 ) ) ( IS-CRATE ?auto_31904 ) ( not ( = ?auto_31902 ?auto_31904 ) ) ( not ( = ?auto_31893 ?auto_31902 ) ) ( not ( = ?auto_31894 ?auto_31902 ) ) ( not ( = ?auto_31907 ?auto_31902 ) ) ( not ( = ?auto_31909 ?auto_31902 ) ) ( SURFACE-AT ?auto_31904 ?auto_31900 ) ( ON ?auto_31904 ?auto_31895 ) ( CLEAR ?auto_31904 ) ( not ( = ?auto_31893 ?auto_31895 ) ) ( not ( = ?auto_31894 ?auto_31895 ) ) ( not ( = ?auto_31904 ?auto_31895 ) ) ( not ( = ?auto_31907 ?auto_31895 ) ) ( not ( = ?auto_31909 ?auto_31895 ) ) ( not ( = ?auto_31902 ?auto_31895 ) ) ( IS-CRATE ?auto_31902 ) ( not ( = ?auto_31898 ?auto_31902 ) ) ( not ( = ?auto_31893 ?auto_31898 ) ) ( not ( = ?auto_31894 ?auto_31898 ) ) ( not ( = ?auto_31904 ?auto_31898 ) ) ( not ( = ?auto_31907 ?auto_31898 ) ) ( not ( = ?auto_31909 ?auto_31898 ) ) ( not ( = ?auto_31895 ?auto_31898 ) ) ( AVAILABLE ?auto_31906 ) ( SURFACE-AT ?auto_31902 ?auto_31903 ) ( ON ?auto_31902 ?auto_31899 ) ( CLEAR ?auto_31902 ) ( not ( = ?auto_31893 ?auto_31899 ) ) ( not ( = ?auto_31894 ?auto_31899 ) ) ( not ( = ?auto_31904 ?auto_31899 ) ) ( not ( = ?auto_31907 ?auto_31899 ) ) ( not ( = ?auto_31909 ?auto_31899 ) ) ( not ( = ?auto_31902 ?auto_31899 ) ) ( not ( = ?auto_31895 ?auto_31899 ) ) ( not ( = ?auto_31898 ?auto_31899 ) ) ( SURFACE-AT ?auto_31901 ?auto_31908 ) ( CLEAR ?auto_31901 ) ( IS-CRATE ?auto_31898 ) ( not ( = ?auto_31901 ?auto_31898 ) ) ( not ( = ?auto_31893 ?auto_31901 ) ) ( not ( = ?auto_31894 ?auto_31901 ) ) ( not ( = ?auto_31904 ?auto_31901 ) ) ( not ( = ?auto_31907 ?auto_31901 ) ) ( not ( = ?auto_31909 ?auto_31901 ) ) ( not ( = ?auto_31902 ?auto_31901 ) ) ( not ( = ?auto_31895 ?auto_31901 ) ) ( not ( = ?auto_31899 ?auto_31901 ) ) ( AVAILABLE ?auto_31897 ) ( TRUCK-AT ?auto_31896 ?auto_31900 ) ( AVAILABLE ?auto_31905 ) ( SURFACE-AT ?auto_31898 ?auto_31900 ) ( ON ?auto_31898 ?auto_31910 ) ( CLEAR ?auto_31898 ) ( not ( = ?auto_31893 ?auto_31910 ) ) ( not ( = ?auto_31894 ?auto_31910 ) ) ( not ( = ?auto_31904 ?auto_31910 ) ) ( not ( = ?auto_31907 ?auto_31910 ) ) ( not ( = ?auto_31909 ?auto_31910 ) ) ( not ( = ?auto_31902 ?auto_31910 ) ) ( not ( = ?auto_31895 ?auto_31910 ) ) ( not ( = ?auto_31898 ?auto_31910 ) ) ( not ( = ?auto_31899 ?auto_31910 ) ) ( not ( = ?auto_31901 ?auto_31910 ) ) )
    :subtasks
    ( ( !LIFT ?auto_31905 ?auto_31898 ?auto_31910 ?auto_31900 )
      ( MAKE-2CRATE ?auto_31904 ?auto_31893 ?auto_31894 )
      ( MAKE-1CRATE-VERIFY ?auto_31893 ?auto_31894 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_31911 - SURFACE
      ?auto_31912 - SURFACE
      ?auto_31913 - SURFACE
    )
    :vars
    (
      ?auto_31916 - HOIST
      ?auto_31923 - PLACE
      ?auto_31924 - PLACE
      ?auto_31918 - HOIST
      ?auto_31921 - SURFACE
      ?auto_31926 - PLACE
      ?auto_31922 - HOIST
      ?auto_31914 - SURFACE
      ?auto_31915 - SURFACE
      ?auto_31927 - SURFACE
      ?auto_31925 - SURFACE
      ?auto_31919 - SURFACE
      ?auto_31917 - SURFACE
      ?auto_31920 - TRUCK
      ?auto_31928 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31916 ?auto_31923 ) ( IS-CRATE ?auto_31913 ) ( not ( = ?auto_31912 ?auto_31913 ) ) ( not ( = ?auto_31911 ?auto_31912 ) ) ( not ( = ?auto_31911 ?auto_31913 ) ) ( not ( = ?auto_31924 ?auto_31923 ) ) ( HOIST-AT ?auto_31918 ?auto_31924 ) ( not ( = ?auto_31916 ?auto_31918 ) ) ( SURFACE-AT ?auto_31913 ?auto_31924 ) ( ON ?auto_31913 ?auto_31921 ) ( CLEAR ?auto_31913 ) ( not ( = ?auto_31912 ?auto_31921 ) ) ( not ( = ?auto_31913 ?auto_31921 ) ) ( not ( = ?auto_31911 ?auto_31921 ) ) ( IS-CRATE ?auto_31912 ) ( not ( = ?auto_31926 ?auto_31923 ) ) ( not ( = ?auto_31924 ?auto_31926 ) ) ( HOIST-AT ?auto_31922 ?auto_31926 ) ( not ( = ?auto_31916 ?auto_31922 ) ) ( not ( = ?auto_31918 ?auto_31922 ) ) ( SURFACE-AT ?auto_31912 ?auto_31926 ) ( ON ?auto_31912 ?auto_31914 ) ( CLEAR ?auto_31912 ) ( not ( = ?auto_31912 ?auto_31914 ) ) ( not ( = ?auto_31913 ?auto_31914 ) ) ( not ( = ?auto_31911 ?auto_31914 ) ) ( not ( = ?auto_31921 ?auto_31914 ) ) ( IS-CRATE ?auto_31911 ) ( not ( = ?auto_31915 ?auto_31911 ) ) ( not ( = ?auto_31912 ?auto_31915 ) ) ( not ( = ?auto_31913 ?auto_31915 ) ) ( not ( = ?auto_31921 ?auto_31915 ) ) ( not ( = ?auto_31914 ?auto_31915 ) ) ( SURFACE-AT ?auto_31911 ?auto_31926 ) ( ON ?auto_31911 ?auto_31927 ) ( CLEAR ?auto_31911 ) ( not ( = ?auto_31912 ?auto_31927 ) ) ( not ( = ?auto_31913 ?auto_31927 ) ) ( not ( = ?auto_31911 ?auto_31927 ) ) ( not ( = ?auto_31921 ?auto_31927 ) ) ( not ( = ?auto_31914 ?auto_31927 ) ) ( not ( = ?auto_31915 ?auto_31927 ) ) ( IS-CRATE ?auto_31915 ) ( not ( = ?auto_31925 ?auto_31915 ) ) ( not ( = ?auto_31912 ?auto_31925 ) ) ( not ( = ?auto_31913 ?auto_31925 ) ) ( not ( = ?auto_31911 ?auto_31925 ) ) ( not ( = ?auto_31921 ?auto_31925 ) ) ( not ( = ?auto_31914 ?auto_31925 ) ) ( not ( = ?auto_31927 ?auto_31925 ) ) ( AVAILABLE ?auto_31918 ) ( SURFACE-AT ?auto_31915 ?auto_31924 ) ( ON ?auto_31915 ?auto_31919 ) ( CLEAR ?auto_31915 ) ( not ( = ?auto_31912 ?auto_31919 ) ) ( not ( = ?auto_31913 ?auto_31919 ) ) ( not ( = ?auto_31911 ?auto_31919 ) ) ( not ( = ?auto_31921 ?auto_31919 ) ) ( not ( = ?auto_31914 ?auto_31919 ) ) ( not ( = ?auto_31915 ?auto_31919 ) ) ( not ( = ?auto_31927 ?auto_31919 ) ) ( not ( = ?auto_31925 ?auto_31919 ) ) ( SURFACE-AT ?auto_31917 ?auto_31923 ) ( CLEAR ?auto_31917 ) ( IS-CRATE ?auto_31925 ) ( not ( = ?auto_31917 ?auto_31925 ) ) ( not ( = ?auto_31912 ?auto_31917 ) ) ( not ( = ?auto_31913 ?auto_31917 ) ) ( not ( = ?auto_31911 ?auto_31917 ) ) ( not ( = ?auto_31921 ?auto_31917 ) ) ( not ( = ?auto_31914 ?auto_31917 ) ) ( not ( = ?auto_31915 ?auto_31917 ) ) ( not ( = ?auto_31927 ?auto_31917 ) ) ( not ( = ?auto_31919 ?auto_31917 ) ) ( AVAILABLE ?auto_31916 ) ( TRUCK-AT ?auto_31920 ?auto_31926 ) ( AVAILABLE ?auto_31922 ) ( SURFACE-AT ?auto_31925 ?auto_31926 ) ( ON ?auto_31925 ?auto_31928 ) ( CLEAR ?auto_31925 ) ( not ( = ?auto_31912 ?auto_31928 ) ) ( not ( = ?auto_31913 ?auto_31928 ) ) ( not ( = ?auto_31911 ?auto_31928 ) ) ( not ( = ?auto_31921 ?auto_31928 ) ) ( not ( = ?auto_31914 ?auto_31928 ) ) ( not ( = ?auto_31915 ?auto_31928 ) ) ( not ( = ?auto_31927 ?auto_31928 ) ) ( not ( = ?auto_31925 ?auto_31928 ) ) ( not ( = ?auto_31919 ?auto_31928 ) ) ( not ( = ?auto_31917 ?auto_31928 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_31912 ?auto_31913 )
      ( MAKE-2CRATE-VERIFY ?auto_31911 ?auto_31912 ?auto_31913 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_31929 - SURFACE
      ?auto_31930 - SURFACE
      ?auto_31931 - SURFACE
      ?auto_31932 - SURFACE
    )
    :vars
    (
      ?auto_31937 - HOIST
      ?auto_31942 - PLACE
      ?auto_31940 - PLACE
      ?auto_31933 - HOIST
      ?auto_31946 - SURFACE
      ?auto_31934 - PLACE
      ?auto_31941 - HOIST
      ?auto_31936 - SURFACE
      ?auto_31938 - SURFACE
      ?auto_31939 - SURFACE
      ?auto_31935 - SURFACE
      ?auto_31944 - SURFACE
      ?auto_31943 - TRUCK
      ?auto_31945 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31937 ?auto_31942 ) ( IS-CRATE ?auto_31932 ) ( not ( = ?auto_31931 ?auto_31932 ) ) ( not ( = ?auto_31930 ?auto_31931 ) ) ( not ( = ?auto_31930 ?auto_31932 ) ) ( not ( = ?auto_31940 ?auto_31942 ) ) ( HOIST-AT ?auto_31933 ?auto_31940 ) ( not ( = ?auto_31937 ?auto_31933 ) ) ( SURFACE-AT ?auto_31932 ?auto_31940 ) ( ON ?auto_31932 ?auto_31946 ) ( CLEAR ?auto_31932 ) ( not ( = ?auto_31931 ?auto_31946 ) ) ( not ( = ?auto_31932 ?auto_31946 ) ) ( not ( = ?auto_31930 ?auto_31946 ) ) ( IS-CRATE ?auto_31931 ) ( not ( = ?auto_31934 ?auto_31942 ) ) ( not ( = ?auto_31940 ?auto_31934 ) ) ( HOIST-AT ?auto_31941 ?auto_31934 ) ( not ( = ?auto_31937 ?auto_31941 ) ) ( not ( = ?auto_31933 ?auto_31941 ) ) ( SURFACE-AT ?auto_31931 ?auto_31934 ) ( ON ?auto_31931 ?auto_31936 ) ( CLEAR ?auto_31931 ) ( not ( = ?auto_31931 ?auto_31936 ) ) ( not ( = ?auto_31932 ?auto_31936 ) ) ( not ( = ?auto_31930 ?auto_31936 ) ) ( not ( = ?auto_31946 ?auto_31936 ) ) ( IS-CRATE ?auto_31930 ) ( not ( = ?auto_31929 ?auto_31930 ) ) ( not ( = ?auto_31931 ?auto_31929 ) ) ( not ( = ?auto_31932 ?auto_31929 ) ) ( not ( = ?auto_31946 ?auto_31929 ) ) ( not ( = ?auto_31936 ?auto_31929 ) ) ( SURFACE-AT ?auto_31930 ?auto_31934 ) ( ON ?auto_31930 ?auto_31938 ) ( CLEAR ?auto_31930 ) ( not ( = ?auto_31931 ?auto_31938 ) ) ( not ( = ?auto_31932 ?auto_31938 ) ) ( not ( = ?auto_31930 ?auto_31938 ) ) ( not ( = ?auto_31946 ?auto_31938 ) ) ( not ( = ?auto_31936 ?auto_31938 ) ) ( not ( = ?auto_31929 ?auto_31938 ) ) ( IS-CRATE ?auto_31929 ) ( not ( = ?auto_31939 ?auto_31929 ) ) ( not ( = ?auto_31931 ?auto_31939 ) ) ( not ( = ?auto_31932 ?auto_31939 ) ) ( not ( = ?auto_31930 ?auto_31939 ) ) ( not ( = ?auto_31946 ?auto_31939 ) ) ( not ( = ?auto_31936 ?auto_31939 ) ) ( not ( = ?auto_31938 ?auto_31939 ) ) ( AVAILABLE ?auto_31933 ) ( SURFACE-AT ?auto_31929 ?auto_31940 ) ( ON ?auto_31929 ?auto_31935 ) ( CLEAR ?auto_31929 ) ( not ( = ?auto_31931 ?auto_31935 ) ) ( not ( = ?auto_31932 ?auto_31935 ) ) ( not ( = ?auto_31930 ?auto_31935 ) ) ( not ( = ?auto_31946 ?auto_31935 ) ) ( not ( = ?auto_31936 ?auto_31935 ) ) ( not ( = ?auto_31929 ?auto_31935 ) ) ( not ( = ?auto_31938 ?auto_31935 ) ) ( not ( = ?auto_31939 ?auto_31935 ) ) ( SURFACE-AT ?auto_31944 ?auto_31942 ) ( CLEAR ?auto_31944 ) ( IS-CRATE ?auto_31939 ) ( not ( = ?auto_31944 ?auto_31939 ) ) ( not ( = ?auto_31931 ?auto_31944 ) ) ( not ( = ?auto_31932 ?auto_31944 ) ) ( not ( = ?auto_31930 ?auto_31944 ) ) ( not ( = ?auto_31946 ?auto_31944 ) ) ( not ( = ?auto_31936 ?auto_31944 ) ) ( not ( = ?auto_31929 ?auto_31944 ) ) ( not ( = ?auto_31938 ?auto_31944 ) ) ( not ( = ?auto_31935 ?auto_31944 ) ) ( AVAILABLE ?auto_31937 ) ( TRUCK-AT ?auto_31943 ?auto_31934 ) ( AVAILABLE ?auto_31941 ) ( SURFACE-AT ?auto_31939 ?auto_31934 ) ( ON ?auto_31939 ?auto_31945 ) ( CLEAR ?auto_31939 ) ( not ( = ?auto_31931 ?auto_31945 ) ) ( not ( = ?auto_31932 ?auto_31945 ) ) ( not ( = ?auto_31930 ?auto_31945 ) ) ( not ( = ?auto_31946 ?auto_31945 ) ) ( not ( = ?auto_31936 ?auto_31945 ) ) ( not ( = ?auto_31929 ?auto_31945 ) ) ( not ( = ?auto_31938 ?auto_31945 ) ) ( not ( = ?auto_31939 ?auto_31945 ) ) ( not ( = ?auto_31935 ?auto_31945 ) ) ( not ( = ?auto_31944 ?auto_31945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31930 ?auto_31931 ?auto_31932 )
      ( MAKE-3CRATE-VERIFY ?auto_31929 ?auto_31930 ?auto_31931 ?auto_31932 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_31947 - SURFACE
      ?auto_31948 - SURFACE
      ?auto_31949 - SURFACE
      ?auto_31950 - SURFACE
      ?auto_31951 - SURFACE
    )
    :vars
    (
      ?auto_31956 - HOIST
      ?auto_31960 - PLACE
      ?auto_31958 - PLACE
      ?auto_31952 - HOIST
      ?auto_31964 - SURFACE
      ?auto_31953 - PLACE
      ?auto_31959 - HOIST
      ?auto_31955 - SURFACE
      ?auto_31957 - SURFACE
      ?auto_31954 - SURFACE
      ?auto_31962 - SURFACE
      ?auto_31961 - TRUCK
      ?auto_31963 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31956 ?auto_31960 ) ( IS-CRATE ?auto_31951 ) ( not ( = ?auto_31950 ?auto_31951 ) ) ( not ( = ?auto_31949 ?auto_31950 ) ) ( not ( = ?auto_31949 ?auto_31951 ) ) ( not ( = ?auto_31958 ?auto_31960 ) ) ( HOIST-AT ?auto_31952 ?auto_31958 ) ( not ( = ?auto_31956 ?auto_31952 ) ) ( SURFACE-AT ?auto_31951 ?auto_31958 ) ( ON ?auto_31951 ?auto_31964 ) ( CLEAR ?auto_31951 ) ( not ( = ?auto_31950 ?auto_31964 ) ) ( not ( = ?auto_31951 ?auto_31964 ) ) ( not ( = ?auto_31949 ?auto_31964 ) ) ( IS-CRATE ?auto_31950 ) ( not ( = ?auto_31953 ?auto_31960 ) ) ( not ( = ?auto_31958 ?auto_31953 ) ) ( HOIST-AT ?auto_31959 ?auto_31953 ) ( not ( = ?auto_31956 ?auto_31959 ) ) ( not ( = ?auto_31952 ?auto_31959 ) ) ( SURFACE-AT ?auto_31950 ?auto_31953 ) ( ON ?auto_31950 ?auto_31955 ) ( CLEAR ?auto_31950 ) ( not ( = ?auto_31950 ?auto_31955 ) ) ( not ( = ?auto_31951 ?auto_31955 ) ) ( not ( = ?auto_31949 ?auto_31955 ) ) ( not ( = ?auto_31964 ?auto_31955 ) ) ( IS-CRATE ?auto_31949 ) ( not ( = ?auto_31948 ?auto_31949 ) ) ( not ( = ?auto_31950 ?auto_31948 ) ) ( not ( = ?auto_31951 ?auto_31948 ) ) ( not ( = ?auto_31964 ?auto_31948 ) ) ( not ( = ?auto_31955 ?auto_31948 ) ) ( SURFACE-AT ?auto_31949 ?auto_31953 ) ( ON ?auto_31949 ?auto_31957 ) ( CLEAR ?auto_31949 ) ( not ( = ?auto_31950 ?auto_31957 ) ) ( not ( = ?auto_31951 ?auto_31957 ) ) ( not ( = ?auto_31949 ?auto_31957 ) ) ( not ( = ?auto_31964 ?auto_31957 ) ) ( not ( = ?auto_31955 ?auto_31957 ) ) ( not ( = ?auto_31948 ?auto_31957 ) ) ( IS-CRATE ?auto_31948 ) ( not ( = ?auto_31947 ?auto_31948 ) ) ( not ( = ?auto_31950 ?auto_31947 ) ) ( not ( = ?auto_31951 ?auto_31947 ) ) ( not ( = ?auto_31949 ?auto_31947 ) ) ( not ( = ?auto_31964 ?auto_31947 ) ) ( not ( = ?auto_31955 ?auto_31947 ) ) ( not ( = ?auto_31957 ?auto_31947 ) ) ( AVAILABLE ?auto_31952 ) ( SURFACE-AT ?auto_31948 ?auto_31958 ) ( ON ?auto_31948 ?auto_31954 ) ( CLEAR ?auto_31948 ) ( not ( = ?auto_31950 ?auto_31954 ) ) ( not ( = ?auto_31951 ?auto_31954 ) ) ( not ( = ?auto_31949 ?auto_31954 ) ) ( not ( = ?auto_31964 ?auto_31954 ) ) ( not ( = ?auto_31955 ?auto_31954 ) ) ( not ( = ?auto_31948 ?auto_31954 ) ) ( not ( = ?auto_31957 ?auto_31954 ) ) ( not ( = ?auto_31947 ?auto_31954 ) ) ( SURFACE-AT ?auto_31962 ?auto_31960 ) ( CLEAR ?auto_31962 ) ( IS-CRATE ?auto_31947 ) ( not ( = ?auto_31962 ?auto_31947 ) ) ( not ( = ?auto_31950 ?auto_31962 ) ) ( not ( = ?auto_31951 ?auto_31962 ) ) ( not ( = ?auto_31949 ?auto_31962 ) ) ( not ( = ?auto_31964 ?auto_31962 ) ) ( not ( = ?auto_31955 ?auto_31962 ) ) ( not ( = ?auto_31948 ?auto_31962 ) ) ( not ( = ?auto_31957 ?auto_31962 ) ) ( not ( = ?auto_31954 ?auto_31962 ) ) ( AVAILABLE ?auto_31956 ) ( TRUCK-AT ?auto_31961 ?auto_31953 ) ( AVAILABLE ?auto_31959 ) ( SURFACE-AT ?auto_31947 ?auto_31953 ) ( ON ?auto_31947 ?auto_31963 ) ( CLEAR ?auto_31947 ) ( not ( = ?auto_31950 ?auto_31963 ) ) ( not ( = ?auto_31951 ?auto_31963 ) ) ( not ( = ?auto_31949 ?auto_31963 ) ) ( not ( = ?auto_31964 ?auto_31963 ) ) ( not ( = ?auto_31955 ?auto_31963 ) ) ( not ( = ?auto_31948 ?auto_31963 ) ) ( not ( = ?auto_31957 ?auto_31963 ) ) ( not ( = ?auto_31947 ?auto_31963 ) ) ( not ( = ?auto_31954 ?auto_31963 ) ) ( not ( = ?auto_31962 ?auto_31963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31949 ?auto_31950 ?auto_31951 )
      ( MAKE-4CRATE-VERIFY ?auto_31947 ?auto_31948 ?auto_31949 ?auto_31950 ?auto_31951 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_31965 - SURFACE
      ?auto_31966 - SURFACE
      ?auto_31967 - SURFACE
      ?auto_31968 - SURFACE
      ?auto_31969 - SURFACE
      ?auto_31970 - SURFACE
    )
    :vars
    (
      ?auto_31975 - HOIST
      ?auto_31979 - PLACE
      ?auto_31977 - PLACE
      ?auto_31971 - HOIST
      ?auto_31982 - SURFACE
      ?auto_31972 - PLACE
      ?auto_31978 - HOIST
      ?auto_31974 - SURFACE
      ?auto_31976 - SURFACE
      ?auto_31973 - SURFACE
      ?auto_31980 - TRUCK
      ?auto_31981 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31975 ?auto_31979 ) ( IS-CRATE ?auto_31970 ) ( not ( = ?auto_31969 ?auto_31970 ) ) ( not ( = ?auto_31968 ?auto_31969 ) ) ( not ( = ?auto_31968 ?auto_31970 ) ) ( not ( = ?auto_31977 ?auto_31979 ) ) ( HOIST-AT ?auto_31971 ?auto_31977 ) ( not ( = ?auto_31975 ?auto_31971 ) ) ( SURFACE-AT ?auto_31970 ?auto_31977 ) ( ON ?auto_31970 ?auto_31982 ) ( CLEAR ?auto_31970 ) ( not ( = ?auto_31969 ?auto_31982 ) ) ( not ( = ?auto_31970 ?auto_31982 ) ) ( not ( = ?auto_31968 ?auto_31982 ) ) ( IS-CRATE ?auto_31969 ) ( not ( = ?auto_31972 ?auto_31979 ) ) ( not ( = ?auto_31977 ?auto_31972 ) ) ( HOIST-AT ?auto_31978 ?auto_31972 ) ( not ( = ?auto_31975 ?auto_31978 ) ) ( not ( = ?auto_31971 ?auto_31978 ) ) ( SURFACE-AT ?auto_31969 ?auto_31972 ) ( ON ?auto_31969 ?auto_31974 ) ( CLEAR ?auto_31969 ) ( not ( = ?auto_31969 ?auto_31974 ) ) ( not ( = ?auto_31970 ?auto_31974 ) ) ( not ( = ?auto_31968 ?auto_31974 ) ) ( not ( = ?auto_31982 ?auto_31974 ) ) ( IS-CRATE ?auto_31968 ) ( not ( = ?auto_31967 ?auto_31968 ) ) ( not ( = ?auto_31969 ?auto_31967 ) ) ( not ( = ?auto_31970 ?auto_31967 ) ) ( not ( = ?auto_31982 ?auto_31967 ) ) ( not ( = ?auto_31974 ?auto_31967 ) ) ( SURFACE-AT ?auto_31968 ?auto_31972 ) ( ON ?auto_31968 ?auto_31976 ) ( CLEAR ?auto_31968 ) ( not ( = ?auto_31969 ?auto_31976 ) ) ( not ( = ?auto_31970 ?auto_31976 ) ) ( not ( = ?auto_31968 ?auto_31976 ) ) ( not ( = ?auto_31982 ?auto_31976 ) ) ( not ( = ?auto_31974 ?auto_31976 ) ) ( not ( = ?auto_31967 ?auto_31976 ) ) ( IS-CRATE ?auto_31967 ) ( not ( = ?auto_31966 ?auto_31967 ) ) ( not ( = ?auto_31969 ?auto_31966 ) ) ( not ( = ?auto_31970 ?auto_31966 ) ) ( not ( = ?auto_31968 ?auto_31966 ) ) ( not ( = ?auto_31982 ?auto_31966 ) ) ( not ( = ?auto_31974 ?auto_31966 ) ) ( not ( = ?auto_31976 ?auto_31966 ) ) ( AVAILABLE ?auto_31971 ) ( SURFACE-AT ?auto_31967 ?auto_31977 ) ( ON ?auto_31967 ?auto_31973 ) ( CLEAR ?auto_31967 ) ( not ( = ?auto_31969 ?auto_31973 ) ) ( not ( = ?auto_31970 ?auto_31973 ) ) ( not ( = ?auto_31968 ?auto_31973 ) ) ( not ( = ?auto_31982 ?auto_31973 ) ) ( not ( = ?auto_31974 ?auto_31973 ) ) ( not ( = ?auto_31967 ?auto_31973 ) ) ( not ( = ?auto_31976 ?auto_31973 ) ) ( not ( = ?auto_31966 ?auto_31973 ) ) ( SURFACE-AT ?auto_31965 ?auto_31979 ) ( CLEAR ?auto_31965 ) ( IS-CRATE ?auto_31966 ) ( not ( = ?auto_31965 ?auto_31966 ) ) ( not ( = ?auto_31969 ?auto_31965 ) ) ( not ( = ?auto_31970 ?auto_31965 ) ) ( not ( = ?auto_31968 ?auto_31965 ) ) ( not ( = ?auto_31982 ?auto_31965 ) ) ( not ( = ?auto_31974 ?auto_31965 ) ) ( not ( = ?auto_31967 ?auto_31965 ) ) ( not ( = ?auto_31976 ?auto_31965 ) ) ( not ( = ?auto_31973 ?auto_31965 ) ) ( AVAILABLE ?auto_31975 ) ( TRUCK-AT ?auto_31980 ?auto_31972 ) ( AVAILABLE ?auto_31978 ) ( SURFACE-AT ?auto_31966 ?auto_31972 ) ( ON ?auto_31966 ?auto_31981 ) ( CLEAR ?auto_31966 ) ( not ( = ?auto_31969 ?auto_31981 ) ) ( not ( = ?auto_31970 ?auto_31981 ) ) ( not ( = ?auto_31968 ?auto_31981 ) ) ( not ( = ?auto_31982 ?auto_31981 ) ) ( not ( = ?auto_31974 ?auto_31981 ) ) ( not ( = ?auto_31967 ?auto_31981 ) ) ( not ( = ?auto_31976 ?auto_31981 ) ) ( not ( = ?auto_31966 ?auto_31981 ) ) ( not ( = ?auto_31973 ?auto_31981 ) ) ( not ( = ?auto_31965 ?auto_31981 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31968 ?auto_31969 ?auto_31970 )
      ( MAKE-5CRATE-VERIFY ?auto_31965 ?auto_31966 ?auto_31967 ?auto_31968 ?auto_31969 ?auto_31970 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31983 - SURFACE
      ?auto_31984 - SURFACE
    )
    :vars
    (
      ?auto_31989 - HOIST
      ?auto_31996 - PLACE
      ?auto_31994 - SURFACE
      ?auto_31993 - PLACE
      ?auto_31985 - HOIST
      ?auto_32000 - SURFACE
      ?auto_31986 - PLACE
      ?auto_31995 - HOIST
      ?auto_31988 - SURFACE
      ?auto_31990 - SURFACE
      ?auto_31991 - SURFACE
      ?auto_31992 - SURFACE
      ?auto_31987 - SURFACE
      ?auto_31998 - SURFACE
      ?auto_31999 - SURFACE
      ?auto_31997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31989 ?auto_31996 ) ( IS-CRATE ?auto_31984 ) ( not ( = ?auto_31983 ?auto_31984 ) ) ( not ( = ?auto_31994 ?auto_31983 ) ) ( not ( = ?auto_31994 ?auto_31984 ) ) ( not ( = ?auto_31993 ?auto_31996 ) ) ( HOIST-AT ?auto_31985 ?auto_31993 ) ( not ( = ?auto_31989 ?auto_31985 ) ) ( SURFACE-AT ?auto_31984 ?auto_31993 ) ( ON ?auto_31984 ?auto_32000 ) ( CLEAR ?auto_31984 ) ( not ( = ?auto_31983 ?auto_32000 ) ) ( not ( = ?auto_31984 ?auto_32000 ) ) ( not ( = ?auto_31994 ?auto_32000 ) ) ( IS-CRATE ?auto_31983 ) ( not ( = ?auto_31986 ?auto_31996 ) ) ( not ( = ?auto_31993 ?auto_31986 ) ) ( HOIST-AT ?auto_31995 ?auto_31986 ) ( not ( = ?auto_31989 ?auto_31995 ) ) ( not ( = ?auto_31985 ?auto_31995 ) ) ( SURFACE-AT ?auto_31983 ?auto_31986 ) ( ON ?auto_31983 ?auto_31988 ) ( CLEAR ?auto_31983 ) ( not ( = ?auto_31983 ?auto_31988 ) ) ( not ( = ?auto_31984 ?auto_31988 ) ) ( not ( = ?auto_31994 ?auto_31988 ) ) ( not ( = ?auto_32000 ?auto_31988 ) ) ( IS-CRATE ?auto_31994 ) ( not ( = ?auto_31990 ?auto_31994 ) ) ( not ( = ?auto_31983 ?auto_31990 ) ) ( not ( = ?auto_31984 ?auto_31990 ) ) ( not ( = ?auto_32000 ?auto_31990 ) ) ( not ( = ?auto_31988 ?auto_31990 ) ) ( SURFACE-AT ?auto_31994 ?auto_31986 ) ( ON ?auto_31994 ?auto_31991 ) ( CLEAR ?auto_31994 ) ( not ( = ?auto_31983 ?auto_31991 ) ) ( not ( = ?auto_31984 ?auto_31991 ) ) ( not ( = ?auto_31994 ?auto_31991 ) ) ( not ( = ?auto_32000 ?auto_31991 ) ) ( not ( = ?auto_31988 ?auto_31991 ) ) ( not ( = ?auto_31990 ?auto_31991 ) ) ( IS-CRATE ?auto_31990 ) ( not ( = ?auto_31992 ?auto_31990 ) ) ( not ( = ?auto_31983 ?auto_31992 ) ) ( not ( = ?auto_31984 ?auto_31992 ) ) ( not ( = ?auto_31994 ?auto_31992 ) ) ( not ( = ?auto_32000 ?auto_31992 ) ) ( not ( = ?auto_31988 ?auto_31992 ) ) ( not ( = ?auto_31991 ?auto_31992 ) ) ( AVAILABLE ?auto_31985 ) ( SURFACE-AT ?auto_31990 ?auto_31993 ) ( ON ?auto_31990 ?auto_31987 ) ( CLEAR ?auto_31990 ) ( not ( = ?auto_31983 ?auto_31987 ) ) ( not ( = ?auto_31984 ?auto_31987 ) ) ( not ( = ?auto_31994 ?auto_31987 ) ) ( not ( = ?auto_32000 ?auto_31987 ) ) ( not ( = ?auto_31988 ?auto_31987 ) ) ( not ( = ?auto_31990 ?auto_31987 ) ) ( not ( = ?auto_31991 ?auto_31987 ) ) ( not ( = ?auto_31992 ?auto_31987 ) ) ( SURFACE-AT ?auto_31998 ?auto_31996 ) ( CLEAR ?auto_31998 ) ( IS-CRATE ?auto_31992 ) ( not ( = ?auto_31998 ?auto_31992 ) ) ( not ( = ?auto_31983 ?auto_31998 ) ) ( not ( = ?auto_31984 ?auto_31998 ) ) ( not ( = ?auto_31994 ?auto_31998 ) ) ( not ( = ?auto_32000 ?auto_31998 ) ) ( not ( = ?auto_31988 ?auto_31998 ) ) ( not ( = ?auto_31990 ?auto_31998 ) ) ( not ( = ?auto_31991 ?auto_31998 ) ) ( not ( = ?auto_31987 ?auto_31998 ) ) ( AVAILABLE ?auto_31989 ) ( AVAILABLE ?auto_31995 ) ( SURFACE-AT ?auto_31992 ?auto_31986 ) ( ON ?auto_31992 ?auto_31999 ) ( CLEAR ?auto_31992 ) ( not ( = ?auto_31983 ?auto_31999 ) ) ( not ( = ?auto_31984 ?auto_31999 ) ) ( not ( = ?auto_31994 ?auto_31999 ) ) ( not ( = ?auto_32000 ?auto_31999 ) ) ( not ( = ?auto_31988 ?auto_31999 ) ) ( not ( = ?auto_31990 ?auto_31999 ) ) ( not ( = ?auto_31991 ?auto_31999 ) ) ( not ( = ?auto_31992 ?auto_31999 ) ) ( not ( = ?auto_31987 ?auto_31999 ) ) ( not ( = ?auto_31998 ?auto_31999 ) ) ( TRUCK-AT ?auto_31997 ?auto_31996 ) )
    :subtasks
    ( ( !DRIVE ?auto_31997 ?auto_31996 ?auto_31986 )
      ( MAKE-2CRATE ?auto_31994 ?auto_31983 ?auto_31984 )
      ( MAKE-1CRATE-VERIFY ?auto_31983 ?auto_31984 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32001 - SURFACE
      ?auto_32002 - SURFACE
      ?auto_32003 - SURFACE
    )
    :vars
    (
      ?auto_32011 - HOIST
      ?auto_32018 - PLACE
      ?auto_32013 - PLACE
      ?auto_32016 - HOIST
      ?auto_32008 - SURFACE
      ?auto_32015 - PLACE
      ?auto_32010 - HOIST
      ?auto_32007 - SURFACE
      ?auto_32009 - SURFACE
      ?auto_32012 - SURFACE
      ?auto_32004 - SURFACE
      ?auto_32006 - SURFACE
      ?auto_32005 - SURFACE
      ?auto_32017 - SURFACE
      ?auto_32014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32011 ?auto_32018 ) ( IS-CRATE ?auto_32003 ) ( not ( = ?auto_32002 ?auto_32003 ) ) ( not ( = ?auto_32001 ?auto_32002 ) ) ( not ( = ?auto_32001 ?auto_32003 ) ) ( not ( = ?auto_32013 ?auto_32018 ) ) ( HOIST-AT ?auto_32016 ?auto_32013 ) ( not ( = ?auto_32011 ?auto_32016 ) ) ( SURFACE-AT ?auto_32003 ?auto_32013 ) ( ON ?auto_32003 ?auto_32008 ) ( CLEAR ?auto_32003 ) ( not ( = ?auto_32002 ?auto_32008 ) ) ( not ( = ?auto_32003 ?auto_32008 ) ) ( not ( = ?auto_32001 ?auto_32008 ) ) ( IS-CRATE ?auto_32002 ) ( not ( = ?auto_32015 ?auto_32018 ) ) ( not ( = ?auto_32013 ?auto_32015 ) ) ( HOIST-AT ?auto_32010 ?auto_32015 ) ( not ( = ?auto_32011 ?auto_32010 ) ) ( not ( = ?auto_32016 ?auto_32010 ) ) ( SURFACE-AT ?auto_32002 ?auto_32015 ) ( ON ?auto_32002 ?auto_32007 ) ( CLEAR ?auto_32002 ) ( not ( = ?auto_32002 ?auto_32007 ) ) ( not ( = ?auto_32003 ?auto_32007 ) ) ( not ( = ?auto_32001 ?auto_32007 ) ) ( not ( = ?auto_32008 ?auto_32007 ) ) ( IS-CRATE ?auto_32001 ) ( not ( = ?auto_32009 ?auto_32001 ) ) ( not ( = ?auto_32002 ?auto_32009 ) ) ( not ( = ?auto_32003 ?auto_32009 ) ) ( not ( = ?auto_32008 ?auto_32009 ) ) ( not ( = ?auto_32007 ?auto_32009 ) ) ( SURFACE-AT ?auto_32001 ?auto_32015 ) ( ON ?auto_32001 ?auto_32012 ) ( CLEAR ?auto_32001 ) ( not ( = ?auto_32002 ?auto_32012 ) ) ( not ( = ?auto_32003 ?auto_32012 ) ) ( not ( = ?auto_32001 ?auto_32012 ) ) ( not ( = ?auto_32008 ?auto_32012 ) ) ( not ( = ?auto_32007 ?auto_32012 ) ) ( not ( = ?auto_32009 ?auto_32012 ) ) ( IS-CRATE ?auto_32009 ) ( not ( = ?auto_32004 ?auto_32009 ) ) ( not ( = ?auto_32002 ?auto_32004 ) ) ( not ( = ?auto_32003 ?auto_32004 ) ) ( not ( = ?auto_32001 ?auto_32004 ) ) ( not ( = ?auto_32008 ?auto_32004 ) ) ( not ( = ?auto_32007 ?auto_32004 ) ) ( not ( = ?auto_32012 ?auto_32004 ) ) ( AVAILABLE ?auto_32016 ) ( SURFACE-AT ?auto_32009 ?auto_32013 ) ( ON ?auto_32009 ?auto_32006 ) ( CLEAR ?auto_32009 ) ( not ( = ?auto_32002 ?auto_32006 ) ) ( not ( = ?auto_32003 ?auto_32006 ) ) ( not ( = ?auto_32001 ?auto_32006 ) ) ( not ( = ?auto_32008 ?auto_32006 ) ) ( not ( = ?auto_32007 ?auto_32006 ) ) ( not ( = ?auto_32009 ?auto_32006 ) ) ( not ( = ?auto_32012 ?auto_32006 ) ) ( not ( = ?auto_32004 ?auto_32006 ) ) ( SURFACE-AT ?auto_32005 ?auto_32018 ) ( CLEAR ?auto_32005 ) ( IS-CRATE ?auto_32004 ) ( not ( = ?auto_32005 ?auto_32004 ) ) ( not ( = ?auto_32002 ?auto_32005 ) ) ( not ( = ?auto_32003 ?auto_32005 ) ) ( not ( = ?auto_32001 ?auto_32005 ) ) ( not ( = ?auto_32008 ?auto_32005 ) ) ( not ( = ?auto_32007 ?auto_32005 ) ) ( not ( = ?auto_32009 ?auto_32005 ) ) ( not ( = ?auto_32012 ?auto_32005 ) ) ( not ( = ?auto_32006 ?auto_32005 ) ) ( AVAILABLE ?auto_32011 ) ( AVAILABLE ?auto_32010 ) ( SURFACE-AT ?auto_32004 ?auto_32015 ) ( ON ?auto_32004 ?auto_32017 ) ( CLEAR ?auto_32004 ) ( not ( = ?auto_32002 ?auto_32017 ) ) ( not ( = ?auto_32003 ?auto_32017 ) ) ( not ( = ?auto_32001 ?auto_32017 ) ) ( not ( = ?auto_32008 ?auto_32017 ) ) ( not ( = ?auto_32007 ?auto_32017 ) ) ( not ( = ?auto_32009 ?auto_32017 ) ) ( not ( = ?auto_32012 ?auto_32017 ) ) ( not ( = ?auto_32004 ?auto_32017 ) ) ( not ( = ?auto_32006 ?auto_32017 ) ) ( not ( = ?auto_32005 ?auto_32017 ) ) ( TRUCK-AT ?auto_32014 ?auto_32018 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32002 ?auto_32003 )
      ( MAKE-2CRATE-VERIFY ?auto_32001 ?auto_32002 ?auto_32003 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32019 - SURFACE
      ?auto_32020 - SURFACE
      ?auto_32021 - SURFACE
      ?auto_32022 - SURFACE
    )
    :vars
    (
      ?auto_32027 - HOIST
      ?auto_32032 - PLACE
      ?auto_32023 - PLACE
      ?auto_32024 - HOIST
      ?auto_32031 - SURFACE
      ?auto_32028 - PLACE
      ?auto_32029 - HOIST
      ?auto_32036 - SURFACE
      ?auto_32035 - SURFACE
      ?auto_32034 - SURFACE
      ?auto_32025 - SURFACE
      ?auto_32033 - SURFACE
      ?auto_32026 - SURFACE
      ?auto_32030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32027 ?auto_32032 ) ( IS-CRATE ?auto_32022 ) ( not ( = ?auto_32021 ?auto_32022 ) ) ( not ( = ?auto_32020 ?auto_32021 ) ) ( not ( = ?auto_32020 ?auto_32022 ) ) ( not ( = ?auto_32023 ?auto_32032 ) ) ( HOIST-AT ?auto_32024 ?auto_32023 ) ( not ( = ?auto_32027 ?auto_32024 ) ) ( SURFACE-AT ?auto_32022 ?auto_32023 ) ( ON ?auto_32022 ?auto_32031 ) ( CLEAR ?auto_32022 ) ( not ( = ?auto_32021 ?auto_32031 ) ) ( not ( = ?auto_32022 ?auto_32031 ) ) ( not ( = ?auto_32020 ?auto_32031 ) ) ( IS-CRATE ?auto_32021 ) ( not ( = ?auto_32028 ?auto_32032 ) ) ( not ( = ?auto_32023 ?auto_32028 ) ) ( HOIST-AT ?auto_32029 ?auto_32028 ) ( not ( = ?auto_32027 ?auto_32029 ) ) ( not ( = ?auto_32024 ?auto_32029 ) ) ( SURFACE-AT ?auto_32021 ?auto_32028 ) ( ON ?auto_32021 ?auto_32036 ) ( CLEAR ?auto_32021 ) ( not ( = ?auto_32021 ?auto_32036 ) ) ( not ( = ?auto_32022 ?auto_32036 ) ) ( not ( = ?auto_32020 ?auto_32036 ) ) ( not ( = ?auto_32031 ?auto_32036 ) ) ( IS-CRATE ?auto_32020 ) ( not ( = ?auto_32019 ?auto_32020 ) ) ( not ( = ?auto_32021 ?auto_32019 ) ) ( not ( = ?auto_32022 ?auto_32019 ) ) ( not ( = ?auto_32031 ?auto_32019 ) ) ( not ( = ?auto_32036 ?auto_32019 ) ) ( SURFACE-AT ?auto_32020 ?auto_32028 ) ( ON ?auto_32020 ?auto_32035 ) ( CLEAR ?auto_32020 ) ( not ( = ?auto_32021 ?auto_32035 ) ) ( not ( = ?auto_32022 ?auto_32035 ) ) ( not ( = ?auto_32020 ?auto_32035 ) ) ( not ( = ?auto_32031 ?auto_32035 ) ) ( not ( = ?auto_32036 ?auto_32035 ) ) ( not ( = ?auto_32019 ?auto_32035 ) ) ( IS-CRATE ?auto_32019 ) ( not ( = ?auto_32034 ?auto_32019 ) ) ( not ( = ?auto_32021 ?auto_32034 ) ) ( not ( = ?auto_32022 ?auto_32034 ) ) ( not ( = ?auto_32020 ?auto_32034 ) ) ( not ( = ?auto_32031 ?auto_32034 ) ) ( not ( = ?auto_32036 ?auto_32034 ) ) ( not ( = ?auto_32035 ?auto_32034 ) ) ( AVAILABLE ?auto_32024 ) ( SURFACE-AT ?auto_32019 ?auto_32023 ) ( ON ?auto_32019 ?auto_32025 ) ( CLEAR ?auto_32019 ) ( not ( = ?auto_32021 ?auto_32025 ) ) ( not ( = ?auto_32022 ?auto_32025 ) ) ( not ( = ?auto_32020 ?auto_32025 ) ) ( not ( = ?auto_32031 ?auto_32025 ) ) ( not ( = ?auto_32036 ?auto_32025 ) ) ( not ( = ?auto_32019 ?auto_32025 ) ) ( not ( = ?auto_32035 ?auto_32025 ) ) ( not ( = ?auto_32034 ?auto_32025 ) ) ( SURFACE-AT ?auto_32033 ?auto_32032 ) ( CLEAR ?auto_32033 ) ( IS-CRATE ?auto_32034 ) ( not ( = ?auto_32033 ?auto_32034 ) ) ( not ( = ?auto_32021 ?auto_32033 ) ) ( not ( = ?auto_32022 ?auto_32033 ) ) ( not ( = ?auto_32020 ?auto_32033 ) ) ( not ( = ?auto_32031 ?auto_32033 ) ) ( not ( = ?auto_32036 ?auto_32033 ) ) ( not ( = ?auto_32019 ?auto_32033 ) ) ( not ( = ?auto_32035 ?auto_32033 ) ) ( not ( = ?auto_32025 ?auto_32033 ) ) ( AVAILABLE ?auto_32027 ) ( AVAILABLE ?auto_32029 ) ( SURFACE-AT ?auto_32034 ?auto_32028 ) ( ON ?auto_32034 ?auto_32026 ) ( CLEAR ?auto_32034 ) ( not ( = ?auto_32021 ?auto_32026 ) ) ( not ( = ?auto_32022 ?auto_32026 ) ) ( not ( = ?auto_32020 ?auto_32026 ) ) ( not ( = ?auto_32031 ?auto_32026 ) ) ( not ( = ?auto_32036 ?auto_32026 ) ) ( not ( = ?auto_32019 ?auto_32026 ) ) ( not ( = ?auto_32035 ?auto_32026 ) ) ( not ( = ?auto_32034 ?auto_32026 ) ) ( not ( = ?auto_32025 ?auto_32026 ) ) ( not ( = ?auto_32033 ?auto_32026 ) ) ( TRUCK-AT ?auto_32030 ?auto_32032 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32020 ?auto_32021 ?auto_32022 )
      ( MAKE-3CRATE-VERIFY ?auto_32019 ?auto_32020 ?auto_32021 ?auto_32022 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32037 - SURFACE
      ?auto_32038 - SURFACE
      ?auto_32039 - SURFACE
      ?auto_32040 - SURFACE
      ?auto_32041 - SURFACE
    )
    :vars
    (
      ?auto_32046 - HOIST
      ?auto_32051 - PLACE
      ?auto_32042 - PLACE
      ?auto_32043 - HOIST
      ?auto_32050 - SURFACE
      ?auto_32047 - PLACE
      ?auto_32048 - HOIST
      ?auto_32054 - SURFACE
      ?auto_32053 - SURFACE
      ?auto_32044 - SURFACE
      ?auto_32052 - SURFACE
      ?auto_32045 - SURFACE
      ?auto_32049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32046 ?auto_32051 ) ( IS-CRATE ?auto_32041 ) ( not ( = ?auto_32040 ?auto_32041 ) ) ( not ( = ?auto_32039 ?auto_32040 ) ) ( not ( = ?auto_32039 ?auto_32041 ) ) ( not ( = ?auto_32042 ?auto_32051 ) ) ( HOIST-AT ?auto_32043 ?auto_32042 ) ( not ( = ?auto_32046 ?auto_32043 ) ) ( SURFACE-AT ?auto_32041 ?auto_32042 ) ( ON ?auto_32041 ?auto_32050 ) ( CLEAR ?auto_32041 ) ( not ( = ?auto_32040 ?auto_32050 ) ) ( not ( = ?auto_32041 ?auto_32050 ) ) ( not ( = ?auto_32039 ?auto_32050 ) ) ( IS-CRATE ?auto_32040 ) ( not ( = ?auto_32047 ?auto_32051 ) ) ( not ( = ?auto_32042 ?auto_32047 ) ) ( HOIST-AT ?auto_32048 ?auto_32047 ) ( not ( = ?auto_32046 ?auto_32048 ) ) ( not ( = ?auto_32043 ?auto_32048 ) ) ( SURFACE-AT ?auto_32040 ?auto_32047 ) ( ON ?auto_32040 ?auto_32054 ) ( CLEAR ?auto_32040 ) ( not ( = ?auto_32040 ?auto_32054 ) ) ( not ( = ?auto_32041 ?auto_32054 ) ) ( not ( = ?auto_32039 ?auto_32054 ) ) ( not ( = ?auto_32050 ?auto_32054 ) ) ( IS-CRATE ?auto_32039 ) ( not ( = ?auto_32038 ?auto_32039 ) ) ( not ( = ?auto_32040 ?auto_32038 ) ) ( not ( = ?auto_32041 ?auto_32038 ) ) ( not ( = ?auto_32050 ?auto_32038 ) ) ( not ( = ?auto_32054 ?auto_32038 ) ) ( SURFACE-AT ?auto_32039 ?auto_32047 ) ( ON ?auto_32039 ?auto_32053 ) ( CLEAR ?auto_32039 ) ( not ( = ?auto_32040 ?auto_32053 ) ) ( not ( = ?auto_32041 ?auto_32053 ) ) ( not ( = ?auto_32039 ?auto_32053 ) ) ( not ( = ?auto_32050 ?auto_32053 ) ) ( not ( = ?auto_32054 ?auto_32053 ) ) ( not ( = ?auto_32038 ?auto_32053 ) ) ( IS-CRATE ?auto_32038 ) ( not ( = ?auto_32037 ?auto_32038 ) ) ( not ( = ?auto_32040 ?auto_32037 ) ) ( not ( = ?auto_32041 ?auto_32037 ) ) ( not ( = ?auto_32039 ?auto_32037 ) ) ( not ( = ?auto_32050 ?auto_32037 ) ) ( not ( = ?auto_32054 ?auto_32037 ) ) ( not ( = ?auto_32053 ?auto_32037 ) ) ( AVAILABLE ?auto_32043 ) ( SURFACE-AT ?auto_32038 ?auto_32042 ) ( ON ?auto_32038 ?auto_32044 ) ( CLEAR ?auto_32038 ) ( not ( = ?auto_32040 ?auto_32044 ) ) ( not ( = ?auto_32041 ?auto_32044 ) ) ( not ( = ?auto_32039 ?auto_32044 ) ) ( not ( = ?auto_32050 ?auto_32044 ) ) ( not ( = ?auto_32054 ?auto_32044 ) ) ( not ( = ?auto_32038 ?auto_32044 ) ) ( not ( = ?auto_32053 ?auto_32044 ) ) ( not ( = ?auto_32037 ?auto_32044 ) ) ( SURFACE-AT ?auto_32052 ?auto_32051 ) ( CLEAR ?auto_32052 ) ( IS-CRATE ?auto_32037 ) ( not ( = ?auto_32052 ?auto_32037 ) ) ( not ( = ?auto_32040 ?auto_32052 ) ) ( not ( = ?auto_32041 ?auto_32052 ) ) ( not ( = ?auto_32039 ?auto_32052 ) ) ( not ( = ?auto_32050 ?auto_32052 ) ) ( not ( = ?auto_32054 ?auto_32052 ) ) ( not ( = ?auto_32038 ?auto_32052 ) ) ( not ( = ?auto_32053 ?auto_32052 ) ) ( not ( = ?auto_32044 ?auto_32052 ) ) ( AVAILABLE ?auto_32046 ) ( AVAILABLE ?auto_32048 ) ( SURFACE-AT ?auto_32037 ?auto_32047 ) ( ON ?auto_32037 ?auto_32045 ) ( CLEAR ?auto_32037 ) ( not ( = ?auto_32040 ?auto_32045 ) ) ( not ( = ?auto_32041 ?auto_32045 ) ) ( not ( = ?auto_32039 ?auto_32045 ) ) ( not ( = ?auto_32050 ?auto_32045 ) ) ( not ( = ?auto_32054 ?auto_32045 ) ) ( not ( = ?auto_32038 ?auto_32045 ) ) ( not ( = ?auto_32053 ?auto_32045 ) ) ( not ( = ?auto_32037 ?auto_32045 ) ) ( not ( = ?auto_32044 ?auto_32045 ) ) ( not ( = ?auto_32052 ?auto_32045 ) ) ( TRUCK-AT ?auto_32049 ?auto_32051 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32039 ?auto_32040 ?auto_32041 )
      ( MAKE-4CRATE-VERIFY ?auto_32037 ?auto_32038 ?auto_32039 ?auto_32040 ?auto_32041 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_32055 - SURFACE
      ?auto_32056 - SURFACE
      ?auto_32057 - SURFACE
      ?auto_32058 - SURFACE
      ?auto_32059 - SURFACE
      ?auto_32060 - SURFACE
    )
    :vars
    (
      ?auto_32065 - HOIST
      ?auto_32070 - PLACE
      ?auto_32061 - PLACE
      ?auto_32062 - HOIST
      ?auto_32069 - SURFACE
      ?auto_32066 - PLACE
      ?auto_32067 - HOIST
      ?auto_32072 - SURFACE
      ?auto_32071 - SURFACE
      ?auto_32063 - SURFACE
      ?auto_32064 - SURFACE
      ?auto_32068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32065 ?auto_32070 ) ( IS-CRATE ?auto_32060 ) ( not ( = ?auto_32059 ?auto_32060 ) ) ( not ( = ?auto_32058 ?auto_32059 ) ) ( not ( = ?auto_32058 ?auto_32060 ) ) ( not ( = ?auto_32061 ?auto_32070 ) ) ( HOIST-AT ?auto_32062 ?auto_32061 ) ( not ( = ?auto_32065 ?auto_32062 ) ) ( SURFACE-AT ?auto_32060 ?auto_32061 ) ( ON ?auto_32060 ?auto_32069 ) ( CLEAR ?auto_32060 ) ( not ( = ?auto_32059 ?auto_32069 ) ) ( not ( = ?auto_32060 ?auto_32069 ) ) ( not ( = ?auto_32058 ?auto_32069 ) ) ( IS-CRATE ?auto_32059 ) ( not ( = ?auto_32066 ?auto_32070 ) ) ( not ( = ?auto_32061 ?auto_32066 ) ) ( HOIST-AT ?auto_32067 ?auto_32066 ) ( not ( = ?auto_32065 ?auto_32067 ) ) ( not ( = ?auto_32062 ?auto_32067 ) ) ( SURFACE-AT ?auto_32059 ?auto_32066 ) ( ON ?auto_32059 ?auto_32072 ) ( CLEAR ?auto_32059 ) ( not ( = ?auto_32059 ?auto_32072 ) ) ( not ( = ?auto_32060 ?auto_32072 ) ) ( not ( = ?auto_32058 ?auto_32072 ) ) ( not ( = ?auto_32069 ?auto_32072 ) ) ( IS-CRATE ?auto_32058 ) ( not ( = ?auto_32057 ?auto_32058 ) ) ( not ( = ?auto_32059 ?auto_32057 ) ) ( not ( = ?auto_32060 ?auto_32057 ) ) ( not ( = ?auto_32069 ?auto_32057 ) ) ( not ( = ?auto_32072 ?auto_32057 ) ) ( SURFACE-AT ?auto_32058 ?auto_32066 ) ( ON ?auto_32058 ?auto_32071 ) ( CLEAR ?auto_32058 ) ( not ( = ?auto_32059 ?auto_32071 ) ) ( not ( = ?auto_32060 ?auto_32071 ) ) ( not ( = ?auto_32058 ?auto_32071 ) ) ( not ( = ?auto_32069 ?auto_32071 ) ) ( not ( = ?auto_32072 ?auto_32071 ) ) ( not ( = ?auto_32057 ?auto_32071 ) ) ( IS-CRATE ?auto_32057 ) ( not ( = ?auto_32056 ?auto_32057 ) ) ( not ( = ?auto_32059 ?auto_32056 ) ) ( not ( = ?auto_32060 ?auto_32056 ) ) ( not ( = ?auto_32058 ?auto_32056 ) ) ( not ( = ?auto_32069 ?auto_32056 ) ) ( not ( = ?auto_32072 ?auto_32056 ) ) ( not ( = ?auto_32071 ?auto_32056 ) ) ( AVAILABLE ?auto_32062 ) ( SURFACE-AT ?auto_32057 ?auto_32061 ) ( ON ?auto_32057 ?auto_32063 ) ( CLEAR ?auto_32057 ) ( not ( = ?auto_32059 ?auto_32063 ) ) ( not ( = ?auto_32060 ?auto_32063 ) ) ( not ( = ?auto_32058 ?auto_32063 ) ) ( not ( = ?auto_32069 ?auto_32063 ) ) ( not ( = ?auto_32072 ?auto_32063 ) ) ( not ( = ?auto_32057 ?auto_32063 ) ) ( not ( = ?auto_32071 ?auto_32063 ) ) ( not ( = ?auto_32056 ?auto_32063 ) ) ( SURFACE-AT ?auto_32055 ?auto_32070 ) ( CLEAR ?auto_32055 ) ( IS-CRATE ?auto_32056 ) ( not ( = ?auto_32055 ?auto_32056 ) ) ( not ( = ?auto_32059 ?auto_32055 ) ) ( not ( = ?auto_32060 ?auto_32055 ) ) ( not ( = ?auto_32058 ?auto_32055 ) ) ( not ( = ?auto_32069 ?auto_32055 ) ) ( not ( = ?auto_32072 ?auto_32055 ) ) ( not ( = ?auto_32057 ?auto_32055 ) ) ( not ( = ?auto_32071 ?auto_32055 ) ) ( not ( = ?auto_32063 ?auto_32055 ) ) ( AVAILABLE ?auto_32065 ) ( AVAILABLE ?auto_32067 ) ( SURFACE-AT ?auto_32056 ?auto_32066 ) ( ON ?auto_32056 ?auto_32064 ) ( CLEAR ?auto_32056 ) ( not ( = ?auto_32059 ?auto_32064 ) ) ( not ( = ?auto_32060 ?auto_32064 ) ) ( not ( = ?auto_32058 ?auto_32064 ) ) ( not ( = ?auto_32069 ?auto_32064 ) ) ( not ( = ?auto_32072 ?auto_32064 ) ) ( not ( = ?auto_32057 ?auto_32064 ) ) ( not ( = ?auto_32071 ?auto_32064 ) ) ( not ( = ?auto_32056 ?auto_32064 ) ) ( not ( = ?auto_32063 ?auto_32064 ) ) ( not ( = ?auto_32055 ?auto_32064 ) ) ( TRUCK-AT ?auto_32068 ?auto_32070 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32058 ?auto_32059 ?auto_32060 )
      ( MAKE-5CRATE-VERIFY ?auto_32055 ?auto_32056 ?auto_32057 ?auto_32058 ?auto_32059 ?auto_32060 ) )
  )

)

